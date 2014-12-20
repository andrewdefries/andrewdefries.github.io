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
-3.347923, -0.7399566, -1.40379, 1, 0, 0, 1,
-3.179107, -0.1654045, -3.773703, 1, 0.007843138, 0, 1,
-3.008069, 1.141757, -1.028651, 1, 0.01176471, 0, 1,
-2.576218, -0.954884, -0.7039193, 1, 0.01960784, 0, 1,
-2.532143, 0.4750381, -0.7091529, 1, 0.02352941, 0, 1,
-2.493331, 0.1356028, -2.674861, 1, 0.03137255, 0, 1,
-2.459548, 0.3731518, 0.05198689, 1, 0.03529412, 0, 1,
-2.444413, -1.23955, -2.2968, 1, 0.04313726, 0, 1,
-2.407936, 0.2342398, -0.6121857, 1, 0.04705882, 0, 1,
-2.361471, 0.05717149, -2.659128, 1, 0.05490196, 0, 1,
-2.341337, -1.400044, -1.476311, 1, 0.05882353, 0, 1,
-2.310009, 0.2240479, -1.965214, 1, 0.06666667, 0, 1,
-2.212363, -1.118536, -3.547033, 1, 0.07058824, 0, 1,
-2.183475, 0.5802305, -1.123145, 1, 0.07843138, 0, 1,
-2.173108, 1.523956, -1.655822, 1, 0.08235294, 0, 1,
-2.103239, -0.3803446, -1.550378, 1, 0.09019608, 0, 1,
-2.062265, 1.524768, -0.2193075, 1, 0.09411765, 0, 1,
-2.02253, 0.08875035, -1.785946, 1, 0.1019608, 0, 1,
-1.988264, -0.3827486, -2.165864, 1, 0.1098039, 0, 1,
-1.944463, -0.6090164, -2.04986, 1, 0.1137255, 0, 1,
-1.929057, 0.3838234, -1.815593, 1, 0.1215686, 0, 1,
-1.923152, 0.1463381, -2.353949, 1, 0.1254902, 0, 1,
-1.911778, -1.777091, -2.542166, 1, 0.1333333, 0, 1,
-1.907621, 0.1007364, -1.914884, 1, 0.1372549, 0, 1,
-1.905108, 0.6876312, -1.407729, 1, 0.145098, 0, 1,
-1.889068, 1.214257, -0.3051749, 1, 0.1490196, 0, 1,
-1.885162, 0.02712918, -1.792527, 1, 0.1568628, 0, 1,
-1.874776, -0.5647442, -1.935828, 1, 0.1607843, 0, 1,
-1.874019, -0.09331073, -2.47387, 1, 0.1686275, 0, 1,
-1.85239, 0.3537405, -2.07669, 1, 0.172549, 0, 1,
-1.845975, -0.254628, -1.484368, 1, 0.1803922, 0, 1,
-1.838691, -0.3406914, -3.338379, 1, 0.1843137, 0, 1,
-1.831113, -1.675438, -2.26187, 1, 0.1921569, 0, 1,
-1.818982, -0.2187254, -1.576993, 1, 0.1960784, 0, 1,
-1.812619, -0.6250452, -2.175332, 1, 0.2039216, 0, 1,
-1.792133, -0.1093704, -4.025306, 1, 0.2117647, 0, 1,
-1.781507, -0.1784886, -0.6390867, 1, 0.2156863, 0, 1,
-1.767694, -0.4280299, -3.122034, 1, 0.2235294, 0, 1,
-1.739567, 0.04659661, -2.746033, 1, 0.227451, 0, 1,
-1.724033, 0.08491214, -1.643133, 1, 0.2352941, 0, 1,
-1.694833, -0.1307641, -3.414568, 1, 0.2392157, 0, 1,
-1.675362, 0.8241565, -1.707575, 1, 0.2470588, 0, 1,
-1.669448, -1.606627, -3.090022, 1, 0.2509804, 0, 1,
-1.667574, 0.2855482, -2.917751, 1, 0.2588235, 0, 1,
-1.654165, 0.2155043, -2.922207, 1, 0.2627451, 0, 1,
-1.639178, 0.6381568, 0.5262877, 1, 0.2705882, 0, 1,
-1.616368, -0.827708, -2.795799, 1, 0.2745098, 0, 1,
-1.61591, -1.018376, -1.369502, 1, 0.282353, 0, 1,
-1.6157, -1.223929, -0.4311731, 1, 0.2862745, 0, 1,
-1.601329, -0.3297061, -2.982188, 1, 0.2941177, 0, 1,
-1.59773, -0.7513031, -1.427147, 1, 0.3019608, 0, 1,
-1.587751, 0.6946884, -1.504629, 1, 0.3058824, 0, 1,
-1.577941, 0.492908, 0.4505342, 1, 0.3137255, 0, 1,
-1.577917, 1.029745, -3.07973, 1, 0.3176471, 0, 1,
-1.567155, -0.2111639, -2.221438, 1, 0.3254902, 0, 1,
-1.564465, 0.1892944, -0.9476296, 1, 0.3294118, 0, 1,
-1.560899, 1.070553, 0.5945555, 1, 0.3372549, 0, 1,
-1.55182, -1.29058, -1.224089, 1, 0.3411765, 0, 1,
-1.54828, 1.272667, 0.407613, 1, 0.3490196, 0, 1,
-1.53145, -0.3372065, -2.61777, 1, 0.3529412, 0, 1,
-1.528548, -1.092912, -1.871242, 1, 0.3607843, 0, 1,
-1.526989, -0.3349205, -2.327566, 1, 0.3647059, 0, 1,
-1.526487, -0.292909, -3.201382, 1, 0.372549, 0, 1,
-1.50506, 1.236401, 0.5401875, 1, 0.3764706, 0, 1,
-1.500429, -2.49354, -3.080021, 1, 0.3843137, 0, 1,
-1.485556, -1.01255, -1.594485, 1, 0.3882353, 0, 1,
-1.477666, 1.297973, -1.745558, 1, 0.3960784, 0, 1,
-1.475501, 1.557838, 0.3334212, 1, 0.4039216, 0, 1,
-1.474647, -0.6961341, -3.466495, 1, 0.4078431, 0, 1,
-1.460252, -0.3493409, -2.029193, 1, 0.4156863, 0, 1,
-1.442708, 0.06451183, -2.412174, 1, 0.4196078, 0, 1,
-1.442148, -0.5282061, -1.687801, 1, 0.427451, 0, 1,
-1.439254, -0.7904307, -2.590956, 1, 0.4313726, 0, 1,
-1.436492, 0.3997383, -0.2411316, 1, 0.4392157, 0, 1,
-1.42871, 2.323018, -0.4194289, 1, 0.4431373, 0, 1,
-1.428051, 0.2810922, -2.091481, 1, 0.4509804, 0, 1,
-1.427549, 0.07987199, -3.161827, 1, 0.454902, 0, 1,
-1.424652, 1.157053, -1.23346, 1, 0.4627451, 0, 1,
-1.405417, 0.3421533, -0.7714313, 1, 0.4666667, 0, 1,
-1.405042, -1.436176, -2.661764, 1, 0.4745098, 0, 1,
-1.39954, -0.04399739, -1.14006, 1, 0.4784314, 0, 1,
-1.398991, -1.39901, -1.579924, 1, 0.4862745, 0, 1,
-1.392513, 0.1267593, -2.349822, 1, 0.4901961, 0, 1,
-1.383293, -0.4421178, -1.017315, 1, 0.4980392, 0, 1,
-1.378876, 0.005078277, -1.358348, 1, 0.5058824, 0, 1,
-1.376474, 0.6753591, -3.769264, 1, 0.509804, 0, 1,
-1.367074, 1.53155, -2.131042, 1, 0.5176471, 0, 1,
-1.363903, 0.7883944, 0.5295927, 1, 0.5215687, 0, 1,
-1.355812, 0.3419597, -2.708374, 1, 0.5294118, 0, 1,
-1.33963, -1.91125, -1.924721, 1, 0.5333334, 0, 1,
-1.334575, -0.7932844, -2.688538, 1, 0.5411765, 0, 1,
-1.330243, 0.7487059, -1.331065, 1, 0.5450981, 0, 1,
-1.330133, 0.2496314, -1.458673, 1, 0.5529412, 0, 1,
-1.32944, 0.4499346, -0.7454048, 1, 0.5568628, 0, 1,
-1.326026, -0.2543268, -1.659891, 1, 0.5647059, 0, 1,
-1.325816, 0.5897993, -0.5861608, 1, 0.5686275, 0, 1,
-1.32007, -0.1451462, 0.3540161, 1, 0.5764706, 0, 1,
-1.317421, -0.1976086, 0.9181186, 1, 0.5803922, 0, 1,
-1.312397, 1.131169, -0.9898639, 1, 0.5882353, 0, 1,
-1.311789, -1.156118, -1.385226, 1, 0.5921569, 0, 1,
-1.27455, 0.4633276, -0.6870366, 1, 0.6, 0, 1,
-1.263709, 0.5070103, 1.101188, 1, 0.6078432, 0, 1,
-1.239073, 1.337175, -1.422446, 1, 0.6117647, 0, 1,
-1.237066, 1.245299, -0.1462283, 1, 0.6196079, 0, 1,
-1.222521, -0.6640121, -2.054217, 1, 0.6235294, 0, 1,
-1.208002, 0.8960087, -2.091233, 1, 0.6313726, 0, 1,
-1.20715, 1.346455, -1.419169, 1, 0.6352941, 0, 1,
-1.203317, -0.7430602, -2.479132, 1, 0.6431373, 0, 1,
-1.201342, -0.8266438, -0.3854204, 1, 0.6470588, 0, 1,
-1.196835, -0.004865088, -2.409096, 1, 0.654902, 0, 1,
-1.188982, -0.8893391, -3.257168, 1, 0.6588235, 0, 1,
-1.187885, 1.069502, -0.0613825, 1, 0.6666667, 0, 1,
-1.187843, 0.7167107, -1.237859, 1, 0.6705883, 0, 1,
-1.187402, -1.841664, -2.822072, 1, 0.6784314, 0, 1,
-1.169611, 1.157998, -1.571523, 1, 0.682353, 0, 1,
-1.154872, 0.8137531, -1.943892, 1, 0.6901961, 0, 1,
-1.154627, -0.3692164, -1.878146, 1, 0.6941177, 0, 1,
-1.145538, -0.7156452, -3.449134, 1, 0.7019608, 0, 1,
-1.136955, -0.669866, 0.2342224, 1, 0.7098039, 0, 1,
-1.135261, -0.5672324, -4.571271, 1, 0.7137255, 0, 1,
-1.13255, -0.4988145, -3.201068, 1, 0.7215686, 0, 1,
-1.131, -0.7095616, -2.885175, 1, 0.7254902, 0, 1,
-1.110122, 2.934535, -0.3844106, 1, 0.7333333, 0, 1,
-1.099795, 1.626375, -0.9931498, 1, 0.7372549, 0, 1,
-1.095673, 0.8504508, -1.938441, 1, 0.7450981, 0, 1,
-1.094252, 0.8586638, -0.2459076, 1, 0.7490196, 0, 1,
-1.087812, 1.063594, -0.1696955, 1, 0.7568628, 0, 1,
-1.083088, -1.064038, -0.9231189, 1, 0.7607843, 0, 1,
-1.072979, 0.0946655, -1.085497, 1, 0.7686275, 0, 1,
-1.065557, 0.8931202, 0.9558796, 1, 0.772549, 0, 1,
-1.062366, 1.005894, 0.1831653, 1, 0.7803922, 0, 1,
-1.056032, 0.3285813, -2.905735, 1, 0.7843137, 0, 1,
-1.054894, 0.2722193, -2.396888, 1, 0.7921569, 0, 1,
-1.046111, -1.423545, -2.254313, 1, 0.7960784, 0, 1,
-1.039454, -0.2211698, -2.100777, 1, 0.8039216, 0, 1,
-1.038837, 0.549747, -0.6710135, 1, 0.8117647, 0, 1,
-1.034092, -0.6678666, -2.395904, 1, 0.8156863, 0, 1,
-1.032329, -0.1731201, -3.644251, 1, 0.8235294, 0, 1,
-1.030555, -0.6388798, -2.581977, 1, 0.827451, 0, 1,
-1.02586, 0.1557618, 0.4678259, 1, 0.8352941, 0, 1,
-1.023948, 0.6405351, -1.846601, 1, 0.8392157, 0, 1,
-1.016393, -0.6761122, -3.020003, 1, 0.8470588, 0, 1,
-1.013801, 0.4305548, -0.9130659, 1, 0.8509804, 0, 1,
-1.008267, -0.1537996, -0.4968112, 1, 0.8588235, 0, 1,
-1.006967, 1.960543, -0.3419791, 1, 0.8627451, 0, 1,
-1.004308, -1.12385, -1.928562, 1, 0.8705882, 0, 1,
-1.003443, 2.143133, -0.2654907, 1, 0.8745098, 0, 1,
-1.001375, 1.328172, 1.621703, 1, 0.8823529, 0, 1,
-0.99842, 0.5321447, -1.117752, 1, 0.8862745, 0, 1,
-0.9864488, -0.7297247, -2.858672, 1, 0.8941177, 0, 1,
-0.9768202, 1.255313, -0.8795498, 1, 0.8980392, 0, 1,
-0.97456, -0.6738194, -0.2165743, 1, 0.9058824, 0, 1,
-0.9743441, 0.7070756, -0.7538567, 1, 0.9137255, 0, 1,
-0.9736648, 0.4810873, -2.440848, 1, 0.9176471, 0, 1,
-0.9686572, 1.024519, -0.5113419, 1, 0.9254902, 0, 1,
-0.964382, 1.229749, -1.662342, 1, 0.9294118, 0, 1,
-0.9621845, 0.1407651, 0.588784, 1, 0.9372549, 0, 1,
-0.9560938, -0.7173198, -3.157502, 1, 0.9411765, 0, 1,
-0.9523406, 0.2222969, -0.07300623, 1, 0.9490196, 0, 1,
-0.9505051, 1.310771, -0.2615815, 1, 0.9529412, 0, 1,
-0.949853, -1.894667, -3.622341, 1, 0.9607843, 0, 1,
-0.9494413, 0.1741297, -0.5319612, 1, 0.9647059, 0, 1,
-0.9459644, -1.04082, -3.798999, 1, 0.972549, 0, 1,
-0.9398093, -1.395767, -5.21433, 1, 0.9764706, 0, 1,
-0.9370501, 0.0365881, -2.706893, 1, 0.9843137, 0, 1,
-0.935942, -0.1969079, -3.757682, 1, 0.9882353, 0, 1,
-0.9327366, -0.9393777, -2.762386, 1, 0.9960784, 0, 1,
-0.9309165, -1.76098, -2.40707, 0.9960784, 1, 0, 1,
-0.9286688, 0.1005613, -1.500294, 0.9921569, 1, 0, 1,
-0.9245139, -1.851537, -1.567425, 0.9843137, 1, 0, 1,
-0.9139785, 0.5886989, -0.4606631, 0.9803922, 1, 0, 1,
-0.9034076, 0.04474474, -1.514774, 0.972549, 1, 0, 1,
-0.9004788, -1.045729, -0.7842786, 0.9686275, 1, 0, 1,
-0.8894347, -0.2044287, -1.667994, 0.9607843, 1, 0, 1,
-0.8834134, 0.4917284, 0.9396783, 0.9568627, 1, 0, 1,
-0.8785083, 1.165392, -1.201914, 0.9490196, 1, 0, 1,
-0.8771889, 2.265316, -1.943457, 0.945098, 1, 0, 1,
-0.8749451, -0.3350326, -1.198741, 0.9372549, 1, 0, 1,
-0.8720481, 0.1780054, -2.751406, 0.9333333, 1, 0, 1,
-0.8710123, -0.4524291, -0.1800863, 0.9254902, 1, 0, 1,
-0.8689316, 0.2719997, -2.648488, 0.9215686, 1, 0, 1,
-0.8644813, 1.125394, -0.3647948, 0.9137255, 1, 0, 1,
-0.8637049, 0.2719758, -2.262948, 0.9098039, 1, 0, 1,
-0.8635325, 0.07706043, -2.529676, 0.9019608, 1, 0, 1,
-0.8611315, -0.4513537, -2.134312, 0.8941177, 1, 0, 1,
-0.8605841, 1.203725, -1.13769, 0.8901961, 1, 0, 1,
-0.8590263, -1.381959, -3.031769, 0.8823529, 1, 0, 1,
-0.8517686, -1.151712, -1.562745, 0.8784314, 1, 0, 1,
-0.8458377, -0.9113091, -3.346082, 0.8705882, 1, 0, 1,
-0.844923, 0.4443422, -1.586902, 0.8666667, 1, 0, 1,
-0.8325976, -0.04608535, -0.4114332, 0.8588235, 1, 0, 1,
-0.8293419, -1.629511, -1.851851, 0.854902, 1, 0, 1,
-0.8280649, 0.01095354, -1.200547, 0.8470588, 1, 0, 1,
-0.8271902, -1.138166, -2.038504, 0.8431373, 1, 0, 1,
-0.8240832, -0.1702996, -1.835892, 0.8352941, 1, 0, 1,
-0.8194817, 1.782016, 0.2129273, 0.8313726, 1, 0, 1,
-0.8090947, 0.9468905, -0.7654502, 0.8235294, 1, 0, 1,
-0.8085619, -0.1007668, -1.137088, 0.8196079, 1, 0, 1,
-0.8043112, 0.1376656, 0.3000631, 0.8117647, 1, 0, 1,
-0.8003248, 0.5787379, 0.2045705, 0.8078431, 1, 0, 1,
-0.7964391, -0.182992, -1.183152, 0.8, 1, 0, 1,
-0.7938969, -0.3968669, -2.166539, 0.7921569, 1, 0, 1,
-0.7911137, -1.188127, -2.368736, 0.7882353, 1, 0, 1,
-0.7908708, 0.1870938, -2.373122, 0.7803922, 1, 0, 1,
-0.7785519, -1.010517, -1.761864, 0.7764706, 1, 0, 1,
-0.7747117, -1.656174, -1.355015, 0.7686275, 1, 0, 1,
-0.7673513, -1.026096, -3.39651, 0.7647059, 1, 0, 1,
-0.7664185, 0.681594, -0.5107364, 0.7568628, 1, 0, 1,
-0.760074, 0.2190012, -1.206981, 0.7529412, 1, 0, 1,
-0.7599636, -0.5055741, -3.402814, 0.7450981, 1, 0, 1,
-0.7508671, -1.94714, -1.704318, 0.7411765, 1, 0, 1,
-0.7494481, -0.007712664, -1.510825, 0.7333333, 1, 0, 1,
-0.7409842, 0.5095322, -0.9248651, 0.7294118, 1, 0, 1,
-0.7393614, -0.0101869, -0.8628734, 0.7215686, 1, 0, 1,
-0.7390273, -1.986933, -3.814071, 0.7176471, 1, 0, 1,
-0.7383733, -0.2864254, -2.726954, 0.7098039, 1, 0, 1,
-0.735513, 0.919871, -0.5896079, 0.7058824, 1, 0, 1,
-0.7338994, -1.336108, -2.474767, 0.6980392, 1, 0, 1,
-0.7301075, 1.064173, -1.082478, 0.6901961, 1, 0, 1,
-0.7284433, 0.4658806, -0.5263209, 0.6862745, 1, 0, 1,
-0.726348, 0.1446488, -2.182289, 0.6784314, 1, 0, 1,
-0.7260638, -0.4089641, -3.719801, 0.6745098, 1, 0, 1,
-0.7241514, 1.110589, -1.078578, 0.6666667, 1, 0, 1,
-0.7202116, 0.4970264, -1.848899, 0.6627451, 1, 0, 1,
-0.7165935, 0.7325473, -1.742422, 0.654902, 1, 0, 1,
-0.7134541, 0.05121519, -1.388578, 0.6509804, 1, 0, 1,
-0.7121944, 1.305505, -1.448543, 0.6431373, 1, 0, 1,
-0.7111395, -0.2511317, -0.7275036, 0.6392157, 1, 0, 1,
-0.7039263, -0.9264344, 0.3507059, 0.6313726, 1, 0, 1,
-0.6931994, -0.6569815, -1.398423, 0.627451, 1, 0, 1,
-0.6850955, -0.9775686, -2.793508, 0.6196079, 1, 0, 1,
-0.684856, 0.2934419, -3.04611, 0.6156863, 1, 0, 1,
-0.6831061, -2.033087, -2.131906, 0.6078432, 1, 0, 1,
-0.6806265, -1.055183, -2.633591, 0.6039216, 1, 0, 1,
-0.6796476, 0.2404823, -2.300605, 0.5960785, 1, 0, 1,
-0.6790622, -0.6910981, -1.225465, 0.5882353, 1, 0, 1,
-0.6761136, 1.637774, 0.07985359, 0.5843138, 1, 0, 1,
-0.6758345, 0.05472477, -0.6270751, 0.5764706, 1, 0, 1,
-0.6714067, -1.567668, -3.230076, 0.572549, 1, 0, 1,
-0.6696299, 0.9004751, 0.1398575, 0.5647059, 1, 0, 1,
-0.6657814, -1.670508, -1.30849, 0.5607843, 1, 0, 1,
-0.6601469, -0.2538635, -1.60193, 0.5529412, 1, 0, 1,
-0.658649, 1.080845, -1.11052, 0.5490196, 1, 0, 1,
-0.6495009, -0.6561087, -2.352185, 0.5411765, 1, 0, 1,
-0.6456997, -0.9028341, -2.73592, 0.5372549, 1, 0, 1,
-0.6456995, -1.013192, -2.419406, 0.5294118, 1, 0, 1,
-0.6382782, 0.1099551, -2.211517, 0.5254902, 1, 0, 1,
-0.63695, -1.472479, -3.025707, 0.5176471, 1, 0, 1,
-0.63503, 0.4158151, -0.5004539, 0.5137255, 1, 0, 1,
-0.6289908, -1.58396, -4.388207, 0.5058824, 1, 0, 1,
-0.6204181, -1.572205, -3.139113, 0.5019608, 1, 0, 1,
-0.6154218, -1.079126, -3.348435, 0.4941176, 1, 0, 1,
-0.612205, 0.007638284, -1.809158, 0.4862745, 1, 0, 1,
-0.6115469, 0.4609201, 0.1497736, 0.4823529, 1, 0, 1,
-0.6082832, -0.6271493, -2.164218, 0.4745098, 1, 0, 1,
-0.6046911, -0.7600898, -2.610195, 0.4705882, 1, 0, 1,
-0.6046056, 0.7114297, -1.298034, 0.4627451, 1, 0, 1,
-0.6002116, 0.2054077, -0.6462482, 0.4588235, 1, 0, 1,
-0.5989227, 0.02284138, -1.292659, 0.4509804, 1, 0, 1,
-0.5962974, 0.9121087, -1.537997, 0.4470588, 1, 0, 1,
-0.5870903, 0.03199638, -1.362104, 0.4392157, 1, 0, 1,
-0.5862677, 0.4917715, -0.162805, 0.4352941, 1, 0, 1,
-0.5806706, -0.1616607, -2.953137, 0.427451, 1, 0, 1,
-0.5791231, 0.1291004, -0.3261558, 0.4235294, 1, 0, 1,
-0.5759327, -0.3633839, -1.499941, 0.4156863, 1, 0, 1,
-0.5744234, 0.7222962, -1.19742, 0.4117647, 1, 0, 1,
-0.5706179, 0.6339775, 0.3379775, 0.4039216, 1, 0, 1,
-0.5642979, 1.281947, -0.9472409, 0.3960784, 1, 0, 1,
-0.5618228, 0.9768782, -0.2974004, 0.3921569, 1, 0, 1,
-0.5551766, 0.6892341, -0.936821, 0.3843137, 1, 0, 1,
-0.5418312, 0.5691898, -0.5606117, 0.3803922, 1, 0, 1,
-0.5377837, -0.4501469, -3.286945, 0.372549, 1, 0, 1,
-0.5278997, -1.013749, -2.731236, 0.3686275, 1, 0, 1,
-0.5252699, 0.8047935, 0.8344545, 0.3607843, 1, 0, 1,
-0.5229918, -1.535825, -3.185447, 0.3568628, 1, 0, 1,
-0.5135453, 0.08787766, -1.341755, 0.3490196, 1, 0, 1,
-0.5108141, 0.4134925, -3.992814, 0.345098, 1, 0, 1,
-0.5062798, -0.5438696, -5.305185, 0.3372549, 1, 0, 1,
-0.4919065, 1.381663, -1.993052, 0.3333333, 1, 0, 1,
-0.4891787, 1.921751, -0.3494677, 0.3254902, 1, 0, 1,
-0.4884442, 1.292638, -1.375473, 0.3215686, 1, 0, 1,
-0.4884133, 1.030797, -0.6919348, 0.3137255, 1, 0, 1,
-0.4882211, -1.003097, -1.811027, 0.3098039, 1, 0, 1,
-0.48669, -0.1365543, -4.642215, 0.3019608, 1, 0, 1,
-0.4815364, -0.3182285, -3.155614, 0.2941177, 1, 0, 1,
-0.4785541, -0.1434062, -1.66811, 0.2901961, 1, 0, 1,
-0.4771449, -2.462405, -4.662849, 0.282353, 1, 0, 1,
-0.4734208, -1.215519, -2.182739, 0.2784314, 1, 0, 1,
-0.4673333, -0.6613075, -3.156899, 0.2705882, 1, 0, 1,
-0.4614487, 0.6835771, 0.2002253, 0.2666667, 1, 0, 1,
-0.4613582, -0.9897654, -1.701512, 0.2588235, 1, 0, 1,
-0.4601547, -1.445041, -3.315145, 0.254902, 1, 0, 1,
-0.4532647, -1.25785, -2.418982, 0.2470588, 1, 0, 1,
-0.4525695, 1.715247, -0.4066058, 0.2431373, 1, 0, 1,
-0.4524067, 1.686294, -0.9213684, 0.2352941, 1, 0, 1,
-0.4391171, -1.6218, -2.023413, 0.2313726, 1, 0, 1,
-0.4377519, 0.9378105, -0.9211423, 0.2235294, 1, 0, 1,
-0.4357426, -0.8057167, -2.926525, 0.2196078, 1, 0, 1,
-0.4356762, 0.884621, 0.5813199, 0.2117647, 1, 0, 1,
-0.4355602, -0.1987521, -2.957407, 0.2078431, 1, 0, 1,
-0.4353012, 0.1892194, -0.4703816, 0.2, 1, 0, 1,
-0.4256119, 0.5675513, 0.6675912, 0.1921569, 1, 0, 1,
-0.420619, 0.3572904, -3.1666, 0.1882353, 1, 0, 1,
-0.4205184, 0.02704544, -2.814644, 0.1803922, 1, 0, 1,
-0.4190624, 1.092949, -0.230277, 0.1764706, 1, 0, 1,
-0.4153129, -1.073471, -1.333978, 0.1686275, 1, 0, 1,
-0.4139227, -0.1375507, -0.9068028, 0.1647059, 1, 0, 1,
-0.4135894, 0.4635693, 0.7928472, 0.1568628, 1, 0, 1,
-0.4132377, -0.8717484, -3.187755, 0.1529412, 1, 0, 1,
-0.4091433, -0.6964095, -3.270875, 0.145098, 1, 0, 1,
-0.4088271, -0.6356152, -1.826277, 0.1411765, 1, 0, 1,
-0.4059202, 1.329834, 0.4162693, 0.1333333, 1, 0, 1,
-0.4051812, 0.2467466, -1.32733, 0.1294118, 1, 0, 1,
-0.4023205, 0.3328479, -1.341104, 0.1215686, 1, 0, 1,
-0.3964978, 1.097025, -1.245412, 0.1176471, 1, 0, 1,
-0.3955346, -0.1936745, -0.6495072, 0.1098039, 1, 0, 1,
-0.3928097, -1.200488, -0.9812665, 0.1058824, 1, 0, 1,
-0.3920783, -0.2824966, -1.355929, 0.09803922, 1, 0, 1,
-0.3856074, 0.6812574, -1.172389, 0.09019608, 1, 0, 1,
-0.3770568, 0.9805432, 0.3532391, 0.08627451, 1, 0, 1,
-0.3695907, 0.08779457, -3.400567, 0.07843138, 1, 0, 1,
-0.3648096, 0.1453231, -1.732114, 0.07450981, 1, 0, 1,
-0.3643903, 1.730676, 0.203939, 0.06666667, 1, 0, 1,
-0.3635182, 1.933569, 0.7687846, 0.0627451, 1, 0, 1,
-0.3623024, -0.3724148, -1.115489, 0.05490196, 1, 0, 1,
-0.3615179, -0.3254086, -1.110032, 0.05098039, 1, 0, 1,
-0.3578213, -0.183165, -1.829523, 0.04313726, 1, 0, 1,
-0.3571796, 0.006497724, -2.639486, 0.03921569, 1, 0, 1,
-0.3567279, -0.8386605, -3.53487, 0.03137255, 1, 0, 1,
-0.3495553, 1.877484, 0.5524891, 0.02745098, 1, 0, 1,
-0.3476462, 0.2468929, -0.6404145, 0.01960784, 1, 0, 1,
-0.3470136, 0.2749248, 0.432581, 0.01568628, 1, 0, 1,
-0.3461919, 1.510177, -1.979923, 0.007843138, 1, 0, 1,
-0.3447182, 0.3468655, -1.869335, 0.003921569, 1, 0, 1,
-0.34259, -0.2876891, -2.95897, 0, 1, 0.003921569, 1,
-0.3420892, -2.277607, -1.684696, 0, 1, 0.01176471, 1,
-0.340218, -0.5510067, -2.167861, 0, 1, 0.01568628, 1,
-0.3369257, -0.8816864, -3.34476, 0, 1, 0.02352941, 1,
-0.3360411, -1.434207, -6.082112, 0, 1, 0.02745098, 1,
-0.3334392, 0.337912, -0.7793152, 0, 1, 0.03529412, 1,
-0.3300315, 0.007522097, -1.777226, 0, 1, 0.03921569, 1,
-0.3278274, 0.3644395, -0.3694886, 0, 1, 0.04705882, 1,
-0.323388, -0.652324, -2.269349, 0, 1, 0.05098039, 1,
-0.3213091, 1.654178, 0.3581441, 0, 1, 0.05882353, 1,
-0.3199691, 1.468053, -0.8536573, 0, 1, 0.0627451, 1,
-0.317876, 0.4000898, -1.721133, 0, 1, 0.07058824, 1,
-0.3162762, -1.435663, -3.978453, 0, 1, 0.07450981, 1,
-0.310401, -0.320336, -1.280917, 0, 1, 0.08235294, 1,
-0.3099623, -1.020933, -2.960043, 0, 1, 0.08627451, 1,
-0.3093019, -0.9621516, -2.784042, 0, 1, 0.09411765, 1,
-0.3085393, -0.9778183, -2.869319, 0, 1, 0.1019608, 1,
-0.3058091, 0.6192861, -0.03804224, 0, 1, 0.1058824, 1,
-0.3023087, 0.3802639, -0.6595564, 0, 1, 0.1137255, 1,
-0.3022155, -0.04804699, -1.585728, 0, 1, 0.1176471, 1,
-0.3009281, -0.5461739, -3.146354, 0, 1, 0.1254902, 1,
-0.3000675, -0.8930697, -3.214035, 0, 1, 0.1294118, 1,
-0.2989954, -1.22156, -4.116088, 0, 1, 0.1372549, 1,
-0.2984056, -0.2256476, -2.67119, 0, 1, 0.1411765, 1,
-0.2978865, -0.6617968, -2.576901, 0, 1, 0.1490196, 1,
-0.2923492, -0.2184753, -2.420233, 0, 1, 0.1529412, 1,
-0.288327, 1.193663, -0.9369631, 0, 1, 0.1607843, 1,
-0.2832715, -1.880373, -2.466641, 0, 1, 0.1647059, 1,
-0.2816049, -0.04864736, -0.09179462, 0, 1, 0.172549, 1,
-0.2816013, -0.1293498, -1.922256, 0, 1, 0.1764706, 1,
-0.2788088, -0.1526039, -2.023149, 0, 1, 0.1843137, 1,
-0.2782109, 0.2228086, -0.1543486, 0, 1, 0.1882353, 1,
-0.2780896, 0.311935, 0.3119078, 0, 1, 0.1960784, 1,
-0.2687029, 0.682335, 1.295529, 0, 1, 0.2039216, 1,
-0.2660204, 0.2617241, -1.040633, 0, 1, 0.2078431, 1,
-0.2656851, 0.7894667, 0.5052508, 0, 1, 0.2156863, 1,
-0.2637091, 0.2430829, -0.8985587, 0, 1, 0.2196078, 1,
-0.2625809, 0.9128073, 0.5791578, 0, 1, 0.227451, 1,
-0.2510279, 0.7043043, -0.496634, 0, 1, 0.2313726, 1,
-0.2474783, 1.170808, -0.7163659, 0, 1, 0.2392157, 1,
-0.2470961, 1.959207, -0.8385516, 0, 1, 0.2431373, 1,
-0.2414723, -0.475566, -3.046041, 0, 1, 0.2509804, 1,
-0.2367994, -1.053705, -3.020014, 0, 1, 0.254902, 1,
-0.2327676, -0.06175618, -2.451984, 0, 1, 0.2627451, 1,
-0.2293985, 0.2236729, -1.020416, 0, 1, 0.2666667, 1,
-0.227139, 0.3287372, 0.6792827, 0, 1, 0.2745098, 1,
-0.2257334, -1.389607, -3.048711, 0, 1, 0.2784314, 1,
-0.2226004, -0.4698438, -2.890799, 0, 1, 0.2862745, 1,
-0.2188783, 0.1763461, 0.2971577, 0, 1, 0.2901961, 1,
-0.2182218, 1.52903, 0.3032504, 0, 1, 0.2980392, 1,
-0.2167573, -0.5547387, -3.393906, 0, 1, 0.3058824, 1,
-0.2148193, -0.3966674, -1.921499, 0, 1, 0.3098039, 1,
-0.2120189, -0.1656585, -3.483775, 0, 1, 0.3176471, 1,
-0.209622, 1.465431, -0.7401624, 0, 1, 0.3215686, 1,
-0.2084452, -1.282237, -2.983297, 0, 1, 0.3294118, 1,
-0.2080712, -0.2740036, -2.441049, 0, 1, 0.3333333, 1,
-0.2054375, 1.254092, -0.3755737, 0, 1, 0.3411765, 1,
-0.2046946, -0.5988972, -3.361136, 0, 1, 0.345098, 1,
-0.2010825, 0.684979, -0.9468701, 0, 1, 0.3529412, 1,
-0.2005653, -0.9179717, -2.695862, 0, 1, 0.3568628, 1,
-0.1979582, 0.8439015, -0.8266565, 0, 1, 0.3647059, 1,
-0.197114, 0.268049, 1.357109, 0, 1, 0.3686275, 1,
-0.1953604, 0.5192607, 0.02257239, 0, 1, 0.3764706, 1,
-0.1943744, 0.6077113, -0.7079928, 0, 1, 0.3803922, 1,
-0.1928334, -1.345377, -3.371044, 0, 1, 0.3882353, 1,
-0.1909672, 0.2155267, -1.061064, 0, 1, 0.3921569, 1,
-0.1850443, 2.455195, 1.05366, 0, 1, 0.4, 1,
-0.1759426, -0.1563958, -3.405724, 0, 1, 0.4078431, 1,
-0.1759269, 0.09939919, -0.7583256, 0, 1, 0.4117647, 1,
-0.1741, 1.451161, 0.2235302, 0, 1, 0.4196078, 1,
-0.1716767, -0.1757946, -3.194585, 0, 1, 0.4235294, 1,
-0.1712879, -0.2183311, -3.18341, 0, 1, 0.4313726, 1,
-0.1706774, -0.7614599, -2.45566, 0, 1, 0.4352941, 1,
-0.1692783, -0.4066096, -1.465792, 0, 1, 0.4431373, 1,
-0.1668634, 2.245962, 0.6782925, 0, 1, 0.4470588, 1,
-0.1564399, 0.9906923, -0.5734459, 0, 1, 0.454902, 1,
-0.1552789, -1.156791, -3.294791, 0, 1, 0.4588235, 1,
-0.1530499, 1.89418, 1.351765, 0, 1, 0.4666667, 1,
-0.151495, 1.409397, 0.9392495, 0, 1, 0.4705882, 1,
-0.15031, -0.9803658, -4.537773, 0, 1, 0.4784314, 1,
-0.14988, -0.1095351, -0.5569349, 0, 1, 0.4823529, 1,
-0.1471927, -1.114616, -0.8645845, 0, 1, 0.4901961, 1,
-0.1453368, 1.859758, 0.6421668, 0, 1, 0.4941176, 1,
-0.1448989, 0.9506493, 1.717315, 0, 1, 0.5019608, 1,
-0.1422074, -0.8839476, -3.151816, 0, 1, 0.509804, 1,
-0.1391708, 0.7933084, 0.2572024, 0, 1, 0.5137255, 1,
-0.1390341, 0.7329841, 0.4138107, 0, 1, 0.5215687, 1,
-0.1359208, 0.9682847, -1.357463, 0, 1, 0.5254902, 1,
-0.1340693, 0.5105966, -1.690737, 0, 1, 0.5333334, 1,
-0.1292915, -1.017984, -1.841762, 0, 1, 0.5372549, 1,
-0.1279141, 0.3222091, -0.5849385, 0, 1, 0.5450981, 1,
-0.1232767, -2.059228, -2.219734, 0, 1, 0.5490196, 1,
-0.1228012, 0.7780151, -1.455443, 0, 1, 0.5568628, 1,
-0.1219, 0.8859546, -0.6760828, 0, 1, 0.5607843, 1,
-0.1205631, -0.6098021, -4.042235, 0, 1, 0.5686275, 1,
-0.1183234, 0.08689061, -0.6868271, 0, 1, 0.572549, 1,
-0.1180191, -2.107613, -4.170273, 0, 1, 0.5803922, 1,
-0.111721, 0.7957082, 0.9385612, 0, 1, 0.5843138, 1,
-0.1104358, 1.243935, -0.06382986, 0, 1, 0.5921569, 1,
-0.1087671, -0.8692249, -3.584594, 0, 1, 0.5960785, 1,
-0.1083112, -1.175163, -1.95771, 0, 1, 0.6039216, 1,
-0.1067978, -1.452048, -3.357552, 0, 1, 0.6117647, 1,
-0.1059485, -0.6024797, -2.789597, 0, 1, 0.6156863, 1,
-0.1044524, -0.197536, -3.242446, 0, 1, 0.6235294, 1,
-0.1036024, 0.8184914, -0.3174354, 0, 1, 0.627451, 1,
-0.1034055, -0.09797586, -2.792087, 0, 1, 0.6352941, 1,
-0.09997167, -0.1410576, -2.914419, 0, 1, 0.6392157, 1,
-0.09875531, -0.5112944, -2.812754, 0, 1, 0.6470588, 1,
-0.09845558, -0.5814865, -1.856721, 0, 1, 0.6509804, 1,
-0.09732929, -0.7010693, -3.737743, 0, 1, 0.6588235, 1,
-0.09593123, -0.1849706, -3.413223, 0, 1, 0.6627451, 1,
-0.09563706, -0.5311766, -2.940616, 0, 1, 0.6705883, 1,
-0.09548163, -0.6316805, -3.399432, 0, 1, 0.6745098, 1,
-0.0936845, -0.5035092, -4.656971, 0, 1, 0.682353, 1,
-0.09346253, -0.1085281, -3.710624, 0, 1, 0.6862745, 1,
-0.09200758, -1.310013, -3.616596, 0, 1, 0.6941177, 1,
-0.08955959, -0.744857, -1.727104, 0, 1, 0.7019608, 1,
-0.08702055, 0.9446111, 0.03061557, 0, 1, 0.7058824, 1,
-0.08484141, 0.7586265, -2.194922, 0, 1, 0.7137255, 1,
-0.0816437, 0.4279029, -2.492171, 0, 1, 0.7176471, 1,
-0.08051562, 0.611992, -0.7722211, 0, 1, 0.7254902, 1,
-0.07762686, -0.4121547, -2.54714, 0, 1, 0.7294118, 1,
-0.07718083, 0.2844061, -0.8791477, 0, 1, 0.7372549, 1,
-0.07708466, -0.7282661, -2.40355, 0, 1, 0.7411765, 1,
-0.0756996, -0.4315547, -3.942414, 0, 1, 0.7490196, 1,
-0.07409384, -0.5201918, -2.953279, 0, 1, 0.7529412, 1,
-0.07190944, 0.02510728, 1.623898, 0, 1, 0.7607843, 1,
-0.06672677, 0.793855, 1.600452, 0, 1, 0.7647059, 1,
-0.06047551, 0.08531168, -1.387643, 0, 1, 0.772549, 1,
-0.06016269, 1.364546, -1.586266, 0, 1, 0.7764706, 1,
-0.05735585, -0.7752811, -3.871615, 0, 1, 0.7843137, 1,
-0.05721403, -0.1974428, -2.988067, 0, 1, 0.7882353, 1,
-0.04979567, 0.2695996, 0.2084761, 0, 1, 0.7960784, 1,
-0.04832931, -0.2747789, -2.820633, 0, 1, 0.8039216, 1,
-0.04432765, -1.174286, -3.958998, 0, 1, 0.8078431, 1,
-0.04249744, -0.4391168, -2.793292, 0, 1, 0.8156863, 1,
-0.04184934, -0.5594022, -2.621844, 0, 1, 0.8196079, 1,
-0.0374937, -0.907521, -2.992279, 0, 1, 0.827451, 1,
-0.03593193, 0.3406885, 0.865285, 0, 1, 0.8313726, 1,
-0.03535003, -0.7104032, -1.99222, 0, 1, 0.8392157, 1,
-0.02934395, 2.315869, -0.0431755, 0, 1, 0.8431373, 1,
-0.0269436, -1.411698, -2.650534, 0, 1, 0.8509804, 1,
-0.0181874, -0.9444054, -3.991201, 0, 1, 0.854902, 1,
-0.01758615, -0.8991104, -3.911481, 0, 1, 0.8627451, 1,
-0.01055981, -0.3260656, -0.9293882, 0, 1, 0.8666667, 1,
-0.01055547, -1.148348, -1.70728, 0, 1, 0.8745098, 1,
-0.008122047, 0.981786, -0.3462184, 0, 1, 0.8784314, 1,
-0.005843105, -0.2500746, -2.904652, 0, 1, 0.8862745, 1,
-0.001189909, 2.826488, 0.5120338, 0, 1, 0.8901961, 1,
0.001512704, 0.2875681, -0.5722296, 0, 1, 0.8980392, 1,
0.00213227, 1.885993, 1.853544, 0, 1, 0.9058824, 1,
0.00236039, -0.03665166, 3.95457, 0, 1, 0.9098039, 1,
0.01007581, -0.09323213, 2.91554, 0, 1, 0.9176471, 1,
0.01302544, 0.8825389, 0.5871966, 0, 1, 0.9215686, 1,
0.01311633, 1.834799, 0.6213666, 0, 1, 0.9294118, 1,
0.014906, 0.131578, 0.08157646, 0, 1, 0.9333333, 1,
0.01492762, 0.4120884, 0.01964632, 0, 1, 0.9411765, 1,
0.02248969, 1.597735, 0.8093314, 0, 1, 0.945098, 1,
0.02262415, 0.4744428, -0.2557339, 0, 1, 0.9529412, 1,
0.02667028, -1.356566, 4.254292, 0, 1, 0.9568627, 1,
0.02967155, 0.5595552, -0.3044654, 0, 1, 0.9647059, 1,
0.02974972, -0.9445335, 4.200736, 0, 1, 0.9686275, 1,
0.03195283, -1.061248, 4.496942, 0, 1, 0.9764706, 1,
0.0342866, -0.291633, 3.648525, 0, 1, 0.9803922, 1,
0.03524659, -0.3531399, 3.336395, 0, 1, 0.9882353, 1,
0.03719106, 0.6660221, 0.8375984, 0, 1, 0.9921569, 1,
0.04752956, -0.7730873, 3.400625, 0, 1, 1, 1,
0.04882719, 0.5166689, 1.058375, 0, 0.9921569, 1, 1,
0.05052486, 1.941335, -0.4263819, 0, 0.9882353, 1, 1,
0.05114243, 0.5606318, 0.7117768, 0, 0.9803922, 1, 1,
0.05126339, -0.9213956, 3.73417, 0, 0.9764706, 1, 1,
0.05467902, -1.577142, 1.994294, 0, 0.9686275, 1, 1,
0.05544777, -0.4988693, 4.442559, 0, 0.9647059, 1, 1,
0.05561927, 2.147057, 0.7260529, 0, 0.9568627, 1, 1,
0.06496215, 0.3916985, 0.5423396, 0, 0.9529412, 1, 1,
0.06513547, -1.3032, 3.092426, 0, 0.945098, 1, 1,
0.0713815, 0.4672144, 0.2403689, 0, 0.9411765, 1, 1,
0.07202858, 0.7591298, 2.395037, 0, 0.9333333, 1, 1,
0.07436038, -0.393232, 4.088386, 0, 0.9294118, 1, 1,
0.07842633, 0.1684617, -1.34355, 0, 0.9215686, 1, 1,
0.07849503, -0.9928808, 3.329241, 0, 0.9176471, 1, 1,
0.07965364, 0.4194519, -0.3649646, 0, 0.9098039, 1, 1,
0.08082562, -0.8700507, 3.362644, 0, 0.9058824, 1, 1,
0.08159063, 0.2966135, -1.207546, 0, 0.8980392, 1, 1,
0.08192748, -0.5698697, 3.058731, 0, 0.8901961, 1, 1,
0.09013568, -2.201652, 3.812073, 0, 0.8862745, 1, 1,
0.09338038, -1.369608, 3.419488, 0, 0.8784314, 1, 1,
0.0945539, -0.160943, 2.848488, 0, 0.8745098, 1, 1,
0.09469958, -0.538808, 2.540916, 0, 0.8666667, 1, 1,
0.09931324, -0.5048298, 3.153924, 0, 0.8627451, 1, 1,
0.1015147, -0.635974, 4.342976, 0, 0.854902, 1, 1,
0.1038052, 1.431479, -0.07041425, 0, 0.8509804, 1, 1,
0.11704, 1.935572, -0.06056909, 0, 0.8431373, 1, 1,
0.1192946, -1.551325, 2.39338, 0, 0.8392157, 1, 1,
0.1209025, -0.5662495, 3.375602, 0, 0.8313726, 1, 1,
0.1232669, -3.49069, 1.754233, 0, 0.827451, 1, 1,
0.1236756, -0.3438249, 2.869495, 0, 0.8196079, 1, 1,
0.1254632, -0.6027867, 4.179531, 0, 0.8156863, 1, 1,
0.1267557, 1.286254, 0.6676047, 0, 0.8078431, 1, 1,
0.1267706, 1.057235, 1.16286, 0, 0.8039216, 1, 1,
0.1267735, -0.8435655, 0.2801098, 0, 0.7960784, 1, 1,
0.1277331, 0.1968688, 0.4138553, 0, 0.7882353, 1, 1,
0.1289262, 0.9426141, 2.151187, 0, 0.7843137, 1, 1,
0.1384373, 0.4565654, 1.075565, 0, 0.7764706, 1, 1,
0.1387149, 1.272666, 0.5686893, 0, 0.772549, 1, 1,
0.1426763, -2.947597, 3.185318, 0, 0.7647059, 1, 1,
0.1452437, 0.2266217, 0.6460893, 0, 0.7607843, 1, 1,
0.1467318, -0.4088763, 2.517714, 0, 0.7529412, 1, 1,
0.1486856, 0.905234, -0.9913949, 0, 0.7490196, 1, 1,
0.150983, 1.095771, -0.3155661, 0, 0.7411765, 1, 1,
0.1551281, 0.5813257, 0.9555573, 0, 0.7372549, 1, 1,
0.1594938, -1.287534, 1.608022, 0, 0.7294118, 1, 1,
0.1601109, 0.0753439, 0.1717828, 0, 0.7254902, 1, 1,
0.1642823, -0.4676776, 0.1827444, 0, 0.7176471, 1, 1,
0.169644, 0.9785082, 0.02279665, 0, 0.7137255, 1, 1,
0.1696804, 0.522446, 0.5327051, 0, 0.7058824, 1, 1,
0.1743326, -0.3523296, 3.8104, 0, 0.6980392, 1, 1,
0.1757836, 1.154554, -2.55998, 0, 0.6941177, 1, 1,
0.1762106, -0.001043219, 2.929229, 0, 0.6862745, 1, 1,
0.1787662, 0.3420391, 2.035414, 0, 0.682353, 1, 1,
0.1792513, 0.7519077, 1.154904, 0, 0.6745098, 1, 1,
0.1832045, 1.42047, 0.003806738, 0, 0.6705883, 1, 1,
0.1857644, -0.467257, 3.244707, 0, 0.6627451, 1, 1,
0.1874776, -1.391953, 3.306553, 0, 0.6588235, 1, 1,
0.1891447, 0.472561, 1.58722, 0, 0.6509804, 1, 1,
0.1931935, -0.3304998, 2.722006, 0, 0.6470588, 1, 1,
0.1963868, 1.768866, 1.305285, 0, 0.6392157, 1, 1,
0.2094504, 0.2964974, 1.046897, 0, 0.6352941, 1, 1,
0.2102911, 0.1525843, 0.5716873, 0, 0.627451, 1, 1,
0.2117006, -0.03388956, 2.128319, 0, 0.6235294, 1, 1,
0.2150114, -0.3160554, 3.422692, 0, 0.6156863, 1, 1,
0.2198068, -0.6952752, 1.813729, 0, 0.6117647, 1, 1,
0.2205881, -0.7786596, 2.018916, 0, 0.6039216, 1, 1,
0.2229961, 0.3387243, 0.4475019, 0, 0.5960785, 1, 1,
0.2261105, 0.7762111, 0.6218336, 0, 0.5921569, 1, 1,
0.2302606, 0.5107316, -1.374327, 0, 0.5843138, 1, 1,
0.2332725, 0.4967446, 0.6919627, 0, 0.5803922, 1, 1,
0.2344024, 1.917945, -1.243282, 0, 0.572549, 1, 1,
0.2396216, 0.8933766, 1.561473, 0, 0.5686275, 1, 1,
0.2403536, 1.412049, -1.300304, 0, 0.5607843, 1, 1,
0.2429809, 0.2172625, 1.000659, 0, 0.5568628, 1, 1,
0.2451017, -0.9299452, 3.499125, 0, 0.5490196, 1, 1,
0.2452895, -0.008651408, 1.961948, 0, 0.5450981, 1, 1,
0.2494874, -0.8363379, 3.847354, 0, 0.5372549, 1, 1,
0.2507386, -1.562168, 2.882967, 0, 0.5333334, 1, 1,
0.2513698, 1.656639, 0.3765315, 0, 0.5254902, 1, 1,
0.2541033, 0.1269362, 0.9848844, 0, 0.5215687, 1, 1,
0.2576375, -1.643161, 1.663872, 0, 0.5137255, 1, 1,
0.2627025, -0.3653847, 2.050416, 0, 0.509804, 1, 1,
0.2649662, 1.441381, 0.0571432, 0, 0.5019608, 1, 1,
0.2664767, 1.380685, 1.873651, 0, 0.4941176, 1, 1,
0.2782942, -0.8694713, 4.176466, 0, 0.4901961, 1, 1,
0.2809171, 0.9375544, -0.8357257, 0, 0.4823529, 1, 1,
0.2871316, 0.07956461, 1.370965, 0, 0.4784314, 1, 1,
0.2871639, 0.44674, 1.666936, 0, 0.4705882, 1, 1,
0.2908355, -0.5926266, 2.228119, 0, 0.4666667, 1, 1,
0.2915837, -0.5054551, 0.6668615, 0, 0.4588235, 1, 1,
0.2933458, 0.6721536, 1.012514, 0, 0.454902, 1, 1,
0.2977256, -2.614452, 2.237918, 0, 0.4470588, 1, 1,
0.3009902, 1.053179, 0.7002349, 0, 0.4431373, 1, 1,
0.3035888, 1.377442, 1.421262, 0, 0.4352941, 1, 1,
0.3052334, 1.85092, -0.3263504, 0, 0.4313726, 1, 1,
0.3099022, 2.210686, 1.386825, 0, 0.4235294, 1, 1,
0.3113134, -0.01735314, 1.341425, 0, 0.4196078, 1, 1,
0.319458, -0.9529858, 2.674979, 0, 0.4117647, 1, 1,
0.3195333, 0.3086571, 0.390348, 0, 0.4078431, 1, 1,
0.3209674, 0.2202895, 0.5701855, 0, 0.4, 1, 1,
0.3218952, 0.09075736, 0.9984161, 0, 0.3921569, 1, 1,
0.3245533, -0.5769222, 2.111386, 0, 0.3882353, 1, 1,
0.3249287, -0.4165933, 2.627824, 0, 0.3803922, 1, 1,
0.3254988, -0.09014842, 2.100536, 0, 0.3764706, 1, 1,
0.3282055, 0.6464201, 0.8868766, 0, 0.3686275, 1, 1,
0.3327831, -0.4439192, 0.2200773, 0, 0.3647059, 1, 1,
0.3336143, -0.2999235, 2.201847, 0, 0.3568628, 1, 1,
0.3341019, -0.06994666, 2.719723, 0, 0.3529412, 1, 1,
0.3346772, 0.2277428, 1.139271, 0, 0.345098, 1, 1,
0.3385585, 0.593316, 0.3097163, 0, 0.3411765, 1, 1,
0.3403079, -0.1710593, 1.493129, 0, 0.3333333, 1, 1,
0.3513155, 2.80334, 1.459843, 0, 0.3294118, 1, 1,
0.3580701, 1.215463, 2.176747, 0, 0.3215686, 1, 1,
0.3589687, 0.1299318, -0.5771863, 0, 0.3176471, 1, 1,
0.3599837, -0.3062875, 2.351714, 0, 0.3098039, 1, 1,
0.3619593, 0.3535471, 0.2110581, 0, 0.3058824, 1, 1,
0.3631365, -0.133708, 2.12809, 0, 0.2980392, 1, 1,
0.3635472, 0.9575061, -0.1054386, 0, 0.2901961, 1, 1,
0.3653975, 1.056129, 1.677939, 0, 0.2862745, 1, 1,
0.3677443, 1.514024, -1.081558, 0, 0.2784314, 1, 1,
0.3681257, -0.6947902, 1.974322, 0, 0.2745098, 1, 1,
0.3692027, 0.7184505, -0.6021284, 0, 0.2666667, 1, 1,
0.3698183, -0.3156607, 0.3565641, 0, 0.2627451, 1, 1,
0.3706419, -0.2996433, 2.429174, 0, 0.254902, 1, 1,
0.3715214, -0.24408, 2.903597, 0, 0.2509804, 1, 1,
0.3782523, -0.3436996, 2.02518, 0, 0.2431373, 1, 1,
0.3793283, -0.741961, 3.323344, 0, 0.2392157, 1, 1,
0.3819664, -1.031155, 2.52442, 0, 0.2313726, 1, 1,
0.3884183, 1.673348, -0.3963451, 0, 0.227451, 1, 1,
0.3900795, -0.3580692, 0.8587354, 0, 0.2196078, 1, 1,
0.3915855, -1.44268, 3.272511, 0, 0.2156863, 1, 1,
0.3929101, 0.410805, -1.034336, 0, 0.2078431, 1, 1,
0.3964078, 1.863035, 0.6404804, 0, 0.2039216, 1, 1,
0.400389, -0.5885029, 1.190536, 0, 0.1960784, 1, 1,
0.4164866, -0.2795679, 2.023442, 0, 0.1882353, 1, 1,
0.418414, 3.142068, -0.2922197, 0, 0.1843137, 1, 1,
0.4256404, 0.9451525, -0.6964067, 0, 0.1764706, 1, 1,
0.4266964, 0.5983135, -0.1640786, 0, 0.172549, 1, 1,
0.4291746, 0.753622, 2.125254, 0, 0.1647059, 1, 1,
0.4302578, 0.9338198, 1.509016, 0, 0.1607843, 1, 1,
0.4344529, 0.008187905, 2.866058, 0, 0.1529412, 1, 1,
0.4352859, -1.849928, 3.410436, 0, 0.1490196, 1, 1,
0.4359679, 1.194178, 1.073587, 0, 0.1411765, 1, 1,
0.4365188, 1.182552, 0.08698449, 0, 0.1372549, 1, 1,
0.4388301, -0.5955642, 3.52946, 0, 0.1294118, 1, 1,
0.4389524, -0.470097, 1.707323, 0, 0.1254902, 1, 1,
0.4438874, -2.45696, 3.640437, 0, 0.1176471, 1, 1,
0.4498369, 1.550082, 0.2662987, 0, 0.1137255, 1, 1,
0.4523327, -1.700042, 4.347981, 0, 0.1058824, 1, 1,
0.454579, 0.9612467, 1.133853, 0, 0.09803922, 1, 1,
0.456596, 0.9506976, -0.3140501, 0, 0.09411765, 1, 1,
0.4581065, -0.86784, 3.111406, 0, 0.08627451, 1, 1,
0.4592041, -1.626589, 2.853629, 0, 0.08235294, 1, 1,
0.4629936, -0.79821, 2.164265, 0, 0.07450981, 1, 1,
0.4641573, 2.748197, -1.821205, 0, 0.07058824, 1, 1,
0.4644765, -0.3700177, 1.774176, 0, 0.0627451, 1, 1,
0.4659417, 0.1181797, 2.564063, 0, 0.05882353, 1, 1,
0.4660161, 0.1405021, 0.3259645, 0, 0.05098039, 1, 1,
0.4666406, 0.01782819, 0.3667827, 0, 0.04705882, 1, 1,
0.4674152, -0.5484602, 2.122039, 0, 0.03921569, 1, 1,
0.4689666, -1.516897, 2.658303, 0, 0.03529412, 1, 1,
0.4695907, 0.07904913, 0.2801633, 0, 0.02745098, 1, 1,
0.4710497, 0.002955084, 1.221828, 0, 0.02352941, 1, 1,
0.471782, 0.2962294, -1.510248, 0, 0.01568628, 1, 1,
0.4759113, 0.3097795, 0.2640866, 0, 0.01176471, 1, 1,
0.4850166, -0.6667067, 3.522477, 0, 0.003921569, 1, 1,
0.4856595, -2.204968, 4.058066, 0.003921569, 0, 1, 1,
0.4876792, -0.6201902, 2.388674, 0.007843138, 0, 1, 1,
0.4947705, 1.027419, -1.399292, 0.01568628, 0, 1, 1,
0.4947914, -0.2093755, 2.070079, 0.01960784, 0, 1, 1,
0.49687, -0.390633, 1.183814, 0.02745098, 0, 1, 1,
0.497407, 0.6545192, 0.9904072, 0.03137255, 0, 1, 1,
0.4980103, 1.082382, -0.993015, 0.03921569, 0, 1, 1,
0.5019056, 1.025381, 0.1938175, 0.04313726, 0, 1, 1,
0.5100497, 0.939791, -0.2957617, 0.05098039, 0, 1, 1,
0.5167657, -0.2771545, 0.958968, 0.05490196, 0, 1, 1,
0.5198435, 1.4835, 0.8942692, 0.0627451, 0, 1, 1,
0.5285962, -0.1857342, 1.326477, 0.06666667, 0, 1, 1,
0.5292557, 0.4689501, 1.523199, 0.07450981, 0, 1, 1,
0.530781, 2.594467, -0.7992994, 0.07843138, 0, 1, 1,
0.5369344, -2.327136, 3.534863, 0.08627451, 0, 1, 1,
0.5485385, -0.2044627, -0.3249158, 0.09019608, 0, 1, 1,
0.5498322, -0.2468705, 2.923945, 0.09803922, 0, 1, 1,
0.5619192, 0.2110411, -1.061445, 0.1058824, 0, 1, 1,
0.5666658, 0.5446265, 1.307015, 0.1098039, 0, 1, 1,
0.5682341, -0.009011273, 0.4753462, 0.1176471, 0, 1, 1,
0.5728441, -1.536861, 1.011211, 0.1215686, 0, 1, 1,
0.5738983, 0.07495414, 2.86432, 0.1294118, 0, 1, 1,
0.5749875, -0.8859304, 2.158891, 0.1333333, 0, 1, 1,
0.5756054, 1.140097, 0.2015715, 0.1411765, 0, 1, 1,
0.5774217, -0.577517, 1.806111, 0.145098, 0, 1, 1,
0.5801345, 0.4341929, 1.218971, 0.1529412, 0, 1, 1,
0.5833346, 0.6554626, 0.3979463, 0.1568628, 0, 1, 1,
0.5898744, 0.5382396, 0.9989396, 0.1647059, 0, 1, 1,
0.5914035, -0.1926979, 2.64194, 0.1686275, 0, 1, 1,
0.5981465, -0.78886, 1.705095, 0.1764706, 0, 1, 1,
0.6006233, 0.1218987, 1.585391, 0.1803922, 0, 1, 1,
0.6033887, 0.4379314, 1.362039, 0.1882353, 0, 1, 1,
0.6040357, -0.8011013, 2.495651, 0.1921569, 0, 1, 1,
0.6058424, -0.9692671, 3.384784, 0.2, 0, 1, 1,
0.6059084, -1.136386, 1.461869, 0.2078431, 0, 1, 1,
0.6064621, -1.646557, 3.436365, 0.2117647, 0, 1, 1,
0.6077753, -0.1456786, 0.4816035, 0.2196078, 0, 1, 1,
0.608059, 1.294682, 0.4201665, 0.2235294, 0, 1, 1,
0.6088905, -0.4051239, 2.223017, 0.2313726, 0, 1, 1,
0.6137, 0.4117994, 2.008362, 0.2352941, 0, 1, 1,
0.6174695, -1.908453, 4.693293, 0.2431373, 0, 1, 1,
0.6289201, 0.8428156, -0.03187974, 0.2470588, 0, 1, 1,
0.6318651, 1.387696, 0.2187501, 0.254902, 0, 1, 1,
0.6319215, 0.2430476, 1.455683, 0.2588235, 0, 1, 1,
0.63314, -0.05167365, 2.477437, 0.2666667, 0, 1, 1,
0.6363198, -1.466567, 2.530174, 0.2705882, 0, 1, 1,
0.6408885, -0.08538275, 2.448964, 0.2784314, 0, 1, 1,
0.6466227, -1.047476, 3.144171, 0.282353, 0, 1, 1,
0.6494759, 0.2283521, 0.130803, 0.2901961, 0, 1, 1,
0.6500227, 0.167383, 2.123137, 0.2941177, 0, 1, 1,
0.650507, 1.170252, 1.554814, 0.3019608, 0, 1, 1,
0.6510533, -0.4980293, 2.543962, 0.3098039, 0, 1, 1,
0.6524792, -0.4373007, -0.1306274, 0.3137255, 0, 1, 1,
0.6538291, -1.269203, 4.548314, 0.3215686, 0, 1, 1,
0.6557419, 0.8723304, 0.1447444, 0.3254902, 0, 1, 1,
0.6623312, 0.179451, 0.592682, 0.3333333, 0, 1, 1,
0.6677306, -0.3201801, 2.352089, 0.3372549, 0, 1, 1,
0.6679116, 0.6278119, 0.6320416, 0.345098, 0, 1, 1,
0.6705873, -0.8915037, 2.092429, 0.3490196, 0, 1, 1,
0.6744483, -1.162687, 0.6961286, 0.3568628, 0, 1, 1,
0.678092, 0.1355088, 2.903454, 0.3607843, 0, 1, 1,
0.6787036, -1.882059, 3.778421, 0.3686275, 0, 1, 1,
0.6826697, 0.209202, 0.9169804, 0.372549, 0, 1, 1,
0.6830239, -0.2970802, 2.391583, 0.3803922, 0, 1, 1,
0.6848035, -0.33472, 2.024486, 0.3843137, 0, 1, 1,
0.6861807, 1.898918, 0.6703727, 0.3921569, 0, 1, 1,
0.6865079, 0.4389929, 0.9720513, 0.3960784, 0, 1, 1,
0.6880501, 0.7657938, 0.4348947, 0.4039216, 0, 1, 1,
0.6893802, 0.1640207, 1.808056, 0.4117647, 0, 1, 1,
0.6918712, -0.3529744, 1.350371, 0.4156863, 0, 1, 1,
0.694873, -0.5167191, 0.8877493, 0.4235294, 0, 1, 1,
0.7047843, 0.05920412, 1.742791, 0.427451, 0, 1, 1,
0.7058315, 0.7182918, 2.903642, 0.4352941, 0, 1, 1,
0.7148353, 0.4888563, 1.565299, 0.4392157, 0, 1, 1,
0.7156627, 0.08629071, 2.2012, 0.4470588, 0, 1, 1,
0.7174427, -0.2850808, 2.210362, 0.4509804, 0, 1, 1,
0.7180754, 0.7172742, -1.849505, 0.4588235, 0, 1, 1,
0.7183721, -2.468583, 5.332836, 0.4627451, 0, 1, 1,
0.7205343, 1.454023, 0.9964805, 0.4705882, 0, 1, 1,
0.7218527, 0.05109781, -0.7673187, 0.4745098, 0, 1, 1,
0.722172, -0.5616343, 3.142362, 0.4823529, 0, 1, 1,
0.7231336, -0.05604581, 1.374233, 0.4862745, 0, 1, 1,
0.7233121, 0.5021189, 1.768458, 0.4941176, 0, 1, 1,
0.7283598, 0.5978968, -0.1104317, 0.5019608, 0, 1, 1,
0.7289012, 0.8952, 1.953283, 0.5058824, 0, 1, 1,
0.7331243, -0.427739, 4.26418, 0.5137255, 0, 1, 1,
0.7359502, -0.1432226, 2.166343, 0.5176471, 0, 1, 1,
0.7371906, 0.8017574, -0.4112655, 0.5254902, 0, 1, 1,
0.7431799, 1.079515, -0.09180275, 0.5294118, 0, 1, 1,
0.7482643, -0.06272592, 1.163391, 0.5372549, 0, 1, 1,
0.7487547, 1.512562, -0.848358, 0.5411765, 0, 1, 1,
0.748789, 0.2260512, 2.220271, 0.5490196, 0, 1, 1,
0.750727, 0.613196, -0.4602742, 0.5529412, 0, 1, 1,
0.772897, -1.573656, 2.095468, 0.5607843, 0, 1, 1,
0.7733957, 0.6141016, 1.185554, 0.5647059, 0, 1, 1,
0.7736642, 2.442617, 0.5081641, 0.572549, 0, 1, 1,
0.7792036, 1.362702, -0.388139, 0.5764706, 0, 1, 1,
0.7813464, -1.008571, 3.825082, 0.5843138, 0, 1, 1,
0.7828767, 2.229737, 1.019691, 0.5882353, 0, 1, 1,
0.7843634, 0.992874, -0.7326569, 0.5960785, 0, 1, 1,
0.7880053, 0.02857647, 2.43901, 0.6039216, 0, 1, 1,
0.7886446, 0.6699086, -0.7171833, 0.6078432, 0, 1, 1,
0.7948492, -1.56747, 3.671821, 0.6156863, 0, 1, 1,
0.7958434, 0.7874835, 1.235735, 0.6196079, 0, 1, 1,
0.7969776, 0.9109079, 1.24587, 0.627451, 0, 1, 1,
0.7984797, -0.4981144, 2.867546, 0.6313726, 0, 1, 1,
0.8086632, 0.8348655, 1.217859, 0.6392157, 0, 1, 1,
0.8109145, -2.162655, 3.234328, 0.6431373, 0, 1, 1,
0.8123836, -0.1407627, 2.390034, 0.6509804, 0, 1, 1,
0.8180876, 0.3262998, 2.869683, 0.654902, 0, 1, 1,
0.8199924, -2.231705, 1.873946, 0.6627451, 0, 1, 1,
0.8237826, 0.1738579, 1.323031, 0.6666667, 0, 1, 1,
0.8257664, 0.7146555, -0.05638221, 0.6745098, 0, 1, 1,
0.8268015, 0.2475726, 1.281588, 0.6784314, 0, 1, 1,
0.8274648, -0.5799162, 1.522481, 0.6862745, 0, 1, 1,
0.8356451, -0.3969102, 2.662093, 0.6901961, 0, 1, 1,
0.8357966, 1.863431, -0.1430515, 0.6980392, 0, 1, 1,
0.8466898, -0.3989446, 2.729407, 0.7058824, 0, 1, 1,
0.848494, -1.352894, 2.868178, 0.7098039, 0, 1, 1,
0.8515582, -0.2631072, 1.078858, 0.7176471, 0, 1, 1,
0.856474, -2.543451, 3.095327, 0.7215686, 0, 1, 1,
0.8588532, -0.1832987, 0.5303279, 0.7294118, 0, 1, 1,
0.8608359, -0.3685155, 1.951047, 0.7333333, 0, 1, 1,
0.8623015, 0.3452741, 1.451061, 0.7411765, 0, 1, 1,
0.8636968, -1.338572, 2.841845, 0.7450981, 0, 1, 1,
0.8655338, 1.994881, 1.914514, 0.7529412, 0, 1, 1,
0.8674616, 0.6891404, 1.245357, 0.7568628, 0, 1, 1,
0.8815309, 0.9128243, 0.4286169, 0.7647059, 0, 1, 1,
0.882112, -0.2835557, 2.545899, 0.7686275, 0, 1, 1,
0.8856755, 0.7074122, -0.1456062, 0.7764706, 0, 1, 1,
0.8896852, -0.7169302, 1.361467, 0.7803922, 0, 1, 1,
0.90325, -1.85578, 2.635954, 0.7882353, 0, 1, 1,
0.9042752, 1.099708, 1.613939, 0.7921569, 0, 1, 1,
0.9074872, 0.2679541, 1.512122, 0.8, 0, 1, 1,
0.9102589, -0.2647061, 2.241286, 0.8078431, 0, 1, 1,
0.9113104, 1.117237, 0.4010487, 0.8117647, 0, 1, 1,
0.9178736, 1.024239, 0.7161855, 0.8196079, 0, 1, 1,
0.9192231, -0.1585386, 0.820036, 0.8235294, 0, 1, 1,
0.9202728, -0.6790072, 4.006641, 0.8313726, 0, 1, 1,
0.9205047, 2.814124, -0.06226028, 0.8352941, 0, 1, 1,
0.9236196, 2.36333, 0.1670395, 0.8431373, 0, 1, 1,
0.9276217, -0.8677107, 3.705315, 0.8470588, 0, 1, 1,
0.9308606, -0.0110756, 2.078992, 0.854902, 0, 1, 1,
0.9311053, 1.479213, 0.02637766, 0.8588235, 0, 1, 1,
0.935373, 0.1019058, 2.229931, 0.8666667, 0, 1, 1,
0.9371684, 0.3867302, 0.7683108, 0.8705882, 0, 1, 1,
0.9374941, 0.7818936, 1.278207, 0.8784314, 0, 1, 1,
0.9480412, -0.3133004, 2.633058, 0.8823529, 0, 1, 1,
0.9485993, 1.549114, -0.6234572, 0.8901961, 0, 1, 1,
0.9535066, -0.6319514, 2.194857, 0.8941177, 0, 1, 1,
0.9561712, -0.5937414, 3.080943, 0.9019608, 0, 1, 1,
0.9566351, 0.2798057, -0.3345189, 0.9098039, 0, 1, 1,
0.9568768, 0.6917834, 1.880329, 0.9137255, 0, 1, 1,
0.9589567, 2.097404, -0.9445089, 0.9215686, 0, 1, 1,
0.9757047, -0.4444547, 3.096711, 0.9254902, 0, 1, 1,
0.9818674, -0.382006, 2.884169, 0.9333333, 0, 1, 1,
0.9843478, -0.6587967, 1.76841, 0.9372549, 0, 1, 1,
0.9899872, -0.8245385, 3.914918, 0.945098, 0, 1, 1,
0.990372, -1.965855, 1.098813, 0.9490196, 0, 1, 1,
0.9933098, 0.4754066, 3.254869, 0.9568627, 0, 1, 1,
0.9939682, -1.172384, 3.710836, 0.9607843, 0, 1, 1,
0.998087, -1.00957, 3.593125, 0.9686275, 0, 1, 1,
1.000024, 1.66434, -0.03939507, 0.972549, 0, 1, 1,
1.002191, 0.5576391, 1.751124, 0.9803922, 0, 1, 1,
1.01216, 0.3230453, 1.921924, 0.9843137, 0, 1, 1,
1.014826, 0.3243001, 1.068653, 0.9921569, 0, 1, 1,
1.015305, 1.221741, 1.734289, 0.9960784, 0, 1, 1,
1.019017, -0.1345264, 1.258667, 1, 0, 0.9960784, 1,
1.019154, -0.1928933, 2.869407, 1, 0, 0.9882353, 1,
1.02025, -0.5790612, 1.061835, 1, 0, 0.9843137, 1,
1.022644, 0.5667472, 0.7319231, 1, 0, 0.9764706, 1,
1.030131, -0.9559103, 0.9587154, 1, 0, 0.972549, 1,
1.031958, 0.02206, 2.340661, 1, 0, 0.9647059, 1,
1.032507, -0.9265413, 2.009619, 1, 0, 0.9607843, 1,
1.033202, 0.3659027, 1.859575, 1, 0, 0.9529412, 1,
1.033689, -0.4815198, 1.922268, 1, 0, 0.9490196, 1,
1.034505, 1.346221, 0.2457996, 1, 0, 0.9411765, 1,
1.038943, 0.1578042, 2.476349, 1, 0, 0.9372549, 1,
1.041819, -0.2366216, 3.257621, 1, 0, 0.9294118, 1,
1.042223, -1.021474, 0.4281901, 1, 0, 0.9254902, 1,
1.042225, -1.312403, 2.406902, 1, 0, 0.9176471, 1,
1.043729, 2.112855, -0.840822, 1, 0, 0.9137255, 1,
1.055203, -0.4792392, 1.158847, 1, 0, 0.9058824, 1,
1.055912, -0.06462163, 1.575678, 1, 0, 0.9019608, 1,
1.05619, 1.301444, 0.9597129, 1, 0, 0.8941177, 1,
1.057764, -0.4778803, 1.341448, 1, 0, 0.8862745, 1,
1.058776, 0.2216961, 1.217035, 1, 0, 0.8823529, 1,
1.061227, -1.796015, 2.440581, 1, 0, 0.8745098, 1,
1.066533, 1.899305, 1.428352, 1, 0, 0.8705882, 1,
1.074081, 1.216034, 0.5332405, 1, 0, 0.8627451, 1,
1.074371, -0.83721, 3.562789, 1, 0, 0.8588235, 1,
1.078752, 0.8703448, 2.000435, 1, 0, 0.8509804, 1,
1.084846, 0.07656629, -0.2480761, 1, 0, 0.8470588, 1,
1.085132, 1.282576, 2.148768, 1, 0, 0.8392157, 1,
1.086798, 1.132482, 1.567287, 1, 0, 0.8352941, 1,
1.088373, -0.2591535, 3.009074, 1, 0, 0.827451, 1,
1.089241, -2.046891, 2.810959, 1, 0, 0.8235294, 1,
1.107817, -0.6688504, 2.412421, 1, 0, 0.8156863, 1,
1.107947, -0.2094815, 1.313404, 1, 0, 0.8117647, 1,
1.112985, 2.487943, -0.6114115, 1, 0, 0.8039216, 1,
1.114195, 0.8748391, 0.9161067, 1, 0, 0.7960784, 1,
1.119664, 0.2878766, 1.816914, 1, 0, 0.7921569, 1,
1.12493, 1.818167, 0.1879215, 1, 0, 0.7843137, 1,
1.125571, -1.000262, 3.048582, 1, 0, 0.7803922, 1,
1.126465, -0.7697008, 1.980586, 1, 0, 0.772549, 1,
1.129527, 0.5090971, 3.340505, 1, 0, 0.7686275, 1,
1.131674, 0.1265096, 2.185559, 1, 0, 0.7607843, 1,
1.133721, 0.9329131, 0.2500212, 1, 0, 0.7568628, 1,
1.135629, -0.6957422, 1.848725, 1, 0, 0.7490196, 1,
1.143511, 0.01235709, -0.6813883, 1, 0, 0.7450981, 1,
1.147054, 2.116932, -0.7054709, 1, 0, 0.7372549, 1,
1.150868, 1.28859, 2.086517, 1, 0, 0.7333333, 1,
1.155729, 0.9619142, -0.09221757, 1, 0, 0.7254902, 1,
1.155886, -0.5404588, 1.989137, 1, 0, 0.7215686, 1,
1.157591, -1.068912, 0.8440113, 1, 0, 0.7137255, 1,
1.159781, -0.03212097, 1.483251, 1, 0, 0.7098039, 1,
1.165106, -1.109176, 2.332896, 1, 0, 0.7019608, 1,
1.165693, -1.235992, 1.42101, 1, 0, 0.6941177, 1,
1.169888, -0.09773695, 1.231218, 1, 0, 0.6901961, 1,
1.170928, 1.76555, -0.2154624, 1, 0, 0.682353, 1,
1.17748, -0.0266008, -0.9885433, 1, 0, 0.6784314, 1,
1.181562, 0.3842138, 1.131739, 1, 0, 0.6705883, 1,
1.189263, -1.231973, 2.145403, 1, 0, 0.6666667, 1,
1.191426, -0.9634057, 1.919585, 1, 0, 0.6588235, 1,
1.193029, -0.6887077, 3.119874, 1, 0, 0.654902, 1,
1.201911, 0.3326735, 2.634607, 1, 0, 0.6470588, 1,
1.20654, 1.848151, 1.439047, 1, 0, 0.6431373, 1,
1.211934, 0.1569883, 1.572454, 1, 0, 0.6352941, 1,
1.213722, 1.768138, 1.440792, 1, 0, 0.6313726, 1,
1.241694, 0.276701, 0.7271121, 1, 0, 0.6235294, 1,
1.247352, 0.9699638, 1.704572, 1, 0, 0.6196079, 1,
1.250902, 2.149829, -1.084615, 1, 0, 0.6117647, 1,
1.255848, -0.6083917, 2.262169, 1, 0, 0.6078432, 1,
1.258065, -0.01196354, 0.6120228, 1, 0, 0.6, 1,
1.272445, 0.4461626, 1.373571, 1, 0, 0.5921569, 1,
1.274701, -1.278062, 2.845499, 1, 0, 0.5882353, 1,
1.275294, 0.9120889, 0.1869948, 1, 0, 0.5803922, 1,
1.279732, -0.1136101, 0.5115424, 1, 0, 0.5764706, 1,
1.284118, 0.2873102, 0.2723414, 1, 0, 0.5686275, 1,
1.28647, 0.7658743, 2.624123, 1, 0, 0.5647059, 1,
1.293863, 0.6793478, 1.866476, 1, 0, 0.5568628, 1,
1.302086, -1.548531, 3.287879, 1, 0, 0.5529412, 1,
1.328861, -0.08124781, 1.253674, 1, 0, 0.5450981, 1,
1.330468, -0.2196747, 2.014624, 1, 0, 0.5411765, 1,
1.341665, 0.6361432, 1.133596, 1, 0, 0.5333334, 1,
1.342727, 0.5177495, 1.788489, 1, 0, 0.5294118, 1,
1.347455, 0.5643665, 0.5946845, 1, 0, 0.5215687, 1,
1.347988, -0.2502145, 2.589228, 1, 0, 0.5176471, 1,
1.359916, -1.038035, 2.216884, 1, 0, 0.509804, 1,
1.369742, 0.1263001, 1.892062, 1, 0, 0.5058824, 1,
1.370516, -1.145942, 0.6943876, 1, 0, 0.4980392, 1,
1.374273, -1.01255, 1.474994, 1, 0, 0.4901961, 1,
1.375605, -0.3316445, 1.813164, 1, 0, 0.4862745, 1,
1.377503, 1.297178, -0.07637161, 1, 0, 0.4784314, 1,
1.379566, 0.6572859, 0.7108461, 1, 0, 0.4745098, 1,
1.389301, 0.7583045, -0.3228421, 1, 0, 0.4666667, 1,
1.399508, -0.3286358, 2.891774, 1, 0, 0.4627451, 1,
1.412355, 0.3790047, 2.39785, 1, 0, 0.454902, 1,
1.413061, 0.09373182, 1.854688, 1, 0, 0.4509804, 1,
1.427179, -0.5511062, 1.059816, 1, 0, 0.4431373, 1,
1.431041, 1.020936, -0.01233948, 1, 0, 0.4392157, 1,
1.44706, 1.194458, 1.032106, 1, 0, 0.4313726, 1,
1.448852, -0.7737468, 2.569199, 1, 0, 0.427451, 1,
1.466796, -2.289205, 2.398954, 1, 0, 0.4196078, 1,
1.478222, -0.1799675, 2.07731, 1, 0, 0.4156863, 1,
1.479477, -0.4804838, 3.180841, 1, 0, 0.4078431, 1,
1.479622, 1.376596, -0.1172236, 1, 0, 0.4039216, 1,
1.50822, 0.1284052, 0.1805541, 1, 0, 0.3960784, 1,
1.521207, -1.255493, 3.057877, 1, 0, 0.3882353, 1,
1.529796, -1.181739, 2.082929, 1, 0, 0.3843137, 1,
1.533148, -0.1113469, 1.530026, 1, 0, 0.3764706, 1,
1.555457, -0.5716782, 2.283033, 1, 0, 0.372549, 1,
1.55597, 1.425482, -0.7438306, 1, 0, 0.3647059, 1,
1.593609, 1.010052, 0.3498575, 1, 0, 0.3607843, 1,
1.597183, 1.546047, 0.9796686, 1, 0, 0.3529412, 1,
1.614071, -0.7256948, 2.596277, 1, 0, 0.3490196, 1,
1.617602, -1.027627, 3.274268, 1, 0, 0.3411765, 1,
1.617761, 1.323033, 0.4965821, 1, 0, 0.3372549, 1,
1.626599, -0.3893068, 1.732782, 1, 0, 0.3294118, 1,
1.650914, -0.2826017, 1.912859, 1, 0, 0.3254902, 1,
1.652863, 0.167901, 1.666476, 1, 0, 0.3176471, 1,
1.673023, 0.02465453, 2.712788, 1, 0, 0.3137255, 1,
1.680256, 0.7013665, 2.934129, 1, 0, 0.3058824, 1,
1.685188, 1.1015, 2.014745, 1, 0, 0.2980392, 1,
1.691836, -0.4368531, 2.441681, 1, 0, 0.2941177, 1,
1.705574, -0.6988665, 0.1340909, 1, 0, 0.2862745, 1,
1.720917, 0.8611568, 0.09339417, 1, 0, 0.282353, 1,
1.749184, 1.399446, 1.676114, 1, 0, 0.2745098, 1,
1.755417, -0.1067159, 1.50978, 1, 0, 0.2705882, 1,
1.757979, 1.443848, -0.2010215, 1, 0, 0.2627451, 1,
1.769104, 1.505001, 1.628092, 1, 0, 0.2588235, 1,
1.772707, 0.581445, 1.715116, 1, 0, 0.2509804, 1,
1.774002, -0.9559798, 1.805144, 1, 0, 0.2470588, 1,
1.791716, 0.01492217, 2.643363, 1, 0, 0.2392157, 1,
1.802495, -0.3425646, 2.699425, 1, 0, 0.2352941, 1,
1.811448, 1.272348, 1.840884, 1, 0, 0.227451, 1,
1.817792, -0.5746866, 2.119346, 1, 0, 0.2235294, 1,
1.845344, 1.253669, 2.276395, 1, 0, 0.2156863, 1,
1.854693, 0.6036254, 2.197161, 1, 0, 0.2117647, 1,
1.855202, -0.7821337, 2.416309, 1, 0, 0.2039216, 1,
1.88619, -1.23723, 1.491505, 1, 0, 0.1960784, 1,
1.909827, -1.182056, 1.570547, 1, 0, 0.1921569, 1,
1.913741, 0.3763033, 1.414831, 1, 0, 0.1843137, 1,
1.925281, 0.1784575, 0.5354313, 1, 0, 0.1803922, 1,
1.957597, -0.2623333, 2.460775, 1, 0, 0.172549, 1,
1.986484, 0.4519169, 1.49926, 1, 0, 0.1686275, 1,
2.005805, 0.4930997, 0.5027988, 1, 0, 0.1607843, 1,
2.016444, -0.4377698, 1.364241, 1, 0, 0.1568628, 1,
2.019766, -1.104137, 1.589039, 1, 0, 0.1490196, 1,
2.042698, 0.05294418, 3.070045, 1, 0, 0.145098, 1,
2.046534, 0.1322315, 3.23008, 1, 0, 0.1372549, 1,
2.089116, -0.8244311, 2.770448, 1, 0, 0.1333333, 1,
2.113388, 0.9639339, 1.490417, 1, 0, 0.1254902, 1,
2.165922, 1.60423, 2.242989, 1, 0, 0.1215686, 1,
2.194403, 2.44926, -0.2966049, 1, 0, 0.1137255, 1,
2.211848, -1.088667, 2.205335, 1, 0, 0.1098039, 1,
2.229396, 0.06705592, 2.142945, 1, 0, 0.1019608, 1,
2.253582, 1.268768, 0.5203664, 1, 0, 0.09411765, 1,
2.285159, -1.190432, 1.199637, 1, 0, 0.09019608, 1,
2.332255, -1.103105, 3.035235, 1, 0, 0.08235294, 1,
2.333881, -0.6359658, 1.403223, 1, 0, 0.07843138, 1,
2.35351, -0.3116973, 1.868102, 1, 0, 0.07058824, 1,
2.375462, 1.698846, 2.748897, 1, 0, 0.06666667, 1,
2.376123, 0.4598748, 0.5081361, 1, 0, 0.05882353, 1,
2.472055, 1.0138, 1.668841, 1, 0, 0.05490196, 1,
2.506526, -0.03603608, 0.03644898, 1, 0, 0.04705882, 1,
2.545713, -1.111915, 2.647916, 1, 0, 0.04313726, 1,
2.587172, 0.699509, 0.2723177, 1, 0, 0.03529412, 1,
2.625239, 0.125519, 1.26881, 1, 0, 0.03137255, 1,
2.630946, -0.5896138, 1.341881, 1, 0, 0.02352941, 1,
2.773147, -0.2883856, 2.937968, 1, 0, 0.01960784, 1,
2.793605, 1.796191, 0.5011579, 1, 0, 0.01176471, 1,
2.799607, -0.1567019, 3.019072, 1, 0, 0.007843138, 1
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
-0.2741584, -4.614943, -8.016946, 0, -0.5, 0.5, 0.5,
-0.2741584, -4.614943, -8.016946, 1, -0.5, 0.5, 0.5,
-0.2741584, -4.614943, -8.016946, 1, 1.5, 0.5, 0.5,
-0.2741584, -4.614943, -8.016946, 0, 1.5, 0.5, 0.5
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
-4.38993, -0.174311, -8.016946, 0, -0.5, 0.5, 0.5,
-4.38993, -0.174311, -8.016946, 1, -0.5, 0.5, 0.5,
-4.38993, -0.174311, -8.016946, 1, 1.5, 0.5, 0.5,
-4.38993, -0.174311, -8.016946, 0, 1.5, 0.5, 0.5
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
-4.38993, -4.614943, -0.3746381, 0, -0.5, 0.5, 0.5,
-4.38993, -4.614943, -0.3746381, 1, -0.5, 0.5, 0.5,
-4.38993, -4.614943, -0.3746381, 1, 1.5, 0.5, 0.5,
-4.38993, -4.614943, -0.3746381, 0, 1.5, 0.5, 0.5
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
-3, -3.590182, -6.253336,
2, -3.590182, -6.253336,
-3, -3.590182, -6.253336,
-3, -3.760975, -6.547271,
-2, -3.590182, -6.253336,
-2, -3.760975, -6.547271,
-1, -3.590182, -6.253336,
-1, -3.760975, -6.547271,
0, -3.590182, -6.253336,
0, -3.760975, -6.547271,
1, -3.590182, -6.253336,
1, -3.760975, -6.547271,
2, -3.590182, -6.253336,
2, -3.760975, -6.547271
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
-3, -4.102562, -7.135141, 0, -0.5, 0.5, 0.5,
-3, -4.102562, -7.135141, 1, -0.5, 0.5, 0.5,
-3, -4.102562, -7.135141, 1, 1.5, 0.5, 0.5,
-3, -4.102562, -7.135141, 0, 1.5, 0.5, 0.5,
-2, -4.102562, -7.135141, 0, -0.5, 0.5, 0.5,
-2, -4.102562, -7.135141, 1, -0.5, 0.5, 0.5,
-2, -4.102562, -7.135141, 1, 1.5, 0.5, 0.5,
-2, -4.102562, -7.135141, 0, 1.5, 0.5, 0.5,
-1, -4.102562, -7.135141, 0, -0.5, 0.5, 0.5,
-1, -4.102562, -7.135141, 1, -0.5, 0.5, 0.5,
-1, -4.102562, -7.135141, 1, 1.5, 0.5, 0.5,
-1, -4.102562, -7.135141, 0, 1.5, 0.5, 0.5,
0, -4.102562, -7.135141, 0, -0.5, 0.5, 0.5,
0, -4.102562, -7.135141, 1, -0.5, 0.5, 0.5,
0, -4.102562, -7.135141, 1, 1.5, 0.5, 0.5,
0, -4.102562, -7.135141, 0, 1.5, 0.5, 0.5,
1, -4.102562, -7.135141, 0, -0.5, 0.5, 0.5,
1, -4.102562, -7.135141, 1, -0.5, 0.5, 0.5,
1, -4.102562, -7.135141, 1, 1.5, 0.5, 0.5,
1, -4.102562, -7.135141, 0, 1.5, 0.5, 0.5,
2, -4.102562, -7.135141, 0, -0.5, 0.5, 0.5,
2, -4.102562, -7.135141, 1, -0.5, 0.5, 0.5,
2, -4.102562, -7.135141, 1, 1.5, 0.5, 0.5,
2, -4.102562, -7.135141, 0, 1.5, 0.5, 0.5
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
-3.440136, -3, -6.253336,
-3.440136, 3, -6.253336,
-3.440136, -3, -6.253336,
-3.598435, -3, -6.547271,
-3.440136, -2, -6.253336,
-3.598435, -2, -6.547271,
-3.440136, -1, -6.253336,
-3.598435, -1, -6.547271,
-3.440136, 0, -6.253336,
-3.598435, 0, -6.547271,
-3.440136, 1, -6.253336,
-3.598435, 1, -6.547271,
-3.440136, 2, -6.253336,
-3.598435, 2, -6.547271,
-3.440136, 3, -6.253336,
-3.598435, 3, -6.547271
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
-3.915033, -3, -7.135141, 0, -0.5, 0.5, 0.5,
-3.915033, -3, -7.135141, 1, -0.5, 0.5, 0.5,
-3.915033, -3, -7.135141, 1, 1.5, 0.5, 0.5,
-3.915033, -3, -7.135141, 0, 1.5, 0.5, 0.5,
-3.915033, -2, -7.135141, 0, -0.5, 0.5, 0.5,
-3.915033, -2, -7.135141, 1, -0.5, 0.5, 0.5,
-3.915033, -2, -7.135141, 1, 1.5, 0.5, 0.5,
-3.915033, -2, -7.135141, 0, 1.5, 0.5, 0.5,
-3.915033, -1, -7.135141, 0, -0.5, 0.5, 0.5,
-3.915033, -1, -7.135141, 1, -0.5, 0.5, 0.5,
-3.915033, -1, -7.135141, 1, 1.5, 0.5, 0.5,
-3.915033, -1, -7.135141, 0, 1.5, 0.5, 0.5,
-3.915033, 0, -7.135141, 0, -0.5, 0.5, 0.5,
-3.915033, 0, -7.135141, 1, -0.5, 0.5, 0.5,
-3.915033, 0, -7.135141, 1, 1.5, 0.5, 0.5,
-3.915033, 0, -7.135141, 0, 1.5, 0.5, 0.5,
-3.915033, 1, -7.135141, 0, -0.5, 0.5, 0.5,
-3.915033, 1, -7.135141, 1, -0.5, 0.5, 0.5,
-3.915033, 1, -7.135141, 1, 1.5, 0.5, 0.5,
-3.915033, 1, -7.135141, 0, 1.5, 0.5, 0.5,
-3.915033, 2, -7.135141, 0, -0.5, 0.5, 0.5,
-3.915033, 2, -7.135141, 1, -0.5, 0.5, 0.5,
-3.915033, 2, -7.135141, 1, 1.5, 0.5, 0.5,
-3.915033, 2, -7.135141, 0, 1.5, 0.5, 0.5,
-3.915033, 3, -7.135141, 0, -0.5, 0.5, 0.5,
-3.915033, 3, -7.135141, 1, -0.5, 0.5, 0.5,
-3.915033, 3, -7.135141, 1, 1.5, 0.5, 0.5,
-3.915033, 3, -7.135141, 0, 1.5, 0.5, 0.5
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
-3.440136, -3.590182, -6,
-3.440136, -3.590182, 4,
-3.440136, -3.590182, -6,
-3.598435, -3.760975, -6,
-3.440136, -3.590182, -4,
-3.598435, -3.760975, -4,
-3.440136, -3.590182, -2,
-3.598435, -3.760975, -2,
-3.440136, -3.590182, 0,
-3.598435, -3.760975, 0,
-3.440136, -3.590182, 2,
-3.598435, -3.760975, 2,
-3.440136, -3.590182, 4,
-3.598435, -3.760975, 4
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
-3.915033, -4.102562, -6, 0, -0.5, 0.5, 0.5,
-3.915033, -4.102562, -6, 1, -0.5, 0.5, 0.5,
-3.915033, -4.102562, -6, 1, 1.5, 0.5, 0.5,
-3.915033, -4.102562, -6, 0, 1.5, 0.5, 0.5,
-3.915033, -4.102562, -4, 0, -0.5, 0.5, 0.5,
-3.915033, -4.102562, -4, 1, -0.5, 0.5, 0.5,
-3.915033, -4.102562, -4, 1, 1.5, 0.5, 0.5,
-3.915033, -4.102562, -4, 0, 1.5, 0.5, 0.5,
-3.915033, -4.102562, -2, 0, -0.5, 0.5, 0.5,
-3.915033, -4.102562, -2, 1, -0.5, 0.5, 0.5,
-3.915033, -4.102562, -2, 1, 1.5, 0.5, 0.5,
-3.915033, -4.102562, -2, 0, 1.5, 0.5, 0.5,
-3.915033, -4.102562, 0, 0, -0.5, 0.5, 0.5,
-3.915033, -4.102562, 0, 1, -0.5, 0.5, 0.5,
-3.915033, -4.102562, 0, 1, 1.5, 0.5, 0.5,
-3.915033, -4.102562, 0, 0, 1.5, 0.5, 0.5,
-3.915033, -4.102562, 2, 0, -0.5, 0.5, 0.5,
-3.915033, -4.102562, 2, 1, -0.5, 0.5, 0.5,
-3.915033, -4.102562, 2, 1, 1.5, 0.5, 0.5,
-3.915033, -4.102562, 2, 0, 1.5, 0.5, 0.5,
-3.915033, -4.102562, 4, 0, -0.5, 0.5, 0.5,
-3.915033, -4.102562, 4, 1, -0.5, 0.5, 0.5,
-3.915033, -4.102562, 4, 1, 1.5, 0.5, 0.5,
-3.915033, -4.102562, 4, 0, 1.5, 0.5, 0.5
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
-3.440136, -3.590182, -6.253336,
-3.440136, 3.24156, -6.253336,
-3.440136, -3.590182, 5.50406,
-3.440136, 3.24156, 5.50406,
-3.440136, -3.590182, -6.253336,
-3.440136, -3.590182, 5.50406,
-3.440136, 3.24156, -6.253336,
-3.440136, 3.24156, 5.50406,
-3.440136, -3.590182, -6.253336,
2.891819, -3.590182, -6.253336,
-3.440136, -3.590182, 5.50406,
2.891819, -3.590182, 5.50406,
-3.440136, 3.24156, -6.253336,
2.891819, 3.24156, -6.253336,
-3.440136, 3.24156, 5.50406,
2.891819, 3.24156, 5.50406,
2.891819, -3.590182, -6.253336,
2.891819, 3.24156, -6.253336,
2.891819, -3.590182, 5.50406,
2.891819, 3.24156, 5.50406,
2.891819, -3.590182, -6.253336,
2.891819, -3.590182, 5.50406,
2.891819, 3.24156, -6.253336,
2.891819, 3.24156, 5.50406
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
var radius = 8.009757;
var distance = 35.63631;
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
mvMatrix.translate( 0.2741584, 0.174311, 0.3746381 );
mvMatrix.scale( 1.367714, 1.267657, 0.7365837 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.63631);
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
bromadiolone<-read.table("bromadiolone.xyz")
```

```
## Error in read.table("bromadiolone.xyz"): no lines available in input
```

```r
x<-bromadiolone$V2
```

```
## Error in eval(expr, envir, enclos): object 'bromadiolone' not found
```

```r
y<-bromadiolone$V3
```

```
## Error in eval(expr, envir, enclos): object 'bromadiolone' not found
```

```r
z<-bromadiolone$V4
```

```
## Error in eval(expr, envir, enclos): object 'bromadiolone' not found
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
-3.347923, -0.7399566, -1.40379, 0, 0, 1, 1, 1,
-3.179107, -0.1654045, -3.773703, 1, 0, 0, 1, 1,
-3.008069, 1.141757, -1.028651, 1, 0, 0, 1, 1,
-2.576218, -0.954884, -0.7039193, 1, 0, 0, 1, 1,
-2.532143, 0.4750381, -0.7091529, 1, 0, 0, 1, 1,
-2.493331, 0.1356028, -2.674861, 1, 0, 0, 1, 1,
-2.459548, 0.3731518, 0.05198689, 0, 0, 0, 1, 1,
-2.444413, -1.23955, -2.2968, 0, 0, 0, 1, 1,
-2.407936, 0.2342398, -0.6121857, 0, 0, 0, 1, 1,
-2.361471, 0.05717149, -2.659128, 0, 0, 0, 1, 1,
-2.341337, -1.400044, -1.476311, 0, 0, 0, 1, 1,
-2.310009, 0.2240479, -1.965214, 0, 0, 0, 1, 1,
-2.212363, -1.118536, -3.547033, 0, 0, 0, 1, 1,
-2.183475, 0.5802305, -1.123145, 1, 1, 1, 1, 1,
-2.173108, 1.523956, -1.655822, 1, 1, 1, 1, 1,
-2.103239, -0.3803446, -1.550378, 1, 1, 1, 1, 1,
-2.062265, 1.524768, -0.2193075, 1, 1, 1, 1, 1,
-2.02253, 0.08875035, -1.785946, 1, 1, 1, 1, 1,
-1.988264, -0.3827486, -2.165864, 1, 1, 1, 1, 1,
-1.944463, -0.6090164, -2.04986, 1, 1, 1, 1, 1,
-1.929057, 0.3838234, -1.815593, 1, 1, 1, 1, 1,
-1.923152, 0.1463381, -2.353949, 1, 1, 1, 1, 1,
-1.911778, -1.777091, -2.542166, 1, 1, 1, 1, 1,
-1.907621, 0.1007364, -1.914884, 1, 1, 1, 1, 1,
-1.905108, 0.6876312, -1.407729, 1, 1, 1, 1, 1,
-1.889068, 1.214257, -0.3051749, 1, 1, 1, 1, 1,
-1.885162, 0.02712918, -1.792527, 1, 1, 1, 1, 1,
-1.874776, -0.5647442, -1.935828, 1, 1, 1, 1, 1,
-1.874019, -0.09331073, -2.47387, 0, 0, 1, 1, 1,
-1.85239, 0.3537405, -2.07669, 1, 0, 0, 1, 1,
-1.845975, -0.254628, -1.484368, 1, 0, 0, 1, 1,
-1.838691, -0.3406914, -3.338379, 1, 0, 0, 1, 1,
-1.831113, -1.675438, -2.26187, 1, 0, 0, 1, 1,
-1.818982, -0.2187254, -1.576993, 1, 0, 0, 1, 1,
-1.812619, -0.6250452, -2.175332, 0, 0, 0, 1, 1,
-1.792133, -0.1093704, -4.025306, 0, 0, 0, 1, 1,
-1.781507, -0.1784886, -0.6390867, 0, 0, 0, 1, 1,
-1.767694, -0.4280299, -3.122034, 0, 0, 0, 1, 1,
-1.739567, 0.04659661, -2.746033, 0, 0, 0, 1, 1,
-1.724033, 0.08491214, -1.643133, 0, 0, 0, 1, 1,
-1.694833, -0.1307641, -3.414568, 0, 0, 0, 1, 1,
-1.675362, 0.8241565, -1.707575, 1, 1, 1, 1, 1,
-1.669448, -1.606627, -3.090022, 1, 1, 1, 1, 1,
-1.667574, 0.2855482, -2.917751, 1, 1, 1, 1, 1,
-1.654165, 0.2155043, -2.922207, 1, 1, 1, 1, 1,
-1.639178, 0.6381568, 0.5262877, 1, 1, 1, 1, 1,
-1.616368, -0.827708, -2.795799, 1, 1, 1, 1, 1,
-1.61591, -1.018376, -1.369502, 1, 1, 1, 1, 1,
-1.6157, -1.223929, -0.4311731, 1, 1, 1, 1, 1,
-1.601329, -0.3297061, -2.982188, 1, 1, 1, 1, 1,
-1.59773, -0.7513031, -1.427147, 1, 1, 1, 1, 1,
-1.587751, 0.6946884, -1.504629, 1, 1, 1, 1, 1,
-1.577941, 0.492908, 0.4505342, 1, 1, 1, 1, 1,
-1.577917, 1.029745, -3.07973, 1, 1, 1, 1, 1,
-1.567155, -0.2111639, -2.221438, 1, 1, 1, 1, 1,
-1.564465, 0.1892944, -0.9476296, 1, 1, 1, 1, 1,
-1.560899, 1.070553, 0.5945555, 0, 0, 1, 1, 1,
-1.55182, -1.29058, -1.224089, 1, 0, 0, 1, 1,
-1.54828, 1.272667, 0.407613, 1, 0, 0, 1, 1,
-1.53145, -0.3372065, -2.61777, 1, 0, 0, 1, 1,
-1.528548, -1.092912, -1.871242, 1, 0, 0, 1, 1,
-1.526989, -0.3349205, -2.327566, 1, 0, 0, 1, 1,
-1.526487, -0.292909, -3.201382, 0, 0, 0, 1, 1,
-1.50506, 1.236401, 0.5401875, 0, 0, 0, 1, 1,
-1.500429, -2.49354, -3.080021, 0, 0, 0, 1, 1,
-1.485556, -1.01255, -1.594485, 0, 0, 0, 1, 1,
-1.477666, 1.297973, -1.745558, 0, 0, 0, 1, 1,
-1.475501, 1.557838, 0.3334212, 0, 0, 0, 1, 1,
-1.474647, -0.6961341, -3.466495, 0, 0, 0, 1, 1,
-1.460252, -0.3493409, -2.029193, 1, 1, 1, 1, 1,
-1.442708, 0.06451183, -2.412174, 1, 1, 1, 1, 1,
-1.442148, -0.5282061, -1.687801, 1, 1, 1, 1, 1,
-1.439254, -0.7904307, -2.590956, 1, 1, 1, 1, 1,
-1.436492, 0.3997383, -0.2411316, 1, 1, 1, 1, 1,
-1.42871, 2.323018, -0.4194289, 1, 1, 1, 1, 1,
-1.428051, 0.2810922, -2.091481, 1, 1, 1, 1, 1,
-1.427549, 0.07987199, -3.161827, 1, 1, 1, 1, 1,
-1.424652, 1.157053, -1.23346, 1, 1, 1, 1, 1,
-1.405417, 0.3421533, -0.7714313, 1, 1, 1, 1, 1,
-1.405042, -1.436176, -2.661764, 1, 1, 1, 1, 1,
-1.39954, -0.04399739, -1.14006, 1, 1, 1, 1, 1,
-1.398991, -1.39901, -1.579924, 1, 1, 1, 1, 1,
-1.392513, 0.1267593, -2.349822, 1, 1, 1, 1, 1,
-1.383293, -0.4421178, -1.017315, 1, 1, 1, 1, 1,
-1.378876, 0.005078277, -1.358348, 0, 0, 1, 1, 1,
-1.376474, 0.6753591, -3.769264, 1, 0, 0, 1, 1,
-1.367074, 1.53155, -2.131042, 1, 0, 0, 1, 1,
-1.363903, 0.7883944, 0.5295927, 1, 0, 0, 1, 1,
-1.355812, 0.3419597, -2.708374, 1, 0, 0, 1, 1,
-1.33963, -1.91125, -1.924721, 1, 0, 0, 1, 1,
-1.334575, -0.7932844, -2.688538, 0, 0, 0, 1, 1,
-1.330243, 0.7487059, -1.331065, 0, 0, 0, 1, 1,
-1.330133, 0.2496314, -1.458673, 0, 0, 0, 1, 1,
-1.32944, 0.4499346, -0.7454048, 0, 0, 0, 1, 1,
-1.326026, -0.2543268, -1.659891, 0, 0, 0, 1, 1,
-1.325816, 0.5897993, -0.5861608, 0, 0, 0, 1, 1,
-1.32007, -0.1451462, 0.3540161, 0, 0, 0, 1, 1,
-1.317421, -0.1976086, 0.9181186, 1, 1, 1, 1, 1,
-1.312397, 1.131169, -0.9898639, 1, 1, 1, 1, 1,
-1.311789, -1.156118, -1.385226, 1, 1, 1, 1, 1,
-1.27455, 0.4633276, -0.6870366, 1, 1, 1, 1, 1,
-1.263709, 0.5070103, 1.101188, 1, 1, 1, 1, 1,
-1.239073, 1.337175, -1.422446, 1, 1, 1, 1, 1,
-1.237066, 1.245299, -0.1462283, 1, 1, 1, 1, 1,
-1.222521, -0.6640121, -2.054217, 1, 1, 1, 1, 1,
-1.208002, 0.8960087, -2.091233, 1, 1, 1, 1, 1,
-1.20715, 1.346455, -1.419169, 1, 1, 1, 1, 1,
-1.203317, -0.7430602, -2.479132, 1, 1, 1, 1, 1,
-1.201342, -0.8266438, -0.3854204, 1, 1, 1, 1, 1,
-1.196835, -0.004865088, -2.409096, 1, 1, 1, 1, 1,
-1.188982, -0.8893391, -3.257168, 1, 1, 1, 1, 1,
-1.187885, 1.069502, -0.0613825, 1, 1, 1, 1, 1,
-1.187843, 0.7167107, -1.237859, 0, 0, 1, 1, 1,
-1.187402, -1.841664, -2.822072, 1, 0, 0, 1, 1,
-1.169611, 1.157998, -1.571523, 1, 0, 0, 1, 1,
-1.154872, 0.8137531, -1.943892, 1, 0, 0, 1, 1,
-1.154627, -0.3692164, -1.878146, 1, 0, 0, 1, 1,
-1.145538, -0.7156452, -3.449134, 1, 0, 0, 1, 1,
-1.136955, -0.669866, 0.2342224, 0, 0, 0, 1, 1,
-1.135261, -0.5672324, -4.571271, 0, 0, 0, 1, 1,
-1.13255, -0.4988145, -3.201068, 0, 0, 0, 1, 1,
-1.131, -0.7095616, -2.885175, 0, 0, 0, 1, 1,
-1.110122, 2.934535, -0.3844106, 0, 0, 0, 1, 1,
-1.099795, 1.626375, -0.9931498, 0, 0, 0, 1, 1,
-1.095673, 0.8504508, -1.938441, 0, 0, 0, 1, 1,
-1.094252, 0.8586638, -0.2459076, 1, 1, 1, 1, 1,
-1.087812, 1.063594, -0.1696955, 1, 1, 1, 1, 1,
-1.083088, -1.064038, -0.9231189, 1, 1, 1, 1, 1,
-1.072979, 0.0946655, -1.085497, 1, 1, 1, 1, 1,
-1.065557, 0.8931202, 0.9558796, 1, 1, 1, 1, 1,
-1.062366, 1.005894, 0.1831653, 1, 1, 1, 1, 1,
-1.056032, 0.3285813, -2.905735, 1, 1, 1, 1, 1,
-1.054894, 0.2722193, -2.396888, 1, 1, 1, 1, 1,
-1.046111, -1.423545, -2.254313, 1, 1, 1, 1, 1,
-1.039454, -0.2211698, -2.100777, 1, 1, 1, 1, 1,
-1.038837, 0.549747, -0.6710135, 1, 1, 1, 1, 1,
-1.034092, -0.6678666, -2.395904, 1, 1, 1, 1, 1,
-1.032329, -0.1731201, -3.644251, 1, 1, 1, 1, 1,
-1.030555, -0.6388798, -2.581977, 1, 1, 1, 1, 1,
-1.02586, 0.1557618, 0.4678259, 1, 1, 1, 1, 1,
-1.023948, 0.6405351, -1.846601, 0, 0, 1, 1, 1,
-1.016393, -0.6761122, -3.020003, 1, 0, 0, 1, 1,
-1.013801, 0.4305548, -0.9130659, 1, 0, 0, 1, 1,
-1.008267, -0.1537996, -0.4968112, 1, 0, 0, 1, 1,
-1.006967, 1.960543, -0.3419791, 1, 0, 0, 1, 1,
-1.004308, -1.12385, -1.928562, 1, 0, 0, 1, 1,
-1.003443, 2.143133, -0.2654907, 0, 0, 0, 1, 1,
-1.001375, 1.328172, 1.621703, 0, 0, 0, 1, 1,
-0.99842, 0.5321447, -1.117752, 0, 0, 0, 1, 1,
-0.9864488, -0.7297247, -2.858672, 0, 0, 0, 1, 1,
-0.9768202, 1.255313, -0.8795498, 0, 0, 0, 1, 1,
-0.97456, -0.6738194, -0.2165743, 0, 0, 0, 1, 1,
-0.9743441, 0.7070756, -0.7538567, 0, 0, 0, 1, 1,
-0.9736648, 0.4810873, -2.440848, 1, 1, 1, 1, 1,
-0.9686572, 1.024519, -0.5113419, 1, 1, 1, 1, 1,
-0.964382, 1.229749, -1.662342, 1, 1, 1, 1, 1,
-0.9621845, 0.1407651, 0.588784, 1, 1, 1, 1, 1,
-0.9560938, -0.7173198, -3.157502, 1, 1, 1, 1, 1,
-0.9523406, 0.2222969, -0.07300623, 1, 1, 1, 1, 1,
-0.9505051, 1.310771, -0.2615815, 1, 1, 1, 1, 1,
-0.949853, -1.894667, -3.622341, 1, 1, 1, 1, 1,
-0.9494413, 0.1741297, -0.5319612, 1, 1, 1, 1, 1,
-0.9459644, -1.04082, -3.798999, 1, 1, 1, 1, 1,
-0.9398093, -1.395767, -5.21433, 1, 1, 1, 1, 1,
-0.9370501, 0.0365881, -2.706893, 1, 1, 1, 1, 1,
-0.935942, -0.1969079, -3.757682, 1, 1, 1, 1, 1,
-0.9327366, -0.9393777, -2.762386, 1, 1, 1, 1, 1,
-0.9309165, -1.76098, -2.40707, 1, 1, 1, 1, 1,
-0.9286688, 0.1005613, -1.500294, 0, 0, 1, 1, 1,
-0.9245139, -1.851537, -1.567425, 1, 0, 0, 1, 1,
-0.9139785, 0.5886989, -0.4606631, 1, 0, 0, 1, 1,
-0.9034076, 0.04474474, -1.514774, 1, 0, 0, 1, 1,
-0.9004788, -1.045729, -0.7842786, 1, 0, 0, 1, 1,
-0.8894347, -0.2044287, -1.667994, 1, 0, 0, 1, 1,
-0.8834134, 0.4917284, 0.9396783, 0, 0, 0, 1, 1,
-0.8785083, 1.165392, -1.201914, 0, 0, 0, 1, 1,
-0.8771889, 2.265316, -1.943457, 0, 0, 0, 1, 1,
-0.8749451, -0.3350326, -1.198741, 0, 0, 0, 1, 1,
-0.8720481, 0.1780054, -2.751406, 0, 0, 0, 1, 1,
-0.8710123, -0.4524291, -0.1800863, 0, 0, 0, 1, 1,
-0.8689316, 0.2719997, -2.648488, 0, 0, 0, 1, 1,
-0.8644813, 1.125394, -0.3647948, 1, 1, 1, 1, 1,
-0.8637049, 0.2719758, -2.262948, 1, 1, 1, 1, 1,
-0.8635325, 0.07706043, -2.529676, 1, 1, 1, 1, 1,
-0.8611315, -0.4513537, -2.134312, 1, 1, 1, 1, 1,
-0.8605841, 1.203725, -1.13769, 1, 1, 1, 1, 1,
-0.8590263, -1.381959, -3.031769, 1, 1, 1, 1, 1,
-0.8517686, -1.151712, -1.562745, 1, 1, 1, 1, 1,
-0.8458377, -0.9113091, -3.346082, 1, 1, 1, 1, 1,
-0.844923, 0.4443422, -1.586902, 1, 1, 1, 1, 1,
-0.8325976, -0.04608535, -0.4114332, 1, 1, 1, 1, 1,
-0.8293419, -1.629511, -1.851851, 1, 1, 1, 1, 1,
-0.8280649, 0.01095354, -1.200547, 1, 1, 1, 1, 1,
-0.8271902, -1.138166, -2.038504, 1, 1, 1, 1, 1,
-0.8240832, -0.1702996, -1.835892, 1, 1, 1, 1, 1,
-0.8194817, 1.782016, 0.2129273, 1, 1, 1, 1, 1,
-0.8090947, 0.9468905, -0.7654502, 0, 0, 1, 1, 1,
-0.8085619, -0.1007668, -1.137088, 1, 0, 0, 1, 1,
-0.8043112, 0.1376656, 0.3000631, 1, 0, 0, 1, 1,
-0.8003248, 0.5787379, 0.2045705, 1, 0, 0, 1, 1,
-0.7964391, -0.182992, -1.183152, 1, 0, 0, 1, 1,
-0.7938969, -0.3968669, -2.166539, 1, 0, 0, 1, 1,
-0.7911137, -1.188127, -2.368736, 0, 0, 0, 1, 1,
-0.7908708, 0.1870938, -2.373122, 0, 0, 0, 1, 1,
-0.7785519, -1.010517, -1.761864, 0, 0, 0, 1, 1,
-0.7747117, -1.656174, -1.355015, 0, 0, 0, 1, 1,
-0.7673513, -1.026096, -3.39651, 0, 0, 0, 1, 1,
-0.7664185, 0.681594, -0.5107364, 0, 0, 0, 1, 1,
-0.760074, 0.2190012, -1.206981, 0, 0, 0, 1, 1,
-0.7599636, -0.5055741, -3.402814, 1, 1, 1, 1, 1,
-0.7508671, -1.94714, -1.704318, 1, 1, 1, 1, 1,
-0.7494481, -0.007712664, -1.510825, 1, 1, 1, 1, 1,
-0.7409842, 0.5095322, -0.9248651, 1, 1, 1, 1, 1,
-0.7393614, -0.0101869, -0.8628734, 1, 1, 1, 1, 1,
-0.7390273, -1.986933, -3.814071, 1, 1, 1, 1, 1,
-0.7383733, -0.2864254, -2.726954, 1, 1, 1, 1, 1,
-0.735513, 0.919871, -0.5896079, 1, 1, 1, 1, 1,
-0.7338994, -1.336108, -2.474767, 1, 1, 1, 1, 1,
-0.7301075, 1.064173, -1.082478, 1, 1, 1, 1, 1,
-0.7284433, 0.4658806, -0.5263209, 1, 1, 1, 1, 1,
-0.726348, 0.1446488, -2.182289, 1, 1, 1, 1, 1,
-0.7260638, -0.4089641, -3.719801, 1, 1, 1, 1, 1,
-0.7241514, 1.110589, -1.078578, 1, 1, 1, 1, 1,
-0.7202116, 0.4970264, -1.848899, 1, 1, 1, 1, 1,
-0.7165935, 0.7325473, -1.742422, 0, 0, 1, 1, 1,
-0.7134541, 0.05121519, -1.388578, 1, 0, 0, 1, 1,
-0.7121944, 1.305505, -1.448543, 1, 0, 0, 1, 1,
-0.7111395, -0.2511317, -0.7275036, 1, 0, 0, 1, 1,
-0.7039263, -0.9264344, 0.3507059, 1, 0, 0, 1, 1,
-0.6931994, -0.6569815, -1.398423, 1, 0, 0, 1, 1,
-0.6850955, -0.9775686, -2.793508, 0, 0, 0, 1, 1,
-0.684856, 0.2934419, -3.04611, 0, 0, 0, 1, 1,
-0.6831061, -2.033087, -2.131906, 0, 0, 0, 1, 1,
-0.6806265, -1.055183, -2.633591, 0, 0, 0, 1, 1,
-0.6796476, 0.2404823, -2.300605, 0, 0, 0, 1, 1,
-0.6790622, -0.6910981, -1.225465, 0, 0, 0, 1, 1,
-0.6761136, 1.637774, 0.07985359, 0, 0, 0, 1, 1,
-0.6758345, 0.05472477, -0.6270751, 1, 1, 1, 1, 1,
-0.6714067, -1.567668, -3.230076, 1, 1, 1, 1, 1,
-0.6696299, 0.9004751, 0.1398575, 1, 1, 1, 1, 1,
-0.6657814, -1.670508, -1.30849, 1, 1, 1, 1, 1,
-0.6601469, -0.2538635, -1.60193, 1, 1, 1, 1, 1,
-0.658649, 1.080845, -1.11052, 1, 1, 1, 1, 1,
-0.6495009, -0.6561087, -2.352185, 1, 1, 1, 1, 1,
-0.6456997, -0.9028341, -2.73592, 1, 1, 1, 1, 1,
-0.6456995, -1.013192, -2.419406, 1, 1, 1, 1, 1,
-0.6382782, 0.1099551, -2.211517, 1, 1, 1, 1, 1,
-0.63695, -1.472479, -3.025707, 1, 1, 1, 1, 1,
-0.63503, 0.4158151, -0.5004539, 1, 1, 1, 1, 1,
-0.6289908, -1.58396, -4.388207, 1, 1, 1, 1, 1,
-0.6204181, -1.572205, -3.139113, 1, 1, 1, 1, 1,
-0.6154218, -1.079126, -3.348435, 1, 1, 1, 1, 1,
-0.612205, 0.007638284, -1.809158, 0, 0, 1, 1, 1,
-0.6115469, 0.4609201, 0.1497736, 1, 0, 0, 1, 1,
-0.6082832, -0.6271493, -2.164218, 1, 0, 0, 1, 1,
-0.6046911, -0.7600898, -2.610195, 1, 0, 0, 1, 1,
-0.6046056, 0.7114297, -1.298034, 1, 0, 0, 1, 1,
-0.6002116, 0.2054077, -0.6462482, 1, 0, 0, 1, 1,
-0.5989227, 0.02284138, -1.292659, 0, 0, 0, 1, 1,
-0.5962974, 0.9121087, -1.537997, 0, 0, 0, 1, 1,
-0.5870903, 0.03199638, -1.362104, 0, 0, 0, 1, 1,
-0.5862677, 0.4917715, -0.162805, 0, 0, 0, 1, 1,
-0.5806706, -0.1616607, -2.953137, 0, 0, 0, 1, 1,
-0.5791231, 0.1291004, -0.3261558, 0, 0, 0, 1, 1,
-0.5759327, -0.3633839, -1.499941, 0, 0, 0, 1, 1,
-0.5744234, 0.7222962, -1.19742, 1, 1, 1, 1, 1,
-0.5706179, 0.6339775, 0.3379775, 1, 1, 1, 1, 1,
-0.5642979, 1.281947, -0.9472409, 1, 1, 1, 1, 1,
-0.5618228, 0.9768782, -0.2974004, 1, 1, 1, 1, 1,
-0.5551766, 0.6892341, -0.936821, 1, 1, 1, 1, 1,
-0.5418312, 0.5691898, -0.5606117, 1, 1, 1, 1, 1,
-0.5377837, -0.4501469, -3.286945, 1, 1, 1, 1, 1,
-0.5278997, -1.013749, -2.731236, 1, 1, 1, 1, 1,
-0.5252699, 0.8047935, 0.8344545, 1, 1, 1, 1, 1,
-0.5229918, -1.535825, -3.185447, 1, 1, 1, 1, 1,
-0.5135453, 0.08787766, -1.341755, 1, 1, 1, 1, 1,
-0.5108141, 0.4134925, -3.992814, 1, 1, 1, 1, 1,
-0.5062798, -0.5438696, -5.305185, 1, 1, 1, 1, 1,
-0.4919065, 1.381663, -1.993052, 1, 1, 1, 1, 1,
-0.4891787, 1.921751, -0.3494677, 1, 1, 1, 1, 1,
-0.4884442, 1.292638, -1.375473, 0, 0, 1, 1, 1,
-0.4884133, 1.030797, -0.6919348, 1, 0, 0, 1, 1,
-0.4882211, -1.003097, -1.811027, 1, 0, 0, 1, 1,
-0.48669, -0.1365543, -4.642215, 1, 0, 0, 1, 1,
-0.4815364, -0.3182285, -3.155614, 1, 0, 0, 1, 1,
-0.4785541, -0.1434062, -1.66811, 1, 0, 0, 1, 1,
-0.4771449, -2.462405, -4.662849, 0, 0, 0, 1, 1,
-0.4734208, -1.215519, -2.182739, 0, 0, 0, 1, 1,
-0.4673333, -0.6613075, -3.156899, 0, 0, 0, 1, 1,
-0.4614487, 0.6835771, 0.2002253, 0, 0, 0, 1, 1,
-0.4613582, -0.9897654, -1.701512, 0, 0, 0, 1, 1,
-0.4601547, -1.445041, -3.315145, 0, 0, 0, 1, 1,
-0.4532647, -1.25785, -2.418982, 0, 0, 0, 1, 1,
-0.4525695, 1.715247, -0.4066058, 1, 1, 1, 1, 1,
-0.4524067, 1.686294, -0.9213684, 1, 1, 1, 1, 1,
-0.4391171, -1.6218, -2.023413, 1, 1, 1, 1, 1,
-0.4377519, 0.9378105, -0.9211423, 1, 1, 1, 1, 1,
-0.4357426, -0.8057167, -2.926525, 1, 1, 1, 1, 1,
-0.4356762, 0.884621, 0.5813199, 1, 1, 1, 1, 1,
-0.4355602, -0.1987521, -2.957407, 1, 1, 1, 1, 1,
-0.4353012, 0.1892194, -0.4703816, 1, 1, 1, 1, 1,
-0.4256119, 0.5675513, 0.6675912, 1, 1, 1, 1, 1,
-0.420619, 0.3572904, -3.1666, 1, 1, 1, 1, 1,
-0.4205184, 0.02704544, -2.814644, 1, 1, 1, 1, 1,
-0.4190624, 1.092949, -0.230277, 1, 1, 1, 1, 1,
-0.4153129, -1.073471, -1.333978, 1, 1, 1, 1, 1,
-0.4139227, -0.1375507, -0.9068028, 1, 1, 1, 1, 1,
-0.4135894, 0.4635693, 0.7928472, 1, 1, 1, 1, 1,
-0.4132377, -0.8717484, -3.187755, 0, 0, 1, 1, 1,
-0.4091433, -0.6964095, -3.270875, 1, 0, 0, 1, 1,
-0.4088271, -0.6356152, -1.826277, 1, 0, 0, 1, 1,
-0.4059202, 1.329834, 0.4162693, 1, 0, 0, 1, 1,
-0.4051812, 0.2467466, -1.32733, 1, 0, 0, 1, 1,
-0.4023205, 0.3328479, -1.341104, 1, 0, 0, 1, 1,
-0.3964978, 1.097025, -1.245412, 0, 0, 0, 1, 1,
-0.3955346, -0.1936745, -0.6495072, 0, 0, 0, 1, 1,
-0.3928097, -1.200488, -0.9812665, 0, 0, 0, 1, 1,
-0.3920783, -0.2824966, -1.355929, 0, 0, 0, 1, 1,
-0.3856074, 0.6812574, -1.172389, 0, 0, 0, 1, 1,
-0.3770568, 0.9805432, 0.3532391, 0, 0, 0, 1, 1,
-0.3695907, 0.08779457, -3.400567, 0, 0, 0, 1, 1,
-0.3648096, 0.1453231, -1.732114, 1, 1, 1, 1, 1,
-0.3643903, 1.730676, 0.203939, 1, 1, 1, 1, 1,
-0.3635182, 1.933569, 0.7687846, 1, 1, 1, 1, 1,
-0.3623024, -0.3724148, -1.115489, 1, 1, 1, 1, 1,
-0.3615179, -0.3254086, -1.110032, 1, 1, 1, 1, 1,
-0.3578213, -0.183165, -1.829523, 1, 1, 1, 1, 1,
-0.3571796, 0.006497724, -2.639486, 1, 1, 1, 1, 1,
-0.3567279, -0.8386605, -3.53487, 1, 1, 1, 1, 1,
-0.3495553, 1.877484, 0.5524891, 1, 1, 1, 1, 1,
-0.3476462, 0.2468929, -0.6404145, 1, 1, 1, 1, 1,
-0.3470136, 0.2749248, 0.432581, 1, 1, 1, 1, 1,
-0.3461919, 1.510177, -1.979923, 1, 1, 1, 1, 1,
-0.3447182, 0.3468655, -1.869335, 1, 1, 1, 1, 1,
-0.34259, -0.2876891, -2.95897, 1, 1, 1, 1, 1,
-0.3420892, -2.277607, -1.684696, 1, 1, 1, 1, 1,
-0.340218, -0.5510067, -2.167861, 0, 0, 1, 1, 1,
-0.3369257, -0.8816864, -3.34476, 1, 0, 0, 1, 1,
-0.3360411, -1.434207, -6.082112, 1, 0, 0, 1, 1,
-0.3334392, 0.337912, -0.7793152, 1, 0, 0, 1, 1,
-0.3300315, 0.007522097, -1.777226, 1, 0, 0, 1, 1,
-0.3278274, 0.3644395, -0.3694886, 1, 0, 0, 1, 1,
-0.323388, -0.652324, -2.269349, 0, 0, 0, 1, 1,
-0.3213091, 1.654178, 0.3581441, 0, 0, 0, 1, 1,
-0.3199691, 1.468053, -0.8536573, 0, 0, 0, 1, 1,
-0.317876, 0.4000898, -1.721133, 0, 0, 0, 1, 1,
-0.3162762, -1.435663, -3.978453, 0, 0, 0, 1, 1,
-0.310401, -0.320336, -1.280917, 0, 0, 0, 1, 1,
-0.3099623, -1.020933, -2.960043, 0, 0, 0, 1, 1,
-0.3093019, -0.9621516, -2.784042, 1, 1, 1, 1, 1,
-0.3085393, -0.9778183, -2.869319, 1, 1, 1, 1, 1,
-0.3058091, 0.6192861, -0.03804224, 1, 1, 1, 1, 1,
-0.3023087, 0.3802639, -0.6595564, 1, 1, 1, 1, 1,
-0.3022155, -0.04804699, -1.585728, 1, 1, 1, 1, 1,
-0.3009281, -0.5461739, -3.146354, 1, 1, 1, 1, 1,
-0.3000675, -0.8930697, -3.214035, 1, 1, 1, 1, 1,
-0.2989954, -1.22156, -4.116088, 1, 1, 1, 1, 1,
-0.2984056, -0.2256476, -2.67119, 1, 1, 1, 1, 1,
-0.2978865, -0.6617968, -2.576901, 1, 1, 1, 1, 1,
-0.2923492, -0.2184753, -2.420233, 1, 1, 1, 1, 1,
-0.288327, 1.193663, -0.9369631, 1, 1, 1, 1, 1,
-0.2832715, -1.880373, -2.466641, 1, 1, 1, 1, 1,
-0.2816049, -0.04864736, -0.09179462, 1, 1, 1, 1, 1,
-0.2816013, -0.1293498, -1.922256, 1, 1, 1, 1, 1,
-0.2788088, -0.1526039, -2.023149, 0, 0, 1, 1, 1,
-0.2782109, 0.2228086, -0.1543486, 1, 0, 0, 1, 1,
-0.2780896, 0.311935, 0.3119078, 1, 0, 0, 1, 1,
-0.2687029, 0.682335, 1.295529, 1, 0, 0, 1, 1,
-0.2660204, 0.2617241, -1.040633, 1, 0, 0, 1, 1,
-0.2656851, 0.7894667, 0.5052508, 1, 0, 0, 1, 1,
-0.2637091, 0.2430829, -0.8985587, 0, 0, 0, 1, 1,
-0.2625809, 0.9128073, 0.5791578, 0, 0, 0, 1, 1,
-0.2510279, 0.7043043, -0.496634, 0, 0, 0, 1, 1,
-0.2474783, 1.170808, -0.7163659, 0, 0, 0, 1, 1,
-0.2470961, 1.959207, -0.8385516, 0, 0, 0, 1, 1,
-0.2414723, -0.475566, -3.046041, 0, 0, 0, 1, 1,
-0.2367994, -1.053705, -3.020014, 0, 0, 0, 1, 1,
-0.2327676, -0.06175618, -2.451984, 1, 1, 1, 1, 1,
-0.2293985, 0.2236729, -1.020416, 1, 1, 1, 1, 1,
-0.227139, 0.3287372, 0.6792827, 1, 1, 1, 1, 1,
-0.2257334, -1.389607, -3.048711, 1, 1, 1, 1, 1,
-0.2226004, -0.4698438, -2.890799, 1, 1, 1, 1, 1,
-0.2188783, 0.1763461, 0.2971577, 1, 1, 1, 1, 1,
-0.2182218, 1.52903, 0.3032504, 1, 1, 1, 1, 1,
-0.2167573, -0.5547387, -3.393906, 1, 1, 1, 1, 1,
-0.2148193, -0.3966674, -1.921499, 1, 1, 1, 1, 1,
-0.2120189, -0.1656585, -3.483775, 1, 1, 1, 1, 1,
-0.209622, 1.465431, -0.7401624, 1, 1, 1, 1, 1,
-0.2084452, -1.282237, -2.983297, 1, 1, 1, 1, 1,
-0.2080712, -0.2740036, -2.441049, 1, 1, 1, 1, 1,
-0.2054375, 1.254092, -0.3755737, 1, 1, 1, 1, 1,
-0.2046946, -0.5988972, -3.361136, 1, 1, 1, 1, 1,
-0.2010825, 0.684979, -0.9468701, 0, 0, 1, 1, 1,
-0.2005653, -0.9179717, -2.695862, 1, 0, 0, 1, 1,
-0.1979582, 0.8439015, -0.8266565, 1, 0, 0, 1, 1,
-0.197114, 0.268049, 1.357109, 1, 0, 0, 1, 1,
-0.1953604, 0.5192607, 0.02257239, 1, 0, 0, 1, 1,
-0.1943744, 0.6077113, -0.7079928, 1, 0, 0, 1, 1,
-0.1928334, -1.345377, -3.371044, 0, 0, 0, 1, 1,
-0.1909672, 0.2155267, -1.061064, 0, 0, 0, 1, 1,
-0.1850443, 2.455195, 1.05366, 0, 0, 0, 1, 1,
-0.1759426, -0.1563958, -3.405724, 0, 0, 0, 1, 1,
-0.1759269, 0.09939919, -0.7583256, 0, 0, 0, 1, 1,
-0.1741, 1.451161, 0.2235302, 0, 0, 0, 1, 1,
-0.1716767, -0.1757946, -3.194585, 0, 0, 0, 1, 1,
-0.1712879, -0.2183311, -3.18341, 1, 1, 1, 1, 1,
-0.1706774, -0.7614599, -2.45566, 1, 1, 1, 1, 1,
-0.1692783, -0.4066096, -1.465792, 1, 1, 1, 1, 1,
-0.1668634, 2.245962, 0.6782925, 1, 1, 1, 1, 1,
-0.1564399, 0.9906923, -0.5734459, 1, 1, 1, 1, 1,
-0.1552789, -1.156791, -3.294791, 1, 1, 1, 1, 1,
-0.1530499, 1.89418, 1.351765, 1, 1, 1, 1, 1,
-0.151495, 1.409397, 0.9392495, 1, 1, 1, 1, 1,
-0.15031, -0.9803658, -4.537773, 1, 1, 1, 1, 1,
-0.14988, -0.1095351, -0.5569349, 1, 1, 1, 1, 1,
-0.1471927, -1.114616, -0.8645845, 1, 1, 1, 1, 1,
-0.1453368, 1.859758, 0.6421668, 1, 1, 1, 1, 1,
-0.1448989, 0.9506493, 1.717315, 1, 1, 1, 1, 1,
-0.1422074, -0.8839476, -3.151816, 1, 1, 1, 1, 1,
-0.1391708, 0.7933084, 0.2572024, 1, 1, 1, 1, 1,
-0.1390341, 0.7329841, 0.4138107, 0, 0, 1, 1, 1,
-0.1359208, 0.9682847, -1.357463, 1, 0, 0, 1, 1,
-0.1340693, 0.5105966, -1.690737, 1, 0, 0, 1, 1,
-0.1292915, -1.017984, -1.841762, 1, 0, 0, 1, 1,
-0.1279141, 0.3222091, -0.5849385, 1, 0, 0, 1, 1,
-0.1232767, -2.059228, -2.219734, 1, 0, 0, 1, 1,
-0.1228012, 0.7780151, -1.455443, 0, 0, 0, 1, 1,
-0.1219, 0.8859546, -0.6760828, 0, 0, 0, 1, 1,
-0.1205631, -0.6098021, -4.042235, 0, 0, 0, 1, 1,
-0.1183234, 0.08689061, -0.6868271, 0, 0, 0, 1, 1,
-0.1180191, -2.107613, -4.170273, 0, 0, 0, 1, 1,
-0.111721, 0.7957082, 0.9385612, 0, 0, 0, 1, 1,
-0.1104358, 1.243935, -0.06382986, 0, 0, 0, 1, 1,
-0.1087671, -0.8692249, -3.584594, 1, 1, 1, 1, 1,
-0.1083112, -1.175163, -1.95771, 1, 1, 1, 1, 1,
-0.1067978, -1.452048, -3.357552, 1, 1, 1, 1, 1,
-0.1059485, -0.6024797, -2.789597, 1, 1, 1, 1, 1,
-0.1044524, -0.197536, -3.242446, 1, 1, 1, 1, 1,
-0.1036024, 0.8184914, -0.3174354, 1, 1, 1, 1, 1,
-0.1034055, -0.09797586, -2.792087, 1, 1, 1, 1, 1,
-0.09997167, -0.1410576, -2.914419, 1, 1, 1, 1, 1,
-0.09875531, -0.5112944, -2.812754, 1, 1, 1, 1, 1,
-0.09845558, -0.5814865, -1.856721, 1, 1, 1, 1, 1,
-0.09732929, -0.7010693, -3.737743, 1, 1, 1, 1, 1,
-0.09593123, -0.1849706, -3.413223, 1, 1, 1, 1, 1,
-0.09563706, -0.5311766, -2.940616, 1, 1, 1, 1, 1,
-0.09548163, -0.6316805, -3.399432, 1, 1, 1, 1, 1,
-0.0936845, -0.5035092, -4.656971, 1, 1, 1, 1, 1,
-0.09346253, -0.1085281, -3.710624, 0, 0, 1, 1, 1,
-0.09200758, -1.310013, -3.616596, 1, 0, 0, 1, 1,
-0.08955959, -0.744857, -1.727104, 1, 0, 0, 1, 1,
-0.08702055, 0.9446111, 0.03061557, 1, 0, 0, 1, 1,
-0.08484141, 0.7586265, -2.194922, 1, 0, 0, 1, 1,
-0.0816437, 0.4279029, -2.492171, 1, 0, 0, 1, 1,
-0.08051562, 0.611992, -0.7722211, 0, 0, 0, 1, 1,
-0.07762686, -0.4121547, -2.54714, 0, 0, 0, 1, 1,
-0.07718083, 0.2844061, -0.8791477, 0, 0, 0, 1, 1,
-0.07708466, -0.7282661, -2.40355, 0, 0, 0, 1, 1,
-0.0756996, -0.4315547, -3.942414, 0, 0, 0, 1, 1,
-0.07409384, -0.5201918, -2.953279, 0, 0, 0, 1, 1,
-0.07190944, 0.02510728, 1.623898, 0, 0, 0, 1, 1,
-0.06672677, 0.793855, 1.600452, 1, 1, 1, 1, 1,
-0.06047551, 0.08531168, -1.387643, 1, 1, 1, 1, 1,
-0.06016269, 1.364546, -1.586266, 1, 1, 1, 1, 1,
-0.05735585, -0.7752811, -3.871615, 1, 1, 1, 1, 1,
-0.05721403, -0.1974428, -2.988067, 1, 1, 1, 1, 1,
-0.04979567, 0.2695996, 0.2084761, 1, 1, 1, 1, 1,
-0.04832931, -0.2747789, -2.820633, 1, 1, 1, 1, 1,
-0.04432765, -1.174286, -3.958998, 1, 1, 1, 1, 1,
-0.04249744, -0.4391168, -2.793292, 1, 1, 1, 1, 1,
-0.04184934, -0.5594022, -2.621844, 1, 1, 1, 1, 1,
-0.0374937, -0.907521, -2.992279, 1, 1, 1, 1, 1,
-0.03593193, 0.3406885, 0.865285, 1, 1, 1, 1, 1,
-0.03535003, -0.7104032, -1.99222, 1, 1, 1, 1, 1,
-0.02934395, 2.315869, -0.0431755, 1, 1, 1, 1, 1,
-0.0269436, -1.411698, -2.650534, 1, 1, 1, 1, 1,
-0.0181874, -0.9444054, -3.991201, 0, 0, 1, 1, 1,
-0.01758615, -0.8991104, -3.911481, 1, 0, 0, 1, 1,
-0.01055981, -0.3260656, -0.9293882, 1, 0, 0, 1, 1,
-0.01055547, -1.148348, -1.70728, 1, 0, 0, 1, 1,
-0.008122047, 0.981786, -0.3462184, 1, 0, 0, 1, 1,
-0.005843105, -0.2500746, -2.904652, 1, 0, 0, 1, 1,
-0.001189909, 2.826488, 0.5120338, 0, 0, 0, 1, 1,
0.001512704, 0.2875681, -0.5722296, 0, 0, 0, 1, 1,
0.00213227, 1.885993, 1.853544, 0, 0, 0, 1, 1,
0.00236039, -0.03665166, 3.95457, 0, 0, 0, 1, 1,
0.01007581, -0.09323213, 2.91554, 0, 0, 0, 1, 1,
0.01302544, 0.8825389, 0.5871966, 0, 0, 0, 1, 1,
0.01311633, 1.834799, 0.6213666, 0, 0, 0, 1, 1,
0.014906, 0.131578, 0.08157646, 1, 1, 1, 1, 1,
0.01492762, 0.4120884, 0.01964632, 1, 1, 1, 1, 1,
0.02248969, 1.597735, 0.8093314, 1, 1, 1, 1, 1,
0.02262415, 0.4744428, -0.2557339, 1, 1, 1, 1, 1,
0.02667028, -1.356566, 4.254292, 1, 1, 1, 1, 1,
0.02967155, 0.5595552, -0.3044654, 1, 1, 1, 1, 1,
0.02974972, -0.9445335, 4.200736, 1, 1, 1, 1, 1,
0.03195283, -1.061248, 4.496942, 1, 1, 1, 1, 1,
0.0342866, -0.291633, 3.648525, 1, 1, 1, 1, 1,
0.03524659, -0.3531399, 3.336395, 1, 1, 1, 1, 1,
0.03719106, 0.6660221, 0.8375984, 1, 1, 1, 1, 1,
0.04752956, -0.7730873, 3.400625, 1, 1, 1, 1, 1,
0.04882719, 0.5166689, 1.058375, 1, 1, 1, 1, 1,
0.05052486, 1.941335, -0.4263819, 1, 1, 1, 1, 1,
0.05114243, 0.5606318, 0.7117768, 1, 1, 1, 1, 1,
0.05126339, -0.9213956, 3.73417, 0, 0, 1, 1, 1,
0.05467902, -1.577142, 1.994294, 1, 0, 0, 1, 1,
0.05544777, -0.4988693, 4.442559, 1, 0, 0, 1, 1,
0.05561927, 2.147057, 0.7260529, 1, 0, 0, 1, 1,
0.06496215, 0.3916985, 0.5423396, 1, 0, 0, 1, 1,
0.06513547, -1.3032, 3.092426, 1, 0, 0, 1, 1,
0.0713815, 0.4672144, 0.2403689, 0, 0, 0, 1, 1,
0.07202858, 0.7591298, 2.395037, 0, 0, 0, 1, 1,
0.07436038, -0.393232, 4.088386, 0, 0, 0, 1, 1,
0.07842633, 0.1684617, -1.34355, 0, 0, 0, 1, 1,
0.07849503, -0.9928808, 3.329241, 0, 0, 0, 1, 1,
0.07965364, 0.4194519, -0.3649646, 0, 0, 0, 1, 1,
0.08082562, -0.8700507, 3.362644, 0, 0, 0, 1, 1,
0.08159063, 0.2966135, -1.207546, 1, 1, 1, 1, 1,
0.08192748, -0.5698697, 3.058731, 1, 1, 1, 1, 1,
0.09013568, -2.201652, 3.812073, 1, 1, 1, 1, 1,
0.09338038, -1.369608, 3.419488, 1, 1, 1, 1, 1,
0.0945539, -0.160943, 2.848488, 1, 1, 1, 1, 1,
0.09469958, -0.538808, 2.540916, 1, 1, 1, 1, 1,
0.09931324, -0.5048298, 3.153924, 1, 1, 1, 1, 1,
0.1015147, -0.635974, 4.342976, 1, 1, 1, 1, 1,
0.1038052, 1.431479, -0.07041425, 1, 1, 1, 1, 1,
0.11704, 1.935572, -0.06056909, 1, 1, 1, 1, 1,
0.1192946, -1.551325, 2.39338, 1, 1, 1, 1, 1,
0.1209025, -0.5662495, 3.375602, 1, 1, 1, 1, 1,
0.1232669, -3.49069, 1.754233, 1, 1, 1, 1, 1,
0.1236756, -0.3438249, 2.869495, 1, 1, 1, 1, 1,
0.1254632, -0.6027867, 4.179531, 1, 1, 1, 1, 1,
0.1267557, 1.286254, 0.6676047, 0, 0, 1, 1, 1,
0.1267706, 1.057235, 1.16286, 1, 0, 0, 1, 1,
0.1267735, -0.8435655, 0.2801098, 1, 0, 0, 1, 1,
0.1277331, 0.1968688, 0.4138553, 1, 0, 0, 1, 1,
0.1289262, 0.9426141, 2.151187, 1, 0, 0, 1, 1,
0.1384373, 0.4565654, 1.075565, 1, 0, 0, 1, 1,
0.1387149, 1.272666, 0.5686893, 0, 0, 0, 1, 1,
0.1426763, -2.947597, 3.185318, 0, 0, 0, 1, 1,
0.1452437, 0.2266217, 0.6460893, 0, 0, 0, 1, 1,
0.1467318, -0.4088763, 2.517714, 0, 0, 0, 1, 1,
0.1486856, 0.905234, -0.9913949, 0, 0, 0, 1, 1,
0.150983, 1.095771, -0.3155661, 0, 0, 0, 1, 1,
0.1551281, 0.5813257, 0.9555573, 0, 0, 0, 1, 1,
0.1594938, -1.287534, 1.608022, 1, 1, 1, 1, 1,
0.1601109, 0.0753439, 0.1717828, 1, 1, 1, 1, 1,
0.1642823, -0.4676776, 0.1827444, 1, 1, 1, 1, 1,
0.169644, 0.9785082, 0.02279665, 1, 1, 1, 1, 1,
0.1696804, 0.522446, 0.5327051, 1, 1, 1, 1, 1,
0.1743326, -0.3523296, 3.8104, 1, 1, 1, 1, 1,
0.1757836, 1.154554, -2.55998, 1, 1, 1, 1, 1,
0.1762106, -0.001043219, 2.929229, 1, 1, 1, 1, 1,
0.1787662, 0.3420391, 2.035414, 1, 1, 1, 1, 1,
0.1792513, 0.7519077, 1.154904, 1, 1, 1, 1, 1,
0.1832045, 1.42047, 0.003806738, 1, 1, 1, 1, 1,
0.1857644, -0.467257, 3.244707, 1, 1, 1, 1, 1,
0.1874776, -1.391953, 3.306553, 1, 1, 1, 1, 1,
0.1891447, 0.472561, 1.58722, 1, 1, 1, 1, 1,
0.1931935, -0.3304998, 2.722006, 1, 1, 1, 1, 1,
0.1963868, 1.768866, 1.305285, 0, 0, 1, 1, 1,
0.2094504, 0.2964974, 1.046897, 1, 0, 0, 1, 1,
0.2102911, 0.1525843, 0.5716873, 1, 0, 0, 1, 1,
0.2117006, -0.03388956, 2.128319, 1, 0, 0, 1, 1,
0.2150114, -0.3160554, 3.422692, 1, 0, 0, 1, 1,
0.2198068, -0.6952752, 1.813729, 1, 0, 0, 1, 1,
0.2205881, -0.7786596, 2.018916, 0, 0, 0, 1, 1,
0.2229961, 0.3387243, 0.4475019, 0, 0, 0, 1, 1,
0.2261105, 0.7762111, 0.6218336, 0, 0, 0, 1, 1,
0.2302606, 0.5107316, -1.374327, 0, 0, 0, 1, 1,
0.2332725, 0.4967446, 0.6919627, 0, 0, 0, 1, 1,
0.2344024, 1.917945, -1.243282, 0, 0, 0, 1, 1,
0.2396216, 0.8933766, 1.561473, 0, 0, 0, 1, 1,
0.2403536, 1.412049, -1.300304, 1, 1, 1, 1, 1,
0.2429809, 0.2172625, 1.000659, 1, 1, 1, 1, 1,
0.2451017, -0.9299452, 3.499125, 1, 1, 1, 1, 1,
0.2452895, -0.008651408, 1.961948, 1, 1, 1, 1, 1,
0.2494874, -0.8363379, 3.847354, 1, 1, 1, 1, 1,
0.2507386, -1.562168, 2.882967, 1, 1, 1, 1, 1,
0.2513698, 1.656639, 0.3765315, 1, 1, 1, 1, 1,
0.2541033, 0.1269362, 0.9848844, 1, 1, 1, 1, 1,
0.2576375, -1.643161, 1.663872, 1, 1, 1, 1, 1,
0.2627025, -0.3653847, 2.050416, 1, 1, 1, 1, 1,
0.2649662, 1.441381, 0.0571432, 1, 1, 1, 1, 1,
0.2664767, 1.380685, 1.873651, 1, 1, 1, 1, 1,
0.2782942, -0.8694713, 4.176466, 1, 1, 1, 1, 1,
0.2809171, 0.9375544, -0.8357257, 1, 1, 1, 1, 1,
0.2871316, 0.07956461, 1.370965, 1, 1, 1, 1, 1,
0.2871639, 0.44674, 1.666936, 0, 0, 1, 1, 1,
0.2908355, -0.5926266, 2.228119, 1, 0, 0, 1, 1,
0.2915837, -0.5054551, 0.6668615, 1, 0, 0, 1, 1,
0.2933458, 0.6721536, 1.012514, 1, 0, 0, 1, 1,
0.2977256, -2.614452, 2.237918, 1, 0, 0, 1, 1,
0.3009902, 1.053179, 0.7002349, 1, 0, 0, 1, 1,
0.3035888, 1.377442, 1.421262, 0, 0, 0, 1, 1,
0.3052334, 1.85092, -0.3263504, 0, 0, 0, 1, 1,
0.3099022, 2.210686, 1.386825, 0, 0, 0, 1, 1,
0.3113134, -0.01735314, 1.341425, 0, 0, 0, 1, 1,
0.319458, -0.9529858, 2.674979, 0, 0, 0, 1, 1,
0.3195333, 0.3086571, 0.390348, 0, 0, 0, 1, 1,
0.3209674, 0.2202895, 0.5701855, 0, 0, 0, 1, 1,
0.3218952, 0.09075736, 0.9984161, 1, 1, 1, 1, 1,
0.3245533, -0.5769222, 2.111386, 1, 1, 1, 1, 1,
0.3249287, -0.4165933, 2.627824, 1, 1, 1, 1, 1,
0.3254988, -0.09014842, 2.100536, 1, 1, 1, 1, 1,
0.3282055, 0.6464201, 0.8868766, 1, 1, 1, 1, 1,
0.3327831, -0.4439192, 0.2200773, 1, 1, 1, 1, 1,
0.3336143, -0.2999235, 2.201847, 1, 1, 1, 1, 1,
0.3341019, -0.06994666, 2.719723, 1, 1, 1, 1, 1,
0.3346772, 0.2277428, 1.139271, 1, 1, 1, 1, 1,
0.3385585, 0.593316, 0.3097163, 1, 1, 1, 1, 1,
0.3403079, -0.1710593, 1.493129, 1, 1, 1, 1, 1,
0.3513155, 2.80334, 1.459843, 1, 1, 1, 1, 1,
0.3580701, 1.215463, 2.176747, 1, 1, 1, 1, 1,
0.3589687, 0.1299318, -0.5771863, 1, 1, 1, 1, 1,
0.3599837, -0.3062875, 2.351714, 1, 1, 1, 1, 1,
0.3619593, 0.3535471, 0.2110581, 0, 0, 1, 1, 1,
0.3631365, -0.133708, 2.12809, 1, 0, 0, 1, 1,
0.3635472, 0.9575061, -0.1054386, 1, 0, 0, 1, 1,
0.3653975, 1.056129, 1.677939, 1, 0, 0, 1, 1,
0.3677443, 1.514024, -1.081558, 1, 0, 0, 1, 1,
0.3681257, -0.6947902, 1.974322, 1, 0, 0, 1, 1,
0.3692027, 0.7184505, -0.6021284, 0, 0, 0, 1, 1,
0.3698183, -0.3156607, 0.3565641, 0, 0, 0, 1, 1,
0.3706419, -0.2996433, 2.429174, 0, 0, 0, 1, 1,
0.3715214, -0.24408, 2.903597, 0, 0, 0, 1, 1,
0.3782523, -0.3436996, 2.02518, 0, 0, 0, 1, 1,
0.3793283, -0.741961, 3.323344, 0, 0, 0, 1, 1,
0.3819664, -1.031155, 2.52442, 0, 0, 0, 1, 1,
0.3884183, 1.673348, -0.3963451, 1, 1, 1, 1, 1,
0.3900795, -0.3580692, 0.8587354, 1, 1, 1, 1, 1,
0.3915855, -1.44268, 3.272511, 1, 1, 1, 1, 1,
0.3929101, 0.410805, -1.034336, 1, 1, 1, 1, 1,
0.3964078, 1.863035, 0.6404804, 1, 1, 1, 1, 1,
0.400389, -0.5885029, 1.190536, 1, 1, 1, 1, 1,
0.4164866, -0.2795679, 2.023442, 1, 1, 1, 1, 1,
0.418414, 3.142068, -0.2922197, 1, 1, 1, 1, 1,
0.4256404, 0.9451525, -0.6964067, 1, 1, 1, 1, 1,
0.4266964, 0.5983135, -0.1640786, 1, 1, 1, 1, 1,
0.4291746, 0.753622, 2.125254, 1, 1, 1, 1, 1,
0.4302578, 0.9338198, 1.509016, 1, 1, 1, 1, 1,
0.4344529, 0.008187905, 2.866058, 1, 1, 1, 1, 1,
0.4352859, -1.849928, 3.410436, 1, 1, 1, 1, 1,
0.4359679, 1.194178, 1.073587, 1, 1, 1, 1, 1,
0.4365188, 1.182552, 0.08698449, 0, 0, 1, 1, 1,
0.4388301, -0.5955642, 3.52946, 1, 0, 0, 1, 1,
0.4389524, -0.470097, 1.707323, 1, 0, 0, 1, 1,
0.4438874, -2.45696, 3.640437, 1, 0, 0, 1, 1,
0.4498369, 1.550082, 0.2662987, 1, 0, 0, 1, 1,
0.4523327, -1.700042, 4.347981, 1, 0, 0, 1, 1,
0.454579, 0.9612467, 1.133853, 0, 0, 0, 1, 1,
0.456596, 0.9506976, -0.3140501, 0, 0, 0, 1, 1,
0.4581065, -0.86784, 3.111406, 0, 0, 0, 1, 1,
0.4592041, -1.626589, 2.853629, 0, 0, 0, 1, 1,
0.4629936, -0.79821, 2.164265, 0, 0, 0, 1, 1,
0.4641573, 2.748197, -1.821205, 0, 0, 0, 1, 1,
0.4644765, -0.3700177, 1.774176, 0, 0, 0, 1, 1,
0.4659417, 0.1181797, 2.564063, 1, 1, 1, 1, 1,
0.4660161, 0.1405021, 0.3259645, 1, 1, 1, 1, 1,
0.4666406, 0.01782819, 0.3667827, 1, 1, 1, 1, 1,
0.4674152, -0.5484602, 2.122039, 1, 1, 1, 1, 1,
0.4689666, -1.516897, 2.658303, 1, 1, 1, 1, 1,
0.4695907, 0.07904913, 0.2801633, 1, 1, 1, 1, 1,
0.4710497, 0.002955084, 1.221828, 1, 1, 1, 1, 1,
0.471782, 0.2962294, -1.510248, 1, 1, 1, 1, 1,
0.4759113, 0.3097795, 0.2640866, 1, 1, 1, 1, 1,
0.4850166, -0.6667067, 3.522477, 1, 1, 1, 1, 1,
0.4856595, -2.204968, 4.058066, 1, 1, 1, 1, 1,
0.4876792, -0.6201902, 2.388674, 1, 1, 1, 1, 1,
0.4947705, 1.027419, -1.399292, 1, 1, 1, 1, 1,
0.4947914, -0.2093755, 2.070079, 1, 1, 1, 1, 1,
0.49687, -0.390633, 1.183814, 1, 1, 1, 1, 1,
0.497407, 0.6545192, 0.9904072, 0, 0, 1, 1, 1,
0.4980103, 1.082382, -0.993015, 1, 0, 0, 1, 1,
0.5019056, 1.025381, 0.1938175, 1, 0, 0, 1, 1,
0.5100497, 0.939791, -0.2957617, 1, 0, 0, 1, 1,
0.5167657, -0.2771545, 0.958968, 1, 0, 0, 1, 1,
0.5198435, 1.4835, 0.8942692, 1, 0, 0, 1, 1,
0.5285962, -0.1857342, 1.326477, 0, 0, 0, 1, 1,
0.5292557, 0.4689501, 1.523199, 0, 0, 0, 1, 1,
0.530781, 2.594467, -0.7992994, 0, 0, 0, 1, 1,
0.5369344, -2.327136, 3.534863, 0, 0, 0, 1, 1,
0.5485385, -0.2044627, -0.3249158, 0, 0, 0, 1, 1,
0.5498322, -0.2468705, 2.923945, 0, 0, 0, 1, 1,
0.5619192, 0.2110411, -1.061445, 0, 0, 0, 1, 1,
0.5666658, 0.5446265, 1.307015, 1, 1, 1, 1, 1,
0.5682341, -0.009011273, 0.4753462, 1, 1, 1, 1, 1,
0.5728441, -1.536861, 1.011211, 1, 1, 1, 1, 1,
0.5738983, 0.07495414, 2.86432, 1, 1, 1, 1, 1,
0.5749875, -0.8859304, 2.158891, 1, 1, 1, 1, 1,
0.5756054, 1.140097, 0.2015715, 1, 1, 1, 1, 1,
0.5774217, -0.577517, 1.806111, 1, 1, 1, 1, 1,
0.5801345, 0.4341929, 1.218971, 1, 1, 1, 1, 1,
0.5833346, 0.6554626, 0.3979463, 1, 1, 1, 1, 1,
0.5898744, 0.5382396, 0.9989396, 1, 1, 1, 1, 1,
0.5914035, -0.1926979, 2.64194, 1, 1, 1, 1, 1,
0.5981465, -0.78886, 1.705095, 1, 1, 1, 1, 1,
0.6006233, 0.1218987, 1.585391, 1, 1, 1, 1, 1,
0.6033887, 0.4379314, 1.362039, 1, 1, 1, 1, 1,
0.6040357, -0.8011013, 2.495651, 1, 1, 1, 1, 1,
0.6058424, -0.9692671, 3.384784, 0, 0, 1, 1, 1,
0.6059084, -1.136386, 1.461869, 1, 0, 0, 1, 1,
0.6064621, -1.646557, 3.436365, 1, 0, 0, 1, 1,
0.6077753, -0.1456786, 0.4816035, 1, 0, 0, 1, 1,
0.608059, 1.294682, 0.4201665, 1, 0, 0, 1, 1,
0.6088905, -0.4051239, 2.223017, 1, 0, 0, 1, 1,
0.6137, 0.4117994, 2.008362, 0, 0, 0, 1, 1,
0.6174695, -1.908453, 4.693293, 0, 0, 0, 1, 1,
0.6289201, 0.8428156, -0.03187974, 0, 0, 0, 1, 1,
0.6318651, 1.387696, 0.2187501, 0, 0, 0, 1, 1,
0.6319215, 0.2430476, 1.455683, 0, 0, 0, 1, 1,
0.63314, -0.05167365, 2.477437, 0, 0, 0, 1, 1,
0.6363198, -1.466567, 2.530174, 0, 0, 0, 1, 1,
0.6408885, -0.08538275, 2.448964, 1, 1, 1, 1, 1,
0.6466227, -1.047476, 3.144171, 1, 1, 1, 1, 1,
0.6494759, 0.2283521, 0.130803, 1, 1, 1, 1, 1,
0.6500227, 0.167383, 2.123137, 1, 1, 1, 1, 1,
0.650507, 1.170252, 1.554814, 1, 1, 1, 1, 1,
0.6510533, -0.4980293, 2.543962, 1, 1, 1, 1, 1,
0.6524792, -0.4373007, -0.1306274, 1, 1, 1, 1, 1,
0.6538291, -1.269203, 4.548314, 1, 1, 1, 1, 1,
0.6557419, 0.8723304, 0.1447444, 1, 1, 1, 1, 1,
0.6623312, 0.179451, 0.592682, 1, 1, 1, 1, 1,
0.6677306, -0.3201801, 2.352089, 1, 1, 1, 1, 1,
0.6679116, 0.6278119, 0.6320416, 1, 1, 1, 1, 1,
0.6705873, -0.8915037, 2.092429, 1, 1, 1, 1, 1,
0.6744483, -1.162687, 0.6961286, 1, 1, 1, 1, 1,
0.678092, 0.1355088, 2.903454, 1, 1, 1, 1, 1,
0.6787036, -1.882059, 3.778421, 0, 0, 1, 1, 1,
0.6826697, 0.209202, 0.9169804, 1, 0, 0, 1, 1,
0.6830239, -0.2970802, 2.391583, 1, 0, 0, 1, 1,
0.6848035, -0.33472, 2.024486, 1, 0, 0, 1, 1,
0.6861807, 1.898918, 0.6703727, 1, 0, 0, 1, 1,
0.6865079, 0.4389929, 0.9720513, 1, 0, 0, 1, 1,
0.6880501, 0.7657938, 0.4348947, 0, 0, 0, 1, 1,
0.6893802, 0.1640207, 1.808056, 0, 0, 0, 1, 1,
0.6918712, -0.3529744, 1.350371, 0, 0, 0, 1, 1,
0.694873, -0.5167191, 0.8877493, 0, 0, 0, 1, 1,
0.7047843, 0.05920412, 1.742791, 0, 0, 0, 1, 1,
0.7058315, 0.7182918, 2.903642, 0, 0, 0, 1, 1,
0.7148353, 0.4888563, 1.565299, 0, 0, 0, 1, 1,
0.7156627, 0.08629071, 2.2012, 1, 1, 1, 1, 1,
0.7174427, -0.2850808, 2.210362, 1, 1, 1, 1, 1,
0.7180754, 0.7172742, -1.849505, 1, 1, 1, 1, 1,
0.7183721, -2.468583, 5.332836, 1, 1, 1, 1, 1,
0.7205343, 1.454023, 0.9964805, 1, 1, 1, 1, 1,
0.7218527, 0.05109781, -0.7673187, 1, 1, 1, 1, 1,
0.722172, -0.5616343, 3.142362, 1, 1, 1, 1, 1,
0.7231336, -0.05604581, 1.374233, 1, 1, 1, 1, 1,
0.7233121, 0.5021189, 1.768458, 1, 1, 1, 1, 1,
0.7283598, 0.5978968, -0.1104317, 1, 1, 1, 1, 1,
0.7289012, 0.8952, 1.953283, 1, 1, 1, 1, 1,
0.7331243, -0.427739, 4.26418, 1, 1, 1, 1, 1,
0.7359502, -0.1432226, 2.166343, 1, 1, 1, 1, 1,
0.7371906, 0.8017574, -0.4112655, 1, 1, 1, 1, 1,
0.7431799, 1.079515, -0.09180275, 1, 1, 1, 1, 1,
0.7482643, -0.06272592, 1.163391, 0, 0, 1, 1, 1,
0.7487547, 1.512562, -0.848358, 1, 0, 0, 1, 1,
0.748789, 0.2260512, 2.220271, 1, 0, 0, 1, 1,
0.750727, 0.613196, -0.4602742, 1, 0, 0, 1, 1,
0.772897, -1.573656, 2.095468, 1, 0, 0, 1, 1,
0.7733957, 0.6141016, 1.185554, 1, 0, 0, 1, 1,
0.7736642, 2.442617, 0.5081641, 0, 0, 0, 1, 1,
0.7792036, 1.362702, -0.388139, 0, 0, 0, 1, 1,
0.7813464, -1.008571, 3.825082, 0, 0, 0, 1, 1,
0.7828767, 2.229737, 1.019691, 0, 0, 0, 1, 1,
0.7843634, 0.992874, -0.7326569, 0, 0, 0, 1, 1,
0.7880053, 0.02857647, 2.43901, 0, 0, 0, 1, 1,
0.7886446, 0.6699086, -0.7171833, 0, 0, 0, 1, 1,
0.7948492, -1.56747, 3.671821, 1, 1, 1, 1, 1,
0.7958434, 0.7874835, 1.235735, 1, 1, 1, 1, 1,
0.7969776, 0.9109079, 1.24587, 1, 1, 1, 1, 1,
0.7984797, -0.4981144, 2.867546, 1, 1, 1, 1, 1,
0.8086632, 0.8348655, 1.217859, 1, 1, 1, 1, 1,
0.8109145, -2.162655, 3.234328, 1, 1, 1, 1, 1,
0.8123836, -0.1407627, 2.390034, 1, 1, 1, 1, 1,
0.8180876, 0.3262998, 2.869683, 1, 1, 1, 1, 1,
0.8199924, -2.231705, 1.873946, 1, 1, 1, 1, 1,
0.8237826, 0.1738579, 1.323031, 1, 1, 1, 1, 1,
0.8257664, 0.7146555, -0.05638221, 1, 1, 1, 1, 1,
0.8268015, 0.2475726, 1.281588, 1, 1, 1, 1, 1,
0.8274648, -0.5799162, 1.522481, 1, 1, 1, 1, 1,
0.8356451, -0.3969102, 2.662093, 1, 1, 1, 1, 1,
0.8357966, 1.863431, -0.1430515, 1, 1, 1, 1, 1,
0.8466898, -0.3989446, 2.729407, 0, 0, 1, 1, 1,
0.848494, -1.352894, 2.868178, 1, 0, 0, 1, 1,
0.8515582, -0.2631072, 1.078858, 1, 0, 0, 1, 1,
0.856474, -2.543451, 3.095327, 1, 0, 0, 1, 1,
0.8588532, -0.1832987, 0.5303279, 1, 0, 0, 1, 1,
0.8608359, -0.3685155, 1.951047, 1, 0, 0, 1, 1,
0.8623015, 0.3452741, 1.451061, 0, 0, 0, 1, 1,
0.8636968, -1.338572, 2.841845, 0, 0, 0, 1, 1,
0.8655338, 1.994881, 1.914514, 0, 0, 0, 1, 1,
0.8674616, 0.6891404, 1.245357, 0, 0, 0, 1, 1,
0.8815309, 0.9128243, 0.4286169, 0, 0, 0, 1, 1,
0.882112, -0.2835557, 2.545899, 0, 0, 0, 1, 1,
0.8856755, 0.7074122, -0.1456062, 0, 0, 0, 1, 1,
0.8896852, -0.7169302, 1.361467, 1, 1, 1, 1, 1,
0.90325, -1.85578, 2.635954, 1, 1, 1, 1, 1,
0.9042752, 1.099708, 1.613939, 1, 1, 1, 1, 1,
0.9074872, 0.2679541, 1.512122, 1, 1, 1, 1, 1,
0.9102589, -0.2647061, 2.241286, 1, 1, 1, 1, 1,
0.9113104, 1.117237, 0.4010487, 1, 1, 1, 1, 1,
0.9178736, 1.024239, 0.7161855, 1, 1, 1, 1, 1,
0.9192231, -0.1585386, 0.820036, 1, 1, 1, 1, 1,
0.9202728, -0.6790072, 4.006641, 1, 1, 1, 1, 1,
0.9205047, 2.814124, -0.06226028, 1, 1, 1, 1, 1,
0.9236196, 2.36333, 0.1670395, 1, 1, 1, 1, 1,
0.9276217, -0.8677107, 3.705315, 1, 1, 1, 1, 1,
0.9308606, -0.0110756, 2.078992, 1, 1, 1, 1, 1,
0.9311053, 1.479213, 0.02637766, 1, 1, 1, 1, 1,
0.935373, 0.1019058, 2.229931, 1, 1, 1, 1, 1,
0.9371684, 0.3867302, 0.7683108, 0, 0, 1, 1, 1,
0.9374941, 0.7818936, 1.278207, 1, 0, 0, 1, 1,
0.9480412, -0.3133004, 2.633058, 1, 0, 0, 1, 1,
0.9485993, 1.549114, -0.6234572, 1, 0, 0, 1, 1,
0.9535066, -0.6319514, 2.194857, 1, 0, 0, 1, 1,
0.9561712, -0.5937414, 3.080943, 1, 0, 0, 1, 1,
0.9566351, 0.2798057, -0.3345189, 0, 0, 0, 1, 1,
0.9568768, 0.6917834, 1.880329, 0, 0, 0, 1, 1,
0.9589567, 2.097404, -0.9445089, 0, 0, 0, 1, 1,
0.9757047, -0.4444547, 3.096711, 0, 0, 0, 1, 1,
0.9818674, -0.382006, 2.884169, 0, 0, 0, 1, 1,
0.9843478, -0.6587967, 1.76841, 0, 0, 0, 1, 1,
0.9899872, -0.8245385, 3.914918, 0, 0, 0, 1, 1,
0.990372, -1.965855, 1.098813, 1, 1, 1, 1, 1,
0.9933098, 0.4754066, 3.254869, 1, 1, 1, 1, 1,
0.9939682, -1.172384, 3.710836, 1, 1, 1, 1, 1,
0.998087, -1.00957, 3.593125, 1, 1, 1, 1, 1,
1.000024, 1.66434, -0.03939507, 1, 1, 1, 1, 1,
1.002191, 0.5576391, 1.751124, 1, 1, 1, 1, 1,
1.01216, 0.3230453, 1.921924, 1, 1, 1, 1, 1,
1.014826, 0.3243001, 1.068653, 1, 1, 1, 1, 1,
1.015305, 1.221741, 1.734289, 1, 1, 1, 1, 1,
1.019017, -0.1345264, 1.258667, 1, 1, 1, 1, 1,
1.019154, -0.1928933, 2.869407, 1, 1, 1, 1, 1,
1.02025, -0.5790612, 1.061835, 1, 1, 1, 1, 1,
1.022644, 0.5667472, 0.7319231, 1, 1, 1, 1, 1,
1.030131, -0.9559103, 0.9587154, 1, 1, 1, 1, 1,
1.031958, 0.02206, 2.340661, 1, 1, 1, 1, 1,
1.032507, -0.9265413, 2.009619, 0, 0, 1, 1, 1,
1.033202, 0.3659027, 1.859575, 1, 0, 0, 1, 1,
1.033689, -0.4815198, 1.922268, 1, 0, 0, 1, 1,
1.034505, 1.346221, 0.2457996, 1, 0, 0, 1, 1,
1.038943, 0.1578042, 2.476349, 1, 0, 0, 1, 1,
1.041819, -0.2366216, 3.257621, 1, 0, 0, 1, 1,
1.042223, -1.021474, 0.4281901, 0, 0, 0, 1, 1,
1.042225, -1.312403, 2.406902, 0, 0, 0, 1, 1,
1.043729, 2.112855, -0.840822, 0, 0, 0, 1, 1,
1.055203, -0.4792392, 1.158847, 0, 0, 0, 1, 1,
1.055912, -0.06462163, 1.575678, 0, 0, 0, 1, 1,
1.05619, 1.301444, 0.9597129, 0, 0, 0, 1, 1,
1.057764, -0.4778803, 1.341448, 0, 0, 0, 1, 1,
1.058776, 0.2216961, 1.217035, 1, 1, 1, 1, 1,
1.061227, -1.796015, 2.440581, 1, 1, 1, 1, 1,
1.066533, 1.899305, 1.428352, 1, 1, 1, 1, 1,
1.074081, 1.216034, 0.5332405, 1, 1, 1, 1, 1,
1.074371, -0.83721, 3.562789, 1, 1, 1, 1, 1,
1.078752, 0.8703448, 2.000435, 1, 1, 1, 1, 1,
1.084846, 0.07656629, -0.2480761, 1, 1, 1, 1, 1,
1.085132, 1.282576, 2.148768, 1, 1, 1, 1, 1,
1.086798, 1.132482, 1.567287, 1, 1, 1, 1, 1,
1.088373, -0.2591535, 3.009074, 1, 1, 1, 1, 1,
1.089241, -2.046891, 2.810959, 1, 1, 1, 1, 1,
1.107817, -0.6688504, 2.412421, 1, 1, 1, 1, 1,
1.107947, -0.2094815, 1.313404, 1, 1, 1, 1, 1,
1.112985, 2.487943, -0.6114115, 1, 1, 1, 1, 1,
1.114195, 0.8748391, 0.9161067, 1, 1, 1, 1, 1,
1.119664, 0.2878766, 1.816914, 0, 0, 1, 1, 1,
1.12493, 1.818167, 0.1879215, 1, 0, 0, 1, 1,
1.125571, -1.000262, 3.048582, 1, 0, 0, 1, 1,
1.126465, -0.7697008, 1.980586, 1, 0, 0, 1, 1,
1.129527, 0.5090971, 3.340505, 1, 0, 0, 1, 1,
1.131674, 0.1265096, 2.185559, 1, 0, 0, 1, 1,
1.133721, 0.9329131, 0.2500212, 0, 0, 0, 1, 1,
1.135629, -0.6957422, 1.848725, 0, 0, 0, 1, 1,
1.143511, 0.01235709, -0.6813883, 0, 0, 0, 1, 1,
1.147054, 2.116932, -0.7054709, 0, 0, 0, 1, 1,
1.150868, 1.28859, 2.086517, 0, 0, 0, 1, 1,
1.155729, 0.9619142, -0.09221757, 0, 0, 0, 1, 1,
1.155886, -0.5404588, 1.989137, 0, 0, 0, 1, 1,
1.157591, -1.068912, 0.8440113, 1, 1, 1, 1, 1,
1.159781, -0.03212097, 1.483251, 1, 1, 1, 1, 1,
1.165106, -1.109176, 2.332896, 1, 1, 1, 1, 1,
1.165693, -1.235992, 1.42101, 1, 1, 1, 1, 1,
1.169888, -0.09773695, 1.231218, 1, 1, 1, 1, 1,
1.170928, 1.76555, -0.2154624, 1, 1, 1, 1, 1,
1.17748, -0.0266008, -0.9885433, 1, 1, 1, 1, 1,
1.181562, 0.3842138, 1.131739, 1, 1, 1, 1, 1,
1.189263, -1.231973, 2.145403, 1, 1, 1, 1, 1,
1.191426, -0.9634057, 1.919585, 1, 1, 1, 1, 1,
1.193029, -0.6887077, 3.119874, 1, 1, 1, 1, 1,
1.201911, 0.3326735, 2.634607, 1, 1, 1, 1, 1,
1.20654, 1.848151, 1.439047, 1, 1, 1, 1, 1,
1.211934, 0.1569883, 1.572454, 1, 1, 1, 1, 1,
1.213722, 1.768138, 1.440792, 1, 1, 1, 1, 1,
1.241694, 0.276701, 0.7271121, 0, 0, 1, 1, 1,
1.247352, 0.9699638, 1.704572, 1, 0, 0, 1, 1,
1.250902, 2.149829, -1.084615, 1, 0, 0, 1, 1,
1.255848, -0.6083917, 2.262169, 1, 0, 0, 1, 1,
1.258065, -0.01196354, 0.6120228, 1, 0, 0, 1, 1,
1.272445, 0.4461626, 1.373571, 1, 0, 0, 1, 1,
1.274701, -1.278062, 2.845499, 0, 0, 0, 1, 1,
1.275294, 0.9120889, 0.1869948, 0, 0, 0, 1, 1,
1.279732, -0.1136101, 0.5115424, 0, 0, 0, 1, 1,
1.284118, 0.2873102, 0.2723414, 0, 0, 0, 1, 1,
1.28647, 0.7658743, 2.624123, 0, 0, 0, 1, 1,
1.293863, 0.6793478, 1.866476, 0, 0, 0, 1, 1,
1.302086, -1.548531, 3.287879, 0, 0, 0, 1, 1,
1.328861, -0.08124781, 1.253674, 1, 1, 1, 1, 1,
1.330468, -0.2196747, 2.014624, 1, 1, 1, 1, 1,
1.341665, 0.6361432, 1.133596, 1, 1, 1, 1, 1,
1.342727, 0.5177495, 1.788489, 1, 1, 1, 1, 1,
1.347455, 0.5643665, 0.5946845, 1, 1, 1, 1, 1,
1.347988, -0.2502145, 2.589228, 1, 1, 1, 1, 1,
1.359916, -1.038035, 2.216884, 1, 1, 1, 1, 1,
1.369742, 0.1263001, 1.892062, 1, 1, 1, 1, 1,
1.370516, -1.145942, 0.6943876, 1, 1, 1, 1, 1,
1.374273, -1.01255, 1.474994, 1, 1, 1, 1, 1,
1.375605, -0.3316445, 1.813164, 1, 1, 1, 1, 1,
1.377503, 1.297178, -0.07637161, 1, 1, 1, 1, 1,
1.379566, 0.6572859, 0.7108461, 1, 1, 1, 1, 1,
1.389301, 0.7583045, -0.3228421, 1, 1, 1, 1, 1,
1.399508, -0.3286358, 2.891774, 1, 1, 1, 1, 1,
1.412355, 0.3790047, 2.39785, 0, 0, 1, 1, 1,
1.413061, 0.09373182, 1.854688, 1, 0, 0, 1, 1,
1.427179, -0.5511062, 1.059816, 1, 0, 0, 1, 1,
1.431041, 1.020936, -0.01233948, 1, 0, 0, 1, 1,
1.44706, 1.194458, 1.032106, 1, 0, 0, 1, 1,
1.448852, -0.7737468, 2.569199, 1, 0, 0, 1, 1,
1.466796, -2.289205, 2.398954, 0, 0, 0, 1, 1,
1.478222, -0.1799675, 2.07731, 0, 0, 0, 1, 1,
1.479477, -0.4804838, 3.180841, 0, 0, 0, 1, 1,
1.479622, 1.376596, -0.1172236, 0, 0, 0, 1, 1,
1.50822, 0.1284052, 0.1805541, 0, 0, 0, 1, 1,
1.521207, -1.255493, 3.057877, 0, 0, 0, 1, 1,
1.529796, -1.181739, 2.082929, 0, 0, 0, 1, 1,
1.533148, -0.1113469, 1.530026, 1, 1, 1, 1, 1,
1.555457, -0.5716782, 2.283033, 1, 1, 1, 1, 1,
1.55597, 1.425482, -0.7438306, 1, 1, 1, 1, 1,
1.593609, 1.010052, 0.3498575, 1, 1, 1, 1, 1,
1.597183, 1.546047, 0.9796686, 1, 1, 1, 1, 1,
1.614071, -0.7256948, 2.596277, 1, 1, 1, 1, 1,
1.617602, -1.027627, 3.274268, 1, 1, 1, 1, 1,
1.617761, 1.323033, 0.4965821, 1, 1, 1, 1, 1,
1.626599, -0.3893068, 1.732782, 1, 1, 1, 1, 1,
1.650914, -0.2826017, 1.912859, 1, 1, 1, 1, 1,
1.652863, 0.167901, 1.666476, 1, 1, 1, 1, 1,
1.673023, 0.02465453, 2.712788, 1, 1, 1, 1, 1,
1.680256, 0.7013665, 2.934129, 1, 1, 1, 1, 1,
1.685188, 1.1015, 2.014745, 1, 1, 1, 1, 1,
1.691836, -0.4368531, 2.441681, 1, 1, 1, 1, 1,
1.705574, -0.6988665, 0.1340909, 0, 0, 1, 1, 1,
1.720917, 0.8611568, 0.09339417, 1, 0, 0, 1, 1,
1.749184, 1.399446, 1.676114, 1, 0, 0, 1, 1,
1.755417, -0.1067159, 1.50978, 1, 0, 0, 1, 1,
1.757979, 1.443848, -0.2010215, 1, 0, 0, 1, 1,
1.769104, 1.505001, 1.628092, 1, 0, 0, 1, 1,
1.772707, 0.581445, 1.715116, 0, 0, 0, 1, 1,
1.774002, -0.9559798, 1.805144, 0, 0, 0, 1, 1,
1.791716, 0.01492217, 2.643363, 0, 0, 0, 1, 1,
1.802495, -0.3425646, 2.699425, 0, 0, 0, 1, 1,
1.811448, 1.272348, 1.840884, 0, 0, 0, 1, 1,
1.817792, -0.5746866, 2.119346, 0, 0, 0, 1, 1,
1.845344, 1.253669, 2.276395, 0, 0, 0, 1, 1,
1.854693, 0.6036254, 2.197161, 1, 1, 1, 1, 1,
1.855202, -0.7821337, 2.416309, 1, 1, 1, 1, 1,
1.88619, -1.23723, 1.491505, 1, 1, 1, 1, 1,
1.909827, -1.182056, 1.570547, 1, 1, 1, 1, 1,
1.913741, 0.3763033, 1.414831, 1, 1, 1, 1, 1,
1.925281, 0.1784575, 0.5354313, 1, 1, 1, 1, 1,
1.957597, -0.2623333, 2.460775, 1, 1, 1, 1, 1,
1.986484, 0.4519169, 1.49926, 1, 1, 1, 1, 1,
2.005805, 0.4930997, 0.5027988, 1, 1, 1, 1, 1,
2.016444, -0.4377698, 1.364241, 1, 1, 1, 1, 1,
2.019766, -1.104137, 1.589039, 1, 1, 1, 1, 1,
2.042698, 0.05294418, 3.070045, 1, 1, 1, 1, 1,
2.046534, 0.1322315, 3.23008, 1, 1, 1, 1, 1,
2.089116, -0.8244311, 2.770448, 1, 1, 1, 1, 1,
2.113388, 0.9639339, 1.490417, 1, 1, 1, 1, 1,
2.165922, 1.60423, 2.242989, 0, 0, 1, 1, 1,
2.194403, 2.44926, -0.2966049, 1, 0, 0, 1, 1,
2.211848, -1.088667, 2.205335, 1, 0, 0, 1, 1,
2.229396, 0.06705592, 2.142945, 1, 0, 0, 1, 1,
2.253582, 1.268768, 0.5203664, 1, 0, 0, 1, 1,
2.285159, -1.190432, 1.199637, 1, 0, 0, 1, 1,
2.332255, -1.103105, 3.035235, 0, 0, 0, 1, 1,
2.333881, -0.6359658, 1.403223, 0, 0, 0, 1, 1,
2.35351, -0.3116973, 1.868102, 0, 0, 0, 1, 1,
2.375462, 1.698846, 2.748897, 0, 0, 0, 1, 1,
2.376123, 0.4598748, 0.5081361, 0, 0, 0, 1, 1,
2.472055, 1.0138, 1.668841, 0, 0, 0, 1, 1,
2.506526, -0.03603608, 0.03644898, 0, 0, 0, 1, 1,
2.545713, -1.111915, 2.647916, 1, 1, 1, 1, 1,
2.587172, 0.699509, 0.2723177, 1, 1, 1, 1, 1,
2.625239, 0.125519, 1.26881, 1, 1, 1, 1, 1,
2.630946, -0.5896138, 1.341881, 1, 1, 1, 1, 1,
2.773147, -0.2883856, 2.937968, 1, 1, 1, 1, 1,
2.793605, 1.796191, 0.5011579, 1, 1, 1, 1, 1,
2.799607, -0.1567019, 3.019072, 1, 1, 1, 1, 1
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
var radius = 9.852027;
var distance = 34.60483;
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
mvMatrix.translate( 0.2741584, 0.1743109, 0.3746381 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.60483);
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
