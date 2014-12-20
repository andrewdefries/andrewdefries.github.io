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
-3.416765, -0.308337, -1.729795, 1, 0, 0, 1,
-3.241303, -1.697054, -2.194965, 1, 0.007843138, 0, 1,
-2.982055, 0.06965678, -2.416891, 1, 0.01176471, 0, 1,
-2.658284, -0.6910401, -0.1265945, 1, 0.01960784, 0, 1,
-2.637866, 0.8986278, -1.337297, 1, 0.02352941, 0, 1,
-2.63697, -0.5030161, -2.615875, 1, 0.03137255, 0, 1,
-2.491471, -1.600387, -2.666633, 1, 0.03529412, 0, 1,
-2.468643, -0.8377669, -2.910193, 1, 0.04313726, 0, 1,
-2.462334, 0.6467009, 0.05912444, 1, 0.04705882, 0, 1,
-2.422155, 0.7139485, -0.08689822, 1, 0.05490196, 0, 1,
-2.396861, 0.6650997, -0.266646, 1, 0.05882353, 0, 1,
-2.347922, 1.159159, 0.06534914, 1, 0.06666667, 0, 1,
-2.335427, 0.4915485, -0.1075379, 1, 0.07058824, 0, 1,
-2.321185, 0.3877095, -0.6123878, 1, 0.07843138, 0, 1,
-2.31585, -1.195384, -2.028532, 1, 0.08235294, 0, 1,
-2.173935, 0.3810583, -1.963762, 1, 0.09019608, 0, 1,
-2.070942, -0.6776239, -3.257084, 1, 0.09411765, 0, 1,
-2.065742, -0.5570979, -0.9027832, 1, 0.1019608, 0, 1,
-2.06457, 0.7888947, 0.02023163, 1, 0.1098039, 0, 1,
-2.059099, 0.9876132, -1.902483, 1, 0.1137255, 0, 1,
-2.042827, 1.531952, -2.206189, 1, 0.1215686, 0, 1,
-2.02967, 0.1893054, -1.479857, 1, 0.1254902, 0, 1,
-2.027638, -0.3489178, -3.153273, 1, 0.1333333, 0, 1,
-2.024381, 0.26058, -2.165172, 1, 0.1372549, 0, 1,
-2.003671, 0.1828694, -1.875294, 1, 0.145098, 0, 1,
-1.999702, -0.7965638, -2.20136, 1, 0.1490196, 0, 1,
-1.984638, 0.9037665, 0.6107891, 1, 0.1568628, 0, 1,
-1.978729, -0.6002285, -0.8398104, 1, 0.1607843, 0, 1,
-1.968196, 0.523111, -2.056737, 1, 0.1686275, 0, 1,
-1.950311, 0.233068, -0.9727575, 1, 0.172549, 0, 1,
-1.950309, 0.3342547, -1.022632, 1, 0.1803922, 0, 1,
-1.925674, -0.5381439, -0.474667, 1, 0.1843137, 0, 1,
-1.923067, 1.646697, -0.6136316, 1, 0.1921569, 0, 1,
-1.889912, 0.006539268, -2.323449, 1, 0.1960784, 0, 1,
-1.885309, -0.3112919, -2.132243, 1, 0.2039216, 0, 1,
-1.841883, -0.5867839, -1.756066, 1, 0.2117647, 0, 1,
-1.834671, 0.007369824, -1.549037, 1, 0.2156863, 0, 1,
-1.808712, 0.08433791, -1.75649, 1, 0.2235294, 0, 1,
-1.802765, -1.296039, -1.521073, 1, 0.227451, 0, 1,
-1.796428, 0.3532423, -0.5741051, 1, 0.2352941, 0, 1,
-1.787496, 0.9841497, -1.048107, 1, 0.2392157, 0, 1,
-1.777221, -1.328258, -0.09496419, 1, 0.2470588, 0, 1,
-1.774438, 0.5848344, -1.624486, 1, 0.2509804, 0, 1,
-1.763692, -0.8893588, -2.692355, 1, 0.2588235, 0, 1,
-1.755227, -0.2084733, -2.089556, 1, 0.2627451, 0, 1,
-1.753673, -1.585581, -2.895782, 1, 0.2705882, 0, 1,
-1.743924, 0.8678754, -2.195491, 1, 0.2745098, 0, 1,
-1.74259, 0.2485698, -1.951873, 1, 0.282353, 0, 1,
-1.713641, -0.9424488, -0.9256812, 1, 0.2862745, 0, 1,
-1.713588, 1.278147, -1.126026, 1, 0.2941177, 0, 1,
-1.704469, -0.7216167, -3.980283, 1, 0.3019608, 0, 1,
-1.696792, 0.9435777, -0.2516176, 1, 0.3058824, 0, 1,
-1.690265, 0.3363177, -2.015009, 1, 0.3137255, 0, 1,
-1.680056, 0.9476618, 0.3214352, 1, 0.3176471, 0, 1,
-1.671059, -1.310053, -1.574846, 1, 0.3254902, 0, 1,
-1.666322, -1.51405, -0.3397273, 1, 0.3294118, 0, 1,
-1.652122, 0.530369, -1.728936, 1, 0.3372549, 0, 1,
-1.634714, 0.3333617, -0.2476358, 1, 0.3411765, 0, 1,
-1.631494, -0.1076493, -0.6779537, 1, 0.3490196, 0, 1,
-1.623426, 0.477575, -1.672089, 1, 0.3529412, 0, 1,
-1.620233, 1.851756, 0.1123475, 1, 0.3607843, 0, 1,
-1.613189, 0.9861144, -2.636956, 1, 0.3647059, 0, 1,
-1.61191, -0.08697774, -2.353307, 1, 0.372549, 0, 1,
-1.610114, -0.6908862, -1.171445, 1, 0.3764706, 0, 1,
-1.596404, -0.6887689, -1.927439, 1, 0.3843137, 0, 1,
-1.563466, -0.2795663, -1.703308, 1, 0.3882353, 0, 1,
-1.560491, -0.8424464, -1.567519, 1, 0.3960784, 0, 1,
-1.560007, -1.204186, -3.630339, 1, 0.4039216, 0, 1,
-1.551851, 0.3000772, -1.466157, 1, 0.4078431, 0, 1,
-1.548771, -0.7416865, -2.896273, 1, 0.4156863, 0, 1,
-1.543445, 0.4740286, -1.518712, 1, 0.4196078, 0, 1,
-1.521704, 1.239555, 1.044217, 1, 0.427451, 0, 1,
-1.5201, 0.1229171, -0.3586847, 1, 0.4313726, 0, 1,
-1.519257, 0.5977478, -0.5982091, 1, 0.4392157, 0, 1,
-1.516868, -0.3146473, -3.033683, 1, 0.4431373, 0, 1,
-1.509828, 0.238308, -2.195479, 1, 0.4509804, 0, 1,
-1.486389, -1.156528, -2.068823, 1, 0.454902, 0, 1,
-1.470525, 1.286248, -1.215258, 1, 0.4627451, 0, 1,
-1.469908, 1.434719, -0.4587562, 1, 0.4666667, 0, 1,
-1.468922, -0.5716264, -1.850064, 1, 0.4745098, 0, 1,
-1.466677, -0.2588757, -1.402479, 1, 0.4784314, 0, 1,
-1.464984, 2.254783, -2.564797, 1, 0.4862745, 0, 1,
-1.453116, 0.8201404, -1.233128, 1, 0.4901961, 0, 1,
-1.452829, 1.126237, -0.1575956, 1, 0.4980392, 0, 1,
-1.450187, 2.564268, 0.1357494, 1, 0.5058824, 0, 1,
-1.447798, 0.5011569, -2.726624, 1, 0.509804, 0, 1,
-1.438762, 0.8248045, -0.4985889, 1, 0.5176471, 0, 1,
-1.428517, 0.3349702, -0.3954442, 1, 0.5215687, 0, 1,
-1.420841, 1.833336, -0.1760331, 1, 0.5294118, 0, 1,
-1.413145, -0.04709198, -3.195669, 1, 0.5333334, 0, 1,
-1.4105, 0.2340981, -2.511559, 1, 0.5411765, 0, 1,
-1.402161, 0.4011095, -1.691877, 1, 0.5450981, 0, 1,
-1.396963, -0.8223933, -3.205205, 1, 0.5529412, 0, 1,
-1.391622, -0.8448901, -2.781719, 1, 0.5568628, 0, 1,
-1.390704, -1.117707, -0.827832, 1, 0.5647059, 0, 1,
-1.3893, 0.7695305, -1.867051, 1, 0.5686275, 0, 1,
-1.387568, -1.285463, -2.956752, 1, 0.5764706, 0, 1,
-1.386541, 0.6179676, -0.5509046, 1, 0.5803922, 0, 1,
-1.384188, -1.722312, -3.046453, 1, 0.5882353, 0, 1,
-1.382783, -0.2862608, -0.3584465, 1, 0.5921569, 0, 1,
-1.374177, -2.083474, -2.311983, 1, 0.6, 0, 1,
-1.371165, -2.600237, -1.58494, 1, 0.6078432, 0, 1,
-1.364614, -0.1061705, -2.947854, 1, 0.6117647, 0, 1,
-1.363776, 1.984536, -0.4877585, 1, 0.6196079, 0, 1,
-1.346951, -0.05222658, -1.837766, 1, 0.6235294, 0, 1,
-1.334022, 2.532199, 1.191323, 1, 0.6313726, 0, 1,
-1.327904, -0.06219664, -1.719469, 1, 0.6352941, 0, 1,
-1.310899, 0.390412, 0.1165754, 1, 0.6431373, 0, 1,
-1.301972, -0.677846, -0.8024406, 1, 0.6470588, 0, 1,
-1.301513, 0.3700169, -1.208596, 1, 0.654902, 0, 1,
-1.301377, 0.8580827, -1.402268, 1, 0.6588235, 0, 1,
-1.296752, 0.3833557, -2.058813, 1, 0.6666667, 0, 1,
-1.295795, 0.007034537, -0.2798336, 1, 0.6705883, 0, 1,
-1.275943, -1.635522, -1.304167, 1, 0.6784314, 0, 1,
-1.261675, 0.2895873, -0.6360239, 1, 0.682353, 0, 1,
-1.261204, -0.139571, -2.213189, 1, 0.6901961, 0, 1,
-1.258738, -1.657104, -2.191668, 1, 0.6941177, 0, 1,
-1.243084, 0.2079736, -1.828776, 1, 0.7019608, 0, 1,
-1.240338, 1.493973, -0.8815203, 1, 0.7098039, 0, 1,
-1.240297, -1.78577, -3.215514, 1, 0.7137255, 0, 1,
-1.231165, 1.170291, -0.09460536, 1, 0.7215686, 0, 1,
-1.231073, 0.8426911, -1.418132, 1, 0.7254902, 0, 1,
-1.229285, -0.7252865, -1.833255, 1, 0.7333333, 0, 1,
-1.220523, -1.04353, -0.3844089, 1, 0.7372549, 0, 1,
-1.218749, -0.9458795, -2.010041, 1, 0.7450981, 0, 1,
-1.216387, -0.2299378, -1.558596, 1, 0.7490196, 0, 1,
-1.216218, 0.05222742, -2.144175, 1, 0.7568628, 0, 1,
-1.207488, 0.3990438, -1.380885, 1, 0.7607843, 0, 1,
-1.197293, 1.041801, -0.7814648, 1, 0.7686275, 0, 1,
-1.188865, -0.3132825, -2.115993, 1, 0.772549, 0, 1,
-1.184233, 0.429904, -0.6397924, 1, 0.7803922, 0, 1,
-1.175349, -0.8006337, -0.2591005, 1, 0.7843137, 0, 1,
-1.168667, -0.2653939, -3.064636, 1, 0.7921569, 0, 1,
-1.160857, 0.1283914, -0.7736525, 1, 0.7960784, 0, 1,
-1.150104, 0.9387726, -0.9710904, 1, 0.8039216, 0, 1,
-1.148388, 0.1087858, -1.810513, 1, 0.8117647, 0, 1,
-1.146866, -1.563301, -2.694638, 1, 0.8156863, 0, 1,
-1.142934, 1.28383, -0.3030057, 1, 0.8235294, 0, 1,
-1.137483, -0.2523516, -0.6447142, 1, 0.827451, 0, 1,
-1.136903, 0.3388788, -1.082834, 1, 0.8352941, 0, 1,
-1.135075, -1.240846, -1.326731, 1, 0.8392157, 0, 1,
-1.130961, -0.01062453, -0.4458097, 1, 0.8470588, 0, 1,
-1.126995, -0.4457349, -2.663469, 1, 0.8509804, 0, 1,
-1.118653, 0.4058523, -2.890266, 1, 0.8588235, 0, 1,
-1.115139, -0.0343295, -2.385412, 1, 0.8627451, 0, 1,
-1.111382, 0.2675174, -2.771462, 1, 0.8705882, 0, 1,
-1.110275, -0.2826979, -2.194835, 1, 0.8745098, 0, 1,
-1.107114, -0.3042774, -0.7065333, 1, 0.8823529, 0, 1,
-1.100865, -1.166094, -1.37257, 1, 0.8862745, 0, 1,
-1.098764, 0.05774276, -2.692443, 1, 0.8941177, 0, 1,
-1.093933, -0.7279481, -0.6339706, 1, 0.8980392, 0, 1,
-1.093454, 1.080763, -0.3117372, 1, 0.9058824, 0, 1,
-1.088403, -0.1940263, -1.611273, 1, 0.9137255, 0, 1,
-1.084764, 0.5101798, -1.763726, 1, 0.9176471, 0, 1,
-1.079386, 0.05853217, -1.049819, 1, 0.9254902, 0, 1,
-1.075399, -0.1001314, -0.3292364, 1, 0.9294118, 0, 1,
-1.075354, -0.8368422, -1.758893, 1, 0.9372549, 0, 1,
-1.073099, -1.067578, -2.04719, 1, 0.9411765, 0, 1,
-1.069432, 0.5767474, -0.01801256, 1, 0.9490196, 0, 1,
-1.06161, -1.667335, -2.7842, 1, 0.9529412, 0, 1,
-1.059569, 0.4167391, -2.447799, 1, 0.9607843, 0, 1,
-1.05579, 0.6551803, -1.924002, 1, 0.9647059, 0, 1,
-1.051353, -1.065497, -2.935016, 1, 0.972549, 0, 1,
-1.042058, -0.2283745, 0.5294223, 1, 0.9764706, 0, 1,
-1.035869, 1.711491, -1.837563, 1, 0.9843137, 0, 1,
-1.034234, -0.04124417, 0.4338135, 1, 0.9882353, 0, 1,
-1.033142, -0.368013, -1.843301, 1, 0.9960784, 0, 1,
-1.02986, 1.15739, 0.977389, 0.9960784, 1, 0, 1,
-1.02325, 0.6008908, 0.7810436, 0.9921569, 1, 0, 1,
-1.016759, -1.163922, -1.068379, 0.9843137, 1, 0, 1,
-1.01245, -0.08298416, -1.12228, 0.9803922, 1, 0, 1,
-1.009313, 1.447641, -1.355362, 0.972549, 1, 0, 1,
-1.007789, -2.195493, -4.635015, 0.9686275, 1, 0, 1,
-1.007717, -1.278036, -1.508163, 0.9607843, 1, 0, 1,
-1.005614, 0.7542499, -0.03931879, 0.9568627, 1, 0, 1,
-1.000342, -0.3283624, -1.303868, 0.9490196, 1, 0, 1,
-0.9876763, 0.3746475, -1.980795, 0.945098, 1, 0, 1,
-0.9876689, -0.6460606, -3.431851, 0.9372549, 1, 0, 1,
-0.9868453, 0.00987224, 0.7585759, 0.9333333, 1, 0, 1,
-0.9840062, -0.5489914, -2.061285, 0.9254902, 1, 0, 1,
-0.9832891, -0.6235049, -2.053572, 0.9215686, 1, 0, 1,
-0.9816688, 1.280672, 0.3490307, 0.9137255, 1, 0, 1,
-0.9814183, -1.761066, -1.909544, 0.9098039, 1, 0, 1,
-0.9693999, -0.6829904, -3.481589, 0.9019608, 1, 0, 1,
-0.9669281, -0.2938337, -1.42911, 0.8941177, 1, 0, 1,
-0.9644955, 0.975394, -1.705138, 0.8901961, 1, 0, 1,
-0.9592425, 1.519853, -0.6326926, 0.8823529, 1, 0, 1,
-0.9525822, -0.4025997, -0.01676273, 0.8784314, 1, 0, 1,
-0.9511541, 0.6687627, -0.09837642, 0.8705882, 1, 0, 1,
-0.9466465, 1.309609, 0.9412633, 0.8666667, 1, 0, 1,
-0.9418667, -0.04455578, -2.355499, 0.8588235, 1, 0, 1,
-0.9391343, -0.9904195, -2.95903, 0.854902, 1, 0, 1,
-0.9311855, -1.455976, -3.68631, 0.8470588, 1, 0, 1,
-0.9174401, 0.7102625, -0.1927491, 0.8431373, 1, 0, 1,
-0.9111274, 0.2409124, -3.391409, 0.8352941, 1, 0, 1,
-0.9107642, 2.232399, 0.3341744, 0.8313726, 1, 0, 1,
-0.9000233, -1.103293, -2.671386, 0.8235294, 1, 0, 1,
-0.8977563, -0.705713, -1.898021, 0.8196079, 1, 0, 1,
-0.8912644, 0.8278443, 2.311926, 0.8117647, 1, 0, 1,
-0.8879187, -1.122132, -4.583014, 0.8078431, 1, 0, 1,
-0.8681172, -2.052341, -2.214285, 0.8, 1, 0, 1,
-0.8673802, -0.4975252, -1.459531, 0.7921569, 1, 0, 1,
-0.8656493, 0.760071, -1.71539, 0.7882353, 1, 0, 1,
-0.8644927, -1.958726, -2.218814, 0.7803922, 1, 0, 1,
-0.8626037, 1.261236, -1.680492, 0.7764706, 1, 0, 1,
-0.8596716, -1.167441, -3.091173, 0.7686275, 1, 0, 1,
-0.8579793, -0.9880306, -3.071092, 0.7647059, 1, 0, 1,
-0.8541709, -1.032997, -3.373263, 0.7568628, 1, 0, 1,
-0.8507636, 0.666763, -1.355418, 0.7529412, 1, 0, 1,
-0.850392, 0.3377701, -0.8758894, 0.7450981, 1, 0, 1,
-0.8463193, 1.154538, -1.590986, 0.7411765, 1, 0, 1,
-0.8434099, 1.780323, -1.616375, 0.7333333, 1, 0, 1,
-0.8409865, 0.3413836, -2.072914, 0.7294118, 1, 0, 1,
-0.8403094, -0.755413, -3.184156, 0.7215686, 1, 0, 1,
-0.8396513, -0.8277699, -2.094669, 0.7176471, 1, 0, 1,
-0.8171559, 1.388032, -0.1342355, 0.7098039, 1, 0, 1,
-0.814654, 1.51817, -0.1760663, 0.7058824, 1, 0, 1,
-0.8074736, -0.7030787, -2.352276, 0.6980392, 1, 0, 1,
-0.8040242, 0.4011477, -2.950673, 0.6901961, 1, 0, 1,
-0.7987918, -0.6367201, -0.9727538, 0.6862745, 1, 0, 1,
-0.7980941, 0.7934741, -1.883262, 0.6784314, 1, 0, 1,
-0.7969209, -0.2853587, -3.452286, 0.6745098, 1, 0, 1,
-0.7960542, 0.8854249, -1.385872, 0.6666667, 1, 0, 1,
-0.7953193, -2.148257, -2.129911, 0.6627451, 1, 0, 1,
-0.7935821, 0.1455984, -2.714102, 0.654902, 1, 0, 1,
-0.788128, -0.4198147, -2.936751, 0.6509804, 1, 0, 1,
-0.7846342, 1.575912, 0.5881006, 0.6431373, 1, 0, 1,
-0.7819335, 2.820735, -0.118697, 0.6392157, 1, 0, 1,
-0.7730212, -0.5708151, -3.063033, 0.6313726, 1, 0, 1,
-0.7711051, 0.3879479, -2.532207, 0.627451, 1, 0, 1,
-0.7671522, -1.258839, -3.823089, 0.6196079, 1, 0, 1,
-0.76704, -1.640828, -2.692684, 0.6156863, 1, 0, 1,
-0.7667257, 1.31904, -2.635747, 0.6078432, 1, 0, 1,
-0.7664893, 0.3142162, 0.4282566, 0.6039216, 1, 0, 1,
-0.7634325, -0.03873515, 1.248379, 0.5960785, 1, 0, 1,
-0.7629499, -0.05692264, -2.271591, 0.5882353, 1, 0, 1,
-0.7622278, 1.29414, -1.028288, 0.5843138, 1, 0, 1,
-0.7522825, 0.2968434, -2.725403, 0.5764706, 1, 0, 1,
-0.7483909, -2.851395, -2.173547, 0.572549, 1, 0, 1,
-0.7464644, 0.3580388, -1.695362, 0.5647059, 1, 0, 1,
-0.7436044, -0.8164373, -1.884805, 0.5607843, 1, 0, 1,
-0.7425928, -0.06383351, -1.511767, 0.5529412, 1, 0, 1,
-0.7415875, -0.1110033, -1.62467, 0.5490196, 1, 0, 1,
-0.7368274, 0.2238866, -1.273914, 0.5411765, 1, 0, 1,
-0.7300594, 0.5618398, -1.024742, 0.5372549, 1, 0, 1,
-0.726485, 0.1183287, -2.374553, 0.5294118, 1, 0, 1,
-0.724625, 0.7757695, 0.1174729, 0.5254902, 1, 0, 1,
-0.724191, 0.3806482, -1.306188, 0.5176471, 1, 0, 1,
-0.721752, -0.3699258, -2.77162, 0.5137255, 1, 0, 1,
-0.7208912, 2.758682, -1.864505, 0.5058824, 1, 0, 1,
-0.7187004, -0.2990558, -1.925393, 0.5019608, 1, 0, 1,
-0.7165085, 0.5507198, 0.369113, 0.4941176, 1, 0, 1,
-0.7148086, -1.462891, -2.136752, 0.4862745, 1, 0, 1,
-0.7103852, 1.023164, -1.424845, 0.4823529, 1, 0, 1,
-0.709676, 0.6439485, -1.057734, 0.4745098, 1, 0, 1,
-0.6931522, -1.11147, -1.565402, 0.4705882, 1, 0, 1,
-0.6903989, -1.974397, -2.219425, 0.4627451, 1, 0, 1,
-0.6869333, 1.151271, -0.7009522, 0.4588235, 1, 0, 1,
-0.6865125, -0.940412, -2.978352, 0.4509804, 1, 0, 1,
-0.6768336, -1.735716, -1.987382, 0.4470588, 1, 0, 1,
-0.6710906, 0.9299495, -0.9918955, 0.4392157, 1, 0, 1,
-0.6708462, 1.525629, -0.5655637, 0.4352941, 1, 0, 1,
-0.6699308, 1.512185, 0.9876227, 0.427451, 1, 0, 1,
-0.6641883, -0.03009879, -1.186807, 0.4235294, 1, 0, 1,
-0.6631403, 1.352862, -1.088256, 0.4156863, 1, 0, 1,
-0.6573556, 1.086615, 0.07660478, 0.4117647, 1, 0, 1,
-0.6556576, 0.1530658, -0.2592318, 0.4039216, 1, 0, 1,
-0.6486927, -0.2537378, -2.532846, 0.3960784, 1, 0, 1,
-0.6483124, -0.5984686, -1.608627, 0.3921569, 1, 0, 1,
-0.6463014, 2.576712, -0.1563942, 0.3843137, 1, 0, 1,
-0.6369193, 0.9899616, -0.556818, 0.3803922, 1, 0, 1,
-0.6350132, 0.466279, -1.595057, 0.372549, 1, 0, 1,
-0.6332291, 0.7665334, 0.3765621, 0.3686275, 1, 0, 1,
-0.6263245, 1.300393, 0.1015328, 0.3607843, 1, 0, 1,
-0.6221243, -0.6356127, -2.866091, 0.3568628, 1, 0, 1,
-0.620553, 0.09226306, -2.454256, 0.3490196, 1, 0, 1,
-0.6155175, -1.344133, -2.424154, 0.345098, 1, 0, 1,
-0.6058365, 0.8123446, -1.501899, 0.3372549, 1, 0, 1,
-0.6014474, -0.6892141, -2.600293, 0.3333333, 1, 0, 1,
-0.5979353, -0.9983345, -2.673971, 0.3254902, 1, 0, 1,
-0.5962934, 0.2441522, -1.2709, 0.3215686, 1, 0, 1,
-0.5941455, -1.482006, -2.248549, 0.3137255, 1, 0, 1,
-0.5908465, 0.2377393, -0.76806, 0.3098039, 1, 0, 1,
-0.589152, 0.5070094, 0.07948701, 0.3019608, 1, 0, 1,
-0.5778316, 1.302164, -0.7109826, 0.2941177, 1, 0, 1,
-0.577711, 0.7767767, -0.1507919, 0.2901961, 1, 0, 1,
-0.5768115, 1.031084, -0.2406279, 0.282353, 1, 0, 1,
-0.5724987, -0.3978287, -2.507448, 0.2784314, 1, 0, 1,
-0.5710875, 0.9379942, -0.06418809, 0.2705882, 1, 0, 1,
-0.5705376, -1.097315, -2.635647, 0.2666667, 1, 0, 1,
-0.5701709, -0.8062598, -3.468443, 0.2588235, 1, 0, 1,
-0.5683078, -1.126263, -2.174515, 0.254902, 1, 0, 1,
-0.5657604, -0.7237727, -1.218375, 0.2470588, 1, 0, 1,
-0.5649551, -0.9584667, -3.087591, 0.2431373, 1, 0, 1,
-0.5614954, -1.864747, -1.852865, 0.2352941, 1, 0, 1,
-0.5608123, 1.831605, -2.456577, 0.2313726, 1, 0, 1,
-0.560779, -0.5710902, -1.714838, 0.2235294, 1, 0, 1,
-0.5594327, -0.2184986, -2.365617, 0.2196078, 1, 0, 1,
-0.5538532, -2.003604, -2.114705, 0.2117647, 1, 0, 1,
-0.5520069, 0.2603144, 0.6973249, 0.2078431, 1, 0, 1,
-0.5463055, 1.708836, -0.6420376, 0.2, 1, 0, 1,
-0.5458515, 0.03480575, -2.007332, 0.1921569, 1, 0, 1,
-0.5450259, 0.9031371, -0.7839989, 0.1882353, 1, 0, 1,
-0.5446166, 0.4508985, -0.3148012, 0.1803922, 1, 0, 1,
-0.542168, 0.4354054, -1.241717, 0.1764706, 1, 0, 1,
-0.5326802, -1.118135, -2.308586, 0.1686275, 1, 0, 1,
-0.5326466, 0.8632218, -0.6007514, 0.1647059, 1, 0, 1,
-0.5319107, 1.036727, 0.7724758, 0.1568628, 1, 0, 1,
-0.5285798, 0.6864871, -1.668338, 0.1529412, 1, 0, 1,
-0.5229923, 1.08121, 0.3976712, 0.145098, 1, 0, 1,
-0.514805, 0.2076192, -0.6418294, 0.1411765, 1, 0, 1,
-0.5132138, 0.5579175, 0.57704, 0.1333333, 1, 0, 1,
-0.5105324, -1.528602, -3.391181, 0.1294118, 1, 0, 1,
-0.5086689, 1.856314, 0.6326596, 0.1215686, 1, 0, 1,
-0.5017589, -0.1981196, -2.296486, 0.1176471, 1, 0, 1,
-0.4995439, -0.6937227, -2.411025, 0.1098039, 1, 0, 1,
-0.4956225, -0.8818436, -3.924438, 0.1058824, 1, 0, 1,
-0.4934756, -1.041783, -2.911203, 0.09803922, 1, 0, 1,
-0.4928012, -0.1868743, -1.677673, 0.09019608, 1, 0, 1,
-0.492715, 0.8354352, -0.4168226, 0.08627451, 1, 0, 1,
-0.4912534, -1.700058, -3.247147, 0.07843138, 1, 0, 1,
-0.4878518, 0.2048527, -0.3332146, 0.07450981, 1, 0, 1,
-0.4845249, 0.2497328, -1.034878, 0.06666667, 1, 0, 1,
-0.4816091, -0.1944856, -1.356439, 0.0627451, 1, 0, 1,
-0.4764174, -0.3542915, -1.821028, 0.05490196, 1, 0, 1,
-0.4668117, -0.3294683, -2.001499, 0.05098039, 1, 0, 1,
-0.4654299, 0.7716721, -0.2658424, 0.04313726, 1, 0, 1,
-0.4641682, 0.72278, 1.018353, 0.03921569, 1, 0, 1,
-0.4623928, -1.267549, -2.842555, 0.03137255, 1, 0, 1,
-0.4597418, 1.638032, 0.2439236, 0.02745098, 1, 0, 1,
-0.4582393, 0.6575757, -1.362483, 0.01960784, 1, 0, 1,
-0.4568114, -1.331588, -2.147633, 0.01568628, 1, 0, 1,
-0.4522816, -0.7465859, -2.784581, 0.007843138, 1, 0, 1,
-0.4499362, -0.06468225, -2.8391, 0.003921569, 1, 0, 1,
-0.4487669, 0.1793026, -2.158247, 0, 1, 0.003921569, 1,
-0.4456989, -0.3236748, -1.175509, 0, 1, 0.01176471, 1,
-0.4438765, 0.5630362, -1.238178, 0, 1, 0.01568628, 1,
-0.4401096, 0.3481921, -1.21688, 0, 1, 0.02352941, 1,
-0.4395815, 1.084373, 0.6355056, 0, 1, 0.02745098, 1,
-0.4374718, 0.8112547, -1.161999, 0, 1, 0.03529412, 1,
-0.4332334, 1.343694, -1.889844, 0, 1, 0.03921569, 1,
-0.4318322, -0.7775651, -3.074127, 0, 1, 0.04705882, 1,
-0.4280633, -0.01084136, -1.48219, 0, 1, 0.05098039, 1,
-0.4207934, -0.2383516, -1.046329, 0, 1, 0.05882353, 1,
-0.4104065, 0.1785873, -0.5170818, 0, 1, 0.0627451, 1,
-0.40876, -0.06972809, -2.05627, 0, 1, 0.07058824, 1,
-0.4071968, 0.9361175, -1.682249, 0, 1, 0.07450981, 1,
-0.4066415, 0.2205521, -0.5703079, 0, 1, 0.08235294, 1,
-0.4064754, -0.3390095, -1.999951, 0, 1, 0.08627451, 1,
-0.3984078, -0.6109254, -3.286065, 0, 1, 0.09411765, 1,
-0.3932706, 0.4420749, -1.50547, 0, 1, 0.1019608, 1,
-0.3929428, -1.348473, -2.627419, 0, 1, 0.1058824, 1,
-0.3928391, 0.6198144, -1.896679, 0, 1, 0.1137255, 1,
-0.3926291, -0.2568889, -1.296274, 0, 1, 0.1176471, 1,
-0.3873705, 1.04268, -1.819893, 0, 1, 0.1254902, 1,
-0.3857827, 0.2897483, -1.10888, 0, 1, 0.1294118, 1,
-0.3801367, 0.1546143, -1.0748, 0, 1, 0.1372549, 1,
-0.3791516, -1.240015, -3.210462, 0, 1, 0.1411765, 1,
-0.3761339, -1.321456, -3.074827, 0, 1, 0.1490196, 1,
-0.3737622, 1.019932, -0.3593002, 0, 1, 0.1529412, 1,
-0.3736098, -0.7285652, -3.17155, 0, 1, 0.1607843, 1,
-0.3668522, 0.5349027, -1.451822, 0, 1, 0.1647059, 1,
-0.3648549, -1.27597, -1.277758, 0, 1, 0.172549, 1,
-0.3620635, -0.02041957, -2.818579, 0, 1, 0.1764706, 1,
-0.3593906, 1.002155, 0.07248419, 0, 1, 0.1843137, 1,
-0.3538781, 1.191918, -0.94692, 0, 1, 0.1882353, 1,
-0.3519574, -1.685995, -3.69231, 0, 1, 0.1960784, 1,
-0.3453502, 0.7642251, 0.08089359, 0, 1, 0.2039216, 1,
-0.3429816, -0.5824241, -2.67185, 0, 1, 0.2078431, 1,
-0.3428287, -1.24992, -3.888981, 0, 1, 0.2156863, 1,
-0.3411031, 0.5312915, -0.7177309, 0, 1, 0.2196078, 1,
-0.3387729, 1.647683, 0.127619, 0, 1, 0.227451, 1,
-0.3371323, 0.07359608, -0.5205596, 0, 1, 0.2313726, 1,
-0.3348701, 1.185613, -1.86595, 0, 1, 0.2392157, 1,
-0.3322615, -0.1193973, -2.117543, 0, 1, 0.2431373, 1,
-0.3283547, -0.7231609, -3.876252, 0, 1, 0.2509804, 1,
-0.3226448, 0.3927568, -0.6224169, 0, 1, 0.254902, 1,
-0.3171348, -1.50755, -3.187966, 0, 1, 0.2627451, 1,
-0.3121346, -1.464841, -4.055266, 0, 1, 0.2666667, 1,
-0.3099398, -0.9697384, -1.212559, 0, 1, 0.2745098, 1,
-0.3056217, -1.305642, -1.885261, 0, 1, 0.2784314, 1,
-0.3050691, 1.310454, -0.1662518, 0, 1, 0.2862745, 1,
-0.3022817, 0.5744289, -0.290543, 0, 1, 0.2901961, 1,
-0.3007947, -0.02107835, -0.02042704, 0, 1, 0.2980392, 1,
-0.2971874, 0.6721044, -0.6677165, 0, 1, 0.3058824, 1,
-0.2956243, -1.4489, -2.014195, 0, 1, 0.3098039, 1,
-0.2942398, 0.323386, -2.177707, 0, 1, 0.3176471, 1,
-0.2920611, 0.03542943, -1.344215, 0, 1, 0.3215686, 1,
-0.2913859, 0.8834266, -0.8068798, 0, 1, 0.3294118, 1,
-0.290488, -1.699678, -3.286729, 0, 1, 0.3333333, 1,
-0.2896258, 1.338306, -1.401833, 0, 1, 0.3411765, 1,
-0.283255, 0.7119538, -1.708129, 0, 1, 0.345098, 1,
-0.282936, 0.9234724, 0.2515992, 0, 1, 0.3529412, 1,
-0.2824004, 1.084865, -0.980077, 0, 1, 0.3568628, 1,
-0.2782419, 0.3796389, 0.1843924, 0, 1, 0.3647059, 1,
-0.2759373, 0.1396216, -1.66807, 0, 1, 0.3686275, 1,
-0.2738091, -0.7386017, -4.031165, 0, 1, 0.3764706, 1,
-0.2733078, -0.4578565, -2.069884, 0, 1, 0.3803922, 1,
-0.2725433, -1.254759, -1.053084, 0, 1, 0.3882353, 1,
-0.2655303, -1.615043, -2.990342, 0, 1, 0.3921569, 1,
-0.2651558, 0.4289051, -0.8137495, 0, 1, 0.4, 1,
-0.2608151, 1.570869, -1.225318, 0, 1, 0.4078431, 1,
-0.2600659, -1.38508, -3.389231, 0, 1, 0.4117647, 1,
-0.2559955, 0.314589, 0.09278017, 0, 1, 0.4196078, 1,
-0.2550992, 0.451481, 0.5859093, 0, 1, 0.4235294, 1,
-0.2535581, -1.111816, -1.41822, 0, 1, 0.4313726, 1,
-0.2503677, 1.229726, -1.530336, 0, 1, 0.4352941, 1,
-0.2491319, -2.108318, -2.414627, 0, 1, 0.4431373, 1,
-0.2484684, 2.138735, 0.8425561, 0, 1, 0.4470588, 1,
-0.248448, 0.8496481, 0.6264752, 0, 1, 0.454902, 1,
-0.2448392, 0.8176504, 0.4416797, 0, 1, 0.4588235, 1,
-0.2391459, -0.1279593, -0.9439846, 0, 1, 0.4666667, 1,
-0.2380075, 0.09031075, -0.3089065, 0, 1, 0.4705882, 1,
-0.234992, 1.877831, 2.17973, 0, 1, 0.4784314, 1,
-0.2326064, 0.5503834, -0.2754589, 0, 1, 0.4823529, 1,
-0.2323981, 0.3022438, -0.007185485, 0, 1, 0.4901961, 1,
-0.2307113, -1.118666, -3.578954, 0, 1, 0.4941176, 1,
-0.2282612, 1.617801, 0.375292, 0, 1, 0.5019608, 1,
-0.2211957, -0.01783034, -1.87366, 0, 1, 0.509804, 1,
-0.2201586, 1.642971, -1.278087, 0, 1, 0.5137255, 1,
-0.2142677, -1.519196, -0.8352441, 0, 1, 0.5215687, 1,
-0.2135456, 2.058642, 0.9402136, 0, 1, 0.5254902, 1,
-0.2118519, -0.6502843, -2.633025, 0, 1, 0.5333334, 1,
-0.2098066, -0.2692453, -1.873736, 0, 1, 0.5372549, 1,
-0.20703, 1.491029, -0.5022819, 0, 1, 0.5450981, 1,
-0.2061811, 0.4433587, -1.412533, 0, 1, 0.5490196, 1,
-0.2056734, -0.1769446, -3.01538, 0, 1, 0.5568628, 1,
-0.2026699, -0.5056384, -3.959884, 0, 1, 0.5607843, 1,
-0.1953533, 0.388955, 0.8237562, 0, 1, 0.5686275, 1,
-0.1920983, -0.7839065, -3.805256, 0, 1, 0.572549, 1,
-0.1810794, 0.8424248, 0.7627351, 0, 1, 0.5803922, 1,
-0.1804912, 0.3810626, -2.750227, 0, 1, 0.5843138, 1,
-0.1753396, 0.4134409, -1.348983, 0, 1, 0.5921569, 1,
-0.1745973, -0.7829112, -3.164814, 0, 1, 0.5960785, 1,
-0.1727197, -0.9346356, -4.803805, 0, 1, 0.6039216, 1,
-0.1719499, 0.511124, 0.04243702, 0, 1, 0.6117647, 1,
-0.1696502, 1.519104, 1.671173, 0, 1, 0.6156863, 1,
-0.168111, 1.617012, -0.9843802, 0, 1, 0.6235294, 1,
-0.1674212, -2.096212, -3.035159, 0, 1, 0.627451, 1,
-0.165893, -0.07536912, -3.906911, 0, 1, 0.6352941, 1,
-0.1648471, -0.8911475, -4.524406, 0, 1, 0.6392157, 1,
-0.1603292, -1.366495, -1.057407, 0, 1, 0.6470588, 1,
-0.155585, 1.299289, 0.0377334, 0, 1, 0.6509804, 1,
-0.1530427, -0.6409268, -2.856882, 0, 1, 0.6588235, 1,
-0.1506854, 0.1125745, -0.8229572, 0, 1, 0.6627451, 1,
-0.1473234, 0.8590719, -0.4574462, 0, 1, 0.6705883, 1,
-0.1455974, -0.08791561, -5.012712, 0, 1, 0.6745098, 1,
-0.144093, 0.6278124, 0.05417385, 0, 1, 0.682353, 1,
-0.1435838, 1.812102, 2.256317, 0, 1, 0.6862745, 1,
-0.1432839, 0.1991454, 0.5047669, 0, 1, 0.6941177, 1,
-0.1250731, -0.6697835, -3.706342, 0, 1, 0.7019608, 1,
-0.1233802, 0.3252433, -0.7422633, 0, 1, 0.7058824, 1,
-0.1233326, -0.3220082, -3.548055, 0, 1, 0.7137255, 1,
-0.1232838, 1.425419, 0.1682634, 0, 1, 0.7176471, 1,
-0.121588, 0.3565743, 0.2501523, 0, 1, 0.7254902, 1,
-0.1150663, -0.6429129, -2.515205, 0, 1, 0.7294118, 1,
-0.1142488, 0.3671836, 0.4481122, 0, 1, 0.7372549, 1,
-0.1137305, 0.02911245, -3.365649, 0, 1, 0.7411765, 1,
-0.1134514, -1.085703, -4.51665, 0, 1, 0.7490196, 1,
-0.1067543, 0.8187968, -1.241079, 0, 1, 0.7529412, 1,
-0.1062024, -1.204009, -3.410853, 0, 1, 0.7607843, 1,
-0.103195, -0.8462536, -3.950993, 0, 1, 0.7647059, 1,
-0.1017424, 0.5263243, 0.313741, 0, 1, 0.772549, 1,
-0.09154233, -0.2175472, -2.767058, 0, 1, 0.7764706, 1,
-0.09128574, 0.777864, -2.535605, 0, 1, 0.7843137, 1,
-0.08965652, 0.5348549, -1.976736, 0, 1, 0.7882353, 1,
-0.08902626, 0.4895046, 0.3185759, 0, 1, 0.7960784, 1,
-0.08221672, -0.3146737, -2.810269, 0, 1, 0.8039216, 1,
-0.07838129, 2.011852, 0.1445159, 0, 1, 0.8078431, 1,
-0.07827294, 0.1856056, -0.4759345, 0, 1, 0.8156863, 1,
-0.07718465, -0.7401889, -3.253209, 0, 1, 0.8196079, 1,
-0.07649612, 0.1278872, -0.7515283, 0, 1, 0.827451, 1,
-0.07253733, -0.3220224, -1.668138, 0, 1, 0.8313726, 1,
-0.07113205, -1.680678, -4.05464, 0, 1, 0.8392157, 1,
-0.06962706, -0.8003339, -3.867484, 0, 1, 0.8431373, 1,
-0.06954273, -1.026056, -1.812388, 0, 1, 0.8509804, 1,
-0.06614754, -0.3411069, -2.565045, 0, 1, 0.854902, 1,
-0.06611905, -0.6625047, -5.003311, 0, 1, 0.8627451, 1,
-0.0641133, -1.03521, -4.037987, 0, 1, 0.8666667, 1,
-0.06376264, 0.2269997, 0.1310297, 0, 1, 0.8745098, 1,
-0.06303795, -0.3854963, -2.194543, 0, 1, 0.8784314, 1,
-0.06151152, 0.4212793, -0.9223121, 0, 1, 0.8862745, 1,
-0.05958318, 1.028273, 1.595175, 0, 1, 0.8901961, 1,
-0.05777664, 1.231659, 0.275592, 0, 1, 0.8980392, 1,
-0.05561304, 0.4564836, -0.6885734, 0, 1, 0.9058824, 1,
-0.05435728, 0.5151983, 1.537075, 0, 1, 0.9098039, 1,
-0.05322226, -1.851907, -2.692778, 0, 1, 0.9176471, 1,
-0.05221743, -0.7409668, -2.662242, 0, 1, 0.9215686, 1,
-0.0476027, 0.9940391, 0.9640566, 0, 1, 0.9294118, 1,
-0.04594636, -0.260922, -3.967381, 0, 1, 0.9333333, 1,
-0.03973347, -0.6486489, -2.850871, 0, 1, 0.9411765, 1,
-0.03966429, 2.242296, -0.01852111, 0, 1, 0.945098, 1,
-0.03933197, 0.6646865, 0.1644621, 0, 1, 0.9529412, 1,
-0.03721423, -0.317005, -3.836354, 0, 1, 0.9568627, 1,
-0.03531323, -0.03370107, -1.480448, 0, 1, 0.9647059, 1,
-0.03433042, -0.0760916, -1.841714, 0, 1, 0.9686275, 1,
-0.03422939, 0.6680672, 1.145282, 0, 1, 0.9764706, 1,
-0.02371186, -0.8180513, -2.5389, 0, 1, 0.9803922, 1,
-0.02336142, -1.584963, -4.250754, 0, 1, 0.9882353, 1,
-0.01406505, -0.6400504, -3.651844, 0, 1, 0.9921569, 1,
-0.01320205, 1.414993, 1.170206, 0, 1, 1, 1,
-0.01021816, -0.01320336, -2.663517, 0, 0.9921569, 1, 1,
-0.009410472, 0.7544758, 1.208625, 0, 0.9882353, 1, 1,
-0.009096272, 1.452599, 0.2514931, 0, 0.9803922, 1, 1,
-0.007612908, -1.555212, -2.77853, 0, 0.9764706, 1, 1,
-0.006288655, -0.6852059, -3.160853, 0, 0.9686275, 1, 1,
-0.0032058, 0.7169368, -0.5676277, 0, 0.9647059, 1, 1,
0.003334627, -0.6908457, 1.767926, 0, 0.9568627, 1, 1,
0.00444818, -0.2668581, 4.364167, 0, 0.9529412, 1, 1,
0.005426855, -0.4324616, 3.758833, 0, 0.945098, 1, 1,
0.005546733, 1.158451, -2.171659, 0, 0.9411765, 1, 1,
0.006886865, -0.4335895, 3.723433, 0, 0.9333333, 1, 1,
0.008714454, 1.853984, -0.7661607, 0, 0.9294118, 1, 1,
0.008820932, 0.8601046, 0.1761909, 0, 0.9215686, 1, 1,
0.01194038, -0.2034306, 3.03264, 0, 0.9176471, 1, 1,
0.01341538, 0.7873237, 0.3818387, 0, 0.9098039, 1, 1,
0.01566365, -0.7478279, 2.923819, 0, 0.9058824, 1, 1,
0.01572823, -0.3370125, 1.142916, 0, 0.8980392, 1, 1,
0.01695618, -0.6468987, 2.184455, 0, 0.8901961, 1, 1,
0.01713817, 1.063296, -0.5614451, 0, 0.8862745, 1, 1,
0.02061506, 1.210161, -1.183802, 0, 0.8784314, 1, 1,
0.02061525, 1.544891, -2.99848, 0, 0.8745098, 1, 1,
0.02601886, -0.1928754, 4.003024, 0, 0.8666667, 1, 1,
0.03159117, -0.8396001, 2.1914, 0, 0.8627451, 1, 1,
0.0394885, 0.7902488, 0.7571699, 0, 0.854902, 1, 1,
0.04092281, -0.4835058, 3.85177, 0, 0.8509804, 1, 1,
0.04283508, -0.2858355, 2.553848, 0, 0.8431373, 1, 1,
0.04371589, 0.6992533, -0.1601276, 0, 0.8392157, 1, 1,
0.04632618, 1.327363, -0.4788772, 0, 0.8313726, 1, 1,
0.0498088, -0.1206647, 1.406895, 0, 0.827451, 1, 1,
0.05807914, -0.9306481, 2.699468, 0, 0.8196079, 1, 1,
0.05837976, -1.059048, 2.389127, 0, 0.8156863, 1, 1,
0.05895009, 0.4557653, 0.008516245, 0, 0.8078431, 1, 1,
0.06113366, -0.3330956, 2.626099, 0, 0.8039216, 1, 1,
0.06181593, 0.2431264, 0.5032377, 0, 0.7960784, 1, 1,
0.06353416, 0.4132196, -1.288265, 0, 0.7882353, 1, 1,
0.06456861, 0.8217329, -0.6736498, 0, 0.7843137, 1, 1,
0.06536757, -0.8443588, 2.786466, 0, 0.7764706, 1, 1,
0.07401504, -0.1889456, 5.48697, 0, 0.772549, 1, 1,
0.07889532, 0.9192311, 1.806259, 0, 0.7647059, 1, 1,
0.08035477, -0.215459, 2.299676, 0, 0.7607843, 1, 1,
0.08139507, 2.452328, 0.6608619, 0, 0.7529412, 1, 1,
0.08862132, 0.2173827, -0.9724196, 0, 0.7490196, 1, 1,
0.08936897, 0.4437799, -0.2241753, 0, 0.7411765, 1, 1,
0.09149111, 0.8215687, 1.262883, 0, 0.7372549, 1, 1,
0.09332175, -0.2740863, 2.223113, 0, 0.7294118, 1, 1,
0.09581153, -0.5426772, 2.526146, 0, 0.7254902, 1, 1,
0.09719999, -1.440008, 3.005959, 0, 0.7176471, 1, 1,
0.0978265, -1.001065, 3.531729, 0, 0.7137255, 1, 1,
0.09817056, -0.4132479, 1.666301, 0, 0.7058824, 1, 1,
0.1018772, -1.378286, 3.208242, 0, 0.6980392, 1, 1,
0.1040323, -0.03942614, 2.307874, 0, 0.6941177, 1, 1,
0.1047893, -0.5702699, 2.465697, 0, 0.6862745, 1, 1,
0.1164716, -1.333565, 2.73742, 0, 0.682353, 1, 1,
0.1229277, 0.7364781, -0.4275618, 0, 0.6745098, 1, 1,
0.1309678, 1.37374, 0.7995135, 0, 0.6705883, 1, 1,
0.1414773, -0.3385468, 4.134683, 0, 0.6627451, 1, 1,
0.1433558, -1.428915, 2.341491, 0, 0.6588235, 1, 1,
0.1442422, -1.117233, 3.141148, 0, 0.6509804, 1, 1,
0.1508231, -0.7926996, 2.221097, 0, 0.6470588, 1, 1,
0.1549052, -1.802599, 2.010561, 0, 0.6392157, 1, 1,
0.1557235, 0.08614758, 2.128717, 0, 0.6352941, 1, 1,
0.1667105, -1.184069, 3.059979, 0, 0.627451, 1, 1,
0.1675904, 1.084787, 1.308529, 0, 0.6235294, 1, 1,
0.1693639, 1.055742, -0.9228998, 0, 0.6156863, 1, 1,
0.1808297, -1.807251, 3.001151, 0, 0.6117647, 1, 1,
0.1833527, 1.169093, -0.1076157, 0, 0.6039216, 1, 1,
0.1839364, -0.9247763, 1.408513, 0, 0.5960785, 1, 1,
0.1956921, 1.34006, 0.8161455, 0, 0.5921569, 1, 1,
0.2024665, -0.5241614, 1.867084, 0, 0.5843138, 1, 1,
0.2080999, -0.2432741, 1.217942, 0, 0.5803922, 1, 1,
0.2086513, -0.7255093, 1.528486, 0, 0.572549, 1, 1,
0.2134459, 0.0003083975, 1.812949, 0, 0.5686275, 1, 1,
0.2144943, -0.7400256, 2.987381, 0, 0.5607843, 1, 1,
0.2154126, 0.3902045, 0.3255351, 0, 0.5568628, 1, 1,
0.2169357, -0.1564375, 2.95871, 0, 0.5490196, 1, 1,
0.218233, 0.07874876, 2.74048, 0, 0.5450981, 1, 1,
0.2184173, -1.289532, 2.476845, 0, 0.5372549, 1, 1,
0.2187961, 0.3649366, 1.680189, 0, 0.5333334, 1, 1,
0.2243178, -0.08040304, 2.077857, 0, 0.5254902, 1, 1,
0.2253121, -0.647571, 3.695717, 0, 0.5215687, 1, 1,
0.2340754, -0.1042924, 1.848378, 0, 0.5137255, 1, 1,
0.2353127, 1.343306, 1.124366, 0, 0.509804, 1, 1,
0.2380365, 0.4135333, 1.149191, 0, 0.5019608, 1, 1,
0.2389796, 0.7793316, 1.752697, 0, 0.4941176, 1, 1,
0.2413985, -0.02743051, 0.4664966, 0, 0.4901961, 1, 1,
0.2501324, 0.008542807, 1.422518, 0, 0.4823529, 1, 1,
0.2528141, -0.6360333, 2.382296, 0, 0.4784314, 1, 1,
0.2540696, 2.285755, -0.9666557, 0, 0.4705882, 1, 1,
0.254152, -1.004187, 3.745018, 0, 0.4666667, 1, 1,
0.2564918, -0.8791101, 2.851887, 0, 0.4588235, 1, 1,
0.2595702, 1.309947, 2.549793, 0, 0.454902, 1, 1,
0.2596059, 2.558614, 2.053173, 0, 0.4470588, 1, 1,
0.2634511, 0.5623341, 1.395347, 0, 0.4431373, 1, 1,
0.2639685, -1.372776, 1.046984, 0, 0.4352941, 1, 1,
0.2660203, 1.352523, -0.08697322, 0, 0.4313726, 1, 1,
0.2670031, 0.1682333, 2.446291, 0, 0.4235294, 1, 1,
0.2696229, -0.5251438, 3.729161, 0, 0.4196078, 1, 1,
0.274855, -0.6014706, 3.601615, 0, 0.4117647, 1, 1,
0.2756023, 0.04672823, 2.215182, 0, 0.4078431, 1, 1,
0.2798821, 0.8747961, -0.4160647, 0, 0.4, 1, 1,
0.2800148, 0.7834483, 0.4516933, 0, 0.3921569, 1, 1,
0.2912479, -1.412517, 4.8612, 0, 0.3882353, 1, 1,
0.292047, -1.131542, 3.29473, 0, 0.3803922, 1, 1,
0.2929153, -0.2891527, 2.019823, 0, 0.3764706, 1, 1,
0.2930064, 0.6775454, 1.292653, 0, 0.3686275, 1, 1,
0.3020823, 0.6714271, -1.256498, 0, 0.3647059, 1, 1,
0.3021524, 1.777081, 0.0725946, 0, 0.3568628, 1, 1,
0.3047218, 0.3861742, 0.5498284, 0, 0.3529412, 1, 1,
0.3088883, 2.260084, -0.4677603, 0, 0.345098, 1, 1,
0.310348, 2.290108, 0.4470177, 0, 0.3411765, 1, 1,
0.3193383, -0.1664326, 1.513572, 0, 0.3333333, 1, 1,
0.3231475, 0.06529512, 1.649551, 0, 0.3294118, 1, 1,
0.3233065, 0.8928666, 1.943466, 0, 0.3215686, 1, 1,
0.3242632, 0.005249512, 0.4333259, 0, 0.3176471, 1, 1,
0.3256767, 1.410919, 1.139344, 0, 0.3098039, 1, 1,
0.3307884, -2.418405, 2.383162, 0, 0.3058824, 1, 1,
0.3394428, -1.378847, 2.618989, 0, 0.2980392, 1, 1,
0.3413012, 0.05773097, 2.817426, 0, 0.2901961, 1, 1,
0.3443417, -0.7330713, 2.164421, 0, 0.2862745, 1, 1,
0.3502842, 0.007582596, -0.1909389, 0, 0.2784314, 1, 1,
0.3576035, -0.09421863, 1.053103, 0, 0.2745098, 1, 1,
0.3601952, 0.7676827, -1.209308, 0, 0.2666667, 1, 1,
0.3632119, 0.8790575, 1.661779, 0, 0.2627451, 1, 1,
0.3635857, -0.103155, 2.377457, 0, 0.254902, 1, 1,
0.3654059, -1.356434, 0.6410218, 0, 0.2509804, 1, 1,
0.3657458, 0.8923959, 1.266993, 0, 0.2431373, 1, 1,
0.3769331, -0.6809339, 3.931897, 0, 0.2392157, 1, 1,
0.3780893, 2.765632, -0.0196084, 0, 0.2313726, 1, 1,
0.378748, -1.936765, 2.239887, 0, 0.227451, 1, 1,
0.3795745, -0.7819586, 2.871146, 0, 0.2196078, 1, 1,
0.3807981, -2.170453, 1.131188, 0, 0.2156863, 1, 1,
0.3817729, 1.193748, -0.6526731, 0, 0.2078431, 1, 1,
0.3825469, 0.7489062, 1.020373, 0, 0.2039216, 1, 1,
0.3826523, 0.9570574, 0.4387837, 0, 0.1960784, 1, 1,
0.3849235, -0.2777182, 2.97983, 0, 0.1882353, 1, 1,
0.3880015, 0.537594, 0.04654548, 0, 0.1843137, 1, 1,
0.3891504, 0.5848078, -0.2140961, 0, 0.1764706, 1, 1,
0.3931849, -1.443857, 2.929342, 0, 0.172549, 1, 1,
0.3933614, -1.213507, 4.122653, 0, 0.1647059, 1, 1,
0.3951538, -0.1280978, 3.474572, 0, 0.1607843, 1, 1,
0.3968071, -0.9143872, 4.868239, 0, 0.1529412, 1, 1,
0.39849, 0.1242906, 1.189617, 0, 0.1490196, 1, 1,
0.4023991, 1.236306, 0.2030622, 0, 0.1411765, 1, 1,
0.4034566, -0.9575366, 2.179623, 0, 0.1372549, 1, 1,
0.4112229, -0.451912, 2.924584, 0, 0.1294118, 1, 1,
0.4126328, 1.021959, 1.218142, 0, 0.1254902, 1, 1,
0.4170037, -0.4200822, 2.226549, 0, 0.1176471, 1, 1,
0.4183451, 0.4913289, 1.056662, 0, 0.1137255, 1, 1,
0.4217245, -1.255649, 3.294313, 0, 0.1058824, 1, 1,
0.4228271, 0.9083256, -0.333884, 0, 0.09803922, 1, 1,
0.4243603, 0.4389786, 0.313761, 0, 0.09411765, 1, 1,
0.4280489, -0.213562, 2.318627, 0, 0.08627451, 1, 1,
0.4384419, -0.2839562, 2.594844, 0, 0.08235294, 1, 1,
0.4385784, 0.1421826, 1.641833, 0, 0.07450981, 1, 1,
0.4407772, 1.343452, -0.03390156, 0, 0.07058824, 1, 1,
0.4435003, -0.1663372, 0.6177707, 0, 0.0627451, 1, 1,
0.4457141, -0.07811439, 3.311639, 0, 0.05882353, 1, 1,
0.44947, -0.5526748, 1.660131, 0, 0.05098039, 1, 1,
0.4614908, -1.009217, 2.89439, 0, 0.04705882, 1, 1,
0.4628896, -0.8281355, 2.987424, 0, 0.03921569, 1, 1,
0.4703676, 0.6461337, 0.5459249, 0, 0.03529412, 1, 1,
0.471425, 0.05330445, -0.5649782, 0, 0.02745098, 1, 1,
0.4755464, 0.2817793, 1.989721, 0, 0.02352941, 1, 1,
0.4756805, 0.4020836, 0.1599252, 0, 0.01568628, 1, 1,
0.4764472, -1.349635, 3.003026, 0, 0.01176471, 1, 1,
0.4805557, -0.409683, 3.556432, 0, 0.003921569, 1, 1,
0.4843239, 1.655166, 0.6577287, 0.003921569, 0, 1, 1,
0.4866177, -0.3099067, 2.11938, 0.007843138, 0, 1, 1,
0.4870892, 0.2590881, 1.052602, 0.01568628, 0, 1, 1,
0.4896282, 0.4075339, 1.170621, 0.01960784, 0, 1, 1,
0.4933591, -1.089583, 2.682996, 0.02745098, 0, 1, 1,
0.493436, -1.199903, 2.859856, 0.03137255, 0, 1, 1,
0.493486, -2.28823, 2.027478, 0.03921569, 0, 1, 1,
0.496275, -0.8921496, 4.337029, 0.04313726, 0, 1, 1,
0.4971338, 0.6030528, 2.5304, 0.05098039, 0, 1, 1,
0.4978229, 0.4196571, 0.2156918, 0.05490196, 0, 1, 1,
0.5036263, -0.9743052, 1.893167, 0.0627451, 0, 1, 1,
0.5059701, 1.268447, -0.3521166, 0.06666667, 0, 1, 1,
0.511102, 0.5551111, 0.03801385, 0.07450981, 0, 1, 1,
0.5171725, 0.03443762, 0.5962972, 0.07843138, 0, 1, 1,
0.5236489, -1.561714, 2.635168, 0.08627451, 0, 1, 1,
0.5238814, 1.000427, -0.4093838, 0.09019608, 0, 1, 1,
0.5247632, 0.005678122, 0.3793324, 0.09803922, 0, 1, 1,
0.5248236, -0.009377895, 2.74781, 0.1058824, 0, 1, 1,
0.5286998, -3.406718, 3.602125, 0.1098039, 0, 1, 1,
0.5288106, 0.5950605, 2.21257, 0.1176471, 0, 1, 1,
0.5308494, 0.5312483, 0.7574263, 0.1215686, 0, 1, 1,
0.5329214, 2.059697, -0.9731928, 0.1294118, 0, 1, 1,
0.5347254, 1.179582, -0.8925912, 0.1333333, 0, 1, 1,
0.5384724, 1.349657, 0.5448174, 0.1411765, 0, 1, 1,
0.5409721, -0.318486, 3.612779, 0.145098, 0, 1, 1,
0.5417786, 0.577119, 1.429248, 0.1529412, 0, 1, 1,
0.545957, 0.0186973, 1.821976, 0.1568628, 0, 1, 1,
0.5460033, -0.5063597, 1.199458, 0.1647059, 0, 1, 1,
0.5556755, -1.792754, 4.483897, 0.1686275, 0, 1, 1,
0.5610098, -0.03802716, 1.927523, 0.1764706, 0, 1, 1,
0.5679346, 0.03951036, 0.6742533, 0.1803922, 0, 1, 1,
0.5711018, 0.4795876, 1.684459, 0.1882353, 0, 1, 1,
0.5770615, 0.4066074, 0.131742, 0.1921569, 0, 1, 1,
0.5794089, -0.352865, 2.458769, 0.2, 0, 1, 1,
0.5821791, -0.5199423, -0.0807245, 0.2078431, 0, 1, 1,
0.5844555, 0.1988033, 1.819975, 0.2117647, 0, 1, 1,
0.5872937, -0.8551942, 4.365097, 0.2196078, 0, 1, 1,
0.5919906, 1.560362, 0.2277203, 0.2235294, 0, 1, 1,
0.5933202, -0.3063586, 3.957772, 0.2313726, 0, 1, 1,
0.5975469, -1.473477, 2.561255, 0.2352941, 0, 1, 1,
0.6098261, -0.6769503, 0.3385367, 0.2431373, 0, 1, 1,
0.6101614, 1.375587, 0.5951369, 0.2470588, 0, 1, 1,
0.6148472, 0.6824601, 0.8659801, 0.254902, 0, 1, 1,
0.6182436, -0.4570749, 3.017472, 0.2588235, 0, 1, 1,
0.6302183, 1.502702, -0.5913926, 0.2666667, 0, 1, 1,
0.6314033, -0.5687879, 3.390374, 0.2705882, 0, 1, 1,
0.6314545, 0.9340326, 0.1102656, 0.2784314, 0, 1, 1,
0.6349262, 1.007388, 1.890198, 0.282353, 0, 1, 1,
0.6354892, -0.7728407, 3.044617, 0.2901961, 0, 1, 1,
0.6464081, 0.2230237, 0.4944757, 0.2941177, 0, 1, 1,
0.647187, -0.7249178, 3.85267, 0.3019608, 0, 1, 1,
0.6493301, -1.599689, 4.366972, 0.3098039, 0, 1, 1,
0.6495767, 0.1624458, 1.123324, 0.3137255, 0, 1, 1,
0.652253, 1.705032, 0.7045383, 0.3215686, 0, 1, 1,
0.6639048, 0.8697397, -0.005696347, 0.3254902, 0, 1, 1,
0.6645028, 1.333757, -0.5545609, 0.3333333, 0, 1, 1,
0.6676645, -0.2097778, 1.748438, 0.3372549, 0, 1, 1,
0.6678348, 0.1062731, 0.563436, 0.345098, 0, 1, 1,
0.6694323, 0.8086812, -0.9519334, 0.3490196, 0, 1, 1,
0.6696997, 1.023981, 0.1681506, 0.3568628, 0, 1, 1,
0.6709484, 0.7591312, -0.4773667, 0.3607843, 0, 1, 1,
0.6712577, 0.8031364, 1.469978, 0.3686275, 0, 1, 1,
0.6713573, -0.1898649, 3.108891, 0.372549, 0, 1, 1,
0.6718395, -1.829896, 3.058509, 0.3803922, 0, 1, 1,
0.6818767, 0.2947602, 1.230983, 0.3843137, 0, 1, 1,
0.6822692, -0.2610496, 0.4039188, 0.3921569, 0, 1, 1,
0.6826631, -0.7261104, 0.4870158, 0.3960784, 0, 1, 1,
0.6918492, -1.976078, 2.98909, 0.4039216, 0, 1, 1,
0.6920153, -0.4441546, 0.6717556, 0.4117647, 0, 1, 1,
0.7036535, 0.5679817, 0.4210713, 0.4156863, 0, 1, 1,
0.7053431, 1.805865, 0.731442, 0.4235294, 0, 1, 1,
0.7086878, 1.209281, 0.370981, 0.427451, 0, 1, 1,
0.7167466, -0.6476225, 2.298321, 0.4352941, 0, 1, 1,
0.7197934, -0.2735072, 1.531306, 0.4392157, 0, 1, 1,
0.7238156, 0.06430212, -0.006462294, 0.4470588, 0, 1, 1,
0.7243881, 0.9393339, 2.211614, 0.4509804, 0, 1, 1,
0.7261594, -1.793118, 2.10507, 0.4588235, 0, 1, 1,
0.7274442, -0.3932228, 2.121769, 0.4627451, 0, 1, 1,
0.7297649, 1.163723, 0.7205681, 0.4705882, 0, 1, 1,
0.7317892, -1.18293, 0.3673487, 0.4745098, 0, 1, 1,
0.7344887, -1.771695, 2.157454, 0.4823529, 0, 1, 1,
0.7365023, -0.2723341, 2.762802, 0.4862745, 0, 1, 1,
0.739522, 0.9620576, 1.644291, 0.4941176, 0, 1, 1,
0.7411656, -0.1236193, 2.857668, 0.5019608, 0, 1, 1,
0.7445315, 0.742088, 0.548734, 0.5058824, 0, 1, 1,
0.7460309, 1.384922, 1.515086, 0.5137255, 0, 1, 1,
0.7492859, -0.7754083, 2.490935, 0.5176471, 0, 1, 1,
0.749634, 0.2211872, -0.04627469, 0.5254902, 0, 1, 1,
0.7511912, 0.5829709, 2.376483, 0.5294118, 0, 1, 1,
0.7526771, -0.6735913, 2.518699, 0.5372549, 0, 1, 1,
0.7611788, 1.354867, -0.696328, 0.5411765, 0, 1, 1,
0.7614535, -0.5011257, 2.447215, 0.5490196, 0, 1, 1,
0.7624317, 0.02379294, 0.9324969, 0.5529412, 0, 1, 1,
0.7625473, -2.450282, 3.087809, 0.5607843, 0, 1, 1,
0.767767, 0.3060502, 2.517775, 0.5647059, 0, 1, 1,
0.7693076, -0.1163998, 1.230479, 0.572549, 0, 1, 1,
0.7710661, -1.517674, 2.677869, 0.5764706, 0, 1, 1,
0.7776053, 1.489942, -1.492175, 0.5843138, 0, 1, 1,
0.7786059, 0.3629573, 0.1894969, 0.5882353, 0, 1, 1,
0.7836357, -1.496011, 2.49323, 0.5960785, 0, 1, 1,
0.7858796, 0.4179878, 2.118707, 0.6039216, 0, 1, 1,
0.7888101, -1.166212, 1.523708, 0.6078432, 0, 1, 1,
0.7902201, -1.174291, 0.7570075, 0.6156863, 0, 1, 1,
0.8043723, -1.287122, 3.556919, 0.6196079, 0, 1, 1,
0.8059425, 0.2444856, 2.115628, 0.627451, 0, 1, 1,
0.8085332, 1.045828, 0.8491341, 0.6313726, 0, 1, 1,
0.8095382, 0.8374387, 0.03332197, 0.6392157, 0, 1, 1,
0.810913, -1.079327, 1.162841, 0.6431373, 0, 1, 1,
0.8159657, 1.490063, -0.166424, 0.6509804, 0, 1, 1,
0.8209864, 0.1598754, 1.439461, 0.654902, 0, 1, 1,
0.8348671, 0.005315202, 2.427351, 0.6627451, 0, 1, 1,
0.8355086, -0.06717651, 2.585731, 0.6666667, 0, 1, 1,
0.8369254, -0.5326839, 1.128672, 0.6745098, 0, 1, 1,
0.8416343, -1.632674, 2.951919, 0.6784314, 0, 1, 1,
0.8426359, 0.5955537, -0.2291659, 0.6862745, 0, 1, 1,
0.8432554, 0.5517219, 0.4989672, 0.6901961, 0, 1, 1,
0.8448552, 0.8274239, 2.0844, 0.6980392, 0, 1, 1,
0.8507479, 0.3628867, 0.9966479, 0.7058824, 0, 1, 1,
0.8518377, -1.60962, 2.464107, 0.7098039, 0, 1, 1,
0.8524035, -0.08837183, 0.824544, 0.7176471, 0, 1, 1,
0.855356, -0.6967418, -0.338271, 0.7215686, 0, 1, 1,
0.8573518, -0.03682722, 1.622902, 0.7294118, 0, 1, 1,
0.8597969, 0.8937707, 2.379251, 0.7333333, 0, 1, 1,
0.8627785, 0.2480184, 1.025828, 0.7411765, 0, 1, 1,
0.8634559, -0.5190263, 2.420289, 0.7450981, 0, 1, 1,
0.8645419, -0.3769874, 2.508355, 0.7529412, 0, 1, 1,
0.876112, 0.7250252, -1.623766, 0.7568628, 0, 1, 1,
0.8766285, 0.7466406, 0.2397753, 0.7647059, 0, 1, 1,
0.8808804, 0.2003913, 2.831227, 0.7686275, 0, 1, 1,
0.8843404, 1.304349, 1.528155, 0.7764706, 0, 1, 1,
0.8864697, -0.09535015, 3.140654, 0.7803922, 0, 1, 1,
0.8959226, -1.166986, 2.263443, 0.7882353, 0, 1, 1,
0.8970644, 0.31143, 1.880203, 0.7921569, 0, 1, 1,
0.9036133, -1.592219, 1.881952, 0.8, 0, 1, 1,
0.9038479, -0.9937857, 1.46274, 0.8078431, 0, 1, 1,
0.9044231, -0.4825331, 2.823927, 0.8117647, 0, 1, 1,
0.9050737, 1.275019, 0.8687161, 0.8196079, 0, 1, 1,
0.910771, -0.8448641, 2.554381, 0.8235294, 0, 1, 1,
0.9110138, 0.5020925, 0.9333223, 0.8313726, 0, 1, 1,
0.9110264, -0.510628, 2.082334, 0.8352941, 0, 1, 1,
0.9276354, -2.160821, 3.887335, 0.8431373, 0, 1, 1,
0.930913, 0.2688777, 0.1318078, 0.8470588, 0, 1, 1,
0.9405312, 2.01516, 0.1357358, 0.854902, 0, 1, 1,
0.9482957, -1.640407, 2.749121, 0.8588235, 0, 1, 1,
0.9490978, -1.997482, 2.29663, 0.8666667, 0, 1, 1,
0.9541547, -0.8856603, 2.885903, 0.8705882, 0, 1, 1,
0.9565499, 1.479133, 0.9213496, 0.8784314, 0, 1, 1,
0.9587364, 0.3454604, 2.391661, 0.8823529, 0, 1, 1,
0.9619183, -0.3980974, 1.522056, 0.8901961, 0, 1, 1,
0.9638793, 0.462708, -0.6288085, 0.8941177, 0, 1, 1,
0.9658628, 0.6152, 1.47243, 0.9019608, 0, 1, 1,
0.9692904, -1.3053, 1.075359, 0.9098039, 0, 1, 1,
0.972873, 1.25178, 1.474851, 0.9137255, 0, 1, 1,
0.9755333, -0.7207873, 2.27277, 0.9215686, 0, 1, 1,
0.9808825, 0.2450144, 2.985024, 0.9254902, 0, 1, 1,
0.9822407, -2.109423, 4.197615, 0.9333333, 0, 1, 1,
0.9827712, 0.5854901, -0.1429051, 0.9372549, 0, 1, 1,
0.9831007, 1.081504, -0.5365978, 0.945098, 0, 1, 1,
0.983401, -0.4417022, 1.571075, 0.9490196, 0, 1, 1,
0.9840975, 0.6122372, 1.141416, 0.9568627, 0, 1, 1,
0.9894779, 0.0588522, 0.8784156, 0.9607843, 0, 1, 1,
0.9961546, 0.8312876, 2.74605, 0.9686275, 0, 1, 1,
0.9973437, -0.9592609, 2.572572, 0.972549, 0, 1, 1,
0.997393, 0.4683357, 1.23656, 0.9803922, 0, 1, 1,
0.9988431, 0.9506127, 2.137294, 0.9843137, 0, 1, 1,
1.008419, 0.5001315, 1.833858, 0.9921569, 0, 1, 1,
1.009943, -0.03476303, 2.055363, 0.9960784, 0, 1, 1,
1.023089, 0.1150296, 1.503771, 1, 0, 0.9960784, 1,
1.024053, 0.2891087, 2.317159, 1, 0, 0.9882353, 1,
1.029645, 0.8323295, 1.760161, 1, 0, 0.9843137, 1,
1.030608, 1.219553, 1.42913, 1, 0, 0.9764706, 1,
1.036598, 1.481696, 0.7982533, 1, 0, 0.972549, 1,
1.042078, 2.109135, 0.8135771, 1, 0, 0.9647059, 1,
1.061677, 0.116797, 2.029503, 1, 0, 0.9607843, 1,
1.064934, -0.5854387, 2.981248, 1, 0, 0.9529412, 1,
1.065387, 1.638727, -0.335097, 1, 0, 0.9490196, 1,
1.067762, 0.4861598, 0.757596, 1, 0, 0.9411765, 1,
1.070765, 1.63869, -0.3699302, 1, 0, 0.9372549, 1,
1.07797, 0.1359951, 0.00390834, 1, 0, 0.9294118, 1,
1.080403, 0.791355, 1.704607, 1, 0, 0.9254902, 1,
1.080726, -2.646034, 2.050867, 1, 0, 0.9176471, 1,
1.082448, 0.7540109, -1.001705, 1, 0, 0.9137255, 1,
1.088068, -0.08890674, 0.6582296, 1, 0, 0.9058824, 1,
1.092613, 1.090904, 3.396678, 1, 0, 0.9019608, 1,
1.094508, 1.239671, 0.164015, 1, 0, 0.8941177, 1,
1.095815, 0.8942476, 0.1046424, 1, 0, 0.8862745, 1,
1.097428, 0.1502422, 0.001051099, 1, 0, 0.8823529, 1,
1.09877, 0.7702388, -0.8382785, 1, 0, 0.8745098, 1,
1.116825, -0.1947043, 0.6402001, 1, 0, 0.8705882, 1,
1.122486, -0.02580846, 1.645449, 1, 0, 0.8627451, 1,
1.123567, -1.094498, 3.119823, 1, 0, 0.8588235, 1,
1.126202, -0.3488881, 1.185292, 1, 0, 0.8509804, 1,
1.126837, -0.04955986, 1.94886, 1, 0, 0.8470588, 1,
1.128949, 0.3893685, 0.841439, 1, 0, 0.8392157, 1,
1.134737, -1.810021, 2.978421, 1, 0, 0.8352941, 1,
1.142229, 0.509716, 1.813275, 1, 0, 0.827451, 1,
1.142431, 1.393984, 0.7731196, 1, 0, 0.8235294, 1,
1.14582, 1.884814, 2.293191, 1, 0, 0.8156863, 1,
1.145963, -0.04863189, 1.636452, 1, 0, 0.8117647, 1,
1.147095, -0.1566809, 2.249831, 1, 0, 0.8039216, 1,
1.148016, 0.7246054, 0.3173151, 1, 0, 0.7960784, 1,
1.152819, 0.08344161, 2.373076, 1, 0, 0.7921569, 1,
1.15473, 0.4414204, 2.25966, 1, 0, 0.7843137, 1,
1.155671, -0.8887879, 3.880976, 1, 0, 0.7803922, 1,
1.157704, 0.005810849, 0.8920277, 1, 0, 0.772549, 1,
1.162375, 0.7342462, 0.8376901, 1, 0, 0.7686275, 1,
1.167776, 1.710378, -0.368102, 1, 0, 0.7607843, 1,
1.16956, -0.4544613, 2.855596, 1, 0, 0.7568628, 1,
1.180187, 0.1326368, 0.8663286, 1, 0, 0.7490196, 1,
1.189253, 0.6531575, 0.9583979, 1, 0, 0.7450981, 1,
1.195194, 0.5539781, 1.219564, 1, 0, 0.7372549, 1,
1.198129, 0.1702558, 2.250404, 1, 0, 0.7333333, 1,
1.199616, 0.2171099, 2.341879, 1, 0, 0.7254902, 1,
1.204647, -0.3925609, 1.465359, 1, 0, 0.7215686, 1,
1.210568, 1.870006, 0.8371288, 1, 0, 0.7137255, 1,
1.219074, -1.32907, 3.309635, 1, 0, 0.7098039, 1,
1.224964, 1.11036, 1.655354, 1, 0, 0.7019608, 1,
1.227759, 1.896155, 0.8199791, 1, 0, 0.6941177, 1,
1.234447, 0.2618338, 2.883126, 1, 0, 0.6901961, 1,
1.23665, 0.9887104, 2.3333, 1, 0, 0.682353, 1,
1.237441, 0.2834108, 1.4122, 1, 0, 0.6784314, 1,
1.240285, 0.4909486, 0.5260062, 1, 0, 0.6705883, 1,
1.253722, -0.7918436, 1.882407, 1, 0, 0.6666667, 1,
1.255992, -1.304582, 1.989177, 1, 0, 0.6588235, 1,
1.258087, 0.6818072, -0.3108597, 1, 0, 0.654902, 1,
1.261761, -0.0403697, 0.2748645, 1, 0, 0.6470588, 1,
1.270535, 0.7031088, 1.485133, 1, 0, 0.6431373, 1,
1.276853, -0.9129972, 0.6123393, 1, 0, 0.6352941, 1,
1.289389, 0.2169004, -0.3713028, 1, 0, 0.6313726, 1,
1.297105, 0.6334328, 0.8238185, 1, 0, 0.6235294, 1,
1.303494, 0.3970422, 1.418323, 1, 0, 0.6196079, 1,
1.306053, 0.4319839, 2.180492, 1, 0, 0.6117647, 1,
1.310513, -0.6450588, 1.565437, 1, 0, 0.6078432, 1,
1.311546, 0.3174853, 0.1288864, 1, 0, 0.6, 1,
1.312773, 0.5154873, 0.7469535, 1, 0, 0.5921569, 1,
1.313802, 0.7572862, 0.7514917, 1, 0, 0.5882353, 1,
1.315601, 0.1351443, 1.719337, 1, 0, 0.5803922, 1,
1.319473, -1.139826, 2.514189, 1, 0, 0.5764706, 1,
1.327179, -1.371486, 1.201385, 1, 0, 0.5686275, 1,
1.330547, -0.6505775, 2.02057, 1, 0, 0.5647059, 1,
1.332009, 0.4755313, 1.931306, 1, 0, 0.5568628, 1,
1.333652, -0.02905788, 1.688975, 1, 0, 0.5529412, 1,
1.3355, 1.161039, 1.06347, 1, 0, 0.5450981, 1,
1.343239, -1.139669, 1.768089, 1, 0, 0.5411765, 1,
1.373045, 0.2166803, 2.374962, 1, 0, 0.5333334, 1,
1.373597, 0.3657932, 0.8280811, 1, 0, 0.5294118, 1,
1.378642, -1.00383, 0.4474889, 1, 0, 0.5215687, 1,
1.37887, -1.503393, 1.783836, 1, 0, 0.5176471, 1,
1.380164, 0.3311649, 0.6494128, 1, 0, 0.509804, 1,
1.38746, 0.5347419, 2.349252, 1, 0, 0.5058824, 1,
1.393971, -0.1611885, 1.598986, 1, 0, 0.4980392, 1,
1.394702, -1.266161, 2.826236, 1, 0, 0.4901961, 1,
1.399396, -0.579625, 2.555137, 1, 0, 0.4862745, 1,
1.40784, -0.6308306, -0.8467351, 1, 0, 0.4784314, 1,
1.413652, -0.5243135, 3.194254, 1, 0, 0.4745098, 1,
1.414327, 0.8866439, -0.3783643, 1, 0, 0.4666667, 1,
1.421909, 0.8341694, 1.791174, 1, 0, 0.4627451, 1,
1.423341, -0.7313738, 2.763309, 1, 0, 0.454902, 1,
1.428511, -1.872803, 1.982813, 1, 0, 0.4509804, 1,
1.430196, 2.082938, 1.041562, 1, 0, 0.4431373, 1,
1.430805, 0.1783871, 2.004953, 1, 0, 0.4392157, 1,
1.433846, -1.31738, 0.9396349, 1, 0, 0.4313726, 1,
1.440448, 1.298841, 1.691385, 1, 0, 0.427451, 1,
1.441187, 0.3831722, 0.896648, 1, 0, 0.4196078, 1,
1.450695, -0.6227162, 1.606261, 1, 0, 0.4156863, 1,
1.450911, -0.5630072, 2.767523, 1, 0, 0.4078431, 1,
1.467301, 0.07416629, 2.731753, 1, 0, 0.4039216, 1,
1.475551, 0.5481153, 2.220141, 1, 0, 0.3960784, 1,
1.484897, 0.3694569, 3.843547, 1, 0, 0.3882353, 1,
1.48737, -0.05219768, 0.001132632, 1, 0, 0.3843137, 1,
1.489453, 0.8698255, 1.147026, 1, 0, 0.3764706, 1,
1.496853, 0.9652358, 2.105766, 1, 0, 0.372549, 1,
1.523759, -0.1923108, 2.105163, 1, 0, 0.3647059, 1,
1.524435, -0.3767277, 0.06284493, 1, 0, 0.3607843, 1,
1.537091, 1.092665, 1.98215, 1, 0, 0.3529412, 1,
1.539747, 0.5617546, 2.40647, 1, 0, 0.3490196, 1,
1.543049, -0.7019954, -0.3495109, 1, 0, 0.3411765, 1,
1.543504, -0.397359, 2.251215, 1, 0, 0.3372549, 1,
1.547298, -0.5629649, 1.397199, 1, 0, 0.3294118, 1,
1.54761, -0.4524051, 3.890996, 1, 0, 0.3254902, 1,
1.547921, 0.01051439, 1.853907, 1, 0, 0.3176471, 1,
1.565441, -0.333545, 0.3904871, 1, 0, 0.3137255, 1,
1.576964, -1.574414, 2.652715, 1, 0, 0.3058824, 1,
1.577946, 0.03843695, 2.869914, 1, 0, 0.2980392, 1,
1.595922, -0.1287846, 1.984847, 1, 0, 0.2941177, 1,
1.608997, -0.9430999, 2.742691, 1, 0, 0.2862745, 1,
1.6105, -1.329885, 3.76925, 1, 0, 0.282353, 1,
1.621083, 0.7603558, 1.311097, 1, 0, 0.2745098, 1,
1.625145, 1.264181, 1.229532, 1, 0, 0.2705882, 1,
1.630767, 1.178916, 0.3920354, 1, 0, 0.2627451, 1,
1.632735, 0.1649144, 1.137301, 1, 0, 0.2588235, 1,
1.63997, 0.06238988, 0.137343, 1, 0, 0.2509804, 1,
1.675627, 0.7548456, 2.495097, 1, 0, 0.2470588, 1,
1.699751, 0.4909949, 2.829327, 1, 0, 0.2392157, 1,
1.729815, 1.126255, 2.358133, 1, 0, 0.2352941, 1,
1.747644, -0.136475, 0.4758962, 1, 0, 0.227451, 1,
1.752289, 0.8609951, 0.8035344, 1, 0, 0.2235294, 1,
1.764505, -1.442207, 2.399662, 1, 0, 0.2156863, 1,
1.768119, 1.065429, 2.045691, 1, 0, 0.2117647, 1,
1.774537, -1.905679, 0.9349024, 1, 0, 0.2039216, 1,
1.826891, -2.490688, 3.452499, 1, 0, 0.1960784, 1,
1.842364, -0.5936567, 0.6385436, 1, 0, 0.1921569, 1,
1.86652, 1.407299, -0.5655323, 1, 0, 0.1843137, 1,
1.892254, 0.420462, 0.8859655, 1, 0, 0.1803922, 1,
1.896335, 1.177143, -0.06828801, 1, 0, 0.172549, 1,
1.896413, -0.4024772, 3.54392, 1, 0, 0.1686275, 1,
1.915706, -0.2921108, 2.900605, 1, 0, 0.1607843, 1,
1.96844, 0.7579026, 1.5253, 1, 0, 0.1568628, 1,
1.972896, 1.669636, 0.9329978, 1, 0, 0.1490196, 1,
1.987111, -0.2974897, 3.036626, 1, 0, 0.145098, 1,
2.022782, -0.3525171, 3.144555, 1, 0, 0.1372549, 1,
2.026142, -1.481673, 2.164382, 1, 0, 0.1333333, 1,
2.051945, 1.372418, -0.1143569, 1, 0, 0.1254902, 1,
2.062177, -0.5763517, 1.549185, 1, 0, 0.1215686, 1,
2.128156, 0.019622, 2.291418, 1, 0, 0.1137255, 1,
2.171633, -0.5875003, 4.042809, 1, 0, 0.1098039, 1,
2.180581, -0.1446944, 1.533821, 1, 0, 0.1019608, 1,
2.216767, -0.6844509, 0.3529652, 1, 0, 0.09411765, 1,
2.260283, -0.8141087, 1.532427, 1, 0, 0.09019608, 1,
2.280325, -0.4332129, 3.681315, 1, 0, 0.08235294, 1,
2.291503, -1.082361, 2.974185, 1, 0, 0.07843138, 1,
2.299168, 1.977672, 1.428034, 1, 0, 0.07058824, 1,
2.309029, 2.464779, 0.1086694, 1, 0, 0.06666667, 1,
2.320875, 0.8706083, 1.388655, 1, 0, 0.05882353, 1,
2.363227, 1.39211, 0.08557963, 1, 0, 0.05490196, 1,
2.380069, 0.3360123, 0.6232135, 1, 0, 0.04705882, 1,
2.478242, 0.01112825, 2.035437, 1, 0, 0.04313726, 1,
2.557144, 2.207486, -1.166708, 1, 0, 0.03529412, 1,
2.595243, -2.814835, 3.506009, 1, 0, 0.03137255, 1,
2.696082, 1.724331, 0.2444573, 1, 0, 0.02352941, 1,
2.840555, 0.3298173, -0.1082011, 1, 0, 0.01960784, 1,
3.118499, -0.8972952, 0.1397639, 1, 0, 0.01176471, 1,
3.146515, -0.9174055, 2.760808, 1, 0, 0.007843138, 1
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
-0.135125, -4.462271, -6.792408, 0, -0.5, 0.5, 0.5,
-0.135125, -4.462271, -6.792408, 1, -0.5, 0.5, 0.5,
-0.135125, -4.462271, -6.792408, 1, 1.5, 0.5, 0.5,
-0.135125, -4.462271, -6.792408, 0, 1.5, 0.5, 0.5
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
-4.529241, -0.2929915, -6.792408, 0, -0.5, 0.5, 0.5,
-4.529241, -0.2929915, -6.792408, 1, -0.5, 0.5, 0.5,
-4.529241, -0.2929915, -6.792408, 1, 1.5, 0.5, 0.5,
-4.529241, -0.2929915, -6.792408, 0, 1.5, 0.5, 0.5
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
-4.529241, -4.462271, 0.2371292, 0, -0.5, 0.5, 0.5,
-4.529241, -4.462271, 0.2371292, 1, -0.5, 0.5, 0.5,
-4.529241, -4.462271, 0.2371292, 1, 1.5, 0.5, 0.5,
-4.529241, -4.462271, 0.2371292, 0, 1.5, 0.5, 0.5
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
-3, -3.500129, -5.170207,
3, -3.500129, -5.170207,
-3, -3.500129, -5.170207,
-3, -3.660486, -5.440574,
-2, -3.500129, -5.170207,
-2, -3.660486, -5.440574,
-1, -3.500129, -5.170207,
-1, -3.660486, -5.440574,
0, -3.500129, -5.170207,
0, -3.660486, -5.440574,
1, -3.500129, -5.170207,
1, -3.660486, -5.440574,
2, -3.500129, -5.170207,
2, -3.660486, -5.440574,
3, -3.500129, -5.170207,
3, -3.660486, -5.440574
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
-3, -3.9812, -5.981308, 0, -0.5, 0.5, 0.5,
-3, -3.9812, -5.981308, 1, -0.5, 0.5, 0.5,
-3, -3.9812, -5.981308, 1, 1.5, 0.5, 0.5,
-3, -3.9812, -5.981308, 0, 1.5, 0.5, 0.5,
-2, -3.9812, -5.981308, 0, -0.5, 0.5, 0.5,
-2, -3.9812, -5.981308, 1, -0.5, 0.5, 0.5,
-2, -3.9812, -5.981308, 1, 1.5, 0.5, 0.5,
-2, -3.9812, -5.981308, 0, 1.5, 0.5, 0.5,
-1, -3.9812, -5.981308, 0, -0.5, 0.5, 0.5,
-1, -3.9812, -5.981308, 1, -0.5, 0.5, 0.5,
-1, -3.9812, -5.981308, 1, 1.5, 0.5, 0.5,
-1, -3.9812, -5.981308, 0, 1.5, 0.5, 0.5,
0, -3.9812, -5.981308, 0, -0.5, 0.5, 0.5,
0, -3.9812, -5.981308, 1, -0.5, 0.5, 0.5,
0, -3.9812, -5.981308, 1, 1.5, 0.5, 0.5,
0, -3.9812, -5.981308, 0, 1.5, 0.5, 0.5,
1, -3.9812, -5.981308, 0, -0.5, 0.5, 0.5,
1, -3.9812, -5.981308, 1, -0.5, 0.5, 0.5,
1, -3.9812, -5.981308, 1, 1.5, 0.5, 0.5,
1, -3.9812, -5.981308, 0, 1.5, 0.5, 0.5,
2, -3.9812, -5.981308, 0, -0.5, 0.5, 0.5,
2, -3.9812, -5.981308, 1, -0.5, 0.5, 0.5,
2, -3.9812, -5.981308, 1, 1.5, 0.5, 0.5,
2, -3.9812, -5.981308, 0, 1.5, 0.5, 0.5,
3, -3.9812, -5.981308, 0, -0.5, 0.5, 0.5,
3, -3.9812, -5.981308, 1, -0.5, 0.5, 0.5,
3, -3.9812, -5.981308, 1, 1.5, 0.5, 0.5,
3, -3.9812, -5.981308, 0, 1.5, 0.5, 0.5
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
-3.515214, -3, -5.170207,
-3.515214, 2, -5.170207,
-3.515214, -3, -5.170207,
-3.684218, -3, -5.440574,
-3.515214, -2, -5.170207,
-3.684218, -2, -5.440574,
-3.515214, -1, -5.170207,
-3.684218, -1, -5.440574,
-3.515214, 0, -5.170207,
-3.684218, 0, -5.440574,
-3.515214, 1, -5.170207,
-3.684218, 1, -5.440574,
-3.515214, 2, -5.170207,
-3.684218, 2, -5.440574
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
-4.022227, -3, -5.981308, 0, -0.5, 0.5, 0.5,
-4.022227, -3, -5.981308, 1, -0.5, 0.5, 0.5,
-4.022227, -3, -5.981308, 1, 1.5, 0.5, 0.5,
-4.022227, -3, -5.981308, 0, 1.5, 0.5, 0.5,
-4.022227, -2, -5.981308, 0, -0.5, 0.5, 0.5,
-4.022227, -2, -5.981308, 1, -0.5, 0.5, 0.5,
-4.022227, -2, -5.981308, 1, 1.5, 0.5, 0.5,
-4.022227, -2, -5.981308, 0, 1.5, 0.5, 0.5,
-4.022227, -1, -5.981308, 0, -0.5, 0.5, 0.5,
-4.022227, -1, -5.981308, 1, -0.5, 0.5, 0.5,
-4.022227, -1, -5.981308, 1, 1.5, 0.5, 0.5,
-4.022227, -1, -5.981308, 0, 1.5, 0.5, 0.5,
-4.022227, 0, -5.981308, 0, -0.5, 0.5, 0.5,
-4.022227, 0, -5.981308, 1, -0.5, 0.5, 0.5,
-4.022227, 0, -5.981308, 1, 1.5, 0.5, 0.5,
-4.022227, 0, -5.981308, 0, 1.5, 0.5, 0.5,
-4.022227, 1, -5.981308, 0, -0.5, 0.5, 0.5,
-4.022227, 1, -5.981308, 1, -0.5, 0.5, 0.5,
-4.022227, 1, -5.981308, 1, 1.5, 0.5, 0.5,
-4.022227, 1, -5.981308, 0, 1.5, 0.5, 0.5,
-4.022227, 2, -5.981308, 0, -0.5, 0.5, 0.5,
-4.022227, 2, -5.981308, 1, -0.5, 0.5, 0.5,
-4.022227, 2, -5.981308, 1, 1.5, 0.5, 0.5,
-4.022227, 2, -5.981308, 0, 1.5, 0.5, 0.5
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
-3.515214, -3.500129, -4,
-3.515214, -3.500129, 4,
-3.515214, -3.500129, -4,
-3.684218, -3.660486, -4,
-3.515214, -3.500129, -2,
-3.684218, -3.660486, -2,
-3.515214, -3.500129, 0,
-3.684218, -3.660486, 0,
-3.515214, -3.500129, 2,
-3.684218, -3.660486, 2,
-3.515214, -3.500129, 4,
-3.684218, -3.660486, 4
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
-4.022227, -3.9812, -4, 0, -0.5, 0.5, 0.5,
-4.022227, -3.9812, -4, 1, -0.5, 0.5, 0.5,
-4.022227, -3.9812, -4, 1, 1.5, 0.5, 0.5,
-4.022227, -3.9812, -4, 0, 1.5, 0.5, 0.5,
-4.022227, -3.9812, -2, 0, -0.5, 0.5, 0.5,
-4.022227, -3.9812, -2, 1, -0.5, 0.5, 0.5,
-4.022227, -3.9812, -2, 1, 1.5, 0.5, 0.5,
-4.022227, -3.9812, -2, 0, 1.5, 0.5, 0.5,
-4.022227, -3.9812, 0, 0, -0.5, 0.5, 0.5,
-4.022227, -3.9812, 0, 1, -0.5, 0.5, 0.5,
-4.022227, -3.9812, 0, 1, 1.5, 0.5, 0.5,
-4.022227, -3.9812, 0, 0, 1.5, 0.5, 0.5,
-4.022227, -3.9812, 2, 0, -0.5, 0.5, 0.5,
-4.022227, -3.9812, 2, 1, -0.5, 0.5, 0.5,
-4.022227, -3.9812, 2, 1, 1.5, 0.5, 0.5,
-4.022227, -3.9812, 2, 0, 1.5, 0.5, 0.5,
-4.022227, -3.9812, 4, 0, -0.5, 0.5, 0.5,
-4.022227, -3.9812, 4, 1, -0.5, 0.5, 0.5,
-4.022227, -3.9812, 4, 1, 1.5, 0.5, 0.5,
-4.022227, -3.9812, 4, 0, 1.5, 0.5, 0.5
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
-3.515214, -3.500129, -5.170207,
-3.515214, 2.914146, -5.170207,
-3.515214, -3.500129, 5.644465,
-3.515214, 2.914146, 5.644465,
-3.515214, -3.500129, -5.170207,
-3.515214, -3.500129, 5.644465,
-3.515214, 2.914146, -5.170207,
-3.515214, 2.914146, 5.644465,
-3.515214, -3.500129, -5.170207,
3.244964, -3.500129, -5.170207,
-3.515214, -3.500129, 5.644465,
3.244964, -3.500129, 5.644465,
-3.515214, 2.914146, -5.170207,
3.244964, 2.914146, -5.170207,
-3.515214, 2.914146, 5.644465,
3.244964, 2.914146, 5.644465,
3.244964, -3.500129, -5.170207,
3.244964, 2.914146, -5.170207,
3.244964, -3.500129, 5.644465,
3.244964, 2.914146, 5.644465,
3.244964, -3.500129, -5.170207,
3.244964, -3.500129, 5.644465,
3.244964, 2.914146, -5.170207,
3.244964, 2.914146, 5.644465
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
var radius = 7.62303;
var distance = 33.91572;
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
mvMatrix.translate( 0.135125, 0.2929915, -0.2371292 );
mvMatrix.scale( 1.219224, 1.284973, 0.7621284 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.91572);
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
aclonifen<-read.table("aclonifen.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-aclonifen$V2
```

```
## Error in eval(expr, envir, enclos): object 'aclonifen' not found
```

```r
y<-aclonifen$V3
```

```
## Error in eval(expr, envir, enclos): object 'aclonifen' not found
```

```r
z<-aclonifen$V4
```

```
## Error in eval(expr, envir, enclos): object 'aclonifen' not found
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
-3.416765, -0.308337, -1.729795, 0, 0, 1, 1, 1,
-3.241303, -1.697054, -2.194965, 1, 0, 0, 1, 1,
-2.982055, 0.06965678, -2.416891, 1, 0, 0, 1, 1,
-2.658284, -0.6910401, -0.1265945, 1, 0, 0, 1, 1,
-2.637866, 0.8986278, -1.337297, 1, 0, 0, 1, 1,
-2.63697, -0.5030161, -2.615875, 1, 0, 0, 1, 1,
-2.491471, -1.600387, -2.666633, 0, 0, 0, 1, 1,
-2.468643, -0.8377669, -2.910193, 0, 0, 0, 1, 1,
-2.462334, 0.6467009, 0.05912444, 0, 0, 0, 1, 1,
-2.422155, 0.7139485, -0.08689822, 0, 0, 0, 1, 1,
-2.396861, 0.6650997, -0.266646, 0, 0, 0, 1, 1,
-2.347922, 1.159159, 0.06534914, 0, 0, 0, 1, 1,
-2.335427, 0.4915485, -0.1075379, 0, 0, 0, 1, 1,
-2.321185, 0.3877095, -0.6123878, 1, 1, 1, 1, 1,
-2.31585, -1.195384, -2.028532, 1, 1, 1, 1, 1,
-2.173935, 0.3810583, -1.963762, 1, 1, 1, 1, 1,
-2.070942, -0.6776239, -3.257084, 1, 1, 1, 1, 1,
-2.065742, -0.5570979, -0.9027832, 1, 1, 1, 1, 1,
-2.06457, 0.7888947, 0.02023163, 1, 1, 1, 1, 1,
-2.059099, 0.9876132, -1.902483, 1, 1, 1, 1, 1,
-2.042827, 1.531952, -2.206189, 1, 1, 1, 1, 1,
-2.02967, 0.1893054, -1.479857, 1, 1, 1, 1, 1,
-2.027638, -0.3489178, -3.153273, 1, 1, 1, 1, 1,
-2.024381, 0.26058, -2.165172, 1, 1, 1, 1, 1,
-2.003671, 0.1828694, -1.875294, 1, 1, 1, 1, 1,
-1.999702, -0.7965638, -2.20136, 1, 1, 1, 1, 1,
-1.984638, 0.9037665, 0.6107891, 1, 1, 1, 1, 1,
-1.978729, -0.6002285, -0.8398104, 1, 1, 1, 1, 1,
-1.968196, 0.523111, -2.056737, 0, 0, 1, 1, 1,
-1.950311, 0.233068, -0.9727575, 1, 0, 0, 1, 1,
-1.950309, 0.3342547, -1.022632, 1, 0, 0, 1, 1,
-1.925674, -0.5381439, -0.474667, 1, 0, 0, 1, 1,
-1.923067, 1.646697, -0.6136316, 1, 0, 0, 1, 1,
-1.889912, 0.006539268, -2.323449, 1, 0, 0, 1, 1,
-1.885309, -0.3112919, -2.132243, 0, 0, 0, 1, 1,
-1.841883, -0.5867839, -1.756066, 0, 0, 0, 1, 1,
-1.834671, 0.007369824, -1.549037, 0, 0, 0, 1, 1,
-1.808712, 0.08433791, -1.75649, 0, 0, 0, 1, 1,
-1.802765, -1.296039, -1.521073, 0, 0, 0, 1, 1,
-1.796428, 0.3532423, -0.5741051, 0, 0, 0, 1, 1,
-1.787496, 0.9841497, -1.048107, 0, 0, 0, 1, 1,
-1.777221, -1.328258, -0.09496419, 1, 1, 1, 1, 1,
-1.774438, 0.5848344, -1.624486, 1, 1, 1, 1, 1,
-1.763692, -0.8893588, -2.692355, 1, 1, 1, 1, 1,
-1.755227, -0.2084733, -2.089556, 1, 1, 1, 1, 1,
-1.753673, -1.585581, -2.895782, 1, 1, 1, 1, 1,
-1.743924, 0.8678754, -2.195491, 1, 1, 1, 1, 1,
-1.74259, 0.2485698, -1.951873, 1, 1, 1, 1, 1,
-1.713641, -0.9424488, -0.9256812, 1, 1, 1, 1, 1,
-1.713588, 1.278147, -1.126026, 1, 1, 1, 1, 1,
-1.704469, -0.7216167, -3.980283, 1, 1, 1, 1, 1,
-1.696792, 0.9435777, -0.2516176, 1, 1, 1, 1, 1,
-1.690265, 0.3363177, -2.015009, 1, 1, 1, 1, 1,
-1.680056, 0.9476618, 0.3214352, 1, 1, 1, 1, 1,
-1.671059, -1.310053, -1.574846, 1, 1, 1, 1, 1,
-1.666322, -1.51405, -0.3397273, 1, 1, 1, 1, 1,
-1.652122, 0.530369, -1.728936, 0, 0, 1, 1, 1,
-1.634714, 0.3333617, -0.2476358, 1, 0, 0, 1, 1,
-1.631494, -0.1076493, -0.6779537, 1, 0, 0, 1, 1,
-1.623426, 0.477575, -1.672089, 1, 0, 0, 1, 1,
-1.620233, 1.851756, 0.1123475, 1, 0, 0, 1, 1,
-1.613189, 0.9861144, -2.636956, 1, 0, 0, 1, 1,
-1.61191, -0.08697774, -2.353307, 0, 0, 0, 1, 1,
-1.610114, -0.6908862, -1.171445, 0, 0, 0, 1, 1,
-1.596404, -0.6887689, -1.927439, 0, 0, 0, 1, 1,
-1.563466, -0.2795663, -1.703308, 0, 0, 0, 1, 1,
-1.560491, -0.8424464, -1.567519, 0, 0, 0, 1, 1,
-1.560007, -1.204186, -3.630339, 0, 0, 0, 1, 1,
-1.551851, 0.3000772, -1.466157, 0, 0, 0, 1, 1,
-1.548771, -0.7416865, -2.896273, 1, 1, 1, 1, 1,
-1.543445, 0.4740286, -1.518712, 1, 1, 1, 1, 1,
-1.521704, 1.239555, 1.044217, 1, 1, 1, 1, 1,
-1.5201, 0.1229171, -0.3586847, 1, 1, 1, 1, 1,
-1.519257, 0.5977478, -0.5982091, 1, 1, 1, 1, 1,
-1.516868, -0.3146473, -3.033683, 1, 1, 1, 1, 1,
-1.509828, 0.238308, -2.195479, 1, 1, 1, 1, 1,
-1.486389, -1.156528, -2.068823, 1, 1, 1, 1, 1,
-1.470525, 1.286248, -1.215258, 1, 1, 1, 1, 1,
-1.469908, 1.434719, -0.4587562, 1, 1, 1, 1, 1,
-1.468922, -0.5716264, -1.850064, 1, 1, 1, 1, 1,
-1.466677, -0.2588757, -1.402479, 1, 1, 1, 1, 1,
-1.464984, 2.254783, -2.564797, 1, 1, 1, 1, 1,
-1.453116, 0.8201404, -1.233128, 1, 1, 1, 1, 1,
-1.452829, 1.126237, -0.1575956, 1, 1, 1, 1, 1,
-1.450187, 2.564268, 0.1357494, 0, 0, 1, 1, 1,
-1.447798, 0.5011569, -2.726624, 1, 0, 0, 1, 1,
-1.438762, 0.8248045, -0.4985889, 1, 0, 0, 1, 1,
-1.428517, 0.3349702, -0.3954442, 1, 0, 0, 1, 1,
-1.420841, 1.833336, -0.1760331, 1, 0, 0, 1, 1,
-1.413145, -0.04709198, -3.195669, 1, 0, 0, 1, 1,
-1.4105, 0.2340981, -2.511559, 0, 0, 0, 1, 1,
-1.402161, 0.4011095, -1.691877, 0, 0, 0, 1, 1,
-1.396963, -0.8223933, -3.205205, 0, 0, 0, 1, 1,
-1.391622, -0.8448901, -2.781719, 0, 0, 0, 1, 1,
-1.390704, -1.117707, -0.827832, 0, 0, 0, 1, 1,
-1.3893, 0.7695305, -1.867051, 0, 0, 0, 1, 1,
-1.387568, -1.285463, -2.956752, 0, 0, 0, 1, 1,
-1.386541, 0.6179676, -0.5509046, 1, 1, 1, 1, 1,
-1.384188, -1.722312, -3.046453, 1, 1, 1, 1, 1,
-1.382783, -0.2862608, -0.3584465, 1, 1, 1, 1, 1,
-1.374177, -2.083474, -2.311983, 1, 1, 1, 1, 1,
-1.371165, -2.600237, -1.58494, 1, 1, 1, 1, 1,
-1.364614, -0.1061705, -2.947854, 1, 1, 1, 1, 1,
-1.363776, 1.984536, -0.4877585, 1, 1, 1, 1, 1,
-1.346951, -0.05222658, -1.837766, 1, 1, 1, 1, 1,
-1.334022, 2.532199, 1.191323, 1, 1, 1, 1, 1,
-1.327904, -0.06219664, -1.719469, 1, 1, 1, 1, 1,
-1.310899, 0.390412, 0.1165754, 1, 1, 1, 1, 1,
-1.301972, -0.677846, -0.8024406, 1, 1, 1, 1, 1,
-1.301513, 0.3700169, -1.208596, 1, 1, 1, 1, 1,
-1.301377, 0.8580827, -1.402268, 1, 1, 1, 1, 1,
-1.296752, 0.3833557, -2.058813, 1, 1, 1, 1, 1,
-1.295795, 0.007034537, -0.2798336, 0, 0, 1, 1, 1,
-1.275943, -1.635522, -1.304167, 1, 0, 0, 1, 1,
-1.261675, 0.2895873, -0.6360239, 1, 0, 0, 1, 1,
-1.261204, -0.139571, -2.213189, 1, 0, 0, 1, 1,
-1.258738, -1.657104, -2.191668, 1, 0, 0, 1, 1,
-1.243084, 0.2079736, -1.828776, 1, 0, 0, 1, 1,
-1.240338, 1.493973, -0.8815203, 0, 0, 0, 1, 1,
-1.240297, -1.78577, -3.215514, 0, 0, 0, 1, 1,
-1.231165, 1.170291, -0.09460536, 0, 0, 0, 1, 1,
-1.231073, 0.8426911, -1.418132, 0, 0, 0, 1, 1,
-1.229285, -0.7252865, -1.833255, 0, 0, 0, 1, 1,
-1.220523, -1.04353, -0.3844089, 0, 0, 0, 1, 1,
-1.218749, -0.9458795, -2.010041, 0, 0, 0, 1, 1,
-1.216387, -0.2299378, -1.558596, 1, 1, 1, 1, 1,
-1.216218, 0.05222742, -2.144175, 1, 1, 1, 1, 1,
-1.207488, 0.3990438, -1.380885, 1, 1, 1, 1, 1,
-1.197293, 1.041801, -0.7814648, 1, 1, 1, 1, 1,
-1.188865, -0.3132825, -2.115993, 1, 1, 1, 1, 1,
-1.184233, 0.429904, -0.6397924, 1, 1, 1, 1, 1,
-1.175349, -0.8006337, -0.2591005, 1, 1, 1, 1, 1,
-1.168667, -0.2653939, -3.064636, 1, 1, 1, 1, 1,
-1.160857, 0.1283914, -0.7736525, 1, 1, 1, 1, 1,
-1.150104, 0.9387726, -0.9710904, 1, 1, 1, 1, 1,
-1.148388, 0.1087858, -1.810513, 1, 1, 1, 1, 1,
-1.146866, -1.563301, -2.694638, 1, 1, 1, 1, 1,
-1.142934, 1.28383, -0.3030057, 1, 1, 1, 1, 1,
-1.137483, -0.2523516, -0.6447142, 1, 1, 1, 1, 1,
-1.136903, 0.3388788, -1.082834, 1, 1, 1, 1, 1,
-1.135075, -1.240846, -1.326731, 0, 0, 1, 1, 1,
-1.130961, -0.01062453, -0.4458097, 1, 0, 0, 1, 1,
-1.126995, -0.4457349, -2.663469, 1, 0, 0, 1, 1,
-1.118653, 0.4058523, -2.890266, 1, 0, 0, 1, 1,
-1.115139, -0.0343295, -2.385412, 1, 0, 0, 1, 1,
-1.111382, 0.2675174, -2.771462, 1, 0, 0, 1, 1,
-1.110275, -0.2826979, -2.194835, 0, 0, 0, 1, 1,
-1.107114, -0.3042774, -0.7065333, 0, 0, 0, 1, 1,
-1.100865, -1.166094, -1.37257, 0, 0, 0, 1, 1,
-1.098764, 0.05774276, -2.692443, 0, 0, 0, 1, 1,
-1.093933, -0.7279481, -0.6339706, 0, 0, 0, 1, 1,
-1.093454, 1.080763, -0.3117372, 0, 0, 0, 1, 1,
-1.088403, -0.1940263, -1.611273, 0, 0, 0, 1, 1,
-1.084764, 0.5101798, -1.763726, 1, 1, 1, 1, 1,
-1.079386, 0.05853217, -1.049819, 1, 1, 1, 1, 1,
-1.075399, -0.1001314, -0.3292364, 1, 1, 1, 1, 1,
-1.075354, -0.8368422, -1.758893, 1, 1, 1, 1, 1,
-1.073099, -1.067578, -2.04719, 1, 1, 1, 1, 1,
-1.069432, 0.5767474, -0.01801256, 1, 1, 1, 1, 1,
-1.06161, -1.667335, -2.7842, 1, 1, 1, 1, 1,
-1.059569, 0.4167391, -2.447799, 1, 1, 1, 1, 1,
-1.05579, 0.6551803, -1.924002, 1, 1, 1, 1, 1,
-1.051353, -1.065497, -2.935016, 1, 1, 1, 1, 1,
-1.042058, -0.2283745, 0.5294223, 1, 1, 1, 1, 1,
-1.035869, 1.711491, -1.837563, 1, 1, 1, 1, 1,
-1.034234, -0.04124417, 0.4338135, 1, 1, 1, 1, 1,
-1.033142, -0.368013, -1.843301, 1, 1, 1, 1, 1,
-1.02986, 1.15739, 0.977389, 1, 1, 1, 1, 1,
-1.02325, 0.6008908, 0.7810436, 0, 0, 1, 1, 1,
-1.016759, -1.163922, -1.068379, 1, 0, 0, 1, 1,
-1.01245, -0.08298416, -1.12228, 1, 0, 0, 1, 1,
-1.009313, 1.447641, -1.355362, 1, 0, 0, 1, 1,
-1.007789, -2.195493, -4.635015, 1, 0, 0, 1, 1,
-1.007717, -1.278036, -1.508163, 1, 0, 0, 1, 1,
-1.005614, 0.7542499, -0.03931879, 0, 0, 0, 1, 1,
-1.000342, -0.3283624, -1.303868, 0, 0, 0, 1, 1,
-0.9876763, 0.3746475, -1.980795, 0, 0, 0, 1, 1,
-0.9876689, -0.6460606, -3.431851, 0, 0, 0, 1, 1,
-0.9868453, 0.00987224, 0.7585759, 0, 0, 0, 1, 1,
-0.9840062, -0.5489914, -2.061285, 0, 0, 0, 1, 1,
-0.9832891, -0.6235049, -2.053572, 0, 0, 0, 1, 1,
-0.9816688, 1.280672, 0.3490307, 1, 1, 1, 1, 1,
-0.9814183, -1.761066, -1.909544, 1, 1, 1, 1, 1,
-0.9693999, -0.6829904, -3.481589, 1, 1, 1, 1, 1,
-0.9669281, -0.2938337, -1.42911, 1, 1, 1, 1, 1,
-0.9644955, 0.975394, -1.705138, 1, 1, 1, 1, 1,
-0.9592425, 1.519853, -0.6326926, 1, 1, 1, 1, 1,
-0.9525822, -0.4025997, -0.01676273, 1, 1, 1, 1, 1,
-0.9511541, 0.6687627, -0.09837642, 1, 1, 1, 1, 1,
-0.9466465, 1.309609, 0.9412633, 1, 1, 1, 1, 1,
-0.9418667, -0.04455578, -2.355499, 1, 1, 1, 1, 1,
-0.9391343, -0.9904195, -2.95903, 1, 1, 1, 1, 1,
-0.9311855, -1.455976, -3.68631, 1, 1, 1, 1, 1,
-0.9174401, 0.7102625, -0.1927491, 1, 1, 1, 1, 1,
-0.9111274, 0.2409124, -3.391409, 1, 1, 1, 1, 1,
-0.9107642, 2.232399, 0.3341744, 1, 1, 1, 1, 1,
-0.9000233, -1.103293, -2.671386, 0, 0, 1, 1, 1,
-0.8977563, -0.705713, -1.898021, 1, 0, 0, 1, 1,
-0.8912644, 0.8278443, 2.311926, 1, 0, 0, 1, 1,
-0.8879187, -1.122132, -4.583014, 1, 0, 0, 1, 1,
-0.8681172, -2.052341, -2.214285, 1, 0, 0, 1, 1,
-0.8673802, -0.4975252, -1.459531, 1, 0, 0, 1, 1,
-0.8656493, 0.760071, -1.71539, 0, 0, 0, 1, 1,
-0.8644927, -1.958726, -2.218814, 0, 0, 0, 1, 1,
-0.8626037, 1.261236, -1.680492, 0, 0, 0, 1, 1,
-0.8596716, -1.167441, -3.091173, 0, 0, 0, 1, 1,
-0.8579793, -0.9880306, -3.071092, 0, 0, 0, 1, 1,
-0.8541709, -1.032997, -3.373263, 0, 0, 0, 1, 1,
-0.8507636, 0.666763, -1.355418, 0, 0, 0, 1, 1,
-0.850392, 0.3377701, -0.8758894, 1, 1, 1, 1, 1,
-0.8463193, 1.154538, -1.590986, 1, 1, 1, 1, 1,
-0.8434099, 1.780323, -1.616375, 1, 1, 1, 1, 1,
-0.8409865, 0.3413836, -2.072914, 1, 1, 1, 1, 1,
-0.8403094, -0.755413, -3.184156, 1, 1, 1, 1, 1,
-0.8396513, -0.8277699, -2.094669, 1, 1, 1, 1, 1,
-0.8171559, 1.388032, -0.1342355, 1, 1, 1, 1, 1,
-0.814654, 1.51817, -0.1760663, 1, 1, 1, 1, 1,
-0.8074736, -0.7030787, -2.352276, 1, 1, 1, 1, 1,
-0.8040242, 0.4011477, -2.950673, 1, 1, 1, 1, 1,
-0.7987918, -0.6367201, -0.9727538, 1, 1, 1, 1, 1,
-0.7980941, 0.7934741, -1.883262, 1, 1, 1, 1, 1,
-0.7969209, -0.2853587, -3.452286, 1, 1, 1, 1, 1,
-0.7960542, 0.8854249, -1.385872, 1, 1, 1, 1, 1,
-0.7953193, -2.148257, -2.129911, 1, 1, 1, 1, 1,
-0.7935821, 0.1455984, -2.714102, 0, 0, 1, 1, 1,
-0.788128, -0.4198147, -2.936751, 1, 0, 0, 1, 1,
-0.7846342, 1.575912, 0.5881006, 1, 0, 0, 1, 1,
-0.7819335, 2.820735, -0.118697, 1, 0, 0, 1, 1,
-0.7730212, -0.5708151, -3.063033, 1, 0, 0, 1, 1,
-0.7711051, 0.3879479, -2.532207, 1, 0, 0, 1, 1,
-0.7671522, -1.258839, -3.823089, 0, 0, 0, 1, 1,
-0.76704, -1.640828, -2.692684, 0, 0, 0, 1, 1,
-0.7667257, 1.31904, -2.635747, 0, 0, 0, 1, 1,
-0.7664893, 0.3142162, 0.4282566, 0, 0, 0, 1, 1,
-0.7634325, -0.03873515, 1.248379, 0, 0, 0, 1, 1,
-0.7629499, -0.05692264, -2.271591, 0, 0, 0, 1, 1,
-0.7622278, 1.29414, -1.028288, 0, 0, 0, 1, 1,
-0.7522825, 0.2968434, -2.725403, 1, 1, 1, 1, 1,
-0.7483909, -2.851395, -2.173547, 1, 1, 1, 1, 1,
-0.7464644, 0.3580388, -1.695362, 1, 1, 1, 1, 1,
-0.7436044, -0.8164373, -1.884805, 1, 1, 1, 1, 1,
-0.7425928, -0.06383351, -1.511767, 1, 1, 1, 1, 1,
-0.7415875, -0.1110033, -1.62467, 1, 1, 1, 1, 1,
-0.7368274, 0.2238866, -1.273914, 1, 1, 1, 1, 1,
-0.7300594, 0.5618398, -1.024742, 1, 1, 1, 1, 1,
-0.726485, 0.1183287, -2.374553, 1, 1, 1, 1, 1,
-0.724625, 0.7757695, 0.1174729, 1, 1, 1, 1, 1,
-0.724191, 0.3806482, -1.306188, 1, 1, 1, 1, 1,
-0.721752, -0.3699258, -2.77162, 1, 1, 1, 1, 1,
-0.7208912, 2.758682, -1.864505, 1, 1, 1, 1, 1,
-0.7187004, -0.2990558, -1.925393, 1, 1, 1, 1, 1,
-0.7165085, 0.5507198, 0.369113, 1, 1, 1, 1, 1,
-0.7148086, -1.462891, -2.136752, 0, 0, 1, 1, 1,
-0.7103852, 1.023164, -1.424845, 1, 0, 0, 1, 1,
-0.709676, 0.6439485, -1.057734, 1, 0, 0, 1, 1,
-0.6931522, -1.11147, -1.565402, 1, 0, 0, 1, 1,
-0.6903989, -1.974397, -2.219425, 1, 0, 0, 1, 1,
-0.6869333, 1.151271, -0.7009522, 1, 0, 0, 1, 1,
-0.6865125, -0.940412, -2.978352, 0, 0, 0, 1, 1,
-0.6768336, -1.735716, -1.987382, 0, 0, 0, 1, 1,
-0.6710906, 0.9299495, -0.9918955, 0, 0, 0, 1, 1,
-0.6708462, 1.525629, -0.5655637, 0, 0, 0, 1, 1,
-0.6699308, 1.512185, 0.9876227, 0, 0, 0, 1, 1,
-0.6641883, -0.03009879, -1.186807, 0, 0, 0, 1, 1,
-0.6631403, 1.352862, -1.088256, 0, 0, 0, 1, 1,
-0.6573556, 1.086615, 0.07660478, 1, 1, 1, 1, 1,
-0.6556576, 0.1530658, -0.2592318, 1, 1, 1, 1, 1,
-0.6486927, -0.2537378, -2.532846, 1, 1, 1, 1, 1,
-0.6483124, -0.5984686, -1.608627, 1, 1, 1, 1, 1,
-0.6463014, 2.576712, -0.1563942, 1, 1, 1, 1, 1,
-0.6369193, 0.9899616, -0.556818, 1, 1, 1, 1, 1,
-0.6350132, 0.466279, -1.595057, 1, 1, 1, 1, 1,
-0.6332291, 0.7665334, 0.3765621, 1, 1, 1, 1, 1,
-0.6263245, 1.300393, 0.1015328, 1, 1, 1, 1, 1,
-0.6221243, -0.6356127, -2.866091, 1, 1, 1, 1, 1,
-0.620553, 0.09226306, -2.454256, 1, 1, 1, 1, 1,
-0.6155175, -1.344133, -2.424154, 1, 1, 1, 1, 1,
-0.6058365, 0.8123446, -1.501899, 1, 1, 1, 1, 1,
-0.6014474, -0.6892141, -2.600293, 1, 1, 1, 1, 1,
-0.5979353, -0.9983345, -2.673971, 1, 1, 1, 1, 1,
-0.5962934, 0.2441522, -1.2709, 0, 0, 1, 1, 1,
-0.5941455, -1.482006, -2.248549, 1, 0, 0, 1, 1,
-0.5908465, 0.2377393, -0.76806, 1, 0, 0, 1, 1,
-0.589152, 0.5070094, 0.07948701, 1, 0, 0, 1, 1,
-0.5778316, 1.302164, -0.7109826, 1, 0, 0, 1, 1,
-0.577711, 0.7767767, -0.1507919, 1, 0, 0, 1, 1,
-0.5768115, 1.031084, -0.2406279, 0, 0, 0, 1, 1,
-0.5724987, -0.3978287, -2.507448, 0, 0, 0, 1, 1,
-0.5710875, 0.9379942, -0.06418809, 0, 0, 0, 1, 1,
-0.5705376, -1.097315, -2.635647, 0, 0, 0, 1, 1,
-0.5701709, -0.8062598, -3.468443, 0, 0, 0, 1, 1,
-0.5683078, -1.126263, -2.174515, 0, 0, 0, 1, 1,
-0.5657604, -0.7237727, -1.218375, 0, 0, 0, 1, 1,
-0.5649551, -0.9584667, -3.087591, 1, 1, 1, 1, 1,
-0.5614954, -1.864747, -1.852865, 1, 1, 1, 1, 1,
-0.5608123, 1.831605, -2.456577, 1, 1, 1, 1, 1,
-0.560779, -0.5710902, -1.714838, 1, 1, 1, 1, 1,
-0.5594327, -0.2184986, -2.365617, 1, 1, 1, 1, 1,
-0.5538532, -2.003604, -2.114705, 1, 1, 1, 1, 1,
-0.5520069, 0.2603144, 0.6973249, 1, 1, 1, 1, 1,
-0.5463055, 1.708836, -0.6420376, 1, 1, 1, 1, 1,
-0.5458515, 0.03480575, -2.007332, 1, 1, 1, 1, 1,
-0.5450259, 0.9031371, -0.7839989, 1, 1, 1, 1, 1,
-0.5446166, 0.4508985, -0.3148012, 1, 1, 1, 1, 1,
-0.542168, 0.4354054, -1.241717, 1, 1, 1, 1, 1,
-0.5326802, -1.118135, -2.308586, 1, 1, 1, 1, 1,
-0.5326466, 0.8632218, -0.6007514, 1, 1, 1, 1, 1,
-0.5319107, 1.036727, 0.7724758, 1, 1, 1, 1, 1,
-0.5285798, 0.6864871, -1.668338, 0, 0, 1, 1, 1,
-0.5229923, 1.08121, 0.3976712, 1, 0, 0, 1, 1,
-0.514805, 0.2076192, -0.6418294, 1, 0, 0, 1, 1,
-0.5132138, 0.5579175, 0.57704, 1, 0, 0, 1, 1,
-0.5105324, -1.528602, -3.391181, 1, 0, 0, 1, 1,
-0.5086689, 1.856314, 0.6326596, 1, 0, 0, 1, 1,
-0.5017589, -0.1981196, -2.296486, 0, 0, 0, 1, 1,
-0.4995439, -0.6937227, -2.411025, 0, 0, 0, 1, 1,
-0.4956225, -0.8818436, -3.924438, 0, 0, 0, 1, 1,
-0.4934756, -1.041783, -2.911203, 0, 0, 0, 1, 1,
-0.4928012, -0.1868743, -1.677673, 0, 0, 0, 1, 1,
-0.492715, 0.8354352, -0.4168226, 0, 0, 0, 1, 1,
-0.4912534, -1.700058, -3.247147, 0, 0, 0, 1, 1,
-0.4878518, 0.2048527, -0.3332146, 1, 1, 1, 1, 1,
-0.4845249, 0.2497328, -1.034878, 1, 1, 1, 1, 1,
-0.4816091, -0.1944856, -1.356439, 1, 1, 1, 1, 1,
-0.4764174, -0.3542915, -1.821028, 1, 1, 1, 1, 1,
-0.4668117, -0.3294683, -2.001499, 1, 1, 1, 1, 1,
-0.4654299, 0.7716721, -0.2658424, 1, 1, 1, 1, 1,
-0.4641682, 0.72278, 1.018353, 1, 1, 1, 1, 1,
-0.4623928, -1.267549, -2.842555, 1, 1, 1, 1, 1,
-0.4597418, 1.638032, 0.2439236, 1, 1, 1, 1, 1,
-0.4582393, 0.6575757, -1.362483, 1, 1, 1, 1, 1,
-0.4568114, -1.331588, -2.147633, 1, 1, 1, 1, 1,
-0.4522816, -0.7465859, -2.784581, 1, 1, 1, 1, 1,
-0.4499362, -0.06468225, -2.8391, 1, 1, 1, 1, 1,
-0.4487669, 0.1793026, -2.158247, 1, 1, 1, 1, 1,
-0.4456989, -0.3236748, -1.175509, 1, 1, 1, 1, 1,
-0.4438765, 0.5630362, -1.238178, 0, 0, 1, 1, 1,
-0.4401096, 0.3481921, -1.21688, 1, 0, 0, 1, 1,
-0.4395815, 1.084373, 0.6355056, 1, 0, 0, 1, 1,
-0.4374718, 0.8112547, -1.161999, 1, 0, 0, 1, 1,
-0.4332334, 1.343694, -1.889844, 1, 0, 0, 1, 1,
-0.4318322, -0.7775651, -3.074127, 1, 0, 0, 1, 1,
-0.4280633, -0.01084136, -1.48219, 0, 0, 0, 1, 1,
-0.4207934, -0.2383516, -1.046329, 0, 0, 0, 1, 1,
-0.4104065, 0.1785873, -0.5170818, 0, 0, 0, 1, 1,
-0.40876, -0.06972809, -2.05627, 0, 0, 0, 1, 1,
-0.4071968, 0.9361175, -1.682249, 0, 0, 0, 1, 1,
-0.4066415, 0.2205521, -0.5703079, 0, 0, 0, 1, 1,
-0.4064754, -0.3390095, -1.999951, 0, 0, 0, 1, 1,
-0.3984078, -0.6109254, -3.286065, 1, 1, 1, 1, 1,
-0.3932706, 0.4420749, -1.50547, 1, 1, 1, 1, 1,
-0.3929428, -1.348473, -2.627419, 1, 1, 1, 1, 1,
-0.3928391, 0.6198144, -1.896679, 1, 1, 1, 1, 1,
-0.3926291, -0.2568889, -1.296274, 1, 1, 1, 1, 1,
-0.3873705, 1.04268, -1.819893, 1, 1, 1, 1, 1,
-0.3857827, 0.2897483, -1.10888, 1, 1, 1, 1, 1,
-0.3801367, 0.1546143, -1.0748, 1, 1, 1, 1, 1,
-0.3791516, -1.240015, -3.210462, 1, 1, 1, 1, 1,
-0.3761339, -1.321456, -3.074827, 1, 1, 1, 1, 1,
-0.3737622, 1.019932, -0.3593002, 1, 1, 1, 1, 1,
-0.3736098, -0.7285652, -3.17155, 1, 1, 1, 1, 1,
-0.3668522, 0.5349027, -1.451822, 1, 1, 1, 1, 1,
-0.3648549, -1.27597, -1.277758, 1, 1, 1, 1, 1,
-0.3620635, -0.02041957, -2.818579, 1, 1, 1, 1, 1,
-0.3593906, 1.002155, 0.07248419, 0, 0, 1, 1, 1,
-0.3538781, 1.191918, -0.94692, 1, 0, 0, 1, 1,
-0.3519574, -1.685995, -3.69231, 1, 0, 0, 1, 1,
-0.3453502, 0.7642251, 0.08089359, 1, 0, 0, 1, 1,
-0.3429816, -0.5824241, -2.67185, 1, 0, 0, 1, 1,
-0.3428287, -1.24992, -3.888981, 1, 0, 0, 1, 1,
-0.3411031, 0.5312915, -0.7177309, 0, 0, 0, 1, 1,
-0.3387729, 1.647683, 0.127619, 0, 0, 0, 1, 1,
-0.3371323, 0.07359608, -0.5205596, 0, 0, 0, 1, 1,
-0.3348701, 1.185613, -1.86595, 0, 0, 0, 1, 1,
-0.3322615, -0.1193973, -2.117543, 0, 0, 0, 1, 1,
-0.3283547, -0.7231609, -3.876252, 0, 0, 0, 1, 1,
-0.3226448, 0.3927568, -0.6224169, 0, 0, 0, 1, 1,
-0.3171348, -1.50755, -3.187966, 1, 1, 1, 1, 1,
-0.3121346, -1.464841, -4.055266, 1, 1, 1, 1, 1,
-0.3099398, -0.9697384, -1.212559, 1, 1, 1, 1, 1,
-0.3056217, -1.305642, -1.885261, 1, 1, 1, 1, 1,
-0.3050691, 1.310454, -0.1662518, 1, 1, 1, 1, 1,
-0.3022817, 0.5744289, -0.290543, 1, 1, 1, 1, 1,
-0.3007947, -0.02107835, -0.02042704, 1, 1, 1, 1, 1,
-0.2971874, 0.6721044, -0.6677165, 1, 1, 1, 1, 1,
-0.2956243, -1.4489, -2.014195, 1, 1, 1, 1, 1,
-0.2942398, 0.323386, -2.177707, 1, 1, 1, 1, 1,
-0.2920611, 0.03542943, -1.344215, 1, 1, 1, 1, 1,
-0.2913859, 0.8834266, -0.8068798, 1, 1, 1, 1, 1,
-0.290488, -1.699678, -3.286729, 1, 1, 1, 1, 1,
-0.2896258, 1.338306, -1.401833, 1, 1, 1, 1, 1,
-0.283255, 0.7119538, -1.708129, 1, 1, 1, 1, 1,
-0.282936, 0.9234724, 0.2515992, 0, 0, 1, 1, 1,
-0.2824004, 1.084865, -0.980077, 1, 0, 0, 1, 1,
-0.2782419, 0.3796389, 0.1843924, 1, 0, 0, 1, 1,
-0.2759373, 0.1396216, -1.66807, 1, 0, 0, 1, 1,
-0.2738091, -0.7386017, -4.031165, 1, 0, 0, 1, 1,
-0.2733078, -0.4578565, -2.069884, 1, 0, 0, 1, 1,
-0.2725433, -1.254759, -1.053084, 0, 0, 0, 1, 1,
-0.2655303, -1.615043, -2.990342, 0, 0, 0, 1, 1,
-0.2651558, 0.4289051, -0.8137495, 0, 0, 0, 1, 1,
-0.2608151, 1.570869, -1.225318, 0, 0, 0, 1, 1,
-0.2600659, -1.38508, -3.389231, 0, 0, 0, 1, 1,
-0.2559955, 0.314589, 0.09278017, 0, 0, 0, 1, 1,
-0.2550992, 0.451481, 0.5859093, 0, 0, 0, 1, 1,
-0.2535581, -1.111816, -1.41822, 1, 1, 1, 1, 1,
-0.2503677, 1.229726, -1.530336, 1, 1, 1, 1, 1,
-0.2491319, -2.108318, -2.414627, 1, 1, 1, 1, 1,
-0.2484684, 2.138735, 0.8425561, 1, 1, 1, 1, 1,
-0.248448, 0.8496481, 0.6264752, 1, 1, 1, 1, 1,
-0.2448392, 0.8176504, 0.4416797, 1, 1, 1, 1, 1,
-0.2391459, -0.1279593, -0.9439846, 1, 1, 1, 1, 1,
-0.2380075, 0.09031075, -0.3089065, 1, 1, 1, 1, 1,
-0.234992, 1.877831, 2.17973, 1, 1, 1, 1, 1,
-0.2326064, 0.5503834, -0.2754589, 1, 1, 1, 1, 1,
-0.2323981, 0.3022438, -0.007185485, 1, 1, 1, 1, 1,
-0.2307113, -1.118666, -3.578954, 1, 1, 1, 1, 1,
-0.2282612, 1.617801, 0.375292, 1, 1, 1, 1, 1,
-0.2211957, -0.01783034, -1.87366, 1, 1, 1, 1, 1,
-0.2201586, 1.642971, -1.278087, 1, 1, 1, 1, 1,
-0.2142677, -1.519196, -0.8352441, 0, 0, 1, 1, 1,
-0.2135456, 2.058642, 0.9402136, 1, 0, 0, 1, 1,
-0.2118519, -0.6502843, -2.633025, 1, 0, 0, 1, 1,
-0.2098066, -0.2692453, -1.873736, 1, 0, 0, 1, 1,
-0.20703, 1.491029, -0.5022819, 1, 0, 0, 1, 1,
-0.2061811, 0.4433587, -1.412533, 1, 0, 0, 1, 1,
-0.2056734, -0.1769446, -3.01538, 0, 0, 0, 1, 1,
-0.2026699, -0.5056384, -3.959884, 0, 0, 0, 1, 1,
-0.1953533, 0.388955, 0.8237562, 0, 0, 0, 1, 1,
-0.1920983, -0.7839065, -3.805256, 0, 0, 0, 1, 1,
-0.1810794, 0.8424248, 0.7627351, 0, 0, 0, 1, 1,
-0.1804912, 0.3810626, -2.750227, 0, 0, 0, 1, 1,
-0.1753396, 0.4134409, -1.348983, 0, 0, 0, 1, 1,
-0.1745973, -0.7829112, -3.164814, 1, 1, 1, 1, 1,
-0.1727197, -0.9346356, -4.803805, 1, 1, 1, 1, 1,
-0.1719499, 0.511124, 0.04243702, 1, 1, 1, 1, 1,
-0.1696502, 1.519104, 1.671173, 1, 1, 1, 1, 1,
-0.168111, 1.617012, -0.9843802, 1, 1, 1, 1, 1,
-0.1674212, -2.096212, -3.035159, 1, 1, 1, 1, 1,
-0.165893, -0.07536912, -3.906911, 1, 1, 1, 1, 1,
-0.1648471, -0.8911475, -4.524406, 1, 1, 1, 1, 1,
-0.1603292, -1.366495, -1.057407, 1, 1, 1, 1, 1,
-0.155585, 1.299289, 0.0377334, 1, 1, 1, 1, 1,
-0.1530427, -0.6409268, -2.856882, 1, 1, 1, 1, 1,
-0.1506854, 0.1125745, -0.8229572, 1, 1, 1, 1, 1,
-0.1473234, 0.8590719, -0.4574462, 1, 1, 1, 1, 1,
-0.1455974, -0.08791561, -5.012712, 1, 1, 1, 1, 1,
-0.144093, 0.6278124, 0.05417385, 1, 1, 1, 1, 1,
-0.1435838, 1.812102, 2.256317, 0, 0, 1, 1, 1,
-0.1432839, 0.1991454, 0.5047669, 1, 0, 0, 1, 1,
-0.1250731, -0.6697835, -3.706342, 1, 0, 0, 1, 1,
-0.1233802, 0.3252433, -0.7422633, 1, 0, 0, 1, 1,
-0.1233326, -0.3220082, -3.548055, 1, 0, 0, 1, 1,
-0.1232838, 1.425419, 0.1682634, 1, 0, 0, 1, 1,
-0.121588, 0.3565743, 0.2501523, 0, 0, 0, 1, 1,
-0.1150663, -0.6429129, -2.515205, 0, 0, 0, 1, 1,
-0.1142488, 0.3671836, 0.4481122, 0, 0, 0, 1, 1,
-0.1137305, 0.02911245, -3.365649, 0, 0, 0, 1, 1,
-0.1134514, -1.085703, -4.51665, 0, 0, 0, 1, 1,
-0.1067543, 0.8187968, -1.241079, 0, 0, 0, 1, 1,
-0.1062024, -1.204009, -3.410853, 0, 0, 0, 1, 1,
-0.103195, -0.8462536, -3.950993, 1, 1, 1, 1, 1,
-0.1017424, 0.5263243, 0.313741, 1, 1, 1, 1, 1,
-0.09154233, -0.2175472, -2.767058, 1, 1, 1, 1, 1,
-0.09128574, 0.777864, -2.535605, 1, 1, 1, 1, 1,
-0.08965652, 0.5348549, -1.976736, 1, 1, 1, 1, 1,
-0.08902626, 0.4895046, 0.3185759, 1, 1, 1, 1, 1,
-0.08221672, -0.3146737, -2.810269, 1, 1, 1, 1, 1,
-0.07838129, 2.011852, 0.1445159, 1, 1, 1, 1, 1,
-0.07827294, 0.1856056, -0.4759345, 1, 1, 1, 1, 1,
-0.07718465, -0.7401889, -3.253209, 1, 1, 1, 1, 1,
-0.07649612, 0.1278872, -0.7515283, 1, 1, 1, 1, 1,
-0.07253733, -0.3220224, -1.668138, 1, 1, 1, 1, 1,
-0.07113205, -1.680678, -4.05464, 1, 1, 1, 1, 1,
-0.06962706, -0.8003339, -3.867484, 1, 1, 1, 1, 1,
-0.06954273, -1.026056, -1.812388, 1, 1, 1, 1, 1,
-0.06614754, -0.3411069, -2.565045, 0, 0, 1, 1, 1,
-0.06611905, -0.6625047, -5.003311, 1, 0, 0, 1, 1,
-0.0641133, -1.03521, -4.037987, 1, 0, 0, 1, 1,
-0.06376264, 0.2269997, 0.1310297, 1, 0, 0, 1, 1,
-0.06303795, -0.3854963, -2.194543, 1, 0, 0, 1, 1,
-0.06151152, 0.4212793, -0.9223121, 1, 0, 0, 1, 1,
-0.05958318, 1.028273, 1.595175, 0, 0, 0, 1, 1,
-0.05777664, 1.231659, 0.275592, 0, 0, 0, 1, 1,
-0.05561304, 0.4564836, -0.6885734, 0, 0, 0, 1, 1,
-0.05435728, 0.5151983, 1.537075, 0, 0, 0, 1, 1,
-0.05322226, -1.851907, -2.692778, 0, 0, 0, 1, 1,
-0.05221743, -0.7409668, -2.662242, 0, 0, 0, 1, 1,
-0.0476027, 0.9940391, 0.9640566, 0, 0, 0, 1, 1,
-0.04594636, -0.260922, -3.967381, 1, 1, 1, 1, 1,
-0.03973347, -0.6486489, -2.850871, 1, 1, 1, 1, 1,
-0.03966429, 2.242296, -0.01852111, 1, 1, 1, 1, 1,
-0.03933197, 0.6646865, 0.1644621, 1, 1, 1, 1, 1,
-0.03721423, -0.317005, -3.836354, 1, 1, 1, 1, 1,
-0.03531323, -0.03370107, -1.480448, 1, 1, 1, 1, 1,
-0.03433042, -0.0760916, -1.841714, 1, 1, 1, 1, 1,
-0.03422939, 0.6680672, 1.145282, 1, 1, 1, 1, 1,
-0.02371186, -0.8180513, -2.5389, 1, 1, 1, 1, 1,
-0.02336142, -1.584963, -4.250754, 1, 1, 1, 1, 1,
-0.01406505, -0.6400504, -3.651844, 1, 1, 1, 1, 1,
-0.01320205, 1.414993, 1.170206, 1, 1, 1, 1, 1,
-0.01021816, -0.01320336, -2.663517, 1, 1, 1, 1, 1,
-0.009410472, 0.7544758, 1.208625, 1, 1, 1, 1, 1,
-0.009096272, 1.452599, 0.2514931, 1, 1, 1, 1, 1,
-0.007612908, -1.555212, -2.77853, 0, 0, 1, 1, 1,
-0.006288655, -0.6852059, -3.160853, 1, 0, 0, 1, 1,
-0.0032058, 0.7169368, -0.5676277, 1, 0, 0, 1, 1,
0.003334627, -0.6908457, 1.767926, 1, 0, 0, 1, 1,
0.00444818, -0.2668581, 4.364167, 1, 0, 0, 1, 1,
0.005426855, -0.4324616, 3.758833, 1, 0, 0, 1, 1,
0.005546733, 1.158451, -2.171659, 0, 0, 0, 1, 1,
0.006886865, -0.4335895, 3.723433, 0, 0, 0, 1, 1,
0.008714454, 1.853984, -0.7661607, 0, 0, 0, 1, 1,
0.008820932, 0.8601046, 0.1761909, 0, 0, 0, 1, 1,
0.01194038, -0.2034306, 3.03264, 0, 0, 0, 1, 1,
0.01341538, 0.7873237, 0.3818387, 0, 0, 0, 1, 1,
0.01566365, -0.7478279, 2.923819, 0, 0, 0, 1, 1,
0.01572823, -0.3370125, 1.142916, 1, 1, 1, 1, 1,
0.01695618, -0.6468987, 2.184455, 1, 1, 1, 1, 1,
0.01713817, 1.063296, -0.5614451, 1, 1, 1, 1, 1,
0.02061506, 1.210161, -1.183802, 1, 1, 1, 1, 1,
0.02061525, 1.544891, -2.99848, 1, 1, 1, 1, 1,
0.02601886, -0.1928754, 4.003024, 1, 1, 1, 1, 1,
0.03159117, -0.8396001, 2.1914, 1, 1, 1, 1, 1,
0.0394885, 0.7902488, 0.7571699, 1, 1, 1, 1, 1,
0.04092281, -0.4835058, 3.85177, 1, 1, 1, 1, 1,
0.04283508, -0.2858355, 2.553848, 1, 1, 1, 1, 1,
0.04371589, 0.6992533, -0.1601276, 1, 1, 1, 1, 1,
0.04632618, 1.327363, -0.4788772, 1, 1, 1, 1, 1,
0.0498088, -0.1206647, 1.406895, 1, 1, 1, 1, 1,
0.05807914, -0.9306481, 2.699468, 1, 1, 1, 1, 1,
0.05837976, -1.059048, 2.389127, 1, 1, 1, 1, 1,
0.05895009, 0.4557653, 0.008516245, 0, 0, 1, 1, 1,
0.06113366, -0.3330956, 2.626099, 1, 0, 0, 1, 1,
0.06181593, 0.2431264, 0.5032377, 1, 0, 0, 1, 1,
0.06353416, 0.4132196, -1.288265, 1, 0, 0, 1, 1,
0.06456861, 0.8217329, -0.6736498, 1, 0, 0, 1, 1,
0.06536757, -0.8443588, 2.786466, 1, 0, 0, 1, 1,
0.07401504, -0.1889456, 5.48697, 0, 0, 0, 1, 1,
0.07889532, 0.9192311, 1.806259, 0, 0, 0, 1, 1,
0.08035477, -0.215459, 2.299676, 0, 0, 0, 1, 1,
0.08139507, 2.452328, 0.6608619, 0, 0, 0, 1, 1,
0.08862132, 0.2173827, -0.9724196, 0, 0, 0, 1, 1,
0.08936897, 0.4437799, -0.2241753, 0, 0, 0, 1, 1,
0.09149111, 0.8215687, 1.262883, 0, 0, 0, 1, 1,
0.09332175, -0.2740863, 2.223113, 1, 1, 1, 1, 1,
0.09581153, -0.5426772, 2.526146, 1, 1, 1, 1, 1,
0.09719999, -1.440008, 3.005959, 1, 1, 1, 1, 1,
0.0978265, -1.001065, 3.531729, 1, 1, 1, 1, 1,
0.09817056, -0.4132479, 1.666301, 1, 1, 1, 1, 1,
0.1018772, -1.378286, 3.208242, 1, 1, 1, 1, 1,
0.1040323, -0.03942614, 2.307874, 1, 1, 1, 1, 1,
0.1047893, -0.5702699, 2.465697, 1, 1, 1, 1, 1,
0.1164716, -1.333565, 2.73742, 1, 1, 1, 1, 1,
0.1229277, 0.7364781, -0.4275618, 1, 1, 1, 1, 1,
0.1309678, 1.37374, 0.7995135, 1, 1, 1, 1, 1,
0.1414773, -0.3385468, 4.134683, 1, 1, 1, 1, 1,
0.1433558, -1.428915, 2.341491, 1, 1, 1, 1, 1,
0.1442422, -1.117233, 3.141148, 1, 1, 1, 1, 1,
0.1508231, -0.7926996, 2.221097, 1, 1, 1, 1, 1,
0.1549052, -1.802599, 2.010561, 0, 0, 1, 1, 1,
0.1557235, 0.08614758, 2.128717, 1, 0, 0, 1, 1,
0.1667105, -1.184069, 3.059979, 1, 0, 0, 1, 1,
0.1675904, 1.084787, 1.308529, 1, 0, 0, 1, 1,
0.1693639, 1.055742, -0.9228998, 1, 0, 0, 1, 1,
0.1808297, -1.807251, 3.001151, 1, 0, 0, 1, 1,
0.1833527, 1.169093, -0.1076157, 0, 0, 0, 1, 1,
0.1839364, -0.9247763, 1.408513, 0, 0, 0, 1, 1,
0.1956921, 1.34006, 0.8161455, 0, 0, 0, 1, 1,
0.2024665, -0.5241614, 1.867084, 0, 0, 0, 1, 1,
0.2080999, -0.2432741, 1.217942, 0, 0, 0, 1, 1,
0.2086513, -0.7255093, 1.528486, 0, 0, 0, 1, 1,
0.2134459, 0.0003083975, 1.812949, 0, 0, 0, 1, 1,
0.2144943, -0.7400256, 2.987381, 1, 1, 1, 1, 1,
0.2154126, 0.3902045, 0.3255351, 1, 1, 1, 1, 1,
0.2169357, -0.1564375, 2.95871, 1, 1, 1, 1, 1,
0.218233, 0.07874876, 2.74048, 1, 1, 1, 1, 1,
0.2184173, -1.289532, 2.476845, 1, 1, 1, 1, 1,
0.2187961, 0.3649366, 1.680189, 1, 1, 1, 1, 1,
0.2243178, -0.08040304, 2.077857, 1, 1, 1, 1, 1,
0.2253121, -0.647571, 3.695717, 1, 1, 1, 1, 1,
0.2340754, -0.1042924, 1.848378, 1, 1, 1, 1, 1,
0.2353127, 1.343306, 1.124366, 1, 1, 1, 1, 1,
0.2380365, 0.4135333, 1.149191, 1, 1, 1, 1, 1,
0.2389796, 0.7793316, 1.752697, 1, 1, 1, 1, 1,
0.2413985, -0.02743051, 0.4664966, 1, 1, 1, 1, 1,
0.2501324, 0.008542807, 1.422518, 1, 1, 1, 1, 1,
0.2528141, -0.6360333, 2.382296, 1, 1, 1, 1, 1,
0.2540696, 2.285755, -0.9666557, 0, 0, 1, 1, 1,
0.254152, -1.004187, 3.745018, 1, 0, 0, 1, 1,
0.2564918, -0.8791101, 2.851887, 1, 0, 0, 1, 1,
0.2595702, 1.309947, 2.549793, 1, 0, 0, 1, 1,
0.2596059, 2.558614, 2.053173, 1, 0, 0, 1, 1,
0.2634511, 0.5623341, 1.395347, 1, 0, 0, 1, 1,
0.2639685, -1.372776, 1.046984, 0, 0, 0, 1, 1,
0.2660203, 1.352523, -0.08697322, 0, 0, 0, 1, 1,
0.2670031, 0.1682333, 2.446291, 0, 0, 0, 1, 1,
0.2696229, -0.5251438, 3.729161, 0, 0, 0, 1, 1,
0.274855, -0.6014706, 3.601615, 0, 0, 0, 1, 1,
0.2756023, 0.04672823, 2.215182, 0, 0, 0, 1, 1,
0.2798821, 0.8747961, -0.4160647, 0, 0, 0, 1, 1,
0.2800148, 0.7834483, 0.4516933, 1, 1, 1, 1, 1,
0.2912479, -1.412517, 4.8612, 1, 1, 1, 1, 1,
0.292047, -1.131542, 3.29473, 1, 1, 1, 1, 1,
0.2929153, -0.2891527, 2.019823, 1, 1, 1, 1, 1,
0.2930064, 0.6775454, 1.292653, 1, 1, 1, 1, 1,
0.3020823, 0.6714271, -1.256498, 1, 1, 1, 1, 1,
0.3021524, 1.777081, 0.0725946, 1, 1, 1, 1, 1,
0.3047218, 0.3861742, 0.5498284, 1, 1, 1, 1, 1,
0.3088883, 2.260084, -0.4677603, 1, 1, 1, 1, 1,
0.310348, 2.290108, 0.4470177, 1, 1, 1, 1, 1,
0.3193383, -0.1664326, 1.513572, 1, 1, 1, 1, 1,
0.3231475, 0.06529512, 1.649551, 1, 1, 1, 1, 1,
0.3233065, 0.8928666, 1.943466, 1, 1, 1, 1, 1,
0.3242632, 0.005249512, 0.4333259, 1, 1, 1, 1, 1,
0.3256767, 1.410919, 1.139344, 1, 1, 1, 1, 1,
0.3307884, -2.418405, 2.383162, 0, 0, 1, 1, 1,
0.3394428, -1.378847, 2.618989, 1, 0, 0, 1, 1,
0.3413012, 0.05773097, 2.817426, 1, 0, 0, 1, 1,
0.3443417, -0.7330713, 2.164421, 1, 0, 0, 1, 1,
0.3502842, 0.007582596, -0.1909389, 1, 0, 0, 1, 1,
0.3576035, -0.09421863, 1.053103, 1, 0, 0, 1, 1,
0.3601952, 0.7676827, -1.209308, 0, 0, 0, 1, 1,
0.3632119, 0.8790575, 1.661779, 0, 0, 0, 1, 1,
0.3635857, -0.103155, 2.377457, 0, 0, 0, 1, 1,
0.3654059, -1.356434, 0.6410218, 0, 0, 0, 1, 1,
0.3657458, 0.8923959, 1.266993, 0, 0, 0, 1, 1,
0.3769331, -0.6809339, 3.931897, 0, 0, 0, 1, 1,
0.3780893, 2.765632, -0.0196084, 0, 0, 0, 1, 1,
0.378748, -1.936765, 2.239887, 1, 1, 1, 1, 1,
0.3795745, -0.7819586, 2.871146, 1, 1, 1, 1, 1,
0.3807981, -2.170453, 1.131188, 1, 1, 1, 1, 1,
0.3817729, 1.193748, -0.6526731, 1, 1, 1, 1, 1,
0.3825469, 0.7489062, 1.020373, 1, 1, 1, 1, 1,
0.3826523, 0.9570574, 0.4387837, 1, 1, 1, 1, 1,
0.3849235, -0.2777182, 2.97983, 1, 1, 1, 1, 1,
0.3880015, 0.537594, 0.04654548, 1, 1, 1, 1, 1,
0.3891504, 0.5848078, -0.2140961, 1, 1, 1, 1, 1,
0.3931849, -1.443857, 2.929342, 1, 1, 1, 1, 1,
0.3933614, -1.213507, 4.122653, 1, 1, 1, 1, 1,
0.3951538, -0.1280978, 3.474572, 1, 1, 1, 1, 1,
0.3968071, -0.9143872, 4.868239, 1, 1, 1, 1, 1,
0.39849, 0.1242906, 1.189617, 1, 1, 1, 1, 1,
0.4023991, 1.236306, 0.2030622, 1, 1, 1, 1, 1,
0.4034566, -0.9575366, 2.179623, 0, 0, 1, 1, 1,
0.4112229, -0.451912, 2.924584, 1, 0, 0, 1, 1,
0.4126328, 1.021959, 1.218142, 1, 0, 0, 1, 1,
0.4170037, -0.4200822, 2.226549, 1, 0, 0, 1, 1,
0.4183451, 0.4913289, 1.056662, 1, 0, 0, 1, 1,
0.4217245, -1.255649, 3.294313, 1, 0, 0, 1, 1,
0.4228271, 0.9083256, -0.333884, 0, 0, 0, 1, 1,
0.4243603, 0.4389786, 0.313761, 0, 0, 0, 1, 1,
0.4280489, -0.213562, 2.318627, 0, 0, 0, 1, 1,
0.4384419, -0.2839562, 2.594844, 0, 0, 0, 1, 1,
0.4385784, 0.1421826, 1.641833, 0, 0, 0, 1, 1,
0.4407772, 1.343452, -0.03390156, 0, 0, 0, 1, 1,
0.4435003, -0.1663372, 0.6177707, 0, 0, 0, 1, 1,
0.4457141, -0.07811439, 3.311639, 1, 1, 1, 1, 1,
0.44947, -0.5526748, 1.660131, 1, 1, 1, 1, 1,
0.4614908, -1.009217, 2.89439, 1, 1, 1, 1, 1,
0.4628896, -0.8281355, 2.987424, 1, 1, 1, 1, 1,
0.4703676, 0.6461337, 0.5459249, 1, 1, 1, 1, 1,
0.471425, 0.05330445, -0.5649782, 1, 1, 1, 1, 1,
0.4755464, 0.2817793, 1.989721, 1, 1, 1, 1, 1,
0.4756805, 0.4020836, 0.1599252, 1, 1, 1, 1, 1,
0.4764472, -1.349635, 3.003026, 1, 1, 1, 1, 1,
0.4805557, -0.409683, 3.556432, 1, 1, 1, 1, 1,
0.4843239, 1.655166, 0.6577287, 1, 1, 1, 1, 1,
0.4866177, -0.3099067, 2.11938, 1, 1, 1, 1, 1,
0.4870892, 0.2590881, 1.052602, 1, 1, 1, 1, 1,
0.4896282, 0.4075339, 1.170621, 1, 1, 1, 1, 1,
0.4933591, -1.089583, 2.682996, 1, 1, 1, 1, 1,
0.493436, -1.199903, 2.859856, 0, 0, 1, 1, 1,
0.493486, -2.28823, 2.027478, 1, 0, 0, 1, 1,
0.496275, -0.8921496, 4.337029, 1, 0, 0, 1, 1,
0.4971338, 0.6030528, 2.5304, 1, 0, 0, 1, 1,
0.4978229, 0.4196571, 0.2156918, 1, 0, 0, 1, 1,
0.5036263, -0.9743052, 1.893167, 1, 0, 0, 1, 1,
0.5059701, 1.268447, -0.3521166, 0, 0, 0, 1, 1,
0.511102, 0.5551111, 0.03801385, 0, 0, 0, 1, 1,
0.5171725, 0.03443762, 0.5962972, 0, 0, 0, 1, 1,
0.5236489, -1.561714, 2.635168, 0, 0, 0, 1, 1,
0.5238814, 1.000427, -0.4093838, 0, 0, 0, 1, 1,
0.5247632, 0.005678122, 0.3793324, 0, 0, 0, 1, 1,
0.5248236, -0.009377895, 2.74781, 0, 0, 0, 1, 1,
0.5286998, -3.406718, 3.602125, 1, 1, 1, 1, 1,
0.5288106, 0.5950605, 2.21257, 1, 1, 1, 1, 1,
0.5308494, 0.5312483, 0.7574263, 1, 1, 1, 1, 1,
0.5329214, 2.059697, -0.9731928, 1, 1, 1, 1, 1,
0.5347254, 1.179582, -0.8925912, 1, 1, 1, 1, 1,
0.5384724, 1.349657, 0.5448174, 1, 1, 1, 1, 1,
0.5409721, -0.318486, 3.612779, 1, 1, 1, 1, 1,
0.5417786, 0.577119, 1.429248, 1, 1, 1, 1, 1,
0.545957, 0.0186973, 1.821976, 1, 1, 1, 1, 1,
0.5460033, -0.5063597, 1.199458, 1, 1, 1, 1, 1,
0.5556755, -1.792754, 4.483897, 1, 1, 1, 1, 1,
0.5610098, -0.03802716, 1.927523, 1, 1, 1, 1, 1,
0.5679346, 0.03951036, 0.6742533, 1, 1, 1, 1, 1,
0.5711018, 0.4795876, 1.684459, 1, 1, 1, 1, 1,
0.5770615, 0.4066074, 0.131742, 1, 1, 1, 1, 1,
0.5794089, -0.352865, 2.458769, 0, 0, 1, 1, 1,
0.5821791, -0.5199423, -0.0807245, 1, 0, 0, 1, 1,
0.5844555, 0.1988033, 1.819975, 1, 0, 0, 1, 1,
0.5872937, -0.8551942, 4.365097, 1, 0, 0, 1, 1,
0.5919906, 1.560362, 0.2277203, 1, 0, 0, 1, 1,
0.5933202, -0.3063586, 3.957772, 1, 0, 0, 1, 1,
0.5975469, -1.473477, 2.561255, 0, 0, 0, 1, 1,
0.6098261, -0.6769503, 0.3385367, 0, 0, 0, 1, 1,
0.6101614, 1.375587, 0.5951369, 0, 0, 0, 1, 1,
0.6148472, 0.6824601, 0.8659801, 0, 0, 0, 1, 1,
0.6182436, -0.4570749, 3.017472, 0, 0, 0, 1, 1,
0.6302183, 1.502702, -0.5913926, 0, 0, 0, 1, 1,
0.6314033, -0.5687879, 3.390374, 0, 0, 0, 1, 1,
0.6314545, 0.9340326, 0.1102656, 1, 1, 1, 1, 1,
0.6349262, 1.007388, 1.890198, 1, 1, 1, 1, 1,
0.6354892, -0.7728407, 3.044617, 1, 1, 1, 1, 1,
0.6464081, 0.2230237, 0.4944757, 1, 1, 1, 1, 1,
0.647187, -0.7249178, 3.85267, 1, 1, 1, 1, 1,
0.6493301, -1.599689, 4.366972, 1, 1, 1, 1, 1,
0.6495767, 0.1624458, 1.123324, 1, 1, 1, 1, 1,
0.652253, 1.705032, 0.7045383, 1, 1, 1, 1, 1,
0.6639048, 0.8697397, -0.005696347, 1, 1, 1, 1, 1,
0.6645028, 1.333757, -0.5545609, 1, 1, 1, 1, 1,
0.6676645, -0.2097778, 1.748438, 1, 1, 1, 1, 1,
0.6678348, 0.1062731, 0.563436, 1, 1, 1, 1, 1,
0.6694323, 0.8086812, -0.9519334, 1, 1, 1, 1, 1,
0.6696997, 1.023981, 0.1681506, 1, 1, 1, 1, 1,
0.6709484, 0.7591312, -0.4773667, 1, 1, 1, 1, 1,
0.6712577, 0.8031364, 1.469978, 0, 0, 1, 1, 1,
0.6713573, -0.1898649, 3.108891, 1, 0, 0, 1, 1,
0.6718395, -1.829896, 3.058509, 1, 0, 0, 1, 1,
0.6818767, 0.2947602, 1.230983, 1, 0, 0, 1, 1,
0.6822692, -0.2610496, 0.4039188, 1, 0, 0, 1, 1,
0.6826631, -0.7261104, 0.4870158, 1, 0, 0, 1, 1,
0.6918492, -1.976078, 2.98909, 0, 0, 0, 1, 1,
0.6920153, -0.4441546, 0.6717556, 0, 0, 0, 1, 1,
0.7036535, 0.5679817, 0.4210713, 0, 0, 0, 1, 1,
0.7053431, 1.805865, 0.731442, 0, 0, 0, 1, 1,
0.7086878, 1.209281, 0.370981, 0, 0, 0, 1, 1,
0.7167466, -0.6476225, 2.298321, 0, 0, 0, 1, 1,
0.7197934, -0.2735072, 1.531306, 0, 0, 0, 1, 1,
0.7238156, 0.06430212, -0.006462294, 1, 1, 1, 1, 1,
0.7243881, 0.9393339, 2.211614, 1, 1, 1, 1, 1,
0.7261594, -1.793118, 2.10507, 1, 1, 1, 1, 1,
0.7274442, -0.3932228, 2.121769, 1, 1, 1, 1, 1,
0.7297649, 1.163723, 0.7205681, 1, 1, 1, 1, 1,
0.7317892, -1.18293, 0.3673487, 1, 1, 1, 1, 1,
0.7344887, -1.771695, 2.157454, 1, 1, 1, 1, 1,
0.7365023, -0.2723341, 2.762802, 1, 1, 1, 1, 1,
0.739522, 0.9620576, 1.644291, 1, 1, 1, 1, 1,
0.7411656, -0.1236193, 2.857668, 1, 1, 1, 1, 1,
0.7445315, 0.742088, 0.548734, 1, 1, 1, 1, 1,
0.7460309, 1.384922, 1.515086, 1, 1, 1, 1, 1,
0.7492859, -0.7754083, 2.490935, 1, 1, 1, 1, 1,
0.749634, 0.2211872, -0.04627469, 1, 1, 1, 1, 1,
0.7511912, 0.5829709, 2.376483, 1, 1, 1, 1, 1,
0.7526771, -0.6735913, 2.518699, 0, 0, 1, 1, 1,
0.7611788, 1.354867, -0.696328, 1, 0, 0, 1, 1,
0.7614535, -0.5011257, 2.447215, 1, 0, 0, 1, 1,
0.7624317, 0.02379294, 0.9324969, 1, 0, 0, 1, 1,
0.7625473, -2.450282, 3.087809, 1, 0, 0, 1, 1,
0.767767, 0.3060502, 2.517775, 1, 0, 0, 1, 1,
0.7693076, -0.1163998, 1.230479, 0, 0, 0, 1, 1,
0.7710661, -1.517674, 2.677869, 0, 0, 0, 1, 1,
0.7776053, 1.489942, -1.492175, 0, 0, 0, 1, 1,
0.7786059, 0.3629573, 0.1894969, 0, 0, 0, 1, 1,
0.7836357, -1.496011, 2.49323, 0, 0, 0, 1, 1,
0.7858796, 0.4179878, 2.118707, 0, 0, 0, 1, 1,
0.7888101, -1.166212, 1.523708, 0, 0, 0, 1, 1,
0.7902201, -1.174291, 0.7570075, 1, 1, 1, 1, 1,
0.8043723, -1.287122, 3.556919, 1, 1, 1, 1, 1,
0.8059425, 0.2444856, 2.115628, 1, 1, 1, 1, 1,
0.8085332, 1.045828, 0.8491341, 1, 1, 1, 1, 1,
0.8095382, 0.8374387, 0.03332197, 1, 1, 1, 1, 1,
0.810913, -1.079327, 1.162841, 1, 1, 1, 1, 1,
0.8159657, 1.490063, -0.166424, 1, 1, 1, 1, 1,
0.8209864, 0.1598754, 1.439461, 1, 1, 1, 1, 1,
0.8348671, 0.005315202, 2.427351, 1, 1, 1, 1, 1,
0.8355086, -0.06717651, 2.585731, 1, 1, 1, 1, 1,
0.8369254, -0.5326839, 1.128672, 1, 1, 1, 1, 1,
0.8416343, -1.632674, 2.951919, 1, 1, 1, 1, 1,
0.8426359, 0.5955537, -0.2291659, 1, 1, 1, 1, 1,
0.8432554, 0.5517219, 0.4989672, 1, 1, 1, 1, 1,
0.8448552, 0.8274239, 2.0844, 1, 1, 1, 1, 1,
0.8507479, 0.3628867, 0.9966479, 0, 0, 1, 1, 1,
0.8518377, -1.60962, 2.464107, 1, 0, 0, 1, 1,
0.8524035, -0.08837183, 0.824544, 1, 0, 0, 1, 1,
0.855356, -0.6967418, -0.338271, 1, 0, 0, 1, 1,
0.8573518, -0.03682722, 1.622902, 1, 0, 0, 1, 1,
0.8597969, 0.8937707, 2.379251, 1, 0, 0, 1, 1,
0.8627785, 0.2480184, 1.025828, 0, 0, 0, 1, 1,
0.8634559, -0.5190263, 2.420289, 0, 0, 0, 1, 1,
0.8645419, -0.3769874, 2.508355, 0, 0, 0, 1, 1,
0.876112, 0.7250252, -1.623766, 0, 0, 0, 1, 1,
0.8766285, 0.7466406, 0.2397753, 0, 0, 0, 1, 1,
0.8808804, 0.2003913, 2.831227, 0, 0, 0, 1, 1,
0.8843404, 1.304349, 1.528155, 0, 0, 0, 1, 1,
0.8864697, -0.09535015, 3.140654, 1, 1, 1, 1, 1,
0.8959226, -1.166986, 2.263443, 1, 1, 1, 1, 1,
0.8970644, 0.31143, 1.880203, 1, 1, 1, 1, 1,
0.9036133, -1.592219, 1.881952, 1, 1, 1, 1, 1,
0.9038479, -0.9937857, 1.46274, 1, 1, 1, 1, 1,
0.9044231, -0.4825331, 2.823927, 1, 1, 1, 1, 1,
0.9050737, 1.275019, 0.8687161, 1, 1, 1, 1, 1,
0.910771, -0.8448641, 2.554381, 1, 1, 1, 1, 1,
0.9110138, 0.5020925, 0.9333223, 1, 1, 1, 1, 1,
0.9110264, -0.510628, 2.082334, 1, 1, 1, 1, 1,
0.9276354, -2.160821, 3.887335, 1, 1, 1, 1, 1,
0.930913, 0.2688777, 0.1318078, 1, 1, 1, 1, 1,
0.9405312, 2.01516, 0.1357358, 1, 1, 1, 1, 1,
0.9482957, -1.640407, 2.749121, 1, 1, 1, 1, 1,
0.9490978, -1.997482, 2.29663, 1, 1, 1, 1, 1,
0.9541547, -0.8856603, 2.885903, 0, 0, 1, 1, 1,
0.9565499, 1.479133, 0.9213496, 1, 0, 0, 1, 1,
0.9587364, 0.3454604, 2.391661, 1, 0, 0, 1, 1,
0.9619183, -0.3980974, 1.522056, 1, 0, 0, 1, 1,
0.9638793, 0.462708, -0.6288085, 1, 0, 0, 1, 1,
0.9658628, 0.6152, 1.47243, 1, 0, 0, 1, 1,
0.9692904, -1.3053, 1.075359, 0, 0, 0, 1, 1,
0.972873, 1.25178, 1.474851, 0, 0, 0, 1, 1,
0.9755333, -0.7207873, 2.27277, 0, 0, 0, 1, 1,
0.9808825, 0.2450144, 2.985024, 0, 0, 0, 1, 1,
0.9822407, -2.109423, 4.197615, 0, 0, 0, 1, 1,
0.9827712, 0.5854901, -0.1429051, 0, 0, 0, 1, 1,
0.9831007, 1.081504, -0.5365978, 0, 0, 0, 1, 1,
0.983401, -0.4417022, 1.571075, 1, 1, 1, 1, 1,
0.9840975, 0.6122372, 1.141416, 1, 1, 1, 1, 1,
0.9894779, 0.0588522, 0.8784156, 1, 1, 1, 1, 1,
0.9961546, 0.8312876, 2.74605, 1, 1, 1, 1, 1,
0.9973437, -0.9592609, 2.572572, 1, 1, 1, 1, 1,
0.997393, 0.4683357, 1.23656, 1, 1, 1, 1, 1,
0.9988431, 0.9506127, 2.137294, 1, 1, 1, 1, 1,
1.008419, 0.5001315, 1.833858, 1, 1, 1, 1, 1,
1.009943, -0.03476303, 2.055363, 1, 1, 1, 1, 1,
1.023089, 0.1150296, 1.503771, 1, 1, 1, 1, 1,
1.024053, 0.2891087, 2.317159, 1, 1, 1, 1, 1,
1.029645, 0.8323295, 1.760161, 1, 1, 1, 1, 1,
1.030608, 1.219553, 1.42913, 1, 1, 1, 1, 1,
1.036598, 1.481696, 0.7982533, 1, 1, 1, 1, 1,
1.042078, 2.109135, 0.8135771, 1, 1, 1, 1, 1,
1.061677, 0.116797, 2.029503, 0, 0, 1, 1, 1,
1.064934, -0.5854387, 2.981248, 1, 0, 0, 1, 1,
1.065387, 1.638727, -0.335097, 1, 0, 0, 1, 1,
1.067762, 0.4861598, 0.757596, 1, 0, 0, 1, 1,
1.070765, 1.63869, -0.3699302, 1, 0, 0, 1, 1,
1.07797, 0.1359951, 0.00390834, 1, 0, 0, 1, 1,
1.080403, 0.791355, 1.704607, 0, 0, 0, 1, 1,
1.080726, -2.646034, 2.050867, 0, 0, 0, 1, 1,
1.082448, 0.7540109, -1.001705, 0, 0, 0, 1, 1,
1.088068, -0.08890674, 0.6582296, 0, 0, 0, 1, 1,
1.092613, 1.090904, 3.396678, 0, 0, 0, 1, 1,
1.094508, 1.239671, 0.164015, 0, 0, 0, 1, 1,
1.095815, 0.8942476, 0.1046424, 0, 0, 0, 1, 1,
1.097428, 0.1502422, 0.001051099, 1, 1, 1, 1, 1,
1.09877, 0.7702388, -0.8382785, 1, 1, 1, 1, 1,
1.116825, -0.1947043, 0.6402001, 1, 1, 1, 1, 1,
1.122486, -0.02580846, 1.645449, 1, 1, 1, 1, 1,
1.123567, -1.094498, 3.119823, 1, 1, 1, 1, 1,
1.126202, -0.3488881, 1.185292, 1, 1, 1, 1, 1,
1.126837, -0.04955986, 1.94886, 1, 1, 1, 1, 1,
1.128949, 0.3893685, 0.841439, 1, 1, 1, 1, 1,
1.134737, -1.810021, 2.978421, 1, 1, 1, 1, 1,
1.142229, 0.509716, 1.813275, 1, 1, 1, 1, 1,
1.142431, 1.393984, 0.7731196, 1, 1, 1, 1, 1,
1.14582, 1.884814, 2.293191, 1, 1, 1, 1, 1,
1.145963, -0.04863189, 1.636452, 1, 1, 1, 1, 1,
1.147095, -0.1566809, 2.249831, 1, 1, 1, 1, 1,
1.148016, 0.7246054, 0.3173151, 1, 1, 1, 1, 1,
1.152819, 0.08344161, 2.373076, 0, 0, 1, 1, 1,
1.15473, 0.4414204, 2.25966, 1, 0, 0, 1, 1,
1.155671, -0.8887879, 3.880976, 1, 0, 0, 1, 1,
1.157704, 0.005810849, 0.8920277, 1, 0, 0, 1, 1,
1.162375, 0.7342462, 0.8376901, 1, 0, 0, 1, 1,
1.167776, 1.710378, -0.368102, 1, 0, 0, 1, 1,
1.16956, -0.4544613, 2.855596, 0, 0, 0, 1, 1,
1.180187, 0.1326368, 0.8663286, 0, 0, 0, 1, 1,
1.189253, 0.6531575, 0.9583979, 0, 0, 0, 1, 1,
1.195194, 0.5539781, 1.219564, 0, 0, 0, 1, 1,
1.198129, 0.1702558, 2.250404, 0, 0, 0, 1, 1,
1.199616, 0.2171099, 2.341879, 0, 0, 0, 1, 1,
1.204647, -0.3925609, 1.465359, 0, 0, 0, 1, 1,
1.210568, 1.870006, 0.8371288, 1, 1, 1, 1, 1,
1.219074, -1.32907, 3.309635, 1, 1, 1, 1, 1,
1.224964, 1.11036, 1.655354, 1, 1, 1, 1, 1,
1.227759, 1.896155, 0.8199791, 1, 1, 1, 1, 1,
1.234447, 0.2618338, 2.883126, 1, 1, 1, 1, 1,
1.23665, 0.9887104, 2.3333, 1, 1, 1, 1, 1,
1.237441, 0.2834108, 1.4122, 1, 1, 1, 1, 1,
1.240285, 0.4909486, 0.5260062, 1, 1, 1, 1, 1,
1.253722, -0.7918436, 1.882407, 1, 1, 1, 1, 1,
1.255992, -1.304582, 1.989177, 1, 1, 1, 1, 1,
1.258087, 0.6818072, -0.3108597, 1, 1, 1, 1, 1,
1.261761, -0.0403697, 0.2748645, 1, 1, 1, 1, 1,
1.270535, 0.7031088, 1.485133, 1, 1, 1, 1, 1,
1.276853, -0.9129972, 0.6123393, 1, 1, 1, 1, 1,
1.289389, 0.2169004, -0.3713028, 1, 1, 1, 1, 1,
1.297105, 0.6334328, 0.8238185, 0, 0, 1, 1, 1,
1.303494, 0.3970422, 1.418323, 1, 0, 0, 1, 1,
1.306053, 0.4319839, 2.180492, 1, 0, 0, 1, 1,
1.310513, -0.6450588, 1.565437, 1, 0, 0, 1, 1,
1.311546, 0.3174853, 0.1288864, 1, 0, 0, 1, 1,
1.312773, 0.5154873, 0.7469535, 1, 0, 0, 1, 1,
1.313802, 0.7572862, 0.7514917, 0, 0, 0, 1, 1,
1.315601, 0.1351443, 1.719337, 0, 0, 0, 1, 1,
1.319473, -1.139826, 2.514189, 0, 0, 0, 1, 1,
1.327179, -1.371486, 1.201385, 0, 0, 0, 1, 1,
1.330547, -0.6505775, 2.02057, 0, 0, 0, 1, 1,
1.332009, 0.4755313, 1.931306, 0, 0, 0, 1, 1,
1.333652, -0.02905788, 1.688975, 0, 0, 0, 1, 1,
1.3355, 1.161039, 1.06347, 1, 1, 1, 1, 1,
1.343239, -1.139669, 1.768089, 1, 1, 1, 1, 1,
1.373045, 0.2166803, 2.374962, 1, 1, 1, 1, 1,
1.373597, 0.3657932, 0.8280811, 1, 1, 1, 1, 1,
1.378642, -1.00383, 0.4474889, 1, 1, 1, 1, 1,
1.37887, -1.503393, 1.783836, 1, 1, 1, 1, 1,
1.380164, 0.3311649, 0.6494128, 1, 1, 1, 1, 1,
1.38746, 0.5347419, 2.349252, 1, 1, 1, 1, 1,
1.393971, -0.1611885, 1.598986, 1, 1, 1, 1, 1,
1.394702, -1.266161, 2.826236, 1, 1, 1, 1, 1,
1.399396, -0.579625, 2.555137, 1, 1, 1, 1, 1,
1.40784, -0.6308306, -0.8467351, 1, 1, 1, 1, 1,
1.413652, -0.5243135, 3.194254, 1, 1, 1, 1, 1,
1.414327, 0.8866439, -0.3783643, 1, 1, 1, 1, 1,
1.421909, 0.8341694, 1.791174, 1, 1, 1, 1, 1,
1.423341, -0.7313738, 2.763309, 0, 0, 1, 1, 1,
1.428511, -1.872803, 1.982813, 1, 0, 0, 1, 1,
1.430196, 2.082938, 1.041562, 1, 0, 0, 1, 1,
1.430805, 0.1783871, 2.004953, 1, 0, 0, 1, 1,
1.433846, -1.31738, 0.9396349, 1, 0, 0, 1, 1,
1.440448, 1.298841, 1.691385, 1, 0, 0, 1, 1,
1.441187, 0.3831722, 0.896648, 0, 0, 0, 1, 1,
1.450695, -0.6227162, 1.606261, 0, 0, 0, 1, 1,
1.450911, -0.5630072, 2.767523, 0, 0, 0, 1, 1,
1.467301, 0.07416629, 2.731753, 0, 0, 0, 1, 1,
1.475551, 0.5481153, 2.220141, 0, 0, 0, 1, 1,
1.484897, 0.3694569, 3.843547, 0, 0, 0, 1, 1,
1.48737, -0.05219768, 0.001132632, 0, 0, 0, 1, 1,
1.489453, 0.8698255, 1.147026, 1, 1, 1, 1, 1,
1.496853, 0.9652358, 2.105766, 1, 1, 1, 1, 1,
1.523759, -0.1923108, 2.105163, 1, 1, 1, 1, 1,
1.524435, -0.3767277, 0.06284493, 1, 1, 1, 1, 1,
1.537091, 1.092665, 1.98215, 1, 1, 1, 1, 1,
1.539747, 0.5617546, 2.40647, 1, 1, 1, 1, 1,
1.543049, -0.7019954, -0.3495109, 1, 1, 1, 1, 1,
1.543504, -0.397359, 2.251215, 1, 1, 1, 1, 1,
1.547298, -0.5629649, 1.397199, 1, 1, 1, 1, 1,
1.54761, -0.4524051, 3.890996, 1, 1, 1, 1, 1,
1.547921, 0.01051439, 1.853907, 1, 1, 1, 1, 1,
1.565441, -0.333545, 0.3904871, 1, 1, 1, 1, 1,
1.576964, -1.574414, 2.652715, 1, 1, 1, 1, 1,
1.577946, 0.03843695, 2.869914, 1, 1, 1, 1, 1,
1.595922, -0.1287846, 1.984847, 1, 1, 1, 1, 1,
1.608997, -0.9430999, 2.742691, 0, 0, 1, 1, 1,
1.6105, -1.329885, 3.76925, 1, 0, 0, 1, 1,
1.621083, 0.7603558, 1.311097, 1, 0, 0, 1, 1,
1.625145, 1.264181, 1.229532, 1, 0, 0, 1, 1,
1.630767, 1.178916, 0.3920354, 1, 0, 0, 1, 1,
1.632735, 0.1649144, 1.137301, 1, 0, 0, 1, 1,
1.63997, 0.06238988, 0.137343, 0, 0, 0, 1, 1,
1.675627, 0.7548456, 2.495097, 0, 0, 0, 1, 1,
1.699751, 0.4909949, 2.829327, 0, 0, 0, 1, 1,
1.729815, 1.126255, 2.358133, 0, 0, 0, 1, 1,
1.747644, -0.136475, 0.4758962, 0, 0, 0, 1, 1,
1.752289, 0.8609951, 0.8035344, 0, 0, 0, 1, 1,
1.764505, -1.442207, 2.399662, 0, 0, 0, 1, 1,
1.768119, 1.065429, 2.045691, 1, 1, 1, 1, 1,
1.774537, -1.905679, 0.9349024, 1, 1, 1, 1, 1,
1.826891, -2.490688, 3.452499, 1, 1, 1, 1, 1,
1.842364, -0.5936567, 0.6385436, 1, 1, 1, 1, 1,
1.86652, 1.407299, -0.5655323, 1, 1, 1, 1, 1,
1.892254, 0.420462, 0.8859655, 1, 1, 1, 1, 1,
1.896335, 1.177143, -0.06828801, 1, 1, 1, 1, 1,
1.896413, -0.4024772, 3.54392, 1, 1, 1, 1, 1,
1.915706, -0.2921108, 2.900605, 1, 1, 1, 1, 1,
1.96844, 0.7579026, 1.5253, 1, 1, 1, 1, 1,
1.972896, 1.669636, 0.9329978, 1, 1, 1, 1, 1,
1.987111, -0.2974897, 3.036626, 1, 1, 1, 1, 1,
2.022782, -0.3525171, 3.144555, 1, 1, 1, 1, 1,
2.026142, -1.481673, 2.164382, 1, 1, 1, 1, 1,
2.051945, 1.372418, -0.1143569, 1, 1, 1, 1, 1,
2.062177, -0.5763517, 1.549185, 0, 0, 1, 1, 1,
2.128156, 0.019622, 2.291418, 1, 0, 0, 1, 1,
2.171633, -0.5875003, 4.042809, 1, 0, 0, 1, 1,
2.180581, -0.1446944, 1.533821, 1, 0, 0, 1, 1,
2.216767, -0.6844509, 0.3529652, 1, 0, 0, 1, 1,
2.260283, -0.8141087, 1.532427, 1, 0, 0, 1, 1,
2.280325, -0.4332129, 3.681315, 0, 0, 0, 1, 1,
2.291503, -1.082361, 2.974185, 0, 0, 0, 1, 1,
2.299168, 1.977672, 1.428034, 0, 0, 0, 1, 1,
2.309029, 2.464779, 0.1086694, 0, 0, 0, 1, 1,
2.320875, 0.8706083, 1.388655, 0, 0, 0, 1, 1,
2.363227, 1.39211, 0.08557963, 0, 0, 0, 1, 1,
2.380069, 0.3360123, 0.6232135, 0, 0, 0, 1, 1,
2.478242, 0.01112825, 2.035437, 1, 1, 1, 1, 1,
2.557144, 2.207486, -1.166708, 1, 1, 1, 1, 1,
2.595243, -2.814835, 3.506009, 1, 1, 1, 1, 1,
2.696082, 1.724331, 0.2444573, 1, 1, 1, 1, 1,
2.840555, 0.3298173, -0.1082011, 1, 1, 1, 1, 1,
3.118499, -0.8972952, 0.1397639, 1, 1, 1, 1, 1,
3.146515, -0.9174055, 2.760808, 1, 1, 1, 1, 1
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
var radius = 9.482721;
var distance = 33.30766;
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
mvMatrix.translate( 0.1351249, 0.2929914, -0.2371292 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.30766);
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
