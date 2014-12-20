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
-4.030996, -0.3409835, -0.7890729, 1, 0, 0, 1,
-3.502424, -0.9683976, -2.741655, 1, 0.007843138, 0, 1,
-2.950928, -3.320648, -3.066456, 1, 0.01176471, 0, 1,
-2.750677, 0.03535193, 0.3342182, 1, 0.01960784, 0, 1,
-2.727597, 0.6732866, -1.163827, 1, 0.02352941, 0, 1,
-2.655744, -0.3556632, -3.18456, 1, 0.03137255, 0, 1,
-2.530522, -1.619183, -2.472939, 1, 0.03529412, 0, 1,
-2.487437, -1.404661, -1.278372, 1, 0.04313726, 0, 1,
-2.3356, -0.9367434, -3.140984, 1, 0.04705882, 0, 1,
-2.270974, -0.07619537, -1.735079, 1, 0.05490196, 0, 1,
-2.26978, 0.4853888, -1.284697, 1, 0.05882353, 0, 1,
-2.242325, 0.6834086, -1.711047, 1, 0.06666667, 0, 1,
-2.226133, -1.826385, -4.486001, 1, 0.07058824, 0, 1,
-2.216885, -0.3742589, -0.5418201, 1, 0.07843138, 0, 1,
-2.215556, 1.15823, -2.439878, 1, 0.08235294, 0, 1,
-2.156342, -0.2909733, -3.718014, 1, 0.09019608, 0, 1,
-2.151467, 0.07954936, -2.523601, 1, 0.09411765, 0, 1,
-2.137519, 1.467875, -1.393754, 1, 0.1019608, 0, 1,
-2.105775, -0.1148914, -1.373333, 1, 0.1098039, 0, 1,
-2.098399, 0.9251779, -1.098574, 1, 0.1137255, 0, 1,
-2.050343, 0.9505486, -2.136449, 1, 0.1215686, 0, 1,
-2.025669, -2.00783, -2.623013, 1, 0.1254902, 0, 1,
-2.007638, 1.257309, -1.716221, 1, 0.1333333, 0, 1,
-1.958778, 0.7080224, -0.4502434, 1, 0.1372549, 0, 1,
-1.925159, -0.3393045, -1.431378, 1, 0.145098, 0, 1,
-1.899986, 1.945991, -1.836053, 1, 0.1490196, 0, 1,
-1.899026, -0.481143, -1.555409, 1, 0.1568628, 0, 1,
-1.781382, 0.8168078, -1.833174, 1, 0.1607843, 0, 1,
-1.753618, 0.0733102, -1.635072, 1, 0.1686275, 0, 1,
-1.745603, 0.11759, -0.9991432, 1, 0.172549, 0, 1,
-1.697251, -0.5138619, -1.722879, 1, 0.1803922, 0, 1,
-1.68732, 0.4528756, -1.078152, 1, 0.1843137, 0, 1,
-1.68675, -1.040822, -3.92703, 1, 0.1921569, 0, 1,
-1.686084, 0.7875332, -1.89249, 1, 0.1960784, 0, 1,
-1.663825, -0.1376348, -1.021619, 1, 0.2039216, 0, 1,
-1.661987, 0.2484282, -2.814484, 1, 0.2117647, 0, 1,
-1.645827, 0.2277564, -1.397351, 1, 0.2156863, 0, 1,
-1.642355, 2.107523, -0.05224667, 1, 0.2235294, 0, 1,
-1.641088, 0.1688376, -1.848249, 1, 0.227451, 0, 1,
-1.636136, -0.4062743, -0.5218921, 1, 0.2352941, 0, 1,
-1.615504, -0.965356, -2.239245, 1, 0.2392157, 0, 1,
-1.600135, 0.8902394, -0.447757, 1, 0.2470588, 0, 1,
-1.597367, 0.4531652, -0.5113453, 1, 0.2509804, 0, 1,
-1.593959, -0.1845171, -2.119383, 1, 0.2588235, 0, 1,
-1.582445, 0.7470409, -1.387681, 1, 0.2627451, 0, 1,
-1.576265, 0.732429, -1.845839, 1, 0.2705882, 0, 1,
-1.571206, -0.6831152, -0.2703016, 1, 0.2745098, 0, 1,
-1.569741, 0.9193712, -0.1223477, 1, 0.282353, 0, 1,
-1.552896, 2.020166, -0.01358485, 1, 0.2862745, 0, 1,
-1.537534, 2.356201, -1.869404, 1, 0.2941177, 0, 1,
-1.534461, -0.5086089, -2.514241, 1, 0.3019608, 0, 1,
-1.525043, -0.6889554, -0.5948005, 1, 0.3058824, 0, 1,
-1.516826, 2.226871, -1.664468, 1, 0.3137255, 0, 1,
-1.505134, 0.1100144, -3.440817, 1, 0.3176471, 0, 1,
-1.500576, -0.1681918, -1.169393, 1, 0.3254902, 0, 1,
-1.488368, -0.3582503, -1.608193, 1, 0.3294118, 0, 1,
-1.487669, -0.822011, -2.000818, 1, 0.3372549, 0, 1,
-1.484961, -0.003468936, -1.568854, 1, 0.3411765, 0, 1,
-1.482889, 0.3590449, -0.5095998, 1, 0.3490196, 0, 1,
-1.479387, 0.7510256, -0.2872896, 1, 0.3529412, 0, 1,
-1.463997, -0.3514414, -2.297537, 1, 0.3607843, 0, 1,
-1.457606, 0.3560117, -1.563714, 1, 0.3647059, 0, 1,
-1.457053, -0.6395784, -2.06555, 1, 0.372549, 0, 1,
-1.453777, -0.1370424, -0.4118217, 1, 0.3764706, 0, 1,
-1.446558, 1.51388, -1.779358, 1, 0.3843137, 0, 1,
-1.445422, 0.115571, -0.3427676, 1, 0.3882353, 0, 1,
-1.441717, 0.05787157, -2.854199, 1, 0.3960784, 0, 1,
-1.439039, 0.2724262, -2.827379, 1, 0.4039216, 0, 1,
-1.435535, 0.1607693, -3.991765, 1, 0.4078431, 0, 1,
-1.422255, 0.8241049, -1.770658, 1, 0.4156863, 0, 1,
-1.421105, 0.4188922, -2.412727, 1, 0.4196078, 0, 1,
-1.41471, -0.003626564, -1.451424, 1, 0.427451, 0, 1,
-1.414051, 0.8417531, -0.8933637, 1, 0.4313726, 0, 1,
-1.413973, -1.556901, -1.870063, 1, 0.4392157, 0, 1,
-1.407309, -0.7030988, -0.4082962, 1, 0.4431373, 0, 1,
-1.40659, -0.1953823, -3.031068, 1, 0.4509804, 0, 1,
-1.404117, 1.194197, -1.985963, 1, 0.454902, 0, 1,
-1.40265, 0.6894965, -2.055952, 1, 0.4627451, 0, 1,
-1.401542, 0.8732907, -1.528527, 1, 0.4666667, 0, 1,
-1.400661, -0.05587927, -1.654414, 1, 0.4745098, 0, 1,
-1.399912, -1.222774, -3.411384, 1, 0.4784314, 0, 1,
-1.388073, -0.7005863, -0.8648788, 1, 0.4862745, 0, 1,
-1.362403, -0.9454215, -2.135915, 1, 0.4901961, 0, 1,
-1.353936, 0.5023008, -2.33885, 1, 0.4980392, 0, 1,
-1.353768, -0.03772406, -2.34552, 1, 0.5058824, 0, 1,
-1.335629, 0.5450082, -1.431593, 1, 0.509804, 0, 1,
-1.334983, 0.2125931, -0.446337, 1, 0.5176471, 0, 1,
-1.33483, -1.77891, -5.062099, 1, 0.5215687, 0, 1,
-1.330017, 0.5223408, 0.5882211, 1, 0.5294118, 0, 1,
-1.328295, 0.3659717, -1.75195, 1, 0.5333334, 0, 1,
-1.326722, 0.3543689, -1.703761, 1, 0.5411765, 0, 1,
-1.325861, -1.836192, -2.753002, 1, 0.5450981, 0, 1,
-1.321859, -0.665752, -1.179967, 1, 0.5529412, 0, 1,
-1.312711, 0.125357, -2.130583, 1, 0.5568628, 0, 1,
-1.311236, 0.3303949, -1.038059, 1, 0.5647059, 0, 1,
-1.309104, -0.8722782, -2.867306, 1, 0.5686275, 0, 1,
-1.303512, -1.307109, -1.573159, 1, 0.5764706, 0, 1,
-1.294233, 0.2518793, -1.414404, 1, 0.5803922, 0, 1,
-1.280576, 0.7791146, 0.6524748, 1, 0.5882353, 0, 1,
-1.278396, 0.2570584, -1.023236, 1, 0.5921569, 0, 1,
-1.274389, 1.079595, -1.55012, 1, 0.6, 0, 1,
-1.265098, 1.128332, 0.837351, 1, 0.6078432, 0, 1,
-1.25484, 0.09395693, -0.4713301, 1, 0.6117647, 0, 1,
-1.245472, -0.452853, -1.163463, 1, 0.6196079, 0, 1,
-1.239007, -0.3091932, -0.6609524, 1, 0.6235294, 0, 1,
-1.224152, 0.8279192, -0.7073923, 1, 0.6313726, 0, 1,
-1.219286, -0.07304379, -0.653764, 1, 0.6352941, 0, 1,
-1.203065, -0.9810752, -1.033199, 1, 0.6431373, 0, 1,
-1.193052, 0.3627818, -3.024822, 1, 0.6470588, 0, 1,
-1.182647, -0.3212948, -1.617481, 1, 0.654902, 0, 1,
-1.177905, -2.389864, -3.664314, 1, 0.6588235, 0, 1,
-1.175725, -0.7754201, -3.677207, 1, 0.6666667, 0, 1,
-1.172619, -0.476666, -1.967916, 1, 0.6705883, 0, 1,
-1.172407, 0.8222193, -0.9862502, 1, 0.6784314, 0, 1,
-1.162624, 0.2871095, -0.2784108, 1, 0.682353, 0, 1,
-1.159392, -0.1713979, -2.284099, 1, 0.6901961, 0, 1,
-1.157061, 0.9268271, -0.8822963, 1, 0.6941177, 0, 1,
-1.155606, -0.4338903, -0.9406556, 1, 0.7019608, 0, 1,
-1.146741, 0.9049379, -0.3551348, 1, 0.7098039, 0, 1,
-1.141549, -0.06491805, -3.292301, 1, 0.7137255, 0, 1,
-1.133889, 0.2999496, 0.2371531, 1, 0.7215686, 0, 1,
-1.129584, 1.488025, -1.025407, 1, 0.7254902, 0, 1,
-1.122628, 0.4044075, -2.719353, 1, 0.7333333, 0, 1,
-1.119701, -0.3208156, -2.349039, 1, 0.7372549, 0, 1,
-1.117811, 0.5840824, -1.949115, 1, 0.7450981, 0, 1,
-1.116648, -1.095886, -2.413458, 1, 0.7490196, 0, 1,
-1.110149, -0.2126357, -1.68566, 1, 0.7568628, 0, 1,
-1.103483, 0.3461125, -1.083922, 1, 0.7607843, 0, 1,
-1.098523, -0.9295164, -1.063344, 1, 0.7686275, 0, 1,
-1.094606, 0.5248607, -2.030348, 1, 0.772549, 0, 1,
-1.085222, 0.9823273, -1.795747, 1, 0.7803922, 0, 1,
-1.079172, -0.03207264, -1.396458, 1, 0.7843137, 0, 1,
-1.071976, 0.4266604, 0.6300873, 1, 0.7921569, 0, 1,
-1.0653, -1.101335, -2.512865, 1, 0.7960784, 0, 1,
-1.058331, 0.649623, -3.532565, 1, 0.8039216, 0, 1,
-1.05518, -1.361273, -0.8210809, 1, 0.8117647, 0, 1,
-1.04612, 0.05486398, -1.134741, 1, 0.8156863, 0, 1,
-1.045482, -1.210778, -3.24727, 1, 0.8235294, 0, 1,
-1.042466, -0.4053122, -3.293658, 1, 0.827451, 0, 1,
-1.040996, 0.4735304, -1.879359, 1, 0.8352941, 0, 1,
-1.026972, -2.168745, -1.310668, 1, 0.8392157, 0, 1,
-1.01424, 0.6260713, -1.57548, 1, 0.8470588, 0, 1,
-1.012226, -0.2941645, -1.661872, 1, 0.8509804, 0, 1,
-1.011999, -1.124121, -1.211303, 1, 0.8588235, 0, 1,
-1.004355, -0.5048399, -0.5442497, 1, 0.8627451, 0, 1,
-0.9986463, -2.508119, -2.613141, 1, 0.8705882, 0, 1,
-0.9915349, 0.1296033, -0.5835083, 1, 0.8745098, 0, 1,
-0.9829221, -0.6380424, -1.455424, 1, 0.8823529, 0, 1,
-0.9824972, 0.3666657, -1.755136, 1, 0.8862745, 0, 1,
-0.9694295, 1.50735, 0.3488507, 1, 0.8941177, 0, 1,
-0.9678821, 0.6228232, -0.7770169, 1, 0.8980392, 0, 1,
-0.9666966, 0.2624263, -1.08333, 1, 0.9058824, 0, 1,
-0.9657217, -0.5182794, -2.373161, 1, 0.9137255, 0, 1,
-0.9505371, 0.04193342, -0.6930659, 1, 0.9176471, 0, 1,
-0.9495229, -1.06804, -2.129192, 1, 0.9254902, 0, 1,
-0.9439051, 0.4395961, -1.743464, 1, 0.9294118, 0, 1,
-0.941803, -1.709777, -1.296138, 1, 0.9372549, 0, 1,
-0.9401085, -0.3177598, -2.889737, 1, 0.9411765, 0, 1,
-0.9286978, 0.1458799, -1.255855, 1, 0.9490196, 0, 1,
-0.9264137, 0.8632585, -0.9598929, 1, 0.9529412, 0, 1,
-0.9233475, -0.2782318, -2.977853, 1, 0.9607843, 0, 1,
-0.9194291, -0.8897046, -3.697819, 1, 0.9647059, 0, 1,
-0.9153777, -0.1543805, -2.223267, 1, 0.972549, 0, 1,
-0.913304, 0.2395599, -2.941714, 1, 0.9764706, 0, 1,
-0.9041275, 0.1997723, -1.294671, 1, 0.9843137, 0, 1,
-0.9008451, -0.9275533, -2.955039, 1, 0.9882353, 0, 1,
-0.8973774, -2.593152, -3.013085, 1, 0.9960784, 0, 1,
-0.8933441, 0.6553473, -0.7384654, 0.9960784, 1, 0, 1,
-0.8884044, 0.6146712, 0.4075701, 0.9921569, 1, 0, 1,
-0.8870005, -1.56676, -3.669441, 0.9843137, 1, 0, 1,
-0.8806255, -0.1937383, 0.207481, 0.9803922, 1, 0, 1,
-0.8756379, 1.221055, -0.302652, 0.972549, 1, 0, 1,
-0.87508, -0.430303, -1.578406, 0.9686275, 1, 0, 1,
-0.8720396, 1.525837, 1.406899, 0.9607843, 1, 0, 1,
-0.8696013, 0.4301477, -1.985352, 0.9568627, 1, 0, 1,
-0.8690508, -0.4234692, -2.547681, 0.9490196, 1, 0, 1,
-0.8659935, 0.7727411, 0.4878377, 0.945098, 1, 0, 1,
-0.8621351, 1.790761, -1.122244, 0.9372549, 1, 0, 1,
-0.862123, -0.3946377, -5.19091, 0.9333333, 1, 0, 1,
-0.8567231, 0.2127664, -0.1389532, 0.9254902, 1, 0, 1,
-0.8413747, -2.060843, -3.634448, 0.9215686, 1, 0, 1,
-0.8396994, 0.2672613, -2.981574, 0.9137255, 1, 0, 1,
-0.8362036, 0.1475168, -1.746696, 0.9098039, 1, 0, 1,
-0.8344865, 0.3364444, -0.3591185, 0.9019608, 1, 0, 1,
-0.8328602, -0.9911227, -2.435108, 0.8941177, 1, 0, 1,
-0.832471, -0.139158, -2.195266, 0.8901961, 1, 0, 1,
-0.8282338, 0.721024, 0.03703434, 0.8823529, 1, 0, 1,
-0.822253, 0.4501715, -2.003278, 0.8784314, 1, 0, 1,
-0.819298, 2.599989, 0.5946651, 0.8705882, 1, 0, 1,
-0.8182771, -1.085682, -1.422785, 0.8666667, 1, 0, 1,
-0.8156703, -0.4475257, -2.635849, 0.8588235, 1, 0, 1,
-0.8156295, -0.32649, -2.735344, 0.854902, 1, 0, 1,
-0.8135027, 1.608561, -1.782848, 0.8470588, 1, 0, 1,
-0.8127004, 0.9902341, 0.1299746, 0.8431373, 1, 0, 1,
-0.8112847, -1.07693, -0.8554458, 0.8352941, 1, 0, 1,
-0.8112556, 0.1313187, -2.009932, 0.8313726, 1, 0, 1,
-0.810876, 0.03437954, -2.165237, 0.8235294, 1, 0, 1,
-0.8101504, -1.342846, -1.960616, 0.8196079, 1, 0, 1,
-0.8076874, -0.4000419, -1.88365, 0.8117647, 1, 0, 1,
-0.8063459, -0.5318295, -0.4862271, 0.8078431, 1, 0, 1,
-0.8033363, -0.5592087, -4.938798, 0.8, 1, 0, 1,
-0.8010564, -0.4796996, -3.115398, 0.7921569, 1, 0, 1,
-0.8000465, -2.542349, -3.910695, 0.7882353, 1, 0, 1,
-0.7949708, 0.4023888, -2.278296, 0.7803922, 1, 0, 1,
-0.7936253, 1.304999, -2.017669, 0.7764706, 1, 0, 1,
-0.7827384, 0.7233582, 1.113104, 0.7686275, 1, 0, 1,
-0.7812592, -0.004377058, -1.202501, 0.7647059, 1, 0, 1,
-0.7799082, -0.2062269, -0.676928, 0.7568628, 1, 0, 1,
-0.7734571, -0.4929908, -3.800045, 0.7529412, 1, 0, 1,
-0.7679238, 0.7305417, -2.901736, 0.7450981, 1, 0, 1,
-0.7648192, -0.5579, -2.519727, 0.7411765, 1, 0, 1,
-0.763474, 1.211231, -1.869344, 0.7333333, 1, 0, 1,
-0.7601803, 0.04349764, -1.227614, 0.7294118, 1, 0, 1,
-0.7588299, -1.119144, -2.611006, 0.7215686, 1, 0, 1,
-0.7577138, -1.024149, -1.650011, 0.7176471, 1, 0, 1,
-0.7565298, -1.476097, -2.048782, 0.7098039, 1, 0, 1,
-0.7557191, 0.002537164, -2.104136, 0.7058824, 1, 0, 1,
-0.7510064, -0.1316545, -3.211427, 0.6980392, 1, 0, 1,
-0.7499204, 1.043186, -1.031752, 0.6901961, 1, 0, 1,
-0.7492271, -0.2090195, -1.48104, 0.6862745, 1, 0, 1,
-0.7486802, -0.7234042, -3.605389, 0.6784314, 1, 0, 1,
-0.7419612, 0.04888525, -4.008187, 0.6745098, 1, 0, 1,
-0.7405909, 0.3980126, -0.5754722, 0.6666667, 1, 0, 1,
-0.7273636, 0.7922184, -0.04524201, 0.6627451, 1, 0, 1,
-0.7260519, -0.2462658, -3.822008, 0.654902, 1, 0, 1,
-0.7236731, -0.4665547, -3.393234, 0.6509804, 1, 0, 1,
-0.713978, -1.584253, -3.370608, 0.6431373, 1, 0, 1,
-0.7125183, -0.5391994, -3.299476, 0.6392157, 1, 0, 1,
-0.7098327, -0.177585, -0.002556752, 0.6313726, 1, 0, 1,
-0.7039319, -0.1124006, -2.701721, 0.627451, 1, 0, 1,
-0.7030806, -1.046214, -1.72643, 0.6196079, 1, 0, 1,
-0.6997977, 0.1991454, -0.4263791, 0.6156863, 1, 0, 1,
-0.697476, 0.3317097, -1.058244, 0.6078432, 1, 0, 1,
-0.6956984, -0.01551771, -2.429161, 0.6039216, 1, 0, 1,
-0.6947722, 0.3936431, -0.03529584, 0.5960785, 1, 0, 1,
-0.6892147, 0.6616479, -0.8972471, 0.5882353, 1, 0, 1,
-0.6849727, 1.290067, 0.0253957, 0.5843138, 1, 0, 1,
-0.6847012, 0.147449, -1.792692, 0.5764706, 1, 0, 1,
-0.6841298, -0.06835533, -0.2932269, 0.572549, 1, 0, 1,
-0.6826867, 0.2716175, -2.914875, 0.5647059, 1, 0, 1,
-0.6824731, -0.9002188, -1.4342, 0.5607843, 1, 0, 1,
-0.6789852, 0.0024738, -2.068069, 0.5529412, 1, 0, 1,
-0.6772046, -1.349007, -3.326311, 0.5490196, 1, 0, 1,
-0.6771621, -0.5623386, -1.311727, 0.5411765, 1, 0, 1,
-0.6764137, 1.480606, 0.6065527, 0.5372549, 1, 0, 1,
-0.6747974, 0.08379672, -1.894331, 0.5294118, 1, 0, 1,
-0.6725085, -0.2043077, -2.11583, 0.5254902, 1, 0, 1,
-0.6627297, 1.655353, 1.37079, 0.5176471, 1, 0, 1,
-0.660763, 0.760233, 0.5996151, 0.5137255, 1, 0, 1,
-0.6602103, 0.8369157, -0.4160536, 0.5058824, 1, 0, 1,
-0.6598591, -2.430444, -4.096934, 0.5019608, 1, 0, 1,
-0.6592435, 0.2062901, -1.828671, 0.4941176, 1, 0, 1,
-0.6522369, 0.647542, -0.3058189, 0.4862745, 1, 0, 1,
-0.652204, 0.976912, -0.08852795, 0.4823529, 1, 0, 1,
-0.649797, -0.4922263, -2.686465, 0.4745098, 1, 0, 1,
-0.6486176, 1.262362, -1.188997, 0.4705882, 1, 0, 1,
-0.6454073, 0.09707893, -1.016487, 0.4627451, 1, 0, 1,
-0.6421531, 1.747559, -0.9570857, 0.4588235, 1, 0, 1,
-0.6343658, 1.073444, -0.5349143, 0.4509804, 1, 0, 1,
-0.6340858, 1.397128, -0.6358254, 0.4470588, 1, 0, 1,
-0.6338845, -0.8492831, -2.722369, 0.4392157, 1, 0, 1,
-0.6283405, -1.865899, -2.941456, 0.4352941, 1, 0, 1,
-0.6281008, -0.5969657, -4.995116, 0.427451, 1, 0, 1,
-0.6262345, 1.039107, -0.6017212, 0.4235294, 1, 0, 1,
-0.6261155, 0.316718, -0.797036, 0.4156863, 1, 0, 1,
-0.6253831, 0.03032195, -0.8968929, 0.4117647, 1, 0, 1,
-0.6234335, -0.3871877, -2.47247, 0.4039216, 1, 0, 1,
-0.61617, -0.6320215, -1.661379, 0.3960784, 1, 0, 1,
-0.6149271, 1.425031, -0.7495093, 0.3921569, 1, 0, 1,
-0.6137128, 0.7427768, -1.671653, 0.3843137, 1, 0, 1,
-0.6105971, -1.202709, -3.212713, 0.3803922, 1, 0, 1,
-0.6103041, -1.557769, -3.122384, 0.372549, 1, 0, 1,
-0.6092558, 1.684716, -0.8386602, 0.3686275, 1, 0, 1,
-0.6086181, 0.3644588, 0.003529989, 0.3607843, 1, 0, 1,
-0.6065899, 2.062245, 0.2888979, 0.3568628, 1, 0, 1,
-0.6051551, 1.192874, -0.9698083, 0.3490196, 1, 0, 1,
-0.6000568, -0.1843975, -1.702379, 0.345098, 1, 0, 1,
-0.598915, -0.7677161, -0.8592415, 0.3372549, 1, 0, 1,
-0.585614, 1.293528, -0.6251525, 0.3333333, 1, 0, 1,
-0.5847793, -0.7846531, -3.959891, 0.3254902, 1, 0, 1,
-0.5764323, -0.2047541, -0.2722988, 0.3215686, 1, 0, 1,
-0.5761568, -1.276675, -3.478945, 0.3137255, 1, 0, 1,
-0.5738697, 1.509126, -0.03391898, 0.3098039, 1, 0, 1,
-0.5691019, -1.702683, -2.021942, 0.3019608, 1, 0, 1,
-0.5638232, 1.093694, -0.5322561, 0.2941177, 1, 0, 1,
-0.561494, 0.6046046, 0.6934445, 0.2901961, 1, 0, 1,
-0.5582934, 2.012935, -0.6289687, 0.282353, 1, 0, 1,
-0.5504035, 0.1904768, 0.1672439, 0.2784314, 1, 0, 1,
-0.5483963, -0.1305856, -2.479056, 0.2705882, 1, 0, 1,
-0.5465034, 0.3933745, -1.888742, 0.2666667, 1, 0, 1,
-0.5406935, 0.2917717, 0.9152235, 0.2588235, 1, 0, 1,
-0.5398585, -2.272156, -3.330458, 0.254902, 1, 0, 1,
-0.5396703, -0.1139591, -1.901332, 0.2470588, 1, 0, 1,
-0.5379475, -0.6072131, -2.221115, 0.2431373, 1, 0, 1,
-0.5375288, -1.172176, -4.876271, 0.2352941, 1, 0, 1,
-0.5365683, 1.228265, -0.6465377, 0.2313726, 1, 0, 1,
-0.5362349, -1.675862, -2.611454, 0.2235294, 1, 0, 1,
-0.5356076, -0.1941136, -0.8814574, 0.2196078, 1, 0, 1,
-0.5346891, -0.4679092, -1.269056, 0.2117647, 1, 0, 1,
-0.5346231, -1.100579, -2.692415, 0.2078431, 1, 0, 1,
-0.5342584, 0.659775, 0.2949581, 0.2, 1, 0, 1,
-0.527602, 1.262482, -0.4144151, 0.1921569, 1, 0, 1,
-0.5253241, 1.425727, -0.6673425, 0.1882353, 1, 0, 1,
-0.5238461, 2.016016, 1.082596, 0.1803922, 1, 0, 1,
-0.5231143, 1.433305, -2.020823, 0.1764706, 1, 0, 1,
-0.5231002, 0.9806439, -1.126557, 0.1686275, 1, 0, 1,
-0.5220426, 1.485299, 0.1598073, 0.1647059, 1, 0, 1,
-0.5180326, -1.020019, -2.397761, 0.1568628, 1, 0, 1,
-0.5167913, -0.9820903, -0.03163196, 0.1529412, 1, 0, 1,
-0.5140989, -1.440409, -3.008038, 0.145098, 1, 0, 1,
-0.5135424, -0.6247878, -0.6871252, 0.1411765, 1, 0, 1,
-0.5117322, -0.5398549, -2.396713, 0.1333333, 1, 0, 1,
-0.5097021, -0.8137324, -2.299159, 0.1294118, 1, 0, 1,
-0.5055694, 1.762032, 0.1351825, 0.1215686, 1, 0, 1,
-0.5033608, 1.667723, 0.9053076, 0.1176471, 1, 0, 1,
-0.5020265, 0.1036993, -1.878109, 0.1098039, 1, 0, 1,
-0.5013843, 0.4187722, -1.626558, 0.1058824, 1, 0, 1,
-0.5000413, 0.6152833, -0.5904539, 0.09803922, 1, 0, 1,
-0.4996775, 0.3587849, -2.421674, 0.09019608, 1, 0, 1,
-0.4978552, -1.824721, -1.491652, 0.08627451, 1, 0, 1,
-0.4974906, 0.8405557, 0.2568564, 0.07843138, 1, 0, 1,
-0.4958082, 0.4808804, -0.560513, 0.07450981, 1, 0, 1,
-0.4922264, 1.274471, 0.863903, 0.06666667, 1, 0, 1,
-0.49123, -0.09884527, -3.984433, 0.0627451, 1, 0, 1,
-0.4908157, -1.373275, -2.502513, 0.05490196, 1, 0, 1,
-0.490336, -1.072915, -4.175466, 0.05098039, 1, 0, 1,
-0.4867124, 0.06672306, -1.280319, 0.04313726, 1, 0, 1,
-0.4855441, -0.7035089, -2.810115, 0.03921569, 1, 0, 1,
-0.4852037, -1.983297, -4.862285, 0.03137255, 1, 0, 1,
-0.4826589, -0.4840567, -2.266221, 0.02745098, 1, 0, 1,
-0.4723789, 0.07497872, -1.965892, 0.01960784, 1, 0, 1,
-0.466502, -0.9423385, -2.472306, 0.01568628, 1, 0, 1,
-0.4615277, 0.6017634, -1.074694, 0.007843138, 1, 0, 1,
-0.4601235, -1.030481, -3.431068, 0.003921569, 1, 0, 1,
-0.458715, -0.2180978, -1.758532, 0, 1, 0.003921569, 1,
-0.4569826, 2.216681, 0.1538687, 0, 1, 0.01176471, 1,
-0.4565009, 0.1295804, -1.661496, 0, 1, 0.01568628, 1,
-0.4514409, 0.8832859, -1.589108, 0, 1, 0.02352941, 1,
-0.4465993, 0.5511817, 0.2602881, 0, 1, 0.02745098, 1,
-0.4463691, -1.848962, -4.176584, 0, 1, 0.03529412, 1,
-0.443699, -2.028567, -3.270316, 0, 1, 0.03921569, 1,
-0.442258, -1.59365, -3.540239, 0, 1, 0.04705882, 1,
-0.4419345, 0.7054424, 0.3029304, 0, 1, 0.05098039, 1,
-0.4390177, 1.415333, 1.279128, 0, 1, 0.05882353, 1,
-0.4382034, 2.288201, -1.852855, 0, 1, 0.0627451, 1,
-0.4363434, -0.7756562, -0.6561636, 0, 1, 0.07058824, 1,
-0.4361545, -0.0005617561, -1.999508, 0, 1, 0.07450981, 1,
-0.4347072, -0.6534998, -3.305179, 0, 1, 0.08235294, 1,
-0.4308635, 0.1219319, -0.3492279, 0, 1, 0.08627451, 1,
-0.4227556, -0.1355293, -0.5573029, 0, 1, 0.09411765, 1,
-0.4222594, 0.5285904, -1.401776, 0, 1, 0.1019608, 1,
-0.4173754, -1.053949, -3.761151, 0, 1, 0.1058824, 1,
-0.4162723, 1.02131, -0.1584008, 0, 1, 0.1137255, 1,
-0.4150232, -1.051471, -2.739302, 0, 1, 0.1176471, 1,
-0.4100795, 0.4540455, -1.810038, 0, 1, 0.1254902, 1,
-0.4095, -0.7484195, -2.851694, 0, 1, 0.1294118, 1,
-0.4059295, -0.04901294, -0.191244, 0, 1, 0.1372549, 1,
-0.3983509, 1.081576, -1.697038, 0, 1, 0.1411765, 1,
-0.3943317, 0.06218583, 1.7437, 0, 1, 0.1490196, 1,
-0.3931351, 0.133843, -0.2089895, 0, 1, 0.1529412, 1,
-0.3872403, 1.179149, -0.2798478, 0, 1, 0.1607843, 1,
-0.3859041, 0.2163036, -2.460625, 0, 1, 0.1647059, 1,
-0.3802624, 0.8581795, -0.7760426, 0, 1, 0.172549, 1,
-0.3756255, 0.426979, -1.446981, 0, 1, 0.1764706, 1,
-0.3748302, -0.9089882, -2.634526, 0, 1, 0.1843137, 1,
-0.3733405, -2.015169, -3.586733, 0, 1, 0.1882353, 1,
-0.3705267, 0.8142272, -1.241042, 0, 1, 0.1960784, 1,
-0.3704193, -1.478292, -2.755205, 0, 1, 0.2039216, 1,
-0.3660423, -0.8887877, -3.118148, 0, 1, 0.2078431, 1,
-0.3632379, -0.1209003, -2.44762, 0, 1, 0.2156863, 1,
-0.3631826, -1.495884, -3.161898, 0, 1, 0.2196078, 1,
-0.3604325, 0.4658408, 1.19125, 0, 1, 0.227451, 1,
-0.3573829, 0.3383296, -0.4990342, 0, 1, 0.2313726, 1,
-0.3572209, -0.5550543, -1.534769, 0, 1, 0.2392157, 1,
-0.3546866, -0.2040226, -2.001572, 0, 1, 0.2431373, 1,
-0.3524368, -1.118626, -3.940951, 0, 1, 0.2509804, 1,
-0.3520003, 0.6842191, -0.1915753, 0, 1, 0.254902, 1,
-0.3476599, 0.8289616, -2.293917, 0, 1, 0.2627451, 1,
-0.342714, -0.1025671, -3.695028, 0, 1, 0.2666667, 1,
-0.3421271, 0.4906335, -2.54388, 0, 1, 0.2745098, 1,
-0.3377837, -0.2235987, -2.276881, 0, 1, 0.2784314, 1,
-0.3370253, 0.4255268, -2.899928, 0, 1, 0.2862745, 1,
-0.3310721, -1.983288, -3.246049, 0, 1, 0.2901961, 1,
-0.3226029, 0.5457495, -0.5329574, 0, 1, 0.2980392, 1,
-0.3190201, 0.2224917, -1.25308, 0, 1, 0.3058824, 1,
-0.3186485, -0.6309955, -1.568744, 0, 1, 0.3098039, 1,
-0.3168247, 0.9520162, -1.501301, 0, 1, 0.3176471, 1,
-0.3116269, -0.4488985, -3.803604, 0, 1, 0.3215686, 1,
-0.3109445, 1.239364, 0.01184515, 0, 1, 0.3294118, 1,
-0.3107607, 0.1393235, -1.237988, 0, 1, 0.3333333, 1,
-0.309818, -0.9145535, -2.963147, 0, 1, 0.3411765, 1,
-0.3085136, -1.460225, -2.640525, 0, 1, 0.345098, 1,
-0.3079014, 1.1162, -1.216263, 0, 1, 0.3529412, 1,
-0.2990711, -0.8371117, -3.076658, 0, 1, 0.3568628, 1,
-0.2965862, -0.9334055, -2.4803, 0, 1, 0.3647059, 1,
-0.2939949, -1.413652, -2.302562, 0, 1, 0.3686275, 1,
-0.2919949, -0.2768507, -2.793109, 0, 1, 0.3764706, 1,
-0.2884395, 0.08718644, -0.2383349, 0, 1, 0.3803922, 1,
-0.2861231, 0.3619637, 0.182261, 0, 1, 0.3882353, 1,
-0.2816515, -1.345428, -1.261095, 0, 1, 0.3921569, 1,
-0.2815528, 0.260968, -1.348448, 0, 1, 0.4, 1,
-0.2804135, -0.8533081, -3.231654, 0, 1, 0.4078431, 1,
-0.2720964, 1.212133, 1.184199, 0, 1, 0.4117647, 1,
-0.266158, 0.1116531, -0.1719145, 0, 1, 0.4196078, 1,
-0.2614932, 0.0463168, -1.711754, 0, 1, 0.4235294, 1,
-0.2614422, 0.5658005, 0.6267433, 0, 1, 0.4313726, 1,
-0.2583154, -1.828208, -2.822058, 0, 1, 0.4352941, 1,
-0.2522605, -0.8306323, -4.756663, 0, 1, 0.4431373, 1,
-0.2515408, 1.234301, 0.5704059, 0, 1, 0.4470588, 1,
-0.248102, 1.351731, 1.063346, 0, 1, 0.454902, 1,
-0.2437188, -1.308859, -2.52596, 0, 1, 0.4588235, 1,
-0.2432458, 0.2140638, -1.749943, 0, 1, 0.4666667, 1,
-0.2373216, -1.129474, -3.17971, 0, 1, 0.4705882, 1,
-0.2355118, -1.016932, -3.633619, 0, 1, 0.4784314, 1,
-0.234178, -0.3414496, -3.271066, 0, 1, 0.4823529, 1,
-0.2337528, -0.8289306, -1.830749, 0, 1, 0.4901961, 1,
-0.2307752, 0.4314085, -0.09719589, 0, 1, 0.4941176, 1,
-0.2285071, -0.5867006, -2.285279, 0, 1, 0.5019608, 1,
-0.2216977, 1.292199, 0.4477409, 0, 1, 0.509804, 1,
-0.2161831, -0.5424094, -2.6349, 0, 1, 0.5137255, 1,
-0.2150112, -0.3760386, -2.780924, 0, 1, 0.5215687, 1,
-0.213004, 0.8437777, -1.685773, 0, 1, 0.5254902, 1,
-0.2094944, 0.2100774, -0.4750811, 0, 1, 0.5333334, 1,
-0.2082673, -0.965574, -3.674421, 0, 1, 0.5372549, 1,
-0.1957351, -1.046222, -1.316942, 0, 1, 0.5450981, 1,
-0.1950502, -0.2281043, -2.133202, 0, 1, 0.5490196, 1,
-0.1924905, -0.791351, -2.252956, 0, 1, 0.5568628, 1,
-0.1911243, 0.7651854, -0.9137526, 0, 1, 0.5607843, 1,
-0.1888455, -1.701031, -4.099326, 0, 1, 0.5686275, 1,
-0.1867894, -0.3279541, -3.204499, 0, 1, 0.572549, 1,
-0.1808417, 0.7325984, 0.6422812, 0, 1, 0.5803922, 1,
-0.1788107, -0.4089269, -0.8545353, 0, 1, 0.5843138, 1,
-0.1784822, -1.103191, -4.630568, 0, 1, 0.5921569, 1,
-0.1783594, 0.4870666, -0.07006817, 0, 1, 0.5960785, 1,
-0.175729, 0.2046871, -0.8309389, 0, 1, 0.6039216, 1,
-0.1754248, 1.891697, 0.226568, 0, 1, 0.6117647, 1,
-0.1733221, -1.113234, -2.327148, 0, 1, 0.6156863, 1,
-0.1725782, -1.445704, -4.195348, 0, 1, 0.6235294, 1,
-0.1716155, -0.02864997, -2.143134, 0, 1, 0.627451, 1,
-0.171057, 0.05748845, 0.3159609, 0, 1, 0.6352941, 1,
-0.1692948, -1.232473, -2.471987, 0, 1, 0.6392157, 1,
-0.1673598, -0.406331, -2.557684, 0, 1, 0.6470588, 1,
-0.167162, 0.8489841, -0.5685251, 0, 1, 0.6509804, 1,
-0.1635102, -0.7431638, -3.585824, 0, 1, 0.6588235, 1,
-0.16291, -0.4752409, -2.154139, 0, 1, 0.6627451, 1,
-0.1607664, 0.954309, 1.566886, 0, 1, 0.6705883, 1,
-0.160176, 1.256311, 0.2756414, 0, 1, 0.6745098, 1,
-0.1596294, 0.2257746, -0.6883643, 0, 1, 0.682353, 1,
-0.1585813, -0.09194332, -2.922854, 0, 1, 0.6862745, 1,
-0.1581146, -0.4125346, -3.100611, 0, 1, 0.6941177, 1,
-0.1553947, 0.285127, 0.01234437, 0, 1, 0.7019608, 1,
-0.1547167, 0.2566953, -0.5214444, 0, 1, 0.7058824, 1,
-0.1519158, -1.967721, -3.403728, 0, 1, 0.7137255, 1,
-0.1506111, -0.4234141, -1.935455, 0, 1, 0.7176471, 1,
-0.1473552, 0.8540766, -1.697569, 0, 1, 0.7254902, 1,
-0.1401086, 0.9444069, -1.348613, 0, 1, 0.7294118, 1,
-0.1392233, -0.5659503, -1.754263, 0, 1, 0.7372549, 1,
-0.1388487, 0.4814069, -0.8387225, 0, 1, 0.7411765, 1,
-0.1383728, -0.6592478, -3.55461, 0, 1, 0.7490196, 1,
-0.1359566, -0.732707, -2.564326, 0, 1, 0.7529412, 1,
-0.1354717, 0.9181754, 0.04112516, 0, 1, 0.7607843, 1,
-0.1328894, -0.7519976, -3.164666, 0, 1, 0.7647059, 1,
-0.131481, 2.012607, 0.8521856, 0, 1, 0.772549, 1,
-0.130257, 1.629867, -0.3960919, 0, 1, 0.7764706, 1,
-0.1258147, 1.279663, 1.932949, 0, 1, 0.7843137, 1,
-0.1201496, 1.207144, 0.97034, 0, 1, 0.7882353, 1,
-0.1194221, -0.7830348, -2.846417, 0, 1, 0.7960784, 1,
-0.1188483, -0.8151186, -3.786214, 0, 1, 0.8039216, 1,
-0.1169776, -0.02488581, -1.97373, 0, 1, 0.8078431, 1,
-0.116746, 1.356101, -0.640299, 0, 1, 0.8156863, 1,
-0.1104858, 0.7013603, -1.307518, 0, 1, 0.8196079, 1,
-0.105987, -1.684858, -3.71034, 0, 1, 0.827451, 1,
-0.09458419, -1.646558, -2.520303, 0, 1, 0.8313726, 1,
-0.09407307, 1.076698, 0.0507303, 0, 1, 0.8392157, 1,
-0.08901189, 0.5629166, -0.4008811, 0, 1, 0.8431373, 1,
-0.08824237, -0.1525371, -3.538532, 0, 1, 0.8509804, 1,
-0.08805929, 0.9691108, 0.1767211, 0, 1, 0.854902, 1,
-0.08689209, 2.782235, 1.193446, 0, 1, 0.8627451, 1,
-0.08583254, 1.594433, 0.7084577, 0, 1, 0.8666667, 1,
-0.08218946, -0.7823788, -2.304114, 0, 1, 0.8745098, 1,
-0.08161692, 1.482951, -0.6713569, 0, 1, 0.8784314, 1,
-0.07835995, 0.2279281, 0.09719039, 0, 1, 0.8862745, 1,
-0.07674585, -0.5873433, -1.736977, 0, 1, 0.8901961, 1,
-0.07569828, -0.3181233, -3.157434, 0, 1, 0.8980392, 1,
-0.07211073, -1.42084, -2.892746, 0, 1, 0.9058824, 1,
-0.06833224, 0.03699557, 0.3891602, 0, 1, 0.9098039, 1,
-0.06506623, -0.1457818, -2.146627, 0, 1, 0.9176471, 1,
-0.0646515, 0.6266595, -1.368183, 0, 1, 0.9215686, 1,
-0.0618915, 1.029652, -2.509358, 0, 1, 0.9294118, 1,
-0.06073902, 0.3736512, -0.02433994, 0, 1, 0.9333333, 1,
-0.05342143, -0.5798488, -1.845764, 0, 1, 0.9411765, 1,
-0.0519799, -1.997135, -1.932276, 0, 1, 0.945098, 1,
-0.04779062, 0.7428241, -0.1748765, 0, 1, 0.9529412, 1,
-0.04648585, 0.02287333, -1.383519, 0, 1, 0.9568627, 1,
-0.03716264, -0.9023163, -4.585019, 0, 1, 0.9647059, 1,
-0.0306343, -0.631574, -3.004207, 0, 1, 0.9686275, 1,
-0.02544861, -1.82809, -3.344054, 0, 1, 0.9764706, 1,
-0.02322898, -0.1410955, -2.844666, 0, 1, 0.9803922, 1,
-0.01684211, 0.752786, -1.73667, 0, 1, 0.9882353, 1,
-0.01508128, -0.3444584, -3.008507, 0, 1, 0.9921569, 1,
-0.01324304, -0.7447445, -3.334417, 0, 1, 1, 1,
-0.013203, 0.9274035, -1.644974, 0, 0.9921569, 1, 1,
-0.00886876, -1.046525, -4.179151, 0, 0.9882353, 1, 1,
-0.007789981, -0.3406266, -3.098038, 0, 0.9803922, 1, 1,
-0.003392325, 0.3655922, 0.9919406, 0, 0.9764706, 1, 1,
-0.001269796, -0.8829626, -3.390305, 0, 0.9686275, 1, 1,
0.002501561, -1.730313, 3.961135, 0, 0.9647059, 1, 1,
0.004668778, 1.373341, -0.3097399, 0, 0.9568627, 1, 1,
0.009180338, -2.111852, 2.625489, 0, 0.9529412, 1, 1,
0.01166585, 1.780529, 0.7073054, 0, 0.945098, 1, 1,
0.01314973, -0.632156, 2.203611, 0, 0.9411765, 1, 1,
0.01353017, -0.8272287, 2.221082, 0, 0.9333333, 1, 1,
0.01484132, -0.8547992, 3.802646, 0, 0.9294118, 1, 1,
0.01507431, 0.6278123, 0.4092478, 0, 0.9215686, 1, 1,
0.01686506, 1.242233, -0.5853223, 0, 0.9176471, 1, 1,
0.01727244, -0.1951783, 1.801844, 0, 0.9098039, 1, 1,
0.0190506, -1.072595, 2.916477, 0, 0.9058824, 1, 1,
0.01924611, 0.1789511, -0.4094951, 0, 0.8980392, 1, 1,
0.02503005, -0.6524124, 4.755546, 0, 0.8901961, 1, 1,
0.0276267, 0.8566889, -1.410275, 0, 0.8862745, 1, 1,
0.04297759, -0.5781671, 3.355868, 0, 0.8784314, 1, 1,
0.04607202, -0.3162349, 2.12676, 0, 0.8745098, 1, 1,
0.04988992, 1.065721, -0.01611677, 0, 0.8666667, 1, 1,
0.05114521, 1.156811, -2.012346, 0, 0.8627451, 1, 1,
0.05542305, -0.693342, 3.253693, 0, 0.854902, 1, 1,
0.05759712, -0.05075303, 2.453476, 0, 0.8509804, 1, 1,
0.06551731, 1.156091, -1.203046, 0, 0.8431373, 1, 1,
0.07041345, 0.1769744, 1.204776, 0, 0.8392157, 1, 1,
0.07048763, 0.04952751, 0.5608816, 0, 0.8313726, 1, 1,
0.07111415, -1.397217, 3.396416, 0, 0.827451, 1, 1,
0.07301564, 0.3873823, 0.3612054, 0, 0.8196079, 1, 1,
0.07303677, -0.4253011, 3.251615, 0, 0.8156863, 1, 1,
0.07484087, 1.051512, -1.529864, 0, 0.8078431, 1, 1,
0.08477943, -1.380232, 4.075507, 0, 0.8039216, 1, 1,
0.0867552, 2.183575, 0.2764352, 0, 0.7960784, 1, 1,
0.08962176, -0.04709166, 2.968827, 0, 0.7882353, 1, 1,
0.09055883, 0.3741808, -0.4527246, 0, 0.7843137, 1, 1,
0.09334575, -0.2048415, 1.439772, 0, 0.7764706, 1, 1,
0.09426235, 0.2789857, 1.001425, 0, 0.772549, 1, 1,
0.09576247, -0.07990742, 1.248127, 0, 0.7647059, 1, 1,
0.09802696, 0.6950229, -1.32702, 0, 0.7607843, 1, 1,
0.09844944, -0.4205132, 2.671714, 0, 0.7529412, 1, 1,
0.09952436, -0.9100611, 2.999315, 0, 0.7490196, 1, 1,
0.1002451, 0.04098358, 4.05441, 0, 0.7411765, 1, 1,
0.1024244, 1.860938, 0.6057385, 0, 0.7372549, 1, 1,
0.1036852, -0.8750393, 1.297912, 0, 0.7294118, 1, 1,
0.1134326, -2.455503, 2.443498, 0, 0.7254902, 1, 1,
0.1151718, -0.53495, 2.722217, 0, 0.7176471, 1, 1,
0.1185648, 0.849993, 0.6496964, 0, 0.7137255, 1, 1,
0.1239484, 0.1751227, 0.6852267, 0, 0.7058824, 1, 1,
0.1264134, 0.4963189, 1.379149, 0, 0.6980392, 1, 1,
0.1269946, -0.678739, 2.176375, 0, 0.6941177, 1, 1,
0.1315046, -0.6702755, 3.093728, 0, 0.6862745, 1, 1,
0.1327824, 1.339117, -0.30775, 0, 0.682353, 1, 1,
0.1332809, -0.3046482, 3.404783, 0, 0.6745098, 1, 1,
0.1333686, -0.4581667, 5.610728, 0, 0.6705883, 1, 1,
0.1339478, -1.724761, 3.778097, 0, 0.6627451, 1, 1,
0.135572, 0.2653162, 0.1984541, 0, 0.6588235, 1, 1,
0.1413919, -0.1233073, 2.338291, 0, 0.6509804, 1, 1,
0.1426455, -1.029674, 2.073142, 0, 0.6470588, 1, 1,
0.1432488, -1.202698, 2.929236, 0, 0.6392157, 1, 1,
0.1432915, -1.274314, 2.765776, 0, 0.6352941, 1, 1,
0.1468991, -0.7590911, 3.53185, 0, 0.627451, 1, 1,
0.1480823, 0.207305, 1.559445, 0, 0.6235294, 1, 1,
0.1528302, -0.7575947, 3.815884, 0, 0.6156863, 1, 1,
0.1596667, -0.8629757, 2.312329, 0, 0.6117647, 1, 1,
0.1619823, -0.7739001, 3.612187, 0, 0.6039216, 1, 1,
0.1643075, -0.06052214, 3.349991, 0, 0.5960785, 1, 1,
0.1648534, -1.709759, 2.54501, 0, 0.5921569, 1, 1,
0.1662674, 1.862257, 1.29434, 0, 0.5843138, 1, 1,
0.1713275, -0.4146369, 1.712516, 0, 0.5803922, 1, 1,
0.1738204, -0.3129866, 2.657305, 0, 0.572549, 1, 1,
0.1783297, 1.245672, -0.7181987, 0, 0.5686275, 1, 1,
0.1820251, -0.2419192, 0.7200215, 0, 0.5607843, 1, 1,
0.1821711, 0.4352797, 0.6037976, 0, 0.5568628, 1, 1,
0.185318, -0.2649873, 0.9799533, 0, 0.5490196, 1, 1,
0.194068, -1.422387, 3.365341, 0, 0.5450981, 1, 1,
0.1990236, -1.476341, 4.169679, 0, 0.5372549, 1, 1,
0.2005002, -0.0877151, 1.709587, 0, 0.5333334, 1, 1,
0.203404, 1.605062, -0.4238997, 0, 0.5254902, 1, 1,
0.2080728, -0.1378959, 1.927444, 0, 0.5215687, 1, 1,
0.2081393, -0.5513984, 3.659406, 0, 0.5137255, 1, 1,
0.2130442, 0.3444465, 0.06591867, 0, 0.509804, 1, 1,
0.2142697, 1.683575, 0.8973789, 0, 0.5019608, 1, 1,
0.2182223, 1.264851, 0.6605953, 0, 0.4941176, 1, 1,
0.2184209, 0.01640812, 1.210786, 0, 0.4901961, 1, 1,
0.2197571, -0.09513081, 4.174989, 0, 0.4823529, 1, 1,
0.2216695, 0.1562174, 0.05755776, 0, 0.4784314, 1, 1,
0.2228471, 0.6768695, -0.06270795, 0, 0.4705882, 1, 1,
0.2244249, -0.8188738, 3.845586, 0, 0.4666667, 1, 1,
0.2247185, -0.7601706, 4.141566, 0, 0.4588235, 1, 1,
0.2321411, -0.3911335, 3.684626, 0, 0.454902, 1, 1,
0.2328825, -0.5058467, 1.978135, 0, 0.4470588, 1, 1,
0.2374305, 1.872431, 0.328315, 0, 0.4431373, 1, 1,
0.2423225, 0.7188483, -0.8143135, 0, 0.4352941, 1, 1,
0.2475017, 0.7650315, -0.260364, 0, 0.4313726, 1, 1,
0.2512325, 1.308468, 2.710272, 0, 0.4235294, 1, 1,
0.2525589, 2.543928, -1.186849, 0, 0.4196078, 1, 1,
0.253293, -0.5270222, 5.032832, 0, 0.4117647, 1, 1,
0.2556556, 0.1339982, 0.5816984, 0, 0.4078431, 1, 1,
0.2580287, 0.3086015, 0.07462458, 0, 0.4, 1, 1,
0.263257, -1.755578, 0.5441312, 0, 0.3921569, 1, 1,
0.267123, 0.115971, 1.96268, 0, 0.3882353, 1, 1,
0.2673322, 0.1744801, -0.290957, 0, 0.3803922, 1, 1,
0.2722575, 1.353022, -0.3254891, 0, 0.3764706, 1, 1,
0.2735665, 0.188841, 4.486523, 0, 0.3686275, 1, 1,
0.2818224, 0.733613, 1.340421, 0, 0.3647059, 1, 1,
0.2834735, 1.391067, -1.07154, 0, 0.3568628, 1, 1,
0.2844707, 1.00721, -0.3126131, 0, 0.3529412, 1, 1,
0.2852368, -0.5138991, 3.367148, 0, 0.345098, 1, 1,
0.2971472, -1.090169, 3.267006, 0, 0.3411765, 1, 1,
0.2971568, -0.5760989, 0.8506663, 0, 0.3333333, 1, 1,
0.302982, -0.7849164, 1.399928, 0, 0.3294118, 1, 1,
0.3072414, 0.5529037, -0.8893135, 0, 0.3215686, 1, 1,
0.3081492, 2.170785, 2.213495, 0, 0.3176471, 1, 1,
0.3114281, 0.9338999, 0.6236392, 0, 0.3098039, 1, 1,
0.3136336, 0.1593852, 0.2359881, 0, 0.3058824, 1, 1,
0.3138877, -1.331832, 2.495543, 0, 0.2980392, 1, 1,
0.315124, 1.969218, 1.070636, 0, 0.2901961, 1, 1,
0.3163942, -2.056137, 2.812639, 0, 0.2862745, 1, 1,
0.3274546, 0.277629, 1.310695, 0, 0.2784314, 1, 1,
0.3302141, 0.5922407, -1.257736, 0, 0.2745098, 1, 1,
0.3367126, 1.580475, -1.496509, 0, 0.2666667, 1, 1,
0.3387188, 0.2702895, 1.438283, 0, 0.2627451, 1, 1,
0.3438537, 1.883502, 0.1098082, 0, 0.254902, 1, 1,
0.3461245, 1.05785, -0.7459269, 0, 0.2509804, 1, 1,
0.348435, -0.8484526, 1.650894, 0, 0.2431373, 1, 1,
0.3491242, 0.1608244, 0.6878157, 0, 0.2392157, 1, 1,
0.3497873, 0.8204684, 2.075077, 0, 0.2313726, 1, 1,
0.3510174, -0.8489734, 2.55512, 0, 0.227451, 1, 1,
0.3523655, -1.16847, 2.805142, 0, 0.2196078, 1, 1,
0.3534222, -1.571255, 4.566265, 0, 0.2156863, 1, 1,
0.3604548, 0.2189717, 0.6022589, 0, 0.2078431, 1, 1,
0.3605136, 2.023307, -0.2514937, 0, 0.2039216, 1, 1,
0.3616924, 0.1655529, 2.467637, 0, 0.1960784, 1, 1,
0.3624523, -1.231165, 2.123115, 0, 0.1882353, 1, 1,
0.3659646, -0.1918786, 4.023058, 0, 0.1843137, 1, 1,
0.3678839, 1.615588, -1.3744, 0, 0.1764706, 1, 1,
0.3685055, -0.3385654, 0.4688136, 0, 0.172549, 1, 1,
0.3763027, 0.1732506, 1.9149, 0, 0.1647059, 1, 1,
0.3784325, 0.2433775, 0.5212986, 0, 0.1607843, 1, 1,
0.3786803, 0.1835624, -0.1714296, 0, 0.1529412, 1, 1,
0.3806773, 0.8188094, 1.339008, 0, 0.1490196, 1, 1,
0.3863815, -0.5890586, 2.34223, 0, 0.1411765, 1, 1,
0.3871737, -1.25289, 0.8009689, 0, 0.1372549, 1, 1,
0.3876589, 0.03172509, 1.539786, 0, 0.1294118, 1, 1,
0.387669, 0.5250986, 2.030524, 0, 0.1254902, 1, 1,
0.390921, -0.02725281, 2.878341, 0, 0.1176471, 1, 1,
0.3916494, 1.475068, 0.6459528, 0, 0.1137255, 1, 1,
0.3957687, 0.3853573, 0.4529351, 0, 0.1058824, 1, 1,
0.4012268, -1.741835, 1.580712, 0, 0.09803922, 1, 1,
0.402311, -1.218902, -0.2506934, 0, 0.09411765, 1, 1,
0.4038806, 1.219328, 1.299872, 0, 0.08627451, 1, 1,
0.4206671, -0.3026617, 2.690671, 0, 0.08235294, 1, 1,
0.4222323, -0.00433559, 2.574396, 0, 0.07450981, 1, 1,
0.4240366, -0.5844538, 5.264829, 0, 0.07058824, 1, 1,
0.4270798, -1.4311, 3.010724, 0, 0.0627451, 1, 1,
0.4319964, -0.02405932, 1.203492, 0, 0.05882353, 1, 1,
0.4355026, 0.5686423, 1.513575, 0, 0.05098039, 1, 1,
0.4387015, -1.498043, 2.72136, 0, 0.04705882, 1, 1,
0.4387884, 1.280057, 0.2452521, 0, 0.03921569, 1, 1,
0.4407476, 0.4141995, -0.4561844, 0, 0.03529412, 1, 1,
0.4419831, -1.398482, 4.462262, 0, 0.02745098, 1, 1,
0.4449787, -0.5709141, 0.9097016, 0, 0.02352941, 1, 1,
0.4456646, -1.526261, 2.005348, 0, 0.01568628, 1, 1,
0.4476338, -1.715227, 3.514903, 0, 0.01176471, 1, 1,
0.4489868, 1.642673, -0.02975633, 0, 0.003921569, 1, 1,
0.4493657, 0.1909846, 2.407049, 0.003921569, 0, 1, 1,
0.4501987, -0.9914641, 5.222916, 0.007843138, 0, 1, 1,
0.4514757, 0.3965691, 0.6553478, 0.01568628, 0, 1, 1,
0.4518313, 0.4807308, 0.8586642, 0.01960784, 0, 1, 1,
0.4534123, 0.2111027, 2.396515, 0.02745098, 0, 1, 1,
0.4557015, 0.7889489, 2.282141, 0.03137255, 0, 1, 1,
0.4574606, -0.2995622, 2.589217, 0.03921569, 0, 1, 1,
0.4585935, 0.4885234, 3.9605, 0.04313726, 0, 1, 1,
0.4599487, -1.563646, 2.862366, 0.05098039, 0, 1, 1,
0.4608352, 0.3734403, 1.585812, 0.05490196, 0, 1, 1,
0.4634446, 0.04519594, 2.131449, 0.0627451, 0, 1, 1,
0.4692635, -0.003376996, 0.8767784, 0.06666667, 0, 1, 1,
0.4734513, 2.36248, 0.6591732, 0.07450981, 0, 1, 1,
0.4750538, 2.354647, 0.4362006, 0.07843138, 0, 1, 1,
0.4807103, 0.713284, 0.1961436, 0.08627451, 0, 1, 1,
0.4815702, 0.6531537, 2.615072, 0.09019608, 0, 1, 1,
0.4822664, 1.100221, 0.5038961, 0.09803922, 0, 1, 1,
0.4823422, 0.03654349, 1.762746, 0.1058824, 0, 1, 1,
0.4838606, 0.6877313, -0.8286464, 0.1098039, 0, 1, 1,
0.4873045, -0.3849069, 2.029488, 0.1176471, 0, 1, 1,
0.4897332, -2.151678, 2.332738, 0.1215686, 0, 1, 1,
0.4924922, 1.241519, 0.6444316, 0.1294118, 0, 1, 1,
0.4944972, 0.423326, -0.07335443, 0.1333333, 0, 1, 1,
0.5003611, -0.1110571, 2.918653, 0.1411765, 0, 1, 1,
0.5057829, -1.446124, 1.815191, 0.145098, 0, 1, 1,
0.5062681, -0.8893329, 2.244008, 0.1529412, 0, 1, 1,
0.5089588, 0.4041055, 0.1100809, 0.1568628, 0, 1, 1,
0.5125369, -1.393726, 2.991692, 0.1647059, 0, 1, 1,
0.5137379, -1.264814, 3.55229, 0.1686275, 0, 1, 1,
0.5181043, -1.04732, 2.805903, 0.1764706, 0, 1, 1,
0.5182309, -0.01300603, 1.644732, 0.1803922, 0, 1, 1,
0.519267, -0.5990166, 2.073421, 0.1882353, 0, 1, 1,
0.5200527, -0.4273871, 3.157841, 0.1921569, 0, 1, 1,
0.5221843, -0.3851799, 1.142352, 0.2, 0, 1, 1,
0.5263574, 2.402578, 0.1397261, 0.2078431, 0, 1, 1,
0.5267229, 0.1948911, 3.266647, 0.2117647, 0, 1, 1,
0.5334187, -0.1769527, 1.588941, 0.2196078, 0, 1, 1,
0.5334329, 1.062049, -0.01659082, 0.2235294, 0, 1, 1,
0.5393805, -1.135112, 2.284435, 0.2313726, 0, 1, 1,
0.5401574, -0.0623856, -0.5421096, 0.2352941, 0, 1, 1,
0.5419757, 0.6175956, 0.5728936, 0.2431373, 0, 1, 1,
0.5448156, 2.326433, 0.2373142, 0.2470588, 0, 1, 1,
0.5451301, 0.2404583, 3.264987, 0.254902, 0, 1, 1,
0.5495787, 0.03216593, 0.9047167, 0.2588235, 0, 1, 1,
0.5507339, -0.1362792, 3.090095, 0.2666667, 0, 1, 1,
0.5513944, -1.229444, 3.968004, 0.2705882, 0, 1, 1,
0.5519722, 0.82029, 1.090801, 0.2784314, 0, 1, 1,
0.5543057, -0.4227822, 3.157479, 0.282353, 0, 1, 1,
0.5545263, 1.444409, 1.273022, 0.2901961, 0, 1, 1,
0.5588261, 0.3512248, 0.1063999, 0.2941177, 0, 1, 1,
0.559487, 0.4732068, -0.1229696, 0.3019608, 0, 1, 1,
0.5636508, -0.9981934, 1.301049, 0.3098039, 0, 1, 1,
0.5637167, -0.8217821, 1.724509, 0.3137255, 0, 1, 1,
0.5704622, 1.345813, 0.4567724, 0.3215686, 0, 1, 1,
0.5763145, 0.1482871, -0.4165264, 0.3254902, 0, 1, 1,
0.5787073, -0.197491, 2.003065, 0.3333333, 0, 1, 1,
0.5790284, 0.5470964, 2.444393, 0.3372549, 0, 1, 1,
0.5851175, -0.02370065, -0.5824323, 0.345098, 0, 1, 1,
0.5887657, -1.519745, 2.512554, 0.3490196, 0, 1, 1,
0.5910262, -0.496563, 1.601384, 0.3568628, 0, 1, 1,
0.5923405, 1.468681, 0.119663, 0.3607843, 0, 1, 1,
0.5955752, 1.116327, -0.2242857, 0.3686275, 0, 1, 1,
0.5958002, 0.2589579, -0.4521503, 0.372549, 0, 1, 1,
0.596471, -0.3441979, 3.076785, 0.3803922, 0, 1, 1,
0.6003541, -0.4089905, 1.425584, 0.3843137, 0, 1, 1,
0.6023707, -0.928562, 3.289988, 0.3921569, 0, 1, 1,
0.6044349, -1.568779, 2.942816, 0.3960784, 0, 1, 1,
0.6111898, 0.05299024, 1.511604, 0.4039216, 0, 1, 1,
0.6127295, -0.3771336, 2.090328, 0.4117647, 0, 1, 1,
0.61414, 0.9549872, 3.010906, 0.4156863, 0, 1, 1,
0.6153407, 1.093377, 0.7749263, 0.4235294, 0, 1, 1,
0.6171961, -1.444916, 2.000424, 0.427451, 0, 1, 1,
0.6183619, -0.2299832, 1.003192, 0.4352941, 0, 1, 1,
0.6252412, 0.01433515, 1.05579, 0.4392157, 0, 1, 1,
0.6272236, -0.440243, 3.140293, 0.4470588, 0, 1, 1,
0.6295875, -1.198604, 1.6323, 0.4509804, 0, 1, 1,
0.6339796, 0.08818282, 1.400015, 0.4588235, 0, 1, 1,
0.6348437, -0.2180186, 0.6682144, 0.4627451, 0, 1, 1,
0.6375208, 0.9195914, 0.4124911, 0.4705882, 0, 1, 1,
0.6401069, 0.09437486, 1.398057, 0.4745098, 0, 1, 1,
0.6406755, -0.6308013, 2.254287, 0.4823529, 0, 1, 1,
0.6449919, 0.6483814, 1.114132, 0.4862745, 0, 1, 1,
0.6471644, 0.6071808, 0.04226819, 0.4941176, 0, 1, 1,
0.6504326, -1.588181, 3.89472, 0.5019608, 0, 1, 1,
0.6604272, 0.7949861, 0.7584529, 0.5058824, 0, 1, 1,
0.6615192, 1.022517, 1.043859, 0.5137255, 0, 1, 1,
0.6617824, 0.7552719, 0.9276475, 0.5176471, 0, 1, 1,
0.6618132, -0.06863356, -0.8549191, 0.5254902, 0, 1, 1,
0.6627266, -0.7452797, 5.035421, 0.5294118, 0, 1, 1,
0.6639852, 0.5358416, 1.021227, 0.5372549, 0, 1, 1,
0.6643083, 0.7252613, 0.2780446, 0.5411765, 0, 1, 1,
0.6679059, 1.166085, 1.734189, 0.5490196, 0, 1, 1,
0.6679662, 1.356865, 0.5191819, 0.5529412, 0, 1, 1,
0.6729217, -1.536561, 3.309377, 0.5607843, 0, 1, 1,
0.6735403, -0.219425, 1.376548, 0.5647059, 0, 1, 1,
0.6776947, 1.965843, 0.3191646, 0.572549, 0, 1, 1,
0.6889774, 1.815478, 1.911451, 0.5764706, 0, 1, 1,
0.6980163, -1.016934, 2.352304, 0.5843138, 0, 1, 1,
0.6982169, 0.1029025, 0.7948529, 0.5882353, 0, 1, 1,
0.6989501, -0.7649425, 3.586915, 0.5960785, 0, 1, 1,
0.7024732, 0.4177998, 2.809819, 0.6039216, 0, 1, 1,
0.7053298, -0.07263362, 2.854166, 0.6078432, 0, 1, 1,
0.7076516, 0.9439282, 0.5697067, 0.6156863, 0, 1, 1,
0.7120255, -0.6953527, 2.278884, 0.6196079, 0, 1, 1,
0.7123401, 0.4432011, 1.803139, 0.627451, 0, 1, 1,
0.7196837, -0.5425352, 3.695676, 0.6313726, 0, 1, 1,
0.7217764, -1.66442, 2.76659, 0.6392157, 0, 1, 1,
0.7250926, 0.1749039, 1.061816, 0.6431373, 0, 1, 1,
0.7255634, 0.4019566, 1.657109, 0.6509804, 0, 1, 1,
0.7305794, 0.2247415, -0.1011845, 0.654902, 0, 1, 1,
0.7306768, 0.2256418, -0.9247143, 0.6627451, 0, 1, 1,
0.7338184, -0.6300573, 2.493057, 0.6666667, 0, 1, 1,
0.7346398, -0.5997182, 1.311041, 0.6745098, 0, 1, 1,
0.7375969, -1.202705, 2.540996, 0.6784314, 0, 1, 1,
0.7422259, -1.19556, 1.654772, 0.6862745, 0, 1, 1,
0.7442912, 1.015474, 0.2776689, 0.6901961, 0, 1, 1,
0.7456177, -0.5853757, 2.518095, 0.6980392, 0, 1, 1,
0.7471571, 1.256386, -1.527182, 0.7058824, 0, 1, 1,
0.7498226, -0.8648348, 3.752851, 0.7098039, 0, 1, 1,
0.7502427, -0.3189153, 3.194484, 0.7176471, 0, 1, 1,
0.7535005, -1.246671, 3.431471, 0.7215686, 0, 1, 1,
0.7549747, 0.8026631, -1.321566, 0.7294118, 0, 1, 1,
0.7622099, 0.153408, 2.914244, 0.7333333, 0, 1, 1,
0.7629835, 1.625789, 1.291777, 0.7411765, 0, 1, 1,
0.7657354, 0.9286893, 1.321288, 0.7450981, 0, 1, 1,
0.767336, -2.350892, 1.87927, 0.7529412, 0, 1, 1,
0.7693537, 0.5051512, 0.480058, 0.7568628, 0, 1, 1,
0.7716014, 0.2007161, 1.731192, 0.7647059, 0, 1, 1,
0.776934, 0.3102642, -0.7084259, 0.7686275, 0, 1, 1,
0.7795647, 0.3472288, 0.01016273, 0.7764706, 0, 1, 1,
0.7838199, 0.610579, 1.578586, 0.7803922, 0, 1, 1,
0.7838523, -0.6254493, 3.686136, 0.7882353, 0, 1, 1,
0.786482, 0.2682553, 0.7393852, 0.7921569, 0, 1, 1,
0.7876776, 0.1368865, 1.861739, 0.8, 0, 1, 1,
0.7914646, -0.667695, 3.086309, 0.8078431, 0, 1, 1,
0.798314, 0.4032441, 1.117228, 0.8117647, 0, 1, 1,
0.8031386, 0.2220767, 0.02319769, 0.8196079, 0, 1, 1,
0.807859, 1.055334, 1.741967, 0.8235294, 0, 1, 1,
0.8138928, 1.472995, 0.8277432, 0.8313726, 0, 1, 1,
0.8165517, 0.1825089, -1.635172, 0.8352941, 0, 1, 1,
0.8169736, -0.6496194, 4.087041, 0.8431373, 0, 1, 1,
0.8174057, -0.1573838, 2.507927, 0.8470588, 0, 1, 1,
0.827983, -1.931216, 3.124916, 0.854902, 0, 1, 1,
0.8367445, 0.5519301, 1.610506, 0.8588235, 0, 1, 1,
0.8385916, 1.005001, 1.147785, 0.8666667, 0, 1, 1,
0.8428423, -1.819498, 4.430957, 0.8705882, 0, 1, 1,
0.8489463, -0.5477682, 2.273112, 0.8784314, 0, 1, 1,
0.8506965, 0.2894108, 0.8617478, 0.8823529, 0, 1, 1,
0.856475, -1.444858, 1.207808, 0.8901961, 0, 1, 1,
0.863209, -2.52359, 0.9522798, 0.8941177, 0, 1, 1,
0.8668549, 1.949096, 1.201626, 0.9019608, 0, 1, 1,
0.8680705, -0.1993146, 1.855455, 0.9098039, 0, 1, 1,
0.8736918, -0.6120543, 1.274854, 0.9137255, 0, 1, 1,
0.8757614, 0.3349314, 1.086291, 0.9215686, 0, 1, 1,
0.8758726, -0.7072214, 2.6374, 0.9254902, 0, 1, 1,
0.8823792, 0.9553697, 0.6344738, 0.9333333, 0, 1, 1,
0.8831834, 0.5826265, 1.277039, 0.9372549, 0, 1, 1,
0.8833928, -0.3343459, 0.7603404, 0.945098, 0, 1, 1,
0.890322, 0.6083073, 0.7737318, 0.9490196, 0, 1, 1,
0.8910289, -1.312467, 2.487761, 0.9568627, 0, 1, 1,
0.8938132, -0.3169579, 3.167378, 0.9607843, 0, 1, 1,
0.8957276, 0.4668886, 0.5704773, 0.9686275, 0, 1, 1,
0.9007057, -0.4767388, 1.988116, 0.972549, 0, 1, 1,
0.9042886, 0.6483812, 0.0482273, 0.9803922, 0, 1, 1,
0.9055407, -0.07752743, 0.7538818, 0.9843137, 0, 1, 1,
0.9118774, 1.106074, 2.22905, 0.9921569, 0, 1, 1,
0.9120021, -0.08951713, -0.929287, 0.9960784, 0, 1, 1,
0.913875, 1.030889, 0.3835133, 1, 0, 0.9960784, 1,
0.9238742, 1.026943, 1.061182, 1, 0, 0.9882353, 1,
0.9279161, -0.1218623, 1.063885, 1, 0, 0.9843137, 1,
0.9303102, 1.886918, -0.08368604, 1, 0, 0.9764706, 1,
0.9328314, 1.245158, 0.4881947, 1, 0, 0.972549, 1,
0.9349722, -0.5912295, 1.451032, 1, 0, 0.9647059, 1,
0.93762, -1.798149, 2.710104, 1, 0, 0.9607843, 1,
0.9396943, -1.449322, 2.645881, 1, 0, 0.9529412, 1,
0.9585997, -0.3598596, 2.178735, 1, 0, 0.9490196, 1,
0.970653, -0.03098003, 2.287671, 1, 0, 0.9411765, 1,
0.972108, -0.8617527, 2.488894, 1, 0, 0.9372549, 1,
0.972193, 0.1317369, 0.9887326, 1, 0, 0.9294118, 1,
0.9750822, -1.03515, 2.721524, 1, 0, 0.9254902, 1,
0.982071, 0.5791025, 1.003217, 1, 0, 0.9176471, 1,
1.008804, -0.1463767, 1.805795, 1, 0, 0.9137255, 1,
1.009122, -0.1224742, 0.9085133, 1, 0, 0.9058824, 1,
1.025392, 1.111249, 1.099513, 1, 0, 0.9019608, 1,
1.028448, -1.066743, 1.448446, 1, 0, 0.8941177, 1,
1.032018, -0.7016981, 0.1402255, 1, 0, 0.8862745, 1,
1.03687, 0.1037314, 3.90358, 1, 0, 0.8823529, 1,
1.037638, -0.6001085, 2.255392, 1, 0, 0.8745098, 1,
1.040547, 0.466612, 1.136404, 1, 0, 0.8705882, 1,
1.043188, -0.6609666, 2.309251, 1, 0, 0.8627451, 1,
1.048573, 0.4450431, -0.03199959, 1, 0, 0.8588235, 1,
1.051764, 0.4520049, -1.000094, 1, 0, 0.8509804, 1,
1.052657, 0.7340192, 1.063261, 1, 0, 0.8470588, 1,
1.055127, -0.08894211, 0.5182306, 1, 0, 0.8392157, 1,
1.065694, -0.8114986, 1.900481, 1, 0, 0.8352941, 1,
1.071949, 0.04767669, 0.3446449, 1, 0, 0.827451, 1,
1.072813, 0.1418858, -0.3601534, 1, 0, 0.8235294, 1,
1.084983, -0.7360359, 4.144783, 1, 0, 0.8156863, 1,
1.088253, -0.1613849, 0.333272, 1, 0, 0.8117647, 1,
1.088574, 1.109525, 1.740101, 1, 0, 0.8039216, 1,
1.089054, 1.415911, 1.648643, 1, 0, 0.7960784, 1,
1.094478, 0.596578, 2.787755, 1, 0, 0.7921569, 1,
1.097936, 0.4083785, 1.178583, 1, 0, 0.7843137, 1,
1.100241, 0.003296917, -0.1223338, 1, 0, 0.7803922, 1,
1.104686, 1.641395, 1.079965, 1, 0, 0.772549, 1,
1.120747, -1.216071, 3.163573, 1, 0, 0.7686275, 1,
1.124959, 2.612836, -0.1176347, 1, 0, 0.7607843, 1,
1.137675, -0.4421817, 1.076217, 1, 0, 0.7568628, 1,
1.137929, -0.4273621, 2.565472, 1, 0, 0.7490196, 1,
1.141579, 0.1494003, 1.103887, 1, 0, 0.7450981, 1,
1.143309, 0.001089038, 1.679988, 1, 0, 0.7372549, 1,
1.143902, -1.072929, 1.530748, 1, 0, 0.7333333, 1,
1.145847, 1.25891, 0.7677361, 1, 0, 0.7254902, 1,
1.146354, -0.1023624, 3.01247, 1, 0, 0.7215686, 1,
1.148756, -0.7397414, 0.2301695, 1, 0, 0.7137255, 1,
1.16063, -0.876382, 2.445756, 1, 0, 0.7098039, 1,
1.167283, -1.122788, 2.074101, 1, 0, 0.7019608, 1,
1.17003, 0.4040855, 1.15692, 1, 0, 0.6941177, 1,
1.173551, -1.673571, 3.450707, 1, 0, 0.6901961, 1,
1.177326, -0.7601538, 3.967649, 1, 0, 0.682353, 1,
1.178326, -0.8294535, 2.660681, 1, 0, 0.6784314, 1,
1.185477, 0.4437048, 2.663582, 1, 0, 0.6705883, 1,
1.197052, -1.288067, 2.594492, 1, 0, 0.6666667, 1,
1.198833, -0.1375078, 2.385468, 1, 0, 0.6588235, 1,
1.199304, -1.077379, 2.018332, 1, 0, 0.654902, 1,
1.211955, -0.4783677, 2.084718, 1, 0, 0.6470588, 1,
1.212155, 0.2622744, 2.794588, 1, 0, 0.6431373, 1,
1.217321, -0.1233555, 0.7962158, 1, 0, 0.6352941, 1,
1.23351, 0.8491681, 1.354416, 1, 0, 0.6313726, 1,
1.244726, -0.300131, 1.495736, 1, 0, 0.6235294, 1,
1.247241, -2.116825, 1.074347, 1, 0, 0.6196079, 1,
1.251334, 0.03155913, 3.049533, 1, 0, 0.6117647, 1,
1.254169, 1.96548, 1.259739, 1, 0, 0.6078432, 1,
1.258356, -0.5962163, 1.473906, 1, 0, 0.6, 1,
1.280577, -0.3206788, 0.5467364, 1, 0, 0.5921569, 1,
1.287413, -0.8592676, 1.681206, 1, 0, 0.5882353, 1,
1.290801, -0.641066, 1.39978, 1, 0, 0.5803922, 1,
1.297277, -0.6609274, 2.440837, 1, 0, 0.5764706, 1,
1.309788, 0.1399542, 1.842496, 1, 0, 0.5686275, 1,
1.313323, -0.5204098, 1.830198, 1, 0, 0.5647059, 1,
1.314418, 1.641287, 1.268208, 1, 0, 0.5568628, 1,
1.350854, -0.2417794, 0.9250501, 1, 0, 0.5529412, 1,
1.351835, 0.388051, 0.9563424, 1, 0, 0.5450981, 1,
1.354441, 0.1778878, 1.400446, 1, 0, 0.5411765, 1,
1.354823, -0.5438952, 1.40352, 1, 0, 0.5333334, 1,
1.359356, 0.2837535, 0.382318, 1, 0, 0.5294118, 1,
1.377501, -0.04967555, 1.85332, 1, 0, 0.5215687, 1,
1.382563, 1.133159, -0.1328151, 1, 0, 0.5176471, 1,
1.407188, 1.767291, 0.7426145, 1, 0, 0.509804, 1,
1.410076, 0.3943753, 2.205554, 1, 0, 0.5058824, 1,
1.410207, 0.9435211, 2.585725, 1, 0, 0.4980392, 1,
1.413174, 0.866484, 0.251116, 1, 0, 0.4901961, 1,
1.417565, -0.5154334, 2.712417, 1, 0, 0.4862745, 1,
1.420722, 1.225881, -1.799138, 1, 0, 0.4784314, 1,
1.422718, -1.122095, 2.668437, 1, 0, 0.4745098, 1,
1.432414, -1.318325, 2.494919, 1, 0, 0.4666667, 1,
1.434028, 1.386396, 0.1023174, 1, 0, 0.4627451, 1,
1.437839, 0.7846614, -1.283089, 1, 0, 0.454902, 1,
1.446838, 0.6252644, 1.715572, 1, 0, 0.4509804, 1,
1.448772, 1.635781, 1.496958, 1, 0, 0.4431373, 1,
1.456672, -1.129893, 3.550395, 1, 0, 0.4392157, 1,
1.461335, -0.5513449, 1.276662, 1, 0, 0.4313726, 1,
1.462243, -1.603624, 3.195465, 1, 0, 0.427451, 1,
1.462713, 0.5405617, 0.7132534, 1, 0, 0.4196078, 1,
1.468537, -1.520098, 2.516919, 1, 0, 0.4156863, 1,
1.471845, 0.02353396, 1.21043, 1, 0, 0.4078431, 1,
1.472819, 0.7931679, 1.02998, 1, 0, 0.4039216, 1,
1.478717, -0.2281175, 1.773901, 1, 0, 0.3960784, 1,
1.486552, -0.6060156, 2.73775, 1, 0, 0.3882353, 1,
1.503451, -0.7098675, 2.644852, 1, 0, 0.3843137, 1,
1.505889, 0.1443115, 2.261664, 1, 0, 0.3764706, 1,
1.522313, -0.8753189, 0.9497552, 1, 0, 0.372549, 1,
1.529898, -0.2736943, 1.35352, 1, 0, 0.3647059, 1,
1.534232, -1.423973, 2.564796, 1, 0, 0.3607843, 1,
1.534467, -0.0406618, 1.25687, 1, 0, 0.3529412, 1,
1.537014, -0.8654444, 1.268989, 1, 0, 0.3490196, 1,
1.580382, 0.8215232, 0.5944644, 1, 0, 0.3411765, 1,
1.586274, -0.7419747, 1.504878, 1, 0, 0.3372549, 1,
1.58802, 1.137171, 2.205455, 1, 0, 0.3294118, 1,
1.613912, -0.1670661, 1.479433, 1, 0, 0.3254902, 1,
1.616063, 2.209652, 2.667362, 1, 0, 0.3176471, 1,
1.626295, 0.3114866, -0.1329252, 1, 0, 0.3137255, 1,
1.633024, -1.639597, 1.472176, 1, 0, 0.3058824, 1,
1.642583, 0.3592431, 2.949258, 1, 0, 0.2980392, 1,
1.645636, -2.042534, 3.355923, 1, 0, 0.2941177, 1,
1.654334, 0.08760208, 1.298134, 1, 0, 0.2862745, 1,
1.657696, 0.921825, 0.06880661, 1, 0, 0.282353, 1,
1.66976, 1.443048, 1.035553, 1, 0, 0.2745098, 1,
1.680576, -1.614778, 2.236331, 1, 0, 0.2705882, 1,
1.684935, -0.07940543, 2.028918, 1, 0, 0.2627451, 1,
1.687548, 0.667613, 1.579611, 1, 0, 0.2588235, 1,
1.70164, -0.3666764, 1.924185, 1, 0, 0.2509804, 1,
1.711446, 0.201461, 2.08933, 1, 0, 0.2470588, 1,
1.717249, 0.1051474, 1.08416, 1, 0, 0.2392157, 1,
1.724852, 1.557757, 3.250601, 1, 0, 0.2352941, 1,
1.725535, -0.02275068, 1.921327, 1, 0, 0.227451, 1,
1.790448, 0.05653075, 0.6094094, 1, 0, 0.2235294, 1,
1.795144, 0.021506, 2.597667, 1, 0, 0.2156863, 1,
1.819456, -0.9702106, 3.124348, 1, 0, 0.2117647, 1,
1.854755, 1.907266, -0.5781056, 1, 0, 0.2039216, 1,
1.860807, -0.8305062, 2.835943, 1, 0, 0.1960784, 1,
1.867643, -0.5310206, 1.625531, 1, 0, 0.1921569, 1,
1.876953, 0.2770592, 2.013339, 1, 0, 0.1843137, 1,
1.910911, -0.739102, 0.1924832, 1, 0, 0.1803922, 1,
1.944265, 1.511625, 1.159206, 1, 0, 0.172549, 1,
1.989279, -0.2309422, 1.125987, 1, 0, 0.1686275, 1,
1.998609, 0.303362, 1.302452, 1, 0, 0.1607843, 1,
2.011382, 1.934517, -1.201279, 1, 0, 0.1568628, 1,
2.050648, 0.4854032, 2.632127, 1, 0, 0.1490196, 1,
2.058453, 1.047056, -0.1921781, 1, 0, 0.145098, 1,
2.078882, -2.756673, 1.909514, 1, 0, 0.1372549, 1,
2.097236, 0.1274015, 0.5291412, 1, 0, 0.1333333, 1,
2.164457, 0.3983747, 2.32075, 1, 0, 0.1254902, 1,
2.184375, 0.6713382, 1.347318, 1, 0, 0.1215686, 1,
2.240522, -2.014373, 1.43588, 1, 0, 0.1137255, 1,
2.25802, 1.649558, 1.423781, 1, 0, 0.1098039, 1,
2.266412, -0.09413417, 0.7094033, 1, 0, 0.1019608, 1,
2.279262, -0.8125847, 5.098392, 1, 0, 0.09411765, 1,
2.280009, -0.04887551, 2.102568, 1, 0, 0.09019608, 1,
2.393919, 1.339442, -0.5476285, 1, 0, 0.08235294, 1,
2.398484, 0.8058815, -2.712929, 1, 0, 0.07843138, 1,
2.480547, 1.92333, 0.679302, 1, 0, 0.07058824, 1,
2.528208, 0.9197319, 1.756709, 1, 0, 0.06666667, 1,
2.592487, 0.7712114, 2.700751, 1, 0, 0.05882353, 1,
2.606563, -0.9844738, 3.185173, 1, 0, 0.05490196, 1,
2.614127, 0.5615512, 1.278286, 1, 0, 0.04705882, 1,
2.623293, -0.4873328, 1.807667, 1, 0, 0.04313726, 1,
2.63576, -0.9272271, 3.478174, 1, 0, 0.03529412, 1,
2.725862, -0.7177672, 1.207918, 1, 0, 0.03137255, 1,
2.73198, -0.3429024, 2.066715, 1, 0, 0.02352941, 1,
2.757376, -1.033183, 0.8145858, 1, 0, 0.01960784, 1,
2.863663, 1.74873, 2.09855, 1, 0, 0.01176471, 1,
3.711488, -1.349576, 1.619997, 1, 0, 0.007843138, 1
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
-0.1597542, -4.355086, -7.021788, 0, -0.5, 0.5, 0.5,
-0.1597542, -4.355086, -7.021788, 1, -0.5, 0.5, 0.5,
-0.1597542, -4.355086, -7.021788, 1, 1.5, 0.5, 0.5,
-0.1597542, -4.355086, -7.021788, 0, 1.5, 0.5, 0.5
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
-5.343347, -0.2692065, -7.021788, 0, -0.5, 0.5, 0.5,
-5.343347, -0.2692065, -7.021788, 1, -0.5, 0.5, 0.5,
-5.343347, -0.2692065, -7.021788, 1, 1.5, 0.5, 0.5,
-5.343347, -0.2692065, -7.021788, 0, 1.5, 0.5, 0.5
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
-5.343347, -4.355086, 0.209909, 0, -0.5, 0.5, 0.5,
-5.343347, -4.355086, 0.209909, 1, -0.5, 0.5, 0.5,
-5.343347, -4.355086, 0.209909, 1, 1.5, 0.5, 0.5,
-5.343347, -4.355086, 0.209909, 0, 1.5, 0.5, 0.5
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
-4, -3.412191, -5.352934,
2, -3.412191, -5.352934,
-4, -3.412191, -5.352934,
-4, -3.56934, -5.631077,
-2, -3.412191, -5.352934,
-2, -3.56934, -5.631077,
0, -3.412191, -5.352934,
0, -3.56934, -5.631077,
2, -3.412191, -5.352934,
2, -3.56934, -5.631077
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
"-4",
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
-4, -3.883639, -6.187361, 0, -0.5, 0.5, 0.5,
-4, -3.883639, -6.187361, 1, -0.5, 0.5, 0.5,
-4, -3.883639, -6.187361, 1, 1.5, 0.5, 0.5,
-4, -3.883639, -6.187361, 0, 1.5, 0.5, 0.5,
-2, -3.883639, -6.187361, 0, -0.5, 0.5, 0.5,
-2, -3.883639, -6.187361, 1, -0.5, 0.5, 0.5,
-2, -3.883639, -6.187361, 1, 1.5, 0.5, 0.5,
-2, -3.883639, -6.187361, 0, 1.5, 0.5, 0.5,
0, -3.883639, -6.187361, 0, -0.5, 0.5, 0.5,
0, -3.883639, -6.187361, 1, -0.5, 0.5, 0.5,
0, -3.883639, -6.187361, 1, 1.5, 0.5, 0.5,
0, -3.883639, -6.187361, 0, 1.5, 0.5, 0.5,
2, -3.883639, -6.187361, 0, -0.5, 0.5, 0.5,
2, -3.883639, -6.187361, 1, -0.5, 0.5, 0.5,
2, -3.883639, -6.187361, 1, 1.5, 0.5, 0.5,
2, -3.883639, -6.187361, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-4.147133, -3, -5.352934,
-4.147133, 2, -5.352934,
-4.147133, -3, -5.352934,
-4.346502, -3, -5.631077,
-4.147133, -2, -5.352934,
-4.346502, -2, -5.631077,
-4.147133, -1, -5.352934,
-4.346502, -1, -5.631077,
-4.147133, 0, -5.352934,
-4.346502, 0, -5.631077,
-4.147133, 1, -5.352934,
-4.346502, 1, -5.631077,
-4.147133, 2, -5.352934,
-4.346502, 2, -5.631077
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
-4.74524, -3, -6.187361, 0, -0.5, 0.5, 0.5,
-4.74524, -3, -6.187361, 1, -0.5, 0.5, 0.5,
-4.74524, -3, -6.187361, 1, 1.5, 0.5, 0.5,
-4.74524, -3, -6.187361, 0, 1.5, 0.5, 0.5,
-4.74524, -2, -6.187361, 0, -0.5, 0.5, 0.5,
-4.74524, -2, -6.187361, 1, -0.5, 0.5, 0.5,
-4.74524, -2, -6.187361, 1, 1.5, 0.5, 0.5,
-4.74524, -2, -6.187361, 0, 1.5, 0.5, 0.5,
-4.74524, -1, -6.187361, 0, -0.5, 0.5, 0.5,
-4.74524, -1, -6.187361, 1, -0.5, 0.5, 0.5,
-4.74524, -1, -6.187361, 1, 1.5, 0.5, 0.5,
-4.74524, -1, -6.187361, 0, 1.5, 0.5, 0.5,
-4.74524, 0, -6.187361, 0, -0.5, 0.5, 0.5,
-4.74524, 0, -6.187361, 1, -0.5, 0.5, 0.5,
-4.74524, 0, -6.187361, 1, 1.5, 0.5, 0.5,
-4.74524, 0, -6.187361, 0, 1.5, 0.5, 0.5,
-4.74524, 1, -6.187361, 0, -0.5, 0.5, 0.5,
-4.74524, 1, -6.187361, 1, -0.5, 0.5, 0.5,
-4.74524, 1, -6.187361, 1, 1.5, 0.5, 0.5,
-4.74524, 1, -6.187361, 0, 1.5, 0.5, 0.5,
-4.74524, 2, -6.187361, 0, -0.5, 0.5, 0.5,
-4.74524, 2, -6.187361, 1, -0.5, 0.5, 0.5,
-4.74524, 2, -6.187361, 1, 1.5, 0.5, 0.5,
-4.74524, 2, -6.187361, 0, 1.5, 0.5, 0.5
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
-4.147133, -3.412191, -4,
-4.147133, -3.412191, 4,
-4.147133, -3.412191, -4,
-4.346502, -3.56934, -4,
-4.147133, -3.412191, -2,
-4.346502, -3.56934, -2,
-4.147133, -3.412191, 0,
-4.346502, -3.56934, 0,
-4.147133, -3.412191, 2,
-4.346502, -3.56934, 2,
-4.147133, -3.412191, 4,
-4.346502, -3.56934, 4
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
-4.74524, -3.883639, -4, 0, -0.5, 0.5, 0.5,
-4.74524, -3.883639, -4, 1, -0.5, 0.5, 0.5,
-4.74524, -3.883639, -4, 1, 1.5, 0.5, 0.5,
-4.74524, -3.883639, -4, 0, 1.5, 0.5, 0.5,
-4.74524, -3.883639, -2, 0, -0.5, 0.5, 0.5,
-4.74524, -3.883639, -2, 1, -0.5, 0.5, 0.5,
-4.74524, -3.883639, -2, 1, 1.5, 0.5, 0.5,
-4.74524, -3.883639, -2, 0, 1.5, 0.5, 0.5,
-4.74524, -3.883639, 0, 0, -0.5, 0.5, 0.5,
-4.74524, -3.883639, 0, 1, -0.5, 0.5, 0.5,
-4.74524, -3.883639, 0, 1, 1.5, 0.5, 0.5,
-4.74524, -3.883639, 0, 0, 1.5, 0.5, 0.5,
-4.74524, -3.883639, 2, 0, -0.5, 0.5, 0.5,
-4.74524, -3.883639, 2, 1, -0.5, 0.5, 0.5,
-4.74524, -3.883639, 2, 1, 1.5, 0.5, 0.5,
-4.74524, -3.883639, 2, 0, 1.5, 0.5, 0.5,
-4.74524, -3.883639, 4, 0, -0.5, 0.5, 0.5,
-4.74524, -3.883639, 4, 1, -0.5, 0.5, 0.5,
-4.74524, -3.883639, 4, 1, 1.5, 0.5, 0.5,
-4.74524, -3.883639, 4, 0, 1.5, 0.5, 0.5
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
-4.147133, -3.412191, -5.352934,
-4.147133, 2.873778, -5.352934,
-4.147133, -3.412191, 5.772752,
-4.147133, 2.873778, 5.772752,
-4.147133, -3.412191, -5.352934,
-4.147133, -3.412191, 5.772752,
-4.147133, 2.873778, -5.352934,
-4.147133, 2.873778, 5.772752,
-4.147133, -3.412191, -5.352934,
3.827625, -3.412191, -5.352934,
-4.147133, -3.412191, 5.772752,
3.827625, -3.412191, 5.772752,
-4.147133, 2.873778, -5.352934,
3.827625, 2.873778, -5.352934,
-4.147133, 2.873778, 5.772752,
3.827625, 2.873778, 5.772752,
3.827625, -3.412191, -5.352934,
3.827625, 2.873778, -5.352934,
3.827625, -3.412191, 5.772752,
3.827625, 2.873778, 5.772752,
3.827625, -3.412191, -5.352934,
3.827625, -3.412191, 5.772752,
3.827625, 2.873778, -5.352934,
3.827625, 2.873778, 5.772752
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
var radius = 8.043298;
var distance = 35.78554;
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
mvMatrix.translate( 0.1597542, 0.2692065, -0.209909 );
mvMatrix.scale( 1.090512, 1.383489, 0.781666 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.78554);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
Propineb<-read.table("Propineb.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Propineb$V2
```

```
## Error in eval(expr, envir, enclos): object 'Propineb' not found
```

```r
y<-Propineb$V3
```

```
## Error in eval(expr, envir, enclos): object 'Propineb' not found
```

```r
z<-Propineb$V4
```

```
## Error in eval(expr, envir, enclos): object 'Propineb' not found
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
-4.030996, -0.3409835, -0.7890729, 0, 0, 1, 1, 1,
-3.502424, -0.9683976, -2.741655, 1, 0, 0, 1, 1,
-2.950928, -3.320648, -3.066456, 1, 0, 0, 1, 1,
-2.750677, 0.03535193, 0.3342182, 1, 0, 0, 1, 1,
-2.727597, 0.6732866, -1.163827, 1, 0, 0, 1, 1,
-2.655744, -0.3556632, -3.18456, 1, 0, 0, 1, 1,
-2.530522, -1.619183, -2.472939, 0, 0, 0, 1, 1,
-2.487437, -1.404661, -1.278372, 0, 0, 0, 1, 1,
-2.3356, -0.9367434, -3.140984, 0, 0, 0, 1, 1,
-2.270974, -0.07619537, -1.735079, 0, 0, 0, 1, 1,
-2.26978, 0.4853888, -1.284697, 0, 0, 0, 1, 1,
-2.242325, 0.6834086, -1.711047, 0, 0, 0, 1, 1,
-2.226133, -1.826385, -4.486001, 0, 0, 0, 1, 1,
-2.216885, -0.3742589, -0.5418201, 1, 1, 1, 1, 1,
-2.215556, 1.15823, -2.439878, 1, 1, 1, 1, 1,
-2.156342, -0.2909733, -3.718014, 1, 1, 1, 1, 1,
-2.151467, 0.07954936, -2.523601, 1, 1, 1, 1, 1,
-2.137519, 1.467875, -1.393754, 1, 1, 1, 1, 1,
-2.105775, -0.1148914, -1.373333, 1, 1, 1, 1, 1,
-2.098399, 0.9251779, -1.098574, 1, 1, 1, 1, 1,
-2.050343, 0.9505486, -2.136449, 1, 1, 1, 1, 1,
-2.025669, -2.00783, -2.623013, 1, 1, 1, 1, 1,
-2.007638, 1.257309, -1.716221, 1, 1, 1, 1, 1,
-1.958778, 0.7080224, -0.4502434, 1, 1, 1, 1, 1,
-1.925159, -0.3393045, -1.431378, 1, 1, 1, 1, 1,
-1.899986, 1.945991, -1.836053, 1, 1, 1, 1, 1,
-1.899026, -0.481143, -1.555409, 1, 1, 1, 1, 1,
-1.781382, 0.8168078, -1.833174, 1, 1, 1, 1, 1,
-1.753618, 0.0733102, -1.635072, 0, 0, 1, 1, 1,
-1.745603, 0.11759, -0.9991432, 1, 0, 0, 1, 1,
-1.697251, -0.5138619, -1.722879, 1, 0, 0, 1, 1,
-1.68732, 0.4528756, -1.078152, 1, 0, 0, 1, 1,
-1.68675, -1.040822, -3.92703, 1, 0, 0, 1, 1,
-1.686084, 0.7875332, -1.89249, 1, 0, 0, 1, 1,
-1.663825, -0.1376348, -1.021619, 0, 0, 0, 1, 1,
-1.661987, 0.2484282, -2.814484, 0, 0, 0, 1, 1,
-1.645827, 0.2277564, -1.397351, 0, 0, 0, 1, 1,
-1.642355, 2.107523, -0.05224667, 0, 0, 0, 1, 1,
-1.641088, 0.1688376, -1.848249, 0, 0, 0, 1, 1,
-1.636136, -0.4062743, -0.5218921, 0, 0, 0, 1, 1,
-1.615504, -0.965356, -2.239245, 0, 0, 0, 1, 1,
-1.600135, 0.8902394, -0.447757, 1, 1, 1, 1, 1,
-1.597367, 0.4531652, -0.5113453, 1, 1, 1, 1, 1,
-1.593959, -0.1845171, -2.119383, 1, 1, 1, 1, 1,
-1.582445, 0.7470409, -1.387681, 1, 1, 1, 1, 1,
-1.576265, 0.732429, -1.845839, 1, 1, 1, 1, 1,
-1.571206, -0.6831152, -0.2703016, 1, 1, 1, 1, 1,
-1.569741, 0.9193712, -0.1223477, 1, 1, 1, 1, 1,
-1.552896, 2.020166, -0.01358485, 1, 1, 1, 1, 1,
-1.537534, 2.356201, -1.869404, 1, 1, 1, 1, 1,
-1.534461, -0.5086089, -2.514241, 1, 1, 1, 1, 1,
-1.525043, -0.6889554, -0.5948005, 1, 1, 1, 1, 1,
-1.516826, 2.226871, -1.664468, 1, 1, 1, 1, 1,
-1.505134, 0.1100144, -3.440817, 1, 1, 1, 1, 1,
-1.500576, -0.1681918, -1.169393, 1, 1, 1, 1, 1,
-1.488368, -0.3582503, -1.608193, 1, 1, 1, 1, 1,
-1.487669, -0.822011, -2.000818, 0, 0, 1, 1, 1,
-1.484961, -0.003468936, -1.568854, 1, 0, 0, 1, 1,
-1.482889, 0.3590449, -0.5095998, 1, 0, 0, 1, 1,
-1.479387, 0.7510256, -0.2872896, 1, 0, 0, 1, 1,
-1.463997, -0.3514414, -2.297537, 1, 0, 0, 1, 1,
-1.457606, 0.3560117, -1.563714, 1, 0, 0, 1, 1,
-1.457053, -0.6395784, -2.06555, 0, 0, 0, 1, 1,
-1.453777, -0.1370424, -0.4118217, 0, 0, 0, 1, 1,
-1.446558, 1.51388, -1.779358, 0, 0, 0, 1, 1,
-1.445422, 0.115571, -0.3427676, 0, 0, 0, 1, 1,
-1.441717, 0.05787157, -2.854199, 0, 0, 0, 1, 1,
-1.439039, 0.2724262, -2.827379, 0, 0, 0, 1, 1,
-1.435535, 0.1607693, -3.991765, 0, 0, 0, 1, 1,
-1.422255, 0.8241049, -1.770658, 1, 1, 1, 1, 1,
-1.421105, 0.4188922, -2.412727, 1, 1, 1, 1, 1,
-1.41471, -0.003626564, -1.451424, 1, 1, 1, 1, 1,
-1.414051, 0.8417531, -0.8933637, 1, 1, 1, 1, 1,
-1.413973, -1.556901, -1.870063, 1, 1, 1, 1, 1,
-1.407309, -0.7030988, -0.4082962, 1, 1, 1, 1, 1,
-1.40659, -0.1953823, -3.031068, 1, 1, 1, 1, 1,
-1.404117, 1.194197, -1.985963, 1, 1, 1, 1, 1,
-1.40265, 0.6894965, -2.055952, 1, 1, 1, 1, 1,
-1.401542, 0.8732907, -1.528527, 1, 1, 1, 1, 1,
-1.400661, -0.05587927, -1.654414, 1, 1, 1, 1, 1,
-1.399912, -1.222774, -3.411384, 1, 1, 1, 1, 1,
-1.388073, -0.7005863, -0.8648788, 1, 1, 1, 1, 1,
-1.362403, -0.9454215, -2.135915, 1, 1, 1, 1, 1,
-1.353936, 0.5023008, -2.33885, 1, 1, 1, 1, 1,
-1.353768, -0.03772406, -2.34552, 0, 0, 1, 1, 1,
-1.335629, 0.5450082, -1.431593, 1, 0, 0, 1, 1,
-1.334983, 0.2125931, -0.446337, 1, 0, 0, 1, 1,
-1.33483, -1.77891, -5.062099, 1, 0, 0, 1, 1,
-1.330017, 0.5223408, 0.5882211, 1, 0, 0, 1, 1,
-1.328295, 0.3659717, -1.75195, 1, 0, 0, 1, 1,
-1.326722, 0.3543689, -1.703761, 0, 0, 0, 1, 1,
-1.325861, -1.836192, -2.753002, 0, 0, 0, 1, 1,
-1.321859, -0.665752, -1.179967, 0, 0, 0, 1, 1,
-1.312711, 0.125357, -2.130583, 0, 0, 0, 1, 1,
-1.311236, 0.3303949, -1.038059, 0, 0, 0, 1, 1,
-1.309104, -0.8722782, -2.867306, 0, 0, 0, 1, 1,
-1.303512, -1.307109, -1.573159, 0, 0, 0, 1, 1,
-1.294233, 0.2518793, -1.414404, 1, 1, 1, 1, 1,
-1.280576, 0.7791146, 0.6524748, 1, 1, 1, 1, 1,
-1.278396, 0.2570584, -1.023236, 1, 1, 1, 1, 1,
-1.274389, 1.079595, -1.55012, 1, 1, 1, 1, 1,
-1.265098, 1.128332, 0.837351, 1, 1, 1, 1, 1,
-1.25484, 0.09395693, -0.4713301, 1, 1, 1, 1, 1,
-1.245472, -0.452853, -1.163463, 1, 1, 1, 1, 1,
-1.239007, -0.3091932, -0.6609524, 1, 1, 1, 1, 1,
-1.224152, 0.8279192, -0.7073923, 1, 1, 1, 1, 1,
-1.219286, -0.07304379, -0.653764, 1, 1, 1, 1, 1,
-1.203065, -0.9810752, -1.033199, 1, 1, 1, 1, 1,
-1.193052, 0.3627818, -3.024822, 1, 1, 1, 1, 1,
-1.182647, -0.3212948, -1.617481, 1, 1, 1, 1, 1,
-1.177905, -2.389864, -3.664314, 1, 1, 1, 1, 1,
-1.175725, -0.7754201, -3.677207, 1, 1, 1, 1, 1,
-1.172619, -0.476666, -1.967916, 0, 0, 1, 1, 1,
-1.172407, 0.8222193, -0.9862502, 1, 0, 0, 1, 1,
-1.162624, 0.2871095, -0.2784108, 1, 0, 0, 1, 1,
-1.159392, -0.1713979, -2.284099, 1, 0, 0, 1, 1,
-1.157061, 0.9268271, -0.8822963, 1, 0, 0, 1, 1,
-1.155606, -0.4338903, -0.9406556, 1, 0, 0, 1, 1,
-1.146741, 0.9049379, -0.3551348, 0, 0, 0, 1, 1,
-1.141549, -0.06491805, -3.292301, 0, 0, 0, 1, 1,
-1.133889, 0.2999496, 0.2371531, 0, 0, 0, 1, 1,
-1.129584, 1.488025, -1.025407, 0, 0, 0, 1, 1,
-1.122628, 0.4044075, -2.719353, 0, 0, 0, 1, 1,
-1.119701, -0.3208156, -2.349039, 0, 0, 0, 1, 1,
-1.117811, 0.5840824, -1.949115, 0, 0, 0, 1, 1,
-1.116648, -1.095886, -2.413458, 1, 1, 1, 1, 1,
-1.110149, -0.2126357, -1.68566, 1, 1, 1, 1, 1,
-1.103483, 0.3461125, -1.083922, 1, 1, 1, 1, 1,
-1.098523, -0.9295164, -1.063344, 1, 1, 1, 1, 1,
-1.094606, 0.5248607, -2.030348, 1, 1, 1, 1, 1,
-1.085222, 0.9823273, -1.795747, 1, 1, 1, 1, 1,
-1.079172, -0.03207264, -1.396458, 1, 1, 1, 1, 1,
-1.071976, 0.4266604, 0.6300873, 1, 1, 1, 1, 1,
-1.0653, -1.101335, -2.512865, 1, 1, 1, 1, 1,
-1.058331, 0.649623, -3.532565, 1, 1, 1, 1, 1,
-1.05518, -1.361273, -0.8210809, 1, 1, 1, 1, 1,
-1.04612, 0.05486398, -1.134741, 1, 1, 1, 1, 1,
-1.045482, -1.210778, -3.24727, 1, 1, 1, 1, 1,
-1.042466, -0.4053122, -3.293658, 1, 1, 1, 1, 1,
-1.040996, 0.4735304, -1.879359, 1, 1, 1, 1, 1,
-1.026972, -2.168745, -1.310668, 0, 0, 1, 1, 1,
-1.01424, 0.6260713, -1.57548, 1, 0, 0, 1, 1,
-1.012226, -0.2941645, -1.661872, 1, 0, 0, 1, 1,
-1.011999, -1.124121, -1.211303, 1, 0, 0, 1, 1,
-1.004355, -0.5048399, -0.5442497, 1, 0, 0, 1, 1,
-0.9986463, -2.508119, -2.613141, 1, 0, 0, 1, 1,
-0.9915349, 0.1296033, -0.5835083, 0, 0, 0, 1, 1,
-0.9829221, -0.6380424, -1.455424, 0, 0, 0, 1, 1,
-0.9824972, 0.3666657, -1.755136, 0, 0, 0, 1, 1,
-0.9694295, 1.50735, 0.3488507, 0, 0, 0, 1, 1,
-0.9678821, 0.6228232, -0.7770169, 0, 0, 0, 1, 1,
-0.9666966, 0.2624263, -1.08333, 0, 0, 0, 1, 1,
-0.9657217, -0.5182794, -2.373161, 0, 0, 0, 1, 1,
-0.9505371, 0.04193342, -0.6930659, 1, 1, 1, 1, 1,
-0.9495229, -1.06804, -2.129192, 1, 1, 1, 1, 1,
-0.9439051, 0.4395961, -1.743464, 1, 1, 1, 1, 1,
-0.941803, -1.709777, -1.296138, 1, 1, 1, 1, 1,
-0.9401085, -0.3177598, -2.889737, 1, 1, 1, 1, 1,
-0.9286978, 0.1458799, -1.255855, 1, 1, 1, 1, 1,
-0.9264137, 0.8632585, -0.9598929, 1, 1, 1, 1, 1,
-0.9233475, -0.2782318, -2.977853, 1, 1, 1, 1, 1,
-0.9194291, -0.8897046, -3.697819, 1, 1, 1, 1, 1,
-0.9153777, -0.1543805, -2.223267, 1, 1, 1, 1, 1,
-0.913304, 0.2395599, -2.941714, 1, 1, 1, 1, 1,
-0.9041275, 0.1997723, -1.294671, 1, 1, 1, 1, 1,
-0.9008451, -0.9275533, -2.955039, 1, 1, 1, 1, 1,
-0.8973774, -2.593152, -3.013085, 1, 1, 1, 1, 1,
-0.8933441, 0.6553473, -0.7384654, 1, 1, 1, 1, 1,
-0.8884044, 0.6146712, 0.4075701, 0, 0, 1, 1, 1,
-0.8870005, -1.56676, -3.669441, 1, 0, 0, 1, 1,
-0.8806255, -0.1937383, 0.207481, 1, 0, 0, 1, 1,
-0.8756379, 1.221055, -0.302652, 1, 0, 0, 1, 1,
-0.87508, -0.430303, -1.578406, 1, 0, 0, 1, 1,
-0.8720396, 1.525837, 1.406899, 1, 0, 0, 1, 1,
-0.8696013, 0.4301477, -1.985352, 0, 0, 0, 1, 1,
-0.8690508, -0.4234692, -2.547681, 0, 0, 0, 1, 1,
-0.8659935, 0.7727411, 0.4878377, 0, 0, 0, 1, 1,
-0.8621351, 1.790761, -1.122244, 0, 0, 0, 1, 1,
-0.862123, -0.3946377, -5.19091, 0, 0, 0, 1, 1,
-0.8567231, 0.2127664, -0.1389532, 0, 0, 0, 1, 1,
-0.8413747, -2.060843, -3.634448, 0, 0, 0, 1, 1,
-0.8396994, 0.2672613, -2.981574, 1, 1, 1, 1, 1,
-0.8362036, 0.1475168, -1.746696, 1, 1, 1, 1, 1,
-0.8344865, 0.3364444, -0.3591185, 1, 1, 1, 1, 1,
-0.8328602, -0.9911227, -2.435108, 1, 1, 1, 1, 1,
-0.832471, -0.139158, -2.195266, 1, 1, 1, 1, 1,
-0.8282338, 0.721024, 0.03703434, 1, 1, 1, 1, 1,
-0.822253, 0.4501715, -2.003278, 1, 1, 1, 1, 1,
-0.819298, 2.599989, 0.5946651, 1, 1, 1, 1, 1,
-0.8182771, -1.085682, -1.422785, 1, 1, 1, 1, 1,
-0.8156703, -0.4475257, -2.635849, 1, 1, 1, 1, 1,
-0.8156295, -0.32649, -2.735344, 1, 1, 1, 1, 1,
-0.8135027, 1.608561, -1.782848, 1, 1, 1, 1, 1,
-0.8127004, 0.9902341, 0.1299746, 1, 1, 1, 1, 1,
-0.8112847, -1.07693, -0.8554458, 1, 1, 1, 1, 1,
-0.8112556, 0.1313187, -2.009932, 1, 1, 1, 1, 1,
-0.810876, 0.03437954, -2.165237, 0, 0, 1, 1, 1,
-0.8101504, -1.342846, -1.960616, 1, 0, 0, 1, 1,
-0.8076874, -0.4000419, -1.88365, 1, 0, 0, 1, 1,
-0.8063459, -0.5318295, -0.4862271, 1, 0, 0, 1, 1,
-0.8033363, -0.5592087, -4.938798, 1, 0, 0, 1, 1,
-0.8010564, -0.4796996, -3.115398, 1, 0, 0, 1, 1,
-0.8000465, -2.542349, -3.910695, 0, 0, 0, 1, 1,
-0.7949708, 0.4023888, -2.278296, 0, 0, 0, 1, 1,
-0.7936253, 1.304999, -2.017669, 0, 0, 0, 1, 1,
-0.7827384, 0.7233582, 1.113104, 0, 0, 0, 1, 1,
-0.7812592, -0.004377058, -1.202501, 0, 0, 0, 1, 1,
-0.7799082, -0.2062269, -0.676928, 0, 0, 0, 1, 1,
-0.7734571, -0.4929908, -3.800045, 0, 0, 0, 1, 1,
-0.7679238, 0.7305417, -2.901736, 1, 1, 1, 1, 1,
-0.7648192, -0.5579, -2.519727, 1, 1, 1, 1, 1,
-0.763474, 1.211231, -1.869344, 1, 1, 1, 1, 1,
-0.7601803, 0.04349764, -1.227614, 1, 1, 1, 1, 1,
-0.7588299, -1.119144, -2.611006, 1, 1, 1, 1, 1,
-0.7577138, -1.024149, -1.650011, 1, 1, 1, 1, 1,
-0.7565298, -1.476097, -2.048782, 1, 1, 1, 1, 1,
-0.7557191, 0.002537164, -2.104136, 1, 1, 1, 1, 1,
-0.7510064, -0.1316545, -3.211427, 1, 1, 1, 1, 1,
-0.7499204, 1.043186, -1.031752, 1, 1, 1, 1, 1,
-0.7492271, -0.2090195, -1.48104, 1, 1, 1, 1, 1,
-0.7486802, -0.7234042, -3.605389, 1, 1, 1, 1, 1,
-0.7419612, 0.04888525, -4.008187, 1, 1, 1, 1, 1,
-0.7405909, 0.3980126, -0.5754722, 1, 1, 1, 1, 1,
-0.7273636, 0.7922184, -0.04524201, 1, 1, 1, 1, 1,
-0.7260519, -0.2462658, -3.822008, 0, 0, 1, 1, 1,
-0.7236731, -0.4665547, -3.393234, 1, 0, 0, 1, 1,
-0.713978, -1.584253, -3.370608, 1, 0, 0, 1, 1,
-0.7125183, -0.5391994, -3.299476, 1, 0, 0, 1, 1,
-0.7098327, -0.177585, -0.002556752, 1, 0, 0, 1, 1,
-0.7039319, -0.1124006, -2.701721, 1, 0, 0, 1, 1,
-0.7030806, -1.046214, -1.72643, 0, 0, 0, 1, 1,
-0.6997977, 0.1991454, -0.4263791, 0, 0, 0, 1, 1,
-0.697476, 0.3317097, -1.058244, 0, 0, 0, 1, 1,
-0.6956984, -0.01551771, -2.429161, 0, 0, 0, 1, 1,
-0.6947722, 0.3936431, -0.03529584, 0, 0, 0, 1, 1,
-0.6892147, 0.6616479, -0.8972471, 0, 0, 0, 1, 1,
-0.6849727, 1.290067, 0.0253957, 0, 0, 0, 1, 1,
-0.6847012, 0.147449, -1.792692, 1, 1, 1, 1, 1,
-0.6841298, -0.06835533, -0.2932269, 1, 1, 1, 1, 1,
-0.6826867, 0.2716175, -2.914875, 1, 1, 1, 1, 1,
-0.6824731, -0.9002188, -1.4342, 1, 1, 1, 1, 1,
-0.6789852, 0.0024738, -2.068069, 1, 1, 1, 1, 1,
-0.6772046, -1.349007, -3.326311, 1, 1, 1, 1, 1,
-0.6771621, -0.5623386, -1.311727, 1, 1, 1, 1, 1,
-0.6764137, 1.480606, 0.6065527, 1, 1, 1, 1, 1,
-0.6747974, 0.08379672, -1.894331, 1, 1, 1, 1, 1,
-0.6725085, -0.2043077, -2.11583, 1, 1, 1, 1, 1,
-0.6627297, 1.655353, 1.37079, 1, 1, 1, 1, 1,
-0.660763, 0.760233, 0.5996151, 1, 1, 1, 1, 1,
-0.6602103, 0.8369157, -0.4160536, 1, 1, 1, 1, 1,
-0.6598591, -2.430444, -4.096934, 1, 1, 1, 1, 1,
-0.6592435, 0.2062901, -1.828671, 1, 1, 1, 1, 1,
-0.6522369, 0.647542, -0.3058189, 0, 0, 1, 1, 1,
-0.652204, 0.976912, -0.08852795, 1, 0, 0, 1, 1,
-0.649797, -0.4922263, -2.686465, 1, 0, 0, 1, 1,
-0.6486176, 1.262362, -1.188997, 1, 0, 0, 1, 1,
-0.6454073, 0.09707893, -1.016487, 1, 0, 0, 1, 1,
-0.6421531, 1.747559, -0.9570857, 1, 0, 0, 1, 1,
-0.6343658, 1.073444, -0.5349143, 0, 0, 0, 1, 1,
-0.6340858, 1.397128, -0.6358254, 0, 0, 0, 1, 1,
-0.6338845, -0.8492831, -2.722369, 0, 0, 0, 1, 1,
-0.6283405, -1.865899, -2.941456, 0, 0, 0, 1, 1,
-0.6281008, -0.5969657, -4.995116, 0, 0, 0, 1, 1,
-0.6262345, 1.039107, -0.6017212, 0, 0, 0, 1, 1,
-0.6261155, 0.316718, -0.797036, 0, 0, 0, 1, 1,
-0.6253831, 0.03032195, -0.8968929, 1, 1, 1, 1, 1,
-0.6234335, -0.3871877, -2.47247, 1, 1, 1, 1, 1,
-0.61617, -0.6320215, -1.661379, 1, 1, 1, 1, 1,
-0.6149271, 1.425031, -0.7495093, 1, 1, 1, 1, 1,
-0.6137128, 0.7427768, -1.671653, 1, 1, 1, 1, 1,
-0.6105971, -1.202709, -3.212713, 1, 1, 1, 1, 1,
-0.6103041, -1.557769, -3.122384, 1, 1, 1, 1, 1,
-0.6092558, 1.684716, -0.8386602, 1, 1, 1, 1, 1,
-0.6086181, 0.3644588, 0.003529989, 1, 1, 1, 1, 1,
-0.6065899, 2.062245, 0.2888979, 1, 1, 1, 1, 1,
-0.6051551, 1.192874, -0.9698083, 1, 1, 1, 1, 1,
-0.6000568, -0.1843975, -1.702379, 1, 1, 1, 1, 1,
-0.598915, -0.7677161, -0.8592415, 1, 1, 1, 1, 1,
-0.585614, 1.293528, -0.6251525, 1, 1, 1, 1, 1,
-0.5847793, -0.7846531, -3.959891, 1, 1, 1, 1, 1,
-0.5764323, -0.2047541, -0.2722988, 0, 0, 1, 1, 1,
-0.5761568, -1.276675, -3.478945, 1, 0, 0, 1, 1,
-0.5738697, 1.509126, -0.03391898, 1, 0, 0, 1, 1,
-0.5691019, -1.702683, -2.021942, 1, 0, 0, 1, 1,
-0.5638232, 1.093694, -0.5322561, 1, 0, 0, 1, 1,
-0.561494, 0.6046046, 0.6934445, 1, 0, 0, 1, 1,
-0.5582934, 2.012935, -0.6289687, 0, 0, 0, 1, 1,
-0.5504035, 0.1904768, 0.1672439, 0, 0, 0, 1, 1,
-0.5483963, -0.1305856, -2.479056, 0, 0, 0, 1, 1,
-0.5465034, 0.3933745, -1.888742, 0, 0, 0, 1, 1,
-0.5406935, 0.2917717, 0.9152235, 0, 0, 0, 1, 1,
-0.5398585, -2.272156, -3.330458, 0, 0, 0, 1, 1,
-0.5396703, -0.1139591, -1.901332, 0, 0, 0, 1, 1,
-0.5379475, -0.6072131, -2.221115, 1, 1, 1, 1, 1,
-0.5375288, -1.172176, -4.876271, 1, 1, 1, 1, 1,
-0.5365683, 1.228265, -0.6465377, 1, 1, 1, 1, 1,
-0.5362349, -1.675862, -2.611454, 1, 1, 1, 1, 1,
-0.5356076, -0.1941136, -0.8814574, 1, 1, 1, 1, 1,
-0.5346891, -0.4679092, -1.269056, 1, 1, 1, 1, 1,
-0.5346231, -1.100579, -2.692415, 1, 1, 1, 1, 1,
-0.5342584, 0.659775, 0.2949581, 1, 1, 1, 1, 1,
-0.527602, 1.262482, -0.4144151, 1, 1, 1, 1, 1,
-0.5253241, 1.425727, -0.6673425, 1, 1, 1, 1, 1,
-0.5238461, 2.016016, 1.082596, 1, 1, 1, 1, 1,
-0.5231143, 1.433305, -2.020823, 1, 1, 1, 1, 1,
-0.5231002, 0.9806439, -1.126557, 1, 1, 1, 1, 1,
-0.5220426, 1.485299, 0.1598073, 1, 1, 1, 1, 1,
-0.5180326, -1.020019, -2.397761, 1, 1, 1, 1, 1,
-0.5167913, -0.9820903, -0.03163196, 0, 0, 1, 1, 1,
-0.5140989, -1.440409, -3.008038, 1, 0, 0, 1, 1,
-0.5135424, -0.6247878, -0.6871252, 1, 0, 0, 1, 1,
-0.5117322, -0.5398549, -2.396713, 1, 0, 0, 1, 1,
-0.5097021, -0.8137324, -2.299159, 1, 0, 0, 1, 1,
-0.5055694, 1.762032, 0.1351825, 1, 0, 0, 1, 1,
-0.5033608, 1.667723, 0.9053076, 0, 0, 0, 1, 1,
-0.5020265, 0.1036993, -1.878109, 0, 0, 0, 1, 1,
-0.5013843, 0.4187722, -1.626558, 0, 0, 0, 1, 1,
-0.5000413, 0.6152833, -0.5904539, 0, 0, 0, 1, 1,
-0.4996775, 0.3587849, -2.421674, 0, 0, 0, 1, 1,
-0.4978552, -1.824721, -1.491652, 0, 0, 0, 1, 1,
-0.4974906, 0.8405557, 0.2568564, 0, 0, 0, 1, 1,
-0.4958082, 0.4808804, -0.560513, 1, 1, 1, 1, 1,
-0.4922264, 1.274471, 0.863903, 1, 1, 1, 1, 1,
-0.49123, -0.09884527, -3.984433, 1, 1, 1, 1, 1,
-0.4908157, -1.373275, -2.502513, 1, 1, 1, 1, 1,
-0.490336, -1.072915, -4.175466, 1, 1, 1, 1, 1,
-0.4867124, 0.06672306, -1.280319, 1, 1, 1, 1, 1,
-0.4855441, -0.7035089, -2.810115, 1, 1, 1, 1, 1,
-0.4852037, -1.983297, -4.862285, 1, 1, 1, 1, 1,
-0.4826589, -0.4840567, -2.266221, 1, 1, 1, 1, 1,
-0.4723789, 0.07497872, -1.965892, 1, 1, 1, 1, 1,
-0.466502, -0.9423385, -2.472306, 1, 1, 1, 1, 1,
-0.4615277, 0.6017634, -1.074694, 1, 1, 1, 1, 1,
-0.4601235, -1.030481, -3.431068, 1, 1, 1, 1, 1,
-0.458715, -0.2180978, -1.758532, 1, 1, 1, 1, 1,
-0.4569826, 2.216681, 0.1538687, 1, 1, 1, 1, 1,
-0.4565009, 0.1295804, -1.661496, 0, 0, 1, 1, 1,
-0.4514409, 0.8832859, -1.589108, 1, 0, 0, 1, 1,
-0.4465993, 0.5511817, 0.2602881, 1, 0, 0, 1, 1,
-0.4463691, -1.848962, -4.176584, 1, 0, 0, 1, 1,
-0.443699, -2.028567, -3.270316, 1, 0, 0, 1, 1,
-0.442258, -1.59365, -3.540239, 1, 0, 0, 1, 1,
-0.4419345, 0.7054424, 0.3029304, 0, 0, 0, 1, 1,
-0.4390177, 1.415333, 1.279128, 0, 0, 0, 1, 1,
-0.4382034, 2.288201, -1.852855, 0, 0, 0, 1, 1,
-0.4363434, -0.7756562, -0.6561636, 0, 0, 0, 1, 1,
-0.4361545, -0.0005617561, -1.999508, 0, 0, 0, 1, 1,
-0.4347072, -0.6534998, -3.305179, 0, 0, 0, 1, 1,
-0.4308635, 0.1219319, -0.3492279, 0, 0, 0, 1, 1,
-0.4227556, -0.1355293, -0.5573029, 1, 1, 1, 1, 1,
-0.4222594, 0.5285904, -1.401776, 1, 1, 1, 1, 1,
-0.4173754, -1.053949, -3.761151, 1, 1, 1, 1, 1,
-0.4162723, 1.02131, -0.1584008, 1, 1, 1, 1, 1,
-0.4150232, -1.051471, -2.739302, 1, 1, 1, 1, 1,
-0.4100795, 0.4540455, -1.810038, 1, 1, 1, 1, 1,
-0.4095, -0.7484195, -2.851694, 1, 1, 1, 1, 1,
-0.4059295, -0.04901294, -0.191244, 1, 1, 1, 1, 1,
-0.3983509, 1.081576, -1.697038, 1, 1, 1, 1, 1,
-0.3943317, 0.06218583, 1.7437, 1, 1, 1, 1, 1,
-0.3931351, 0.133843, -0.2089895, 1, 1, 1, 1, 1,
-0.3872403, 1.179149, -0.2798478, 1, 1, 1, 1, 1,
-0.3859041, 0.2163036, -2.460625, 1, 1, 1, 1, 1,
-0.3802624, 0.8581795, -0.7760426, 1, 1, 1, 1, 1,
-0.3756255, 0.426979, -1.446981, 1, 1, 1, 1, 1,
-0.3748302, -0.9089882, -2.634526, 0, 0, 1, 1, 1,
-0.3733405, -2.015169, -3.586733, 1, 0, 0, 1, 1,
-0.3705267, 0.8142272, -1.241042, 1, 0, 0, 1, 1,
-0.3704193, -1.478292, -2.755205, 1, 0, 0, 1, 1,
-0.3660423, -0.8887877, -3.118148, 1, 0, 0, 1, 1,
-0.3632379, -0.1209003, -2.44762, 1, 0, 0, 1, 1,
-0.3631826, -1.495884, -3.161898, 0, 0, 0, 1, 1,
-0.3604325, 0.4658408, 1.19125, 0, 0, 0, 1, 1,
-0.3573829, 0.3383296, -0.4990342, 0, 0, 0, 1, 1,
-0.3572209, -0.5550543, -1.534769, 0, 0, 0, 1, 1,
-0.3546866, -0.2040226, -2.001572, 0, 0, 0, 1, 1,
-0.3524368, -1.118626, -3.940951, 0, 0, 0, 1, 1,
-0.3520003, 0.6842191, -0.1915753, 0, 0, 0, 1, 1,
-0.3476599, 0.8289616, -2.293917, 1, 1, 1, 1, 1,
-0.342714, -0.1025671, -3.695028, 1, 1, 1, 1, 1,
-0.3421271, 0.4906335, -2.54388, 1, 1, 1, 1, 1,
-0.3377837, -0.2235987, -2.276881, 1, 1, 1, 1, 1,
-0.3370253, 0.4255268, -2.899928, 1, 1, 1, 1, 1,
-0.3310721, -1.983288, -3.246049, 1, 1, 1, 1, 1,
-0.3226029, 0.5457495, -0.5329574, 1, 1, 1, 1, 1,
-0.3190201, 0.2224917, -1.25308, 1, 1, 1, 1, 1,
-0.3186485, -0.6309955, -1.568744, 1, 1, 1, 1, 1,
-0.3168247, 0.9520162, -1.501301, 1, 1, 1, 1, 1,
-0.3116269, -0.4488985, -3.803604, 1, 1, 1, 1, 1,
-0.3109445, 1.239364, 0.01184515, 1, 1, 1, 1, 1,
-0.3107607, 0.1393235, -1.237988, 1, 1, 1, 1, 1,
-0.309818, -0.9145535, -2.963147, 1, 1, 1, 1, 1,
-0.3085136, -1.460225, -2.640525, 1, 1, 1, 1, 1,
-0.3079014, 1.1162, -1.216263, 0, 0, 1, 1, 1,
-0.2990711, -0.8371117, -3.076658, 1, 0, 0, 1, 1,
-0.2965862, -0.9334055, -2.4803, 1, 0, 0, 1, 1,
-0.2939949, -1.413652, -2.302562, 1, 0, 0, 1, 1,
-0.2919949, -0.2768507, -2.793109, 1, 0, 0, 1, 1,
-0.2884395, 0.08718644, -0.2383349, 1, 0, 0, 1, 1,
-0.2861231, 0.3619637, 0.182261, 0, 0, 0, 1, 1,
-0.2816515, -1.345428, -1.261095, 0, 0, 0, 1, 1,
-0.2815528, 0.260968, -1.348448, 0, 0, 0, 1, 1,
-0.2804135, -0.8533081, -3.231654, 0, 0, 0, 1, 1,
-0.2720964, 1.212133, 1.184199, 0, 0, 0, 1, 1,
-0.266158, 0.1116531, -0.1719145, 0, 0, 0, 1, 1,
-0.2614932, 0.0463168, -1.711754, 0, 0, 0, 1, 1,
-0.2614422, 0.5658005, 0.6267433, 1, 1, 1, 1, 1,
-0.2583154, -1.828208, -2.822058, 1, 1, 1, 1, 1,
-0.2522605, -0.8306323, -4.756663, 1, 1, 1, 1, 1,
-0.2515408, 1.234301, 0.5704059, 1, 1, 1, 1, 1,
-0.248102, 1.351731, 1.063346, 1, 1, 1, 1, 1,
-0.2437188, -1.308859, -2.52596, 1, 1, 1, 1, 1,
-0.2432458, 0.2140638, -1.749943, 1, 1, 1, 1, 1,
-0.2373216, -1.129474, -3.17971, 1, 1, 1, 1, 1,
-0.2355118, -1.016932, -3.633619, 1, 1, 1, 1, 1,
-0.234178, -0.3414496, -3.271066, 1, 1, 1, 1, 1,
-0.2337528, -0.8289306, -1.830749, 1, 1, 1, 1, 1,
-0.2307752, 0.4314085, -0.09719589, 1, 1, 1, 1, 1,
-0.2285071, -0.5867006, -2.285279, 1, 1, 1, 1, 1,
-0.2216977, 1.292199, 0.4477409, 1, 1, 1, 1, 1,
-0.2161831, -0.5424094, -2.6349, 1, 1, 1, 1, 1,
-0.2150112, -0.3760386, -2.780924, 0, 0, 1, 1, 1,
-0.213004, 0.8437777, -1.685773, 1, 0, 0, 1, 1,
-0.2094944, 0.2100774, -0.4750811, 1, 0, 0, 1, 1,
-0.2082673, -0.965574, -3.674421, 1, 0, 0, 1, 1,
-0.1957351, -1.046222, -1.316942, 1, 0, 0, 1, 1,
-0.1950502, -0.2281043, -2.133202, 1, 0, 0, 1, 1,
-0.1924905, -0.791351, -2.252956, 0, 0, 0, 1, 1,
-0.1911243, 0.7651854, -0.9137526, 0, 0, 0, 1, 1,
-0.1888455, -1.701031, -4.099326, 0, 0, 0, 1, 1,
-0.1867894, -0.3279541, -3.204499, 0, 0, 0, 1, 1,
-0.1808417, 0.7325984, 0.6422812, 0, 0, 0, 1, 1,
-0.1788107, -0.4089269, -0.8545353, 0, 0, 0, 1, 1,
-0.1784822, -1.103191, -4.630568, 0, 0, 0, 1, 1,
-0.1783594, 0.4870666, -0.07006817, 1, 1, 1, 1, 1,
-0.175729, 0.2046871, -0.8309389, 1, 1, 1, 1, 1,
-0.1754248, 1.891697, 0.226568, 1, 1, 1, 1, 1,
-0.1733221, -1.113234, -2.327148, 1, 1, 1, 1, 1,
-0.1725782, -1.445704, -4.195348, 1, 1, 1, 1, 1,
-0.1716155, -0.02864997, -2.143134, 1, 1, 1, 1, 1,
-0.171057, 0.05748845, 0.3159609, 1, 1, 1, 1, 1,
-0.1692948, -1.232473, -2.471987, 1, 1, 1, 1, 1,
-0.1673598, -0.406331, -2.557684, 1, 1, 1, 1, 1,
-0.167162, 0.8489841, -0.5685251, 1, 1, 1, 1, 1,
-0.1635102, -0.7431638, -3.585824, 1, 1, 1, 1, 1,
-0.16291, -0.4752409, -2.154139, 1, 1, 1, 1, 1,
-0.1607664, 0.954309, 1.566886, 1, 1, 1, 1, 1,
-0.160176, 1.256311, 0.2756414, 1, 1, 1, 1, 1,
-0.1596294, 0.2257746, -0.6883643, 1, 1, 1, 1, 1,
-0.1585813, -0.09194332, -2.922854, 0, 0, 1, 1, 1,
-0.1581146, -0.4125346, -3.100611, 1, 0, 0, 1, 1,
-0.1553947, 0.285127, 0.01234437, 1, 0, 0, 1, 1,
-0.1547167, 0.2566953, -0.5214444, 1, 0, 0, 1, 1,
-0.1519158, -1.967721, -3.403728, 1, 0, 0, 1, 1,
-0.1506111, -0.4234141, -1.935455, 1, 0, 0, 1, 1,
-0.1473552, 0.8540766, -1.697569, 0, 0, 0, 1, 1,
-0.1401086, 0.9444069, -1.348613, 0, 0, 0, 1, 1,
-0.1392233, -0.5659503, -1.754263, 0, 0, 0, 1, 1,
-0.1388487, 0.4814069, -0.8387225, 0, 0, 0, 1, 1,
-0.1383728, -0.6592478, -3.55461, 0, 0, 0, 1, 1,
-0.1359566, -0.732707, -2.564326, 0, 0, 0, 1, 1,
-0.1354717, 0.9181754, 0.04112516, 0, 0, 0, 1, 1,
-0.1328894, -0.7519976, -3.164666, 1, 1, 1, 1, 1,
-0.131481, 2.012607, 0.8521856, 1, 1, 1, 1, 1,
-0.130257, 1.629867, -0.3960919, 1, 1, 1, 1, 1,
-0.1258147, 1.279663, 1.932949, 1, 1, 1, 1, 1,
-0.1201496, 1.207144, 0.97034, 1, 1, 1, 1, 1,
-0.1194221, -0.7830348, -2.846417, 1, 1, 1, 1, 1,
-0.1188483, -0.8151186, -3.786214, 1, 1, 1, 1, 1,
-0.1169776, -0.02488581, -1.97373, 1, 1, 1, 1, 1,
-0.116746, 1.356101, -0.640299, 1, 1, 1, 1, 1,
-0.1104858, 0.7013603, -1.307518, 1, 1, 1, 1, 1,
-0.105987, -1.684858, -3.71034, 1, 1, 1, 1, 1,
-0.09458419, -1.646558, -2.520303, 1, 1, 1, 1, 1,
-0.09407307, 1.076698, 0.0507303, 1, 1, 1, 1, 1,
-0.08901189, 0.5629166, -0.4008811, 1, 1, 1, 1, 1,
-0.08824237, -0.1525371, -3.538532, 1, 1, 1, 1, 1,
-0.08805929, 0.9691108, 0.1767211, 0, 0, 1, 1, 1,
-0.08689209, 2.782235, 1.193446, 1, 0, 0, 1, 1,
-0.08583254, 1.594433, 0.7084577, 1, 0, 0, 1, 1,
-0.08218946, -0.7823788, -2.304114, 1, 0, 0, 1, 1,
-0.08161692, 1.482951, -0.6713569, 1, 0, 0, 1, 1,
-0.07835995, 0.2279281, 0.09719039, 1, 0, 0, 1, 1,
-0.07674585, -0.5873433, -1.736977, 0, 0, 0, 1, 1,
-0.07569828, -0.3181233, -3.157434, 0, 0, 0, 1, 1,
-0.07211073, -1.42084, -2.892746, 0, 0, 0, 1, 1,
-0.06833224, 0.03699557, 0.3891602, 0, 0, 0, 1, 1,
-0.06506623, -0.1457818, -2.146627, 0, 0, 0, 1, 1,
-0.0646515, 0.6266595, -1.368183, 0, 0, 0, 1, 1,
-0.0618915, 1.029652, -2.509358, 0, 0, 0, 1, 1,
-0.06073902, 0.3736512, -0.02433994, 1, 1, 1, 1, 1,
-0.05342143, -0.5798488, -1.845764, 1, 1, 1, 1, 1,
-0.0519799, -1.997135, -1.932276, 1, 1, 1, 1, 1,
-0.04779062, 0.7428241, -0.1748765, 1, 1, 1, 1, 1,
-0.04648585, 0.02287333, -1.383519, 1, 1, 1, 1, 1,
-0.03716264, -0.9023163, -4.585019, 1, 1, 1, 1, 1,
-0.0306343, -0.631574, -3.004207, 1, 1, 1, 1, 1,
-0.02544861, -1.82809, -3.344054, 1, 1, 1, 1, 1,
-0.02322898, -0.1410955, -2.844666, 1, 1, 1, 1, 1,
-0.01684211, 0.752786, -1.73667, 1, 1, 1, 1, 1,
-0.01508128, -0.3444584, -3.008507, 1, 1, 1, 1, 1,
-0.01324304, -0.7447445, -3.334417, 1, 1, 1, 1, 1,
-0.013203, 0.9274035, -1.644974, 1, 1, 1, 1, 1,
-0.00886876, -1.046525, -4.179151, 1, 1, 1, 1, 1,
-0.007789981, -0.3406266, -3.098038, 1, 1, 1, 1, 1,
-0.003392325, 0.3655922, 0.9919406, 0, 0, 1, 1, 1,
-0.001269796, -0.8829626, -3.390305, 1, 0, 0, 1, 1,
0.002501561, -1.730313, 3.961135, 1, 0, 0, 1, 1,
0.004668778, 1.373341, -0.3097399, 1, 0, 0, 1, 1,
0.009180338, -2.111852, 2.625489, 1, 0, 0, 1, 1,
0.01166585, 1.780529, 0.7073054, 1, 0, 0, 1, 1,
0.01314973, -0.632156, 2.203611, 0, 0, 0, 1, 1,
0.01353017, -0.8272287, 2.221082, 0, 0, 0, 1, 1,
0.01484132, -0.8547992, 3.802646, 0, 0, 0, 1, 1,
0.01507431, 0.6278123, 0.4092478, 0, 0, 0, 1, 1,
0.01686506, 1.242233, -0.5853223, 0, 0, 0, 1, 1,
0.01727244, -0.1951783, 1.801844, 0, 0, 0, 1, 1,
0.0190506, -1.072595, 2.916477, 0, 0, 0, 1, 1,
0.01924611, 0.1789511, -0.4094951, 1, 1, 1, 1, 1,
0.02503005, -0.6524124, 4.755546, 1, 1, 1, 1, 1,
0.0276267, 0.8566889, -1.410275, 1, 1, 1, 1, 1,
0.04297759, -0.5781671, 3.355868, 1, 1, 1, 1, 1,
0.04607202, -0.3162349, 2.12676, 1, 1, 1, 1, 1,
0.04988992, 1.065721, -0.01611677, 1, 1, 1, 1, 1,
0.05114521, 1.156811, -2.012346, 1, 1, 1, 1, 1,
0.05542305, -0.693342, 3.253693, 1, 1, 1, 1, 1,
0.05759712, -0.05075303, 2.453476, 1, 1, 1, 1, 1,
0.06551731, 1.156091, -1.203046, 1, 1, 1, 1, 1,
0.07041345, 0.1769744, 1.204776, 1, 1, 1, 1, 1,
0.07048763, 0.04952751, 0.5608816, 1, 1, 1, 1, 1,
0.07111415, -1.397217, 3.396416, 1, 1, 1, 1, 1,
0.07301564, 0.3873823, 0.3612054, 1, 1, 1, 1, 1,
0.07303677, -0.4253011, 3.251615, 1, 1, 1, 1, 1,
0.07484087, 1.051512, -1.529864, 0, 0, 1, 1, 1,
0.08477943, -1.380232, 4.075507, 1, 0, 0, 1, 1,
0.0867552, 2.183575, 0.2764352, 1, 0, 0, 1, 1,
0.08962176, -0.04709166, 2.968827, 1, 0, 0, 1, 1,
0.09055883, 0.3741808, -0.4527246, 1, 0, 0, 1, 1,
0.09334575, -0.2048415, 1.439772, 1, 0, 0, 1, 1,
0.09426235, 0.2789857, 1.001425, 0, 0, 0, 1, 1,
0.09576247, -0.07990742, 1.248127, 0, 0, 0, 1, 1,
0.09802696, 0.6950229, -1.32702, 0, 0, 0, 1, 1,
0.09844944, -0.4205132, 2.671714, 0, 0, 0, 1, 1,
0.09952436, -0.9100611, 2.999315, 0, 0, 0, 1, 1,
0.1002451, 0.04098358, 4.05441, 0, 0, 0, 1, 1,
0.1024244, 1.860938, 0.6057385, 0, 0, 0, 1, 1,
0.1036852, -0.8750393, 1.297912, 1, 1, 1, 1, 1,
0.1134326, -2.455503, 2.443498, 1, 1, 1, 1, 1,
0.1151718, -0.53495, 2.722217, 1, 1, 1, 1, 1,
0.1185648, 0.849993, 0.6496964, 1, 1, 1, 1, 1,
0.1239484, 0.1751227, 0.6852267, 1, 1, 1, 1, 1,
0.1264134, 0.4963189, 1.379149, 1, 1, 1, 1, 1,
0.1269946, -0.678739, 2.176375, 1, 1, 1, 1, 1,
0.1315046, -0.6702755, 3.093728, 1, 1, 1, 1, 1,
0.1327824, 1.339117, -0.30775, 1, 1, 1, 1, 1,
0.1332809, -0.3046482, 3.404783, 1, 1, 1, 1, 1,
0.1333686, -0.4581667, 5.610728, 1, 1, 1, 1, 1,
0.1339478, -1.724761, 3.778097, 1, 1, 1, 1, 1,
0.135572, 0.2653162, 0.1984541, 1, 1, 1, 1, 1,
0.1413919, -0.1233073, 2.338291, 1, 1, 1, 1, 1,
0.1426455, -1.029674, 2.073142, 1, 1, 1, 1, 1,
0.1432488, -1.202698, 2.929236, 0, 0, 1, 1, 1,
0.1432915, -1.274314, 2.765776, 1, 0, 0, 1, 1,
0.1468991, -0.7590911, 3.53185, 1, 0, 0, 1, 1,
0.1480823, 0.207305, 1.559445, 1, 0, 0, 1, 1,
0.1528302, -0.7575947, 3.815884, 1, 0, 0, 1, 1,
0.1596667, -0.8629757, 2.312329, 1, 0, 0, 1, 1,
0.1619823, -0.7739001, 3.612187, 0, 0, 0, 1, 1,
0.1643075, -0.06052214, 3.349991, 0, 0, 0, 1, 1,
0.1648534, -1.709759, 2.54501, 0, 0, 0, 1, 1,
0.1662674, 1.862257, 1.29434, 0, 0, 0, 1, 1,
0.1713275, -0.4146369, 1.712516, 0, 0, 0, 1, 1,
0.1738204, -0.3129866, 2.657305, 0, 0, 0, 1, 1,
0.1783297, 1.245672, -0.7181987, 0, 0, 0, 1, 1,
0.1820251, -0.2419192, 0.7200215, 1, 1, 1, 1, 1,
0.1821711, 0.4352797, 0.6037976, 1, 1, 1, 1, 1,
0.185318, -0.2649873, 0.9799533, 1, 1, 1, 1, 1,
0.194068, -1.422387, 3.365341, 1, 1, 1, 1, 1,
0.1990236, -1.476341, 4.169679, 1, 1, 1, 1, 1,
0.2005002, -0.0877151, 1.709587, 1, 1, 1, 1, 1,
0.203404, 1.605062, -0.4238997, 1, 1, 1, 1, 1,
0.2080728, -0.1378959, 1.927444, 1, 1, 1, 1, 1,
0.2081393, -0.5513984, 3.659406, 1, 1, 1, 1, 1,
0.2130442, 0.3444465, 0.06591867, 1, 1, 1, 1, 1,
0.2142697, 1.683575, 0.8973789, 1, 1, 1, 1, 1,
0.2182223, 1.264851, 0.6605953, 1, 1, 1, 1, 1,
0.2184209, 0.01640812, 1.210786, 1, 1, 1, 1, 1,
0.2197571, -0.09513081, 4.174989, 1, 1, 1, 1, 1,
0.2216695, 0.1562174, 0.05755776, 1, 1, 1, 1, 1,
0.2228471, 0.6768695, -0.06270795, 0, 0, 1, 1, 1,
0.2244249, -0.8188738, 3.845586, 1, 0, 0, 1, 1,
0.2247185, -0.7601706, 4.141566, 1, 0, 0, 1, 1,
0.2321411, -0.3911335, 3.684626, 1, 0, 0, 1, 1,
0.2328825, -0.5058467, 1.978135, 1, 0, 0, 1, 1,
0.2374305, 1.872431, 0.328315, 1, 0, 0, 1, 1,
0.2423225, 0.7188483, -0.8143135, 0, 0, 0, 1, 1,
0.2475017, 0.7650315, -0.260364, 0, 0, 0, 1, 1,
0.2512325, 1.308468, 2.710272, 0, 0, 0, 1, 1,
0.2525589, 2.543928, -1.186849, 0, 0, 0, 1, 1,
0.253293, -0.5270222, 5.032832, 0, 0, 0, 1, 1,
0.2556556, 0.1339982, 0.5816984, 0, 0, 0, 1, 1,
0.2580287, 0.3086015, 0.07462458, 0, 0, 0, 1, 1,
0.263257, -1.755578, 0.5441312, 1, 1, 1, 1, 1,
0.267123, 0.115971, 1.96268, 1, 1, 1, 1, 1,
0.2673322, 0.1744801, -0.290957, 1, 1, 1, 1, 1,
0.2722575, 1.353022, -0.3254891, 1, 1, 1, 1, 1,
0.2735665, 0.188841, 4.486523, 1, 1, 1, 1, 1,
0.2818224, 0.733613, 1.340421, 1, 1, 1, 1, 1,
0.2834735, 1.391067, -1.07154, 1, 1, 1, 1, 1,
0.2844707, 1.00721, -0.3126131, 1, 1, 1, 1, 1,
0.2852368, -0.5138991, 3.367148, 1, 1, 1, 1, 1,
0.2971472, -1.090169, 3.267006, 1, 1, 1, 1, 1,
0.2971568, -0.5760989, 0.8506663, 1, 1, 1, 1, 1,
0.302982, -0.7849164, 1.399928, 1, 1, 1, 1, 1,
0.3072414, 0.5529037, -0.8893135, 1, 1, 1, 1, 1,
0.3081492, 2.170785, 2.213495, 1, 1, 1, 1, 1,
0.3114281, 0.9338999, 0.6236392, 1, 1, 1, 1, 1,
0.3136336, 0.1593852, 0.2359881, 0, 0, 1, 1, 1,
0.3138877, -1.331832, 2.495543, 1, 0, 0, 1, 1,
0.315124, 1.969218, 1.070636, 1, 0, 0, 1, 1,
0.3163942, -2.056137, 2.812639, 1, 0, 0, 1, 1,
0.3274546, 0.277629, 1.310695, 1, 0, 0, 1, 1,
0.3302141, 0.5922407, -1.257736, 1, 0, 0, 1, 1,
0.3367126, 1.580475, -1.496509, 0, 0, 0, 1, 1,
0.3387188, 0.2702895, 1.438283, 0, 0, 0, 1, 1,
0.3438537, 1.883502, 0.1098082, 0, 0, 0, 1, 1,
0.3461245, 1.05785, -0.7459269, 0, 0, 0, 1, 1,
0.348435, -0.8484526, 1.650894, 0, 0, 0, 1, 1,
0.3491242, 0.1608244, 0.6878157, 0, 0, 0, 1, 1,
0.3497873, 0.8204684, 2.075077, 0, 0, 0, 1, 1,
0.3510174, -0.8489734, 2.55512, 1, 1, 1, 1, 1,
0.3523655, -1.16847, 2.805142, 1, 1, 1, 1, 1,
0.3534222, -1.571255, 4.566265, 1, 1, 1, 1, 1,
0.3604548, 0.2189717, 0.6022589, 1, 1, 1, 1, 1,
0.3605136, 2.023307, -0.2514937, 1, 1, 1, 1, 1,
0.3616924, 0.1655529, 2.467637, 1, 1, 1, 1, 1,
0.3624523, -1.231165, 2.123115, 1, 1, 1, 1, 1,
0.3659646, -0.1918786, 4.023058, 1, 1, 1, 1, 1,
0.3678839, 1.615588, -1.3744, 1, 1, 1, 1, 1,
0.3685055, -0.3385654, 0.4688136, 1, 1, 1, 1, 1,
0.3763027, 0.1732506, 1.9149, 1, 1, 1, 1, 1,
0.3784325, 0.2433775, 0.5212986, 1, 1, 1, 1, 1,
0.3786803, 0.1835624, -0.1714296, 1, 1, 1, 1, 1,
0.3806773, 0.8188094, 1.339008, 1, 1, 1, 1, 1,
0.3863815, -0.5890586, 2.34223, 1, 1, 1, 1, 1,
0.3871737, -1.25289, 0.8009689, 0, 0, 1, 1, 1,
0.3876589, 0.03172509, 1.539786, 1, 0, 0, 1, 1,
0.387669, 0.5250986, 2.030524, 1, 0, 0, 1, 1,
0.390921, -0.02725281, 2.878341, 1, 0, 0, 1, 1,
0.3916494, 1.475068, 0.6459528, 1, 0, 0, 1, 1,
0.3957687, 0.3853573, 0.4529351, 1, 0, 0, 1, 1,
0.4012268, -1.741835, 1.580712, 0, 0, 0, 1, 1,
0.402311, -1.218902, -0.2506934, 0, 0, 0, 1, 1,
0.4038806, 1.219328, 1.299872, 0, 0, 0, 1, 1,
0.4206671, -0.3026617, 2.690671, 0, 0, 0, 1, 1,
0.4222323, -0.00433559, 2.574396, 0, 0, 0, 1, 1,
0.4240366, -0.5844538, 5.264829, 0, 0, 0, 1, 1,
0.4270798, -1.4311, 3.010724, 0, 0, 0, 1, 1,
0.4319964, -0.02405932, 1.203492, 1, 1, 1, 1, 1,
0.4355026, 0.5686423, 1.513575, 1, 1, 1, 1, 1,
0.4387015, -1.498043, 2.72136, 1, 1, 1, 1, 1,
0.4387884, 1.280057, 0.2452521, 1, 1, 1, 1, 1,
0.4407476, 0.4141995, -0.4561844, 1, 1, 1, 1, 1,
0.4419831, -1.398482, 4.462262, 1, 1, 1, 1, 1,
0.4449787, -0.5709141, 0.9097016, 1, 1, 1, 1, 1,
0.4456646, -1.526261, 2.005348, 1, 1, 1, 1, 1,
0.4476338, -1.715227, 3.514903, 1, 1, 1, 1, 1,
0.4489868, 1.642673, -0.02975633, 1, 1, 1, 1, 1,
0.4493657, 0.1909846, 2.407049, 1, 1, 1, 1, 1,
0.4501987, -0.9914641, 5.222916, 1, 1, 1, 1, 1,
0.4514757, 0.3965691, 0.6553478, 1, 1, 1, 1, 1,
0.4518313, 0.4807308, 0.8586642, 1, 1, 1, 1, 1,
0.4534123, 0.2111027, 2.396515, 1, 1, 1, 1, 1,
0.4557015, 0.7889489, 2.282141, 0, 0, 1, 1, 1,
0.4574606, -0.2995622, 2.589217, 1, 0, 0, 1, 1,
0.4585935, 0.4885234, 3.9605, 1, 0, 0, 1, 1,
0.4599487, -1.563646, 2.862366, 1, 0, 0, 1, 1,
0.4608352, 0.3734403, 1.585812, 1, 0, 0, 1, 1,
0.4634446, 0.04519594, 2.131449, 1, 0, 0, 1, 1,
0.4692635, -0.003376996, 0.8767784, 0, 0, 0, 1, 1,
0.4734513, 2.36248, 0.6591732, 0, 0, 0, 1, 1,
0.4750538, 2.354647, 0.4362006, 0, 0, 0, 1, 1,
0.4807103, 0.713284, 0.1961436, 0, 0, 0, 1, 1,
0.4815702, 0.6531537, 2.615072, 0, 0, 0, 1, 1,
0.4822664, 1.100221, 0.5038961, 0, 0, 0, 1, 1,
0.4823422, 0.03654349, 1.762746, 0, 0, 0, 1, 1,
0.4838606, 0.6877313, -0.8286464, 1, 1, 1, 1, 1,
0.4873045, -0.3849069, 2.029488, 1, 1, 1, 1, 1,
0.4897332, -2.151678, 2.332738, 1, 1, 1, 1, 1,
0.4924922, 1.241519, 0.6444316, 1, 1, 1, 1, 1,
0.4944972, 0.423326, -0.07335443, 1, 1, 1, 1, 1,
0.5003611, -0.1110571, 2.918653, 1, 1, 1, 1, 1,
0.5057829, -1.446124, 1.815191, 1, 1, 1, 1, 1,
0.5062681, -0.8893329, 2.244008, 1, 1, 1, 1, 1,
0.5089588, 0.4041055, 0.1100809, 1, 1, 1, 1, 1,
0.5125369, -1.393726, 2.991692, 1, 1, 1, 1, 1,
0.5137379, -1.264814, 3.55229, 1, 1, 1, 1, 1,
0.5181043, -1.04732, 2.805903, 1, 1, 1, 1, 1,
0.5182309, -0.01300603, 1.644732, 1, 1, 1, 1, 1,
0.519267, -0.5990166, 2.073421, 1, 1, 1, 1, 1,
0.5200527, -0.4273871, 3.157841, 1, 1, 1, 1, 1,
0.5221843, -0.3851799, 1.142352, 0, 0, 1, 1, 1,
0.5263574, 2.402578, 0.1397261, 1, 0, 0, 1, 1,
0.5267229, 0.1948911, 3.266647, 1, 0, 0, 1, 1,
0.5334187, -0.1769527, 1.588941, 1, 0, 0, 1, 1,
0.5334329, 1.062049, -0.01659082, 1, 0, 0, 1, 1,
0.5393805, -1.135112, 2.284435, 1, 0, 0, 1, 1,
0.5401574, -0.0623856, -0.5421096, 0, 0, 0, 1, 1,
0.5419757, 0.6175956, 0.5728936, 0, 0, 0, 1, 1,
0.5448156, 2.326433, 0.2373142, 0, 0, 0, 1, 1,
0.5451301, 0.2404583, 3.264987, 0, 0, 0, 1, 1,
0.5495787, 0.03216593, 0.9047167, 0, 0, 0, 1, 1,
0.5507339, -0.1362792, 3.090095, 0, 0, 0, 1, 1,
0.5513944, -1.229444, 3.968004, 0, 0, 0, 1, 1,
0.5519722, 0.82029, 1.090801, 1, 1, 1, 1, 1,
0.5543057, -0.4227822, 3.157479, 1, 1, 1, 1, 1,
0.5545263, 1.444409, 1.273022, 1, 1, 1, 1, 1,
0.5588261, 0.3512248, 0.1063999, 1, 1, 1, 1, 1,
0.559487, 0.4732068, -0.1229696, 1, 1, 1, 1, 1,
0.5636508, -0.9981934, 1.301049, 1, 1, 1, 1, 1,
0.5637167, -0.8217821, 1.724509, 1, 1, 1, 1, 1,
0.5704622, 1.345813, 0.4567724, 1, 1, 1, 1, 1,
0.5763145, 0.1482871, -0.4165264, 1, 1, 1, 1, 1,
0.5787073, -0.197491, 2.003065, 1, 1, 1, 1, 1,
0.5790284, 0.5470964, 2.444393, 1, 1, 1, 1, 1,
0.5851175, -0.02370065, -0.5824323, 1, 1, 1, 1, 1,
0.5887657, -1.519745, 2.512554, 1, 1, 1, 1, 1,
0.5910262, -0.496563, 1.601384, 1, 1, 1, 1, 1,
0.5923405, 1.468681, 0.119663, 1, 1, 1, 1, 1,
0.5955752, 1.116327, -0.2242857, 0, 0, 1, 1, 1,
0.5958002, 0.2589579, -0.4521503, 1, 0, 0, 1, 1,
0.596471, -0.3441979, 3.076785, 1, 0, 0, 1, 1,
0.6003541, -0.4089905, 1.425584, 1, 0, 0, 1, 1,
0.6023707, -0.928562, 3.289988, 1, 0, 0, 1, 1,
0.6044349, -1.568779, 2.942816, 1, 0, 0, 1, 1,
0.6111898, 0.05299024, 1.511604, 0, 0, 0, 1, 1,
0.6127295, -0.3771336, 2.090328, 0, 0, 0, 1, 1,
0.61414, 0.9549872, 3.010906, 0, 0, 0, 1, 1,
0.6153407, 1.093377, 0.7749263, 0, 0, 0, 1, 1,
0.6171961, -1.444916, 2.000424, 0, 0, 0, 1, 1,
0.6183619, -0.2299832, 1.003192, 0, 0, 0, 1, 1,
0.6252412, 0.01433515, 1.05579, 0, 0, 0, 1, 1,
0.6272236, -0.440243, 3.140293, 1, 1, 1, 1, 1,
0.6295875, -1.198604, 1.6323, 1, 1, 1, 1, 1,
0.6339796, 0.08818282, 1.400015, 1, 1, 1, 1, 1,
0.6348437, -0.2180186, 0.6682144, 1, 1, 1, 1, 1,
0.6375208, 0.9195914, 0.4124911, 1, 1, 1, 1, 1,
0.6401069, 0.09437486, 1.398057, 1, 1, 1, 1, 1,
0.6406755, -0.6308013, 2.254287, 1, 1, 1, 1, 1,
0.6449919, 0.6483814, 1.114132, 1, 1, 1, 1, 1,
0.6471644, 0.6071808, 0.04226819, 1, 1, 1, 1, 1,
0.6504326, -1.588181, 3.89472, 1, 1, 1, 1, 1,
0.6604272, 0.7949861, 0.7584529, 1, 1, 1, 1, 1,
0.6615192, 1.022517, 1.043859, 1, 1, 1, 1, 1,
0.6617824, 0.7552719, 0.9276475, 1, 1, 1, 1, 1,
0.6618132, -0.06863356, -0.8549191, 1, 1, 1, 1, 1,
0.6627266, -0.7452797, 5.035421, 1, 1, 1, 1, 1,
0.6639852, 0.5358416, 1.021227, 0, 0, 1, 1, 1,
0.6643083, 0.7252613, 0.2780446, 1, 0, 0, 1, 1,
0.6679059, 1.166085, 1.734189, 1, 0, 0, 1, 1,
0.6679662, 1.356865, 0.5191819, 1, 0, 0, 1, 1,
0.6729217, -1.536561, 3.309377, 1, 0, 0, 1, 1,
0.6735403, -0.219425, 1.376548, 1, 0, 0, 1, 1,
0.6776947, 1.965843, 0.3191646, 0, 0, 0, 1, 1,
0.6889774, 1.815478, 1.911451, 0, 0, 0, 1, 1,
0.6980163, -1.016934, 2.352304, 0, 0, 0, 1, 1,
0.6982169, 0.1029025, 0.7948529, 0, 0, 0, 1, 1,
0.6989501, -0.7649425, 3.586915, 0, 0, 0, 1, 1,
0.7024732, 0.4177998, 2.809819, 0, 0, 0, 1, 1,
0.7053298, -0.07263362, 2.854166, 0, 0, 0, 1, 1,
0.7076516, 0.9439282, 0.5697067, 1, 1, 1, 1, 1,
0.7120255, -0.6953527, 2.278884, 1, 1, 1, 1, 1,
0.7123401, 0.4432011, 1.803139, 1, 1, 1, 1, 1,
0.7196837, -0.5425352, 3.695676, 1, 1, 1, 1, 1,
0.7217764, -1.66442, 2.76659, 1, 1, 1, 1, 1,
0.7250926, 0.1749039, 1.061816, 1, 1, 1, 1, 1,
0.7255634, 0.4019566, 1.657109, 1, 1, 1, 1, 1,
0.7305794, 0.2247415, -0.1011845, 1, 1, 1, 1, 1,
0.7306768, 0.2256418, -0.9247143, 1, 1, 1, 1, 1,
0.7338184, -0.6300573, 2.493057, 1, 1, 1, 1, 1,
0.7346398, -0.5997182, 1.311041, 1, 1, 1, 1, 1,
0.7375969, -1.202705, 2.540996, 1, 1, 1, 1, 1,
0.7422259, -1.19556, 1.654772, 1, 1, 1, 1, 1,
0.7442912, 1.015474, 0.2776689, 1, 1, 1, 1, 1,
0.7456177, -0.5853757, 2.518095, 1, 1, 1, 1, 1,
0.7471571, 1.256386, -1.527182, 0, 0, 1, 1, 1,
0.7498226, -0.8648348, 3.752851, 1, 0, 0, 1, 1,
0.7502427, -0.3189153, 3.194484, 1, 0, 0, 1, 1,
0.7535005, -1.246671, 3.431471, 1, 0, 0, 1, 1,
0.7549747, 0.8026631, -1.321566, 1, 0, 0, 1, 1,
0.7622099, 0.153408, 2.914244, 1, 0, 0, 1, 1,
0.7629835, 1.625789, 1.291777, 0, 0, 0, 1, 1,
0.7657354, 0.9286893, 1.321288, 0, 0, 0, 1, 1,
0.767336, -2.350892, 1.87927, 0, 0, 0, 1, 1,
0.7693537, 0.5051512, 0.480058, 0, 0, 0, 1, 1,
0.7716014, 0.2007161, 1.731192, 0, 0, 0, 1, 1,
0.776934, 0.3102642, -0.7084259, 0, 0, 0, 1, 1,
0.7795647, 0.3472288, 0.01016273, 0, 0, 0, 1, 1,
0.7838199, 0.610579, 1.578586, 1, 1, 1, 1, 1,
0.7838523, -0.6254493, 3.686136, 1, 1, 1, 1, 1,
0.786482, 0.2682553, 0.7393852, 1, 1, 1, 1, 1,
0.7876776, 0.1368865, 1.861739, 1, 1, 1, 1, 1,
0.7914646, -0.667695, 3.086309, 1, 1, 1, 1, 1,
0.798314, 0.4032441, 1.117228, 1, 1, 1, 1, 1,
0.8031386, 0.2220767, 0.02319769, 1, 1, 1, 1, 1,
0.807859, 1.055334, 1.741967, 1, 1, 1, 1, 1,
0.8138928, 1.472995, 0.8277432, 1, 1, 1, 1, 1,
0.8165517, 0.1825089, -1.635172, 1, 1, 1, 1, 1,
0.8169736, -0.6496194, 4.087041, 1, 1, 1, 1, 1,
0.8174057, -0.1573838, 2.507927, 1, 1, 1, 1, 1,
0.827983, -1.931216, 3.124916, 1, 1, 1, 1, 1,
0.8367445, 0.5519301, 1.610506, 1, 1, 1, 1, 1,
0.8385916, 1.005001, 1.147785, 1, 1, 1, 1, 1,
0.8428423, -1.819498, 4.430957, 0, 0, 1, 1, 1,
0.8489463, -0.5477682, 2.273112, 1, 0, 0, 1, 1,
0.8506965, 0.2894108, 0.8617478, 1, 0, 0, 1, 1,
0.856475, -1.444858, 1.207808, 1, 0, 0, 1, 1,
0.863209, -2.52359, 0.9522798, 1, 0, 0, 1, 1,
0.8668549, 1.949096, 1.201626, 1, 0, 0, 1, 1,
0.8680705, -0.1993146, 1.855455, 0, 0, 0, 1, 1,
0.8736918, -0.6120543, 1.274854, 0, 0, 0, 1, 1,
0.8757614, 0.3349314, 1.086291, 0, 0, 0, 1, 1,
0.8758726, -0.7072214, 2.6374, 0, 0, 0, 1, 1,
0.8823792, 0.9553697, 0.6344738, 0, 0, 0, 1, 1,
0.8831834, 0.5826265, 1.277039, 0, 0, 0, 1, 1,
0.8833928, -0.3343459, 0.7603404, 0, 0, 0, 1, 1,
0.890322, 0.6083073, 0.7737318, 1, 1, 1, 1, 1,
0.8910289, -1.312467, 2.487761, 1, 1, 1, 1, 1,
0.8938132, -0.3169579, 3.167378, 1, 1, 1, 1, 1,
0.8957276, 0.4668886, 0.5704773, 1, 1, 1, 1, 1,
0.9007057, -0.4767388, 1.988116, 1, 1, 1, 1, 1,
0.9042886, 0.6483812, 0.0482273, 1, 1, 1, 1, 1,
0.9055407, -0.07752743, 0.7538818, 1, 1, 1, 1, 1,
0.9118774, 1.106074, 2.22905, 1, 1, 1, 1, 1,
0.9120021, -0.08951713, -0.929287, 1, 1, 1, 1, 1,
0.913875, 1.030889, 0.3835133, 1, 1, 1, 1, 1,
0.9238742, 1.026943, 1.061182, 1, 1, 1, 1, 1,
0.9279161, -0.1218623, 1.063885, 1, 1, 1, 1, 1,
0.9303102, 1.886918, -0.08368604, 1, 1, 1, 1, 1,
0.9328314, 1.245158, 0.4881947, 1, 1, 1, 1, 1,
0.9349722, -0.5912295, 1.451032, 1, 1, 1, 1, 1,
0.93762, -1.798149, 2.710104, 0, 0, 1, 1, 1,
0.9396943, -1.449322, 2.645881, 1, 0, 0, 1, 1,
0.9585997, -0.3598596, 2.178735, 1, 0, 0, 1, 1,
0.970653, -0.03098003, 2.287671, 1, 0, 0, 1, 1,
0.972108, -0.8617527, 2.488894, 1, 0, 0, 1, 1,
0.972193, 0.1317369, 0.9887326, 1, 0, 0, 1, 1,
0.9750822, -1.03515, 2.721524, 0, 0, 0, 1, 1,
0.982071, 0.5791025, 1.003217, 0, 0, 0, 1, 1,
1.008804, -0.1463767, 1.805795, 0, 0, 0, 1, 1,
1.009122, -0.1224742, 0.9085133, 0, 0, 0, 1, 1,
1.025392, 1.111249, 1.099513, 0, 0, 0, 1, 1,
1.028448, -1.066743, 1.448446, 0, 0, 0, 1, 1,
1.032018, -0.7016981, 0.1402255, 0, 0, 0, 1, 1,
1.03687, 0.1037314, 3.90358, 1, 1, 1, 1, 1,
1.037638, -0.6001085, 2.255392, 1, 1, 1, 1, 1,
1.040547, 0.466612, 1.136404, 1, 1, 1, 1, 1,
1.043188, -0.6609666, 2.309251, 1, 1, 1, 1, 1,
1.048573, 0.4450431, -0.03199959, 1, 1, 1, 1, 1,
1.051764, 0.4520049, -1.000094, 1, 1, 1, 1, 1,
1.052657, 0.7340192, 1.063261, 1, 1, 1, 1, 1,
1.055127, -0.08894211, 0.5182306, 1, 1, 1, 1, 1,
1.065694, -0.8114986, 1.900481, 1, 1, 1, 1, 1,
1.071949, 0.04767669, 0.3446449, 1, 1, 1, 1, 1,
1.072813, 0.1418858, -0.3601534, 1, 1, 1, 1, 1,
1.084983, -0.7360359, 4.144783, 1, 1, 1, 1, 1,
1.088253, -0.1613849, 0.333272, 1, 1, 1, 1, 1,
1.088574, 1.109525, 1.740101, 1, 1, 1, 1, 1,
1.089054, 1.415911, 1.648643, 1, 1, 1, 1, 1,
1.094478, 0.596578, 2.787755, 0, 0, 1, 1, 1,
1.097936, 0.4083785, 1.178583, 1, 0, 0, 1, 1,
1.100241, 0.003296917, -0.1223338, 1, 0, 0, 1, 1,
1.104686, 1.641395, 1.079965, 1, 0, 0, 1, 1,
1.120747, -1.216071, 3.163573, 1, 0, 0, 1, 1,
1.124959, 2.612836, -0.1176347, 1, 0, 0, 1, 1,
1.137675, -0.4421817, 1.076217, 0, 0, 0, 1, 1,
1.137929, -0.4273621, 2.565472, 0, 0, 0, 1, 1,
1.141579, 0.1494003, 1.103887, 0, 0, 0, 1, 1,
1.143309, 0.001089038, 1.679988, 0, 0, 0, 1, 1,
1.143902, -1.072929, 1.530748, 0, 0, 0, 1, 1,
1.145847, 1.25891, 0.7677361, 0, 0, 0, 1, 1,
1.146354, -0.1023624, 3.01247, 0, 0, 0, 1, 1,
1.148756, -0.7397414, 0.2301695, 1, 1, 1, 1, 1,
1.16063, -0.876382, 2.445756, 1, 1, 1, 1, 1,
1.167283, -1.122788, 2.074101, 1, 1, 1, 1, 1,
1.17003, 0.4040855, 1.15692, 1, 1, 1, 1, 1,
1.173551, -1.673571, 3.450707, 1, 1, 1, 1, 1,
1.177326, -0.7601538, 3.967649, 1, 1, 1, 1, 1,
1.178326, -0.8294535, 2.660681, 1, 1, 1, 1, 1,
1.185477, 0.4437048, 2.663582, 1, 1, 1, 1, 1,
1.197052, -1.288067, 2.594492, 1, 1, 1, 1, 1,
1.198833, -0.1375078, 2.385468, 1, 1, 1, 1, 1,
1.199304, -1.077379, 2.018332, 1, 1, 1, 1, 1,
1.211955, -0.4783677, 2.084718, 1, 1, 1, 1, 1,
1.212155, 0.2622744, 2.794588, 1, 1, 1, 1, 1,
1.217321, -0.1233555, 0.7962158, 1, 1, 1, 1, 1,
1.23351, 0.8491681, 1.354416, 1, 1, 1, 1, 1,
1.244726, -0.300131, 1.495736, 0, 0, 1, 1, 1,
1.247241, -2.116825, 1.074347, 1, 0, 0, 1, 1,
1.251334, 0.03155913, 3.049533, 1, 0, 0, 1, 1,
1.254169, 1.96548, 1.259739, 1, 0, 0, 1, 1,
1.258356, -0.5962163, 1.473906, 1, 0, 0, 1, 1,
1.280577, -0.3206788, 0.5467364, 1, 0, 0, 1, 1,
1.287413, -0.8592676, 1.681206, 0, 0, 0, 1, 1,
1.290801, -0.641066, 1.39978, 0, 0, 0, 1, 1,
1.297277, -0.6609274, 2.440837, 0, 0, 0, 1, 1,
1.309788, 0.1399542, 1.842496, 0, 0, 0, 1, 1,
1.313323, -0.5204098, 1.830198, 0, 0, 0, 1, 1,
1.314418, 1.641287, 1.268208, 0, 0, 0, 1, 1,
1.350854, -0.2417794, 0.9250501, 0, 0, 0, 1, 1,
1.351835, 0.388051, 0.9563424, 1, 1, 1, 1, 1,
1.354441, 0.1778878, 1.400446, 1, 1, 1, 1, 1,
1.354823, -0.5438952, 1.40352, 1, 1, 1, 1, 1,
1.359356, 0.2837535, 0.382318, 1, 1, 1, 1, 1,
1.377501, -0.04967555, 1.85332, 1, 1, 1, 1, 1,
1.382563, 1.133159, -0.1328151, 1, 1, 1, 1, 1,
1.407188, 1.767291, 0.7426145, 1, 1, 1, 1, 1,
1.410076, 0.3943753, 2.205554, 1, 1, 1, 1, 1,
1.410207, 0.9435211, 2.585725, 1, 1, 1, 1, 1,
1.413174, 0.866484, 0.251116, 1, 1, 1, 1, 1,
1.417565, -0.5154334, 2.712417, 1, 1, 1, 1, 1,
1.420722, 1.225881, -1.799138, 1, 1, 1, 1, 1,
1.422718, -1.122095, 2.668437, 1, 1, 1, 1, 1,
1.432414, -1.318325, 2.494919, 1, 1, 1, 1, 1,
1.434028, 1.386396, 0.1023174, 1, 1, 1, 1, 1,
1.437839, 0.7846614, -1.283089, 0, 0, 1, 1, 1,
1.446838, 0.6252644, 1.715572, 1, 0, 0, 1, 1,
1.448772, 1.635781, 1.496958, 1, 0, 0, 1, 1,
1.456672, -1.129893, 3.550395, 1, 0, 0, 1, 1,
1.461335, -0.5513449, 1.276662, 1, 0, 0, 1, 1,
1.462243, -1.603624, 3.195465, 1, 0, 0, 1, 1,
1.462713, 0.5405617, 0.7132534, 0, 0, 0, 1, 1,
1.468537, -1.520098, 2.516919, 0, 0, 0, 1, 1,
1.471845, 0.02353396, 1.21043, 0, 0, 0, 1, 1,
1.472819, 0.7931679, 1.02998, 0, 0, 0, 1, 1,
1.478717, -0.2281175, 1.773901, 0, 0, 0, 1, 1,
1.486552, -0.6060156, 2.73775, 0, 0, 0, 1, 1,
1.503451, -0.7098675, 2.644852, 0, 0, 0, 1, 1,
1.505889, 0.1443115, 2.261664, 1, 1, 1, 1, 1,
1.522313, -0.8753189, 0.9497552, 1, 1, 1, 1, 1,
1.529898, -0.2736943, 1.35352, 1, 1, 1, 1, 1,
1.534232, -1.423973, 2.564796, 1, 1, 1, 1, 1,
1.534467, -0.0406618, 1.25687, 1, 1, 1, 1, 1,
1.537014, -0.8654444, 1.268989, 1, 1, 1, 1, 1,
1.580382, 0.8215232, 0.5944644, 1, 1, 1, 1, 1,
1.586274, -0.7419747, 1.504878, 1, 1, 1, 1, 1,
1.58802, 1.137171, 2.205455, 1, 1, 1, 1, 1,
1.613912, -0.1670661, 1.479433, 1, 1, 1, 1, 1,
1.616063, 2.209652, 2.667362, 1, 1, 1, 1, 1,
1.626295, 0.3114866, -0.1329252, 1, 1, 1, 1, 1,
1.633024, -1.639597, 1.472176, 1, 1, 1, 1, 1,
1.642583, 0.3592431, 2.949258, 1, 1, 1, 1, 1,
1.645636, -2.042534, 3.355923, 1, 1, 1, 1, 1,
1.654334, 0.08760208, 1.298134, 0, 0, 1, 1, 1,
1.657696, 0.921825, 0.06880661, 1, 0, 0, 1, 1,
1.66976, 1.443048, 1.035553, 1, 0, 0, 1, 1,
1.680576, -1.614778, 2.236331, 1, 0, 0, 1, 1,
1.684935, -0.07940543, 2.028918, 1, 0, 0, 1, 1,
1.687548, 0.667613, 1.579611, 1, 0, 0, 1, 1,
1.70164, -0.3666764, 1.924185, 0, 0, 0, 1, 1,
1.711446, 0.201461, 2.08933, 0, 0, 0, 1, 1,
1.717249, 0.1051474, 1.08416, 0, 0, 0, 1, 1,
1.724852, 1.557757, 3.250601, 0, 0, 0, 1, 1,
1.725535, -0.02275068, 1.921327, 0, 0, 0, 1, 1,
1.790448, 0.05653075, 0.6094094, 0, 0, 0, 1, 1,
1.795144, 0.021506, 2.597667, 0, 0, 0, 1, 1,
1.819456, -0.9702106, 3.124348, 1, 1, 1, 1, 1,
1.854755, 1.907266, -0.5781056, 1, 1, 1, 1, 1,
1.860807, -0.8305062, 2.835943, 1, 1, 1, 1, 1,
1.867643, -0.5310206, 1.625531, 1, 1, 1, 1, 1,
1.876953, 0.2770592, 2.013339, 1, 1, 1, 1, 1,
1.910911, -0.739102, 0.1924832, 1, 1, 1, 1, 1,
1.944265, 1.511625, 1.159206, 1, 1, 1, 1, 1,
1.989279, -0.2309422, 1.125987, 1, 1, 1, 1, 1,
1.998609, 0.303362, 1.302452, 1, 1, 1, 1, 1,
2.011382, 1.934517, -1.201279, 1, 1, 1, 1, 1,
2.050648, 0.4854032, 2.632127, 1, 1, 1, 1, 1,
2.058453, 1.047056, -0.1921781, 1, 1, 1, 1, 1,
2.078882, -2.756673, 1.909514, 1, 1, 1, 1, 1,
2.097236, 0.1274015, 0.5291412, 1, 1, 1, 1, 1,
2.164457, 0.3983747, 2.32075, 1, 1, 1, 1, 1,
2.184375, 0.6713382, 1.347318, 0, 0, 1, 1, 1,
2.240522, -2.014373, 1.43588, 1, 0, 0, 1, 1,
2.25802, 1.649558, 1.423781, 1, 0, 0, 1, 1,
2.266412, -0.09413417, 0.7094033, 1, 0, 0, 1, 1,
2.279262, -0.8125847, 5.098392, 1, 0, 0, 1, 1,
2.280009, -0.04887551, 2.102568, 1, 0, 0, 1, 1,
2.393919, 1.339442, -0.5476285, 0, 0, 0, 1, 1,
2.398484, 0.8058815, -2.712929, 0, 0, 0, 1, 1,
2.480547, 1.92333, 0.679302, 0, 0, 0, 1, 1,
2.528208, 0.9197319, 1.756709, 0, 0, 0, 1, 1,
2.592487, 0.7712114, 2.700751, 0, 0, 0, 1, 1,
2.606563, -0.9844738, 3.185173, 0, 0, 0, 1, 1,
2.614127, 0.5615512, 1.278286, 0, 0, 0, 1, 1,
2.623293, -0.4873328, 1.807667, 1, 1, 1, 1, 1,
2.63576, -0.9272271, 3.478174, 1, 1, 1, 1, 1,
2.725862, -0.7177672, 1.207918, 1, 1, 1, 1, 1,
2.73198, -0.3429024, 2.066715, 1, 1, 1, 1, 1,
2.757376, -1.033183, 0.8145858, 1, 1, 1, 1, 1,
2.863663, 1.74873, 2.09855, 1, 1, 1, 1, 1,
3.711488, -1.349576, 1.619997, 1, 1, 1, 1, 1
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
var radius = 9.906943;
var distance = 34.79771;
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
mvMatrix.translate( 0.159754, 0.2692065, -0.209909 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.79771);
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
