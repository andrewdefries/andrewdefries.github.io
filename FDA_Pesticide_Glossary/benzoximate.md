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
-3.099817, 2.17573, -1.434055, 1, 0, 0, 1,
-3.020455, -0.4197238, -2.1669, 1, 0.007843138, 0, 1,
-3.007617, 2.830456, -1.616932, 1, 0.01176471, 0, 1,
-2.886982, 1.403498, 0.9898646, 1, 0.01960784, 0, 1,
-2.810804, 0.785204, -1.288758, 1, 0.02352941, 0, 1,
-2.795143, -1.170627, -3.126784, 1, 0.03137255, 0, 1,
-2.57345, -0.2895507, -1.663324, 1, 0.03529412, 0, 1,
-2.531323, 0.1204933, -2.547033, 1, 0.04313726, 0, 1,
-2.510089, -0.7023444, -0.9635727, 1, 0.04705882, 0, 1,
-2.496688, -0.6004378, -1.737592, 1, 0.05490196, 0, 1,
-2.449179, 0.3663194, -1.967994, 1, 0.05882353, 0, 1,
-2.407555, 1.144998, -1.533591, 1, 0.06666667, 0, 1,
-2.384641, 1.891065, -2.454322, 1, 0.07058824, 0, 1,
-2.320036, 0.8081365, -0.8542984, 1, 0.07843138, 0, 1,
-2.229086, -0.3165674, -2.979825, 1, 0.08235294, 0, 1,
-2.218795, -0.1316431, -1.732946, 1, 0.09019608, 0, 1,
-2.205555, 0.383691, -0.651408, 1, 0.09411765, 0, 1,
-2.188917, -0.6359447, 0.2048123, 1, 0.1019608, 0, 1,
-2.183338, -0.399163, -0.9742222, 1, 0.1098039, 0, 1,
-2.091558, -0.3869667, -1.286052, 1, 0.1137255, 0, 1,
-2.088289, 1.90526, -1.224643, 1, 0.1215686, 0, 1,
-2.07219, 0.3319989, -1.827401, 1, 0.1254902, 0, 1,
-2.017214, -1.538282, -3.027004, 1, 0.1333333, 0, 1,
-2.016272, 0.7837918, -2.720956, 1, 0.1372549, 0, 1,
-1.978139, 0.1442624, -1.342466, 1, 0.145098, 0, 1,
-1.936956, -0.6102212, -0.526046, 1, 0.1490196, 0, 1,
-1.918478, 1.409005, -2.862254, 1, 0.1568628, 0, 1,
-1.917993, -0.5846326, -2.320648, 1, 0.1607843, 0, 1,
-1.907658, 0.3331273, -0.5960608, 1, 0.1686275, 0, 1,
-1.898763, 0.5741519, 0.1132462, 1, 0.172549, 0, 1,
-1.832773, -0.3655092, -2.06646, 1, 0.1803922, 0, 1,
-1.828134, -0.3294752, -2.739937, 1, 0.1843137, 0, 1,
-1.809239, 0.599175, -0.2280914, 1, 0.1921569, 0, 1,
-1.800822, 0.1093066, -0.2430196, 1, 0.1960784, 0, 1,
-1.756965, -1.378753, -3.891224, 1, 0.2039216, 0, 1,
-1.748627, 1.619976, -0.08953735, 1, 0.2117647, 0, 1,
-1.73515, 2.427088, -1.804452, 1, 0.2156863, 0, 1,
-1.732031, -0.614947, -1.954046, 1, 0.2235294, 0, 1,
-1.655732, -0.8603216, -3.709545, 1, 0.227451, 0, 1,
-1.655362, 1.090301, -2.233547, 1, 0.2352941, 0, 1,
-1.655149, 1.797522, -0.512495, 1, 0.2392157, 0, 1,
-1.645811, 1.826376, -1.281912, 1, 0.2470588, 0, 1,
-1.644635, -1.093756, -2.625723, 1, 0.2509804, 0, 1,
-1.638613, 1.49834, 1.782492, 1, 0.2588235, 0, 1,
-1.613504, 0.6595799, -2.838951, 1, 0.2627451, 0, 1,
-1.594276, 0.5214832, -4.318007, 1, 0.2705882, 0, 1,
-1.586572, -1.980717, -4.227081, 1, 0.2745098, 0, 1,
-1.586022, 1.124679, -0.3531787, 1, 0.282353, 0, 1,
-1.579239, -0.5033916, -4.215822, 1, 0.2862745, 0, 1,
-1.57823, -0.6255372, -1.191674, 1, 0.2941177, 0, 1,
-1.578089, 0.5904339, -1.573089, 1, 0.3019608, 0, 1,
-1.567766, 0.2100648, 0.570918, 1, 0.3058824, 0, 1,
-1.551233, 0.3290822, -1.714813, 1, 0.3137255, 0, 1,
-1.550955, -0.4341644, -0.694644, 1, 0.3176471, 0, 1,
-1.539434, 0.6105182, 0.2292888, 1, 0.3254902, 0, 1,
-1.529708, -1.316006, -3.246952, 1, 0.3294118, 0, 1,
-1.521073, 0.361143, -1.389967, 1, 0.3372549, 0, 1,
-1.519212, -0.6664323, -3.748463, 1, 0.3411765, 0, 1,
-1.509598, 0.04557862, -2.262105, 1, 0.3490196, 0, 1,
-1.456221, -0.2542655, -1.24603, 1, 0.3529412, 0, 1,
-1.444517, -0.009383656, -0.9378963, 1, 0.3607843, 0, 1,
-1.433769, 1.335661, -1.175107, 1, 0.3647059, 0, 1,
-1.429968, -0.4736255, -2.903942, 1, 0.372549, 0, 1,
-1.426901, -0.05909147, -1.887656, 1, 0.3764706, 0, 1,
-1.426037, -0.1414861, -1.823995, 1, 0.3843137, 0, 1,
-1.424273, 0.02578229, -1.456228, 1, 0.3882353, 0, 1,
-1.422833, 1.25806, -1.246488, 1, 0.3960784, 0, 1,
-1.401508, -0.9427087, -1.107751, 1, 0.4039216, 0, 1,
-1.394061, 2.187943, -1.195504, 1, 0.4078431, 0, 1,
-1.381068, -0.8339617, -1.690722, 1, 0.4156863, 0, 1,
-1.378581, -1.688508, -0.6546528, 1, 0.4196078, 0, 1,
-1.377637, 0.3796835, -0.1652439, 1, 0.427451, 0, 1,
-1.36577, -1.188856, -1.922776, 1, 0.4313726, 0, 1,
-1.363773, 0.8593889, -1.978326, 1, 0.4392157, 0, 1,
-1.354077, 0.2307338, -3.906015, 1, 0.4431373, 0, 1,
-1.352137, -1.872679, -0.3103607, 1, 0.4509804, 0, 1,
-1.345168, 1.713211, 0.4184786, 1, 0.454902, 0, 1,
-1.342026, -2.278796, -2.101388, 1, 0.4627451, 0, 1,
-1.329742, 1.589688, -1.173732, 1, 0.4666667, 0, 1,
-1.32724, 1.472938, -0.06699792, 1, 0.4745098, 0, 1,
-1.307377, 0.5608053, -3.268156, 1, 0.4784314, 0, 1,
-1.305697, 0.4410037, -0.9570154, 1, 0.4862745, 0, 1,
-1.302808, -0.880163, -0.4874667, 1, 0.4901961, 0, 1,
-1.281985, -0.4973719, -3.430942, 1, 0.4980392, 0, 1,
-1.27738, 0.9491078, -1.365946, 1, 0.5058824, 0, 1,
-1.275319, -0.2718107, -1.144947, 1, 0.509804, 0, 1,
-1.275134, 1.353972, 2.285983, 1, 0.5176471, 0, 1,
-1.2647, 0.4369435, -0.9398083, 1, 0.5215687, 0, 1,
-1.256042, 0.9753137, -1.150702, 1, 0.5294118, 0, 1,
-1.251256, 0.1959335, -3.094338, 1, 0.5333334, 0, 1,
-1.247238, -0.5006126, -1.649414, 1, 0.5411765, 0, 1,
-1.24492, -0.453142, -2.588168, 1, 0.5450981, 0, 1,
-1.240533, -0.04510316, 0.2777761, 1, 0.5529412, 0, 1,
-1.239246, -1.219071, -2.963558, 1, 0.5568628, 0, 1,
-1.238468, -0.0525143, -1.903198, 1, 0.5647059, 0, 1,
-1.236429, -1.888159, -0.7157875, 1, 0.5686275, 0, 1,
-1.23397, -2.071907, -0.2265556, 1, 0.5764706, 0, 1,
-1.233788, 1.137681, -1.424316, 1, 0.5803922, 0, 1,
-1.230712, -0.2068358, -0.7454615, 1, 0.5882353, 0, 1,
-1.230267, 1.871072, -1.850703, 1, 0.5921569, 0, 1,
-1.230197, -0.1348078, -2.893589, 1, 0.6, 0, 1,
-1.225739, 0.4591214, -1.727131, 1, 0.6078432, 0, 1,
-1.224412, 0.08913515, -3.413505, 1, 0.6117647, 0, 1,
-1.223616, 1.269678, -0.7651302, 1, 0.6196079, 0, 1,
-1.21944, -0.1701536, -1.426874, 1, 0.6235294, 0, 1,
-1.213119, 0.4664074, -1.654993, 1, 0.6313726, 0, 1,
-1.210482, -0.3508325, -0.8032534, 1, 0.6352941, 0, 1,
-1.208902, -2.754403, -3.038478, 1, 0.6431373, 0, 1,
-1.20731, 0.08854537, -3.58395, 1, 0.6470588, 0, 1,
-1.195411, -0.02936771, -1.852593, 1, 0.654902, 0, 1,
-1.190707, 1.35347, -1.945775, 1, 0.6588235, 0, 1,
-1.185975, -0.1413678, -2.497289, 1, 0.6666667, 0, 1,
-1.184267, -0.007249092, -0.6677536, 1, 0.6705883, 0, 1,
-1.17961, -0.1418655, -1.05006, 1, 0.6784314, 0, 1,
-1.176915, -1.248847, -2.595671, 1, 0.682353, 0, 1,
-1.17354, -0.1225597, -2.350521, 1, 0.6901961, 0, 1,
-1.167494, 0.5084971, -1.137868, 1, 0.6941177, 0, 1,
-1.167345, 0.2470184, -2.673557, 1, 0.7019608, 0, 1,
-1.166796, -1.166834, -2.147148, 1, 0.7098039, 0, 1,
-1.166563, -0.03771189, -0.6354862, 1, 0.7137255, 0, 1,
-1.164418, -0.7762539, -2.845461, 1, 0.7215686, 0, 1,
-1.152521, 0.5385261, -0.02192846, 1, 0.7254902, 0, 1,
-1.148614, -1.097624, -1.162559, 1, 0.7333333, 0, 1,
-1.144736, 0.430616, -0.1394699, 1, 0.7372549, 0, 1,
-1.143992, -1.244839, -1.816334, 1, 0.7450981, 0, 1,
-1.142865, 0.6535611, -0.8627775, 1, 0.7490196, 0, 1,
-1.141835, 0.1477446, -0.3742082, 1, 0.7568628, 0, 1,
-1.141356, -0.5199459, -2.623102, 1, 0.7607843, 0, 1,
-1.140206, -0.6134161, -1.117494, 1, 0.7686275, 0, 1,
-1.137668, 0.3292819, -0.5790963, 1, 0.772549, 0, 1,
-1.122647, -0.612453, -1.323206, 1, 0.7803922, 0, 1,
-1.121844, -0.6217248, -2.369631, 1, 0.7843137, 0, 1,
-1.11897, 0.1110606, -1.896891, 1, 0.7921569, 0, 1,
-1.11714, 0.9599708, -2.403946, 1, 0.7960784, 0, 1,
-1.117131, 0.008613636, -1.07475, 1, 0.8039216, 0, 1,
-1.095881, 0.5743106, -2.427596, 1, 0.8117647, 0, 1,
-1.09135, 1.830796, -0.1575005, 1, 0.8156863, 0, 1,
-1.083776, -0.02531531, -1.845539, 1, 0.8235294, 0, 1,
-1.083435, -0.7830571, -0.5592136, 1, 0.827451, 0, 1,
-1.070278, -0.3730246, -0.743077, 1, 0.8352941, 0, 1,
-1.068823, -2.082814, -2.270586, 1, 0.8392157, 0, 1,
-1.063555, 0.8718739, -2.397992, 1, 0.8470588, 0, 1,
-1.057345, -0.1198453, -2.895907, 1, 0.8509804, 0, 1,
-1.052316, -0.8079612, -2.639481, 1, 0.8588235, 0, 1,
-1.046131, -0.8878528, -1.291008, 1, 0.8627451, 0, 1,
-1.045743, -1.002876, -1.971926, 1, 0.8705882, 0, 1,
-1.041346, 0.08290777, -0.7504044, 1, 0.8745098, 0, 1,
-1.038028, 0.9339229, -1.049191, 1, 0.8823529, 0, 1,
-1.028703, 0.7777647, -0.1979022, 1, 0.8862745, 0, 1,
-1.026839, -0.9448509, -3.159219, 1, 0.8941177, 0, 1,
-1.026387, 0.8505858, -0.2660965, 1, 0.8980392, 0, 1,
-1.022987, 0.9263828, 0.4319223, 1, 0.9058824, 0, 1,
-1.01729, 2.370152, 0.1471921, 1, 0.9137255, 0, 1,
-1.016382, 1.194593, -1.878887, 1, 0.9176471, 0, 1,
-1.011081, 1.905848, -1.939301, 1, 0.9254902, 0, 1,
-1.006587, -1.055158, -1.97655, 1, 0.9294118, 0, 1,
-1.005065, -0.1302432, -2.580422, 1, 0.9372549, 0, 1,
-1.001075, -1.384316, -3.193222, 1, 0.9411765, 0, 1,
-0.9942334, 0.8264609, -1.450155, 1, 0.9490196, 0, 1,
-0.9923698, 1.951683, -2.213625, 1, 0.9529412, 0, 1,
-0.9900805, -0.2061981, -2.311452, 1, 0.9607843, 0, 1,
-0.9822037, 0.1028257, -1.279595, 1, 0.9647059, 0, 1,
-0.9820134, 0.3102339, -1.273217, 1, 0.972549, 0, 1,
-0.981469, -0.2314447, 0.3036391, 1, 0.9764706, 0, 1,
-0.9776706, 0.9797761, 0.2322762, 1, 0.9843137, 0, 1,
-0.9760199, 0.07034612, -1.553774, 1, 0.9882353, 0, 1,
-0.9675197, -0.01632185, -0.3562866, 1, 0.9960784, 0, 1,
-0.9659498, -0.7282264, -2.182223, 0.9960784, 1, 0, 1,
-0.9657584, 1.248204, -0.5449277, 0.9921569, 1, 0, 1,
-0.9531233, 0.432189, -1.410048, 0.9843137, 1, 0, 1,
-0.94758, 0.8387012, 0.04727659, 0.9803922, 1, 0, 1,
-0.9470536, 0.9880157, -1.522677, 0.972549, 1, 0, 1,
-0.9461028, 0.2946169, -1.107941, 0.9686275, 1, 0, 1,
-0.9434296, -0.1370558, -1.718013, 0.9607843, 1, 0, 1,
-0.940923, 0.6717039, 0.98974, 0.9568627, 1, 0, 1,
-0.9389133, -1.887897, -2.105259, 0.9490196, 1, 0, 1,
-0.9359673, 0.4763746, -2.370933, 0.945098, 1, 0, 1,
-0.9316022, -0.5109996, -0.1774668, 0.9372549, 1, 0, 1,
-0.9308385, 1.043168, -0.6482454, 0.9333333, 1, 0, 1,
-0.9290218, -0.5686907, -1.797668, 0.9254902, 1, 0, 1,
-0.9274155, 0.4149553, 0.2746635, 0.9215686, 1, 0, 1,
-0.9250386, -0.1386515, -0.6170613, 0.9137255, 1, 0, 1,
-0.9218068, -1.320651, -0.9846506, 0.9098039, 1, 0, 1,
-0.9165745, 1.060557, 1.040025, 0.9019608, 1, 0, 1,
-0.915686, -0.3579918, -1.731628, 0.8941177, 1, 0, 1,
-0.9123849, 1.161604, -1.186257, 0.8901961, 1, 0, 1,
-0.8850312, 0.3918904, -0.780956, 0.8823529, 1, 0, 1,
-0.8836303, 0.1843065, -1.90216, 0.8784314, 1, 0, 1,
-0.8819854, 0.8286222, -1.401639, 0.8705882, 1, 0, 1,
-0.8774026, 1.218367, -1.250911, 0.8666667, 1, 0, 1,
-0.8740798, -0.298514, -1.100935, 0.8588235, 1, 0, 1,
-0.8737985, -1.842682, -2.512612, 0.854902, 1, 0, 1,
-0.8632175, 0.2912109, -1.942701, 0.8470588, 1, 0, 1,
-0.8625211, 0.3358867, -0.8711846, 0.8431373, 1, 0, 1,
-0.8532086, -0.2930355, -2.621695, 0.8352941, 1, 0, 1,
-0.8440785, 1.903375, -0.3092552, 0.8313726, 1, 0, 1,
-0.8434796, 0.9165199, -0.2172854, 0.8235294, 1, 0, 1,
-0.8429061, 0.223469, -3.947163, 0.8196079, 1, 0, 1,
-0.8335747, -0.5520831, -2.453382, 0.8117647, 1, 0, 1,
-0.8296176, -1.144367, -1.944199, 0.8078431, 1, 0, 1,
-0.827152, 0.08096174, -0.3860601, 0.8, 1, 0, 1,
-0.8198838, -1.498796, -4.746259, 0.7921569, 1, 0, 1,
-0.8145508, -0.6738083, -3.286176, 0.7882353, 1, 0, 1,
-0.8131272, 0.1704048, 0.1766992, 0.7803922, 1, 0, 1,
-0.7999157, 0.2775424, -1.338998, 0.7764706, 1, 0, 1,
-0.7956568, -1.213158, -1.178191, 0.7686275, 1, 0, 1,
-0.7944862, -0.7548636, -1.599086, 0.7647059, 1, 0, 1,
-0.7898931, -0.9902351, -2.050894, 0.7568628, 1, 0, 1,
-0.788095, -0.9918898, -3.650043, 0.7529412, 1, 0, 1,
-0.787779, -0.3396832, -3.517535, 0.7450981, 1, 0, 1,
-0.7861796, 1.143745, -0.4732613, 0.7411765, 1, 0, 1,
-0.7837657, -0.4372233, -0.2844011, 0.7333333, 1, 0, 1,
-0.7834218, 0.6488227, -2.501776, 0.7294118, 1, 0, 1,
-0.7765782, -1.376068, -2.851826, 0.7215686, 1, 0, 1,
-0.7761839, -0.4304259, -1.896108, 0.7176471, 1, 0, 1,
-0.7728044, -0.9780954, -2.668945, 0.7098039, 1, 0, 1,
-0.760062, -0.2067408, 1.709117, 0.7058824, 1, 0, 1,
-0.7578579, -1.385723, -0.4187392, 0.6980392, 1, 0, 1,
-0.7458752, -1.55847, -3.660712, 0.6901961, 1, 0, 1,
-0.744063, -0.7123938, -2.008518, 0.6862745, 1, 0, 1,
-0.743899, 0.9957705, -0.6909571, 0.6784314, 1, 0, 1,
-0.7417043, 1.209741, -0.0795891, 0.6745098, 1, 0, 1,
-0.7267147, -0.623847, -1.832269, 0.6666667, 1, 0, 1,
-0.7234226, 0.3227139, -2.645711, 0.6627451, 1, 0, 1,
-0.7222964, -0.9321807, -3.596258, 0.654902, 1, 0, 1,
-0.7207259, 0.6114761, -0.1964001, 0.6509804, 1, 0, 1,
-0.7201728, 0.1631515, -0.08136895, 0.6431373, 1, 0, 1,
-0.7196253, 0.87409, -0.1381105, 0.6392157, 1, 0, 1,
-0.7169004, 0.7063693, -2.524494, 0.6313726, 1, 0, 1,
-0.7165205, 0.9120489, -0.3474433, 0.627451, 1, 0, 1,
-0.7158767, 1.548042, 0.4620282, 0.6196079, 1, 0, 1,
-0.7146971, -0.4200724, -0.05709885, 0.6156863, 1, 0, 1,
-0.7126388, 1.117062, 0.4480549, 0.6078432, 1, 0, 1,
-0.7122717, -0.03010449, -1.878917, 0.6039216, 1, 0, 1,
-0.7099034, -1.350645, -1.330465, 0.5960785, 1, 0, 1,
-0.70987, 1.271884, -2.093539, 0.5882353, 1, 0, 1,
-0.7072735, 0.497787, -0.333862, 0.5843138, 1, 0, 1,
-0.7062744, 2.314924, -0.4697125, 0.5764706, 1, 0, 1,
-0.7046239, -0.6858167, -1.704803, 0.572549, 1, 0, 1,
-0.7024869, -0.6203833, -2.916209, 0.5647059, 1, 0, 1,
-0.7003748, 1.215865, 0.6254537, 0.5607843, 1, 0, 1,
-0.6991984, 0.03090338, -1.184316, 0.5529412, 1, 0, 1,
-0.695169, 0.1978179, -1.369854, 0.5490196, 1, 0, 1,
-0.6938746, 0.7156662, -1.035962, 0.5411765, 1, 0, 1,
-0.6881462, -1.065439, -4.537878, 0.5372549, 1, 0, 1,
-0.6839362, -0.6841007, -2.632118, 0.5294118, 1, 0, 1,
-0.6824204, -0.02545146, -2.045639, 0.5254902, 1, 0, 1,
-0.6803236, -1.422859, -1.715742, 0.5176471, 1, 0, 1,
-0.6787975, 0.4457653, -1.464122, 0.5137255, 1, 0, 1,
-0.6780482, 0.1139437, -0.4671802, 0.5058824, 1, 0, 1,
-0.6738558, 0.02557142, -1.30928, 0.5019608, 1, 0, 1,
-0.6706973, -0.3427922, -2.005998, 0.4941176, 1, 0, 1,
-0.6621193, -0.2323379, -3.29975, 0.4862745, 1, 0, 1,
-0.6558784, 1.175524, -1.987519, 0.4823529, 1, 0, 1,
-0.6505185, 0.9163149, 0.167618, 0.4745098, 1, 0, 1,
-0.6498898, -0.2601757, -2.007499, 0.4705882, 1, 0, 1,
-0.6485845, -0.1707468, -3.085828, 0.4627451, 1, 0, 1,
-0.6453407, 0.4270251, -0.7565763, 0.4588235, 1, 0, 1,
-0.6410221, -0.353419, 0.5320181, 0.4509804, 1, 0, 1,
-0.6393934, -0.5420015, -2.771576, 0.4470588, 1, 0, 1,
-0.6386159, 0.4766828, -1.651937, 0.4392157, 1, 0, 1,
-0.6321943, -0.5498249, -1.948745, 0.4352941, 1, 0, 1,
-0.6308353, -0.08733916, -0.9076154, 0.427451, 1, 0, 1,
-0.6287124, 1.238063, 1.189807, 0.4235294, 1, 0, 1,
-0.627857, -0.6188301, -1.427415, 0.4156863, 1, 0, 1,
-0.6240169, -2.141729, -2.672321, 0.4117647, 1, 0, 1,
-0.6235503, -0.1286443, 1.299416, 0.4039216, 1, 0, 1,
-0.6223962, -1.207324, -2.814927, 0.3960784, 1, 0, 1,
-0.6202059, 0.8733557, -0.8461713, 0.3921569, 1, 0, 1,
-0.6179618, -1.228393, -2.246998, 0.3843137, 1, 0, 1,
-0.6144479, -0.1052848, -2.28522, 0.3803922, 1, 0, 1,
-0.6034985, -0.4874582, -2.583905, 0.372549, 1, 0, 1,
-0.5998366, -1.275986, -1.549051, 0.3686275, 1, 0, 1,
-0.5975429, -1.728574, -1.393873, 0.3607843, 1, 0, 1,
-0.5955593, -1.201999, -2.359735, 0.3568628, 1, 0, 1,
-0.5932602, 0.6331862, 0.5046055, 0.3490196, 1, 0, 1,
-0.5829976, 3.200032, -0.6466455, 0.345098, 1, 0, 1,
-0.5788571, 0.1941973, -0.4316828, 0.3372549, 1, 0, 1,
-0.5758644, 0.2489099, 0.07681724, 0.3333333, 1, 0, 1,
-0.5697432, 0.7159343, 0.9873689, 0.3254902, 1, 0, 1,
-0.5638077, 1.487671, -0.6389569, 0.3215686, 1, 0, 1,
-0.562604, 0.9772606, 0.1419238, 0.3137255, 1, 0, 1,
-0.56095, -0.2023358, -2.135471, 0.3098039, 1, 0, 1,
-0.5590838, 0.1450116, -1.872848, 0.3019608, 1, 0, 1,
-0.5590187, -0.9811426, -0.7969852, 0.2941177, 1, 0, 1,
-0.558265, -0.17058, -2.32769, 0.2901961, 1, 0, 1,
-0.5566971, -0.1907728, -1.083632, 0.282353, 1, 0, 1,
-0.548421, -1.315915, -2.669144, 0.2784314, 1, 0, 1,
-0.5466589, 0.4989045, -1.634299, 0.2705882, 1, 0, 1,
-0.5408203, -0.1571454, -1.178934, 0.2666667, 1, 0, 1,
-0.537508, -2.395886, -3.076129, 0.2588235, 1, 0, 1,
-0.5325509, 1.241267, 0.2590353, 0.254902, 1, 0, 1,
-0.5311283, 2.043479, -1.09597, 0.2470588, 1, 0, 1,
-0.5305579, -1.543085, -1.53502, 0.2431373, 1, 0, 1,
-0.5209696, 1.221356, -1.42827, 0.2352941, 1, 0, 1,
-0.5119097, 1.233179, 1.054241, 0.2313726, 1, 0, 1,
-0.5105582, -0.0629845, -2.290957, 0.2235294, 1, 0, 1,
-0.5061431, -0.8033256, -0.5018509, 0.2196078, 1, 0, 1,
-0.4967999, -1.092608, -3.017539, 0.2117647, 1, 0, 1,
-0.4958866, -0.223057, -2.125631, 0.2078431, 1, 0, 1,
-0.4890279, 0.5025403, -0.7805363, 0.2, 1, 0, 1,
-0.4881724, -0.7652893, -3.155399, 0.1921569, 1, 0, 1,
-0.4878272, -0.3287875, -3.561643, 0.1882353, 1, 0, 1,
-0.4871892, 0.6013638, -0.1886531, 0.1803922, 1, 0, 1,
-0.4866103, 0.7238482, -1.46572, 0.1764706, 1, 0, 1,
-0.4845526, -0.3729074, -0.6857834, 0.1686275, 1, 0, 1,
-0.4826848, -0.001462135, -2.284872, 0.1647059, 1, 0, 1,
-0.4810985, -0.132908, -2.128133, 0.1568628, 1, 0, 1,
-0.4777645, -0.8769066, -2.021455, 0.1529412, 1, 0, 1,
-0.4769942, 0.693953, -1.156672, 0.145098, 1, 0, 1,
-0.4682031, 1.402391, 0.1968603, 0.1411765, 1, 0, 1,
-0.4678868, -0.1474379, -2.959686, 0.1333333, 1, 0, 1,
-0.4678446, -0.6289634, -2.727653, 0.1294118, 1, 0, 1,
-0.4621862, 1.801717, -1.188905, 0.1215686, 1, 0, 1,
-0.4581504, 0.5835144, 1.292989, 0.1176471, 1, 0, 1,
-0.4572276, 2.097847, 0.5706212, 0.1098039, 1, 0, 1,
-0.4567199, 0.8804032, -1.764375, 0.1058824, 1, 0, 1,
-0.4528185, -0.007847309, -0.8085546, 0.09803922, 1, 0, 1,
-0.4515755, 0.6908007, -1.358889, 0.09019608, 1, 0, 1,
-0.4493384, -0.7381089, -3.043171, 0.08627451, 1, 0, 1,
-0.4490676, 0.7184241, -1.380702, 0.07843138, 1, 0, 1,
-0.4461095, -1.873012, -4.426744, 0.07450981, 1, 0, 1,
-0.4438597, 0.9310673, -1.207973, 0.06666667, 1, 0, 1,
-0.4437061, 0.3927183, -1.499407, 0.0627451, 1, 0, 1,
-0.4409409, 0.2670119, -0.7491843, 0.05490196, 1, 0, 1,
-0.4407103, -0.185872, -0.5242216, 0.05098039, 1, 0, 1,
-0.4374709, -0.005267165, -0.9857209, 0.04313726, 1, 0, 1,
-0.4361852, -0.1072823, -2.503402, 0.03921569, 1, 0, 1,
-0.432553, 1.039459, 0.914236, 0.03137255, 1, 0, 1,
-0.4288554, 1.407543, -1.775731, 0.02745098, 1, 0, 1,
-0.4217563, -0.0473679, -1.556648, 0.01960784, 1, 0, 1,
-0.4160756, -0.7381001, -3.025972, 0.01568628, 1, 0, 1,
-0.4149395, 0.1801154, -0.2454865, 0.007843138, 1, 0, 1,
-0.407706, 0.8135033, -1.406456, 0.003921569, 1, 0, 1,
-0.4061845, 1.241767, -0.3913357, 0, 1, 0.003921569, 1,
-0.4061376, 0.3545857, -2.5871, 0, 1, 0.01176471, 1,
-0.4057156, -0.03764043, -1.674485, 0, 1, 0.01568628, 1,
-0.4046555, -0.5665683, -2.178121, 0, 1, 0.02352941, 1,
-0.4001847, 0.9426904, -0.2053542, 0, 1, 0.02745098, 1,
-0.3988267, 1.63691, 0.2195293, 0, 1, 0.03529412, 1,
-0.3957249, 0.6598638, 2.143975, 0, 1, 0.03921569, 1,
-0.3868957, -1.6107, -4.213429, 0, 1, 0.04705882, 1,
-0.3836262, -0.5718137, -2.890542, 0, 1, 0.05098039, 1,
-0.3828858, 0.1198713, -2.597626, 0, 1, 0.05882353, 1,
-0.3808913, -0.5235772, -3.035573, 0, 1, 0.0627451, 1,
-0.3802337, -0.5637015, -3.071301, 0, 1, 0.07058824, 1,
-0.3801123, 0.4752285, -0.8007027, 0, 1, 0.07450981, 1,
-0.378289, 0.4149631, -1.10588, 0, 1, 0.08235294, 1,
-0.3760438, 0.8731602, 0.1388829, 0, 1, 0.08627451, 1,
-0.3736669, 0.4205062, -2.076348, 0, 1, 0.09411765, 1,
-0.3722845, 0.4745636, -0.481618, 0, 1, 0.1019608, 1,
-0.3720614, -0.05931865, -2.341375, 0, 1, 0.1058824, 1,
-0.3664062, -0.9185277, -2.836511, 0, 1, 0.1137255, 1,
-0.3661593, -1.72367, -0.7191569, 0, 1, 0.1176471, 1,
-0.3623152, -1.966955, -3.421039, 0, 1, 0.1254902, 1,
-0.3570949, -0.7800034, -1.247854, 0, 1, 0.1294118, 1,
-0.356645, -0.07427998, -2.994583, 0, 1, 0.1372549, 1,
-0.3563688, -1.31111, -2.146697, 0, 1, 0.1411765, 1,
-0.356009, -0.6627893, -3.029391, 0, 1, 0.1490196, 1,
-0.3550525, -0.1239571, -2.649936, 0, 1, 0.1529412, 1,
-0.3520893, 0.6837673, -0.6134365, 0, 1, 0.1607843, 1,
-0.3514332, -1.387397, -1.663475, 0, 1, 0.1647059, 1,
-0.3494054, 0.3010439, 0.2475395, 0, 1, 0.172549, 1,
-0.3448863, 1.32362, -1.453866, 0, 1, 0.1764706, 1,
-0.3391801, -0.9873388, -1.25002, 0, 1, 0.1843137, 1,
-0.338149, -1.209912, -2.790275, 0, 1, 0.1882353, 1,
-0.3341208, -0.2998175, -3.155537, 0, 1, 0.1960784, 1,
-0.3320467, -0.4331711, -2.991286, 0, 1, 0.2039216, 1,
-0.325927, 0.7961953, 0.6964454, 0, 1, 0.2078431, 1,
-0.3229523, -0.2465384, -1.002133, 0, 1, 0.2156863, 1,
-0.3220666, -0.1938269, -2.82866, 0, 1, 0.2196078, 1,
-0.3220268, -1.63682, -2.698035, 0, 1, 0.227451, 1,
-0.3198268, 0.2052827, -2.914575, 0, 1, 0.2313726, 1,
-0.3032403, -0.8727605, -2.353948, 0, 1, 0.2392157, 1,
-0.303066, 1.671418, 0.1422883, 0, 1, 0.2431373, 1,
-0.2965006, 0.8849566, -0.1626188, 0, 1, 0.2509804, 1,
-0.2955188, 0.84405, -0.7147139, 0, 1, 0.254902, 1,
-0.294266, 1.652566, -1.151875, 0, 1, 0.2627451, 1,
-0.2938114, 0.03827211, -1.544701, 0, 1, 0.2666667, 1,
-0.2924216, 0.9875187, -0.6728991, 0, 1, 0.2745098, 1,
-0.2846335, 0.1271601, -0.8620973, 0, 1, 0.2784314, 1,
-0.2832775, -0.7781072, -2.684124, 0, 1, 0.2862745, 1,
-0.2803596, 0.1870042, -2.015019, 0, 1, 0.2901961, 1,
-0.2766952, -0.04417472, -2.495521, 0, 1, 0.2980392, 1,
-0.2756334, 0.3245749, 0.7600235, 0, 1, 0.3058824, 1,
-0.2748661, -0.3451487, -0.8611557, 0, 1, 0.3098039, 1,
-0.2694936, 1.517245, 0.8401947, 0, 1, 0.3176471, 1,
-0.2668406, 0.5101576, 1.73282, 0, 1, 0.3215686, 1,
-0.2647834, 0.01556406, -0.7922798, 0, 1, 0.3294118, 1,
-0.2566988, -0.9306796, -3.713421, 0, 1, 0.3333333, 1,
-0.246052, -0.6709448, -1.32165, 0, 1, 0.3411765, 1,
-0.2452523, 1.363323, -1.870972, 0, 1, 0.345098, 1,
-0.2387937, -0.2509539, -2.487858, 0, 1, 0.3529412, 1,
-0.2374004, 2.257991, -0.4470202, 0, 1, 0.3568628, 1,
-0.2309166, 0.9304146, -0.45168, 0, 1, 0.3647059, 1,
-0.2291449, -0.4581265, -2.561509, 0, 1, 0.3686275, 1,
-0.2278963, 0.01527654, -2.554976, 0, 1, 0.3764706, 1,
-0.2275802, 1.533993, -1.716672, 0, 1, 0.3803922, 1,
-0.2260463, 0.2261013, 0.0999492, 0, 1, 0.3882353, 1,
-0.2256761, -1.133105, -4.795228, 0, 1, 0.3921569, 1,
-0.224282, -0.8946953, -3.433635, 0, 1, 0.4, 1,
-0.2242454, -0.001795676, -1.217867, 0, 1, 0.4078431, 1,
-0.2217311, 0.9807785, 0.4741471, 0, 1, 0.4117647, 1,
-0.2197952, -1.132229, -1.719755, 0, 1, 0.4196078, 1,
-0.2186075, -0.6147395, -2.918401, 0, 1, 0.4235294, 1,
-0.2185311, 0.7688247, -0.1385046, 0, 1, 0.4313726, 1,
-0.2178622, 1.731951, -0.8582224, 0, 1, 0.4352941, 1,
-0.2176187, 0.7051131, 1.461427, 0, 1, 0.4431373, 1,
-0.2149938, -0.6787031, -2.827416, 0, 1, 0.4470588, 1,
-0.2130222, -0.7974237, -4.495234, 0, 1, 0.454902, 1,
-0.2129689, 0.936654, 0.5240592, 0, 1, 0.4588235, 1,
-0.2118194, 0.3887623, -1.620921, 0, 1, 0.4666667, 1,
-0.2103887, 1.968587, -0.7691715, 0, 1, 0.4705882, 1,
-0.2067132, -0.3957871, -1.676576, 0, 1, 0.4784314, 1,
-0.2044768, 1.717326, 0.3799759, 0, 1, 0.4823529, 1,
-0.2017113, 1.132289, 0.9953363, 0, 1, 0.4901961, 1,
-0.200707, -0.5806597, -3.928843, 0, 1, 0.4941176, 1,
-0.1986084, 1.028617, 0.9000668, 0, 1, 0.5019608, 1,
-0.1980609, 1.385069, -0.1610745, 0, 1, 0.509804, 1,
-0.1974515, 0.01631331, -2.12017, 0, 1, 0.5137255, 1,
-0.196366, -1.019579, -1.189963, 0, 1, 0.5215687, 1,
-0.196332, 1.173954, -0.7511703, 0, 1, 0.5254902, 1,
-0.19356, -0.39728, -3.248877, 0, 1, 0.5333334, 1,
-0.1920684, -0.1713767, -3.648969, 0, 1, 0.5372549, 1,
-0.1900489, 0.8883067, -2.061773, 0, 1, 0.5450981, 1,
-0.1894473, -1.171652, -3.640622, 0, 1, 0.5490196, 1,
-0.1884945, 0.08290035, -2.080334, 0, 1, 0.5568628, 1,
-0.1865307, 0.1271909, -1.305267, 0, 1, 0.5607843, 1,
-0.1859673, -0.3844758, -3.414751, 0, 1, 0.5686275, 1,
-0.1808683, -0.3795608, -2.18033, 0, 1, 0.572549, 1,
-0.1783629, 0.002045503, -3.27441, 0, 1, 0.5803922, 1,
-0.169768, 0.7721741, 0.8025168, 0, 1, 0.5843138, 1,
-0.1589299, 0.6957548, 0.5454352, 0, 1, 0.5921569, 1,
-0.1587343, -0.7781486, -2.753858, 0, 1, 0.5960785, 1,
-0.1582006, -0.7150928, -3.574309, 0, 1, 0.6039216, 1,
-0.1534955, 1.023905, -0.440852, 0, 1, 0.6117647, 1,
-0.1505844, -0.3290983, -3.516706, 0, 1, 0.6156863, 1,
-0.1496341, 2.181028, 0.9175147, 0, 1, 0.6235294, 1,
-0.1472757, -0.1035826, -1.661557, 0, 1, 0.627451, 1,
-0.1379782, 0.7764097, 0.8937007, 0, 1, 0.6352941, 1,
-0.1379405, 0.5773723, -1.319167, 0, 1, 0.6392157, 1,
-0.1361881, -1.019929, -2.154129, 0, 1, 0.6470588, 1,
-0.1188357, 0.1832286, -1.367519, 0, 1, 0.6509804, 1,
-0.1147804, -0.4050084, -2.643001, 0, 1, 0.6588235, 1,
-0.1137518, -0.03297615, -2.51454, 0, 1, 0.6627451, 1,
-0.1134746, -1.667938, -4.776602, 0, 1, 0.6705883, 1,
-0.102533, 1.022301, -0.7655903, 0, 1, 0.6745098, 1,
-0.1023195, 0.7261769, -0.5513435, 0, 1, 0.682353, 1,
-0.09990484, 0.03403604, -2.355041, 0, 1, 0.6862745, 1,
-0.08854414, 0.81229, 1.304367, 0, 1, 0.6941177, 1,
-0.08806087, 0.6193324, 0.3734629, 0, 1, 0.7019608, 1,
-0.08184043, 0.3876479, -0.3601724, 0, 1, 0.7058824, 1,
-0.08128132, 0.8984917, -0.3343942, 0, 1, 0.7137255, 1,
-0.07342392, 0.3152168, -1.181659, 0, 1, 0.7176471, 1,
-0.06960469, 0.0658785, -1.318427, 0, 1, 0.7254902, 1,
-0.06945349, 0.2475691, -1.567759, 0, 1, 0.7294118, 1,
-0.06872436, -1.14049, -3.234749, 0, 1, 0.7372549, 1,
-0.06778702, 0.8472647, -0.277912, 0, 1, 0.7411765, 1,
-0.06610402, -0.01595705, -2.511506, 0, 1, 0.7490196, 1,
-0.05853721, -1.178099, -3.095055, 0, 1, 0.7529412, 1,
-0.05678852, 1.112865, 0.144794, 0, 1, 0.7607843, 1,
-0.05329936, 1.684796, 0.9525082, 0, 1, 0.7647059, 1,
-0.04935328, 1.155118, 0.07559697, 0, 1, 0.772549, 1,
-0.04928065, 0.3653881, -0.4970451, 0, 1, 0.7764706, 1,
-0.04491407, 1.028019, 1.065243, 0, 1, 0.7843137, 1,
-0.04360763, -0.7000074, -2.04571, 0, 1, 0.7882353, 1,
-0.03981366, 0.4370474, 0.08590572, 0, 1, 0.7960784, 1,
-0.03841444, 0.533659, 0.9761736, 0, 1, 0.8039216, 1,
-0.03788901, -1.550198, -3.658309, 0, 1, 0.8078431, 1,
-0.03600419, -0.299172, -2.349899, 0, 1, 0.8156863, 1,
-0.03443573, -0.8020929, -3.427384, 0, 1, 0.8196079, 1,
-0.0311525, -0.7396276, -2.976392, 0, 1, 0.827451, 1,
-0.02612338, 0.1018026, -1.577459, 0, 1, 0.8313726, 1,
-0.02567437, -0.0381136, -2.705327, 0, 1, 0.8392157, 1,
-0.01580592, 1.996862, 0.2811018, 0, 1, 0.8431373, 1,
-0.01462898, -0.1653508, -2.395568, 0, 1, 0.8509804, 1,
-0.01335651, 1.27663, 0.8305405, 0, 1, 0.854902, 1,
-0.01226382, 1.539328, -0.09029541, 0, 1, 0.8627451, 1,
-0.01183203, 0.3951886, -1.255262, 0, 1, 0.8666667, 1,
-0.01165546, 1.293106, -0.5770632, 0, 1, 0.8745098, 1,
0.008589393, -2.813669, 3.499076, 0, 1, 0.8784314, 1,
0.0119194, 0.8089904, -0.1840794, 0, 1, 0.8862745, 1,
0.01258947, 0.6545195, -0.1190669, 0, 1, 0.8901961, 1,
0.01310089, -1.768387, 3.322923, 0, 1, 0.8980392, 1,
0.0160132, -0.0823188, 3.029711, 0, 1, 0.9058824, 1,
0.0176733, 1.545405, 0.01492607, 0, 1, 0.9098039, 1,
0.01859172, -1.912144, 2.497847, 0, 1, 0.9176471, 1,
0.01893963, -0.9904317, 2.453556, 0, 1, 0.9215686, 1,
0.01900427, -0.1624922, 2.428662, 0, 1, 0.9294118, 1,
0.02049695, -1.543342, 2.856362, 0, 1, 0.9333333, 1,
0.02144898, -0.7891213, 3.537003, 0, 1, 0.9411765, 1,
0.02353828, 0.3370291, 0.02031932, 0, 1, 0.945098, 1,
0.02635479, 0.04975536, 1.614007, 0, 1, 0.9529412, 1,
0.03741274, 0.4558027, -0.8874992, 0, 1, 0.9568627, 1,
0.04225921, -2.706117, 2.491243, 0, 1, 0.9647059, 1,
0.04249532, -0.8794979, 4.81841, 0, 1, 0.9686275, 1,
0.04562693, -0.7409441, 3.375432, 0, 1, 0.9764706, 1,
0.04930313, 0.06609242, 0.6384746, 0, 1, 0.9803922, 1,
0.05002385, 0.5259191, -0.5893025, 0, 1, 0.9882353, 1,
0.05162262, -1.412624, 2.749394, 0, 1, 0.9921569, 1,
0.05233024, -0.6356853, 2.245246, 0, 1, 1, 1,
0.05270699, 0.1535238, 0.4834482, 0, 0.9921569, 1, 1,
0.05547177, -0.4709186, 1.257911, 0, 0.9882353, 1, 1,
0.05905232, 1.952384, 1.114778, 0, 0.9803922, 1, 1,
0.0600528, 1.996292, 1.417492, 0, 0.9764706, 1, 1,
0.06014083, 0.7062244, 0.009039529, 0, 0.9686275, 1, 1,
0.06253016, -0.1975507, 3.643687, 0, 0.9647059, 1, 1,
0.0665146, -0.5769488, 3.868215, 0, 0.9568627, 1, 1,
0.06674723, 0.07957179, 0.7248746, 0, 0.9529412, 1, 1,
0.06847873, -1.138441, 2.003224, 0, 0.945098, 1, 1,
0.0735008, -0.7087562, 3.750147, 0, 0.9411765, 1, 1,
0.07580859, 0.7834092, 0.1898584, 0, 0.9333333, 1, 1,
0.07783648, -1.052891, 3.585249, 0, 0.9294118, 1, 1,
0.07914798, -0.04025224, 2.436562, 0, 0.9215686, 1, 1,
0.08024205, -1.205553, 3.341846, 0, 0.9176471, 1, 1,
0.08541997, -1.301083, 3.244196, 0, 0.9098039, 1, 1,
0.08594085, 1.310431, 1.03063, 0, 0.9058824, 1, 1,
0.08680108, 0.5092981, 1.467457, 0, 0.8980392, 1, 1,
0.08740276, 0.8614782, -1.056047, 0, 0.8901961, 1, 1,
0.08826783, 0.7708344, 1.137399, 0, 0.8862745, 1, 1,
0.0888121, -1.013906, 1.104341, 0, 0.8784314, 1, 1,
0.0901724, -0.1900941, 1.949517, 0, 0.8745098, 1, 1,
0.09243542, 1.062611, 1.323052, 0, 0.8666667, 1, 1,
0.09462871, -1.227913, 4.719717, 0, 0.8627451, 1, 1,
0.09625091, 0.7053862, 0.9949078, 0, 0.854902, 1, 1,
0.09884606, -0.08888239, 2.948856, 0, 0.8509804, 1, 1,
0.1003999, 0.3515749, 1.668033, 0, 0.8431373, 1, 1,
0.1049311, 0.3532087, 0.6171138, 0, 0.8392157, 1, 1,
0.1086979, -0.7353283, 4.280777, 0, 0.8313726, 1, 1,
0.1093376, 0.4042093, 0.4929145, 0, 0.827451, 1, 1,
0.1115574, -2.450636, 0.744792, 0, 0.8196079, 1, 1,
0.1145804, -0.6170031, 4.886993, 0, 0.8156863, 1, 1,
0.1178064, -0.4174676, 3.692673, 0, 0.8078431, 1, 1,
0.1210247, 0.6707735, 0.01110674, 0, 0.8039216, 1, 1,
0.1274207, 0.1937671, 0.2531528, 0, 0.7960784, 1, 1,
0.1290059, 1.888707, -0.4886026, 0, 0.7882353, 1, 1,
0.1294917, -0.8605637, 2.493908, 0, 0.7843137, 1, 1,
0.1309281, -0.9967127, 2.627336, 0, 0.7764706, 1, 1,
0.1352949, 0.0463961, 1.515727, 0, 0.772549, 1, 1,
0.1370423, 1.643931, -0.9883907, 0, 0.7647059, 1, 1,
0.1407232, 0.1152962, -0.210856, 0, 0.7607843, 1, 1,
0.141037, -0.2927008, 2.656062, 0, 0.7529412, 1, 1,
0.1490591, 1.311051, 0.8581641, 0, 0.7490196, 1, 1,
0.1506187, 0.7853326, -1.331577, 0, 0.7411765, 1, 1,
0.1523062, -1.058037, 3.899515, 0, 0.7372549, 1, 1,
0.1559376, -0.5724475, 4.07895, 0, 0.7294118, 1, 1,
0.1560684, -0.4773054, 3.266723, 0, 0.7254902, 1, 1,
0.1565559, -0.9006662, 3.34404, 0, 0.7176471, 1, 1,
0.1568663, -0.6861378, 2.520326, 0, 0.7137255, 1, 1,
0.1574209, 1.628374, -0.120209, 0, 0.7058824, 1, 1,
0.1575515, -1.280087, 4.779763, 0, 0.6980392, 1, 1,
0.1578956, 0.5682076, 0.2300548, 0, 0.6941177, 1, 1,
0.1588839, 0.5135159, 0.5254885, 0, 0.6862745, 1, 1,
0.1595719, 0.2168561, -1.325299, 0, 0.682353, 1, 1,
0.161133, -0.416077, 3.247365, 0, 0.6745098, 1, 1,
0.1615732, 0.1107564, -0.7756497, 0, 0.6705883, 1, 1,
0.1627439, -0.166917, 3.254836, 0, 0.6627451, 1, 1,
0.166204, 1.102753, 0.679144, 0, 0.6588235, 1, 1,
0.1668283, -2.276061, 2.695299, 0, 0.6509804, 1, 1,
0.1673647, 1.329862, -1.35131, 0, 0.6470588, 1, 1,
0.1702916, 0.1806357, -0.4883343, 0, 0.6392157, 1, 1,
0.1734941, -1.47795, 4.061762, 0, 0.6352941, 1, 1,
0.1737673, 0.2737818, 1.035338, 0, 0.627451, 1, 1,
0.174821, 1.458337, 0.007870343, 0, 0.6235294, 1, 1,
0.1750006, -1.32424, 2.172017, 0, 0.6156863, 1, 1,
0.1764423, -1.321414, 4.579807, 0, 0.6117647, 1, 1,
0.1811163, -1.096259, 2.347608, 0, 0.6039216, 1, 1,
0.1825319, 1.147123, 2.022007, 0, 0.5960785, 1, 1,
0.1857781, -1.194073, 2.323075, 0, 0.5921569, 1, 1,
0.190102, -0.1568507, 1.91498, 0, 0.5843138, 1, 1,
0.1901244, 2.548239, 2.270999, 0, 0.5803922, 1, 1,
0.1960655, 2.298487, 0.8243695, 0, 0.572549, 1, 1,
0.196082, 0.7117879, 0.2177615, 0, 0.5686275, 1, 1,
0.1971617, 1.076586, 0.8116802, 0, 0.5607843, 1, 1,
0.1981375, -0.7418477, 4.01196, 0, 0.5568628, 1, 1,
0.201403, 0.7146932, 0.6136494, 0, 0.5490196, 1, 1,
0.2037925, -0.02511902, 2.261735, 0, 0.5450981, 1, 1,
0.2080106, 0.681863, -0.5916463, 0, 0.5372549, 1, 1,
0.2098526, 0.5322688, -0.3212079, 0, 0.5333334, 1, 1,
0.2133188, 0.281932, -0.3409825, 0, 0.5254902, 1, 1,
0.2148695, -2.34968, 2.865481, 0, 0.5215687, 1, 1,
0.2157926, 1.218265, 0.2142769, 0, 0.5137255, 1, 1,
0.2159882, 1.671609, -0.4865193, 0, 0.509804, 1, 1,
0.2166069, -1.930584, 2.977055, 0, 0.5019608, 1, 1,
0.2177834, 1.195591, 1.022843, 0, 0.4941176, 1, 1,
0.2247217, -0.959174, 2.896325, 0, 0.4901961, 1, 1,
0.2258267, -1.551869, 3.502837, 0, 0.4823529, 1, 1,
0.2260952, 0.2865243, 0.7497141, 0, 0.4784314, 1, 1,
0.2270746, 0.02259532, 2.949893, 0, 0.4705882, 1, 1,
0.2272089, 0.05312746, 1.93907, 0, 0.4666667, 1, 1,
0.2381212, -0.5318616, 2.824597, 0, 0.4588235, 1, 1,
0.2421927, 0.2854477, -0.2624756, 0, 0.454902, 1, 1,
0.2441939, 1.325429, -3.516774, 0, 0.4470588, 1, 1,
0.244981, 1.46589, -0.5119528, 0, 0.4431373, 1, 1,
0.2468798, 0.8781824, 1.682664, 0, 0.4352941, 1, 1,
0.2511505, -0.6767179, 1.896327, 0, 0.4313726, 1, 1,
0.2536056, 0.2865127, 0.4174714, 0, 0.4235294, 1, 1,
0.2544104, 0.8391957, 0.1549486, 0, 0.4196078, 1, 1,
0.2598685, -0.7969831, 4.569647, 0, 0.4117647, 1, 1,
0.263766, -1.260988, 2.92595, 0, 0.4078431, 1, 1,
0.2645507, 0.2580121, 1.074484, 0, 0.4, 1, 1,
0.2659661, 0.4573876, 0.2196374, 0, 0.3921569, 1, 1,
0.2668347, 1.980299, 0.5964165, 0, 0.3882353, 1, 1,
0.266874, 0.3181153, 3.341235, 0, 0.3803922, 1, 1,
0.26817, -0.6800284, 3.509237, 0, 0.3764706, 1, 1,
0.2708659, -0.315661, 3.033439, 0, 0.3686275, 1, 1,
0.2735892, 1.031483, -0.6754493, 0, 0.3647059, 1, 1,
0.2787205, -1.140064, 4.800595, 0, 0.3568628, 1, 1,
0.2800794, 0.8576, 0.3700034, 0, 0.3529412, 1, 1,
0.28108, -0.7653854, 3.544353, 0, 0.345098, 1, 1,
0.2814888, 0.3738935, 0.6922683, 0, 0.3411765, 1, 1,
0.2863081, -0.3089371, 2.691658, 0, 0.3333333, 1, 1,
0.288561, -0.3147857, 1.613819, 0, 0.3294118, 1, 1,
0.2888736, -0.5317224, 0.5862776, 0, 0.3215686, 1, 1,
0.2893505, -0.7226706, 3.711932, 0, 0.3176471, 1, 1,
0.2913988, -0.8482216, 1.77154, 0, 0.3098039, 1, 1,
0.291513, -0.3804851, 2.259718, 0, 0.3058824, 1, 1,
0.295215, 0.6166413, -0.7914725, 0, 0.2980392, 1, 1,
0.2952801, 0.0003071135, 1.798893, 0, 0.2901961, 1, 1,
0.2963454, 0.9928746, 0.3862192, 0, 0.2862745, 1, 1,
0.297464, -0.3404671, 2.721085, 0, 0.2784314, 1, 1,
0.2982002, 0.367371, 0.6077604, 0, 0.2745098, 1, 1,
0.2987674, 1.043599, 0.4616862, 0, 0.2666667, 1, 1,
0.3020071, 0.5489764, 0.51171, 0, 0.2627451, 1, 1,
0.3093612, 0.3670048, 2.832609, 0, 0.254902, 1, 1,
0.3274852, -0.452312, 2.554038, 0, 0.2509804, 1, 1,
0.3286019, 0.3478992, 1.209311, 0, 0.2431373, 1, 1,
0.3333881, 0.2074825, 1.852783, 0, 0.2392157, 1, 1,
0.3374372, 0.2937197, 0.934423, 0, 0.2313726, 1, 1,
0.3399394, 0.04981488, 1.853911, 0, 0.227451, 1, 1,
0.3432855, 0.310262, -1.062847, 0, 0.2196078, 1, 1,
0.3441634, -0.9243319, 2.673882, 0, 0.2156863, 1, 1,
0.3497667, 0.3018562, -1.100435, 0, 0.2078431, 1, 1,
0.3555934, -1.353481, 2.309175, 0, 0.2039216, 1, 1,
0.3661904, -0.5557203, 3.240693, 0, 0.1960784, 1, 1,
0.3668343, 1.934226, -0.04865764, 0, 0.1882353, 1, 1,
0.3677751, 0.4625679, 1.86044, 0, 0.1843137, 1, 1,
0.371126, 1.117424, -0.002251902, 0, 0.1764706, 1, 1,
0.3774739, -3.209406, 3.200099, 0, 0.172549, 1, 1,
0.3775882, -0.7565344, 2.517013, 0, 0.1647059, 1, 1,
0.3791857, -1.18263, 2.769897, 0, 0.1607843, 1, 1,
0.379236, -0.1700664, 1.949463, 0, 0.1529412, 1, 1,
0.3796204, -0.4147741, 1.124811, 0, 0.1490196, 1, 1,
0.3807829, -0.2644932, 1.234957, 0, 0.1411765, 1, 1,
0.3834581, 2.309009, 0.9579577, 0, 0.1372549, 1, 1,
0.391169, 2.15285, -0.5419773, 0, 0.1294118, 1, 1,
0.3958413, -0.4582445, 1.82709, 0, 0.1254902, 1, 1,
0.3990545, -1.072874, 2.335752, 0, 0.1176471, 1, 1,
0.4013419, -0.4751841, 1.979168, 0, 0.1137255, 1, 1,
0.4089332, -0.5362154, 2.447839, 0, 0.1058824, 1, 1,
0.4123773, -0.5073943, 3.04072, 0, 0.09803922, 1, 1,
0.419754, 0.1935582, 1.492856, 0, 0.09411765, 1, 1,
0.4203099, 1.611056, 0.48364, 0, 0.08627451, 1, 1,
0.4223174, -0.8332347, 3.842709, 0, 0.08235294, 1, 1,
0.4239433, 0.4315162, 0.9708759, 0, 0.07450981, 1, 1,
0.4286509, -2.32874, 2.261288, 0, 0.07058824, 1, 1,
0.4312816, 0.9498668, 0.9268805, 0, 0.0627451, 1, 1,
0.4315962, -1.716012, 3.476209, 0, 0.05882353, 1, 1,
0.4350429, 0.9143937, 2.382108, 0, 0.05098039, 1, 1,
0.4365559, -0.2014388, 2.534121, 0, 0.04705882, 1, 1,
0.4414752, 0.772835, 1.100432, 0, 0.03921569, 1, 1,
0.4415065, -0.3025267, 0.8938338, 0, 0.03529412, 1, 1,
0.4428686, 0.5799956, 0.894421, 0, 0.02745098, 1, 1,
0.4473522, 0.369255, -0.2530892, 0, 0.02352941, 1, 1,
0.4518253, 0.1324554, 1.252503, 0, 0.01568628, 1, 1,
0.4531069, 0.1123436, 0.1273635, 0, 0.01176471, 1, 1,
0.4607906, -0.3934169, 4.101654, 0, 0.003921569, 1, 1,
0.4614314, 0.2408293, 0.1604362, 0.003921569, 0, 1, 1,
0.4624696, -0.2578349, 1.030136, 0.007843138, 0, 1, 1,
0.4648419, 1.445251, 1.388721, 0.01568628, 0, 1, 1,
0.4649495, 0.4701911, 1.019952, 0.01960784, 0, 1, 1,
0.4703552, 1.552411, 1.417949, 0.02745098, 0, 1, 1,
0.4710059, -0.1585643, 1.92662, 0.03137255, 0, 1, 1,
0.4714482, -1.86649, 3.193935, 0.03921569, 0, 1, 1,
0.4721442, -1.390774, 3.448483, 0.04313726, 0, 1, 1,
0.4739975, -0.9630107, 2.778128, 0.05098039, 0, 1, 1,
0.4759271, -0.5744933, 2.527215, 0.05490196, 0, 1, 1,
0.4987254, -0.8673061, 2.358866, 0.0627451, 0, 1, 1,
0.5018174, -1.035795, 2.186527, 0.06666667, 0, 1, 1,
0.5061296, -1.886938, 4.520027, 0.07450981, 0, 1, 1,
0.5105792, 1.071723, 0.9491854, 0.07843138, 0, 1, 1,
0.5137728, 1.530395, -0.7305241, 0.08627451, 0, 1, 1,
0.513955, 0.4695132, 1.666155, 0.09019608, 0, 1, 1,
0.5170386, 1.137238, 1.032502, 0.09803922, 0, 1, 1,
0.5177858, 0.2027991, 2.251441, 0.1058824, 0, 1, 1,
0.5191239, -0.8597768, 2.479434, 0.1098039, 0, 1, 1,
0.5191767, -0.1436082, 1.213185, 0.1176471, 0, 1, 1,
0.5219182, 0.425212, 1.206364, 0.1215686, 0, 1, 1,
0.5223258, 0.7084455, -0.7853991, 0.1294118, 0, 1, 1,
0.5265836, -0.2266393, 1.592564, 0.1333333, 0, 1, 1,
0.5292903, 0.9573808, -0.1414915, 0.1411765, 0, 1, 1,
0.5381152, -0.8426923, 2.460054, 0.145098, 0, 1, 1,
0.5431595, -1.277272, 2.061211, 0.1529412, 0, 1, 1,
0.5434195, -2.008544, 2.4593, 0.1568628, 0, 1, 1,
0.545316, 0.2629782, 2.321959, 0.1647059, 0, 1, 1,
0.5602582, 1.554039, -0.5606082, 0.1686275, 0, 1, 1,
0.566949, -1.352395, 2.530974, 0.1764706, 0, 1, 1,
0.5720235, -0.07347714, 1.09858, 0.1803922, 0, 1, 1,
0.5787013, -0.01387077, 2.106307, 0.1882353, 0, 1, 1,
0.5850708, -0.3866422, 2.037172, 0.1921569, 0, 1, 1,
0.5852776, -0.016462, 0.6306695, 0.2, 0, 1, 1,
0.5913162, -0.007840699, 3.526739, 0.2078431, 0, 1, 1,
0.593302, 0.6311075, 1.460252, 0.2117647, 0, 1, 1,
0.5940453, 0.008554976, 2.072323, 0.2196078, 0, 1, 1,
0.5949587, -0.333529, 2.275863, 0.2235294, 0, 1, 1,
0.6000652, 0.7997893, 0.8752493, 0.2313726, 0, 1, 1,
0.6000654, -0.2686341, 2.808409, 0.2352941, 0, 1, 1,
0.6125609, -0.5095926, 2.548194, 0.2431373, 0, 1, 1,
0.6135784, 1.196659, -2.205654, 0.2470588, 0, 1, 1,
0.6153443, -0.09355932, 3.907114, 0.254902, 0, 1, 1,
0.6175113, -0.0106178, 1.047031, 0.2588235, 0, 1, 1,
0.6230894, -0.3967855, 1.888448, 0.2666667, 0, 1, 1,
0.623387, -0.7727643, 1.954816, 0.2705882, 0, 1, 1,
0.6245792, 0.301829, 2.457093, 0.2784314, 0, 1, 1,
0.6259779, 1.838622, -0.08100948, 0.282353, 0, 1, 1,
0.6281698, 0.239025, 3.840173, 0.2901961, 0, 1, 1,
0.6320391, 0.2635497, 2.575164, 0.2941177, 0, 1, 1,
0.6331796, -2.272944, 2.934146, 0.3019608, 0, 1, 1,
0.6381012, 1.000526, -0.2774688, 0.3098039, 0, 1, 1,
0.6393187, -0.843179, 4.440368, 0.3137255, 0, 1, 1,
0.639703, -0.7827898, 4.135068, 0.3215686, 0, 1, 1,
0.6406772, 0.8284881, 0.8758707, 0.3254902, 0, 1, 1,
0.6475541, -0.5654393, 3.060457, 0.3333333, 0, 1, 1,
0.647567, -1.073195, 1.454213, 0.3372549, 0, 1, 1,
0.6490235, 1.555617, 1.152971, 0.345098, 0, 1, 1,
0.6541629, 0.7149909, 1.144454, 0.3490196, 0, 1, 1,
0.6667947, 1.487279, 1.845993, 0.3568628, 0, 1, 1,
0.669349, 0.3629828, 2.636968, 0.3607843, 0, 1, 1,
0.6710356, 0.4909937, 2.399547, 0.3686275, 0, 1, 1,
0.6792146, 0.4343075, 2.119708, 0.372549, 0, 1, 1,
0.6817045, -0.9063563, 1.848287, 0.3803922, 0, 1, 1,
0.6843473, -1.844444, 2.701874, 0.3843137, 0, 1, 1,
0.6846602, 0.5629026, -0.08555514, 0.3921569, 0, 1, 1,
0.6863568, -1.255471, 1.58913, 0.3960784, 0, 1, 1,
0.6884349, -0.5318195, 3.212795, 0.4039216, 0, 1, 1,
0.6895784, -1.005807, 1.713346, 0.4117647, 0, 1, 1,
0.6899803, 0.2004928, 0.5141828, 0.4156863, 0, 1, 1,
0.6915149, -0.2836442, 3.076484, 0.4235294, 0, 1, 1,
0.6980491, -1.323218, 2.212516, 0.427451, 0, 1, 1,
0.7033473, 0.8573072, -0.9825014, 0.4352941, 0, 1, 1,
0.7086037, -0.2536107, 1.806448, 0.4392157, 0, 1, 1,
0.7117743, -0.4175116, 2.675901, 0.4470588, 0, 1, 1,
0.7122227, 0.6563533, 0.8380113, 0.4509804, 0, 1, 1,
0.7169104, 1.206103, 0.8115864, 0.4588235, 0, 1, 1,
0.7173334, -0.399726, 3.294759, 0.4627451, 0, 1, 1,
0.7173488, 1.604422, 0.4768889, 0.4705882, 0, 1, 1,
0.7234673, -1.61557, 1.745776, 0.4745098, 0, 1, 1,
0.7258877, -0.9759797, 1.919968, 0.4823529, 0, 1, 1,
0.7279238, -0.1067469, 0.4268218, 0.4862745, 0, 1, 1,
0.7315784, 2.770908, -0.2248964, 0.4941176, 0, 1, 1,
0.7370791, 0.6021659, 0.2427728, 0.5019608, 0, 1, 1,
0.7426457, -0.3779528, 2.505733, 0.5058824, 0, 1, 1,
0.7432941, 0.3137368, 0.4359011, 0.5137255, 0, 1, 1,
0.7512215, 0.8850036, 0.9090773, 0.5176471, 0, 1, 1,
0.7602811, 1.176344, 1.270716, 0.5254902, 0, 1, 1,
0.7647435, -0.6550097, 0.1477634, 0.5294118, 0, 1, 1,
0.7647486, 0.8861595, 0.7514263, 0.5372549, 0, 1, 1,
0.7659489, 0.6071663, 1.726038, 0.5411765, 0, 1, 1,
0.7676552, 0.5389953, 0.5300818, 0.5490196, 0, 1, 1,
0.7711834, 0.6767536, 2.746764, 0.5529412, 0, 1, 1,
0.7742294, 0.1305907, 1.883049, 0.5607843, 0, 1, 1,
0.7752538, 0.4427521, 0.2168162, 0.5647059, 0, 1, 1,
0.7782488, 0.7141265, 1.54932, 0.572549, 0, 1, 1,
0.7834113, 0.3899853, 1.958174, 0.5764706, 0, 1, 1,
0.7852097, 0.8981275, 1.591948, 0.5843138, 0, 1, 1,
0.7883734, -1.060151, 3.45406, 0.5882353, 0, 1, 1,
0.7918866, -0.6623292, 2.269363, 0.5960785, 0, 1, 1,
0.7948653, 0.1153332, -0.4871307, 0.6039216, 0, 1, 1,
0.798896, 1.305493, 0.1256152, 0.6078432, 0, 1, 1,
0.79905, -0.4922923, 3.143688, 0.6156863, 0, 1, 1,
0.802362, 2.50439, 1.714623, 0.6196079, 0, 1, 1,
0.8041967, -0.6429379, 3.503732, 0.627451, 0, 1, 1,
0.8080108, -0.6367431, 2.132874, 0.6313726, 0, 1, 1,
0.808033, -0.411325, 1.234246, 0.6392157, 0, 1, 1,
0.8093544, 0.2847343, 2.735626, 0.6431373, 0, 1, 1,
0.8244775, 0.7234839, 1.963253, 0.6509804, 0, 1, 1,
0.8245558, -0.2854588, 3.214921, 0.654902, 0, 1, 1,
0.8282298, 0.8613962, 0.2470389, 0.6627451, 0, 1, 1,
0.8282489, 0.205468, 1.627187, 0.6666667, 0, 1, 1,
0.8307296, 0.8999551, 0.9539402, 0.6745098, 0, 1, 1,
0.8413926, 0.9817302, 0.9699498, 0.6784314, 0, 1, 1,
0.8440493, 0.9466994, 0.1980959, 0.6862745, 0, 1, 1,
0.8524904, -1.454836, 4.320593, 0.6901961, 0, 1, 1,
0.8537548, -1.092004, 2.408678, 0.6980392, 0, 1, 1,
0.8556622, 0.1116812, 1.963863, 0.7058824, 0, 1, 1,
0.8577886, -1.150124, 2.24765, 0.7098039, 0, 1, 1,
0.8624251, -1.411105, 1.597671, 0.7176471, 0, 1, 1,
0.8624901, -0.6174871, 1.305281, 0.7215686, 0, 1, 1,
0.8672677, 0.3508025, 1.246691, 0.7294118, 0, 1, 1,
0.8681272, 0.7920307, 1.659305, 0.7333333, 0, 1, 1,
0.8701327, -0.6252794, 2.037011, 0.7411765, 0, 1, 1,
0.8750392, -0.1759545, 2.203845, 0.7450981, 0, 1, 1,
0.8754596, 1.144635, -1.709425, 0.7529412, 0, 1, 1,
0.8795263, 0.7303684, 1.751432, 0.7568628, 0, 1, 1,
0.8808377, -0.1199252, 1.352238, 0.7647059, 0, 1, 1,
0.8829803, 0.3780389, -0.05836572, 0.7686275, 0, 1, 1,
0.8906206, 1.436185, 0.2800999, 0.7764706, 0, 1, 1,
0.8910182, 0.6351097, 2.289863, 0.7803922, 0, 1, 1,
0.8919212, -0.764056, 2.216747, 0.7882353, 0, 1, 1,
0.8942921, -0.6875341, 2.519318, 0.7921569, 0, 1, 1,
0.8969376, -0.3264941, 1.738103, 0.8, 0, 1, 1,
0.9095734, 1.809649, 0.7882699, 0.8078431, 0, 1, 1,
0.9136089, -0.2919383, 2.375968, 0.8117647, 0, 1, 1,
0.9194652, 0.197503, 0.565686, 0.8196079, 0, 1, 1,
0.9202764, 0.6343478, 0.7750378, 0.8235294, 0, 1, 1,
0.9240296, -1.265281, 2.296811, 0.8313726, 0, 1, 1,
0.9243738, -1.492576, 2.883056, 0.8352941, 0, 1, 1,
0.9385062, -0.4047136, 1.598073, 0.8431373, 0, 1, 1,
0.9386055, 0.9316533, -0.4850715, 0.8470588, 0, 1, 1,
0.9416635, -0.8993972, 2.690702, 0.854902, 0, 1, 1,
0.9543869, -0.7676179, 1.144633, 0.8588235, 0, 1, 1,
0.9568235, -0.579312, 1.671822, 0.8666667, 0, 1, 1,
0.9583952, 1.319152, -0.1287181, 0.8705882, 0, 1, 1,
0.9641008, -0.5318775, 3.302485, 0.8784314, 0, 1, 1,
0.9704402, 1.897474, 0.8448078, 0.8823529, 0, 1, 1,
0.9723237, 0.361483, 1.112105, 0.8901961, 0, 1, 1,
0.9805379, -0.385824, 1.710288, 0.8941177, 0, 1, 1,
0.9909262, -2.248394, 4.06021, 0.9019608, 0, 1, 1,
0.9972782, 0.2605642, 2.247759, 0.9098039, 0, 1, 1,
0.9979795, -0.7024568, 2.365943, 0.9137255, 0, 1, 1,
1.002823, 0.8143643, -0.8170066, 0.9215686, 0, 1, 1,
1.003683, -0.8621684, 1.151327, 0.9254902, 0, 1, 1,
1.00548, -0.9973564, 3.824162, 0.9333333, 0, 1, 1,
1.015546, -1.182319, 3.062667, 0.9372549, 0, 1, 1,
1.016606, 0.9975935, 1.775393, 0.945098, 0, 1, 1,
1.022329, 0.06109702, 1.38491, 0.9490196, 0, 1, 1,
1.030468, -0.2158409, 2.637177, 0.9568627, 0, 1, 1,
1.037016, -0.02689014, 0.9711127, 0.9607843, 0, 1, 1,
1.037447, -0.1957003, 2.022732, 0.9686275, 0, 1, 1,
1.040092, -1.390706, 1.735548, 0.972549, 0, 1, 1,
1.04786, -0.6773683, 2.54285, 0.9803922, 0, 1, 1,
1.060335, -0.4450277, 2.986362, 0.9843137, 0, 1, 1,
1.060805, -1.455067, 2.688584, 0.9921569, 0, 1, 1,
1.06506, 0.03995803, 1.245023, 0.9960784, 0, 1, 1,
1.065393, -0.7591292, 3.217839, 1, 0, 0.9960784, 1,
1.066327, -1.248514, 2.078087, 1, 0, 0.9882353, 1,
1.070104, 1.368856, -0.5993039, 1, 0, 0.9843137, 1,
1.078339, -0.3148917, 2.477382, 1, 0, 0.9764706, 1,
1.091197, 0.5152065, -0.03143725, 1, 0, 0.972549, 1,
1.096273, 0.6125914, 1.702293, 1, 0, 0.9647059, 1,
1.097162, 0.5588429, 1.728073, 1, 0, 0.9607843, 1,
1.101986, -0.7881968, 2.392433, 1, 0, 0.9529412, 1,
1.107454, -0.8161877, 2.957895, 1, 0, 0.9490196, 1,
1.122305, 0.2131097, -0.309327, 1, 0, 0.9411765, 1,
1.125679, -0.4630607, 3.815907, 1, 0, 0.9372549, 1,
1.129604, 0.08160864, 2.247542, 1, 0, 0.9294118, 1,
1.129638, -1.057781, 3.213402, 1, 0, 0.9254902, 1,
1.13018, -1.040569, 3.9788, 1, 0, 0.9176471, 1,
1.130521, -1.126919, 1.273922, 1, 0, 0.9137255, 1,
1.139983, -0.4290437, 1.157009, 1, 0, 0.9058824, 1,
1.144954, 0.9143511, 1.818735, 1, 0, 0.9019608, 1,
1.172156, 0.3655542, 0.4307601, 1, 0, 0.8941177, 1,
1.18726, -0.233116, -0.1143164, 1, 0, 0.8862745, 1,
1.187547, 0.1650291, 0.2809844, 1, 0, 0.8823529, 1,
1.189747, -0.7542672, 0.3918075, 1, 0, 0.8745098, 1,
1.199072, 0.2622992, 0.06073631, 1, 0, 0.8705882, 1,
1.201812, 0.7459215, 1.351823, 1, 0, 0.8627451, 1,
1.202028, -0.2154713, 1.816812, 1, 0, 0.8588235, 1,
1.203406, -0.7898648, -0.0386475, 1, 0, 0.8509804, 1,
1.215919, 0.5020609, -0.06097884, 1, 0, 0.8470588, 1,
1.216341, 0.03395598, 1.458215, 1, 0, 0.8392157, 1,
1.227243, -0.8407994, 1.334738, 1, 0, 0.8352941, 1,
1.230293, -1.018116, 3.809272, 1, 0, 0.827451, 1,
1.234614, -0.06219033, 1.301786, 1, 0, 0.8235294, 1,
1.235856, -0.3278418, 1.419276, 1, 0, 0.8156863, 1,
1.239676, -0.1325112, 1.844777, 1, 0, 0.8117647, 1,
1.247318, 2.825743, 1.186256, 1, 0, 0.8039216, 1,
1.256484, -0.6069765, 2.918996, 1, 0, 0.7960784, 1,
1.256981, -0.1306653, 1.036294, 1, 0, 0.7921569, 1,
1.258448, -0.2721003, 2.569991, 1, 0, 0.7843137, 1,
1.268779, 0.378815, 2.094491, 1, 0, 0.7803922, 1,
1.271954, 0.2389257, 0.7791936, 1, 0, 0.772549, 1,
1.274759, 0.8649687, 0.8336397, 1, 0, 0.7686275, 1,
1.276565, -0.5679162, 1.543461, 1, 0, 0.7607843, 1,
1.289549, -0.4097775, 1.985648, 1, 0, 0.7568628, 1,
1.298724, 0.4661727, 3.616786, 1, 0, 0.7490196, 1,
1.302675, 2.875079, 0.3094002, 1, 0, 0.7450981, 1,
1.30358, 0.6438612, 0.2611046, 1, 0, 0.7372549, 1,
1.307351, 0.6101771, 1.579232, 1, 0, 0.7333333, 1,
1.307977, -0.09343292, 2.575959, 1, 0, 0.7254902, 1,
1.310813, 0.5700292, 1.926174, 1, 0, 0.7215686, 1,
1.319047, -0.7689728, 1.19091, 1, 0, 0.7137255, 1,
1.331706, -0.4610845, 0.3101297, 1, 0, 0.7098039, 1,
1.333094, 1.101776, 0.3535269, 1, 0, 0.7019608, 1,
1.340151, 0.7432396, -0.4898509, 1, 0, 0.6941177, 1,
1.34019, 0.2952284, 0.5147695, 1, 0, 0.6901961, 1,
1.344101, -0.7663482, 0.6318971, 1, 0, 0.682353, 1,
1.348109, 0.5291584, 0.9233066, 1, 0, 0.6784314, 1,
1.349299, -0.5631331, 1.850612, 1, 0, 0.6705883, 1,
1.350735, -0.3739762, 1.02141, 1, 0, 0.6666667, 1,
1.357001, -0.6084328, 3.258694, 1, 0, 0.6588235, 1,
1.357021, -0.8478567, 1.731165, 1, 0, 0.654902, 1,
1.357087, -0.4581354, 3.362644, 1, 0, 0.6470588, 1,
1.365126, 0.2656023, -0.6415849, 1, 0, 0.6431373, 1,
1.366547, 0.6164892, -0.4188328, 1, 0, 0.6352941, 1,
1.370983, -0.4954294, 1.619344, 1, 0, 0.6313726, 1,
1.380618, 0.6295933, 3.001598, 1, 0, 0.6235294, 1,
1.382996, 0.4416656, -0.530911, 1, 0, 0.6196079, 1,
1.390325, -0.09769642, 1.479185, 1, 0, 0.6117647, 1,
1.396163, -0.5173585, 0.4004886, 1, 0, 0.6078432, 1,
1.399878, 1.344731, 0.7324591, 1, 0, 0.6, 1,
1.403615, -0.3307811, 1.62369, 1, 0, 0.5921569, 1,
1.406922, 0.5649463, 1.328047, 1, 0, 0.5882353, 1,
1.411106, -0.001783296, 3.076959, 1, 0, 0.5803922, 1,
1.412701, -0.2698909, 0.5682989, 1, 0, 0.5764706, 1,
1.414995, -0.9803454, 0.7570341, 1, 0, 0.5686275, 1,
1.418147, -1.183614, 1.63565, 1, 0, 0.5647059, 1,
1.419475, -0.6795485, 2.820626, 1, 0, 0.5568628, 1,
1.42105, -0.3725156, 2.380039, 1, 0, 0.5529412, 1,
1.423743, 0.1191465, 2.17938, 1, 0, 0.5450981, 1,
1.423814, 1.115493, -0.1763634, 1, 0, 0.5411765, 1,
1.425254, -1.070779, 0.9076927, 1, 0, 0.5333334, 1,
1.432306, 1.058595, 1.423063, 1, 0, 0.5294118, 1,
1.432608, -1.571092, 1.676726, 1, 0, 0.5215687, 1,
1.449374, -0.6034044, 2.744115, 1, 0, 0.5176471, 1,
1.450768, 0.3320481, 0.8542773, 1, 0, 0.509804, 1,
1.479285, 0.8904515, 0.05843092, 1, 0, 0.5058824, 1,
1.486448, 0.5278912, 0.7158969, 1, 0, 0.4980392, 1,
1.488911, -0.09151634, 2.618972, 1, 0, 0.4901961, 1,
1.493865, -1.476373, 4.300187, 1, 0, 0.4862745, 1,
1.513019, 0.3984915, 2.168918, 1, 0, 0.4784314, 1,
1.51863, 1.984556, 1.188672, 1, 0, 0.4745098, 1,
1.529558, -2.160854, 4.07266, 1, 0, 0.4666667, 1,
1.537269, -0.4925267, 1.910965, 1, 0, 0.4627451, 1,
1.542752, -0.7248804, 3.28506, 1, 0, 0.454902, 1,
1.545209, -1.194862, 0.9696608, 1, 0, 0.4509804, 1,
1.546533, -0.5600119, 1.027731, 1, 0, 0.4431373, 1,
1.554134, 1.488077, 0.1987478, 1, 0, 0.4392157, 1,
1.562102, 0.001800105, 4.043838, 1, 0, 0.4313726, 1,
1.563377, 0.1310239, 1.741211, 1, 0, 0.427451, 1,
1.563811, -1.147868, 2.313943, 1, 0, 0.4196078, 1,
1.576645, 0.8814024, 1.116399, 1, 0, 0.4156863, 1,
1.576776, 1.184533, -0.1336776, 1, 0, 0.4078431, 1,
1.581761, -0.9525324, 1.361701, 1, 0, 0.4039216, 1,
1.597763, -0.3613237, 1.549523, 1, 0, 0.3960784, 1,
1.606872, -0.4736482, 1.678665, 1, 0, 0.3882353, 1,
1.612366, 0.5055482, 2.895129, 1, 0, 0.3843137, 1,
1.614323, -0.3943084, 2.966663, 1, 0, 0.3764706, 1,
1.614831, 0.5538087, 1.610234, 1, 0, 0.372549, 1,
1.620935, 1.684306, 1.016371, 1, 0, 0.3647059, 1,
1.63422, -0.6249842, 1.611188, 1, 0, 0.3607843, 1,
1.642665, -0.027241, 1.061966, 1, 0, 0.3529412, 1,
1.671831, 0.943173, 0.1480801, 1, 0, 0.3490196, 1,
1.674306, 0.8525033, 0.3207859, 1, 0, 0.3411765, 1,
1.680833, -0.9050532, 3.190569, 1, 0, 0.3372549, 1,
1.68613, -0.1274915, 1.339586, 1, 0, 0.3294118, 1,
1.698241, -0.2977116, 0.5724096, 1, 0, 0.3254902, 1,
1.710451, 0.07252954, 1.863792, 1, 0, 0.3176471, 1,
1.712677, 0.5718584, 1.459275, 1, 0, 0.3137255, 1,
1.717038, -1.244205, 1.419118, 1, 0, 0.3058824, 1,
1.72026, 0.6967314, 1.144836, 1, 0, 0.2980392, 1,
1.723698, 1.099234, 3.23764, 1, 0, 0.2941177, 1,
1.728195, -1.454649, 2.962166, 1, 0, 0.2862745, 1,
1.729121, 0.9758877, 0.8326292, 1, 0, 0.282353, 1,
1.74352, -0.4983793, 1.347653, 1, 0, 0.2745098, 1,
1.798588, -1.500576, 1.021429, 1, 0, 0.2705882, 1,
1.805989, 1.941485, -1.33319, 1, 0, 0.2627451, 1,
1.810843, -0.00483441, -0.102362, 1, 0, 0.2588235, 1,
1.832016, 0.9916974, 1.16237, 1, 0, 0.2509804, 1,
1.849473, 0.4776681, 0.2873971, 1, 0, 0.2470588, 1,
1.859092, -1.053831, 2.285412, 1, 0, 0.2392157, 1,
1.863868, -1.522683, 0.8524771, 1, 0, 0.2352941, 1,
1.8781, -1.029639, 2.789095, 1, 0, 0.227451, 1,
1.898679, -0.8009965, 2.110532, 1, 0, 0.2235294, 1,
1.903147, 1.362071, 1.797837, 1, 0, 0.2156863, 1,
1.908185, -0.01992794, 1.767454, 1, 0, 0.2117647, 1,
1.910421, -0.09242834, 1.405136, 1, 0, 0.2039216, 1,
1.91351, -0.7162917, 1.742072, 1, 0, 0.1960784, 1,
1.940914, 1.116253, 1.893754, 1, 0, 0.1921569, 1,
1.948161, 0.4620896, 1.554301, 1, 0, 0.1843137, 1,
1.971332, 0.1224063, 2.074772, 1, 0, 0.1803922, 1,
1.985406, 1.053061, 1.371262, 1, 0, 0.172549, 1,
2.023915, 0.2569709, 3.288232, 1, 0, 0.1686275, 1,
2.038389, 1.195933, 1.448456, 1, 0, 0.1607843, 1,
2.069075, -1.084409, 1.593196, 1, 0, 0.1568628, 1,
2.099789, -0.8268723, 0.6011236, 1, 0, 0.1490196, 1,
2.137907, 0.3059444, -1.73818, 1, 0, 0.145098, 1,
2.138739, -0.6318874, 0.6083797, 1, 0, 0.1372549, 1,
2.177347, 1.074492, 1.72439, 1, 0, 0.1333333, 1,
2.196429, -0.02449041, 1.301343, 1, 0, 0.1254902, 1,
2.230023, -1.130593, 1.408952, 1, 0, 0.1215686, 1,
2.249865, 0.834777, 1.13145, 1, 0, 0.1137255, 1,
2.341972, -0.3434328, -0.1156001, 1, 0, 0.1098039, 1,
2.358563, -0.6114361, 0.7393984, 1, 0, 0.1019608, 1,
2.360083, 0.507664, -1.154555, 1, 0, 0.09411765, 1,
2.36595, -0.9699715, 1.347124, 1, 0, 0.09019608, 1,
2.389622, 1.25521, 2.116908, 1, 0, 0.08235294, 1,
2.486239, 1.26229, 1.743428, 1, 0, 0.07843138, 1,
2.494737, -0.1117485, 1.087539, 1, 0, 0.07058824, 1,
2.498066, -0.7764879, -0.560518, 1, 0, 0.06666667, 1,
2.501069, -0.1035911, 2.899843, 1, 0, 0.05882353, 1,
2.538874, -0.3935527, 2.235015, 1, 0, 0.05490196, 1,
2.594101, 1.640351, 0.6463693, 1, 0, 0.04705882, 1,
2.704854, -1.254285, 3.065067, 1, 0, 0.04313726, 1,
2.997933, -0.6045465, 4.674918, 1, 0, 0.03529412, 1,
3.053779, -0.768008, 2.093135, 1, 0, 0.03137255, 1,
3.07885, -0.6200432, 2.697988, 1, 0, 0.02352941, 1,
3.287601, -0.6650087, 2.024752, 1, 0, 0.01960784, 1,
3.314158, 0.2552591, 2.257132, 1, 0, 0.01176471, 1,
4.265383, 0.4185476, 3.093156, 1, 0, 0.007843138, 1
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
0.5827831, -4.295806, -6.436365, 0, -0.5, 0.5, 0.5,
0.5827831, -4.295806, -6.436365, 1, -0.5, 0.5, 0.5,
0.5827831, -4.295806, -6.436365, 1, 1.5, 0.5, 0.5,
0.5827831, -4.295806, -6.436365, 0, 1.5, 0.5, 0.5
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
-4.348218, -0.004686832, -6.436365, 0, -0.5, 0.5, 0.5,
-4.348218, -0.004686832, -6.436365, 1, -0.5, 0.5, 0.5,
-4.348218, -0.004686832, -6.436365, 1, 1.5, 0.5, 0.5,
-4.348218, -0.004686832, -6.436365, 0, 1.5, 0.5, 0.5
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
-4.348218, -4.295806, 0.04588246, 0, -0.5, 0.5, 0.5,
-4.348218, -4.295806, 0.04588246, 1, -0.5, 0.5, 0.5,
-4.348218, -4.295806, 0.04588246, 1, 1.5, 0.5, 0.5,
-4.348218, -4.295806, 0.04588246, 0, 1.5, 0.5, 0.5
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
-2, -3.305548, -4.940462,
4, -3.305548, -4.940462,
-2, -3.305548, -4.940462,
-2, -3.470591, -5.189779,
0, -3.305548, -4.940462,
0, -3.470591, -5.189779,
2, -3.305548, -4.940462,
2, -3.470591, -5.189779,
4, -3.305548, -4.940462,
4, -3.470591, -5.189779
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
-2, -3.800677, -5.688414, 0, -0.5, 0.5, 0.5,
-2, -3.800677, -5.688414, 1, -0.5, 0.5, 0.5,
-2, -3.800677, -5.688414, 1, 1.5, 0.5, 0.5,
-2, -3.800677, -5.688414, 0, 1.5, 0.5, 0.5,
0, -3.800677, -5.688414, 0, -0.5, 0.5, 0.5,
0, -3.800677, -5.688414, 1, -0.5, 0.5, 0.5,
0, -3.800677, -5.688414, 1, 1.5, 0.5, 0.5,
0, -3.800677, -5.688414, 0, 1.5, 0.5, 0.5,
2, -3.800677, -5.688414, 0, -0.5, 0.5, 0.5,
2, -3.800677, -5.688414, 1, -0.5, 0.5, 0.5,
2, -3.800677, -5.688414, 1, 1.5, 0.5, 0.5,
2, -3.800677, -5.688414, 0, 1.5, 0.5, 0.5,
4, -3.800677, -5.688414, 0, -0.5, 0.5, 0.5,
4, -3.800677, -5.688414, 1, -0.5, 0.5, 0.5,
4, -3.800677, -5.688414, 1, 1.5, 0.5, 0.5,
4, -3.800677, -5.688414, 0, 1.5, 0.5, 0.5
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
-3.210295, -3, -4.940462,
-3.210295, 3, -4.940462,
-3.210295, -3, -4.940462,
-3.399949, -3, -5.189779,
-3.210295, -2, -4.940462,
-3.399949, -2, -5.189779,
-3.210295, -1, -4.940462,
-3.399949, -1, -5.189779,
-3.210295, 0, -4.940462,
-3.399949, 0, -5.189779,
-3.210295, 1, -4.940462,
-3.399949, 1, -5.189779,
-3.210295, 2, -4.940462,
-3.399949, 2, -5.189779,
-3.210295, 3, -4.940462,
-3.399949, 3, -5.189779
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
-3.779257, -3, -5.688414, 0, -0.5, 0.5, 0.5,
-3.779257, -3, -5.688414, 1, -0.5, 0.5, 0.5,
-3.779257, -3, -5.688414, 1, 1.5, 0.5, 0.5,
-3.779257, -3, -5.688414, 0, 1.5, 0.5, 0.5,
-3.779257, -2, -5.688414, 0, -0.5, 0.5, 0.5,
-3.779257, -2, -5.688414, 1, -0.5, 0.5, 0.5,
-3.779257, -2, -5.688414, 1, 1.5, 0.5, 0.5,
-3.779257, -2, -5.688414, 0, 1.5, 0.5, 0.5,
-3.779257, -1, -5.688414, 0, -0.5, 0.5, 0.5,
-3.779257, -1, -5.688414, 1, -0.5, 0.5, 0.5,
-3.779257, -1, -5.688414, 1, 1.5, 0.5, 0.5,
-3.779257, -1, -5.688414, 0, 1.5, 0.5, 0.5,
-3.779257, 0, -5.688414, 0, -0.5, 0.5, 0.5,
-3.779257, 0, -5.688414, 1, -0.5, 0.5, 0.5,
-3.779257, 0, -5.688414, 1, 1.5, 0.5, 0.5,
-3.779257, 0, -5.688414, 0, 1.5, 0.5, 0.5,
-3.779257, 1, -5.688414, 0, -0.5, 0.5, 0.5,
-3.779257, 1, -5.688414, 1, -0.5, 0.5, 0.5,
-3.779257, 1, -5.688414, 1, 1.5, 0.5, 0.5,
-3.779257, 1, -5.688414, 0, 1.5, 0.5, 0.5,
-3.779257, 2, -5.688414, 0, -0.5, 0.5, 0.5,
-3.779257, 2, -5.688414, 1, -0.5, 0.5, 0.5,
-3.779257, 2, -5.688414, 1, 1.5, 0.5, 0.5,
-3.779257, 2, -5.688414, 0, 1.5, 0.5, 0.5,
-3.779257, 3, -5.688414, 0, -0.5, 0.5, 0.5,
-3.779257, 3, -5.688414, 1, -0.5, 0.5, 0.5,
-3.779257, 3, -5.688414, 1, 1.5, 0.5, 0.5,
-3.779257, 3, -5.688414, 0, 1.5, 0.5, 0.5
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
-3.210295, -3.305548, -4,
-3.210295, -3.305548, 4,
-3.210295, -3.305548, -4,
-3.399949, -3.470591, -4,
-3.210295, -3.305548, -2,
-3.399949, -3.470591, -2,
-3.210295, -3.305548, 0,
-3.399949, -3.470591, 0,
-3.210295, -3.305548, 2,
-3.399949, -3.470591, 2,
-3.210295, -3.305548, 4,
-3.399949, -3.470591, 4
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
-3.779257, -3.800677, -4, 0, -0.5, 0.5, 0.5,
-3.779257, -3.800677, -4, 1, -0.5, 0.5, 0.5,
-3.779257, -3.800677, -4, 1, 1.5, 0.5, 0.5,
-3.779257, -3.800677, -4, 0, 1.5, 0.5, 0.5,
-3.779257, -3.800677, -2, 0, -0.5, 0.5, 0.5,
-3.779257, -3.800677, -2, 1, -0.5, 0.5, 0.5,
-3.779257, -3.800677, -2, 1, 1.5, 0.5, 0.5,
-3.779257, -3.800677, -2, 0, 1.5, 0.5, 0.5,
-3.779257, -3.800677, 0, 0, -0.5, 0.5, 0.5,
-3.779257, -3.800677, 0, 1, -0.5, 0.5, 0.5,
-3.779257, -3.800677, 0, 1, 1.5, 0.5, 0.5,
-3.779257, -3.800677, 0, 0, 1.5, 0.5, 0.5,
-3.779257, -3.800677, 2, 0, -0.5, 0.5, 0.5,
-3.779257, -3.800677, 2, 1, -0.5, 0.5, 0.5,
-3.779257, -3.800677, 2, 1, 1.5, 0.5, 0.5,
-3.779257, -3.800677, 2, 0, 1.5, 0.5, 0.5,
-3.779257, -3.800677, 4, 0, -0.5, 0.5, 0.5,
-3.779257, -3.800677, 4, 1, -0.5, 0.5, 0.5,
-3.779257, -3.800677, 4, 1, 1.5, 0.5, 0.5,
-3.779257, -3.800677, 4, 0, 1.5, 0.5, 0.5
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
-3.210295, -3.305548, -4.940462,
-3.210295, 3.296174, -4.940462,
-3.210295, -3.305548, 5.032227,
-3.210295, 3.296174, 5.032227,
-3.210295, -3.305548, -4.940462,
-3.210295, -3.305548, 5.032227,
-3.210295, 3.296174, -4.940462,
-3.210295, 3.296174, 5.032227,
-3.210295, -3.305548, -4.940462,
4.375861, -3.305548, -4.940462,
-3.210295, -3.305548, 5.032227,
4.375861, -3.305548, 5.032227,
-3.210295, 3.296174, -4.940462,
4.375861, 3.296174, -4.940462,
-3.210295, 3.296174, 5.032227,
4.375861, 3.296174, 5.032227,
4.375861, -3.305548, -4.940462,
4.375861, 3.296174, -4.940462,
4.375861, -3.305548, 5.032227,
4.375861, 3.296174, 5.032227,
4.375861, -3.305548, -4.940462,
4.375861, -3.305548, 5.032227,
4.375861, 3.296174, -4.940462,
4.375861, 3.296174, 5.032227
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
var radius = 7.5627;
var distance = 33.64731;
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
mvMatrix.translate( -0.5827831, 0.004686832, -0.04588246 );
mvMatrix.scale( 1.077876, 1.238607, 0.8199333 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.64731);
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
benzoximate<-read.table("benzoximate.xyz")
```

```
## Error in read.table("benzoximate.xyz"): no lines available in input
```

```r
x<-benzoximate$V2
```

```
## Error in eval(expr, envir, enclos): object 'benzoximate' not found
```

```r
y<-benzoximate$V3
```

```
## Error in eval(expr, envir, enclos): object 'benzoximate' not found
```

```r
z<-benzoximate$V4
```

```
## Error in eval(expr, envir, enclos): object 'benzoximate' not found
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
-3.099817, 2.17573, -1.434055, 0, 0, 1, 1, 1,
-3.020455, -0.4197238, -2.1669, 1, 0, 0, 1, 1,
-3.007617, 2.830456, -1.616932, 1, 0, 0, 1, 1,
-2.886982, 1.403498, 0.9898646, 1, 0, 0, 1, 1,
-2.810804, 0.785204, -1.288758, 1, 0, 0, 1, 1,
-2.795143, -1.170627, -3.126784, 1, 0, 0, 1, 1,
-2.57345, -0.2895507, -1.663324, 0, 0, 0, 1, 1,
-2.531323, 0.1204933, -2.547033, 0, 0, 0, 1, 1,
-2.510089, -0.7023444, -0.9635727, 0, 0, 0, 1, 1,
-2.496688, -0.6004378, -1.737592, 0, 0, 0, 1, 1,
-2.449179, 0.3663194, -1.967994, 0, 0, 0, 1, 1,
-2.407555, 1.144998, -1.533591, 0, 0, 0, 1, 1,
-2.384641, 1.891065, -2.454322, 0, 0, 0, 1, 1,
-2.320036, 0.8081365, -0.8542984, 1, 1, 1, 1, 1,
-2.229086, -0.3165674, -2.979825, 1, 1, 1, 1, 1,
-2.218795, -0.1316431, -1.732946, 1, 1, 1, 1, 1,
-2.205555, 0.383691, -0.651408, 1, 1, 1, 1, 1,
-2.188917, -0.6359447, 0.2048123, 1, 1, 1, 1, 1,
-2.183338, -0.399163, -0.9742222, 1, 1, 1, 1, 1,
-2.091558, -0.3869667, -1.286052, 1, 1, 1, 1, 1,
-2.088289, 1.90526, -1.224643, 1, 1, 1, 1, 1,
-2.07219, 0.3319989, -1.827401, 1, 1, 1, 1, 1,
-2.017214, -1.538282, -3.027004, 1, 1, 1, 1, 1,
-2.016272, 0.7837918, -2.720956, 1, 1, 1, 1, 1,
-1.978139, 0.1442624, -1.342466, 1, 1, 1, 1, 1,
-1.936956, -0.6102212, -0.526046, 1, 1, 1, 1, 1,
-1.918478, 1.409005, -2.862254, 1, 1, 1, 1, 1,
-1.917993, -0.5846326, -2.320648, 1, 1, 1, 1, 1,
-1.907658, 0.3331273, -0.5960608, 0, 0, 1, 1, 1,
-1.898763, 0.5741519, 0.1132462, 1, 0, 0, 1, 1,
-1.832773, -0.3655092, -2.06646, 1, 0, 0, 1, 1,
-1.828134, -0.3294752, -2.739937, 1, 0, 0, 1, 1,
-1.809239, 0.599175, -0.2280914, 1, 0, 0, 1, 1,
-1.800822, 0.1093066, -0.2430196, 1, 0, 0, 1, 1,
-1.756965, -1.378753, -3.891224, 0, 0, 0, 1, 1,
-1.748627, 1.619976, -0.08953735, 0, 0, 0, 1, 1,
-1.73515, 2.427088, -1.804452, 0, 0, 0, 1, 1,
-1.732031, -0.614947, -1.954046, 0, 0, 0, 1, 1,
-1.655732, -0.8603216, -3.709545, 0, 0, 0, 1, 1,
-1.655362, 1.090301, -2.233547, 0, 0, 0, 1, 1,
-1.655149, 1.797522, -0.512495, 0, 0, 0, 1, 1,
-1.645811, 1.826376, -1.281912, 1, 1, 1, 1, 1,
-1.644635, -1.093756, -2.625723, 1, 1, 1, 1, 1,
-1.638613, 1.49834, 1.782492, 1, 1, 1, 1, 1,
-1.613504, 0.6595799, -2.838951, 1, 1, 1, 1, 1,
-1.594276, 0.5214832, -4.318007, 1, 1, 1, 1, 1,
-1.586572, -1.980717, -4.227081, 1, 1, 1, 1, 1,
-1.586022, 1.124679, -0.3531787, 1, 1, 1, 1, 1,
-1.579239, -0.5033916, -4.215822, 1, 1, 1, 1, 1,
-1.57823, -0.6255372, -1.191674, 1, 1, 1, 1, 1,
-1.578089, 0.5904339, -1.573089, 1, 1, 1, 1, 1,
-1.567766, 0.2100648, 0.570918, 1, 1, 1, 1, 1,
-1.551233, 0.3290822, -1.714813, 1, 1, 1, 1, 1,
-1.550955, -0.4341644, -0.694644, 1, 1, 1, 1, 1,
-1.539434, 0.6105182, 0.2292888, 1, 1, 1, 1, 1,
-1.529708, -1.316006, -3.246952, 1, 1, 1, 1, 1,
-1.521073, 0.361143, -1.389967, 0, 0, 1, 1, 1,
-1.519212, -0.6664323, -3.748463, 1, 0, 0, 1, 1,
-1.509598, 0.04557862, -2.262105, 1, 0, 0, 1, 1,
-1.456221, -0.2542655, -1.24603, 1, 0, 0, 1, 1,
-1.444517, -0.009383656, -0.9378963, 1, 0, 0, 1, 1,
-1.433769, 1.335661, -1.175107, 1, 0, 0, 1, 1,
-1.429968, -0.4736255, -2.903942, 0, 0, 0, 1, 1,
-1.426901, -0.05909147, -1.887656, 0, 0, 0, 1, 1,
-1.426037, -0.1414861, -1.823995, 0, 0, 0, 1, 1,
-1.424273, 0.02578229, -1.456228, 0, 0, 0, 1, 1,
-1.422833, 1.25806, -1.246488, 0, 0, 0, 1, 1,
-1.401508, -0.9427087, -1.107751, 0, 0, 0, 1, 1,
-1.394061, 2.187943, -1.195504, 0, 0, 0, 1, 1,
-1.381068, -0.8339617, -1.690722, 1, 1, 1, 1, 1,
-1.378581, -1.688508, -0.6546528, 1, 1, 1, 1, 1,
-1.377637, 0.3796835, -0.1652439, 1, 1, 1, 1, 1,
-1.36577, -1.188856, -1.922776, 1, 1, 1, 1, 1,
-1.363773, 0.8593889, -1.978326, 1, 1, 1, 1, 1,
-1.354077, 0.2307338, -3.906015, 1, 1, 1, 1, 1,
-1.352137, -1.872679, -0.3103607, 1, 1, 1, 1, 1,
-1.345168, 1.713211, 0.4184786, 1, 1, 1, 1, 1,
-1.342026, -2.278796, -2.101388, 1, 1, 1, 1, 1,
-1.329742, 1.589688, -1.173732, 1, 1, 1, 1, 1,
-1.32724, 1.472938, -0.06699792, 1, 1, 1, 1, 1,
-1.307377, 0.5608053, -3.268156, 1, 1, 1, 1, 1,
-1.305697, 0.4410037, -0.9570154, 1, 1, 1, 1, 1,
-1.302808, -0.880163, -0.4874667, 1, 1, 1, 1, 1,
-1.281985, -0.4973719, -3.430942, 1, 1, 1, 1, 1,
-1.27738, 0.9491078, -1.365946, 0, 0, 1, 1, 1,
-1.275319, -0.2718107, -1.144947, 1, 0, 0, 1, 1,
-1.275134, 1.353972, 2.285983, 1, 0, 0, 1, 1,
-1.2647, 0.4369435, -0.9398083, 1, 0, 0, 1, 1,
-1.256042, 0.9753137, -1.150702, 1, 0, 0, 1, 1,
-1.251256, 0.1959335, -3.094338, 1, 0, 0, 1, 1,
-1.247238, -0.5006126, -1.649414, 0, 0, 0, 1, 1,
-1.24492, -0.453142, -2.588168, 0, 0, 0, 1, 1,
-1.240533, -0.04510316, 0.2777761, 0, 0, 0, 1, 1,
-1.239246, -1.219071, -2.963558, 0, 0, 0, 1, 1,
-1.238468, -0.0525143, -1.903198, 0, 0, 0, 1, 1,
-1.236429, -1.888159, -0.7157875, 0, 0, 0, 1, 1,
-1.23397, -2.071907, -0.2265556, 0, 0, 0, 1, 1,
-1.233788, 1.137681, -1.424316, 1, 1, 1, 1, 1,
-1.230712, -0.2068358, -0.7454615, 1, 1, 1, 1, 1,
-1.230267, 1.871072, -1.850703, 1, 1, 1, 1, 1,
-1.230197, -0.1348078, -2.893589, 1, 1, 1, 1, 1,
-1.225739, 0.4591214, -1.727131, 1, 1, 1, 1, 1,
-1.224412, 0.08913515, -3.413505, 1, 1, 1, 1, 1,
-1.223616, 1.269678, -0.7651302, 1, 1, 1, 1, 1,
-1.21944, -0.1701536, -1.426874, 1, 1, 1, 1, 1,
-1.213119, 0.4664074, -1.654993, 1, 1, 1, 1, 1,
-1.210482, -0.3508325, -0.8032534, 1, 1, 1, 1, 1,
-1.208902, -2.754403, -3.038478, 1, 1, 1, 1, 1,
-1.20731, 0.08854537, -3.58395, 1, 1, 1, 1, 1,
-1.195411, -0.02936771, -1.852593, 1, 1, 1, 1, 1,
-1.190707, 1.35347, -1.945775, 1, 1, 1, 1, 1,
-1.185975, -0.1413678, -2.497289, 1, 1, 1, 1, 1,
-1.184267, -0.007249092, -0.6677536, 0, 0, 1, 1, 1,
-1.17961, -0.1418655, -1.05006, 1, 0, 0, 1, 1,
-1.176915, -1.248847, -2.595671, 1, 0, 0, 1, 1,
-1.17354, -0.1225597, -2.350521, 1, 0, 0, 1, 1,
-1.167494, 0.5084971, -1.137868, 1, 0, 0, 1, 1,
-1.167345, 0.2470184, -2.673557, 1, 0, 0, 1, 1,
-1.166796, -1.166834, -2.147148, 0, 0, 0, 1, 1,
-1.166563, -0.03771189, -0.6354862, 0, 0, 0, 1, 1,
-1.164418, -0.7762539, -2.845461, 0, 0, 0, 1, 1,
-1.152521, 0.5385261, -0.02192846, 0, 0, 0, 1, 1,
-1.148614, -1.097624, -1.162559, 0, 0, 0, 1, 1,
-1.144736, 0.430616, -0.1394699, 0, 0, 0, 1, 1,
-1.143992, -1.244839, -1.816334, 0, 0, 0, 1, 1,
-1.142865, 0.6535611, -0.8627775, 1, 1, 1, 1, 1,
-1.141835, 0.1477446, -0.3742082, 1, 1, 1, 1, 1,
-1.141356, -0.5199459, -2.623102, 1, 1, 1, 1, 1,
-1.140206, -0.6134161, -1.117494, 1, 1, 1, 1, 1,
-1.137668, 0.3292819, -0.5790963, 1, 1, 1, 1, 1,
-1.122647, -0.612453, -1.323206, 1, 1, 1, 1, 1,
-1.121844, -0.6217248, -2.369631, 1, 1, 1, 1, 1,
-1.11897, 0.1110606, -1.896891, 1, 1, 1, 1, 1,
-1.11714, 0.9599708, -2.403946, 1, 1, 1, 1, 1,
-1.117131, 0.008613636, -1.07475, 1, 1, 1, 1, 1,
-1.095881, 0.5743106, -2.427596, 1, 1, 1, 1, 1,
-1.09135, 1.830796, -0.1575005, 1, 1, 1, 1, 1,
-1.083776, -0.02531531, -1.845539, 1, 1, 1, 1, 1,
-1.083435, -0.7830571, -0.5592136, 1, 1, 1, 1, 1,
-1.070278, -0.3730246, -0.743077, 1, 1, 1, 1, 1,
-1.068823, -2.082814, -2.270586, 0, 0, 1, 1, 1,
-1.063555, 0.8718739, -2.397992, 1, 0, 0, 1, 1,
-1.057345, -0.1198453, -2.895907, 1, 0, 0, 1, 1,
-1.052316, -0.8079612, -2.639481, 1, 0, 0, 1, 1,
-1.046131, -0.8878528, -1.291008, 1, 0, 0, 1, 1,
-1.045743, -1.002876, -1.971926, 1, 0, 0, 1, 1,
-1.041346, 0.08290777, -0.7504044, 0, 0, 0, 1, 1,
-1.038028, 0.9339229, -1.049191, 0, 0, 0, 1, 1,
-1.028703, 0.7777647, -0.1979022, 0, 0, 0, 1, 1,
-1.026839, -0.9448509, -3.159219, 0, 0, 0, 1, 1,
-1.026387, 0.8505858, -0.2660965, 0, 0, 0, 1, 1,
-1.022987, 0.9263828, 0.4319223, 0, 0, 0, 1, 1,
-1.01729, 2.370152, 0.1471921, 0, 0, 0, 1, 1,
-1.016382, 1.194593, -1.878887, 1, 1, 1, 1, 1,
-1.011081, 1.905848, -1.939301, 1, 1, 1, 1, 1,
-1.006587, -1.055158, -1.97655, 1, 1, 1, 1, 1,
-1.005065, -0.1302432, -2.580422, 1, 1, 1, 1, 1,
-1.001075, -1.384316, -3.193222, 1, 1, 1, 1, 1,
-0.9942334, 0.8264609, -1.450155, 1, 1, 1, 1, 1,
-0.9923698, 1.951683, -2.213625, 1, 1, 1, 1, 1,
-0.9900805, -0.2061981, -2.311452, 1, 1, 1, 1, 1,
-0.9822037, 0.1028257, -1.279595, 1, 1, 1, 1, 1,
-0.9820134, 0.3102339, -1.273217, 1, 1, 1, 1, 1,
-0.981469, -0.2314447, 0.3036391, 1, 1, 1, 1, 1,
-0.9776706, 0.9797761, 0.2322762, 1, 1, 1, 1, 1,
-0.9760199, 0.07034612, -1.553774, 1, 1, 1, 1, 1,
-0.9675197, -0.01632185, -0.3562866, 1, 1, 1, 1, 1,
-0.9659498, -0.7282264, -2.182223, 1, 1, 1, 1, 1,
-0.9657584, 1.248204, -0.5449277, 0, 0, 1, 1, 1,
-0.9531233, 0.432189, -1.410048, 1, 0, 0, 1, 1,
-0.94758, 0.8387012, 0.04727659, 1, 0, 0, 1, 1,
-0.9470536, 0.9880157, -1.522677, 1, 0, 0, 1, 1,
-0.9461028, 0.2946169, -1.107941, 1, 0, 0, 1, 1,
-0.9434296, -0.1370558, -1.718013, 1, 0, 0, 1, 1,
-0.940923, 0.6717039, 0.98974, 0, 0, 0, 1, 1,
-0.9389133, -1.887897, -2.105259, 0, 0, 0, 1, 1,
-0.9359673, 0.4763746, -2.370933, 0, 0, 0, 1, 1,
-0.9316022, -0.5109996, -0.1774668, 0, 0, 0, 1, 1,
-0.9308385, 1.043168, -0.6482454, 0, 0, 0, 1, 1,
-0.9290218, -0.5686907, -1.797668, 0, 0, 0, 1, 1,
-0.9274155, 0.4149553, 0.2746635, 0, 0, 0, 1, 1,
-0.9250386, -0.1386515, -0.6170613, 1, 1, 1, 1, 1,
-0.9218068, -1.320651, -0.9846506, 1, 1, 1, 1, 1,
-0.9165745, 1.060557, 1.040025, 1, 1, 1, 1, 1,
-0.915686, -0.3579918, -1.731628, 1, 1, 1, 1, 1,
-0.9123849, 1.161604, -1.186257, 1, 1, 1, 1, 1,
-0.8850312, 0.3918904, -0.780956, 1, 1, 1, 1, 1,
-0.8836303, 0.1843065, -1.90216, 1, 1, 1, 1, 1,
-0.8819854, 0.8286222, -1.401639, 1, 1, 1, 1, 1,
-0.8774026, 1.218367, -1.250911, 1, 1, 1, 1, 1,
-0.8740798, -0.298514, -1.100935, 1, 1, 1, 1, 1,
-0.8737985, -1.842682, -2.512612, 1, 1, 1, 1, 1,
-0.8632175, 0.2912109, -1.942701, 1, 1, 1, 1, 1,
-0.8625211, 0.3358867, -0.8711846, 1, 1, 1, 1, 1,
-0.8532086, -0.2930355, -2.621695, 1, 1, 1, 1, 1,
-0.8440785, 1.903375, -0.3092552, 1, 1, 1, 1, 1,
-0.8434796, 0.9165199, -0.2172854, 0, 0, 1, 1, 1,
-0.8429061, 0.223469, -3.947163, 1, 0, 0, 1, 1,
-0.8335747, -0.5520831, -2.453382, 1, 0, 0, 1, 1,
-0.8296176, -1.144367, -1.944199, 1, 0, 0, 1, 1,
-0.827152, 0.08096174, -0.3860601, 1, 0, 0, 1, 1,
-0.8198838, -1.498796, -4.746259, 1, 0, 0, 1, 1,
-0.8145508, -0.6738083, -3.286176, 0, 0, 0, 1, 1,
-0.8131272, 0.1704048, 0.1766992, 0, 0, 0, 1, 1,
-0.7999157, 0.2775424, -1.338998, 0, 0, 0, 1, 1,
-0.7956568, -1.213158, -1.178191, 0, 0, 0, 1, 1,
-0.7944862, -0.7548636, -1.599086, 0, 0, 0, 1, 1,
-0.7898931, -0.9902351, -2.050894, 0, 0, 0, 1, 1,
-0.788095, -0.9918898, -3.650043, 0, 0, 0, 1, 1,
-0.787779, -0.3396832, -3.517535, 1, 1, 1, 1, 1,
-0.7861796, 1.143745, -0.4732613, 1, 1, 1, 1, 1,
-0.7837657, -0.4372233, -0.2844011, 1, 1, 1, 1, 1,
-0.7834218, 0.6488227, -2.501776, 1, 1, 1, 1, 1,
-0.7765782, -1.376068, -2.851826, 1, 1, 1, 1, 1,
-0.7761839, -0.4304259, -1.896108, 1, 1, 1, 1, 1,
-0.7728044, -0.9780954, -2.668945, 1, 1, 1, 1, 1,
-0.760062, -0.2067408, 1.709117, 1, 1, 1, 1, 1,
-0.7578579, -1.385723, -0.4187392, 1, 1, 1, 1, 1,
-0.7458752, -1.55847, -3.660712, 1, 1, 1, 1, 1,
-0.744063, -0.7123938, -2.008518, 1, 1, 1, 1, 1,
-0.743899, 0.9957705, -0.6909571, 1, 1, 1, 1, 1,
-0.7417043, 1.209741, -0.0795891, 1, 1, 1, 1, 1,
-0.7267147, -0.623847, -1.832269, 1, 1, 1, 1, 1,
-0.7234226, 0.3227139, -2.645711, 1, 1, 1, 1, 1,
-0.7222964, -0.9321807, -3.596258, 0, 0, 1, 1, 1,
-0.7207259, 0.6114761, -0.1964001, 1, 0, 0, 1, 1,
-0.7201728, 0.1631515, -0.08136895, 1, 0, 0, 1, 1,
-0.7196253, 0.87409, -0.1381105, 1, 0, 0, 1, 1,
-0.7169004, 0.7063693, -2.524494, 1, 0, 0, 1, 1,
-0.7165205, 0.9120489, -0.3474433, 1, 0, 0, 1, 1,
-0.7158767, 1.548042, 0.4620282, 0, 0, 0, 1, 1,
-0.7146971, -0.4200724, -0.05709885, 0, 0, 0, 1, 1,
-0.7126388, 1.117062, 0.4480549, 0, 0, 0, 1, 1,
-0.7122717, -0.03010449, -1.878917, 0, 0, 0, 1, 1,
-0.7099034, -1.350645, -1.330465, 0, 0, 0, 1, 1,
-0.70987, 1.271884, -2.093539, 0, 0, 0, 1, 1,
-0.7072735, 0.497787, -0.333862, 0, 0, 0, 1, 1,
-0.7062744, 2.314924, -0.4697125, 1, 1, 1, 1, 1,
-0.7046239, -0.6858167, -1.704803, 1, 1, 1, 1, 1,
-0.7024869, -0.6203833, -2.916209, 1, 1, 1, 1, 1,
-0.7003748, 1.215865, 0.6254537, 1, 1, 1, 1, 1,
-0.6991984, 0.03090338, -1.184316, 1, 1, 1, 1, 1,
-0.695169, 0.1978179, -1.369854, 1, 1, 1, 1, 1,
-0.6938746, 0.7156662, -1.035962, 1, 1, 1, 1, 1,
-0.6881462, -1.065439, -4.537878, 1, 1, 1, 1, 1,
-0.6839362, -0.6841007, -2.632118, 1, 1, 1, 1, 1,
-0.6824204, -0.02545146, -2.045639, 1, 1, 1, 1, 1,
-0.6803236, -1.422859, -1.715742, 1, 1, 1, 1, 1,
-0.6787975, 0.4457653, -1.464122, 1, 1, 1, 1, 1,
-0.6780482, 0.1139437, -0.4671802, 1, 1, 1, 1, 1,
-0.6738558, 0.02557142, -1.30928, 1, 1, 1, 1, 1,
-0.6706973, -0.3427922, -2.005998, 1, 1, 1, 1, 1,
-0.6621193, -0.2323379, -3.29975, 0, 0, 1, 1, 1,
-0.6558784, 1.175524, -1.987519, 1, 0, 0, 1, 1,
-0.6505185, 0.9163149, 0.167618, 1, 0, 0, 1, 1,
-0.6498898, -0.2601757, -2.007499, 1, 0, 0, 1, 1,
-0.6485845, -0.1707468, -3.085828, 1, 0, 0, 1, 1,
-0.6453407, 0.4270251, -0.7565763, 1, 0, 0, 1, 1,
-0.6410221, -0.353419, 0.5320181, 0, 0, 0, 1, 1,
-0.6393934, -0.5420015, -2.771576, 0, 0, 0, 1, 1,
-0.6386159, 0.4766828, -1.651937, 0, 0, 0, 1, 1,
-0.6321943, -0.5498249, -1.948745, 0, 0, 0, 1, 1,
-0.6308353, -0.08733916, -0.9076154, 0, 0, 0, 1, 1,
-0.6287124, 1.238063, 1.189807, 0, 0, 0, 1, 1,
-0.627857, -0.6188301, -1.427415, 0, 0, 0, 1, 1,
-0.6240169, -2.141729, -2.672321, 1, 1, 1, 1, 1,
-0.6235503, -0.1286443, 1.299416, 1, 1, 1, 1, 1,
-0.6223962, -1.207324, -2.814927, 1, 1, 1, 1, 1,
-0.6202059, 0.8733557, -0.8461713, 1, 1, 1, 1, 1,
-0.6179618, -1.228393, -2.246998, 1, 1, 1, 1, 1,
-0.6144479, -0.1052848, -2.28522, 1, 1, 1, 1, 1,
-0.6034985, -0.4874582, -2.583905, 1, 1, 1, 1, 1,
-0.5998366, -1.275986, -1.549051, 1, 1, 1, 1, 1,
-0.5975429, -1.728574, -1.393873, 1, 1, 1, 1, 1,
-0.5955593, -1.201999, -2.359735, 1, 1, 1, 1, 1,
-0.5932602, 0.6331862, 0.5046055, 1, 1, 1, 1, 1,
-0.5829976, 3.200032, -0.6466455, 1, 1, 1, 1, 1,
-0.5788571, 0.1941973, -0.4316828, 1, 1, 1, 1, 1,
-0.5758644, 0.2489099, 0.07681724, 1, 1, 1, 1, 1,
-0.5697432, 0.7159343, 0.9873689, 1, 1, 1, 1, 1,
-0.5638077, 1.487671, -0.6389569, 0, 0, 1, 1, 1,
-0.562604, 0.9772606, 0.1419238, 1, 0, 0, 1, 1,
-0.56095, -0.2023358, -2.135471, 1, 0, 0, 1, 1,
-0.5590838, 0.1450116, -1.872848, 1, 0, 0, 1, 1,
-0.5590187, -0.9811426, -0.7969852, 1, 0, 0, 1, 1,
-0.558265, -0.17058, -2.32769, 1, 0, 0, 1, 1,
-0.5566971, -0.1907728, -1.083632, 0, 0, 0, 1, 1,
-0.548421, -1.315915, -2.669144, 0, 0, 0, 1, 1,
-0.5466589, 0.4989045, -1.634299, 0, 0, 0, 1, 1,
-0.5408203, -0.1571454, -1.178934, 0, 0, 0, 1, 1,
-0.537508, -2.395886, -3.076129, 0, 0, 0, 1, 1,
-0.5325509, 1.241267, 0.2590353, 0, 0, 0, 1, 1,
-0.5311283, 2.043479, -1.09597, 0, 0, 0, 1, 1,
-0.5305579, -1.543085, -1.53502, 1, 1, 1, 1, 1,
-0.5209696, 1.221356, -1.42827, 1, 1, 1, 1, 1,
-0.5119097, 1.233179, 1.054241, 1, 1, 1, 1, 1,
-0.5105582, -0.0629845, -2.290957, 1, 1, 1, 1, 1,
-0.5061431, -0.8033256, -0.5018509, 1, 1, 1, 1, 1,
-0.4967999, -1.092608, -3.017539, 1, 1, 1, 1, 1,
-0.4958866, -0.223057, -2.125631, 1, 1, 1, 1, 1,
-0.4890279, 0.5025403, -0.7805363, 1, 1, 1, 1, 1,
-0.4881724, -0.7652893, -3.155399, 1, 1, 1, 1, 1,
-0.4878272, -0.3287875, -3.561643, 1, 1, 1, 1, 1,
-0.4871892, 0.6013638, -0.1886531, 1, 1, 1, 1, 1,
-0.4866103, 0.7238482, -1.46572, 1, 1, 1, 1, 1,
-0.4845526, -0.3729074, -0.6857834, 1, 1, 1, 1, 1,
-0.4826848, -0.001462135, -2.284872, 1, 1, 1, 1, 1,
-0.4810985, -0.132908, -2.128133, 1, 1, 1, 1, 1,
-0.4777645, -0.8769066, -2.021455, 0, 0, 1, 1, 1,
-0.4769942, 0.693953, -1.156672, 1, 0, 0, 1, 1,
-0.4682031, 1.402391, 0.1968603, 1, 0, 0, 1, 1,
-0.4678868, -0.1474379, -2.959686, 1, 0, 0, 1, 1,
-0.4678446, -0.6289634, -2.727653, 1, 0, 0, 1, 1,
-0.4621862, 1.801717, -1.188905, 1, 0, 0, 1, 1,
-0.4581504, 0.5835144, 1.292989, 0, 0, 0, 1, 1,
-0.4572276, 2.097847, 0.5706212, 0, 0, 0, 1, 1,
-0.4567199, 0.8804032, -1.764375, 0, 0, 0, 1, 1,
-0.4528185, -0.007847309, -0.8085546, 0, 0, 0, 1, 1,
-0.4515755, 0.6908007, -1.358889, 0, 0, 0, 1, 1,
-0.4493384, -0.7381089, -3.043171, 0, 0, 0, 1, 1,
-0.4490676, 0.7184241, -1.380702, 0, 0, 0, 1, 1,
-0.4461095, -1.873012, -4.426744, 1, 1, 1, 1, 1,
-0.4438597, 0.9310673, -1.207973, 1, 1, 1, 1, 1,
-0.4437061, 0.3927183, -1.499407, 1, 1, 1, 1, 1,
-0.4409409, 0.2670119, -0.7491843, 1, 1, 1, 1, 1,
-0.4407103, -0.185872, -0.5242216, 1, 1, 1, 1, 1,
-0.4374709, -0.005267165, -0.9857209, 1, 1, 1, 1, 1,
-0.4361852, -0.1072823, -2.503402, 1, 1, 1, 1, 1,
-0.432553, 1.039459, 0.914236, 1, 1, 1, 1, 1,
-0.4288554, 1.407543, -1.775731, 1, 1, 1, 1, 1,
-0.4217563, -0.0473679, -1.556648, 1, 1, 1, 1, 1,
-0.4160756, -0.7381001, -3.025972, 1, 1, 1, 1, 1,
-0.4149395, 0.1801154, -0.2454865, 1, 1, 1, 1, 1,
-0.407706, 0.8135033, -1.406456, 1, 1, 1, 1, 1,
-0.4061845, 1.241767, -0.3913357, 1, 1, 1, 1, 1,
-0.4061376, 0.3545857, -2.5871, 1, 1, 1, 1, 1,
-0.4057156, -0.03764043, -1.674485, 0, 0, 1, 1, 1,
-0.4046555, -0.5665683, -2.178121, 1, 0, 0, 1, 1,
-0.4001847, 0.9426904, -0.2053542, 1, 0, 0, 1, 1,
-0.3988267, 1.63691, 0.2195293, 1, 0, 0, 1, 1,
-0.3957249, 0.6598638, 2.143975, 1, 0, 0, 1, 1,
-0.3868957, -1.6107, -4.213429, 1, 0, 0, 1, 1,
-0.3836262, -0.5718137, -2.890542, 0, 0, 0, 1, 1,
-0.3828858, 0.1198713, -2.597626, 0, 0, 0, 1, 1,
-0.3808913, -0.5235772, -3.035573, 0, 0, 0, 1, 1,
-0.3802337, -0.5637015, -3.071301, 0, 0, 0, 1, 1,
-0.3801123, 0.4752285, -0.8007027, 0, 0, 0, 1, 1,
-0.378289, 0.4149631, -1.10588, 0, 0, 0, 1, 1,
-0.3760438, 0.8731602, 0.1388829, 0, 0, 0, 1, 1,
-0.3736669, 0.4205062, -2.076348, 1, 1, 1, 1, 1,
-0.3722845, 0.4745636, -0.481618, 1, 1, 1, 1, 1,
-0.3720614, -0.05931865, -2.341375, 1, 1, 1, 1, 1,
-0.3664062, -0.9185277, -2.836511, 1, 1, 1, 1, 1,
-0.3661593, -1.72367, -0.7191569, 1, 1, 1, 1, 1,
-0.3623152, -1.966955, -3.421039, 1, 1, 1, 1, 1,
-0.3570949, -0.7800034, -1.247854, 1, 1, 1, 1, 1,
-0.356645, -0.07427998, -2.994583, 1, 1, 1, 1, 1,
-0.3563688, -1.31111, -2.146697, 1, 1, 1, 1, 1,
-0.356009, -0.6627893, -3.029391, 1, 1, 1, 1, 1,
-0.3550525, -0.1239571, -2.649936, 1, 1, 1, 1, 1,
-0.3520893, 0.6837673, -0.6134365, 1, 1, 1, 1, 1,
-0.3514332, -1.387397, -1.663475, 1, 1, 1, 1, 1,
-0.3494054, 0.3010439, 0.2475395, 1, 1, 1, 1, 1,
-0.3448863, 1.32362, -1.453866, 1, 1, 1, 1, 1,
-0.3391801, -0.9873388, -1.25002, 0, 0, 1, 1, 1,
-0.338149, -1.209912, -2.790275, 1, 0, 0, 1, 1,
-0.3341208, -0.2998175, -3.155537, 1, 0, 0, 1, 1,
-0.3320467, -0.4331711, -2.991286, 1, 0, 0, 1, 1,
-0.325927, 0.7961953, 0.6964454, 1, 0, 0, 1, 1,
-0.3229523, -0.2465384, -1.002133, 1, 0, 0, 1, 1,
-0.3220666, -0.1938269, -2.82866, 0, 0, 0, 1, 1,
-0.3220268, -1.63682, -2.698035, 0, 0, 0, 1, 1,
-0.3198268, 0.2052827, -2.914575, 0, 0, 0, 1, 1,
-0.3032403, -0.8727605, -2.353948, 0, 0, 0, 1, 1,
-0.303066, 1.671418, 0.1422883, 0, 0, 0, 1, 1,
-0.2965006, 0.8849566, -0.1626188, 0, 0, 0, 1, 1,
-0.2955188, 0.84405, -0.7147139, 0, 0, 0, 1, 1,
-0.294266, 1.652566, -1.151875, 1, 1, 1, 1, 1,
-0.2938114, 0.03827211, -1.544701, 1, 1, 1, 1, 1,
-0.2924216, 0.9875187, -0.6728991, 1, 1, 1, 1, 1,
-0.2846335, 0.1271601, -0.8620973, 1, 1, 1, 1, 1,
-0.2832775, -0.7781072, -2.684124, 1, 1, 1, 1, 1,
-0.2803596, 0.1870042, -2.015019, 1, 1, 1, 1, 1,
-0.2766952, -0.04417472, -2.495521, 1, 1, 1, 1, 1,
-0.2756334, 0.3245749, 0.7600235, 1, 1, 1, 1, 1,
-0.2748661, -0.3451487, -0.8611557, 1, 1, 1, 1, 1,
-0.2694936, 1.517245, 0.8401947, 1, 1, 1, 1, 1,
-0.2668406, 0.5101576, 1.73282, 1, 1, 1, 1, 1,
-0.2647834, 0.01556406, -0.7922798, 1, 1, 1, 1, 1,
-0.2566988, -0.9306796, -3.713421, 1, 1, 1, 1, 1,
-0.246052, -0.6709448, -1.32165, 1, 1, 1, 1, 1,
-0.2452523, 1.363323, -1.870972, 1, 1, 1, 1, 1,
-0.2387937, -0.2509539, -2.487858, 0, 0, 1, 1, 1,
-0.2374004, 2.257991, -0.4470202, 1, 0, 0, 1, 1,
-0.2309166, 0.9304146, -0.45168, 1, 0, 0, 1, 1,
-0.2291449, -0.4581265, -2.561509, 1, 0, 0, 1, 1,
-0.2278963, 0.01527654, -2.554976, 1, 0, 0, 1, 1,
-0.2275802, 1.533993, -1.716672, 1, 0, 0, 1, 1,
-0.2260463, 0.2261013, 0.0999492, 0, 0, 0, 1, 1,
-0.2256761, -1.133105, -4.795228, 0, 0, 0, 1, 1,
-0.224282, -0.8946953, -3.433635, 0, 0, 0, 1, 1,
-0.2242454, -0.001795676, -1.217867, 0, 0, 0, 1, 1,
-0.2217311, 0.9807785, 0.4741471, 0, 0, 0, 1, 1,
-0.2197952, -1.132229, -1.719755, 0, 0, 0, 1, 1,
-0.2186075, -0.6147395, -2.918401, 0, 0, 0, 1, 1,
-0.2185311, 0.7688247, -0.1385046, 1, 1, 1, 1, 1,
-0.2178622, 1.731951, -0.8582224, 1, 1, 1, 1, 1,
-0.2176187, 0.7051131, 1.461427, 1, 1, 1, 1, 1,
-0.2149938, -0.6787031, -2.827416, 1, 1, 1, 1, 1,
-0.2130222, -0.7974237, -4.495234, 1, 1, 1, 1, 1,
-0.2129689, 0.936654, 0.5240592, 1, 1, 1, 1, 1,
-0.2118194, 0.3887623, -1.620921, 1, 1, 1, 1, 1,
-0.2103887, 1.968587, -0.7691715, 1, 1, 1, 1, 1,
-0.2067132, -0.3957871, -1.676576, 1, 1, 1, 1, 1,
-0.2044768, 1.717326, 0.3799759, 1, 1, 1, 1, 1,
-0.2017113, 1.132289, 0.9953363, 1, 1, 1, 1, 1,
-0.200707, -0.5806597, -3.928843, 1, 1, 1, 1, 1,
-0.1986084, 1.028617, 0.9000668, 1, 1, 1, 1, 1,
-0.1980609, 1.385069, -0.1610745, 1, 1, 1, 1, 1,
-0.1974515, 0.01631331, -2.12017, 1, 1, 1, 1, 1,
-0.196366, -1.019579, -1.189963, 0, 0, 1, 1, 1,
-0.196332, 1.173954, -0.7511703, 1, 0, 0, 1, 1,
-0.19356, -0.39728, -3.248877, 1, 0, 0, 1, 1,
-0.1920684, -0.1713767, -3.648969, 1, 0, 0, 1, 1,
-0.1900489, 0.8883067, -2.061773, 1, 0, 0, 1, 1,
-0.1894473, -1.171652, -3.640622, 1, 0, 0, 1, 1,
-0.1884945, 0.08290035, -2.080334, 0, 0, 0, 1, 1,
-0.1865307, 0.1271909, -1.305267, 0, 0, 0, 1, 1,
-0.1859673, -0.3844758, -3.414751, 0, 0, 0, 1, 1,
-0.1808683, -0.3795608, -2.18033, 0, 0, 0, 1, 1,
-0.1783629, 0.002045503, -3.27441, 0, 0, 0, 1, 1,
-0.169768, 0.7721741, 0.8025168, 0, 0, 0, 1, 1,
-0.1589299, 0.6957548, 0.5454352, 0, 0, 0, 1, 1,
-0.1587343, -0.7781486, -2.753858, 1, 1, 1, 1, 1,
-0.1582006, -0.7150928, -3.574309, 1, 1, 1, 1, 1,
-0.1534955, 1.023905, -0.440852, 1, 1, 1, 1, 1,
-0.1505844, -0.3290983, -3.516706, 1, 1, 1, 1, 1,
-0.1496341, 2.181028, 0.9175147, 1, 1, 1, 1, 1,
-0.1472757, -0.1035826, -1.661557, 1, 1, 1, 1, 1,
-0.1379782, 0.7764097, 0.8937007, 1, 1, 1, 1, 1,
-0.1379405, 0.5773723, -1.319167, 1, 1, 1, 1, 1,
-0.1361881, -1.019929, -2.154129, 1, 1, 1, 1, 1,
-0.1188357, 0.1832286, -1.367519, 1, 1, 1, 1, 1,
-0.1147804, -0.4050084, -2.643001, 1, 1, 1, 1, 1,
-0.1137518, -0.03297615, -2.51454, 1, 1, 1, 1, 1,
-0.1134746, -1.667938, -4.776602, 1, 1, 1, 1, 1,
-0.102533, 1.022301, -0.7655903, 1, 1, 1, 1, 1,
-0.1023195, 0.7261769, -0.5513435, 1, 1, 1, 1, 1,
-0.09990484, 0.03403604, -2.355041, 0, 0, 1, 1, 1,
-0.08854414, 0.81229, 1.304367, 1, 0, 0, 1, 1,
-0.08806087, 0.6193324, 0.3734629, 1, 0, 0, 1, 1,
-0.08184043, 0.3876479, -0.3601724, 1, 0, 0, 1, 1,
-0.08128132, 0.8984917, -0.3343942, 1, 0, 0, 1, 1,
-0.07342392, 0.3152168, -1.181659, 1, 0, 0, 1, 1,
-0.06960469, 0.0658785, -1.318427, 0, 0, 0, 1, 1,
-0.06945349, 0.2475691, -1.567759, 0, 0, 0, 1, 1,
-0.06872436, -1.14049, -3.234749, 0, 0, 0, 1, 1,
-0.06778702, 0.8472647, -0.277912, 0, 0, 0, 1, 1,
-0.06610402, -0.01595705, -2.511506, 0, 0, 0, 1, 1,
-0.05853721, -1.178099, -3.095055, 0, 0, 0, 1, 1,
-0.05678852, 1.112865, 0.144794, 0, 0, 0, 1, 1,
-0.05329936, 1.684796, 0.9525082, 1, 1, 1, 1, 1,
-0.04935328, 1.155118, 0.07559697, 1, 1, 1, 1, 1,
-0.04928065, 0.3653881, -0.4970451, 1, 1, 1, 1, 1,
-0.04491407, 1.028019, 1.065243, 1, 1, 1, 1, 1,
-0.04360763, -0.7000074, -2.04571, 1, 1, 1, 1, 1,
-0.03981366, 0.4370474, 0.08590572, 1, 1, 1, 1, 1,
-0.03841444, 0.533659, 0.9761736, 1, 1, 1, 1, 1,
-0.03788901, -1.550198, -3.658309, 1, 1, 1, 1, 1,
-0.03600419, -0.299172, -2.349899, 1, 1, 1, 1, 1,
-0.03443573, -0.8020929, -3.427384, 1, 1, 1, 1, 1,
-0.0311525, -0.7396276, -2.976392, 1, 1, 1, 1, 1,
-0.02612338, 0.1018026, -1.577459, 1, 1, 1, 1, 1,
-0.02567437, -0.0381136, -2.705327, 1, 1, 1, 1, 1,
-0.01580592, 1.996862, 0.2811018, 1, 1, 1, 1, 1,
-0.01462898, -0.1653508, -2.395568, 1, 1, 1, 1, 1,
-0.01335651, 1.27663, 0.8305405, 0, 0, 1, 1, 1,
-0.01226382, 1.539328, -0.09029541, 1, 0, 0, 1, 1,
-0.01183203, 0.3951886, -1.255262, 1, 0, 0, 1, 1,
-0.01165546, 1.293106, -0.5770632, 1, 0, 0, 1, 1,
0.008589393, -2.813669, 3.499076, 1, 0, 0, 1, 1,
0.0119194, 0.8089904, -0.1840794, 1, 0, 0, 1, 1,
0.01258947, 0.6545195, -0.1190669, 0, 0, 0, 1, 1,
0.01310089, -1.768387, 3.322923, 0, 0, 0, 1, 1,
0.0160132, -0.0823188, 3.029711, 0, 0, 0, 1, 1,
0.0176733, 1.545405, 0.01492607, 0, 0, 0, 1, 1,
0.01859172, -1.912144, 2.497847, 0, 0, 0, 1, 1,
0.01893963, -0.9904317, 2.453556, 0, 0, 0, 1, 1,
0.01900427, -0.1624922, 2.428662, 0, 0, 0, 1, 1,
0.02049695, -1.543342, 2.856362, 1, 1, 1, 1, 1,
0.02144898, -0.7891213, 3.537003, 1, 1, 1, 1, 1,
0.02353828, 0.3370291, 0.02031932, 1, 1, 1, 1, 1,
0.02635479, 0.04975536, 1.614007, 1, 1, 1, 1, 1,
0.03741274, 0.4558027, -0.8874992, 1, 1, 1, 1, 1,
0.04225921, -2.706117, 2.491243, 1, 1, 1, 1, 1,
0.04249532, -0.8794979, 4.81841, 1, 1, 1, 1, 1,
0.04562693, -0.7409441, 3.375432, 1, 1, 1, 1, 1,
0.04930313, 0.06609242, 0.6384746, 1, 1, 1, 1, 1,
0.05002385, 0.5259191, -0.5893025, 1, 1, 1, 1, 1,
0.05162262, -1.412624, 2.749394, 1, 1, 1, 1, 1,
0.05233024, -0.6356853, 2.245246, 1, 1, 1, 1, 1,
0.05270699, 0.1535238, 0.4834482, 1, 1, 1, 1, 1,
0.05547177, -0.4709186, 1.257911, 1, 1, 1, 1, 1,
0.05905232, 1.952384, 1.114778, 1, 1, 1, 1, 1,
0.0600528, 1.996292, 1.417492, 0, 0, 1, 1, 1,
0.06014083, 0.7062244, 0.009039529, 1, 0, 0, 1, 1,
0.06253016, -0.1975507, 3.643687, 1, 0, 0, 1, 1,
0.0665146, -0.5769488, 3.868215, 1, 0, 0, 1, 1,
0.06674723, 0.07957179, 0.7248746, 1, 0, 0, 1, 1,
0.06847873, -1.138441, 2.003224, 1, 0, 0, 1, 1,
0.0735008, -0.7087562, 3.750147, 0, 0, 0, 1, 1,
0.07580859, 0.7834092, 0.1898584, 0, 0, 0, 1, 1,
0.07783648, -1.052891, 3.585249, 0, 0, 0, 1, 1,
0.07914798, -0.04025224, 2.436562, 0, 0, 0, 1, 1,
0.08024205, -1.205553, 3.341846, 0, 0, 0, 1, 1,
0.08541997, -1.301083, 3.244196, 0, 0, 0, 1, 1,
0.08594085, 1.310431, 1.03063, 0, 0, 0, 1, 1,
0.08680108, 0.5092981, 1.467457, 1, 1, 1, 1, 1,
0.08740276, 0.8614782, -1.056047, 1, 1, 1, 1, 1,
0.08826783, 0.7708344, 1.137399, 1, 1, 1, 1, 1,
0.0888121, -1.013906, 1.104341, 1, 1, 1, 1, 1,
0.0901724, -0.1900941, 1.949517, 1, 1, 1, 1, 1,
0.09243542, 1.062611, 1.323052, 1, 1, 1, 1, 1,
0.09462871, -1.227913, 4.719717, 1, 1, 1, 1, 1,
0.09625091, 0.7053862, 0.9949078, 1, 1, 1, 1, 1,
0.09884606, -0.08888239, 2.948856, 1, 1, 1, 1, 1,
0.1003999, 0.3515749, 1.668033, 1, 1, 1, 1, 1,
0.1049311, 0.3532087, 0.6171138, 1, 1, 1, 1, 1,
0.1086979, -0.7353283, 4.280777, 1, 1, 1, 1, 1,
0.1093376, 0.4042093, 0.4929145, 1, 1, 1, 1, 1,
0.1115574, -2.450636, 0.744792, 1, 1, 1, 1, 1,
0.1145804, -0.6170031, 4.886993, 1, 1, 1, 1, 1,
0.1178064, -0.4174676, 3.692673, 0, 0, 1, 1, 1,
0.1210247, 0.6707735, 0.01110674, 1, 0, 0, 1, 1,
0.1274207, 0.1937671, 0.2531528, 1, 0, 0, 1, 1,
0.1290059, 1.888707, -0.4886026, 1, 0, 0, 1, 1,
0.1294917, -0.8605637, 2.493908, 1, 0, 0, 1, 1,
0.1309281, -0.9967127, 2.627336, 1, 0, 0, 1, 1,
0.1352949, 0.0463961, 1.515727, 0, 0, 0, 1, 1,
0.1370423, 1.643931, -0.9883907, 0, 0, 0, 1, 1,
0.1407232, 0.1152962, -0.210856, 0, 0, 0, 1, 1,
0.141037, -0.2927008, 2.656062, 0, 0, 0, 1, 1,
0.1490591, 1.311051, 0.8581641, 0, 0, 0, 1, 1,
0.1506187, 0.7853326, -1.331577, 0, 0, 0, 1, 1,
0.1523062, -1.058037, 3.899515, 0, 0, 0, 1, 1,
0.1559376, -0.5724475, 4.07895, 1, 1, 1, 1, 1,
0.1560684, -0.4773054, 3.266723, 1, 1, 1, 1, 1,
0.1565559, -0.9006662, 3.34404, 1, 1, 1, 1, 1,
0.1568663, -0.6861378, 2.520326, 1, 1, 1, 1, 1,
0.1574209, 1.628374, -0.120209, 1, 1, 1, 1, 1,
0.1575515, -1.280087, 4.779763, 1, 1, 1, 1, 1,
0.1578956, 0.5682076, 0.2300548, 1, 1, 1, 1, 1,
0.1588839, 0.5135159, 0.5254885, 1, 1, 1, 1, 1,
0.1595719, 0.2168561, -1.325299, 1, 1, 1, 1, 1,
0.161133, -0.416077, 3.247365, 1, 1, 1, 1, 1,
0.1615732, 0.1107564, -0.7756497, 1, 1, 1, 1, 1,
0.1627439, -0.166917, 3.254836, 1, 1, 1, 1, 1,
0.166204, 1.102753, 0.679144, 1, 1, 1, 1, 1,
0.1668283, -2.276061, 2.695299, 1, 1, 1, 1, 1,
0.1673647, 1.329862, -1.35131, 1, 1, 1, 1, 1,
0.1702916, 0.1806357, -0.4883343, 0, 0, 1, 1, 1,
0.1734941, -1.47795, 4.061762, 1, 0, 0, 1, 1,
0.1737673, 0.2737818, 1.035338, 1, 0, 0, 1, 1,
0.174821, 1.458337, 0.007870343, 1, 0, 0, 1, 1,
0.1750006, -1.32424, 2.172017, 1, 0, 0, 1, 1,
0.1764423, -1.321414, 4.579807, 1, 0, 0, 1, 1,
0.1811163, -1.096259, 2.347608, 0, 0, 0, 1, 1,
0.1825319, 1.147123, 2.022007, 0, 0, 0, 1, 1,
0.1857781, -1.194073, 2.323075, 0, 0, 0, 1, 1,
0.190102, -0.1568507, 1.91498, 0, 0, 0, 1, 1,
0.1901244, 2.548239, 2.270999, 0, 0, 0, 1, 1,
0.1960655, 2.298487, 0.8243695, 0, 0, 0, 1, 1,
0.196082, 0.7117879, 0.2177615, 0, 0, 0, 1, 1,
0.1971617, 1.076586, 0.8116802, 1, 1, 1, 1, 1,
0.1981375, -0.7418477, 4.01196, 1, 1, 1, 1, 1,
0.201403, 0.7146932, 0.6136494, 1, 1, 1, 1, 1,
0.2037925, -0.02511902, 2.261735, 1, 1, 1, 1, 1,
0.2080106, 0.681863, -0.5916463, 1, 1, 1, 1, 1,
0.2098526, 0.5322688, -0.3212079, 1, 1, 1, 1, 1,
0.2133188, 0.281932, -0.3409825, 1, 1, 1, 1, 1,
0.2148695, -2.34968, 2.865481, 1, 1, 1, 1, 1,
0.2157926, 1.218265, 0.2142769, 1, 1, 1, 1, 1,
0.2159882, 1.671609, -0.4865193, 1, 1, 1, 1, 1,
0.2166069, -1.930584, 2.977055, 1, 1, 1, 1, 1,
0.2177834, 1.195591, 1.022843, 1, 1, 1, 1, 1,
0.2247217, -0.959174, 2.896325, 1, 1, 1, 1, 1,
0.2258267, -1.551869, 3.502837, 1, 1, 1, 1, 1,
0.2260952, 0.2865243, 0.7497141, 1, 1, 1, 1, 1,
0.2270746, 0.02259532, 2.949893, 0, 0, 1, 1, 1,
0.2272089, 0.05312746, 1.93907, 1, 0, 0, 1, 1,
0.2381212, -0.5318616, 2.824597, 1, 0, 0, 1, 1,
0.2421927, 0.2854477, -0.2624756, 1, 0, 0, 1, 1,
0.2441939, 1.325429, -3.516774, 1, 0, 0, 1, 1,
0.244981, 1.46589, -0.5119528, 1, 0, 0, 1, 1,
0.2468798, 0.8781824, 1.682664, 0, 0, 0, 1, 1,
0.2511505, -0.6767179, 1.896327, 0, 0, 0, 1, 1,
0.2536056, 0.2865127, 0.4174714, 0, 0, 0, 1, 1,
0.2544104, 0.8391957, 0.1549486, 0, 0, 0, 1, 1,
0.2598685, -0.7969831, 4.569647, 0, 0, 0, 1, 1,
0.263766, -1.260988, 2.92595, 0, 0, 0, 1, 1,
0.2645507, 0.2580121, 1.074484, 0, 0, 0, 1, 1,
0.2659661, 0.4573876, 0.2196374, 1, 1, 1, 1, 1,
0.2668347, 1.980299, 0.5964165, 1, 1, 1, 1, 1,
0.266874, 0.3181153, 3.341235, 1, 1, 1, 1, 1,
0.26817, -0.6800284, 3.509237, 1, 1, 1, 1, 1,
0.2708659, -0.315661, 3.033439, 1, 1, 1, 1, 1,
0.2735892, 1.031483, -0.6754493, 1, 1, 1, 1, 1,
0.2787205, -1.140064, 4.800595, 1, 1, 1, 1, 1,
0.2800794, 0.8576, 0.3700034, 1, 1, 1, 1, 1,
0.28108, -0.7653854, 3.544353, 1, 1, 1, 1, 1,
0.2814888, 0.3738935, 0.6922683, 1, 1, 1, 1, 1,
0.2863081, -0.3089371, 2.691658, 1, 1, 1, 1, 1,
0.288561, -0.3147857, 1.613819, 1, 1, 1, 1, 1,
0.2888736, -0.5317224, 0.5862776, 1, 1, 1, 1, 1,
0.2893505, -0.7226706, 3.711932, 1, 1, 1, 1, 1,
0.2913988, -0.8482216, 1.77154, 1, 1, 1, 1, 1,
0.291513, -0.3804851, 2.259718, 0, 0, 1, 1, 1,
0.295215, 0.6166413, -0.7914725, 1, 0, 0, 1, 1,
0.2952801, 0.0003071135, 1.798893, 1, 0, 0, 1, 1,
0.2963454, 0.9928746, 0.3862192, 1, 0, 0, 1, 1,
0.297464, -0.3404671, 2.721085, 1, 0, 0, 1, 1,
0.2982002, 0.367371, 0.6077604, 1, 0, 0, 1, 1,
0.2987674, 1.043599, 0.4616862, 0, 0, 0, 1, 1,
0.3020071, 0.5489764, 0.51171, 0, 0, 0, 1, 1,
0.3093612, 0.3670048, 2.832609, 0, 0, 0, 1, 1,
0.3274852, -0.452312, 2.554038, 0, 0, 0, 1, 1,
0.3286019, 0.3478992, 1.209311, 0, 0, 0, 1, 1,
0.3333881, 0.2074825, 1.852783, 0, 0, 0, 1, 1,
0.3374372, 0.2937197, 0.934423, 0, 0, 0, 1, 1,
0.3399394, 0.04981488, 1.853911, 1, 1, 1, 1, 1,
0.3432855, 0.310262, -1.062847, 1, 1, 1, 1, 1,
0.3441634, -0.9243319, 2.673882, 1, 1, 1, 1, 1,
0.3497667, 0.3018562, -1.100435, 1, 1, 1, 1, 1,
0.3555934, -1.353481, 2.309175, 1, 1, 1, 1, 1,
0.3661904, -0.5557203, 3.240693, 1, 1, 1, 1, 1,
0.3668343, 1.934226, -0.04865764, 1, 1, 1, 1, 1,
0.3677751, 0.4625679, 1.86044, 1, 1, 1, 1, 1,
0.371126, 1.117424, -0.002251902, 1, 1, 1, 1, 1,
0.3774739, -3.209406, 3.200099, 1, 1, 1, 1, 1,
0.3775882, -0.7565344, 2.517013, 1, 1, 1, 1, 1,
0.3791857, -1.18263, 2.769897, 1, 1, 1, 1, 1,
0.379236, -0.1700664, 1.949463, 1, 1, 1, 1, 1,
0.3796204, -0.4147741, 1.124811, 1, 1, 1, 1, 1,
0.3807829, -0.2644932, 1.234957, 1, 1, 1, 1, 1,
0.3834581, 2.309009, 0.9579577, 0, 0, 1, 1, 1,
0.391169, 2.15285, -0.5419773, 1, 0, 0, 1, 1,
0.3958413, -0.4582445, 1.82709, 1, 0, 0, 1, 1,
0.3990545, -1.072874, 2.335752, 1, 0, 0, 1, 1,
0.4013419, -0.4751841, 1.979168, 1, 0, 0, 1, 1,
0.4089332, -0.5362154, 2.447839, 1, 0, 0, 1, 1,
0.4123773, -0.5073943, 3.04072, 0, 0, 0, 1, 1,
0.419754, 0.1935582, 1.492856, 0, 0, 0, 1, 1,
0.4203099, 1.611056, 0.48364, 0, 0, 0, 1, 1,
0.4223174, -0.8332347, 3.842709, 0, 0, 0, 1, 1,
0.4239433, 0.4315162, 0.9708759, 0, 0, 0, 1, 1,
0.4286509, -2.32874, 2.261288, 0, 0, 0, 1, 1,
0.4312816, 0.9498668, 0.9268805, 0, 0, 0, 1, 1,
0.4315962, -1.716012, 3.476209, 1, 1, 1, 1, 1,
0.4350429, 0.9143937, 2.382108, 1, 1, 1, 1, 1,
0.4365559, -0.2014388, 2.534121, 1, 1, 1, 1, 1,
0.4414752, 0.772835, 1.100432, 1, 1, 1, 1, 1,
0.4415065, -0.3025267, 0.8938338, 1, 1, 1, 1, 1,
0.4428686, 0.5799956, 0.894421, 1, 1, 1, 1, 1,
0.4473522, 0.369255, -0.2530892, 1, 1, 1, 1, 1,
0.4518253, 0.1324554, 1.252503, 1, 1, 1, 1, 1,
0.4531069, 0.1123436, 0.1273635, 1, 1, 1, 1, 1,
0.4607906, -0.3934169, 4.101654, 1, 1, 1, 1, 1,
0.4614314, 0.2408293, 0.1604362, 1, 1, 1, 1, 1,
0.4624696, -0.2578349, 1.030136, 1, 1, 1, 1, 1,
0.4648419, 1.445251, 1.388721, 1, 1, 1, 1, 1,
0.4649495, 0.4701911, 1.019952, 1, 1, 1, 1, 1,
0.4703552, 1.552411, 1.417949, 1, 1, 1, 1, 1,
0.4710059, -0.1585643, 1.92662, 0, 0, 1, 1, 1,
0.4714482, -1.86649, 3.193935, 1, 0, 0, 1, 1,
0.4721442, -1.390774, 3.448483, 1, 0, 0, 1, 1,
0.4739975, -0.9630107, 2.778128, 1, 0, 0, 1, 1,
0.4759271, -0.5744933, 2.527215, 1, 0, 0, 1, 1,
0.4987254, -0.8673061, 2.358866, 1, 0, 0, 1, 1,
0.5018174, -1.035795, 2.186527, 0, 0, 0, 1, 1,
0.5061296, -1.886938, 4.520027, 0, 0, 0, 1, 1,
0.5105792, 1.071723, 0.9491854, 0, 0, 0, 1, 1,
0.5137728, 1.530395, -0.7305241, 0, 0, 0, 1, 1,
0.513955, 0.4695132, 1.666155, 0, 0, 0, 1, 1,
0.5170386, 1.137238, 1.032502, 0, 0, 0, 1, 1,
0.5177858, 0.2027991, 2.251441, 0, 0, 0, 1, 1,
0.5191239, -0.8597768, 2.479434, 1, 1, 1, 1, 1,
0.5191767, -0.1436082, 1.213185, 1, 1, 1, 1, 1,
0.5219182, 0.425212, 1.206364, 1, 1, 1, 1, 1,
0.5223258, 0.7084455, -0.7853991, 1, 1, 1, 1, 1,
0.5265836, -0.2266393, 1.592564, 1, 1, 1, 1, 1,
0.5292903, 0.9573808, -0.1414915, 1, 1, 1, 1, 1,
0.5381152, -0.8426923, 2.460054, 1, 1, 1, 1, 1,
0.5431595, -1.277272, 2.061211, 1, 1, 1, 1, 1,
0.5434195, -2.008544, 2.4593, 1, 1, 1, 1, 1,
0.545316, 0.2629782, 2.321959, 1, 1, 1, 1, 1,
0.5602582, 1.554039, -0.5606082, 1, 1, 1, 1, 1,
0.566949, -1.352395, 2.530974, 1, 1, 1, 1, 1,
0.5720235, -0.07347714, 1.09858, 1, 1, 1, 1, 1,
0.5787013, -0.01387077, 2.106307, 1, 1, 1, 1, 1,
0.5850708, -0.3866422, 2.037172, 1, 1, 1, 1, 1,
0.5852776, -0.016462, 0.6306695, 0, 0, 1, 1, 1,
0.5913162, -0.007840699, 3.526739, 1, 0, 0, 1, 1,
0.593302, 0.6311075, 1.460252, 1, 0, 0, 1, 1,
0.5940453, 0.008554976, 2.072323, 1, 0, 0, 1, 1,
0.5949587, -0.333529, 2.275863, 1, 0, 0, 1, 1,
0.6000652, 0.7997893, 0.8752493, 1, 0, 0, 1, 1,
0.6000654, -0.2686341, 2.808409, 0, 0, 0, 1, 1,
0.6125609, -0.5095926, 2.548194, 0, 0, 0, 1, 1,
0.6135784, 1.196659, -2.205654, 0, 0, 0, 1, 1,
0.6153443, -0.09355932, 3.907114, 0, 0, 0, 1, 1,
0.6175113, -0.0106178, 1.047031, 0, 0, 0, 1, 1,
0.6230894, -0.3967855, 1.888448, 0, 0, 0, 1, 1,
0.623387, -0.7727643, 1.954816, 0, 0, 0, 1, 1,
0.6245792, 0.301829, 2.457093, 1, 1, 1, 1, 1,
0.6259779, 1.838622, -0.08100948, 1, 1, 1, 1, 1,
0.6281698, 0.239025, 3.840173, 1, 1, 1, 1, 1,
0.6320391, 0.2635497, 2.575164, 1, 1, 1, 1, 1,
0.6331796, -2.272944, 2.934146, 1, 1, 1, 1, 1,
0.6381012, 1.000526, -0.2774688, 1, 1, 1, 1, 1,
0.6393187, -0.843179, 4.440368, 1, 1, 1, 1, 1,
0.639703, -0.7827898, 4.135068, 1, 1, 1, 1, 1,
0.6406772, 0.8284881, 0.8758707, 1, 1, 1, 1, 1,
0.6475541, -0.5654393, 3.060457, 1, 1, 1, 1, 1,
0.647567, -1.073195, 1.454213, 1, 1, 1, 1, 1,
0.6490235, 1.555617, 1.152971, 1, 1, 1, 1, 1,
0.6541629, 0.7149909, 1.144454, 1, 1, 1, 1, 1,
0.6667947, 1.487279, 1.845993, 1, 1, 1, 1, 1,
0.669349, 0.3629828, 2.636968, 1, 1, 1, 1, 1,
0.6710356, 0.4909937, 2.399547, 0, 0, 1, 1, 1,
0.6792146, 0.4343075, 2.119708, 1, 0, 0, 1, 1,
0.6817045, -0.9063563, 1.848287, 1, 0, 0, 1, 1,
0.6843473, -1.844444, 2.701874, 1, 0, 0, 1, 1,
0.6846602, 0.5629026, -0.08555514, 1, 0, 0, 1, 1,
0.6863568, -1.255471, 1.58913, 1, 0, 0, 1, 1,
0.6884349, -0.5318195, 3.212795, 0, 0, 0, 1, 1,
0.6895784, -1.005807, 1.713346, 0, 0, 0, 1, 1,
0.6899803, 0.2004928, 0.5141828, 0, 0, 0, 1, 1,
0.6915149, -0.2836442, 3.076484, 0, 0, 0, 1, 1,
0.6980491, -1.323218, 2.212516, 0, 0, 0, 1, 1,
0.7033473, 0.8573072, -0.9825014, 0, 0, 0, 1, 1,
0.7086037, -0.2536107, 1.806448, 0, 0, 0, 1, 1,
0.7117743, -0.4175116, 2.675901, 1, 1, 1, 1, 1,
0.7122227, 0.6563533, 0.8380113, 1, 1, 1, 1, 1,
0.7169104, 1.206103, 0.8115864, 1, 1, 1, 1, 1,
0.7173334, -0.399726, 3.294759, 1, 1, 1, 1, 1,
0.7173488, 1.604422, 0.4768889, 1, 1, 1, 1, 1,
0.7234673, -1.61557, 1.745776, 1, 1, 1, 1, 1,
0.7258877, -0.9759797, 1.919968, 1, 1, 1, 1, 1,
0.7279238, -0.1067469, 0.4268218, 1, 1, 1, 1, 1,
0.7315784, 2.770908, -0.2248964, 1, 1, 1, 1, 1,
0.7370791, 0.6021659, 0.2427728, 1, 1, 1, 1, 1,
0.7426457, -0.3779528, 2.505733, 1, 1, 1, 1, 1,
0.7432941, 0.3137368, 0.4359011, 1, 1, 1, 1, 1,
0.7512215, 0.8850036, 0.9090773, 1, 1, 1, 1, 1,
0.7602811, 1.176344, 1.270716, 1, 1, 1, 1, 1,
0.7647435, -0.6550097, 0.1477634, 1, 1, 1, 1, 1,
0.7647486, 0.8861595, 0.7514263, 0, 0, 1, 1, 1,
0.7659489, 0.6071663, 1.726038, 1, 0, 0, 1, 1,
0.7676552, 0.5389953, 0.5300818, 1, 0, 0, 1, 1,
0.7711834, 0.6767536, 2.746764, 1, 0, 0, 1, 1,
0.7742294, 0.1305907, 1.883049, 1, 0, 0, 1, 1,
0.7752538, 0.4427521, 0.2168162, 1, 0, 0, 1, 1,
0.7782488, 0.7141265, 1.54932, 0, 0, 0, 1, 1,
0.7834113, 0.3899853, 1.958174, 0, 0, 0, 1, 1,
0.7852097, 0.8981275, 1.591948, 0, 0, 0, 1, 1,
0.7883734, -1.060151, 3.45406, 0, 0, 0, 1, 1,
0.7918866, -0.6623292, 2.269363, 0, 0, 0, 1, 1,
0.7948653, 0.1153332, -0.4871307, 0, 0, 0, 1, 1,
0.798896, 1.305493, 0.1256152, 0, 0, 0, 1, 1,
0.79905, -0.4922923, 3.143688, 1, 1, 1, 1, 1,
0.802362, 2.50439, 1.714623, 1, 1, 1, 1, 1,
0.8041967, -0.6429379, 3.503732, 1, 1, 1, 1, 1,
0.8080108, -0.6367431, 2.132874, 1, 1, 1, 1, 1,
0.808033, -0.411325, 1.234246, 1, 1, 1, 1, 1,
0.8093544, 0.2847343, 2.735626, 1, 1, 1, 1, 1,
0.8244775, 0.7234839, 1.963253, 1, 1, 1, 1, 1,
0.8245558, -0.2854588, 3.214921, 1, 1, 1, 1, 1,
0.8282298, 0.8613962, 0.2470389, 1, 1, 1, 1, 1,
0.8282489, 0.205468, 1.627187, 1, 1, 1, 1, 1,
0.8307296, 0.8999551, 0.9539402, 1, 1, 1, 1, 1,
0.8413926, 0.9817302, 0.9699498, 1, 1, 1, 1, 1,
0.8440493, 0.9466994, 0.1980959, 1, 1, 1, 1, 1,
0.8524904, -1.454836, 4.320593, 1, 1, 1, 1, 1,
0.8537548, -1.092004, 2.408678, 1, 1, 1, 1, 1,
0.8556622, 0.1116812, 1.963863, 0, 0, 1, 1, 1,
0.8577886, -1.150124, 2.24765, 1, 0, 0, 1, 1,
0.8624251, -1.411105, 1.597671, 1, 0, 0, 1, 1,
0.8624901, -0.6174871, 1.305281, 1, 0, 0, 1, 1,
0.8672677, 0.3508025, 1.246691, 1, 0, 0, 1, 1,
0.8681272, 0.7920307, 1.659305, 1, 0, 0, 1, 1,
0.8701327, -0.6252794, 2.037011, 0, 0, 0, 1, 1,
0.8750392, -0.1759545, 2.203845, 0, 0, 0, 1, 1,
0.8754596, 1.144635, -1.709425, 0, 0, 0, 1, 1,
0.8795263, 0.7303684, 1.751432, 0, 0, 0, 1, 1,
0.8808377, -0.1199252, 1.352238, 0, 0, 0, 1, 1,
0.8829803, 0.3780389, -0.05836572, 0, 0, 0, 1, 1,
0.8906206, 1.436185, 0.2800999, 0, 0, 0, 1, 1,
0.8910182, 0.6351097, 2.289863, 1, 1, 1, 1, 1,
0.8919212, -0.764056, 2.216747, 1, 1, 1, 1, 1,
0.8942921, -0.6875341, 2.519318, 1, 1, 1, 1, 1,
0.8969376, -0.3264941, 1.738103, 1, 1, 1, 1, 1,
0.9095734, 1.809649, 0.7882699, 1, 1, 1, 1, 1,
0.9136089, -0.2919383, 2.375968, 1, 1, 1, 1, 1,
0.9194652, 0.197503, 0.565686, 1, 1, 1, 1, 1,
0.9202764, 0.6343478, 0.7750378, 1, 1, 1, 1, 1,
0.9240296, -1.265281, 2.296811, 1, 1, 1, 1, 1,
0.9243738, -1.492576, 2.883056, 1, 1, 1, 1, 1,
0.9385062, -0.4047136, 1.598073, 1, 1, 1, 1, 1,
0.9386055, 0.9316533, -0.4850715, 1, 1, 1, 1, 1,
0.9416635, -0.8993972, 2.690702, 1, 1, 1, 1, 1,
0.9543869, -0.7676179, 1.144633, 1, 1, 1, 1, 1,
0.9568235, -0.579312, 1.671822, 1, 1, 1, 1, 1,
0.9583952, 1.319152, -0.1287181, 0, 0, 1, 1, 1,
0.9641008, -0.5318775, 3.302485, 1, 0, 0, 1, 1,
0.9704402, 1.897474, 0.8448078, 1, 0, 0, 1, 1,
0.9723237, 0.361483, 1.112105, 1, 0, 0, 1, 1,
0.9805379, -0.385824, 1.710288, 1, 0, 0, 1, 1,
0.9909262, -2.248394, 4.06021, 1, 0, 0, 1, 1,
0.9972782, 0.2605642, 2.247759, 0, 0, 0, 1, 1,
0.9979795, -0.7024568, 2.365943, 0, 0, 0, 1, 1,
1.002823, 0.8143643, -0.8170066, 0, 0, 0, 1, 1,
1.003683, -0.8621684, 1.151327, 0, 0, 0, 1, 1,
1.00548, -0.9973564, 3.824162, 0, 0, 0, 1, 1,
1.015546, -1.182319, 3.062667, 0, 0, 0, 1, 1,
1.016606, 0.9975935, 1.775393, 0, 0, 0, 1, 1,
1.022329, 0.06109702, 1.38491, 1, 1, 1, 1, 1,
1.030468, -0.2158409, 2.637177, 1, 1, 1, 1, 1,
1.037016, -0.02689014, 0.9711127, 1, 1, 1, 1, 1,
1.037447, -0.1957003, 2.022732, 1, 1, 1, 1, 1,
1.040092, -1.390706, 1.735548, 1, 1, 1, 1, 1,
1.04786, -0.6773683, 2.54285, 1, 1, 1, 1, 1,
1.060335, -0.4450277, 2.986362, 1, 1, 1, 1, 1,
1.060805, -1.455067, 2.688584, 1, 1, 1, 1, 1,
1.06506, 0.03995803, 1.245023, 1, 1, 1, 1, 1,
1.065393, -0.7591292, 3.217839, 1, 1, 1, 1, 1,
1.066327, -1.248514, 2.078087, 1, 1, 1, 1, 1,
1.070104, 1.368856, -0.5993039, 1, 1, 1, 1, 1,
1.078339, -0.3148917, 2.477382, 1, 1, 1, 1, 1,
1.091197, 0.5152065, -0.03143725, 1, 1, 1, 1, 1,
1.096273, 0.6125914, 1.702293, 1, 1, 1, 1, 1,
1.097162, 0.5588429, 1.728073, 0, 0, 1, 1, 1,
1.101986, -0.7881968, 2.392433, 1, 0, 0, 1, 1,
1.107454, -0.8161877, 2.957895, 1, 0, 0, 1, 1,
1.122305, 0.2131097, -0.309327, 1, 0, 0, 1, 1,
1.125679, -0.4630607, 3.815907, 1, 0, 0, 1, 1,
1.129604, 0.08160864, 2.247542, 1, 0, 0, 1, 1,
1.129638, -1.057781, 3.213402, 0, 0, 0, 1, 1,
1.13018, -1.040569, 3.9788, 0, 0, 0, 1, 1,
1.130521, -1.126919, 1.273922, 0, 0, 0, 1, 1,
1.139983, -0.4290437, 1.157009, 0, 0, 0, 1, 1,
1.144954, 0.9143511, 1.818735, 0, 0, 0, 1, 1,
1.172156, 0.3655542, 0.4307601, 0, 0, 0, 1, 1,
1.18726, -0.233116, -0.1143164, 0, 0, 0, 1, 1,
1.187547, 0.1650291, 0.2809844, 1, 1, 1, 1, 1,
1.189747, -0.7542672, 0.3918075, 1, 1, 1, 1, 1,
1.199072, 0.2622992, 0.06073631, 1, 1, 1, 1, 1,
1.201812, 0.7459215, 1.351823, 1, 1, 1, 1, 1,
1.202028, -0.2154713, 1.816812, 1, 1, 1, 1, 1,
1.203406, -0.7898648, -0.0386475, 1, 1, 1, 1, 1,
1.215919, 0.5020609, -0.06097884, 1, 1, 1, 1, 1,
1.216341, 0.03395598, 1.458215, 1, 1, 1, 1, 1,
1.227243, -0.8407994, 1.334738, 1, 1, 1, 1, 1,
1.230293, -1.018116, 3.809272, 1, 1, 1, 1, 1,
1.234614, -0.06219033, 1.301786, 1, 1, 1, 1, 1,
1.235856, -0.3278418, 1.419276, 1, 1, 1, 1, 1,
1.239676, -0.1325112, 1.844777, 1, 1, 1, 1, 1,
1.247318, 2.825743, 1.186256, 1, 1, 1, 1, 1,
1.256484, -0.6069765, 2.918996, 1, 1, 1, 1, 1,
1.256981, -0.1306653, 1.036294, 0, 0, 1, 1, 1,
1.258448, -0.2721003, 2.569991, 1, 0, 0, 1, 1,
1.268779, 0.378815, 2.094491, 1, 0, 0, 1, 1,
1.271954, 0.2389257, 0.7791936, 1, 0, 0, 1, 1,
1.274759, 0.8649687, 0.8336397, 1, 0, 0, 1, 1,
1.276565, -0.5679162, 1.543461, 1, 0, 0, 1, 1,
1.289549, -0.4097775, 1.985648, 0, 0, 0, 1, 1,
1.298724, 0.4661727, 3.616786, 0, 0, 0, 1, 1,
1.302675, 2.875079, 0.3094002, 0, 0, 0, 1, 1,
1.30358, 0.6438612, 0.2611046, 0, 0, 0, 1, 1,
1.307351, 0.6101771, 1.579232, 0, 0, 0, 1, 1,
1.307977, -0.09343292, 2.575959, 0, 0, 0, 1, 1,
1.310813, 0.5700292, 1.926174, 0, 0, 0, 1, 1,
1.319047, -0.7689728, 1.19091, 1, 1, 1, 1, 1,
1.331706, -0.4610845, 0.3101297, 1, 1, 1, 1, 1,
1.333094, 1.101776, 0.3535269, 1, 1, 1, 1, 1,
1.340151, 0.7432396, -0.4898509, 1, 1, 1, 1, 1,
1.34019, 0.2952284, 0.5147695, 1, 1, 1, 1, 1,
1.344101, -0.7663482, 0.6318971, 1, 1, 1, 1, 1,
1.348109, 0.5291584, 0.9233066, 1, 1, 1, 1, 1,
1.349299, -0.5631331, 1.850612, 1, 1, 1, 1, 1,
1.350735, -0.3739762, 1.02141, 1, 1, 1, 1, 1,
1.357001, -0.6084328, 3.258694, 1, 1, 1, 1, 1,
1.357021, -0.8478567, 1.731165, 1, 1, 1, 1, 1,
1.357087, -0.4581354, 3.362644, 1, 1, 1, 1, 1,
1.365126, 0.2656023, -0.6415849, 1, 1, 1, 1, 1,
1.366547, 0.6164892, -0.4188328, 1, 1, 1, 1, 1,
1.370983, -0.4954294, 1.619344, 1, 1, 1, 1, 1,
1.380618, 0.6295933, 3.001598, 0, 0, 1, 1, 1,
1.382996, 0.4416656, -0.530911, 1, 0, 0, 1, 1,
1.390325, -0.09769642, 1.479185, 1, 0, 0, 1, 1,
1.396163, -0.5173585, 0.4004886, 1, 0, 0, 1, 1,
1.399878, 1.344731, 0.7324591, 1, 0, 0, 1, 1,
1.403615, -0.3307811, 1.62369, 1, 0, 0, 1, 1,
1.406922, 0.5649463, 1.328047, 0, 0, 0, 1, 1,
1.411106, -0.001783296, 3.076959, 0, 0, 0, 1, 1,
1.412701, -0.2698909, 0.5682989, 0, 0, 0, 1, 1,
1.414995, -0.9803454, 0.7570341, 0, 0, 0, 1, 1,
1.418147, -1.183614, 1.63565, 0, 0, 0, 1, 1,
1.419475, -0.6795485, 2.820626, 0, 0, 0, 1, 1,
1.42105, -0.3725156, 2.380039, 0, 0, 0, 1, 1,
1.423743, 0.1191465, 2.17938, 1, 1, 1, 1, 1,
1.423814, 1.115493, -0.1763634, 1, 1, 1, 1, 1,
1.425254, -1.070779, 0.9076927, 1, 1, 1, 1, 1,
1.432306, 1.058595, 1.423063, 1, 1, 1, 1, 1,
1.432608, -1.571092, 1.676726, 1, 1, 1, 1, 1,
1.449374, -0.6034044, 2.744115, 1, 1, 1, 1, 1,
1.450768, 0.3320481, 0.8542773, 1, 1, 1, 1, 1,
1.479285, 0.8904515, 0.05843092, 1, 1, 1, 1, 1,
1.486448, 0.5278912, 0.7158969, 1, 1, 1, 1, 1,
1.488911, -0.09151634, 2.618972, 1, 1, 1, 1, 1,
1.493865, -1.476373, 4.300187, 1, 1, 1, 1, 1,
1.513019, 0.3984915, 2.168918, 1, 1, 1, 1, 1,
1.51863, 1.984556, 1.188672, 1, 1, 1, 1, 1,
1.529558, -2.160854, 4.07266, 1, 1, 1, 1, 1,
1.537269, -0.4925267, 1.910965, 1, 1, 1, 1, 1,
1.542752, -0.7248804, 3.28506, 0, 0, 1, 1, 1,
1.545209, -1.194862, 0.9696608, 1, 0, 0, 1, 1,
1.546533, -0.5600119, 1.027731, 1, 0, 0, 1, 1,
1.554134, 1.488077, 0.1987478, 1, 0, 0, 1, 1,
1.562102, 0.001800105, 4.043838, 1, 0, 0, 1, 1,
1.563377, 0.1310239, 1.741211, 1, 0, 0, 1, 1,
1.563811, -1.147868, 2.313943, 0, 0, 0, 1, 1,
1.576645, 0.8814024, 1.116399, 0, 0, 0, 1, 1,
1.576776, 1.184533, -0.1336776, 0, 0, 0, 1, 1,
1.581761, -0.9525324, 1.361701, 0, 0, 0, 1, 1,
1.597763, -0.3613237, 1.549523, 0, 0, 0, 1, 1,
1.606872, -0.4736482, 1.678665, 0, 0, 0, 1, 1,
1.612366, 0.5055482, 2.895129, 0, 0, 0, 1, 1,
1.614323, -0.3943084, 2.966663, 1, 1, 1, 1, 1,
1.614831, 0.5538087, 1.610234, 1, 1, 1, 1, 1,
1.620935, 1.684306, 1.016371, 1, 1, 1, 1, 1,
1.63422, -0.6249842, 1.611188, 1, 1, 1, 1, 1,
1.642665, -0.027241, 1.061966, 1, 1, 1, 1, 1,
1.671831, 0.943173, 0.1480801, 1, 1, 1, 1, 1,
1.674306, 0.8525033, 0.3207859, 1, 1, 1, 1, 1,
1.680833, -0.9050532, 3.190569, 1, 1, 1, 1, 1,
1.68613, -0.1274915, 1.339586, 1, 1, 1, 1, 1,
1.698241, -0.2977116, 0.5724096, 1, 1, 1, 1, 1,
1.710451, 0.07252954, 1.863792, 1, 1, 1, 1, 1,
1.712677, 0.5718584, 1.459275, 1, 1, 1, 1, 1,
1.717038, -1.244205, 1.419118, 1, 1, 1, 1, 1,
1.72026, 0.6967314, 1.144836, 1, 1, 1, 1, 1,
1.723698, 1.099234, 3.23764, 1, 1, 1, 1, 1,
1.728195, -1.454649, 2.962166, 0, 0, 1, 1, 1,
1.729121, 0.9758877, 0.8326292, 1, 0, 0, 1, 1,
1.74352, -0.4983793, 1.347653, 1, 0, 0, 1, 1,
1.798588, -1.500576, 1.021429, 1, 0, 0, 1, 1,
1.805989, 1.941485, -1.33319, 1, 0, 0, 1, 1,
1.810843, -0.00483441, -0.102362, 1, 0, 0, 1, 1,
1.832016, 0.9916974, 1.16237, 0, 0, 0, 1, 1,
1.849473, 0.4776681, 0.2873971, 0, 0, 0, 1, 1,
1.859092, -1.053831, 2.285412, 0, 0, 0, 1, 1,
1.863868, -1.522683, 0.8524771, 0, 0, 0, 1, 1,
1.8781, -1.029639, 2.789095, 0, 0, 0, 1, 1,
1.898679, -0.8009965, 2.110532, 0, 0, 0, 1, 1,
1.903147, 1.362071, 1.797837, 0, 0, 0, 1, 1,
1.908185, -0.01992794, 1.767454, 1, 1, 1, 1, 1,
1.910421, -0.09242834, 1.405136, 1, 1, 1, 1, 1,
1.91351, -0.7162917, 1.742072, 1, 1, 1, 1, 1,
1.940914, 1.116253, 1.893754, 1, 1, 1, 1, 1,
1.948161, 0.4620896, 1.554301, 1, 1, 1, 1, 1,
1.971332, 0.1224063, 2.074772, 1, 1, 1, 1, 1,
1.985406, 1.053061, 1.371262, 1, 1, 1, 1, 1,
2.023915, 0.2569709, 3.288232, 1, 1, 1, 1, 1,
2.038389, 1.195933, 1.448456, 1, 1, 1, 1, 1,
2.069075, -1.084409, 1.593196, 1, 1, 1, 1, 1,
2.099789, -0.8268723, 0.6011236, 1, 1, 1, 1, 1,
2.137907, 0.3059444, -1.73818, 1, 1, 1, 1, 1,
2.138739, -0.6318874, 0.6083797, 1, 1, 1, 1, 1,
2.177347, 1.074492, 1.72439, 1, 1, 1, 1, 1,
2.196429, -0.02449041, 1.301343, 1, 1, 1, 1, 1,
2.230023, -1.130593, 1.408952, 0, 0, 1, 1, 1,
2.249865, 0.834777, 1.13145, 1, 0, 0, 1, 1,
2.341972, -0.3434328, -0.1156001, 1, 0, 0, 1, 1,
2.358563, -0.6114361, 0.7393984, 1, 0, 0, 1, 1,
2.360083, 0.507664, -1.154555, 1, 0, 0, 1, 1,
2.36595, -0.9699715, 1.347124, 1, 0, 0, 1, 1,
2.389622, 1.25521, 2.116908, 0, 0, 0, 1, 1,
2.486239, 1.26229, 1.743428, 0, 0, 0, 1, 1,
2.494737, -0.1117485, 1.087539, 0, 0, 0, 1, 1,
2.498066, -0.7764879, -0.560518, 0, 0, 0, 1, 1,
2.501069, -0.1035911, 2.899843, 0, 0, 0, 1, 1,
2.538874, -0.3935527, 2.235015, 0, 0, 0, 1, 1,
2.594101, 1.640351, 0.6463693, 0, 0, 0, 1, 1,
2.704854, -1.254285, 3.065067, 1, 1, 1, 1, 1,
2.997933, -0.6045465, 4.674918, 1, 1, 1, 1, 1,
3.053779, -0.768008, 2.093135, 1, 1, 1, 1, 1,
3.07885, -0.6200432, 2.697988, 1, 1, 1, 1, 1,
3.287601, -0.6650087, 2.024752, 1, 1, 1, 1, 1,
3.314158, 0.2552591, 2.257132, 1, 1, 1, 1, 1,
4.265383, 0.4185476, 3.093156, 1, 1, 1, 1, 1
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
var radius = 9.444958;
var distance = 33.17501;
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
mvMatrix.translate( -0.582783, 0.004686832, -0.04588246 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.17501);
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
