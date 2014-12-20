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
-3.142673, -0.8953354, -2.401016, 1, 0, 0, 1,
-3.11125, 0.5931973, -3.598624, 1, 0.007843138, 0, 1,
-2.858082, 0.6921448, -0.6215099, 1, 0.01176471, 0, 1,
-2.751547, -0.7909354, -2.089612, 1, 0.01960784, 0, 1,
-2.707132, -1.801535, -1.340416, 1, 0.02352941, 0, 1,
-2.583579, 0.6261247, -1.923753, 1, 0.03137255, 0, 1,
-2.569323, 0.213689, -2.062481, 1, 0.03529412, 0, 1,
-2.523096, 1.333389, -0.8869233, 1, 0.04313726, 0, 1,
-2.482244, 0.6913781, -1.908953, 1, 0.04705882, 0, 1,
-2.459749, -0.540037, -1.253669, 1, 0.05490196, 0, 1,
-2.448105, -0.07210937, -2.082276, 1, 0.05882353, 0, 1,
-2.446527, 0.3859111, -1.189393, 1, 0.06666667, 0, 1,
-2.39431, -0.1533674, -0.8273084, 1, 0.07058824, 0, 1,
-2.379098, 1.55901, -1.535001, 1, 0.07843138, 0, 1,
-2.319604, 0.9043124, -0.8572352, 1, 0.08235294, 0, 1,
-2.294491, 0.4831575, -2.454438, 1, 0.09019608, 0, 1,
-2.256494, 0.4919814, -1.837363, 1, 0.09411765, 0, 1,
-2.253588, -0.8213964, -2.460461, 1, 0.1019608, 0, 1,
-2.231585, -0.1893502, -1.355596, 1, 0.1098039, 0, 1,
-2.226091, 1.862824, -0.9373448, 1, 0.1137255, 0, 1,
-2.225898, -1.105395, -2.962435, 1, 0.1215686, 0, 1,
-2.139242, 1.092087, -1.761435, 1, 0.1254902, 0, 1,
-2.136387, -0.6501392, -2.366664, 1, 0.1333333, 0, 1,
-2.127329, -2.25844, -2.178242, 1, 0.1372549, 0, 1,
-2.100772, 0.216349, -1.38199, 1, 0.145098, 0, 1,
-2.096677, -0.451565, -2.707504, 1, 0.1490196, 0, 1,
-2.058212, 0.7865199, -1.035437, 1, 0.1568628, 0, 1,
-2.053486, 0.09090017, -1.077561, 1, 0.1607843, 0, 1,
-2.003462, 1.556224, -1.544545, 1, 0.1686275, 0, 1,
-1.963956, 1.853738, -1.250546, 1, 0.172549, 0, 1,
-1.957012, -0.4143961, -1.555721, 1, 0.1803922, 0, 1,
-1.940867, -1.635824, -2.19918, 1, 0.1843137, 0, 1,
-1.92555, 0.759991, -1.188899, 1, 0.1921569, 0, 1,
-1.893457, -0.3143376, -0.9068407, 1, 0.1960784, 0, 1,
-1.877196, -0.8689281, -1.919689, 1, 0.2039216, 0, 1,
-1.87359, -0.6477938, -1.607345, 1, 0.2117647, 0, 1,
-1.862292, -2.654211, -1.510755, 1, 0.2156863, 0, 1,
-1.85811, 2.396584, -1.588535, 1, 0.2235294, 0, 1,
-1.849868, 0.5432464, -1.019765, 1, 0.227451, 0, 1,
-1.836061, -1.126614, -1.499147, 1, 0.2352941, 0, 1,
-1.83106, -0.008914412, -3.10703, 1, 0.2392157, 0, 1,
-1.780121, 0.8427691, -1.059993, 1, 0.2470588, 0, 1,
-1.770535, 0.10533, -1.016578, 1, 0.2509804, 0, 1,
-1.760201, 2.321508, -0.4857209, 1, 0.2588235, 0, 1,
-1.757166, 0.2226602, -2.468395, 1, 0.2627451, 0, 1,
-1.754507, -1.269601, -2.824937, 1, 0.2705882, 0, 1,
-1.747652, -0.3621325, -0.6222706, 1, 0.2745098, 0, 1,
-1.746645, -2.402719, -3.637988, 1, 0.282353, 0, 1,
-1.711438, 1.322932, -0.3207496, 1, 0.2862745, 0, 1,
-1.667884, -0.3017082, -1.85296, 1, 0.2941177, 0, 1,
-1.663834, 0.7412046, -0.322405, 1, 0.3019608, 0, 1,
-1.658095, 1.050281, -0.1004994, 1, 0.3058824, 0, 1,
-1.65329, -0.9365649, -1.391904, 1, 0.3137255, 0, 1,
-1.648423, -2.06852, -1.731769, 1, 0.3176471, 0, 1,
-1.646508, -0.4424734, -2.644292, 1, 0.3254902, 0, 1,
-1.643066, 0.0984223, -2.156184, 1, 0.3294118, 0, 1,
-1.640057, -0.9899826, -1.570521, 1, 0.3372549, 0, 1,
-1.632058, -0.7144896, -0.9478012, 1, 0.3411765, 0, 1,
-1.628726, 1.692166, -2.290136, 1, 0.3490196, 0, 1,
-1.624054, 0.8722487, -1.530869, 1, 0.3529412, 0, 1,
-1.622464, -0.3003991, -1.306911, 1, 0.3607843, 0, 1,
-1.611519, -0.3844005, -1.35777, 1, 0.3647059, 0, 1,
-1.606762, 0.517912, -0.249267, 1, 0.372549, 0, 1,
-1.600627, -0.3509414, -2.431589, 1, 0.3764706, 0, 1,
-1.596847, 0.2384236, -1.526264, 1, 0.3843137, 0, 1,
-1.595322, 1.279083, -0.9074516, 1, 0.3882353, 0, 1,
-1.591503, 1.074807, -0.738422, 1, 0.3960784, 0, 1,
-1.581591, -1.471205, -4.113002, 1, 0.4039216, 0, 1,
-1.577837, -0.3611354, -1.702023, 1, 0.4078431, 0, 1,
-1.577596, 0.1728656, -4.08459, 1, 0.4156863, 0, 1,
-1.559392, 2.459513, -0.7914218, 1, 0.4196078, 0, 1,
-1.551005, 1.546946, -0.6623566, 1, 0.427451, 0, 1,
-1.539092, 1.315354, -1.663693, 1, 0.4313726, 0, 1,
-1.536476, 1.371024, -0.908008, 1, 0.4392157, 0, 1,
-1.528221, -1.244041, -3.271945, 1, 0.4431373, 0, 1,
-1.492965, -1.789551, -1.952145, 1, 0.4509804, 0, 1,
-1.488896, -0.4926013, -2.322664, 1, 0.454902, 0, 1,
-1.473905, 1.810161, -0.6778001, 1, 0.4627451, 0, 1,
-1.453161, 0.356519, -0.715018, 1, 0.4666667, 0, 1,
-1.45276, -0.19963, -4.063709, 1, 0.4745098, 0, 1,
-1.44807, 1.616809, -2.386945, 1, 0.4784314, 0, 1,
-1.43708, 0.7235224, -1.902562, 1, 0.4862745, 0, 1,
-1.435651, -0.1173267, -2.270702, 1, 0.4901961, 0, 1,
-1.429989, 0.4704597, 0.1611725, 1, 0.4980392, 0, 1,
-1.424998, -0.9860538, -2.582934, 1, 0.5058824, 0, 1,
-1.420229, 1.127958, -1.293182, 1, 0.509804, 0, 1,
-1.419905, 0.4127047, -1.453886, 1, 0.5176471, 0, 1,
-1.414241, -0.6101579, -2.014342, 1, 0.5215687, 0, 1,
-1.404661, -0.8817976, -0.5058335, 1, 0.5294118, 0, 1,
-1.386687, 0.9266191, -0.916768, 1, 0.5333334, 0, 1,
-1.379577, -0.931026, -4.931996, 1, 0.5411765, 0, 1,
-1.370298, 0.2501495, -3.236798, 1, 0.5450981, 0, 1,
-1.362571, -0.9912039, -1.80948, 1, 0.5529412, 0, 1,
-1.349794, 1.179645, -1.084304, 1, 0.5568628, 0, 1,
-1.339352, -0.3825459, -1.007239, 1, 0.5647059, 0, 1,
-1.337616, -0.3848437, -2.347649, 1, 0.5686275, 0, 1,
-1.331948, 0.2300519, -1.383357, 1, 0.5764706, 0, 1,
-1.323587, 1.331517, -0.5127548, 1, 0.5803922, 0, 1,
-1.315104, -0.8790033, -3.550174, 1, 0.5882353, 0, 1,
-1.308806, -0.7762845, -1.771979, 1, 0.5921569, 0, 1,
-1.302893, 0.2424503, -1.521588, 1, 0.6, 0, 1,
-1.302078, -1.582701, -4.262346, 1, 0.6078432, 0, 1,
-1.285857, -0.009816498, -0.386195, 1, 0.6117647, 0, 1,
-1.278683, -1.129756, -2.250361, 1, 0.6196079, 0, 1,
-1.269846, -1.134239, -1.577701, 1, 0.6235294, 0, 1,
-1.267391, 2.136587, 0.9262255, 1, 0.6313726, 0, 1,
-1.264446, 1.158668, -1.179397, 1, 0.6352941, 0, 1,
-1.259585, -0.7871476, -0.5844084, 1, 0.6431373, 0, 1,
-1.257979, -0.2779382, -2.844958, 1, 0.6470588, 0, 1,
-1.248181, 1.941988, 0.5310997, 1, 0.654902, 0, 1,
-1.242889, -0.09614407, 0.3134839, 1, 0.6588235, 0, 1,
-1.238092, -0.1237896, -0.1433122, 1, 0.6666667, 0, 1,
-1.233189, -1.009455, -2.352022, 1, 0.6705883, 0, 1,
-1.23021, 0.4518099, -0.1921448, 1, 0.6784314, 0, 1,
-1.222692, -3.180441, -3.859147, 1, 0.682353, 0, 1,
-1.220196, -0.9915527, -2.451023, 1, 0.6901961, 0, 1,
-1.205975, -0.4144148, -1.058864, 1, 0.6941177, 0, 1,
-1.205497, 1.847469, -0.7960196, 1, 0.7019608, 0, 1,
-1.192199, 0.6227265, -0.9949811, 1, 0.7098039, 0, 1,
-1.183737, -0.1903875, -2.477039, 1, 0.7137255, 0, 1,
-1.182149, 0.4582323, -1.506665, 1, 0.7215686, 0, 1,
-1.177875, 0.1151373, -0.2177866, 1, 0.7254902, 0, 1,
-1.157924, -0.2765794, -1.689341, 1, 0.7333333, 0, 1,
-1.14595, 1.423281, 0.7484567, 1, 0.7372549, 0, 1,
-1.143723, 1.467532, -0.3665158, 1, 0.7450981, 0, 1,
-1.14062, 0.2549633, -2.529719, 1, 0.7490196, 0, 1,
-1.130073, -0.4050993, -1.200307, 1, 0.7568628, 0, 1,
-1.11128, -0.189329, -1.647257, 1, 0.7607843, 0, 1,
-1.1107, 0.6151118, 0.9247723, 1, 0.7686275, 0, 1,
-1.108343, -0.8003907, -2.852419, 1, 0.772549, 0, 1,
-1.107024, 0.6744787, -0.5185317, 1, 0.7803922, 0, 1,
-1.104925, 1.181872, 0.2102799, 1, 0.7843137, 0, 1,
-1.104864, -0.8910981, -0.7642797, 1, 0.7921569, 0, 1,
-1.104788, -0.2273914, 0.1253429, 1, 0.7960784, 0, 1,
-1.104279, -0.6655653, -3.092742, 1, 0.8039216, 0, 1,
-1.102377, -0.7313767, -1.317042, 1, 0.8117647, 0, 1,
-1.100115, -1.175681, -1.941602, 1, 0.8156863, 0, 1,
-1.098728, 0.2869154, -2.291551, 1, 0.8235294, 0, 1,
-1.095049, 1.931088, -1.605743, 1, 0.827451, 0, 1,
-1.093546, 2.06382, -0.3489116, 1, 0.8352941, 0, 1,
-1.091182, -0.5518469, 0.04475062, 1, 0.8392157, 0, 1,
-1.091003, 0.5919115, -2.019839, 1, 0.8470588, 0, 1,
-1.088104, 2.182544, -1.613379, 1, 0.8509804, 0, 1,
-1.085938, -1.164831, -1.456018, 1, 0.8588235, 0, 1,
-1.084911, 1.023977, -0.6411015, 1, 0.8627451, 0, 1,
-1.074842, -0.140934, -1.405307, 1, 0.8705882, 0, 1,
-1.069822, 0.4852082, -2.261049, 1, 0.8745098, 0, 1,
-1.057822, -1.529652, -4.402247, 1, 0.8823529, 0, 1,
-1.053572, 0.7783823, -1.576978, 1, 0.8862745, 0, 1,
-1.043075, 1.194943, -1.126641, 1, 0.8941177, 0, 1,
-1.042527, -0.4101815, -0.4129196, 1, 0.8980392, 0, 1,
-1.035271, -0.5828468, -1.136142, 1, 0.9058824, 0, 1,
-1.032543, 0.08577353, -3.604536, 1, 0.9137255, 0, 1,
-1.028151, 1.02082, -0.7288777, 1, 0.9176471, 0, 1,
-1.026525, 2.235949, 0.09316141, 1, 0.9254902, 0, 1,
-1.01847, 0.6183912, -1.10274, 1, 0.9294118, 0, 1,
-1.01756, 0.443047, 2.275363, 1, 0.9372549, 0, 1,
-1.014992, -1.709354, -4.340454, 1, 0.9411765, 0, 1,
-1.014759, 0.4221886, -1.67609, 1, 0.9490196, 0, 1,
-1.010873, -0.8530817, -2.565079, 1, 0.9529412, 0, 1,
-1.006369, -0.7609541, -1.721655, 1, 0.9607843, 0, 1,
-1.006226, 0.6485758, -0.6087054, 1, 0.9647059, 0, 1,
-1.004278, 1.207552, -0.2355408, 1, 0.972549, 0, 1,
-0.9970149, 0.4965586, -0.1642446, 1, 0.9764706, 0, 1,
-0.9944698, -0.9033604, -0.7906658, 1, 0.9843137, 0, 1,
-0.9794059, 1.285402, -1.698678, 1, 0.9882353, 0, 1,
-0.9767669, -1.239169, -2.902241, 1, 0.9960784, 0, 1,
-0.9760422, -0.0373637, 0.7763889, 0.9960784, 1, 0, 1,
-0.9710154, -0.8660298, -2.661109, 0.9921569, 1, 0, 1,
-0.9709393, 0.4026726, -2.064783, 0.9843137, 1, 0, 1,
-0.9707006, 1.282482, -1.140398, 0.9803922, 1, 0, 1,
-0.9692607, 0.570725, -0.2338997, 0.972549, 1, 0, 1,
-0.9606921, 0.4897058, -0.6747611, 0.9686275, 1, 0, 1,
-0.9590743, 0.02181792, -0.2382748, 0.9607843, 1, 0, 1,
-0.953699, -0.04007634, -1.888015, 0.9568627, 1, 0, 1,
-0.9447842, 1.382199, -1.984736, 0.9490196, 1, 0, 1,
-0.9429985, 1.408197, -0.4617984, 0.945098, 1, 0, 1,
-0.9399289, -1.573968, -4.316973, 0.9372549, 1, 0, 1,
-0.9353833, 0.9022548, -0.8175268, 0.9333333, 1, 0, 1,
-0.9334193, 1.010317, 0.2880166, 0.9254902, 1, 0, 1,
-0.9311694, -0.144715, -1.266259, 0.9215686, 1, 0, 1,
-0.9239633, 0.2001722, -1.379386, 0.9137255, 1, 0, 1,
-0.9237432, -0.1928617, -0.6695587, 0.9098039, 1, 0, 1,
-0.9186933, -0.0909206, -0.001923095, 0.9019608, 1, 0, 1,
-0.9148651, 0.6401768, 1.115595, 0.8941177, 1, 0, 1,
-0.9098855, 2.612658, 2.130815, 0.8901961, 1, 0, 1,
-0.9032716, 0.3079359, -1.848539, 0.8823529, 1, 0, 1,
-0.9017659, 0.1726717, -0.8856822, 0.8784314, 1, 0, 1,
-0.9003475, -1.302205, -3.541638, 0.8705882, 1, 0, 1,
-0.8905559, -1.011362, -0.5937182, 0.8666667, 1, 0, 1,
-0.8752325, 0.790635, -0.8793789, 0.8588235, 1, 0, 1,
-0.8711759, 0.6588191, 0.2453124, 0.854902, 1, 0, 1,
-0.8708058, -0.7796449, -1.157786, 0.8470588, 1, 0, 1,
-0.8663412, 1.322122, -0.6257268, 0.8431373, 1, 0, 1,
-0.8621938, 0.4155647, -2.068582, 0.8352941, 1, 0, 1,
-0.861747, -0.5601469, 0.06307481, 0.8313726, 1, 0, 1,
-0.8558127, 0.5086647, -0.5846975, 0.8235294, 1, 0, 1,
-0.8488136, -1.139432, -2.975282, 0.8196079, 1, 0, 1,
-0.8424948, 0.1705641, -3.260367, 0.8117647, 1, 0, 1,
-0.8378251, -0.6571444, -2.59078, 0.8078431, 1, 0, 1,
-0.8366384, -1.425662, -2.424821, 0.8, 1, 0, 1,
-0.8323821, 0.3557889, -2.39743, 0.7921569, 1, 0, 1,
-0.8310278, 1.489849, -2.409375, 0.7882353, 1, 0, 1,
-0.8294001, -1.344976, -2.722763, 0.7803922, 1, 0, 1,
-0.8291502, 0.8072742, -0.9315295, 0.7764706, 1, 0, 1,
-0.828413, -0.6609109, -1.101028, 0.7686275, 1, 0, 1,
-0.8281332, -0.7916763, -2.15747, 0.7647059, 1, 0, 1,
-0.8277357, -3.004566, -3.350269, 0.7568628, 1, 0, 1,
-0.8227266, -1.678555, -3.484331, 0.7529412, 1, 0, 1,
-0.822723, 0.9217295, -0.6505219, 0.7450981, 1, 0, 1,
-0.8042724, 0.6844292, -0.9543047, 0.7411765, 1, 0, 1,
-0.8039651, 0.9285558, 1.573455, 0.7333333, 1, 0, 1,
-0.8019215, 0.7305352, -1.784523, 0.7294118, 1, 0, 1,
-0.801085, -0.9895712, -3.675592, 0.7215686, 1, 0, 1,
-0.8009071, 0.1291712, -1.789426, 0.7176471, 1, 0, 1,
-0.7904205, 0.1318896, -2.17322, 0.7098039, 1, 0, 1,
-0.7882878, 0.5109226, 0.4025136, 0.7058824, 1, 0, 1,
-0.7793205, 0.3344746, -1.650509, 0.6980392, 1, 0, 1,
-0.7792538, 2.437309, -0.3424667, 0.6901961, 1, 0, 1,
-0.7751644, 1.762086, -1.009851, 0.6862745, 1, 0, 1,
-0.7709026, 0.05970118, 0.3566645, 0.6784314, 1, 0, 1,
-0.761432, 0.4976659, -2.189751, 0.6745098, 1, 0, 1,
-0.7597191, 0.166632, -1.27802, 0.6666667, 1, 0, 1,
-0.7574591, -0.7227314, -3.100332, 0.6627451, 1, 0, 1,
-0.7555603, 1.028798, -0.7085322, 0.654902, 1, 0, 1,
-0.7549825, 0.08680901, -1.025721, 0.6509804, 1, 0, 1,
-0.7530032, 0.1403104, -2.78681, 0.6431373, 1, 0, 1,
-0.7470213, -1.549846, -1.087282, 0.6392157, 1, 0, 1,
-0.7462575, 0.09171789, 0.5506251, 0.6313726, 1, 0, 1,
-0.7452733, -1.209533, -4.092615, 0.627451, 1, 0, 1,
-0.7415922, 0.1588627, -1.962379, 0.6196079, 1, 0, 1,
-0.7387261, 0.9392018, -0.5157588, 0.6156863, 1, 0, 1,
-0.7382157, -0.3861416, -2.674949, 0.6078432, 1, 0, 1,
-0.7237946, 0.5400822, -0.8974405, 0.6039216, 1, 0, 1,
-0.723534, 0.01658566, -3.038643, 0.5960785, 1, 0, 1,
-0.7170409, -0.7518314, -2.184308, 0.5882353, 1, 0, 1,
-0.7125739, -2.783613, -4.609408, 0.5843138, 1, 0, 1,
-0.7094883, 1.228478, -0.6959032, 0.5764706, 1, 0, 1,
-0.706887, -0.5137011, -1.81774, 0.572549, 1, 0, 1,
-0.7050359, 0.4602085, -1.289633, 0.5647059, 1, 0, 1,
-0.7022299, -0.6655371, -2.82247, 0.5607843, 1, 0, 1,
-0.694419, 1.186617, -0.9876259, 0.5529412, 1, 0, 1,
-0.6905616, -0.6168424, -1.764668, 0.5490196, 1, 0, 1,
-0.6895137, -0.4314266, -3.788084, 0.5411765, 1, 0, 1,
-0.6871527, -1.476583, -2.594609, 0.5372549, 1, 0, 1,
-0.6867157, -0.2373977, -1.253323, 0.5294118, 1, 0, 1,
-0.683217, -1.611215, -0.4476526, 0.5254902, 1, 0, 1,
-0.679661, 0.02510457, -0.7283356, 0.5176471, 1, 0, 1,
-0.6750516, 0.2161059, 0.8139224, 0.5137255, 1, 0, 1,
-0.6729192, 0.6417291, -1.671596, 0.5058824, 1, 0, 1,
-0.6728967, -0.06256073, -0.9229668, 0.5019608, 1, 0, 1,
-0.6721236, 0.1818881, -1.266176, 0.4941176, 1, 0, 1,
-0.6699672, -1.208123, -3.926777, 0.4862745, 1, 0, 1,
-0.6603134, 0.2428762, -0.2148002, 0.4823529, 1, 0, 1,
-0.6594222, 0.1101506, -2.330953, 0.4745098, 1, 0, 1,
-0.6447948, -1.596717, -1.953988, 0.4705882, 1, 0, 1,
-0.6445522, -1.730275, -2.746146, 0.4627451, 1, 0, 1,
-0.6355503, 0.6916748, 0.6627163, 0.4588235, 1, 0, 1,
-0.6345344, 0.2474231, -2.968267, 0.4509804, 1, 0, 1,
-0.6312267, 2.158415, -0.808434, 0.4470588, 1, 0, 1,
-0.6286705, 0.5016567, 0.07666766, 0.4392157, 1, 0, 1,
-0.6279434, 0.6575783, -0.407606, 0.4352941, 1, 0, 1,
-0.6257757, -1.143354, -3.629248, 0.427451, 1, 0, 1,
-0.6243846, 0.1668575, -1.674681, 0.4235294, 1, 0, 1,
-0.6183804, -0.0385461, -2.008538, 0.4156863, 1, 0, 1,
-0.6182561, 0.2438785, -1.031195, 0.4117647, 1, 0, 1,
-0.6180803, -0.8863429, -0.6499146, 0.4039216, 1, 0, 1,
-0.6161784, -0.6522037, -0.8904868, 0.3960784, 1, 0, 1,
-0.6151654, -0.8130903, -2.244928, 0.3921569, 1, 0, 1,
-0.6150041, -1.336124, -2.924161, 0.3843137, 1, 0, 1,
-0.6122591, -0.3240547, -2.800907, 0.3803922, 1, 0, 1,
-0.6110008, -1.501053, -3.006909, 0.372549, 1, 0, 1,
-0.6076508, 1.290322, 0.3012157, 0.3686275, 1, 0, 1,
-0.6045713, 0.4251585, 0.2459075, 0.3607843, 1, 0, 1,
-0.604474, 0.3178564, -2.682483, 0.3568628, 1, 0, 1,
-0.5965821, 0.1614044, -2.059519, 0.3490196, 1, 0, 1,
-0.5956032, -1.202415, -2.053488, 0.345098, 1, 0, 1,
-0.5955545, -0.3965803, -3.041334, 0.3372549, 1, 0, 1,
-0.5955389, 0.9410325, 1.237648, 0.3333333, 1, 0, 1,
-0.5917277, -1.715596, -3.90842, 0.3254902, 1, 0, 1,
-0.5916798, -0.4609334, -2.982108, 0.3215686, 1, 0, 1,
-0.5914772, -0.850955, -3.81996, 0.3137255, 1, 0, 1,
-0.5896631, 1.366238, 0.8195862, 0.3098039, 1, 0, 1,
-0.5849705, 0.8362503, -2.917386, 0.3019608, 1, 0, 1,
-0.5757185, 1.109581, 0.02488819, 0.2941177, 1, 0, 1,
-0.5738281, 0.1485181, -1.505524, 0.2901961, 1, 0, 1,
-0.5694417, 0.3367427, -1.429253, 0.282353, 1, 0, 1,
-0.5673279, -0.361213, -2.499632, 0.2784314, 1, 0, 1,
-0.5666808, -0.5104148, 0.1478821, 0.2705882, 1, 0, 1,
-0.5659768, 1.375588, -1.01893, 0.2666667, 1, 0, 1,
-0.5644378, 0.4273068, -0.395095, 0.2588235, 1, 0, 1,
-0.5634282, 0.05046288, -2.056276, 0.254902, 1, 0, 1,
-0.5632248, 1.057884, -1.763336, 0.2470588, 1, 0, 1,
-0.5610837, 1.903274, -0.1937247, 0.2431373, 1, 0, 1,
-0.5577846, 1.94833, -0.5010092, 0.2352941, 1, 0, 1,
-0.5528848, -0.09523573, -2.700231, 0.2313726, 1, 0, 1,
-0.550862, 1.193597, -1.646796, 0.2235294, 1, 0, 1,
-0.547742, -1.031106, -2.56979, 0.2196078, 1, 0, 1,
-0.5460051, -0.9928693, -3.761487, 0.2117647, 1, 0, 1,
-0.5458602, -1.276506, -3.431196, 0.2078431, 1, 0, 1,
-0.5412536, 0.5919793, -0.3196625, 0.2, 1, 0, 1,
-0.539467, 0.7859213, -0.7038767, 0.1921569, 1, 0, 1,
-0.5392182, -0.2318108, -3.33311, 0.1882353, 1, 0, 1,
-0.5364028, 1.768846, 0.6978698, 0.1803922, 1, 0, 1,
-0.5284769, -0.775043, -3.309472, 0.1764706, 1, 0, 1,
-0.5276393, 0.3517374, -0.7177913, 0.1686275, 1, 0, 1,
-0.5226189, 1.023972, 0.7021356, 0.1647059, 1, 0, 1,
-0.5222834, 0.7304013, 0.1202806, 0.1568628, 1, 0, 1,
-0.5203227, 0.7705382, -0.01448833, 0.1529412, 1, 0, 1,
-0.5096659, -0.7924902, -2.181765, 0.145098, 1, 0, 1,
-0.5062242, -1.826416, -2.634641, 0.1411765, 1, 0, 1,
-0.5010756, -0.3427145, -4.967664, 0.1333333, 1, 0, 1,
-0.500351, -0.08133018, -2.169429, 0.1294118, 1, 0, 1,
-0.4978021, -0.497858, -3.069687, 0.1215686, 1, 0, 1,
-0.4940919, 0.4182231, 0.01074631, 0.1176471, 1, 0, 1,
-0.4915724, -0.3519703, -3.220947, 0.1098039, 1, 0, 1,
-0.4903553, -0.1480498, -2.758013, 0.1058824, 1, 0, 1,
-0.4880363, -0.2858074, -3.717791, 0.09803922, 1, 0, 1,
-0.4878252, 0.333746, 0.3346156, 0.09019608, 1, 0, 1,
-0.4864373, -2.428356, -3.003061, 0.08627451, 1, 0, 1,
-0.483786, -2.114171, -3.941164, 0.07843138, 1, 0, 1,
-0.4837363, -1.038095, -2.988679, 0.07450981, 1, 0, 1,
-0.4825013, 1.787696, -0.7057022, 0.06666667, 1, 0, 1,
-0.4824263, 2.025445, -0.6979095, 0.0627451, 1, 0, 1,
-0.4819973, 0.2913894, -0.8046224, 0.05490196, 1, 0, 1,
-0.4801058, -1.030082, -2.273168, 0.05098039, 1, 0, 1,
-0.4750112, 1.647804, 1.043811, 0.04313726, 1, 0, 1,
-0.4688595, 1.474432, -0.009001262, 0.03921569, 1, 0, 1,
-0.4660571, -0.6315714, -3.659004, 0.03137255, 1, 0, 1,
-0.4612662, 0.6440279, 0.07705648, 0.02745098, 1, 0, 1,
-0.4599511, 1.360344, -0.3034241, 0.01960784, 1, 0, 1,
-0.4567898, 0.1569317, -2.970148, 0.01568628, 1, 0, 1,
-0.4550291, 0.3591619, -1.197759, 0.007843138, 1, 0, 1,
-0.4542783, -0.1581174, -1.735667, 0.003921569, 1, 0, 1,
-0.4525514, -0.5270532, -2.21751, 0, 1, 0.003921569, 1,
-0.4510419, 1.437837, 1.851965, 0, 1, 0.01176471, 1,
-0.4491559, 0.3175893, -1.611799, 0, 1, 0.01568628, 1,
-0.4475921, -0.9222207, -3.611583, 0, 1, 0.02352941, 1,
-0.4461186, -0.4918987, -2.805425, 0, 1, 0.02745098, 1,
-0.4427829, 0.4543576, -0.5474383, 0, 1, 0.03529412, 1,
-0.4427689, -0.1242636, -2.113976, 0, 1, 0.03921569, 1,
-0.4417419, 0.6826608, -1.901262, 0, 1, 0.04705882, 1,
-0.4372684, 0.2714529, -1.029395, 0, 1, 0.05098039, 1,
-0.4331845, 0.7324361, -1.11279, 0, 1, 0.05882353, 1,
-0.4331048, 0.887733, -1.729602, 0, 1, 0.0627451, 1,
-0.4307038, -0.3759589, -0.9394868, 0, 1, 0.07058824, 1,
-0.4228101, 1.310566, 0.6505753, 0, 1, 0.07450981, 1,
-0.4223116, -0.01630457, -2.240603, 0, 1, 0.08235294, 1,
-0.4222463, -1.605293, -4.52271, 0, 1, 0.08627451, 1,
-0.4210049, -0.185748, -2.267618, 0, 1, 0.09411765, 1,
-0.4191241, 0.8204318, 0.07114332, 0, 1, 0.1019608, 1,
-0.4108369, 1.004574, 0.2985743, 0, 1, 0.1058824, 1,
-0.4096642, 0.9692856, 0.4191065, 0, 1, 0.1137255, 1,
-0.4089351, 1.494767, 0.03113205, 0, 1, 0.1176471, 1,
-0.4005197, -0.9933892, -3.066912, 0, 1, 0.1254902, 1,
-0.3992695, 0.3821674, -2.779175, 0, 1, 0.1294118, 1,
-0.3871027, -0.9900437, -4.386614, 0, 1, 0.1372549, 1,
-0.3846512, -0.2563462, -2.958878, 0, 1, 0.1411765, 1,
-0.3768757, -0.9204009, -2.78695, 0, 1, 0.1490196, 1,
-0.37517, -1.647861, -3.776161, 0, 1, 0.1529412, 1,
-0.3743082, 0.269603, -0.3516031, 0, 1, 0.1607843, 1,
-0.3729102, 1.306111, -1.832188, 0, 1, 0.1647059, 1,
-0.3718581, 1.530003, 0.266309, 0, 1, 0.172549, 1,
-0.3705005, -1.627022, -4.407112, 0, 1, 0.1764706, 1,
-0.3612326, -0.3247293, -2.812035, 0, 1, 0.1843137, 1,
-0.3602663, 0.5273288, -0.4588198, 0, 1, 0.1882353, 1,
-0.3536237, 0.1605355, -1.347019, 0, 1, 0.1960784, 1,
-0.3519168, -0.1058973, -0.7533499, 0, 1, 0.2039216, 1,
-0.345454, 1.199632, -0.795501, 0, 1, 0.2078431, 1,
-0.3437981, -1.891621, -3.208244, 0, 1, 0.2156863, 1,
-0.3418821, 1.07145, -0.3505394, 0, 1, 0.2196078, 1,
-0.3403157, 0.3816907, -1.203128, 0, 1, 0.227451, 1,
-0.3395264, -0.8202561, -2.803996, 0, 1, 0.2313726, 1,
-0.3387409, -0.7182869, -2.524977, 0, 1, 0.2392157, 1,
-0.3384419, 0.8592287, -2.064703, 0, 1, 0.2431373, 1,
-0.3335369, 0.4441416, -0.425181, 0, 1, 0.2509804, 1,
-0.3307263, -0.5936276, -2.5886, 0, 1, 0.254902, 1,
-0.3272206, -0.8058358, -0.8025206, 0, 1, 0.2627451, 1,
-0.3259257, -1.195764, -1.471151, 0, 1, 0.2666667, 1,
-0.325402, -0.4604365, -5.197736, 0, 1, 0.2745098, 1,
-0.3156779, -0.9871199, -4.159199, 0, 1, 0.2784314, 1,
-0.3136171, -0.93333, -3.624342, 0, 1, 0.2862745, 1,
-0.3065438, -1.210888, -3.266314, 0, 1, 0.2901961, 1,
-0.3044037, -1.103812, -3.706701, 0, 1, 0.2980392, 1,
-0.3039274, 0.08190656, -2.146179, 0, 1, 0.3058824, 1,
-0.300439, 0.1658798, -0.8594403, 0, 1, 0.3098039, 1,
-0.3000031, -1.057001, -4.671217, 0, 1, 0.3176471, 1,
-0.2991669, -0.05832075, -1.869521, 0, 1, 0.3215686, 1,
-0.2970487, -2.715335, -3.975842, 0, 1, 0.3294118, 1,
-0.2969912, 0.3002283, -1.987322, 0, 1, 0.3333333, 1,
-0.2966073, 0.1180808, -1.573022, 0, 1, 0.3411765, 1,
-0.2866604, 0.03358847, -0.1475736, 0, 1, 0.345098, 1,
-0.282369, -1.276253, -5.004913, 0, 1, 0.3529412, 1,
-0.2800495, -0.2759084, -2.737068, 0, 1, 0.3568628, 1,
-0.2750958, 0.1249579, -2.283398, 0, 1, 0.3647059, 1,
-0.2719691, -0.1601714, -1.968766, 0, 1, 0.3686275, 1,
-0.2719137, -0.8698038, -2.153219, 0, 1, 0.3764706, 1,
-0.2710936, -0.6447358, -2.658447, 0, 1, 0.3803922, 1,
-0.2608246, -0.6750454, -3.377046, 0, 1, 0.3882353, 1,
-0.2498717, 1.544186, -1.237626, 0, 1, 0.3921569, 1,
-0.2478874, 1.585008, -0.04866705, 0, 1, 0.4, 1,
-0.232801, 0.971014, -1.691221, 0, 1, 0.4078431, 1,
-0.2302182, -1.015904, -1.369381, 0, 1, 0.4117647, 1,
-0.2272796, 1.443713, 1.754965, 0, 1, 0.4196078, 1,
-0.2260423, 1.010545, -1.670811, 0, 1, 0.4235294, 1,
-0.219357, -1.165245, -2.47372, 0, 1, 0.4313726, 1,
-0.2165746, -0.7737362, -0.9633553, 0, 1, 0.4352941, 1,
-0.209977, -2.194733, -3.082604, 0, 1, 0.4431373, 1,
-0.2080903, 1.247006, -0.5223872, 0, 1, 0.4470588, 1,
-0.2045423, 0.3242083, -1.951036, 0, 1, 0.454902, 1,
-0.201664, 0.6862347, -1.029547, 0, 1, 0.4588235, 1,
-0.1880907, -0.4764156, -4.174943, 0, 1, 0.4666667, 1,
-0.1865349, -1.155838, -0.6260763, 0, 1, 0.4705882, 1,
-0.186148, 0.2527874, -0.5940747, 0, 1, 0.4784314, 1,
-0.1858568, -0.09966985, -2.82999, 0, 1, 0.4823529, 1,
-0.1835672, 0.4974469, -0.7980677, 0, 1, 0.4901961, 1,
-0.1833144, -0.1885706, -2.617881, 0, 1, 0.4941176, 1,
-0.1812121, -0.4037937, -3.049917, 0, 1, 0.5019608, 1,
-0.1730744, -1.470743, -2.274417, 0, 1, 0.509804, 1,
-0.1680186, 0.3156497, -1.906348, 0, 1, 0.5137255, 1,
-0.1632565, 0.04467881, -0.09830438, 0, 1, 0.5215687, 1,
-0.1625239, -1.07113, -2.514429, 0, 1, 0.5254902, 1,
-0.1599347, 1.242526, -0.1120625, 0, 1, 0.5333334, 1,
-0.1593865, 0.2076867, 0.3934483, 0, 1, 0.5372549, 1,
-0.1590255, -1.276428, -2.449409, 0, 1, 0.5450981, 1,
-0.1519192, 0.458364, -1.294007, 0, 1, 0.5490196, 1,
-0.1507051, -0.08594608, -3.809394, 0, 1, 0.5568628, 1,
-0.1496483, -2.164268, -2.260675, 0, 1, 0.5607843, 1,
-0.1478944, -1.231647, -2.7834, 0, 1, 0.5686275, 1,
-0.1453204, 2.388456, 0.331691, 0, 1, 0.572549, 1,
-0.1448286, 0.07772195, 0.6991669, 0, 1, 0.5803922, 1,
-0.1439361, 0.8971942, 0.4311657, 0, 1, 0.5843138, 1,
-0.1427597, -0.07948853, -1.286587, 0, 1, 0.5921569, 1,
-0.1420532, -0.131985, -2.884272, 0, 1, 0.5960785, 1,
-0.1411106, 0.8769354, 0.8499948, 0, 1, 0.6039216, 1,
-0.1383147, -1.55927, -3.318821, 0, 1, 0.6117647, 1,
-0.1377582, -0.7969967, -2.746653, 0, 1, 0.6156863, 1,
-0.1297746, 0.6379675, 0.4060464, 0, 1, 0.6235294, 1,
-0.1280493, -0.8195367, -1.310436, 0, 1, 0.627451, 1,
-0.1280383, 1.011325, -1.510204, 0, 1, 0.6352941, 1,
-0.1187695, 1.312564, 1.723931, 0, 1, 0.6392157, 1,
-0.1173305, -1.400177, -3.016355, 0, 1, 0.6470588, 1,
-0.1154566, 0.7462313, 1.227398, 0, 1, 0.6509804, 1,
-0.1139988, 1.090982, -1.589074, 0, 1, 0.6588235, 1,
-0.1121109, 1.159248, -0.818401, 0, 1, 0.6627451, 1,
-0.1109929, -0.3116654, -3.361548, 0, 1, 0.6705883, 1,
-0.1091497, -0.8619734, -4.014884, 0, 1, 0.6745098, 1,
-0.1076414, 1.778589, 0.9194698, 0, 1, 0.682353, 1,
-0.1061846, 0.1784815, 0.6931463, 0, 1, 0.6862745, 1,
-0.1061252, -0.02589598, -2.224165, 0, 1, 0.6941177, 1,
-0.1058451, 0.4729809, -0.4929962, 0, 1, 0.7019608, 1,
-0.101048, 0.2113943, 1.334899, 0, 1, 0.7058824, 1,
-0.09585579, 0.5376298, 0.2280919, 0, 1, 0.7137255, 1,
-0.09091126, -0.692407, -2.556482, 0, 1, 0.7176471, 1,
-0.09003817, 1.322123, 0.2848778, 0, 1, 0.7254902, 1,
-0.08886389, -0.3596751, -3.451562, 0, 1, 0.7294118, 1,
-0.08873945, -0.033555, -1.886259, 0, 1, 0.7372549, 1,
-0.08857191, 0.2080735, 0.07418862, 0, 1, 0.7411765, 1,
-0.08645166, 2.45766, 0.7075096, 0, 1, 0.7490196, 1,
-0.08461525, -1.307756, -2.961766, 0, 1, 0.7529412, 1,
-0.06942802, -0.8433843, -2.469348, 0, 1, 0.7607843, 1,
-0.06868416, -0.6391138, -4.770317, 0, 1, 0.7647059, 1,
-0.06710553, -1.251421, -2.429396, 0, 1, 0.772549, 1,
-0.06518532, 0.4221149, -2.224213, 0, 1, 0.7764706, 1,
-0.05370273, -0.2010013, -2.638685, 0, 1, 0.7843137, 1,
-0.04617213, -1.57519, -3.064143, 0, 1, 0.7882353, 1,
-0.04581868, 0.5856512, -0.3440968, 0, 1, 0.7960784, 1,
-0.04462946, -1.387293, -2.562423, 0, 1, 0.8039216, 1,
-0.04148057, -0.8669913, -3.79656, 0, 1, 0.8078431, 1,
-0.0408037, 1.599801, -1.049789, 0, 1, 0.8156863, 1,
-0.04047078, 0.04382766, -1.396882, 0, 1, 0.8196079, 1,
-0.03626548, 1.251283, -0.3176841, 0, 1, 0.827451, 1,
-0.03614318, -1.310093, -4.124517, 0, 1, 0.8313726, 1,
-0.03033972, -1.024246, -4.818538, 0, 1, 0.8392157, 1,
-0.0296996, 0.4884821, -0.9934446, 0, 1, 0.8431373, 1,
-0.02882026, 0.6158121, -0.05363302, 0, 1, 0.8509804, 1,
-0.02559736, 0.7859908, -0.09258509, 0, 1, 0.854902, 1,
-0.02547857, -1.104339, -4.075863, 0, 1, 0.8627451, 1,
-0.02409106, -0.06222048, -3.092468, 0, 1, 0.8666667, 1,
-0.02191327, -0.2635065, -3.624065, 0, 1, 0.8745098, 1,
-0.02168707, -0.9427073, -4.913826, 0, 1, 0.8784314, 1,
-0.01623271, 1.540694, 0.7418569, 0, 1, 0.8862745, 1,
-0.01600793, 0.3253142, -1.413533, 0, 1, 0.8901961, 1,
-0.01418723, 0.7861103, -1.344948, 0, 1, 0.8980392, 1,
-0.01407377, 0.2955246, 1.20036, 0, 1, 0.9058824, 1,
-0.01382452, -0.2015053, -2.250828, 0, 1, 0.9098039, 1,
-0.01263312, 1.498737, -0.005840073, 0, 1, 0.9176471, 1,
-0.01114078, 1.048375, 0.3724434, 0, 1, 0.9215686, 1,
-0.008985357, 1.319351, -0.1989286, 0, 1, 0.9294118, 1,
-0.007444938, 0.9246038, 1.606429, 0, 1, 0.9333333, 1,
-0.006884531, -0.1510339, -3.2854, 0, 1, 0.9411765, 1,
-0.004595871, -1.112969, -3.327837, 0, 1, 0.945098, 1,
-0.0004136523, -0.01233778, -3.04005, 0, 1, 0.9529412, 1,
0.002093208, 0.4902597, -0.3041668, 0, 1, 0.9568627, 1,
0.002909617, -1.0169, 3.766694, 0, 1, 0.9647059, 1,
0.003775285, 0.1924263, -1.099241, 0, 1, 0.9686275, 1,
0.007164252, 0.5219685, 1.4795, 0, 1, 0.9764706, 1,
0.00910472, 0.6711335, 0.1736445, 0, 1, 0.9803922, 1,
0.01252915, 1.353342, 1.185862, 0, 1, 0.9882353, 1,
0.01511072, -0.5540224, 3.23652, 0, 1, 0.9921569, 1,
0.01556737, 0.9921236, 0.1291854, 0, 1, 1, 1,
0.01808122, 1.362298, -2.291375, 0, 0.9921569, 1, 1,
0.01941017, -0.699011, 4.71684, 0, 0.9882353, 1, 1,
0.0206209, 0.1619092, 0.6407831, 0, 0.9803922, 1, 1,
0.02185217, -0.1968361, 5.630949, 0, 0.9764706, 1, 1,
0.02330788, -0.546931, 2.238926, 0, 0.9686275, 1, 1,
0.02355819, -1.483729, 2.740007, 0, 0.9647059, 1, 1,
0.02390325, 1.162262, 1.284181, 0, 0.9568627, 1, 1,
0.03190085, 0.6770768, 0.6096839, 0, 0.9529412, 1, 1,
0.03193797, 0.2214451, -0.7936603, 0, 0.945098, 1, 1,
0.03226553, -0.2733033, 1.502161, 0, 0.9411765, 1, 1,
0.03947162, 0.4426388, 0.677413, 0, 0.9333333, 1, 1,
0.0406785, 1.727049, 0.4024209, 0, 0.9294118, 1, 1,
0.04299863, -1.336683, 2.94124, 0, 0.9215686, 1, 1,
0.04879248, -0.0643862, 2.874663, 0, 0.9176471, 1, 1,
0.05093032, 1.735729, -0.3040996, 0, 0.9098039, 1, 1,
0.05160731, -0.6075266, 2.4862, 0, 0.9058824, 1, 1,
0.05401624, -0.7929322, 2.653208, 0, 0.8980392, 1, 1,
0.05425731, 0.03741233, 1.216194, 0, 0.8901961, 1, 1,
0.05454195, 1.604519, 0.4691452, 0, 0.8862745, 1, 1,
0.05699624, -0.4303998, 4.261624, 0, 0.8784314, 1, 1,
0.05826697, -2.531873, 3.327888, 0, 0.8745098, 1, 1,
0.06250843, -2.602031, 3.007787, 0, 0.8666667, 1, 1,
0.06304476, -0.5882295, 2.884255, 0, 0.8627451, 1, 1,
0.0658372, -0.485968, 2.457119, 0, 0.854902, 1, 1,
0.0668261, -0.5383872, 3.643379, 0, 0.8509804, 1, 1,
0.06832094, 0.1669899, -0.8494955, 0, 0.8431373, 1, 1,
0.0729458, -0.2536045, 3.198145, 0, 0.8392157, 1, 1,
0.0732298, 0.5892037, -1.92864, 0, 0.8313726, 1, 1,
0.07380511, 1.15493, -0.04621956, 0, 0.827451, 1, 1,
0.07492163, 1.670803, 0.370973, 0, 0.8196079, 1, 1,
0.0759578, -0.7161542, 2.662623, 0, 0.8156863, 1, 1,
0.07640812, -1.407615, 3.076026, 0, 0.8078431, 1, 1,
0.08011755, 1.639387, -1.07133, 0, 0.8039216, 1, 1,
0.08761976, 1.955379, -0.9822893, 0, 0.7960784, 1, 1,
0.08857282, -0.5415192, 3.700997, 0, 0.7882353, 1, 1,
0.08901196, 0.8077686, 0.3216477, 0, 0.7843137, 1, 1,
0.09006508, 0.2819147, 0.4082205, 0, 0.7764706, 1, 1,
0.0903855, -1.317503, 4.789524, 0, 0.772549, 1, 1,
0.09275338, -0.664254, 2.924139, 0, 0.7647059, 1, 1,
0.09366629, 0.9892867, 1.658651, 0, 0.7607843, 1, 1,
0.09477965, 0.6550395, -0.9587399, 0, 0.7529412, 1, 1,
0.09590494, -1.314981, 2.565463, 0, 0.7490196, 1, 1,
0.09651865, -0.06935293, 1.686538, 0, 0.7411765, 1, 1,
0.09840418, -1.210138, 4.213958, 0, 0.7372549, 1, 1,
0.1006139, 1.084531, -0.3877342, 0, 0.7294118, 1, 1,
0.1026383, -0.5196851, 2.648991, 0, 0.7254902, 1, 1,
0.11083, -0.4703267, 3.390738, 0, 0.7176471, 1, 1,
0.1129657, 1.488657, -0.1409274, 0, 0.7137255, 1, 1,
0.1137728, 0.4113892, 0.8774179, 0, 0.7058824, 1, 1,
0.1176845, -0.6759244, 3.15879, 0, 0.6980392, 1, 1,
0.1219232, 0.841611, 0.5960709, 0, 0.6941177, 1, 1,
0.1252168, 1.097982, -1.304198, 0, 0.6862745, 1, 1,
0.1263792, 0.05320129, 0.3994309, 0, 0.682353, 1, 1,
0.1274462, 0.1548663, 3.362601, 0, 0.6745098, 1, 1,
0.1283536, -0.8138443, 1.917968, 0, 0.6705883, 1, 1,
0.1296611, 0.8551697, 2.105317, 0, 0.6627451, 1, 1,
0.1326907, -0.6201649, 3.065155, 0, 0.6588235, 1, 1,
0.134743, -0.4913305, 3.985904, 0, 0.6509804, 1, 1,
0.1425003, -0.1089575, 2.682937, 0, 0.6470588, 1, 1,
0.1427342, 0.4652667, 1.692393, 0, 0.6392157, 1, 1,
0.1429265, 0.3633004, -0.2205803, 0, 0.6352941, 1, 1,
0.1480254, 0.06339092, 1.470101, 0, 0.627451, 1, 1,
0.1580618, 1.099308, 0.9644597, 0, 0.6235294, 1, 1,
0.1604861, -1.261583, 3.5362, 0, 0.6156863, 1, 1,
0.1610335, 1.44183, 0.7378626, 0, 0.6117647, 1, 1,
0.1668601, 0.8091143, 0.03835415, 0, 0.6039216, 1, 1,
0.1680075, -0.6734882, 2.560772, 0, 0.5960785, 1, 1,
0.1684405, -0.1884864, 1.124693, 0, 0.5921569, 1, 1,
0.1703604, -1.494909, 4.035123, 0, 0.5843138, 1, 1,
0.1768497, -1.089778, 2.620608, 0, 0.5803922, 1, 1,
0.1796082, -0.3878194, 0.01110736, 0, 0.572549, 1, 1,
0.1801255, -0.7936332, 2.043187, 0, 0.5686275, 1, 1,
0.1811855, -0.3397508, 1.967116, 0, 0.5607843, 1, 1,
0.1821344, -1.164671, 2.491639, 0, 0.5568628, 1, 1,
0.1834923, -1.293483, 3.493289, 0, 0.5490196, 1, 1,
0.1839515, 1.148365, 1.191977, 0, 0.5450981, 1, 1,
0.1841334, -1.797714, 1.375718, 0, 0.5372549, 1, 1,
0.1925056, 1.033224, -2.002433, 0, 0.5333334, 1, 1,
0.1936536, -0.5511681, 3.522285, 0, 0.5254902, 1, 1,
0.1941792, -1.015714, 2.24251, 0, 0.5215687, 1, 1,
0.2010132, 0.171662, 2.368136, 0, 0.5137255, 1, 1,
0.2039765, 0.04527851, 1.85845, 0, 0.509804, 1, 1,
0.2047872, -1.091979, 3.683923, 0, 0.5019608, 1, 1,
0.2098318, -0.1544751, 2.255384, 0, 0.4941176, 1, 1,
0.2120262, -0.5271884, 2.191852, 0, 0.4901961, 1, 1,
0.212919, 0.7306993, 1.763443, 0, 0.4823529, 1, 1,
0.2138034, 1.569759, -0.118911, 0, 0.4784314, 1, 1,
0.2191818, -1.04115, 2.576145, 0, 0.4705882, 1, 1,
0.2209139, 0.4420713, 0.601431, 0, 0.4666667, 1, 1,
0.2231347, 1.076523, 2.858585, 0, 0.4588235, 1, 1,
0.225335, -1.810757, 2.404627, 0, 0.454902, 1, 1,
0.2274788, 0.7371693, 1.703846, 0, 0.4470588, 1, 1,
0.229941, -0.9476855, 2.126853, 0, 0.4431373, 1, 1,
0.2301023, -0.4008002, 3.402647, 0, 0.4352941, 1, 1,
0.2387717, -1.542635, 3.925917, 0, 0.4313726, 1, 1,
0.2396258, -0.1427328, 3.795357, 0, 0.4235294, 1, 1,
0.2422346, 0.4712796, -0.8881267, 0, 0.4196078, 1, 1,
0.2434797, -1.314498, 3.881645, 0, 0.4117647, 1, 1,
0.2441833, 0.8626251, 0.4218861, 0, 0.4078431, 1, 1,
0.2459377, 0.7894506, -0.410778, 0, 0.4, 1, 1,
0.2482031, 0.4657098, -1.303078, 0, 0.3921569, 1, 1,
0.2498728, 0.05693425, 2.795387, 0, 0.3882353, 1, 1,
0.2512307, 0.02516311, 0.3479519, 0, 0.3803922, 1, 1,
0.2515354, 0.1803814, -0.006574271, 0, 0.3764706, 1, 1,
0.2558955, 0.4837859, 1.225332, 0, 0.3686275, 1, 1,
0.2562417, 0.7459896, 0.3165083, 0, 0.3647059, 1, 1,
0.2572028, -1.626516, 2.940125, 0, 0.3568628, 1, 1,
0.2602991, 2.47728, 0.05541294, 0, 0.3529412, 1, 1,
0.2622313, 0.6125219, 0.7098663, 0, 0.345098, 1, 1,
0.263983, 0.6142164, 0.3029482, 0, 0.3411765, 1, 1,
0.2651385, 0.08575108, 1.19655, 0, 0.3333333, 1, 1,
0.2653135, 0.3938595, 0.6665411, 0, 0.3294118, 1, 1,
0.2669331, -0.70317, 2.785713, 0, 0.3215686, 1, 1,
0.2669932, -1.165611, 4.340728, 0, 0.3176471, 1, 1,
0.2692815, 0.2027651, -0.9413816, 0, 0.3098039, 1, 1,
0.2722579, 1.467511, 0.1765219, 0, 0.3058824, 1, 1,
0.2728679, 1.440127, 0.8153071, 0, 0.2980392, 1, 1,
0.2757344, -0.7656649, 2.985457, 0, 0.2901961, 1, 1,
0.2761475, 0.445501, 2.232729, 0, 0.2862745, 1, 1,
0.280158, 0.2063753, 1.990907, 0, 0.2784314, 1, 1,
0.2841384, 0.4363779, 1.217945, 0, 0.2745098, 1, 1,
0.2849766, 0.1255698, 2.01907, 0, 0.2666667, 1, 1,
0.2856635, 1.406315, 0.2991505, 0, 0.2627451, 1, 1,
0.2883489, 1.057371, -0.7674329, 0, 0.254902, 1, 1,
0.2908466, 0.1960298, 1.337561, 0, 0.2509804, 1, 1,
0.295018, -0.770347, 4.002666, 0, 0.2431373, 1, 1,
0.2969691, 1.402912, -0.6673763, 0, 0.2392157, 1, 1,
0.2991897, 0.9132114, -0.1452748, 0, 0.2313726, 1, 1,
0.3051389, 0.5679039, 0.238901, 0, 0.227451, 1, 1,
0.312341, -1.38978, 3.076245, 0, 0.2196078, 1, 1,
0.31515, -0.8889084, 0.9508208, 0, 0.2156863, 1, 1,
0.3153188, 0.8423184, 1.192297, 0, 0.2078431, 1, 1,
0.3153802, 0.1153959, 0.1853779, 0, 0.2039216, 1, 1,
0.3156932, 0.5283005, 0.05933816, 0, 0.1960784, 1, 1,
0.3171754, 0.6149743, 1.007875, 0, 0.1882353, 1, 1,
0.3189696, -1.091787, 2.931452, 0, 0.1843137, 1, 1,
0.323329, -0.4214807, 0.9321949, 0, 0.1764706, 1, 1,
0.3286427, 0.001304817, 0.562764, 0, 0.172549, 1, 1,
0.3306578, -0.5066135, 1.144126, 0, 0.1647059, 1, 1,
0.3385338, -1.430051, 3.852574, 0, 0.1607843, 1, 1,
0.3386732, -0.6226349, 2.641973, 0, 0.1529412, 1, 1,
0.3486013, 2.053655, 0.2785814, 0, 0.1490196, 1, 1,
0.3522682, -0.2894218, 2.304073, 0, 0.1411765, 1, 1,
0.354263, -0.6908948, 2.093671, 0, 0.1372549, 1, 1,
0.3556091, -1.058197, 1.601109, 0, 0.1294118, 1, 1,
0.3633641, 0.1519989, 1.462251, 0, 0.1254902, 1, 1,
0.3635727, -1.697321, 1.868296, 0, 0.1176471, 1, 1,
0.3695388, -2.024509, 4.033391, 0, 0.1137255, 1, 1,
0.3704303, 0.9676023, -0.4234296, 0, 0.1058824, 1, 1,
0.3705838, 1.427583, -0.9714298, 0, 0.09803922, 1, 1,
0.3727058, -1.866112, 5.147156, 0, 0.09411765, 1, 1,
0.3732963, 1.990664, 0.9280108, 0, 0.08627451, 1, 1,
0.3734204, -0.320671, 1.682007, 0, 0.08235294, 1, 1,
0.3743593, -0.1124236, 2.821865, 0, 0.07450981, 1, 1,
0.3766744, -0.7397977, 2.350933, 0, 0.07058824, 1, 1,
0.37815, 0.6674082, 2.67423, 0, 0.0627451, 1, 1,
0.3783667, 0.1116478, 0.9825887, 0, 0.05882353, 1, 1,
0.3792327, -0.9030951, 2.839167, 0, 0.05098039, 1, 1,
0.3870025, -0.3027683, 3.318188, 0, 0.04705882, 1, 1,
0.3919337, -1.141201, 3.409196, 0, 0.03921569, 1, 1,
0.4006347, -2.266117, 2.953472, 0, 0.03529412, 1, 1,
0.4016642, 0.3112927, 2.350568, 0, 0.02745098, 1, 1,
0.4021167, 1.829457, -0.6703171, 0, 0.02352941, 1, 1,
0.4058242, -0.8304954, 3.208019, 0, 0.01568628, 1, 1,
0.4085986, 1.513319, -0.6116565, 0, 0.01176471, 1, 1,
0.4087994, -0.0354511, 1.099568, 0, 0.003921569, 1, 1,
0.4132905, -0.8495833, 3.788039, 0.003921569, 0, 1, 1,
0.417722, 0.1690292, 1.385263, 0.007843138, 0, 1, 1,
0.4186231, 0.4169193, -0.1009995, 0.01568628, 0, 1, 1,
0.4321259, -0.384989, 2.344371, 0.01960784, 0, 1, 1,
0.437545, -1.20475, 2.940654, 0.02745098, 0, 1, 1,
0.4394808, 0.9789802, -1.173323, 0.03137255, 0, 1, 1,
0.440847, -0.2635222, 0.5676714, 0.03921569, 0, 1, 1,
0.4442274, -0.7921537, 3.870915, 0.04313726, 0, 1, 1,
0.4471864, 0.1488, 1.109511, 0.05098039, 0, 1, 1,
0.4480534, -0.02475238, 0.5400141, 0.05490196, 0, 1, 1,
0.4490954, -0.3243493, 1.779922, 0.0627451, 0, 1, 1,
0.4530606, -0.005415394, 0.5171287, 0.06666667, 0, 1, 1,
0.4600437, 0.6711457, -0.4338897, 0.07450981, 0, 1, 1,
0.4610105, 0.8161261, 1.333773, 0.07843138, 0, 1, 1,
0.4617268, -2.345323, 2.007684, 0.08627451, 0, 1, 1,
0.4656639, -1.0288, 4.297779, 0.09019608, 0, 1, 1,
0.4671209, 1.091189, -0.6553329, 0.09803922, 0, 1, 1,
0.4734045, 0.3007222, 1.729393, 0.1058824, 0, 1, 1,
0.4740823, -1.864308, 1.517188, 0.1098039, 0, 1, 1,
0.4745241, 1.065923, 0.4598254, 0.1176471, 0, 1, 1,
0.4793928, -0.497905, 3.315916, 0.1215686, 0, 1, 1,
0.4803334, -0.04490599, 0.0277206, 0.1294118, 0, 1, 1,
0.4807046, -0.02838151, 1.942986, 0.1333333, 0, 1, 1,
0.4857101, 0.5595241, 1.060944, 0.1411765, 0, 1, 1,
0.487508, 1.396552, 0.3421195, 0.145098, 0, 1, 1,
0.4877199, 1.706701, 1.338306, 0.1529412, 0, 1, 1,
0.4903434, 0.4945078, 1.569291, 0.1568628, 0, 1, 1,
0.4934476, 0.3048632, -0.5528792, 0.1647059, 0, 1, 1,
0.4956439, -3.005031, 2.210682, 0.1686275, 0, 1, 1,
0.4960127, 0.4102206, 0.9918832, 0.1764706, 0, 1, 1,
0.4982255, -2.560766, 2.995783, 0.1803922, 0, 1, 1,
0.5033226, 0.8798085, 0.2337515, 0.1882353, 0, 1, 1,
0.5055298, 0.572087, 1.262454, 0.1921569, 0, 1, 1,
0.5056629, -2.064468, 2.033139, 0.2, 0, 1, 1,
0.5106402, 0.12802, 1.628186, 0.2078431, 0, 1, 1,
0.5107372, -0.7087854, 1.247342, 0.2117647, 0, 1, 1,
0.5153521, 1.43578, 0.9543445, 0.2196078, 0, 1, 1,
0.5210173, -0.4092689, 1.219617, 0.2235294, 0, 1, 1,
0.5317114, 1.296139, -0.2696262, 0.2313726, 0, 1, 1,
0.5320616, 0.4837826, 0.2392303, 0.2352941, 0, 1, 1,
0.5320818, 0.2184718, 0.251956, 0.2431373, 0, 1, 1,
0.5424109, -0.7814057, 3.136565, 0.2470588, 0, 1, 1,
0.5428289, 0.8881974, 0.7674874, 0.254902, 0, 1, 1,
0.5435973, -0.8725817, 3.137835, 0.2588235, 0, 1, 1,
0.5439826, -1.77833, 2.864769, 0.2666667, 0, 1, 1,
0.5474854, 1.128024, 1.743526, 0.2705882, 0, 1, 1,
0.5504214, -0.3594838, 2.401352, 0.2784314, 0, 1, 1,
0.5541245, 0.4424195, 1.232877, 0.282353, 0, 1, 1,
0.5598372, -0.3499665, 1.413274, 0.2901961, 0, 1, 1,
0.5606751, 0.6818794, -0.2855188, 0.2941177, 0, 1, 1,
0.567582, 0.6678746, 0.2519301, 0.3019608, 0, 1, 1,
0.5676292, -0.4031329, 1.836201, 0.3098039, 0, 1, 1,
0.5708737, 1.122, 0.7846828, 0.3137255, 0, 1, 1,
0.5752285, 0.3049411, 1.870259, 0.3215686, 0, 1, 1,
0.5764287, -0.3118199, 1.732745, 0.3254902, 0, 1, 1,
0.576644, -1.395786, 2.571159, 0.3333333, 0, 1, 1,
0.5773159, -0.2057797, 2.603928, 0.3372549, 0, 1, 1,
0.5776489, -0.7453907, 3.705193, 0.345098, 0, 1, 1,
0.5878991, 1.358178, 1.186347, 0.3490196, 0, 1, 1,
0.5884975, 0.637416, 0.7826054, 0.3568628, 0, 1, 1,
0.5908375, -1.310967, 2.95459, 0.3607843, 0, 1, 1,
0.6020647, 0.425213, 0.8345187, 0.3686275, 0, 1, 1,
0.6043271, 0.07022442, 2.047097, 0.372549, 0, 1, 1,
0.6044124, -0.6254914, 2.664033, 0.3803922, 0, 1, 1,
0.6062388, 0.1283643, 2.15683, 0.3843137, 0, 1, 1,
0.6104174, -0.4555066, 2.980491, 0.3921569, 0, 1, 1,
0.6110048, 0.08849365, 1.522896, 0.3960784, 0, 1, 1,
0.6125091, 0.9319574, 0.4728798, 0.4039216, 0, 1, 1,
0.619384, 1.068745, -2.021811, 0.4117647, 0, 1, 1,
0.6207032, 0.6413103, 1.093571, 0.4156863, 0, 1, 1,
0.6208744, 0.3346972, 0.7626995, 0.4235294, 0, 1, 1,
0.6217118, -0.4258612, 3.445421, 0.427451, 0, 1, 1,
0.6426139, -1.193951, 3.269384, 0.4352941, 0, 1, 1,
0.6430396, -0.00296219, 0.5930209, 0.4392157, 0, 1, 1,
0.644514, 1.944748, 1.764832, 0.4470588, 0, 1, 1,
0.649452, 0.4811509, -0.4158493, 0.4509804, 0, 1, 1,
0.6501827, 0.7296987, -0.05266193, 0.4588235, 0, 1, 1,
0.6525869, -0.1039686, 0.8292254, 0.4627451, 0, 1, 1,
0.6567082, 0.01972861, 2.093726, 0.4705882, 0, 1, 1,
0.6575624, -0.04067815, 3.111404, 0.4745098, 0, 1, 1,
0.6576884, 0.5198116, 1.405228, 0.4823529, 0, 1, 1,
0.6622304, 0.5118313, 1.260766, 0.4862745, 0, 1, 1,
0.6629274, 0.7633601, -0.4020501, 0.4941176, 0, 1, 1,
0.6655611, -0.1523477, 1.414551, 0.5019608, 0, 1, 1,
0.6886334, -1.297334, 3.147002, 0.5058824, 0, 1, 1,
0.6892334, 1.083863, 0.6393001, 0.5137255, 0, 1, 1,
0.6898103, 0.2749966, 2.60941, 0.5176471, 0, 1, 1,
0.6899223, -0.6840874, 0.315176, 0.5254902, 0, 1, 1,
0.6931202, 0.09103389, 2.835006, 0.5294118, 0, 1, 1,
0.6950835, 1.42008, 1.333691, 0.5372549, 0, 1, 1,
0.6968804, 1.152593, 0.3286361, 0.5411765, 0, 1, 1,
0.6975698, 0.8065364, -0.9581575, 0.5490196, 0, 1, 1,
0.7045368, 0.64797, -0.02800398, 0.5529412, 0, 1, 1,
0.7050385, 0.112822, 0.6455441, 0.5607843, 0, 1, 1,
0.710161, -0.6240082, 2.880549, 0.5647059, 0, 1, 1,
0.7123657, -4.147081, 3.029082, 0.572549, 0, 1, 1,
0.7185962, 1.343487, 0.4258305, 0.5764706, 0, 1, 1,
0.7278371, 0.6165758, 0.9227101, 0.5843138, 0, 1, 1,
0.7356727, -0.3797967, 0.3869397, 0.5882353, 0, 1, 1,
0.7382453, 1.0781, -0.6658993, 0.5960785, 0, 1, 1,
0.7427837, -1.828676, 2.979193, 0.6039216, 0, 1, 1,
0.7438322, -1.420205, 2.633433, 0.6078432, 0, 1, 1,
0.746734, 0.3316524, 0.4643495, 0.6156863, 0, 1, 1,
0.749724, 0.3572387, 2.181116, 0.6196079, 0, 1, 1,
0.7542772, 2.174837, 1.243033, 0.627451, 0, 1, 1,
0.7598848, 0.4114855, 1.221473, 0.6313726, 0, 1, 1,
0.7599747, 0.1321225, 1.671414, 0.6392157, 0, 1, 1,
0.7624858, 0.17638, 3.362492, 0.6431373, 0, 1, 1,
0.7659001, 2.111143, 2.023603, 0.6509804, 0, 1, 1,
0.7699768, 1.119827, 3.183101, 0.654902, 0, 1, 1,
0.7711498, 0.2324193, 1.144776, 0.6627451, 0, 1, 1,
0.7712612, 1.038748, 1.410916, 0.6666667, 0, 1, 1,
0.77219, -1.217864, 1.635631, 0.6745098, 0, 1, 1,
0.7763923, 0.2747129, -1.092639, 0.6784314, 0, 1, 1,
0.7767304, -0.3382755, 2.191085, 0.6862745, 0, 1, 1,
0.7770831, -0.1571964, 1.344425, 0.6901961, 0, 1, 1,
0.7776069, 0.01961325, 0.8868451, 0.6980392, 0, 1, 1,
0.7788664, 0.7341135, 0.2231246, 0.7058824, 0, 1, 1,
0.7789584, -0.4042596, 2.444211, 0.7098039, 0, 1, 1,
0.7791463, 0.5008612, 0.7732511, 0.7176471, 0, 1, 1,
0.7864466, -0.7614067, 3.125142, 0.7215686, 0, 1, 1,
0.7951478, -0.6487247, 2.706466, 0.7294118, 0, 1, 1,
0.8033295, 0.7626913, -1.326982, 0.7333333, 0, 1, 1,
0.8050083, 0.1391353, 3.436404, 0.7411765, 0, 1, 1,
0.8063094, -0.5989321, 0.974236, 0.7450981, 0, 1, 1,
0.8092451, -0.06165145, 2.65508, 0.7529412, 0, 1, 1,
0.8100449, -0.3196646, 2.490345, 0.7568628, 0, 1, 1,
0.8162792, 0.5349212, 1.337543, 0.7647059, 0, 1, 1,
0.8200837, -2.144835, 1.595542, 0.7686275, 0, 1, 1,
0.8227746, -0.4554926, 3.055043, 0.7764706, 0, 1, 1,
0.8276775, -1.200858, 3.602256, 0.7803922, 0, 1, 1,
0.8332819, -0.6956961, 2.500286, 0.7882353, 0, 1, 1,
0.8392037, 1.86945, 0.1489354, 0.7921569, 0, 1, 1,
0.8399199, 1.322965, 0.4999114, 0.8, 0, 1, 1,
0.84068, -0.1857798, 1.261146, 0.8078431, 0, 1, 1,
0.8457614, -0.3894818, 3.316998, 0.8117647, 0, 1, 1,
0.8541226, 1.000405, 0.6088572, 0.8196079, 0, 1, 1,
0.8625354, -0.1975424, 2.12799, 0.8235294, 0, 1, 1,
0.8636279, -0.08453427, 1.767356, 0.8313726, 0, 1, 1,
0.876501, 0.1052367, 0.8882871, 0.8352941, 0, 1, 1,
0.8778841, -0.09974696, 1.555254, 0.8431373, 0, 1, 1,
0.8819649, -0.3172816, 0.8988075, 0.8470588, 0, 1, 1,
0.8859288, 1.00783, 2.198793, 0.854902, 0, 1, 1,
0.8905907, -0.5312912, 3.03619, 0.8588235, 0, 1, 1,
0.900024, 0.4818492, 0.6044089, 0.8666667, 0, 1, 1,
0.9040163, 0.3646815, 0.7977005, 0.8705882, 0, 1, 1,
0.9068468, -0.8698096, 2.330724, 0.8784314, 0, 1, 1,
0.9103577, -0.7135687, 2.755654, 0.8823529, 0, 1, 1,
0.9163854, 1.413096, -1.241833, 0.8901961, 0, 1, 1,
0.9165177, -0.3621173, 1.87328, 0.8941177, 0, 1, 1,
0.9198913, 1.622445, -0.2776242, 0.9019608, 0, 1, 1,
0.9423345, -2.031246, 2.711215, 0.9098039, 0, 1, 1,
0.9440131, 1.248445, -1.574368, 0.9137255, 0, 1, 1,
0.9461554, 0.8514439, 1.563592, 0.9215686, 0, 1, 1,
0.9463128, -0.1082118, 4.278232, 0.9254902, 0, 1, 1,
0.9466274, 2.374336, 0.4040312, 0.9333333, 0, 1, 1,
0.9538594, 0.009548481, 1.30982, 0.9372549, 0, 1, 1,
0.9560097, -0.4569914, 2.382661, 0.945098, 0, 1, 1,
0.9630366, -1.149448, 2.953093, 0.9490196, 0, 1, 1,
0.9677289, -0.1252874, 1.256882, 0.9568627, 0, 1, 1,
0.9712061, -1.337948, 3.040094, 0.9607843, 0, 1, 1,
0.9716774, -0.404057, 2.791629, 0.9686275, 0, 1, 1,
0.9756779, -0.8855211, 2.325564, 0.972549, 0, 1, 1,
0.9775658, -1.324198, 1.962666, 0.9803922, 0, 1, 1,
0.9835098, -0.06829541, 0.5200038, 0.9843137, 0, 1, 1,
0.9849935, -0.1980713, 1.400487, 0.9921569, 0, 1, 1,
0.9889334, -1.283796, 2.637293, 0.9960784, 0, 1, 1,
0.989861, 0.2451138, 2.171098, 1, 0, 0.9960784, 1,
0.9935663, 0.06190687, 0.5049467, 1, 0, 0.9882353, 1,
1.00054, -0.7369334, 1.724226, 1, 0, 0.9843137, 1,
1.006342, 0.2174713, 1.084258, 1, 0, 0.9764706, 1,
1.007485, 0.01474357, 1.408285, 1, 0, 0.972549, 1,
1.007951, 0.4150472, 2.485701, 1, 0, 0.9647059, 1,
1.008328, 0.008016407, 1.930731, 1, 0, 0.9607843, 1,
1.013024, -0.7069275, 3.556825, 1, 0, 0.9529412, 1,
1.014175, 1.05274, -0.1808932, 1, 0, 0.9490196, 1,
1.017524, -0.9371562, 2.201421, 1, 0, 0.9411765, 1,
1.018547, -0.1832995, 1.474648, 1, 0, 0.9372549, 1,
1.022605, -0.4871464, 2.836168, 1, 0, 0.9294118, 1,
1.027199, -0.5018749, 2.979216, 1, 0, 0.9254902, 1,
1.027744, 1.040767, 0.8471246, 1, 0, 0.9176471, 1,
1.033666, -2.135702, 2.038974, 1, 0, 0.9137255, 1,
1.0352, -1.604491, 1.219221, 1, 0, 0.9058824, 1,
1.035291, 1.942437, 0.3188528, 1, 0, 0.9019608, 1,
1.040729, -0.5580315, 4.199109, 1, 0, 0.8941177, 1,
1.042536, 0.08439446, 1.444759, 1, 0, 0.8862745, 1,
1.046744, 0.4339108, 1.998052, 1, 0, 0.8823529, 1,
1.054017, 0.8320175, -0.3155802, 1, 0, 0.8745098, 1,
1.060942, 1.993334, -0.3753129, 1, 0, 0.8705882, 1,
1.067983, 0.03258358, 2.0279, 1, 0, 0.8627451, 1,
1.068676, -2.208291, 3.247713, 1, 0, 0.8588235, 1,
1.076769, -1.115366, 1.137787, 1, 0, 0.8509804, 1,
1.077027, -1.359168, 4.09856, 1, 0, 0.8470588, 1,
1.083182, 0.2224376, 2.00634, 1, 0, 0.8392157, 1,
1.085155, 0.8109942, -1.711273, 1, 0, 0.8352941, 1,
1.090578, -0.1795305, 1.239345, 1, 0, 0.827451, 1,
1.100097, -0.322132, 0.1372527, 1, 0, 0.8235294, 1,
1.100545, 0.2927241, 1.736459, 1, 0, 0.8156863, 1,
1.112347, -0.8634529, 3.610739, 1, 0, 0.8117647, 1,
1.117067, -0.5358779, 2.42228, 1, 0, 0.8039216, 1,
1.12395, -1.805793, 1.826486, 1, 0, 0.7960784, 1,
1.13795, 0.2005668, 2.612108, 1, 0, 0.7921569, 1,
1.142608, -0.1363269, 0.1168652, 1, 0, 0.7843137, 1,
1.148033, 1.732203, 1.645248, 1, 0, 0.7803922, 1,
1.152029, 1.20079, 1.804962, 1, 0, 0.772549, 1,
1.156417, -0.5946598, 1.427218, 1, 0, 0.7686275, 1,
1.160203, 0.09686499, 3.764871, 1, 0, 0.7607843, 1,
1.160357, 1.207341, 0.9755841, 1, 0, 0.7568628, 1,
1.160846, -0.1707876, 0.4160352, 1, 0, 0.7490196, 1,
1.163051, 1.489434, -0.1495389, 1, 0, 0.7450981, 1,
1.163915, -0.1996729, 0.2556819, 1, 0, 0.7372549, 1,
1.178096, 0.1933024, 0.09782603, 1, 0, 0.7333333, 1,
1.178792, 0.3992992, 2.370498, 1, 0, 0.7254902, 1,
1.184994, -0.2424206, 1.113739, 1, 0, 0.7215686, 1,
1.187328, 0.6438065, 1.166124, 1, 0, 0.7137255, 1,
1.189133, 1.551805, -0.4107605, 1, 0, 0.7098039, 1,
1.200777, 0.07280476, 1.348474, 1, 0, 0.7019608, 1,
1.210471, 0.9924249, 0.8750877, 1, 0, 0.6941177, 1,
1.214924, 0.2687925, -1.073254, 1, 0, 0.6901961, 1,
1.218832, 1.103517, -0.0780958, 1, 0, 0.682353, 1,
1.236187, -1.088405, 2.622429, 1, 0, 0.6784314, 1,
1.238639, -2.312739, 3.135926, 1, 0, 0.6705883, 1,
1.246044, 1.615012, 0.9941802, 1, 0, 0.6666667, 1,
1.246693, 0.01962648, 2.651224, 1, 0, 0.6588235, 1,
1.247044, 0.1696614, 2.360259, 1, 0, 0.654902, 1,
1.26358, -0.7407991, 2.153735, 1, 0, 0.6470588, 1,
1.266173, -1.245044, 3.470381, 1, 0, 0.6431373, 1,
1.271549, -0.6824216, 1.484764, 1, 0, 0.6352941, 1,
1.287466, 2.086659, 2.228869, 1, 0, 0.6313726, 1,
1.295115, -0.8063729, 1.617779, 1, 0, 0.6235294, 1,
1.297263, 0.108421, 3.150297, 1, 0, 0.6196079, 1,
1.303043, -1.119857, 2.094308, 1, 0, 0.6117647, 1,
1.304829, 0.8204516, 1.150224, 1, 0, 0.6078432, 1,
1.305048, -0.3762366, 0.769982, 1, 0, 0.6, 1,
1.305942, -0.3224994, 3.932169, 1, 0, 0.5921569, 1,
1.306779, -0.5104427, 2.828229, 1, 0, 0.5882353, 1,
1.308637, -0.458461, 1.377371, 1, 0, 0.5803922, 1,
1.31525, -1.783689, 3.013051, 1, 0, 0.5764706, 1,
1.318111, 1.599396, 0.3569181, 1, 0, 0.5686275, 1,
1.325269, -1.293044, 1.855818, 1, 0, 0.5647059, 1,
1.349719, -0.2362788, 1.519689, 1, 0, 0.5568628, 1,
1.354476, 0.5045987, 1.696157, 1, 0, 0.5529412, 1,
1.360928, -0.1751009, 2.592038, 1, 0, 0.5450981, 1,
1.368793, 0.1746078, 1.42743, 1, 0, 0.5411765, 1,
1.373516, 0.4319915, 0.5352831, 1, 0, 0.5333334, 1,
1.375601, -0.9062387, 3.383826, 1, 0, 0.5294118, 1,
1.398621, -0.7050849, 2.37187, 1, 0, 0.5215687, 1,
1.399351, 0.1266887, 0.1945632, 1, 0, 0.5176471, 1,
1.401759, 1.485734, 0.4425375, 1, 0, 0.509804, 1,
1.408839, -0.520575, 2.793748, 1, 0, 0.5058824, 1,
1.41342, -0.5925258, 3.322138, 1, 0, 0.4980392, 1,
1.415791, 0.4659257, 1.760398, 1, 0, 0.4901961, 1,
1.41603, 0.7192306, 1.046485, 1, 0, 0.4862745, 1,
1.418075, -0.07451198, 2.517648, 1, 0, 0.4784314, 1,
1.424658, 0.6424994, 1.029644, 1, 0, 0.4745098, 1,
1.425495, -0.0007601024, 1.686623, 1, 0, 0.4666667, 1,
1.426414, 0.8588445, 2.9188, 1, 0, 0.4627451, 1,
1.430478, 0.711723, 2.83861, 1, 0, 0.454902, 1,
1.435824, -0.5893345, 0.8305844, 1, 0, 0.4509804, 1,
1.447197, -2.335357, 2.306335, 1, 0, 0.4431373, 1,
1.451379, 1.215066, 1.700256, 1, 0, 0.4392157, 1,
1.463403, 0.4112852, 0.6664493, 1, 0, 0.4313726, 1,
1.492785, 0.4818102, 0.8588609, 1, 0, 0.427451, 1,
1.50378, 0.8466842, 1.591858, 1, 0, 0.4196078, 1,
1.504252, 1.216634, -0.1814154, 1, 0, 0.4156863, 1,
1.507886, -1.029012, 1.154563, 1, 0, 0.4078431, 1,
1.516583, 0.2181717, 2.162637, 1, 0, 0.4039216, 1,
1.517979, 1.347195, 1.413569, 1, 0, 0.3960784, 1,
1.520579, 0.3630221, 0.3753807, 1, 0, 0.3882353, 1,
1.534459, -2.076141, 1.38023, 1, 0, 0.3843137, 1,
1.539248, 0.2029538, 2.315854, 1, 0, 0.3764706, 1,
1.552784, -0.607474, 2.947364, 1, 0, 0.372549, 1,
1.553111, 1.177696, 1.171372, 1, 0, 0.3647059, 1,
1.563591, 0.428684, 1.245423, 1, 0, 0.3607843, 1,
1.570848, -0.1662924, 2.182386, 1, 0, 0.3529412, 1,
1.579959, 0.01498845, 2.557232, 1, 0, 0.3490196, 1,
1.581096, -0.3648973, 1.451324, 1, 0, 0.3411765, 1,
1.59104, 1.846112, -0.7157124, 1, 0, 0.3372549, 1,
1.595803, 1.16601, 0.6806499, 1, 0, 0.3294118, 1,
1.598317, -0.5811414, 1.312626, 1, 0, 0.3254902, 1,
1.598659, 0.7690305, -0.7104186, 1, 0, 0.3176471, 1,
1.602392, -1.488896, 2.192459, 1, 0, 0.3137255, 1,
1.606681, 0.7844914, 2.698078, 1, 0, 0.3058824, 1,
1.61369, 1.812874, 2.152391, 1, 0, 0.2980392, 1,
1.615091, -0.04913164, 1.164498, 1, 0, 0.2941177, 1,
1.625971, 1.832137, 1.766477, 1, 0, 0.2862745, 1,
1.634716, 0.3504404, 0.6628531, 1, 0, 0.282353, 1,
1.640909, 0.5503049, 2.086088, 1, 0, 0.2745098, 1,
1.687875, -1.01342, 3.108405, 1, 0, 0.2705882, 1,
1.714184, -0.2221149, 1.463542, 1, 0, 0.2627451, 1,
1.719552, 0.2276109, 2.703437, 1, 0, 0.2588235, 1,
1.74603, -1.428924, 2.04889, 1, 0, 0.2509804, 1,
1.746629, 0.9413665, 2.045304, 1, 0, 0.2470588, 1,
1.762115, -0.2800971, 2.104837, 1, 0, 0.2392157, 1,
1.770488, 0.1825447, 1.951164, 1, 0, 0.2352941, 1,
1.774505, 0.7413631, -0.2560796, 1, 0, 0.227451, 1,
1.782073, -2.049306, 4.005499, 1, 0, 0.2235294, 1,
1.784268, 0.7505159, 1.406897, 1, 0, 0.2156863, 1,
1.784812, -0.733013, 2.482066, 1, 0, 0.2117647, 1,
1.80465, -1.242724, 1.280721, 1, 0, 0.2039216, 1,
1.811312, 2.686932, 2.131563, 1, 0, 0.1960784, 1,
1.825976, -0.3240122, 2.103518, 1, 0, 0.1921569, 1,
1.846067, -1.059208, 2.409117, 1, 0, 0.1843137, 1,
1.854945, -0.75814, -0.04673084, 1, 0, 0.1803922, 1,
1.85904, -0.5200357, 2.313267, 1, 0, 0.172549, 1,
1.859758, 0.3810866, 0.8108784, 1, 0, 0.1686275, 1,
1.862892, 1.42447, 0.7882971, 1, 0, 0.1607843, 1,
1.867423, 0.1238659, 1.34999, 1, 0, 0.1568628, 1,
1.879679, 0.57609, 1.111473, 1, 0, 0.1490196, 1,
1.882989, 0.544167, 1.31699, 1, 0, 0.145098, 1,
1.89282, -1.117806, 3.588742, 1, 0, 0.1372549, 1,
1.900801, -1.044259, 2.584557, 1, 0, 0.1333333, 1,
1.974597, 0.3635337, 1.109702, 1, 0, 0.1254902, 1,
2.002218, -1.205587, 4.328706, 1, 0, 0.1215686, 1,
2.049305, 2.705017, 1.149859, 1, 0, 0.1137255, 1,
2.055773, 2.111501, 2.196097, 1, 0, 0.1098039, 1,
2.124279, 0.8423876, 0.04212157, 1, 0, 0.1019608, 1,
2.14074, -0.04950069, 1.651645, 1, 0, 0.09411765, 1,
2.150747, -0.925204, 3.26059, 1, 0, 0.09019608, 1,
2.163838, 1.823287, -0.164185, 1, 0, 0.08235294, 1,
2.17738, 1.393911, 1.853767, 1, 0, 0.07843138, 1,
2.238044, 0.8104516, 0.8001145, 1, 0, 0.07058824, 1,
2.255252, 0.329442, 2.596802, 1, 0, 0.06666667, 1,
2.311584, -0.1328185, 0.6654083, 1, 0, 0.05882353, 1,
2.370806, -2.086135, 2.175549, 1, 0, 0.05490196, 1,
2.413252, 0.1519001, 2.221833, 1, 0, 0.04705882, 1,
2.415139, -0.8346702, 1.481783, 1, 0, 0.04313726, 1,
2.479459, 1.025433, 0.5184993, 1, 0, 0.03529412, 1,
2.513505, 2.111734, 1.080433, 1, 0, 0.03137255, 1,
2.563186, -0.3982345, 0.9674567, 1, 0, 0.02352941, 1,
2.578355, 0.2307672, 1.088312, 1, 0, 0.01960784, 1,
2.588089, 1.221056, 1.390647, 1, 0, 0.01176471, 1,
2.923398, 0.3631711, 1.777822, 1, 0, 0.007843138, 1
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
-0.1096377, -5.308512, -7.033198, 0, -0.5, 0.5, 0.5,
-0.1096377, -5.308512, -7.033198, 1, -0.5, 0.5, 0.5,
-0.1096377, -5.308512, -7.033198, 1, 1.5, 0.5, 0.5,
-0.1096377, -5.308512, -7.033198, 0, 1.5, 0.5, 0.5
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
-4.170873, -0.7210321, -7.033198, 0, -0.5, 0.5, 0.5,
-4.170873, -0.7210321, -7.033198, 1, -0.5, 0.5, 0.5,
-4.170873, -0.7210321, -7.033198, 1, 1.5, 0.5, 0.5,
-4.170873, -0.7210321, -7.033198, 0, 1.5, 0.5, 0.5
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
-4.170873, -5.308512, 0.2166066, 0, -0.5, 0.5, 0.5,
-4.170873, -5.308512, 0.2166066, 1, -0.5, 0.5, 0.5,
-4.170873, -5.308512, 0.2166066, 1, 1.5, 0.5, 0.5,
-4.170873, -5.308512, 0.2166066, 0, 1.5, 0.5, 0.5
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
-3, -4.249863, -5.360166,
2, -4.249863, -5.360166,
-3, -4.249863, -5.360166,
-3, -4.426304, -5.639005,
-2, -4.249863, -5.360166,
-2, -4.426304, -5.639005,
-1, -4.249863, -5.360166,
-1, -4.426304, -5.639005,
0, -4.249863, -5.360166,
0, -4.426304, -5.639005,
1, -4.249863, -5.360166,
1, -4.426304, -5.639005,
2, -4.249863, -5.360166,
2, -4.426304, -5.639005
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
"-3",
"-2",
"-1",
"0",
"1",
"2"
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
-3, -4.779188, -6.196682, 0, -0.5, 0.5, 0.5,
-3, -4.779188, -6.196682, 1, -0.5, 0.5, 0.5,
-3, -4.779188, -6.196682, 1, 1.5, 0.5, 0.5,
-3, -4.779188, -6.196682, 0, 1.5, 0.5, 0.5,
-2, -4.779188, -6.196682, 0, -0.5, 0.5, 0.5,
-2, -4.779188, -6.196682, 1, -0.5, 0.5, 0.5,
-2, -4.779188, -6.196682, 1, 1.5, 0.5, 0.5,
-2, -4.779188, -6.196682, 0, 1.5, 0.5, 0.5,
-1, -4.779188, -6.196682, 0, -0.5, 0.5, 0.5,
-1, -4.779188, -6.196682, 1, -0.5, 0.5, 0.5,
-1, -4.779188, -6.196682, 1, 1.5, 0.5, 0.5,
-1, -4.779188, -6.196682, 0, 1.5, 0.5, 0.5,
0, -4.779188, -6.196682, 0, -0.5, 0.5, 0.5,
0, -4.779188, -6.196682, 1, -0.5, 0.5, 0.5,
0, -4.779188, -6.196682, 1, 1.5, 0.5, 0.5,
0, -4.779188, -6.196682, 0, 1.5, 0.5, 0.5,
1, -4.779188, -6.196682, 0, -0.5, 0.5, 0.5,
1, -4.779188, -6.196682, 1, -0.5, 0.5, 0.5,
1, -4.779188, -6.196682, 1, 1.5, 0.5, 0.5,
1, -4.779188, -6.196682, 0, 1.5, 0.5, 0.5,
2, -4.779188, -6.196682, 0, -0.5, 0.5, 0.5,
2, -4.779188, -6.196682, 1, -0.5, 0.5, 0.5,
2, -4.779188, -6.196682, 1, 1.5, 0.5, 0.5,
2, -4.779188, -6.196682, 0, 1.5, 0.5, 0.5
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
-3.233665, -4, -5.360166,
-3.233665, 2, -5.360166,
-3.233665, -4, -5.360166,
-3.389866, -4, -5.639005,
-3.233665, -3, -5.360166,
-3.389866, -3, -5.639005,
-3.233665, -2, -5.360166,
-3.389866, -2, -5.639005,
-3.233665, -1, -5.360166,
-3.389866, -1, -5.639005,
-3.233665, 0, -5.360166,
-3.389866, 0, -5.639005,
-3.233665, 1, -5.360166,
-3.389866, 1, -5.639005,
-3.233665, 2, -5.360166,
-3.389866, 2, -5.639005
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
"-4",
"-3",
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
-3.702269, -4, -6.196682, 0, -0.5, 0.5, 0.5,
-3.702269, -4, -6.196682, 1, -0.5, 0.5, 0.5,
-3.702269, -4, -6.196682, 1, 1.5, 0.5, 0.5,
-3.702269, -4, -6.196682, 0, 1.5, 0.5, 0.5,
-3.702269, -3, -6.196682, 0, -0.5, 0.5, 0.5,
-3.702269, -3, -6.196682, 1, -0.5, 0.5, 0.5,
-3.702269, -3, -6.196682, 1, 1.5, 0.5, 0.5,
-3.702269, -3, -6.196682, 0, 1.5, 0.5, 0.5,
-3.702269, -2, -6.196682, 0, -0.5, 0.5, 0.5,
-3.702269, -2, -6.196682, 1, -0.5, 0.5, 0.5,
-3.702269, -2, -6.196682, 1, 1.5, 0.5, 0.5,
-3.702269, -2, -6.196682, 0, 1.5, 0.5, 0.5,
-3.702269, -1, -6.196682, 0, -0.5, 0.5, 0.5,
-3.702269, -1, -6.196682, 1, -0.5, 0.5, 0.5,
-3.702269, -1, -6.196682, 1, 1.5, 0.5, 0.5,
-3.702269, -1, -6.196682, 0, 1.5, 0.5, 0.5,
-3.702269, 0, -6.196682, 0, -0.5, 0.5, 0.5,
-3.702269, 0, -6.196682, 1, -0.5, 0.5, 0.5,
-3.702269, 0, -6.196682, 1, 1.5, 0.5, 0.5,
-3.702269, 0, -6.196682, 0, 1.5, 0.5, 0.5,
-3.702269, 1, -6.196682, 0, -0.5, 0.5, 0.5,
-3.702269, 1, -6.196682, 1, -0.5, 0.5, 0.5,
-3.702269, 1, -6.196682, 1, 1.5, 0.5, 0.5,
-3.702269, 1, -6.196682, 0, 1.5, 0.5, 0.5,
-3.702269, 2, -6.196682, 0, -0.5, 0.5, 0.5,
-3.702269, 2, -6.196682, 1, -0.5, 0.5, 0.5,
-3.702269, 2, -6.196682, 1, 1.5, 0.5, 0.5,
-3.702269, 2, -6.196682, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
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
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
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
-3.233665, -4.249863, -4,
-3.233665, -4.249863, 4,
-3.233665, -4.249863, -4,
-3.389866, -4.426304, -4,
-3.233665, -4.249863, -2,
-3.389866, -4.426304, -2,
-3.233665, -4.249863, 0,
-3.389866, -4.426304, 0,
-3.233665, -4.249863, 2,
-3.389866, -4.426304, 2,
-3.233665, -4.249863, 4,
-3.389866, -4.426304, 4
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
-3.702269, -4.779188, -4, 0, -0.5, 0.5, 0.5,
-3.702269, -4.779188, -4, 1, -0.5, 0.5, 0.5,
-3.702269, -4.779188, -4, 1, 1.5, 0.5, 0.5,
-3.702269, -4.779188, -4, 0, 1.5, 0.5, 0.5,
-3.702269, -4.779188, -2, 0, -0.5, 0.5, 0.5,
-3.702269, -4.779188, -2, 1, -0.5, 0.5, 0.5,
-3.702269, -4.779188, -2, 1, 1.5, 0.5, 0.5,
-3.702269, -4.779188, -2, 0, 1.5, 0.5, 0.5,
-3.702269, -4.779188, 0, 0, -0.5, 0.5, 0.5,
-3.702269, -4.779188, 0, 1, -0.5, 0.5, 0.5,
-3.702269, -4.779188, 0, 1, 1.5, 0.5, 0.5,
-3.702269, -4.779188, 0, 0, 1.5, 0.5, 0.5,
-3.702269, -4.779188, 2, 0, -0.5, 0.5, 0.5,
-3.702269, -4.779188, 2, 1, -0.5, 0.5, 0.5,
-3.702269, -4.779188, 2, 1, 1.5, 0.5, 0.5,
-3.702269, -4.779188, 2, 0, 1.5, 0.5, 0.5,
-3.702269, -4.779188, 4, 0, -0.5, 0.5, 0.5,
-3.702269, -4.779188, 4, 1, -0.5, 0.5, 0.5,
-3.702269, -4.779188, 4, 1, 1.5, 0.5, 0.5,
-3.702269, -4.779188, 4, 0, 1.5, 0.5, 0.5
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
-3.233665, -4.249863, -5.360166,
-3.233665, 2.807799, -5.360166,
-3.233665, -4.249863, 5.793379,
-3.233665, 2.807799, 5.793379,
-3.233665, -4.249863, -5.360166,
-3.233665, -4.249863, 5.793379,
-3.233665, 2.807799, -5.360166,
-3.233665, 2.807799, 5.793379,
-3.233665, -4.249863, -5.360166,
3.014389, -4.249863, -5.360166,
-3.233665, -4.249863, 5.793379,
3.014389, -4.249863, 5.793379,
-3.233665, 2.807799, -5.360166,
3.014389, 2.807799, -5.360166,
-3.233665, 2.807799, 5.793379,
3.014389, 2.807799, 5.793379,
3.014389, -4.249863, -5.360166,
3.014389, 2.807799, -5.360166,
3.014389, -4.249863, 5.793379,
3.014389, 2.807799, 5.793379,
3.014389, -4.249863, -5.360166,
3.014389, -4.249863, 5.793379,
3.014389, 2.807799, -5.360166,
3.014389, 2.807799, 5.793379
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
var radius = 7.797768;
var distance = 34.69315;
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
mvMatrix.translate( 0.1096377, 0.7210321, -0.2166066 );
mvMatrix.scale( 1.349396, 1.194602, 0.7559121 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.69315);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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


