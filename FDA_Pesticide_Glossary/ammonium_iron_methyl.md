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
-3.263292, 0.2136271, -1.583883, 1, 0, 0, 1,
-2.518934, 0.2066742, 0.2643012, 1, 0.007843138, 0, 1,
-2.469423, 0.6147617, -0.7531531, 1, 0.01176471, 0, 1,
-2.450553, 2.08893, -1.162078, 1, 0.01960784, 0, 1,
-2.443067, -0.1284624, -1.945171, 1, 0.02352941, 0, 1,
-2.431849, 0.9634287, 0.7777016, 1, 0.03137255, 0, 1,
-2.36484, 1.043745, 0.6095544, 1, 0.03529412, 0, 1,
-2.313912, 0.7404098, 0.541979, 1, 0.04313726, 0, 1,
-2.308272, 0.8198715, -3.119125, 1, 0.04705882, 0, 1,
-2.247769, 0.1224401, -3.742366, 1, 0.05490196, 0, 1,
-2.243956, -0.7715418, -2.489104, 1, 0.05882353, 0, 1,
-2.183853, -0.2973591, -1.070036, 1, 0.06666667, 0, 1,
-2.171445, -0.4936512, -2.682861, 1, 0.07058824, 0, 1,
-2.16957, -0.03077825, -3.476995, 1, 0.07843138, 0, 1,
-2.144414, 1.150692, -0.4707527, 1, 0.08235294, 0, 1,
-2.129776, -1.170851, -1.957272, 1, 0.09019608, 0, 1,
-2.114803, -1.180438, -2.012213, 1, 0.09411765, 0, 1,
-2.103261, 1.587086, -0.572385, 1, 0.1019608, 0, 1,
-2.100264, 0.02545125, -2.203501, 1, 0.1098039, 0, 1,
-2.092745, -1.794769, -3.898845, 1, 0.1137255, 0, 1,
-2.076834, 0.1564939, -2.583925, 1, 0.1215686, 0, 1,
-2.069265, -0.1829281, -2.449936, 1, 0.1254902, 0, 1,
-2.017286, -0.1760658, -3.761413, 1, 0.1333333, 0, 1,
-1.978367, 1.33849, -1.571172, 1, 0.1372549, 0, 1,
-1.972284, -0.935644, -2.329649, 1, 0.145098, 0, 1,
-1.962854, 0.2526631, -1.104649, 1, 0.1490196, 0, 1,
-1.948367, -0.5891835, -1.588047, 1, 0.1568628, 0, 1,
-1.934435, 0.5133451, -1.726894, 1, 0.1607843, 0, 1,
-1.913579, 1.961052, -2.01245, 1, 0.1686275, 0, 1,
-1.883397, 0.7723344, -1.799922, 1, 0.172549, 0, 1,
-1.85094, 1.488198, -2.000571, 1, 0.1803922, 0, 1,
-1.823797, -0.1999134, -2.683435, 1, 0.1843137, 0, 1,
-1.784932, 0.6262451, -0.9933925, 1, 0.1921569, 0, 1,
-1.769891, -0.4908365, -3.064554, 1, 0.1960784, 0, 1,
-1.754653, 1.374895, -1.375705, 1, 0.2039216, 0, 1,
-1.746575, 0.997499, -0.6508985, 1, 0.2117647, 0, 1,
-1.740679, -1.491595, -3.885422, 1, 0.2156863, 0, 1,
-1.730986, -1.329005, -0.4157017, 1, 0.2235294, 0, 1,
-1.719516, 1.666406, -0.6151353, 1, 0.227451, 0, 1,
-1.713098, -1.766608, -3.630174, 1, 0.2352941, 0, 1,
-1.704488, -0.8700722, -1.112288, 1, 0.2392157, 0, 1,
-1.680993, 2.18993, -1.796968, 1, 0.2470588, 0, 1,
-1.6803, 0.6724441, -1.291257, 1, 0.2509804, 0, 1,
-1.673409, -0.04901581, -1.085088, 1, 0.2588235, 0, 1,
-1.664132, -0.2094909, -2.314481, 1, 0.2627451, 0, 1,
-1.635757, 0.853119, -1.494534, 1, 0.2705882, 0, 1,
-1.625686, -0.00262684, -2.362416, 1, 0.2745098, 0, 1,
-1.62237, -1.018397, -0.6403708, 1, 0.282353, 0, 1,
-1.60165, -1.710237, -3.137649, 1, 0.2862745, 0, 1,
-1.601358, -0.3425316, -1.787178, 1, 0.2941177, 0, 1,
-1.580175, 0.8977011, -0.009772848, 1, 0.3019608, 0, 1,
-1.570682, -1.053342, -2.04933, 1, 0.3058824, 0, 1,
-1.568456, -0.5084585, -1.933145, 1, 0.3137255, 0, 1,
-1.564156, -0.4608383, -1.133357, 1, 0.3176471, 0, 1,
-1.519145, 0.4906951, -1.128518, 1, 0.3254902, 0, 1,
-1.514269, 1.96382, -0.05411147, 1, 0.3294118, 0, 1,
-1.514086, 0.295813, -0.28578, 1, 0.3372549, 0, 1,
-1.512418, 1.003074, 1.104754, 1, 0.3411765, 0, 1,
-1.504792, -0.1933523, -2.507664, 1, 0.3490196, 0, 1,
-1.500075, 1.081389, -1.59638, 1, 0.3529412, 0, 1,
-1.493535, 1.079111, 0.8928626, 1, 0.3607843, 0, 1,
-1.483403, -0.4504912, -2.324306, 1, 0.3647059, 0, 1,
-1.465641, -0.6109481, -1.162079, 1, 0.372549, 0, 1,
-1.465343, -0.7128295, -1.687115, 1, 0.3764706, 0, 1,
-1.457602, -2.072274, -1.185032, 1, 0.3843137, 0, 1,
-1.450611, -0.6676564, -0.1547518, 1, 0.3882353, 0, 1,
-1.446834, -1.253931, -1.478198, 1, 0.3960784, 0, 1,
-1.445819, -0.5201013, -1.442765, 1, 0.4039216, 0, 1,
-1.442128, 0.3119127, -2.392607, 1, 0.4078431, 0, 1,
-1.435547, 0.1388754, -2.044677, 1, 0.4156863, 0, 1,
-1.4355, -0.2672963, -3.797864, 1, 0.4196078, 0, 1,
-1.432066, 0.693628, 0.0217711, 1, 0.427451, 0, 1,
-1.4217, 0.2765045, -1.995079, 1, 0.4313726, 0, 1,
-1.41937, 0.144757, -2.759334, 1, 0.4392157, 0, 1,
-1.41775, -0.8920984, -2.586648, 1, 0.4431373, 0, 1,
-1.416278, -0.9311482, -2.459712, 1, 0.4509804, 0, 1,
-1.411172, -0.2894378, -2.472943, 1, 0.454902, 0, 1,
-1.409391, -1.088384, -2.895748, 1, 0.4627451, 0, 1,
-1.404632, 0.585914, 0.3268622, 1, 0.4666667, 0, 1,
-1.401782, -0.5143245, -3.665795, 1, 0.4745098, 0, 1,
-1.372745, -0.4926467, -1.19459, 1, 0.4784314, 0, 1,
-1.369739, -0.02616663, -1.030416, 1, 0.4862745, 0, 1,
-1.355762, 1.486616, -0.3833489, 1, 0.4901961, 0, 1,
-1.352477, -0.6635823, -1.17105, 1, 0.4980392, 0, 1,
-1.346957, -1.121983, -1.756649, 1, 0.5058824, 0, 1,
-1.339771, 0.2277419, -1.928279, 1, 0.509804, 0, 1,
-1.33232, 0.7743903, -1.692162, 1, 0.5176471, 0, 1,
-1.327568, -1.224657, -3.474178, 1, 0.5215687, 0, 1,
-1.323873, -0.4096944, -2.858586, 1, 0.5294118, 0, 1,
-1.31995, -0.1774197, -2.357816, 1, 0.5333334, 0, 1,
-1.314136, -0.2269115, -2.389841, 1, 0.5411765, 0, 1,
-1.303658, -0.03775278, -1.50685, 1, 0.5450981, 0, 1,
-1.301994, -0.1320663, -0.8335495, 1, 0.5529412, 0, 1,
-1.297304, -0.2452123, -1.245163, 1, 0.5568628, 0, 1,
-1.287364, -0.1601091, -0.8685694, 1, 0.5647059, 0, 1,
-1.286633, 1.812678, -1.112477, 1, 0.5686275, 0, 1,
-1.276807, 0.03808211, -2.642588, 1, 0.5764706, 0, 1,
-1.271256, -2.245016, -4.912634, 1, 0.5803922, 0, 1,
-1.270732, 0.2127358, -0.9664098, 1, 0.5882353, 0, 1,
-1.269335, 0.8526881, -1.951914, 1, 0.5921569, 0, 1,
-1.2693, -0.1836485, -0.2697676, 1, 0.6, 0, 1,
-1.264702, 1.734676, -0.259967, 1, 0.6078432, 0, 1,
-1.264354, 0.465864, -3.533416, 1, 0.6117647, 0, 1,
-1.253536, -0.7058203, -0.5143989, 1, 0.6196079, 0, 1,
-1.250608, -0.2528412, -2.498085, 1, 0.6235294, 0, 1,
-1.249341, 0.5916566, -2.817317, 1, 0.6313726, 0, 1,
-1.24602, 0.1011844, -1.560574, 1, 0.6352941, 0, 1,
-1.241102, 0.4383107, -1.13418, 1, 0.6431373, 0, 1,
-1.241033, -0.8712439, -0.4741825, 1, 0.6470588, 0, 1,
-1.239812, -1.174793, -3.141767, 1, 0.654902, 0, 1,
-1.239131, 0.7802399, -0.6226676, 1, 0.6588235, 0, 1,
-1.234365, -0.2245473, -1.513831, 1, 0.6666667, 0, 1,
-1.231563, 1.603634, -0.5053833, 1, 0.6705883, 0, 1,
-1.229464, -0.1512137, -1.900769, 1, 0.6784314, 0, 1,
-1.206757, -0.1416103, -0.8251533, 1, 0.682353, 0, 1,
-1.206649, -1.1782, -1.82332, 1, 0.6901961, 0, 1,
-1.192927, -0.5349261, -1.215297, 1, 0.6941177, 0, 1,
-1.183132, 1.034706, -1.492463, 1, 0.7019608, 0, 1,
-1.181396, 0.09502894, -1.549685, 1, 0.7098039, 0, 1,
-1.181143, 0.4599874, -1.135512, 1, 0.7137255, 0, 1,
-1.177566, -2.245158, -1.743938, 1, 0.7215686, 0, 1,
-1.1726, -0.9519145, -3.001996, 1, 0.7254902, 0, 1,
-1.153227, -0.7437701, -1.38458, 1, 0.7333333, 0, 1,
-1.150554, 0.8803447, 0.08665337, 1, 0.7372549, 0, 1,
-1.149893, -0.5660173, -2.3982, 1, 0.7450981, 0, 1,
-1.146409, 0.5172819, -2.320514, 1, 0.7490196, 0, 1,
-1.141744, -0.6934023, -1.905846, 1, 0.7568628, 0, 1,
-1.141569, 0.3032097, -1.228003, 1, 0.7607843, 0, 1,
-1.135493, -0.1214067, -2.117076, 1, 0.7686275, 0, 1,
-1.130145, -1.316469, -2.90265, 1, 0.772549, 0, 1,
-1.128062, -0.454854, -0.1064507, 1, 0.7803922, 0, 1,
-1.118365, 1.131749, -2.122087, 1, 0.7843137, 0, 1,
-1.114686, -1.625306, -0.6838605, 1, 0.7921569, 0, 1,
-1.10522, 0.1712061, 0.9286056, 1, 0.7960784, 0, 1,
-1.103668, 1.134496, -0.1038786, 1, 0.8039216, 0, 1,
-1.102714, 0.9214317, -0.3624096, 1, 0.8117647, 0, 1,
-1.089833, -0.6436281, -1.444672, 1, 0.8156863, 0, 1,
-1.088275, 0.09031128, -1.629843, 1, 0.8235294, 0, 1,
-1.077202, 0.0004880309, -0.6455188, 1, 0.827451, 0, 1,
-1.075376, 1.085296, -0.8661997, 1, 0.8352941, 0, 1,
-1.074359, 1.216802, -0.2667134, 1, 0.8392157, 0, 1,
-1.065484, 0.1119142, -1.058246, 1, 0.8470588, 0, 1,
-1.055304, 2.667852, -1.258562, 1, 0.8509804, 0, 1,
-1.052781, -0.1579089, -2.265051, 1, 0.8588235, 0, 1,
-1.049635, 1.305763, -0.5939214, 1, 0.8627451, 0, 1,
-1.043123, -0.01816862, -3.24066, 1, 0.8705882, 0, 1,
-1.036036, -0.87091, -3.426256, 1, 0.8745098, 0, 1,
-1.031493, 1.346753, -1.727884, 1, 0.8823529, 0, 1,
-1.027945, -2.412685, -2.332222, 1, 0.8862745, 0, 1,
-1.008202, -1.148159, -1.76345, 1, 0.8941177, 0, 1,
-1.007835, -0.3928102, -2.746185, 1, 0.8980392, 0, 1,
-1.007133, -0.2426118, -0.2803641, 1, 0.9058824, 0, 1,
-1.004773, 1.36354, -0.4504432, 1, 0.9137255, 0, 1,
-1.004529, -0.5165383, -3.420884, 1, 0.9176471, 0, 1,
-1.003188, -1.043898, -3.369457, 1, 0.9254902, 0, 1,
-0.9886066, 1.817904, 1.205251, 1, 0.9294118, 0, 1,
-0.9877678, -0.4455413, -0.9492037, 1, 0.9372549, 0, 1,
-0.9873809, 1.089866, -0.1317184, 1, 0.9411765, 0, 1,
-0.9848145, -1.144726, -2.999564, 1, 0.9490196, 0, 1,
-0.9843149, 1.352166, 0.1542325, 1, 0.9529412, 0, 1,
-0.9825842, 1.392328, 0.7481863, 1, 0.9607843, 0, 1,
-0.981034, -0.5665164, -2.915252, 1, 0.9647059, 0, 1,
-0.9809492, 1.124098, -2.177562, 1, 0.972549, 0, 1,
-0.9782806, -1.000975, -2.694379, 1, 0.9764706, 0, 1,
-0.9772711, -0.7254961, -2.999097, 1, 0.9843137, 0, 1,
-0.9741743, 0.7789656, -1.7924, 1, 0.9882353, 0, 1,
-0.972728, -0.03475375, -1.539639, 1, 0.9960784, 0, 1,
-0.9724807, -1.126043, -2.591914, 0.9960784, 1, 0, 1,
-0.9638806, 0.1306411, -1.667535, 0.9921569, 1, 0, 1,
-0.9635801, -1.083546, -1.45668, 0.9843137, 1, 0, 1,
-0.9482274, 1.071159, -1.210905, 0.9803922, 1, 0, 1,
-0.9455567, -3.068691, -2.947438, 0.972549, 1, 0, 1,
-0.9425064, 0.5830221, 0.2416107, 0.9686275, 1, 0, 1,
-0.9391115, 0.7725026, -1.096923, 0.9607843, 1, 0, 1,
-0.935354, -0.4934014, -1.597808, 0.9568627, 1, 0, 1,
-0.9290522, -0.02657047, -0.5805743, 0.9490196, 1, 0, 1,
-0.9207844, -0.1725163, -1.442179, 0.945098, 1, 0, 1,
-0.9182496, -1.321154, -2.740467, 0.9372549, 1, 0, 1,
-0.9162161, -0.1735692, -0.2472053, 0.9333333, 1, 0, 1,
-0.9138225, 0.7020352, -0.4187917, 0.9254902, 1, 0, 1,
-0.9086892, 0.1368661, -0.3742232, 0.9215686, 1, 0, 1,
-0.9081718, 1.842656, -0.2357395, 0.9137255, 1, 0, 1,
-0.9079128, 1.240256, 0.06437832, 0.9098039, 1, 0, 1,
-0.907877, 0.2607999, -2.355509, 0.9019608, 1, 0, 1,
-0.9068077, 1.113392, -0.4221578, 0.8941177, 1, 0, 1,
-0.9005077, 0.9209893, -0.7448734, 0.8901961, 1, 0, 1,
-0.896101, -0.3596737, -2.651368, 0.8823529, 1, 0, 1,
-0.8933202, -0.8310301, -2.431066, 0.8784314, 1, 0, 1,
-0.888669, -1.033285, -0.8489488, 0.8705882, 1, 0, 1,
-0.8881344, 1.261396, -0.9365918, 0.8666667, 1, 0, 1,
-0.8865013, 0.9456049, -0.519085, 0.8588235, 1, 0, 1,
-0.8847778, -1.431461, -3.309951, 0.854902, 1, 0, 1,
-0.8796665, 0.0002951592, -1.68867, 0.8470588, 1, 0, 1,
-0.8770297, 0.3329605, -2.033692, 0.8431373, 1, 0, 1,
-0.8666815, 1.002052, -0.2060123, 0.8352941, 1, 0, 1,
-0.8585479, -0.4442547, -1.899821, 0.8313726, 1, 0, 1,
-0.8555518, 0.5183221, -2.48843, 0.8235294, 1, 0, 1,
-0.854573, -0.1641291, -0.8852129, 0.8196079, 1, 0, 1,
-0.8368965, -0.5646185, -1.035801, 0.8117647, 1, 0, 1,
-0.8331807, 1.653502, -1.017642, 0.8078431, 1, 0, 1,
-0.8312148, -1.511362, -2.499989, 0.8, 1, 0, 1,
-0.8258683, 1.163951, -1.310056, 0.7921569, 1, 0, 1,
-0.8244797, 0.1722344, -1.555332, 0.7882353, 1, 0, 1,
-0.8202007, 1.260718, -1.028923, 0.7803922, 1, 0, 1,
-0.8201583, -1.09419, -2.073519, 0.7764706, 1, 0, 1,
-0.8197838, 0.3527036, -1.338811, 0.7686275, 1, 0, 1,
-0.8176479, 0.7783358, 0.7432082, 0.7647059, 1, 0, 1,
-0.8150263, -2.193623, -2.238737, 0.7568628, 1, 0, 1,
-0.8148613, -1.231175, -3.799917, 0.7529412, 1, 0, 1,
-0.8135469, -1.297018, -2.66117, 0.7450981, 1, 0, 1,
-0.8104606, -0.06721575, -2.118434, 0.7411765, 1, 0, 1,
-0.8087485, -0.7101669, -0.8215404, 0.7333333, 1, 0, 1,
-0.7954535, -2.27472, -3.670747, 0.7294118, 1, 0, 1,
-0.7931035, -0.6412964, -3.0037, 0.7215686, 1, 0, 1,
-0.7926208, 0.7564111, 0.1901561, 0.7176471, 1, 0, 1,
-0.7780182, 0.3608428, -2.141174, 0.7098039, 1, 0, 1,
-0.7538434, 0.6913127, -1.138739, 0.7058824, 1, 0, 1,
-0.7517421, 0.7577005, -2.49084, 0.6980392, 1, 0, 1,
-0.7503046, -0.2570252, -2.231462, 0.6901961, 1, 0, 1,
-0.7484213, -0.1923651, -0.8717001, 0.6862745, 1, 0, 1,
-0.7459534, 0.2459629, -0.8282461, 0.6784314, 1, 0, 1,
-0.7458424, -0.5593173, -1.395988, 0.6745098, 1, 0, 1,
-0.7433863, -1.168567, -3.042145, 0.6666667, 1, 0, 1,
-0.7375126, -0.4493453, -3.984653, 0.6627451, 1, 0, 1,
-0.7352151, -0.4558176, -1.824368, 0.654902, 1, 0, 1,
-0.7286609, -0.7562876, -3.253275, 0.6509804, 1, 0, 1,
-0.7259133, 0.474359, -1.110663, 0.6431373, 1, 0, 1,
-0.725376, -0.002272776, -1.936746, 0.6392157, 1, 0, 1,
-0.7248138, -0.1068306, -0.560958, 0.6313726, 1, 0, 1,
-0.7192339, -0.4999715, -2.863455, 0.627451, 1, 0, 1,
-0.7143015, -0.3613461, -2.696202, 0.6196079, 1, 0, 1,
-0.7101417, -0.514567, -2.522243, 0.6156863, 1, 0, 1,
-0.7046466, 0.8873256, -2.109267, 0.6078432, 1, 0, 1,
-0.698614, 0.5562081, -0.2390683, 0.6039216, 1, 0, 1,
-0.6977836, 0.587567, -1.810163, 0.5960785, 1, 0, 1,
-0.6958563, -0.9514967, -1.328073, 0.5882353, 1, 0, 1,
-0.6894115, 0.683793, 1.125363, 0.5843138, 1, 0, 1,
-0.6886371, 0.7393949, -2.434834, 0.5764706, 1, 0, 1,
-0.6840062, 0.8921777, -2.578657, 0.572549, 1, 0, 1,
-0.6815681, -0.9846512, -2.83011, 0.5647059, 1, 0, 1,
-0.6801103, -0.1904742, -1.33246, 0.5607843, 1, 0, 1,
-0.6796719, 0.6941913, -2.589549, 0.5529412, 1, 0, 1,
-0.6792908, 0.418909, 0.08432385, 0.5490196, 1, 0, 1,
-0.6787267, -1.290924, -3.0175, 0.5411765, 1, 0, 1,
-0.6769872, 0.3377192, -1.379437, 0.5372549, 1, 0, 1,
-0.6666759, -1.458974, -2.270968, 0.5294118, 1, 0, 1,
-0.6658297, 0.9068485, -0.5395837, 0.5254902, 1, 0, 1,
-0.6625937, -0.3942066, -2.373679, 0.5176471, 1, 0, 1,
-0.6525017, -0.4297817, -1.643327, 0.5137255, 1, 0, 1,
-0.6459764, 0.9768294, -1.911214, 0.5058824, 1, 0, 1,
-0.6454371, -0.4804185, -1.927176, 0.5019608, 1, 0, 1,
-0.6418356, -0.4407164, -2.214669, 0.4941176, 1, 0, 1,
-0.639214, -0.4378818, -2.789384, 0.4862745, 1, 0, 1,
-0.6383624, 0.8676412, -0.3284379, 0.4823529, 1, 0, 1,
-0.6381418, -1.095417, -5.22996, 0.4745098, 1, 0, 1,
-0.6355504, -0.3232488, -3.603894, 0.4705882, 1, 0, 1,
-0.629768, 1.192269, -2.437783, 0.4627451, 1, 0, 1,
-0.6287887, 1.724319, -2.874263, 0.4588235, 1, 0, 1,
-0.6287012, 0.8808687, 0.2759974, 0.4509804, 1, 0, 1,
-0.6187657, -0.9058977, -1.940795, 0.4470588, 1, 0, 1,
-0.618189, 0.2101746, -0.1217317, 0.4392157, 1, 0, 1,
-0.6179776, 0.06630056, 0.2395209, 0.4352941, 1, 0, 1,
-0.6146986, -0.3133506, -3.073228, 0.427451, 1, 0, 1,
-0.6105049, 1.846759, 1.778148, 0.4235294, 1, 0, 1,
-0.6098909, 1.496258, -0.4399086, 0.4156863, 1, 0, 1,
-0.6088663, 0.4563827, 0.9622723, 0.4117647, 1, 0, 1,
-0.6087269, 0.3611487, -1.992619, 0.4039216, 1, 0, 1,
-0.6052357, 1.354438, -1.291463, 0.3960784, 1, 0, 1,
-0.6005672, -1.742298, -4.337337, 0.3921569, 1, 0, 1,
-0.5955125, -1.169379, -4.828437, 0.3843137, 1, 0, 1,
-0.5923414, 0.4380442, -0.6487376, 0.3803922, 1, 0, 1,
-0.5921086, 0.4569077, 0.1480847, 0.372549, 1, 0, 1,
-0.5880305, 1.413978, -0.264759, 0.3686275, 1, 0, 1,
-0.585715, 1.208024, -0.5465971, 0.3607843, 1, 0, 1,
-0.5833909, 1.038575, -1.204556, 0.3568628, 1, 0, 1,
-0.5803378, 0.4431747, -2.023227, 0.3490196, 1, 0, 1,
-0.5725061, 0.2462374, 1.75489, 0.345098, 1, 0, 1,
-0.5724143, 0.1617674, -0.36967, 0.3372549, 1, 0, 1,
-0.5718557, 2.211288, -0.6671199, 0.3333333, 1, 0, 1,
-0.5648959, -0.06551564, -2.042928, 0.3254902, 1, 0, 1,
-0.5563183, 1.438718, 0.4218804, 0.3215686, 1, 0, 1,
-0.5558373, 0.08392954, -2.193622, 0.3137255, 1, 0, 1,
-0.5556854, 0.9341187, 0.6320618, 0.3098039, 1, 0, 1,
-0.5538174, -0.3006366, -2.520776, 0.3019608, 1, 0, 1,
-0.5477913, -3.166662, -3.584938, 0.2941177, 1, 0, 1,
-0.5453685, 0.9070763, -0.09589761, 0.2901961, 1, 0, 1,
-0.5402486, -0.3794869, -3.035049, 0.282353, 1, 0, 1,
-0.5339764, 0.07463299, -1.804491, 0.2784314, 1, 0, 1,
-0.531742, -0.5966515, -3.056759, 0.2705882, 1, 0, 1,
-0.5300005, 0.3808705, -1.07122, 0.2666667, 1, 0, 1,
-0.5241147, -1.069581, -1.775036, 0.2588235, 1, 0, 1,
-0.5233677, 0.4884633, -2.49479, 0.254902, 1, 0, 1,
-0.5218508, 0.9601842, -2.654231, 0.2470588, 1, 0, 1,
-0.5205002, 0.3967445, -1.482735, 0.2431373, 1, 0, 1,
-0.518855, 1.259381, 0.2767029, 0.2352941, 1, 0, 1,
-0.5151471, -0.7313038, -2.876205, 0.2313726, 1, 0, 1,
-0.5110555, -1.625746, -3.242683, 0.2235294, 1, 0, 1,
-0.5074806, 0.7293861, 0.005333651, 0.2196078, 1, 0, 1,
-0.5071314, -0.7726613, -2.876257, 0.2117647, 1, 0, 1,
-0.5050098, 2.292392, -0.05865935, 0.2078431, 1, 0, 1,
-0.4987593, 0.294636, -0.8338069, 0.2, 1, 0, 1,
-0.4966124, 0.1870337, -1.21707, 0.1921569, 1, 0, 1,
-0.4942078, -0.4228188, -2.661745, 0.1882353, 1, 0, 1,
-0.491207, 0.4690953, -0.7678686, 0.1803922, 1, 0, 1,
-0.4898213, -0.8562278, -0.5054916, 0.1764706, 1, 0, 1,
-0.4828281, 0.1839413, -0.3346928, 0.1686275, 1, 0, 1,
-0.4806661, 0.08836447, -2.476121, 0.1647059, 1, 0, 1,
-0.4795842, 1.817, -0.3483349, 0.1568628, 1, 0, 1,
-0.4786402, 0.04065989, -1.465262, 0.1529412, 1, 0, 1,
-0.4735937, -0.4680029, -2.440076, 0.145098, 1, 0, 1,
-0.4707497, -0.3032177, -2.791808, 0.1411765, 1, 0, 1,
-0.4692438, -1.877694, -2.901843, 0.1333333, 1, 0, 1,
-0.467828, -0.356452, -0.4805232, 0.1294118, 1, 0, 1,
-0.4677818, -0.5931724, -2.061414, 0.1215686, 1, 0, 1,
-0.4623156, -0.9486469, -3.109879, 0.1176471, 1, 0, 1,
-0.4550377, 1.361552, 1.099961, 0.1098039, 1, 0, 1,
-0.4535238, 0.1465198, -1.849761, 0.1058824, 1, 0, 1,
-0.4528004, -1.543758, -3.066827, 0.09803922, 1, 0, 1,
-0.4525001, -0.1107663, -3.610028, 0.09019608, 1, 0, 1,
-0.4454701, 1.402794, 0.9900471, 0.08627451, 1, 0, 1,
-0.443039, -1.550406, -3.374097, 0.07843138, 1, 0, 1,
-0.4415735, 0.4863461, -1.104023, 0.07450981, 1, 0, 1,
-0.4336974, -0.8294213, -2.992656, 0.06666667, 1, 0, 1,
-0.4332094, -1.630169, -3.085377, 0.0627451, 1, 0, 1,
-0.4323706, -1.728155, -3.577093, 0.05490196, 1, 0, 1,
-0.4296855, 1.57907, -0.3308654, 0.05098039, 1, 0, 1,
-0.426956, 1.291737, -0.7568081, 0.04313726, 1, 0, 1,
-0.4263694, -0.6471837, -3.81775, 0.03921569, 1, 0, 1,
-0.4230656, -1.596873, -3.426066, 0.03137255, 1, 0, 1,
-0.4204156, 0.07796939, -1.522888, 0.02745098, 1, 0, 1,
-0.4132959, -0.1523536, -2.716786, 0.01960784, 1, 0, 1,
-0.4130709, 0.5588064, -1.989255, 0.01568628, 1, 0, 1,
-0.412112, 1.520801, 0.7949134, 0.007843138, 1, 0, 1,
-0.4098865, -2.242856, -3.487841, 0.003921569, 1, 0, 1,
-0.4091643, -0.5101808, -2.550674, 0, 1, 0.003921569, 1,
-0.3993004, 1.03977, -1.506815, 0, 1, 0.01176471, 1,
-0.3985926, 2.829231, -0.889855, 0, 1, 0.01568628, 1,
-0.3983443, 0.3619911, -0.2126597, 0, 1, 0.02352941, 1,
-0.3980661, -0.7433844, -4.441801, 0, 1, 0.02745098, 1,
-0.3977284, 0.4507717, -1.619282, 0, 1, 0.03529412, 1,
-0.3963596, 1.819077, 0.4478837, 0, 1, 0.03921569, 1,
-0.3942267, 1.259155, -1.757468, 0, 1, 0.04705882, 1,
-0.390317, -0.1440236, -1.633934, 0, 1, 0.05098039, 1,
-0.3877339, 0.09238753, -1.017729, 0, 1, 0.05882353, 1,
-0.3842415, 0.05140242, -0.5893554, 0, 1, 0.0627451, 1,
-0.3826849, 1.335899, -1.040105, 0, 1, 0.07058824, 1,
-0.3823101, 0.9944211, -0.0758006, 0, 1, 0.07450981, 1,
-0.3753061, 0.1392986, -0.4767454, 0, 1, 0.08235294, 1,
-0.3739148, 0.1041026, -2.261494, 0, 1, 0.08627451, 1,
-0.3712565, -1.192616, -1.602707, 0, 1, 0.09411765, 1,
-0.37035, 0.5891043, -1.188821, 0, 1, 0.1019608, 1,
-0.3660381, 0.8190015, -0.4855306, 0, 1, 0.1058824, 1,
-0.3627736, 1.579235, 0.08160339, 0, 1, 0.1137255, 1,
-0.3615737, 0.5243378, -1.134027, 0, 1, 0.1176471, 1,
-0.3481429, -0.1407923, -1.963174, 0, 1, 0.1254902, 1,
-0.3479317, -1.326019, -3.242534, 0, 1, 0.1294118, 1,
-0.3434256, 1.217825, 0.5175126, 0, 1, 0.1372549, 1,
-0.3366162, -2.589182, -1.298451, 0, 1, 0.1411765, 1,
-0.3361161, -0.4362075, -1.696218, 0, 1, 0.1490196, 1,
-0.3320209, -0.1489917, -2.992856, 0, 1, 0.1529412, 1,
-0.3272167, -1.361992, -2.803164, 0, 1, 0.1607843, 1,
-0.3257921, 0.3278328, -0.136922, 0, 1, 0.1647059, 1,
-0.3255891, 0.3377956, -1.379518, 0, 1, 0.172549, 1,
-0.3229676, -0.6902722, -2.227298, 0, 1, 0.1764706, 1,
-0.3195846, -0.9070299, -2.966145, 0, 1, 0.1843137, 1,
-0.3181935, -0.3760521, -3.05882, 0, 1, 0.1882353, 1,
-0.3170966, 0.4873904, 0.6216045, 0, 1, 0.1960784, 1,
-0.3164427, 1.006373, -0.5143923, 0, 1, 0.2039216, 1,
-0.315777, 0.02225357, -1.840201, 0, 1, 0.2078431, 1,
-0.3148946, -0.5620818, -2.886495, 0, 1, 0.2156863, 1,
-0.3142658, -1.733619, -2.831011, 0, 1, 0.2196078, 1,
-0.3137107, -1.231028, -2.46192, 0, 1, 0.227451, 1,
-0.3125904, -1.228768, -0.9163194, 0, 1, 0.2313726, 1,
-0.3111845, -0.7428052, -2.107446, 0, 1, 0.2392157, 1,
-0.3105924, -1.173584, -4.121158, 0, 1, 0.2431373, 1,
-0.3083915, 1.499063, -1.39624, 0, 1, 0.2509804, 1,
-0.3042676, -0.2753813, -1.59051, 0, 1, 0.254902, 1,
-0.3028101, 1.739412, 1.164183, 0, 1, 0.2627451, 1,
-0.3015892, -0.3744462, -2.223985, 0, 1, 0.2666667, 1,
-0.299636, 0.05888658, -2.365346, 0, 1, 0.2745098, 1,
-0.2973883, -0.8961571, -3.661805, 0, 1, 0.2784314, 1,
-0.2963675, 1.250279, -2.002516, 0, 1, 0.2862745, 1,
-0.2949378, 0.03494547, -2.455099, 0, 1, 0.2901961, 1,
-0.2904901, 0.07473525, -0.9385553, 0, 1, 0.2980392, 1,
-0.2901635, 1.118044, 0.38484, 0, 1, 0.3058824, 1,
-0.288269, -0.3848089, -3.369111, 0, 1, 0.3098039, 1,
-0.2865424, -0.4956482, -3.121886, 0, 1, 0.3176471, 1,
-0.278346, 0.8554589, -0.08291147, 0, 1, 0.3215686, 1,
-0.2779501, -0.4088047, -1.939088, 0, 1, 0.3294118, 1,
-0.2601849, -0.002555043, -2.2624, 0, 1, 0.3333333, 1,
-0.258124, -0.06778787, -0.7814059, 0, 1, 0.3411765, 1,
-0.2570989, -0.6210024, -3.369936, 0, 1, 0.345098, 1,
-0.2543063, 2.282494, 2.03341, 0, 1, 0.3529412, 1,
-0.2537057, 0.5216806, -1.2232, 0, 1, 0.3568628, 1,
-0.2506848, -0.5187619, -2.383893, 0, 1, 0.3647059, 1,
-0.2478991, -0.6668631, -3.598368, 0, 1, 0.3686275, 1,
-0.2392813, -0.9872894, -2.589938, 0, 1, 0.3764706, 1,
-0.2366934, -0.4881369, -3.113789, 0, 1, 0.3803922, 1,
-0.2314186, -0.7257681, -2.6798, 0, 1, 0.3882353, 1,
-0.2286416, -1.297208, -2.99982, 0, 1, 0.3921569, 1,
-0.2274335, 1.888541, 0.4012813, 0, 1, 0.4, 1,
-0.2269562, -0.7794147, -1.9489, 0, 1, 0.4078431, 1,
-0.2265506, 0.9364194, -2.156795, 0, 1, 0.4117647, 1,
-0.2211643, -0.1400494, -2.107534, 0, 1, 0.4196078, 1,
-0.218764, -0.632763, -4.36024, 0, 1, 0.4235294, 1,
-0.2114474, -0.05168262, -0.5606099, 0, 1, 0.4313726, 1,
-0.2099247, 0.1225083, -1.466283, 0, 1, 0.4352941, 1,
-0.2015602, -0.3395496, -3.616437, 0, 1, 0.4431373, 1,
-0.198345, -0.4002135, -2.93542, 0, 1, 0.4470588, 1,
-0.1976503, -0.310423, -1.758121, 0, 1, 0.454902, 1,
-0.19752, 0.06213907, -1.953971, 0, 1, 0.4588235, 1,
-0.1967904, -1.348375, -3.229127, 0, 1, 0.4666667, 1,
-0.1896518, -1.116452, -0.5638537, 0, 1, 0.4705882, 1,
-0.1884133, -0.559209, -2.918119, 0, 1, 0.4784314, 1,
-0.1817676, 0.8602997, 0.5634332, 0, 1, 0.4823529, 1,
-0.1800479, -0.7209613, -2.0406, 0, 1, 0.4901961, 1,
-0.1760453, -0.1903707, -2.614782, 0, 1, 0.4941176, 1,
-0.1760039, -0.7633917, -3.380616, 0, 1, 0.5019608, 1,
-0.1708423, 0.5371954, -0.1973376, 0, 1, 0.509804, 1,
-0.1674598, -0.109263, -0.6352686, 0, 1, 0.5137255, 1,
-0.1640255, 1.227795, -0.8957086, 0, 1, 0.5215687, 1,
-0.1567214, 0.6303989, -1.228832, 0, 1, 0.5254902, 1,
-0.1533951, 1.69595, 0.6037339, 0, 1, 0.5333334, 1,
-0.1516586, -1.603647, -2.32685, 0, 1, 0.5372549, 1,
-0.1508824, 0.2453496, -1.832572, 0, 1, 0.5450981, 1,
-0.1487122, 0.6041844, -0.4345534, 0, 1, 0.5490196, 1,
-0.1439839, 0.4644707, -1.891238, 0, 1, 0.5568628, 1,
-0.143674, 0.5367085, -0.6479763, 0, 1, 0.5607843, 1,
-0.1424551, -0.4653448, -3.585687, 0, 1, 0.5686275, 1,
-0.1371078, 0.6402858, 0.1175798, 0, 1, 0.572549, 1,
-0.1298419, 0.3198153, -0.491761, 0, 1, 0.5803922, 1,
-0.127131, -0.5821199, -2.393349, 0, 1, 0.5843138, 1,
-0.1253125, 0.02415886, -1.73924, 0, 1, 0.5921569, 1,
-0.123559, -1.369658, -2.60818, 0, 1, 0.5960785, 1,
-0.1231505, 0.5152606, 0.05662772, 0, 1, 0.6039216, 1,
-0.1219489, 0.7455729, -0.3893533, 0, 1, 0.6117647, 1,
-0.1173833, -0.36089, -3.617862, 0, 1, 0.6156863, 1,
-0.1159146, -0.3570995, -3.725662, 0, 1, 0.6235294, 1,
-0.1151804, -1.060606, -2.706914, 0, 1, 0.627451, 1,
-0.1145622, 1.237452, -0.1886539, 0, 1, 0.6352941, 1,
-0.1143403, -1.306676, -1.721859, 0, 1, 0.6392157, 1,
-0.1126569, -0.1862281, -2.124757, 0, 1, 0.6470588, 1,
-0.1123356, -0.9424118, -3.955012, 0, 1, 0.6509804, 1,
-0.1109333, 0.9883795, 0.03947227, 0, 1, 0.6588235, 1,
-0.1041692, -0.3211337, -3.55352, 0, 1, 0.6627451, 1,
-0.1026478, 0.9392014, 0.4730027, 0, 1, 0.6705883, 1,
-0.102278, -0.5345146, -2.336731, 0, 1, 0.6745098, 1,
-0.1003747, 0.4654222, -0.2797432, 0, 1, 0.682353, 1,
-0.09969772, 0.3167551, 0.03073418, 0, 1, 0.6862745, 1,
-0.09916525, 0.1384576, -1.270396, 0, 1, 0.6941177, 1,
-0.09772566, -2.374475, -3.02885, 0, 1, 0.7019608, 1,
-0.09581229, -0.566548, -4.595519, 0, 1, 0.7058824, 1,
-0.09349512, -1.539824, -2.922569, 0, 1, 0.7137255, 1,
-0.09333237, -0.4722298, -0.1378599, 0, 1, 0.7176471, 1,
-0.09157912, -0.008666417, -1.29461, 0, 1, 0.7254902, 1,
-0.0912287, -0.09073296, -3.736593, 0, 1, 0.7294118, 1,
-0.08794547, 2.349565, 0.6084726, 0, 1, 0.7372549, 1,
-0.08662884, 0.488223, -0.3853199, 0, 1, 0.7411765, 1,
-0.08527208, 0.3550407, -1.267059, 0, 1, 0.7490196, 1,
-0.0850766, 0.3533161, 1.567134, 0, 1, 0.7529412, 1,
-0.08284301, 0.1067283, 0.6053289, 0, 1, 0.7607843, 1,
-0.08249375, -2.051461, -4.992162, 0, 1, 0.7647059, 1,
-0.07688257, 0.6114164, 0.7576163, 0, 1, 0.772549, 1,
-0.07673472, 0.1638612, 0.3213953, 0, 1, 0.7764706, 1,
-0.07517567, -0.6868514, -2.516021, 0, 1, 0.7843137, 1,
-0.07417129, 0.951197, -0.2116273, 0, 1, 0.7882353, 1,
-0.07038438, -2.269399, -3.588846, 0, 1, 0.7960784, 1,
-0.06984019, -1.185817, -2.392032, 0, 1, 0.8039216, 1,
-0.06915491, 0.2906893, -0.2125994, 0, 1, 0.8078431, 1,
-0.06522255, 0.2153277, -0.488524, 0, 1, 0.8156863, 1,
-0.06440973, 2.632346, 0.9180406, 0, 1, 0.8196079, 1,
-0.06319275, 0.5764762, -0.5233095, 0, 1, 0.827451, 1,
-0.06232559, 0.08922629, 1.330691, 0, 1, 0.8313726, 1,
-0.05970484, 0.3263718, 1.980197, 0, 1, 0.8392157, 1,
-0.05279629, -1.515795, -3.366145, 0, 1, 0.8431373, 1,
-0.05233524, -0.4694411, -4.622688, 0, 1, 0.8509804, 1,
-0.04961115, 0.9391896, -1.05188, 0, 1, 0.854902, 1,
-0.04547224, -1.616752, -2.972815, 0, 1, 0.8627451, 1,
-0.04373356, 0.7232998, -0.1284436, 0, 1, 0.8666667, 1,
-0.04200232, 0.2524399, 0.2845681, 0, 1, 0.8745098, 1,
-0.03841453, 1.093066, -0.4710529, 0, 1, 0.8784314, 1,
-0.03704318, -0.8025662, -1.243734, 0, 1, 0.8862745, 1,
-0.03644795, 1.232913, -0.6934534, 0, 1, 0.8901961, 1,
-0.03385064, -0.7893298, -2.274813, 0, 1, 0.8980392, 1,
-0.03065971, 0.6948527, -0.4701571, 0, 1, 0.9058824, 1,
-0.02404342, -0.7534156, -3.090727, 0, 1, 0.9098039, 1,
-0.02365834, -0.1983162, -2.338539, 0, 1, 0.9176471, 1,
-0.02148836, 0.08016636, 0.8794435, 0, 1, 0.9215686, 1,
-0.02119172, 1.422762, 0.2659613, 0, 1, 0.9294118, 1,
-0.02085977, -0.6161197, -3.68563, 0, 1, 0.9333333, 1,
-0.01834567, 1.064862, 0.6409739, 0, 1, 0.9411765, 1,
-0.01156374, 0.3872258, 0.7749106, 0, 1, 0.945098, 1,
-0.0102134, -1.345319, -2.674005, 0, 1, 0.9529412, 1,
-0.008087596, 0.8162825, -0.06722726, 0, 1, 0.9568627, 1,
-0.005789563, -0.601652, -1.970098, 0, 1, 0.9647059, 1,
-0.003912988, 0.7835406, 1.117834, 0, 1, 0.9686275, 1,
-0.001404747, -1.226168, -3.138261, 0, 1, 0.9764706, 1,
0.003385025, 0.7570218, -0.6598091, 0, 1, 0.9803922, 1,
0.00964012, -1.238633, 1.767406, 0, 1, 0.9882353, 1,
0.01706091, -0.1681831, 3.233117, 0, 1, 0.9921569, 1,
0.0173626, 0.3590701, 1.160873, 0, 1, 1, 1,
0.02197659, 0.9467673, 2.464497, 0, 0.9921569, 1, 1,
0.02417493, -1.049601, 2.868123, 0, 0.9882353, 1, 1,
0.02420068, -0.2705188, 2.878106, 0, 0.9803922, 1, 1,
0.02596756, -0.2967867, 1.765368, 0, 0.9764706, 1, 1,
0.0300102, -0.1147062, 0.980226, 0, 0.9686275, 1, 1,
0.03187757, 1.198629, 0.2741648, 0, 0.9647059, 1, 1,
0.0321175, 0.768901, -1.444144, 0, 0.9568627, 1, 1,
0.03272416, 1.244781, 1.041625, 0, 0.9529412, 1, 1,
0.03489256, 0.3321745, -0.1253399, 0, 0.945098, 1, 1,
0.04003226, -0.2668274, 3.062557, 0, 0.9411765, 1, 1,
0.04148972, 0.7801847, -0.1443631, 0, 0.9333333, 1, 1,
0.04403012, 0.9005633, 0.6714863, 0, 0.9294118, 1, 1,
0.04518357, -2.006807, 1.514772, 0, 0.9215686, 1, 1,
0.04682387, 0.7922554, -0.8897982, 0, 0.9176471, 1, 1,
0.04938246, -1.180863, 2.179884, 0, 0.9098039, 1, 1,
0.05170102, -1.096474, 3.351882, 0, 0.9058824, 1, 1,
0.05180471, 0.08695012, -0.07919823, 0, 0.8980392, 1, 1,
0.05235436, 1.208426, -0.00250265, 0, 0.8901961, 1, 1,
0.05725998, -1.035834, 5.04902, 0, 0.8862745, 1, 1,
0.05838534, -1.210764, 4.538964, 0, 0.8784314, 1, 1,
0.06993864, -0.9827682, 3.524396, 0, 0.8745098, 1, 1,
0.0717105, 1.363285, 0.263703, 0, 0.8666667, 1, 1,
0.07783966, 2.361613, 0.6312805, 0, 0.8627451, 1, 1,
0.08104129, 0.8602238, 0.6684237, 0, 0.854902, 1, 1,
0.0838738, 1.193727, -2.512275, 0, 0.8509804, 1, 1,
0.08546251, -0.5650088, 3.223943, 0, 0.8431373, 1, 1,
0.085599, 0.08726511, 1.041636, 0, 0.8392157, 1, 1,
0.08631292, 1.257844, -2.084843, 0, 0.8313726, 1, 1,
0.08811186, -2.238097, 0.4713587, 0, 0.827451, 1, 1,
0.09122461, -1.52254, 2.113631, 0, 0.8196079, 1, 1,
0.09377208, 0.06601012, -0.2215726, 0, 0.8156863, 1, 1,
0.09388739, 0.149198, -1.013531, 0, 0.8078431, 1, 1,
0.09412486, -0.9071103, 2.883597, 0, 0.8039216, 1, 1,
0.09671528, -1.291263, 4.674213, 0, 0.7960784, 1, 1,
0.1039849, 2.868309, 1.099532, 0, 0.7882353, 1, 1,
0.1040015, 0.2552584, 0.4175908, 0, 0.7843137, 1, 1,
0.1049474, -1.27622, 4.591231, 0, 0.7764706, 1, 1,
0.1057431, 0.6612524, 1.202087, 0, 0.772549, 1, 1,
0.1097127, -0.003683039, 0.245044, 0, 0.7647059, 1, 1,
0.11398, 0.01522243, -0.1271927, 0, 0.7607843, 1, 1,
0.1166292, -0.1995045, 1.600364, 0, 0.7529412, 1, 1,
0.1168727, -1.51594, 1.807726, 0, 0.7490196, 1, 1,
0.1173549, 0.3852976, 1.083809, 0, 0.7411765, 1, 1,
0.1191009, -1.490762, 3.037059, 0, 0.7372549, 1, 1,
0.1193879, -1.137151, 2.209145, 0, 0.7294118, 1, 1,
0.122923, 1.055857, 1.048044, 0, 0.7254902, 1, 1,
0.1270887, -1.133364, 3.307072, 0, 0.7176471, 1, 1,
0.1389634, -1.749655, 1.810372, 0, 0.7137255, 1, 1,
0.1412483, -1.458731, 1.75631, 0, 0.7058824, 1, 1,
0.1423818, 0.03964499, 1.987069, 0, 0.6980392, 1, 1,
0.1435789, -0.3903396, 3.415241, 0, 0.6941177, 1, 1,
0.1436186, -0.2463219, 4.316975, 0, 0.6862745, 1, 1,
0.1450889, -1.108778, 3.287109, 0, 0.682353, 1, 1,
0.1452302, 0.9271559, -1.089477, 0, 0.6745098, 1, 1,
0.1463905, -1.568767, 4.883224, 0, 0.6705883, 1, 1,
0.1508992, -1.956154, 3.165824, 0, 0.6627451, 1, 1,
0.1525448, -0.2700142, 2.89328, 0, 0.6588235, 1, 1,
0.1595355, 0.2150919, 0.9063058, 0, 0.6509804, 1, 1,
0.1634703, -0.9146892, 2.29042, 0, 0.6470588, 1, 1,
0.1687478, -0.9838541, 3.988363, 0, 0.6392157, 1, 1,
0.1750136, -0.7414714, 2.969032, 0, 0.6352941, 1, 1,
0.1771849, -2.801417, 4.182126, 0, 0.627451, 1, 1,
0.177202, 0.9746733, 1.133804, 0, 0.6235294, 1, 1,
0.1788201, -0.2184924, 1.927847, 0, 0.6156863, 1, 1,
0.1834603, 2.789675, 0.1231675, 0, 0.6117647, 1, 1,
0.1850364, -0.2556797, 3.971326, 0, 0.6039216, 1, 1,
0.1865758, 0.6584239, 1.794836, 0, 0.5960785, 1, 1,
0.1879334, 0.4441367, -0.9455938, 0, 0.5921569, 1, 1,
0.1893785, 0.6525185, -0.201438, 0, 0.5843138, 1, 1,
0.1902925, 1.402792, -0.9555074, 0, 0.5803922, 1, 1,
0.191886, 1.755315, -0.03713369, 0, 0.572549, 1, 1,
0.1935275, 1.86743, 0.7383655, 0, 0.5686275, 1, 1,
0.1948724, 0.05182358, 1.524313, 0, 0.5607843, 1, 1,
0.1953093, -0.1819727, 2.508512, 0, 0.5568628, 1, 1,
0.1964, -1.098556, 2.482461, 0, 0.5490196, 1, 1,
0.199025, -0.4809286, 3.235514, 0, 0.5450981, 1, 1,
0.2063476, -2.012977, 2.788551, 0, 0.5372549, 1, 1,
0.2080126, -1.583266, 2.617772, 0, 0.5333334, 1, 1,
0.2095259, 1.539681, -1.464328, 0, 0.5254902, 1, 1,
0.2101801, 0.8268669, 0.7060231, 0, 0.5215687, 1, 1,
0.2162856, -2.597641, 3.427272, 0, 0.5137255, 1, 1,
0.2188058, 0.2911486, 1.858225, 0, 0.509804, 1, 1,
0.2214185, 0.3474302, 0.7764822, 0, 0.5019608, 1, 1,
0.2230272, -0.01264716, 1.33574, 0, 0.4941176, 1, 1,
0.2246604, -0.5969036, 3.367824, 0, 0.4901961, 1, 1,
0.2274465, 0.6203747, -0.3750279, 0, 0.4823529, 1, 1,
0.2291596, -0.9141188, 1.591122, 0, 0.4784314, 1, 1,
0.2308357, 0.316975, 0.7714678, 0, 0.4705882, 1, 1,
0.2371245, -0.3546258, 4.963964, 0, 0.4666667, 1, 1,
0.2452679, 1.317956, -1.365012, 0, 0.4588235, 1, 1,
0.2466259, -0.2868147, 2.163755, 0, 0.454902, 1, 1,
0.246782, 0.3826362, 1.050945, 0, 0.4470588, 1, 1,
0.2508917, -0.344294, 2.259148, 0, 0.4431373, 1, 1,
0.2556747, -0.8339913, 1.364561, 0, 0.4352941, 1, 1,
0.2604331, 0.0338878, 0.4576048, 0, 0.4313726, 1, 1,
0.2700376, 0.305947, 0.3423936, 0, 0.4235294, 1, 1,
0.2709162, 0.04813522, 1.84261, 0, 0.4196078, 1, 1,
0.2745424, -0.9740894, 2.188209, 0, 0.4117647, 1, 1,
0.275373, 1.22914, -0.0874121, 0, 0.4078431, 1, 1,
0.2761379, 1.748283, 0.9281107, 0, 0.4, 1, 1,
0.2776697, -1.031742, 3.472221, 0, 0.3921569, 1, 1,
0.2782656, -0.4043995, 2.708501, 0, 0.3882353, 1, 1,
0.2804472, 2.703918, 1.468104, 0, 0.3803922, 1, 1,
0.2900332, 1.654323, -1.307373, 0, 0.3764706, 1, 1,
0.2905624, 1.366839, 0.7779834, 0, 0.3686275, 1, 1,
0.2918595, -0.2043494, 3.779329, 0, 0.3647059, 1, 1,
0.2921558, -1.12802, 2.3961, 0, 0.3568628, 1, 1,
0.2931221, 1.121289, -0.08499318, 0, 0.3529412, 1, 1,
0.2980088, 0.3349343, -1.179912, 0, 0.345098, 1, 1,
0.2996956, -0.4561938, 2.389126, 0, 0.3411765, 1, 1,
0.30049, 0.4374953, -1.352464, 0, 0.3333333, 1, 1,
0.3013966, -1.268649, 2.783596, 0, 0.3294118, 1, 1,
0.307704, 0.6920314, 0.05476096, 0, 0.3215686, 1, 1,
0.3148199, 0.5071316, 2.342853, 0, 0.3176471, 1, 1,
0.3166061, -0.8740576, 2.648492, 0, 0.3098039, 1, 1,
0.3202742, -0.217044, 2.116186, 0, 0.3058824, 1, 1,
0.3229937, 0.3727221, 1.973505, 0, 0.2980392, 1, 1,
0.3245333, -0.5772331, 3.694952, 0, 0.2901961, 1, 1,
0.3307926, 0.530686, 0.7855189, 0, 0.2862745, 1, 1,
0.3312147, 2.162636, -1.481358, 0, 0.2784314, 1, 1,
0.3328874, 0.1322175, 1.390415, 0, 0.2745098, 1, 1,
0.3337778, -0.4390043, 2.684029, 0, 0.2666667, 1, 1,
0.3348284, 2.007701, -1.022244, 0, 0.2627451, 1, 1,
0.335677, 0.2620712, -0.3568377, 0, 0.254902, 1, 1,
0.3361526, -1.465517, 3.377741, 0, 0.2509804, 1, 1,
0.3369835, 1.170112, 0.3454417, 0, 0.2431373, 1, 1,
0.3395951, 2.402425, 1.083391, 0, 0.2392157, 1, 1,
0.3408942, -2.166371, 2.546655, 0, 0.2313726, 1, 1,
0.3438709, -0.4606792, 1.601091, 0, 0.227451, 1, 1,
0.347226, 0.3431641, 1.587387, 0, 0.2196078, 1, 1,
0.3513516, 0.07326152, -0.2864027, 0, 0.2156863, 1, 1,
0.3524108, -0.691669, 0.5365372, 0, 0.2078431, 1, 1,
0.3561114, 0.2943106, -0.001899302, 0, 0.2039216, 1, 1,
0.3600039, 0.1440293, 0.9380323, 0, 0.1960784, 1, 1,
0.3700911, 0.9568316, -0.1481184, 0, 0.1882353, 1, 1,
0.3710223, 0.05339313, 2.664049, 0, 0.1843137, 1, 1,
0.3714854, 0.2990772, 0.5636079, 0, 0.1764706, 1, 1,
0.3764817, -0.3559122, 2.62329, 0, 0.172549, 1, 1,
0.380806, 0.5611644, 0.6419892, 0, 0.1647059, 1, 1,
0.3831011, -0.9422217, 2.726563, 0, 0.1607843, 1, 1,
0.3849687, 1.552432, -0.1028213, 0, 0.1529412, 1, 1,
0.3857021, -1.59101, 3.337471, 0, 0.1490196, 1, 1,
0.3949356, -0.01706765, 2.092932, 0, 0.1411765, 1, 1,
0.4014471, 1.218735, 0.1479095, 0, 0.1372549, 1, 1,
0.4024743, 2.129074, 1.065643, 0, 0.1294118, 1, 1,
0.4074863, -1.90413, 2.884882, 0, 0.1254902, 1, 1,
0.4100565, -0.2869453, 2.857862, 0, 0.1176471, 1, 1,
0.4102115, 0.8438146, 1.913863, 0, 0.1137255, 1, 1,
0.4108661, -0.01711727, 3.988844, 0, 0.1058824, 1, 1,
0.4127005, -0.2033496, 2.127311, 0, 0.09803922, 1, 1,
0.4184836, -0.9039981, 3.784682, 0, 0.09411765, 1, 1,
0.4213749, 0.5598859, 1.917676, 0, 0.08627451, 1, 1,
0.4223273, -1.780293, 2.359268, 0, 0.08235294, 1, 1,
0.4252857, 1.621642, 0.5761686, 0, 0.07450981, 1, 1,
0.429633, 1.617734, -1.239249, 0, 0.07058824, 1, 1,
0.4320047, -0.09317726, 1.86544, 0, 0.0627451, 1, 1,
0.432961, -0.01986263, 1.118022, 0, 0.05882353, 1, 1,
0.4331838, -0.8254734, 2.290043, 0, 0.05098039, 1, 1,
0.4374826, 0.8256889, 2.164104, 0, 0.04705882, 1, 1,
0.4380926, 0.01568218, 1.807882, 0, 0.03921569, 1, 1,
0.4392745, 0.8271117, 0.6535593, 0, 0.03529412, 1, 1,
0.439848, 0.8266191, -0.8425401, 0, 0.02745098, 1, 1,
0.4455166, -0.3699318, 2.339941, 0, 0.02352941, 1, 1,
0.4463829, 0.9154198, -0.721534, 0, 0.01568628, 1, 1,
0.4489499, -0.4651026, 1.257897, 0, 0.01176471, 1, 1,
0.4514815, -0.2596138, 2.154654, 0, 0.003921569, 1, 1,
0.4516995, -0.4269173, 1.008318, 0.003921569, 0, 1, 1,
0.4532786, -0.1310916, 1.723091, 0.007843138, 0, 1, 1,
0.4578671, 0.7029642, 0.7088179, 0.01568628, 0, 1, 1,
0.4615497, -0.3194911, 2.130792, 0.01960784, 0, 1, 1,
0.4615808, 1.255722, 0.5345452, 0.02745098, 0, 1, 1,
0.4623303, -0.351563, 2.180959, 0.03137255, 0, 1, 1,
0.466495, 0.5603433, 1.186764, 0.03921569, 0, 1, 1,
0.4665813, -0.07993152, 4.636391, 0.04313726, 0, 1, 1,
0.4684381, 0.6033484, 0.5311054, 0.05098039, 0, 1, 1,
0.4777842, -1.64213, 5.254076, 0.05490196, 0, 1, 1,
0.4785593, -1.299124, 4.501998, 0.0627451, 0, 1, 1,
0.4793321, -1.557597, 3.661353, 0.06666667, 0, 1, 1,
0.482264, -0.3321547, 3.278268, 0.07450981, 0, 1, 1,
0.4823623, 0.6796169, 0.5325653, 0.07843138, 0, 1, 1,
0.4832506, -0.8765263, 4.349937, 0.08627451, 0, 1, 1,
0.4836, 0.2254476, 1.097218, 0.09019608, 0, 1, 1,
0.4861134, 1.015278, -1.168477, 0.09803922, 0, 1, 1,
0.4893779, 1.662557, 1.390123, 0.1058824, 0, 1, 1,
0.4903736, 0.6157097, 1.768594, 0.1098039, 0, 1, 1,
0.4957224, 0.8252298, -0.7692598, 0.1176471, 0, 1, 1,
0.4962297, -0.731891, 1.852811, 0.1215686, 0, 1, 1,
0.5001671, -0.6256992, 2.889948, 0.1294118, 0, 1, 1,
0.5049335, 0.4465928, 2.360002, 0.1333333, 0, 1, 1,
0.5092198, 0.2772682, 0.7133306, 0.1411765, 0, 1, 1,
0.5095352, -1.619113, 4.729099, 0.145098, 0, 1, 1,
0.5115042, 0.7263492, 0.2510265, 0.1529412, 0, 1, 1,
0.5170919, -0.3432805, 1.590748, 0.1568628, 0, 1, 1,
0.5179466, -0.2292031, 2.951458, 0.1647059, 0, 1, 1,
0.5194416, 1.058701, 1.511451, 0.1686275, 0, 1, 1,
0.5226036, -0.2105489, 2.700456, 0.1764706, 0, 1, 1,
0.5278388, 0.5668422, -0.8630266, 0.1803922, 0, 1, 1,
0.5344006, -0.1318835, 1.511666, 0.1882353, 0, 1, 1,
0.5344763, -0.08361296, 2.462421, 0.1921569, 0, 1, 1,
0.537067, 0.8212116, 0.491122, 0.2, 0, 1, 1,
0.5376333, 0.3472561, 1.121304, 0.2078431, 0, 1, 1,
0.5423675, -0.2238335, 2.153776, 0.2117647, 0, 1, 1,
0.5472715, 1.702606, 1.733569, 0.2196078, 0, 1, 1,
0.5573574, 1.364666, 0.6413898, 0.2235294, 0, 1, 1,
0.5575406, -0.1621891, 1.498352, 0.2313726, 0, 1, 1,
0.5575778, 0.5105875, 1.045025, 0.2352941, 0, 1, 1,
0.560583, -0.1835421, 0.5118941, 0.2431373, 0, 1, 1,
0.560945, -1.497519, 2.581906, 0.2470588, 0, 1, 1,
0.5691631, -1.050939, 2.865584, 0.254902, 0, 1, 1,
0.5746738, 0.5000449, 1.747242, 0.2588235, 0, 1, 1,
0.57904, -2.5389, 3.527194, 0.2666667, 0, 1, 1,
0.5792326, 0.220121, 1.368845, 0.2705882, 0, 1, 1,
0.5810216, -0.4640257, 2.843561, 0.2784314, 0, 1, 1,
0.5823892, 0.838488, -0.8210076, 0.282353, 0, 1, 1,
0.5851678, 0.3698506, 1.921136, 0.2901961, 0, 1, 1,
0.5890208, 0.1521204, 1.872153, 0.2941177, 0, 1, 1,
0.5943835, 0.6124505, 0.4442337, 0.3019608, 0, 1, 1,
0.6014239, -0.1859752, 3.450324, 0.3098039, 0, 1, 1,
0.6147154, -1.325201, 3.374723, 0.3137255, 0, 1, 1,
0.6190925, 0.4286872, 1.1055, 0.3215686, 0, 1, 1,
0.622209, -0.4254011, 2.517973, 0.3254902, 0, 1, 1,
0.6243597, -0.05946905, 1.649779, 0.3333333, 0, 1, 1,
0.625625, 0.9960139, 0.4263524, 0.3372549, 0, 1, 1,
0.6274244, -0.6534631, 1.276899, 0.345098, 0, 1, 1,
0.6282169, 0.7016576, 2.572502, 0.3490196, 0, 1, 1,
0.6326014, -0.295315, 2.20413, 0.3568628, 0, 1, 1,
0.6353092, 0.5444804, 1.721033, 0.3607843, 0, 1, 1,
0.6357052, 2.058481, 2.335609, 0.3686275, 0, 1, 1,
0.6416671, -0.4134859, 2.593892, 0.372549, 0, 1, 1,
0.6417342, -0.5832292, 1.178892, 0.3803922, 0, 1, 1,
0.6420703, -0.1967701, 2.770226, 0.3843137, 0, 1, 1,
0.6458644, -0.06058807, 1.973306, 0.3921569, 0, 1, 1,
0.6461388, 0.001096807, 1.722625, 0.3960784, 0, 1, 1,
0.6568676, 0.3492596, 1.188072, 0.4039216, 0, 1, 1,
0.6572952, 0.2150479, 0.2145413, 0.4117647, 0, 1, 1,
0.6684893, -1.569444, 3.939726, 0.4156863, 0, 1, 1,
0.6702681, 0.6931389, 0.6646417, 0.4235294, 0, 1, 1,
0.6710589, -1.561447, 1.449831, 0.427451, 0, 1, 1,
0.6732398, -1.031721, 2.595427, 0.4352941, 0, 1, 1,
0.6798253, -1.205886, 4.455629, 0.4392157, 0, 1, 1,
0.682254, -0.08571912, 2.844168, 0.4470588, 0, 1, 1,
0.6829145, 0.1809937, 1.650392, 0.4509804, 0, 1, 1,
0.6854612, 0.3408961, 2.434457, 0.4588235, 0, 1, 1,
0.6897337, -0.7819601, 1.789526, 0.4627451, 0, 1, 1,
0.6931611, -0.7738203, 2.931898, 0.4705882, 0, 1, 1,
0.6946402, -0.0806414, 1.023876, 0.4745098, 0, 1, 1,
0.699325, 0.1231909, 0.741363, 0.4823529, 0, 1, 1,
0.7004451, -0.6306183, 2.058954, 0.4862745, 0, 1, 1,
0.701653, -1.281223, 1.233033, 0.4941176, 0, 1, 1,
0.7050639, 1.690167, -0.7531069, 0.5019608, 0, 1, 1,
0.7068109, 0.02519972, 1.753421, 0.5058824, 0, 1, 1,
0.7086196, -0.6473834, 4.676135, 0.5137255, 0, 1, 1,
0.7109752, -0.1809105, 1.470587, 0.5176471, 0, 1, 1,
0.7162284, 0.8395197, -0.1258176, 0.5254902, 0, 1, 1,
0.7176703, -0.3085374, 1.147382, 0.5294118, 0, 1, 1,
0.7255467, -0.003522187, 0.6908244, 0.5372549, 0, 1, 1,
0.7266911, 0.9199455, 0.7345555, 0.5411765, 0, 1, 1,
0.7338153, 1.272052, -0.8522899, 0.5490196, 0, 1, 1,
0.7340111, -1.168767, 1.642416, 0.5529412, 0, 1, 1,
0.7384061, -0.1668723, 1.284952, 0.5607843, 0, 1, 1,
0.7440215, -1.821736, 2.754227, 0.5647059, 0, 1, 1,
0.7483155, -0.9787465, 1.064335, 0.572549, 0, 1, 1,
0.7510539, 0.3355136, 2.450972, 0.5764706, 0, 1, 1,
0.75796, 0.642432, 2.055115, 0.5843138, 0, 1, 1,
0.7616526, 0.7535852, 0.1971222, 0.5882353, 0, 1, 1,
0.7620558, 1.010354, 0.09527422, 0.5960785, 0, 1, 1,
0.7738218, -0.04002087, 0.8170965, 0.6039216, 0, 1, 1,
0.7862163, -0.1001069, 2.544017, 0.6078432, 0, 1, 1,
0.7867999, -0.3696719, 2.042343, 0.6156863, 0, 1, 1,
0.7891977, 1.819779, 1.61194, 0.6196079, 0, 1, 1,
0.790783, 0.4826601, -0.6834545, 0.627451, 0, 1, 1,
0.7909349, -0.4380221, 1.909969, 0.6313726, 0, 1, 1,
0.7919568, 0.8988678, -0.07646707, 0.6392157, 0, 1, 1,
0.7920107, -0.5470953, 2.749992, 0.6431373, 0, 1, 1,
0.7921885, 1.343633, 1.440377, 0.6509804, 0, 1, 1,
0.7945142, 1.021598, 2.793274, 0.654902, 0, 1, 1,
0.8071073, -0.04597309, 3.145098, 0.6627451, 0, 1, 1,
0.8102287, -0.5191348, 1.135888, 0.6666667, 0, 1, 1,
0.8148639, 2.598035, 1.216836, 0.6745098, 0, 1, 1,
0.8324745, -0.3466525, 2.999688, 0.6784314, 0, 1, 1,
0.842735, 0.9827027, -0.9221868, 0.6862745, 0, 1, 1,
0.8450513, 0.3176909, 0.5770121, 0.6901961, 0, 1, 1,
0.8456634, -1.49845, 3.921765, 0.6980392, 0, 1, 1,
0.847184, -0.7263477, 1.172251, 0.7058824, 0, 1, 1,
0.8600073, -0.9858454, 3.551859, 0.7098039, 0, 1, 1,
0.867833, -1.368295, 3.926992, 0.7176471, 0, 1, 1,
0.8679178, 1.77134, 0.669494, 0.7215686, 0, 1, 1,
0.8735868, 2.045835, -1.519126, 0.7294118, 0, 1, 1,
0.8808392, -0.001116465, 1.836994, 0.7333333, 0, 1, 1,
0.8915014, -0.008484526, 2.339027, 0.7411765, 0, 1, 1,
0.8941433, 0.5353218, 0.3358714, 0.7450981, 0, 1, 1,
0.8951936, -0.004379864, 2.54295, 0.7529412, 0, 1, 1,
0.896683, 1.5425, 0.308454, 0.7568628, 0, 1, 1,
0.8997033, 0.7164504, 0.6736315, 0.7647059, 0, 1, 1,
0.9053518, -0.1760581, 2.71052, 0.7686275, 0, 1, 1,
0.9079778, 0.5505432, 1.451397, 0.7764706, 0, 1, 1,
0.9137037, -0.4343249, 1.598547, 0.7803922, 0, 1, 1,
0.9217623, -0.05440816, -0.5572004, 0.7882353, 0, 1, 1,
0.929162, 1.965286, -0.4194101, 0.7921569, 0, 1, 1,
0.9307824, 1.074835, 1.194898, 0.8, 0, 1, 1,
0.9328157, 1.331391, 0.8691657, 0.8078431, 0, 1, 1,
0.9370213, 1.184974, -0.4278559, 0.8117647, 0, 1, 1,
0.938415, 2.018513, 0.2208557, 0.8196079, 0, 1, 1,
0.9393026, 1.694408, 0.8292422, 0.8235294, 0, 1, 1,
0.9458128, -0.7841676, 0.2701356, 0.8313726, 0, 1, 1,
0.9464731, 1.131044, -0.4778333, 0.8352941, 0, 1, 1,
0.9531226, -0.2635765, 4.3055, 0.8431373, 0, 1, 1,
0.9622244, 1.366503, 3.040702, 0.8470588, 0, 1, 1,
0.966389, 1.880408, 1.405184, 0.854902, 0, 1, 1,
0.9706694, -0.9271518, 0.4748747, 0.8588235, 0, 1, 1,
0.9727117, -0.008111929, 3.494976, 0.8666667, 0, 1, 1,
0.9755286, 0.6289961, 1.33804, 0.8705882, 0, 1, 1,
0.9759206, 0.3872869, -0.1984111, 0.8784314, 0, 1, 1,
0.9836989, 1.316591, 1.088708, 0.8823529, 0, 1, 1,
0.9882513, -1.619123, 2.819211, 0.8901961, 0, 1, 1,
0.988925, -0.3227427, 1.48548, 0.8941177, 0, 1, 1,
0.990181, 1.252376, 0.1170865, 0.9019608, 0, 1, 1,
0.9928332, -0.4951331, 2.435746, 0.9098039, 0, 1, 1,
0.9995157, 0.2070623, 0.4914662, 0.9137255, 0, 1, 1,
1.001065, 0.2459863, -0.6164426, 0.9215686, 0, 1, 1,
1.003613, 0.8072991, 0.1749397, 0.9254902, 0, 1, 1,
1.003928, 0.3160064, 2.177963, 0.9333333, 0, 1, 1,
1.005921, 1.655162, 0.3132668, 0.9372549, 0, 1, 1,
1.012612, 0.2566327, 0.443635, 0.945098, 0, 1, 1,
1.016395, 0.3171838, 2.99314, 0.9490196, 0, 1, 1,
1.016687, 0.1735227, 1.430126, 0.9568627, 0, 1, 1,
1.018388, 0.9457185, 0.03957586, 0.9607843, 0, 1, 1,
1.026999, 1.170778, -0.3212696, 0.9686275, 0, 1, 1,
1.027307, -1.337657, 3.603609, 0.972549, 0, 1, 1,
1.029602, -0.4419585, 1.459833, 0.9803922, 0, 1, 1,
1.033425, -1.111102, -0.02825894, 0.9843137, 0, 1, 1,
1.037986, 0.4425902, 1.836076, 0.9921569, 0, 1, 1,
1.049051, -0.3697161, 1.172194, 0.9960784, 0, 1, 1,
1.050888, 0.7962563, 1.713933, 1, 0, 0.9960784, 1,
1.053361, 0.4489699, 2.118101, 1, 0, 0.9882353, 1,
1.060107, 2.500007, 0.9825144, 1, 0, 0.9843137, 1,
1.069422, 1.813636, 0.1933134, 1, 0, 0.9764706, 1,
1.073562, -2.453309, 2.160023, 1, 0, 0.972549, 1,
1.080213, 0.7798932, 1.656543, 1, 0, 0.9647059, 1,
1.092526, 0.3108309, -0.1425033, 1, 0, 0.9607843, 1,
1.092879, -1.128038, 0.9209619, 1, 0, 0.9529412, 1,
1.098513, 0.8734014, 1.157628, 1, 0, 0.9490196, 1,
1.100443, 1.820804, 0.003008007, 1, 0, 0.9411765, 1,
1.100582, -0.1442426, 1.634537, 1, 0, 0.9372549, 1,
1.112848, 2.782542, 0.3865691, 1, 0, 0.9294118, 1,
1.114347, -1.750661, 2.23561, 1, 0, 0.9254902, 1,
1.118311, 0.7422403, -0.4560494, 1, 0, 0.9176471, 1,
1.135883, -0.8375981, 1.990533, 1, 0, 0.9137255, 1,
1.145474, 1.347505, 1.893, 1, 0, 0.9058824, 1,
1.150799, -0.1013756, 2.774073, 1, 0, 0.9019608, 1,
1.153006, -0.6068878, 2.777518, 1, 0, 0.8941177, 1,
1.153859, 0.6420577, 1.584159, 1, 0, 0.8862745, 1,
1.155152, 0.9628841, 1.47067, 1, 0, 0.8823529, 1,
1.155576, 0.119253, 1.94248, 1, 0, 0.8745098, 1,
1.169109, 1.165276, 0.8025363, 1, 0, 0.8705882, 1,
1.176638, 1.22008, -0.4047361, 1, 0, 0.8627451, 1,
1.183305, 0.7295212, 0.1854368, 1, 0, 0.8588235, 1,
1.18622, 1.057459, 1.822289, 1, 0, 0.8509804, 1,
1.189532, 1.393872, 1.680902, 1, 0, 0.8470588, 1,
1.19096, -0.09844383, 2.371182, 1, 0, 0.8392157, 1,
1.202277, -0.9815321, 3.165143, 1, 0, 0.8352941, 1,
1.203245, -0.1241045, 0.8583605, 1, 0, 0.827451, 1,
1.203656, -0.7214804, 1.419349, 1, 0, 0.8235294, 1,
1.211179, 1.281758, 0.3083318, 1, 0, 0.8156863, 1,
1.214267, 0.5621008, -0.1168583, 1, 0, 0.8117647, 1,
1.217806, 1.154186, 1.103775, 1, 0, 0.8039216, 1,
1.219058, -0.325289, 2.461651, 1, 0, 0.7960784, 1,
1.222865, -0.4564555, 1.838074, 1, 0, 0.7921569, 1,
1.225133, 0.82884, 1.878585, 1, 0, 0.7843137, 1,
1.228612, 1.492176, -1.000541, 1, 0, 0.7803922, 1,
1.23155, 0.9291111, 1.439028, 1, 0, 0.772549, 1,
1.23426, -0.5071432, 1.548503, 1, 0, 0.7686275, 1,
1.237714, -2.173733, 2.823868, 1, 0, 0.7607843, 1,
1.244209, 0.5798082, 2.815555, 1, 0, 0.7568628, 1,
1.247071, -0.8423867, 1.749711, 1, 0, 0.7490196, 1,
1.253321, 0.484695, 0.5779626, 1, 0, 0.7450981, 1,
1.258517, 0.8937283, 1.357968, 1, 0, 0.7372549, 1,
1.260544, 0.8213092, 2.792432, 1, 0, 0.7333333, 1,
1.272322, -1.103812, 1.830599, 1, 0, 0.7254902, 1,
1.276845, -0.5823643, 1.845498, 1, 0, 0.7215686, 1,
1.286148, -2.383771, 3.018211, 1, 0, 0.7137255, 1,
1.291551, 0.262126, 1.599779, 1, 0, 0.7098039, 1,
1.294643, 1.309232, 0.5903421, 1, 0, 0.7019608, 1,
1.302111, 1.280998, 1.148059, 1, 0, 0.6941177, 1,
1.304569, -0.9828136, 0.7572109, 1, 0, 0.6901961, 1,
1.309768, 0.5083028, 0.1698293, 1, 0, 0.682353, 1,
1.315594, -0.3904072, 2.068904, 1, 0, 0.6784314, 1,
1.32001, 0.4500113, 1.032756, 1, 0, 0.6705883, 1,
1.331722, -0.2804699, 2.991913, 1, 0, 0.6666667, 1,
1.34317, 0.6775449, 0.7608478, 1, 0, 0.6588235, 1,
1.344249, -1.628328, 2.826195, 1, 0, 0.654902, 1,
1.353283, -2.952079, 3.176086, 1, 0, 0.6470588, 1,
1.353842, 1.698945, 0.8375524, 1, 0, 0.6431373, 1,
1.361353, -0.1273558, 1.215165, 1, 0, 0.6352941, 1,
1.367262, 1.761639, 1.314985, 1, 0, 0.6313726, 1,
1.371867, -0.6336125, 1.960408, 1, 0, 0.6235294, 1,
1.380064, 0.08337856, 1.250086, 1, 0, 0.6196079, 1,
1.390743, -1.740103, 5.001148, 1, 0, 0.6117647, 1,
1.394088, -0.7996171, 1.244052, 1, 0, 0.6078432, 1,
1.395907, -1.010076, -0.04095134, 1, 0, 0.6, 1,
1.408602, 0.06777875, 1.932229, 1, 0, 0.5921569, 1,
1.410739, -0.468568, 1.814664, 1, 0, 0.5882353, 1,
1.416951, -0.7069235, 2.334553, 1, 0, 0.5803922, 1,
1.417595, -1.53552, 1.683097, 1, 0, 0.5764706, 1,
1.425009, -2.179799, 2.364466, 1, 0, 0.5686275, 1,
1.426022, 1.12315, 0.8340972, 1, 0, 0.5647059, 1,
1.429844, 1.024324, 0.9115548, 1, 0, 0.5568628, 1,
1.43896, 0.3953065, 1.765896, 1, 0, 0.5529412, 1,
1.440468, -1.218894, 2.233675, 1, 0, 0.5450981, 1,
1.440514, 0.4681698, 1.065211, 1, 0, 0.5411765, 1,
1.44206, 0.9299869, 0.1127143, 1, 0, 0.5333334, 1,
1.457579, -0.5628529, 2.054597, 1, 0, 0.5294118, 1,
1.457953, 1.954312, 0.6321998, 1, 0, 0.5215687, 1,
1.461103, -1.210497, 3.264443, 1, 0, 0.5176471, 1,
1.462571, 0.4677073, 0.2004482, 1, 0, 0.509804, 1,
1.464017, 0.08662085, 2.457469, 1, 0, 0.5058824, 1,
1.466946, -0.1146447, 3.210899, 1, 0, 0.4980392, 1,
1.470687, 0.4129107, 1.215627, 1, 0, 0.4901961, 1,
1.473131, -0.2139531, 1.640692, 1, 0, 0.4862745, 1,
1.489036, -0.3460957, 1.680365, 1, 0, 0.4784314, 1,
1.496131, 0.3385036, 2.152491, 1, 0, 0.4745098, 1,
1.506178, 0.3631023, 2.381209, 1, 0, 0.4666667, 1,
1.508372, -0.1157661, 1.579017, 1, 0, 0.4627451, 1,
1.508578, -0.07266467, 2.182763, 1, 0, 0.454902, 1,
1.538983, 0.2438915, 2.127039, 1, 0, 0.4509804, 1,
1.544854, 0.5042593, 1.708134, 1, 0, 0.4431373, 1,
1.558313, 1.803127, -0.4583621, 1, 0, 0.4392157, 1,
1.562423, -0.7016109, 1.831152, 1, 0, 0.4313726, 1,
1.568422, 0.04806591, 2.361275, 1, 0, 0.427451, 1,
1.578438, 0.9634772, -0.4652688, 1, 0, 0.4196078, 1,
1.595693, -0.5934079, 2.530985, 1, 0, 0.4156863, 1,
1.596043, 0.5108756, 0.4264087, 1, 0, 0.4078431, 1,
1.597899, -0.7460438, 2.412839, 1, 0, 0.4039216, 1,
1.619363, -3.047975, 0.9644534, 1, 0, 0.3960784, 1,
1.62004, 0.3680528, -0.07378861, 1, 0, 0.3882353, 1,
1.628677, -1.298676, 3.187182, 1, 0, 0.3843137, 1,
1.630486, 0.4145903, 0.9708141, 1, 0, 0.3764706, 1,
1.634061, -1.078032, 5.77949, 1, 0, 0.372549, 1,
1.641512, 0.2024602, 1.636504, 1, 0, 0.3647059, 1,
1.650238, 0.05648135, 0.5727345, 1, 0, 0.3607843, 1,
1.65237, -0.8712883, 2.120685, 1, 0, 0.3529412, 1,
1.654871, 1.302622, 0.1286706, 1, 0, 0.3490196, 1,
1.655582, 1.251598, 0.1669801, 1, 0, 0.3411765, 1,
1.659587, -0.5244952, 3.025671, 1, 0, 0.3372549, 1,
1.669053, 0.430518, 1.297211, 1, 0, 0.3294118, 1,
1.675036, -0.07069245, 2.552447, 1, 0, 0.3254902, 1,
1.695893, 0.1419293, 1.394507, 1, 0, 0.3176471, 1,
1.707954, 2.884987, 0.08932571, 1, 0, 0.3137255, 1,
1.713028, -0.4890999, 3.105473, 1, 0, 0.3058824, 1,
1.730718, -2.258879, 2.104033, 1, 0, 0.2980392, 1,
1.753029, 0.5898902, 0.3647114, 1, 0, 0.2941177, 1,
1.759833, 0.5856171, 0.8997802, 1, 0, 0.2862745, 1,
1.765295, 0.7355995, -0.06513688, 1, 0, 0.282353, 1,
1.76812, 1.417492, 2.413536, 1, 0, 0.2745098, 1,
1.777902, 0.03159988, 1.848945, 1, 0, 0.2705882, 1,
1.814067, -2.839656, 3.073798, 1, 0, 0.2627451, 1,
1.818532, -0.1248081, 2.219841, 1, 0, 0.2588235, 1,
1.822079, -1.901335, 2.493251, 1, 0, 0.2509804, 1,
1.853611, -1.134708, 1.385606, 1, 0, 0.2470588, 1,
1.867893, -0.02985729, 0.9604887, 1, 0, 0.2392157, 1,
1.886307, 0.8249215, 2.10691, 1, 0, 0.2352941, 1,
1.909301, 1.376014, 0.4693241, 1, 0, 0.227451, 1,
1.918047, 1.064334, -0.8781705, 1, 0, 0.2235294, 1,
1.919947, 0.2794872, 1.671836, 1, 0, 0.2156863, 1,
1.927656, 0.2649619, 2.405827, 1, 0, 0.2117647, 1,
1.930343, 0.2234112, 1.10628, 1, 0, 0.2039216, 1,
1.932927, 0.199117, 0.7427093, 1, 0, 0.1960784, 1,
1.943438, 1.13013, -0.1003608, 1, 0, 0.1921569, 1,
1.951844, -0.3132247, 1.554129, 1, 0, 0.1843137, 1,
1.955858, 0.9644193, -0.3874849, 1, 0, 0.1803922, 1,
1.962085, 0.1093426, 1.643642, 1, 0, 0.172549, 1,
1.979716, 1.580811, -0.2797303, 1, 0, 0.1686275, 1,
2.020666, -0.130179, -0.3635306, 1, 0, 0.1607843, 1,
2.026526, 0.008303844, -0.7457041, 1, 0, 0.1568628, 1,
2.053934, -0.9788229, 3.306347, 1, 0, 0.1490196, 1,
2.056623, -0.4182973, 1.484967, 1, 0, 0.145098, 1,
2.079438, -0.2365626, 2.18536, 1, 0, 0.1372549, 1,
2.087504, -0.368703, 3.163973, 1, 0, 0.1333333, 1,
2.151412, -0.493157, 2.908852, 1, 0, 0.1254902, 1,
2.1987, -0.8063406, 4.082856, 1, 0, 0.1215686, 1,
2.261044, 0.1085026, 3.755513, 1, 0, 0.1137255, 1,
2.323344, -0.8576765, 3.466549, 1, 0, 0.1098039, 1,
2.358525, -2.323724, 0.8587136, 1, 0, 0.1019608, 1,
2.397869, -0.5068308, 0.7792178, 1, 0, 0.09411765, 1,
2.406497, 0.2024688, 1.264344, 1, 0, 0.09019608, 1,
2.45083, 1.365744, 0.8259017, 1, 0, 0.08235294, 1,
2.480088, 0.2483685, 2.769061, 1, 0, 0.07843138, 1,
2.519695, 0.8769715, 1.350724, 1, 0, 0.07058824, 1,
2.565855, -1.166314, 1.887916, 1, 0, 0.06666667, 1,
2.596829, -0.1087206, 1.782711, 1, 0, 0.05882353, 1,
2.600724, -0.7941107, 1.861644, 1, 0, 0.05490196, 1,
2.654114, -0.03363034, 1.76059, 1, 0, 0.04705882, 1,
2.664629, 0.9989488, 2.377146, 1, 0, 0.04313726, 1,
2.943059, 1.152292, 1.626329, 1, 0, 0.03529412, 1,
2.989825, 0.6950001, 1.372326, 1, 0, 0.03137255, 1,
3.000453, 1.041487, 1.944605, 1, 0, 0.02352941, 1,
3.127536, -1.282486, 2.847717, 1, 0, 0.01960784, 1,
3.753794, -0.8605216, 2.837452, 1, 0, 0.01176471, 1,
4.366508, 0.02639202, 1.716733, 1, 0, 0.007843138, 1
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
0.5516078, -4.192416, -7.096062, 0, -0.5, 0.5, 0.5,
0.5516078, -4.192416, -7.096062, 1, -0.5, 0.5, 0.5,
0.5516078, -4.192416, -7.096062, 1, 1.5, 0.5, 0.5,
0.5516078, -4.192416, -7.096062, 0, 1.5, 0.5, 0.5
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
-4.556543, -0.1408376, -7.096062, 0, -0.5, 0.5, 0.5,
-4.556543, -0.1408376, -7.096062, 1, -0.5, 0.5, 0.5,
-4.556543, -0.1408376, -7.096062, 1, 1.5, 0.5, 0.5,
-4.556543, -0.1408376, -7.096062, 0, 1.5, 0.5, 0.5
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
-4.556543, -4.192416, 0.2747648, 0, -0.5, 0.5, 0.5,
-4.556543, -4.192416, 0.2747648, 1, -0.5, 0.5, 0.5,
-4.556543, -4.192416, 0.2747648, 1, 1.5, 0.5, 0.5,
-4.556543, -4.192416, 0.2747648, 0, 1.5, 0.5, 0.5
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
-2, -3.257437, -5.395102,
4, -3.257437, -5.395102,
-2, -3.257437, -5.395102,
-2, -3.413266, -5.678595,
0, -3.257437, -5.395102,
0, -3.413266, -5.678595,
2, -3.257437, -5.395102,
2, -3.413266, -5.678595,
4, -3.257437, -5.395102,
4, -3.413266, -5.678595
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
"2",
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
-2, -3.724926, -6.245582, 0, -0.5, 0.5, 0.5,
-2, -3.724926, -6.245582, 1, -0.5, 0.5, 0.5,
-2, -3.724926, -6.245582, 1, 1.5, 0.5, 0.5,
-2, -3.724926, -6.245582, 0, 1.5, 0.5, 0.5,
0, -3.724926, -6.245582, 0, -0.5, 0.5, 0.5,
0, -3.724926, -6.245582, 1, -0.5, 0.5, 0.5,
0, -3.724926, -6.245582, 1, 1.5, 0.5, 0.5,
0, -3.724926, -6.245582, 0, 1.5, 0.5, 0.5,
2, -3.724926, -6.245582, 0, -0.5, 0.5, 0.5,
2, -3.724926, -6.245582, 1, -0.5, 0.5, 0.5,
2, -3.724926, -6.245582, 1, 1.5, 0.5, 0.5,
2, -3.724926, -6.245582, 0, 1.5, 0.5, 0.5,
4, -3.724926, -6.245582, 0, -0.5, 0.5, 0.5,
4, -3.724926, -6.245582, 1, -0.5, 0.5, 0.5,
4, -3.724926, -6.245582, 1, 1.5, 0.5, 0.5,
4, -3.724926, -6.245582, 0, 1.5, 0.5, 0.5
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
-3.377739, -3, -5.395102,
-3.377739, 2, -5.395102,
-3.377739, -3, -5.395102,
-3.574206, -3, -5.678595,
-3.377739, -2, -5.395102,
-3.574206, -2, -5.678595,
-3.377739, -1, -5.395102,
-3.574206, -1, -5.678595,
-3.377739, 0, -5.395102,
-3.574206, 0, -5.678595,
-3.377739, 1, -5.395102,
-3.574206, 1, -5.678595,
-3.377739, 2, -5.395102,
-3.574206, 2, -5.678595
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
-3.967141, -3, -6.245582, 0, -0.5, 0.5, 0.5,
-3.967141, -3, -6.245582, 1, -0.5, 0.5, 0.5,
-3.967141, -3, -6.245582, 1, 1.5, 0.5, 0.5,
-3.967141, -3, -6.245582, 0, 1.5, 0.5, 0.5,
-3.967141, -2, -6.245582, 0, -0.5, 0.5, 0.5,
-3.967141, -2, -6.245582, 1, -0.5, 0.5, 0.5,
-3.967141, -2, -6.245582, 1, 1.5, 0.5, 0.5,
-3.967141, -2, -6.245582, 0, 1.5, 0.5, 0.5,
-3.967141, -1, -6.245582, 0, -0.5, 0.5, 0.5,
-3.967141, -1, -6.245582, 1, -0.5, 0.5, 0.5,
-3.967141, -1, -6.245582, 1, 1.5, 0.5, 0.5,
-3.967141, -1, -6.245582, 0, 1.5, 0.5, 0.5,
-3.967141, 0, -6.245582, 0, -0.5, 0.5, 0.5,
-3.967141, 0, -6.245582, 1, -0.5, 0.5, 0.5,
-3.967141, 0, -6.245582, 1, 1.5, 0.5, 0.5,
-3.967141, 0, -6.245582, 0, 1.5, 0.5, 0.5,
-3.967141, 1, -6.245582, 0, -0.5, 0.5, 0.5,
-3.967141, 1, -6.245582, 1, -0.5, 0.5, 0.5,
-3.967141, 1, -6.245582, 1, 1.5, 0.5, 0.5,
-3.967141, 1, -6.245582, 0, 1.5, 0.5, 0.5,
-3.967141, 2, -6.245582, 0, -0.5, 0.5, 0.5,
-3.967141, 2, -6.245582, 1, -0.5, 0.5, 0.5,
-3.967141, 2, -6.245582, 1, 1.5, 0.5, 0.5,
-3.967141, 2, -6.245582, 0, 1.5, 0.5, 0.5
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
-3.377739, -3.257437, -4,
-3.377739, -3.257437, 4,
-3.377739, -3.257437, -4,
-3.574206, -3.413266, -4,
-3.377739, -3.257437, -2,
-3.574206, -3.413266, -2,
-3.377739, -3.257437, 0,
-3.574206, -3.413266, 0,
-3.377739, -3.257437, 2,
-3.574206, -3.413266, 2,
-3.377739, -3.257437, 4,
-3.574206, -3.413266, 4
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
-3.967141, -3.724926, -4, 0, -0.5, 0.5, 0.5,
-3.967141, -3.724926, -4, 1, -0.5, 0.5, 0.5,
-3.967141, -3.724926, -4, 1, 1.5, 0.5, 0.5,
-3.967141, -3.724926, -4, 0, 1.5, 0.5, 0.5,
-3.967141, -3.724926, -2, 0, -0.5, 0.5, 0.5,
-3.967141, -3.724926, -2, 1, -0.5, 0.5, 0.5,
-3.967141, -3.724926, -2, 1, 1.5, 0.5, 0.5,
-3.967141, -3.724926, -2, 0, 1.5, 0.5, 0.5,
-3.967141, -3.724926, 0, 0, -0.5, 0.5, 0.5,
-3.967141, -3.724926, 0, 1, -0.5, 0.5, 0.5,
-3.967141, -3.724926, 0, 1, 1.5, 0.5, 0.5,
-3.967141, -3.724926, 0, 0, 1.5, 0.5, 0.5,
-3.967141, -3.724926, 2, 0, -0.5, 0.5, 0.5,
-3.967141, -3.724926, 2, 1, -0.5, 0.5, 0.5,
-3.967141, -3.724926, 2, 1, 1.5, 0.5, 0.5,
-3.967141, -3.724926, 2, 0, 1.5, 0.5, 0.5,
-3.967141, -3.724926, 4, 0, -0.5, 0.5, 0.5,
-3.967141, -3.724926, 4, 1, -0.5, 0.5, 0.5,
-3.967141, -3.724926, 4, 1, 1.5, 0.5, 0.5,
-3.967141, -3.724926, 4, 0, 1.5, 0.5, 0.5
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
-3.377739, -3.257437, -5.395102,
-3.377739, 2.975761, -5.395102,
-3.377739, -3.257437, 5.944631,
-3.377739, 2.975761, 5.944631,
-3.377739, -3.257437, -5.395102,
-3.377739, -3.257437, 5.944631,
-3.377739, 2.975761, -5.395102,
-3.377739, 2.975761, 5.944631,
-3.377739, -3.257437, -5.395102,
4.480955, -3.257437, -5.395102,
-3.377739, -3.257437, 5.944631,
4.480955, -3.257437, 5.944631,
-3.377739, 2.975761, -5.395102,
4.480955, 2.975761, -5.395102,
-3.377739, 2.975761, 5.944631,
4.480955, 2.975761, 5.944631,
4.480955, -3.257437, -5.395102,
4.480955, 2.975761, -5.395102,
4.480955, -3.257437, 5.944631,
4.480955, 2.975761, 5.944631,
4.480955, -3.257437, -5.395102,
4.480955, -3.257437, 5.944631,
4.480955, 2.975761, -5.395102,
4.480955, 2.975761, 5.944631
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
var radius = 8.084144;
var distance = 35.96727;
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
mvMatrix.translate( -0.5516078, 0.1408376, -0.2747648 );
mvMatrix.scale( 1.112238, 1.402287, 0.7708061 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.96727);
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
ammonium_iron_methyl<-read.table("ammonium_iron_methyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ammonium_iron_methyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'ammonium_iron_methyl' not found
```

```r
y<-ammonium_iron_methyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'ammonium_iron_methyl' not found
```

```r
z<-ammonium_iron_methyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'ammonium_iron_methyl' not found
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
-3.263292, 0.2136271, -1.583883, 0, 0, 1, 1, 1,
-2.518934, 0.2066742, 0.2643012, 1, 0, 0, 1, 1,
-2.469423, 0.6147617, -0.7531531, 1, 0, 0, 1, 1,
-2.450553, 2.08893, -1.162078, 1, 0, 0, 1, 1,
-2.443067, -0.1284624, -1.945171, 1, 0, 0, 1, 1,
-2.431849, 0.9634287, 0.7777016, 1, 0, 0, 1, 1,
-2.36484, 1.043745, 0.6095544, 0, 0, 0, 1, 1,
-2.313912, 0.7404098, 0.541979, 0, 0, 0, 1, 1,
-2.308272, 0.8198715, -3.119125, 0, 0, 0, 1, 1,
-2.247769, 0.1224401, -3.742366, 0, 0, 0, 1, 1,
-2.243956, -0.7715418, -2.489104, 0, 0, 0, 1, 1,
-2.183853, -0.2973591, -1.070036, 0, 0, 0, 1, 1,
-2.171445, -0.4936512, -2.682861, 0, 0, 0, 1, 1,
-2.16957, -0.03077825, -3.476995, 1, 1, 1, 1, 1,
-2.144414, 1.150692, -0.4707527, 1, 1, 1, 1, 1,
-2.129776, -1.170851, -1.957272, 1, 1, 1, 1, 1,
-2.114803, -1.180438, -2.012213, 1, 1, 1, 1, 1,
-2.103261, 1.587086, -0.572385, 1, 1, 1, 1, 1,
-2.100264, 0.02545125, -2.203501, 1, 1, 1, 1, 1,
-2.092745, -1.794769, -3.898845, 1, 1, 1, 1, 1,
-2.076834, 0.1564939, -2.583925, 1, 1, 1, 1, 1,
-2.069265, -0.1829281, -2.449936, 1, 1, 1, 1, 1,
-2.017286, -0.1760658, -3.761413, 1, 1, 1, 1, 1,
-1.978367, 1.33849, -1.571172, 1, 1, 1, 1, 1,
-1.972284, -0.935644, -2.329649, 1, 1, 1, 1, 1,
-1.962854, 0.2526631, -1.104649, 1, 1, 1, 1, 1,
-1.948367, -0.5891835, -1.588047, 1, 1, 1, 1, 1,
-1.934435, 0.5133451, -1.726894, 1, 1, 1, 1, 1,
-1.913579, 1.961052, -2.01245, 0, 0, 1, 1, 1,
-1.883397, 0.7723344, -1.799922, 1, 0, 0, 1, 1,
-1.85094, 1.488198, -2.000571, 1, 0, 0, 1, 1,
-1.823797, -0.1999134, -2.683435, 1, 0, 0, 1, 1,
-1.784932, 0.6262451, -0.9933925, 1, 0, 0, 1, 1,
-1.769891, -0.4908365, -3.064554, 1, 0, 0, 1, 1,
-1.754653, 1.374895, -1.375705, 0, 0, 0, 1, 1,
-1.746575, 0.997499, -0.6508985, 0, 0, 0, 1, 1,
-1.740679, -1.491595, -3.885422, 0, 0, 0, 1, 1,
-1.730986, -1.329005, -0.4157017, 0, 0, 0, 1, 1,
-1.719516, 1.666406, -0.6151353, 0, 0, 0, 1, 1,
-1.713098, -1.766608, -3.630174, 0, 0, 0, 1, 1,
-1.704488, -0.8700722, -1.112288, 0, 0, 0, 1, 1,
-1.680993, 2.18993, -1.796968, 1, 1, 1, 1, 1,
-1.6803, 0.6724441, -1.291257, 1, 1, 1, 1, 1,
-1.673409, -0.04901581, -1.085088, 1, 1, 1, 1, 1,
-1.664132, -0.2094909, -2.314481, 1, 1, 1, 1, 1,
-1.635757, 0.853119, -1.494534, 1, 1, 1, 1, 1,
-1.625686, -0.00262684, -2.362416, 1, 1, 1, 1, 1,
-1.62237, -1.018397, -0.6403708, 1, 1, 1, 1, 1,
-1.60165, -1.710237, -3.137649, 1, 1, 1, 1, 1,
-1.601358, -0.3425316, -1.787178, 1, 1, 1, 1, 1,
-1.580175, 0.8977011, -0.009772848, 1, 1, 1, 1, 1,
-1.570682, -1.053342, -2.04933, 1, 1, 1, 1, 1,
-1.568456, -0.5084585, -1.933145, 1, 1, 1, 1, 1,
-1.564156, -0.4608383, -1.133357, 1, 1, 1, 1, 1,
-1.519145, 0.4906951, -1.128518, 1, 1, 1, 1, 1,
-1.514269, 1.96382, -0.05411147, 1, 1, 1, 1, 1,
-1.514086, 0.295813, -0.28578, 0, 0, 1, 1, 1,
-1.512418, 1.003074, 1.104754, 1, 0, 0, 1, 1,
-1.504792, -0.1933523, -2.507664, 1, 0, 0, 1, 1,
-1.500075, 1.081389, -1.59638, 1, 0, 0, 1, 1,
-1.493535, 1.079111, 0.8928626, 1, 0, 0, 1, 1,
-1.483403, -0.4504912, -2.324306, 1, 0, 0, 1, 1,
-1.465641, -0.6109481, -1.162079, 0, 0, 0, 1, 1,
-1.465343, -0.7128295, -1.687115, 0, 0, 0, 1, 1,
-1.457602, -2.072274, -1.185032, 0, 0, 0, 1, 1,
-1.450611, -0.6676564, -0.1547518, 0, 0, 0, 1, 1,
-1.446834, -1.253931, -1.478198, 0, 0, 0, 1, 1,
-1.445819, -0.5201013, -1.442765, 0, 0, 0, 1, 1,
-1.442128, 0.3119127, -2.392607, 0, 0, 0, 1, 1,
-1.435547, 0.1388754, -2.044677, 1, 1, 1, 1, 1,
-1.4355, -0.2672963, -3.797864, 1, 1, 1, 1, 1,
-1.432066, 0.693628, 0.0217711, 1, 1, 1, 1, 1,
-1.4217, 0.2765045, -1.995079, 1, 1, 1, 1, 1,
-1.41937, 0.144757, -2.759334, 1, 1, 1, 1, 1,
-1.41775, -0.8920984, -2.586648, 1, 1, 1, 1, 1,
-1.416278, -0.9311482, -2.459712, 1, 1, 1, 1, 1,
-1.411172, -0.2894378, -2.472943, 1, 1, 1, 1, 1,
-1.409391, -1.088384, -2.895748, 1, 1, 1, 1, 1,
-1.404632, 0.585914, 0.3268622, 1, 1, 1, 1, 1,
-1.401782, -0.5143245, -3.665795, 1, 1, 1, 1, 1,
-1.372745, -0.4926467, -1.19459, 1, 1, 1, 1, 1,
-1.369739, -0.02616663, -1.030416, 1, 1, 1, 1, 1,
-1.355762, 1.486616, -0.3833489, 1, 1, 1, 1, 1,
-1.352477, -0.6635823, -1.17105, 1, 1, 1, 1, 1,
-1.346957, -1.121983, -1.756649, 0, 0, 1, 1, 1,
-1.339771, 0.2277419, -1.928279, 1, 0, 0, 1, 1,
-1.33232, 0.7743903, -1.692162, 1, 0, 0, 1, 1,
-1.327568, -1.224657, -3.474178, 1, 0, 0, 1, 1,
-1.323873, -0.4096944, -2.858586, 1, 0, 0, 1, 1,
-1.31995, -0.1774197, -2.357816, 1, 0, 0, 1, 1,
-1.314136, -0.2269115, -2.389841, 0, 0, 0, 1, 1,
-1.303658, -0.03775278, -1.50685, 0, 0, 0, 1, 1,
-1.301994, -0.1320663, -0.8335495, 0, 0, 0, 1, 1,
-1.297304, -0.2452123, -1.245163, 0, 0, 0, 1, 1,
-1.287364, -0.1601091, -0.8685694, 0, 0, 0, 1, 1,
-1.286633, 1.812678, -1.112477, 0, 0, 0, 1, 1,
-1.276807, 0.03808211, -2.642588, 0, 0, 0, 1, 1,
-1.271256, -2.245016, -4.912634, 1, 1, 1, 1, 1,
-1.270732, 0.2127358, -0.9664098, 1, 1, 1, 1, 1,
-1.269335, 0.8526881, -1.951914, 1, 1, 1, 1, 1,
-1.2693, -0.1836485, -0.2697676, 1, 1, 1, 1, 1,
-1.264702, 1.734676, -0.259967, 1, 1, 1, 1, 1,
-1.264354, 0.465864, -3.533416, 1, 1, 1, 1, 1,
-1.253536, -0.7058203, -0.5143989, 1, 1, 1, 1, 1,
-1.250608, -0.2528412, -2.498085, 1, 1, 1, 1, 1,
-1.249341, 0.5916566, -2.817317, 1, 1, 1, 1, 1,
-1.24602, 0.1011844, -1.560574, 1, 1, 1, 1, 1,
-1.241102, 0.4383107, -1.13418, 1, 1, 1, 1, 1,
-1.241033, -0.8712439, -0.4741825, 1, 1, 1, 1, 1,
-1.239812, -1.174793, -3.141767, 1, 1, 1, 1, 1,
-1.239131, 0.7802399, -0.6226676, 1, 1, 1, 1, 1,
-1.234365, -0.2245473, -1.513831, 1, 1, 1, 1, 1,
-1.231563, 1.603634, -0.5053833, 0, 0, 1, 1, 1,
-1.229464, -0.1512137, -1.900769, 1, 0, 0, 1, 1,
-1.206757, -0.1416103, -0.8251533, 1, 0, 0, 1, 1,
-1.206649, -1.1782, -1.82332, 1, 0, 0, 1, 1,
-1.192927, -0.5349261, -1.215297, 1, 0, 0, 1, 1,
-1.183132, 1.034706, -1.492463, 1, 0, 0, 1, 1,
-1.181396, 0.09502894, -1.549685, 0, 0, 0, 1, 1,
-1.181143, 0.4599874, -1.135512, 0, 0, 0, 1, 1,
-1.177566, -2.245158, -1.743938, 0, 0, 0, 1, 1,
-1.1726, -0.9519145, -3.001996, 0, 0, 0, 1, 1,
-1.153227, -0.7437701, -1.38458, 0, 0, 0, 1, 1,
-1.150554, 0.8803447, 0.08665337, 0, 0, 0, 1, 1,
-1.149893, -0.5660173, -2.3982, 0, 0, 0, 1, 1,
-1.146409, 0.5172819, -2.320514, 1, 1, 1, 1, 1,
-1.141744, -0.6934023, -1.905846, 1, 1, 1, 1, 1,
-1.141569, 0.3032097, -1.228003, 1, 1, 1, 1, 1,
-1.135493, -0.1214067, -2.117076, 1, 1, 1, 1, 1,
-1.130145, -1.316469, -2.90265, 1, 1, 1, 1, 1,
-1.128062, -0.454854, -0.1064507, 1, 1, 1, 1, 1,
-1.118365, 1.131749, -2.122087, 1, 1, 1, 1, 1,
-1.114686, -1.625306, -0.6838605, 1, 1, 1, 1, 1,
-1.10522, 0.1712061, 0.9286056, 1, 1, 1, 1, 1,
-1.103668, 1.134496, -0.1038786, 1, 1, 1, 1, 1,
-1.102714, 0.9214317, -0.3624096, 1, 1, 1, 1, 1,
-1.089833, -0.6436281, -1.444672, 1, 1, 1, 1, 1,
-1.088275, 0.09031128, -1.629843, 1, 1, 1, 1, 1,
-1.077202, 0.0004880309, -0.6455188, 1, 1, 1, 1, 1,
-1.075376, 1.085296, -0.8661997, 1, 1, 1, 1, 1,
-1.074359, 1.216802, -0.2667134, 0, 0, 1, 1, 1,
-1.065484, 0.1119142, -1.058246, 1, 0, 0, 1, 1,
-1.055304, 2.667852, -1.258562, 1, 0, 0, 1, 1,
-1.052781, -0.1579089, -2.265051, 1, 0, 0, 1, 1,
-1.049635, 1.305763, -0.5939214, 1, 0, 0, 1, 1,
-1.043123, -0.01816862, -3.24066, 1, 0, 0, 1, 1,
-1.036036, -0.87091, -3.426256, 0, 0, 0, 1, 1,
-1.031493, 1.346753, -1.727884, 0, 0, 0, 1, 1,
-1.027945, -2.412685, -2.332222, 0, 0, 0, 1, 1,
-1.008202, -1.148159, -1.76345, 0, 0, 0, 1, 1,
-1.007835, -0.3928102, -2.746185, 0, 0, 0, 1, 1,
-1.007133, -0.2426118, -0.2803641, 0, 0, 0, 1, 1,
-1.004773, 1.36354, -0.4504432, 0, 0, 0, 1, 1,
-1.004529, -0.5165383, -3.420884, 1, 1, 1, 1, 1,
-1.003188, -1.043898, -3.369457, 1, 1, 1, 1, 1,
-0.9886066, 1.817904, 1.205251, 1, 1, 1, 1, 1,
-0.9877678, -0.4455413, -0.9492037, 1, 1, 1, 1, 1,
-0.9873809, 1.089866, -0.1317184, 1, 1, 1, 1, 1,
-0.9848145, -1.144726, -2.999564, 1, 1, 1, 1, 1,
-0.9843149, 1.352166, 0.1542325, 1, 1, 1, 1, 1,
-0.9825842, 1.392328, 0.7481863, 1, 1, 1, 1, 1,
-0.981034, -0.5665164, -2.915252, 1, 1, 1, 1, 1,
-0.9809492, 1.124098, -2.177562, 1, 1, 1, 1, 1,
-0.9782806, -1.000975, -2.694379, 1, 1, 1, 1, 1,
-0.9772711, -0.7254961, -2.999097, 1, 1, 1, 1, 1,
-0.9741743, 0.7789656, -1.7924, 1, 1, 1, 1, 1,
-0.972728, -0.03475375, -1.539639, 1, 1, 1, 1, 1,
-0.9724807, -1.126043, -2.591914, 1, 1, 1, 1, 1,
-0.9638806, 0.1306411, -1.667535, 0, 0, 1, 1, 1,
-0.9635801, -1.083546, -1.45668, 1, 0, 0, 1, 1,
-0.9482274, 1.071159, -1.210905, 1, 0, 0, 1, 1,
-0.9455567, -3.068691, -2.947438, 1, 0, 0, 1, 1,
-0.9425064, 0.5830221, 0.2416107, 1, 0, 0, 1, 1,
-0.9391115, 0.7725026, -1.096923, 1, 0, 0, 1, 1,
-0.935354, -0.4934014, -1.597808, 0, 0, 0, 1, 1,
-0.9290522, -0.02657047, -0.5805743, 0, 0, 0, 1, 1,
-0.9207844, -0.1725163, -1.442179, 0, 0, 0, 1, 1,
-0.9182496, -1.321154, -2.740467, 0, 0, 0, 1, 1,
-0.9162161, -0.1735692, -0.2472053, 0, 0, 0, 1, 1,
-0.9138225, 0.7020352, -0.4187917, 0, 0, 0, 1, 1,
-0.9086892, 0.1368661, -0.3742232, 0, 0, 0, 1, 1,
-0.9081718, 1.842656, -0.2357395, 1, 1, 1, 1, 1,
-0.9079128, 1.240256, 0.06437832, 1, 1, 1, 1, 1,
-0.907877, 0.2607999, -2.355509, 1, 1, 1, 1, 1,
-0.9068077, 1.113392, -0.4221578, 1, 1, 1, 1, 1,
-0.9005077, 0.9209893, -0.7448734, 1, 1, 1, 1, 1,
-0.896101, -0.3596737, -2.651368, 1, 1, 1, 1, 1,
-0.8933202, -0.8310301, -2.431066, 1, 1, 1, 1, 1,
-0.888669, -1.033285, -0.8489488, 1, 1, 1, 1, 1,
-0.8881344, 1.261396, -0.9365918, 1, 1, 1, 1, 1,
-0.8865013, 0.9456049, -0.519085, 1, 1, 1, 1, 1,
-0.8847778, -1.431461, -3.309951, 1, 1, 1, 1, 1,
-0.8796665, 0.0002951592, -1.68867, 1, 1, 1, 1, 1,
-0.8770297, 0.3329605, -2.033692, 1, 1, 1, 1, 1,
-0.8666815, 1.002052, -0.2060123, 1, 1, 1, 1, 1,
-0.8585479, -0.4442547, -1.899821, 1, 1, 1, 1, 1,
-0.8555518, 0.5183221, -2.48843, 0, 0, 1, 1, 1,
-0.854573, -0.1641291, -0.8852129, 1, 0, 0, 1, 1,
-0.8368965, -0.5646185, -1.035801, 1, 0, 0, 1, 1,
-0.8331807, 1.653502, -1.017642, 1, 0, 0, 1, 1,
-0.8312148, -1.511362, -2.499989, 1, 0, 0, 1, 1,
-0.8258683, 1.163951, -1.310056, 1, 0, 0, 1, 1,
-0.8244797, 0.1722344, -1.555332, 0, 0, 0, 1, 1,
-0.8202007, 1.260718, -1.028923, 0, 0, 0, 1, 1,
-0.8201583, -1.09419, -2.073519, 0, 0, 0, 1, 1,
-0.8197838, 0.3527036, -1.338811, 0, 0, 0, 1, 1,
-0.8176479, 0.7783358, 0.7432082, 0, 0, 0, 1, 1,
-0.8150263, -2.193623, -2.238737, 0, 0, 0, 1, 1,
-0.8148613, -1.231175, -3.799917, 0, 0, 0, 1, 1,
-0.8135469, -1.297018, -2.66117, 1, 1, 1, 1, 1,
-0.8104606, -0.06721575, -2.118434, 1, 1, 1, 1, 1,
-0.8087485, -0.7101669, -0.8215404, 1, 1, 1, 1, 1,
-0.7954535, -2.27472, -3.670747, 1, 1, 1, 1, 1,
-0.7931035, -0.6412964, -3.0037, 1, 1, 1, 1, 1,
-0.7926208, 0.7564111, 0.1901561, 1, 1, 1, 1, 1,
-0.7780182, 0.3608428, -2.141174, 1, 1, 1, 1, 1,
-0.7538434, 0.6913127, -1.138739, 1, 1, 1, 1, 1,
-0.7517421, 0.7577005, -2.49084, 1, 1, 1, 1, 1,
-0.7503046, -0.2570252, -2.231462, 1, 1, 1, 1, 1,
-0.7484213, -0.1923651, -0.8717001, 1, 1, 1, 1, 1,
-0.7459534, 0.2459629, -0.8282461, 1, 1, 1, 1, 1,
-0.7458424, -0.5593173, -1.395988, 1, 1, 1, 1, 1,
-0.7433863, -1.168567, -3.042145, 1, 1, 1, 1, 1,
-0.7375126, -0.4493453, -3.984653, 1, 1, 1, 1, 1,
-0.7352151, -0.4558176, -1.824368, 0, 0, 1, 1, 1,
-0.7286609, -0.7562876, -3.253275, 1, 0, 0, 1, 1,
-0.7259133, 0.474359, -1.110663, 1, 0, 0, 1, 1,
-0.725376, -0.002272776, -1.936746, 1, 0, 0, 1, 1,
-0.7248138, -0.1068306, -0.560958, 1, 0, 0, 1, 1,
-0.7192339, -0.4999715, -2.863455, 1, 0, 0, 1, 1,
-0.7143015, -0.3613461, -2.696202, 0, 0, 0, 1, 1,
-0.7101417, -0.514567, -2.522243, 0, 0, 0, 1, 1,
-0.7046466, 0.8873256, -2.109267, 0, 0, 0, 1, 1,
-0.698614, 0.5562081, -0.2390683, 0, 0, 0, 1, 1,
-0.6977836, 0.587567, -1.810163, 0, 0, 0, 1, 1,
-0.6958563, -0.9514967, -1.328073, 0, 0, 0, 1, 1,
-0.6894115, 0.683793, 1.125363, 0, 0, 0, 1, 1,
-0.6886371, 0.7393949, -2.434834, 1, 1, 1, 1, 1,
-0.6840062, 0.8921777, -2.578657, 1, 1, 1, 1, 1,
-0.6815681, -0.9846512, -2.83011, 1, 1, 1, 1, 1,
-0.6801103, -0.1904742, -1.33246, 1, 1, 1, 1, 1,
-0.6796719, 0.6941913, -2.589549, 1, 1, 1, 1, 1,
-0.6792908, 0.418909, 0.08432385, 1, 1, 1, 1, 1,
-0.6787267, -1.290924, -3.0175, 1, 1, 1, 1, 1,
-0.6769872, 0.3377192, -1.379437, 1, 1, 1, 1, 1,
-0.6666759, -1.458974, -2.270968, 1, 1, 1, 1, 1,
-0.6658297, 0.9068485, -0.5395837, 1, 1, 1, 1, 1,
-0.6625937, -0.3942066, -2.373679, 1, 1, 1, 1, 1,
-0.6525017, -0.4297817, -1.643327, 1, 1, 1, 1, 1,
-0.6459764, 0.9768294, -1.911214, 1, 1, 1, 1, 1,
-0.6454371, -0.4804185, -1.927176, 1, 1, 1, 1, 1,
-0.6418356, -0.4407164, -2.214669, 1, 1, 1, 1, 1,
-0.639214, -0.4378818, -2.789384, 0, 0, 1, 1, 1,
-0.6383624, 0.8676412, -0.3284379, 1, 0, 0, 1, 1,
-0.6381418, -1.095417, -5.22996, 1, 0, 0, 1, 1,
-0.6355504, -0.3232488, -3.603894, 1, 0, 0, 1, 1,
-0.629768, 1.192269, -2.437783, 1, 0, 0, 1, 1,
-0.6287887, 1.724319, -2.874263, 1, 0, 0, 1, 1,
-0.6287012, 0.8808687, 0.2759974, 0, 0, 0, 1, 1,
-0.6187657, -0.9058977, -1.940795, 0, 0, 0, 1, 1,
-0.618189, 0.2101746, -0.1217317, 0, 0, 0, 1, 1,
-0.6179776, 0.06630056, 0.2395209, 0, 0, 0, 1, 1,
-0.6146986, -0.3133506, -3.073228, 0, 0, 0, 1, 1,
-0.6105049, 1.846759, 1.778148, 0, 0, 0, 1, 1,
-0.6098909, 1.496258, -0.4399086, 0, 0, 0, 1, 1,
-0.6088663, 0.4563827, 0.9622723, 1, 1, 1, 1, 1,
-0.6087269, 0.3611487, -1.992619, 1, 1, 1, 1, 1,
-0.6052357, 1.354438, -1.291463, 1, 1, 1, 1, 1,
-0.6005672, -1.742298, -4.337337, 1, 1, 1, 1, 1,
-0.5955125, -1.169379, -4.828437, 1, 1, 1, 1, 1,
-0.5923414, 0.4380442, -0.6487376, 1, 1, 1, 1, 1,
-0.5921086, 0.4569077, 0.1480847, 1, 1, 1, 1, 1,
-0.5880305, 1.413978, -0.264759, 1, 1, 1, 1, 1,
-0.585715, 1.208024, -0.5465971, 1, 1, 1, 1, 1,
-0.5833909, 1.038575, -1.204556, 1, 1, 1, 1, 1,
-0.5803378, 0.4431747, -2.023227, 1, 1, 1, 1, 1,
-0.5725061, 0.2462374, 1.75489, 1, 1, 1, 1, 1,
-0.5724143, 0.1617674, -0.36967, 1, 1, 1, 1, 1,
-0.5718557, 2.211288, -0.6671199, 1, 1, 1, 1, 1,
-0.5648959, -0.06551564, -2.042928, 1, 1, 1, 1, 1,
-0.5563183, 1.438718, 0.4218804, 0, 0, 1, 1, 1,
-0.5558373, 0.08392954, -2.193622, 1, 0, 0, 1, 1,
-0.5556854, 0.9341187, 0.6320618, 1, 0, 0, 1, 1,
-0.5538174, -0.3006366, -2.520776, 1, 0, 0, 1, 1,
-0.5477913, -3.166662, -3.584938, 1, 0, 0, 1, 1,
-0.5453685, 0.9070763, -0.09589761, 1, 0, 0, 1, 1,
-0.5402486, -0.3794869, -3.035049, 0, 0, 0, 1, 1,
-0.5339764, 0.07463299, -1.804491, 0, 0, 0, 1, 1,
-0.531742, -0.5966515, -3.056759, 0, 0, 0, 1, 1,
-0.5300005, 0.3808705, -1.07122, 0, 0, 0, 1, 1,
-0.5241147, -1.069581, -1.775036, 0, 0, 0, 1, 1,
-0.5233677, 0.4884633, -2.49479, 0, 0, 0, 1, 1,
-0.5218508, 0.9601842, -2.654231, 0, 0, 0, 1, 1,
-0.5205002, 0.3967445, -1.482735, 1, 1, 1, 1, 1,
-0.518855, 1.259381, 0.2767029, 1, 1, 1, 1, 1,
-0.5151471, -0.7313038, -2.876205, 1, 1, 1, 1, 1,
-0.5110555, -1.625746, -3.242683, 1, 1, 1, 1, 1,
-0.5074806, 0.7293861, 0.005333651, 1, 1, 1, 1, 1,
-0.5071314, -0.7726613, -2.876257, 1, 1, 1, 1, 1,
-0.5050098, 2.292392, -0.05865935, 1, 1, 1, 1, 1,
-0.4987593, 0.294636, -0.8338069, 1, 1, 1, 1, 1,
-0.4966124, 0.1870337, -1.21707, 1, 1, 1, 1, 1,
-0.4942078, -0.4228188, -2.661745, 1, 1, 1, 1, 1,
-0.491207, 0.4690953, -0.7678686, 1, 1, 1, 1, 1,
-0.4898213, -0.8562278, -0.5054916, 1, 1, 1, 1, 1,
-0.4828281, 0.1839413, -0.3346928, 1, 1, 1, 1, 1,
-0.4806661, 0.08836447, -2.476121, 1, 1, 1, 1, 1,
-0.4795842, 1.817, -0.3483349, 1, 1, 1, 1, 1,
-0.4786402, 0.04065989, -1.465262, 0, 0, 1, 1, 1,
-0.4735937, -0.4680029, -2.440076, 1, 0, 0, 1, 1,
-0.4707497, -0.3032177, -2.791808, 1, 0, 0, 1, 1,
-0.4692438, -1.877694, -2.901843, 1, 0, 0, 1, 1,
-0.467828, -0.356452, -0.4805232, 1, 0, 0, 1, 1,
-0.4677818, -0.5931724, -2.061414, 1, 0, 0, 1, 1,
-0.4623156, -0.9486469, -3.109879, 0, 0, 0, 1, 1,
-0.4550377, 1.361552, 1.099961, 0, 0, 0, 1, 1,
-0.4535238, 0.1465198, -1.849761, 0, 0, 0, 1, 1,
-0.4528004, -1.543758, -3.066827, 0, 0, 0, 1, 1,
-0.4525001, -0.1107663, -3.610028, 0, 0, 0, 1, 1,
-0.4454701, 1.402794, 0.9900471, 0, 0, 0, 1, 1,
-0.443039, -1.550406, -3.374097, 0, 0, 0, 1, 1,
-0.4415735, 0.4863461, -1.104023, 1, 1, 1, 1, 1,
-0.4336974, -0.8294213, -2.992656, 1, 1, 1, 1, 1,
-0.4332094, -1.630169, -3.085377, 1, 1, 1, 1, 1,
-0.4323706, -1.728155, -3.577093, 1, 1, 1, 1, 1,
-0.4296855, 1.57907, -0.3308654, 1, 1, 1, 1, 1,
-0.426956, 1.291737, -0.7568081, 1, 1, 1, 1, 1,
-0.4263694, -0.6471837, -3.81775, 1, 1, 1, 1, 1,
-0.4230656, -1.596873, -3.426066, 1, 1, 1, 1, 1,
-0.4204156, 0.07796939, -1.522888, 1, 1, 1, 1, 1,
-0.4132959, -0.1523536, -2.716786, 1, 1, 1, 1, 1,
-0.4130709, 0.5588064, -1.989255, 1, 1, 1, 1, 1,
-0.412112, 1.520801, 0.7949134, 1, 1, 1, 1, 1,
-0.4098865, -2.242856, -3.487841, 1, 1, 1, 1, 1,
-0.4091643, -0.5101808, -2.550674, 1, 1, 1, 1, 1,
-0.3993004, 1.03977, -1.506815, 1, 1, 1, 1, 1,
-0.3985926, 2.829231, -0.889855, 0, 0, 1, 1, 1,
-0.3983443, 0.3619911, -0.2126597, 1, 0, 0, 1, 1,
-0.3980661, -0.7433844, -4.441801, 1, 0, 0, 1, 1,
-0.3977284, 0.4507717, -1.619282, 1, 0, 0, 1, 1,
-0.3963596, 1.819077, 0.4478837, 1, 0, 0, 1, 1,
-0.3942267, 1.259155, -1.757468, 1, 0, 0, 1, 1,
-0.390317, -0.1440236, -1.633934, 0, 0, 0, 1, 1,
-0.3877339, 0.09238753, -1.017729, 0, 0, 0, 1, 1,
-0.3842415, 0.05140242, -0.5893554, 0, 0, 0, 1, 1,
-0.3826849, 1.335899, -1.040105, 0, 0, 0, 1, 1,
-0.3823101, 0.9944211, -0.0758006, 0, 0, 0, 1, 1,
-0.3753061, 0.1392986, -0.4767454, 0, 0, 0, 1, 1,
-0.3739148, 0.1041026, -2.261494, 0, 0, 0, 1, 1,
-0.3712565, -1.192616, -1.602707, 1, 1, 1, 1, 1,
-0.37035, 0.5891043, -1.188821, 1, 1, 1, 1, 1,
-0.3660381, 0.8190015, -0.4855306, 1, 1, 1, 1, 1,
-0.3627736, 1.579235, 0.08160339, 1, 1, 1, 1, 1,
-0.3615737, 0.5243378, -1.134027, 1, 1, 1, 1, 1,
-0.3481429, -0.1407923, -1.963174, 1, 1, 1, 1, 1,
-0.3479317, -1.326019, -3.242534, 1, 1, 1, 1, 1,
-0.3434256, 1.217825, 0.5175126, 1, 1, 1, 1, 1,
-0.3366162, -2.589182, -1.298451, 1, 1, 1, 1, 1,
-0.3361161, -0.4362075, -1.696218, 1, 1, 1, 1, 1,
-0.3320209, -0.1489917, -2.992856, 1, 1, 1, 1, 1,
-0.3272167, -1.361992, -2.803164, 1, 1, 1, 1, 1,
-0.3257921, 0.3278328, -0.136922, 1, 1, 1, 1, 1,
-0.3255891, 0.3377956, -1.379518, 1, 1, 1, 1, 1,
-0.3229676, -0.6902722, -2.227298, 1, 1, 1, 1, 1,
-0.3195846, -0.9070299, -2.966145, 0, 0, 1, 1, 1,
-0.3181935, -0.3760521, -3.05882, 1, 0, 0, 1, 1,
-0.3170966, 0.4873904, 0.6216045, 1, 0, 0, 1, 1,
-0.3164427, 1.006373, -0.5143923, 1, 0, 0, 1, 1,
-0.315777, 0.02225357, -1.840201, 1, 0, 0, 1, 1,
-0.3148946, -0.5620818, -2.886495, 1, 0, 0, 1, 1,
-0.3142658, -1.733619, -2.831011, 0, 0, 0, 1, 1,
-0.3137107, -1.231028, -2.46192, 0, 0, 0, 1, 1,
-0.3125904, -1.228768, -0.9163194, 0, 0, 0, 1, 1,
-0.3111845, -0.7428052, -2.107446, 0, 0, 0, 1, 1,
-0.3105924, -1.173584, -4.121158, 0, 0, 0, 1, 1,
-0.3083915, 1.499063, -1.39624, 0, 0, 0, 1, 1,
-0.3042676, -0.2753813, -1.59051, 0, 0, 0, 1, 1,
-0.3028101, 1.739412, 1.164183, 1, 1, 1, 1, 1,
-0.3015892, -0.3744462, -2.223985, 1, 1, 1, 1, 1,
-0.299636, 0.05888658, -2.365346, 1, 1, 1, 1, 1,
-0.2973883, -0.8961571, -3.661805, 1, 1, 1, 1, 1,
-0.2963675, 1.250279, -2.002516, 1, 1, 1, 1, 1,
-0.2949378, 0.03494547, -2.455099, 1, 1, 1, 1, 1,
-0.2904901, 0.07473525, -0.9385553, 1, 1, 1, 1, 1,
-0.2901635, 1.118044, 0.38484, 1, 1, 1, 1, 1,
-0.288269, -0.3848089, -3.369111, 1, 1, 1, 1, 1,
-0.2865424, -0.4956482, -3.121886, 1, 1, 1, 1, 1,
-0.278346, 0.8554589, -0.08291147, 1, 1, 1, 1, 1,
-0.2779501, -0.4088047, -1.939088, 1, 1, 1, 1, 1,
-0.2601849, -0.002555043, -2.2624, 1, 1, 1, 1, 1,
-0.258124, -0.06778787, -0.7814059, 1, 1, 1, 1, 1,
-0.2570989, -0.6210024, -3.369936, 1, 1, 1, 1, 1,
-0.2543063, 2.282494, 2.03341, 0, 0, 1, 1, 1,
-0.2537057, 0.5216806, -1.2232, 1, 0, 0, 1, 1,
-0.2506848, -0.5187619, -2.383893, 1, 0, 0, 1, 1,
-0.2478991, -0.6668631, -3.598368, 1, 0, 0, 1, 1,
-0.2392813, -0.9872894, -2.589938, 1, 0, 0, 1, 1,
-0.2366934, -0.4881369, -3.113789, 1, 0, 0, 1, 1,
-0.2314186, -0.7257681, -2.6798, 0, 0, 0, 1, 1,
-0.2286416, -1.297208, -2.99982, 0, 0, 0, 1, 1,
-0.2274335, 1.888541, 0.4012813, 0, 0, 0, 1, 1,
-0.2269562, -0.7794147, -1.9489, 0, 0, 0, 1, 1,
-0.2265506, 0.9364194, -2.156795, 0, 0, 0, 1, 1,
-0.2211643, -0.1400494, -2.107534, 0, 0, 0, 1, 1,
-0.218764, -0.632763, -4.36024, 0, 0, 0, 1, 1,
-0.2114474, -0.05168262, -0.5606099, 1, 1, 1, 1, 1,
-0.2099247, 0.1225083, -1.466283, 1, 1, 1, 1, 1,
-0.2015602, -0.3395496, -3.616437, 1, 1, 1, 1, 1,
-0.198345, -0.4002135, -2.93542, 1, 1, 1, 1, 1,
-0.1976503, -0.310423, -1.758121, 1, 1, 1, 1, 1,
-0.19752, 0.06213907, -1.953971, 1, 1, 1, 1, 1,
-0.1967904, -1.348375, -3.229127, 1, 1, 1, 1, 1,
-0.1896518, -1.116452, -0.5638537, 1, 1, 1, 1, 1,
-0.1884133, -0.559209, -2.918119, 1, 1, 1, 1, 1,
-0.1817676, 0.8602997, 0.5634332, 1, 1, 1, 1, 1,
-0.1800479, -0.7209613, -2.0406, 1, 1, 1, 1, 1,
-0.1760453, -0.1903707, -2.614782, 1, 1, 1, 1, 1,
-0.1760039, -0.7633917, -3.380616, 1, 1, 1, 1, 1,
-0.1708423, 0.5371954, -0.1973376, 1, 1, 1, 1, 1,
-0.1674598, -0.109263, -0.6352686, 1, 1, 1, 1, 1,
-0.1640255, 1.227795, -0.8957086, 0, 0, 1, 1, 1,
-0.1567214, 0.6303989, -1.228832, 1, 0, 0, 1, 1,
-0.1533951, 1.69595, 0.6037339, 1, 0, 0, 1, 1,
-0.1516586, -1.603647, -2.32685, 1, 0, 0, 1, 1,
-0.1508824, 0.2453496, -1.832572, 1, 0, 0, 1, 1,
-0.1487122, 0.6041844, -0.4345534, 1, 0, 0, 1, 1,
-0.1439839, 0.4644707, -1.891238, 0, 0, 0, 1, 1,
-0.143674, 0.5367085, -0.6479763, 0, 0, 0, 1, 1,
-0.1424551, -0.4653448, -3.585687, 0, 0, 0, 1, 1,
-0.1371078, 0.6402858, 0.1175798, 0, 0, 0, 1, 1,
-0.1298419, 0.3198153, -0.491761, 0, 0, 0, 1, 1,
-0.127131, -0.5821199, -2.393349, 0, 0, 0, 1, 1,
-0.1253125, 0.02415886, -1.73924, 0, 0, 0, 1, 1,
-0.123559, -1.369658, -2.60818, 1, 1, 1, 1, 1,
-0.1231505, 0.5152606, 0.05662772, 1, 1, 1, 1, 1,
-0.1219489, 0.7455729, -0.3893533, 1, 1, 1, 1, 1,
-0.1173833, -0.36089, -3.617862, 1, 1, 1, 1, 1,
-0.1159146, -0.3570995, -3.725662, 1, 1, 1, 1, 1,
-0.1151804, -1.060606, -2.706914, 1, 1, 1, 1, 1,
-0.1145622, 1.237452, -0.1886539, 1, 1, 1, 1, 1,
-0.1143403, -1.306676, -1.721859, 1, 1, 1, 1, 1,
-0.1126569, -0.1862281, -2.124757, 1, 1, 1, 1, 1,
-0.1123356, -0.9424118, -3.955012, 1, 1, 1, 1, 1,
-0.1109333, 0.9883795, 0.03947227, 1, 1, 1, 1, 1,
-0.1041692, -0.3211337, -3.55352, 1, 1, 1, 1, 1,
-0.1026478, 0.9392014, 0.4730027, 1, 1, 1, 1, 1,
-0.102278, -0.5345146, -2.336731, 1, 1, 1, 1, 1,
-0.1003747, 0.4654222, -0.2797432, 1, 1, 1, 1, 1,
-0.09969772, 0.3167551, 0.03073418, 0, 0, 1, 1, 1,
-0.09916525, 0.1384576, -1.270396, 1, 0, 0, 1, 1,
-0.09772566, -2.374475, -3.02885, 1, 0, 0, 1, 1,
-0.09581229, -0.566548, -4.595519, 1, 0, 0, 1, 1,
-0.09349512, -1.539824, -2.922569, 1, 0, 0, 1, 1,
-0.09333237, -0.4722298, -0.1378599, 1, 0, 0, 1, 1,
-0.09157912, -0.008666417, -1.29461, 0, 0, 0, 1, 1,
-0.0912287, -0.09073296, -3.736593, 0, 0, 0, 1, 1,
-0.08794547, 2.349565, 0.6084726, 0, 0, 0, 1, 1,
-0.08662884, 0.488223, -0.3853199, 0, 0, 0, 1, 1,
-0.08527208, 0.3550407, -1.267059, 0, 0, 0, 1, 1,
-0.0850766, 0.3533161, 1.567134, 0, 0, 0, 1, 1,
-0.08284301, 0.1067283, 0.6053289, 0, 0, 0, 1, 1,
-0.08249375, -2.051461, -4.992162, 1, 1, 1, 1, 1,
-0.07688257, 0.6114164, 0.7576163, 1, 1, 1, 1, 1,
-0.07673472, 0.1638612, 0.3213953, 1, 1, 1, 1, 1,
-0.07517567, -0.6868514, -2.516021, 1, 1, 1, 1, 1,
-0.07417129, 0.951197, -0.2116273, 1, 1, 1, 1, 1,
-0.07038438, -2.269399, -3.588846, 1, 1, 1, 1, 1,
-0.06984019, -1.185817, -2.392032, 1, 1, 1, 1, 1,
-0.06915491, 0.2906893, -0.2125994, 1, 1, 1, 1, 1,
-0.06522255, 0.2153277, -0.488524, 1, 1, 1, 1, 1,
-0.06440973, 2.632346, 0.9180406, 1, 1, 1, 1, 1,
-0.06319275, 0.5764762, -0.5233095, 1, 1, 1, 1, 1,
-0.06232559, 0.08922629, 1.330691, 1, 1, 1, 1, 1,
-0.05970484, 0.3263718, 1.980197, 1, 1, 1, 1, 1,
-0.05279629, -1.515795, -3.366145, 1, 1, 1, 1, 1,
-0.05233524, -0.4694411, -4.622688, 1, 1, 1, 1, 1,
-0.04961115, 0.9391896, -1.05188, 0, 0, 1, 1, 1,
-0.04547224, -1.616752, -2.972815, 1, 0, 0, 1, 1,
-0.04373356, 0.7232998, -0.1284436, 1, 0, 0, 1, 1,
-0.04200232, 0.2524399, 0.2845681, 1, 0, 0, 1, 1,
-0.03841453, 1.093066, -0.4710529, 1, 0, 0, 1, 1,
-0.03704318, -0.8025662, -1.243734, 1, 0, 0, 1, 1,
-0.03644795, 1.232913, -0.6934534, 0, 0, 0, 1, 1,
-0.03385064, -0.7893298, -2.274813, 0, 0, 0, 1, 1,
-0.03065971, 0.6948527, -0.4701571, 0, 0, 0, 1, 1,
-0.02404342, -0.7534156, -3.090727, 0, 0, 0, 1, 1,
-0.02365834, -0.1983162, -2.338539, 0, 0, 0, 1, 1,
-0.02148836, 0.08016636, 0.8794435, 0, 0, 0, 1, 1,
-0.02119172, 1.422762, 0.2659613, 0, 0, 0, 1, 1,
-0.02085977, -0.6161197, -3.68563, 1, 1, 1, 1, 1,
-0.01834567, 1.064862, 0.6409739, 1, 1, 1, 1, 1,
-0.01156374, 0.3872258, 0.7749106, 1, 1, 1, 1, 1,
-0.0102134, -1.345319, -2.674005, 1, 1, 1, 1, 1,
-0.008087596, 0.8162825, -0.06722726, 1, 1, 1, 1, 1,
-0.005789563, -0.601652, -1.970098, 1, 1, 1, 1, 1,
-0.003912988, 0.7835406, 1.117834, 1, 1, 1, 1, 1,
-0.001404747, -1.226168, -3.138261, 1, 1, 1, 1, 1,
0.003385025, 0.7570218, -0.6598091, 1, 1, 1, 1, 1,
0.00964012, -1.238633, 1.767406, 1, 1, 1, 1, 1,
0.01706091, -0.1681831, 3.233117, 1, 1, 1, 1, 1,
0.0173626, 0.3590701, 1.160873, 1, 1, 1, 1, 1,
0.02197659, 0.9467673, 2.464497, 1, 1, 1, 1, 1,
0.02417493, -1.049601, 2.868123, 1, 1, 1, 1, 1,
0.02420068, -0.2705188, 2.878106, 1, 1, 1, 1, 1,
0.02596756, -0.2967867, 1.765368, 0, 0, 1, 1, 1,
0.0300102, -0.1147062, 0.980226, 1, 0, 0, 1, 1,
0.03187757, 1.198629, 0.2741648, 1, 0, 0, 1, 1,
0.0321175, 0.768901, -1.444144, 1, 0, 0, 1, 1,
0.03272416, 1.244781, 1.041625, 1, 0, 0, 1, 1,
0.03489256, 0.3321745, -0.1253399, 1, 0, 0, 1, 1,
0.04003226, -0.2668274, 3.062557, 0, 0, 0, 1, 1,
0.04148972, 0.7801847, -0.1443631, 0, 0, 0, 1, 1,
0.04403012, 0.9005633, 0.6714863, 0, 0, 0, 1, 1,
0.04518357, -2.006807, 1.514772, 0, 0, 0, 1, 1,
0.04682387, 0.7922554, -0.8897982, 0, 0, 0, 1, 1,
0.04938246, -1.180863, 2.179884, 0, 0, 0, 1, 1,
0.05170102, -1.096474, 3.351882, 0, 0, 0, 1, 1,
0.05180471, 0.08695012, -0.07919823, 1, 1, 1, 1, 1,
0.05235436, 1.208426, -0.00250265, 1, 1, 1, 1, 1,
0.05725998, -1.035834, 5.04902, 1, 1, 1, 1, 1,
0.05838534, -1.210764, 4.538964, 1, 1, 1, 1, 1,
0.06993864, -0.9827682, 3.524396, 1, 1, 1, 1, 1,
0.0717105, 1.363285, 0.263703, 1, 1, 1, 1, 1,
0.07783966, 2.361613, 0.6312805, 1, 1, 1, 1, 1,
0.08104129, 0.8602238, 0.6684237, 1, 1, 1, 1, 1,
0.0838738, 1.193727, -2.512275, 1, 1, 1, 1, 1,
0.08546251, -0.5650088, 3.223943, 1, 1, 1, 1, 1,
0.085599, 0.08726511, 1.041636, 1, 1, 1, 1, 1,
0.08631292, 1.257844, -2.084843, 1, 1, 1, 1, 1,
0.08811186, -2.238097, 0.4713587, 1, 1, 1, 1, 1,
0.09122461, -1.52254, 2.113631, 1, 1, 1, 1, 1,
0.09377208, 0.06601012, -0.2215726, 1, 1, 1, 1, 1,
0.09388739, 0.149198, -1.013531, 0, 0, 1, 1, 1,
0.09412486, -0.9071103, 2.883597, 1, 0, 0, 1, 1,
0.09671528, -1.291263, 4.674213, 1, 0, 0, 1, 1,
0.1039849, 2.868309, 1.099532, 1, 0, 0, 1, 1,
0.1040015, 0.2552584, 0.4175908, 1, 0, 0, 1, 1,
0.1049474, -1.27622, 4.591231, 1, 0, 0, 1, 1,
0.1057431, 0.6612524, 1.202087, 0, 0, 0, 1, 1,
0.1097127, -0.003683039, 0.245044, 0, 0, 0, 1, 1,
0.11398, 0.01522243, -0.1271927, 0, 0, 0, 1, 1,
0.1166292, -0.1995045, 1.600364, 0, 0, 0, 1, 1,
0.1168727, -1.51594, 1.807726, 0, 0, 0, 1, 1,
0.1173549, 0.3852976, 1.083809, 0, 0, 0, 1, 1,
0.1191009, -1.490762, 3.037059, 0, 0, 0, 1, 1,
0.1193879, -1.137151, 2.209145, 1, 1, 1, 1, 1,
0.122923, 1.055857, 1.048044, 1, 1, 1, 1, 1,
0.1270887, -1.133364, 3.307072, 1, 1, 1, 1, 1,
0.1389634, -1.749655, 1.810372, 1, 1, 1, 1, 1,
0.1412483, -1.458731, 1.75631, 1, 1, 1, 1, 1,
0.1423818, 0.03964499, 1.987069, 1, 1, 1, 1, 1,
0.1435789, -0.3903396, 3.415241, 1, 1, 1, 1, 1,
0.1436186, -0.2463219, 4.316975, 1, 1, 1, 1, 1,
0.1450889, -1.108778, 3.287109, 1, 1, 1, 1, 1,
0.1452302, 0.9271559, -1.089477, 1, 1, 1, 1, 1,
0.1463905, -1.568767, 4.883224, 1, 1, 1, 1, 1,
0.1508992, -1.956154, 3.165824, 1, 1, 1, 1, 1,
0.1525448, -0.2700142, 2.89328, 1, 1, 1, 1, 1,
0.1595355, 0.2150919, 0.9063058, 1, 1, 1, 1, 1,
0.1634703, -0.9146892, 2.29042, 1, 1, 1, 1, 1,
0.1687478, -0.9838541, 3.988363, 0, 0, 1, 1, 1,
0.1750136, -0.7414714, 2.969032, 1, 0, 0, 1, 1,
0.1771849, -2.801417, 4.182126, 1, 0, 0, 1, 1,
0.177202, 0.9746733, 1.133804, 1, 0, 0, 1, 1,
0.1788201, -0.2184924, 1.927847, 1, 0, 0, 1, 1,
0.1834603, 2.789675, 0.1231675, 1, 0, 0, 1, 1,
0.1850364, -0.2556797, 3.971326, 0, 0, 0, 1, 1,
0.1865758, 0.6584239, 1.794836, 0, 0, 0, 1, 1,
0.1879334, 0.4441367, -0.9455938, 0, 0, 0, 1, 1,
0.1893785, 0.6525185, -0.201438, 0, 0, 0, 1, 1,
0.1902925, 1.402792, -0.9555074, 0, 0, 0, 1, 1,
0.191886, 1.755315, -0.03713369, 0, 0, 0, 1, 1,
0.1935275, 1.86743, 0.7383655, 0, 0, 0, 1, 1,
0.1948724, 0.05182358, 1.524313, 1, 1, 1, 1, 1,
0.1953093, -0.1819727, 2.508512, 1, 1, 1, 1, 1,
0.1964, -1.098556, 2.482461, 1, 1, 1, 1, 1,
0.199025, -0.4809286, 3.235514, 1, 1, 1, 1, 1,
0.2063476, -2.012977, 2.788551, 1, 1, 1, 1, 1,
0.2080126, -1.583266, 2.617772, 1, 1, 1, 1, 1,
0.2095259, 1.539681, -1.464328, 1, 1, 1, 1, 1,
0.2101801, 0.8268669, 0.7060231, 1, 1, 1, 1, 1,
0.2162856, -2.597641, 3.427272, 1, 1, 1, 1, 1,
0.2188058, 0.2911486, 1.858225, 1, 1, 1, 1, 1,
0.2214185, 0.3474302, 0.7764822, 1, 1, 1, 1, 1,
0.2230272, -0.01264716, 1.33574, 1, 1, 1, 1, 1,
0.2246604, -0.5969036, 3.367824, 1, 1, 1, 1, 1,
0.2274465, 0.6203747, -0.3750279, 1, 1, 1, 1, 1,
0.2291596, -0.9141188, 1.591122, 1, 1, 1, 1, 1,
0.2308357, 0.316975, 0.7714678, 0, 0, 1, 1, 1,
0.2371245, -0.3546258, 4.963964, 1, 0, 0, 1, 1,
0.2452679, 1.317956, -1.365012, 1, 0, 0, 1, 1,
0.2466259, -0.2868147, 2.163755, 1, 0, 0, 1, 1,
0.246782, 0.3826362, 1.050945, 1, 0, 0, 1, 1,
0.2508917, -0.344294, 2.259148, 1, 0, 0, 1, 1,
0.2556747, -0.8339913, 1.364561, 0, 0, 0, 1, 1,
0.2604331, 0.0338878, 0.4576048, 0, 0, 0, 1, 1,
0.2700376, 0.305947, 0.3423936, 0, 0, 0, 1, 1,
0.2709162, 0.04813522, 1.84261, 0, 0, 0, 1, 1,
0.2745424, -0.9740894, 2.188209, 0, 0, 0, 1, 1,
0.275373, 1.22914, -0.0874121, 0, 0, 0, 1, 1,
0.2761379, 1.748283, 0.9281107, 0, 0, 0, 1, 1,
0.2776697, -1.031742, 3.472221, 1, 1, 1, 1, 1,
0.2782656, -0.4043995, 2.708501, 1, 1, 1, 1, 1,
0.2804472, 2.703918, 1.468104, 1, 1, 1, 1, 1,
0.2900332, 1.654323, -1.307373, 1, 1, 1, 1, 1,
0.2905624, 1.366839, 0.7779834, 1, 1, 1, 1, 1,
0.2918595, -0.2043494, 3.779329, 1, 1, 1, 1, 1,
0.2921558, -1.12802, 2.3961, 1, 1, 1, 1, 1,
0.2931221, 1.121289, -0.08499318, 1, 1, 1, 1, 1,
0.2980088, 0.3349343, -1.179912, 1, 1, 1, 1, 1,
0.2996956, -0.4561938, 2.389126, 1, 1, 1, 1, 1,
0.30049, 0.4374953, -1.352464, 1, 1, 1, 1, 1,
0.3013966, -1.268649, 2.783596, 1, 1, 1, 1, 1,
0.307704, 0.6920314, 0.05476096, 1, 1, 1, 1, 1,
0.3148199, 0.5071316, 2.342853, 1, 1, 1, 1, 1,
0.3166061, -0.8740576, 2.648492, 1, 1, 1, 1, 1,
0.3202742, -0.217044, 2.116186, 0, 0, 1, 1, 1,
0.3229937, 0.3727221, 1.973505, 1, 0, 0, 1, 1,
0.3245333, -0.5772331, 3.694952, 1, 0, 0, 1, 1,
0.3307926, 0.530686, 0.7855189, 1, 0, 0, 1, 1,
0.3312147, 2.162636, -1.481358, 1, 0, 0, 1, 1,
0.3328874, 0.1322175, 1.390415, 1, 0, 0, 1, 1,
0.3337778, -0.4390043, 2.684029, 0, 0, 0, 1, 1,
0.3348284, 2.007701, -1.022244, 0, 0, 0, 1, 1,
0.335677, 0.2620712, -0.3568377, 0, 0, 0, 1, 1,
0.3361526, -1.465517, 3.377741, 0, 0, 0, 1, 1,
0.3369835, 1.170112, 0.3454417, 0, 0, 0, 1, 1,
0.3395951, 2.402425, 1.083391, 0, 0, 0, 1, 1,
0.3408942, -2.166371, 2.546655, 0, 0, 0, 1, 1,
0.3438709, -0.4606792, 1.601091, 1, 1, 1, 1, 1,
0.347226, 0.3431641, 1.587387, 1, 1, 1, 1, 1,
0.3513516, 0.07326152, -0.2864027, 1, 1, 1, 1, 1,
0.3524108, -0.691669, 0.5365372, 1, 1, 1, 1, 1,
0.3561114, 0.2943106, -0.001899302, 1, 1, 1, 1, 1,
0.3600039, 0.1440293, 0.9380323, 1, 1, 1, 1, 1,
0.3700911, 0.9568316, -0.1481184, 1, 1, 1, 1, 1,
0.3710223, 0.05339313, 2.664049, 1, 1, 1, 1, 1,
0.3714854, 0.2990772, 0.5636079, 1, 1, 1, 1, 1,
0.3764817, -0.3559122, 2.62329, 1, 1, 1, 1, 1,
0.380806, 0.5611644, 0.6419892, 1, 1, 1, 1, 1,
0.3831011, -0.9422217, 2.726563, 1, 1, 1, 1, 1,
0.3849687, 1.552432, -0.1028213, 1, 1, 1, 1, 1,
0.3857021, -1.59101, 3.337471, 1, 1, 1, 1, 1,
0.3949356, -0.01706765, 2.092932, 1, 1, 1, 1, 1,
0.4014471, 1.218735, 0.1479095, 0, 0, 1, 1, 1,
0.4024743, 2.129074, 1.065643, 1, 0, 0, 1, 1,
0.4074863, -1.90413, 2.884882, 1, 0, 0, 1, 1,
0.4100565, -0.2869453, 2.857862, 1, 0, 0, 1, 1,
0.4102115, 0.8438146, 1.913863, 1, 0, 0, 1, 1,
0.4108661, -0.01711727, 3.988844, 1, 0, 0, 1, 1,
0.4127005, -0.2033496, 2.127311, 0, 0, 0, 1, 1,
0.4184836, -0.9039981, 3.784682, 0, 0, 0, 1, 1,
0.4213749, 0.5598859, 1.917676, 0, 0, 0, 1, 1,
0.4223273, -1.780293, 2.359268, 0, 0, 0, 1, 1,
0.4252857, 1.621642, 0.5761686, 0, 0, 0, 1, 1,
0.429633, 1.617734, -1.239249, 0, 0, 0, 1, 1,
0.4320047, -0.09317726, 1.86544, 0, 0, 0, 1, 1,
0.432961, -0.01986263, 1.118022, 1, 1, 1, 1, 1,
0.4331838, -0.8254734, 2.290043, 1, 1, 1, 1, 1,
0.4374826, 0.8256889, 2.164104, 1, 1, 1, 1, 1,
0.4380926, 0.01568218, 1.807882, 1, 1, 1, 1, 1,
0.4392745, 0.8271117, 0.6535593, 1, 1, 1, 1, 1,
0.439848, 0.8266191, -0.8425401, 1, 1, 1, 1, 1,
0.4455166, -0.3699318, 2.339941, 1, 1, 1, 1, 1,
0.4463829, 0.9154198, -0.721534, 1, 1, 1, 1, 1,
0.4489499, -0.4651026, 1.257897, 1, 1, 1, 1, 1,
0.4514815, -0.2596138, 2.154654, 1, 1, 1, 1, 1,
0.4516995, -0.4269173, 1.008318, 1, 1, 1, 1, 1,
0.4532786, -0.1310916, 1.723091, 1, 1, 1, 1, 1,
0.4578671, 0.7029642, 0.7088179, 1, 1, 1, 1, 1,
0.4615497, -0.3194911, 2.130792, 1, 1, 1, 1, 1,
0.4615808, 1.255722, 0.5345452, 1, 1, 1, 1, 1,
0.4623303, -0.351563, 2.180959, 0, 0, 1, 1, 1,
0.466495, 0.5603433, 1.186764, 1, 0, 0, 1, 1,
0.4665813, -0.07993152, 4.636391, 1, 0, 0, 1, 1,
0.4684381, 0.6033484, 0.5311054, 1, 0, 0, 1, 1,
0.4777842, -1.64213, 5.254076, 1, 0, 0, 1, 1,
0.4785593, -1.299124, 4.501998, 1, 0, 0, 1, 1,
0.4793321, -1.557597, 3.661353, 0, 0, 0, 1, 1,
0.482264, -0.3321547, 3.278268, 0, 0, 0, 1, 1,
0.4823623, 0.6796169, 0.5325653, 0, 0, 0, 1, 1,
0.4832506, -0.8765263, 4.349937, 0, 0, 0, 1, 1,
0.4836, 0.2254476, 1.097218, 0, 0, 0, 1, 1,
0.4861134, 1.015278, -1.168477, 0, 0, 0, 1, 1,
0.4893779, 1.662557, 1.390123, 0, 0, 0, 1, 1,
0.4903736, 0.6157097, 1.768594, 1, 1, 1, 1, 1,
0.4957224, 0.8252298, -0.7692598, 1, 1, 1, 1, 1,
0.4962297, -0.731891, 1.852811, 1, 1, 1, 1, 1,
0.5001671, -0.6256992, 2.889948, 1, 1, 1, 1, 1,
0.5049335, 0.4465928, 2.360002, 1, 1, 1, 1, 1,
0.5092198, 0.2772682, 0.7133306, 1, 1, 1, 1, 1,
0.5095352, -1.619113, 4.729099, 1, 1, 1, 1, 1,
0.5115042, 0.7263492, 0.2510265, 1, 1, 1, 1, 1,
0.5170919, -0.3432805, 1.590748, 1, 1, 1, 1, 1,
0.5179466, -0.2292031, 2.951458, 1, 1, 1, 1, 1,
0.5194416, 1.058701, 1.511451, 1, 1, 1, 1, 1,
0.5226036, -0.2105489, 2.700456, 1, 1, 1, 1, 1,
0.5278388, 0.5668422, -0.8630266, 1, 1, 1, 1, 1,
0.5344006, -0.1318835, 1.511666, 1, 1, 1, 1, 1,
0.5344763, -0.08361296, 2.462421, 1, 1, 1, 1, 1,
0.537067, 0.8212116, 0.491122, 0, 0, 1, 1, 1,
0.5376333, 0.3472561, 1.121304, 1, 0, 0, 1, 1,
0.5423675, -0.2238335, 2.153776, 1, 0, 0, 1, 1,
0.5472715, 1.702606, 1.733569, 1, 0, 0, 1, 1,
0.5573574, 1.364666, 0.6413898, 1, 0, 0, 1, 1,
0.5575406, -0.1621891, 1.498352, 1, 0, 0, 1, 1,
0.5575778, 0.5105875, 1.045025, 0, 0, 0, 1, 1,
0.560583, -0.1835421, 0.5118941, 0, 0, 0, 1, 1,
0.560945, -1.497519, 2.581906, 0, 0, 0, 1, 1,
0.5691631, -1.050939, 2.865584, 0, 0, 0, 1, 1,
0.5746738, 0.5000449, 1.747242, 0, 0, 0, 1, 1,
0.57904, -2.5389, 3.527194, 0, 0, 0, 1, 1,
0.5792326, 0.220121, 1.368845, 0, 0, 0, 1, 1,
0.5810216, -0.4640257, 2.843561, 1, 1, 1, 1, 1,
0.5823892, 0.838488, -0.8210076, 1, 1, 1, 1, 1,
0.5851678, 0.3698506, 1.921136, 1, 1, 1, 1, 1,
0.5890208, 0.1521204, 1.872153, 1, 1, 1, 1, 1,
0.5943835, 0.6124505, 0.4442337, 1, 1, 1, 1, 1,
0.6014239, -0.1859752, 3.450324, 1, 1, 1, 1, 1,
0.6147154, -1.325201, 3.374723, 1, 1, 1, 1, 1,
0.6190925, 0.4286872, 1.1055, 1, 1, 1, 1, 1,
0.622209, -0.4254011, 2.517973, 1, 1, 1, 1, 1,
0.6243597, -0.05946905, 1.649779, 1, 1, 1, 1, 1,
0.625625, 0.9960139, 0.4263524, 1, 1, 1, 1, 1,
0.6274244, -0.6534631, 1.276899, 1, 1, 1, 1, 1,
0.6282169, 0.7016576, 2.572502, 1, 1, 1, 1, 1,
0.6326014, -0.295315, 2.20413, 1, 1, 1, 1, 1,
0.6353092, 0.5444804, 1.721033, 1, 1, 1, 1, 1,
0.6357052, 2.058481, 2.335609, 0, 0, 1, 1, 1,
0.6416671, -0.4134859, 2.593892, 1, 0, 0, 1, 1,
0.6417342, -0.5832292, 1.178892, 1, 0, 0, 1, 1,
0.6420703, -0.1967701, 2.770226, 1, 0, 0, 1, 1,
0.6458644, -0.06058807, 1.973306, 1, 0, 0, 1, 1,
0.6461388, 0.001096807, 1.722625, 1, 0, 0, 1, 1,
0.6568676, 0.3492596, 1.188072, 0, 0, 0, 1, 1,
0.6572952, 0.2150479, 0.2145413, 0, 0, 0, 1, 1,
0.6684893, -1.569444, 3.939726, 0, 0, 0, 1, 1,
0.6702681, 0.6931389, 0.6646417, 0, 0, 0, 1, 1,
0.6710589, -1.561447, 1.449831, 0, 0, 0, 1, 1,
0.6732398, -1.031721, 2.595427, 0, 0, 0, 1, 1,
0.6798253, -1.205886, 4.455629, 0, 0, 0, 1, 1,
0.682254, -0.08571912, 2.844168, 1, 1, 1, 1, 1,
0.6829145, 0.1809937, 1.650392, 1, 1, 1, 1, 1,
0.6854612, 0.3408961, 2.434457, 1, 1, 1, 1, 1,
0.6897337, -0.7819601, 1.789526, 1, 1, 1, 1, 1,
0.6931611, -0.7738203, 2.931898, 1, 1, 1, 1, 1,
0.6946402, -0.0806414, 1.023876, 1, 1, 1, 1, 1,
0.699325, 0.1231909, 0.741363, 1, 1, 1, 1, 1,
0.7004451, -0.6306183, 2.058954, 1, 1, 1, 1, 1,
0.701653, -1.281223, 1.233033, 1, 1, 1, 1, 1,
0.7050639, 1.690167, -0.7531069, 1, 1, 1, 1, 1,
0.7068109, 0.02519972, 1.753421, 1, 1, 1, 1, 1,
0.7086196, -0.6473834, 4.676135, 1, 1, 1, 1, 1,
0.7109752, -0.1809105, 1.470587, 1, 1, 1, 1, 1,
0.7162284, 0.8395197, -0.1258176, 1, 1, 1, 1, 1,
0.7176703, -0.3085374, 1.147382, 1, 1, 1, 1, 1,
0.7255467, -0.003522187, 0.6908244, 0, 0, 1, 1, 1,
0.7266911, 0.9199455, 0.7345555, 1, 0, 0, 1, 1,
0.7338153, 1.272052, -0.8522899, 1, 0, 0, 1, 1,
0.7340111, -1.168767, 1.642416, 1, 0, 0, 1, 1,
0.7384061, -0.1668723, 1.284952, 1, 0, 0, 1, 1,
0.7440215, -1.821736, 2.754227, 1, 0, 0, 1, 1,
0.7483155, -0.9787465, 1.064335, 0, 0, 0, 1, 1,
0.7510539, 0.3355136, 2.450972, 0, 0, 0, 1, 1,
0.75796, 0.642432, 2.055115, 0, 0, 0, 1, 1,
0.7616526, 0.7535852, 0.1971222, 0, 0, 0, 1, 1,
0.7620558, 1.010354, 0.09527422, 0, 0, 0, 1, 1,
0.7738218, -0.04002087, 0.8170965, 0, 0, 0, 1, 1,
0.7862163, -0.1001069, 2.544017, 0, 0, 0, 1, 1,
0.7867999, -0.3696719, 2.042343, 1, 1, 1, 1, 1,
0.7891977, 1.819779, 1.61194, 1, 1, 1, 1, 1,
0.790783, 0.4826601, -0.6834545, 1, 1, 1, 1, 1,
0.7909349, -0.4380221, 1.909969, 1, 1, 1, 1, 1,
0.7919568, 0.8988678, -0.07646707, 1, 1, 1, 1, 1,
0.7920107, -0.5470953, 2.749992, 1, 1, 1, 1, 1,
0.7921885, 1.343633, 1.440377, 1, 1, 1, 1, 1,
0.7945142, 1.021598, 2.793274, 1, 1, 1, 1, 1,
0.8071073, -0.04597309, 3.145098, 1, 1, 1, 1, 1,
0.8102287, -0.5191348, 1.135888, 1, 1, 1, 1, 1,
0.8148639, 2.598035, 1.216836, 1, 1, 1, 1, 1,
0.8324745, -0.3466525, 2.999688, 1, 1, 1, 1, 1,
0.842735, 0.9827027, -0.9221868, 1, 1, 1, 1, 1,
0.8450513, 0.3176909, 0.5770121, 1, 1, 1, 1, 1,
0.8456634, -1.49845, 3.921765, 1, 1, 1, 1, 1,
0.847184, -0.7263477, 1.172251, 0, 0, 1, 1, 1,
0.8600073, -0.9858454, 3.551859, 1, 0, 0, 1, 1,
0.867833, -1.368295, 3.926992, 1, 0, 0, 1, 1,
0.8679178, 1.77134, 0.669494, 1, 0, 0, 1, 1,
0.8735868, 2.045835, -1.519126, 1, 0, 0, 1, 1,
0.8808392, -0.001116465, 1.836994, 1, 0, 0, 1, 1,
0.8915014, -0.008484526, 2.339027, 0, 0, 0, 1, 1,
0.8941433, 0.5353218, 0.3358714, 0, 0, 0, 1, 1,
0.8951936, -0.004379864, 2.54295, 0, 0, 0, 1, 1,
0.896683, 1.5425, 0.308454, 0, 0, 0, 1, 1,
0.8997033, 0.7164504, 0.6736315, 0, 0, 0, 1, 1,
0.9053518, -0.1760581, 2.71052, 0, 0, 0, 1, 1,
0.9079778, 0.5505432, 1.451397, 0, 0, 0, 1, 1,
0.9137037, -0.4343249, 1.598547, 1, 1, 1, 1, 1,
0.9217623, -0.05440816, -0.5572004, 1, 1, 1, 1, 1,
0.929162, 1.965286, -0.4194101, 1, 1, 1, 1, 1,
0.9307824, 1.074835, 1.194898, 1, 1, 1, 1, 1,
0.9328157, 1.331391, 0.8691657, 1, 1, 1, 1, 1,
0.9370213, 1.184974, -0.4278559, 1, 1, 1, 1, 1,
0.938415, 2.018513, 0.2208557, 1, 1, 1, 1, 1,
0.9393026, 1.694408, 0.8292422, 1, 1, 1, 1, 1,
0.9458128, -0.7841676, 0.2701356, 1, 1, 1, 1, 1,
0.9464731, 1.131044, -0.4778333, 1, 1, 1, 1, 1,
0.9531226, -0.2635765, 4.3055, 1, 1, 1, 1, 1,
0.9622244, 1.366503, 3.040702, 1, 1, 1, 1, 1,
0.966389, 1.880408, 1.405184, 1, 1, 1, 1, 1,
0.9706694, -0.9271518, 0.4748747, 1, 1, 1, 1, 1,
0.9727117, -0.008111929, 3.494976, 1, 1, 1, 1, 1,
0.9755286, 0.6289961, 1.33804, 0, 0, 1, 1, 1,
0.9759206, 0.3872869, -0.1984111, 1, 0, 0, 1, 1,
0.9836989, 1.316591, 1.088708, 1, 0, 0, 1, 1,
0.9882513, -1.619123, 2.819211, 1, 0, 0, 1, 1,
0.988925, -0.3227427, 1.48548, 1, 0, 0, 1, 1,
0.990181, 1.252376, 0.1170865, 1, 0, 0, 1, 1,
0.9928332, -0.4951331, 2.435746, 0, 0, 0, 1, 1,
0.9995157, 0.2070623, 0.4914662, 0, 0, 0, 1, 1,
1.001065, 0.2459863, -0.6164426, 0, 0, 0, 1, 1,
1.003613, 0.8072991, 0.1749397, 0, 0, 0, 1, 1,
1.003928, 0.3160064, 2.177963, 0, 0, 0, 1, 1,
1.005921, 1.655162, 0.3132668, 0, 0, 0, 1, 1,
1.012612, 0.2566327, 0.443635, 0, 0, 0, 1, 1,
1.016395, 0.3171838, 2.99314, 1, 1, 1, 1, 1,
1.016687, 0.1735227, 1.430126, 1, 1, 1, 1, 1,
1.018388, 0.9457185, 0.03957586, 1, 1, 1, 1, 1,
1.026999, 1.170778, -0.3212696, 1, 1, 1, 1, 1,
1.027307, -1.337657, 3.603609, 1, 1, 1, 1, 1,
1.029602, -0.4419585, 1.459833, 1, 1, 1, 1, 1,
1.033425, -1.111102, -0.02825894, 1, 1, 1, 1, 1,
1.037986, 0.4425902, 1.836076, 1, 1, 1, 1, 1,
1.049051, -0.3697161, 1.172194, 1, 1, 1, 1, 1,
1.050888, 0.7962563, 1.713933, 1, 1, 1, 1, 1,
1.053361, 0.4489699, 2.118101, 1, 1, 1, 1, 1,
1.060107, 2.500007, 0.9825144, 1, 1, 1, 1, 1,
1.069422, 1.813636, 0.1933134, 1, 1, 1, 1, 1,
1.073562, -2.453309, 2.160023, 1, 1, 1, 1, 1,
1.080213, 0.7798932, 1.656543, 1, 1, 1, 1, 1,
1.092526, 0.3108309, -0.1425033, 0, 0, 1, 1, 1,
1.092879, -1.128038, 0.9209619, 1, 0, 0, 1, 1,
1.098513, 0.8734014, 1.157628, 1, 0, 0, 1, 1,
1.100443, 1.820804, 0.003008007, 1, 0, 0, 1, 1,
1.100582, -0.1442426, 1.634537, 1, 0, 0, 1, 1,
1.112848, 2.782542, 0.3865691, 1, 0, 0, 1, 1,
1.114347, -1.750661, 2.23561, 0, 0, 0, 1, 1,
1.118311, 0.7422403, -0.4560494, 0, 0, 0, 1, 1,
1.135883, -0.8375981, 1.990533, 0, 0, 0, 1, 1,
1.145474, 1.347505, 1.893, 0, 0, 0, 1, 1,
1.150799, -0.1013756, 2.774073, 0, 0, 0, 1, 1,
1.153006, -0.6068878, 2.777518, 0, 0, 0, 1, 1,
1.153859, 0.6420577, 1.584159, 0, 0, 0, 1, 1,
1.155152, 0.9628841, 1.47067, 1, 1, 1, 1, 1,
1.155576, 0.119253, 1.94248, 1, 1, 1, 1, 1,
1.169109, 1.165276, 0.8025363, 1, 1, 1, 1, 1,
1.176638, 1.22008, -0.4047361, 1, 1, 1, 1, 1,
1.183305, 0.7295212, 0.1854368, 1, 1, 1, 1, 1,
1.18622, 1.057459, 1.822289, 1, 1, 1, 1, 1,
1.189532, 1.393872, 1.680902, 1, 1, 1, 1, 1,
1.19096, -0.09844383, 2.371182, 1, 1, 1, 1, 1,
1.202277, -0.9815321, 3.165143, 1, 1, 1, 1, 1,
1.203245, -0.1241045, 0.8583605, 1, 1, 1, 1, 1,
1.203656, -0.7214804, 1.419349, 1, 1, 1, 1, 1,
1.211179, 1.281758, 0.3083318, 1, 1, 1, 1, 1,
1.214267, 0.5621008, -0.1168583, 1, 1, 1, 1, 1,
1.217806, 1.154186, 1.103775, 1, 1, 1, 1, 1,
1.219058, -0.325289, 2.461651, 1, 1, 1, 1, 1,
1.222865, -0.4564555, 1.838074, 0, 0, 1, 1, 1,
1.225133, 0.82884, 1.878585, 1, 0, 0, 1, 1,
1.228612, 1.492176, -1.000541, 1, 0, 0, 1, 1,
1.23155, 0.9291111, 1.439028, 1, 0, 0, 1, 1,
1.23426, -0.5071432, 1.548503, 1, 0, 0, 1, 1,
1.237714, -2.173733, 2.823868, 1, 0, 0, 1, 1,
1.244209, 0.5798082, 2.815555, 0, 0, 0, 1, 1,
1.247071, -0.8423867, 1.749711, 0, 0, 0, 1, 1,
1.253321, 0.484695, 0.5779626, 0, 0, 0, 1, 1,
1.258517, 0.8937283, 1.357968, 0, 0, 0, 1, 1,
1.260544, 0.8213092, 2.792432, 0, 0, 0, 1, 1,
1.272322, -1.103812, 1.830599, 0, 0, 0, 1, 1,
1.276845, -0.5823643, 1.845498, 0, 0, 0, 1, 1,
1.286148, -2.383771, 3.018211, 1, 1, 1, 1, 1,
1.291551, 0.262126, 1.599779, 1, 1, 1, 1, 1,
1.294643, 1.309232, 0.5903421, 1, 1, 1, 1, 1,
1.302111, 1.280998, 1.148059, 1, 1, 1, 1, 1,
1.304569, -0.9828136, 0.7572109, 1, 1, 1, 1, 1,
1.309768, 0.5083028, 0.1698293, 1, 1, 1, 1, 1,
1.315594, -0.3904072, 2.068904, 1, 1, 1, 1, 1,
1.32001, 0.4500113, 1.032756, 1, 1, 1, 1, 1,
1.331722, -0.2804699, 2.991913, 1, 1, 1, 1, 1,
1.34317, 0.6775449, 0.7608478, 1, 1, 1, 1, 1,
1.344249, -1.628328, 2.826195, 1, 1, 1, 1, 1,
1.353283, -2.952079, 3.176086, 1, 1, 1, 1, 1,
1.353842, 1.698945, 0.8375524, 1, 1, 1, 1, 1,
1.361353, -0.1273558, 1.215165, 1, 1, 1, 1, 1,
1.367262, 1.761639, 1.314985, 1, 1, 1, 1, 1,
1.371867, -0.6336125, 1.960408, 0, 0, 1, 1, 1,
1.380064, 0.08337856, 1.250086, 1, 0, 0, 1, 1,
1.390743, -1.740103, 5.001148, 1, 0, 0, 1, 1,
1.394088, -0.7996171, 1.244052, 1, 0, 0, 1, 1,
1.395907, -1.010076, -0.04095134, 1, 0, 0, 1, 1,
1.408602, 0.06777875, 1.932229, 1, 0, 0, 1, 1,
1.410739, -0.468568, 1.814664, 0, 0, 0, 1, 1,
1.416951, -0.7069235, 2.334553, 0, 0, 0, 1, 1,
1.417595, -1.53552, 1.683097, 0, 0, 0, 1, 1,
1.425009, -2.179799, 2.364466, 0, 0, 0, 1, 1,
1.426022, 1.12315, 0.8340972, 0, 0, 0, 1, 1,
1.429844, 1.024324, 0.9115548, 0, 0, 0, 1, 1,
1.43896, 0.3953065, 1.765896, 0, 0, 0, 1, 1,
1.440468, -1.218894, 2.233675, 1, 1, 1, 1, 1,
1.440514, 0.4681698, 1.065211, 1, 1, 1, 1, 1,
1.44206, 0.9299869, 0.1127143, 1, 1, 1, 1, 1,
1.457579, -0.5628529, 2.054597, 1, 1, 1, 1, 1,
1.457953, 1.954312, 0.6321998, 1, 1, 1, 1, 1,
1.461103, -1.210497, 3.264443, 1, 1, 1, 1, 1,
1.462571, 0.4677073, 0.2004482, 1, 1, 1, 1, 1,
1.464017, 0.08662085, 2.457469, 1, 1, 1, 1, 1,
1.466946, -0.1146447, 3.210899, 1, 1, 1, 1, 1,
1.470687, 0.4129107, 1.215627, 1, 1, 1, 1, 1,
1.473131, -0.2139531, 1.640692, 1, 1, 1, 1, 1,
1.489036, -0.3460957, 1.680365, 1, 1, 1, 1, 1,
1.496131, 0.3385036, 2.152491, 1, 1, 1, 1, 1,
1.506178, 0.3631023, 2.381209, 1, 1, 1, 1, 1,
1.508372, -0.1157661, 1.579017, 1, 1, 1, 1, 1,
1.508578, -0.07266467, 2.182763, 0, 0, 1, 1, 1,
1.538983, 0.2438915, 2.127039, 1, 0, 0, 1, 1,
1.544854, 0.5042593, 1.708134, 1, 0, 0, 1, 1,
1.558313, 1.803127, -0.4583621, 1, 0, 0, 1, 1,
1.562423, -0.7016109, 1.831152, 1, 0, 0, 1, 1,
1.568422, 0.04806591, 2.361275, 1, 0, 0, 1, 1,
1.578438, 0.9634772, -0.4652688, 0, 0, 0, 1, 1,
1.595693, -0.5934079, 2.530985, 0, 0, 0, 1, 1,
1.596043, 0.5108756, 0.4264087, 0, 0, 0, 1, 1,
1.597899, -0.7460438, 2.412839, 0, 0, 0, 1, 1,
1.619363, -3.047975, 0.9644534, 0, 0, 0, 1, 1,
1.62004, 0.3680528, -0.07378861, 0, 0, 0, 1, 1,
1.628677, -1.298676, 3.187182, 0, 0, 0, 1, 1,
1.630486, 0.4145903, 0.9708141, 1, 1, 1, 1, 1,
1.634061, -1.078032, 5.77949, 1, 1, 1, 1, 1,
1.641512, 0.2024602, 1.636504, 1, 1, 1, 1, 1,
1.650238, 0.05648135, 0.5727345, 1, 1, 1, 1, 1,
1.65237, -0.8712883, 2.120685, 1, 1, 1, 1, 1,
1.654871, 1.302622, 0.1286706, 1, 1, 1, 1, 1,
1.655582, 1.251598, 0.1669801, 1, 1, 1, 1, 1,
1.659587, -0.5244952, 3.025671, 1, 1, 1, 1, 1,
1.669053, 0.430518, 1.297211, 1, 1, 1, 1, 1,
1.675036, -0.07069245, 2.552447, 1, 1, 1, 1, 1,
1.695893, 0.1419293, 1.394507, 1, 1, 1, 1, 1,
1.707954, 2.884987, 0.08932571, 1, 1, 1, 1, 1,
1.713028, -0.4890999, 3.105473, 1, 1, 1, 1, 1,
1.730718, -2.258879, 2.104033, 1, 1, 1, 1, 1,
1.753029, 0.5898902, 0.3647114, 1, 1, 1, 1, 1,
1.759833, 0.5856171, 0.8997802, 0, 0, 1, 1, 1,
1.765295, 0.7355995, -0.06513688, 1, 0, 0, 1, 1,
1.76812, 1.417492, 2.413536, 1, 0, 0, 1, 1,
1.777902, 0.03159988, 1.848945, 1, 0, 0, 1, 1,
1.814067, -2.839656, 3.073798, 1, 0, 0, 1, 1,
1.818532, -0.1248081, 2.219841, 1, 0, 0, 1, 1,
1.822079, -1.901335, 2.493251, 0, 0, 0, 1, 1,
1.853611, -1.134708, 1.385606, 0, 0, 0, 1, 1,
1.867893, -0.02985729, 0.9604887, 0, 0, 0, 1, 1,
1.886307, 0.8249215, 2.10691, 0, 0, 0, 1, 1,
1.909301, 1.376014, 0.4693241, 0, 0, 0, 1, 1,
1.918047, 1.064334, -0.8781705, 0, 0, 0, 1, 1,
1.919947, 0.2794872, 1.671836, 0, 0, 0, 1, 1,
1.927656, 0.2649619, 2.405827, 1, 1, 1, 1, 1,
1.930343, 0.2234112, 1.10628, 1, 1, 1, 1, 1,
1.932927, 0.199117, 0.7427093, 1, 1, 1, 1, 1,
1.943438, 1.13013, -0.1003608, 1, 1, 1, 1, 1,
1.951844, -0.3132247, 1.554129, 1, 1, 1, 1, 1,
1.955858, 0.9644193, -0.3874849, 1, 1, 1, 1, 1,
1.962085, 0.1093426, 1.643642, 1, 1, 1, 1, 1,
1.979716, 1.580811, -0.2797303, 1, 1, 1, 1, 1,
2.020666, -0.130179, -0.3635306, 1, 1, 1, 1, 1,
2.026526, 0.008303844, -0.7457041, 1, 1, 1, 1, 1,
2.053934, -0.9788229, 3.306347, 1, 1, 1, 1, 1,
2.056623, -0.4182973, 1.484967, 1, 1, 1, 1, 1,
2.079438, -0.2365626, 2.18536, 1, 1, 1, 1, 1,
2.087504, -0.368703, 3.163973, 1, 1, 1, 1, 1,
2.151412, -0.493157, 2.908852, 1, 1, 1, 1, 1,
2.1987, -0.8063406, 4.082856, 0, 0, 1, 1, 1,
2.261044, 0.1085026, 3.755513, 1, 0, 0, 1, 1,
2.323344, -0.8576765, 3.466549, 1, 0, 0, 1, 1,
2.358525, -2.323724, 0.8587136, 1, 0, 0, 1, 1,
2.397869, -0.5068308, 0.7792178, 1, 0, 0, 1, 1,
2.406497, 0.2024688, 1.264344, 1, 0, 0, 1, 1,
2.45083, 1.365744, 0.8259017, 0, 0, 0, 1, 1,
2.480088, 0.2483685, 2.769061, 0, 0, 0, 1, 1,
2.519695, 0.8769715, 1.350724, 0, 0, 0, 1, 1,
2.565855, -1.166314, 1.887916, 0, 0, 0, 1, 1,
2.596829, -0.1087206, 1.782711, 0, 0, 0, 1, 1,
2.600724, -0.7941107, 1.861644, 0, 0, 0, 1, 1,
2.654114, -0.03363034, 1.76059, 0, 0, 0, 1, 1,
2.664629, 0.9989488, 2.377146, 1, 1, 1, 1, 1,
2.943059, 1.152292, 1.626329, 1, 1, 1, 1, 1,
2.989825, 0.6950001, 1.372326, 1, 1, 1, 1, 1,
3.000453, 1.041487, 1.944605, 1, 1, 1, 1, 1,
3.127536, -1.282486, 2.847717, 1, 1, 1, 1, 1,
3.753794, -0.8605216, 2.837452, 1, 1, 1, 1, 1,
4.366508, 0.02639202, 1.716733, 1, 1, 1, 1, 1
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
var radius = 9.942805;
var distance = 34.92368;
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
mvMatrix.translate( -0.5516078, 0.1408376, -0.2747648 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.92368);
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
