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
-3.517096, -0.9869701, -2.47697, 1, 0, 0, 1,
-3.029049, -1.681657, -2.745901, 1, 0.007843138, 0, 1,
-2.737401, -1.782514, -2.511188, 1, 0.01176471, 0, 1,
-2.726537, -0.3529273, -2.366029, 1, 0.01960784, 0, 1,
-2.591422, -0.7812405, -2.379768, 1, 0.02352941, 0, 1,
-2.540804, 1.58359, -0.5549527, 1, 0.03137255, 0, 1,
-2.492664, -0.3599601, -3.915864, 1, 0.03529412, 0, 1,
-2.46875, -0.2471637, -1.596199, 1, 0.04313726, 0, 1,
-2.434878, -0.5887279, -1.399164, 1, 0.04705882, 0, 1,
-2.375859, -1.338691, -0.7564548, 1, 0.05490196, 0, 1,
-2.339581, 0.4510151, -2.155689, 1, 0.05882353, 0, 1,
-2.290509, 0.07922783, -1.888046, 1, 0.06666667, 0, 1,
-2.23534, -1.106091, 0.718618, 1, 0.07058824, 0, 1,
-2.215985, -1.148692, -2.410918, 1, 0.07843138, 0, 1,
-2.203437, -1.07506, -1.59511, 1, 0.08235294, 0, 1,
-2.160881, 0.136626, -1.495404, 1, 0.09019608, 0, 1,
-2.145973, -0.03877678, 0.09561935, 1, 0.09411765, 0, 1,
-2.144515, 1.336705, -0.8509287, 1, 0.1019608, 0, 1,
-2.089537, -0.04516353, -0.8256594, 1, 0.1098039, 0, 1,
-2.086412, 0.7065602, -1.669504, 1, 0.1137255, 0, 1,
-2.026789, -1.712408, -3.93035, 1, 0.1215686, 0, 1,
-2.010223, 0.526143, -0.2065661, 1, 0.1254902, 0, 1,
-1.987608, 0.08945611, -2.660255, 1, 0.1333333, 0, 1,
-1.98086, -0.8259316, -2.51729, 1, 0.1372549, 0, 1,
-1.944579, 0.5494636, -2.84907, 1, 0.145098, 0, 1,
-1.9255, 0.5102178, -1.122938, 1, 0.1490196, 0, 1,
-1.923501, -0.4870513, -2.674225, 1, 0.1568628, 0, 1,
-1.901437, 0.2837457, -1.782791, 1, 0.1607843, 0, 1,
-1.878183, -1.004468, -2.563704, 1, 0.1686275, 0, 1,
-1.86409, 0.686266, 0.04272417, 1, 0.172549, 0, 1,
-1.859918, 0.2578484, -1.503746, 1, 0.1803922, 0, 1,
-1.834526, 0.2192083, -1.894518, 1, 0.1843137, 0, 1,
-1.816644, 1.795957, -1.030558, 1, 0.1921569, 0, 1,
-1.80192, 2.351599, -1.50771, 1, 0.1960784, 0, 1,
-1.797854, -0.4399086, 0.818185, 1, 0.2039216, 0, 1,
-1.777151, 0.5733128, -1.712784, 1, 0.2117647, 0, 1,
-1.765587, -0.8190495, -0.6460935, 1, 0.2156863, 0, 1,
-1.757784, 0.3629238, -0.8622481, 1, 0.2235294, 0, 1,
-1.741238, 0.7390993, -0.5473237, 1, 0.227451, 0, 1,
-1.735456, 0.6477175, -2.499965, 1, 0.2352941, 0, 1,
-1.719409, -0.7432821, -2.021357, 1, 0.2392157, 0, 1,
-1.70308, 0.4781121, -1.743505, 1, 0.2470588, 0, 1,
-1.684537, 0.4848032, -2.316565, 1, 0.2509804, 0, 1,
-1.683334, -1.846215, -2.927434, 1, 0.2588235, 0, 1,
-1.676937, 2.239382, 0.001411757, 1, 0.2627451, 0, 1,
-1.660102, -0.7428234, -1.682828, 1, 0.2705882, 0, 1,
-1.646806, -1.258215, -0.4488313, 1, 0.2745098, 0, 1,
-1.644227, -0.2609002, -0.09092781, 1, 0.282353, 0, 1,
-1.640773, 1.106959, -1.454173, 1, 0.2862745, 0, 1,
-1.638831, 0.4453355, -0.657536, 1, 0.2941177, 0, 1,
-1.636168, -0.1003716, -1.537984, 1, 0.3019608, 0, 1,
-1.62654, 0.6125914, -1.633674, 1, 0.3058824, 0, 1,
-1.619321, 0.9017964, -0.6474472, 1, 0.3137255, 0, 1,
-1.590842, -1.01999, -1.428075, 1, 0.3176471, 0, 1,
-1.588554, 1.495845, 0.7018173, 1, 0.3254902, 0, 1,
-1.586047, -1.113832, -1.314196, 1, 0.3294118, 0, 1,
-1.581479, 0.9175133, 0.008442886, 1, 0.3372549, 0, 1,
-1.576457, 0.555038, -0.6599702, 1, 0.3411765, 0, 1,
-1.567263, -0.2080518, -1.201776, 1, 0.3490196, 0, 1,
-1.566459, -0.6497406, -1.410791, 1, 0.3529412, 0, 1,
-1.5608, 0.9737518, -1.545701, 1, 0.3607843, 0, 1,
-1.542798, -0.01560119, -1.606415, 1, 0.3647059, 0, 1,
-1.54144, -2.036168, -2.123095, 1, 0.372549, 0, 1,
-1.541261, 0.6132758, -0.1700293, 1, 0.3764706, 0, 1,
-1.52587, -1.022775, -3.082513, 1, 0.3843137, 0, 1,
-1.518662, 0.3438271, -2.895132, 1, 0.3882353, 0, 1,
-1.515998, 0.2636023, -0.5046356, 1, 0.3960784, 0, 1,
-1.515665, 0.7252037, 0.3927051, 1, 0.4039216, 0, 1,
-1.504128, -0.2099043, -2.229989, 1, 0.4078431, 0, 1,
-1.502622, 0.3455185, -3.562732, 1, 0.4156863, 0, 1,
-1.501496, -1.286984, -3.666861, 1, 0.4196078, 0, 1,
-1.488614, -0.03266404, 0.4758732, 1, 0.427451, 0, 1,
-1.474758, 0.01845598, -2.230392, 1, 0.4313726, 0, 1,
-1.47105, -1.592901, -2.754805, 1, 0.4392157, 0, 1,
-1.470608, 1.102647, -2.477756, 1, 0.4431373, 0, 1,
-1.461984, 1.259914, -0.3326442, 1, 0.4509804, 0, 1,
-1.454482, 0.6601863, 0.4196976, 1, 0.454902, 0, 1,
-1.449373, -0.5359214, 0.03828077, 1, 0.4627451, 0, 1,
-1.447288, -0.5237445, -1.292688, 1, 0.4666667, 0, 1,
-1.44136, 0.7171234, -0.7786644, 1, 0.4745098, 0, 1,
-1.433997, -0.4498853, -4.837049, 1, 0.4784314, 0, 1,
-1.423599, -0.9906142, 0.08017025, 1, 0.4862745, 0, 1,
-1.414968, -0.9635131, -0.7956859, 1, 0.4901961, 0, 1,
-1.410288, -0.5645694, -1.601526, 1, 0.4980392, 0, 1,
-1.39047, 1.669434, 0.8326032, 1, 0.5058824, 0, 1,
-1.389522, -0.1936831, -1.132771, 1, 0.509804, 0, 1,
-1.376521, 1.455908, -2.166842, 1, 0.5176471, 0, 1,
-1.375807, 0.7469297, -1.429594, 1, 0.5215687, 0, 1,
-1.369766, -1.44868, -1.253281, 1, 0.5294118, 0, 1,
-1.355253, 0.8091442, -1.476829, 1, 0.5333334, 0, 1,
-1.351789, 0.2201668, -2.453101, 1, 0.5411765, 0, 1,
-1.333167, -3.009291, -1.451924, 1, 0.5450981, 0, 1,
-1.327974, -1.009709, -2.400104, 1, 0.5529412, 0, 1,
-1.326267, 0.397612, -2.060267, 1, 0.5568628, 0, 1,
-1.323572, 1.092105, 1.139036, 1, 0.5647059, 0, 1,
-1.315204, -0.8936045, -1.746566, 1, 0.5686275, 0, 1,
-1.298527, -1.479172, -2.135654, 1, 0.5764706, 0, 1,
-1.287477, 1.198509, 0.2394666, 1, 0.5803922, 0, 1,
-1.283669, -0.2350362, -0.7098595, 1, 0.5882353, 0, 1,
-1.279611, -0.2682484, -2.599241, 1, 0.5921569, 0, 1,
-1.272709, 0.08020262, -1.202898, 1, 0.6, 0, 1,
-1.271357, 0.3809107, -0.1233158, 1, 0.6078432, 0, 1,
-1.265254, 2.656297, -0.4612199, 1, 0.6117647, 0, 1,
-1.256198, 2.010125, -2.506904, 1, 0.6196079, 0, 1,
-1.255403, -0.5857651, -4.106668, 1, 0.6235294, 0, 1,
-1.240301, 0.5598486, -0.5851201, 1, 0.6313726, 0, 1,
-1.231047, 0.1845803, -0.7052724, 1, 0.6352941, 0, 1,
-1.216031, 0.8855209, -3.132998, 1, 0.6431373, 0, 1,
-1.207782, -0.2234181, -1.342726, 1, 0.6470588, 0, 1,
-1.191883, -1.136071, -1.174983, 1, 0.654902, 0, 1,
-1.160437, -1.213013, -1.019726, 1, 0.6588235, 0, 1,
-1.158494, 0.9294115, -0.9277083, 1, 0.6666667, 0, 1,
-1.15243, -0.5942553, -0.7589065, 1, 0.6705883, 0, 1,
-1.146609, 0.7181502, -0.3702425, 1, 0.6784314, 0, 1,
-1.142969, 0.2319981, -3.475847, 1, 0.682353, 0, 1,
-1.137922, 0.6641571, -0.4933926, 1, 0.6901961, 0, 1,
-1.129197, 0.3479432, -1.634868, 1, 0.6941177, 0, 1,
-1.122835, 0.03751711, -1.281433, 1, 0.7019608, 0, 1,
-1.121704, 1.680986, -1.532542, 1, 0.7098039, 0, 1,
-1.11515, 0.3985129, -0.9511524, 1, 0.7137255, 0, 1,
-1.097831, -0.7957529, -1.440699, 1, 0.7215686, 0, 1,
-1.095909, -0.8534361, -1.035498, 1, 0.7254902, 0, 1,
-1.092805, -0.2855152, -0.949715, 1, 0.7333333, 0, 1,
-1.092026, 0.6595494, -0.917103, 1, 0.7372549, 0, 1,
-1.08946, 0.7183494, -1.291516, 1, 0.7450981, 0, 1,
-1.087651, -1.513936, -3.027318, 1, 0.7490196, 0, 1,
-1.0866, -0.1165738, -1.978827, 1, 0.7568628, 0, 1,
-1.085348, 0.3820254, -1.60266, 1, 0.7607843, 0, 1,
-1.08281, 0.2765918, -1.396024, 1, 0.7686275, 0, 1,
-1.082764, -0.8549358, -2.448107, 1, 0.772549, 0, 1,
-1.07956, 1.443445, 0.37913, 1, 0.7803922, 0, 1,
-1.075868, 0.7669747, -0.2773745, 1, 0.7843137, 0, 1,
-1.072122, 1.755044, -1.848889, 1, 0.7921569, 0, 1,
-1.072048, 0.3938149, 0.8254133, 1, 0.7960784, 0, 1,
-1.066492, 0.6933734, -2.21406, 1, 0.8039216, 0, 1,
-1.063701, 0.8114425, -1.699551, 1, 0.8117647, 0, 1,
-1.05798, 0.5468665, -0.9520842, 1, 0.8156863, 0, 1,
-1.056406, -0.01175647, -1.181078, 1, 0.8235294, 0, 1,
-1.04845, -0.007315547, -0.1153152, 1, 0.827451, 0, 1,
-1.044897, -0.8022599, -1.990378, 1, 0.8352941, 0, 1,
-1.035772, 1.077009, -1.445653, 1, 0.8392157, 0, 1,
-1.03343, -0.3209228, -1.071535, 1, 0.8470588, 0, 1,
-1.032435, 0.4492026, -2.61989, 1, 0.8509804, 0, 1,
-1.029986, 0.4869724, -0.6065025, 1, 0.8588235, 0, 1,
-1.028264, -0.7932321, -0.7952282, 1, 0.8627451, 0, 1,
-1.023977, 1.383009, 1.833073, 1, 0.8705882, 0, 1,
-1.011595, 0.9842541, -1.363932, 1, 0.8745098, 0, 1,
-1.011027, -1.220844, -1.5377, 1, 0.8823529, 0, 1,
-1.008448, 0.9953193, 1.655226, 1, 0.8862745, 0, 1,
-1.007208, 0.7367589, -1.155351, 1, 0.8941177, 0, 1,
-1.000538, 0.7145771, -0.09741784, 1, 0.8980392, 0, 1,
-0.991899, -0.2291735, -0.6729777, 1, 0.9058824, 0, 1,
-0.9909819, 0.04270156, -0.2431888, 1, 0.9137255, 0, 1,
-0.9901605, 1.127452, 0.0248418, 1, 0.9176471, 0, 1,
-0.9897261, -0.6891033, -2.567285, 1, 0.9254902, 0, 1,
-0.9843773, 0.3172356, -0.978264, 1, 0.9294118, 0, 1,
-0.9819319, -1.997837, -4.937499, 1, 0.9372549, 0, 1,
-0.9807909, -0.2658765, -1.635852, 1, 0.9411765, 0, 1,
-0.9799557, -0.1518243, -3.548565, 1, 0.9490196, 0, 1,
-0.9772442, 0.5779587, -0.3334319, 1, 0.9529412, 0, 1,
-0.9771006, -0.5077121, -1.979421, 1, 0.9607843, 0, 1,
-0.9758336, -0.8311515, -1.235422, 1, 0.9647059, 0, 1,
-0.9723992, -0.3379224, -1.474931, 1, 0.972549, 0, 1,
-0.9493088, 0.7507641, -1.32478, 1, 0.9764706, 0, 1,
-0.9354578, -0.6790676, -2.185848, 1, 0.9843137, 0, 1,
-0.9346231, -0.4811915, -0.7145345, 1, 0.9882353, 0, 1,
-0.9336162, -0.5880587, -2.784863, 1, 0.9960784, 0, 1,
-0.9335964, 0.3666664, -0.6597459, 0.9960784, 1, 0, 1,
-0.9267222, -0.1559809, -2.789675, 0.9921569, 1, 0, 1,
-0.9259073, 0.3778405, -1.516144, 0.9843137, 1, 0, 1,
-0.9219838, -0.1840805, -2.466347, 0.9803922, 1, 0, 1,
-0.9209021, -0.1874292, -1.632434, 0.972549, 1, 0, 1,
-0.9175491, -1.060254, -3.761119, 0.9686275, 1, 0, 1,
-0.91374, -1.19643, -1.021907, 0.9607843, 1, 0, 1,
-0.908897, 0.429493, -2.795707, 0.9568627, 1, 0, 1,
-0.9079129, -0.4673062, -2.239545, 0.9490196, 1, 0, 1,
-0.9075745, -1.398153, -2.738283, 0.945098, 1, 0, 1,
-0.9033637, -1.441001, -2.316684, 0.9372549, 1, 0, 1,
-0.9005505, 1.862622, 0.5551302, 0.9333333, 1, 0, 1,
-0.8984732, 0.03201582, -1.83088, 0.9254902, 1, 0, 1,
-0.8966814, 0.2206659, -1.363497, 0.9215686, 1, 0, 1,
-0.8950796, -0.3821466, -0.6529154, 0.9137255, 1, 0, 1,
-0.8862617, 1.41744, -0.05253836, 0.9098039, 1, 0, 1,
-0.8849425, 1.315076, -1.178109, 0.9019608, 1, 0, 1,
-0.8814819, 0.2472979, -1.435514, 0.8941177, 1, 0, 1,
-0.8810073, 1.502067, 1.527079, 0.8901961, 1, 0, 1,
-0.8788967, -0.4960531, -4.982618, 0.8823529, 1, 0, 1,
-0.8772728, -0.2282346, -2.10019, 0.8784314, 1, 0, 1,
-0.8770652, 0.1248624, -1.512293, 0.8705882, 1, 0, 1,
-0.8766056, -0.6873076, -2.312349, 0.8666667, 1, 0, 1,
-0.8765742, -0.0195497, -2.34095, 0.8588235, 1, 0, 1,
-0.873538, 0.8627502, -1.067985, 0.854902, 1, 0, 1,
-0.8719863, -0.2792563, -1.767587, 0.8470588, 1, 0, 1,
-0.8717479, -0.1982861, -0.4968425, 0.8431373, 1, 0, 1,
-0.8699539, -0.8267702, -1.422701, 0.8352941, 1, 0, 1,
-0.8646876, -0.6732588, -2.900655, 0.8313726, 1, 0, 1,
-0.8612855, 0.05973532, -2.824182, 0.8235294, 1, 0, 1,
-0.8607162, -0.3996443, -2.300534, 0.8196079, 1, 0, 1,
-0.8579683, -0.8117533, -1.655684, 0.8117647, 1, 0, 1,
-0.8526729, 1.245164, -0.4279896, 0.8078431, 1, 0, 1,
-0.8485076, 0.214456, -1.736234, 0.8, 1, 0, 1,
-0.8482935, -0.102647, -1.372601, 0.7921569, 1, 0, 1,
-0.8477097, 0.6858757, 0.1690133, 0.7882353, 1, 0, 1,
-0.8381175, -0.2546393, -2.934786, 0.7803922, 1, 0, 1,
-0.8360077, 1.714095, 0.7245863, 0.7764706, 1, 0, 1,
-0.8321171, -0.5242078, -3.16875, 0.7686275, 1, 0, 1,
-0.826466, -0.3471364, -2.843248, 0.7647059, 1, 0, 1,
-0.8256292, 0.8801557, 0.1597946, 0.7568628, 1, 0, 1,
-0.8219934, -1.302834, -2.616022, 0.7529412, 1, 0, 1,
-0.8201745, -1.404566, -2.553701, 0.7450981, 1, 0, 1,
-0.8198388, 0.4475541, 0.09829386, 0.7411765, 1, 0, 1,
-0.8158092, 1.77364, -1.805635, 0.7333333, 1, 0, 1,
-0.8081693, -1.438697, -4.259527, 0.7294118, 1, 0, 1,
-0.8081023, 1.046641, 0.05569506, 0.7215686, 1, 0, 1,
-0.8069932, -1.414331, -3.91992, 0.7176471, 1, 0, 1,
-0.8064121, -0.8464211, -2.243687, 0.7098039, 1, 0, 1,
-0.8055415, -0.4939942, -2.596292, 0.7058824, 1, 0, 1,
-0.8048525, -1.989625, -1.400945, 0.6980392, 1, 0, 1,
-0.8021798, -0.05817791, -0.4719736, 0.6901961, 1, 0, 1,
-0.8015832, -0.5918553, -3.015009, 0.6862745, 1, 0, 1,
-0.7936555, -0.4883523, -2.176607, 0.6784314, 1, 0, 1,
-0.7878902, -1.156236, -2.382578, 0.6745098, 1, 0, 1,
-0.7821434, 0.7698737, -1.604282, 0.6666667, 1, 0, 1,
-0.7806272, 1.281451, -0.6426997, 0.6627451, 1, 0, 1,
-0.7780523, -2.274307, -3.865444, 0.654902, 1, 0, 1,
-0.7749395, 0.04424638, -0.7594706, 0.6509804, 1, 0, 1,
-0.7692719, -0.5318959, -1.178623, 0.6431373, 1, 0, 1,
-0.7627559, -0.9668097, -2.846266, 0.6392157, 1, 0, 1,
-0.7589363, -1.163531, -3.250615, 0.6313726, 1, 0, 1,
-0.7577586, -1.483585, -2.426429, 0.627451, 1, 0, 1,
-0.7505046, -1.143639, -1.027541, 0.6196079, 1, 0, 1,
-0.7497217, 0.1727436, -2.027611, 0.6156863, 1, 0, 1,
-0.7445273, -0.1364803, -2.894657, 0.6078432, 1, 0, 1,
-0.7437645, 0.6967525, -2.289521, 0.6039216, 1, 0, 1,
-0.7383993, -0.5860044, -2.383743, 0.5960785, 1, 0, 1,
-0.7318528, -1.873604, -3.186136, 0.5882353, 1, 0, 1,
-0.7240587, 0.9917918, -0.007193652, 0.5843138, 1, 0, 1,
-0.7212656, 0.9260585, -0.2285027, 0.5764706, 1, 0, 1,
-0.7207876, 0.04387049, -2.116771, 0.572549, 1, 0, 1,
-0.718808, -0.2723229, -0.9195296, 0.5647059, 1, 0, 1,
-0.7159376, -1.027594, -3.474215, 0.5607843, 1, 0, 1,
-0.7137179, 0.1753231, -2.82216, 0.5529412, 1, 0, 1,
-0.712938, 0.06755731, -2.059664, 0.5490196, 1, 0, 1,
-0.7127619, 0.07791121, -0.232168, 0.5411765, 1, 0, 1,
-0.7121083, 1.895771, 0.1968847, 0.5372549, 1, 0, 1,
-0.7100079, 0.816217, 0.2522742, 0.5294118, 1, 0, 1,
-0.7072058, -0.1053675, -0.5893996, 0.5254902, 1, 0, 1,
-0.7062008, -1.276716, -1.708908, 0.5176471, 1, 0, 1,
-0.7055573, -0.2187484, -2.219937, 0.5137255, 1, 0, 1,
-0.7050061, 0.3166511, -3.412973, 0.5058824, 1, 0, 1,
-0.7035338, -0.7655084, -2.974774, 0.5019608, 1, 0, 1,
-0.7033438, -0.6082892, -4.994915, 0.4941176, 1, 0, 1,
-0.7012055, 0.7957081, 0.3977625, 0.4862745, 1, 0, 1,
-0.6992131, 0.9151726, 0.5521083, 0.4823529, 1, 0, 1,
-0.6917517, 1.366685, 0.1311952, 0.4745098, 1, 0, 1,
-0.6900391, -0.5878701, -2.624097, 0.4705882, 1, 0, 1,
-0.6892031, -0.1868806, -0.4026344, 0.4627451, 1, 0, 1,
-0.6866132, 0.1860437, -3.106405, 0.4588235, 1, 0, 1,
-0.6783934, 0.6585478, 0.1700328, 0.4509804, 1, 0, 1,
-0.6748286, 2.215966, 0.8965116, 0.4470588, 1, 0, 1,
-0.6727973, 1.3607, 0.4035701, 0.4392157, 1, 0, 1,
-0.667906, 0.977455, -1.644061, 0.4352941, 1, 0, 1,
-0.667175, -0.06893034, -1.441285, 0.427451, 1, 0, 1,
-0.6565009, -0.2321122, -1.234572, 0.4235294, 1, 0, 1,
-0.6508242, 0.4814391, -1.453395, 0.4156863, 1, 0, 1,
-0.6506238, -2.39165, -1.423675, 0.4117647, 1, 0, 1,
-0.6501409, 0.717369, -1.31994, 0.4039216, 1, 0, 1,
-0.6470908, 0.5818608, -0.4629748, 0.3960784, 1, 0, 1,
-0.6457309, 1.262692, -0.8486735, 0.3921569, 1, 0, 1,
-0.6386229, -0.2279423, -2.930181, 0.3843137, 1, 0, 1,
-0.6337383, -0.6803451, -2.038934, 0.3803922, 1, 0, 1,
-0.6325312, 0.2496594, -2.71224, 0.372549, 1, 0, 1,
-0.6299995, 2.00809, 1.631536, 0.3686275, 1, 0, 1,
-0.629791, 0.2737193, -0.7812137, 0.3607843, 1, 0, 1,
-0.627552, -0.3863282, -2.185846, 0.3568628, 1, 0, 1,
-0.6268626, -0.7913841, -3.043628, 0.3490196, 1, 0, 1,
-0.6262013, -0.5341151, -2.054013, 0.345098, 1, 0, 1,
-0.6253984, -0.7191726, -1.592689, 0.3372549, 1, 0, 1,
-0.6183437, -0.7633335, -2.661623, 0.3333333, 1, 0, 1,
-0.6175897, -0.08069634, -1.823431, 0.3254902, 1, 0, 1,
-0.6105036, -0.1606889, -3.014449, 0.3215686, 1, 0, 1,
-0.6006924, 0.6479999, -0.261111, 0.3137255, 1, 0, 1,
-0.5982127, 0.6604875, -0.720079, 0.3098039, 1, 0, 1,
-0.5976403, 0.4589361, -1.558866, 0.3019608, 1, 0, 1,
-0.5903, -0.5788281, -3.229457, 0.2941177, 1, 0, 1,
-0.5888754, 0.07776001, -0.7132123, 0.2901961, 1, 0, 1,
-0.5861407, -0.7487581, -3.063864, 0.282353, 1, 0, 1,
-0.5828677, 0.3419795, -2.409441, 0.2784314, 1, 0, 1,
-0.5785441, -1.236891, -0.7691176, 0.2705882, 1, 0, 1,
-0.5756183, -0.5358624, -1.59974, 0.2666667, 1, 0, 1,
-0.5752177, -0.6647101, -2.00084, 0.2588235, 1, 0, 1,
-0.5749272, -2.653836, -3.935, 0.254902, 1, 0, 1,
-0.5716538, -0.88291, -2.170066, 0.2470588, 1, 0, 1,
-0.5684173, 1.515375, -1.163268, 0.2431373, 1, 0, 1,
-0.5602745, 0.4699124, 0.04132255, 0.2352941, 1, 0, 1,
-0.5558431, -1.96349, -1.960081, 0.2313726, 1, 0, 1,
-0.5539064, -0.2036214, -2.223572, 0.2235294, 1, 0, 1,
-0.5527391, 0.157859, -1.482886, 0.2196078, 1, 0, 1,
-0.5521771, 1.304608, 1.082795, 0.2117647, 1, 0, 1,
-0.5521079, -0.7002173, -2.384336, 0.2078431, 1, 0, 1,
-0.5520186, -1.00547, -2.105667, 0.2, 1, 0, 1,
-0.5501012, -1.071779, -4.038021, 0.1921569, 1, 0, 1,
-0.5451588, 0.5865978, -1.477645, 0.1882353, 1, 0, 1,
-0.5446267, 0.7793721, -1.880353, 0.1803922, 1, 0, 1,
-0.5441915, 0.254032, -0.147835, 0.1764706, 1, 0, 1,
-0.5316473, 0.2106306, -1.038774, 0.1686275, 1, 0, 1,
-0.5315117, -0.8293961, -2.180484, 0.1647059, 1, 0, 1,
-0.5307108, -0.04615313, -2.431064, 0.1568628, 1, 0, 1,
-0.5263746, -1.365925, -2.876157, 0.1529412, 1, 0, 1,
-0.5257077, -0.3280988, -1.42226, 0.145098, 1, 0, 1,
-0.5252984, 0.6834292, -2.466172, 0.1411765, 1, 0, 1,
-0.5206397, 0.1038534, -1.076769, 0.1333333, 1, 0, 1,
-0.5157129, -0.2751902, -0.439585, 0.1294118, 1, 0, 1,
-0.5112606, 1.319701, 0.8604863, 0.1215686, 1, 0, 1,
-0.5089469, -0.8562464, -3.034547, 0.1176471, 1, 0, 1,
-0.506676, -1.846944, -0.5260406, 0.1098039, 1, 0, 1,
-0.504196, 0.6505933, -0.5747481, 0.1058824, 1, 0, 1,
-0.5036668, 0.3052251, 0.1409361, 0.09803922, 1, 0, 1,
-0.5032385, -0.4770488, -2.912102, 0.09019608, 1, 0, 1,
-0.5013918, 2.036686, -0.04349042, 0.08627451, 1, 0, 1,
-0.499847, 0.2480845, -1.845867, 0.07843138, 1, 0, 1,
-0.4986805, 0.05289257, -3.387357, 0.07450981, 1, 0, 1,
-0.4978024, 0.1714155, -3.247474, 0.06666667, 1, 0, 1,
-0.4950702, 1.296322, 0.04047481, 0.0627451, 1, 0, 1,
-0.484483, 1.181509, -1.042851, 0.05490196, 1, 0, 1,
-0.4794486, 0.7188067, -1.266275, 0.05098039, 1, 0, 1,
-0.478265, -0.6770324, -4.255831, 0.04313726, 1, 0, 1,
-0.4756949, -0.9953301, -3.69515, 0.03921569, 1, 0, 1,
-0.469184, 1.226362, -0.7134616, 0.03137255, 1, 0, 1,
-0.4672798, -1.714131, -1.677804, 0.02745098, 1, 0, 1,
-0.464398, 0.283123, -1.012756, 0.01960784, 1, 0, 1,
-0.4635956, -1.096279, -3.496713, 0.01568628, 1, 0, 1,
-0.4604079, -1.68573, -1.670416, 0.007843138, 1, 0, 1,
-0.4602483, 1.304459, 0.47022, 0.003921569, 1, 0, 1,
-0.4596833, 0.004629176, -1.519023, 0, 1, 0.003921569, 1,
-0.4595518, -0.2197799, -1.983295, 0, 1, 0.01176471, 1,
-0.457116, -0.5207916, -1.849007, 0, 1, 0.01568628, 1,
-0.4567637, 1.758876, -0.3280432, 0, 1, 0.02352941, 1,
-0.4546798, -0.2343038, 0.2715896, 0, 1, 0.02745098, 1,
-0.4544079, 0.09576774, -2.897191, 0, 1, 0.03529412, 1,
-0.4525326, 1.588618, -0.5447315, 0, 1, 0.03921569, 1,
-0.4446196, 1.769963, -1.395935, 0, 1, 0.04705882, 1,
-0.4432073, -0.2655824, -1.831074, 0, 1, 0.05098039, 1,
-0.4428569, 0.8435606, -1.329664, 0, 1, 0.05882353, 1,
-0.4419927, 1.381212, 0.9833443, 0, 1, 0.0627451, 1,
-0.4419242, 1.967371, 0.6805204, 0, 1, 0.07058824, 1,
-0.4415737, -0.445532, -3.498462, 0, 1, 0.07450981, 1,
-0.4382671, 0.5767767, -0.7498529, 0, 1, 0.08235294, 1,
-0.4355926, -0.9220402, -1.967054, 0, 1, 0.08627451, 1,
-0.4343324, -0.709123, -2.500569, 0, 1, 0.09411765, 1,
-0.4334419, 0.004970184, -1.475935, 0, 1, 0.1019608, 1,
-0.4322747, -1.041867, -2.940695, 0, 1, 0.1058824, 1,
-0.4235446, -1.539857, -2.667822, 0, 1, 0.1137255, 1,
-0.4222226, -0.9477471, -3.726907, 0, 1, 0.1176471, 1,
-0.4195379, 0.4664346, -1.678662, 0, 1, 0.1254902, 1,
-0.4190568, -1.511163, -2.330214, 0, 1, 0.1294118, 1,
-0.4168478, -0.1502972, -2.029347, 0, 1, 0.1372549, 1,
-0.4068626, -0.04745375, -1.374006, 0, 1, 0.1411765, 1,
-0.4041336, 0.4099832, -1.406099, 0, 1, 0.1490196, 1,
-0.4024503, 0.3304642, -0.7832914, 0, 1, 0.1529412, 1,
-0.4007204, -0.7358868, -1.447632, 0, 1, 0.1607843, 1,
-0.3997953, 1.716838, -1.490566, 0, 1, 0.1647059, 1,
-0.3926736, 1.486303, -1.095185, 0, 1, 0.172549, 1,
-0.3837354, -0.02845266, -0.5928903, 0, 1, 0.1764706, 1,
-0.3833884, 0.007176418, -0.8665647, 0, 1, 0.1843137, 1,
-0.3827839, 0.8779278, -1.55148, 0, 1, 0.1882353, 1,
-0.3817472, 1.296623, -0.8551221, 0, 1, 0.1960784, 1,
-0.3789341, -0.01405349, -2.227362, 0, 1, 0.2039216, 1,
-0.3783829, 0.02350635, -1.192526, 0, 1, 0.2078431, 1,
-0.3754545, 0.1236142, -1.54541, 0, 1, 0.2156863, 1,
-0.3726083, -0.6571453, -1.936783, 0, 1, 0.2196078, 1,
-0.3708587, -0.6230252, -2.554857, 0, 1, 0.227451, 1,
-0.3699, 2.433485, 0.5902566, 0, 1, 0.2313726, 1,
-0.3683531, 0.07933837, -2.353824, 0, 1, 0.2392157, 1,
-0.3660101, -0.6205866, -2.284566, 0, 1, 0.2431373, 1,
-0.3658724, 2.193334, 0.1702503, 0, 1, 0.2509804, 1,
-0.3658597, -1.479, -2.317488, 0, 1, 0.254902, 1,
-0.3601934, -0.3491334, -2.582445, 0, 1, 0.2627451, 1,
-0.3548411, -0.4932584, -2.913373, 0, 1, 0.2666667, 1,
-0.3494599, -0.1203489, -1.769026, 0, 1, 0.2745098, 1,
-0.3476104, -0.1401935, -2.8815, 0, 1, 0.2784314, 1,
-0.3446867, 0.817699, -0.8398309, 0, 1, 0.2862745, 1,
-0.3428561, -0.3862666, -2.116233, 0, 1, 0.2901961, 1,
-0.3403947, 2.145894, 0.3397954, 0, 1, 0.2980392, 1,
-0.3384846, -0.9046237, -1.212883, 0, 1, 0.3058824, 1,
-0.337577, -0.2576495, -1.591422, 0, 1, 0.3098039, 1,
-0.3371903, -0.5192813, -3.526479, 0, 1, 0.3176471, 1,
-0.3348272, -0.7751608, -2.315527, 0, 1, 0.3215686, 1,
-0.3337547, -0.4985421, -3.459958, 0, 1, 0.3294118, 1,
-0.3313894, -0.6572393, -3.468565, 0, 1, 0.3333333, 1,
-0.3281064, -0.8162339, -1.528472, 0, 1, 0.3411765, 1,
-0.3280574, 0.4846803, 0.2782779, 0, 1, 0.345098, 1,
-0.3237152, -0.9717404, -2.874912, 0, 1, 0.3529412, 1,
-0.3205851, -1.648158, -0.5172784, 0, 1, 0.3568628, 1,
-0.3179781, -0.3991875, -2.218229, 0, 1, 0.3647059, 1,
-0.3168464, -0.5733866, -2.138292, 0, 1, 0.3686275, 1,
-0.3137836, 0.1417589, -0.6920376, 0, 1, 0.3764706, 1,
-0.3122801, 0.7421402, -0.9486428, 0, 1, 0.3803922, 1,
-0.3118504, -0.9353729, -3.71133, 0, 1, 0.3882353, 1,
-0.3091727, -0.3147134, -2.089262, 0, 1, 0.3921569, 1,
-0.3038629, -0.8295097, -3.705412, 0, 1, 0.4, 1,
-0.3031725, -1.194164, -1.891646, 0, 1, 0.4078431, 1,
-0.3030988, 0.919116, -2.30268, 0, 1, 0.4117647, 1,
-0.3007121, -0.08235176, -0.6888067, 0, 1, 0.4196078, 1,
-0.2990275, -0.3238789, -3.297238, 0, 1, 0.4235294, 1,
-0.2988054, 0.3926519, -1.541226, 0, 1, 0.4313726, 1,
-0.2980731, -0.2709429, -3.604328, 0, 1, 0.4352941, 1,
-0.2948469, -0.3748996, -1.768699, 0, 1, 0.4431373, 1,
-0.2895635, 1.091465, -0.9237657, 0, 1, 0.4470588, 1,
-0.2865846, -0.08812007, -0.1913484, 0, 1, 0.454902, 1,
-0.2863983, -0.9525399, -0.956581, 0, 1, 0.4588235, 1,
-0.2853893, 0.002300658, -0.970552, 0, 1, 0.4666667, 1,
-0.2845421, 0.6394679, -2.038139, 0, 1, 0.4705882, 1,
-0.2839833, -1.069958, -3.021065, 0, 1, 0.4784314, 1,
-0.2774419, 1.663123, 0.2483491, 0, 1, 0.4823529, 1,
-0.2767452, 0.7454118, -1.746445, 0, 1, 0.4901961, 1,
-0.2720912, 1.888161, 0.6653299, 0, 1, 0.4941176, 1,
-0.2710151, 0.334856, -0.8210839, 0, 1, 0.5019608, 1,
-0.2673997, 0.252411, -0.5184184, 0, 1, 0.509804, 1,
-0.26532, -2.139722, -3.675727, 0, 1, 0.5137255, 1,
-0.2621425, -0.7647967, -2.106332, 0, 1, 0.5215687, 1,
-0.2600516, -0.7830264, -0.576174, 0, 1, 0.5254902, 1,
-0.2558917, 2.655228, -1.24955, 0, 1, 0.5333334, 1,
-0.2532172, -0.3447967, -2.262437, 0, 1, 0.5372549, 1,
-0.2496664, 0.07149497, -1.622681, 0, 1, 0.5450981, 1,
-0.2470888, -0.05826986, -2.729348, 0, 1, 0.5490196, 1,
-0.2446389, -0.6312487, -2.446016, 0, 1, 0.5568628, 1,
-0.2431817, 0.1684592, -0.08805405, 0, 1, 0.5607843, 1,
-0.2405035, -0.7172872, -2.267833, 0, 1, 0.5686275, 1,
-0.2387402, 1.201988, 0.2244386, 0, 1, 0.572549, 1,
-0.230662, 0.7228464, 0.005028738, 0, 1, 0.5803922, 1,
-0.2296951, 0.5508693, -1.761564, 0, 1, 0.5843138, 1,
-0.2268355, 0.1515043, -0.7667346, 0, 1, 0.5921569, 1,
-0.2263459, 1.25889, -1.014953, 0, 1, 0.5960785, 1,
-0.2214151, -2.209174, -0.9191382, 0, 1, 0.6039216, 1,
-0.2186032, 1.31339, -1.192241, 0, 1, 0.6117647, 1,
-0.2173268, -0.2111633, 0.07911016, 0, 1, 0.6156863, 1,
-0.2165823, 0.6268384, -0.2045895, 0, 1, 0.6235294, 1,
-0.2153353, -0.0538021, -2.485691, 0, 1, 0.627451, 1,
-0.2145094, 1.020748, 3.372028, 0, 1, 0.6352941, 1,
-0.2127617, 0.4341635, -2.956802, 0, 1, 0.6392157, 1,
-0.2114622, 0.1091212, -1.403644, 0, 1, 0.6470588, 1,
-0.2064559, 0.06118059, -2.592374, 0, 1, 0.6509804, 1,
-0.2032817, 0.284332, 0.1199406, 0, 1, 0.6588235, 1,
-0.1965516, -0.02420141, -2.571478, 0, 1, 0.6627451, 1,
-0.1951966, -0.1444118, -1.915475, 0, 1, 0.6705883, 1,
-0.1912663, -1.852416, -2.951934, 0, 1, 0.6745098, 1,
-0.1874286, -0.5772874, -3.95406, 0, 1, 0.682353, 1,
-0.1868048, 0.4490976, -0.6166636, 0, 1, 0.6862745, 1,
-0.1856799, 0.4903682, -0.06943478, 0, 1, 0.6941177, 1,
-0.1852403, 0.8579692, 0.8231945, 0, 1, 0.7019608, 1,
-0.1848342, -0.3946534, -2.582814, 0, 1, 0.7058824, 1,
-0.1845476, 1.698305, 0.295619, 0, 1, 0.7137255, 1,
-0.1824942, 1.266229, -0.6438881, 0, 1, 0.7176471, 1,
-0.1807288, 0.6831608, 0.3305732, 0, 1, 0.7254902, 1,
-0.1803406, -0.07757221, -2.1224, 0, 1, 0.7294118, 1,
-0.175573, 0.2594476, -0.8271002, 0, 1, 0.7372549, 1,
-0.1752827, 1.97873, -1.07176, 0, 1, 0.7411765, 1,
-0.168723, -2.240681, -4.299414, 0, 1, 0.7490196, 1,
-0.1686046, -0.3136857, -1.793148, 0, 1, 0.7529412, 1,
-0.1667171, -0.5676758, -0.4566335, 0, 1, 0.7607843, 1,
-0.165521, 0.6251242, -0.3507413, 0, 1, 0.7647059, 1,
-0.1644149, -1.532024, -2.435677, 0, 1, 0.772549, 1,
-0.1614513, -0.6742673, -3.44572, 0, 1, 0.7764706, 1,
-0.1612152, 0.9715827, 0.8116608, 0, 1, 0.7843137, 1,
-0.160688, 0.08346175, -2.120504, 0, 1, 0.7882353, 1,
-0.1592478, -1.343849, -3.05127, 0, 1, 0.7960784, 1,
-0.1581291, 1.30008, 1.125758, 0, 1, 0.8039216, 1,
-0.1540226, -0.2984849, -2.061863, 0, 1, 0.8078431, 1,
-0.1515588, -1.156063, -2.804287, 0, 1, 0.8156863, 1,
-0.1503228, 2.02824, 0.1849128, 0, 1, 0.8196079, 1,
-0.150309, -2.298466, -3.26984, 0, 1, 0.827451, 1,
-0.1490811, 0.2659338, 0.3757435, 0, 1, 0.8313726, 1,
-0.1485953, 0.9106917, -0.3193496, 0, 1, 0.8392157, 1,
-0.1459593, -0.04894545, -2.764365, 0, 1, 0.8431373, 1,
-0.1437037, 0.7158124, -1.118978, 0, 1, 0.8509804, 1,
-0.1414344, 0.5399646, -0.4816217, 0, 1, 0.854902, 1,
-0.137284, 0.4379205, -1.077376, 0, 1, 0.8627451, 1,
-0.136645, -0.2201243, -2.812106, 0, 1, 0.8666667, 1,
-0.1358556, -1.223451, -3.333038, 0, 1, 0.8745098, 1,
-0.1356129, 0.3865858, -0.931917, 0, 1, 0.8784314, 1,
-0.1340355, -0.5073885, -4.08411, 0, 1, 0.8862745, 1,
-0.1317165, -0.5503711, -2.052358, 0, 1, 0.8901961, 1,
-0.1312024, -0.3804369, -2.932132, 0, 1, 0.8980392, 1,
-0.1302444, -0.991893, -2.450988, 0, 1, 0.9058824, 1,
-0.1293025, -0.6284271, -1.800707, 0, 1, 0.9098039, 1,
-0.1281179, -0.1251912, -3.279352, 0, 1, 0.9176471, 1,
-0.1195121, -0.5914159, -4.830096, 0, 1, 0.9215686, 1,
-0.1170862, -0.4584446, -1.510535, 0, 1, 0.9294118, 1,
-0.1168026, 1.926529, -0.7424483, 0, 1, 0.9333333, 1,
-0.1151873, -0.2068247, -2.463838, 0, 1, 0.9411765, 1,
-0.1104024, -0.7113923, -3.074905, 0, 1, 0.945098, 1,
-0.1101907, -0.6785403, -1.073959, 0, 1, 0.9529412, 1,
-0.1098732, 0.3757078, -0.8198949, 0, 1, 0.9568627, 1,
-0.1035478, -2.77419, -1.984973, 0, 1, 0.9647059, 1,
-0.1020679, -0.6735777, -2.724518, 0, 1, 0.9686275, 1,
-0.09669109, 1.075979, 0.8403336, 0, 1, 0.9764706, 1,
-0.09265421, 0.9914051, 0.789804, 0, 1, 0.9803922, 1,
-0.08949829, -0.9426435, -3.258853, 0, 1, 0.9882353, 1,
-0.08618972, -1.069387, -3.231022, 0, 1, 0.9921569, 1,
-0.08555718, -0.8035296, -3.127439, 0, 1, 1, 1,
-0.08315443, -1.073838, -4.027881, 0, 0.9921569, 1, 1,
-0.08161792, -1.836722, -2.882798, 0, 0.9882353, 1, 1,
-0.07978368, 0.04836072, -0.9448451, 0, 0.9803922, 1, 1,
-0.06801087, -0.9844948, -4.094876, 0, 0.9764706, 1, 1,
-0.06619427, 0.514751, 0.5328808, 0, 0.9686275, 1, 1,
-0.06602343, -1.13329, -3.24128, 0, 0.9647059, 1, 1,
-0.06530602, 0.2636351, -0.3556802, 0, 0.9568627, 1, 1,
-0.05630288, -0.5590003, -3.096618, 0, 0.9529412, 1, 1,
-0.05265154, -0.8164753, -2.072653, 0, 0.945098, 1, 1,
-0.05104519, -0.5653824, -4.34869, 0, 0.9411765, 1, 1,
-0.04649815, -0.3590848, -3.652686, 0, 0.9333333, 1, 1,
-0.04595975, 1.26872, 0.3453444, 0, 0.9294118, 1, 1,
-0.04408392, -1.370866, -1.862408, 0, 0.9215686, 1, 1,
-0.03567706, 0.1969947, 0.8013325, 0, 0.9176471, 1, 1,
-0.02830759, -2.116266, -2.905977, 0, 0.9098039, 1, 1,
-0.02762721, 0.3586577, 1.477093, 0, 0.9058824, 1, 1,
-0.02419937, 0.7820876, -1.066592, 0, 0.8980392, 1, 1,
-0.02282751, 1.01184, 0.04066134, 0, 0.8901961, 1, 1,
-0.02102512, -0.6587687, -2.395659, 0, 0.8862745, 1, 1,
-0.01972232, 0.809193, 1.450588, 0, 0.8784314, 1, 1,
-0.01842237, -2.544259, -3.226669, 0, 0.8745098, 1, 1,
-0.01804717, -0.2629068, -4.109741, 0, 0.8666667, 1, 1,
-0.01671758, 1.953078, -0.6827341, 0, 0.8627451, 1, 1,
-0.01445187, 2.398219, 2.429983, 0, 0.854902, 1, 1,
-0.01389517, -0.3977921, -3.471396, 0, 0.8509804, 1, 1,
-0.01296913, -2.257139, -2.136071, 0, 0.8431373, 1, 1,
-0.01282741, -1.704761, -4.323809, 0, 0.8392157, 1, 1,
-0.0121657, -0.8965274, -2.594028, 0, 0.8313726, 1, 1,
-0.01034372, 1.097342, 0.5719661, 0, 0.827451, 1, 1,
-0.004992541, -1.012482, -4.64588, 0, 0.8196079, 1, 1,
7.981142e-05, -0.2668983, 2.341246, 0, 0.8156863, 1, 1,
0.0001545529, 1.149466, -0.3278602, 0, 0.8078431, 1, 1,
0.006164844, -0.7343615, 2.612064, 0, 0.8039216, 1, 1,
0.006920246, -0.4644386, 2.931484, 0, 0.7960784, 1, 1,
0.01590333, -0.3027152, 2.951115, 0, 0.7882353, 1, 1,
0.01764298, -0.4951545, 4.650715, 0, 0.7843137, 1, 1,
0.01807311, -0.6376294, 3.465797, 0, 0.7764706, 1, 1,
0.01935237, 0.3768429, 1.243379, 0, 0.772549, 1, 1,
0.02988492, 1.210555, 0.9633595, 0, 0.7647059, 1, 1,
0.03124171, 2.01848, -0.3656558, 0, 0.7607843, 1, 1,
0.03214583, -0.4452698, 3.779456, 0, 0.7529412, 1, 1,
0.03265407, -0.5261328, 4.376272, 0, 0.7490196, 1, 1,
0.03537828, 0.9657548, -0.1653445, 0, 0.7411765, 1, 1,
0.04110283, -0.7427912, 2.872581, 0, 0.7372549, 1, 1,
0.04166336, -0.4299033, 2.211182, 0, 0.7294118, 1, 1,
0.04370575, -0.7744224, 2.257644, 0, 0.7254902, 1, 1,
0.04557778, 0.4846742, 1.205514, 0, 0.7176471, 1, 1,
0.04766369, 0.2105852, -1.394817, 0, 0.7137255, 1, 1,
0.04864193, 0.4522196, -1.260206, 0, 0.7058824, 1, 1,
0.05008671, 0.5354568, 0.2085792, 0, 0.6980392, 1, 1,
0.05063327, -0.7889388, 3.22182, 0, 0.6941177, 1, 1,
0.05344476, 0.1780356, 1.720596, 0, 0.6862745, 1, 1,
0.05823982, -0.9240063, 3.981361, 0, 0.682353, 1, 1,
0.05831291, -0.5493605, 2.010528, 0, 0.6745098, 1, 1,
0.05855907, -0.5565659, 3.628614, 0, 0.6705883, 1, 1,
0.06083494, 2.256861, -0.2116946, 0, 0.6627451, 1, 1,
0.06344213, 2.058673, -0.685645, 0, 0.6588235, 1, 1,
0.06594748, -0.2038642, 2.866601, 0, 0.6509804, 1, 1,
0.06755556, -0.1770156, 1.588013, 0, 0.6470588, 1, 1,
0.07272701, -0.6772149, 4.055457, 0, 0.6392157, 1, 1,
0.0749818, 1.141502, -0.7790292, 0, 0.6352941, 1, 1,
0.07652052, -0.7005185, 3.623824, 0, 0.627451, 1, 1,
0.07660075, -0.94225, 1.931857, 0, 0.6235294, 1, 1,
0.07925706, -0.1892048, 2.393865, 0, 0.6156863, 1, 1,
0.08036911, 1.293455, 0.1558981, 0, 0.6117647, 1, 1,
0.08424155, 0.6578404, 0.5136132, 0, 0.6039216, 1, 1,
0.08581239, 1.147645, 0.04204898, 0, 0.5960785, 1, 1,
0.09092454, 0.5483746, -0.02415539, 0, 0.5921569, 1, 1,
0.09694023, 1.521194, 0.8619806, 0, 0.5843138, 1, 1,
0.1039164, 1.371709, -0.8612145, 0, 0.5803922, 1, 1,
0.1058253, 0.8082004, 0.3915147, 0, 0.572549, 1, 1,
0.1109052, 1.958053, -0.01542082, 0, 0.5686275, 1, 1,
0.1122643, 1.892472, -0.05263274, 0, 0.5607843, 1, 1,
0.1128806, -0.7503443, 3.415815, 0, 0.5568628, 1, 1,
0.1147304, -0.6775767, 2.003741, 0, 0.5490196, 1, 1,
0.1191845, 0.7432985, -0.3759809, 0, 0.5450981, 1, 1,
0.1216083, -0.3416263, 3.822635, 0, 0.5372549, 1, 1,
0.1232616, -0.09919, 0.4051098, 0, 0.5333334, 1, 1,
0.1249537, 0.9030338, -0.2039678, 0, 0.5254902, 1, 1,
0.1296336, -1.354434, 4.866985, 0, 0.5215687, 1, 1,
0.1344174, -0.6806738, 3.416224, 0, 0.5137255, 1, 1,
0.134759, -1.372849, 1.30813, 0, 0.509804, 1, 1,
0.1370316, 0.7355828, -0.1531819, 0, 0.5019608, 1, 1,
0.1384402, 1.604379, 1.465639, 0, 0.4941176, 1, 1,
0.1395538, -0.6368695, 2.782112, 0, 0.4901961, 1, 1,
0.1430348, -0.3426621, 3.34656, 0, 0.4823529, 1, 1,
0.1432607, 1.209293, -1.211516, 0, 0.4784314, 1, 1,
0.1473563, -0.3193227, 2.365138, 0, 0.4705882, 1, 1,
0.1482506, 0.4648706, -2.008037, 0, 0.4666667, 1, 1,
0.1497825, 0.3586829, -0.8099449, 0, 0.4588235, 1, 1,
0.1540911, -0.5450014, 3.284891, 0, 0.454902, 1, 1,
0.1632696, -0.8458497, 3.519995, 0, 0.4470588, 1, 1,
0.1648381, -0.7079465, 2.591003, 0, 0.4431373, 1, 1,
0.1702652, 0.2753242, -0.4475601, 0, 0.4352941, 1, 1,
0.1707242, -0.9122007, 2.029949, 0, 0.4313726, 1, 1,
0.1758647, 0.009179455, 1.485669, 0, 0.4235294, 1, 1,
0.1780432, 0.13859, 1.506006, 0, 0.4196078, 1, 1,
0.1793923, -0.2728059, 3.288857, 0, 0.4117647, 1, 1,
0.1800399, 0.6061253, 0.3536218, 0, 0.4078431, 1, 1,
0.1815149, 0.5352438, 2.012347, 0, 0.4, 1, 1,
0.1821054, -1.013673, 3.033008, 0, 0.3921569, 1, 1,
0.1874489, 0.1467441, 0.5790301, 0, 0.3882353, 1, 1,
0.1887456, -0.7460347, 4.396595, 0, 0.3803922, 1, 1,
0.1918156, -0.364581, 0.8360155, 0, 0.3764706, 1, 1,
0.197908, 0.03347144, 1.914723, 0, 0.3686275, 1, 1,
0.198108, -0.5110965, 1.459453, 0, 0.3647059, 1, 1,
0.2039357, 0.02022075, 1.411808, 0, 0.3568628, 1, 1,
0.2123184, 0.3177027, 0.03656603, 0, 0.3529412, 1, 1,
0.215326, 0.1095607, 2.07895, 0, 0.345098, 1, 1,
0.217376, 2.513719, 0.06063712, 0, 0.3411765, 1, 1,
0.2184259, 0.5346392, 0.9457435, 0, 0.3333333, 1, 1,
0.2209157, 0.3701213, 0.590467, 0, 0.3294118, 1, 1,
0.2242962, 0.9065663, 1.634032, 0, 0.3215686, 1, 1,
0.2334798, -0.1279983, 2.186412, 0, 0.3176471, 1, 1,
0.2358937, -0.9728818, 1.052579, 0, 0.3098039, 1, 1,
0.245952, -0.3541628, 3.238622, 0, 0.3058824, 1, 1,
0.2484128, 0.2712951, 3.776437, 0, 0.2980392, 1, 1,
0.2485232, -1.588529, 1.326011, 0, 0.2901961, 1, 1,
0.2520372, 0.8104827, 0.3257407, 0, 0.2862745, 1, 1,
0.2675774, -2.058982, 3.225409, 0, 0.2784314, 1, 1,
0.2711953, 0.9165471, -0.8042832, 0, 0.2745098, 1, 1,
0.2733858, 0.9125167, 0.9071563, 0, 0.2666667, 1, 1,
0.275866, -1.29791, 3.314861, 0, 0.2627451, 1, 1,
0.2761967, -0.1147463, -0.2633249, 0, 0.254902, 1, 1,
0.2762031, 0.774799, 0.1397883, 0, 0.2509804, 1, 1,
0.2773249, -1.110362, 2.619259, 0, 0.2431373, 1, 1,
0.2872342, 1.580108, -1.213563, 0, 0.2392157, 1, 1,
0.2889395, -0.4616468, 1.533892, 0, 0.2313726, 1, 1,
0.2894906, -1.060063, 2.284898, 0, 0.227451, 1, 1,
0.2942474, -0.06620792, 0.4453689, 0, 0.2196078, 1, 1,
0.2949032, -1.387597, 4.556644, 0, 0.2156863, 1, 1,
0.299307, -0.4330412, 2.82963, 0, 0.2078431, 1, 1,
0.3025492, 1.058464, 0.8581264, 0, 0.2039216, 1, 1,
0.3040555, -0.08803263, 1.117237, 0, 0.1960784, 1, 1,
0.3066865, -0.6899381, 2.168141, 0, 0.1882353, 1, 1,
0.3090546, -0.6487073, 0.7837903, 0, 0.1843137, 1, 1,
0.3114312, -1.417389, 2.852875, 0, 0.1764706, 1, 1,
0.3147539, 0.4605515, -0.2131416, 0, 0.172549, 1, 1,
0.3200333, 0.054636, 0.9358813, 0, 0.1647059, 1, 1,
0.324347, -0.4185949, 1.118378, 0, 0.1607843, 1, 1,
0.3252756, -0.1146668, 2.843651, 0, 0.1529412, 1, 1,
0.3282314, 0.07025997, 2.049915, 0, 0.1490196, 1, 1,
0.331809, 0.1148874, 0.658958, 0, 0.1411765, 1, 1,
0.3343035, -1.643015, 3.222271, 0, 0.1372549, 1, 1,
0.3390898, 0.6957385, -0.3612569, 0, 0.1294118, 1, 1,
0.3402072, -0.965554, 3.510246, 0, 0.1254902, 1, 1,
0.3402916, 0.0677055, 0.8231658, 0, 0.1176471, 1, 1,
0.3407656, -0.2895966, 2.209908, 0, 0.1137255, 1, 1,
0.3442955, 1.298641, 1.05617, 0, 0.1058824, 1, 1,
0.3472814, -0.2074296, 0.6680346, 0, 0.09803922, 1, 1,
0.3486597, -2.918607, 2.815003, 0, 0.09411765, 1, 1,
0.3504798, 0.5119519, 0.1129897, 0, 0.08627451, 1, 1,
0.3505452, 0.5683556, 0.6289982, 0, 0.08235294, 1, 1,
0.353799, -1.226184, 1.98779, 0, 0.07450981, 1, 1,
0.3559656, 1.099845, -0.9715599, 0, 0.07058824, 1, 1,
0.3561565, -0.1363684, 1.619774, 0, 0.0627451, 1, 1,
0.3608964, 0.9486151, 1.205347, 0, 0.05882353, 1, 1,
0.3611044, -0.8087224, 4.652949, 0, 0.05098039, 1, 1,
0.3616739, 0.445821, 0.8366356, 0, 0.04705882, 1, 1,
0.365831, -0.7572878, 2.173902, 0, 0.03921569, 1, 1,
0.3757416, 0.08015899, 1.171757, 0, 0.03529412, 1, 1,
0.3780546, 1.659644, -0.6976919, 0, 0.02745098, 1, 1,
0.3806768, 0.2605417, -0.7438151, 0, 0.02352941, 1, 1,
0.3827668, 0.2251362, 0.7609057, 0, 0.01568628, 1, 1,
0.4024512, -0.9841061, 2.514261, 0, 0.01176471, 1, 1,
0.4048064, -0.4129278, 2.772252, 0, 0.003921569, 1, 1,
0.413548, 0.07585503, 3.84497, 0.003921569, 0, 1, 1,
0.4148851, -1.970757, 2.315674, 0.007843138, 0, 1, 1,
0.4151185, -0.06490653, 0.9072503, 0.01568628, 0, 1, 1,
0.4173042, 1.157999, 0.1828439, 0.01960784, 0, 1, 1,
0.4211836, 0.6161526, 1.214019, 0.02745098, 0, 1, 1,
0.4236807, 0.4024339, 2.788909, 0.03137255, 0, 1, 1,
0.426801, -0.464209, -0.6937434, 0.03921569, 0, 1, 1,
0.4323591, -0.2421214, 1.555942, 0.04313726, 0, 1, 1,
0.4324929, 0.6034291, -0.3717858, 0.05098039, 0, 1, 1,
0.4361814, -0.3245531, 0.06065201, 0.05490196, 0, 1, 1,
0.4420344, 0.182893, 0.1203113, 0.0627451, 0, 1, 1,
0.443792, -0.9537688, 2.374552, 0.06666667, 0, 1, 1,
0.4555682, 1.17979, -0.02439049, 0.07450981, 0, 1, 1,
0.4561733, -1.343918, 1.893233, 0.07843138, 0, 1, 1,
0.4633628, -0.6761392, 3.611953, 0.08627451, 0, 1, 1,
0.4668472, -0.8441395, 1.170182, 0.09019608, 0, 1, 1,
0.4724346, 1.465817, 0.9243745, 0.09803922, 0, 1, 1,
0.4731468, -0.6303028, 2.388999, 0.1058824, 0, 1, 1,
0.4890226, -0.518845, 3.363218, 0.1098039, 0, 1, 1,
0.4891752, -0.6245078, 1.814588, 0.1176471, 0, 1, 1,
0.4961266, -1.938043, 2.555417, 0.1215686, 0, 1, 1,
0.4983344, -1.33254, 3.94653, 0.1294118, 0, 1, 1,
0.4986798, -0.69718, 3.113826, 0.1333333, 0, 1, 1,
0.4994779, 0.4484869, 2.540499, 0.1411765, 0, 1, 1,
0.5015156, -0.416486, 2.977987, 0.145098, 0, 1, 1,
0.5018379, -0.3192753, 2.904964, 0.1529412, 0, 1, 1,
0.5023776, 1.451269, 0.6680362, 0.1568628, 0, 1, 1,
0.5084448, 0.2695661, -1.833261, 0.1647059, 0, 1, 1,
0.5099641, 0.7658138, -0.4255793, 0.1686275, 0, 1, 1,
0.5195493, -0.5639835, 2.658633, 0.1764706, 0, 1, 1,
0.5213419, 0.2280858, 0.3499635, 0.1803922, 0, 1, 1,
0.5226402, 0.3929701, 0.4380514, 0.1882353, 0, 1, 1,
0.5230194, -0.5958434, 3.526432, 0.1921569, 0, 1, 1,
0.5234544, -1.395145, 3.121342, 0.2, 0, 1, 1,
0.5334098, -1.408458, 3.743737, 0.2078431, 0, 1, 1,
0.5414764, 0.4682023, 0.8167828, 0.2117647, 0, 1, 1,
0.5443952, -1.732563, 3.259467, 0.2196078, 0, 1, 1,
0.5448816, -0.5007838, 1.596503, 0.2235294, 0, 1, 1,
0.5465139, -0.5774101, 0.8466201, 0.2313726, 0, 1, 1,
0.5468401, -0.6801216, 3.88441, 0.2352941, 0, 1, 1,
0.5527217, -1.19131, 3.046056, 0.2431373, 0, 1, 1,
0.5530168, 1.409371, 0.4218607, 0.2470588, 0, 1, 1,
0.557809, 0.4155373, 0.9568134, 0.254902, 0, 1, 1,
0.558005, 0.2286027, 0.5439402, 0.2588235, 0, 1, 1,
0.5613894, 0.1888762, 0.4259515, 0.2666667, 0, 1, 1,
0.5634246, 0.7203313, 0.9853924, 0.2705882, 0, 1, 1,
0.5702813, 0.6265087, 0.3399236, 0.2784314, 0, 1, 1,
0.5713732, -1.311091, 2.099845, 0.282353, 0, 1, 1,
0.5714073, -0.5598343, 1.492131, 0.2901961, 0, 1, 1,
0.5729456, -0.7936169, 2.606678, 0.2941177, 0, 1, 1,
0.5729458, 0.1904481, 0.7932324, 0.3019608, 0, 1, 1,
0.5752156, -0.470744, 2.949912, 0.3098039, 0, 1, 1,
0.5754808, -0.267837, 3.893018, 0.3137255, 0, 1, 1,
0.575619, 0.5565727, 0.5003591, 0.3215686, 0, 1, 1,
0.5784141, -0.3864228, 3.6351, 0.3254902, 0, 1, 1,
0.5787436, 0.202317, 0.9496633, 0.3333333, 0, 1, 1,
0.5794051, 1.655497, -0.09320984, 0.3372549, 0, 1, 1,
0.5806268, -1.786858, 2.228797, 0.345098, 0, 1, 1,
0.5821484, 0.7700266, 1.268238, 0.3490196, 0, 1, 1,
0.5858891, -0.2954005, 2.684456, 0.3568628, 0, 1, 1,
0.5905819, -0.2129463, 1.315089, 0.3607843, 0, 1, 1,
0.5954265, 0.6631433, 0.2429564, 0.3686275, 0, 1, 1,
0.5959345, 0.5087987, 0.4439274, 0.372549, 0, 1, 1,
0.599257, -0.7537034, 2.428357, 0.3803922, 0, 1, 1,
0.6008539, 0.3125566, 1.675298, 0.3843137, 0, 1, 1,
0.602199, 0.2965156, 0.6355493, 0.3921569, 0, 1, 1,
0.6116756, 0.270777, 1.293076, 0.3960784, 0, 1, 1,
0.6442056, 0.08078367, 1.496592, 0.4039216, 0, 1, 1,
0.6468977, 0.5831445, 2.501126, 0.4117647, 0, 1, 1,
0.647113, 1.883658, -0.1292033, 0.4156863, 0, 1, 1,
0.6564158, -0.1418752, 3.592316, 0.4235294, 0, 1, 1,
0.65825, -0.3755151, 1.294968, 0.427451, 0, 1, 1,
0.6649761, 1.454719, 0.4188732, 0.4352941, 0, 1, 1,
0.6657536, 0.8504515, 0.122484, 0.4392157, 0, 1, 1,
0.6684749, 0.5849122, -0.2234903, 0.4470588, 0, 1, 1,
0.6693245, -0.361157, 0.5188894, 0.4509804, 0, 1, 1,
0.6864154, -1.126646, 2.733582, 0.4588235, 0, 1, 1,
0.6876292, 0.8779507, 0.9149748, 0.4627451, 0, 1, 1,
0.6916128, 0.1365012, 1.866934, 0.4705882, 0, 1, 1,
0.6922419, 2.007989, -0.07677412, 0.4745098, 0, 1, 1,
0.6940523, 0.7605999, 0.01975626, 0.4823529, 0, 1, 1,
0.6959975, -0.4883415, 4.003969, 0.4862745, 0, 1, 1,
0.6999835, 0.4830014, 0.9691272, 0.4941176, 0, 1, 1,
0.7001383, 1.900483, 0.7478809, 0.5019608, 0, 1, 1,
0.7002434, 1.252389, 0.1563752, 0.5058824, 0, 1, 1,
0.7010022, -1.002786, 2.99648, 0.5137255, 0, 1, 1,
0.7097958, -0.3462316, 1.920219, 0.5176471, 0, 1, 1,
0.710967, 1.428264, 1.304596, 0.5254902, 0, 1, 1,
0.7131177, -0.5791143, 2.368856, 0.5294118, 0, 1, 1,
0.7144623, -1.711027, 2.253664, 0.5372549, 0, 1, 1,
0.7151524, 1.436161, 1.096945, 0.5411765, 0, 1, 1,
0.7162561, 0.1911659, 1.497239, 0.5490196, 0, 1, 1,
0.7174309, -1.330683, 2.776754, 0.5529412, 0, 1, 1,
0.7178133, -0.8856818, 3.066542, 0.5607843, 0, 1, 1,
0.7193871, 1.76838, 1.451688, 0.5647059, 0, 1, 1,
0.7216358, -0.9183055, 1.566852, 0.572549, 0, 1, 1,
0.7220353, -0.1990895, 1.267511, 0.5764706, 0, 1, 1,
0.7223737, -0.4405811, 2.994061, 0.5843138, 0, 1, 1,
0.7243636, 1.486832, 0.2573062, 0.5882353, 0, 1, 1,
0.7279457, 1.639167, 1.022787, 0.5960785, 0, 1, 1,
0.7289397, 0.1138437, 2.407513, 0.6039216, 0, 1, 1,
0.731576, 1.01981, 0.3067615, 0.6078432, 0, 1, 1,
0.7344925, 0.4519914, 1.988585, 0.6156863, 0, 1, 1,
0.7370654, 0.414498, -1.265034, 0.6196079, 0, 1, 1,
0.7375251, -0.3762458, 2.975868, 0.627451, 0, 1, 1,
0.738984, 2.115897, 0.3478715, 0.6313726, 0, 1, 1,
0.7390301, 1.211337, 0.5003647, 0.6392157, 0, 1, 1,
0.7391264, -0.02604976, -0.3753438, 0.6431373, 0, 1, 1,
0.7401257, -0.7663817, -0.2663363, 0.6509804, 0, 1, 1,
0.7416193, -0.7181389, 1.163708, 0.654902, 0, 1, 1,
0.7458256, 0.5475505, -0.4144143, 0.6627451, 0, 1, 1,
0.7469518, -0.176216, 0.2879196, 0.6666667, 0, 1, 1,
0.7494717, -0.3453399, 2.380871, 0.6745098, 0, 1, 1,
0.750746, -0.6214061, 1.453573, 0.6784314, 0, 1, 1,
0.7549558, -1.09599, 2.310086, 0.6862745, 0, 1, 1,
0.7583508, -0.6533954, 0.8138406, 0.6901961, 0, 1, 1,
0.7605608, 0.5545151, 2.713515, 0.6980392, 0, 1, 1,
0.7708979, 0.2893374, 2.346366, 0.7058824, 0, 1, 1,
0.7719812, 0.6760439, 0.6060764, 0.7098039, 0, 1, 1,
0.7751372, 2.303142, 0.8675749, 0.7176471, 0, 1, 1,
0.7757793, 1.702105, 0.06140331, 0.7215686, 0, 1, 1,
0.7769853, -0.40082, 0.1213688, 0.7294118, 0, 1, 1,
0.780192, 1.296928, 0.4247667, 0.7333333, 0, 1, 1,
0.7817745, 0.2301605, 1.166342, 0.7411765, 0, 1, 1,
0.7826316, 0.1827657, 1.127276, 0.7450981, 0, 1, 1,
0.7905217, -0.4145847, 2.703609, 0.7529412, 0, 1, 1,
0.7933494, 0.02871312, 2.547733, 0.7568628, 0, 1, 1,
0.8155532, 0.4866279, 0.4716696, 0.7647059, 0, 1, 1,
0.8187516, -1.107712, 1.534704, 0.7686275, 0, 1, 1,
0.8230547, 1.431159, 1.968877, 0.7764706, 0, 1, 1,
0.8251613, 0.1707487, 2.292292, 0.7803922, 0, 1, 1,
0.826006, -0.6375161, 0.5666219, 0.7882353, 0, 1, 1,
0.8300925, -0.6083063, 3.021149, 0.7921569, 0, 1, 1,
0.8330339, -0.6736859, 0.1824997, 0.8, 0, 1, 1,
0.8413385, 0.9777322, 1.199201, 0.8078431, 0, 1, 1,
0.8416255, 1.769919, -0.0693726, 0.8117647, 0, 1, 1,
0.8452871, -0.1504906, 0.9584492, 0.8196079, 0, 1, 1,
0.8461044, 0.8679179, -0.8793855, 0.8235294, 0, 1, 1,
0.8525102, 1.190886, 1.972603, 0.8313726, 0, 1, 1,
0.8634232, -3.233867, 3.58579, 0.8352941, 0, 1, 1,
0.8695701, 0.9755731, 1.796594, 0.8431373, 0, 1, 1,
0.8772976, -0.5356867, 2.332351, 0.8470588, 0, 1, 1,
0.8811091, -0.7644477, 1.839125, 0.854902, 0, 1, 1,
0.8866383, -0.8889895, 1.6791, 0.8588235, 0, 1, 1,
0.8978824, -0.2650414, 2.760112, 0.8666667, 0, 1, 1,
0.8994963, -0.7332682, 1.505727, 0.8705882, 0, 1, 1,
0.9019173, 0.6680986, 0.5227977, 0.8784314, 0, 1, 1,
0.9055725, -1.358655, 2.53441, 0.8823529, 0, 1, 1,
0.9109837, -0.7055494, 2.492731, 0.8901961, 0, 1, 1,
0.9113463, 0.2652612, 0.1807215, 0.8941177, 0, 1, 1,
0.9114323, 0.1077946, 1.91858, 0.9019608, 0, 1, 1,
0.9179317, 0.5844155, 1.10713, 0.9098039, 0, 1, 1,
0.920797, -0.08164589, 2.616575, 0.9137255, 0, 1, 1,
0.9211522, 0.3219164, 1.974864, 0.9215686, 0, 1, 1,
0.9217896, 1.301707, 1.500687, 0.9254902, 0, 1, 1,
0.9252954, -0.4552601, 3.341279, 0.9333333, 0, 1, 1,
0.944795, -1.319713, 2.454546, 0.9372549, 0, 1, 1,
0.948709, 0.6867425, 0.2594889, 0.945098, 0, 1, 1,
0.9554576, 2.378594, 0.6013961, 0.9490196, 0, 1, 1,
0.9554836, 1.143696, -1.054289, 0.9568627, 0, 1, 1,
0.9632203, 0.1306195, 1.167638, 0.9607843, 0, 1, 1,
0.9642171, 0.5447965, 0.6444977, 0.9686275, 0, 1, 1,
0.9672486, -1.173635, 3.973749, 0.972549, 0, 1, 1,
0.9686586, -0.4422581, 3.734889, 0.9803922, 0, 1, 1,
0.978009, -0.1374926, 0.9327176, 0.9843137, 0, 1, 1,
0.9786929, 0.6680859, 0.4436951, 0.9921569, 0, 1, 1,
0.979833, -0.5248153, 2.063475, 0.9960784, 0, 1, 1,
0.9927506, 1.84452, 1.740532, 1, 0, 0.9960784, 1,
0.9991293, -0.07964209, 1.722005, 1, 0, 0.9882353, 1,
0.9997441, -0.2358911, 1.285669, 1, 0, 0.9843137, 1,
1.000766, -0.4099894, 1.852636, 1, 0, 0.9764706, 1,
1.007668, -1.320257, 0.6305144, 1, 0, 0.972549, 1,
1.011438, 0.6251564, -0.2250986, 1, 0, 0.9647059, 1,
1.015069, 1.732913, 0.9807805, 1, 0, 0.9607843, 1,
1.022955, 1.212109, -1.251882, 1, 0, 0.9529412, 1,
1.035862, 1.368921, -0.798288, 1, 0, 0.9490196, 1,
1.035971, 1.322685, -0.9491062, 1, 0, 0.9411765, 1,
1.038348, 0.7859344, 1.221905, 1, 0, 0.9372549, 1,
1.042156, -0.9741935, 1.820847, 1, 0, 0.9294118, 1,
1.042302, 1.259155, -0.2772295, 1, 0, 0.9254902, 1,
1.044468, -1.153664, 3.454317, 1, 0, 0.9176471, 1,
1.046112, -1.211752, 1.063272, 1, 0, 0.9137255, 1,
1.046481, -1.675545, 2.813758, 1, 0, 0.9058824, 1,
1.051872, 0.3901131, 0.9149888, 1, 0, 0.9019608, 1,
1.052188, 0.00862854, 0.7595789, 1, 0, 0.8941177, 1,
1.055162, 0.2137045, 1.279516, 1, 0, 0.8862745, 1,
1.055997, 1.260604, -0.1231351, 1, 0, 0.8823529, 1,
1.071172, -1.326791, 2.978517, 1, 0, 0.8745098, 1,
1.071324, 0.4395843, 1.059343, 1, 0, 0.8705882, 1,
1.078342, -0.5944975, 1.86607, 1, 0, 0.8627451, 1,
1.08065, 1.034131, 0.7027296, 1, 0, 0.8588235, 1,
1.08285, 0.7264305, 0.5674587, 1, 0, 0.8509804, 1,
1.084518, 0.9103259, 1.972496, 1, 0, 0.8470588, 1,
1.09938, 2.343101, 0.4460843, 1, 0, 0.8392157, 1,
1.104905, 1.763081, 0.6049011, 1, 0, 0.8352941, 1,
1.105322, -0.4277129, 2.580969, 1, 0, 0.827451, 1,
1.114503, -1.049035, 1.683127, 1, 0, 0.8235294, 1,
1.115309, 1.800294, 0.000799209, 1, 0, 0.8156863, 1,
1.124095, -1.484723, 3.030491, 1, 0, 0.8117647, 1,
1.131286, 1.699721, -0.1205976, 1, 0, 0.8039216, 1,
1.134133, -0.8914748, 2.128196, 1, 0, 0.7960784, 1,
1.135316, -1.077621, 1.822708, 1, 0, 0.7921569, 1,
1.135649, -0.5218473, 1.466509, 1, 0, 0.7843137, 1,
1.135801, 1.151121, 1.658668, 1, 0, 0.7803922, 1,
1.141927, 2.381832, 0.328178, 1, 0, 0.772549, 1,
1.147656, -0.6955581, 1.11753, 1, 0, 0.7686275, 1,
1.151598, -0.2962359, 0.9945984, 1, 0, 0.7607843, 1,
1.15203, 1.059669, 1.874874, 1, 0, 0.7568628, 1,
1.154447, -0.1942566, 1.232033, 1, 0, 0.7490196, 1,
1.154906, -0.5678971, 4.067054, 1, 0, 0.7450981, 1,
1.161146, 0.6147584, -0.273402, 1, 0, 0.7372549, 1,
1.162823, 0.07313838, 0.7767038, 1, 0, 0.7333333, 1,
1.16439, -0.2444784, 1.112191, 1, 0, 0.7254902, 1,
1.169212, -0.3530923, 1.453061, 1, 0, 0.7215686, 1,
1.171091, -0.3320712, 0.02474401, 1, 0, 0.7137255, 1,
1.183215, 0.6390527, 0.4756874, 1, 0, 0.7098039, 1,
1.194167, 0.5003319, 0.9128315, 1, 0, 0.7019608, 1,
1.194177, 0.7083556, -0.4807995, 1, 0, 0.6941177, 1,
1.194612, 0.5845604, -1.336278, 1, 0, 0.6901961, 1,
1.197817, -0.2882865, 1.013433, 1, 0, 0.682353, 1,
1.198349, 1.098226, 0.07940339, 1, 0, 0.6784314, 1,
1.198995, -0.2401403, 2.050478, 1, 0, 0.6705883, 1,
1.202378, 0.8141286, 1.265098, 1, 0, 0.6666667, 1,
1.203253, 0.819509, 1.074816, 1, 0, 0.6588235, 1,
1.208255, -0.5689911, 2.684125, 1, 0, 0.654902, 1,
1.214854, -1.578738, 2.711238, 1, 0, 0.6470588, 1,
1.21731, -1.95085, 2.186868, 1, 0, 0.6431373, 1,
1.224644, -0.6845654, 1.726657, 1, 0, 0.6352941, 1,
1.229442, -0.1495438, 0.3401968, 1, 0, 0.6313726, 1,
1.230946, 2.305607, 1.204141, 1, 0, 0.6235294, 1,
1.23665, -0.8613752, 2.452869, 1, 0, 0.6196079, 1,
1.243279, -1.253887, 1.649002, 1, 0, 0.6117647, 1,
1.246003, 0.1069419, 2.2541, 1, 0, 0.6078432, 1,
1.248224, -2.277738, 5.012095, 1, 0, 0.6, 1,
1.250369, -0.1768154, 2.046214, 1, 0, 0.5921569, 1,
1.2517, 0.3767507, -1.519335, 1, 0, 0.5882353, 1,
1.254343, -1.47317, 1.906915, 1, 0, 0.5803922, 1,
1.264057, 0.7155057, 0.1641037, 1, 0, 0.5764706, 1,
1.280867, 1.434197, 1.757753, 1, 0, 0.5686275, 1,
1.281782, 1.263663, -0.3101847, 1, 0, 0.5647059, 1,
1.284196, -0.6036988, 2.52108, 1, 0, 0.5568628, 1,
1.292201, -0.7231581, 3.002367, 1, 0, 0.5529412, 1,
1.297399, -2.671573, 0.511279, 1, 0, 0.5450981, 1,
1.298579, -0.1740973, 1.209413, 1, 0, 0.5411765, 1,
1.299538, 0.02740402, 0.9277323, 1, 0, 0.5333334, 1,
1.311253, 1.499608, 1.158681, 1, 0, 0.5294118, 1,
1.314491, -1.246821, 2.312505, 1, 0, 0.5215687, 1,
1.320365, -0.3232383, 1.791649, 1, 0, 0.5176471, 1,
1.338802, 1.802304, -0.3208976, 1, 0, 0.509804, 1,
1.340853, -1.190236, 2.312308, 1, 0, 0.5058824, 1,
1.347345, -0.3651229, 1.985499, 1, 0, 0.4980392, 1,
1.366171, -0.3788313, 1.650376, 1, 0, 0.4901961, 1,
1.3665, -0.6756617, 3.162858, 1, 0, 0.4862745, 1,
1.373677, -1.074874, 3.532725, 1, 0, 0.4784314, 1,
1.37641, 2.493917, 0.8268851, 1, 0, 0.4745098, 1,
1.380408, 1.735527, 2.185725, 1, 0, 0.4666667, 1,
1.392032, 0.2588088, 1.188383, 1, 0, 0.4627451, 1,
1.409274, 0.4101844, -0.2234087, 1, 0, 0.454902, 1,
1.414575, 0.7958631, 1.051895, 1, 0, 0.4509804, 1,
1.430653, -1.161638, 1.134159, 1, 0, 0.4431373, 1,
1.432618, 0.3076558, 0.1037452, 1, 0, 0.4392157, 1,
1.437913, 0.5313905, -0.8746295, 1, 0, 0.4313726, 1,
1.438974, 1.499261, 0.5749601, 1, 0, 0.427451, 1,
1.445801, 1.175041, 0.5765074, 1, 0, 0.4196078, 1,
1.45911, 0.2202861, 3.586756, 1, 0, 0.4156863, 1,
1.459723, 2.8439, 1.697828, 1, 0, 0.4078431, 1,
1.483536, -0.1153504, 1.626297, 1, 0, 0.4039216, 1,
1.493401, 0.3165786, 0.424933, 1, 0, 0.3960784, 1,
1.503538, 1.194674, 1.37896, 1, 0, 0.3882353, 1,
1.525335, 0.3979072, 0.127595, 1, 0, 0.3843137, 1,
1.526732, -0.9053945, 3.067273, 1, 0, 0.3764706, 1,
1.532578, 0.5750222, 0.07647247, 1, 0, 0.372549, 1,
1.536139, -0.103563, 3.372429, 1, 0, 0.3647059, 1,
1.542033, -0.327461, 0.899978, 1, 0, 0.3607843, 1,
1.551211, -0.5075805, 2.228813, 1, 0, 0.3529412, 1,
1.552899, -0.1173994, 3.268626, 1, 0, 0.3490196, 1,
1.55703, -0.8499788, 0.314854, 1, 0, 0.3411765, 1,
1.621614, 0.5374424, -1.619061, 1, 0, 0.3372549, 1,
1.626969, 0.2058512, 0.8058939, 1, 0, 0.3294118, 1,
1.637018, 0.8146415, 0.04246033, 1, 0, 0.3254902, 1,
1.654558, -1.846702, 2.992645, 1, 0, 0.3176471, 1,
1.670097, -1.023498, 4.37341, 1, 0, 0.3137255, 1,
1.670156, -1.216619, 1.535451, 1, 0, 0.3058824, 1,
1.67597, -0.08818006, 2.614275, 1, 0, 0.2980392, 1,
1.682507, 0.8996171, 0.4741531, 1, 0, 0.2941177, 1,
1.694647, -2.459813, 1.521832, 1, 0, 0.2862745, 1,
1.698144, -0.6390306, 3.86662, 1, 0, 0.282353, 1,
1.71234, -1.836265, 1.317378, 1, 0, 0.2745098, 1,
1.729477, -0.3204476, 1.424005, 1, 0, 0.2705882, 1,
1.745871, -1.460779, 2.5696, 1, 0, 0.2627451, 1,
1.763612, 0.541087, 0.5475501, 1, 0, 0.2588235, 1,
1.775599, 0.3142371, 2.706899, 1, 0, 0.2509804, 1,
1.797287, -1.374375, 3.437507, 1, 0, 0.2470588, 1,
1.813959, -1.388346, 2.175786, 1, 0, 0.2392157, 1,
1.82241, -0.6925672, 1.720964, 1, 0, 0.2352941, 1,
1.852529, -0.4354045, 2.382259, 1, 0, 0.227451, 1,
1.857473, 0.07714222, 2.12581, 1, 0, 0.2235294, 1,
1.861605, -0.3248228, 2.966058, 1, 0, 0.2156863, 1,
1.882726, -0.06920721, 2.72015, 1, 0, 0.2117647, 1,
1.889275, -1.928051, 2.153058, 1, 0, 0.2039216, 1,
1.910851, 0.84951, 1.796313, 1, 0, 0.1960784, 1,
1.916668, -0.2714641, 1.294481, 1, 0, 0.1921569, 1,
1.9411, -1.839103, 5.009621, 1, 0, 0.1843137, 1,
1.942859, -0.2730477, 1.794912, 1, 0, 0.1803922, 1,
1.953322, 2.907803, 1.294585, 1, 0, 0.172549, 1,
1.956838, 1.874036, 2.32158, 1, 0, 0.1686275, 1,
1.972369, -0.01465854, 0.04867397, 1, 0, 0.1607843, 1,
1.986741, -0.697511, -0.3498811, 1, 0, 0.1568628, 1,
1.996475, 0.2234968, 0.9456231, 1, 0, 0.1490196, 1,
1.996666, -1.001645, 2.117535, 1, 0, 0.145098, 1,
2.024176, 0.819392, 0.5232369, 1, 0, 0.1372549, 1,
2.049618, 0.1856516, 0.7508737, 1, 0, 0.1333333, 1,
2.076537, -0.7051196, 0.8561667, 1, 0, 0.1254902, 1,
2.095354, 0.9852006, 2.101042, 1, 0, 0.1215686, 1,
2.104911, 1.458395, 1.461516, 1, 0, 0.1137255, 1,
2.107262, -0.1874286, 0.4816283, 1, 0, 0.1098039, 1,
2.158507, -1.36196, 1.794155, 1, 0, 0.1019608, 1,
2.160229, 1.409903, 0.3185054, 1, 0, 0.09411765, 1,
2.209079, -0.7022903, 3.712932, 1, 0, 0.09019608, 1,
2.223564, 1.160378, 1.112323, 1, 0, 0.08235294, 1,
2.268581, -0.8574909, 0.4622976, 1, 0, 0.07843138, 1,
2.348419, 0.3971242, 2.820612, 1, 0, 0.07058824, 1,
2.352486, 0.1997046, 1.962863, 1, 0, 0.06666667, 1,
2.359883, -2.684061, 2.27577, 1, 0, 0.05882353, 1,
2.380334, 0.9880884, 0.7741167, 1, 0, 0.05490196, 1,
2.395542, 1.397753, 0.7873342, 1, 0, 0.04705882, 1,
2.398201, -0.4689104, 1.040736, 1, 0, 0.04313726, 1,
2.476977, -0.3386535, 0.1581063, 1, 0, 0.03529412, 1,
2.523508, -1.808687, 3.204664, 1, 0, 0.03137255, 1,
2.694015, -0.4495901, -0.7217268, 1, 0, 0.02352941, 1,
2.938569, -0.7947609, 2.353019, 1, 0, 0.01960784, 1,
3.130891, -0.5798186, 1.69619, 1, 0, 0.01176471, 1,
3.869765, -0.1261809, 1.287837, 1, 0, 0.007843138, 1
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
0.1763346, -4.27488, -6.691103, 0, -0.5, 0.5, 0.5,
0.1763346, -4.27488, -6.691103, 1, -0.5, 0.5, 0.5,
0.1763346, -4.27488, -6.691103, 1, 1.5, 0.5, 0.5,
0.1763346, -4.27488, -6.691103, 0, 1.5, 0.5, 0.5
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
-4.769168, -0.1630319, -6.691103, 0, -0.5, 0.5, 0.5,
-4.769168, -0.1630319, -6.691103, 1, -0.5, 0.5, 0.5,
-4.769168, -0.1630319, -6.691103, 1, 1.5, 0.5, 0.5,
-4.769168, -0.1630319, -6.691103, 0, 1.5, 0.5, 0.5
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
-4.769168, -4.27488, 0.008590221, 0, -0.5, 0.5, 0.5,
-4.769168, -4.27488, 0.008590221, 1, -0.5, 0.5, 0.5,
-4.769168, -4.27488, 0.008590221, 1, 1.5, 0.5, 0.5,
-4.769168, -4.27488, 0.008590221, 0, 1.5, 0.5, 0.5
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
-2, -3.325992, -5.14502,
2, -3.325992, -5.14502,
-2, -3.325992, -5.14502,
-2, -3.48414, -5.402701,
0, -3.325992, -5.14502,
0, -3.48414, -5.402701,
2, -3.325992, -5.14502,
2, -3.48414, -5.402701
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
"0",
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
-2, -3.800436, -5.918062, 0, -0.5, 0.5, 0.5,
-2, -3.800436, -5.918062, 1, -0.5, 0.5, 0.5,
-2, -3.800436, -5.918062, 1, 1.5, 0.5, 0.5,
-2, -3.800436, -5.918062, 0, 1.5, 0.5, 0.5,
0, -3.800436, -5.918062, 0, -0.5, 0.5, 0.5,
0, -3.800436, -5.918062, 1, -0.5, 0.5, 0.5,
0, -3.800436, -5.918062, 1, 1.5, 0.5, 0.5,
0, -3.800436, -5.918062, 0, 1.5, 0.5, 0.5,
2, -3.800436, -5.918062, 0, -0.5, 0.5, 0.5,
2, -3.800436, -5.918062, 1, -0.5, 0.5, 0.5,
2, -3.800436, -5.918062, 1, 1.5, 0.5, 0.5,
2, -3.800436, -5.918062, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.627898, -3, -5.14502,
-3.627898, 2, -5.14502,
-3.627898, -3, -5.14502,
-3.81811, -3, -5.402701,
-3.627898, -2, -5.14502,
-3.81811, -2, -5.402701,
-3.627898, -1, -5.14502,
-3.81811, -1, -5.402701,
-3.627898, 0, -5.14502,
-3.81811, 0, -5.402701,
-3.627898, 1, -5.14502,
-3.81811, 1, -5.402701,
-3.627898, 2, -5.14502,
-3.81811, 2, -5.402701
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
-4.198534, -3, -5.918062, 0, -0.5, 0.5, 0.5,
-4.198534, -3, -5.918062, 1, -0.5, 0.5, 0.5,
-4.198534, -3, -5.918062, 1, 1.5, 0.5, 0.5,
-4.198534, -3, -5.918062, 0, 1.5, 0.5, 0.5,
-4.198534, -2, -5.918062, 0, -0.5, 0.5, 0.5,
-4.198534, -2, -5.918062, 1, -0.5, 0.5, 0.5,
-4.198534, -2, -5.918062, 1, 1.5, 0.5, 0.5,
-4.198534, -2, -5.918062, 0, 1.5, 0.5, 0.5,
-4.198534, -1, -5.918062, 0, -0.5, 0.5, 0.5,
-4.198534, -1, -5.918062, 1, -0.5, 0.5, 0.5,
-4.198534, -1, -5.918062, 1, 1.5, 0.5, 0.5,
-4.198534, -1, -5.918062, 0, 1.5, 0.5, 0.5,
-4.198534, 0, -5.918062, 0, -0.5, 0.5, 0.5,
-4.198534, 0, -5.918062, 1, -0.5, 0.5, 0.5,
-4.198534, 0, -5.918062, 1, 1.5, 0.5, 0.5,
-4.198534, 0, -5.918062, 0, 1.5, 0.5, 0.5,
-4.198534, 1, -5.918062, 0, -0.5, 0.5, 0.5,
-4.198534, 1, -5.918062, 1, -0.5, 0.5, 0.5,
-4.198534, 1, -5.918062, 1, 1.5, 0.5, 0.5,
-4.198534, 1, -5.918062, 0, 1.5, 0.5, 0.5,
-4.198534, 2, -5.918062, 0, -0.5, 0.5, 0.5,
-4.198534, 2, -5.918062, 1, -0.5, 0.5, 0.5,
-4.198534, 2, -5.918062, 1, 1.5, 0.5, 0.5,
-4.198534, 2, -5.918062, 0, 1.5, 0.5, 0.5
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
-3.627898, -3.325992, -4,
-3.627898, -3.325992, 4,
-3.627898, -3.325992, -4,
-3.81811, -3.48414, -4,
-3.627898, -3.325992, -2,
-3.81811, -3.48414, -2,
-3.627898, -3.325992, 0,
-3.81811, -3.48414, 0,
-3.627898, -3.325992, 2,
-3.81811, -3.48414, 2,
-3.627898, -3.325992, 4,
-3.81811, -3.48414, 4
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
-4.198534, -3.800436, -4, 0, -0.5, 0.5, 0.5,
-4.198534, -3.800436, -4, 1, -0.5, 0.5, 0.5,
-4.198534, -3.800436, -4, 1, 1.5, 0.5, 0.5,
-4.198534, -3.800436, -4, 0, 1.5, 0.5, 0.5,
-4.198534, -3.800436, -2, 0, -0.5, 0.5, 0.5,
-4.198534, -3.800436, -2, 1, -0.5, 0.5, 0.5,
-4.198534, -3.800436, -2, 1, 1.5, 0.5, 0.5,
-4.198534, -3.800436, -2, 0, 1.5, 0.5, 0.5,
-4.198534, -3.800436, 0, 0, -0.5, 0.5, 0.5,
-4.198534, -3.800436, 0, 1, -0.5, 0.5, 0.5,
-4.198534, -3.800436, 0, 1, 1.5, 0.5, 0.5,
-4.198534, -3.800436, 0, 0, 1.5, 0.5, 0.5,
-4.198534, -3.800436, 2, 0, -0.5, 0.5, 0.5,
-4.198534, -3.800436, 2, 1, -0.5, 0.5, 0.5,
-4.198534, -3.800436, 2, 1, 1.5, 0.5, 0.5,
-4.198534, -3.800436, 2, 0, 1.5, 0.5, 0.5,
-4.198534, -3.800436, 4, 0, -0.5, 0.5, 0.5,
-4.198534, -3.800436, 4, 1, -0.5, 0.5, 0.5,
-4.198534, -3.800436, 4, 1, 1.5, 0.5, 0.5,
-4.198534, -3.800436, 4, 0, 1.5, 0.5, 0.5
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
-3.627898, -3.325992, -5.14502,
-3.627898, 2.999928, -5.14502,
-3.627898, -3.325992, 5.1622,
-3.627898, 2.999928, 5.1622,
-3.627898, -3.325992, -5.14502,
-3.627898, -3.325992, 5.1622,
-3.627898, 2.999928, -5.14502,
-3.627898, 2.999928, 5.1622,
-3.627898, -3.325992, -5.14502,
3.980568, -3.325992, -5.14502,
-3.627898, -3.325992, 5.1622,
3.980568, -3.325992, 5.1622,
-3.627898, 2.999928, -5.14502,
3.980568, 2.999928, -5.14502,
-3.627898, 2.999928, 5.1622,
3.980568, 2.999928, 5.1622,
3.980568, -3.325992, -5.14502,
3.980568, 2.999928, -5.14502,
3.980568, -3.325992, 5.1622,
3.980568, 2.999928, 5.1622,
3.980568, -3.325992, -5.14502,
3.980568, -3.325992, 5.1622,
3.980568, 2.999928, -5.14502,
3.980568, 2.999928, 5.1622
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
var radius = 7.629475;
var distance = 33.9444;
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
mvMatrix.translate( -0.1763346, 0.1630319, -0.008590221 );
mvMatrix.scale( 1.084205, 1.304022, 0.8003261 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.9444);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
O-2-methoxycarbonylp<-read.table("O-2-methoxycarbonylp.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 5 elements
```

```r
x<-O-2-methoxycarbonylp$V2
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
```

```r
y<-O-2-methoxycarbonylp$V3
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
```

```r
z<-O-2-methoxycarbonylp$V4
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
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
-3.517096, -0.9869701, -2.47697, 0, 0, 1, 1, 1,
-3.029049, -1.681657, -2.745901, 1, 0, 0, 1, 1,
-2.737401, -1.782514, -2.511188, 1, 0, 0, 1, 1,
-2.726537, -0.3529273, -2.366029, 1, 0, 0, 1, 1,
-2.591422, -0.7812405, -2.379768, 1, 0, 0, 1, 1,
-2.540804, 1.58359, -0.5549527, 1, 0, 0, 1, 1,
-2.492664, -0.3599601, -3.915864, 0, 0, 0, 1, 1,
-2.46875, -0.2471637, -1.596199, 0, 0, 0, 1, 1,
-2.434878, -0.5887279, -1.399164, 0, 0, 0, 1, 1,
-2.375859, -1.338691, -0.7564548, 0, 0, 0, 1, 1,
-2.339581, 0.4510151, -2.155689, 0, 0, 0, 1, 1,
-2.290509, 0.07922783, -1.888046, 0, 0, 0, 1, 1,
-2.23534, -1.106091, 0.718618, 0, 0, 0, 1, 1,
-2.215985, -1.148692, -2.410918, 1, 1, 1, 1, 1,
-2.203437, -1.07506, -1.59511, 1, 1, 1, 1, 1,
-2.160881, 0.136626, -1.495404, 1, 1, 1, 1, 1,
-2.145973, -0.03877678, 0.09561935, 1, 1, 1, 1, 1,
-2.144515, 1.336705, -0.8509287, 1, 1, 1, 1, 1,
-2.089537, -0.04516353, -0.8256594, 1, 1, 1, 1, 1,
-2.086412, 0.7065602, -1.669504, 1, 1, 1, 1, 1,
-2.026789, -1.712408, -3.93035, 1, 1, 1, 1, 1,
-2.010223, 0.526143, -0.2065661, 1, 1, 1, 1, 1,
-1.987608, 0.08945611, -2.660255, 1, 1, 1, 1, 1,
-1.98086, -0.8259316, -2.51729, 1, 1, 1, 1, 1,
-1.944579, 0.5494636, -2.84907, 1, 1, 1, 1, 1,
-1.9255, 0.5102178, -1.122938, 1, 1, 1, 1, 1,
-1.923501, -0.4870513, -2.674225, 1, 1, 1, 1, 1,
-1.901437, 0.2837457, -1.782791, 1, 1, 1, 1, 1,
-1.878183, -1.004468, -2.563704, 0, 0, 1, 1, 1,
-1.86409, 0.686266, 0.04272417, 1, 0, 0, 1, 1,
-1.859918, 0.2578484, -1.503746, 1, 0, 0, 1, 1,
-1.834526, 0.2192083, -1.894518, 1, 0, 0, 1, 1,
-1.816644, 1.795957, -1.030558, 1, 0, 0, 1, 1,
-1.80192, 2.351599, -1.50771, 1, 0, 0, 1, 1,
-1.797854, -0.4399086, 0.818185, 0, 0, 0, 1, 1,
-1.777151, 0.5733128, -1.712784, 0, 0, 0, 1, 1,
-1.765587, -0.8190495, -0.6460935, 0, 0, 0, 1, 1,
-1.757784, 0.3629238, -0.8622481, 0, 0, 0, 1, 1,
-1.741238, 0.7390993, -0.5473237, 0, 0, 0, 1, 1,
-1.735456, 0.6477175, -2.499965, 0, 0, 0, 1, 1,
-1.719409, -0.7432821, -2.021357, 0, 0, 0, 1, 1,
-1.70308, 0.4781121, -1.743505, 1, 1, 1, 1, 1,
-1.684537, 0.4848032, -2.316565, 1, 1, 1, 1, 1,
-1.683334, -1.846215, -2.927434, 1, 1, 1, 1, 1,
-1.676937, 2.239382, 0.001411757, 1, 1, 1, 1, 1,
-1.660102, -0.7428234, -1.682828, 1, 1, 1, 1, 1,
-1.646806, -1.258215, -0.4488313, 1, 1, 1, 1, 1,
-1.644227, -0.2609002, -0.09092781, 1, 1, 1, 1, 1,
-1.640773, 1.106959, -1.454173, 1, 1, 1, 1, 1,
-1.638831, 0.4453355, -0.657536, 1, 1, 1, 1, 1,
-1.636168, -0.1003716, -1.537984, 1, 1, 1, 1, 1,
-1.62654, 0.6125914, -1.633674, 1, 1, 1, 1, 1,
-1.619321, 0.9017964, -0.6474472, 1, 1, 1, 1, 1,
-1.590842, -1.01999, -1.428075, 1, 1, 1, 1, 1,
-1.588554, 1.495845, 0.7018173, 1, 1, 1, 1, 1,
-1.586047, -1.113832, -1.314196, 1, 1, 1, 1, 1,
-1.581479, 0.9175133, 0.008442886, 0, 0, 1, 1, 1,
-1.576457, 0.555038, -0.6599702, 1, 0, 0, 1, 1,
-1.567263, -0.2080518, -1.201776, 1, 0, 0, 1, 1,
-1.566459, -0.6497406, -1.410791, 1, 0, 0, 1, 1,
-1.5608, 0.9737518, -1.545701, 1, 0, 0, 1, 1,
-1.542798, -0.01560119, -1.606415, 1, 0, 0, 1, 1,
-1.54144, -2.036168, -2.123095, 0, 0, 0, 1, 1,
-1.541261, 0.6132758, -0.1700293, 0, 0, 0, 1, 1,
-1.52587, -1.022775, -3.082513, 0, 0, 0, 1, 1,
-1.518662, 0.3438271, -2.895132, 0, 0, 0, 1, 1,
-1.515998, 0.2636023, -0.5046356, 0, 0, 0, 1, 1,
-1.515665, 0.7252037, 0.3927051, 0, 0, 0, 1, 1,
-1.504128, -0.2099043, -2.229989, 0, 0, 0, 1, 1,
-1.502622, 0.3455185, -3.562732, 1, 1, 1, 1, 1,
-1.501496, -1.286984, -3.666861, 1, 1, 1, 1, 1,
-1.488614, -0.03266404, 0.4758732, 1, 1, 1, 1, 1,
-1.474758, 0.01845598, -2.230392, 1, 1, 1, 1, 1,
-1.47105, -1.592901, -2.754805, 1, 1, 1, 1, 1,
-1.470608, 1.102647, -2.477756, 1, 1, 1, 1, 1,
-1.461984, 1.259914, -0.3326442, 1, 1, 1, 1, 1,
-1.454482, 0.6601863, 0.4196976, 1, 1, 1, 1, 1,
-1.449373, -0.5359214, 0.03828077, 1, 1, 1, 1, 1,
-1.447288, -0.5237445, -1.292688, 1, 1, 1, 1, 1,
-1.44136, 0.7171234, -0.7786644, 1, 1, 1, 1, 1,
-1.433997, -0.4498853, -4.837049, 1, 1, 1, 1, 1,
-1.423599, -0.9906142, 0.08017025, 1, 1, 1, 1, 1,
-1.414968, -0.9635131, -0.7956859, 1, 1, 1, 1, 1,
-1.410288, -0.5645694, -1.601526, 1, 1, 1, 1, 1,
-1.39047, 1.669434, 0.8326032, 0, 0, 1, 1, 1,
-1.389522, -0.1936831, -1.132771, 1, 0, 0, 1, 1,
-1.376521, 1.455908, -2.166842, 1, 0, 0, 1, 1,
-1.375807, 0.7469297, -1.429594, 1, 0, 0, 1, 1,
-1.369766, -1.44868, -1.253281, 1, 0, 0, 1, 1,
-1.355253, 0.8091442, -1.476829, 1, 0, 0, 1, 1,
-1.351789, 0.2201668, -2.453101, 0, 0, 0, 1, 1,
-1.333167, -3.009291, -1.451924, 0, 0, 0, 1, 1,
-1.327974, -1.009709, -2.400104, 0, 0, 0, 1, 1,
-1.326267, 0.397612, -2.060267, 0, 0, 0, 1, 1,
-1.323572, 1.092105, 1.139036, 0, 0, 0, 1, 1,
-1.315204, -0.8936045, -1.746566, 0, 0, 0, 1, 1,
-1.298527, -1.479172, -2.135654, 0, 0, 0, 1, 1,
-1.287477, 1.198509, 0.2394666, 1, 1, 1, 1, 1,
-1.283669, -0.2350362, -0.7098595, 1, 1, 1, 1, 1,
-1.279611, -0.2682484, -2.599241, 1, 1, 1, 1, 1,
-1.272709, 0.08020262, -1.202898, 1, 1, 1, 1, 1,
-1.271357, 0.3809107, -0.1233158, 1, 1, 1, 1, 1,
-1.265254, 2.656297, -0.4612199, 1, 1, 1, 1, 1,
-1.256198, 2.010125, -2.506904, 1, 1, 1, 1, 1,
-1.255403, -0.5857651, -4.106668, 1, 1, 1, 1, 1,
-1.240301, 0.5598486, -0.5851201, 1, 1, 1, 1, 1,
-1.231047, 0.1845803, -0.7052724, 1, 1, 1, 1, 1,
-1.216031, 0.8855209, -3.132998, 1, 1, 1, 1, 1,
-1.207782, -0.2234181, -1.342726, 1, 1, 1, 1, 1,
-1.191883, -1.136071, -1.174983, 1, 1, 1, 1, 1,
-1.160437, -1.213013, -1.019726, 1, 1, 1, 1, 1,
-1.158494, 0.9294115, -0.9277083, 1, 1, 1, 1, 1,
-1.15243, -0.5942553, -0.7589065, 0, 0, 1, 1, 1,
-1.146609, 0.7181502, -0.3702425, 1, 0, 0, 1, 1,
-1.142969, 0.2319981, -3.475847, 1, 0, 0, 1, 1,
-1.137922, 0.6641571, -0.4933926, 1, 0, 0, 1, 1,
-1.129197, 0.3479432, -1.634868, 1, 0, 0, 1, 1,
-1.122835, 0.03751711, -1.281433, 1, 0, 0, 1, 1,
-1.121704, 1.680986, -1.532542, 0, 0, 0, 1, 1,
-1.11515, 0.3985129, -0.9511524, 0, 0, 0, 1, 1,
-1.097831, -0.7957529, -1.440699, 0, 0, 0, 1, 1,
-1.095909, -0.8534361, -1.035498, 0, 0, 0, 1, 1,
-1.092805, -0.2855152, -0.949715, 0, 0, 0, 1, 1,
-1.092026, 0.6595494, -0.917103, 0, 0, 0, 1, 1,
-1.08946, 0.7183494, -1.291516, 0, 0, 0, 1, 1,
-1.087651, -1.513936, -3.027318, 1, 1, 1, 1, 1,
-1.0866, -0.1165738, -1.978827, 1, 1, 1, 1, 1,
-1.085348, 0.3820254, -1.60266, 1, 1, 1, 1, 1,
-1.08281, 0.2765918, -1.396024, 1, 1, 1, 1, 1,
-1.082764, -0.8549358, -2.448107, 1, 1, 1, 1, 1,
-1.07956, 1.443445, 0.37913, 1, 1, 1, 1, 1,
-1.075868, 0.7669747, -0.2773745, 1, 1, 1, 1, 1,
-1.072122, 1.755044, -1.848889, 1, 1, 1, 1, 1,
-1.072048, 0.3938149, 0.8254133, 1, 1, 1, 1, 1,
-1.066492, 0.6933734, -2.21406, 1, 1, 1, 1, 1,
-1.063701, 0.8114425, -1.699551, 1, 1, 1, 1, 1,
-1.05798, 0.5468665, -0.9520842, 1, 1, 1, 1, 1,
-1.056406, -0.01175647, -1.181078, 1, 1, 1, 1, 1,
-1.04845, -0.007315547, -0.1153152, 1, 1, 1, 1, 1,
-1.044897, -0.8022599, -1.990378, 1, 1, 1, 1, 1,
-1.035772, 1.077009, -1.445653, 0, 0, 1, 1, 1,
-1.03343, -0.3209228, -1.071535, 1, 0, 0, 1, 1,
-1.032435, 0.4492026, -2.61989, 1, 0, 0, 1, 1,
-1.029986, 0.4869724, -0.6065025, 1, 0, 0, 1, 1,
-1.028264, -0.7932321, -0.7952282, 1, 0, 0, 1, 1,
-1.023977, 1.383009, 1.833073, 1, 0, 0, 1, 1,
-1.011595, 0.9842541, -1.363932, 0, 0, 0, 1, 1,
-1.011027, -1.220844, -1.5377, 0, 0, 0, 1, 1,
-1.008448, 0.9953193, 1.655226, 0, 0, 0, 1, 1,
-1.007208, 0.7367589, -1.155351, 0, 0, 0, 1, 1,
-1.000538, 0.7145771, -0.09741784, 0, 0, 0, 1, 1,
-0.991899, -0.2291735, -0.6729777, 0, 0, 0, 1, 1,
-0.9909819, 0.04270156, -0.2431888, 0, 0, 0, 1, 1,
-0.9901605, 1.127452, 0.0248418, 1, 1, 1, 1, 1,
-0.9897261, -0.6891033, -2.567285, 1, 1, 1, 1, 1,
-0.9843773, 0.3172356, -0.978264, 1, 1, 1, 1, 1,
-0.9819319, -1.997837, -4.937499, 1, 1, 1, 1, 1,
-0.9807909, -0.2658765, -1.635852, 1, 1, 1, 1, 1,
-0.9799557, -0.1518243, -3.548565, 1, 1, 1, 1, 1,
-0.9772442, 0.5779587, -0.3334319, 1, 1, 1, 1, 1,
-0.9771006, -0.5077121, -1.979421, 1, 1, 1, 1, 1,
-0.9758336, -0.8311515, -1.235422, 1, 1, 1, 1, 1,
-0.9723992, -0.3379224, -1.474931, 1, 1, 1, 1, 1,
-0.9493088, 0.7507641, -1.32478, 1, 1, 1, 1, 1,
-0.9354578, -0.6790676, -2.185848, 1, 1, 1, 1, 1,
-0.9346231, -0.4811915, -0.7145345, 1, 1, 1, 1, 1,
-0.9336162, -0.5880587, -2.784863, 1, 1, 1, 1, 1,
-0.9335964, 0.3666664, -0.6597459, 1, 1, 1, 1, 1,
-0.9267222, -0.1559809, -2.789675, 0, 0, 1, 1, 1,
-0.9259073, 0.3778405, -1.516144, 1, 0, 0, 1, 1,
-0.9219838, -0.1840805, -2.466347, 1, 0, 0, 1, 1,
-0.9209021, -0.1874292, -1.632434, 1, 0, 0, 1, 1,
-0.9175491, -1.060254, -3.761119, 1, 0, 0, 1, 1,
-0.91374, -1.19643, -1.021907, 1, 0, 0, 1, 1,
-0.908897, 0.429493, -2.795707, 0, 0, 0, 1, 1,
-0.9079129, -0.4673062, -2.239545, 0, 0, 0, 1, 1,
-0.9075745, -1.398153, -2.738283, 0, 0, 0, 1, 1,
-0.9033637, -1.441001, -2.316684, 0, 0, 0, 1, 1,
-0.9005505, 1.862622, 0.5551302, 0, 0, 0, 1, 1,
-0.8984732, 0.03201582, -1.83088, 0, 0, 0, 1, 1,
-0.8966814, 0.2206659, -1.363497, 0, 0, 0, 1, 1,
-0.8950796, -0.3821466, -0.6529154, 1, 1, 1, 1, 1,
-0.8862617, 1.41744, -0.05253836, 1, 1, 1, 1, 1,
-0.8849425, 1.315076, -1.178109, 1, 1, 1, 1, 1,
-0.8814819, 0.2472979, -1.435514, 1, 1, 1, 1, 1,
-0.8810073, 1.502067, 1.527079, 1, 1, 1, 1, 1,
-0.8788967, -0.4960531, -4.982618, 1, 1, 1, 1, 1,
-0.8772728, -0.2282346, -2.10019, 1, 1, 1, 1, 1,
-0.8770652, 0.1248624, -1.512293, 1, 1, 1, 1, 1,
-0.8766056, -0.6873076, -2.312349, 1, 1, 1, 1, 1,
-0.8765742, -0.0195497, -2.34095, 1, 1, 1, 1, 1,
-0.873538, 0.8627502, -1.067985, 1, 1, 1, 1, 1,
-0.8719863, -0.2792563, -1.767587, 1, 1, 1, 1, 1,
-0.8717479, -0.1982861, -0.4968425, 1, 1, 1, 1, 1,
-0.8699539, -0.8267702, -1.422701, 1, 1, 1, 1, 1,
-0.8646876, -0.6732588, -2.900655, 1, 1, 1, 1, 1,
-0.8612855, 0.05973532, -2.824182, 0, 0, 1, 1, 1,
-0.8607162, -0.3996443, -2.300534, 1, 0, 0, 1, 1,
-0.8579683, -0.8117533, -1.655684, 1, 0, 0, 1, 1,
-0.8526729, 1.245164, -0.4279896, 1, 0, 0, 1, 1,
-0.8485076, 0.214456, -1.736234, 1, 0, 0, 1, 1,
-0.8482935, -0.102647, -1.372601, 1, 0, 0, 1, 1,
-0.8477097, 0.6858757, 0.1690133, 0, 0, 0, 1, 1,
-0.8381175, -0.2546393, -2.934786, 0, 0, 0, 1, 1,
-0.8360077, 1.714095, 0.7245863, 0, 0, 0, 1, 1,
-0.8321171, -0.5242078, -3.16875, 0, 0, 0, 1, 1,
-0.826466, -0.3471364, -2.843248, 0, 0, 0, 1, 1,
-0.8256292, 0.8801557, 0.1597946, 0, 0, 0, 1, 1,
-0.8219934, -1.302834, -2.616022, 0, 0, 0, 1, 1,
-0.8201745, -1.404566, -2.553701, 1, 1, 1, 1, 1,
-0.8198388, 0.4475541, 0.09829386, 1, 1, 1, 1, 1,
-0.8158092, 1.77364, -1.805635, 1, 1, 1, 1, 1,
-0.8081693, -1.438697, -4.259527, 1, 1, 1, 1, 1,
-0.8081023, 1.046641, 0.05569506, 1, 1, 1, 1, 1,
-0.8069932, -1.414331, -3.91992, 1, 1, 1, 1, 1,
-0.8064121, -0.8464211, -2.243687, 1, 1, 1, 1, 1,
-0.8055415, -0.4939942, -2.596292, 1, 1, 1, 1, 1,
-0.8048525, -1.989625, -1.400945, 1, 1, 1, 1, 1,
-0.8021798, -0.05817791, -0.4719736, 1, 1, 1, 1, 1,
-0.8015832, -0.5918553, -3.015009, 1, 1, 1, 1, 1,
-0.7936555, -0.4883523, -2.176607, 1, 1, 1, 1, 1,
-0.7878902, -1.156236, -2.382578, 1, 1, 1, 1, 1,
-0.7821434, 0.7698737, -1.604282, 1, 1, 1, 1, 1,
-0.7806272, 1.281451, -0.6426997, 1, 1, 1, 1, 1,
-0.7780523, -2.274307, -3.865444, 0, 0, 1, 1, 1,
-0.7749395, 0.04424638, -0.7594706, 1, 0, 0, 1, 1,
-0.7692719, -0.5318959, -1.178623, 1, 0, 0, 1, 1,
-0.7627559, -0.9668097, -2.846266, 1, 0, 0, 1, 1,
-0.7589363, -1.163531, -3.250615, 1, 0, 0, 1, 1,
-0.7577586, -1.483585, -2.426429, 1, 0, 0, 1, 1,
-0.7505046, -1.143639, -1.027541, 0, 0, 0, 1, 1,
-0.7497217, 0.1727436, -2.027611, 0, 0, 0, 1, 1,
-0.7445273, -0.1364803, -2.894657, 0, 0, 0, 1, 1,
-0.7437645, 0.6967525, -2.289521, 0, 0, 0, 1, 1,
-0.7383993, -0.5860044, -2.383743, 0, 0, 0, 1, 1,
-0.7318528, -1.873604, -3.186136, 0, 0, 0, 1, 1,
-0.7240587, 0.9917918, -0.007193652, 0, 0, 0, 1, 1,
-0.7212656, 0.9260585, -0.2285027, 1, 1, 1, 1, 1,
-0.7207876, 0.04387049, -2.116771, 1, 1, 1, 1, 1,
-0.718808, -0.2723229, -0.9195296, 1, 1, 1, 1, 1,
-0.7159376, -1.027594, -3.474215, 1, 1, 1, 1, 1,
-0.7137179, 0.1753231, -2.82216, 1, 1, 1, 1, 1,
-0.712938, 0.06755731, -2.059664, 1, 1, 1, 1, 1,
-0.7127619, 0.07791121, -0.232168, 1, 1, 1, 1, 1,
-0.7121083, 1.895771, 0.1968847, 1, 1, 1, 1, 1,
-0.7100079, 0.816217, 0.2522742, 1, 1, 1, 1, 1,
-0.7072058, -0.1053675, -0.5893996, 1, 1, 1, 1, 1,
-0.7062008, -1.276716, -1.708908, 1, 1, 1, 1, 1,
-0.7055573, -0.2187484, -2.219937, 1, 1, 1, 1, 1,
-0.7050061, 0.3166511, -3.412973, 1, 1, 1, 1, 1,
-0.7035338, -0.7655084, -2.974774, 1, 1, 1, 1, 1,
-0.7033438, -0.6082892, -4.994915, 1, 1, 1, 1, 1,
-0.7012055, 0.7957081, 0.3977625, 0, 0, 1, 1, 1,
-0.6992131, 0.9151726, 0.5521083, 1, 0, 0, 1, 1,
-0.6917517, 1.366685, 0.1311952, 1, 0, 0, 1, 1,
-0.6900391, -0.5878701, -2.624097, 1, 0, 0, 1, 1,
-0.6892031, -0.1868806, -0.4026344, 1, 0, 0, 1, 1,
-0.6866132, 0.1860437, -3.106405, 1, 0, 0, 1, 1,
-0.6783934, 0.6585478, 0.1700328, 0, 0, 0, 1, 1,
-0.6748286, 2.215966, 0.8965116, 0, 0, 0, 1, 1,
-0.6727973, 1.3607, 0.4035701, 0, 0, 0, 1, 1,
-0.667906, 0.977455, -1.644061, 0, 0, 0, 1, 1,
-0.667175, -0.06893034, -1.441285, 0, 0, 0, 1, 1,
-0.6565009, -0.2321122, -1.234572, 0, 0, 0, 1, 1,
-0.6508242, 0.4814391, -1.453395, 0, 0, 0, 1, 1,
-0.6506238, -2.39165, -1.423675, 1, 1, 1, 1, 1,
-0.6501409, 0.717369, -1.31994, 1, 1, 1, 1, 1,
-0.6470908, 0.5818608, -0.4629748, 1, 1, 1, 1, 1,
-0.6457309, 1.262692, -0.8486735, 1, 1, 1, 1, 1,
-0.6386229, -0.2279423, -2.930181, 1, 1, 1, 1, 1,
-0.6337383, -0.6803451, -2.038934, 1, 1, 1, 1, 1,
-0.6325312, 0.2496594, -2.71224, 1, 1, 1, 1, 1,
-0.6299995, 2.00809, 1.631536, 1, 1, 1, 1, 1,
-0.629791, 0.2737193, -0.7812137, 1, 1, 1, 1, 1,
-0.627552, -0.3863282, -2.185846, 1, 1, 1, 1, 1,
-0.6268626, -0.7913841, -3.043628, 1, 1, 1, 1, 1,
-0.6262013, -0.5341151, -2.054013, 1, 1, 1, 1, 1,
-0.6253984, -0.7191726, -1.592689, 1, 1, 1, 1, 1,
-0.6183437, -0.7633335, -2.661623, 1, 1, 1, 1, 1,
-0.6175897, -0.08069634, -1.823431, 1, 1, 1, 1, 1,
-0.6105036, -0.1606889, -3.014449, 0, 0, 1, 1, 1,
-0.6006924, 0.6479999, -0.261111, 1, 0, 0, 1, 1,
-0.5982127, 0.6604875, -0.720079, 1, 0, 0, 1, 1,
-0.5976403, 0.4589361, -1.558866, 1, 0, 0, 1, 1,
-0.5903, -0.5788281, -3.229457, 1, 0, 0, 1, 1,
-0.5888754, 0.07776001, -0.7132123, 1, 0, 0, 1, 1,
-0.5861407, -0.7487581, -3.063864, 0, 0, 0, 1, 1,
-0.5828677, 0.3419795, -2.409441, 0, 0, 0, 1, 1,
-0.5785441, -1.236891, -0.7691176, 0, 0, 0, 1, 1,
-0.5756183, -0.5358624, -1.59974, 0, 0, 0, 1, 1,
-0.5752177, -0.6647101, -2.00084, 0, 0, 0, 1, 1,
-0.5749272, -2.653836, -3.935, 0, 0, 0, 1, 1,
-0.5716538, -0.88291, -2.170066, 0, 0, 0, 1, 1,
-0.5684173, 1.515375, -1.163268, 1, 1, 1, 1, 1,
-0.5602745, 0.4699124, 0.04132255, 1, 1, 1, 1, 1,
-0.5558431, -1.96349, -1.960081, 1, 1, 1, 1, 1,
-0.5539064, -0.2036214, -2.223572, 1, 1, 1, 1, 1,
-0.5527391, 0.157859, -1.482886, 1, 1, 1, 1, 1,
-0.5521771, 1.304608, 1.082795, 1, 1, 1, 1, 1,
-0.5521079, -0.7002173, -2.384336, 1, 1, 1, 1, 1,
-0.5520186, -1.00547, -2.105667, 1, 1, 1, 1, 1,
-0.5501012, -1.071779, -4.038021, 1, 1, 1, 1, 1,
-0.5451588, 0.5865978, -1.477645, 1, 1, 1, 1, 1,
-0.5446267, 0.7793721, -1.880353, 1, 1, 1, 1, 1,
-0.5441915, 0.254032, -0.147835, 1, 1, 1, 1, 1,
-0.5316473, 0.2106306, -1.038774, 1, 1, 1, 1, 1,
-0.5315117, -0.8293961, -2.180484, 1, 1, 1, 1, 1,
-0.5307108, -0.04615313, -2.431064, 1, 1, 1, 1, 1,
-0.5263746, -1.365925, -2.876157, 0, 0, 1, 1, 1,
-0.5257077, -0.3280988, -1.42226, 1, 0, 0, 1, 1,
-0.5252984, 0.6834292, -2.466172, 1, 0, 0, 1, 1,
-0.5206397, 0.1038534, -1.076769, 1, 0, 0, 1, 1,
-0.5157129, -0.2751902, -0.439585, 1, 0, 0, 1, 1,
-0.5112606, 1.319701, 0.8604863, 1, 0, 0, 1, 1,
-0.5089469, -0.8562464, -3.034547, 0, 0, 0, 1, 1,
-0.506676, -1.846944, -0.5260406, 0, 0, 0, 1, 1,
-0.504196, 0.6505933, -0.5747481, 0, 0, 0, 1, 1,
-0.5036668, 0.3052251, 0.1409361, 0, 0, 0, 1, 1,
-0.5032385, -0.4770488, -2.912102, 0, 0, 0, 1, 1,
-0.5013918, 2.036686, -0.04349042, 0, 0, 0, 1, 1,
-0.499847, 0.2480845, -1.845867, 0, 0, 0, 1, 1,
-0.4986805, 0.05289257, -3.387357, 1, 1, 1, 1, 1,
-0.4978024, 0.1714155, -3.247474, 1, 1, 1, 1, 1,
-0.4950702, 1.296322, 0.04047481, 1, 1, 1, 1, 1,
-0.484483, 1.181509, -1.042851, 1, 1, 1, 1, 1,
-0.4794486, 0.7188067, -1.266275, 1, 1, 1, 1, 1,
-0.478265, -0.6770324, -4.255831, 1, 1, 1, 1, 1,
-0.4756949, -0.9953301, -3.69515, 1, 1, 1, 1, 1,
-0.469184, 1.226362, -0.7134616, 1, 1, 1, 1, 1,
-0.4672798, -1.714131, -1.677804, 1, 1, 1, 1, 1,
-0.464398, 0.283123, -1.012756, 1, 1, 1, 1, 1,
-0.4635956, -1.096279, -3.496713, 1, 1, 1, 1, 1,
-0.4604079, -1.68573, -1.670416, 1, 1, 1, 1, 1,
-0.4602483, 1.304459, 0.47022, 1, 1, 1, 1, 1,
-0.4596833, 0.004629176, -1.519023, 1, 1, 1, 1, 1,
-0.4595518, -0.2197799, -1.983295, 1, 1, 1, 1, 1,
-0.457116, -0.5207916, -1.849007, 0, 0, 1, 1, 1,
-0.4567637, 1.758876, -0.3280432, 1, 0, 0, 1, 1,
-0.4546798, -0.2343038, 0.2715896, 1, 0, 0, 1, 1,
-0.4544079, 0.09576774, -2.897191, 1, 0, 0, 1, 1,
-0.4525326, 1.588618, -0.5447315, 1, 0, 0, 1, 1,
-0.4446196, 1.769963, -1.395935, 1, 0, 0, 1, 1,
-0.4432073, -0.2655824, -1.831074, 0, 0, 0, 1, 1,
-0.4428569, 0.8435606, -1.329664, 0, 0, 0, 1, 1,
-0.4419927, 1.381212, 0.9833443, 0, 0, 0, 1, 1,
-0.4419242, 1.967371, 0.6805204, 0, 0, 0, 1, 1,
-0.4415737, -0.445532, -3.498462, 0, 0, 0, 1, 1,
-0.4382671, 0.5767767, -0.7498529, 0, 0, 0, 1, 1,
-0.4355926, -0.9220402, -1.967054, 0, 0, 0, 1, 1,
-0.4343324, -0.709123, -2.500569, 1, 1, 1, 1, 1,
-0.4334419, 0.004970184, -1.475935, 1, 1, 1, 1, 1,
-0.4322747, -1.041867, -2.940695, 1, 1, 1, 1, 1,
-0.4235446, -1.539857, -2.667822, 1, 1, 1, 1, 1,
-0.4222226, -0.9477471, -3.726907, 1, 1, 1, 1, 1,
-0.4195379, 0.4664346, -1.678662, 1, 1, 1, 1, 1,
-0.4190568, -1.511163, -2.330214, 1, 1, 1, 1, 1,
-0.4168478, -0.1502972, -2.029347, 1, 1, 1, 1, 1,
-0.4068626, -0.04745375, -1.374006, 1, 1, 1, 1, 1,
-0.4041336, 0.4099832, -1.406099, 1, 1, 1, 1, 1,
-0.4024503, 0.3304642, -0.7832914, 1, 1, 1, 1, 1,
-0.4007204, -0.7358868, -1.447632, 1, 1, 1, 1, 1,
-0.3997953, 1.716838, -1.490566, 1, 1, 1, 1, 1,
-0.3926736, 1.486303, -1.095185, 1, 1, 1, 1, 1,
-0.3837354, -0.02845266, -0.5928903, 1, 1, 1, 1, 1,
-0.3833884, 0.007176418, -0.8665647, 0, 0, 1, 1, 1,
-0.3827839, 0.8779278, -1.55148, 1, 0, 0, 1, 1,
-0.3817472, 1.296623, -0.8551221, 1, 0, 0, 1, 1,
-0.3789341, -0.01405349, -2.227362, 1, 0, 0, 1, 1,
-0.3783829, 0.02350635, -1.192526, 1, 0, 0, 1, 1,
-0.3754545, 0.1236142, -1.54541, 1, 0, 0, 1, 1,
-0.3726083, -0.6571453, -1.936783, 0, 0, 0, 1, 1,
-0.3708587, -0.6230252, -2.554857, 0, 0, 0, 1, 1,
-0.3699, 2.433485, 0.5902566, 0, 0, 0, 1, 1,
-0.3683531, 0.07933837, -2.353824, 0, 0, 0, 1, 1,
-0.3660101, -0.6205866, -2.284566, 0, 0, 0, 1, 1,
-0.3658724, 2.193334, 0.1702503, 0, 0, 0, 1, 1,
-0.3658597, -1.479, -2.317488, 0, 0, 0, 1, 1,
-0.3601934, -0.3491334, -2.582445, 1, 1, 1, 1, 1,
-0.3548411, -0.4932584, -2.913373, 1, 1, 1, 1, 1,
-0.3494599, -0.1203489, -1.769026, 1, 1, 1, 1, 1,
-0.3476104, -0.1401935, -2.8815, 1, 1, 1, 1, 1,
-0.3446867, 0.817699, -0.8398309, 1, 1, 1, 1, 1,
-0.3428561, -0.3862666, -2.116233, 1, 1, 1, 1, 1,
-0.3403947, 2.145894, 0.3397954, 1, 1, 1, 1, 1,
-0.3384846, -0.9046237, -1.212883, 1, 1, 1, 1, 1,
-0.337577, -0.2576495, -1.591422, 1, 1, 1, 1, 1,
-0.3371903, -0.5192813, -3.526479, 1, 1, 1, 1, 1,
-0.3348272, -0.7751608, -2.315527, 1, 1, 1, 1, 1,
-0.3337547, -0.4985421, -3.459958, 1, 1, 1, 1, 1,
-0.3313894, -0.6572393, -3.468565, 1, 1, 1, 1, 1,
-0.3281064, -0.8162339, -1.528472, 1, 1, 1, 1, 1,
-0.3280574, 0.4846803, 0.2782779, 1, 1, 1, 1, 1,
-0.3237152, -0.9717404, -2.874912, 0, 0, 1, 1, 1,
-0.3205851, -1.648158, -0.5172784, 1, 0, 0, 1, 1,
-0.3179781, -0.3991875, -2.218229, 1, 0, 0, 1, 1,
-0.3168464, -0.5733866, -2.138292, 1, 0, 0, 1, 1,
-0.3137836, 0.1417589, -0.6920376, 1, 0, 0, 1, 1,
-0.3122801, 0.7421402, -0.9486428, 1, 0, 0, 1, 1,
-0.3118504, -0.9353729, -3.71133, 0, 0, 0, 1, 1,
-0.3091727, -0.3147134, -2.089262, 0, 0, 0, 1, 1,
-0.3038629, -0.8295097, -3.705412, 0, 0, 0, 1, 1,
-0.3031725, -1.194164, -1.891646, 0, 0, 0, 1, 1,
-0.3030988, 0.919116, -2.30268, 0, 0, 0, 1, 1,
-0.3007121, -0.08235176, -0.6888067, 0, 0, 0, 1, 1,
-0.2990275, -0.3238789, -3.297238, 0, 0, 0, 1, 1,
-0.2988054, 0.3926519, -1.541226, 1, 1, 1, 1, 1,
-0.2980731, -0.2709429, -3.604328, 1, 1, 1, 1, 1,
-0.2948469, -0.3748996, -1.768699, 1, 1, 1, 1, 1,
-0.2895635, 1.091465, -0.9237657, 1, 1, 1, 1, 1,
-0.2865846, -0.08812007, -0.1913484, 1, 1, 1, 1, 1,
-0.2863983, -0.9525399, -0.956581, 1, 1, 1, 1, 1,
-0.2853893, 0.002300658, -0.970552, 1, 1, 1, 1, 1,
-0.2845421, 0.6394679, -2.038139, 1, 1, 1, 1, 1,
-0.2839833, -1.069958, -3.021065, 1, 1, 1, 1, 1,
-0.2774419, 1.663123, 0.2483491, 1, 1, 1, 1, 1,
-0.2767452, 0.7454118, -1.746445, 1, 1, 1, 1, 1,
-0.2720912, 1.888161, 0.6653299, 1, 1, 1, 1, 1,
-0.2710151, 0.334856, -0.8210839, 1, 1, 1, 1, 1,
-0.2673997, 0.252411, -0.5184184, 1, 1, 1, 1, 1,
-0.26532, -2.139722, -3.675727, 1, 1, 1, 1, 1,
-0.2621425, -0.7647967, -2.106332, 0, 0, 1, 1, 1,
-0.2600516, -0.7830264, -0.576174, 1, 0, 0, 1, 1,
-0.2558917, 2.655228, -1.24955, 1, 0, 0, 1, 1,
-0.2532172, -0.3447967, -2.262437, 1, 0, 0, 1, 1,
-0.2496664, 0.07149497, -1.622681, 1, 0, 0, 1, 1,
-0.2470888, -0.05826986, -2.729348, 1, 0, 0, 1, 1,
-0.2446389, -0.6312487, -2.446016, 0, 0, 0, 1, 1,
-0.2431817, 0.1684592, -0.08805405, 0, 0, 0, 1, 1,
-0.2405035, -0.7172872, -2.267833, 0, 0, 0, 1, 1,
-0.2387402, 1.201988, 0.2244386, 0, 0, 0, 1, 1,
-0.230662, 0.7228464, 0.005028738, 0, 0, 0, 1, 1,
-0.2296951, 0.5508693, -1.761564, 0, 0, 0, 1, 1,
-0.2268355, 0.1515043, -0.7667346, 0, 0, 0, 1, 1,
-0.2263459, 1.25889, -1.014953, 1, 1, 1, 1, 1,
-0.2214151, -2.209174, -0.9191382, 1, 1, 1, 1, 1,
-0.2186032, 1.31339, -1.192241, 1, 1, 1, 1, 1,
-0.2173268, -0.2111633, 0.07911016, 1, 1, 1, 1, 1,
-0.2165823, 0.6268384, -0.2045895, 1, 1, 1, 1, 1,
-0.2153353, -0.0538021, -2.485691, 1, 1, 1, 1, 1,
-0.2145094, 1.020748, 3.372028, 1, 1, 1, 1, 1,
-0.2127617, 0.4341635, -2.956802, 1, 1, 1, 1, 1,
-0.2114622, 0.1091212, -1.403644, 1, 1, 1, 1, 1,
-0.2064559, 0.06118059, -2.592374, 1, 1, 1, 1, 1,
-0.2032817, 0.284332, 0.1199406, 1, 1, 1, 1, 1,
-0.1965516, -0.02420141, -2.571478, 1, 1, 1, 1, 1,
-0.1951966, -0.1444118, -1.915475, 1, 1, 1, 1, 1,
-0.1912663, -1.852416, -2.951934, 1, 1, 1, 1, 1,
-0.1874286, -0.5772874, -3.95406, 1, 1, 1, 1, 1,
-0.1868048, 0.4490976, -0.6166636, 0, 0, 1, 1, 1,
-0.1856799, 0.4903682, -0.06943478, 1, 0, 0, 1, 1,
-0.1852403, 0.8579692, 0.8231945, 1, 0, 0, 1, 1,
-0.1848342, -0.3946534, -2.582814, 1, 0, 0, 1, 1,
-0.1845476, 1.698305, 0.295619, 1, 0, 0, 1, 1,
-0.1824942, 1.266229, -0.6438881, 1, 0, 0, 1, 1,
-0.1807288, 0.6831608, 0.3305732, 0, 0, 0, 1, 1,
-0.1803406, -0.07757221, -2.1224, 0, 0, 0, 1, 1,
-0.175573, 0.2594476, -0.8271002, 0, 0, 0, 1, 1,
-0.1752827, 1.97873, -1.07176, 0, 0, 0, 1, 1,
-0.168723, -2.240681, -4.299414, 0, 0, 0, 1, 1,
-0.1686046, -0.3136857, -1.793148, 0, 0, 0, 1, 1,
-0.1667171, -0.5676758, -0.4566335, 0, 0, 0, 1, 1,
-0.165521, 0.6251242, -0.3507413, 1, 1, 1, 1, 1,
-0.1644149, -1.532024, -2.435677, 1, 1, 1, 1, 1,
-0.1614513, -0.6742673, -3.44572, 1, 1, 1, 1, 1,
-0.1612152, 0.9715827, 0.8116608, 1, 1, 1, 1, 1,
-0.160688, 0.08346175, -2.120504, 1, 1, 1, 1, 1,
-0.1592478, -1.343849, -3.05127, 1, 1, 1, 1, 1,
-0.1581291, 1.30008, 1.125758, 1, 1, 1, 1, 1,
-0.1540226, -0.2984849, -2.061863, 1, 1, 1, 1, 1,
-0.1515588, -1.156063, -2.804287, 1, 1, 1, 1, 1,
-0.1503228, 2.02824, 0.1849128, 1, 1, 1, 1, 1,
-0.150309, -2.298466, -3.26984, 1, 1, 1, 1, 1,
-0.1490811, 0.2659338, 0.3757435, 1, 1, 1, 1, 1,
-0.1485953, 0.9106917, -0.3193496, 1, 1, 1, 1, 1,
-0.1459593, -0.04894545, -2.764365, 1, 1, 1, 1, 1,
-0.1437037, 0.7158124, -1.118978, 1, 1, 1, 1, 1,
-0.1414344, 0.5399646, -0.4816217, 0, 0, 1, 1, 1,
-0.137284, 0.4379205, -1.077376, 1, 0, 0, 1, 1,
-0.136645, -0.2201243, -2.812106, 1, 0, 0, 1, 1,
-0.1358556, -1.223451, -3.333038, 1, 0, 0, 1, 1,
-0.1356129, 0.3865858, -0.931917, 1, 0, 0, 1, 1,
-0.1340355, -0.5073885, -4.08411, 1, 0, 0, 1, 1,
-0.1317165, -0.5503711, -2.052358, 0, 0, 0, 1, 1,
-0.1312024, -0.3804369, -2.932132, 0, 0, 0, 1, 1,
-0.1302444, -0.991893, -2.450988, 0, 0, 0, 1, 1,
-0.1293025, -0.6284271, -1.800707, 0, 0, 0, 1, 1,
-0.1281179, -0.1251912, -3.279352, 0, 0, 0, 1, 1,
-0.1195121, -0.5914159, -4.830096, 0, 0, 0, 1, 1,
-0.1170862, -0.4584446, -1.510535, 0, 0, 0, 1, 1,
-0.1168026, 1.926529, -0.7424483, 1, 1, 1, 1, 1,
-0.1151873, -0.2068247, -2.463838, 1, 1, 1, 1, 1,
-0.1104024, -0.7113923, -3.074905, 1, 1, 1, 1, 1,
-0.1101907, -0.6785403, -1.073959, 1, 1, 1, 1, 1,
-0.1098732, 0.3757078, -0.8198949, 1, 1, 1, 1, 1,
-0.1035478, -2.77419, -1.984973, 1, 1, 1, 1, 1,
-0.1020679, -0.6735777, -2.724518, 1, 1, 1, 1, 1,
-0.09669109, 1.075979, 0.8403336, 1, 1, 1, 1, 1,
-0.09265421, 0.9914051, 0.789804, 1, 1, 1, 1, 1,
-0.08949829, -0.9426435, -3.258853, 1, 1, 1, 1, 1,
-0.08618972, -1.069387, -3.231022, 1, 1, 1, 1, 1,
-0.08555718, -0.8035296, -3.127439, 1, 1, 1, 1, 1,
-0.08315443, -1.073838, -4.027881, 1, 1, 1, 1, 1,
-0.08161792, -1.836722, -2.882798, 1, 1, 1, 1, 1,
-0.07978368, 0.04836072, -0.9448451, 1, 1, 1, 1, 1,
-0.06801087, -0.9844948, -4.094876, 0, 0, 1, 1, 1,
-0.06619427, 0.514751, 0.5328808, 1, 0, 0, 1, 1,
-0.06602343, -1.13329, -3.24128, 1, 0, 0, 1, 1,
-0.06530602, 0.2636351, -0.3556802, 1, 0, 0, 1, 1,
-0.05630288, -0.5590003, -3.096618, 1, 0, 0, 1, 1,
-0.05265154, -0.8164753, -2.072653, 1, 0, 0, 1, 1,
-0.05104519, -0.5653824, -4.34869, 0, 0, 0, 1, 1,
-0.04649815, -0.3590848, -3.652686, 0, 0, 0, 1, 1,
-0.04595975, 1.26872, 0.3453444, 0, 0, 0, 1, 1,
-0.04408392, -1.370866, -1.862408, 0, 0, 0, 1, 1,
-0.03567706, 0.1969947, 0.8013325, 0, 0, 0, 1, 1,
-0.02830759, -2.116266, -2.905977, 0, 0, 0, 1, 1,
-0.02762721, 0.3586577, 1.477093, 0, 0, 0, 1, 1,
-0.02419937, 0.7820876, -1.066592, 1, 1, 1, 1, 1,
-0.02282751, 1.01184, 0.04066134, 1, 1, 1, 1, 1,
-0.02102512, -0.6587687, -2.395659, 1, 1, 1, 1, 1,
-0.01972232, 0.809193, 1.450588, 1, 1, 1, 1, 1,
-0.01842237, -2.544259, -3.226669, 1, 1, 1, 1, 1,
-0.01804717, -0.2629068, -4.109741, 1, 1, 1, 1, 1,
-0.01671758, 1.953078, -0.6827341, 1, 1, 1, 1, 1,
-0.01445187, 2.398219, 2.429983, 1, 1, 1, 1, 1,
-0.01389517, -0.3977921, -3.471396, 1, 1, 1, 1, 1,
-0.01296913, -2.257139, -2.136071, 1, 1, 1, 1, 1,
-0.01282741, -1.704761, -4.323809, 1, 1, 1, 1, 1,
-0.0121657, -0.8965274, -2.594028, 1, 1, 1, 1, 1,
-0.01034372, 1.097342, 0.5719661, 1, 1, 1, 1, 1,
-0.004992541, -1.012482, -4.64588, 1, 1, 1, 1, 1,
7.981142e-05, -0.2668983, 2.341246, 1, 1, 1, 1, 1,
0.0001545529, 1.149466, -0.3278602, 0, 0, 1, 1, 1,
0.006164844, -0.7343615, 2.612064, 1, 0, 0, 1, 1,
0.006920246, -0.4644386, 2.931484, 1, 0, 0, 1, 1,
0.01590333, -0.3027152, 2.951115, 1, 0, 0, 1, 1,
0.01764298, -0.4951545, 4.650715, 1, 0, 0, 1, 1,
0.01807311, -0.6376294, 3.465797, 1, 0, 0, 1, 1,
0.01935237, 0.3768429, 1.243379, 0, 0, 0, 1, 1,
0.02988492, 1.210555, 0.9633595, 0, 0, 0, 1, 1,
0.03124171, 2.01848, -0.3656558, 0, 0, 0, 1, 1,
0.03214583, -0.4452698, 3.779456, 0, 0, 0, 1, 1,
0.03265407, -0.5261328, 4.376272, 0, 0, 0, 1, 1,
0.03537828, 0.9657548, -0.1653445, 0, 0, 0, 1, 1,
0.04110283, -0.7427912, 2.872581, 0, 0, 0, 1, 1,
0.04166336, -0.4299033, 2.211182, 1, 1, 1, 1, 1,
0.04370575, -0.7744224, 2.257644, 1, 1, 1, 1, 1,
0.04557778, 0.4846742, 1.205514, 1, 1, 1, 1, 1,
0.04766369, 0.2105852, -1.394817, 1, 1, 1, 1, 1,
0.04864193, 0.4522196, -1.260206, 1, 1, 1, 1, 1,
0.05008671, 0.5354568, 0.2085792, 1, 1, 1, 1, 1,
0.05063327, -0.7889388, 3.22182, 1, 1, 1, 1, 1,
0.05344476, 0.1780356, 1.720596, 1, 1, 1, 1, 1,
0.05823982, -0.9240063, 3.981361, 1, 1, 1, 1, 1,
0.05831291, -0.5493605, 2.010528, 1, 1, 1, 1, 1,
0.05855907, -0.5565659, 3.628614, 1, 1, 1, 1, 1,
0.06083494, 2.256861, -0.2116946, 1, 1, 1, 1, 1,
0.06344213, 2.058673, -0.685645, 1, 1, 1, 1, 1,
0.06594748, -0.2038642, 2.866601, 1, 1, 1, 1, 1,
0.06755556, -0.1770156, 1.588013, 1, 1, 1, 1, 1,
0.07272701, -0.6772149, 4.055457, 0, 0, 1, 1, 1,
0.0749818, 1.141502, -0.7790292, 1, 0, 0, 1, 1,
0.07652052, -0.7005185, 3.623824, 1, 0, 0, 1, 1,
0.07660075, -0.94225, 1.931857, 1, 0, 0, 1, 1,
0.07925706, -0.1892048, 2.393865, 1, 0, 0, 1, 1,
0.08036911, 1.293455, 0.1558981, 1, 0, 0, 1, 1,
0.08424155, 0.6578404, 0.5136132, 0, 0, 0, 1, 1,
0.08581239, 1.147645, 0.04204898, 0, 0, 0, 1, 1,
0.09092454, 0.5483746, -0.02415539, 0, 0, 0, 1, 1,
0.09694023, 1.521194, 0.8619806, 0, 0, 0, 1, 1,
0.1039164, 1.371709, -0.8612145, 0, 0, 0, 1, 1,
0.1058253, 0.8082004, 0.3915147, 0, 0, 0, 1, 1,
0.1109052, 1.958053, -0.01542082, 0, 0, 0, 1, 1,
0.1122643, 1.892472, -0.05263274, 1, 1, 1, 1, 1,
0.1128806, -0.7503443, 3.415815, 1, 1, 1, 1, 1,
0.1147304, -0.6775767, 2.003741, 1, 1, 1, 1, 1,
0.1191845, 0.7432985, -0.3759809, 1, 1, 1, 1, 1,
0.1216083, -0.3416263, 3.822635, 1, 1, 1, 1, 1,
0.1232616, -0.09919, 0.4051098, 1, 1, 1, 1, 1,
0.1249537, 0.9030338, -0.2039678, 1, 1, 1, 1, 1,
0.1296336, -1.354434, 4.866985, 1, 1, 1, 1, 1,
0.1344174, -0.6806738, 3.416224, 1, 1, 1, 1, 1,
0.134759, -1.372849, 1.30813, 1, 1, 1, 1, 1,
0.1370316, 0.7355828, -0.1531819, 1, 1, 1, 1, 1,
0.1384402, 1.604379, 1.465639, 1, 1, 1, 1, 1,
0.1395538, -0.6368695, 2.782112, 1, 1, 1, 1, 1,
0.1430348, -0.3426621, 3.34656, 1, 1, 1, 1, 1,
0.1432607, 1.209293, -1.211516, 1, 1, 1, 1, 1,
0.1473563, -0.3193227, 2.365138, 0, 0, 1, 1, 1,
0.1482506, 0.4648706, -2.008037, 1, 0, 0, 1, 1,
0.1497825, 0.3586829, -0.8099449, 1, 0, 0, 1, 1,
0.1540911, -0.5450014, 3.284891, 1, 0, 0, 1, 1,
0.1632696, -0.8458497, 3.519995, 1, 0, 0, 1, 1,
0.1648381, -0.7079465, 2.591003, 1, 0, 0, 1, 1,
0.1702652, 0.2753242, -0.4475601, 0, 0, 0, 1, 1,
0.1707242, -0.9122007, 2.029949, 0, 0, 0, 1, 1,
0.1758647, 0.009179455, 1.485669, 0, 0, 0, 1, 1,
0.1780432, 0.13859, 1.506006, 0, 0, 0, 1, 1,
0.1793923, -0.2728059, 3.288857, 0, 0, 0, 1, 1,
0.1800399, 0.6061253, 0.3536218, 0, 0, 0, 1, 1,
0.1815149, 0.5352438, 2.012347, 0, 0, 0, 1, 1,
0.1821054, -1.013673, 3.033008, 1, 1, 1, 1, 1,
0.1874489, 0.1467441, 0.5790301, 1, 1, 1, 1, 1,
0.1887456, -0.7460347, 4.396595, 1, 1, 1, 1, 1,
0.1918156, -0.364581, 0.8360155, 1, 1, 1, 1, 1,
0.197908, 0.03347144, 1.914723, 1, 1, 1, 1, 1,
0.198108, -0.5110965, 1.459453, 1, 1, 1, 1, 1,
0.2039357, 0.02022075, 1.411808, 1, 1, 1, 1, 1,
0.2123184, 0.3177027, 0.03656603, 1, 1, 1, 1, 1,
0.215326, 0.1095607, 2.07895, 1, 1, 1, 1, 1,
0.217376, 2.513719, 0.06063712, 1, 1, 1, 1, 1,
0.2184259, 0.5346392, 0.9457435, 1, 1, 1, 1, 1,
0.2209157, 0.3701213, 0.590467, 1, 1, 1, 1, 1,
0.2242962, 0.9065663, 1.634032, 1, 1, 1, 1, 1,
0.2334798, -0.1279983, 2.186412, 1, 1, 1, 1, 1,
0.2358937, -0.9728818, 1.052579, 1, 1, 1, 1, 1,
0.245952, -0.3541628, 3.238622, 0, 0, 1, 1, 1,
0.2484128, 0.2712951, 3.776437, 1, 0, 0, 1, 1,
0.2485232, -1.588529, 1.326011, 1, 0, 0, 1, 1,
0.2520372, 0.8104827, 0.3257407, 1, 0, 0, 1, 1,
0.2675774, -2.058982, 3.225409, 1, 0, 0, 1, 1,
0.2711953, 0.9165471, -0.8042832, 1, 0, 0, 1, 1,
0.2733858, 0.9125167, 0.9071563, 0, 0, 0, 1, 1,
0.275866, -1.29791, 3.314861, 0, 0, 0, 1, 1,
0.2761967, -0.1147463, -0.2633249, 0, 0, 0, 1, 1,
0.2762031, 0.774799, 0.1397883, 0, 0, 0, 1, 1,
0.2773249, -1.110362, 2.619259, 0, 0, 0, 1, 1,
0.2872342, 1.580108, -1.213563, 0, 0, 0, 1, 1,
0.2889395, -0.4616468, 1.533892, 0, 0, 0, 1, 1,
0.2894906, -1.060063, 2.284898, 1, 1, 1, 1, 1,
0.2942474, -0.06620792, 0.4453689, 1, 1, 1, 1, 1,
0.2949032, -1.387597, 4.556644, 1, 1, 1, 1, 1,
0.299307, -0.4330412, 2.82963, 1, 1, 1, 1, 1,
0.3025492, 1.058464, 0.8581264, 1, 1, 1, 1, 1,
0.3040555, -0.08803263, 1.117237, 1, 1, 1, 1, 1,
0.3066865, -0.6899381, 2.168141, 1, 1, 1, 1, 1,
0.3090546, -0.6487073, 0.7837903, 1, 1, 1, 1, 1,
0.3114312, -1.417389, 2.852875, 1, 1, 1, 1, 1,
0.3147539, 0.4605515, -0.2131416, 1, 1, 1, 1, 1,
0.3200333, 0.054636, 0.9358813, 1, 1, 1, 1, 1,
0.324347, -0.4185949, 1.118378, 1, 1, 1, 1, 1,
0.3252756, -0.1146668, 2.843651, 1, 1, 1, 1, 1,
0.3282314, 0.07025997, 2.049915, 1, 1, 1, 1, 1,
0.331809, 0.1148874, 0.658958, 1, 1, 1, 1, 1,
0.3343035, -1.643015, 3.222271, 0, 0, 1, 1, 1,
0.3390898, 0.6957385, -0.3612569, 1, 0, 0, 1, 1,
0.3402072, -0.965554, 3.510246, 1, 0, 0, 1, 1,
0.3402916, 0.0677055, 0.8231658, 1, 0, 0, 1, 1,
0.3407656, -0.2895966, 2.209908, 1, 0, 0, 1, 1,
0.3442955, 1.298641, 1.05617, 1, 0, 0, 1, 1,
0.3472814, -0.2074296, 0.6680346, 0, 0, 0, 1, 1,
0.3486597, -2.918607, 2.815003, 0, 0, 0, 1, 1,
0.3504798, 0.5119519, 0.1129897, 0, 0, 0, 1, 1,
0.3505452, 0.5683556, 0.6289982, 0, 0, 0, 1, 1,
0.353799, -1.226184, 1.98779, 0, 0, 0, 1, 1,
0.3559656, 1.099845, -0.9715599, 0, 0, 0, 1, 1,
0.3561565, -0.1363684, 1.619774, 0, 0, 0, 1, 1,
0.3608964, 0.9486151, 1.205347, 1, 1, 1, 1, 1,
0.3611044, -0.8087224, 4.652949, 1, 1, 1, 1, 1,
0.3616739, 0.445821, 0.8366356, 1, 1, 1, 1, 1,
0.365831, -0.7572878, 2.173902, 1, 1, 1, 1, 1,
0.3757416, 0.08015899, 1.171757, 1, 1, 1, 1, 1,
0.3780546, 1.659644, -0.6976919, 1, 1, 1, 1, 1,
0.3806768, 0.2605417, -0.7438151, 1, 1, 1, 1, 1,
0.3827668, 0.2251362, 0.7609057, 1, 1, 1, 1, 1,
0.4024512, -0.9841061, 2.514261, 1, 1, 1, 1, 1,
0.4048064, -0.4129278, 2.772252, 1, 1, 1, 1, 1,
0.413548, 0.07585503, 3.84497, 1, 1, 1, 1, 1,
0.4148851, -1.970757, 2.315674, 1, 1, 1, 1, 1,
0.4151185, -0.06490653, 0.9072503, 1, 1, 1, 1, 1,
0.4173042, 1.157999, 0.1828439, 1, 1, 1, 1, 1,
0.4211836, 0.6161526, 1.214019, 1, 1, 1, 1, 1,
0.4236807, 0.4024339, 2.788909, 0, 0, 1, 1, 1,
0.426801, -0.464209, -0.6937434, 1, 0, 0, 1, 1,
0.4323591, -0.2421214, 1.555942, 1, 0, 0, 1, 1,
0.4324929, 0.6034291, -0.3717858, 1, 0, 0, 1, 1,
0.4361814, -0.3245531, 0.06065201, 1, 0, 0, 1, 1,
0.4420344, 0.182893, 0.1203113, 1, 0, 0, 1, 1,
0.443792, -0.9537688, 2.374552, 0, 0, 0, 1, 1,
0.4555682, 1.17979, -0.02439049, 0, 0, 0, 1, 1,
0.4561733, -1.343918, 1.893233, 0, 0, 0, 1, 1,
0.4633628, -0.6761392, 3.611953, 0, 0, 0, 1, 1,
0.4668472, -0.8441395, 1.170182, 0, 0, 0, 1, 1,
0.4724346, 1.465817, 0.9243745, 0, 0, 0, 1, 1,
0.4731468, -0.6303028, 2.388999, 0, 0, 0, 1, 1,
0.4890226, -0.518845, 3.363218, 1, 1, 1, 1, 1,
0.4891752, -0.6245078, 1.814588, 1, 1, 1, 1, 1,
0.4961266, -1.938043, 2.555417, 1, 1, 1, 1, 1,
0.4983344, -1.33254, 3.94653, 1, 1, 1, 1, 1,
0.4986798, -0.69718, 3.113826, 1, 1, 1, 1, 1,
0.4994779, 0.4484869, 2.540499, 1, 1, 1, 1, 1,
0.5015156, -0.416486, 2.977987, 1, 1, 1, 1, 1,
0.5018379, -0.3192753, 2.904964, 1, 1, 1, 1, 1,
0.5023776, 1.451269, 0.6680362, 1, 1, 1, 1, 1,
0.5084448, 0.2695661, -1.833261, 1, 1, 1, 1, 1,
0.5099641, 0.7658138, -0.4255793, 1, 1, 1, 1, 1,
0.5195493, -0.5639835, 2.658633, 1, 1, 1, 1, 1,
0.5213419, 0.2280858, 0.3499635, 1, 1, 1, 1, 1,
0.5226402, 0.3929701, 0.4380514, 1, 1, 1, 1, 1,
0.5230194, -0.5958434, 3.526432, 1, 1, 1, 1, 1,
0.5234544, -1.395145, 3.121342, 0, 0, 1, 1, 1,
0.5334098, -1.408458, 3.743737, 1, 0, 0, 1, 1,
0.5414764, 0.4682023, 0.8167828, 1, 0, 0, 1, 1,
0.5443952, -1.732563, 3.259467, 1, 0, 0, 1, 1,
0.5448816, -0.5007838, 1.596503, 1, 0, 0, 1, 1,
0.5465139, -0.5774101, 0.8466201, 1, 0, 0, 1, 1,
0.5468401, -0.6801216, 3.88441, 0, 0, 0, 1, 1,
0.5527217, -1.19131, 3.046056, 0, 0, 0, 1, 1,
0.5530168, 1.409371, 0.4218607, 0, 0, 0, 1, 1,
0.557809, 0.4155373, 0.9568134, 0, 0, 0, 1, 1,
0.558005, 0.2286027, 0.5439402, 0, 0, 0, 1, 1,
0.5613894, 0.1888762, 0.4259515, 0, 0, 0, 1, 1,
0.5634246, 0.7203313, 0.9853924, 0, 0, 0, 1, 1,
0.5702813, 0.6265087, 0.3399236, 1, 1, 1, 1, 1,
0.5713732, -1.311091, 2.099845, 1, 1, 1, 1, 1,
0.5714073, -0.5598343, 1.492131, 1, 1, 1, 1, 1,
0.5729456, -0.7936169, 2.606678, 1, 1, 1, 1, 1,
0.5729458, 0.1904481, 0.7932324, 1, 1, 1, 1, 1,
0.5752156, -0.470744, 2.949912, 1, 1, 1, 1, 1,
0.5754808, -0.267837, 3.893018, 1, 1, 1, 1, 1,
0.575619, 0.5565727, 0.5003591, 1, 1, 1, 1, 1,
0.5784141, -0.3864228, 3.6351, 1, 1, 1, 1, 1,
0.5787436, 0.202317, 0.9496633, 1, 1, 1, 1, 1,
0.5794051, 1.655497, -0.09320984, 1, 1, 1, 1, 1,
0.5806268, -1.786858, 2.228797, 1, 1, 1, 1, 1,
0.5821484, 0.7700266, 1.268238, 1, 1, 1, 1, 1,
0.5858891, -0.2954005, 2.684456, 1, 1, 1, 1, 1,
0.5905819, -0.2129463, 1.315089, 1, 1, 1, 1, 1,
0.5954265, 0.6631433, 0.2429564, 0, 0, 1, 1, 1,
0.5959345, 0.5087987, 0.4439274, 1, 0, 0, 1, 1,
0.599257, -0.7537034, 2.428357, 1, 0, 0, 1, 1,
0.6008539, 0.3125566, 1.675298, 1, 0, 0, 1, 1,
0.602199, 0.2965156, 0.6355493, 1, 0, 0, 1, 1,
0.6116756, 0.270777, 1.293076, 1, 0, 0, 1, 1,
0.6442056, 0.08078367, 1.496592, 0, 0, 0, 1, 1,
0.6468977, 0.5831445, 2.501126, 0, 0, 0, 1, 1,
0.647113, 1.883658, -0.1292033, 0, 0, 0, 1, 1,
0.6564158, -0.1418752, 3.592316, 0, 0, 0, 1, 1,
0.65825, -0.3755151, 1.294968, 0, 0, 0, 1, 1,
0.6649761, 1.454719, 0.4188732, 0, 0, 0, 1, 1,
0.6657536, 0.8504515, 0.122484, 0, 0, 0, 1, 1,
0.6684749, 0.5849122, -0.2234903, 1, 1, 1, 1, 1,
0.6693245, -0.361157, 0.5188894, 1, 1, 1, 1, 1,
0.6864154, -1.126646, 2.733582, 1, 1, 1, 1, 1,
0.6876292, 0.8779507, 0.9149748, 1, 1, 1, 1, 1,
0.6916128, 0.1365012, 1.866934, 1, 1, 1, 1, 1,
0.6922419, 2.007989, -0.07677412, 1, 1, 1, 1, 1,
0.6940523, 0.7605999, 0.01975626, 1, 1, 1, 1, 1,
0.6959975, -0.4883415, 4.003969, 1, 1, 1, 1, 1,
0.6999835, 0.4830014, 0.9691272, 1, 1, 1, 1, 1,
0.7001383, 1.900483, 0.7478809, 1, 1, 1, 1, 1,
0.7002434, 1.252389, 0.1563752, 1, 1, 1, 1, 1,
0.7010022, -1.002786, 2.99648, 1, 1, 1, 1, 1,
0.7097958, -0.3462316, 1.920219, 1, 1, 1, 1, 1,
0.710967, 1.428264, 1.304596, 1, 1, 1, 1, 1,
0.7131177, -0.5791143, 2.368856, 1, 1, 1, 1, 1,
0.7144623, -1.711027, 2.253664, 0, 0, 1, 1, 1,
0.7151524, 1.436161, 1.096945, 1, 0, 0, 1, 1,
0.7162561, 0.1911659, 1.497239, 1, 0, 0, 1, 1,
0.7174309, -1.330683, 2.776754, 1, 0, 0, 1, 1,
0.7178133, -0.8856818, 3.066542, 1, 0, 0, 1, 1,
0.7193871, 1.76838, 1.451688, 1, 0, 0, 1, 1,
0.7216358, -0.9183055, 1.566852, 0, 0, 0, 1, 1,
0.7220353, -0.1990895, 1.267511, 0, 0, 0, 1, 1,
0.7223737, -0.4405811, 2.994061, 0, 0, 0, 1, 1,
0.7243636, 1.486832, 0.2573062, 0, 0, 0, 1, 1,
0.7279457, 1.639167, 1.022787, 0, 0, 0, 1, 1,
0.7289397, 0.1138437, 2.407513, 0, 0, 0, 1, 1,
0.731576, 1.01981, 0.3067615, 0, 0, 0, 1, 1,
0.7344925, 0.4519914, 1.988585, 1, 1, 1, 1, 1,
0.7370654, 0.414498, -1.265034, 1, 1, 1, 1, 1,
0.7375251, -0.3762458, 2.975868, 1, 1, 1, 1, 1,
0.738984, 2.115897, 0.3478715, 1, 1, 1, 1, 1,
0.7390301, 1.211337, 0.5003647, 1, 1, 1, 1, 1,
0.7391264, -0.02604976, -0.3753438, 1, 1, 1, 1, 1,
0.7401257, -0.7663817, -0.2663363, 1, 1, 1, 1, 1,
0.7416193, -0.7181389, 1.163708, 1, 1, 1, 1, 1,
0.7458256, 0.5475505, -0.4144143, 1, 1, 1, 1, 1,
0.7469518, -0.176216, 0.2879196, 1, 1, 1, 1, 1,
0.7494717, -0.3453399, 2.380871, 1, 1, 1, 1, 1,
0.750746, -0.6214061, 1.453573, 1, 1, 1, 1, 1,
0.7549558, -1.09599, 2.310086, 1, 1, 1, 1, 1,
0.7583508, -0.6533954, 0.8138406, 1, 1, 1, 1, 1,
0.7605608, 0.5545151, 2.713515, 1, 1, 1, 1, 1,
0.7708979, 0.2893374, 2.346366, 0, 0, 1, 1, 1,
0.7719812, 0.6760439, 0.6060764, 1, 0, 0, 1, 1,
0.7751372, 2.303142, 0.8675749, 1, 0, 0, 1, 1,
0.7757793, 1.702105, 0.06140331, 1, 0, 0, 1, 1,
0.7769853, -0.40082, 0.1213688, 1, 0, 0, 1, 1,
0.780192, 1.296928, 0.4247667, 1, 0, 0, 1, 1,
0.7817745, 0.2301605, 1.166342, 0, 0, 0, 1, 1,
0.7826316, 0.1827657, 1.127276, 0, 0, 0, 1, 1,
0.7905217, -0.4145847, 2.703609, 0, 0, 0, 1, 1,
0.7933494, 0.02871312, 2.547733, 0, 0, 0, 1, 1,
0.8155532, 0.4866279, 0.4716696, 0, 0, 0, 1, 1,
0.8187516, -1.107712, 1.534704, 0, 0, 0, 1, 1,
0.8230547, 1.431159, 1.968877, 0, 0, 0, 1, 1,
0.8251613, 0.1707487, 2.292292, 1, 1, 1, 1, 1,
0.826006, -0.6375161, 0.5666219, 1, 1, 1, 1, 1,
0.8300925, -0.6083063, 3.021149, 1, 1, 1, 1, 1,
0.8330339, -0.6736859, 0.1824997, 1, 1, 1, 1, 1,
0.8413385, 0.9777322, 1.199201, 1, 1, 1, 1, 1,
0.8416255, 1.769919, -0.0693726, 1, 1, 1, 1, 1,
0.8452871, -0.1504906, 0.9584492, 1, 1, 1, 1, 1,
0.8461044, 0.8679179, -0.8793855, 1, 1, 1, 1, 1,
0.8525102, 1.190886, 1.972603, 1, 1, 1, 1, 1,
0.8634232, -3.233867, 3.58579, 1, 1, 1, 1, 1,
0.8695701, 0.9755731, 1.796594, 1, 1, 1, 1, 1,
0.8772976, -0.5356867, 2.332351, 1, 1, 1, 1, 1,
0.8811091, -0.7644477, 1.839125, 1, 1, 1, 1, 1,
0.8866383, -0.8889895, 1.6791, 1, 1, 1, 1, 1,
0.8978824, -0.2650414, 2.760112, 1, 1, 1, 1, 1,
0.8994963, -0.7332682, 1.505727, 0, 0, 1, 1, 1,
0.9019173, 0.6680986, 0.5227977, 1, 0, 0, 1, 1,
0.9055725, -1.358655, 2.53441, 1, 0, 0, 1, 1,
0.9109837, -0.7055494, 2.492731, 1, 0, 0, 1, 1,
0.9113463, 0.2652612, 0.1807215, 1, 0, 0, 1, 1,
0.9114323, 0.1077946, 1.91858, 1, 0, 0, 1, 1,
0.9179317, 0.5844155, 1.10713, 0, 0, 0, 1, 1,
0.920797, -0.08164589, 2.616575, 0, 0, 0, 1, 1,
0.9211522, 0.3219164, 1.974864, 0, 0, 0, 1, 1,
0.9217896, 1.301707, 1.500687, 0, 0, 0, 1, 1,
0.9252954, -0.4552601, 3.341279, 0, 0, 0, 1, 1,
0.944795, -1.319713, 2.454546, 0, 0, 0, 1, 1,
0.948709, 0.6867425, 0.2594889, 0, 0, 0, 1, 1,
0.9554576, 2.378594, 0.6013961, 1, 1, 1, 1, 1,
0.9554836, 1.143696, -1.054289, 1, 1, 1, 1, 1,
0.9632203, 0.1306195, 1.167638, 1, 1, 1, 1, 1,
0.9642171, 0.5447965, 0.6444977, 1, 1, 1, 1, 1,
0.9672486, -1.173635, 3.973749, 1, 1, 1, 1, 1,
0.9686586, -0.4422581, 3.734889, 1, 1, 1, 1, 1,
0.978009, -0.1374926, 0.9327176, 1, 1, 1, 1, 1,
0.9786929, 0.6680859, 0.4436951, 1, 1, 1, 1, 1,
0.979833, -0.5248153, 2.063475, 1, 1, 1, 1, 1,
0.9927506, 1.84452, 1.740532, 1, 1, 1, 1, 1,
0.9991293, -0.07964209, 1.722005, 1, 1, 1, 1, 1,
0.9997441, -0.2358911, 1.285669, 1, 1, 1, 1, 1,
1.000766, -0.4099894, 1.852636, 1, 1, 1, 1, 1,
1.007668, -1.320257, 0.6305144, 1, 1, 1, 1, 1,
1.011438, 0.6251564, -0.2250986, 1, 1, 1, 1, 1,
1.015069, 1.732913, 0.9807805, 0, 0, 1, 1, 1,
1.022955, 1.212109, -1.251882, 1, 0, 0, 1, 1,
1.035862, 1.368921, -0.798288, 1, 0, 0, 1, 1,
1.035971, 1.322685, -0.9491062, 1, 0, 0, 1, 1,
1.038348, 0.7859344, 1.221905, 1, 0, 0, 1, 1,
1.042156, -0.9741935, 1.820847, 1, 0, 0, 1, 1,
1.042302, 1.259155, -0.2772295, 0, 0, 0, 1, 1,
1.044468, -1.153664, 3.454317, 0, 0, 0, 1, 1,
1.046112, -1.211752, 1.063272, 0, 0, 0, 1, 1,
1.046481, -1.675545, 2.813758, 0, 0, 0, 1, 1,
1.051872, 0.3901131, 0.9149888, 0, 0, 0, 1, 1,
1.052188, 0.00862854, 0.7595789, 0, 0, 0, 1, 1,
1.055162, 0.2137045, 1.279516, 0, 0, 0, 1, 1,
1.055997, 1.260604, -0.1231351, 1, 1, 1, 1, 1,
1.071172, -1.326791, 2.978517, 1, 1, 1, 1, 1,
1.071324, 0.4395843, 1.059343, 1, 1, 1, 1, 1,
1.078342, -0.5944975, 1.86607, 1, 1, 1, 1, 1,
1.08065, 1.034131, 0.7027296, 1, 1, 1, 1, 1,
1.08285, 0.7264305, 0.5674587, 1, 1, 1, 1, 1,
1.084518, 0.9103259, 1.972496, 1, 1, 1, 1, 1,
1.09938, 2.343101, 0.4460843, 1, 1, 1, 1, 1,
1.104905, 1.763081, 0.6049011, 1, 1, 1, 1, 1,
1.105322, -0.4277129, 2.580969, 1, 1, 1, 1, 1,
1.114503, -1.049035, 1.683127, 1, 1, 1, 1, 1,
1.115309, 1.800294, 0.000799209, 1, 1, 1, 1, 1,
1.124095, -1.484723, 3.030491, 1, 1, 1, 1, 1,
1.131286, 1.699721, -0.1205976, 1, 1, 1, 1, 1,
1.134133, -0.8914748, 2.128196, 1, 1, 1, 1, 1,
1.135316, -1.077621, 1.822708, 0, 0, 1, 1, 1,
1.135649, -0.5218473, 1.466509, 1, 0, 0, 1, 1,
1.135801, 1.151121, 1.658668, 1, 0, 0, 1, 1,
1.141927, 2.381832, 0.328178, 1, 0, 0, 1, 1,
1.147656, -0.6955581, 1.11753, 1, 0, 0, 1, 1,
1.151598, -0.2962359, 0.9945984, 1, 0, 0, 1, 1,
1.15203, 1.059669, 1.874874, 0, 0, 0, 1, 1,
1.154447, -0.1942566, 1.232033, 0, 0, 0, 1, 1,
1.154906, -0.5678971, 4.067054, 0, 0, 0, 1, 1,
1.161146, 0.6147584, -0.273402, 0, 0, 0, 1, 1,
1.162823, 0.07313838, 0.7767038, 0, 0, 0, 1, 1,
1.16439, -0.2444784, 1.112191, 0, 0, 0, 1, 1,
1.169212, -0.3530923, 1.453061, 0, 0, 0, 1, 1,
1.171091, -0.3320712, 0.02474401, 1, 1, 1, 1, 1,
1.183215, 0.6390527, 0.4756874, 1, 1, 1, 1, 1,
1.194167, 0.5003319, 0.9128315, 1, 1, 1, 1, 1,
1.194177, 0.7083556, -0.4807995, 1, 1, 1, 1, 1,
1.194612, 0.5845604, -1.336278, 1, 1, 1, 1, 1,
1.197817, -0.2882865, 1.013433, 1, 1, 1, 1, 1,
1.198349, 1.098226, 0.07940339, 1, 1, 1, 1, 1,
1.198995, -0.2401403, 2.050478, 1, 1, 1, 1, 1,
1.202378, 0.8141286, 1.265098, 1, 1, 1, 1, 1,
1.203253, 0.819509, 1.074816, 1, 1, 1, 1, 1,
1.208255, -0.5689911, 2.684125, 1, 1, 1, 1, 1,
1.214854, -1.578738, 2.711238, 1, 1, 1, 1, 1,
1.21731, -1.95085, 2.186868, 1, 1, 1, 1, 1,
1.224644, -0.6845654, 1.726657, 1, 1, 1, 1, 1,
1.229442, -0.1495438, 0.3401968, 1, 1, 1, 1, 1,
1.230946, 2.305607, 1.204141, 0, 0, 1, 1, 1,
1.23665, -0.8613752, 2.452869, 1, 0, 0, 1, 1,
1.243279, -1.253887, 1.649002, 1, 0, 0, 1, 1,
1.246003, 0.1069419, 2.2541, 1, 0, 0, 1, 1,
1.248224, -2.277738, 5.012095, 1, 0, 0, 1, 1,
1.250369, -0.1768154, 2.046214, 1, 0, 0, 1, 1,
1.2517, 0.3767507, -1.519335, 0, 0, 0, 1, 1,
1.254343, -1.47317, 1.906915, 0, 0, 0, 1, 1,
1.264057, 0.7155057, 0.1641037, 0, 0, 0, 1, 1,
1.280867, 1.434197, 1.757753, 0, 0, 0, 1, 1,
1.281782, 1.263663, -0.3101847, 0, 0, 0, 1, 1,
1.284196, -0.6036988, 2.52108, 0, 0, 0, 1, 1,
1.292201, -0.7231581, 3.002367, 0, 0, 0, 1, 1,
1.297399, -2.671573, 0.511279, 1, 1, 1, 1, 1,
1.298579, -0.1740973, 1.209413, 1, 1, 1, 1, 1,
1.299538, 0.02740402, 0.9277323, 1, 1, 1, 1, 1,
1.311253, 1.499608, 1.158681, 1, 1, 1, 1, 1,
1.314491, -1.246821, 2.312505, 1, 1, 1, 1, 1,
1.320365, -0.3232383, 1.791649, 1, 1, 1, 1, 1,
1.338802, 1.802304, -0.3208976, 1, 1, 1, 1, 1,
1.340853, -1.190236, 2.312308, 1, 1, 1, 1, 1,
1.347345, -0.3651229, 1.985499, 1, 1, 1, 1, 1,
1.366171, -0.3788313, 1.650376, 1, 1, 1, 1, 1,
1.3665, -0.6756617, 3.162858, 1, 1, 1, 1, 1,
1.373677, -1.074874, 3.532725, 1, 1, 1, 1, 1,
1.37641, 2.493917, 0.8268851, 1, 1, 1, 1, 1,
1.380408, 1.735527, 2.185725, 1, 1, 1, 1, 1,
1.392032, 0.2588088, 1.188383, 1, 1, 1, 1, 1,
1.409274, 0.4101844, -0.2234087, 0, 0, 1, 1, 1,
1.414575, 0.7958631, 1.051895, 1, 0, 0, 1, 1,
1.430653, -1.161638, 1.134159, 1, 0, 0, 1, 1,
1.432618, 0.3076558, 0.1037452, 1, 0, 0, 1, 1,
1.437913, 0.5313905, -0.8746295, 1, 0, 0, 1, 1,
1.438974, 1.499261, 0.5749601, 1, 0, 0, 1, 1,
1.445801, 1.175041, 0.5765074, 0, 0, 0, 1, 1,
1.45911, 0.2202861, 3.586756, 0, 0, 0, 1, 1,
1.459723, 2.8439, 1.697828, 0, 0, 0, 1, 1,
1.483536, -0.1153504, 1.626297, 0, 0, 0, 1, 1,
1.493401, 0.3165786, 0.424933, 0, 0, 0, 1, 1,
1.503538, 1.194674, 1.37896, 0, 0, 0, 1, 1,
1.525335, 0.3979072, 0.127595, 0, 0, 0, 1, 1,
1.526732, -0.9053945, 3.067273, 1, 1, 1, 1, 1,
1.532578, 0.5750222, 0.07647247, 1, 1, 1, 1, 1,
1.536139, -0.103563, 3.372429, 1, 1, 1, 1, 1,
1.542033, -0.327461, 0.899978, 1, 1, 1, 1, 1,
1.551211, -0.5075805, 2.228813, 1, 1, 1, 1, 1,
1.552899, -0.1173994, 3.268626, 1, 1, 1, 1, 1,
1.55703, -0.8499788, 0.314854, 1, 1, 1, 1, 1,
1.621614, 0.5374424, -1.619061, 1, 1, 1, 1, 1,
1.626969, 0.2058512, 0.8058939, 1, 1, 1, 1, 1,
1.637018, 0.8146415, 0.04246033, 1, 1, 1, 1, 1,
1.654558, -1.846702, 2.992645, 1, 1, 1, 1, 1,
1.670097, -1.023498, 4.37341, 1, 1, 1, 1, 1,
1.670156, -1.216619, 1.535451, 1, 1, 1, 1, 1,
1.67597, -0.08818006, 2.614275, 1, 1, 1, 1, 1,
1.682507, 0.8996171, 0.4741531, 1, 1, 1, 1, 1,
1.694647, -2.459813, 1.521832, 0, 0, 1, 1, 1,
1.698144, -0.6390306, 3.86662, 1, 0, 0, 1, 1,
1.71234, -1.836265, 1.317378, 1, 0, 0, 1, 1,
1.729477, -0.3204476, 1.424005, 1, 0, 0, 1, 1,
1.745871, -1.460779, 2.5696, 1, 0, 0, 1, 1,
1.763612, 0.541087, 0.5475501, 1, 0, 0, 1, 1,
1.775599, 0.3142371, 2.706899, 0, 0, 0, 1, 1,
1.797287, -1.374375, 3.437507, 0, 0, 0, 1, 1,
1.813959, -1.388346, 2.175786, 0, 0, 0, 1, 1,
1.82241, -0.6925672, 1.720964, 0, 0, 0, 1, 1,
1.852529, -0.4354045, 2.382259, 0, 0, 0, 1, 1,
1.857473, 0.07714222, 2.12581, 0, 0, 0, 1, 1,
1.861605, -0.3248228, 2.966058, 0, 0, 0, 1, 1,
1.882726, -0.06920721, 2.72015, 1, 1, 1, 1, 1,
1.889275, -1.928051, 2.153058, 1, 1, 1, 1, 1,
1.910851, 0.84951, 1.796313, 1, 1, 1, 1, 1,
1.916668, -0.2714641, 1.294481, 1, 1, 1, 1, 1,
1.9411, -1.839103, 5.009621, 1, 1, 1, 1, 1,
1.942859, -0.2730477, 1.794912, 1, 1, 1, 1, 1,
1.953322, 2.907803, 1.294585, 1, 1, 1, 1, 1,
1.956838, 1.874036, 2.32158, 1, 1, 1, 1, 1,
1.972369, -0.01465854, 0.04867397, 1, 1, 1, 1, 1,
1.986741, -0.697511, -0.3498811, 1, 1, 1, 1, 1,
1.996475, 0.2234968, 0.9456231, 1, 1, 1, 1, 1,
1.996666, -1.001645, 2.117535, 1, 1, 1, 1, 1,
2.024176, 0.819392, 0.5232369, 1, 1, 1, 1, 1,
2.049618, 0.1856516, 0.7508737, 1, 1, 1, 1, 1,
2.076537, -0.7051196, 0.8561667, 1, 1, 1, 1, 1,
2.095354, 0.9852006, 2.101042, 0, 0, 1, 1, 1,
2.104911, 1.458395, 1.461516, 1, 0, 0, 1, 1,
2.107262, -0.1874286, 0.4816283, 1, 0, 0, 1, 1,
2.158507, -1.36196, 1.794155, 1, 0, 0, 1, 1,
2.160229, 1.409903, 0.3185054, 1, 0, 0, 1, 1,
2.209079, -0.7022903, 3.712932, 1, 0, 0, 1, 1,
2.223564, 1.160378, 1.112323, 0, 0, 0, 1, 1,
2.268581, -0.8574909, 0.4622976, 0, 0, 0, 1, 1,
2.348419, 0.3971242, 2.820612, 0, 0, 0, 1, 1,
2.352486, 0.1997046, 1.962863, 0, 0, 0, 1, 1,
2.359883, -2.684061, 2.27577, 0, 0, 0, 1, 1,
2.380334, 0.9880884, 0.7741167, 0, 0, 0, 1, 1,
2.395542, 1.397753, 0.7873342, 0, 0, 0, 1, 1,
2.398201, -0.4689104, 1.040736, 1, 1, 1, 1, 1,
2.476977, -0.3386535, 0.1581063, 1, 1, 1, 1, 1,
2.523508, -1.808687, 3.204664, 1, 1, 1, 1, 1,
2.694015, -0.4495901, -0.7217268, 1, 1, 1, 1, 1,
2.938569, -0.7947609, 2.353019, 1, 1, 1, 1, 1,
3.130891, -0.5798186, 1.69619, 1, 1, 1, 1, 1,
3.869765, -0.1261809, 1.287837, 1, 1, 1, 1, 1
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
var radius = 9.50352;
var distance = 33.38071;
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
mvMatrix.translate( -0.1763346, 0.1630318, -0.008590221 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.38071);
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
