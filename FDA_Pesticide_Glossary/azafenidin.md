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
-2.905876, 0.8293102, -0.5386778, 1, 0, 0, 1,
-2.898456, -1.530441, -2.632359, 1, 0.007843138, 0, 1,
-2.739311, 0.6614593, -1.397724, 1, 0.01176471, 0, 1,
-2.531449, 1.816883, -1.712495, 1, 0.01960784, 0, 1,
-2.482981, 1.209175, -0.03256971, 1, 0.02352941, 0, 1,
-2.446306, -1.087692, -2.64707, 1, 0.03137255, 0, 1,
-2.406293, -0.2514849, -0.4815654, 1, 0.03529412, 0, 1,
-2.369984, 0.8149506, 0.04909939, 1, 0.04313726, 0, 1,
-2.356142, -0.4384235, -0.5535495, 1, 0.04705882, 0, 1,
-2.317661, 1.124651, -0.4053486, 1, 0.05490196, 0, 1,
-2.315431, 0.906294, -0.291273, 1, 0.05882353, 0, 1,
-2.294066, -0.5747088, -0.6989273, 1, 0.06666667, 0, 1,
-2.249934, 1.398521, -1.329928, 1, 0.07058824, 0, 1,
-2.248755, 0.7627637, -1.277077, 1, 0.07843138, 0, 1,
-2.241086, -0.06253886, -2.326557, 1, 0.08235294, 0, 1,
-2.113436, -0.9906465, -3.379115, 1, 0.09019608, 0, 1,
-2.098233, 0.03015473, -2.016318, 1, 0.09411765, 0, 1,
-2.083896, -1.644922, -1.858792, 1, 0.1019608, 0, 1,
-2.078182, -0.9145955, -2.60884, 1, 0.1098039, 0, 1,
-1.982933, -0.5820396, -1.873929, 1, 0.1137255, 0, 1,
-1.955935, -0.4051785, -1.290975, 1, 0.1215686, 0, 1,
-1.941271, -0.0291495, -0.5540132, 1, 0.1254902, 0, 1,
-1.875623, -0.8646154, -1.877314, 1, 0.1333333, 0, 1,
-1.874035, -1.064099, -1.671545, 1, 0.1372549, 0, 1,
-1.834864, 1.647518, -0.4750068, 1, 0.145098, 0, 1,
-1.818442, 0.6131611, -1.394488, 1, 0.1490196, 0, 1,
-1.817296, -1.139577, -1.088839, 1, 0.1568628, 0, 1,
-1.792668, -0.3499603, -2.919765, 1, 0.1607843, 0, 1,
-1.791561, -0.31026, -2.255133, 1, 0.1686275, 0, 1,
-1.783533, 1.201421, 0.7462425, 1, 0.172549, 0, 1,
-1.772419, 0.9780148, 1.109435, 1, 0.1803922, 0, 1,
-1.768602, 1.339382, -1.139182, 1, 0.1843137, 0, 1,
-1.767985, 0.1445977, -1.660786, 1, 0.1921569, 0, 1,
-1.765818, 1.191909, -1.332793, 1, 0.1960784, 0, 1,
-1.760899, -1.471725, -3.083444, 1, 0.2039216, 0, 1,
-1.759574, 0.9828329, -1.498903, 1, 0.2117647, 0, 1,
-1.759344, -0.5819263, -2.108143, 1, 0.2156863, 0, 1,
-1.751086, 0.6930422, -2.741942, 1, 0.2235294, 0, 1,
-1.750135, -0.06292103, -1.848052, 1, 0.227451, 0, 1,
-1.747114, 1.350356, 0.3205924, 1, 0.2352941, 0, 1,
-1.740824, -0.5754867, -2.355679, 1, 0.2392157, 0, 1,
-1.736897, 0.8527813, -0.3225053, 1, 0.2470588, 0, 1,
-1.736111, 0.4562621, -0.1898073, 1, 0.2509804, 0, 1,
-1.733603, 0.5810193, -1.140923, 1, 0.2588235, 0, 1,
-1.727019, 1.058196, -2.148957, 1, 0.2627451, 0, 1,
-1.72068, 1.616187, -1.993615, 1, 0.2705882, 0, 1,
-1.707831, 0.4313309, -3.018262, 1, 0.2745098, 0, 1,
-1.694643, -0.7307738, -2.984074, 1, 0.282353, 0, 1,
-1.680612, -0.3943458, -3.176413, 1, 0.2862745, 0, 1,
-1.659875, -2.684646, -3.547385, 1, 0.2941177, 0, 1,
-1.645497, -1.692777, -1.790534, 1, 0.3019608, 0, 1,
-1.644603, 1.565734, -0.5337425, 1, 0.3058824, 0, 1,
-1.642458, -0.7408921, -2.14569, 1, 0.3137255, 0, 1,
-1.638617, -0.426887, -2.980594, 1, 0.3176471, 0, 1,
-1.630678, 0.03826816, 0.179296, 1, 0.3254902, 0, 1,
-1.626479, 0.7282328, -1.240279, 1, 0.3294118, 0, 1,
-1.624939, -2.526545, -4.03826, 1, 0.3372549, 0, 1,
-1.610662, 1.675312, 0.9193472, 1, 0.3411765, 0, 1,
-1.604451, 0.2476614, -0.9908429, 1, 0.3490196, 0, 1,
-1.579802, -0.7898194, -1.751824, 1, 0.3529412, 0, 1,
-1.571997, -0.9288273, -2.801685, 1, 0.3607843, 0, 1,
-1.570877, -0.4164115, -0.7211841, 1, 0.3647059, 0, 1,
-1.548935, 1.005895, -0.8575167, 1, 0.372549, 0, 1,
-1.543585, 0.7566683, -0.2894582, 1, 0.3764706, 0, 1,
-1.54145, 0.7730264, 0.4495148, 1, 0.3843137, 0, 1,
-1.539358, -1.898561, -2.559288, 1, 0.3882353, 0, 1,
-1.53728, 0.02045985, -2.492329, 1, 0.3960784, 0, 1,
-1.523627, -1.049684, -4.715704, 1, 0.4039216, 0, 1,
-1.522132, 0.9287825, -0.9329484, 1, 0.4078431, 0, 1,
-1.517161, 1.164618, -0.6289759, 1, 0.4156863, 0, 1,
-1.501732, -0.4858835, -3.275744, 1, 0.4196078, 0, 1,
-1.49853, -0.5320684, -4.241223, 1, 0.427451, 0, 1,
-1.497638, -1.407519, -1.681697, 1, 0.4313726, 0, 1,
-1.490841, -1.532896, -3.434665, 1, 0.4392157, 0, 1,
-1.488412, 1.117302, -0.9221293, 1, 0.4431373, 0, 1,
-1.488051, -0.09945952, -1.51018, 1, 0.4509804, 0, 1,
-1.476574, 0.02377825, 0.2313225, 1, 0.454902, 0, 1,
-1.468108, -1.071887, -2.682628, 1, 0.4627451, 0, 1,
-1.431895, -0.4703665, -2.21267, 1, 0.4666667, 0, 1,
-1.427723, -1.391083, -1.840836, 1, 0.4745098, 0, 1,
-1.414463, 0.1819522, -1.328838, 1, 0.4784314, 0, 1,
-1.405546, -0.2517238, -3.662272, 1, 0.4862745, 0, 1,
-1.402323, -0.3487349, -3.032752, 1, 0.4901961, 0, 1,
-1.397956, 1.177783, -1.652936, 1, 0.4980392, 0, 1,
-1.39133, 1.685938, -1.701776, 1, 0.5058824, 0, 1,
-1.390902, -0.1750159, -0.5309897, 1, 0.509804, 0, 1,
-1.382663, -0.2755189, -1.887903, 1, 0.5176471, 0, 1,
-1.367923, 0.8571904, -1.30229, 1, 0.5215687, 0, 1,
-1.364238, 0.2773253, -0.4252683, 1, 0.5294118, 0, 1,
-1.360381, 1.086449, -1.829499, 1, 0.5333334, 0, 1,
-1.355755, -0.06286989, -1.426422, 1, 0.5411765, 0, 1,
-1.354434, -0.1282888, -0.9234242, 1, 0.5450981, 0, 1,
-1.352904, 0.1479301, -1.505129, 1, 0.5529412, 0, 1,
-1.352779, -1.089424, -3.221975, 1, 0.5568628, 0, 1,
-1.349365, -1.054805, -2.158405, 1, 0.5647059, 0, 1,
-1.341937, 0.9441106, -1.576127, 1, 0.5686275, 0, 1,
-1.339683, -0.1823551, -0.51025, 1, 0.5764706, 0, 1,
-1.32994, -0.359535, -3.415913, 1, 0.5803922, 0, 1,
-1.329036, 1.220552, -1.284937, 1, 0.5882353, 0, 1,
-1.309642, 0.6554406, -0.3005257, 1, 0.5921569, 0, 1,
-1.302763, -1.624741, -2.836488, 1, 0.6, 0, 1,
-1.300385, 0.9511542, -2.468568, 1, 0.6078432, 0, 1,
-1.299156, -0.1843696, -1.600482, 1, 0.6117647, 0, 1,
-1.294793, -2.232405, -2.9005, 1, 0.6196079, 0, 1,
-1.284814, -0.0005792452, -2.081784, 1, 0.6235294, 0, 1,
-1.282644, -1.14664, -1.373738, 1, 0.6313726, 0, 1,
-1.272572, -0.5057321, -2.142836, 1, 0.6352941, 0, 1,
-1.269332, 1.493825, -0.8685911, 1, 0.6431373, 0, 1,
-1.261438, -0.4178286, -2.419593, 1, 0.6470588, 0, 1,
-1.26026, -0.4996892, -1.645963, 1, 0.654902, 0, 1,
-1.254589, 0.00555911, -0.1460198, 1, 0.6588235, 0, 1,
-1.251746, -0.6623228, -2.63635, 1, 0.6666667, 0, 1,
-1.249772, -0.5761889, -1.857674, 1, 0.6705883, 0, 1,
-1.243154, -0.4943971, -2.206949, 1, 0.6784314, 0, 1,
-1.234335, 0.1956769, -1.775282, 1, 0.682353, 0, 1,
-1.223998, -0.5018989, -2.214829, 1, 0.6901961, 0, 1,
-1.221199, 0.06525259, 0.4935387, 1, 0.6941177, 0, 1,
-1.21674, -1.042583, -1.972472, 1, 0.7019608, 0, 1,
-1.214179, -0.0977198, 0.235075, 1, 0.7098039, 0, 1,
-1.20838, 0.1962841, -3.04352, 1, 0.7137255, 0, 1,
-1.186902, 2.02981, -1.165911, 1, 0.7215686, 0, 1,
-1.184414, 0.3458272, -1.848679, 1, 0.7254902, 0, 1,
-1.166777, 0.5537198, -1.371476, 1, 0.7333333, 0, 1,
-1.164823, 1.09757, -1.870907, 1, 0.7372549, 0, 1,
-1.163263, 1.33106, 0.6731492, 1, 0.7450981, 0, 1,
-1.162867, 1.874758, -0.5470908, 1, 0.7490196, 0, 1,
-1.155378, 0.6397582, -1.388558, 1, 0.7568628, 0, 1,
-1.153951, -0.794844, -1.702343, 1, 0.7607843, 0, 1,
-1.149826, 1.647746, 0.03398198, 1, 0.7686275, 0, 1,
-1.149488, 0.1261358, -0.8467455, 1, 0.772549, 0, 1,
-1.146734, 1.361675, 0.1772141, 1, 0.7803922, 0, 1,
-1.141956, -0.2333493, -4.295897, 1, 0.7843137, 0, 1,
-1.132661, -0.3824446, -1.327182, 1, 0.7921569, 0, 1,
-1.119019, -1.782928, -3.305093, 1, 0.7960784, 0, 1,
-1.118112, -1.898334, -3.964732, 1, 0.8039216, 0, 1,
-1.115338, -0.3314939, -3.998505, 1, 0.8117647, 0, 1,
-1.114815, 0.1292014, -1.96858, 1, 0.8156863, 0, 1,
-1.112934, -1.589749, -2.269498, 1, 0.8235294, 0, 1,
-1.107963, 0.7115638, 0.6550889, 1, 0.827451, 0, 1,
-1.101591, 0.4330187, 0.5022886, 1, 0.8352941, 0, 1,
-1.097543, 0.772306, -0.3979388, 1, 0.8392157, 0, 1,
-1.095924, 0.3736502, -0.7463198, 1, 0.8470588, 0, 1,
-1.088108, -1.626253, -3.286144, 1, 0.8509804, 0, 1,
-1.08161, -0.280079, -3.35507, 1, 0.8588235, 0, 1,
-1.077555, -0.799837, -2.639349, 1, 0.8627451, 0, 1,
-1.072265, 1.577671, -3.229265, 1, 0.8705882, 0, 1,
-1.071917, 0.7907639, -2.552996, 1, 0.8745098, 0, 1,
-1.071596, -1.139944, -1.469122, 1, 0.8823529, 0, 1,
-1.071223, -0.1630053, -2.945293, 1, 0.8862745, 0, 1,
-1.065177, -1.429887, -1.183065, 1, 0.8941177, 0, 1,
-1.062045, 0.8798826, -1.035053, 1, 0.8980392, 0, 1,
-1.059701, 0.08696203, 0.05772432, 1, 0.9058824, 0, 1,
-1.056553, -0.1631919, -1.097174, 1, 0.9137255, 0, 1,
-1.056051, 2.126882, 0.6585936, 1, 0.9176471, 0, 1,
-1.046717, -1.348587, -3.127058, 1, 0.9254902, 0, 1,
-1.042637, -0.1706486, -2.612598, 1, 0.9294118, 0, 1,
-1.02981, -0.06232372, -2.007836, 1, 0.9372549, 0, 1,
-1.018613, 1.446644, -0.9092383, 1, 0.9411765, 0, 1,
-1.018281, 0.3541842, -2.490882, 1, 0.9490196, 0, 1,
-1.017342, -0.4322385, -2.608566, 1, 0.9529412, 0, 1,
-1.009541, 0.6055877, -2.697283, 1, 0.9607843, 0, 1,
-1.00768, 1.746545, -0.3549524, 1, 0.9647059, 0, 1,
-1.006421, 0.1962144, -2.07428, 1, 0.972549, 0, 1,
-1.003522, -0.8594838, -1.030855, 1, 0.9764706, 0, 1,
-1.00176, 1.234691, -0.8259138, 1, 0.9843137, 0, 1,
-0.9995655, 1.144058, -1.047232, 1, 0.9882353, 0, 1,
-0.9972494, 0.5329577, -1.508023, 1, 0.9960784, 0, 1,
-0.9928375, 0.6895905, -0.6864251, 0.9960784, 1, 0, 1,
-0.9872568, -1.820139, -2.245549, 0.9921569, 1, 0, 1,
-0.98421, -1.071529, -3.039636, 0.9843137, 1, 0, 1,
-0.9832978, -0.3589752, -3.152218, 0.9803922, 1, 0, 1,
-0.9798626, -2.318686, -3.319559, 0.972549, 1, 0, 1,
-0.9794797, -2.036365, -3.536258, 0.9686275, 1, 0, 1,
-0.9794635, -0.5386573, -2.819925, 0.9607843, 1, 0, 1,
-0.9756778, -0.4358847, -3.288413, 0.9568627, 1, 0, 1,
-0.9686208, -1.073758, -2.506773, 0.9490196, 1, 0, 1,
-0.9665048, 0.8547183, -0.8699279, 0.945098, 1, 0, 1,
-0.965276, 0.4314339, -0.4427839, 0.9372549, 1, 0, 1,
-0.9554105, 0.09938657, -0.09639112, 0.9333333, 1, 0, 1,
-0.9539924, 0.05917532, -1.581411, 0.9254902, 1, 0, 1,
-0.9455558, 0.8996938, 1.128162, 0.9215686, 1, 0, 1,
-0.9402493, -0.174652, -1.830964, 0.9137255, 1, 0, 1,
-0.9373964, 0.138644, -2.045474, 0.9098039, 1, 0, 1,
-0.9306987, 0.1993161, -0.6264392, 0.9019608, 1, 0, 1,
-0.9138201, -0.2253828, -1.408819, 0.8941177, 1, 0, 1,
-0.9119033, 1.916596, -1.455548, 0.8901961, 1, 0, 1,
-0.9087224, -1.37033, -2.060804, 0.8823529, 1, 0, 1,
-0.9036417, 0.1569037, -0.4751354, 0.8784314, 1, 0, 1,
-0.8939331, 0.8231326, 0.2627608, 0.8705882, 1, 0, 1,
-0.8897518, 0.1412673, -2.33652, 0.8666667, 1, 0, 1,
-0.8877764, 2.585581, -0.07065225, 0.8588235, 1, 0, 1,
-0.887273, -0.122415, -3.710398, 0.854902, 1, 0, 1,
-0.8859943, -0.62607, -2.907845, 0.8470588, 1, 0, 1,
-0.8836931, 1.432088, 0.3795792, 0.8431373, 1, 0, 1,
-0.8834946, -2.075975, -2.782839, 0.8352941, 1, 0, 1,
-0.869364, -0.2290283, -4.447371, 0.8313726, 1, 0, 1,
-0.8680235, 1.3375, -2.436267, 0.8235294, 1, 0, 1,
-0.8625957, 0.5202612, 0.02373619, 0.8196079, 1, 0, 1,
-0.8621708, -2.106108, -2.432462, 0.8117647, 1, 0, 1,
-0.8584313, 0.2781681, -3.851875, 0.8078431, 1, 0, 1,
-0.839798, 0.2733788, -0.8311341, 0.8, 1, 0, 1,
-0.839076, -0.7969828, -2.37911, 0.7921569, 1, 0, 1,
-0.8351834, -0.01813506, -1.821379, 0.7882353, 1, 0, 1,
-0.8325087, -0.1271605, -1.719826, 0.7803922, 1, 0, 1,
-0.8292192, -0.04581313, -1.478558, 0.7764706, 1, 0, 1,
-0.8194877, -1.534529, -1.536949, 0.7686275, 1, 0, 1,
-0.8031775, -0.05157491, -4.4815, 0.7647059, 1, 0, 1,
-0.8010262, 0.1887216, -1.495792, 0.7568628, 1, 0, 1,
-0.7916928, -1.707479, -3.623594, 0.7529412, 1, 0, 1,
-0.7909115, -0.9819657, -1.629369, 0.7450981, 1, 0, 1,
-0.7887188, 1.450526, -0.8702733, 0.7411765, 1, 0, 1,
-0.7885814, -0.5209355, -1.502509, 0.7333333, 1, 0, 1,
-0.7885723, -1.308843, -2.366439, 0.7294118, 1, 0, 1,
-0.7801697, 0.07345432, -0.7541187, 0.7215686, 1, 0, 1,
-0.777716, -0.7341487, -2.080202, 0.7176471, 1, 0, 1,
-0.7762752, -1.279446, -3.55202, 0.7098039, 1, 0, 1,
-0.7724797, 2.872875, -1.868205, 0.7058824, 1, 0, 1,
-0.7714713, 0.08046483, -1.711759, 0.6980392, 1, 0, 1,
-0.7661209, 0.3148299, -2.171948, 0.6901961, 1, 0, 1,
-0.7643294, -1.45483, -3.281815, 0.6862745, 1, 0, 1,
-0.7619077, 3.456023, 0.378349, 0.6784314, 1, 0, 1,
-0.7614285, -0.08688713, -2.267616, 0.6745098, 1, 0, 1,
-0.7606159, -1.004405, -1.795187, 0.6666667, 1, 0, 1,
-0.7535202, -0.970005, -3.437412, 0.6627451, 1, 0, 1,
-0.7500427, -0.661937, -2.965951, 0.654902, 1, 0, 1,
-0.7497136, 0.4520616, -1.150826, 0.6509804, 1, 0, 1,
-0.748196, 0.6485686, -0.5638237, 0.6431373, 1, 0, 1,
-0.7435861, 0.7102465, -0.02381456, 0.6392157, 1, 0, 1,
-0.7431189, -0.7606853, -3.443745, 0.6313726, 1, 0, 1,
-0.7428061, 0.06647421, -2.469653, 0.627451, 1, 0, 1,
-0.7404127, -0.2339107, -3.544183, 0.6196079, 1, 0, 1,
-0.7385921, -0.9789183, -1.370909, 0.6156863, 1, 0, 1,
-0.7299948, 0.6433794, -2.373459, 0.6078432, 1, 0, 1,
-0.7241554, -0.4187894, -1.337126, 0.6039216, 1, 0, 1,
-0.722558, -0.5874516, -2.631375, 0.5960785, 1, 0, 1,
-0.716032, -0.8070922, -2.937649, 0.5882353, 1, 0, 1,
-0.7111922, -0.6592643, -2.980148, 0.5843138, 1, 0, 1,
-0.7063373, 0.03718186, -1.931525, 0.5764706, 1, 0, 1,
-0.6970858, 1.221074, -2.688574, 0.572549, 1, 0, 1,
-0.6968778, -0.5371085, -2.438326, 0.5647059, 1, 0, 1,
-0.6897222, 1.813314, -2.310972, 0.5607843, 1, 0, 1,
-0.6809635, -0.2248925, -4.064586, 0.5529412, 1, 0, 1,
-0.6751686, -0.1726867, -2.240879, 0.5490196, 1, 0, 1,
-0.6724619, -2.218317, -4.813225, 0.5411765, 1, 0, 1,
-0.6664416, 0.3262475, -0.747037, 0.5372549, 1, 0, 1,
-0.6642265, 0.8466205, 0.1468492, 0.5294118, 1, 0, 1,
-0.6598169, 0.4157011, -1.32158, 0.5254902, 1, 0, 1,
-0.6595976, -0.6264452, -1.300412, 0.5176471, 1, 0, 1,
-0.6590381, -0.5398957, -1.827599, 0.5137255, 1, 0, 1,
-0.6480771, 0.4871024, -2.24509, 0.5058824, 1, 0, 1,
-0.6458214, 0.8494332, -0.3303444, 0.5019608, 1, 0, 1,
-0.6442783, -0.8130886, -1.829777, 0.4941176, 1, 0, 1,
-0.6439192, 0.5804936, -0.1944302, 0.4862745, 1, 0, 1,
-0.6392376, 0.8036804, 0.05061342, 0.4823529, 1, 0, 1,
-0.6377266, 0.006468843, -2.987864, 0.4745098, 1, 0, 1,
-0.6356124, -1.600925, -3.739454, 0.4705882, 1, 0, 1,
-0.6345103, 1.557333, -1.934342, 0.4627451, 1, 0, 1,
-0.6328385, 0.6799877, -1.10631, 0.4588235, 1, 0, 1,
-0.6317629, -0.5735828, -2.730509, 0.4509804, 1, 0, 1,
-0.6257812, 0.7761832, -0.2175686, 0.4470588, 1, 0, 1,
-0.622999, 1.1005, 0.3495386, 0.4392157, 1, 0, 1,
-0.6219724, 1.133016, -1.795872, 0.4352941, 1, 0, 1,
-0.6194531, -0.2471959, -3.032895, 0.427451, 1, 0, 1,
-0.6179556, 1.096203, -0.4619521, 0.4235294, 1, 0, 1,
-0.6170927, -0.510805, -3.911324, 0.4156863, 1, 0, 1,
-0.6142743, -0.3463056, -2.929764, 0.4117647, 1, 0, 1,
-0.6120673, 1.215388, -2.35599, 0.4039216, 1, 0, 1,
-0.6087665, -0.6611739, -2.061414, 0.3960784, 1, 0, 1,
-0.604664, -1.139679, -5.461315, 0.3921569, 1, 0, 1,
-0.5979112, 0.1400355, -1.102311, 0.3843137, 1, 0, 1,
-0.5953117, 0.04954131, -2.071589, 0.3803922, 1, 0, 1,
-0.5921559, 2.674463, -1.922336, 0.372549, 1, 0, 1,
-0.5911964, 0.3408948, -0.5867121, 0.3686275, 1, 0, 1,
-0.5893967, 1.364876, -1.283293, 0.3607843, 1, 0, 1,
-0.586382, 0.2375902, -1.729434, 0.3568628, 1, 0, 1,
-0.5828468, -1.818168, -4.007889, 0.3490196, 1, 0, 1,
-0.5822845, 1.033534, 0.7254067, 0.345098, 1, 0, 1,
-0.5778966, -0.2026203, -3.107257, 0.3372549, 1, 0, 1,
-0.5761651, -0.007840007, -1.421639, 0.3333333, 1, 0, 1,
-0.5738068, -2.374003, -1.671594, 0.3254902, 1, 0, 1,
-0.571533, -1.65745, -1.175238, 0.3215686, 1, 0, 1,
-0.5704228, -2.177782, -4.425312, 0.3137255, 1, 0, 1,
-0.5634372, 0.1529681, 0.3419327, 0.3098039, 1, 0, 1,
-0.5595839, -0.106092, -2.58876, 0.3019608, 1, 0, 1,
-0.5571598, -1.852509, -3.519883, 0.2941177, 1, 0, 1,
-0.5524094, -0.1282482, -2.391781, 0.2901961, 1, 0, 1,
-0.5463147, 0.3258813, -0.7659153, 0.282353, 1, 0, 1,
-0.5415363, -0.4824637, -2.272776, 0.2784314, 1, 0, 1,
-0.5414275, 0.5712671, -0.5657892, 0.2705882, 1, 0, 1,
-0.5414056, 0.6489551, -0.8104127, 0.2666667, 1, 0, 1,
-0.5400097, 1.518631, -0.825152, 0.2588235, 1, 0, 1,
-0.5384775, -0.2269806, -1.201824, 0.254902, 1, 0, 1,
-0.5368531, -1.667241, -3.307477, 0.2470588, 1, 0, 1,
-0.5337155, -0.5494481, -1.016017, 0.2431373, 1, 0, 1,
-0.5318288, 0.9118571, -2.069634, 0.2352941, 1, 0, 1,
-0.5294989, -0.3748372, -1.953035, 0.2313726, 1, 0, 1,
-0.5198258, -0.5324439, -3.977536, 0.2235294, 1, 0, 1,
-0.515694, -0.3070278, -4.046061, 0.2196078, 1, 0, 1,
-0.5152586, 1.738535, -0.831525, 0.2117647, 1, 0, 1,
-0.5131643, 0.3848674, -1.377297, 0.2078431, 1, 0, 1,
-0.51142, 1.446337, -0.8323085, 0.2, 1, 0, 1,
-0.5050073, 0.2145226, -1.37295, 0.1921569, 1, 0, 1,
-0.5047339, 1.299356, 0.951636, 0.1882353, 1, 0, 1,
-0.5033123, 0.7271217, 1.382597, 0.1803922, 1, 0, 1,
-0.5016835, 0.1584026, -0.5743896, 0.1764706, 1, 0, 1,
-0.5003151, -0.5293582, -2.698735, 0.1686275, 1, 0, 1,
-0.4962413, 2.850029, -0.3662295, 0.1647059, 1, 0, 1,
-0.4960762, -0.4918245, -1.740464, 0.1568628, 1, 0, 1,
-0.4918735, 0.5749485, -0.2510582, 0.1529412, 1, 0, 1,
-0.4793895, -0.6846274, -4.002572, 0.145098, 1, 0, 1,
-0.4750759, -0.3250169, -1.617146, 0.1411765, 1, 0, 1,
-0.4706432, 1.094489, -0.6240711, 0.1333333, 1, 0, 1,
-0.4656575, 0.8082318, -1.450902, 0.1294118, 1, 0, 1,
-0.4624499, 0.1849862, -1.009861, 0.1215686, 1, 0, 1,
-0.4611791, -0.2313977, -1.894391, 0.1176471, 1, 0, 1,
-0.4594679, 0.09265737, 0.1122595, 0.1098039, 1, 0, 1,
-0.4589899, 0.9719692, 0.4006598, 0.1058824, 1, 0, 1,
-0.458328, 1.669993, -1.581773, 0.09803922, 1, 0, 1,
-0.4535322, -1.209853, -2.934169, 0.09019608, 1, 0, 1,
-0.4516235, 1.269373, -0.2990371, 0.08627451, 1, 0, 1,
-0.4484366, -0.04352781, -3.176617, 0.07843138, 1, 0, 1,
-0.4400119, 1.738154, -1.065607, 0.07450981, 1, 0, 1,
-0.4387898, -0.9154114, -3.899402, 0.06666667, 1, 0, 1,
-0.4368539, -0.3350772, -3.238645, 0.0627451, 1, 0, 1,
-0.4320922, -0.09891643, -2.687159, 0.05490196, 1, 0, 1,
-0.4276999, -1.020761, -2.715336, 0.05098039, 1, 0, 1,
-0.418899, -0.4057381, -1.762496, 0.04313726, 1, 0, 1,
-0.4188483, -0.113943, -1.923837, 0.03921569, 1, 0, 1,
-0.4165692, -0.1031139, -1.104091, 0.03137255, 1, 0, 1,
-0.4146567, -1.64192, -2.636009, 0.02745098, 1, 0, 1,
-0.4136356, -0.9341248, -3.836537, 0.01960784, 1, 0, 1,
-0.4134077, -1.487066, -2.459831, 0.01568628, 1, 0, 1,
-0.4110556, -0.8401317, -4.507477, 0.007843138, 1, 0, 1,
-0.405468, -0.6048512, -2.402933, 0.003921569, 1, 0, 1,
-0.4042245, -0.9788566, -4.851925, 0, 1, 0.003921569, 1,
-0.401455, -0.6709361, -1.335051, 0, 1, 0.01176471, 1,
-0.4011291, 0.2393966, 0.7392027, 0, 1, 0.01568628, 1,
-0.3991517, -0.2698691, -3.637205, 0, 1, 0.02352941, 1,
-0.3972541, -0.45842, -2.379785, 0, 1, 0.02745098, 1,
-0.3946792, -0.506082, -3.191609, 0, 1, 0.03529412, 1,
-0.3928807, -0.7258345, -2.410357, 0, 1, 0.03921569, 1,
-0.3909242, -1.614854, -1.364365, 0, 1, 0.04705882, 1,
-0.390618, 0.8830708, 0.5648577, 0, 1, 0.05098039, 1,
-0.3901629, -0.5808141, -2.649521, 0, 1, 0.05882353, 1,
-0.3893293, -0.7923754, -2.697338, 0, 1, 0.0627451, 1,
-0.3883334, 0.608456, -0.6238037, 0, 1, 0.07058824, 1,
-0.3882185, -0.551785, -2.062441, 0, 1, 0.07450981, 1,
-0.3873484, -0.5105246, -1.687839, 0, 1, 0.08235294, 1,
-0.3849576, 0.2068393, -0.7594835, 0, 1, 0.08627451, 1,
-0.3799157, -0.1204336, -2.580771, 0, 1, 0.09411765, 1,
-0.3785411, -1.345259, -4.696005, 0, 1, 0.1019608, 1,
-0.3724906, -0.3239419, -2.79659, 0, 1, 0.1058824, 1,
-0.3721228, 1.163446, 0.3437217, 0, 1, 0.1137255, 1,
-0.3707574, -1.362877, -2.984273, 0, 1, 0.1176471, 1,
-0.3678196, 0.9939664, -0.05604617, 0, 1, 0.1254902, 1,
-0.3678168, 0.998221, -2.157291, 0, 1, 0.1294118, 1,
-0.3660607, 1.996084, -1.560062, 0, 1, 0.1372549, 1,
-0.3628709, -0.607587, -1.935457, 0, 1, 0.1411765, 1,
-0.3609205, 0.09440015, -0.01383068, 0, 1, 0.1490196, 1,
-0.3548158, 0.1845617, -1.622819, 0, 1, 0.1529412, 1,
-0.3543975, 0.4954169, -0.1528149, 0, 1, 0.1607843, 1,
-0.3534782, 0.1589582, -1.710007, 0, 1, 0.1647059, 1,
-0.3521449, 1.057343, 2.205689, 0, 1, 0.172549, 1,
-0.3508679, 0.2774625, -1.547134, 0, 1, 0.1764706, 1,
-0.3491772, -0.2675683, -1.304091, 0, 1, 0.1843137, 1,
-0.3490031, 1.799101, -0.8920901, 0, 1, 0.1882353, 1,
-0.348171, 0.8640584, 0.2023674, 0, 1, 0.1960784, 1,
-0.3433272, -0.7622865, -2.744172, 0, 1, 0.2039216, 1,
-0.3420461, 0.7991483, -0.5021734, 0, 1, 0.2078431, 1,
-0.3419798, 0.2646215, 0.7167873, 0, 1, 0.2156863, 1,
-0.3418765, -2.358426, -1.613889, 0, 1, 0.2196078, 1,
-0.3418532, -0.360272, -3.900785, 0, 1, 0.227451, 1,
-0.339869, 1.035893, -1.265064, 0, 1, 0.2313726, 1,
-0.3361561, 0.02905161, -2.104496, 0, 1, 0.2392157, 1,
-0.3340338, -0.3134234, -1.800373, 0, 1, 0.2431373, 1,
-0.33371, 0.587306, -0.4830896, 0, 1, 0.2509804, 1,
-0.3320104, -0.03695779, -0.1164743, 0, 1, 0.254902, 1,
-0.3242083, -0.1698534, -0.3996854, 0, 1, 0.2627451, 1,
-0.3238954, 1.183135, 0.3043211, 0, 1, 0.2666667, 1,
-0.3144052, -0.02601256, -2.559139, 0, 1, 0.2745098, 1,
-0.3051497, -1.036976, -1.703083, 0, 1, 0.2784314, 1,
-0.2997623, 1.054529, -0.540127, 0, 1, 0.2862745, 1,
-0.2916622, 0.806613, 1.264039, 0, 1, 0.2901961, 1,
-0.2913843, 0.6504623, -0.7615452, 0, 1, 0.2980392, 1,
-0.2882648, -0.7739068, -3.537971, 0, 1, 0.3058824, 1,
-0.2868553, -1.175553, -3.553137, 0, 1, 0.3098039, 1,
-0.2850061, 1.027513, -0.896167, 0, 1, 0.3176471, 1,
-0.2827542, 0.2973378, -0.1745816, 0, 1, 0.3215686, 1,
-0.2826632, 1.780479, 0.2425781, 0, 1, 0.3294118, 1,
-0.2767256, -1.865536, -3.066937, 0, 1, 0.3333333, 1,
-0.2756311, -1.614728, -3.546718, 0, 1, 0.3411765, 1,
-0.2752481, 0.858008, -0.8054917, 0, 1, 0.345098, 1,
-0.2741984, -0.6884463, -3.191236, 0, 1, 0.3529412, 1,
-0.2734717, 0.2514987, -0.3611621, 0, 1, 0.3568628, 1,
-0.2728849, 0.9566877, 0.806075, 0, 1, 0.3647059, 1,
-0.2701842, 0.9201522, -0.2730294, 0, 1, 0.3686275, 1,
-0.2701814, 0.3691621, -0.8518512, 0, 1, 0.3764706, 1,
-0.268758, -1.331455, -3.078601, 0, 1, 0.3803922, 1,
-0.2686061, -1.113595, -2.769554, 0, 1, 0.3882353, 1,
-0.2646891, -0.5394992, -2.339401, 0, 1, 0.3921569, 1,
-0.2635831, 0.4943357, -0.3403768, 0, 1, 0.4, 1,
-0.2591631, 0.6092324, -0.3339343, 0, 1, 0.4078431, 1,
-0.2576454, 1.3844, -0.2029356, 0, 1, 0.4117647, 1,
-0.2562314, 0.7996212, 1.089941, 0, 1, 0.4196078, 1,
-0.25623, 0.2216977, -1.021557, 0, 1, 0.4235294, 1,
-0.2495497, -0.2863409, -2.638464, 0, 1, 0.4313726, 1,
-0.2469435, -1.809888, -3.320153, 0, 1, 0.4352941, 1,
-0.2451568, -2.500139, -1.988696, 0, 1, 0.4431373, 1,
-0.2447818, 0.2019555, -0.738847, 0, 1, 0.4470588, 1,
-0.2437959, -1.061983, -3.826542, 0, 1, 0.454902, 1,
-0.2426836, 0.4037217, -1.399937, 0, 1, 0.4588235, 1,
-0.2425054, 0.7416232, -0.1974436, 0, 1, 0.4666667, 1,
-0.2368256, -0.9232371, -2.240766, 0, 1, 0.4705882, 1,
-0.2353438, 0.5526161, -0.001834907, 0, 1, 0.4784314, 1,
-0.2341421, -1.169466, -1.961244, 0, 1, 0.4823529, 1,
-0.2287802, 0.752882, -1.978511, 0, 1, 0.4901961, 1,
-0.2272675, 0.3236134, -1.800968, 0, 1, 0.4941176, 1,
-0.221121, -0.7606255, -2.57386, 0, 1, 0.5019608, 1,
-0.2198055, -2.048662, -3.098233, 0, 1, 0.509804, 1,
-0.2149089, 1.174288, 0.9426261, 0, 1, 0.5137255, 1,
-0.2125046, 0.5078701, 0.4720917, 0, 1, 0.5215687, 1,
-0.2110649, 0.4133412, 1.638306, 0, 1, 0.5254902, 1,
-0.2066499, 0.08120971, -0.605967, 0, 1, 0.5333334, 1,
-0.2043488, -2.074225, -3.171915, 0, 1, 0.5372549, 1,
-0.2006475, -0.3428057, -1.440649, 0, 1, 0.5450981, 1,
-0.1965625, 1.020951, -0.7740436, 0, 1, 0.5490196, 1,
-0.1937531, -0.1117425, -0.6659206, 0, 1, 0.5568628, 1,
-0.1913553, 1.427475, 0.04043808, 0, 1, 0.5607843, 1,
-0.1879543, 0.3422047, -0.318764, 0, 1, 0.5686275, 1,
-0.1853662, -0.5261027, -3.647153, 0, 1, 0.572549, 1,
-0.1773003, -0.2319507, -1.318158, 0, 1, 0.5803922, 1,
-0.1695877, 1.131584, 0.6766893, 0, 1, 0.5843138, 1,
-0.1694112, -0.4419561, -3.292725, 0, 1, 0.5921569, 1,
-0.1632622, 0.1089245, -1.266482, 0, 1, 0.5960785, 1,
-0.1627609, 1.237141, -1.164635, 0, 1, 0.6039216, 1,
-0.1607287, -0.2363089, -1.570384, 0, 1, 0.6117647, 1,
-0.1561666, -3.198362, -2.879099, 0, 1, 0.6156863, 1,
-0.1536778, -0.8987837, -1.708668, 0, 1, 0.6235294, 1,
-0.1513859, -0.08021343, -1.266101, 0, 1, 0.627451, 1,
-0.1471822, -1.356185, -4.139908, 0, 1, 0.6352941, 1,
-0.1468966, 0.3823961, -1.459365, 0, 1, 0.6392157, 1,
-0.1416194, 0.248459, 0.5695103, 0, 1, 0.6470588, 1,
-0.1369427, 0.290891, -2.43892, 0, 1, 0.6509804, 1,
-0.1335078, 0.05742852, 0.09879154, 0, 1, 0.6588235, 1,
-0.1328966, 1.344927, -0.4367374, 0, 1, 0.6627451, 1,
-0.1260641, 0.9614108, 0.6499466, 0, 1, 0.6705883, 1,
-0.1184184, -1.698869, -2.504909, 0, 1, 0.6745098, 1,
-0.1142068, -0.3481841, -2.482833, 0, 1, 0.682353, 1,
-0.1101433, -0.05639277, -3.117998, 0, 1, 0.6862745, 1,
-0.1091595, -0.6824688, -2.717169, 0, 1, 0.6941177, 1,
-0.1089397, -0.01840319, -0.4719535, 0, 1, 0.7019608, 1,
-0.1020331, 0.4263667, -1.04309, 0, 1, 0.7058824, 1,
-0.1009569, 0.04730055, -2.343787, 0, 1, 0.7137255, 1,
-0.09604887, -0.7247383, -2.93591, 0, 1, 0.7176471, 1,
-0.09573567, 0.06059905, -1.160238, 0, 1, 0.7254902, 1,
-0.08397686, 0.2153025, 0.6737095, 0, 1, 0.7294118, 1,
-0.08355958, 0.5026122, 0.5074481, 0, 1, 0.7372549, 1,
-0.08266152, -1.64552, -4.247093, 0, 1, 0.7411765, 1,
-0.07988116, -0.72075, -2.622185, 0, 1, 0.7490196, 1,
-0.07567757, 0.336054, 0.6810585, 0, 1, 0.7529412, 1,
-0.07120877, 1.706001, -1.61415, 0, 1, 0.7607843, 1,
-0.07106955, -1.667962, -0.5741246, 0, 1, 0.7647059, 1,
-0.07003782, 0.241413, 0.6258504, 0, 1, 0.772549, 1,
-0.07002571, -0.02680711, -2.664935, 0, 1, 0.7764706, 1,
-0.06915907, 0.5086681, 0.6465089, 0, 1, 0.7843137, 1,
-0.06446416, -1.395601, -3.279499, 0, 1, 0.7882353, 1,
-0.06271295, 1.224455, -1.486712, 0, 1, 0.7960784, 1,
-0.06216365, 1.104263, 0.01323367, 0, 1, 0.8039216, 1,
-0.0619659, 1.141802, -2.179259, 0, 1, 0.8078431, 1,
-0.05562316, -0.7889971, -4.130683, 0, 1, 0.8156863, 1,
-0.04962397, 0.7416421, -1.159995, 0, 1, 0.8196079, 1,
-0.04549228, 0.6585967, 0.6608848, 0, 1, 0.827451, 1,
-0.04498446, 0.317351, -0.3972651, 0, 1, 0.8313726, 1,
-0.04090125, -0.7226165, -0.8157388, 0, 1, 0.8392157, 1,
-0.03824969, -0.1530536, -2.555784, 0, 1, 0.8431373, 1,
-0.03656167, -0.7057819, -4.093184, 0, 1, 0.8509804, 1,
-0.03537878, 0.8409466, -0.1102636, 0, 1, 0.854902, 1,
-0.03455585, -1.544678, -3.473338, 0, 1, 0.8627451, 1,
-0.03143345, 1.438316, 0.5575023, 0, 1, 0.8666667, 1,
-0.03081535, -0.2011858, -3.749866, 0, 1, 0.8745098, 1,
-0.02931432, -1.062153, -1.682676, 0, 1, 0.8784314, 1,
-0.02784323, 0.85312, -1.010544, 0, 1, 0.8862745, 1,
-0.02113614, 0.2148312, -1.822486, 0, 1, 0.8901961, 1,
-0.01841977, 0.3844809, 0.1701461, 0, 1, 0.8980392, 1,
-0.01593592, -1.186199, -4.516994, 0, 1, 0.9058824, 1,
-0.01155475, 0.3108327, -0.05805542, 0, 1, 0.9098039, 1,
-0.00862148, -1.138178, -2.067958, 0, 1, 0.9176471, 1,
-0.005999119, -0.4470936, -2.935027, 0, 1, 0.9215686, 1,
-0.005674524, 0.905946, 1.219012, 0, 1, 0.9294118, 1,
-0.001499609, 0.5681199, 0.321248, 0, 1, 0.9333333, 1,
1.815231e-05, -0.1673594, 2.792127, 0, 1, 0.9411765, 1,
0.001076154, 0.07929188, 0.9018883, 0, 1, 0.945098, 1,
0.001623448, 1.81862, -0.6467378, 0, 1, 0.9529412, 1,
0.001935308, 0.3130616, 1.898502, 0, 1, 0.9568627, 1,
0.008256114, -0.4635889, 3.318874, 0, 1, 0.9647059, 1,
0.009986922, 0.1434836, -0.3112515, 0, 1, 0.9686275, 1,
0.01001793, -0.6725435, 4.76249, 0, 1, 0.9764706, 1,
0.01079256, 0.0114838, 1.082591, 0, 1, 0.9803922, 1,
0.01642784, 0.02998422, 1.374571, 0, 1, 0.9882353, 1,
0.01826909, 1.487076, -0.1539782, 0, 1, 0.9921569, 1,
0.01930622, -0.1910038, 3.411052, 0, 1, 1, 1,
0.02080579, -0.4315931, 4.246342, 0, 0.9921569, 1, 1,
0.02087906, -0.5003167, 1.749451, 0, 0.9882353, 1, 1,
0.024743, 0.8141468, 0.4494357, 0, 0.9803922, 1, 1,
0.02516397, -1.45251, 0.8810405, 0, 0.9764706, 1, 1,
0.02709569, -1.768246, 4.583174, 0, 0.9686275, 1, 1,
0.02747155, -0.3212134, 1.778884, 0, 0.9647059, 1, 1,
0.03381241, 0.568163, 1.941476, 0, 0.9568627, 1, 1,
0.03810626, 0.4646725, -0.9934644, 0, 0.9529412, 1, 1,
0.04106977, -0.1989059, 2.212597, 0, 0.945098, 1, 1,
0.04342026, -0.80634, 3.112172, 0, 0.9411765, 1, 1,
0.0443764, 2.510289, -1.074928, 0, 0.9333333, 1, 1,
0.04595915, 1.678098, -0.7066398, 0, 0.9294118, 1, 1,
0.04774404, 0.8734988, -1.02165, 0, 0.9215686, 1, 1,
0.05168265, -1.066365, 2.435326, 0, 0.9176471, 1, 1,
0.05485544, -0.2935021, 2.646598, 0, 0.9098039, 1, 1,
0.05681923, -1.998191, 2.651461, 0, 0.9058824, 1, 1,
0.05836856, -0.7531441, 4.324131, 0, 0.8980392, 1, 1,
0.06010695, -2.361347, 4.822364, 0, 0.8901961, 1, 1,
0.06093657, 1.074598, 0.6265608, 0, 0.8862745, 1, 1,
0.06628751, 0.02176608, 0.6572998, 0, 0.8784314, 1, 1,
0.06664938, 0.2664503, 1.999713, 0, 0.8745098, 1, 1,
0.07236345, -0.01217289, 2.728882, 0, 0.8666667, 1, 1,
0.07312141, 0.5499968, 0.7359462, 0, 0.8627451, 1, 1,
0.08023196, -1.011263, 3.513335, 0, 0.854902, 1, 1,
0.08073738, 0.4005393, -0.05166795, 0, 0.8509804, 1, 1,
0.08332313, -0.6781158, 4.973709, 0, 0.8431373, 1, 1,
0.08786751, -0.647402, 4.611285, 0, 0.8392157, 1, 1,
0.08902977, 1.370462, 1.339522, 0, 0.8313726, 1, 1,
0.08932275, 0.8727816, 0.950201, 0, 0.827451, 1, 1,
0.09206992, -1.276628, 3.410311, 0, 0.8196079, 1, 1,
0.09472813, 0.2255347, 0.6657439, 0, 0.8156863, 1, 1,
0.09783366, -0.4125089, 1.830357, 0, 0.8078431, 1, 1,
0.09988511, 0.6856032, -1.367669, 0, 0.8039216, 1, 1,
0.1002981, 0.08910128, 1.714081, 0, 0.7960784, 1, 1,
0.1024828, -0.04975716, 2.784465, 0, 0.7882353, 1, 1,
0.1057519, 0.9560605, -0.2941146, 0, 0.7843137, 1, 1,
0.1096583, -0.8943773, 3.081269, 0, 0.7764706, 1, 1,
0.1109943, -2.693174, 3.187197, 0, 0.772549, 1, 1,
0.1158829, -0.6566438, 2.1793, 0, 0.7647059, 1, 1,
0.1206462, 0.7969896, 1.087101, 0, 0.7607843, 1, 1,
0.1244703, -0.922787, 3.245727, 0, 0.7529412, 1, 1,
0.1251915, -0.003185113, 2.067815, 0, 0.7490196, 1, 1,
0.1262919, -0.1762675, 2.852071, 0, 0.7411765, 1, 1,
0.1302912, -0.3364464, 1.857958, 0, 0.7372549, 1, 1,
0.1303522, -0.110519, 1.106303, 0, 0.7294118, 1, 1,
0.1357856, 0.4157503, 0.65707, 0, 0.7254902, 1, 1,
0.1395562, -1.006729, 2.45942, 0, 0.7176471, 1, 1,
0.1399401, 0.008717762, 1.129563, 0, 0.7137255, 1, 1,
0.1466548, 0.738436, 0.9663278, 0, 0.7058824, 1, 1,
0.1505805, -1.484729, 2.457827, 0, 0.6980392, 1, 1,
0.1519956, 1.077498, -0.7411624, 0, 0.6941177, 1, 1,
0.1524508, 0.1805625, 1.601105, 0, 0.6862745, 1, 1,
0.1527601, 0.6883274, 0.7807901, 0, 0.682353, 1, 1,
0.1532059, -0.7671313, 3.682562, 0, 0.6745098, 1, 1,
0.1560523, -0.3997507, 2.710704, 0, 0.6705883, 1, 1,
0.1560938, 0.6196615, -1.263686, 0, 0.6627451, 1, 1,
0.1588242, -1.151214, 3.806497, 0, 0.6588235, 1, 1,
0.1617561, -0.1755367, 2.846465, 0, 0.6509804, 1, 1,
0.1728192, 0.7398492, 0.1258695, 0, 0.6470588, 1, 1,
0.1783961, 0.623421, -0.5454327, 0, 0.6392157, 1, 1,
0.1805003, -0.5002739, 3.431394, 0, 0.6352941, 1, 1,
0.1812871, 1.449672, 1.284433, 0, 0.627451, 1, 1,
0.1851918, 1.349421, 0.735917, 0, 0.6235294, 1, 1,
0.1857109, -0.6832198, 4.203741, 0, 0.6156863, 1, 1,
0.1868223, -0.2246442, 2.513294, 0, 0.6117647, 1, 1,
0.1868361, -1.220737, 3.431329, 0, 0.6039216, 1, 1,
0.1878496, -0.539059, 2.909824, 0, 0.5960785, 1, 1,
0.1994668, 0.7271458, 0.3727313, 0, 0.5921569, 1, 1,
0.1995553, 0.2271765, 0.0670903, 0, 0.5843138, 1, 1,
0.201522, -0.4966663, 1.627698, 0, 0.5803922, 1, 1,
0.2021746, -0.6475083, 4.185823, 0, 0.572549, 1, 1,
0.205607, -0.5852979, 2.589054, 0, 0.5686275, 1, 1,
0.2063341, -0.4004453, 2.706843, 0, 0.5607843, 1, 1,
0.2074473, -1.087031, 2.67091, 0, 0.5568628, 1, 1,
0.2085767, -0.8304249, 5.388892, 0, 0.5490196, 1, 1,
0.2161906, -1.816514, 2.606745, 0, 0.5450981, 1, 1,
0.2212437, -0.02694609, 2.205358, 0, 0.5372549, 1, 1,
0.2246576, -0.1971637, 2.185004, 0, 0.5333334, 1, 1,
0.2303419, 1.736236, 1.061183, 0, 0.5254902, 1, 1,
0.2312992, 1.007445, 0.9700177, 0, 0.5215687, 1, 1,
0.2327487, 1.609251, -0.8216416, 0, 0.5137255, 1, 1,
0.2343187, 1.033985, 0.7329265, 0, 0.509804, 1, 1,
0.2347954, 0.5395654, -0.8981642, 0, 0.5019608, 1, 1,
0.2380794, 0.9237298, 0.8777554, 0, 0.4941176, 1, 1,
0.241272, -0.2255191, 1.555943, 0, 0.4901961, 1, 1,
0.24198, -0.6311083, 2.89398, 0, 0.4823529, 1, 1,
0.2444805, -0.6020474, 3.052971, 0, 0.4784314, 1, 1,
0.2473986, 0.379379, -0.2675162, 0, 0.4705882, 1, 1,
0.2487664, 0.9767093, 1.552485, 0, 0.4666667, 1, 1,
0.2495824, -0.7346609, 1.941378, 0, 0.4588235, 1, 1,
0.2531125, -0.304853, 2.030493, 0, 0.454902, 1, 1,
0.256722, -0.4554644, 1.698276, 0, 0.4470588, 1, 1,
0.2567278, -1.194029, 2.644433, 0, 0.4431373, 1, 1,
0.2578181, -0.08539085, 1.978956, 0, 0.4352941, 1, 1,
0.2623324, -0.2965659, 2.064997, 0, 0.4313726, 1, 1,
0.2643899, -1.49914, 2.319769, 0, 0.4235294, 1, 1,
0.2677433, 0.4930382, 0.5963722, 0, 0.4196078, 1, 1,
0.2700256, 0.8879308, -0.5604766, 0, 0.4117647, 1, 1,
0.2749094, -0.08743919, 4.470194, 0, 0.4078431, 1, 1,
0.275924, -1.517688, 4.315074, 0, 0.4, 1, 1,
0.2779171, -0.1270894, 1.609819, 0, 0.3921569, 1, 1,
0.2787888, 1.803178, -1.348051, 0, 0.3882353, 1, 1,
0.2796198, 0.03842167, 1.684385, 0, 0.3803922, 1, 1,
0.286745, -0.4418797, 4.0631, 0, 0.3764706, 1, 1,
0.2880526, 0.6974871, -0.2731809, 0, 0.3686275, 1, 1,
0.2891957, 0.05110956, -0.08413193, 0, 0.3647059, 1, 1,
0.2899489, 0.578328, 1.385036, 0, 0.3568628, 1, 1,
0.2915193, 0.5236506, -0.7114058, 0, 0.3529412, 1, 1,
0.2975155, 1.555498, 0.9788902, 0, 0.345098, 1, 1,
0.3052841, 0.8347206, 1.655251, 0, 0.3411765, 1, 1,
0.3087363, -0.5224273, 1.283504, 0, 0.3333333, 1, 1,
0.3090316, 0.7119498, 1.636225, 0, 0.3294118, 1, 1,
0.3135863, -0.4498089, 3.381643, 0, 0.3215686, 1, 1,
0.315169, 0.1693498, -0.698306, 0, 0.3176471, 1, 1,
0.3163968, 1.463677, -0.4823029, 0, 0.3098039, 1, 1,
0.3190085, 1.282369, 0.3239043, 0, 0.3058824, 1, 1,
0.3216495, -0.178702, 0.1941427, 0, 0.2980392, 1, 1,
0.3246805, -2.093473, 5.880875, 0, 0.2901961, 1, 1,
0.3296685, -1.651037, 2.943005, 0, 0.2862745, 1, 1,
0.3297477, -1.78108, 2.692898, 0, 0.2784314, 1, 1,
0.3307385, 0.2356374, 2.373024, 0, 0.2745098, 1, 1,
0.3314848, -0.3205458, 1.464562, 0, 0.2666667, 1, 1,
0.3333741, 0.2677965, 1.820789, 0, 0.2627451, 1, 1,
0.3334197, 0.0725554, 0.4430991, 0, 0.254902, 1, 1,
0.3396516, -0.2951408, 3.020675, 0, 0.2509804, 1, 1,
0.3423167, -1.878925, 2.814748, 0, 0.2431373, 1, 1,
0.3441022, 1.089222, 2.356158, 0, 0.2392157, 1, 1,
0.3479736, -0.7353305, 4.470607, 0, 0.2313726, 1, 1,
0.3497717, 1.100034, 1.46263, 0, 0.227451, 1, 1,
0.3503451, 0.7671925, -1.141286, 0, 0.2196078, 1, 1,
0.3509601, 0.8515763, 0.8661285, 0, 0.2156863, 1, 1,
0.3575011, -0.2072505, 2.409614, 0, 0.2078431, 1, 1,
0.3753378, -0.5473549, 2.631076, 0, 0.2039216, 1, 1,
0.3764838, 0.1965155, -1.03962, 0, 0.1960784, 1, 1,
0.3768306, 0.25218, 0.731076, 0, 0.1882353, 1, 1,
0.377968, 1.365777, -1.120945, 0, 0.1843137, 1, 1,
0.381586, 0.2674292, 1.270389, 0, 0.1764706, 1, 1,
0.383123, -0.7046789, 2.366286, 0, 0.172549, 1, 1,
0.3866307, -1.418444, 3.816984, 0, 0.1647059, 1, 1,
0.3868027, 0.6832814, 1.725503, 0, 0.1607843, 1, 1,
0.3877725, 1.040669, 0.6276833, 0, 0.1529412, 1, 1,
0.3902266, 0.463305, -0.5152765, 0, 0.1490196, 1, 1,
0.3905399, 0.2970941, -2.029052, 0, 0.1411765, 1, 1,
0.3912727, 0.6522264, 0.03748173, 0, 0.1372549, 1, 1,
0.3954836, 0.3861943, 2.405675, 0, 0.1294118, 1, 1,
0.398236, -1.443757, 2.865513, 0, 0.1254902, 1, 1,
0.4002644, -0.1171816, 3.472901, 0, 0.1176471, 1, 1,
0.4013062, -0.5409085, 2.583655, 0, 0.1137255, 1, 1,
0.4037373, 0.1628108, 2.525456, 0, 0.1058824, 1, 1,
0.4041955, 2.679342, -0.5118865, 0, 0.09803922, 1, 1,
0.4048423, -0.6018225, 2.41521, 0, 0.09411765, 1, 1,
0.40561, -0.2711824, 2.161656, 0, 0.08627451, 1, 1,
0.4080465, -0.120574, 0.8403624, 0, 0.08235294, 1, 1,
0.4127909, -0.678996, 4.185985, 0, 0.07450981, 1, 1,
0.4143421, -0.643554, 2.095391, 0, 0.07058824, 1, 1,
0.4165488, 0.5907035, 0.7819968, 0, 0.0627451, 1, 1,
0.4296294, -0.1465715, 2.203825, 0, 0.05882353, 1, 1,
0.4350004, 2.982041, -0.6130056, 0, 0.05098039, 1, 1,
0.435968, -1.160705, 2.841911, 0, 0.04705882, 1, 1,
0.4382865, 1.162353, 0.7680377, 0, 0.03921569, 1, 1,
0.4400641, -1.325424, 3.432431, 0, 0.03529412, 1, 1,
0.4412414, -0.4400808, 3.027455, 0, 0.02745098, 1, 1,
0.4456953, -1.326103, 3.359673, 0, 0.02352941, 1, 1,
0.4460527, 1.282262, -0.9567741, 0, 0.01568628, 1, 1,
0.4493971, -1.249342, 2.548943, 0, 0.01176471, 1, 1,
0.4530537, 0.03747118, 2.861482, 0, 0.003921569, 1, 1,
0.4651108, -0.4264574, 3.500873, 0.003921569, 0, 1, 1,
0.4662875, 1.327404, 0.1454943, 0.007843138, 0, 1, 1,
0.4686966, 0.8373449, 1.893184, 0.01568628, 0, 1, 1,
0.4692028, 0.07533985, 0.551962, 0.01960784, 0, 1, 1,
0.4695812, 2.637289, 0.7213996, 0.02745098, 0, 1, 1,
0.4744633, 0.5499532, 2.780615, 0.03137255, 0, 1, 1,
0.4841537, -2.287152, 3.83191, 0.03921569, 0, 1, 1,
0.4858838, -0.6742027, 1.827753, 0.04313726, 0, 1, 1,
0.4863143, 0.05385889, 2.75635, 0.05098039, 0, 1, 1,
0.4915196, 0.9339168, -0.05619991, 0.05490196, 0, 1, 1,
0.4943925, 0.2251315, -0.4155664, 0.0627451, 0, 1, 1,
0.4953377, -0.04268907, 1.18391, 0.06666667, 0, 1, 1,
0.5002766, -0.2840649, 0.8811762, 0.07450981, 0, 1, 1,
0.5014483, -0.9504339, 1.387109, 0.07843138, 0, 1, 1,
0.5063391, -0.2085826, 1.356225, 0.08627451, 0, 1, 1,
0.5091237, -0.2186228, 1.992259, 0.09019608, 0, 1, 1,
0.5092455, 0.6053618, 0.2281848, 0.09803922, 0, 1, 1,
0.5099747, 0.5033223, 0.8820662, 0.1058824, 0, 1, 1,
0.5129483, 0.634136, 2.302062, 0.1098039, 0, 1, 1,
0.5213018, -1.002696, 3.532526, 0.1176471, 0, 1, 1,
0.5218886, -0.4866179, 1.948229, 0.1215686, 0, 1, 1,
0.5228984, -0.1468208, 1.94245, 0.1294118, 0, 1, 1,
0.5247211, 0.77667, -0.7372625, 0.1333333, 0, 1, 1,
0.5323153, 0.2443222, 0.1534229, 0.1411765, 0, 1, 1,
0.5360689, -0.02585956, -0.01245815, 0.145098, 0, 1, 1,
0.53662, -0.5027732, 1.122146, 0.1529412, 0, 1, 1,
0.5391737, -0.8004645, 1.46897, 0.1568628, 0, 1, 1,
0.53953, -0.604225, 2.13861, 0.1647059, 0, 1, 1,
0.5438872, 0.133908, 3.34645, 0.1686275, 0, 1, 1,
0.5442321, -0.9283199, 2.851164, 0.1764706, 0, 1, 1,
0.5481724, -0.7766407, 4.046306, 0.1803922, 0, 1, 1,
0.5505432, -0.1955506, 0.4435142, 0.1882353, 0, 1, 1,
0.5516279, 0.1041089, 1.074764, 0.1921569, 0, 1, 1,
0.5551204, 0.6020542, 1.049499, 0.2, 0, 1, 1,
0.5567784, 0.9278242, 0.5935204, 0.2078431, 0, 1, 1,
0.5585488, -0.411117, 1.32903, 0.2117647, 0, 1, 1,
0.5595961, 0.2986505, 1.58706, 0.2196078, 0, 1, 1,
0.5604638, -0.9473552, 0.6729706, 0.2235294, 0, 1, 1,
0.5639966, 0.8639542, 0.2848969, 0.2313726, 0, 1, 1,
0.5682073, 0.180362, -0.5022652, 0.2352941, 0, 1, 1,
0.5727531, 1.035196, 0.02661293, 0.2431373, 0, 1, 1,
0.5749753, -0.6159307, 2.811832, 0.2470588, 0, 1, 1,
0.5809711, -0.7098453, 1.037712, 0.254902, 0, 1, 1,
0.5829462, 0.2542077, 1.771716, 0.2588235, 0, 1, 1,
0.583209, -0.05122012, 1.683554, 0.2666667, 0, 1, 1,
0.5856681, -0.1998211, 2.083854, 0.2705882, 0, 1, 1,
0.5954511, -0.568386, 1.372098, 0.2784314, 0, 1, 1,
0.5958298, 0.9828368, 0.8458574, 0.282353, 0, 1, 1,
0.5980798, -0.2404349, 1.335488, 0.2901961, 0, 1, 1,
0.6029455, 1.57472, -0.2355197, 0.2941177, 0, 1, 1,
0.6121222, -1.069116, 1.698346, 0.3019608, 0, 1, 1,
0.612598, 0.6951348, 0.2944693, 0.3098039, 0, 1, 1,
0.6174022, 0.1766241, 1.011086, 0.3137255, 0, 1, 1,
0.6182704, 0.4231245, 0.3964881, 0.3215686, 0, 1, 1,
0.6194672, 0.7383628, -0.3407359, 0.3254902, 0, 1, 1,
0.6221209, -0.3849712, 2.105594, 0.3333333, 0, 1, 1,
0.6235797, 0.6561401, 0.4250251, 0.3372549, 0, 1, 1,
0.6310853, 2.436344, 0.2348188, 0.345098, 0, 1, 1,
0.6315485, -0.4024529, 1.426482, 0.3490196, 0, 1, 1,
0.6339435, -0.04205344, 3.397552, 0.3568628, 0, 1, 1,
0.6346028, 0.475198, 0.4842457, 0.3607843, 0, 1, 1,
0.6477094, 0.2590185, 0.0643943, 0.3686275, 0, 1, 1,
0.6495896, -1.356531, 4.373958, 0.372549, 0, 1, 1,
0.6532107, -1.262292, 3.048607, 0.3803922, 0, 1, 1,
0.6550258, -0.3060144, 2.027988, 0.3843137, 0, 1, 1,
0.6611185, -0.2299158, 3.19635, 0.3921569, 0, 1, 1,
0.6646826, -0.9616607, 1.216426, 0.3960784, 0, 1, 1,
0.6649849, 0.395829, 2.667032, 0.4039216, 0, 1, 1,
0.6687117, 1.77644, 0.8881478, 0.4117647, 0, 1, 1,
0.6750069, -0.07771915, 1.723639, 0.4156863, 0, 1, 1,
0.678261, -0.3031546, 2.980022, 0.4235294, 0, 1, 1,
0.6787028, -1.145385, 4.073895, 0.427451, 0, 1, 1,
0.6793072, -1.024344, 3.3567, 0.4352941, 0, 1, 1,
0.6797038, 1.397877, 1.990593, 0.4392157, 0, 1, 1,
0.6804336, -0.09862446, 2.017879, 0.4470588, 0, 1, 1,
0.6842137, -1.411581, 1.325664, 0.4509804, 0, 1, 1,
0.6843844, 0.5448983, 1.298955, 0.4588235, 0, 1, 1,
0.6897756, -1.580387, 3.634048, 0.4627451, 0, 1, 1,
0.6925438, -1.268443, 1.862271, 0.4705882, 0, 1, 1,
0.6951839, -1.638376, 3.927226, 0.4745098, 0, 1, 1,
0.6959089, 1.25134, 1.024814, 0.4823529, 0, 1, 1,
0.6960101, -0.4363684, 2.694006, 0.4862745, 0, 1, 1,
0.7003514, -1.153714, 2.524108, 0.4941176, 0, 1, 1,
0.7019128, 1.262718, -0.4622155, 0.5019608, 0, 1, 1,
0.7056766, 0.5726577, 0.2051691, 0.5058824, 0, 1, 1,
0.707963, -0.3008407, 2.507174, 0.5137255, 0, 1, 1,
0.7091511, 0.8500639, -0.2777463, 0.5176471, 0, 1, 1,
0.7137848, -0.1126081, 0.3051935, 0.5254902, 0, 1, 1,
0.7140725, -0.250389, 0.9642966, 0.5294118, 0, 1, 1,
0.7155998, -2.376473, 2.928598, 0.5372549, 0, 1, 1,
0.7194389, 0.614014, 0.7968239, 0.5411765, 0, 1, 1,
0.7217469, -0.5260714, 1.063964, 0.5490196, 0, 1, 1,
0.7234434, 0.273685, 0.9055266, 0.5529412, 0, 1, 1,
0.7240372, -1.387707, 2.372546, 0.5607843, 0, 1, 1,
0.7267218, -1.340775, 1.476959, 0.5647059, 0, 1, 1,
0.7268707, 0.9056407, 0.6421283, 0.572549, 0, 1, 1,
0.7283736, -0.5953246, 2.103219, 0.5764706, 0, 1, 1,
0.7303597, 0.8461506, -1.922793, 0.5843138, 0, 1, 1,
0.7338083, 1.21273, 1.322858, 0.5882353, 0, 1, 1,
0.7340848, -0.8964371, 4.137022, 0.5960785, 0, 1, 1,
0.7351459, 0.6777875, 1.398708, 0.6039216, 0, 1, 1,
0.7396594, 1.084423, 1.323152, 0.6078432, 0, 1, 1,
0.7424008, -1.395037, 2.25176, 0.6156863, 0, 1, 1,
0.7432799, -0.6028533, 1.695917, 0.6196079, 0, 1, 1,
0.7447713, -0.6182772, 2.154381, 0.627451, 0, 1, 1,
0.7593406, -0.06460483, 2.903083, 0.6313726, 0, 1, 1,
0.7635145, 0.2218365, -0.1218653, 0.6392157, 0, 1, 1,
0.7712663, -1.116776, 0.463526, 0.6431373, 0, 1, 1,
0.772975, -0.8936393, 1.992473, 0.6509804, 0, 1, 1,
0.7746373, 0.5677221, 0.04168489, 0.654902, 0, 1, 1,
0.7793385, -0.8446353, 2.541764, 0.6627451, 0, 1, 1,
0.7796229, -0.4752229, -0.003561835, 0.6666667, 0, 1, 1,
0.7821002, -0.511117, 3.739247, 0.6745098, 0, 1, 1,
0.7862476, 0.5171253, 0.9832947, 0.6784314, 0, 1, 1,
0.7902877, 0.7301052, 0.8235672, 0.6862745, 0, 1, 1,
0.7905455, 2.250494, -0.3037505, 0.6901961, 0, 1, 1,
0.8021874, 0.1183783, 1.184983, 0.6980392, 0, 1, 1,
0.80222, 1.693716, -1.530458, 0.7058824, 0, 1, 1,
0.802782, 0.3034227, 2.675074, 0.7098039, 0, 1, 1,
0.8036147, 1.320111, -1.2573, 0.7176471, 0, 1, 1,
0.8127947, -0.4597862, 0.6955597, 0.7215686, 0, 1, 1,
0.8138587, -0.1547924, -0.1824042, 0.7294118, 0, 1, 1,
0.8149549, 0.9279737, 2.25523, 0.7333333, 0, 1, 1,
0.8149997, 0.03728571, 0.916425, 0.7411765, 0, 1, 1,
0.8184441, 0.4521296, 0.5531214, 0.7450981, 0, 1, 1,
0.8228123, 1.086596, 1.079529, 0.7529412, 0, 1, 1,
0.8245343, -1.433213, 2.741001, 0.7568628, 0, 1, 1,
0.8258546, 0.4429454, 3.088129, 0.7647059, 0, 1, 1,
0.8263335, -0.1122017, 1.991215, 0.7686275, 0, 1, 1,
0.8266512, 0.1237528, 3.108445, 0.7764706, 0, 1, 1,
0.8272548, 0.9656034, 1.185974, 0.7803922, 0, 1, 1,
0.8321379, 0.6951748, 1.537457, 0.7882353, 0, 1, 1,
0.8401939, -2.016345, 4.069164, 0.7921569, 0, 1, 1,
0.840799, -0.1114979, 1.752576, 0.8, 0, 1, 1,
0.8421319, 1.130114, 0.2050515, 0.8078431, 0, 1, 1,
0.8421593, 0.207248, 0.6675974, 0.8117647, 0, 1, 1,
0.8426281, 1.019525, -0.1843864, 0.8196079, 0, 1, 1,
0.8431274, -0.129468, 1.819754, 0.8235294, 0, 1, 1,
0.8504065, -0.7651608, 0.9500728, 0.8313726, 0, 1, 1,
0.8561255, -0.4817664, 2.034551, 0.8352941, 0, 1, 1,
0.8581136, 2.052259, 0.2961463, 0.8431373, 0, 1, 1,
0.8604986, 0.9667897, 0.2060653, 0.8470588, 0, 1, 1,
0.8651596, -0.758392, 0.7407421, 0.854902, 0, 1, 1,
0.8715494, -1.130585, 2.414135, 0.8588235, 0, 1, 1,
0.877492, 0.4688159, 1.303814, 0.8666667, 0, 1, 1,
0.8839008, 0.3099633, 1.179051, 0.8705882, 0, 1, 1,
0.8877792, 0.3458107, 0.1134161, 0.8784314, 0, 1, 1,
0.8920263, -0.9444586, 1.050524, 0.8823529, 0, 1, 1,
0.8944574, -1.442864, 3.733171, 0.8901961, 0, 1, 1,
0.9042463, 0.8052575, 1.366388, 0.8941177, 0, 1, 1,
0.9046801, 0.4719478, 0.3930084, 0.9019608, 0, 1, 1,
0.9079369, 0.1698922, -0.2382379, 0.9098039, 0, 1, 1,
0.9142192, -0.4939437, 4.002586, 0.9137255, 0, 1, 1,
0.9142718, -1.069902, 2.746753, 0.9215686, 0, 1, 1,
0.9186093, 1.172748, 0.6916916, 0.9254902, 0, 1, 1,
0.919774, -0.5364711, 2.281105, 0.9333333, 0, 1, 1,
0.9272485, -0.3155216, 0.9301525, 0.9372549, 0, 1, 1,
0.9275239, 0.7238621, 1.863903, 0.945098, 0, 1, 1,
0.9277155, 1.900733, -0.2366391, 0.9490196, 0, 1, 1,
0.9373709, 0.2263151, 2.053461, 0.9568627, 0, 1, 1,
0.9457464, 0.1968954, 1.057381, 0.9607843, 0, 1, 1,
0.9507715, 1.334925, 1.856066, 0.9686275, 0, 1, 1,
0.958768, 0.372345, 0.05060624, 0.972549, 0, 1, 1,
0.9602022, 0.8385088, 1.26528, 0.9803922, 0, 1, 1,
0.9632016, 0.4648082, 2.232078, 0.9843137, 0, 1, 1,
0.9636899, 1.143257, 0.2350197, 0.9921569, 0, 1, 1,
0.9639651, -1.426529, 2.120007, 0.9960784, 0, 1, 1,
0.9674706, 0.7928435, 0.1620347, 1, 0, 0.9960784, 1,
0.9685994, -0.1988467, 1.36645, 1, 0, 0.9882353, 1,
0.9693745, -0.4176137, 1.710044, 1, 0, 0.9843137, 1,
0.9705779, -0.1900644, 2.401781, 1, 0, 0.9764706, 1,
0.9706129, -1.78806, 4.307389, 1, 0, 0.972549, 1,
0.97067, 0.2195589, 2.302362, 1, 0, 0.9647059, 1,
0.9746925, -0.9497615, 0.6323465, 1, 0, 0.9607843, 1,
0.9906928, -0.5985155, 1.102187, 1, 0, 0.9529412, 1,
0.9980192, -1.311544, 2.141142, 1, 0, 0.9490196, 1,
0.999391, 0.413299, -0.52455, 1, 0, 0.9411765, 1,
1.009841, 1.039567, 0.8910016, 1, 0, 0.9372549, 1,
1.021814, 0.8921165, -0.4391256, 1, 0, 0.9294118, 1,
1.026917, -0.9840243, 2.223906, 1, 0, 0.9254902, 1,
1.02733, -0.2214283, 1.530864, 1, 0, 0.9176471, 1,
1.030263, 0.08066801, 1.659004, 1, 0, 0.9137255, 1,
1.034562, -0.3690836, 2.082836, 1, 0, 0.9058824, 1,
1.038328, -0.874722, 2.129887, 1, 0, 0.9019608, 1,
1.048053, 0.9753154, 0.4314746, 1, 0, 0.8941177, 1,
1.049992, -1.572129, 2.170799, 1, 0, 0.8862745, 1,
1.053272, 0.1371831, -0.6480948, 1, 0, 0.8823529, 1,
1.057402, 1.204546, 1.106948, 1, 0, 0.8745098, 1,
1.061669, 0.7538252, 0.4917362, 1, 0, 0.8705882, 1,
1.066091, -0.1990047, 1.151079, 1, 0, 0.8627451, 1,
1.067709, 0.7105691, 2.669243, 1, 0, 0.8588235, 1,
1.074179, -1.667595, 4.27538, 1, 0, 0.8509804, 1,
1.078351, -0.8495417, 4.351956, 1, 0, 0.8470588, 1,
1.079998, -0.9719843, 2.366607, 1, 0, 0.8392157, 1,
1.091151, -0.1722254, 3.038002, 1, 0, 0.8352941, 1,
1.091188, 0.3864305, 1.850355, 1, 0, 0.827451, 1,
1.092929, 1.012182, 0.3490677, 1, 0, 0.8235294, 1,
1.093146, 0.2357579, 2.267796, 1, 0, 0.8156863, 1,
1.101345, -0.07414836, 1.519052, 1, 0, 0.8117647, 1,
1.106371, -0.02644131, 0.7350314, 1, 0, 0.8039216, 1,
1.110712, 0.2645521, 0.1798509, 1, 0, 0.7960784, 1,
1.112892, -0.08316965, 1.750805, 1, 0, 0.7921569, 1,
1.116837, -1.00611, 3.441117, 1, 0, 0.7843137, 1,
1.11968, 0.4520535, -0.004593439, 1, 0, 0.7803922, 1,
1.132683, -1.176631, 3.66691, 1, 0, 0.772549, 1,
1.133859, -0.001445079, 2.355275, 1, 0, 0.7686275, 1,
1.144897, -0.6922228, 0.06484762, 1, 0, 0.7607843, 1,
1.1516, 1.367379, 1.432727, 1, 0, 0.7568628, 1,
1.15201, 0.8943514, 0.8085255, 1, 0, 0.7490196, 1,
1.158719, 0.1161173, 0.4385329, 1, 0, 0.7450981, 1,
1.161318, -1.10209, 2.337916, 1, 0, 0.7372549, 1,
1.187915, 0.3130775, 0.4053127, 1, 0, 0.7333333, 1,
1.189443, 0.5189503, 2.210957, 1, 0, 0.7254902, 1,
1.189658, 0.2971742, 2.00685, 1, 0, 0.7215686, 1,
1.193476, -0.376506, 1.511234, 1, 0, 0.7137255, 1,
1.205002, -0.6993003, 2.688114, 1, 0, 0.7098039, 1,
1.209962, -0.1838343, 0.3138145, 1, 0, 0.7019608, 1,
1.219791, -1.343118, 3.828526, 1, 0, 0.6941177, 1,
1.225061, 1.011488, 0.8155572, 1, 0, 0.6901961, 1,
1.246857, -0.8868587, 1.384066, 1, 0, 0.682353, 1,
1.252952, -0.5099826, 1.353941, 1, 0, 0.6784314, 1,
1.273705, -0.8523965, 2.230402, 1, 0, 0.6705883, 1,
1.274677, -1.436476, 1.111429, 1, 0, 0.6666667, 1,
1.282179, -0.7842869, 2.698504, 1, 0, 0.6588235, 1,
1.282429, -0.9634388, 2.293419, 1, 0, 0.654902, 1,
1.290918, -0.637892, 2.744298, 1, 0, 0.6470588, 1,
1.297018, 1.650106, 0.01427234, 1, 0, 0.6431373, 1,
1.301167, -1.092152, 2.678219, 1, 0, 0.6352941, 1,
1.309806, 0.03843517, 2.412706, 1, 0, 0.6313726, 1,
1.315587, -0.274124, 3.241179, 1, 0, 0.6235294, 1,
1.319413, -0.6780407, 1.9439, 1, 0, 0.6196079, 1,
1.330795, 0.9516374, 0.237704, 1, 0, 0.6117647, 1,
1.335041, -0.6881835, 1.031733, 1, 0, 0.6078432, 1,
1.339709, -0.03183972, 0.8568991, 1, 0, 0.6, 1,
1.339934, 0.7435183, 0.6173701, 1, 0, 0.5921569, 1,
1.34327, -0.6234036, 1.384608, 1, 0, 0.5882353, 1,
1.347489, -0.7089697, 1.34559, 1, 0, 0.5803922, 1,
1.351132, -1.91018, 1.73148, 1, 0, 0.5764706, 1,
1.354301, -0.6786082, 1.602632, 1, 0, 0.5686275, 1,
1.356631, 0.2720563, 1.201505, 1, 0, 0.5647059, 1,
1.356937, 0.4671806, 1.036084, 1, 0, 0.5568628, 1,
1.36131, -1.014396, 4.034317, 1, 0, 0.5529412, 1,
1.380669, 1.73826, 0.7559324, 1, 0, 0.5450981, 1,
1.38303, 0.572421, 0.5398801, 1, 0, 0.5411765, 1,
1.39098, -1.165806, 3.452816, 1, 0, 0.5333334, 1,
1.396901, 0.8057458, 1.907049, 1, 0, 0.5294118, 1,
1.405255, 1.080063, 1.971066, 1, 0, 0.5215687, 1,
1.417515, 1.137707, 0.01804613, 1, 0, 0.5176471, 1,
1.418293, -0.1532634, 2.635218, 1, 0, 0.509804, 1,
1.419511, 0.2512087, 0.222253, 1, 0, 0.5058824, 1,
1.423749, 0.8707277, 2.385266, 1, 0, 0.4980392, 1,
1.428758, -0.00862183, 0.2345187, 1, 0, 0.4901961, 1,
1.42978, 0.3712491, 0.5930091, 1, 0, 0.4862745, 1,
1.445896, 0.8671232, 2.76959, 1, 0, 0.4784314, 1,
1.453346, -2.177883, 3.955817, 1, 0, 0.4745098, 1,
1.463595, 0.5213668, 1.039404, 1, 0, 0.4666667, 1,
1.466721, -2.601104, 1.597435, 1, 0, 0.4627451, 1,
1.480323, 1.348169, 2.490508, 1, 0, 0.454902, 1,
1.487674, 0.1519193, 3.308422, 1, 0, 0.4509804, 1,
1.491018, -0.5521474, 3.594836, 1, 0, 0.4431373, 1,
1.508696, 0.6483424, 1.187681, 1, 0, 0.4392157, 1,
1.508796, -1.204445, 0.8516159, 1, 0, 0.4313726, 1,
1.513448, -0.3754576, 0.5821555, 1, 0, 0.427451, 1,
1.51392, -1.354925, 1.901219, 1, 0, 0.4196078, 1,
1.514555, 0.3982046, 2.394306, 1, 0, 0.4156863, 1,
1.515628, 1.75646, 1.461833, 1, 0, 0.4078431, 1,
1.52059, 0.7820439, 1.10222, 1, 0, 0.4039216, 1,
1.524236, 0.9672477, 0.3410925, 1, 0, 0.3960784, 1,
1.532151, 0.9874576, 0.5778188, 1, 0, 0.3882353, 1,
1.539165, 0.02420018, 1.074336, 1, 0, 0.3843137, 1,
1.540313, -1.042898, 1.044147, 1, 0, 0.3764706, 1,
1.546493, -1.250646, 1.54675, 1, 0, 0.372549, 1,
1.553187, -1.64677, 1.403892, 1, 0, 0.3647059, 1,
1.576301, -0.601924, 0.8613048, 1, 0, 0.3607843, 1,
1.587053, 2.345813, 0.08354659, 1, 0, 0.3529412, 1,
1.598526, -1.545187, 3.480979, 1, 0, 0.3490196, 1,
1.60015, 1.335646, 0.4687003, 1, 0, 0.3411765, 1,
1.623006, -0.01518742, 1.211625, 1, 0, 0.3372549, 1,
1.626979, 0.1742796, 3.936476, 1, 0, 0.3294118, 1,
1.628551, 1.005797, 0.7563387, 1, 0, 0.3254902, 1,
1.636704, -0.7159219, 1.345591, 1, 0, 0.3176471, 1,
1.663067, -0.5860962, 2.553234, 1, 0, 0.3137255, 1,
1.672905, -0.1970611, 3.108875, 1, 0, 0.3058824, 1,
1.684953, 0.2215795, 1.137341, 1, 0, 0.2980392, 1,
1.707073, 0.6671195, 2.411172, 1, 0, 0.2941177, 1,
1.71633, 0.424219, 3.049947, 1, 0, 0.2862745, 1,
1.733138, 0.1400374, 1.898563, 1, 0, 0.282353, 1,
1.736406, -0.3250737, 2.901194, 1, 0, 0.2745098, 1,
1.746235, -1.150476, 1.206527, 1, 0, 0.2705882, 1,
1.750302, -0.3932905, 2.652473, 1, 0, 0.2627451, 1,
1.771838, 1.302152, -0.294829, 1, 0, 0.2588235, 1,
1.776937, -0.5966354, 0.7159175, 1, 0, 0.2509804, 1,
1.777506, 0.1749501, 2.285878, 1, 0, 0.2470588, 1,
1.795904, 1.180254, 2.864844, 1, 0, 0.2392157, 1,
1.800404, 0.9283767, 0.714367, 1, 0, 0.2352941, 1,
1.815693, 0.3507232, 1.849604, 1, 0, 0.227451, 1,
1.842994, 0.4604233, 0.8529448, 1, 0, 0.2235294, 1,
1.864461, -0.9496553, 1.4824, 1, 0, 0.2156863, 1,
1.879787, 1.598528, 1.307138, 1, 0, 0.2117647, 1,
1.93542, 0.8672582, 1.816595, 1, 0, 0.2039216, 1,
1.937412, -0.5952384, 1.444572, 1, 0, 0.1960784, 1,
1.949672, 0.1726235, 0.4467059, 1, 0, 0.1921569, 1,
1.969842, -0.04856811, 2.306113, 1, 0, 0.1843137, 1,
1.977262, 0.03356546, 2.048914, 1, 0, 0.1803922, 1,
1.983312, -0.1137821, 2.140629, 1, 0, 0.172549, 1,
2.036268, -0.6457497, 4.324154, 1, 0, 0.1686275, 1,
2.045078, -0.1175056, 1.697167, 1, 0, 0.1607843, 1,
2.046416, 0.93014, 0.3268732, 1, 0, 0.1568628, 1,
2.056403, 0.5728854, 1.229271, 1, 0, 0.1490196, 1,
2.062328, 0.7989869, 2.051883, 1, 0, 0.145098, 1,
2.06563, -1.246397, 1.089162, 1, 0, 0.1372549, 1,
2.070802, -0.9331, 2.823966, 1, 0, 0.1333333, 1,
2.087361, -0.6515099, 2.410769, 1, 0, 0.1254902, 1,
2.088314, -0.5668941, 1.187705, 1, 0, 0.1215686, 1,
2.10701, -0.2381362, 0.09903515, 1, 0, 0.1137255, 1,
2.135095, -1.139734, 2.633228, 1, 0, 0.1098039, 1,
2.162567, -1.394147, 1.673267, 1, 0, 0.1019608, 1,
2.247263, 1.393952, 0.2097184, 1, 0, 0.09411765, 1,
2.260593, 1.6649, -0.7126342, 1, 0, 0.09019608, 1,
2.266835, -0.9473742, 2.142029, 1, 0, 0.08235294, 1,
2.296715, -1.109006, 1.81373, 1, 0, 0.07843138, 1,
2.37206, -0.3347816, 0.7932906, 1, 0, 0.07058824, 1,
2.416727, 0.6451481, 1.645374, 1, 0, 0.06666667, 1,
2.419776, -0.4009436, 1.769366, 1, 0, 0.05882353, 1,
2.433128, -2.013618, 3.575754, 1, 0, 0.05490196, 1,
2.46334, -0.4473735, 0.0965631, 1, 0, 0.04705882, 1,
2.629833, 0.3719676, 2.003235, 1, 0, 0.04313726, 1,
2.664427, -1.083477, 2.008043, 1, 0, 0.03529412, 1,
2.811405, -0.4620174, 1.834356, 1, 0, 0.03137255, 1,
3.012602, 0.2253961, 0.8032982, 1, 0, 0.02352941, 1,
3.03289, -0.2898107, 1.291893, 1, 0, 0.01960784, 1,
3.079175, -1.094061, 2.062456, 1, 0, 0.01176471, 1,
3.398034, 0.5647444, 2.896875, 1, 0, 0.007843138, 1
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
0.246079, -4.326281, -7.383816, 0, -0.5, 0.5, 0.5,
0.246079, -4.326281, -7.383816, 1, -0.5, 0.5, 0.5,
0.246079, -4.326281, -7.383816, 1, 1.5, 0.5, 0.5,
0.246079, -4.326281, -7.383816, 0, 1.5, 0.5, 0.5
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
-3.974389, 0.1288306, -7.383816, 0, -0.5, 0.5, 0.5,
-3.974389, 0.1288306, -7.383816, 1, -0.5, 0.5, 0.5,
-3.974389, 0.1288306, -7.383816, 1, 1.5, 0.5, 0.5,
-3.974389, 0.1288306, -7.383816, 0, 1.5, 0.5, 0.5
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
-3.974389, -4.326281, 0.2097797, 0, -0.5, 0.5, 0.5,
-3.974389, -4.326281, 0.2097797, 1, -0.5, 0.5, 0.5,
-3.974389, -4.326281, 0.2097797, 1, 1.5, 0.5, 0.5,
-3.974389, -4.326281, 0.2097797, 0, 1.5, 0.5, 0.5
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
-2, -3.298178, -5.631448,
3, -3.298178, -5.631448,
-2, -3.298178, -5.631448,
-2, -3.469529, -5.92351,
-1, -3.298178, -5.631448,
-1, -3.469529, -5.92351,
0, -3.298178, -5.631448,
0, -3.469529, -5.92351,
1, -3.298178, -5.631448,
1, -3.469529, -5.92351,
2, -3.298178, -5.631448,
2, -3.469529, -5.92351,
3, -3.298178, -5.631448,
3, -3.469529, -5.92351
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
-2, -3.812229, -6.507632, 0, -0.5, 0.5, 0.5,
-2, -3.812229, -6.507632, 1, -0.5, 0.5, 0.5,
-2, -3.812229, -6.507632, 1, 1.5, 0.5, 0.5,
-2, -3.812229, -6.507632, 0, 1.5, 0.5, 0.5,
-1, -3.812229, -6.507632, 0, -0.5, 0.5, 0.5,
-1, -3.812229, -6.507632, 1, -0.5, 0.5, 0.5,
-1, -3.812229, -6.507632, 1, 1.5, 0.5, 0.5,
-1, -3.812229, -6.507632, 0, 1.5, 0.5, 0.5,
0, -3.812229, -6.507632, 0, -0.5, 0.5, 0.5,
0, -3.812229, -6.507632, 1, -0.5, 0.5, 0.5,
0, -3.812229, -6.507632, 1, 1.5, 0.5, 0.5,
0, -3.812229, -6.507632, 0, 1.5, 0.5, 0.5,
1, -3.812229, -6.507632, 0, -0.5, 0.5, 0.5,
1, -3.812229, -6.507632, 1, -0.5, 0.5, 0.5,
1, -3.812229, -6.507632, 1, 1.5, 0.5, 0.5,
1, -3.812229, -6.507632, 0, 1.5, 0.5, 0.5,
2, -3.812229, -6.507632, 0, -0.5, 0.5, 0.5,
2, -3.812229, -6.507632, 1, -0.5, 0.5, 0.5,
2, -3.812229, -6.507632, 1, 1.5, 0.5, 0.5,
2, -3.812229, -6.507632, 0, 1.5, 0.5, 0.5,
3, -3.812229, -6.507632, 0, -0.5, 0.5, 0.5,
3, -3.812229, -6.507632, 1, -0.5, 0.5, 0.5,
3, -3.812229, -6.507632, 1, 1.5, 0.5, 0.5,
3, -3.812229, -6.507632, 0, 1.5, 0.5, 0.5
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
-3.000435, -3, -5.631448,
-3.000435, 3, -5.631448,
-3.000435, -3, -5.631448,
-3.16276, -3, -5.92351,
-3.000435, -2, -5.631448,
-3.16276, -2, -5.92351,
-3.000435, -1, -5.631448,
-3.16276, -1, -5.92351,
-3.000435, 0, -5.631448,
-3.16276, 0, -5.92351,
-3.000435, 1, -5.631448,
-3.16276, 1, -5.92351,
-3.000435, 2, -5.631448,
-3.16276, 2, -5.92351,
-3.000435, 3, -5.631448,
-3.16276, 3, -5.92351
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
-3.487412, -3, -6.507632, 0, -0.5, 0.5, 0.5,
-3.487412, -3, -6.507632, 1, -0.5, 0.5, 0.5,
-3.487412, -3, -6.507632, 1, 1.5, 0.5, 0.5,
-3.487412, -3, -6.507632, 0, 1.5, 0.5, 0.5,
-3.487412, -2, -6.507632, 0, -0.5, 0.5, 0.5,
-3.487412, -2, -6.507632, 1, -0.5, 0.5, 0.5,
-3.487412, -2, -6.507632, 1, 1.5, 0.5, 0.5,
-3.487412, -2, -6.507632, 0, 1.5, 0.5, 0.5,
-3.487412, -1, -6.507632, 0, -0.5, 0.5, 0.5,
-3.487412, -1, -6.507632, 1, -0.5, 0.5, 0.5,
-3.487412, -1, -6.507632, 1, 1.5, 0.5, 0.5,
-3.487412, -1, -6.507632, 0, 1.5, 0.5, 0.5,
-3.487412, 0, -6.507632, 0, -0.5, 0.5, 0.5,
-3.487412, 0, -6.507632, 1, -0.5, 0.5, 0.5,
-3.487412, 0, -6.507632, 1, 1.5, 0.5, 0.5,
-3.487412, 0, -6.507632, 0, 1.5, 0.5, 0.5,
-3.487412, 1, -6.507632, 0, -0.5, 0.5, 0.5,
-3.487412, 1, -6.507632, 1, -0.5, 0.5, 0.5,
-3.487412, 1, -6.507632, 1, 1.5, 0.5, 0.5,
-3.487412, 1, -6.507632, 0, 1.5, 0.5, 0.5,
-3.487412, 2, -6.507632, 0, -0.5, 0.5, 0.5,
-3.487412, 2, -6.507632, 1, -0.5, 0.5, 0.5,
-3.487412, 2, -6.507632, 1, 1.5, 0.5, 0.5,
-3.487412, 2, -6.507632, 0, 1.5, 0.5, 0.5,
-3.487412, 3, -6.507632, 0, -0.5, 0.5, 0.5,
-3.487412, 3, -6.507632, 1, -0.5, 0.5, 0.5,
-3.487412, 3, -6.507632, 1, 1.5, 0.5, 0.5,
-3.487412, 3, -6.507632, 0, 1.5, 0.5, 0.5
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
-3.000435, -3.298178, -4,
-3.000435, -3.298178, 4,
-3.000435, -3.298178, -4,
-3.16276, -3.469529, -4,
-3.000435, -3.298178, -2,
-3.16276, -3.469529, -2,
-3.000435, -3.298178, 0,
-3.16276, -3.469529, 0,
-3.000435, -3.298178, 2,
-3.16276, -3.469529, 2,
-3.000435, -3.298178, 4,
-3.16276, -3.469529, 4
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
-3.487412, -3.812229, -4, 0, -0.5, 0.5, 0.5,
-3.487412, -3.812229, -4, 1, -0.5, 0.5, 0.5,
-3.487412, -3.812229, -4, 1, 1.5, 0.5, 0.5,
-3.487412, -3.812229, -4, 0, 1.5, 0.5, 0.5,
-3.487412, -3.812229, -2, 0, -0.5, 0.5, 0.5,
-3.487412, -3.812229, -2, 1, -0.5, 0.5, 0.5,
-3.487412, -3.812229, -2, 1, 1.5, 0.5, 0.5,
-3.487412, -3.812229, -2, 0, 1.5, 0.5, 0.5,
-3.487412, -3.812229, 0, 0, -0.5, 0.5, 0.5,
-3.487412, -3.812229, 0, 1, -0.5, 0.5, 0.5,
-3.487412, -3.812229, 0, 1, 1.5, 0.5, 0.5,
-3.487412, -3.812229, 0, 0, 1.5, 0.5, 0.5,
-3.487412, -3.812229, 2, 0, -0.5, 0.5, 0.5,
-3.487412, -3.812229, 2, 1, -0.5, 0.5, 0.5,
-3.487412, -3.812229, 2, 1, 1.5, 0.5, 0.5,
-3.487412, -3.812229, 2, 0, 1.5, 0.5, 0.5,
-3.487412, -3.812229, 4, 0, -0.5, 0.5, 0.5,
-3.487412, -3.812229, 4, 1, -0.5, 0.5, 0.5,
-3.487412, -3.812229, 4, 1, 1.5, 0.5, 0.5,
-3.487412, -3.812229, 4, 0, 1.5, 0.5, 0.5
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
-3.000435, -3.298178, -5.631448,
-3.000435, 3.555839, -5.631448,
-3.000435, -3.298178, 6.051007,
-3.000435, 3.555839, 6.051007,
-3.000435, -3.298178, -5.631448,
-3.000435, -3.298178, 6.051007,
-3.000435, 3.555839, -5.631448,
-3.000435, 3.555839, 6.051007,
-3.000435, -3.298178, -5.631448,
3.492593, -3.298178, -5.631448,
-3.000435, -3.298178, 6.051007,
3.492593, -3.298178, 6.051007,
-3.000435, 3.555839, -5.631448,
3.492593, 3.555839, -5.631448,
-3.000435, 3.555839, 6.051007,
3.492593, 3.555839, 6.051007,
3.492593, -3.298178, -5.631448,
3.492593, 3.555839, -5.631448,
3.492593, -3.298178, 6.051007,
3.492593, 3.555839, 6.051007,
3.492593, -3.298178, -5.631448,
3.492593, -3.298178, 6.051007,
3.492593, 3.555839, -5.631448,
3.492593, 3.555839, 6.051007
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
var radius = 8.020679;
var distance = 35.6849;
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
mvMatrix.translate( -0.246079, -0.1288306, -0.2097797 );
mvMatrix.scale( 1.335604, 1.26526, 0.7423195 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.6849);
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
azafenidin<-read.table("azafenidin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-azafenidin$V2
```

```
## Error in eval(expr, envir, enclos): object 'azafenidin' not found
```

```r
y<-azafenidin$V3
```

```
## Error in eval(expr, envir, enclos): object 'azafenidin' not found
```

```r
z<-azafenidin$V4
```

```
## Error in eval(expr, envir, enclos): object 'azafenidin' not found
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
-2.905876, 0.8293102, -0.5386778, 0, 0, 1, 1, 1,
-2.898456, -1.530441, -2.632359, 1, 0, 0, 1, 1,
-2.739311, 0.6614593, -1.397724, 1, 0, 0, 1, 1,
-2.531449, 1.816883, -1.712495, 1, 0, 0, 1, 1,
-2.482981, 1.209175, -0.03256971, 1, 0, 0, 1, 1,
-2.446306, -1.087692, -2.64707, 1, 0, 0, 1, 1,
-2.406293, -0.2514849, -0.4815654, 0, 0, 0, 1, 1,
-2.369984, 0.8149506, 0.04909939, 0, 0, 0, 1, 1,
-2.356142, -0.4384235, -0.5535495, 0, 0, 0, 1, 1,
-2.317661, 1.124651, -0.4053486, 0, 0, 0, 1, 1,
-2.315431, 0.906294, -0.291273, 0, 0, 0, 1, 1,
-2.294066, -0.5747088, -0.6989273, 0, 0, 0, 1, 1,
-2.249934, 1.398521, -1.329928, 0, 0, 0, 1, 1,
-2.248755, 0.7627637, -1.277077, 1, 1, 1, 1, 1,
-2.241086, -0.06253886, -2.326557, 1, 1, 1, 1, 1,
-2.113436, -0.9906465, -3.379115, 1, 1, 1, 1, 1,
-2.098233, 0.03015473, -2.016318, 1, 1, 1, 1, 1,
-2.083896, -1.644922, -1.858792, 1, 1, 1, 1, 1,
-2.078182, -0.9145955, -2.60884, 1, 1, 1, 1, 1,
-1.982933, -0.5820396, -1.873929, 1, 1, 1, 1, 1,
-1.955935, -0.4051785, -1.290975, 1, 1, 1, 1, 1,
-1.941271, -0.0291495, -0.5540132, 1, 1, 1, 1, 1,
-1.875623, -0.8646154, -1.877314, 1, 1, 1, 1, 1,
-1.874035, -1.064099, -1.671545, 1, 1, 1, 1, 1,
-1.834864, 1.647518, -0.4750068, 1, 1, 1, 1, 1,
-1.818442, 0.6131611, -1.394488, 1, 1, 1, 1, 1,
-1.817296, -1.139577, -1.088839, 1, 1, 1, 1, 1,
-1.792668, -0.3499603, -2.919765, 1, 1, 1, 1, 1,
-1.791561, -0.31026, -2.255133, 0, 0, 1, 1, 1,
-1.783533, 1.201421, 0.7462425, 1, 0, 0, 1, 1,
-1.772419, 0.9780148, 1.109435, 1, 0, 0, 1, 1,
-1.768602, 1.339382, -1.139182, 1, 0, 0, 1, 1,
-1.767985, 0.1445977, -1.660786, 1, 0, 0, 1, 1,
-1.765818, 1.191909, -1.332793, 1, 0, 0, 1, 1,
-1.760899, -1.471725, -3.083444, 0, 0, 0, 1, 1,
-1.759574, 0.9828329, -1.498903, 0, 0, 0, 1, 1,
-1.759344, -0.5819263, -2.108143, 0, 0, 0, 1, 1,
-1.751086, 0.6930422, -2.741942, 0, 0, 0, 1, 1,
-1.750135, -0.06292103, -1.848052, 0, 0, 0, 1, 1,
-1.747114, 1.350356, 0.3205924, 0, 0, 0, 1, 1,
-1.740824, -0.5754867, -2.355679, 0, 0, 0, 1, 1,
-1.736897, 0.8527813, -0.3225053, 1, 1, 1, 1, 1,
-1.736111, 0.4562621, -0.1898073, 1, 1, 1, 1, 1,
-1.733603, 0.5810193, -1.140923, 1, 1, 1, 1, 1,
-1.727019, 1.058196, -2.148957, 1, 1, 1, 1, 1,
-1.72068, 1.616187, -1.993615, 1, 1, 1, 1, 1,
-1.707831, 0.4313309, -3.018262, 1, 1, 1, 1, 1,
-1.694643, -0.7307738, -2.984074, 1, 1, 1, 1, 1,
-1.680612, -0.3943458, -3.176413, 1, 1, 1, 1, 1,
-1.659875, -2.684646, -3.547385, 1, 1, 1, 1, 1,
-1.645497, -1.692777, -1.790534, 1, 1, 1, 1, 1,
-1.644603, 1.565734, -0.5337425, 1, 1, 1, 1, 1,
-1.642458, -0.7408921, -2.14569, 1, 1, 1, 1, 1,
-1.638617, -0.426887, -2.980594, 1, 1, 1, 1, 1,
-1.630678, 0.03826816, 0.179296, 1, 1, 1, 1, 1,
-1.626479, 0.7282328, -1.240279, 1, 1, 1, 1, 1,
-1.624939, -2.526545, -4.03826, 0, 0, 1, 1, 1,
-1.610662, 1.675312, 0.9193472, 1, 0, 0, 1, 1,
-1.604451, 0.2476614, -0.9908429, 1, 0, 0, 1, 1,
-1.579802, -0.7898194, -1.751824, 1, 0, 0, 1, 1,
-1.571997, -0.9288273, -2.801685, 1, 0, 0, 1, 1,
-1.570877, -0.4164115, -0.7211841, 1, 0, 0, 1, 1,
-1.548935, 1.005895, -0.8575167, 0, 0, 0, 1, 1,
-1.543585, 0.7566683, -0.2894582, 0, 0, 0, 1, 1,
-1.54145, 0.7730264, 0.4495148, 0, 0, 0, 1, 1,
-1.539358, -1.898561, -2.559288, 0, 0, 0, 1, 1,
-1.53728, 0.02045985, -2.492329, 0, 0, 0, 1, 1,
-1.523627, -1.049684, -4.715704, 0, 0, 0, 1, 1,
-1.522132, 0.9287825, -0.9329484, 0, 0, 0, 1, 1,
-1.517161, 1.164618, -0.6289759, 1, 1, 1, 1, 1,
-1.501732, -0.4858835, -3.275744, 1, 1, 1, 1, 1,
-1.49853, -0.5320684, -4.241223, 1, 1, 1, 1, 1,
-1.497638, -1.407519, -1.681697, 1, 1, 1, 1, 1,
-1.490841, -1.532896, -3.434665, 1, 1, 1, 1, 1,
-1.488412, 1.117302, -0.9221293, 1, 1, 1, 1, 1,
-1.488051, -0.09945952, -1.51018, 1, 1, 1, 1, 1,
-1.476574, 0.02377825, 0.2313225, 1, 1, 1, 1, 1,
-1.468108, -1.071887, -2.682628, 1, 1, 1, 1, 1,
-1.431895, -0.4703665, -2.21267, 1, 1, 1, 1, 1,
-1.427723, -1.391083, -1.840836, 1, 1, 1, 1, 1,
-1.414463, 0.1819522, -1.328838, 1, 1, 1, 1, 1,
-1.405546, -0.2517238, -3.662272, 1, 1, 1, 1, 1,
-1.402323, -0.3487349, -3.032752, 1, 1, 1, 1, 1,
-1.397956, 1.177783, -1.652936, 1, 1, 1, 1, 1,
-1.39133, 1.685938, -1.701776, 0, 0, 1, 1, 1,
-1.390902, -0.1750159, -0.5309897, 1, 0, 0, 1, 1,
-1.382663, -0.2755189, -1.887903, 1, 0, 0, 1, 1,
-1.367923, 0.8571904, -1.30229, 1, 0, 0, 1, 1,
-1.364238, 0.2773253, -0.4252683, 1, 0, 0, 1, 1,
-1.360381, 1.086449, -1.829499, 1, 0, 0, 1, 1,
-1.355755, -0.06286989, -1.426422, 0, 0, 0, 1, 1,
-1.354434, -0.1282888, -0.9234242, 0, 0, 0, 1, 1,
-1.352904, 0.1479301, -1.505129, 0, 0, 0, 1, 1,
-1.352779, -1.089424, -3.221975, 0, 0, 0, 1, 1,
-1.349365, -1.054805, -2.158405, 0, 0, 0, 1, 1,
-1.341937, 0.9441106, -1.576127, 0, 0, 0, 1, 1,
-1.339683, -0.1823551, -0.51025, 0, 0, 0, 1, 1,
-1.32994, -0.359535, -3.415913, 1, 1, 1, 1, 1,
-1.329036, 1.220552, -1.284937, 1, 1, 1, 1, 1,
-1.309642, 0.6554406, -0.3005257, 1, 1, 1, 1, 1,
-1.302763, -1.624741, -2.836488, 1, 1, 1, 1, 1,
-1.300385, 0.9511542, -2.468568, 1, 1, 1, 1, 1,
-1.299156, -0.1843696, -1.600482, 1, 1, 1, 1, 1,
-1.294793, -2.232405, -2.9005, 1, 1, 1, 1, 1,
-1.284814, -0.0005792452, -2.081784, 1, 1, 1, 1, 1,
-1.282644, -1.14664, -1.373738, 1, 1, 1, 1, 1,
-1.272572, -0.5057321, -2.142836, 1, 1, 1, 1, 1,
-1.269332, 1.493825, -0.8685911, 1, 1, 1, 1, 1,
-1.261438, -0.4178286, -2.419593, 1, 1, 1, 1, 1,
-1.26026, -0.4996892, -1.645963, 1, 1, 1, 1, 1,
-1.254589, 0.00555911, -0.1460198, 1, 1, 1, 1, 1,
-1.251746, -0.6623228, -2.63635, 1, 1, 1, 1, 1,
-1.249772, -0.5761889, -1.857674, 0, 0, 1, 1, 1,
-1.243154, -0.4943971, -2.206949, 1, 0, 0, 1, 1,
-1.234335, 0.1956769, -1.775282, 1, 0, 0, 1, 1,
-1.223998, -0.5018989, -2.214829, 1, 0, 0, 1, 1,
-1.221199, 0.06525259, 0.4935387, 1, 0, 0, 1, 1,
-1.21674, -1.042583, -1.972472, 1, 0, 0, 1, 1,
-1.214179, -0.0977198, 0.235075, 0, 0, 0, 1, 1,
-1.20838, 0.1962841, -3.04352, 0, 0, 0, 1, 1,
-1.186902, 2.02981, -1.165911, 0, 0, 0, 1, 1,
-1.184414, 0.3458272, -1.848679, 0, 0, 0, 1, 1,
-1.166777, 0.5537198, -1.371476, 0, 0, 0, 1, 1,
-1.164823, 1.09757, -1.870907, 0, 0, 0, 1, 1,
-1.163263, 1.33106, 0.6731492, 0, 0, 0, 1, 1,
-1.162867, 1.874758, -0.5470908, 1, 1, 1, 1, 1,
-1.155378, 0.6397582, -1.388558, 1, 1, 1, 1, 1,
-1.153951, -0.794844, -1.702343, 1, 1, 1, 1, 1,
-1.149826, 1.647746, 0.03398198, 1, 1, 1, 1, 1,
-1.149488, 0.1261358, -0.8467455, 1, 1, 1, 1, 1,
-1.146734, 1.361675, 0.1772141, 1, 1, 1, 1, 1,
-1.141956, -0.2333493, -4.295897, 1, 1, 1, 1, 1,
-1.132661, -0.3824446, -1.327182, 1, 1, 1, 1, 1,
-1.119019, -1.782928, -3.305093, 1, 1, 1, 1, 1,
-1.118112, -1.898334, -3.964732, 1, 1, 1, 1, 1,
-1.115338, -0.3314939, -3.998505, 1, 1, 1, 1, 1,
-1.114815, 0.1292014, -1.96858, 1, 1, 1, 1, 1,
-1.112934, -1.589749, -2.269498, 1, 1, 1, 1, 1,
-1.107963, 0.7115638, 0.6550889, 1, 1, 1, 1, 1,
-1.101591, 0.4330187, 0.5022886, 1, 1, 1, 1, 1,
-1.097543, 0.772306, -0.3979388, 0, 0, 1, 1, 1,
-1.095924, 0.3736502, -0.7463198, 1, 0, 0, 1, 1,
-1.088108, -1.626253, -3.286144, 1, 0, 0, 1, 1,
-1.08161, -0.280079, -3.35507, 1, 0, 0, 1, 1,
-1.077555, -0.799837, -2.639349, 1, 0, 0, 1, 1,
-1.072265, 1.577671, -3.229265, 1, 0, 0, 1, 1,
-1.071917, 0.7907639, -2.552996, 0, 0, 0, 1, 1,
-1.071596, -1.139944, -1.469122, 0, 0, 0, 1, 1,
-1.071223, -0.1630053, -2.945293, 0, 0, 0, 1, 1,
-1.065177, -1.429887, -1.183065, 0, 0, 0, 1, 1,
-1.062045, 0.8798826, -1.035053, 0, 0, 0, 1, 1,
-1.059701, 0.08696203, 0.05772432, 0, 0, 0, 1, 1,
-1.056553, -0.1631919, -1.097174, 0, 0, 0, 1, 1,
-1.056051, 2.126882, 0.6585936, 1, 1, 1, 1, 1,
-1.046717, -1.348587, -3.127058, 1, 1, 1, 1, 1,
-1.042637, -0.1706486, -2.612598, 1, 1, 1, 1, 1,
-1.02981, -0.06232372, -2.007836, 1, 1, 1, 1, 1,
-1.018613, 1.446644, -0.9092383, 1, 1, 1, 1, 1,
-1.018281, 0.3541842, -2.490882, 1, 1, 1, 1, 1,
-1.017342, -0.4322385, -2.608566, 1, 1, 1, 1, 1,
-1.009541, 0.6055877, -2.697283, 1, 1, 1, 1, 1,
-1.00768, 1.746545, -0.3549524, 1, 1, 1, 1, 1,
-1.006421, 0.1962144, -2.07428, 1, 1, 1, 1, 1,
-1.003522, -0.8594838, -1.030855, 1, 1, 1, 1, 1,
-1.00176, 1.234691, -0.8259138, 1, 1, 1, 1, 1,
-0.9995655, 1.144058, -1.047232, 1, 1, 1, 1, 1,
-0.9972494, 0.5329577, -1.508023, 1, 1, 1, 1, 1,
-0.9928375, 0.6895905, -0.6864251, 1, 1, 1, 1, 1,
-0.9872568, -1.820139, -2.245549, 0, 0, 1, 1, 1,
-0.98421, -1.071529, -3.039636, 1, 0, 0, 1, 1,
-0.9832978, -0.3589752, -3.152218, 1, 0, 0, 1, 1,
-0.9798626, -2.318686, -3.319559, 1, 0, 0, 1, 1,
-0.9794797, -2.036365, -3.536258, 1, 0, 0, 1, 1,
-0.9794635, -0.5386573, -2.819925, 1, 0, 0, 1, 1,
-0.9756778, -0.4358847, -3.288413, 0, 0, 0, 1, 1,
-0.9686208, -1.073758, -2.506773, 0, 0, 0, 1, 1,
-0.9665048, 0.8547183, -0.8699279, 0, 0, 0, 1, 1,
-0.965276, 0.4314339, -0.4427839, 0, 0, 0, 1, 1,
-0.9554105, 0.09938657, -0.09639112, 0, 0, 0, 1, 1,
-0.9539924, 0.05917532, -1.581411, 0, 0, 0, 1, 1,
-0.9455558, 0.8996938, 1.128162, 0, 0, 0, 1, 1,
-0.9402493, -0.174652, -1.830964, 1, 1, 1, 1, 1,
-0.9373964, 0.138644, -2.045474, 1, 1, 1, 1, 1,
-0.9306987, 0.1993161, -0.6264392, 1, 1, 1, 1, 1,
-0.9138201, -0.2253828, -1.408819, 1, 1, 1, 1, 1,
-0.9119033, 1.916596, -1.455548, 1, 1, 1, 1, 1,
-0.9087224, -1.37033, -2.060804, 1, 1, 1, 1, 1,
-0.9036417, 0.1569037, -0.4751354, 1, 1, 1, 1, 1,
-0.8939331, 0.8231326, 0.2627608, 1, 1, 1, 1, 1,
-0.8897518, 0.1412673, -2.33652, 1, 1, 1, 1, 1,
-0.8877764, 2.585581, -0.07065225, 1, 1, 1, 1, 1,
-0.887273, -0.122415, -3.710398, 1, 1, 1, 1, 1,
-0.8859943, -0.62607, -2.907845, 1, 1, 1, 1, 1,
-0.8836931, 1.432088, 0.3795792, 1, 1, 1, 1, 1,
-0.8834946, -2.075975, -2.782839, 1, 1, 1, 1, 1,
-0.869364, -0.2290283, -4.447371, 1, 1, 1, 1, 1,
-0.8680235, 1.3375, -2.436267, 0, 0, 1, 1, 1,
-0.8625957, 0.5202612, 0.02373619, 1, 0, 0, 1, 1,
-0.8621708, -2.106108, -2.432462, 1, 0, 0, 1, 1,
-0.8584313, 0.2781681, -3.851875, 1, 0, 0, 1, 1,
-0.839798, 0.2733788, -0.8311341, 1, 0, 0, 1, 1,
-0.839076, -0.7969828, -2.37911, 1, 0, 0, 1, 1,
-0.8351834, -0.01813506, -1.821379, 0, 0, 0, 1, 1,
-0.8325087, -0.1271605, -1.719826, 0, 0, 0, 1, 1,
-0.8292192, -0.04581313, -1.478558, 0, 0, 0, 1, 1,
-0.8194877, -1.534529, -1.536949, 0, 0, 0, 1, 1,
-0.8031775, -0.05157491, -4.4815, 0, 0, 0, 1, 1,
-0.8010262, 0.1887216, -1.495792, 0, 0, 0, 1, 1,
-0.7916928, -1.707479, -3.623594, 0, 0, 0, 1, 1,
-0.7909115, -0.9819657, -1.629369, 1, 1, 1, 1, 1,
-0.7887188, 1.450526, -0.8702733, 1, 1, 1, 1, 1,
-0.7885814, -0.5209355, -1.502509, 1, 1, 1, 1, 1,
-0.7885723, -1.308843, -2.366439, 1, 1, 1, 1, 1,
-0.7801697, 0.07345432, -0.7541187, 1, 1, 1, 1, 1,
-0.777716, -0.7341487, -2.080202, 1, 1, 1, 1, 1,
-0.7762752, -1.279446, -3.55202, 1, 1, 1, 1, 1,
-0.7724797, 2.872875, -1.868205, 1, 1, 1, 1, 1,
-0.7714713, 0.08046483, -1.711759, 1, 1, 1, 1, 1,
-0.7661209, 0.3148299, -2.171948, 1, 1, 1, 1, 1,
-0.7643294, -1.45483, -3.281815, 1, 1, 1, 1, 1,
-0.7619077, 3.456023, 0.378349, 1, 1, 1, 1, 1,
-0.7614285, -0.08688713, -2.267616, 1, 1, 1, 1, 1,
-0.7606159, -1.004405, -1.795187, 1, 1, 1, 1, 1,
-0.7535202, -0.970005, -3.437412, 1, 1, 1, 1, 1,
-0.7500427, -0.661937, -2.965951, 0, 0, 1, 1, 1,
-0.7497136, 0.4520616, -1.150826, 1, 0, 0, 1, 1,
-0.748196, 0.6485686, -0.5638237, 1, 0, 0, 1, 1,
-0.7435861, 0.7102465, -0.02381456, 1, 0, 0, 1, 1,
-0.7431189, -0.7606853, -3.443745, 1, 0, 0, 1, 1,
-0.7428061, 0.06647421, -2.469653, 1, 0, 0, 1, 1,
-0.7404127, -0.2339107, -3.544183, 0, 0, 0, 1, 1,
-0.7385921, -0.9789183, -1.370909, 0, 0, 0, 1, 1,
-0.7299948, 0.6433794, -2.373459, 0, 0, 0, 1, 1,
-0.7241554, -0.4187894, -1.337126, 0, 0, 0, 1, 1,
-0.722558, -0.5874516, -2.631375, 0, 0, 0, 1, 1,
-0.716032, -0.8070922, -2.937649, 0, 0, 0, 1, 1,
-0.7111922, -0.6592643, -2.980148, 0, 0, 0, 1, 1,
-0.7063373, 0.03718186, -1.931525, 1, 1, 1, 1, 1,
-0.6970858, 1.221074, -2.688574, 1, 1, 1, 1, 1,
-0.6968778, -0.5371085, -2.438326, 1, 1, 1, 1, 1,
-0.6897222, 1.813314, -2.310972, 1, 1, 1, 1, 1,
-0.6809635, -0.2248925, -4.064586, 1, 1, 1, 1, 1,
-0.6751686, -0.1726867, -2.240879, 1, 1, 1, 1, 1,
-0.6724619, -2.218317, -4.813225, 1, 1, 1, 1, 1,
-0.6664416, 0.3262475, -0.747037, 1, 1, 1, 1, 1,
-0.6642265, 0.8466205, 0.1468492, 1, 1, 1, 1, 1,
-0.6598169, 0.4157011, -1.32158, 1, 1, 1, 1, 1,
-0.6595976, -0.6264452, -1.300412, 1, 1, 1, 1, 1,
-0.6590381, -0.5398957, -1.827599, 1, 1, 1, 1, 1,
-0.6480771, 0.4871024, -2.24509, 1, 1, 1, 1, 1,
-0.6458214, 0.8494332, -0.3303444, 1, 1, 1, 1, 1,
-0.6442783, -0.8130886, -1.829777, 1, 1, 1, 1, 1,
-0.6439192, 0.5804936, -0.1944302, 0, 0, 1, 1, 1,
-0.6392376, 0.8036804, 0.05061342, 1, 0, 0, 1, 1,
-0.6377266, 0.006468843, -2.987864, 1, 0, 0, 1, 1,
-0.6356124, -1.600925, -3.739454, 1, 0, 0, 1, 1,
-0.6345103, 1.557333, -1.934342, 1, 0, 0, 1, 1,
-0.6328385, 0.6799877, -1.10631, 1, 0, 0, 1, 1,
-0.6317629, -0.5735828, -2.730509, 0, 0, 0, 1, 1,
-0.6257812, 0.7761832, -0.2175686, 0, 0, 0, 1, 1,
-0.622999, 1.1005, 0.3495386, 0, 0, 0, 1, 1,
-0.6219724, 1.133016, -1.795872, 0, 0, 0, 1, 1,
-0.6194531, -0.2471959, -3.032895, 0, 0, 0, 1, 1,
-0.6179556, 1.096203, -0.4619521, 0, 0, 0, 1, 1,
-0.6170927, -0.510805, -3.911324, 0, 0, 0, 1, 1,
-0.6142743, -0.3463056, -2.929764, 1, 1, 1, 1, 1,
-0.6120673, 1.215388, -2.35599, 1, 1, 1, 1, 1,
-0.6087665, -0.6611739, -2.061414, 1, 1, 1, 1, 1,
-0.604664, -1.139679, -5.461315, 1, 1, 1, 1, 1,
-0.5979112, 0.1400355, -1.102311, 1, 1, 1, 1, 1,
-0.5953117, 0.04954131, -2.071589, 1, 1, 1, 1, 1,
-0.5921559, 2.674463, -1.922336, 1, 1, 1, 1, 1,
-0.5911964, 0.3408948, -0.5867121, 1, 1, 1, 1, 1,
-0.5893967, 1.364876, -1.283293, 1, 1, 1, 1, 1,
-0.586382, 0.2375902, -1.729434, 1, 1, 1, 1, 1,
-0.5828468, -1.818168, -4.007889, 1, 1, 1, 1, 1,
-0.5822845, 1.033534, 0.7254067, 1, 1, 1, 1, 1,
-0.5778966, -0.2026203, -3.107257, 1, 1, 1, 1, 1,
-0.5761651, -0.007840007, -1.421639, 1, 1, 1, 1, 1,
-0.5738068, -2.374003, -1.671594, 1, 1, 1, 1, 1,
-0.571533, -1.65745, -1.175238, 0, 0, 1, 1, 1,
-0.5704228, -2.177782, -4.425312, 1, 0, 0, 1, 1,
-0.5634372, 0.1529681, 0.3419327, 1, 0, 0, 1, 1,
-0.5595839, -0.106092, -2.58876, 1, 0, 0, 1, 1,
-0.5571598, -1.852509, -3.519883, 1, 0, 0, 1, 1,
-0.5524094, -0.1282482, -2.391781, 1, 0, 0, 1, 1,
-0.5463147, 0.3258813, -0.7659153, 0, 0, 0, 1, 1,
-0.5415363, -0.4824637, -2.272776, 0, 0, 0, 1, 1,
-0.5414275, 0.5712671, -0.5657892, 0, 0, 0, 1, 1,
-0.5414056, 0.6489551, -0.8104127, 0, 0, 0, 1, 1,
-0.5400097, 1.518631, -0.825152, 0, 0, 0, 1, 1,
-0.5384775, -0.2269806, -1.201824, 0, 0, 0, 1, 1,
-0.5368531, -1.667241, -3.307477, 0, 0, 0, 1, 1,
-0.5337155, -0.5494481, -1.016017, 1, 1, 1, 1, 1,
-0.5318288, 0.9118571, -2.069634, 1, 1, 1, 1, 1,
-0.5294989, -0.3748372, -1.953035, 1, 1, 1, 1, 1,
-0.5198258, -0.5324439, -3.977536, 1, 1, 1, 1, 1,
-0.515694, -0.3070278, -4.046061, 1, 1, 1, 1, 1,
-0.5152586, 1.738535, -0.831525, 1, 1, 1, 1, 1,
-0.5131643, 0.3848674, -1.377297, 1, 1, 1, 1, 1,
-0.51142, 1.446337, -0.8323085, 1, 1, 1, 1, 1,
-0.5050073, 0.2145226, -1.37295, 1, 1, 1, 1, 1,
-0.5047339, 1.299356, 0.951636, 1, 1, 1, 1, 1,
-0.5033123, 0.7271217, 1.382597, 1, 1, 1, 1, 1,
-0.5016835, 0.1584026, -0.5743896, 1, 1, 1, 1, 1,
-0.5003151, -0.5293582, -2.698735, 1, 1, 1, 1, 1,
-0.4962413, 2.850029, -0.3662295, 1, 1, 1, 1, 1,
-0.4960762, -0.4918245, -1.740464, 1, 1, 1, 1, 1,
-0.4918735, 0.5749485, -0.2510582, 0, 0, 1, 1, 1,
-0.4793895, -0.6846274, -4.002572, 1, 0, 0, 1, 1,
-0.4750759, -0.3250169, -1.617146, 1, 0, 0, 1, 1,
-0.4706432, 1.094489, -0.6240711, 1, 0, 0, 1, 1,
-0.4656575, 0.8082318, -1.450902, 1, 0, 0, 1, 1,
-0.4624499, 0.1849862, -1.009861, 1, 0, 0, 1, 1,
-0.4611791, -0.2313977, -1.894391, 0, 0, 0, 1, 1,
-0.4594679, 0.09265737, 0.1122595, 0, 0, 0, 1, 1,
-0.4589899, 0.9719692, 0.4006598, 0, 0, 0, 1, 1,
-0.458328, 1.669993, -1.581773, 0, 0, 0, 1, 1,
-0.4535322, -1.209853, -2.934169, 0, 0, 0, 1, 1,
-0.4516235, 1.269373, -0.2990371, 0, 0, 0, 1, 1,
-0.4484366, -0.04352781, -3.176617, 0, 0, 0, 1, 1,
-0.4400119, 1.738154, -1.065607, 1, 1, 1, 1, 1,
-0.4387898, -0.9154114, -3.899402, 1, 1, 1, 1, 1,
-0.4368539, -0.3350772, -3.238645, 1, 1, 1, 1, 1,
-0.4320922, -0.09891643, -2.687159, 1, 1, 1, 1, 1,
-0.4276999, -1.020761, -2.715336, 1, 1, 1, 1, 1,
-0.418899, -0.4057381, -1.762496, 1, 1, 1, 1, 1,
-0.4188483, -0.113943, -1.923837, 1, 1, 1, 1, 1,
-0.4165692, -0.1031139, -1.104091, 1, 1, 1, 1, 1,
-0.4146567, -1.64192, -2.636009, 1, 1, 1, 1, 1,
-0.4136356, -0.9341248, -3.836537, 1, 1, 1, 1, 1,
-0.4134077, -1.487066, -2.459831, 1, 1, 1, 1, 1,
-0.4110556, -0.8401317, -4.507477, 1, 1, 1, 1, 1,
-0.405468, -0.6048512, -2.402933, 1, 1, 1, 1, 1,
-0.4042245, -0.9788566, -4.851925, 1, 1, 1, 1, 1,
-0.401455, -0.6709361, -1.335051, 1, 1, 1, 1, 1,
-0.4011291, 0.2393966, 0.7392027, 0, 0, 1, 1, 1,
-0.3991517, -0.2698691, -3.637205, 1, 0, 0, 1, 1,
-0.3972541, -0.45842, -2.379785, 1, 0, 0, 1, 1,
-0.3946792, -0.506082, -3.191609, 1, 0, 0, 1, 1,
-0.3928807, -0.7258345, -2.410357, 1, 0, 0, 1, 1,
-0.3909242, -1.614854, -1.364365, 1, 0, 0, 1, 1,
-0.390618, 0.8830708, 0.5648577, 0, 0, 0, 1, 1,
-0.3901629, -0.5808141, -2.649521, 0, 0, 0, 1, 1,
-0.3893293, -0.7923754, -2.697338, 0, 0, 0, 1, 1,
-0.3883334, 0.608456, -0.6238037, 0, 0, 0, 1, 1,
-0.3882185, -0.551785, -2.062441, 0, 0, 0, 1, 1,
-0.3873484, -0.5105246, -1.687839, 0, 0, 0, 1, 1,
-0.3849576, 0.2068393, -0.7594835, 0, 0, 0, 1, 1,
-0.3799157, -0.1204336, -2.580771, 1, 1, 1, 1, 1,
-0.3785411, -1.345259, -4.696005, 1, 1, 1, 1, 1,
-0.3724906, -0.3239419, -2.79659, 1, 1, 1, 1, 1,
-0.3721228, 1.163446, 0.3437217, 1, 1, 1, 1, 1,
-0.3707574, -1.362877, -2.984273, 1, 1, 1, 1, 1,
-0.3678196, 0.9939664, -0.05604617, 1, 1, 1, 1, 1,
-0.3678168, 0.998221, -2.157291, 1, 1, 1, 1, 1,
-0.3660607, 1.996084, -1.560062, 1, 1, 1, 1, 1,
-0.3628709, -0.607587, -1.935457, 1, 1, 1, 1, 1,
-0.3609205, 0.09440015, -0.01383068, 1, 1, 1, 1, 1,
-0.3548158, 0.1845617, -1.622819, 1, 1, 1, 1, 1,
-0.3543975, 0.4954169, -0.1528149, 1, 1, 1, 1, 1,
-0.3534782, 0.1589582, -1.710007, 1, 1, 1, 1, 1,
-0.3521449, 1.057343, 2.205689, 1, 1, 1, 1, 1,
-0.3508679, 0.2774625, -1.547134, 1, 1, 1, 1, 1,
-0.3491772, -0.2675683, -1.304091, 0, 0, 1, 1, 1,
-0.3490031, 1.799101, -0.8920901, 1, 0, 0, 1, 1,
-0.348171, 0.8640584, 0.2023674, 1, 0, 0, 1, 1,
-0.3433272, -0.7622865, -2.744172, 1, 0, 0, 1, 1,
-0.3420461, 0.7991483, -0.5021734, 1, 0, 0, 1, 1,
-0.3419798, 0.2646215, 0.7167873, 1, 0, 0, 1, 1,
-0.3418765, -2.358426, -1.613889, 0, 0, 0, 1, 1,
-0.3418532, -0.360272, -3.900785, 0, 0, 0, 1, 1,
-0.339869, 1.035893, -1.265064, 0, 0, 0, 1, 1,
-0.3361561, 0.02905161, -2.104496, 0, 0, 0, 1, 1,
-0.3340338, -0.3134234, -1.800373, 0, 0, 0, 1, 1,
-0.33371, 0.587306, -0.4830896, 0, 0, 0, 1, 1,
-0.3320104, -0.03695779, -0.1164743, 0, 0, 0, 1, 1,
-0.3242083, -0.1698534, -0.3996854, 1, 1, 1, 1, 1,
-0.3238954, 1.183135, 0.3043211, 1, 1, 1, 1, 1,
-0.3144052, -0.02601256, -2.559139, 1, 1, 1, 1, 1,
-0.3051497, -1.036976, -1.703083, 1, 1, 1, 1, 1,
-0.2997623, 1.054529, -0.540127, 1, 1, 1, 1, 1,
-0.2916622, 0.806613, 1.264039, 1, 1, 1, 1, 1,
-0.2913843, 0.6504623, -0.7615452, 1, 1, 1, 1, 1,
-0.2882648, -0.7739068, -3.537971, 1, 1, 1, 1, 1,
-0.2868553, -1.175553, -3.553137, 1, 1, 1, 1, 1,
-0.2850061, 1.027513, -0.896167, 1, 1, 1, 1, 1,
-0.2827542, 0.2973378, -0.1745816, 1, 1, 1, 1, 1,
-0.2826632, 1.780479, 0.2425781, 1, 1, 1, 1, 1,
-0.2767256, -1.865536, -3.066937, 1, 1, 1, 1, 1,
-0.2756311, -1.614728, -3.546718, 1, 1, 1, 1, 1,
-0.2752481, 0.858008, -0.8054917, 1, 1, 1, 1, 1,
-0.2741984, -0.6884463, -3.191236, 0, 0, 1, 1, 1,
-0.2734717, 0.2514987, -0.3611621, 1, 0, 0, 1, 1,
-0.2728849, 0.9566877, 0.806075, 1, 0, 0, 1, 1,
-0.2701842, 0.9201522, -0.2730294, 1, 0, 0, 1, 1,
-0.2701814, 0.3691621, -0.8518512, 1, 0, 0, 1, 1,
-0.268758, -1.331455, -3.078601, 1, 0, 0, 1, 1,
-0.2686061, -1.113595, -2.769554, 0, 0, 0, 1, 1,
-0.2646891, -0.5394992, -2.339401, 0, 0, 0, 1, 1,
-0.2635831, 0.4943357, -0.3403768, 0, 0, 0, 1, 1,
-0.2591631, 0.6092324, -0.3339343, 0, 0, 0, 1, 1,
-0.2576454, 1.3844, -0.2029356, 0, 0, 0, 1, 1,
-0.2562314, 0.7996212, 1.089941, 0, 0, 0, 1, 1,
-0.25623, 0.2216977, -1.021557, 0, 0, 0, 1, 1,
-0.2495497, -0.2863409, -2.638464, 1, 1, 1, 1, 1,
-0.2469435, -1.809888, -3.320153, 1, 1, 1, 1, 1,
-0.2451568, -2.500139, -1.988696, 1, 1, 1, 1, 1,
-0.2447818, 0.2019555, -0.738847, 1, 1, 1, 1, 1,
-0.2437959, -1.061983, -3.826542, 1, 1, 1, 1, 1,
-0.2426836, 0.4037217, -1.399937, 1, 1, 1, 1, 1,
-0.2425054, 0.7416232, -0.1974436, 1, 1, 1, 1, 1,
-0.2368256, -0.9232371, -2.240766, 1, 1, 1, 1, 1,
-0.2353438, 0.5526161, -0.001834907, 1, 1, 1, 1, 1,
-0.2341421, -1.169466, -1.961244, 1, 1, 1, 1, 1,
-0.2287802, 0.752882, -1.978511, 1, 1, 1, 1, 1,
-0.2272675, 0.3236134, -1.800968, 1, 1, 1, 1, 1,
-0.221121, -0.7606255, -2.57386, 1, 1, 1, 1, 1,
-0.2198055, -2.048662, -3.098233, 1, 1, 1, 1, 1,
-0.2149089, 1.174288, 0.9426261, 1, 1, 1, 1, 1,
-0.2125046, 0.5078701, 0.4720917, 0, 0, 1, 1, 1,
-0.2110649, 0.4133412, 1.638306, 1, 0, 0, 1, 1,
-0.2066499, 0.08120971, -0.605967, 1, 0, 0, 1, 1,
-0.2043488, -2.074225, -3.171915, 1, 0, 0, 1, 1,
-0.2006475, -0.3428057, -1.440649, 1, 0, 0, 1, 1,
-0.1965625, 1.020951, -0.7740436, 1, 0, 0, 1, 1,
-0.1937531, -0.1117425, -0.6659206, 0, 0, 0, 1, 1,
-0.1913553, 1.427475, 0.04043808, 0, 0, 0, 1, 1,
-0.1879543, 0.3422047, -0.318764, 0, 0, 0, 1, 1,
-0.1853662, -0.5261027, -3.647153, 0, 0, 0, 1, 1,
-0.1773003, -0.2319507, -1.318158, 0, 0, 0, 1, 1,
-0.1695877, 1.131584, 0.6766893, 0, 0, 0, 1, 1,
-0.1694112, -0.4419561, -3.292725, 0, 0, 0, 1, 1,
-0.1632622, 0.1089245, -1.266482, 1, 1, 1, 1, 1,
-0.1627609, 1.237141, -1.164635, 1, 1, 1, 1, 1,
-0.1607287, -0.2363089, -1.570384, 1, 1, 1, 1, 1,
-0.1561666, -3.198362, -2.879099, 1, 1, 1, 1, 1,
-0.1536778, -0.8987837, -1.708668, 1, 1, 1, 1, 1,
-0.1513859, -0.08021343, -1.266101, 1, 1, 1, 1, 1,
-0.1471822, -1.356185, -4.139908, 1, 1, 1, 1, 1,
-0.1468966, 0.3823961, -1.459365, 1, 1, 1, 1, 1,
-0.1416194, 0.248459, 0.5695103, 1, 1, 1, 1, 1,
-0.1369427, 0.290891, -2.43892, 1, 1, 1, 1, 1,
-0.1335078, 0.05742852, 0.09879154, 1, 1, 1, 1, 1,
-0.1328966, 1.344927, -0.4367374, 1, 1, 1, 1, 1,
-0.1260641, 0.9614108, 0.6499466, 1, 1, 1, 1, 1,
-0.1184184, -1.698869, -2.504909, 1, 1, 1, 1, 1,
-0.1142068, -0.3481841, -2.482833, 1, 1, 1, 1, 1,
-0.1101433, -0.05639277, -3.117998, 0, 0, 1, 1, 1,
-0.1091595, -0.6824688, -2.717169, 1, 0, 0, 1, 1,
-0.1089397, -0.01840319, -0.4719535, 1, 0, 0, 1, 1,
-0.1020331, 0.4263667, -1.04309, 1, 0, 0, 1, 1,
-0.1009569, 0.04730055, -2.343787, 1, 0, 0, 1, 1,
-0.09604887, -0.7247383, -2.93591, 1, 0, 0, 1, 1,
-0.09573567, 0.06059905, -1.160238, 0, 0, 0, 1, 1,
-0.08397686, 0.2153025, 0.6737095, 0, 0, 0, 1, 1,
-0.08355958, 0.5026122, 0.5074481, 0, 0, 0, 1, 1,
-0.08266152, -1.64552, -4.247093, 0, 0, 0, 1, 1,
-0.07988116, -0.72075, -2.622185, 0, 0, 0, 1, 1,
-0.07567757, 0.336054, 0.6810585, 0, 0, 0, 1, 1,
-0.07120877, 1.706001, -1.61415, 0, 0, 0, 1, 1,
-0.07106955, -1.667962, -0.5741246, 1, 1, 1, 1, 1,
-0.07003782, 0.241413, 0.6258504, 1, 1, 1, 1, 1,
-0.07002571, -0.02680711, -2.664935, 1, 1, 1, 1, 1,
-0.06915907, 0.5086681, 0.6465089, 1, 1, 1, 1, 1,
-0.06446416, -1.395601, -3.279499, 1, 1, 1, 1, 1,
-0.06271295, 1.224455, -1.486712, 1, 1, 1, 1, 1,
-0.06216365, 1.104263, 0.01323367, 1, 1, 1, 1, 1,
-0.0619659, 1.141802, -2.179259, 1, 1, 1, 1, 1,
-0.05562316, -0.7889971, -4.130683, 1, 1, 1, 1, 1,
-0.04962397, 0.7416421, -1.159995, 1, 1, 1, 1, 1,
-0.04549228, 0.6585967, 0.6608848, 1, 1, 1, 1, 1,
-0.04498446, 0.317351, -0.3972651, 1, 1, 1, 1, 1,
-0.04090125, -0.7226165, -0.8157388, 1, 1, 1, 1, 1,
-0.03824969, -0.1530536, -2.555784, 1, 1, 1, 1, 1,
-0.03656167, -0.7057819, -4.093184, 1, 1, 1, 1, 1,
-0.03537878, 0.8409466, -0.1102636, 0, 0, 1, 1, 1,
-0.03455585, -1.544678, -3.473338, 1, 0, 0, 1, 1,
-0.03143345, 1.438316, 0.5575023, 1, 0, 0, 1, 1,
-0.03081535, -0.2011858, -3.749866, 1, 0, 0, 1, 1,
-0.02931432, -1.062153, -1.682676, 1, 0, 0, 1, 1,
-0.02784323, 0.85312, -1.010544, 1, 0, 0, 1, 1,
-0.02113614, 0.2148312, -1.822486, 0, 0, 0, 1, 1,
-0.01841977, 0.3844809, 0.1701461, 0, 0, 0, 1, 1,
-0.01593592, -1.186199, -4.516994, 0, 0, 0, 1, 1,
-0.01155475, 0.3108327, -0.05805542, 0, 0, 0, 1, 1,
-0.00862148, -1.138178, -2.067958, 0, 0, 0, 1, 1,
-0.005999119, -0.4470936, -2.935027, 0, 0, 0, 1, 1,
-0.005674524, 0.905946, 1.219012, 0, 0, 0, 1, 1,
-0.001499609, 0.5681199, 0.321248, 1, 1, 1, 1, 1,
1.815231e-05, -0.1673594, 2.792127, 1, 1, 1, 1, 1,
0.001076154, 0.07929188, 0.9018883, 1, 1, 1, 1, 1,
0.001623448, 1.81862, -0.6467378, 1, 1, 1, 1, 1,
0.001935308, 0.3130616, 1.898502, 1, 1, 1, 1, 1,
0.008256114, -0.4635889, 3.318874, 1, 1, 1, 1, 1,
0.009986922, 0.1434836, -0.3112515, 1, 1, 1, 1, 1,
0.01001793, -0.6725435, 4.76249, 1, 1, 1, 1, 1,
0.01079256, 0.0114838, 1.082591, 1, 1, 1, 1, 1,
0.01642784, 0.02998422, 1.374571, 1, 1, 1, 1, 1,
0.01826909, 1.487076, -0.1539782, 1, 1, 1, 1, 1,
0.01930622, -0.1910038, 3.411052, 1, 1, 1, 1, 1,
0.02080579, -0.4315931, 4.246342, 1, 1, 1, 1, 1,
0.02087906, -0.5003167, 1.749451, 1, 1, 1, 1, 1,
0.024743, 0.8141468, 0.4494357, 1, 1, 1, 1, 1,
0.02516397, -1.45251, 0.8810405, 0, 0, 1, 1, 1,
0.02709569, -1.768246, 4.583174, 1, 0, 0, 1, 1,
0.02747155, -0.3212134, 1.778884, 1, 0, 0, 1, 1,
0.03381241, 0.568163, 1.941476, 1, 0, 0, 1, 1,
0.03810626, 0.4646725, -0.9934644, 1, 0, 0, 1, 1,
0.04106977, -0.1989059, 2.212597, 1, 0, 0, 1, 1,
0.04342026, -0.80634, 3.112172, 0, 0, 0, 1, 1,
0.0443764, 2.510289, -1.074928, 0, 0, 0, 1, 1,
0.04595915, 1.678098, -0.7066398, 0, 0, 0, 1, 1,
0.04774404, 0.8734988, -1.02165, 0, 0, 0, 1, 1,
0.05168265, -1.066365, 2.435326, 0, 0, 0, 1, 1,
0.05485544, -0.2935021, 2.646598, 0, 0, 0, 1, 1,
0.05681923, -1.998191, 2.651461, 0, 0, 0, 1, 1,
0.05836856, -0.7531441, 4.324131, 1, 1, 1, 1, 1,
0.06010695, -2.361347, 4.822364, 1, 1, 1, 1, 1,
0.06093657, 1.074598, 0.6265608, 1, 1, 1, 1, 1,
0.06628751, 0.02176608, 0.6572998, 1, 1, 1, 1, 1,
0.06664938, 0.2664503, 1.999713, 1, 1, 1, 1, 1,
0.07236345, -0.01217289, 2.728882, 1, 1, 1, 1, 1,
0.07312141, 0.5499968, 0.7359462, 1, 1, 1, 1, 1,
0.08023196, -1.011263, 3.513335, 1, 1, 1, 1, 1,
0.08073738, 0.4005393, -0.05166795, 1, 1, 1, 1, 1,
0.08332313, -0.6781158, 4.973709, 1, 1, 1, 1, 1,
0.08786751, -0.647402, 4.611285, 1, 1, 1, 1, 1,
0.08902977, 1.370462, 1.339522, 1, 1, 1, 1, 1,
0.08932275, 0.8727816, 0.950201, 1, 1, 1, 1, 1,
0.09206992, -1.276628, 3.410311, 1, 1, 1, 1, 1,
0.09472813, 0.2255347, 0.6657439, 1, 1, 1, 1, 1,
0.09783366, -0.4125089, 1.830357, 0, 0, 1, 1, 1,
0.09988511, 0.6856032, -1.367669, 1, 0, 0, 1, 1,
0.1002981, 0.08910128, 1.714081, 1, 0, 0, 1, 1,
0.1024828, -0.04975716, 2.784465, 1, 0, 0, 1, 1,
0.1057519, 0.9560605, -0.2941146, 1, 0, 0, 1, 1,
0.1096583, -0.8943773, 3.081269, 1, 0, 0, 1, 1,
0.1109943, -2.693174, 3.187197, 0, 0, 0, 1, 1,
0.1158829, -0.6566438, 2.1793, 0, 0, 0, 1, 1,
0.1206462, 0.7969896, 1.087101, 0, 0, 0, 1, 1,
0.1244703, -0.922787, 3.245727, 0, 0, 0, 1, 1,
0.1251915, -0.003185113, 2.067815, 0, 0, 0, 1, 1,
0.1262919, -0.1762675, 2.852071, 0, 0, 0, 1, 1,
0.1302912, -0.3364464, 1.857958, 0, 0, 0, 1, 1,
0.1303522, -0.110519, 1.106303, 1, 1, 1, 1, 1,
0.1357856, 0.4157503, 0.65707, 1, 1, 1, 1, 1,
0.1395562, -1.006729, 2.45942, 1, 1, 1, 1, 1,
0.1399401, 0.008717762, 1.129563, 1, 1, 1, 1, 1,
0.1466548, 0.738436, 0.9663278, 1, 1, 1, 1, 1,
0.1505805, -1.484729, 2.457827, 1, 1, 1, 1, 1,
0.1519956, 1.077498, -0.7411624, 1, 1, 1, 1, 1,
0.1524508, 0.1805625, 1.601105, 1, 1, 1, 1, 1,
0.1527601, 0.6883274, 0.7807901, 1, 1, 1, 1, 1,
0.1532059, -0.7671313, 3.682562, 1, 1, 1, 1, 1,
0.1560523, -0.3997507, 2.710704, 1, 1, 1, 1, 1,
0.1560938, 0.6196615, -1.263686, 1, 1, 1, 1, 1,
0.1588242, -1.151214, 3.806497, 1, 1, 1, 1, 1,
0.1617561, -0.1755367, 2.846465, 1, 1, 1, 1, 1,
0.1728192, 0.7398492, 0.1258695, 1, 1, 1, 1, 1,
0.1783961, 0.623421, -0.5454327, 0, 0, 1, 1, 1,
0.1805003, -0.5002739, 3.431394, 1, 0, 0, 1, 1,
0.1812871, 1.449672, 1.284433, 1, 0, 0, 1, 1,
0.1851918, 1.349421, 0.735917, 1, 0, 0, 1, 1,
0.1857109, -0.6832198, 4.203741, 1, 0, 0, 1, 1,
0.1868223, -0.2246442, 2.513294, 1, 0, 0, 1, 1,
0.1868361, -1.220737, 3.431329, 0, 0, 0, 1, 1,
0.1878496, -0.539059, 2.909824, 0, 0, 0, 1, 1,
0.1994668, 0.7271458, 0.3727313, 0, 0, 0, 1, 1,
0.1995553, 0.2271765, 0.0670903, 0, 0, 0, 1, 1,
0.201522, -0.4966663, 1.627698, 0, 0, 0, 1, 1,
0.2021746, -0.6475083, 4.185823, 0, 0, 0, 1, 1,
0.205607, -0.5852979, 2.589054, 0, 0, 0, 1, 1,
0.2063341, -0.4004453, 2.706843, 1, 1, 1, 1, 1,
0.2074473, -1.087031, 2.67091, 1, 1, 1, 1, 1,
0.2085767, -0.8304249, 5.388892, 1, 1, 1, 1, 1,
0.2161906, -1.816514, 2.606745, 1, 1, 1, 1, 1,
0.2212437, -0.02694609, 2.205358, 1, 1, 1, 1, 1,
0.2246576, -0.1971637, 2.185004, 1, 1, 1, 1, 1,
0.2303419, 1.736236, 1.061183, 1, 1, 1, 1, 1,
0.2312992, 1.007445, 0.9700177, 1, 1, 1, 1, 1,
0.2327487, 1.609251, -0.8216416, 1, 1, 1, 1, 1,
0.2343187, 1.033985, 0.7329265, 1, 1, 1, 1, 1,
0.2347954, 0.5395654, -0.8981642, 1, 1, 1, 1, 1,
0.2380794, 0.9237298, 0.8777554, 1, 1, 1, 1, 1,
0.241272, -0.2255191, 1.555943, 1, 1, 1, 1, 1,
0.24198, -0.6311083, 2.89398, 1, 1, 1, 1, 1,
0.2444805, -0.6020474, 3.052971, 1, 1, 1, 1, 1,
0.2473986, 0.379379, -0.2675162, 0, 0, 1, 1, 1,
0.2487664, 0.9767093, 1.552485, 1, 0, 0, 1, 1,
0.2495824, -0.7346609, 1.941378, 1, 0, 0, 1, 1,
0.2531125, -0.304853, 2.030493, 1, 0, 0, 1, 1,
0.256722, -0.4554644, 1.698276, 1, 0, 0, 1, 1,
0.2567278, -1.194029, 2.644433, 1, 0, 0, 1, 1,
0.2578181, -0.08539085, 1.978956, 0, 0, 0, 1, 1,
0.2623324, -0.2965659, 2.064997, 0, 0, 0, 1, 1,
0.2643899, -1.49914, 2.319769, 0, 0, 0, 1, 1,
0.2677433, 0.4930382, 0.5963722, 0, 0, 0, 1, 1,
0.2700256, 0.8879308, -0.5604766, 0, 0, 0, 1, 1,
0.2749094, -0.08743919, 4.470194, 0, 0, 0, 1, 1,
0.275924, -1.517688, 4.315074, 0, 0, 0, 1, 1,
0.2779171, -0.1270894, 1.609819, 1, 1, 1, 1, 1,
0.2787888, 1.803178, -1.348051, 1, 1, 1, 1, 1,
0.2796198, 0.03842167, 1.684385, 1, 1, 1, 1, 1,
0.286745, -0.4418797, 4.0631, 1, 1, 1, 1, 1,
0.2880526, 0.6974871, -0.2731809, 1, 1, 1, 1, 1,
0.2891957, 0.05110956, -0.08413193, 1, 1, 1, 1, 1,
0.2899489, 0.578328, 1.385036, 1, 1, 1, 1, 1,
0.2915193, 0.5236506, -0.7114058, 1, 1, 1, 1, 1,
0.2975155, 1.555498, 0.9788902, 1, 1, 1, 1, 1,
0.3052841, 0.8347206, 1.655251, 1, 1, 1, 1, 1,
0.3087363, -0.5224273, 1.283504, 1, 1, 1, 1, 1,
0.3090316, 0.7119498, 1.636225, 1, 1, 1, 1, 1,
0.3135863, -0.4498089, 3.381643, 1, 1, 1, 1, 1,
0.315169, 0.1693498, -0.698306, 1, 1, 1, 1, 1,
0.3163968, 1.463677, -0.4823029, 1, 1, 1, 1, 1,
0.3190085, 1.282369, 0.3239043, 0, 0, 1, 1, 1,
0.3216495, -0.178702, 0.1941427, 1, 0, 0, 1, 1,
0.3246805, -2.093473, 5.880875, 1, 0, 0, 1, 1,
0.3296685, -1.651037, 2.943005, 1, 0, 0, 1, 1,
0.3297477, -1.78108, 2.692898, 1, 0, 0, 1, 1,
0.3307385, 0.2356374, 2.373024, 1, 0, 0, 1, 1,
0.3314848, -0.3205458, 1.464562, 0, 0, 0, 1, 1,
0.3333741, 0.2677965, 1.820789, 0, 0, 0, 1, 1,
0.3334197, 0.0725554, 0.4430991, 0, 0, 0, 1, 1,
0.3396516, -0.2951408, 3.020675, 0, 0, 0, 1, 1,
0.3423167, -1.878925, 2.814748, 0, 0, 0, 1, 1,
0.3441022, 1.089222, 2.356158, 0, 0, 0, 1, 1,
0.3479736, -0.7353305, 4.470607, 0, 0, 0, 1, 1,
0.3497717, 1.100034, 1.46263, 1, 1, 1, 1, 1,
0.3503451, 0.7671925, -1.141286, 1, 1, 1, 1, 1,
0.3509601, 0.8515763, 0.8661285, 1, 1, 1, 1, 1,
0.3575011, -0.2072505, 2.409614, 1, 1, 1, 1, 1,
0.3753378, -0.5473549, 2.631076, 1, 1, 1, 1, 1,
0.3764838, 0.1965155, -1.03962, 1, 1, 1, 1, 1,
0.3768306, 0.25218, 0.731076, 1, 1, 1, 1, 1,
0.377968, 1.365777, -1.120945, 1, 1, 1, 1, 1,
0.381586, 0.2674292, 1.270389, 1, 1, 1, 1, 1,
0.383123, -0.7046789, 2.366286, 1, 1, 1, 1, 1,
0.3866307, -1.418444, 3.816984, 1, 1, 1, 1, 1,
0.3868027, 0.6832814, 1.725503, 1, 1, 1, 1, 1,
0.3877725, 1.040669, 0.6276833, 1, 1, 1, 1, 1,
0.3902266, 0.463305, -0.5152765, 1, 1, 1, 1, 1,
0.3905399, 0.2970941, -2.029052, 1, 1, 1, 1, 1,
0.3912727, 0.6522264, 0.03748173, 0, 0, 1, 1, 1,
0.3954836, 0.3861943, 2.405675, 1, 0, 0, 1, 1,
0.398236, -1.443757, 2.865513, 1, 0, 0, 1, 1,
0.4002644, -0.1171816, 3.472901, 1, 0, 0, 1, 1,
0.4013062, -0.5409085, 2.583655, 1, 0, 0, 1, 1,
0.4037373, 0.1628108, 2.525456, 1, 0, 0, 1, 1,
0.4041955, 2.679342, -0.5118865, 0, 0, 0, 1, 1,
0.4048423, -0.6018225, 2.41521, 0, 0, 0, 1, 1,
0.40561, -0.2711824, 2.161656, 0, 0, 0, 1, 1,
0.4080465, -0.120574, 0.8403624, 0, 0, 0, 1, 1,
0.4127909, -0.678996, 4.185985, 0, 0, 0, 1, 1,
0.4143421, -0.643554, 2.095391, 0, 0, 0, 1, 1,
0.4165488, 0.5907035, 0.7819968, 0, 0, 0, 1, 1,
0.4296294, -0.1465715, 2.203825, 1, 1, 1, 1, 1,
0.4350004, 2.982041, -0.6130056, 1, 1, 1, 1, 1,
0.435968, -1.160705, 2.841911, 1, 1, 1, 1, 1,
0.4382865, 1.162353, 0.7680377, 1, 1, 1, 1, 1,
0.4400641, -1.325424, 3.432431, 1, 1, 1, 1, 1,
0.4412414, -0.4400808, 3.027455, 1, 1, 1, 1, 1,
0.4456953, -1.326103, 3.359673, 1, 1, 1, 1, 1,
0.4460527, 1.282262, -0.9567741, 1, 1, 1, 1, 1,
0.4493971, -1.249342, 2.548943, 1, 1, 1, 1, 1,
0.4530537, 0.03747118, 2.861482, 1, 1, 1, 1, 1,
0.4651108, -0.4264574, 3.500873, 1, 1, 1, 1, 1,
0.4662875, 1.327404, 0.1454943, 1, 1, 1, 1, 1,
0.4686966, 0.8373449, 1.893184, 1, 1, 1, 1, 1,
0.4692028, 0.07533985, 0.551962, 1, 1, 1, 1, 1,
0.4695812, 2.637289, 0.7213996, 1, 1, 1, 1, 1,
0.4744633, 0.5499532, 2.780615, 0, 0, 1, 1, 1,
0.4841537, -2.287152, 3.83191, 1, 0, 0, 1, 1,
0.4858838, -0.6742027, 1.827753, 1, 0, 0, 1, 1,
0.4863143, 0.05385889, 2.75635, 1, 0, 0, 1, 1,
0.4915196, 0.9339168, -0.05619991, 1, 0, 0, 1, 1,
0.4943925, 0.2251315, -0.4155664, 1, 0, 0, 1, 1,
0.4953377, -0.04268907, 1.18391, 0, 0, 0, 1, 1,
0.5002766, -0.2840649, 0.8811762, 0, 0, 0, 1, 1,
0.5014483, -0.9504339, 1.387109, 0, 0, 0, 1, 1,
0.5063391, -0.2085826, 1.356225, 0, 0, 0, 1, 1,
0.5091237, -0.2186228, 1.992259, 0, 0, 0, 1, 1,
0.5092455, 0.6053618, 0.2281848, 0, 0, 0, 1, 1,
0.5099747, 0.5033223, 0.8820662, 0, 0, 0, 1, 1,
0.5129483, 0.634136, 2.302062, 1, 1, 1, 1, 1,
0.5213018, -1.002696, 3.532526, 1, 1, 1, 1, 1,
0.5218886, -0.4866179, 1.948229, 1, 1, 1, 1, 1,
0.5228984, -0.1468208, 1.94245, 1, 1, 1, 1, 1,
0.5247211, 0.77667, -0.7372625, 1, 1, 1, 1, 1,
0.5323153, 0.2443222, 0.1534229, 1, 1, 1, 1, 1,
0.5360689, -0.02585956, -0.01245815, 1, 1, 1, 1, 1,
0.53662, -0.5027732, 1.122146, 1, 1, 1, 1, 1,
0.5391737, -0.8004645, 1.46897, 1, 1, 1, 1, 1,
0.53953, -0.604225, 2.13861, 1, 1, 1, 1, 1,
0.5438872, 0.133908, 3.34645, 1, 1, 1, 1, 1,
0.5442321, -0.9283199, 2.851164, 1, 1, 1, 1, 1,
0.5481724, -0.7766407, 4.046306, 1, 1, 1, 1, 1,
0.5505432, -0.1955506, 0.4435142, 1, 1, 1, 1, 1,
0.5516279, 0.1041089, 1.074764, 1, 1, 1, 1, 1,
0.5551204, 0.6020542, 1.049499, 0, 0, 1, 1, 1,
0.5567784, 0.9278242, 0.5935204, 1, 0, 0, 1, 1,
0.5585488, -0.411117, 1.32903, 1, 0, 0, 1, 1,
0.5595961, 0.2986505, 1.58706, 1, 0, 0, 1, 1,
0.5604638, -0.9473552, 0.6729706, 1, 0, 0, 1, 1,
0.5639966, 0.8639542, 0.2848969, 1, 0, 0, 1, 1,
0.5682073, 0.180362, -0.5022652, 0, 0, 0, 1, 1,
0.5727531, 1.035196, 0.02661293, 0, 0, 0, 1, 1,
0.5749753, -0.6159307, 2.811832, 0, 0, 0, 1, 1,
0.5809711, -0.7098453, 1.037712, 0, 0, 0, 1, 1,
0.5829462, 0.2542077, 1.771716, 0, 0, 0, 1, 1,
0.583209, -0.05122012, 1.683554, 0, 0, 0, 1, 1,
0.5856681, -0.1998211, 2.083854, 0, 0, 0, 1, 1,
0.5954511, -0.568386, 1.372098, 1, 1, 1, 1, 1,
0.5958298, 0.9828368, 0.8458574, 1, 1, 1, 1, 1,
0.5980798, -0.2404349, 1.335488, 1, 1, 1, 1, 1,
0.6029455, 1.57472, -0.2355197, 1, 1, 1, 1, 1,
0.6121222, -1.069116, 1.698346, 1, 1, 1, 1, 1,
0.612598, 0.6951348, 0.2944693, 1, 1, 1, 1, 1,
0.6174022, 0.1766241, 1.011086, 1, 1, 1, 1, 1,
0.6182704, 0.4231245, 0.3964881, 1, 1, 1, 1, 1,
0.6194672, 0.7383628, -0.3407359, 1, 1, 1, 1, 1,
0.6221209, -0.3849712, 2.105594, 1, 1, 1, 1, 1,
0.6235797, 0.6561401, 0.4250251, 1, 1, 1, 1, 1,
0.6310853, 2.436344, 0.2348188, 1, 1, 1, 1, 1,
0.6315485, -0.4024529, 1.426482, 1, 1, 1, 1, 1,
0.6339435, -0.04205344, 3.397552, 1, 1, 1, 1, 1,
0.6346028, 0.475198, 0.4842457, 1, 1, 1, 1, 1,
0.6477094, 0.2590185, 0.0643943, 0, 0, 1, 1, 1,
0.6495896, -1.356531, 4.373958, 1, 0, 0, 1, 1,
0.6532107, -1.262292, 3.048607, 1, 0, 0, 1, 1,
0.6550258, -0.3060144, 2.027988, 1, 0, 0, 1, 1,
0.6611185, -0.2299158, 3.19635, 1, 0, 0, 1, 1,
0.6646826, -0.9616607, 1.216426, 1, 0, 0, 1, 1,
0.6649849, 0.395829, 2.667032, 0, 0, 0, 1, 1,
0.6687117, 1.77644, 0.8881478, 0, 0, 0, 1, 1,
0.6750069, -0.07771915, 1.723639, 0, 0, 0, 1, 1,
0.678261, -0.3031546, 2.980022, 0, 0, 0, 1, 1,
0.6787028, -1.145385, 4.073895, 0, 0, 0, 1, 1,
0.6793072, -1.024344, 3.3567, 0, 0, 0, 1, 1,
0.6797038, 1.397877, 1.990593, 0, 0, 0, 1, 1,
0.6804336, -0.09862446, 2.017879, 1, 1, 1, 1, 1,
0.6842137, -1.411581, 1.325664, 1, 1, 1, 1, 1,
0.6843844, 0.5448983, 1.298955, 1, 1, 1, 1, 1,
0.6897756, -1.580387, 3.634048, 1, 1, 1, 1, 1,
0.6925438, -1.268443, 1.862271, 1, 1, 1, 1, 1,
0.6951839, -1.638376, 3.927226, 1, 1, 1, 1, 1,
0.6959089, 1.25134, 1.024814, 1, 1, 1, 1, 1,
0.6960101, -0.4363684, 2.694006, 1, 1, 1, 1, 1,
0.7003514, -1.153714, 2.524108, 1, 1, 1, 1, 1,
0.7019128, 1.262718, -0.4622155, 1, 1, 1, 1, 1,
0.7056766, 0.5726577, 0.2051691, 1, 1, 1, 1, 1,
0.707963, -0.3008407, 2.507174, 1, 1, 1, 1, 1,
0.7091511, 0.8500639, -0.2777463, 1, 1, 1, 1, 1,
0.7137848, -0.1126081, 0.3051935, 1, 1, 1, 1, 1,
0.7140725, -0.250389, 0.9642966, 1, 1, 1, 1, 1,
0.7155998, -2.376473, 2.928598, 0, 0, 1, 1, 1,
0.7194389, 0.614014, 0.7968239, 1, 0, 0, 1, 1,
0.7217469, -0.5260714, 1.063964, 1, 0, 0, 1, 1,
0.7234434, 0.273685, 0.9055266, 1, 0, 0, 1, 1,
0.7240372, -1.387707, 2.372546, 1, 0, 0, 1, 1,
0.7267218, -1.340775, 1.476959, 1, 0, 0, 1, 1,
0.7268707, 0.9056407, 0.6421283, 0, 0, 0, 1, 1,
0.7283736, -0.5953246, 2.103219, 0, 0, 0, 1, 1,
0.7303597, 0.8461506, -1.922793, 0, 0, 0, 1, 1,
0.7338083, 1.21273, 1.322858, 0, 0, 0, 1, 1,
0.7340848, -0.8964371, 4.137022, 0, 0, 0, 1, 1,
0.7351459, 0.6777875, 1.398708, 0, 0, 0, 1, 1,
0.7396594, 1.084423, 1.323152, 0, 0, 0, 1, 1,
0.7424008, -1.395037, 2.25176, 1, 1, 1, 1, 1,
0.7432799, -0.6028533, 1.695917, 1, 1, 1, 1, 1,
0.7447713, -0.6182772, 2.154381, 1, 1, 1, 1, 1,
0.7593406, -0.06460483, 2.903083, 1, 1, 1, 1, 1,
0.7635145, 0.2218365, -0.1218653, 1, 1, 1, 1, 1,
0.7712663, -1.116776, 0.463526, 1, 1, 1, 1, 1,
0.772975, -0.8936393, 1.992473, 1, 1, 1, 1, 1,
0.7746373, 0.5677221, 0.04168489, 1, 1, 1, 1, 1,
0.7793385, -0.8446353, 2.541764, 1, 1, 1, 1, 1,
0.7796229, -0.4752229, -0.003561835, 1, 1, 1, 1, 1,
0.7821002, -0.511117, 3.739247, 1, 1, 1, 1, 1,
0.7862476, 0.5171253, 0.9832947, 1, 1, 1, 1, 1,
0.7902877, 0.7301052, 0.8235672, 1, 1, 1, 1, 1,
0.7905455, 2.250494, -0.3037505, 1, 1, 1, 1, 1,
0.8021874, 0.1183783, 1.184983, 1, 1, 1, 1, 1,
0.80222, 1.693716, -1.530458, 0, 0, 1, 1, 1,
0.802782, 0.3034227, 2.675074, 1, 0, 0, 1, 1,
0.8036147, 1.320111, -1.2573, 1, 0, 0, 1, 1,
0.8127947, -0.4597862, 0.6955597, 1, 0, 0, 1, 1,
0.8138587, -0.1547924, -0.1824042, 1, 0, 0, 1, 1,
0.8149549, 0.9279737, 2.25523, 1, 0, 0, 1, 1,
0.8149997, 0.03728571, 0.916425, 0, 0, 0, 1, 1,
0.8184441, 0.4521296, 0.5531214, 0, 0, 0, 1, 1,
0.8228123, 1.086596, 1.079529, 0, 0, 0, 1, 1,
0.8245343, -1.433213, 2.741001, 0, 0, 0, 1, 1,
0.8258546, 0.4429454, 3.088129, 0, 0, 0, 1, 1,
0.8263335, -0.1122017, 1.991215, 0, 0, 0, 1, 1,
0.8266512, 0.1237528, 3.108445, 0, 0, 0, 1, 1,
0.8272548, 0.9656034, 1.185974, 1, 1, 1, 1, 1,
0.8321379, 0.6951748, 1.537457, 1, 1, 1, 1, 1,
0.8401939, -2.016345, 4.069164, 1, 1, 1, 1, 1,
0.840799, -0.1114979, 1.752576, 1, 1, 1, 1, 1,
0.8421319, 1.130114, 0.2050515, 1, 1, 1, 1, 1,
0.8421593, 0.207248, 0.6675974, 1, 1, 1, 1, 1,
0.8426281, 1.019525, -0.1843864, 1, 1, 1, 1, 1,
0.8431274, -0.129468, 1.819754, 1, 1, 1, 1, 1,
0.8504065, -0.7651608, 0.9500728, 1, 1, 1, 1, 1,
0.8561255, -0.4817664, 2.034551, 1, 1, 1, 1, 1,
0.8581136, 2.052259, 0.2961463, 1, 1, 1, 1, 1,
0.8604986, 0.9667897, 0.2060653, 1, 1, 1, 1, 1,
0.8651596, -0.758392, 0.7407421, 1, 1, 1, 1, 1,
0.8715494, -1.130585, 2.414135, 1, 1, 1, 1, 1,
0.877492, 0.4688159, 1.303814, 1, 1, 1, 1, 1,
0.8839008, 0.3099633, 1.179051, 0, 0, 1, 1, 1,
0.8877792, 0.3458107, 0.1134161, 1, 0, 0, 1, 1,
0.8920263, -0.9444586, 1.050524, 1, 0, 0, 1, 1,
0.8944574, -1.442864, 3.733171, 1, 0, 0, 1, 1,
0.9042463, 0.8052575, 1.366388, 1, 0, 0, 1, 1,
0.9046801, 0.4719478, 0.3930084, 1, 0, 0, 1, 1,
0.9079369, 0.1698922, -0.2382379, 0, 0, 0, 1, 1,
0.9142192, -0.4939437, 4.002586, 0, 0, 0, 1, 1,
0.9142718, -1.069902, 2.746753, 0, 0, 0, 1, 1,
0.9186093, 1.172748, 0.6916916, 0, 0, 0, 1, 1,
0.919774, -0.5364711, 2.281105, 0, 0, 0, 1, 1,
0.9272485, -0.3155216, 0.9301525, 0, 0, 0, 1, 1,
0.9275239, 0.7238621, 1.863903, 0, 0, 0, 1, 1,
0.9277155, 1.900733, -0.2366391, 1, 1, 1, 1, 1,
0.9373709, 0.2263151, 2.053461, 1, 1, 1, 1, 1,
0.9457464, 0.1968954, 1.057381, 1, 1, 1, 1, 1,
0.9507715, 1.334925, 1.856066, 1, 1, 1, 1, 1,
0.958768, 0.372345, 0.05060624, 1, 1, 1, 1, 1,
0.9602022, 0.8385088, 1.26528, 1, 1, 1, 1, 1,
0.9632016, 0.4648082, 2.232078, 1, 1, 1, 1, 1,
0.9636899, 1.143257, 0.2350197, 1, 1, 1, 1, 1,
0.9639651, -1.426529, 2.120007, 1, 1, 1, 1, 1,
0.9674706, 0.7928435, 0.1620347, 1, 1, 1, 1, 1,
0.9685994, -0.1988467, 1.36645, 1, 1, 1, 1, 1,
0.9693745, -0.4176137, 1.710044, 1, 1, 1, 1, 1,
0.9705779, -0.1900644, 2.401781, 1, 1, 1, 1, 1,
0.9706129, -1.78806, 4.307389, 1, 1, 1, 1, 1,
0.97067, 0.2195589, 2.302362, 1, 1, 1, 1, 1,
0.9746925, -0.9497615, 0.6323465, 0, 0, 1, 1, 1,
0.9906928, -0.5985155, 1.102187, 1, 0, 0, 1, 1,
0.9980192, -1.311544, 2.141142, 1, 0, 0, 1, 1,
0.999391, 0.413299, -0.52455, 1, 0, 0, 1, 1,
1.009841, 1.039567, 0.8910016, 1, 0, 0, 1, 1,
1.021814, 0.8921165, -0.4391256, 1, 0, 0, 1, 1,
1.026917, -0.9840243, 2.223906, 0, 0, 0, 1, 1,
1.02733, -0.2214283, 1.530864, 0, 0, 0, 1, 1,
1.030263, 0.08066801, 1.659004, 0, 0, 0, 1, 1,
1.034562, -0.3690836, 2.082836, 0, 0, 0, 1, 1,
1.038328, -0.874722, 2.129887, 0, 0, 0, 1, 1,
1.048053, 0.9753154, 0.4314746, 0, 0, 0, 1, 1,
1.049992, -1.572129, 2.170799, 0, 0, 0, 1, 1,
1.053272, 0.1371831, -0.6480948, 1, 1, 1, 1, 1,
1.057402, 1.204546, 1.106948, 1, 1, 1, 1, 1,
1.061669, 0.7538252, 0.4917362, 1, 1, 1, 1, 1,
1.066091, -0.1990047, 1.151079, 1, 1, 1, 1, 1,
1.067709, 0.7105691, 2.669243, 1, 1, 1, 1, 1,
1.074179, -1.667595, 4.27538, 1, 1, 1, 1, 1,
1.078351, -0.8495417, 4.351956, 1, 1, 1, 1, 1,
1.079998, -0.9719843, 2.366607, 1, 1, 1, 1, 1,
1.091151, -0.1722254, 3.038002, 1, 1, 1, 1, 1,
1.091188, 0.3864305, 1.850355, 1, 1, 1, 1, 1,
1.092929, 1.012182, 0.3490677, 1, 1, 1, 1, 1,
1.093146, 0.2357579, 2.267796, 1, 1, 1, 1, 1,
1.101345, -0.07414836, 1.519052, 1, 1, 1, 1, 1,
1.106371, -0.02644131, 0.7350314, 1, 1, 1, 1, 1,
1.110712, 0.2645521, 0.1798509, 1, 1, 1, 1, 1,
1.112892, -0.08316965, 1.750805, 0, 0, 1, 1, 1,
1.116837, -1.00611, 3.441117, 1, 0, 0, 1, 1,
1.11968, 0.4520535, -0.004593439, 1, 0, 0, 1, 1,
1.132683, -1.176631, 3.66691, 1, 0, 0, 1, 1,
1.133859, -0.001445079, 2.355275, 1, 0, 0, 1, 1,
1.144897, -0.6922228, 0.06484762, 1, 0, 0, 1, 1,
1.1516, 1.367379, 1.432727, 0, 0, 0, 1, 1,
1.15201, 0.8943514, 0.8085255, 0, 0, 0, 1, 1,
1.158719, 0.1161173, 0.4385329, 0, 0, 0, 1, 1,
1.161318, -1.10209, 2.337916, 0, 0, 0, 1, 1,
1.187915, 0.3130775, 0.4053127, 0, 0, 0, 1, 1,
1.189443, 0.5189503, 2.210957, 0, 0, 0, 1, 1,
1.189658, 0.2971742, 2.00685, 0, 0, 0, 1, 1,
1.193476, -0.376506, 1.511234, 1, 1, 1, 1, 1,
1.205002, -0.6993003, 2.688114, 1, 1, 1, 1, 1,
1.209962, -0.1838343, 0.3138145, 1, 1, 1, 1, 1,
1.219791, -1.343118, 3.828526, 1, 1, 1, 1, 1,
1.225061, 1.011488, 0.8155572, 1, 1, 1, 1, 1,
1.246857, -0.8868587, 1.384066, 1, 1, 1, 1, 1,
1.252952, -0.5099826, 1.353941, 1, 1, 1, 1, 1,
1.273705, -0.8523965, 2.230402, 1, 1, 1, 1, 1,
1.274677, -1.436476, 1.111429, 1, 1, 1, 1, 1,
1.282179, -0.7842869, 2.698504, 1, 1, 1, 1, 1,
1.282429, -0.9634388, 2.293419, 1, 1, 1, 1, 1,
1.290918, -0.637892, 2.744298, 1, 1, 1, 1, 1,
1.297018, 1.650106, 0.01427234, 1, 1, 1, 1, 1,
1.301167, -1.092152, 2.678219, 1, 1, 1, 1, 1,
1.309806, 0.03843517, 2.412706, 1, 1, 1, 1, 1,
1.315587, -0.274124, 3.241179, 0, 0, 1, 1, 1,
1.319413, -0.6780407, 1.9439, 1, 0, 0, 1, 1,
1.330795, 0.9516374, 0.237704, 1, 0, 0, 1, 1,
1.335041, -0.6881835, 1.031733, 1, 0, 0, 1, 1,
1.339709, -0.03183972, 0.8568991, 1, 0, 0, 1, 1,
1.339934, 0.7435183, 0.6173701, 1, 0, 0, 1, 1,
1.34327, -0.6234036, 1.384608, 0, 0, 0, 1, 1,
1.347489, -0.7089697, 1.34559, 0, 0, 0, 1, 1,
1.351132, -1.91018, 1.73148, 0, 0, 0, 1, 1,
1.354301, -0.6786082, 1.602632, 0, 0, 0, 1, 1,
1.356631, 0.2720563, 1.201505, 0, 0, 0, 1, 1,
1.356937, 0.4671806, 1.036084, 0, 0, 0, 1, 1,
1.36131, -1.014396, 4.034317, 0, 0, 0, 1, 1,
1.380669, 1.73826, 0.7559324, 1, 1, 1, 1, 1,
1.38303, 0.572421, 0.5398801, 1, 1, 1, 1, 1,
1.39098, -1.165806, 3.452816, 1, 1, 1, 1, 1,
1.396901, 0.8057458, 1.907049, 1, 1, 1, 1, 1,
1.405255, 1.080063, 1.971066, 1, 1, 1, 1, 1,
1.417515, 1.137707, 0.01804613, 1, 1, 1, 1, 1,
1.418293, -0.1532634, 2.635218, 1, 1, 1, 1, 1,
1.419511, 0.2512087, 0.222253, 1, 1, 1, 1, 1,
1.423749, 0.8707277, 2.385266, 1, 1, 1, 1, 1,
1.428758, -0.00862183, 0.2345187, 1, 1, 1, 1, 1,
1.42978, 0.3712491, 0.5930091, 1, 1, 1, 1, 1,
1.445896, 0.8671232, 2.76959, 1, 1, 1, 1, 1,
1.453346, -2.177883, 3.955817, 1, 1, 1, 1, 1,
1.463595, 0.5213668, 1.039404, 1, 1, 1, 1, 1,
1.466721, -2.601104, 1.597435, 1, 1, 1, 1, 1,
1.480323, 1.348169, 2.490508, 0, 0, 1, 1, 1,
1.487674, 0.1519193, 3.308422, 1, 0, 0, 1, 1,
1.491018, -0.5521474, 3.594836, 1, 0, 0, 1, 1,
1.508696, 0.6483424, 1.187681, 1, 0, 0, 1, 1,
1.508796, -1.204445, 0.8516159, 1, 0, 0, 1, 1,
1.513448, -0.3754576, 0.5821555, 1, 0, 0, 1, 1,
1.51392, -1.354925, 1.901219, 0, 0, 0, 1, 1,
1.514555, 0.3982046, 2.394306, 0, 0, 0, 1, 1,
1.515628, 1.75646, 1.461833, 0, 0, 0, 1, 1,
1.52059, 0.7820439, 1.10222, 0, 0, 0, 1, 1,
1.524236, 0.9672477, 0.3410925, 0, 0, 0, 1, 1,
1.532151, 0.9874576, 0.5778188, 0, 0, 0, 1, 1,
1.539165, 0.02420018, 1.074336, 0, 0, 0, 1, 1,
1.540313, -1.042898, 1.044147, 1, 1, 1, 1, 1,
1.546493, -1.250646, 1.54675, 1, 1, 1, 1, 1,
1.553187, -1.64677, 1.403892, 1, 1, 1, 1, 1,
1.576301, -0.601924, 0.8613048, 1, 1, 1, 1, 1,
1.587053, 2.345813, 0.08354659, 1, 1, 1, 1, 1,
1.598526, -1.545187, 3.480979, 1, 1, 1, 1, 1,
1.60015, 1.335646, 0.4687003, 1, 1, 1, 1, 1,
1.623006, -0.01518742, 1.211625, 1, 1, 1, 1, 1,
1.626979, 0.1742796, 3.936476, 1, 1, 1, 1, 1,
1.628551, 1.005797, 0.7563387, 1, 1, 1, 1, 1,
1.636704, -0.7159219, 1.345591, 1, 1, 1, 1, 1,
1.663067, -0.5860962, 2.553234, 1, 1, 1, 1, 1,
1.672905, -0.1970611, 3.108875, 1, 1, 1, 1, 1,
1.684953, 0.2215795, 1.137341, 1, 1, 1, 1, 1,
1.707073, 0.6671195, 2.411172, 1, 1, 1, 1, 1,
1.71633, 0.424219, 3.049947, 0, 0, 1, 1, 1,
1.733138, 0.1400374, 1.898563, 1, 0, 0, 1, 1,
1.736406, -0.3250737, 2.901194, 1, 0, 0, 1, 1,
1.746235, -1.150476, 1.206527, 1, 0, 0, 1, 1,
1.750302, -0.3932905, 2.652473, 1, 0, 0, 1, 1,
1.771838, 1.302152, -0.294829, 1, 0, 0, 1, 1,
1.776937, -0.5966354, 0.7159175, 0, 0, 0, 1, 1,
1.777506, 0.1749501, 2.285878, 0, 0, 0, 1, 1,
1.795904, 1.180254, 2.864844, 0, 0, 0, 1, 1,
1.800404, 0.9283767, 0.714367, 0, 0, 0, 1, 1,
1.815693, 0.3507232, 1.849604, 0, 0, 0, 1, 1,
1.842994, 0.4604233, 0.8529448, 0, 0, 0, 1, 1,
1.864461, -0.9496553, 1.4824, 0, 0, 0, 1, 1,
1.879787, 1.598528, 1.307138, 1, 1, 1, 1, 1,
1.93542, 0.8672582, 1.816595, 1, 1, 1, 1, 1,
1.937412, -0.5952384, 1.444572, 1, 1, 1, 1, 1,
1.949672, 0.1726235, 0.4467059, 1, 1, 1, 1, 1,
1.969842, -0.04856811, 2.306113, 1, 1, 1, 1, 1,
1.977262, 0.03356546, 2.048914, 1, 1, 1, 1, 1,
1.983312, -0.1137821, 2.140629, 1, 1, 1, 1, 1,
2.036268, -0.6457497, 4.324154, 1, 1, 1, 1, 1,
2.045078, -0.1175056, 1.697167, 1, 1, 1, 1, 1,
2.046416, 0.93014, 0.3268732, 1, 1, 1, 1, 1,
2.056403, 0.5728854, 1.229271, 1, 1, 1, 1, 1,
2.062328, 0.7989869, 2.051883, 1, 1, 1, 1, 1,
2.06563, -1.246397, 1.089162, 1, 1, 1, 1, 1,
2.070802, -0.9331, 2.823966, 1, 1, 1, 1, 1,
2.087361, -0.6515099, 2.410769, 1, 1, 1, 1, 1,
2.088314, -0.5668941, 1.187705, 0, 0, 1, 1, 1,
2.10701, -0.2381362, 0.09903515, 1, 0, 0, 1, 1,
2.135095, -1.139734, 2.633228, 1, 0, 0, 1, 1,
2.162567, -1.394147, 1.673267, 1, 0, 0, 1, 1,
2.247263, 1.393952, 0.2097184, 1, 0, 0, 1, 1,
2.260593, 1.6649, -0.7126342, 1, 0, 0, 1, 1,
2.266835, -0.9473742, 2.142029, 0, 0, 0, 1, 1,
2.296715, -1.109006, 1.81373, 0, 0, 0, 1, 1,
2.37206, -0.3347816, 0.7932906, 0, 0, 0, 1, 1,
2.416727, 0.6451481, 1.645374, 0, 0, 0, 1, 1,
2.419776, -0.4009436, 1.769366, 0, 0, 0, 1, 1,
2.433128, -2.013618, 3.575754, 0, 0, 0, 1, 1,
2.46334, -0.4473735, 0.0965631, 0, 0, 0, 1, 1,
2.629833, 0.3719676, 2.003235, 1, 1, 1, 1, 1,
2.664427, -1.083477, 2.008043, 1, 1, 1, 1, 1,
2.811405, -0.4620174, 1.834356, 1, 1, 1, 1, 1,
3.012602, 0.2253961, 0.8032982, 1, 1, 1, 1, 1,
3.03289, -0.2898107, 1.291893, 1, 1, 1, 1, 1,
3.079175, -1.094061, 2.062456, 1, 1, 1, 1, 1,
3.398034, 0.5647444, 2.896875, 1, 1, 1, 1, 1
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
var radius = 9.867364;
var distance = 34.6587;
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
mvMatrix.translate( -0.246079, -0.1288304, -0.2097797 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.6587);
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
