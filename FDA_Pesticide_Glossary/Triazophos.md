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
-3.02313, -0.9579886, -2.696448, 1, 0, 0, 1,
-2.794922, -0.5667362, -2.371127, 1, 0.007843138, 0, 1,
-2.606976, -1.830276, -3.644024, 1, 0.01176471, 0, 1,
-2.583627, 1.993765, -0.6378369, 1, 0.01960784, 0, 1,
-2.56052, -0.2387215, -1.947343, 1, 0.02352941, 0, 1,
-2.539678, -0.1586479, -1.156151, 1, 0.03137255, 0, 1,
-2.506216, -0.1626386, -1.706743, 1, 0.03529412, 0, 1,
-2.497433, -0.2956546, -1.862357, 1, 0.04313726, 0, 1,
-2.462033, 1.311562, 0.5865935, 1, 0.04705882, 0, 1,
-2.420391, 1.977414, -1.084118, 1, 0.05490196, 0, 1,
-2.418287, -2.682395, -2.939835, 1, 0.05882353, 0, 1,
-2.412791, 0.8635451, -2.130253, 1, 0.06666667, 0, 1,
-2.374147, -1.340977, -1.988859, 1, 0.07058824, 0, 1,
-2.343688, -0.9740124, -1.25966, 1, 0.07843138, 0, 1,
-2.334224, -0.1127823, -1.271706, 1, 0.08235294, 0, 1,
-2.301748, 0.4538254, -1.729813, 1, 0.09019608, 0, 1,
-2.28871, 0.04853442, -1.570307, 1, 0.09411765, 0, 1,
-2.244493, 0.3211212, -1.530721, 1, 0.1019608, 0, 1,
-2.221012, 1.444462, -0.7588204, 1, 0.1098039, 0, 1,
-2.188087, -0.1500139, -1.495504, 1, 0.1137255, 0, 1,
-2.149326, 0.4661568, -1.981205, 1, 0.1215686, 0, 1,
-2.104603, -1.180196, -3.76565, 1, 0.1254902, 0, 1,
-2.104234, -1.734161, -1.609353, 1, 0.1333333, 0, 1,
-2.071765, 0.3941897, -0.1427388, 1, 0.1372549, 0, 1,
-2.068953, -0.8771296, -1.97364, 1, 0.145098, 0, 1,
-2.053767, 0.7495785, -0.6541107, 1, 0.1490196, 0, 1,
-2.039641, 0.2740811, -2.23903, 1, 0.1568628, 0, 1,
-2.018926, 1.010015, -1.231315, 1, 0.1607843, 0, 1,
-1.98734, 0.8148859, -2.119992, 1, 0.1686275, 0, 1,
-1.93847, -0.7817213, -1.790999, 1, 0.172549, 0, 1,
-1.931243, -0.4251599, -2.00679, 1, 0.1803922, 0, 1,
-1.922674, 2.314762, -0.6267872, 1, 0.1843137, 0, 1,
-1.882143, -0.1051612, -0.620191, 1, 0.1921569, 0, 1,
-1.881976, 1.221245, -1.051838, 1, 0.1960784, 0, 1,
-1.878193, 0.0170883, -3.160883, 1, 0.2039216, 0, 1,
-1.873309, -1.730685, -1.062407, 1, 0.2117647, 0, 1,
-1.866171, -1.46787, -0.7952793, 1, 0.2156863, 0, 1,
-1.8477, 1.001692, -4.059053, 1, 0.2235294, 0, 1,
-1.841925, -0.1405486, -1.774166, 1, 0.227451, 0, 1,
-1.840716, 0.3187559, -1.151491, 1, 0.2352941, 0, 1,
-1.828602, 0.3708076, -2.411192, 1, 0.2392157, 0, 1,
-1.827093, -0.725131, -1.477897, 1, 0.2470588, 0, 1,
-1.813702, 0.5784073, -1.511719, 1, 0.2509804, 0, 1,
-1.81005, 0.2639021, -3.589897, 1, 0.2588235, 0, 1,
-1.809512, 1.115657, -2.24083, 1, 0.2627451, 0, 1,
-1.747228, 1.587798, -0.3897456, 1, 0.2705882, 0, 1,
-1.733351, -0.7864559, -2.92257, 1, 0.2745098, 0, 1,
-1.727291, -0.6786614, -1.616658, 1, 0.282353, 0, 1,
-1.681625, -0.1275114, -1.996886, 1, 0.2862745, 0, 1,
-1.646668, -0.1826373, -1.739981, 1, 0.2941177, 0, 1,
-1.641198, 0.4735983, -0.6670743, 1, 0.3019608, 0, 1,
-1.638951, 0.4312771, -1.232073, 1, 0.3058824, 0, 1,
-1.638505, 0.1185261, -2.412137, 1, 0.3137255, 0, 1,
-1.634822, -0.2570201, -2.943248, 1, 0.3176471, 0, 1,
-1.631513, 0.4873238, -2.285598, 1, 0.3254902, 0, 1,
-1.629985, 0.291607, -2.142984, 1, 0.3294118, 0, 1,
-1.629133, 0.8129432, -2.157159, 1, 0.3372549, 0, 1,
-1.628262, 1.104705, -1.307514, 1, 0.3411765, 0, 1,
-1.621519, -0.43546, -0.8878, 1, 0.3490196, 0, 1,
-1.618034, -0.6026148, -0.5383382, 1, 0.3529412, 0, 1,
-1.614095, -1.480019, -2.246632, 1, 0.3607843, 0, 1,
-1.58742, -0.8632987, -1.43597, 1, 0.3647059, 0, 1,
-1.579765, 0.2996583, -2.218586, 1, 0.372549, 0, 1,
-1.578744, -0.6248116, -2.010931, 1, 0.3764706, 0, 1,
-1.558119, 1.458899, -0.9737357, 1, 0.3843137, 0, 1,
-1.558096, -0.06607851, -0.9198604, 1, 0.3882353, 0, 1,
-1.55237, -1.426501, -2.101563, 1, 0.3960784, 0, 1,
-1.545727, 1.191891, -0.5692821, 1, 0.4039216, 0, 1,
-1.531197, 0.4384468, -3.690642, 1, 0.4078431, 0, 1,
-1.522594, 0.9438338, -1.151744, 1, 0.4156863, 0, 1,
-1.519874, 1.122053, -0.524839, 1, 0.4196078, 0, 1,
-1.518182, -0.6343402, -3.22353, 1, 0.427451, 0, 1,
-1.51333, 0.1316952, -1.390827, 1, 0.4313726, 0, 1,
-1.505952, -1.849771, -1.997707, 1, 0.4392157, 0, 1,
-1.495986, -1.684258, -2.560258, 1, 0.4431373, 0, 1,
-1.490329, -3.340453, -1.414158, 1, 0.4509804, 0, 1,
-1.488508, -1.496206, -1.78579, 1, 0.454902, 0, 1,
-1.488114, 2.707718, -0.444265, 1, 0.4627451, 0, 1,
-1.467615, 0.1149422, -1.66957, 1, 0.4666667, 0, 1,
-1.463983, 0.02012119, -3.477519, 1, 0.4745098, 0, 1,
-1.438274, 0.07469355, -1.764376, 1, 0.4784314, 0, 1,
-1.435187, -3.356229, -2.286724, 1, 0.4862745, 0, 1,
-1.412062, -1.051177, -3.088355, 1, 0.4901961, 0, 1,
-1.411763, 0.01327476, -1.627007, 1, 0.4980392, 0, 1,
-1.411232, 1.033144, -1.892759, 1, 0.5058824, 0, 1,
-1.40958, 0.4326099, 0.009845003, 1, 0.509804, 0, 1,
-1.409071, -0.2156744, -0.6650189, 1, 0.5176471, 0, 1,
-1.407193, -0.3097749, -1.892777, 1, 0.5215687, 0, 1,
-1.391422, -0.4358208, -1.423407, 1, 0.5294118, 0, 1,
-1.389974, 0.5417477, -2.197351, 1, 0.5333334, 0, 1,
-1.384469, -0.6176642, -1.962737, 1, 0.5411765, 0, 1,
-1.375254, -0.7838511, -1.23937, 1, 0.5450981, 0, 1,
-1.358616, -0.5963075, -1.173836, 1, 0.5529412, 0, 1,
-1.337869, 2.505481, -1.430822, 1, 0.5568628, 0, 1,
-1.324679, -1.589642, -2.151897, 1, 0.5647059, 0, 1,
-1.303862, 0.4238556, -0.7804661, 1, 0.5686275, 0, 1,
-1.294662, -0.2566272, -0.6979526, 1, 0.5764706, 0, 1,
-1.280169, -1.531278, -4.355807, 1, 0.5803922, 0, 1,
-1.27254, 0.7678532, -0.1015739, 1, 0.5882353, 0, 1,
-1.271179, -2.102219, -2.28664, 1, 0.5921569, 0, 1,
-1.270996, 0.6814737, -1.608648, 1, 0.6, 0, 1,
-1.251327, 1.192407, -1.362832, 1, 0.6078432, 0, 1,
-1.249612, 1.462018, -0.4141055, 1, 0.6117647, 0, 1,
-1.249429, 1.328534, -0.3312896, 1, 0.6196079, 0, 1,
-1.249215, -0.2410629, -1.06508, 1, 0.6235294, 0, 1,
-1.249096, -0.05093935, -2.458207, 1, 0.6313726, 0, 1,
-1.236928, 2.462952, -0.235181, 1, 0.6352941, 0, 1,
-1.234396, -1.146273, -1.968883, 1, 0.6431373, 0, 1,
-1.234065, -0.02109038, -3.320162, 1, 0.6470588, 0, 1,
-1.227605, -0.2912088, -2.219256, 1, 0.654902, 0, 1,
-1.220654, -0.05548886, -2.553704, 1, 0.6588235, 0, 1,
-1.21179, 0.9031184, 0.0210991, 1, 0.6666667, 0, 1,
-1.210407, 0.9464905, -0.2751279, 1, 0.6705883, 0, 1,
-1.20924, 0.6145979, -0.8663067, 1, 0.6784314, 0, 1,
-1.177899, -1.419785, -3.088114, 1, 0.682353, 0, 1,
-1.177616, 0.9345118, -1.796351, 1, 0.6901961, 0, 1,
-1.176251, 0.6716113, -3.994119, 1, 0.6941177, 0, 1,
-1.174556, -1.256258, -3.325114, 1, 0.7019608, 0, 1,
-1.173293, -0.18618, -0.5620615, 1, 0.7098039, 0, 1,
-1.167347, 0.5877856, -0.1578228, 1, 0.7137255, 0, 1,
-1.150319, -1.002268, -3.200787, 1, 0.7215686, 0, 1,
-1.14952, -0.8523778, -0.8664718, 1, 0.7254902, 0, 1,
-1.14652, 0.8464702, -0.005145251, 1, 0.7333333, 0, 1,
-1.143253, 1.187723, -0.5634161, 1, 0.7372549, 0, 1,
-1.142812, 0.5486265, -1.193767, 1, 0.7450981, 0, 1,
-1.142108, -0.2404902, -2.045471, 1, 0.7490196, 0, 1,
-1.140996, -0.3597809, -0.8447341, 1, 0.7568628, 0, 1,
-1.140285, 1.767788, 0.6252175, 1, 0.7607843, 0, 1,
-1.137388, -1.750404, -2.630186, 1, 0.7686275, 0, 1,
-1.125373, -0.3029238, -0.628804, 1, 0.772549, 0, 1,
-1.123376, 0.1267687, -0.2389133, 1, 0.7803922, 0, 1,
-1.115227, -0.8603018, 0.06113036, 1, 0.7843137, 0, 1,
-1.097596, -0.3407045, -3.065317, 1, 0.7921569, 0, 1,
-1.086125, 0.8533515, -1.320496, 1, 0.7960784, 0, 1,
-1.083411, -0.8747522, -3.577696, 1, 0.8039216, 0, 1,
-1.06676, -0.2702276, -3.79844, 1, 0.8117647, 0, 1,
-1.064166, 1.135703, 0.04466102, 1, 0.8156863, 0, 1,
-1.059395, -0.09730899, 0.3443529, 1, 0.8235294, 0, 1,
-1.046092, 1.650897, 0.992169, 1, 0.827451, 0, 1,
-1.045764, -0.8996568, -1.520958, 1, 0.8352941, 0, 1,
-1.045352, 2.212458, -0.5554962, 1, 0.8392157, 0, 1,
-1.045321, 1.28833, -1.512608, 1, 0.8470588, 0, 1,
-1.041171, -0.5430538, -2.009435, 1, 0.8509804, 0, 1,
-1.040736, 0.1217119, -1.037439, 1, 0.8588235, 0, 1,
-1.031165, 0.2684867, -1.72147, 1, 0.8627451, 0, 1,
-1.028861, 0.6413349, -3.449605, 1, 0.8705882, 0, 1,
-1.016079, 1.326899, -0.5554401, 1, 0.8745098, 0, 1,
-1.01025, 0.7678074, -1.670337, 1, 0.8823529, 0, 1,
-1.000417, -0.225536, -3.719076, 1, 0.8862745, 0, 1,
-0.9963447, 0.1587123, -1.495531, 1, 0.8941177, 0, 1,
-0.9926106, 2.109293, -1.418962, 1, 0.8980392, 0, 1,
-0.9910558, 0.4908209, -1.649727, 1, 0.9058824, 0, 1,
-0.9884437, -0.2172018, -3.153398, 1, 0.9137255, 0, 1,
-0.9690264, -0.1884035, -3.264055, 1, 0.9176471, 0, 1,
-0.9669394, 0.7943352, -0.06366293, 1, 0.9254902, 0, 1,
-0.9601665, -0.5195782, -2.607139, 1, 0.9294118, 0, 1,
-0.9544472, 0.5487778, -1.394106, 1, 0.9372549, 0, 1,
-0.9521163, 0.1512242, 0.1382763, 1, 0.9411765, 0, 1,
-0.9490834, -1.794519, -2.021026, 1, 0.9490196, 0, 1,
-0.9458483, 0.6811904, -1.103176, 1, 0.9529412, 0, 1,
-0.9458255, -0.5301329, -1.006874, 1, 0.9607843, 0, 1,
-0.9441707, 1.001711, -0.3156225, 1, 0.9647059, 0, 1,
-0.9422793, -0.330102, -1.789835, 1, 0.972549, 0, 1,
-0.941238, -1.46508, -2.526794, 1, 0.9764706, 0, 1,
-0.9395341, -0.4694692, -4.480506, 1, 0.9843137, 0, 1,
-0.9384692, 0.895408, 0.7278336, 1, 0.9882353, 0, 1,
-0.9247727, 1.656427, -0.6358155, 1, 0.9960784, 0, 1,
-0.9169106, 0.4732903, 0.07191102, 0.9960784, 1, 0, 1,
-0.9158908, 1.035533, -1.457314, 0.9921569, 1, 0, 1,
-0.9107554, 1.34307, -0.346408, 0.9843137, 1, 0, 1,
-0.908334, 0.3293878, -2.843464, 0.9803922, 1, 0, 1,
-0.9065299, 0.1743725, -1.983276, 0.972549, 1, 0, 1,
-0.900003, -0.1191548, -1.237863, 0.9686275, 1, 0, 1,
-0.8946933, 2.114917, -0.541868, 0.9607843, 1, 0, 1,
-0.8812444, -1.356119, -1.863678, 0.9568627, 1, 0, 1,
-0.8761164, -1.239739, -2.464318, 0.9490196, 1, 0, 1,
-0.86957, -0.6939066, -2.762806, 0.945098, 1, 0, 1,
-0.8680431, -0.5411204, -2.693673, 0.9372549, 1, 0, 1,
-0.8676788, 0.2339354, -2.287855, 0.9333333, 1, 0, 1,
-0.8582653, -0.9343205, -2.20309, 0.9254902, 1, 0, 1,
-0.8570654, -0.5327822, -1.169855, 0.9215686, 1, 0, 1,
-0.855827, -1.025696, -2.537644, 0.9137255, 1, 0, 1,
-0.8542953, 0.03179305, -0.4106078, 0.9098039, 1, 0, 1,
-0.8533019, -1.363081, -2.271254, 0.9019608, 1, 0, 1,
-0.8524126, -1.022567, -1.072037, 0.8941177, 1, 0, 1,
-0.8509032, 1.01833, -1.238983, 0.8901961, 1, 0, 1,
-0.8486398, 0.1284165, -0.991264, 0.8823529, 1, 0, 1,
-0.8471169, -0.2219425, -0.214631, 0.8784314, 1, 0, 1,
-0.8441418, -0.08163751, -0.2570909, 0.8705882, 1, 0, 1,
-0.8369233, -0.6469029, -4.196062, 0.8666667, 1, 0, 1,
-0.8283862, 0.9982592, -0.911902, 0.8588235, 1, 0, 1,
-0.8269935, 1.122773, -0.7436727, 0.854902, 1, 0, 1,
-0.8119677, -0.6350619, -3.649486, 0.8470588, 1, 0, 1,
-0.8064837, 0.4337593, -0.9215744, 0.8431373, 1, 0, 1,
-0.8063549, -1.320672, -2.080467, 0.8352941, 1, 0, 1,
-0.8037319, -0.3602549, -2.689345, 0.8313726, 1, 0, 1,
-0.8030033, 0.1992338, -1.792989, 0.8235294, 1, 0, 1,
-0.8009448, -1.235349, -2.335444, 0.8196079, 1, 0, 1,
-0.797851, 1.981972, -0.3407555, 0.8117647, 1, 0, 1,
-0.7959781, 1.446634, -0.902488, 0.8078431, 1, 0, 1,
-0.7870152, -0.1862459, -0.8488653, 0.8, 1, 0, 1,
-0.7867342, -0.4814792, -4.217841, 0.7921569, 1, 0, 1,
-0.7822479, 2.058561, 0.667431, 0.7882353, 1, 0, 1,
-0.7783458, -1.155618, -3.754621, 0.7803922, 1, 0, 1,
-0.7756555, -1.321066, -1.924909, 0.7764706, 1, 0, 1,
-0.7736878, 1.665839, -0.162352, 0.7686275, 1, 0, 1,
-0.7711865, 0.6456287, -1.665368, 0.7647059, 1, 0, 1,
-0.7618684, 0.439235, -0.7235143, 0.7568628, 1, 0, 1,
-0.7610924, -0.5237559, -3.53989, 0.7529412, 1, 0, 1,
-0.7589934, -1.19636, -3.121226, 0.7450981, 1, 0, 1,
-0.7577723, 0.6174737, -0.07828718, 0.7411765, 1, 0, 1,
-0.7515898, 2.119032, -0.4755583, 0.7333333, 1, 0, 1,
-0.7484897, 0.6576464, -0.6843366, 0.7294118, 1, 0, 1,
-0.748378, 1.630981, 0.7286142, 0.7215686, 1, 0, 1,
-0.7470358, -0.01108999, 0.2178398, 0.7176471, 1, 0, 1,
-0.7463131, 0.1854983, -0.7822506, 0.7098039, 1, 0, 1,
-0.7462366, -0.2314537, -2.540411, 0.7058824, 1, 0, 1,
-0.7424512, -0.6371244, -1.491568, 0.6980392, 1, 0, 1,
-0.7421996, -0.7648082, -3.487199, 0.6901961, 1, 0, 1,
-0.7407289, 0.06531484, -2.388632, 0.6862745, 1, 0, 1,
-0.7369564, -0.4952583, -3.342487, 0.6784314, 1, 0, 1,
-0.7365522, -0.6328279, -1.403767, 0.6745098, 1, 0, 1,
-0.7294357, 0.6428758, -0.8050889, 0.6666667, 1, 0, 1,
-0.7287204, 1.156165, -0.644011, 0.6627451, 1, 0, 1,
-0.7269261, 0.3107125, -0.6307884, 0.654902, 1, 0, 1,
-0.7214577, 0.1297424, -0.1730825, 0.6509804, 1, 0, 1,
-0.7148029, 1.004097, -0.9430003, 0.6431373, 1, 0, 1,
-0.7120791, 0.3749967, -3.024983, 0.6392157, 1, 0, 1,
-0.7102094, 0.4160262, -1.217273, 0.6313726, 1, 0, 1,
-0.7093628, 1.15185, -0.6640224, 0.627451, 1, 0, 1,
-0.706131, 0.9595198, -0.637013, 0.6196079, 1, 0, 1,
-0.7060477, -0.7072693, -1.426705, 0.6156863, 1, 0, 1,
-0.7032757, -0.07501943, -1.036272, 0.6078432, 1, 0, 1,
-0.7017877, 0.6968922, 0.03324549, 0.6039216, 1, 0, 1,
-0.6989672, 0.2457105, 0.3961579, 0.5960785, 1, 0, 1,
-0.6944903, -0.2760946, -1.533085, 0.5882353, 1, 0, 1,
-0.6873839, -0.5001151, -1.684411, 0.5843138, 1, 0, 1,
-0.6863648, -1.79086, -1.440642, 0.5764706, 1, 0, 1,
-0.6833696, -0.5838357, -1.496238, 0.572549, 1, 0, 1,
-0.6806597, -0.02898151, -1.281628, 0.5647059, 1, 0, 1,
-0.668566, -0.8324983, -2.090022, 0.5607843, 1, 0, 1,
-0.6624275, 0.2333784, -1.933877, 0.5529412, 1, 0, 1,
-0.6557136, 1.042861, 0.8986675, 0.5490196, 1, 0, 1,
-0.6527916, 0.3265161, -0.2656986, 0.5411765, 1, 0, 1,
-0.6524028, 0.3534937, -0.8779042, 0.5372549, 1, 0, 1,
-0.6502351, 0.5305761, -2.403909, 0.5294118, 1, 0, 1,
-0.6478125, -1.120233, -2.596376, 0.5254902, 1, 0, 1,
-0.6449327, 0.7757495, -0.826515, 0.5176471, 1, 0, 1,
-0.6446469, 0.8015302, -0.01231742, 0.5137255, 1, 0, 1,
-0.6394444, 0.1168266, -1.412369, 0.5058824, 1, 0, 1,
-0.6368769, 1.208699, -0.667756, 0.5019608, 1, 0, 1,
-0.6344181, -0.7806726, -2.228723, 0.4941176, 1, 0, 1,
-0.6293895, -1.125329, -3.00626, 0.4862745, 1, 0, 1,
-0.6284577, -0.2636515, -2.042285, 0.4823529, 1, 0, 1,
-0.6260664, 0.520291, -1.469156, 0.4745098, 1, 0, 1,
-0.6258366, 1.646401, -0.4173067, 0.4705882, 1, 0, 1,
-0.6247219, -0.5110453, -3.104871, 0.4627451, 1, 0, 1,
-0.6225656, -1.815588, -1.369171, 0.4588235, 1, 0, 1,
-0.6200855, 1.268853, -0.4232523, 0.4509804, 1, 0, 1,
-0.613677, 0.4786223, -0.9244764, 0.4470588, 1, 0, 1,
-0.6120926, 0.3307092, -1.830185, 0.4392157, 1, 0, 1,
-0.6104784, -0.5922289, -3.251679, 0.4352941, 1, 0, 1,
-0.6096284, 1.099195, 0.3789746, 0.427451, 1, 0, 1,
-0.6087905, 1.291511, 0.7072434, 0.4235294, 1, 0, 1,
-0.6038835, -1.406034, -3.277368, 0.4156863, 1, 0, 1,
-0.6023492, 2.366124, 0.3086337, 0.4117647, 1, 0, 1,
-0.5961615, -0.1527473, -1.13359, 0.4039216, 1, 0, 1,
-0.5958821, 0.890966, 0.6591842, 0.3960784, 1, 0, 1,
-0.5935189, 0.4182958, -2.817445, 0.3921569, 1, 0, 1,
-0.592345, 0.569782, -0.2307826, 0.3843137, 1, 0, 1,
-0.590398, 0.2011677, 0.4015714, 0.3803922, 1, 0, 1,
-0.5887429, 0.594734, -0.3245455, 0.372549, 1, 0, 1,
-0.5789902, -2.007773, -3.651957, 0.3686275, 1, 0, 1,
-0.5782532, -0.6561577, -4.169281, 0.3607843, 1, 0, 1,
-0.5752182, -0.2222908, -1.138703, 0.3568628, 1, 0, 1,
-0.5691591, -0.7350186, -1.233864, 0.3490196, 1, 0, 1,
-0.5680788, -1.239823, -1.121359, 0.345098, 1, 0, 1,
-0.5666915, -1.506205, -1.858007, 0.3372549, 1, 0, 1,
-0.5504865, 0.06326956, -1.592716, 0.3333333, 1, 0, 1,
-0.540565, -0.9529305, -3.298926, 0.3254902, 1, 0, 1,
-0.5400116, -0.3655857, -2.190367, 0.3215686, 1, 0, 1,
-0.5357482, 0.3763532, -0.3071337, 0.3137255, 1, 0, 1,
-0.530323, 0.02120887, 0.2300622, 0.3098039, 1, 0, 1,
-0.523966, 0.9572225, -0.8926806, 0.3019608, 1, 0, 1,
-0.5238193, -0.1856944, -1.290619, 0.2941177, 1, 0, 1,
-0.5230872, 1.130122, -1.029182, 0.2901961, 1, 0, 1,
-0.5205785, -0.3214534, -0.6750419, 0.282353, 1, 0, 1,
-0.5176259, -0.8078012, -1.611601, 0.2784314, 1, 0, 1,
-0.5155594, 0.4617868, -0.9255581, 0.2705882, 1, 0, 1,
-0.5112716, -0.1832582, -4.664702, 0.2666667, 1, 0, 1,
-0.5066719, -1.008628, -2.806828, 0.2588235, 1, 0, 1,
-0.5053576, 0.7256233, 0.05831952, 0.254902, 1, 0, 1,
-0.5040225, 2.164537, 1.21724, 0.2470588, 1, 0, 1,
-0.5035836, -0.9658005, -2.783402, 0.2431373, 1, 0, 1,
-0.5017801, 0.5771195, -0.7122918, 0.2352941, 1, 0, 1,
-0.5016469, -0.262339, -1.964714, 0.2313726, 1, 0, 1,
-0.5000057, 0.2379304, -0.01102064, 0.2235294, 1, 0, 1,
-0.4964809, -0.7173123, -2.610867, 0.2196078, 1, 0, 1,
-0.494768, 0.4576582, -0.3435195, 0.2117647, 1, 0, 1,
-0.4943034, -0.2662684, -2.702673, 0.2078431, 1, 0, 1,
-0.4922177, -0.2593692, -0.7827669, 0.2, 1, 0, 1,
-0.4895959, 0.9918026, 0.6222147, 0.1921569, 1, 0, 1,
-0.4876881, -0.03709034, -2.688039, 0.1882353, 1, 0, 1,
-0.4872872, 0.07047591, -1.346006, 0.1803922, 1, 0, 1,
-0.486457, 0.4048515, 0.3341102, 0.1764706, 1, 0, 1,
-0.4840732, -0.52458, -3.114391, 0.1686275, 1, 0, 1,
-0.4826835, -0.478085, -1.017384, 0.1647059, 1, 0, 1,
-0.4813786, 1.073477, -2.403049, 0.1568628, 1, 0, 1,
-0.4742305, 0.2268452, 0.1036499, 0.1529412, 1, 0, 1,
-0.4725797, 0.5685918, -0.9488093, 0.145098, 1, 0, 1,
-0.4717664, -0.3196766, -2.441163, 0.1411765, 1, 0, 1,
-0.4709989, 1.149322, -0.1736459, 0.1333333, 1, 0, 1,
-0.4614891, 1.119371, 0.2699962, 0.1294118, 1, 0, 1,
-0.4598111, 1.392785, 0.08800872, 0.1215686, 1, 0, 1,
-0.4561674, -0.002853785, -1.740791, 0.1176471, 1, 0, 1,
-0.4550126, -0.6574006, -0.9049269, 0.1098039, 1, 0, 1,
-0.4549935, 0.1293311, -2.747723, 0.1058824, 1, 0, 1,
-0.452969, -0.9399028, -1.679176, 0.09803922, 1, 0, 1,
-0.4506503, 0.3020148, -1.275209, 0.09019608, 1, 0, 1,
-0.4505338, -1.676914, -2.221037, 0.08627451, 1, 0, 1,
-0.4490573, 1.167151, -0.07658809, 0.07843138, 1, 0, 1,
-0.4489199, -0.008103764, -2.8881, 0.07450981, 1, 0, 1,
-0.4488417, 0.3394569, -0.762266, 0.06666667, 1, 0, 1,
-0.4438868, 1.099481, -1.789672, 0.0627451, 1, 0, 1,
-0.4422184, -1.604177, -4.092577, 0.05490196, 1, 0, 1,
-0.4391901, 1.230231, -0.2224883, 0.05098039, 1, 0, 1,
-0.4379348, -1.175393, -4.100543, 0.04313726, 1, 0, 1,
-0.4356863, -0.02853685, -0.7780439, 0.03921569, 1, 0, 1,
-0.4293733, 0.1161566, -2.726116, 0.03137255, 1, 0, 1,
-0.4292553, 1.232181, -0.05025326, 0.02745098, 1, 0, 1,
-0.425271, -1.151418, -3.749676, 0.01960784, 1, 0, 1,
-0.4181329, 0.472514, -2.11896, 0.01568628, 1, 0, 1,
-0.4171411, 0.9823354, -1.11932, 0.007843138, 1, 0, 1,
-0.4140205, -0.8627728, -1.946302, 0.003921569, 1, 0, 1,
-0.4125802, 0.3823339, -1.880337, 0, 1, 0.003921569, 1,
-0.4094269, -0.07216742, -2.138306, 0, 1, 0.01176471, 1,
-0.4093451, -0.8760603, -3.179027, 0, 1, 0.01568628, 1,
-0.4072098, 1.592664, -0.3846699, 0, 1, 0.02352941, 1,
-0.3989036, 0.1809777, -2.110893, 0, 1, 0.02745098, 1,
-0.3986511, 2.396059, 0.02289123, 0, 1, 0.03529412, 1,
-0.3947661, 1.735799, -0.8309273, 0, 1, 0.03921569, 1,
-0.3915247, -0.6974967, -3.401308, 0, 1, 0.04705882, 1,
-0.3872047, 1.670405, 0.7647012, 0, 1, 0.05098039, 1,
-0.3869343, -0.9527893, -2.254256, 0, 1, 0.05882353, 1,
-0.3866211, -1.019948, -2.841012, 0, 1, 0.0627451, 1,
-0.3860117, -1.105969, -3.811017, 0, 1, 0.07058824, 1,
-0.3798182, 0.3489649, -1.452608, 0, 1, 0.07450981, 1,
-0.379122, 2.006548, 0.01307985, 0, 1, 0.08235294, 1,
-0.3776614, 1.021751, -0.5117443, 0, 1, 0.08627451, 1,
-0.3748071, 0.7780416, -0.08623688, 0, 1, 0.09411765, 1,
-0.3727995, 1.605281, 0.04266656, 0, 1, 0.1019608, 1,
-0.361009, 0.2195003, -1.128807, 0, 1, 0.1058824, 1,
-0.3586619, -0.06210948, -1.523804, 0, 1, 0.1137255, 1,
-0.354743, -2.52165, -3.576907, 0, 1, 0.1176471, 1,
-0.3546848, -1.563236, -2.001359, 0, 1, 0.1254902, 1,
-0.3531874, -0.9849672, -2.005702, 0, 1, 0.1294118, 1,
-0.3525082, 0.8040665, -1.009137, 0, 1, 0.1372549, 1,
-0.3493681, 0.5868806, -1.820855, 0, 1, 0.1411765, 1,
-0.3484997, 0.1915246, -1.815943, 0, 1, 0.1490196, 1,
-0.3481448, -0.9010821, -1.50384, 0, 1, 0.1529412, 1,
-0.347997, 1.008222, -1.304326, 0, 1, 0.1607843, 1,
-0.3396604, -0.7050832, -3.052355, 0, 1, 0.1647059, 1,
-0.3297086, -1.265284, -2.574374, 0, 1, 0.172549, 1,
-0.3210113, -0.6993153, -3.270901, 0, 1, 0.1764706, 1,
-0.3165372, -0.6531179, -3.010537, 0, 1, 0.1843137, 1,
-0.3151571, 0.5048708, -0.2742646, 0, 1, 0.1882353, 1,
-0.3050889, 1.144941, -0.7765582, 0, 1, 0.1960784, 1,
-0.2949639, 0.2320498, -0.966957, 0, 1, 0.2039216, 1,
-0.294882, 1.464257, 0.03227318, 0, 1, 0.2078431, 1,
-0.2947686, -0.9719979, -1.294752, 0, 1, 0.2156863, 1,
-0.2934785, -0.6039957, -5.51864, 0, 1, 0.2196078, 1,
-0.2893416, 0.3419277, -0.1855719, 0, 1, 0.227451, 1,
-0.289139, 0.7338106, -1.022134, 0, 1, 0.2313726, 1,
-0.2830854, -0.08222977, -3.873364, 0, 1, 0.2392157, 1,
-0.2814194, 0.9378135, -0.5482816, 0, 1, 0.2431373, 1,
-0.2784849, 0.745478, -0.9726425, 0, 1, 0.2509804, 1,
-0.2771632, -0.2351688, -1.8168, 0, 1, 0.254902, 1,
-0.2768266, 0.006781713, -1.71141, 0, 1, 0.2627451, 1,
-0.2763286, -0.9931167, -1.49166, 0, 1, 0.2666667, 1,
-0.2742873, 1.323641, 0.6607593, 0, 1, 0.2745098, 1,
-0.2739657, 0.7309092, -0.5206142, 0, 1, 0.2784314, 1,
-0.2722053, 1.085742, -1.123878, 0, 1, 0.2862745, 1,
-0.271751, -1.484983, -2.327816, 0, 1, 0.2901961, 1,
-0.2713331, -0.6024886, -3.673112, 0, 1, 0.2980392, 1,
-0.266434, 0.6500784, -0.4584564, 0, 1, 0.3058824, 1,
-0.2630039, -1.059784, -2.86125, 0, 1, 0.3098039, 1,
-0.2627257, -1.329376, -1.206191, 0, 1, 0.3176471, 1,
-0.2626425, 0.4709498, 0.022585, 0, 1, 0.3215686, 1,
-0.2597419, -0.6251788, -2.833174, 0, 1, 0.3294118, 1,
-0.2488884, 0.4535723, -1.086298, 0, 1, 0.3333333, 1,
-0.2408084, 0.4724219, -0.8800156, 0, 1, 0.3411765, 1,
-0.2350428, 0.07014445, 0.4752401, 0, 1, 0.345098, 1,
-0.2332199, -1.234538, -1.853725, 0, 1, 0.3529412, 1,
-0.2317774, -0.06582855, -3.038813, 0, 1, 0.3568628, 1,
-0.2290334, 0.6412266, -1.744459, 0, 1, 0.3647059, 1,
-0.2288734, 0.1856851, -0.2333206, 0, 1, 0.3686275, 1,
-0.2273696, 1.53917, 0.03985348, 0, 1, 0.3764706, 1,
-0.2265369, 1.862699, -0.7069765, 0, 1, 0.3803922, 1,
-0.2243859, -1.079618, -3.667184, 0, 1, 0.3882353, 1,
-0.2239699, 0.721611, -0.2243009, 0, 1, 0.3921569, 1,
-0.2231836, -1.12064, -2.359039, 0, 1, 0.4, 1,
-0.2187034, 0.4692554, 0.02399324, 0, 1, 0.4078431, 1,
-0.218489, 2.255969, 1.129122, 0, 1, 0.4117647, 1,
-0.2164688, -0.187385, -2.289809, 0, 1, 0.4196078, 1,
-0.2106669, 2.006998, -1.243642, 0, 1, 0.4235294, 1,
-0.2020771, -0.3534881, -3.037808, 0, 1, 0.4313726, 1,
-0.1981207, 0.6713246, 1.328946, 0, 1, 0.4352941, 1,
-0.1976656, -0.5478187, -4.160381, 0, 1, 0.4431373, 1,
-0.1960481, -0.8246377, -4.516848, 0, 1, 0.4470588, 1,
-0.1903408, 0.1944445, -2.470526, 0, 1, 0.454902, 1,
-0.1898061, -0.06331012, -1.995847, 0, 1, 0.4588235, 1,
-0.1857903, -0.4047151, -2.706048, 0, 1, 0.4666667, 1,
-0.1855253, -0.8181886, -3.607126, 0, 1, 0.4705882, 1,
-0.1840175, 0.4707703, -0.9662708, 0, 1, 0.4784314, 1,
-0.1838561, 2.291652, -0.4633479, 0, 1, 0.4823529, 1,
-0.183414, 0.06977613, -0.9720333, 0, 1, 0.4901961, 1,
-0.1828519, -1.224896, -4.059132, 0, 1, 0.4941176, 1,
-0.1802191, -1.055807, -2.654907, 0, 1, 0.5019608, 1,
-0.1779945, 1.815803, 2.325235, 0, 1, 0.509804, 1,
-0.1724477, 2.154643, -0.14762, 0, 1, 0.5137255, 1,
-0.1679301, -0.899183, -2.76767, 0, 1, 0.5215687, 1,
-0.1655527, -0.8487168, -2.427879, 0, 1, 0.5254902, 1,
-0.1634424, 1.875921, 0.006413863, 0, 1, 0.5333334, 1,
-0.1627033, -1.675756, -2.839532, 0, 1, 0.5372549, 1,
-0.1624077, 0.461845, -0.4474086, 0, 1, 0.5450981, 1,
-0.1608689, -0.3824992, -3.022017, 0, 1, 0.5490196, 1,
-0.158371, -0.8067617, -2.948226, 0, 1, 0.5568628, 1,
-0.1551094, -0.05046022, -2.991598, 0, 1, 0.5607843, 1,
-0.1542215, -0.3787159, -2.764245, 0, 1, 0.5686275, 1,
-0.1488921, 0.5960202, 0.6148471, 0, 1, 0.572549, 1,
-0.1486736, -0.359351, -4.386135, 0, 1, 0.5803922, 1,
-0.1465171, 0.4801033, 0.3880605, 0, 1, 0.5843138, 1,
-0.1461977, -0.318716, -1.773796, 0, 1, 0.5921569, 1,
-0.1449579, -0.5093607, -1.256531, 0, 1, 0.5960785, 1,
-0.1427856, -0.6563791, -1.955693, 0, 1, 0.6039216, 1,
-0.1391375, -0.428, -3.064478, 0, 1, 0.6117647, 1,
-0.1372755, -0.05001736, -1.248855, 0, 1, 0.6156863, 1,
-0.1366478, -0.5756266, -3.847035, 0, 1, 0.6235294, 1,
-0.1361759, 0.1892019, -2.341411, 0, 1, 0.627451, 1,
-0.1316531, -0.5372701, -3.097746, 0, 1, 0.6352941, 1,
-0.1295148, 0.9957372, 0.4222515, 0, 1, 0.6392157, 1,
-0.1257059, -1.337917, -3.114862, 0, 1, 0.6470588, 1,
-0.118566, 1.287769, 0.3446212, 0, 1, 0.6509804, 1,
-0.1162618, 0.5783034, 0.5994703, 0, 1, 0.6588235, 1,
-0.1159035, -0.0643006, -1.141574, 0, 1, 0.6627451, 1,
-0.115096, 1.385847, -0.7904605, 0, 1, 0.6705883, 1,
-0.1138723, 0.0419614, -2.270532, 0, 1, 0.6745098, 1,
-0.1123754, -0.6049325, -2.948363, 0, 1, 0.682353, 1,
-0.1116765, 1.318468, -1.673714, 0, 1, 0.6862745, 1,
-0.109781, -0.6247901, -3.095701, 0, 1, 0.6941177, 1,
-0.1090471, 0.1702825, -0.3066053, 0, 1, 0.7019608, 1,
-0.1013609, 1.712681, -0.05556871, 0, 1, 0.7058824, 1,
-0.09927675, 1.327655, -0.5744001, 0, 1, 0.7137255, 1,
-0.09475558, -1.118456, -3.58742, 0, 1, 0.7176471, 1,
-0.09365222, -0.746944, -2.343886, 0, 1, 0.7254902, 1,
-0.09151208, -0.2037065, -1.389193, 0, 1, 0.7294118, 1,
-0.09129921, 0.4710378, -0.529485, 0, 1, 0.7372549, 1,
-0.08886509, -0.0142758, -2.79305, 0, 1, 0.7411765, 1,
-0.08872819, -0.5796556, -1.571705, 0, 1, 0.7490196, 1,
-0.08442152, 0.7343636, 0.5873207, 0, 1, 0.7529412, 1,
-0.08367542, -0.7430743, -4.129133, 0, 1, 0.7607843, 1,
-0.08357345, 0.8164556, 0.6995723, 0, 1, 0.7647059, 1,
-0.08189407, 0.9543468, 0.5759134, 0, 1, 0.772549, 1,
-0.0812524, 0.1809056, -3.122985, 0, 1, 0.7764706, 1,
-0.08113268, 0.3070328, 0.4934615, 0, 1, 0.7843137, 1,
-0.0773894, -0.009459546, -1.35016, 0, 1, 0.7882353, 1,
-0.0768786, -0.1322574, -1.648027, 0, 1, 0.7960784, 1,
-0.07589772, -0.6502624, -3.664167, 0, 1, 0.8039216, 1,
-0.07493091, 0.197056, -0.0169767, 0, 1, 0.8078431, 1,
-0.07437005, 0.02332428, -1.213197, 0, 1, 0.8156863, 1,
-0.07293041, -2.008133, -4.025002, 0, 1, 0.8196079, 1,
-0.07129611, 0.08802408, -0.213228, 0, 1, 0.827451, 1,
-0.06511227, -2.14357, -3.954272, 0, 1, 0.8313726, 1,
-0.05751776, -0.1152762, -2.753139, 0, 1, 0.8392157, 1,
-0.05646571, -0.9811037, -2.307075, 0, 1, 0.8431373, 1,
-0.05333618, -1.188262, -2.871323, 0, 1, 0.8509804, 1,
-0.05193867, -0.4308603, -3.6055, 0, 1, 0.854902, 1,
-0.05013004, -1.346076, -1.638921, 0, 1, 0.8627451, 1,
-0.04940629, -0.05965815, -2.425785, 0, 1, 0.8666667, 1,
-0.04724498, 1.457822, -0.8102342, 0, 1, 0.8745098, 1,
-0.0451498, 0.4894964, 0.4422741, 0, 1, 0.8784314, 1,
-0.04421016, -0.4334082, -2.6065, 0, 1, 0.8862745, 1,
-0.04325922, 0.4589373, -0.6013665, 0, 1, 0.8901961, 1,
-0.04316112, -0.1185327, -2.243868, 0, 1, 0.8980392, 1,
-0.03855322, -0.04497666, -3.249619, 0, 1, 0.9058824, 1,
-0.03817918, -1.034731, -3.787776, 0, 1, 0.9098039, 1,
-0.0354708, -1.798845, -3.099709, 0, 1, 0.9176471, 1,
-0.03498884, -0.4212653, -3.934616, 0, 1, 0.9215686, 1,
-0.03185487, -2.104894, -2.44314, 0, 1, 0.9294118, 1,
-0.03143284, -1.171417, -2.996588, 0, 1, 0.9333333, 1,
-0.02688457, 0.006979321, 0.2197932, 0, 1, 0.9411765, 1,
-0.02612109, -0.7074647, -2.985811, 0, 1, 0.945098, 1,
-0.01756093, -1.082751, -1.446474, 0, 1, 0.9529412, 1,
-0.01559204, 0.6532908, -0.4072638, 0, 1, 0.9568627, 1,
-0.01143304, -0.3056867, -3.049233, 0, 1, 0.9647059, 1,
-0.006701931, -0.6192331, -3.149328, 0, 1, 0.9686275, 1,
-0.005969516, 0.002857264, -1.377298, 0, 1, 0.9764706, 1,
-0.005948505, 1.499977, 0.1840248, 0, 1, 0.9803922, 1,
-0.001951791, 1.489243, 0.01097337, 0, 1, 0.9882353, 1,
0.0009932152, 1.298126, -0.3294237, 0, 1, 0.9921569, 1,
0.008624258, 0.1291694, -0.5842142, 0, 1, 1, 1,
0.009917576, -0.2488736, 2.942385, 0, 0.9921569, 1, 1,
0.01357977, -1.440016, 4.605875, 0, 0.9882353, 1, 1,
0.01375323, 1.973687, 0.2984792, 0, 0.9803922, 1, 1,
0.0138461, 0.8194944, 0.7970831, 0, 0.9764706, 1, 1,
0.01726018, -0.4545258, 2.464445, 0, 0.9686275, 1, 1,
0.0209654, 0.9578925, 0.5561767, 0, 0.9647059, 1, 1,
0.02364752, 0.1683494, 1.299362, 0, 0.9568627, 1, 1,
0.02522287, 0.3189719, 0.1684869, 0, 0.9529412, 1, 1,
0.02547059, -0.1637211, 2.683994, 0, 0.945098, 1, 1,
0.02903224, -1.954258, 2.919542, 0, 0.9411765, 1, 1,
0.03107357, 0.442967, 0.3522359, 0, 0.9333333, 1, 1,
0.03224555, -0.5979276, 2.780169, 0, 0.9294118, 1, 1,
0.03393419, 0.7584044, 0.4833013, 0, 0.9215686, 1, 1,
0.03524181, -1.008947, 3.24792, 0, 0.9176471, 1, 1,
0.03906564, 0.9066319, 0.9830992, 0, 0.9098039, 1, 1,
0.04120695, -0.457034, 1.752546, 0, 0.9058824, 1, 1,
0.04130711, 0.2980421, 0.4983779, 0, 0.8980392, 1, 1,
0.04457093, 0.6527836, -0.350586, 0, 0.8901961, 1, 1,
0.04461985, -0.3412706, 3.422301, 0, 0.8862745, 1, 1,
0.04682083, -0.8684897, 2.94867, 0, 0.8784314, 1, 1,
0.04817759, 0.6506622, -1.326392, 0, 0.8745098, 1, 1,
0.04884546, -1.693915, 3.916905, 0, 0.8666667, 1, 1,
0.05029678, -0.2432707, 2.494789, 0, 0.8627451, 1, 1,
0.05165556, -1.518547, 4.090115, 0, 0.854902, 1, 1,
0.05223983, 0.9109568, -1.060971, 0, 0.8509804, 1, 1,
0.05665926, -0.7391534, 0.7831657, 0, 0.8431373, 1, 1,
0.06040847, 0.8082978, 0.3008364, 0, 0.8392157, 1, 1,
0.06051487, -1.832409, 1.148435, 0, 0.8313726, 1, 1,
0.06396914, 0.9417785, -0.2589293, 0, 0.827451, 1, 1,
0.06863888, -0.9456457, 3.680707, 0, 0.8196079, 1, 1,
0.07077815, 0.7089286, -0.3213638, 0, 0.8156863, 1, 1,
0.07544947, 0.2638548, 2.607193, 0, 0.8078431, 1, 1,
0.0780837, -0.01556463, 1.263563, 0, 0.8039216, 1, 1,
0.08107967, -0.9009866, 4.451202, 0, 0.7960784, 1, 1,
0.08810156, -1.195342, 1.7821, 0, 0.7882353, 1, 1,
0.08903649, 0.08557171, 1.756547, 0, 0.7843137, 1, 1,
0.08999939, -0.5843333, 2.475171, 0, 0.7764706, 1, 1,
0.09090099, 0.7639657, -0.4757473, 0, 0.772549, 1, 1,
0.09181117, -0.1658587, 2.065556, 0, 0.7647059, 1, 1,
0.09460493, -2.131771, 3.924166, 0, 0.7607843, 1, 1,
0.09758244, 1.201954, -0.7909389, 0, 0.7529412, 1, 1,
0.1056939, 0.1713047, -0.3304844, 0, 0.7490196, 1, 1,
0.1095217, -0.4316076, 4.203037, 0, 0.7411765, 1, 1,
0.1102377, -0.6403976, 2.944808, 0, 0.7372549, 1, 1,
0.1104581, 0.2732782, -2.55818, 0, 0.7294118, 1, 1,
0.1107955, -0.6513995, 3.684021, 0, 0.7254902, 1, 1,
0.1110268, 0.4460452, -0.9129124, 0, 0.7176471, 1, 1,
0.1256489, 1.332083, -1.542237, 0, 0.7137255, 1, 1,
0.1260977, 0.4786284, 0.102578, 0, 0.7058824, 1, 1,
0.1288002, 2.280941, -0.39474, 0, 0.6980392, 1, 1,
0.1295833, 1.016933, 0.08078147, 0, 0.6941177, 1, 1,
0.130323, 0.7270362, 0.3696882, 0, 0.6862745, 1, 1,
0.1329021, 2.036837, 0.7391256, 0, 0.682353, 1, 1,
0.1329573, 0.7596396, -1.735496, 0, 0.6745098, 1, 1,
0.1373899, -1.211052, 2.045116, 0, 0.6705883, 1, 1,
0.1407137, 0.02342283, 3.420968, 0, 0.6627451, 1, 1,
0.1416266, -0.209151, 3.119254, 0, 0.6588235, 1, 1,
0.1424961, 2.148281, -1.147852, 0, 0.6509804, 1, 1,
0.1445417, -0.8370027, 2.988273, 0, 0.6470588, 1, 1,
0.1455945, -0.1914212, 2.036981, 0, 0.6392157, 1, 1,
0.145661, 1.74033, -0.183695, 0, 0.6352941, 1, 1,
0.1462831, -0.2131504, 1.985093, 0, 0.627451, 1, 1,
0.1474809, -0.8858176, 4.021988, 0, 0.6235294, 1, 1,
0.1500975, 0.08510073, -0.2265736, 0, 0.6156863, 1, 1,
0.1582112, -0.8675147, 2.407204, 0, 0.6117647, 1, 1,
0.1601255, -1.119775, 3.420648, 0, 0.6039216, 1, 1,
0.1605757, -0.2509764, 1.806382, 0, 0.5960785, 1, 1,
0.1662305, -0.6605245, 2.566472, 0, 0.5921569, 1, 1,
0.1702242, -0.7143201, 2.664169, 0, 0.5843138, 1, 1,
0.1764268, -1.719709, 3.773731, 0, 0.5803922, 1, 1,
0.1767121, 0.5730399, 0.8263915, 0, 0.572549, 1, 1,
0.1811633, -0.124529, 4.128063, 0, 0.5686275, 1, 1,
0.1839371, 1.534504, 0.596601, 0, 0.5607843, 1, 1,
0.1858207, 0.180811, -0.08670916, 0, 0.5568628, 1, 1,
0.1874283, -0.8088194, 4.371053, 0, 0.5490196, 1, 1,
0.1898409, -0.8785689, 2.942975, 0, 0.5450981, 1, 1,
0.1922164, -0.5381274, 1.556577, 0, 0.5372549, 1, 1,
0.1946723, 0.08767735, 1.498604, 0, 0.5333334, 1, 1,
0.1974293, -0.830595, 2.097986, 0, 0.5254902, 1, 1,
0.1999235, 0.8166163, -1.600489, 0, 0.5215687, 1, 1,
0.2007667, 1.773288, -0.02609456, 0, 0.5137255, 1, 1,
0.2018953, -0.4540157, 1.584274, 0, 0.509804, 1, 1,
0.2020989, -0.1498925, 4.887861, 0, 0.5019608, 1, 1,
0.205224, 1.244626, 1.639556, 0, 0.4941176, 1, 1,
0.2052697, -0.8326771, 3.751974, 0, 0.4901961, 1, 1,
0.2063299, 0.1306722, 0.4198727, 0, 0.4823529, 1, 1,
0.2099242, -0.1953884, 0.6339926, 0, 0.4784314, 1, 1,
0.2155795, -1.151837, 2.027936, 0, 0.4705882, 1, 1,
0.2161459, -0.3450283, 1.777317, 0, 0.4666667, 1, 1,
0.2238071, 1.632648, 0.6312949, 0, 0.4588235, 1, 1,
0.2241423, -0.785145, 2.790338, 0, 0.454902, 1, 1,
0.2299351, -0.7209365, 1.720515, 0, 0.4470588, 1, 1,
0.2307176, 0.3089982, 1.523333, 0, 0.4431373, 1, 1,
0.2361396, 0.7215188, 0.144427, 0, 0.4352941, 1, 1,
0.2382736, -0.00452852, 2.825233, 0, 0.4313726, 1, 1,
0.2390486, -0.2136639, 3.737189, 0, 0.4235294, 1, 1,
0.2404379, 0.4613967, 0.3871593, 0, 0.4196078, 1, 1,
0.2409776, 1.396819, -0.3914332, 0, 0.4117647, 1, 1,
0.2412623, 0.4687586, 0.1712863, 0, 0.4078431, 1, 1,
0.2422857, 1.1012, 1.466518, 0, 0.4, 1, 1,
0.24732, -1.022422, 1.804106, 0, 0.3921569, 1, 1,
0.2481465, -0.8825492, 3.184669, 0, 0.3882353, 1, 1,
0.255581, -0.7368439, 3.040539, 0, 0.3803922, 1, 1,
0.2564387, -0.5649869, 3.392022, 0, 0.3764706, 1, 1,
0.2617669, -2.261782, 2.706578, 0, 0.3686275, 1, 1,
0.2637215, 0.3505345, 0.7957761, 0, 0.3647059, 1, 1,
0.2666363, 0.5898724, -0.9118342, 0, 0.3568628, 1, 1,
0.2667521, 0.6865512, -1.732231, 0, 0.3529412, 1, 1,
0.2680915, -0.02456797, 2.477705, 0, 0.345098, 1, 1,
0.2717197, -0.04768639, 3.771416, 0, 0.3411765, 1, 1,
0.2724864, 0.02811806, 0.9599355, 0, 0.3333333, 1, 1,
0.2732444, 1.524962, -1.32758, 0, 0.3294118, 1, 1,
0.2755466, 0.4455929, 0.3337691, 0, 0.3215686, 1, 1,
0.2794544, -0.9363583, 3.888647, 0, 0.3176471, 1, 1,
0.2825514, -1.40949, 5.531208, 0, 0.3098039, 1, 1,
0.2827591, 1.162754, 1.412274, 0, 0.3058824, 1, 1,
0.2836873, -0.0120122, 1.515011, 0, 0.2980392, 1, 1,
0.2838584, -0.8303698, 3.975809, 0, 0.2901961, 1, 1,
0.2880881, 0.500218, -1.119899, 0, 0.2862745, 1, 1,
0.291684, 0.01846886, 1.342724, 0, 0.2784314, 1, 1,
0.291861, -1.037266, 2.215933, 0, 0.2745098, 1, 1,
0.291891, -0.07488535, -0.1792554, 0, 0.2666667, 1, 1,
0.2925777, 1.565151, -1.012318, 0, 0.2627451, 1, 1,
0.297533, 1.562336, 1.941239, 0, 0.254902, 1, 1,
0.3049004, 0.6181715, 1.335333, 0, 0.2509804, 1, 1,
0.3072075, 0.4397579, 0.6117997, 0, 0.2431373, 1, 1,
0.3095524, 0.05320118, -0.4398673, 0, 0.2392157, 1, 1,
0.3127915, -0.604238, 3.332215, 0, 0.2313726, 1, 1,
0.3128982, -0.6543137, 3.57214, 0, 0.227451, 1, 1,
0.3200546, -1.515132, 2.671844, 0, 0.2196078, 1, 1,
0.3215635, -1.040302, 3.413802, 0, 0.2156863, 1, 1,
0.3346083, 1.163201, -1.865608, 0, 0.2078431, 1, 1,
0.337302, 0.227229, 1.892876, 0, 0.2039216, 1, 1,
0.3389378, 0.9644638, -0.1602461, 0, 0.1960784, 1, 1,
0.3428751, 2.507218, -0.8510005, 0, 0.1882353, 1, 1,
0.3478607, -0.3489978, 3.551915, 0, 0.1843137, 1, 1,
0.3493201, 0.667723, -0.5294638, 0, 0.1764706, 1, 1,
0.3508799, 0.8276657, 0.08917172, 0, 0.172549, 1, 1,
0.3523071, 0.3799837, 1.868417, 0, 0.1647059, 1, 1,
0.3527697, 0.6552516, 1.121834, 0, 0.1607843, 1, 1,
0.3569134, -1.203371, 3.300279, 0, 0.1529412, 1, 1,
0.3615675, 0.1408243, 0.7331344, 0, 0.1490196, 1, 1,
0.3617641, 0.07052907, -0.1946157, 0, 0.1411765, 1, 1,
0.3632739, 0.2544677, 0.6140766, 0, 0.1372549, 1, 1,
0.3668861, -0.1732353, 2.681315, 0, 0.1294118, 1, 1,
0.3694794, 0.08539414, 1.317259, 0, 0.1254902, 1, 1,
0.3769298, 0.7360711, 0.4093041, 0, 0.1176471, 1, 1,
0.3776155, 0.2040693, 2.00306, 0, 0.1137255, 1, 1,
0.3784905, 0.7078492, -0.3301377, 0, 0.1058824, 1, 1,
0.3802989, 0.2739566, 1.88223, 0, 0.09803922, 1, 1,
0.3833371, 1.678776, 0.9072657, 0, 0.09411765, 1, 1,
0.3845122, -0.8462375, 3.723387, 0, 0.08627451, 1, 1,
0.3862321, -0.4443268, 3.403627, 0, 0.08235294, 1, 1,
0.3899885, -0.1957415, 1.422144, 0, 0.07450981, 1, 1,
0.3950382, 0.03864154, 2.464665, 0, 0.07058824, 1, 1,
0.3956843, 0.6428326, 1.58038, 0, 0.0627451, 1, 1,
0.3985914, -0.4074824, 2.618584, 0, 0.05882353, 1, 1,
0.3986206, 0.6096318, 0.5669212, 0, 0.05098039, 1, 1,
0.4006799, 1.27933, -0.06023135, 0, 0.04705882, 1, 1,
0.4009887, -1.457265, 1.659254, 0, 0.03921569, 1, 1,
0.4029749, -0.9569094, 3.68498, 0, 0.03529412, 1, 1,
0.4045127, -0.0383149, -0.2744639, 0, 0.02745098, 1, 1,
0.4094545, 1.112406, 1.548098, 0, 0.02352941, 1, 1,
0.4233422, -0.04565865, 2.265844, 0, 0.01568628, 1, 1,
0.4285611, -0.5959231, 3.543517, 0, 0.01176471, 1, 1,
0.4291332, 0.7951972, -0.00126742, 0, 0.003921569, 1, 1,
0.438307, 1.414648, -0.03826858, 0.003921569, 0, 1, 1,
0.4385485, -1.861443, 1.785688, 0.007843138, 0, 1, 1,
0.4455356, -0.9220944, 3.033378, 0.01568628, 0, 1, 1,
0.4516822, -1.595076, 1.876775, 0.01960784, 0, 1, 1,
0.4553615, 1.396258, -0.7505813, 0.02745098, 0, 1, 1,
0.4567909, -0.001695798, 1.06083, 0.03137255, 0, 1, 1,
0.457032, 0.605682, 1.67949, 0.03921569, 0, 1, 1,
0.4574653, 0.3689856, 1.718114, 0.04313726, 0, 1, 1,
0.4604094, 1.429358, -2.605297, 0.05098039, 0, 1, 1,
0.4618433, 0.6021516, 1.140859, 0.05490196, 0, 1, 1,
0.4632747, -0.1681711, 2.846887, 0.0627451, 0, 1, 1,
0.4649528, -0.5653993, 2.713936, 0.06666667, 0, 1, 1,
0.4674696, 0.4452475, 1.512885, 0.07450981, 0, 1, 1,
0.4680029, -1.358364, 2.895916, 0.07843138, 0, 1, 1,
0.4708325, -0.6596372, 3.626434, 0.08627451, 0, 1, 1,
0.4742022, -1.2457, 2.601835, 0.09019608, 0, 1, 1,
0.4829719, 1.318234, 0.2618021, 0.09803922, 0, 1, 1,
0.4848802, 0.3797948, 0.5654681, 0.1058824, 0, 1, 1,
0.4873267, -0.6877754, 2.879376, 0.1098039, 0, 1, 1,
0.4883616, -0.1900718, 1.758039, 0.1176471, 0, 1, 1,
0.4888471, -0.7874438, 2.218912, 0.1215686, 0, 1, 1,
0.4894291, -0.3310915, 1.443266, 0.1294118, 0, 1, 1,
0.491173, -1.213933, 3.124119, 0.1333333, 0, 1, 1,
0.4915173, 0.6202714, 3.050282, 0.1411765, 0, 1, 1,
0.4927774, 0.9505672, 2.457088, 0.145098, 0, 1, 1,
0.4957862, -0.3583117, 2.1268, 0.1529412, 0, 1, 1,
0.5036672, 0.1986432, 0.3640458, 0.1568628, 0, 1, 1,
0.5112198, 0.4174361, 0.7728318, 0.1647059, 0, 1, 1,
0.5130678, 0.3583715, 1.868591, 0.1686275, 0, 1, 1,
0.5140513, -1.647073, 3.80178, 0.1764706, 0, 1, 1,
0.5214463, 1.148748, 1.18626, 0.1803922, 0, 1, 1,
0.5220107, -1.729759, 1.59058, 0.1882353, 0, 1, 1,
0.5244897, 0.503834, 2.934843, 0.1921569, 0, 1, 1,
0.5283043, -0.02320897, 1.820533, 0.2, 0, 1, 1,
0.5336781, 1.099777, 1.225222, 0.2078431, 0, 1, 1,
0.5366497, 1.231982, 1.134846, 0.2117647, 0, 1, 1,
0.5379025, 0.3993602, 0.8023675, 0.2196078, 0, 1, 1,
0.5385449, 1.269766, 2.055208, 0.2235294, 0, 1, 1,
0.5395483, 0.3160626, 1.872353, 0.2313726, 0, 1, 1,
0.5469602, 1.347751, 3.368443, 0.2352941, 0, 1, 1,
0.5504285, -0.2425615, 1.493754, 0.2431373, 0, 1, 1,
0.5536708, 0.2763951, 1.868068, 0.2470588, 0, 1, 1,
0.5555766, 0.2009654, 1.290163, 0.254902, 0, 1, 1,
0.5707518, 1.545183, 1.037899, 0.2588235, 0, 1, 1,
0.5763952, -0.00214328, 1.097688, 0.2666667, 0, 1, 1,
0.5779633, -0.208135, 0.9805705, 0.2705882, 0, 1, 1,
0.578944, -2.033041, 2.888793, 0.2784314, 0, 1, 1,
0.5800971, 0.5097049, 0.04905022, 0.282353, 0, 1, 1,
0.582014, 0.6051136, 1.345159, 0.2901961, 0, 1, 1,
0.5845287, -0.1534206, 1.796597, 0.2941177, 0, 1, 1,
0.5852918, 0.8936849, 0.9804196, 0.3019608, 0, 1, 1,
0.5932842, 1.401983, 1.87873, 0.3098039, 0, 1, 1,
0.5946365, -0.655523, 3.810614, 0.3137255, 0, 1, 1,
0.5992173, -1.481218, 2.566553, 0.3215686, 0, 1, 1,
0.6076505, -1.077504, 1.388416, 0.3254902, 0, 1, 1,
0.6089346, -1.288901, 3.296439, 0.3333333, 0, 1, 1,
0.6089483, -0.3811867, 2.502937, 0.3372549, 0, 1, 1,
0.6103233, 0.2239839, 1.43189, 0.345098, 0, 1, 1,
0.6120012, 0.6228998, 0.4913849, 0.3490196, 0, 1, 1,
0.6143392, 1.886326, 0.7623249, 0.3568628, 0, 1, 1,
0.6166038, 0.3602421, 2.084437, 0.3607843, 0, 1, 1,
0.6177934, 0.8475462, -0.6192143, 0.3686275, 0, 1, 1,
0.6187953, -0.5299007, 3.069004, 0.372549, 0, 1, 1,
0.6255756, -0.063779, 0.8375766, 0.3803922, 0, 1, 1,
0.6265283, -0.09077872, 2.116682, 0.3843137, 0, 1, 1,
0.6306391, 1.05264, -0.01246167, 0.3921569, 0, 1, 1,
0.6330272, -2.801174, 3.688035, 0.3960784, 0, 1, 1,
0.634074, 0.02143778, 3.220492, 0.4039216, 0, 1, 1,
0.6383879, 2.232791, -0.6462866, 0.4117647, 0, 1, 1,
0.6444547, 0.3151421, 0.3932472, 0.4156863, 0, 1, 1,
0.6448846, -0.3270929, 3.127845, 0.4235294, 0, 1, 1,
0.650812, -0.3808055, 2.672843, 0.427451, 0, 1, 1,
0.6535742, -0.5188669, 0.09538411, 0.4352941, 0, 1, 1,
0.6625835, -0.356226, 0.5915148, 0.4392157, 0, 1, 1,
0.663371, 0.4725915, 0.1185243, 0.4470588, 0, 1, 1,
0.6669009, -0.9903034, 0.9731419, 0.4509804, 0, 1, 1,
0.6676409, -0.9972116, 2.178911, 0.4588235, 0, 1, 1,
0.6701666, 0.4200169, 1.744384, 0.4627451, 0, 1, 1,
0.6739593, -0.1037649, 1.369018, 0.4705882, 0, 1, 1,
0.6742452, 1.158566, 0.9780158, 0.4745098, 0, 1, 1,
0.6761664, 0.2501485, 2.366134, 0.4823529, 0, 1, 1,
0.6800662, -1.126062, 2.135271, 0.4862745, 0, 1, 1,
0.6881219, -1.815894, 2.780818, 0.4941176, 0, 1, 1,
0.6969095, 0.7726032, 0.07176127, 0.5019608, 0, 1, 1,
0.7049254, 0.1023366, 0.09889784, 0.5058824, 0, 1, 1,
0.7080992, -0.6510692, 0.9199734, 0.5137255, 0, 1, 1,
0.7096133, 0.07283682, 1.799849, 0.5176471, 0, 1, 1,
0.7111891, 1.934565, -0.4466262, 0.5254902, 0, 1, 1,
0.7124333, -0.9719023, 3.967099, 0.5294118, 0, 1, 1,
0.7141322, -0.04051765, 2.038756, 0.5372549, 0, 1, 1,
0.7174788, -0.04525904, 2.065433, 0.5411765, 0, 1, 1,
0.7194273, 0.5347848, 2.032664, 0.5490196, 0, 1, 1,
0.7226195, -0.5582892, 1.531919, 0.5529412, 0, 1, 1,
0.7241256, -1.693421, 3.619001, 0.5607843, 0, 1, 1,
0.7241673, -0.6764151, 4.58205, 0.5647059, 0, 1, 1,
0.7280837, 0.5230838, 0.8334212, 0.572549, 0, 1, 1,
0.7283446, -0.08472919, 1.594243, 0.5764706, 0, 1, 1,
0.7288643, 1.85248, -0.3823273, 0.5843138, 0, 1, 1,
0.7296239, -0.7316714, 3.030649, 0.5882353, 0, 1, 1,
0.7337009, 1.438535, 2.341548, 0.5960785, 0, 1, 1,
0.7357971, -0.3163582, 2.712716, 0.6039216, 0, 1, 1,
0.740963, -0.279036, 1.371485, 0.6078432, 0, 1, 1,
0.7472561, -0.9483571, 2.38632, 0.6156863, 0, 1, 1,
0.7483276, -1.284009, 2.116018, 0.6196079, 0, 1, 1,
0.7569398, 0.1203357, 0.5257445, 0.627451, 0, 1, 1,
0.7572307, 0.1162089, -0.2029574, 0.6313726, 0, 1, 1,
0.7579948, -0.9719825, 3.708364, 0.6392157, 0, 1, 1,
0.7586422, -0.3548968, 4.218824, 0.6431373, 0, 1, 1,
0.7587928, -1.164154, 1.190857, 0.6509804, 0, 1, 1,
0.7606266, -1.922557, 2.479424, 0.654902, 0, 1, 1,
0.7611682, 1.158567, 0.3122336, 0.6627451, 0, 1, 1,
0.7612922, 0.8502447, 2.197994, 0.6666667, 0, 1, 1,
0.7635706, 0.5269707, 1.596851, 0.6745098, 0, 1, 1,
0.7642892, -0.5793488, 1.515502, 0.6784314, 0, 1, 1,
0.7668646, 0.7517397, 0.9642463, 0.6862745, 0, 1, 1,
0.7750246, -1.527701, 3.166952, 0.6901961, 0, 1, 1,
0.7752066, 0.5095736, 0.9788104, 0.6980392, 0, 1, 1,
0.7757725, -0.4375798, 0.6907235, 0.7058824, 0, 1, 1,
0.7873486, 0.5476057, 0.2119083, 0.7098039, 0, 1, 1,
0.791608, 0.0980338, 2.734499, 0.7176471, 0, 1, 1,
0.7933224, -0.3881213, 1.959372, 0.7215686, 0, 1, 1,
0.7974854, 0.1664478, 0.5908319, 0.7294118, 0, 1, 1,
0.801119, -0.2133907, 1.547817, 0.7333333, 0, 1, 1,
0.8077203, 1.487576, 0.4920276, 0.7411765, 0, 1, 1,
0.8137691, 0.087034, 1.570999, 0.7450981, 0, 1, 1,
0.8245466, 0.133256, 0.8536544, 0.7529412, 0, 1, 1,
0.829036, -2.565258, 2.075822, 0.7568628, 0, 1, 1,
0.8388737, -0.3671674, 1.354188, 0.7647059, 0, 1, 1,
0.842099, -0.1889959, 3.822902, 0.7686275, 0, 1, 1,
0.8445833, 0.3985348, 1.958695, 0.7764706, 0, 1, 1,
0.8446704, -0.131959, 3.48212, 0.7803922, 0, 1, 1,
0.8458992, 0.7369941, 2.049922, 0.7882353, 0, 1, 1,
0.8591065, 0.8513701, 0.7801639, 0.7921569, 0, 1, 1,
0.8623443, -0.02611, 2.631076, 0.8, 0, 1, 1,
0.8684946, -0.8660994, 2.399002, 0.8078431, 0, 1, 1,
0.8685078, 0.003058136, 1.487313, 0.8117647, 0, 1, 1,
0.8708467, 0.5047339, 1.248515, 0.8196079, 0, 1, 1,
0.8726015, -0.2003875, 3.177085, 0.8235294, 0, 1, 1,
0.8765753, -1.265461, 3.560773, 0.8313726, 0, 1, 1,
0.8788852, -1.389813, 1.488176, 0.8352941, 0, 1, 1,
0.8797276, 0.7212632, 1.156185, 0.8431373, 0, 1, 1,
0.8830267, 0.004875964, 3.536041, 0.8470588, 0, 1, 1,
0.8896257, -1.648923, 3.962685, 0.854902, 0, 1, 1,
0.8956654, 1.060173, 0.5000322, 0.8588235, 0, 1, 1,
0.8979167, -0.1050476, 1.041397, 0.8666667, 0, 1, 1,
0.9015149, 0.3037118, 0.9777294, 0.8705882, 0, 1, 1,
0.9067147, -1.442991, 0.9638203, 0.8784314, 0, 1, 1,
0.9180183, 0.8464066, 0.9001853, 0.8823529, 0, 1, 1,
0.920503, -1.538007, 5.109501, 0.8901961, 0, 1, 1,
0.9218037, 1.478251, -0.3816351, 0.8941177, 0, 1, 1,
0.9232365, -0.6506916, 2.018643, 0.9019608, 0, 1, 1,
0.9238715, 1.012881, 1.022133, 0.9098039, 0, 1, 1,
0.9276456, 0.04489173, 1.234897, 0.9137255, 0, 1, 1,
0.9410562, 0.4637731, 1.264237, 0.9215686, 0, 1, 1,
0.9524484, 0.3661244, 0.1515513, 0.9254902, 0, 1, 1,
0.953364, 0.3785141, 0.5801946, 0.9333333, 0, 1, 1,
0.9558317, -1.549111, 2.08686, 0.9372549, 0, 1, 1,
0.9611816, -0.2241572, 0.9217482, 0.945098, 0, 1, 1,
0.9624672, -0.2617942, 2.842968, 0.9490196, 0, 1, 1,
0.9628516, -0.2029451, 2.301381, 0.9568627, 0, 1, 1,
0.9654262, -0.1469498, 0.8364812, 0.9607843, 0, 1, 1,
0.9673613, -0.484293, 3.14406, 0.9686275, 0, 1, 1,
0.9771692, 0.6062589, 1.238842, 0.972549, 0, 1, 1,
0.9799774, 1.889088, 1.714758, 0.9803922, 0, 1, 1,
0.9825612, 1.123987, 0.6532942, 0.9843137, 0, 1, 1,
0.9887223, 1.394026, 0.4841891, 0.9921569, 0, 1, 1,
0.9949073, 1.165636, 0.5314869, 0.9960784, 0, 1, 1,
1.006965, 0.5550083, 1.22841, 1, 0, 0.9960784, 1,
1.010731, 2.392878, -0.4931908, 1, 0, 0.9882353, 1,
1.012004, -0.7657896, 3.736312, 1, 0, 0.9843137, 1,
1.02018, 0.8218631, -0.4515664, 1, 0, 0.9764706, 1,
1.030169, -0.16083, 1.953169, 1, 0, 0.972549, 1,
1.039344, -0.9314377, 1.85869, 1, 0, 0.9647059, 1,
1.050786, 0.06717118, -0.396014, 1, 0, 0.9607843, 1,
1.050979, 1.534136, -0.5593635, 1, 0, 0.9529412, 1,
1.052859, 1.377606, 2.32032, 1, 0, 0.9490196, 1,
1.057607, -0.4976028, 3.166986, 1, 0, 0.9411765, 1,
1.064617, -0.8136578, 3.638094, 1, 0, 0.9372549, 1,
1.0689, -0.8271303, 2.22581, 1, 0, 0.9294118, 1,
1.070532, -0.3873622, 1.568648, 1, 0, 0.9254902, 1,
1.075465, 0.2383408, 1.449628, 1, 0, 0.9176471, 1,
1.076323, -0.346507, 1.790124, 1, 0, 0.9137255, 1,
1.078989, 1.882625, 0.6035694, 1, 0, 0.9058824, 1,
1.079198, 1.374934, 1.107272, 1, 0, 0.9019608, 1,
1.080887, -0.5255151, 2.631836, 1, 0, 0.8941177, 1,
1.085045, 0.4211178, 1.609386, 1, 0, 0.8862745, 1,
1.095329, 0.5457147, -1.6327, 1, 0, 0.8823529, 1,
1.098672, 0.5879245, -0.4475076, 1, 0, 0.8745098, 1,
1.10198, 0.7141823, -0.1904067, 1, 0, 0.8705882, 1,
1.103299, 0.0176864, 0.925249, 1, 0, 0.8627451, 1,
1.10549, 0.2053984, 0.4031417, 1, 0, 0.8588235, 1,
1.110443, -0.3034595, 1.224476, 1, 0, 0.8509804, 1,
1.113634, -1.625485, 0.2061644, 1, 0, 0.8470588, 1,
1.123172, -0.4084034, 0.7307517, 1, 0, 0.8392157, 1,
1.124739, -0.7991852, 3.868794, 1, 0, 0.8352941, 1,
1.13955, 0.2268806, 2.030381, 1, 0, 0.827451, 1,
1.143429, -2.268568, 2.852043, 1, 0, 0.8235294, 1,
1.150212, 1.31326, 0.9780867, 1, 0, 0.8156863, 1,
1.155882, 0.2203928, 1.516316, 1, 0, 0.8117647, 1,
1.160433, 0.704918, 0.6293131, 1, 0, 0.8039216, 1,
1.16461, -0.02966868, 2.151865, 1, 0, 0.7960784, 1,
1.16612, 0.4140448, 2.110314, 1, 0, 0.7921569, 1,
1.17502, -0.05246127, 1.587249, 1, 0, 0.7843137, 1,
1.176478, 0.9388192, 0.5281534, 1, 0, 0.7803922, 1,
1.176759, 0.5410884, 0.8094842, 1, 0, 0.772549, 1,
1.178458, 1.715328, 2.856721, 1, 0, 0.7686275, 1,
1.183939, -0.277914, 1.78758, 1, 0, 0.7607843, 1,
1.18529, 0.5713705, 3.011633, 1, 0, 0.7568628, 1,
1.185601, 0.2886326, 0.2255515, 1, 0, 0.7490196, 1,
1.192854, -0.148678, 2.589103, 1, 0, 0.7450981, 1,
1.198696, 1.750859, 1.113109, 1, 0, 0.7372549, 1,
1.199363, -0.2721236, 0.783916, 1, 0, 0.7333333, 1,
1.204237, 0.668398, 2.542367, 1, 0, 0.7254902, 1,
1.213814, 0.3819298, 0.6993501, 1, 0, 0.7215686, 1,
1.220814, -0.3409289, 1.528907, 1, 0, 0.7137255, 1,
1.221125, 2.248697, -1.564378, 1, 0, 0.7098039, 1,
1.225697, 0.06160783, 0.01790152, 1, 0, 0.7019608, 1,
1.225832, 0.1886603, 1.383722, 1, 0, 0.6941177, 1,
1.230086, 1.580217, 1.653193, 1, 0, 0.6901961, 1,
1.231792, 0.1071091, 1.158995, 1, 0, 0.682353, 1,
1.235696, 0.2178622, 1.063995, 1, 0, 0.6784314, 1,
1.238582, -0.8381425, 2.249332, 1, 0, 0.6705883, 1,
1.240544, -2.466146, 3.440088, 1, 0, 0.6666667, 1,
1.24248, -0.655674, 1.146545, 1, 0, 0.6588235, 1,
1.243789, 0.03889797, 2.065989, 1, 0, 0.654902, 1,
1.250891, -1.7101, 0.1994798, 1, 0, 0.6470588, 1,
1.259114, 0.6800413, -0.9308497, 1, 0, 0.6431373, 1,
1.265209, 0.2177265, 0.5091951, 1, 0, 0.6352941, 1,
1.269769, -0.9541083, 2.868618, 1, 0, 0.6313726, 1,
1.273664, -1.26325, 2.874071, 1, 0, 0.6235294, 1,
1.27523, -0.2697488, 1.336483, 1, 0, 0.6196079, 1,
1.279341, -1.025399, 3.342391, 1, 0, 0.6117647, 1,
1.291873, -2.043312, 2.954027, 1, 0, 0.6078432, 1,
1.29359, 0.979412, 1.312607, 1, 0, 0.6, 1,
1.29793, 1.693836, 1.36451, 1, 0, 0.5921569, 1,
1.30239, 0.1635719, 2.264464, 1, 0, 0.5882353, 1,
1.322517, 0.8755862, 1.370332, 1, 0, 0.5803922, 1,
1.326424, 0.04531609, 2.230583, 1, 0, 0.5764706, 1,
1.330526, -0.808013, 0.5543917, 1, 0, 0.5686275, 1,
1.332417, -0.9816662, 1.146514, 1, 0, 0.5647059, 1,
1.334433, -1.413276, 1.044171, 1, 0, 0.5568628, 1,
1.33791, 0.3805923, -0.9608119, 1, 0, 0.5529412, 1,
1.343182, 0.6541409, 2.833038, 1, 0, 0.5450981, 1,
1.360776, -0.5547341, 0.3154295, 1, 0, 0.5411765, 1,
1.378069, 0.2095013, 1.322704, 1, 0, 0.5333334, 1,
1.378634, -0.7471595, 0.2379776, 1, 0, 0.5294118, 1,
1.382991, -1.055946, 1.158131, 1, 0, 0.5215687, 1,
1.384558, 1.399795, 0.334777, 1, 0, 0.5176471, 1,
1.386015, 0.797973, 1.732646, 1, 0, 0.509804, 1,
1.399944, 1.619992, -1.003001, 1, 0, 0.5058824, 1,
1.404504, -0.9191383, 0.9957613, 1, 0, 0.4980392, 1,
1.4096, 0.8214545, 0.5200679, 1, 0, 0.4901961, 1,
1.426059, 0.6656118, 1.784754, 1, 0, 0.4862745, 1,
1.433574, -0.4646725, 1.85806, 1, 0, 0.4784314, 1,
1.449066, -1.243015, 3.723732, 1, 0, 0.4745098, 1,
1.452304, 0.5537648, 1.409185, 1, 0, 0.4666667, 1,
1.454749, -0.2791903, 1.767483, 1, 0, 0.4627451, 1,
1.45645, -2.095871, 1.905559, 1, 0, 0.454902, 1,
1.467854, -1.101991, 2.643571, 1, 0, 0.4509804, 1,
1.472484, 0.6939482, -0.4051841, 1, 0, 0.4431373, 1,
1.477426, -1.304503, 2.334712, 1, 0, 0.4392157, 1,
1.48199, 1.596085, 1.729529, 1, 0, 0.4313726, 1,
1.496741, 0.5544048, 1.313562, 1, 0, 0.427451, 1,
1.501185, -1.161878, 1.680212, 1, 0, 0.4196078, 1,
1.502749, -0.110776, 2.053095, 1, 0, 0.4156863, 1,
1.502874, 0.6088346, 2.706201, 1, 0, 0.4078431, 1,
1.521427, 1.32961, 1.295972, 1, 0, 0.4039216, 1,
1.530155, -2.355574, 1.411971, 1, 0, 0.3960784, 1,
1.550923, -0.7169566, 1.775843, 1, 0, 0.3882353, 1,
1.551754, 0.632617, 0.331863, 1, 0, 0.3843137, 1,
1.562805, 0.5043417, 1.7014, 1, 0, 0.3764706, 1,
1.569944, 1.540653, 1.435448, 1, 0, 0.372549, 1,
1.571846, 0.08247485, 1.348547, 1, 0, 0.3647059, 1,
1.573726, -0.8186051, 1.342974, 1, 0, 0.3607843, 1,
1.598169, 1.735675, 1.408023, 1, 0, 0.3529412, 1,
1.604238, -1.233263, 5.485045, 1, 0, 0.3490196, 1,
1.607503, 0.788748, 2.918289, 1, 0, 0.3411765, 1,
1.616017, -1.175099, 2.041092, 1, 0, 0.3372549, 1,
1.616484, 1.064218, 1.232165, 1, 0, 0.3294118, 1,
1.630144, 0.7701611, 1.627366, 1, 0, 0.3254902, 1,
1.630763, 0.3100512, 2.40167, 1, 0, 0.3176471, 1,
1.648666, 1.488322, -0.3648455, 1, 0, 0.3137255, 1,
1.648715, -0.4385292, -0.08965331, 1, 0, 0.3058824, 1,
1.664365, -1.108687, 2.921334, 1, 0, 0.2980392, 1,
1.675319, 1.19999, 1.566767, 1, 0, 0.2941177, 1,
1.67607, 1.388839, 1.316677, 1, 0, 0.2862745, 1,
1.685531, 0.3075938, 2.506457, 1, 0, 0.282353, 1,
1.694038, 1.931002, -0.863763, 1, 0, 0.2745098, 1,
1.697373, 1.097212, 0.7224464, 1, 0, 0.2705882, 1,
1.706251, -0.8009287, 1.020289, 1, 0, 0.2627451, 1,
1.722727, 1.247343, 0.5651181, 1, 0, 0.2588235, 1,
1.730716, 0.4056147, 0.8218095, 1, 0, 0.2509804, 1,
1.743593, -1.643577, 3.367196, 1, 0, 0.2470588, 1,
1.750745, 0.6626146, 0.7647546, 1, 0, 0.2392157, 1,
1.765126, 0.2930499, 1.817587, 1, 0, 0.2352941, 1,
1.768653, -0.2341929, 2.258573, 1, 0, 0.227451, 1,
1.781176, -0.8459889, 2.359745, 1, 0, 0.2235294, 1,
1.786025, -0.7722516, 2.474526, 1, 0, 0.2156863, 1,
1.786839, 1.697941, 0.4472909, 1, 0, 0.2117647, 1,
1.80601, 1.468112, 1.375247, 1, 0, 0.2039216, 1,
1.812672, 0.3612937, -0.03742857, 1, 0, 0.1960784, 1,
1.848566, -0.2429526, 1.969598, 1, 0, 0.1921569, 1,
1.865773, -0.3965737, 1.63417, 1, 0, 0.1843137, 1,
1.875693, -0.5802754, 3.448373, 1, 0, 0.1803922, 1,
1.914475, -0.05596441, 2.329746, 1, 0, 0.172549, 1,
1.948227, 0.2111505, 1.264368, 1, 0, 0.1686275, 1,
1.951105, 0.3378892, 0.3253811, 1, 0, 0.1607843, 1,
1.952329, 0.271409, 0.791581, 1, 0, 0.1568628, 1,
1.957476, -0.5569522, 1.891762, 1, 0, 0.1490196, 1,
1.967377, -1.376455, 2.429343, 1, 0, 0.145098, 1,
1.982307, -0.02028099, 3.076401, 1, 0, 0.1372549, 1,
2.000628, -0.4918763, 2.033479, 1, 0, 0.1333333, 1,
2.017517, -1.830046, 3.247341, 1, 0, 0.1254902, 1,
2.035308, 0.1538945, 1.870552, 1, 0, 0.1215686, 1,
2.048962, -1.217658, 2.135598, 1, 0, 0.1137255, 1,
2.093742, -0.2210902, 1.926405, 1, 0, 0.1098039, 1,
2.095638, 0.04337154, 2.155738, 1, 0, 0.1019608, 1,
2.102006, 0.8945651, 2.133935, 1, 0, 0.09411765, 1,
2.121305, 1.660639, 1.42212, 1, 0, 0.09019608, 1,
2.124368, 0.08922439, 1.586451, 1, 0, 0.08235294, 1,
2.133191, 0.4445514, 3.490707, 1, 0, 0.07843138, 1,
2.153953, -0.5415926, 1.123353, 1, 0, 0.07058824, 1,
2.164869, 1.783641, -0.081802, 1, 0, 0.06666667, 1,
2.175727, 1.120148, -0.3242541, 1, 0, 0.05882353, 1,
2.213379, 0.767266, 1.472222, 1, 0, 0.05490196, 1,
2.251158, -0.7065417, 2.874989, 1, 0, 0.04705882, 1,
2.261941, 1.326867, 0.5265953, 1, 0, 0.04313726, 1,
2.286863, 0.4029938, 0.7005912, 1, 0, 0.03529412, 1,
2.377547, -0.1145562, 0.7078719, 1, 0, 0.03137255, 1,
2.606841, 0.1847491, 0.7671063, 1, 0, 0.02352941, 1,
2.739897, -0.2721572, 0.3996985, 1, 0, 0.01960784, 1,
2.763395, -0.7766938, 3.050085, 1, 0, 0.01176471, 1,
2.928529, -0.5568903, 3.346798, 1, 0, 0.007843138, 1
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
-0.0473007, -4.384068, -7.391589, 0, -0.5, 0.5, 0.5,
-0.0473007, -4.384068, -7.391589, 1, -0.5, 0.5, 0.5,
-0.0473007, -4.384068, -7.391589, 1, 1.5, 0.5, 0.5,
-0.0473007, -4.384068, -7.391589, 0, 1.5, 0.5, 0.5
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
-4.031937, -0.3242551, -7.391589, 0, -0.5, 0.5, 0.5,
-4.031937, -0.3242551, -7.391589, 1, -0.5, 0.5, 0.5,
-4.031937, -0.3242551, -7.391589, 1, 1.5, 0.5, 0.5,
-4.031937, -0.3242551, -7.391589, 0, 1.5, 0.5, 0.5
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
-4.031937, -4.384068, 0.006283998, 0, -0.5, 0.5, 0.5,
-4.031937, -4.384068, 0.006283998, 1, -0.5, 0.5, 0.5,
-4.031937, -4.384068, 0.006283998, 1, 1.5, 0.5, 0.5,
-4.031937, -4.384068, 0.006283998, 0, 1.5, 0.5, 0.5
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
-3, -3.447188, -5.684388,
2, -3.447188, -5.684388,
-3, -3.447188, -5.684388,
-3, -3.603334, -5.968921,
-2, -3.447188, -5.684388,
-2, -3.603334, -5.968921,
-1, -3.447188, -5.684388,
-1, -3.603334, -5.968921,
0, -3.447188, -5.684388,
0, -3.603334, -5.968921,
1, -3.447188, -5.684388,
1, -3.603334, -5.968921,
2, -3.447188, -5.684388,
2, -3.603334, -5.968921
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
-3, -3.915628, -6.537989, 0, -0.5, 0.5, 0.5,
-3, -3.915628, -6.537989, 1, -0.5, 0.5, 0.5,
-3, -3.915628, -6.537989, 1, 1.5, 0.5, 0.5,
-3, -3.915628, -6.537989, 0, 1.5, 0.5, 0.5,
-2, -3.915628, -6.537989, 0, -0.5, 0.5, 0.5,
-2, -3.915628, -6.537989, 1, -0.5, 0.5, 0.5,
-2, -3.915628, -6.537989, 1, 1.5, 0.5, 0.5,
-2, -3.915628, -6.537989, 0, 1.5, 0.5, 0.5,
-1, -3.915628, -6.537989, 0, -0.5, 0.5, 0.5,
-1, -3.915628, -6.537989, 1, -0.5, 0.5, 0.5,
-1, -3.915628, -6.537989, 1, 1.5, 0.5, 0.5,
-1, -3.915628, -6.537989, 0, 1.5, 0.5, 0.5,
0, -3.915628, -6.537989, 0, -0.5, 0.5, 0.5,
0, -3.915628, -6.537989, 1, -0.5, 0.5, 0.5,
0, -3.915628, -6.537989, 1, 1.5, 0.5, 0.5,
0, -3.915628, -6.537989, 0, 1.5, 0.5, 0.5,
1, -3.915628, -6.537989, 0, -0.5, 0.5, 0.5,
1, -3.915628, -6.537989, 1, -0.5, 0.5, 0.5,
1, -3.915628, -6.537989, 1, 1.5, 0.5, 0.5,
1, -3.915628, -6.537989, 0, 1.5, 0.5, 0.5,
2, -3.915628, -6.537989, 0, -0.5, 0.5, 0.5,
2, -3.915628, -6.537989, 1, -0.5, 0.5, 0.5,
2, -3.915628, -6.537989, 1, 1.5, 0.5, 0.5,
2, -3.915628, -6.537989, 0, 1.5, 0.5, 0.5
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
-3.112405, -3, -5.684388,
-3.112405, 2, -5.684388,
-3.112405, -3, -5.684388,
-3.265661, -3, -5.968921,
-3.112405, -2, -5.684388,
-3.265661, -2, -5.968921,
-3.112405, -1, -5.684388,
-3.265661, -1, -5.968921,
-3.112405, 0, -5.684388,
-3.265661, 0, -5.968921,
-3.112405, 1, -5.684388,
-3.265661, 1, -5.968921,
-3.112405, 2, -5.684388,
-3.265661, 2, -5.968921
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
-3.572171, -3, -6.537989, 0, -0.5, 0.5, 0.5,
-3.572171, -3, -6.537989, 1, -0.5, 0.5, 0.5,
-3.572171, -3, -6.537989, 1, 1.5, 0.5, 0.5,
-3.572171, -3, -6.537989, 0, 1.5, 0.5, 0.5,
-3.572171, -2, -6.537989, 0, -0.5, 0.5, 0.5,
-3.572171, -2, -6.537989, 1, -0.5, 0.5, 0.5,
-3.572171, -2, -6.537989, 1, 1.5, 0.5, 0.5,
-3.572171, -2, -6.537989, 0, 1.5, 0.5, 0.5,
-3.572171, -1, -6.537989, 0, -0.5, 0.5, 0.5,
-3.572171, -1, -6.537989, 1, -0.5, 0.5, 0.5,
-3.572171, -1, -6.537989, 1, 1.5, 0.5, 0.5,
-3.572171, -1, -6.537989, 0, 1.5, 0.5, 0.5,
-3.572171, 0, -6.537989, 0, -0.5, 0.5, 0.5,
-3.572171, 0, -6.537989, 1, -0.5, 0.5, 0.5,
-3.572171, 0, -6.537989, 1, 1.5, 0.5, 0.5,
-3.572171, 0, -6.537989, 0, 1.5, 0.5, 0.5,
-3.572171, 1, -6.537989, 0, -0.5, 0.5, 0.5,
-3.572171, 1, -6.537989, 1, -0.5, 0.5, 0.5,
-3.572171, 1, -6.537989, 1, 1.5, 0.5, 0.5,
-3.572171, 1, -6.537989, 0, 1.5, 0.5, 0.5,
-3.572171, 2, -6.537989, 0, -0.5, 0.5, 0.5,
-3.572171, 2, -6.537989, 1, -0.5, 0.5, 0.5,
-3.572171, 2, -6.537989, 1, 1.5, 0.5, 0.5,
-3.572171, 2, -6.537989, 0, 1.5, 0.5, 0.5
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
-3.112405, -3.447188, -4,
-3.112405, -3.447188, 4,
-3.112405, -3.447188, -4,
-3.265661, -3.603334, -4,
-3.112405, -3.447188, -2,
-3.265661, -3.603334, -2,
-3.112405, -3.447188, 0,
-3.265661, -3.603334, 0,
-3.112405, -3.447188, 2,
-3.265661, -3.603334, 2,
-3.112405, -3.447188, 4,
-3.265661, -3.603334, 4
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
-3.572171, -3.915628, -4, 0, -0.5, 0.5, 0.5,
-3.572171, -3.915628, -4, 1, -0.5, 0.5, 0.5,
-3.572171, -3.915628, -4, 1, 1.5, 0.5, 0.5,
-3.572171, -3.915628, -4, 0, 1.5, 0.5, 0.5,
-3.572171, -3.915628, -2, 0, -0.5, 0.5, 0.5,
-3.572171, -3.915628, -2, 1, -0.5, 0.5, 0.5,
-3.572171, -3.915628, -2, 1, 1.5, 0.5, 0.5,
-3.572171, -3.915628, -2, 0, 1.5, 0.5, 0.5,
-3.572171, -3.915628, 0, 0, -0.5, 0.5, 0.5,
-3.572171, -3.915628, 0, 1, -0.5, 0.5, 0.5,
-3.572171, -3.915628, 0, 1, 1.5, 0.5, 0.5,
-3.572171, -3.915628, 0, 0, 1.5, 0.5, 0.5,
-3.572171, -3.915628, 2, 0, -0.5, 0.5, 0.5,
-3.572171, -3.915628, 2, 1, -0.5, 0.5, 0.5,
-3.572171, -3.915628, 2, 1, 1.5, 0.5, 0.5,
-3.572171, -3.915628, 2, 0, 1.5, 0.5, 0.5,
-3.572171, -3.915628, 4, 0, -0.5, 0.5, 0.5,
-3.572171, -3.915628, 4, 1, -0.5, 0.5, 0.5,
-3.572171, -3.915628, 4, 1, 1.5, 0.5, 0.5,
-3.572171, -3.915628, 4, 0, 1.5, 0.5, 0.5
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
-3.112405, -3.447188, -5.684388,
-3.112405, 2.798678, -5.684388,
-3.112405, -3.447188, 5.696956,
-3.112405, 2.798678, 5.696956,
-3.112405, -3.447188, -5.684388,
-3.112405, -3.447188, 5.696956,
-3.112405, 2.798678, -5.684388,
-3.112405, 2.798678, 5.696956,
-3.112405, -3.447188, -5.684388,
3.017804, -3.447188, -5.684388,
-3.112405, -3.447188, 5.696956,
3.017804, -3.447188, 5.696956,
-3.112405, 2.798678, -5.684388,
3.017804, 2.798678, -5.684388,
-3.112405, 2.798678, 5.696956,
3.017804, 2.798678, 5.696956,
3.017804, -3.447188, -5.684388,
3.017804, 2.798678, -5.684388,
3.017804, -3.447188, 5.696956,
3.017804, 2.798678, 5.696956,
3.017804, -3.447188, -5.684388,
3.017804, -3.447188, 5.696956,
3.017804, 2.798678, -5.684388,
3.017804, 2.798678, 5.696956
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
var radius = 7.666393;
var distance = 34.10865;
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
mvMatrix.translate( 0.0473007, 0.3242551, -0.006283998 );
mvMatrix.scale( 1.352165, 1.327127, 0.7283019 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.10865);
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
Triazophos<-read.table("Triazophos.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Triazophos$V2
```

```
## Error in eval(expr, envir, enclos): object 'Triazophos' not found
```

```r
y<-Triazophos$V3
```

```
## Error in eval(expr, envir, enclos): object 'Triazophos' not found
```

```r
z<-Triazophos$V4
```

```
## Error in eval(expr, envir, enclos): object 'Triazophos' not found
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
-3.02313, -0.9579886, -2.696448, 0, 0, 1, 1, 1,
-2.794922, -0.5667362, -2.371127, 1, 0, 0, 1, 1,
-2.606976, -1.830276, -3.644024, 1, 0, 0, 1, 1,
-2.583627, 1.993765, -0.6378369, 1, 0, 0, 1, 1,
-2.56052, -0.2387215, -1.947343, 1, 0, 0, 1, 1,
-2.539678, -0.1586479, -1.156151, 1, 0, 0, 1, 1,
-2.506216, -0.1626386, -1.706743, 0, 0, 0, 1, 1,
-2.497433, -0.2956546, -1.862357, 0, 0, 0, 1, 1,
-2.462033, 1.311562, 0.5865935, 0, 0, 0, 1, 1,
-2.420391, 1.977414, -1.084118, 0, 0, 0, 1, 1,
-2.418287, -2.682395, -2.939835, 0, 0, 0, 1, 1,
-2.412791, 0.8635451, -2.130253, 0, 0, 0, 1, 1,
-2.374147, -1.340977, -1.988859, 0, 0, 0, 1, 1,
-2.343688, -0.9740124, -1.25966, 1, 1, 1, 1, 1,
-2.334224, -0.1127823, -1.271706, 1, 1, 1, 1, 1,
-2.301748, 0.4538254, -1.729813, 1, 1, 1, 1, 1,
-2.28871, 0.04853442, -1.570307, 1, 1, 1, 1, 1,
-2.244493, 0.3211212, -1.530721, 1, 1, 1, 1, 1,
-2.221012, 1.444462, -0.7588204, 1, 1, 1, 1, 1,
-2.188087, -0.1500139, -1.495504, 1, 1, 1, 1, 1,
-2.149326, 0.4661568, -1.981205, 1, 1, 1, 1, 1,
-2.104603, -1.180196, -3.76565, 1, 1, 1, 1, 1,
-2.104234, -1.734161, -1.609353, 1, 1, 1, 1, 1,
-2.071765, 0.3941897, -0.1427388, 1, 1, 1, 1, 1,
-2.068953, -0.8771296, -1.97364, 1, 1, 1, 1, 1,
-2.053767, 0.7495785, -0.6541107, 1, 1, 1, 1, 1,
-2.039641, 0.2740811, -2.23903, 1, 1, 1, 1, 1,
-2.018926, 1.010015, -1.231315, 1, 1, 1, 1, 1,
-1.98734, 0.8148859, -2.119992, 0, 0, 1, 1, 1,
-1.93847, -0.7817213, -1.790999, 1, 0, 0, 1, 1,
-1.931243, -0.4251599, -2.00679, 1, 0, 0, 1, 1,
-1.922674, 2.314762, -0.6267872, 1, 0, 0, 1, 1,
-1.882143, -0.1051612, -0.620191, 1, 0, 0, 1, 1,
-1.881976, 1.221245, -1.051838, 1, 0, 0, 1, 1,
-1.878193, 0.0170883, -3.160883, 0, 0, 0, 1, 1,
-1.873309, -1.730685, -1.062407, 0, 0, 0, 1, 1,
-1.866171, -1.46787, -0.7952793, 0, 0, 0, 1, 1,
-1.8477, 1.001692, -4.059053, 0, 0, 0, 1, 1,
-1.841925, -0.1405486, -1.774166, 0, 0, 0, 1, 1,
-1.840716, 0.3187559, -1.151491, 0, 0, 0, 1, 1,
-1.828602, 0.3708076, -2.411192, 0, 0, 0, 1, 1,
-1.827093, -0.725131, -1.477897, 1, 1, 1, 1, 1,
-1.813702, 0.5784073, -1.511719, 1, 1, 1, 1, 1,
-1.81005, 0.2639021, -3.589897, 1, 1, 1, 1, 1,
-1.809512, 1.115657, -2.24083, 1, 1, 1, 1, 1,
-1.747228, 1.587798, -0.3897456, 1, 1, 1, 1, 1,
-1.733351, -0.7864559, -2.92257, 1, 1, 1, 1, 1,
-1.727291, -0.6786614, -1.616658, 1, 1, 1, 1, 1,
-1.681625, -0.1275114, -1.996886, 1, 1, 1, 1, 1,
-1.646668, -0.1826373, -1.739981, 1, 1, 1, 1, 1,
-1.641198, 0.4735983, -0.6670743, 1, 1, 1, 1, 1,
-1.638951, 0.4312771, -1.232073, 1, 1, 1, 1, 1,
-1.638505, 0.1185261, -2.412137, 1, 1, 1, 1, 1,
-1.634822, -0.2570201, -2.943248, 1, 1, 1, 1, 1,
-1.631513, 0.4873238, -2.285598, 1, 1, 1, 1, 1,
-1.629985, 0.291607, -2.142984, 1, 1, 1, 1, 1,
-1.629133, 0.8129432, -2.157159, 0, 0, 1, 1, 1,
-1.628262, 1.104705, -1.307514, 1, 0, 0, 1, 1,
-1.621519, -0.43546, -0.8878, 1, 0, 0, 1, 1,
-1.618034, -0.6026148, -0.5383382, 1, 0, 0, 1, 1,
-1.614095, -1.480019, -2.246632, 1, 0, 0, 1, 1,
-1.58742, -0.8632987, -1.43597, 1, 0, 0, 1, 1,
-1.579765, 0.2996583, -2.218586, 0, 0, 0, 1, 1,
-1.578744, -0.6248116, -2.010931, 0, 0, 0, 1, 1,
-1.558119, 1.458899, -0.9737357, 0, 0, 0, 1, 1,
-1.558096, -0.06607851, -0.9198604, 0, 0, 0, 1, 1,
-1.55237, -1.426501, -2.101563, 0, 0, 0, 1, 1,
-1.545727, 1.191891, -0.5692821, 0, 0, 0, 1, 1,
-1.531197, 0.4384468, -3.690642, 0, 0, 0, 1, 1,
-1.522594, 0.9438338, -1.151744, 1, 1, 1, 1, 1,
-1.519874, 1.122053, -0.524839, 1, 1, 1, 1, 1,
-1.518182, -0.6343402, -3.22353, 1, 1, 1, 1, 1,
-1.51333, 0.1316952, -1.390827, 1, 1, 1, 1, 1,
-1.505952, -1.849771, -1.997707, 1, 1, 1, 1, 1,
-1.495986, -1.684258, -2.560258, 1, 1, 1, 1, 1,
-1.490329, -3.340453, -1.414158, 1, 1, 1, 1, 1,
-1.488508, -1.496206, -1.78579, 1, 1, 1, 1, 1,
-1.488114, 2.707718, -0.444265, 1, 1, 1, 1, 1,
-1.467615, 0.1149422, -1.66957, 1, 1, 1, 1, 1,
-1.463983, 0.02012119, -3.477519, 1, 1, 1, 1, 1,
-1.438274, 0.07469355, -1.764376, 1, 1, 1, 1, 1,
-1.435187, -3.356229, -2.286724, 1, 1, 1, 1, 1,
-1.412062, -1.051177, -3.088355, 1, 1, 1, 1, 1,
-1.411763, 0.01327476, -1.627007, 1, 1, 1, 1, 1,
-1.411232, 1.033144, -1.892759, 0, 0, 1, 1, 1,
-1.40958, 0.4326099, 0.009845003, 1, 0, 0, 1, 1,
-1.409071, -0.2156744, -0.6650189, 1, 0, 0, 1, 1,
-1.407193, -0.3097749, -1.892777, 1, 0, 0, 1, 1,
-1.391422, -0.4358208, -1.423407, 1, 0, 0, 1, 1,
-1.389974, 0.5417477, -2.197351, 1, 0, 0, 1, 1,
-1.384469, -0.6176642, -1.962737, 0, 0, 0, 1, 1,
-1.375254, -0.7838511, -1.23937, 0, 0, 0, 1, 1,
-1.358616, -0.5963075, -1.173836, 0, 0, 0, 1, 1,
-1.337869, 2.505481, -1.430822, 0, 0, 0, 1, 1,
-1.324679, -1.589642, -2.151897, 0, 0, 0, 1, 1,
-1.303862, 0.4238556, -0.7804661, 0, 0, 0, 1, 1,
-1.294662, -0.2566272, -0.6979526, 0, 0, 0, 1, 1,
-1.280169, -1.531278, -4.355807, 1, 1, 1, 1, 1,
-1.27254, 0.7678532, -0.1015739, 1, 1, 1, 1, 1,
-1.271179, -2.102219, -2.28664, 1, 1, 1, 1, 1,
-1.270996, 0.6814737, -1.608648, 1, 1, 1, 1, 1,
-1.251327, 1.192407, -1.362832, 1, 1, 1, 1, 1,
-1.249612, 1.462018, -0.4141055, 1, 1, 1, 1, 1,
-1.249429, 1.328534, -0.3312896, 1, 1, 1, 1, 1,
-1.249215, -0.2410629, -1.06508, 1, 1, 1, 1, 1,
-1.249096, -0.05093935, -2.458207, 1, 1, 1, 1, 1,
-1.236928, 2.462952, -0.235181, 1, 1, 1, 1, 1,
-1.234396, -1.146273, -1.968883, 1, 1, 1, 1, 1,
-1.234065, -0.02109038, -3.320162, 1, 1, 1, 1, 1,
-1.227605, -0.2912088, -2.219256, 1, 1, 1, 1, 1,
-1.220654, -0.05548886, -2.553704, 1, 1, 1, 1, 1,
-1.21179, 0.9031184, 0.0210991, 1, 1, 1, 1, 1,
-1.210407, 0.9464905, -0.2751279, 0, 0, 1, 1, 1,
-1.20924, 0.6145979, -0.8663067, 1, 0, 0, 1, 1,
-1.177899, -1.419785, -3.088114, 1, 0, 0, 1, 1,
-1.177616, 0.9345118, -1.796351, 1, 0, 0, 1, 1,
-1.176251, 0.6716113, -3.994119, 1, 0, 0, 1, 1,
-1.174556, -1.256258, -3.325114, 1, 0, 0, 1, 1,
-1.173293, -0.18618, -0.5620615, 0, 0, 0, 1, 1,
-1.167347, 0.5877856, -0.1578228, 0, 0, 0, 1, 1,
-1.150319, -1.002268, -3.200787, 0, 0, 0, 1, 1,
-1.14952, -0.8523778, -0.8664718, 0, 0, 0, 1, 1,
-1.14652, 0.8464702, -0.005145251, 0, 0, 0, 1, 1,
-1.143253, 1.187723, -0.5634161, 0, 0, 0, 1, 1,
-1.142812, 0.5486265, -1.193767, 0, 0, 0, 1, 1,
-1.142108, -0.2404902, -2.045471, 1, 1, 1, 1, 1,
-1.140996, -0.3597809, -0.8447341, 1, 1, 1, 1, 1,
-1.140285, 1.767788, 0.6252175, 1, 1, 1, 1, 1,
-1.137388, -1.750404, -2.630186, 1, 1, 1, 1, 1,
-1.125373, -0.3029238, -0.628804, 1, 1, 1, 1, 1,
-1.123376, 0.1267687, -0.2389133, 1, 1, 1, 1, 1,
-1.115227, -0.8603018, 0.06113036, 1, 1, 1, 1, 1,
-1.097596, -0.3407045, -3.065317, 1, 1, 1, 1, 1,
-1.086125, 0.8533515, -1.320496, 1, 1, 1, 1, 1,
-1.083411, -0.8747522, -3.577696, 1, 1, 1, 1, 1,
-1.06676, -0.2702276, -3.79844, 1, 1, 1, 1, 1,
-1.064166, 1.135703, 0.04466102, 1, 1, 1, 1, 1,
-1.059395, -0.09730899, 0.3443529, 1, 1, 1, 1, 1,
-1.046092, 1.650897, 0.992169, 1, 1, 1, 1, 1,
-1.045764, -0.8996568, -1.520958, 1, 1, 1, 1, 1,
-1.045352, 2.212458, -0.5554962, 0, 0, 1, 1, 1,
-1.045321, 1.28833, -1.512608, 1, 0, 0, 1, 1,
-1.041171, -0.5430538, -2.009435, 1, 0, 0, 1, 1,
-1.040736, 0.1217119, -1.037439, 1, 0, 0, 1, 1,
-1.031165, 0.2684867, -1.72147, 1, 0, 0, 1, 1,
-1.028861, 0.6413349, -3.449605, 1, 0, 0, 1, 1,
-1.016079, 1.326899, -0.5554401, 0, 0, 0, 1, 1,
-1.01025, 0.7678074, -1.670337, 0, 0, 0, 1, 1,
-1.000417, -0.225536, -3.719076, 0, 0, 0, 1, 1,
-0.9963447, 0.1587123, -1.495531, 0, 0, 0, 1, 1,
-0.9926106, 2.109293, -1.418962, 0, 0, 0, 1, 1,
-0.9910558, 0.4908209, -1.649727, 0, 0, 0, 1, 1,
-0.9884437, -0.2172018, -3.153398, 0, 0, 0, 1, 1,
-0.9690264, -0.1884035, -3.264055, 1, 1, 1, 1, 1,
-0.9669394, 0.7943352, -0.06366293, 1, 1, 1, 1, 1,
-0.9601665, -0.5195782, -2.607139, 1, 1, 1, 1, 1,
-0.9544472, 0.5487778, -1.394106, 1, 1, 1, 1, 1,
-0.9521163, 0.1512242, 0.1382763, 1, 1, 1, 1, 1,
-0.9490834, -1.794519, -2.021026, 1, 1, 1, 1, 1,
-0.9458483, 0.6811904, -1.103176, 1, 1, 1, 1, 1,
-0.9458255, -0.5301329, -1.006874, 1, 1, 1, 1, 1,
-0.9441707, 1.001711, -0.3156225, 1, 1, 1, 1, 1,
-0.9422793, -0.330102, -1.789835, 1, 1, 1, 1, 1,
-0.941238, -1.46508, -2.526794, 1, 1, 1, 1, 1,
-0.9395341, -0.4694692, -4.480506, 1, 1, 1, 1, 1,
-0.9384692, 0.895408, 0.7278336, 1, 1, 1, 1, 1,
-0.9247727, 1.656427, -0.6358155, 1, 1, 1, 1, 1,
-0.9169106, 0.4732903, 0.07191102, 1, 1, 1, 1, 1,
-0.9158908, 1.035533, -1.457314, 0, 0, 1, 1, 1,
-0.9107554, 1.34307, -0.346408, 1, 0, 0, 1, 1,
-0.908334, 0.3293878, -2.843464, 1, 0, 0, 1, 1,
-0.9065299, 0.1743725, -1.983276, 1, 0, 0, 1, 1,
-0.900003, -0.1191548, -1.237863, 1, 0, 0, 1, 1,
-0.8946933, 2.114917, -0.541868, 1, 0, 0, 1, 1,
-0.8812444, -1.356119, -1.863678, 0, 0, 0, 1, 1,
-0.8761164, -1.239739, -2.464318, 0, 0, 0, 1, 1,
-0.86957, -0.6939066, -2.762806, 0, 0, 0, 1, 1,
-0.8680431, -0.5411204, -2.693673, 0, 0, 0, 1, 1,
-0.8676788, 0.2339354, -2.287855, 0, 0, 0, 1, 1,
-0.8582653, -0.9343205, -2.20309, 0, 0, 0, 1, 1,
-0.8570654, -0.5327822, -1.169855, 0, 0, 0, 1, 1,
-0.855827, -1.025696, -2.537644, 1, 1, 1, 1, 1,
-0.8542953, 0.03179305, -0.4106078, 1, 1, 1, 1, 1,
-0.8533019, -1.363081, -2.271254, 1, 1, 1, 1, 1,
-0.8524126, -1.022567, -1.072037, 1, 1, 1, 1, 1,
-0.8509032, 1.01833, -1.238983, 1, 1, 1, 1, 1,
-0.8486398, 0.1284165, -0.991264, 1, 1, 1, 1, 1,
-0.8471169, -0.2219425, -0.214631, 1, 1, 1, 1, 1,
-0.8441418, -0.08163751, -0.2570909, 1, 1, 1, 1, 1,
-0.8369233, -0.6469029, -4.196062, 1, 1, 1, 1, 1,
-0.8283862, 0.9982592, -0.911902, 1, 1, 1, 1, 1,
-0.8269935, 1.122773, -0.7436727, 1, 1, 1, 1, 1,
-0.8119677, -0.6350619, -3.649486, 1, 1, 1, 1, 1,
-0.8064837, 0.4337593, -0.9215744, 1, 1, 1, 1, 1,
-0.8063549, -1.320672, -2.080467, 1, 1, 1, 1, 1,
-0.8037319, -0.3602549, -2.689345, 1, 1, 1, 1, 1,
-0.8030033, 0.1992338, -1.792989, 0, 0, 1, 1, 1,
-0.8009448, -1.235349, -2.335444, 1, 0, 0, 1, 1,
-0.797851, 1.981972, -0.3407555, 1, 0, 0, 1, 1,
-0.7959781, 1.446634, -0.902488, 1, 0, 0, 1, 1,
-0.7870152, -0.1862459, -0.8488653, 1, 0, 0, 1, 1,
-0.7867342, -0.4814792, -4.217841, 1, 0, 0, 1, 1,
-0.7822479, 2.058561, 0.667431, 0, 0, 0, 1, 1,
-0.7783458, -1.155618, -3.754621, 0, 0, 0, 1, 1,
-0.7756555, -1.321066, -1.924909, 0, 0, 0, 1, 1,
-0.7736878, 1.665839, -0.162352, 0, 0, 0, 1, 1,
-0.7711865, 0.6456287, -1.665368, 0, 0, 0, 1, 1,
-0.7618684, 0.439235, -0.7235143, 0, 0, 0, 1, 1,
-0.7610924, -0.5237559, -3.53989, 0, 0, 0, 1, 1,
-0.7589934, -1.19636, -3.121226, 1, 1, 1, 1, 1,
-0.7577723, 0.6174737, -0.07828718, 1, 1, 1, 1, 1,
-0.7515898, 2.119032, -0.4755583, 1, 1, 1, 1, 1,
-0.7484897, 0.6576464, -0.6843366, 1, 1, 1, 1, 1,
-0.748378, 1.630981, 0.7286142, 1, 1, 1, 1, 1,
-0.7470358, -0.01108999, 0.2178398, 1, 1, 1, 1, 1,
-0.7463131, 0.1854983, -0.7822506, 1, 1, 1, 1, 1,
-0.7462366, -0.2314537, -2.540411, 1, 1, 1, 1, 1,
-0.7424512, -0.6371244, -1.491568, 1, 1, 1, 1, 1,
-0.7421996, -0.7648082, -3.487199, 1, 1, 1, 1, 1,
-0.7407289, 0.06531484, -2.388632, 1, 1, 1, 1, 1,
-0.7369564, -0.4952583, -3.342487, 1, 1, 1, 1, 1,
-0.7365522, -0.6328279, -1.403767, 1, 1, 1, 1, 1,
-0.7294357, 0.6428758, -0.8050889, 1, 1, 1, 1, 1,
-0.7287204, 1.156165, -0.644011, 1, 1, 1, 1, 1,
-0.7269261, 0.3107125, -0.6307884, 0, 0, 1, 1, 1,
-0.7214577, 0.1297424, -0.1730825, 1, 0, 0, 1, 1,
-0.7148029, 1.004097, -0.9430003, 1, 0, 0, 1, 1,
-0.7120791, 0.3749967, -3.024983, 1, 0, 0, 1, 1,
-0.7102094, 0.4160262, -1.217273, 1, 0, 0, 1, 1,
-0.7093628, 1.15185, -0.6640224, 1, 0, 0, 1, 1,
-0.706131, 0.9595198, -0.637013, 0, 0, 0, 1, 1,
-0.7060477, -0.7072693, -1.426705, 0, 0, 0, 1, 1,
-0.7032757, -0.07501943, -1.036272, 0, 0, 0, 1, 1,
-0.7017877, 0.6968922, 0.03324549, 0, 0, 0, 1, 1,
-0.6989672, 0.2457105, 0.3961579, 0, 0, 0, 1, 1,
-0.6944903, -0.2760946, -1.533085, 0, 0, 0, 1, 1,
-0.6873839, -0.5001151, -1.684411, 0, 0, 0, 1, 1,
-0.6863648, -1.79086, -1.440642, 1, 1, 1, 1, 1,
-0.6833696, -0.5838357, -1.496238, 1, 1, 1, 1, 1,
-0.6806597, -0.02898151, -1.281628, 1, 1, 1, 1, 1,
-0.668566, -0.8324983, -2.090022, 1, 1, 1, 1, 1,
-0.6624275, 0.2333784, -1.933877, 1, 1, 1, 1, 1,
-0.6557136, 1.042861, 0.8986675, 1, 1, 1, 1, 1,
-0.6527916, 0.3265161, -0.2656986, 1, 1, 1, 1, 1,
-0.6524028, 0.3534937, -0.8779042, 1, 1, 1, 1, 1,
-0.6502351, 0.5305761, -2.403909, 1, 1, 1, 1, 1,
-0.6478125, -1.120233, -2.596376, 1, 1, 1, 1, 1,
-0.6449327, 0.7757495, -0.826515, 1, 1, 1, 1, 1,
-0.6446469, 0.8015302, -0.01231742, 1, 1, 1, 1, 1,
-0.6394444, 0.1168266, -1.412369, 1, 1, 1, 1, 1,
-0.6368769, 1.208699, -0.667756, 1, 1, 1, 1, 1,
-0.6344181, -0.7806726, -2.228723, 1, 1, 1, 1, 1,
-0.6293895, -1.125329, -3.00626, 0, 0, 1, 1, 1,
-0.6284577, -0.2636515, -2.042285, 1, 0, 0, 1, 1,
-0.6260664, 0.520291, -1.469156, 1, 0, 0, 1, 1,
-0.6258366, 1.646401, -0.4173067, 1, 0, 0, 1, 1,
-0.6247219, -0.5110453, -3.104871, 1, 0, 0, 1, 1,
-0.6225656, -1.815588, -1.369171, 1, 0, 0, 1, 1,
-0.6200855, 1.268853, -0.4232523, 0, 0, 0, 1, 1,
-0.613677, 0.4786223, -0.9244764, 0, 0, 0, 1, 1,
-0.6120926, 0.3307092, -1.830185, 0, 0, 0, 1, 1,
-0.6104784, -0.5922289, -3.251679, 0, 0, 0, 1, 1,
-0.6096284, 1.099195, 0.3789746, 0, 0, 0, 1, 1,
-0.6087905, 1.291511, 0.7072434, 0, 0, 0, 1, 1,
-0.6038835, -1.406034, -3.277368, 0, 0, 0, 1, 1,
-0.6023492, 2.366124, 0.3086337, 1, 1, 1, 1, 1,
-0.5961615, -0.1527473, -1.13359, 1, 1, 1, 1, 1,
-0.5958821, 0.890966, 0.6591842, 1, 1, 1, 1, 1,
-0.5935189, 0.4182958, -2.817445, 1, 1, 1, 1, 1,
-0.592345, 0.569782, -0.2307826, 1, 1, 1, 1, 1,
-0.590398, 0.2011677, 0.4015714, 1, 1, 1, 1, 1,
-0.5887429, 0.594734, -0.3245455, 1, 1, 1, 1, 1,
-0.5789902, -2.007773, -3.651957, 1, 1, 1, 1, 1,
-0.5782532, -0.6561577, -4.169281, 1, 1, 1, 1, 1,
-0.5752182, -0.2222908, -1.138703, 1, 1, 1, 1, 1,
-0.5691591, -0.7350186, -1.233864, 1, 1, 1, 1, 1,
-0.5680788, -1.239823, -1.121359, 1, 1, 1, 1, 1,
-0.5666915, -1.506205, -1.858007, 1, 1, 1, 1, 1,
-0.5504865, 0.06326956, -1.592716, 1, 1, 1, 1, 1,
-0.540565, -0.9529305, -3.298926, 1, 1, 1, 1, 1,
-0.5400116, -0.3655857, -2.190367, 0, 0, 1, 1, 1,
-0.5357482, 0.3763532, -0.3071337, 1, 0, 0, 1, 1,
-0.530323, 0.02120887, 0.2300622, 1, 0, 0, 1, 1,
-0.523966, 0.9572225, -0.8926806, 1, 0, 0, 1, 1,
-0.5238193, -0.1856944, -1.290619, 1, 0, 0, 1, 1,
-0.5230872, 1.130122, -1.029182, 1, 0, 0, 1, 1,
-0.5205785, -0.3214534, -0.6750419, 0, 0, 0, 1, 1,
-0.5176259, -0.8078012, -1.611601, 0, 0, 0, 1, 1,
-0.5155594, 0.4617868, -0.9255581, 0, 0, 0, 1, 1,
-0.5112716, -0.1832582, -4.664702, 0, 0, 0, 1, 1,
-0.5066719, -1.008628, -2.806828, 0, 0, 0, 1, 1,
-0.5053576, 0.7256233, 0.05831952, 0, 0, 0, 1, 1,
-0.5040225, 2.164537, 1.21724, 0, 0, 0, 1, 1,
-0.5035836, -0.9658005, -2.783402, 1, 1, 1, 1, 1,
-0.5017801, 0.5771195, -0.7122918, 1, 1, 1, 1, 1,
-0.5016469, -0.262339, -1.964714, 1, 1, 1, 1, 1,
-0.5000057, 0.2379304, -0.01102064, 1, 1, 1, 1, 1,
-0.4964809, -0.7173123, -2.610867, 1, 1, 1, 1, 1,
-0.494768, 0.4576582, -0.3435195, 1, 1, 1, 1, 1,
-0.4943034, -0.2662684, -2.702673, 1, 1, 1, 1, 1,
-0.4922177, -0.2593692, -0.7827669, 1, 1, 1, 1, 1,
-0.4895959, 0.9918026, 0.6222147, 1, 1, 1, 1, 1,
-0.4876881, -0.03709034, -2.688039, 1, 1, 1, 1, 1,
-0.4872872, 0.07047591, -1.346006, 1, 1, 1, 1, 1,
-0.486457, 0.4048515, 0.3341102, 1, 1, 1, 1, 1,
-0.4840732, -0.52458, -3.114391, 1, 1, 1, 1, 1,
-0.4826835, -0.478085, -1.017384, 1, 1, 1, 1, 1,
-0.4813786, 1.073477, -2.403049, 1, 1, 1, 1, 1,
-0.4742305, 0.2268452, 0.1036499, 0, 0, 1, 1, 1,
-0.4725797, 0.5685918, -0.9488093, 1, 0, 0, 1, 1,
-0.4717664, -0.3196766, -2.441163, 1, 0, 0, 1, 1,
-0.4709989, 1.149322, -0.1736459, 1, 0, 0, 1, 1,
-0.4614891, 1.119371, 0.2699962, 1, 0, 0, 1, 1,
-0.4598111, 1.392785, 0.08800872, 1, 0, 0, 1, 1,
-0.4561674, -0.002853785, -1.740791, 0, 0, 0, 1, 1,
-0.4550126, -0.6574006, -0.9049269, 0, 0, 0, 1, 1,
-0.4549935, 0.1293311, -2.747723, 0, 0, 0, 1, 1,
-0.452969, -0.9399028, -1.679176, 0, 0, 0, 1, 1,
-0.4506503, 0.3020148, -1.275209, 0, 0, 0, 1, 1,
-0.4505338, -1.676914, -2.221037, 0, 0, 0, 1, 1,
-0.4490573, 1.167151, -0.07658809, 0, 0, 0, 1, 1,
-0.4489199, -0.008103764, -2.8881, 1, 1, 1, 1, 1,
-0.4488417, 0.3394569, -0.762266, 1, 1, 1, 1, 1,
-0.4438868, 1.099481, -1.789672, 1, 1, 1, 1, 1,
-0.4422184, -1.604177, -4.092577, 1, 1, 1, 1, 1,
-0.4391901, 1.230231, -0.2224883, 1, 1, 1, 1, 1,
-0.4379348, -1.175393, -4.100543, 1, 1, 1, 1, 1,
-0.4356863, -0.02853685, -0.7780439, 1, 1, 1, 1, 1,
-0.4293733, 0.1161566, -2.726116, 1, 1, 1, 1, 1,
-0.4292553, 1.232181, -0.05025326, 1, 1, 1, 1, 1,
-0.425271, -1.151418, -3.749676, 1, 1, 1, 1, 1,
-0.4181329, 0.472514, -2.11896, 1, 1, 1, 1, 1,
-0.4171411, 0.9823354, -1.11932, 1, 1, 1, 1, 1,
-0.4140205, -0.8627728, -1.946302, 1, 1, 1, 1, 1,
-0.4125802, 0.3823339, -1.880337, 1, 1, 1, 1, 1,
-0.4094269, -0.07216742, -2.138306, 1, 1, 1, 1, 1,
-0.4093451, -0.8760603, -3.179027, 0, 0, 1, 1, 1,
-0.4072098, 1.592664, -0.3846699, 1, 0, 0, 1, 1,
-0.3989036, 0.1809777, -2.110893, 1, 0, 0, 1, 1,
-0.3986511, 2.396059, 0.02289123, 1, 0, 0, 1, 1,
-0.3947661, 1.735799, -0.8309273, 1, 0, 0, 1, 1,
-0.3915247, -0.6974967, -3.401308, 1, 0, 0, 1, 1,
-0.3872047, 1.670405, 0.7647012, 0, 0, 0, 1, 1,
-0.3869343, -0.9527893, -2.254256, 0, 0, 0, 1, 1,
-0.3866211, -1.019948, -2.841012, 0, 0, 0, 1, 1,
-0.3860117, -1.105969, -3.811017, 0, 0, 0, 1, 1,
-0.3798182, 0.3489649, -1.452608, 0, 0, 0, 1, 1,
-0.379122, 2.006548, 0.01307985, 0, 0, 0, 1, 1,
-0.3776614, 1.021751, -0.5117443, 0, 0, 0, 1, 1,
-0.3748071, 0.7780416, -0.08623688, 1, 1, 1, 1, 1,
-0.3727995, 1.605281, 0.04266656, 1, 1, 1, 1, 1,
-0.361009, 0.2195003, -1.128807, 1, 1, 1, 1, 1,
-0.3586619, -0.06210948, -1.523804, 1, 1, 1, 1, 1,
-0.354743, -2.52165, -3.576907, 1, 1, 1, 1, 1,
-0.3546848, -1.563236, -2.001359, 1, 1, 1, 1, 1,
-0.3531874, -0.9849672, -2.005702, 1, 1, 1, 1, 1,
-0.3525082, 0.8040665, -1.009137, 1, 1, 1, 1, 1,
-0.3493681, 0.5868806, -1.820855, 1, 1, 1, 1, 1,
-0.3484997, 0.1915246, -1.815943, 1, 1, 1, 1, 1,
-0.3481448, -0.9010821, -1.50384, 1, 1, 1, 1, 1,
-0.347997, 1.008222, -1.304326, 1, 1, 1, 1, 1,
-0.3396604, -0.7050832, -3.052355, 1, 1, 1, 1, 1,
-0.3297086, -1.265284, -2.574374, 1, 1, 1, 1, 1,
-0.3210113, -0.6993153, -3.270901, 1, 1, 1, 1, 1,
-0.3165372, -0.6531179, -3.010537, 0, 0, 1, 1, 1,
-0.3151571, 0.5048708, -0.2742646, 1, 0, 0, 1, 1,
-0.3050889, 1.144941, -0.7765582, 1, 0, 0, 1, 1,
-0.2949639, 0.2320498, -0.966957, 1, 0, 0, 1, 1,
-0.294882, 1.464257, 0.03227318, 1, 0, 0, 1, 1,
-0.2947686, -0.9719979, -1.294752, 1, 0, 0, 1, 1,
-0.2934785, -0.6039957, -5.51864, 0, 0, 0, 1, 1,
-0.2893416, 0.3419277, -0.1855719, 0, 0, 0, 1, 1,
-0.289139, 0.7338106, -1.022134, 0, 0, 0, 1, 1,
-0.2830854, -0.08222977, -3.873364, 0, 0, 0, 1, 1,
-0.2814194, 0.9378135, -0.5482816, 0, 0, 0, 1, 1,
-0.2784849, 0.745478, -0.9726425, 0, 0, 0, 1, 1,
-0.2771632, -0.2351688, -1.8168, 0, 0, 0, 1, 1,
-0.2768266, 0.006781713, -1.71141, 1, 1, 1, 1, 1,
-0.2763286, -0.9931167, -1.49166, 1, 1, 1, 1, 1,
-0.2742873, 1.323641, 0.6607593, 1, 1, 1, 1, 1,
-0.2739657, 0.7309092, -0.5206142, 1, 1, 1, 1, 1,
-0.2722053, 1.085742, -1.123878, 1, 1, 1, 1, 1,
-0.271751, -1.484983, -2.327816, 1, 1, 1, 1, 1,
-0.2713331, -0.6024886, -3.673112, 1, 1, 1, 1, 1,
-0.266434, 0.6500784, -0.4584564, 1, 1, 1, 1, 1,
-0.2630039, -1.059784, -2.86125, 1, 1, 1, 1, 1,
-0.2627257, -1.329376, -1.206191, 1, 1, 1, 1, 1,
-0.2626425, 0.4709498, 0.022585, 1, 1, 1, 1, 1,
-0.2597419, -0.6251788, -2.833174, 1, 1, 1, 1, 1,
-0.2488884, 0.4535723, -1.086298, 1, 1, 1, 1, 1,
-0.2408084, 0.4724219, -0.8800156, 1, 1, 1, 1, 1,
-0.2350428, 0.07014445, 0.4752401, 1, 1, 1, 1, 1,
-0.2332199, -1.234538, -1.853725, 0, 0, 1, 1, 1,
-0.2317774, -0.06582855, -3.038813, 1, 0, 0, 1, 1,
-0.2290334, 0.6412266, -1.744459, 1, 0, 0, 1, 1,
-0.2288734, 0.1856851, -0.2333206, 1, 0, 0, 1, 1,
-0.2273696, 1.53917, 0.03985348, 1, 0, 0, 1, 1,
-0.2265369, 1.862699, -0.7069765, 1, 0, 0, 1, 1,
-0.2243859, -1.079618, -3.667184, 0, 0, 0, 1, 1,
-0.2239699, 0.721611, -0.2243009, 0, 0, 0, 1, 1,
-0.2231836, -1.12064, -2.359039, 0, 0, 0, 1, 1,
-0.2187034, 0.4692554, 0.02399324, 0, 0, 0, 1, 1,
-0.218489, 2.255969, 1.129122, 0, 0, 0, 1, 1,
-0.2164688, -0.187385, -2.289809, 0, 0, 0, 1, 1,
-0.2106669, 2.006998, -1.243642, 0, 0, 0, 1, 1,
-0.2020771, -0.3534881, -3.037808, 1, 1, 1, 1, 1,
-0.1981207, 0.6713246, 1.328946, 1, 1, 1, 1, 1,
-0.1976656, -0.5478187, -4.160381, 1, 1, 1, 1, 1,
-0.1960481, -0.8246377, -4.516848, 1, 1, 1, 1, 1,
-0.1903408, 0.1944445, -2.470526, 1, 1, 1, 1, 1,
-0.1898061, -0.06331012, -1.995847, 1, 1, 1, 1, 1,
-0.1857903, -0.4047151, -2.706048, 1, 1, 1, 1, 1,
-0.1855253, -0.8181886, -3.607126, 1, 1, 1, 1, 1,
-0.1840175, 0.4707703, -0.9662708, 1, 1, 1, 1, 1,
-0.1838561, 2.291652, -0.4633479, 1, 1, 1, 1, 1,
-0.183414, 0.06977613, -0.9720333, 1, 1, 1, 1, 1,
-0.1828519, -1.224896, -4.059132, 1, 1, 1, 1, 1,
-0.1802191, -1.055807, -2.654907, 1, 1, 1, 1, 1,
-0.1779945, 1.815803, 2.325235, 1, 1, 1, 1, 1,
-0.1724477, 2.154643, -0.14762, 1, 1, 1, 1, 1,
-0.1679301, -0.899183, -2.76767, 0, 0, 1, 1, 1,
-0.1655527, -0.8487168, -2.427879, 1, 0, 0, 1, 1,
-0.1634424, 1.875921, 0.006413863, 1, 0, 0, 1, 1,
-0.1627033, -1.675756, -2.839532, 1, 0, 0, 1, 1,
-0.1624077, 0.461845, -0.4474086, 1, 0, 0, 1, 1,
-0.1608689, -0.3824992, -3.022017, 1, 0, 0, 1, 1,
-0.158371, -0.8067617, -2.948226, 0, 0, 0, 1, 1,
-0.1551094, -0.05046022, -2.991598, 0, 0, 0, 1, 1,
-0.1542215, -0.3787159, -2.764245, 0, 0, 0, 1, 1,
-0.1488921, 0.5960202, 0.6148471, 0, 0, 0, 1, 1,
-0.1486736, -0.359351, -4.386135, 0, 0, 0, 1, 1,
-0.1465171, 0.4801033, 0.3880605, 0, 0, 0, 1, 1,
-0.1461977, -0.318716, -1.773796, 0, 0, 0, 1, 1,
-0.1449579, -0.5093607, -1.256531, 1, 1, 1, 1, 1,
-0.1427856, -0.6563791, -1.955693, 1, 1, 1, 1, 1,
-0.1391375, -0.428, -3.064478, 1, 1, 1, 1, 1,
-0.1372755, -0.05001736, -1.248855, 1, 1, 1, 1, 1,
-0.1366478, -0.5756266, -3.847035, 1, 1, 1, 1, 1,
-0.1361759, 0.1892019, -2.341411, 1, 1, 1, 1, 1,
-0.1316531, -0.5372701, -3.097746, 1, 1, 1, 1, 1,
-0.1295148, 0.9957372, 0.4222515, 1, 1, 1, 1, 1,
-0.1257059, -1.337917, -3.114862, 1, 1, 1, 1, 1,
-0.118566, 1.287769, 0.3446212, 1, 1, 1, 1, 1,
-0.1162618, 0.5783034, 0.5994703, 1, 1, 1, 1, 1,
-0.1159035, -0.0643006, -1.141574, 1, 1, 1, 1, 1,
-0.115096, 1.385847, -0.7904605, 1, 1, 1, 1, 1,
-0.1138723, 0.0419614, -2.270532, 1, 1, 1, 1, 1,
-0.1123754, -0.6049325, -2.948363, 1, 1, 1, 1, 1,
-0.1116765, 1.318468, -1.673714, 0, 0, 1, 1, 1,
-0.109781, -0.6247901, -3.095701, 1, 0, 0, 1, 1,
-0.1090471, 0.1702825, -0.3066053, 1, 0, 0, 1, 1,
-0.1013609, 1.712681, -0.05556871, 1, 0, 0, 1, 1,
-0.09927675, 1.327655, -0.5744001, 1, 0, 0, 1, 1,
-0.09475558, -1.118456, -3.58742, 1, 0, 0, 1, 1,
-0.09365222, -0.746944, -2.343886, 0, 0, 0, 1, 1,
-0.09151208, -0.2037065, -1.389193, 0, 0, 0, 1, 1,
-0.09129921, 0.4710378, -0.529485, 0, 0, 0, 1, 1,
-0.08886509, -0.0142758, -2.79305, 0, 0, 0, 1, 1,
-0.08872819, -0.5796556, -1.571705, 0, 0, 0, 1, 1,
-0.08442152, 0.7343636, 0.5873207, 0, 0, 0, 1, 1,
-0.08367542, -0.7430743, -4.129133, 0, 0, 0, 1, 1,
-0.08357345, 0.8164556, 0.6995723, 1, 1, 1, 1, 1,
-0.08189407, 0.9543468, 0.5759134, 1, 1, 1, 1, 1,
-0.0812524, 0.1809056, -3.122985, 1, 1, 1, 1, 1,
-0.08113268, 0.3070328, 0.4934615, 1, 1, 1, 1, 1,
-0.0773894, -0.009459546, -1.35016, 1, 1, 1, 1, 1,
-0.0768786, -0.1322574, -1.648027, 1, 1, 1, 1, 1,
-0.07589772, -0.6502624, -3.664167, 1, 1, 1, 1, 1,
-0.07493091, 0.197056, -0.0169767, 1, 1, 1, 1, 1,
-0.07437005, 0.02332428, -1.213197, 1, 1, 1, 1, 1,
-0.07293041, -2.008133, -4.025002, 1, 1, 1, 1, 1,
-0.07129611, 0.08802408, -0.213228, 1, 1, 1, 1, 1,
-0.06511227, -2.14357, -3.954272, 1, 1, 1, 1, 1,
-0.05751776, -0.1152762, -2.753139, 1, 1, 1, 1, 1,
-0.05646571, -0.9811037, -2.307075, 1, 1, 1, 1, 1,
-0.05333618, -1.188262, -2.871323, 1, 1, 1, 1, 1,
-0.05193867, -0.4308603, -3.6055, 0, 0, 1, 1, 1,
-0.05013004, -1.346076, -1.638921, 1, 0, 0, 1, 1,
-0.04940629, -0.05965815, -2.425785, 1, 0, 0, 1, 1,
-0.04724498, 1.457822, -0.8102342, 1, 0, 0, 1, 1,
-0.0451498, 0.4894964, 0.4422741, 1, 0, 0, 1, 1,
-0.04421016, -0.4334082, -2.6065, 1, 0, 0, 1, 1,
-0.04325922, 0.4589373, -0.6013665, 0, 0, 0, 1, 1,
-0.04316112, -0.1185327, -2.243868, 0, 0, 0, 1, 1,
-0.03855322, -0.04497666, -3.249619, 0, 0, 0, 1, 1,
-0.03817918, -1.034731, -3.787776, 0, 0, 0, 1, 1,
-0.0354708, -1.798845, -3.099709, 0, 0, 0, 1, 1,
-0.03498884, -0.4212653, -3.934616, 0, 0, 0, 1, 1,
-0.03185487, -2.104894, -2.44314, 0, 0, 0, 1, 1,
-0.03143284, -1.171417, -2.996588, 1, 1, 1, 1, 1,
-0.02688457, 0.006979321, 0.2197932, 1, 1, 1, 1, 1,
-0.02612109, -0.7074647, -2.985811, 1, 1, 1, 1, 1,
-0.01756093, -1.082751, -1.446474, 1, 1, 1, 1, 1,
-0.01559204, 0.6532908, -0.4072638, 1, 1, 1, 1, 1,
-0.01143304, -0.3056867, -3.049233, 1, 1, 1, 1, 1,
-0.006701931, -0.6192331, -3.149328, 1, 1, 1, 1, 1,
-0.005969516, 0.002857264, -1.377298, 1, 1, 1, 1, 1,
-0.005948505, 1.499977, 0.1840248, 1, 1, 1, 1, 1,
-0.001951791, 1.489243, 0.01097337, 1, 1, 1, 1, 1,
0.0009932152, 1.298126, -0.3294237, 1, 1, 1, 1, 1,
0.008624258, 0.1291694, -0.5842142, 1, 1, 1, 1, 1,
0.009917576, -0.2488736, 2.942385, 1, 1, 1, 1, 1,
0.01357977, -1.440016, 4.605875, 1, 1, 1, 1, 1,
0.01375323, 1.973687, 0.2984792, 1, 1, 1, 1, 1,
0.0138461, 0.8194944, 0.7970831, 0, 0, 1, 1, 1,
0.01726018, -0.4545258, 2.464445, 1, 0, 0, 1, 1,
0.0209654, 0.9578925, 0.5561767, 1, 0, 0, 1, 1,
0.02364752, 0.1683494, 1.299362, 1, 0, 0, 1, 1,
0.02522287, 0.3189719, 0.1684869, 1, 0, 0, 1, 1,
0.02547059, -0.1637211, 2.683994, 1, 0, 0, 1, 1,
0.02903224, -1.954258, 2.919542, 0, 0, 0, 1, 1,
0.03107357, 0.442967, 0.3522359, 0, 0, 0, 1, 1,
0.03224555, -0.5979276, 2.780169, 0, 0, 0, 1, 1,
0.03393419, 0.7584044, 0.4833013, 0, 0, 0, 1, 1,
0.03524181, -1.008947, 3.24792, 0, 0, 0, 1, 1,
0.03906564, 0.9066319, 0.9830992, 0, 0, 0, 1, 1,
0.04120695, -0.457034, 1.752546, 0, 0, 0, 1, 1,
0.04130711, 0.2980421, 0.4983779, 1, 1, 1, 1, 1,
0.04457093, 0.6527836, -0.350586, 1, 1, 1, 1, 1,
0.04461985, -0.3412706, 3.422301, 1, 1, 1, 1, 1,
0.04682083, -0.8684897, 2.94867, 1, 1, 1, 1, 1,
0.04817759, 0.6506622, -1.326392, 1, 1, 1, 1, 1,
0.04884546, -1.693915, 3.916905, 1, 1, 1, 1, 1,
0.05029678, -0.2432707, 2.494789, 1, 1, 1, 1, 1,
0.05165556, -1.518547, 4.090115, 1, 1, 1, 1, 1,
0.05223983, 0.9109568, -1.060971, 1, 1, 1, 1, 1,
0.05665926, -0.7391534, 0.7831657, 1, 1, 1, 1, 1,
0.06040847, 0.8082978, 0.3008364, 1, 1, 1, 1, 1,
0.06051487, -1.832409, 1.148435, 1, 1, 1, 1, 1,
0.06396914, 0.9417785, -0.2589293, 1, 1, 1, 1, 1,
0.06863888, -0.9456457, 3.680707, 1, 1, 1, 1, 1,
0.07077815, 0.7089286, -0.3213638, 1, 1, 1, 1, 1,
0.07544947, 0.2638548, 2.607193, 0, 0, 1, 1, 1,
0.0780837, -0.01556463, 1.263563, 1, 0, 0, 1, 1,
0.08107967, -0.9009866, 4.451202, 1, 0, 0, 1, 1,
0.08810156, -1.195342, 1.7821, 1, 0, 0, 1, 1,
0.08903649, 0.08557171, 1.756547, 1, 0, 0, 1, 1,
0.08999939, -0.5843333, 2.475171, 1, 0, 0, 1, 1,
0.09090099, 0.7639657, -0.4757473, 0, 0, 0, 1, 1,
0.09181117, -0.1658587, 2.065556, 0, 0, 0, 1, 1,
0.09460493, -2.131771, 3.924166, 0, 0, 0, 1, 1,
0.09758244, 1.201954, -0.7909389, 0, 0, 0, 1, 1,
0.1056939, 0.1713047, -0.3304844, 0, 0, 0, 1, 1,
0.1095217, -0.4316076, 4.203037, 0, 0, 0, 1, 1,
0.1102377, -0.6403976, 2.944808, 0, 0, 0, 1, 1,
0.1104581, 0.2732782, -2.55818, 1, 1, 1, 1, 1,
0.1107955, -0.6513995, 3.684021, 1, 1, 1, 1, 1,
0.1110268, 0.4460452, -0.9129124, 1, 1, 1, 1, 1,
0.1256489, 1.332083, -1.542237, 1, 1, 1, 1, 1,
0.1260977, 0.4786284, 0.102578, 1, 1, 1, 1, 1,
0.1288002, 2.280941, -0.39474, 1, 1, 1, 1, 1,
0.1295833, 1.016933, 0.08078147, 1, 1, 1, 1, 1,
0.130323, 0.7270362, 0.3696882, 1, 1, 1, 1, 1,
0.1329021, 2.036837, 0.7391256, 1, 1, 1, 1, 1,
0.1329573, 0.7596396, -1.735496, 1, 1, 1, 1, 1,
0.1373899, -1.211052, 2.045116, 1, 1, 1, 1, 1,
0.1407137, 0.02342283, 3.420968, 1, 1, 1, 1, 1,
0.1416266, -0.209151, 3.119254, 1, 1, 1, 1, 1,
0.1424961, 2.148281, -1.147852, 1, 1, 1, 1, 1,
0.1445417, -0.8370027, 2.988273, 1, 1, 1, 1, 1,
0.1455945, -0.1914212, 2.036981, 0, 0, 1, 1, 1,
0.145661, 1.74033, -0.183695, 1, 0, 0, 1, 1,
0.1462831, -0.2131504, 1.985093, 1, 0, 0, 1, 1,
0.1474809, -0.8858176, 4.021988, 1, 0, 0, 1, 1,
0.1500975, 0.08510073, -0.2265736, 1, 0, 0, 1, 1,
0.1582112, -0.8675147, 2.407204, 1, 0, 0, 1, 1,
0.1601255, -1.119775, 3.420648, 0, 0, 0, 1, 1,
0.1605757, -0.2509764, 1.806382, 0, 0, 0, 1, 1,
0.1662305, -0.6605245, 2.566472, 0, 0, 0, 1, 1,
0.1702242, -0.7143201, 2.664169, 0, 0, 0, 1, 1,
0.1764268, -1.719709, 3.773731, 0, 0, 0, 1, 1,
0.1767121, 0.5730399, 0.8263915, 0, 0, 0, 1, 1,
0.1811633, -0.124529, 4.128063, 0, 0, 0, 1, 1,
0.1839371, 1.534504, 0.596601, 1, 1, 1, 1, 1,
0.1858207, 0.180811, -0.08670916, 1, 1, 1, 1, 1,
0.1874283, -0.8088194, 4.371053, 1, 1, 1, 1, 1,
0.1898409, -0.8785689, 2.942975, 1, 1, 1, 1, 1,
0.1922164, -0.5381274, 1.556577, 1, 1, 1, 1, 1,
0.1946723, 0.08767735, 1.498604, 1, 1, 1, 1, 1,
0.1974293, -0.830595, 2.097986, 1, 1, 1, 1, 1,
0.1999235, 0.8166163, -1.600489, 1, 1, 1, 1, 1,
0.2007667, 1.773288, -0.02609456, 1, 1, 1, 1, 1,
0.2018953, -0.4540157, 1.584274, 1, 1, 1, 1, 1,
0.2020989, -0.1498925, 4.887861, 1, 1, 1, 1, 1,
0.205224, 1.244626, 1.639556, 1, 1, 1, 1, 1,
0.2052697, -0.8326771, 3.751974, 1, 1, 1, 1, 1,
0.2063299, 0.1306722, 0.4198727, 1, 1, 1, 1, 1,
0.2099242, -0.1953884, 0.6339926, 1, 1, 1, 1, 1,
0.2155795, -1.151837, 2.027936, 0, 0, 1, 1, 1,
0.2161459, -0.3450283, 1.777317, 1, 0, 0, 1, 1,
0.2238071, 1.632648, 0.6312949, 1, 0, 0, 1, 1,
0.2241423, -0.785145, 2.790338, 1, 0, 0, 1, 1,
0.2299351, -0.7209365, 1.720515, 1, 0, 0, 1, 1,
0.2307176, 0.3089982, 1.523333, 1, 0, 0, 1, 1,
0.2361396, 0.7215188, 0.144427, 0, 0, 0, 1, 1,
0.2382736, -0.00452852, 2.825233, 0, 0, 0, 1, 1,
0.2390486, -0.2136639, 3.737189, 0, 0, 0, 1, 1,
0.2404379, 0.4613967, 0.3871593, 0, 0, 0, 1, 1,
0.2409776, 1.396819, -0.3914332, 0, 0, 0, 1, 1,
0.2412623, 0.4687586, 0.1712863, 0, 0, 0, 1, 1,
0.2422857, 1.1012, 1.466518, 0, 0, 0, 1, 1,
0.24732, -1.022422, 1.804106, 1, 1, 1, 1, 1,
0.2481465, -0.8825492, 3.184669, 1, 1, 1, 1, 1,
0.255581, -0.7368439, 3.040539, 1, 1, 1, 1, 1,
0.2564387, -0.5649869, 3.392022, 1, 1, 1, 1, 1,
0.2617669, -2.261782, 2.706578, 1, 1, 1, 1, 1,
0.2637215, 0.3505345, 0.7957761, 1, 1, 1, 1, 1,
0.2666363, 0.5898724, -0.9118342, 1, 1, 1, 1, 1,
0.2667521, 0.6865512, -1.732231, 1, 1, 1, 1, 1,
0.2680915, -0.02456797, 2.477705, 1, 1, 1, 1, 1,
0.2717197, -0.04768639, 3.771416, 1, 1, 1, 1, 1,
0.2724864, 0.02811806, 0.9599355, 1, 1, 1, 1, 1,
0.2732444, 1.524962, -1.32758, 1, 1, 1, 1, 1,
0.2755466, 0.4455929, 0.3337691, 1, 1, 1, 1, 1,
0.2794544, -0.9363583, 3.888647, 1, 1, 1, 1, 1,
0.2825514, -1.40949, 5.531208, 1, 1, 1, 1, 1,
0.2827591, 1.162754, 1.412274, 0, 0, 1, 1, 1,
0.2836873, -0.0120122, 1.515011, 1, 0, 0, 1, 1,
0.2838584, -0.8303698, 3.975809, 1, 0, 0, 1, 1,
0.2880881, 0.500218, -1.119899, 1, 0, 0, 1, 1,
0.291684, 0.01846886, 1.342724, 1, 0, 0, 1, 1,
0.291861, -1.037266, 2.215933, 1, 0, 0, 1, 1,
0.291891, -0.07488535, -0.1792554, 0, 0, 0, 1, 1,
0.2925777, 1.565151, -1.012318, 0, 0, 0, 1, 1,
0.297533, 1.562336, 1.941239, 0, 0, 0, 1, 1,
0.3049004, 0.6181715, 1.335333, 0, 0, 0, 1, 1,
0.3072075, 0.4397579, 0.6117997, 0, 0, 0, 1, 1,
0.3095524, 0.05320118, -0.4398673, 0, 0, 0, 1, 1,
0.3127915, -0.604238, 3.332215, 0, 0, 0, 1, 1,
0.3128982, -0.6543137, 3.57214, 1, 1, 1, 1, 1,
0.3200546, -1.515132, 2.671844, 1, 1, 1, 1, 1,
0.3215635, -1.040302, 3.413802, 1, 1, 1, 1, 1,
0.3346083, 1.163201, -1.865608, 1, 1, 1, 1, 1,
0.337302, 0.227229, 1.892876, 1, 1, 1, 1, 1,
0.3389378, 0.9644638, -0.1602461, 1, 1, 1, 1, 1,
0.3428751, 2.507218, -0.8510005, 1, 1, 1, 1, 1,
0.3478607, -0.3489978, 3.551915, 1, 1, 1, 1, 1,
0.3493201, 0.667723, -0.5294638, 1, 1, 1, 1, 1,
0.3508799, 0.8276657, 0.08917172, 1, 1, 1, 1, 1,
0.3523071, 0.3799837, 1.868417, 1, 1, 1, 1, 1,
0.3527697, 0.6552516, 1.121834, 1, 1, 1, 1, 1,
0.3569134, -1.203371, 3.300279, 1, 1, 1, 1, 1,
0.3615675, 0.1408243, 0.7331344, 1, 1, 1, 1, 1,
0.3617641, 0.07052907, -0.1946157, 1, 1, 1, 1, 1,
0.3632739, 0.2544677, 0.6140766, 0, 0, 1, 1, 1,
0.3668861, -0.1732353, 2.681315, 1, 0, 0, 1, 1,
0.3694794, 0.08539414, 1.317259, 1, 0, 0, 1, 1,
0.3769298, 0.7360711, 0.4093041, 1, 0, 0, 1, 1,
0.3776155, 0.2040693, 2.00306, 1, 0, 0, 1, 1,
0.3784905, 0.7078492, -0.3301377, 1, 0, 0, 1, 1,
0.3802989, 0.2739566, 1.88223, 0, 0, 0, 1, 1,
0.3833371, 1.678776, 0.9072657, 0, 0, 0, 1, 1,
0.3845122, -0.8462375, 3.723387, 0, 0, 0, 1, 1,
0.3862321, -0.4443268, 3.403627, 0, 0, 0, 1, 1,
0.3899885, -0.1957415, 1.422144, 0, 0, 0, 1, 1,
0.3950382, 0.03864154, 2.464665, 0, 0, 0, 1, 1,
0.3956843, 0.6428326, 1.58038, 0, 0, 0, 1, 1,
0.3985914, -0.4074824, 2.618584, 1, 1, 1, 1, 1,
0.3986206, 0.6096318, 0.5669212, 1, 1, 1, 1, 1,
0.4006799, 1.27933, -0.06023135, 1, 1, 1, 1, 1,
0.4009887, -1.457265, 1.659254, 1, 1, 1, 1, 1,
0.4029749, -0.9569094, 3.68498, 1, 1, 1, 1, 1,
0.4045127, -0.0383149, -0.2744639, 1, 1, 1, 1, 1,
0.4094545, 1.112406, 1.548098, 1, 1, 1, 1, 1,
0.4233422, -0.04565865, 2.265844, 1, 1, 1, 1, 1,
0.4285611, -0.5959231, 3.543517, 1, 1, 1, 1, 1,
0.4291332, 0.7951972, -0.00126742, 1, 1, 1, 1, 1,
0.438307, 1.414648, -0.03826858, 1, 1, 1, 1, 1,
0.4385485, -1.861443, 1.785688, 1, 1, 1, 1, 1,
0.4455356, -0.9220944, 3.033378, 1, 1, 1, 1, 1,
0.4516822, -1.595076, 1.876775, 1, 1, 1, 1, 1,
0.4553615, 1.396258, -0.7505813, 1, 1, 1, 1, 1,
0.4567909, -0.001695798, 1.06083, 0, 0, 1, 1, 1,
0.457032, 0.605682, 1.67949, 1, 0, 0, 1, 1,
0.4574653, 0.3689856, 1.718114, 1, 0, 0, 1, 1,
0.4604094, 1.429358, -2.605297, 1, 0, 0, 1, 1,
0.4618433, 0.6021516, 1.140859, 1, 0, 0, 1, 1,
0.4632747, -0.1681711, 2.846887, 1, 0, 0, 1, 1,
0.4649528, -0.5653993, 2.713936, 0, 0, 0, 1, 1,
0.4674696, 0.4452475, 1.512885, 0, 0, 0, 1, 1,
0.4680029, -1.358364, 2.895916, 0, 0, 0, 1, 1,
0.4708325, -0.6596372, 3.626434, 0, 0, 0, 1, 1,
0.4742022, -1.2457, 2.601835, 0, 0, 0, 1, 1,
0.4829719, 1.318234, 0.2618021, 0, 0, 0, 1, 1,
0.4848802, 0.3797948, 0.5654681, 0, 0, 0, 1, 1,
0.4873267, -0.6877754, 2.879376, 1, 1, 1, 1, 1,
0.4883616, -0.1900718, 1.758039, 1, 1, 1, 1, 1,
0.4888471, -0.7874438, 2.218912, 1, 1, 1, 1, 1,
0.4894291, -0.3310915, 1.443266, 1, 1, 1, 1, 1,
0.491173, -1.213933, 3.124119, 1, 1, 1, 1, 1,
0.4915173, 0.6202714, 3.050282, 1, 1, 1, 1, 1,
0.4927774, 0.9505672, 2.457088, 1, 1, 1, 1, 1,
0.4957862, -0.3583117, 2.1268, 1, 1, 1, 1, 1,
0.5036672, 0.1986432, 0.3640458, 1, 1, 1, 1, 1,
0.5112198, 0.4174361, 0.7728318, 1, 1, 1, 1, 1,
0.5130678, 0.3583715, 1.868591, 1, 1, 1, 1, 1,
0.5140513, -1.647073, 3.80178, 1, 1, 1, 1, 1,
0.5214463, 1.148748, 1.18626, 1, 1, 1, 1, 1,
0.5220107, -1.729759, 1.59058, 1, 1, 1, 1, 1,
0.5244897, 0.503834, 2.934843, 1, 1, 1, 1, 1,
0.5283043, -0.02320897, 1.820533, 0, 0, 1, 1, 1,
0.5336781, 1.099777, 1.225222, 1, 0, 0, 1, 1,
0.5366497, 1.231982, 1.134846, 1, 0, 0, 1, 1,
0.5379025, 0.3993602, 0.8023675, 1, 0, 0, 1, 1,
0.5385449, 1.269766, 2.055208, 1, 0, 0, 1, 1,
0.5395483, 0.3160626, 1.872353, 1, 0, 0, 1, 1,
0.5469602, 1.347751, 3.368443, 0, 0, 0, 1, 1,
0.5504285, -0.2425615, 1.493754, 0, 0, 0, 1, 1,
0.5536708, 0.2763951, 1.868068, 0, 0, 0, 1, 1,
0.5555766, 0.2009654, 1.290163, 0, 0, 0, 1, 1,
0.5707518, 1.545183, 1.037899, 0, 0, 0, 1, 1,
0.5763952, -0.00214328, 1.097688, 0, 0, 0, 1, 1,
0.5779633, -0.208135, 0.9805705, 0, 0, 0, 1, 1,
0.578944, -2.033041, 2.888793, 1, 1, 1, 1, 1,
0.5800971, 0.5097049, 0.04905022, 1, 1, 1, 1, 1,
0.582014, 0.6051136, 1.345159, 1, 1, 1, 1, 1,
0.5845287, -0.1534206, 1.796597, 1, 1, 1, 1, 1,
0.5852918, 0.8936849, 0.9804196, 1, 1, 1, 1, 1,
0.5932842, 1.401983, 1.87873, 1, 1, 1, 1, 1,
0.5946365, -0.655523, 3.810614, 1, 1, 1, 1, 1,
0.5992173, -1.481218, 2.566553, 1, 1, 1, 1, 1,
0.6076505, -1.077504, 1.388416, 1, 1, 1, 1, 1,
0.6089346, -1.288901, 3.296439, 1, 1, 1, 1, 1,
0.6089483, -0.3811867, 2.502937, 1, 1, 1, 1, 1,
0.6103233, 0.2239839, 1.43189, 1, 1, 1, 1, 1,
0.6120012, 0.6228998, 0.4913849, 1, 1, 1, 1, 1,
0.6143392, 1.886326, 0.7623249, 1, 1, 1, 1, 1,
0.6166038, 0.3602421, 2.084437, 1, 1, 1, 1, 1,
0.6177934, 0.8475462, -0.6192143, 0, 0, 1, 1, 1,
0.6187953, -0.5299007, 3.069004, 1, 0, 0, 1, 1,
0.6255756, -0.063779, 0.8375766, 1, 0, 0, 1, 1,
0.6265283, -0.09077872, 2.116682, 1, 0, 0, 1, 1,
0.6306391, 1.05264, -0.01246167, 1, 0, 0, 1, 1,
0.6330272, -2.801174, 3.688035, 1, 0, 0, 1, 1,
0.634074, 0.02143778, 3.220492, 0, 0, 0, 1, 1,
0.6383879, 2.232791, -0.6462866, 0, 0, 0, 1, 1,
0.6444547, 0.3151421, 0.3932472, 0, 0, 0, 1, 1,
0.6448846, -0.3270929, 3.127845, 0, 0, 0, 1, 1,
0.650812, -0.3808055, 2.672843, 0, 0, 0, 1, 1,
0.6535742, -0.5188669, 0.09538411, 0, 0, 0, 1, 1,
0.6625835, -0.356226, 0.5915148, 0, 0, 0, 1, 1,
0.663371, 0.4725915, 0.1185243, 1, 1, 1, 1, 1,
0.6669009, -0.9903034, 0.9731419, 1, 1, 1, 1, 1,
0.6676409, -0.9972116, 2.178911, 1, 1, 1, 1, 1,
0.6701666, 0.4200169, 1.744384, 1, 1, 1, 1, 1,
0.6739593, -0.1037649, 1.369018, 1, 1, 1, 1, 1,
0.6742452, 1.158566, 0.9780158, 1, 1, 1, 1, 1,
0.6761664, 0.2501485, 2.366134, 1, 1, 1, 1, 1,
0.6800662, -1.126062, 2.135271, 1, 1, 1, 1, 1,
0.6881219, -1.815894, 2.780818, 1, 1, 1, 1, 1,
0.6969095, 0.7726032, 0.07176127, 1, 1, 1, 1, 1,
0.7049254, 0.1023366, 0.09889784, 1, 1, 1, 1, 1,
0.7080992, -0.6510692, 0.9199734, 1, 1, 1, 1, 1,
0.7096133, 0.07283682, 1.799849, 1, 1, 1, 1, 1,
0.7111891, 1.934565, -0.4466262, 1, 1, 1, 1, 1,
0.7124333, -0.9719023, 3.967099, 1, 1, 1, 1, 1,
0.7141322, -0.04051765, 2.038756, 0, 0, 1, 1, 1,
0.7174788, -0.04525904, 2.065433, 1, 0, 0, 1, 1,
0.7194273, 0.5347848, 2.032664, 1, 0, 0, 1, 1,
0.7226195, -0.5582892, 1.531919, 1, 0, 0, 1, 1,
0.7241256, -1.693421, 3.619001, 1, 0, 0, 1, 1,
0.7241673, -0.6764151, 4.58205, 1, 0, 0, 1, 1,
0.7280837, 0.5230838, 0.8334212, 0, 0, 0, 1, 1,
0.7283446, -0.08472919, 1.594243, 0, 0, 0, 1, 1,
0.7288643, 1.85248, -0.3823273, 0, 0, 0, 1, 1,
0.7296239, -0.7316714, 3.030649, 0, 0, 0, 1, 1,
0.7337009, 1.438535, 2.341548, 0, 0, 0, 1, 1,
0.7357971, -0.3163582, 2.712716, 0, 0, 0, 1, 1,
0.740963, -0.279036, 1.371485, 0, 0, 0, 1, 1,
0.7472561, -0.9483571, 2.38632, 1, 1, 1, 1, 1,
0.7483276, -1.284009, 2.116018, 1, 1, 1, 1, 1,
0.7569398, 0.1203357, 0.5257445, 1, 1, 1, 1, 1,
0.7572307, 0.1162089, -0.2029574, 1, 1, 1, 1, 1,
0.7579948, -0.9719825, 3.708364, 1, 1, 1, 1, 1,
0.7586422, -0.3548968, 4.218824, 1, 1, 1, 1, 1,
0.7587928, -1.164154, 1.190857, 1, 1, 1, 1, 1,
0.7606266, -1.922557, 2.479424, 1, 1, 1, 1, 1,
0.7611682, 1.158567, 0.3122336, 1, 1, 1, 1, 1,
0.7612922, 0.8502447, 2.197994, 1, 1, 1, 1, 1,
0.7635706, 0.5269707, 1.596851, 1, 1, 1, 1, 1,
0.7642892, -0.5793488, 1.515502, 1, 1, 1, 1, 1,
0.7668646, 0.7517397, 0.9642463, 1, 1, 1, 1, 1,
0.7750246, -1.527701, 3.166952, 1, 1, 1, 1, 1,
0.7752066, 0.5095736, 0.9788104, 1, 1, 1, 1, 1,
0.7757725, -0.4375798, 0.6907235, 0, 0, 1, 1, 1,
0.7873486, 0.5476057, 0.2119083, 1, 0, 0, 1, 1,
0.791608, 0.0980338, 2.734499, 1, 0, 0, 1, 1,
0.7933224, -0.3881213, 1.959372, 1, 0, 0, 1, 1,
0.7974854, 0.1664478, 0.5908319, 1, 0, 0, 1, 1,
0.801119, -0.2133907, 1.547817, 1, 0, 0, 1, 1,
0.8077203, 1.487576, 0.4920276, 0, 0, 0, 1, 1,
0.8137691, 0.087034, 1.570999, 0, 0, 0, 1, 1,
0.8245466, 0.133256, 0.8536544, 0, 0, 0, 1, 1,
0.829036, -2.565258, 2.075822, 0, 0, 0, 1, 1,
0.8388737, -0.3671674, 1.354188, 0, 0, 0, 1, 1,
0.842099, -0.1889959, 3.822902, 0, 0, 0, 1, 1,
0.8445833, 0.3985348, 1.958695, 0, 0, 0, 1, 1,
0.8446704, -0.131959, 3.48212, 1, 1, 1, 1, 1,
0.8458992, 0.7369941, 2.049922, 1, 1, 1, 1, 1,
0.8591065, 0.8513701, 0.7801639, 1, 1, 1, 1, 1,
0.8623443, -0.02611, 2.631076, 1, 1, 1, 1, 1,
0.8684946, -0.8660994, 2.399002, 1, 1, 1, 1, 1,
0.8685078, 0.003058136, 1.487313, 1, 1, 1, 1, 1,
0.8708467, 0.5047339, 1.248515, 1, 1, 1, 1, 1,
0.8726015, -0.2003875, 3.177085, 1, 1, 1, 1, 1,
0.8765753, -1.265461, 3.560773, 1, 1, 1, 1, 1,
0.8788852, -1.389813, 1.488176, 1, 1, 1, 1, 1,
0.8797276, 0.7212632, 1.156185, 1, 1, 1, 1, 1,
0.8830267, 0.004875964, 3.536041, 1, 1, 1, 1, 1,
0.8896257, -1.648923, 3.962685, 1, 1, 1, 1, 1,
0.8956654, 1.060173, 0.5000322, 1, 1, 1, 1, 1,
0.8979167, -0.1050476, 1.041397, 1, 1, 1, 1, 1,
0.9015149, 0.3037118, 0.9777294, 0, 0, 1, 1, 1,
0.9067147, -1.442991, 0.9638203, 1, 0, 0, 1, 1,
0.9180183, 0.8464066, 0.9001853, 1, 0, 0, 1, 1,
0.920503, -1.538007, 5.109501, 1, 0, 0, 1, 1,
0.9218037, 1.478251, -0.3816351, 1, 0, 0, 1, 1,
0.9232365, -0.6506916, 2.018643, 1, 0, 0, 1, 1,
0.9238715, 1.012881, 1.022133, 0, 0, 0, 1, 1,
0.9276456, 0.04489173, 1.234897, 0, 0, 0, 1, 1,
0.9410562, 0.4637731, 1.264237, 0, 0, 0, 1, 1,
0.9524484, 0.3661244, 0.1515513, 0, 0, 0, 1, 1,
0.953364, 0.3785141, 0.5801946, 0, 0, 0, 1, 1,
0.9558317, -1.549111, 2.08686, 0, 0, 0, 1, 1,
0.9611816, -0.2241572, 0.9217482, 0, 0, 0, 1, 1,
0.9624672, -0.2617942, 2.842968, 1, 1, 1, 1, 1,
0.9628516, -0.2029451, 2.301381, 1, 1, 1, 1, 1,
0.9654262, -0.1469498, 0.8364812, 1, 1, 1, 1, 1,
0.9673613, -0.484293, 3.14406, 1, 1, 1, 1, 1,
0.9771692, 0.6062589, 1.238842, 1, 1, 1, 1, 1,
0.9799774, 1.889088, 1.714758, 1, 1, 1, 1, 1,
0.9825612, 1.123987, 0.6532942, 1, 1, 1, 1, 1,
0.9887223, 1.394026, 0.4841891, 1, 1, 1, 1, 1,
0.9949073, 1.165636, 0.5314869, 1, 1, 1, 1, 1,
1.006965, 0.5550083, 1.22841, 1, 1, 1, 1, 1,
1.010731, 2.392878, -0.4931908, 1, 1, 1, 1, 1,
1.012004, -0.7657896, 3.736312, 1, 1, 1, 1, 1,
1.02018, 0.8218631, -0.4515664, 1, 1, 1, 1, 1,
1.030169, -0.16083, 1.953169, 1, 1, 1, 1, 1,
1.039344, -0.9314377, 1.85869, 1, 1, 1, 1, 1,
1.050786, 0.06717118, -0.396014, 0, 0, 1, 1, 1,
1.050979, 1.534136, -0.5593635, 1, 0, 0, 1, 1,
1.052859, 1.377606, 2.32032, 1, 0, 0, 1, 1,
1.057607, -0.4976028, 3.166986, 1, 0, 0, 1, 1,
1.064617, -0.8136578, 3.638094, 1, 0, 0, 1, 1,
1.0689, -0.8271303, 2.22581, 1, 0, 0, 1, 1,
1.070532, -0.3873622, 1.568648, 0, 0, 0, 1, 1,
1.075465, 0.2383408, 1.449628, 0, 0, 0, 1, 1,
1.076323, -0.346507, 1.790124, 0, 0, 0, 1, 1,
1.078989, 1.882625, 0.6035694, 0, 0, 0, 1, 1,
1.079198, 1.374934, 1.107272, 0, 0, 0, 1, 1,
1.080887, -0.5255151, 2.631836, 0, 0, 0, 1, 1,
1.085045, 0.4211178, 1.609386, 0, 0, 0, 1, 1,
1.095329, 0.5457147, -1.6327, 1, 1, 1, 1, 1,
1.098672, 0.5879245, -0.4475076, 1, 1, 1, 1, 1,
1.10198, 0.7141823, -0.1904067, 1, 1, 1, 1, 1,
1.103299, 0.0176864, 0.925249, 1, 1, 1, 1, 1,
1.10549, 0.2053984, 0.4031417, 1, 1, 1, 1, 1,
1.110443, -0.3034595, 1.224476, 1, 1, 1, 1, 1,
1.113634, -1.625485, 0.2061644, 1, 1, 1, 1, 1,
1.123172, -0.4084034, 0.7307517, 1, 1, 1, 1, 1,
1.124739, -0.7991852, 3.868794, 1, 1, 1, 1, 1,
1.13955, 0.2268806, 2.030381, 1, 1, 1, 1, 1,
1.143429, -2.268568, 2.852043, 1, 1, 1, 1, 1,
1.150212, 1.31326, 0.9780867, 1, 1, 1, 1, 1,
1.155882, 0.2203928, 1.516316, 1, 1, 1, 1, 1,
1.160433, 0.704918, 0.6293131, 1, 1, 1, 1, 1,
1.16461, -0.02966868, 2.151865, 1, 1, 1, 1, 1,
1.16612, 0.4140448, 2.110314, 0, 0, 1, 1, 1,
1.17502, -0.05246127, 1.587249, 1, 0, 0, 1, 1,
1.176478, 0.9388192, 0.5281534, 1, 0, 0, 1, 1,
1.176759, 0.5410884, 0.8094842, 1, 0, 0, 1, 1,
1.178458, 1.715328, 2.856721, 1, 0, 0, 1, 1,
1.183939, -0.277914, 1.78758, 1, 0, 0, 1, 1,
1.18529, 0.5713705, 3.011633, 0, 0, 0, 1, 1,
1.185601, 0.2886326, 0.2255515, 0, 0, 0, 1, 1,
1.192854, -0.148678, 2.589103, 0, 0, 0, 1, 1,
1.198696, 1.750859, 1.113109, 0, 0, 0, 1, 1,
1.199363, -0.2721236, 0.783916, 0, 0, 0, 1, 1,
1.204237, 0.668398, 2.542367, 0, 0, 0, 1, 1,
1.213814, 0.3819298, 0.6993501, 0, 0, 0, 1, 1,
1.220814, -0.3409289, 1.528907, 1, 1, 1, 1, 1,
1.221125, 2.248697, -1.564378, 1, 1, 1, 1, 1,
1.225697, 0.06160783, 0.01790152, 1, 1, 1, 1, 1,
1.225832, 0.1886603, 1.383722, 1, 1, 1, 1, 1,
1.230086, 1.580217, 1.653193, 1, 1, 1, 1, 1,
1.231792, 0.1071091, 1.158995, 1, 1, 1, 1, 1,
1.235696, 0.2178622, 1.063995, 1, 1, 1, 1, 1,
1.238582, -0.8381425, 2.249332, 1, 1, 1, 1, 1,
1.240544, -2.466146, 3.440088, 1, 1, 1, 1, 1,
1.24248, -0.655674, 1.146545, 1, 1, 1, 1, 1,
1.243789, 0.03889797, 2.065989, 1, 1, 1, 1, 1,
1.250891, -1.7101, 0.1994798, 1, 1, 1, 1, 1,
1.259114, 0.6800413, -0.9308497, 1, 1, 1, 1, 1,
1.265209, 0.2177265, 0.5091951, 1, 1, 1, 1, 1,
1.269769, -0.9541083, 2.868618, 1, 1, 1, 1, 1,
1.273664, -1.26325, 2.874071, 0, 0, 1, 1, 1,
1.27523, -0.2697488, 1.336483, 1, 0, 0, 1, 1,
1.279341, -1.025399, 3.342391, 1, 0, 0, 1, 1,
1.291873, -2.043312, 2.954027, 1, 0, 0, 1, 1,
1.29359, 0.979412, 1.312607, 1, 0, 0, 1, 1,
1.29793, 1.693836, 1.36451, 1, 0, 0, 1, 1,
1.30239, 0.1635719, 2.264464, 0, 0, 0, 1, 1,
1.322517, 0.8755862, 1.370332, 0, 0, 0, 1, 1,
1.326424, 0.04531609, 2.230583, 0, 0, 0, 1, 1,
1.330526, -0.808013, 0.5543917, 0, 0, 0, 1, 1,
1.332417, -0.9816662, 1.146514, 0, 0, 0, 1, 1,
1.334433, -1.413276, 1.044171, 0, 0, 0, 1, 1,
1.33791, 0.3805923, -0.9608119, 0, 0, 0, 1, 1,
1.343182, 0.6541409, 2.833038, 1, 1, 1, 1, 1,
1.360776, -0.5547341, 0.3154295, 1, 1, 1, 1, 1,
1.378069, 0.2095013, 1.322704, 1, 1, 1, 1, 1,
1.378634, -0.7471595, 0.2379776, 1, 1, 1, 1, 1,
1.382991, -1.055946, 1.158131, 1, 1, 1, 1, 1,
1.384558, 1.399795, 0.334777, 1, 1, 1, 1, 1,
1.386015, 0.797973, 1.732646, 1, 1, 1, 1, 1,
1.399944, 1.619992, -1.003001, 1, 1, 1, 1, 1,
1.404504, -0.9191383, 0.9957613, 1, 1, 1, 1, 1,
1.4096, 0.8214545, 0.5200679, 1, 1, 1, 1, 1,
1.426059, 0.6656118, 1.784754, 1, 1, 1, 1, 1,
1.433574, -0.4646725, 1.85806, 1, 1, 1, 1, 1,
1.449066, -1.243015, 3.723732, 1, 1, 1, 1, 1,
1.452304, 0.5537648, 1.409185, 1, 1, 1, 1, 1,
1.454749, -0.2791903, 1.767483, 1, 1, 1, 1, 1,
1.45645, -2.095871, 1.905559, 0, 0, 1, 1, 1,
1.467854, -1.101991, 2.643571, 1, 0, 0, 1, 1,
1.472484, 0.6939482, -0.4051841, 1, 0, 0, 1, 1,
1.477426, -1.304503, 2.334712, 1, 0, 0, 1, 1,
1.48199, 1.596085, 1.729529, 1, 0, 0, 1, 1,
1.496741, 0.5544048, 1.313562, 1, 0, 0, 1, 1,
1.501185, -1.161878, 1.680212, 0, 0, 0, 1, 1,
1.502749, -0.110776, 2.053095, 0, 0, 0, 1, 1,
1.502874, 0.6088346, 2.706201, 0, 0, 0, 1, 1,
1.521427, 1.32961, 1.295972, 0, 0, 0, 1, 1,
1.530155, -2.355574, 1.411971, 0, 0, 0, 1, 1,
1.550923, -0.7169566, 1.775843, 0, 0, 0, 1, 1,
1.551754, 0.632617, 0.331863, 0, 0, 0, 1, 1,
1.562805, 0.5043417, 1.7014, 1, 1, 1, 1, 1,
1.569944, 1.540653, 1.435448, 1, 1, 1, 1, 1,
1.571846, 0.08247485, 1.348547, 1, 1, 1, 1, 1,
1.573726, -0.8186051, 1.342974, 1, 1, 1, 1, 1,
1.598169, 1.735675, 1.408023, 1, 1, 1, 1, 1,
1.604238, -1.233263, 5.485045, 1, 1, 1, 1, 1,
1.607503, 0.788748, 2.918289, 1, 1, 1, 1, 1,
1.616017, -1.175099, 2.041092, 1, 1, 1, 1, 1,
1.616484, 1.064218, 1.232165, 1, 1, 1, 1, 1,
1.630144, 0.7701611, 1.627366, 1, 1, 1, 1, 1,
1.630763, 0.3100512, 2.40167, 1, 1, 1, 1, 1,
1.648666, 1.488322, -0.3648455, 1, 1, 1, 1, 1,
1.648715, -0.4385292, -0.08965331, 1, 1, 1, 1, 1,
1.664365, -1.108687, 2.921334, 1, 1, 1, 1, 1,
1.675319, 1.19999, 1.566767, 1, 1, 1, 1, 1,
1.67607, 1.388839, 1.316677, 0, 0, 1, 1, 1,
1.685531, 0.3075938, 2.506457, 1, 0, 0, 1, 1,
1.694038, 1.931002, -0.863763, 1, 0, 0, 1, 1,
1.697373, 1.097212, 0.7224464, 1, 0, 0, 1, 1,
1.706251, -0.8009287, 1.020289, 1, 0, 0, 1, 1,
1.722727, 1.247343, 0.5651181, 1, 0, 0, 1, 1,
1.730716, 0.4056147, 0.8218095, 0, 0, 0, 1, 1,
1.743593, -1.643577, 3.367196, 0, 0, 0, 1, 1,
1.750745, 0.6626146, 0.7647546, 0, 0, 0, 1, 1,
1.765126, 0.2930499, 1.817587, 0, 0, 0, 1, 1,
1.768653, -0.2341929, 2.258573, 0, 0, 0, 1, 1,
1.781176, -0.8459889, 2.359745, 0, 0, 0, 1, 1,
1.786025, -0.7722516, 2.474526, 0, 0, 0, 1, 1,
1.786839, 1.697941, 0.4472909, 1, 1, 1, 1, 1,
1.80601, 1.468112, 1.375247, 1, 1, 1, 1, 1,
1.812672, 0.3612937, -0.03742857, 1, 1, 1, 1, 1,
1.848566, -0.2429526, 1.969598, 1, 1, 1, 1, 1,
1.865773, -0.3965737, 1.63417, 1, 1, 1, 1, 1,
1.875693, -0.5802754, 3.448373, 1, 1, 1, 1, 1,
1.914475, -0.05596441, 2.329746, 1, 1, 1, 1, 1,
1.948227, 0.2111505, 1.264368, 1, 1, 1, 1, 1,
1.951105, 0.3378892, 0.3253811, 1, 1, 1, 1, 1,
1.952329, 0.271409, 0.791581, 1, 1, 1, 1, 1,
1.957476, -0.5569522, 1.891762, 1, 1, 1, 1, 1,
1.967377, -1.376455, 2.429343, 1, 1, 1, 1, 1,
1.982307, -0.02028099, 3.076401, 1, 1, 1, 1, 1,
2.000628, -0.4918763, 2.033479, 1, 1, 1, 1, 1,
2.017517, -1.830046, 3.247341, 1, 1, 1, 1, 1,
2.035308, 0.1538945, 1.870552, 0, 0, 1, 1, 1,
2.048962, -1.217658, 2.135598, 1, 0, 0, 1, 1,
2.093742, -0.2210902, 1.926405, 1, 0, 0, 1, 1,
2.095638, 0.04337154, 2.155738, 1, 0, 0, 1, 1,
2.102006, 0.8945651, 2.133935, 1, 0, 0, 1, 1,
2.121305, 1.660639, 1.42212, 1, 0, 0, 1, 1,
2.124368, 0.08922439, 1.586451, 0, 0, 0, 1, 1,
2.133191, 0.4445514, 3.490707, 0, 0, 0, 1, 1,
2.153953, -0.5415926, 1.123353, 0, 0, 0, 1, 1,
2.164869, 1.783641, -0.081802, 0, 0, 0, 1, 1,
2.175727, 1.120148, -0.3242541, 0, 0, 0, 1, 1,
2.213379, 0.767266, 1.472222, 0, 0, 0, 1, 1,
2.251158, -0.7065417, 2.874989, 0, 0, 0, 1, 1,
2.261941, 1.326867, 0.5265953, 1, 1, 1, 1, 1,
2.286863, 0.4029938, 0.7005912, 1, 1, 1, 1, 1,
2.377547, -0.1145562, 0.7078719, 1, 1, 1, 1, 1,
2.606841, 0.1847491, 0.7671063, 1, 1, 1, 1, 1,
2.739897, -0.2721572, 0.3996985, 1, 1, 1, 1, 1,
2.763395, -0.7766938, 3.050085, 1, 1, 1, 1, 1,
2.928529, -0.5568903, 3.346798, 1, 1, 1, 1, 1
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
var radius = 9.503304;
var distance = 33.37995;
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
mvMatrix.translate( 0.0473007, 0.3242552, -0.006283998 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.37995);
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
