---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-2.879994, -1.637134, -3.60357, 1, 0, 0, 1,
-2.787829, 0.2317177, -0.2803283, 1, 0.007843138, 0, 1,
-2.660062, 0.2340267, -1.517309, 1, 0.01176471, 0, 1,
-2.616399, 0.5114824, -0.2055823, 1, 0.01960784, 0, 1,
-2.5621, -0.3819132, -2.474054, 1, 0.02352941, 0, 1,
-2.519988, -2.171022, -3.00852, 1, 0.03137255, 0, 1,
-2.453653, 1.446966, 1.17693, 1, 0.03529412, 0, 1,
-2.435163, 1.353652, 0.1959093, 1, 0.04313726, 0, 1,
-2.433869, 1.003321, -2.218985, 1, 0.04705882, 0, 1,
-2.425615, -1.085351, -4.044432, 1, 0.05490196, 0, 1,
-2.321924, -0.5187936, -1.989104, 1, 0.05882353, 0, 1,
-2.278676, 1.677383, -0.7624661, 1, 0.06666667, 0, 1,
-2.114342, -1.385833, -1.428923, 1, 0.07058824, 0, 1,
-2.101279, -1.53869, -0.707616, 1, 0.07843138, 0, 1,
-2.075666, -1.419329, -4.796575, 1, 0.08235294, 0, 1,
-2.062917, -1.186779, -3.066843, 1, 0.09019608, 0, 1,
-2.060772, 0.5053567, -1.460746, 1, 0.09411765, 0, 1,
-2.046711, -1.696959, -2.621974, 1, 0.1019608, 0, 1,
-2.043517, -0.466215, -2.870546, 1, 0.1098039, 0, 1,
-2.040047, 1.692835, -0.7960671, 1, 0.1137255, 0, 1,
-2.025469, -0.8261383, -2.065004, 1, 0.1215686, 0, 1,
-1.946694, -0.7836366, -2.757837, 1, 0.1254902, 0, 1,
-1.942128, 1.068808, -0.2402906, 1, 0.1333333, 0, 1,
-1.907501, -1.18764, -2.612452, 1, 0.1372549, 0, 1,
-1.903938, 1.213387, -1.503488, 1, 0.145098, 0, 1,
-1.87005, -0.7158456, -1.603438, 1, 0.1490196, 0, 1,
-1.861376, -2.093851, -3.249855, 1, 0.1568628, 0, 1,
-1.845008, 0.9220176, -0.2548283, 1, 0.1607843, 0, 1,
-1.844583, -1.741264, -2.182701, 1, 0.1686275, 0, 1,
-1.838817, -0.1031, -2.03142, 1, 0.172549, 0, 1,
-1.769632, -0.8226178, -2.729004, 1, 0.1803922, 0, 1,
-1.765257, -0.559369, -2.785763, 1, 0.1843137, 0, 1,
-1.732789, 1.425578, -1.586045, 1, 0.1921569, 0, 1,
-1.705079, -0.05333729, -3.569657, 1, 0.1960784, 0, 1,
-1.68547, -0.2492837, -0.8812514, 1, 0.2039216, 0, 1,
-1.662504, -0.06952082, -0.2512136, 1, 0.2117647, 0, 1,
-1.658444, -0.3969587, -2.370119, 1, 0.2156863, 0, 1,
-1.651405, -1.572012, -2.908355, 1, 0.2235294, 0, 1,
-1.643333, 0.2702904, -2.384078, 1, 0.227451, 0, 1,
-1.625548, 1.084577, -0.6665021, 1, 0.2352941, 0, 1,
-1.60382, 0.5308256, -0.6696082, 1, 0.2392157, 0, 1,
-1.591077, 0.7476217, 0.1980126, 1, 0.2470588, 0, 1,
-1.586496, -0.6937868, -1.449629, 1, 0.2509804, 0, 1,
-1.581995, -0.2184067, -1.987237, 1, 0.2588235, 0, 1,
-1.574153, -0.4674961, -2.814438, 1, 0.2627451, 0, 1,
-1.563174, -2.100887, -3.082367, 1, 0.2705882, 0, 1,
-1.552402, 0.6984439, -1.301711, 1, 0.2745098, 0, 1,
-1.545466, -0.08076041, -3.353356, 1, 0.282353, 0, 1,
-1.540356, -0.5220406, -1.292995, 1, 0.2862745, 0, 1,
-1.539279, -0.1450553, -0.9686958, 1, 0.2941177, 0, 1,
-1.538361, 1.508443, -0.9112971, 1, 0.3019608, 0, 1,
-1.489394, -0.0884303, -2.266515, 1, 0.3058824, 0, 1,
-1.486758, 1.37475, 0.5892128, 1, 0.3137255, 0, 1,
-1.486096, -2.164239, -3.73346, 1, 0.3176471, 0, 1,
-1.474652, 0.07914854, -2.935347, 1, 0.3254902, 0, 1,
-1.468667, 1.695325, -2.358335, 1, 0.3294118, 0, 1,
-1.460173, 0.2175504, -2.219818, 1, 0.3372549, 0, 1,
-1.447137, 0.3855647, -0.5314108, 1, 0.3411765, 0, 1,
-1.440426, 0.2498648, -1.334908, 1, 0.3490196, 0, 1,
-1.43273, -0.6205001, -2.807398, 1, 0.3529412, 0, 1,
-1.429743, 0.642999, -0.5656655, 1, 0.3607843, 0, 1,
-1.423644, 0.08123834, -2.832192, 1, 0.3647059, 0, 1,
-1.4186, 0.120447, -0.553629, 1, 0.372549, 0, 1,
-1.418037, 2.963337, -1.152405, 1, 0.3764706, 0, 1,
-1.402928, -1.125005, -2.095276, 1, 0.3843137, 0, 1,
-1.400533, -0.8776743, -1.989067, 1, 0.3882353, 0, 1,
-1.398686, 2.077185, 0.737166, 1, 0.3960784, 0, 1,
-1.395667, 2.015642, -1.167782, 1, 0.4039216, 0, 1,
-1.368741, -0.6402677, -1.51666, 1, 0.4078431, 0, 1,
-1.367363, 1.559714, 0.03636081, 1, 0.4156863, 0, 1,
-1.363926, -1.169013, -2.284056, 1, 0.4196078, 0, 1,
-1.36338, 1.354625, -1.102848, 1, 0.427451, 0, 1,
-1.351193, 0.07771051, -0.279692, 1, 0.4313726, 0, 1,
-1.349323, 0.2231612, -1.845969, 1, 0.4392157, 0, 1,
-1.346112, 0.4598404, -0.05571854, 1, 0.4431373, 0, 1,
-1.342852, 0.05021285, -2.176594, 1, 0.4509804, 0, 1,
-1.315967, 0.5062246, -0.3989603, 1, 0.454902, 0, 1,
-1.315948, 0.1360745, -2.46335, 1, 0.4627451, 0, 1,
-1.315055, 0.2760081, -2.004154, 1, 0.4666667, 0, 1,
-1.313387, -0.3802298, -1.914683, 1, 0.4745098, 0, 1,
-1.301222, 0.4608637, -1.149021, 1, 0.4784314, 0, 1,
-1.300283, 1.144675, -2.2521, 1, 0.4862745, 0, 1,
-1.29839, 0.9585853, 0.2181275, 1, 0.4901961, 0, 1,
-1.292737, 0.3554627, -2.79661, 1, 0.4980392, 0, 1,
-1.29173, -1.421261, -1.131685, 1, 0.5058824, 0, 1,
-1.291431, 0.886202, 0.2600115, 1, 0.509804, 0, 1,
-1.274095, 0.7851153, -0.7769865, 1, 0.5176471, 0, 1,
-1.273181, -0.7644662, -2.329004, 1, 0.5215687, 0, 1,
-1.267321, -0.2327711, -1.65575, 1, 0.5294118, 0, 1,
-1.267115, -1.321336, -2.58121, 1, 0.5333334, 0, 1,
-1.252356, 0.8584681, -1.163677, 1, 0.5411765, 0, 1,
-1.247567, -0.3218303, 0.4468388, 1, 0.5450981, 0, 1,
-1.245931, 0.6233529, -0.8834888, 1, 0.5529412, 0, 1,
-1.238688, 0.5754312, -1.595122, 1, 0.5568628, 0, 1,
-1.234636, 1.802006, -0.8097841, 1, 0.5647059, 0, 1,
-1.221967, -0.9960383, -2.245515, 1, 0.5686275, 0, 1,
-1.22171, 0.7404052, -1.629434, 1, 0.5764706, 0, 1,
-1.220279, 0.381999, -3.085707, 1, 0.5803922, 0, 1,
-1.21516, 1.042541, 0.6963186, 1, 0.5882353, 0, 1,
-1.210957, 0.6545476, -1.758812, 1, 0.5921569, 0, 1,
-1.205621, -0.07231462, -1.01512, 1, 0.6, 0, 1,
-1.202113, -0.8482721, -2.863578, 1, 0.6078432, 0, 1,
-1.19982, -0.6547235, -1.787915, 1, 0.6117647, 0, 1,
-1.187099, -0.700582, -1.869068, 1, 0.6196079, 0, 1,
-1.173818, 1.244581, -0.8237681, 1, 0.6235294, 0, 1,
-1.165244, -1.217267, -1.993924, 1, 0.6313726, 0, 1,
-1.159622, -1.160076, -2.878394, 1, 0.6352941, 0, 1,
-1.152707, 0.7067658, -0.7548935, 1, 0.6431373, 0, 1,
-1.147275, -1.102349, -0.8182675, 1, 0.6470588, 0, 1,
-1.14539, 0.8412054, -0.7427056, 1, 0.654902, 0, 1,
-1.140029, -0.6154363, -3.058068, 1, 0.6588235, 0, 1,
-1.134829, -1.896714, -2.477485, 1, 0.6666667, 0, 1,
-1.133725, -0.2873051, -1.508416, 1, 0.6705883, 0, 1,
-1.131055, -2.288658, -3.449147, 1, 0.6784314, 0, 1,
-1.123464, -0.7176198, -1.324563, 1, 0.682353, 0, 1,
-1.116984, -0.4364461, -1.267607, 1, 0.6901961, 0, 1,
-1.108429, 0.7383631, 0.5167297, 1, 0.6941177, 0, 1,
-1.10719, 0.4656389, -1.187415, 1, 0.7019608, 0, 1,
-1.106662, -0.2605692, -2.009963, 1, 0.7098039, 0, 1,
-1.105314, 0.7348751, -3.205301, 1, 0.7137255, 0, 1,
-1.098922, 0.7202304, -0.6638901, 1, 0.7215686, 0, 1,
-1.096494, 2.083533, 0.01169379, 1, 0.7254902, 0, 1,
-1.087599, 0.1521774, -0.4959698, 1, 0.7333333, 0, 1,
-1.082479, -1.409429, -2.063397, 1, 0.7372549, 0, 1,
-1.080713, -0.476102, -0.1971911, 1, 0.7450981, 0, 1,
-1.074386, -0.02712672, -0.8778375, 1, 0.7490196, 0, 1,
-1.068155, 0.9772144, -2.610404, 1, 0.7568628, 0, 1,
-1.067248, -0.5794239, -1.913165, 1, 0.7607843, 0, 1,
-1.06578, 0.1576813, -1.81458, 1, 0.7686275, 0, 1,
-1.065772, 1.493459, 0.3724795, 1, 0.772549, 0, 1,
-1.062863, -0.1747874, -1.447009, 1, 0.7803922, 0, 1,
-1.062549, 1.747144, -1.181758, 1, 0.7843137, 0, 1,
-1.061901, 0.6597208, -1.506027, 1, 0.7921569, 0, 1,
-1.053353, 0.535686, -1.685914, 1, 0.7960784, 0, 1,
-1.050029, -0.2894595, -2.829427, 1, 0.8039216, 0, 1,
-1.039519, -1.290769, -1.678151, 1, 0.8117647, 0, 1,
-1.035823, -0.5234272, -0.3260244, 1, 0.8156863, 0, 1,
-1.018917, 0.1127292, -0.0453888, 1, 0.8235294, 0, 1,
-1.016633, -1.19273, -1.339314, 1, 0.827451, 0, 1,
-1.015361, -0.7042152, -1.978124, 1, 0.8352941, 0, 1,
-1.006764, -0.310524, -0.6541843, 1, 0.8392157, 0, 1,
-1.006074, 0.647452, -0.3846141, 1, 0.8470588, 0, 1,
-1.003846, 0.9722669, -0.9309453, 1, 0.8509804, 0, 1,
-1.003355, -0.3321655, -0.7701722, 1, 0.8588235, 0, 1,
-0.9977217, -0.9943103, -0.08087784, 1, 0.8627451, 0, 1,
-0.9921684, 0.371163, -0.9682018, 1, 0.8705882, 0, 1,
-0.9844745, 1.413352, 0.02125184, 1, 0.8745098, 0, 1,
-0.9809226, 0.51125, -0.5232825, 1, 0.8823529, 0, 1,
-0.9807795, 0.1659924, -0.1380209, 1, 0.8862745, 0, 1,
-0.9804098, 0.2276784, -0.7392921, 1, 0.8941177, 0, 1,
-0.9794716, -0.9016535, -3.582609, 1, 0.8980392, 0, 1,
-0.9719662, -0.6647668, -3.88902, 1, 0.9058824, 0, 1,
-0.960892, -0.7940189, -2.741419, 1, 0.9137255, 0, 1,
-0.9577229, 0.0483933, -1.600931, 1, 0.9176471, 0, 1,
-0.9566355, -1.480785, -3.085139, 1, 0.9254902, 0, 1,
-0.9538566, 0.02451193, -1.567838, 1, 0.9294118, 0, 1,
-0.9524865, -0.529866, -2.341268, 1, 0.9372549, 0, 1,
-0.952359, -1.253431, -1.933561, 1, 0.9411765, 0, 1,
-0.949711, 0.1156652, -1.240469, 1, 0.9490196, 0, 1,
-0.9480817, 0.9969475, 0.4557348, 1, 0.9529412, 0, 1,
-0.9403853, -0.7148257, -2.380275, 1, 0.9607843, 0, 1,
-0.9390749, 1.850743, 0.1678697, 1, 0.9647059, 0, 1,
-0.93463, -0.9899317, -3.235377, 1, 0.972549, 0, 1,
-0.9342835, -1.227239, 0.04344841, 1, 0.9764706, 0, 1,
-0.9099239, -0.9733772, -4.07647, 1, 0.9843137, 0, 1,
-0.9086075, 0.6788398, -1.536686, 1, 0.9882353, 0, 1,
-0.9073913, -0.7166665, -2.214599, 1, 0.9960784, 0, 1,
-0.9056673, -0.2199359, -1.346904, 0.9960784, 1, 0, 1,
-0.9054861, -0.5314115, -1.795728, 0.9921569, 1, 0, 1,
-0.8908119, -1.096023, -1.921197, 0.9843137, 1, 0, 1,
-0.8897551, 0.9073416, -0.7279753, 0.9803922, 1, 0, 1,
-0.8885308, -0.7496173, -1.10983, 0.972549, 1, 0, 1,
-0.8855603, -0.6998345, -2.476901, 0.9686275, 1, 0, 1,
-0.8851992, -0.2657017, -1.408604, 0.9607843, 1, 0, 1,
-0.8803223, -0.05096345, -1.745329, 0.9568627, 1, 0, 1,
-0.8767337, -0.237987, -3.656874, 0.9490196, 1, 0, 1,
-0.8761067, 1.070477, 0.5773072, 0.945098, 1, 0, 1,
-0.8742435, 0.4012886, -3.913577, 0.9372549, 1, 0, 1,
-0.8735402, 0.7481437, -0.4816474, 0.9333333, 1, 0, 1,
-0.8618713, 1.328284, -0.3770064, 0.9254902, 1, 0, 1,
-0.8541373, -0.128723, -2.263414, 0.9215686, 1, 0, 1,
-0.8530872, -0.8421963, -3.297789, 0.9137255, 1, 0, 1,
-0.8528329, 0.5605156, -2.015743, 0.9098039, 1, 0, 1,
-0.8525385, -0.6339037, -2.128189, 0.9019608, 1, 0, 1,
-0.8507349, -0.1968343, -1.668458, 0.8941177, 1, 0, 1,
-0.8458669, 0.02622183, -0.324587, 0.8901961, 1, 0, 1,
-0.8442775, 1.664872, -0.3623541, 0.8823529, 1, 0, 1,
-0.8268245, -0.9341738, -0.7992752, 0.8784314, 1, 0, 1,
-0.8251767, 1.099246, -1.953775, 0.8705882, 1, 0, 1,
-0.8222535, 1.530135, -1.205067, 0.8666667, 1, 0, 1,
-0.817166, 1.724173, -0.6060921, 0.8588235, 1, 0, 1,
-0.8118958, -1.103402, -3.019162, 0.854902, 1, 0, 1,
-0.8107806, 0.650592, -1.447334, 0.8470588, 1, 0, 1,
-0.8105467, 0.622488, -1.09985, 0.8431373, 1, 0, 1,
-0.8085494, -0.5703641, -1.934236, 0.8352941, 1, 0, 1,
-0.8034275, -1.17406, -0.8354769, 0.8313726, 1, 0, 1,
-0.8001653, -0.2310696, -0.9160282, 0.8235294, 1, 0, 1,
-0.7983521, 0.4505332, -0.6988667, 0.8196079, 1, 0, 1,
-0.7930739, 1.733675, -1.356053, 0.8117647, 1, 0, 1,
-0.7885619, 0.6538936, -1.876335, 0.8078431, 1, 0, 1,
-0.7818725, -0.7851193, -1.209833, 0.8, 1, 0, 1,
-0.7813163, -0.5712958, -2.488415, 0.7921569, 1, 0, 1,
-0.7770861, 0.6927173, -1.272908, 0.7882353, 1, 0, 1,
-0.7770784, 1.550644, 0.9335088, 0.7803922, 1, 0, 1,
-0.7710056, -0.2278205, -1.44095, 0.7764706, 1, 0, 1,
-0.7671856, -0.1454907, -0.5898699, 0.7686275, 1, 0, 1,
-0.7607786, 0.6817333, -0.1124652, 0.7647059, 1, 0, 1,
-0.756806, -1.06359, -2.835639, 0.7568628, 1, 0, 1,
-0.7557831, 0.8278372, -1.141338, 0.7529412, 1, 0, 1,
-0.7489778, 0.8785353, -1.606258, 0.7450981, 1, 0, 1,
-0.7434181, -0.1766567, -0.4182047, 0.7411765, 1, 0, 1,
-0.7400677, 0.744998, -3.251436, 0.7333333, 1, 0, 1,
-0.7377647, 0.005306597, -2.091166, 0.7294118, 1, 0, 1,
-0.7319438, 1.575312, -1.56457, 0.7215686, 1, 0, 1,
-0.7187213, -0.3480617, -1.286306, 0.7176471, 1, 0, 1,
-0.7145565, -0.04386085, -3.848282, 0.7098039, 1, 0, 1,
-0.7131033, -0.2884718, -2.490484, 0.7058824, 1, 0, 1,
-0.7113347, 0.632716, -1.17818, 0.6980392, 1, 0, 1,
-0.7101041, 2.480809, -0.1259402, 0.6901961, 1, 0, 1,
-0.7088689, 0.6781402, -0.9270865, 0.6862745, 1, 0, 1,
-0.708658, 0.7805508, -0.9449301, 0.6784314, 1, 0, 1,
-0.7083865, 0.4997535, -1.171781, 0.6745098, 1, 0, 1,
-0.7073818, 0.3787784, 0.0263093, 0.6666667, 1, 0, 1,
-0.7002733, 0.5493155, 0.7963644, 0.6627451, 1, 0, 1,
-0.6982005, -0.3342967, -1.876281, 0.654902, 1, 0, 1,
-0.6919754, -1.389992, -2.519801, 0.6509804, 1, 0, 1,
-0.690044, -0.2052378, -1.534766, 0.6431373, 1, 0, 1,
-0.688089, 0.4671341, -1.778361, 0.6392157, 1, 0, 1,
-0.6861269, 0.592664, 0.3318345, 0.6313726, 1, 0, 1,
-0.6824641, -1.828528, -3.018506, 0.627451, 1, 0, 1,
-0.6704969, 0.2863672, -2.45195, 0.6196079, 1, 0, 1,
-0.6704936, -0.2422495, -1.966157, 0.6156863, 1, 0, 1,
-0.6698092, -0.2513943, -2.800806, 0.6078432, 1, 0, 1,
-0.6643782, -1.252175, -1.798306, 0.6039216, 1, 0, 1,
-0.6621916, 0.6107231, -0.8477397, 0.5960785, 1, 0, 1,
-0.659866, -0.1773765, -0.9269279, 0.5882353, 1, 0, 1,
-0.6551801, 0.987726, -0.08148443, 0.5843138, 1, 0, 1,
-0.6517978, -0.5968693, -3.63054, 0.5764706, 1, 0, 1,
-0.6509892, -0.5808287, -2.40331, 0.572549, 1, 0, 1,
-0.6507617, 0.03004939, -2.967932, 0.5647059, 1, 0, 1,
-0.6502088, -0.7781903, -2.335523, 0.5607843, 1, 0, 1,
-0.649061, -0.2769774, -2.057636, 0.5529412, 1, 0, 1,
-0.6401306, -0.5633192, -1.711216, 0.5490196, 1, 0, 1,
-0.6372401, 0.3248787, -1.845623, 0.5411765, 1, 0, 1,
-0.6326667, -2.167128, -3.346171, 0.5372549, 1, 0, 1,
-0.6320185, -0.4242451, -3.506852, 0.5294118, 1, 0, 1,
-0.6310959, -1.346022, -2.588342, 0.5254902, 1, 0, 1,
-0.6310789, 0.5856518, -1.810089, 0.5176471, 1, 0, 1,
-0.6301713, -1.095807, -1.68363, 0.5137255, 1, 0, 1,
-0.6264166, 1.136844, 0.8869148, 0.5058824, 1, 0, 1,
-0.6258669, -0.5148598, -2.314072, 0.5019608, 1, 0, 1,
-0.6229516, 1.344284, 0.05333573, 0.4941176, 1, 0, 1,
-0.6215593, 1.117869, -1.911871, 0.4862745, 1, 0, 1,
-0.6211647, -0.5088025, -2.811789, 0.4823529, 1, 0, 1,
-0.6201194, 0.2470258, -1.971653, 0.4745098, 1, 0, 1,
-0.6136575, 0.4352805, -1.302125, 0.4705882, 1, 0, 1,
-0.6097015, 1.025994, -2.050716, 0.4627451, 1, 0, 1,
-0.6034614, 0.6675591, 1.189792, 0.4588235, 1, 0, 1,
-0.6013087, -0.5095568, -2.460015, 0.4509804, 1, 0, 1,
-0.5984348, 0.44728, -0.7055721, 0.4470588, 1, 0, 1,
-0.595722, -0.4809007, -1.816399, 0.4392157, 1, 0, 1,
-0.5902689, 1.235801, 1.25514, 0.4352941, 1, 0, 1,
-0.5895146, 0.08662007, -0.9285771, 0.427451, 1, 0, 1,
-0.5884112, -0.9632943, -2.945179, 0.4235294, 1, 0, 1,
-0.5839342, -0.9867452, -1.92348, 0.4156863, 1, 0, 1,
-0.5838831, 1.816418, -1.21761, 0.4117647, 1, 0, 1,
-0.5798696, -0.808283, -2.112296, 0.4039216, 1, 0, 1,
-0.5788442, -2.047573, -2.393078, 0.3960784, 1, 0, 1,
-0.5752975, -0.3663631, -2.352903, 0.3921569, 1, 0, 1,
-0.5722032, 0.5221698, -2.010082, 0.3843137, 1, 0, 1,
-0.5715808, 0.6749519, -1.067749, 0.3803922, 1, 0, 1,
-0.5703115, -0.7900623, -4.186832, 0.372549, 1, 0, 1,
-0.5702182, -0.5141824, -0.5941378, 0.3686275, 1, 0, 1,
-0.5646787, -0.4387042, -1.77731, 0.3607843, 1, 0, 1,
-0.5531285, 0.4492452, -1.670571, 0.3568628, 1, 0, 1,
-0.5506176, 0.9995261, -0.9096947, 0.3490196, 1, 0, 1,
-0.5488809, 1.181434, -0.07464723, 0.345098, 1, 0, 1,
-0.5487863, -0.2990159, -2.006352, 0.3372549, 1, 0, 1,
-0.541109, 0.2167905, 0.04917114, 0.3333333, 1, 0, 1,
-0.5407548, 0.6385462, -1.080571, 0.3254902, 1, 0, 1,
-0.5375774, 0.7446984, -1.999465, 0.3215686, 1, 0, 1,
-0.5357462, 1.2534, -0.5887854, 0.3137255, 1, 0, 1,
-0.5343105, -1.936911, -4.248801, 0.3098039, 1, 0, 1,
-0.5233328, -0.7756116, -1.447549, 0.3019608, 1, 0, 1,
-0.5232408, 0.7885213, -1.106623, 0.2941177, 1, 0, 1,
-0.5194303, -0.2626534, -3.459618, 0.2901961, 1, 0, 1,
-0.5121089, -0.5933396, -0.04752015, 0.282353, 1, 0, 1,
-0.509784, -0.155334, -2.266386, 0.2784314, 1, 0, 1,
-0.5074488, 0.1890006, -1.872665, 0.2705882, 1, 0, 1,
-0.5059921, 1.434304, 0.4273438, 0.2666667, 1, 0, 1,
-0.5046095, 1.122062, -0.7421678, 0.2588235, 1, 0, 1,
-0.4988296, -0.7715096, -2.940482, 0.254902, 1, 0, 1,
-0.4960728, 1.707996, 0.6884701, 0.2470588, 1, 0, 1,
-0.4932007, -0.5697966, -1.758065, 0.2431373, 1, 0, 1,
-0.4920161, 0.2289054, -0.5876307, 0.2352941, 1, 0, 1,
-0.4902842, 0.07402611, -3.129395, 0.2313726, 1, 0, 1,
-0.4892701, 0.07909649, -1.22739, 0.2235294, 1, 0, 1,
-0.4882234, -0.8162003, -0.7874792, 0.2196078, 1, 0, 1,
-0.4872299, -0.04747005, -2.642324, 0.2117647, 1, 0, 1,
-0.4784291, 1.639892, 0.1107906, 0.2078431, 1, 0, 1,
-0.4783902, 0.5113575, 0.00254999, 0.2, 1, 0, 1,
-0.4696967, -0.1781645, -2.378744, 0.1921569, 1, 0, 1,
-0.4690002, -0.966669, -2.894083, 0.1882353, 1, 0, 1,
-0.4644451, 0.5733659, 0.248826, 0.1803922, 1, 0, 1,
-0.4585504, 0.3586335, 0.09954157, 0.1764706, 1, 0, 1,
-0.4580954, 2.099137, -0.6955051, 0.1686275, 1, 0, 1,
-0.447444, -2.135185, -1.84584, 0.1647059, 1, 0, 1,
-0.445531, -0.1906279, -3.345453, 0.1568628, 1, 0, 1,
-0.4451941, 0.2956132, -1.428194, 0.1529412, 1, 0, 1,
-0.442461, -1.584028, -2.560125, 0.145098, 1, 0, 1,
-0.441655, -1.011386, -2.831777, 0.1411765, 1, 0, 1,
-0.4413238, -1.079226, -2.720855, 0.1333333, 1, 0, 1,
-0.4340181, 0.6541581, 0.9035395, 0.1294118, 1, 0, 1,
-0.4261154, -2.440217, -3.57745, 0.1215686, 1, 0, 1,
-0.4248433, 0.8893142, 0.9932822, 0.1176471, 1, 0, 1,
-0.4234005, -0.06315516, -1.717728, 0.1098039, 1, 0, 1,
-0.4221258, 1.907155, -0.8460752, 0.1058824, 1, 0, 1,
-0.4182816, 1.710227, 1.116907, 0.09803922, 1, 0, 1,
-0.4165751, -0.5138848, -2.178159, 0.09019608, 1, 0, 1,
-0.416095, 0.549908, -0.7728466, 0.08627451, 1, 0, 1,
-0.4160051, -0.6691515, -3.496722, 0.07843138, 1, 0, 1,
-0.4153766, -0.01887629, -1.944642, 0.07450981, 1, 0, 1,
-0.4151365, -1.771614, -3.282594, 0.06666667, 1, 0, 1,
-0.4148018, -0.3342512, -2.599057, 0.0627451, 1, 0, 1,
-0.413202, -1.05364, -2.937011, 0.05490196, 1, 0, 1,
-0.4110953, -0.4703638, -2.82142, 0.05098039, 1, 0, 1,
-0.4110004, 0.8133582, -0.2382003, 0.04313726, 1, 0, 1,
-0.4105181, 2.289044, 0.1929017, 0.03921569, 1, 0, 1,
-0.4081704, -0.8102787, -1.940541, 0.03137255, 1, 0, 1,
-0.4077483, -1.42184, -0.8860974, 0.02745098, 1, 0, 1,
-0.4057761, -0.2100891, -2.19417, 0.01960784, 1, 0, 1,
-0.4030023, -1.313929, -1.981491, 0.01568628, 1, 0, 1,
-0.3966222, -0.9448845, -1.736013, 0.007843138, 1, 0, 1,
-0.3949362, -1.733402, -5.190537, 0.003921569, 1, 0, 1,
-0.3911926, -0.6084045, -2.232078, 0, 1, 0.003921569, 1,
-0.3888985, 1.200106, 0.6442366, 0, 1, 0.01176471, 1,
-0.3886889, 0.5751298, -1.481198, 0, 1, 0.01568628, 1,
-0.3864345, -1.639256, -4.872679, 0, 1, 0.02352941, 1,
-0.3846584, -1.151465, -2.856033, 0, 1, 0.02745098, 1,
-0.3823631, 0.2240418, -1.503364, 0, 1, 0.03529412, 1,
-0.3802519, 0.9592314, -1.280847, 0, 1, 0.03921569, 1,
-0.3794992, -1.532689, -1.708064, 0, 1, 0.04705882, 1,
-0.3788174, -0.6938416, -3.165768, 0, 1, 0.05098039, 1,
-0.3761675, 0.7889256, -1.099673, 0, 1, 0.05882353, 1,
-0.3704938, -1.030628, -2.239475, 0, 1, 0.0627451, 1,
-0.3690001, 0.6706225, 1.031137, 0, 1, 0.07058824, 1,
-0.3687486, -1.111079, -3.969656, 0, 1, 0.07450981, 1,
-0.3658896, -0.931102, -4.38214, 0, 1, 0.08235294, 1,
-0.3604889, -0.8144407, -3.150699, 0, 1, 0.08627451, 1,
-0.3483722, 1.336776, -0.5450879, 0, 1, 0.09411765, 1,
-0.3432948, 0.8877608, -0.7508519, 0, 1, 0.1019608, 1,
-0.3368856, 0.2550338, -2.153017, 0, 1, 0.1058824, 1,
-0.33653, 1.792269, 0.2400554, 0, 1, 0.1137255, 1,
-0.3365207, -0.2462456, 0.5539385, 0, 1, 0.1176471, 1,
-0.3363426, -0.3930003, -2.300507, 0, 1, 0.1254902, 1,
-0.3357436, 0.2506364, -0.9985626, 0, 1, 0.1294118, 1,
-0.3347151, 0.7334565, -0.9839836, 0, 1, 0.1372549, 1,
-0.3342348, 0.7385938, -0.3888976, 0, 1, 0.1411765, 1,
-0.3299918, -0.7491689, -3.709805, 0, 1, 0.1490196, 1,
-0.3197605, -0.7078558, -2.717643, 0, 1, 0.1529412, 1,
-0.3162419, -0.924005, -2.824641, 0, 1, 0.1607843, 1,
-0.3136742, -0.1906779, -3.106371, 0, 1, 0.1647059, 1,
-0.3082924, 0.5808601, -0.9509664, 0, 1, 0.172549, 1,
-0.3073997, -0.4255019, -3.425471, 0, 1, 0.1764706, 1,
-0.3033572, 0.4368135, 0.8585966, 0, 1, 0.1843137, 1,
-0.3030745, -0.2259645, -2.382287, 0, 1, 0.1882353, 1,
-0.3026107, -1.062744, -4.014892, 0, 1, 0.1960784, 1,
-0.2992096, -1.477173, -3.857078, 0, 1, 0.2039216, 1,
-0.29871, -1.232112, -2.9926, 0, 1, 0.2078431, 1,
-0.2986585, 0.4468563, -1.537185, 0, 1, 0.2156863, 1,
-0.2950536, 1.405434, -0.0197602, 0, 1, 0.2196078, 1,
-0.2938667, -0.9777673, -2.478326, 0, 1, 0.227451, 1,
-0.2923034, -0.5764212, -2.734819, 0, 1, 0.2313726, 1,
-0.2903757, 0.4813656, -1.57379, 0, 1, 0.2392157, 1,
-0.2883826, 1.737612, -0.1921852, 0, 1, 0.2431373, 1,
-0.2857696, -1.2273, -1.925043, 0, 1, 0.2509804, 1,
-0.2838836, 0.6437176, -0.60665, 0, 1, 0.254902, 1,
-0.2819214, -1.79834, -3.248528, 0, 1, 0.2627451, 1,
-0.2818295, -0.01041369, -1.573151, 0, 1, 0.2666667, 1,
-0.278817, -1.519786, -2.654625, 0, 1, 0.2745098, 1,
-0.2779376, -0.7124865, -2.850477, 0, 1, 0.2784314, 1,
-0.2779165, -0.09578741, -2.2434, 0, 1, 0.2862745, 1,
-0.2755807, 1.153927, 0.9495096, 0, 1, 0.2901961, 1,
-0.2715246, 0.8517081, 0.1694734, 0, 1, 0.2980392, 1,
-0.2702782, 0.181048, -2.664205, 0, 1, 0.3058824, 1,
-0.2639426, 0.06996824, -0.719017, 0, 1, 0.3098039, 1,
-0.2615149, 0.4881319, -0.9353704, 0, 1, 0.3176471, 1,
-0.2578725, -0.6154507, -2.432076, 0, 1, 0.3215686, 1,
-0.2554559, -1.893449, -3.229818, 0, 1, 0.3294118, 1,
-0.2552862, -0.2936431, -1.654211, 0, 1, 0.3333333, 1,
-0.250328, -1.130608, -2.754717, 0, 1, 0.3411765, 1,
-0.248823, -1.317344, -3.300055, 0, 1, 0.345098, 1,
-0.2453861, -1.04878, -4.959822, 0, 1, 0.3529412, 1,
-0.2379945, 0.9947419, -1.271978, 0, 1, 0.3568628, 1,
-0.2375238, 0.5586772, 0.5400034, 0, 1, 0.3647059, 1,
-0.2359503, 0.6544076, -1.947867, 0, 1, 0.3686275, 1,
-0.2339492, -1.796517, -3.031155, 0, 1, 0.3764706, 1,
-0.2328761, 0.407783, 0.2233735, 0, 1, 0.3803922, 1,
-0.2303422, 0.4726992, -0.1453951, 0, 1, 0.3882353, 1,
-0.2295451, -0.6157212, -3.293633, 0, 1, 0.3921569, 1,
-0.2289136, -0.6460556, -2.258743, 0, 1, 0.4, 1,
-0.2221482, 0.6066016, -0.3581526, 0, 1, 0.4078431, 1,
-0.2174165, 0.9989864, -1.05749, 0, 1, 0.4117647, 1,
-0.2136505, 0.286321, -0.9085376, 0, 1, 0.4196078, 1,
-0.2122528, 0.1994696, -0.2793179, 0, 1, 0.4235294, 1,
-0.2079939, -0.2747269, -2.123165, 0, 1, 0.4313726, 1,
-0.204258, -0.5900862, -2.087469, 0, 1, 0.4352941, 1,
-0.2009584, -0.2044658, -3.509197, 0, 1, 0.4431373, 1,
-0.1970796, 0.6169105, -1.991918, 0, 1, 0.4470588, 1,
-0.1961169, -0.7713036, -2.574787, 0, 1, 0.454902, 1,
-0.1960849, -1.436384, -2.679958, 0, 1, 0.4588235, 1,
-0.1953222, -0.03750001, -3.174187, 0, 1, 0.4666667, 1,
-0.1932761, -0.261568, -2.706727, 0, 1, 0.4705882, 1,
-0.1929297, 1.553053, -0.3228939, 0, 1, 0.4784314, 1,
-0.1912604, 0.7702324, -0.4873715, 0, 1, 0.4823529, 1,
-0.1907747, -1.268283, -3.715259, 0, 1, 0.4901961, 1,
-0.1898617, -1.055023, -3.688628, 0, 1, 0.4941176, 1,
-0.1866277, -0.02330276, -1.524229, 0, 1, 0.5019608, 1,
-0.1863596, -0.6498346, -3.979913, 0, 1, 0.509804, 1,
-0.1848494, -0.332853, -3.446409, 0, 1, 0.5137255, 1,
-0.1840321, -0.5525045, -2.202407, 0, 1, 0.5215687, 1,
-0.1837164, 0.200555, -0.1131997, 0, 1, 0.5254902, 1,
-0.1724756, 1.30862, -0.7740802, 0, 1, 0.5333334, 1,
-0.1689722, 0.7772815, 0.08412027, 0, 1, 0.5372549, 1,
-0.1672106, 0.1166667, -1.187277, 0, 1, 0.5450981, 1,
-0.1645745, 0.1500935, -1.587982, 0, 1, 0.5490196, 1,
-0.1626711, -0.9082431, -3.506351, 0, 1, 0.5568628, 1,
-0.1613671, 0.6959937, -0.8095418, 0, 1, 0.5607843, 1,
-0.1604305, -0.6526313, -1.381344, 0, 1, 0.5686275, 1,
-0.1595147, 0.36911, -1.680042, 0, 1, 0.572549, 1,
-0.1572582, 0.340544, -0.5472444, 0, 1, 0.5803922, 1,
-0.1559581, -1.239039, -3.052571, 0, 1, 0.5843138, 1,
-0.1548251, -0.3285788, -3.828642, 0, 1, 0.5921569, 1,
-0.150924, -0.3082597, -1.738915, 0, 1, 0.5960785, 1,
-0.1491622, 1.064372, -0.7707667, 0, 1, 0.6039216, 1,
-0.1476735, 0.9207712, -0.2943717, 0, 1, 0.6117647, 1,
-0.1449732, 0.7834752, -0.6525002, 0, 1, 0.6156863, 1,
-0.1414719, 0.2357177, -1.001969, 0, 1, 0.6235294, 1,
-0.1334215, 0.09235095, -0.7839128, 0, 1, 0.627451, 1,
-0.1319079, 1.609949, 1.328005, 0, 1, 0.6352941, 1,
-0.1294581, 2.233362, -0.3635522, 0, 1, 0.6392157, 1,
-0.1255738, -0.6493768, -2.78303, 0, 1, 0.6470588, 1,
-0.1232583, 0.05916482, -1.38798, 0, 1, 0.6509804, 1,
-0.1210655, -0.09740208, -1.684772, 0, 1, 0.6588235, 1,
-0.1202144, 0.3554121, -0.6334464, 0, 1, 0.6627451, 1,
-0.1122424, -0.03149847, -2.90654, 0, 1, 0.6705883, 1,
-0.1068615, -1.022774, -4.097373, 0, 1, 0.6745098, 1,
-0.1013549, 0.2677574, 0.5730212, 0, 1, 0.682353, 1,
-0.09449598, 0.4431446, 0.8649157, 0, 1, 0.6862745, 1,
-0.09157647, 1.259082, 0.09471816, 0, 1, 0.6941177, 1,
-0.09108423, -1.433381, -3.624283, 0, 1, 0.7019608, 1,
-0.088066, 0.6826252, -0.4121485, 0, 1, 0.7058824, 1,
-0.08269846, -0.1107508, -2.811113, 0, 1, 0.7137255, 1,
-0.08169683, -0.6364412, -1.303709, 0, 1, 0.7176471, 1,
-0.07974229, 0.6213076, 0.3363419, 0, 1, 0.7254902, 1,
-0.07623621, 0.5052965, 0.8739935, 0, 1, 0.7294118, 1,
-0.07425653, -0.4344785, -3.28503, 0, 1, 0.7372549, 1,
-0.0735068, 2.117215, -0.6614076, 0, 1, 0.7411765, 1,
-0.07337283, -0.4234304, -5.208605, 0, 1, 0.7490196, 1,
-0.06771106, -0.1226617, -1.960552, 0, 1, 0.7529412, 1,
-0.06598108, 0.2488099, -1.026506, 0, 1, 0.7607843, 1,
-0.05930687, 0.4082568, -0.9679028, 0, 1, 0.7647059, 1,
-0.05594864, -0.3008516, -3.068046, 0, 1, 0.772549, 1,
-0.05470075, -0.5822319, -1.931699, 0, 1, 0.7764706, 1,
-0.05187191, 0.1807134, -1.062752, 0, 1, 0.7843137, 1,
-0.05167707, 0.9868542, 0.5791544, 0, 1, 0.7882353, 1,
-0.04859827, -1.006867, -2.583517, 0, 1, 0.7960784, 1,
-0.04589837, -1.278142, -2.191737, 0, 1, 0.8039216, 1,
-0.0435675, 0.5213266, 1.066515, 0, 1, 0.8078431, 1,
-0.04300893, 0.4835482, 0.700661, 0, 1, 0.8156863, 1,
-0.04203038, -1.92131, -4.129991, 0, 1, 0.8196079, 1,
-0.03619049, -0.6119444, -3.019787, 0, 1, 0.827451, 1,
-0.03096278, 0.02913705, -1.514812, 0, 1, 0.8313726, 1,
-0.02718758, 0.3976928, 1.649575, 0, 1, 0.8392157, 1,
-0.02707076, -1.229761, -3.578991, 0, 1, 0.8431373, 1,
-0.02574008, 0.4310987, -1.831357, 0, 1, 0.8509804, 1,
-0.02178572, -0.07246255, -3.900296, 0, 1, 0.854902, 1,
-0.01919186, 0.1843179, 2.350257, 0, 1, 0.8627451, 1,
-0.01461408, -0.5270566, -3.764363, 0, 1, 0.8666667, 1,
-0.0132339, -0.3930902, -1.738672, 0, 1, 0.8745098, 1,
-0.01074078, 1.3077, 0.5995701, 0, 1, 0.8784314, 1,
-0.009603434, -0.4815681, -3.465194, 0, 1, 0.8862745, 1,
-0.001481412, 0.9698661, 1.020239, 0, 1, 0.8901961, 1,
0.002301774, -0.1251569, 2.494689, 0, 1, 0.8980392, 1,
0.008060656, 2.304133, -1.872696, 0, 1, 0.9058824, 1,
0.0157629, -0.288358, 0.2000413, 0, 1, 0.9098039, 1,
0.01634128, -1.468397, 3.079882, 0, 1, 0.9176471, 1,
0.02641578, 0.7847738, -1.457995, 0, 1, 0.9215686, 1,
0.02970261, 0.5410754, -0.7598863, 0, 1, 0.9294118, 1,
0.03003872, -0.5657933, 3.35793, 0, 1, 0.9333333, 1,
0.03155491, 0.2533443, -0.8294393, 0, 1, 0.9411765, 1,
0.03668496, 0.4720284, -0.4704401, 0, 1, 0.945098, 1,
0.03744137, 0.9214644, 0.3803969, 0, 1, 0.9529412, 1,
0.039319, 1.013494, -0.5595566, 0, 1, 0.9568627, 1,
0.04141232, 1.050432, -2.805654, 0, 1, 0.9647059, 1,
0.04682086, -1.209673, 1.824107, 0, 1, 0.9686275, 1,
0.04962982, -1.964851, 2.676045, 0, 1, 0.9764706, 1,
0.05128917, 1.235524, -1.407016, 0, 1, 0.9803922, 1,
0.05166353, 1.160367, -0.09189912, 0, 1, 0.9882353, 1,
0.05374977, -1.190629, 4.672088, 0, 1, 0.9921569, 1,
0.0615913, -2.060943, 3.873604, 0, 1, 1, 1,
0.06519667, -0.3314241, 3.474945, 0, 0.9921569, 1, 1,
0.06523461, 0.06611583, -0.6082853, 0, 0.9882353, 1, 1,
0.06862197, -0.04283832, 3.523098, 0, 0.9803922, 1, 1,
0.06877542, -1.849388, 3.105036, 0, 0.9764706, 1, 1,
0.06907022, 0.7518895, -0.08824883, 0, 0.9686275, 1, 1,
0.07585634, -1.482363, 2.555755, 0, 0.9647059, 1, 1,
0.07588749, 0.5705884, 0.5912108, 0, 0.9568627, 1, 1,
0.07816762, -1.499218, 3.787443, 0, 0.9529412, 1, 1,
0.08710218, -1.365404, 3.506274, 0, 0.945098, 1, 1,
0.08715789, 0.5981146, -0.6966822, 0, 0.9411765, 1, 1,
0.09178112, 0.9678658, -0.3762366, 0, 0.9333333, 1, 1,
0.09354804, 0.1311303, 1.931419, 0, 0.9294118, 1, 1,
0.09558818, 1.662394, -1.351992, 0, 0.9215686, 1, 1,
0.09737424, 0.217023, -0.4908092, 0, 0.9176471, 1, 1,
0.1010474, 0.6747701, -0.7335129, 0, 0.9098039, 1, 1,
0.1010983, 0.2011198, 0.6531459, 0, 0.9058824, 1, 1,
0.1041281, 0.2480675, -0.2171951, 0, 0.8980392, 1, 1,
0.1053653, -1.665851, 1.101367, 0, 0.8901961, 1, 1,
0.1062085, 0.9610183, 0.3053835, 0, 0.8862745, 1, 1,
0.1065622, 0.3614412, -0.4388061, 0, 0.8784314, 1, 1,
0.1113458, 1.214466, 1.069188, 0, 0.8745098, 1, 1,
0.1132426, -0.07977983, 1.823775, 0, 0.8666667, 1, 1,
0.1165545, -0.2046175, 1.959641, 0, 0.8627451, 1, 1,
0.1280596, 0.02275368, 2.191829, 0, 0.854902, 1, 1,
0.1305518, -0.08894379, 3.068866, 0, 0.8509804, 1, 1,
0.1327935, 1.313781, -0.2931864, 0, 0.8431373, 1, 1,
0.1346356, -0.411403, 2.160722, 0, 0.8392157, 1, 1,
0.1366866, 0.2787202, 0.3080408, 0, 0.8313726, 1, 1,
0.1433193, 0.8344762, 0.2261072, 0, 0.827451, 1, 1,
0.1454465, 1.846706, -0.7424222, 0, 0.8196079, 1, 1,
0.1456736, 0.05242981, 0.04306283, 0, 0.8156863, 1, 1,
0.1473923, -0.1464972, -0.3474261, 0, 0.8078431, 1, 1,
0.1504167, -1.082141, 4.755891, 0, 0.8039216, 1, 1,
0.1527239, -0.7076062, 3.619651, 0, 0.7960784, 1, 1,
0.1538475, 0.6903824, 0.7829248, 0, 0.7882353, 1, 1,
0.1544848, -0.08532266, 2.146702, 0, 0.7843137, 1, 1,
0.15561, -0.6963436, 2.495449, 0, 0.7764706, 1, 1,
0.1602165, 1.475691, -0.5469465, 0, 0.772549, 1, 1,
0.1614808, -0.5609332, 5.470863, 0, 0.7647059, 1, 1,
0.1628777, -1.941092, 1.730908, 0, 0.7607843, 1, 1,
0.1652863, 2.032322, 1.000132, 0, 0.7529412, 1, 1,
0.1679792, 0.03411029, 1.664942, 0, 0.7490196, 1, 1,
0.1745584, -0.5124617, 2.333336, 0, 0.7411765, 1, 1,
0.1816473, 1.431381, 0.2646707, 0, 0.7372549, 1, 1,
0.1889057, 0.4847336, -0.5894758, 0, 0.7294118, 1, 1,
0.1944271, -1.335452, 2.889466, 0, 0.7254902, 1, 1,
0.1948882, 1.861643, -0.04060667, 0, 0.7176471, 1, 1,
0.1956179, -0.7715141, 2.130355, 0, 0.7137255, 1, 1,
0.201278, -1.236413, 3.487943, 0, 0.7058824, 1, 1,
0.2028226, -1.242856, 2.748602, 0, 0.6980392, 1, 1,
0.2030764, -0.2998346, 1.402477, 0, 0.6941177, 1, 1,
0.2074655, 0.2609916, 1.911863, 0, 0.6862745, 1, 1,
0.2079684, 0.2609059, -0.02981496, 0, 0.682353, 1, 1,
0.2091203, -0.3454868, 4.044429, 0, 0.6745098, 1, 1,
0.2112026, -0.6789978, 3.883236, 0, 0.6705883, 1, 1,
0.213212, 0.1229937, 2.132535, 0, 0.6627451, 1, 1,
0.2176151, 0.9953972, 2.681755, 0, 0.6588235, 1, 1,
0.2190008, -1.597851, 3.176642, 0, 0.6509804, 1, 1,
0.2231526, 0.756507, 1.078469, 0, 0.6470588, 1, 1,
0.2233063, 0.5074046, -0.00927634, 0, 0.6392157, 1, 1,
0.2236218, -0.7966106, 2.931574, 0, 0.6352941, 1, 1,
0.2248486, 0.2026305, -1.077224, 0, 0.627451, 1, 1,
0.22604, 1.02819, 0.3944976, 0, 0.6235294, 1, 1,
0.2304209, -1.246872, 2.477385, 0, 0.6156863, 1, 1,
0.2351922, -0.5805964, 0.9822978, 0, 0.6117647, 1, 1,
0.2366784, -0.8775719, 2.468123, 0, 0.6039216, 1, 1,
0.2392616, -0.7424505, 2.944014, 0, 0.5960785, 1, 1,
0.2442717, -0.1999314, 2.522591, 0, 0.5921569, 1, 1,
0.2460582, 0.521023, -0.00453613, 0, 0.5843138, 1, 1,
0.2490402, 0.16768, 1.921467, 0, 0.5803922, 1, 1,
0.249886, -1.197933, 3.308812, 0, 0.572549, 1, 1,
0.2534437, 1.105816, 1.042277, 0, 0.5686275, 1, 1,
0.2570827, 1.252754, -1.326645, 0, 0.5607843, 1, 1,
0.2581677, -0.316128, 1.586048, 0, 0.5568628, 1, 1,
0.2652858, 1.66976, 0.6178301, 0, 0.5490196, 1, 1,
0.2653293, -0.3526255, 1.045458, 0, 0.5450981, 1, 1,
0.2663262, 0.6109074, 1.369194, 0, 0.5372549, 1, 1,
0.2672607, 0.1404071, 0.4405264, 0, 0.5333334, 1, 1,
0.269267, 1.113026, 0.6297883, 0, 0.5254902, 1, 1,
0.2704541, -0.106694, 2.749497, 0, 0.5215687, 1, 1,
0.2705979, 0.6320265, -0.1883969, 0, 0.5137255, 1, 1,
0.2740744, -1.664065, 3.774534, 0, 0.509804, 1, 1,
0.2743149, -1.176191, 2.238953, 0, 0.5019608, 1, 1,
0.276427, 0.61275, -1.538949, 0, 0.4941176, 1, 1,
0.2778801, -2.040827, 3.017409, 0, 0.4901961, 1, 1,
0.2861629, -1.837852, 2.980588, 0, 0.4823529, 1, 1,
0.2885212, 0.8713288, -0.9904536, 0, 0.4784314, 1, 1,
0.2927169, 0.8322713, 0.579548, 0, 0.4705882, 1, 1,
0.2932332, -0.9023219, 2.169691, 0, 0.4666667, 1, 1,
0.2941579, -0.3447069, 3.054151, 0, 0.4588235, 1, 1,
0.2944008, 1.482476, 0.6280241, 0, 0.454902, 1, 1,
0.2945724, 1.358628, 1.554106, 0, 0.4470588, 1, 1,
0.2962852, -1.288794, 4.822895, 0, 0.4431373, 1, 1,
0.3005292, 1.270633, 1.026492, 0, 0.4352941, 1, 1,
0.3019891, 0.1009599, 2.855632, 0, 0.4313726, 1, 1,
0.3047609, -0.4102518, 1.309564, 0, 0.4235294, 1, 1,
0.3074188, -2.549738, 3.330489, 0, 0.4196078, 1, 1,
0.3094335, 0.04872621, 2.134336, 0, 0.4117647, 1, 1,
0.312094, -0.6970029, 1.137007, 0, 0.4078431, 1, 1,
0.3130384, -0.1149803, 2.246081, 0, 0.4, 1, 1,
0.3179449, -0.6620472, 2.321912, 0, 0.3921569, 1, 1,
0.3186021, 0.3282056, 1.226208, 0, 0.3882353, 1, 1,
0.3205778, -0.4430205, 4.278427, 0, 0.3803922, 1, 1,
0.3249972, 0.988036, 0.700281, 0, 0.3764706, 1, 1,
0.3313664, -1.317477, 3.72145, 0, 0.3686275, 1, 1,
0.3320391, 0.2902007, -0.6497869, 0, 0.3647059, 1, 1,
0.3395994, -1.541618, 2.82452, 0, 0.3568628, 1, 1,
0.3398373, -0.8173875, 3.526248, 0, 0.3529412, 1, 1,
0.3403571, 1.48059, 1.496126, 0, 0.345098, 1, 1,
0.3422573, -0.9364142, 1.480551, 0, 0.3411765, 1, 1,
0.3428454, 1.284238, -0.7896938, 0, 0.3333333, 1, 1,
0.3451868, -0.4614527, 1.323561, 0, 0.3294118, 1, 1,
0.3483574, 0.232283, 2.422596, 0, 0.3215686, 1, 1,
0.3563398, 0.4791252, 0.6496376, 0, 0.3176471, 1, 1,
0.3566562, 0.7520543, 1.018812, 0, 0.3098039, 1, 1,
0.357121, 1.801547, 0.2921452, 0, 0.3058824, 1, 1,
0.3592332, 0.01401984, 0.7160557, 0, 0.2980392, 1, 1,
0.3608049, -1.407136, 3.090038, 0, 0.2901961, 1, 1,
0.3619473, -0.8032194, 2.493921, 0, 0.2862745, 1, 1,
0.3632504, 0.09462349, 1.95994, 0, 0.2784314, 1, 1,
0.3638461, 0.1359396, 0.4888364, 0, 0.2745098, 1, 1,
0.3668348, 0.06954834, 2.725597, 0, 0.2666667, 1, 1,
0.3688701, -0.5402434, 2.686678, 0, 0.2627451, 1, 1,
0.3698985, 0.2116108, 1.455181, 0, 0.254902, 1, 1,
0.3720212, 0.07686877, 1.426751, 0, 0.2509804, 1, 1,
0.378423, 1.516645, -2.983833, 0, 0.2431373, 1, 1,
0.379656, 0.04876388, 0.9299151, 0, 0.2392157, 1, 1,
0.3851395, -0.5709016, 1.433661, 0, 0.2313726, 1, 1,
0.3855587, 1.116988, 1.136985, 0, 0.227451, 1, 1,
0.3900817, 0.7466186, 1.342339, 0, 0.2196078, 1, 1,
0.3915919, -0.09488899, 3.402761, 0, 0.2156863, 1, 1,
0.3964734, 1.386475, 1.700639, 0, 0.2078431, 1, 1,
0.3993822, -0.5254387, 2.542277, 0, 0.2039216, 1, 1,
0.3999138, 2.23126, -0.98226, 0, 0.1960784, 1, 1,
0.4004818, 0.06672939, 1.148837, 0, 0.1882353, 1, 1,
0.4019534, 1.545078, -0.2172723, 0, 0.1843137, 1, 1,
0.4030431, -0.9635931, 1.936746, 0, 0.1764706, 1, 1,
0.4073453, -1.285485, 2.097613, 0, 0.172549, 1, 1,
0.4105617, -0.09528811, 0.3006162, 0, 0.1647059, 1, 1,
0.4143921, 0.8572785, -0.3078676, 0, 0.1607843, 1, 1,
0.4169517, -0.6727275, 4.554756, 0, 0.1529412, 1, 1,
0.4181158, -0.1413666, 0.9359233, 0, 0.1490196, 1, 1,
0.4219021, 0.1427138, -0.300034, 0, 0.1411765, 1, 1,
0.4277099, -0.6700078, 3.716057, 0, 0.1372549, 1, 1,
0.4315872, 0.2620976, 0.4144575, 0, 0.1294118, 1, 1,
0.433429, -0.04938167, 2.019625, 0, 0.1254902, 1, 1,
0.434059, 0.1591749, 2.632036, 0, 0.1176471, 1, 1,
0.4472409, -0.2346933, 4.267431, 0, 0.1137255, 1, 1,
0.4477856, -0.08611625, 2.976326, 0, 0.1058824, 1, 1,
0.4487712, -1.042444, 2.048971, 0, 0.09803922, 1, 1,
0.4495929, 2.111098, -0.4555524, 0, 0.09411765, 1, 1,
0.4520954, 2.189989, -1.725589, 0, 0.08627451, 1, 1,
0.4545471, 1.532145, -0.123212, 0, 0.08235294, 1, 1,
0.4557156, 1.452706, -0.306143, 0, 0.07450981, 1, 1,
0.4643427, 0.942255, 1.756926, 0, 0.07058824, 1, 1,
0.4670028, 1.671081, 1.28456, 0, 0.0627451, 1, 1,
0.4690283, -1.083256, 2.396838, 0, 0.05882353, 1, 1,
0.4697063, 1.556043, 1.370125, 0, 0.05098039, 1, 1,
0.4730986, -1.538039, 0.9827409, 0, 0.04705882, 1, 1,
0.474015, 0.03226391, 1.855762, 0, 0.03921569, 1, 1,
0.4765678, 1.05546, 0.5285085, 0, 0.03529412, 1, 1,
0.4781677, -0.3686315, 2.887392, 0, 0.02745098, 1, 1,
0.4790974, 1.11754, 1.746918, 0, 0.02352941, 1, 1,
0.4803059, -0.1442337, 3.506462, 0, 0.01568628, 1, 1,
0.4804322, 0.2732598, 1.122074, 0, 0.01176471, 1, 1,
0.4870245, 1.924955, 0.7769414, 0, 0.003921569, 1, 1,
0.4882648, -0.7015708, 2.104222, 0.003921569, 0, 1, 1,
0.4886555, -0.5390849, 2.022598, 0.007843138, 0, 1, 1,
0.489094, 0.1160285, 2.265593, 0.01568628, 0, 1, 1,
0.4899237, -0.6198179, 2.527932, 0.01960784, 0, 1, 1,
0.4906345, 1.072573, 0.6313583, 0.02745098, 0, 1, 1,
0.4938241, -0.4542482, 1.159284, 0.03137255, 0, 1, 1,
0.5125859, -0.6455642, 3.022022, 0.03921569, 0, 1, 1,
0.5145738, -1.729496, 2.337263, 0.04313726, 0, 1, 1,
0.5161991, 0.03661302, 3.516011, 0.05098039, 0, 1, 1,
0.5173039, 0.7182521, 1.796924, 0.05490196, 0, 1, 1,
0.5187981, -0.9490094, 1.740162, 0.0627451, 0, 1, 1,
0.5238709, -1.828242, 2.939772, 0.06666667, 0, 1, 1,
0.5240568, 0.05700754, 3.520569, 0.07450981, 0, 1, 1,
0.5297167, 1.980876, 0.2963679, 0.07843138, 0, 1, 1,
0.5301741, 1.448488, 0.9600722, 0.08627451, 0, 1, 1,
0.5381221, -0.4076205, 2.303627, 0.09019608, 0, 1, 1,
0.5399808, 0.199991, 0.7768064, 0.09803922, 0, 1, 1,
0.5406877, 0.04057408, 0.5207019, 0.1058824, 0, 1, 1,
0.5439563, -0.4274209, 2.43983, 0.1098039, 0, 1, 1,
0.5443428, 0.8395158, -1.297261, 0.1176471, 0, 1, 1,
0.5458264, -0.08696161, 0.7289004, 0.1215686, 0, 1, 1,
0.5481492, 1.091782, -0.4400357, 0.1294118, 0, 1, 1,
0.5486805, 0.1480443, 1.213745, 0.1333333, 0, 1, 1,
0.548921, -2.190211, 4.404577, 0.1411765, 0, 1, 1,
0.553562, -0.9141442, 1.23462, 0.145098, 0, 1, 1,
0.5593091, -1.147796, 2.911616, 0.1529412, 0, 1, 1,
0.5695431, -0.5663133, 1.268527, 0.1568628, 0, 1, 1,
0.5719582, 0.9590414, 0.4520845, 0.1647059, 0, 1, 1,
0.5724537, -0.2955226, 1.132726, 0.1686275, 0, 1, 1,
0.5772073, -1.956001, 3.721855, 0.1764706, 0, 1, 1,
0.582962, 1.544969, 0.9333763, 0.1803922, 0, 1, 1,
0.5841342, 1.03371, -0.2042372, 0.1882353, 0, 1, 1,
0.5853607, 0.827975, 0.05373836, 0.1921569, 0, 1, 1,
0.5865658, -1.569919, 2.573515, 0.2, 0, 1, 1,
0.5868949, 0.5755817, -0.7733669, 0.2078431, 0, 1, 1,
0.5877507, 0.3156033, 1.300205, 0.2117647, 0, 1, 1,
0.5935873, -0.727661, 0.02632565, 0.2196078, 0, 1, 1,
0.6015244, -0.2462145, 0.2470742, 0.2235294, 0, 1, 1,
0.6032524, -0.6246056, 1.810146, 0.2313726, 0, 1, 1,
0.6047754, -0.5400294, 2.285837, 0.2352941, 0, 1, 1,
0.6057696, 0.2284805, 1.94854, 0.2431373, 0, 1, 1,
0.6058996, 1.483852, 0.6683818, 0.2470588, 0, 1, 1,
0.610512, 1.11639, 3.284598, 0.254902, 0, 1, 1,
0.6190241, 0.2031724, 2.029703, 0.2588235, 0, 1, 1,
0.6196845, -2.069181, 4.547846, 0.2666667, 0, 1, 1,
0.6253688, -0.9426052, 1.624152, 0.2705882, 0, 1, 1,
0.6271591, 1.019763, 3.175124, 0.2784314, 0, 1, 1,
0.6289627, -0.3084748, 2.453627, 0.282353, 0, 1, 1,
0.6303722, -1.242154, 3.503426, 0.2901961, 0, 1, 1,
0.6308194, -0.3539026, 2.421344, 0.2941177, 0, 1, 1,
0.6339132, 0.5526533, 0.7123877, 0.3019608, 0, 1, 1,
0.6362892, -0.2042973, 3.325801, 0.3098039, 0, 1, 1,
0.6394482, 0.3622316, 1.033306, 0.3137255, 0, 1, 1,
0.6493524, 0.0972096, 1.352655, 0.3215686, 0, 1, 1,
0.6513734, -0.1539451, 1.538116, 0.3254902, 0, 1, 1,
0.653133, 1.152658, 0.1371899, 0.3333333, 0, 1, 1,
0.6532044, 0.7029416, 0.3107209, 0.3372549, 0, 1, 1,
0.6553319, -1.319075, 2.501129, 0.345098, 0, 1, 1,
0.65949, 0.8115214, 1.031779, 0.3490196, 0, 1, 1,
0.6618566, 0.05072216, 2.271812, 0.3568628, 0, 1, 1,
0.6637041, 0.6086732, -0.4319293, 0.3607843, 0, 1, 1,
0.6665337, 0.5879821, -0.1798744, 0.3686275, 0, 1, 1,
0.6679692, 0.7695205, -1.579981, 0.372549, 0, 1, 1,
0.6690984, 0.3466456, 0.7939218, 0.3803922, 0, 1, 1,
0.6713789, 0.5773069, -0.3123083, 0.3843137, 0, 1, 1,
0.6738081, 0.1872756, 2.325724, 0.3921569, 0, 1, 1,
0.6764805, 1.161363, 0.2449394, 0.3960784, 0, 1, 1,
0.6804357, -0.7555978, 2.442316, 0.4039216, 0, 1, 1,
0.6832955, 0.1418044, 0.2080921, 0.4117647, 0, 1, 1,
0.6861584, -0.7187268, 0.9006086, 0.4156863, 0, 1, 1,
0.6880949, -0.7667474, 2.83256, 0.4235294, 0, 1, 1,
0.6906012, 0.05013062, 1.395837, 0.427451, 0, 1, 1,
0.6919625, -1.320894, 3.121576, 0.4352941, 0, 1, 1,
0.6923813, 0.2117876, 1.301015, 0.4392157, 0, 1, 1,
0.6955546, -1.137994, 3.456731, 0.4470588, 0, 1, 1,
0.6959468, -0.2507038, 1.536771, 0.4509804, 0, 1, 1,
0.697365, 1.538157, 1.178768, 0.4588235, 0, 1, 1,
0.7016259, -0.7972535, 1.778869, 0.4627451, 0, 1, 1,
0.7024992, 0.5150777, -0.7531173, 0.4705882, 0, 1, 1,
0.7055433, -0.8726981, 2.645472, 0.4745098, 0, 1, 1,
0.7088315, 0.6097657, 0.9257727, 0.4823529, 0, 1, 1,
0.712316, 0.9497643, -0.6678591, 0.4862745, 0, 1, 1,
0.7165233, -1.583264, 2.595158, 0.4941176, 0, 1, 1,
0.7177124, 1.077148, -0.1252457, 0.5019608, 0, 1, 1,
0.7267678, 0.2078215, 0.9784687, 0.5058824, 0, 1, 1,
0.7274329, 0.5357152, 0.3425542, 0.5137255, 0, 1, 1,
0.7412691, 0.1386598, 0.1947465, 0.5176471, 0, 1, 1,
0.7463335, -1.345685, 2.055273, 0.5254902, 0, 1, 1,
0.7469904, -1.203431, 3.608726, 0.5294118, 0, 1, 1,
0.7480177, 0.9611095, 0.2267985, 0.5372549, 0, 1, 1,
0.7500066, -0.5493045, 0.8149418, 0.5411765, 0, 1, 1,
0.7556245, 1.111347, 0.4844908, 0.5490196, 0, 1, 1,
0.7571203, -1.302686, 1.519338, 0.5529412, 0, 1, 1,
0.7593906, -0.520162, 2.656354, 0.5607843, 0, 1, 1,
0.7608942, -1.241346, 2.542497, 0.5647059, 0, 1, 1,
0.7634585, -0.3363012, 4.244993, 0.572549, 0, 1, 1,
0.7638613, 0.5772664, 1.049295, 0.5764706, 0, 1, 1,
0.7695476, 0.1845333, 0.730224, 0.5843138, 0, 1, 1,
0.7774939, 0.985967, -0.6395912, 0.5882353, 0, 1, 1,
0.7780128, -0.8367438, 0.5885728, 0.5960785, 0, 1, 1,
0.7797758, -0.2978206, 2.047951, 0.6039216, 0, 1, 1,
0.7850122, 0.7479946, 0.1222811, 0.6078432, 0, 1, 1,
0.7868856, -0.5662394, 2.009481, 0.6156863, 0, 1, 1,
0.7957242, -0.1929742, 1.361681, 0.6196079, 0, 1, 1,
0.7993934, 0.665619, 1.120239, 0.627451, 0, 1, 1,
0.8029677, -1.264039, 4.12116, 0.6313726, 0, 1, 1,
0.8056787, 1.369946, -0.6408408, 0.6392157, 0, 1, 1,
0.8072444, -1.130286, 2.691287, 0.6431373, 0, 1, 1,
0.8136758, -0.6849373, 1.345416, 0.6509804, 0, 1, 1,
0.8150446, 0.2183001, 0.1505316, 0.654902, 0, 1, 1,
0.8150621, -1.046054, 3.425177, 0.6627451, 0, 1, 1,
0.8218081, -0.3521211, 1.976038, 0.6666667, 0, 1, 1,
0.8255172, 1.117646, 0.4686683, 0.6745098, 0, 1, 1,
0.8257294, -0.8078223, 3.167554, 0.6784314, 0, 1, 1,
0.8311203, -2.046086, 2.701743, 0.6862745, 0, 1, 1,
0.8320966, -0.4005516, 2.072531, 0.6901961, 0, 1, 1,
0.8367926, 2.103456, 1.147109, 0.6980392, 0, 1, 1,
0.8432748, -0.5918322, 1.774432, 0.7058824, 0, 1, 1,
0.844123, 1.908452, 0.1858732, 0.7098039, 0, 1, 1,
0.8461932, -0.1882544, 1.295351, 0.7176471, 0, 1, 1,
0.846593, -0.07684734, 0.9079554, 0.7215686, 0, 1, 1,
0.8466614, -0.5037627, 2.331674, 0.7294118, 0, 1, 1,
0.8470402, 2.357783, -1.196221, 0.7333333, 0, 1, 1,
0.8513243, 1.056679, 1.420674, 0.7411765, 0, 1, 1,
0.8527937, 0.994495, 0.7931927, 0.7450981, 0, 1, 1,
0.8549317, 1.133295, 1.157034, 0.7529412, 0, 1, 1,
0.8556873, -0.5803947, 0.3677587, 0.7568628, 0, 1, 1,
0.8573246, -0.4238964, 2.402124, 0.7647059, 0, 1, 1,
0.8596731, -1.099668, 3.112138, 0.7686275, 0, 1, 1,
0.8730338, -1.42875, 3.805279, 0.7764706, 0, 1, 1,
0.878913, 0.659539, -0.2471189, 0.7803922, 0, 1, 1,
0.8836001, -1.427291, 2.543584, 0.7882353, 0, 1, 1,
0.8842747, -1.359489, 2.32399, 0.7921569, 0, 1, 1,
0.8863823, 2.058929, -1.571575, 0.8, 0, 1, 1,
0.8914654, 0.5643832, 1.110637, 0.8078431, 0, 1, 1,
0.8919336, 0.8025002, 1.171986, 0.8117647, 0, 1, 1,
0.8932113, -0.3793477, 3.50248, 0.8196079, 0, 1, 1,
0.894126, 0.493622, 1.735602, 0.8235294, 0, 1, 1,
0.8967527, 1.180501, 1.364465, 0.8313726, 0, 1, 1,
0.9048598, 0.4691634, 2.124003, 0.8352941, 0, 1, 1,
0.9059324, 0.9061749, 0.6380813, 0.8431373, 0, 1, 1,
0.906753, -0.6260718, 1.362431, 0.8470588, 0, 1, 1,
0.9072382, -1.262175, 2.50192, 0.854902, 0, 1, 1,
0.9109471, 0.4974801, -0.05585527, 0.8588235, 0, 1, 1,
0.9160418, 0.6631506, 0.4853834, 0.8666667, 0, 1, 1,
0.9191501, 0.5384349, 1.214109, 0.8705882, 0, 1, 1,
0.9217833, 0.6805933, -0.6641698, 0.8784314, 0, 1, 1,
0.9239036, -2.137344, 2.378134, 0.8823529, 0, 1, 1,
0.9248197, -0.9683371, 1.95542, 0.8901961, 0, 1, 1,
0.9268339, 2.596829, 2.395736, 0.8941177, 0, 1, 1,
0.9271511, 0.3759093, 2.118953, 0.9019608, 0, 1, 1,
0.9288903, 0.6237673, 0.3126808, 0.9098039, 0, 1, 1,
0.9310341, -2.72445, 1.252351, 0.9137255, 0, 1, 1,
0.9406222, 0.890846, 0.908121, 0.9215686, 0, 1, 1,
0.9448054, 1.234978, 1.037734, 0.9254902, 0, 1, 1,
0.9511736, 1.71352, 1.235588, 0.9333333, 0, 1, 1,
0.9533211, 0.6619618, 1.670792, 0.9372549, 0, 1, 1,
0.9551253, -0.6693766, 2.629468, 0.945098, 0, 1, 1,
0.9551494, -0.0512915, -0.1971617, 0.9490196, 0, 1, 1,
0.9601414, -1.393183, 0.6876029, 0.9568627, 0, 1, 1,
0.9831868, -0.3137411, 1.898439, 0.9607843, 0, 1, 1,
0.9844229, -1.937901, 2.266299, 0.9686275, 0, 1, 1,
0.9858079, -0.5708574, 0.4577451, 0.972549, 0, 1, 1,
0.9932873, 0.3242117, 2.154664, 0.9803922, 0, 1, 1,
1.002815, -0.9150442, 1.490537, 0.9843137, 0, 1, 1,
1.0132, 0.2371463, -1.379699, 0.9921569, 0, 1, 1,
1.016349, -0.4560691, 2.907153, 0.9960784, 0, 1, 1,
1.02543, -0.7191982, 1.519141, 1, 0, 0.9960784, 1,
1.044196, 0.9973364, 0.154523, 1, 0, 0.9882353, 1,
1.044501, 0.4876944, 0.6289113, 1, 0, 0.9843137, 1,
1.04677, 0.6458939, 1.383606, 1, 0, 0.9764706, 1,
1.055844, 0.3110355, 0.4528957, 1, 0, 0.972549, 1,
1.057405, 1.601065, 0.9642245, 1, 0, 0.9647059, 1,
1.05824, 1.577485, -0.474843, 1, 0, 0.9607843, 1,
1.058797, -2.194226, 0.1463436, 1, 0, 0.9529412, 1,
1.060555, 0.08907942, 2.650184, 1, 0, 0.9490196, 1,
1.061473, 2.501652, -0.7927771, 1, 0, 0.9411765, 1,
1.064665, 1.419229, 1.755695, 1, 0, 0.9372549, 1,
1.065725, 1.239212, 3.309618, 1, 0, 0.9294118, 1,
1.071009, 0.3450978, 2.290918, 1, 0, 0.9254902, 1,
1.076021, -0.4429737, 2.212346, 1, 0, 0.9176471, 1,
1.078482, 0.6900761, 1.275924, 1, 0, 0.9137255, 1,
1.080064, -1.365568, 1.698563, 1, 0, 0.9058824, 1,
1.086846, -0.381669, 0.8136904, 1, 0, 0.9019608, 1,
1.089189, 0.40321, 1.600386, 1, 0, 0.8941177, 1,
1.093774, 0.4183166, 2.205565, 1, 0, 0.8862745, 1,
1.09626, -2.291677, 1.555078, 1, 0, 0.8823529, 1,
1.097555, 0.6523776, 0.3758856, 1, 0, 0.8745098, 1,
1.097844, 2.843928, 2.15678, 1, 0, 0.8705882, 1,
1.099824, 0.3143857, 0.2245468, 1, 0, 0.8627451, 1,
1.104166, -1.362398, 3.354986, 1, 0, 0.8588235, 1,
1.108128, -0.1872828, 1.303954, 1, 0, 0.8509804, 1,
1.112301, -0.1993497, 2.686309, 1, 0, 0.8470588, 1,
1.116157, -0.6743174, 2.722057, 1, 0, 0.8392157, 1,
1.131274, -0.1772138, -1.027121, 1, 0, 0.8352941, 1,
1.143157, -0.161232, 1.678628, 1, 0, 0.827451, 1,
1.146858, -1.619952, 3.401223, 1, 0, 0.8235294, 1,
1.151856, -0.06425928, 0.07627212, 1, 0, 0.8156863, 1,
1.159572, 0.4684375, 1.483101, 1, 0, 0.8117647, 1,
1.162612, -0.2741535, 0.389761, 1, 0, 0.8039216, 1,
1.164257, -0.01072855, 2.245921, 1, 0, 0.7960784, 1,
1.167656, -1.579983, 3.946456, 1, 0, 0.7921569, 1,
1.167957, 1.95534, -0.4436632, 1, 0, 0.7843137, 1,
1.170019, -0.2391037, 1.729522, 1, 0, 0.7803922, 1,
1.176283, -0.7790533, 2.871029, 1, 0, 0.772549, 1,
1.180524, -1.362199, 2.695659, 1, 0, 0.7686275, 1,
1.183566, -0.5250031, 1.589944, 1, 0, 0.7607843, 1,
1.18873, -0.2314677, 0.9259583, 1, 0, 0.7568628, 1,
1.211698, 0.7474196, 1.923202, 1, 0, 0.7490196, 1,
1.214755, 1.499655, 0.4088079, 1, 0, 0.7450981, 1,
1.225246, -0.5828172, 2.053128, 1, 0, 0.7372549, 1,
1.226526, -0.4665099, 2.193053, 1, 0, 0.7333333, 1,
1.243218, -1.248466, 1.449828, 1, 0, 0.7254902, 1,
1.24888, 0.08970934, 0.6496334, 1, 0, 0.7215686, 1,
1.253139, 1.120659, -0.9401262, 1, 0, 0.7137255, 1,
1.266865, 0.02363261, 1.603926, 1, 0, 0.7098039, 1,
1.280753, 0.1201741, -2.053416, 1, 0, 0.7019608, 1,
1.291493, 1.670137, 0.7537713, 1, 0, 0.6941177, 1,
1.293108, -0.3588673, 1.254982, 1, 0, 0.6901961, 1,
1.29582, 0.5680847, 1.836338, 1, 0, 0.682353, 1,
1.296718, 0.7968481, 2.502409, 1, 0, 0.6784314, 1,
1.304201, -1.948006, 1.494423, 1, 0, 0.6705883, 1,
1.305294, -0.8961658, 0.7289812, 1, 0, 0.6666667, 1,
1.309568, -0.6403564, 2.005915, 1, 0, 0.6588235, 1,
1.320457, 1.17135, 1.307928, 1, 0, 0.654902, 1,
1.32181, -1.503953, 3.550634, 1, 0, 0.6470588, 1,
1.328931, -0.6775249, 1.812775, 1, 0, 0.6431373, 1,
1.330758, -0.4715537, 4.082189, 1, 0, 0.6352941, 1,
1.330966, 1.825632, -1.689476, 1, 0, 0.6313726, 1,
1.334206, 1.126506, 0.9981775, 1, 0, 0.6235294, 1,
1.338128, 1.039766, 2.041879, 1, 0, 0.6196079, 1,
1.341704, 1.817021, -0.7320023, 1, 0, 0.6117647, 1,
1.347331, -1.283684, 3.542835, 1, 0, 0.6078432, 1,
1.35717, -0.3978417, 0.9637022, 1, 0, 0.6, 1,
1.358886, -0.3668843, 2.449918, 1, 0, 0.5921569, 1,
1.364052, -1.222116, 2.352429, 1, 0, 0.5882353, 1,
1.366531, -1.038619, 2.886935, 1, 0, 0.5803922, 1,
1.371871, -0.8641424, 1.519075, 1, 0, 0.5764706, 1,
1.37862, 0.09606588, 1.635839, 1, 0, 0.5686275, 1,
1.395115, 0.1261819, -1.499194, 1, 0, 0.5647059, 1,
1.412537, -1.258566, 1.687001, 1, 0, 0.5568628, 1,
1.419979, 0.04514946, 0.6235201, 1, 0, 0.5529412, 1,
1.426458, -0.9177569, 2.825382, 1, 0, 0.5450981, 1,
1.43213, -0.2578841, 1.961393, 1, 0, 0.5411765, 1,
1.435383, 1.709112, 0.9827579, 1, 0, 0.5333334, 1,
1.43548, 0.008090894, 1.673596, 1, 0, 0.5294118, 1,
1.437491, -1.402468, 1.537114, 1, 0, 0.5215687, 1,
1.439866, 0.7932469, -0.2149884, 1, 0, 0.5176471, 1,
1.44439, 0.7187102, 0.7281561, 1, 0, 0.509804, 1,
1.446511, -0.7422304, 1.579684, 1, 0, 0.5058824, 1,
1.455797, 0.04655326, -0.6268761, 1, 0, 0.4980392, 1,
1.45635, 0.3402798, 0.3981472, 1, 0, 0.4901961, 1,
1.457045, 0.8248909, 1.875199, 1, 0, 0.4862745, 1,
1.463283, -0.04376635, 2.994791, 1, 0, 0.4784314, 1,
1.471314, 0.3049805, 3.893466, 1, 0, 0.4745098, 1,
1.47771, 0.2793112, 0.7114305, 1, 0, 0.4666667, 1,
1.479814, -0.3645775, 1.964326, 1, 0, 0.4627451, 1,
1.48033, 0.06795918, 4.407883, 1, 0, 0.454902, 1,
1.483213, -1.225696, 2.43601, 1, 0, 0.4509804, 1,
1.483657, -0.07852613, 2.136004, 1, 0, 0.4431373, 1,
1.485921, 0.7521915, 1.191911, 1, 0, 0.4392157, 1,
1.505599, -0.4204034, 3.239488, 1, 0, 0.4313726, 1,
1.516182, 0.04077511, 2.918104, 1, 0, 0.427451, 1,
1.520639, 0.6875334, 0.9847674, 1, 0, 0.4196078, 1,
1.522392, 0.5788485, 3.299677, 1, 0, 0.4156863, 1,
1.528667, -1.079557, 2.177732, 1, 0, 0.4078431, 1,
1.53323, 0.3432688, 0.6774143, 1, 0, 0.4039216, 1,
1.535166, -0.8663301, -0.3664085, 1, 0, 0.3960784, 1,
1.564252, 1.229737, 1.572581, 1, 0, 0.3882353, 1,
1.565545, -0.1993261, 2.539667, 1, 0, 0.3843137, 1,
1.570007, 0.9466013, 1.337369, 1, 0, 0.3764706, 1,
1.573933, -0.7340236, 0.9491909, 1, 0, 0.372549, 1,
1.619962, 1.025687, -1.046123, 1, 0, 0.3647059, 1,
1.631319, 2.469204, 0.121523, 1, 0, 0.3607843, 1,
1.636008, -0.7238516, 3.766518, 1, 0, 0.3529412, 1,
1.640525, 0.03681259, 2.759452, 1, 0, 0.3490196, 1,
1.655434, 0.7169749, -0.02723262, 1, 0, 0.3411765, 1,
1.669031, 0.07124972, 1.142333, 1, 0, 0.3372549, 1,
1.672608, 2.269076, 1.967479, 1, 0, 0.3294118, 1,
1.6741, -0.8571814, 2.485866, 1, 0, 0.3254902, 1,
1.679656, 0.5130212, 0.1407924, 1, 0, 0.3176471, 1,
1.682408, 0.9296628, 1.004581, 1, 0, 0.3137255, 1,
1.689891, -0.283192, 2.577942, 1, 0, 0.3058824, 1,
1.700755, -0.2958599, 2.153407, 1, 0, 0.2980392, 1,
1.701291, 0.02083959, 0.9858547, 1, 0, 0.2941177, 1,
1.713564, 1.672108, 1.420331, 1, 0, 0.2862745, 1,
1.720111, -1.277321, 1.931454, 1, 0, 0.282353, 1,
1.720852, 1.056297, 1.141804, 1, 0, 0.2745098, 1,
1.745893, -0.3879318, 1.360556, 1, 0, 0.2705882, 1,
1.748424, -0.8155414, 0.8125181, 1, 0, 0.2627451, 1,
1.752726, 1.326894, 0.6818008, 1, 0, 0.2588235, 1,
1.759099, -1.12184, 3.048523, 1, 0, 0.2509804, 1,
1.759703, -0.3990518, 1.719479, 1, 0, 0.2470588, 1,
1.781677, 0.1338384, 1.75275, 1, 0, 0.2392157, 1,
1.821443, 1.31306, 0.7259572, 1, 0, 0.2352941, 1,
1.831634, 1.379699, 0.8916845, 1, 0, 0.227451, 1,
1.838303, -0.5726258, 2.575434, 1, 0, 0.2235294, 1,
1.845546, -1.232558, 1.70378, 1, 0, 0.2156863, 1,
1.882596, 0.9020824, -0.7126964, 1, 0, 0.2117647, 1,
1.911925, 0.8159771, -0.2398157, 1, 0, 0.2039216, 1,
1.939584, 1.281958, -0.9223136, 1, 0, 0.1960784, 1,
1.964883, 1.623088, 1.247991, 1, 0, 0.1921569, 1,
1.990667, 0.4591085, 1.913454, 1, 0, 0.1843137, 1,
1.993097, -0.7917026, 2.231704, 1, 0, 0.1803922, 1,
1.994248, -1.384185, 2.766665, 1, 0, 0.172549, 1,
1.99492, 0.9362186, 1.370561, 1, 0, 0.1686275, 1,
1.99959, 0.009885302, 0.9266188, 1, 0, 0.1607843, 1,
2.00059, -0.7634934, 1.51325, 1, 0, 0.1568628, 1,
2.00415, 0.9185966, 1.156201, 1, 0, 0.1490196, 1,
2.011062, 1.701946, 0.912427, 1, 0, 0.145098, 1,
2.011714, -0.5154299, 1.945966, 1, 0, 0.1372549, 1,
2.051721, -0.03018559, 1.589541, 1, 0, 0.1333333, 1,
2.058366, 1.456164, -0.6879209, 1, 0, 0.1254902, 1,
2.067335, 0.09032462, 1.200087, 1, 0, 0.1215686, 1,
2.077919, -0.5334168, 3.700834, 1, 0, 0.1137255, 1,
2.137036, 0.2963972, 2.695959, 1, 0, 0.1098039, 1,
2.160576, 0.03791802, 1.423705, 1, 0, 0.1019608, 1,
2.194884, 0.1982706, 0.5168692, 1, 0, 0.09411765, 1,
2.200618, 1.941951, -0.2273641, 1, 0, 0.09019608, 1,
2.230947, 1.180722, 0.9190397, 1, 0, 0.08235294, 1,
2.235186, 0.4302052, 1.892167, 1, 0, 0.07843138, 1,
2.305027, -0.9027428, 2.403163, 1, 0, 0.07058824, 1,
2.309682, -0.4046699, 0.2416748, 1, 0, 0.06666667, 1,
2.362787, 0.8293722, 0.3873431, 1, 0, 0.05882353, 1,
2.364737, 1.332924, -0.7395961, 1, 0, 0.05490196, 1,
2.378375, 2.009509, -0.02286857, 1, 0, 0.04705882, 1,
2.471979, -0.5501112, 2.456097, 1, 0, 0.04313726, 1,
2.54249, -0.2574893, 3.050516, 1, 0, 0.03529412, 1,
2.574503, 0.5797094, 1.306859, 1, 0, 0.03137255, 1,
2.582874, -0.3429204, 2.695675, 1, 0, 0.02352941, 1,
2.941664, -0.2848361, 0.9664187, 1, 0, 0.01960784, 1,
3.039912, 0.7055455, 2.911623, 1, 0, 0.01176471, 1,
3.104542, -0.9099442, -0.001118724, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
0.1122743, -3.68853, -7.018775, 0, -0.5, 0.5, 0.5,
0.1122743, -3.68853, -7.018775, 1, -0.5, 0.5, 0.5,
0.1122743, -3.68853, -7.018775, 1, 1.5, 0.5, 0.5,
0.1122743, -3.68853, -7.018775, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.894372, 0.1194434, -7.018775, 0, -0.5, 0.5, 0.5,
-3.894372, 0.1194434, -7.018775, 1, -0.5, 0.5, 0.5,
-3.894372, 0.1194434, -7.018775, 1, 1.5, 0.5, 0.5,
-3.894372, 0.1194434, -7.018775, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.894372, -3.68853, 0.1311293, 0, -0.5, 0.5, 0.5,
-3.894372, -3.68853, 0.1311293, 1, -0.5, 0.5, 0.5,
-3.894372, -3.68853, 0.1311293, 1, 1.5, 0.5, 0.5,
-3.894372, -3.68853, 0.1311293, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-2, -2.809767, -5.368797,
3, -2.809767, -5.368797,
-2, -2.809767, -5.368797,
-2, -2.956227, -5.643793,
-1, -2.809767, -5.368797,
-1, -2.956227, -5.643793,
0, -2.809767, -5.368797,
0, -2.956227, -5.643793,
1, -2.809767, -5.368797,
1, -2.956227, -5.643793,
2, -2.809767, -5.368797,
2, -2.956227, -5.643793,
3, -2.809767, -5.368797,
3, -2.956227, -5.643793
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-2, -3.249148, -6.193786, 0, -0.5, 0.5, 0.5,
-2, -3.249148, -6.193786, 1, -0.5, 0.5, 0.5,
-2, -3.249148, -6.193786, 1, 1.5, 0.5, 0.5,
-2, -3.249148, -6.193786, 0, 1.5, 0.5, 0.5,
-1, -3.249148, -6.193786, 0, -0.5, 0.5, 0.5,
-1, -3.249148, -6.193786, 1, -0.5, 0.5, 0.5,
-1, -3.249148, -6.193786, 1, 1.5, 0.5, 0.5,
-1, -3.249148, -6.193786, 0, 1.5, 0.5, 0.5,
0, -3.249148, -6.193786, 0, -0.5, 0.5, 0.5,
0, -3.249148, -6.193786, 1, -0.5, 0.5, 0.5,
0, -3.249148, -6.193786, 1, 1.5, 0.5, 0.5,
0, -3.249148, -6.193786, 0, 1.5, 0.5, 0.5,
1, -3.249148, -6.193786, 0, -0.5, 0.5, 0.5,
1, -3.249148, -6.193786, 1, -0.5, 0.5, 0.5,
1, -3.249148, -6.193786, 1, 1.5, 0.5, 0.5,
1, -3.249148, -6.193786, 0, 1.5, 0.5, 0.5,
2, -3.249148, -6.193786, 0, -0.5, 0.5, 0.5,
2, -3.249148, -6.193786, 1, -0.5, 0.5, 0.5,
2, -3.249148, -6.193786, 1, 1.5, 0.5, 0.5,
2, -3.249148, -6.193786, 0, 1.5, 0.5, 0.5,
3, -3.249148, -6.193786, 0, -0.5, 0.5, 0.5,
3, -3.249148, -6.193786, 1, -0.5, 0.5, 0.5,
3, -3.249148, -6.193786, 1, 1.5, 0.5, 0.5,
3, -3.249148, -6.193786, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-2.969762, -2, -5.368797,
-2.969762, 2, -5.368797,
-2.969762, -2, -5.368797,
-3.123863, -2, -5.643793,
-2.969762, -1, -5.368797,
-3.123863, -1, -5.643793,
-2.969762, 0, -5.368797,
-3.123863, 0, -5.643793,
-2.969762, 1, -5.368797,
-3.123863, 1, -5.643793,
-2.969762, 2, -5.368797,
-3.123863, 2, -5.643793
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-2",
"-1",
"0",
"1",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.432067, -2, -6.193786, 0, -0.5, 0.5, 0.5,
-3.432067, -2, -6.193786, 1, -0.5, 0.5, 0.5,
-3.432067, -2, -6.193786, 1, 1.5, 0.5, 0.5,
-3.432067, -2, -6.193786, 0, 1.5, 0.5, 0.5,
-3.432067, -1, -6.193786, 0, -0.5, 0.5, 0.5,
-3.432067, -1, -6.193786, 1, -0.5, 0.5, 0.5,
-3.432067, -1, -6.193786, 1, 1.5, 0.5, 0.5,
-3.432067, -1, -6.193786, 0, 1.5, 0.5, 0.5,
-3.432067, 0, -6.193786, 0, -0.5, 0.5, 0.5,
-3.432067, 0, -6.193786, 1, -0.5, 0.5, 0.5,
-3.432067, 0, -6.193786, 1, 1.5, 0.5, 0.5,
-3.432067, 0, -6.193786, 0, 1.5, 0.5, 0.5,
-3.432067, 1, -6.193786, 0, -0.5, 0.5, 0.5,
-3.432067, 1, -6.193786, 1, -0.5, 0.5, 0.5,
-3.432067, 1, -6.193786, 1, 1.5, 0.5, 0.5,
-3.432067, 1, -6.193786, 0, 1.5, 0.5, 0.5,
-3.432067, 2, -6.193786, 0, -0.5, 0.5, 0.5,
-3.432067, 2, -6.193786, 1, -0.5, 0.5, 0.5,
-3.432067, 2, -6.193786, 1, 1.5, 0.5, 0.5,
-3.432067, 2, -6.193786, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-2.969762, -2.809767, -4,
-2.969762, -2.809767, 4,
-2.969762, -2.809767, -4,
-3.123863, -2.956227, -4,
-2.969762, -2.809767, -2,
-3.123863, -2.956227, -2,
-2.969762, -2.809767, 0,
-3.123863, -2.956227, 0,
-2.969762, -2.809767, 2,
-3.123863, -2.956227, 2,
-2.969762, -2.809767, 4,
-3.123863, -2.956227, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.432067, -3.249148, -4, 0, -0.5, 0.5, 0.5,
-3.432067, -3.249148, -4, 1, -0.5, 0.5, 0.5,
-3.432067, -3.249148, -4, 1, 1.5, 0.5, 0.5,
-3.432067, -3.249148, -4, 0, 1.5, 0.5, 0.5,
-3.432067, -3.249148, -2, 0, -0.5, 0.5, 0.5,
-3.432067, -3.249148, -2, 1, -0.5, 0.5, 0.5,
-3.432067, -3.249148, -2, 1, 1.5, 0.5, 0.5,
-3.432067, -3.249148, -2, 0, 1.5, 0.5, 0.5,
-3.432067, -3.249148, 0, 0, -0.5, 0.5, 0.5,
-3.432067, -3.249148, 0, 1, -0.5, 0.5, 0.5,
-3.432067, -3.249148, 0, 1, 1.5, 0.5, 0.5,
-3.432067, -3.249148, 0, 0, 1.5, 0.5, 0.5,
-3.432067, -3.249148, 2, 0, -0.5, 0.5, 0.5,
-3.432067, -3.249148, 2, 1, -0.5, 0.5, 0.5,
-3.432067, -3.249148, 2, 1, 1.5, 0.5, 0.5,
-3.432067, -3.249148, 2, 0, 1.5, 0.5, 0.5,
-3.432067, -3.249148, 4, 0, -0.5, 0.5, 0.5,
-3.432067, -3.249148, 4, 1, -0.5, 0.5, 0.5,
-3.432067, -3.249148, 4, 1, 1.5, 0.5, 0.5,
-3.432067, -3.249148, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-2.969762, -2.809767, -5.368797,
-2.969762, 3.048654, -5.368797,
-2.969762, -2.809767, 5.631055,
-2.969762, 3.048654, 5.631055,
-2.969762, -2.809767, -5.368797,
-2.969762, -2.809767, 5.631055,
-2.969762, 3.048654, -5.368797,
-2.969762, 3.048654, 5.631055,
-2.969762, -2.809767, -5.368797,
3.19431, -2.809767, -5.368797,
-2.969762, -2.809767, 5.631055,
3.19431, -2.809767, 5.631055,
-2.969762, 3.048654, -5.368797,
3.19431, 3.048654, -5.368797,
-2.969762, 3.048654, 5.631055,
3.19431, 3.048654, 5.631055,
3.19431, -2.809767, -5.368797,
3.19431, 3.048654, -5.368797,
3.19431, -2.809767, 5.631055,
3.19431, 3.048654, 5.631055,
3.19431, -2.809767, -5.368797,
3.19431, -2.809767, 5.631055,
3.19431, 3.048654, -5.368797,
3.19431, 3.048654, 5.631055
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.42432;
var distance = 33.03164;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.1122743, -0.1194434, -0.1311293 );
mvMatrix.scale( 1.302276, 1.370219, 0.7297662 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.03164);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
ethiozin<-read.table("ethiozin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ethiozin$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethiozin' not found
```

```r
y<-ethiozin$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethiozin' not found
```

```r
z<-ethiozin$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethiozin' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-2.879994, -1.637134, -3.60357, 0, 0, 1, 1, 1,
-2.787829, 0.2317177, -0.2803283, 1, 0, 0, 1, 1,
-2.660062, 0.2340267, -1.517309, 1, 0, 0, 1, 1,
-2.616399, 0.5114824, -0.2055823, 1, 0, 0, 1, 1,
-2.5621, -0.3819132, -2.474054, 1, 0, 0, 1, 1,
-2.519988, -2.171022, -3.00852, 1, 0, 0, 1, 1,
-2.453653, 1.446966, 1.17693, 0, 0, 0, 1, 1,
-2.435163, 1.353652, 0.1959093, 0, 0, 0, 1, 1,
-2.433869, 1.003321, -2.218985, 0, 0, 0, 1, 1,
-2.425615, -1.085351, -4.044432, 0, 0, 0, 1, 1,
-2.321924, -0.5187936, -1.989104, 0, 0, 0, 1, 1,
-2.278676, 1.677383, -0.7624661, 0, 0, 0, 1, 1,
-2.114342, -1.385833, -1.428923, 0, 0, 0, 1, 1,
-2.101279, -1.53869, -0.707616, 1, 1, 1, 1, 1,
-2.075666, -1.419329, -4.796575, 1, 1, 1, 1, 1,
-2.062917, -1.186779, -3.066843, 1, 1, 1, 1, 1,
-2.060772, 0.5053567, -1.460746, 1, 1, 1, 1, 1,
-2.046711, -1.696959, -2.621974, 1, 1, 1, 1, 1,
-2.043517, -0.466215, -2.870546, 1, 1, 1, 1, 1,
-2.040047, 1.692835, -0.7960671, 1, 1, 1, 1, 1,
-2.025469, -0.8261383, -2.065004, 1, 1, 1, 1, 1,
-1.946694, -0.7836366, -2.757837, 1, 1, 1, 1, 1,
-1.942128, 1.068808, -0.2402906, 1, 1, 1, 1, 1,
-1.907501, -1.18764, -2.612452, 1, 1, 1, 1, 1,
-1.903938, 1.213387, -1.503488, 1, 1, 1, 1, 1,
-1.87005, -0.7158456, -1.603438, 1, 1, 1, 1, 1,
-1.861376, -2.093851, -3.249855, 1, 1, 1, 1, 1,
-1.845008, 0.9220176, -0.2548283, 1, 1, 1, 1, 1,
-1.844583, -1.741264, -2.182701, 0, 0, 1, 1, 1,
-1.838817, -0.1031, -2.03142, 1, 0, 0, 1, 1,
-1.769632, -0.8226178, -2.729004, 1, 0, 0, 1, 1,
-1.765257, -0.559369, -2.785763, 1, 0, 0, 1, 1,
-1.732789, 1.425578, -1.586045, 1, 0, 0, 1, 1,
-1.705079, -0.05333729, -3.569657, 1, 0, 0, 1, 1,
-1.68547, -0.2492837, -0.8812514, 0, 0, 0, 1, 1,
-1.662504, -0.06952082, -0.2512136, 0, 0, 0, 1, 1,
-1.658444, -0.3969587, -2.370119, 0, 0, 0, 1, 1,
-1.651405, -1.572012, -2.908355, 0, 0, 0, 1, 1,
-1.643333, 0.2702904, -2.384078, 0, 0, 0, 1, 1,
-1.625548, 1.084577, -0.6665021, 0, 0, 0, 1, 1,
-1.60382, 0.5308256, -0.6696082, 0, 0, 0, 1, 1,
-1.591077, 0.7476217, 0.1980126, 1, 1, 1, 1, 1,
-1.586496, -0.6937868, -1.449629, 1, 1, 1, 1, 1,
-1.581995, -0.2184067, -1.987237, 1, 1, 1, 1, 1,
-1.574153, -0.4674961, -2.814438, 1, 1, 1, 1, 1,
-1.563174, -2.100887, -3.082367, 1, 1, 1, 1, 1,
-1.552402, 0.6984439, -1.301711, 1, 1, 1, 1, 1,
-1.545466, -0.08076041, -3.353356, 1, 1, 1, 1, 1,
-1.540356, -0.5220406, -1.292995, 1, 1, 1, 1, 1,
-1.539279, -0.1450553, -0.9686958, 1, 1, 1, 1, 1,
-1.538361, 1.508443, -0.9112971, 1, 1, 1, 1, 1,
-1.489394, -0.0884303, -2.266515, 1, 1, 1, 1, 1,
-1.486758, 1.37475, 0.5892128, 1, 1, 1, 1, 1,
-1.486096, -2.164239, -3.73346, 1, 1, 1, 1, 1,
-1.474652, 0.07914854, -2.935347, 1, 1, 1, 1, 1,
-1.468667, 1.695325, -2.358335, 1, 1, 1, 1, 1,
-1.460173, 0.2175504, -2.219818, 0, 0, 1, 1, 1,
-1.447137, 0.3855647, -0.5314108, 1, 0, 0, 1, 1,
-1.440426, 0.2498648, -1.334908, 1, 0, 0, 1, 1,
-1.43273, -0.6205001, -2.807398, 1, 0, 0, 1, 1,
-1.429743, 0.642999, -0.5656655, 1, 0, 0, 1, 1,
-1.423644, 0.08123834, -2.832192, 1, 0, 0, 1, 1,
-1.4186, 0.120447, -0.553629, 0, 0, 0, 1, 1,
-1.418037, 2.963337, -1.152405, 0, 0, 0, 1, 1,
-1.402928, -1.125005, -2.095276, 0, 0, 0, 1, 1,
-1.400533, -0.8776743, -1.989067, 0, 0, 0, 1, 1,
-1.398686, 2.077185, 0.737166, 0, 0, 0, 1, 1,
-1.395667, 2.015642, -1.167782, 0, 0, 0, 1, 1,
-1.368741, -0.6402677, -1.51666, 0, 0, 0, 1, 1,
-1.367363, 1.559714, 0.03636081, 1, 1, 1, 1, 1,
-1.363926, -1.169013, -2.284056, 1, 1, 1, 1, 1,
-1.36338, 1.354625, -1.102848, 1, 1, 1, 1, 1,
-1.351193, 0.07771051, -0.279692, 1, 1, 1, 1, 1,
-1.349323, 0.2231612, -1.845969, 1, 1, 1, 1, 1,
-1.346112, 0.4598404, -0.05571854, 1, 1, 1, 1, 1,
-1.342852, 0.05021285, -2.176594, 1, 1, 1, 1, 1,
-1.315967, 0.5062246, -0.3989603, 1, 1, 1, 1, 1,
-1.315948, 0.1360745, -2.46335, 1, 1, 1, 1, 1,
-1.315055, 0.2760081, -2.004154, 1, 1, 1, 1, 1,
-1.313387, -0.3802298, -1.914683, 1, 1, 1, 1, 1,
-1.301222, 0.4608637, -1.149021, 1, 1, 1, 1, 1,
-1.300283, 1.144675, -2.2521, 1, 1, 1, 1, 1,
-1.29839, 0.9585853, 0.2181275, 1, 1, 1, 1, 1,
-1.292737, 0.3554627, -2.79661, 1, 1, 1, 1, 1,
-1.29173, -1.421261, -1.131685, 0, 0, 1, 1, 1,
-1.291431, 0.886202, 0.2600115, 1, 0, 0, 1, 1,
-1.274095, 0.7851153, -0.7769865, 1, 0, 0, 1, 1,
-1.273181, -0.7644662, -2.329004, 1, 0, 0, 1, 1,
-1.267321, -0.2327711, -1.65575, 1, 0, 0, 1, 1,
-1.267115, -1.321336, -2.58121, 1, 0, 0, 1, 1,
-1.252356, 0.8584681, -1.163677, 0, 0, 0, 1, 1,
-1.247567, -0.3218303, 0.4468388, 0, 0, 0, 1, 1,
-1.245931, 0.6233529, -0.8834888, 0, 0, 0, 1, 1,
-1.238688, 0.5754312, -1.595122, 0, 0, 0, 1, 1,
-1.234636, 1.802006, -0.8097841, 0, 0, 0, 1, 1,
-1.221967, -0.9960383, -2.245515, 0, 0, 0, 1, 1,
-1.22171, 0.7404052, -1.629434, 0, 0, 0, 1, 1,
-1.220279, 0.381999, -3.085707, 1, 1, 1, 1, 1,
-1.21516, 1.042541, 0.6963186, 1, 1, 1, 1, 1,
-1.210957, 0.6545476, -1.758812, 1, 1, 1, 1, 1,
-1.205621, -0.07231462, -1.01512, 1, 1, 1, 1, 1,
-1.202113, -0.8482721, -2.863578, 1, 1, 1, 1, 1,
-1.19982, -0.6547235, -1.787915, 1, 1, 1, 1, 1,
-1.187099, -0.700582, -1.869068, 1, 1, 1, 1, 1,
-1.173818, 1.244581, -0.8237681, 1, 1, 1, 1, 1,
-1.165244, -1.217267, -1.993924, 1, 1, 1, 1, 1,
-1.159622, -1.160076, -2.878394, 1, 1, 1, 1, 1,
-1.152707, 0.7067658, -0.7548935, 1, 1, 1, 1, 1,
-1.147275, -1.102349, -0.8182675, 1, 1, 1, 1, 1,
-1.14539, 0.8412054, -0.7427056, 1, 1, 1, 1, 1,
-1.140029, -0.6154363, -3.058068, 1, 1, 1, 1, 1,
-1.134829, -1.896714, -2.477485, 1, 1, 1, 1, 1,
-1.133725, -0.2873051, -1.508416, 0, 0, 1, 1, 1,
-1.131055, -2.288658, -3.449147, 1, 0, 0, 1, 1,
-1.123464, -0.7176198, -1.324563, 1, 0, 0, 1, 1,
-1.116984, -0.4364461, -1.267607, 1, 0, 0, 1, 1,
-1.108429, 0.7383631, 0.5167297, 1, 0, 0, 1, 1,
-1.10719, 0.4656389, -1.187415, 1, 0, 0, 1, 1,
-1.106662, -0.2605692, -2.009963, 0, 0, 0, 1, 1,
-1.105314, 0.7348751, -3.205301, 0, 0, 0, 1, 1,
-1.098922, 0.7202304, -0.6638901, 0, 0, 0, 1, 1,
-1.096494, 2.083533, 0.01169379, 0, 0, 0, 1, 1,
-1.087599, 0.1521774, -0.4959698, 0, 0, 0, 1, 1,
-1.082479, -1.409429, -2.063397, 0, 0, 0, 1, 1,
-1.080713, -0.476102, -0.1971911, 0, 0, 0, 1, 1,
-1.074386, -0.02712672, -0.8778375, 1, 1, 1, 1, 1,
-1.068155, 0.9772144, -2.610404, 1, 1, 1, 1, 1,
-1.067248, -0.5794239, -1.913165, 1, 1, 1, 1, 1,
-1.06578, 0.1576813, -1.81458, 1, 1, 1, 1, 1,
-1.065772, 1.493459, 0.3724795, 1, 1, 1, 1, 1,
-1.062863, -0.1747874, -1.447009, 1, 1, 1, 1, 1,
-1.062549, 1.747144, -1.181758, 1, 1, 1, 1, 1,
-1.061901, 0.6597208, -1.506027, 1, 1, 1, 1, 1,
-1.053353, 0.535686, -1.685914, 1, 1, 1, 1, 1,
-1.050029, -0.2894595, -2.829427, 1, 1, 1, 1, 1,
-1.039519, -1.290769, -1.678151, 1, 1, 1, 1, 1,
-1.035823, -0.5234272, -0.3260244, 1, 1, 1, 1, 1,
-1.018917, 0.1127292, -0.0453888, 1, 1, 1, 1, 1,
-1.016633, -1.19273, -1.339314, 1, 1, 1, 1, 1,
-1.015361, -0.7042152, -1.978124, 1, 1, 1, 1, 1,
-1.006764, -0.310524, -0.6541843, 0, 0, 1, 1, 1,
-1.006074, 0.647452, -0.3846141, 1, 0, 0, 1, 1,
-1.003846, 0.9722669, -0.9309453, 1, 0, 0, 1, 1,
-1.003355, -0.3321655, -0.7701722, 1, 0, 0, 1, 1,
-0.9977217, -0.9943103, -0.08087784, 1, 0, 0, 1, 1,
-0.9921684, 0.371163, -0.9682018, 1, 0, 0, 1, 1,
-0.9844745, 1.413352, 0.02125184, 0, 0, 0, 1, 1,
-0.9809226, 0.51125, -0.5232825, 0, 0, 0, 1, 1,
-0.9807795, 0.1659924, -0.1380209, 0, 0, 0, 1, 1,
-0.9804098, 0.2276784, -0.7392921, 0, 0, 0, 1, 1,
-0.9794716, -0.9016535, -3.582609, 0, 0, 0, 1, 1,
-0.9719662, -0.6647668, -3.88902, 0, 0, 0, 1, 1,
-0.960892, -0.7940189, -2.741419, 0, 0, 0, 1, 1,
-0.9577229, 0.0483933, -1.600931, 1, 1, 1, 1, 1,
-0.9566355, -1.480785, -3.085139, 1, 1, 1, 1, 1,
-0.9538566, 0.02451193, -1.567838, 1, 1, 1, 1, 1,
-0.9524865, -0.529866, -2.341268, 1, 1, 1, 1, 1,
-0.952359, -1.253431, -1.933561, 1, 1, 1, 1, 1,
-0.949711, 0.1156652, -1.240469, 1, 1, 1, 1, 1,
-0.9480817, 0.9969475, 0.4557348, 1, 1, 1, 1, 1,
-0.9403853, -0.7148257, -2.380275, 1, 1, 1, 1, 1,
-0.9390749, 1.850743, 0.1678697, 1, 1, 1, 1, 1,
-0.93463, -0.9899317, -3.235377, 1, 1, 1, 1, 1,
-0.9342835, -1.227239, 0.04344841, 1, 1, 1, 1, 1,
-0.9099239, -0.9733772, -4.07647, 1, 1, 1, 1, 1,
-0.9086075, 0.6788398, -1.536686, 1, 1, 1, 1, 1,
-0.9073913, -0.7166665, -2.214599, 1, 1, 1, 1, 1,
-0.9056673, -0.2199359, -1.346904, 1, 1, 1, 1, 1,
-0.9054861, -0.5314115, -1.795728, 0, 0, 1, 1, 1,
-0.8908119, -1.096023, -1.921197, 1, 0, 0, 1, 1,
-0.8897551, 0.9073416, -0.7279753, 1, 0, 0, 1, 1,
-0.8885308, -0.7496173, -1.10983, 1, 0, 0, 1, 1,
-0.8855603, -0.6998345, -2.476901, 1, 0, 0, 1, 1,
-0.8851992, -0.2657017, -1.408604, 1, 0, 0, 1, 1,
-0.8803223, -0.05096345, -1.745329, 0, 0, 0, 1, 1,
-0.8767337, -0.237987, -3.656874, 0, 0, 0, 1, 1,
-0.8761067, 1.070477, 0.5773072, 0, 0, 0, 1, 1,
-0.8742435, 0.4012886, -3.913577, 0, 0, 0, 1, 1,
-0.8735402, 0.7481437, -0.4816474, 0, 0, 0, 1, 1,
-0.8618713, 1.328284, -0.3770064, 0, 0, 0, 1, 1,
-0.8541373, -0.128723, -2.263414, 0, 0, 0, 1, 1,
-0.8530872, -0.8421963, -3.297789, 1, 1, 1, 1, 1,
-0.8528329, 0.5605156, -2.015743, 1, 1, 1, 1, 1,
-0.8525385, -0.6339037, -2.128189, 1, 1, 1, 1, 1,
-0.8507349, -0.1968343, -1.668458, 1, 1, 1, 1, 1,
-0.8458669, 0.02622183, -0.324587, 1, 1, 1, 1, 1,
-0.8442775, 1.664872, -0.3623541, 1, 1, 1, 1, 1,
-0.8268245, -0.9341738, -0.7992752, 1, 1, 1, 1, 1,
-0.8251767, 1.099246, -1.953775, 1, 1, 1, 1, 1,
-0.8222535, 1.530135, -1.205067, 1, 1, 1, 1, 1,
-0.817166, 1.724173, -0.6060921, 1, 1, 1, 1, 1,
-0.8118958, -1.103402, -3.019162, 1, 1, 1, 1, 1,
-0.8107806, 0.650592, -1.447334, 1, 1, 1, 1, 1,
-0.8105467, 0.622488, -1.09985, 1, 1, 1, 1, 1,
-0.8085494, -0.5703641, -1.934236, 1, 1, 1, 1, 1,
-0.8034275, -1.17406, -0.8354769, 1, 1, 1, 1, 1,
-0.8001653, -0.2310696, -0.9160282, 0, 0, 1, 1, 1,
-0.7983521, 0.4505332, -0.6988667, 1, 0, 0, 1, 1,
-0.7930739, 1.733675, -1.356053, 1, 0, 0, 1, 1,
-0.7885619, 0.6538936, -1.876335, 1, 0, 0, 1, 1,
-0.7818725, -0.7851193, -1.209833, 1, 0, 0, 1, 1,
-0.7813163, -0.5712958, -2.488415, 1, 0, 0, 1, 1,
-0.7770861, 0.6927173, -1.272908, 0, 0, 0, 1, 1,
-0.7770784, 1.550644, 0.9335088, 0, 0, 0, 1, 1,
-0.7710056, -0.2278205, -1.44095, 0, 0, 0, 1, 1,
-0.7671856, -0.1454907, -0.5898699, 0, 0, 0, 1, 1,
-0.7607786, 0.6817333, -0.1124652, 0, 0, 0, 1, 1,
-0.756806, -1.06359, -2.835639, 0, 0, 0, 1, 1,
-0.7557831, 0.8278372, -1.141338, 0, 0, 0, 1, 1,
-0.7489778, 0.8785353, -1.606258, 1, 1, 1, 1, 1,
-0.7434181, -0.1766567, -0.4182047, 1, 1, 1, 1, 1,
-0.7400677, 0.744998, -3.251436, 1, 1, 1, 1, 1,
-0.7377647, 0.005306597, -2.091166, 1, 1, 1, 1, 1,
-0.7319438, 1.575312, -1.56457, 1, 1, 1, 1, 1,
-0.7187213, -0.3480617, -1.286306, 1, 1, 1, 1, 1,
-0.7145565, -0.04386085, -3.848282, 1, 1, 1, 1, 1,
-0.7131033, -0.2884718, -2.490484, 1, 1, 1, 1, 1,
-0.7113347, 0.632716, -1.17818, 1, 1, 1, 1, 1,
-0.7101041, 2.480809, -0.1259402, 1, 1, 1, 1, 1,
-0.7088689, 0.6781402, -0.9270865, 1, 1, 1, 1, 1,
-0.708658, 0.7805508, -0.9449301, 1, 1, 1, 1, 1,
-0.7083865, 0.4997535, -1.171781, 1, 1, 1, 1, 1,
-0.7073818, 0.3787784, 0.0263093, 1, 1, 1, 1, 1,
-0.7002733, 0.5493155, 0.7963644, 1, 1, 1, 1, 1,
-0.6982005, -0.3342967, -1.876281, 0, 0, 1, 1, 1,
-0.6919754, -1.389992, -2.519801, 1, 0, 0, 1, 1,
-0.690044, -0.2052378, -1.534766, 1, 0, 0, 1, 1,
-0.688089, 0.4671341, -1.778361, 1, 0, 0, 1, 1,
-0.6861269, 0.592664, 0.3318345, 1, 0, 0, 1, 1,
-0.6824641, -1.828528, -3.018506, 1, 0, 0, 1, 1,
-0.6704969, 0.2863672, -2.45195, 0, 0, 0, 1, 1,
-0.6704936, -0.2422495, -1.966157, 0, 0, 0, 1, 1,
-0.6698092, -0.2513943, -2.800806, 0, 0, 0, 1, 1,
-0.6643782, -1.252175, -1.798306, 0, 0, 0, 1, 1,
-0.6621916, 0.6107231, -0.8477397, 0, 0, 0, 1, 1,
-0.659866, -0.1773765, -0.9269279, 0, 0, 0, 1, 1,
-0.6551801, 0.987726, -0.08148443, 0, 0, 0, 1, 1,
-0.6517978, -0.5968693, -3.63054, 1, 1, 1, 1, 1,
-0.6509892, -0.5808287, -2.40331, 1, 1, 1, 1, 1,
-0.6507617, 0.03004939, -2.967932, 1, 1, 1, 1, 1,
-0.6502088, -0.7781903, -2.335523, 1, 1, 1, 1, 1,
-0.649061, -0.2769774, -2.057636, 1, 1, 1, 1, 1,
-0.6401306, -0.5633192, -1.711216, 1, 1, 1, 1, 1,
-0.6372401, 0.3248787, -1.845623, 1, 1, 1, 1, 1,
-0.6326667, -2.167128, -3.346171, 1, 1, 1, 1, 1,
-0.6320185, -0.4242451, -3.506852, 1, 1, 1, 1, 1,
-0.6310959, -1.346022, -2.588342, 1, 1, 1, 1, 1,
-0.6310789, 0.5856518, -1.810089, 1, 1, 1, 1, 1,
-0.6301713, -1.095807, -1.68363, 1, 1, 1, 1, 1,
-0.6264166, 1.136844, 0.8869148, 1, 1, 1, 1, 1,
-0.6258669, -0.5148598, -2.314072, 1, 1, 1, 1, 1,
-0.6229516, 1.344284, 0.05333573, 1, 1, 1, 1, 1,
-0.6215593, 1.117869, -1.911871, 0, 0, 1, 1, 1,
-0.6211647, -0.5088025, -2.811789, 1, 0, 0, 1, 1,
-0.6201194, 0.2470258, -1.971653, 1, 0, 0, 1, 1,
-0.6136575, 0.4352805, -1.302125, 1, 0, 0, 1, 1,
-0.6097015, 1.025994, -2.050716, 1, 0, 0, 1, 1,
-0.6034614, 0.6675591, 1.189792, 1, 0, 0, 1, 1,
-0.6013087, -0.5095568, -2.460015, 0, 0, 0, 1, 1,
-0.5984348, 0.44728, -0.7055721, 0, 0, 0, 1, 1,
-0.595722, -0.4809007, -1.816399, 0, 0, 0, 1, 1,
-0.5902689, 1.235801, 1.25514, 0, 0, 0, 1, 1,
-0.5895146, 0.08662007, -0.9285771, 0, 0, 0, 1, 1,
-0.5884112, -0.9632943, -2.945179, 0, 0, 0, 1, 1,
-0.5839342, -0.9867452, -1.92348, 0, 0, 0, 1, 1,
-0.5838831, 1.816418, -1.21761, 1, 1, 1, 1, 1,
-0.5798696, -0.808283, -2.112296, 1, 1, 1, 1, 1,
-0.5788442, -2.047573, -2.393078, 1, 1, 1, 1, 1,
-0.5752975, -0.3663631, -2.352903, 1, 1, 1, 1, 1,
-0.5722032, 0.5221698, -2.010082, 1, 1, 1, 1, 1,
-0.5715808, 0.6749519, -1.067749, 1, 1, 1, 1, 1,
-0.5703115, -0.7900623, -4.186832, 1, 1, 1, 1, 1,
-0.5702182, -0.5141824, -0.5941378, 1, 1, 1, 1, 1,
-0.5646787, -0.4387042, -1.77731, 1, 1, 1, 1, 1,
-0.5531285, 0.4492452, -1.670571, 1, 1, 1, 1, 1,
-0.5506176, 0.9995261, -0.9096947, 1, 1, 1, 1, 1,
-0.5488809, 1.181434, -0.07464723, 1, 1, 1, 1, 1,
-0.5487863, -0.2990159, -2.006352, 1, 1, 1, 1, 1,
-0.541109, 0.2167905, 0.04917114, 1, 1, 1, 1, 1,
-0.5407548, 0.6385462, -1.080571, 1, 1, 1, 1, 1,
-0.5375774, 0.7446984, -1.999465, 0, 0, 1, 1, 1,
-0.5357462, 1.2534, -0.5887854, 1, 0, 0, 1, 1,
-0.5343105, -1.936911, -4.248801, 1, 0, 0, 1, 1,
-0.5233328, -0.7756116, -1.447549, 1, 0, 0, 1, 1,
-0.5232408, 0.7885213, -1.106623, 1, 0, 0, 1, 1,
-0.5194303, -0.2626534, -3.459618, 1, 0, 0, 1, 1,
-0.5121089, -0.5933396, -0.04752015, 0, 0, 0, 1, 1,
-0.509784, -0.155334, -2.266386, 0, 0, 0, 1, 1,
-0.5074488, 0.1890006, -1.872665, 0, 0, 0, 1, 1,
-0.5059921, 1.434304, 0.4273438, 0, 0, 0, 1, 1,
-0.5046095, 1.122062, -0.7421678, 0, 0, 0, 1, 1,
-0.4988296, -0.7715096, -2.940482, 0, 0, 0, 1, 1,
-0.4960728, 1.707996, 0.6884701, 0, 0, 0, 1, 1,
-0.4932007, -0.5697966, -1.758065, 1, 1, 1, 1, 1,
-0.4920161, 0.2289054, -0.5876307, 1, 1, 1, 1, 1,
-0.4902842, 0.07402611, -3.129395, 1, 1, 1, 1, 1,
-0.4892701, 0.07909649, -1.22739, 1, 1, 1, 1, 1,
-0.4882234, -0.8162003, -0.7874792, 1, 1, 1, 1, 1,
-0.4872299, -0.04747005, -2.642324, 1, 1, 1, 1, 1,
-0.4784291, 1.639892, 0.1107906, 1, 1, 1, 1, 1,
-0.4783902, 0.5113575, 0.00254999, 1, 1, 1, 1, 1,
-0.4696967, -0.1781645, -2.378744, 1, 1, 1, 1, 1,
-0.4690002, -0.966669, -2.894083, 1, 1, 1, 1, 1,
-0.4644451, 0.5733659, 0.248826, 1, 1, 1, 1, 1,
-0.4585504, 0.3586335, 0.09954157, 1, 1, 1, 1, 1,
-0.4580954, 2.099137, -0.6955051, 1, 1, 1, 1, 1,
-0.447444, -2.135185, -1.84584, 1, 1, 1, 1, 1,
-0.445531, -0.1906279, -3.345453, 1, 1, 1, 1, 1,
-0.4451941, 0.2956132, -1.428194, 0, 0, 1, 1, 1,
-0.442461, -1.584028, -2.560125, 1, 0, 0, 1, 1,
-0.441655, -1.011386, -2.831777, 1, 0, 0, 1, 1,
-0.4413238, -1.079226, -2.720855, 1, 0, 0, 1, 1,
-0.4340181, 0.6541581, 0.9035395, 1, 0, 0, 1, 1,
-0.4261154, -2.440217, -3.57745, 1, 0, 0, 1, 1,
-0.4248433, 0.8893142, 0.9932822, 0, 0, 0, 1, 1,
-0.4234005, -0.06315516, -1.717728, 0, 0, 0, 1, 1,
-0.4221258, 1.907155, -0.8460752, 0, 0, 0, 1, 1,
-0.4182816, 1.710227, 1.116907, 0, 0, 0, 1, 1,
-0.4165751, -0.5138848, -2.178159, 0, 0, 0, 1, 1,
-0.416095, 0.549908, -0.7728466, 0, 0, 0, 1, 1,
-0.4160051, -0.6691515, -3.496722, 0, 0, 0, 1, 1,
-0.4153766, -0.01887629, -1.944642, 1, 1, 1, 1, 1,
-0.4151365, -1.771614, -3.282594, 1, 1, 1, 1, 1,
-0.4148018, -0.3342512, -2.599057, 1, 1, 1, 1, 1,
-0.413202, -1.05364, -2.937011, 1, 1, 1, 1, 1,
-0.4110953, -0.4703638, -2.82142, 1, 1, 1, 1, 1,
-0.4110004, 0.8133582, -0.2382003, 1, 1, 1, 1, 1,
-0.4105181, 2.289044, 0.1929017, 1, 1, 1, 1, 1,
-0.4081704, -0.8102787, -1.940541, 1, 1, 1, 1, 1,
-0.4077483, -1.42184, -0.8860974, 1, 1, 1, 1, 1,
-0.4057761, -0.2100891, -2.19417, 1, 1, 1, 1, 1,
-0.4030023, -1.313929, -1.981491, 1, 1, 1, 1, 1,
-0.3966222, -0.9448845, -1.736013, 1, 1, 1, 1, 1,
-0.3949362, -1.733402, -5.190537, 1, 1, 1, 1, 1,
-0.3911926, -0.6084045, -2.232078, 1, 1, 1, 1, 1,
-0.3888985, 1.200106, 0.6442366, 1, 1, 1, 1, 1,
-0.3886889, 0.5751298, -1.481198, 0, 0, 1, 1, 1,
-0.3864345, -1.639256, -4.872679, 1, 0, 0, 1, 1,
-0.3846584, -1.151465, -2.856033, 1, 0, 0, 1, 1,
-0.3823631, 0.2240418, -1.503364, 1, 0, 0, 1, 1,
-0.3802519, 0.9592314, -1.280847, 1, 0, 0, 1, 1,
-0.3794992, -1.532689, -1.708064, 1, 0, 0, 1, 1,
-0.3788174, -0.6938416, -3.165768, 0, 0, 0, 1, 1,
-0.3761675, 0.7889256, -1.099673, 0, 0, 0, 1, 1,
-0.3704938, -1.030628, -2.239475, 0, 0, 0, 1, 1,
-0.3690001, 0.6706225, 1.031137, 0, 0, 0, 1, 1,
-0.3687486, -1.111079, -3.969656, 0, 0, 0, 1, 1,
-0.3658896, -0.931102, -4.38214, 0, 0, 0, 1, 1,
-0.3604889, -0.8144407, -3.150699, 0, 0, 0, 1, 1,
-0.3483722, 1.336776, -0.5450879, 1, 1, 1, 1, 1,
-0.3432948, 0.8877608, -0.7508519, 1, 1, 1, 1, 1,
-0.3368856, 0.2550338, -2.153017, 1, 1, 1, 1, 1,
-0.33653, 1.792269, 0.2400554, 1, 1, 1, 1, 1,
-0.3365207, -0.2462456, 0.5539385, 1, 1, 1, 1, 1,
-0.3363426, -0.3930003, -2.300507, 1, 1, 1, 1, 1,
-0.3357436, 0.2506364, -0.9985626, 1, 1, 1, 1, 1,
-0.3347151, 0.7334565, -0.9839836, 1, 1, 1, 1, 1,
-0.3342348, 0.7385938, -0.3888976, 1, 1, 1, 1, 1,
-0.3299918, -0.7491689, -3.709805, 1, 1, 1, 1, 1,
-0.3197605, -0.7078558, -2.717643, 1, 1, 1, 1, 1,
-0.3162419, -0.924005, -2.824641, 1, 1, 1, 1, 1,
-0.3136742, -0.1906779, -3.106371, 1, 1, 1, 1, 1,
-0.3082924, 0.5808601, -0.9509664, 1, 1, 1, 1, 1,
-0.3073997, -0.4255019, -3.425471, 1, 1, 1, 1, 1,
-0.3033572, 0.4368135, 0.8585966, 0, 0, 1, 1, 1,
-0.3030745, -0.2259645, -2.382287, 1, 0, 0, 1, 1,
-0.3026107, -1.062744, -4.014892, 1, 0, 0, 1, 1,
-0.2992096, -1.477173, -3.857078, 1, 0, 0, 1, 1,
-0.29871, -1.232112, -2.9926, 1, 0, 0, 1, 1,
-0.2986585, 0.4468563, -1.537185, 1, 0, 0, 1, 1,
-0.2950536, 1.405434, -0.0197602, 0, 0, 0, 1, 1,
-0.2938667, -0.9777673, -2.478326, 0, 0, 0, 1, 1,
-0.2923034, -0.5764212, -2.734819, 0, 0, 0, 1, 1,
-0.2903757, 0.4813656, -1.57379, 0, 0, 0, 1, 1,
-0.2883826, 1.737612, -0.1921852, 0, 0, 0, 1, 1,
-0.2857696, -1.2273, -1.925043, 0, 0, 0, 1, 1,
-0.2838836, 0.6437176, -0.60665, 0, 0, 0, 1, 1,
-0.2819214, -1.79834, -3.248528, 1, 1, 1, 1, 1,
-0.2818295, -0.01041369, -1.573151, 1, 1, 1, 1, 1,
-0.278817, -1.519786, -2.654625, 1, 1, 1, 1, 1,
-0.2779376, -0.7124865, -2.850477, 1, 1, 1, 1, 1,
-0.2779165, -0.09578741, -2.2434, 1, 1, 1, 1, 1,
-0.2755807, 1.153927, 0.9495096, 1, 1, 1, 1, 1,
-0.2715246, 0.8517081, 0.1694734, 1, 1, 1, 1, 1,
-0.2702782, 0.181048, -2.664205, 1, 1, 1, 1, 1,
-0.2639426, 0.06996824, -0.719017, 1, 1, 1, 1, 1,
-0.2615149, 0.4881319, -0.9353704, 1, 1, 1, 1, 1,
-0.2578725, -0.6154507, -2.432076, 1, 1, 1, 1, 1,
-0.2554559, -1.893449, -3.229818, 1, 1, 1, 1, 1,
-0.2552862, -0.2936431, -1.654211, 1, 1, 1, 1, 1,
-0.250328, -1.130608, -2.754717, 1, 1, 1, 1, 1,
-0.248823, -1.317344, -3.300055, 1, 1, 1, 1, 1,
-0.2453861, -1.04878, -4.959822, 0, 0, 1, 1, 1,
-0.2379945, 0.9947419, -1.271978, 1, 0, 0, 1, 1,
-0.2375238, 0.5586772, 0.5400034, 1, 0, 0, 1, 1,
-0.2359503, 0.6544076, -1.947867, 1, 0, 0, 1, 1,
-0.2339492, -1.796517, -3.031155, 1, 0, 0, 1, 1,
-0.2328761, 0.407783, 0.2233735, 1, 0, 0, 1, 1,
-0.2303422, 0.4726992, -0.1453951, 0, 0, 0, 1, 1,
-0.2295451, -0.6157212, -3.293633, 0, 0, 0, 1, 1,
-0.2289136, -0.6460556, -2.258743, 0, 0, 0, 1, 1,
-0.2221482, 0.6066016, -0.3581526, 0, 0, 0, 1, 1,
-0.2174165, 0.9989864, -1.05749, 0, 0, 0, 1, 1,
-0.2136505, 0.286321, -0.9085376, 0, 0, 0, 1, 1,
-0.2122528, 0.1994696, -0.2793179, 0, 0, 0, 1, 1,
-0.2079939, -0.2747269, -2.123165, 1, 1, 1, 1, 1,
-0.204258, -0.5900862, -2.087469, 1, 1, 1, 1, 1,
-0.2009584, -0.2044658, -3.509197, 1, 1, 1, 1, 1,
-0.1970796, 0.6169105, -1.991918, 1, 1, 1, 1, 1,
-0.1961169, -0.7713036, -2.574787, 1, 1, 1, 1, 1,
-0.1960849, -1.436384, -2.679958, 1, 1, 1, 1, 1,
-0.1953222, -0.03750001, -3.174187, 1, 1, 1, 1, 1,
-0.1932761, -0.261568, -2.706727, 1, 1, 1, 1, 1,
-0.1929297, 1.553053, -0.3228939, 1, 1, 1, 1, 1,
-0.1912604, 0.7702324, -0.4873715, 1, 1, 1, 1, 1,
-0.1907747, -1.268283, -3.715259, 1, 1, 1, 1, 1,
-0.1898617, -1.055023, -3.688628, 1, 1, 1, 1, 1,
-0.1866277, -0.02330276, -1.524229, 1, 1, 1, 1, 1,
-0.1863596, -0.6498346, -3.979913, 1, 1, 1, 1, 1,
-0.1848494, -0.332853, -3.446409, 1, 1, 1, 1, 1,
-0.1840321, -0.5525045, -2.202407, 0, 0, 1, 1, 1,
-0.1837164, 0.200555, -0.1131997, 1, 0, 0, 1, 1,
-0.1724756, 1.30862, -0.7740802, 1, 0, 0, 1, 1,
-0.1689722, 0.7772815, 0.08412027, 1, 0, 0, 1, 1,
-0.1672106, 0.1166667, -1.187277, 1, 0, 0, 1, 1,
-0.1645745, 0.1500935, -1.587982, 1, 0, 0, 1, 1,
-0.1626711, -0.9082431, -3.506351, 0, 0, 0, 1, 1,
-0.1613671, 0.6959937, -0.8095418, 0, 0, 0, 1, 1,
-0.1604305, -0.6526313, -1.381344, 0, 0, 0, 1, 1,
-0.1595147, 0.36911, -1.680042, 0, 0, 0, 1, 1,
-0.1572582, 0.340544, -0.5472444, 0, 0, 0, 1, 1,
-0.1559581, -1.239039, -3.052571, 0, 0, 0, 1, 1,
-0.1548251, -0.3285788, -3.828642, 0, 0, 0, 1, 1,
-0.150924, -0.3082597, -1.738915, 1, 1, 1, 1, 1,
-0.1491622, 1.064372, -0.7707667, 1, 1, 1, 1, 1,
-0.1476735, 0.9207712, -0.2943717, 1, 1, 1, 1, 1,
-0.1449732, 0.7834752, -0.6525002, 1, 1, 1, 1, 1,
-0.1414719, 0.2357177, -1.001969, 1, 1, 1, 1, 1,
-0.1334215, 0.09235095, -0.7839128, 1, 1, 1, 1, 1,
-0.1319079, 1.609949, 1.328005, 1, 1, 1, 1, 1,
-0.1294581, 2.233362, -0.3635522, 1, 1, 1, 1, 1,
-0.1255738, -0.6493768, -2.78303, 1, 1, 1, 1, 1,
-0.1232583, 0.05916482, -1.38798, 1, 1, 1, 1, 1,
-0.1210655, -0.09740208, -1.684772, 1, 1, 1, 1, 1,
-0.1202144, 0.3554121, -0.6334464, 1, 1, 1, 1, 1,
-0.1122424, -0.03149847, -2.90654, 1, 1, 1, 1, 1,
-0.1068615, -1.022774, -4.097373, 1, 1, 1, 1, 1,
-0.1013549, 0.2677574, 0.5730212, 1, 1, 1, 1, 1,
-0.09449598, 0.4431446, 0.8649157, 0, 0, 1, 1, 1,
-0.09157647, 1.259082, 0.09471816, 1, 0, 0, 1, 1,
-0.09108423, -1.433381, -3.624283, 1, 0, 0, 1, 1,
-0.088066, 0.6826252, -0.4121485, 1, 0, 0, 1, 1,
-0.08269846, -0.1107508, -2.811113, 1, 0, 0, 1, 1,
-0.08169683, -0.6364412, -1.303709, 1, 0, 0, 1, 1,
-0.07974229, 0.6213076, 0.3363419, 0, 0, 0, 1, 1,
-0.07623621, 0.5052965, 0.8739935, 0, 0, 0, 1, 1,
-0.07425653, -0.4344785, -3.28503, 0, 0, 0, 1, 1,
-0.0735068, 2.117215, -0.6614076, 0, 0, 0, 1, 1,
-0.07337283, -0.4234304, -5.208605, 0, 0, 0, 1, 1,
-0.06771106, -0.1226617, -1.960552, 0, 0, 0, 1, 1,
-0.06598108, 0.2488099, -1.026506, 0, 0, 0, 1, 1,
-0.05930687, 0.4082568, -0.9679028, 1, 1, 1, 1, 1,
-0.05594864, -0.3008516, -3.068046, 1, 1, 1, 1, 1,
-0.05470075, -0.5822319, -1.931699, 1, 1, 1, 1, 1,
-0.05187191, 0.1807134, -1.062752, 1, 1, 1, 1, 1,
-0.05167707, 0.9868542, 0.5791544, 1, 1, 1, 1, 1,
-0.04859827, -1.006867, -2.583517, 1, 1, 1, 1, 1,
-0.04589837, -1.278142, -2.191737, 1, 1, 1, 1, 1,
-0.0435675, 0.5213266, 1.066515, 1, 1, 1, 1, 1,
-0.04300893, 0.4835482, 0.700661, 1, 1, 1, 1, 1,
-0.04203038, -1.92131, -4.129991, 1, 1, 1, 1, 1,
-0.03619049, -0.6119444, -3.019787, 1, 1, 1, 1, 1,
-0.03096278, 0.02913705, -1.514812, 1, 1, 1, 1, 1,
-0.02718758, 0.3976928, 1.649575, 1, 1, 1, 1, 1,
-0.02707076, -1.229761, -3.578991, 1, 1, 1, 1, 1,
-0.02574008, 0.4310987, -1.831357, 1, 1, 1, 1, 1,
-0.02178572, -0.07246255, -3.900296, 0, 0, 1, 1, 1,
-0.01919186, 0.1843179, 2.350257, 1, 0, 0, 1, 1,
-0.01461408, -0.5270566, -3.764363, 1, 0, 0, 1, 1,
-0.0132339, -0.3930902, -1.738672, 1, 0, 0, 1, 1,
-0.01074078, 1.3077, 0.5995701, 1, 0, 0, 1, 1,
-0.009603434, -0.4815681, -3.465194, 1, 0, 0, 1, 1,
-0.001481412, 0.9698661, 1.020239, 0, 0, 0, 1, 1,
0.002301774, -0.1251569, 2.494689, 0, 0, 0, 1, 1,
0.008060656, 2.304133, -1.872696, 0, 0, 0, 1, 1,
0.0157629, -0.288358, 0.2000413, 0, 0, 0, 1, 1,
0.01634128, -1.468397, 3.079882, 0, 0, 0, 1, 1,
0.02641578, 0.7847738, -1.457995, 0, 0, 0, 1, 1,
0.02970261, 0.5410754, -0.7598863, 0, 0, 0, 1, 1,
0.03003872, -0.5657933, 3.35793, 1, 1, 1, 1, 1,
0.03155491, 0.2533443, -0.8294393, 1, 1, 1, 1, 1,
0.03668496, 0.4720284, -0.4704401, 1, 1, 1, 1, 1,
0.03744137, 0.9214644, 0.3803969, 1, 1, 1, 1, 1,
0.039319, 1.013494, -0.5595566, 1, 1, 1, 1, 1,
0.04141232, 1.050432, -2.805654, 1, 1, 1, 1, 1,
0.04682086, -1.209673, 1.824107, 1, 1, 1, 1, 1,
0.04962982, -1.964851, 2.676045, 1, 1, 1, 1, 1,
0.05128917, 1.235524, -1.407016, 1, 1, 1, 1, 1,
0.05166353, 1.160367, -0.09189912, 1, 1, 1, 1, 1,
0.05374977, -1.190629, 4.672088, 1, 1, 1, 1, 1,
0.0615913, -2.060943, 3.873604, 1, 1, 1, 1, 1,
0.06519667, -0.3314241, 3.474945, 1, 1, 1, 1, 1,
0.06523461, 0.06611583, -0.6082853, 1, 1, 1, 1, 1,
0.06862197, -0.04283832, 3.523098, 1, 1, 1, 1, 1,
0.06877542, -1.849388, 3.105036, 0, 0, 1, 1, 1,
0.06907022, 0.7518895, -0.08824883, 1, 0, 0, 1, 1,
0.07585634, -1.482363, 2.555755, 1, 0, 0, 1, 1,
0.07588749, 0.5705884, 0.5912108, 1, 0, 0, 1, 1,
0.07816762, -1.499218, 3.787443, 1, 0, 0, 1, 1,
0.08710218, -1.365404, 3.506274, 1, 0, 0, 1, 1,
0.08715789, 0.5981146, -0.6966822, 0, 0, 0, 1, 1,
0.09178112, 0.9678658, -0.3762366, 0, 0, 0, 1, 1,
0.09354804, 0.1311303, 1.931419, 0, 0, 0, 1, 1,
0.09558818, 1.662394, -1.351992, 0, 0, 0, 1, 1,
0.09737424, 0.217023, -0.4908092, 0, 0, 0, 1, 1,
0.1010474, 0.6747701, -0.7335129, 0, 0, 0, 1, 1,
0.1010983, 0.2011198, 0.6531459, 0, 0, 0, 1, 1,
0.1041281, 0.2480675, -0.2171951, 1, 1, 1, 1, 1,
0.1053653, -1.665851, 1.101367, 1, 1, 1, 1, 1,
0.1062085, 0.9610183, 0.3053835, 1, 1, 1, 1, 1,
0.1065622, 0.3614412, -0.4388061, 1, 1, 1, 1, 1,
0.1113458, 1.214466, 1.069188, 1, 1, 1, 1, 1,
0.1132426, -0.07977983, 1.823775, 1, 1, 1, 1, 1,
0.1165545, -0.2046175, 1.959641, 1, 1, 1, 1, 1,
0.1280596, 0.02275368, 2.191829, 1, 1, 1, 1, 1,
0.1305518, -0.08894379, 3.068866, 1, 1, 1, 1, 1,
0.1327935, 1.313781, -0.2931864, 1, 1, 1, 1, 1,
0.1346356, -0.411403, 2.160722, 1, 1, 1, 1, 1,
0.1366866, 0.2787202, 0.3080408, 1, 1, 1, 1, 1,
0.1433193, 0.8344762, 0.2261072, 1, 1, 1, 1, 1,
0.1454465, 1.846706, -0.7424222, 1, 1, 1, 1, 1,
0.1456736, 0.05242981, 0.04306283, 1, 1, 1, 1, 1,
0.1473923, -0.1464972, -0.3474261, 0, 0, 1, 1, 1,
0.1504167, -1.082141, 4.755891, 1, 0, 0, 1, 1,
0.1527239, -0.7076062, 3.619651, 1, 0, 0, 1, 1,
0.1538475, 0.6903824, 0.7829248, 1, 0, 0, 1, 1,
0.1544848, -0.08532266, 2.146702, 1, 0, 0, 1, 1,
0.15561, -0.6963436, 2.495449, 1, 0, 0, 1, 1,
0.1602165, 1.475691, -0.5469465, 0, 0, 0, 1, 1,
0.1614808, -0.5609332, 5.470863, 0, 0, 0, 1, 1,
0.1628777, -1.941092, 1.730908, 0, 0, 0, 1, 1,
0.1652863, 2.032322, 1.000132, 0, 0, 0, 1, 1,
0.1679792, 0.03411029, 1.664942, 0, 0, 0, 1, 1,
0.1745584, -0.5124617, 2.333336, 0, 0, 0, 1, 1,
0.1816473, 1.431381, 0.2646707, 0, 0, 0, 1, 1,
0.1889057, 0.4847336, -0.5894758, 1, 1, 1, 1, 1,
0.1944271, -1.335452, 2.889466, 1, 1, 1, 1, 1,
0.1948882, 1.861643, -0.04060667, 1, 1, 1, 1, 1,
0.1956179, -0.7715141, 2.130355, 1, 1, 1, 1, 1,
0.201278, -1.236413, 3.487943, 1, 1, 1, 1, 1,
0.2028226, -1.242856, 2.748602, 1, 1, 1, 1, 1,
0.2030764, -0.2998346, 1.402477, 1, 1, 1, 1, 1,
0.2074655, 0.2609916, 1.911863, 1, 1, 1, 1, 1,
0.2079684, 0.2609059, -0.02981496, 1, 1, 1, 1, 1,
0.2091203, -0.3454868, 4.044429, 1, 1, 1, 1, 1,
0.2112026, -0.6789978, 3.883236, 1, 1, 1, 1, 1,
0.213212, 0.1229937, 2.132535, 1, 1, 1, 1, 1,
0.2176151, 0.9953972, 2.681755, 1, 1, 1, 1, 1,
0.2190008, -1.597851, 3.176642, 1, 1, 1, 1, 1,
0.2231526, 0.756507, 1.078469, 1, 1, 1, 1, 1,
0.2233063, 0.5074046, -0.00927634, 0, 0, 1, 1, 1,
0.2236218, -0.7966106, 2.931574, 1, 0, 0, 1, 1,
0.2248486, 0.2026305, -1.077224, 1, 0, 0, 1, 1,
0.22604, 1.02819, 0.3944976, 1, 0, 0, 1, 1,
0.2304209, -1.246872, 2.477385, 1, 0, 0, 1, 1,
0.2351922, -0.5805964, 0.9822978, 1, 0, 0, 1, 1,
0.2366784, -0.8775719, 2.468123, 0, 0, 0, 1, 1,
0.2392616, -0.7424505, 2.944014, 0, 0, 0, 1, 1,
0.2442717, -0.1999314, 2.522591, 0, 0, 0, 1, 1,
0.2460582, 0.521023, -0.00453613, 0, 0, 0, 1, 1,
0.2490402, 0.16768, 1.921467, 0, 0, 0, 1, 1,
0.249886, -1.197933, 3.308812, 0, 0, 0, 1, 1,
0.2534437, 1.105816, 1.042277, 0, 0, 0, 1, 1,
0.2570827, 1.252754, -1.326645, 1, 1, 1, 1, 1,
0.2581677, -0.316128, 1.586048, 1, 1, 1, 1, 1,
0.2652858, 1.66976, 0.6178301, 1, 1, 1, 1, 1,
0.2653293, -0.3526255, 1.045458, 1, 1, 1, 1, 1,
0.2663262, 0.6109074, 1.369194, 1, 1, 1, 1, 1,
0.2672607, 0.1404071, 0.4405264, 1, 1, 1, 1, 1,
0.269267, 1.113026, 0.6297883, 1, 1, 1, 1, 1,
0.2704541, -0.106694, 2.749497, 1, 1, 1, 1, 1,
0.2705979, 0.6320265, -0.1883969, 1, 1, 1, 1, 1,
0.2740744, -1.664065, 3.774534, 1, 1, 1, 1, 1,
0.2743149, -1.176191, 2.238953, 1, 1, 1, 1, 1,
0.276427, 0.61275, -1.538949, 1, 1, 1, 1, 1,
0.2778801, -2.040827, 3.017409, 1, 1, 1, 1, 1,
0.2861629, -1.837852, 2.980588, 1, 1, 1, 1, 1,
0.2885212, 0.8713288, -0.9904536, 1, 1, 1, 1, 1,
0.2927169, 0.8322713, 0.579548, 0, 0, 1, 1, 1,
0.2932332, -0.9023219, 2.169691, 1, 0, 0, 1, 1,
0.2941579, -0.3447069, 3.054151, 1, 0, 0, 1, 1,
0.2944008, 1.482476, 0.6280241, 1, 0, 0, 1, 1,
0.2945724, 1.358628, 1.554106, 1, 0, 0, 1, 1,
0.2962852, -1.288794, 4.822895, 1, 0, 0, 1, 1,
0.3005292, 1.270633, 1.026492, 0, 0, 0, 1, 1,
0.3019891, 0.1009599, 2.855632, 0, 0, 0, 1, 1,
0.3047609, -0.4102518, 1.309564, 0, 0, 0, 1, 1,
0.3074188, -2.549738, 3.330489, 0, 0, 0, 1, 1,
0.3094335, 0.04872621, 2.134336, 0, 0, 0, 1, 1,
0.312094, -0.6970029, 1.137007, 0, 0, 0, 1, 1,
0.3130384, -0.1149803, 2.246081, 0, 0, 0, 1, 1,
0.3179449, -0.6620472, 2.321912, 1, 1, 1, 1, 1,
0.3186021, 0.3282056, 1.226208, 1, 1, 1, 1, 1,
0.3205778, -0.4430205, 4.278427, 1, 1, 1, 1, 1,
0.3249972, 0.988036, 0.700281, 1, 1, 1, 1, 1,
0.3313664, -1.317477, 3.72145, 1, 1, 1, 1, 1,
0.3320391, 0.2902007, -0.6497869, 1, 1, 1, 1, 1,
0.3395994, -1.541618, 2.82452, 1, 1, 1, 1, 1,
0.3398373, -0.8173875, 3.526248, 1, 1, 1, 1, 1,
0.3403571, 1.48059, 1.496126, 1, 1, 1, 1, 1,
0.3422573, -0.9364142, 1.480551, 1, 1, 1, 1, 1,
0.3428454, 1.284238, -0.7896938, 1, 1, 1, 1, 1,
0.3451868, -0.4614527, 1.323561, 1, 1, 1, 1, 1,
0.3483574, 0.232283, 2.422596, 1, 1, 1, 1, 1,
0.3563398, 0.4791252, 0.6496376, 1, 1, 1, 1, 1,
0.3566562, 0.7520543, 1.018812, 1, 1, 1, 1, 1,
0.357121, 1.801547, 0.2921452, 0, 0, 1, 1, 1,
0.3592332, 0.01401984, 0.7160557, 1, 0, 0, 1, 1,
0.3608049, -1.407136, 3.090038, 1, 0, 0, 1, 1,
0.3619473, -0.8032194, 2.493921, 1, 0, 0, 1, 1,
0.3632504, 0.09462349, 1.95994, 1, 0, 0, 1, 1,
0.3638461, 0.1359396, 0.4888364, 1, 0, 0, 1, 1,
0.3668348, 0.06954834, 2.725597, 0, 0, 0, 1, 1,
0.3688701, -0.5402434, 2.686678, 0, 0, 0, 1, 1,
0.3698985, 0.2116108, 1.455181, 0, 0, 0, 1, 1,
0.3720212, 0.07686877, 1.426751, 0, 0, 0, 1, 1,
0.378423, 1.516645, -2.983833, 0, 0, 0, 1, 1,
0.379656, 0.04876388, 0.9299151, 0, 0, 0, 1, 1,
0.3851395, -0.5709016, 1.433661, 0, 0, 0, 1, 1,
0.3855587, 1.116988, 1.136985, 1, 1, 1, 1, 1,
0.3900817, 0.7466186, 1.342339, 1, 1, 1, 1, 1,
0.3915919, -0.09488899, 3.402761, 1, 1, 1, 1, 1,
0.3964734, 1.386475, 1.700639, 1, 1, 1, 1, 1,
0.3993822, -0.5254387, 2.542277, 1, 1, 1, 1, 1,
0.3999138, 2.23126, -0.98226, 1, 1, 1, 1, 1,
0.4004818, 0.06672939, 1.148837, 1, 1, 1, 1, 1,
0.4019534, 1.545078, -0.2172723, 1, 1, 1, 1, 1,
0.4030431, -0.9635931, 1.936746, 1, 1, 1, 1, 1,
0.4073453, -1.285485, 2.097613, 1, 1, 1, 1, 1,
0.4105617, -0.09528811, 0.3006162, 1, 1, 1, 1, 1,
0.4143921, 0.8572785, -0.3078676, 1, 1, 1, 1, 1,
0.4169517, -0.6727275, 4.554756, 1, 1, 1, 1, 1,
0.4181158, -0.1413666, 0.9359233, 1, 1, 1, 1, 1,
0.4219021, 0.1427138, -0.300034, 1, 1, 1, 1, 1,
0.4277099, -0.6700078, 3.716057, 0, 0, 1, 1, 1,
0.4315872, 0.2620976, 0.4144575, 1, 0, 0, 1, 1,
0.433429, -0.04938167, 2.019625, 1, 0, 0, 1, 1,
0.434059, 0.1591749, 2.632036, 1, 0, 0, 1, 1,
0.4472409, -0.2346933, 4.267431, 1, 0, 0, 1, 1,
0.4477856, -0.08611625, 2.976326, 1, 0, 0, 1, 1,
0.4487712, -1.042444, 2.048971, 0, 0, 0, 1, 1,
0.4495929, 2.111098, -0.4555524, 0, 0, 0, 1, 1,
0.4520954, 2.189989, -1.725589, 0, 0, 0, 1, 1,
0.4545471, 1.532145, -0.123212, 0, 0, 0, 1, 1,
0.4557156, 1.452706, -0.306143, 0, 0, 0, 1, 1,
0.4643427, 0.942255, 1.756926, 0, 0, 0, 1, 1,
0.4670028, 1.671081, 1.28456, 0, 0, 0, 1, 1,
0.4690283, -1.083256, 2.396838, 1, 1, 1, 1, 1,
0.4697063, 1.556043, 1.370125, 1, 1, 1, 1, 1,
0.4730986, -1.538039, 0.9827409, 1, 1, 1, 1, 1,
0.474015, 0.03226391, 1.855762, 1, 1, 1, 1, 1,
0.4765678, 1.05546, 0.5285085, 1, 1, 1, 1, 1,
0.4781677, -0.3686315, 2.887392, 1, 1, 1, 1, 1,
0.4790974, 1.11754, 1.746918, 1, 1, 1, 1, 1,
0.4803059, -0.1442337, 3.506462, 1, 1, 1, 1, 1,
0.4804322, 0.2732598, 1.122074, 1, 1, 1, 1, 1,
0.4870245, 1.924955, 0.7769414, 1, 1, 1, 1, 1,
0.4882648, -0.7015708, 2.104222, 1, 1, 1, 1, 1,
0.4886555, -0.5390849, 2.022598, 1, 1, 1, 1, 1,
0.489094, 0.1160285, 2.265593, 1, 1, 1, 1, 1,
0.4899237, -0.6198179, 2.527932, 1, 1, 1, 1, 1,
0.4906345, 1.072573, 0.6313583, 1, 1, 1, 1, 1,
0.4938241, -0.4542482, 1.159284, 0, 0, 1, 1, 1,
0.5125859, -0.6455642, 3.022022, 1, 0, 0, 1, 1,
0.5145738, -1.729496, 2.337263, 1, 0, 0, 1, 1,
0.5161991, 0.03661302, 3.516011, 1, 0, 0, 1, 1,
0.5173039, 0.7182521, 1.796924, 1, 0, 0, 1, 1,
0.5187981, -0.9490094, 1.740162, 1, 0, 0, 1, 1,
0.5238709, -1.828242, 2.939772, 0, 0, 0, 1, 1,
0.5240568, 0.05700754, 3.520569, 0, 0, 0, 1, 1,
0.5297167, 1.980876, 0.2963679, 0, 0, 0, 1, 1,
0.5301741, 1.448488, 0.9600722, 0, 0, 0, 1, 1,
0.5381221, -0.4076205, 2.303627, 0, 0, 0, 1, 1,
0.5399808, 0.199991, 0.7768064, 0, 0, 0, 1, 1,
0.5406877, 0.04057408, 0.5207019, 0, 0, 0, 1, 1,
0.5439563, -0.4274209, 2.43983, 1, 1, 1, 1, 1,
0.5443428, 0.8395158, -1.297261, 1, 1, 1, 1, 1,
0.5458264, -0.08696161, 0.7289004, 1, 1, 1, 1, 1,
0.5481492, 1.091782, -0.4400357, 1, 1, 1, 1, 1,
0.5486805, 0.1480443, 1.213745, 1, 1, 1, 1, 1,
0.548921, -2.190211, 4.404577, 1, 1, 1, 1, 1,
0.553562, -0.9141442, 1.23462, 1, 1, 1, 1, 1,
0.5593091, -1.147796, 2.911616, 1, 1, 1, 1, 1,
0.5695431, -0.5663133, 1.268527, 1, 1, 1, 1, 1,
0.5719582, 0.9590414, 0.4520845, 1, 1, 1, 1, 1,
0.5724537, -0.2955226, 1.132726, 1, 1, 1, 1, 1,
0.5772073, -1.956001, 3.721855, 1, 1, 1, 1, 1,
0.582962, 1.544969, 0.9333763, 1, 1, 1, 1, 1,
0.5841342, 1.03371, -0.2042372, 1, 1, 1, 1, 1,
0.5853607, 0.827975, 0.05373836, 1, 1, 1, 1, 1,
0.5865658, -1.569919, 2.573515, 0, 0, 1, 1, 1,
0.5868949, 0.5755817, -0.7733669, 1, 0, 0, 1, 1,
0.5877507, 0.3156033, 1.300205, 1, 0, 0, 1, 1,
0.5935873, -0.727661, 0.02632565, 1, 0, 0, 1, 1,
0.6015244, -0.2462145, 0.2470742, 1, 0, 0, 1, 1,
0.6032524, -0.6246056, 1.810146, 1, 0, 0, 1, 1,
0.6047754, -0.5400294, 2.285837, 0, 0, 0, 1, 1,
0.6057696, 0.2284805, 1.94854, 0, 0, 0, 1, 1,
0.6058996, 1.483852, 0.6683818, 0, 0, 0, 1, 1,
0.610512, 1.11639, 3.284598, 0, 0, 0, 1, 1,
0.6190241, 0.2031724, 2.029703, 0, 0, 0, 1, 1,
0.6196845, -2.069181, 4.547846, 0, 0, 0, 1, 1,
0.6253688, -0.9426052, 1.624152, 0, 0, 0, 1, 1,
0.6271591, 1.019763, 3.175124, 1, 1, 1, 1, 1,
0.6289627, -0.3084748, 2.453627, 1, 1, 1, 1, 1,
0.6303722, -1.242154, 3.503426, 1, 1, 1, 1, 1,
0.6308194, -0.3539026, 2.421344, 1, 1, 1, 1, 1,
0.6339132, 0.5526533, 0.7123877, 1, 1, 1, 1, 1,
0.6362892, -0.2042973, 3.325801, 1, 1, 1, 1, 1,
0.6394482, 0.3622316, 1.033306, 1, 1, 1, 1, 1,
0.6493524, 0.0972096, 1.352655, 1, 1, 1, 1, 1,
0.6513734, -0.1539451, 1.538116, 1, 1, 1, 1, 1,
0.653133, 1.152658, 0.1371899, 1, 1, 1, 1, 1,
0.6532044, 0.7029416, 0.3107209, 1, 1, 1, 1, 1,
0.6553319, -1.319075, 2.501129, 1, 1, 1, 1, 1,
0.65949, 0.8115214, 1.031779, 1, 1, 1, 1, 1,
0.6618566, 0.05072216, 2.271812, 1, 1, 1, 1, 1,
0.6637041, 0.6086732, -0.4319293, 1, 1, 1, 1, 1,
0.6665337, 0.5879821, -0.1798744, 0, 0, 1, 1, 1,
0.6679692, 0.7695205, -1.579981, 1, 0, 0, 1, 1,
0.6690984, 0.3466456, 0.7939218, 1, 0, 0, 1, 1,
0.6713789, 0.5773069, -0.3123083, 1, 0, 0, 1, 1,
0.6738081, 0.1872756, 2.325724, 1, 0, 0, 1, 1,
0.6764805, 1.161363, 0.2449394, 1, 0, 0, 1, 1,
0.6804357, -0.7555978, 2.442316, 0, 0, 0, 1, 1,
0.6832955, 0.1418044, 0.2080921, 0, 0, 0, 1, 1,
0.6861584, -0.7187268, 0.9006086, 0, 0, 0, 1, 1,
0.6880949, -0.7667474, 2.83256, 0, 0, 0, 1, 1,
0.6906012, 0.05013062, 1.395837, 0, 0, 0, 1, 1,
0.6919625, -1.320894, 3.121576, 0, 0, 0, 1, 1,
0.6923813, 0.2117876, 1.301015, 0, 0, 0, 1, 1,
0.6955546, -1.137994, 3.456731, 1, 1, 1, 1, 1,
0.6959468, -0.2507038, 1.536771, 1, 1, 1, 1, 1,
0.697365, 1.538157, 1.178768, 1, 1, 1, 1, 1,
0.7016259, -0.7972535, 1.778869, 1, 1, 1, 1, 1,
0.7024992, 0.5150777, -0.7531173, 1, 1, 1, 1, 1,
0.7055433, -0.8726981, 2.645472, 1, 1, 1, 1, 1,
0.7088315, 0.6097657, 0.9257727, 1, 1, 1, 1, 1,
0.712316, 0.9497643, -0.6678591, 1, 1, 1, 1, 1,
0.7165233, -1.583264, 2.595158, 1, 1, 1, 1, 1,
0.7177124, 1.077148, -0.1252457, 1, 1, 1, 1, 1,
0.7267678, 0.2078215, 0.9784687, 1, 1, 1, 1, 1,
0.7274329, 0.5357152, 0.3425542, 1, 1, 1, 1, 1,
0.7412691, 0.1386598, 0.1947465, 1, 1, 1, 1, 1,
0.7463335, -1.345685, 2.055273, 1, 1, 1, 1, 1,
0.7469904, -1.203431, 3.608726, 1, 1, 1, 1, 1,
0.7480177, 0.9611095, 0.2267985, 0, 0, 1, 1, 1,
0.7500066, -0.5493045, 0.8149418, 1, 0, 0, 1, 1,
0.7556245, 1.111347, 0.4844908, 1, 0, 0, 1, 1,
0.7571203, -1.302686, 1.519338, 1, 0, 0, 1, 1,
0.7593906, -0.520162, 2.656354, 1, 0, 0, 1, 1,
0.7608942, -1.241346, 2.542497, 1, 0, 0, 1, 1,
0.7634585, -0.3363012, 4.244993, 0, 0, 0, 1, 1,
0.7638613, 0.5772664, 1.049295, 0, 0, 0, 1, 1,
0.7695476, 0.1845333, 0.730224, 0, 0, 0, 1, 1,
0.7774939, 0.985967, -0.6395912, 0, 0, 0, 1, 1,
0.7780128, -0.8367438, 0.5885728, 0, 0, 0, 1, 1,
0.7797758, -0.2978206, 2.047951, 0, 0, 0, 1, 1,
0.7850122, 0.7479946, 0.1222811, 0, 0, 0, 1, 1,
0.7868856, -0.5662394, 2.009481, 1, 1, 1, 1, 1,
0.7957242, -0.1929742, 1.361681, 1, 1, 1, 1, 1,
0.7993934, 0.665619, 1.120239, 1, 1, 1, 1, 1,
0.8029677, -1.264039, 4.12116, 1, 1, 1, 1, 1,
0.8056787, 1.369946, -0.6408408, 1, 1, 1, 1, 1,
0.8072444, -1.130286, 2.691287, 1, 1, 1, 1, 1,
0.8136758, -0.6849373, 1.345416, 1, 1, 1, 1, 1,
0.8150446, 0.2183001, 0.1505316, 1, 1, 1, 1, 1,
0.8150621, -1.046054, 3.425177, 1, 1, 1, 1, 1,
0.8218081, -0.3521211, 1.976038, 1, 1, 1, 1, 1,
0.8255172, 1.117646, 0.4686683, 1, 1, 1, 1, 1,
0.8257294, -0.8078223, 3.167554, 1, 1, 1, 1, 1,
0.8311203, -2.046086, 2.701743, 1, 1, 1, 1, 1,
0.8320966, -0.4005516, 2.072531, 1, 1, 1, 1, 1,
0.8367926, 2.103456, 1.147109, 1, 1, 1, 1, 1,
0.8432748, -0.5918322, 1.774432, 0, 0, 1, 1, 1,
0.844123, 1.908452, 0.1858732, 1, 0, 0, 1, 1,
0.8461932, -0.1882544, 1.295351, 1, 0, 0, 1, 1,
0.846593, -0.07684734, 0.9079554, 1, 0, 0, 1, 1,
0.8466614, -0.5037627, 2.331674, 1, 0, 0, 1, 1,
0.8470402, 2.357783, -1.196221, 1, 0, 0, 1, 1,
0.8513243, 1.056679, 1.420674, 0, 0, 0, 1, 1,
0.8527937, 0.994495, 0.7931927, 0, 0, 0, 1, 1,
0.8549317, 1.133295, 1.157034, 0, 0, 0, 1, 1,
0.8556873, -0.5803947, 0.3677587, 0, 0, 0, 1, 1,
0.8573246, -0.4238964, 2.402124, 0, 0, 0, 1, 1,
0.8596731, -1.099668, 3.112138, 0, 0, 0, 1, 1,
0.8730338, -1.42875, 3.805279, 0, 0, 0, 1, 1,
0.878913, 0.659539, -0.2471189, 1, 1, 1, 1, 1,
0.8836001, -1.427291, 2.543584, 1, 1, 1, 1, 1,
0.8842747, -1.359489, 2.32399, 1, 1, 1, 1, 1,
0.8863823, 2.058929, -1.571575, 1, 1, 1, 1, 1,
0.8914654, 0.5643832, 1.110637, 1, 1, 1, 1, 1,
0.8919336, 0.8025002, 1.171986, 1, 1, 1, 1, 1,
0.8932113, -0.3793477, 3.50248, 1, 1, 1, 1, 1,
0.894126, 0.493622, 1.735602, 1, 1, 1, 1, 1,
0.8967527, 1.180501, 1.364465, 1, 1, 1, 1, 1,
0.9048598, 0.4691634, 2.124003, 1, 1, 1, 1, 1,
0.9059324, 0.9061749, 0.6380813, 1, 1, 1, 1, 1,
0.906753, -0.6260718, 1.362431, 1, 1, 1, 1, 1,
0.9072382, -1.262175, 2.50192, 1, 1, 1, 1, 1,
0.9109471, 0.4974801, -0.05585527, 1, 1, 1, 1, 1,
0.9160418, 0.6631506, 0.4853834, 1, 1, 1, 1, 1,
0.9191501, 0.5384349, 1.214109, 0, 0, 1, 1, 1,
0.9217833, 0.6805933, -0.6641698, 1, 0, 0, 1, 1,
0.9239036, -2.137344, 2.378134, 1, 0, 0, 1, 1,
0.9248197, -0.9683371, 1.95542, 1, 0, 0, 1, 1,
0.9268339, 2.596829, 2.395736, 1, 0, 0, 1, 1,
0.9271511, 0.3759093, 2.118953, 1, 0, 0, 1, 1,
0.9288903, 0.6237673, 0.3126808, 0, 0, 0, 1, 1,
0.9310341, -2.72445, 1.252351, 0, 0, 0, 1, 1,
0.9406222, 0.890846, 0.908121, 0, 0, 0, 1, 1,
0.9448054, 1.234978, 1.037734, 0, 0, 0, 1, 1,
0.9511736, 1.71352, 1.235588, 0, 0, 0, 1, 1,
0.9533211, 0.6619618, 1.670792, 0, 0, 0, 1, 1,
0.9551253, -0.6693766, 2.629468, 0, 0, 0, 1, 1,
0.9551494, -0.0512915, -0.1971617, 1, 1, 1, 1, 1,
0.9601414, -1.393183, 0.6876029, 1, 1, 1, 1, 1,
0.9831868, -0.3137411, 1.898439, 1, 1, 1, 1, 1,
0.9844229, -1.937901, 2.266299, 1, 1, 1, 1, 1,
0.9858079, -0.5708574, 0.4577451, 1, 1, 1, 1, 1,
0.9932873, 0.3242117, 2.154664, 1, 1, 1, 1, 1,
1.002815, -0.9150442, 1.490537, 1, 1, 1, 1, 1,
1.0132, 0.2371463, -1.379699, 1, 1, 1, 1, 1,
1.016349, -0.4560691, 2.907153, 1, 1, 1, 1, 1,
1.02543, -0.7191982, 1.519141, 1, 1, 1, 1, 1,
1.044196, 0.9973364, 0.154523, 1, 1, 1, 1, 1,
1.044501, 0.4876944, 0.6289113, 1, 1, 1, 1, 1,
1.04677, 0.6458939, 1.383606, 1, 1, 1, 1, 1,
1.055844, 0.3110355, 0.4528957, 1, 1, 1, 1, 1,
1.057405, 1.601065, 0.9642245, 1, 1, 1, 1, 1,
1.05824, 1.577485, -0.474843, 0, 0, 1, 1, 1,
1.058797, -2.194226, 0.1463436, 1, 0, 0, 1, 1,
1.060555, 0.08907942, 2.650184, 1, 0, 0, 1, 1,
1.061473, 2.501652, -0.7927771, 1, 0, 0, 1, 1,
1.064665, 1.419229, 1.755695, 1, 0, 0, 1, 1,
1.065725, 1.239212, 3.309618, 1, 0, 0, 1, 1,
1.071009, 0.3450978, 2.290918, 0, 0, 0, 1, 1,
1.076021, -0.4429737, 2.212346, 0, 0, 0, 1, 1,
1.078482, 0.6900761, 1.275924, 0, 0, 0, 1, 1,
1.080064, -1.365568, 1.698563, 0, 0, 0, 1, 1,
1.086846, -0.381669, 0.8136904, 0, 0, 0, 1, 1,
1.089189, 0.40321, 1.600386, 0, 0, 0, 1, 1,
1.093774, 0.4183166, 2.205565, 0, 0, 0, 1, 1,
1.09626, -2.291677, 1.555078, 1, 1, 1, 1, 1,
1.097555, 0.6523776, 0.3758856, 1, 1, 1, 1, 1,
1.097844, 2.843928, 2.15678, 1, 1, 1, 1, 1,
1.099824, 0.3143857, 0.2245468, 1, 1, 1, 1, 1,
1.104166, -1.362398, 3.354986, 1, 1, 1, 1, 1,
1.108128, -0.1872828, 1.303954, 1, 1, 1, 1, 1,
1.112301, -0.1993497, 2.686309, 1, 1, 1, 1, 1,
1.116157, -0.6743174, 2.722057, 1, 1, 1, 1, 1,
1.131274, -0.1772138, -1.027121, 1, 1, 1, 1, 1,
1.143157, -0.161232, 1.678628, 1, 1, 1, 1, 1,
1.146858, -1.619952, 3.401223, 1, 1, 1, 1, 1,
1.151856, -0.06425928, 0.07627212, 1, 1, 1, 1, 1,
1.159572, 0.4684375, 1.483101, 1, 1, 1, 1, 1,
1.162612, -0.2741535, 0.389761, 1, 1, 1, 1, 1,
1.164257, -0.01072855, 2.245921, 1, 1, 1, 1, 1,
1.167656, -1.579983, 3.946456, 0, 0, 1, 1, 1,
1.167957, 1.95534, -0.4436632, 1, 0, 0, 1, 1,
1.170019, -0.2391037, 1.729522, 1, 0, 0, 1, 1,
1.176283, -0.7790533, 2.871029, 1, 0, 0, 1, 1,
1.180524, -1.362199, 2.695659, 1, 0, 0, 1, 1,
1.183566, -0.5250031, 1.589944, 1, 0, 0, 1, 1,
1.18873, -0.2314677, 0.9259583, 0, 0, 0, 1, 1,
1.211698, 0.7474196, 1.923202, 0, 0, 0, 1, 1,
1.214755, 1.499655, 0.4088079, 0, 0, 0, 1, 1,
1.225246, -0.5828172, 2.053128, 0, 0, 0, 1, 1,
1.226526, -0.4665099, 2.193053, 0, 0, 0, 1, 1,
1.243218, -1.248466, 1.449828, 0, 0, 0, 1, 1,
1.24888, 0.08970934, 0.6496334, 0, 0, 0, 1, 1,
1.253139, 1.120659, -0.9401262, 1, 1, 1, 1, 1,
1.266865, 0.02363261, 1.603926, 1, 1, 1, 1, 1,
1.280753, 0.1201741, -2.053416, 1, 1, 1, 1, 1,
1.291493, 1.670137, 0.7537713, 1, 1, 1, 1, 1,
1.293108, -0.3588673, 1.254982, 1, 1, 1, 1, 1,
1.29582, 0.5680847, 1.836338, 1, 1, 1, 1, 1,
1.296718, 0.7968481, 2.502409, 1, 1, 1, 1, 1,
1.304201, -1.948006, 1.494423, 1, 1, 1, 1, 1,
1.305294, -0.8961658, 0.7289812, 1, 1, 1, 1, 1,
1.309568, -0.6403564, 2.005915, 1, 1, 1, 1, 1,
1.320457, 1.17135, 1.307928, 1, 1, 1, 1, 1,
1.32181, -1.503953, 3.550634, 1, 1, 1, 1, 1,
1.328931, -0.6775249, 1.812775, 1, 1, 1, 1, 1,
1.330758, -0.4715537, 4.082189, 1, 1, 1, 1, 1,
1.330966, 1.825632, -1.689476, 1, 1, 1, 1, 1,
1.334206, 1.126506, 0.9981775, 0, 0, 1, 1, 1,
1.338128, 1.039766, 2.041879, 1, 0, 0, 1, 1,
1.341704, 1.817021, -0.7320023, 1, 0, 0, 1, 1,
1.347331, -1.283684, 3.542835, 1, 0, 0, 1, 1,
1.35717, -0.3978417, 0.9637022, 1, 0, 0, 1, 1,
1.358886, -0.3668843, 2.449918, 1, 0, 0, 1, 1,
1.364052, -1.222116, 2.352429, 0, 0, 0, 1, 1,
1.366531, -1.038619, 2.886935, 0, 0, 0, 1, 1,
1.371871, -0.8641424, 1.519075, 0, 0, 0, 1, 1,
1.37862, 0.09606588, 1.635839, 0, 0, 0, 1, 1,
1.395115, 0.1261819, -1.499194, 0, 0, 0, 1, 1,
1.412537, -1.258566, 1.687001, 0, 0, 0, 1, 1,
1.419979, 0.04514946, 0.6235201, 0, 0, 0, 1, 1,
1.426458, -0.9177569, 2.825382, 1, 1, 1, 1, 1,
1.43213, -0.2578841, 1.961393, 1, 1, 1, 1, 1,
1.435383, 1.709112, 0.9827579, 1, 1, 1, 1, 1,
1.43548, 0.008090894, 1.673596, 1, 1, 1, 1, 1,
1.437491, -1.402468, 1.537114, 1, 1, 1, 1, 1,
1.439866, 0.7932469, -0.2149884, 1, 1, 1, 1, 1,
1.44439, 0.7187102, 0.7281561, 1, 1, 1, 1, 1,
1.446511, -0.7422304, 1.579684, 1, 1, 1, 1, 1,
1.455797, 0.04655326, -0.6268761, 1, 1, 1, 1, 1,
1.45635, 0.3402798, 0.3981472, 1, 1, 1, 1, 1,
1.457045, 0.8248909, 1.875199, 1, 1, 1, 1, 1,
1.463283, -0.04376635, 2.994791, 1, 1, 1, 1, 1,
1.471314, 0.3049805, 3.893466, 1, 1, 1, 1, 1,
1.47771, 0.2793112, 0.7114305, 1, 1, 1, 1, 1,
1.479814, -0.3645775, 1.964326, 1, 1, 1, 1, 1,
1.48033, 0.06795918, 4.407883, 0, 0, 1, 1, 1,
1.483213, -1.225696, 2.43601, 1, 0, 0, 1, 1,
1.483657, -0.07852613, 2.136004, 1, 0, 0, 1, 1,
1.485921, 0.7521915, 1.191911, 1, 0, 0, 1, 1,
1.505599, -0.4204034, 3.239488, 1, 0, 0, 1, 1,
1.516182, 0.04077511, 2.918104, 1, 0, 0, 1, 1,
1.520639, 0.6875334, 0.9847674, 0, 0, 0, 1, 1,
1.522392, 0.5788485, 3.299677, 0, 0, 0, 1, 1,
1.528667, -1.079557, 2.177732, 0, 0, 0, 1, 1,
1.53323, 0.3432688, 0.6774143, 0, 0, 0, 1, 1,
1.535166, -0.8663301, -0.3664085, 0, 0, 0, 1, 1,
1.564252, 1.229737, 1.572581, 0, 0, 0, 1, 1,
1.565545, -0.1993261, 2.539667, 0, 0, 0, 1, 1,
1.570007, 0.9466013, 1.337369, 1, 1, 1, 1, 1,
1.573933, -0.7340236, 0.9491909, 1, 1, 1, 1, 1,
1.619962, 1.025687, -1.046123, 1, 1, 1, 1, 1,
1.631319, 2.469204, 0.121523, 1, 1, 1, 1, 1,
1.636008, -0.7238516, 3.766518, 1, 1, 1, 1, 1,
1.640525, 0.03681259, 2.759452, 1, 1, 1, 1, 1,
1.655434, 0.7169749, -0.02723262, 1, 1, 1, 1, 1,
1.669031, 0.07124972, 1.142333, 1, 1, 1, 1, 1,
1.672608, 2.269076, 1.967479, 1, 1, 1, 1, 1,
1.6741, -0.8571814, 2.485866, 1, 1, 1, 1, 1,
1.679656, 0.5130212, 0.1407924, 1, 1, 1, 1, 1,
1.682408, 0.9296628, 1.004581, 1, 1, 1, 1, 1,
1.689891, -0.283192, 2.577942, 1, 1, 1, 1, 1,
1.700755, -0.2958599, 2.153407, 1, 1, 1, 1, 1,
1.701291, 0.02083959, 0.9858547, 1, 1, 1, 1, 1,
1.713564, 1.672108, 1.420331, 0, 0, 1, 1, 1,
1.720111, -1.277321, 1.931454, 1, 0, 0, 1, 1,
1.720852, 1.056297, 1.141804, 1, 0, 0, 1, 1,
1.745893, -0.3879318, 1.360556, 1, 0, 0, 1, 1,
1.748424, -0.8155414, 0.8125181, 1, 0, 0, 1, 1,
1.752726, 1.326894, 0.6818008, 1, 0, 0, 1, 1,
1.759099, -1.12184, 3.048523, 0, 0, 0, 1, 1,
1.759703, -0.3990518, 1.719479, 0, 0, 0, 1, 1,
1.781677, 0.1338384, 1.75275, 0, 0, 0, 1, 1,
1.821443, 1.31306, 0.7259572, 0, 0, 0, 1, 1,
1.831634, 1.379699, 0.8916845, 0, 0, 0, 1, 1,
1.838303, -0.5726258, 2.575434, 0, 0, 0, 1, 1,
1.845546, -1.232558, 1.70378, 0, 0, 0, 1, 1,
1.882596, 0.9020824, -0.7126964, 1, 1, 1, 1, 1,
1.911925, 0.8159771, -0.2398157, 1, 1, 1, 1, 1,
1.939584, 1.281958, -0.9223136, 1, 1, 1, 1, 1,
1.964883, 1.623088, 1.247991, 1, 1, 1, 1, 1,
1.990667, 0.4591085, 1.913454, 1, 1, 1, 1, 1,
1.993097, -0.7917026, 2.231704, 1, 1, 1, 1, 1,
1.994248, -1.384185, 2.766665, 1, 1, 1, 1, 1,
1.99492, 0.9362186, 1.370561, 1, 1, 1, 1, 1,
1.99959, 0.009885302, 0.9266188, 1, 1, 1, 1, 1,
2.00059, -0.7634934, 1.51325, 1, 1, 1, 1, 1,
2.00415, 0.9185966, 1.156201, 1, 1, 1, 1, 1,
2.011062, 1.701946, 0.912427, 1, 1, 1, 1, 1,
2.011714, -0.5154299, 1.945966, 1, 1, 1, 1, 1,
2.051721, -0.03018559, 1.589541, 1, 1, 1, 1, 1,
2.058366, 1.456164, -0.6879209, 1, 1, 1, 1, 1,
2.067335, 0.09032462, 1.200087, 0, 0, 1, 1, 1,
2.077919, -0.5334168, 3.700834, 1, 0, 0, 1, 1,
2.137036, 0.2963972, 2.695959, 1, 0, 0, 1, 1,
2.160576, 0.03791802, 1.423705, 1, 0, 0, 1, 1,
2.194884, 0.1982706, 0.5168692, 1, 0, 0, 1, 1,
2.200618, 1.941951, -0.2273641, 1, 0, 0, 1, 1,
2.230947, 1.180722, 0.9190397, 0, 0, 0, 1, 1,
2.235186, 0.4302052, 1.892167, 0, 0, 0, 1, 1,
2.305027, -0.9027428, 2.403163, 0, 0, 0, 1, 1,
2.309682, -0.4046699, 0.2416748, 0, 0, 0, 1, 1,
2.362787, 0.8293722, 0.3873431, 0, 0, 0, 1, 1,
2.364737, 1.332924, -0.7395961, 0, 0, 0, 1, 1,
2.378375, 2.009509, -0.02286857, 0, 0, 0, 1, 1,
2.471979, -0.5501112, 2.456097, 1, 1, 1, 1, 1,
2.54249, -0.2574893, 3.050516, 1, 1, 1, 1, 1,
2.574503, 0.5797094, 1.306859, 1, 1, 1, 1, 1,
2.582874, -0.3429204, 2.695675, 1, 1, 1, 1, 1,
2.941664, -0.2848361, 0.9664187, 1, 1, 1, 1, 1,
3.039912, 0.7055455, 2.911623, 1, 1, 1, 1, 1,
3.104542, -0.9099442, -0.001118724, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.262624;
var distance = 32.53457;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.1122743, -0.1194434, -0.1311293 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.53457);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>