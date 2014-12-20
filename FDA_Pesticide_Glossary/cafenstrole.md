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
-2.904596, 2.042635, -2.180157, 1, 0, 0, 1,
-2.731345, 0.7831141, -2.666246, 1, 0.007843138, 0, 1,
-2.666387, 0.6229579, -0.8711609, 1, 0.01176471, 0, 1,
-2.594914, -0.1903467, -1.656076, 1, 0.01960784, 0, 1,
-2.470697, 0.06379416, -0.752605, 1, 0.02352941, 0, 1,
-2.461605, 0.8235252, -0.8708047, 1, 0.03137255, 0, 1,
-2.459745, 1.070762, -0.09530172, 1, 0.03529412, 0, 1,
-2.38938, 1.875089, -2.024388, 1, 0.04313726, 0, 1,
-2.371281, 1.261444, 0.6967413, 1, 0.04705882, 0, 1,
-2.365973, -0.1363629, -0.5497321, 1, 0.05490196, 0, 1,
-2.36023, 0.1973246, -1.309765, 1, 0.05882353, 0, 1,
-2.338183, -0.05842693, -2.456175, 1, 0.06666667, 0, 1,
-2.321137, 1.042578, -0.397072, 1, 0.07058824, 0, 1,
-2.301269, 0.9620743, 1.479717, 1, 0.07843138, 0, 1,
-2.260952, 0.8070228, -1.414066, 1, 0.08235294, 0, 1,
-2.200896, 1.856724, 1.231732, 1, 0.09019608, 0, 1,
-2.190137, -0.8706778, -2.841852, 1, 0.09411765, 0, 1,
-2.167594, 1.078536, 0.7453848, 1, 0.1019608, 0, 1,
-2.15742, -1.541742, -0.9379455, 1, 0.1098039, 0, 1,
-2.146016, -1.073743, -3.165949, 1, 0.1137255, 0, 1,
-2.115022, 0.2092943, -2.744507, 1, 0.1215686, 0, 1,
-2.08297, 0.727495, -2.041252, 1, 0.1254902, 0, 1,
-2.062212, 0.02521235, -0.2079294, 1, 0.1333333, 0, 1,
-2.052237, -0.07068764, -0.9329472, 1, 0.1372549, 0, 1,
-2.02411, 0.4546493, -1.018335, 1, 0.145098, 0, 1,
-1.996903, 0.6946559, -2.581467, 1, 0.1490196, 0, 1,
-1.995232, 1.167523, -2.156502, 1, 0.1568628, 0, 1,
-1.990959, -0.5713086, -1.557627, 1, 0.1607843, 0, 1,
-1.984854, 0.283956, -1.952799, 1, 0.1686275, 0, 1,
-1.955719, 1.766288, 1.381769, 1, 0.172549, 0, 1,
-1.926048, 1.321681, -0.3878644, 1, 0.1803922, 0, 1,
-1.92051, 0.2291389, -0.9270777, 1, 0.1843137, 0, 1,
-1.900079, 0.743872, -1.055007, 1, 0.1921569, 0, 1,
-1.887167, -0.5978022, -2.620608, 1, 0.1960784, 0, 1,
-1.875242, -0.5631614, -1.495739, 1, 0.2039216, 0, 1,
-1.861177, -0.2263183, -1.914258, 1, 0.2117647, 0, 1,
-1.853605, -1.994531, -0.3924709, 1, 0.2156863, 0, 1,
-1.843238, 0.01414615, -1.311533, 1, 0.2235294, 0, 1,
-1.842152, 2.074774, -0.686587, 1, 0.227451, 0, 1,
-1.815523, -0.1231097, -1.802167, 1, 0.2352941, 0, 1,
-1.807104, 0.4008525, -1.496628, 1, 0.2392157, 0, 1,
-1.793405, -0.5999567, -1.37672, 1, 0.2470588, 0, 1,
-1.746411, -0.5805565, -0.9517787, 1, 0.2509804, 0, 1,
-1.743396, 1.263317, -0.7472153, 1, 0.2588235, 0, 1,
-1.743173, -0.4822007, -3.877562, 1, 0.2627451, 0, 1,
-1.742158, -0.9553133, -2.637033, 1, 0.2705882, 0, 1,
-1.723471, 2.251157, 0.1089902, 1, 0.2745098, 0, 1,
-1.721416, -1.294256, -2.601568, 1, 0.282353, 0, 1,
-1.684145, 0.8155913, -0.8248405, 1, 0.2862745, 0, 1,
-1.684122, -0.7441041, -2.130268, 1, 0.2941177, 0, 1,
-1.680255, -2.11378, -2.087483, 1, 0.3019608, 0, 1,
-1.672333, 1.343731, -0.3599125, 1, 0.3058824, 0, 1,
-1.652258, -0.6008999, 0.3514836, 1, 0.3137255, 0, 1,
-1.638086, -0.6000711, -1.60998, 1, 0.3176471, 0, 1,
-1.620984, 0.5628469, -0.7379664, 1, 0.3254902, 0, 1,
-1.610974, 0.8377733, -0.8993074, 1, 0.3294118, 0, 1,
-1.605382, -0.1610558, -2.081415, 1, 0.3372549, 0, 1,
-1.591415, -1.075682, -0.7976364, 1, 0.3411765, 0, 1,
-1.587891, 1.170045, 0.0327125, 1, 0.3490196, 0, 1,
-1.587175, 0.4754968, 0.129163, 1, 0.3529412, 0, 1,
-1.584856, 0.2288864, -1.246515, 1, 0.3607843, 0, 1,
-1.584737, 0.5950741, -0.4501075, 1, 0.3647059, 0, 1,
-1.572821, -0.1035707, -0.03837965, 1, 0.372549, 0, 1,
-1.567496, -0.6459882, -0.773571, 1, 0.3764706, 0, 1,
-1.547274, 0.04019371, -2.372815, 1, 0.3843137, 0, 1,
-1.545807, 1.828142, 0.7129183, 1, 0.3882353, 0, 1,
-1.542476, 0.4766404, -0.8766349, 1, 0.3960784, 0, 1,
-1.541825, -1.467732, -1.804787, 1, 0.4039216, 0, 1,
-1.540695, -0.1547338, -2.833444, 1, 0.4078431, 0, 1,
-1.521482, 0.3829207, -2.084115, 1, 0.4156863, 0, 1,
-1.519031, -1.282287, -2.636296, 1, 0.4196078, 0, 1,
-1.507249, 0.8851544, 0.09848402, 1, 0.427451, 0, 1,
-1.49842, 0.6132329, -1.495807, 1, 0.4313726, 0, 1,
-1.483487, 2.030785, -1.175571, 1, 0.4392157, 0, 1,
-1.47986, 0.3997407, -1.594404, 1, 0.4431373, 0, 1,
-1.478467, 1.847785, -0.5405409, 1, 0.4509804, 0, 1,
-1.473548, -0.4785507, -1.706246, 1, 0.454902, 0, 1,
-1.467578, -0.06910622, -3.53425, 1, 0.4627451, 0, 1,
-1.466193, 1.101132, -2.064216, 1, 0.4666667, 0, 1,
-1.465216, -0.9913055, -2.575634, 1, 0.4745098, 0, 1,
-1.46233, -0.6346391, -2.495892, 1, 0.4784314, 0, 1,
-1.458128, -0.2739615, -1.044289, 1, 0.4862745, 0, 1,
-1.443242, -1.529955, -2.218669, 1, 0.4901961, 0, 1,
-1.441982, 1.548995, 0.07446074, 1, 0.4980392, 0, 1,
-1.441676, 0.9276054, -1.71407, 1, 0.5058824, 0, 1,
-1.440528, -1.875981, -2.766613, 1, 0.509804, 0, 1,
-1.436292, 0.196643, -0.7980066, 1, 0.5176471, 0, 1,
-1.43083, 0.2976284, -1.431865, 1, 0.5215687, 0, 1,
-1.427329, 1.147351, -0.893777, 1, 0.5294118, 0, 1,
-1.420201, -0.6623794, -3.528792, 1, 0.5333334, 0, 1,
-1.412748, 1.07828, -0.03482423, 1, 0.5411765, 0, 1,
-1.409574, -0.7074601, -2.704963, 1, 0.5450981, 0, 1,
-1.398002, -2.525842, -2.722846, 1, 0.5529412, 0, 1,
-1.397711, 0.3744218, -0.1074548, 1, 0.5568628, 0, 1,
-1.397106, 0.06184336, -1.60716, 1, 0.5647059, 0, 1,
-1.396909, 0.2102417, 0.3125724, 1, 0.5686275, 0, 1,
-1.394751, -1.035963, -1.731118, 1, 0.5764706, 0, 1,
-1.392159, 0.0144466, -2.280565, 1, 0.5803922, 0, 1,
-1.389457, 0.9303992, 0.3542805, 1, 0.5882353, 0, 1,
-1.379272, 0.5843462, -0.6555223, 1, 0.5921569, 0, 1,
-1.376768, 0.6520725, -0.7760975, 1, 0.6, 0, 1,
-1.368859, 0.1442409, -0.3284252, 1, 0.6078432, 0, 1,
-1.366201, -0.2302967, -3.594895, 1, 0.6117647, 0, 1,
-1.365197, 0.6346059, -1.919577, 1, 0.6196079, 0, 1,
-1.354799, -0.1522175, -1.468773, 1, 0.6235294, 0, 1,
-1.349025, -1.002693, -1.781922, 1, 0.6313726, 0, 1,
-1.346344, -0.03042629, -1.443575, 1, 0.6352941, 0, 1,
-1.33853, -1.301817, -1.694586, 1, 0.6431373, 0, 1,
-1.337962, -0.2554218, -2.522286, 1, 0.6470588, 0, 1,
-1.334553, -1.073133, -1.23769, 1, 0.654902, 0, 1,
-1.328351, 0.132185, 0.2305972, 1, 0.6588235, 0, 1,
-1.318038, 0.5983054, 0.2988662, 1, 0.6666667, 0, 1,
-1.317813, 0.7622326, -1.130426, 1, 0.6705883, 0, 1,
-1.310295, 0.9153097, -0.5470462, 1, 0.6784314, 0, 1,
-1.303872, -1.000544, -2.268519, 1, 0.682353, 0, 1,
-1.299517, -1.451468, -2.968176, 1, 0.6901961, 0, 1,
-1.294138, 1.883212, -1.212202, 1, 0.6941177, 0, 1,
-1.287869, 0.4481654, 0.1747954, 1, 0.7019608, 0, 1,
-1.287612, 0.4338749, -0.7910403, 1, 0.7098039, 0, 1,
-1.275048, -0.1642581, -2.381671, 1, 0.7137255, 0, 1,
-1.264891, -1.161378, -1.967893, 1, 0.7215686, 0, 1,
-1.260468, -0.1744828, -0.8026118, 1, 0.7254902, 0, 1,
-1.254895, 0.07321692, -1.144386, 1, 0.7333333, 0, 1,
-1.253919, 0.7713919, -0.6029105, 1, 0.7372549, 0, 1,
-1.248816, 0.49354, -1.677989, 1, 0.7450981, 0, 1,
-1.243208, 0.4629972, 0.1837575, 1, 0.7490196, 0, 1,
-1.228058, -0.07417495, -1.63184, 1, 0.7568628, 0, 1,
-1.227002, 0.9176919, -1.3552, 1, 0.7607843, 0, 1,
-1.215806, 0.3282294, -2.233721, 1, 0.7686275, 0, 1,
-1.205294, 0.1224926, -1.057704, 1, 0.772549, 0, 1,
-1.203152, 0.5866, -0.5204139, 1, 0.7803922, 0, 1,
-1.198688, -0.07986569, -1.840124, 1, 0.7843137, 0, 1,
-1.198595, -0.7490339, -2.330102, 1, 0.7921569, 0, 1,
-1.198079, 0.8192782, -2.025684, 1, 0.7960784, 0, 1,
-1.193543, 0.2525781, -1.992926, 1, 0.8039216, 0, 1,
-1.186323, 0.8723046, -1.13422, 1, 0.8117647, 0, 1,
-1.180883, -1.375585, -1.644376, 1, 0.8156863, 0, 1,
-1.176798, -1.232831, -1.40779, 1, 0.8235294, 0, 1,
-1.173916, -0.1658476, -0.7247431, 1, 0.827451, 0, 1,
-1.170784, 1.121033, 0.1409031, 1, 0.8352941, 0, 1,
-1.160716, 0.3245266, -0.01373409, 1, 0.8392157, 0, 1,
-1.153971, -0.7584838, -2.074082, 1, 0.8470588, 0, 1,
-1.147846, -0.5112469, -3.387867, 1, 0.8509804, 0, 1,
-1.147321, 0.3803128, -0.2259188, 1, 0.8588235, 0, 1,
-1.146141, 0.05614827, -2.946062, 1, 0.8627451, 0, 1,
-1.142015, -0.8013675, -3.268772, 1, 0.8705882, 0, 1,
-1.14171, -1.1369, -1.568565, 1, 0.8745098, 0, 1,
-1.131155, -1.502743, -2.559373, 1, 0.8823529, 0, 1,
-1.12997, -0.5016176, -3.831216, 1, 0.8862745, 0, 1,
-1.128748, 0.4784356, 0.583083, 1, 0.8941177, 0, 1,
-1.126854, 0.3626927, -0.8744955, 1, 0.8980392, 0, 1,
-1.124343, -0.2099193, -0.5340444, 1, 0.9058824, 0, 1,
-1.122598, 2.176684, -2.359318, 1, 0.9137255, 0, 1,
-1.10918, 0.8918658, -1.489109, 1, 0.9176471, 0, 1,
-1.101025, -0.7682186, -3.420899, 1, 0.9254902, 0, 1,
-1.099619, -0.2151486, -2.242441, 1, 0.9294118, 0, 1,
-1.099231, -0.4655462, -2.604115, 1, 0.9372549, 0, 1,
-1.098489, -0.2160845, -1.835531, 1, 0.9411765, 0, 1,
-1.094069, 1.204225, -2.991563, 1, 0.9490196, 0, 1,
-1.086507, 0.6001655, -2.351016, 1, 0.9529412, 0, 1,
-1.085285, 0.5195912, -2.820098, 1, 0.9607843, 0, 1,
-1.084121, 1.224995, -1.381229, 1, 0.9647059, 0, 1,
-1.079179, 0.3810663, -0.3410932, 1, 0.972549, 0, 1,
-1.071854, 0.0114279, -0.1963126, 1, 0.9764706, 0, 1,
-1.0698, -1.116806, -0.8051572, 1, 0.9843137, 0, 1,
-1.067704, -0.5592416, -2.480175, 1, 0.9882353, 0, 1,
-1.067146, -0.1134781, -2.097561, 1, 0.9960784, 0, 1,
-1.062935, 0.2282671, -2.721699, 0.9960784, 1, 0, 1,
-1.059948, 0.8951659, -0.130087, 0.9921569, 1, 0, 1,
-1.057686, -0.732548, -3.201415, 0.9843137, 1, 0, 1,
-1.048972, -0.3622543, -2.40045, 0.9803922, 1, 0, 1,
-1.047484, -0.1697946, -2.114167, 0.972549, 1, 0, 1,
-1.039627, 1.704901, 1.029482, 0.9686275, 1, 0, 1,
-1.037929, 0.3379018, -1.033863, 0.9607843, 1, 0, 1,
-1.032667, -0.8563389, -1.519927, 0.9568627, 1, 0, 1,
-1.031289, 2.382406, -1.999421, 0.9490196, 1, 0, 1,
-1.029716, -0.04014257, -1.272214, 0.945098, 1, 0, 1,
-1.027622, 0.5328721, -0.2621256, 0.9372549, 1, 0, 1,
-1.011438, 1.54946, -0.6051691, 0.9333333, 1, 0, 1,
-1.011261, -1.536497, -2.686733, 0.9254902, 1, 0, 1,
-1.004086, 0.4374181, -1.727461, 0.9215686, 1, 0, 1,
-0.9981277, -0.5502967, -2.432271, 0.9137255, 1, 0, 1,
-0.9939935, -0.6438179, -2.49908, 0.9098039, 1, 0, 1,
-0.9846669, 0.5487319, -1.259201, 0.9019608, 1, 0, 1,
-0.9756255, 1.049167, -0.9220445, 0.8941177, 1, 0, 1,
-0.9750783, 1.203375, -2.574572, 0.8901961, 1, 0, 1,
-0.9737704, 1.365491, -2.407977, 0.8823529, 1, 0, 1,
-0.9709442, -1.570629, -2.198873, 0.8784314, 1, 0, 1,
-0.9651955, -0.5670781, -2.253324, 0.8705882, 1, 0, 1,
-0.9650688, -0.8158485, -1.743462, 0.8666667, 1, 0, 1,
-0.9582608, 0.1522078, -1.42115, 0.8588235, 1, 0, 1,
-0.9507385, -1.589005, -1.676143, 0.854902, 1, 0, 1,
-0.944735, 0.5194703, -0.8069462, 0.8470588, 1, 0, 1,
-0.9422162, 0.2020117, -3.472602, 0.8431373, 1, 0, 1,
-0.9345505, -0.8644168, -2.545557, 0.8352941, 1, 0, 1,
-0.9344654, 0.1417461, -2.701718, 0.8313726, 1, 0, 1,
-0.9217604, -1.439338, -2.382129, 0.8235294, 1, 0, 1,
-0.91574, 0.3251035, -1.208765, 0.8196079, 1, 0, 1,
-0.8931901, -0.343926, -2.066565, 0.8117647, 1, 0, 1,
-0.8906169, -1.069224, -3.106891, 0.8078431, 1, 0, 1,
-0.8862439, -1.034591, -2.873509, 0.8, 1, 0, 1,
-0.8770633, 0.2320819, -0.4292031, 0.7921569, 1, 0, 1,
-0.8762094, -0.5832052, -3.352569, 0.7882353, 1, 0, 1,
-0.8754342, -1.875437, -2.079577, 0.7803922, 1, 0, 1,
-0.8731623, -0.9011626, -0.8403189, 0.7764706, 1, 0, 1,
-0.871197, -0.9493008, -2.767849, 0.7686275, 1, 0, 1,
-0.8695077, -1.830601, -2.458066, 0.7647059, 1, 0, 1,
-0.86766, -0.2953257, -1.87932, 0.7568628, 1, 0, 1,
-0.864679, -0.1026729, -0.6159631, 0.7529412, 1, 0, 1,
-0.8604249, -0.7101216, -1.433578, 0.7450981, 1, 0, 1,
-0.8595523, 0.1445544, -1.911757, 0.7411765, 1, 0, 1,
-0.8491743, -1.099239, -0.4644831, 0.7333333, 1, 0, 1,
-0.8445617, -0.05716578, 0.1362034, 0.7294118, 1, 0, 1,
-0.8432068, 0.1615823, -1.268352, 0.7215686, 1, 0, 1,
-0.8391356, 0.4080287, -1.410059, 0.7176471, 1, 0, 1,
-0.8324527, 0.3242488, -0.8609381, 0.7098039, 1, 0, 1,
-0.8294003, 0.8165836, -0.2627541, 0.7058824, 1, 0, 1,
-0.823685, 0.9898499, -2.372947, 0.6980392, 1, 0, 1,
-0.8235951, -0.4193432, -2.660778, 0.6901961, 1, 0, 1,
-0.8233215, 0.8302323, 0.6193451, 0.6862745, 1, 0, 1,
-0.8202975, 0.5425843, -1.71351, 0.6784314, 1, 0, 1,
-0.8143237, -0.8465936, -0.7627919, 0.6745098, 1, 0, 1,
-0.8142525, 1.142565, -0.3820516, 0.6666667, 1, 0, 1,
-0.8135181, 0.4501128, -0.04620178, 0.6627451, 1, 0, 1,
-0.8116317, 0.03439513, -2.800226, 0.654902, 1, 0, 1,
-0.8003595, -0.3687635, -2.824864, 0.6509804, 1, 0, 1,
-0.7975729, -0.04571, -1.286242, 0.6431373, 1, 0, 1,
-0.7975643, 1.165098, -0.3537685, 0.6392157, 1, 0, 1,
-0.7959253, 0.7501034, -1.036841, 0.6313726, 1, 0, 1,
-0.7904217, -0.3208258, -0.728954, 0.627451, 1, 0, 1,
-0.790404, 0.7895621, 0.576324, 0.6196079, 1, 0, 1,
-0.7887407, 1.50722, -0.4042859, 0.6156863, 1, 0, 1,
-0.7817835, -0.4803786, -0.3120198, 0.6078432, 1, 0, 1,
-0.7786843, -0.2253782, 1.457412, 0.6039216, 1, 0, 1,
-0.7785943, 1.140417, -0.557766, 0.5960785, 1, 0, 1,
-0.778204, -0.987618, -1.874673, 0.5882353, 1, 0, 1,
-0.7771198, 1.131985, -0.0322882, 0.5843138, 1, 0, 1,
-0.7726955, -0.8701643, -1.440245, 0.5764706, 1, 0, 1,
-0.7709361, -0.1840007, -3.009964, 0.572549, 1, 0, 1,
-0.7639818, 2.013681, -1.321185, 0.5647059, 1, 0, 1,
-0.7615638, -2.219536, -1.418647, 0.5607843, 1, 0, 1,
-0.7604103, 0.5962754, -1.990555, 0.5529412, 1, 0, 1,
-0.7577929, -0.06130788, -3.636886, 0.5490196, 1, 0, 1,
-0.7502394, -0.8448229, -2.958381, 0.5411765, 1, 0, 1,
-0.7381205, 0.3282249, -0.998485, 0.5372549, 1, 0, 1,
-0.7345756, -1.578567, -3.652917, 0.5294118, 1, 0, 1,
-0.731658, -0.4942112, 0.07008889, 0.5254902, 1, 0, 1,
-0.730775, -2.316439, -3.270571, 0.5176471, 1, 0, 1,
-0.7300479, 0.4317017, -2.718535, 0.5137255, 1, 0, 1,
-0.7285825, -0.09133056, -3.481354, 0.5058824, 1, 0, 1,
-0.7281845, -0.429479, -3.443151, 0.5019608, 1, 0, 1,
-0.7085536, 0.2963019, -0.6438505, 0.4941176, 1, 0, 1,
-0.7076851, -0.6850722, -2.765842, 0.4862745, 1, 0, 1,
-0.7065161, 0.05140875, -2.431336, 0.4823529, 1, 0, 1,
-0.7059312, -1.227936, -2.24286, 0.4745098, 1, 0, 1,
-0.7055879, -0.8729931, -2.910399, 0.4705882, 1, 0, 1,
-0.7041854, -1.102749, -2.961013, 0.4627451, 1, 0, 1,
-0.7034707, -0.1482042, -2.173693, 0.4588235, 1, 0, 1,
-0.6980488, -1.632315, -2.912126, 0.4509804, 1, 0, 1,
-0.6967682, 0.9044653, 1.200657, 0.4470588, 1, 0, 1,
-0.6937597, -0.8464414, -1.387885, 0.4392157, 1, 0, 1,
-0.6895906, -0.9771906, -3.436653, 0.4352941, 1, 0, 1,
-0.6866557, 0.1164264, -3.132797, 0.427451, 1, 0, 1,
-0.6855598, 0.473169, -2.575399, 0.4235294, 1, 0, 1,
-0.6817487, 0.360614, 0.7751703, 0.4156863, 1, 0, 1,
-0.6772963, -2.602871, -2.442847, 0.4117647, 1, 0, 1,
-0.6753051, 0.1159895, -2.168411, 0.4039216, 1, 0, 1,
-0.6688945, 1.103539, -0.2536035, 0.3960784, 1, 0, 1,
-0.6613514, -1.442563, -1.462669, 0.3921569, 1, 0, 1,
-0.6609342, 1.341871, -1.820346, 0.3843137, 1, 0, 1,
-0.6599559, 1.312377, -0.4274408, 0.3803922, 1, 0, 1,
-0.6574042, -1.232385, -3.645711, 0.372549, 1, 0, 1,
-0.6556334, -0.9430639, -2.054065, 0.3686275, 1, 0, 1,
-0.6537257, -1.189439, -1.090495, 0.3607843, 1, 0, 1,
-0.6525691, -1.452865, -0.6792724, 0.3568628, 1, 0, 1,
-0.6486757, 2.500993, 0.1117174, 0.3490196, 1, 0, 1,
-0.6427444, -1.334826, -4.302763, 0.345098, 1, 0, 1,
-0.6414351, 0.8848155, -0.7818533, 0.3372549, 1, 0, 1,
-0.6396034, 1.162697, -1.058797, 0.3333333, 1, 0, 1,
-0.6383668, -0.6356837, -2.254813, 0.3254902, 1, 0, 1,
-0.6300567, 0.2462863, -0.5668722, 0.3215686, 1, 0, 1,
-0.6263309, -0.4766205, -1.910255, 0.3137255, 1, 0, 1,
-0.619775, 0.6281539, -0.3575906, 0.3098039, 1, 0, 1,
-0.6157311, -0.442734, -2.138403, 0.3019608, 1, 0, 1,
-0.603228, -1.716515, -2.028296, 0.2941177, 1, 0, 1,
-0.6015916, 0.1157219, -0.6929265, 0.2901961, 1, 0, 1,
-0.6007656, 0.7412733, -0.7908369, 0.282353, 1, 0, 1,
-0.5991889, -1.29801, -3.60038, 0.2784314, 1, 0, 1,
-0.5967364, 0.7922007, -0.07332399, 0.2705882, 1, 0, 1,
-0.5966418, -0.02987247, -3.085317, 0.2666667, 1, 0, 1,
-0.5917228, -0.06000569, -0.7131301, 0.2588235, 1, 0, 1,
-0.5901288, -1.044406, -2.496778, 0.254902, 1, 0, 1,
-0.5887335, 0.4502737, -0.9287994, 0.2470588, 1, 0, 1,
-0.588302, 1.8282, 1.642203, 0.2431373, 1, 0, 1,
-0.588131, 0.240281, 0.09438019, 0.2352941, 1, 0, 1,
-0.5871632, 0.1771756, -1.09441, 0.2313726, 1, 0, 1,
-0.5866607, -0.3024703, -1.926919, 0.2235294, 1, 0, 1,
-0.5805935, 0.9960785, -0.1230421, 0.2196078, 1, 0, 1,
-0.5752664, 0.3335716, -1.058317, 0.2117647, 1, 0, 1,
-0.575038, 1.034997, -1.112192, 0.2078431, 1, 0, 1,
-0.5733879, 0.663233, -1.006473, 0.2, 1, 0, 1,
-0.5730169, -2.181122, -3.7323, 0.1921569, 1, 0, 1,
-0.5696932, 1.160081, -1.755293, 0.1882353, 1, 0, 1,
-0.5696406, 0.2200352, -0.4180157, 0.1803922, 1, 0, 1,
-0.5648837, -0.8986726, -3.520102, 0.1764706, 1, 0, 1,
-0.5593965, -0.4284366, -2.069974, 0.1686275, 1, 0, 1,
-0.5588689, 0.3773675, -2.981531, 0.1647059, 1, 0, 1,
-0.5584245, -0.1259904, -0.6738195, 0.1568628, 1, 0, 1,
-0.5568557, 0.9800532, -0.9220737, 0.1529412, 1, 0, 1,
-0.5562239, 0.7795176, -1.529999, 0.145098, 1, 0, 1,
-0.5529105, 0.4806732, -1.003778, 0.1411765, 1, 0, 1,
-0.5509398, 1.121273, -1.138514, 0.1333333, 1, 0, 1,
-0.5504642, -0.2083543, -2.06227, 0.1294118, 1, 0, 1,
-0.5498395, 0.6557723, -0.8232644, 0.1215686, 1, 0, 1,
-0.5454946, 0.09532094, -1.982005, 0.1176471, 1, 0, 1,
-0.544557, 2.376792, -1.622514, 0.1098039, 1, 0, 1,
-0.5352901, -0.0844123, -1.289237, 0.1058824, 1, 0, 1,
-0.5346794, 0.57682, -0.9708628, 0.09803922, 1, 0, 1,
-0.5333658, 0.04376587, -0.9206676, 0.09019608, 1, 0, 1,
-0.5328533, -0.7367302, -1.591383, 0.08627451, 1, 0, 1,
-0.5324779, 0.2871617, -0.2456499, 0.07843138, 1, 0, 1,
-0.5323753, -0.4665477, -2.47638, 0.07450981, 1, 0, 1,
-0.5313594, 0.416787, -2.282815, 0.06666667, 1, 0, 1,
-0.5298029, -0.3528687, -1.484945, 0.0627451, 1, 0, 1,
-0.5254567, 0.4025629, 0.3607378, 0.05490196, 1, 0, 1,
-0.5174738, -1.901922, -4.358048, 0.05098039, 1, 0, 1,
-0.512643, 1.427984, -1.902075, 0.04313726, 1, 0, 1,
-0.5097377, -0.3986634, -2.303327, 0.03921569, 1, 0, 1,
-0.509719, 0.1518491, -1.77572, 0.03137255, 1, 0, 1,
-0.5038692, 0.003386372, -1.469166, 0.02745098, 1, 0, 1,
-0.498944, 0.05099012, -0.4924742, 0.01960784, 1, 0, 1,
-0.4778965, 0.3438998, -0.9796047, 0.01568628, 1, 0, 1,
-0.4745144, 0.8549387, -1.277539, 0.007843138, 1, 0, 1,
-0.4743712, 0.6979244, -0.6906995, 0.003921569, 1, 0, 1,
-0.4715146, 0.7994327, 0.176001, 0, 1, 0.003921569, 1,
-0.4689404, -0.0001995708, -1.085515, 0, 1, 0.01176471, 1,
-0.465172, -0.3858189, -0.8479894, 0, 1, 0.01568628, 1,
-0.4641097, -0.3770418, -1.604947, 0, 1, 0.02352941, 1,
-0.4594021, -1.364492, -2.433352, 0, 1, 0.02745098, 1,
-0.4565951, -0.5734355, -1.320648, 0, 1, 0.03529412, 1,
-0.4558721, 0.1093034, -2.569479, 0, 1, 0.03921569, 1,
-0.4557348, 0.3502941, -1.885193, 0, 1, 0.04705882, 1,
-0.4556955, 0.9925359, 0.2206076, 0, 1, 0.05098039, 1,
-0.4543919, -0.5870727, -2.480311, 0, 1, 0.05882353, 1,
-0.4540545, -0.6355807, -2.134876, 0, 1, 0.0627451, 1,
-0.45057, 2.372517, 0.1821413, 0, 1, 0.07058824, 1,
-0.4393129, -1.207162, -2.116755, 0, 1, 0.07450981, 1,
-0.439288, 2.285956, -0.68089, 0, 1, 0.08235294, 1,
-0.4389609, -0.3374942, -2.814751, 0, 1, 0.08627451, 1,
-0.4385266, 0.5255297, -1.507112, 0, 1, 0.09411765, 1,
-0.4375439, -0.7481197, -0.9662979, 0, 1, 0.1019608, 1,
-0.434592, 0.7406474, 0.6273375, 0, 1, 0.1058824, 1,
-0.4298626, 0.9704493, -0.1627661, 0, 1, 0.1137255, 1,
-0.4287845, -0.3248764, -1.282614, 0, 1, 0.1176471, 1,
-0.4275424, -1.112455, -2.447558, 0, 1, 0.1254902, 1,
-0.4272821, 0.5358507, 1.299765, 0, 1, 0.1294118, 1,
-0.4235958, 0.9328215, -0.7132789, 0, 1, 0.1372549, 1,
-0.4214715, 0.6587449, 0.89649, 0, 1, 0.1411765, 1,
-0.4116847, 0.9517006, -0.9063886, 0, 1, 0.1490196, 1,
-0.407239, -0.9586441, -1.012195, 0, 1, 0.1529412, 1,
-0.4069595, 0.9043903, -1.42977, 0, 1, 0.1607843, 1,
-0.4064577, -2.189694, -3.303809, 0, 1, 0.1647059, 1,
-0.4047343, -0.6476685, -2.305815, 0, 1, 0.172549, 1,
-0.4019113, -1.575166, -2.415734, 0, 1, 0.1764706, 1,
-0.3990802, -0.663319, -4.887375, 0, 1, 0.1843137, 1,
-0.3959375, 0.8284003, -0.9470643, 0, 1, 0.1882353, 1,
-0.3947349, -0.2714401, -2.14485, 0, 1, 0.1960784, 1,
-0.3902238, 2.111213, -0.2400955, 0, 1, 0.2039216, 1,
-0.3807669, -1.135359, -4.047819, 0, 1, 0.2078431, 1,
-0.3727858, -0.2517724, -2.047908, 0, 1, 0.2156863, 1,
-0.3692281, -1.290754, -3.798054, 0, 1, 0.2196078, 1,
-0.3648925, -0.09928827, -2.573152, 0, 1, 0.227451, 1,
-0.3636895, 0.2806688, -1.120743, 0, 1, 0.2313726, 1,
-0.3604082, 0.01850212, -1.892061, 0, 1, 0.2392157, 1,
-0.3579455, -0.4979722, -4.468681, 0, 1, 0.2431373, 1,
-0.3488341, 1.313771, -1.622938, 0, 1, 0.2509804, 1,
-0.3368155, 0.4573955, 1.080551, 0, 1, 0.254902, 1,
-0.3364972, 1.545039, -1.520563, 0, 1, 0.2627451, 1,
-0.3331301, -0.4813598, -3.514161, 0, 1, 0.2666667, 1,
-0.3323387, -0.5226024, -3.607043, 0, 1, 0.2745098, 1,
-0.3263544, -0.9966936, -3.310895, 0, 1, 0.2784314, 1,
-0.3228656, 0.939482, -0.02056212, 0, 1, 0.2862745, 1,
-0.322545, -0.8103058, -2.345326, 0, 1, 0.2901961, 1,
-0.315826, -1.070199, -2.367248, 0, 1, 0.2980392, 1,
-0.3156804, -1.050294, -3.364058, 0, 1, 0.3058824, 1,
-0.3079992, 0.7256488, 0.259997, 0, 1, 0.3098039, 1,
-0.3075409, -0.5892122, -2.653306, 0, 1, 0.3176471, 1,
-0.3039841, 1.388855, -0.04633901, 0, 1, 0.3215686, 1,
-0.3026417, -0.07259965, -2.43809, 0, 1, 0.3294118, 1,
-0.3009202, -2.008941, -2.781995, 0, 1, 0.3333333, 1,
-0.3008562, -0.2822976, -3.032282, 0, 1, 0.3411765, 1,
-0.2995973, -0.6449334, -5.119711, 0, 1, 0.345098, 1,
-0.297384, 0.3260134, -0.2959866, 0, 1, 0.3529412, 1,
-0.2924972, 1.100198, -1.132227, 0, 1, 0.3568628, 1,
-0.2918299, -0.7347724, -2.54863, 0, 1, 0.3647059, 1,
-0.2868198, -0.5576602, -3.96579, 0, 1, 0.3686275, 1,
-0.2848404, -0.7349849, -3.683338, 0, 1, 0.3764706, 1,
-0.2844298, -0.8144509, -2.328996, 0, 1, 0.3803922, 1,
-0.2834948, -0.5850602, -2.575517, 0, 1, 0.3882353, 1,
-0.2833232, -0.8049148, -1.988479, 0, 1, 0.3921569, 1,
-0.2821009, -0.07508036, -2.301773, 0, 1, 0.4, 1,
-0.2789785, 1.472139, 1.179762, 0, 1, 0.4078431, 1,
-0.2724526, 0.2520156, 1.320913, 0, 1, 0.4117647, 1,
-0.2674406, 2.527, 0.1397385, 0, 1, 0.4196078, 1,
-0.2662218, 0.8321727, 0.01805279, 0, 1, 0.4235294, 1,
-0.2652707, -0.9559636, -2.426122, 0, 1, 0.4313726, 1,
-0.2592606, 1.113266, -1.602842, 0, 1, 0.4352941, 1,
-0.2591622, -0.2399315, -2.040921, 0, 1, 0.4431373, 1,
-0.2581438, -2.44418, -3.475861, 0, 1, 0.4470588, 1,
-0.2579517, 0.6972011, -0.5544778, 0, 1, 0.454902, 1,
-0.2571297, 0.7714983, -1.220032, 0, 1, 0.4588235, 1,
-0.2545963, -0.2377782, -3.251917, 0, 1, 0.4666667, 1,
-0.2540286, -0.7401448, -3.979435, 0, 1, 0.4705882, 1,
-0.2534716, -0.02098813, -0.5193636, 0, 1, 0.4784314, 1,
-0.2518635, -0.5378889, -3.128101, 0, 1, 0.4823529, 1,
-0.250793, 0.933504, -0.2094976, 0, 1, 0.4901961, 1,
-0.244601, -0.23225, -2.728915, 0, 1, 0.4941176, 1,
-0.2421114, 0.8785377, -0.609928, 0, 1, 0.5019608, 1,
-0.241302, -0.8859011, -1.728087, 0, 1, 0.509804, 1,
-0.2411553, 0.4606321, -0.3498507, 0, 1, 0.5137255, 1,
-0.2392605, 0.6093661, -1.264823, 0, 1, 0.5215687, 1,
-0.238755, 0.5898229, 0.4663016, 0, 1, 0.5254902, 1,
-0.2352045, 0.7966544, -0.9621431, 0, 1, 0.5333334, 1,
-0.2260466, 1.321164, 0.9076536, 0, 1, 0.5372549, 1,
-0.2239485, 0.9700504, -1.815867, 0, 1, 0.5450981, 1,
-0.2215933, 0.08872226, -0.7207835, 0, 1, 0.5490196, 1,
-0.219482, -0.7988072, -2.455223, 0, 1, 0.5568628, 1,
-0.2171481, -0.9955845, -3.511229, 0, 1, 0.5607843, 1,
-0.2163356, -0.4123312, -2.806341, 0, 1, 0.5686275, 1,
-0.214805, 1.437613, 0.3786058, 0, 1, 0.572549, 1,
-0.2131131, -2.596137, -2.844, 0, 1, 0.5803922, 1,
-0.2108824, 0.9312309, -1.448389, 0, 1, 0.5843138, 1,
-0.2107327, -0.1624102, 0.7194132, 0, 1, 0.5921569, 1,
-0.2084039, 0.2446026, -2.101994, 0, 1, 0.5960785, 1,
-0.2076861, -1.423297, -1.865641, 0, 1, 0.6039216, 1,
-0.2064985, -1.837723, -1.464097, 0, 1, 0.6117647, 1,
-0.2046129, 0.1520545, -2.318321, 0, 1, 0.6156863, 1,
-0.203959, 0.3965936, -0.8435463, 0, 1, 0.6235294, 1,
-0.2030776, -0.6049529, -1.907379, 0, 1, 0.627451, 1,
-0.2023443, -0.1728743, -0.9550985, 0, 1, 0.6352941, 1,
-0.2003905, 0.7559364, -0.5485032, 0, 1, 0.6392157, 1,
-0.1999724, 0.4286281, 0.7574624, 0, 1, 0.6470588, 1,
-0.1996304, -0.5339057, -0.4955531, 0, 1, 0.6509804, 1,
-0.196307, -1.445391, -3.954902, 0, 1, 0.6588235, 1,
-0.1928374, 0.00587987, -1.286313, 0, 1, 0.6627451, 1,
-0.1917304, -1.176958, -3.791629, 0, 1, 0.6705883, 1,
-0.1881245, -0.01846412, -1.845282, 0, 1, 0.6745098, 1,
-0.186358, 0.07142583, -1.529892, 0, 1, 0.682353, 1,
-0.1858157, 0.9099307, 0.5709412, 0, 1, 0.6862745, 1,
-0.1854062, 1.782032, -0.8542251, 0, 1, 0.6941177, 1,
-0.1834966, -0.4316356, -1.629128, 0, 1, 0.7019608, 1,
-0.1831728, 0.3298291, 0.734044, 0, 1, 0.7058824, 1,
-0.1826972, -1.376791, -3.076462, 0, 1, 0.7137255, 1,
-0.1807381, -0.0795594, -1.48887, 0, 1, 0.7176471, 1,
-0.1805388, -0.5746111, -3.627715, 0, 1, 0.7254902, 1,
-0.1790203, -1.517231, -3.254855, 0, 1, 0.7294118, 1,
-0.1721918, -0.4262703, -1.929267, 0, 1, 0.7372549, 1,
-0.1664269, 0.07453689, -1.012252, 0, 1, 0.7411765, 1,
-0.1663863, 0.4476246, -0.2068596, 0, 1, 0.7490196, 1,
-0.1663118, -0.8527278, -3.416803, 0, 1, 0.7529412, 1,
-0.1630968, 0.1239464, -2.311173, 0, 1, 0.7607843, 1,
-0.1613759, 0.009517862, -1.650301, 0, 1, 0.7647059, 1,
-0.1596563, 0.2641881, -0.5416376, 0, 1, 0.772549, 1,
-0.1573109, 0.320877, -1.399012, 0, 1, 0.7764706, 1,
-0.1571328, 0.01105229, -1.909302, 0, 1, 0.7843137, 1,
-0.1531939, -0.8625008, -2.443684, 0, 1, 0.7882353, 1,
-0.1487933, -0.6492165, -2.22496, 0, 1, 0.7960784, 1,
-0.1428355, 0.8304414, 0.4130405, 0, 1, 0.8039216, 1,
-0.1407085, 0.7285973, 0.8300409, 0, 1, 0.8078431, 1,
-0.140295, -0.1769081, -2.378879, 0, 1, 0.8156863, 1,
-0.1402318, -0.3990258, -3.140351, 0, 1, 0.8196079, 1,
-0.1385306, -1.119907, -2.760231, 0, 1, 0.827451, 1,
-0.1381823, -1.606406, -2.528917, 0, 1, 0.8313726, 1,
-0.1364923, -0.2621092, -2.202092, 0, 1, 0.8392157, 1,
-0.1271995, -0.3780909, 0.0338888, 0, 1, 0.8431373, 1,
-0.1265564, -1.572759, -2.282395, 0, 1, 0.8509804, 1,
-0.1220536, 1.222482, 0.2478398, 0, 1, 0.854902, 1,
-0.1216127, -0.598832, -1.415169, 0, 1, 0.8627451, 1,
-0.1171619, 0.9239248, -1.678753, 0, 1, 0.8666667, 1,
-0.1170969, 0.01891868, -1.208243, 0, 1, 0.8745098, 1,
-0.1150654, 0.7719856, -0.1221822, 0, 1, 0.8784314, 1,
-0.1137198, -0.01648716, -0.03113366, 0, 1, 0.8862745, 1,
-0.1131699, 0.9712983, 0.5150921, 0, 1, 0.8901961, 1,
-0.1124622, 1.229271, -0.3543655, 0, 1, 0.8980392, 1,
-0.1044561, -1.335326, -2.853906, 0, 1, 0.9058824, 1,
-0.1040808, 0.008364147, -2.240618, 0, 1, 0.9098039, 1,
-0.1037669, 2.325447, 0.6362059, 0, 1, 0.9176471, 1,
-0.1034001, 0.5599188, -0.2031018, 0, 1, 0.9215686, 1,
-0.1029647, -0.6074017, -2.805057, 0, 1, 0.9294118, 1,
-0.09801247, -2.537946, -6.017051, 0, 1, 0.9333333, 1,
-0.09713957, 0.3643832, -0.5847467, 0, 1, 0.9411765, 1,
-0.09653313, -0.2108043, -4.123913, 0, 1, 0.945098, 1,
-0.09631132, -0.1570988, -2.920622, 0, 1, 0.9529412, 1,
-0.09549307, -1.446649, -3.035975, 0, 1, 0.9568627, 1,
-0.09504907, -0.9469846, -4.388696, 0, 1, 0.9647059, 1,
-0.09362213, 0.1402327, -0.8579966, 0, 1, 0.9686275, 1,
-0.08679312, 1.501787, 0.4721579, 0, 1, 0.9764706, 1,
-0.08221292, -1.274687, -3.875002, 0, 1, 0.9803922, 1,
-0.07786402, -0.9002674, -1.558558, 0, 1, 0.9882353, 1,
-0.07643103, 0.7523604, -0.2198542, 0, 1, 0.9921569, 1,
-0.07356858, 1.227609, -2.00605, 0, 1, 1, 1,
-0.07288437, 0.6751014, -0.4508699, 0, 0.9921569, 1, 1,
-0.07168362, -0.1579185, -2.686046, 0, 0.9882353, 1, 1,
-0.06851251, -1.404742, -3.066382, 0, 0.9803922, 1, 1,
-0.06686249, -0.3080671, -4.631341, 0, 0.9764706, 1, 1,
-0.06509294, -1.512108, -3.02463, 0, 0.9686275, 1, 1,
-0.05876611, -0.7285808, -1.302835, 0, 0.9647059, 1, 1,
-0.05670309, 1.857618, 1.617029, 0, 0.9568627, 1, 1,
-0.05502758, 0.327329, -0.962508, 0, 0.9529412, 1, 1,
-0.05500579, 0.4100203, 0.5475866, 0, 0.945098, 1, 1,
-0.05128866, 1.95394, -0.2366324, 0, 0.9411765, 1, 1,
-0.05060452, -0.5051458, -2.25617, 0, 0.9333333, 1, 1,
-0.0449638, -0.5364714, -3.809422, 0, 0.9294118, 1, 1,
-0.04206771, 0.6613767, 0.8807183, 0, 0.9215686, 1, 1,
-0.037678, -0.4253892, -3.079702, 0, 0.9176471, 1, 1,
-0.03604918, 1.059666, -0.9650074, 0, 0.9098039, 1, 1,
-0.03463712, -0.8552212, -3.609773, 0, 0.9058824, 1, 1,
-0.03383305, 1.438114, -1.024285, 0, 0.8980392, 1, 1,
-0.0331824, -0.8755839, -3.020715, 0, 0.8901961, 1, 1,
-0.02283079, 0.2314229, -0.008568095, 0, 0.8862745, 1, 1,
-0.01403896, 0.1067377, -0.3347539, 0, 0.8784314, 1, 1,
-0.01299816, 2.232245, -0.6638238, 0, 0.8745098, 1, 1,
-0.01293835, 2.045647, -0.4683494, 0, 0.8666667, 1, 1,
-0.01214547, 0.1341906, -0.3825852, 0, 0.8627451, 1, 1,
-0.005601732, -0.2465271, -2.291839, 0, 0.854902, 1, 1,
-0.003406182, -0.1080927, -4.014585, 0, 0.8509804, 1, 1,
-0.003160316, 0.06271499, 0.03135677, 0, 0.8431373, 1, 1,
-0.002111279, 0.931311, -0.03783534, 0, 0.8392157, 1, 1,
-0.001463495, 1.850562, -0.9552389, 0, 0.8313726, 1, 1,
-0.0009721293, 0.6804616, 0.3130397, 0, 0.827451, 1, 1,
-0.0005416282, 1.330659, -0.8690279, 0, 0.8196079, 1, 1,
0.002035778, -1.616942, 2.207973, 0, 0.8156863, 1, 1,
0.01400444, -1.509009, 2.755283, 0, 0.8078431, 1, 1,
0.02066443, -0.2164618, 1.992273, 0, 0.8039216, 1, 1,
0.02243301, -0.6517969, 4.292005, 0, 0.7960784, 1, 1,
0.02463718, -1.493459, 3.289248, 0, 0.7882353, 1, 1,
0.02657198, -0.1513448, 2.4927, 0, 0.7843137, 1, 1,
0.02900985, 1.28523, -0.2831388, 0, 0.7764706, 1, 1,
0.03016282, 1.55752, 1.228472, 0, 0.772549, 1, 1,
0.03046867, -0.6397952, 3.763471, 0, 0.7647059, 1, 1,
0.03282697, 1.232708, 0.6294844, 0, 0.7607843, 1, 1,
0.03352543, 1.466264, -0.5918253, 0, 0.7529412, 1, 1,
0.0344859, -0.6254658, 2.051143, 0, 0.7490196, 1, 1,
0.04085512, -1.769548, 0.04190455, 0, 0.7411765, 1, 1,
0.04191633, 0.04883114, 0.5964456, 0, 0.7372549, 1, 1,
0.04382607, 0.7520903, -0.8157812, 0, 0.7294118, 1, 1,
0.04424528, -0.3121144, 3.069085, 0, 0.7254902, 1, 1,
0.04714388, -0.176799, 2.768235, 0, 0.7176471, 1, 1,
0.04740615, 0.8565825, 0.8319854, 0, 0.7137255, 1, 1,
0.05097365, 1.015415, -1.256964, 0, 0.7058824, 1, 1,
0.05237461, -0.03030846, 1.07397, 0, 0.6980392, 1, 1,
0.05278026, 1.500259, -0.2543029, 0, 0.6941177, 1, 1,
0.05427618, -1.133816, 2.688956, 0, 0.6862745, 1, 1,
0.05872031, -0.3539338, 2.924859, 0, 0.682353, 1, 1,
0.06211886, -0.08777746, 3.669175, 0, 0.6745098, 1, 1,
0.06932148, 0.1437848, -0.06986892, 0, 0.6705883, 1, 1,
0.07121035, 0.3749027, -0.6021553, 0, 0.6627451, 1, 1,
0.07904012, -0.536054, 2.89803, 0, 0.6588235, 1, 1,
0.07950882, -1.175176, 3.425403, 0, 0.6509804, 1, 1,
0.08008578, -1.375812, 3.150578, 0, 0.6470588, 1, 1,
0.08752342, -1.705795, 3.980899, 0, 0.6392157, 1, 1,
0.08765855, 0.1828777, 1.019927, 0, 0.6352941, 1, 1,
0.09034391, -0.1342558, 0.3927785, 0, 0.627451, 1, 1,
0.0904053, 0.4544299, 0.5756152, 0, 0.6235294, 1, 1,
0.09558873, -0.1733965, 3.660533, 0, 0.6156863, 1, 1,
0.09574015, 0.1261624, 2.853578, 0, 0.6117647, 1, 1,
0.09739938, 0.2964174, -0.2883131, 0, 0.6039216, 1, 1,
0.0975938, 0.1329375, 0.3749485, 0, 0.5960785, 1, 1,
0.09977879, 1.550976, 1.309548, 0, 0.5921569, 1, 1,
0.100018, -0.9115661, 3.131188, 0, 0.5843138, 1, 1,
0.1020738, 0.6705096, -0.394662, 0, 0.5803922, 1, 1,
0.1034353, 1.329053, -0.2776127, 0, 0.572549, 1, 1,
0.1045995, -0.09048317, 0.09390222, 0, 0.5686275, 1, 1,
0.1070845, -0.1540218, 0.2459202, 0, 0.5607843, 1, 1,
0.1084122, 0.04085346, 0.6069889, 0, 0.5568628, 1, 1,
0.1089453, -0.6513025, 3.546383, 0, 0.5490196, 1, 1,
0.1114645, -0.5309524, 2.09096, 0, 0.5450981, 1, 1,
0.1123807, 0.09650175, 1.436405, 0, 0.5372549, 1, 1,
0.1178177, 0.8837107, -0.9807084, 0, 0.5333334, 1, 1,
0.1187804, 0.3526275, 0.7446316, 0, 0.5254902, 1, 1,
0.1215969, 0.5331101, 0.7369333, 0, 0.5215687, 1, 1,
0.123451, 1.204819, 1.082079, 0, 0.5137255, 1, 1,
0.1266483, -1.587801, 3.99798, 0, 0.509804, 1, 1,
0.1284868, -0.6308885, 1.518403, 0, 0.5019608, 1, 1,
0.1338217, -0.1077018, 2.253533, 0, 0.4941176, 1, 1,
0.136703, -0.3395542, 2.803619, 0, 0.4901961, 1, 1,
0.138476, -0.08499479, 1.274326, 0, 0.4823529, 1, 1,
0.1402292, -0.5067832, 2.007611, 0, 0.4784314, 1, 1,
0.1439898, 1.276026, -0.7402328, 0, 0.4705882, 1, 1,
0.1443134, 0.3946214, 1.876145, 0, 0.4666667, 1, 1,
0.1456103, 1.586206, -0.370217, 0, 0.4588235, 1, 1,
0.146351, -0.3035492, 3.026927, 0, 0.454902, 1, 1,
0.1573537, 0.1858748, 0.8938715, 0, 0.4470588, 1, 1,
0.1580374, 0.5594634, 0.9074916, 0, 0.4431373, 1, 1,
0.1725482, 0.7567297, -0.4365025, 0, 0.4352941, 1, 1,
0.1776822, -1.920426, 2.219593, 0, 0.4313726, 1, 1,
0.1794416, 0.2139122, 0.03839183, 0, 0.4235294, 1, 1,
0.1835113, -0.893311, 1.079822, 0, 0.4196078, 1, 1,
0.1837354, -0.477496, 2.665121, 0, 0.4117647, 1, 1,
0.1883646, -0.0208639, 1.774086, 0, 0.4078431, 1, 1,
0.1897058, 1.691024, -0.2283075, 0, 0.4, 1, 1,
0.1924284, -0.7143031, 3.382554, 0, 0.3921569, 1, 1,
0.1938557, 1.286319, -0.4423891, 0, 0.3882353, 1, 1,
0.1960999, -0.707509, 2.53462, 0, 0.3803922, 1, 1,
0.1972433, -0.1880803, 2.928274, 0, 0.3764706, 1, 1,
0.2003429, 0.4582729, -0.3227834, 0, 0.3686275, 1, 1,
0.2051829, -0.1209276, 2.609106, 0, 0.3647059, 1, 1,
0.2113054, -0.7669132, 2.778205, 0, 0.3568628, 1, 1,
0.2169793, 0.5436347, 0.5684769, 0, 0.3529412, 1, 1,
0.2187525, 0.3011351, -0.1988841, 0, 0.345098, 1, 1,
0.2189906, -1.18196, 3.055897, 0, 0.3411765, 1, 1,
0.2268154, 1.702409, -0.8091794, 0, 0.3333333, 1, 1,
0.2272646, -2.115568, 3.923226, 0, 0.3294118, 1, 1,
0.2279873, 1.083343, -0.7836102, 0, 0.3215686, 1, 1,
0.2304399, 1.983936, 0.5351099, 0, 0.3176471, 1, 1,
0.2318718, 0.3746796, 0.3941307, 0, 0.3098039, 1, 1,
0.2324126, -0.2115938, 1.276702, 0, 0.3058824, 1, 1,
0.2327087, -1.071482, 2.536924, 0, 0.2980392, 1, 1,
0.2343412, -0.1060296, 2.032461, 0, 0.2901961, 1, 1,
0.2348129, 0.005041267, 3.08441, 0, 0.2862745, 1, 1,
0.2372014, 1.537859, -1.240875, 0, 0.2784314, 1, 1,
0.238422, 0.7257302, -0.4127368, 0, 0.2745098, 1, 1,
0.2397111, 1.683378, 0.5514044, 0, 0.2666667, 1, 1,
0.2402106, 0.9375388, 2.263929, 0, 0.2627451, 1, 1,
0.2417738, -1.440076, 2.345691, 0, 0.254902, 1, 1,
0.2447231, -0.3840412, 2.29906, 0, 0.2509804, 1, 1,
0.2461484, -0.498851, 3.693606, 0, 0.2431373, 1, 1,
0.2513695, 0.5950279, -0.361915, 0, 0.2392157, 1, 1,
0.2526823, -0.2914345, 2.969434, 0, 0.2313726, 1, 1,
0.2556487, -0.2520831, 1.530324, 0, 0.227451, 1, 1,
0.2563588, -0.2519623, 3.356133, 0, 0.2196078, 1, 1,
0.2580143, 0.3832501, 0.2328261, 0, 0.2156863, 1, 1,
0.2600796, -2.512408, 4.451295, 0, 0.2078431, 1, 1,
0.2601662, -0.3225048, 3.192791, 0, 0.2039216, 1, 1,
0.2654969, -1.033897, 3.402642, 0, 0.1960784, 1, 1,
0.272727, 0.3392425, 0.1757047, 0, 0.1882353, 1, 1,
0.2741604, 0.3470145, 1.587068, 0, 0.1843137, 1, 1,
0.2748981, -0.5224162, 2.084074, 0, 0.1764706, 1, 1,
0.2778356, 0.01373921, 0.2159489, 0, 0.172549, 1, 1,
0.2785145, -0.4502409, 3.712085, 0, 0.1647059, 1, 1,
0.279451, 0.7584421, -0.9941902, 0, 0.1607843, 1, 1,
0.2879793, -1.350358, 3.229816, 0, 0.1529412, 1, 1,
0.2970034, -0.9890385, 3.721103, 0, 0.1490196, 1, 1,
0.2990113, -0.0262457, 1.642076, 0, 0.1411765, 1, 1,
0.3047707, 2.717802, -0.165308, 0, 0.1372549, 1, 1,
0.306453, -1.674506, 3.922434, 0, 0.1294118, 1, 1,
0.3070735, -0.6066397, 2.16241, 0, 0.1254902, 1, 1,
0.3096461, -0.0810117, 2.638133, 0, 0.1176471, 1, 1,
0.3100649, 1.497071, -1.56484, 0, 0.1137255, 1, 1,
0.3132988, -0.1507205, 3.839038, 0, 0.1058824, 1, 1,
0.314361, 1.333239, -1.314797, 0, 0.09803922, 1, 1,
0.3185587, -0.0295725, 2.214147, 0, 0.09411765, 1, 1,
0.3196944, 0.1173111, 1.576276, 0, 0.08627451, 1, 1,
0.3294406, 0.1555749, 2.466142, 0, 0.08235294, 1, 1,
0.3311891, -0.4451736, 1.06356, 0, 0.07450981, 1, 1,
0.333106, 2.094807, 1.001009, 0, 0.07058824, 1, 1,
0.3356186, -0.2548311, 3.241034, 0, 0.0627451, 1, 1,
0.3365481, -0.8623822, 2.56355, 0, 0.05882353, 1, 1,
0.3387752, -0.1510884, 0.5877627, 0, 0.05098039, 1, 1,
0.3401088, -0.4758492, 3.843335, 0, 0.04705882, 1, 1,
0.3408333, -0.5265559, 1.787278, 0, 0.03921569, 1, 1,
0.3411041, -0.2183053, 2.421499, 0, 0.03529412, 1, 1,
0.3418336, -0.1720411, 2.151916, 0, 0.02745098, 1, 1,
0.3420255, 1.005537, 1.929271, 0, 0.02352941, 1, 1,
0.3432075, -0.9139344, 4.360148, 0, 0.01568628, 1, 1,
0.3432811, -1.019505, 1.27474, 0, 0.01176471, 1, 1,
0.3453277, -1.212336, 2.884012, 0, 0.003921569, 1, 1,
0.3466942, -1.137388, 1.348819, 0.003921569, 0, 1, 1,
0.3508956, -0.783348, 2.767855, 0.007843138, 0, 1, 1,
0.3543657, -0.4373812, 2.091866, 0.01568628, 0, 1, 1,
0.3558655, 0.507843, 1.300992, 0.01960784, 0, 1, 1,
0.3569728, 1.47489, -0.7357588, 0.02745098, 0, 1, 1,
0.362473, 0.4657932, -0.5604885, 0.03137255, 0, 1, 1,
0.3664885, 1.634677, -1.266896, 0.03921569, 0, 1, 1,
0.3669116, -1.481969, 2.097145, 0.04313726, 0, 1, 1,
0.3779184, -0.988433, 4.060603, 0.05098039, 0, 1, 1,
0.3798382, 0.8336186, -1.15696, 0.05490196, 0, 1, 1,
0.3811718, 0.06772323, 1.970868, 0.0627451, 0, 1, 1,
0.3865904, 0.1654424, 2.173037, 0.06666667, 0, 1, 1,
0.3868046, 0.415362, 0.4549758, 0.07450981, 0, 1, 1,
0.3873309, 1.007861, -1.262201, 0.07843138, 0, 1, 1,
0.3904287, 0.5324998, 0.7998183, 0.08627451, 0, 1, 1,
0.3905309, -0.5839557, 3.927542, 0.09019608, 0, 1, 1,
0.3923216, -0.6689339, 2.760477, 0.09803922, 0, 1, 1,
0.4018815, 2.697532, 0.7874413, 0.1058824, 0, 1, 1,
0.4058696, -1.045659, 2.673475, 0.1098039, 0, 1, 1,
0.4073716, -0.4514513, -0.01086923, 0.1176471, 0, 1, 1,
0.4161561, 0.5119889, -0.44249, 0.1215686, 0, 1, 1,
0.4264455, -0.2151127, 0.228537, 0.1294118, 0, 1, 1,
0.4379575, -0.4826678, 3.754984, 0.1333333, 0, 1, 1,
0.4397152, -0.4145553, 2.121308, 0.1411765, 0, 1, 1,
0.4400975, 0.5093588, -0.2813508, 0.145098, 0, 1, 1,
0.4462968, 0.2711791, -0.205599, 0.1529412, 0, 1, 1,
0.4480971, -0.5756831, 2.103661, 0.1568628, 0, 1, 1,
0.4481907, 0.9154435, -0.5827634, 0.1647059, 0, 1, 1,
0.4503846, 1.353018, 0.553886, 0.1686275, 0, 1, 1,
0.4507221, -0.3303693, 0.4306316, 0.1764706, 0, 1, 1,
0.4507424, -0.461285, 3.677068, 0.1803922, 0, 1, 1,
0.4551522, 0.803811, 1.127446, 0.1882353, 0, 1, 1,
0.4607993, 0.36064, 2.19336, 0.1921569, 0, 1, 1,
0.4633361, 0.4305852, 0.8055209, 0.2, 0, 1, 1,
0.4639132, 2.143824, -1.045132, 0.2078431, 0, 1, 1,
0.4654714, -0.2356696, 1.168214, 0.2117647, 0, 1, 1,
0.4658917, -1.265059, 0.6613289, 0.2196078, 0, 1, 1,
0.4688233, -0.3968641, 3.339753, 0.2235294, 0, 1, 1,
0.4699045, -0.8173671, 2.761502, 0.2313726, 0, 1, 1,
0.4705191, 0.4068661, 1.353775, 0.2352941, 0, 1, 1,
0.4730999, -1.458617, 2.148057, 0.2431373, 0, 1, 1,
0.4759615, 2.514266, 0.6673952, 0.2470588, 0, 1, 1,
0.475996, 0.3153065, 0.1130685, 0.254902, 0, 1, 1,
0.4798665, 0.3575031, -0.125824, 0.2588235, 0, 1, 1,
0.485626, -0.2186589, 1.563384, 0.2666667, 0, 1, 1,
0.4928022, -0.1526911, 4.143782, 0.2705882, 0, 1, 1,
0.4987071, 0.1046781, 2.360327, 0.2784314, 0, 1, 1,
0.5095978, 0.9645013, 1.279709, 0.282353, 0, 1, 1,
0.5112934, -0.199277, 2.033695, 0.2901961, 0, 1, 1,
0.5159901, -0.2055896, 1.247089, 0.2941177, 0, 1, 1,
0.5161561, 0.5754406, 0.1983388, 0.3019608, 0, 1, 1,
0.5187038, -0.1771248, 1.584195, 0.3098039, 0, 1, 1,
0.5289545, 1.010704, -0.0397082, 0.3137255, 0, 1, 1,
0.5298389, -0.8175566, 3.482974, 0.3215686, 0, 1, 1,
0.5324697, -1.983848, 2.087695, 0.3254902, 0, 1, 1,
0.5328433, 0.4774904, 0.4104719, 0.3333333, 0, 1, 1,
0.536499, -0.01305974, 2.337662, 0.3372549, 0, 1, 1,
0.5365028, -0.6475945, 2.98889, 0.345098, 0, 1, 1,
0.5371026, -0.04117334, 1.123906, 0.3490196, 0, 1, 1,
0.5372756, 1.311215, 1.121023, 0.3568628, 0, 1, 1,
0.5449402, 0.5996994, 1.862464, 0.3607843, 0, 1, 1,
0.5488056, -0.1856886, 2.613349, 0.3686275, 0, 1, 1,
0.5503322, 0.1503636, -0.7692827, 0.372549, 0, 1, 1,
0.5520914, 0.7006051, -0.4952854, 0.3803922, 0, 1, 1,
0.5533746, -0.5151294, 1.525607, 0.3843137, 0, 1, 1,
0.554663, -0.1796772, 1.702826, 0.3921569, 0, 1, 1,
0.5553764, 1.0105, 1.505757, 0.3960784, 0, 1, 1,
0.5593867, -0.3084007, 1.69106, 0.4039216, 0, 1, 1,
0.5663609, 0.1218394, 0.736737, 0.4117647, 0, 1, 1,
0.5679759, 0.7428557, 0.661157, 0.4156863, 0, 1, 1,
0.5703162, 1.583679, 2.032363, 0.4235294, 0, 1, 1,
0.5705655, -0.3341045, 1.333728, 0.427451, 0, 1, 1,
0.5722284, 0.9090456, 0.04668311, 0.4352941, 0, 1, 1,
0.5835986, -0.3997535, 1.246658, 0.4392157, 0, 1, 1,
0.5847617, 0.07750977, 1.395965, 0.4470588, 0, 1, 1,
0.5855477, 1.685078, 0.5315415, 0.4509804, 0, 1, 1,
0.5857546, -0.7175432, 2.911726, 0.4588235, 0, 1, 1,
0.5893023, 1.526374, -0.1006889, 0.4627451, 0, 1, 1,
0.59282, 0.1699511, 0.04064541, 0.4705882, 0, 1, 1,
0.6022291, -0.4915712, 2.701496, 0.4745098, 0, 1, 1,
0.6037428, 0.06292858, 1.003965, 0.4823529, 0, 1, 1,
0.6042284, -0.1597007, 2.95327, 0.4862745, 0, 1, 1,
0.6054044, -0.4437067, 2.380959, 0.4941176, 0, 1, 1,
0.606226, -0.895906, 2.215243, 0.5019608, 0, 1, 1,
0.6118008, -0.6395161, 3.055848, 0.5058824, 0, 1, 1,
0.6124806, -0.9108332, 3.549122, 0.5137255, 0, 1, 1,
0.6129562, -0.04760676, 3.046934, 0.5176471, 0, 1, 1,
0.6197585, 0.7046631, 0.618019, 0.5254902, 0, 1, 1,
0.6217777, -0.2705376, 2.642898, 0.5294118, 0, 1, 1,
0.6244189, -0.3392121, 1.992727, 0.5372549, 0, 1, 1,
0.6295292, 0.5644606, 1.229139, 0.5411765, 0, 1, 1,
0.6361515, -1.74376, 2.937116, 0.5490196, 0, 1, 1,
0.6423188, 0.8026933, -1.794045, 0.5529412, 0, 1, 1,
0.6426483, 0.5270336, 0.6174069, 0.5607843, 0, 1, 1,
0.6456241, 2.106444, -0.1498772, 0.5647059, 0, 1, 1,
0.6479681, -1.562174, 2.817749, 0.572549, 0, 1, 1,
0.6536399, 0.5522357, -1.70374, 0.5764706, 0, 1, 1,
0.6562227, 0.2445165, 1.573339, 0.5843138, 0, 1, 1,
0.6596551, 0.5006121, -1.74101, 0.5882353, 0, 1, 1,
0.6645993, 0.4392852, 0.8434305, 0.5960785, 0, 1, 1,
0.667768, 1.383547, -0.7617071, 0.6039216, 0, 1, 1,
0.6719208, -1.838748, 0.3531893, 0.6078432, 0, 1, 1,
0.6761191, 0.5545126, 0.4140158, 0.6156863, 0, 1, 1,
0.6790071, -0.3253791, 3.878877, 0.6196079, 0, 1, 1,
0.6812636, 0.8208258, 0.0600303, 0.627451, 0, 1, 1,
0.685268, -1.78965, 3.00877, 0.6313726, 0, 1, 1,
0.6881379, 1.195845, 1.75288, 0.6392157, 0, 1, 1,
0.6881875, 0.6344159, 0.7746646, 0.6431373, 0, 1, 1,
0.6928591, -1.404582, 2.42153, 0.6509804, 0, 1, 1,
0.6930584, -0.3879402, 3.126011, 0.654902, 0, 1, 1,
0.6943803, 0.7688626, 0.2451487, 0.6627451, 0, 1, 1,
0.6994861, 0.1897982, 1.200296, 0.6666667, 0, 1, 1,
0.6998592, -0.6425352, 1.842985, 0.6745098, 0, 1, 1,
0.7076814, -0.4633345, 0.8099188, 0.6784314, 0, 1, 1,
0.7085536, -1.291273, 1.557338, 0.6862745, 0, 1, 1,
0.7167963, 2.510161, 0.9740088, 0.6901961, 0, 1, 1,
0.7197554, 0.7415928, 0.4964524, 0.6980392, 0, 1, 1,
0.7197658, 0.04708141, 1.017676, 0.7058824, 0, 1, 1,
0.7205672, -0.3456554, 1.203103, 0.7098039, 0, 1, 1,
0.7243893, -0.0839204, 1.527308, 0.7176471, 0, 1, 1,
0.7264453, 2.060301, 2.795458, 0.7215686, 0, 1, 1,
0.7305974, 1.408662, 0.1759561, 0.7294118, 0, 1, 1,
0.7359105, -1.858372, 2.853253, 0.7333333, 0, 1, 1,
0.7603391, -0.5391033, 3.688078, 0.7411765, 0, 1, 1,
0.7614661, -0.6058776, 4.240005, 0.7450981, 0, 1, 1,
0.7695948, 0.3585665, 0.9407676, 0.7529412, 0, 1, 1,
0.7727095, -0.702693, 1.45147, 0.7568628, 0, 1, 1,
0.7758887, 0.1937794, 2.726892, 0.7647059, 0, 1, 1,
0.776908, 0.7936028, 0.8054816, 0.7686275, 0, 1, 1,
0.7771276, 1.139557, -0.001914266, 0.7764706, 0, 1, 1,
0.7910908, 2.747955, -0.7465672, 0.7803922, 0, 1, 1,
0.7917248, -0.2241602, 2.706875, 0.7882353, 0, 1, 1,
0.7935727, 0.9249781, 0.1219779, 0.7921569, 0, 1, 1,
0.7955353, 0.2660398, -0.1603729, 0.8, 0, 1, 1,
0.7968862, -0.4779145, 3.550626, 0.8078431, 0, 1, 1,
0.7985062, -0.9514254, 3.329021, 0.8117647, 0, 1, 1,
0.7986106, 1.266009, 2.080327, 0.8196079, 0, 1, 1,
0.8008871, -0.9941507, 2.22558, 0.8235294, 0, 1, 1,
0.8024918, -0.989522, 0.8612383, 0.8313726, 0, 1, 1,
0.8047154, 0.8673885, -0.160008, 0.8352941, 0, 1, 1,
0.8051271, -0.6010744, 1.579527, 0.8431373, 0, 1, 1,
0.807931, -0.2242815, 1.803284, 0.8470588, 0, 1, 1,
0.8099093, 1.344562, -0.6300681, 0.854902, 0, 1, 1,
0.8128292, 0.9480543, -0.3254487, 0.8588235, 0, 1, 1,
0.8155587, 0.4297548, 1.399602, 0.8666667, 0, 1, 1,
0.8184553, 2.156874, 1.567984, 0.8705882, 0, 1, 1,
0.8241111, -0.5954741, 1.273811, 0.8784314, 0, 1, 1,
0.826254, -0.2462209, 1.932249, 0.8823529, 0, 1, 1,
0.8269442, -0.07687498, 1.208131, 0.8901961, 0, 1, 1,
0.8278555, -0.4085195, 2.626882, 0.8941177, 0, 1, 1,
0.8327687, -1.322553, 3.301148, 0.9019608, 0, 1, 1,
0.8351555, 0.1757801, 2.609433, 0.9098039, 0, 1, 1,
0.8447949, -0.7745852, 3.929468, 0.9137255, 0, 1, 1,
0.8471199, -0.6068782, 2.396906, 0.9215686, 0, 1, 1,
0.8499353, -0.4945228, 1.472692, 0.9254902, 0, 1, 1,
0.8552516, 0.5821796, 2.045599, 0.9333333, 0, 1, 1,
0.8562583, 0.6562002, 1.772552, 0.9372549, 0, 1, 1,
0.8654296, -0.2034144, 2.654742, 0.945098, 0, 1, 1,
0.8666831, -0.6527312, 2.496108, 0.9490196, 0, 1, 1,
0.8694855, -0.04902073, 2.526601, 0.9568627, 0, 1, 1,
0.8759164, -1.47316, 1.181039, 0.9607843, 0, 1, 1,
0.8788642, -1.095061, 3.041775, 0.9686275, 0, 1, 1,
0.8823951, 0.8624129, 0.6352524, 0.972549, 0, 1, 1,
0.8881485, -2.088091, 1.598008, 0.9803922, 0, 1, 1,
0.891077, 0.3105949, 1.659616, 0.9843137, 0, 1, 1,
0.892826, -1.954781, 2.477763, 0.9921569, 0, 1, 1,
0.893788, 0.2966011, 0.7869055, 0.9960784, 0, 1, 1,
0.897337, 0.9621677, -0.4095299, 1, 0, 0.9960784, 1,
0.9004909, -0.332206, 1.185439, 1, 0, 0.9882353, 1,
0.904058, 2.364002, 0.9579078, 1, 0, 0.9843137, 1,
0.9081206, -0.7020046, 0.8427724, 1, 0, 0.9764706, 1,
0.9090818, -0.08996195, 1.300584, 1, 0, 0.972549, 1,
0.9094323, 0.9742488, 1.557341, 1, 0, 0.9647059, 1,
0.9112434, -1.309949, 1.910542, 1, 0, 0.9607843, 1,
0.9119218, -0.9222963, 2.987412, 1, 0, 0.9529412, 1,
0.9203004, 0.3855779, 0.6053327, 1, 0, 0.9490196, 1,
0.9221245, 0.4216333, -0.2544274, 1, 0, 0.9411765, 1,
0.9232442, -0.2324346, 1.540702, 1, 0, 0.9372549, 1,
0.9299193, 0.706335, 0.8827158, 1, 0, 0.9294118, 1,
0.936412, 0.6145166, 1.855013, 1, 0, 0.9254902, 1,
0.937744, -1.459349, 1.310277, 1, 0, 0.9176471, 1,
0.9461977, 2.085254, 0.8548672, 1, 0, 0.9137255, 1,
0.9610462, 0.7048117, -0.1820659, 1, 0, 0.9058824, 1,
0.9662657, 0.02317083, 2.899777, 1, 0, 0.9019608, 1,
0.9822555, -1.10365, 1.582373, 1, 0, 0.8941177, 1,
0.9838467, -0.9663572, 0.6492214, 1, 0, 0.8862745, 1,
0.9849692, 0.1850727, 1.434181, 1, 0, 0.8823529, 1,
0.9858823, 1.308736, 0.2940483, 1, 0, 0.8745098, 1,
0.9881736, -1.040464, 1.813527, 1, 0, 0.8705882, 1,
0.9914465, -1.481235, 2.65552, 1, 0, 0.8627451, 1,
0.9944748, 0.6298646, 1.881987, 1, 0, 0.8588235, 1,
0.9950353, -1.15567, 1.94929, 1, 0, 0.8509804, 1,
0.9958476, 0.3918295, 0.1540646, 1, 0, 0.8470588, 1,
1.017906, -1.189714, 2.807101, 1, 0, 0.8392157, 1,
1.02748, -0.2770486, 3.604525, 1, 0, 0.8352941, 1,
1.031837, 0.09289433, 1.49289, 1, 0, 0.827451, 1,
1.034334, 0.3073721, 0.1714183, 1, 0, 0.8235294, 1,
1.037, -0.3324806, 0.7912964, 1, 0, 0.8156863, 1,
1.046677, 0.3137189, 0.6901442, 1, 0, 0.8117647, 1,
1.04851, 0.5770242, 2.539441, 1, 0, 0.8039216, 1,
1.059756, -0.7464662, 3.667914, 1, 0, 0.7960784, 1,
1.074022, -0.470642, 2.819202, 1, 0, 0.7921569, 1,
1.074022, -1.010952, 1.889109, 1, 0, 0.7843137, 1,
1.076427, 0.4801621, 0.1693221, 1, 0, 0.7803922, 1,
1.079437, -0.3705979, 2.685367, 1, 0, 0.772549, 1,
1.088508, 1.219865, -0.472776, 1, 0, 0.7686275, 1,
1.101742, -0.9043567, 2.606344, 1, 0, 0.7607843, 1,
1.110396, 0.8382203, 0.2995235, 1, 0, 0.7568628, 1,
1.121875, 0.63587, 3.20719, 1, 0, 0.7490196, 1,
1.145227, -0.6349982, 2.903349, 1, 0, 0.7450981, 1,
1.146264, -0.4641907, 1.830025, 1, 0, 0.7372549, 1,
1.149394, 0.1438628, 2.160154, 1, 0, 0.7333333, 1,
1.157691, 0.2449358, 0.4351458, 1, 0, 0.7254902, 1,
1.161866, -0.2269448, 0.4888677, 1, 0, 0.7215686, 1,
1.167482, 0.1465188, 0.4328715, 1, 0, 0.7137255, 1,
1.174487, -0.03930716, 1.764049, 1, 0, 0.7098039, 1,
1.174579, 0.30998, 0.2430636, 1, 0, 0.7019608, 1,
1.178604, 2.11282, 0.8778622, 1, 0, 0.6941177, 1,
1.192346, 1.535136, 0.8106716, 1, 0, 0.6901961, 1,
1.196417, 0.3744949, 2.170724, 1, 0, 0.682353, 1,
1.197023, -2.145927, 2.1253, 1, 0, 0.6784314, 1,
1.201527, 1.143831, 0.2824792, 1, 0, 0.6705883, 1,
1.202155, -1.314155, 4.783845, 1, 0, 0.6666667, 1,
1.209789, -0.438958, 2.523533, 1, 0, 0.6588235, 1,
1.211155, 1.234761, 2.796713, 1, 0, 0.654902, 1,
1.216677, -0.09831541, 2.161732, 1, 0, 0.6470588, 1,
1.229444, 0.04021125, 1.997995, 1, 0, 0.6431373, 1,
1.232747, 0.2478892, 2.878435, 1, 0, 0.6352941, 1,
1.23919, 1.248802, 0.2522784, 1, 0, 0.6313726, 1,
1.242721, 0.2178699, 1.208812, 1, 0, 0.6235294, 1,
1.272732, 0.1515022, 0.9144182, 1, 0, 0.6196079, 1,
1.277531, -1.632712, 2.852339, 1, 0, 0.6117647, 1,
1.279704, 0.9084035, 0.7481207, 1, 0, 0.6078432, 1,
1.28889, -0.6807278, 2.385597, 1, 0, 0.6, 1,
1.292277, 0.297697, 2.131524, 1, 0, 0.5921569, 1,
1.295448, 0.3706737, 0.4584194, 1, 0, 0.5882353, 1,
1.302137, 0.8779918, 1.499388, 1, 0, 0.5803922, 1,
1.302227, 1.88304, 1.263461, 1, 0, 0.5764706, 1,
1.311067, 0.553599, 1.45186, 1, 0, 0.5686275, 1,
1.318736, 0.08573131, 2.910577, 1, 0, 0.5647059, 1,
1.324557, -0.4852782, 2.863618, 1, 0, 0.5568628, 1,
1.325984, -0.5549749, 1.249059, 1, 0, 0.5529412, 1,
1.326572, 0.3678385, 1.824832, 1, 0, 0.5450981, 1,
1.343338, 0.6262397, 1.232744, 1, 0, 0.5411765, 1,
1.346962, 0.5014685, 0.7702345, 1, 0, 0.5333334, 1,
1.35139, 1.064024, -0.1512603, 1, 0, 0.5294118, 1,
1.354506, 0.2115529, -0.659401, 1, 0, 0.5215687, 1,
1.358016, -1.745412, 3.393048, 1, 0, 0.5176471, 1,
1.360546, -0.4811026, 0.1819995, 1, 0, 0.509804, 1,
1.373355, 0.1579678, 1.124967, 1, 0, 0.5058824, 1,
1.379325, -1.52702, 0.5037194, 1, 0, 0.4980392, 1,
1.393629, 1.095984, 1.420168, 1, 0, 0.4901961, 1,
1.400113, -0.04526016, 4.177169, 1, 0, 0.4862745, 1,
1.401535, 0.06441597, 1.26264, 1, 0, 0.4784314, 1,
1.405566, 0.2714567, 2.226205, 1, 0, 0.4745098, 1,
1.415946, -2.028941, 2.951554, 1, 0, 0.4666667, 1,
1.416783, -0.001075124, 2.431494, 1, 0, 0.4627451, 1,
1.41849, 0.6272996, 0.4584069, 1, 0, 0.454902, 1,
1.440427, 0.6314201, 0.7449794, 1, 0, 0.4509804, 1,
1.440668, 1.472882, -0.1634138, 1, 0, 0.4431373, 1,
1.440776, -0.8352811, 0.659825, 1, 0, 0.4392157, 1,
1.441222, -0.3361349, -0.488473, 1, 0, 0.4313726, 1,
1.446873, 0.4288263, 1.425717, 1, 0, 0.427451, 1,
1.450479, 0.005874228, 1.716463, 1, 0, 0.4196078, 1,
1.451228, 0.4604705, -0.02422411, 1, 0, 0.4156863, 1,
1.454203, 0.5511947, -0.3800939, 1, 0, 0.4078431, 1,
1.467224, 0.6889917, 0.8828794, 1, 0, 0.4039216, 1,
1.476993, 0.6135026, 1.334941, 1, 0, 0.3960784, 1,
1.484526, -0.3048669, 4.549149, 1, 0, 0.3882353, 1,
1.487906, -1.958836, 1.180274, 1, 0, 0.3843137, 1,
1.492092, 0.1979097, 2.026037, 1, 0, 0.3764706, 1,
1.496511, 0.5301683, 2.942088, 1, 0, 0.372549, 1,
1.511326, -0.01009091, 1.453552, 1, 0, 0.3647059, 1,
1.513954, 0.002692266, 0.4504949, 1, 0, 0.3607843, 1,
1.514355, 0.3499604, 1.584367, 1, 0, 0.3529412, 1,
1.523651, -1.126316, 2.491599, 1, 0, 0.3490196, 1,
1.5353, 0.2216283, 2.555762, 1, 0, 0.3411765, 1,
1.539176, -0.208544, 2.003129, 1, 0, 0.3372549, 1,
1.547416, 0.2621447, 1.276929, 1, 0, 0.3294118, 1,
1.548818, 0.1477093, 0.5071574, 1, 0, 0.3254902, 1,
1.552015, 2.039976, 0.3043179, 1, 0, 0.3176471, 1,
1.555307, -1.184432, 2.68305, 1, 0, 0.3137255, 1,
1.580279, -0.6083567, 1.371593, 1, 0, 0.3058824, 1,
1.594234, 0.9929553, 1.921004, 1, 0, 0.2980392, 1,
1.601505, 1.473999, 0.8616329, 1, 0, 0.2941177, 1,
1.607265, -0.1504903, 0.4931367, 1, 0, 0.2862745, 1,
1.613516, 1.234407, 0.2746564, 1, 0, 0.282353, 1,
1.615435, 1.189896, 1.237421, 1, 0, 0.2745098, 1,
1.616619, -0.9540642, 2.403218, 1, 0, 0.2705882, 1,
1.637074, 1.010396, -0.9649041, 1, 0, 0.2627451, 1,
1.63737, 0.3923838, 2.96449, 1, 0, 0.2588235, 1,
1.651487, 2.089973, 1.923237, 1, 0, 0.2509804, 1,
1.652358, -0.7294549, 1.342389, 1, 0, 0.2470588, 1,
1.652439, 0.1954975, 1.230827, 1, 0, 0.2392157, 1,
1.687134, -0.4837648, 3.104623, 1, 0, 0.2352941, 1,
1.693969, 0.01805141, 0.3738848, 1, 0, 0.227451, 1,
1.71456, 0.2657834, 1.452251, 1, 0, 0.2235294, 1,
1.740804, -0.8294991, 3.542212, 1, 0, 0.2156863, 1,
1.741143, -0.1181839, 1.302048, 1, 0, 0.2117647, 1,
1.743785, -2.154912, 1.610743, 1, 0, 0.2039216, 1,
1.774001, 2.699903, 0.9968855, 1, 0, 0.1960784, 1,
1.775496, 1.891832, 0.05006849, 1, 0, 0.1921569, 1,
1.783267, 0.5685997, 0.9198108, 1, 0, 0.1843137, 1,
1.802781, 0.6515245, 0.3025812, 1, 0, 0.1803922, 1,
1.820266, -1.052601, 2.039953, 1, 0, 0.172549, 1,
1.820298, 0.3661422, 0.942496, 1, 0, 0.1686275, 1,
1.825194, -0.3324368, 0.9944004, 1, 0, 0.1607843, 1,
1.834707, 1.505281, 0.4319856, 1, 0, 0.1568628, 1,
1.901773, 0.5487443, 0.7563328, 1, 0, 0.1490196, 1,
1.903041, 0.1959619, 2.351152, 1, 0, 0.145098, 1,
1.971164, -0.2246981, -0.1399756, 1, 0, 0.1372549, 1,
1.986944, 0.709586, -0.5066853, 1, 0, 0.1333333, 1,
2.001585, 1.664586, 0.1915459, 1, 0, 0.1254902, 1,
2.015121, 0.2763475, 2.00382, 1, 0, 0.1215686, 1,
2.023038, 0.8425865, 0.132094, 1, 0, 0.1137255, 1,
2.051733, 0.3723166, 1.30274, 1, 0, 0.1098039, 1,
2.137684, -1.188193, 3.44395, 1, 0, 0.1019608, 1,
2.141969, 0.6002418, 3.154206, 1, 0, 0.09411765, 1,
2.143198, -0.4537303, 2.38809, 1, 0, 0.09019608, 1,
2.146219, 0.1027316, 0.8761835, 1, 0, 0.08235294, 1,
2.176997, 0.08193598, 1.278114, 1, 0, 0.07843138, 1,
2.246572, 0.7492909, 1.591052, 1, 0, 0.07058824, 1,
2.267723, 0.06058513, 0.08768278, 1, 0, 0.06666667, 1,
2.383621, 0.8484137, 1.099899, 1, 0, 0.05882353, 1,
2.403712, 0.4455487, 0.9707493, 1, 0, 0.05490196, 1,
2.465935, 0.9707409, -0.3950446, 1, 0, 0.04705882, 1,
2.631754, -1.868011, 1.180295, 1, 0, 0.04313726, 1,
2.659867, -2.172789, 2.190657, 1, 0, 0.03529412, 1,
2.668864, -1.875885, 2.407844, 1, 0, 0.03137255, 1,
2.829892, 0.2501436, 1.078949, 1, 0, 0.02352941, 1,
3.204987, 0.8199379, 0.8643483, 1, 0, 0.01960784, 1,
3.2159, -1.006901, 0.8004816, 1, 0, 0.01176471, 1,
3.750184, 0.9279906, 0.7347638, 1, 0, 0.007843138, 1
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
0.422794, -3.509836, -7.847803, 0, -0.5, 0.5, 0.5,
0.422794, -3.509836, -7.847803, 1, -0.5, 0.5, 0.5,
0.422794, -3.509836, -7.847803, 1, 1.5, 0.5, 0.5,
0.422794, -3.509836, -7.847803, 0, 1.5, 0.5, 0.5
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
-4.032581, 0.07254207, -7.847803, 0, -0.5, 0.5, 0.5,
-4.032581, 0.07254207, -7.847803, 1, -0.5, 0.5, 0.5,
-4.032581, 0.07254207, -7.847803, 1, 1.5, 0.5, 0.5,
-4.032581, 0.07254207, -7.847803, 0, 1.5, 0.5, 0.5
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
-4.032581, -3.509836, -0.6166031, 0, -0.5, 0.5, 0.5,
-4.032581, -3.509836, -0.6166031, 1, -0.5, 0.5, 0.5,
-4.032581, -3.509836, -0.6166031, 1, 1.5, 0.5, 0.5,
-4.032581, -3.509836, -0.6166031, 0, 1.5, 0.5, 0.5
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
-2, -2.683133, -6.179065,
3, -2.683133, -6.179065,
-2, -2.683133, -6.179065,
-2, -2.820917, -6.457188,
-1, -2.683133, -6.179065,
-1, -2.820917, -6.457188,
0, -2.683133, -6.179065,
0, -2.820917, -6.457188,
1, -2.683133, -6.179065,
1, -2.820917, -6.457188,
2, -2.683133, -6.179065,
2, -2.820917, -6.457188,
3, -2.683133, -6.179065,
3, -2.820917, -6.457188
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
-2, -3.096485, -7.013434, 0, -0.5, 0.5, 0.5,
-2, -3.096485, -7.013434, 1, -0.5, 0.5, 0.5,
-2, -3.096485, -7.013434, 1, 1.5, 0.5, 0.5,
-2, -3.096485, -7.013434, 0, 1.5, 0.5, 0.5,
-1, -3.096485, -7.013434, 0, -0.5, 0.5, 0.5,
-1, -3.096485, -7.013434, 1, -0.5, 0.5, 0.5,
-1, -3.096485, -7.013434, 1, 1.5, 0.5, 0.5,
-1, -3.096485, -7.013434, 0, 1.5, 0.5, 0.5,
0, -3.096485, -7.013434, 0, -0.5, 0.5, 0.5,
0, -3.096485, -7.013434, 1, -0.5, 0.5, 0.5,
0, -3.096485, -7.013434, 1, 1.5, 0.5, 0.5,
0, -3.096485, -7.013434, 0, 1.5, 0.5, 0.5,
1, -3.096485, -7.013434, 0, -0.5, 0.5, 0.5,
1, -3.096485, -7.013434, 1, -0.5, 0.5, 0.5,
1, -3.096485, -7.013434, 1, 1.5, 0.5, 0.5,
1, -3.096485, -7.013434, 0, 1.5, 0.5, 0.5,
2, -3.096485, -7.013434, 0, -0.5, 0.5, 0.5,
2, -3.096485, -7.013434, 1, -0.5, 0.5, 0.5,
2, -3.096485, -7.013434, 1, 1.5, 0.5, 0.5,
2, -3.096485, -7.013434, 0, 1.5, 0.5, 0.5,
3, -3.096485, -7.013434, 0, -0.5, 0.5, 0.5,
3, -3.096485, -7.013434, 1, -0.5, 0.5, 0.5,
3, -3.096485, -7.013434, 1, 1.5, 0.5, 0.5,
3, -3.096485, -7.013434, 0, 1.5, 0.5, 0.5
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
-3.004418, -2, -6.179065,
-3.004418, 2, -6.179065,
-3.004418, -2, -6.179065,
-3.175778, -2, -6.457188,
-3.004418, -1, -6.179065,
-3.175778, -1, -6.457188,
-3.004418, 0, -6.179065,
-3.175778, 0, -6.457188,
-3.004418, 1, -6.179065,
-3.175778, 1, -6.457188,
-3.004418, 2, -6.179065,
-3.175778, 2, -6.457188
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
-3.5185, -2, -7.013434, 0, -0.5, 0.5, 0.5,
-3.5185, -2, -7.013434, 1, -0.5, 0.5, 0.5,
-3.5185, -2, -7.013434, 1, 1.5, 0.5, 0.5,
-3.5185, -2, -7.013434, 0, 1.5, 0.5, 0.5,
-3.5185, -1, -7.013434, 0, -0.5, 0.5, 0.5,
-3.5185, -1, -7.013434, 1, -0.5, 0.5, 0.5,
-3.5185, -1, -7.013434, 1, 1.5, 0.5, 0.5,
-3.5185, -1, -7.013434, 0, 1.5, 0.5, 0.5,
-3.5185, 0, -7.013434, 0, -0.5, 0.5, 0.5,
-3.5185, 0, -7.013434, 1, -0.5, 0.5, 0.5,
-3.5185, 0, -7.013434, 1, 1.5, 0.5, 0.5,
-3.5185, 0, -7.013434, 0, 1.5, 0.5, 0.5,
-3.5185, 1, -7.013434, 0, -0.5, 0.5, 0.5,
-3.5185, 1, -7.013434, 1, -0.5, 0.5, 0.5,
-3.5185, 1, -7.013434, 1, 1.5, 0.5, 0.5,
-3.5185, 1, -7.013434, 0, 1.5, 0.5, 0.5,
-3.5185, 2, -7.013434, 0, -0.5, 0.5, 0.5,
-3.5185, 2, -7.013434, 1, -0.5, 0.5, 0.5,
-3.5185, 2, -7.013434, 1, 1.5, 0.5, 0.5,
-3.5185, 2, -7.013434, 0, 1.5, 0.5, 0.5
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
-3.004418, -2.683133, -6,
-3.004418, -2.683133, 4,
-3.004418, -2.683133, -6,
-3.175778, -2.820917, -6,
-3.004418, -2.683133, -4,
-3.175778, -2.820917, -4,
-3.004418, -2.683133, -2,
-3.175778, -2.820917, -2,
-3.004418, -2.683133, 0,
-3.175778, -2.820917, 0,
-3.004418, -2.683133, 2,
-3.175778, -2.820917, 2,
-3.004418, -2.683133, 4,
-3.175778, -2.820917, 4
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
-3.5185, -3.096485, -6, 0, -0.5, 0.5, 0.5,
-3.5185, -3.096485, -6, 1, -0.5, 0.5, 0.5,
-3.5185, -3.096485, -6, 1, 1.5, 0.5, 0.5,
-3.5185, -3.096485, -6, 0, 1.5, 0.5, 0.5,
-3.5185, -3.096485, -4, 0, -0.5, 0.5, 0.5,
-3.5185, -3.096485, -4, 1, -0.5, 0.5, 0.5,
-3.5185, -3.096485, -4, 1, 1.5, 0.5, 0.5,
-3.5185, -3.096485, -4, 0, 1.5, 0.5, 0.5,
-3.5185, -3.096485, -2, 0, -0.5, 0.5, 0.5,
-3.5185, -3.096485, -2, 1, -0.5, 0.5, 0.5,
-3.5185, -3.096485, -2, 1, 1.5, 0.5, 0.5,
-3.5185, -3.096485, -2, 0, 1.5, 0.5, 0.5,
-3.5185, -3.096485, 0, 0, -0.5, 0.5, 0.5,
-3.5185, -3.096485, 0, 1, -0.5, 0.5, 0.5,
-3.5185, -3.096485, 0, 1, 1.5, 0.5, 0.5,
-3.5185, -3.096485, 0, 0, 1.5, 0.5, 0.5,
-3.5185, -3.096485, 2, 0, -0.5, 0.5, 0.5,
-3.5185, -3.096485, 2, 1, -0.5, 0.5, 0.5,
-3.5185, -3.096485, 2, 1, 1.5, 0.5, 0.5,
-3.5185, -3.096485, 2, 0, 1.5, 0.5, 0.5,
-3.5185, -3.096485, 4, 0, -0.5, 0.5, 0.5,
-3.5185, -3.096485, 4, 1, -0.5, 0.5, 0.5,
-3.5185, -3.096485, 4, 1, 1.5, 0.5, 0.5,
-3.5185, -3.096485, 4, 0, 1.5, 0.5, 0.5
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
-3.004418, -2.683133, -6.179065,
-3.004418, 2.828218, -6.179065,
-3.004418, -2.683133, 4.945858,
-3.004418, 2.828218, 4.945858,
-3.004418, -2.683133, -6.179065,
-3.004418, -2.683133, 4.945858,
-3.004418, 2.828218, -6.179065,
-3.004418, 2.828218, 4.945858,
-3.004418, -2.683133, -6.179065,
3.850006, -2.683133, -6.179065,
-3.004418, -2.683133, 4.945858,
3.850006, -2.683133, 4.945858,
-3.004418, 2.828218, -6.179065,
3.850006, 2.828218, -6.179065,
-3.004418, 2.828218, 4.945858,
3.850006, 2.828218, 4.945858,
3.850006, -2.683133, -6.179065,
3.850006, 2.828218, -6.179065,
3.850006, -2.683133, 4.945858,
3.850006, 2.828218, 4.945858,
3.850006, -2.683133, -6.179065,
3.850006, -2.683133, 4.945858,
3.850006, 2.828218, -6.179065,
3.850006, 2.828218, 4.945858
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
var radius = 7.572779;
var distance = 33.69215;
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
mvMatrix.translate( -0.422794, -0.07254207, 0.6166031 );
mvMatrix.scale( 1.194533, 1.485632, 0.7359905 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.69215);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
cafenstrole<-read.table("cafenstrole.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cafenstrole$V2
```

```
## Error in eval(expr, envir, enclos): object 'cafenstrole' not found
```

```r
y<-cafenstrole$V3
```

```
## Error in eval(expr, envir, enclos): object 'cafenstrole' not found
```

```r
z<-cafenstrole$V4
```

```
## Error in eval(expr, envir, enclos): object 'cafenstrole' not found
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
-2.904596, 2.042635, -2.180157, 0, 0, 1, 1, 1,
-2.731345, 0.7831141, -2.666246, 1, 0, 0, 1, 1,
-2.666387, 0.6229579, -0.8711609, 1, 0, 0, 1, 1,
-2.594914, -0.1903467, -1.656076, 1, 0, 0, 1, 1,
-2.470697, 0.06379416, -0.752605, 1, 0, 0, 1, 1,
-2.461605, 0.8235252, -0.8708047, 1, 0, 0, 1, 1,
-2.459745, 1.070762, -0.09530172, 0, 0, 0, 1, 1,
-2.38938, 1.875089, -2.024388, 0, 0, 0, 1, 1,
-2.371281, 1.261444, 0.6967413, 0, 0, 0, 1, 1,
-2.365973, -0.1363629, -0.5497321, 0, 0, 0, 1, 1,
-2.36023, 0.1973246, -1.309765, 0, 0, 0, 1, 1,
-2.338183, -0.05842693, -2.456175, 0, 0, 0, 1, 1,
-2.321137, 1.042578, -0.397072, 0, 0, 0, 1, 1,
-2.301269, 0.9620743, 1.479717, 1, 1, 1, 1, 1,
-2.260952, 0.8070228, -1.414066, 1, 1, 1, 1, 1,
-2.200896, 1.856724, 1.231732, 1, 1, 1, 1, 1,
-2.190137, -0.8706778, -2.841852, 1, 1, 1, 1, 1,
-2.167594, 1.078536, 0.7453848, 1, 1, 1, 1, 1,
-2.15742, -1.541742, -0.9379455, 1, 1, 1, 1, 1,
-2.146016, -1.073743, -3.165949, 1, 1, 1, 1, 1,
-2.115022, 0.2092943, -2.744507, 1, 1, 1, 1, 1,
-2.08297, 0.727495, -2.041252, 1, 1, 1, 1, 1,
-2.062212, 0.02521235, -0.2079294, 1, 1, 1, 1, 1,
-2.052237, -0.07068764, -0.9329472, 1, 1, 1, 1, 1,
-2.02411, 0.4546493, -1.018335, 1, 1, 1, 1, 1,
-1.996903, 0.6946559, -2.581467, 1, 1, 1, 1, 1,
-1.995232, 1.167523, -2.156502, 1, 1, 1, 1, 1,
-1.990959, -0.5713086, -1.557627, 1, 1, 1, 1, 1,
-1.984854, 0.283956, -1.952799, 0, 0, 1, 1, 1,
-1.955719, 1.766288, 1.381769, 1, 0, 0, 1, 1,
-1.926048, 1.321681, -0.3878644, 1, 0, 0, 1, 1,
-1.92051, 0.2291389, -0.9270777, 1, 0, 0, 1, 1,
-1.900079, 0.743872, -1.055007, 1, 0, 0, 1, 1,
-1.887167, -0.5978022, -2.620608, 1, 0, 0, 1, 1,
-1.875242, -0.5631614, -1.495739, 0, 0, 0, 1, 1,
-1.861177, -0.2263183, -1.914258, 0, 0, 0, 1, 1,
-1.853605, -1.994531, -0.3924709, 0, 0, 0, 1, 1,
-1.843238, 0.01414615, -1.311533, 0, 0, 0, 1, 1,
-1.842152, 2.074774, -0.686587, 0, 0, 0, 1, 1,
-1.815523, -0.1231097, -1.802167, 0, 0, 0, 1, 1,
-1.807104, 0.4008525, -1.496628, 0, 0, 0, 1, 1,
-1.793405, -0.5999567, -1.37672, 1, 1, 1, 1, 1,
-1.746411, -0.5805565, -0.9517787, 1, 1, 1, 1, 1,
-1.743396, 1.263317, -0.7472153, 1, 1, 1, 1, 1,
-1.743173, -0.4822007, -3.877562, 1, 1, 1, 1, 1,
-1.742158, -0.9553133, -2.637033, 1, 1, 1, 1, 1,
-1.723471, 2.251157, 0.1089902, 1, 1, 1, 1, 1,
-1.721416, -1.294256, -2.601568, 1, 1, 1, 1, 1,
-1.684145, 0.8155913, -0.8248405, 1, 1, 1, 1, 1,
-1.684122, -0.7441041, -2.130268, 1, 1, 1, 1, 1,
-1.680255, -2.11378, -2.087483, 1, 1, 1, 1, 1,
-1.672333, 1.343731, -0.3599125, 1, 1, 1, 1, 1,
-1.652258, -0.6008999, 0.3514836, 1, 1, 1, 1, 1,
-1.638086, -0.6000711, -1.60998, 1, 1, 1, 1, 1,
-1.620984, 0.5628469, -0.7379664, 1, 1, 1, 1, 1,
-1.610974, 0.8377733, -0.8993074, 1, 1, 1, 1, 1,
-1.605382, -0.1610558, -2.081415, 0, 0, 1, 1, 1,
-1.591415, -1.075682, -0.7976364, 1, 0, 0, 1, 1,
-1.587891, 1.170045, 0.0327125, 1, 0, 0, 1, 1,
-1.587175, 0.4754968, 0.129163, 1, 0, 0, 1, 1,
-1.584856, 0.2288864, -1.246515, 1, 0, 0, 1, 1,
-1.584737, 0.5950741, -0.4501075, 1, 0, 0, 1, 1,
-1.572821, -0.1035707, -0.03837965, 0, 0, 0, 1, 1,
-1.567496, -0.6459882, -0.773571, 0, 0, 0, 1, 1,
-1.547274, 0.04019371, -2.372815, 0, 0, 0, 1, 1,
-1.545807, 1.828142, 0.7129183, 0, 0, 0, 1, 1,
-1.542476, 0.4766404, -0.8766349, 0, 0, 0, 1, 1,
-1.541825, -1.467732, -1.804787, 0, 0, 0, 1, 1,
-1.540695, -0.1547338, -2.833444, 0, 0, 0, 1, 1,
-1.521482, 0.3829207, -2.084115, 1, 1, 1, 1, 1,
-1.519031, -1.282287, -2.636296, 1, 1, 1, 1, 1,
-1.507249, 0.8851544, 0.09848402, 1, 1, 1, 1, 1,
-1.49842, 0.6132329, -1.495807, 1, 1, 1, 1, 1,
-1.483487, 2.030785, -1.175571, 1, 1, 1, 1, 1,
-1.47986, 0.3997407, -1.594404, 1, 1, 1, 1, 1,
-1.478467, 1.847785, -0.5405409, 1, 1, 1, 1, 1,
-1.473548, -0.4785507, -1.706246, 1, 1, 1, 1, 1,
-1.467578, -0.06910622, -3.53425, 1, 1, 1, 1, 1,
-1.466193, 1.101132, -2.064216, 1, 1, 1, 1, 1,
-1.465216, -0.9913055, -2.575634, 1, 1, 1, 1, 1,
-1.46233, -0.6346391, -2.495892, 1, 1, 1, 1, 1,
-1.458128, -0.2739615, -1.044289, 1, 1, 1, 1, 1,
-1.443242, -1.529955, -2.218669, 1, 1, 1, 1, 1,
-1.441982, 1.548995, 0.07446074, 1, 1, 1, 1, 1,
-1.441676, 0.9276054, -1.71407, 0, 0, 1, 1, 1,
-1.440528, -1.875981, -2.766613, 1, 0, 0, 1, 1,
-1.436292, 0.196643, -0.7980066, 1, 0, 0, 1, 1,
-1.43083, 0.2976284, -1.431865, 1, 0, 0, 1, 1,
-1.427329, 1.147351, -0.893777, 1, 0, 0, 1, 1,
-1.420201, -0.6623794, -3.528792, 1, 0, 0, 1, 1,
-1.412748, 1.07828, -0.03482423, 0, 0, 0, 1, 1,
-1.409574, -0.7074601, -2.704963, 0, 0, 0, 1, 1,
-1.398002, -2.525842, -2.722846, 0, 0, 0, 1, 1,
-1.397711, 0.3744218, -0.1074548, 0, 0, 0, 1, 1,
-1.397106, 0.06184336, -1.60716, 0, 0, 0, 1, 1,
-1.396909, 0.2102417, 0.3125724, 0, 0, 0, 1, 1,
-1.394751, -1.035963, -1.731118, 0, 0, 0, 1, 1,
-1.392159, 0.0144466, -2.280565, 1, 1, 1, 1, 1,
-1.389457, 0.9303992, 0.3542805, 1, 1, 1, 1, 1,
-1.379272, 0.5843462, -0.6555223, 1, 1, 1, 1, 1,
-1.376768, 0.6520725, -0.7760975, 1, 1, 1, 1, 1,
-1.368859, 0.1442409, -0.3284252, 1, 1, 1, 1, 1,
-1.366201, -0.2302967, -3.594895, 1, 1, 1, 1, 1,
-1.365197, 0.6346059, -1.919577, 1, 1, 1, 1, 1,
-1.354799, -0.1522175, -1.468773, 1, 1, 1, 1, 1,
-1.349025, -1.002693, -1.781922, 1, 1, 1, 1, 1,
-1.346344, -0.03042629, -1.443575, 1, 1, 1, 1, 1,
-1.33853, -1.301817, -1.694586, 1, 1, 1, 1, 1,
-1.337962, -0.2554218, -2.522286, 1, 1, 1, 1, 1,
-1.334553, -1.073133, -1.23769, 1, 1, 1, 1, 1,
-1.328351, 0.132185, 0.2305972, 1, 1, 1, 1, 1,
-1.318038, 0.5983054, 0.2988662, 1, 1, 1, 1, 1,
-1.317813, 0.7622326, -1.130426, 0, 0, 1, 1, 1,
-1.310295, 0.9153097, -0.5470462, 1, 0, 0, 1, 1,
-1.303872, -1.000544, -2.268519, 1, 0, 0, 1, 1,
-1.299517, -1.451468, -2.968176, 1, 0, 0, 1, 1,
-1.294138, 1.883212, -1.212202, 1, 0, 0, 1, 1,
-1.287869, 0.4481654, 0.1747954, 1, 0, 0, 1, 1,
-1.287612, 0.4338749, -0.7910403, 0, 0, 0, 1, 1,
-1.275048, -0.1642581, -2.381671, 0, 0, 0, 1, 1,
-1.264891, -1.161378, -1.967893, 0, 0, 0, 1, 1,
-1.260468, -0.1744828, -0.8026118, 0, 0, 0, 1, 1,
-1.254895, 0.07321692, -1.144386, 0, 0, 0, 1, 1,
-1.253919, 0.7713919, -0.6029105, 0, 0, 0, 1, 1,
-1.248816, 0.49354, -1.677989, 0, 0, 0, 1, 1,
-1.243208, 0.4629972, 0.1837575, 1, 1, 1, 1, 1,
-1.228058, -0.07417495, -1.63184, 1, 1, 1, 1, 1,
-1.227002, 0.9176919, -1.3552, 1, 1, 1, 1, 1,
-1.215806, 0.3282294, -2.233721, 1, 1, 1, 1, 1,
-1.205294, 0.1224926, -1.057704, 1, 1, 1, 1, 1,
-1.203152, 0.5866, -0.5204139, 1, 1, 1, 1, 1,
-1.198688, -0.07986569, -1.840124, 1, 1, 1, 1, 1,
-1.198595, -0.7490339, -2.330102, 1, 1, 1, 1, 1,
-1.198079, 0.8192782, -2.025684, 1, 1, 1, 1, 1,
-1.193543, 0.2525781, -1.992926, 1, 1, 1, 1, 1,
-1.186323, 0.8723046, -1.13422, 1, 1, 1, 1, 1,
-1.180883, -1.375585, -1.644376, 1, 1, 1, 1, 1,
-1.176798, -1.232831, -1.40779, 1, 1, 1, 1, 1,
-1.173916, -0.1658476, -0.7247431, 1, 1, 1, 1, 1,
-1.170784, 1.121033, 0.1409031, 1, 1, 1, 1, 1,
-1.160716, 0.3245266, -0.01373409, 0, 0, 1, 1, 1,
-1.153971, -0.7584838, -2.074082, 1, 0, 0, 1, 1,
-1.147846, -0.5112469, -3.387867, 1, 0, 0, 1, 1,
-1.147321, 0.3803128, -0.2259188, 1, 0, 0, 1, 1,
-1.146141, 0.05614827, -2.946062, 1, 0, 0, 1, 1,
-1.142015, -0.8013675, -3.268772, 1, 0, 0, 1, 1,
-1.14171, -1.1369, -1.568565, 0, 0, 0, 1, 1,
-1.131155, -1.502743, -2.559373, 0, 0, 0, 1, 1,
-1.12997, -0.5016176, -3.831216, 0, 0, 0, 1, 1,
-1.128748, 0.4784356, 0.583083, 0, 0, 0, 1, 1,
-1.126854, 0.3626927, -0.8744955, 0, 0, 0, 1, 1,
-1.124343, -0.2099193, -0.5340444, 0, 0, 0, 1, 1,
-1.122598, 2.176684, -2.359318, 0, 0, 0, 1, 1,
-1.10918, 0.8918658, -1.489109, 1, 1, 1, 1, 1,
-1.101025, -0.7682186, -3.420899, 1, 1, 1, 1, 1,
-1.099619, -0.2151486, -2.242441, 1, 1, 1, 1, 1,
-1.099231, -0.4655462, -2.604115, 1, 1, 1, 1, 1,
-1.098489, -0.2160845, -1.835531, 1, 1, 1, 1, 1,
-1.094069, 1.204225, -2.991563, 1, 1, 1, 1, 1,
-1.086507, 0.6001655, -2.351016, 1, 1, 1, 1, 1,
-1.085285, 0.5195912, -2.820098, 1, 1, 1, 1, 1,
-1.084121, 1.224995, -1.381229, 1, 1, 1, 1, 1,
-1.079179, 0.3810663, -0.3410932, 1, 1, 1, 1, 1,
-1.071854, 0.0114279, -0.1963126, 1, 1, 1, 1, 1,
-1.0698, -1.116806, -0.8051572, 1, 1, 1, 1, 1,
-1.067704, -0.5592416, -2.480175, 1, 1, 1, 1, 1,
-1.067146, -0.1134781, -2.097561, 1, 1, 1, 1, 1,
-1.062935, 0.2282671, -2.721699, 1, 1, 1, 1, 1,
-1.059948, 0.8951659, -0.130087, 0, 0, 1, 1, 1,
-1.057686, -0.732548, -3.201415, 1, 0, 0, 1, 1,
-1.048972, -0.3622543, -2.40045, 1, 0, 0, 1, 1,
-1.047484, -0.1697946, -2.114167, 1, 0, 0, 1, 1,
-1.039627, 1.704901, 1.029482, 1, 0, 0, 1, 1,
-1.037929, 0.3379018, -1.033863, 1, 0, 0, 1, 1,
-1.032667, -0.8563389, -1.519927, 0, 0, 0, 1, 1,
-1.031289, 2.382406, -1.999421, 0, 0, 0, 1, 1,
-1.029716, -0.04014257, -1.272214, 0, 0, 0, 1, 1,
-1.027622, 0.5328721, -0.2621256, 0, 0, 0, 1, 1,
-1.011438, 1.54946, -0.6051691, 0, 0, 0, 1, 1,
-1.011261, -1.536497, -2.686733, 0, 0, 0, 1, 1,
-1.004086, 0.4374181, -1.727461, 0, 0, 0, 1, 1,
-0.9981277, -0.5502967, -2.432271, 1, 1, 1, 1, 1,
-0.9939935, -0.6438179, -2.49908, 1, 1, 1, 1, 1,
-0.9846669, 0.5487319, -1.259201, 1, 1, 1, 1, 1,
-0.9756255, 1.049167, -0.9220445, 1, 1, 1, 1, 1,
-0.9750783, 1.203375, -2.574572, 1, 1, 1, 1, 1,
-0.9737704, 1.365491, -2.407977, 1, 1, 1, 1, 1,
-0.9709442, -1.570629, -2.198873, 1, 1, 1, 1, 1,
-0.9651955, -0.5670781, -2.253324, 1, 1, 1, 1, 1,
-0.9650688, -0.8158485, -1.743462, 1, 1, 1, 1, 1,
-0.9582608, 0.1522078, -1.42115, 1, 1, 1, 1, 1,
-0.9507385, -1.589005, -1.676143, 1, 1, 1, 1, 1,
-0.944735, 0.5194703, -0.8069462, 1, 1, 1, 1, 1,
-0.9422162, 0.2020117, -3.472602, 1, 1, 1, 1, 1,
-0.9345505, -0.8644168, -2.545557, 1, 1, 1, 1, 1,
-0.9344654, 0.1417461, -2.701718, 1, 1, 1, 1, 1,
-0.9217604, -1.439338, -2.382129, 0, 0, 1, 1, 1,
-0.91574, 0.3251035, -1.208765, 1, 0, 0, 1, 1,
-0.8931901, -0.343926, -2.066565, 1, 0, 0, 1, 1,
-0.8906169, -1.069224, -3.106891, 1, 0, 0, 1, 1,
-0.8862439, -1.034591, -2.873509, 1, 0, 0, 1, 1,
-0.8770633, 0.2320819, -0.4292031, 1, 0, 0, 1, 1,
-0.8762094, -0.5832052, -3.352569, 0, 0, 0, 1, 1,
-0.8754342, -1.875437, -2.079577, 0, 0, 0, 1, 1,
-0.8731623, -0.9011626, -0.8403189, 0, 0, 0, 1, 1,
-0.871197, -0.9493008, -2.767849, 0, 0, 0, 1, 1,
-0.8695077, -1.830601, -2.458066, 0, 0, 0, 1, 1,
-0.86766, -0.2953257, -1.87932, 0, 0, 0, 1, 1,
-0.864679, -0.1026729, -0.6159631, 0, 0, 0, 1, 1,
-0.8604249, -0.7101216, -1.433578, 1, 1, 1, 1, 1,
-0.8595523, 0.1445544, -1.911757, 1, 1, 1, 1, 1,
-0.8491743, -1.099239, -0.4644831, 1, 1, 1, 1, 1,
-0.8445617, -0.05716578, 0.1362034, 1, 1, 1, 1, 1,
-0.8432068, 0.1615823, -1.268352, 1, 1, 1, 1, 1,
-0.8391356, 0.4080287, -1.410059, 1, 1, 1, 1, 1,
-0.8324527, 0.3242488, -0.8609381, 1, 1, 1, 1, 1,
-0.8294003, 0.8165836, -0.2627541, 1, 1, 1, 1, 1,
-0.823685, 0.9898499, -2.372947, 1, 1, 1, 1, 1,
-0.8235951, -0.4193432, -2.660778, 1, 1, 1, 1, 1,
-0.8233215, 0.8302323, 0.6193451, 1, 1, 1, 1, 1,
-0.8202975, 0.5425843, -1.71351, 1, 1, 1, 1, 1,
-0.8143237, -0.8465936, -0.7627919, 1, 1, 1, 1, 1,
-0.8142525, 1.142565, -0.3820516, 1, 1, 1, 1, 1,
-0.8135181, 0.4501128, -0.04620178, 1, 1, 1, 1, 1,
-0.8116317, 0.03439513, -2.800226, 0, 0, 1, 1, 1,
-0.8003595, -0.3687635, -2.824864, 1, 0, 0, 1, 1,
-0.7975729, -0.04571, -1.286242, 1, 0, 0, 1, 1,
-0.7975643, 1.165098, -0.3537685, 1, 0, 0, 1, 1,
-0.7959253, 0.7501034, -1.036841, 1, 0, 0, 1, 1,
-0.7904217, -0.3208258, -0.728954, 1, 0, 0, 1, 1,
-0.790404, 0.7895621, 0.576324, 0, 0, 0, 1, 1,
-0.7887407, 1.50722, -0.4042859, 0, 0, 0, 1, 1,
-0.7817835, -0.4803786, -0.3120198, 0, 0, 0, 1, 1,
-0.7786843, -0.2253782, 1.457412, 0, 0, 0, 1, 1,
-0.7785943, 1.140417, -0.557766, 0, 0, 0, 1, 1,
-0.778204, -0.987618, -1.874673, 0, 0, 0, 1, 1,
-0.7771198, 1.131985, -0.0322882, 0, 0, 0, 1, 1,
-0.7726955, -0.8701643, -1.440245, 1, 1, 1, 1, 1,
-0.7709361, -0.1840007, -3.009964, 1, 1, 1, 1, 1,
-0.7639818, 2.013681, -1.321185, 1, 1, 1, 1, 1,
-0.7615638, -2.219536, -1.418647, 1, 1, 1, 1, 1,
-0.7604103, 0.5962754, -1.990555, 1, 1, 1, 1, 1,
-0.7577929, -0.06130788, -3.636886, 1, 1, 1, 1, 1,
-0.7502394, -0.8448229, -2.958381, 1, 1, 1, 1, 1,
-0.7381205, 0.3282249, -0.998485, 1, 1, 1, 1, 1,
-0.7345756, -1.578567, -3.652917, 1, 1, 1, 1, 1,
-0.731658, -0.4942112, 0.07008889, 1, 1, 1, 1, 1,
-0.730775, -2.316439, -3.270571, 1, 1, 1, 1, 1,
-0.7300479, 0.4317017, -2.718535, 1, 1, 1, 1, 1,
-0.7285825, -0.09133056, -3.481354, 1, 1, 1, 1, 1,
-0.7281845, -0.429479, -3.443151, 1, 1, 1, 1, 1,
-0.7085536, 0.2963019, -0.6438505, 1, 1, 1, 1, 1,
-0.7076851, -0.6850722, -2.765842, 0, 0, 1, 1, 1,
-0.7065161, 0.05140875, -2.431336, 1, 0, 0, 1, 1,
-0.7059312, -1.227936, -2.24286, 1, 0, 0, 1, 1,
-0.7055879, -0.8729931, -2.910399, 1, 0, 0, 1, 1,
-0.7041854, -1.102749, -2.961013, 1, 0, 0, 1, 1,
-0.7034707, -0.1482042, -2.173693, 1, 0, 0, 1, 1,
-0.6980488, -1.632315, -2.912126, 0, 0, 0, 1, 1,
-0.6967682, 0.9044653, 1.200657, 0, 0, 0, 1, 1,
-0.6937597, -0.8464414, -1.387885, 0, 0, 0, 1, 1,
-0.6895906, -0.9771906, -3.436653, 0, 0, 0, 1, 1,
-0.6866557, 0.1164264, -3.132797, 0, 0, 0, 1, 1,
-0.6855598, 0.473169, -2.575399, 0, 0, 0, 1, 1,
-0.6817487, 0.360614, 0.7751703, 0, 0, 0, 1, 1,
-0.6772963, -2.602871, -2.442847, 1, 1, 1, 1, 1,
-0.6753051, 0.1159895, -2.168411, 1, 1, 1, 1, 1,
-0.6688945, 1.103539, -0.2536035, 1, 1, 1, 1, 1,
-0.6613514, -1.442563, -1.462669, 1, 1, 1, 1, 1,
-0.6609342, 1.341871, -1.820346, 1, 1, 1, 1, 1,
-0.6599559, 1.312377, -0.4274408, 1, 1, 1, 1, 1,
-0.6574042, -1.232385, -3.645711, 1, 1, 1, 1, 1,
-0.6556334, -0.9430639, -2.054065, 1, 1, 1, 1, 1,
-0.6537257, -1.189439, -1.090495, 1, 1, 1, 1, 1,
-0.6525691, -1.452865, -0.6792724, 1, 1, 1, 1, 1,
-0.6486757, 2.500993, 0.1117174, 1, 1, 1, 1, 1,
-0.6427444, -1.334826, -4.302763, 1, 1, 1, 1, 1,
-0.6414351, 0.8848155, -0.7818533, 1, 1, 1, 1, 1,
-0.6396034, 1.162697, -1.058797, 1, 1, 1, 1, 1,
-0.6383668, -0.6356837, -2.254813, 1, 1, 1, 1, 1,
-0.6300567, 0.2462863, -0.5668722, 0, 0, 1, 1, 1,
-0.6263309, -0.4766205, -1.910255, 1, 0, 0, 1, 1,
-0.619775, 0.6281539, -0.3575906, 1, 0, 0, 1, 1,
-0.6157311, -0.442734, -2.138403, 1, 0, 0, 1, 1,
-0.603228, -1.716515, -2.028296, 1, 0, 0, 1, 1,
-0.6015916, 0.1157219, -0.6929265, 1, 0, 0, 1, 1,
-0.6007656, 0.7412733, -0.7908369, 0, 0, 0, 1, 1,
-0.5991889, -1.29801, -3.60038, 0, 0, 0, 1, 1,
-0.5967364, 0.7922007, -0.07332399, 0, 0, 0, 1, 1,
-0.5966418, -0.02987247, -3.085317, 0, 0, 0, 1, 1,
-0.5917228, -0.06000569, -0.7131301, 0, 0, 0, 1, 1,
-0.5901288, -1.044406, -2.496778, 0, 0, 0, 1, 1,
-0.5887335, 0.4502737, -0.9287994, 0, 0, 0, 1, 1,
-0.588302, 1.8282, 1.642203, 1, 1, 1, 1, 1,
-0.588131, 0.240281, 0.09438019, 1, 1, 1, 1, 1,
-0.5871632, 0.1771756, -1.09441, 1, 1, 1, 1, 1,
-0.5866607, -0.3024703, -1.926919, 1, 1, 1, 1, 1,
-0.5805935, 0.9960785, -0.1230421, 1, 1, 1, 1, 1,
-0.5752664, 0.3335716, -1.058317, 1, 1, 1, 1, 1,
-0.575038, 1.034997, -1.112192, 1, 1, 1, 1, 1,
-0.5733879, 0.663233, -1.006473, 1, 1, 1, 1, 1,
-0.5730169, -2.181122, -3.7323, 1, 1, 1, 1, 1,
-0.5696932, 1.160081, -1.755293, 1, 1, 1, 1, 1,
-0.5696406, 0.2200352, -0.4180157, 1, 1, 1, 1, 1,
-0.5648837, -0.8986726, -3.520102, 1, 1, 1, 1, 1,
-0.5593965, -0.4284366, -2.069974, 1, 1, 1, 1, 1,
-0.5588689, 0.3773675, -2.981531, 1, 1, 1, 1, 1,
-0.5584245, -0.1259904, -0.6738195, 1, 1, 1, 1, 1,
-0.5568557, 0.9800532, -0.9220737, 0, 0, 1, 1, 1,
-0.5562239, 0.7795176, -1.529999, 1, 0, 0, 1, 1,
-0.5529105, 0.4806732, -1.003778, 1, 0, 0, 1, 1,
-0.5509398, 1.121273, -1.138514, 1, 0, 0, 1, 1,
-0.5504642, -0.2083543, -2.06227, 1, 0, 0, 1, 1,
-0.5498395, 0.6557723, -0.8232644, 1, 0, 0, 1, 1,
-0.5454946, 0.09532094, -1.982005, 0, 0, 0, 1, 1,
-0.544557, 2.376792, -1.622514, 0, 0, 0, 1, 1,
-0.5352901, -0.0844123, -1.289237, 0, 0, 0, 1, 1,
-0.5346794, 0.57682, -0.9708628, 0, 0, 0, 1, 1,
-0.5333658, 0.04376587, -0.9206676, 0, 0, 0, 1, 1,
-0.5328533, -0.7367302, -1.591383, 0, 0, 0, 1, 1,
-0.5324779, 0.2871617, -0.2456499, 0, 0, 0, 1, 1,
-0.5323753, -0.4665477, -2.47638, 1, 1, 1, 1, 1,
-0.5313594, 0.416787, -2.282815, 1, 1, 1, 1, 1,
-0.5298029, -0.3528687, -1.484945, 1, 1, 1, 1, 1,
-0.5254567, 0.4025629, 0.3607378, 1, 1, 1, 1, 1,
-0.5174738, -1.901922, -4.358048, 1, 1, 1, 1, 1,
-0.512643, 1.427984, -1.902075, 1, 1, 1, 1, 1,
-0.5097377, -0.3986634, -2.303327, 1, 1, 1, 1, 1,
-0.509719, 0.1518491, -1.77572, 1, 1, 1, 1, 1,
-0.5038692, 0.003386372, -1.469166, 1, 1, 1, 1, 1,
-0.498944, 0.05099012, -0.4924742, 1, 1, 1, 1, 1,
-0.4778965, 0.3438998, -0.9796047, 1, 1, 1, 1, 1,
-0.4745144, 0.8549387, -1.277539, 1, 1, 1, 1, 1,
-0.4743712, 0.6979244, -0.6906995, 1, 1, 1, 1, 1,
-0.4715146, 0.7994327, 0.176001, 1, 1, 1, 1, 1,
-0.4689404, -0.0001995708, -1.085515, 1, 1, 1, 1, 1,
-0.465172, -0.3858189, -0.8479894, 0, 0, 1, 1, 1,
-0.4641097, -0.3770418, -1.604947, 1, 0, 0, 1, 1,
-0.4594021, -1.364492, -2.433352, 1, 0, 0, 1, 1,
-0.4565951, -0.5734355, -1.320648, 1, 0, 0, 1, 1,
-0.4558721, 0.1093034, -2.569479, 1, 0, 0, 1, 1,
-0.4557348, 0.3502941, -1.885193, 1, 0, 0, 1, 1,
-0.4556955, 0.9925359, 0.2206076, 0, 0, 0, 1, 1,
-0.4543919, -0.5870727, -2.480311, 0, 0, 0, 1, 1,
-0.4540545, -0.6355807, -2.134876, 0, 0, 0, 1, 1,
-0.45057, 2.372517, 0.1821413, 0, 0, 0, 1, 1,
-0.4393129, -1.207162, -2.116755, 0, 0, 0, 1, 1,
-0.439288, 2.285956, -0.68089, 0, 0, 0, 1, 1,
-0.4389609, -0.3374942, -2.814751, 0, 0, 0, 1, 1,
-0.4385266, 0.5255297, -1.507112, 1, 1, 1, 1, 1,
-0.4375439, -0.7481197, -0.9662979, 1, 1, 1, 1, 1,
-0.434592, 0.7406474, 0.6273375, 1, 1, 1, 1, 1,
-0.4298626, 0.9704493, -0.1627661, 1, 1, 1, 1, 1,
-0.4287845, -0.3248764, -1.282614, 1, 1, 1, 1, 1,
-0.4275424, -1.112455, -2.447558, 1, 1, 1, 1, 1,
-0.4272821, 0.5358507, 1.299765, 1, 1, 1, 1, 1,
-0.4235958, 0.9328215, -0.7132789, 1, 1, 1, 1, 1,
-0.4214715, 0.6587449, 0.89649, 1, 1, 1, 1, 1,
-0.4116847, 0.9517006, -0.9063886, 1, 1, 1, 1, 1,
-0.407239, -0.9586441, -1.012195, 1, 1, 1, 1, 1,
-0.4069595, 0.9043903, -1.42977, 1, 1, 1, 1, 1,
-0.4064577, -2.189694, -3.303809, 1, 1, 1, 1, 1,
-0.4047343, -0.6476685, -2.305815, 1, 1, 1, 1, 1,
-0.4019113, -1.575166, -2.415734, 1, 1, 1, 1, 1,
-0.3990802, -0.663319, -4.887375, 0, 0, 1, 1, 1,
-0.3959375, 0.8284003, -0.9470643, 1, 0, 0, 1, 1,
-0.3947349, -0.2714401, -2.14485, 1, 0, 0, 1, 1,
-0.3902238, 2.111213, -0.2400955, 1, 0, 0, 1, 1,
-0.3807669, -1.135359, -4.047819, 1, 0, 0, 1, 1,
-0.3727858, -0.2517724, -2.047908, 1, 0, 0, 1, 1,
-0.3692281, -1.290754, -3.798054, 0, 0, 0, 1, 1,
-0.3648925, -0.09928827, -2.573152, 0, 0, 0, 1, 1,
-0.3636895, 0.2806688, -1.120743, 0, 0, 0, 1, 1,
-0.3604082, 0.01850212, -1.892061, 0, 0, 0, 1, 1,
-0.3579455, -0.4979722, -4.468681, 0, 0, 0, 1, 1,
-0.3488341, 1.313771, -1.622938, 0, 0, 0, 1, 1,
-0.3368155, 0.4573955, 1.080551, 0, 0, 0, 1, 1,
-0.3364972, 1.545039, -1.520563, 1, 1, 1, 1, 1,
-0.3331301, -0.4813598, -3.514161, 1, 1, 1, 1, 1,
-0.3323387, -0.5226024, -3.607043, 1, 1, 1, 1, 1,
-0.3263544, -0.9966936, -3.310895, 1, 1, 1, 1, 1,
-0.3228656, 0.939482, -0.02056212, 1, 1, 1, 1, 1,
-0.322545, -0.8103058, -2.345326, 1, 1, 1, 1, 1,
-0.315826, -1.070199, -2.367248, 1, 1, 1, 1, 1,
-0.3156804, -1.050294, -3.364058, 1, 1, 1, 1, 1,
-0.3079992, 0.7256488, 0.259997, 1, 1, 1, 1, 1,
-0.3075409, -0.5892122, -2.653306, 1, 1, 1, 1, 1,
-0.3039841, 1.388855, -0.04633901, 1, 1, 1, 1, 1,
-0.3026417, -0.07259965, -2.43809, 1, 1, 1, 1, 1,
-0.3009202, -2.008941, -2.781995, 1, 1, 1, 1, 1,
-0.3008562, -0.2822976, -3.032282, 1, 1, 1, 1, 1,
-0.2995973, -0.6449334, -5.119711, 1, 1, 1, 1, 1,
-0.297384, 0.3260134, -0.2959866, 0, 0, 1, 1, 1,
-0.2924972, 1.100198, -1.132227, 1, 0, 0, 1, 1,
-0.2918299, -0.7347724, -2.54863, 1, 0, 0, 1, 1,
-0.2868198, -0.5576602, -3.96579, 1, 0, 0, 1, 1,
-0.2848404, -0.7349849, -3.683338, 1, 0, 0, 1, 1,
-0.2844298, -0.8144509, -2.328996, 1, 0, 0, 1, 1,
-0.2834948, -0.5850602, -2.575517, 0, 0, 0, 1, 1,
-0.2833232, -0.8049148, -1.988479, 0, 0, 0, 1, 1,
-0.2821009, -0.07508036, -2.301773, 0, 0, 0, 1, 1,
-0.2789785, 1.472139, 1.179762, 0, 0, 0, 1, 1,
-0.2724526, 0.2520156, 1.320913, 0, 0, 0, 1, 1,
-0.2674406, 2.527, 0.1397385, 0, 0, 0, 1, 1,
-0.2662218, 0.8321727, 0.01805279, 0, 0, 0, 1, 1,
-0.2652707, -0.9559636, -2.426122, 1, 1, 1, 1, 1,
-0.2592606, 1.113266, -1.602842, 1, 1, 1, 1, 1,
-0.2591622, -0.2399315, -2.040921, 1, 1, 1, 1, 1,
-0.2581438, -2.44418, -3.475861, 1, 1, 1, 1, 1,
-0.2579517, 0.6972011, -0.5544778, 1, 1, 1, 1, 1,
-0.2571297, 0.7714983, -1.220032, 1, 1, 1, 1, 1,
-0.2545963, -0.2377782, -3.251917, 1, 1, 1, 1, 1,
-0.2540286, -0.7401448, -3.979435, 1, 1, 1, 1, 1,
-0.2534716, -0.02098813, -0.5193636, 1, 1, 1, 1, 1,
-0.2518635, -0.5378889, -3.128101, 1, 1, 1, 1, 1,
-0.250793, 0.933504, -0.2094976, 1, 1, 1, 1, 1,
-0.244601, -0.23225, -2.728915, 1, 1, 1, 1, 1,
-0.2421114, 0.8785377, -0.609928, 1, 1, 1, 1, 1,
-0.241302, -0.8859011, -1.728087, 1, 1, 1, 1, 1,
-0.2411553, 0.4606321, -0.3498507, 1, 1, 1, 1, 1,
-0.2392605, 0.6093661, -1.264823, 0, 0, 1, 1, 1,
-0.238755, 0.5898229, 0.4663016, 1, 0, 0, 1, 1,
-0.2352045, 0.7966544, -0.9621431, 1, 0, 0, 1, 1,
-0.2260466, 1.321164, 0.9076536, 1, 0, 0, 1, 1,
-0.2239485, 0.9700504, -1.815867, 1, 0, 0, 1, 1,
-0.2215933, 0.08872226, -0.7207835, 1, 0, 0, 1, 1,
-0.219482, -0.7988072, -2.455223, 0, 0, 0, 1, 1,
-0.2171481, -0.9955845, -3.511229, 0, 0, 0, 1, 1,
-0.2163356, -0.4123312, -2.806341, 0, 0, 0, 1, 1,
-0.214805, 1.437613, 0.3786058, 0, 0, 0, 1, 1,
-0.2131131, -2.596137, -2.844, 0, 0, 0, 1, 1,
-0.2108824, 0.9312309, -1.448389, 0, 0, 0, 1, 1,
-0.2107327, -0.1624102, 0.7194132, 0, 0, 0, 1, 1,
-0.2084039, 0.2446026, -2.101994, 1, 1, 1, 1, 1,
-0.2076861, -1.423297, -1.865641, 1, 1, 1, 1, 1,
-0.2064985, -1.837723, -1.464097, 1, 1, 1, 1, 1,
-0.2046129, 0.1520545, -2.318321, 1, 1, 1, 1, 1,
-0.203959, 0.3965936, -0.8435463, 1, 1, 1, 1, 1,
-0.2030776, -0.6049529, -1.907379, 1, 1, 1, 1, 1,
-0.2023443, -0.1728743, -0.9550985, 1, 1, 1, 1, 1,
-0.2003905, 0.7559364, -0.5485032, 1, 1, 1, 1, 1,
-0.1999724, 0.4286281, 0.7574624, 1, 1, 1, 1, 1,
-0.1996304, -0.5339057, -0.4955531, 1, 1, 1, 1, 1,
-0.196307, -1.445391, -3.954902, 1, 1, 1, 1, 1,
-0.1928374, 0.00587987, -1.286313, 1, 1, 1, 1, 1,
-0.1917304, -1.176958, -3.791629, 1, 1, 1, 1, 1,
-0.1881245, -0.01846412, -1.845282, 1, 1, 1, 1, 1,
-0.186358, 0.07142583, -1.529892, 1, 1, 1, 1, 1,
-0.1858157, 0.9099307, 0.5709412, 0, 0, 1, 1, 1,
-0.1854062, 1.782032, -0.8542251, 1, 0, 0, 1, 1,
-0.1834966, -0.4316356, -1.629128, 1, 0, 0, 1, 1,
-0.1831728, 0.3298291, 0.734044, 1, 0, 0, 1, 1,
-0.1826972, -1.376791, -3.076462, 1, 0, 0, 1, 1,
-0.1807381, -0.0795594, -1.48887, 1, 0, 0, 1, 1,
-0.1805388, -0.5746111, -3.627715, 0, 0, 0, 1, 1,
-0.1790203, -1.517231, -3.254855, 0, 0, 0, 1, 1,
-0.1721918, -0.4262703, -1.929267, 0, 0, 0, 1, 1,
-0.1664269, 0.07453689, -1.012252, 0, 0, 0, 1, 1,
-0.1663863, 0.4476246, -0.2068596, 0, 0, 0, 1, 1,
-0.1663118, -0.8527278, -3.416803, 0, 0, 0, 1, 1,
-0.1630968, 0.1239464, -2.311173, 0, 0, 0, 1, 1,
-0.1613759, 0.009517862, -1.650301, 1, 1, 1, 1, 1,
-0.1596563, 0.2641881, -0.5416376, 1, 1, 1, 1, 1,
-0.1573109, 0.320877, -1.399012, 1, 1, 1, 1, 1,
-0.1571328, 0.01105229, -1.909302, 1, 1, 1, 1, 1,
-0.1531939, -0.8625008, -2.443684, 1, 1, 1, 1, 1,
-0.1487933, -0.6492165, -2.22496, 1, 1, 1, 1, 1,
-0.1428355, 0.8304414, 0.4130405, 1, 1, 1, 1, 1,
-0.1407085, 0.7285973, 0.8300409, 1, 1, 1, 1, 1,
-0.140295, -0.1769081, -2.378879, 1, 1, 1, 1, 1,
-0.1402318, -0.3990258, -3.140351, 1, 1, 1, 1, 1,
-0.1385306, -1.119907, -2.760231, 1, 1, 1, 1, 1,
-0.1381823, -1.606406, -2.528917, 1, 1, 1, 1, 1,
-0.1364923, -0.2621092, -2.202092, 1, 1, 1, 1, 1,
-0.1271995, -0.3780909, 0.0338888, 1, 1, 1, 1, 1,
-0.1265564, -1.572759, -2.282395, 1, 1, 1, 1, 1,
-0.1220536, 1.222482, 0.2478398, 0, 0, 1, 1, 1,
-0.1216127, -0.598832, -1.415169, 1, 0, 0, 1, 1,
-0.1171619, 0.9239248, -1.678753, 1, 0, 0, 1, 1,
-0.1170969, 0.01891868, -1.208243, 1, 0, 0, 1, 1,
-0.1150654, 0.7719856, -0.1221822, 1, 0, 0, 1, 1,
-0.1137198, -0.01648716, -0.03113366, 1, 0, 0, 1, 1,
-0.1131699, 0.9712983, 0.5150921, 0, 0, 0, 1, 1,
-0.1124622, 1.229271, -0.3543655, 0, 0, 0, 1, 1,
-0.1044561, -1.335326, -2.853906, 0, 0, 0, 1, 1,
-0.1040808, 0.008364147, -2.240618, 0, 0, 0, 1, 1,
-0.1037669, 2.325447, 0.6362059, 0, 0, 0, 1, 1,
-0.1034001, 0.5599188, -0.2031018, 0, 0, 0, 1, 1,
-0.1029647, -0.6074017, -2.805057, 0, 0, 0, 1, 1,
-0.09801247, -2.537946, -6.017051, 1, 1, 1, 1, 1,
-0.09713957, 0.3643832, -0.5847467, 1, 1, 1, 1, 1,
-0.09653313, -0.2108043, -4.123913, 1, 1, 1, 1, 1,
-0.09631132, -0.1570988, -2.920622, 1, 1, 1, 1, 1,
-0.09549307, -1.446649, -3.035975, 1, 1, 1, 1, 1,
-0.09504907, -0.9469846, -4.388696, 1, 1, 1, 1, 1,
-0.09362213, 0.1402327, -0.8579966, 1, 1, 1, 1, 1,
-0.08679312, 1.501787, 0.4721579, 1, 1, 1, 1, 1,
-0.08221292, -1.274687, -3.875002, 1, 1, 1, 1, 1,
-0.07786402, -0.9002674, -1.558558, 1, 1, 1, 1, 1,
-0.07643103, 0.7523604, -0.2198542, 1, 1, 1, 1, 1,
-0.07356858, 1.227609, -2.00605, 1, 1, 1, 1, 1,
-0.07288437, 0.6751014, -0.4508699, 1, 1, 1, 1, 1,
-0.07168362, -0.1579185, -2.686046, 1, 1, 1, 1, 1,
-0.06851251, -1.404742, -3.066382, 1, 1, 1, 1, 1,
-0.06686249, -0.3080671, -4.631341, 0, 0, 1, 1, 1,
-0.06509294, -1.512108, -3.02463, 1, 0, 0, 1, 1,
-0.05876611, -0.7285808, -1.302835, 1, 0, 0, 1, 1,
-0.05670309, 1.857618, 1.617029, 1, 0, 0, 1, 1,
-0.05502758, 0.327329, -0.962508, 1, 0, 0, 1, 1,
-0.05500579, 0.4100203, 0.5475866, 1, 0, 0, 1, 1,
-0.05128866, 1.95394, -0.2366324, 0, 0, 0, 1, 1,
-0.05060452, -0.5051458, -2.25617, 0, 0, 0, 1, 1,
-0.0449638, -0.5364714, -3.809422, 0, 0, 0, 1, 1,
-0.04206771, 0.6613767, 0.8807183, 0, 0, 0, 1, 1,
-0.037678, -0.4253892, -3.079702, 0, 0, 0, 1, 1,
-0.03604918, 1.059666, -0.9650074, 0, 0, 0, 1, 1,
-0.03463712, -0.8552212, -3.609773, 0, 0, 0, 1, 1,
-0.03383305, 1.438114, -1.024285, 1, 1, 1, 1, 1,
-0.0331824, -0.8755839, -3.020715, 1, 1, 1, 1, 1,
-0.02283079, 0.2314229, -0.008568095, 1, 1, 1, 1, 1,
-0.01403896, 0.1067377, -0.3347539, 1, 1, 1, 1, 1,
-0.01299816, 2.232245, -0.6638238, 1, 1, 1, 1, 1,
-0.01293835, 2.045647, -0.4683494, 1, 1, 1, 1, 1,
-0.01214547, 0.1341906, -0.3825852, 1, 1, 1, 1, 1,
-0.005601732, -0.2465271, -2.291839, 1, 1, 1, 1, 1,
-0.003406182, -0.1080927, -4.014585, 1, 1, 1, 1, 1,
-0.003160316, 0.06271499, 0.03135677, 1, 1, 1, 1, 1,
-0.002111279, 0.931311, -0.03783534, 1, 1, 1, 1, 1,
-0.001463495, 1.850562, -0.9552389, 1, 1, 1, 1, 1,
-0.0009721293, 0.6804616, 0.3130397, 1, 1, 1, 1, 1,
-0.0005416282, 1.330659, -0.8690279, 1, 1, 1, 1, 1,
0.002035778, -1.616942, 2.207973, 1, 1, 1, 1, 1,
0.01400444, -1.509009, 2.755283, 0, 0, 1, 1, 1,
0.02066443, -0.2164618, 1.992273, 1, 0, 0, 1, 1,
0.02243301, -0.6517969, 4.292005, 1, 0, 0, 1, 1,
0.02463718, -1.493459, 3.289248, 1, 0, 0, 1, 1,
0.02657198, -0.1513448, 2.4927, 1, 0, 0, 1, 1,
0.02900985, 1.28523, -0.2831388, 1, 0, 0, 1, 1,
0.03016282, 1.55752, 1.228472, 0, 0, 0, 1, 1,
0.03046867, -0.6397952, 3.763471, 0, 0, 0, 1, 1,
0.03282697, 1.232708, 0.6294844, 0, 0, 0, 1, 1,
0.03352543, 1.466264, -0.5918253, 0, 0, 0, 1, 1,
0.0344859, -0.6254658, 2.051143, 0, 0, 0, 1, 1,
0.04085512, -1.769548, 0.04190455, 0, 0, 0, 1, 1,
0.04191633, 0.04883114, 0.5964456, 0, 0, 0, 1, 1,
0.04382607, 0.7520903, -0.8157812, 1, 1, 1, 1, 1,
0.04424528, -0.3121144, 3.069085, 1, 1, 1, 1, 1,
0.04714388, -0.176799, 2.768235, 1, 1, 1, 1, 1,
0.04740615, 0.8565825, 0.8319854, 1, 1, 1, 1, 1,
0.05097365, 1.015415, -1.256964, 1, 1, 1, 1, 1,
0.05237461, -0.03030846, 1.07397, 1, 1, 1, 1, 1,
0.05278026, 1.500259, -0.2543029, 1, 1, 1, 1, 1,
0.05427618, -1.133816, 2.688956, 1, 1, 1, 1, 1,
0.05872031, -0.3539338, 2.924859, 1, 1, 1, 1, 1,
0.06211886, -0.08777746, 3.669175, 1, 1, 1, 1, 1,
0.06932148, 0.1437848, -0.06986892, 1, 1, 1, 1, 1,
0.07121035, 0.3749027, -0.6021553, 1, 1, 1, 1, 1,
0.07904012, -0.536054, 2.89803, 1, 1, 1, 1, 1,
0.07950882, -1.175176, 3.425403, 1, 1, 1, 1, 1,
0.08008578, -1.375812, 3.150578, 1, 1, 1, 1, 1,
0.08752342, -1.705795, 3.980899, 0, 0, 1, 1, 1,
0.08765855, 0.1828777, 1.019927, 1, 0, 0, 1, 1,
0.09034391, -0.1342558, 0.3927785, 1, 0, 0, 1, 1,
0.0904053, 0.4544299, 0.5756152, 1, 0, 0, 1, 1,
0.09558873, -0.1733965, 3.660533, 1, 0, 0, 1, 1,
0.09574015, 0.1261624, 2.853578, 1, 0, 0, 1, 1,
0.09739938, 0.2964174, -0.2883131, 0, 0, 0, 1, 1,
0.0975938, 0.1329375, 0.3749485, 0, 0, 0, 1, 1,
0.09977879, 1.550976, 1.309548, 0, 0, 0, 1, 1,
0.100018, -0.9115661, 3.131188, 0, 0, 0, 1, 1,
0.1020738, 0.6705096, -0.394662, 0, 0, 0, 1, 1,
0.1034353, 1.329053, -0.2776127, 0, 0, 0, 1, 1,
0.1045995, -0.09048317, 0.09390222, 0, 0, 0, 1, 1,
0.1070845, -0.1540218, 0.2459202, 1, 1, 1, 1, 1,
0.1084122, 0.04085346, 0.6069889, 1, 1, 1, 1, 1,
0.1089453, -0.6513025, 3.546383, 1, 1, 1, 1, 1,
0.1114645, -0.5309524, 2.09096, 1, 1, 1, 1, 1,
0.1123807, 0.09650175, 1.436405, 1, 1, 1, 1, 1,
0.1178177, 0.8837107, -0.9807084, 1, 1, 1, 1, 1,
0.1187804, 0.3526275, 0.7446316, 1, 1, 1, 1, 1,
0.1215969, 0.5331101, 0.7369333, 1, 1, 1, 1, 1,
0.123451, 1.204819, 1.082079, 1, 1, 1, 1, 1,
0.1266483, -1.587801, 3.99798, 1, 1, 1, 1, 1,
0.1284868, -0.6308885, 1.518403, 1, 1, 1, 1, 1,
0.1338217, -0.1077018, 2.253533, 1, 1, 1, 1, 1,
0.136703, -0.3395542, 2.803619, 1, 1, 1, 1, 1,
0.138476, -0.08499479, 1.274326, 1, 1, 1, 1, 1,
0.1402292, -0.5067832, 2.007611, 1, 1, 1, 1, 1,
0.1439898, 1.276026, -0.7402328, 0, 0, 1, 1, 1,
0.1443134, 0.3946214, 1.876145, 1, 0, 0, 1, 1,
0.1456103, 1.586206, -0.370217, 1, 0, 0, 1, 1,
0.146351, -0.3035492, 3.026927, 1, 0, 0, 1, 1,
0.1573537, 0.1858748, 0.8938715, 1, 0, 0, 1, 1,
0.1580374, 0.5594634, 0.9074916, 1, 0, 0, 1, 1,
0.1725482, 0.7567297, -0.4365025, 0, 0, 0, 1, 1,
0.1776822, -1.920426, 2.219593, 0, 0, 0, 1, 1,
0.1794416, 0.2139122, 0.03839183, 0, 0, 0, 1, 1,
0.1835113, -0.893311, 1.079822, 0, 0, 0, 1, 1,
0.1837354, -0.477496, 2.665121, 0, 0, 0, 1, 1,
0.1883646, -0.0208639, 1.774086, 0, 0, 0, 1, 1,
0.1897058, 1.691024, -0.2283075, 0, 0, 0, 1, 1,
0.1924284, -0.7143031, 3.382554, 1, 1, 1, 1, 1,
0.1938557, 1.286319, -0.4423891, 1, 1, 1, 1, 1,
0.1960999, -0.707509, 2.53462, 1, 1, 1, 1, 1,
0.1972433, -0.1880803, 2.928274, 1, 1, 1, 1, 1,
0.2003429, 0.4582729, -0.3227834, 1, 1, 1, 1, 1,
0.2051829, -0.1209276, 2.609106, 1, 1, 1, 1, 1,
0.2113054, -0.7669132, 2.778205, 1, 1, 1, 1, 1,
0.2169793, 0.5436347, 0.5684769, 1, 1, 1, 1, 1,
0.2187525, 0.3011351, -0.1988841, 1, 1, 1, 1, 1,
0.2189906, -1.18196, 3.055897, 1, 1, 1, 1, 1,
0.2268154, 1.702409, -0.8091794, 1, 1, 1, 1, 1,
0.2272646, -2.115568, 3.923226, 1, 1, 1, 1, 1,
0.2279873, 1.083343, -0.7836102, 1, 1, 1, 1, 1,
0.2304399, 1.983936, 0.5351099, 1, 1, 1, 1, 1,
0.2318718, 0.3746796, 0.3941307, 1, 1, 1, 1, 1,
0.2324126, -0.2115938, 1.276702, 0, 0, 1, 1, 1,
0.2327087, -1.071482, 2.536924, 1, 0, 0, 1, 1,
0.2343412, -0.1060296, 2.032461, 1, 0, 0, 1, 1,
0.2348129, 0.005041267, 3.08441, 1, 0, 0, 1, 1,
0.2372014, 1.537859, -1.240875, 1, 0, 0, 1, 1,
0.238422, 0.7257302, -0.4127368, 1, 0, 0, 1, 1,
0.2397111, 1.683378, 0.5514044, 0, 0, 0, 1, 1,
0.2402106, 0.9375388, 2.263929, 0, 0, 0, 1, 1,
0.2417738, -1.440076, 2.345691, 0, 0, 0, 1, 1,
0.2447231, -0.3840412, 2.29906, 0, 0, 0, 1, 1,
0.2461484, -0.498851, 3.693606, 0, 0, 0, 1, 1,
0.2513695, 0.5950279, -0.361915, 0, 0, 0, 1, 1,
0.2526823, -0.2914345, 2.969434, 0, 0, 0, 1, 1,
0.2556487, -0.2520831, 1.530324, 1, 1, 1, 1, 1,
0.2563588, -0.2519623, 3.356133, 1, 1, 1, 1, 1,
0.2580143, 0.3832501, 0.2328261, 1, 1, 1, 1, 1,
0.2600796, -2.512408, 4.451295, 1, 1, 1, 1, 1,
0.2601662, -0.3225048, 3.192791, 1, 1, 1, 1, 1,
0.2654969, -1.033897, 3.402642, 1, 1, 1, 1, 1,
0.272727, 0.3392425, 0.1757047, 1, 1, 1, 1, 1,
0.2741604, 0.3470145, 1.587068, 1, 1, 1, 1, 1,
0.2748981, -0.5224162, 2.084074, 1, 1, 1, 1, 1,
0.2778356, 0.01373921, 0.2159489, 1, 1, 1, 1, 1,
0.2785145, -0.4502409, 3.712085, 1, 1, 1, 1, 1,
0.279451, 0.7584421, -0.9941902, 1, 1, 1, 1, 1,
0.2879793, -1.350358, 3.229816, 1, 1, 1, 1, 1,
0.2970034, -0.9890385, 3.721103, 1, 1, 1, 1, 1,
0.2990113, -0.0262457, 1.642076, 1, 1, 1, 1, 1,
0.3047707, 2.717802, -0.165308, 0, 0, 1, 1, 1,
0.306453, -1.674506, 3.922434, 1, 0, 0, 1, 1,
0.3070735, -0.6066397, 2.16241, 1, 0, 0, 1, 1,
0.3096461, -0.0810117, 2.638133, 1, 0, 0, 1, 1,
0.3100649, 1.497071, -1.56484, 1, 0, 0, 1, 1,
0.3132988, -0.1507205, 3.839038, 1, 0, 0, 1, 1,
0.314361, 1.333239, -1.314797, 0, 0, 0, 1, 1,
0.3185587, -0.0295725, 2.214147, 0, 0, 0, 1, 1,
0.3196944, 0.1173111, 1.576276, 0, 0, 0, 1, 1,
0.3294406, 0.1555749, 2.466142, 0, 0, 0, 1, 1,
0.3311891, -0.4451736, 1.06356, 0, 0, 0, 1, 1,
0.333106, 2.094807, 1.001009, 0, 0, 0, 1, 1,
0.3356186, -0.2548311, 3.241034, 0, 0, 0, 1, 1,
0.3365481, -0.8623822, 2.56355, 1, 1, 1, 1, 1,
0.3387752, -0.1510884, 0.5877627, 1, 1, 1, 1, 1,
0.3401088, -0.4758492, 3.843335, 1, 1, 1, 1, 1,
0.3408333, -0.5265559, 1.787278, 1, 1, 1, 1, 1,
0.3411041, -0.2183053, 2.421499, 1, 1, 1, 1, 1,
0.3418336, -0.1720411, 2.151916, 1, 1, 1, 1, 1,
0.3420255, 1.005537, 1.929271, 1, 1, 1, 1, 1,
0.3432075, -0.9139344, 4.360148, 1, 1, 1, 1, 1,
0.3432811, -1.019505, 1.27474, 1, 1, 1, 1, 1,
0.3453277, -1.212336, 2.884012, 1, 1, 1, 1, 1,
0.3466942, -1.137388, 1.348819, 1, 1, 1, 1, 1,
0.3508956, -0.783348, 2.767855, 1, 1, 1, 1, 1,
0.3543657, -0.4373812, 2.091866, 1, 1, 1, 1, 1,
0.3558655, 0.507843, 1.300992, 1, 1, 1, 1, 1,
0.3569728, 1.47489, -0.7357588, 1, 1, 1, 1, 1,
0.362473, 0.4657932, -0.5604885, 0, 0, 1, 1, 1,
0.3664885, 1.634677, -1.266896, 1, 0, 0, 1, 1,
0.3669116, -1.481969, 2.097145, 1, 0, 0, 1, 1,
0.3779184, -0.988433, 4.060603, 1, 0, 0, 1, 1,
0.3798382, 0.8336186, -1.15696, 1, 0, 0, 1, 1,
0.3811718, 0.06772323, 1.970868, 1, 0, 0, 1, 1,
0.3865904, 0.1654424, 2.173037, 0, 0, 0, 1, 1,
0.3868046, 0.415362, 0.4549758, 0, 0, 0, 1, 1,
0.3873309, 1.007861, -1.262201, 0, 0, 0, 1, 1,
0.3904287, 0.5324998, 0.7998183, 0, 0, 0, 1, 1,
0.3905309, -0.5839557, 3.927542, 0, 0, 0, 1, 1,
0.3923216, -0.6689339, 2.760477, 0, 0, 0, 1, 1,
0.4018815, 2.697532, 0.7874413, 0, 0, 0, 1, 1,
0.4058696, -1.045659, 2.673475, 1, 1, 1, 1, 1,
0.4073716, -0.4514513, -0.01086923, 1, 1, 1, 1, 1,
0.4161561, 0.5119889, -0.44249, 1, 1, 1, 1, 1,
0.4264455, -0.2151127, 0.228537, 1, 1, 1, 1, 1,
0.4379575, -0.4826678, 3.754984, 1, 1, 1, 1, 1,
0.4397152, -0.4145553, 2.121308, 1, 1, 1, 1, 1,
0.4400975, 0.5093588, -0.2813508, 1, 1, 1, 1, 1,
0.4462968, 0.2711791, -0.205599, 1, 1, 1, 1, 1,
0.4480971, -0.5756831, 2.103661, 1, 1, 1, 1, 1,
0.4481907, 0.9154435, -0.5827634, 1, 1, 1, 1, 1,
0.4503846, 1.353018, 0.553886, 1, 1, 1, 1, 1,
0.4507221, -0.3303693, 0.4306316, 1, 1, 1, 1, 1,
0.4507424, -0.461285, 3.677068, 1, 1, 1, 1, 1,
0.4551522, 0.803811, 1.127446, 1, 1, 1, 1, 1,
0.4607993, 0.36064, 2.19336, 1, 1, 1, 1, 1,
0.4633361, 0.4305852, 0.8055209, 0, 0, 1, 1, 1,
0.4639132, 2.143824, -1.045132, 1, 0, 0, 1, 1,
0.4654714, -0.2356696, 1.168214, 1, 0, 0, 1, 1,
0.4658917, -1.265059, 0.6613289, 1, 0, 0, 1, 1,
0.4688233, -0.3968641, 3.339753, 1, 0, 0, 1, 1,
0.4699045, -0.8173671, 2.761502, 1, 0, 0, 1, 1,
0.4705191, 0.4068661, 1.353775, 0, 0, 0, 1, 1,
0.4730999, -1.458617, 2.148057, 0, 0, 0, 1, 1,
0.4759615, 2.514266, 0.6673952, 0, 0, 0, 1, 1,
0.475996, 0.3153065, 0.1130685, 0, 0, 0, 1, 1,
0.4798665, 0.3575031, -0.125824, 0, 0, 0, 1, 1,
0.485626, -0.2186589, 1.563384, 0, 0, 0, 1, 1,
0.4928022, -0.1526911, 4.143782, 0, 0, 0, 1, 1,
0.4987071, 0.1046781, 2.360327, 1, 1, 1, 1, 1,
0.5095978, 0.9645013, 1.279709, 1, 1, 1, 1, 1,
0.5112934, -0.199277, 2.033695, 1, 1, 1, 1, 1,
0.5159901, -0.2055896, 1.247089, 1, 1, 1, 1, 1,
0.5161561, 0.5754406, 0.1983388, 1, 1, 1, 1, 1,
0.5187038, -0.1771248, 1.584195, 1, 1, 1, 1, 1,
0.5289545, 1.010704, -0.0397082, 1, 1, 1, 1, 1,
0.5298389, -0.8175566, 3.482974, 1, 1, 1, 1, 1,
0.5324697, -1.983848, 2.087695, 1, 1, 1, 1, 1,
0.5328433, 0.4774904, 0.4104719, 1, 1, 1, 1, 1,
0.536499, -0.01305974, 2.337662, 1, 1, 1, 1, 1,
0.5365028, -0.6475945, 2.98889, 1, 1, 1, 1, 1,
0.5371026, -0.04117334, 1.123906, 1, 1, 1, 1, 1,
0.5372756, 1.311215, 1.121023, 1, 1, 1, 1, 1,
0.5449402, 0.5996994, 1.862464, 1, 1, 1, 1, 1,
0.5488056, -0.1856886, 2.613349, 0, 0, 1, 1, 1,
0.5503322, 0.1503636, -0.7692827, 1, 0, 0, 1, 1,
0.5520914, 0.7006051, -0.4952854, 1, 0, 0, 1, 1,
0.5533746, -0.5151294, 1.525607, 1, 0, 0, 1, 1,
0.554663, -0.1796772, 1.702826, 1, 0, 0, 1, 1,
0.5553764, 1.0105, 1.505757, 1, 0, 0, 1, 1,
0.5593867, -0.3084007, 1.69106, 0, 0, 0, 1, 1,
0.5663609, 0.1218394, 0.736737, 0, 0, 0, 1, 1,
0.5679759, 0.7428557, 0.661157, 0, 0, 0, 1, 1,
0.5703162, 1.583679, 2.032363, 0, 0, 0, 1, 1,
0.5705655, -0.3341045, 1.333728, 0, 0, 0, 1, 1,
0.5722284, 0.9090456, 0.04668311, 0, 0, 0, 1, 1,
0.5835986, -0.3997535, 1.246658, 0, 0, 0, 1, 1,
0.5847617, 0.07750977, 1.395965, 1, 1, 1, 1, 1,
0.5855477, 1.685078, 0.5315415, 1, 1, 1, 1, 1,
0.5857546, -0.7175432, 2.911726, 1, 1, 1, 1, 1,
0.5893023, 1.526374, -0.1006889, 1, 1, 1, 1, 1,
0.59282, 0.1699511, 0.04064541, 1, 1, 1, 1, 1,
0.6022291, -0.4915712, 2.701496, 1, 1, 1, 1, 1,
0.6037428, 0.06292858, 1.003965, 1, 1, 1, 1, 1,
0.6042284, -0.1597007, 2.95327, 1, 1, 1, 1, 1,
0.6054044, -0.4437067, 2.380959, 1, 1, 1, 1, 1,
0.606226, -0.895906, 2.215243, 1, 1, 1, 1, 1,
0.6118008, -0.6395161, 3.055848, 1, 1, 1, 1, 1,
0.6124806, -0.9108332, 3.549122, 1, 1, 1, 1, 1,
0.6129562, -0.04760676, 3.046934, 1, 1, 1, 1, 1,
0.6197585, 0.7046631, 0.618019, 1, 1, 1, 1, 1,
0.6217777, -0.2705376, 2.642898, 1, 1, 1, 1, 1,
0.6244189, -0.3392121, 1.992727, 0, 0, 1, 1, 1,
0.6295292, 0.5644606, 1.229139, 1, 0, 0, 1, 1,
0.6361515, -1.74376, 2.937116, 1, 0, 0, 1, 1,
0.6423188, 0.8026933, -1.794045, 1, 0, 0, 1, 1,
0.6426483, 0.5270336, 0.6174069, 1, 0, 0, 1, 1,
0.6456241, 2.106444, -0.1498772, 1, 0, 0, 1, 1,
0.6479681, -1.562174, 2.817749, 0, 0, 0, 1, 1,
0.6536399, 0.5522357, -1.70374, 0, 0, 0, 1, 1,
0.6562227, 0.2445165, 1.573339, 0, 0, 0, 1, 1,
0.6596551, 0.5006121, -1.74101, 0, 0, 0, 1, 1,
0.6645993, 0.4392852, 0.8434305, 0, 0, 0, 1, 1,
0.667768, 1.383547, -0.7617071, 0, 0, 0, 1, 1,
0.6719208, -1.838748, 0.3531893, 0, 0, 0, 1, 1,
0.6761191, 0.5545126, 0.4140158, 1, 1, 1, 1, 1,
0.6790071, -0.3253791, 3.878877, 1, 1, 1, 1, 1,
0.6812636, 0.8208258, 0.0600303, 1, 1, 1, 1, 1,
0.685268, -1.78965, 3.00877, 1, 1, 1, 1, 1,
0.6881379, 1.195845, 1.75288, 1, 1, 1, 1, 1,
0.6881875, 0.6344159, 0.7746646, 1, 1, 1, 1, 1,
0.6928591, -1.404582, 2.42153, 1, 1, 1, 1, 1,
0.6930584, -0.3879402, 3.126011, 1, 1, 1, 1, 1,
0.6943803, 0.7688626, 0.2451487, 1, 1, 1, 1, 1,
0.6994861, 0.1897982, 1.200296, 1, 1, 1, 1, 1,
0.6998592, -0.6425352, 1.842985, 1, 1, 1, 1, 1,
0.7076814, -0.4633345, 0.8099188, 1, 1, 1, 1, 1,
0.7085536, -1.291273, 1.557338, 1, 1, 1, 1, 1,
0.7167963, 2.510161, 0.9740088, 1, 1, 1, 1, 1,
0.7197554, 0.7415928, 0.4964524, 1, 1, 1, 1, 1,
0.7197658, 0.04708141, 1.017676, 0, 0, 1, 1, 1,
0.7205672, -0.3456554, 1.203103, 1, 0, 0, 1, 1,
0.7243893, -0.0839204, 1.527308, 1, 0, 0, 1, 1,
0.7264453, 2.060301, 2.795458, 1, 0, 0, 1, 1,
0.7305974, 1.408662, 0.1759561, 1, 0, 0, 1, 1,
0.7359105, -1.858372, 2.853253, 1, 0, 0, 1, 1,
0.7603391, -0.5391033, 3.688078, 0, 0, 0, 1, 1,
0.7614661, -0.6058776, 4.240005, 0, 0, 0, 1, 1,
0.7695948, 0.3585665, 0.9407676, 0, 0, 0, 1, 1,
0.7727095, -0.702693, 1.45147, 0, 0, 0, 1, 1,
0.7758887, 0.1937794, 2.726892, 0, 0, 0, 1, 1,
0.776908, 0.7936028, 0.8054816, 0, 0, 0, 1, 1,
0.7771276, 1.139557, -0.001914266, 0, 0, 0, 1, 1,
0.7910908, 2.747955, -0.7465672, 1, 1, 1, 1, 1,
0.7917248, -0.2241602, 2.706875, 1, 1, 1, 1, 1,
0.7935727, 0.9249781, 0.1219779, 1, 1, 1, 1, 1,
0.7955353, 0.2660398, -0.1603729, 1, 1, 1, 1, 1,
0.7968862, -0.4779145, 3.550626, 1, 1, 1, 1, 1,
0.7985062, -0.9514254, 3.329021, 1, 1, 1, 1, 1,
0.7986106, 1.266009, 2.080327, 1, 1, 1, 1, 1,
0.8008871, -0.9941507, 2.22558, 1, 1, 1, 1, 1,
0.8024918, -0.989522, 0.8612383, 1, 1, 1, 1, 1,
0.8047154, 0.8673885, -0.160008, 1, 1, 1, 1, 1,
0.8051271, -0.6010744, 1.579527, 1, 1, 1, 1, 1,
0.807931, -0.2242815, 1.803284, 1, 1, 1, 1, 1,
0.8099093, 1.344562, -0.6300681, 1, 1, 1, 1, 1,
0.8128292, 0.9480543, -0.3254487, 1, 1, 1, 1, 1,
0.8155587, 0.4297548, 1.399602, 1, 1, 1, 1, 1,
0.8184553, 2.156874, 1.567984, 0, 0, 1, 1, 1,
0.8241111, -0.5954741, 1.273811, 1, 0, 0, 1, 1,
0.826254, -0.2462209, 1.932249, 1, 0, 0, 1, 1,
0.8269442, -0.07687498, 1.208131, 1, 0, 0, 1, 1,
0.8278555, -0.4085195, 2.626882, 1, 0, 0, 1, 1,
0.8327687, -1.322553, 3.301148, 1, 0, 0, 1, 1,
0.8351555, 0.1757801, 2.609433, 0, 0, 0, 1, 1,
0.8447949, -0.7745852, 3.929468, 0, 0, 0, 1, 1,
0.8471199, -0.6068782, 2.396906, 0, 0, 0, 1, 1,
0.8499353, -0.4945228, 1.472692, 0, 0, 0, 1, 1,
0.8552516, 0.5821796, 2.045599, 0, 0, 0, 1, 1,
0.8562583, 0.6562002, 1.772552, 0, 0, 0, 1, 1,
0.8654296, -0.2034144, 2.654742, 0, 0, 0, 1, 1,
0.8666831, -0.6527312, 2.496108, 1, 1, 1, 1, 1,
0.8694855, -0.04902073, 2.526601, 1, 1, 1, 1, 1,
0.8759164, -1.47316, 1.181039, 1, 1, 1, 1, 1,
0.8788642, -1.095061, 3.041775, 1, 1, 1, 1, 1,
0.8823951, 0.8624129, 0.6352524, 1, 1, 1, 1, 1,
0.8881485, -2.088091, 1.598008, 1, 1, 1, 1, 1,
0.891077, 0.3105949, 1.659616, 1, 1, 1, 1, 1,
0.892826, -1.954781, 2.477763, 1, 1, 1, 1, 1,
0.893788, 0.2966011, 0.7869055, 1, 1, 1, 1, 1,
0.897337, 0.9621677, -0.4095299, 1, 1, 1, 1, 1,
0.9004909, -0.332206, 1.185439, 1, 1, 1, 1, 1,
0.904058, 2.364002, 0.9579078, 1, 1, 1, 1, 1,
0.9081206, -0.7020046, 0.8427724, 1, 1, 1, 1, 1,
0.9090818, -0.08996195, 1.300584, 1, 1, 1, 1, 1,
0.9094323, 0.9742488, 1.557341, 1, 1, 1, 1, 1,
0.9112434, -1.309949, 1.910542, 0, 0, 1, 1, 1,
0.9119218, -0.9222963, 2.987412, 1, 0, 0, 1, 1,
0.9203004, 0.3855779, 0.6053327, 1, 0, 0, 1, 1,
0.9221245, 0.4216333, -0.2544274, 1, 0, 0, 1, 1,
0.9232442, -0.2324346, 1.540702, 1, 0, 0, 1, 1,
0.9299193, 0.706335, 0.8827158, 1, 0, 0, 1, 1,
0.936412, 0.6145166, 1.855013, 0, 0, 0, 1, 1,
0.937744, -1.459349, 1.310277, 0, 0, 0, 1, 1,
0.9461977, 2.085254, 0.8548672, 0, 0, 0, 1, 1,
0.9610462, 0.7048117, -0.1820659, 0, 0, 0, 1, 1,
0.9662657, 0.02317083, 2.899777, 0, 0, 0, 1, 1,
0.9822555, -1.10365, 1.582373, 0, 0, 0, 1, 1,
0.9838467, -0.9663572, 0.6492214, 0, 0, 0, 1, 1,
0.9849692, 0.1850727, 1.434181, 1, 1, 1, 1, 1,
0.9858823, 1.308736, 0.2940483, 1, 1, 1, 1, 1,
0.9881736, -1.040464, 1.813527, 1, 1, 1, 1, 1,
0.9914465, -1.481235, 2.65552, 1, 1, 1, 1, 1,
0.9944748, 0.6298646, 1.881987, 1, 1, 1, 1, 1,
0.9950353, -1.15567, 1.94929, 1, 1, 1, 1, 1,
0.9958476, 0.3918295, 0.1540646, 1, 1, 1, 1, 1,
1.017906, -1.189714, 2.807101, 1, 1, 1, 1, 1,
1.02748, -0.2770486, 3.604525, 1, 1, 1, 1, 1,
1.031837, 0.09289433, 1.49289, 1, 1, 1, 1, 1,
1.034334, 0.3073721, 0.1714183, 1, 1, 1, 1, 1,
1.037, -0.3324806, 0.7912964, 1, 1, 1, 1, 1,
1.046677, 0.3137189, 0.6901442, 1, 1, 1, 1, 1,
1.04851, 0.5770242, 2.539441, 1, 1, 1, 1, 1,
1.059756, -0.7464662, 3.667914, 1, 1, 1, 1, 1,
1.074022, -0.470642, 2.819202, 0, 0, 1, 1, 1,
1.074022, -1.010952, 1.889109, 1, 0, 0, 1, 1,
1.076427, 0.4801621, 0.1693221, 1, 0, 0, 1, 1,
1.079437, -0.3705979, 2.685367, 1, 0, 0, 1, 1,
1.088508, 1.219865, -0.472776, 1, 0, 0, 1, 1,
1.101742, -0.9043567, 2.606344, 1, 0, 0, 1, 1,
1.110396, 0.8382203, 0.2995235, 0, 0, 0, 1, 1,
1.121875, 0.63587, 3.20719, 0, 0, 0, 1, 1,
1.145227, -0.6349982, 2.903349, 0, 0, 0, 1, 1,
1.146264, -0.4641907, 1.830025, 0, 0, 0, 1, 1,
1.149394, 0.1438628, 2.160154, 0, 0, 0, 1, 1,
1.157691, 0.2449358, 0.4351458, 0, 0, 0, 1, 1,
1.161866, -0.2269448, 0.4888677, 0, 0, 0, 1, 1,
1.167482, 0.1465188, 0.4328715, 1, 1, 1, 1, 1,
1.174487, -0.03930716, 1.764049, 1, 1, 1, 1, 1,
1.174579, 0.30998, 0.2430636, 1, 1, 1, 1, 1,
1.178604, 2.11282, 0.8778622, 1, 1, 1, 1, 1,
1.192346, 1.535136, 0.8106716, 1, 1, 1, 1, 1,
1.196417, 0.3744949, 2.170724, 1, 1, 1, 1, 1,
1.197023, -2.145927, 2.1253, 1, 1, 1, 1, 1,
1.201527, 1.143831, 0.2824792, 1, 1, 1, 1, 1,
1.202155, -1.314155, 4.783845, 1, 1, 1, 1, 1,
1.209789, -0.438958, 2.523533, 1, 1, 1, 1, 1,
1.211155, 1.234761, 2.796713, 1, 1, 1, 1, 1,
1.216677, -0.09831541, 2.161732, 1, 1, 1, 1, 1,
1.229444, 0.04021125, 1.997995, 1, 1, 1, 1, 1,
1.232747, 0.2478892, 2.878435, 1, 1, 1, 1, 1,
1.23919, 1.248802, 0.2522784, 1, 1, 1, 1, 1,
1.242721, 0.2178699, 1.208812, 0, 0, 1, 1, 1,
1.272732, 0.1515022, 0.9144182, 1, 0, 0, 1, 1,
1.277531, -1.632712, 2.852339, 1, 0, 0, 1, 1,
1.279704, 0.9084035, 0.7481207, 1, 0, 0, 1, 1,
1.28889, -0.6807278, 2.385597, 1, 0, 0, 1, 1,
1.292277, 0.297697, 2.131524, 1, 0, 0, 1, 1,
1.295448, 0.3706737, 0.4584194, 0, 0, 0, 1, 1,
1.302137, 0.8779918, 1.499388, 0, 0, 0, 1, 1,
1.302227, 1.88304, 1.263461, 0, 0, 0, 1, 1,
1.311067, 0.553599, 1.45186, 0, 0, 0, 1, 1,
1.318736, 0.08573131, 2.910577, 0, 0, 0, 1, 1,
1.324557, -0.4852782, 2.863618, 0, 0, 0, 1, 1,
1.325984, -0.5549749, 1.249059, 0, 0, 0, 1, 1,
1.326572, 0.3678385, 1.824832, 1, 1, 1, 1, 1,
1.343338, 0.6262397, 1.232744, 1, 1, 1, 1, 1,
1.346962, 0.5014685, 0.7702345, 1, 1, 1, 1, 1,
1.35139, 1.064024, -0.1512603, 1, 1, 1, 1, 1,
1.354506, 0.2115529, -0.659401, 1, 1, 1, 1, 1,
1.358016, -1.745412, 3.393048, 1, 1, 1, 1, 1,
1.360546, -0.4811026, 0.1819995, 1, 1, 1, 1, 1,
1.373355, 0.1579678, 1.124967, 1, 1, 1, 1, 1,
1.379325, -1.52702, 0.5037194, 1, 1, 1, 1, 1,
1.393629, 1.095984, 1.420168, 1, 1, 1, 1, 1,
1.400113, -0.04526016, 4.177169, 1, 1, 1, 1, 1,
1.401535, 0.06441597, 1.26264, 1, 1, 1, 1, 1,
1.405566, 0.2714567, 2.226205, 1, 1, 1, 1, 1,
1.415946, -2.028941, 2.951554, 1, 1, 1, 1, 1,
1.416783, -0.001075124, 2.431494, 1, 1, 1, 1, 1,
1.41849, 0.6272996, 0.4584069, 0, 0, 1, 1, 1,
1.440427, 0.6314201, 0.7449794, 1, 0, 0, 1, 1,
1.440668, 1.472882, -0.1634138, 1, 0, 0, 1, 1,
1.440776, -0.8352811, 0.659825, 1, 0, 0, 1, 1,
1.441222, -0.3361349, -0.488473, 1, 0, 0, 1, 1,
1.446873, 0.4288263, 1.425717, 1, 0, 0, 1, 1,
1.450479, 0.005874228, 1.716463, 0, 0, 0, 1, 1,
1.451228, 0.4604705, -0.02422411, 0, 0, 0, 1, 1,
1.454203, 0.5511947, -0.3800939, 0, 0, 0, 1, 1,
1.467224, 0.6889917, 0.8828794, 0, 0, 0, 1, 1,
1.476993, 0.6135026, 1.334941, 0, 0, 0, 1, 1,
1.484526, -0.3048669, 4.549149, 0, 0, 0, 1, 1,
1.487906, -1.958836, 1.180274, 0, 0, 0, 1, 1,
1.492092, 0.1979097, 2.026037, 1, 1, 1, 1, 1,
1.496511, 0.5301683, 2.942088, 1, 1, 1, 1, 1,
1.511326, -0.01009091, 1.453552, 1, 1, 1, 1, 1,
1.513954, 0.002692266, 0.4504949, 1, 1, 1, 1, 1,
1.514355, 0.3499604, 1.584367, 1, 1, 1, 1, 1,
1.523651, -1.126316, 2.491599, 1, 1, 1, 1, 1,
1.5353, 0.2216283, 2.555762, 1, 1, 1, 1, 1,
1.539176, -0.208544, 2.003129, 1, 1, 1, 1, 1,
1.547416, 0.2621447, 1.276929, 1, 1, 1, 1, 1,
1.548818, 0.1477093, 0.5071574, 1, 1, 1, 1, 1,
1.552015, 2.039976, 0.3043179, 1, 1, 1, 1, 1,
1.555307, -1.184432, 2.68305, 1, 1, 1, 1, 1,
1.580279, -0.6083567, 1.371593, 1, 1, 1, 1, 1,
1.594234, 0.9929553, 1.921004, 1, 1, 1, 1, 1,
1.601505, 1.473999, 0.8616329, 1, 1, 1, 1, 1,
1.607265, -0.1504903, 0.4931367, 0, 0, 1, 1, 1,
1.613516, 1.234407, 0.2746564, 1, 0, 0, 1, 1,
1.615435, 1.189896, 1.237421, 1, 0, 0, 1, 1,
1.616619, -0.9540642, 2.403218, 1, 0, 0, 1, 1,
1.637074, 1.010396, -0.9649041, 1, 0, 0, 1, 1,
1.63737, 0.3923838, 2.96449, 1, 0, 0, 1, 1,
1.651487, 2.089973, 1.923237, 0, 0, 0, 1, 1,
1.652358, -0.7294549, 1.342389, 0, 0, 0, 1, 1,
1.652439, 0.1954975, 1.230827, 0, 0, 0, 1, 1,
1.687134, -0.4837648, 3.104623, 0, 0, 0, 1, 1,
1.693969, 0.01805141, 0.3738848, 0, 0, 0, 1, 1,
1.71456, 0.2657834, 1.452251, 0, 0, 0, 1, 1,
1.740804, -0.8294991, 3.542212, 0, 0, 0, 1, 1,
1.741143, -0.1181839, 1.302048, 1, 1, 1, 1, 1,
1.743785, -2.154912, 1.610743, 1, 1, 1, 1, 1,
1.774001, 2.699903, 0.9968855, 1, 1, 1, 1, 1,
1.775496, 1.891832, 0.05006849, 1, 1, 1, 1, 1,
1.783267, 0.5685997, 0.9198108, 1, 1, 1, 1, 1,
1.802781, 0.6515245, 0.3025812, 1, 1, 1, 1, 1,
1.820266, -1.052601, 2.039953, 1, 1, 1, 1, 1,
1.820298, 0.3661422, 0.942496, 1, 1, 1, 1, 1,
1.825194, -0.3324368, 0.9944004, 1, 1, 1, 1, 1,
1.834707, 1.505281, 0.4319856, 1, 1, 1, 1, 1,
1.901773, 0.5487443, 0.7563328, 1, 1, 1, 1, 1,
1.903041, 0.1959619, 2.351152, 1, 1, 1, 1, 1,
1.971164, -0.2246981, -0.1399756, 1, 1, 1, 1, 1,
1.986944, 0.709586, -0.5066853, 1, 1, 1, 1, 1,
2.001585, 1.664586, 0.1915459, 1, 1, 1, 1, 1,
2.015121, 0.2763475, 2.00382, 0, 0, 1, 1, 1,
2.023038, 0.8425865, 0.132094, 1, 0, 0, 1, 1,
2.051733, 0.3723166, 1.30274, 1, 0, 0, 1, 1,
2.137684, -1.188193, 3.44395, 1, 0, 0, 1, 1,
2.141969, 0.6002418, 3.154206, 1, 0, 0, 1, 1,
2.143198, -0.4537303, 2.38809, 1, 0, 0, 1, 1,
2.146219, 0.1027316, 0.8761835, 0, 0, 0, 1, 1,
2.176997, 0.08193598, 1.278114, 0, 0, 0, 1, 1,
2.246572, 0.7492909, 1.591052, 0, 0, 0, 1, 1,
2.267723, 0.06058513, 0.08768278, 0, 0, 0, 1, 1,
2.383621, 0.8484137, 1.099899, 0, 0, 0, 1, 1,
2.403712, 0.4455487, 0.9707493, 0, 0, 0, 1, 1,
2.465935, 0.9707409, -0.3950446, 0, 0, 0, 1, 1,
2.631754, -1.868011, 1.180295, 1, 1, 1, 1, 1,
2.659867, -2.172789, 2.190657, 1, 1, 1, 1, 1,
2.668864, -1.875885, 2.407844, 1, 1, 1, 1, 1,
2.829892, 0.2501436, 1.078949, 1, 1, 1, 1, 1,
3.204987, 0.8199379, 0.8643483, 1, 1, 1, 1, 1,
3.2159, -1.006901, 0.8004816, 1, 1, 1, 1, 1,
3.750184, 0.9279906, 0.7347638, 1, 1, 1, 1, 1
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
var radius = 9.411315;
var distance = 33.05684;
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
mvMatrix.translate( -0.422794, -0.07254207, 0.6166031 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.05684);
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
