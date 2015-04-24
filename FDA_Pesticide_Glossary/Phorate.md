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
-3.317252, -2.0255, -3.662455, 1, 0, 0, 1,
-3.146912, -1.517306, -1.588984, 1, 0.007843138, 0, 1,
-2.774174, -0.4021793, -2.550695, 1, 0.01176471, 0, 1,
-2.772231, -0.5861516, -2.009091, 1, 0.01960784, 0, 1,
-2.657754, 0.6220228, -1.691671, 1, 0.02352941, 0, 1,
-2.646693, 1.091365, -1.678566, 1, 0.03137255, 0, 1,
-2.618913, 0.5451314, -3.329834, 1, 0.03529412, 0, 1,
-2.597646, -0.3970225, -1.765298, 1, 0.04313726, 0, 1,
-2.468926, -1.640767, -1.327807, 1, 0.04705882, 0, 1,
-2.419685, 0.1814475, -3.992584, 1, 0.05490196, 0, 1,
-2.364333, 0.8529062, -2.036326, 1, 0.05882353, 0, 1,
-2.256764, -1.130604, -1.742032, 1, 0.06666667, 0, 1,
-2.255354, 1.381582, 0.7272526, 1, 0.07058824, 0, 1,
-2.195555, -1.231568, -1.323948, 1, 0.07843138, 0, 1,
-2.146022, -0.5601928, -0.1920141, 1, 0.08235294, 0, 1,
-2.133174, 0.182479, -0.4787195, 1, 0.09019608, 0, 1,
-2.046929, 0.1064181, -2.051957, 1, 0.09411765, 0, 1,
-1.98015, 0.5800778, -0.5485772, 1, 0.1019608, 0, 1,
-1.922574, -0.6469727, -1.816535, 1, 0.1098039, 0, 1,
-1.914202, -1.248595, -1.417886, 1, 0.1137255, 0, 1,
-1.903806, 0.8739098, -0.3143363, 1, 0.1215686, 0, 1,
-1.886757, -0.6320981, -1.862525, 1, 0.1254902, 0, 1,
-1.843457, 0.264526, -2.20823, 1, 0.1333333, 0, 1,
-1.840932, -0.5517898, -2.226875, 1, 0.1372549, 0, 1,
-1.834893, 0.7017249, -1.240644, 1, 0.145098, 0, 1,
-1.817921, 0.3789622, -1.224763, 1, 0.1490196, 0, 1,
-1.800258, -0.2249845, -2.420992, 1, 0.1568628, 0, 1,
-1.776631, -0.2108093, -1.834537, 1, 0.1607843, 0, 1,
-1.752822, -0.6665385, -2.690383, 1, 0.1686275, 0, 1,
-1.749895, -1.045319, -3.511753, 1, 0.172549, 0, 1,
-1.742345, 1.394679, -1.479061, 1, 0.1803922, 0, 1,
-1.738683, -0.6029093, -1.957813, 1, 0.1843137, 0, 1,
-1.719769, -0.6354145, -3.104353, 1, 0.1921569, 0, 1,
-1.716619, -0.3689148, -1.650195, 1, 0.1960784, 0, 1,
-1.709477, 0.3465561, -3.098815, 1, 0.2039216, 0, 1,
-1.709216, -0.4825385, -2.601806, 1, 0.2117647, 0, 1,
-1.705446, -0.1598857, -1.037796, 1, 0.2156863, 0, 1,
-1.688411, 1.208397, -0.7875303, 1, 0.2235294, 0, 1,
-1.673482, -0.6747248, -2.02691, 1, 0.227451, 0, 1,
-1.663989, -0.6304976, -0.7649088, 1, 0.2352941, 0, 1,
-1.656475, 0.1180503, -1.443912, 1, 0.2392157, 0, 1,
-1.65545, -0.2016479, -1.202544, 1, 0.2470588, 0, 1,
-1.63892, 1.594562, -1.885104, 1, 0.2509804, 0, 1,
-1.637304, -0.8926949, -0.8530489, 1, 0.2588235, 0, 1,
-1.630318, 0.03490403, -2.15255, 1, 0.2627451, 0, 1,
-1.629533, -0.7804425, -1.825193, 1, 0.2705882, 0, 1,
-1.627643, 0.8775019, -0.07189374, 1, 0.2745098, 0, 1,
-1.606319, 0.1492786, -1.181471, 1, 0.282353, 0, 1,
-1.601851, 0.8279824, -1.474316, 1, 0.2862745, 0, 1,
-1.599415, -0.8882511, -0.2305479, 1, 0.2941177, 0, 1,
-1.582656, 0.02296699, -2.117647, 1, 0.3019608, 0, 1,
-1.572588, -0.3095974, -1.063553, 1, 0.3058824, 0, 1,
-1.566781, 1.252881, -1.625339, 1, 0.3137255, 0, 1,
-1.565067, 0.8304019, -0.0434552, 1, 0.3176471, 0, 1,
-1.559558, -1.401863, -1.620018, 1, 0.3254902, 0, 1,
-1.546722, -1.429027, -3.368213, 1, 0.3294118, 0, 1,
-1.534872, 1.399302, -0.2490761, 1, 0.3372549, 0, 1,
-1.52094, 1.657297, -0.05373418, 1, 0.3411765, 0, 1,
-1.51377, -0.2480301, -1.330882, 1, 0.3490196, 0, 1,
-1.478517, -0.02851944, -0.123766, 1, 0.3529412, 0, 1,
-1.465935, 0.6148157, -0.7233632, 1, 0.3607843, 0, 1,
-1.459091, 0.2660757, -1.813287, 1, 0.3647059, 0, 1,
-1.449189, -0.7854274, -2.483691, 1, 0.372549, 0, 1,
-1.443521, -0.3545538, -1.492232, 1, 0.3764706, 0, 1,
-1.423534, -0.3587478, -0.6423198, 1, 0.3843137, 0, 1,
-1.422526, -0.8380506, -1.708551, 1, 0.3882353, 0, 1,
-1.418753, 0.3637226, -0.5703276, 1, 0.3960784, 0, 1,
-1.414298, 0.8851641, -1.099059, 1, 0.4039216, 0, 1,
-1.413662, -1.19843, -2.9921, 1, 0.4078431, 0, 1,
-1.400771, -0.4056989, -2.144078, 1, 0.4156863, 0, 1,
-1.394409, -0.05670149, -2.638762, 1, 0.4196078, 0, 1,
-1.392024, -0.0679423, -0.9852872, 1, 0.427451, 0, 1,
-1.389086, -0.2868701, -0.0003823106, 1, 0.4313726, 0, 1,
-1.389021, -0.1550699, -0.9691055, 1, 0.4392157, 0, 1,
-1.388223, -0.5117451, -4.904648, 1, 0.4431373, 0, 1,
-1.38523, 0.7748954, -0.5645445, 1, 0.4509804, 0, 1,
-1.361977, -1.03537, -2.250185, 1, 0.454902, 0, 1,
-1.347288, -1.42979, -4.891282, 1, 0.4627451, 0, 1,
-1.346341, 0.4239587, -1.335737, 1, 0.4666667, 0, 1,
-1.345457, 0.4855875, -0.9025107, 1, 0.4745098, 0, 1,
-1.340754, 0.1343952, -1.742337, 1, 0.4784314, 0, 1,
-1.332661, 0.5270408, -0.8812007, 1, 0.4862745, 0, 1,
-1.33203, 0.1054012, -0.5171408, 1, 0.4901961, 0, 1,
-1.324306, -1.107934, -2.194227, 1, 0.4980392, 0, 1,
-1.321971, 1.272789, 0.07971036, 1, 0.5058824, 0, 1,
-1.304992, 0.9210533, -2.518257, 1, 0.509804, 0, 1,
-1.304964, -0.6209579, -2.85194, 1, 0.5176471, 0, 1,
-1.301665, -0.6178345, -2.477024, 1, 0.5215687, 0, 1,
-1.287271, -0.877692, -1.914457, 1, 0.5294118, 0, 1,
-1.284268, 0.6099764, 0.3989496, 1, 0.5333334, 0, 1,
-1.278381, -1.634173, -5.214721, 1, 0.5411765, 0, 1,
-1.270622, 1.592256, -1.256011, 1, 0.5450981, 0, 1,
-1.269667, -1.216526, -3.578835, 1, 0.5529412, 0, 1,
-1.264668, 0.4020673, 0.2740996, 1, 0.5568628, 0, 1,
-1.251514, -2.173683, -1.425858, 1, 0.5647059, 0, 1,
-1.251486, -0.7940487, -0.8928421, 1, 0.5686275, 0, 1,
-1.247043, 0.06055845, -0.7872581, 1, 0.5764706, 0, 1,
-1.245105, 0.1209201, -0.8858345, 1, 0.5803922, 0, 1,
-1.24045, 0.7470021, -0.4417303, 1, 0.5882353, 0, 1,
-1.240066, -1.043555, -2.408315, 1, 0.5921569, 0, 1,
-1.225754, -1.501117, -2.75352, 1, 0.6, 0, 1,
-1.225122, 1.258777, -0.3203999, 1, 0.6078432, 0, 1,
-1.219275, -0.627883, -2.699804, 1, 0.6117647, 0, 1,
-1.212998, -0.1993262, -1.714677, 1, 0.6196079, 0, 1,
-1.207321, -0.3209002, -2.328756, 1, 0.6235294, 0, 1,
-1.201279, -0.9906996, -3.248653, 1, 0.6313726, 0, 1,
-1.196392, 0.8509768, 0.689751, 1, 0.6352941, 0, 1,
-1.193407, 0.8559607, 0.2414083, 1, 0.6431373, 0, 1,
-1.182299, -0.930927, -2.678952, 1, 0.6470588, 0, 1,
-1.177796, -0.6796315, -1.727209, 1, 0.654902, 0, 1,
-1.176746, 1.885011, -1.548135, 1, 0.6588235, 0, 1,
-1.173869, 0.1131773, -1.223545, 1, 0.6666667, 0, 1,
-1.164733, -0.8485419, -3.067378, 1, 0.6705883, 0, 1,
-1.16098, -0.09204707, -1.544354, 1, 0.6784314, 0, 1,
-1.152196, -0.09443349, -0.9775594, 1, 0.682353, 0, 1,
-1.136814, -0.2374137, -0.773364, 1, 0.6901961, 0, 1,
-1.132102, 0.9340119, -0.7406194, 1, 0.6941177, 0, 1,
-1.132059, 0.3857192, -1.798766, 1, 0.7019608, 0, 1,
-1.114117, -0.3268887, -1.635654, 1, 0.7098039, 0, 1,
-1.103499, 0.1393569, -0.07577743, 1, 0.7137255, 0, 1,
-1.099797, -0.4150907, -1.900744, 1, 0.7215686, 0, 1,
-1.098744, -1.024258, -2.600379, 1, 0.7254902, 0, 1,
-1.097934, 0.2869403, -2.557669, 1, 0.7333333, 0, 1,
-1.09682, -0.1884783, -1.234836, 1, 0.7372549, 0, 1,
-1.095285, -0.3457914, -2.890682, 1, 0.7450981, 0, 1,
-1.09383, 1.073454, -0.7394087, 1, 0.7490196, 0, 1,
-1.090998, -0.1179492, -1.710858, 1, 0.7568628, 0, 1,
-1.08759, 0.05463257, -1.037354, 1, 0.7607843, 0, 1,
-1.080426, 0.4859911, 0.2547923, 1, 0.7686275, 0, 1,
-1.079211, 0.5523139, 0.0461974, 1, 0.772549, 0, 1,
-1.075447, 0.4602649, -0.3571657, 1, 0.7803922, 0, 1,
-1.073646, 0.9347961, -1.228816, 1, 0.7843137, 0, 1,
-1.072165, -0.2965366, -0.5676452, 1, 0.7921569, 0, 1,
-1.071409, 0.5695805, -1.660232, 1, 0.7960784, 0, 1,
-1.070612, -1.217305, -3.287998, 1, 0.8039216, 0, 1,
-1.06582, -0.159525, -2.245641, 1, 0.8117647, 0, 1,
-1.050549, -1.306036, -2.895846, 1, 0.8156863, 0, 1,
-1.049963, -1.423639, -4.311061, 1, 0.8235294, 0, 1,
-1.045172, 0.6713141, -1.002303, 1, 0.827451, 0, 1,
-1.044243, 2.081848, -0.936275, 1, 0.8352941, 0, 1,
-1.038916, 0.9324717, -0.9049457, 1, 0.8392157, 0, 1,
-1.035735, 1.578544, -0.9720851, 1, 0.8470588, 0, 1,
-1.033866, -0.5196533, -2.472978, 1, 0.8509804, 0, 1,
-1.033041, -2.487937, -2.029718, 1, 0.8588235, 0, 1,
-1.026826, 0.7940805, -2.805778, 1, 0.8627451, 0, 1,
-1.023014, 1.01296, 1.297861, 1, 0.8705882, 0, 1,
-1.01317, -0.6132556, -3.837423, 1, 0.8745098, 0, 1,
-1.012386, -1.057335, -4.550993, 1, 0.8823529, 0, 1,
-1.009373, -0.53215, -2.287639, 1, 0.8862745, 0, 1,
-1.009256, -0.9541076, -1.176371, 1, 0.8941177, 0, 1,
-1.00843, -1.085093, -2.616391, 1, 0.8980392, 0, 1,
-1.00811, -1.194844, -2.337979, 1, 0.9058824, 0, 1,
-1.005807, 0.4523187, -0.4270055, 1, 0.9137255, 0, 1,
-1.000121, -1.112766, -2.333468, 1, 0.9176471, 0, 1,
-0.9900701, 0.5375027, -1.14501, 1, 0.9254902, 0, 1,
-0.9896653, 1.207162, 0.9040388, 1, 0.9294118, 0, 1,
-0.9858794, -0.1951434, -0.9935189, 1, 0.9372549, 0, 1,
-0.9835433, 0.1127516, -2.793895, 1, 0.9411765, 0, 1,
-0.976599, 1.850946, -0.9017314, 1, 0.9490196, 0, 1,
-0.9673571, -0.9773632, -2.574472, 1, 0.9529412, 0, 1,
-0.9570076, -0.05155037, -1.95586, 1, 0.9607843, 0, 1,
-0.956886, 1.202774, -0.9225625, 1, 0.9647059, 0, 1,
-0.9551528, 1.497707, -2.747351, 1, 0.972549, 0, 1,
-0.9539461, 0.2298369, -0.6024675, 1, 0.9764706, 0, 1,
-0.9535732, -0.8763185, -3.174931, 1, 0.9843137, 0, 1,
-0.9497034, -1.165816, -3.513492, 1, 0.9882353, 0, 1,
-0.9432591, -1.159542, -2.420059, 1, 0.9960784, 0, 1,
-0.9393834, 0.1238677, -0.4818552, 0.9960784, 1, 0, 1,
-0.9354135, 0.2447687, 1.131524, 0.9921569, 1, 0, 1,
-0.9280344, -1.731038, -2.931431, 0.9843137, 1, 0, 1,
-0.9253383, -1.069898, -3.40439, 0.9803922, 1, 0, 1,
-0.9146141, -1.390282, -1.62624, 0.972549, 1, 0, 1,
-0.9089172, 0.006039031, -0.2734156, 0.9686275, 1, 0, 1,
-0.9053492, 2.239945, 0.5261638, 0.9607843, 1, 0, 1,
-0.9018726, 0.7948822, -0.9017277, 0.9568627, 1, 0, 1,
-0.9010662, 2.313351, -0.9242924, 0.9490196, 1, 0, 1,
-0.899867, -0.7941041, -1.653007, 0.945098, 1, 0, 1,
-0.8989646, -0.5072863, -3.281272, 0.9372549, 1, 0, 1,
-0.8977561, -0.5556645, -2.392403, 0.9333333, 1, 0, 1,
-0.8975096, 1.460458, -1.340036, 0.9254902, 1, 0, 1,
-0.8969116, -0.5431443, -2.826104, 0.9215686, 1, 0, 1,
-0.8960336, -0.166074, -2.469227, 0.9137255, 1, 0, 1,
-0.8936137, 0.8564598, -0.219182, 0.9098039, 1, 0, 1,
-0.888285, -0.1796178, -1.797122, 0.9019608, 1, 0, 1,
-0.8847234, -1.594448, -2.879031, 0.8941177, 1, 0, 1,
-0.880365, -0.8063558, -1.697073, 0.8901961, 1, 0, 1,
-0.8755885, -0.1175694, -2.461693, 0.8823529, 1, 0, 1,
-0.8730803, -0.4478647, -1.378448, 0.8784314, 1, 0, 1,
-0.8635337, -0.4792944, -2.271097, 0.8705882, 1, 0, 1,
-0.8597562, 0.7474089, -0.3281116, 0.8666667, 1, 0, 1,
-0.8568207, -0.1742103, -1.374049, 0.8588235, 1, 0, 1,
-0.8556722, 1.397747, -0.6635935, 0.854902, 1, 0, 1,
-0.8545468, 0.2327643, -1.93778, 0.8470588, 1, 0, 1,
-0.8472109, 1.710824, -1.112493, 0.8431373, 1, 0, 1,
-0.845613, 0.1874823, -2.359155, 0.8352941, 1, 0, 1,
-0.8440846, 0.987159, -1.268984, 0.8313726, 1, 0, 1,
-0.8420118, 0.7475647, -1.448901, 0.8235294, 1, 0, 1,
-0.8398483, 0.105573, -1.015827, 0.8196079, 1, 0, 1,
-0.8304409, 1.063224, 0.4339589, 0.8117647, 1, 0, 1,
-0.8271409, -0.473273, -2.895499, 0.8078431, 1, 0, 1,
-0.8267562, 1.050618, 1.412571, 0.8, 1, 0, 1,
-0.8266418, 1.269926, -0.9970894, 0.7921569, 1, 0, 1,
-0.8242378, -1.260292, -3.724463, 0.7882353, 1, 0, 1,
-0.8153793, 1.187704, -2.600993, 0.7803922, 1, 0, 1,
-0.807404, -0.4013914, -1.569725, 0.7764706, 1, 0, 1,
-0.8036036, 0.7707388, -0.1134877, 0.7686275, 1, 0, 1,
-0.8028191, -0.9170755, -2.569074, 0.7647059, 1, 0, 1,
-0.7975125, -0.7505012, -2.050502, 0.7568628, 1, 0, 1,
-0.7965862, -0.5798359, -3.769445, 0.7529412, 1, 0, 1,
-0.7864742, 0.7697854, -0.9803148, 0.7450981, 1, 0, 1,
-0.7690246, 0.3635057, -1.878249, 0.7411765, 1, 0, 1,
-0.7679181, 1.73105, 0.3630315, 0.7333333, 1, 0, 1,
-0.7677502, 3.645167, -0.8269292, 0.7294118, 1, 0, 1,
-0.7661578, 0.8118704, -2.531103, 0.7215686, 1, 0, 1,
-0.7654034, -0.6708371, -3.581981, 0.7176471, 1, 0, 1,
-0.7619859, 0.4783753, -1.916011, 0.7098039, 1, 0, 1,
-0.7563334, 0.2216905, -1.232912, 0.7058824, 1, 0, 1,
-0.7522867, 0.5227609, -0.8514196, 0.6980392, 1, 0, 1,
-0.7507702, -0.3843565, -1.516621, 0.6901961, 1, 0, 1,
-0.7484709, -0.972096, -2.073042, 0.6862745, 1, 0, 1,
-0.7479445, -1.530706, -2.728606, 0.6784314, 1, 0, 1,
-0.7428065, -1.116608, -2.577574, 0.6745098, 1, 0, 1,
-0.7412925, 0.7919112, -2.343275, 0.6666667, 1, 0, 1,
-0.7343698, -0.2387744, -2.196813, 0.6627451, 1, 0, 1,
-0.7333635, -0.232128, -0.9773456, 0.654902, 1, 0, 1,
-0.7217386, -0.5376274, -2.311766, 0.6509804, 1, 0, 1,
-0.721329, -0.07783771, -0.6548041, 0.6431373, 1, 0, 1,
-0.7203978, -0.817139, -3.620222, 0.6392157, 1, 0, 1,
-0.7140349, 0.320298, -2.68566, 0.6313726, 1, 0, 1,
-0.7046232, -0.6984514, -3.014998, 0.627451, 1, 0, 1,
-0.6971797, -1.039272, -1.127574, 0.6196079, 1, 0, 1,
-0.6959108, 0.4091407, -1.328742, 0.6156863, 1, 0, 1,
-0.6950628, -0.581718, -2.651876, 0.6078432, 1, 0, 1,
-0.6923456, 0.02691535, -1.946469, 0.6039216, 1, 0, 1,
-0.6885933, 0.7797475, -0.4066451, 0.5960785, 1, 0, 1,
-0.6792808, -0.006555019, -1.337297, 0.5882353, 1, 0, 1,
-0.6789452, -0.2775681, -2.278785, 0.5843138, 1, 0, 1,
-0.6749166, 0.4603516, -1.457458, 0.5764706, 1, 0, 1,
-0.6718602, 2.329673, -0.6014662, 0.572549, 1, 0, 1,
-0.6691921, 0.2864874, -0.6785606, 0.5647059, 1, 0, 1,
-0.6676973, -1.802426, -4.678427, 0.5607843, 1, 0, 1,
-0.6616164, -1.215187, -2.51158, 0.5529412, 1, 0, 1,
-0.6599333, -0.1744135, -0.3818819, 0.5490196, 1, 0, 1,
-0.6524552, 0.175199, -0.9687691, 0.5411765, 1, 0, 1,
-0.6476304, -0.681594, -1.397751, 0.5372549, 1, 0, 1,
-0.6456557, -0.7978777, -2.54348, 0.5294118, 1, 0, 1,
-0.6447797, 0.8718594, -1.691312, 0.5254902, 1, 0, 1,
-0.6435314, 0.02015529, -1.097042, 0.5176471, 1, 0, 1,
-0.6383774, -0.7894287, -2.678209, 0.5137255, 1, 0, 1,
-0.6318429, -0.5146748, -3.141335, 0.5058824, 1, 0, 1,
-0.6317348, -0.1246707, -1.949971, 0.5019608, 1, 0, 1,
-0.6259513, -0.2278442, -0.961594, 0.4941176, 1, 0, 1,
-0.6230687, 0.3220647, -1.265805, 0.4862745, 1, 0, 1,
-0.6219421, -1.158014, -1.735746, 0.4823529, 1, 0, 1,
-0.6217927, -0.9594954, -2.386559, 0.4745098, 1, 0, 1,
-0.6206028, -1.857732, -3.714062, 0.4705882, 1, 0, 1,
-0.6195061, -0.1110091, -1.646221, 0.4627451, 1, 0, 1,
-0.6191727, 0.5557351, 1.720289, 0.4588235, 1, 0, 1,
-0.6190531, 1.147045, -1.215687, 0.4509804, 1, 0, 1,
-0.6175883, -1.17087, -1.845244, 0.4470588, 1, 0, 1,
-0.6139829, -0.4792769, -0.9720227, 0.4392157, 1, 0, 1,
-0.6106109, 0.07517074, -1.063629, 0.4352941, 1, 0, 1,
-0.6084568, 1.665918, -1.491065, 0.427451, 1, 0, 1,
-0.6040515, -0.9658413, -2.222824, 0.4235294, 1, 0, 1,
-0.5949195, -0.1349539, -1.94203, 0.4156863, 1, 0, 1,
-0.5888445, -0.8631396, -2.099515, 0.4117647, 1, 0, 1,
-0.5829126, 1.335938, 1.336367, 0.4039216, 1, 0, 1,
-0.5827991, -0.4476761, -3.09975, 0.3960784, 1, 0, 1,
-0.5820888, -1.117086, -2.142364, 0.3921569, 1, 0, 1,
-0.5819877, -0.07526742, -1.570555, 0.3843137, 1, 0, 1,
-0.581836, -0.3186904, -0.8851211, 0.3803922, 1, 0, 1,
-0.5817824, -0.4562219, -2.05475, 0.372549, 1, 0, 1,
-0.579266, 1.031506, 0.9694628, 0.3686275, 1, 0, 1,
-0.5748417, 0.6086335, -0.5602284, 0.3607843, 1, 0, 1,
-0.5705389, -2.293605, -4.861112, 0.3568628, 1, 0, 1,
-0.5670822, -0.566672, -3.402154, 0.3490196, 1, 0, 1,
-0.5637846, -1.550511, -3.291488, 0.345098, 1, 0, 1,
-0.5632074, 0.1662251, -0.4692464, 0.3372549, 1, 0, 1,
-0.5625705, -0.6541387, -2.216655, 0.3333333, 1, 0, 1,
-0.5612021, -0.5955431, -1.873576, 0.3254902, 1, 0, 1,
-0.5604215, -0.5005434, -2.643086, 0.3215686, 1, 0, 1,
-0.5575732, 0.5488542, 0.006672823, 0.3137255, 1, 0, 1,
-0.5553159, -0.8812796, -2.405345, 0.3098039, 1, 0, 1,
-0.5546068, -0.973671, -2.618972, 0.3019608, 1, 0, 1,
-0.5541106, 0.03587142, -1.711929, 0.2941177, 1, 0, 1,
-0.5500655, 1.309741, -0.401396, 0.2901961, 1, 0, 1,
-0.5494998, 0.4927344, -1.822488, 0.282353, 1, 0, 1,
-0.5494249, 0.1642393, -0.6977316, 0.2784314, 1, 0, 1,
-0.5492714, 1.652725, 0.3908862, 0.2705882, 1, 0, 1,
-0.5459849, -0.4172164, -2.725549, 0.2666667, 1, 0, 1,
-0.5401155, 0.3453212, -0.1898038, 0.2588235, 1, 0, 1,
-0.5378043, -0.2060446, -0.05580112, 0.254902, 1, 0, 1,
-0.5352864, 0.5534333, 0.6121416, 0.2470588, 1, 0, 1,
-0.5321631, -1.014578, -0.8593364, 0.2431373, 1, 0, 1,
-0.5301303, -0.0248554, -0.6917759, 0.2352941, 1, 0, 1,
-0.5217808, -1.679903, -3.272943, 0.2313726, 1, 0, 1,
-0.5171034, 0.6804087, -0.1541862, 0.2235294, 1, 0, 1,
-0.5167947, -0.178005, -0.7592254, 0.2196078, 1, 0, 1,
-0.513922, -0.1782999, -0.6515023, 0.2117647, 1, 0, 1,
-0.5093641, -0.5207257, -0.6214474, 0.2078431, 1, 0, 1,
-0.5089273, -0.1234323, -2.944848, 0.2, 1, 0, 1,
-0.5086899, -0.5146548, -4.58711, 0.1921569, 1, 0, 1,
-0.5084847, 0.1907082, -1.134723, 0.1882353, 1, 0, 1,
-0.5019462, -0.6758312, -3.947293, 0.1803922, 1, 0, 1,
-0.4995571, 0.3880513, -1.795986, 0.1764706, 1, 0, 1,
-0.4917829, 0.768661, -1.70201, 0.1686275, 1, 0, 1,
-0.4917822, -2.251818, -3.802587, 0.1647059, 1, 0, 1,
-0.48531, 0.4246237, 0.6233546, 0.1568628, 1, 0, 1,
-0.4775666, -1.739494, -2.027946, 0.1529412, 1, 0, 1,
-0.4771311, 0.686428, -0.7782435, 0.145098, 1, 0, 1,
-0.4766155, -2.412163, -3.690414, 0.1411765, 1, 0, 1,
-0.4746274, 0.1981894, -0.05294306, 0.1333333, 1, 0, 1,
-0.4732031, -0.8876802, -2.79593, 0.1294118, 1, 0, 1,
-0.4719648, -0.08551277, -2.868321, 0.1215686, 1, 0, 1,
-0.4651175, -0.2610634, -2.738385, 0.1176471, 1, 0, 1,
-0.4490591, 0.8214933, -2.594657, 0.1098039, 1, 0, 1,
-0.4485181, -0.4243625, -3.21508, 0.1058824, 1, 0, 1,
-0.4473239, 1.111552, -0.2635876, 0.09803922, 1, 0, 1,
-0.446786, 0.4715072, -0.8628533, 0.09019608, 1, 0, 1,
-0.4423792, 0.8895798, -0.03792776, 0.08627451, 1, 0, 1,
-0.44157, -0.02865811, -2.305361, 0.07843138, 1, 0, 1,
-0.4236054, 1.762015, 0.8110251, 0.07450981, 1, 0, 1,
-0.4222834, -0.222693, -2.416124, 0.06666667, 1, 0, 1,
-0.4194752, 0.6560587, -2.841033, 0.0627451, 1, 0, 1,
-0.4188516, -1.203046, -1.204519, 0.05490196, 1, 0, 1,
-0.4174665, -0.3167489, -1.901699, 0.05098039, 1, 0, 1,
-0.410468, 0.8119852, 0.1865136, 0.04313726, 1, 0, 1,
-0.4097877, 1.331232, -0.5304651, 0.03921569, 1, 0, 1,
-0.4057937, 1.410916, -1.449207, 0.03137255, 1, 0, 1,
-0.4044449, -1.13299, -2.475941, 0.02745098, 1, 0, 1,
-0.4043211, -0.2545677, -3.416497, 0.01960784, 1, 0, 1,
-0.4016636, 1.652121, -0.1492765, 0.01568628, 1, 0, 1,
-0.4006848, -0.5828021, -4.454634, 0.007843138, 1, 0, 1,
-0.3980609, -0.984991, -1.662002, 0.003921569, 1, 0, 1,
-0.3901576, 0.9445947, 0.4880241, 0, 1, 0.003921569, 1,
-0.3829876, -3.002244, -3.17858, 0, 1, 0.01176471, 1,
-0.3806529, -1.165405, -4.23451, 0, 1, 0.01568628, 1,
-0.3748386, 0.2947125, -0.3046104, 0, 1, 0.02352941, 1,
-0.3704082, 0.8812981, 0.1811571, 0, 1, 0.02745098, 1,
-0.3564135, 0.5131497, -1.466628, 0, 1, 0.03529412, 1,
-0.354394, 0.873758, -1.219303, 0, 1, 0.03921569, 1,
-0.3508915, 1.294952, 0.1125999, 0, 1, 0.04705882, 1,
-0.3489085, 2.492078, 2.696853, 0, 1, 0.05098039, 1,
-0.3472797, -1.34017, -4.473865, 0, 1, 0.05882353, 1,
-0.3418698, -0.9850396, -2.773809, 0, 1, 0.0627451, 1,
-0.3377111, -0.6737958, -4.109245, 0, 1, 0.07058824, 1,
-0.3373088, -0.3968358, -2.772687, 0, 1, 0.07450981, 1,
-0.3330384, 0.159299, -2.22014, 0, 1, 0.08235294, 1,
-0.3327231, -0.3140658, -3.440534, 0, 1, 0.08627451, 1,
-0.3303168, 0.106357, -1.236261, 0, 1, 0.09411765, 1,
-0.3290879, 1.525265, -1.778705, 0, 1, 0.1019608, 1,
-0.3229257, 0.5567358, -0.3400503, 0, 1, 0.1058824, 1,
-0.3193462, 2.315039, 0.9310623, 0, 1, 0.1137255, 1,
-0.3187866, -0.8165894, -2.892878, 0, 1, 0.1176471, 1,
-0.3174658, 1.055032, -1.851125, 0, 1, 0.1254902, 1,
-0.3138652, -0.5973633, -1.571359, 0, 1, 0.1294118, 1,
-0.3130831, 1.656285, 0.7409024, 0, 1, 0.1372549, 1,
-0.3121524, -0.4730333, -1.566784, 0, 1, 0.1411765, 1,
-0.3114343, 0.03014268, -0.8628335, 0, 1, 0.1490196, 1,
-0.3039066, -1.738458, -3.441181, 0, 1, 0.1529412, 1,
-0.3000205, 0.372609, -1.300369, 0, 1, 0.1607843, 1,
-0.2983723, -0.9627631, -1.839664, 0, 1, 0.1647059, 1,
-0.2949878, 0.7273905, -0.006155769, 0, 1, 0.172549, 1,
-0.2936942, 0.7637353, 0.004946, 0, 1, 0.1764706, 1,
-0.2935855, -0.4628401, -3.96686, 0, 1, 0.1843137, 1,
-0.293437, -1.782066, -2.191995, 0, 1, 0.1882353, 1,
-0.2924212, -1.038796, -3.623988, 0, 1, 0.1960784, 1,
-0.2819831, -0.04478154, -0.05371542, 0, 1, 0.2039216, 1,
-0.2803108, 0.9993089, -0.5811928, 0, 1, 0.2078431, 1,
-0.2802142, -0.5364183, -2.002314, 0, 1, 0.2156863, 1,
-0.2692492, 1.104208, -0.3563478, 0, 1, 0.2196078, 1,
-0.2666197, -0.8479203, -2.752927, 0, 1, 0.227451, 1,
-0.2637267, 0.02795039, -3.525284, 0, 1, 0.2313726, 1,
-0.263311, 0.2025495, -0.4731365, 0, 1, 0.2392157, 1,
-0.259527, 0.1352341, -1.253978, 0, 1, 0.2431373, 1,
-0.2563165, -0.6206189, -1.782419, 0, 1, 0.2509804, 1,
-0.2549224, 0.6770805, -1.993631, 0, 1, 0.254902, 1,
-0.2520737, 0.3330317, 1.08487, 0, 1, 0.2627451, 1,
-0.2511716, 0.819778, -1.764265, 0, 1, 0.2666667, 1,
-0.2499622, -0.9209977, -3.387769, 0, 1, 0.2745098, 1,
-0.2491741, 0.3912393, -0.9665362, 0, 1, 0.2784314, 1,
-0.2470952, -3.022057, -3.495806, 0, 1, 0.2862745, 1,
-0.2456127, -1.367246, -3.3479, 0, 1, 0.2901961, 1,
-0.2326249, -0.7468463, -2.757277, 0, 1, 0.2980392, 1,
-0.2287709, 0.03944001, -1.590839, 0, 1, 0.3058824, 1,
-0.227389, 0.5562195, -1.851121, 0, 1, 0.3098039, 1,
-0.2260754, 0.0001564681, -2.327466, 0, 1, 0.3176471, 1,
-0.2210408, -0.175247, -3.664703, 0, 1, 0.3215686, 1,
-0.2184408, 0.08062388, -0.2053373, 0, 1, 0.3294118, 1,
-0.2181505, 0.6077974, 0.3681418, 0, 1, 0.3333333, 1,
-0.2168444, -0.8681926, -1.981645, 0, 1, 0.3411765, 1,
-0.2150892, -1.386577, -3.613377, 0, 1, 0.345098, 1,
-0.2139631, 1.216257, 0.6588358, 0, 1, 0.3529412, 1,
-0.2063237, -0.02134648, -2.302921, 0, 1, 0.3568628, 1,
-0.2055688, -1.317202, -5.024125, 0, 1, 0.3647059, 1,
-0.2044274, 0.2571871, 0.3377614, 0, 1, 0.3686275, 1,
-0.2014766, 2.029446, 0.3013106, 0, 1, 0.3764706, 1,
-0.1982321, -2.530374, -4.279895, 0, 1, 0.3803922, 1,
-0.1903954, 1.484412, 0.2855363, 0, 1, 0.3882353, 1,
-0.1889377, -1.571506, -1.862281, 0, 1, 0.3921569, 1,
-0.1871056, 0.3737629, -1.132628, 0, 1, 0.4, 1,
-0.1857057, 1.320407, 0.6961123, 0, 1, 0.4078431, 1,
-0.1805255, 0.9197572, 1.169378, 0, 1, 0.4117647, 1,
-0.1796777, 2.130195, 1.635952, 0, 1, 0.4196078, 1,
-0.1781569, 0.7910968, -1.220203, 0, 1, 0.4235294, 1,
-0.1752903, 0.5136513, -2.248034, 0, 1, 0.4313726, 1,
-0.1744431, 1.171762, -0.04280059, 0, 1, 0.4352941, 1,
-0.174059, -1.900429, -3.107497, 0, 1, 0.4431373, 1,
-0.1713905, -0.8779709, -3.340408, 0, 1, 0.4470588, 1,
-0.1712488, 0.5254456, 0.004198285, 0, 1, 0.454902, 1,
-0.1697073, -0.7272141, -2.80871, 0, 1, 0.4588235, 1,
-0.1683551, -0.4002289, -3.939704, 0, 1, 0.4666667, 1,
-0.1662545, -2.559425, -3.960585, 0, 1, 0.4705882, 1,
-0.1644923, -1.744864, -0.645451, 0, 1, 0.4784314, 1,
-0.1611519, -0.3314764, -1.455987, 0, 1, 0.4823529, 1,
-0.1579825, -1.249143, -2.797536, 0, 1, 0.4901961, 1,
-0.1564762, 0.1855588, -1.498987, 0, 1, 0.4941176, 1,
-0.153835, 0.8504661, -0.07291137, 0, 1, 0.5019608, 1,
-0.1514145, 0.7373908, -0.868798, 0, 1, 0.509804, 1,
-0.14802, 0.1647597, 0.2569596, 0, 1, 0.5137255, 1,
-0.1469935, -0.2506264, -2.991108, 0, 1, 0.5215687, 1,
-0.1467627, 0.9660292, -1.2154, 0, 1, 0.5254902, 1,
-0.1431783, 0.07923799, -1.448244, 0, 1, 0.5333334, 1,
-0.142773, 0.6251144, 0.7403975, 0, 1, 0.5372549, 1,
-0.1411596, -0.5031932, -2.907575, 0, 1, 0.5450981, 1,
-0.1386018, -0.4147339, -3.737054, 0, 1, 0.5490196, 1,
-0.1318032, -0.3901437, -2.804378, 0, 1, 0.5568628, 1,
-0.130948, 2.292154, -0.8103082, 0, 1, 0.5607843, 1,
-0.1307368, 0.7480504, -0.373569, 0, 1, 0.5686275, 1,
-0.1293195, -1.576241, -1.237083, 0, 1, 0.572549, 1,
-0.1290088, 0.1406463, -1.697114, 0, 1, 0.5803922, 1,
-0.123101, 1.981238, -0.8170922, 0, 1, 0.5843138, 1,
-0.1220597, 2.182635, 0.07089408, 0, 1, 0.5921569, 1,
-0.1190911, 0.4508033, -1.004425, 0, 1, 0.5960785, 1,
-0.115156, -0.6752463, -3.074644, 0, 1, 0.6039216, 1,
-0.1140646, 0.2929018, -0.352921, 0, 1, 0.6117647, 1,
-0.1092252, 0.1897032, -1.519472, 0, 1, 0.6156863, 1,
-0.1052122, 0.002360946, -1.538136, 0, 1, 0.6235294, 1,
-0.1036735, -0.5048686, -3.569527, 0, 1, 0.627451, 1,
-0.09870192, -0.3905202, -2.951082, 0, 1, 0.6352941, 1,
-0.09667761, 0.7661287, -0.9717936, 0, 1, 0.6392157, 1,
-0.09652046, 1.418689, 2.17933, 0, 1, 0.6470588, 1,
-0.0958267, 0.078315, -1.562466, 0, 1, 0.6509804, 1,
-0.09289565, 0.1612475, -0.03393835, 0, 1, 0.6588235, 1,
-0.09197349, 0.05459449, -0.1667679, 0, 1, 0.6627451, 1,
-0.08945937, 0.3520361, 0.0414257, 0, 1, 0.6705883, 1,
-0.08233478, -0.02753958, -2.159669, 0, 1, 0.6745098, 1,
-0.08111738, 1.126394, -0.4496965, 0, 1, 0.682353, 1,
-0.08071879, 1.588355, 0.3359808, 0, 1, 0.6862745, 1,
-0.07765459, -1.239506, -2.758012, 0, 1, 0.6941177, 1,
-0.07744963, 1.005151, -0.7596015, 0, 1, 0.7019608, 1,
-0.07702757, 1.042235, -0.2004681, 0, 1, 0.7058824, 1,
-0.07299198, -0.1591476, -2.641744, 0, 1, 0.7137255, 1,
-0.07213531, 2.382164, 1.35842, 0, 1, 0.7176471, 1,
-0.07081412, -2.458092, -1.776702, 0, 1, 0.7254902, 1,
-0.06669863, 0.04344026, -3.191563, 0, 1, 0.7294118, 1,
-0.06590717, 0.2000143, -0.03809745, 0, 1, 0.7372549, 1,
-0.06389377, 0.8575068, -0.1807026, 0, 1, 0.7411765, 1,
-0.0606099, -2.176878, -2.207994, 0, 1, 0.7490196, 1,
-0.05909967, 0.2798701, 0.6564813, 0, 1, 0.7529412, 1,
-0.05682753, -0.08489393, -3.739553, 0, 1, 0.7607843, 1,
-0.05216822, 0.1664461, -1.812374, 0, 1, 0.7647059, 1,
-0.05043944, -0.4937188, -4.187325, 0, 1, 0.772549, 1,
-0.04614854, -0.628521, -3.342045, 0, 1, 0.7764706, 1,
-0.04587187, 0.4278143, -1.363328, 0, 1, 0.7843137, 1,
-0.04125451, -0.08101688, -3.65949, 0, 1, 0.7882353, 1,
-0.03952364, 0.7403038, 1.973782, 0, 1, 0.7960784, 1,
-0.03917566, 0.01259426, -1.473458, 0, 1, 0.8039216, 1,
-0.03894133, -0.3669698, -2.45891, 0, 1, 0.8078431, 1,
-0.03451822, -1.118949, -4.660885, 0, 1, 0.8156863, 1,
-0.03426738, 0.1660129, -0.5004336, 0, 1, 0.8196079, 1,
-0.02263118, 0.4087274, 0.1200108, 0, 1, 0.827451, 1,
-0.02139174, -1.834872, -3.256403, 0, 1, 0.8313726, 1,
-0.02126218, -0.1895491, -2.743153, 0, 1, 0.8392157, 1,
-0.01987682, 0.7964783, -0.3386344, 0, 1, 0.8431373, 1,
-0.01892889, 0.6300935, 1.008503, 0, 1, 0.8509804, 1,
-0.01721488, -1.127424, -1.53785, 0, 1, 0.854902, 1,
-0.01436656, 1.483408, 0.002750218, 0, 1, 0.8627451, 1,
-0.01350088, -0.1771478, -3.470712, 0, 1, 0.8666667, 1,
-0.006673663, -2.162818, -3.552297, 0, 1, 0.8745098, 1,
-0.005776875, 0.7840905, 0.4923728, 0, 1, 0.8784314, 1,
-0.004571333, 0.699708, 0.6193039, 0, 1, 0.8862745, 1,
-0.002297779, 0.6963447, -0.3790946, 0, 1, 0.8901961, 1,
0.002334219, 0.5869245, -1.289335, 0, 1, 0.8980392, 1,
0.003675824, -0.7957988, 3.580803, 0, 1, 0.9058824, 1,
0.007055847, 0.5111445, -0.7745332, 0, 1, 0.9098039, 1,
0.007684169, -0.01933717, 3.932124, 0, 1, 0.9176471, 1,
0.008021812, 0.9541252, 0.1130181, 0, 1, 0.9215686, 1,
0.009210822, 0.1317874, -0.1546012, 0, 1, 0.9294118, 1,
0.01072101, -1.620173, 4.079177, 0, 1, 0.9333333, 1,
0.01893346, -0.5558617, 1.849901, 0, 1, 0.9411765, 1,
0.02187695, 1.451953, -0.7276322, 0, 1, 0.945098, 1,
0.0228106, 0.4560905, 1.251582, 0, 1, 0.9529412, 1,
0.02491785, -0.5773875, 1.791834, 0, 1, 0.9568627, 1,
0.02730298, -0.4262562, 2.03391, 0, 1, 0.9647059, 1,
0.02844606, -0.480622, 3.694516, 0, 1, 0.9686275, 1,
0.03483972, 1.048428, 0.1074842, 0, 1, 0.9764706, 1,
0.03515859, 0.3664468, 0.2564006, 0, 1, 0.9803922, 1,
0.03591623, -0.5531161, 3.189255, 0, 1, 0.9882353, 1,
0.03827953, -0.0627076, 3.209234, 0, 1, 0.9921569, 1,
0.03899438, -0.3059487, 1.928996, 0, 1, 1, 1,
0.04241772, -1.085526, 2.225276, 0, 0.9921569, 1, 1,
0.04264159, 1.477447, 1.219032, 0, 0.9882353, 1, 1,
0.04362537, 0.1374581, -0.04940858, 0, 0.9803922, 1, 1,
0.04374298, -1.70496, 1.810862, 0, 0.9764706, 1, 1,
0.04390801, -0.5065454, 3.019825, 0, 0.9686275, 1, 1,
0.04659496, -1.153035, 4.244016, 0, 0.9647059, 1, 1,
0.0474375, 0.3254994, 0.1431274, 0, 0.9568627, 1, 1,
0.04750858, 0.6079891, -0.4526867, 0, 0.9529412, 1, 1,
0.05205414, 1.751717, 0.8759681, 0, 0.945098, 1, 1,
0.05267956, -0.5900936, 4.757744, 0, 0.9411765, 1, 1,
0.05280279, -0.8321353, 3.006733, 0, 0.9333333, 1, 1,
0.053135, 0.6468362, 0.5392833, 0, 0.9294118, 1, 1,
0.05644879, -0.8552716, 4.255406, 0, 0.9215686, 1, 1,
0.05774329, 1.958864, -0.6903518, 0, 0.9176471, 1, 1,
0.06006886, -1.464553, 4.431362, 0, 0.9098039, 1, 1,
0.06026193, 0.7706806, -0.5226182, 0, 0.9058824, 1, 1,
0.06050597, 0.2072764, -0.2572773, 0, 0.8980392, 1, 1,
0.06576163, -0.6957357, 2.834712, 0, 0.8901961, 1, 1,
0.0675802, 0.2941112, -2.303091, 0, 0.8862745, 1, 1,
0.07615985, 0.5569625, -1.640665, 0, 0.8784314, 1, 1,
0.07688117, 1.08228, -0.6114614, 0, 0.8745098, 1, 1,
0.07714429, 1.061686, 0.4552974, 0, 0.8666667, 1, 1,
0.07993633, -0.629321, 3.784504, 0, 0.8627451, 1, 1,
0.08028597, 1.228576, -0.3733828, 0, 0.854902, 1, 1,
0.08307982, 0.6367452, 0.03775769, 0, 0.8509804, 1, 1,
0.08340272, 0.1351638, -1.611249, 0, 0.8431373, 1, 1,
0.08550996, -0.6477689, 2.097643, 0, 0.8392157, 1, 1,
0.08609166, 0.138617, 0.8989879, 0, 0.8313726, 1, 1,
0.0919949, 1.420921, -0.4249283, 0, 0.827451, 1, 1,
0.09334539, 1.414454, 0.05939472, 0, 0.8196079, 1, 1,
0.1031029, -0.4988738, 3.299517, 0, 0.8156863, 1, 1,
0.1069352, -0.1402109, 2.92838, 0, 0.8078431, 1, 1,
0.1070747, -1.345782, 3.365677, 0, 0.8039216, 1, 1,
0.1094692, -0.4151807, 2.125436, 0, 0.7960784, 1, 1,
0.1129807, -0.755787, 2.817317, 0, 0.7882353, 1, 1,
0.1136375, -1.254509, 2.592298, 0, 0.7843137, 1, 1,
0.1154584, -1.403918, 5.447833, 0, 0.7764706, 1, 1,
0.1181313, -0.9983912, 2.287598, 0, 0.772549, 1, 1,
0.1190756, 0.1923699, 1.56163, 0, 0.7647059, 1, 1,
0.1237372, -2.713944, 4.096694, 0, 0.7607843, 1, 1,
0.126912, -0.2078161, 2.406174, 0, 0.7529412, 1, 1,
0.1277837, 0.5120244, -0.7230859, 0, 0.7490196, 1, 1,
0.1281732, 0.6955411, 2.507936, 0, 0.7411765, 1, 1,
0.1335244, 1.137458, 1.874868, 0, 0.7372549, 1, 1,
0.1341254, -0.425006, 1.912654, 0, 0.7294118, 1, 1,
0.1366422, 0.9059343, 0.4623948, 0, 0.7254902, 1, 1,
0.1420183, -0.196258, 1.175295, 0, 0.7176471, 1, 1,
0.1423791, -0.3457742, 5.211352, 0, 0.7137255, 1, 1,
0.145596, 1.028364, 0.5122483, 0, 0.7058824, 1, 1,
0.1463085, -0.2510433, 1.66048, 0, 0.6980392, 1, 1,
0.1465577, 1.121112, -1.083181, 0, 0.6941177, 1, 1,
0.1484667, 2.34203, -1.427647, 0, 0.6862745, 1, 1,
0.1504772, 1.00292, 0.9361104, 0, 0.682353, 1, 1,
0.1521785, -1.421226, 1.522107, 0, 0.6745098, 1, 1,
0.153152, -0.6751434, 4.160521, 0, 0.6705883, 1, 1,
0.1532612, -1.924575, 2.043504, 0, 0.6627451, 1, 1,
0.1610201, 1.145028, 0.7807809, 0, 0.6588235, 1, 1,
0.1683968, 1.148905, -0.3046452, 0, 0.6509804, 1, 1,
0.168493, 2.73207, 0.4304556, 0, 0.6470588, 1, 1,
0.1695137, -0.1551495, 0.8230903, 0, 0.6392157, 1, 1,
0.1715784, -0.06333672, 3.023129, 0, 0.6352941, 1, 1,
0.1742517, -1.555762, 2.207863, 0, 0.627451, 1, 1,
0.1762116, -1.877599, 2.913456, 0, 0.6235294, 1, 1,
0.1827525, -0.1441504, 1.311122, 0, 0.6156863, 1, 1,
0.1840433, -0.6082987, 1.726561, 0, 0.6117647, 1, 1,
0.1875937, -0.163965, 0.6786594, 0, 0.6039216, 1, 1,
0.1885216, -0.6933296, 2.717162, 0, 0.5960785, 1, 1,
0.1915942, 0.4028103, -0.2952656, 0, 0.5921569, 1, 1,
0.1950451, -0.4953428, 3.687512, 0, 0.5843138, 1, 1,
0.1999323, -1.707467, 2.352193, 0, 0.5803922, 1, 1,
0.2045703, 1.434701, -0.1201697, 0, 0.572549, 1, 1,
0.2049145, -0.02145035, 1.529532, 0, 0.5686275, 1, 1,
0.2054775, -0.7185631, 1.511448, 0, 0.5607843, 1, 1,
0.2082407, -0.6934603, 2.696445, 0, 0.5568628, 1, 1,
0.2090284, -1.245039, 3.566366, 0, 0.5490196, 1, 1,
0.2094495, 0.06789908, 1.80662, 0, 0.5450981, 1, 1,
0.2158692, 1.085363, 0.7041228, 0, 0.5372549, 1, 1,
0.2202484, 0.66397, -0.775031, 0, 0.5333334, 1, 1,
0.2211555, 0.3525089, 0.9884068, 0, 0.5254902, 1, 1,
0.2222744, 0.5311423, 0.6072019, 0, 0.5215687, 1, 1,
0.2244551, -1.097658, 4.422189, 0, 0.5137255, 1, 1,
0.2267555, -0.8129495, 2.655163, 0, 0.509804, 1, 1,
0.2284031, -0.3480211, 3.301948, 0, 0.5019608, 1, 1,
0.2300946, -0.3039749, 2.837185, 0, 0.4941176, 1, 1,
0.2346893, 0.9548556, 2.018628, 0, 0.4901961, 1, 1,
0.2372261, 0.1614477, 1.770379, 0, 0.4823529, 1, 1,
0.243745, 0.1500163, 0.7157829, 0, 0.4784314, 1, 1,
0.2472631, 0.07516932, 0.3797209, 0, 0.4705882, 1, 1,
0.2481082, 0.7613161, 0.2697931, 0, 0.4666667, 1, 1,
0.2544999, 2.008499, 0.4485931, 0, 0.4588235, 1, 1,
0.2552699, 0.2050288, -0.1571079, 0, 0.454902, 1, 1,
0.2554391, -0.9121509, 3.057831, 0, 0.4470588, 1, 1,
0.2555833, 0.07606435, 1.498137, 0, 0.4431373, 1, 1,
0.2557126, -1.27208, 3.029329, 0, 0.4352941, 1, 1,
0.2567983, -1.684557, 2.617626, 0, 0.4313726, 1, 1,
0.2569817, -0.6289861, 2.696151, 0, 0.4235294, 1, 1,
0.2589576, -0.7333208, 2.536023, 0, 0.4196078, 1, 1,
0.2626371, 0.6045182, 0.5742236, 0, 0.4117647, 1, 1,
0.2652687, -0.4396255, 4.424997, 0, 0.4078431, 1, 1,
0.2686686, 0.5834607, 0.0002147605, 0, 0.4, 1, 1,
0.269161, -2.026925, 2.052989, 0, 0.3921569, 1, 1,
0.2803627, -0.09194499, 1.813109, 0, 0.3882353, 1, 1,
0.2916564, 0.9803393, -0.2784146, 0, 0.3803922, 1, 1,
0.2975569, 0.6445565, 1.141195, 0, 0.3764706, 1, 1,
0.2996466, -0.1846265, 3.432806, 0, 0.3686275, 1, 1,
0.3016601, -0.1375778, 2.74833, 0, 0.3647059, 1, 1,
0.3037494, 0.05170519, 1.894864, 0, 0.3568628, 1, 1,
0.3045457, -0.5746602, 3.031154, 0, 0.3529412, 1, 1,
0.3051556, -1.760692, 4.192914, 0, 0.345098, 1, 1,
0.3093144, 0.8675046, 0.2171846, 0, 0.3411765, 1, 1,
0.3123818, 0.4278925, -1.012336, 0, 0.3333333, 1, 1,
0.3130697, 1.500031, -2.199, 0, 0.3294118, 1, 1,
0.3130836, 0.9281859, -0.1651009, 0, 0.3215686, 1, 1,
0.314291, -0.6273794, 3.157274, 0, 0.3176471, 1, 1,
0.3192837, -2.292021, 3.657389, 0, 0.3098039, 1, 1,
0.3196002, -1.274221, 3.303116, 0, 0.3058824, 1, 1,
0.3217386, -1.269396, 2.072641, 0, 0.2980392, 1, 1,
0.3226687, -0.02971641, -0.7756314, 0, 0.2901961, 1, 1,
0.3245045, 0.04940692, 0.3468253, 0, 0.2862745, 1, 1,
0.325722, -0.9354178, 2.939083, 0, 0.2784314, 1, 1,
0.3269153, -0.2440241, 1.365903, 0, 0.2745098, 1, 1,
0.3275091, -1.551985, 2.0233, 0, 0.2666667, 1, 1,
0.3280874, -1.273456, 1.385678, 0, 0.2627451, 1, 1,
0.3330652, 0.9730954, 0.9033256, 0, 0.254902, 1, 1,
0.3362193, -0.6620922, 2.577765, 0, 0.2509804, 1, 1,
0.340331, -0.7534645, 3.990614, 0, 0.2431373, 1, 1,
0.340365, 0.007999702, 2.373127, 0, 0.2392157, 1, 1,
0.3436388, -1.21464, 3.175838, 0, 0.2313726, 1, 1,
0.3441998, -0.5379384, 2.670658, 0, 0.227451, 1, 1,
0.347794, 1.813912, 0.9251681, 0, 0.2196078, 1, 1,
0.3488189, 1.121803, 0.01920063, 0, 0.2156863, 1, 1,
0.3514386, 0.3352254, 0.431748, 0, 0.2078431, 1, 1,
0.3534109, 0.2883969, 1.17318, 0, 0.2039216, 1, 1,
0.3539572, -0.08795547, 0.2835214, 0, 0.1960784, 1, 1,
0.3591499, 0.3509374, 0.9607549, 0, 0.1882353, 1, 1,
0.3670835, -1.941924, 4.054174, 0, 0.1843137, 1, 1,
0.3693658, 0.3572918, 1.858633, 0, 0.1764706, 1, 1,
0.3712775, 1.212869, 0.5050894, 0, 0.172549, 1, 1,
0.3717499, -0.6178696, 2.062321, 0, 0.1647059, 1, 1,
0.3734018, -3.126295, 4.676719, 0, 0.1607843, 1, 1,
0.3746653, 2.826135, -0.1962433, 0, 0.1529412, 1, 1,
0.3785638, 0.2848275, 0.04895853, 0, 0.1490196, 1, 1,
0.3796074, 0.3504671, 2.261112, 0, 0.1411765, 1, 1,
0.3973373, 2.341518, -0.3734369, 0, 0.1372549, 1, 1,
0.3983442, -0.7091463, 1.320889, 0, 0.1294118, 1, 1,
0.4043974, -0.6273087, 2.780827, 0, 0.1254902, 1, 1,
0.4066062, -0.05566354, 2.334905, 0, 0.1176471, 1, 1,
0.4116532, 0.3242436, -0.8113193, 0, 0.1137255, 1, 1,
0.415152, -0.04891367, 0.5266056, 0, 0.1058824, 1, 1,
0.4160593, 1.185275, -0.6044925, 0, 0.09803922, 1, 1,
0.4180997, -1.013425, 3.64397, 0, 0.09411765, 1, 1,
0.4227245, 1.112916, 0.9554982, 0, 0.08627451, 1, 1,
0.4242486, -1.126317, 2.417223, 0, 0.08235294, 1, 1,
0.4275959, 0.4771323, 0.4862091, 0, 0.07450981, 1, 1,
0.4284688, 0.1668491, 3.24411, 0, 0.07058824, 1, 1,
0.4320947, 0.2508949, 1.380505, 0, 0.0627451, 1, 1,
0.4366606, 0.5957404, 1.119301, 0, 0.05882353, 1, 1,
0.4377176, -0.3478125, 1.461043, 0, 0.05098039, 1, 1,
0.4445779, -1.487438, 4.631734, 0, 0.04705882, 1, 1,
0.4463743, 0.1938613, 2.314986, 0, 0.03921569, 1, 1,
0.4514512, -1.120766, 3.517247, 0, 0.03529412, 1, 1,
0.4545074, 1.383939, 1.75321, 0, 0.02745098, 1, 1,
0.4553088, -1.045197, 1.990743, 0, 0.02352941, 1, 1,
0.4571801, 0.5110604, 0.1799558, 0, 0.01568628, 1, 1,
0.4700222, -0.3982948, 2.245742, 0, 0.01176471, 1, 1,
0.4716204, -0.8954951, 2.667122, 0, 0.003921569, 1, 1,
0.4722917, 0.7069401, 0.9013084, 0.003921569, 0, 1, 1,
0.473243, 0.2873235, 0.5629804, 0.007843138, 0, 1, 1,
0.4826221, 0.1609608, 2.954166, 0.01568628, 0, 1, 1,
0.4845501, 0.4033689, 2.018932, 0.01960784, 0, 1, 1,
0.4853258, 0.262685, 1.427456, 0.02745098, 0, 1, 1,
0.4902499, 0.4731066, -0.114297, 0.03137255, 0, 1, 1,
0.4906407, -1.020055, -0.5104689, 0.03921569, 0, 1, 1,
0.497326, 0.2818373, 1.419823, 0.04313726, 0, 1, 1,
0.5016859, 0.7609705, 1.121315, 0.05098039, 0, 1, 1,
0.5022091, -0.3258727, 3.350049, 0.05490196, 0, 1, 1,
0.5165448, -0.222813, 0.7319216, 0.0627451, 0, 1, 1,
0.5209653, -0.4705357, 0.2437776, 0.06666667, 0, 1, 1,
0.5262834, -1.395734, 2.421384, 0.07450981, 0, 1, 1,
0.5266116, 0.2898775, 1.177044, 0.07843138, 0, 1, 1,
0.5282354, -1.767175, 4.048209, 0.08627451, 0, 1, 1,
0.5390273, -1.21853, 2.382811, 0.09019608, 0, 1, 1,
0.5442634, -0.1153371, 1.427478, 0.09803922, 0, 1, 1,
0.5456942, 1.258649, 1.389653, 0.1058824, 0, 1, 1,
0.5457023, -1.152186, 2.525341, 0.1098039, 0, 1, 1,
0.5469688, -0.877381, 1.071347, 0.1176471, 0, 1, 1,
0.5486019, 0.3914716, 0.864666, 0.1215686, 0, 1, 1,
0.548844, -1.049956, 3.018759, 0.1294118, 0, 1, 1,
0.550563, 0.9230613, 2.727307, 0.1333333, 0, 1, 1,
0.560248, 1.162607, 2.343695, 0.1411765, 0, 1, 1,
0.567329, -0.8188753, 1.384045, 0.145098, 0, 1, 1,
0.5685807, -0.4756554, 0.7870193, 0.1529412, 0, 1, 1,
0.5722957, 0.4854788, 0.5632082, 0.1568628, 0, 1, 1,
0.5733923, -0.7160278, 1.746643, 0.1647059, 0, 1, 1,
0.5746719, -0.396346, 2.889325, 0.1686275, 0, 1, 1,
0.5786293, 0.7897684, -0.2140119, 0.1764706, 0, 1, 1,
0.5786642, 0.6213065, -0.4892122, 0.1803922, 0, 1, 1,
0.5824714, 0.3619026, 2.783123, 0.1882353, 0, 1, 1,
0.5832315, -0.2545367, 1.07246, 0.1921569, 0, 1, 1,
0.5879345, -0.4210484, 1.95657, 0.2, 0, 1, 1,
0.5888478, -0.04328013, 0.04992701, 0.2078431, 0, 1, 1,
0.5930202, 1.173381, 0.4435296, 0.2117647, 0, 1, 1,
0.5933533, 1.236539, -1.022854, 0.2196078, 0, 1, 1,
0.5995526, 1.198425, 1.887174, 0.2235294, 0, 1, 1,
0.602295, 1.69931, 0.4490308, 0.2313726, 0, 1, 1,
0.606205, -0.9254593, 1.595016, 0.2352941, 0, 1, 1,
0.607093, 0.3849733, 1.381372, 0.2431373, 0, 1, 1,
0.6084003, 0.3435474, 1.937793, 0.2470588, 0, 1, 1,
0.6117838, 1.643296, 1.031096, 0.254902, 0, 1, 1,
0.6140657, 1.255056, 0.3575366, 0.2588235, 0, 1, 1,
0.6284826, 0.05948173, 1.195622, 0.2666667, 0, 1, 1,
0.6291628, 0.5065745, 0.09879323, 0.2705882, 0, 1, 1,
0.6301583, -0.9541836, 3.818844, 0.2784314, 0, 1, 1,
0.631264, -0.8560774, 2.463859, 0.282353, 0, 1, 1,
0.6347147, -0.6383044, 2.059452, 0.2901961, 0, 1, 1,
0.6369687, 0.1582324, 0.2970697, 0.2941177, 0, 1, 1,
0.637265, 0.6833314, 0.4308288, 0.3019608, 0, 1, 1,
0.637962, 0.2867062, -0.07496068, 0.3098039, 0, 1, 1,
0.6390128, 0.7647497, 0.9832633, 0.3137255, 0, 1, 1,
0.6416119, -1.871054, 2.845505, 0.3215686, 0, 1, 1,
0.6475071, 2.155589, 0.4830606, 0.3254902, 0, 1, 1,
0.6477073, 0.804654, 1.013041, 0.3333333, 0, 1, 1,
0.648137, -1.020944, 2.634105, 0.3372549, 0, 1, 1,
0.6494452, -0.8213871, 2.617452, 0.345098, 0, 1, 1,
0.6511481, -0.02788424, 0.7553784, 0.3490196, 0, 1, 1,
0.6639201, 0.01466282, 0.005329103, 0.3568628, 0, 1, 1,
0.6670906, -1.206217, 3.709016, 0.3607843, 0, 1, 1,
0.6723737, -0.4805527, 2.837022, 0.3686275, 0, 1, 1,
0.673407, 0.7403277, -0.5448026, 0.372549, 0, 1, 1,
0.6735101, 0.163889, 3.750499, 0.3803922, 0, 1, 1,
0.6782668, -0.6140913, 1.456693, 0.3843137, 0, 1, 1,
0.6797843, 0.2560073, 0.5672777, 0.3921569, 0, 1, 1,
0.6824263, -0.4713871, 2.57207, 0.3960784, 0, 1, 1,
0.6882998, -0.9298376, 3.069321, 0.4039216, 0, 1, 1,
0.6918995, 0.002340579, 1.872361, 0.4117647, 0, 1, 1,
0.6922051, 2.558761, -0.5498968, 0.4156863, 0, 1, 1,
0.6935945, 0.3160709, 0.5194937, 0.4235294, 0, 1, 1,
0.6961082, 0.8678236, 0.537784, 0.427451, 0, 1, 1,
0.7003725, 2.26399, 0.4203869, 0.4352941, 0, 1, 1,
0.702746, 0.5320575, -0.4848169, 0.4392157, 0, 1, 1,
0.7101728, -0.4891822, 1.927224, 0.4470588, 0, 1, 1,
0.7122709, -0.1000988, 1.877766, 0.4509804, 0, 1, 1,
0.716758, 1.473886, 0.501886, 0.4588235, 0, 1, 1,
0.7169942, 0.8800732, 0.4548537, 0.4627451, 0, 1, 1,
0.7191663, 1.344769, -0.8894635, 0.4705882, 0, 1, 1,
0.7209148, 1.478096, 2.592086, 0.4745098, 0, 1, 1,
0.7221168, -0.4562623, 2.289783, 0.4823529, 0, 1, 1,
0.7228896, 0.4941069, 1.330637, 0.4862745, 0, 1, 1,
0.7268332, -0.2206394, 2.755838, 0.4941176, 0, 1, 1,
0.7270502, -1.00907, 2.337098, 0.5019608, 0, 1, 1,
0.7283809, 0.1272276, 1.619253, 0.5058824, 0, 1, 1,
0.7338707, -1.155806, 2.575131, 0.5137255, 0, 1, 1,
0.735997, 0.5833914, 1.223316, 0.5176471, 0, 1, 1,
0.7391451, 2.197663, -0.2699485, 0.5254902, 0, 1, 1,
0.743364, 1.726031, 0.3568692, 0.5294118, 0, 1, 1,
0.7471488, -0.2039972, 1.706639, 0.5372549, 0, 1, 1,
0.749367, 0.5694094, 0.7078574, 0.5411765, 0, 1, 1,
0.7531075, 0.3583567, 1.205752, 0.5490196, 0, 1, 1,
0.7566893, -0.1516726, 2.093636, 0.5529412, 0, 1, 1,
0.7584222, 1.06692, 2.981848, 0.5607843, 0, 1, 1,
0.7592129, -0.1719985, 3.079381, 0.5647059, 0, 1, 1,
0.7689929, -1.060373, 3.158289, 0.572549, 0, 1, 1,
0.7713344, 0.656945, 0.2751414, 0.5764706, 0, 1, 1,
0.7727117, -0.2041843, 3.33857, 0.5843138, 0, 1, 1,
0.7796381, 0.2938874, 0.9086695, 0.5882353, 0, 1, 1,
0.7819688, -1.912686, 2.746612, 0.5960785, 0, 1, 1,
0.7827767, 0.5970312, 2.129681, 0.6039216, 0, 1, 1,
0.7831461, 0.3809054, 1.191543, 0.6078432, 0, 1, 1,
0.7847446, -0.9837826, 1.000794, 0.6156863, 0, 1, 1,
0.7886897, -0.7828801, 2.971446, 0.6196079, 0, 1, 1,
0.7938435, 1.000084, 1.716556, 0.627451, 0, 1, 1,
0.7950758, 0.7945225, -0.1258266, 0.6313726, 0, 1, 1,
0.7954394, 1.007272, 0.4874732, 0.6392157, 0, 1, 1,
0.7999353, 0.05153139, 3.094365, 0.6431373, 0, 1, 1,
0.8062431, 0.4180701, 0.4459521, 0.6509804, 0, 1, 1,
0.8091986, 2.397683, -0.8936772, 0.654902, 0, 1, 1,
0.8126419, -1.263571, 2.789491, 0.6627451, 0, 1, 1,
0.8161882, 0.08925649, 1.095913, 0.6666667, 0, 1, 1,
0.8227669, -0.4420489, 3.982956, 0.6745098, 0, 1, 1,
0.8228693, -0.901044, 3.479039, 0.6784314, 0, 1, 1,
0.8274033, -1.454446, 1.393427, 0.6862745, 0, 1, 1,
0.8328015, 0.8782663, 0.6424522, 0.6901961, 0, 1, 1,
0.8386403, -2.019703, 4.031456, 0.6980392, 0, 1, 1,
0.8454154, 0.3273321, 1.238339, 0.7058824, 0, 1, 1,
0.8456174, 0.3988978, 0.9348812, 0.7098039, 0, 1, 1,
0.8484751, -0.547795, 2.604624, 0.7176471, 0, 1, 1,
0.8494548, 1.501341, 1.22862, 0.7215686, 0, 1, 1,
0.8568671, 0.07311147, 1.90176, 0.7294118, 0, 1, 1,
0.8602512, 1.368026, 1.22219, 0.7333333, 0, 1, 1,
0.8624743, 1.376857, 0.7934773, 0.7411765, 0, 1, 1,
0.8629078, -0.3968453, 2.388544, 0.7450981, 0, 1, 1,
0.8630187, -0.1814259, 2.027078, 0.7529412, 0, 1, 1,
0.8732234, -1.330568, 2.577756, 0.7568628, 0, 1, 1,
0.8778692, -0.1586401, 1.769338, 0.7647059, 0, 1, 1,
0.8836892, -0.2345751, 1.786798, 0.7686275, 0, 1, 1,
0.8877289, -0.1960048, 1.283673, 0.7764706, 0, 1, 1,
0.888074, -1.671366, 2.360996, 0.7803922, 0, 1, 1,
0.8940016, -0.6929106, 0.514518, 0.7882353, 0, 1, 1,
0.8952339, -0.9664121, 3.981657, 0.7921569, 0, 1, 1,
0.9021686, -0.9839582, 1.795139, 0.8, 0, 1, 1,
0.9053336, -0.658531, 1.673581, 0.8078431, 0, 1, 1,
0.9140747, 0.5846494, 2.02604, 0.8117647, 0, 1, 1,
0.9188178, 0.5250375, -0.863517, 0.8196079, 0, 1, 1,
0.9196911, 0.5079786, 0.4508674, 0.8235294, 0, 1, 1,
0.9200576, 1.001706, 0.2726429, 0.8313726, 0, 1, 1,
0.9211003, -0.834206, 3.00944, 0.8352941, 0, 1, 1,
0.9222179, 0.562105, -0.3827384, 0.8431373, 0, 1, 1,
0.9241483, 0.4989907, 1.630729, 0.8470588, 0, 1, 1,
0.9413083, 0.1454001, -0.02991697, 0.854902, 0, 1, 1,
0.9520267, -0.1031902, 3.468483, 0.8588235, 0, 1, 1,
0.9528987, 0.08196339, 1.178687, 0.8666667, 0, 1, 1,
0.9631481, -0.7197856, 0.9577705, 0.8705882, 0, 1, 1,
0.9640788, -1.690388, 2.739506, 0.8784314, 0, 1, 1,
0.9718321, -0.4666977, 1.612336, 0.8823529, 0, 1, 1,
0.9735495, 0.4381914, -1.022393, 0.8901961, 0, 1, 1,
0.9736559, -1.532805, 4.354351, 0.8941177, 0, 1, 1,
0.9763922, 1.233968, 1.40177, 0.9019608, 0, 1, 1,
0.9889181, 1.538504, 0.5210496, 0.9098039, 0, 1, 1,
0.9902852, 1.319388, 1.071902, 0.9137255, 0, 1, 1,
0.991933, 0.07499006, -0.9885221, 0.9215686, 0, 1, 1,
0.9931646, -0.1692531, 1.059054, 0.9254902, 0, 1, 1,
0.9932121, -0.7580902, 2.925768, 0.9333333, 0, 1, 1,
0.9949256, 1.008592, -0.4398038, 0.9372549, 0, 1, 1,
1.00557, 1.58143, 0.5330162, 0.945098, 0, 1, 1,
1.012199, 0.5925216, 0.9117885, 0.9490196, 0, 1, 1,
1.016877, -1.215764, 2.089352, 0.9568627, 0, 1, 1,
1.023575, 0.7929775, 1.273064, 0.9607843, 0, 1, 1,
1.027703, 1.352058, 1.885091, 0.9686275, 0, 1, 1,
1.032688, -1.032284, 2.354509, 0.972549, 0, 1, 1,
1.04076, 0.4362072, 0.5942101, 0.9803922, 0, 1, 1,
1.042807, 0.9835907, 2.711261, 0.9843137, 0, 1, 1,
1.047403, -1.411892, 2.642668, 0.9921569, 0, 1, 1,
1.050591, -0.619671, 2.70103, 0.9960784, 0, 1, 1,
1.054013, 0.2575957, 2.228281, 1, 0, 0.9960784, 1,
1.059342, -0.8877324, 0.9414079, 1, 0, 0.9882353, 1,
1.060597, -0.9256971, 3.749349, 1, 0, 0.9843137, 1,
1.060773, -0.1514091, 1.762233, 1, 0, 0.9764706, 1,
1.062594, 2.06952, -0.6775224, 1, 0, 0.972549, 1,
1.065049, 1.049858, 1.770389, 1, 0, 0.9647059, 1,
1.071489, 0.4795979, 1.571808, 1, 0, 0.9607843, 1,
1.071904, 0.4885395, 1.902383, 1, 0, 0.9529412, 1,
1.072202, 1.100225, 1.745885, 1, 0, 0.9490196, 1,
1.072339, 0.189297, 3.236603, 1, 0, 0.9411765, 1,
1.073027, -1.024223, 2.488897, 1, 0, 0.9372549, 1,
1.077518, -0.005219444, 1.229201, 1, 0, 0.9294118, 1,
1.077809, 1.263252, 1.055432, 1, 0, 0.9254902, 1,
1.079556, 0.514605, 0.4594023, 1, 0, 0.9176471, 1,
1.083132, 0.5899453, 0.2736062, 1, 0, 0.9137255, 1,
1.096572, 0.1841561, 3.142838, 1, 0, 0.9058824, 1,
1.104579, -0.493826, 0.2655139, 1, 0, 0.9019608, 1,
1.105298, 0.7443939, -0.004504431, 1, 0, 0.8941177, 1,
1.107053, 1.231507, 2.710513, 1, 0, 0.8862745, 1,
1.10869, -1.573623, 2.586022, 1, 0, 0.8823529, 1,
1.112024, -0.2873263, 1.111558, 1, 0, 0.8745098, 1,
1.114666, -2.231954, -0.440344, 1, 0, 0.8705882, 1,
1.11773, -0.6885763, 0.8423264, 1, 0, 0.8627451, 1,
1.119967, 1.375702, 0.5766659, 1, 0, 0.8588235, 1,
1.120119, 0.1022293, 1.315861, 1, 0, 0.8509804, 1,
1.123729, -0.1077908, 1.83251, 1, 0, 0.8470588, 1,
1.126507, 1.165007, 0.8609551, 1, 0, 0.8392157, 1,
1.127582, -0.3778946, 1.961382, 1, 0, 0.8352941, 1,
1.133359, 0.07172777, 0.404916, 1, 0, 0.827451, 1,
1.138475, 2.084096, -1.2693, 1, 0, 0.8235294, 1,
1.142278, -0.5274252, 1.78431, 1, 0, 0.8156863, 1,
1.150637, 0.2305255, -0.2162402, 1, 0, 0.8117647, 1,
1.154559, 1.379397, 0.4819242, 1, 0, 0.8039216, 1,
1.15665, 1.53364, 1.083463, 1, 0, 0.7960784, 1,
1.161427, 0.6891529, 1.220808, 1, 0, 0.7921569, 1,
1.162625, -1.147019, 1.318944, 1, 0, 0.7843137, 1,
1.167796, -0.8957252, 2.141104, 1, 0, 0.7803922, 1,
1.169014, -0.8404745, 0.8505041, 1, 0, 0.772549, 1,
1.169817, -0.7591045, 2.425164, 1, 0, 0.7686275, 1,
1.172798, -0.7934163, 2.107702, 1, 0, 0.7607843, 1,
1.174844, -0.168359, 4.275265, 1, 0, 0.7568628, 1,
1.180594, 1.146501, 1.182477, 1, 0, 0.7490196, 1,
1.189551, 1.66579, 0.3447615, 1, 0, 0.7450981, 1,
1.194921, -0.2715554, 1.749459, 1, 0, 0.7372549, 1,
1.200109, 0.4230964, 2.469939, 1, 0, 0.7333333, 1,
1.204117, -0.985463, 0.5624102, 1, 0, 0.7254902, 1,
1.218518, 0.1030648, 1.347639, 1, 0, 0.7215686, 1,
1.218884, -0.920718, 2.483007, 1, 0, 0.7137255, 1,
1.218958, 0.3388209, 0.2660857, 1, 0, 0.7098039, 1,
1.219268, -0.8456071, 3.659136, 1, 0, 0.7019608, 1,
1.221151, 0.07309759, 0.6097046, 1, 0, 0.6941177, 1,
1.222467, 0.6091064, 1.953256, 1, 0, 0.6901961, 1,
1.224319, -0.06078388, 3.369953, 1, 0, 0.682353, 1,
1.231687, -1.877344, 4.069345, 1, 0, 0.6784314, 1,
1.232702, 1.191723, -0.4091348, 1, 0, 0.6705883, 1,
1.235181, 0.3968842, 1.139811, 1, 0, 0.6666667, 1,
1.239109, -1.668021, 2.050047, 1, 0, 0.6588235, 1,
1.255714, 0.5357127, 1.702976, 1, 0, 0.654902, 1,
1.26703, 1.058348, 0.02284447, 1, 0, 0.6470588, 1,
1.270427, 1.163914, 0.6736754, 1, 0, 0.6431373, 1,
1.271023, -0.4532627, 2.615398, 1, 0, 0.6352941, 1,
1.27795, 0.7668165, 1.889615, 1, 0, 0.6313726, 1,
1.293645, 1.179698, 1.164247, 1, 0, 0.6235294, 1,
1.301925, 1.647577, -0.6513973, 1, 0, 0.6196079, 1,
1.314087, 1.885587, -0.4017566, 1, 0, 0.6117647, 1,
1.318197, 0.1577447, 1.746548, 1, 0, 0.6078432, 1,
1.323811, 0.03570968, 1.20804, 1, 0, 0.6, 1,
1.332786, 0.8157732, 1.083342, 1, 0, 0.5921569, 1,
1.34064, -0.3874875, 2.780737, 1, 0, 0.5882353, 1,
1.34735, 0.1289826, 1.176812, 1, 0, 0.5803922, 1,
1.348665, 0.5355226, 0.7058396, 1, 0, 0.5764706, 1,
1.354397, 0.418618, 0.2047877, 1, 0, 0.5686275, 1,
1.359, -0.30134, 1.905602, 1, 0, 0.5647059, 1,
1.359277, -1.304651, 1.94137, 1, 0, 0.5568628, 1,
1.364794, -0.2823405, 2.713884, 1, 0, 0.5529412, 1,
1.365166, 0.5648436, 1.016741, 1, 0, 0.5450981, 1,
1.368189, 2.089942, 1.905931, 1, 0, 0.5411765, 1,
1.368431, 0.024744, 3.868431, 1, 0, 0.5333334, 1,
1.374501, -0.04523321, 1.720908, 1, 0, 0.5294118, 1,
1.376637, -1.989332, 3.840392, 1, 0, 0.5215687, 1,
1.386551, -0.5915245, 0.8969101, 1, 0, 0.5176471, 1,
1.39116, -1.505195, 2.632168, 1, 0, 0.509804, 1,
1.417302, -0.3784191, 2.352286, 1, 0, 0.5058824, 1,
1.422871, 0.3752899, 2.843107, 1, 0, 0.4980392, 1,
1.429669, 0.2439756, 0.7421271, 1, 0, 0.4901961, 1,
1.431269, 0.6218392, 3.148957, 1, 0, 0.4862745, 1,
1.43373, -0.06585374, 2.599072, 1, 0, 0.4784314, 1,
1.435963, 1.430098, 0.6899083, 1, 0, 0.4745098, 1,
1.43628, 1.116492, 0.6667953, 1, 0, 0.4666667, 1,
1.43804, 0.5254453, 1.352652, 1, 0, 0.4627451, 1,
1.446099, -0.7078617, 3.311287, 1, 0, 0.454902, 1,
1.44688, 0.1321051, 1.178368, 1, 0, 0.4509804, 1,
1.45221, 1.093554, 1.436525, 1, 0, 0.4431373, 1,
1.453554, 1.174719, -1.018872, 1, 0, 0.4392157, 1,
1.454528, -0.2656824, 2.528504, 1, 0, 0.4313726, 1,
1.455556, 0.2490938, 1.5149, 1, 0, 0.427451, 1,
1.458579, 0.5242025, 0.718767, 1, 0, 0.4196078, 1,
1.463809, -0.8256445, 1.093959, 1, 0, 0.4156863, 1,
1.465856, -0.4912944, 2.561871, 1, 0, 0.4078431, 1,
1.470006, -0.201679, 1.636267, 1, 0, 0.4039216, 1,
1.479136, 0.3609893, -0.1473288, 1, 0, 0.3960784, 1,
1.480613, 0.1891136, 2.393903, 1, 0, 0.3882353, 1,
1.482657, -0.410788, 2.982052, 1, 0, 0.3843137, 1,
1.483401, -1.555228, 2.63595, 1, 0, 0.3764706, 1,
1.485649, -0.6263616, 1.467492, 1, 0, 0.372549, 1,
1.503152, 0.6238158, 0.87148, 1, 0, 0.3647059, 1,
1.510394, 1.871998, -0.6521158, 1, 0, 0.3607843, 1,
1.510627, 0.3174955, 0.08505759, 1, 0, 0.3529412, 1,
1.524845, 1.283077, 1.866076, 1, 0, 0.3490196, 1,
1.525916, -0.594511, 2.24395, 1, 0, 0.3411765, 1,
1.53414, 1.224713, 1.951065, 1, 0, 0.3372549, 1,
1.534829, 0.2875374, 0.3077368, 1, 0, 0.3294118, 1,
1.540486, 2.10578, 0.9352262, 1, 0, 0.3254902, 1,
1.543098, 1.635702, 0.6486646, 1, 0, 0.3176471, 1,
1.573999, -1.719877, 4.072541, 1, 0, 0.3137255, 1,
1.576404, 1.697246, 1.83455, 1, 0, 0.3058824, 1,
1.584062, -0.0478821, 2.248152, 1, 0, 0.2980392, 1,
1.596659, 1.329961, -1.55652, 1, 0, 0.2941177, 1,
1.611869, 0.5380355, 1.844349, 1, 0, 0.2862745, 1,
1.61534, 0.3537963, 2.398007, 1, 0, 0.282353, 1,
1.643138, -1.568696, 2.764158, 1, 0, 0.2745098, 1,
1.64805, -0.4483357, 2.158677, 1, 0, 0.2705882, 1,
1.654734, 1.542601, 0.7582271, 1, 0, 0.2627451, 1,
1.667437, -0.4841211, 1.453795, 1, 0, 0.2588235, 1,
1.66847, 1.542365, 1.401438, 1, 0, 0.2509804, 1,
1.674945, 0.6977353, 0.3299946, 1, 0, 0.2470588, 1,
1.676031, 1.80833, 1.183786, 1, 0, 0.2392157, 1,
1.679113, 0.6343936, 1.611532, 1, 0, 0.2352941, 1,
1.687826, 0.7894197, 0.8647336, 1, 0, 0.227451, 1,
1.697067, 0.7781219, 0.3820123, 1, 0, 0.2235294, 1,
1.717385, 1.785487, -0.8782001, 1, 0, 0.2156863, 1,
1.720623, -0.4516986, 1.805706, 1, 0, 0.2117647, 1,
1.730597, -0.825183, 1.617884, 1, 0, 0.2039216, 1,
1.737131, 0.9773871, 0.184333, 1, 0, 0.1960784, 1,
1.740209, -0.4475654, 0.5788482, 1, 0, 0.1921569, 1,
1.757406, 1.094193, -0.1508116, 1, 0, 0.1843137, 1,
1.770308, 1.788735, 0.7967803, 1, 0, 0.1803922, 1,
1.791448, -0.4812577, 1.116745, 1, 0, 0.172549, 1,
1.805339, 0.5517567, -0.1334265, 1, 0, 0.1686275, 1,
1.806436, -0.06154784, 1.949545, 1, 0, 0.1607843, 1,
1.858491, 0.8491109, -0.7537928, 1, 0, 0.1568628, 1,
1.878956, -0.6997088, 3.299685, 1, 0, 0.1490196, 1,
1.879318, -0.7873849, 2.364773, 1, 0, 0.145098, 1,
1.887998, 0.005663274, 1.532294, 1, 0, 0.1372549, 1,
1.949025, 0.23476, 2.139829, 1, 0, 0.1333333, 1,
1.961711, 0.3087485, 0.7852212, 1, 0, 0.1254902, 1,
1.973619, 0.5721449, 1.961024, 1, 0, 0.1215686, 1,
1.97363, 1.743157, 1.944073, 1, 0, 0.1137255, 1,
1.998656, 1.71478, 3.777346, 1, 0, 0.1098039, 1,
2.01289, -0.8182751, 1.155094, 1, 0, 0.1019608, 1,
2.016902, 0.9540207, 1.586553, 1, 0, 0.09411765, 1,
2.029251, -1.164467, 1.398741, 1, 0, 0.09019608, 1,
2.035977, -2.025607, 4.140629, 1, 0, 0.08235294, 1,
2.057752, 0.1390641, 0.900556, 1, 0, 0.07843138, 1,
2.066905, 0.5879213, 2.276658, 1, 0, 0.07058824, 1,
2.09034, -2.329913, 3.370722, 1, 0, 0.06666667, 1,
2.165068, 0.7207956, 2.381053, 1, 0, 0.05882353, 1,
2.1957, 0.9314463, 1.40669, 1, 0, 0.05490196, 1,
2.320139, -1.533866, 3.43781, 1, 0, 0.04705882, 1,
2.327149, -0.716746, 2.00401, 1, 0, 0.04313726, 1,
2.338248, -0.1748817, 1.514473, 1, 0, 0.03529412, 1,
2.507056, -1.151597, 1.969692, 1, 0, 0.03137255, 1,
2.594054, 0.5329553, 1.52129, 1, 0, 0.02352941, 1,
2.618517, -2.390693, 2.686961, 1, 0, 0.01960784, 1,
2.639107, -0.7789969, 1.452541, 1, 0, 0.01176471, 1,
3.211838, 0.09881636, 4.08768, 1, 0, 0.007843138, 1
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
-0.0527066, -4.274057, -7.022024, 0, -0.5, 0.5, 0.5,
-0.0527066, -4.274057, -7.022024, 1, -0.5, 0.5, 0.5,
-0.0527066, -4.274057, -7.022024, 1, 1.5, 0.5, 0.5,
-0.0527066, -4.274057, -7.022024, 0, 1.5, 0.5, 0.5
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
-4.423933, 0.2594362, -7.022024, 0, -0.5, 0.5, 0.5,
-4.423933, 0.2594362, -7.022024, 1, -0.5, 0.5, 0.5,
-4.423933, 0.2594362, -7.022024, 1, 1.5, 0.5, 0.5,
-4.423933, 0.2594362, -7.022024, 0, 1.5, 0.5, 0.5
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
-4.423933, -4.274057, 0.1165559, 0, -0.5, 0.5, 0.5,
-4.423933, -4.274057, 0.1165559, 1, -0.5, 0.5, 0.5,
-4.423933, -4.274057, 0.1165559, 1, 1.5, 0.5, 0.5,
-4.423933, -4.274057, 0.1165559, 0, 1.5, 0.5, 0.5
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
-3, -3.227867, -5.374659,
3, -3.227867, -5.374659,
-3, -3.227867, -5.374659,
-3, -3.402232, -5.64922,
-2, -3.227867, -5.374659,
-2, -3.402232, -5.64922,
-1, -3.227867, -5.374659,
-1, -3.402232, -5.64922,
0, -3.227867, -5.374659,
0, -3.402232, -5.64922,
1, -3.227867, -5.374659,
1, -3.402232, -5.64922,
2, -3.227867, -5.374659,
2, -3.402232, -5.64922,
3, -3.227867, -5.374659,
3, -3.402232, -5.64922
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
-3, -3.750962, -6.198341, 0, -0.5, 0.5, 0.5,
-3, -3.750962, -6.198341, 1, -0.5, 0.5, 0.5,
-3, -3.750962, -6.198341, 1, 1.5, 0.5, 0.5,
-3, -3.750962, -6.198341, 0, 1.5, 0.5, 0.5,
-2, -3.750962, -6.198341, 0, -0.5, 0.5, 0.5,
-2, -3.750962, -6.198341, 1, -0.5, 0.5, 0.5,
-2, -3.750962, -6.198341, 1, 1.5, 0.5, 0.5,
-2, -3.750962, -6.198341, 0, 1.5, 0.5, 0.5,
-1, -3.750962, -6.198341, 0, -0.5, 0.5, 0.5,
-1, -3.750962, -6.198341, 1, -0.5, 0.5, 0.5,
-1, -3.750962, -6.198341, 1, 1.5, 0.5, 0.5,
-1, -3.750962, -6.198341, 0, 1.5, 0.5, 0.5,
0, -3.750962, -6.198341, 0, -0.5, 0.5, 0.5,
0, -3.750962, -6.198341, 1, -0.5, 0.5, 0.5,
0, -3.750962, -6.198341, 1, 1.5, 0.5, 0.5,
0, -3.750962, -6.198341, 0, 1.5, 0.5, 0.5,
1, -3.750962, -6.198341, 0, -0.5, 0.5, 0.5,
1, -3.750962, -6.198341, 1, -0.5, 0.5, 0.5,
1, -3.750962, -6.198341, 1, 1.5, 0.5, 0.5,
1, -3.750962, -6.198341, 0, 1.5, 0.5, 0.5,
2, -3.750962, -6.198341, 0, -0.5, 0.5, 0.5,
2, -3.750962, -6.198341, 1, -0.5, 0.5, 0.5,
2, -3.750962, -6.198341, 1, 1.5, 0.5, 0.5,
2, -3.750962, -6.198341, 0, 1.5, 0.5, 0.5,
3, -3.750962, -6.198341, 0, -0.5, 0.5, 0.5,
3, -3.750962, -6.198341, 1, -0.5, 0.5, 0.5,
3, -3.750962, -6.198341, 1, 1.5, 0.5, 0.5,
3, -3.750962, -6.198341, 0, 1.5, 0.5, 0.5
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
-3.415188, -3, -5.374659,
-3.415188, 3, -5.374659,
-3.415188, -3, -5.374659,
-3.583312, -3, -5.64922,
-3.415188, -2, -5.374659,
-3.583312, -2, -5.64922,
-3.415188, -1, -5.374659,
-3.583312, -1, -5.64922,
-3.415188, 0, -5.374659,
-3.583312, 0, -5.64922,
-3.415188, 1, -5.374659,
-3.583312, 1, -5.64922,
-3.415188, 2, -5.374659,
-3.583312, 2, -5.64922,
-3.415188, 3, -5.374659,
-3.583312, 3, -5.64922
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
-3.91956, -3, -6.198341, 0, -0.5, 0.5, 0.5,
-3.91956, -3, -6.198341, 1, -0.5, 0.5, 0.5,
-3.91956, -3, -6.198341, 1, 1.5, 0.5, 0.5,
-3.91956, -3, -6.198341, 0, 1.5, 0.5, 0.5,
-3.91956, -2, -6.198341, 0, -0.5, 0.5, 0.5,
-3.91956, -2, -6.198341, 1, -0.5, 0.5, 0.5,
-3.91956, -2, -6.198341, 1, 1.5, 0.5, 0.5,
-3.91956, -2, -6.198341, 0, 1.5, 0.5, 0.5,
-3.91956, -1, -6.198341, 0, -0.5, 0.5, 0.5,
-3.91956, -1, -6.198341, 1, -0.5, 0.5, 0.5,
-3.91956, -1, -6.198341, 1, 1.5, 0.5, 0.5,
-3.91956, -1, -6.198341, 0, 1.5, 0.5, 0.5,
-3.91956, 0, -6.198341, 0, -0.5, 0.5, 0.5,
-3.91956, 0, -6.198341, 1, -0.5, 0.5, 0.5,
-3.91956, 0, -6.198341, 1, 1.5, 0.5, 0.5,
-3.91956, 0, -6.198341, 0, 1.5, 0.5, 0.5,
-3.91956, 1, -6.198341, 0, -0.5, 0.5, 0.5,
-3.91956, 1, -6.198341, 1, -0.5, 0.5, 0.5,
-3.91956, 1, -6.198341, 1, 1.5, 0.5, 0.5,
-3.91956, 1, -6.198341, 0, 1.5, 0.5, 0.5,
-3.91956, 2, -6.198341, 0, -0.5, 0.5, 0.5,
-3.91956, 2, -6.198341, 1, -0.5, 0.5, 0.5,
-3.91956, 2, -6.198341, 1, 1.5, 0.5, 0.5,
-3.91956, 2, -6.198341, 0, 1.5, 0.5, 0.5,
-3.91956, 3, -6.198341, 0, -0.5, 0.5, 0.5,
-3.91956, 3, -6.198341, 1, -0.5, 0.5, 0.5,
-3.91956, 3, -6.198341, 1, 1.5, 0.5, 0.5,
-3.91956, 3, -6.198341, 0, 1.5, 0.5, 0.5
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
-3.415188, -3.227867, -4,
-3.415188, -3.227867, 4,
-3.415188, -3.227867, -4,
-3.583312, -3.402232, -4,
-3.415188, -3.227867, -2,
-3.583312, -3.402232, -2,
-3.415188, -3.227867, 0,
-3.583312, -3.402232, 0,
-3.415188, -3.227867, 2,
-3.583312, -3.402232, 2,
-3.415188, -3.227867, 4,
-3.583312, -3.402232, 4
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
-3.91956, -3.750962, -4, 0, -0.5, 0.5, 0.5,
-3.91956, -3.750962, -4, 1, -0.5, 0.5, 0.5,
-3.91956, -3.750962, -4, 1, 1.5, 0.5, 0.5,
-3.91956, -3.750962, -4, 0, 1.5, 0.5, 0.5,
-3.91956, -3.750962, -2, 0, -0.5, 0.5, 0.5,
-3.91956, -3.750962, -2, 1, -0.5, 0.5, 0.5,
-3.91956, -3.750962, -2, 1, 1.5, 0.5, 0.5,
-3.91956, -3.750962, -2, 0, 1.5, 0.5, 0.5,
-3.91956, -3.750962, 0, 0, -0.5, 0.5, 0.5,
-3.91956, -3.750962, 0, 1, -0.5, 0.5, 0.5,
-3.91956, -3.750962, 0, 1, 1.5, 0.5, 0.5,
-3.91956, -3.750962, 0, 0, 1.5, 0.5, 0.5,
-3.91956, -3.750962, 2, 0, -0.5, 0.5, 0.5,
-3.91956, -3.750962, 2, 1, -0.5, 0.5, 0.5,
-3.91956, -3.750962, 2, 1, 1.5, 0.5, 0.5,
-3.91956, -3.750962, 2, 0, 1.5, 0.5, 0.5,
-3.91956, -3.750962, 4, 0, -0.5, 0.5, 0.5,
-3.91956, -3.750962, 4, 1, -0.5, 0.5, 0.5,
-3.91956, -3.750962, 4, 1, 1.5, 0.5, 0.5,
-3.91956, -3.750962, 4, 0, 1.5, 0.5, 0.5
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
-3.415188, -3.227867, -5.374659,
-3.415188, 3.746739, -5.374659,
-3.415188, -3.227867, 5.607771,
-3.415188, 3.746739, 5.607771,
-3.415188, -3.227867, -5.374659,
-3.415188, -3.227867, 5.607771,
-3.415188, 3.746739, -5.374659,
-3.415188, 3.746739, 5.607771,
-3.415188, -3.227867, -5.374659,
3.309775, -3.227867, -5.374659,
-3.415188, -3.227867, 5.607771,
3.309775, -3.227867, 5.607771,
-3.415188, 3.746739, -5.374659,
3.309775, 3.746739, -5.374659,
-3.415188, 3.746739, 5.607771,
3.309775, 3.746739, 5.607771,
3.309775, -3.227867, -5.374659,
3.309775, 3.746739, -5.374659,
3.309775, -3.227867, 5.607771,
3.309775, 3.746739, 5.607771,
3.309775, -3.227867, -5.374659,
3.309775, -3.227867, 5.607771,
3.309775, 3.746739, -5.374659,
3.309775, 3.746739, 5.607771
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
var radius = 7.820291;
var distance = 34.79336;
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
mvMatrix.translate( 0.0527066, -0.2594362, -0.1165559 );
mvMatrix.scale( 1.257323, 1.21232, 0.7699072 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.79336);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
Phorate<-read.table("Phorate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Phorate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Phorate' not found
```

```r
y<-Phorate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Phorate' not found
```

```r
z<-Phorate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Phorate' not found
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
-3.317252, -2.0255, -3.662455, 0, 0, 1, 1, 1,
-3.146912, -1.517306, -1.588984, 1, 0, 0, 1, 1,
-2.774174, -0.4021793, -2.550695, 1, 0, 0, 1, 1,
-2.772231, -0.5861516, -2.009091, 1, 0, 0, 1, 1,
-2.657754, 0.6220228, -1.691671, 1, 0, 0, 1, 1,
-2.646693, 1.091365, -1.678566, 1, 0, 0, 1, 1,
-2.618913, 0.5451314, -3.329834, 0, 0, 0, 1, 1,
-2.597646, -0.3970225, -1.765298, 0, 0, 0, 1, 1,
-2.468926, -1.640767, -1.327807, 0, 0, 0, 1, 1,
-2.419685, 0.1814475, -3.992584, 0, 0, 0, 1, 1,
-2.364333, 0.8529062, -2.036326, 0, 0, 0, 1, 1,
-2.256764, -1.130604, -1.742032, 0, 0, 0, 1, 1,
-2.255354, 1.381582, 0.7272526, 0, 0, 0, 1, 1,
-2.195555, -1.231568, -1.323948, 1, 1, 1, 1, 1,
-2.146022, -0.5601928, -0.1920141, 1, 1, 1, 1, 1,
-2.133174, 0.182479, -0.4787195, 1, 1, 1, 1, 1,
-2.046929, 0.1064181, -2.051957, 1, 1, 1, 1, 1,
-1.98015, 0.5800778, -0.5485772, 1, 1, 1, 1, 1,
-1.922574, -0.6469727, -1.816535, 1, 1, 1, 1, 1,
-1.914202, -1.248595, -1.417886, 1, 1, 1, 1, 1,
-1.903806, 0.8739098, -0.3143363, 1, 1, 1, 1, 1,
-1.886757, -0.6320981, -1.862525, 1, 1, 1, 1, 1,
-1.843457, 0.264526, -2.20823, 1, 1, 1, 1, 1,
-1.840932, -0.5517898, -2.226875, 1, 1, 1, 1, 1,
-1.834893, 0.7017249, -1.240644, 1, 1, 1, 1, 1,
-1.817921, 0.3789622, -1.224763, 1, 1, 1, 1, 1,
-1.800258, -0.2249845, -2.420992, 1, 1, 1, 1, 1,
-1.776631, -0.2108093, -1.834537, 1, 1, 1, 1, 1,
-1.752822, -0.6665385, -2.690383, 0, 0, 1, 1, 1,
-1.749895, -1.045319, -3.511753, 1, 0, 0, 1, 1,
-1.742345, 1.394679, -1.479061, 1, 0, 0, 1, 1,
-1.738683, -0.6029093, -1.957813, 1, 0, 0, 1, 1,
-1.719769, -0.6354145, -3.104353, 1, 0, 0, 1, 1,
-1.716619, -0.3689148, -1.650195, 1, 0, 0, 1, 1,
-1.709477, 0.3465561, -3.098815, 0, 0, 0, 1, 1,
-1.709216, -0.4825385, -2.601806, 0, 0, 0, 1, 1,
-1.705446, -0.1598857, -1.037796, 0, 0, 0, 1, 1,
-1.688411, 1.208397, -0.7875303, 0, 0, 0, 1, 1,
-1.673482, -0.6747248, -2.02691, 0, 0, 0, 1, 1,
-1.663989, -0.6304976, -0.7649088, 0, 0, 0, 1, 1,
-1.656475, 0.1180503, -1.443912, 0, 0, 0, 1, 1,
-1.65545, -0.2016479, -1.202544, 1, 1, 1, 1, 1,
-1.63892, 1.594562, -1.885104, 1, 1, 1, 1, 1,
-1.637304, -0.8926949, -0.8530489, 1, 1, 1, 1, 1,
-1.630318, 0.03490403, -2.15255, 1, 1, 1, 1, 1,
-1.629533, -0.7804425, -1.825193, 1, 1, 1, 1, 1,
-1.627643, 0.8775019, -0.07189374, 1, 1, 1, 1, 1,
-1.606319, 0.1492786, -1.181471, 1, 1, 1, 1, 1,
-1.601851, 0.8279824, -1.474316, 1, 1, 1, 1, 1,
-1.599415, -0.8882511, -0.2305479, 1, 1, 1, 1, 1,
-1.582656, 0.02296699, -2.117647, 1, 1, 1, 1, 1,
-1.572588, -0.3095974, -1.063553, 1, 1, 1, 1, 1,
-1.566781, 1.252881, -1.625339, 1, 1, 1, 1, 1,
-1.565067, 0.8304019, -0.0434552, 1, 1, 1, 1, 1,
-1.559558, -1.401863, -1.620018, 1, 1, 1, 1, 1,
-1.546722, -1.429027, -3.368213, 1, 1, 1, 1, 1,
-1.534872, 1.399302, -0.2490761, 0, 0, 1, 1, 1,
-1.52094, 1.657297, -0.05373418, 1, 0, 0, 1, 1,
-1.51377, -0.2480301, -1.330882, 1, 0, 0, 1, 1,
-1.478517, -0.02851944, -0.123766, 1, 0, 0, 1, 1,
-1.465935, 0.6148157, -0.7233632, 1, 0, 0, 1, 1,
-1.459091, 0.2660757, -1.813287, 1, 0, 0, 1, 1,
-1.449189, -0.7854274, -2.483691, 0, 0, 0, 1, 1,
-1.443521, -0.3545538, -1.492232, 0, 0, 0, 1, 1,
-1.423534, -0.3587478, -0.6423198, 0, 0, 0, 1, 1,
-1.422526, -0.8380506, -1.708551, 0, 0, 0, 1, 1,
-1.418753, 0.3637226, -0.5703276, 0, 0, 0, 1, 1,
-1.414298, 0.8851641, -1.099059, 0, 0, 0, 1, 1,
-1.413662, -1.19843, -2.9921, 0, 0, 0, 1, 1,
-1.400771, -0.4056989, -2.144078, 1, 1, 1, 1, 1,
-1.394409, -0.05670149, -2.638762, 1, 1, 1, 1, 1,
-1.392024, -0.0679423, -0.9852872, 1, 1, 1, 1, 1,
-1.389086, -0.2868701, -0.0003823106, 1, 1, 1, 1, 1,
-1.389021, -0.1550699, -0.9691055, 1, 1, 1, 1, 1,
-1.388223, -0.5117451, -4.904648, 1, 1, 1, 1, 1,
-1.38523, 0.7748954, -0.5645445, 1, 1, 1, 1, 1,
-1.361977, -1.03537, -2.250185, 1, 1, 1, 1, 1,
-1.347288, -1.42979, -4.891282, 1, 1, 1, 1, 1,
-1.346341, 0.4239587, -1.335737, 1, 1, 1, 1, 1,
-1.345457, 0.4855875, -0.9025107, 1, 1, 1, 1, 1,
-1.340754, 0.1343952, -1.742337, 1, 1, 1, 1, 1,
-1.332661, 0.5270408, -0.8812007, 1, 1, 1, 1, 1,
-1.33203, 0.1054012, -0.5171408, 1, 1, 1, 1, 1,
-1.324306, -1.107934, -2.194227, 1, 1, 1, 1, 1,
-1.321971, 1.272789, 0.07971036, 0, 0, 1, 1, 1,
-1.304992, 0.9210533, -2.518257, 1, 0, 0, 1, 1,
-1.304964, -0.6209579, -2.85194, 1, 0, 0, 1, 1,
-1.301665, -0.6178345, -2.477024, 1, 0, 0, 1, 1,
-1.287271, -0.877692, -1.914457, 1, 0, 0, 1, 1,
-1.284268, 0.6099764, 0.3989496, 1, 0, 0, 1, 1,
-1.278381, -1.634173, -5.214721, 0, 0, 0, 1, 1,
-1.270622, 1.592256, -1.256011, 0, 0, 0, 1, 1,
-1.269667, -1.216526, -3.578835, 0, 0, 0, 1, 1,
-1.264668, 0.4020673, 0.2740996, 0, 0, 0, 1, 1,
-1.251514, -2.173683, -1.425858, 0, 0, 0, 1, 1,
-1.251486, -0.7940487, -0.8928421, 0, 0, 0, 1, 1,
-1.247043, 0.06055845, -0.7872581, 0, 0, 0, 1, 1,
-1.245105, 0.1209201, -0.8858345, 1, 1, 1, 1, 1,
-1.24045, 0.7470021, -0.4417303, 1, 1, 1, 1, 1,
-1.240066, -1.043555, -2.408315, 1, 1, 1, 1, 1,
-1.225754, -1.501117, -2.75352, 1, 1, 1, 1, 1,
-1.225122, 1.258777, -0.3203999, 1, 1, 1, 1, 1,
-1.219275, -0.627883, -2.699804, 1, 1, 1, 1, 1,
-1.212998, -0.1993262, -1.714677, 1, 1, 1, 1, 1,
-1.207321, -0.3209002, -2.328756, 1, 1, 1, 1, 1,
-1.201279, -0.9906996, -3.248653, 1, 1, 1, 1, 1,
-1.196392, 0.8509768, 0.689751, 1, 1, 1, 1, 1,
-1.193407, 0.8559607, 0.2414083, 1, 1, 1, 1, 1,
-1.182299, -0.930927, -2.678952, 1, 1, 1, 1, 1,
-1.177796, -0.6796315, -1.727209, 1, 1, 1, 1, 1,
-1.176746, 1.885011, -1.548135, 1, 1, 1, 1, 1,
-1.173869, 0.1131773, -1.223545, 1, 1, 1, 1, 1,
-1.164733, -0.8485419, -3.067378, 0, 0, 1, 1, 1,
-1.16098, -0.09204707, -1.544354, 1, 0, 0, 1, 1,
-1.152196, -0.09443349, -0.9775594, 1, 0, 0, 1, 1,
-1.136814, -0.2374137, -0.773364, 1, 0, 0, 1, 1,
-1.132102, 0.9340119, -0.7406194, 1, 0, 0, 1, 1,
-1.132059, 0.3857192, -1.798766, 1, 0, 0, 1, 1,
-1.114117, -0.3268887, -1.635654, 0, 0, 0, 1, 1,
-1.103499, 0.1393569, -0.07577743, 0, 0, 0, 1, 1,
-1.099797, -0.4150907, -1.900744, 0, 0, 0, 1, 1,
-1.098744, -1.024258, -2.600379, 0, 0, 0, 1, 1,
-1.097934, 0.2869403, -2.557669, 0, 0, 0, 1, 1,
-1.09682, -0.1884783, -1.234836, 0, 0, 0, 1, 1,
-1.095285, -0.3457914, -2.890682, 0, 0, 0, 1, 1,
-1.09383, 1.073454, -0.7394087, 1, 1, 1, 1, 1,
-1.090998, -0.1179492, -1.710858, 1, 1, 1, 1, 1,
-1.08759, 0.05463257, -1.037354, 1, 1, 1, 1, 1,
-1.080426, 0.4859911, 0.2547923, 1, 1, 1, 1, 1,
-1.079211, 0.5523139, 0.0461974, 1, 1, 1, 1, 1,
-1.075447, 0.4602649, -0.3571657, 1, 1, 1, 1, 1,
-1.073646, 0.9347961, -1.228816, 1, 1, 1, 1, 1,
-1.072165, -0.2965366, -0.5676452, 1, 1, 1, 1, 1,
-1.071409, 0.5695805, -1.660232, 1, 1, 1, 1, 1,
-1.070612, -1.217305, -3.287998, 1, 1, 1, 1, 1,
-1.06582, -0.159525, -2.245641, 1, 1, 1, 1, 1,
-1.050549, -1.306036, -2.895846, 1, 1, 1, 1, 1,
-1.049963, -1.423639, -4.311061, 1, 1, 1, 1, 1,
-1.045172, 0.6713141, -1.002303, 1, 1, 1, 1, 1,
-1.044243, 2.081848, -0.936275, 1, 1, 1, 1, 1,
-1.038916, 0.9324717, -0.9049457, 0, 0, 1, 1, 1,
-1.035735, 1.578544, -0.9720851, 1, 0, 0, 1, 1,
-1.033866, -0.5196533, -2.472978, 1, 0, 0, 1, 1,
-1.033041, -2.487937, -2.029718, 1, 0, 0, 1, 1,
-1.026826, 0.7940805, -2.805778, 1, 0, 0, 1, 1,
-1.023014, 1.01296, 1.297861, 1, 0, 0, 1, 1,
-1.01317, -0.6132556, -3.837423, 0, 0, 0, 1, 1,
-1.012386, -1.057335, -4.550993, 0, 0, 0, 1, 1,
-1.009373, -0.53215, -2.287639, 0, 0, 0, 1, 1,
-1.009256, -0.9541076, -1.176371, 0, 0, 0, 1, 1,
-1.00843, -1.085093, -2.616391, 0, 0, 0, 1, 1,
-1.00811, -1.194844, -2.337979, 0, 0, 0, 1, 1,
-1.005807, 0.4523187, -0.4270055, 0, 0, 0, 1, 1,
-1.000121, -1.112766, -2.333468, 1, 1, 1, 1, 1,
-0.9900701, 0.5375027, -1.14501, 1, 1, 1, 1, 1,
-0.9896653, 1.207162, 0.9040388, 1, 1, 1, 1, 1,
-0.9858794, -0.1951434, -0.9935189, 1, 1, 1, 1, 1,
-0.9835433, 0.1127516, -2.793895, 1, 1, 1, 1, 1,
-0.976599, 1.850946, -0.9017314, 1, 1, 1, 1, 1,
-0.9673571, -0.9773632, -2.574472, 1, 1, 1, 1, 1,
-0.9570076, -0.05155037, -1.95586, 1, 1, 1, 1, 1,
-0.956886, 1.202774, -0.9225625, 1, 1, 1, 1, 1,
-0.9551528, 1.497707, -2.747351, 1, 1, 1, 1, 1,
-0.9539461, 0.2298369, -0.6024675, 1, 1, 1, 1, 1,
-0.9535732, -0.8763185, -3.174931, 1, 1, 1, 1, 1,
-0.9497034, -1.165816, -3.513492, 1, 1, 1, 1, 1,
-0.9432591, -1.159542, -2.420059, 1, 1, 1, 1, 1,
-0.9393834, 0.1238677, -0.4818552, 1, 1, 1, 1, 1,
-0.9354135, 0.2447687, 1.131524, 0, 0, 1, 1, 1,
-0.9280344, -1.731038, -2.931431, 1, 0, 0, 1, 1,
-0.9253383, -1.069898, -3.40439, 1, 0, 0, 1, 1,
-0.9146141, -1.390282, -1.62624, 1, 0, 0, 1, 1,
-0.9089172, 0.006039031, -0.2734156, 1, 0, 0, 1, 1,
-0.9053492, 2.239945, 0.5261638, 1, 0, 0, 1, 1,
-0.9018726, 0.7948822, -0.9017277, 0, 0, 0, 1, 1,
-0.9010662, 2.313351, -0.9242924, 0, 0, 0, 1, 1,
-0.899867, -0.7941041, -1.653007, 0, 0, 0, 1, 1,
-0.8989646, -0.5072863, -3.281272, 0, 0, 0, 1, 1,
-0.8977561, -0.5556645, -2.392403, 0, 0, 0, 1, 1,
-0.8975096, 1.460458, -1.340036, 0, 0, 0, 1, 1,
-0.8969116, -0.5431443, -2.826104, 0, 0, 0, 1, 1,
-0.8960336, -0.166074, -2.469227, 1, 1, 1, 1, 1,
-0.8936137, 0.8564598, -0.219182, 1, 1, 1, 1, 1,
-0.888285, -0.1796178, -1.797122, 1, 1, 1, 1, 1,
-0.8847234, -1.594448, -2.879031, 1, 1, 1, 1, 1,
-0.880365, -0.8063558, -1.697073, 1, 1, 1, 1, 1,
-0.8755885, -0.1175694, -2.461693, 1, 1, 1, 1, 1,
-0.8730803, -0.4478647, -1.378448, 1, 1, 1, 1, 1,
-0.8635337, -0.4792944, -2.271097, 1, 1, 1, 1, 1,
-0.8597562, 0.7474089, -0.3281116, 1, 1, 1, 1, 1,
-0.8568207, -0.1742103, -1.374049, 1, 1, 1, 1, 1,
-0.8556722, 1.397747, -0.6635935, 1, 1, 1, 1, 1,
-0.8545468, 0.2327643, -1.93778, 1, 1, 1, 1, 1,
-0.8472109, 1.710824, -1.112493, 1, 1, 1, 1, 1,
-0.845613, 0.1874823, -2.359155, 1, 1, 1, 1, 1,
-0.8440846, 0.987159, -1.268984, 1, 1, 1, 1, 1,
-0.8420118, 0.7475647, -1.448901, 0, 0, 1, 1, 1,
-0.8398483, 0.105573, -1.015827, 1, 0, 0, 1, 1,
-0.8304409, 1.063224, 0.4339589, 1, 0, 0, 1, 1,
-0.8271409, -0.473273, -2.895499, 1, 0, 0, 1, 1,
-0.8267562, 1.050618, 1.412571, 1, 0, 0, 1, 1,
-0.8266418, 1.269926, -0.9970894, 1, 0, 0, 1, 1,
-0.8242378, -1.260292, -3.724463, 0, 0, 0, 1, 1,
-0.8153793, 1.187704, -2.600993, 0, 0, 0, 1, 1,
-0.807404, -0.4013914, -1.569725, 0, 0, 0, 1, 1,
-0.8036036, 0.7707388, -0.1134877, 0, 0, 0, 1, 1,
-0.8028191, -0.9170755, -2.569074, 0, 0, 0, 1, 1,
-0.7975125, -0.7505012, -2.050502, 0, 0, 0, 1, 1,
-0.7965862, -0.5798359, -3.769445, 0, 0, 0, 1, 1,
-0.7864742, 0.7697854, -0.9803148, 1, 1, 1, 1, 1,
-0.7690246, 0.3635057, -1.878249, 1, 1, 1, 1, 1,
-0.7679181, 1.73105, 0.3630315, 1, 1, 1, 1, 1,
-0.7677502, 3.645167, -0.8269292, 1, 1, 1, 1, 1,
-0.7661578, 0.8118704, -2.531103, 1, 1, 1, 1, 1,
-0.7654034, -0.6708371, -3.581981, 1, 1, 1, 1, 1,
-0.7619859, 0.4783753, -1.916011, 1, 1, 1, 1, 1,
-0.7563334, 0.2216905, -1.232912, 1, 1, 1, 1, 1,
-0.7522867, 0.5227609, -0.8514196, 1, 1, 1, 1, 1,
-0.7507702, -0.3843565, -1.516621, 1, 1, 1, 1, 1,
-0.7484709, -0.972096, -2.073042, 1, 1, 1, 1, 1,
-0.7479445, -1.530706, -2.728606, 1, 1, 1, 1, 1,
-0.7428065, -1.116608, -2.577574, 1, 1, 1, 1, 1,
-0.7412925, 0.7919112, -2.343275, 1, 1, 1, 1, 1,
-0.7343698, -0.2387744, -2.196813, 1, 1, 1, 1, 1,
-0.7333635, -0.232128, -0.9773456, 0, 0, 1, 1, 1,
-0.7217386, -0.5376274, -2.311766, 1, 0, 0, 1, 1,
-0.721329, -0.07783771, -0.6548041, 1, 0, 0, 1, 1,
-0.7203978, -0.817139, -3.620222, 1, 0, 0, 1, 1,
-0.7140349, 0.320298, -2.68566, 1, 0, 0, 1, 1,
-0.7046232, -0.6984514, -3.014998, 1, 0, 0, 1, 1,
-0.6971797, -1.039272, -1.127574, 0, 0, 0, 1, 1,
-0.6959108, 0.4091407, -1.328742, 0, 0, 0, 1, 1,
-0.6950628, -0.581718, -2.651876, 0, 0, 0, 1, 1,
-0.6923456, 0.02691535, -1.946469, 0, 0, 0, 1, 1,
-0.6885933, 0.7797475, -0.4066451, 0, 0, 0, 1, 1,
-0.6792808, -0.006555019, -1.337297, 0, 0, 0, 1, 1,
-0.6789452, -0.2775681, -2.278785, 0, 0, 0, 1, 1,
-0.6749166, 0.4603516, -1.457458, 1, 1, 1, 1, 1,
-0.6718602, 2.329673, -0.6014662, 1, 1, 1, 1, 1,
-0.6691921, 0.2864874, -0.6785606, 1, 1, 1, 1, 1,
-0.6676973, -1.802426, -4.678427, 1, 1, 1, 1, 1,
-0.6616164, -1.215187, -2.51158, 1, 1, 1, 1, 1,
-0.6599333, -0.1744135, -0.3818819, 1, 1, 1, 1, 1,
-0.6524552, 0.175199, -0.9687691, 1, 1, 1, 1, 1,
-0.6476304, -0.681594, -1.397751, 1, 1, 1, 1, 1,
-0.6456557, -0.7978777, -2.54348, 1, 1, 1, 1, 1,
-0.6447797, 0.8718594, -1.691312, 1, 1, 1, 1, 1,
-0.6435314, 0.02015529, -1.097042, 1, 1, 1, 1, 1,
-0.6383774, -0.7894287, -2.678209, 1, 1, 1, 1, 1,
-0.6318429, -0.5146748, -3.141335, 1, 1, 1, 1, 1,
-0.6317348, -0.1246707, -1.949971, 1, 1, 1, 1, 1,
-0.6259513, -0.2278442, -0.961594, 1, 1, 1, 1, 1,
-0.6230687, 0.3220647, -1.265805, 0, 0, 1, 1, 1,
-0.6219421, -1.158014, -1.735746, 1, 0, 0, 1, 1,
-0.6217927, -0.9594954, -2.386559, 1, 0, 0, 1, 1,
-0.6206028, -1.857732, -3.714062, 1, 0, 0, 1, 1,
-0.6195061, -0.1110091, -1.646221, 1, 0, 0, 1, 1,
-0.6191727, 0.5557351, 1.720289, 1, 0, 0, 1, 1,
-0.6190531, 1.147045, -1.215687, 0, 0, 0, 1, 1,
-0.6175883, -1.17087, -1.845244, 0, 0, 0, 1, 1,
-0.6139829, -0.4792769, -0.9720227, 0, 0, 0, 1, 1,
-0.6106109, 0.07517074, -1.063629, 0, 0, 0, 1, 1,
-0.6084568, 1.665918, -1.491065, 0, 0, 0, 1, 1,
-0.6040515, -0.9658413, -2.222824, 0, 0, 0, 1, 1,
-0.5949195, -0.1349539, -1.94203, 0, 0, 0, 1, 1,
-0.5888445, -0.8631396, -2.099515, 1, 1, 1, 1, 1,
-0.5829126, 1.335938, 1.336367, 1, 1, 1, 1, 1,
-0.5827991, -0.4476761, -3.09975, 1, 1, 1, 1, 1,
-0.5820888, -1.117086, -2.142364, 1, 1, 1, 1, 1,
-0.5819877, -0.07526742, -1.570555, 1, 1, 1, 1, 1,
-0.581836, -0.3186904, -0.8851211, 1, 1, 1, 1, 1,
-0.5817824, -0.4562219, -2.05475, 1, 1, 1, 1, 1,
-0.579266, 1.031506, 0.9694628, 1, 1, 1, 1, 1,
-0.5748417, 0.6086335, -0.5602284, 1, 1, 1, 1, 1,
-0.5705389, -2.293605, -4.861112, 1, 1, 1, 1, 1,
-0.5670822, -0.566672, -3.402154, 1, 1, 1, 1, 1,
-0.5637846, -1.550511, -3.291488, 1, 1, 1, 1, 1,
-0.5632074, 0.1662251, -0.4692464, 1, 1, 1, 1, 1,
-0.5625705, -0.6541387, -2.216655, 1, 1, 1, 1, 1,
-0.5612021, -0.5955431, -1.873576, 1, 1, 1, 1, 1,
-0.5604215, -0.5005434, -2.643086, 0, 0, 1, 1, 1,
-0.5575732, 0.5488542, 0.006672823, 1, 0, 0, 1, 1,
-0.5553159, -0.8812796, -2.405345, 1, 0, 0, 1, 1,
-0.5546068, -0.973671, -2.618972, 1, 0, 0, 1, 1,
-0.5541106, 0.03587142, -1.711929, 1, 0, 0, 1, 1,
-0.5500655, 1.309741, -0.401396, 1, 0, 0, 1, 1,
-0.5494998, 0.4927344, -1.822488, 0, 0, 0, 1, 1,
-0.5494249, 0.1642393, -0.6977316, 0, 0, 0, 1, 1,
-0.5492714, 1.652725, 0.3908862, 0, 0, 0, 1, 1,
-0.5459849, -0.4172164, -2.725549, 0, 0, 0, 1, 1,
-0.5401155, 0.3453212, -0.1898038, 0, 0, 0, 1, 1,
-0.5378043, -0.2060446, -0.05580112, 0, 0, 0, 1, 1,
-0.5352864, 0.5534333, 0.6121416, 0, 0, 0, 1, 1,
-0.5321631, -1.014578, -0.8593364, 1, 1, 1, 1, 1,
-0.5301303, -0.0248554, -0.6917759, 1, 1, 1, 1, 1,
-0.5217808, -1.679903, -3.272943, 1, 1, 1, 1, 1,
-0.5171034, 0.6804087, -0.1541862, 1, 1, 1, 1, 1,
-0.5167947, -0.178005, -0.7592254, 1, 1, 1, 1, 1,
-0.513922, -0.1782999, -0.6515023, 1, 1, 1, 1, 1,
-0.5093641, -0.5207257, -0.6214474, 1, 1, 1, 1, 1,
-0.5089273, -0.1234323, -2.944848, 1, 1, 1, 1, 1,
-0.5086899, -0.5146548, -4.58711, 1, 1, 1, 1, 1,
-0.5084847, 0.1907082, -1.134723, 1, 1, 1, 1, 1,
-0.5019462, -0.6758312, -3.947293, 1, 1, 1, 1, 1,
-0.4995571, 0.3880513, -1.795986, 1, 1, 1, 1, 1,
-0.4917829, 0.768661, -1.70201, 1, 1, 1, 1, 1,
-0.4917822, -2.251818, -3.802587, 1, 1, 1, 1, 1,
-0.48531, 0.4246237, 0.6233546, 1, 1, 1, 1, 1,
-0.4775666, -1.739494, -2.027946, 0, 0, 1, 1, 1,
-0.4771311, 0.686428, -0.7782435, 1, 0, 0, 1, 1,
-0.4766155, -2.412163, -3.690414, 1, 0, 0, 1, 1,
-0.4746274, 0.1981894, -0.05294306, 1, 0, 0, 1, 1,
-0.4732031, -0.8876802, -2.79593, 1, 0, 0, 1, 1,
-0.4719648, -0.08551277, -2.868321, 1, 0, 0, 1, 1,
-0.4651175, -0.2610634, -2.738385, 0, 0, 0, 1, 1,
-0.4490591, 0.8214933, -2.594657, 0, 0, 0, 1, 1,
-0.4485181, -0.4243625, -3.21508, 0, 0, 0, 1, 1,
-0.4473239, 1.111552, -0.2635876, 0, 0, 0, 1, 1,
-0.446786, 0.4715072, -0.8628533, 0, 0, 0, 1, 1,
-0.4423792, 0.8895798, -0.03792776, 0, 0, 0, 1, 1,
-0.44157, -0.02865811, -2.305361, 0, 0, 0, 1, 1,
-0.4236054, 1.762015, 0.8110251, 1, 1, 1, 1, 1,
-0.4222834, -0.222693, -2.416124, 1, 1, 1, 1, 1,
-0.4194752, 0.6560587, -2.841033, 1, 1, 1, 1, 1,
-0.4188516, -1.203046, -1.204519, 1, 1, 1, 1, 1,
-0.4174665, -0.3167489, -1.901699, 1, 1, 1, 1, 1,
-0.410468, 0.8119852, 0.1865136, 1, 1, 1, 1, 1,
-0.4097877, 1.331232, -0.5304651, 1, 1, 1, 1, 1,
-0.4057937, 1.410916, -1.449207, 1, 1, 1, 1, 1,
-0.4044449, -1.13299, -2.475941, 1, 1, 1, 1, 1,
-0.4043211, -0.2545677, -3.416497, 1, 1, 1, 1, 1,
-0.4016636, 1.652121, -0.1492765, 1, 1, 1, 1, 1,
-0.4006848, -0.5828021, -4.454634, 1, 1, 1, 1, 1,
-0.3980609, -0.984991, -1.662002, 1, 1, 1, 1, 1,
-0.3901576, 0.9445947, 0.4880241, 1, 1, 1, 1, 1,
-0.3829876, -3.002244, -3.17858, 1, 1, 1, 1, 1,
-0.3806529, -1.165405, -4.23451, 0, 0, 1, 1, 1,
-0.3748386, 0.2947125, -0.3046104, 1, 0, 0, 1, 1,
-0.3704082, 0.8812981, 0.1811571, 1, 0, 0, 1, 1,
-0.3564135, 0.5131497, -1.466628, 1, 0, 0, 1, 1,
-0.354394, 0.873758, -1.219303, 1, 0, 0, 1, 1,
-0.3508915, 1.294952, 0.1125999, 1, 0, 0, 1, 1,
-0.3489085, 2.492078, 2.696853, 0, 0, 0, 1, 1,
-0.3472797, -1.34017, -4.473865, 0, 0, 0, 1, 1,
-0.3418698, -0.9850396, -2.773809, 0, 0, 0, 1, 1,
-0.3377111, -0.6737958, -4.109245, 0, 0, 0, 1, 1,
-0.3373088, -0.3968358, -2.772687, 0, 0, 0, 1, 1,
-0.3330384, 0.159299, -2.22014, 0, 0, 0, 1, 1,
-0.3327231, -0.3140658, -3.440534, 0, 0, 0, 1, 1,
-0.3303168, 0.106357, -1.236261, 1, 1, 1, 1, 1,
-0.3290879, 1.525265, -1.778705, 1, 1, 1, 1, 1,
-0.3229257, 0.5567358, -0.3400503, 1, 1, 1, 1, 1,
-0.3193462, 2.315039, 0.9310623, 1, 1, 1, 1, 1,
-0.3187866, -0.8165894, -2.892878, 1, 1, 1, 1, 1,
-0.3174658, 1.055032, -1.851125, 1, 1, 1, 1, 1,
-0.3138652, -0.5973633, -1.571359, 1, 1, 1, 1, 1,
-0.3130831, 1.656285, 0.7409024, 1, 1, 1, 1, 1,
-0.3121524, -0.4730333, -1.566784, 1, 1, 1, 1, 1,
-0.3114343, 0.03014268, -0.8628335, 1, 1, 1, 1, 1,
-0.3039066, -1.738458, -3.441181, 1, 1, 1, 1, 1,
-0.3000205, 0.372609, -1.300369, 1, 1, 1, 1, 1,
-0.2983723, -0.9627631, -1.839664, 1, 1, 1, 1, 1,
-0.2949878, 0.7273905, -0.006155769, 1, 1, 1, 1, 1,
-0.2936942, 0.7637353, 0.004946, 1, 1, 1, 1, 1,
-0.2935855, -0.4628401, -3.96686, 0, 0, 1, 1, 1,
-0.293437, -1.782066, -2.191995, 1, 0, 0, 1, 1,
-0.2924212, -1.038796, -3.623988, 1, 0, 0, 1, 1,
-0.2819831, -0.04478154, -0.05371542, 1, 0, 0, 1, 1,
-0.2803108, 0.9993089, -0.5811928, 1, 0, 0, 1, 1,
-0.2802142, -0.5364183, -2.002314, 1, 0, 0, 1, 1,
-0.2692492, 1.104208, -0.3563478, 0, 0, 0, 1, 1,
-0.2666197, -0.8479203, -2.752927, 0, 0, 0, 1, 1,
-0.2637267, 0.02795039, -3.525284, 0, 0, 0, 1, 1,
-0.263311, 0.2025495, -0.4731365, 0, 0, 0, 1, 1,
-0.259527, 0.1352341, -1.253978, 0, 0, 0, 1, 1,
-0.2563165, -0.6206189, -1.782419, 0, 0, 0, 1, 1,
-0.2549224, 0.6770805, -1.993631, 0, 0, 0, 1, 1,
-0.2520737, 0.3330317, 1.08487, 1, 1, 1, 1, 1,
-0.2511716, 0.819778, -1.764265, 1, 1, 1, 1, 1,
-0.2499622, -0.9209977, -3.387769, 1, 1, 1, 1, 1,
-0.2491741, 0.3912393, -0.9665362, 1, 1, 1, 1, 1,
-0.2470952, -3.022057, -3.495806, 1, 1, 1, 1, 1,
-0.2456127, -1.367246, -3.3479, 1, 1, 1, 1, 1,
-0.2326249, -0.7468463, -2.757277, 1, 1, 1, 1, 1,
-0.2287709, 0.03944001, -1.590839, 1, 1, 1, 1, 1,
-0.227389, 0.5562195, -1.851121, 1, 1, 1, 1, 1,
-0.2260754, 0.0001564681, -2.327466, 1, 1, 1, 1, 1,
-0.2210408, -0.175247, -3.664703, 1, 1, 1, 1, 1,
-0.2184408, 0.08062388, -0.2053373, 1, 1, 1, 1, 1,
-0.2181505, 0.6077974, 0.3681418, 1, 1, 1, 1, 1,
-0.2168444, -0.8681926, -1.981645, 1, 1, 1, 1, 1,
-0.2150892, -1.386577, -3.613377, 1, 1, 1, 1, 1,
-0.2139631, 1.216257, 0.6588358, 0, 0, 1, 1, 1,
-0.2063237, -0.02134648, -2.302921, 1, 0, 0, 1, 1,
-0.2055688, -1.317202, -5.024125, 1, 0, 0, 1, 1,
-0.2044274, 0.2571871, 0.3377614, 1, 0, 0, 1, 1,
-0.2014766, 2.029446, 0.3013106, 1, 0, 0, 1, 1,
-0.1982321, -2.530374, -4.279895, 1, 0, 0, 1, 1,
-0.1903954, 1.484412, 0.2855363, 0, 0, 0, 1, 1,
-0.1889377, -1.571506, -1.862281, 0, 0, 0, 1, 1,
-0.1871056, 0.3737629, -1.132628, 0, 0, 0, 1, 1,
-0.1857057, 1.320407, 0.6961123, 0, 0, 0, 1, 1,
-0.1805255, 0.9197572, 1.169378, 0, 0, 0, 1, 1,
-0.1796777, 2.130195, 1.635952, 0, 0, 0, 1, 1,
-0.1781569, 0.7910968, -1.220203, 0, 0, 0, 1, 1,
-0.1752903, 0.5136513, -2.248034, 1, 1, 1, 1, 1,
-0.1744431, 1.171762, -0.04280059, 1, 1, 1, 1, 1,
-0.174059, -1.900429, -3.107497, 1, 1, 1, 1, 1,
-0.1713905, -0.8779709, -3.340408, 1, 1, 1, 1, 1,
-0.1712488, 0.5254456, 0.004198285, 1, 1, 1, 1, 1,
-0.1697073, -0.7272141, -2.80871, 1, 1, 1, 1, 1,
-0.1683551, -0.4002289, -3.939704, 1, 1, 1, 1, 1,
-0.1662545, -2.559425, -3.960585, 1, 1, 1, 1, 1,
-0.1644923, -1.744864, -0.645451, 1, 1, 1, 1, 1,
-0.1611519, -0.3314764, -1.455987, 1, 1, 1, 1, 1,
-0.1579825, -1.249143, -2.797536, 1, 1, 1, 1, 1,
-0.1564762, 0.1855588, -1.498987, 1, 1, 1, 1, 1,
-0.153835, 0.8504661, -0.07291137, 1, 1, 1, 1, 1,
-0.1514145, 0.7373908, -0.868798, 1, 1, 1, 1, 1,
-0.14802, 0.1647597, 0.2569596, 1, 1, 1, 1, 1,
-0.1469935, -0.2506264, -2.991108, 0, 0, 1, 1, 1,
-0.1467627, 0.9660292, -1.2154, 1, 0, 0, 1, 1,
-0.1431783, 0.07923799, -1.448244, 1, 0, 0, 1, 1,
-0.142773, 0.6251144, 0.7403975, 1, 0, 0, 1, 1,
-0.1411596, -0.5031932, -2.907575, 1, 0, 0, 1, 1,
-0.1386018, -0.4147339, -3.737054, 1, 0, 0, 1, 1,
-0.1318032, -0.3901437, -2.804378, 0, 0, 0, 1, 1,
-0.130948, 2.292154, -0.8103082, 0, 0, 0, 1, 1,
-0.1307368, 0.7480504, -0.373569, 0, 0, 0, 1, 1,
-0.1293195, -1.576241, -1.237083, 0, 0, 0, 1, 1,
-0.1290088, 0.1406463, -1.697114, 0, 0, 0, 1, 1,
-0.123101, 1.981238, -0.8170922, 0, 0, 0, 1, 1,
-0.1220597, 2.182635, 0.07089408, 0, 0, 0, 1, 1,
-0.1190911, 0.4508033, -1.004425, 1, 1, 1, 1, 1,
-0.115156, -0.6752463, -3.074644, 1, 1, 1, 1, 1,
-0.1140646, 0.2929018, -0.352921, 1, 1, 1, 1, 1,
-0.1092252, 0.1897032, -1.519472, 1, 1, 1, 1, 1,
-0.1052122, 0.002360946, -1.538136, 1, 1, 1, 1, 1,
-0.1036735, -0.5048686, -3.569527, 1, 1, 1, 1, 1,
-0.09870192, -0.3905202, -2.951082, 1, 1, 1, 1, 1,
-0.09667761, 0.7661287, -0.9717936, 1, 1, 1, 1, 1,
-0.09652046, 1.418689, 2.17933, 1, 1, 1, 1, 1,
-0.0958267, 0.078315, -1.562466, 1, 1, 1, 1, 1,
-0.09289565, 0.1612475, -0.03393835, 1, 1, 1, 1, 1,
-0.09197349, 0.05459449, -0.1667679, 1, 1, 1, 1, 1,
-0.08945937, 0.3520361, 0.0414257, 1, 1, 1, 1, 1,
-0.08233478, -0.02753958, -2.159669, 1, 1, 1, 1, 1,
-0.08111738, 1.126394, -0.4496965, 1, 1, 1, 1, 1,
-0.08071879, 1.588355, 0.3359808, 0, 0, 1, 1, 1,
-0.07765459, -1.239506, -2.758012, 1, 0, 0, 1, 1,
-0.07744963, 1.005151, -0.7596015, 1, 0, 0, 1, 1,
-0.07702757, 1.042235, -0.2004681, 1, 0, 0, 1, 1,
-0.07299198, -0.1591476, -2.641744, 1, 0, 0, 1, 1,
-0.07213531, 2.382164, 1.35842, 1, 0, 0, 1, 1,
-0.07081412, -2.458092, -1.776702, 0, 0, 0, 1, 1,
-0.06669863, 0.04344026, -3.191563, 0, 0, 0, 1, 1,
-0.06590717, 0.2000143, -0.03809745, 0, 0, 0, 1, 1,
-0.06389377, 0.8575068, -0.1807026, 0, 0, 0, 1, 1,
-0.0606099, -2.176878, -2.207994, 0, 0, 0, 1, 1,
-0.05909967, 0.2798701, 0.6564813, 0, 0, 0, 1, 1,
-0.05682753, -0.08489393, -3.739553, 0, 0, 0, 1, 1,
-0.05216822, 0.1664461, -1.812374, 1, 1, 1, 1, 1,
-0.05043944, -0.4937188, -4.187325, 1, 1, 1, 1, 1,
-0.04614854, -0.628521, -3.342045, 1, 1, 1, 1, 1,
-0.04587187, 0.4278143, -1.363328, 1, 1, 1, 1, 1,
-0.04125451, -0.08101688, -3.65949, 1, 1, 1, 1, 1,
-0.03952364, 0.7403038, 1.973782, 1, 1, 1, 1, 1,
-0.03917566, 0.01259426, -1.473458, 1, 1, 1, 1, 1,
-0.03894133, -0.3669698, -2.45891, 1, 1, 1, 1, 1,
-0.03451822, -1.118949, -4.660885, 1, 1, 1, 1, 1,
-0.03426738, 0.1660129, -0.5004336, 1, 1, 1, 1, 1,
-0.02263118, 0.4087274, 0.1200108, 1, 1, 1, 1, 1,
-0.02139174, -1.834872, -3.256403, 1, 1, 1, 1, 1,
-0.02126218, -0.1895491, -2.743153, 1, 1, 1, 1, 1,
-0.01987682, 0.7964783, -0.3386344, 1, 1, 1, 1, 1,
-0.01892889, 0.6300935, 1.008503, 1, 1, 1, 1, 1,
-0.01721488, -1.127424, -1.53785, 0, 0, 1, 1, 1,
-0.01436656, 1.483408, 0.002750218, 1, 0, 0, 1, 1,
-0.01350088, -0.1771478, -3.470712, 1, 0, 0, 1, 1,
-0.006673663, -2.162818, -3.552297, 1, 0, 0, 1, 1,
-0.005776875, 0.7840905, 0.4923728, 1, 0, 0, 1, 1,
-0.004571333, 0.699708, 0.6193039, 1, 0, 0, 1, 1,
-0.002297779, 0.6963447, -0.3790946, 0, 0, 0, 1, 1,
0.002334219, 0.5869245, -1.289335, 0, 0, 0, 1, 1,
0.003675824, -0.7957988, 3.580803, 0, 0, 0, 1, 1,
0.007055847, 0.5111445, -0.7745332, 0, 0, 0, 1, 1,
0.007684169, -0.01933717, 3.932124, 0, 0, 0, 1, 1,
0.008021812, 0.9541252, 0.1130181, 0, 0, 0, 1, 1,
0.009210822, 0.1317874, -0.1546012, 0, 0, 0, 1, 1,
0.01072101, -1.620173, 4.079177, 1, 1, 1, 1, 1,
0.01893346, -0.5558617, 1.849901, 1, 1, 1, 1, 1,
0.02187695, 1.451953, -0.7276322, 1, 1, 1, 1, 1,
0.0228106, 0.4560905, 1.251582, 1, 1, 1, 1, 1,
0.02491785, -0.5773875, 1.791834, 1, 1, 1, 1, 1,
0.02730298, -0.4262562, 2.03391, 1, 1, 1, 1, 1,
0.02844606, -0.480622, 3.694516, 1, 1, 1, 1, 1,
0.03483972, 1.048428, 0.1074842, 1, 1, 1, 1, 1,
0.03515859, 0.3664468, 0.2564006, 1, 1, 1, 1, 1,
0.03591623, -0.5531161, 3.189255, 1, 1, 1, 1, 1,
0.03827953, -0.0627076, 3.209234, 1, 1, 1, 1, 1,
0.03899438, -0.3059487, 1.928996, 1, 1, 1, 1, 1,
0.04241772, -1.085526, 2.225276, 1, 1, 1, 1, 1,
0.04264159, 1.477447, 1.219032, 1, 1, 1, 1, 1,
0.04362537, 0.1374581, -0.04940858, 1, 1, 1, 1, 1,
0.04374298, -1.70496, 1.810862, 0, 0, 1, 1, 1,
0.04390801, -0.5065454, 3.019825, 1, 0, 0, 1, 1,
0.04659496, -1.153035, 4.244016, 1, 0, 0, 1, 1,
0.0474375, 0.3254994, 0.1431274, 1, 0, 0, 1, 1,
0.04750858, 0.6079891, -0.4526867, 1, 0, 0, 1, 1,
0.05205414, 1.751717, 0.8759681, 1, 0, 0, 1, 1,
0.05267956, -0.5900936, 4.757744, 0, 0, 0, 1, 1,
0.05280279, -0.8321353, 3.006733, 0, 0, 0, 1, 1,
0.053135, 0.6468362, 0.5392833, 0, 0, 0, 1, 1,
0.05644879, -0.8552716, 4.255406, 0, 0, 0, 1, 1,
0.05774329, 1.958864, -0.6903518, 0, 0, 0, 1, 1,
0.06006886, -1.464553, 4.431362, 0, 0, 0, 1, 1,
0.06026193, 0.7706806, -0.5226182, 0, 0, 0, 1, 1,
0.06050597, 0.2072764, -0.2572773, 1, 1, 1, 1, 1,
0.06576163, -0.6957357, 2.834712, 1, 1, 1, 1, 1,
0.0675802, 0.2941112, -2.303091, 1, 1, 1, 1, 1,
0.07615985, 0.5569625, -1.640665, 1, 1, 1, 1, 1,
0.07688117, 1.08228, -0.6114614, 1, 1, 1, 1, 1,
0.07714429, 1.061686, 0.4552974, 1, 1, 1, 1, 1,
0.07993633, -0.629321, 3.784504, 1, 1, 1, 1, 1,
0.08028597, 1.228576, -0.3733828, 1, 1, 1, 1, 1,
0.08307982, 0.6367452, 0.03775769, 1, 1, 1, 1, 1,
0.08340272, 0.1351638, -1.611249, 1, 1, 1, 1, 1,
0.08550996, -0.6477689, 2.097643, 1, 1, 1, 1, 1,
0.08609166, 0.138617, 0.8989879, 1, 1, 1, 1, 1,
0.0919949, 1.420921, -0.4249283, 1, 1, 1, 1, 1,
0.09334539, 1.414454, 0.05939472, 1, 1, 1, 1, 1,
0.1031029, -0.4988738, 3.299517, 1, 1, 1, 1, 1,
0.1069352, -0.1402109, 2.92838, 0, 0, 1, 1, 1,
0.1070747, -1.345782, 3.365677, 1, 0, 0, 1, 1,
0.1094692, -0.4151807, 2.125436, 1, 0, 0, 1, 1,
0.1129807, -0.755787, 2.817317, 1, 0, 0, 1, 1,
0.1136375, -1.254509, 2.592298, 1, 0, 0, 1, 1,
0.1154584, -1.403918, 5.447833, 1, 0, 0, 1, 1,
0.1181313, -0.9983912, 2.287598, 0, 0, 0, 1, 1,
0.1190756, 0.1923699, 1.56163, 0, 0, 0, 1, 1,
0.1237372, -2.713944, 4.096694, 0, 0, 0, 1, 1,
0.126912, -0.2078161, 2.406174, 0, 0, 0, 1, 1,
0.1277837, 0.5120244, -0.7230859, 0, 0, 0, 1, 1,
0.1281732, 0.6955411, 2.507936, 0, 0, 0, 1, 1,
0.1335244, 1.137458, 1.874868, 0, 0, 0, 1, 1,
0.1341254, -0.425006, 1.912654, 1, 1, 1, 1, 1,
0.1366422, 0.9059343, 0.4623948, 1, 1, 1, 1, 1,
0.1420183, -0.196258, 1.175295, 1, 1, 1, 1, 1,
0.1423791, -0.3457742, 5.211352, 1, 1, 1, 1, 1,
0.145596, 1.028364, 0.5122483, 1, 1, 1, 1, 1,
0.1463085, -0.2510433, 1.66048, 1, 1, 1, 1, 1,
0.1465577, 1.121112, -1.083181, 1, 1, 1, 1, 1,
0.1484667, 2.34203, -1.427647, 1, 1, 1, 1, 1,
0.1504772, 1.00292, 0.9361104, 1, 1, 1, 1, 1,
0.1521785, -1.421226, 1.522107, 1, 1, 1, 1, 1,
0.153152, -0.6751434, 4.160521, 1, 1, 1, 1, 1,
0.1532612, -1.924575, 2.043504, 1, 1, 1, 1, 1,
0.1610201, 1.145028, 0.7807809, 1, 1, 1, 1, 1,
0.1683968, 1.148905, -0.3046452, 1, 1, 1, 1, 1,
0.168493, 2.73207, 0.4304556, 1, 1, 1, 1, 1,
0.1695137, -0.1551495, 0.8230903, 0, 0, 1, 1, 1,
0.1715784, -0.06333672, 3.023129, 1, 0, 0, 1, 1,
0.1742517, -1.555762, 2.207863, 1, 0, 0, 1, 1,
0.1762116, -1.877599, 2.913456, 1, 0, 0, 1, 1,
0.1827525, -0.1441504, 1.311122, 1, 0, 0, 1, 1,
0.1840433, -0.6082987, 1.726561, 1, 0, 0, 1, 1,
0.1875937, -0.163965, 0.6786594, 0, 0, 0, 1, 1,
0.1885216, -0.6933296, 2.717162, 0, 0, 0, 1, 1,
0.1915942, 0.4028103, -0.2952656, 0, 0, 0, 1, 1,
0.1950451, -0.4953428, 3.687512, 0, 0, 0, 1, 1,
0.1999323, -1.707467, 2.352193, 0, 0, 0, 1, 1,
0.2045703, 1.434701, -0.1201697, 0, 0, 0, 1, 1,
0.2049145, -0.02145035, 1.529532, 0, 0, 0, 1, 1,
0.2054775, -0.7185631, 1.511448, 1, 1, 1, 1, 1,
0.2082407, -0.6934603, 2.696445, 1, 1, 1, 1, 1,
0.2090284, -1.245039, 3.566366, 1, 1, 1, 1, 1,
0.2094495, 0.06789908, 1.80662, 1, 1, 1, 1, 1,
0.2158692, 1.085363, 0.7041228, 1, 1, 1, 1, 1,
0.2202484, 0.66397, -0.775031, 1, 1, 1, 1, 1,
0.2211555, 0.3525089, 0.9884068, 1, 1, 1, 1, 1,
0.2222744, 0.5311423, 0.6072019, 1, 1, 1, 1, 1,
0.2244551, -1.097658, 4.422189, 1, 1, 1, 1, 1,
0.2267555, -0.8129495, 2.655163, 1, 1, 1, 1, 1,
0.2284031, -0.3480211, 3.301948, 1, 1, 1, 1, 1,
0.2300946, -0.3039749, 2.837185, 1, 1, 1, 1, 1,
0.2346893, 0.9548556, 2.018628, 1, 1, 1, 1, 1,
0.2372261, 0.1614477, 1.770379, 1, 1, 1, 1, 1,
0.243745, 0.1500163, 0.7157829, 1, 1, 1, 1, 1,
0.2472631, 0.07516932, 0.3797209, 0, 0, 1, 1, 1,
0.2481082, 0.7613161, 0.2697931, 1, 0, 0, 1, 1,
0.2544999, 2.008499, 0.4485931, 1, 0, 0, 1, 1,
0.2552699, 0.2050288, -0.1571079, 1, 0, 0, 1, 1,
0.2554391, -0.9121509, 3.057831, 1, 0, 0, 1, 1,
0.2555833, 0.07606435, 1.498137, 1, 0, 0, 1, 1,
0.2557126, -1.27208, 3.029329, 0, 0, 0, 1, 1,
0.2567983, -1.684557, 2.617626, 0, 0, 0, 1, 1,
0.2569817, -0.6289861, 2.696151, 0, 0, 0, 1, 1,
0.2589576, -0.7333208, 2.536023, 0, 0, 0, 1, 1,
0.2626371, 0.6045182, 0.5742236, 0, 0, 0, 1, 1,
0.2652687, -0.4396255, 4.424997, 0, 0, 0, 1, 1,
0.2686686, 0.5834607, 0.0002147605, 0, 0, 0, 1, 1,
0.269161, -2.026925, 2.052989, 1, 1, 1, 1, 1,
0.2803627, -0.09194499, 1.813109, 1, 1, 1, 1, 1,
0.2916564, 0.9803393, -0.2784146, 1, 1, 1, 1, 1,
0.2975569, 0.6445565, 1.141195, 1, 1, 1, 1, 1,
0.2996466, -0.1846265, 3.432806, 1, 1, 1, 1, 1,
0.3016601, -0.1375778, 2.74833, 1, 1, 1, 1, 1,
0.3037494, 0.05170519, 1.894864, 1, 1, 1, 1, 1,
0.3045457, -0.5746602, 3.031154, 1, 1, 1, 1, 1,
0.3051556, -1.760692, 4.192914, 1, 1, 1, 1, 1,
0.3093144, 0.8675046, 0.2171846, 1, 1, 1, 1, 1,
0.3123818, 0.4278925, -1.012336, 1, 1, 1, 1, 1,
0.3130697, 1.500031, -2.199, 1, 1, 1, 1, 1,
0.3130836, 0.9281859, -0.1651009, 1, 1, 1, 1, 1,
0.314291, -0.6273794, 3.157274, 1, 1, 1, 1, 1,
0.3192837, -2.292021, 3.657389, 1, 1, 1, 1, 1,
0.3196002, -1.274221, 3.303116, 0, 0, 1, 1, 1,
0.3217386, -1.269396, 2.072641, 1, 0, 0, 1, 1,
0.3226687, -0.02971641, -0.7756314, 1, 0, 0, 1, 1,
0.3245045, 0.04940692, 0.3468253, 1, 0, 0, 1, 1,
0.325722, -0.9354178, 2.939083, 1, 0, 0, 1, 1,
0.3269153, -0.2440241, 1.365903, 1, 0, 0, 1, 1,
0.3275091, -1.551985, 2.0233, 0, 0, 0, 1, 1,
0.3280874, -1.273456, 1.385678, 0, 0, 0, 1, 1,
0.3330652, 0.9730954, 0.9033256, 0, 0, 0, 1, 1,
0.3362193, -0.6620922, 2.577765, 0, 0, 0, 1, 1,
0.340331, -0.7534645, 3.990614, 0, 0, 0, 1, 1,
0.340365, 0.007999702, 2.373127, 0, 0, 0, 1, 1,
0.3436388, -1.21464, 3.175838, 0, 0, 0, 1, 1,
0.3441998, -0.5379384, 2.670658, 1, 1, 1, 1, 1,
0.347794, 1.813912, 0.9251681, 1, 1, 1, 1, 1,
0.3488189, 1.121803, 0.01920063, 1, 1, 1, 1, 1,
0.3514386, 0.3352254, 0.431748, 1, 1, 1, 1, 1,
0.3534109, 0.2883969, 1.17318, 1, 1, 1, 1, 1,
0.3539572, -0.08795547, 0.2835214, 1, 1, 1, 1, 1,
0.3591499, 0.3509374, 0.9607549, 1, 1, 1, 1, 1,
0.3670835, -1.941924, 4.054174, 1, 1, 1, 1, 1,
0.3693658, 0.3572918, 1.858633, 1, 1, 1, 1, 1,
0.3712775, 1.212869, 0.5050894, 1, 1, 1, 1, 1,
0.3717499, -0.6178696, 2.062321, 1, 1, 1, 1, 1,
0.3734018, -3.126295, 4.676719, 1, 1, 1, 1, 1,
0.3746653, 2.826135, -0.1962433, 1, 1, 1, 1, 1,
0.3785638, 0.2848275, 0.04895853, 1, 1, 1, 1, 1,
0.3796074, 0.3504671, 2.261112, 1, 1, 1, 1, 1,
0.3973373, 2.341518, -0.3734369, 0, 0, 1, 1, 1,
0.3983442, -0.7091463, 1.320889, 1, 0, 0, 1, 1,
0.4043974, -0.6273087, 2.780827, 1, 0, 0, 1, 1,
0.4066062, -0.05566354, 2.334905, 1, 0, 0, 1, 1,
0.4116532, 0.3242436, -0.8113193, 1, 0, 0, 1, 1,
0.415152, -0.04891367, 0.5266056, 1, 0, 0, 1, 1,
0.4160593, 1.185275, -0.6044925, 0, 0, 0, 1, 1,
0.4180997, -1.013425, 3.64397, 0, 0, 0, 1, 1,
0.4227245, 1.112916, 0.9554982, 0, 0, 0, 1, 1,
0.4242486, -1.126317, 2.417223, 0, 0, 0, 1, 1,
0.4275959, 0.4771323, 0.4862091, 0, 0, 0, 1, 1,
0.4284688, 0.1668491, 3.24411, 0, 0, 0, 1, 1,
0.4320947, 0.2508949, 1.380505, 0, 0, 0, 1, 1,
0.4366606, 0.5957404, 1.119301, 1, 1, 1, 1, 1,
0.4377176, -0.3478125, 1.461043, 1, 1, 1, 1, 1,
0.4445779, -1.487438, 4.631734, 1, 1, 1, 1, 1,
0.4463743, 0.1938613, 2.314986, 1, 1, 1, 1, 1,
0.4514512, -1.120766, 3.517247, 1, 1, 1, 1, 1,
0.4545074, 1.383939, 1.75321, 1, 1, 1, 1, 1,
0.4553088, -1.045197, 1.990743, 1, 1, 1, 1, 1,
0.4571801, 0.5110604, 0.1799558, 1, 1, 1, 1, 1,
0.4700222, -0.3982948, 2.245742, 1, 1, 1, 1, 1,
0.4716204, -0.8954951, 2.667122, 1, 1, 1, 1, 1,
0.4722917, 0.7069401, 0.9013084, 1, 1, 1, 1, 1,
0.473243, 0.2873235, 0.5629804, 1, 1, 1, 1, 1,
0.4826221, 0.1609608, 2.954166, 1, 1, 1, 1, 1,
0.4845501, 0.4033689, 2.018932, 1, 1, 1, 1, 1,
0.4853258, 0.262685, 1.427456, 1, 1, 1, 1, 1,
0.4902499, 0.4731066, -0.114297, 0, 0, 1, 1, 1,
0.4906407, -1.020055, -0.5104689, 1, 0, 0, 1, 1,
0.497326, 0.2818373, 1.419823, 1, 0, 0, 1, 1,
0.5016859, 0.7609705, 1.121315, 1, 0, 0, 1, 1,
0.5022091, -0.3258727, 3.350049, 1, 0, 0, 1, 1,
0.5165448, -0.222813, 0.7319216, 1, 0, 0, 1, 1,
0.5209653, -0.4705357, 0.2437776, 0, 0, 0, 1, 1,
0.5262834, -1.395734, 2.421384, 0, 0, 0, 1, 1,
0.5266116, 0.2898775, 1.177044, 0, 0, 0, 1, 1,
0.5282354, -1.767175, 4.048209, 0, 0, 0, 1, 1,
0.5390273, -1.21853, 2.382811, 0, 0, 0, 1, 1,
0.5442634, -0.1153371, 1.427478, 0, 0, 0, 1, 1,
0.5456942, 1.258649, 1.389653, 0, 0, 0, 1, 1,
0.5457023, -1.152186, 2.525341, 1, 1, 1, 1, 1,
0.5469688, -0.877381, 1.071347, 1, 1, 1, 1, 1,
0.5486019, 0.3914716, 0.864666, 1, 1, 1, 1, 1,
0.548844, -1.049956, 3.018759, 1, 1, 1, 1, 1,
0.550563, 0.9230613, 2.727307, 1, 1, 1, 1, 1,
0.560248, 1.162607, 2.343695, 1, 1, 1, 1, 1,
0.567329, -0.8188753, 1.384045, 1, 1, 1, 1, 1,
0.5685807, -0.4756554, 0.7870193, 1, 1, 1, 1, 1,
0.5722957, 0.4854788, 0.5632082, 1, 1, 1, 1, 1,
0.5733923, -0.7160278, 1.746643, 1, 1, 1, 1, 1,
0.5746719, -0.396346, 2.889325, 1, 1, 1, 1, 1,
0.5786293, 0.7897684, -0.2140119, 1, 1, 1, 1, 1,
0.5786642, 0.6213065, -0.4892122, 1, 1, 1, 1, 1,
0.5824714, 0.3619026, 2.783123, 1, 1, 1, 1, 1,
0.5832315, -0.2545367, 1.07246, 1, 1, 1, 1, 1,
0.5879345, -0.4210484, 1.95657, 0, 0, 1, 1, 1,
0.5888478, -0.04328013, 0.04992701, 1, 0, 0, 1, 1,
0.5930202, 1.173381, 0.4435296, 1, 0, 0, 1, 1,
0.5933533, 1.236539, -1.022854, 1, 0, 0, 1, 1,
0.5995526, 1.198425, 1.887174, 1, 0, 0, 1, 1,
0.602295, 1.69931, 0.4490308, 1, 0, 0, 1, 1,
0.606205, -0.9254593, 1.595016, 0, 0, 0, 1, 1,
0.607093, 0.3849733, 1.381372, 0, 0, 0, 1, 1,
0.6084003, 0.3435474, 1.937793, 0, 0, 0, 1, 1,
0.6117838, 1.643296, 1.031096, 0, 0, 0, 1, 1,
0.6140657, 1.255056, 0.3575366, 0, 0, 0, 1, 1,
0.6284826, 0.05948173, 1.195622, 0, 0, 0, 1, 1,
0.6291628, 0.5065745, 0.09879323, 0, 0, 0, 1, 1,
0.6301583, -0.9541836, 3.818844, 1, 1, 1, 1, 1,
0.631264, -0.8560774, 2.463859, 1, 1, 1, 1, 1,
0.6347147, -0.6383044, 2.059452, 1, 1, 1, 1, 1,
0.6369687, 0.1582324, 0.2970697, 1, 1, 1, 1, 1,
0.637265, 0.6833314, 0.4308288, 1, 1, 1, 1, 1,
0.637962, 0.2867062, -0.07496068, 1, 1, 1, 1, 1,
0.6390128, 0.7647497, 0.9832633, 1, 1, 1, 1, 1,
0.6416119, -1.871054, 2.845505, 1, 1, 1, 1, 1,
0.6475071, 2.155589, 0.4830606, 1, 1, 1, 1, 1,
0.6477073, 0.804654, 1.013041, 1, 1, 1, 1, 1,
0.648137, -1.020944, 2.634105, 1, 1, 1, 1, 1,
0.6494452, -0.8213871, 2.617452, 1, 1, 1, 1, 1,
0.6511481, -0.02788424, 0.7553784, 1, 1, 1, 1, 1,
0.6639201, 0.01466282, 0.005329103, 1, 1, 1, 1, 1,
0.6670906, -1.206217, 3.709016, 1, 1, 1, 1, 1,
0.6723737, -0.4805527, 2.837022, 0, 0, 1, 1, 1,
0.673407, 0.7403277, -0.5448026, 1, 0, 0, 1, 1,
0.6735101, 0.163889, 3.750499, 1, 0, 0, 1, 1,
0.6782668, -0.6140913, 1.456693, 1, 0, 0, 1, 1,
0.6797843, 0.2560073, 0.5672777, 1, 0, 0, 1, 1,
0.6824263, -0.4713871, 2.57207, 1, 0, 0, 1, 1,
0.6882998, -0.9298376, 3.069321, 0, 0, 0, 1, 1,
0.6918995, 0.002340579, 1.872361, 0, 0, 0, 1, 1,
0.6922051, 2.558761, -0.5498968, 0, 0, 0, 1, 1,
0.6935945, 0.3160709, 0.5194937, 0, 0, 0, 1, 1,
0.6961082, 0.8678236, 0.537784, 0, 0, 0, 1, 1,
0.7003725, 2.26399, 0.4203869, 0, 0, 0, 1, 1,
0.702746, 0.5320575, -0.4848169, 0, 0, 0, 1, 1,
0.7101728, -0.4891822, 1.927224, 1, 1, 1, 1, 1,
0.7122709, -0.1000988, 1.877766, 1, 1, 1, 1, 1,
0.716758, 1.473886, 0.501886, 1, 1, 1, 1, 1,
0.7169942, 0.8800732, 0.4548537, 1, 1, 1, 1, 1,
0.7191663, 1.344769, -0.8894635, 1, 1, 1, 1, 1,
0.7209148, 1.478096, 2.592086, 1, 1, 1, 1, 1,
0.7221168, -0.4562623, 2.289783, 1, 1, 1, 1, 1,
0.7228896, 0.4941069, 1.330637, 1, 1, 1, 1, 1,
0.7268332, -0.2206394, 2.755838, 1, 1, 1, 1, 1,
0.7270502, -1.00907, 2.337098, 1, 1, 1, 1, 1,
0.7283809, 0.1272276, 1.619253, 1, 1, 1, 1, 1,
0.7338707, -1.155806, 2.575131, 1, 1, 1, 1, 1,
0.735997, 0.5833914, 1.223316, 1, 1, 1, 1, 1,
0.7391451, 2.197663, -0.2699485, 1, 1, 1, 1, 1,
0.743364, 1.726031, 0.3568692, 1, 1, 1, 1, 1,
0.7471488, -0.2039972, 1.706639, 0, 0, 1, 1, 1,
0.749367, 0.5694094, 0.7078574, 1, 0, 0, 1, 1,
0.7531075, 0.3583567, 1.205752, 1, 0, 0, 1, 1,
0.7566893, -0.1516726, 2.093636, 1, 0, 0, 1, 1,
0.7584222, 1.06692, 2.981848, 1, 0, 0, 1, 1,
0.7592129, -0.1719985, 3.079381, 1, 0, 0, 1, 1,
0.7689929, -1.060373, 3.158289, 0, 0, 0, 1, 1,
0.7713344, 0.656945, 0.2751414, 0, 0, 0, 1, 1,
0.7727117, -0.2041843, 3.33857, 0, 0, 0, 1, 1,
0.7796381, 0.2938874, 0.9086695, 0, 0, 0, 1, 1,
0.7819688, -1.912686, 2.746612, 0, 0, 0, 1, 1,
0.7827767, 0.5970312, 2.129681, 0, 0, 0, 1, 1,
0.7831461, 0.3809054, 1.191543, 0, 0, 0, 1, 1,
0.7847446, -0.9837826, 1.000794, 1, 1, 1, 1, 1,
0.7886897, -0.7828801, 2.971446, 1, 1, 1, 1, 1,
0.7938435, 1.000084, 1.716556, 1, 1, 1, 1, 1,
0.7950758, 0.7945225, -0.1258266, 1, 1, 1, 1, 1,
0.7954394, 1.007272, 0.4874732, 1, 1, 1, 1, 1,
0.7999353, 0.05153139, 3.094365, 1, 1, 1, 1, 1,
0.8062431, 0.4180701, 0.4459521, 1, 1, 1, 1, 1,
0.8091986, 2.397683, -0.8936772, 1, 1, 1, 1, 1,
0.8126419, -1.263571, 2.789491, 1, 1, 1, 1, 1,
0.8161882, 0.08925649, 1.095913, 1, 1, 1, 1, 1,
0.8227669, -0.4420489, 3.982956, 1, 1, 1, 1, 1,
0.8228693, -0.901044, 3.479039, 1, 1, 1, 1, 1,
0.8274033, -1.454446, 1.393427, 1, 1, 1, 1, 1,
0.8328015, 0.8782663, 0.6424522, 1, 1, 1, 1, 1,
0.8386403, -2.019703, 4.031456, 1, 1, 1, 1, 1,
0.8454154, 0.3273321, 1.238339, 0, 0, 1, 1, 1,
0.8456174, 0.3988978, 0.9348812, 1, 0, 0, 1, 1,
0.8484751, -0.547795, 2.604624, 1, 0, 0, 1, 1,
0.8494548, 1.501341, 1.22862, 1, 0, 0, 1, 1,
0.8568671, 0.07311147, 1.90176, 1, 0, 0, 1, 1,
0.8602512, 1.368026, 1.22219, 1, 0, 0, 1, 1,
0.8624743, 1.376857, 0.7934773, 0, 0, 0, 1, 1,
0.8629078, -0.3968453, 2.388544, 0, 0, 0, 1, 1,
0.8630187, -0.1814259, 2.027078, 0, 0, 0, 1, 1,
0.8732234, -1.330568, 2.577756, 0, 0, 0, 1, 1,
0.8778692, -0.1586401, 1.769338, 0, 0, 0, 1, 1,
0.8836892, -0.2345751, 1.786798, 0, 0, 0, 1, 1,
0.8877289, -0.1960048, 1.283673, 0, 0, 0, 1, 1,
0.888074, -1.671366, 2.360996, 1, 1, 1, 1, 1,
0.8940016, -0.6929106, 0.514518, 1, 1, 1, 1, 1,
0.8952339, -0.9664121, 3.981657, 1, 1, 1, 1, 1,
0.9021686, -0.9839582, 1.795139, 1, 1, 1, 1, 1,
0.9053336, -0.658531, 1.673581, 1, 1, 1, 1, 1,
0.9140747, 0.5846494, 2.02604, 1, 1, 1, 1, 1,
0.9188178, 0.5250375, -0.863517, 1, 1, 1, 1, 1,
0.9196911, 0.5079786, 0.4508674, 1, 1, 1, 1, 1,
0.9200576, 1.001706, 0.2726429, 1, 1, 1, 1, 1,
0.9211003, -0.834206, 3.00944, 1, 1, 1, 1, 1,
0.9222179, 0.562105, -0.3827384, 1, 1, 1, 1, 1,
0.9241483, 0.4989907, 1.630729, 1, 1, 1, 1, 1,
0.9413083, 0.1454001, -0.02991697, 1, 1, 1, 1, 1,
0.9520267, -0.1031902, 3.468483, 1, 1, 1, 1, 1,
0.9528987, 0.08196339, 1.178687, 1, 1, 1, 1, 1,
0.9631481, -0.7197856, 0.9577705, 0, 0, 1, 1, 1,
0.9640788, -1.690388, 2.739506, 1, 0, 0, 1, 1,
0.9718321, -0.4666977, 1.612336, 1, 0, 0, 1, 1,
0.9735495, 0.4381914, -1.022393, 1, 0, 0, 1, 1,
0.9736559, -1.532805, 4.354351, 1, 0, 0, 1, 1,
0.9763922, 1.233968, 1.40177, 1, 0, 0, 1, 1,
0.9889181, 1.538504, 0.5210496, 0, 0, 0, 1, 1,
0.9902852, 1.319388, 1.071902, 0, 0, 0, 1, 1,
0.991933, 0.07499006, -0.9885221, 0, 0, 0, 1, 1,
0.9931646, -0.1692531, 1.059054, 0, 0, 0, 1, 1,
0.9932121, -0.7580902, 2.925768, 0, 0, 0, 1, 1,
0.9949256, 1.008592, -0.4398038, 0, 0, 0, 1, 1,
1.00557, 1.58143, 0.5330162, 0, 0, 0, 1, 1,
1.012199, 0.5925216, 0.9117885, 1, 1, 1, 1, 1,
1.016877, -1.215764, 2.089352, 1, 1, 1, 1, 1,
1.023575, 0.7929775, 1.273064, 1, 1, 1, 1, 1,
1.027703, 1.352058, 1.885091, 1, 1, 1, 1, 1,
1.032688, -1.032284, 2.354509, 1, 1, 1, 1, 1,
1.04076, 0.4362072, 0.5942101, 1, 1, 1, 1, 1,
1.042807, 0.9835907, 2.711261, 1, 1, 1, 1, 1,
1.047403, -1.411892, 2.642668, 1, 1, 1, 1, 1,
1.050591, -0.619671, 2.70103, 1, 1, 1, 1, 1,
1.054013, 0.2575957, 2.228281, 1, 1, 1, 1, 1,
1.059342, -0.8877324, 0.9414079, 1, 1, 1, 1, 1,
1.060597, -0.9256971, 3.749349, 1, 1, 1, 1, 1,
1.060773, -0.1514091, 1.762233, 1, 1, 1, 1, 1,
1.062594, 2.06952, -0.6775224, 1, 1, 1, 1, 1,
1.065049, 1.049858, 1.770389, 1, 1, 1, 1, 1,
1.071489, 0.4795979, 1.571808, 0, 0, 1, 1, 1,
1.071904, 0.4885395, 1.902383, 1, 0, 0, 1, 1,
1.072202, 1.100225, 1.745885, 1, 0, 0, 1, 1,
1.072339, 0.189297, 3.236603, 1, 0, 0, 1, 1,
1.073027, -1.024223, 2.488897, 1, 0, 0, 1, 1,
1.077518, -0.005219444, 1.229201, 1, 0, 0, 1, 1,
1.077809, 1.263252, 1.055432, 0, 0, 0, 1, 1,
1.079556, 0.514605, 0.4594023, 0, 0, 0, 1, 1,
1.083132, 0.5899453, 0.2736062, 0, 0, 0, 1, 1,
1.096572, 0.1841561, 3.142838, 0, 0, 0, 1, 1,
1.104579, -0.493826, 0.2655139, 0, 0, 0, 1, 1,
1.105298, 0.7443939, -0.004504431, 0, 0, 0, 1, 1,
1.107053, 1.231507, 2.710513, 0, 0, 0, 1, 1,
1.10869, -1.573623, 2.586022, 1, 1, 1, 1, 1,
1.112024, -0.2873263, 1.111558, 1, 1, 1, 1, 1,
1.114666, -2.231954, -0.440344, 1, 1, 1, 1, 1,
1.11773, -0.6885763, 0.8423264, 1, 1, 1, 1, 1,
1.119967, 1.375702, 0.5766659, 1, 1, 1, 1, 1,
1.120119, 0.1022293, 1.315861, 1, 1, 1, 1, 1,
1.123729, -0.1077908, 1.83251, 1, 1, 1, 1, 1,
1.126507, 1.165007, 0.8609551, 1, 1, 1, 1, 1,
1.127582, -0.3778946, 1.961382, 1, 1, 1, 1, 1,
1.133359, 0.07172777, 0.404916, 1, 1, 1, 1, 1,
1.138475, 2.084096, -1.2693, 1, 1, 1, 1, 1,
1.142278, -0.5274252, 1.78431, 1, 1, 1, 1, 1,
1.150637, 0.2305255, -0.2162402, 1, 1, 1, 1, 1,
1.154559, 1.379397, 0.4819242, 1, 1, 1, 1, 1,
1.15665, 1.53364, 1.083463, 1, 1, 1, 1, 1,
1.161427, 0.6891529, 1.220808, 0, 0, 1, 1, 1,
1.162625, -1.147019, 1.318944, 1, 0, 0, 1, 1,
1.167796, -0.8957252, 2.141104, 1, 0, 0, 1, 1,
1.169014, -0.8404745, 0.8505041, 1, 0, 0, 1, 1,
1.169817, -0.7591045, 2.425164, 1, 0, 0, 1, 1,
1.172798, -0.7934163, 2.107702, 1, 0, 0, 1, 1,
1.174844, -0.168359, 4.275265, 0, 0, 0, 1, 1,
1.180594, 1.146501, 1.182477, 0, 0, 0, 1, 1,
1.189551, 1.66579, 0.3447615, 0, 0, 0, 1, 1,
1.194921, -0.2715554, 1.749459, 0, 0, 0, 1, 1,
1.200109, 0.4230964, 2.469939, 0, 0, 0, 1, 1,
1.204117, -0.985463, 0.5624102, 0, 0, 0, 1, 1,
1.218518, 0.1030648, 1.347639, 0, 0, 0, 1, 1,
1.218884, -0.920718, 2.483007, 1, 1, 1, 1, 1,
1.218958, 0.3388209, 0.2660857, 1, 1, 1, 1, 1,
1.219268, -0.8456071, 3.659136, 1, 1, 1, 1, 1,
1.221151, 0.07309759, 0.6097046, 1, 1, 1, 1, 1,
1.222467, 0.6091064, 1.953256, 1, 1, 1, 1, 1,
1.224319, -0.06078388, 3.369953, 1, 1, 1, 1, 1,
1.231687, -1.877344, 4.069345, 1, 1, 1, 1, 1,
1.232702, 1.191723, -0.4091348, 1, 1, 1, 1, 1,
1.235181, 0.3968842, 1.139811, 1, 1, 1, 1, 1,
1.239109, -1.668021, 2.050047, 1, 1, 1, 1, 1,
1.255714, 0.5357127, 1.702976, 1, 1, 1, 1, 1,
1.26703, 1.058348, 0.02284447, 1, 1, 1, 1, 1,
1.270427, 1.163914, 0.6736754, 1, 1, 1, 1, 1,
1.271023, -0.4532627, 2.615398, 1, 1, 1, 1, 1,
1.27795, 0.7668165, 1.889615, 1, 1, 1, 1, 1,
1.293645, 1.179698, 1.164247, 0, 0, 1, 1, 1,
1.301925, 1.647577, -0.6513973, 1, 0, 0, 1, 1,
1.314087, 1.885587, -0.4017566, 1, 0, 0, 1, 1,
1.318197, 0.1577447, 1.746548, 1, 0, 0, 1, 1,
1.323811, 0.03570968, 1.20804, 1, 0, 0, 1, 1,
1.332786, 0.8157732, 1.083342, 1, 0, 0, 1, 1,
1.34064, -0.3874875, 2.780737, 0, 0, 0, 1, 1,
1.34735, 0.1289826, 1.176812, 0, 0, 0, 1, 1,
1.348665, 0.5355226, 0.7058396, 0, 0, 0, 1, 1,
1.354397, 0.418618, 0.2047877, 0, 0, 0, 1, 1,
1.359, -0.30134, 1.905602, 0, 0, 0, 1, 1,
1.359277, -1.304651, 1.94137, 0, 0, 0, 1, 1,
1.364794, -0.2823405, 2.713884, 0, 0, 0, 1, 1,
1.365166, 0.5648436, 1.016741, 1, 1, 1, 1, 1,
1.368189, 2.089942, 1.905931, 1, 1, 1, 1, 1,
1.368431, 0.024744, 3.868431, 1, 1, 1, 1, 1,
1.374501, -0.04523321, 1.720908, 1, 1, 1, 1, 1,
1.376637, -1.989332, 3.840392, 1, 1, 1, 1, 1,
1.386551, -0.5915245, 0.8969101, 1, 1, 1, 1, 1,
1.39116, -1.505195, 2.632168, 1, 1, 1, 1, 1,
1.417302, -0.3784191, 2.352286, 1, 1, 1, 1, 1,
1.422871, 0.3752899, 2.843107, 1, 1, 1, 1, 1,
1.429669, 0.2439756, 0.7421271, 1, 1, 1, 1, 1,
1.431269, 0.6218392, 3.148957, 1, 1, 1, 1, 1,
1.43373, -0.06585374, 2.599072, 1, 1, 1, 1, 1,
1.435963, 1.430098, 0.6899083, 1, 1, 1, 1, 1,
1.43628, 1.116492, 0.6667953, 1, 1, 1, 1, 1,
1.43804, 0.5254453, 1.352652, 1, 1, 1, 1, 1,
1.446099, -0.7078617, 3.311287, 0, 0, 1, 1, 1,
1.44688, 0.1321051, 1.178368, 1, 0, 0, 1, 1,
1.45221, 1.093554, 1.436525, 1, 0, 0, 1, 1,
1.453554, 1.174719, -1.018872, 1, 0, 0, 1, 1,
1.454528, -0.2656824, 2.528504, 1, 0, 0, 1, 1,
1.455556, 0.2490938, 1.5149, 1, 0, 0, 1, 1,
1.458579, 0.5242025, 0.718767, 0, 0, 0, 1, 1,
1.463809, -0.8256445, 1.093959, 0, 0, 0, 1, 1,
1.465856, -0.4912944, 2.561871, 0, 0, 0, 1, 1,
1.470006, -0.201679, 1.636267, 0, 0, 0, 1, 1,
1.479136, 0.3609893, -0.1473288, 0, 0, 0, 1, 1,
1.480613, 0.1891136, 2.393903, 0, 0, 0, 1, 1,
1.482657, -0.410788, 2.982052, 0, 0, 0, 1, 1,
1.483401, -1.555228, 2.63595, 1, 1, 1, 1, 1,
1.485649, -0.6263616, 1.467492, 1, 1, 1, 1, 1,
1.503152, 0.6238158, 0.87148, 1, 1, 1, 1, 1,
1.510394, 1.871998, -0.6521158, 1, 1, 1, 1, 1,
1.510627, 0.3174955, 0.08505759, 1, 1, 1, 1, 1,
1.524845, 1.283077, 1.866076, 1, 1, 1, 1, 1,
1.525916, -0.594511, 2.24395, 1, 1, 1, 1, 1,
1.53414, 1.224713, 1.951065, 1, 1, 1, 1, 1,
1.534829, 0.2875374, 0.3077368, 1, 1, 1, 1, 1,
1.540486, 2.10578, 0.9352262, 1, 1, 1, 1, 1,
1.543098, 1.635702, 0.6486646, 1, 1, 1, 1, 1,
1.573999, -1.719877, 4.072541, 1, 1, 1, 1, 1,
1.576404, 1.697246, 1.83455, 1, 1, 1, 1, 1,
1.584062, -0.0478821, 2.248152, 1, 1, 1, 1, 1,
1.596659, 1.329961, -1.55652, 1, 1, 1, 1, 1,
1.611869, 0.5380355, 1.844349, 0, 0, 1, 1, 1,
1.61534, 0.3537963, 2.398007, 1, 0, 0, 1, 1,
1.643138, -1.568696, 2.764158, 1, 0, 0, 1, 1,
1.64805, -0.4483357, 2.158677, 1, 0, 0, 1, 1,
1.654734, 1.542601, 0.7582271, 1, 0, 0, 1, 1,
1.667437, -0.4841211, 1.453795, 1, 0, 0, 1, 1,
1.66847, 1.542365, 1.401438, 0, 0, 0, 1, 1,
1.674945, 0.6977353, 0.3299946, 0, 0, 0, 1, 1,
1.676031, 1.80833, 1.183786, 0, 0, 0, 1, 1,
1.679113, 0.6343936, 1.611532, 0, 0, 0, 1, 1,
1.687826, 0.7894197, 0.8647336, 0, 0, 0, 1, 1,
1.697067, 0.7781219, 0.3820123, 0, 0, 0, 1, 1,
1.717385, 1.785487, -0.8782001, 0, 0, 0, 1, 1,
1.720623, -0.4516986, 1.805706, 1, 1, 1, 1, 1,
1.730597, -0.825183, 1.617884, 1, 1, 1, 1, 1,
1.737131, 0.9773871, 0.184333, 1, 1, 1, 1, 1,
1.740209, -0.4475654, 0.5788482, 1, 1, 1, 1, 1,
1.757406, 1.094193, -0.1508116, 1, 1, 1, 1, 1,
1.770308, 1.788735, 0.7967803, 1, 1, 1, 1, 1,
1.791448, -0.4812577, 1.116745, 1, 1, 1, 1, 1,
1.805339, 0.5517567, -0.1334265, 1, 1, 1, 1, 1,
1.806436, -0.06154784, 1.949545, 1, 1, 1, 1, 1,
1.858491, 0.8491109, -0.7537928, 1, 1, 1, 1, 1,
1.878956, -0.6997088, 3.299685, 1, 1, 1, 1, 1,
1.879318, -0.7873849, 2.364773, 1, 1, 1, 1, 1,
1.887998, 0.005663274, 1.532294, 1, 1, 1, 1, 1,
1.949025, 0.23476, 2.139829, 1, 1, 1, 1, 1,
1.961711, 0.3087485, 0.7852212, 1, 1, 1, 1, 1,
1.973619, 0.5721449, 1.961024, 0, 0, 1, 1, 1,
1.97363, 1.743157, 1.944073, 1, 0, 0, 1, 1,
1.998656, 1.71478, 3.777346, 1, 0, 0, 1, 1,
2.01289, -0.8182751, 1.155094, 1, 0, 0, 1, 1,
2.016902, 0.9540207, 1.586553, 1, 0, 0, 1, 1,
2.029251, -1.164467, 1.398741, 1, 0, 0, 1, 1,
2.035977, -2.025607, 4.140629, 0, 0, 0, 1, 1,
2.057752, 0.1390641, 0.900556, 0, 0, 0, 1, 1,
2.066905, 0.5879213, 2.276658, 0, 0, 0, 1, 1,
2.09034, -2.329913, 3.370722, 0, 0, 0, 1, 1,
2.165068, 0.7207956, 2.381053, 0, 0, 0, 1, 1,
2.1957, 0.9314463, 1.40669, 0, 0, 0, 1, 1,
2.320139, -1.533866, 3.43781, 0, 0, 0, 1, 1,
2.327149, -0.716746, 2.00401, 1, 1, 1, 1, 1,
2.338248, -0.1748817, 1.514473, 1, 1, 1, 1, 1,
2.507056, -1.151597, 1.969692, 1, 1, 1, 1, 1,
2.594054, 0.5329553, 1.52129, 1, 1, 1, 1, 1,
2.618517, -2.390693, 2.686961, 1, 1, 1, 1, 1,
2.639107, -0.7789969, 1.452541, 1, 1, 1, 1, 1,
3.211838, 0.09881636, 4.08768, 1, 1, 1, 1, 1
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
var radius = 9.684127;
var distance = 34.01509;
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
mvMatrix.translate( 0.05270648, -0.2594364, -0.1165559 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.01509);
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