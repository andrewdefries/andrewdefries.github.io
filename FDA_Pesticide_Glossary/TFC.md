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
-3.380869, -1.814811, -2.346471, 1, 0, 0, 1,
-3.294031, 0.7039624, -2.681024, 1, 0.007843138, 0, 1,
-2.792448, -1.13736, -2.061216, 1, 0.01176471, 0, 1,
-2.741786, -1.046541, -2.539082, 1, 0.01960784, 0, 1,
-2.52085, 0.6327538, -0.5849074, 1, 0.02352941, 0, 1,
-2.500085, 0.7566762, -1.812025, 1, 0.03137255, 0, 1,
-2.489281, -0.1436499, -1.054553, 1, 0.03529412, 0, 1,
-2.475545, -1.702933, -1.584005, 1, 0.04313726, 0, 1,
-2.243851, -1.065438, -2.160916, 1, 0.04705882, 0, 1,
-2.213586, 0.8165076, -1.235189, 1, 0.05490196, 0, 1,
-2.186996, 0.6683882, -2.205364, 1, 0.05882353, 0, 1,
-2.182372, -1.175915, -1.671997, 1, 0.06666667, 0, 1,
-2.182329, -0.5030767, -2.176239, 1, 0.07058824, 0, 1,
-2.179636, -0.5916167, -1.809391, 1, 0.07843138, 0, 1,
-2.168705, 0.3823622, -1.519238, 1, 0.08235294, 0, 1,
-2.165536, 0.07119279, -2.006138, 1, 0.09019608, 0, 1,
-2.158476, 0.3882063, -3.153959, 1, 0.09411765, 0, 1,
-2.130011, -0.5819072, -1.156805, 1, 0.1019608, 0, 1,
-2.126992, -1.716472, -0.8622494, 1, 0.1098039, 0, 1,
-2.104314, -0.05582381, 0.3390292, 1, 0.1137255, 0, 1,
-2.10239, -0.311121, -2.759161, 1, 0.1215686, 0, 1,
-2.078718, -1.569176, -1.621837, 1, 0.1254902, 0, 1,
-2.056466, -0.5280201, -2.314113, 1, 0.1333333, 0, 1,
-2.051272, -0.6360832, -1.369901, 1, 0.1372549, 0, 1,
-2.023646, 0.6157871, -0.0293432, 1, 0.145098, 0, 1,
-1.996885, -0.4384347, -2.352894, 1, 0.1490196, 0, 1,
-1.967304, 0.7185128, -2.529814, 1, 0.1568628, 0, 1,
-1.960687, -2.086487, -1.83887, 1, 0.1607843, 0, 1,
-1.955604, 0.812054, -0.9648175, 1, 0.1686275, 0, 1,
-1.954526, 0.7649078, -3.392115, 1, 0.172549, 0, 1,
-1.919738, 0.4319611, -1.066477, 1, 0.1803922, 0, 1,
-1.910239, 0.07197198, -2.273342, 1, 0.1843137, 0, 1,
-1.891969, 0.786215, -0.01461013, 1, 0.1921569, 0, 1,
-1.890645, -1.293071, -3.396092, 1, 0.1960784, 0, 1,
-1.867579, -0.7067404, -1.638732, 1, 0.2039216, 0, 1,
-1.857363, -0.5217128, -0.9454423, 1, 0.2117647, 0, 1,
-1.84448, 1.136471, -0.9865294, 1, 0.2156863, 0, 1,
-1.834984, 1.121959, -0.6107479, 1, 0.2235294, 0, 1,
-1.825867, -0.790085, -1.440227, 1, 0.227451, 0, 1,
-1.803593, 0.6597149, -0.5031824, 1, 0.2352941, 0, 1,
-1.795202, 0.2531546, -0.8036399, 1, 0.2392157, 0, 1,
-1.793589, 0.2877689, -1.905203, 1, 0.2470588, 0, 1,
-1.782313, -0.7074415, -2.599901, 1, 0.2509804, 0, 1,
-1.771582, -0.5595889, -3.030347, 1, 0.2588235, 0, 1,
-1.769584, -1.349002, -1.775936, 1, 0.2627451, 0, 1,
-1.755638, 0.05913204, -0.4370107, 1, 0.2705882, 0, 1,
-1.749452, -0.1447879, -0.2263365, 1, 0.2745098, 0, 1,
-1.748702, -1.389963, -0.7677268, 1, 0.282353, 0, 1,
-1.74374, -0.3188926, -2.008143, 1, 0.2862745, 0, 1,
-1.721742, -1.227311, -2.321963, 1, 0.2941177, 0, 1,
-1.711465, 0.9728404, 0.8260453, 1, 0.3019608, 0, 1,
-1.701045, -0.02880386, -1.314788, 1, 0.3058824, 0, 1,
-1.654734, 0.1568669, -0.783017, 1, 0.3137255, 0, 1,
-1.652355, -0.2542227, -1.381912, 1, 0.3176471, 0, 1,
-1.634742, -0.252072, -2.746828, 1, 0.3254902, 0, 1,
-1.62914, 0.138661, -0.8812855, 1, 0.3294118, 0, 1,
-1.616676, 0.213256, -1.148802, 1, 0.3372549, 0, 1,
-1.614692, 0.2236384, -2.248435, 1, 0.3411765, 0, 1,
-1.606897, 0.6531587, -0.3202632, 1, 0.3490196, 0, 1,
-1.605263, 0.7425141, -2.784733, 1, 0.3529412, 0, 1,
-1.584565, 0.04810421, -1.622669, 1, 0.3607843, 0, 1,
-1.584348, -1.064987, -1.156375, 1, 0.3647059, 0, 1,
-1.579223, -1.105162, -1.822262, 1, 0.372549, 0, 1,
-1.569739, -0.4096026, -0.8393621, 1, 0.3764706, 0, 1,
-1.565951, 0.09929796, -1.147853, 1, 0.3843137, 0, 1,
-1.562612, -1.243575, -1.64753, 1, 0.3882353, 0, 1,
-1.558727, 1.932887, -0.9788665, 1, 0.3960784, 0, 1,
-1.550568, 0.7371348, -1.706957, 1, 0.4039216, 0, 1,
-1.545743, 0.7801266, -1.012215, 1, 0.4078431, 0, 1,
-1.535548, 0.7948946, 0.1484203, 1, 0.4156863, 0, 1,
-1.527522, -0.8411847, -1.523515, 1, 0.4196078, 0, 1,
-1.519038, -1.129803, -3.117253, 1, 0.427451, 0, 1,
-1.519015, 1.233273, -0.8831314, 1, 0.4313726, 0, 1,
-1.518926, 1.007841, -1.522083, 1, 0.4392157, 0, 1,
-1.51708, 0.3711365, -1.65949, 1, 0.4431373, 0, 1,
-1.515254, -0.5256332, -1.945102, 1, 0.4509804, 0, 1,
-1.513585, 1.059295, -1.864158, 1, 0.454902, 0, 1,
-1.50246, -0.9833027, -1.099108, 1, 0.4627451, 0, 1,
-1.497593, 1.075131, -2.13163, 1, 0.4666667, 0, 1,
-1.495664, 1.053482, -1.354367, 1, 0.4745098, 0, 1,
-1.492563, -1.509539, -3.391069, 1, 0.4784314, 0, 1,
-1.488623, 0.7334263, -2.738059, 1, 0.4862745, 0, 1,
-1.488518, 0.4048419, -2.614538, 1, 0.4901961, 0, 1,
-1.488268, -1.465513, -3.565809, 1, 0.4980392, 0, 1,
-1.486032, -0.1951764, -1.82479, 1, 0.5058824, 0, 1,
-1.485615, -0.7446433, -1.282971, 1, 0.509804, 0, 1,
-1.465757, 0.143018, -1.633131, 1, 0.5176471, 0, 1,
-1.448789, -1.317777, -2.178185, 1, 0.5215687, 0, 1,
-1.444939, -0.5111462, -2.620155, 1, 0.5294118, 0, 1,
-1.44482, 0.4228895, -1.075168, 1, 0.5333334, 0, 1,
-1.437238, -0.1623413, -1.669992, 1, 0.5411765, 0, 1,
-1.437187, 0.2244253, -0.897779, 1, 0.5450981, 0, 1,
-1.434506, 1.024621, -0.5670751, 1, 0.5529412, 0, 1,
-1.430313, 0.5813168, -0.9434005, 1, 0.5568628, 0, 1,
-1.430297, -0.5542004, -0.9862421, 1, 0.5647059, 0, 1,
-1.425159, 0.01143224, 0.2814049, 1, 0.5686275, 0, 1,
-1.42257, 0.1743064, -1.838504, 1, 0.5764706, 0, 1,
-1.420093, -0.4250515, -1.175583, 1, 0.5803922, 0, 1,
-1.38853, 1.210036, -1.460582, 1, 0.5882353, 0, 1,
-1.387347, 1.797646, -1.428543, 1, 0.5921569, 0, 1,
-1.369531, 1.351761, -3.171754, 1, 0.6, 0, 1,
-1.360405, 0.5567451, -0.523609, 1, 0.6078432, 0, 1,
-1.359732, -0.2300568, -2.62216, 1, 0.6117647, 0, 1,
-1.339836, -0.2756343, -2.745664, 1, 0.6196079, 0, 1,
-1.33676, 0.1406799, -2.777726, 1, 0.6235294, 0, 1,
-1.327567, -1.008705, -3.224674, 1, 0.6313726, 0, 1,
-1.327419, 0.9599159, -0.7576231, 1, 0.6352941, 0, 1,
-1.303726, 1.329703, -0.3709738, 1, 0.6431373, 0, 1,
-1.296722, -0.8418981, -2.882521, 1, 0.6470588, 0, 1,
-1.295697, 1.206824, -0.8422083, 1, 0.654902, 0, 1,
-1.291802, 0.5054851, -0.5803165, 1, 0.6588235, 0, 1,
-1.288772, 1.553991, -0.2905541, 1, 0.6666667, 0, 1,
-1.288211, -0.6917529, -1.99597, 1, 0.6705883, 0, 1,
-1.287519, 1.939665, -1.765114, 1, 0.6784314, 0, 1,
-1.285732, 0.06798919, -1.694137, 1, 0.682353, 0, 1,
-1.276336, -0.08226898, -2.207836, 1, 0.6901961, 0, 1,
-1.27326, 0.5391896, -1.651845, 1, 0.6941177, 0, 1,
-1.265789, 0.8837041, -1.173219, 1, 0.7019608, 0, 1,
-1.262399, 0.8473223, -2.066895, 1, 0.7098039, 0, 1,
-1.25771, 0.04058513, -1.469783, 1, 0.7137255, 0, 1,
-1.25103, -0.4160506, -1.996062, 1, 0.7215686, 0, 1,
-1.241827, -0.2978398, -0.326588, 1, 0.7254902, 0, 1,
-1.23823, 0.6329579, 0.2985899, 1, 0.7333333, 0, 1,
-1.234231, -0.7617484, -1.254705, 1, 0.7372549, 0, 1,
-1.231577, 1.305634, -1.541824, 1, 0.7450981, 0, 1,
-1.230672, 0.03041505, -3.402347, 1, 0.7490196, 0, 1,
-1.228714, 0.08270465, -2.604678, 1, 0.7568628, 0, 1,
-1.219554, 0.2084771, -0.7508716, 1, 0.7607843, 0, 1,
-1.202317, -0.1763275, -2.135955, 1, 0.7686275, 0, 1,
-1.195511, -0.8417592, -2.608844, 1, 0.772549, 0, 1,
-1.192029, 1.861686, -0.1076757, 1, 0.7803922, 0, 1,
-1.188568, -0.7699049, -2.247211, 1, 0.7843137, 0, 1,
-1.175343, 0.2140569, -0.558519, 1, 0.7921569, 0, 1,
-1.173563, 0.9806138, 0.7923045, 1, 0.7960784, 0, 1,
-1.167943, 1.035678, -1.403531, 1, 0.8039216, 0, 1,
-1.164186, 1.192893, -0.6037266, 1, 0.8117647, 0, 1,
-1.146829, -0.5582836, -3.073482, 1, 0.8156863, 0, 1,
-1.140371, 0.694625, -0.7834899, 1, 0.8235294, 0, 1,
-1.135842, -1.570713, -3.409357, 1, 0.827451, 0, 1,
-1.135058, 0.3566433, 0.1110853, 1, 0.8352941, 0, 1,
-1.134287, -1.545166, -2.687087, 1, 0.8392157, 0, 1,
-1.133085, -0.05050263, -2.562932, 1, 0.8470588, 0, 1,
-1.132778, -2.448995, -3.210035, 1, 0.8509804, 0, 1,
-1.129706, -0.0479452, -2.955691, 1, 0.8588235, 0, 1,
-1.128482, -1.751359, -2.937236, 1, 0.8627451, 0, 1,
-1.121241, 0.2953847, -0.6806093, 1, 0.8705882, 0, 1,
-1.12026, -1.227509, -1.113932, 1, 0.8745098, 0, 1,
-1.119315, 0.6750129, 0.4262139, 1, 0.8823529, 0, 1,
-1.115115, -1.13667, -2.236516, 1, 0.8862745, 0, 1,
-1.114759, -1.585436, -3.116966, 1, 0.8941177, 0, 1,
-1.108538, 0.3047201, -1.811522, 1, 0.8980392, 0, 1,
-1.105269, -1.311423, -1.397781, 1, 0.9058824, 0, 1,
-1.105087, -0.6718819, -1.372834, 1, 0.9137255, 0, 1,
-1.104898, 1.333874, -2.385275, 1, 0.9176471, 0, 1,
-1.104133, -0.3615659, -2.511803, 1, 0.9254902, 0, 1,
-1.102256, 0.07945598, -3.993726, 1, 0.9294118, 0, 1,
-1.092023, 0.4042152, -1.008827, 1, 0.9372549, 0, 1,
-1.087974, 0.9015026, -0.9565737, 1, 0.9411765, 0, 1,
-1.086639, 0.7297272, -0.2660657, 1, 0.9490196, 0, 1,
-1.085517, 0.09024009, -0.06706016, 1, 0.9529412, 0, 1,
-1.084785, -0.6221486, -2.185821, 1, 0.9607843, 0, 1,
-1.07972, 0.7884785, -0.7498808, 1, 0.9647059, 0, 1,
-1.079377, 1.565812, -3.134523, 1, 0.972549, 0, 1,
-1.078721, -0.2415798, -0.9495797, 1, 0.9764706, 0, 1,
-1.078687, 0.5112872, -0.6869105, 1, 0.9843137, 0, 1,
-1.078096, 1.58554, -0.5343325, 1, 0.9882353, 0, 1,
-1.066241, 0.9965843, -0.5639753, 1, 0.9960784, 0, 1,
-1.061736, -0.8176655, -0.7390981, 0.9960784, 1, 0, 1,
-1.058542, 0.7753271, -1.849988, 0.9921569, 1, 0, 1,
-1.058126, -1.345382, -2.874542, 0.9843137, 1, 0, 1,
-1.056445, -2.220104, -3.893933, 0.9803922, 1, 0, 1,
-1.055594, 0.1019947, -0.9816536, 0.972549, 1, 0, 1,
-1.047864, 1.164147, -1.732659, 0.9686275, 1, 0, 1,
-1.047608, 0.2271409, 0.1213787, 0.9607843, 1, 0, 1,
-1.047571, 0.2847495, -1.420222, 0.9568627, 1, 0, 1,
-1.033518, -0.9371108, -1.022494, 0.9490196, 1, 0, 1,
-1.033118, 0.5712581, -1.073678, 0.945098, 1, 0, 1,
-1.030586, -0.6782724, -2.842556, 0.9372549, 1, 0, 1,
-1.030306, -0.9282115, -3.150822, 0.9333333, 1, 0, 1,
-1.013114, -1.672372, -2.418463, 0.9254902, 1, 0, 1,
-1.008941, 0.2402154, -1.1143, 0.9215686, 1, 0, 1,
-1.008322, 0.9291849, -0.7301329, 0.9137255, 1, 0, 1,
-1.005398, -0.1078538, -1.635428, 0.9098039, 1, 0, 1,
-1.005273, 0.003220893, -2.143848, 0.9019608, 1, 0, 1,
-1.003593, -0.1420681, -1.526519, 0.8941177, 1, 0, 1,
-1.002951, 0.4276651, -1.753814, 0.8901961, 1, 0, 1,
-0.9898666, 0.9665192, -1.433722, 0.8823529, 1, 0, 1,
-0.9892281, -0.644587, -2.511688, 0.8784314, 1, 0, 1,
-0.9816039, -0.1372294, -1.896242, 0.8705882, 1, 0, 1,
-0.975606, 0.09031972, -2.669166, 0.8666667, 1, 0, 1,
-0.9717475, 1.068608, 0.1022244, 0.8588235, 1, 0, 1,
-0.9714903, -1.307571, -3.08729, 0.854902, 1, 0, 1,
-0.9659559, 1.563453, -0.06542667, 0.8470588, 1, 0, 1,
-0.9642938, -1.221961, -2.202979, 0.8431373, 1, 0, 1,
-0.9464602, 1.101704, -0.7116424, 0.8352941, 1, 0, 1,
-0.9433758, -1.585093, -3.905859, 0.8313726, 1, 0, 1,
-0.9426057, 1.60096, -1.093917, 0.8235294, 1, 0, 1,
-0.9398496, -1.16693, -3.05698, 0.8196079, 1, 0, 1,
-0.9396901, 0.5723575, -1.359565, 0.8117647, 1, 0, 1,
-0.9384743, 0.8040942, -1.264132, 0.8078431, 1, 0, 1,
-0.937981, -1.626292, -4.265175, 0.8, 1, 0, 1,
-0.9224347, -0.7354476, -3.112754, 0.7921569, 1, 0, 1,
-0.9091005, 0.02933407, -0.8536158, 0.7882353, 1, 0, 1,
-0.9077148, -0.3083325, -2.183943, 0.7803922, 1, 0, 1,
-0.9033991, -2.18522, -2.739443, 0.7764706, 1, 0, 1,
-0.8928834, 1.128754, -0.0887575, 0.7686275, 1, 0, 1,
-0.8912128, 1.108064, 0.4440233, 0.7647059, 1, 0, 1,
-0.88394, -0.118175, -1.996554, 0.7568628, 1, 0, 1,
-0.8741894, -1.671958, -2.095652, 0.7529412, 1, 0, 1,
-0.8627546, 0.4159553, -0.05926758, 0.7450981, 1, 0, 1,
-0.8607342, 0.6658638, -1.37857, 0.7411765, 1, 0, 1,
-0.8604037, -0.1342173, -2.043984, 0.7333333, 1, 0, 1,
-0.8601882, -0.154751, -2.710226, 0.7294118, 1, 0, 1,
-0.8597874, -0.6610153, -5.198039, 0.7215686, 1, 0, 1,
-0.8562147, 1.561118, -2.031149, 0.7176471, 1, 0, 1,
-0.8548787, 0.8309048, -1.49163, 0.7098039, 1, 0, 1,
-0.8537879, -0.2241262, -1.416781, 0.7058824, 1, 0, 1,
-0.8529729, -0.7647301, -1.727569, 0.6980392, 1, 0, 1,
-0.8525119, -1.585466, -4.407605, 0.6901961, 1, 0, 1,
-0.8515292, -0.938996, -2.826639, 0.6862745, 1, 0, 1,
-0.8513969, -1.078824, -1.212633, 0.6784314, 1, 0, 1,
-0.8481724, 0.5759439, -1.892787, 0.6745098, 1, 0, 1,
-0.8454799, -1.251634, -3.82407, 0.6666667, 1, 0, 1,
-0.8432273, -0.2298495, -0.2637362, 0.6627451, 1, 0, 1,
-0.8420205, 0.9466036, -2.482714, 0.654902, 1, 0, 1,
-0.8362614, 1.457961, -2.561947, 0.6509804, 1, 0, 1,
-0.8292143, -0.811381, -1.966856, 0.6431373, 1, 0, 1,
-0.8265487, 0.06974397, -2.073216, 0.6392157, 1, 0, 1,
-0.8202144, -0.6169578, -1.456435, 0.6313726, 1, 0, 1,
-0.8196249, 0.717506, 1.402165, 0.627451, 1, 0, 1,
-0.8184466, -0.03898805, -2.258044, 0.6196079, 1, 0, 1,
-0.8153522, -0.1225087, -3.157369, 0.6156863, 1, 0, 1,
-0.8133249, 0.389047, -1.101828, 0.6078432, 1, 0, 1,
-0.8078583, 0.3341213, -1.256183, 0.6039216, 1, 0, 1,
-0.8017204, -0.5789773, -1.847899, 0.5960785, 1, 0, 1,
-0.7980164, 0.2987761, -0.6029558, 0.5882353, 1, 0, 1,
-0.7902462, 2.306861, -0.5624465, 0.5843138, 1, 0, 1,
-0.7889862, -0.03272304, -0.7274929, 0.5764706, 1, 0, 1,
-0.7888722, 0.09462887, -1.54666, 0.572549, 1, 0, 1,
-0.7877384, -0.516625, -1.261719, 0.5647059, 1, 0, 1,
-0.7733296, -0.8324192, -3.19781, 0.5607843, 1, 0, 1,
-0.7680942, -0.7300155, -1.717772, 0.5529412, 1, 0, 1,
-0.7659896, 1.96391, -1.272499, 0.5490196, 1, 0, 1,
-0.7620857, -0.5843587, -1.957662, 0.5411765, 1, 0, 1,
-0.7603578, 1.049183, -0.05544707, 0.5372549, 1, 0, 1,
-0.7601942, -1.631004, -3.432237, 0.5294118, 1, 0, 1,
-0.7536374, -1.126416, -3.522686, 0.5254902, 1, 0, 1,
-0.7528014, -0.1736574, -1.085534, 0.5176471, 1, 0, 1,
-0.7515287, 0.3452531, -0.1003136, 0.5137255, 1, 0, 1,
-0.7494057, -0.2350406, -1.943639, 0.5058824, 1, 0, 1,
-0.748769, -0.3120981, -4.038314, 0.5019608, 1, 0, 1,
-0.7449674, 0.1786021, -0.4654476, 0.4941176, 1, 0, 1,
-0.7405024, -0.1141006, -3.599173, 0.4862745, 1, 0, 1,
-0.7393062, 0.2655333, -1.017114, 0.4823529, 1, 0, 1,
-0.7338245, 0.436104, -0.3492468, 0.4745098, 1, 0, 1,
-0.7312485, 0.3151632, -0.7709787, 0.4705882, 1, 0, 1,
-0.7283661, 0.6244639, 0.470251, 0.4627451, 1, 0, 1,
-0.7242727, -0.7526666, -2.133651, 0.4588235, 1, 0, 1,
-0.7196071, 0.627819, -1.747624, 0.4509804, 1, 0, 1,
-0.7183978, -1.203677, -2.670367, 0.4470588, 1, 0, 1,
-0.716285, 0.2620676, -1.224224, 0.4392157, 1, 0, 1,
-0.7124417, 0.837369, -0.1442832, 0.4352941, 1, 0, 1,
-0.7114391, -1.354429, -2.689931, 0.427451, 1, 0, 1,
-0.7093958, -1.687196, -4.083832, 0.4235294, 1, 0, 1,
-0.7080102, 2.061615, -0.7699239, 0.4156863, 1, 0, 1,
-0.7068849, 0.835152, 0.6053818, 0.4117647, 1, 0, 1,
-0.705781, 1.480444, 0.5771177, 0.4039216, 1, 0, 1,
-0.6995756, -0.8240858, -2.370155, 0.3960784, 1, 0, 1,
-0.6965628, 0.8738748, -0.8161913, 0.3921569, 1, 0, 1,
-0.6961123, -0.05097011, -2.129882, 0.3843137, 1, 0, 1,
-0.6950536, 0.4403639, -2.161994, 0.3803922, 1, 0, 1,
-0.6934067, 0.1956519, -1.491518, 0.372549, 1, 0, 1,
-0.6919792, 0.6881909, -0.5438088, 0.3686275, 1, 0, 1,
-0.6906825, 0.6000083, -1.616539, 0.3607843, 1, 0, 1,
-0.6891798, 0.2140497, -1.780523, 0.3568628, 1, 0, 1,
-0.6850035, -1.531284, -3.679682, 0.3490196, 1, 0, 1,
-0.6836105, 1.174215, -1.594468, 0.345098, 1, 0, 1,
-0.6787709, -0.6754876, -2.961824, 0.3372549, 1, 0, 1,
-0.6779842, -0.06459996, -3.501439, 0.3333333, 1, 0, 1,
-0.6745955, -0.2405396, -2.256124, 0.3254902, 1, 0, 1,
-0.6739324, -0.6179789, -3.020341, 0.3215686, 1, 0, 1,
-0.6731295, -0.5817873, -2.635171, 0.3137255, 1, 0, 1,
-0.6715864, 0.04280405, -2.413042, 0.3098039, 1, 0, 1,
-0.6702081, 0.4877877, -1.19103, 0.3019608, 1, 0, 1,
-0.6700017, 0.9741375, 0.8910399, 0.2941177, 1, 0, 1,
-0.6645788, -2.741372, -2.957152, 0.2901961, 1, 0, 1,
-0.6576014, 1.182301, -1.193045, 0.282353, 1, 0, 1,
-0.6533573, -0.6919917, -3.675522, 0.2784314, 1, 0, 1,
-0.6513569, -2.621219, -1.802122, 0.2705882, 1, 0, 1,
-0.6497414, 1.013347, -2.374854, 0.2666667, 1, 0, 1,
-0.645931, -1.108091, -3.988432, 0.2588235, 1, 0, 1,
-0.642103, -1.218579, -2.76959, 0.254902, 1, 0, 1,
-0.6420135, -1.285062, -3.2796, 0.2470588, 1, 0, 1,
-0.6403384, 0.2421607, 0.207679, 0.2431373, 1, 0, 1,
-0.6381534, 1.465654, -0.3759197, 0.2352941, 1, 0, 1,
-0.6336992, 0.07155783, -1.196602, 0.2313726, 1, 0, 1,
-0.6329675, -1.057122, -2.471714, 0.2235294, 1, 0, 1,
-0.619553, -0.08789326, -0.5357277, 0.2196078, 1, 0, 1,
-0.617941, 0.4954823, -1.830096, 0.2117647, 1, 0, 1,
-0.6175653, -0.7841504, -2.009768, 0.2078431, 1, 0, 1,
-0.6173862, 0.006722078, -1.320893, 0.2, 1, 0, 1,
-0.6152912, 0.4523571, -0.6840624, 0.1921569, 1, 0, 1,
-0.6118542, -0.1021749, -1.025003, 0.1882353, 1, 0, 1,
-0.6071395, -0.8132913, -2.645813, 0.1803922, 1, 0, 1,
-0.6053132, -0.7933019, -4.126146, 0.1764706, 1, 0, 1,
-0.6044108, 0.9305816, -0.6899436, 0.1686275, 1, 0, 1,
-0.6021882, -1.332308, -3.033771, 0.1647059, 1, 0, 1,
-0.6013194, 0.9656421, -1.15319, 0.1568628, 1, 0, 1,
-0.6003712, -1.621671, -2.820112, 0.1529412, 1, 0, 1,
-0.5983799, -1.709937, -2.873985, 0.145098, 1, 0, 1,
-0.5942925, -1.114372, -4.71453, 0.1411765, 1, 0, 1,
-0.5941173, -0.478159, -1.416127, 0.1333333, 1, 0, 1,
-0.5768239, 2.448104, -0.6055843, 0.1294118, 1, 0, 1,
-0.5755531, -0.7999695, -2.666498, 0.1215686, 1, 0, 1,
-0.5748051, 0.7444233, 0.01071141, 0.1176471, 1, 0, 1,
-0.5742568, -0.4754843, -2.497855, 0.1098039, 1, 0, 1,
-0.5727853, -0.6565176, -2.878975, 0.1058824, 1, 0, 1,
-0.5726368, -0.7343982, -2.955318, 0.09803922, 1, 0, 1,
-0.5713738, 0.7448635, -0.1694012, 0.09019608, 1, 0, 1,
-0.5586144, -2.21655, -3.426703, 0.08627451, 1, 0, 1,
-0.5504958, -0.04666141, -1.059604, 0.07843138, 1, 0, 1,
-0.545662, -1.232562, -0.4884279, 0.07450981, 1, 0, 1,
-0.5453103, 0.3951979, -1.857672, 0.06666667, 1, 0, 1,
-0.5434582, 0.1872211, 0.2235312, 0.0627451, 1, 0, 1,
-0.5413347, 0.3881623, -0.4113324, 0.05490196, 1, 0, 1,
-0.5389354, 0.678903, -0.3437045, 0.05098039, 1, 0, 1,
-0.534847, -0.156061, -1.590643, 0.04313726, 1, 0, 1,
-0.5331489, 0.3927829, 1.475976, 0.03921569, 1, 0, 1,
-0.5313541, 1.313553, 1.648671, 0.03137255, 1, 0, 1,
-0.5298735, 0.8476737, -0.7440682, 0.02745098, 1, 0, 1,
-0.526578, -0.8222395, -3.184036, 0.01960784, 1, 0, 1,
-0.5186729, -0.2701918, -1.745225, 0.01568628, 1, 0, 1,
-0.5164745, -0.8234261, -2.58406, 0.007843138, 1, 0, 1,
-0.5139313, 0.9431127, -1.215131, 0.003921569, 1, 0, 1,
-0.511649, 0.2688107, 0.5107828, 0, 1, 0.003921569, 1,
-0.5094402, 0.9438719, -0.5591647, 0, 1, 0.01176471, 1,
-0.509101, -0.04701682, -3.447039, 0, 1, 0.01568628, 1,
-0.5040234, -1.117778, -3.311497, 0, 1, 0.02352941, 1,
-0.5016567, -0.7420858, -3.341834, 0, 1, 0.02745098, 1,
-0.5000308, -0.1775868, -1.963418, 0, 1, 0.03529412, 1,
-0.498432, 0.5892791, -0.9112601, 0, 1, 0.03921569, 1,
-0.4956809, 0.1227683, -0.1586643, 0, 1, 0.04705882, 1,
-0.4929091, -0.7508813, -1.514292, 0, 1, 0.05098039, 1,
-0.4912786, -0.5766165, -2.723641, 0, 1, 0.05882353, 1,
-0.4866352, 1.125311, -0.7706192, 0, 1, 0.0627451, 1,
-0.4800718, -0.6851286, -3.827891, 0, 1, 0.07058824, 1,
-0.4788541, 1.850396, -0.9663053, 0, 1, 0.07450981, 1,
-0.4788087, 0.1417533, -1.360817, 0, 1, 0.08235294, 1,
-0.4739013, -0.2672182, -3.614282, 0, 1, 0.08627451, 1,
-0.4705967, -1.345526, -3.321774, 0, 1, 0.09411765, 1,
-0.4704919, 1.302951, -1.538346, 0, 1, 0.1019608, 1,
-0.4672647, 0.4759384, -0.2741947, 0, 1, 0.1058824, 1,
-0.4670986, -0.06817158, -2.503899, 0, 1, 0.1137255, 1,
-0.4610412, 0.1711805, -1.309933, 0, 1, 0.1176471, 1,
-0.4553961, -0.1979665, -1.436388, 0, 1, 0.1254902, 1,
-0.4546549, -1.698612, -1.507661, 0, 1, 0.1294118, 1,
-0.4532421, 0.01750557, -0.203721, 0, 1, 0.1372549, 1,
-0.4417142, 0.1329836, -3.060912, 0, 1, 0.1411765, 1,
-0.4252283, -2.188578, -3.097305, 0, 1, 0.1490196, 1,
-0.4232085, 1.574307, -1.801127, 0, 1, 0.1529412, 1,
-0.4231907, 0.6112248, -0.1365997, 0, 1, 0.1607843, 1,
-0.4140377, 1.173225, -0.399506, 0, 1, 0.1647059, 1,
-0.4140061, 0.9132428, -0.8103287, 0, 1, 0.172549, 1,
-0.4097576, -1.299223, -1.515531, 0, 1, 0.1764706, 1,
-0.4046134, -0.3777333, -1.883293, 0, 1, 0.1843137, 1,
-0.4042444, 0.3859951, -0.7498431, 0, 1, 0.1882353, 1,
-0.4039187, 0.6183553, -1.923033, 0, 1, 0.1960784, 1,
-0.3911376, 0.9486717, -3.318034, 0, 1, 0.2039216, 1,
-0.3810526, -0.6778048, -2.495115, 0, 1, 0.2078431, 1,
-0.3657494, -0.3755315, -1.218066, 0, 1, 0.2156863, 1,
-0.3632891, 0.3828852, 0.6940154, 0, 1, 0.2196078, 1,
-0.3540936, -0.4079115, -0.8811489, 0, 1, 0.227451, 1,
-0.3482278, -0.2914241, -3.188579, 0, 1, 0.2313726, 1,
-0.3419456, -0.9480327, -1.505746, 0, 1, 0.2392157, 1,
-0.3397855, 0.9920005, -0.2578262, 0, 1, 0.2431373, 1,
-0.338383, -1.086643, -3.635291, 0, 1, 0.2509804, 1,
-0.3381354, 1.533334, 0.08127601, 0, 1, 0.254902, 1,
-0.3367151, -1.55207, -3.399964, 0, 1, 0.2627451, 1,
-0.3364945, 0.03638348, -0.8884354, 0, 1, 0.2666667, 1,
-0.3345962, 1.240762, 0.7792024, 0, 1, 0.2745098, 1,
-0.3345504, 2.842525, 0.1074013, 0, 1, 0.2784314, 1,
-0.3314988, -0.4221771, -1.772131, 0, 1, 0.2862745, 1,
-0.3169345, -0.3443992, -3.928282, 0, 1, 0.2901961, 1,
-0.3130364, -0.3138416, -1.990544, 0, 1, 0.2980392, 1,
-0.310472, -1.159102, -2.832473, 0, 1, 0.3058824, 1,
-0.3001818, -0.8634278, -1.767727, 0, 1, 0.3098039, 1,
-0.2990952, 0.959407, -0.9115859, 0, 1, 0.3176471, 1,
-0.2975632, -0.4183765, -4.184113, 0, 1, 0.3215686, 1,
-0.2967125, -0.8241, -2.859174, 0, 1, 0.3294118, 1,
-0.2938125, -0.7329841, -1.005757, 0, 1, 0.3333333, 1,
-0.2900342, 0.6200441, -0.02586942, 0, 1, 0.3411765, 1,
-0.2889677, 0.3770806, -0.8319932, 0, 1, 0.345098, 1,
-0.285358, -0.01313993, -2.135008, 0, 1, 0.3529412, 1,
-0.2782076, -0.8221164, -2.749592, 0, 1, 0.3568628, 1,
-0.2770007, 0.6842324, -0.03530782, 0, 1, 0.3647059, 1,
-0.274947, 0.1607721, -0.3158742, 0, 1, 0.3686275, 1,
-0.2683525, 1.475614, -0.8882393, 0, 1, 0.3764706, 1,
-0.2678806, 0.9413369, -0.09672882, 0, 1, 0.3803922, 1,
-0.2613578, -0.6151677, -1.588646, 0, 1, 0.3882353, 1,
-0.260823, -0.860949, -1.768118, 0, 1, 0.3921569, 1,
-0.2601523, 0.7794998, -2.133926, 0, 1, 0.4, 1,
-0.2597709, 0.2533964, -0.735684, 0, 1, 0.4078431, 1,
-0.252422, 0.142239, -1.868578, 0, 1, 0.4117647, 1,
-0.2494537, 1.585493, -1.584022, 0, 1, 0.4196078, 1,
-0.2462697, -1.300245, -3.174305, 0, 1, 0.4235294, 1,
-0.2416071, -2.276614, -4.349353, 0, 1, 0.4313726, 1,
-0.2409878, -1.552562, -3.538293, 0, 1, 0.4352941, 1,
-0.240284, 0.1275302, 0.3904784, 0, 1, 0.4431373, 1,
-0.2335051, 0.3437337, 1.560392, 0, 1, 0.4470588, 1,
-0.2328869, -0.007775932, -1.045102, 0, 1, 0.454902, 1,
-0.227296, 0.9595116, -2.383053, 0, 1, 0.4588235, 1,
-0.2264068, -0.5488755, -1.59751, 0, 1, 0.4666667, 1,
-0.2238236, -1.004044, -2.758186, 0, 1, 0.4705882, 1,
-0.2237668, 1.016865, -1.117047, 0, 1, 0.4784314, 1,
-0.2234799, 0.810513, -0.2099571, 0, 1, 0.4823529, 1,
-0.220955, 1.762427, 0.1500898, 0, 1, 0.4901961, 1,
-0.2194202, 0.6455925, -1.450513, 0, 1, 0.4941176, 1,
-0.2118574, -0.5909874, -2.623601, 0, 1, 0.5019608, 1,
-0.2118403, 2.205028, -0.6145245, 0, 1, 0.509804, 1,
-0.2053522, 0.8189318, -0.9990231, 0, 1, 0.5137255, 1,
-0.2009224, -0.2632538, -3.298041, 0, 1, 0.5215687, 1,
-0.1998921, -0.8277928, -0.913876, 0, 1, 0.5254902, 1,
-0.1953295, 0.1240843, -0.6855873, 0, 1, 0.5333334, 1,
-0.1948267, -1.085166, -3.626435, 0, 1, 0.5372549, 1,
-0.192857, -1.833285, -4.453504, 0, 1, 0.5450981, 1,
-0.1915998, -0.8204757, -1.753953, 0, 1, 0.5490196, 1,
-0.1910417, 1.760142, 0.2926614, 0, 1, 0.5568628, 1,
-0.1875292, -0.5572211, -2.070729, 0, 1, 0.5607843, 1,
-0.1841084, 0.8926257, -0.4940991, 0, 1, 0.5686275, 1,
-0.1805204, -1.689916, -3.328106, 0, 1, 0.572549, 1,
-0.17943, 0.133079, -1.120795, 0, 1, 0.5803922, 1,
-0.1787825, -1.315716, -2.290812, 0, 1, 0.5843138, 1,
-0.1763259, -0.4512912, -1.829733, 0, 1, 0.5921569, 1,
-0.1624264, -1.763672, -1.310347, 0, 1, 0.5960785, 1,
-0.1610832, 2.663832, 0.2131733, 0, 1, 0.6039216, 1,
-0.1575102, -0.6544808, -3.059902, 0, 1, 0.6117647, 1,
-0.1543386, 1.909305, -1.332747, 0, 1, 0.6156863, 1,
-0.150736, 0.8540429, -0.02970979, 0, 1, 0.6235294, 1,
-0.1499936, 0.5381253, 0.8692968, 0, 1, 0.627451, 1,
-0.141949, 0.6034993, -1.279874, 0, 1, 0.6352941, 1,
-0.1386004, 0.2040918, -3.100075, 0, 1, 0.6392157, 1,
-0.136539, 0.5035815, 1.111987, 0, 1, 0.6470588, 1,
-0.1343726, 0.5338761, -1.069706, 0, 1, 0.6509804, 1,
-0.1340227, -1.530789, -2.800709, 0, 1, 0.6588235, 1,
-0.1323255, 0.06327556, -1.708864, 0, 1, 0.6627451, 1,
-0.1320914, 0.4087394, -1.298012, 0, 1, 0.6705883, 1,
-0.1280527, -1.780027, -1.928614, 0, 1, 0.6745098, 1,
-0.1227921, 0.4578619, -1.193856, 0, 1, 0.682353, 1,
-0.1106108, -1.598339, -5.473062, 0, 1, 0.6862745, 1,
-0.1060633, 1.390969, -0.3658586, 0, 1, 0.6941177, 1,
-0.1036937, 0.05410333, -1.265412, 0, 1, 0.7019608, 1,
-0.1007633, 0.3189536, 1.017432, 0, 1, 0.7058824, 1,
-0.09659483, 1.429773, -0.4588655, 0, 1, 0.7137255, 1,
-0.09380695, 0.7481066, -0.9791684, 0, 1, 0.7176471, 1,
-0.08948886, -0.3189663, -2.63903, 0, 1, 0.7254902, 1,
-0.08823396, -0.6887189, -3.606007, 0, 1, 0.7294118, 1,
-0.08236273, 1.424614, -0.9567757, 0, 1, 0.7372549, 1,
-0.08118611, 0.1655477, 1.250049, 0, 1, 0.7411765, 1,
-0.07384257, -0.4241246, -5.100394, 0, 1, 0.7490196, 1,
-0.07035825, -2.893554, -1.531829, 0, 1, 0.7529412, 1,
-0.06877241, 0.2887743, 1.022657, 0, 1, 0.7607843, 1,
-0.06610028, -1.671907, -2.778544, 0, 1, 0.7647059, 1,
-0.06549433, 0.2363388, -0.03033142, 0, 1, 0.772549, 1,
-0.06419284, 0.769956, 1.478707, 0, 1, 0.7764706, 1,
-0.06229511, 1.094205, 0.63227, 0, 1, 0.7843137, 1,
-0.06204154, -0.4903952, -3.445458, 0, 1, 0.7882353, 1,
-0.06111742, -0.5980353, -2.688316, 0, 1, 0.7960784, 1,
-0.05723225, -0.4045865, -2.080913, 0, 1, 0.8039216, 1,
-0.05458566, -0.2694108, -3.764477, 0, 1, 0.8078431, 1,
-0.0526827, 0.4035941, 0.919322, 0, 1, 0.8156863, 1,
-0.05167985, 0.9238724, 0.2643568, 0, 1, 0.8196079, 1,
-0.04836112, 0.2323421, -0.8876607, 0, 1, 0.827451, 1,
-0.0479453, -0.9668469, -0.368028, 0, 1, 0.8313726, 1,
-0.04506552, -0.452824, -2.214737, 0, 1, 0.8392157, 1,
-0.03950878, -0.1589191, -1.798283, 0, 1, 0.8431373, 1,
-0.03582812, -0.6467323, -2.163166, 0, 1, 0.8509804, 1,
-0.02810217, 0.9536931, -0.666683, 0, 1, 0.854902, 1,
-0.02745063, -0.2765709, -3.011976, 0, 1, 0.8627451, 1,
-0.02701952, 0.541819, -1.795259, 0, 1, 0.8666667, 1,
-0.02533627, 0.5432813, 1.220536, 0, 1, 0.8745098, 1,
-0.0227018, -0.3534525, -1.989478, 0, 1, 0.8784314, 1,
-0.02077043, -0.2620629, -4.820394, 0, 1, 0.8862745, 1,
-0.01810321, 2.10377, -0.4295577, 0, 1, 0.8901961, 1,
-0.01596062, -0.0368208, -2.304654, 0, 1, 0.8980392, 1,
-0.01117325, 1.243774, 0.1241295, 0, 1, 0.9058824, 1,
-0.007917354, 0.2996511, -0.08959466, 0, 1, 0.9098039, 1,
-0.006875326, 0.8623254, -1.39141, 0, 1, 0.9176471, 1,
-0.006292036, -2.17549, -3.176835, 0, 1, 0.9215686, 1,
-0.004140913, 0.5256397, 0.6552919, 0, 1, 0.9294118, 1,
-0.001717807, 1.107148, 0.7485725, 0, 1, 0.9333333, 1,
-0.001068935, -0.9187199, -2.911386, 0, 1, 0.9411765, 1,
0.009441036, 0.5036969, -1.045807, 0, 1, 0.945098, 1,
0.01037004, -0.820924, 3.969256, 0, 1, 0.9529412, 1,
0.01243007, -1.913886, 1.465452, 0, 1, 0.9568627, 1,
0.01256262, 0.3584205, 0.1756821, 0, 1, 0.9647059, 1,
0.01408681, -0.3504146, 3.679463, 0, 1, 0.9686275, 1,
0.01634207, 0.2579583, 0.01858638, 0, 1, 0.9764706, 1,
0.01737386, -0.2626672, 3.135144, 0, 1, 0.9803922, 1,
0.02453552, -0.1904288, 4.237569, 0, 1, 0.9882353, 1,
0.02501097, 1.363989, 0.9134398, 0, 1, 0.9921569, 1,
0.03840671, -1.345808, 5.098091, 0, 1, 1, 1,
0.03912318, 0.6472998, -0.09070898, 0, 0.9921569, 1, 1,
0.03962677, 0.4343277, 0.7543766, 0, 0.9882353, 1, 1,
0.04267623, -1.095599, 3.544082, 0, 0.9803922, 1, 1,
0.04489237, -0.3467475, 2.739976, 0, 0.9764706, 1, 1,
0.04737007, 1.319112, 0.4158737, 0, 0.9686275, 1, 1,
0.04876123, -0.7493426, 3.343649, 0, 0.9647059, 1, 1,
0.05059159, -1.563166, 3.399973, 0, 0.9568627, 1, 1,
0.05153237, -0.1281266, 3.468825, 0, 0.9529412, 1, 1,
0.05273142, 0.1451161, -0.01353948, 0, 0.945098, 1, 1,
0.05290692, 0.6606539, -0.6581917, 0, 0.9411765, 1, 1,
0.05362806, -0.9499523, 4.605837, 0, 0.9333333, 1, 1,
0.06192329, 0.1289409, -0.06394067, 0, 0.9294118, 1, 1,
0.06918691, -1.697566, 1.363518, 0, 0.9215686, 1, 1,
0.07208622, -0.08998676, 0.275102, 0, 0.9176471, 1, 1,
0.07785383, -0.8307038, 2.61737, 0, 0.9098039, 1, 1,
0.07822245, -1.304474, 3.388655, 0, 0.9058824, 1, 1,
0.08192275, -1.946946, 2.256618, 0, 0.8980392, 1, 1,
0.08303875, -0.4719337, 3.643711, 0, 0.8901961, 1, 1,
0.08376905, 1.131202, 1.580795, 0, 0.8862745, 1, 1,
0.08433599, -0.4143206, 1.32961, 0, 0.8784314, 1, 1,
0.08613971, 0.5130255, -0.1930588, 0, 0.8745098, 1, 1,
0.08749802, 2.361297, -0.6443609, 0, 0.8666667, 1, 1,
0.08773708, 1.670116, -0.9710461, 0, 0.8627451, 1, 1,
0.08829411, 0.1697433, -0.8037196, 0, 0.854902, 1, 1,
0.09124474, 0.5205247, 0.725768, 0, 0.8509804, 1, 1,
0.09156812, 0.04980711, 1.866692, 0, 0.8431373, 1, 1,
0.09330602, 0.6884449, 0.566537, 0, 0.8392157, 1, 1,
0.09536535, -0.4285076, 3.36751, 0, 0.8313726, 1, 1,
0.102138, 1.253109, 1.004651, 0, 0.827451, 1, 1,
0.1030211, 0.3241586, 2.195735, 0, 0.8196079, 1, 1,
0.1073597, 0.2161503, 1.547619, 0, 0.8156863, 1, 1,
0.1078487, 0.6576239, 1.353859, 0, 0.8078431, 1, 1,
0.1243693, -0.3532361, 3.406672, 0, 0.8039216, 1, 1,
0.1254768, -1.023561, 3.129674, 0, 0.7960784, 1, 1,
0.1259787, 0.1069027, 2.27439, 0, 0.7882353, 1, 1,
0.1300193, 0.1059298, 0.4921032, 0, 0.7843137, 1, 1,
0.1312561, 0.8064309, -1.197396, 0, 0.7764706, 1, 1,
0.1320356, -0.3371924, 3.214784, 0, 0.772549, 1, 1,
0.1331394, -0.1589603, 2.094532, 0, 0.7647059, 1, 1,
0.1405385, 0.8716019, 1.351717, 0, 0.7607843, 1, 1,
0.1424051, -0.2402944, 4.417815, 0, 0.7529412, 1, 1,
0.143462, -0.4943765, 3.273887, 0, 0.7490196, 1, 1,
0.1442892, 1.687651, 0.7162207, 0, 0.7411765, 1, 1,
0.1469084, -0.2441367, 2.71868, 0, 0.7372549, 1, 1,
0.1500804, 0.06421725, 1.013112, 0, 0.7294118, 1, 1,
0.1542427, 0.6188065, -2.27752, 0, 0.7254902, 1, 1,
0.1545967, 0.2668946, 0.1111341, 0, 0.7176471, 1, 1,
0.1564934, -1.086717, 1.692838, 0, 0.7137255, 1, 1,
0.1570236, -0.1598956, 0.5351394, 0, 0.7058824, 1, 1,
0.1571392, -1.224338, 3.608525, 0, 0.6980392, 1, 1,
0.1596525, -1.73405, 3.58665, 0, 0.6941177, 1, 1,
0.160061, -1.393458, 3.870105, 0, 0.6862745, 1, 1,
0.1603882, 0.07045694, 1.327983, 0, 0.682353, 1, 1,
0.1687135, -0.5024595, 5.263458, 0, 0.6745098, 1, 1,
0.1692454, -1.25321, 2.050279, 0, 0.6705883, 1, 1,
0.1697863, 0.1159033, 1.183114, 0, 0.6627451, 1, 1,
0.1743745, -2.043375, 4.336801, 0, 0.6588235, 1, 1,
0.1747629, -0.1433685, 0.8468353, 0, 0.6509804, 1, 1,
0.1760626, -0.1009515, 2.645899, 0, 0.6470588, 1, 1,
0.1765166, 1.507364, -0.04404034, 0, 0.6392157, 1, 1,
0.1810163, -1.632342, 3.658846, 0, 0.6352941, 1, 1,
0.1815986, 0.23276, -1.439942, 0, 0.627451, 1, 1,
0.183648, 0.632432, -1.623812, 0, 0.6235294, 1, 1,
0.1843847, 0.1137181, 1.378596, 0, 0.6156863, 1, 1,
0.1874657, 0.6401196, -0.2686587, 0, 0.6117647, 1, 1,
0.189077, -1.1522, 2.334902, 0, 0.6039216, 1, 1,
0.1927122, -0.1891481, 1.720189, 0, 0.5960785, 1, 1,
0.1960439, 0.1848504, 2.421955, 0, 0.5921569, 1, 1,
0.1993368, -1.698373, 2.798934, 0, 0.5843138, 1, 1,
0.1998783, -0.09032989, 2.888498, 0, 0.5803922, 1, 1,
0.2004196, 1.490016, -0.2390025, 0, 0.572549, 1, 1,
0.2004541, -0.378135, 2.850275, 0, 0.5686275, 1, 1,
0.201188, -0.7777058, 2.753725, 0, 0.5607843, 1, 1,
0.2114414, 0.7148407, 0.3433174, 0, 0.5568628, 1, 1,
0.213858, 1.171338, -0.5604787, 0, 0.5490196, 1, 1,
0.2160204, -0.3662264, 0.8477088, 0, 0.5450981, 1, 1,
0.2172758, 1.832291, 0.8672289, 0, 0.5372549, 1, 1,
0.2193269, 1.509546, -0.8489532, 0, 0.5333334, 1, 1,
0.219859, 0.09663412, 1.276418, 0, 0.5254902, 1, 1,
0.2208547, 0.1878072, 2.049389, 0, 0.5215687, 1, 1,
0.2220151, -0.4308397, 2.648129, 0, 0.5137255, 1, 1,
0.2239751, -0.1976259, 2.507931, 0, 0.509804, 1, 1,
0.2266608, 0.7926295, 0.573142, 0, 0.5019608, 1, 1,
0.2267723, -1.710154, 2.852917, 0, 0.4941176, 1, 1,
0.2280114, 0.2577405, -0.9270932, 0, 0.4901961, 1, 1,
0.2296394, 0.5001768, 2.216023, 0, 0.4823529, 1, 1,
0.2327936, -0.4573261, 2.659583, 0, 0.4784314, 1, 1,
0.2343165, -0.2971994, 2.986248, 0, 0.4705882, 1, 1,
0.2350291, -1.200822, 3.150642, 0, 0.4666667, 1, 1,
0.2377024, -0.5701756, 4.060723, 0, 0.4588235, 1, 1,
0.2399666, -0.1754871, 1.988605, 0, 0.454902, 1, 1,
0.2431002, -1.137444, 2.109822, 0, 0.4470588, 1, 1,
0.2471609, -0.4080309, 1.908335, 0, 0.4431373, 1, 1,
0.2545723, 0.7415287, 2.655901, 0, 0.4352941, 1, 1,
0.2548751, -0.9610218, 1.625561, 0, 0.4313726, 1, 1,
0.2549844, -0.5039611, 3.718285, 0, 0.4235294, 1, 1,
0.2556595, -0.9360219, 1.697282, 0, 0.4196078, 1, 1,
0.2679115, -1.099448, 2.281137, 0, 0.4117647, 1, 1,
0.2683928, -0.6036071, 2.213299, 0, 0.4078431, 1, 1,
0.2692795, 0.296154, 0.2740636, 0, 0.4, 1, 1,
0.2775188, -0.7002015, 1.991092, 0, 0.3921569, 1, 1,
0.279258, -1.36077, 2.306318, 0, 0.3882353, 1, 1,
0.2797881, 0.1528499, 0.767822, 0, 0.3803922, 1, 1,
0.2808059, -0.529008, 2.729463, 0, 0.3764706, 1, 1,
0.2838223, 0.6498907, 1.167855, 0, 0.3686275, 1, 1,
0.2857409, -0.259622, 4.297142, 0, 0.3647059, 1, 1,
0.2863947, 2.031257, 0.1551818, 0, 0.3568628, 1, 1,
0.2893681, 0.6077753, 1.549685, 0, 0.3529412, 1, 1,
0.2897579, -0.8383313, 5.61553, 0, 0.345098, 1, 1,
0.2904337, 0.2290339, -0.5019453, 0, 0.3411765, 1, 1,
0.2912118, -1.642969, 3.72601, 0, 0.3333333, 1, 1,
0.2917902, 0.8729326, 1.464569, 0, 0.3294118, 1, 1,
0.2934735, 1.250146, 0.9291854, 0, 0.3215686, 1, 1,
0.2936999, -0.7216707, 2.959353, 0, 0.3176471, 1, 1,
0.3002509, -1.515619, 2.575406, 0, 0.3098039, 1, 1,
0.3035496, -0.4892632, 2.364007, 0, 0.3058824, 1, 1,
0.3039618, -0.7607974, 2.218697, 0, 0.2980392, 1, 1,
0.3092186, 0.8755635, 1.158721, 0, 0.2901961, 1, 1,
0.3129865, -0.6919841, 2.638523, 0, 0.2862745, 1, 1,
0.3163946, -0.1014263, 2.457719, 0, 0.2784314, 1, 1,
0.3228397, 0.3559392, 0.1098834, 0, 0.2745098, 1, 1,
0.3235566, -0.5584782, 4.726365, 0, 0.2666667, 1, 1,
0.3241174, 0.8079721, 1.322801, 0, 0.2627451, 1, 1,
0.3288305, -1.034622, 2.569594, 0, 0.254902, 1, 1,
0.3296571, -0.6086842, 2.346617, 0, 0.2509804, 1, 1,
0.3333044, 1.144586, 2.018096, 0, 0.2431373, 1, 1,
0.3336927, 0.2815897, 0.432191, 0, 0.2392157, 1, 1,
0.338868, 0.9489454, -0.05627772, 0, 0.2313726, 1, 1,
0.3412431, -0.249062, 1.012313, 0, 0.227451, 1, 1,
0.3426086, -0.2454057, 2.244395, 0, 0.2196078, 1, 1,
0.3440229, 0.6692154, 1.56668, 0, 0.2156863, 1, 1,
0.3469793, -0.3014138, 2.781162, 0, 0.2078431, 1, 1,
0.3472104, 0.4206974, 1.338973, 0, 0.2039216, 1, 1,
0.3503015, -0.1485786, 1.28056, 0, 0.1960784, 1, 1,
0.3508739, 1.090456, -0.2303044, 0, 0.1882353, 1, 1,
0.3598559, -0.1272568, -0.2038144, 0, 0.1843137, 1, 1,
0.3601161, 1.057192, 0.7955338, 0, 0.1764706, 1, 1,
0.3656297, -1.186217, 3.110777, 0, 0.172549, 1, 1,
0.3702507, 1.393131, 0.5784802, 0, 0.1647059, 1, 1,
0.3813674, -0.3493413, 2.638054, 0, 0.1607843, 1, 1,
0.3831289, -2.497302, 1.966094, 0, 0.1529412, 1, 1,
0.3847381, -0.2949037, 2.71713, 0, 0.1490196, 1, 1,
0.3857396, 0.1752284, 1.866035, 0, 0.1411765, 1, 1,
0.3909848, 0.08474839, 2.439737, 0, 0.1372549, 1, 1,
0.3994507, -1.383915, 2.626462, 0, 0.1294118, 1, 1,
0.4000681, 0.01073207, 0.07878953, 0, 0.1254902, 1, 1,
0.4031631, -0.5852813, 2.232971, 0, 0.1176471, 1, 1,
0.4047141, 0.3979052, 0.7141985, 0, 0.1137255, 1, 1,
0.4049204, 1.353901, 1.572136, 0, 0.1058824, 1, 1,
0.4053231, 1.562067, 0.5325722, 0, 0.09803922, 1, 1,
0.411244, 0.2179917, -1.09294, 0, 0.09411765, 1, 1,
0.4143095, -1.141517, 3.17886, 0, 0.08627451, 1, 1,
0.4153122, -1.315678, 3.201153, 0, 0.08235294, 1, 1,
0.4306657, -0.8171825, 3.303025, 0, 0.07450981, 1, 1,
0.4322559, -1.68819, 2.268043, 0, 0.07058824, 1, 1,
0.4379053, -0.77625, 2.94368, 0, 0.0627451, 1, 1,
0.4401951, 1.740494, -1.101522, 0, 0.05882353, 1, 1,
0.4411497, 2.509029, 0.1332349, 0, 0.05098039, 1, 1,
0.4419181, -0.2634846, 1.537401, 0, 0.04705882, 1, 1,
0.444636, -0.03335585, 3.085305, 0, 0.03921569, 1, 1,
0.4446906, 0.188771, 1.562284, 0, 0.03529412, 1, 1,
0.4454534, -1.188179, 2.527408, 0, 0.02745098, 1, 1,
0.4474997, 0.6923771, 0.5944878, 0, 0.02352941, 1, 1,
0.4483703, 0.4980656, 0.0704629, 0, 0.01568628, 1, 1,
0.4553986, -0.7035551, 1.521623, 0, 0.01176471, 1, 1,
0.4568149, 0.1027924, 0.6022685, 0, 0.003921569, 1, 1,
0.4586819, -1.339139, 0.8755003, 0.003921569, 0, 1, 1,
0.4600144, 0.6788381, 1.205941, 0.007843138, 0, 1, 1,
0.4600688, 0.8001474, -1.008661, 0.01568628, 0, 1, 1,
0.4607851, -0.3259974, 0.5059226, 0.01960784, 0, 1, 1,
0.4693793, 0.1904166, -0.3909163, 0.02745098, 0, 1, 1,
0.4769243, -0.3347682, 2.208731, 0.03137255, 0, 1, 1,
0.482711, 0.4528965, 1.706467, 0.03921569, 0, 1, 1,
0.4846441, -0.7166782, 3.589256, 0.04313726, 0, 1, 1,
0.4879546, 0.7750368, 0.9609022, 0.05098039, 0, 1, 1,
0.4894571, 0.03284281, 2.289553, 0.05490196, 0, 1, 1,
0.4898228, 1.115982, -0.2148417, 0.0627451, 0, 1, 1,
0.4911781, -1.380814, 1.994886, 0.06666667, 0, 1, 1,
0.4915923, 0.9211806, -0.5516667, 0.07450981, 0, 1, 1,
0.507417, 1.411725, -0.1990467, 0.07843138, 0, 1, 1,
0.5144153, -0.8727511, 3.038174, 0.08627451, 0, 1, 1,
0.517289, -0.1249087, 1.427688, 0.09019608, 0, 1, 1,
0.5218708, -0.7383432, 2.109445, 0.09803922, 0, 1, 1,
0.5318905, 0.451819, 0.4531002, 0.1058824, 0, 1, 1,
0.5320618, 0.1025188, 1.583089, 0.1098039, 0, 1, 1,
0.5321319, -0.1011113, 3.504672, 0.1176471, 0, 1, 1,
0.5364793, 0.1811345, -0.1837319, 0.1215686, 0, 1, 1,
0.5372498, 1.805403, -2.102397, 0.1294118, 0, 1, 1,
0.5411562, -0.2909251, 3.190057, 0.1333333, 0, 1, 1,
0.5470085, 0.6422809, 0.7286899, 0.1411765, 0, 1, 1,
0.5478106, -0.884839, 2.121953, 0.145098, 0, 1, 1,
0.5495379, 1.165887, 1.301267, 0.1529412, 0, 1, 1,
0.5518048, 0.5966376, 0.881435, 0.1568628, 0, 1, 1,
0.5561947, 0.3718913, 1.54494, 0.1647059, 0, 1, 1,
0.5593285, -0.8114005, 2.961387, 0.1686275, 0, 1, 1,
0.5610079, 0.7241366, 1.302497, 0.1764706, 0, 1, 1,
0.5610324, 0.7348682, -0.8061761, 0.1803922, 0, 1, 1,
0.5633688, -2.51506, 2.581923, 0.1882353, 0, 1, 1,
0.5640844, 1.197866, 0.6287446, 0.1921569, 0, 1, 1,
0.5674167, -2.098048, 3.627673, 0.2, 0, 1, 1,
0.571961, 0.4813552, 0.7488737, 0.2078431, 0, 1, 1,
0.5725802, 1.913341, -0.4599339, 0.2117647, 0, 1, 1,
0.5766755, 0.202903, 2.270409, 0.2196078, 0, 1, 1,
0.5786153, -0.1802849, 2.954543, 0.2235294, 0, 1, 1,
0.5796584, -1.525048, 2.459834, 0.2313726, 0, 1, 1,
0.5809112, -1.834538, 3.999047, 0.2352941, 0, 1, 1,
0.5856048, -0.1297335, 1.660905, 0.2431373, 0, 1, 1,
0.5880999, -1.645317, 4.154974, 0.2470588, 0, 1, 1,
0.5890594, 0.3054445, 3.793828, 0.254902, 0, 1, 1,
0.5894809, -1.362647, 2.52542, 0.2588235, 0, 1, 1,
0.5940936, -1.340869, 0.6911372, 0.2666667, 0, 1, 1,
0.5957484, -0.5801519, 2.635169, 0.2705882, 0, 1, 1,
0.5972999, -0.1410015, 2.699849, 0.2784314, 0, 1, 1,
0.5984259, 1.811643, 0.2420091, 0.282353, 0, 1, 1,
0.5990211, 1.377858, 0.3492297, 0.2901961, 0, 1, 1,
0.6038991, -1.02761, 4.241229, 0.2941177, 0, 1, 1,
0.6039874, 0.2886223, 2.120752, 0.3019608, 0, 1, 1,
0.6042451, -0.032597, 0.5837185, 0.3098039, 0, 1, 1,
0.608126, -0.7194555, 1.463139, 0.3137255, 0, 1, 1,
0.6091897, 0.2578414, 0.691954, 0.3215686, 0, 1, 1,
0.6099602, 0.06887064, 0.006589877, 0.3254902, 0, 1, 1,
0.6113698, -0.4593955, 1.336675, 0.3333333, 0, 1, 1,
0.6118615, -0.8700597, 3.239055, 0.3372549, 0, 1, 1,
0.6118936, 0.3866915, 0.1332584, 0.345098, 0, 1, 1,
0.614649, 0.2496194, 1.162659, 0.3490196, 0, 1, 1,
0.616455, 0.2468726, -1.524477, 0.3568628, 0, 1, 1,
0.6178305, 0.7867106, 1.470424, 0.3607843, 0, 1, 1,
0.6240136, 0.371089, -0.08864879, 0.3686275, 0, 1, 1,
0.6254444, -0.7864965, 1.911747, 0.372549, 0, 1, 1,
0.6269763, 2.370404, -0.2569943, 0.3803922, 0, 1, 1,
0.6306049, -0.4763608, 1.633176, 0.3843137, 0, 1, 1,
0.6431146, -0.4396035, 3.50972, 0.3921569, 0, 1, 1,
0.6448846, 0.862809, 0.592208, 0.3960784, 0, 1, 1,
0.6498821, -0.3232434, 1.304583, 0.4039216, 0, 1, 1,
0.6536159, -0.9278947, 0.9901164, 0.4117647, 0, 1, 1,
0.6608277, 1.131491, 1.824007, 0.4156863, 0, 1, 1,
0.6624804, -1.757538, 1.660396, 0.4235294, 0, 1, 1,
0.6629307, 0.2009846, 2.021794, 0.427451, 0, 1, 1,
0.6684577, -1.615961, 2.065195, 0.4352941, 0, 1, 1,
0.6690332, 0.5607551, 2.328162, 0.4392157, 0, 1, 1,
0.6738484, -1.782637, 1.10471, 0.4470588, 0, 1, 1,
0.6788323, -1.901097, 3.713199, 0.4509804, 0, 1, 1,
0.6792589, 0.142047, 1.561541, 0.4588235, 0, 1, 1,
0.680518, 0.5680833, 3.625882, 0.4627451, 0, 1, 1,
0.6841909, -0.1205495, 1.213326, 0.4705882, 0, 1, 1,
0.6885273, -0.4632271, 0.6639432, 0.4745098, 0, 1, 1,
0.6970442, -0.4286596, 1.326756, 0.4823529, 0, 1, 1,
0.6989715, 1.417344, 0.7079668, 0.4862745, 0, 1, 1,
0.7047704, 1.330694, 0.4287719, 0.4941176, 0, 1, 1,
0.7062672, 0.2438133, 0.9808956, 0.5019608, 0, 1, 1,
0.7084737, -0.7764508, 2.302572, 0.5058824, 0, 1, 1,
0.7227921, -1.589168, 2.041897, 0.5137255, 0, 1, 1,
0.7234548, 0.7491733, 0.3425666, 0.5176471, 0, 1, 1,
0.7258442, -0.7788466, -0.1834869, 0.5254902, 0, 1, 1,
0.7268573, -0.3190383, 1.103014, 0.5294118, 0, 1, 1,
0.7280197, -0.614517, 2.516261, 0.5372549, 0, 1, 1,
0.7290162, -0.001713645, 1.592965, 0.5411765, 0, 1, 1,
0.7385312, -0.8342633, 3.84534, 0.5490196, 0, 1, 1,
0.7401252, 0.1063452, -1.363184, 0.5529412, 0, 1, 1,
0.7420447, 1.081974, 0.9196807, 0.5607843, 0, 1, 1,
0.7483135, -0.09927566, 1.822235, 0.5647059, 0, 1, 1,
0.7525703, -1.667823, 1.769237, 0.572549, 0, 1, 1,
0.7533212, 0.1165911, 2.169856, 0.5764706, 0, 1, 1,
0.7583142, -0.02659859, 3.171524, 0.5843138, 0, 1, 1,
0.7606257, 1.378653, -0.5219506, 0.5882353, 0, 1, 1,
0.7620056, -0.3887659, 1.210899, 0.5960785, 0, 1, 1,
0.7761092, -1.609031, 3.631446, 0.6039216, 0, 1, 1,
0.786102, 0.2765877, 2.911805, 0.6078432, 0, 1, 1,
0.7864909, -1.542261, 2.243792, 0.6156863, 0, 1, 1,
0.7899165, -1.697399, 2.70298, 0.6196079, 0, 1, 1,
0.7925242, -1.020911, 1.349913, 0.627451, 0, 1, 1,
0.7930546, 0.4001511, 1.854374, 0.6313726, 0, 1, 1,
0.7961807, 0.7770656, 1.109994, 0.6392157, 0, 1, 1,
0.7969236, -0.5326254, 2.314452, 0.6431373, 0, 1, 1,
0.8012508, 1.66105, -1.588177, 0.6509804, 0, 1, 1,
0.8025217, -0.1439317, 1.838601, 0.654902, 0, 1, 1,
0.8033216, -0.7481348, 3.738176, 0.6627451, 0, 1, 1,
0.8074635, 0.3291693, 0.7838121, 0.6666667, 0, 1, 1,
0.8098537, -1.877361, 3.064525, 0.6745098, 0, 1, 1,
0.8105003, -0.4755526, 3.590995, 0.6784314, 0, 1, 1,
0.8123714, 0.3887305, 2.064602, 0.6862745, 0, 1, 1,
0.8141131, 1.795276, -2.132968, 0.6901961, 0, 1, 1,
0.8143086, 0.8257023, -0.1099176, 0.6980392, 0, 1, 1,
0.8149721, 1.635762, 2.04493, 0.7058824, 0, 1, 1,
0.820989, -1.954562, 1.272062, 0.7098039, 0, 1, 1,
0.8279981, -2.160475, 3.211339, 0.7176471, 0, 1, 1,
0.8311847, 0.7826217, 2.099666, 0.7215686, 0, 1, 1,
0.8419034, 0.9297708, 0.8602117, 0.7294118, 0, 1, 1,
0.8509203, -1.235343, 5.048596, 0.7333333, 0, 1, 1,
0.8534464, 1.055849, 1.474472, 0.7411765, 0, 1, 1,
0.858862, 0.9947057, 0.06637813, 0.7450981, 0, 1, 1,
0.8665863, 1.645083, 2.231, 0.7529412, 0, 1, 1,
0.8666244, 0.8209366, 1.166448, 0.7568628, 0, 1, 1,
0.8696582, -0.662266, 2.549861, 0.7647059, 0, 1, 1,
0.869804, -0.8017718, 1.326042, 0.7686275, 0, 1, 1,
0.8795241, 1.11468, 0.2537994, 0.7764706, 0, 1, 1,
0.880071, -1.588082, 1.726835, 0.7803922, 0, 1, 1,
0.8810279, -0.4575704, 2.69217, 0.7882353, 0, 1, 1,
0.8815523, -0.6603352, 2.734363, 0.7921569, 0, 1, 1,
0.8817666, -0.3675413, 1.042186, 0.8, 0, 1, 1,
0.8831221, 1.135683, -0.8719553, 0.8078431, 0, 1, 1,
0.8831742, 0.08503643, -0.1227008, 0.8117647, 0, 1, 1,
0.8895485, 0.0009669209, 0.5004423, 0.8196079, 0, 1, 1,
0.8945249, 0.2495896, 1.087608, 0.8235294, 0, 1, 1,
0.8961943, -0.687731, 4.392817, 0.8313726, 0, 1, 1,
0.9025121, -0.6858587, 1.762095, 0.8352941, 0, 1, 1,
0.9035442, -1.533787, 1.393357, 0.8431373, 0, 1, 1,
0.9093999, 0.8059282, 2.997059, 0.8470588, 0, 1, 1,
0.9133289, -2.457765, 2.286209, 0.854902, 0, 1, 1,
0.9158048, -0.5142334, 1.304114, 0.8588235, 0, 1, 1,
0.9164386, 0.9588072, 0.9236404, 0.8666667, 0, 1, 1,
0.9167485, 1.202937, 1.774245, 0.8705882, 0, 1, 1,
0.9238883, -1.413812, 2.988647, 0.8784314, 0, 1, 1,
0.9304649, 0.387235, 1.294101, 0.8823529, 0, 1, 1,
0.9356036, -0.926569, 0.7800195, 0.8901961, 0, 1, 1,
0.9426314, -0.2651292, 1.810232, 0.8941177, 0, 1, 1,
0.9483632, -0.2207686, 3.376062, 0.9019608, 0, 1, 1,
0.9498033, -0.0883179, 1.094168, 0.9098039, 0, 1, 1,
0.9531351, -0.6381953, 1.657858, 0.9137255, 0, 1, 1,
0.9552521, 1.522333, 0.7329738, 0.9215686, 0, 1, 1,
0.9554998, 0.1984027, 0.4251903, 0.9254902, 0, 1, 1,
0.9650335, 0.1258616, -1.260203, 0.9333333, 0, 1, 1,
0.9670147, -0.8698308, 3.450886, 0.9372549, 0, 1, 1,
0.968928, 1.302394, 0.6107566, 0.945098, 0, 1, 1,
0.9725441, 0.403044, 0.8928823, 0.9490196, 0, 1, 1,
0.9743102, 1.159369, 2.393518, 0.9568627, 0, 1, 1,
0.9746053, -2.33838, 4.314637, 0.9607843, 0, 1, 1,
0.9755222, 1.231862, 1.498813, 0.9686275, 0, 1, 1,
0.9763631, 1.743777, 0.2669808, 0.972549, 0, 1, 1,
0.9874332, 0.5421849, 0.7870998, 0.9803922, 0, 1, 1,
0.9891407, -2.075058, 2.731558, 0.9843137, 0, 1, 1,
0.994786, 0.5966711, 1.868566, 0.9921569, 0, 1, 1,
0.9951024, 0.9367954, 1.52858, 0.9960784, 0, 1, 1,
0.9988733, -0.4495129, 2.552291, 1, 0, 0.9960784, 1,
1.000283, 0.6730936, 1.400984, 1, 0, 0.9882353, 1,
1.001688, 0.3263813, -0.5895754, 1, 0, 0.9843137, 1,
1.002087, 0.9984112, 1.479966, 1, 0, 0.9764706, 1,
1.006414, -1.232977, 2.573504, 1, 0, 0.972549, 1,
1.00948, 2.941129, -0.4553462, 1, 0, 0.9647059, 1,
1.025563, 0.5264003, 2.11057, 1, 0, 0.9607843, 1,
1.029526, -0.4568188, 0.1464335, 1, 0, 0.9529412, 1,
1.031378, -0.54514, 1.237059, 1, 0, 0.9490196, 1,
1.031806, -2.036746, 0.9832777, 1, 0, 0.9411765, 1,
1.039213, 0.4187755, 0.6989061, 1, 0, 0.9372549, 1,
1.0422, 0.639528, 2.415943, 1, 0, 0.9294118, 1,
1.04731, -1.613805, 3.685746, 1, 0, 0.9254902, 1,
1.051133, 0.190155, 0.8806508, 1, 0, 0.9176471, 1,
1.061649, -0.09300407, 3.276193, 1, 0, 0.9137255, 1,
1.067199, 0.6620201, -0.1290679, 1, 0, 0.9058824, 1,
1.070315, 0.3267018, 0.4510631, 1, 0, 0.9019608, 1,
1.074565, 0.8584538, -0.1342491, 1, 0, 0.8941177, 1,
1.075489, 1.544792, 1.524954, 1, 0, 0.8862745, 1,
1.079486, -1.100743, 3.773127, 1, 0, 0.8823529, 1,
1.086118, -2.15219, 4.175699, 1, 0, 0.8745098, 1,
1.09079, -1.388792, 2.001743, 1, 0, 0.8705882, 1,
1.090854, 0.6254927, 1.442041, 1, 0, 0.8627451, 1,
1.098323, 0.8727016, 2.423201, 1, 0, 0.8588235, 1,
1.10924, -0.6106799, 0.2870764, 1, 0, 0.8509804, 1,
1.117845, 0.7947905, 3.317123, 1, 0, 0.8470588, 1,
1.121464, 0.5218742, 0.8506916, 1, 0, 0.8392157, 1,
1.123797, 1.303656, 1.992505, 1, 0, 0.8352941, 1,
1.125986, 0.9262047, -0.05662046, 1, 0, 0.827451, 1,
1.129512, 0.2491004, 2.487784, 1, 0, 0.8235294, 1,
1.141361, -2.035599, 2.239964, 1, 0, 0.8156863, 1,
1.143505, -0.6663539, 2.221283, 1, 0, 0.8117647, 1,
1.143884, 1.188504, 1.941622, 1, 0, 0.8039216, 1,
1.152047, -1.143474, 1.337396, 1, 0, 0.7960784, 1,
1.157931, 0.6355109, 1.768491, 1, 0, 0.7921569, 1,
1.161785, 0.2573723, 0.32697, 1, 0, 0.7843137, 1,
1.162216, 0.579168, 0.8146402, 1, 0, 0.7803922, 1,
1.163531, -1.986788, 2.282901, 1, 0, 0.772549, 1,
1.168872, -0.4641754, 2.455709, 1, 0, 0.7686275, 1,
1.170133, 0.04050254, 1.224426, 1, 0, 0.7607843, 1,
1.171954, -0.01084447, 1.240418, 1, 0, 0.7568628, 1,
1.180718, 0.01128898, 3.383045, 1, 0, 0.7490196, 1,
1.187106, 0.7815154, 0.8286084, 1, 0, 0.7450981, 1,
1.191605, -0.7941148, 0.9717801, 1, 0, 0.7372549, 1,
1.193957, 0.6534739, 1.529271, 1, 0, 0.7333333, 1,
1.194821, 1.099565, 1.794814, 1, 0, 0.7254902, 1,
1.19939, 0.1475001, 1.413282, 1, 0, 0.7215686, 1,
1.207153, 0.3933758, 2.169967, 1, 0, 0.7137255, 1,
1.208905, -0.1951966, 0.1616506, 1, 0, 0.7098039, 1,
1.209776, 0.3923945, 0.8697243, 1, 0, 0.7019608, 1,
1.211472, 0.6622165, 1.939208, 1, 0, 0.6941177, 1,
1.212132, -0.04576148, 2.221347, 1, 0, 0.6901961, 1,
1.229415, -0.5816089, 1.30815, 1, 0, 0.682353, 1,
1.240478, -0.5515656, 1.025707, 1, 0, 0.6784314, 1,
1.244503, -0.9132817, 2.453454, 1, 0, 0.6705883, 1,
1.246763, -0.1987695, 1.500169, 1, 0, 0.6666667, 1,
1.252749, -0.9073592, 1.623213, 1, 0, 0.6588235, 1,
1.25572, -1.473512, 2.143277, 1, 0, 0.654902, 1,
1.261152, -2.539679, 4.238168, 1, 0, 0.6470588, 1,
1.26986, -0.6659421, 0.7471168, 1, 0, 0.6431373, 1,
1.271471, -0.03649645, 3.045437, 1, 0, 0.6352941, 1,
1.271683, -0.9754877, 1.822384, 1, 0, 0.6313726, 1,
1.271831, -0.2409443, 1.595728, 1, 0, 0.6235294, 1,
1.275857, -1.195537, 2.924842, 1, 0, 0.6196079, 1,
1.283588, -1.947279, 3.475324, 1, 0, 0.6117647, 1,
1.287802, 1.35774, 0.3203239, 1, 0, 0.6078432, 1,
1.289388, 1.178138, 0.2736149, 1, 0, 0.6, 1,
1.29567, 0.7816488, 1.089607, 1, 0, 0.5921569, 1,
1.297347, 0.4617859, 1.180147, 1, 0, 0.5882353, 1,
1.30715, -0.1757182, 2.817815, 1, 0, 0.5803922, 1,
1.316694, 0.2031669, 0.3232309, 1, 0, 0.5764706, 1,
1.318061, -0.2694429, 1.1391, 1, 0, 0.5686275, 1,
1.323604, -0.3924026, 1.633975, 1, 0, 0.5647059, 1,
1.334022, -0.7287034, 3.09031, 1, 0, 0.5568628, 1,
1.355913, -1.778521, 3.989055, 1, 0, 0.5529412, 1,
1.371691, 1.173569, 1.397403, 1, 0, 0.5450981, 1,
1.382779, -0.2734437, 1.420961, 1, 0, 0.5411765, 1,
1.384754, -1.639035, 2.356458, 1, 0, 0.5333334, 1,
1.3898, 0.9322316, 1.172625, 1, 0, 0.5294118, 1,
1.391259, 2.367115, -0.7476903, 1, 0, 0.5215687, 1,
1.393391, 0.1444403, 1.203145, 1, 0, 0.5176471, 1,
1.400151, -0.01994989, 0.2255814, 1, 0, 0.509804, 1,
1.417365, -0.1193349, 2.187569, 1, 0, 0.5058824, 1,
1.417577, -0.6129246, 1.997189, 1, 0, 0.4980392, 1,
1.417591, -2.001701, 1.634296, 1, 0, 0.4901961, 1,
1.420696, -0.6192856, 2.647706, 1, 0, 0.4862745, 1,
1.424995, -2.010953, 3.397213, 1, 0, 0.4784314, 1,
1.428532, -0.5183608, 3.753543, 1, 0, 0.4745098, 1,
1.42866, 0.605979, 2.809813, 1, 0, 0.4666667, 1,
1.432931, 0.9974331, 0.977841, 1, 0, 0.4627451, 1,
1.439527, 1.405446, 1.567567, 1, 0, 0.454902, 1,
1.446285, 0.9637166, 1.707359, 1, 0, 0.4509804, 1,
1.456885, 0.6011906, 1.673599, 1, 0, 0.4431373, 1,
1.471327, 0.2674358, 2.649783, 1, 0, 0.4392157, 1,
1.479275, -0.8792423, 2.45122, 1, 0, 0.4313726, 1,
1.480633, 0.8494126, -0.6552987, 1, 0, 0.427451, 1,
1.50464, 0.4924063, 1.115128, 1, 0, 0.4196078, 1,
1.508779, 0.3677566, 1.209732, 1, 0, 0.4156863, 1,
1.545051, -1.593358, 2.74207, 1, 0, 0.4078431, 1,
1.564061, 1.375325, 2.065372, 1, 0, 0.4039216, 1,
1.565766, -1.112137, 0.8820605, 1, 0, 0.3960784, 1,
1.567525, 0.6528972, 0.6123725, 1, 0, 0.3882353, 1,
1.574548, 0.3783526, 1.535531, 1, 0, 0.3843137, 1,
1.57854, 0.253069, 2.179048, 1, 0, 0.3764706, 1,
1.607344, -0.693311, 1.736852, 1, 0, 0.372549, 1,
1.630711, -2.205341, 1.517698, 1, 0, 0.3647059, 1,
1.63399, 0.2639579, 0.5619047, 1, 0, 0.3607843, 1,
1.646838, -0.4310944, 1.689378, 1, 0, 0.3529412, 1,
1.662341, -2.191593, 3.093853, 1, 0, 0.3490196, 1,
1.668328, 1.690876, 1.502168, 1, 0, 0.3411765, 1,
1.669093, -1.371686, 1.517946, 1, 0, 0.3372549, 1,
1.699379, 0.4392731, 0.2993624, 1, 0, 0.3294118, 1,
1.706503, -1.082094, 1.979616, 1, 0, 0.3254902, 1,
1.737613, 0.008620192, 0.9446124, 1, 0, 0.3176471, 1,
1.744576, -0.5210535, 0.8260229, 1, 0, 0.3137255, 1,
1.747535, 1.680405, -0.3837518, 1, 0, 0.3058824, 1,
1.752793, 1.415035, 2.009466, 1, 0, 0.2980392, 1,
1.758957, 0.9236543, 1.406688, 1, 0, 0.2941177, 1,
1.761987, -1.343348, 1.316894, 1, 0, 0.2862745, 1,
1.765723, 1.997306, 1.742751, 1, 0, 0.282353, 1,
1.768743, -1.825831, 1.620045, 1, 0, 0.2745098, 1,
1.779677, 0.8592557, 0.5614628, 1, 0, 0.2705882, 1,
1.783972, 1.234245, 0.5994125, 1, 0, 0.2627451, 1,
1.791538, 0.262399, 1.657413, 1, 0, 0.2588235, 1,
1.794394, 0.4422107, 0.9585879, 1, 0, 0.2509804, 1,
1.7951, 1.305158, 1.312491, 1, 0, 0.2470588, 1,
1.80154, -0.9564481, 2.737303, 1, 0, 0.2392157, 1,
1.804214, 1.564536, -0.2103956, 1, 0, 0.2352941, 1,
1.808313, -1.191378, 1.9821, 1, 0, 0.227451, 1,
1.833957, -2.400823, 0.2921306, 1, 0, 0.2235294, 1,
1.843468, -0.6635659, 1.898723, 1, 0, 0.2156863, 1,
1.847647, 0.3401819, 2.091543, 1, 0, 0.2117647, 1,
1.851571, -0.9819384, 1.47322, 1, 0, 0.2039216, 1,
1.88231, 1.521322, 1.380477, 1, 0, 0.1960784, 1,
1.889283, 3.897465, -2.049257, 1, 0, 0.1921569, 1,
1.893499, 1.563724, 1.404108, 1, 0, 0.1843137, 1,
1.913368, -1.251752, 2.166087, 1, 0, 0.1803922, 1,
1.915628, 0.9576048, -0.01653383, 1, 0, 0.172549, 1,
1.930729, -0.7031993, 1.616794, 1, 0, 0.1686275, 1,
1.938436, 0.1163178, 1.817638, 1, 0, 0.1607843, 1,
1.950636, 1.917261, 0.9738433, 1, 0, 0.1568628, 1,
1.954412, 0.3311284, 2.415173, 1, 0, 0.1490196, 1,
1.966667, 1.005323, 1.759819, 1, 0, 0.145098, 1,
2.014657, -0.6495278, 3.931335, 1, 0, 0.1372549, 1,
2.057085, 1.398198, -0.7449462, 1, 0, 0.1333333, 1,
2.057761, 0.4530659, 0.6136746, 1, 0, 0.1254902, 1,
2.134541, -0.8791447, 1.949594, 1, 0, 0.1215686, 1,
2.136609, -0.05370923, 0.7721067, 1, 0, 0.1137255, 1,
2.161084, 0.7257653, 2.000946, 1, 0, 0.1098039, 1,
2.182651, -0.9646885, 1.760064, 1, 0, 0.1019608, 1,
2.283807, -0.07783295, 0.991985, 1, 0, 0.09411765, 1,
2.310747, -0.01907174, 2.35495, 1, 0, 0.09019608, 1,
2.324333, -0.2349922, 2.559912, 1, 0, 0.08235294, 1,
2.328329, 0.3653209, 1.808046, 1, 0, 0.07843138, 1,
2.33905, 1.131612, 0.05966343, 1, 0, 0.07058824, 1,
2.349829, 0.6895412, 0.7927981, 1, 0, 0.06666667, 1,
2.398637, -0.7870041, 2.220707, 1, 0, 0.05882353, 1,
2.414859, 1.147156, -0.4507959, 1, 0, 0.05490196, 1,
2.509303, -0.7600228, 2.675351, 1, 0, 0.04705882, 1,
2.522661, 0.5197758, 1.775785, 1, 0, 0.04313726, 1,
2.619337, -2.34258, 1.344618, 1, 0, 0.03529412, 1,
2.663825, -0.4625967, 1.14338, 1, 0, 0.03137255, 1,
2.687179, 0.6472596, 2.713636, 1, 0, 0.02352941, 1,
2.719919, -0.04685221, 1.160843, 1, 0, 0.01960784, 1,
2.754214, -1.437269, 1.06056, 1, 0, 0.01176471, 1,
2.867795, -2.00664, 3.102468, 1, 0, 0.007843138, 1
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
-0.256537, -4.044632, -7.352578, 0, -0.5, 0.5, 0.5,
-0.256537, -4.044632, -7.352578, 1, -0.5, 0.5, 0.5,
-0.256537, -4.044632, -7.352578, 1, 1.5, 0.5, 0.5,
-0.256537, -4.044632, -7.352578, 0, 1.5, 0.5, 0.5
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
-4.440018, 0.5019553, -7.352578, 0, -0.5, 0.5, 0.5,
-4.440018, 0.5019553, -7.352578, 1, -0.5, 0.5, 0.5,
-4.440018, 0.5019553, -7.352578, 1, 1.5, 0.5, 0.5,
-4.440018, 0.5019553, -7.352578, 0, 1.5, 0.5, 0.5
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
-4.440018, -4.044632, 0.07123375, 0, -0.5, 0.5, 0.5,
-4.440018, -4.044632, 0.07123375, 1, -0.5, 0.5, 0.5,
-4.440018, -4.044632, 0.07123375, 1, 1.5, 0.5, 0.5,
-4.440018, -4.044632, 0.07123375, 0, 1.5, 0.5, 0.5
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
-3, -2.99542, -5.639391,
2, -2.99542, -5.639391,
-3, -2.99542, -5.639391,
-3, -3.170288, -5.924922,
-2, -2.99542, -5.639391,
-2, -3.170288, -5.924922,
-1, -2.99542, -5.639391,
-1, -3.170288, -5.924922,
0, -2.99542, -5.639391,
0, -3.170288, -5.924922,
1, -2.99542, -5.639391,
1, -3.170288, -5.924922,
2, -2.99542, -5.639391,
2, -3.170288, -5.924922
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
-3, -3.520026, -6.495985, 0, -0.5, 0.5, 0.5,
-3, -3.520026, -6.495985, 1, -0.5, 0.5, 0.5,
-3, -3.520026, -6.495985, 1, 1.5, 0.5, 0.5,
-3, -3.520026, -6.495985, 0, 1.5, 0.5, 0.5,
-2, -3.520026, -6.495985, 0, -0.5, 0.5, 0.5,
-2, -3.520026, -6.495985, 1, -0.5, 0.5, 0.5,
-2, -3.520026, -6.495985, 1, 1.5, 0.5, 0.5,
-2, -3.520026, -6.495985, 0, 1.5, 0.5, 0.5,
-1, -3.520026, -6.495985, 0, -0.5, 0.5, 0.5,
-1, -3.520026, -6.495985, 1, -0.5, 0.5, 0.5,
-1, -3.520026, -6.495985, 1, 1.5, 0.5, 0.5,
-1, -3.520026, -6.495985, 0, 1.5, 0.5, 0.5,
0, -3.520026, -6.495985, 0, -0.5, 0.5, 0.5,
0, -3.520026, -6.495985, 1, -0.5, 0.5, 0.5,
0, -3.520026, -6.495985, 1, 1.5, 0.5, 0.5,
0, -3.520026, -6.495985, 0, 1.5, 0.5, 0.5,
1, -3.520026, -6.495985, 0, -0.5, 0.5, 0.5,
1, -3.520026, -6.495985, 1, -0.5, 0.5, 0.5,
1, -3.520026, -6.495985, 1, 1.5, 0.5, 0.5,
1, -3.520026, -6.495985, 0, 1.5, 0.5, 0.5,
2, -3.520026, -6.495985, 0, -0.5, 0.5, 0.5,
2, -3.520026, -6.495985, 1, -0.5, 0.5, 0.5,
2, -3.520026, -6.495985, 1, 1.5, 0.5, 0.5,
2, -3.520026, -6.495985, 0, 1.5, 0.5, 0.5
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
-3.474599, -2, -5.639391,
-3.474599, 3, -5.639391,
-3.474599, -2, -5.639391,
-3.635503, -2, -5.924922,
-3.474599, -1, -5.639391,
-3.635503, -1, -5.924922,
-3.474599, 0, -5.639391,
-3.635503, 0, -5.924922,
-3.474599, 1, -5.639391,
-3.635503, 1, -5.924922,
-3.474599, 2, -5.639391,
-3.635503, 2, -5.924922,
-3.474599, 3, -5.639391,
-3.635503, 3, -5.924922
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
-3.957309, -2, -6.495985, 0, -0.5, 0.5, 0.5,
-3.957309, -2, -6.495985, 1, -0.5, 0.5, 0.5,
-3.957309, -2, -6.495985, 1, 1.5, 0.5, 0.5,
-3.957309, -2, -6.495985, 0, 1.5, 0.5, 0.5,
-3.957309, -1, -6.495985, 0, -0.5, 0.5, 0.5,
-3.957309, -1, -6.495985, 1, -0.5, 0.5, 0.5,
-3.957309, -1, -6.495985, 1, 1.5, 0.5, 0.5,
-3.957309, -1, -6.495985, 0, 1.5, 0.5, 0.5,
-3.957309, 0, -6.495985, 0, -0.5, 0.5, 0.5,
-3.957309, 0, -6.495985, 1, -0.5, 0.5, 0.5,
-3.957309, 0, -6.495985, 1, 1.5, 0.5, 0.5,
-3.957309, 0, -6.495985, 0, 1.5, 0.5, 0.5,
-3.957309, 1, -6.495985, 0, -0.5, 0.5, 0.5,
-3.957309, 1, -6.495985, 1, -0.5, 0.5, 0.5,
-3.957309, 1, -6.495985, 1, 1.5, 0.5, 0.5,
-3.957309, 1, -6.495985, 0, 1.5, 0.5, 0.5,
-3.957309, 2, -6.495985, 0, -0.5, 0.5, 0.5,
-3.957309, 2, -6.495985, 1, -0.5, 0.5, 0.5,
-3.957309, 2, -6.495985, 1, 1.5, 0.5, 0.5,
-3.957309, 2, -6.495985, 0, 1.5, 0.5, 0.5,
-3.957309, 3, -6.495985, 0, -0.5, 0.5, 0.5,
-3.957309, 3, -6.495985, 1, -0.5, 0.5, 0.5,
-3.957309, 3, -6.495985, 1, 1.5, 0.5, 0.5,
-3.957309, 3, -6.495985, 0, 1.5, 0.5, 0.5
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
-3.474599, -2.99542, -4,
-3.474599, -2.99542, 4,
-3.474599, -2.99542, -4,
-3.635503, -3.170288, -4,
-3.474599, -2.99542, -2,
-3.635503, -3.170288, -2,
-3.474599, -2.99542, 0,
-3.635503, -3.170288, 0,
-3.474599, -2.99542, 2,
-3.635503, -3.170288, 2,
-3.474599, -2.99542, 4,
-3.635503, -3.170288, 4
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
-3.957309, -3.520026, -4, 0, -0.5, 0.5, 0.5,
-3.957309, -3.520026, -4, 1, -0.5, 0.5, 0.5,
-3.957309, -3.520026, -4, 1, 1.5, 0.5, 0.5,
-3.957309, -3.520026, -4, 0, 1.5, 0.5, 0.5,
-3.957309, -3.520026, -2, 0, -0.5, 0.5, 0.5,
-3.957309, -3.520026, -2, 1, -0.5, 0.5, 0.5,
-3.957309, -3.520026, -2, 1, 1.5, 0.5, 0.5,
-3.957309, -3.520026, -2, 0, 1.5, 0.5, 0.5,
-3.957309, -3.520026, 0, 0, -0.5, 0.5, 0.5,
-3.957309, -3.520026, 0, 1, -0.5, 0.5, 0.5,
-3.957309, -3.520026, 0, 1, 1.5, 0.5, 0.5,
-3.957309, -3.520026, 0, 0, 1.5, 0.5, 0.5,
-3.957309, -3.520026, 2, 0, -0.5, 0.5, 0.5,
-3.957309, -3.520026, 2, 1, -0.5, 0.5, 0.5,
-3.957309, -3.520026, 2, 1, 1.5, 0.5, 0.5,
-3.957309, -3.520026, 2, 0, 1.5, 0.5, 0.5,
-3.957309, -3.520026, 4, 0, -0.5, 0.5, 0.5,
-3.957309, -3.520026, 4, 1, -0.5, 0.5, 0.5,
-3.957309, -3.520026, 4, 1, 1.5, 0.5, 0.5,
-3.957309, -3.520026, 4, 0, 1.5, 0.5, 0.5
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
-3.474599, -2.99542, -5.639391,
-3.474599, 3.99933, -5.639391,
-3.474599, -2.99542, 5.781858,
-3.474599, 3.99933, 5.781858,
-3.474599, -2.99542, -5.639391,
-3.474599, -2.99542, 5.781858,
-3.474599, 3.99933, -5.639391,
-3.474599, 3.99933, 5.781858,
-3.474599, -2.99542, -5.639391,
2.961525, -2.99542, -5.639391,
-3.474599, -2.99542, 5.781858,
2.961525, -2.99542, 5.781858,
-3.474599, 3.99933, -5.639391,
2.961525, 3.99933, -5.639391,
-3.474599, 3.99933, 5.781858,
2.961525, 3.99933, 5.781858,
2.961525, -2.99542, -5.639391,
2.961525, 3.99933, -5.639391,
2.961525, -2.99542, 5.781858,
2.961525, 3.99933, 5.781858,
2.961525, -2.99542, -5.639391,
2.961525, -2.99542, 5.781858,
2.961525, 3.99933, -5.639391,
2.961525, 3.99933, 5.781858
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
var radius = 7.934513;
var distance = 35.30154;
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
mvMatrix.translate( 0.256537, -0.5019553, -0.07123375 );
mvMatrix.scale( 1.332937, 1.226484, 0.7511394 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.30154);
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
TFC<-read.table("TFC.xyz")
```

```
## Error in read.table("TFC.xyz"): no lines available in input
```

```r
x<-TFC$V2
```

```
## Error in eval(expr, envir, enclos): object 'TFC' not found
```

```r
y<-TFC$V3
```

```
## Error in eval(expr, envir, enclos): object 'TFC' not found
```

```r
z<-TFC$V4
```

```
## Error in eval(expr, envir, enclos): object 'TFC' not found
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
-3.380869, -1.814811, -2.346471, 0, 0, 1, 1, 1,
-3.294031, 0.7039624, -2.681024, 1, 0, 0, 1, 1,
-2.792448, -1.13736, -2.061216, 1, 0, 0, 1, 1,
-2.741786, -1.046541, -2.539082, 1, 0, 0, 1, 1,
-2.52085, 0.6327538, -0.5849074, 1, 0, 0, 1, 1,
-2.500085, 0.7566762, -1.812025, 1, 0, 0, 1, 1,
-2.489281, -0.1436499, -1.054553, 0, 0, 0, 1, 1,
-2.475545, -1.702933, -1.584005, 0, 0, 0, 1, 1,
-2.243851, -1.065438, -2.160916, 0, 0, 0, 1, 1,
-2.213586, 0.8165076, -1.235189, 0, 0, 0, 1, 1,
-2.186996, 0.6683882, -2.205364, 0, 0, 0, 1, 1,
-2.182372, -1.175915, -1.671997, 0, 0, 0, 1, 1,
-2.182329, -0.5030767, -2.176239, 0, 0, 0, 1, 1,
-2.179636, -0.5916167, -1.809391, 1, 1, 1, 1, 1,
-2.168705, 0.3823622, -1.519238, 1, 1, 1, 1, 1,
-2.165536, 0.07119279, -2.006138, 1, 1, 1, 1, 1,
-2.158476, 0.3882063, -3.153959, 1, 1, 1, 1, 1,
-2.130011, -0.5819072, -1.156805, 1, 1, 1, 1, 1,
-2.126992, -1.716472, -0.8622494, 1, 1, 1, 1, 1,
-2.104314, -0.05582381, 0.3390292, 1, 1, 1, 1, 1,
-2.10239, -0.311121, -2.759161, 1, 1, 1, 1, 1,
-2.078718, -1.569176, -1.621837, 1, 1, 1, 1, 1,
-2.056466, -0.5280201, -2.314113, 1, 1, 1, 1, 1,
-2.051272, -0.6360832, -1.369901, 1, 1, 1, 1, 1,
-2.023646, 0.6157871, -0.0293432, 1, 1, 1, 1, 1,
-1.996885, -0.4384347, -2.352894, 1, 1, 1, 1, 1,
-1.967304, 0.7185128, -2.529814, 1, 1, 1, 1, 1,
-1.960687, -2.086487, -1.83887, 1, 1, 1, 1, 1,
-1.955604, 0.812054, -0.9648175, 0, 0, 1, 1, 1,
-1.954526, 0.7649078, -3.392115, 1, 0, 0, 1, 1,
-1.919738, 0.4319611, -1.066477, 1, 0, 0, 1, 1,
-1.910239, 0.07197198, -2.273342, 1, 0, 0, 1, 1,
-1.891969, 0.786215, -0.01461013, 1, 0, 0, 1, 1,
-1.890645, -1.293071, -3.396092, 1, 0, 0, 1, 1,
-1.867579, -0.7067404, -1.638732, 0, 0, 0, 1, 1,
-1.857363, -0.5217128, -0.9454423, 0, 0, 0, 1, 1,
-1.84448, 1.136471, -0.9865294, 0, 0, 0, 1, 1,
-1.834984, 1.121959, -0.6107479, 0, 0, 0, 1, 1,
-1.825867, -0.790085, -1.440227, 0, 0, 0, 1, 1,
-1.803593, 0.6597149, -0.5031824, 0, 0, 0, 1, 1,
-1.795202, 0.2531546, -0.8036399, 0, 0, 0, 1, 1,
-1.793589, 0.2877689, -1.905203, 1, 1, 1, 1, 1,
-1.782313, -0.7074415, -2.599901, 1, 1, 1, 1, 1,
-1.771582, -0.5595889, -3.030347, 1, 1, 1, 1, 1,
-1.769584, -1.349002, -1.775936, 1, 1, 1, 1, 1,
-1.755638, 0.05913204, -0.4370107, 1, 1, 1, 1, 1,
-1.749452, -0.1447879, -0.2263365, 1, 1, 1, 1, 1,
-1.748702, -1.389963, -0.7677268, 1, 1, 1, 1, 1,
-1.74374, -0.3188926, -2.008143, 1, 1, 1, 1, 1,
-1.721742, -1.227311, -2.321963, 1, 1, 1, 1, 1,
-1.711465, 0.9728404, 0.8260453, 1, 1, 1, 1, 1,
-1.701045, -0.02880386, -1.314788, 1, 1, 1, 1, 1,
-1.654734, 0.1568669, -0.783017, 1, 1, 1, 1, 1,
-1.652355, -0.2542227, -1.381912, 1, 1, 1, 1, 1,
-1.634742, -0.252072, -2.746828, 1, 1, 1, 1, 1,
-1.62914, 0.138661, -0.8812855, 1, 1, 1, 1, 1,
-1.616676, 0.213256, -1.148802, 0, 0, 1, 1, 1,
-1.614692, 0.2236384, -2.248435, 1, 0, 0, 1, 1,
-1.606897, 0.6531587, -0.3202632, 1, 0, 0, 1, 1,
-1.605263, 0.7425141, -2.784733, 1, 0, 0, 1, 1,
-1.584565, 0.04810421, -1.622669, 1, 0, 0, 1, 1,
-1.584348, -1.064987, -1.156375, 1, 0, 0, 1, 1,
-1.579223, -1.105162, -1.822262, 0, 0, 0, 1, 1,
-1.569739, -0.4096026, -0.8393621, 0, 0, 0, 1, 1,
-1.565951, 0.09929796, -1.147853, 0, 0, 0, 1, 1,
-1.562612, -1.243575, -1.64753, 0, 0, 0, 1, 1,
-1.558727, 1.932887, -0.9788665, 0, 0, 0, 1, 1,
-1.550568, 0.7371348, -1.706957, 0, 0, 0, 1, 1,
-1.545743, 0.7801266, -1.012215, 0, 0, 0, 1, 1,
-1.535548, 0.7948946, 0.1484203, 1, 1, 1, 1, 1,
-1.527522, -0.8411847, -1.523515, 1, 1, 1, 1, 1,
-1.519038, -1.129803, -3.117253, 1, 1, 1, 1, 1,
-1.519015, 1.233273, -0.8831314, 1, 1, 1, 1, 1,
-1.518926, 1.007841, -1.522083, 1, 1, 1, 1, 1,
-1.51708, 0.3711365, -1.65949, 1, 1, 1, 1, 1,
-1.515254, -0.5256332, -1.945102, 1, 1, 1, 1, 1,
-1.513585, 1.059295, -1.864158, 1, 1, 1, 1, 1,
-1.50246, -0.9833027, -1.099108, 1, 1, 1, 1, 1,
-1.497593, 1.075131, -2.13163, 1, 1, 1, 1, 1,
-1.495664, 1.053482, -1.354367, 1, 1, 1, 1, 1,
-1.492563, -1.509539, -3.391069, 1, 1, 1, 1, 1,
-1.488623, 0.7334263, -2.738059, 1, 1, 1, 1, 1,
-1.488518, 0.4048419, -2.614538, 1, 1, 1, 1, 1,
-1.488268, -1.465513, -3.565809, 1, 1, 1, 1, 1,
-1.486032, -0.1951764, -1.82479, 0, 0, 1, 1, 1,
-1.485615, -0.7446433, -1.282971, 1, 0, 0, 1, 1,
-1.465757, 0.143018, -1.633131, 1, 0, 0, 1, 1,
-1.448789, -1.317777, -2.178185, 1, 0, 0, 1, 1,
-1.444939, -0.5111462, -2.620155, 1, 0, 0, 1, 1,
-1.44482, 0.4228895, -1.075168, 1, 0, 0, 1, 1,
-1.437238, -0.1623413, -1.669992, 0, 0, 0, 1, 1,
-1.437187, 0.2244253, -0.897779, 0, 0, 0, 1, 1,
-1.434506, 1.024621, -0.5670751, 0, 0, 0, 1, 1,
-1.430313, 0.5813168, -0.9434005, 0, 0, 0, 1, 1,
-1.430297, -0.5542004, -0.9862421, 0, 0, 0, 1, 1,
-1.425159, 0.01143224, 0.2814049, 0, 0, 0, 1, 1,
-1.42257, 0.1743064, -1.838504, 0, 0, 0, 1, 1,
-1.420093, -0.4250515, -1.175583, 1, 1, 1, 1, 1,
-1.38853, 1.210036, -1.460582, 1, 1, 1, 1, 1,
-1.387347, 1.797646, -1.428543, 1, 1, 1, 1, 1,
-1.369531, 1.351761, -3.171754, 1, 1, 1, 1, 1,
-1.360405, 0.5567451, -0.523609, 1, 1, 1, 1, 1,
-1.359732, -0.2300568, -2.62216, 1, 1, 1, 1, 1,
-1.339836, -0.2756343, -2.745664, 1, 1, 1, 1, 1,
-1.33676, 0.1406799, -2.777726, 1, 1, 1, 1, 1,
-1.327567, -1.008705, -3.224674, 1, 1, 1, 1, 1,
-1.327419, 0.9599159, -0.7576231, 1, 1, 1, 1, 1,
-1.303726, 1.329703, -0.3709738, 1, 1, 1, 1, 1,
-1.296722, -0.8418981, -2.882521, 1, 1, 1, 1, 1,
-1.295697, 1.206824, -0.8422083, 1, 1, 1, 1, 1,
-1.291802, 0.5054851, -0.5803165, 1, 1, 1, 1, 1,
-1.288772, 1.553991, -0.2905541, 1, 1, 1, 1, 1,
-1.288211, -0.6917529, -1.99597, 0, 0, 1, 1, 1,
-1.287519, 1.939665, -1.765114, 1, 0, 0, 1, 1,
-1.285732, 0.06798919, -1.694137, 1, 0, 0, 1, 1,
-1.276336, -0.08226898, -2.207836, 1, 0, 0, 1, 1,
-1.27326, 0.5391896, -1.651845, 1, 0, 0, 1, 1,
-1.265789, 0.8837041, -1.173219, 1, 0, 0, 1, 1,
-1.262399, 0.8473223, -2.066895, 0, 0, 0, 1, 1,
-1.25771, 0.04058513, -1.469783, 0, 0, 0, 1, 1,
-1.25103, -0.4160506, -1.996062, 0, 0, 0, 1, 1,
-1.241827, -0.2978398, -0.326588, 0, 0, 0, 1, 1,
-1.23823, 0.6329579, 0.2985899, 0, 0, 0, 1, 1,
-1.234231, -0.7617484, -1.254705, 0, 0, 0, 1, 1,
-1.231577, 1.305634, -1.541824, 0, 0, 0, 1, 1,
-1.230672, 0.03041505, -3.402347, 1, 1, 1, 1, 1,
-1.228714, 0.08270465, -2.604678, 1, 1, 1, 1, 1,
-1.219554, 0.2084771, -0.7508716, 1, 1, 1, 1, 1,
-1.202317, -0.1763275, -2.135955, 1, 1, 1, 1, 1,
-1.195511, -0.8417592, -2.608844, 1, 1, 1, 1, 1,
-1.192029, 1.861686, -0.1076757, 1, 1, 1, 1, 1,
-1.188568, -0.7699049, -2.247211, 1, 1, 1, 1, 1,
-1.175343, 0.2140569, -0.558519, 1, 1, 1, 1, 1,
-1.173563, 0.9806138, 0.7923045, 1, 1, 1, 1, 1,
-1.167943, 1.035678, -1.403531, 1, 1, 1, 1, 1,
-1.164186, 1.192893, -0.6037266, 1, 1, 1, 1, 1,
-1.146829, -0.5582836, -3.073482, 1, 1, 1, 1, 1,
-1.140371, 0.694625, -0.7834899, 1, 1, 1, 1, 1,
-1.135842, -1.570713, -3.409357, 1, 1, 1, 1, 1,
-1.135058, 0.3566433, 0.1110853, 1, 1, 1, 1, 1,
-1.134287, -1.545166, -2.687087, 0, 0, 1, 1, 1,
-1.133085, -0.05050263, -2.562932, 1, 0, 0, 1, 1,
-1.132778, -2.448995, -3.210035, 1, 0, 0, 1, 1,
-1.129706, -0.0479452, -2.955691, 1, 0, 0, 1, 1,
-1.128482, -1.751359, -2.937236, 1, 0, 0, 1, 1,
-1.121241, 0.2953847, -0.6806093, 1, 0, 0, 1, 1,
-1.12026, -1.227509, -1.113932, 0, 0, 0, 1, 1,
-1.119315, 0.6750129, 0.4262139, 0, 0, 0, 1, 1,
-1.115115, -1.13667, -2.236516, 0, 0, 0, 1, 1,
-1.114759, -1.585436, -3.116966, 0, 0, 0, 1, 1,
-1.108538, 0.3047201, -1.811522, 0, 0, 0, 1, 1,
-1.105269, -1.311423, -1.397781, 0, 0, 0, 1, 1,
-1.105087, -0.6718819, -1.372834, 0, 0, 0, 1, 1,
-1.104898, 1.333874, -2.385275, 1, 1, 1, 1, 1,
-1.104133, -0.3615659, -2.511803, 1, 1, 1, 1, 1,
-1.102256, 0.07945598, -3.993726, 1, 1, 1, 1, 1,
-1.092023, 0.4042152, -1.008827, 1, 1, 1, 1, 1,
-1.087974, 0.9015026, -0.9565737, 1, 1, 1, 1, 1,
-1.086639, 0.7297272, -0.2660657, 1, 1, 1, 1, 1,
-1.085517, 0.09024009, -0.06706016, 1, 1, 1, 1, 1,
-1.084785, -0.6221486, -2.185821, 1, 1, 1, 1, 1,
-1.07972, 0.7884785, -0.7498808, 1, 1, 1, 1, 1,
-1.079377, 1.565812, -3.134523, 1, 1, 1, 1, 1,
-1.078721, -0.2415798, -0.9495797, 1, 1, 1, 1, 1,
-1.078687, 0.5112872, -0.6869105, 1, 1, 1, 1, 1,
-1.078096, 1.58554, -0.5343325, 1, 1, 1, 1, 1,
-1.066241, 0.9965843, -0.5639753, 1, 1, 1, 1, 1,
-1.061736, -0.8176655, -0.7390981, 1, 1, 1, 1, 1,
-1.058542, 0.7753271, -1.849988, 0, 0, 1, 1, 1,
-1.058126, -1.345382, -2.874542, 1, 0, 0, 1, 1,
-1.056445, -2.220104, -3.893933, 1, 0, 0, 1, 1,
-1.055594, 0.1019947, -0.9816536, 1, 0, 0, 1, 1,
-1.047864, 1.164147, -1.732659, 1, 0, 0, 1, 1,
-1.047608, 0.2271409, 0.1213787, 1, 0, 0, 1, 1,
-1.047571, 0.2847495, -1.420222, 0, 0, 0, 1, 1,
-1.033518, -0.9371108, -1.022494, 0, 0, 0, 1, 1,
-1.033118, 0.5712581, -1.073678, 0, 0, 0, 1, 1,
-1.030586, -0.6782724, -2.842556, 0, 0, 0, 1, 1,
-1.030306, -0.9282115, -3.150822, 0, 0, 0, 1, 1,
-1.013114, -1.672372, -2.418463, 0, 0, 0, 1, 1,
-1.008941, 0.2402154, -1.1143, 0, 0, 0, 1, 1,
-1.008322, 0.9291849, -0.7301329, 1, 1, 1, 1, 1,
-1.005398, -0.1078538, -1.635428, 1, 1, 1, 1, 1,
-1.005273, 0.003220893, -2.143848, 1, 1, 1, 1, 1,
-1.003593, -0.1420681, -1.526519, 1, 1, 1, 1, 1,
-1.002951, 0.4276651, -1.753814, 1, 1, 1, 1, 1,
-0.9898666, 0.9665192, -1.433722, 1, 1, 1, 1, 1,
-0.9892281, -0.644587, -2.511688, 1, 1, 1, 1, 1,
-0.9816039, -0.1372294, -1.896242, 1, 1, 1, 1, 1,
-0.975606, 0.09031972, -2.669166, 1, 1, 1, 1, 1,
-0.9717475, 1.068608, 0.1022244, 1, 1, 1, 1, 1,
-0.9714903, -1.307571, -3.08729, 1, 1, 1, 1, 1,
-0.9659559, 1.563453, -0.06542667, 1, 1, 1, 1, 1,
-0.9642938, -1.221961, -2.202979, 1, 1, 1, 1, 1,
-0.9464602, 1.101704, -0.7116424, 1, 1, 1, 1, 1,
-0.9433758, -1.585093, -3.905859, 1, 1, 1, 1, 1,
-0.9426057, 1.60096, -1.093917, 0, 0, 1, 1, 1,
-0.9398496, -1.16693, -3.05698, 1, 0, 0, 1, 1,
-0.9396901, 0.5723575, -1.359565, 1, 0, 0, 1, 1,
-0.9384743, 0.8040942, -1.264132, 1, 0, 0, 1, 1,
-0.937981, -1.626292, -4.265175, 1, 0, 0, 1, 1,
-0.9224347, -0.7354476, -3.112754, 1, 0, 0, 1, 1,
-0.9091005, 0.02933407, -0.8536158, 0, 0, 0, 1, 1,
-0.9077148, -0.3083325, -2.183943, 0, 0, 0, 1, 1,
-0.9033991, -2.18522, -2.739443, 0, 0, 0, 1, 1,
-0.8928834, 1.128754, -0.0887575, 0, 0, 0, 1, 1,
-0.8912128, 1.108064, 0.4440233, 0, 0, 0, 1, 1,
-0.88394, -0.118175, -1.996554, 0, 0, 0, 1, 1,
-0.8741894, -1.671958, -2.095652, 0, 0, 0, 1, 1,
-0.8627546, 0.4159553, -0.05926758, 1, 1, 1, 1, 1,
-0.8607342, 0.6658638, -1.37857, 1, 1, 1, 1, 1,
-0.8604037, -0.1342173, -2.043984, 1, 1, 1, 1, 1,
-0.8601882, -0.154751, -2.710226, 1, 1, 1, 1, 1,
-0.8597874, -0.6610153, -5.198039, 1, 1, 1, 1, 1,
-0.8562147, 1.561118, -2.031149, 1, 1, 1, 1, 1,
-0.8548787, 0.8309048, -1.49163, 1, 1, 1, 1, 1,
-0.8537879, -0.2241262, -1.416781, 1, 1, 1, 1, 1,
-0.8529729, -0.7647301, -1.727569, 1, 1, 1, 1, 1,
-0.8525119, -1.585466, -4.407605, 1, 1, 1, 1, 1,
-0.8515292, -0.938996, -2.826639, 1, 1, 1, 1, 1,
-0.8513969, -1.078824, -1.212633, 1, 1, 1, 1, 1,
-0.8481724, 0.5759439, -1.892787, 1, 1, 1, 1, 1,
-0.8454799, -1.251634, -3.82407, 1, 1, 1, 1, 1,
-0.8432273, -0.2298495, -0.2637362, 1, 1, 1, 1, 1,
-0.8420205, 0.9466036, -2.482714, 0, 0, 1, 1, 1,
-0.8362614, 1.457961, -2.561947, 1, 0, 0, 1, 1,
-0.8292143, -0.811381, -1.966856, 1, 0, 0, 1, 1,
-0.8265487, 0.06974397, -2.073216, 1, 0, 0, 1, 1,
-0.8202144, -0.6169578, -1.456435, 1, 0, 0, 1, 1,
-0.8196249, 0.717506, 1.402165, 1, 0, 0, 1, 1,
-0.8184466, -0.03898805, -2.258044, 0, 0, 0, 1, 1,
-0.8153522, -0.1225087, -3.157369, 0, 0, 0, 1, 1,
-0.8133249, 0.389047, -1.101828, 0, 0, 0, 1, 1,
-0.8078583, 0.3341213, -1.256183, 0, 0, 0, 1, 1,
-0.8017204, -0.5789773, -1.847899, 0, 0, 0, 1, 1,
-0.7980164, 0.2987761, -0.6029558, 0, 0, 0, 1, 1,
-0.7902462, 2.306861, -0.5624465, 0, 0, 0, 1, 1,
-0.7889862, -0.03272304, -0.7274929, 1, 1, 1, 1, 1,
-0.7888722, 0.09462887, -1.54666, 1, 1, 1, 1, 1,
-0.7877384, -0.516625, -1.261719, 1, 1, 1, 1, 1,
-0.7733296, -0.8324192, -3.19781, 1, 1, 1, 1, 1,
-0.7680942, -0.7300155, -1.717772, 1, 1, 1, 1, 1,
-0.7659896, 1.96391, -1.272499, 1, 1, 1, 1, 1,
-0.7620857, -0.5843587, -1.957662, 1, 1, 1, 1, 1,
-0.7603578, 1.049183, -0.05544707, 1, 1, 1, 1, 1,
-0.7601942, -1.631004, -3.432237, 1, 1, 1, 1, 1,
-0.7536374, -1.126416, -3.522686, 1, 1, 1, 1, 1,
-0.7528014, -0.1736574, -1.085534, 1, 1, 1, 1, 1,
-0.7515287, 0.3452531, -0.1003136, 1, 1, 1, 1, 1,
-0.7494057, -0.2350406, -1.943639, 1, 1, 1, 1, 1,
-0.748769, -0.3120981, -4.038314, 1, 1, 1, 1, 1,
-0.7449674, 0.1786021, -0.4654476, 1, 1, 1, 1, 1,
-0.7405024, -0.1141006, -3.599173, 0, 0, 1, 1, 1,
-0.7393062, 0.2655333, -1.017114, 1, 0, 0, 1, 1,
-0.7338245, 0.436104, -0.3492468, 1, 0, 0, 1, 1,
-0.7312485, 0.3151632, -0.7709787, 1, 0, 0, 1, 1,
-0.7283661, 0.6244639, 0.470251, 1, 0, 0, 1, 1,
-0.7242727, -0.7526666, -2.133651, 1, 0, 0, 1, 1,
-0.7196071, 0.627819, -1.747624, 0, 0, 0, 1, 1,
-0.7183978, -1.203677, -2.670367, 0, 0, 0, 1, 1,
-0.716285, 0.2620676, -1.224224, 0, 0, 0, 1, 1,
-0.7124417, 0.837369, -0.1442832, 0, 0, 0, 1, 1,
-0.7114391, -1.354429, -2.689931, 0, 0, 0, 1, 1,
-0.7093958, -1.687196, -4.083832, 0, 0, 0, 1, 1,
-0.7080102, 2.061615, -0.7699239, 0, 0, 0, 1, 1,
-0.7068849, 0.835152, 0.6053818, 1, 1, 1, 1, 1,
-0.705781, 1.480444, 0.5771177, 1, 1, 1, 1, 1,
-0.6995756, -0.8240858, -2.370155, 1, 1, 1, 1, 1,
-0.6965628, 0.8738748, -0.8161913, 1, 1, 1, 1, 1,
-0.6961123, -0.05097011, -2.129882, 1, 1, 1, 1, 1,
-0.6950536, 0.4403639, -2.161994, 1, 1, 1, 1, 1,
-0.6934067, 0.1956519, -1.491518, 1, 1, 1, 1, 1,
-0.6919792, 0.6881909, -0.5438088, 1, 1, 1, 1, 1,
-0.6906825, 0.6000083, -1.616539, 1, 1, 1, 1, 1,
-0.6891798, 0.2140497, -1.780523, 1, 1, 1, 1, 1,
-0.6850035, -1.531284, -3.679682, 1, 1, 1, 1, 1,
-0.6836105, 1.174215, -1.594468, 1, 1, 1, 1, 1,
-0.6787709, -0.6754876, -2.961824, 1, 1, 1, 1, 1,
-0.6779842, -0.06459996, -3.501439, 1, 1, 1, 1, 1,
-0.6745955, -0.2405396, -2.256124, 1, 1, 1, 1, 1,
-0.6739324, -0.6179789, -3.020341, 0, 0, 1, 1, 1,
-0.6731295, -0.5817873, -2.635171, 1, 0, 0, 1, 1,
-0.6715864, 0.04280405, -2.413042, 1, 0, 0, 1, 1,
-0.6702081, 0.4877877, -1.19103, 1, 0, 0, 1, 1,
-0.6700017, 0.9741375, 0.8910399, 1, 0, 0, 1, 1,
-0.6645788, -2.741372, -2.957152, 1, 0, 0, 1, 1,
-0.6576014, 1.182301, -1.193045, 0, 0, 0, 1, 1,
-0.6533573, -0.6919917, -3.675522, 0, 0, 0, 1, 1,
-0.6513569, -2.621219, -1.802122, 0, 0, 0, 1, 1,
-0.6497414, 1.013347, -2.374854, 0, 0, 0, 1, 1,
-0.645931, -1.108091, -3.988432, 0, 0, 0, 1, 1,
-0.642103, -1.218579, -2.76959, 0, 0, 0, 1, 1,
-0.6420135, -1.285062, -3.2796, 0, 0, 0, 1, 1,
-0.6403384, 0.2421607, 0.207679, 1, 1, 1, 1, 1,
-0.6381534, 1.465654, -0.3759197, 1, 1, 1, 1, 1,
-0.6336992, 0.07155783, -1.196602, 1, 1, 1, 1, 1,
-0.6329675, -1.057122, -2.471714, 1, 1, 1, 1, 1,
-0.619553, -0.08789326, -0.5357277, 1, 1, 1, 1, 1,
-0.617941, 0.4954823, -1.830096, 1, 1, 1, 1, 1,
-0.6175653, -0.7841504, -2.009768, 1, 1, 1, 1, 1,
-0.6173862, 0.006722078, -1.320893, 1, 1, 1, 1, 1,
-0.6152912, 0.4523571, -0.6840624, 1, 1, 1, 1, 1,
-0.6118542, -0.1021749, -1.025003, 1, 1, 1, 1, 1,
-0.6071395, -0.8132913, -2.645813, 1, 1, 1, 1, 1,
-0.6053132, -0.7933019, -4.126146, 1, 1, 1, 1, 1,
-0.6044108, 0.9305816, -0.6899436, 1, 1, 1, 1, 1,
-0.6021882, -1.332308, -3.033771, 1, 1, 1, 1, 1,
-0.6013194, 0.9656421, -1.15319, 1, 1, 1, 1, 1,
-0.6003712, -1.621671, -2.820112, 0, 0, 1, 1, 1,
-0.5983799, -1.709937, -2.873985, 1, 0, 0, 1, 1,
-0.5942925, -1.114372, -4.71453, 1, 0, 0, 1, 1,
-0.5941173, -0.478159, -1.416127, 1, 0, 0, 1, 1,
-0.5768239, 2.448104, -0.6055843, 1, 0, 0, 1, 1,
-0.5755531, -0.7999695, -2.666498, 1, 0, 0, 1, 1,
-0.5748051, 0.7444233, 0.01071141, 0, 0, 0, 1, 1,
-0.5742568, -0.4754843, -2.497855, 0, 0, 0, 1, 1,
-0.5727853, -0.6565176, -2.878975, 0, 0, 0, 1, 1,
-0.5726368, -0.7343982, -2.955318, 0, 0, 0, 1, 1,
-0.5713738, 0.7448635, -0.1694012, 0, 0, 0, 1, 1,
-0.5586144, -2.21655, -3.426703, 0, 0, 0, 1, 1,
-0.5504958, -0.04666141, -1.059604, 0, 0, 0, 1, 1,
-0.545662, -1.232562, -0.4884279, 1, 1, 1, 1, 1,
-0.5453103, 0.3951979, -1.857672, 1, 1, 1, 1, 1,
-0.5434582, 0.1872211, 0.2235312, 1, 1, 1, 1, 1,
-0.5413347, 0.3881623, -0.4113324, 1, 1, 1, 1, 1,
-0.5389354, 0.678903, -0.3437045, 1, 1, 1, 1, 1,
-0.534847, -0.156061, -1.590643, 1, 1, 1, 1, 1,
-0.5331489, 0.3927829, 1.475976, 1, 1, 1, 1, 1,
-0.5313541, 1.313553, 1.648671, 1, 1, 1, 1, 1,
-0.5298735, 0.8476737, -0.7440682, 1, 1, 1, 1, 1,
-0.526578, -0.8222395, -3.184036, 1, 1, 1, 1, 1,
-0.5186729, -0.2701918, -1.745225, 1, 1, 1, 1, 1,
-0.5164745, -0.8234261, -2.58406, 1, 1, 1, 1, 1,
-0.5139313, 0.9431127, -1.215131, 1, 1, 1, 1, 1,
-0.511649, 0.2688107, 0.5107828, 1, 1, 1, 1, 1,
-0.5094402, 0.9438719, -0.5591647, 1, 1, 1, 1, 1,
-0.509101, -0.04701682, -3.447039, 0, 0, 1, 1, 1,
-0.5040234, -1.117778, -3.311497, 1, 0, 0, 1, 1,
-0.5016567, -0.7420858, -3.341834, 1, 0, 0, 1, 1,
-0.5000308, -0.1775868, -1.963418, 1, 0, 0, 1, 1,
-0.498432, 0.5892791, -0.9112601, 1, 0, 0, 1, 1,
-0.4956809, 0.1227683, -0.1586643, 1, 0, 0, 1, 1,
-0.4929091, -0.7508813, -1.514292, 0, 0, 0, 1, 1,
-0.4912786, -0.5766165, -2.723641, 0, 0, 0, 1, 1,
-0.4866352, 1.125311, -0.7706192, 0, 0, 0, 1, 1,
-0.4800718, -0.6851286, -3.827891, 0, 0, 0, 1, 1,
-0.4788541, 1.850396, -0.9663053, 0, 0, 0, 1, 1,
-0.4788087, 0.1417533, -1.360817, 0, 0, 0, 1, 1,
-0.4739013, -0.2672182, -3.614282, 0, 0, 0, 1, 1,
-0.4705967, -1.345526, -3.321774, 1, 1, 1, 1, 1,
-0.4704919, 1.302951, -1.538346, 1, 1, 1, 1, 1,
-0.4672647, 0.4759384, -0.2741947, 1, 1, 1, 1, 1,
-0.4670986, -0.06817158, -2.503899, 1, 1, 1, 1, 1,
-0.4610412, 0.1711805, -1.309933, 1, 1, 1, 1, 1,
-0.4553961, -0.1979665, -1.436388, 1, 1, 1, 1, 1,
-0.4546549, -1.698612, -1.507661, 1, 1, 1, 1, 1,
-0.4532421, 0.01750557, -0.203721, 1, 1, 1, 1, 1,
-0.4417142, 0.1329836, -3.060912, 1, 1, 1, 1, 1,
-0.4252283, -2.188578, -3.097305, 1, 1, 1, 1, 1,
-0.4232085, 1.574307, -1.801127, 1, 1, 1, 1, 1,
-0.4231907, 0.6112248, -0.1365997, 1, 1, 1, 1, 1,
-0.4140377, 1.173225, -0.399506, 1, 1, 1, 1, 1,
-0.4140061, 0.9132428, -0.8103287, 1, 1, 1, 1, 1,
-0.4097576, -1.299223, -1.515531, 1, 1, 1, 1, 1,
-0.4046134, -0.3777333, -1.883293, 0, 0, 1, 1, 1,
-0.4042444, 0.3859951, -0.7498431, 1, 0, 0, 1, 1,
-0.4039187, 0.6183553, -1.923033, 1, 0, 0, 1, 1,
-0.3911376, 0.9486717, -3.318034, 1, 0, 0, 1, 1,
-0.3810526, -0.6778048, -2.495115, 1, 0, 0, 1, 1,
-0.3657494, -0.3755315, -1.218066, 1, 0, 0, 1, 1,
-0.3632891, 0.3828852, 0.6940154, 0, 0, 0, 1, 1,
-0.3540936, -0.4079115, -0.8811489, 0, 0, 0, 1, 1,
-0.3482278, -0.2914241, -3.188579, 0, 0, 0, 1, 1,
-0.3419456, -0.9480327, -1.505746, 0, 0, 0, 1, 1,
-0.3397855, 0.9920005, -0.2578262, 0, 0, 0, 1, 1,
-0.338383, -1.086643, -3.635291, 0, 0, 0, 1, 1,
-0.3381354, 1.533334, 0.08127601, 0, 0, 0, 1, 1,
-0.3367151, -1.55207, -3.399964, 1, 1, 1, 1, 1,
-0.3364945, 0.03638348, -0.8884354, 1, 1, 1, 1, 1,
-0.3345962, 1.240762, 0.7792024, 1, 1, 1, 1, 1,
-0.3345504, 2.842525, 0.1074013, 1, 1, 1, 1, 1,
-0.3314988, -0.4221771, -1.772131, 1, 1, 1, 1, 1,
-0.3169345, -0.3443992, -3.928282, 1, 1, 1, 1, 1,
-0.3130364, -0.3138416, -1.990544, 1, 1, 1, 1, 1,
-0.310472, -1.159102, -2.832473, 1, 1, 1, 1, 1,
-0.3001818, -0.8634278, -1.767727, 1, 1, 1, 1, 1,
-0.2990952, 0.959407, -0.9115859, 1, 1, 1, 1, 1,
-0.2975632, -0.4183765, -4.184113, 1, 1, 1, 1, 1,
-0.2967125, -0.8241, -2.859174, 1, 1, 1, 1, 1,
-0.2938125, -0.7329841, -1.005757, 1, 1, 1, 1, 1,
-0.2900342, 0.6200441, -0.02586942, 1, 1, 1, 1, 1,
-0.2889677, 0.3770806, -0.8319932, 1, 1, 1, 1, 1,
-0.285358, -0.01313993, -2.135008, 0, 0, 1, 1, 1,
-0.2782076, -0.8221164, -2.749592, 1, 0, 0, 1, 1,
-0.2770007, 0.6842324, -0.03530782, 1, 0, 0, 1, 1,
-0.274947, 0.1607721, -0.3158742, 1, 0, 0, 1, 1,
-0.2683525, 1.475614, -0.8882393, 1, 0, 0, 1, 1,
-0.2678806, 0.9413369, -0.09672882, 1, 0, 0, 1, 1,
-0.2613578, -0.6151677, -1.588646, 0, 0, 0, 1, 1,
-0.260823, -0.860949, -1.768118, 0, 0, 0, 1, 1,
-0.2601523, 0.7794998, -2.133926, 0, 0, 0, 1, 1,
-0.2597709, 0.2533964, -0.735684, 0, 0, 0, 1, 1,
-0.252422, 0.142239, -1.868578, 0, 0, 0, 1, 1,
-0.2494537, 1.585493, -1.584022, 0, 0, 0, 1, 1,
-0.2462697, -1.300245, -3.174305, 0, 0, 0, 1, 1,
-0.2416071, -2.276614, -4.349353, 1, 1, 1, 1, 1,
-0.2409878, -1.552562, -3.538293, 1, 1, 1, 1, 1,
-0.240284, 0.1275302, 0.3904784, 1, 1, 1, 1, 1,
-0.2335051, 0.3437337, 1.560392, 1, 1, 1, 1, 1,
-0.2328869, -0.007775932, -1.045102, 1, 1, 1, 1, 1,
-0.227296, 0.9595116, -2.383053, 1, 1, 1, 1, 1,
-0.2264068, -0.5488755, -1.59751, 1, 1, 1, 1, 1,
-0.2238236, -1.004044, -2.758186, 1, 1, 1, 1, 1,
-0.2237668, 1.016865, -1.117047, 1, 1, 1, 1, 1,
-0.2234799, 0.810513, -0.2099571, 1, 1, 1, 1, 1,
-0.220955, 1.762427, 0.1500898, 1, 1, 1, 1, 1,
-0.2194202, 0.6455925, -1.450513, 1, 1, 1, 1, 1,
-0.2118574, -0.5909874, -2.623601, 1, 1, 1, 1, 1,
-0.2118403, 2.205028, -0.6145245, 1, 1, 1, 1, 1,
-0.2053522, 0.8189318, -0.9990231, 1, 1, 1, 1, 1,
-0.2009224, -0.2632538, -3.298041, 0, 0, 1, 1, 1,
-0.1998921, -0.8277928, -0.913876, 1, 0, 0, 1, 1,
-0.1953295, 0.1240843, -0.6855873, 1, 0, 0, 1, 1,
-0.1948267, -1.085166, -3.626435, 1, 0, 0, 1, 1,
-0.192857, -1.833285, -4.453504, 1, 0, 0, 1, 1,
-0.1915998, -0.8204757, -1.753953, 1, 0, 0, 1, 1,
-0.1910417, 1.760142, 0.2926614, 0, 0, 0, 1, 1,
-0.1875292, -0.5572211, -2.070729, 0, 0, 0, 1, 1,
-0.1841084, 0.8926257, -0.4940991, 0, 0, 0, 1, 1,
-0.1805204, -1.689916, -3.328106, 0, 0, 0, 1, 1,
-0.17943, 0.133079, -1.120795, 0, 0, 0, 1, 1,
-0.1787825, -1.315716, -2.290812, 0, 0, 0, 1, 1,
-0.1763259, -0.4512912, -1.829733, 0, 0, 0, 1, 1,
-0.1624264, -1.763672, -1.310347, 1, 1, 1, 1, 1,
-0.1610832, 2.663832, 0.2131733, 1, 1, 1, 1, 1,
-0.1575102, -0.6544808, -3.059902, 1, 1, 1, 1, 1,
-0.1543386, 1.909305, -1.332747, 1, 1, 1, 1, 1,
-0.150736, 0.8540429, -0.02970979, 1, 1, 1, 1, 1,
-0.1499936, 0.5381253, 0.8692968, 1, 1, 1, 1, 1,
-0.141949, 0.6034993, -1.279874, 1, 1, 1, 1, 1,
-0.1386004, 0.2040918, -3.100075, 1, 1, 1, 1, 1,
-0.136539, 0.5035815, 1.111987, 1, 1, 1, 1, 1,
-0.1343726, 0.5338761, -1.069706, 1, 1, 1, 1, 1,
-0.1340227, -1.530789, -2.800709, 1, 1, 1, 1, 1,
-0.1323255, 0.06327556, -1.708864, 1, 1, 1, 1, 1,
-0.1320914, 0.4087394, -1.298012, 1, 1, 1, 1, 1,
-0.1280527, -1.780027, -1.928614, 1, 1, 1, 1, 1,
-0.1227921, 0.4578619, -1.193856, 1, 1, 1, 1, 1,
-0.1106108, -1.598339, -5.473062, 0, 0, 1, 1, 1,
-0.1060633, 1.390969, -0.3658586, 1, 0, 0, 1, 1,
-0.1036937, 0.05410333, -1.265412, 1, 0, 0, 1, 1,
-0.1007633, 0.3189536, 1.017432, 1, 0, 0, 1, 1,
-0.09659483, 1.429773, -0.4588655, 1, 0, 0, 1, 1,
-0.09380695, 0.7481066, -0.9791684, 1, 0, 0, 1, 1,
-0.08948886, -0.3189663, -2.63903, 0, 0, 0, 1, 1,
-0.08823396, -0.6887189, -3.606007, 0, 0, 0, 1, 1,
-0.08236273, 1.424614, -0.9567757, 0, 0, 0, 1, 1,
-0.08118611, 0.1655477, 1.250049, 0, 0, 0, 1, 1,
-0.07384257, -0.4241246, -5.100394, 0, 0, 0, 1, 1,
-0.07035825, -2.893554, -1.531829, 0, 0, 0, 1, 1,
-0.06877241, 0.2887743, 1.022657, 0, 0, 0, 1, 1,
-0.06610028, -1.671907, -2.778544, 1, 1, 1, 1, 1,
-0.06549433, 0.2363388, -0.03033142, 1, 1, 1, 1, 1,
-0.06419284, 0.769956, 1.478707, 1, 1, 1, 1, 1,
-0.06229511, 1.094205, 0.63227, 1, 1, 1, 1, 1,
-0.06204154, -0.4903952, -3.445458, 1, 1, 1, 1, 1,
-0.06111742, -0.5980353, -2.688316, 1, 1, 1, 1, 1,
-0.05723225, -0.4045865, -2.080913, 1, 1, 1, 1, 1,
-0.05458566, -0.2694108, -3.764477, 1, 1, 1, 1, 1,
-0.0526827, 0.4035941, 0.919322, 1, 1, 1, 1, 1,
-0.05167985, 0.9238724, 0.2643568, 1, 1, 1, 1, 1,
-0.04836112, 0.2323421, -0.8876607, 1, 1, 1, 1, 1,
-0.0479453, -0.9668469, -0.368028, 1, 1, 1, 1, 1,
-0.04506552, -0.452824, -2.214737, 1, 1, 1, 1, 1,
-0.03950878, -0.1589191, -1.798283, 1, 1, 1, 1, 1,
-0.03582812, -0.6467323, -2.163166, 1, 1, 1, 1, 1,
-0.02810217, 0.9536931, -0.666683, 0, 0, 1, 1, 1,
-0.02745063, -0.2765709, -3.011976, 1, 0, 0, 1, 1,
-0.02701952, 0.541819, -1.795259, 1, 0, 0, 1, 1,
-0.02533627, 0.5432813, 1.220536, 1, 0, 0, 1, 1,
-0.0227018, -0.3534525, -1.989478, 1, 0, 0, 1, 1,
-0.02077043, -0.2620629, -4.820394, 1, 0, 0, 1, 1,
-0.01810321, 2.10377, -0.4295577, 0, 0, 0, 1, 1,
-0.01596062, -0.0368208, -2.304654, 0, 0, 0, 1, 1,
-0.01117325, 1.243774, 0.1241295, 0, 0, 0, 1, 1,
-0.007917354, 0.2996511, -0.08959466, 0, 0, 0, 1, 1,
-0.006875326, 0.8623254, -1.39141, 0, 0, 0, 1, 1,
-0.006292036, -2.17549, -3.176835, 0, 0, 0, 1, 1,
-0.004140913, 0.5256397, 0.6552919, 0, 0, 0, 1, 1,
-0.001717807, 1.107148, 0.7485725, 1, 1, 1, 1, 1,
-0.001068935, -0.9187199, -2.911386, 1, 1, 1, 1, 1,
0.009441036, 0.5036969, -1.045807, 1, 1, 1, 1, 1,
0.01037004, -0.820924, 3.969256, 1, 1, 1, 1, 1,
0.01243007, -1.913886, 1.465452, 1, 1, 1, 1, 1,
0.01256262, 0.3584205, 0.1756821, 1, 1, 1, 1, 1,
0.01408681, -0.3504146, 3.679463, 1, 1, 1, 1, 1,
0.01634207, 0.2579583, 0.01858638, 1, 1, 1, 1, 1,
0.01737386, -0.2626672, 3.135144, 1, 1, 1, 1, 1,
0.02453552, -0.1904288, 4.237569, 1, 1, 1, 1, 1,
0.02501097, 1.363989, 0.9134398, 1, 1, 1, 1, 1,
0.03840671, -1.345808, 5.098091, 1, 1, 1, 1, 1,
0.03912318, 0.6472998, -0.09070898, 1, 1, 1, 1, 1,
0.03962677, 0.4343277, 0.7543766, 1, 1, 1, 1, 1,
0.04267623, -1.095599, 3.544082, 1, 1, 1, 1, 1,
0.04489237, -0.3467475, 2.739976, 0, 0, 1, 1, 1,
0.04737007, 1.319112, 0.4158737, 1, 0, 0, 1, 1,
0.04876123, -0.7493426, 3.343649, 1, 0, 0, 1, 1,
0.05059159, -1.563166, 3.399973, 1, 0, 0, 1, 1,
0.05153237, -0.1281266, 3.468825, 1, 0, 0, 1, 1,
0.05273142, 0.1451161, -0.01353948, 1, 0, 0, 1, 1,
0.05290692, 0.6606539, -0.6581917, 0, 0, 0, 1, 1,
0.05362806, -0.9499523, 4.605837, 0, 0, 0, 1, 1,
0.06192329, 0.1289409, -0.06394067, 0, 0, 0, 1, 1,
0.06918691, -1.697566, 1.363518, 0, 0, 0, 1, 1,
0.07208622, -0.08998676, 0.275102, 0, 0, 0, 1, 1,
0.07785383, -0.8307038, 2.61737, 0, 0, 0, 1, 1,
0.07822245, -1.304474, 3.388655, 0, 0, 0, 1, 1,
0.08192275, -1.946946, 2.256618, 1, 1, 1, 1, 1,
0.08303875, -0.4719337, 3.643711, 1, 1, 1, 1, 1,
0.08376905, 1.131202, 1.580795, 1, 1, 1, 1, 1,
0.08433599, -0.4143206, 1.32961, 1, 1, 1, 1, 1,
0.08613971, 0.5130255, -0.1930588, 1, 1, 1, 1, 1,
0.08749802, 2.361297, -0.6443609, 1, 1, 1, 1, 1,
0.08773708, 1.670116, -0.9710461, 1, 1, 1, 1, 1,
0.08829411, 0.1697433, -0.8037196, 1, 1, 1, 1, 1,
0.09124474, 0.5205247, 0.725768, 1, 1, 1, 1, 1,
0.09156812, 0.04980711, 1.866692, 1, 1, 1, 1, 1,
0.09330602, 0.6884449, 0.566537, 1, 1, 1, 1, 1,
0.09536535, -0.4285076, 3.36751, 1, 1, 1, 1, 1,
0.102138, 1.253109, 1.004651, 1, 1, 1, 1, 1,
0.1030211, 0.3241586, 2.195735, 1, 1, 1, 1, 1,
0.1073597, 0.2161503, 1.547619, 1, 1, 1, 1, 1,
0.1078487, 0.6576239, 1.353859, 0, 0, 1, 1, 1,
0.1243693, -0.3532361, 3.406672, 1, 0, 0, 1, 1,
0.1254768, -1.023561, 3.129674, 1, 0, 0, 1, 1,
0.1259787, 0.1069027, 2.27439, 1, 0, 0, 1, 1,
0.1300193, 0.1059298, 0.4921032, 1, 0, 0, 1, 1,
0.1312561, 0.8064309, -1.197396, 1, 0, 0, 1, 1,
0.1320356, -0.3371924, 3.214784, 0, 0, 0, 1, 1,
0.1331394, -0.1589603, 2.094532, 0, 0, 0, 1, 1,
0.1405385, 0.8716019, 1.351717, 0, 0, 0, 1, 1,
0.1424051, -0.2402944, 4.417815, 0, 0, 0, 1, 1,
0.143462, -0.4943765, 3.273887, 0, 0, 0, 1, 1,
0.1442892, 1.687651, 0.7162207, 0, 0, 0, 1, 1,
0.1469084, -0.2441367, 2.71868, 0, 0, 0, 1, 1,
0.1500804, 0.06421725, 1.013112, 1, 1, 1, 1, 1,
0.1542427, 0.6188065, -2.27752, 1, 1, 1, 1, 1,
0.1545967, 0.2668946, 0.1111341, 1, 1, 1, 1, 1,
0.1564934, -1.086717, 1.692838, 1, 1, 1, 1, 1,
0.1570236, -0.1598956, 0.5351394, 1, 1, 1, 1, 1,
0.1571392, -1.224338, 3.608525, 1, 1, 1, 1, 1,
0.1596525, -1.73405, 3.58665, 1, 1, 1, 1, 1,
0.160061, -1.393458, 3.870105, 1, 1, 1, 1, 1,
0.1603882, 0.07045694, 1.327983, 1, 1, 1, 1, 1,
0.1687135, -0.5024595, 5.263458, 1, 1, 1, 1, 1,
0.1692454, -1.25321, 2.050279, 1, 1, 1, 1, 1,
0.1697863, 0.1159033, 1.183114, 1, 1, 1, 1, 1,
0.1743745, -2.043375, 4.336801, 1, 1, 1, 1, 1,
0.1747629, -0.1433685, 0.8468353, 1, 1, 1, 1, 1,
0.1760626, -0.1009515, 2.645899, 1, 1, 1, 1, 1,
0.1765166, 1.507364, -0.04404034, 0, 0, 1, 1, 1,
0.1810163, -1.632342, 3.658846, 1, 0, 0, 1, 1,
0.1815986, 0.23276, -1.439942, 1, 0, 0, 1, 1,
0.183648, 0.632432, -1.623812, 1, 0, 0, 1, 1,
0.1843847, 0.1137181, 1.378596, 1, 0, 0, 1, 1,
0.1874657, 0.6401196, -0.2686587, 1, 0, 0, 1, 1,
0.189077, -1.1522, 2.334902, 0, 0, 0, 1, 1,
0.1927122, -0.1891481, 1.720189, 0, 0, 0, 1, 1,
0.1960439, 0.1848504, 2.421955, 0, 0, 0, 1, 1,
0.1993368, -1.698373, 2.798934, 0, 0, 0, 1, 1,
0.1998783, -0.09032989, 2.888498, 0, 0, 0, 1, 1,
0.2004196, 1.490016, -0.2390025, 0, 0, 0, 1, 1,
0.2004541, -0.378135, 2.850275, 0, 0, 0, 1, 1,
0.201188, -0.7777058, 2.753725, 1, 1, 1, 1, 1,
0.2114414, 0.7148407, 0.3433174, 1, 1, 1, 1, 1,
0.213858, 1.171338, -0.5604787, 1, 1, 1, 1, 1,
0.2160204, -0.3662264, 0.8477088, 1, 1, 1, 1, 1,
0.2172758, 1.832291, 0.8672289, 1, 1, 1, 1, 1,
0.2193269, 1.509546, -0.8489532, 1, 1, 1, 1, 1,
0.219859, 0.09663412, 1.276418, 1, 1, 1, 1, 1,
0.2208547, 0.1878072, 2.049389, 1, 1, 1, 1, 1,
0.2220151, -0.4308397, 2.648129, 1, 1, 1, 1, 1,
0.2239751, -0.1976259, 2.507931, 1, 1, 1, 1, 1,
0.2266608, 0.7926295, 0.573142, 1, 1, 1, 1, 1,
0.2267723, -1.710154, 2.852917, 1, 1, 1, 1, 1,
0.2280114, 0.2577405, -0.9270932, 1, 1, 1, 1, 1,
0.2296394, 0.5001768, 2.216023, 1, 1, 1, 1, 1,
0.2327936, -0.4573261, 2.659583, 1, 1, 1, 1, 1,
0.2343165, -0.2971994, 2.986248, 0, 0, 1, 1, 1,
0.2350291, -1.200822, 3.150642, 1, 0, 0, 1, 1,
0.2377024, -0.5701756, 4.060723, 1, 0, 0, 1, 1,
0.2399666, -0.1754871, 1.988605, 1, 0, 0, 1, 1,
0.2431002, -1.137444, 2.109822, 1, 0, 0, 1, 1,
0.2471609, -0.4080309, 1.908335, 1, 0, 0, 1, 1,
0.2545723, 0.7415287, 2.655901, 0, 0, 0, 1, 1,
0.2548751, -0.9610218, 1.625561, 0, 0, 0, 1, 1,
0.2549844, -0.5039611, 3.718285, 0, 0, 0, 1, 1,
0.2556595, -0.9360219, 1.697282, 0, 0, 0, 1, 1,
0.2679115, -1.099448, 2.281137, 0, 0, 0, 1, 1,
0.2683928, -0.6036071, 2.213299, 0, 0, 0, 1, 1,
0.2692795, 0.296154, 0.2740636, 0, 0, 0, 1, 1,
0.2775188, -0.7002015, 1.991092, 1, 1, 1, 1, 1,
0.279258, -1.36077, 2.306318, 1, 1, 1, 1, 1,
0.2797881, 0.1528499, 0.767822, 1, 1, 1, 1, 1,
0.2808059, -0.529008, 2.729463, 1, 1, 1, 1, 1,
0.2838223, 0.6498907, 1.167855, 1, 1, 1, 1, 1,
0.2857409, -0.259622, 4.297142, 1, 1, 1, 1, 1,
0.2863947, 2.031257, 0.1551818, 1, 1, 1, 1, 1,
0.2893681, 0.6077753, 1.549685, 1, 1, 1, 1, 1,
0.2897579, -0.8383313, 5.61553, 1, 1, 1, 1, 1,
0.2904337, 0.2290339, -0.5019453, 1, 1, 1, 1, 1,
0.2912118, -1.642969, 3.72601, 1, 1, 1, 1, 1,
0.2917902, 0.8729326, 1.464569, 1, 1, 1, 1, 1,
0.2934735, 1.250146, 0.9291854, 1, 1, 1, 1, 1,
0.2936999, -0.7216707, 2.959353, 1, 1, 1, 1, 1,
0.3002509, -1.515619, 2.575406, 1, 1, 1, 1, 1,
0.3035496, -0.4892632, 2.364007, 0, 0, 1, 1, 1,
0.3039618, -0.7607974, 2.218697, 1, 0, 0, 1, 1,
0.3092186, 0.8755635, 1.158721, 1, 0, 0, 1, 1,
0.3129865, -0.6919841, 2.638523, 1, 0, 0, 1, 1,
0.3163946, -0.1014263, 2.457719, 1, 0, 0, 1, 1,
0.3228397, 0.3559392, 0.1098834, 1, 0, 0, 1, 1,
0.3235566, -0.5584782, 4.726365, 0, 0, 0, 1, 1,
0.3241174, 0.8079721, 1.322801, 0, 0, 0, 1, 1,
0.3288305, -1.034622, 2.569594, 0, 0, 0, 1, 1,
0.3296571, -0.6086842, 2.346617, 0, 0, 0, 1, 1,
0.3333044, 1.144586, 2.018096, 0, 0, 0, 1, 1,
0.3336927, 0.2815897, 0.432191, 0, 0, 0, 1, 1,
0.338868, 0.9489454, -0.05627772, 0, 0, 0, 1, 1,
0.3412431, -0.249062, 1.012313, 1, 1, 1, 1, 1,
0.3426086, -0.2454057, 2.244395, 1, 1, 1, 1, 1,
0.3440229, 0.6692154, 1.56668, 1, 1, 1, 1, 1,
0.3469793, -0.3014138, 2.781162, 1, 1, 1, 1, 1,
0.3472104, 0.4206974, 1.338973, 1, 1, 1, 1, 1,
0.3503015, -0.1485786, 1.28056, 1, 1, 1, 1, 1,
0.3508739, 1.090456, -0.2303044, 1, 1, 1, 1, 1,
0.3598559, -0.1272568, -0.2038144, 1, 1, 1, 1, 1,
0.3601161, 1.057192, 0.7955338, 1, 1, 1, 1, 1,
0.3656297, -1.186217, 3.110777, 1, 1, 1, 1, 1,
0.3702507, 1.393131, 0.5784802, 1, 1, 1, 1, 1,
0.3813674, -0.3493413, 2.638054, 1, 1, 1, 1, 1,
0.3831289, -2.497302, 1.966094, 1, 1, 1, 1, 1,
0.3847381, -0.2949037, 2.71713, 1, 1, 1, 1, 1,
0.3857396, 0.1752284, 1.866035, 1, 1, 1, 1, 1,
0.3909848, 0.08474839, 2.439737, 0, 0, 1, 1, 1,
0.3994507, -1.383915, 2.626462, 1, 0, 0, 1, 1,
0.4000681, 0.01073207, 0.07878953, 1, 0, 0, 1, 1,
0.4031631, -0.5852813, 2.232971, 1, 0, 0, 1, 1,
0.4047141, 0.3979052, 0.7141985, 1, 0, 0, 1, 1,
0.4049204, 1.353901, 1.572136, 1, 0, 0, 1, 1,
0.4053231, 1.562067, 0.5325722, 0, 0, 0, 1, 1,
0.411244, 0.2179917, -1.09294, 0, 0, 0, 1, 1,
0.4143095, -1.141517, 3.17886, 0, 0, 0, 1, 1,
0.4153122, -1.315678, 3.201153, 0, 0, 0, 1, 1,
0.4306657, -0.8171825, 3.303025, 0, 0, 0, 1, 1,
0.4322559, -1.68819, 2.268043, 0, 0, 0, 1, 1,
0.4379053, -0.77625, 2.94368, 0, 0, 0, 1, 1,
0.4401951, 1.740494, -1.101522, 1, 1, 1, 1, 1,
0.4411497, 2.509029, 0.1332349, 1, 1, 1, 1, 1,
0.4419181, -0.2634846, 1.537401, 1, 1, 1, 1, 1,
0.444636, -0.03335585, 3.085305, 1, 1, 1, 1, 1,
0.4446906, 0.188771, 1.562284, 1, 1, 1, 1, 1,
0.4454534, -1.188179, 2.527408, 1, 1, 1, 1, 1,
0.4474997, 0.6923771, 0.5944878, 1, 1, 1, 1, 1,
0.4483703, 0.4980656, 0.0704629, 1, 1, 1, 1, 1,
0.4553986, -0.7035551, 1.521623, 1, 1, 1, 1, 1,
0.4568149, 0.1027924, 0.6022685, 1, 1, 1, 1, 1,
0.4586819, -1.339139, 0.8755003, 1, 1, 1, 1, 1,
0.4600144, 0.6788381, 1.205941, 1, 1, 1, 1, 1,
0.4600688, 0.8001474, -1.008661, 1, 1, 1, 1, 1,
0.4607851, -0.3259974, 0.5059226, 1, 1, 1, 1, 1,
0.4693793, 0.1904166, -0.3909163, 1, 1, 1, 1, 1,
0.4769243, -0.3347682, 2.208731, 0, 0, 1, 1, 1,
0.482711, 0.4528965, 1.706467, 1, 0, 0, 1, 1,
0.4846441, -0.7166782, 3.589256, 1, 0, 0, 1, 1,
0.4879546, 0.7750368, 0.9609022, 1, 0, 0, 1, 1,
0.4894571, 0.03284281, 2.289553, 1, 0, 0, 1, 1,
0.4898228, 1.115982, -0.2148417, 1, 0, 0, 1, 1,
0.4911781, -1.380814, 1.994886, 0, 0, 0, 1, 1,
0.4915923, 0.9211806, -0.5516667, 0, 0, 0, 1, 1,
0.507417, 1.411725, -0.1990467, 0, 0, 0, 1, 1,
0.5144153, -0.8727511, 3.038174, 0, 0, 0, 1, 1,
0.517289, -0.1249087, 1.427688, 0, 0, 0, 1, 1,
0.5218708, -0.7383432, 2.109445, 0, 0, 0, 1, 1,
0.5318905, 0.451819, 0.4531002, 0, 0, 0, 1, 1,
0.5320618, 0.1025188, 1.583089, 1, 1, 1, 1, 1,
0.5321319, -0.1011113, 3.504672, 1, 1, 1, 1, 1,
0.5364793, 0.1811345, -0.1837319, 1, 1, 1, 1, 1,
0.5372498, 1.805403, -2.102397, 1, 1, 1, 1, 1,
0.5411562, -0.2909251, 3.190057, 1, 1, 1, 1, 1,
0.5470085, 0.6422809, 0.7286899, 1, 1, 1, 1, 1,
0.5478106, -0.884839, 2.121953, 1, 1, 1, 1, 1,
0.5495379, 1.165887, 1.301267, 1, 1, 1, 1, 1,
0.5518048, 0.5966376, 0.881435, 1, 1, 1, 1, 1,
0.5561947, 0.3718913, 1.54494, 1, 1, 1, 1, 1,
0.5593285, -0.8114005, 2.961387, 1, 1, 1, 1, 1,
0.5610079, 0.7241366, 1.302497, 1, 1, 1, 1, 1,
0.5610324, 0.7348682, -0.8061761, 1, 1, 1, 1, 1,
0.5633688, -2.51506, 2.581923, 1, 1, 1, 1, 1,
0.5640844, 1.197866, 0.6287446, 1, 1, 1, 1, 1,
0.5674167, -2.098048, 3.627673, 0, 0, 1, 1, 1,
0.571961, 0.4813552, 0.7488737, 1, 0, 0, 1, 1,
0.5725802, 1.913341, -0.4599339, 1, 0, 0, 1, 1,
0.5766755, 0.202903, 2.270409, 1, 0, 0, 1, 1,
0.5786153, -0.1802849, 2.954543, 1, 0, 0, 1, 1,
0.5796584, -1.525048, 2.459834, 1, 0, 0, 1, 1,
0.5809112, -1.834538, 3.999047, 0, 0, 0, 1, 1,
0.5856048, -0.1297335, 1.660905, 0, 0, 0, 1, 1,
0.5880999, -1.645317, 4.154974, 0, 0, 0, 1, 1,
0.5890594, 0.3054445, 3.793828, 0, 0, 0, 1, 1,
0.5894809, -1.362647, 2.52542, 0, 0, 0, 1, 1,
0.5940936, -1.340869, 0.6911372, 0, 0, 0, 1, 1,
0.5957484, -0.5801519, 2.635169, 0, 0, 0, 1, 1,
0.5972999, -0.1410015, 2.699849, 1, 1, 1, 1, 1,
0.5984259, 1.811643, 0.2420091, 1, 1, 1, 1, 1,
0.5990211, 1.377858, 0.3492297, 1, 1, 1, 1, 1,
0.6038991, -1.02761, 4.241229, 1, 1, 1, 1, 1,
0.6039874, 0.2886223, 2.120752, 1, 1, 1, 1, 1,
0.6042451, -0.032597, 0.5837185, 1, 1, 1, 1, 1,
0.608126, -0.7194555, 1.463139, 1, 1, 1, 1, 1,
0.6091897, 0.2578414, 0.691954, 1, 1, 1, 1, 1,
0.6099602, 0.06887064, 0.006589877, 1, 1, 1, 1, 1,
0.6113698, -0.4593955, 1.336675, 1, 1, 1, 1, 1,
0.6118615, -0.8700597, 3.239055, 1, 1, 1, 1, 1,
0.6118936, 0.3866915, 0.1332584, 1, 1, 1, 1, 1,
0.614649, 0.2496194, 1.162659, 1, 1, 1, 1, 1,
0.616455, 0.2468726, -1.524477, 1, 1, 1, 1, 1,
0.6178305, 0.7867106, 1.470424, 1, 1, 1, 1, 1,
0.6240136, 0.371089, -0.08864879, 0, 0, 1, 1, 1,
0.6254444, -0.7864965, 1.911747, 1, 0, 0, 1, 1,
0.6269763, 2.370404, -0.2569943, 1, 0, 0, 1, 1,
0.6306049, -0.4763608, 1.633176, 1, 0, 0, 1, 1,
0.6431146, -0.4396035, 3.50972, 1, 0, 0, 1, 1,
0.6448846, 0.862809, 0.592208, 1, 0, 0, 1, 1,
0.6498821, -0.3232434, 1.304583, 0, 0, 0, 1, 1,
0.6536159, -0.9278947, 0.9901164, 0, 0, 0, 1, 1,
0.6608277, 1.131491, 1.824007, 0, 0, 0, 1, 1,
0.6624804, -1.757538, 1.660396, 0, 0, 0, 1, 1,
0.6629307, 0.2009846, 2.021794, 0, 0, 0, 1, 1,
0.6684577, -1.615961, 2.065195, 0, 0, 0, 1, 1,
0.6690332, 0.5607551, 2.328162, 0, 0, 0, 1, 1,
0.6738484, -1.782637, 1.10471, 1, 1, 1, 1, 1,
0.6788323, -1.901097, 3.713199, 1, 1, 1, 1, 1,
0.6792589, 0.142047, 1.561541, 1, 1, 1, 1, 1,
0.680518, 0.5680833, 3.625882, 1, 1, 1, 1, 1,
0.6841909, -0.1205495, 1.213326, 1, 1, 1, 1, 1,
0.6885273, -0.4632271, 0.6639432, 1, 1, 1, 1, 1,
0.6970442, -0.4286596, 1.326756, 1, 1, 1, 1, 1,
0.6989715, 1.417344, 0.7079668, 1, 1, 1, 1, 1,
0.7047704, 1.330694, 0.4287719, 1, 1, 1, 1, 1,
0.7062672, 0.2438133, 0.9808956, 1, 1, 1, 1, 1,
0.7084737, -0.7764508, 2.302572, 1, 1, 1, 1, 1,
0.7227921, -1.589168, 2.041897, 1, 1, 1, 1, 1,
0.7234548, 0.7491733, 0.3425666, 1, 1, 1, 1, 1,
0.7258442, -0.7788466, -0.1834869, 1, 1, 1, 1, 1,
0.7268573, -0.3190383, 1.103014, 1, 1, 1, 1, 1,
0.7280197, -0.614517, 2.516261, 0, 0, 1, 1, 1,
0.7290162, -0.001713645, 1.592965, 1, 0, 0, 1, 1,
0.7385312, -0.8342633, 3.84534, 1, 0, 0, 1, 1,
0.7401252, 0.1063452, -1.363184, 1, 0, 0, 1, 1,
0.7420447, 1.081974, 0.9196807, 1, 0, 0, 1, 1,
0.7483135, -0.09927566, 1.822235, 1, 0, 0, 1, 1,
0.7525703, -1.667823, 1.769237, 0, 0, 0, 1, 1,
0.7533212, 0.1165911, 2.169856, 0, 0, 0, 1, 1,
0.7583142, -0.02659859, 3.171524, 0, 0, 0, 1, 1,
0.7606257, 1.378653, -0.5219506, 0, 0, 0, 1, 1,
0.7620056, -0.3887659, 1.210899, 0, 0, 0, 1, 1,
0.7761092, -1.609031, 3.631446, 0, 0, 0, 1, 1,
0.786102, 0.2765877, 2.911805, 0, 0, 0, 1, 1,
0.7864909, -1.542261, 2.243792, 1, 1, 1, 1, 1,
0.7899165, -1.697399, 2.70298, 1, 1, 1, 1, 1,
0.7925242, -1.020911, 1.349913, 1, 1, 1, 1, 1,
0.7930546, 0.4001511, 1.854374, 1, 1, 1, 1, 1,
0.7961807, 0.7770656, 1.109994, 1, 1, 1, 1, 1,
0.7969236, -0.5326254, 2.314452, 1, 1, 1, 1, 1,
0.8012508, 1.66105, -1.588177, 1, 1, 1, 1, 1,
0.8025217, -0.1439317, 1.838601, 1, 1, 1, 1, 1,
0.8033216, -0.7481348, 3.738176, 1, 1, 1, 1, 1,
0.8074635, 0.3291693, 0.7838121, 1, 1, 1, 1, 1,
0.8098537, -1.877361, 3.064525, 1, 1, 1, 1, 1,
0.8105003, -0.4755526, 3.590995, 1, 1, 1, 1, 1,
0.8123714, 0.3887305, 2.064602, 1, 1, 1, 1, 1,
0.8141131, 1.795276, -2.132968, 1, 1, 1, 1, 1,
0.8143086, 0.8257023, -0.1099176, 1, 1, 1, 1, 1,
0.8149721, 1.635762, 2.04493, 0, 0, 1, 1, 1,
0.820989, -1.954562, 1.272062, 1, 0, 0, 1, 1,
0.8279981, -2.160475, 3.211339, 1, 0, 0, 1, 1,
0.8311847, 0.7826217, 2.099666, 1, 0, 0, 1, 1,
0.8419034, 0.9297708, 0.8602117, 1, 0, 0, 1, 1,
0.8509203, -1.235343, 5.048596, 1, 0, 0, 1, 1,
0.8534464, 1.055849, 1.474472, 0, 0, 0, 1, 1,
0.858862, 0.9947057, 0.06637813, 0, 0, 0, 1, 1,
0.8665863, 1.645083, 2.231, 0, 0, 0, 1, 1,
0.8666244, 0.8209366, 1.166448, 0, 0, 0, 1, 1,
0.8696582, -0.662266, 2.549861, 0, 0, 0, 1, 1,
0.869804, -0.8017718, 1.326042, 0, 0, 0, 1, 1,
0.8795241, 1.11468, 0.2537994, 0, 0, 0, 1, 1,
0.880071, -1.588082, 1.726835, 1, 1, 1, 1, 1,
0.8810279, -0.4575704, 2.69217, 1, 1, 1, 1, 1,
0.8815523, -0.6603352, 2.734363, 1, 1, 1, 1, 1,
0.8817666, -0.3675413, 1.042186, 1, 1, 1, 1, 1,
0.8831221, 1.135683, -0.8719553, 1, 1, 1, 1, 1,
0.8831742, 0.08503643, -0.1227008, 1, 1, 1, 1, 1,
0.8895485, 0.0009669209, 0.5004423, 1, 1, 1, 1, 1,
0.8945249, 0.2495896, 1.087608, 1, 1, 1, 1, 1,
0.8961943, -0.687731, 4.392817, 1, 1, 1, 1, 1,
0.9025121, -0.6858587, 1.762095, 1, 1, 1, 1, 1,
0.9035442, -1.533787, 1.393357, 1, 1, 1, 1, 1,
0.9093999, 0.8059282, 2.997059, 1, 1, 1, 1, 1,
0.9133289, -2.457765, 2.286209, 1, 1, 1, 1, 1,
0.9158048, -0.5142334, 1.304114, 1, 1, 1, 1, 1,
0.9164386, 0.9588072, 0.9236404, 1, 1, 1, 1, 1,
0.9167485, 1.202937, 1.774245, 0, 0, 1, 1, 1,
0.9238883, -1.413812, 2.988647, 1, 0, 0, 1, 1,
0.9304649, 0.387235, 1.294101, 1, 0, 0, 1, 1,
0.9356036, -0.926569, 0.7800195, 1, 0, 0, 1, 1,
0.9426314, -0.2651292, 1.810232, 1, 0, 0, 1, 1,
0.9483632, -0.2207686, 3.376062, 1, 0, 0, 1, 1,
0.9498033, -0.0883179, 1.094168, 0, 0, 0, 1, 1,
0.9531351, -0.6381953, 1.657858, 0, 0, 0, 1, 1,
0.9552521, 1.522333, 0.7329738, 0, 0, 0, 1, 1,
0.9554998, 0.1984027, 0.4251903, 0, 0, 0, 1, 1,
0.9650335, 0.1258616, -1.260203, 0, 0, 0, 1, 1,
0.9670147, -0.8698308, 3.450886, 0, 0, 0, 1, 1,
0.968928, 1.302394, 0.6107566, 0, 0, 0, 1, 1,
0.9725441, 0.403044, 0.8928823, 1, 1, 1, 1, 1,
0.9743102, 1.159369, 2.393518, 1, 1, 1, 1, 1,
0.9746053, -2.33838, 4.314637, 1, 1, 1, 1, 1,
0.9755222, 1.231862, 1.498813, 1, 1, 1, 1, 1,
0.9763631, 1.743777, 0.2669808, 1, 1, 1, 1, 1,
0.9874332, 0.5421849, 0.7870998, 1, 1, 1, 1, 1,
0.9891407, -2.075058, 2.731558, 1, 1, 1, 1, 1,
0.994786, 0.5966711, 1.868566, 1, 1, 1, 1, 1,
0.9951024, 0.9367954, 1.52858, 1, 1, 1, 1, 1,
0.9988733, -0.4495129, 2.552291, 1, 1, 1, 1, 1,
1.000283, 0.6730936, 1.400984, 1, 1, 1, 1, 1,
1.001688, 0.3263813, -0.5895754, 1, 1, 1, 1, 1,
1.002087, 0.9984112, 1.479966, 1, 1, 1, 1, 1,
1.006414, -1.232977, 2.573504, 1, 1, 1, 1, 1,
1.00948, 2.941129, -0.4553462, 1, 1, 1, 1, 1,
1.025563, 0.5264003, 2.11057, 0, 0, 1, 1, 1,
1.029526, -0.4568188, 0.1464335, 1, 0, 0, 1, 1,
1.031378, -0.54514, 1.237059, 1, 0, 0, 1, 1,
1.031806, -2.036746, 0.9832777, 1, 0, 0, 1, 1,
1.039213, 0.4187755, 0.6989061, 1, 0, 0, 1, 1,
1.0422, 0.639528, 2.415943, 1, 0, 0, 1, 1,
1.04731, -1.613805, 3.685746, 0, 0, 0, 1, 1,
1.051133, 0.190155, 0.8806508, 0, 0, 0, 1, 1,
1.061649, -0.09300407, 3.276193, 0, 0, 0, 1, 1,
1.067199, 0.6620201, -0.1290679, 0, 0, 0, 1, 1,
1.070315, 0.3267018, 0.4510631, 0, 0, 0, 1, 1,
1.074565, 0.8584538, -0.1342491, 0, 0, 0, 1, 1,
1.075489, 1.544792, 1.524954, 0, 0, 0, 1, 1,
1.079486, -1.100743, 3.773127, 1, 1, 1, 1, 1,
1.086118, -2.15219, 4.175699, 1, 1, 1, 1, 1,
1.09079, -1.388792, 2.001743, 1, 1, 1, 1, 1,
1.090854, 0.6254927, 1.442041, 1, 1, 1, 1, 1,
1.098323, 0.8727016, 2.423201, 1, 1, 1, 1, 1,
1.10924, -0.6106799, 0.2870764, 1, 1, 1, 1, 1,
1.117845, 0.7947905, 3.317123, 1, 1, 1, 1, 1,
1.121464, 0.5218742, 0.8506916, 1, 1, 1, 1, 1,
1.123797, 1.303656, 1.992505, 1, 1, 1, 1, 1,
1.125986, 0.9262047, -0.05662046, 1, 1, 1, 1, 1,
1.129512, 0.2491004, 2.487784, 1, 1, 1, 1, 1,
1.141361, -2.035599, 2.239964, 1, 1, 1, 1, 1,
1.143505, -0.6663539, 2.221283, 1, 1, 1, 1, 1,
1.143884, 1.188504, 1.941622, 1, 1, 1, 1, 1,
1.152047, -1.143474, 1.337396, 1, 1, 1, 1, 1,
1.157931, 0.6355109, 1.768491, 0, 0, 1, 1, 1,
1.161785, 0.2573723, 0.32697, 1, 0, 0, 1, 1,
1.162216, 0.579168, 0.8146402, 1, 0, 0, 1, 1,
1.163531, -1.986788, 2.282901, 1, 0, 0, 1, 1,
1.168872, -0.4641754, 2.455709, 1, 0, 0, 1, 1,
1.170133, 0.04050254, 1.224426, 1, 0, 0, 1, 1,
1.171954, -0.01084447, 1.240418, 0, 0, 0, 1, 1,
1.180718, 0.01128898, 3.383045, 0, 0, 0, 1, 1,
1.187106, 0.7815154, 0.8286084, 0, 0, 0, 1, 1,
1.191605, -0.7941148, 0.9717801, 0, 0, 0, 1, 1,
1.193957, 0.6534739, 1.529271, 0, 0, 0, 1, 1,
1.194821, 1.099565, 1.794814, 0, 0, 0, 1, 1,
1.19939, 0.1475001, 1.413282, 0, 0, 0, 1, 1,
1.207153, 0.3933758, 2.169967, 1, 1, 1, 1, 1,
1.208905, -0.1951966, 0.1616506, 1, 1, 1, 1, 1,
1.209776, 0.3923945, 0.8697243, 1, 1, 1, 1, 1,
1.211472, 0.6622165, 1.939208, 1, 1, 1, 1, 1,
1.212132, -0.04576148, 2.221347, 1, 1, 1, 1, 1,
1.229415, -0.5816089, 1.30815, 1, 1, 1, 1, 1,
1.240478, -0.5515656, 1.025707, 1, 1, 1, 1, 1,
1.244503, -0.9132817, 2.453454, 1, 1, 1, 1, 1,
1.246763, -0.1987695, 1.500169, 1, 1, 1, 1, 1,
1.252749, -0.9073592, 1.623213, 1, 1, 1, 1, 1,
1.25572, -1.473512, 2.143277, 1, 1, 1, 1, 1,
1.261152, -2.539679, 4.238168, 1, 1, 1, 1, 1,
1.26986, -0.6659421, 0.7471168, 1, 1, 1, 1, 1,
1.271471, -0.03649645, 3.045437, 1, 1, 1, 1, 1,
1.271683, -0.9754877, 1.822384, 1, 1, 1, 1, 1,
1.271831, -0.2409443, 1.595728, 0, 0, 1, 1, 1,
1.275857, -1.195537, 2.924842, 1, 0, 0, 1, 1,
1.283588, -1.947279, 3.475324, 1, 0, 0, 1, 1,
1.287802, 1.35774, 0.3203239, 1, 0, 0, 1, 1,
1.289388, 1.178138, 0.2736149, 1, 0, 0, 1, 1,
1.29567, 0.7816488, 1.089607, 1, 0, 0, 1, 1,
1.297347, 0.4617859, 1.180147, 0, 0, 0, 1, 1,
1.30715, -0.1757182, 2.817815, 0, 0, 0, 1, 1,
1.316694, 0.2031669, 0.3232309, 0, 0, 0, 1, 1,
1.318061, -0.2694429, 1.1391, 0, 0, 0, 1, 1,
1.323604, -0.3924026, 1.633975, 0, 0, 0, 1, 1,
1.334022, -0.7287034, 3.09031, 0, 0, 0, 1, 1,
1.355913, -1.778521, 3.989055, 0, 0, 0, 1, 1,
1.371691, 1.173569, 1.397403, 1, 1, 1, 1, 1,
1.382779, -0.2734437, 1.420961, 1, 1, 1, 1, 1,
1.384754, -1.639035, 2.356458, 1, 1, 1, 1, 1,
1.3898, 0.9322316, 1.172625, 1, 1, 1, 1, 1,
1.391259, 2.367115, -0.7476903, 1, 1, 1, 1, 1,
1.393391, 0.1444403, 1.203145, 1, 1, 1, 1, 1,
1.400151, -0.01994989, 0.2255814, 1, 1, 1, 1, 1,
1.417365, -0.1193349, 2.187569, 1, 1, 1, 1, 1,
1.417577, -0.6129246, 1.997189, 1, 1, 1, 1, 1,
1.417591, -2.001701, 1.634296, 1, 1, 1, 1, 1,
1.420696, -0.6192856, 2.647706, 1, 1, 1, 1, 1,
1.424995, -2.010953, 3.397213, 1, 1, 1, 1, 1,
1.428532, -0.5183608, 3.753543, 1, 1, 1, 1, 1,
1.42866, 0.605979, 2.809813, 1, 1, 1, 1, 1,
1.432931, 0.9974331, 0.977841, 1, 1, 1, 1, 1,
1.439527, 1.405446, 1.567567, 0, 0, 1, 1, 1,
1.446285, 0.9637166, 1.707359, 1, 0, 0, 1, 1,
1.456885, 0.6011906, 1.673599, 1, 0, 0, 1, 1,
1.471327, 0.2674358, 2.649783, 1, 0, 0, 1, 1,
1.479275, -0.8792423, 2.45122, 1, 0, 0, 1, 1,
1.480633, 0.8494126, -0.6552987, 1, 0, 0, 1, 1,
1.50464, 0.4924063, 1.115128, 0, 0, 0, 1, 1,
1.508779, 0.3677566, 1.209732, 0, 0, 0, 1, 1,
1.545051, -1.593358, 2.74207, 0, 0, 0, 1, 1,
1.564061, 1.375325, 2.065372, 0, 0, 0, 1, 1,
1.565766, -1.112137, 0.8820605, 0, 0, 0, 1, 1,
1.567525, 0.6528972, 0.6123725, 0, 0, 0, 1, 1,
1.574548, 0.3783526, 1.535531, 0, 0, 0, 1, 1,
1.57854, 0.253069, 2.179048, 1, 1, 1, 1, 1,
1.607344, -0.693311, 1.736852, 1, 1, 1, 1, 1,
1.630711, -2.205341, 1.517698, 1, 1, 1, 1, 1,
1.63399, 0.2639579, 0.5619047, 1, 1, 1, 1, 1,
1.646838, -0.4310944, 1.689378, 1, 1, 1, 1, 1,
1.662341, -2.191593, 3.093853, 1, 1, 1, 1, 1,
1.668328, 1.690876, 1.502168, 1, 1, 1, 1, 1,
1.669093, -1.371686, 1.517946, 1, 1, 1, 1, 1,
1.699379, 0.4392731, 0.2993624, 1, 1, 1, 1, 1,
1.706503, -1.082094, 1.979616, 1, 1, 1, 1, 1,
1.737613, 0.008620192, 0.9446124, 1, 1, 1, 1, 1,
1.744576, -0.5210535, 0.8260229, 1, 1, 1, 1, 1,
1.747535, 1.680405, -0.3837518, 1, 1, 1, 1, 1,
1.752793, 1.415035, 2.009466, 1, 1, 1, 1, 1,
1.758957, 0.9236543, 1.406688, 1, 1, 1, 1, 1,
1.761987, -1.343348, 1.316894, 0, 0, 1, 1, 1,
1.765723, 1.997306, 1.742751, 1, 0, 0, 1, 1,
1.768743, -1.825831, 1.620045, 1, 0, 0, 1, 1,
1.779677, 0.8592557, 0.5614628, 1, 0, 0, 1, 1,
1.783972, 1.234245, 0.5994125, 1, 0, 0, 1, 1,
1.791538, 0.262399, 1.657413, 1, 0, 0, 1, 1,
1.794394, 0.4422107, 0.9585879, 0, 0, 0, 1, 1,
1.7951, 1.305158, 1.312491, 0, 0, 0, 1, 1,
1.80154, -0.9564481, 2.737303, 0, 0, 0, 1, 1,
1.804214, 1.564536, -0.2103956, 0, 0, 0, 1, 1,
1.808313, -1.191378, 1.9821, 0, 0, 0, 1, 1,
1.833957, -2.400823, 0.2921306, 0, 0, 0, 1, 1,
1.843468, -0.6635659, 1.898723, 0, 0, 0, 1, 1,
1.847647, 0.3401819, 2.091543, 1, 1, 1, 1, 1,
1.851571, -0.9819384, 1.47322, 1, 1, 1, 1, 1,
1.88231, 1.521322, 1.380477, 1, 1, 1, 1, 1,
1.889283, 3.897465, -2.049257, 1, 1, 1, 1, 1,
1.893499, 1.563724, 1.404108, 1, 1, 1, 1, 1,
1.913368, -1.251752, 2.166087, 1, 1, 1, 1, 1,
1.915628, 0.9576048, -0.01653383, 1, 1, 1, 1, 1,
1.930729, -0.7031993, 1.616794, 1, 1, 1, 1, 1,
1.938436, 0.1163178, 1.817638, 1, 1, 1, 1, 1,
1.950636, 1.917261, 0.9738433, 1, 1, 1, 1, 1,
1.954412, 0.3311284, 2.415173, 1, 1, 1, 1, 1,
1.966667, 1.005323, 1.759819, 1, 1, 1, 1, 1,
2.014657, -0.6495278, 3.931335, 1, 1, 1, 1, 1,
2.057085, 1.398198, -0.7449462, 1, 1, 1, 1, 1,
2.057761, 0.4530659, 0.6136746, 1, 1, 1, 1, 1,
2.134541, -0.8791447, 1.949594, 0, 0, 1, 1, 1,
2.136609, -0.05370923, 0.7721067, 1, 0, 0, 1, 1,
2.161084, 0.7257653, 2.000946, 1, 0, 0, 1, 1,
2.182651, -0.9646885, 1.760064, 1, 0, 0, 1, 1,
2.283807, -0.07783295, 0.991985, 1, 0, 0, 1, 1,
2.310747, -0.01907174, 2.35495, 1, 0, 0, 1, 1,
2.324333, -0.2349922, 2.559912, 0, 0, 0, 1, 1,
2.328329, 0.3653209, 1.808046, 0, 0, 0, 1, 1,
2.33905, 1.131612, 0.05966343, 0, 0, 0, 1, 1,
2.349829, 0.6895412, 0.7927981, 0, 0, 0, 1, 1,
2.398637, -0.7870041, 2.220707, 0, 0, 0, 1, 1,
2.414859, 1.147156, -0.4507959, 0, 0, 0, 1, 1,
2.509303, -0.7600228, 2.675351, 0, 0, 0, 1, 1,
2.522661, 0.5197758, 1.775785, 1, 1, 1, 1, 1,
2.619337, -2.34258, 1.344618, 1, 1, 1, 1, 1,
2.663825, -0.4625967, 1.14338, 1, 1, 1, 1, 1,
2.687179, 0.6472596, 2.713636, 1, 1, 1, 1, 1,
2.719919, -0.04685221, 1.160843, 1, 1, 1, 1, 1,
2.754214, -1.437269, 1.06056, 1, 1, 1, 1, 1,
2.867795, -2.00664, 3.102468, 1, 1, 1, 1, 1
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
var radius = 9.786813;
var distance = 34.37576;
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
mvMatrix.translate( 0.256537, -0.5019553, -0.07123375 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.37576);
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
