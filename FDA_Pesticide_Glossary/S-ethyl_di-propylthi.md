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
-2.910214, -0.117628, -0.9621181, 1, 0, 0, 1,
-2.860501, 0.2257785, -1.791737, 1, 0.007843138, 0, 1,
-2.844605, -0.06505215, -0.1369357, 1, 0.01176471, 0, 1,
-2.806266, 0.5368305, -1.060952, 1, 0.01960784, 0, 1,
-2.658643, -0.206917, 0.05893389, 1, 0.02352941, 0, 1,
-2.6226, 0.7582061, -1.833552, 1, 0.03137255, 0, 1,
-2.565285, -0.3609544, -3.710458, 1, 0.03529412, 0, 1,
-2.531641, -0.3972962, -3.153619, 1, 0.04313726, 0, 1,
-2.360868, -1.182511, -2.971065, 1, 0.04705882, 0, 1,
-2.353171, -0.01571793, -1.322004, 1, 0.05490196, 0, 1,
-2.341031, 0.4606215, -2.560201, 1, 0.05882353, 0, 1,
-2.296971, -0.1588681, -2.880062, 1, 0.06666667, 0, 1,
-2.294325, -0.2087167, -4.911959, 1, 0.07058824, 0, 1,
-2.290863, 1.280694, -0.4554422, 1, 0.07843138, 0, 1,
-2.28853, -0.9056941, -2.617457, 1, 0.08235294, 0, 1,
-2.241864, 0.1746525, -1.669076, 1, 0.09019608, 0, 1,
-2.238026, -0.5753183, -1.150651, 1, 0.09411765, 0, 1,
-2.203303, 0.8492128, -1.570766, 1, 0.1019608, 0, 1,
-2.189768, 1.882805, -1.346701, 1, 0.1098039, 0, 1,
-2.166534, -2.155162, -3.517725, 1, 0.1137255, 0, 1,
-2.153057, 0.8038151, 0.04329165, 1, 0.1215686, 0, 1,
-2.12214, -0.288104, -0.9698666, 1, 0.1254902, 0, 1,
-2.08166, 1.098289, -0.5180801, 1, 0.1333333, 0, 1,
-2.043401, 0.607433, 0.06725623, 1, 0.1372549, 0, 1,
-2.03299, -0.5493889, -1.244889, 1, 0.145098, 0, 1,
-2.032594, -0.8602117, -1.408598, 1, 0.1490196, 0, 1,
-2.028686, 0.3773862, -1.049062, 1, 0.1568628, 0, 1,
-2.02349, 0.1187494, -2.486038, 1, 0.1607843, 0, 1,
-1.99288, -1.093727, -1.760271, 1, 0.1686275, 0, 1,
-1.981895, 0.8910835, -0.3929636, 1, 0.172549, 0, 1,
-1.974582, 1.868409, 0.6206197, 1, 0.1803922, 0, 1,
-1.94766, 0.4274971, -2.267375, 1, 0.1843137, 0, 1,
-1.941924, 0.6331331, 0.5654715, 1, 0.1921569, 0, 1,
-1.874981, -0.2150014, -2.600412, 1, 0.1960784, 0, 1,
-1.855851, 0.4613309, -0.1145848, 1, 0.2039216, 0, 1,
-1.852467, -0.2536991, -1.955504, 1, 0.2117647, 0, 1,
-1.806542, 1.216707, -1.846446, 1, 0.2156863, 0, 1,
-1.793583, -1.894456, -3.458907, 1, 0.2235294, 0, 1,
-1.792601, 0.1948614, -1.803725, 1, 0.227451, 0, 1,
-1.783041, 0.222022, -0.07278094, 1, 0.2352941, 0, 1,
-1.775124, -0.7557649, -1.952947, 1, 0.2392157, 0, 1,
-1.769397, 1.108211, -2.441215, 1, 0.2470588, 0, 1,
-1.766438, -1.860196, -3.424316, 1, 0.2509804, 0, 1,
-1.765833, 0.6462168, -0.2002866, 1, 0.2588235, 0, 1,
-1.740398, -1.656499, -1.71034, 1, 0.2627451, 0, 1,
-1.720616, -0.3344065, -1.620169, 1, 0.2705882, 0, 1,
-1.720511, 0.1488718, -0.1470514, 1, 0.2745098, 0, 1,
-1.707054, -0.5876313, -1.113037, 1, 0.282353, 0, 1,
-1.698218, -0.336693, -2.086572, 1, 0.2862745, 0, 1,
-1.698023, -0.5245918, -2.25124, 1, 0.2941177, 0, 1,
-1.67715, -2.035682, -2.254758, 1, 0.3019608, 0, 1,
-1.664841, -1.308722, -1.533825, 1, 0.3058824, 0, 1,
-1.654465, -0.2063092, -1.226365, 1, 0.3137255, 0, 1,
-1.632566, -1.254691, -2.789299, 1, 0.3176471, 0, 1,
-1.624673, 0.1818528, -0.1690335, 1, 0.3254902, 0, 1,
-1.623557, 2.405941, 1.337615, 1, 0.3294118, 0, 1,
-1.62034, 0.5413979, -0.1961668, 1, 0.3372549, 0, 1,
-1.612185, 0.4178568, -2.853063, 1, 0.3411765, 0, 1,
-1.611226, 0.3211237, -1.698854, 1, 0.3490196, 0, 1,
-1.592998, -1.507701, -1.360023, 1, 0.3529412, 0, 1,
-1.589204, 0.2216699, -0.6852675, 1, 0.3607843, 0, 1,
-1.583014, -0.1925751, -1.749568, 1, 0.3647059, 0, 1,
-1.582802, 1.244078, -1.030745, 1, 0.372549, 0, 1,
-1.571828, 0.8025602, -1.444615, 1, 0.3764706, 0, 1,
-1.570916, -1.60429, -2.438724, 1, 0.3843137, 0, 1,
-1.529553, 0.84969, -0.8053485, 1, 0.3882353, 0, 1,
-1.522316, -1.593452, -1.829311, 1, 0.3960784, 0, 1,
-1.514461, 0.5546353, -0.9372582, 1, 0.4039216, 0, 1,
-1.49771, 0.5742701, -1.191763, 1, 0.4078431, 0, 1,
-1.490912, 0.9975193, -0.08485729, 1, 0.4156863, 0, 1,
-1.481894, -0.820092, -4.003207, 1, 0.4196078, 0, 1,
-1.47634, -0.5213017, 0.2442924, 1, 0.427451, 0, 1,
-1.465633, -0.6656191, -0.7420703, 1, 0.4313726, 0, 1,
-1.452193, -0.8176892, -2.160645, 1, 0.4392157, 0, 1,
-1.44761, -0.1684258, -2.446021, 1, 0.4431373, 0, 1,
-1.444029, -0.4314225, -0.6941303, 1, 0.4509804, 0, 1,
-1.440878, -0.6137497, -1.318067, 1, 0.454902, 0, 1,
-1.423306, 1.579716, -0.7906538, 1, 0.4627451, 0, 1,
-1.415858, 1.503048, -0.7890613, 1, 0.4666667, 0, 1,
-1.414708, 0.4566438, -1.074189, 1, 0.4745098, 0, 1,
-1.413665, 0.6366505, -2.898405, 1, 0.4784314, 0, 1,
-1.412533, -0.4349631, -0.2556078, 1, 0.4862745, 0, 1,
-1.397382, -2.054271, -0.6804559, 1, 0.4901961, 0, 1,
-1.396618, 0.6066543, -2.562214, 1, 0.4980392, 0, 1,
-1.394939, 0.52299, 0.9923233, 1, 0.5058824, 0, 1,
-1.378528, 1.342456, 0.7477818, 1, 0.509804, 0, 1,
-1.372669, -1.607461, -2.091469, 1, 0.5176471, 0, 1,
-1.371661, -0.8094718, -1.861067, 1, 0.5215687, 0, 1,
-1.370884, 0.03399137, -0.5334563, 1, 0.5294118, 0, 1,
-1.367255, -1.334549, -3.456871, 1, 0.5333334, 0, 1,
-1.364413, 0.2053405, -2.674174, 1, 0.5411765, 0, 1,
-1.36208, -1.126474, 0.08989201, 1, 0.5450981, 0, 1,
-1.360881, -0.169192, -1.485707, 1, 0.5529412, 0, 1,
-1.354672, -0.06698794, -0.8829831, 1, 0.5568628, 0, 1,
-1.34023, 0.9551164, -0.8867142, 1, 0.5647059, 0, 1,
-1.339499, -0.1128653, -3.478485, 1, 0.5686275, 0, 1,
-1.336566, -0.1721551, -2.096271, 1, 0.5764706, 0, 1,
-1.335217, 1.025361, -0.8294654, 1, 0.5803922, 0, 1,
-1.329811, 0.5038895, -0.7798628, 1, 0.5882353, 0, 1,
-1.329201, -0.2169666, -2.385157, 1, 0.5921569, 0, 1,
-1.323474, -0.08335334, -2.319651, 1, 0.6, 0, 1,
-1.320345, 1.462294, 0.91123, 1, 0.6078432, 0, 1,
-1.317704, 0.4440938, -1.735051, 1, 0.6117647, 0, 1,
-1.30662, 0.1274571, -2.710693, 1, 0.6196079, 0, 1,
-1.306361, -0.3244108, -0.3146208, 1, 0.6235294, 0, 1,
-1.304489, -0.1576443, -2.12286, 1, 0.6313726, 0, 1,
-1.294789, -0.02578215, 1.401699, 1, 0.6352941, 0, 1,
-1.29285, -0.1131684, -1.85735, 1, 0.6431373, 0, 1,
-1.286096, -0.0181856, -1.507922, 1, 0.6470588, 0, 1,
-1.276929, 0.6078901, -0.8769827, 1, 0.654902, 0, 1,
-1.27292, 0.8534244, -0.9503235, 1, 0.6588235, 0, 1,
-1.269775, -0.01241713, -1.262809, 1, 0.6666667, 0, 1,
-1.263633, 0.1564543, -1.153298, 1, 0.6705883, 0, 1,
-1.262579, 0.2647627, -1.347821, 1, 0.6784314, 0, 1,
-1.237257, -0.1221604, -2.055988, 1, 0.682353, 0, 1,
-1.229827, -0.007284763, -1.771774, 1, 0.6901961, 0, 1,
-1.219741, 0.7516015, 0.4861965, 1, 0.6941177, 0, 1,
-1.202021, -0.9690332, -1.776293, 1, 0.7019608, 0, 1,
-1.20121, -1.911588, -2.25618, 1, 0.7098039, 0, 1,
-1.200342, -1.283872, -3.89973, 1, 0.7137255, 0, 1,
-1.200126, 0.2555525, -0.7643996, 1, 0.7215686, 0, 1,
-1.189388, 0.5064987, -0.9982802, 1, 0.7254902, 0, 1,
-1.186383, 0.3793564, 0.3655373, 1, 0.7333333, 0, 1,
-1.185972, -1.019996, -1.240721, 1, 0.7372549, 0, 1,
-1.185204, 1.719228, -1.750008, 1, 0.7450981, 0, 1,
-1.179173, 2.113317, 0.8971848, 1, 0.7490196, 0, 1,
-1.173548, 0.02433546, -1.189018, 1, 0.7568628, 0, 1,
-1.170569, 0.443103, -1.349763, 1, 0.7607843, 0, 1,
-1.140442, 0.0933411, -2.910687, 1, 0.7686275, 0, 1,
-1.138296, -0.6051654, -3.641964, 1, 0.772549, 0, 1,
-1.134323, 0.3806422, -0.4874058, 1, 0.7803922, 0, 1,
-1.128963, -1.929796, -2.19859, 1, 0.7843137, 0, 1,
-1.110534, 1.125234, -0.9002963, 1, 0.7921569, 0, 1,
-1.110399, -0.1555818, -0.4087496, 1, 0.7960784, 0, 1,
-1.10652, 0.5582836, -1.442065, 1, 0.8039216, 0, 1,
-1.100721, -0.8529669, -2.112446, 1, 0.8117647, 0, 1,
-1.099749, -0.7270309, -1.801769, 1, 0.8156863, 0, 1,
-1.092721, -2.957992, -2.608617, 1, 0.8235294, 0, 1,
-1.089102, -0.4466483, -0.3108998, 1, 0.827451, 0, 1,
-1.08456, 1.433423, -0.9195988, 1, 0.8352941, 0, 1,
-1.073886, 0.8305572, -1.941719, 1, 0.8392157, 0, 1,
-1.073367, -2.55614, -1.682541, 1, 0.8470588, 0, 1,
-1.069743, -1.433082, -1.86974, 1, 0.8509804, 0, 1,
-1.064844, 2.92863, 0.2088692, 1, 0.8588235, 0, 1,
-1.062122, 0.9513799, -0.810566, 1, 0.8627451, 0, 1,
-1.057296, 0.9815136, -1.082847, 1, 0.8705882, 0, 1,
-1.048561, -2.346757, -2.653954, 1, 0.8745098, 0, 1,
-1.0482, 0.7831006, 0.06176991, 1, 0.8823529, 0, 1,
-1.043956, 1.252261, -0.2649221, 1, 0.8862745, 0, 1,
-1.040688, 0.03534747, -1.761593, 1, 0.8941177, 0, 1,
-1.03849, -0.5918019, -2.598337, 1, 0.8980392, 0, 1,
-1.038245, 0.4358124, 0.6004962, 1, 0.9058824, 0, 1,
-1.037293, 1.65314, -1.348328, 1, 0.9137255, 0, 1,
-1.031641, 2.561408, 0.281554, 1, 0.9176471, 0, 1,
-1.025523, 0.4575053, -1.196954, 1, 0.9254902, 0, 1,
-1.024243, 1.087113, -0.8884606, 1, 0.9294118, 0, 1,
-1.020519, -0.6846051, -2.765036, 1, 0.9372549, 0, 1,
-1.019677, 2.6434, 0.6963054, 1, 0.9411765, 0, 1,
-1.019675, -0.821565, -1.176223, 1, 0.9490196, 0, 1,
-1.017424, 0.8126562, -0.5502002, 1, 0.9529412, 0, 1,
-1.01706, 0.7767709, -0.7133462, 1, 0.9607843, 0, 1,
-1.01575, -1.540781, -3.294953, 1, 0.9647059, 0, 1,
-1.015124, -0.2612475, -2.824464, 1, 0.972549, 0, 1,
-1.011447, -0.7309137, -2.137425, 1, 0.9764706, 0, 1,
-1.005047, -0.7315557, -4.450451, 1, 0.9843137, 0, 1,
-1.004603, -0.1486098, 0.2185876, 1, 0.9882353, 0, 1,
-0.9928517, -0.7067367, -2.88444, 1, 0.9960784, 0, 1,
-0.9857332, 0.2946706, -1.590734, 0.9960784, 1, 0, 1,
-0.9820364, -0.3218449, -2.181816, 0.9921569, 1, 0, 1,
-0.9624448, -0.9962502, -2.225642, 0.9843137, 1, 0, 1,
-0.9622567, -0.1151419, -0.898272, 0.9803922, 1, 0, 1,
-0.9596806, -1.346249, -4.535149, 0.972549, 1, 0, 1,
-0.9573378, 0.935522, -1.168242, 0.9686275, 1, 0, 1,
-0.9573333, -1.143443, -3.069063, 0.9607843, 1, 0, 1,
-0.949411, 0.04392414, -2.829857, 0.9568627, 1, 0, 1,
-0.9477855, 0.9774483, -0.2293163, 0.9490196, 1, 0, 1,
-0.9445874, 0.9281815, -2.312868, 0.945098, 1, 0, 1,
-0.9392756, -1.551342, -1.461859, 0.9372549, 1, 0, 1,
-0.9391916, 0.347427, -1.140981, 0.9333333, 1, 0, 1,
-0.9368894, 1.754247, -0.8479403, 0.9254902, 1, 0, 1,
-0.9318805, 0.8615083, -0.6353816, 0.9215686, 1, 0, 1,
-0.9246226, 1.827554, -0.9200966, 0.9137255, 1, 0, 1,
-0.9169765, -2.74576, -3.606356, 0.9098039, 1, 0, 1,
-0.9159893, 0.979327, -0.4076006, 0.9019608, 1, 0, 1,
-0.9016532, -0.7017494, -1.087862, 0.8941177, 1, 0, 1,
-0.8939357, 0.6654895, -1.722468, 0.8901961, 1, 0, 1,
-0.8893758, 0.7118772, -3.049243, 0.8823529, 1, 0, 1,
-0.8857403, 0.03115656, -0.3587004, 0.8784314, 1, 0, 1,
-0.8727826, -1.23697, -1.618947, 0.8705882, 1, 0, 1,
-0.8725832, 0.09043223, -2.302941, 0.8666667, 1, 0, 1,
-0.864327, -0.153683, -1.74424, 0.8588235, 1, 0, 1,
-0.8611694, 0.3934684, -0.3903399, 0.854902, 1, 0, 1,
-0.8587233, -1.974916, -4.03652, 0.8470588, 1, 0, 1,
-0.8543835, 0.3162827, -1.192483, 0.8431373, 1, 0, 1,
-0.8540177, 2.104989, -1.145193, 0.8352941, 1, 0, 1,
-0.8514091, 1.213045, -0.8682101, 0.8313726, 1, 0, 1,
-0.8486399, 0.7352291, -1.611634, 0.8235294, 1, 0, 1,
-0.8398978, -0.4787196, -0.6762227, 0.8196079, 1, 0, 1,
-0.8387517, 0.1336034, -3.223656, 0.8117647, 1, 0, 1,
-0.8384453, 1.556152, -0.0652491, 0.8078431, 1, 0, 1,
-0.8360048, -0.3137686, -1.472108, 0.8, 1, 0, 1,
-0.8354673, 2.07904, 0.7241237, 0.7921569, 1, 0, 1,
-0.8307682, -0.5730719, -1.565665, 0.7882353, 1, 0, 1,
-0.8253247, 1.567337, 0.09514999, 0.7803922, 1, 0, 1,
-0.8222775, -0.1610243, -3.776499, 0.7764706, 1, 0, 1,
-0.8222672, -0.1238949, -2.727381, 0.7686275, 1, 0, 1,
-0.8067726, -2.835487, -5.287151, 0.7647059, 1, 0, 1,
-0.7962345, 0.7111289, 0.1755046, 0.7568628, 1, 0, 1,
-0.7934058, -0.2292036, -3.069949, 0.7529412, 1, 0, 1,
-0.7923532, 0.3676216, -1.700603, 0.7450981, 1, 0, 1,
-0.7921703, -2.369325, -2.834885, 0.7411765, 1, 0, 1,
-0.7913786, 0.4565069, -0.466618, 0.7333333, 1, 0, 1,
-0.7891785, -0.7369457, -1.158894, 0.7294118, 1, 0, 1,
-0.783564, -0.3071738, -0.7936173, 0.7215686, 1, 0, 1,
-0.7807023, -0.5460963, -2.72819, 0.7176471, 1, 0, 1,
-0.7804384, 2.188287, 0.9786364, 0.7098039, 1, 0, 1,
-0.779934, 2.233605, 1.232547, 0.7058824, 1, 0, 1,
-0.7782601, -0.3036724, -2.043685, 0.6980392, 1, 0, 1,
-0.7763554, -0.202155, -2.161346, 0.6901961, 1, 0, 1,
-0.7703848, -1.518954, -3.925349, 0.6862745, 1, 0, 1,
-0.76412, -1.103422, -3.813614, 0.6784314, 1, 0, 1,
-0.7622468, 0.4684851, -2.321806, 0.6745098, 1, 0, 1,
-0.7597312, -0.4765977, -1.203571, 0.6666667, 1, 0, 1,
-0.7527865, 0.5544769, -0.7797388, 0.6627451, 1, 0, 1,
-0.7506924, 0.7948562, -2.772601, 0.654902, 1, 0, 1,
-0.745071, -0.570717, -1.671928, 0.6509804, 1, 0, 1,
-0.7434799, -0.3682925, -1.154966, 0.6431373, 1, 0, 1,
-0.740765, 0.506801, -1.551482, 0.6392157, 1, 0, 1,
-0.7390865, 1.356982, -3.149311, 0.6313726, 1, 0, 1,
-0.7304433, -0.308715, -0.8348048, 0.627451, 1, 0, 1,
-0.7287686, 0.9036757, -2.016852, 0.6196079, 1, 0, 1,
-0.7287033, -0.1436988, -0.7710435, 0.6156863, 1, 0, 1,
-0.7261796, -0.1725844, -1.202637, 0.6078432, 1, 0, 1,
-0.7248184, 1.160119, 0.4657086, 0.6039216, 1, 0, 1,
-0.7246162, 0.8198695, -0.4975058, 0.5960785, 1, 0, 1,
-0.7230256, 1.047926, 0.2861903, 0.5882353, 1, 0, 1,
-0.7196278, -1.193743, -1.331736, 0.5843138, 1, 0, 1,
-0.7192814, 0.3172325, -1.209786, 0.5764706, 1, 0, 1,
-0.7191386, 0.4561174, 0.657001, 0.572549, 1, 0, 1,
-0.7166235, 0.01602725, -1.258495, 0.5647059, 1, 0, 1,
-0.7147945, -0.4932581, -1.500506, 0.5607843, 1, 0, 1,
-0.7142997, -0.6359339, -3.363555, 0.5529412, 1, 0, 1,
-0.7100314, 0.04515286, -2.318497, 0.5490196, 1, 0, 1,
-0.7082521, -0.5165513, -0.9879873, 0.5411765, 1, 0, 1,
-0.7059211, -0.4670583, -0.3269264, 0.5372549, 1, 0, 1,
-0.7058933, 0.8521784, -2.652019, 0.5294118, 1, 0, 1,
-0.6965203, -0.3118152, -3.013788, 0.5254902, 1, 0, 1,
-0.6949978, -0.9210621, -2.303828, 0.5176471, 1, 0, 1,
-0.6910591, -3.198955, -3.542374, 0.5137255, 1, 0, 1,
-0.6843207, -0.5796023, -3.784148, 0.5058824, 1, 0, 1,
-0.682505, 0.3213366, -1.847584, 0.5019608, 1, 0, 1,
-0.6822214, -1.321552, -2.491611, 0.4941176, 1, 0, 1,
-0.6803647, 0.9008608, 1.813414, 0.4862745, 1, 0, 1,
-0.6728229, -0.6967242, -1.743143, 0.4823529, 1, 0, 1,
-0.6717625, 0.003827721, -0.4388267, 0.4745098, 1, 0, 1,
-0.6684924, 1.019069, -0.1171244, 0.4705882, 1, 0, 1,
-0.6632165, 0.9239841, -0.640676, 0.4627451, 1, 0, 1,
-0.6590199, 0.9489589, -0.8872675, 0.4588235, 1, 0, 1,
-0.6584715, -1.624114, -1.777057, 0.4509804, 1, 0, 1,
-0.6517965, -0.8396281, -0.5331588, 0.4470588, 1, 0, 1,
-0.6493671, 1.013821, -1.639569, 0.4392157, 1, 0, 1,
-0.643614, -1.317636, -3.564755, 0.4352941, 1, 0, 1,
-0.6386226, 0.2215878, -1.889293, 0.427451, 1, 0, 1,
-0.637478, -1.197247, -1.517067, 0.4235294, 1, 0, 1,
-0.6356694, 0.06820109, -2.7335, 0.4156863, 1, 0, 1,
-0.6354788, 0.1653519, -1.626153, 0.4117647, 1, 0, 1,
-0.6338561, 1.322583, -0.5973486, 0.4039216, 1, 0, 1,
-0.6338454, 0.8960982, 1.035323, 0.3960784, 1, 0, 1,
-0.63377, 0.325445, -0.8494757, 0.3921569, 1, 0, 1,
-0.6306146, 0.3799528, -1.148504, 0.3843137, 1, 0, 1,
-0.6220734, 1.878997, 0.03999867, 0.3803922, 1, 0, 1,
-0.6211423, 0.8454375, 1.505952, 0.372549, 1, 0, 1,
-0.615061, 0.6906617, -0.08754914, 0.3686275, 1, 0, 1,
-0.6138337, -1.151665, -3.574607, 0.3607843, 1, 0, 1,
-0.6127374, 1.869729, -0.04935558, 0.3568628, 1, 0, 1,
-0.6116199, 0.5827019, -1.459479, 0.3490196, 1, 0, 1,
-0.610718, 0.3563272, -2.358679, 0.345098, 1, 0, 1,
-0.6031335, -0.2589819, -0.003759864, 0.3372549, 1, 0, 1,
-0.5987391, 0.1427136, -1.784355, 0.3333333, 1, 0, 1,
-0.5980738, -0.7854137, -1.312436, 0.3254902, 1, 0, 1,
-0.5978243, 1.633126, -0.003861381, 0.3215686, 1, 0, 1,
-0.5942006, 0.351881, -1.100702, 0.3137255, 1, 0, 1,
-0.5937567, -0.1599758, 0.2216169, 0.3098039, 1, 0, 1,
-0.5911722, 0.8141211, -1.770646, 0.3019608, 1, 0, 1,
-0.5826302, 0.1645858, -1.736302, 0.2941177, 1, 0, 1,
-0.5808084, -0.5388513, -0.9999139, 0.2901961, 1, 0, 1,
-0.5777634, 1.565042, -1.526107, 0.282353, 1, 0, 1,
-0.5666788, 0.4490269, -2.110961, 0.2784314, 1, 0, 1,
-0.5642588, -0.1503308, -3.090719, 0.2705882, 1, 0, 1,
-0.5613759, -0.2010482, -4.109412, 0.2666667, 1, 0, 1,
-0.5541598, -0.6571624, -2.681029, 0.2588235, 1, 0, 1,
-0.5510605, -0.6966973, -1.935516, 0.254902, 1, 0, 1,
-0.5489186, 0.5524596, -0.1743111, 0.2470588, 1, 0, 1,
-0.5483447, 1.807257, -0.8079257, 0.2431373, 1, 0, 1,
-0.5479848, -1.205285, -2.511484, 0.2352941, 1, 0, 1,
-0.5419663, 0.2207991, 0.06120994, 0.2313726, 1, 0, 1,
-0.5354981, 0.7606301, -1.352359, 0.2235294, 1, 0, 1,
-0.5352437, 1.419672, -0.2776223, 0.2196078, 1, 0, 1,
-0.5326431, -0.3157821, -2.078644, 0.2117647, 1, 0, 1,
-0.5317464, -0.6295986, -4.564396, 0.2078431, 1, 0, 1,
-0.5280426, 1.381158, -1.197602, 0.2, 1, 0, 1,
-0.5256944, 0.2670947, -1.124331, 0.1921569, 1, 0, 1,
-0.5230099, -0.573743, -2.393862, 0.1882353, 1, 0, 1,
-0.5188543, 0.7821617, -1.610521, 0.1803922, 1, 0, 1,
-0.5053884, -1.613492, -1.909665, 0.1764706, 1, 0, 1,
-0.501031, 1.137401, -1.36269, 0.1686275, 1, 0, 1,
-0.4915623, 0.7246171, 0.4099005, 0.1647059, 1, 0, 1,
-0.4899456, -0.9064501, -2.724083, 0.1568628, 1, 0, 1,
-0.4874957, 0.09709834, -0.7142805, 0.1529412, 1, 0, 1,
-0.4862558, 0.004552127, -2.442412, 0.145098, 1, 0, 1,
-0.4859259, 1.793643, -0.6044382, 0.1411765, 1, 0, 1,
-0.4782203, -1.089866, -2.371098, 0.1333333, 1, 0, 1,
-0.475358, 0.7875348, -0.338536, 0.1294118, 1, 0, 1,
-0.4728218, 0.313382, -0.4932367, 0.1215686, 1, 0, 1,
-0.4726772, 1.118656, 0.2563604, 0.1176471, 1, 0, 1,
-0.47262, -0.1379631, 0.5180876, 0.1098039, 1, 0, 1,
-0.4724432, 0.4037533, -0.5107911, 0.1058824, 1, 0, 1,
-0.4705949, 0.4684545, -2.460987, 0.09803922, 1, 0, 1,
-0.4691417, -0.09599449, -1.621208, 0.09019608, 1, 0, 1,
-0.4673102, -0.7943646, -2.586983, 0.08627451, 1, 0, 1,
-0.4664428, 2.244828, -0.4459825, 0.07843138, 1, 0, 1,
-0.4631633, -0.4462074, -3.338615, 0.07450981, 1, 0, 1,
-0.4602718, 1.413254, 0.02174885, 0.06666667, 1, 0, 1,
-0.4601271, -0.6776692, -3.285078, 0.0627451, 1, 0, 1,
-0.4593504, -0.7988173, -2.326531, 0.05490196, 1, 0, 1,
-0.4593138, -1.361879, -2.384518, 0.05098039, 1, 0, 1,
-0.4541497, 1.429451, 0.5377063, 0.04313726, 1, 0, 1,
-0.4538166, -0.8722894, -2.557736, 0.03921569, 1, 0, 1,
-0.448615, 0.4801784, -0.8105204, 0.03137255, 1, 0, 1,
-0.4480964, 0.9062259, 0.3391459, 0.02745098, 1, 0, 1,
-0.4458419, -0.2366557, -2.566068, 0.01960784, 1, 0, 1,
-0.4443855, -1.005802, -3.948583, 0.01568628, 1, 0, 1,
-0.4440179, -0.3568642, -0.9043147, 0.007843138, 1, 0, 1,
-0.4426738, 0.5667303, -0.3887588, 0.003921569, 1, 0, 1,
-0.4390315, 1.355011, -0.431305, 0, 1, 0.003921569, 1,
-0.4386139, -0.085465, -1.104648, 0, 1, 0.01176471, 1,
-0.4329597, 0.8462024, -1.70547, 0, 1, 0.01568628, 1,
-0.4322952, -1.633222, -3.197858, 0, 1, 0.02352941, 1,
-0.4301224, -0.4354225, -3.605143, 0, 1, 0.02745098, 1,
-0.4259899, 0.8413324, -1.223552, 0, 1, 0.03529412, 1,
-0.4199601, 0.9945304, 0.6907907, 0, 1, 0.03921569, 1,
-0.4171653, 0.2179889, 0.5315178, 0, 1, 0.04705882, 1,
-0.4137864, 0.5808566, -0.247295, 0, 1, 0.05098039, 1,
-0.4121491, 0.07357029, -1.925357, 0, 1, 0.05882353, 1,
-0.4112594, -0.3268212, -1.274818, 0, 1, 0.0627451, 1,
-0.4094273, 0.9725863, -0.1665789, 0, 1, 0.07058824, 1,
-0.408133, 0.2621934, 0.09102585, 0, 1, 0.07450981, 1,
-0.4023744, 0.3558758, -0.5998051, 0, 1, 0.08235294, 1,
-0.390158, -1.314493, -3.572942, 0, 1, 0.08627451, 1,
-0.389612, 0.1712848, -1.668732, 0, 1, 0.09411765, 1,
-0.3889205, -0.7389902, -3.522723, 0, 1, 0.1019608, 1,
-0.3777904, 0.3408268, -1.806157, 0, 1, 0.1058824, 1,
-0.3777037, 1.009991, 0.01808452, 0, 1, 0.1137255, 1,
-0.3750156, -0.7261741, -2.207053, 0, 1, 0.1176471, 1,
-0.3730769, 1.113549, -0.543393, 0, 1, 0.1254902, 1,
-0.3723873, -1.67112, -3.097443, 0, 1, 0.1294118, 1,
-0.3719958, 2.30821, 0.7881514, 0, 1, 0.1372549, 1,
-0.3717277, -1.182176, -3.803627, 0, 1, 0.1411765, 1,
-0.3699837, 1.592386, -1.349144, 0, 1, 0.1490196, 1,
-0.3684752, 1.323605, -0.8430254, 0, 1, 0.1529412, 1,
-0.3671072, 0.03262724, -0.3269335, 0, 1, 0.1607843, 1,
-0.3646915, -0.4388635, -2.957161, 0, 1, 0.1647059, 1,
-0.3621461, 1.218036, -2.054893, 0, 1, 0.172549, 1,
-0.3611646, -0.939402, -5.261185, 0, 1, 0.1764706, 1,
-0.3583105, 0.3656979, -3.033647, 0, 1, 0.1843137, 1,
-0.3571458, -0.7011197, -2.184287, 0, 1, 0.1882353, 1,
-0.3539903, 0.07837677, -0.5100264, 0, 1, 0.1960784, 1,
-0.3478172, 0.2345576, -0.9322135, 0, 1, 0.2039216, 1,
-0.3476319, -0.4731627, -2.804042, 0, 1, 0.2078431, 1,
-0.3469681, 1.257821, -1.425226, 0, 1, 0.2156863, 1,
-0.346083, 2.466246, -2.144536, 0, 1, 0.2196078, 1,
-0.3437921, -0.3709426, -3.113219, 0, 1, 0.227451, 1,
-0.3421602, -0.2881981, -2.7108, 0, 1, 0.2313726, 1,
-0.3262209, -0.1859256, -3.500552, 0, 1, 0.2392157, 1,
-0.3250401, 0.2251943, -0.1637768, 0, 1, 0.2431373, 1,
-0.3182281, -0.6421715, -3.506199, 0, 1, 0.2509804, 1,
-0.3153775, -0.4711803, -2.328258, 0, 1, 0.254902, 1,
-0.3143208, 0.1799197, -0.4018267, 0, 1, 0.2627451, 1,
-0.3034452, 0.9223499, -0.7193485, 0, 1, 0.2666667, 1,
-0.299433, 0.9328006, 0.9838878, 0, 1, 0.2745098, 1,
-0.2994203, 0.5069582, -1.008311, 0, 1, 0.2784314, 1,
-0.2967616, -0.9329297, -2.24124, 0, 1, 0.2862745, 1,
-0.2941115, -0.04578603, -1.465679, 0, 1, 0.2901961, 1,
-0.2848348, 0.6906291, -1.257646, 0, 1, 0.2980392, 1,
-0.2825993, -1.017293, -2.232777, 0, 1, 0.3058824, 1,
-0.2815515, -1.451478, -1.592365, 0, 1, 0.3098039, 1,
-0.280348, 1.329084, -1.120774, 0, 1, 0.3176471, 1,
-0.2753975, 1.457968, 1.954692, 0, 1, 0.3215686, 1,
-0.2704528, -1.63551, -2.359168, 0, 1, 0.3294118, 1,
-0.2693663, -1.013467, -3.319182, 0, 1, 0.3333333, 1,
-0.261338, 1.207675, -0.8858658, 0, 1, 0.3411765, 1,
-0.2598884, -0.4832634, -1.962851, 0, 1, 0.345098, 1,
-0.2582602, 0.2019789, -2.16504, 0, 1, 0.3529412, 1,
-0.2537059, -0.07316341, -3.272913, 0, 1, 0.3568628, 1,
-0.2536881, -2.195643, -2.348383, 0, 1, 0.3647059, 1,
-0.2523389, 1.40082, -0.3386708, 0, 1, 0.3686275, 1,
-0.2514368, 0.6411094, -1.288951, 0, 1, 0.3764706, 1,
-0.2457583, 0.7641114, 0.09443423, 0, 1, 0.3803922, 1,
-0.2436494, 0.22297, -1.063951, 0, 1, 0.3882353, 1,
-0.2436448, 0.9993792, 1.570326, 0, 1, 0.3921569, 1,
-0.2411894, 0.1200802, -1.586284, 0, 1, 0.4, 1,
-0.2359556, 0.1762607, -2.439556, 0, 1, 0.4078431, 1,
-0.2356816, -1.242527, -4.780688, 0, 1, 0.4117647, 1,
-0.2340144, 0.07304892, -0.4907498, 0, 1, 0.4196078, 1,
-0.2331457, -1.382394, -1.23037, 0, 1, 0.4235294, 1,
-0.2330216, 0.6000961, -1.108815, 0, 1, 0.4313726, 1,
-0.2294358, 0.003402404, -0.7242094, 0, 1, 0.4352941, 1,
-0.2292199, 0.005921781, -1.877267, 0, 1, 0.4431373, 1,
-0.2270066, -0.4647753, -2.986106, 0, 1, 0.4470588, 1,
-0.2218954, 1.10437, -0.07438096, 0, 1, 0.454902, 1,
-0.2134141, -0.245382, -2.133947, 0, 1, 0.4588235, 1,
-0.2112883, -0.7121433, -2.466483, 0, 1, 0.4666667, 1,
-0.1999026, 0.3500698, -0.5896615, 0, 1, 0.4705882, 1,
-0.1992186, -1.381048, -1.434944, 0, 1, 0.4784314, 1,
-0.1942057, 0.1053947, -1.07832, 0, 1, 0.4823529, 1,
-0.1937554, -0.6215661, -4.159577, 0, 1, 0.4901961, 1,
-0.1926892, -0.1188825, -1.693028, 0, 1, 0.4941176, 1,
-0.1890375, -0.3072864, -3.014961, 0, 1, 0.5019608, 1,
-0.1877075, 0.7284793, -0.3868516, 0, 1, 0.509804, 1,
-0.1859955, 0.1559966, -2.121734, 0, 1, 0.5137255, 1,
-0.1830212, 1.247504, -0.5558617, 0, 1, 0.5215687, 1,
-0.1816337, 0.05600581, 0.2609464, 0, 1, 0.5254902, 1,
-0.1734948, -0.424909, -3.674543, 0, 1, 0.5333334, 1,
-0.165132, 0.5627741, -0.6943041, 0, 1, 0.5372549, 1,
-0.1651177, 0.6463345, 0.3929179, 0, 1, 0.5450981, 1,
-0.1646501, 1.94268, 0.6107054, 0, 1, 0.5490196, 1,
-0.1633143, -1.352515, -4.403722, 0, 1, 0.5568628, 1,
-0.1609299, -1.970508, -2.989029, 0, 1, 0.5607843, 1,
-0.1599498, -0.7526722, -2.841296, 0, 1, 0.5686275, 1,
-0.154776, 0.4714716, 0.006644948, 0, 1, 0.572549, 1,
-0.1514608, -0.1547704, -1.342681, 0, 1, 0.5803922, 1,
-0.1498384, -0.02413666, -1.262437, 0, 1, 0.5843138, 1,
-0.1488841, -0.8776583, -3.451574, 0, 1, 0.5921569, 1,
-0.1469597, -0.6414604, -3.132311, 0, 1, 0.5960785, 1,
-0.1469291, -0.2003202, -2.890383, 0, 1, 0.6039216, 1,
-0.1355724, 0.374539, -0.08703102, 0, 1, 0.6117647, 1,
-0.1276247, 0.1424612, 0.319638, 0, 1, 0.6156863, 1,
-0.1262058, -0.391586, -2.381726, 0, 1, 0.6235294, 1,
-0.125748, -0.3630174, -2.302652, 0, 1, 0.627451, 1,
-0.12416, 0.8652215, 1.246899, 0, 1, 0.6352941, 1,
-0.1228636, 0.5169317, 0.8021641, 0, 1, 0.6392157, 1,
-0.1184362, 0.1596135, 0.5458038, 0, 1, 0.6470588, 1,
-0.1179722, -1.198907, -2.769555, 0, 1, 0.6509804, 1,
-0.1177407, 0.1592466, -0.9490589, 0, 1, 0.6588235, 1,
-0.1128088, -1.48181, -2.832539, 0, 1, 0.6627451, 1,
-0.1071532, 2.312794, 0.06110761, 0, 1, 0.6705883, 1,
-0.1070821, 0.5154942, -0.507803, 0, 1, 0.6745098, 1,
-0.1070367, 3.283014, 2.651564, 0, 1, 0.682353, 1,
-0.1030074, -1.283009, -2.989875, 0, 1, 0.6862745, 1,
-0.1027172, -0.2470057, -2.571873, 0, 1, 0.6941177, 1,
-0.100423, -0.351137, -4.205528, 0, 1, 0.7019608, 1,
-0.09562306, 0.7461264, -1.295531, 0, 1, 0.7058824, 1,
-0.0923932, 1.473932, -0.4990323, 0, 1, 0.7137255, 1,
-0.09063042, 1.911893, 0.2457827, 0, 1, 0.7176471, 1,
-0.08969271, -0.5227022, -1.399681, 0, 1, 0.7254902, 1,
-0.08894668, 0.2743861, -0.08048026, 0, 1, 0.7294118, 1,
-0.08609298, -0.5553056, -1.393846, 0, 1, 0.7372549, 1,
-0.08205024, 0.3181306, -0.620847, 0, 1, 0.7411765, 1,
-0.08147141, -0.8033977, -4.25479, 0, 1, 0.7490196, 1,
-0.07990213, 0.7697436, 0.677433, 0, 1, 0.7529412, 1,
-0.07886632, 0.2511843, -1.028122, 0, 1, 0.7607843, 1,
-0.07642163, -0.7686173, -2.089758, 0, 1, 0.7647059, 1,
-0.07163876, -0.3173988, -2.185917, 0, 1, 0.772549, 1,
-0.07131817, 0.7965271, -1.760885, 0, 1, 0.7764706, 1,
-0.07054149, -0.02064422, -2.08015, 0, 1, 0.7843137, 1,
-0.07019193, -1.485773, -3.190792, 0, 1, 0.7882353, 1,
-0.06958047, 0.1939893, 1.656016, 0, 1, 0.7960784, 1,
-0.06656765, 1.807554, -0.1546331, 0, 1, 0.8039216, 1,
-0.06001622, 1.01053, 1.593405, 0, 1, 0.8078431, 1,
-0.05918315, 0.2687924, 0.7601207, 0, 1, 0.8156863, 1,
-0.05438371, -0.7259127, -3.402531, 0, 1, 0.8196079, 1,
-0.05403613, 1.148753, -1.764833, 0, 1, 0.827451, 1,
-0.05320485, -0.2095086, -3.465876, 0, 1, 0.8313726, 1,
-0.05241114, -0.2191526, -1.105153, 0, 1, 0.8392157, 1,
-0.04882436, 1.648182, -0.2867746, 0, 1, 0.8431373, 1,
-0.04686423, -1.429247, -2.745731, 0, 1, 0.8509804, 1,
-0.0452169, -0.47036, -2.956239, 0, 1, 0.854902, 1,
-0.04161337, 1.057167, 0.3768804, 0, 1, 0.8627451, 1,
-0.04031466, -1.449096, -3.680443, 0, 1, 0.8666667, 1,
-0.03844282, -2.230873, -2.828267, 0, 1, 0.8745098, 1,
-0.03689232, 0.5691317, 0.6597757, 0, 1, 0.8784314, 1,
-0.03557863, -1.612641, -4.333882, 0, 1, 0.8862745, 1,
-0.03402879, -1.343512, -2.457906, 0, 1, 0.8901961, 1,
-0.03307845, 1.493506, -0.9459347, 0, 1, 0.8980392, 1,
-0.03019486, -1.178137, -1.968311, 0, 1, 0.9058824, 1,
-0.02409725, 1.370644, -0.529762, 0, 1, 0.9098039, 1,
-0.01446971, -0.02558149, -3.057646, 0, 1, 0.9176471, 1,
-0.0140143, 0.2599469, 0.2858357, 0, 1, 0.9215686, 1,
-0.01270586, 0.8207186, 0.7872155, 0, 1, 0.9294118, 1,
-0.01261678, -1.122957, -3.003034, 0, 1, 0.9333333, 1,
-0.005949847, 1.50598, 0.08392436, 0, 1, 0.9411765, 1,
-0.003727731, 0.647956, 1.267983, 0, 1, 0.945098, 1,
0.007565966, -0.7411122, 1.955202, 0, 1, 0.9529412, 1,
0.009318272, -1.191257, 2.877162, 0, 1, 0.9568627, 1,
0.01111207, -1.19382, 2.797126, 0, 1, 0.9647059, 1,
0.01244415, -0.5954639, 2.803962, 0, 1, 0.9686275, 1,
0.01523783, -1.021866, 4.949834, 0, 1, 0.9764706, 1,
0.0185416, -0.7573845, 2.249287, 0, 1, 0.9803922, 1,
0.02128287, 1.067282, 0.1046987, 0, 1, 0.9882353, 1,
0.02276529, 1.101043, 0.9753571, 0, 1, 0.9921569, 1,
0.02377472, -0.2846273, 2.390658, 0, 1, 1, 1,
0.02410655, 0.5846877, 0.2471962, 0, 0.9921569, 1, 1,
0.02947911, -0.8564391, 3.625052, 0, 0.9882353, 1, 1,
0.03183648, 0.1755812, -1.311511, 0, 0.9803922, 1, 1,
0.03549939, -0.9904702, 3.430286, 0, 0.9764706, 1, 1,
0.03874175, 0.5892107, -0.4043506, 0, 0.9686275, 1, 1,
0.03921234, -1.165555, 5.310459, 0, 0.9647059, 1, 1,
0.04125129, 0.005254948, -0.3257836, 0, 0.9568627, 1, 1,
0.04273272, 0.6037233, -1.242964, 0, 0.9529412, 1, 1,
0.04509529, 1.672415, 1.148796, 0, 0.945098, 1, 1,
0.0497066, -1.284031, 2.510084, 0, 0.9411765, 1, 1,
0.05552989, 1.545653, -0.1983068, 0, 0.9333333, 1, 1,
0.05717833, 1.759611, 1.84832, 0, 0.9294118, 1, 1,
0.06079583, 0.5003881, -0.2512187, 0, 0.9215686, 1, 1,
0.06549275, 0.6898683, -0.3030413, 0, 0.9176471, 1, 1,
0.06830402, 0.05137754, -0.1379102, 0, 0.9098039, 1, 1,
0.06861012, -1.683409, 2.81379, 0, 0.9058824, 1, 1,
0.06884582, -0.4039679, 3.302342, 0, 0.8980392, 1, 1,
0.07086021, -0.582633, 3.445873, 0, 0.8901961, 1, 1,
0.07180028, -0.6548473, 1.701261, 0, 0.8862745, 1, 1,
0.0721077, 0.05536328, 0.006668562, 0, 0.8784314, 1, 1,
0.07217301, -0.6490558, 2.486643, 0, 0.8745098, 1, 1,
0.07314488, 1.158978, 0.6880151, 0, 0.8666667, 1, 1,
0.0753703, 1.576912, 0.5296472, 0, 0.8627451, 1, 1,
0.07803933, -1.485109, 3.10796, 0, 0.854902, 1, 1,
0.07861727, -0.6659579, 1.640468, 0, 0.8509804, 1, 1,
0.0787386, 0.4846383, -0.1793518, 0, 0.8431373, 1, 1,
0.08097868, -0.5163704, 3.663209, 0, 0.8392157, 1, 1,
0.08172608, -1.651195, 3.163991, 0, 0.8313726, 1, 1,
0.08244037, 0.355291, 1.182446, 0, 0.827451, 1, 1,
0.08452834, 0.7818968, 1.381903, 0, 0.8196079, 1, 1,
0.09030116, 0.8371693, -0.3719887, 0, 0.8156863, 1, 1,
0.09030638, -2.851097, 2.430806, 0, 0.8078431, 1, 1,
0.09184934, 0.1672939, 1.348119, 0, 0.8039216, 1, 1,
0.09415361, -1.562413, 2.460288, 0, 0.7960784, 1, 1,
0.0953579, -1.316715, 4.029703, 0, 0.7882353, 1, 1,
0.09833993, 0.05903368, 2.861204, 0, 0.7843137, 1, 1,
0.09834848, -1.956654, 4.600714, 0, 0.7764706, 1, 1,
0.102367, -0.4956508, 2.859574, 0, 0.772549, 1, 1,
0.1069816, 1.213969, 1.132676, 0, 0.7647059, 1, 1,
0.1084789, -0.4042318, 2.349398, 0, 0.7607843, 1, 1,
0.1107118, -1.233796, 3.861673, 0, 0.7529412, 1, 1,
0.1152353, -0.5588658, 3.941498, 0, 0.7490196, 1, 1,
0.1153311, 0.03034233, 1.489683, 0, 0.7411765, 1, 1,
0.1194686, -0.4617579, 4.25288, 0, 0.7372549, 1, 1,
0.121229, -0.4107278, 2.116245, 0, 0.7294118, 1, 1,
0.1320457, 0.8434418, -0.157985, 0, 0.7254902, 1, 1,
0.1324077, 0.2071436, 0.609214, 0, 0.7176471, 1, 1,
0.1330302, 0.04287143, 0.4386404, 0, 0.7137255, 1, 1,
0.1406191, 1.828961, 0.04837439, 0, 0.7058824, 1, 1,
0.1415886, -0.6558332, 3.518439, 0, 0.6980392, 1, 1,
0.1428035, 1.890786, -1.039198, 0, 0.6941177, 1, 1,
0.1441225, 0.9719977, -0.08645673, 0, 0.6862745, 1, 1,
0.14586, 0.007426695, 2.623188, 0, 0.682353, 1, 1,
0.1465558, 0.7305329, 0.9073683, 0, 0.6745098, 1, 1,
0.1479436, -0.08796763, 1.309303, 0, 0.6705883, 1, 1,
0.1496653, 0.5690899, -0.5012704, 0, 0.6627451, 1, 1,
0.1512514, 0.1717265, 0.5816344, 0, 0.6588235, 1, 1,
0.1527822, 0.1272859, -0.002578431, 0, 0.6509804, 1, 1,
0.1565695, 0.9797292, -1.442898, 0, 0.6470588, 1, 1,
0.1570512, -0.6802379, 1.84325, 0, 0.6392157, 1, 1,
0.1578203, 0.144193, -0.4402177, 0, 0.6352941, 1, 1,
0.1598377, -0.2525398, 2.370903, 0, 0.627451, 1, 1,
0.1604634, 1.442143, 0.2592045, 0, 0.6235294, 1, 1,
0.1658439, 0.001752983, 0.6346994, 0, 0.6156863, 1, 1,
0.1670204, 1.253088, 0.3601203, 0, 0.6117647, 1, 1,
0.1679334, -2.159689, 3.027675, 0, 0.6039216, 1, 1,
0.168522, -0.604758, 2.655678, 0, 0.5960785, 1, 1,
0.1700468, 1.609156, -0.6408935, 0, 0.5921569, 1, 1,
0.1718508, 0.02454489, 0.6661792, 0, 0.5843138, 1, 1,
0.1738963, 1.317345, -0.2578104, 0, 0.5803922, 1, 1,
0.1785944, -0.4735091, 2.880497, 0, 0.572549, 1, 1,
0.1799815, -1.947244, 2.910815, 0, 0.5686275, 1, 1,
0.1802021, -1.65922, 2.041656, 0, 0.5607843, 1, 1,
0.181339, -2.146879, 1.78384, 0, 0.5568628, 1, 1,
0.1827762, -1.964327, 3.766459, 0, 0.5490196, 1, 1,
0.1837521, -0.7667212, 3.990838, 0, 0.5450981, 1, 1,
0.1840802, -1.248955, 3.509823, 0, 0.5372549, 1, 1,
0.1868558, -2.304103, 2.231154, 0, 0.5333334, 1, 1,
0.1879031, -0.09934562, 1.971901, 0, 0.5254902, 1, 1,
0.1898566, -0.9453768, 3.000623, 0, 0.5215687, 1, 1,
0.1971356, -0.05818222, 3.198916, 0, 0.5137255, 1, 1,
0.1983764, 0.2839101, 0.9106188, 0, 0.509804, 1, 1,
0.1998857, 0.4876885, 0.05408192, 0, 0.5019608, 1, 1,
0.2003422, 2.814038, -1.388147, 0, 0.4941176, 1, 1,
0.2007372, -1.463082, 3.869579, 0, 0.4901961, 1, 1,
0.2013417, 1.519272, 0.2706114, 0, 0.4823529, 1, 1,
0.2073761, -0.7800807, 2.149796, 0, 0.4784314, 1, 1,
0.2102742, -0.05418416, 2.31725, 0, 0.4705882, 1, 1,
0.2161697, 0.195384, -0.7626833, 0, 0.4666667, 1, 1,
0.220405, -2.046925, 1.791186, 0, 0.4588235, 1, 1,
0.2230641, -2.393394, 4.020227, 0, 0.454902, 1, 1,
0.2262269, 0.4263317, 0.9866316, 0, 0.4470588, 1, 1,
0.2292482, -2.339493, 4.420079, 0, 0.4431373, 1, 1,
0.2324828, 1.901605, 0.655601, 0, 0.4352941, 1, 1,
0.2332186, -0.08300871, 2.05056, 0, 0.4313726, 1, 1,
0.2348865, 0.6699332, 0.0769571, 0, 0.4235294, 1, 1,
0.2403636, 0.7811444, -0.400017, 0, 0.4196078, 1, 1,
0.2438503, 0.4061772, 0.6676158, 0, 0.4117647, 1, 1,
0.2439065, -0.01580746, 3.326039, 0, 0.4078431, 1, 1,
0.247482, -0.723007, 3.085951, 0, 0.4, 1, 1,
0.2485128, -1.293826, 3.143557, 0, 0.3921569, 1, 1,
0.2519289, 0.3138231, 0.5182582, 0, 0.3882353, 1, 1,
0.2540459, 0.4682611, 0.9672468, 0, 0.3803922, 1, 1,
0.2550265, 0.2385884, 0.6830423, 0, 0.3764706, 1, 1,
0.2607771, 1.354843, 1.317136, 0, 0.3686275, 1, 1,
0.2620097, -1.060601, 2.022519, 0, 0.3647059, 1, 1,
0.2634367, -1.082907, 2.658377, 0, 0.3568628, 1, 1,
0.2668014, 0.2057018, 0.7150388, 0, 0.3529412, 1, 1,
0.2670738, -2.792247, 4.123785, 0, 0.345098, 1, 1,
0.2671876, -0.6939837, 1.865847, 0, 0.3411765, 1, 1,
0.2696154, 0.1759141, 0.4431459, 0, 0.3333333, 1, 1,
0.2722288, -0.06256551, 2.522753, 0, 0.3294118, 1, 1,
0.2723334, -0.9952351, 1.986689, 0, 0.3215686, 1, 1,
0.2773256, -1.111326, 4.501947, 0, 0.3176471, 1, 1,
0.2810034, 1.998081, -1.277687, 0, 0.3098039, 1, 1,
0.2857226, -0.5964079, 1.573892, 0, 0.3058824, 1, 1,
0.2906988, 0.4594863, -0.5333799, 0, 0.2980392, 1, 1,
0.2935605, -0.1436378, 0.2064464, 0, 0.2901961, 1, 1,
0.2947058, -0.5736324, 2.421271, 0, 0.2862745, 1, 1,
0.2982084, 1.991278, -0.008957181, 0, 0.2784314, 1, 1,
0.2985159, 0.08064961, -0.6452331, 0, 0.2745098, 1, 1,
0.3031146, 1.548695, 0.5157364, 0, 0.2666667, 1, 1,
0.3035483, -0.2286231, 3.748432, 0, 0.2627451, 1, 1,
0.3120448, 0.2831235, 1.372325, 0, 0.254902, 1, 1,
0.3158162, 0.04702554, 0.303257, 0, 0.2509804, 1, 1,
0.318089, -1.081657, 3.884042, 0, 0.2431373, 1, 1,
0.3185434, -0.8444808, 2.105206, 0, 0.2392157, 1, 1,
0.3196078, 0.1248805, 1.829677, 0, 0.2313726, 1, 1,
0.3196226, 1.12714, -0.1005231, 0, 0.227451, 1, 1,
0.3234828, -0.2528324, 1.918754, 0, 0.2196078, 1, 1,
0.3240708, -0.7643132, 2.739002, 0, 0.2156863, 1, 1,
0.3260307, -0.9825013, 1.589604, 0, 0.2078431, 1, 1,
0.3273059, 1.179389, -0.6898745, 0, 0.2039216, 1, 1,
0.3282607, 0.5391692, 1.510431, 0, 0.1960784, 1, 1,
0.3303735, -1.857651, 2.878858, 0, 0.1882353, 1, 1,
0.334269, -0.4368251, 3.846382, 0, 0.1843137, 1, 1,
0.3358207, 1.326105, 0.3757494, 0, 0.1764706, 1, 1,
0.3452215, -1.856, 2.441159, 0, 0.172549, 1, 1,
0.3491078, 0.5087925, 1.430147, 0, 0.1647059, 1, 1,
0.3533785, 0.9170918, -0.9115182, 0, 0.1607843, 1, 1,
0.3552789, 0.7276794, 1.936236, 0, 0.1529412, 1, 1,
0.3651623, -1.105735, 1.481466, 0, 0.1490196, 1, 1,
0.3674384, -0.9166703, 0.621306, 0, 0.1411765, 1, 1,
0.3683806, 0.7155456, -0.6971201, 0, 0.1372549, 1, 1,
0.37021, 0.9305136, -0.6778174, 0, 0.1294118, 1, 1,
0.3715432, -1.801589, 3.774344, 0, 0.1254902, 1, 1,
0.3719047, -0.1007004, 1.101733, 0, 0.1176471, 1, 1,
0.3759177, 1.006522, 0.3999723, 0, 0.1137255, 1, 1,
0.3793522, 0.9675823, 0.6900981, 0, 0.1058824, 1, 1,
0.3840753, 0.1525095, 3.301125, 0, 0.09803922, 1, 1,
0.3878616, -1.449755, 3.544299, 0, 0.09411765, 1, 1,
0.3882506, -0.4919582, 1.864123, 0, 0.08627451, 1, 1,
0.3914608, 1.391651, 0.3417228, 0, 0.08235294, 1, 1,
0.4006769, 1.270486, 1.353049, 0, 0.07450981, 1, 1,
0.4012492, 0.1810676, 0.8988431, 0, 0.07058824, 1, 1,
0.404118, 0.1839506, 0.9295061, 0, 0.0627451, 1, 1,
0.4072853, 0.2355889, 2.750435, 0, 0.05882353, 1, 1,
0.4081217, -0.239651, 1.660708, 0, 0.05098039, 1, 1,
0.408453, -2.242039, 3.496222, 0, 0.04705882, 1, 1,
0.4085018, 1.76045, 1.406616, 0, 0.03921569, 1, 1,
0.4106154, 0.1084532, 0.5878747, 0, 0.03529412, 1, 1,
0.4125315, -0.3407869, 4.726399, 0, 0.02745098, 1, 1,
0.4127325, -0.5567266, 1.400831, 0, 0.02352941, 1, 1,
0.4140461, -0.006001609, 1.492921, 0, 0.01568628, 1, 1,
0.4164803, -1.502225, 1.257821, 0, 0.01176471, 1, 1,
0.4187308, 1.242113, 1.544358, 0, 0.003921569, 1, 1,
0.4188658, 1.819177, -0.7600255, 0.003921569, 0, 1, 1,
0.4212534, 1.351543, 3.022933, 0.007843138, 0, 1, 1,
0.42176, 0.2153353, 0.8591037, 0.01568628, 0, 1, 1,
0.425053, -1.596523, 4.261139, 0.01960784, 0, 1, 1,
0.4310498, -0.6685644, 2.983421, 0.02745098, 0, 1, 1,
0.4323003, 0.8166376, 0.1042714, 0.03137255, 0, 1, 1,
0.437094, 0.2380982, -1.120332, 0.03921569, 0, 1, 1,
0.4383935, 0.9475549, 0.6659247, 0.04313726, 0, 1, 1,
0.4387986, -0.6977455, 1.696612, 0.05098039, 0, 1, 1,
0.4403894, 0.6528035, 1.745524, 0.05490196, 0, 1, 1,
0.4406795, 0.1772891, 0.2277936, 0.0627451, 0, 1, 1,
0.4472088, -0.6954128, 3.59088, 0.06666667, 0, 1, 1,
0.4477323, -2.199732, 2.085882, 0.07450981, 0, 1, 1,
0.460587, 1.282695, -0.6883845, 0.07843138, 0, 1, 1,
0.4645882, 0.6627412, 1.855015, 0.08627451, 0, 1, 1,
0.4689437, -0.6867187, 2.456385, 0.09019608, 0, 1, 1,
0.472551, -1.085643, 2.946167, 0.09803922, 0, 1, 1,
0.4740623, 1.244664, 2.203471, 0.1058824, 0, 1, 1,
0.4796122, -0.5312374, 1.425203, 0.1098039, 0, 1, 1,
0.4804029, 0.4821104, 0.3416173, 0.1176471, 0, 1, 1,
0.4805113, 0.03734248, 1.017113, 0.1215686, 0, 1, 1,
0.4807278, 1.230188, 0.844254, 0.1294118, 0, 1, 1,
0.4813649, -0.8573223, 3.213201, 0.1333333, 0, 1, 1,
0.4845607, -0.2074505, 2.561211, 0.1411765, 0, 1, 1,
0.4867618, 1.375596, -0.3772292, 0.145098, 0, 1, 1,
0.4890275, -1.136367, 4.079745, 0.1529412, 0, 1, 1,
0.4903206, -1.818738, 0.8144774, 0.1568628, 0, 1, 1,
0.4937674, 1.395305, 0.7019472, 0.1647059, 0, 1, 1,
0.4953851, -0.7591978, 3.060223, 0.1686275, 0, 1, 1,
0.4970968, 0.4880054, -0.9962898, 0.1764706, 0, 1, 1,
0.4971718, -0.4681497, 2.117047, 0.1803922, 0, 1, 1,
0.4972696, 1.826436, 0.9758151, 0.1882353, 0, 1, 1,
0.4994399, 0.6104022, 0.6079906, 0.1921569, 0, 1, 1,
0.4998671, -0.7588999, 3.408496, 0.2, 0, 1, 1,
0.5027325, 1.891881, 1.318652, 0.2078431, 0, 1, 1,
0.5050381, -1.017408, 2.187256, 0.2117647, 0, 1, 1,
0.5076261, -1.61796, 2.848286, 0.2196078, 0, 1, 1,
0.5116488, -0.3826521, -1.329937, 0.2235294, 0, 1, 1,
0.5127996, 1.352327, 1.980671, 0.2313726, 0, 1, 1,
0.5183089, 0.4992458, -0.2872353, 0.2352941, 0, 1, 1,
0.5185642, 0.5483431, 1.792141, 0.2431373, 0, 1, 1,
0.5308128, -0.02463553, 0.7663723, 0.2470588, 0, 1, 1,
0.5341625, -1.070101, 0.1676961, 0.254902, 0, 1, 1,
0.5370004, -0.5622673, 1.164994, 0.2588235, 0, 1, 1,
0.5378455, 1.020479, 0.6063176, 0.2666667, 0, 1, 1,
0.5464633, -0.1796064, 1.222074, 0.2705882, 0, 1, 1,
0.5466238, -1.49966, 2.560494, 0.2784314, 0, 1, 1,
0.5495675, -0.2890662, 1.536355, 0.282353, 0, 1, 1,
0.5506675, 0.1814232, 0.1049123, 0.2901961, 0, 1, 1,
0.5514944, -1.992134, 2.303765, 0.2941177, 0, 1, 1,
0.5586202, 0.08271629, 3.096051, 0.3019608, 0, 1, 1,
0.5598899, -1.496081, 3.413833, 0.3098039, 0, 1, 1,
0.5670069, -0.9032809, 2.052513, 0.3137255, 0, 1, 1,
0.5676588, -0.08017263, 2.917464, 0.3215686, 0, 1, 1,
0.5696277, -0.845456, 1.88956, 0.3254902, 0, 1, 1,
0.580146, -0.7057812, 0.3510615, 0.3333333, 0, 1, 1,
0.5804049, -0.1584093, 2.883002, 0.3372549, 0, 1, 1,
0.5833228, 0.462808, 1.292244, 0.345098, 0, 1, 1,
0.5886279, 0.3032029, 0.7225277, 0.3490196, 0, 1, 1,
0.5928553, 0.9375086, 0.46591, 0.3568628, 0, 1, 1,
0.5945531, -1.024956, 0.8726231, 0.3607843, 0, 1, 1,
0.5954816, 0.0873227, 0.7069196, 0.3686275, 0, 1, 1,
0.5962199, -1.113623, 3.13547, 0.372549, 0, 1, 1,
0.5965832, 1.133807, -0.3856335, 0.3803922, 0, 1, 1,
0.6039121, 1.102277, -0.02030153, 0.3843137, 0, 1, 1,
0.6068481, -0.09210671, 1.345928, 0.3921569, 0, 1, 1,
0.6084539, 0.2327035, 1.833047, 0.3960784, 0, 1, 1,
0.6087139, 0.3490584, 1.622097, 0.4039216, 0, 1, 1,
0.6091433, 1.427581, -0.1867282, 0.4117647, 0, 1, 1,
0.6100208, -1.682171, 2.723354, 0.4156863, 0, 1, 1,
0.6109107, -1.474942, 2.547244, 0.4235294, 0, 1, 1,
0.6131757, 0.4817874, 0.2448192, 0.427451, 0, 1, 1,
0.618282, 2.427861, 0.2665118, 0.4352941, 0, 1, 1,
0.6240978, -1.04591, 4.067924, 0.4392157, 0, 1, 1,
0.6243314, 2.398111, 0.02235565, 0.4470588, 0, 1, 1,
0.6302103, 0.350671, 0.007756073, 0.4509804, 0, 1, 1,
0.6347147, -1.185442, 3.023808, 0.4588235, 0, 1, 1,
0.635325, 0.849583, 0.07838924, 0.4627451, 0, 1, 1,
0.63896, -1.07928, 4.566988, 0.4705882, 0, 1, 1,
0.6398465, -0.2163759, 2.361223, 0.4745098, 0, 1, 1,
0.6418615, 0.7084851, 0.4212905, 0.4823529, 0, 1, 1,
0.6428693, -0.2224006, 2.129055, 0.4862745, 0, 1, 1,
0.6454009, -0.5454876, 2.634044, 0.4941176, 0, 1, 1,
0.6502525, 0.3247149, 0.9589973, 0.5019608, 0, 1, 1,
0.6593441, 1.973503, 0.2149455, 0.5058824, 0, 1, 1,
0.6619977, -3.166403, 0.9303282, 0.5137255, 0, 1, 1,
0.6642107, 0.0314266, 1.636674, 0.5176471, 0, 1, 1,
0.6650114, -0.0778484, 1.546456, 0.5254902, 0, 1, 1,
0.6759207, 0.04962258, 1.391402, 0.5294118, 0, 1, 1,
0.6784524, 0.6428658, 1.480228, 0.5372549, 0, 1, 1,
0.6854247, -0.9247212, 3.91193, 0.5411765, 0, 1, 1,
0.6896224, -0.02279733, 1.825826, 0.5490196, 0, 1, 1,
0.6935936, 0.5274519, -0.3027525, 0.5529412, 0, 1, 1,
0.6949638, -0.7962487, 0.7895783, 0.5607843, 0, 1, 1,
0.6955546, 0.7982305, 1.279944, 0.5647059, 0, 1, 1,
0.7011989, -1.103946, 5.25135, 0.572549, 0, 1, 1,
0.7040166, -0.09672667, 1.461208, 0.5764706, 0, 1, 1,
0.7094089, 0.0960946, 2.287246, 0.5843138, 0, 1, 1,
0.7097036, 0.883776, -0.1448296, 0.5882353, 0, 1, 1,
0.710853, -0.4598984, 2.910995, 0.5960785, 0, 1, 1,
0.7140068, 0.8135329, 1.736775, 0.6039216, 0, 1, 1,
0.7142182, 1.08297, -0.7503724, 0.6078432, 0, 1, 1,
0.7281101, -1.01246, 1.999155, 0.6156863, 0, 1, 1,
0.729187, -0.0838844, 1.318496, 0.6196079, 0, 1, 1,
0.7292803, 0.260849, 1.234878, 0.627451, 0, 1, 1,
0.7304578, -0.3455637, 1.808729, 0.6313726, 0, 1, 1,
0.7310383, 1.464339, 0.1476044, 0.6392157, 0, 1, 1,
0.734158, 0.4305695, 2.63261, 0.6431373, 0, 1, 1,
0.7351208, -0.9213492, 2.393128, 0.6509804, 0, 1, 1,
0.7360516, 0.2927207, 0.7021536, 0.654902, 0, 1, 1,
0.7362348, -1.232409, 2.152895, 0.6627451, 0, 1, 1,
0.7567282, -0.7461616, 2.385592, 0.6666667, 0, 1, 1,
0.756995, -0.1917111, 1.482844, 0.6745098, 0, 1, 1,
0.7587928, 2.076055, 1.49837, 0.6784314, 0, 1, 1,
0.7619329, -0.9240523, 1.493595, 0.6862745, 0, 1, 1,
0.7689825, -1.397766, 2.258862, 0.6901961, 0, 1, 1,
0.7714832, -0.7670823, 3.821536, 0.6980392, 0, 1, 1,
0.7732206, -1.29384, 2.040627, 0.7058824, 0, 1, 1,
0.7758304, -0.6041622, 0.4453236, 0.7098039, 0, 1, 1,
0.7799575, 1.696309, 0.5240894, 0.7176471, 0, 1, 1,
0.7817167, -1.816531, 2.230119, 0.7215686, 0, 1, 1,
0.7836386, 0.5781849, 2.54831, 0.7294118, 0, 1, 1,
0.7885996, -0.3550148, 2.11443, 0.7333333, 0, 1, 1,
0.7892634, 0.09084802, 3.082363, 0.7411765, 0, 1, 1,
0.7927234, 0.5141203, -0.7292339, 0.7450981, 0, 1, 1,
0.8059883, 0.2834624, 2.910511, 0.7529412, 0, 1, 1,
0.8103618, -0.2813919, 3.16885, 0.7568628, 0, 1, 1,
0.8113524, -0.6421586, 2.331456, 0.7647059, 0, 1, 1,
0.8124286, 1.092956, 0.6721738, 0.7686275, 0, 1, 1,
0.8171569, -1.118417, 3.168861, 0.7764706, 0, 1, 1,
0.8183513, -0.6688913, 1.614112, 0.7803922, 0, 1, 1,
0.8184958, 0.4418281, 0.7571177, 0.7882353, 0, 1, 1,
0.8218474, 1.796266, 1.262883, 0.7921569, 0, 1, 1,
0.8275029, 0.4981569, 2.128963, 0.8, 0, 1, 1,
0.8282228, 0.3131008, 0.6952605, 0.8078431, 0, 1, 1,
0.839727, -1.559133, 2.735953, 0.8117647, 0, 1, 1,
0.8401884, -1.17442, 4.71954, 0.8196079, 0, 1, 1,
0.8424153, -1.048076, 0.4086823, 0.8235294, 0, 1, 1,
0.8442038, 1.228959, 0.7443247, 0.8313726, 0, 1, 1,
0.8443471, 1.477272, -0.6270263, 0.8352941, 0, 1, 1,
0.8487321, -0.2156653, 4.071844, 0.8431373, 0, 1, 1,
0.8522189, 0.06382933, 0.7815927, 0.8470588, 0, 1, 1,
0.8537503, 0.1938009, 3.07003, 0.854902, 0, 1, 1,
0.8539841, -0.3060624, 0.3816182, 0.8588235, 0, 1, 1,
0.8594861, -0.529309, 1.725142, 0.8666667, 0, 1, 1,
0.8641602, 1.523691, -0.1793484, 0.8705882, 0, 1, 1,
0.8655614, 0.3032074, 0.5851499, 0.8784314, 0, 1, 1,
0.8672928, 1.72833, 2.097707, 0.8823529, 0, 1, 1,
0.8722165, 1.268037, 2.147927, 0.8901961, 0, 1, 1,
0.8787113, -0.2305408, 0.3699926, 0.8941177, 0, 1, 1,
0.8792626, -0.7471823, 1.543374, 0.9019608, 0, 1, 1,
0.8795488, 0.9439715, -1.500294, 0.9098039, 0, 1, 1,
0.8824767, -1.566581, 3.217065, 0.9137255, 0, 1, 1,
0.8836221, -0.1881644, 1.734833, 0.9215686, 0, 1, 1,
0.8857512, -1.29368, 3.097876, 0.9254902, 0, 1, 1,
0.8880171, -0.5053831, 1.944512, 0.9333333, 0, 1, 1,
0.8892394, 2.960163, -2.038308, 0.9372549, 0, 1, 1,
0.8933698, 0.5375357, 0.1452875, 0.945098, 0, 1, 1,
0.899415, -1.469473, 2.478677, 0.9490196, 0, 1, 1,
0.9005864, -0.3253119, 1.873331, 0.9568627, 0, 1, 1,
0.9009458, -1.159175, 2.501251, 0.9607843, 0, 1, 1,
0.9100872, -0.8355666, 3.52118, 0.9686275, 0, 1, 1,
0.9107839, 0.1553003, 0.2226431, 0.972549, 0, 1, 1,
0.9167207, -0.1958265, 3.002323, 0.9803922, 0, 1, 1,
0.9227893, 0.6544015, 2.207284, 0.9843137, 0, 1, 1,
0.9285638, -0.8655484, 4.068985, 0.9921569, 0, 1, 1,
0.9348572, -1.814328, 1.333431, 0.9960784, 0, 1, 1,
0.9387854, -0.6211138, 3.472041, 1, 0, 0.9960784, 1,
0.9457672, -0.2928557, 1.505922, 1, 0, 0.9882353, 1,
0.9483155, 1.886269, 0.3357604, 1, 0, 0.9843137, 1,
0.9517832, -0.1955715, 2.880317, 1, 0, 0.9764706, 1,
0.9524455, -0.6530004, 1.109144, 1, 0, 0.972549, 1,
0.9552205, 0.7484262, 1.898004, 1, 0, 0.9647059, 1,
0.9581677, 1.117328, -0.298189, 1, 0, 0.9607843, 1,
0.9624951, 0.03479848, 2.417063, 1, 0, 0.9529412, 1,
0.9678304, -0.3910303, 1.82238, 1, 0, 0.9490196, 1,
0.97167, -0.9868219, 3.596132, 1, 0, 0.9411765, 1,
0.9780124, 2.044534, 1.369885, 1, 0, 0.9372549, 1,
0.97837, 0.3218232, 1.058029, 1, 0, 0.9294118, 1,
0.9785205, -1.462982, 0.7027964, 1, 0, 0.9254902, 1,
0.9788852, 0.03671938, 1.266106, 1, 0, 0.9176471, 1,
0.9795833, -0.1088807, -0.1257434, 1, 0, 0.9137255, 1,
0.9828325, 1.264415, -1.240253, 1, 0, 0.9058824, 1,
0.9878303, 1.344752, -0.0232565, 1, 0, 0.9019608, 1,
0.9965304, -1.768381, 1.883179, 1, 0, 0.8941177, 1,
1.010317, -2.505107, 3.295068, 1, 0, 0.8862745, 1,
1.018174, 0.6286818, 2.414576, 1, 0, 0.8823529, 1,
1.01893, 1.779755, 1.315452, 1, 0, 0.8745098, 1,
1.028703, -0.8157517, 1.244068, 1, 0, 0.8705882, 1,
1.039889, -0.7075477, 2.708546, 1, 0, 0.8627451, 1,
1.039903, 1.170962, 1.301593, 1, 0, 0.8588235, 1,
1.043183, -0.3098066, 1.910051, 1, 0, 0.8509804, 1,
1.05406, -0.1736126, 1.706889, 1, 0, 0.8470588, 1,
1.056799, 0.7395144, 0.8213627, 1, 0, 0.8392157, 1,
1.065532, -0.7259048, 0.9457866, 1, 0, 0.8352941, 1,
1.070347, 0.7649931, 1.651235, 1, 0, 0.827451, 1,
1.078481, 0.837146, 2.146428, 1, 0, 0.8235294, 1,
1.083857, 0.6347808, 2.694867, 1, 0, 0.8156863, 1,
1.084297, -0.4136124, 1.415469, 1, 0, 0.8117647, 1,
1.084399, -0.3333927, 3.165672, 1, 0, 0.8039216, 1,
1.094926, -0.5226177, 3.837121, 1, 0, 0.7960784, 1,
1.097152, -0.8090016, 2.775939, 1, 0, 0.7921569, 1,
1.099515, 0.8885215, 1.597718, 1, 0, 0.7843137, 1,
1.101336, 0.1429831, 2.519166, 1, 0, 0.7803922, 1,
1.104064, 1.036151, 0.2488243, 1, 0, 0.772549, 1,
1.107331, -1.251059, 1.42218, 1, 0, 0.7686275, 1,
1.109567, -1.464509, 2.407792, 1, 0, 0.7607843, 1,
1.114854, -0.5327118, 0.9828981, 1, 0, 0.7568628, 1,
1.122803, 0.5552989, 1.322781, 1, 0, 0.7490196, 1,
1.128632, 0.4393697, 1.105232, 1, 0, 0.7450981, 1,
1.13255, 0.2305655, 3.054679, 1, 0, 0.7372549, 1,
1.138015, -0.6385725, 1.142331, 1, 0, 0.7333333, 1,
1.138819, 1.572859, 1.722256, 1, 0, 0.7254902, 1,
1.139978, -0.580952, 3.027174, 1, 0, 0.7215686, 1,
1.142404, 0.7617434, 1.74204, 1, 0, 0.7137255, 1,
1.144049, -0.01043961, 1.042771, 1, 0, 0.7098039, 1,
1.145099, -0.135009, 1.321225, 1, 0, 0.7019608, 1,
1.161258, 1.214197, 0.6568667, 1, 0, 0.6941177, 1,
1.166928, -0.08569317, 0.4625472, 1, 0, 0.6901961, 1,
1.173735, -0.9250714, 2.296369, 1, 0, 0.682353, 1,
1.180422, 0.3782432, 2.591336, 1, 0, 0.6784314, 1,
1.185699, 1.474011, -0.7045872, 1, 0, 0.6705883, 1,
1.216551, -1.689077, 2.156111, 1, 0, 0.6666667, 1,
1.221013, -0.5946103, 1.405603, 1, 0, 0.6588235, 1,
1.224762, 2.616634, -1.704361, 1, 0, 0.654902, 1,
1.227534, -1.158835, 2.960887, 1, 0, 0.6470588, 1,
1.230671, -0.6541337, 2.25431, 1, 0, 0.6431373, 1,
1.231239, -0.09925332, 2.578091, 1, 0, 0.6352941, 1,
1.232239, -0.1596452, 0.7152418, 1, 0, 0.6313726, 1,
1.234148, -0.8645704, 3.184958, 1, 0, 0.6235294, 1,
1.237857, -1.034735, -0.3649731, 1, 0, 0.6196079, 1,
1.247948, -0.2887369, 2.646214, 1, 0, 0.6117647, 1,
1.253536, 0.8920724, 1.763924, 1, 0, 0.6078432, 1,
1.256082, -0.4807091, 1.031441, 1, 0, 0.6, 1,
1.262146, 1.12693, 0.5581897, 1, 0, 0.5921569, 1,
1.265388, -1.247181, 2.792225, 1, 0, 0.5882353, 1,
1.280056, -0.1022254, 2.619475, 1, 0, 0.5803922, 1,
1.280438, 0.09978097, 1.333259, 1, 0, 0.5764706, 1,
1.284022, -0.04083138, -0.2793693, 1, 0, 0.5686275, 1,
1.285998, -0.5510532, 0.8365231, 1, 0, 0.5647059, 1,
1.287388, 0.9199331, -0.060041, 1, 0, 0.5568628, 1,
1.293008, 0.3637321, -1.079038, 1, 0, 0.5529412, 1,
1.295061, 0.4382671, 1.604376, 1, 0, 0.5450981, 1,
1.315719, 0.8657248, 0.5197532, 1, 0, 0.5411765, 1,
1.317388, -0.9808549, 3.015705, 1, 0, 0.5333334, 1,
1.319297, -0.1401912, 2.977578, 1, 0, 0.5294118, 1,
1.329813, 0.1047, 1.315331, 1, 0, 0.5215687, 1,
1.356531, -1.526038, 3.19704, 1, 0, 0.5176471, 1,
1.358157, 0.789817, 1.231986, 1, 0, 0.509804, 1,
1.372417, -0.8862859, 1.538032, 1, 0, 0.5058824, 1,
1.385659, 0.03965231, 1.403931, 1, 0, 0.4980392, 1,
1.394845, 0.844287, 3.427246, 1, 0, 0.4901961, 1,
1.412873, 0.3467315, 1.324391, 1, 0, 0.4862745, 1,
1.417388, -0.3465312, 1.095786, 1, 0, 0.4784314, 1,
1.418182, -1.040106, 2.32945, 1, 0, 0.4745098, 1,
1.425329, 0.8069041, 0.6461914, 1, 0, 0.4666667, 1,
1.440405, 2.019674, 0.7656012, 1, 0, 0.4627451, 1,
1.450381, 0.5224858, 1.60269, 1, 0, 0.454902, 1,
1.454599, 0.7017909, 1.060369, 1, 0, 0.4509804, 1,
1.457809, -0.684532, 2.528788, 1, 0, 0.4431373, 1,
1.460317, 0.1519614, -0.7619351, 1, 0, 0.4392157, 1,
1.463903, -0.2195378, 1.178667, 1, 0, 0.4313726, 1,
1.468134, 0.4716208, 1.649587, 1, 0, 0.427451, 1,
1.469876, -1.443998, 1.66199, 1, 0, 0.4196078, 1,
1.482748, 0.7540538, 0.8464659, 1, 0, 0.4156863, 1,
1.490145, 1.060997, 3.747607, 1, 0, 0.4078431, 1,
1.500947, 1.703981, 1.944156, 1, 0, 0.4039216, 1,
1.501166, -0.2310949, 0.5517799, 1, 0, 0.3960784, 1,
1.509489, 0.4000674, 2.985065, 1, 0, 0.3882353, 1,
1.5104, 0.1226767, 0.074181, 1, 0, 0.3843137, 1,
1.512092, -1.497709, 0.3907971, 1, 0, 0.3764706, 1,
1.512861, -0.794005, 1.323643, 1, 0, 0.372549, 1,
1.526929, -0.5536447, 2.457331, 1, 0, 0.3647059, 1,
1.531052, -0.3763438, -0.1201868, 1, 0, 0.3607843, 1,
1.569571, -1.421594, 4.625313, 1, 0, 0.3529412, 1,
1.577031, 0.3623535, 1.533509, 1, 0, 0.3490196, 1,
1.581872, -0.3727055, 1.155984, 1, 0, 0.3411765, 1,
1.585195, 0.3308284, 3.926476, 1, 0, 0.3372549, 1,
1.594593, -0.1151248, 3.048797, 1, 0, 0.3294118, 1,
1.594701, -1.534046, 2.714157, 1, 0, 0.3254902, 1,
1.597731, -0.4336952, 3.393788, 1, 0, 0.3176471, 1,
1.598774, -1.530063, 3.114625, 1, 0, 0.3137255, 1,
1.603812, -0.2425399, -0.2388664, 1, 0, 0.3058824, 1,
1.648746, -2.537568, 3.449798, 1, 0, 0.2980392, 1,
1.658435, 0.8634284, 0.8713019, 1, 0, 0.2941177, 1,
1.683125, -0.04920844, 1.592049, 1, 0, 0.2862745, 1,
1.685522, 0.7680019, 3.28335, 1, 0, 0.282353, 1,
1.685877, -0.4582741, 1.155975, 1, 0, 0.2745098, 1,
1.705659, 0.07660556, 1.666384, 1, 0, 0.2705882, 1,
1.711624, 0.1188152, 0.4524195, 1, 0, 0.2627451, 1,
1.714436, -0.6517297, 2.711404, 1, 0, 0.2588235, 1,
1.754696, -0.4448385, 3.466094, 1, 0, 0.2509804, 1,
1.757831, -0.8727588, 2.408399, 1, 0, 0.2470588, 1,
1.781591, 0.02367215, 1.874996, 1, 0, 0.2392157, 1,
1.781864, -0.1438998, 1.236133, 1, 0, 0.2352941, 1,
1.796371, 0.7093202, -1.205707, 1, 0, 0.227451, 1,
1.796984, 0.8560194, 0.07738534, 1, 0, 0.2235294, 1,
1.802712, -0.8470063, -0.355202, 1, 0, 0.2156863, 1,
1.803828, -1.439581, 2.695002, 1, 0, 0.2117647, 1,
1.811408, -0.02294646, 1.158854, 1, 0, 0.2039216, 1,
1.818003, -1.726247, 3.601821, 1, 0, 0.1960784, 1,
1.843969, 0.4836698, 2.449467, 1, 0, 0.1921569, 1,
1.8966, 0.622188, 0.437841, 1, 0, 0.1843137, 1,
1.898188, -1.929655, 2.861504, 1, 0, 0.1803922, 1,
1.906473, -0.0356963, 2.388062, 1, 0, 0.172549, 1,
1.935407, 0.8778596, 0.6094574, 1, 0, 0.1686275, 1,
1.936416, 1.193269, 0.5573036, 1, 0, 0.1607843, 1,
1.940593, -0.001284005, 1.834894, 1, 0, 0.1568628, 1,
1.981495, -1.259301, 0.5668048, 1, 0, 0.1490196, 1,
1.988239, 0.2138737, 1.034632, 1, 0, 0.145098, 1,
2.000153, -2.015483, 2.150262, 1, 0, 0.1372549, 1,
2.033428, -0.1717066, 0.4495596, 1, 0, 0.1333333, 1,
2.04539, 2.480551, 2.372054, 1, 0, 0.1254902, 1,
2.052999, 0.6660312, -0.1176277, 1, 0, 0.1215686, 1,
2.058777, 0.2221989, 0.1485702, 1, 0, 0.1137255, 1,
2.116313, -0.09055298, 0.9322362, 1, 0, 0.1098039, 1,
2.12486, -1.720296, 1.7437, 1, 0, 0.1019608, 1,
2.162295, 0.1702401, 1.076181, 1, 0, 0.09411765, 1,
2.170705, -0.1983991, -0.2112711, 1, 0, 0.09019608, 1,
2.190542, -0.1601998, 0.6109579, 1, 0, 0.08235294, 1,
2.2149, -0.338968, 1.786646, 1, 0, 0.07843138, 1,
2.31863, -1.316386, 2.283098, 1, 0, 0.07058824, 1,
2.322785, 0.05675018, 1.963528, 1, 0, 0.06666667, 1,
2.402026, -1.284699, 2.695732, 1, 0, 0.05882353, 1,
2.440957, -0.1492473, -0.694031, 1, 0, 0.05490196, 1,
2.451751, 0.2075281, 2.468251, 1, 0, 0.04705882, 1,
2.490399, 0.8344132, 2.108375, 1, 0, 0.04313726, 1,
2.589895, -0.302204, 1.502085, 1, 0, 0.03529412, 1,
2.649815, 1.070523, 0.5843896, 1, 0, 0.03137255, 1,
2.788029, -0.09032229, 0.8947968, 1, 0, 0.02352941, 1,
2.88715, -0.2257531, 0.510857, 1, 0, 0.01960784, 1,
3.816411, 0.6747942, 2.01637, 1, 0, 0.01176471, 1,
4.061921, 0.8585184, 2.191046, 1, 0, 0.007843138, 1
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
0.5758531, -4.297649, -7.083447, 0, -0.5, 0.5, 0.5,
0.5758531, -4.297649, -7.083447, 1, -0.5, 0.5, 0.5,
0.5758531, -4.297649, -7.083447, 1, 1.5, 0.5, 0.5,
0.5758531, -4.297649, -7.083447, 0, 1.5, 0.5, 0.5
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
-4.091991, 0.04202938, -7.083447, 0, -0.5, 0.5, 0.5,
-4.091991, 0.04202938, -7.083447, 1, -0.5, 0.5, 0.5,
-4.091991, 0.04202938, -7.083447, 1, 1.5, 0.5, 0.5,
-4.091991, 0.04202938, -7.083447, 0, 1.5, 0.5, 0.5
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
-4.091991, -4.297649, 0.0116539, 0, -0.5, 0.5, 0.5,
-4.091991, -4.297649, 0.0116539, 1, -0.5, 0.5, 0.5,
-4.091991, -4.297649, 0.0116539, 1, 1.5, 0.5, 0.5,
-4.091991, -4.297649, 0.0116539, 0, 1.5, 0.5, 0.5
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
-2, -3.296185, -5.446115,
4, -3.296185, -5.446115,
-2, -3.296185, -5.446115,
-2, -3.463096, -5.719004,
-1, -3.296185, -5.446115,
-1, -3.463096, -5.719004,
0, -3.296185, -5.446115,
0, -3.463096, -5.719004,
1, -3.296185, -5.446115,
1, -3.463096, -5.719004,
2, -3.296185, -5.446115,
2, -3.463096, -5.719004,
3, -3.296185, -5.446115,
3, -3.463096, -5.719004,
4, -3.296185, -5.446115,
4, -3.463096, -5.719004
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
"3",
"4"
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
-2, -3.796917, -6.264781, 0, -0.5, 0.5, 0.5,
-2, -3.796917, -6.264781, 1, -0.5, 0.5, 0.5,
-2, -3.796917, -6.264781, 1, 1.5, 0.5, 0.5,
-2, -3.796917, -6.264781, 0, 1.5, 0.5, 0.5,
-1, -3.796917, -6.264781, 0, -0.5, 0.5, 0.5,
-1, -3.796917, -6.264781, 1, -0.5, 0.5, 0.5,
-1, -3.796917, -6.264781, 1, 1.5, 0.5, 0.5,
-1, -3.796917, -6.264781, 0, 1.5, 0.5, 0.5,
0, -3.796917, -6.264781, 0, -0.5, 0.5, 0.5,
0, -3.796917, -6.264781, 1, -0.5, 0.5, 0.5,
0, -3.796917, -6.264781, 1, 1.5, 0.5, 0.5,
0, -3.796917, -6.264781, 0, 1.5, 0.5, 0.5,
1, -3.796917, -6.264781, 0, -0.5, 0.5, 0.5,
1, -3.796917, -6.264781, 1, -0.5, 0.5, 0.5,
1, -3.796917, -6.264781, 1, 1.5, 0.5, 0.5,
1, -3.796917, -6.264781, 0, 1.5, 0.5, 0.5,
2, -3.796917, -6.264781, 0, -0.5, 0.5, 0.5,
2, -3.796917, -6.264781, 1, -0.5, 0.5, 0.5,
2, -3.796917, -6.264781, 1, 1.5, 0.5, 0.5,
2, -3.796917, -6.264781, 0, 1.5, 0.5, 0.5,
3, -3.796917, -6.264781, 0, -0.5, 0.5, 0.5,
3, -3.796917, -6.264781, 1, -0.5, 0.5, 0.5,
3, -3.796917, -6.264781, 1, 1.5, 0.5, 0.5,
3, -3.796917, -6.264781, 0, 1.5, 0.5, 0.5,
4, -3.796917, -6.264781, 0, -0.5, 0.5, 0.5,
4, -3.796917, -6.264781, 1, -0.5, 0.5, 0.5,
4, -3.796917, -6.264781, 1, 1.5, 0.5, 0.5,
4, -3.796917, -6.264781, 0, 1.5, 0.5, 0.5
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
-3.014796, -3, -5.446115,
-3.014796, 3, -5.446115,
-3.014796, -3, -5.446115,
-3.194329, -3, -5.719004,
-3.014796, -2, -5.446115,
-3.194329, -2, -5.719004,
-3.014796, -1, -5.446115,
-3.194329, -1, -5.719004,
-3.014796, 0, -5.446115,
-3.194329, 0, -5.719004,
-3.014796, 1, -5.446115,
-3.194329, 1, -5.719004,
-3.014796, 2, -5.446115,
-3.194329, 2, -5.719004,
-3.014796, 3, -5.446115,
-3.194329, 3, -5.719004
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
-3.553394, -3, -6.264781, 0, -0.5, 0.5, 0.5,
-3.553394, -3, -6.264781, 1, -0.5, 0.5, 0.5,
-3.553394, -3, -6.264781, 1, 1.5, 0.5, 0.5,
-3.553394, -3, -6.264781, 0, 1.5, 0.5, 0.5,
-3.553394, -2, -6.264781, 0, -0.5, 0.5, 0.5,
-3.553394, -2, -6.264781, 1, -0.5, 0.5, 0.5,
-3.553394, -2, -6.264781, 1, 1.5, 0.5, 0.5,
-3.553394, -2, -6.264781, 0, 1.5, 0.5, 0.5,
-3.553394, -1, -6.264781, 0, -0.5, 0.5, 0.5,
-3.553394, -1, -6.264781, 1, -0.5, 0.5, 0.5,
-3.553394, -1, -6.264781, 1, 1.5, 0.5, 0.5,
-3.553394, -1, -6.264781, 0, 1.5, 0.5, 0.5,
-3.553394, 0, -6.264781, 0, -0.5, 0.5, 0.5,
-3.553394, 0, -6.264781, 1, -0.5, 0.5, 0.5,
-3.553394, 0, -6.264781, 1, 1.5, 0.5, 0.5,
-3.553394, 0, -6.264781, 0, 1.5, 0.5, 0.5,
-3.553394, 1, -6.264781, 0, -0.5, 0.5, 0.5,
-3.553394, 1, -6.264781, 1, -0.5, 0.5, 0.5,
-3.553394, 1, -6.264781, 1, 1.5, 0.5, 0.5,
-3.553394, 1, -6.264781, 0, 1.5, 0.5, 0.5,
-3.553394, 2, -6.264781, 0, -0.5, 0.5, 0.5,
-3.553394, 2, -6.264781, 1, -0.5, 0.5, 0.5,
-3.553394, 2, -6.264781, 1, 1.5, 0.5, 0.5,
-3.553394, 2, -6.264781, 0, 1.5, 0.5, 0.5,
-3.553394, 3, -6.264781, 0, -0.5, 0.5, 0.5,
-3.553394, 3, -6.264781, 1, -0.5, 0.5, 0.5,
-3.553394, 3, -6.264781, 1, 1.5, 0.5, 0.5,
-3.553394, 3, -6.264781, 0, 1.5, 0.5, 0.5
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
-3.014796, -3.296185, -4,
-3.014796, -3.296185, 4,
-3.014796, -3.296185, -4,
-3.194329, -3.463096, -4,
-3.014796, -3.296185, -2,
-3.194329, -3.463096, -2,
-3.014796, -3.296185, 0,
-3.194329, -3.463096, 0,
-3.014796, -3.296185, 2,
-3.194329, -3.463096, 2,
-3.014796, -3.296185, 4,
-3.194329, -3.463096, 4
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
-3.553394, -3.796917, -4, 0, -0.5, 0.5, 0.5,
-3.553394, -3.796917, -4, 1, -0.5, 0.5, 0.5,
-3.553394, -3.796917, -4, 1, 1.5, 0.5, 0.5,
-3.553394, -3.796917, -4, 0, 1.5, 0.5, 0.5,
-3.553394, -3.796917, -2, 0, -0.5, 0.5, 0.5,
-3.553394, -3.796917, -2, 1, -0.5, 0.5, 0.5,
-3.553394, -3.796917, -2, 1, 1.5, 0.5, 0.5,
-3.553394, -3.796917, -2, 0, 1.5, 0.5, 0.5,
-3.553394, -3.796917, 0, 0, -0.5, 0.5, 0.5,
-3.553394, -3.796917, 0, 1, -0.5, 0.5, 0.5,
-3.553394, -3.796917, 0, 1, 1.5, 0.5, 0.5,
-3.553394, -3.796917, 0, 0, 1.5, 0.5, 0.5,
-3.553394, -3.796917, 2, 0, -0.5, 0.5, 0.5,
-3.553394, -3.796917, 2, 1, -0.5, 0.5, 0.5,
-3.553394, -3.796917, 2, 1, 1.5, 0.5, 0.5,
-3.553394, -3.796917, 2, 0, 1.5, 0.5, 0.5,
-3.553394, -3.796917, 4, 0, -0.5, 0.5, 0.5,
-3.553394, -3.796917, 4, 1, -0.5, 0.5, 0.5,
-3.553394, -3.796917, 4, 1, 1.5, 0.5, 0.5,
-3.553394, -3.796917, 4, 0, 1.5, 0.5, 0.5
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
-3.014796, -3.296185, -5.446115,
-3.014796, 3.380244, -5.446115,
-3.014796, -3.296185, 5.469423,
-3.014796, 3.380244, 5.469423,
-3.014796, -3.296185, -5.446115,
-3.014796, -3.296185, 5.469423,
-3.014796, 3.380244, -5.446115,
-3.014796, 3.380244, 5.469423,
-3.014796, -3.296185, -5.446115,
4.166502, -3.296185, -5.446115,
-3.014796, -3.296185, 5.469423,
4.166502, -3.296185, 5.469423,
-3.014796, 3.380244, -5.446115,
4.166502, 3.380244, -5.446115,
-3.014796, 3.380244, 5.469423,
4.166502, 3.380244, 5.469423,
4.166502, -3.296185, -5.446115,
4.166502, 3.380244, -5.446115,
4.166502, -3.296185, 5.469423,
4.166502, 3.380244, 5.469423,
4.166502, -3.296185, -5.446115,
4.166502, -3.296185, 5.469423,
4.166502, 3.380244, -5.446115,
4.166502, 3.380244, 5.469423
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
var radius = 7.835057;
var distance = 34.85906;
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
mvMatrix.translate( -0.5758531, -0.04202938, -0.0116539 );
mvMatrix.scale( 1.17965, 1.268855, 0.7760879 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.85906);
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
S-ethyl_di-propylthi<-read.table("S-ethyl_di-propylthi.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-S-ethyl_di-propylthi$V2
```

```
## Error in eval(expr, envir, enclos): object 'S' not found
```

```r
y<-S-ethyl_di-propylthi$V3
```

```
## Error in eval(expr, envir, enclos): object 'S' not found
```

```r
z<-S-ethyl_di-propylthi$V4
```

```
## Error in eval(expr, envir, enclos): object 'S' not found
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
-2.910214, -0.117628, -0.9621181, 0, 0, 1, 1, 1,
-2.860501, 0.2257785, -1.791737, 1, 0, 0, 1, 1,
-2.844605, -0.06505215, -0.1369357, 1, 0, 0, 1, 1,
-2.806266, 0.5368305, -1.060952, 1, 0, 0, 1, 1,
-2.658643, -0.206917, 0.05893389, 1, 0, 0, 1, 1,
-2.6226, 0.7582061, -1.833552, 1, 0, 0, 1, 1,
-2.565285, -0.3609544, -3.710458, 0, 0, 0, 1, 1,
-2.531641, -0.3972962, -3.153619, 0, 0, 0, 1, 1,
-2.360868, -1.182511, -2.971065, 0, 0, 0, 1, 1,
-2.353171, -0.01571793, -1.322004, 0, 0, 0, 1, 1,
-2.341031, 0.4606215, -2.560201, 0, 0, 0, 1, 1,
-2.296971, -0.1588681, -2.880062, 0, 0, 0, 1, 1,
-2.294325, -0.2087167, -4.911959, 0, 0, 0, 1, 1,
-2.290863, 1.280694, -0.4554422, 1, 1, 1, 1, 1,
-2.28853, -0.9056941, -2.617457, 1, 1, 1, 1, 1,
-2.241864, 0.1746525, -1.669076, 1, 1, 1, 1, 1,
-2.238026, -0.5753183, -1.150651, 1, 1, 1, 1, 1,
-2.203303, 0.8492128, -1.570766, 1, 1, 1, 1, 1,
-2.189768, 1.882805, -1.346701, 1, 1, 1, 1, 1,
-2.166534, -2.155162, -3.517725, 1, 1, 1, 1, 1,
-2.153057, 0.8038151, 0.04329165, 1, 1, 1, 1, 1,
-2.12214, -0.288104, -0.9698666, 1, 1, 1, 1, 1,
-2.08166, 1.098289, -0.5180801, 1, 1, 1, 1, 1,
-2.043401, 0.607433, 0.06725623, 1, 1, 1, 1, 1,
-2.03299, -0.5493889, -1.244889, 1, 1, 1, 1, 1,
-2.032594, -0.8602117, -1.408598, 1, 1, 1, 1, 1,
-2.028686, 0.3773862, -1.049062, 1, 1, 1, 1, 1,
-2.02349, 0.1187494, -2.486038, 1, 1, 1, 1, 1,
-1.99288, -1.093727, -1.760271, 0, 0, 1, 1, 1,
-1.981895, 0.8910835, -0.3929636, 1, 0, 0, 1, 1,
-1.974582, 1.868409, 0.6206197, 1, 0, 0, 1, 1,
-1.94766, 0.4274971, -2.267375, 1, 0, 0, 1, 1,
-1.941924, 0.6331331, 0.5654715, 1, 0, 0, 1, 1,
-1.874981, -0.2150014, -2.600412, 1, 0, 0, 1, 1,
-1.855851, 0.4613309, -0.1145848, 0, 0, 0, 1, 1,
-1.852467, -0.2536991, -1.955504, 0, 0, 0, 1, 1,
-1.806542, 1.216707, -1.846446, 0, 0, 0, 1, 1,
-1.793583, -1.894456, -3.458907, 0, 0, 0, 1, 1,
-1.792601, 0.1948614, -1.803725, 0, 0, 0, 1, 1,
-1.783041, 0.222022, -0.07278094, 0, 0, 0, 1, 1,
-1.775124, -0.7557649, -1.952947, 0, 0, 0, 1, 1,
-1.769397, 1.108211, -2.441215, 1, 1, 1, 1, 1,
-1.766438, -1.860196, -3.424316, 1, 1, 1, 1, 1,
-1.765833, 0.6462168, -0.2002866, 1, 1, 1, 1, 1,
-1.740398, -1.656499, -1.71034, 1, 1, 1, 1, 1,
-1.720616, -0.3344065, -1.620169, 1, 1, 1, 1, 1,
-1.720511, 0.1488718, -0.1470514, 1, 1, 1, 1, 1,
-1.707054, -0.5876313, -1.113037, 1, 1, 1, 1, 1,
-1.698218, -0.336693, -2.086572, 1, 1, 1, 1, 1,
-1.698023, -0.5245918, -2.25124, 1, 1, 1, 1, 1,
-1.67715, -2.035682, -2.254758, 1, 1, 1, 1, 1,
-1.664841, -1.308722, -1.533825, 1, 1, 1, 1, 1,
-1.654465, -0.2063092, -1.226365, 1, 1, 1, 1, 1,
-1.632566, -1.254691, -2.789299, 1, 1, 1, 1, 1,
-1.624673, 0.1818528, -0.1690335, 1, 1, 1, 1, 1,
-1.623557, 2.405941, 1.337615, 1, 1, 1, 1, 1,
-1.62034, 0.5413979, -0.1961668, 0, 0, 1, 1, 1,
-1.612185, 0.4178568, -2.853063, 1, 0, 0, 1, 1,
-1.611226, 0.3211237, -1.698854, 1, 0, 0, 1, 1,
-1.592998, -1.507701, -1.360023, 1, 0, 0, 1, 1,
-1.589204, 0.2216699, -0.6852675, 1, 0, 0, 1, 1,
-1.583014, -0.1925751, -1.749568, 1, 0, 0, 1, 1,
-1.582802, 1.244078, -1.030745, 0, 0, 0, 1, 1,
-1.571828, 0.8025602, -1.444615, 0, 0, 0, 1, 1,
-1.570916, -1.60429, -2.438724, 0, 0, 0, 1, 1,
-1.529553, 0.84969, -0.8053485, 0, 0, 0, 1, 1,
-1.522316, -1.593452, -1.829311, 0, 0, 0, 1, 1,
-1.514461, 0.5546353, -0.9372582, 0, 0, 0, 1, 1,
-1.49771, 0.5742701, -1.191763, 0, 0, 0, 1, 1,
-1.490912, 0.9975193, -0.08485729, 1, 1, 1, 1, 1,
-1.481894, -0.820092, -4.003207, 1, 1, 1, 1, 1,
-1.47634, -0.5213017, 0.2442924, 1, 1, 1, 1, 1,
-1.465633, -0.6656191, -0.7420703, 1, 1, 1, 1, 1,
-1.452193, -0.8176892, -2.160645, 1, 1, 1, 1, 1,
-1.44761, -0.1684258, -2.446021, 1, 1, 1, 1, 1,
-1.444029, -0.4314225, -0.6941303, 1, 1, 1, 1, 1,
-1.440878, -0.6137497, -1.318067, 1, 1, 1, 1, 1,
-1.423306, 1.579716, -0.7906538, 1, 1, 1, 1, 1,
-1.415858, 1.503048, -0.7890613, 1, 1, 1, 1, 1,
-1.414708, 0.4566438, -1.074189, 1, 1, 1, 1, 1,
-1.413665, 0.6366505, -2.898405, 1, 1, 1, 1, 1,
-1.412533, -0.4349631, -0.2556078, 1, 1, 1, 1, 1,
-1.397382, -2.054271, -0.6804559, 1, 1, 1, 1, 1,
-1.396618, 0.6066543, -2.562214, 1, 1, 1, 1, 1,
-1.394939, 0.52299, 0.9923233, 0, 0, 1, 1, 1,
-1.378528, 1.342456, 0.7477818, 1, 0, 0, 1, 1,
-1.372669, -1.607461, -2.091469, 1, 0, 0, 1, 1,
-1.371661, -0.8094718, -1.861067, 1, 0, 0, 1, 1,
-1.370884, 0.03399137, -0.5334563, 1, 0, 0, 1, 1,
-1.367255, -1.334549, -3.456871, 1, 0, 0, 1, 1,
-1.364413, 0.2053405, -2.674174, 0, 0, 0, 1, 1,
-1.36208, -1.126474, 0.08989201, 0, 0, 0, 1, 1,
-1.360881, -0.169192, -1.485707, 0, 0, 0, 1, 1,
-1.354672, -0.06698794, -0.8829831, 0, 0, 0, 1, 1,
-1.34023, 0.9551164, -0.8867142, 0, 0, 0, 1, 1,
-1.339499, -0.1128653, -3.478485, 0, 0, 0, 1, 1,
-1.336566, -0.1721551, -2.096271, 0, 0, 0, 1, 1,
-1.335217, 1.025361, -0.8294654, 1, 1, 1, 1, 1,
-1.329811, 0.5038895, -0.7798628, 1, 1, 1, 1, 1,
-1.329201, -0.2169666, -2.385157, 1, 1, 1, 1, 1,
-1.323474, -0.08335334, -2.319651, 1, 1, 1, 1, 1,
-1.320345, 1.462294, 0.91123, 1, 1, 1, 1, 1,
-1.317704, 0.4440938, -1.735051, 1, 1, 1, 1, 1,
-1.30662, 0.1274571, -2.710693, 1, 1, 1, 1, 1,
-1.306361, -0.3244108, -0.3146208, 1, 1, 1, 1, 1,
-1.304489, -0.1576443, -2.12286, 1, 1, 1, 1, 1,
-1.294789, -0.02578215, 1.401699, 1, 1, 1, 1, 1,
-1.29285, -0.1131684, -1.85735, 1, 1, 1, 1, 1,
-1.286096, -0.0181856, -1.507922, 1, 1, 1, 1, 1,
-1.276929, 0.6078901, -0.8769827, 1, 1, 1, 1, 1,
-1.27292, 0.8534244, -0.9503235, 1, 1, 1, 1, 1,
-1.269775, -0.01241713, -1.262809, 1, 1, 1, 1, 1,
-1.263633, 0.1564543, -1.153298, 0, 0, 1, 1, 1,
-1.262579, 0.2647627, -1.347821, 1, 0, 0, 1, 1,
-1.237257, -0.1221604, -2.055988, 1, 0, 0, 1, 1,
-1.229827, -0.007284763, -1.771774, 1, 0, 0, 1, 1,
-1.219741, 0.7516015, 0.4861965, 1, 0, 0, 1, 1,
-1.202021, -0.9690332, -1.776293, 1, 0, 0, 1, 1,
-1.20121, -1.911588, -2.25618, 0, 0, 0, 1, 1,
-1.200342, -1.283872, -3.89973, 0, 0, 0, 1, 1,
-1.200126, 0.2555525, -0.7643996, 0, 0, 0, 1, 1,
-1.189388, 0.5064987, -0.9982802, 0, 0, 0, 1, 1,
-1.186383, 0.3793564, 0.3655373, 0, 0, 0, 1, 1,
-1.185972, -1.019996, -1.240721, 0, 0, 0, 1, 1,
-1.185204, 1.719228, -1.750008, 0, 0, 0, 1, 1,
-1.179173, 2.113317, 0.8971848, 1, 1, 1, 1, 1,
-1.173548, 0.02433546, -1.189018, 1, 1, 1, 1, 1,
-1.170569, 0.443103, -1.349763, 1, 1, 1, 1, 1,
-1.140442, 0.0933411, -2.910687, 1, 1, 1, 1, 1,
-1.138296, -0.6051654, -3.641964, 1, 1, 1, 1, 1,
-1.134323, 0.3806422, -0.4874058, 1, 1, 1, 1, 1,
-1.128963, -1.929796, -2.19859, 1, 1, 1, 1, 1,
-1.110534, 1.125234, -0.9002963, 1, 1, 1, 1, 1,
-1.110399, -0.1555818, -0.4087496, 1, 1, 1, 1, 1,
-1.10652, 0.5582836, -1.442065, 1, 1, 1, 1, 1,
-1.100721, -0.8529669, -2.112446, 1, 1, 1, 1, 1,
-1.099749, -0.7270309, -1.801769, 1, 1, 1, 1, 1,
-1.092721, -2.957992, -2.608617, 1, 1, 1, 1, 1,
-1.089102, -0.4466483, -0.3108998, 1, 1, 1, 1, 1,
-1.08456, 1.433423, -0.9195988, 1, 1, 1, 1, 1,
-1.073886, 0.8305572, -1.941719, 0, 0, 1, 1, 1,
-1.073367, -2.55614, -1.682541, 1, 0, 0, 1, 1,
-1.069743, -1.433082, -1.86974, 1, 0, 0, 1, 1,
-1.064844, 2.92863, 0.2088692, 1, 0, 0, 1, 1,
-1.062122, 0.9513799, -0.810566, 1, 0, 0, 1, 1,
-1.057296, 0.9815136, -1.082847, 1, 0, 0, 1, 1,
-1.048561, -2.346757, -2.653954, 0, 0, 0, 1, 1,
-1.0482, 0.7831006, 0.06176991, 0, 0, 0, 1, 1,
-1.043956, 1.252261, -0.2649221, 0, 0, 0, 1, 1,
-1.040688, 0.03534747, -1.761593, 0, 0, 0, 1, 1,
-1.03849, -0.5918019, -2.598337, 0, 0, 0, 1, 1,
-1.038245, 0.4358124, 0.6004962, 0, 0, 0, 1, 1,
-1.037293, 1.65314, -1.348328, 0, 0, 0, 1, 1,
-1.031641, 2.561408, 0.281554, 1, 1, 1, 1, 1,
-1.025523, 0.4575053, -1.196954, 1, 1, 1, 1, 1,
-1.024243, 1.087113, -0.8884606, 1, 1, 1, 1, 1,
-1.020519, -0.6846051, -2.765036, 1, 1, 1, 1, 1,
-1.019677, 2.6434, 0.6963054, 1, 1, 1, 1, 1,
-1.019675, -0.821565, -1.176223, 1, 1, 1, 1, 1,
-1.017424, 0.8126562, -0.5502002, 1, 1, 1, 1, 1,
-1.01706, 0.7767709, -0.7133462, 1, 1, 1, 1, 1,
-1.01575, -1.540781, -3.294953, 1, 1, 1, 1, 1,
-1.015124, -0.2612475, -2.824464, 1, 1, 1, 1, 1,
-1.011447, -0.7309137, -2.137425, 1, 1, 1, 1, 1,
-1.005047, -0.7315557, -4.450451, 1, 1, 1, 1, 1,
-1.004603, -0.1486098, 0.2185876, 1, 1, 1, 1, 1,
-0.9928517, -0.7067367, -2.88444, 1, 1, 1, 1, 1,
-0.9857332, 0.2946706, -1.590734, 1, 1, 1, 1, 1,
-0.9820364, -0.3218449, -2.181816, 0, 0, 1, 1, 1,
-0.9624448, -0.9962502, -2.225642, 1, 0, 0, 1, 1,
-0.9622567, -0.1151419, -0.898272, 1, 0, 0, 1, 1,
-0.9596806, -1.346249, -4.535149, 1, 0, 0, 1, 1,
-0.9573378, 0.935522, -1.168242, 1, 0, 0, 1, 1,
-0.9573333, -1.143443, -3.069063, 1, 0, 0, 1, 1,
-0.949411, 0.04392414, -2.829857, 0, 0, 0, 1, 1,
-0.9477855, 0.9774483, -0.2293163, 0, 0, 0, 1, 1,
-0.9445874, 0.9281815, -2.312868, 0, 0, 0, 1, 1,
-0.9392756, -1.551342, -1.461859, 0, 0, 0, 1, 1,
-0.9391916, 0.347427, -1.140981, 0, 0, 0, 1, 1,
-0.9368894, 1.754247, -0.8479403, 0, 0, 0, 1, 1,
-0.9318805, 0.8615083, -0.6353816, 0, 0, 0, 1, 1,
-0.9246226, 1.827554, -0.9200966, 1, 1, 1, 1, 1,
-0.9169765, -2.74576, -3.606356, 1, 1, 1, 1, 1,
-0.9159893, 0.979327, -0.4076006, 1, 1, 1, 1, 1,
-0.9016532, -0.7017494, -1.087862, 1, 1, 1, 1, 1,
-0.8939357, 0.6654895, -1.722468, 1, 1, 1, 1, 1,
-0.8893758, 0.7118772, -3.049243, 1, 1, 1, 1, 1,
-0.8857403, 0.03115656, -0.3587004, 1, 1, 1, 1, 1,
-0.8727826, -1.23697, -1.618947, 1, 1, 1, 1, 1,
-0.8725832, 0.09043223, -2.302941, 1, 1, 1, 1, 1,
-0.864327, -0.153683, -1.74424, 1, 1, 1, 1, 1,
-0.8611694, 0.3934684, -0.3903399, 1, 1, 1, 1, 1,
-0.8587233, -1.974916, -4.03652, 1, 1, 1, 1, 1,
-0.8543835, 0.3162827, -1.192483, 1, 1, 1, 1, 1,
-0.8540177, 2.104989, -1.145193, 1, 1, 1, 1, 1,
-0.8514091, 1.213045, -0.8682101, 1, 1, 1, 1, 1,
-0.8486399, 0.7352291, -1.611634, 0, 0, 1, 1, 1,
-0.8398978, -0.4787196, -0.6762227, 1, 0, 0, 1, 1,
-0.8387517, 0.1336034, -3.223656, 1, 0, 0, 1, 1,
-0.8384453, 1.556152, -0.0652491, 1, 0, 0, 1, 1,
-0.8360048, -0.3137686, -1.472108, 1, 0, 0, 1, 1,
-0.8354673, 2.07904, 0.7241237, 1, 0, 0, 1, 1,
-0.8307682, -0.5730719, -1.565665, 0, 0, 0, 1, 1,
-0.8253247, 1.567337, 0.09514999, 0, 0, 0, 1, 1,
-0.8222775, -0.1610243, -3.776499, 0, 0, 0, 1, 1,
-0.8222672, -0.1238949, -2.727381, 0, 0, 0, 1, 1,
-0.8067726, -2.835487, -5.287151, 0, 0, 0, 1, 1,
-0.7962345, 0.7111289, 0.1755046, 0, 0, 0, 1, 1,
-0.7934058, -0.2292036, -3.069949, 0, 0, 0, 1, 1,
-0.7923532, 0.3676216, -1.700603, 1, 1, 1, 1, 1,
-0.7921703, -2.369325, -2.834885, 1, 1, 1, 1, 1,
-0.7913786, 0.4565069, -0.466618, 1, 1, 1, 1, 1,
-0.7891785, -0.7369457, -1.158894, 1, 1, 1, 1, 1,
-0.783564, -0.3071738, -0.7936173, 1, 1, 1, 1, 1,
-0.7807023, -0.5460963, -2.72819, 1, 1, 1, 1, 1,
-0.7804384, 2.188287, 0.9786364, 1, 1, 1, 1, 1,
-0.779934, 2.233605, 1.232547, 1, 1, 1, 1, 1,
-0.7782601, -0.3036724, -2.043685, 1, 1, 1, 1, 1,
-0.7763554, -0.202155, -2.161346, 1, 1, 1, 1, 1,
-0.7703848, -1.518954, -3.925349, 1, 1, 1, 1, 1,
-0.76412, -1.103422, -3.813614, 1, 1, 1, 1, 1,
-0.7622468, 0.4684851, -2.321806, 1, 1, 1, 1, 1,
-0.7597312, -0.4765977, -1.203571, 1, 1, 1, 1, 1,
-0.7527865, 0.5544769, -0.7797388, 1, 1, 1, 1, 1,
-0.7506924, 0.7948562, -2.772601, 0, 0, 1, 1, 1,
-0.745071, -0.570717, -1.671928, 1, 0, 0, 1, 1,
-0.7434799, -0.3682925, -1.154966, 1, 0, 0, 1, 1,
-0.740765, 0.506801, -1.551482, 1, 0, 0, 1, 1,
-0.7390865, 1.356982, -3.149311, 1, 0, 0, 1, 1,
-0.7304433, -0.308715, -0.8348048, 1, 0, 0, 1, 1,
-0.7287686, 0.9036757, -2.016852, 0, 0, 0, 1, 1,
-0.7287033, -0.1436988, -0.7710435, 0, 0, 0, 1, 1,
-0.7261796, -0.1725844, -1.202637, 0, 0, 0, 1, 1,
-0.7248184, 1.160119, 0.4657086, 0, 0, 0, 1, 1,
-0.7246162, 0.8198695, -0.4975058, 0, 0, 0, 1, 1,
-0.7230256, 1.047926, 0.2861903, 0, 0, 0, 1, 1,
-0.7196278, -1.193743, -1.331736, 0, 0, 0, 1, 1,
-0.7192814, 0.3172325, -1.209786, 1, 1, 1, 1, 1,
-0.7191386, 0.4561174, 0.657001, 1, 1, 1, 1, 1,
-0.7166235, 0.01602725, -1.258495, 1, 1, 1, 1, 1,
-0.7147945, -0.4932581, -1.500506, 1, 1, 1, 1, 1,
-0.7142997, -0.6359339, -3.363555, 1, 1, 1, 1, 1,
-0.7100314, 0.04515286, -2.318497, 1, 1, 1, 1, 1,
-0.7082521, -0.5165513, -0.9879873, 1, 1, 1, 1, 1,
-0.7059211, -0.4670583, -0.3269264, 1, 1, 1, 1, 1,
-0.7058933, 0.8521784, -2.652019, 1, 1, 1, 1, 1,
-0.6965203, -0.3118152, -3.013788, 1, 1, 1, 1, 1,
-0.6949978, -0.9210621, -2.303828, 1, 1, 1, 1, 1,
-0.6910591, -3.198955, -3.542374, 1, 1, 1, 1, 1,
-0.6843207, -0.5796023, -3.784148, 1, 1, 1, 1, 1,
-0.682505, 0.3213366, -1.847584, 1, 1, 1, 1, 1,
-0.6822214, -1.321552, -2.491611, 1, 1, 1, 1, 1,
-0.6803647, 0.9008608, 1.813414, 0, 0, 1, 1, 1,
-0.6728229, -0.6967242, -1.743143, 1, 0, 0, 1, 1,
-0.6717625, 0.003827721, -0.4388267, 1, 0, 0, 1, 1,
-0.6684924, 1.019069, -0.1171244, 1, 0, 0, 1, 1,
-0.6632165, 0.9239841, -0.640676, 1, 0, 0, 1, 1,
-0.6590199, 0.9489589, -0.8872675, 1, 0, 0, 1, 1,
-0.6584715, -1.624114, -1.777057, 0, 0, 0, 1, 1,
-0.6517965, -0.8396281, -0.5331588, 0, 0, 0, 1, 1,
-0.6493671, 1.013821, -1.639569, 0, 0, 0, 1, 1,
-0.643614, -1.317636, -3.564755, 0, 0, 0, 1, 1,
-0.6386226, 0.2215878, -1.889293, 0, 0, 0, 1, 1,
-0.637478, -1.197247, -1.517067, 0, 0, 0, 1, 1,
-0.6356694, 0.06820109, -2.7335, 0, 0, 0, 1, 1,
-0.6354788, 0.1653519, -1.626153, 1, 1, 1, 1, 1,
-0.6338561, 1.322583, -0.5973486, 1, 1, 1, 1, 1,
-0.6338454, 0.8960982, 1.035323, 1, 1, 1, 1, 1,
-0.63377, 0.325445, -0.8494757, 1, 1, 1, 1, 1,
-0.6306146, 0.3799528, -1.148504, 1, 1, 1, 1, 1,
-0.6220734, 1.878997, 0.03999867, 1, 1, 1, 1, 1,
-0.6211423, 0.8454375, 1.505952, 1, 1, 1, 1, 1,
-0.615061, 0.6906617, -0.08754914, 1, 1, 1, 1, 1,
-0.6138337, -1.151665, -3.574607, 1, 1, 1, 1, 1,
-0.6127374, 1.869729, -0.04935558, 1, 1, 1, 1, 1,
-0.6116199, 0.5827019, -1.459479, 1, 1, 1, 1, 1,
-0.610718, 0.3563272, -2.358679, 1, 1, 1, 1, 1,
-0.6031335, -0.2589819, -0.003759864, 1, 1, 1, 1, 1,
-0.5987391, 0.1427136, -1.784355, 1, 1, 1, 1, 1,
-0.5980738, -0.7854137, -1.312436, 1, 1, 1, 1, 1,
-0.5978243, 1.633126, -0.003861381, 0, 0, 1, 1, 1,
-0.5942006, 0.351881, -1.100702, 1, 0, 0, 1, 1,
-0.5937567, -0.1599758, 0.2216169, 1, 0, 0, 1, 1,
-0.5911722, 0.8141211, -1.770646, 1, 0, 0, 1, 1,
-0.5826302, 0.1645858, -1.736302, 1, 0, 0, 1, 1,
-0.5808084, -0.5388513, -0.9999139, 1, 0, 0, 1, 1,
-0.5777634, 1.565042, -1.526107, 0, 0, 0, 1, 1,
-0.5666788, 0.4490269, -2.110961, 0, 0, 0, 1, 1,
-0.5642588, -0.1503308, -3.090719, 0, 0, 0, 1, 1,
-0.5613759, -0.2010482, -4.109412, 0, 0, 0, 1, 1,
-0.5541598, -0.6571624, -2.681029, 0, 0, 0, 1, 1,
-0.5510605, -0.6966973, -1.935516, 0, 0, 0, 1, 1,
-0.5489186, 0.5524596, -0.1743111, 0, 0, 0, 1, 1,
-0.5483447, 1.807257, -0.8079257, 1, 1, 1, 1, 1,
-0.5479848, -1.205285, -2.511484, 1, 1, 1, 1, 1,
-0.5419663, 0.2207991, 0.06120994, 1, 1, 1, 1, 1,
-0.5354981, 0.7606301, -1.352359, 1, 1, 1, 1, 1,
-0.5352437, 1.419672, -0.2776223, 1, 1, 1, 1, 1,
-0.5326431, -0.3157821, -2.078644, 1, 1, 1, 1, 1,
-0.5317464, -0.6295986, -4.564396, 1, 1, 1, 1, 1,
-0.5280426, 1.381158, -1.197602, 1, 1, 1, 1, 1,
-0.5256944, 0.2670947, -1.124331, 1, 1, 1, 1, 1,
-0.5230099, -0.573743, -2.393862, 1, 1, 1, 1, 1,
-0.5188543, 0.7821617, -1.610521, 1, 1, 1, 1, 1,
-0.5053884, -1.613492, -1.909665, 1, 1, 1, 1, 1,
-0.501031, 1.137401, -1.36269, 1, 1, 1, 1, 1,
-0.4915623, 0.7246171, 0.4099005, 1, 1, 1, 1, 1,
-0.4899456, -0.9064501, -2.724083, 1, 1, 1, 1, 1,
-0.4874957, 0.09709834, -0.7142805, 0, 0, 1, 1, 1,
-0.4862558, 0.004552127, -2.442412, 1, 0, 0, 1, 1,
-0.4859259, 1.793643, -0.6044382, 1, 0, 0, 1, 1,
-0.4782203, -1.089866, -2.371098, 1, 0, 0, 1, 1,
-0.475358, 0.7875348, -0.338536, 1, 0, 0, 1, 1,
-0.4728218, 0.313382, -0.4932367, 1, 0, 0, 1, 1,
-0.4726772, 1.118656, 0.2563604, 0, 0, 0, 1, 1,
-0.47262, -0.1379631, 0.5180876, 0, 0, 0, 1, 1,
-0.4724432, 0.4037533, -0.5107911, 0, 0, 0, 1, 1,
-0.4705949, 0.4684545, -2.460987, 0, 0, 0, 1, 1,
-0.4691417, -0.09599449, -1.621208, 0, 0, 0, 1, 1,
-0.4673102, -0.7943646, -2.586983, 0, 0, 0, 1, 1,
-0.4664428, 2.244828, -0.4459825, 0, 0, 0, 1, 1,
-0.4631633, -0.4462074, -3.338615, 1, 1, 1, 1, 1,
-0.4602718, 1.413254, 0.02174885, 1, 1, 1, 1, 1,
-0.4601271, -0.6776692, -3.285078, 1, 1, 1, 1, 1,
-0.4593504, -0.7988173, -2.326531, 1, 1, 1, 1, 1,
-0.4593138, -1.361879, -2.384518, 1, 1, 1, 1, 1,
-0.4541497, 1.429451, 0.5377063, 1, 1, 1, 1, 1,
-0.4538166, -0.8722894, -2.557736, 1, 1, 1, 1, 1,
-0.448615, 0.4801784, -0.8105204, 1, 1, 1, 1, 1,
-0.4480964, 0.9062259, 0.3391459, 1, 1, 1, 1, 1,
-0.4458419, -0.2366557, -2.566068, 1, 1, 1, 1, 1,
-0.4443855, -1.005802, -3.948583, 1, 1, 1, 1, 1,
-0.4440179, -0.3568642, -0.9043147, 1, 1, 1, 1, 1,
-0.4426738, 0.5667303, -0.3887588, 1, 1, 1, 1, 1,
-0.4390315, 1.355011, -0.431305, 1, 1, 1, 1, 1,
-0.4386139, -0.085465, -1.104648, 1, 1, 1, 1, 1,
-0.4329597, 0.8462024, -1.70547, 0, 0, 1, 1, 1,
-0.4322952, -1.633222, -3.197858, 1, 0, 0, 1, 1,
-0.4301224, -0.4354225, -3.605143, 1, 0, 0, 1, 1,
-0.4259899, 0.8413324, -1.223552, 1, 0, 0, 1, 1,
-0.4199601, 0.9945304, 0.6907907, 1, 0, 0, 1, 1,
-0.4171653, 0.2179889, 0.5315178, 1, 0, 0, 1, 1,
-0.4137864, 0.5808566, -0.247295, 0, 0, 0, 1, 1,
-0.4121491, 0.07357029, -1.925357, 0, 0, 0, 1, 1,
-0.4112594, -0.3268212, -1.274818, 0, 0, 0, 1, 1,
-0.4094273, 0.9725863, -0.1665789, 0, 0, 0, 1, 1,
-0.408133, 0.2621934, 0.09102585, 0, 0, 0, 1, 1,
-0.4023744, 0.3558758, -0.5998051, 0, 0, 0, 1, 1,
-0.390158, -1.314493, -3.572942, 0, 0, 0, 1, 1,
-0.389612, 0.1712848, -1.668732, 1, 1, 1, 1, 1,
-0.3889205, -0.7389902, -3.522723, 1, 1, 1, 1, 1,
-0.3777904, 0.3408268, -1.806157, 1, 1, 1, 1, 1,
-0.3777037, 1.009991, 0.01808452, 1, 1, 1, 1, 1,
-0.3750156, -0.7261741, -2.207053, 1, 1, 1, 1, 1,
-0.3730769, 1.113549, -0.543393, 1, 1, 1, 1, 1,
-0.3723873, -1.67112, -3.097443, 1, 1, 1, 1, 1,
-0.3719958, 2.30821, 0.7881514, 1, 1, 1, 1, 1,
-0.3717277, -1.182176, -3.803627, 1, 1, 1, 1, 1,
-0.3699837, 1.592386, -1.349144, 1, 1, 1, 1, 1,
-0.3684752, 1.323605, -0.8430254, 1, 1, 1, 1, 1,
-0.3671072, 0.03262724, -0.3269335, 1, 1, 1, 1, 1,
-0.3646915, -0.4388635, -2.957161, 1, 1, 1, 1, 1,
-0.3621461, 1.218036, -2.054893, 1, 1, 1, 1, 1,
-0.3611646, -0.939402, -5.261185, 1, 1, 1, 1, 1,
-0.3583105, 0.3656979, -3.033647, 0, 0, 1, 1, 1,
-0.3571458, -0.7011197, -2.184287, 1, 0, 0, 1, 1,
-0.3539903, 0.07837677, -0.5100264, 1, 0, 0, 1, 1,
-0.3478172, 0.2345576, -0.9322135, 1, 0, 0, 1, 1,
-0.3476319, -0.4731627, -2.804042, 1, 0, 0, 1, 1,
-0.3469681, 1.257821, -1.425226, 1, 0, 0, 1, 1,
-0.346083, 2.466246, -2.144536, 0, 0, 0, 1, 1,
-0.3437921, -0.3709426, -3.113219, 0, 0, 0, 1, 1,
-0.3421602, -0.2881981, -2.7108, 0, 0, 0, 1, 1,
-0.3262209, -0.1859256, -3.500552, 0, 0, 0, 1, 1,
-0.3250401, 0.2251943, -0.1637768, 0, 0, 0, 1, 1,
-0.3182281, -0.6421715, -3.506199, 0, 0, 0, 1, 1,
-0.3153775, -0.4711803, -2.328258, 0, 0, 0, 1, 1,
-0.3143208, 0.1799197, -0.4018267, 1, 1, 1, 1, 1,
-0.3034452, 0.9223499, -0.7193485, 1, 1, 1, 1, 1,
-0.299433, 0.9328006, 0.9838878, 1, 1, 1, 1, 1,
-0.2994203, 0.5069582, -1.008311, 1, 1, 1, 1, 1,
-0.2967616, -0.9329297, -2.24124, 1, 1, 1, 1, 1,
-0.2941115, -0.04578603, -1.465679, 1, 1, 1, 1, 1,
-0.2848348, 0.6906291, -1.257646, 1, 1, 1, 1, 1,
-0.2825993, -1.017293, -2.232777, 1, 1, 1, 1, 1,
-0.2815515, -1.451478, -1.592365, 1, 1, 1, 1, 1,
-0.280348, 1.329084, -1.120774, 1, 1, 1, 1, 1,
-0.2753975, 1.457968, 1.954692, 1, 1, 1, 1, 1,
-0.2704528, -1.63551, -2.359168, 1, 1, 1, 1, 1,
-0.2693663, -1.013467, -3.319182, 1, 1, 1, 1, 1,
-0.261338, 1.207675, -0.8858658, 1, 1, 1, 1, 1,
-0.2598884, -0.4832634, -1.962851, 1, 1, 1, 1, 1,
-0.2582602, 0.2019789, -2.16504, 0, 0, 1, 1, 1,
-0.2537059, -0.07316341, -3.272913, 1, 0, 0, 1, 1,
-0.2536881, -2.195643, -2.348383, 1, 0, 0, 1, 1,
-0.2523389, 1.40082, -0.3386708, 1, 0, 0, 1, 1,
-0.2514368, 0.6411094, -1.288951, 1, 0, 0, 1, 1,
-0.2457583, 0.7641114, 0.09443423, 1, 0, 0, 1, 1,
-0.2436494, 0.22297, -1.063951, 0, 0, 0, 1, 1,
-0.2436448, 0.9993792, 1.570326, 0, 0, 0, 1, 1,
-0.2411894, 0.1200802, -1.586284, 0, 0, 0, 1, 1,
-0.2359556, 0.1762607, -2.439556, 0, 0, 0, 1, 1,
-0.2356816, -1.242527, -4.780688, 0, 0, 0, 1, 1,
-0.2340144, 0.07304892, -0.4907498, 0, 0, 0, 1, 1,
-0.2331457, -1.382394, -1.23037, 0, 0, 0, 1, 1,
-0.2330216, 0.6000961, -1.108815, 1, 1, 1, 1, 1,
-0.2294358, 0.003402404, -0.7242094, 1, 1, 1, 1, 1,
-0.2292199, 0.005921781, -1.877267, 1, 1, 1, 1, 1,
-0.2270066, -0.4647753, -2.986106, 1, 1, 1, 1, 1,
-0.2218954, 1.10437, -0.07438096, 1, 1, 1, 1, 1,
-0.2134141, -0.245382, -2.133947, 1, 1, 1, 1, 1,
-0.2112883, -0.7121433, -2.466483, 1, 1, 1, 1, 1,
-0.1999026, 0.3500698, -0.5896615, 1, 1, 1, 1, 1,
-0.1992186, -1.381048, -1.434944, 1, 1, 1, 1, 1,
-0.1942057, 0.1053947, -1.07832, 1, 1, 1, 1, 1,
-0.1937554, -0.6215661, -4.159577, 1, 1, 1, 1, 1,
-0.1926892, -0.1188825, -1.693028, 1, 1, 1, 1, 1,
-0.1890375, -0.3072864, -3.014961, 1, 1, 1, 1, 1,
-0.1877075, 0.7284793, -0.3868516, 1, 1, 1, 1, 1,
-0.1859955, 0.1559966, -2.121734, 1, 1, 1, 1, 1,
-0.1830212, 1.247504, -0.5558617, 0, 0, 1, 1, 1,
-0.1816337, 0.05600581, 0.2609464, 1, 0, 0, 1, 1,
-0.1734948, -0.424909, -3.674543, 1, 0, 0, 1, 1,
-0.165132, 0.5627741, -0.6943041, 1, 0, 0, 1, 1,
-0.1651177, 0.6463345, 0.3929179, 1, 0, 0, 1, 1,
-0.1646501, 1.94268, 0.6107054, 1, 0, 0, 1, 1,
-0.1633143, -1.352515, -4.403722, 0, 0, 0, 1, 1,
-0.1609299, -1.970508, -2.989029, 0, 0, 0, 1, 1,
-0.1599498, -0.7526722, -2.841296, 0, 0, 0, 1, 1,
-0.154776, 0.4714716, 0.006644948, 0, 0, 0, 1, 1,
-0.1514608, -0.1547704, -1.342681, 0, 0, 0, 1, 1,
-0.1498384, -0.02413666, -1.262437, 0, 0, 0, 1, 1,
-0.1488841, -0.8776583, -3.451574, 0, 0, 0, 1, 1,
-0.1469597, -0.6414604, -3.132311, 1, 1, 1, 1, 1,
-0.1469291, -0.2003202, -2.890383, 1, 1, 1, 1, 1,
-0.1355724, 0.374539, -0.08703102, 1, 1, 1, 1, 1,
-0.1276247, 0.1424612, 0.319638, 1, 1, 1, 1, 1,
-0.1262058, -0.391586, -2.381726, 1, 1, 1, 1, 1,
-0.125748, -0.3630174, -2.302652, 1, 1, 1, 1, 1,
-0.12416, 0.8652215, 1.246899, 1, 1, 1, 1, 1,
-0.1228636, 0.5169317, 0.8021641, 1, 1, 1, 1, 1,
-0.1184362, 0.1596135, 0.5458038, 1, 1, 1, 1, 1,
-0.1179722, -1.198907, -2.769555, 1, 1, 1, 1, 1,
-0.1177407, 0.1592466, -0.9490589, 1, 1, 1, 1, 1,
-0.1128088, -1.48181, -2.832539, 1, 1, 1, 1, 1,
-0.1071532, 2.312794, 0.06110761, 1, 1, 1, 1, 1,
-0.1070821, 0.5154942, -0.507803, 1, 1, 1, 1, 1,
-0.1070367, 3.283014, 2.651564, 1, 1, 1, 1, 1,
-0.1030074, -1.283009, -2.989875, 0, 0, 1, 1, 1,
-0.1027172, -0.2470057, -2.571873, 1, 0, 0, 1, 1,
-0.100423, -0.351137, -4.205528, 1, 0, 0, 1, 1,
-0.09562306, 0.7461264, -1.295531, 1, 0, 0, 1, 1,
-0.0923932, 1.473932, -0.4990323, 1, 0, 0, 1, 1,
-0.09063042, 1.911893, 0.2457827, 1, 0, 0, 1, 1,
-0.08969271, -0.5227022, -1.399681, 0, 0, 0, 1, 1,
-0.08894668, 0.2743861, -0.08048026, 0, 0, 0, 1, 1,
-0.08609298, -0.5553056, -1.393846, 0, 0, 0, 1, 1,
-0.08205024, 0.3181306, -0.620847, 0, 0, 0, 1, 1,
-0.08147141, -0.8033977, -4.25479, 0, 0, 0, 1, 1,
-0.07990213, 0.7697436, 0.677433, 0, 0, 0, 1, 1,
-0.07886632, 0.2511843, -1.028122, 0, 0, 0, 1, 1,
-0.07642163, -0.7686173, -2.089758, 1, 1, 1, 1, 1,
-0.07163876, -0.3173988, -2.185917, 1, 1, 1, 1, 1,
-0.07131817, 0.7965271, -1.760885, 1, 1, 1, 1, 1,
-0.07054149, -0.02064422, -2.08015, 1, 1, 1, 1, 1,
-0.07019193, -1.485773, -3.190792, 1, 1, 1, 1, 1,
-0.06958047, 0.1939893, 1.656016, 1, 1, 1, 1, 1,
-0.06656765, 1.807554, -0.1546331, 1, 1, 1, 1, 1,
-0.06001622, 1.01053, 1.593405, 1, 1, 1, 1, 1,
-0.05918315, 0.2687924, 0.7601207, 1, 1, 1, 1, 1,
-0.05438371, -0.7259127, -3.402531, 1, 1, 1, 1, 1,
-0.05403613, 1.148753, -1.764833, 1, 1, 1, 1, 1,
-0.05320485, -0.2095086, -3.465876, 1, 1, 1, 1, 1,
-0.05241114, -0.2191526, -1.105153, 1, 1, 1, 1, 1,
-0.04882436, 1.648182, -0.2867746, 1, 1, 1, 1, 1,
-0.04686423, -1.429247, -2.745731, 1, 1, 1, 1, 1,
-0.0452169, -0.47036, -2.956239, 0, 0, 1, 1, 1,
-0.04161337, 1.057167, 0.3768804, 1, 0, 0, 1, 1,
-0.04031466, -1.449096, -3.680443, 1, 0, 0, 1, 1,
-0.03844282, -2.230873, -2.828267, 1, 0, 0, 1, 1,
-0.03689232, 0.5691317, 0.6597757, 1, 0, 0, 1, 1,
-0.03557863, -1.612641, -4.333882, 1, 0, 0, 1, 1,
-0.03402879, -1.343512, -2.457906, 0, 0, 0, 1, 1,
-0.03307845, 1.493506, -0.9459347, 0, 0, 0, 1, 1,
-0.03019486, -1.178137, -1.968311, 0, 0, 0, 1, 1,
-0.02409725, 1.370644, -0.529762, 0, 0, 0, 1, 1,
-0.01446971, -0.02558149, -3.057646, 0, 0, 0, 1, 1,
-0.0140143, 0.2599469, 0.2858357, 0, 0, 0, 1, 1,
-0.01270586, 0.8207186, 0.7872155, 0, 0, 0, 1, 1,
-0.01261678, -1.122957, -3.003034, 1, 1, 1, 1, 1,
-0.005949847, 1.50598, 0.08392436, 1, 1, 1, 1, 1,
-0.003727731, 0.647956, 1.267983, 1, 1, 1, 1, 1,
0.007565966, -0.7411122, 1.955202, 1, 1, 1, 1, 1,
0.009318272, -1.191257, 2.877162, 1, 1, 1, 1, 1,
0.01111207, -1.19382, 2.797126, 1, 1, 1, 1, 1,
0.01244415, -0.5954639, 2.803962, 1, 1, 1, 1, 1,
0.01523783, -1.021866, 4.949834, 1, 1, 1, 1, 1,
0.0185416, -0.7573845, 2.249287, 1, 1, 1, 1, 1,
0.02128287, 1.067282, 0.1046987, 1, 1, 1, 1, 1,
0.02276529, 1.101043, 0.9753571, 1, 1, 1, 1, 1,
0.02377472, -0.2846273, 2.390658, 1, 1, 1, 1, 1,
0.02410655, 0.5846877, 0.2471962, 1, 1, 1, 1, 1,
0.02947911, -0.8564391, 3.625052, 1, 1, 1, 1, 1,
0.03183648, 0.1755812, -1.311511, 1, 1, 1, 1, 1,
0.03549939, -0.9904702, 3.430286, 0, 0, 1, 1, 1,
0.03874175, 0.5892107, -0.4043506, 1, 0, 0, 1, 1,
0.03921234, -1.165555, 5.310459, 1, 0, 0, 1, 1,
0.04125129, 0.005254948, -0.3257836, 1, 0, 0, 1, 1,
0.04273272, 0.6037233, -1.242964, 1, 0, 0, 1, 1,
0.04509529, 1.672415, 1.148796, 1, 0, 0, 1, 1,
0.0497066, -1.284031, 2.510084, 0, 0, 0, 1, 1,
0.05552989, 1.545653, -0.1983068, 0, 0, 0, 1, 1,
0.05717833, 1.759611, 1.84832, 0, 0, 0, 1, 1,
0.06079583, 0.5003881, -0.2512187, 0, 0, 0, 1, 1,
0.06549275, 0.6898683, -0.3030413, 0, 0, 0, 1, 1,
0.06830402, 0.05137754, -0.1379102, 0, 0, 0, 1, 1,
0.06861012, -1.683409, 2.81379, 0, 0, 0, 1, 1,
0.06884582, -0.4039679, 3.302342, 1, 1, 1, 1, 1,
0.07086021, -0.582633, 3.445873, 1, 1, 1, 1, 1,
0.07180028, -0.6548473, 1.701261, 1, 1, 1, 1, 1,
0.0721077, 0.05536328, 0.006668562, 1, 1, 1, 1, 1,
0.07217301, -0.6490558, 2.486643, 1, 1, 1, 1, 1,
0.07314488, 1.158978, 0.6880151, 1, 1, 1, 1, 1,
0.0753703, 1.576912, 0.5296472, 1, 1, 1, 1, 1,
0.07803933, -1.485109, 3.10796, 1, 1, 1, 1, 1,
0.07861727, -0.6659579, 1.640468, 1, 1, 1, 1, 1,
0.0787386, 0.4846383, -0.1793518, 1, 1, 1, 1, 1,
0.08097868, -0.5163704, 3.663209, 1, 1, 1, 1, 1,
0.08172608, -1.651195, 3.163991, 1, 1, 1, 1, 1,
0.08244037, 0.355291, 1.182446, 1, 1, 1, 1, 1,
0.08452834, 0.7818968, 1.381903, 1, 1, 1, 1, 1,
0.09030116, 0.8371693, -0.3719887, 1, 1, 1, 1, 1,
0.09030638, -2.851097, 2.430806, 0, 0, 1, 1, 1,
0.09184934, 0.1672939, 1.348119, 1, 0, 0, 1, 1,
0.09415361, -1.562413, 2.460288, 1, 0, 0, 1, 1,
0.0953579, -1.316715, 4.029703, 1, 0, 0, 1, 1,
0.09833993, 0.05903368, 2.861204, 1, 0, 0, 1, 1,
0.09834848, -1.956654, 4.600714, 1, 0, 0, 1, 1,
0.102367, -0.4956508, 2.859574, 0, 0, 0, 1, 1,
0.1069816, 1.213969, 1.132676, 0, 0, 0, 1, 1,
0.1084789, -0.4042318, 2.349398, 0, 0, 0, 1, 1,
0.1107118, -1.233796, 3.861673, 0, 0, 0, 1, 1,
0.1152353, -0.5588658, 3.941498, 0, 0, 0, 1, 1,
0.1153311, 0.03034233, 1.489683, 0, 0, 0, 1, 1,
0.1194686, -0.4617579, 4.25288, 0, 0, 0, 1, 1,
0.121229, -0.4107278, 2.116245, 1, 1, 1, 1, 1,
0.1320457, 0.8434418, -0.157985, 1, 1, 1, 1, 1,
0.1324077, 0.2071436, 0.609214, 1, 1, 1, 1, 1,
0.1330302, 0.04287143, 0.4386404, 1, 1, 1, 1, 1,
0.1406191, 1.828961, 0.04837439, 1, 1, 1, 1, 1,
0.1415886, -0.6558332, 3.518439, 1, 1, 1, 1, 1,
0.1428035, 1.890786, -1.039198, 1, 1, 1, 1, 1,
0.1441225, 0.9719977, -0.08645673, 1, 1, 1, 1, 1,
0.14586, 0.007426695, 2.623188, 1, 1, 1, 1, 1,
0.1465558, 0.7305329, 0.9073683, 1, 1, 1, 1, 1,
0.1479436, -0.08796763, 1.309303, 1, 1, 1, 1, 1,
0.1496653, 0.5690899, -0.5012704, 1, 1, 1, 1, 1,
0.1512514, 0.1717265, 0.5816344, 1, 1, 1, 1, 1,
0.1527822, 0.1272859, -0.002578431, 1, 1, 1, 1, 1,
0.1565695, 0.9797292, -1.442898, 1, 1, 1, 1, 1,
0.1570512, -0.6802379, 1.84325, 0, 0, 1, 1, 1,
0.1578203, 0.144193, -0.4402177, 1, 0, 0, 1, 1,
0.1598377, -0.2525398, 2.370903, 1, 0, 0, 1, 1,
0.1604634, 1.442143, 0.2592045, 1, 0, 0, 1, 1,
0.1658439, 0.001752983, 0.6346994, 1, 0, 0, 1, 1,
0.1670204, 1.253088, 0.3601203, 1, 0, 0, 1, 1,
0.1679334, -2.159689, 3.027675, 0, 0, 0, 1, 1,
0.168522, -0.604758, 2.655678, 0, 0, 0, 1, 1,
0.1700468, 1.609156, -0.6408935, 0, 0, 0, 1, 1,
0.1718508, 0.02454489, 0.6661792, 0, 0, 0, 1, 1,
0.1738963, 1.317345, -0.2578104, 0, 0, 0, 1, 1,
0.1785944, -0.4735091, 2.880497, 0, 0, 0, 1, 1,
0.1799815, -1.947244, 2.910815, 0, 0, 0, 1, 1,
0.1802021, -1.65922, 2.041656, 1, 1, 1, 1, 1,
0.181339, -2.146879, 1.78384, 1, 1, 1, 1, 1,
0.1827762, -1.964327, 3.766459, 1, 1, 1, 1, 1,
0.1837521, -0.7667212, 3.990838, 1, 1, 1, 1, 1,
0.1840802, -1.248955, 3.509823, 1, 1, 1, 1, 1,
0.1868558, -2.304103, 2.231154, 1, 1, 1, 1, 1,
0.1879031, -0.09934562, 1.971901, 1, 1, 1, 1, 1,
0.1898566, -0.9453768, 3.000623, 1, 1, 1, 1, 1,
0.1971356, -0.05818222, 3.198916, 1, 1, 1, 1, 1,
0.1983764, 0.2839101, 0.9106188, 1, 1, 1, 1, 1,
0.1998857, 0.4876885, 0.05408192, 1, 1, 1, 1, 1,
0.2003422, 2.814038, -1.388147, 1, 1, 1, 1, 1,
0.2007372, -1.463082, 3.869579, 1, 1, 1, 1, 1,
0.2013417, 1.519272, 0.2706114, 1, 1, 1, 1, 1,
0.2073761, -0.7800807, 2.149796, 1, 1, 1, 1, 1,
0.2102742, -0.05418416, 2.31725, 0, 0, 1, 1, 1,
0.2161697, 0.195384, -0.7626833, 1, 0, 0, 1, 1,
0.220405, -2.046925, 1.791186, 1, 0, 0, 1, 1,
0.2230641, -2.393394, 4.020227, 1, 0, 0, 1, 1,
0.2262269, 0.4263317, 0.9866316, 1, 0, 0, 1, 1,
0.2292482, -2.339493, 4.420079, 1, 0, 0, 1, 1,
0.2324828, 1.901605, 0.655601, 0, 0, 0, 1, 1,
0.2332186, -0.08300871, 2.05056, 0, 0, 0, 1, 1,
0.2348865, 0.6699332, 0.0769571, 0, 0, 0, 1, 1,
0.2403636, 0.7811444, -0.400017, 0, 0, 0, 1, 1,
0.2438503, 0.4061772, 0.6676158, 0, 0, 0, 1, 1,
0.2439065, -0.01580746, 3.326039, 0, 0, 0, 1, 1,
0.247482, -0.723007, 3.085951, 0, 0, 0, 1, 1,
0.2485128, -1.293826, 3.143557, 1, 1, 1, 1, 1,
0.2519289, 0.3138231, 0.5182582, 1, 1, 1, 1, 1,
0.2540459, 0.4682611, 0.9672468, 1, 1, 1, 1, 1,
0.2550265, 0.2385884, 0.6830423, 1, 1, 1, 1, 1,
0.2607771, 1.354843, 1.317136, 1, 1, 1, 1, 1,
0.2620097, -1.060601, 2.022519, 1, 1, 1, 1, 1,
0.2634367, -1.082907, 2.658377, 1, 1, 1, 1, 1,
0.2668014, 0.2057018, 0.7150388, 1, 1, 1, 1, 1,
0.2670738, -2.792247, 4.123785, 1, 1, 1, 1, 1,
0.2671876, -0.6939837, 1.865847, 1, 1, 1, 1, 1,
0.2696154, 0.1759141, 0.4431459, 1, 1, 1, 1, 1,
0.2722288, -0.06256551, 2.522753, 1, 1, 1, 1, 1,
0.2723334, -0.9952351, 1.986689, 1, 1, 1, 1, 1,
0.2773256, -1.111326, 4.501947, 1, 1, 1, 1, 1,
0.2810034, 1.998081, -1.277687, 1, 1, 1, 1, 1,
0.2857226, -0.5964079, 1.573892, 0, 0, 1, 1, 1,
0.2906988, 0.4594863, -0.5333799, 1, 0, 0, 1, 1,
0.2935605, -0.1436378, 0.2064464, 1, 0, 0, 1, 1,
0.2947058, -0.5736324, 2.421271, 1, 0, 0, 1, 1,
0.2982084, 1.991278, -0.008957181, 1, 0, 0, 1, 1,
0.2985159, 0.08064961, -0.6452331, 1, 0, 0, 1, 1,
0.3031146, 1.548695, 0.5157364, 0, 0, 0, 1, 1,
0.3035483, -0.2286231, 3.748432, 0, 0, 0, 1, 1,
0.3120448, 0.2831235, 1.372325, 0, 0, 0, 1, 1,
0.3158162, 0.04702554, 0.303257, 0, 0, 0, 1, 1,
0.318089, -1.081657, 3.884042, 0, 0, 0, 1, 1,
0.3185434, -0.8444808, 2.105206, 0, 0, 0, 1, 1,
0.3196078, 0.1248805, 1.829677, 0, 0, 0, 1, 1,
0.3196226, 1.12714, -0.1005231, 1, 1, 1, 1, 1,
0.3234828, -0.2528324, 1.918754, 1, 1, 1, 1, 1,
0.3240708, -0.7643132, 2.739002, 1, 1, 1, 1, 1,
0.3260307, -0.9825013, 1.589604, 1, 1, 1, 1, 1,
0.3273059, 1.179389, -0.6898745, 1, 1, 1, 1, 1,
0.3282607, 0.5391692, 1.510431, 1, 1, 1, 1, 1,
0.3303735, -1.857651, 2.878858, 1, 1, 1, 1, 1,
0.334269, -0.4368251, 3.846382, 1, 1, 1, 1, 1,
0.3358207, 1.326105, 0.3757494, 1, 1, 1, 1, 1,
0.3452215, -1.856, 2.441159, 1, 1, 1, 1, 1,
0.3491078, 0.5087925, 1.430147, 1, 1, 1, 1, 1,
0.3533785, 0.9170918, -0.9115182, 1, 1, 1, 1, 1,
0.3552789, 0.7276794, 1.936236, 1, 1, 1, 1, 1,
0.3651623, -1.105735, 1.481466, 1, 1, 1, 1, 1,
0.3674384, -0.9166703, 0.621306, 1, 1, 1, 1, 1,
0.3683806, 0.7155456, -0.6971201, 0, 0, 1, 1, 1,
0.37021, 0.9305136, -0.6778174, 1, 0, 0, 1, 1,
0.3715432, -1.801589, 3.774344, 1, 0, 0, 1, 1,
0.3719047, -0.1007004, 1.101733, 1, 0, 0, 1, 1,
0.3759177, 1.006522, 0.3999723, 1, 0, 0, 1, 1,
0.3793522, 0.9675823, 0.6900981, 1, 0, 0, 1, 1,
0.3840753, 0.1525095, 3.301125, 0, 0, 0, 1, 1,
0.3878616, -1.449755, 3.544299, 0, 0, 0, 1, 1,
0.3882506, -0.4919582, 1.864123, 0, 0, 0, 1, 1,
0.3914608, 1.391651, 0.3417228, 0, 0, 0, 1, 1,
0.4006769, 1.270486, 1.353049, 0, 0, 0, 1, 1,
0.4012492, 0.1810676, 0.8988431, 0, 0, 0, 1, 1,
0.404118, 0.1839506, 0.9295061, 0, 0, 0, 1, 1,
0.4072853, 0.2355889, 2.750435, 1, 1, 1, 1, 1,
0.4081217, -0.239651, 1.660708, 1, 1, 1, 1, 1,
0.408453, -2.242039, 3.496222, 1, 1, 1, 1, 1,
0.4085018, 1.76045, 1.406616, 1, 1, 1, 1, 1,
0.4106154, 0.1084532, 0.5878747, 1, 1, 1, 1, 1,
0.4125315, -0.3407869, 4.726399, 1, 1, 1, 1, 1,
0.4127325, -0.5567266, 1.400831, 1, 1, 1, 1, 1,
0.4140461, -0.006001609, 1.492921, 1, 1, 1, 1, 1,
0.4164803, -1.502225, 1.257821, 1, 1, 1, 1, 1,
0.4187308, 1.242113, 1.544358, 1, 1, 1, 1, 1,
0.4188658, 1.819177, -0.7600255, 1, 1, 1, 1, 1,
0.4212534, 1.351543, 3.022933, 1, 1, 1, 1, 1,
0.42176, 0.2153353, 0.8591037, 1, 1, 1, 1, 1,
0.425053, -1.596523, 4.261139, 1, 1, 1, 1, 1,
0.4310498, -0.6685644, 2.983421, 1, 1, 1, 1, 1,
0.4323003, 0.8166376, 0.1042714, 0, 0, 1, 1, 1,
0.437094, 0.2380982, -1.120332, 1, 0, 0, 1, 1,
0.4383935, 0.9475549, 0.6659247, 1, 0, 0, 1, 1,
0.4387986, -0.6977455, 1.696612, 1, 0, 0, 1, 1,
0.4403894, 0.6528035, 1.745524, 1, 0, 0, 1, 1,
0.4406795, 0.1772891, 0.2277936, 1, 0, 0, 1, 1,
0.4472088, -0.6954128, 3.59088, 0, 0, 0, 1, 1,
0.4477323, -2.199732, 2.085882, 0, 0, 0, 1, 1,
0.460587, 1.282695, -0.6883845, 0, 0, 0, 1, 1,
0.4645882, 0.6627412, 1.855015, 0, 0, 0, 1, 1,
0.4689437, -0.6867187, 2.456385, 0, 0, 0, 1, 1,
0.472551, -1.085643, 2.946167, 0, 0, 0, 1, 1,
0.4740623, 1.244664, 2.203471, 0, 0, 0, 1, 1,
0.4796122, -0.5312374, 1.425203, 1, 1, 1, 1, 1,
0.4804029, 0.4821104, 0.3416173, 1, 1, 1, 1, 1,
0.4805113, 0.03734248, 1.017113, 1, 1, 1, 1, 1,
0.4807278, 1.230188, 0.844254, 1, 1, 1, 1, 1,
0.4813649, -0.8573223, 3.213201, 1, 1, 1, 1, 1,
0.4845607, -0.2074505, 2.561211, 1, 1, 1, 1, 1,
0.4867618, 1.375596, -0.3772292, 1, 1, 1, 1, 1,
0.4890275, -1.136367, 4.079745, 1, 1, 1, 1, 1,
0.4903206, -1.818738, 0.8144774, 1, 1, 1, 1, 1,
0.4937674, 1.395305, 0.7019472, 1, 1, 1, 1, 1,
0.4953851, -0.7591978, 3.060223, 1, 1, 1, 1, 1,
0.4970968, 0.4880054, -0.9962898, 1, 1, 1, 1, 1,
0.4971718, -0.4681497, 2.117047, 1, 1, 1, 1, 1,
0.4972696, 1.826436, 0.9758151, 1, 1, 1, 1, 1,
0.4994399, 0.6104022, 0.6079906, 1, 1, 1, 1, 1,
0.4998671, -0.7588999, 3.408496, 0, 0, 1, 1, 1,
0.5027325, 1.891881, 1.318652, 1, 0, 0, 1, 1,
0.5050381, -1.017408, 2.187256, 1, 0, 0, 1, 1,
0.5076261, -1.61796, 2.848286, 1, 0, 0, 1, 1,
0.5116488, -0.3826521, -1.329937, 1, 0, 0, 1, 1,
0.5127996, 1.352327, 1.980671, 1, 0, 0, 1, 1,
0.5183089, 0.4992458, -0.2872353, 0, 0, 0, 1, 1,
0.5185642, 0.5483431, 1.792141, 0, 0, 0, 1, 1,
0.5308128, -0.02463553, 0.7663723, 0, 0, 0, 1, 1,
0.5341625, -1.070101, 0.1676961, 0, 0, 0, 1, 1,
0.5370004, -0.5622673, 1.164994, 0, 0, 0, 1, 1,
0.5378455, 1.020479, 0.6063176, 0, 0, 0, 1, 1,
0.5464633, -0.1796064, 1.222074, 0, 0, 0, 1, 1,
0.5466238, -1.49966, 2.560494, 1, 1, 1, 1, 1,
0.5495675, -0.2890662, 1.536355, 1, 1, 1, 1, 1,
0.5506675, 0.1814232, 0.1049123, 1, 1, 1, 1, 1,
0.5514944, -1.992134, 2.303765, 1, 1, 1, 1, 1,
0.5586202, 0.08271629, 3.096051, 1, 1, 1, 1, 1,
0.5598899, -1.496081, 3.413833, 1, 1, 1, 1, 1,
0.5670069, -0.9032809, 2.052513, 1, 1, 1, 1, 1,
0.5676588, -0.08017263, 2.917464, 1, 1, 1, 1, 1,
0.5696277, -0.845456, 1.88956, 1, 1, 1, 1, 1,
0.580146, -0.7057812, 0.3510615, 1, 1, 1, 1, 1,
0.5804049, -0.1584093, 2.883002, 1, 1, 1, 1, 1,
0.5833228, 0.462808, 1.292244, 1, 1, 1, 1, 1,
0.5886279, 0.3032029, 0.7225277, 1, 1, 1, 1, 1,
0.5928553, 0.9375086, 0.46591, 1, 1, 1, 1, 1,
0.5945531, -1.024956, 0.8726231, 1, 1, 1, 1, 1,
0.5954816, 0.0873227, 0.7069196, 0, 0, 1, 1, 1,
0.5962199, -1.113623, 3.13547, 1, 0, 0, 1, 1,
0.5965832, 1.133807, -0.3856335, 1, 0, 0, 1, 1,
0.6039121, 1.102277, -0.02030153, 1, 0, 0, 1, 1,
0.6068481, -0.09210671, 1.345928, 1, 0, 0, 1, 1,
0.6084539, 0.2327035, 1.833047, 1, 0, 0, 1, 1,
0.6087139, 0.3490584, 1.622097, 0, 0, 0, 1, 1,
0.6091433, 1.427581, -0.1867282, 0, 0, 0, 1, 1,
0.6100208, -1.682171, 2.723354, 0, 0, 0, 1, 1,
0.6109107, -1.474942, 2.547244, 0, 0, 0, 1, 1,
0.6131757, 0.4817874, 0.2448192, 0, 0, 0, 1, 1,
0.618282, 2.427861, 0.2665118, 0, 0, 0, 1, 1,
0.6240978, -1.04591, 4.067924, 0, 0, 0, 1, 1,
0.6243314, 2.398111, 0.02235565, 1, 1, 1, 1, 1,
0.6302103, 0.350671, 0.007756073, 1, 1, 1, 1, 1,
0.6347147, -1.185442, 3.023808, 1, 1, 1, 1, 1,
0.635325, 0.849583, 0.07838924, 1, 1, 1, 1, 1,
0.63896, -1.07928, 4.566988, 1, 1, 1, 1, 1,
0.6398465, -0.2163759, 2.361223, 1, 1, 1, 1, 1,
0.6418615, 0.7084851, 0.4212905, 1, 1, 1, 1, 1,
0.6428693, -0.2224006, 2.129055, 1, 1, 1, 1, 1,
0.6454009, -0.5454876, 2.634044, 1, 1, 1, 1, 1,
0.6502525, 0.3247149, 0.9589973, 1, 1, 1, 1, 1,
0.6593441, 1.973503, 0.2149455, 1, 1, 1, 1, 1,
0.6619977, -3.166403, 0.9303282, 1, 1, 1, 1, 1,
0.6642107, 0.0314266, 1.636674, 1, 1, 1, 1, 1,
0.6650114, -0.0778484, 1.546456, 1, 1, 1, 1, 1,
0.6759207, 0.04962258, 1.391402, 1, 1, 1, 1, 1,
0.6784524, 0.6428658, 1.480228, 0, 0, 1, 1, 1,
0.6854247, -0.9247212, 3.91193, 1, 0, 0, 1, 1,
0.6896224, -0.02279733, 1.825826, 1, 0, 0, 1, 1,
0.6935936, 0.5274519, -0.3027525, 1, 0, 0, 1, 1,
0.6949638, -0.7962487, 0.7895783, 1, 0, 0, 1, 1,
0.6955546, 0.7982305, 1.279944, 1, 0, 0, 1, 1,
0.7011989, -1.103946, 5.25135, 0, 0, 0, 1, 1,
0.7040166, -0.09672667, 1.461208, 0, 0, 0, 1, 1,
0.7094089, 0.0960946, 2.287246, 0, 0, 0, 1, 1,
0.7097036, 0.883776, -0.1448296, 0, 0, 0, 1, 1,
0.710853, -0.4598984, 2.910995, 0, 0, 0, 1, 1,
0.7140068, 0.8135329, 1.736775, 0, 0, 0, 1, 1,
0.7142182, 1.08297, -0.7503724, 0, 0, 0, 1, 1,
0.7281101, -1.01246, 1.999155, 1, 1, 1, 1, 1,
0.729187, -0.0838844, 1.318496, 1, 1, 1, 1, 1,
0.7292803, 0.260849, 1.234878, 1, 1, 1, 1, 1,
0.7304578, -0.3455637, 1.808729, 1, 1, 1, 1, 1,
0.7310383, 1.464339, 0.1476044, 1, 1, 1, 1, 1,
0.734158, 0.4305695, 2.63261, 1, 1, 1, 1, 1,
0.7351208, -0.9213492, 2.393128, 1, 1, 1, 1, 1,
0.7360516, 0.2927207, 0.7021536, 1, 1, 1, 1, 1,
0.7362348, -1.232409, 2.152895, 1, 1, 1, 1, 1,
0.7567282, -0.7461616, 2.385592, 1, 1, 1, 1, 1,
0.756995, -0.1917111, 1.482844, 1, 1, 1, 1, 1,
0.7587928, 2.076055, 1.49837, 1, 1, 1, 1, 1,
0.7619329, -0.9240523, 1.493595, 1, 1, 1, 1, 1,
0.7689825, -1.397766, 2.258862, 1, 1, 1, 1, 1,
0.7714832, -0.7670823, 3.821536, 1, 1, 1, 1, 1,
0.7732206, -1.29384, 2.040627, 0, 0, 1, 1, 1,
0.7758304, -0.6041622, 0.4453236, 1, 0, 0, 1, 1,
0.7799575, 1.696309, 0.5240894, 1, 0, 0, 1, 1,
0.7817167, -1.816531, 2.230119, 1, 0, 0, 1, 1,
0.7836386, 0.5781849, 2.54831, 1, 0, 0, 1, 1,
0.7885996, -0.3550148, 2.11443, 1, 0, 0, 1, 1,
0.7892634, 0.09084802, 3.082363, 0, 0, 0, 1, 1,
0.7927234, 0.5141203, -0.7292339, 0, 0, 0, 1, 1,
0.8059883, 0.2834624, 2.910511, 0, 0, 0, 1, 1,
0.8103618, -0.2813919, 3.16885, 0, 0, 0, 1, 1,
0.8113524, -0.6421586, 2.331456, 0, 0, 0, 1, 1,
0.8124286, 1.092956, 0.6721738, 0, 0, 0, 1, 1,
0.8171569, -1.118417, 3.168861, 0, 0, 0, 1, 1,
0.8183513, -0.6688913, 1.614112, 1, 1, 1, 1, 1,
0.8184958, 0.4418281, 0.7571177, 1, 1, 1, 1, 1,
0.8218474, 1.796266, 1.262883, 1, 1, 1, 1, 1,
0.8275029, 0.4981569, 2.128963, 1, 1, 1, 1, 1,
0.8282228, 0.3131008, 0.6952605, 1, 1, 1, 1, 1,
0.839727, -1.559133, 2.735953, 1, 1, 1, 1, 1,
0.8401884, -1.17442, 4.71954, 1, 1, 1, 1, 1,
0.8424153, -1.048076, 0.4086823, 1, 1, 1, 1, 1,
0.8442038, 1.228959, 0.7443247, 1, 1, 1, 1, 1,
0.8443471, 1.477272, -0.6270263, 1, 1, 1, 1, 1,
0.8487321, -0.2156653, 4.071844, 1, 1, 1, 1, 1,
0.8522189, 0.06382933, 0.7815927, 1, 1, 1, 1, 1,
0.8537503, 0.1938009, 3.07003, 1, 1, 1, 1, 1,
0.8539841, -0.3060624, 0.3816182, 1, 1, 1, 1, 1,
0.8594861, -0.529309, 1.725142, 1, 1, 1, 1, 1,
0.8641602, 1.523691, -0.1793484, 0, 0, 1, 1, 1,
0.8655614, 0.3032074, 0.5851499, 1, 0, 0, 1, 1,
0.8672928, 1.72833, 2.097707, 1, 0, 0, 1, 1,
0.8722165, 1.268037, 2.147927, 1, 0, 0, 1, 1,
0.8787113, -0.2305408, 0.3699926, 1, 0, 0, 1, 1,
0.8792626, -0.7471823, 1.543374, 1, 0, 0, 1, 1,
0.8795488, 0.9439715, -1.500294, 0, 0, 0, 1, 1,
0.8824767, -1.566581, 3.217065, 0, 0, 0, 1, 1,
0.8836221, -0.1881644, 1.734833, 0, 0, 0, 1, 1,
0.8857512, -1.29368, 3.097876, 0, 0, 0, 1, 1,
0.8880171, -0.5053831, 1.944512, 0, 0, 0, 1, 1,
0.8892394, 2.960163, -2.038308, 0, 0, 0, 1, 1,
0.8933698, 0.5375357, 0.1452875, 0, 0, 0, 1, 1,
0.899415, -1.469473, 2.478677, 1, 1, 1, 1, 1,
0.9005864, -0.3253119, 1.873331, 1, 1, 1, 1, 1,
0.9009458, -1.159175, 2.501251, 1, 1, 1, 1, 1,
0.9100872, -0.8355666, 3.52118, 1, 1, 1, 1, 1,
0.9107839, 0.1553003, 0.2226431, 1, 1, 1, 1, 1,
0.9167207, -0.1958265, 3.002323, 1, 1, 1, 1, 1,
0.9227893, 0.6544015, 2.207284, 1, 1, 1, 1, 1,
0.9285638, -0.8655484, 4.068985, 1, 1, 1, 1, 1,
0.9348572, -1.814328, 1.333431, 1, 1, 1, 1, 1,
0.9387854, -0.6211138, 3.472041, 1, 1, 1, 1, 1,
0.9457672, -0.2928557, 1.505922, 1, 1, 1, 1, 1,
0.9483155, 1.886269, 0.3357604, 1, 1, 1, 1, 1,
0.9517832, -0.1955715, 2.880317, 1, 1, 1, 1, 1,
0.9524455, -0.6530004, 1.109144, 1, 1, 1, 1, 1,
0.9552205, 0.7484262, 1.898004, 1, 1, 1, 1, 1,
0.9581677, 1.117328, -0.298189, 0, 0, 1, 1, 1,
0.9624951, 0.03479848, 2.417063, 1, 0, 0, 1, 1,
0.9678304, -0.3910303, 1.82238, 1, 0, 0, 1, 1,
0.97167, -0.9868219, 3.596132, 1, 0, 0, 1, 1,
0.9780124, 2.044534, 1.369885, 1, 0, 0, 1, 1,
0.97837, 0.3218232, 1.058029, 1, 0, 0, 1, 1,
0.9785205, -1.462982, 0.7027964, 0, 0, 0, 1, 1,
0.9788852, 0.03671938, 1.266106, 0, 0, 0, 1, 1,
0.9795833, -0.1088807, -0.1257434, 0, 0, 0, 1, 1,
0.9828325, 1.264415, -1.240253, 0, 0, 0, 1, 1,
0.9878303, 1.344752, -0.0232565, 0, 0, 0, 1, 1,
0.9965304, -1.768381, 1.883179, 0, 0, 0, 1, 1,
1.010317, -2.505107, 3.295068, 0, 0, 0, 1, 1,
1.018174, 0.6286818, 2.414576, 1, 1, 1, 1, 1,
1.01893, 1.779755, 1.315452, 1, 1, 1, 1, 1,
1.028703, -0.8157517, 1.244068, 1, 1, 1, 1, 1,
1.039889, -0.7075477, 2.708546, 1, 1, 1, 1, 1,
1.039903, 1.170962, 1.301593, 1, 1, 1, 1, 1,
1.043183, -0.3098066, 1.910051, 1, 1, 1, 1, 1,
1.05406, -0.1736126, 1.706889, 1, 1, 1, 1, 1,
1.056799, 0.7395144, 0.8213627, 1, 1, 1, 1, 1,
1.065532, -0.7259048, 0.9457866, 1, 1, 1, 1, 1,
1.070347, 0.7649931, 1.651235, 1, 1, 1, 1, 1,
1.078481, 0.837146, 2.146428, 1, 1, 1, 1, 1,
1.083857, 0.6347808, 2.694867, 1, 1, 1, 1, 1,
1.084297, -0.4136124, 1.415469, 1, 1, 1, 1, 1,
1.084399, -0.3333927, 3.165672, 1, 1, 1, 1, 1,
1.094926, -0.5226177, 3.837121, 1, 1, 1, 1, 1,
1.097152, -0.8090016, 2.775939, 0, 0, 1, 1, 1,
1.099515, 0.8885215, 1.597718, 1, 0, 0, 1, 1,
1.101336, 0.1429831, 2.519166, 1, 0, 0, 1, 1,
1.104064, 1.036151, 0.2488243, 1, 0, 0, 1, 1,
1.107331, -1.251059, 1.42218, 1, 0, 0, 1, 1,
1.109567, -1.464509, 2.407792, 1, 0, 0, 1, 1,
1.114854, -0.5327118, 0.9828981, 0, 0, 0, 1, 1,
1.122803, 0.5552989, 1.322781, 0, 0, 0, 1, 1,
1.128632, 0.4393697, 1.105232, 0, 0, 0, 1, 1,
1.13255, 0.2305655, 3.054679, 0, 0, 0, 1, 1,
1.138015, -0.6385725, 1.142331, 0, 0, 0, 1, 1,
1.138819, 1.572859, 1.722256, 0, 0, 0, 1, 1,
1.139978, -0.580952, 3.027174, 0, 0, 0, 1, 1,
1.142404, 0.7617434, 1.74204, 1, 1, 1, 1, 1,
1.144049, -0.01043961, 1.042771, 1, 1, 1, 1, 1,
1.145099, -0.135009, 1.321225, 1, 1, 1, 1, 1,
1.161258, 1.214197, 0.6568667, 1, 1, 1, 1, 1,
1.166928, -0.08569317, 0.4625472, 1, 1, 1, 1, 1,
1.173735, -0.9250714, 2.296369, 1, 1, 1, 1, 1,
1.180422, 0.3782432, 2.591336, 1, 1, 1, 1, 1,
1.185699, 1.474011, -0.7045872, 1, 1, 1, 1, 1,
1.216551, -1.689077, 2.156111, 1, 1, 1, 1, 1,
1.221013, -0.5946103, 1.405603, 1, 1, 1, 1, 1,
1.224762, 2.616634, -1.704361, 1, 1, 1, 1, 1,
1.227534, -1.158835, 2.960887, 1, 1, 1, 1, 1,
1.230671, -0.6541337, 2.25431, 1, 1, 1, 1, 1,
1.231239, -0.09925332, 2.578091, 1, 1, 1, 1, 1,
1.232239, -0.1596452, 0.7152418, 1, 1, 1, 1, 1,
1.234148, -0.8645704, 3.184958, 0, 0, 1, 1, 1,
1.237857, -1.034735, -0.3649731, 1, 0, 0, 1, 1,
1.247948, -0.2887369, 2.646214, 1, 0, 0, 1, 1,
1.253536, 0.8920724, 1.763924, 1, 0, 0, 1, 1,
1.256082, -0.4807091, 1.031441, 1, 0, 0, 1, 1,
1.262146, 1.12693, 0.5581897, 1, 0, 0, 1, 1,
1.265388, -1.247181, 2.792225, 0, 0, 0, 1, 1,
1.280056, -0.1022254, 2.619475, 0, 0, 0, 1, 1,
1.280438, 0.09978097, 1.333259, 0, 0, 0, 1, 1,
1.284022, -0.04083138, -0.2793693, 0, 0, 0, 1, 1,
1.285998, -0.5510532, 0.8365231, 0, 0, 0, 1, 1,
1.287388, 0.9199331, -0.060041, 0, 0, 0, 1, 1,
1.293008, 0.3637321, -1.079038, 0, 0, 0, 1, 1,
1.295061, 0.4382671, 1.604376, 1, 1, 1, 1, 1,
1.315719, 0.8657248, 0.5197532, 1, 1, 1, 1, 1,
1.317388, -0.9808549, 3.015705, 1, 1, 1, 1, 1,
1.319297, -0.1401912, 2.977578, 1, 1, 1, 1, 1,
1.329813, 0.1047, 1.315331, 1, 1, 1, 1, 1,
1.356531, -1.526038, 3.19704, 1, 1, 1, 1, 1,
1.358157, 0.789817, 1.231986, 1, 1, 1, 1, 1,
1.372417, -0.8862859, 1.538032, 1, 1, 1, 1, 1,
1.385659, 0.03965231, 1.403931, 1, 1, 1, 1, 1,
1.394845, 0.844287, 3.427246, 1, 1, 1, 1, 1,
1.412873, 0.3467315, 1.324391, 1, 1, 1, 1, 1,
1.417388, -0.3465312, 1.095786, 1, 1, 1, 1, 1,
1.418182, -1.040106, 2.32945, 1, 1, 1, 1, 1,
1.425329, 0.8069041, 0.6461914, 1, 1, 1, 1, 1,
1.440405, 2.019674, 0.7656012, 1, 1, 1, 1, 1,
1.450381, 0.5224858, 1.60269, 0, 0, 1, 1, 1,
1.454599, 0.7017909, 1.060369, 1, 0, 0, 1, 1,
1.457809, -0.684532, 2.528788, 1, 0, 0, 1, 1,
1.460317, 0.1519614, -0.7619351, 1, 0, 0, 1, 1,
1.463903, -0.2195378, 1.178667, 1, 0, 0, 1, 1,
1.468134, 0.4716208, 1.649587, 1, 0, 0, 1, 1,
1.469876, -1.443998, 1.66199, 0, 0, 0, 1, 1,
1.482748, 0.7540538, 0.8464659, 0, 0, 0, 1, 1,
1.490145, 1.060997, 3.747607, 0, 0, 0, 1, 1,
1.500947, 1.703981, 1.944156, 0, 0, 0, 1, 1,
1.501166, -0.2310949, 0.5517799, 0, 0, 0, 1, 1,
1.509489, 0.4000674, 2.985065, 0, 0, 0, 1, 1,
1.5104, 0.1226767, 0.074181, 0, 0, 0, 1, 1,
1.512092, -1.497709, 0.3907971, 1, 1, 1, 1, 1,
1.512861, -0.794005, 1.323643, 1, 1, 1, 1, 1,
1.526929, -0.5536447, 2.457331, 1, 1, 1, 1, 1,
1.531052, -0.3763438, -0.1201868, 1, 1, 1, 1, 1,
1.569571, -1.421594, 4.625313, 1, 1, 1, 1, 1,
1.577031, 0.3623535, 1.533509, 1, 1, 1, 1, 1,
1.581872, -0.3727055, 1.155984, 1, 1, 1, 1, 1,
1.585195, 0.3308284, 3.926476, 1, 1, 1, 1, 1,
1.594593, -0.1151248, 3.048797, 1, 1, 1, 1, 1,
1.594701, -1.534046, 2.714157, 1, 1, 1, 1, 1,
1.597731, -0.4336952, 3.393788, 1, 1, 1, 1, 1,
1.598774, -1.530063, 3.114625, 1, 1, 1, 1, 1,
1.603812, -0.2425399, -0.2388664, 1, 1, 1, 1, 1,
1.648746, -2.537568, 3.449798, 1, 1, 1, 1, 1,
1.658435, 0.8634284, 0.8713019, 1, 1, 1, 1, 1,
1.683125, -0.04920844, 1.592049, 0, 0, 1, 1, 1,
1.685522, 0.7680019, 3.28335, 1, 0, 0, 1, 1,
1.685877, -0.4582741, 1.155975, 1, 0, 0, 1, 1,
1.705659, 0.07660556, 1.666384, 1, 0, 0, 1, 1,
1.711624, 0.1188152, 0.4524195, 1, 0, 0, 1, 1,
1.714436, -0.6517297, 2.711404, 1, 0, 0, 1, 1,
1.754696, -0.4448385, 3.466094, 0, 0, 0, 1, 1,
1.757831, -0.8727588, 2.408399, 0, 0, 0, 1, 1,
1.781591, 0.02367215, 1.874996, 0, 0, 0, 1, 1,
1.781864, -0.1438998, 1.236133, 0, 0, 0, 1, 1,
1.796371, 0.7093202, -1.205707, 0, 0, 0, 1, 1,
1.796984, 0.8560194, 0.07738534, 0, 0, 0, 1, 1,
1.802712, -0.8470063, -0.355202, 0, 0, 0, 1, 1,
1.803828, -1.439581, 2.695002, 1, 1, 1, 1, 1,
1.811408, -0.02294646, 1.158854, 1, 1, 1, 1, 1,
1.818003, -1.726247, 3.601821, 1, 1, 1, 1, 1,
1.843969, 0.4836698, 2.449467, 1, 1, 1, 1, 1,
1.8966, 0.622188, 0.437841, 1, 1, 1, 1, 1,
1.898188, -1.929655, 2.861504, 1, 1, 1, 1, 1,
1.906473, -0.0356963, 2.388062, 1, 1, 1, 1, 1,
1.935407, 0.8778596, 0.6094574, 1, 1, 1, 1, 1,
1.936416, 1.193269, 0.5573036, 1, 1, 1, 1, 1,
1.940593, -0.001284005, 1.834894, 1, 1, 1, 1, 1,
1.981495, -1.259301, 0.5668048, 1, 1, 1, 1, 1,
1.988239, 0.2138737, 1.034632, 1, 1, 1, 1, 1,
2.000153, -2.015483, 2.150262, 1, 1, 1, 1, 1,
2.033428, -0.1717066, 0.4495596, 1, 1, 1, 1, 1,
2.04539, 2.480551, 2.372054, 1, 1, 1, 1, 1,
2.052999, 0.6660312, -0.1176277, 0, 0, 1, 1, 1,
2.058777, 0.2221989, 0.1485702, 1, 0, 0, 1, 1,
2.116313, -0.09055298, 0.9322362, 1, 0, 0, 1, 1,
2.12486, -1.720296, 1.7437, 1, 0, 0, 1, 1,
2.162295, 0.1702401, 1.076181, 1, 0, 0, 1, 1,
2.170705, -0.1983991, -0.2112711, 1, 0, 0, 1, 1,
2.190542, -0.1601998, 0.6109579, 0, 0, 0, 1, 1,
2.2149, -0.338968, 1.786646, 0, 0, 0, 1, 1,
2.31863, -1.316386, 2.283098, 0, 0, 0, 1, 1,
2.322785, 0.05675018, 1.963528, 0, 0, 0, 1, 1,
2.402026, -1.284699, 2.695732, 0, 0, 0, 1, 1,
2.440957, -0.1492473, -0.694031, 0, 0, 0, 1, 1,
2.451751, 0.2075281, 2.468251, 0, 0, 0, 1, 1,
2.490399, 0.8344132, 2.108375, 1, 1, 1, 1, 1,
2.589895, -0.302204, 1.502085, 1, 1, 1, 1, 1,
2.649815, 1.070523, 0.5843896, 1, 1, 1, 1, 1,
2.788029, -0.09032229, 0.8947968, 1, 1, 1, 1, 1,
2.88715, -0.2257531, 0.510857, 1, 1, 1, 1, 1,
3.816411, 0.6747942, 2.01637, 1, 1, 1, 1, 1,
4.061921, 0.8585184, 2.191046, 1, 1, 1, 1, 1
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
var radius = 9.701582;
var distance = 34.0764;
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
mvMatrix.translate( -0.5758531, -0.04202938, -0.0116539 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.0764);
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