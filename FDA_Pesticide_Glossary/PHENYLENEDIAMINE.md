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
-3.137986, 0.2132914, -2.990979, 1, 0, 0, 1,
-2.878238, -0.2045636, -1.977569, 1, 0.007843138, 0, 1,
-2.685277, -1.592169, -3.009102, 1, 0.01176471, 0, 1,
-2.657649, -0.4257789, -0.8591976, 1, 0.01960784, 0, 1,
-2.618086, -0.6128535, -0.6638344, 1, 0.02352941, 0, 1,
-2.611193, 0.2084679, -3.102387, 1, 0.03137255, 0, 1,
-2.474082, 1.110102, 1.407475, 1, 0.03529412, 0, 1,
-2.401759, -1.770921, -1.872762, 1, 0.04313726, 0, 1,
-2.385123, 0.9732676, -2.357069, 1, 0.04705882, 0, 1,
-2.373105, -1.201331, -2.746061, 1, 0.05490196, 0, 1,
-2.36647, 1.088656, -1.327221, 1, 0.05882353, 0, 1,
-2.331573, -1.464755, -1.27788, 1, 0.06666667, 0, 1,
-2.315916, 1.637635, -2.599977, 1, 0.07058824, 0, 1,
-2.294502, 0.2158554, -1.440554, 1, 0.07843138, 0, 1,
-2.273584, -0.4225682, -1.895331, 1, 0.08235294, 0, 1,
-2.269641, -0.783181, 0.0520199, 1, 0.09019608, 0, 1,
-2.265253, -0.3374055, 0.8875881, 1, 0.09411765, 0, 1,
-2.248496, 1.299684, -0.8088439, 1, 0.1019608, 0, 1,
-2.135409, -0.8710279, -0.9783009, 1, 0.1098039, 0, 1,
-2.122802, -1.712129, -1.692277, 1, 0.1137255, 0, 1,
-2.122211, 2.380901, -1.72085, 1, 0.1215686, 0, 1,
-2.098483, -0.1723956, -3.173709, 1, 0.1254902, 0, 1,
-2.085912, -0.003262625, -2.316844, 1, 0.1333333, 0, 1,
-2.062886, -1.345407, -0.1524498, 1, 0.1372549, 0, 1,
-2.052096, -1.978725, -0.2467782, 1, 0.145098, 0, 1,
-2.008118, 1.136703, -0.1375493, 1, 0.1490196, 0, 1,
-1.98913, -0.8314003, -3.212907, 1, 0.1568628, 0, 1,
-1.988164, 0.205628, -1.94847, 1, 0.1607843, 0, 1,
-1.915483, 1.643025, -1.001915, 1, 0.1686275, 0, 1,
-1.897737, -0.9506679, -1.565884, 1, 0.172549, 0, 1,
-1.893176, 1.655079, -0.2929803, 1, 0.1803922, 0, 1,
-1.889839, -0.6146518, -1.980146, 1, 0.1843137, 0, 1,
-1.885412, 0.3413708, -1.1139, 1, 0.1921569, 0, 1,
-1.885205, -0.8542263, -2.857825, 1, 0.1960784, 0, 1,
-1.879991, 2.805516, -1.180362, 1, 0.2039216, 0, 1,
-1.844923, -1.38321, -3.241712, 1, 0.2117647, 0, 1,
-1.843808, -1.11033, -2.183434, 1, 0.2156863, 0, 1,
-1.831663, 0.2962402, -2.477519, 1, 0.2235294, 0, 1,
-1.831101, 0.08529544, 0.0545145, 1, 0.227451, 0, 1,
-1.830754, 1.134874, 0.4564515, 1, 0.2352941, 0, 1,
-1.829495, -0.9519522, -2.311101, 1, 0.2392157, 0, 1,
-1.822166, -0.2101877, -3.360872, 1, 0.2470588, 0, 1,
-1.794224, -0.4235356, -0.534067, 1, 0.2509804, 0, 1,
-1.787143, -0.4108475, -3.529306, 1, 0.2588235, 0, 1,
-1.772514, 0.1176834, -1.838462, 1, 0.2627451, 0, 1,
-1.769048, -0.1128983, -1.00237, 1, 0.2705882, 0, 1,
-1.767661, -1.700743, -3.047078, 1, 0.2745098, 0, 1,
-1.758349, 0.7022184, -1.103208, 1, 0.282353, 0, 1,
-1.742937, 1.415061, -1.05312, 1, 0.2862745, 0, 1,
-1.735767, 3.089534, 0.2218011, 1, 0.2941177, 0, 1,
-1.735649, 0.9046939, -1.035529, 1, 0.3019608, 0, 1,
-1.735089, -0.0001832453, -2.604674, 1, 0.3058824, 0, 1,
-1.715622, 0.1508376, -2.123537, 1, 0.3137255, 0, 1,
-1.707062, -0.4855317, -2.031875, 1, 0.3176471, 0, 1,
-1.706502, 0.004439224, -0.2384792, 1, 0.3254902, 0, 1,
-1.702831, -0.1631691, -2.56846, 1, 0.3294118, 0, 1,
-1.685731, 0.5073493, -0.8812608, 1, 0.3372549, 0, 1,
-1.68078, 1.320586, -1.472637, 1, 0.3411765, 0, 1,
-1.670549, -1.97113, -3.593583, 1, 0.3490196, 0, 1,
-1.66526, -0.8580654, -3.325929, 1, 0.3529412, 0, 1,
-1.658309, 0.3345622, -1.401375, 1, 0.3607843, 0, 1,
-1.654322, 0.06425286, -0.469415, 1, 0.3647059, 0, 1,
-1.623835, -0.5377551, -0.2172148, 1, 0.372549, 0, 1,
-1.607391, -1.017265, -1.475691, 1, 0.3764706, 0, 1,
-1.589394, 0.5492684, -2.920236, 1, 0.3843137, 0, 1,
-1.5884, -1.070198, -3.030364, 1, 0.3882353, 0, 1,
-1.585994, 0.7418357, -1.110756, 1, 0.3960784, 0, 1,
-1.585117, 0.3705864, -0.1272886, 1, 0.4039216, 0, 1,
-1.581454, -0.1295575, -3.047132, 1, 0.4078431, 0, 1,
-1.566574, -1.522807, -3.206119, 1, 0.4156863, 0, 1,
-1.550217, -0.1938494, -1.810082, 1, 0.4196078, 0, 1,
-1.539443, 2.222599, 0.3594292, 1, 0.427451, 0, 1,
-1.539075, -0.8121764, -1.081786, 1, 0.4313726, 0, 1,
-1.534393, -1.563204, -2.652833, 1, 0.4392157, 0, 1,
-1.534392, 1.457987, -2.202651, 1, 0.4431373, 0, 1,
-1.528013, -0.4582852, -0.4823263, 1, 0.4509804, 0, 1,
-1.512693, 1.170127, 0.3593144, 1, 0.454902, 0, 1,
-1.506274, 0.5632914, -1.083724, 1, 0.4627451, 0, 1,
-1.498754, -0.7469127, -2.250458, 1, 0.4666667, 0, 1,
-1.49729, -0.5032153, -0.3578826, 1, 0.4745098, 0, 1,
-1.495335, 1.207604, -0.02820833, 1, 0.4784314, 0, 1,
-1.470535, 0.5772145, -2.073585, 1, 0.4862745, 0, 1,
-1.466598, -0.5737586, -4.357762, 1, 0.4901961, 0, 1,
-1.465286, 0.5939011, 0.5901799, 1, 0.4980392, 0, 1,
-1.46469, -1.019902, -2.064177, 1, 0.5058824, 0, 1,
-1.452353, -0.02849277, -2.383525, 1, 0.509804, 0, 1,
-1.447658, -0.8952366, -2.013, 1, 0.5176471, 0, 1,
-1.442823, 0.2102377, 0.9308877, 1, 0.5215687, 0, 1,
-1.436375, -1.124945, -0.3158019, 1, 0.5294118, 0, 1,
-1.419601, 0.7059588, -1.674746, 1, 0.5333334, 0, 1,
-1.393256, 2.141488, -1.192488, 1, 0.5411765, 0, 1,
-1.385012, 0.722661, -0.2846939, 1, 0.5450981, 0, 1,
-1.384618, 0.5742807, -1.664894, 1, 0.5529412, 0, 1,
-1.383014, -1.025771, -1.664931, 1, 0.5568628, 0, 1,
-1.377285, -1.530973, -3.81364, 1, 0.5647059, 0, 1,
-1.376831, -0.6268076, -2.3629, 1, 0.5686275, 0, 1,
-1.373526, 0.7392012, -0.2154819, 1, 0.5764706, 0, 1,
-1.365822, -0.3954158, -1.164458, 1, 0.5803922, 0, 1,
-1.363664, -0.008375796, -1.714719, 1, 0.5882353, 0, 1,
-1.359385, 0.2540915, -1.790866, 1, 0.5921569, 0, 1,
-1.345107, -1.135914, -2.208035, 1, 0.6, 0, 1,
-1.34209, 0.759805, 0.8322035, 1, 0.6078432, 0, 1,
-1.34208, 0.09674399, -1.835292, 1, 0.6117647, 0, 1,
-1.338287, -0.6603875, -1.600259, 1, 0.6196079, 0, 1,
-1.332855, -0.6456817, -3.488077, 1, 0.6235294, 0, 1,
-1.326214, 0.6493718, -2.078588, 1, 0.6313726, 0, 1,
-1.324516, -0.4545339, -1.601544, 1, 0.6352941, 0, 1,
-1.322559, 0.400839, -2.720569, 1, 0.6431373, 0, 1,
-1.317206, -1.4579, -1.19316, 1, 0.6470588, 0, 1,
-1.314227, -0.918065, -3.007679, 1, 0.654902, 0, 1,
-1.312934, -1.672789, -1.786856, 1, 0.6588235, 0, 1,
-1.308014, -1.760335, -2.349672, 1, 0.6666667, 0, 1,
-1.301827, -0.9048035, -1.33931, 1, 0.6705883, 0, 1,
-1.288011, -0.3107345, 0.05887362, 1, 0.6784314, 0, 1,
-1.284204, 0.4868768, -0.5949517, 1, 0.682353, 0, 1,
-1.278322, 1.419888, 0.9646378, 1, 0.6901961, 0, 1,
-1.267506, 0.1673035, -1.181119, 1, 0.6941177, 0, 1,
-1.265499, -0.4562594, -3.040679, 1, 0.7019608, 0, 1,
-1.263983, -0.1083406, -0.8698344, 1, 0.7098039, 0, 1,
-1.255743, -0.7466636, -3.385541, 1, 0.7137255, 0, 1,
-1.254357, -1.795827, -0.3048391, 1, 0.7215686, 0, 1,
-1.24744, -1.908457, -1.562952, 1, 0.7254902, 0, 1,
-1.232667, -0.1291421, -1.900715, 1, 0.7333333, 0, 1,
-1.223169, 0.7260852, 0.04863425, 1, 0.7372549, 0, 1,
-1.209232, -2.23192, -2.969519, 1, 0.7450981, 0, 1,
-1.203024, 0.390259, -0.8616984, 1, 0.7490196, 0, 1,
-1.2012, 0.6711296, -1.024641, 1, 0.7568628, 0, 1,
-1.200229, 0.5136682, -2.497079, 1, 0.7607843, 0, 1,
-1.197823, 1.641756, 0.8673577, 1, 0.7686275, 0, 1,
-1.196203, -1.620328, -2.596496, 1, 0.772549, 0, 1,
-1.196119, -0.7904406, -4.545223, 1, 0.7803922, 0, 1,
-1.192553, 0.7168052, -0.3963202, 1, 0.7843137, 0, 1,
-1.190726, 0.7723289, -1.03774, 1, 0.7921569, 0, 1,
-1.186471, -0.2181477, -1.142601, 1, 0.7960784, 0, 1,
-1.184379, -0.9538289, -2.88638, 1, 0.8039216, 0, 1,
-1.183604, -0.364352, -0.641465, 1, 0.8117647, 0, 1,
-1.17324, 0.03850475, -0.6374388, 1, 0.8156863, 0, 1,
-1.173103, 1.060497, -0.08713547, 1, 0.8235294, 0, 1,
-1.166014, -1.265765, -3.217721, 1, 0.827451, 0, 1,
-1.165082, -0.6976889, -0.8520723, 1, 0.8352941, 0, 1,
-1.15894, 0.6136131, -2.042307, 1, 0.8392157, 0, 1,
-1.157937, 0.7678935, -2.069811, 1, 0.8470588, 0, 1,
-1.156047, -1.574036, -1.39151, 1, 0.8509804, 0, 1,
-1.149694, 1.678014, -1.530305, 1, 0.8588235, 0, 1,
-1.144538, 1.113278, 0.9266801, 1, 0.8627451, 0, 1,
-1.143517, 1.063137, 0.5191931, 1, 0.8705882, 0, 1,
-1.138643, -0.05294325, -2.227988, 1, 0.8745098, 0, 1,
-1.134322, 0.9036393, -1.390778, 1, 0.8823529, 0, 1,
-1.125129, 0.6938843, -0.670404, 1, 0.8862745, 0, 1,
-1.124005, -1.3582, -3.017654, 1, 0.8941177, 0, 1,
-1.123548, 1.975055, -0.9613173, 1, 0.8980392, 0, 1,
-1.122024, -0.7592461, -2.081376, 1, 0.9058824, 0, 1,
-1.119329, 0.277568, -3.084836, 1, 0.9137255, 0, 1,
-1.118668, -0.4969992, -2.130388, 1, 0.9176471, 0, 1,
-1.117378, 0.9113653, -2.226472, 1, 0.9254902, 0, 1,
-1.11312, -0.5258586, -1.366794, 1, 0.9294118, 0, 1,
-1.100599, -0.7730228, -2.204135, 1, 0.9372549, 0, 1,
-1.092119, -1.530307, -3.015097, 1, 0.9411765, 0, 1,
-1.081398, -2.161934, -3.172746, 1, 0.9490196, 0, 1,
-1.077521, -0.4847121, -2.342229, 1, 0.9529412, 0, 1,
-1.070687, -0.3024507, -0.5412093, 1, 0.9607843, 0, 1,
-1.069068, 1.899704, 1.800971, 1, 0.9647059, 0, 1,
-1.063211, -0.4401148, -2.543992, 1, 0.972549, 0, 1,
-1.061357, -0.4675829, -2.077483, 1, 0.9764706, 0, 1,
-1.060691, -2.075089, -1.406073, 1, 0.9843137, 0, 1,
-1.057558, 0.08575093, -0.09488805, 1, 0.9882353, 0, 1,
-1.05482, 0.9267503, -1.80898, 1, 0.9960784, 0, 1,
-1.048198, 0.4544391, -2.059078, 0.9960784, 1, 0, 1,
-1.046361, 0.2155754, -2.421845, 0.9921569, 1, 0, 1,
-1.038295, 0.472983, -0.89509, 0.9843137, 1, 0, 1,
-1.036175, 0.7332529, -1.130843, 0.9803922, 1, 0, 1,
-1.030443, -1.001288, -0.598341, 0.972549, 1, 0, 1,
-1.021591, -0.4441107, -1.019126, 0.9686275, 1, 0, 1,
-1.014131, -0.3440414, -2.40065, 0.9607843, 1, 0, 1,
-1.010283, 0.04560686, -1.273809, 0.9568627, 1, 0, 1,
-1.009306, -0.4057147, -2.902161, 0.9490196, 1, 0, 1,
-1.003499, -0.7745439, -1.588264, 0.945098, 1, 0, 1,
-0.9962087, 1.477088, -0.9811398, 0.9372549, 1, 0, 1,
-0.9943582, -0.7001027, -2.206125, 0.9333333, 1, 0, 1,
-0.991766, -0.0986465, -1.568881, 0.9254902, 1, 0, 1,
-0.9834676, -0.6616399, -0.5700623, 0.9215686, 1, 0, 1,
-0.9770579, 0.7041274, -1.628381, 0.9137255, 1, 0, 1,
-0.95876, 0.5909427, -2.049682, 0.9098039, 1, 0, 1,
-0.9577581, -1.575795, -1.823163, 0.9019608, 1, 0, 1,
-0.9571001, -2.248351, -3.055654, 0.8941177, 1, 0, 1,
-0.9554906, 0.5612831, -1.451309, 0.8901961, 1, 0, 1,
-0.9538012, 0.7442099, -1.228828, 0.8823529, 1, 0, 1,
-0.947987, 2.124685, -0.4737037, 0.8784314, 1, 0, 1,
-0.9430661, 0.1755481, -1.211633, 0.8705882, 1, 0, 1,
-0.9419377, 1.16954, -2.379961, 0.8666667, 1, 0, 1,
-0.9368809, 0.4227117, -3.105099, 0.8588235, 1, 0, 1,
-0.9337518, 1.276201, -0.4331304, 0.854902, 1, 0, 1,
-0.9329328, -1.525011, -2.21498, 0.8470588, 1, 0, 1,
-0.9210733, -1.376435, -2.851118, 0.8431373, 1, 0, 1,
-0.9173496, 0.6140455, -0.9923328, 0.8352941, 1, 0, 1,
-0.9160548, -0.2145467, -1.939241, 0.8313726, 1, 0, 1,
-0.9157547, 0.7671859, 0.4486592, 0.8235294, 1, 0, 1,
-0.9148756, 0.01226375, -1.404094, 0.8196079, 1, 0, 1,
-0.9136679, 0.7297235, -1.118475, 0.8117647, 1, 0, 1,
-0.9094909, 1.475909, -0.5437725, 0.8078431, 1, 0, 1,
-0.9080907, -2.325784, -2.75596, 0.8, 1, 0, 1,
-0.8929211, 1.091575, -1.745017, 0.7921569, 1, 0, 1,
-0.8927578, 0.3306656, -2.777274, 0.7882353, 1, 0, 1,
-0.8868417, -1.091704, -1.882404, 0.7803922, 1, 0, 1,
-0.8865759, -0.5691411, -2.283043, 0.7764706, 1, 0, 1,
-0.8853893, 2.198066, -0.9439769, 0.7686275, 1, 0, 1,
-0.873946, -0.3457318, -2.731822, 0.7647059, 1, 0, 1,
-0.8736634, -0.1403615, -1.743616, 0.7568628, 1, 0, 1,
-0.8636848, 0.8439363, -2.032232, 0.7529412, 1, 0, 1,
-0.8606299, 0.681771, -0.9425358, 0.7450981, 1, 0, 1,
-0.8572682, -0.627389, -2.700489, 0.7411765, 1, 0, 1,
-0.8560883, 0.2306671, -0.02395668, 0.7333333, 1, 0, 1,
-0.8550657, -1.650858, -2.755219, 0.7294118, 1, 0, 1,
-0.8513513, -1.165147, -0.06006489, 0.7215686, 1, 0, 1,
-0.8513207, -0.7530468, -3.207842, 0.7176471, 1, 0, 1,
-0.8410195, -0.5225636, -0.3165223, 0.7098039, 1, 0, 1,
-0.8356531, -0.2489316, -2.11133, 0.7058824, 1, 0, 1,
-0.8288292, -0.7537985, -1.815867, 0.6980392, 1, 0, 1,
-0.8275943, 0.3477384, -0.7203061, 0.6901961, 1, 0, 1,
-0.8230782, 0.1718006, -1.121847, 0.6862745, 1, 0, 1,
-0.8195682, 0.6577259, -0.9811594, 0.6784314, 1, 0, 1,
-0.8194692, -1.87569, -3.760956, 0.6745098, 1, 0, 1,
-0.8191405, -0.07203944, -0.2266907, 0.6666667, 1, 0, 1,
-0.8095834, 0.9912701, 0.3130687, 0.6627451, 1, 0, 1,
-0.8093419, -0.2001902, -0.07973564, 0.654902, 1, 0, 1,
-0.8076841, 0.06794792, -0.6794305, 0.6509804, 1, 0, 1,
-0.8068005, 0.2355407, -2.67031, 0.6431373, 1, 0, 1,
-0.8066847, 1.774786, -0.005996253, 0.6392157, 1, 0, 1,
-0.8047155, 1.09505, -0.9299397, 0.6313726, 1, 0, 1,
-0.8038017, -1.041089, -3.562703, 0.627451, 1, 0, 1,
-0.8037959, -0.362485, -1.812693, 0.6196079, 1, 0, 1,
-0.7973839, 1.1077, -0.821462, 0.6156863, 1, 0, 1,
-0.7924103, 0.5743629, -0.599904, 0.6078432, 1, 0, 1,
-0.7895964, 0.5010874, -1.670657, 0.6039216, 1, 0, 1,
-0.7859042, -0.2858479, -2.674375, 0.5960785, 1, 0, 1,
-0.7844658, -0.04151557, -2.553235, 0.5882353, 1, 0, 1,
-0.7842021, 1.643442, -0.9285601, 0.5843138, 1, 0, 1,
-0.7817698, 1.944147, 0.798357, 0.5764706, 1, 0, 1,
-0.7811526, -0.775547, -3.503563, 0.572549, 1, 0, 1,
-0.7799984, 0.5327394, -0.4074434, 0.5647059, 1, 0, 1,
-0.7787102, -0.1747577, -2.559686, 0.5607843, 1, 0, 1,
-0.7748098, 0.4757276, -1.63619, 0.5529412, 1, 0, 1,
-0.7734698, -1.599409, -3.521937, 0.5490196, 1, 0, 1,
-0.7625889, 0.4215191, -0.7357176, 0.5411765, 1, 0, 1,
-0.7588586, -1.801105, -3.345455, 0.5372549, 1, 0, 1,
-0.756005, 0.07418273, -2.295792, 0.5294118, 1, 0, 1,
-0.7542564, 2.487436, 2.036171, 0.5254902, 1, 0, 1,
-0.752022, 0.4089055, -1.262224, 0.5176471, 1, 0, 1,
-0.7506198, 1.147494, -1.31128, 0.5137255, 1, 0, 1,
-0.7499863, -0.2890873, -1.547947, 0.5058824, 1, 0, 1,
-0.7469102, -1.846794, -3.215255, 0.5019608, 1, 0, 1,
-0.7459813, 0.3875619, -1.451278, 0.4941176, 1, 0, 1,
-0.7432601, 1.352231, -1.600518, 0.4862745, 1, 0, 1,
-0.7429236, -0.750083, -1.990244, 0.4823529, 1, 0, 1,
-0.7418324, 0.1741816, -0.8314191, 0.4745098, 1, 0, 1,
-0.7407831, -1.729867, -2.708913, 0.4705882, 1, 0, 1,
-0.7349524, 1.874322, -0.8826747, 0.4627451, 1, 0, 1,
-0.7258687, -0.7448571, -3.451368, 0.4588235, 1, 0, 1,
-0.7227307, 0.4372711, 0.8159723, 0.4509804, 1, 0, 1,
-0.7220699, -0.6719211, -3.841876, 0.4470588, 1, 0, 1,
-0.7181132, -1.071222, -4.145365, 0.4392157, 1, 0, 1,
-0.7105958, -0.09797063, -3.509637, 0.4352941, 1, 0, 1,
-0.7094516, -0.325458, -1.670631, 0.427451, 1, 0, 1,
-0.7084169, 1.212919, -0.5982749, 0.4235294, 1, 0, 1,
-0.7031551, 1.091204, -0.8069881, 0.4156863, 1, 0, 1,
-0.6972349, -0.3386424, -1.491227, 0.4117647, 1, 0, 1,
-0.6965557, -1.340149, -1.262451, 0.4039216, 1, 0, 1,
-0.6948959, 0.7651546, -0.5043233, 0.3960784, 1, 0, 1,
-0.6909516, 0.2189083, -1.196281, 0.3921569, 1, 0, 1,
-0.6907525, 0.5884333, -2.473439, 0.3843137, 1, 0, 1,
-0.6879857, 0.1634787, -0.8628596, 0.3803922, 1, 0, 1,
-0.6831155, 0.1381278, -2.339762, 0.372549, 1, 0, 1,
-0.6761326, 0.5210708, -1.517989, 0.3686275, 1, 0, 1,
-0.674895, 0.3729752, -2.178615, 0.3607843, 1, 0, 1,
-0.6687644, -0.2802636, -3.004396, 0.3568628, 1, 0, 1,
-0.6660848, 1.04439, -0.4153376, 0.3490196, 1, 0, 1,
-0.6525749, 1.660359, 0.936933, 0.345098, 1, 0, 1,
-0.6420899, -1.701791, -3.356986, 0.3372549, 1, 0, 1,
-0.641692, -1.528424, -3.430956, 0.3333333, 1, 0, 1,
-0.6376922, 0.4598137, -0.1616311, 0.3254902, 1, 0, 1,
-0.6336151, 0.04847403, -1.928327, 0.3215686, 1, 0, 1,
-0.6331626, 1.348558, 1.506047, 0.3137255, 1, 0, 1,
-0.6307386, 1.40497, 0.08809868, 0.3098039, 1, 0, 1,
-0.6307107, -2.211634, -1.760559, 0.3019608, 1, 0, 1,
-0.6288627, -0.6598402, -0.3964723, 0.2941177, 1, 0, 1,
-0.6267724, 1.783713, 0.5601032, 0.2901961, 1, 0, 1,
-0.6248739, 0.2646132, -0.7353107, 0.282353, 1, 0, 1,
-0.6224209, -1.852882, -2.421417, 0.2784314, 1, 0, 1,
-0.6220269, 2.250799, -1.20344, 0.2705882, 1, 0, 1,
-0.6196959, 0.6765512, -2.546813, 0.2666667, 1, 0, 1,
-0.6188203, -0.8551547, -1.834095, 0.2588235, 1, 0, 1,
-0.6105854, -0.4295464, -1.663955, 0.254902, 1, 0, 1,
-0.6062588, -2.005995, -1.813084, 0.2470588, 1, 0, 1,
-0.5989044, -0.07625782, -0.9542761, 0.2431373, 1, 0, 1,
-0.5972211, 1.755763, 0.7998241, 0.2352941, 1, 0, 1,
-0.5952329, -1.351238, -1.966137, 0.2313726, 1, 0, 1,
-0.5934148, -1.562531, -0.5054185, 0.2235294, 1, 0, 1,
-0.5932159, -1.705731, -2.609314, 0.2196078, 1, 0, 1,
-0.5931702, 0.2188131, -1.485591, 0.2117647, 1, 0, 1,
-0.5921153, -0.414709, -1.540771, 0.2078431, 1, 0, 1,
-0.5913407, -0.05377918, -0.9288145, 0.2, 1, 0, 1,
-0.5851904, -1.700634, -1.542297, 0.1921569, 1, 0, 1,
-0.5815414, -0.4977956, -3.752126, 0.1882353, 1, 0, 1,
-0.5799759, 1.36534, -1.296082, 0.1803922, 1, 0, 1,
-0.5796908, -1.606882, -2.956043, 0.1764706, 1, 0, 1,
-0.5771668, -1.97556, -1.444868, 0.1686275, 1, 0, 1,
-0.5730633, -0.7008935, -1.267457, 0.1647059, 1, 0, 1,
-0.569797, 2.774024, 0.6062233, 0.1568628, 1, 0, 1,
-0.5644245, 0.03942177, -0.8770368, 0.1529412, 1, 0, 1,
-0.5633837, -1.449473, -1.941104, 0.145098, 1, 0, 1,
-0.5552076, -1.362104, -2.212955, 0.1411765, 1, 0, 1,
-0.5523046, 0.5483783, -1.48535, 0.1333333, 1, 0, 1,
-0.5474346, -1.213061, -2.377124, 0.1294118, 1, 0, 1,
-0.5456277, 0.3674938, -0.2036119, 0.1215686, 1, 0, 1,
-0.5420879, -1.518855, -2.470663, 0.1176471, 1, 0, 1,
-0.5391263, 0.03377771, -1.57932, 0.1098039, 1, 0, 1,
-0.5378266, -0.3152119, -2.3166, 0.1058824, 1, 0, 1,
-0.5364673, 0.7310198, 2.052992, 0.09803922, 1, 0, 1,
-0.5362523, -0.8108383, -1.519264, 0.09019608, 1, 0, 1,
-0.5357972, 1.229477, -1.589977, 0.08627451, 1, 0, 1,
-0.5338907, 0.788548, -1.701236, 0.07843138, 1, 0, 1,
-0.5327282, 0.4179129, -0.1399945, 0.07450981, 1, 0, 1,
-0.5324112, 0.9922538, -1.374507, 0.06666667, 1, 0, 1,
-0.532239, -0.4258829, -2.86293, 0.0627451, 1, 0, 1,
-0.5320813, -0.2829607, -2.181447, 0.05490196, 1, 0, 1,
-0.5254319, 1.18628, 0.3729208, 0.05098039, 1, 0, 1,
-0.525219, -0.06205193, -3.057224, 0.04313726, 1, 0, 1,
-0.5178873, 0.3613943, -1.846243, 0.03921569, 1, 0, 1,
-0.5150946, 0.2082732, -2.736673, 0.03137255, 1, 0, 1,
-0.513126, 0.9517148, -0.3100311, 0.02745098, 1, 0, 1,
-0.5086118, -1.354846, -2.622631, 0.01960784, 1, 0, 1,
-0.507139, 0.8116978, -0.7487067, 0.01568628, 1, 0, 1,
-0.5060348, 0.7172848, -0.6592529, 0.007843138, 1, 0, 1,
-0.5016628, 0.5925159, -2.236887, 0.003921569, 1, 0, 1,
-0.4987524, 2.209202, 0.6618106, 0, 1, 0.003921569, 1,
-0.4957642, -0.4736578, -2.567872, 0, 1, 0.01176471, 1,
-0.4894991, -0.3929861, -2.585295, 0, 1, 0.01568628, 1,
-0.4856549, -1.213575, -2.827003, 0, 1, 0.02352941, 1,
-0.4724935, -0.3182193, -2.981017, 0, 1, 0.02745098, 1,
-0.471893, 1.420789, 0.1794027, 0, 1, 0.03529412, 1,
-0.4707762, -0.4898082, -3.997924, 0, 1, 0.03921569, 1,
-0.4697401, -0.3617473, -2.173931, 0, 1, 0.04705882, 1,
-0.4686757, -0.1058217, -0.6402642, 0, 1, 0.05098039, 1,
-0.4624471, -2.1206, -3.886704, 0, 1, 0.05882353, 1,
-0.4623282, 0.2201149, -0.5642365, 0, 1, 0.0627451, 1,
-0.4610102, -0.2002145, -1.561367, 0, 1, 0.07058824, 1,
-0.4571776, -1.005417, -4.366407, 0, 1, 0.07450981, 1,
-0.455439, 1.081598, -0.730023, 0, 1, 0.08235294, 1,
-0.4534957, 0.486059, -0.6993166, 0, 1, 0.08627451, 1,
-0.4519683, -0.08697376, -2.752351, 0, 1, 0.09411765, 1,
-0.4456171, 0.8298172, -1.266694, 0, 1, 0.1019608, 1,
-0.4428863, 0.1929991, -1.121252, 0, 1, 0.1058824, 1,
-0.4399984, -0.5586014, -2.798086, 0, 1, 0.1137255, 1,
-0.4391023, -0.1111932, -1.610653, 0, 1, 0.1176471, 1,
-0.4388058, 1.78232, -0.3280743, 0, 1, 0.1254902, 1,
-0.4366431, -0.1958748, -2.285005, 0, 1, 0.1294118, 1,
-0.4352992, 0.09211285, -0.4480478, 0, 1, 0.1372549, 1,
-0.4322253, -2.598053, -3.789778, 0, 1, 0.1411765, 1,
-0.4311661, 0.6566306, -1.474427, 0, 1, 0.1490196, 1,
-0.4288974, -0.3057406, -1.186503, 0, 1, 0.1529412, 1,
-0.4234239, 0.7038552, -1.236728, 0, 1, 0.1607843, 1,
-0.4229945, 1.031033, -1.390555, 0, 1, 0.1647059, 1,
-0.4221538, -0.1480414, -3.143844, 0, 1, 0.172549, 1,
-0.4192336, 1.433208, 0.1039945, 0, 1, 0.1764706, 1,
-0.4176804, 2.5852, 0.3871271, 0, 1, 0.1843137, 1,
-0.4165512, -0.7900234, -3.605275, 0, 1, 0.1882353, 1,
-0.4157009, -0.745746, -2.885959, 0, 1, 0.1960784, 1,
-0.4150059, -2.117968, -2.02236, 0, 1, 0.2039216, 1,
-0.4139342, -0.6959875, -4.791548, 0, 1, 0.2078431, 1,
-0.3983898, 1.081758, 0.2173232, 0, 1, 0.2156863, 1,
-0.3975506, -0.2689182, -1.168372, 0, 1, 0.2196078, 1,
-0.397, -0.2810399, -2.018681, 0, 1, 0.227451, 1,
-0.3953442, 0.1886275, 0.03529599, 0, 1, 0.2313726, 1,
-0.3924881, 0.433522, -0.9875905, 0, 1, 0.2392157, 1,
-0.3923314, 2.07543, 1.248009, 0, 1, 0.2431373, 1,
-0.3896608, -0.07777274, -3.051764, 0, 1, 0.2509804, 1,
-0.3851354, 1.16438, -0.189765, 0, 1, 0.254902, 1,
-0.3839382, -0.2152123, -3.058197, 0, 1, 0.2627451, 1,
-0.3834158, -0.370177, -4.610332, 0, 1, 0.2666667, 1,
-0.3763259, -1.086043, -2.675305, 0, 1, 0.2745098, 1,
-0.3744654, -1.155235, -2.717978, 0, 1, 0.2784314, 1,
-0.3744338, -1.430367, -2.577832, 0, 1, 0.2862745, 1,
-0.3735843, 0.07005574, -3.037616, 0, 1, 0.2901961, 1,
-0.368007, 1.031583, 0.5577767, 0, 1, 0.2980392, 1,
-0.3647836, 0.1186513, -1.869668, 0, 1, 0.3058824, 1,
-0.3630715, -0.1961535, -1.703037, 0, 1, 0.3098039, 1,
-0.3623379, 0.8233069, -2.432143, 0, 1, 0.3176471, 1,
-0.360811, -2.209818, -3.553796, 0, 1, 0.3215686, 1,
-0.3468167, -1.399565, -4.20884, 0, 1, 0.3294118, 1,
-0.3338681, -1.261514, -2.306357, 0, 1, 0.3333333, 1,
-0.3329108, 1.463106, -0.2071346, 0, 1, 0.3411765, 1,
-0.3327354, 0.4332666, -2.681659, 0, 1, 0.345098, 1,
-0.3277561, 0.2321926, -0.0312595, 0, 1, 0.3529412, 1,
-0.3264489, 0.444743, -1.831744, 0, 1, 0.3568628, 1,
-0.3262458, -0.5595277, -1.970614, 0, 1, 0.3647059, 1,
-0.3259707, 0.6153184, -1.239382, 0, 1, 0.3686275, 1,
-0.3259346, -0.5370852, -2.211673, 0, 1, 0.3764706, 1,
-0.3234972, 0.3015561, 1.401842, 0, 1, 0.3803922, 1,
-0.3218466, -0.03464943, -0.4749457, 0, 1, 0.3882353, 1,
-0.3202328, 1.665304, 0.1684908, 0, 1, 0.3921569, 1,
-0.318009, 0.9274184, 0.03204206, 0, 1, 0.4, 1,
-0.312362, 0.2933533, -0.5994827, 0, 1, 0.4078431, 1,
-0.3116037, -0.1767534, -2.020348, 0, 1, 0.4117647, 1,
-0.3045385, 0.3303705, -1.363162, 0, 1, 0.4196078, 1,
-0.303675, 0.6691687, -0.5468502, 0, 1, 0.4235294, 1,
-0.3033353, 0.6018313, -1.908485, 0, 1, 0.4313726, 1,
-0.3016731, 1.476923, -0.981913, 0, 1, 0.4352941, 1,
-0.2991757, 0.486053, 0.0350958, 0, 1, 0.4431373, 1,
-0.289841, -0.00298069, -1.576944, 0, 1, 0.4470588, 1,
-0.2884266, -0.1655768, -2.284203, 0, 1, 0.454902, 1,
-0.2859193, -0.01187155, -1.607121, 0, 1, 0.4588235, 1,
-0.2840027, 0.2851256, -1.391228, 0, 1, 0.4666667, 1,
-0.270322, 0.1322026, -0.9200372, 0, 1, 0.4705882, 1,
-0.2649332, 0.9413256, 0.4664993, 0, 1, 0.4784314, 1,
-0.2615314, 0.6668409, 0.5999051, 0, 1, 0.4823529, 1,
-0.2610283, 1.723883, 0.6804909, 0, 1, 0.4901961, 1,
-0.2579992, 1.031249, 0.4195077, 0, 1, 0.4941176, 1,
-0.255083, -0.8255728, -3.303604, 0, 1, 0.5019608, 1,
-0.2545029, 0.4072928, 0.5402672, 0, 1, 0.509804, 1,
-0.2534357, -0.8807814, -5.006486, 0, 1, 0.5137255, 1,
-0.2449938, 0.2187338, -0.8239379, 0, 1, 0.5215687, 1,
-0.2448536, 1.117436, -2.448536, 0, 1, 0.5254902, 1,
-0.2425023, -0.8625008, -3.808615, 0, 1, 0.5333334, 1,
-0.2344389, -0.2256132, -2.048232, 0, 1, 0.5372549, 1,
-0.2337495, -0.703023, -3.145298, 0, 1, 0.5450981, 1,
-0.2322122, 0.3371401, -1.902204, 0, 1, 0.5490196, 1,
-0.2312741, -1.963503, -1.728305, 0, 1, 0.5568628, 1,
-0.2237004, 1.182895, 2.80361, 0, 1, 0.5607843, 1,
-0.2214502, 0.8933969, -1.633429, 0, 1, 0.5686275, 1,
-0.2208587, 0.2640145, -0.02890291, 0, 1, 0.572549, 1,
-0.2206532, -0.1301113, -0.9519056, 0, 1, 0.5803922, 1,
-0.2197684, -1.029268, -4.510838, 0, 1, 0.5843138, 1,
-0.2190474, 1.749746, -1.603863, 0, 1, 0.5921569, 1,
-0.2177894, 0.9088218, 1.584454, 0, 1, 0.5960785, 1,
-0.2132116, 0.9360378, 0.4132339, 0, 1, 0.6039216, 1,
-0.2089394, -0.7850775, -4.18486, 0, 1, 0.6117647, 1,
-0.2047997, -1.882198, -1.800678, 0, 1, 0.6156863, 1,
-0.2013115, -1.907744, -4.40195, 0, 1, 0.6235294, 1,
-0.2011488, -0.2514097, -2.45075, 0, 1, 0.627451, 1,
-0.1993968, 0.378382, 0.6171812, 0, 1, 0.6352941, 1,
-0.1992557, -1.985089, -3.969507, 0, 1, 0.6392157, 1,
-0.1937685, 0.1257072, 0.4895107, 0, 1, 0.6470588, 1,
-0.1935534, -0.5821024, -3.502166, 0, 1, 0.6509804, 1,
-0.1927364, -1.595016, -3.810942, 0, 1, 0.6588235, 1,
-0.1920931, 1.38947, 0.7448313, 0, 1, 0.6627451, 1,
-0.188282, 0.8387943, -0.141462, 0, 1, 0.6705883, 1,
-0.1877978, 0.1747654, -0.2315471, 0, 1, 0.6745098, 1,
-0.18578, 0.5505469, -1.209734, 0, 1, 0.682353, 1,
-0.1838742, 0.3274078, 0.6426482, 0, 1, 0.6862745, 1,
-0.1798505, 0.6292984, 0.9238642, 0, 1, 0.6941177, 1,
-0.1772105, 1.555382, 1.298545, 0, 1, 0.7019608, 1,
-0.1760028, 2.218951, -0.8222972, 0, 1, 0.7058824, 1,
-0.1758893, 0.8975522, 2.360828, 0, 1, 0.7137255, 1,
-0.1741747, -0.7374743, -3.808608, 0, 1, 0.7176471, 1,
-0.1740275, -0.2106708, -1.499202, 0, 1, 0.7254902, 1,
-0.1692339, 1.557375, 0.1549332, 0, 1, 0.7294118, 1,
-0.1668897, 0.1909139, -3.12161, 0, 1, 0.7372549, 1,
-0.162937, -0.1141449, -1.269371, 0, 1, 0.7411765, 1,
-0.1578037, 0.02857409, -1.947012, 0, 1, 0.7490196, 1,
-0.1554876, -1.670414, -3.055968, 0, 1, 0.7529412, 1,
-0.1526055, -1.533392, -1.563627, 0, 1, 0.7607843, 1,
-0.1524248, -0.01809856, -0.5563382, 0, 1, 0.7647059, 1,
-0.1489954, -0.3325467, -2.20932, 0, 1, 0.772549, 1,
-0.1487435, -1.24488, -1.840749, 0, 1, 0.7764706, 1,
-0.1460356, 1.074771, -2.015852, 0, 1, 0.7843137, 1,
-0.1457416, -1.230971, -2.928398, 0, 1, 0.7882353, 1,
-0.1450843, 0.7525505, -1.832778, 0, 1, 0.7960784, 1,
-0.1431338, -0.5191109, -3.048481, 0, 1, 0.8039216, 1,
-0.1429766, -0.2320086, -3.072703, 0, 1, 0.8078431, 1,
-0.1422484, 0.6179032, -0.4439129, 0, 1, 0.8156863, 1,
-0.1419525, -2.608752, -1.532784, 0, 1, 0.8196079, 1,
-0.1409113, 0.7000383, -0.9165487, 0, 1, 0.827451, 1,
-0.1354993, 0.5306631, -0.03416201, 0, 1, 0.8313726, 1,
-0.1354331, 1.262468, 2.157786, 0, 1, 0.8392157, 1,
-0.1317967, -0.615841, -2.844826, 0, 1, 0.8431373, 1,
-0.1295971, 0.3668754, 0.8159758, 0, 1, 0.8509804, 1,
-0.127658, -1.749129, -3.143235, 0, 1, 0.854902, 1,
-0.1251046, -0.0900759, -3.446858, 0, 1, 0.8627451, 1,
-0.1249387, 0.3566142, -0.3197921, 0, 1, 0.8666667, 1,
-0.1237111, -1.963715, -4.286425, 0, 1, 0.8745098, 1,
-0.1219208, -0.2730126, -3.921102, 0, 1, 0.8784314, 1,
-0.120395, -0.04590563, -2.180834, 0, 1, 0.8862745, 1,
-0.1202309, -0.1178643, -1.166561, 0, 1, 0.8901961, 1,
-0.1182888, -0.8926686, -3.627207, 0, 1, 0.8980392, 1,
-0.1180476, 1.304214, -1.975963, 0, 1, 0.9058824, 1,
-0.1178472, 0.115546, -0.4682734, 0, 1, 0.9098039, 1,
-0.1131098, -0.5112538, -2.155304, 0, 1, 0.9176471, 1,
-0.1049011, -0.4719877, -2.17978, 0, 1, 0.9215686, 1,
-0.1041815, 0.06988031, -1.561401, 0, 1, 0.9294118, 1,
-0.1025433, 0.4724602, 1.679297, 0, 1, 0.9333333, 1,
-0.1017414, 1.156238, -0.9453675, 0, 1, 0.9411765, 1,
-0.1005927, 1.095201, 0.8045136, 0, 1, 0.945098, 1,
-0.09419057, -1.425493, -1.315097, 0, 1, 0.9529412, 1,
-0.09400468, -0.1734982, -3.730046, 0, 1, 0.9568627, 1,
-0.09395802, -7.39469e-05, -0.3274225, 0, 1, 0.9647059, 1,
-0.08431438, -0.9931026, -3.466852, 0, 1, 0.9686275, 1,
-0.08342664, 0.01537845, -0.7247461, 0, 1, 0.9764706, 1,
-0.07992042, 0.03460257, -0.8996767, 0, 1, 0.9803922, 1,
-0.07846557, -0.806264, -2.819476, 0, 1, 0.9882353, 1,
-0.07813549, 0.150957, -0.6582385, 0, 1, 0.9921569, 1,
-0.06744841, -0.3239115, -3.542808, 0, 1, 1, 1,
-0.06060583, -1.137436, -2.846119, 0, 0.9921569, 1, 1,
-0.05709808, 0.4303972, -2.09091, 0, 0.9882353, 1, 1,
-0.05156963, -0.7276533, -3.591634, 0, 0.9803922, 1, 1,
-0.05027736, -0.8104714, -5.18226, 0, 0.9764706, 1, 1,
-0.04635845, -1.01606, -3.359915, 0, 0.9686275, 1, 1,
-0.04105137, 0.3294716, 0.1662833, 0, 0.9647059, 1, 1,
-0.03265459, 1.491428, 0.6150416, 0, 0.9568627, 1, 1,
-0.03252205, 0.506018, -0.8599242, 0, 0.9529412, 1, 1,
-0.03085431, 0.3394645, 0.05678692, 0, 0.945098, 1, 1,
-0.02623421, -0.05146552, -1.222288, 0, 0.9411765, 1, 1,
-0.01936016, -0.916344, -4.347672, 0, 0.9333333, 1, 1,
-0.01860465, 1.024068, -0.1157864, 0, 0.9294118, 1, 1,
-0.01747799, 0.7594987, 0.3335015, 0, 0.9215686, 1, 1,
-0.01292193, -0.24538, -2.08916, 0, 0.9176471, 1, 1,
-0.004846498, 0.3441639, -1.776651, 0, 0.9098039, 1, 1,
-0.004285944, -0.1857428, -2.562022, 0, 0.9058824, 1, 1,
-0.004029811, 2.643457, -0.9812018, 0, 0.8980392, 1, 1,
-0.003549902, 0.3123864, -0.308221, 0, 0.8901961, 1, 1,
-0.002504034, -0.05435143, -5.051926, 0, 0.8862745, 1, 1,
-0.002465348, 1.201404, -0.3936113, 0, 0.8784314, 1, 1,
-0.001494021, 0.6840124, 0.6687443, 0, 0.8745098, 1, 1,
0.0002093384, 0.4220942, -0.3687049, 0, 0.8666667, 1, 1,
0.000328293, 1.037113, 1.782098, 0, 0.8627451, 1, 1,
0.000477179, 0.7909716, 0.9042181, 0, 0.854902, 1, 1,
0.001333792, -0.6855841, 4.11372, 0, 0.8509804, 1, 1,
0.00367776, 0.6286702, 0.9318805, 0, 0.8431373, 1, 1,
0.004579783, 0.5898948, 0.913345, 0, 0.8392157, 1, 1,
0.006115269, 0.5449151, 1.338648, 0, 0.8313726, 1, 1,
0.008420053, 0.05256925, -1.357115, 0, 0.827451, 1, 1,
0.008541034, 0.428838, 0.01358964, 0, 0.8196079, 1, 1,
0.00872115, 0.09145173, -1.839405, 0, 0.8156863, 1, 1,
0.0155776, -1.871092, 2.437337, 0, 0.8078431, 1, 1,
0.01606593, 1.7271, 0.8547927, 0, 0.8039216, 1, 1,
0.01625832, -0.1275245, 2.151457, 0, 0.7960784, 1, 1,
0.01786481, -0.363072, 3.376292, 0, 0.7882353, 1, 1,
0.01969104, 0.6984488, -0.8775143, 0, 0.7843137, 1, 1,
0.02812313, 1.054389, -1.331103, 0, 0.7764706, 1, 1,
0.03318083, 1.196571, 2.032945, 0, 0.772549, 1, 1,
0.03853639, -0.3776312, 2.959991, 0, 0.7647059, 1, 1,
0.04045024, 0.5545326, -1.398031, 0, 0.7607843, 1, 1,
0.04337476, -0.5618671, 2.737026, 0, 0.7529412, 1, 1,
0.0465958, -1.426823, 0.7540741, 0, 0.7490196, 1, 1,
0.05045602, -0.4686494, 3.782455, 0, 0.7411765, 1, 1,
0.05121013, 0.07406212, 0.8092669, 0, 0.7372549, 1, 1,
0.05209272, -1.371279, 4.72565, 0, 0.7294118, 1, 1,
0.05575734, -1.443361, 4.780045, 0, 0.7254902, 1, 1,
0.05779203, -0.1438992, 1.169921, 0, 0.7176471, 1, 1,
0.05782089, 0.222611, 0.130941, 0, 0.7137255, 1, 1,
0.06208464, 0.03569767, -0.0381862, 0, 0.7058824, 1, 1,
0.06733139, 0.4411993, -0.2022266, 0, 0.6980392, 1, 1,
0.06903079, -0.1457804, 3.907933, 0, 0.6941177, 1, 1,
0.07298932, -1.967005, 2.594991, 0, 0.6862745, 1, 1,
0.0844521, 1.296204, -0.189554, 0, 0.682353, 1, 1,
0.08596525, -0.8030939, 1.628165, 0, 0.6745098, 1, 1,
0.08944026, 1.211791, 0.9885589, 0, 0.6705883, 1, 1,
0.09090161, 1.321554, 0.5768896, 0, 0.6627451, 1, 1,
0.09131903, 0.9495381, 1.768388, 0, 0.6588235, 1, 1,
0.09201874, -0.7067747, 3.731178, 0, 0.6509804, 1, 1,
0.09231732, 0.2286535, -0.3541193, 0, 0.6470588, 1, 1,
0.09517007, -0.166721, 3.361955, 0, 0.6392157, 1, 1,
0.0998216, 0.3075322, -1.558456, 0, 0.6352941, 1, 1,
0.1033443, -0.3581889, 2.229003, 0, 0.627451, 1, 1,
0.1064011, 0.6802363, 0.7083289, 0, 0.6235294, 1, 1,
0.1066495, 0.09786067, 1.705196, 0, 0.6156863, 1, 1,
0.1083713, 0.5097273, -0.8662174, 0, 0.6117647, 1, 1,
0.1122163, 0.9156264, -0.7225898, 0, 0.6039216, 1, 1,
0.1145685, 1.191959, -1.067469, 0, 0.5960785, 1, 1,
0.1175674, -0.02553848, 1.333681, 0, 0.5921569, 1, 1,
0.1197291, -0.2624336, 3.633623, 0, 0.5843138, 1, 1,
0.1207758, -1.257001, 1.255014, 0, 0.5803922, 1, 1,
0.1216736, -0.1112845, 2.235873, 0, 0.572549, 1, 1,
0.1289384, -0.7408658, 4.683952, 0, 0.5686275, 1, 1,
0.1289777, -1.198333, 4.494821, 0, 0.5607843, 1, 1,
0.1367481, 0.5685938, -0.7102014, 0, 0.5568628, 1, 1,
0.1409937, 0.9900602, 1.365123, 0, 0.5490196, 1, 1,
0.1417048, 0.08120305, 1.589126, 0, 0.5450981, 1, 1,
0.1421055, -0.8265343, 4.63968, 0, 0.5372549, 1, 1,
0.1472424, 0.3547086, 1.569789, 0, 0.5333334, 1, 1,
0.15016, 0.2295658, 1.336089, 0, 0.5254902, 1, 1,
0.1542067, -0.2970209, 2.975384, 0, 0.5215687, 1, 1,
0.1550273, -1.772514, 3.167642, 0, 0.5137255, 1, 1,
0.1669994, 0.195386, -0.5458667, 0, 0.509804, 1, 1,
0.1698351, 0.1771275, 1.356103, 0, 0.5019608, 1, 1,
0.1714897, -0.05541452, -0.2792719, 0, 0.4941176, 1, 1,
0.1722946, -0.4654913, 2.696312, 0, 0.4901961, 1, 1,
0.1751395, -0.2032918, 1.399937, 0, 0.4823529, 1, 1,
0.1759075, -0.7467241, 3.853041, 0, 0.4784314, 1, 1,
0.1784478, -0.6011466, 2.208447, 0, 0.4705882, 1, 1,
0.1786241, 0.5232372, -0.9447141, 0, 0.4666667, 1, 1,
0.1869573, 2.48607, -0.05124237, 0, 0.4588235, 1, 1,
0.1880197, -0.7514016, 1.443427, 0, 0.454902, 1, 1,
0.1880574, 1.254943, 1.769729, 0, 0.4470588, 1, 1,
0.1904138, 0.9372283, 0.2390092, 0, 0.4431373, 1, 1,
0.1908836, -0.07904285, 2.239709, 0, 0.4352941, 1, 1,
0.1959724, -1.160611, 3.371951, 0, 0.4313726, 1, 1,
0.198173, -0.1299773, 1.10288, 0, 0.4235294, 1, 1,
0.2027495, -0.3788538, 2.527728, 0, 0.4196078, 1, 1,
0.2065422, -0.7481499, 3.798855, 0, 0.4117647, 1, 1,
0.210173, -0.03231162, 2.688052, 0, 0.4078431, 1, 1,
0.2130214, -0.4265406, 2.176687, 0, 0.4, 1, 1,
0.2146914, -1.23818, 3.802699, 0, 0.3921569, 1, 1,
0.2186273, 1.362579, -1.151256, 0, 0.3882353, 1, 1,
0.2189778, 0.4026349, 0.6517312, 0, 0.3803922, 1, 1,
0.2238888, -0.4962951, 3.723583, 0, 0.3764706, 1, 1,
0.2246014, -1.304263, 2.30933, 0, 0.3686275, 1, 1,
0.2252136, -0.328212, 1.592802, 0, 0.3647059, 1, 1,
0.2272811, -0.8812717, 3.589613, 0, 0.3568628, 1, 1,
0.2275257, -0.7917101, 4.279685, 0, 0.3529412, 1, 1,
0.2292099, -0.5341521, 2.136511, 0, 0.345098, 1, 1,
0.2362882, -1.809346, 4.792201, 0, 0.3411765, 1, 1,
0.2501051, 1.524693, 1.511395, 0, 0.3333333, 1, 1,
0.2517826, -0.4172749, 4.323524, 0, 0.3294118, 1, 1,
0.2543815, -0.6013342, 3.193416, 0, 0.3215686, 1, 1,
0.2548395, 0.5344843, -0.1055126, 0, 0.3176471, 1, 1,
0.2562132, 1.467808, 0.6300101, 0, 0.3098039, 1, 1,
0.2564405, 0.9740043, -0.7956666, 0, 0.3058824, 1, 1,
0.2617562, 0.7202991, 0.1454739, 0, 0.2980392, 1, 1,
0.2667173, 2.939808, 0.4632323, 0, 0.2901961, 1, 1,
0.275003, 0.3136232, 0.1970904, 0, 0.2862745, 1, 1,
0.2776906, 0.3418966, 1.264874, 0, 0.2784314, 1, 1,
0.2779506, -0.1167943, 2.414706, 0, 0.2745098, 1, 1,
0.2828088, -0.2497916, 1.773513, 0, 0.2666667, 1, 1,
0.285121, -0.1717392, 2.788538, 0, 0.2627451, 1, 1,
0.2926559, -1.893218, 1.814607, 0, 0.254902, 1, 1,
0.2939513, -0.07145242, 2.065168, 0, 0.2509804, 1, 1,
0.2962149, -0.3244638, 2.274916, 0, 0.2431373, 1, 1,
0.2980201, -0.6401951, 2.877961, 0, 0.2392157, 1, 1,
0.3016512, -0.2319392, 1.548195, 0, 0.2313726, 1, 1,
0.3024039, 0.113419, 0.9289683, 0, 0.227451, 1, 1,
0.3043299, 0.9475443, 0.4612616, 0, 0.2196078, 1, 1,
0.3104235, -0.7930524, 2.964154, 0, 0.2156863, 1, 1,
0.3130623, 0.8849545, -0.5416569, 0, 0.2078431, 1, 1,
0.3134049, -1.021505, 3.084757, 0, 0.2039216, 1, 1,
0.3144639, 0.4897611, -0.4102075, 0, 0.1960784, 1, 1,
0.3154216, 0.6266761, 1.702118, 0, 0.1882353, 1, 1,
0.3166972, 0.417188, 2.377985, 0, 0.1843137, 1, 1,
0.3189909, -1.738013, 3.474687, 0, 0.1764706, 1, 1,
0.3246478, -0.3690696, 1.174737, 0, 0.172549, 1, 1,
0.325442, 0.7551001, -0.4675956, 0, 0.1647059, 1, 1,
0.3257444, -1.364099, 4.43225, 0, 0.1607843, 1, 1,
0.3281037, 0.3117767, 0.8498772, 0, 0.1529412, 1, 1,
0.3312089, -1.270507, 3.810961, 0, 0.1490196, 1, 1,
0.331653, 0.8493103, -0.110162, 0, 0.1411765, 1, 1,
0.3327429, 0.09760864, 0.9386872, 0, 0.1372549, 1, 1,
0.3332809, 0.6427046, 0.4917242, 0, 0.1294118, 1, 1,
0.3355365, -0.6846333, 4.066249, 0, 0.1254902, 1, 1,
0.3374691, 1.620809, -0.9527504, 0, 0.1176471, 1, 1,
0.3376117, -0.1544576, 2.149434, 0, 0.1137255, 1, 1,
0.3395226, 1.597357, 0.5790893, 0, 0.1058824, 1, 1,
0.3443429, -0.8990794, 3.16282, 0, 0.09803922, 1, 1,
0.3483604, -2.317516, 1.749212, 0, 0.09411765, 1, 1,
0.3503087, 0.1229034, 1.120023, 0, 0.08627451, 1, 1,
0.3531622, -1.657531, 5.517287, 0, 0.08235294, 1, 1,
0.3537942, 1.13556, 0.5244376, 0, 0.07450981, 1, 1,
0.3546579, -0.4755016, 2.543975, 0, 0.07058824, 1, 1,
0.3556436, -0.405759, 2.033344, 0, 0.0627451, 1, 1,
0.3582425, 0.8579939, -0.8288482, 0, 0.05882353, 1, 1,
0.3584242, 1.137122, 0.7684914, 0, 0.05098039, 1, 1,
0.3589661, -0.608317, 2.585525, 0, 0.04705882, 1, 1,
0.3625381, -1.964301, 3.056794, 0, 0.03921569, 1, 1,
0.3662602, 0.1748192, 1.326853, 0, 0.03529412, 1, 1,
0.3672143, 1.069064, -1.415716, 0, 0.02745098, 1, 1,
0.3698657, -0.01805678, 1.501788, 0, 0.02352941, 1, 1,
0.3716888, -0.3360699, 2.85786, 0, 0.01568628, 1, 1,
0.3728804, 2.171176, 1.209687, 0, 0.01176471, 1, 1,
0.3761561, -1.477631, 0.6813394, 0, 0.003921569, 1, 1,
0.377254, -0.8319311, 2.092938, 0.003921569, 0, 1, 1,
0.3816692, 0.7199999, 0.7406777, 0.007843138, 0, 1, 1,
0.38285, 0.4574565, 0.4132212, 0.01568628, 0, 1, 1,
0.3828793, -0.9175804, 2.889688, 0.01960784, 0, 1, 1,
0.3849384, -0.6290718, 1.399761, 0.02745098, 0, 1, 1,
0.3872683, 0.7834778, -0.8482531, 0.03137255, 0, 1, 1,
0.3880181, -1.25675, 3.481804, 0.03921569, 0, 1, 1,
0.3893749, -1.715282, 1.961217, 0.04313726, 0, 1, 1,
0.3936786, 0.3923667, 0.5652037, 0.05098039, 0, 1, 1,
0.3964657, -1.478493, 2.904837, 0.05490196, 0, 1, 1,
0.4004874, 1.144556, -0.1566375, 0.0627451, 0, 1, 1,
0.4051574, 0.4683338, 0.1140079, 0.06666667, 0, 1, 1,
0.4075412, 1.588741, 1.019602, 0.07450981, 0, 1, 1,
0.4083782, 0.2717295, 1.0059, 0.07843138, 0, 1, 1,
0.4088633, -1.245147, 2.567694, 0.08627451, 0, 1, 1,
0.4097294, -0.9983813, 2.555885, 0.09019608, 0, 1, 1,
0.4180798, -2.239599, 3.97927, 0.09803922, 0, 1, 1,
0.4195722, 0.4793751, 3.185141, 0.1058824, 0, 1, 1,
0.4196689, -0.8635557, 3.268368, 0.1098039, 0, 1, 1,
0.4226179, -1.310512, 4.934834, 0.1176471, 0, 1, 1,
0.4267927, -0.08964983, 1.856403, 0.1215686, 0, 1, 1,
0.4270446, -1.615328, 6.089614, 0.1294118, 0, 1, 1,
0.430091, -0.5771133, 0.548009, 0.1333333, 0, 1, 1,
0.4319364, -1.41644, 2.383982, 0.1411765, 0, 1, 1,
0.4353575, 0.3900706, 0.7129285, 0.145098, 0, 1, 1,
0.435755, -1.273439, 4.442737, 0.1529412, 0, 1, 1,
0.4375656, 0.5172967, 2.121187, 0.1568628, 0, 1, 1,
0.4390227, 0.022152, 2.581963, 0.1647059, 0, 1, 1,
0.4411542, 0.4530279, -1.752853, 0.1686275, 0, 1, 1,
0.4423132, 1.412338, 0.7843783, 0.1764706, 0, 1, 1,
0.4528854, -0.8305567, 1.773421, 0.1803922, 0, 1, 1,
0.4531061, -0.8183467, 3.298073, 0.1882353, 0, 1, 1,
0.4548556, 0.7212772, 1.358947, 0.1921569, 0, 1, 1,
0.4551562, -0.04229203, 2.271197, 0.2, 0, 1, 1,
0.4573165, -0.4203407, 2.784714, 0.2078431, 0, 1, 1,
0.4620611, -0.5042369, 0.8687721, 0.2117647, 0, 1, 1,
0.4623712, -0.3423041, 2.154278, 0.2196078, 0, 1, 1,
0.4634582, -0.521449, 4.100424, 0.2235294, 0, 1, 1,
0.4659745, -0.8931973, 2.661222, 0.2313726, 0, 1, 1,
0.467149, 0.1610931, 1.203411, 0.2352941, 0, 1, 1,
0.4720662, 0.6750485, 1.121823, 0.2431373, 0, 1, 1,
0.4721939, -0.1729369, 3.419152, 0.2470588, 0, 1, 1,
0.4731678, -0.1263245, 2.105395, 0.254902, 0, 1, 1,
0.4843345, -1.059845, 2.400791, 0.2588235, 0, 1, 1,
0.4893947, 1.345412, -0.3036254, 0.2666667, 0, 1, 1,
0.4927348, 0.860354, 0.8243724, 0.2705882, 0, 1, 1,
0.5062089, -0.09323017, 0.9773501, 0.2784314, 0, 1, 1,
0.5065804, 1.065907, 1.114184, 0.282353, 0, 1, 1,
0.5090042, 1.047395, -0.5819421, 0.2901961, 0, 1, 1,
0.5098428, -2.735102, 3.335891, 0.2941177, 0, 1, 1,
0.5100322, -0.2238274, 2.285572, 0.3019608, 0, 1, 1,
0.5110202, 1.516397, 1.785848, 0.3098039, 0, 1, 1,
0.5115913, 0.4095543, 2.21301, 0.3137255, 0, 1, 1,
0.5132613, -0.9739857, 1.283654, 0.3215686, 0, 1, 1,
0.517175, -1.939126, 3.335632, 0.3254902, 0, 1, 1,
0.5222701, -0.2663327, 1.34599, 0.3333333, 0, 1, 1,
0.5254501, 0.9650258, 2.279989, 0.3372549, 0, 1, 1,
0.52902, 0.2620871, 2.147161, 0.345098, 0, 1, 1,
0.530061, 1.80537, 2.036076, 0.3490196, 0, 1, 1,
0.5332232, -0.4763839, 3.302073, 0.3568628, 0, 1, 1,
0.5429452, 0.6858219, 0.6120246, 0.3607843, 0, 1, 1,
0.5497569, -0.5459304, 2.424253, 0.3686275, 0, 1, 1,
0.551539, -0.4225528, 0.1656705, 0.372549, 0, 1, 1,
0.5541412, 0.2014089, 0.1163825, 0.3803922, 0, 1, 1,
0.5600279, -0.9291649, 2.273244, 0.3843137, 0, 1, 1,
0.5652451, -1.314538, 2.195732, 0.3921569, 0, 1, 1,
0.5656107, -0.3879811, 2.604592, 0.3960784, 0, 1, 1,
0.570292, -1.241673, 3.055203, 0.4039216, 0, 1, 1,
0.5773598, -2.905648, 4.329698, 0.4117647, 0, 1, 1,
0.5819895, 0.09091334, 2.12989, 0.4156863, 0, 1, 1,
0.584944, 0.6088649, -0.209727, 0.4235294, 0, 1, 1,
0.5862238, 0.5394384, 1.791941, 0.427451, 0, 1, 1,
0.5872537, -1.682608, 2.666411, 0.4352941, 0, 1, 1,
0.5910097, -0.07980779, 0.7449816, 0.4392157, 0, 1, 1,
0.595093, 1.702882, -0.2098525, 0.4470588, 0, 1, 1,
0.6007888, 0.3424517, 0.8045046, 0.4509804, 0, 1, 1,
0.6038433, 0.07893806, 2.175943, 0.4588235, 0, 1, 1,
0.604349, 0.6344727, 2.742598, 0.4627451, 0, 1, 1,
0.6055007, 0.4155408, 1.344501, 0.4705882, 0, 1, 1,
0.6062214, 0.960399, 0.5638302, 0.4745098, 0, 1, 1,
0.6114009, 0.8329895, -0.5552232, 0.4823529, 0, 1, 1,
0.6114417, 0.02515052, 0.8072333, 0.4862745, 0, 1, 1,
0.6132488, -1.788455, 2.754296, 0.4941176, 0, 1, 1,
0.6163621, 0.04662554, 1.493653, 0.5019608, 0, 1, 1,
0.6180666, 0.7212027, 0.5784201, 0.5058824, 0, 1, 1,
0.61838, 0.4803478, -0.3240803, 0.5137255, 0, 1, 1,
0.6210291, 1.727, 0.1475949, 0.5176471, 0, 1, 1,
0.6212112, -0.6969557, 2.571685, 0.5254902, 0, 1, 1,
0.6217428, 1.446976, 0.7140719, 0.5294118, 0, 1, 1,
0.6225231, -0.9039822, 1.040046, 0.5372549, 0, 1, 1,
0.6264389, -0.6867738, 2.315628, 0.5411765, 0, 1, 1,
0.6266918, 1.248324, 0.5934312, 0.5490196, 0, 1, 1,
0.6273503, -0.4644063, 1.908625, 0.5529412, 0, 1, 1,
0.6300728, -2.19323, 2.975439, 0.5607843, 0, 1, 1,
0.6333454, 0.4189827, 2.366378, 0.5647059, 0, 1, 1,
0.6358299, 0.3037912, 0.02949359, 0.572549, 0, 1, 1,
0.6466805, -1.099656, 1.35692, 0.5764706, 0, 1, 1,
0.6518036, 0.2132143, 3.405888, 0.5843138, 0, 1, 1,
0.6616209, 0.7646891, 1.098865, 0.5882353, 0, 1, 1,
0.6706791, 1.186251, 0.4268246, 0.5960785, 0, 1, 1,
0.6746421, -0.3024972, 1.121416, 0.6039216, 0, 1, 1,
0.6746671, -0.7469776, 1.257725, 0.6078432, 0, 1, 1,
0.6747538, 0.6848174, 1.939816, 0.6156863, 0, 1, 1,
0.6754655, -1.048421, 3.407056, 0.6196079, 0, 1, 1,
0.6798201, -1.262841, 2.338259, 0.627451, 0, 1, 1,
0.6828636, 1.433474, 1.518695, 0.6313726, 0, 1, 1,
0.6872779, -1.113876, 1.758567, 0.6392157, 0, 1, 1,
0.687745, -1.175243, 1.924582, 0.6431373, 0, 1, 1,
0.688222, -1.579922, 2.760863, 0.6509804, 0, 1, 1,
0.6952796, 0.2890329, 0.03455168, 0.654902, 0, 1, 1,
0.7051941, -1.066915, 1.537698, 0.6627451, 0, 1, 1,
0.706336, 0.8576703, 0.8061182, 0.6666667, 0, 1, 1,
0.71161, 0.8340176, 0.159783, 0.6745098, 0, 1, 1,
0.7118191, -0.3027798, 2.345116, 0.6784314, 0, 1, 1,
0.7131178, 1.384677, 0.27194, 0.6862745, 0, 1, 1,
0.7159047, 0.02906319, 1.406444, 0.6901961, 0, 1, 1,
0.7167108, -1.621012, 1.867712, 0.6980392, 0, 1, 1,
0.7168558, -0.07565136, 1.49035, 0.7058824, 0, 1, 1,
0.7175214, 0.5583588, -0.3404942, 0.7098039, 0, 1, 1,
0.7179534, -1.139957, 2.017892, 0.7176471, 0, 1, 1,
0.7315707, 0.535661, 0.5392607, 0.7215686, 0, 1, 1,
0.7340971, 1.544209, 0.5244913, 0.7294118, 0, 1, 1,
0.7360678, -0.7499949, 1.504884, 0.7333333, 0, 1, 1,
0.7518044, 0.4636199, 1.722224, 0.7411765, 0, 1, 1,
0.7522981, -0.2248719, 2.144862, 0.7450981, 0, 1, 1,
0.7595264, -0.001063844, 2.588437, 0.7529412, 0, 1, 1,
0.7756881, 0.2638179, 1.07312, 0.7568628, 0, 1, 1,
0.7770653, -0.2563125, 1.278075, 0.7647059, 0, 1, 1,
0.7858217, -0.4792488, 2.974137, 0.7686275, 0, 1, 1,
0.7861606, -1.006013, 2.344267, 0.7764706, 0, 1, 1,
0.8004618, 0.6559716, 2.433624, 0.7803922, 0, 1, 1,
0.8079425, 0.752215, 2.125041, 0.7882353, 0, 1, 1,
0.8147435, -0.629511, 1.941311, 0.7921569, 0, 1, 1,
0.8235394, -1.07683, 2.111583, 0.8, 0, 1, 1,
0.8277264, 0.4889422, 3.187041, 0.8078431, 0, 1, 1,
0.8301969, 0.6641654, -0.04498922, 0.8117647, 0, 1, 1,
0.8305026, 1.275226, -0.6382423, 0.8196079, 0, 1, 1,
0.8359637, 0.01371743, 1.633132, 0.8235294, 0, 1, 1,
0.84107, -1.416839, 2.514561, 0.8313726, 0, 1, 1,
0.8417365, 1.973178, -1.964244, 0.8352941, 0, 1, 1,
0.8423856, 0.678906, -0.15487, 0.8431373, 0, 1, 1,
0.8425496, 0.3825954, 1.417693, 0.8470588, 0, 1, 1,
0.8474991, -1.173644, 2.83134, 0.854902, 0, 1, 1,
0.848342, 2.014483, 1.198901, 0.8588235, 0, 1, 1,
0.8485311, 1.469745, 0.9954522, 0.8666667, 0, 1, 1,
0.8534985, -1.10842, 4.080824, 0.8705882, 0, 1, 1,
0.8612453, 0.2866044, -0.09173203, 0.8784314, 0, 1, 1,
0.8622935, 0.3381557, 2.315667, 0.8823529, 0, 1, 1,
0.8628925, 0.6613865, 0.5889431, 0.8901961, 0, 1, 1,
0.8646982, -0.2294244, 1.980415, 0.8941177, 0, 1, 1,
0.8750747, 0.4587877, 0.7269709, 0.9019608, 0, 1, 1,
0.8752018, 1.126837, 1.724395, 0.9098039, 0, 1, 1,
0.87652, 1.455402, 1.066481, 0.9137255, 0, 1, 1,
0.8786885, -1.286235, 2.870829, 0.9215686, 0, 1, 1,
0.8821949, 1.374208, -0.2654662, 0.9254902, 0, 1, 1,
0.8828191, 0.3035722, 0.2270362, 0.9333333, 0, 1, 1,
0.8861189, -0.9244869, 2.572663, 0.9372549, 0, 1, 1,
0.8897777, -0.06494182, 1.215546, 0.945098, 0, 1, 1,
0.8963848, 0.2494534, 1.505653, 0.9490196, 0, 1, 1,
0.9039184, -0.7548746, 1.34469, 0.9568627, 0, 1, 1,
0.9090008, 0.4658302, -0.03496796, 0.9607843, 0, 1, 1,
0.9140414, -0.1904549, 1.383834, 0.9686275, 0, 1, 1,
0.9141217, 2.200335, 0.244907, 0.972549, 0, 1, 1,
0.9160839, 1.097082, 1.308288, 0.9803922, 0, 1, 1,
0.9181231, 0.5738045, 1.991594, 0.9843137, 0, 1, 1,
0.9186473, 0.2521102, 1.204455, 0.9921569, 0, 1, 1,
0.927159, 1.109832, -1.012424, 0.9960784, 0, 1, 1,
0.9272085, 0.01968712, 0.6440116, 1, 0, 0.9960784, 1,
0.9368811, -0.4901302, -0.277238, 1, 0, 0.9882353, 1,
0.9376496, 0.6309574, 1.906537, 1, 0, 0.9843137, 1,
0.9393688, 0.3054855, -0.02427855, 1, 0, 0.9764706, 1,
0.9399571, 0.7976679, 0.9162629, 1, 0, 0.972549, 1,
0.9477281, 1.262446, 0.2972039, 1, 0, 0.9647059, 1,
0.9481499, 1.271061, 3.867657, 1, 0, 0.9607843, 1,
0.9491097, 1.926014, 0.9349306, 1, 0, 0.9529412, 1,
0.9501394, 0.7768581, -0.6434125, 1, 0, 0.9490196, 1,
0.9547575, 0.3521605, 2.982051, 1, 0, 0.9411765, 1,
0.9615909, 0.6634333, 0.9601808, 1, 0, 0.9372549, 1,
0.9657169, 0.716553, 0.6589453, 1, 0, 0.9294118, 1,
0.9682548, 1.470301, 2.525927, 1, 0, 0.9254902, 1,
0.9712896, -1.057793, 2.423667, 1, 0, 0.9176471, 1,
0.9714132, -2.826837, 1.451589, 1, 0, 0.9137255, 1,
0.9755343, -0.07367357, 1.367385, 1, 0, 0.9058824, 1,
0.9780263, 0.8540716, 0.2345976, 1, 0, 0.9019608, 1,
0.989898, 0.9731201, 0.7407812, 1, 0, 0.8941177, 1,
0.9935774, 0.3193959, 0.3550458, 1, 0, 0.8862745, 1,
0.9956635, 1.778725, 0.5848863, 1, 0, 0.8823529, 1,
1.000591, 0.1684558, 1.146884, 1, 0, 0.8745098, 1,
1.001579, -0.2262501, -0.6048833, 1, 0, 0.8705882, 1,
1.021912, 0.4285492, 1.604334, 1, 0, 0.8627451, 1,
1.021917, 0.7197183, 2.733111, 1, 0, 0.8588235, 1,
1.027225, -1.348446, 3.180576, 1, 0, 0.8509804, 1,
1.033492, 0.4740652, 1.43483, 1, 0, 0.8470588, 1,
1.033925, 0.3152296, -0.9066905, 1, 0, 0.8392157, 1,
1.034661, -0.5194043, 2.916042, 1, 0, 0.8352941, 1,
1.035028, -0.4679058, 0.8718882, 1, 0, 0.827451, 1,
1.043633, 0.3043464, 0.06023541, 1, 0, 0.8235294, 1,
1.047022, -0.1676071, 2.349713, 1, 0, 0.8156863, 1,
1.04993, 1.646128, -0.7519407, 1, 0, 0.8117647, 1,
1.056368, -0.291834, 2.065214, 1, 0, 0.8039216, 1,
1.061215, 0.1319, 1.512125, 1, 0, 0.7960784, 1,
1.062137, -0.3803808, 2.43852, 1, 0, 0.7921569, 1,
1.082469, 0.2077728, 2.140332, 1, 0, 0.7843137, 1,
1.09138, -0.04142416, 3.356084, 1, 0, 0.7803922, 1,
1.097133, -1.126362, 2.428705, 1, 0, 0.772549, 1,
1.099152, -0.6122099, 2.096187, 1, 0, 0.7686275, 1,
1.109099, -1.058571, 2.013951, 1, 0, 0.7607843, 1,
1.111669, -0.1069083, 2.119843, 1, 0, 0.7568628, 1,
1.117427, -0.4697227, 1.713372, 1, 0, 0.7490196, 1,
1.125047, -0.02024519, 1.753416, 1, 0, 0.7450981, 1,
1.128891, -1.239734, 3.852351, 1, 0, 0.7372549, 1,
1.141942, 1.527129, 1.205977, 1, 0, 0.7333333, 1,
1.142202, 0.6166601, 1.203572, 1, 0, 0.7254902, 1,
1.145902, 0.6310751, 3.934734, 1, 0, 0.7215686, 1,
1.154681, -1.041468, 3.259023, 1, 0, 0.7137255, 1,
1.156466, 0.4156794, 2.018252, 1, 0, 0.7098039, 1,
1.159101, 0.9915226, 0.6900734, 1, 0, 0.7019608, 1,
1.163515, 0.6339256, -1.371757, 1, 0, 0.6941177, 1,
1.165516, 1.097679, 2.032379, 1, 0, 0.6901961, 1,
1.171947, 1.891428, 1.03649, 1, 0, 0.682353, 1,
1.17244, -0.4115615, 0.1930574, 1, 0, 0.6784314, 1,
1.172782, 2.150323, 1.404408, 1, 0, 0.6705883, 1,
1.180548, 2.525083, 0.7342731, 1, 0, 0.6666667, 1,
1.198164, -0.9221206, 1.309149, 1, 0, 0.6588235, 1,
1.200264, 1.575608, 1.583087, 1, 0, 0.654902, 1,
1.208316, -1.708341, 3.778342, 1, 0, 0.6470588, 1,
1.222082, 0.8004634, 1.774842, 1, 0, 0.6431373, 1,
1.222105, 0.6242478, 1.451733, 1, 0, 0.6352941, 1,
1.240985, 1.453056, 1.770773, 1, 0, 0.6313726, 1,
1.247064, -1.23282, 1.436299, 1, 0, 0.6235294, 1,
1.24911, -0.4001793, 0.7350573, 1, 0, 0.6196079, 1,
1.258963, -0.2302028, -0.007045186, 1, 0, 0.6117647, 1,
1.260742, 0.3218166, 3.309459, 1, 0, 0.6078432, 1,
1.264009, 0.3541568, 2.14096, 1, 0, 0.6, 1,
1.271787, 0.74832, 1.919484, 1, 0, 0.5921569, 1,
1.277437, -1.275494, 4.020616, 1, 0, 0.5882353, 1,
1.277783, -0.6325344, 3.027754, 1, 0, 0.5803922, 1,
1.287331, -0.3940559, 1.368224, 1, 0, 0.5764706, 1,
1.296225, 0.4086287, 2.010345, 1, 0, 0.5686275, 1,
1.297631, 0.33197, 1.251725, 1, 0, 0.5647059, 1,
1.301366, 0.4951914, 1.657718, 1, 0, 0.5568628, 1,
1.30723, -0.7569687, 0.9173452, 1, 0, 0.5529412, 1,
1.313372, -0.5236236, 1.605929, 1, 0, 0.5450981, 1,
1.320032, 1.549417, 0.5447437, 1, 0, 0.5411765, 1,
1.324679, 0.6586264, 1.276988, 1, 0, 0.5333334, 1,
1.335355, -0.5508084, 2.570626, 1, 0, 0.5294118, 1,
1.33808, 0.8135442, 1.068844, 1, 0, 0.5215687, 1,
1.354143, 0.9654679, 1.605381, 1, 0, 0.5176471, 1,
1.364564, -1.219758, 3.042773, 1, 0, 0.509804, 1,
1.384143, 0.7773926, 1.197537, 1, 0, 0.5058824, 1,
1.397382, -1.201087, 2.017035, 1, 0, 0.4980392, 1,
1.399643, 0.4710531, 2.324826, 1, 0, 0.4901961, 1,
1.404912, 0.6007038, 1.72776, 1, 0, 0.4862745, 1,
1.405832, 0.1504929, 1.463325, 1, 0, 0.4784314, 1,
1.423871, 0.6082137, 3.263567, 1, 0, 0.4745098, 1,
1.427184, -0.7073969, 0.01810872, 1, 0, 0.4666667, 1,
1.428004, 0.6124044, 1.550194, 1, 0, 0.4627451, 1,
1.436438, -1.253142, 2.076306, 1, 0, 0.454902, 1,
1.448448, -0.1547106, 2.333061, 1, 0, 0.4509804, 1,
1.449128, -1.187445, 1.30166, 1, 0, 0.4431373, 1,
1.450098, -1.120929, 3.54309, 1, 0, 0.4392157, 1,
1.450451, -2.23168, 3.339586, 1, 0, 0.4313726, 1,
1.465855, -0.3609582, 2.382791, 1, 0, 0.427451, 1,
1.474653, 0.2846231, 0.7158754, 1, 0, 0.4196078, 1,
1.474916, 0.1873942, 3.335493, 1, 0, 0.4156863, 1,
1.477361, 1.585736, 0.3658468, 1, 0, 0.4078431, 1,
1.485646, -0.2619416, 1.773491, 1, 0, 0.4039216, 1,
1.495669, 0.09441812, 0.2599964, 1, 0, 0.3960784, 1,
1.499557, 0.1681578, 2.058334, 1, 0, 0.3882353, 1,
1.500001, -0.1882871, 2.419311, 1, 0, 0.3843137, 1,
1.503347, -0.4491431, 3.452349, 1, 0, 0.3764706, 1,
1.50379, 0.7257133, 2.260457, 1, 0, 0.372549, 1,
1.508909, -0.8601919, 3.794501, 1, 0, 0.3647059, 1,
1.509791, -1.02712, 2.305981, 1, 0, 0.3607843, 1,
1.52766, 0.7887008, 1.56701, 1, 0, 0.3529412, 1,
1.530842, 1.057731, 2.210139, 1, 0, 0.3490196, 1,
1.538834, 0.4790974, 1.358495, 1, 0, 0.3411765, 1,
1.552737, 0.4520326, 1.284189, 1, 0, 0.3372549, 1,
1.559156, 0.6701719, 0.4544066, 1, 0, 0.3294118, 1,
1.562779, 1.071515, 1.46622, 1, 0, 0.3254902, 1,
1.563174, 0.2706752, 2.234774, 1, 0, 0.3176471, 1,
1.603611, 0.3607451, 3.018116, 1, 0, 0.3137255, 1,
1.609124, 0.6571452, 0.4023967, 1, 0, 0.3058824, 1,
1.617274, 1.311697, 0.4724484, 1, 0, 0.2980392, 1,
1.622697, -0.3632185, 2.321905, 1, 0, 0.2941177, 1,
1.624827, 1.251426, 1.307975, 1, 0, 0.2862745, 1,
1.62644, 0.1698763, 0.3810798, 1, 0, 0.282353, 1,
1.639969, -1.381356, 1.316753, 1, 0, 0.2745098, 1,
1.642789, 0.3033116, 2.032547, 1, 0, 0.2705882, 1,
1.651873, -0.811157, 1.229954, 1, 0, 0.2627451, 1,
1.662688, 0.07220424, 0.6975821, 1, 0, 0.2588235, 1,
1.672591, -0.280358, 0.679692, 1, 0, 0.2509804, 1,
1.673112, 1.247485, 1.091405, 1, 0, 0.2470588, 1,
1.691612, 1.775571, 2.488221, 1, 0, 0.2392157, 1,
1.7202, -0.3582807, 0.6054675, 1, 0, 0.2352941, 1,
1.751793, -0.2085021, 0.3281591, 1, 0, 0.227451, 1,
1.773759, 0.4753501, 0.2077354, 1, 0, 0.2235294, 1,
1.774279, -0.8663937, 2.036783, 1, 0, 0.2156863, 1,
1.796357, -0.3674332, 1.087298, 1, 0, 0.2117647, 1,
1.823367, -0.6272345, 1.924769, 1, 0, 0.2039216, 1,
1.836951, -1.143482, 1.505101, 1, 0, 0.1960784, 1,
1.85072, 0.2730548, 1.28573, 1, 0, 0.1921569, 1,
1.864569, -1.392026, 2.398017, 1, 0, 0.1843137, 1,
1.865072, 1.113692, 0.1821794, 1, 0, 0.1803922, 1,
1.873023, 1.460016, -1.802683, 1, 0, 0.172549, 1,
1.875298, -0.1315752, 0.4118682, 1, 0, 0.1686275, 1,
1.881841, 0.8665005, 0.4506578, 1, 0, 0.1607843, 1,
1.890581, -0.7934884, 2.492688, 1, 0, 0.1568628, 1,
1.908738, -1.005655, 1.245269, 1, 0, 0.1490196, 1,
1.966955, -0.5041294, 0.5813535, 1, 0, 0.145098, 1,
1.981865, -1.733078, 2.402325, 1, 0, 0.1372549, 1,
1.983593, -0.4162472, 2.001167, 1, 0, 0.1333333, 1,
2.024642, 1.00253, -0.2467001, 1, 0, 0.1254902, 1,
2.041777, -0.6816209, 2.365844, 1, 0, 0.1215686, 1,
2.059886, -0.3133783, 0.1836544, 1, 0, 0.1137255, 1,
2.110609, -0.28814, 2.073735, 1, 0, 0.1098039, 1,
2.11788, 0.5800742, 2.180348, 1, 0, 0.1019608, 1,
2.120436, 0.4865671, 2.092105, 1, 0, 0.09411765, 1,
2.135055, 1.674017, -0.430814, 1, 0, 0.09019608, 1,
2.194618, 0.5362645, -0.4664188, 1, 0, 0.08235294, 1,
2.203939, 0.01148332, -0.06603182, 1, 0, 0.07843138, 1,
2.259268, -2.019024, 4.086143, 1, 0, 0.07058824, 1,
2.264808, 0.04706791, 0.4842393, 1, 0, 0.06666667, 1,
2.268412, 0.9332998, 2.418112, 1, 0, 0.05882353, 1,
2.324356, 0.7314651, 2.256458, 1, 0, 0.05490196, 1,
2.35731, 0.06109832, 1.806288, 1, 0, 0.04705882, 1,
2.395982, 0.7929322, 2.942547, 1, 0, 0.04313726, 1,
2.521045, 0.08070112, 2.437004, 1, 0, 0.03529412, 1,
2.550345, -0.6557451, 1.890841, 1, 0, 0.03137255, 1,
2.597942, -0.6766798, -0.7434143, 1, 0, 0.02352941, 1,
2.661307, 0.7392638, 1.027376, 1, 0, 0.01960784, 1,
2.724257, -0.8017153, 1.776633, 1, 0, 0.01176471, 1,
2.742123, -1.297389, 3.611855, 1, 0, 0.007843138, 1
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
-0.1979316, -3.921832, -7.092842, 0, -0.5, 0.5, 0.5,
-0.1979316, -3.921832, -7.092842, 1, -0.5, 0.5, 0.5,
-0.1979316, -3.921832, -7.092842, 1, 1.5, 0.5, 0.5,
-0.1979316, -3.921832, -7.092842, 0, 1.5, 0.5, 0.5
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
-4.134665, 0.09194279, -7.092842, 0, -0.5, 0.5, 0.5,
-4.134665, 0.09194279, -7.092842, 1, -0.5, 0.5, 0.5,
-4.134665, 0.09194279, -7.092842, 1, 1.5, 0.5, 0.5,
-4.134665, 0.09194279, -7.092842, 0, 1.5, 0.5, 0.5
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
-4.134665, -3.921832, 0.4536772, 0, -0.5, 0.5, 0.5,
-4.134665, -3.921832, 0.4536772, 1, -0.5, 0.5, 0.5,
-4.134665, -3.921832, 0.4536772, 1, 1.5, 0.5, 0.5,
-4.134665, -3.921832, 0.4536772, 0, 1.5, 0.5, 0.5
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
-3, -2.995576, -5.351337,
2, -2.995576, -5.351337,
-3, -2.995576, -5.351337,
-3, -3.149952, -5.641588,
-2, -2.995576, -5.351337,
-2, -3.149952, -5.641588,
-1, -2.995576, -5.351337,
-1, -3.149952, -5.641588,
0, -2.995576, -5.351337,
0, -3.149952, -5.641588,
1, -2.995576, -5.351337,
1, -3.149952, -5.641588,
2, -2.995576, -5.351337,
2, -3.149952, -5.641588
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
-3, -3.458704, -6.22209, 0, -0.5, 0.5, 0.5,
-3, -3.458704, -6.22209, 1, -0.5, 0.5, 0.5,
-3, -3.458704, -6.22209, 1, 1.5, 0.5, 0.5,
-3, -3.458704, -6.22209, 0, 1.5, 0.5, 0.5,
-2, -3.458704, -6.22209, 0, -0.5, 0.5, 0.5,
-2, -3.458704, -6.22209, 1, -0.5, 0.5, 0.5,
-2, -3.458704, -6.22209, 1, 1.5, 0.5, 0.5,
-2, -3.458704, -6.22209, 0, 1.5, 0.5, 0.5,
-1, -3.458704, -6.22209, 0, -0.5, 0.5, 0.5,
-1, -3.458704, -6.22209, 1, -0.5, 0.5, 0.5,
-1, -3.458704, -6.22209, 1, 1.5, 0.5, 0.5,
-1, -3.458704, -6.22209, 0, 1.5, 0.5, 0.5,
0, -3.458704, -6.22209, 0, -0.5, 0.5, 0.5,
0, -3.458704, -6.22209, 1, -0.5, 0.5, 0.5,
0, -3.458704, -6.22209, 1, 1.5, 0.5, 0.5,
0, -3.458704, -6.22209, 0, 1.5, 0.5, 0.5,
1, -3.458704, -6.22209, 0, -0.5, 0.5, 0.5,
1, -3.458704, -6.22209, 1, -0.5, 0.5, 0.5,
1, -3.458704, -6.22209, 1, 1.5, 0.5, 0.5,
1, -3.458704, -6.22209, 0, 1.5, 0.5, 0.5,
2, -3.458704, -6.22209, 0, -0.5, 0.5, 0.5,
2, -3.458704, -6.22209, 1, -0.5, 0.5, 0.5,
2, -3.458704, -6.22209, 1, 1.5, 0.5, 0.5,
2, -3.458704, -6.22209, 0, 1.5, 0.5, 0.5
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
-3.226187, -2, -5.351337,
-3.226187, 3, -5.351337,
-3.226187, -2, -5.351337,
-3.3776, -2, -5.641588,
-3.226187, -1, -5.351337,
-3.3776, -1, -5.641588,
-3.226187, 0, -5.351337,
-3.3776, 0, -5.641588,
-3.226187, 1, -5.351337,
-3.3776, 1, -5.641588,
-3.226187, 2, -5.351337,
-3.3776, 2, -5.641588,
-3.226187, 3, -5.351337,
-3.3776, 3, -5.641588
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
"2",
"3"
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
-3.680426, -2, -6.22209, 0, -0.5, 0.5, 0.5,
-3.680426, -2, -6.22209, 1, -0.5, 0.5, 0.5,
-3.680426, -2, -6.22209, 1, 1.5, 0.5, 0.5,
-3.680426, -2, -6.22209, 0, 1.5, 0.5, 0.5,
-3.680426, -1, -6.22209, 0, -0.5, 0.5, 0.5,
-3.680426, -1, -6.22209, 1, -0.5, 0.5, 0.5,
-3.680426, -1, -6.22209, 1, 1.5, 0.5, 0.5,
-3.680426, -1, -6.22209, 0, 1.5, 0.5, 0.5,
-3.680426, 0, -6.22209, 0, -0.5, 0.5, 0.5,
-3.680426, 0, -6.22209, 1, -0.5, 0.5, 0.5,
-3.680426, 0, -6.22209, 1, 1.5, 0.5, 0.5,
-3.680426, 0, -6.22209, 0, 1.5, 0.5, 0.5,
-3.680426, 1, -6.22209, 0, -0.5, 0.5, 0.5,
-3.680426, 1, -6.22209, 1, -0.5, 0.5, 0.5,
-3.680426, 1, -6.22209, 1, 1.5, 0.5, 0.5,
-3.680426, 1, -6.22209, 0, 1.5, 0.5, 0.5,
-3.680426, 2, -6.22209, 0, -0.5, 0.5, 0.5,
-3.680426, 2, -6.22209, 1, -0.5, 0.5, 0.5,
-3.680426, 2, -6.22209, 1, 1.5, 0.5, 0.5,
-3.680426, 2, -6.22209, 0, 1.5, 0.5, 0.5,
-3.680426, 3, -6.22209, 0, -0.5, 0.5, 0.5,
-3.680426, 3, -6.22209, 1, -0.5, 0.5, 0.5,
-3.680426, 3, -6.22209, 1, 1.5, 0.5, 0.5,
-3.680426, 3, -6.22209, 0, 1.5, 0.5, 0.5
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
-3.226187, -2.995576, -4,
-3.226187, -2.995576, 6,
-3.226187, -2.995576, -4,
-3.3776, -3.149952, -4,
-3.226187, -2.995576, -2,
-3.3776, -3.149952, -2,
-3.226187, -2.995576, 0,
-3.3776, -3.149952, 0,
-3.226187, -2.995576, 2,
-3.3776, -3.149952, 2,
-3.226187, -2.995576, 4,
-3.3776, -3.149952, 4,
-3.226187, -2.995576, 6,
-3.3776, -3.149952, 6
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
"4",
"6"
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
-3.680426, -3.458704, -4, 0, -0.5, 0.5, 0.5,
-3.680426, -3.458704, -4, 1, -0.5, 0.5, 0.5,
-3.680426, -3.458704, -4, 1, 1.5, 0.5, 0.5,
-3.680426, -3.458704, -4, 0, 1.5, 0.5, 0.5,
-3.680426, -3.458704, -2, 0, -0.5, 0.5, 0.5,
-3.680426, -3.458704, -2, 1, -0.5, 0.5, 0.5,
-3.680426, -3.458704, -2, 1, 1.5, 0.5, 0.5,
-3.680426, -3.458704, -2, 0, 1.5, 0.5, 0.5,
-3.680426, -3.458704, 0, 0, -0.5, 0.5, 0.5,
-3.680426, -3.458704, 0, 1, -0.5, 0.5, 0.5,
-3.680426, -3.458704, 0, 1, 1.5, 0.5, 0.5,
-3.680426, -3.458704, 0, 0, 1.5, 0.5, 0.5,
-3.680426, -3.458704, 2, 0, -0.5, 0.5, 0.5,
-3.680426, -3.458704, 2, 1, -0.5, 0.5, 0.5,
-3.680426, -3.458704, 2, 1, 1.5, 0.5, 0.5,
-3.680426, -3.458704, 2, 0, 1.5, 0.5, 0.5,
-3.680426, -3.458704, 4, 0, -0.5, 0.5, 0.5,
-3.680426, -3.458704, 4, 1, -0.5, 0.5, 0.5,
-3.680426, -3.458704, 4, 1, 1.5, 0.5, 0.5,
-3.680426, -3.458704, 4, 0, 1.5, 0.5, 0.5,
-3.680426, -3.458704, 6, 0, -0.5, 0.5, 0.5,
-3.680426, -3.458704, 6, 1, -0.5, 0.5, 0.5,
-3.680426, -3.458704, 6, 1, 1.5, 0.5, 0.5,
-3.680426, -3.458704, 6, 0, 1.5, 0.5, 0.5
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
-3.226187, -2.995576, -5.351337,
-3.226187, 3.179462, -5.351337,
-3.226187, -2.995576, 6.258692,
-3.226187, 3.179462, 6.258692,
-3.226187, -2.995576, -5.351337,
-3.226187, -2.995576, 6.258692,
-3.226187, 3.179462, -5.351337,
-3.226187, 3.179462, 6.258692,
-3.226187, -2.995576, -5.351337,
2.830324, -2.995576, -5.351337,
-3.226187, -2.995576, 6.258692,
2.830324, -2.995576, 6.258692,
-3.226187, 3.179462, -5.351337,
2.830324, 3.179462, -5.351337,
-3.226187, 3.179462, 6.258692,
2.830324, 3.179462, 6.258692,
2.830324, -2.995576, -5.351337,
2.830324, 3.179462, -5.351337,
2.830324, -2.995576, 6.258692,
2.830324, 3.179462, 6.258692,
2.830324, -2.995576, -5.351337,
2.830324, -2.995576, 6.258692,
2.830324, 3.179462, -5.351337,
2.830324, 3.179462, 6.258692
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
var radius = 7.730837;
var distance = 34.39537;
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
mvMatrix.translate( 0.1979316, -0.09194279, -0.4536772 );
mvMatrix.scale( 1.380123, 1.353633, 0.7199579 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.39537);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
PHENYLENEDIAMINE<-read.table("PHENYLENEDIAMINE.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-PHENYLENEDIAMINE$V2
```

```
## Error in eval(expr, envir, enclos): object 'PHENYLENEDIAMINE' not found
```

```r
y<-PHENYLENEDIAMINE$V3
```

```
## Error in eval(expr, envir, enclos): object 'PHENYLENEDIAMINE' not found
```

```r
z<-PHENYLENEDIAMINE$V4
```

```
## Error in eval(expr, envir, enclos): object 'PHENYLENEDIAMINE' not found
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
-3.137986, 0.2132914, -2.990979, 0, 0, 1, 1, 1,
-2.878238, -0.2045636, -1.977569, 1, 0, 0, 1, 1,
-2.685277, -1.592169, -3.009102, 1, 0, 0, 1, 1,
-2.657649, -0.4257789, -0.8591976, 1, 0, 0, 1, 1,
-2.618086, -0.6128535, -0.6638344, 1, 0, 0, 1, 1,
-2.611193, 0.2084679, -3.102387, 1, 0, 0, 1, 1,
-2.474082, 1.110102, 1.407475, 0, 0, 0, 1, 1,
-2.401759, -1.770921, -1.872762, 0, 0, 0, 1, 1,
-2.385123, 0.9732676, -2.357069, 0, 0, 0, 1, 1,
-2.373105, -1.201331, -2.746061, 0, 0, 0, 1, 1,
-2.36647, 1.088656, -1.327221, 0, 0, 0, 1, 1,
-2.331573, -1.464755, -1.27788, 0, 0, 0, 1, 1,
-2.315916, 1.637635, -2.599977, 0, 0, 0, 1, 1,
-2.294502, 0.2158554, -1.440554, 1, 1, 1, 1, 1,
-2.273584, -0.4225682, -1.895331, 1, 1, 1, 1, 1,
-2.269641, -0.783181, 0.0520199, 1, 1, 1, 1, 1,
-2.265253, -0.3374055, 0.8875881, 1, 1, 1, 1, 1,
-2.248496, 1.299684, -0.8088439, 1, 1, 1, 1, 1,
-2.135409, -0.8710279, -0.9783009, 1, 1, 1, 1, 1,
-2.122802, -1.712129, -1.692277, 1, 1, 1, 1, 1,
-2.122211, 2.380901, -1.72085, 1, 1, 1, 1, 1,
-2.098483, -0.1723956, -3.173709, 1, 1, 1, 1, 1,
-2.085912, -0.003262625, -2.316844, 1, 1, 1, 1, 1,
-2.062886, -1.345407, -0.1524498, 1, 1, 1, 1, 1,
-2.052096, -1.978725, -0.2467782, 1, 1, 1, 1, 1,
-2.008118, 1.136703, -0.1375493, 1, 1, 1, 1, 1,
-1.98913, -0.8314003, -3.212907, 1, 1, 1, 1, 1,
-1.988164, 0.205628, -1.94847, 1, 1, 1, 1, 1,
-1.915483, 1.643025, -1.001915, 0, 0, 1, 1, 1,
-1.897737, -0.9506679, -1.565884, 1, 0, 0, 1, 1,
-1.893176, 1.655079, -0.2929803, 1, 0, 0, 1, 1,
-1.889839, -0.6146518, -1.980146, 1, 0, 0, 1, 1,
-1.885412, 0.3413708, -1.1139, 1, 0, 0, 1, 1,
-1.885205, -0.8542263, -2.857825, 1, 0, 0, 1, 1,
-1.879991, 2.805516, -1.180362, 0, 0, 0, 1, 1,
-1.844923, -1.38321, -3.241712, 0, 0, 0, 1, 1,
-1.843808, -1.11033, -2.183434, 0, 0, 0, 1, 1,
-1.831663, 0.2962402, -2.477519, 0, 0, 0, 1, 1,
-1.831101, 0.08529544, 0.0545145, 0, 0, 0, 1, 1,
-1.830754, 1.134874, 0.4564515, 0, 0, 0, 1, 1,
-1.829495, -0.9519522, -2.311101, 0, 0, 0, 1, 1,
-1.822166, -0.2101877, -3.360872, 1, 1, 1, 1, 1,
-1.794224, -0.4235356, -0.534067, 1, 1, 1, 1, 1,
-1.787143, -0.4108475, -3.529306, 1, 1, 1, 1, 1,
-1.772514, 0.1176834, -1.838462, 1, 1, 1, 1, 1,
-1.769048, -0.1128983, -1.00237, 1, 1, 1, 1, 1,
-1.767661, -1.700743, -3.047078, 1, 1, 1, 1, 1,
-1.758349, 0.7022184, -1.103208, 1, 1, 1, 1, 1,
-1.742937, 1.415061, -1.05312, 1, 1, 1, 1, 1,
-1.735767, 3.089534, 0.2218011, 1, 1, 1, 1, 1,
-1.735649, 0.9046939, -1.035529, 1, 1, 1, 1, 1,
-1.735089, -0.0001832453, -2.604674, 1, 1, 1, 1, 1,
-1.715622, 0.1508376, -2.123537, 1, 1, 1, 1, 1,
-1.707062, -0.4855317, -2.031875, 1, 1, 1, 1, 1,
-1.706502, 0.004439224, -0.2384792, 1, 1, 1, 1, 1,
-1.702831, -0.1631691, -2.56846, 1, 1, 1, 1, 1,
-1.685731, 0.5073493, -0.8812608, 0, 0, 1, 1, 1,
-1.68078, 1.320586, -1.472637, 1, 0, 0, 1, 1,
-1.670549, -1.97113, -3.593583, 1, 0, 0, 1, 1,
-1.66526, -0.8580654, -3.325929, 1, 0, 0, 1, 1,
-1.658309, 0.3345622, -1.401375, 1, 0, 0, 1, 1,
-1.654322, 0.06425286, -0.469415, 1, 0, 0, 1, 1,
-1.623835, -0.5377551, -0.2172148, 0, 0, 0, 1, 1,
-1.607391, -1.017265, -1.475691, 0, 0, 0, 1, 1,
-1.589394, 0.5492684, -2.920236, 0, 0, 0, 1, 1,
-1.5884, -1.070198, -3.030364, 0, 0, 0, 1, 1,
-1.585994, 0.7418357, -1.110756, 0, 0, 0, 1, 1,
-1.585117, 0.3705864, -0.1272886, 0, 0, 0, 1, 1,
-1.581454, -0.1295575, -3.047132, 0, 0, 0, 1, 1,
-1.566574, -1.522807, -3.206119, 1, 1, 1, 1, 1,
-1.550217, -0.1938494, -1.810082, 1, 1, 1, 1, 1,
-1.539443, 2.222599, 0.3594292, 1, 1, 1, 1, 1,
-1.539075, -0.8121764, -1.081786, 1, 1, 1, 1, 1,
-1.534393, -1.563204, -2.652833, 1, 1, 1, 1, 1,
-1.534392, 1.457987, -2.202651, 1, 1, 1, 1, 1,
-1.528013, -0.4582852, -0.4823263, 1, 1, 1, 1, 1,
-1.512693, 1.170127, 0.3593144, 1, 1, 1, 1, 1,
-1.506274, 0.5632914, -1.083724, 1, 1, 1, 1, 1,
-1.498754, -0.7469127, -2.250458, 1, 1, 1, 1, 1,
-1.49729, -0.5032153, -0.3578826, 1, 1, 1, 1, 1,
-1.495335, 1.207604, -0.02820833, 1, 1, 1, 1, 1,
-1.470535, 0.5772145, -2.073585, 1, 1, 1, 1, 1,
-1.466598, -0.5737586, -4.357762, 1, 1, 1, 1, 1,
-1.465286, 0.5939011, 0.5901799, 1, 1, 1, 1, 1,
-1.46469, -1.019902, -2.064177, 0, 0, 1, 1, 1,
-1.452353, -0.02849277, -2.383525, 1, 0, 0, 1, 1,
-1.447658, -0.8952366, -2.013, 1, 0, 0, 1, 1,
-1.442823, 0.2102377, 0.9308877, 1, 0, 0, 1, 1,
-1.436375, -1.124945, -0.3158019, 1, 0, 0, 1, 1,
-1.419601, 0.7059588, -1.674746, 1, 0, 0, 1, 1,
-1.393256, 2.141488, -1.192488, 0, 0, 0, 1, 1,
-1.385012, 0.722661, -0.2846939, 0, 0, 0, 1, 1,
-1.384618, 0.5742807, -1.664894, 0, 0, 0, 1, 1,
-1.383014, -1.025771, -1.664931, 0, 0, 0, 1, 1,
-1.377285, -1.530973, -3.81364, 0, 0, 0, 1, 1,
-1.376831, -0.6268076, -2.3629, 0, 0, 0, 1, 1,
-1.373526, 0.7392012, -0.2154819, 0, 0, 0, 1, 1,
-1.365822, -0.3954158, -1.164458, 1, 1, 1, 1, 1,
-1.363664, -0.008375796, -1.714719, 1, 1, 1, 1, 1,
-1.359385, 0.2540915, -1.790866, 1, 1, 1, 1, 1,
-1.345107, -1.135914, -2.208035, 1, 1, 1, 1, 1,
-1.34209, 0.759805, 0.8322035, 1, 1, 1, 1, 1,
-1.34208, 0.09674399, -1.835292, 1, 1, 1, 1, 1,
-1.338287, -0.6603875, -1.600259, 1, 1, 1, 1, 1,
-1.332855, -0.6456817, -3.488077, 1, 1, 1, 1, 1,
-1.326214, 0.6493718, -2.078588, 1, 1, 1, 1, 1,
-1.324516, -0.4545339, -1.601544, 1, 1, 1, 1, 1,
-1.322559, 0.400839, -2.720569, 1, 1, 1, 1, 1,
-1.317206, -1.4579, -1.19316, 1, 1, 1, 1, 1,
-1.314227, -0.918065, -3.007679, 1, 1, 1, 1, 1,
-1.312934, -1.672789, -1.786856, 1, 1, 1, 1, 1,
-1.308014, -1.760335, -2.349672, 1, 1, 1, 1, 1,
-1.301827, -0.9048035, -1.33931, 0, 0, 1, 1, 1,
-1.288011, -0.3107345, 0.05887362, 1, 0, 0, 1, 1,
-1.284204, 0.4868768, -0.5949517, 1, 0, 0, 1, 1,
-1.278322, 1.419888, 0.9646378, 1, 0, 0, 1, 1,
-1.267506, 0.1673035, -1.181119, 1, 0, 0, 1, 1,
-1.265499, -0.4562594, -3.040679, 1, 0, 0, 1, 1,
-1.263983, -0.1083406, -0.8698344, 0, 0, 0, 1, 1,
-1.255743, -0.7466636, -3.385541, 0, 0, 0, 1, 1,
-1.254357, -1.795827, -0.3048391, 0, 0, 0, 1, 1,
-1.24744, -1.908457, -1.562952, 0, 0, 0, 1, 1,
-1.232667, -0.1291421, -1.900715, 0, 0, 0, 1, 1,
-1.223169, 0.7260852, 0.04863425, 0, 0, 0, 1, 1,
-1.209232, -2.23192, -2.969519, 0, 0, 0, 1, 1,
-1.203024, 0.390259, -0.8616984, 1, 1, 1, 1, 1,
-1.2012, 0.6711296, -1.024641, 1, 1, 1, 1, 1,
-1.200229, 0.5136682, -2.497079, 1, 1, 1, 1, 1,
-1.197823, 1.641756, 0.8673577, 1, 1, 1, 1, 1,
-1.196203, -1.620328, -2.596496, 1, 1, 1, 1, 1,
-1.196119, -0.7904406, -4.545223, 1, 1, 1, 1, 1,
-1.192553, 0.7168052, -0.3963202, 1, 1, 1, 1, 1,
-1.190726, 0.7723289, -1.03774, 1, 1, 1, 1, 1,
-1.186471, -0.2181477, -1.142601, 1, 1, 1, 1, 1,
-1.184379, -0.9538289, -2.88638, 1, 1, 1, 1, 1,
-1.183604, -0.364352, -0.641465, 1, 1, 1, 1, 1,
-1.17324, 0.03850475, -0.6374388, 1, 1, 1, 1, 1,
-1.173103, 1.060497, -0.08713547, 1, 1, 1, 1, 1,
-1.166014, -1.265765, -3.217721, 1, 1, 1, 1, 1,
-1.165082, -0.6976889, -0.8520723, 1, 1, 1, 1, 1,
-1.15894, 0.6136131, -2.042307, 0, 0, 1, 1, 1,
-1.157937, 0.7678935, -2.069811, 1, 0, 0, 1, 1,
-1.156047, -1.574036, -1.39151, 1, 0, 0, 1, 1,
-1.149694, 1.678014, -1.530305, 1, 0, 0, 1, 1,
-1.144538, 1.113278, 0.9266801, 1, 0, 0, 1, 1,
-1.143517, 1.063137, 0.5191931, 1, 0, 0, 1, 1,
-1.138643, -0.05294325, -2.227988, 0, 0, 0, 1, 1,
-1.134322, 0.9036393, -1.390778, 0, 0, 0, 1, 1,
-1.125129, 0.6938843, -0.670404, 0, 0, 0, 1, 1,
-1.124005, -1.3582, -3.017654, 0, 0, 0, 1, 1,
-1.123548, 1.975055, -0.9613173, 0, 0, 0, 1, 1,
-1.122024, -0.7592461, -2.081376, 0, 0, 0, 1, 1,
-1.119329, 0.277568, -3.084836, 0, 0, 0, 1, 1,
-1.118668, -0.4969992, -2.130388, 1, 1, 1, 1, 1,
-1.117378, 0.9113653, -2.226472, 1, 1, 1, 1, 1,
-1.11312, -0.5258586, -1.366794, 1, 1, 1, 1, 1,
-1.100599, -0.7730228, -2.204135, 1, 1, 1, 1, 1,
-1.092119, -1.530307, -3.015097, 1, 1, 1, 1, 1,
-1.081398, -2.161934, -3.172746, 1, 1, 1, 1, 1,
-1.077521, -0.4847121, -2.342229, 1, 1, 1, 1, 1,
-1.070687, -0.3024507, -0.5412093, 1, 1, 1, 1, 1,
-1.069068, 1.899704, 1.800971, 1, 1, 1, 1, 1,
-1.063211, -0.4401148, -2.543992, 1, 1, 1, 1, 1,
-1.061357, -0.4675829, -2.077483, 1, 1, 1, 1, 1,
-1.060691, -2.075089, -1.406073, 1, 1, 1, 1, 1,
-1.057558, 0.08575093, -0.09488805, 1, 1, 1, 1, 1,
-1.05482, 0.9267503, -1.80898, 1, 1, 1, 1, 1,
-1.048198, 0.4544391, -2.059078, 1, 1, 1, 1, 1,
-1.046361, 0.2155754, -2.421845, 0, 0, 1, 1, 1,
-1.038295, 0.472983, -0.89509, 1, 0, 0, 1, 1,
-1.036175, 0.7332529, -1.130843, 1, 0, 0, 1, 1,
-1.030443, -1.001288, -0.598341, 1, 0, 0, 1, 1,
-1.021591, -0.4441107, -1.019126, 1, 0, 0, 1, 1,
-1.014131, -0.3440414, -2.40065, 1, 0, 0, 1, 1,
-1.010283, 0.04560686, -1.273809, 0, 0, 0, 1, 1,
-1.009306, -0.4057147, -2.902161, 0, 0, 0, 1, 1,
-1.003499, -0.7745439, -1.588264, 0, 0, 0, 1, 1,
-0.9962087, 1.477088, -0.9811398, 0, 0, 0, 1, 1,
-0.9943582, -0.7001027, -2.206125, 0, 0, 0, 1, 1,
-0.991766, -0.0986465, -1.568881, 0, 0, 0, 1, 1,
-0.9834676, -0.6616399, -0.5700623, 0, 0, 0, 1, 1,
-0.9770579, 0.7041274, -1.628381, 1, 1, 1, 1, 1,
-0.95876, 0.5909427, -2.049682, 1, 1, 1, 1, 1,
-0.9577581, -1.575795, -1.823163, 1, 1, 1, 1, 1,
-0.9571001, -2.248351, -3.055654, 1, 1, 1, 1, 1,
-0.9554906, 0.5612831, -1.451309, 1, 1, 1, 1, 1,
-0.9538012, 0.7442099, -1.228828, 1, 1, 1, 1, 1,
-0.947987, 2.124685, -0.4737037, 1, 1, 1, 1, 1,
-0.9430661, 0.1755481, -1.211633, 1, 1, 1, 1, 1,
-0.9419377, 1.16954, -2.379961, 1, 1, 1, 1, 1,
-0.9368809, 0.4227117, -3.105099, 1, 1, 1, 1, 1,
-0.9337518, 1.276201, -0.4331304, 1, 1, 1, 1, 1,
-0.9329328, -1.525011, -2.21498, 1, 1, 1, 1, 1,
-0.9210733, -1.376435, -2.851118, 1, 1, 1, 1, 1,
-0.9173496, 0.6140455, -0.9923328, 1, 1, 1, 1, 1,
-0.9160548, -0.2145467, -1.939241, 1, 1, 1, 1, 1,
-0.9157547, 0.7671859, 0.4486592, 0, 0, 1, 1, 1,
-0.9148756, 0.01226375, -1.404094, 1, 0, 0, 1, 1,
-0.9136679, 0.7297235, -1.118475, 1, 0, 0, 1, 1,
-0.9094909, 1.475909, -0.5437725, 1, 0, 0, 1, 1,
-0.9080907, -2.325784, -2.75596, 1, 0, 0, 1, 1,
-0.8929211, 1.091575, -1.745017, 1, 0, 0, 1, 1,
-0.8927578, 0.3306656, -2.777274, 0, 0, 0, 1, 1,
-0.8868417, -1.091704, -1.882404, 0, 0, 0, 1, 1,
-0.8865759, -0.5691411, -2.283043, 0, 0, 0, 1, 1,
-0.8853893, 2.198066, -0.9439769, 0, 0, 0, 1, 1,
-0.873946, -0.3457318, -2.731822, 0, 0, 0, 1, 1,
-0.8736634, -0.1403615, -1.743616, 0, 0, 0, 1, 1,
-0.8636848, 0.8439363, -2.032232, 0, 0, 0, 1, 1,
-0.8606299, 0.681771, -0.9425358, 1, 1, 1, 1, 1,
-0.8572682, -0.627389, -2.700489, 1, 1, 1, 1, 1,
-0.8560883, 0.2306671, -0.02395668, 1, 1, 1, 1, 1,
-0.8550657, -1.650858, -2.755219, 1, 1, 1, 1, 1,
-0.8513513, -1.165147, -0.06006489, 1, 1, 1, 1, 1,
-0.8513207, -0.7530468, -3.207842, 1, 1, 1, 1, 1,
-0.8410195, -0.5225636, -0.3165223, 1, 1, 1, 1, 1,
-0.8356531, -0.2489316, -2.11133, 1, 1, 1, 1, 1,
-0.8288292, -0.7537985, -1.815867, 1, 1, 1, 1, 1,
-0.8275943, 0.3477384, -0.7203061, 1, 1, 1, 1, 1,
-0.8230782, 0.1718006, -1.121847, 1, 1, 1, 1, 1,
-0.8195682, 0.6577259, -0.9811594, 1, 1, 1, 1, 1,
-0.8194692, -1.87569, -3.760956, 1, 1, 1, 1, 1,
-0.8191405, -0.07203944, -0.2266907, 1, 1, 1, 1, 1,
-0.8095834, 0.9912701, 0.3130687, 1, 1, 1, 1, 1,
-0.8093419, -0.2001902, -0.07973564, 0, 0, 1, 1, 1,
-0.8076841, 0.06794792, -0.6794305, 1, 0, 0, 1, 1,
-0.8068005, 0.2355407, -2.67031, 1, 0, 0, 1, 1,
-0.8066847, 1.774786, -0.005996253, 1, 0, 0, 1, 1,
-0.8047155, 1.09505, -0.9299397, 1, 0, 0, 1, 1,
-0.8038017, -1.041089, -3.562703, 1, 0, 0, 1, 1,
-0.8037959, -0.362485, -1.812693, 0, 0, 0, 1, 1,
-0.7973839, 1.1077, -0.821462, 0, 0, 0, 1, 1,
-0.7924103, 0.5743629, -0.599904, 0, 0, 0, 1, 1,
-0.7895964, 0.5010874, -1.670657, 0, 0, 0, 1, 1,
-0.7859042, -0.2858479, -2.674375, 0, 0, 0, 1, 1,
-0.7844658, -0.04151557, -2.553235, 0, 0, 0, 1, 1,
-0.7842021, 1.643442, -0.9285601, 0, 0, 0, 1, 1,
-0.7817698, 1.944147, 0.798357, 1, 1, 1, 1, 1,
-0.7811526, -0.775547, -3.503563, 1, 1, 1, 1, 1,
-0.7799984, 0.5327394, -0.4074434, 1, 1, 1, 1, 1,
-0.7787102, -0.1747577, -2.559686, 1, 1, 1, 1, 1,
-0.7748098, 0.4757276, -1.63619, 1, 1, 1, 1, 1,
-0.7734698, -1.599409, -3.521937, 1, 1, 1, 1, 1,
-0.7625889, 0.4215191, -0.7357176, 1, 1, 1, 1, 1,
-0.7588586, -1.801105, -3.345455, 1, 1, 1, 1, 1,
-0.756005, 0.07418273, -2.295792, 1, 1, 1, 1, 1,
-0.7542564, 2.487436, 2.036171, 1, 1, 1, 1, 1,
-0.752022, 0.4089055, -1.262224, 1, 1, 1, 1, 1,
-0.7506198, 1.147494, -1.31128, 1, 1, 1, 1, 1,
-0.7499863, -0.2890873, -1.547947, 1, 1, 1, 1, 1,
-0.7469102, -1.846794, -3.215255, 1, 1, 1, 1, 1,
-0.7459813, 0.3875619, -1.451278, 1, 1, 1, 1, 1,
-0.7432601, 1.352231, -1.600518, 0, 0, 1, 1, 1,
-0.7429236, -0.750083, -1.990244, 1, 0, 0, 1, 1,
-0.7418324, 0.1741816, -0.8314191, 1, 0, 0, 1, 1,
-0.7407831, -1.729867, -2.708913, 1, 0, 0, 1, 1,
-0.7349524, 1.874322, -0.8826747, 1, 0, 0, 1, 1,
-0.7258687, -0.7448571, -3.451368, 1, 0, 0, 1, 1,
-0.7227307, 0.4372711, 0.8159723, 0, 0, 0, 1, 1,
-0.7220699, -0.6719211, -3.841876, 0, 0, 0, 1, 1,
-0.7181132, -1.071222, -4.145365, 0, 0, 0, 1, 1,
-0.7105958, -0.09797063, -3.509637, 0, 0, 0, 1, 1,
-0.7094516, -0.325458, -1.670631, 0, 0, 0, 1, 1,
-0.7084169, 1.212919, -0.5982749, 0, 0, 0, 1, 1,
-0.7031551, 1.091204, -0.8069881, 0, 0, 0, 1, 1,
-0.6972349, -0.3386424, -1.491227, 1, 1, 1, 1, 1,
-0.6965557, -1.340149, -1.262451, 1, 1, 1, 1, 1,
-0.6948959, 0.7651546, -0.5043233, 1, 1, 1, 1, 1,
-0.6909516, 0.2189083, -1.196281, 1, 1, 1, 1, 1,
-0.6907525, 0.5884333, -2.473439, 1, 1, 1, 1, 1,
-0.6879857, 0.1634787, -0.8628596, 1, 1, 1, 1, 1,
-0.6831155, 0.1381278, -2.339762, 1, 1, 1, 1, 1,
-0.6761326, 0.5210708, -1.517989, 1, 1, 1, 1, 1,
-0.674895, 0.3729752, -2.178615, 1, 1, 1, 1, 1,
-0.6687644, -0.2802636, -3.004396, 1, 1, 1, 1, 1,
-0.6660848, 1.04439, -0.4153376, 1, 1, 1, 1, 1,
-0.6525749, 1.660359, 0.936933, 1, 1, 1, 1, 1,
-0.6420899, -1.701791, -3.356986, 1, 1, 1, 1, 1,
-0.641692, -1.528424, -3.430956, 1, 1, 1, 1, 1,
-0.6376922, 0.4598137, -0.1616311, 1, 1, 1, 1, 1,
-0.6336151, 0.04847403, -1.928327, 0, 0, 1, 1, 1,
-0.6331626, 1.348558, 1.506047, 1, 0, 0, 1, 1,
-0.6307386, 1.40497, 0.08809868, 1, 0, 0, 1, 1,
-0.6307107, -2.211634, -1.760559, 1, 0, 0, 1, 1,
-0.6288627, -0.6598402, -0.3964723, 1, 0, 0, 1, 1,
-0.6267724, 1.783713, 0.5601032, 1, 0, 0, 1, 1,
-0.6248739, 0.2646132, -0.7353107, 0, 0, 0, 1, 1,
-0.6224209, -1.852882, -2.421417, 0, 0, 0, 1, 1,
-0.6220269, 2.250799, -1.20344, 0, 0, 0, 1, 1,
-0.6196959, 0.6765512, -2.546813, 0, 0, 0, 1, 1,
-0.6188203, -0.8551547, -1.834095, 0, 0, 0, 1, 1,
-0.6105854, -0.4295464, -1.663955, 0, 0, 0, 1, 1,
-0.6062588, -2.005995, -1.813084, 0, 0, 0, 1, 1,
-0.5989044, -0.07625782, -0.9542761, 1, 1, 1, 1, 1,
-0.5972211, 1.755763, 0.7998241, 1, 1, 1, 1, 1,
-0.5952329, -1.351238, -1.966137, 1, 1, 1, 1, 1,
-0.5934148, -1.562531, -0.5054185, 1, 1, 1, 1, 1,
-0.5932159, -1.705731, -2.609314, 1, 1, 1, 1, 1,
-0.5931702, 0.2188131, -1.485591, 1, 1, 1, 1, 1,
-0.5921153, -0.414709, -1.540771, 1, 1, 1, 1, 1,
-0.5913407, -0.05377918, -0.9288145, 1, 1, 1, 1, 1,
-0.5851904, -1.700634, -1.542297, 1, 1, 1, 1, 1,
-0.5815414, -0.4977956, -3.752126, 1, 1, 1, 1, 1,
-0.5799759, 1.36534, -1.296082, 1, 1, 1, 1, 1,
-0.5796908, -1.606882, -2.956043, 1, 1, 1, 1, 1,
-0.5771668, -1.97556, -1.444868, 1, 1, 1, 1, 1,
-0.5730633, -0.7008935, -1.267457, 1, 1, 1, 1, 1,
-0.569797, 2.774024, 0.6062233, 1, 1, 1, 1, 1,
-0.5644245, 0.03942177, -0.8770368, 0, 0, 1, 1, 1,
-0.5633837, -1.449473, -1.941104, 1, 0, 0, 1, 1,
-0.5552076, -1.362104, -2.212955, 1, 0, 0, 1, 1,
-0.5523046, 0.5483783, -1.48535, 1, 0, 0, 1, 1,
-0.5474346, -1.213061, -2.377124, 1, 0, 0, 1, 1,
-0.5456277, 0.3674938, -0.2036119, 1, 0, 0, 1, 1,
-0.5420879, -1.518855, -2.470663, 0, 0, 0, 1, 1,
-0.5391263, 0.03377771, -1.57932, 0, 0, 0, 1, 1,
-0.5378266, -0.3152119, -2.3166, 0, 0, 0, 1, 1,
-0.5364673, 0.7310198, 2.052992, 0, 0, 0, 1, 1,
-0.5362523, -0.8108383, -1.519264, 0, 0, 0, 1, 1,
-0.5357972, 1.229477, -1.589977, 0, 0, 0, 1, 1,
-0.5338907, 0.788548, -1.701236, 0, 0, 0, 1, 1,
-0.5327282, 0.4179129, -0.1399945, 1, 1, 1, 1, 1,
-0.5324112, 0.9922538, -1.374507, 1, 1, 1, 1, 1,
-0.532239, -0.4258829, -2.86293, 1, 1, 1, 1, 1,
-0.5320813, -0.2829607, -2.181447, 1, 1, 1, 1, 1,
-0.5254319, 1.18628, 0.3729208, 1, 1, 1, 1, 1,
-0.525219, -0.06205193, -3.057224, 1, 1, 1, 1, 1,
-0.5178873, 0.3613943, -1.846243, 1, 1, 1, 1, 1,
-0.5150946, 0.2082732, -2.736673, 1, 1, 1, 1, 1,
-0.513126, 0.9517148, -0.3100311, 1, 1, 1, 1, 1,
-0.5086118, -1.354846, -2.622631, 1, 1, 1, 1, 1,
-0.507139, 0.8116978, -0.7487067, 1, 1, 1, 1, 1,
-0.5060348, 0.7172848, -0.6592529, 1, 1, 1, 1, 1,
-0.5016628, 0.5925159, -2.236887, 1, 1, 1, 1, 1,
-0.4987524, 2.209202, 0.6618106, 1, 1, 1, 1, 1,
-0.4957642, -0.4736578, -2.567872, 1, 1, 1, 1, 1,
-0.4894991, -0.3929861, -2.585295, 0, 0, 1, 1, 1,
-0.4856549, -1.213575, -2.827003, 1, 0, 0, 1, 1,
-0.4724935, -0.3182193, -2.981017, 1, 0, 0, 1, 1,
-0.471893, 1.420789, 0.1794027, 1, 0, 0, 1, 1,
-0.4707762, -0.4898082, -3.997924, 1, 0, 0, 1, 1,
-0.4697401, -0.3617473, -2.173931, 1, 0, 0, 1, 1,
-0.4686757, -0.1058217, -0.6402642, 0, 0, 0, 1, 1,
-0.4624471, -2.1206, -3.886704, 0, 0, 0, 1, 1,
-0.4623282, 0.2201149, -0.5642365, 0, 0, 0, 1, 1,
-0.4610102, -0.2002145, -1.561367, 0, 0, 0, 1, 1,
-0.4571776, -1.005417, -4.366407, 0, 0, 0, 1, 1,
-0.455439, 1.081598, -0.730023, 0, 0, 0, 1, 1,
-0.4534957, 0.486059, -0.6993166, 0, 0, 0, 1, 1,
-0.4519683, -0.08697376, -2.752351, 1, 1, 1, 1, 1,
-0.4456171, 0.8298172, -1.266694, 1, 1, 1, 1, 1,
-0.4428863, 0.1929991, -1.121252, 1, 1, 1, 1, 1,
-0.4399984, -0.5586014, -2.798086, 1, 1, 1, 1, 1,
-0.4391023, -0.1111932, -1.610653, 1, 1, 1, 1, 1,
-0.4388058, 1.78232, -0.3280743, 1, 1, 1, 1, 1,
-0.4366431, -0.1958748, -2.285005, 1, 1, 1, 1, 1,
-0.4352992, 0.09211285, -0.4480478, 1, 1, 1, 1, 1,
-0.4322253, -2.598053, -3.789778, 1, 1, 1, 1, 1,
-0.4311661, 0.6566306, -1.474427, 1, 1, 1, 1, 1,
-0.4288974, -0.3057406, -1.186503, 1, 1, 1, 1, 1,
-0.4234239, 0.7038552, -1.236728, 1, 1, 1, 1, 1,
-0.4229945, 1.031033, -1.390555, 1, 1, 1, 1, 1,
-0.4221538, -0.1480414, -3.143844, 1, 1, 1, 1, 1,
-0.4192336, 1.433208, 0.1039945, 1, 1, 1, 1, 1,
-0.4176804, 2.5852, 0.3871271, 0, 0, 1, 1, 1,
-0.4165512, -0.7900234, -3.605275, 1, 0, 0, 1, 1,
-0.4157009, -0.745746, -2.885959, 1, 0, 0, 1, 1,
-0.4150059, -2.117968, -2.02236, 1, 0, 0, 1, 1,
-0.4139342, -0.6959875, -4.791548, 1, 0, 0, 1, 1,
-0.3983898, 1.081758, 0.2173232, 1, 0, 0, 1, 1,
-0.3975506, -0.2689182, -1.168372, 0, 0, 0, 1, 1,
-0.397, -0.2810399, -2.018681, 0, 0, 0, 1, 1,
-0.3953442, 0.1886275, 0.03529599, 0, 0, 0, 1, 1,
-0.3924881, 0.433522, -0.9875905, 0, 0, 0, 1, 1,
-0.3923314, 2.07543, 1.248009, 0, 0, 0, 1, 1,
-0.3896608, -0.07777274, -3.051764, 0, 0, 0, 1, 1,
-0.3851354, 1.16438, -0.189765, 0, 0, 0, 1, 1,
-0.3839382, -0.2152123, -3.058197, 1, 1, 1, 1, 1,
-0.3834158, -0.370177, -4.610332, 1, 1, 1, 1, 1,
-0.3763259, -1.086043, -2.675305, 1, 1, 1, 1, 1,
-0.3744654, -1.155235, -2.717978, 1, 1, 1, 1, 1,
-0.3744338, -1.430367, -2.577832, 1, 1, 1, 1, 1,
-0.3735843, 0.07005574, -3.037616, 1, 1, 1, 1, 1,
-0.368007, 1.031583, 0.5577767, 1, 1, 1, 1, 1,
-0.3647836, 0.1186513, -1.869668, 1, 1, 1, 1, 1,
-0.3630715, -0.1961535, -1.703037, 1, 1, 1, 1, 1,
-0.3623379, 0.8233069, -2.432143, 1, 1, 1, 1, 1,
-0.360811, -2.209818, -3.553796, 1, 1, 1, 1, 1,
-0.3468167, -1.399565, -4.20884, 1, 1, 1, 1, 1,
-0.3338681, -1.261514, -2.306357, 1, 1, 1, 1, 1,
-0.3329108, 1.463106, -0.2071346, 1, 1, 1, 1, 1,
-0.3327354, 0.4332666, -2.681659, 1, 1, 1, 1, 1,
-0.3277561, 0.2321926, -0.0312595, 0, 0, 1, 1, 1,
-0.3264489, 0.444743, -1.831744, 1, 0, 0, 1, 1,
-0.3262458, -0.5595277, -1.970614, 1, 0, 0, 1, 1,
-0.3259707, 0.6153184, -1.239382, 1, 0, 0, 1, 1,
-0.3259346, -0.5370852, -2.211673, 1, 0, 0, 1, 1,
-0.3234972, 0.3015561, 1.401842, 1, 0, 0, 1, 1,
-0.3218466, -0.03464943, -0.4749457, 0, 0, 0, 1, 1,
-0.3202328, 1.665304, 0.1684908, 0, 0, 0, 1, 1,
-0.318009, 0.9274184, 0.03204206, 0, 0, 0, 1, 1,
-0.312362, 0.2933533, -0.5994827, 0, 0, 0, 1, 1,
-0.3116037, -0.1767534, -2.020348, 0, 0, 0, 1, 1,
-0.3045385, 0.3303705, -1.363162, 0, 0, 0, 1, 1,
-0.303675, 0.6691687, -0.5468502, 0, 0, 0, 1, 1,
-0.3033353, 0.6018313, -1.908485, 1, 1, 1, 1, 1,
-0.3016731, 1.476923, -0.981913, 1, 1, 1, 1, 1,
-0.2991757, 0.486053, 0.0350958, 1, 1, 1, 1, 1,
-0.289841, -0.00298069, -1.576944, 1, 1, 1, 1, 1,
-0.2884266, -0.1655768, -2.284203, 1, 1, 1, 1, 1,
-0.2859193, -0.01187155, -1.607121, 1, 1, 1, 1, 1,
-0.2840027, 0.2851256, -1.391228, 1, 1, 1, 1, 1,
-0.270322, 0.1322026, -0.9200372, 1, 1, 1, 1, 1,
-0.2649332, 0.9413256, 0.4664993, 1, 1, 1, 1, 1,
-0.2615314, 0.6668409, 0.5999051, 1, 1, 1, 1, 1,
-0.2610283, 1.723883, 0.6804909, 1, 1, 1, 1, 1,
-0.2579992, 1.031249, 0.4195077, 1, 1, 1, 1, 1,
-0.255083, -0.8255728, -3.303604, 1, 1, 1, 1, 1,
-0.2545029, 0.4072928, 0.5402672, 1, 1, 1, 1, 1,
-0.2534357, -0.8807814, -5.006486, 1, 1, 1, 1, 1,
-0.2449938, 0.2187338, -0.8239379, 0, 0, 1, 1, 1,
-0.2448536, 1.117436, -2.448536, 1, 0, 0, 1, 1,
-0.2425023, -0.8625008, -3.808615, 1, 0, 0, 1, 1,
-0.2344389, -0.2256132, -2.048232, 1, 0, 0, 1, 1,
-0.2337495, -0.703023, -3.145298, 1, 0, 0, 1, 1,
-0.2322122, 0.3371401, -1.902204, 1, 0, 0, 1, 1,
-0.2312741, -1.963503, -1.728305, 0, 0, 0, 1, 1,
-0.2237004, 1.182895, 2.80361, 0, 0, 0, 1, 1,
-0.2214502, 0.8933969, -1.633429, 0, 0, 0, 1, 1,
-0.2208587, 0.2640145, -0.02890291, 0, 0, 0, 1, 1,
-0.2206532, -0.1301113, -0.9519056, 0, 0, 0, 1, 1,
-0.2197684, -1.029268, -4.510838, 0, 0, 0, 1, 1,
-0.2190474, 1.749746, -1.603863, 0, 0, 0, 1, 1,
-0.2177894, 0.9088218, 1.584454, 1, 1, 1, 1, 1,
-0.2132116, 0.9360378, 0.4132339, 1, 1, 1, 1, 1,
-0.2089394, -0.7850775, -4.18486, 1, 1, 1, 1, 1,
-0.2047997, -1.882198, -1.800678, 1, 1, 1, 1, 1,
-0.2013115, -1.907744, -4.40195, 1, 1, 1, 1, 1,
-0.2011488, -0.2514097, -2.45075, 1, 1, 1, 1, 1,
-0.1993968, 0.378382, 0.6171812, 1, 1, 1, 1, 1,
-0.1992557, -1.985089, -3.969507, 1, 1, 1, 1, 1,
-0.1937685, 0.1257072, 0.4895107, 1, 1, 1, 1, 1,
-0.1935534, -0.5821024, -3.502166, 1, 1, 1, 1, 1,
-0.1927364, -1.595016, -3.810942, 1, 1, 1, 1, 1,
-0.1920931, 1.38947, 0.7448313, 1, 1, 1, 1, 1,
-0.188282, 0.8387943, -0.141462, 1, 1, 1, 1, 1,
-0.1877978, 0.1747654, -0.2315471, 1, 1, 1, 1, 1,
-0.18578, 0.5505469, -1.209734, 1, 1, 1, 1, 1,
-0.1838742, 0.3274078, 0.6426482, 0, 0, 1, 1, 1,
-0.1798505, 0.6292984, 0.9238642, 1, 0, 0, 1, 1,
-0.1772105, 1.555382, 1.298545, 1, 0, 0, 1, 1,
-0.1760028, 2.218951, -0.8222972, 1, 0, 0, 1, 1,
-0.1758893, 0.8975522, 2.360828, 1, 0, 0, 1, 1,
-0.1741747, -0.7374743, -3.808608, 1, 0, 0, 1, 1,
-0.1740275, -0.2106708, -1.499202, 0, 0, 0, 1, 1,
-0.1692339, 1.557375, 0.1549332, 0, 0, 0, 1, 1,
-0.1668897, 0.1909139, -3.12161, 0, 0, 0, 1, 1,
-0.162937, -0.1141449, -1.269371, 0, 0, 0, 1, 1,
-0.1578037, 0.02857409, -1.947012, 0, 0, 0, 1, 1,
-0.1554876, -1.670414, -3.055968, 0, 0, 0, 1, 1,
-0.1526055, -1.533392, -1.563627, 0, 0, 0, 1, 1,
-0.1524248, -0.01809856, -0.5563382, 1, 1, 1, 1, 1,
-0.1489954, -0.3325467, -2.20932, 1, 1, 1, 1, 1,
-0.1487435, -1.24488, -1.840749, 1, 1, 1, 1, 1,
-0.1460356, 1.074771, -2.015852, 1, 1, 1, 1, 1,
-0.1457416, -1.230971, -2.928398, 1, 1, 1, 1, 1,
-0.1450843, 0.7525505, -1.832778, 1, 1, 1, 1, 1,
-0.1431338, -0.5191109, -3.048481, 1, 1, 1, 1, 1,
-0.1429766, -0.2320086, -3.072703, 1, 1, 1, 1, 1,
-0.1422484, 0.6179032, -0.4439129, 1, 1, 1, 1, 1,
-0.1419525, -2.608752, -1.532784, 1, 1, 1, 1, 1,
-0.1409113, 0.7000383, -0.9165487, 1, 1, 1, 1, 1,
-0.1354993, 0.5306631, -0.03416201, 1, 1, 1, 1, 1,
-0.1354331, 1.262468, 2.157786, 1, 1, 1, 1, 1,
-0.1317967, -0.615841, -2.844826, 1, 1, 1, 1, 1,
-0.1295971, 0.3668754, 0.8159758, 1, 1, 1, 1, 1,
-0.127658, -1.749129, -3.143235, 0, 0, 1, 1, 1,
-0.1251046, -0.0900759, -3.446858, 1, 0, 0, 1, 1,
-0.1249387, 0.3566142, -0.3197921, 1, 0, 0, 1, 1,
-0.1237111, -1.963715, -4.286425, 1, 0, 0, 1, 1,
-0.1219208, -0.2730126, -3.921102, 1, 0, 0, 1, 1,
-0.120395, -0.04590563, -2.180834, 1, 0, 0, 1, 1,
-0.1202309, -0.1178643, -1.166561, 0, 0, 0, 1, 1,
-0.1182888, -0.8926686, -3.627207, 0, 0, 0, 1, 1,
-0.1180476, 1.304214, -1.975963, 0, 0, 0, 1, 1,
-0.1178472, 0.115546, -0.4682734, 0, 0, 0, 1, 1,
-0.1131098, -0.5112538, -2.155304, 0, 0, 0, 1, 1,
-0.1049011, -0.4719877, -2.17978, 0, 0, 0, 1, 1,
-0.1041815, 0.06988031, -1.561401, 0, 0, 0, 1, 1,
-0.1025433, 0.4724602, 1.679297, 1, 1, 1, 1, 1,
-0.1017414, 1.156238, -0.9453675, 1, 1, 1, 1, 1,
-0.1005927, 1.095201, 0.8045136, 1, 1, 1, 1, 1,
-0.09419057, -1.425493, -1.315097, 1, 1, 1, 1, 1,
-0.09400468, -0.1734982, -3.730046, 1, 1, 1, 1, 1,
-0.09395802, -7.39469e-05, -0.3274225, 1, 1, 1, 1, 1,
-0.08431438, -0.9931026, -3.466852, 1, 1, 1, 1, 1,
-0.08342664, 0.01537845, -0.7247461, 1, 1, 1, 1, 1,
-0.07992042, 0.03460257, -0.8996767, 1, 1, 1, 1, 1,
-0.07846557, -0.806264, -2.819476, 1, 1, 1, 1, 1,
-0.07813549, 0.150957, -0.6582385, 1, 1, 1, 1, 1,
-0.06744841, -0.3239115, -3.542808, 1, 1, 1, 1, 1,
-0.06060583, -1.137436, -2.846119, 1, 1, 1, 1, 1,
-0.05709808, 0.4303972, -2.09091, 1, 1, 1, 1, 1,
-0.05156963, -0.7276533, -3.591634, 1, 1, 1, 1, 1,
-0.05027736, -0.8104714, -5.18226, 0, 0, 1, 1, 1,
-0.04635845, -1.01606, -3.359915, 1, 0, 0, 1, 1,
-0.04105137, 0.3294716, 0.1662833, 1, 0, 0, 1, 1,
-0.03265459, 1.491428, 0.6150416, 1, 0, 0, 1, 1,
-0.03252205, 0.506018, -0.8599242, 1, 0, 0, 1, 1,
-0.03085431, 0.3394645, 0.05678692, 1, 0, 0, 1, 1,
-0.02623421, -0.05146552, -1.222288, 0, 0, 0, 1, 1,
-0.01936016, -0.916344, -4.347672, 0, 0, 0, 1, 1,
-0.01860465, 1.024068, -0.1157864, 0, 0, 0, 1, 1,
-0.01747799, 0.7594987, 0.3335015, 0, 0, 0, 1, 1,
-0.01292193, -0.24538, -2.08916, 0, 0, 0, 1, 1,
-0.004846498, 0.3441639, -1.776651, 0, 0, 0, 1, 1,
-0.004285944, -0.1857428, -2.562022, 0, 0, 0, 1, 1,
-0.004029811, 2.643457, -0.9812018, 1, 1, 1, 1, 1,
-0.003549902, 0.3123864, -0.308221, 1, 1, 1, 1, 1,
-0.002504034, -0.05435143, -5.051926, 1, 1, 1, 1, 1,
-0.002465348, 1.201404, -0.3936113, 1, 1, 1, 1, 1,
-0.001494021, 0.6840124, 0.6687443, 1, 1, 1, 1, 1,
0.0002093384, 0.4220942, -0.3687049, 1, 1, 1, 1, 1,
0.000328293, 1.037113, 1.782098, 1, 1, 1, 1, 1,
0.000477179, 0.7909716, 0.9042181, 1, 1, 1, 1, 1,
0.001333792, -0.6855841, 4.11372, 1, 1, 1, 1, 1,
0.00367776, 0.6286702, 0.9318805, 1, 1, 1, 1, 1,
0.004579783, 0.5898948, 0.913345, 1, 1, 1, 1, 1,
0.006115269, 0.5449151, 1.338648, 1, 1, 1, 1, 1,
0.008420053, 0.05256925, -1.357115, 1, 1, 1, 1, 1,
0.008541034, 0.428838, 0.01358964, 1, 1, 1, 1, 1,
0.00872115, 0.09145173, -1.839405, 1, 1, 1, 1, 1,
0.0155776, -1.871092, 2.437337, 0, 0, 1, 1, 1,
0.01606593, 1.7271, 0.8547927, 1, 0, 0, 1, 1,
0.01625832, -0.1275245, 2.151457, 1, 0, 0, 1, 1,
0.01786481, -0.363072, 3.376292, 1, 0, 0, 1, 1,
0.01969104, 0.6984488, -0.8775143, 1, 0, 0, 1, 1,
0.02812313, 1.054389, -1.331103, 1, 0, 0, 1, 1,
0.03318083, 1.196571, 2.032945, 0, 0, 0, 1, 1,
0.03853639, -0.3776312, 2.959991, 0, 0, 0, 1, 1,
0.04045024, 0.5545326, -1.398031, 0, 0, 0, 1, 1,
0.04337476, -0.5618671, 2.737026, 0, 0, 0, 1, 1,
0.0465958, -1.426823, 0.7540741, 0, 0, 0, 1, 1,
0.05045602, -0.4686494, 3.782455, 0, 0, 0, 1, 1,
0.05121013, 0.07406212, 0.8092669, 0, 0, 0, 1, 1,
0.05209272, -1.371279, 4.72565, 1, 1, 1, 1, 1,
0.05575734, -1.443361, 4.780045, 1, 1, 1, 1, 1,
0.05779203, -0.1438992, 1.169921, 1, 1, 1, 1, 1,
0.05782089, 0.222611, 0.130941, 1, 1, 1, 1, 1,
0.06208464, 0.03569767, -0.0381862, 1, 1, 1, 1, 1,
0.06733139, 0.4411993, -0.2022266, 1, 1, 1, 1, 1,
0.06903079, -0.1457804, 3.907933, 1, 1, 1, 1, 1,
0.07298932, -1.967005, 2.594991, 1, 1, 1, 1, 1,
0.0844521, 1.296204, -0.189554, 1, 1, 1, 1, 1,
0.08596525, -0.8030939, 1.628165, 1, 1, 1, 1, 1,
0.08944026, 1.211791, 0.9885589, 1, 1, 1, 1, 1,
0.09090161, 1.321554, 0.5768896, 1, 1, 1, 1, 1,
0.09131903, 0.9495381, 1.768388, 1, 1, 1, 1, 1,
0.09201874, -0.7067747, 3.731178, 1, 1, 1, 1, 1,
0.09231732, 0.2286535, -0.3541193, 1, 1, 1, 1, 1,
0.09517007, -0.166721, 3.361955, 0, 0, 1, 1, 1,
0.0998216, 0.3075322, -1.558456, 1, 0, 0, 1, 1,
0.1033443, -0.3581889, 2.229003, 1, 0, 0, 1, 1,
0.1064011, 0.6802363, 0.7083289, 1, 0, 0, 1, 1,
0.1066495, 0.09786067, 1.705196, 1, 0, 0, 1, 1,
0.1083713, 0.5097273, -0.8662174, 1, 0, 0, 1, 1,
0.1122163, 0.9156264, -0.7225898, 0, 0, 0, 1, 1,
0.1145685, 1.191959, -1.067469, 0, 0, 0, 1, 1,
0.1175674, -0.02553848, 1.333681, 0, 0, 0, 1, 1,
0.1197291, -0.2624336, 3.633623, 0, 0, 0, 1, 1,
0.1207758, -1.257001, 1.255014, 0, 0, 0, 1, 1,
0.1216736, -0.1112845, 2.235873, 0, 0, 0, 1, 1,
0.1289384, -0.7408658, 4.683952, 0, 0, 0, 1, 1,
0.1289777, -1.198333, 4.494821, 1, 1, 1, 1, 1,
0.1367481, 0.5685938, -0.7102014, 1, 1, 1, 1, 1,
0.1409937, 0.9900602, 1.365123, 1, 1, 1, 1, 1,
0.1417048, 0.08120305, 1.589126, 1, 1, 1, 1, 1,
0.1421055, -0.8265343, 4.63968, 1, 1, 1, 1, 1,
0.1472424, 0.3547086, 1.569789, 1, 1, 1, 1, 1,
0.15016, 0.2295658, 1.336089, 1, 1, 1, 1, 1,
0.1542067, -0.2970209, 2.975384, 1, 1, 1, 1, 1,
0.1550273, -1.772514, 3.167642, 1, 1, 1, 1, 1,
0.1669994, 0.195386, -0.5458667, 1, 1, 1, 1, 1,
0.1698351, 0.1771275, 1.356103, 1, 1, 1, 1, 1,
0.1714897, -0.05541452, -0.2792719, 1, 1, 1, 1, 1,
0.1722946, -0.4654913, 2.696312, 1, 1, 1, 1, 1,
0.1751395, -0.2032918, 1.399937, 1, 1, 1, 1, 1,
0.1759075, -0.7467241, 3.853041, 1, 1, 1, 1, 1,
0.1784478, -0.6011466, 2.208447, 0, 0, 1, 1, 1,
0.1786241, 0.5232372, -0.9447141, 1, 0, 0, 1, 1,
0.1869573, 2.48607, -0.05124237, 1, 0, 0, 1, 1,
0.1880197, -0.7514016, 1.443427, 1, 0, 0, 1, 1,
0.1880574, 1.254943, 1.769729, 1, 0, 0, 1, 1,
0.1904138, 0.9372283, 0.2390092, 1, 0, 0, 1, 1,
0.1908836, -0.07904285, 2.239709, 0, 0, 0, 1, 1,
0.1959724, -1.160611, 3.371951, 0, 0, 0, 1, 1,
0.198173, -0.1299773, 1.10288, 0, 0, 0, 1, 1,
0.2027495, -0.3788538, 2.527728, 0, 0, 0, 1, 1,
0.2065422, -0.7481499, 3.798855, 0, 0, 0, 1, 1,
0.210173, -0.03231162, 2.688052, 0, 0, 0, 1, 1,
0.2130214, -0.4265406, 2.176687, 0, 0, 0, 1, 1,
0.2146914, -1.23818, 3.802699, 1, 1, 1, 1, 1,
0.2186273, 1.362579, -1.151256, 1, 1, 1, 1, 1,
0.2189778, 0.4026349, 0.6517312, 1, 1, 1, 1, 1,
0.2238888, -0.4962951, 3.723583, 1, 1, 1, 1, 1,
0.2246014, -1.304263, 2.30933, 1, 1, 1, 1, 1,
0.2252136, -0.328212, 1.592802, 1, 1, 1, 1, 1,
0.2272811, -0.8812717, 3.589613, 1, 1, 1, 1, 1,
0.2275257, -0.7917101, 4.279685, 1, 1, 1, 1, 1,
0.2292099, -0.5341521, 2.136511, 1, 1, 1, 1, 1,
0.2362882, -1.809346, 4.792201, 1, 1, 1, 1, 1,
0.2501051, 1.524693, 1.511395, 1, 1, 1, 1, 1,
0.2517826, -0.4172749, 4.323524, 1, 1, 1, 1, 1,
0.2543815, -0.6013342, 3.193416, 1, 1, 1, 1, 1,
0.2548395, 0.5344843, -0.1055126, 1, 1, 1, 1, 1,
0.2562132, 1.467808, 0.6300101, 1, 1, 1, 1, 1,
0.2564405, 0.9740043, -0.7956666, 0, 0, 1, 1, 1,
0.2617562, 0.7202991, 0.1454739, 1, 0, 0, 1, 1,
0.2667173, 2.939808, 0.4632323, 1, 0, 0, 1, 1,
0.275003, 0.3136232, 0.1970904, 1, 0, 0, 1, 1,
0.2776906, 0.3418966, 1.264874, 1, 0, 0, 1, 1,
0.2779506, -0.1167943, 2.414706, 1, 0, 0, 1, 1,
0.2828088, -0.2497916, 1.773513, 0, 0, 0, 1, 1,
0.285121, -0.1717392, 2.788538, 0, 0, 0, 1, 1,
0.2926559, -1.893218, 1.814607, 0, 0, 0, 1, 1,
0.2939513, -0.07145242, 2.065168, 0, 0, 0, 1, 1,
0.2962149, -0.3244638, 2.274916, 0, 0, 0, 1, 1,
0.2980201, -0.6401951, 2.877961, 0, 0, 0, 1, 1,
0.3016512, -0.2319392, 1.548195, 0, 0, 0, 1, 1,
0.3024039, 0.113419, 0.9289683, 1, 1, 1, 1, 1,
0.3043299, 0.9475443, 0.4612616, 1, 1, 1, 1, 1,
0.3104235, -0.7930524, 2.964154, 1, 1, 1, 1, 1,
0.3130623, 0.8849545, -0.5416569, 1, 1, 1, 1, 1,
0.3134049, -1.021505, 3.084757, 1, 1, 1, 1, 1,
0.3144639, 0.4897611, -0.4102075, 1, 1, 1, 1, 1,
0.3154216, 0.6266761, 1.702118, 1, 1, 1, 1, 1,
0.3166972, 0.417188, 2.377985, 1, 1, 1, 1, 1,
0.3189909, -1.738013, 3.474687, 1, 1, 1, 1, 1,
0.3246478, -0.3690696, 1.174737, 1, 1, 1, 1, 1,
0.325442, 0.7551001, -0.4675956, 1, 1, 1, 1, 1,
0.3257444, -1.364099, 4.43225, 1, 1, 1, 1, 1,
0.3281037, 0.3117767, 0.8498772, 1, 1, 1, 1, 1,
0.3312089, -1.270507, 3.810961, 1, 1, 1, 1, 1,
0.331653, 0.8493103, -0.110162, 1, 1, 1, 1, 1,
0.3327429, 0.09760864, 0.9386872, 0, 0, 1, 1, 1,
0.3332809, 0.6427046, 0.4917242, 1, 0, 0, 1, 1,
0.3355365, -0.6846333, 4.066249, 1, 0, 0, 1, 1,
0.3374691, 1.620809, -0.9527504, 1, 0, 0, 1, 1,
0.3376117, -0.1544576, 2.149434, 1, 0, 0, 1, 1,
0.3395226, 1.597357, 0.5790893, 1, 0, 0, 1, 1,
0.3443429, -0.8990794, 3.16282, 0, 0, 0, 1, 1,
0.3483604, -2.317516, 1.749212, 0, 0, 0, 1, 1,
0.3503087, 0.1229034, 1.120023, 0, 0, 0, 1, 1,
0.3531622, -1.657531, 5.517287, 0, 0, 0, 1, 1,
0.3537942, 1.13556, 0.5244376, 0, 0, 0, 1, 1,
0.3546579, -0.4755016, 2.543975, 0, 0, 0, 1, 1,
0.3556436, -0.405759, 2.033344, 0, 0, 0, 1, 1,
0.3582425, 0.8579939, -0.8288482, 1, 1, 1, 1, 1,
0.3584242, 1.137122, 0.7684914, 1, 1, 1, 1, 1,
0.3589661, -0.608317, 2.585525, 1, 1, 1, 1, 1,
0.3625381, -1.964301, 3.056794, 1, 1, 1, 1, 1,
0.3662602, 0.1748192, 1.326853, 1, 1, 1, 1, 1,
0.3672143, 1.069064, -1.415716, 1, 1, 1, 1, 1,
0.3698657, -0.01805678, 1.501788, 1, 1, 1, 1, 1,
0.3716888, -0.3360699, 2.85786, 1, 1, 1, 1, 1,
0.3728804, 2.171176, 1.209687, 1, 1, 1, 1, 1,
0.3761561, -1.477631, 0.6813394, 1, 1, 1, 1, 1,
0.377254, -0.8319311, 2.092938, 1, 1, 1, 1, 1,
0.3816692, 0.7199999, 0.7406777, 1, 1, 1, 1, 1,
0.38285, 0.4574565, 0.4132212, 1, 1, 1, 1, 1,
0.3828793, -0.9175804, 2.889688, 1, 1, 1, 1, 1,
0.3849384, -0.6290718, 1.399761, 1, 1, 1, 1, 1,
0.3872683, 0.7834778, -0.8482531, 0, 0, 1, 1, 1,
0.3880181, -1.25675, 3.481804, 1, 0, 0, 1, 1,
0.3893749, -1.715282, 1.961217, 1, 0, 0, 1, 1,
0.3936786, 0.3923667, 0.5652037, 1, 0, 0, 1, 1,
0.3964657, -1.478493, 2.904837, 1, 0, 0, 1, 1,
0.4004874, 1.144556, -0.1566375, 1, 0, 0, 1, 1,
0.4051574, 0.4683338, 0.1140079, 0, 0, 0, 1, 1,
0.4075412, 1.588741, 1.019602, 0, 0, 0, 1, 1,
0.4083782, 0.2717295, 1.0059, 0, 0, 0, 1, 1,
0.4088633, -1.245147, 2.567694, 0, 0, 0, 1, 1,
0.4097294, -0.9983813, 2.555885, 0, 0, 0, 1, 1,
0.4180798, -2.239599, 3.97927, 0, 0, 0, 1, 1,
0.4195722, 0.4793751, 3.185141, 0, 0, 0, 1, 1,
0.4196689, -0.8635557, 3.268368, 1, 1, 1, 1, 1,
0.4226179, -1.310512, 4.934834, 1, 1, 1, 1, 1,
0.4267927, -0.08964983, 1.856403, 1, 1, 1, 1, 1,
0.4270446, -1.615328, 6.089614, 1, 1, 1, 1, 1,
0.430091, -0.5771133, 0.548009, 1, 1, 1, 1, 1,
0.4319364, -1.41644, 2.383982, 1, 1, 1, 1, 1,
0.4353575, 0.3900706, 0.7129285, 1, 1, 1, 1, 1,
0.435755, -1.273439, 4.442737, 1, 1, 1, 1, 1,
0.4375656, 0.5172967, 2.121187, 1, 1, 1, 1, 1,
0.4390227, 0.022152, 2.581963, 1, 1, 1, 1, 1,
0.4411542, 0.4530279, -1.752853, 1, 1, 1, 1, 1,
0.4423132, 1.412338, 0.7843783, 1, 1, 1, 1, 1,
0.4528854, -0.8305567, 1.773421, 1, 1, 1, 1, 1,
0.4531061, -0.8183467, 3.298073, 1, 1, 1, 1, 1,
0.4548556, 0.7212772, 1.358947, 1, 1, 1, 1, 1,
0.4551562, -0.04229203, 2.271197, 0, 0, 1, 1, 1,
0.4573165, -0.4203407, 2.784714, 1, 0, 0, 1, 1,
0.4620611, -0.5042369, 0.8687721, 1, 0, 0, 1, 1,
0.4623712, -0.3423041, 2.154278, 1, 0, 0, 1, 1,
0.4634582, -0.521449, 4.100424, 1, 0, 0, 1, 1,
0.4659745, -0.8931973, 2.661222, 1, 0, 0, 1, 1,
0.467149, 0.1610931, 1.203411, 0, 0, 0, 1, 1,
0.4720662, 0.6750485, 1.121823, 0, 0, 0, 1, 1,
0.4721939, -0.1729369, 3.419152, 0, 0, 0, 1, 1,
0.4731678, -0.1263245, 2.105395, 0, 0, 0, 1, 1,
0.4843345, -1.059845, 2.400791, 0, 0, 0, 1, 1,
0.4893947, 1.345412, -0.3036254, 0, 0, 0, 1, 1,
0.4927348, 0.860354, 0.8243724, 0, 0, 0, 1, 1,
0.5062089, -0.09323017, 0.9773501, 1, 1, 1, 1, 1,
0.5065804, 1.065907, 1.114184, 1, 1, 1, 1, 1,
0.5090042, 1.047395, -0.5819421, 1, 1, 1, 1, 1,
0.5098428, -2.735102, 3.335891, 1, 1, 1, 1, 1,
0.5100322, -0.2238274, 2.285572, 1, 1, 1, 1, 1,
0.5110202, 1.516397, 1.785848, 1, 1, 1, 1, 1,
0.5115913, 0.4095543, 2.21301, 1, 1, 1, 1, 1,
0.5132613, -0.9739857, 1.283654, 1, 1, 1, 1, 1,
0.517175, -1.939126, 3.335632, 1, 1, 1, 1, 1,
0.5222701, -0.2663327, 1.34599, 1, 1, 1, 1, 1,
0.5254501, 0.9650258, 2.279989, 1, 1, 1, 1, 1,
0.52902, 0.2620871, 2.147161, 1, 1, 1, 1, 1,
0.530061, 1.80537, 2.036076, 1, 1, 1, 1, 1,
0.5332232, -0.4763839, 3.302073, 1, 1, 1, 1, 1,
0.5429452, 0.6858219, 0.6120246, 1, 1, 1, 1, 1,
0.5497569, -0.5459304, 2.424253, 0, 0, 1, 1, 1,
0.551539, -0.4225528, 0.1656705, 1, 0, 0, 1, 1,
0.5541412, 0.2014089, 0.1163825, 1, 0, 0, 1, 1,
0.5600279, -0.9291649, 2.273244, 1, 0, 0, 1, 1,
0.5652451, -1.314538, 2.195732, 1, 0, 0, 1, 1,
0.5656107, -0.3879811, 2.604592, 1, 0, 0, 1, 1,
0.570292, -1.241673, 3.055203, 0, 0, 0, 1, 1,
0.5773598, -2.905648, 4.329698, 0, 0, 0, 1, 1,
0.5819895, 0.09091334, 2.12989, 0, 0, 0, 1, 1,
0.584944, 0.6088649, -0.209727, 0, 0, 0, 1, 1,
0.5862238, 0.5394384, 1.791941, 0, 0, 0, 1, 1,
0.5872537, -1.682608, 2.666411, 0, 0, 0, 1, 1,
0.5910097, -0.07980779, 0.7449816, 0, 0, 0, 1, 1,
0.595093, 1.702882, -0.2098525, 1, 1, 1, 1, 1,
0.6007888, 0.3424517, 0.8045046, 1, 1, 1, 1, 1,
0.6038433, 0.07893806, 2.175943, 1, 1, 1, 1, 1,
0.604349, 0.6344727, 2.742598, 1, 1, 1, 1, 1,
0.6055007, 0.4155408, 1.344501, 1, 1, 1, 1, 1,
0.6062214, 0.960399, 0.5638302, 1, 1, 1, 1, 1,
0.6114009, 0.8329895, -0.5552232, 1, 1, 1, 1, 1,
0.6114417, 0.02515052, 0.8072333, 1, 1, 1, 1, 1,
0.6132488, -1.788455, 2.754296, 1, 1, 1, 1, 1,
0.6163621, 0.04662554, 1.493653, 1, 1, 1, 1, 1,
0.6180666, 0.7212027, 0.5784201, 1, 1, 1, 1, 1,
0.61838, 0.4803478, -0.3240803, 1, 1, 1, 1, 1,
0.6210291, 1.727, 0.1475949, 1, 1, 1, 1, 1,
0.6212112, -0.6969557, 2.571685, 1, 1, 1, 1, 1,
0.6217428, 1.446976, 0.7140719, 1, 1, 1, 1, 1,
0.6225231, -0.9039822, 1.040046, 0, 0, 1, 1, 1,
0.6264389, -0.6867738, 2.315628, 1, 0, 0, 1, 1,
0.6266918, 1.248324, 0.5934312, 1, 0, 0, 1, 1,
0.6273503, -0.4644063, 1.908625, 1, 0, 0, 1, 1,
0.6300728, -2.19323, 2.975439, 1, 0, 0, 1, 1,
0.6333454, 0.4189827, 2.366378, 1, 0, 0, 1, 1,
0.6358299, 0.3037912, 0.02949359, 0, 0, 0, 1, 1,
0.6466805, -1.099656, 1.35692, 0, 0, 0, 1, 1,
0.6518036, 0.2132143, 3.405888, 0, 0, 0, 1, 1,
0.6616209, 0.7646891, 1.098865, 0, 0, 0, 1, 1,
0.6706791, 1.186251, 0.4268246, 0, 0, 0, 1, 1,
0.6746421, -0.3024972, 1.121416, 0, 0, 0, 1, 1,
0.6746671, -0.7469776, 1.257725, 0, 0, 0, 1, 1,
0.6747538, 0.6848174, 1.939816, 1, 1, 1, 1, 1,
0.6754655, -1.048421, 3.407056, 1, 1, 1, 1, 1,
0.6798201, -1.262841, 2.338259, 1, 1, 1, 1, 1,
0.6828636, 1.433474, 1.518695, 1, 1, 1, 1, 1,
0.6872779, -1.113876, 1.758567, 1, 1, 1, 1, 1,
0.687745, -1.175243, 1.924582, 1, 1, 1, 1, 1,
0.688222, -1.579922, 2.760863, 1, 1, 1, 1, 1,
0.6952796, 0.2890329, 0.03455168, 1, 1, 1, 1, 1,
0.7051941, -1.066915, 1.537698, 1, 1, 1, 1, 1,
0.706336, 0.8576703, 0.8061182, 1, 1, 1, 1, 1,
0.71161, 0.8340176, 0.159783, 1, 1, 1, 1, 1,
0.7118191, -0.3027798, 2.345116, 1, 1, 1, 1, 1,
0.7131178, 1.384677, 0.27194, 1, 1, 1, 1, 1,
0.7159047, 0.02906319, 1.406444, 1, 1, 1, 1, 1,
0.7167108, -1.621012, 1.867712, 1, 1, 1, 1, 1,
0.7168558, -0.07565136, 1.49035, 0, 0, 1, 1, 1,
0.7175214, 0.5583588, -0.3404942, 1, 0, 0, 1, 1,
0.7179534, -1.139957, 2.017892, 1, 0, 0, 1, 1,
0.7315707, 0.535661, 0.5392607, 1, 0, 0, 1, 1,
0.7340971, 1.544209, 0.5244913, 1, 0, 0, 1, 1,
0.7360678, -0.7499949, 1.504884, 1, 0, 0, 1, 1,
0.7518044, 0.4636199, 1.722224, 0, 0, 0, 1, 1,
0.7522981, -0.2248719, 2.144862, 0, 0, 0, 1, 1,
0.7595264, -0.001063844, 2.588437, 0, 0, 0, 1, 1,
0.7756881, 0.2638179, 1.07312, 0, 0, 0, 1, 1,
0.7770653, -0.2563125, 1.278075, 0, 0, 0, 1, 1,
0.7858217, -0.4792488, 2.974137, 0, 0, 0, 1, 1,
0.7861606, -1.006013, 2.344267, 0, 0, 0, 1, 1,
0.8004618, 0.6559716, 2.433624, 1, 1, 1, 1, 1,
0.8079425, 0.752215, 2.125041, 1, 1, 1, 1, 1,
0.8147435, -0.629511, 1.941311, 1, 1, 1, 1, 1,
0.8235394, -1.07683, 2.111583, 1, 1, 1, 1, 1,
0.8277264, 0.4889422, 3.187041, 1, 1, 1, 1, 1,
0.8301969, 0.6641654, -0.04498922, 1, 1, 1, 1, 1,
0.8305026, 1.275226, -0.6382423, 1, 1, 1, 1, 1,
0.8359637, 0.01371743, 1.633132, 1, 1, 1, 1, 1,
0.84107, -1.416839, 2.514561, 1, 1, 1, 1, 1,
0.8417365, 1.973178, -1.964244, 1, 1, 1, 1, 1,
0.8423856, 0.678906, -0.15487, 1, 1, 1, 1, 1,
0.8425496, 0.3825954, 1.417693, 1, 1, 1, 1, 1,
0.8474991, -1.173644, 2.83134, 1, 1, 1, 1, 1,
0.848342, 2.014483, 1.198901, 1, 1, 1, 1, 1,
0.8485311, 1.469745, 0.9954522, 1, 1, 1, 1, 1,
0.8534985, -1.10842, 4.080824, 0, 0, 1, 1, 1,
0.8612453, 0.2866044, -0.09173203, 1, 0, 0, 1, 1,
0.8622935, 0.3381557, 2.315667, 1, 0, 0, 1, 1,
0.8628925, 0.6613865, 0.5889431, 1, 0, 0, 1, 1,
0.8646982, -0.2294244, 1.980415, 1, 0, 0, 1, 1,
0.8750747, 0.4587877, 0.7269709, 1, 0, 0, 1, 1,
0.8752018, 1.126837, 1.724395, 0, 0, 0, 1, 1,
0.87652, 1.455402, 1.066481, 0, 0, 0, 1, 1,
0.8786885, -1.286235, 2.870829, 0, 0, 0, 1, 1,
0.8821949, 1.374208, -0.2654662, 0, 0, 0, 1, 1,
0.8828191, 0.3035722, 0.2270362, 0, 0, 0, 1, 1,
0.8861189, -0.9244869, 2.572663, 0, 0, 0, 1, 1,
0.8897777, -0.06494182, 1.215546, 0, 0, 0, 1, 1,
0.8963848, 0.2494534, 1.505653, 1, 1, 1, 1, 1,
0.9039184, -0.7548746, 1.34469, 1, 1, 1, 1, 1,
0.9090008, 0.4658302, -0.03496796, 1, 1, 1, 1, 1,
0.9140414, -0.1904549, 1.383834, 1, 1, 1, 1, 1,
0.9141217, 2.200335, 0.244907, 1, 1, 1, 1, 1,
0.9160839, 1.097082, 1.308288, 1, 1, 1, 1, 1,
0.9181231, 0.5738045, 1.991594, 1, 1, 1, 1, 1,
0.9186473, 0.2521102, 1.204455, 1, 1, 1, 1, 1,
0.927159, 1.109832, -1.012424, 1, 1, 1, 1, 1,
0.9272085, 0.01968712, 0.6440116, 1, 1, 1, 1, 1,
0.9368811, -0.4901302, -0.277238, 1, 1, 1, 1, 1,
0.9376496, 0.6309574, 1.906537, 1, 1, 1, 1, 1,
0.9393688, 0.3054855, -0.02427855, 1, 1, 1, 1, 1,
0.9399571, 0.7976679, 0.9162629, 1, 1, 1, 1, 1,
0.9477281, 1.262446, 0.2972039, 1, 1, 1, 1, 1,
0.9481499, 1.271061, 3.867657, 0, 0, 1, 1, 1,
0.9491097, 1.926014, 0.9349306, 1, 0, 0, 1, 1,
0.9501394, 0.7768581, -0.6434125, 1, 0, 0, 1, 1,
0.9547575, 0.3521605, 2.982051, 1, 0, 0, 1, 1,
0.9615909, 0.6634333, 0.9601808, 1, 0, 0, 1, 1,
0.9657169, 0.716553, 0.6589453, 1, 0, 0, 1, 1,
0.9682548, 1.470301, 2.525927, 0, 0, 0, 1, 1,
0.9712896, -1.057793, 2.423667, 0, 0, 0, 1, 1,
0.9714132, -2.826837, 1.451589, 0, 0, 0, 1, 1,
0.9755343, -0.07367357, 1.367385, 0, 0, 0, 1, 1,
0.9780263, 0.8540716, 0.2345976, 0, 0, 0, 1, 1,
0.989898, 0.9731201, 0.7407812, 0, 0, 0, 1, 1,
0.9935774, 0.3193959, 0.3550458, 0, 0, 0, 1, 1,
0.9956635, 1.778725, 0.5848863, 1, 1, 1, 1, 1,
1.000591, 0.1684558, 1.146884, 1, 1, 1, 1, 1,
1.001579, -0.2262501, -0.6048833, 1, 1, 1, 1, 1,
1.021912, 0.4285492, 1.604334, 1, 1, 1, 1, 1,
1.021917, 0.7197183, 2.733111, 1, 1, 1, 1, 1,
1.027225, -1.348446, 3.180576, 1, 1, 1, 1, 1,
1.033492, 0.4740652, 1.43483, 1, 1, 1, 1, 1,
1.033925, 0.3152296, -0.9066905, 1, 1, 1, 1, 1,
1.034661, -0.5194043, 2.916042, 1, 1, 1, 1, 1,
1.035028, -0.4679058, 0.8718882, 1, 1, 1, 1, 1,
1.043633, 0.3043464, 0.06023541, 1, 1, 1, 1, 1,
1.047022, -0.1676071, 2.349713, 1, 1, 1, 1, 1,
1.04993, 1.646128, -0.7519407, 1, 1, 1, 1, 1,
1.056368, -0.291834, 2.065214, 1, 1, 1, 1, 1,
1.061215, 0.1319, 1.512125, 1, 1, 1, 1, 1,
1.062137, -0.3803808, 2.43852, 0, 0, 1, 1, 1,
1.082469, 0.2077728, 2.140332, 1, 0, 0, 1, 1,
1.09138, -0.04142416, 3.356084, 1, 0, 0, 1, 1,
1.097133, -1.126362, 2.428705, 1, 0, 0, 1, 1,
1.099152, -0.6122099, 2.096187, 1, 0, 0, 1, 1,
1.109099, -1.058571, 2.013951, 1, 0, 0, 1, 1,
1.111669, -0.1069083, 2.119843, 0, 0, 0, 1, 1,
1.117427, -0.4697227, 1.713372, 0, 0, 0, 1, 1,
1.125047, -0.02024519, 1.753416, 0, 0, 0, 1, 1,
1.128891, -1.239734, 3.852351, 0, 0, 0, 1, 1,
1.141942, 1.527129, 1.205977, 0, 0, 0, 1, 1,
1.142202, 0.6166601, 1.203572, 0, 0, 0, 1, 1,
1.145902, 0.6310751, 3.934734, 0, 0, 0, 1, 1,
1.154681, -1.041468, 3.259023, 1, 1, 1, 1, 1,
1.156466, 0.4156794, 2.018252, 1, 1, 1, 1, 1,
1.159101, 0.9915226, 0.6900734, 1, 1, 1, 1, 1,
1.163515, 0.6339256, -1.371757, 1, 1, 1, 1, 1,
1.165516, 1.097679, 2.032379, 1, 1, 1, 1, 1,
1.171947, 1.891428, 1.03649, 1, 1, 1, 1, 1,
1.17244, -0.4115615, 0.1930574, 1, 1, 1, 1, 1,
1.172782, 2.150323, 1.404408, 1, 1, 1, 1, 1,
1.180548, 2.525083, 0.7342731, 1, 1, 1, 1, 1,
1.198164, -0.9221206, 1.309149, 1, 1, 1, 1, 1,
1.200264, 1.575608, 1.583087, 1, 1, 1, 1, 1,
1.208316, -1.708341, 3.778342, 1, 1, 1, 1, 1,
1.222082, 0.8004634, 1.774842, 1, 1, 1, 1, 1,
1.222105, 0.6242478, 1.451733, 1, 1, 1, 1, 1,
1.240985, 1.453056, 1.770773, 1, 1, 1, 1, 1,
1.247064, -1.23282, 1.436299, 0, 0, 1, 1, 1,
1.24911, -0.4001793, 0.7350573, 1, 0, 0, 1, 1,
1.258963, -0.2302028, -0.007045186, 1, 0, 0, 1, 1,
1.260742, 0.3218166, 3.309459, 1, 0, 0, 1, 1,
1.264009, 0.3541568, 2.14096, 1, 0, 0, 1, 1,
1.271787, 0.74832, 1.919484, 1, 0, 0, 1, 1,
1.277437, -1.275494, 4.020616, 0, 0, 0, 1, 1,
1.277783, -0.6325344, 3.027754, 0, 0, 0, 1, 1,
1.287331, -0.3940559, 1.368224, 0, 0, 0, 1, 1,
1.296225, 0.4086287, 2.010345, 0, 0, 0, 1, 1,
1.297631, 0.33197, 1.251725, 0, 0, 0, 1, 1,
1.301366, 0.4951914, 1.657718, 0, 0, 0, 1, 1,
1.30723, -0.7569687, 0.9173452, 0, 0, 0, 1, 1,
1.313372, -0.5236236, 1.605929, 1, 1, 1, 1, 1,
1.320032, 1.549417, 0.5447437, 1, 1, 1, 1, 1,
1.324679, 0.6586264, 1.276988, 1, 1, 1, 1, 1,
1.335355, -0.5508084, 2.570626, 1, 1, 1, 1, 1,
1.33808, 0.8135442, 1.068844, 1, 1, 1, 1, 1,
1.354143, 0.9654679, 1.605381, 1, 1, 1, 1, 1,
1.364564, -1.219758, 3.042773, 1, 1, 1, 1, 1,
1.384143, 0.7773926, 1.197537, 1, 1, 1, 1, 1,
1.397382, -1.201087, 2.017035, 1, 1, 1, 1, 1,
1.399643, 0.4710531, 2.324826, 1, 1, 1, 1, 1,
1.404912, 0.6007038, 1.72776, 1, 1, 1, 1, 1,
1.405832, 0.1504929, 1.463325, 1, 1, 1, 1, 1,
1.423871, 0.6082137, 3.263567, 1, 1, 1, 1, 1,
1.427184, -0.7073969, 0.01810872, 1, 1, 1, 1, 1,
1.428004, 0.6124044, 1.550194, 1, 1, 1, 1, 1,
1.436438, -1.253142, 2.076306, 0, 0, 1, 1, 1,
1.448448, -0.1547106, 2.333061, 1, 0, 0, 1, 1,
1.449128, -1.187445, 1.30166, 1, 0, 0, 1, 1,
1.450098, -1.120929, 3.54309, 1, 0, 0, 1, 1,
1.450451, -2.23168, 3.339586, 1, 0, 0, 1, 1,
1.465855, -0.3609582, 2.382791, 1, 0, 0, 1, 1,
1.474653, 0.2846231, 0.7158754, 0, 0, 0, 1, 1,
1.474916, 0.1873942, 3.335493, 0, 0, 0, 1, 1,
1.477361, 1.585736, 0.3658468, 0, 0, 0, 1, 1,
1.485646, -0.2619416, 1.773491, 0, 0, 0, 1, 1,
1.495669, 0.09441812, 0.2599964, 0, 0, 0, 1, 1,
1.499557, 0.1681578, 2.058334, 0, 0, 0, 1, 1,
1.500001, -0.1882871, 2.419311, 0, 0, 0, 1, 1,
1.503347, -0.4491431, 3.452349, 1, 1, 1, 1, 1,
1.50379, 0.7257133, 2.260457, 1, 1, 1, 1, 1,
1.508909, -0.8601919, 3.794501, 1, 1, 1, 1, 1,
1.509791, -1.02712, 2.305981, 1, 1, 1, 1, 1,
1.52766, 0.7887008, 1.56701, 1, 1, 1, 1, 1,
1.530842, 1.057731, 2.210139, 1, 1, 1, 1, 1,
1.538834, 0.4790974, 1.358495, 1, 1, 1, 1, 1,
1.552737, 0.4520326, 1.284189, 1, 1, 1, 1, 1,
1.559156, 0.6701719, 0.4544066, 1, 1, 1, 1, 1,
1.562779, 1.071515, 1.46622, 1, 1, 1, 1, 1,
1.563174, 0.2706752, 2.234774, 1, 1, 1, 1, 1,
1.603611, 0.3607451, 3.018116, 1, 1, 1, 1, 1,
1.609124, 0.6571452, 0.4023967, 1, 1, 1, 1, 1,
1.617274, 1.311697, 0.4724484, 1, 1, 1, 1, 1,
1.622697, -0.3632185, 2.321905, 1, 1, 1, 1, 1,
1.624827, 1.251426, 1.307975, 0, 0, 1, 1, 1,
1.62644, 0.1698763, 0.3810798, 1, 0, 0, 1, 1,
1.639969, -1.381356, 1.316753, 1, 0, 0, 1, 1,
1.642789, 0.3033116, 2.032547, 1, 0, 0, 1, 1,
1.651873, -0.811157, 1.229954, 1, 0, 0, 1, 1,
1.662688, 0.07220424, 0.6975821, 1, 0, 0, 1, 1,
1.672591, -0.280358, 0.679692, 0, 0, 0, 1, 1,
1.673112, 1.247485, 1.091405, 0, 0, 0, 1, 1,
1.691612, 1.775571, 2.488221, 0, 0, 0, 1, 1,
1.7202, -0.3582807, 0.6054675, 0, 0, 0, 1, 1,
1.751793, -0.2085021, 0.3281591, 0, 0, 0, 1, 1,
1.773759, 0.4753501, 0.2077354, 0, 0, 0, 1, 1,
1.774279, -0.8663937, 2.036783, 0, 0, 0, 1, 1,
1.796357, -0.3674332, 1.087298, 1, 1, 1, 1, 1,
1.823367, -0.6272345, 1.924769, 1, 1, 1, 1, 1,
1.836951, -1.143482, 1.505101, 1, 1, 1, 1, 1,
1.85072, 0.2730548, 1.28573, 1, 1, 1, 1, 1,
1.864569, -1.392026, 2.398017, 1, 1, 1, 1, 1,
1.865072, 1.113692, 0.1821794, 1, 1, 1, 1, 1,
1.873023, 1.460016, -1.802683, 1, 1, 1, 1, 1,
1.875298, -0.1315752, 0.4118682, 1, 1, 1, 1, 1,
1.881841, 0.8665005, 0.4506578, 1, 1, 1, 1, 1,
1.890581, -0.7934884, 2.492688, 1, 1, 1, 1, 1,
1.908738, -1.005655, 1.245269, 1, 1, 1, 1, 1,
1.966955, -0.5041294, 0.5813535, 1, 1, 1, 1, 1,
1.981865, -1.733078, 2.402325, 1, 1, 1, 1, 1,
1.983593, -0.4162472, 2.001167, 1, 1, 1, 1, 1,
2.024642, 1.00253, -0.2467001, 1, 1, 1, 1, 1,
2.041777, -0.6816209, 2.365844, 0, 0, 1, 1, 1,
2.059886, -0.3133783, 0.1836544, 1, 0, 0, 1, 1,
2.110609, -0.28814, 2.073735, 1, 0, 0, 1, 1,
2.11788, 0.5800742, 2.180348, 1, 0, 0, 1, 1,
2.120436, 0.4865671, 2.092105, 1, 0, 0, 1, 1,
2.135055, 1.674017, -0.430814, 1, 0, 0, 1, 1,
2.194618, 0.5362645, -0.4664188, 0, 0, 0, 1, 1,
2.203939, 0.01148332, -0.06603182, 0, 0, 0, 1, 1,
2.259268, -2.019024, 4.086143, 0, 0, 0, 1, 1,
2.264808, 0.04706791, 0.4842393, 0, 0, 0, 1, 1,
2.268412, 0.9332998, 2.418112, 0, 0, 0, 1, 1,
2.324356, 0.7314651, 2.256458, 0, 0, 0, 1, 1,
2.35731, 0.06109832, 1.806288, 0, 0, 0, 1, 1,
2.395982, 0.7929322, 2.942547, 1, 1, 1, 1, 1,
2.521045, 0.08070112, 2.437004, 1, 1, 1, 1, 1,
2.550345, -0.6557451, 1.890841, 1, 1, 1, 1, 1,
2.597942, -0.6766798, -0.7434143, 1, 1, 1, 1, 1,
2.661307, 0.7392638, 1.027376, 1, 1, 1, 1, 1,
2.724257, -0.8017153, 1.776633, 1, 1, 1, 1, 1,
2.742123, -1.297389, 3.611855, 1, 1, 1, 1, 1
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
var radius = 9.560539;
var distance = 33.58099;
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
mvMatrix.translate( 0.1979318, -0.09194267, -0.4536772 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.58099);
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
