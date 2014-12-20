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
-3.259997, -0.3599299, -0.4590291, 1, 0, 0, 1,
-3.185596, -1.663874, -2.131123, 1, 0.007843138, 0, 1,
-2.77985, -0.1502482, -1.422556, 1, 0.01176471, 0, 1,
-2.764076, -0.80187, -1.536171, 1, 0.01960784, 0, 1,
-2.749931, 0.403295, 0.7725543, 1, 0.02352941, 0, 1,
-2.710346, -0.2701964, -2.706764, 1, 0.03137255, 0, 1,
-2.627306, 0.847387, 0.9616408, 1, 0.03529412, 0, 1,
-2.504908, 1.269898, -1.593948, 1, 0.04313726, 0, 1,
-2.461508, 1.861212, -1.432842, 1, 0.04705882, 0, 1,
-2.382949, -0.7357724, -0.02720314, 1, 0.05490196, 0, 1,
-2.294403, -1.29032, -1.18894, 1, 0.05882353, 0, 1,
-2.269456, -0.3250182, -1.443003, 1, 0.06666667, 0, 1,
-2.244194, 1.152085, -0.327325, 1, 0.07058824, 0, 1,
-2.227259, -0.2577525, -0.6218345, 1, 0.07843138, 0, 1,
-2.215504, -1.578745, -0.9152976, 1, 0.08235294, 0, 1,
-2.205415, 0.7284554, -1.142786, 1, 0.09019608, 0, 1,
-2.16753, 0.26351, -1.648507, 1, 0.09411765, 0, 1,
-2.155112, 0.4436167, -0.3582853, 1, 0.1019608, 0, 1,
-2.092132, -1.393815, -2.03625, 1, 0.1098039, 0, 1,
-2.071402, 1.127605, -1.470276, 1, 0.1137255, 0, 1,
-2.019585, 1.613517, 0.2302271, 1, 0.1215686, 0, 1,
-2.016722, -1.230272, -3.716051, 1, 0.1254902, 0, 1,
-1.989326, 0.1612929, -1.313242, 1, 0.1333333, 0, 1,
-1.974015, 2.200465, -1.212573, 1, 0.1372549, 0, 1,
-1.967704, 1.650472, 0.3997456, 1, 0.145098, 0, 1,
-1.937997, -0.03375563, -3.342977, 1, 0.1490196, 0, 1,
-1.920521, -0.1276107, -2.4567, 1, 0.1568628, 0, 1,
-1.914592, 1.024246, -1.198668, 1, 0.1607843, 0, 1,
-1.909572, 1.476539, -1.152713, 1, 0.1686275, 0, 1,
-1.907309, 1.154212, -1.578548, 1, 0.172549, 0, 1,
-1.904379, -1.740493, -2.159035, 1, 0.1803922, 0, 1,
-1.903241, -0.4486767, -1.789782, 1, 0.1843137, 0, 1,
-1.880269, -0.8842429, -0.9066734, 1, 0.1921569, 0, 1,
-1.875504, -0.9977174, -2.513432, 1, 0.1960784, 0, 1,
-1.857068, 0.02541875, -1.410502, 1, 0.2039216, 0, 1,
-1.834322, 0.3367412, 0.4246315, 1, 0.2117647, 0, 1,
-1.805497, -1.704602, -2.579415, 1, 0.2156863, 0, 1,
-1.796398, 0.3781371, -2.498472, 1, 0.2235294, 0, 1,
-1.787683, -0.7669131, -1.876297, 1, 0.227451, 0, 1,
-1.784455, -0.0008573122, -1.80732, 1, 0.2352941, 0, 1,
-1.783682, -2.970559, -3.393595, 1, 0.2392157, 0, 1,
-1.780857, 0.712799, 0.3238694, 1, 0.2470588, 0, 1,
-1.775897, -0.3957547, -1.557566, 1, 0.2509804, 0, 1,
-1.760145, -2.019848, -3.660724, 1, 0.2588235, 0, 1,
-1.754786, -0.6656095, -0.5413322, 1, 0.2627451, 0, 1,
-1.728801, -0.9236437, -2.290988, 1, 0.2705882, 0, 1,
-1.722474, -0.05185038, -2.3915, 1, 0.2745098, 0, 1,
-1.721882, 0.1792155, -1.130862, 1, 0.282353, 0, 1,
-1.71151, 2.249339, -0.1761947, 1, 0.2862745, 0, 1,
-1.700167, -1.720587, -2.810014, 1, 0.2941177, 0, 1,
-1.700075, -0.4526855, -3.511721, 1, 0.3019608, 0, 1,
-1.693477, 1.127632, -0.8723394, 1, 0.3058824, 0, 1,
-1.68916, -0.4571764, 0.294702, 1, 0.3137255, 0, 1,
-1.683298, 0.4328675, -2.311145, 1, 0.3176471, 0, 1,
-1.660637, -0.2040158, -2.473161, 1, 0.3254902, 0, 1,
-1.650775, -0.7756818, -1.87157, 1, 0.3294118, 0, 1,
-1.642533, -0.7345409, 0.509394, 1, 0.3372549, 0, 1,
-1.63342, 1.699894, -1.500527, 1, 0.3411765, 0, 1,
-1.631593, 0.4973167, -2.414024, 1, 0.3490196, 0, 1,
-1.631246, 2.289835, -0.6660535, 1, 0.3529412, 0, 1,
-1.63036, 3.304121, 0.2403519, 1, 0.3607843, 0, 1,
-1.611457, 0.1553867, -0.9365942, 1, 0.3647059, 0, 1,
-1.574471, 0.9713843, -0.5508376, 1, 0.372549, 0, 1,
-1.560547, 0.3721407, -1.535203, 1, 0.3764706, 0, 1,
-1.544215, 0.4605944, -1.641883, 1, 0.3843137, 0, 1,
-1.52463, -0.09614526, -1.375513, 1, 0.3882353, 0, 1,
-1.514473, 0.794127, -2.828139, 1, 0.3960784, 0, 1,
-1.511974, -0.5850637, -2.227329, 1, 0.4039216, 0, 1,
-1.499387, 0.1357918, -1.960091, 1, 0.4078431, 0, 1,
-1.481827, 0.8519925, -0.2215523, 1, 0.4156863, 0, 1,
-1.477496, 1.137804, 0.1185861, 1, 0.4196078, 0, 1,
-1.472571, 1.568878, -1.516403, 1, 0.427451, 0, 1,
-1.469871, 1.565342, -1.015989, 1, 0.4313726, 0, 1,
-1.469044, -0.3058688, -3.595575, 1, 0.4392157, 0, 1,
-1.44083, 1.525206, 1.073481, 1, 0.4431373, 0, 1,
-1.435038, -0.9998618, -1.934979, 1, 0.4509804, 0, 1,
-1.419621, -1.91845, -1.396164, 1, 0.454902, 0, 1,
-1.410509, -1.180099, -0.525115, 1, 0.4627451, 0, 1,
-1.400623, 0.1578361, -2.54735, 1, 0.4666667, 0, 1,
-1.395135, 1.036573, -2.158403, 1, 0.4745098, 0, 1,
-1.393745, -0.5236786, -1.553656, 1, 0.4784314, 0, 1,
-1.383041, 0.621049, -1.694458, 1, 0.4862745, 0, 1,
-1.381415, -0.3008749, -2.23915, 1, 0.4901961, 0, 1,
-1.369262, 1.964593, 0.06545435, 1, 0.4980392, 0, 1,
-1.364288, 0.5081695, 1.391845, 1, 0.5058824, 0, 1,
-1.358837, 0.3365284, -0.9683327, 1, 0.509804, 0, 1,
-1.356646, -0.3997792, -2.494192, 1, 0.5176471, 0, 1,
-1.342013, -0.8474668, -1.005, 1, 0.5215687, 0, 1,
-1.338503, 2.43203, -1.395699, 1, 0.5294118, 0, 1,
-1.336689, -0.8816965, -2.269844, 1, 0.5333334, 0, 1,
-1.334294, 1.268965, -0.03877867, 1, 0.5411765, 0, 1,
-1.331105, -0.6893719, -0.4241643, 1, 0.5450981, 0, 1,
-1.323502, 0.3499758, -1.468217, 1, 0.5529412, 0, 1,
-1.323161, 0.3097359, -0.9303271, 1, 0.5568628, 0, 1,
-1.314545, -0.1148159, -0.8397307, 1, 0.5647059, 0, 1,
-1.310306, -1.498237, -2.000046, 1, 0.5686275, 0, 1,
-1.293164, 1.20041, 0.5296459, 1, 0.5764706, 0, 1,
-1.292515, -0.9993078, -3.820363, 1, 0.5803922, 0, 1,
-1.290292, -0.3267475, -1.431518, 1, 0.5882353, 0, 1,
-1.288627, -0.1274096, -1.091511, 1, 0.5921569, 0, 1,
-1.263463, 0.9531686, -0.5725685, 1, 0.6, 0, 1,
-1.259337, -1.132648, -1.498381, 1, 0.6078432, 0, 1,
-1.256057, 0.2109656, -4.472188, 1, 0.6117647, 0, 1,
-1.252593, -0.386836, -2.134946, 1, 0.6196079, 0, 1,
-1.24004, 0.04407064, -1.484014, 1, 0.6235294, 0, 1,
-1.235881, -1.208443, -1.720637, 1, 0.6313726, 0, 1,
-1.226182, -1.420688, -0.7420124, 1, 0.6352941, 0, 1,
-1.22332, 2.394199, -1.457155, 1, 0.6431373, 0, 1,
-1.201921, 0.8443009, -1.227802, 1, 0.6470588, 0, 1,
-1.194582, -0.5154148, -1.642342, 1, 0.654902, 0, 1,
-1.192178, 0.3012638, -1.074463, 1, 0.6588235, 0, 1,
-1.192045, 1.050572, 1.000883, 1, 0.6666667, 0, 1,
-1.19193, -0.5415194, -0.9167321, 1, 0.6705883, 0, 1,
-1.181811, 2.037384, 0.9973746, 1, 0.6784314, 0, 1,
-1.17701, 0.1874317, -0.4323863, 1, 0.682353, 0, 1,
-1.176033, 2.616858, 0.167115, 1, 0.6901961, 0, 1,
-1.175025, 0.5208058, -2.129489, 1, 0.6941177, 0, 1,
-1.169172, -2.58775, -2.458147, 1, 0.7019608, 0, 1,
-1.165766, -1.822201, -3.109386, 1, 0.7098039, 0, 1,
-1.158941, 0.1565179, -1.699153, 1, 0.7137255, 0, 1,
-1.158816, 0.513429, -1.495677, 1, 0.7215686, 0, 1,
-1.155202, -0.3260529, -0.3390241, 1, 0.7254902, 0, 1,
-1.14237, -0.1327901, -1.641499, 1, 0.7333333, 0, 1,
-1.135686, -0.6143644, -1.254663, 1, 0.7372549, 0, 1,
-1.133083, -0.4239133, -2.000475, 1, 0.7450981, 0, 1,
-1.127423, -0.8653239, -1.642087, 1, 0.7490196, 0, 1,
-1.124099, -1.198386, -2.210629, 1, 0.7568628, 0, 1,
-1.118932, -0.0938092, -1.030522, 1, 0.7607843, 0, 1,
-1.1086, 1.076231, -0.5644369, 1, 0.7686275, 0, 1,
-1.106696, -1.165165, -4.242731, 1, 0.772549, 0, 1,
-1.095735, -2.532197, -4.210349, 1, 0.7803922, 0, 1,
-1.094138, 1.547598, -2.207744, 1, 0.7843137, 0, 1,
-1.089931, 0.6648558, -2.772015, 1, 0.7921569, 0, 1,
-1.078412, -0.8105015, -2.10681, 1, 0.7960784, 0, 1,
-1.078378, 0.7710692, -1.174132, 1, 0.8039216, 0, 1,
-1.076836, 0.849759, 1.375414, 1, 0.8117647, 0, 1,
-1.072432, -1.07295, -2.859669, 1, 0.8156863, 0, 1,
-1.064494, 0.8602344, 0.2304054, 1, 0.8235294, 0, 1,
-1.06294, -1.949074, -3.776136, 1, 0.827451, 0, 1,
-1.061317, 1.857066, -0.6458174, 1, 0.8352941, 0, 1,
-1.060956, -0.326625, -3.389441, 1, 0.8392157, 0, 1,
-1.056917, 0.1340213, -0.01562328, 1, 0.8470588, 0, 1,
-1.052601, -1.167663, -1.998904, 1, 0.8509804, 0, 1,
-1.046314, -2.055773, -2.87467, 1, 0.8588235, 0, 1,
-1.038272, 1.816211, -0.3873391, 1, 0.8627451, 0, 1,
-1.031992, 0.8839403, 0.1834778, 1, 0.8705882, 0, 1,
-1.031137, 0.3356356, -1.215937, 1, 0.8745098, 0, 1,
-1.015425, 0.6497149, -0.2294085, 1, 0.8823529, 0, 1,
-1.01283, -1.051071, -1.38013, 1, 0.8862745, 0, 1,
-1.010258, -0.803014, -3.150675, 1, 0.8941177, 0, 1,
-1.007326, 0.9940736, -1.411356, 1, 0.8980392, 0, 1,
-1.007216, 1.103201, -1.025111, 1, 0.9058824, 0, 1,
-1.006002, -1.004862, -4.348127, 1, 0.9137255, 0, 1,
-0.9990505, -2.400715, -2.270427, 1, 0.9176471, 0, 1,
-0.9983774, -2.344002, -2.184271, 1, 0.9254902, 0, 1,
-0.9872247, -2.203858, -3.384944, 1, 0.9294118, 0, 1,
-0.9824236, 1.113961, 0.251642, 1, 0.9372549, 0, 1,
-0.9810508, 1.547452, 0.0777816, 1, 0.9411765, 0, 1,
-0.9799348, 0.09542128, -0.9394104, 1, 0.9490196, 0, 1,
-0.9786289, 1.638861, -0.08100387, 1, 0.9529412, 0, 1,
-0.9771174, 0.503533, 0.2352915, 1, 0.9607843, 0, 1,
-0.9768072, -0.8799335, -2.860732, 1, 0.9647059, 0, 1,
-0.9746688, -1.170239, -2.477595, 1, 0.972549, 0, 1,
-0.9730436, 1.469156, -0.765172, 1, 0.9764706, 0, 1,
-0.9636261, -0.02882614, -0.2017034, 1, 0.9843137, 0, 1,
-0.9622591, 1.323952, -0.43611, 1, 0.9882353, 0, 1,
-0.9603025, -0.5933744, -1.434324, 1, 0.9960784, 0, 1,
-0.943427, 1.020651, -1.905692, 0.9960784, 1, 0, 1,
-0.9414601, 0.5524406, -0.8218431, 0.9921569, 1, 0, 1,
-0.9399603, 0.4468424, -2.485283, 0.9843137, 1, 0, 1,
-0.9355248, 0.8344145, -1.522402, 0.9803922, 1, 0, 1,
-0.9282698, 0.3370848, -2.730935, 0.972549, 1, 0, 1,
-0.9196048, 1.001097, -0.1124722, 0.9686275, 1, 0, 1,
-0.9186893, -1.541923, -1.59351, 0.9607843, 1, 0, 1,
-0.918172, -1.379482, -2.283344, 0.9568627, 1, 0, 1,
-0.9112389, 1.447721, -1.471897, 0.9490196, 1, 0, 1,
-0.9055243, -0.0913782, -0.9473878, 0.945098, 1, 0, 1,
-0.9015064, -2.247478, -2.054085, 0.9372549, 1, 0, 1,
-0.8988855, -1.106531, -2.648172, 0.9333333, 1, 0, 1,
-0.8948603, 0.02895317, -2.228855, 0.9254902, 1, 0, 1,
-0.8901516, -0.5946177, -3.326843, 0.9215686, 1, 0, 1,
-0.8899192, -0.7130487, -1.930303, 0.9137255, 1, 0, 1,
-0.8890082, 0.4685106, -1.197508, 0.9098039, 1, 0, 1,
-0.88607, 0.09340098, -1.033307, 0.9019608, 1, 0, 1,
-0.8839391, -0.9514782, -1.99783, 0.8941177, 1, 0, 1,
-0.8816191, -0.5888088, -2.359226, 0.8901961, 1, 0, 1,
-0.8708664, -0.2527419, -1.848853, 0.8823529, 1, 0, 1,
-0.8698151, 1.261437, -1.137331, 0.8784314, 1, 0, 1,
-0.8672388, -0.1900637, -2.263663, 0.8705882, 1, 0, 1,
-0.8582759, -2.359099, -3.404305, 0.8666667, 1, 0, 1,
-0.845238, 0.6346973, -0.4563857, 0.8588235, 1, 0, 1,
-0.8433431, 0.3147879, 0.0851096, 0.854902, 1, 0, 1,
-0.841713, 0.09603129, -0.5098156, 0.8470588, 1, 0, 1,
-0.8413555, -0.3605038, -2.754441, 0.8431373, 1, 0, 1,
-0.8328335, 0.8194329, -0.4278919, 0.8352941, 1, 0, 1,
-0.8322484, -0.6222986, -1.456133, 0.8313726, 1, 0, 1,
-0.826234, 0.6969264, -1.388446, 0.8235294, 1, 0, 1,
-0.8150081, 0.06178177, -2.223809, 0.8196079, 1, 0, 1,
-0.8134219, 2.043944, -1.179366, 0.8117647, 1, 0, 1,
-0.8087901, -1.832474, -2.606639, 0.8078431, 1, 0, 1,
-0.8011503, -1.388985, -2.185076, 0.8, 1, 0, 1,
-0.7944581, -2.026719, -2.372648, 0.7921569, 1, 0, 1,
-0.7925523, 0.5279673, -0.6173207, 0.7882353, 1, 0, 1,
-0.7893493, -0.8055978, -3.15756, 0.7803922, 1, 0, 1,
-0.7881876, 0.6554667, -1.037139, 0.7764706, 1, 0, 1,
-0.7855329, -0.2565098, -0.8924062, 0.7686275, 1, 0, 1,
-0.7852213, 0.8579432, -0.009708555, 0.7647059, 1, 0, 1,
-0.7840874, 0.8840511, -0.09939365, 0.7568628, 1, 0, 1,
-0.7779517, 0.02930012, -2.127308, 0.7529412, 1, 0, 1,
-0.7734891, -0.01670455, -2.297548, 0.7450981, 1, 0, 1,
-0.7673186, 0.432169, -1.451275, 0.7411765, 1, 0, 1,
-0.7627062, 0.01860475, -2.040338, 0.7333333, 1, 0, 1,
-0.7618072, 0.8631155, -0.9689046, 0.7294118, 1, 0, 1,
-0.7591727, 0.9391387, -1.141269, 0.7215686, 1, 0, 1,
-0.7577245, -0.2034528, -0.6011792, 0.7176471, 1, 0, 1,
-0.7538468, 0.3173056, 1.032473, 0.7098039, 1, 0, 1,
-0.7521688, -1.235411, -4.346432, 0.7058824, 1, 0, 1,
-0.7521667, 0.5440177, -0.5226312, 0.6980392, 1, 0, 1,
-0.7519553, 0.6897784, -0.3956544, 0.6901961, 1, 0, 1,
-0.7454345, 1.347081, -1.048784, 0.6862745, 1, 0, 1,
-0.7418527, 0.698341, -0.4071411, 0.6784314, 1, 0, 1,
-0.7350539, -0.03795361, 0.6224577, 0.6745098, 1, 0, 1,
-0.7319916, 0.5420141, -1.486526, 0.6666667, 1, 0, 1,
-0.7306077, 1.200847, 0.3682258, 0.6627451, 1, 0, 1,
-0.7216365, -1.138367, -3.666046, 0.654902, 1, 0, 1,
-0.72113, -2.029933, -3.183485, 0.6509804, 1, 0, 1,
-0.7152892, -0.1060117, -2.34567, 0.6431373, 1, 0, 1,
-0.7142621, 0.9085379, -0.442853, 0.6392157, 1, 0, 1,
-0.7122163, -0.62059, -2.146127, 0.6313726, 1, 0, 1,
-0.7047378, -0.7657059, -2.489654, 0.627451, 1, 0, 1,
-0.7046722, -1.451049, -2.17441, 0.6196079, 1, 0, 1,
-0.7027407, 0.7956627, -0.3787673, 0.6156863, 1, 0, 1,
-0.7008439, 1.567126, 0.0492962, 0.6078432, 1, 0, 1,
-0.699259, 1.338453, 0.4670707, 0.6039216, 1, 0, 1,
-0.697217, 0.2036604, -2.215414, 0.5960785, 1, 0, 1,
-0.6930259, -0.5233165, -1.888693, 0.5882353, 1, 0, 1,
-0.6917825, 0.2249257, -1.416451, 0.5843138, 1, 0, 1,
-0.6863744, -0.2714108, -1.734598, 0.5764706, 1, 0, 1,
-0.678737, -1.934343, -2.441542, 0.572549, 1, 0, 1,
-0.6769782, -0.5114583, -1.966197, 0.5647059, 1, 0, 1,
-0.6767948, -0.2715072, -0.7536607, 0.5607843, 1, 0, 1,
-0.6727031, -2.231543, -2.020308, 0.5529412, 1, 0, 1,
-0.6725843, -0.6894436, -1.772402, 0.5490196, 1, 0, 1,
-0.6686311, 1.020051, -1.416095, 0.5411765, 1, 0, 1,
-0.6646618, 0.9847329, -1.348884, 0.5372549, 1, 0, 1,
-0.6629529, -0.5883459, -1.707719, 0.5294118, 1, 0, 1,
-0.6570888, -0.2704229, -3.516314, 0.5254902, 1, 0, 1,
-0.6540832, 0.32368, -1.467482, 0.5176471, 1, 0, 1,
-0.6451749, -0.7565079, -1.108214, 0.5137255, 1, 0, 1,
-0.6420999, 0.4907207, -1.215662, 0.5058824, 1, 0, 1,
-0.6356519, -1.836758, -2.163906, 0.5019608, 1, 0, 1,
-0.6321622, -0.1017212, -3.761485, 0.4941176, 1, 0, 1,
-0.6293062, -1.742711, -2.588672, 0.4862745, 1, 0, 1,
-0.6288601, -1.590548, -4.039272, 0.4823529, 1, 0, 1,
-0.6264709, 1.565666, -0.678856, 0.4745098, 1, 0, 1,
-0.6252326, -0.1643217, -1.852926, 0.4705882, 1, 0, 1,
-0.6249752, 1.463204, 1.19609, 0.4627451, 1, 0, 1,
-0.6185713, 0.7939473, -0.06408946, 0.4588235, 1, 0, 1,
-0.6163147, -0.01419087, -1.794923, 0.4509804, 1, 0, 1,
-0.6162661, 0.2700294, -1.303477, 0.4470588, 1, 0, 1,
-0.6142446, -1.522779, -2.923179, 0.4392157, 1, 0, 1,
-0.611032, -0.7862434, -3.373926, 0.4352941, 1, 0, 1,
-0.6070845, 1.690561, 1.25353, 0.427451, 1, 0, 1,
-0.6049017, -0.4865584, -2.622145, 0.4235294, 1, 0, 1,
-0.6042842, 0.3385847, -1.73278, 0.4156863, 1, 0, 1,
-0.6039463, 1.590431, -2.336336, 0.4117647, 1, 0, 1,
-0.6034754, 0.3265022, 0.7077661, 0.4039216, 1, 0, 1,
-0.5995721, 1.702845, -0.8530384, 0.3960784, 1, 0, 1,
-0.5970497, -2.370483, -2.478132, 0.3921569, 1, 0, 1,
-0.5938568, -0.5966154, -3.99011, 0.3843137, 1, 0, 1,
-0.5936971, -0.494259, -1.652331, 0.3803922, 1, 0, 1,
-0.5924188, 0.6168208, 0.08191137, 0.372549, 1, 0, 1,
-0.5862011, -1.468175, -3.310398, 0.3686275, 1, 0, 1,
-0.5858716, -0.1926152, -1.309085, 0.3607843, 1, 0, 1,
-0.5848973, 1.208505, -1.124332, 0.3568628, 1, 0, 1,
-0.5813383, 1.051063, -0.7466863, 0.3490196, 1, 0, 1,
-0.5777741, 0.08952657, 0.2670887, 0.345098, 1, 0, 1,
-0.5775976, -1.121665, -0.6473163, 0.3372549, 1, 0, 1,
-0.574782, -0.5984223, -3.370038, 0.3333333, 1, 0, 1,
-0.5673242, 1.952235, -0.5858254, 0.3254902, 1, 0, 1,
-0.566484, 0.174692, -2.098876, 0.3215686, 1, 0, 1,
-0.5662982, -0.1889053, -2.019898, 0.3137255, 1, 0, 1,
-0.5636233, 0.3082084, 0.02013032, 0.3098039, 1, 0, 1,
-0.5617573, 0.6947401, -2.04485, 0.3019608, 1, 0, 1,
-0.5597654, -2.366272, -4.889553, 0.2941177, 1, 0, 1,
-0.5495978, 1.534465, -0.6543856, 0.2901961, 1, 0, 1,
-0.5467808, 1.058622, -0.26572, 0.282353, 1, 0, 1,
-0.5448823, 1.165976, -1.820453, 0.2784314, 1, 0, 1,
-0.5441914, -1.205187, -3.115348, 0.2705882, 1, 0, 1,
-0.540879, 1.010678, -1.408266, 0.2666667, 1, 0, 1,
-0.539846, 0.1349784, -1.60007, 0.2588235, 1, 0, 1,
-0.5383907, 0.250652, -2.155206, 0.254902, 1, 0, 1,
-0.5370365, 0.2161808, -1.181422, 0.2470588, 1, 0, 1,
-0.5361634, -0.6326353, -1.869021, 0.2431373, 1, 0, 1,
-0.5334691, -0.355826, -2.331869, 0.2352941, 1, 0, 1,
-0.5314618, 0.5533172, -0.8514996, 0.2313726, 1, 0, 1,
-0.5211031, -0.7692776, -3.36631, 0.2235294, 1, 0, 1,
-0.5191428, 0.7150124, -0.5976306, 0.2196078, 1, 0, 1,
-0.5092376, -0.2141134, -3.891007, 0.2117647, 1, 0, 1,
-0.5078657, -2.519317, -3.333658, 0.2078431, 1, 0, 1,
-0.5013242, 2.277795, -0.347469, 0.2, 1, 0, 1,
-0.5001002, -0.5631668, -1.84629, 0.1921569, 1, 0, 1,
-0.4984852, 1.755526, 0.8735952, 0.1882353, 1, 0, 1,
-0.4957151, -0.2233431, -3.242887, 0.1803922, 1, 0, 1,
-0.494376, -1.58252, -1.86642, 0.1764706, 1, 0, 1,
-0.4942654, 0.1246668, -1.344926, 0.1686275, 1, 0, 1,
-0.4899, -1.700393, -2.65838, 0.1647059, 1, 0, 1,
-0.4890923, 1.976105, -1.29552, 0.1568628, 1, 0, 1,
-0.4833423, 0.4626747, -3.374366, 0.1529412, 1, 0, 1,
-0.4832716, -0.3083428, -0.1919444, 0.145098, 1, 0, 1,
-0.4830028, 0.6716366, -0.375309, 0.1411765, 1, 0, 1,
-0.481488, -1.11426, -3.282954, 0.1333333, 1, 0, 1,
-0.4740595, -1.031384, -2.418688, 0.1294118, 1, 0, 1,
-0.4730051, -1.935375, -2.358898, 0.1215686, 1, 0, 1,
-0.4694589, 0.89813, 0.02513016, 0.1176471, 1, 0, 1,
-0.4653232, 0.2294086, -1.33868, 0.1098039, 1, 0, 1,
-0.4626049, 0.4709928, 0.03431197, 0.1058824, 1, 0, 1,
-0.4623348, -0.4129527, -2.297443, 0.09803922, 1, 0, 1,
-0.4618031, -0.3951641, -2.476457, 0.09019608, 1, 0, 1,
-0.4605397, 2.198421, -1.005807, 0.08627451, 1, 0, 1,
-0.4583482, 1.039373, -0.07144736, 0.07843138, 1, 0, 1,
-0.4540876, -0.8186358, -2.502007, 0.07450981, 1, 0, 1,
-0.4517225, 1.26226, -0.803495, 0.06666667, 1, 0, 1,
-0.4511727, 0.003449969, -2.075169, 0.0627451, 1, 0, 1,
-0.4443685, 0.3327124, -2.728406, 0.05490196, 1, 0, 1,
-0.4395525, -0.4791281, -3.15396, 0.05098039, 1, 0, 1,
-0.4347991, 1.188562, -2.431541, 0.04313726, 1, 0, 1,
-0.4330156, 0.8688499, -0.442742, 0.03921569, 1, 0, 1,
-0.4302167, -0.8085952, -1.74791, 0.03137255, 1, 0, 1,
-0.4284189, 2.169802, -1.782932, 0.02745098, 1, 0, 1,
-0.4262144, -0.698127, -1.606745, 0.01960784, 1, 0, 1,
-0.4189674, 1.218907, -0.1569139, 0.01568628, 1, 0, 1,
-0.4178174, -0.8692651, -1.940345, 0.007843138, 1, 0, 1,
-0.4124916, 0.3971361, -1.619372, 0.003921569, 1, 0, 1,
-0.4031461, 1.212326, -1.137908, 0, 1, 0.003921569, 1,
-0.4025838, -0.7684137, -2.919606, 0, 1, 0.01176471, 1,
-0.3999448, -0.1847982, -2.275453, 0, 1, 0.01568628, 1,
-0.3980485, 0.2323502, 0.1340661, 0, 1, 0.02352941, 1,
-0.3963554, -0.1290241, -2.970394, 0, 1, 0.02745098, 1,
-0.3948853, -1.53542, -6.055567, 0, 1, 0.03529412, 1,
-0.3942575, 0.6910622, -1.867113, 0, 1, 0.03921569, 1,
-0.3921954, -0.6716334, -3.098891, 0, 1, 0.04705882, 1,
-0.3900965, -1.505959, -3.088142, 0, 1, 0.05098039, 1,
-0.3879365, 0.8347775, 0.2316234, 0, 1, 0.05882353, 1,
-0.3867366, -1.173741, -3.368603, 0, 1, 0.0627451, 1,
-0.3842275, 0.9900119, -0.5918659, 0, 1, 0.07058824, 1,
-0.3811004, -1.288594, -4.579832, 0, 1, 0.07450981, 1,
-0.3810679, -0.2075918, -2.106471, 0, 1, 0.08235294, 1,
-0.3809733, -0.4746324, -1.212568, 0, 1, 0.08627451, 1,
-0.3805542, -0.1273079, -3.217754, 0, 1, 0.09411765, 1,
-0.3715357, 1.324005, -0.1995339, 0, 1, 0.1019608, 1,
-0.3593235, 0.4827613, -0.3727256, 0, 1, 0.1058824, 1,
-0.3590035, 0.2683098, -1.401, 0, 1, 0.1137255, 1,
-0.3586757, -0.9965305, -2.455978, 0, 1, 0.1176471, 1,
-0.3583066, 0.4285075, 0.4352643, 0, 1, 0.1254902, 1,
-0.3562369, 0.4210916, -0.6182865, 0, 1, 0.1294118, 1,
-0.3546601, 0.305822, 0.5790441, 0, 1, 0.1372549, 1,
-0.3527043, -0.09761465, -2.913561, 0, 1, 0.1411765, 1,
-0.3520643, -0.3262831, -3.321307, 0, 1, 0.1490196, 1,
-0.3506849, 0.3936316, -1.166361, 0, 1, 0.1529412, 1,
-0.3456595, 1.206087, 0.2882243, 0, 1, 0.1607843, 1,
-0.3392061, -1.263087, -2.143184, 0, 1, 0.1647059, 1,
-0.3342558, 0.2057848, -1.537206, 0, 1, 0.172549, 1,
-0.3323344, 0.6401402, 0.8284894, 0, 1, 0.1764706, 1,
-0.3255777, 0.8053651, 0.8947623, 0, 1, 0.1843137, 1,
-0.3248084, 0.1427567, 0.4085025, 0, 1, 0.1882353, 1,
-0.3241166, 0.5886524, -3.151432, 0, 1, 0.1960784, 1,
-0.3229814, -0.955602, -2.51406, 0, 1, 0.2039216, 1,
-0.3212974, -0.2311528, -1.970379, 0, 1, 0.2078431, 1,
-0.3211109, 0.2581429, 0.5377635, 0, 1, 0.2156863, 1,
-0.3137407, 0.6681349, 0.1457767, 0, 1, 0.2196078, 1,
-0.312646, 0.05999262, -0.3966201, 0, 1, 0.227451, 1,
-0.3073101, 0.3259227, -2.017864, 0, 1, 0.2313726, 1,
-0.3069029, 0.3726762, 0.09379022, 0, 1, 0.2392157, 1,
-0.3068838, 0.5065496, -0.3220208, 0, 1, 0.2431373, 1,
-0.3066679, -1.380346, -4.600498, 0, 1, 0.2509804, 1,
-0.3048505, -1.371172, -2.986464, 0, 1, 0.254902, 1,
-0.3003544, -0.6352457, -3.187792, 0, 1, 0.2627451, 1,
-0.2944374, 0.1223793, -1.153537, 0, 1, 0.2666667, 1,
-0.2933855, -0.3453373, -3.262165, 0, 1, 0.2745098, 1,
-0.2927312, -0.1773382, -2.386233, 0, 1, 0.2784314, 1,
-0.2880596, 0.234144, -1.688581, 0, 1, 0.2862745, 1,
-0.2807156, 1.017129, -1.117736, 0, 1, 0.2901961, 1,
-0.2796128, -0.8707879, -3.051916, 0, 1, 0.2980392, 1,
-0.2765616, -0.2092901, -2.872502, 0, 1, 0.3058824, 1,
-0.2715904, -1.696508, -0.2905362, 0, 1, 0.3098039, 1,
-0.2663434, 0.6704792, 0.467741, 0, 1, 0.3176471, 1,
-0.2653023, -1.144454, -3.37468, 0, 1, 0.3215686, 1,
-0.2643553, 0.6959575, 2.072695, 0, 1, 0.3294118, 1,
-0.2643186, -1.063876, -2.861122, 0, 1, 0.3333333, 1,
-0.2628718, 0.775815, -1.116338, 0, 1, 0.3411765, 1,
-0.2615979, -0.6911911, -2.677087, 0, 1, 0.345098, 1,
-0.260663, -0.306847, -1.331025, 0, 1, 0.3529412, 1,
-0.2549269, 1.015127, -0.6801732, 0, 1, 0.3568628, 1,
-0.2544238, 1.250091, -1.191029, 0, 1, 0.3647059, 1,
-0.2525036, -1.479204, -2.008246, 0, 1, 0.3686275, 1,
-0.2522292, -0.3055668, -2.146178, 0, 1, 0.3764706, 1,
-0.2515618, 1.12439, -0.7348287, 0, 1, 0.3803922, 1,
-0.2460608, 0.434948, -0.1916311, 0, 1, 0.3882353, 1,
-0.2460463, -0.9959355, -3.50673, 0, 1, 0.3921569, 1,
-0.2459176, -0.3943728, -2.114155, 0, 1, 0.4, 1,
-0.2416767, -0.3831698, -3.212488, 0, 1, 0.4078431, 1,
-0.2408, -0.3439039, -2.127738, 0, 1, 0.4117647, 1,
-0.2306554, 0.7047728, 0.5498274, 0, 1, 0.4196078, 1,
-0.2302575, -1.037212, -1.172397, 0, 1, 0.4235294, 1,
-0.2302066, -0.6596075, -2.378782, 0, 1, 0.4313726, 1,
-0.2249116, 0.01749447, -1.723391, 0, 1, 0.4352941, 1,
-0.2242448, 0.6554361, -1.124825, 0, 1, 0.4431373, 1,
-0.2228729, 0.04861521, -2.51576, 0, 1, 0.4470588, 1,
-0.2223108, -1.493876, -3.004636, 0, 1, 0.454902, 1,
-0.2181443, -1.570504, -2.499973, 0, 1, 0.4588235, 1,
-0.2138555, -0.9702332, -2.85528, 0, 1, 0.4666667, 1,
-0.2135991, 0.4752244, 0.4427159, 0, 1, 0.4705882, 1,
-0.2114408, 0.09324824, -1.214073, 0, 1, 0.4784314, 1,
-0.2112236, -0.6558631, -1.671293, 0, 1, 0.4823529, 1,
-0.2099872, -1.706865, -3.304132, 0, 1, 0.4901961, 1,
-0.2094266, 0.3658414, -0.9162818, 0, 1, 0.4941176, 1,
-0.2054462, -1.819079, -2.527914, 0, 1, 0.5019608, 1,
-0.1997256, 1.3584, -1.253812, 0, 1, 0.509804, 1,
-0.1976812, 0.03253149, 0.08643129, 0, 1, 0.5137255, 1,
-0.197602, -1.558887, -1.626199, 0, 1, 0.5215687, 1,
-0.1959408, 0.0442242, -2.019269, 0, 1, 0.5254902, 1,
-0.194691, 0.5424253, -0.9716021, 0, 1, 0.5333334, 1,
-0.1887854, 0.02718803, -0.8113959, 0, 1, 0.5372549, 1,
-0.1874957, 0.3511909, -1.104056, 0, 1, 0.5450981, 1,
-0.1866116, 0.9126281, -1.977457, 0, 1, 0.5490196, 1,
-0.1862777, -0.2408735, -3.387386, 0, 1, 0.5568628, 1,
-0.1766469, 1.230646, -0.4462971, 0, 1, 0.5607843, 1,
-0.1766391, 0.3967303, 0.05839283, 0, 1, 0.5686275, 1,
-0.17507, -0.5509557, -2.770107, 0, 1, 0.572549, 1,
-0.1742159, 0.9483573, -0.2541961, 0, 1, 0.5803922, 1,
-0.1700057, -1.492198, -4.282554, 0, 1, 0.5843138, 1,
-0.169344, -0.6247689, -2.346022, 0, 1, 0.5921569, 1,
-0.1682206, 1.304961, -0.7574483, 0, 1, 0.5960785, 1,
-0.1664422, 0.1773541, -2.585336, 0, 1, 0.6039216, 1,
-0.1616345, -1.216663, -4.149566, 0, 1, 0.6117647, 1,
-0.1587681, 1.081143, 0.6236957, 0, 1, 0.6156863, 1,
-0.1451855, -1.406354, -3.41778, 0, 1, 0.6235294, 1,
-0.1361513, -0.1493063, -0.3183899, 0, 1, 0.627451, 1,
-0.134655, 0.03171075, 0.02649749, 0, 1, 0.6352941, 1,
-0.1327466, 0.03105638, -2.210507, 0, 1, 0.6392157, 1,
-0.1315733, 0.4811807, 0.4128586, 0, 1, 0.6470588, 1,
-0.1306869, 0.2564944, 0.6509475, 0, 1, 0.6509804, 1,
-0.1298261, -0.1615523, -1.385395, 0, 1, 0.6588235, 1,
-0.124359, 0.3841081, 0.408707, 0, 1, 0.6627451, 1,
-0.1234849, 1.036625, 0.5099316, 0, 1, 0.6705883, 1,
-0.1233827, 1.259252, 1.696197, 0, 1, 0.6745098, 1,
-0.1218027, 0.6541899, -0.727081, 0, 1, 0.682353, 1,
-0.1214059, -0.1960926, -3.754336, 0, 1, 0.6862745, 1,
-0.1196612, 1.571158, 1.631912, 0, 1, 0.6941177, 1,
-0.1190659, 0.07135561, -0.7246812, 0, 1, 0.7019608, 1,
-0.1173704, 0.2879404, -0.2522843, 0, 1, 0.7058824, 1,
-0.113696, 0.4240477, -0.3286901, 0, 1, 0.7137255, 1,
-0.112371, 0.4154673, -1.183204, 0, 1, 0.7176471, 1,
-0.1049181, 0.5028712, 0.3856303, 0, 1, 0.7254902, 1,
-0.104527, 1.598834, 1.439396, 0, 1, 0.7294118, 1,
-0.1023208, -1.503587, -2.752524, 0, 1, 0.7372549, 1,
-0.1013072, -0.4899949, -3.09448, 0, 1, 0.7411765, 1,
-0.09824906, -0.3513244, -2.550817, 0, 1, 0.7490196, 1,
-0.09372853, 0.5050614, 0.3451626, 0, 1, 0.7529412, 1,
-0.09307873, -1.153096, -4.040327, 0, 1, 0.7607843, 1,
-0.07699361, 0.2829546, 0.3831129, 0, 1, 0.7647059, 1,
-0.07678236, 0.6123034, 1.086097, 0, 1, 0.772549, 1,
-0.07654548, -0.786427, -1.878036, 0, 1, 0.7764706, 1,
-0.07556336, -0.2292095, -4.58182, 0, 1, 0.7843137, 1,
-0.07494308, 0.3556152, 0.9223981, 0, 1, 0.7882353, 1,
-0.07177782, 0.8444585, 0.6394814, 0, 1, 0.7960784, 1,
-0.06849857, 0.1082067, 0.9553864, 0, 1, 0.8039216, 1,
-0.06557681, 1.255766, -1.790927, 0, 1, 0.8078431, 1,
-0.06439059, -0.120129, -1.578943, 0, 1, 0.8156863, 1,
-0.06331885, 0.8967144, 1.924482, 0, 1, 0.8196079, 1,
-0.06065599, 1.074517, 0.2347548, 0, 1, 0.827451, 1,
-0.05482968, 0.7301579, 0.007473964, 0, 1, 0.8313726, 1,
-0.05458499, 0.046578, -0.5431696, 0, 1, 0.8392157, 1,
-0.04602974, -1.019678, -1.651087, 0, 1, 0.8431373, 1,
-0.043664, -0.488284, -2.272852, 0, 1, 0.8509804, 1,
-0.04356713, 0.8842571, 0.1562075, 0, 1, 0.854902, 1,
-0.04053817, -0.8930804, -3.038622, 0, 1, 0.8627451, 1,
-0.03670564, 1.404652, -2.710769, 0, 1, 0.8666667, 1,
-0.03568374, -0.2752567, -2.608219, 0, 1, 0.8745098, 1,
-0.03423607, -0.3007672, -3.865912, 0, 1, 0.8784314, 1,
-0.02320541, -1.281792, -3.780241, 0, 1, 0.8862745, 1,
-0.01785928, -1.785196, -3.103487, 0, 1, 0.8901961, 1,
-0.01666988, 0.3492695, -1.162503, 0, 1, 0.8980392, 1,
-0.01451606, 0.9589744, 0.8315356, 0, 1, 0.9058824, 1,
-0.01371069, 0.9262587, -2.014821, 0, 1, 0.9098039, 1,
-0.01188595, 0.1153257, 0.8648774, 0, 1, 0.9176471, 1,
-0.01077876, -0.5797324, -5.266472, 0, 1, 0.9215686, 1,
-0.007899074, -0.6209533, -1.675428, 0, 1, 0.9294118, 1,
-0.00776409, -3.127473, -3.746974, 0, 1, 0.9333333, 1,
-0.003990751, -1.187504, -2.850038, 0, 1, 0.9411765, 1,
-0.002227182, 0.7312491, -0.7347974, 0, 1, 0.945098, 1,
0.0003251222, -1.042669, 4.63398, 0, 1, 0.9529412, 1,
0.001009851, 0.173969, -1.147429, 0, 1, 0.9568627, 1,
0.003042589, -0.6639043, 2.549996, 0, 1, 0.9647059, 1,
0.005028017, 1.02341, -0.7986576, 0, 1, 0.9686275, 1,
0.01018333, 0.6513041, 0.9458562, 0, 1, 0.9764706, 1,
0.0118833, 1.312107, -0.4034716, 0, 1, 0.9803922, 1,
0.01230317, -0.1853845, 2.736948, 0, 1, 0.9882353, 1,
0.02421471, -0.2167547, 2.566229, 0, 1, 0.9921569, 1,
0.03040366, -0.6569356, 3.376821, 0, 1, 1, 1,
0.03226046, 0.2191248, 1.603849, 0, 0.9921569, 1, 1,
0.03260734, -0.1996725, 2.428257, 0, 0.9882353, 1, 1,
0.03423595, 0.1564625, 1.343095, 0, 0.9803922, 1, 1,
0.03465438, 1.724865, 0.4296576, 0, 0.9764706, 1, 1,
0.03502608, 1.751441, 1.614259, 0, 0.9686275, 1, 1,
0.04020922, 1.12514, 0.16084, 0, 0.9647059, 1, 1,
0.04303033, 0.1685479, 1.207657, 0, 0.9568627, 1, 1,
0.04737704, -0.3758377, 3.994736, 0, 0.9529412, 1, 1,
0.05220545, 0.6434932, 0.3530469, 0, 0.945098, 1, 1,
0.05284543, -1.020075, 3.793123, 0, 0.9411765, 1, 1,
0.05328783, -0.4718871, 4.031566, 0, 0.9333333, 1, 1,
0.05734567, 0.8603648, 1.063076, 0, 0.9294118, 1, 1,
0.05756175, 0.9923588, 1.413687, 0, 0.9215686, 1, 1,
0.05857382, -1.023049, 2.351559, 0, 0.9176471, 1, 1,
0.058892, 0.5550573, -0.1750904, 0, 0.9098039, 1, 1,
0.05920442, -0.2801927, 1.3897, 0, 0.9058824, 1, 1,
0.06331406, -0.8305573, 3.275114, 0, 0.8980392, 1, 1,
0.06569379, -0.6574914, 3.435235, 0, 0.8901961, 1, 1,
0.06689405, 1.798888, -1.066283, 0, 0.8862745, 1, 1,
0.06964377, -1.713496, 1.751843, 0, 0.8784314, 1, 1,
0.07558732, 1.156138, -0.161262, 0, 0.8745098, 1, 1,
0.07812785, 0.4297288, -0.3678439, 0, 0.8666667, 1, 1,
0.07884723, -0.180283, 1.848497, 0, 0.8627451, 1, 1,
0.08239608, 0.604167, 0.02582755, 0, 0.854902, 1, 1,
0.0838351, -0.7253236, 4.960426, 0, 0.8509804, 1, 1,
0.08742498, -0.7244482, 2.819495, 0, 0.8431373, 1, 1,
0.09009825, 1.234432, -0.3744836, 0, 0.8392157, 1, 1,
0.09059562, 0.3721643, 1.715093, 0, 0.8313726, 1, 1,
0.0939822, -1.438237, 5.268074, 0, 0.827451, 1, 1,
0.09688657, 1.40081, 0.5029517, 0, 0.8196079, 1, 1,
0.09977897, -1.03767, 2.484491, 0, 0.8156863, 1, 1,
0.1011423, 2.226791, 0.06381341, 0, 0.8078431, 1, 1,
0.1020965, -0.3450801, 1.571994, 0, 0.8039216, 1, 1,
0.1049873, 2.296551, -1.322483, 0, 0.7960784, 1, 1,
0.1064559, 1.329988, -1.192649, 0, 0.7882353, 1, 1,
0.1077098, -0.4039438, 2.982796, 0, 0.7843137, 1, 1,
0.107817, -0.4422628, 1.59502, 0, 0.7764706, 1, 1,
0.110252, 0.5942848, 1.030836, 0, 0.772549, 1, 1,
0.1155709, 0.4216599, -0.2011342, 0, 0.7647059, 1, 1,
0.1157415, -0.9412656, 3.245437, 0, 0.7607843, 1, 1,
0.1171781, 1.884012, 0.453902, 0, 0.7529412, 1, 1,
0.117479, -1.04152, 3.303076, 0, 0.7490196, 1, 1,
0.1194018, -0.6538357, 1.216193, 0, 0.7411765, 1, 1,
0.1250659, -0.2629715, 3.695472, 0, 0.7372549, 1, 1,
0.1259432, 0.5443307, 0.3251096, 0, 0.7294118, 1, 1,
0.1264814, -0.730673, 4.037171, 0, 0.7254902, 1, 1,
0.1277649, 0.1268958, 2.095376, 0, 0.7176471, 1, 1,
0.1334053, 0.3989366, 0.783776, 0, 0.7137255, 1, 1,
0.1352795, 0.3375325, -0.4018804, 0, 0.7058824, 1, 1,
0.1361405, 0.1741992, 1.232031, 0, 0.6980392, 1, 1,
0.1362789, 0.9608463, -0.4319211, 0, 0.6941177, 1, 1,
0.1372562, 0.9600233, 0.3771439, 0, 0.6862745, 1, 1,
0.1373449, -0.7354022, 3.596203, 0, 0.682353, 1, 1,
0.1408099, 0.1831878, -1.346169, 0, 0.6745098, 1, 1,
0.1435586, -0.1004537, 1.405888, 0, 0.6705883, 1, 1,
0.1451795, 0.9975898, -0.131463, 0, 0.6627451, 1, 1,
0.1490495, 1.014689, -0.3541541, 0, 0.6588235, 1, 1,
0.1491068, -0.03594925, 1.995209, 0, 0.6509804, 1, 1,
0.1517911, 0.5642187, -0.9995254, 0, 0.6470588, 1, 1,
0.1539564, 0.3493104, 1.001393, 0, 0.6392157, 1, 1,
0.1549783, 0.1649815, 1.311758, 0, 0.6352941, 1, 1,
0.156629, -0.4856511, 0.7043986, 0, 0.627451, 1, 1,
0.1582128, 0.7956836, 0.2224164, 0, 0.6235294, 1, 1,
0.15924, -0.6835352, 3.486921, 0, 0.6156863, 1, 1,
0.1601493, -0.004371706, 2.378913, 0, 0.6117647, 1, 1,
0.1663926, -2.328645, 3.177444, 0, 0.6039216, 1, 1,
0.1682593, -0.7075492, 2.121207, 0, 0.5960785, 1, 1,
0.1773661, 0.2771842, 0.4023244, 0, 0.5921569, 1, 1,
0.1788553, 0.5576264, 0.4408874, 0, 0.5843138, 1, 1,
0.1898813, 0.6607744, -0.01601837, 0, 0.5803922, 1, 1,
0.1912658, 0.9508547, -2.258487, 0, 0.572549, 1, 1,
0.1944821, 0.8085114, -0.9261609, 0, 0.5686275, 1, 1,
0.1979068, -0.4529635, 2.185179, 0, 0.5607843, 1, 1,
0.1988512, -1.008666, 3.192424, 0, 0.5568628, 1, 1,
0.199259, 0.8744136, -0.0617313, 0, 0.5490196, 1, 1,
0.2015731, -0.869335, 2.05208, 0, 0.5450981, 1, 1,
0.2016945, 0.6955767, 1.586342, 0, 0.5372549, 1, 1,
0.2018278, 0.7837411, 1.170879, 0, 0.5333334, 1, 1,
0.2052012, 1.185787, -1.559198, 0, 0.5254902, 1, 1,
0.2052436, -0.8585129, 2.562693, 0, 0.5215687, 1, 1,
0.2058877, 1.751911, -0.2535044, 0, 0.5137255, 1, 1,
0.2078571, -0.5164657, 4.648264, 0, 0.509804, 1, 1,
0.2094528, 1.339306, 1.567431, 0, 0.5019608, 1, 1,
0.2122777, -0.2733557, 2.980188, 0, 0.4941176, 1, 1,
0.2137855, 2.085882, -0.06089798, 0, 0.4901961, 1, 1,
0.2161888, 0.6577219, 0.8403341, 0, 0.4823529, 1, 1,
0.2193204, 0.5897052, 0.2630417, 0, 0.4784314, 1, 1,
0.2196724, 0.4681218, 0.4681711, 0, 0.4705882, 1, 1,
0.2198764, 0.5016778, 0.4324459, 0, 0.4666667, 1, 1,
0.2229885, -1.544708, 2.58061, 0, 0.4588235, 1, 1,
0.224525, 0.3594253, 0.6858772, 0, 0.454902, 1, 1,
0.2308526, -0.3553889, 1.972721, 0, 0.4470588, 1, 1,
0.2308709, 0.6650453, 0.6696032, 0, 0.4431373, 1, 1,
0.2376333, 1.05304, 2.210052, 0, 0.4352941, 1, 1,
0.2416684, -0.2198473, 3.42104, 0, 0.4313726, 1, 1,
0.2452108, 1.241429, -1.545059, 0, 0.4235294, 1, 1,
0.2467549, -0.9970333, 3.869231, 0, 0.4196078, 1, 1,
0.2505269, 1.751776, -1.449375, 0, 0.4117647, 1, 1,
0.2506166, 0.3845565, 1.962715, 0, 0.4078431, 1, 1,
0.2526268, -0.02386285, 1.530294, 0, 0.4, 1, 1,
0.253265, -0.629618, 1.275214, 0, 0.3921569, 1, 1,
0.2602089, 0.3397324, 2.63274, 0, 0.3882353, 1, 1,
0.2611545, 1.957301, 0.6800436, 0, 0.3803922, 1, 1,
0.2612544, 1.370438, 0.05575321, 0, 0.3764706, 1, 1,
0.2616414, 0.2182896, 0.7172207, 0, 0.3686275, 1, 1,
0.2626271, -0.2596863, 3.171407, 0, 0.3647059, 1, 1,
0.2626491, -0.841241, 4.504839, 0, 0.3568628, 1, 1,
0.2662474, 1.528119, -0.08992518, 0, 0.3529412, 1, 1,
0.2779535, 2.742942, -0.2274945, 0, 0.345098, 1, 1,
0.2785986, -0.2356647, 3.040663, 0, 0.3411765, 1, 1,
0.2794239, 0.6781606, -1.500607, 0, 0.3333333, 1, 1,
0.284894, 0.8799836, -0.5372427, 0, 0.3294118, 1, 1,
0.286688, 0.6902162, 2.308732, 0, 0.3215686, 1, 1,
0.2929854, -0.5373044, 1.04583, 0, 0.3176471, 1, 1,
0.293386, -0.7729738, 2.928512, 0, 0.3098039, 1, 1,
0.2957317, -0.4501796, 1.674239, 0, 0.3058824, 1, 1,
0.2985639, 1.255661, 1.122396, 0, 0.2980392, 1, 1,
0.3084171, 0.3817097, 0.9177181, 0, 0.2901961, 1, 1,
0.316989, -0.5950529, 1.960868, 0, 0.2862745, 1, 1,
0.3200212, -0.7037919, 4.280416, 0, 0.2784314, 1, 1,
0.3271099, 1.711158, -0.3321779, 0, 0.2745098, 1, 1,
0.3314959, 0.0865801, 0.975812, 0, 0.2666667, 1, 1,
0.3327105, -0.9920056, 4.87163, 0, 0.2627451, 1, 1,
0.3384001, -0.06761, 1.347201, 0, 0.254902, 1, 1,
0.3464913, -0.05030712, 2.946527, 0, 0.2509804, 1, 1,
0.3494172, 0.123053, 1.738557, 0, 0.2431373, 1, 1,
0.351256, 0.605401, 1.766811, 0, 0.2392157, 1, 1,
0.3512673, -0.02091472, 1.969644, 0, 0.2313726, 1, 1,
0.3534869, -0.148953, 2.80933, 0, 0.227451, 1, 1,
0.3545772, 1.54412, 0.7903796, 0, 0.2196078, 1, 1,
0.359048, 0.2596602, 2.102336, 0, 0.2156863, 1, 1,
0.3627007, 0.877885, -0.3246135, 0, 0.2078431, 1, 1,
0.3658186, -0.2634196, 3.989182, 0, 0.2039216, 1, 1,
0.3689822, 0.05566149, -0.2444781, 0, 0.1960784, 1, 1,
0.3694687, 0.1519634, -1.030902, 0, 0.1882353, 1, 1,
0.3695946, 0.2143941, 0.718852, 0, 0.1843137, 1, 1,
0.3699071, 0.4172643, 0.7915896, 0, 0.1764706, 1, 1,
0.3713846, 0.663156, 1.576031, 0, 0.172549, 1, 1,
0.3802809, -0.8413541, 3.315371, 0, 0.1647059, 1, 1,
0.3817405, -0.04681685, 2.254378, 0, 0.1607843, 1, 1,
0.3826228, 0.7622876, -0.4698789, 0, 0.1529412, 1, 1,
0.3834327, 0.2418138, 1.3176, 0, 0.1490196, 1, 1,
0.3894697, -0.2515537, 1.452833, 0, 0.1411765, 1, 1,
0.3910882, 0.424432, 0.6336446, 0, 0.1372549, 1, 1,
0.3929173, -0.6204035, 2.0218, 0, 0.1294118, 1, 1,
0.3977108, 0.3513235, 2.041659, 0, 0.1254902, 1, 1,
0.4031551, 0.7681598, -1.558734, 0, 0.1176471, 1, 1,
0.4050663, 0.5603918, 3.797271, 0, 0.1137255, 1, 1,
0.4145049, 0.08218586, 0.9254517, 0, 0.1058824, 1, 1,
0.4162659, -0.7010857, 1.080821, 0, 0.09803922, 1, 1,
0.4185048, -0.3248743, 4.61485, 0, 0.09411765, 1, 1,
0.4186354, 0.1061788, 0.6608149, 0, 0.08627451, 1, 1,
0.4263995, 1.079121, -0.004110759, 0, 0.08235294, 1, 1,
0.4272336, 0.1323295, -0.5634981, 0, 0.07450981, 1, 1,
0.4309832, 1.933612, 0.4601821, 0, 0.07058824, 1, 1,
0.4321092, 0.5190304, -0.3740912, 0, 0.0627451, 1, 1,
0.4321099, -0.2220923, 2.86705, 0, 0.05882353, 1, 1,
0.4350449, 2.071759, 0.09359329, 0, 0.05098039, 1, 1,
0.4368482, -0.5586697, 1.258768, 0, 0.04705882, 1, 1,
0.4420178, 1.660739, -0.186001, 0, 0.03921569, 1, 1,
0.4430295, 0.8429194, -0.7156308, 0, 0.03529412, 1, 1,
0.4442762, 1.532307, 0.3430978, 0, 0.02745098, 1, 1,
0.4452186, 0.8489278, -0.3212974, 0, 0.02352941, 1, 1,
0.4456175, 0.06891374, 0.7577286, 0, 0.01568628, 1, 1,
0.4567856, -0.2823855, 3.089253, 0, 0.01176471, 1, 1,
0.4585331, -0.1142167, 1.16051, 0, 0.003921569, 1, 1,
0.4609068, 1.18934, 0.9162708, 0.003921569, 0, 1, 1,
0.4620272, 0.5168394, 0.1122049, 0.007843138, 0, 1, 1,
0.4626035, 0.9039915, 0.4133375, 0.01568628, 0, 1, 1,
0.4646107, -1.295363, 3.570218, 0.01960784, 0, 1, 1,
0.4741625, 0.3481022, 0.1508573, 0.02745098, 0, 1, 1,
0.4745245, 0.9148072, 0.9355891, 0.03137255, 0, 1, 1,
0.4750063, -1.048815, 0.8468078, 0.03921569, 0, 1, 1,
0.4787334, -0.4515344, 1.467859, 0.04313726, 0, 1, 1,
0.4799289, -0.4855269, 0.5814074, 0.05098039, 0, 1, 1,
0.4808711, -2.285367, 2.740081, 0.05490196, 0, 1, 1,
0.4825034, -0.2969921, 0.8296302, 0.0627451, 0, 1, 1,
0.4855126, -1.160052, 1.756885, 0.06666667, 0, 1, 1,
0.486177, -2.410548, 4.309932, 0.07450981, 0, 1, 1,
0.4870567, 0.308995, 1.093993, 0.07843138, 0, 1, 1,
0.4872599, -0.2667189, 3.70969, 0.08627451, 0, 1, 1,
0.4909499, 0.4341714, -0.9719524, 0.09019608, 0, 1, 1,
0.4941482, -1.027648, 2.257112, 0.09803922, 0, 1, 1,
0.4951614, 0.3626558, -0.7772974, 0.1058824, 0, 1, 1,
0.49917, 0.1590893, 1.59877, 0.1098039, 0, 1, 1,
0.5018312, 1.174699, 0.5161915, 0.1176471, 0, 1, 1,
0.5031446, -0.6296512, 1.622785, 0.1215686, 0, 1, 1,
0.5092981, 0.2606171, 0.4050694, 0.1294118, 0, 1, 1,
0.5128517, -0.4663094, 0.9665209, 0.1333333, 0, 1, 1,
0.5129113, -0.6400883, 3.831378, 0.1411765, 0, 1, 1,
0.5148259, 0.632135, 0.1128546, 0.145098, 0, 1, 1,
0.5151443, 1.63119, -0.1801433, 0.1529412, 0, 1, 1,
0.5166551, 1.357905, 0.2320656, 0.1568628, 0, 1, 1,
0.5189111, 1.593437, 1.198175, 0.1647059, 0, 1, 1,
0.5197744, 0.510208, 1.213737, 0.1686275, 0, 1, 1,
0.5274773, -2.107787, 2.027901, 0.1764706, 0, 1, 1,
0.5278817, -1.291865, 2.392453, 0.1803922, 0, 1, 1,
0.5280699, -0.3135091, 2.726228, 0.1882353, 0, 1, 1,
0.529318, 0.03143019, 1.371303, 0.1921569, 0, 1, 1,
0.5381534, 1.0466, -0.2759194, 0.2, 0, 1, 1,
0.5382259, -1.103976, 2.117087, 0.2078431, 0, 1, 1,
0.5409522, -1.681954, 3.566517, 0.2117647, 0, 1, 1,
0.5429522, 0.6835425, 0.8390988, 0.2196078, 0, 1, 1,
0.5456792, 1.288017, 1.390813, 0.2235294, 0, 1, 1,
0.5484642, 1.146998, -0.2477116, 0.2313726, 0, 1, 1,
0.5511815, 0.07952768, 2.282617, 0.2352941, 0, 1, 1,
0.5577391, 0.1579077, 2.801696, 0.2431373, 0, 1, 1,
0.5600797, -1.173366, 1.608707, 0.2470588, 0, 1, 1,
0.560631, 1.641216, -0.4143041, 0.254902, 0, 1, 1,
0.561508, 0.01758737, 0.9733224, 0.2588235, 0, 1, 1,
0.5618278, 0.5318203, 1.198258, 0.2666667, 0, 1, 1,
0.5625862, -0.2241269, 2.78183, 0.2705882, 0, 1, 1,
0.5679216, -0.7134458, 5.174495, 0.2784314, 0, 1, 1,
0.568293, 0.1398955, 0.1848858, 0.282353, 0, 1, 1,
0.5727783, -0.7082915, 1.848057, 0.2901961, 0, 1, 1,
0.5728669, 1.095856, -0.2190454, 0.2941177, 0, 1, 1,
0.5750066, 0.8501776, 1.755792, 0.3019608, 0, 1, 1,
0.5788785, 0.7217132, 0.8611593, 0.3098039, 0, 1, 1,
0.5794098, 0.5794498, -0.9120033, 0.3137255, 0, 1, 1,
0.5805022, -0.2277901, 2.026805, 0.3215686, 0, 1, 1,
0.5807576, 1.948936, 0.6552051, 0.3254902, 0, 1, 1,
0.5815153, 1.668728, -0.1054359, 0.3333333, 0, 1, 1,
0.5827855, -0.4760663, 2.679523, 0.3372549, 0, 1, 1,
0.5836729, -1.420019, 4.155228, 0.345098, 0, 1, 1,
0.5876021, 1.809325, 1.971248, 0.3490196, 0, 1, 1,
0.588966, -0.429134, 4.037227, 0.3568628, 0, 1, 1,
0.5935382, 1.855988, -0.3553407, 0.3607843, 0, 1, 1,
0.5938062, 0.3375134, 0.6953061, 0.3686275, 0, 1, 1,
0.5950134, 0.001660648, 1.76643, 0.372549, 0, 1, 1,
0.5961654, -0.9526548, 2.28976, 0.3803922, 0, 1, 1,
0.5967959, -0.1015251, 0.5912904, 0.3843137, 0, 1, 1,
0.5977981, 0.07287394, 1.364353, 0.3921569, 0, 1, 1,
0.5991778, -0.37841, 3.248922, 0.3960784, 0, 1, 1,
0.6048409, -0.04948238, 1.831423, 0.4039216, 0, 1, 1,
0.6064256, 2.034215, 1.198976, 0.4117647, 0, 1, 1,
0.608233, -1.43539, 5.095766, 0.4156863, 0, 1, 1,
0.6113456, 0.0602839, 1.506239, 0.4235294, 0, 1, 1,
0.6122754, -1.071388, 2.055084, 0.427451, 0, 1, 1,
0.6152601, 0.05542017, 3.567569, 0.4352941, 0, 1, 1,
0.6163331, -0.6524494, 1.934605, 0.4392157, 0, 1, 1,
0.6190104, 0.7099337, -0.2205256, 0.4470588, 0, 1, 1,
0.6223668, -0.1612987, 2.977207, 0.4509804, 0, 1, 1,
0.6249225, -0.6976545, 2.102809, 0.4588235, 0, 1, 1,
0.6340191, -0.05629252, 2.157716, 0.4627451, 0, 1, 1,
0.6351099, -0.3418035, 2.127114, 0.4705882, 0, 1, 1,
0.6403208, 0.2185388, 1.893283, 0.4745098, 0, 1, 1,
0.6448703, -1.462066, 3.805345, 0.4823529, 0, 1, 1,
0.6501584, 0.8858845, 0.9028974, 0.4862745, 0, 1, 1,
0.6506754, -0.08176684, 1.671172, 0.4941176, 0, 1, 1,
0.6628534, 0.4155433, 1.960038, 0.5019608, 0, 1, 1,
0.6628541, 0.220357, 1.182966, 0.5058824, 0, 1, 1,
0.6677708, -1.546066, 2.201602, 0.5137255, 0, 1, 1,
0.6682239, 0.2895625, -0.250847, 0.5176471, 0, 1, 1,
0.6685585, 0.9075179, 0.2809472, 0.5254902, 0, 1, 1,
0.6694887, 0.1720176, 0.285513, 0.5294118, 0, 1, 1,
0.6754328, -3.589792, 3.195326, 0.5372549, 0, 1, 1,
0.6790723, 1.197302, -0.2291145, 0.5411765, 0, 1, 1,
0.6834056, -1.379925, 2.641981, 0.5490196, 0, 1, 1,
0.6881132, -0.4043209, 3.953677, 0.5529412, 0, 1, 1,
0.6900229, 0.689124, 1.973635, 0.5607843, 0, 1, 1,
0.6983267, -0.797691, 0.9331846, 0.5647059, 0, 1, 1,
0.6997657, 1.896515, 1.823241, 0.572549, 0, 1, 1,
0.7010447, -0.8205189, 2.83641, 0.5764706, 0, 1, 1,
0.7112715, -0.2695868, 0.6953994, 0.5843138, 0, 1, 1,
0.7120365, -0.4322289, 1.654377, 0.5882353, 0, 1, 1,
0.713244, -0.2086734, 2.601002, 0.5960785, 0, 1, 1,
0.7164215, -1.441804, 1.861028, 0.6039216, 0, 1, 1,
0.7254339, 1.906184, 0.2841215, 0.6078432, 0, 1, 1,
0.7321891, -1.875911, 0.6310324, 0.6156863, 0, 1, 1,
0.7333977, 0.05166972, 2.707781, 0.6196079, 0, 1, 1,
0.736106, -0.109807, 0.5938417, 0.627451, 0, 1, 1,
0.7384858, -0.9805816, -0.003810067, 0.6313726, 0, 1, 1,
0.7392995, 1.161924, 1.649056, 0.6392157, 0, 1, 1,
0.7474186, -1.308226, 3.578316, 0.6431373, 0, 1, 1,
0.7517478, -0.3266423, 2.624542, 0.6509804, 0, 1, 1,
0.7521251, 2.008562, 0.3928624, 0.654902, 0, 1, 1,
0.7528141, 0.8359138, 1.536253, 0.6627451, 0, 1, 1,
0.7538158, -0.2749212, 2.104754, 0.6666667, 0, 1, 1,
0.7555465, 1.425087, -0.9129715, 0.6745098, 0, 1, 1,
0.7574023, -0.4636213, 2.156676, 0.6784314, 0, 1, 1,
0.7575211, 0.7181533, 1.885325, 0.6862745, 0, 1, 1,
0.7700826, -0.3210942, 3.026973, 0.6901961, 0, 1, 1,
0.7721323, 1.087659, 0.2559778, 0.6980392, 0, 1, 1,
0.7744941, 1.495154, -0.08827272, 0.7058824, 0, 1, 1,
0.7754044, -0.1086033, -0.0644328, 0.7098039, 0, 1, 1,
0.7758114, 0.03699302, 1.760858, 0.7176471, 0, 1, 1,
0.775978, -0.7121068, 2.162918, 0.7215686, 0, 1, 1,
0.7780712, 0.8626276, -0.09464414, 0.7294118, 0, 1, 1,
0.7790883, 1.259906, 0.1959183, 0.7333333, 0, 1, 1,
0.7809329, -0.538026, 3.046553, 0.7411765, 0, 1, 1,
0.7920822, 0.5169502, 1.895719, 0.7450981, 0, 1, 1,
0.7932717, -0.4298123, 2.659332, 0.7529412, 0, 1, 1,
0.8008231, -0.4586397, -0.1005796, 0.7568628, 0, 1, 1,
0.8048645, -0.942193, 2.748696, 0.7647059, 0, 1, 1,
0.8105821, -1.516933, 2.434846, 0.7686275, 0, 1, 1,
0.8105951, -0.3797921, 0.756419, 0.7764706, 0, 1, 1,
0.8110382, 0.04641827, 3.648796, 0.7803922, 0, 1, 1,
0.8123161, -0.1131465, 1.872279, 0.7882353, 0, 1, 1,
0.8151108, -0.09782738, 1.405668, 0.7921569, 0, 1, 1,
0.8186982, -0.2837828, 2.783121, 0.8, 0, 1, 1,
0.8211175, -0.1956056, 0.2307354, 0.8078431, 0, 1, 1,
0.8240442, -0.7361686, 3.482152, 0.8117647, 0, 1, 1,
0.8358252, -0.006850956, 1.559093, 0.8196079, 0, 1, 1,
0.8363385, -0.3764364, 1.447083, 0.8235294, 0, 1, 1,
0.8486845, -0.2420668, 2.295435, 0.8313726, 0, 1, 1,
0.8500395, 0.181827, 1.959689, 0.8352941, 0, 1, 1,
0.8500999, -0.6540741, 1.158529, 0.8431373, 0, 1, 1,
0.8513305, -0.5280939, 0.8903328, 0.8470588, 0, 1, 1,
0.8548377, -1.510029, 2.257926, 0.854902, 0, 1, 1,
0.8566318, -0.0876858, 2.43724, 0.8588235, 0, 1, 1,
0.8591638, -0.04869211, 1.004817, 0.8666667, 0, 1, 1,
0.8615021, 2.289336, 0.5976398, 0.8705882, 0, 1, 1,
0.8630252, -1.254471, 2.214403, 0.8784314, 0, 1, 1,
0.867646, 0.6771222, -0.1024398, 0.8823529, 0, 1, 1,
0.8716668, 0.3683475, 1.500511, 0.8901961, 0, 1, 1,
0.8777034, -0.4571373, 0.8707079, 0.8941177, 0, 1, 1,
0.879596, -0.6568312, 2.318246, 0.9019608, 0, 1, 1,
0.8812341, 0.5904106, 1.414218, 0.9098039, 0, 1, 1,
0.8872702, -1.268444, 1.167943, 0.9137255, 0, 1, 1,
0.8883952, 0.7331688, 2.843331, 0.9215686, 0, 1, 1,
0.8885679, 1.145786, 2.25209, 0.9254902, 0, 1, 1,
0.8893819, -1.22469, 2.262694, 0.9333333, 0, 1, 1,
0.8897071, 1.129035, 0.5980951, 0.9372549, 0, 1, 1,
0.8932123, 1.467338, 0.3414429, 0.945098, 0, 1, 1,
0.8943665, -0.06185319, 1.079118, 0.9490196, 0, 1, 1,
0.89926, 0.6212699, -0.5674765, 0.9568627, 0, 1, 1,
0.8998706, 1.765797, 0.1884314, 0.9607843, 0, 1, 1,
0.9020258, -0.9885816, 1.552673, 0.9686275, 0, 1, 1,
0.9034836, 1.707447, -0.7560598, 0.972549, 0, 1, 1,
0.9188462, 1.317647, 0.5477003, 0.9803922, 0, 1, 1,
0.9303433, -0.1731524, 2.220685, 0.9843137, 0, 1, 1,
0.9326692, 0.2299862, 1.391804, 0.9921569, 0, 1, 1,
0.9426162, -0.5319976, 3.370464, 0.9960784, 0, 1, 1,
0.9435011, -0.01670734, 1.873981, 1, 0, 0.9960784, 1,
0.9439823, -1.894562, 1.885681, 1, 0, 0.9882353, 1,
0.9472763, 0.07601579, 1.747092, 1, 0, 0.9843137, 1,
0.9514791, 0.8795748, 0.132953, 1, 0, 0.9764706, 1,
0.9687665, -1.298163, 4.562219, 1, 0, 0.972549, 1,
0.9725005, -1.250273, 2.414557, 1, 0, 0.9647059, 1,
0.9765147, 1.923083, 1.499457, 1, 0, 0.9607843, 1,
0.9817616, -0.2319174, 2.678741, 1, 0, 0.9529412, 1,
0.9832211, -2.579539, 1.597752, 1, 0, 0.9490196, 1,
0.9935818, -2.080411, 1.370075, 1, 0, 0.9411765, 1,
0.9969605, 0.02950464, 2.864892, 1, 0, 0.9372549, 1,
1.009202, -0.6959438, 1.957133, 1, 0, 0.9294118, 1,
1.010397, -1.2777, 4.342765, 1, 0, 0.9254902, 1,
1.011167, -0.08068698, 1.673813, 1, 0, 0.9176471, 1,
1.012324, -0.5912483, 2.341493, 1, 0, 0.9137255, 1,
1.014733, -0.9834526, 3.209431, 1, 0, 0.9058824, 1,
1.01652, -0.2722163, 0.9578391, 1, 0, 0.9019608, 1,
1.024346, 1.122015, 0.4293445, 1, 0, 0.8941177, 1,
1.025226, -0.7640967, 0.9352111, 1, 0, 0.8862745, 1,
1.027426, -0.4879859, 1.994601, 1, 0, 0.8823529, 1,
1.028564, -0.7275532, 2.305577, 1, 0, 0.8745098, 1,
1.02967, -0.6232897, 0.8002881, 1, 0, 0.8705882, 1,
1.037092, -1.347467, 3.748838, 1, 0, 0.8627451, 1,
1.039977, 0.293722, 1.78476, 1, 0, 0.8588235, 1,
1.040351, 0.08522231, -0.5289339, 1, 0, 0.8509804, 1,
1.04121, -0.6651518, 2.02412, 1, 0, 0.8470588, 1,
1.042838, -0.2957772, 1.292185, 1, 0, 0.8392157, 1,
1.045854, -0.8815954, 2.524638, 1, 0, 0.8352941, 1,
1.053934, -0.304405, 1.597844, 1, 0, 0.827451, 1,
1.054387, 0.5799066, -0.736808, 1, 0, 0.8235294, 1,
1.060258, 0.486652, 2.724245, 1, 0, 0.8156863, 1,
1.068501, -0.078051, 3.012192, 1, 0, 0.8117647, 1,
1.069787, 0.7287564, -0.8444716, 1, 0, 0.8039216, 1,
1.071741, -1.529953, 0.3109233, 1, 0, 0.7960784, 1,
1.089036, -1.053318, 2.685437, 1, 0, 0.7921569, 1,
1.091158, -1.255493, 2.491221, 1, 0, 0.7843137, 1,
1.100465, -0.2786099, 2.712965, 1, 0, 0.7803922, 1,
1.102113, 0.6893901, 1.341325, 1, 0, 0.772549, 1,
1.103583, -0.2584309, 2.807914, 1, 0, 0.7686275, 1,
1.104353, 0.6512703, 2.340636, 1, 0, 0.7607843, 1,
1.105284, 1.091973, 1.379087, 1, 0, 0.7568628, 1,
1.111537, 0.1141543, -0.1591813, 1, 0, 0.7490196, 1,
1.125478, 0.08124161, 2.320672, 1, 0, 0.7450981, 1,
1.126004, 0.5315312, 2.223482, 1, 0, 0.7372549, 1,
1.128786, -0.3053583, 3.17236, 1, 0, 0.7333333, 1,
1.129773, 0.08489332, 0.5246559, 1, 0, 0.7254902, 1,
1.134469, -1.810207, 1.693539, 1, 0, 0.7215686, 1,
1.135349, 0.4587828, 1.382808, 1, 0, 0.7137255, 1,
1.136826, -1.046896, 2.318654, 1, 0, 0.7098039, 1,
1.146132, -0.5033404, 2.642699, 1, 0, 0.7019608, 1,
1.156152, 0.8044299, 1.491572, 1, 0, 0.6941177, 1,
1.158997, -1.485986, 2.176606, 1, 0, 0.6901961, 1,
1.159961, -0.4425064, 2.479789, 1, 0, 0.682353, 1,
1.162731, 2.2657, -1.223598, 1, 0, 0.6784314, 1,
1.16671, -0.9608374, 2.567536, 1, 0, 0.6705883, 1,
1.168854, 0.9848984, 0.2956223, 1, 0, 0.6666667, 1,
1.174664, 0.9103936, 0.5366996, 1, 0, 0.6588235, 1,
1.175296, 1.755924, -1.067005, 1, 0, 0.654902, 1,
1.177295, -0.4070982, 0.9248356, 1, 0, 0.6470588, 1,
1.177612, 0.75457, 1.917477, 1, 0, 0.6431373, 1,
1.181309, 0.4239467, 0.9500513, 1, 0, 0.6352941, 1,
1.189851, 0.9493142, 0.2957275, 1, 0, 0.6313726, 1,
1.208687, 0.04480248, 1.557046, 1, 0, 0.6235294, 1,
1.232166, -0.09456862, 3.826917, 1, 0, 0.6196079, 1,
1.23555, -0.6173477, 0.4621478, 1, 0, 0.6117647, 1,
1.248363, -0.02369811, 0.8892445, 1, 0, 0.6078432, 1,
1.259129, 1.587056, 0.7861938, 1, 0, 0.6, 1,
1.259642, -0.3630728, 1.559032, 1, 0, 0.5921569, 1,
1.265954, -0.08857273, 2.309751, 1, 0, 0.5882353, 1,
1.275074, 0.6567456, 1.971479, 1, 0, 0.5803922, 1,
1.283137, -0.435161, 3.31967, 1, 0, 0.5764706, 1,
1.284084, 0.8475283, 1.133009, 1, 0, 0.5686275, 1,
1.298608, -1.567888, 0.8490788, 1, 0, 0.5647059, 1,
1.30348, -1.97043, 1.618755, 1, 0, 0.5568628, 1,
1.306319, 0.4594869, 1.420832, 1, 0, 0.5529412, 1,
1.311291, 0.9190544, 1.021326, 1, 0, 0.5450981, 1,
1.311382, 0.08346919, 2.561149, 1, 0, 0.5411765, 1,
1.315184, -0.4620017, 2.77683, 1, 0, 0.5333334, 1,
1.315204, -0.5321575, 0.5219533, 1, 0, 0.5294118, 1,
1.315446, -0.4858343, 2.311885, 1, 0, 0.5215687, 1,
1.318886, 0.1404415, 0.8879097, 1, 0, 0.5176471, 1,
1.322431, 8.838451e-05, 2.207853, 1, 0, 0.509804, 1,
1.336136, -0.5390641, 2.824456, 1, 0, 0.5058824, 1,
1.353427, 1.499495, 1.715235, 1, 0, 0.4980392, 1,
1.380092, 0.6544874, 2.413892, 1, 0, 0.4901961, 1,
1.38032, -0.6540257, 2.516384, 1, 0, 0.4862745, 1,
1.404225, 1.825989, -0.8160193, 1, 0, 0.4784314, 1,
1.413233, -1.839755, 3.360919, 1, 0, 0.4745098, 1,
1.414631, 0.5920509, 1.238367, 1, 0, 0.4666667, 1,
1.430545, -0.9342904, 2.488028, 1, 0, 0.4627451, 1,
1.43568, -0.9071538, 2.44266, 1, 0, 0.454902, 1,
1.44511, -0.8093982, 1.475219, 1, 0, 0.4509804, 1,
1.446573, -0.01487837, 1.282892, 1, 0, 0.4431373, 1,
1.448825, -2.785686, 2.66255, 1, 0, 0.4392157, 1,
1.45116, -0.804059, 3.235515, 1, 0, 0.4313726, 1,
1.452082, 1.335066, 1.087926, 1, 0, 0.427451, 1,
1.468403, -0.6374562, 2.533628, 1, 0, 0.4196078, 1,
1.478929, -1.454963, 1.228877, 1, 0, 0.4156863, 1,
1.485769, 0.3809786, -0.2167257, 1, 0, 0.4078431, 1,
1.488178, -1.324648, 1.769405, 1, 0, 0.4039216, 1,
1.490609, 0.7432864, 2.766706, 1, 0, 0.3960784, 1,
1.500485, -2.64685, 1.989531, 1, 0, 0.3882353, 1,
1.515359, -0.2190808, 2.454001, 1, 0, 0.3843137, 1,
1.525466, 0.03196152, 0.5803937, 1, 0, 0.3764706, 1,
1.525657, 1.834349, 1.172075, 1, 0, 0.372549, 1,
1.530614, -1.91194, 3.391264, 1, 0, 0.3647059, 1,
1.540296, 0.53807, -0.1010414, 1, 0, 0.3607843, 1,
1.548377, -1.533805, 2.22693, 1, 0, 0.3529412, 1,
1.559867, 1.220103, 0.5907624, 1, 0, 0.3490196, 1,
1.569935, -0.5343022, 1.79999, 1, 0, 0.3411765, 1,
1.570059, -1.451934, 2.73732, 1, 0, 0.3372549, 1,
1.582829, 0.622098, 0.3524858, 1, 0, 0.3294118, 1,
1.590914, -1.026763, 1.161129, 1, 0, 0.3254902, 1,
1.602017, 0.4057177, 2.613112, 1, 0, 0.3176471, 1,
1.605479, 0.3007596, 0.1484972, 1, 0, 0.3137255, 1,
1.61348, 0.8952966, -0.6553276, 1, 0, 0.3058824, 1,
1.624718, -0.5664831, 1.332977, 1, 0, 0.2980392, 1,
1.629174, 0.7610476, -0.244319, 1, 0, 0.2941177, 1,
1.640409, -0.4336826, 2.125764, 1, 0, 0.2862745, 1,
1.646525, -0.05636444, 1.691922, 1, 0, 0.282353, 1,
1.666951, -0.3390516, 1.33239, 1, 0, 0.2745098, 1,
1.667215, 0.8596867, 0.7796411, 1, 0, 0.2705882, 1,
1.680143, 0.727478, 0.8623146, 1, 0, 0.2627451, 1,
1.683518, 0.7479272, 0.8976885, 1, 0, 0.2588235, 1,
1.703049, -1.668641, 1.954155, 1, 0, 0.2509804, 1,
1.703844, 0.6399865, 2.651777, 1, 0, 0.2470588, 1,
1.715014, 1.0271, 0.8418569, 1, 0, 0.2392157, 1,
1.746646, -0.4317738, 1.409554, 1, 0, 0.2352941, 1,
1.75298, 1.073796, 1.037442, 1, 0, 0.227451, 1,
1.757712, -0.2242208, 0.8704954, 1, 0, 0.2235294, 1,
1.763744, 1.394249, 0.1856222, 1, 0, 0.2156863, 1,
1.768052, 0.7238382, 0.3190467, 1, 0, 0.2117647, 1,
1.804301, -0.1159342, 1.563913, 1, 0, 0.2039216, 1,
1.835851, -0.3602903, 1.74347, 1, 0, 0.1960784, 1,
1.857908, 0.7416125, 2.110895, 1, 0, 0.1921569, 1,
1.873375, -1.594001, 2.98953, 1, 0, 0.1843137, 1,
1.894233, 0.1224868, 1.422804, 1, 0, 0.1803922, 1,
1.897707, 0.5135057, 1.700884, 1, 0, 0.172549, 1,
1.898939, -0.003710066, 1.194051, 1, 0, 0.1686275, 1,
1.900638, -1.030626, 2.171464, 1, 0, 0.1607843, 1,
1.918382, 1.022483, 1.647428, 1, 0, 0.1568628, 1,
1.924108, 0.6176183, 1.294671, 1, 0, 0.1490196, 1,
1.929715, 3.123081, -0.350123, 1, 0, 0.145098, 1,
1.942811, 1.122363, 1.073913, 1, 0, 0.1372549, 1,
1.957337, -0.3602158, 1.337022, 1, 0, 0.1333333, 1,
1.972852, -1.002979, 1.31208, 1, 0, 0.1254902, 1,
2.005556, -1.403372, 0.5193371, 1, 0, 0.1215686, 1,
2.048076, 1.031698, 0.8209183, 1, 0, 0.1137255, 1,
2.052567, 0.3432927, 2.570403, 1, 0, 0.1098039, 1,
2.064505, -1.130256, 2.607713, 1, 0, 0.1019608, 1,
2.071173, -0.9265676, 2.029372, 1, 0, 0.09411765, 1,
2.089545, 0.3796625, 0.5114621, 1, 0, 0.09019608, 1,
2.099002, 0.7559252, 1.494118, 1, 0, 0.08235294, 1,
2.116033, 1.876298, 2.326823, 1, 0, 0.07843138, 1,
2.156874, -0.7622449, 4.101752, 1, 0, 0.07058824, 1,
2.157534, -0.09698121, 1.759205, 1, 0, 0.06666667, 1,
2.177065, 0.5240032, 3.636071, 1, 0, 0.05882353, 1,
2.194788, -0.9198576, 2.317086, 1, 0, 0.05490196, 1,
2.277998, -0.4754266, 1.771381, 1, 0, 0.04705882, 1,
2.300355, -1.016967, 1.727941, 1, 0, 0.04313726, 1,
2.316344, 0.3428972, 1.222968, 1, 0, 0.03529412, 1,
2.394227, 0.7623883, 1.081357, 1, 0, 0.03137255, 1,
2.705206, 1.536691, 1.790197, 1, 0, 0.02352941, 1,
2.70769, 1.645918, 1.858125, 1, 0, 0.01960784, 1,
2.791823, -0.5353073, 2.351055, 1, 0, 0.01176471, 1,
2.81795, -1.509134, 3.068912, 1, 0, 0.007843138, 1
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
-0.2210236, -4.75831, -7.974925, 0, -0.5, 0.5, 0.5,
-0.2210236, -4.75831, -7.974925, 1, -0.5, 0.5, 0.5,
-0.2210236, -4.75831, -7.974925, 1, 1.5, 0.5, 0.5,
-0.2210236, -4.75831, -7.974925, 0, 1.5, 0.5, 0.5
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
-4.290209, -0.142835, -7.974925, 0, -0.5, 0.5, 0.5,
-4.290209, -0.142835, -7.974925, 1, -0.5, 0.5, 0.5,
-4.290209, -0.142835, -7.974925, 1, 1.5, 0.5, 0.5,
-4.290209, -0.142835, -7.974925, 0, 1.5, 0.5, 0.5
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
-4.290209, -4.75831, -0.3937469, 0, -0.5, 0.5, 0.5,
-4.290209, -4.75831, -0.3937469, 1, -0.5, 0.5, 0.5,
-4.290209, -4.75831, -0.3937469, 1, 1.5, 0.5, 0.5,
-4.290209, -4.75831, -0.3937469, 0, 1.5, 0.5, 0.5
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
-3, -3.6932, -6.225422,
2, -3.6932, -6.225422,
-3, -3.6932, -6.225422,
-3, -3.870718, -6.517005,
-2, -3.6932, -6.225422,
-2, -3.870718, -6.517005,
-1, -3.6932, -6.225422,
-1, -3.870718, -6.517005,
0, -3.6932, -6.225422,
0, -3.870718, -6.517005,
1, -3.6932, -6.225422,
1, -3.870718, -6.517005,
2, -3.6932, -6.225422,
2, -3.870718, -6.517005
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
-3, -4.225755, -7.100173, 0, -0.5, 0.5, 0.5,
-3, -4.225755, -7.100173, 1, -0.5, 0.5, 0.5,
-3, -4.225755, -7.100173, 1, 1.5, 0.5, 0.5,
-3, -4.225755, -7.100173, 0, 1.5, 0.5, 0.5,
-2, -4.225755, -7.100173, 0, -0.5, 0.5, 0.5,
-2, -4.225755, -7.100173, 1, -0.5, 0.5, 0.5,
-2, -4.225755, -7.100173, 1, 1.5, 0.5, 0.5,
-2, -4.225755, -7.100173, 0, 1.5, 0.5, 0.5,
-1, -4.225755, -7.100173, 0, -0.5, 0.5, 0.5,
-1, -4.225755, -7.100173, 1, -0.5, 0.5, 0.5,
-1, -4.225755, -7.100173, 1, 1.5, 0.5, 0.5,
-1, -4.225755, -7.100173, 0, 1.5, 0.5, 0.5,
0, -4.225755, -7.100173, 0, -0.5, 0.5, 0.5,
0, -4.225755, -7.100173, 1, -0.5, 0.5, 0.5,
0, -4.225755, -7.100173, 1, 1.5, 0.5, 0.5,
0, -4.225755, -7.100173, 0, 1.5, 0.5, 0.5,
1, -4.225755, -7.100173, 0, -0.5, 0.5, 0.5,
1, -4.225755, -7.100173, 1, -0.5, 0.5, 0.5,
1, -4.225755, -7.100173, 1, 1.5, 0.5, 0.5,
1, -4.225755, -7.100173, 0, 1.5, 0.5, 0.5,
2, -4.225755, -7.100173, 0, -0.5, 0.5, 0.5,
2, -4.225755, -7.100173, 1, -0.5, 0.5, 0.5,
2, -4.225755, -7.100173, 1, 1.5, 0.5, 0.5,
2, -4.225755, -7.100173, 0, 1.5, 0.5, 0.5
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
-3.351166, -3, -6.225422,
-3.351166, 3, -6.225422,
-3.351166, -3, -6.225422,
-3.507674, -3, -6.517005,
-3.351166, -2, -6.225422,
-3.507674, -2, -6.517005,
-3.351166, -1, -6.225422,
-3.507674, -1, -6.517005,
-3.351166, 0, -6.225422,
-3.507674, 0, -6.517005,
-3.351166, 1, -6.225422,
-3.507674, 1, -6.517005,
-3.351166, 2, -6.225422,
-3.507674, 2, -6.517005,
-3.351166, 3, -6.225422,
-3.507674, 3, -6.517005
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
-3.820688, -3, -7.100173, 0, -0.5, 0.5, 0.5,
-3.820688, -3, -7.100173, 1, -0.5, 0.5, 0.5,
-3.820688, -3, -7.100173, 1, 1.5, 0.5, 0.5,
-3.820688, -3, -7.100173, 0, 1.5, 0.5, 0.5,
-3.820688, -2, -7.100173, 0, -0.5, 0.5, 0.5,
-3.820688, -2, -7.100173, 1, -0.5, 0.5, 0.5,
-3.820688, -2, -7.100173, 1, 1.5, 0.5, 0.5,
-3.820688, -2, -7.100173, 0, 1.5, 0.5, 0.5,
-3.820688, -1, -7.100173, 0, -0.5, 0.5, 0.5,
-3.820688, -1, -7.100173, 1, -0.5, 0.5, 0.5,
-3.820688, -1, -7.100173, 1, 1.5, 0.5, 0.5,
-3.820688, -1, -7.100173, 0, 1.5, 0.5, 0.5,
-3.820688, 0, -7.100173, 0, -0.5, 0.5, 0.5,
-3.820688, 0, -7.100173, 1, -0.5, 0.5, 0.5,
-3.820688, 0, -7.100173, 1, 1.5, 0.5, 0.5,
-3.820688, 0, -7.100173, 0, 1.5, 0.5, 0.5,
-3.820688, 1, -7.100173, 0, -0.5, 0.5, 0.5,
-3.820688, 1, -7.100173, 1, -0.5, 0.5, 0.5,
-3.820688, 1, -7.100173, 1, 1.5, 0.5, 0.5,
-3.820688, 1, -7.100173, 0, 1.5, 0.5, 0.5,
-3.820688, 2, -7.100173, 0, -0.5, 0.5, 0.5,
-3.820688, 2, -7.100173, 1, -0.5, 0.5, 0.5,
-3.820688, 2, -7.100173, 1, 1.5, 0.5, 0.5,
-3.820688, 2, -7.100173, 0, 1.5, 0.5, 0.5,
-3.820688, 3, -7.100173, 0, -0.5, 0.5, 0.5,
-3.820688, 3, -7.100173, 1, -0.5, 0.5, 0.5,
-3.820688, 3, -7.100173, 1, 1.5, 0.5, 0.5,
-3.820688, 3, -7.100173, 0, 1.5, 0.5, 0.5
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
-3.351166, -3.6932, -6,
-3.351166, -3.6932, 4,
-3.351166, -3.6932, -6,
-3.507674, -3.870718, -6,
-3.351166, -3.6932, -4,
-3.507674, -3.870718, -4,
-3.351166, -3.6932, -2,
-3.507674, -3.870718, -2,
-3.351166, -3.6932, 0,
-3.507674, -3.870718, 0,
-3.351166, -3.6932, 2,
-3.507674, -3.870718, 2,
-3.351166, -3.6932, 4,
-3.507674, -3.870718, 4
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
"-6",
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
-3.820688, -4.225755, -6, 0, -0.5, 0.5, 0.5,
-3.820688, -4.225755, -6, 1, -0.5, 0.5, 0.5,
-3.820688, -4.225755, -6, 1, 1.5, 0.5, 0.5,
-3.820688, -4.225755, -6, 0, 1.5, 0.5, 0.5,
-3.820688, -4.225755, -4, 0, -0.5, 0.5, 0.5,
-3.820688, -4.225755, -4, 1, -0.5, 0.5, 0.5,
-3.820688, -4.225755, -4, 1, 1.5, 0.5, 0.5,
-3.820688, -4.225755, -4, 0, 1.5, 0.5, 0.5,
-3.820688, -4.225755, -2, 0, -0.5, 0.5, 0.5,
-3.820688, -4.225755, -2, 1, -0.5, 0.5, 0.5,
-3.820688, -4.225755, -2, 1, 1.5, 0.5, 0.5,
-3.820688, -4.225755, -2, 0, 1.5, 0.5, 0.5,
-3.820688, -4.225755, 0, 0, -0.5, 0.5, 0.5,
-3.820688, -4.225755, 0, 1, -0.5, 0.5, 0.5,
-3.820688, -4.225755, 0, 1, 1.5, 0.5, 0.5,
-3.820688, -4.225755, 0, 0, 1.5, 0.5, 0.5,
-3.820688, -4.225755, 2, 0, -0.5, 0.5, 0.5,
-3.820688, -4.225755, 2, 1, -0.5, 0.5, 0.5,
-3.820688, -4.225755, 2, 1, 1.5, 0.5, 0.5,
-3.820688, -4.225755, 2, 0, 1.5, 0.5, 0.5,
-3.820688, -4.225755, 4, 0, -0.5, 0.5, 0.5,
-3.820688, -4.225755, 4, 1, -0.5, 0.5, 0.5,
-3.820688, -4.225755, 4, 1, 1.5, 0.5, 0.5,
-3.820688, -4.225755, 4, 0, 1.5, 0.5, 0.5
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
-3.351166, -3.6932, -6.225422,
-3.351166, 3.40753, -6.225422,
-3.351166, -3.6932, 5.437928,
-3.351166, 3.40753, 5.437928,
-3.351166, -3.6932, -6.225422,
-3.351166, -3.6932, 5.437928,
-3.351166, 3.40753, -6.225422,
-3.351166, 3.40753, 5.437928,
-3.351166, -3.6932, -6.225422,
2.909119, -3.6932, -6.225422,
-3.351166, -3.6932, 5.437928,
2.909119, -3.6932, 5.437928,
-3.351166, 3.40753, -6.225422,
2.909119, 3.40753, -6.225422,
-3.351166, 3.40753, 5.437928,
2.909119, 3.40753, 5.437928,
2.909119, -3.6932, -6.225422,
2.909119, 3.40753, -6.225422,
2.909119, -3.6932, 5.437928,
2.909119, 3.40753, 5.437928,
2.909119, -3.6932, -6.225422,
2.909119, -3.6932, 5.437928,
2.909119, 3.40753, -6.225422,
2.909119, 3.40753, 5.437928
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
var radius = 8.021186;
var distance = 35.68716;
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
mvMatrix.translate( 0.2210236, 0.142835, 0.3937469 );
mvMatrix.scale( 1.385346, 1.221376, 0.7435825 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.68716);
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
Ziram<-read.table("Ziram.xyz")
```

```
## Error in read.table("Ziram.xyz"): no lines available in input
```

```r
x<-Ziram$V2
```

```
## Error in eval(expr, envir, enclos): object 'Ziram' not found
```

```r
y<-Ziram$V3
```

```
## Error in eval(expr, envir, enclos): object 'Ziram' not found
```

```r
z<-Ziram$V4
```

```
## Error in eval(expr, envir, enclos): object 'Ziram' not found
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
-3.259997, -0.3599299, -0.4590291, 0, 0, 1, 1, 1,
-3.185596, -1.663874, -2.131123, 1, 0, 0, 1, 1,
-2.77985, -0.1502482, -1.422556, 1, 0, 0, 1, 1,
-2.764076, -0.80187, -1.536171, 1, 0, 0, 1, 1,
-2.749931, 0.403295, 0.7725543, 1, 0, 0, 1, 1,
-2.710346, -0.2701964, -2.706764, 1, 0, 0, 1, 1,
-2.627306, 0.847387, 0.9616408, 0, 0, 0, 1, 1,
-2.504908, 1.269898, -1.593948, 0, 0, 0, 1, 1,
-2.461508, 1.861212, -1.432842, 0, 0, 0, 1, 1,
-2.382949, -0.7357724, -0.02720314, 0, 0, 0, 1, 1,
-2.294403, -1.29032, -1.18894, 0, 0, 0, 1, 1,
-2.269456, -0.3250182, -1.443003, 0, 0, 0, 1, 1,
-2.244194, 1.152085, -0.327325, 0, 0, 0, 1, 1,
-2.227259, -0.2577525, -0.6218345, 1, 1, 1, 1, 1,
-2.215504, -1.578745, -0.9152976, 1, 1, 1, 1, 1,
-2.205415, 0.7284554, -1.142786, 1, 1, 1, 1, 1,
-2.16753, 0.26351, -1.648507, 1, 1, 1, 1, 1,
-2.155112, 0.4436167, -0.3582853, 1, 1, 1, 1, 1,
-2.092132, -1.393815, -2.03625, 1, 1, 1, 1, 1,
-2.071402, 1.127605, -1.470276, 1, 1, 1, 1, 1,
-2.019585, 1.613517, 0.2302271, 1, 1, 1, 1, 1,
-2.016722, -1.230272, -3.716051, 1, 1, 1, 1, 1,
-1.989326, 0.1612929, -1.313242, 1, 1, 1, 1, 1,
-1.974015, 2.200465, -1.212573, 1, 1, 1, 1, 1,
-1.967704, 1.650472, 0.3997456, 1, 1, 1, 1, 1,
-1.937997, -0.03375563, -3.342977, 1, 1, 1, 1, 1,
-1.920521, -0.1276107, -2.4567, 1, 1, 1, 1, 1,
-1.914592, 1.024246, -1.198668, 1, 1, 1, 1, 1,
-1.909572, 1.476539, -1.152713, 0, 0, 1, 1, 1,
-1.907309, 1.154212, -1.578548, 1, 0, 0, 1, 1,
-1.904379, -1.740493, -2.159035, 1, 0, 0, 1, 1,
-1.903241, -0.4486767, -1.789782, 1, 0, 0, 1, 1,
-1.880269, -0.8842429, -0.9066734, 1, 0, 0, 1, 1,
-1.875504, -0.9977174, -2.513432, 1, 0, 0, 1, 1,
-1.857068, 0.02541875, -1.410502, 0, 0, 0, 1, 1,
-1.834322, 0.3367412, 0.4246315, 0, 0, 0, 1, 1,
-1.805497, -1.704602, -2.579415, 0, 0, 0, 1, 1,
-1.796398, 0.3781371, -2.498472, 0, 0, 0, 1, 1,
-1.787683, -0.7669131, -1.876297, 0, 0, 0, 1, 1,
-1.784455, -0.0008573122, -1.80732, 0, 0, 0, 1, 1,
-1.783682, -2.970559, -3.393595, 0, 0, 0, 1, 1,
-1.780857, 0.712799, 0.3238694, 1, 1, 1, 1, 1,
-1.775897, -0.3957547, -1.557566, 1, 1, 1, 1, 1,
-1.760145, -2.019848, -3.660724, 1, 1, 1, 1, 1,
-1.754786, -0.6656095, -0.5413322, 1, 1, 1, 1, 1,
-1.728801, -0.9236437, -2.290988, 1, 1, 1, 1, 1,
-1.722474, -0.05185038, -2.3915, 1, 1, 1, 1, 1,
-1.721882, 0.1792155, -1.130862, 1, 1, 1, 1, 1,
-1.71151, 2.249339, -0.1761947, 1, 1, 1, 1, 1,
-1.700167, -1.720587, -2.810014, 1, 1, 1, 1, 1,
-1.700075, -0.4526855, -3.511721, 1, 1, 1, 1, 1,
-1.693477, 1.127632, -0.8723394, 1, 1, 1, 1, 1,
-1.68916, -0.4571764, 0.294702, 1, 1, 1, 1, 1,
-1.683298, 0.4328675, -2.311145, 1, 1, 1, 1, 1,
-1.660637, -0.2040158, -2.473161, 1, 1, 1, 1, 1,
-1.650775, -0.7756818, -1.87157, 1, 1, 1, 1, 1,
-1.642533, -0.7345409, 0.509394, 0, 0, 1, 1, 1,
-1.63342, 1.699894, -1.500527, 1, 0, 0, 1, 1,
-1.631593, 0.4973167, -2.414024, 1, 0, 0, 1, 1,
-1.631246, 2.289835, -0.6660535, 1, 0, 0, 1, 1,
-1.63036, 3.304121, 0.2403519, 1, 0, 0, 1, 1,
-1.611457, 0.1553867, -0.9365942, 1, 0, 0, 1, 1,
-1.574471, 0.9713843, -0.5508376, 0, 0, 0, 1, 1,
-1.560547, 0.3721407, -1.535203, 0, 0, 0, 1, 1,
-1.544215, 0.4605944, -1.641883, 0, 0, 0, 1, 1,
-1.52463, -0.09614526, -1.375513, 0, 0, 0, 1, 1,
-1.514473, 0.794127, -2.828139, 0, 0, 0, 1, 1,
-1.511974, -0.5850637, -2.227329, 0, 0, 0, 1, 1,
-1.499387, 0.1357918, -1.960091, 0, 0, 0, 1, 1,
-1.481827, 0.8519925, -0.2215523, 1, 1, 1, 1, 1,
-1.477496, 1.137804, 0.1185861, 1, 1, 1, 1, 1,
-1.472571, 1.568878, -1.516403, 1, 1, 1, 1, 1,
-1.469871, 1.565342, -1.015989, 1, 1, 1, 1, 1,
-1.469044, -0.3058688, -3.595575, 1, 1, 1, 1, 1,
-1.44083, 1.525206, 1.073481, 1, 1, 1, 1, 1,
-1.435038, -0.9998618, -1.934979, 1, 1, 1, 1, 1,
-1.419621, -1.91845, -1.396164, 1, 1, 1, 1, 1,
-1.410509, -1.180099, -0.525115, 1, 1, 1, 1, 1,
-1.400623, 0.1578361, -2.54735, 1, 1, 1, 1, 1,
-1.395135, 1.036573, -2.158403, 1, 1, 1, 1, 1,
-1.393745, -0.5236786, -1.553656, 1, 1, 1, 1, 1,
-1.383041, 0.621049, -1.694458, 1, 1, 1, 1, 1,
-1.381415, -0.3008749, -2.23915, 1, 1, 1, 1, 1,
-1.369262, 1.964593, 0.06545435, 1, 1, 1, 1, 1,
-1.364288, 0.5081695, 1.391845, 0, 0, 1, 1, 1,
-1.358837, 0.3365284, -0.9683327, 1, 0, 0, 1, 1,
-1.356646, -0.3997792, -2.494192, 1, 0, 0, 1, 1,
-1.342013, -0.8474668, -1.005, 1, 0, 0, 1, 1,
-1.338503, 2.43203, -1.395699, 1, 0, 0, 1, 1,
-1.336689, -0.8816965, -2.269844, 1, 0, 0, 1, 1,
-1.334294, 1.268965, -0.03877867, 0, 0, 0, 1, 1,
-1.331105, -0.6893719, -0.4241643, 0, 0, 0, 1, 1,
-1.323502, 0.3499758, -1.468217, 0, 0, 0, 1, 1,
-1.323161, 0.3097359, -0.9303271, 0, 0, 0, 1, 1,
-1.314545, -0.1148159, -0.8397307, 0, 0, 0, 1, 1,
-1.310306, -1.498237, -2.000046, 0, 0, 0, 1, 1,
-1.293164, 1.20041, 0.5296459, 0, 0, 0, 1, 1,
-1.292515, -0.9993078, -3.820363, 1, 1, 1, 1, 1,
-1.290292, -0.3267475, -1.431518, 1, 1, 1, 1, 1,
-1.288627, -0.1274096, -1.091511, 1, 1, 1, 1, 1,
-1.263463, 0.9531686, -0.5725685, 1, 1, 1, 1, 1,
-1.259337, -1.132648, -1.498381, 1, 1, 1, 1, 1,
-1.256057, 0.2109656, -4.472188, 1, 1, 1, 1, 1,
-1.252593, -0.386836, -2.134946, 1, 1, 1, 1, 1,
-1.24004, 0.04407064, -1.484014, 1, 1, 1, 1, 1,
-1.235881, -1.208443, -1.720637, 1, 1, 1, 1, 1,
-1.226182, -1.420688, -0.7420124, 1, 1, 1, 1, 1,
-1.22332, 2.394199, -1.457155, 1, 1, 1, 1, 1,
-1.201921, 0.8443009, -1.227802, 1, 1, 1, 1, 1,
-1.194582, -0.5154148, -1.642342, 1, 1, 1, 1, 1,
-1.192178, 0.3012638, -1.074463, 1, 1, 1, 1, 1,
-1.192045, 1.050572, 1.000883, 1, 1, 1, 1, 1,
-1.19193, -0.5415194, -0.9167321, 0, 0, 1, 1, 1,
-1.181811, 2.037384, 0.9973746, 1, 0, 0, 1, 1,
-1.17701, 0.1874317, -0.4323863, 1, 0, 0, 1, 1,
-1.176033, 2.616858, 0.167115, 1, 0, 0, 1, 1,
-1.175025, 0.5208058, -2.129489, 1, 0, 0, 1, 1,
-1.169172, -2.58775, -2.458147, 1, 0, 0, 1, 1,
-1.165766, -1.822201, -3.109386, 0, 0, 0, 1, 1,
-1.158941, 0.1565179, -1.699153, 0, 0, 0, 1, 1,
-1.158816, 0.513429, -1.495677, 0, 0, 0, 1, 1,
-1.155202, -0.3260529, -0.3390241, 0, 0, 0, 1, 1,
-1.14237, -0.1327901, -1.641499, 0, 0, 0, 1, 1,
-1.135686, -0.6143644, -1.254663, 0, 0, 0, 1, 1,
-1.133083, -0.4239133, -2.000475, 0, 0, 0, 1, 1,
-1.127423, -0.8653239, -1.642087, 1, 1, 1, 1, 1,
-1.124099, -1.198386, -2.210629, 1, 1, 1, 1, 1,
-1.118932, -0.0938092, -1.030522, 1, 1, 1, 1, 1,
-1.1086, 1.076231, -0.5644369, 1, 1, 1, 1, 1,
-1.106696, -1.165165, -4.242731, 1, 1, 1, 1, 1,
-1.095735, -2.532197, -4.210349, 1, 1, 1, 1, 1,
-1.094138, 1.547598, -2.207744, 1, 1, 1, 1, 1,
-1.089931, 0.6648558, -2.772015, 1, 1, 1, 1, 1,
-1.078412, -0.8105015, -2.10681, 1, 1, 1, 1, 1,
-1.078378, 0.7710692, -1.174132, 1, 1, 1, 1, 1,
-1.076836, 0.849759, 1.375414, 1, 1, 1, 1, 1,
-1.072432, -1.07295, -2.859669, 1, 1, 1, 1, 1,
-1.064494, 0.8602344, 0.2304054, 1, 1, 1, 1, 1,
-1.06294, -1.949074, -3.776136, 1, 1, 1, 1, 1,
-1.061317, 1.857066, -0.6458174, 1, 1, 1, 1, 1,
-1.060956, -0.326625, -3.389441, 0, 0, 1, 1, 1,
-1.056917, 0.1340213, -0.01562328, 1, 0, 0, 1, 1,
-1.052601, -1.167663, -1.998904, 1, 0, 0, 1, 1,
-1.046314, -2.055773, -2.87467, 1, 0, 0, 1, 1,
-1.038272, 1.816211, -0.3873391, 1, 0, 0, 1, 1,
-1.031992, 0.8839403, 0.1834778, 1, 0, 0, 1, 1,
-1.031137, 0.3356356, -1.215937, 0, 0, 0, 1, 1,
-1.015425, 0.6497149, -0.2294085, 0, 0, 0, 1, 1,
-1.01283, -1.051071, -1.38013, 0, 0, 0, 1, 1,
-1.010258, -0.803014, -3.150675, 0, 0, 0, 1, 1,
-1.007326, 0.9940736, -1.411356, 0, 0, 0, 1, 1,
-1.007216, 1.103201, -1.025111, 0, 0, 0, 1, 1,
-1.006002, -1.004862, -4.348127, 0, 0, 0, 1, 1,
-0.9990505, -2.400715, -2.270427, 1, 1, 1, 1, 1,
-0.9983774, -2.344002, -2.184271, 1, 1, 1, 1, 1,
-0.9872247, -2.203858, -3.384944, 1, 1, 1, 1, 1,
-0.9824236, 1.113961, 0.251642, 1, 1, 1, 1, 1,
-0.9810508, 1.547452, 0.0777816, 1, 1, 1, 1, 1,
-0.9799348, 0.09542128, -0.9394104, 1, 1, 1, 1, 1,
-0.9786289, 1.638861, -0.08100387, 1, 1, 1, 1, 1,
-0.9771174, 0.503533, 0.2352915, 1, 1, 1, 1, 1,
-0.9768072, -0.8799335, -2.860732, 1, 1, 1, 1, 1,
-0.9746688, -1.170239, -2.477595, 1, 1, 1, 1, 1,
-0.9730436, 1.469156, -0.765172, 1, 1, 1, 1, 1,
-0.9636261, -0.02882614, -0.2017034, 1, 1, 1, 1, 1,
-0.9622591, 1.323952, -0.43611, 1, 1, 1, 1, 1,
-0.9603025, -0.5933744, -1.434324, 1, 1, 1, 1, 1,
-0.943427, 1.020651, -1.905692, 1, 1, 1, 1, 1,
-0.9414601, 0.5524406, -0.8218431, 0, 0, 1, 1, 1,
-0.9399603, 0.4468424, -2.485283, 1, 0, 0, 1, 1,
-0.9355248, 0.8344145, -1.522402, 1, 0, 0, 1, 1,
-0.9282698, 0.3370848, -2.730935, 1, 0, 0, 1, 1,
-0.9196048, 1.001097, -0.1124722, 1, 0, 0, 1, 1,
-0.9186893, -1.541923, -1.59351, 1, 0, 0, 1, 1,
-0.918172, -1.379482, -2.283344, 0, 0, 0, 1, 1,
-0.9112389, 1.447721, -1.471897, 0, 0, 0, 1, 1,
-0.9055243, -0.0913782, -0.9473878, 0, 0, 0, 1, 1,
-0.9015064, -2.247478, -2.054085, 0, 0, 0, 1, 1,
-0.8988855, -1.106531, -2.648172, 0, 0, 0, 1, 1,
-0.8948603, 0.02895317, -2.228855, 0, 0, 0, 1, 1,
-0.8901516, -0.5946177, -3.326843, 0, 0, 0, 1, 1,
-0.8899192, -0.7130487, -1.930303, 1, 1, 1, 1, 1,
-0.8890082, 0.4685106, -1.197508, 1, 1, 1, 1, 1,
-0.88607, 0.09340098, -1.033307, 1, 1, 1, 1, 1,
-0.8839391, -0.9514782, -1.99783, 1, 1, 1, 1, 1,
-0.8816191, -0.5888088, -2.359226, 1, 1, 1, 1, 1,
-0.8708664, -0.2527419, -1.848853, 1, 1, 1, 1, 1,
-0.8698151, 1.261437, -1.137331, 1, 1, 1, 1, 1,
-0.8672388, -0.1900637, -2.263663, 1, 1, 1, 1, 1,
-0.8582759, -2.359099, -3.404305, 1, 1, 1, 1, 1,
-0.845238, 0.6346973, -0.4563857, 1, 1, 1, 1, 1,
-0.8433431, 0.3147879, 0.0851096, 1, 1, 1, 1, 1,
-0.841713, 0.09603129, -0.5098156, 1, 1, 1, 1, 1,
-0.8413555, -0.3605038, -2.754441, 1, 1, 1, 1, 1,
-0.8328335, 0.8194329, -0.4278919, 1, 1, 1, 1, 1,
-0.8322484, -0.6222986, -1.456133, 1, 1, 1, 1, 1,
-0.826234, 0.6969264, -1.388446, 0, 0, 1, 1, 1,
-0.8150081, 0.06178177, -2.223809, 1, 0, 0, 1, 1,
-0.8134219, 2.043944, -1.179366, 1, 0, 0, 1, 1,
-0.8087901, -1.832474, -2.606639, 1, 0, 0, 1, 1,
-0.8011503, -1.388985, -2.185076, 1, 0, 0, 1, 1,
-0.7944581, -2.026719, -2.372648, 1, 0, 0, 1, 1,
-0.7925523, 0.5279673, -0.6173207, 0, 0, 0, 1, 1,
-0.7893493, -0.8055978, -3.15756, 0, 0, 0, 1, 1,
-0.7881876, 0.6554667, -1.037139, 0, 0, 0, 1, 1,
-0.7855329, -0.2565098, -0.8924062, 0, 0, 0, 1, 1,
-0.7852213, 0.8579432, -0.009708555, 0, 0, 0, 1, 1,
-0.7840874, 0.8840511, -0.09939365, 0, 0, 0, 1, 1,
-0.7779517, 0.02930012, -2.127308, 0, 0, 0, 1, 1,
-0.7734891, -0.01670455, -2.297548, 1, 1, 1, 1, 1,
-0.7673186, 0.432169, -1.451275, 1, 1, 1, 1, 1,
-0.7627062, 0.01860475, -2.040338, 1, 1, 1, 1, 1,
-0.7618072, 0.8631155, -0.9689046, 1, 1, 1, 1, 1,
-0.7591727, 0.9391387, -1.141269, 1, 1, 1, 1, 1,
-0.7577245, -0.2034528, -0.6011792, 1, 1, 1, 1, 1,
-0.7538468, 0.3173056, 1.032473, 1, 1, 1, 1, 1,
-0.7521688, -1.235411, -4.346432, 1, 1, 1, 1, 1,
-0.7521667, 0.5440177, -0.5226312, 1, 1, 1, 1, 1,
-0.7519553, 0.6897784, -0.3956544, 1, 1, 1, 1, 1,
-0.7454345, 1.347081, -1.048784, 1, 1, 1, 1, 1,
-0.7418527, 0.698341, -0.4071411, 1, 1, 1, 1, 1,
-0.7350539, -0.03795361, 0.6224577, 1, 1, 1, 1, 1,
-0.7319916, 0.5420141, -1.486526, 1, 1, 1, 1, 1,
-0.7306077, 1.200847, 0.3682258, 1, 1, 1, 1, 1,
-0.7216365, -1.138367, -3.666046, 0, 0, 1, 1, 1,
-0.72113, -2.029933, -3.183485, 1, 0, 0, 1, 1,
-0.7152892, -0.1060117, -2.34567, 1, 0, 0, 1, 1,
-0.7142621, 0.9085379, -0.442853, 1, 0, 0, 1, 1,
-0.7122163, -0.62059, -2.146127, 1, 0, 0, 1, 1,
-0.7047378, -0.7657059, -2.489654, 1, 0, 0, 1, 1,
-0.7046722, -1.451049, -2.17441, 0, 0, 0, 1, 1,
-0.7027407, 0.7956627, -0.3787673, 0, 0, 0, 1, 1,
-0.7008439, 1.567126, 0.0492962, 0, 0, 0, 1, 1,
-0.699259, 1.338453, 0.4670707, 0, 0, 0, 1, 1,
-0.697217, 0.2036604, -2.215414, 0, 0, 0, 1, 1,
-0.6930259, -0.5233165, -1.888693, 0, 0, 0, 1, 1,
-0.6917825, 0.2249257, -1.416451, 0, 0, 0, 1, 1,
-0.6863744, -0.2714108, -1.734598, 1, 1, 1, 1, 1,
-0.678737, -1.934343, -2.441542, 1, 1, 1, 1, 1,
-0.6769782, -0.5114583, -1.966197, 1, 1, 1, 1, 1,
-0.6767948, -0.2715072, -0.7536607, 1, 1, 1, 1, 1,
-0.6727031, -2.231543, -2.020308, 1, 1, 1, 1, 1,
-0.6725843, -0.6894436, -1.772402, 1, 1, 1, 1, 1,
-0.6686311, 1.020051, -1.416095, 1, 1, 1, 1, 1,
-0.6646618, 0.9847329, -1.348884, 1, 1, 1, 1, 1,
-0.6629529, -0.5883459, -1.707719, 1, 1, 1, 1, 1,
-0.6570888, -0.2704229, -3.516314, 1, 1, 1, 1, 1,
-0.6540832, 0.32368, -1.467482, 1, 1, 1, 1, 1,
-0.6451749, -0.7565079, -1.108214, 1, 1, 1, 1, 1,
-0.6420999, 0.4907207, -1.215662, 1, 1, 1, 1, 1,
-0.6356519, -1.836758, -2.163906, 1, 1, 1, 1, 1,
-0.6321622, -0.1017212, -3.761485, 1, 1, 1, 1, 1,
-0.6293062, -1.742711, -2.588672, 0, 0, 1, 1, 1,
-0.6288601, -1.590548, -4.039272, 1, 0, 0, 1, 1,
-0.6264709, 1.565666, -0.678856, 1, 0, 0, 1, 1,
-0.6252326, -0.1643217, -1.852926, 1, 0, 0, 1, 1,
-0.6249752, 1.463204, 1.19609, 1, 0, 0, 1, 1,
-0.6185713, 0.7939473, -0.06408946, 1, 0, 0, 1, 1,
-0.6163147, -0.01419087, -1.794923, 0, 0, 0, 1, 1,
-0.6162661, 0.2700294, -1.303477, 0, 0, 0, 1, 1,
-0.6142446, -1.522779, -2.923179, 0, 0, 0, 1, 1,
-0.611032, -0.7862434, -3.373926, 0, 0, 0, 1, 1,
-0.6070845, 1.690561, 1.25353, 0, 0, 0, 1, 1,
-0.6049017, -0.4865584, -2.622145, 0, 0, 0, 1, 1,
-0.6042842, 0.3385847, -1.73278, 0, 0, 0, 1, 1,
-0.6039463, 1.590431, -2.336336, 1, 1, 1, 1, 1,
-0.6034754, 0.3265022, 0.7077661, 1, 1, 1, 1, 1,
-0.5995721, 1.702845, -0.8530384, 1, 1, 1, 1, 1,
-0.5970497, -2.370483, -2.478132, 1, 1, 1, 1, 1,
-0.5938568, -0.5966154, -3.99011, 1, 1, 1, 1, 1,
-0.5936971, -0.494259, -1.652331, 1, 1, 1, 1, 1,
-0.5924188, 0.6168208, 0.08191137, 1, 1, 1, 1, 1,
-0.5862011, -1.468175, -3.310398, 1, 1, 1, 1, 1,
-0.5858716, -0.1926152, -1.309085, 1, 1, 1, 1, 1,
-0.5848973, 1.208505, -1.124332, 1, 1, 1, 1, 1,
-0.5813383, 1.051063, -0.7466863, 1, 1, 1, 1, 1,
-0.5777741, 0.08952657, 0.2670887, 1, 1, 1, 1, 1,
-0.5775976, -1.121665, -0.6473163, 1, 1, 1, 1, 1,
-0.574782, -0.5984223, -3.370038, 1, 1, 1, 1, 1,
-0.5673242, 1.952235, -0.5858254, 1, 1, 1, 1, 1,
-0.566484, 0.174692, -2.098876, 0, 0, 1, 1, 1,
-0.5662982, -0.1889053, -2.019898, 1, 0, 0, 1, 1,
-0.5636233, 0.3082084, 0.02013032, 1, 0, 0, 1, 1,
-0.5617573, 0.6947401, -2.04485, 1, 0, 0, 1, 1,
-0.5597654, -2.366272, -4.889553, 1, 0, 0, 1, 1,
-0.5495978, 1.534465, -0.6543856, 1, 0, 0, 1, 1,
-0.5467808, 1.058622, -0.26572, 0, 0, 0, 1, 1,
-0.5448823, 1.165976, -1.820453, 0, 0, 0, 1, 1,
-0.5441914, -1.205187, -3.115348, 0, 0, 0, 1, 1,
-0.540879, 1.010678, -1.408266, 0, 0, 0, 1, 1,
-0.539846, 0.1349784, -1.60007, 0, 0, 0, 1, 1,
-0.5383907, 0.250652, -2.155206, 0, 0, 0, 1, 1,
-0.5370365, 0.2161808, -1.181422, 0, 0, 0, 1, 1,
-0.5361634, -0.6326353, -1.869021, 1, 1, 1, 1, 1,
-0.5334691, -0.355826, -2.331869, 1, 1, 1, 1, 1,
-0.5314618, 0.5533172, -0.8514996, 1, 1, 1, 1, 1,
-0.5211031, -0.7692776, -3.36631, 1, 1, 1, 1, 1,
-0.5191428, 0.7150124, -0.5976306, 1, 1, 1, 1, 1,
-0.5092376, -0.2141134, -3.891007, 1, 1, 1, 1, 1,
-0.5078657, -2.519317, -3.333658, 1, 1, 1, 1, 1,
-0.5013242, 2.277795, -0.347469, 1, 1, 1, 1, 1,
-0.5001002, -0.5631668, -1.84629, 1, 1, 1, 1, 1,
-0.4984852, 1.755526, 0.8735952, 1, 1, 1, 1, 1,
-0.4957151, -0.2233431, -3.242887, 1, 1, 1, 1, 1,
-0.494376, -1.58252, -1.86642, 1, 1, 1, 1, 1,
-0.4942654, 0.1246668, -1.344926, 1, 1, 1, 1, 1,
-0.4899, -1.700393, -2.65838, 1, 1, 1, 1, 1,
-0.4890923, 1.976105, -1.29552, 1, 1, 1, 1, 1,
-0.4833423, 0.4626747, -3.374366, 0, 0, 1, 1, 1,
-0.4832716, -0.3083428, -0.1919444, 1, 0, 0, 1, 1,
-0.4830028, 0.6716366, -0.375309, 1, 0, 0, 1, 1,
-0.481488, -1.11426, -3.282954, 1, 0, 0, 1, 1,
-0.4740595, -1.031384, -2.418688, 1, 0, 0, 1, 1,
-0.4730051, -1.935375, -2.358898, 1, 0, 0, 1, 1,
-0.4694589, 0.89813, 0.02513016, 0, 0, 0, 1, 1,
-0.4653232, 0.2294086, -1.33868, 0, 0, 0, 1, 1,
-0.4626049, 0.4709928, 0.03431197, 0, 0, 0, 1, 1,
-0.4623348, -0.4129527, -2.297443, 0, 0, 0, 1, 1,
-0.4618031, -0.3951641, -2.476457, 0, 0, 0, 1, 1,
-0.4605397, 2.198421, -1.005807, 0, 0, 0, 1, 1,
-0.4583482, 1.039373, -0.07144736, 0, 0, 0, 1, 1,
-0.4540876, -0.8186358, -2.502007, 1, 1, 1, 1, 1,
-0.4517225, 1.26226, -0.803495, 1, 1, 1, 1, 1,
-0.4511727, 0.003449969, -2.075169, 1, 1, 1, 1, 1,
-0.4443685, 0.3327124, -2.728406, 1, 1, 1, 1, 1,
-0.4395525, -0.4791281, -3.15396, 1, 1, 1, 1, 1,
-0.4347991, 1.188562, -2.431541, 1, 1, 1, 1, 1,
-0.4330156, 0.8688499, -0.442742, 1, 1, 1, 1, 1,
-0.4302167, -0.8085952, -1.74791, 1, 1, 1, 1, 1,
-0.4284189, 2.169802, -1.782932, 1, 1, 1, 1, 1,
-0.4262144, -0.698127, -1.606745, 1, 1, 1, 1, 1,
-0.4189674, 1.218907, -0.1569139, 1, 1, 1, 1, 1,
-0.4178174, -0.8692651, -1.940345, 1, 1, 1, 1, 1,
-0.4124916, 0.3971361, -1.619372, 1, 1, 1, 1, 1,
-0.4031461, 1.212326, -1.137908, 1, 1, 1, 1, 1,
-0.4025838, -0.7684137, -2.919606, 1, 1, 1, 1, 1,
-0.3999448, -0.1847982, -2.275453, 0, 0, 1, 1, 1,
-0.3980485, 0.2323502, 0.1340661, 1, 0, 0, 1, 1,
-0.3963554, -0.1290241, -2.970394, 1, 0, 0, 1, 1,
-0.3948853, -1.53542, -6.055567, 1, 0, 0, 1, 1,
-0.3942575, 0.6910622, -1.867113, 1, 0, 0, 1, 1,
-0.3921954, -0.6716334, -3.098891, 1, 0, 0, 1, 1,
-0.3900965, -1.505959, -3.088142, 0, 0, 0, 1, 1,
-0.3879365, 0.8347775, 0.2316234, 0, 0, 0, 1, 1,
-0.3867366, -1.173741, -3.368603, 0, 0, 0, 1, 1,
-0.3842275, 0.9900119, -0.5918659, 0, 0, 0, 1, 1,
-0.3811004, -1.288594, -4.579832, 0, 0, 0, 1, 1,
-0.3810679, -0.2075918, -2.106471, 0, 0, 0, 1, 1,
-0.3809733, -0.4746324, -1.212568, 0, 0, 0, 1, 1,
-0.3805542, -0.1273079, -3.217754, 1, 1, 1, 1, 1,
-0.3715357, 1.324005, -0.1995339, 1, 1, 1, 1, 1,
-0.3593235, 0.4827613, -0.3727256, 1, 1, 1, 1, 1,
-0.3590035, 0.2683098, -1.401, 1, 1, 1, 1, 1,
-0.3586757, -0.9965305, -2.455978, 1, 1, 1, 1, 1,
-0.3583066, 0.4285075, 0.4352643, 1, 1, 1, 1, 1,
-0.3562369, 0.4210916, -0.6182865, 1, 1, 1, 1, 1,
-0.3546601, 0.305822, 0.5790441, 1, 1, 1, 1, 1,
-0.3527043, -0.09761465, -2.913561, 1, 1, 1, 1, 1,
-0.3520643, -0.3262831, -3.321307, 1, 1, 1, 1, 1,
-0.3506849, 0.3936316, -1.166361, 1, 1, 1, 1, 1,
-0.3456595, 1.206087, 0.2882243, 1, 1, 1, 1, 1,
-0.3392061, -1.263087, -2.143184, 1, 1, 1, 1, 1,
-0.3342558, 0.2057848, -1.537206, 1, 1, 1, 1, 1,
-0.3323344, 0.6401402, 0.8284894, 1, 1, 1, 1, 1,
-0.3255777, 0.8053651, 0.8947623, 0, 0, 1, 1, 1,
-0.3248084, 0.1427567, 0.4085025, 1, 0, 0, 1, 1,
-0.3241166, 0.5886524, -3.151432, 1, 0, 0, 1, 1,
-0.3229814, -0.955602, -2.51406, 1, 0, 0, 1, 1,
-0.3212974, -0.2311528, -1.970379, 1, 0, 0, 1, 1,
-0.3211109, 0.2581429, 0.5377635, 1, 0, 0, 1, 1,
-0.3137407, 0.6681349, 0.1457767, 0, 0, 0, 1, 1,
-0.312646, 0.05999262, -0.3966201, 0, 0, 0, 1, 1,
-0.3073101, 0.3259227, -2.017864, 0, 0, 0, 1, 1,
-0.3069029, 0.3726762, 0.09379022, 0, 0, 0, 1, 1,
-0.3068838, 0.5065496, -0.3220208, 0, 0, 0, 1, 1,
-0.3066679, -1.380346, -4.600498, 0, 0, 0, 1, 1,
-0.3048505, -1.371172, -2.986464, 0, 0, 0, 1, 1,
-0.3003544, -0.6352457, -3.187792, 1, 1, 1, 1, 1,
-0.2944374, 0.1223793, -1.153537, 1, 1, 1, 1, 1,
-0.2933855, -0.3453373, -3.262165, 1, 1, 1, 1, 1,
-0.2927312, -0.1773382, -2.386233, 1, 1, 1, 1, 1,
-0.2880596, 0.234144, -1.688581, 1, 1, 1, 1, 1,
-0.2807156, 1.017129, -1.117736, 1, 1, 1, 1, 1,
-0.2796128, -0.8707879, -3.051916, 1, 1, 1, 1, 1,
-0.2765616, -0.2092901, -2.872502, 1, 1, 1, 1, 1,
-0.2715904, -1.696508, -0.2905362, 1, 1, 1, 1, 1,
-0.2663434, 0.6704792, 0.467741, 1, 1, 1, 1, 1,
-0.2653023, -1.144454, -3.37468, 1, 1, 1, 1, 1,
-0.2643553, 0.6959575, 2.072695, 1, 1, 1, 1, 1,
-0.2643186, -1.063876, -2.861122, 1, 1, 1, 1, 1,
-0.2628718, 0.775815, -1.116338, 1, 1, 1, 1, 1,
-0.2615979, -0.6911911, -2.677087, 1, 1, 1, 1, 1,
-0.260663, -0.306847, -1.331025, 0, 0, 1, 1, 1,
-0.2549269, 1.015127, -0.6801732, 1, 0, 0, 1, 1,
-0.2544238, 1.250091, -1.191029, 1, 0, 0, 1, 1,
-0.2525036, -1.479204, -2.008246, 1, 0, 0, 1, 1,
-0.2522292, -0.3055668, -2.146178, 1, 0, 0, 1, 1,
-0.2515618, 1.12439, -0.7348287, 1, 0, 0, 1, 1,
-0.2460608, 0.434948, -0.1916311, 0, 0, 0, 1, 1,
-0.2460463, -0.9959355, -3.50673, 0, 0, 0, 1, 1,
-0.2459176, -0.3943728, -2.114155, 0, 0, 0, 1, 1,
-0.2416767, -0.3831698, -3.212488, 0, 0, 0, 1, 1,
-0.2408, -0.3439039, -2.127738, 0, 0, 0, 1, 1,
-0.2306554, 0.7047728, 0.5498274, 0, 0, 0, 1, 1,
-0.2302575, -1.037212, -1.172397, 0, 0, 0, 1, 1,
-0.2302066, -0.6596075, -2.378782, 1, 1, 1, 1, 1,
-0.2249116, 0.01749447, -1.723391, 1, 1, 1, 1, 1,
-0.2242448, 0.6554361, -1.124825, 1, 1, 1, 1, 1,
-0.2228729, 0.04861521, -2.51576, 1, 1, 1, 1, 1,
-0.2223108, -1.493876, -3.004636, 1, 1, 1, 1, 1,
-0.2181443, -1.570504, -2.499973, 1, 1, 1, 1, 1,
-0.2138555, -0.9702332, -2.85528, 1, 1, 1, 1, 1,
-0.2135991, 0.4752244, 0.4427159, 1, 1, 1, 1, 1,
-0.2114408, 0.09324824, -1.214073, 1, 1, 1, 1, 1,
-0.2112236, -0.6558631, -1.671293, 1, 1, 1, 1, 1,
-0.2099872, -1.706865, -3.304132, 1, 1, 1, 1, 1,
-0.2094266, 0.3658414, -0.9162818, 1, 1, 1, 1, 1,
-0.2054462, -1.819079, -2.527914, 1, 1, 1, 1, 1,
-0.1997256, 1.3584, -1.253812, 1, 1, 1, 1, 1,
-0.1976812, 0.03253149, 0.08643129, 1, 1, 1, 1, 1,
-0.197602, -1.558887, -1.626199, 0, 0, 1, 1, 1,
-0.1959408, 0.0442242, -2.019269, 1, 0, 0, 1, 1,
-0.194691, 0.5424253, -0.9716021, 1, 0, 0, 1, 1,
-0.1887854, 0.02718803, -0.8113959, 1, 0, 0, 1, 1,
-0.1874957, 0.3511909, -1.104056, 1, 0, 0, 1, 1,
-0.1866116, 0.9126281, -1.977457, 1, 0, 0, 1, 1,
-0.1862777, -0.2408735, -3.387386, 0, 0, 0, 1, 1,
-0.1766469, 1.230646, -0.4462971, 0, 0, 0, 1, 1,
-0.1766391, 0.3967303, 0.05839283, 0, 0, 0, 1, 1,
-0.17507, -0.5509557, -2.770107, 0, 0, 0, 1, 1,
-0.1742159, 0.9483573, -0.2541961, 0, 0, 0, 1, 1,
-0.1700057, -1.492198, -4.282554, 0, 0, 0, 1, 1,
-0.169344, -0.6247689, -2.346022, 0, 0, 0, 1, 1,
-0.1682206, 1.304961, -0.7574483, 1, 1, 1, 1, 1,
-0.1664422, 0.1773541, -2.585336, 1, 1, 1, 1, 1,
-0.1616345, -1.216663, -4.149566, 1, 1, 1, 1, 1,
-0.1587681, 1.081143, 0.6236957, 1, 1, 1, 1, 1,
-0.1451855, -1.406354, -3.41778, 1, 1, 1, 1, 1,
-0.1361513, -0.1493063, -0.3183899, 1, 1, 1, 1, 1,
-0.134655, 0.03171075, 0.02649749, 1, 1, 1, 1, 1,
-0.1327466, 0.03105638, -2.210507, 1, 1, 1, 1, 1,
-0.1315733, 0.4811807, 0.4128586, 1, 1, 1, 1, 1,
-0.1306869, 0.2564944, 0.6509475, 1, 1, 1, 1, 1,
-0.1298261, -0.1615523, -1.385395, 1, 1, 1, 1, 1,
-0.124359, 0.3841081, 0.408707, 1, 1, 1, 1, 1,
-0.1234849, 1.036625, 0.5099316, 1, 1, 1, 1, 1,
-0.1233827, 1.259252, 1.696197, 1, 1, 1, 1, 1,
-0.1218027, 0.6541899, -0.727081, 1, 1, 1, 1, 1,
-0.1214059, -0.1960926, -3.754336, 0, 0, 1, 1, 1,
-0.1196612, 1.571158, 1.631912, 1, 0, 0, 1, 1,
-0.1190659, 0.07135561, -0.7246812, 1, 0, 0, 1, 1,
-0.1173704, 0.2879404, -0.2522843, 1, 0, 0, 1, 1,
-0.113696, 0.4240477, -0.3286901, 1, 0, 0, 1, 1,
-0.112371, 0.4154673, -1.183204, 1, 0, 0, 1, 1,
-0.1049181, 0.5028712, 0.3856303, 0, 0, 0, 1, 1,
-0.104527, 1.598834, 1.439396, 0, 0, 0, 1, 1,
-0.1023208, -1.503587, -2.752524, 0, 0, 0, 1, 1,
-0.1013072, -0.4899949, -3.09448, 0, 0, 0, 1, 1,
-0.09824906, -0.3513244, -2.550817, 0, 0, 0, 1, 1,
-0.09372853, 0.5050614, 0.3451626, 0, 0, 0, 1, 1,
-0.09307873, -1.153096, -4.040327, 0, 0, 0, 1, 1,
-0.07699361, 0.2829546, 0.3831129, 1, 1, 1, 1, 1,
-0.07678236, 0.6123034, 1.086097, 1, 1, 1, 1, 1,
-0.07654548, -0.786427, -1.878036, 1, 1, 1, 1, 1,
-0.07556336, -0.2292095, -4.58182, 1, 1, 1, 1, 1,
-0.07494308, 0.3556152, 0.9223981, 1, 1, 1, 1, 1,
-0.07177782, 0.8444585, 0.6394814, 1, 1, 1, 1, 1,
-0.06849857, 0.1082067, 0.9553864, 1, 1, 1, 1, 1,
-0.06557681, 1.255766, -1.790927, 1, 1, 1, 1, 1,
-0.06439059, -0.120129, -1.578943, 1, 1, 1, 1, 1,
-0.06331885, 0.8967144, 1.924482, 1, 1, 1, 1, 1,
-0.06065599, 1.074517, 0.2347548, 1, 1, 1, 1, 1,
-0.05482968, 0.7301579, 0.007473964, 1, 1, 1, 1, 1,
-0.05458499, 0.046578, -0.5431696, 1, 1, 1, 1, 1,
-0.04602974, -1.019678, -1.651087, 1, 1, 1, 1, 1,
-0.043664, -0.488284, -2.272852, 1, 1, 1, 1, 1,
-0.04356713, 0.8842571, 0.1562075, 0, 0, 1, 1, 1,
-0.04053817, -0.8930804, -3.038622, 1, 0, 0, 1, 1,
-0.03670564, 1.404652, -2.710769, 1, 0, 0, 1, 1,
-0.03568374, -0.2752567, -2.608219, 1, 0, 0, 1, 1,
-0.03423607, -0.3007672, -3.865912, 1, 0, 0, 1, 1,
-0.02320541, -1.281792, -3.780241, 1, 0, 0, 1, 1,
-0.01785928, -1.785196, -3.103487, 0, 0, 0, 1, 1,
-0.01666988, 0.3492695, -1.162503, 0, 0, 0, 1, 1,
-0.01451606, 0.9589744, 0.8315356, 0, 0, 0, 1, 1,
-0.01371069, 0.9262587, -2.014821, 0, 0, 0, 1, 1,
-0.01188595, 0.1153257, 0.8648774, 0, 0, 0, 1, 1,
-0.01077876, -0.5797324, -5.266472, 0, 0, 0, 1, 1,
-0.007899074, -0.6209533, -1.675428, 0, 0, 0, 1, 1,
-0.00776409, -3.127473, -3.746974, 1, 1, 1, 1, 1,
-0.003990751, -1.187504, -2.850038, 1, 1, 1, 1, 1,
-0.002227182, 0.7312491, -0.7347974, 1, 1, 1, 1, 1,
0.0003251222, -1.042669, 4.63398, 1, 1, 1, 1, 1,
0.001009851, 0.173969, -1.147429, 1, 1, 1, 1, 1,
0.003042589, -0.6639043, 2.549996, 1, 1, 1, 1, 1,
0.005028017, 1.02341, -0.7986576, 1, 1, 1, 1, 1,
0.01018333, 0.6513041, 0.9458562, 1, 1, 1, 1, 1,
0.0118833, 1.312107, -0.4034716, 1, 1, 1, 1, 1,
0.01230317, -0.1853845, 2.736948, 1, 1, 1, 1, 1,
0.02421471, -0.2167547, 2.566229, 1, 1, 1, 1, 1,
0.03040366, -0.6569356, 3.376821, 1, 1, 1, 1, 1,
0.03226046, 0.2191248, 1.603849, 1, 1, 1, 1, 1,
0.03260734, -0.1996725, 2.428257, 1, 1, 1, 1, 1,
0.03423595, 0.1564625, 1.343095, 1, 1, 1, 1, 1,
0.03465438, 1.724865, 0.4296576, 0, 0, 1, 1, 1,
0.03502608, 1.751441, 1.614259, 1, 0, 0, 1, 1,
0.04020922, 1.12514, 0.16084, 1, 0, 0, 1, 1,
0.04303033, 0.1685479, 1.207657, 1, 0, 0, 1, 1,
0.04737704, -0.3758377, 3.994736, 1, 0, 0, 1, 1,
0.05220545, 0.6434932, 0.3530469, 1, 0, 0, 1, 1,
0.05284543, -1.020075, 3.793123, 0, 0, 0, 1, 1,
0.05328783, -0.4718871, 4.031566, 0, 0, 0, 1, 1,
0.05734567, 0.8603648, 1.063076, 0, 0, 0, 1, 1,
0.05756175, 0.9923588, 1.413687, 0, 0, 0, 1, 1,
0.05857382, -1.023049, 2.351559, 0, 0, 0, 1, 1,
0.058892, 0.5550573, -0.1750904, 0, 0, 0, 1, 1,
0.05920442, -0.2801927, 1.3897, 0, 0, 0, 1, 1,
0.06331406, -0.8305573, 3.275114, 1, 1, 1, 1, 1,
0.06569379, -0.6574914, 3.435235, 1, 1, 1, 1, 1,
0.06689405, 1.798888, -1.066283, 1, 1, 1, 1, 1,
0.06964377, -1.713496, 1.751843, 1, 1, 1, 1, 1,
0.07558732, 1.156138, -0.161262, 1, 1, 1, 1, 1,
0.07812785, 0.4297288, -0.3678439, 1, 1, 1, 1, 1,
0.07884723, -0.180283, 1.848497, 1, 1, 1, 1, 1,
0.08239608, 0.604167, 0.02582755, 1, 1, 1, 1, 1,
0.0838351, -0.7253236, 4.960426, 1, 1, 1, 1, 1,
0.08742498, -0.7244482, 2.819495, 1, 1, 1, 1, 1,
0.09009825, 1.234432, -0.3744836, 1, 1, 1, 1, 1,
0.09059562, 0.3721643, 1.715093, 1, 1, 1, 1, 1,
0.0939822, -1.438237, 5.268074, 1, 1, 1, 1, 1,
0.09688657, 1.40081, 0.5029517, 1, 1, 1, 1, 1,
0.09977897, -1.03767, 2.484491, 1, 1, 1, 1, 1,
0.1011423, 2.226791, 0.06381341, 0, 0, 1, 1, 1,
0.1020965, -0.3450801, 1.571994, 1, 0, 0, 1, 1,
0.1049873, 2.296551, -1.322483, 1, 0, 0, 1, 1,
0.1064559, 1.329988, -1.192649, 1, 0, 0, 1, 1,
0.1077098, -0.4039438, 2.982796, 1, 0, 0, 1, 1,
0.107817, -0.4422628, 1.59502, 1, 0, 0, 1, 1,
0.110252, 0.5942848, 1.030836, 0, 0, 0, 1, 1,
0.1155709, 0.4216599, -0.2011342, 0, 0, 0, 1, 1,
0.1157415, -0.9412656, 3.245437, 0, 0, 0, 1, 1,
0.1171781, 1.884012, 0.453902, 0, 0, 0, 1, 1,
0.117479, -1.04152, 3.303076, 0, 0, 0, 1, 1,
0.1194018, -0.6538357, 1.216193, 0, 0, 0, 1, 1,
0.1250659, -0.2629715, 3.695472, 0, 0, 0, 1, 1,
0.1259432, 0.5443307, 0.3251096, 1, 1, 1, 1, 1,
0.1264814, -0.730673, 4.037171, 1, 1, 1, 1, 1,
0.1277649, 0.1268958, 2.095376, 1, 1, 1, 1, 1,
0.1334053, 0.3989366, 0.783776, 1, 1, 1, 1, 1,
0.1352795, 0.3375325, -0.4018804, 1, 1, 1, 1, 1,
0.1361405, 0.1741992, 1.232031, 1, 1, 1, 1, 1,
0.1362789, 0.9608463, -0.4319211, 1, 1, 1, 1, 1,
0.1372562, 0.9600233, 0.3771439, 1, 1, 1, 1, 1,
0.1373449, -0.7354022, 3.596203, 1, 1, 1, 1, 1,
0.1408099, 0.1831878, -1.346169, 1, 1, 1, 1, 1,
0.1435586, -0.1004537, 1.405888, 1, 1, 1, 1, 1,
0.1451795, 0.9975898, -0.131463, 1, 1, 1, 1, 1,
0.1490495, 1.014689, -0.3541541, 1, 1, 1, 1, 1,
0.1491068, -0.03594925, 1.995209, 1, 1, 1, 1, 1,
0.1517911, 0.5642187, -0.9995254, 1, 1, 1, 1, 1,
0.1539564, 0.3493104, 1.001393, 0, 0, 1, 1, 1,
0.1549783, 0.1649815, 1.311758, 1, 0, 0, 1, 1,
0.156629, -0.4856511, 0.7043986, 1, 0, 0, 1, 1,
0.1582128, 0.7956836, 0.2224164, 1, 0, 0, 1, 1,
0.15924, -0.6835352, 3.486921, 1, 0, 0, 1, 1,
0.1601493, -0.004371706, 2.378913, 1, 0, 0, 1, 1,
0.1663926, -2.328645, 3.177444, 0, 0, 0, 1, 1,
0.1682593, -0.7075492, 2.121207, 0, 0, 0, 1, 1,
0.1773661, 0.2771842, 0.4023244, 0, 0, 0, 1, 1,
0.1788553, 0.5576264, 0.4408874, 0, 0, 0, 1, 1,
0.1898813, 0.6607744, -0.01601837, 0, 0, 0, 1, 1,
0.1912658, 0.9508547, -2.258487, 0, 0, 0, 1, 1,
0.1944821, 0.8085114, -0.9261609, 0, 0, 0, 1, 1,
0.1979068, -0.4529635, 2.185179, 1, 1, 1, 1, 1,
0.1988512, -1.008666, 3.192424, 1, 1, 1, 1, 1,
0.199259, 0.8744136, -0.0617313, 1, 1, 1, 1, 1,
0.2015731, -0.869335, 2.05208, 1, 1, 1, 1, 1,
0.2016945, 0.6955767, 1.586342, 1, 1, 1, 1, 1,
0.2018278, 0.7837411, 1.170879, 1, 1, 1, 1, 1,
0.2052012, 1.185787, -1.559198, 1, 1, 1, 1, 1,
0.2052436, -0.8585129, 2.562693, 1, 1, 1, 1, 1,
0.2058877, 1.751911, -0.2535044, 1, 1, 1, 1, 1,
0.2078571, -0.5164657, 4.648264, 1, 1, 1, 1, 1,
0.2094528, 1.339306, 1.567431, 1, 1, 1, 1, 1,
0.2122777, -0.2733557, 2.980188, 1, 1, 1, 1, 1,
0.2137855, 2.085882, -0.06089798, 1, 1, 1, 1, 1,
0.2161888, 0.6577219, 0.8403341, 1, 1, 1, 1, 1,
0.2193204, 0.5897052, 0.2630417, 1, 1, 1, 1, 1,
0.2196724, 0.4681218, 0.4681711, 0, 0, 1, 1, 1,
0.2198764, 0.5016778, 0.4324459, 1, 0, 0, 1, 1,
0.2229885, -1.544708, 2.58061, 1, 0, 0, 1, 1,
0.224525, 0.3594253, 0.6858772, 1, 0, 0, 1, 1,
0.2308526, -0.3553889, 1.972721, 1, 0, 0, 1, 1,
0.2308709, 0.6650453, 0.6696032, 1, 0, 0, 1, 1,
0.2376333, 1.05304, 2.210052, 0, 0, 0, 1, 1,
0.2416684, -0.2198473, 3.42104, 0, 0, 0, 1, 1,
0.2452108, 1.241429, -1.545059, 0, 0, 0, 1, 1,
0.2467549, -0.9970333, 3.869231, 0, 0, 0, 1, 1,
0.2505269, 1.751776, -1.449375, 0, 0, 0, 1, 1,
0.2506166, 0.3845565, 1.962715, 0, 0, 0, 1, 1,
0.2526268, -0.02386285, 1.530294, 0, 0, 0, 1, 1,
0.253265, -0.629618, 1.275214, 1, 1, 1, 1, 1,
0.2602089, 0.3397324, 2.63274, 1, 1, 1, 1, 1,
0.2611545, 1.957301, 0.6800436, 1, 1, 1, 1, 1,
0.2612544, 1.370438, 0.05575321, 1, 1, 1, 1, 1,
0.2616414, 0.2182896, 0.7172207, 1, 1, 1, 1, 1,
0.2626271, -0.2596863, 3.171407, 1, 1, 1, 1, 1,
0.2626491, -0.841241, 4.504839, 1, 1, 1, 1, 1,
0.2662474, 1.528119, -0.08992518, 1, 1, 1, 1, 1,
0.2779535, 2.742942, -0.2274945, 1, 1, 1, 1, 1,
0.2785986, -0.2356647, 3.040663, 1, 1, 1, 1, 1,
0.2794239, 0.6781606, -1.500607, 1, 1, 1, 1, 1,
0.284894, 0.8799836, -0.5372427, 1, 1, 1, 1, 1,
0.286688, 0.6902162, 2.308732, 1, 1, 1, 1, 1,
0.2929854, -0.5373044, 1.04583, 1, 1, 1, 1, 1,
0.293386, -0.7729738, 2.928512, 1, 1, 1, 1, 1,
0.2957317, -0.4501796, 1.674239, 0, 0, 1, 1, 1,
0.2985639, 1.255661, 1.122396, 1, 0, 0, 1, 1,
0.3084171, 0.3817097, 0.9177181, 1, 0, 0, 1, 1,
0.316989, -0.5950529, 1.960868, 1, 0, 0, 1, 1,
0.3200212, -0.7037919, 4.280416, 1, 0, 0, 1, 1,
0.3271099, 1.711158, -0.3321779, 1, 0, 0, 1, 1,
0.3314959, 0.0865801, 0.975812, 0, 0, 0, 1, 1,
0.3327105, -0.9920056, 4.87163, 0, 0, 0, 1, 1,
0.3384001, -0.06761, 1.347201, 0, 0, 0, 1, 1,
0.3464913, -0.05030712, 2.946527, 0, 0, 0, 1, 1,
0.3494172, 0.123053, 1.738557, 0, 0, 0, 1, 1,
0.351256, 0.605401, 1.766811, 0, 0, 0, 1, 1,
0.3512673, -0.02091472, 1.969644, 0, 0, 0, 1, 1,
0.3534869, -0.148953, 2.80933, 1, 1, 1, 1, 1,
0.3545772, 1.54412, 0.7903796, 1, 1, 1, 1, 1,
0.359048, 0.2596602, 2.102336, 1, 1, 1, 1, 1,
0.3627007, 0.877885, -0.3246135, 1, 1, 1, 1, 1,
0.3658186, -0.2634196, 3.989182, 1, 1, 1, 1, 1,
0.3689822, 0.05566149, -0.2444781, 1, 1, 1, 1, 1,
0.3694687, 0.1519634, -1.030902, 1, 1, 1, 1, 1,
0.3695946, 0.2143941, 0.718852, 1, 1, 1, 1, 1,
0.3699071, 0.4172643, 0.7915896, 1, 1, 1, 1, 1,
0.3713846, 0.663156, 1.576031, 1, 1, 1, 1, 1,
0.3802809, -0.8413541, 3.315371, 1, 1, 1, 1, 1,
0.3817405, -0.04681685, 2.254378, 1, 1, 1, 1, 1,
0.3826228, 0.7622876, -0.4698789, 1, 1, 1, 1, 1,
0.3834327, 0.2418138, 1.3176, 1, 1, 1, 1, 1,
0.3894697, -0.2515537, 1.452833, 1, 1, 1, 1, 1,
0.3910882, 0.424432, 0.6336446, 0, 0, 1, 1, 1,
0.3929173, -0.6204035, 2.0218, 1, 0, 0, 1, 1,
0.3977108, 0.3513235, 2.041659, 1, 0, 0, 1, 1,
0.4031551, 0.7681598, -1.558734, 1, 0, 0, 1, 1,
0.4050663, 0.5603918, 3.797271, 1, 0, 0, 1, 1,
0.4145049, 0.08218586, 0.9254517, 1, 0, 0, 1, 1,
0.4162659, -0.7010857, 1.080821, 0, 0, 0, 1, 1,
0.4185048, -0.3248743, 4.61485, 0, 0, 0, 1, 1,
0.4186354, 0.1061788, 0.6608149, 0, 0, 0, 1, 1,
0.4263995, 1.079121, -0.004110759, 0, 0, 0, 1, 1,
0.4272336, 0.1323295, -0.5634981, 0, 0, 0, 1, 1,
0.4309832, 1.933612, 0.4601821, 0, 0, 0, 1, 1,
0.4321092, 0.5190304, -0.3740912, 0, 0, 0, 1, 1,
0.4321099, -0.2220923, 2.86705, 1, 1, 1, 1, 1,
0.4350449, 2.071759, 0.09359329, 1, 1, 1, 1, 1,
0.4368482, -0.5586697, 1.258768, 1, 1, 1, 1, 1,
0.4420178, 1.660739, -0.186001, 1, 1, 1, 1, 1,
0.4430295, 0.8429194, -0.7156308, 1, 1, 1, 1, 1,
0.4442762, 1.532307, 0.3430978, 1, 1, 1, 1, 1,
0.4452186, 0.8489278, -0.3212974, 1, 1, 1, 1, 1,
0.4456175, 0.06891374, 0.7577286, 1, 1, 1, 1, 1,
0.4567856, -0.2823855, 3.089253, 1, 1, 1, 1, 1,
0.4585331, -0.1142167, 1.16051, 1, 1, 1, 1, 1,
0.4609068, 1.18934, 0.9162708, 1, 1, 1, 1, 1,
0.4620272, 0.5168394, 0.1122049, 1, 1, 1, 1, 1,
0.4626035, 0.9039915, 0.4133375, 1, 1, 1, 1, 1,
0.4646107, -1.295363, 3.570218, 1, 1, 1, 1, 1,
0.4741625, 0.3481022, 0.1508573, 1, 1, 1, 1, 1,
0.4745245, 0.9148072, 0.9355891, 0, 0, 1, 1, 1,
0.4750063, -1.048815, 0.8468078, 1, 0, 0, 1, 1,
0.4787334, -0.4515344, 1.467859, 1, 0, 0, 1, 1,
0.4799289, -0.4855269, 0.5814074, 1, 0, 0, 1, 1,
0.4808711, -2.285367, 2.740081, 1, 0, 0, 1, 1,
0.4825034, -0.2969921, 0.8296302, 1, 0, 0, 1, 1,
0.4855126, -1.160052, 1.756885, 0, 0, 0, 1, 1,
0.486177, -2.410548, 4.309932, 0, 0, 0, 1, 1,
0.4870567, 0.308995, 1.093993, 0, 0, 0, 1, 1,
0.4872599, -0.2667189, 3.70969, 0, 0, 0, 1, 1,
0.4909499, 0.4341714, -0.9719524, 0, 0, 0, 1, 1,
0.4941482, -1.027648, 2.257112, 0, 0, 0, 1, 1,
0.4951614, 0.3626558, -0.7772974, 0, 0, 0, 1, 1,
0.49917, 0.1590893, 1.59877, 1, 1, 1, 1, 1,
0.5018312, 1.174699, 0.5161915, 1, 1, 1, 1, 1,
0.5031446, -0.6296512, 1.622785, 1, 1, 1, 1, 1,
0.5092981, 0.2606171, 0.4050694, 1, 1, 1, 1, 1,
0.5128517, -0.4663094, 0.9665209, 1, 1, 1, 1, 1,
0.5129113, -0.6400883, 3.831378, 1, 1, 1, 1, 1,
0.5148259, 0.632135, 0.1128546, 1, 1, 1, 1, 1,
0.5151443, 1.63119, -0.1801433, 1, 1, 1, 1, 1,
0.5166551, 1.357905, 0.2320656, 1, 1, 1, 1, 1,
0.5189111, 1.593437, 1.198175, 1, 1, 1, 1, 1,
0.5197744, 0.510208, 1.213737, 1, 1, 1, 1, 1,
0.5274773, -2.107787, 2.027901, 1, 1, 1, 1, 1,
0.5278817, -1.291865, 2.392453, 1, 1, 1, 1, 1,
0.5280699, -0.3135091, 2.726228, 1, 1, 1, 1, 1,
0.529318, 0.03143019, 1.371303, 1, 1, 1, 1, 1,
0.5381534, 1.0466, -0.2759194, 0, 0, 1, 1, 1,
0.5382259, -1.103976, 2.117087, 1, 0, 0, 1, 1,
0.5409522, -1.681954, 3.566517, 1, 0, 0, 1, 1,
0.5429522, 0.6835425, 0.8390988, 1, 0, 0, 1, 1,
0.5456792, 1.288017, 1.390813, 1, 0, 0, 1, 1,
0.5484642, 1.146998, -0.2477116, 1, 0, 0, 1, 1,
0.5511815, 0.07952768, 2.282617, 0, 0, 0, 1, 1,
0.5577391, 0.1579077, 2.801696, 0, 0, 0, 1, 1,
0.5600797, -1.173366, 1.608707, 0, 0, 0, 1, 1,
0.560631, 1.641216, -0.4143041, 0, 0, 0, 1, 1,
0.561508, 0.01758737, 0.9733224, 0, 0, 0, 1, 1,
0.5618278, 0.5318203, 1.198258, 0, 0, 0, 1, 1,
0.5625862, -0.2241269, 2.78183, 0, 0, 0, 1, 1,
0.5679216, -0.7134458, 5.174495, 1, 1, 1, 1, 1,
0.568293, 0.1398955, 0.1848858, 1, 1, 1, 1, 1,
0.5727783, -0.7082915, 1.848057, 1, 1, 1, 1, 1,
0.5728669, 1.095856, -0.2190454, 1, 1, 1, 1, 1,
0.5750066, 0.8501776, 1.755792, 1, 1, 1, 1, 1,
0.5788785, 0.7217132, 0.8611593, 1, 1, 1, 1, 1,
0.5794098, 0.5794498, -0.9120033, 1, 1, 1, 1, 1,
0.5805022, -0.2277901, 2.026805, 1, 1, 1, 1, 1,
0.5807576, 1.948936, 0.6552051, 1, 1, 1, 1, 1,
0.5815153, 1.668728, -0.1054359, 1, 1, 1, 1, 1,
0.5827855, -0.4760663, 2.679523, 1, 1, 1, 1, 1,
0.5836729, -1.420019, 4.155228, 1, 1, 1, 1, 1,
0.5876021, 1.809325, 1.971248, 1, 1, 1, 1, 1,
0.588966, -0.429134, 4.037227, 1, 1, 1, 1, 1,
0.5935382, 1.855988, -0.3553407, 1, 1, 1, 1, 1,
0.5938062, 0.3375134, 0.6953061, 0, 0, 1, 1, 1,
0.5950134, 0.001660648, 1.76643, 1, 0, 0, 1, 1,
0.5961654, -0.9526548, 2.28976, 1, 0, 0, 1, 1,
0.5967959, -0.1015251, 0.5912904, 1, 0, 0, 1, 1,
0.5977981, 0.07287394, 1.364353, 1, 0, 0, 1, 1,
0.5991778, -0.37841, 3.248922, 1, 0, 0, 1, 1,
0.6048409, -0.04948238, 1.831423, 0, 0, 0, 1, 1,
0.6064256, 2.034215, 1.198976, 0, 0, 0, 1, 1,
0.608233, -1.43539, 5.095766, 0, 0, 0, 1, 1,
0.6113456, 0.0602839, 1.506239, 0, 0, 0, 1, 1,
0.6122754, -1.071388, 2.055084, 0, 0, 0, 1, 1,
0.6152601, 0.05542017, 3.567569, 0, 0, 0, 1, 1,
0.6163331, -0.6524494, 1.934605, 0, 0, 0, 1, 1,
0.6190104, 0.7099337, -0.2205256, 1, 1, 1, 1, 1,
0.6223668, -0.1612987, 2.977207, 1, 1, 1, 1, 1,
0.6249225, -0.6976545, 2.102809, 1, 1, 1, 1, 1,
0.6340191, -0.05629252, 2.157716, 1, 1, 1, 1, 1,
0.6351099, -0.3418035, 2.127114, 1, 1, 1, 1, 1,
0.6403208, 0.2185388, 1.893283, 1, 1, 1, 1, 1,
0.6448703, -1.462066, 3.805345, 1, 1, 1, 1, 1,
0.6501584, 0.8858845, 0.9028974, 1, 1, 1, 1, 1,
0.6506754, -0.08176684, 1.671172, 1, 1, 1, 1, 1,
0.6628534, 0.4155433, 1.960038, 1, 1, 1, 1, 1,
0.6628541, 0.220357, 1.182966, 1, 1, 1, 1, 1,
0.6677708, -1.546066, 2.201602, 1, 1, 1, 1, 1,
0.6682239, 0.2895625, -0.250847, 1, 1, 1, 1, 1,
0.6685585, 0.9075179, 0.2809472, 1, 1, 1, 1, 1,
0.6694887, 0.1720176, 0.285513, 1, 1, 1, 1, 1,
0.6754328, -3.589792, 3.195326, 0, 0, 1, 1, 1,
0.6790723, 1.197302, -0.2291145, 1, 0, 0, 1, 1,
0.6834056, -1.379925, 2.641981, 1, 0, 0, 1, 1,
0.6881132, -0.4043209, 3.953677, 1, 0, 0, 1, 1,
0.6900229, 0.689124, 1.973635, 1, 0, 0, 1, 1,
0.6983267, -0.797691, 0.9331846, 1, 0, 0, 1, 1,
0.6997657, 1.896515, 1.823241, 0, 0, 0, 1, 1,
0.7010447, -0.8205189, 2.83641, 0, 0, 0, 1, 1,
0.7112715, -0.2695868, 0.6953994, 0, 0, 0, 1, 1,
0.7120365, -0.4322289, 1.654377, 0, 0, 0, 1, 1,
0.713244, -0.2086734, 2.601002, 0, 0, 0, 1, 1,
0.7164215, -1.441804, 1.861028, 0, 0, 0, 1, 1,
0.7254339, 1.906184, 0.2841215, 0, 0, 0, 1, 1,
0.7321891, -1.875911, 0.6310324, 1, 1, 1, 1, 1,
0.7333977, 0.05166972, 2.707781, 1, 1, 1, 1, 1,
0.736106, -0.109807, 0.5938417, 1, 1, 1, 1, 1,
0.7384858, -0.9805816, -0.003810067, 1, 1, 1, 1, 1,
0.7392995, 1.161924, 1.649056, 1, 1, 1, 1, 1,
0.7474186, -1.308226, 3.578316, 1, 1, 1, 1, 1,
0.7517478, -0.3266423, 2.624542, 1, 1, 1, 1, 1,
0.7521251, 2.008562, 0.3928624, 1, 1, 1, 1, 1,
0.7528141, 0.8359138, 1.536253, 1, 1, 1, 1, 1,
0.7538158, -0.2749212, 2.104754, 1, 1, 1, 1, 1,
0.7555465, 1.425087, -0.9129715, 1, 1, 1, 1, 1,
0.7574023, -0.4636213, 2.156676, 1, 1, 1, 1, 1,
0.7575211, 0.7181533, 1.885325, 1, 1, 1, 1, 1,
0.7700826, -0.3210942, 3.026973, 1, 1, 1, 1, 1,
0.7721323, 1.087659, 0.2559778, 1, 1, 1, 1, 1,
0.7744941, 1.495154, -0.08827272, 0, 0, 1, 1, 1,
0.7754044, -0.1086033, -0.0644328, 1, 0, 0, 1, 1,
0.7758114, 0.03699302, 1.760858, 1, 0, 0, 1, 1,
0.775978, -0.7121068, 2.162918, 1, 0, 0, 1, 1,
0.7780712, 0.8626276, -0.09464414, 1, 0, 0, 1, 1,
0.7790883, 1.259906, 0.1959183, 1, 0, 0, 1, 1,
0.7809329, -0.538026, 3.046553, 0, 0, 0, 1, 1,
0.7920822, 0.5169502, 1.895719, 0, 0, 0, 1, 1,
0.7932717, -0.4298123, 2.659332, 0, 0, 0, 1, 1,
0.8008231, -0.4586397, -0.1005796, 0, 0, 0, 1, 1,
0.8048645, -0.942193, 2.748696, 0, 0, 0, 1, 1,
0.8105821, -1.516933, 2.434846, 0, 0, 0, 1, 1,
0.8105951, -0.3797921, 0.756419, 0, 0, 0, 1, 1,
0.8110382, 0.04641827, 3.648796, 1, 1, 1, 1, 1,
0.8123161, -0.1131465, 1.872279, 1, 1, 1, 1, 1,
0.8151108, -0.09782738, 1.405668, 1, 1, 1, 1, 1,
0.8186982, -0.2837828, 2.783121, 1, 1, 1, 1, 1,
0.8211175, -0.1956056, 0.2307354, 1, 1, 1, 1, 1,
0.8240442, -0.7361686, 3.482152, 1, 1, 1, 1, 1,
0.8358252, -0.006850956, 1.559093, 1, 1, 1, 1, 1,
0.8363385, -0.3764364, 1.447083, 1, 1, 1, 1, 1,
0.8486845, -0.2420668, 2.295435, 1, 1, 1, 1, 1,
0.8500395, 0.181827, 1.959689, 1, 1, 1, 1, 1,
0.8500999, -0.6540741, 1.158529, 1, 1, 1, 1, 1,
0.8513305, -0.5280939, 0.8903328, 1, 1, 1, 1, 1,
0.8548377, -1.510029, 2.257926, 1, 1, 1, 1, 1,
0.8566318, -0.0876858, 2.43724, 1, 1, 1, 1, 1,
0.8591638, -0.04869211, 1.004817, 1, 1, 1, 1, 1,
0.8615021, 2.289336, 0.5976398, 0, 0, 1, 1, 1,
0.8630252, -1.254471, 2.214403, 1, 0, 0, 1, 1,
0.867646, 0.6771222, -0.1024398, 1, 0, 0, 1, 1,
0.8716668, 0.3683475, 1.500511, 1, 0, 0, 1, 1,
0.8777034, -0.4571373, 0.8707079, 1, 0, 0, 1, 1,
0.879596, -0.6568312, 2.318246, 1, 0, 0, 1, 1,
0.8812341, 0.5904106, 1.414218, 0, 0, 0, 1, 1,
0.8872702, -1.268444, 1.167943, 0, 0, 0, 1, 1,
0.8883952, 0.7331688, 2.843331, 0, 0, 0, 1, 1,
0.8885679, 1.145786, 2.25209, 0, 0, 0, 1, 1,
0.8893819, -1.22469, 2.262694, 0, 0, 0, 1, 1,
0.8897071, 1.129035, 0.5980951, 0, 0, 0, 1, 1,
0.8932123, 1.467338, 0.3414429, 0, 0, 0, 1, 1,
0.8943665, -0.06185319, 1.079118, 1, 1, 1, 1, 1,
0.89926, 0.6212699, -0.5674765, 1, 1, 1, 1, 1,
0.8998706, 1.765797, 0.1884314, 1, 1, 1, 1, 1,
0.9020258, -0.9885816, 1.552673, 1, 1, 1, 1, 1,
0.9034836, 1.707447, -0.7560598, 1, 1, 1, 1, 1,
0.9188462, 1.317647, 0.5477003, 1, 1, 1, 1, 1,
0.9303433, -0.1731524, 2.220685, 1, 1, 1, 1, 1,
0.9326692, 0.2299862, 1.391804, 1, 1, 1, 1, 1,
0.9426162, -0.5319976, 3.370464, 1, 1, 1, 1, 1,
0.9435011, -0.01670734, 1.873981, 1, 1, 1, 1, 1,
0.9439823, -1.894562, 1.885681, 1, 1, 1, 1, 1,
0.9472763, 0.07601579, 1.747092, 1, 1, 1, 1, 1,
0.9514791, 0.8795748, 0.132953, 1, 1, 1, 1, 1,
0.9687665, -1.298163, 4.562219, 1, 1, 1, 1, 1,
0.9725005, -1.250273, 2.414557, 1, 1, 1, 1, 1,
0.9765147, 1.923083, 1.499457, 0, 0, 1, 1, 1,
0.9817616, -0.2319174, 2.678741, 1, 0, 0, 1, 1,
0.9832211, -2.579539, 1.597752, 1, 0, 0, 1, 1,
0.9935818, -2.080411, 1.370075, 1, 0, 0, 1, 1,
0.9969605, 0.02950464, 2.864892, 1, 0, 0, 1, 1,
1.009202, -0.6959438, 1.957133, 1, 0, 0, 1, 1,
1.010397, -1.2777, 4.342765, 0, 0, 0, 1, 1,
1.011167, -0.08068698, 1.673813, 0, 0, 0, 1, 1,
1.012324, -0.5912483, 2.341493, 0, 0, 0, 1, 1,
1.014733, -0.9834526, 3.209431, 0, 0, 0, 1, 1,
1.01652, -0.2722163, 0.9578391, 0, 0, 0, 1, 1,
1.024346, 1.122015, 0.4293445, 0, 0, 0, 1, 1,
1.025226, -0.7640967, 0.9352111, 0, 0, 0, 1, 1,
1.027426, -0.4879859, 1.994601, 1, 1, 1, 1, 1,
1.028564, -0.7275532, 2.305577, 1, 1, 1, 1, 1,
1.02967, -0.6232897, 0.8002881, 1, 1, 1, 1, 1,
1.037092, -1.347467, 3.748838, 1, 1, 1, 1, 1,
1.039977, 0.293722, 1.78476, 1, 1, 1, 1, 1,
1.040351, 0.08522231, -0.5289339, 1, 1, 1, 1, 1,
1.04121, -0.6651518, 2.02412, 1, 1, 1, 1, 1,
1.042838, -0.2957772, 1.292185, 1, 1, 1, 1, 1,
1.045854, -0.8815954, 2.524638, 1, 1, 1, 1, 1,
1.053934, -0.304405, 1.597844, 1, 1, 1, 1, 1,
1.054387, 0.5799066, -0.736808, 1, 1, 1, 1, 1,
1.060258, 0.486652, 2.724245, 1, 1, 1, 1, 1,
1.068501, -0.078051, 3.012192, 1, 1, 1, 1, 1,
1.069787, 0.7287564, -0.8444716, 1, 1, 1, 1, 1,
1.071741, -1.529953, 0.3109233, 1, 1, 1, 1, 1,
1.089036, -1.053318, 2.685437, 0, 0, 1, 1, 1,
1.091158, -1.255493, 2.491221, 1, 0, 0, 1, 1,
1.100465, -0.2786099, 2.712965, 1, 0, 0, 1, 1,
1.102113, 0.6893901, 1.341325, 1, 0, 0, 1, 1,
1.103583, -0.2584309, 2.807914, 1, 0, 0, 1, 1,
1.104353, 0.6512703, 2.340636, 1, 0, 0, 1, 1,
1.105284, 1.091973, 1.379087, 0, 0, 0, 1, 1,
1.111537, 0.1141543, -0.1591813, 0, 0, 0, 1, 1,
1.125478, 0.08124161, 2.320672, 0, 0, 0, 1, 1,
1.126004, 0.5315312, 2.223482, 0, 0, 0, 1, 1,
1.128786, -0.3053583, 3.17236, 0, 0, 0, 1, 1,
1.129773, 0.08489332, 0.5246559, 0, 0, 0, 1, 1,
1.134469, -1.810207, 1.693539, 0, 0, 0, 1, 1,
1.135349, 0.4587828, 1.382808, 1, 1, 1, 1, 1,
1.136826, -1.046896, 2.318654, 1, 1, 1, 1, 1,
1.146132, -0.5033404, 2.642699, 1, 1, 1, 1, 1,
1.156152, 0.8044299, 1.491572, 1, 1, 1, 1, 1,
1.158997, -1.485986, 2.176606, 1, 1, 1, 1, 1,
1.159961, -0.4425064, 2.479789, 1, 1, 1, 1, 1,
1.162731, 2.2657, -1.223598, 1, 1, 1, 1, 1,
1.16671, -0.9608374, 2.567536, 1, 1, 1, 1, 1,
1.168854, 0.9848984, 0.2956223, 1, 1, 1, 1, 1,
1.174664, 0.9103936, 0.5366996, 1, 1, 1, 1, 1,
1.175296, 1.755924, -1.067005, 1, 1, 1, 1, 1,
1.177295, -0.4070982, 0.9248356, 1, 1, 1, 1, 1,
1.177612, 0.75457, 1.917477, 1, 1, 1, 1, 1,
1.181309, 0.4239467, 0.9500513, 1, 1, 1, 1, 1,
1.189851, 0.9493142, 0.2957275, 1, 1, 1, 1, 1,
1.208687, 0.04480248, 1.557046, 0, 0, 1, 1, 1,
1.232166, -0.09456862, 3.826917, 1, 0, 0, 1, 1,
1.23555, -0.6173477, 0.4621478, 1, 0, 0, 1, 1,
1.248363, -0.02369811, 0.8892445, 1, 0, 0, 1, 1,
1.259129, 1.587056, 0.7861938, 1, 0, 0, 1, 1,
1.259642, -0.3630728, 1.559032, 1, 0, 0, 1, 1,
1.265954, -0.08857273, 2.309751, 0, 0, 0, 1, 1,
1.275074, 0.6567456, 1.971479, 0, 0, 0, 1, 1,
1.283137, -0.435161, 3.31967, 0, 0, 0, 1, 1,
1.284084, 0.8475283, 1.133009, 0, 0, 0, 1, 1,
1.298608, -1.567888, 0.8490788, 0, 0, 0, 1, 1,
1.30348, -1.97043, 1.618755, 0, 0, 0, 1, 1,
1.306319, 0.4594869, 1.420832, 0, 0, 0, 1, 1,
1.311291, 0.9190544, 1.021326, 1, 1, 1, 1, 1,
1.311382, 0.08346919, 2.561149, 1, 1, 1, 1, 1,
1.315184, -0.4620017, 2.77683, 1, 1, 1, 1, 1,
1.315204, -0.5321575, 0.5219533, 1, 1, 1, 1, 1,
1.315446, -0.4858343, 2.311885, 1, 1, 1, 1, 1,
1.318886, 0.1404415, 0.8879097, 1, 1, 1, 1, 1,
1.322431, 8.838451e-05, 2.207853, 1, 1, 1, 1, 1,
1.336136, -0.5390641, 2.824456, 1, 1, 1, 1, 1,
1.353427, 1.499495, 1.715235, 1, 1, 1, 1, 1,
1.380092, 0.6544874, 2.413892, 1, 1, 1, 1, 1,
1.38032, -0.6540257, 2.516384, 1, 1, 1, 1, 1,
1.404225, 1.825989, -0.8160193, 1, 1, 1, 1, 1,
1.413233, -1.839755, 3.360919, 1, 1, 1, 1, 1,
1.414631, 0.5920509, 1.238367, 1, 1, 1, 1, 1,
1.430545, -0.9342904, 2.488028, 1, 1, 1, 1, 1,
1.43568, -0.9071538, 2.44266, 0, 0, 1, 1, 1,
1.44511, -0.8093982, 1.475219, 1, 0, 0, 1, 1,
1.446573, -0.01487837, 1.282892, 1, 0, 0, 1, 1,
1.448825, -2.785686, 2.66255, 1, 0, 0, 1, 1,
1.45116, -0.804059, 3.235515, 1, 0, 0, 1, 1,
1.452082, 1.335066, 1.087926, 1, 0, 0, 1, 1,
1.468403, -0.6374562, 2.533628, 0, 0, 0, 1, 1,
1.478929, -1.454963, 1.228877, 0, 0, 0, 1, 1,
1.485769, 0.3809786, -0.2167257, 0, 0, 0, 1, 1,
1.488178, -1.324648, 1.769405, 0, 0, 0, 1, 1,
1.490609, 0.7432864, 2.766706, 0, 0, 0, 1, 1,
1.500485, -2.64685, 1.989531, 0, 0, 0, 1, 1,
1.515359, -0.2190808, 2.454001, 0, 0, 0, 1, 1,
1.525466, 0.03196152, 0.5803937, 1, 1, 1, 1, 1,
1.525657, 1.834349, 1.172075, 1, 1, 1, 1, 1,
1.530614, -1.91194, 3.391264, 1, 1, 1, 1, 1,
1.540296, 0.53807, -0.1010414, 1, 1, 1, 1, 1,
1.548377, -1.533805, 2.22693, 1, 1, 1, 1, 1,
1.559867, 1.220103, 0.5907624, 1, 1, 1, 1, 1,
1.569935, -0.5343022, 1.79999, 1, 1, 1, 1, 1,
1.570059, -1.451934, 2.73732, 1, 1, 1, 1, 1,
1.582829, 0.622098, 0.3524858, 1, 1, 1, 1, 1,
1.590914, -1.026763, 1.161129, 1, 1, 1, 1, 1,
1.602017, 0.4057177, 2.613112, 1, 1, 1, 1, 1,
1.605479, 0.3007596, 0.1484972, 1, 1, 1, 1, 1,
1.61348, 0.8952966, -0.6553276, 1, 1, 1, 1, 1,
1.624718, -0.5664831, 1.332977, 1, 1, 1, 1, 1,
1.629174, 0.7610476, -0.244319, 1, 1, 1, 1, 1,
1.640409, -0.4336826, 2.125764, 0, 0, 1, 1, 1,
1.646525, -0.05636444, 1.691922, 1, 0, 0, 1, 1,
1.666951, -0.3390516, 1.33239, 1, 0, 0, 1, 1,
1.667215, 0.8596867, 0.7796411, 1, 0, 0, 1, 1,
1.680143, 0.727478, 0.8623146, 1, 0, 0, 1, 1,
1.683518, 0.7479272, 0.8976885, 1, 0, 0, 1, 1,
1.703049, -1.668641, 1.954155, 0, 0, 0, 1, 1,
1.703844, 0.6399865, 2.651777, 0, 0, 0, 1, 1,
1.715014, 1.0271, 0.8418569, 0, 0, 0, 1, 1,
1.746646, -0.4317738, 1.409554, 0, 0, 0, 1, 1,
1.75298, 1.073796, 1.037442, 0, 0, 0, 1, 1,
1.757712, -0.2242208, 0.8704954, 0, 0, 0, 1, 1,
1.763744, 1.394249, 0.1856222, 0, 0, 0, 1, 1,
1.768052, 0.7238382, 0.3190467, 1, 1, 1, 1, 1,
1.804301, -0.1159342, 1.563913, 1, 1, 1, 1, 1,
1.835851, -0.3602903, 1.74347, 1, 1, 1, 1, 1,
1.857908, 0.7416125, 2.110895, 1, 1, 1, 1, 1,
1.873375, -1.594001, 2.98953, 1, 1, 1, 1, 1,
1.894233, 0.1224868, 1.422804, 1, 1, 1, 1, 1,
1.897707, 0.5135057, 1.700884, 1, 1, 1, 1, 1,
1.898939, -0.003710066, 1.194051, 1, 1, 1, 1, 1,
1.900638, -1.030626, 2.171464, 1, 1, 1, 1, 1,
1.918382, 1.022483, 1.647428, 1, 1, 1, 1, 1,
1.924108, 0.6176183, 1.294671, 1, 1, 1, 1, 1,
1.929715, 3.123081, -0.350123, 1, 1, 1, 1, 1,
1.942811, 1.122363, 1.073913, 1, 1, 1, 1, 1,
1.957337, -0.3602158, 1.337022, 1, 1, 1, 1, 1,
1.972852, -1.002979, 1.31208, 1, 1, 1, 1, 1,
2.005556, -1.403372, 0.5193371, 0, 0, 1, 1, 1,
2.048076, 1.031698, 0.8209183, 1, 0, 0, 1, 1,
2.052567, 0.3432927, 2.570403, 1, 0, 0, 1, 1,
2.064505, -1.130256, 2.607713, 1, 0, 0, 1, 1,
2.071173, -0.9265676, 2.029372, 1, 0, 0, 1, 1,
2.089545, 0.3796625, 0.5114621, 1, 0, 0, 1, 1,
2.099002, 0.7559252, 1.494118, 0, 0, 0, 1, 1,
2.116033, 1.876298, 2.326823, 0, 0, 0, 1, 1,
2.156874, -0.7622449, 4.101752, 0, 0, 0, 1, 1,
2.157534, -0.09698121, 1.759205, 0, 0, 0, 1, 1,
2.177065, 0.5240032, 3.636071, 0, 0, 0, 1, 1,
2.194788, -0.9198576, 2.317086, 0, 0, 0, 1, 1,
2.277998, -0.4754266, 1.771381, 0, 0, 0, 1, 1,
2.300355, -1.016967, 1.727941, 1, 1, 1, 1, 1,
2.316344, 0.3428972, 1.222968, 1, 1, 1, 1, 1,
2.394227, 0.7623883, 1.081357, 1, 1, 1, 1, 1,
2.705206, 1.536691, 1.790197, 1, 1, 1, 1, 1,
2.70769, 1.645918, 1.858125, 1, 1, 1, 1, 1,
2.791823, -0.5353073, 2.351055, 1, 1, 1, 1, 1,
2.81795, -1.509134, 3.068912, 1, 1, 1, 1, 1
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
var radius = 9.867471;
var distance = 34.65907;
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
mvMatrix.translate( 0.2210237, 0.1428349, 0.3937469 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.65907);
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
