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
-3.421778, -0.9088588, -2.476279, 1, 0, 0, 1,
-3.205848, 0.1000785, -1.975803, 1, 0.007843138, 0, 1,
-3.173205, 0.6206421, 0.100121, 1, 0.01176471, 0, 1,
-2.551848, -0.4210277, -2.291148, 1, 0.01960784, 0, 1,
-2.547551, 0.717205, -1.151191, 1, 0.02352941, 0, 1,
-2.545077, -0.532799, -0.1854872, 1, 0.03137255, 0, 1,
-2.530519, -1.33957, -4.17644, 1, 0.03529412, 0, 1,
-2.453573, 1.297941, -1.865223, 1, 0.04313726, 0, 1,
-2.43571, -0.04737825, -0.854946, 1, 0.04705882, 0, 1,
-2.389896, 0.0462082, -1.724671, 1, 0.05490196, 0, 1,
-2.301775, -0.5180407, -2.029485, 1, 0.05882353, 0, 1,
-2.300694, 0.02725072, -1.265352, 1, 0.06666667, 0, 1,
-2.261351, 1.820948, -1.023854, 1, 0.07058824, 0, 1,
-2.255283, -0.1799064, -1.802244, 1, 0.07843138, 0, 1,
-2.223983, -0.102403, -0.2668474, 1, 0.08235294, 0, 1,
-2.219608, 1.013219, -2.632342, 1, 0.09019608, 0, 1,
-2.195704, 1.02696, -1.427373, 1, 0.09411765, 0, 1,
-2.173879, 0.02270026, -0.8369672, 1, 0.1019608, 0, 1,
-2.158241, 0.3552613, -1.437206, 1, 0.1098039, 0, 1,
-2.127152, 0.2735318, -0.886151, 1, 0.1137255, 0, 1,
-2.084637, 0.9489053, -0.8025687, 1, 0.1215686, 0, 1,
-2.079099, -1.209051, -1.931044, 1, 0.1254902, 0, 1,
-2.073694, -0.6918649, -3.456253, 1, 0.1333333, 0, 1,
-2.058547, -0.5696231, -2.101918, 1, 0.1372549, 0, 1,
-2.055868, -0.4875899, 0.04012657, 1, 0.145098, 0, 1,
-2.036728, 1.654081, 0.0109203, 1, 0.1490196, 0, 1,
-1.987214, -0.3671297, -1.011351, 1, 0.1568628, 0, 1,
-1.974576, 0.767236, -1.940987, 1, 0.1607843, 0, 1,
-1.974163, 1.338721, 0.7394729, 1, 0.1686275, 0, 1,
-1.957579, -0.4136957, -2.642625, 1, 0.172549, 0, 1,
-1.925237, 0.06245621, -2.886841, 1, 0.1803922, 0, 1,
-1.925137, -1.399799, -1.366769, 1, 0.1843137, 0, 1,
-1.91385, -0.8176696, -1.132636, 1, 0.1921569, 0, 1,
-1.90324, -0.4033431, -2.58664, 1, 0.1960784, 0, 1,
-1.880389, 1.102361, -0.4989382, 1, 0.2039216, 0, 1,
-1.856097, 0.5905879, -2.968368, 1, 0.2117647, 0, 1,
-1.845581, -0.6360117, -4.240344, 1, 0.2156863, 0, 1,
-1.821738, 0.4597816, -0.610046, 1, 0.2235294, 0, 1,
-1.821429, 1.115201, 0.3263916, 1, 0.227451, 0, 1,
-1.809322, 0.09818954, -1.985073, 1, 0.2352941, 0, 1,
-1.782954, 1.005393, -1.491927, 1, 0.2392157, 0, 1,
-1.761227, -1.621029, -1.485835, 1, 0.2470588, 0, 1,
-1.751346, 0.2493101, -0.3000008, 1, 0.2509804, 0, 1,
-1.747966, 0.6061453, -2.523406, 1, 0.2588235, 0, 1,
-1.735186, 0.6811563, 0.07121787, 1, 0.2627451, 0, 1,
-1.689725, -0.3244087, -1.512729, 1, 0.2705882, 0, 1,
-1.654447, 0.5169428, -0.9287292, 1, 0.2745098, 0, 1,
-1.649543, 0.5824015, -1.977996, 1, 0.282353, 0, 1,
-1.643678, 0.07713536, -0.4555293, 1, 0.2862745, 0, 1,
-1.63959, -0.1454578, -0.5621039, 1, 0.2941177, 0, 1,
-1.639058, 0.1114891, -0.04386635, 1, 0.3019608, 0, 1,
-1.636114, -0.1028343, -0.6023599, 1, 0.3058824, 0, 1,
-1.631486, -0.01191766, -0.6288886, 1, 0.3137255, 0, 1,
-1.628309, -1.631233, -2.325474, 1, 0.3176471, 0, 1,
-1.623051, -0.5716835, -2.5328, 1, 0.3254902, 0, 1,
-1.621758, 0.9217685, 0.5454415, 1, 0.3294118, 0, 1,
-1.601404, -0.6974224, -2.391623, 1, 0.3372549, 0, 1,
-1.594611, 1.016967, -0.9558395, 1, 0.3411765, 0, 1,
-1.586271, -0.01421053, -1.746099, 1, 0.3490196, 0, 1,
-1.585849, 0.447764, -1.06453, 1, 0.3529412, 0, 1,
-1.583413, -2.373703, -2.946992, 1, 0.3607843, 0, 1,
-1.570116, 1.259852, -1.501472, 1, 0.3647059, 0, 1,
-1.558001, 0.4802736, 0.07818157, 1, 0.372549, 0, 1,
-1.555139, 0.5953922, -1.233526, 1, 0.3764706, 0, 1,
-1.548463, -0.6614303, -0.7670988, 1, 0.3843137, 0, 1,
-1.544388, 0.4982092, -2.950303, 1, 0.3882353, 0, 1,
-1.543288, -1.752876, -1.877577, 1, 0.3960784, 0, 1,
-1.540622, -0.4055374, -1.319985, 1, 0.4039216, 0, 1,
-1.518285, -0.5365075, -1.670806, 1, 0.4078431, 0, 1,
-1.51777, 2.210994, 0.2472678, 1, 0.4156863, 0, 1,
-1.497738, -0.522314, -1.167618, 1, 0.4196078, 0, 1,
-1.474902, 1.39306, -2.00157, 1, 0.427451, 0, 1,
-1.473771, -0.82895, -1.604386, 1, 0.4313726, 0, 1,
-1.472778, -0.2852046, -3.053732, 1, 0.4392157, 0, 1,
-1.465274, 0.1594067, 0.7898019, 1, 0.4431373, 0, 1,
-1.463466, 0.6402922, 0.8214745, 1, 0.4509804, 0, 1,
-1.451998, -0.1400645, -2.301826, 1, 0.454902, 0, 1,
-1.4506, -0.5416219, -2.256079, 1, 0.4627451, 0, 1,
-1.44786, 0.6750471, -2.144025, 1, 0.4666667, 0, 1,
-1.418925, -0.9423693, -3.425651, 1, 0.4745098, 0, 1,
-1.405936, 0.9968937, -1.862248, 1, 0.4784314, 0, 1,
-1.404654, 0.444055, -1.473511, 1, 0.4862745, 0, 1,
-1.400674, -0.5020062, -0.641353, 1, 0.4901961, 0, 1,
-1.392857, -0.2333075, -1.146937, 1, 0.4980392, 0, 1,
-1.388336, 0.9844394, -0.9366735, 1, 0.5058824, 0, 1,
-1.386904, 0.986832, -1.01619, 1, 0.509804, 0, 1,
-1.384631, -0.1372064, -2.213858, 1, 0.5176471, 0, 1,
-1.382812, 0.09647704, -1.431985, 1, 0.5215687, 0, 1,
-1.378533, -0.6614157, -3.120516, 1, 0.5294118, 0, 1,
-1.360568, -0.4113488, -4.123236, 1, 0.5333334, 0, 1,
-1.359358, -0.3996626, -1.201818, 1, 0.5411765, 0, 1,
-1.357163, -0.4548423, -0.6368904, 1, 0.5450981, 0, 1,
-1.351603, -1.520366, -3.389242, 1, 0.5529412, 0, 1,
-1.349001, -0.211652, -1.62144, 1, 0.5568628, 0, 1,
-1.348953, -0.8659154, -1.094276, 1, 0.5647059, 0, 1,
-1.339255, -0.06508127, -3.187737, 1, 0.5686275, 0, 1,
-1.321296, 0.4457579, -1.890775, 1, 0.5764706, 0, 1,
-1.312971, -1.401147, -2.482337, 1, 0.5803922, 0, 1,
-1.30868, 0.3914752, -0.772335, 1, 0.5882353, 0, 1,
-1.306387, -1.073562, -3.472639, 1, 0.5921569, 0, 1,
-1.292284, -0.5967124, -2.251285, 1, 0.6, 0, 1,
-1.291967, -0.7490768, -2.832814, 1, 0.6078432, 0, 1,
-1.279006, -0.7077976, -2.735332, 1, 0.6117647, 0, 1,
-1.272583, 0.2428732, -1.988357, 1, 0.6196079, 0, 1,
-1.261469, -1.585148, -2.094707, 1, 0.6235294, 0, 1,
-1.250521, 0.1170641, -1.959269, 1, 0.6313726, 0, 1,
-1.247031, -0.411919, -1.468889, 1, 0.6352941, 0, 1,
-1.243288, 1.390532, 0.5710449, 1, 0.6431373, 0, 1,
-1.234398, -0.1432817, -2.458434, 1, 0.6470588, 0, 1,
-1.232053, 1.660194, 0.4391321, 1, 0.654902, 0, 1,
-1.21843, -0.3873848, -3.243293, 1, 0.6588235, 0, 1,
-1.216756, -0.4909388, -2.335889, 1, 0.6666667, 0, 1,
-1.195261, 0.3893567, -1.807477, 1, 0.6705883, 0, 1,
-1.194695, -0.3811842, -2.818319, 1, 0.6784314, 0, 1,
-1.188916, 0.111989, -1.545831, 1, 0.682353, 0, 1,
-1.179642, -1.796306, -3.380234, 1, 0.6901961, 0, 1,
-1.176146, 1.060716, -0.2109873, 1, 0.6941177, 0, 1,
-1.173999, 0.7837226, -0.1836495, 1, 0.7019608, 0, 1,
-1.161082, 0.6354341, 0.6388067, 1, 0.7098039, 0, 1,
-1.149486, 0.6236627, -1.283156, 1, 0.7137255, 0, 1,
-1.148505, -1.083049, -2.112258, 1, 0.7215686, 0, 1,
-1.148488, 0.2940944, -1.187718, 1, 0.7254902, 0, 1,
-1.147817, -0.05133583, -3.208762, 1, 0.7333333, 0, 1,
-1.144272, 0.1905203, 0.6968399, 1, 0.7372549, 0, 1,
-1.122004, 0.5582216, -2.014368, 1, 0.7450981, 0, 1,
-1.121596, -1.294407, -1.797594, 1, 0.7490196, 0, 1,
-1.120247, -1.457836, -2.224692, 1, 0.7568628, 0, 1,
-1.117082, -0.3832942, -1.950633, 1, 0.7607843, 0, 1,
-1.105731, 0.7693288, -2.078841, 1, 0.7686275, 0, 1,
-1.103209, -0.2404349, -2.846001, 1, 0.772549, 0, 1,
-1.103048, -1.048527, -2.063601, 1, 0.7803922, 0, 1,
-1.098963, 1.208456, -0.9366045, 1, 0.7843137, 0, 1,
-1.095615, 0.1391421, -0.117979, 1, 0.7921569, 0, 1,
-1.095563, 0.07490832, -3.03655, 1, 0.7960784, 0, 1,
-1.089481, -1.59055, -4.898427, 1, 0.8039216, 0, 1,
-1.085501, -1.147639, -2.322058, 1, 0.8117647, 0, 1,
-1.075318, 0.3134709, -0.04976048, 1, 0.8156863, 0, 1,
-1.071169, -1.4524, -4.127645, 1, 0.8235294, 0, 1,
-1.067162, -0.5206749, -4.598671, 1, 0.827451, 0, 1,
-1.066608, -0.1897393, -2.682309, 1, 0.8352941, 0, 1,
-1.059173, -1.140174, -2.379813, 1, 0.8392157, 0, 1,
-1.058752, 1.421216, 0.2385036, 1, 0.8470588, 0, 1,
-1.058337, 0.4996862, 0.8052723, 1, 0.8509804, 0, 1,
-1.055517, -0.2553233, -4.32738, 1, 0.8588235, 0, 1,
-1.054538, -0.09576917, -2.219555, 1, 0.8627451, 0, 1,
-1.037487, -0.4111466, -1.981096, 1, 0.8705882, 0, 1,
-1.036774, -0.06435536, -2.836298, 1, 0.8745098, 0, 1,
-1.036151, -0.4551651, -2.300416, 1, 0.8823529, 0, 1,
-1.034042, -1.163429, -0.6730044, 1, 0.8862745, 0, 1,
-1.031726, 1.871524, -2.222134, 1, 0.8941177, 0, 1,
-1.031252, -0.7077116, -2.445096, 1, 0.8980392, 0, 1,
-1.028034, -0.2936699, -3.128376, 1, 0.9058824, 0, 1,
-1.011879, 0.4672956, -0.6713367, 1, 0.9137255, 0, 1,
-1.005125, 0.4170275, -1.341261, 1, 0.9176471, 0, 1,
-1.002021, -0.1686395, -1.507301, 1, 0.9254902, 0, 1,
-1.000285, 1.336134, 0.5606075, 1, 0.9294118, 0, 1,
-0.9994642, -0.575734, -0.2681266, 1, 0.9372549, 0, 1,
-0.9987418, 1.250521, -1.392208, 1, 0.9411765, 0, 1,
-0.9968257, 2.363859, -0.5243992, 1, 0.9490196, 0, 1,
-0.9960322, -0.8721086, -2.052309, 1, 0.9529412, 0, 1,
-0.992204, 1.349735, 0.3828005, 1, 0.9607843, 0, 1,
-0.987642, 0.4694635, 0.358514, 1, 0.9647059, 0, 1,
-0.9841195, 0.765591, -0.3707111, 1, 0.972549, 0, 1,
-0.9762021, -0.4727353, -1.352043, 1, 0.9764706, 0, 1,
-0.973197, 0.5757795, -0.8138632, 1, 0.9843137, 0, 1,
-0.9702053, -1.316555, -1.580212, 1, 0.9882353, 0, 1,
-0.9629332, -0.8729649, -2.353716, 1, 0.9960784, 0, 1,
-0.9515256, -0.1093862, -0.9919978, 0.9960784, 1, 0, 1,
-0.9499462, 0.7124756, -1.439983, 0.9921569, 1, 0, 1,
-0.9489314, 0.3843288, -1.150134, 0.9843137, 1, 0, 1,
-0.9472321, -0.9208468, -2.428245, 0.9803922, 1, 0, 1,
-0.9439318, -2.100514, -3.561037, 0.972549, 1, 0, 1,
-0.9420137, -2.106481, -2.324823, 0.9686275, 1, 0, 1,
-0.9418983, 0.2986448, -1.940577, 0.9607843, 1, 0, 1,
-0.9416311, -0.8221464, -2.503711, 0.9568627, 1, 0, 1,
-0.9373811, 0.628422, -0.007617458, 0.9490196, 1, 0, 1,
-0.9361212, -1.939618, -1.034599, 0.945098, 1, 0, 1,
-0.9339889, 0.6606138, -1.472242, 0.9372549, 1, 0, 1,
-0.930189, -0.8168771, -1.850833, 0.9333333, 1, 0, 1,
-0.9296328, 0.1218588, 0.4657449, 0.9254902, 1, 0, 1,
-0.9173011, 0.0002692119, -1.04283, 0.9215686, 1, 0, 1,
-0.9163573, 0.7424374, -1.355875, 0.9137255, 1, 0, 1,
-0.9123993, 1.705786, -0.5876803, 0.9098039, 1, 0, 1,
-0.9105166, -0.202365, -2.917165, 0.9019608, 1, 0, 1,
-0.9055451, -0.1033576, -1.900725, 0.8941177, 1, 0, 1,
-0.9016597, -1.175676, -1.832459, 0.8901961, 1, 0, 1,
-0.89667, 0.009143434, -2.462343, 0.8823529, 1, 0, 1,
-0.8965462, 0.3564635, -0.3551062, 0.8784314, 1, 0, 1,
-0.8944063, 0.6246715, 0.3648794, 0.8705882, 1, 0, 1,
-0.8932006, -1.16484, -2.195482, 0.8666667, 1, 0, 1,
-0.8920443, -0.0577963, -0.6442037, 0.8588235, 1, 0, 1,
-0.8914261, 1.037369, -3.412715, 0.854902, 1, 0, 1,
-0.8725859, 0.9702083, -0.5097537, 0.8470588, 1, 0, 1,
-0.8688231, -0.5619705, -3.176502, 0.8431373, 1, 0, 1,
-0.866048, -1.173178, -2.259638, 0.8352941, 1, 0, 1,
-0.8657897, -0.6109113, -2.310334, 0.8313726, 1, 0, 1,
-0.8637223, -1.550652, -1.800838, 0.8235294, 1, 0, 1,
-0.8622152, -0.2469506, -2.154148, 0.8196079, 1, 0, 1,
-0.8619668, -3.30022, -4.138074, 0.8117647, 1, 0, 1,
-0.860907, 1.240529, -1.154367, 0.8078431, 1, 0, 1,
-0.8473121, 1.728215, -0.317914, 0.8, 1, 0, 1,
-0.8404304, 0.7638326, -0.04224461, 0.7921569, 1, 0, 1,
-0.8273422, -0.002446358, -2.797502, 0.7882353, 1, 0, 1,
-0.8250642, 1.217134, -1.761986, 0.7803922, 1, 0, 1,
-0.824908, 1.330319, 0.4148177, 0.7764706, 1, 0, 1,
-0.8232588, 1.150162, -2.636444, 0.7686275, 1, 0, 1,
-0.8213762, -0.3836231, -1.51493, 0.7647059, 1, 0, 1,
-0.8183346, -0.1254945, -0.07215819, 0.7568628, 1, 0, 1,
-0.8182665, 0.4792174, -0.7266007, 0.7529412, 1, 0, 1,
-0.8156761, 0.7398015, -0.8737266, 0.7450981, 1, 0, 1,
-0.8156194, 0.06866172, -2.154737, 0.7411765, 1, 0, 1,
-0.8122919, -2.040265, -2.070215, 0.7333333, 1, 0, 1,
-0.8109742, -0.2666737, -0.8707052, 0.7294118, 1, 0, 1,
-0.8044839, 0.1307832, 0.1729845, 0.7215686, 1, 0, 1,
-0.8038736, -0.04759485, -1.73987, 0.7176471, 1, 0, 1,
-0.802924, -0.09128501, -0.2116388, 0.7098039, 1, 0, 1,
-0.8016112, 0.8049361, -0.186582, 0.7058824, 1, 0, 1,
-0.7873035, 1.138983, -1.322046, 0.6980392, 1, 0, 1,
-0.7871515, 0.4565249, -0.2413794, 0.6901961, 1, 0, 1,
-0.7867575, -0.2777121, -2.518103, 0.6862745, 1, 0, 1,
-0.7826258, 1.985825, -0.8077017, 0.6784314, 1, 0, 1,
-0.7767048, -1.00521, -1.41595, 0.6745098, 1, 0, 1,
-0.7734845, 0.04845108, -0.4917929, 0.6666667, 1, 0, 1,
-0.7715568, 0.7271864, -1.814123, 0.6627451, 1, 0, 1,
-0.7689071, 0.3378736, -2.249182, 0.654902, 1, 0, 1,
-0.7663466, -1.183366, -2.767488, 0.6509804, 1, 0, 1,
-0.7647713, -0.03668359, -0.8344775, 0.6431373, 1, 0, 1,
-0.7637315, 1.353307, -0.229351, 0.6392157, 1, 0, 1,
-0.761227, -0.170171, -1.709335, 0.6313726, 1, 0, 1,
-0.7592222, 0.09074506, -1.856966, 0.627451, 1, 0, 1,
-0.7566849, 0.9125621, -0.1902649, 0.6196079, 1, 0, 1,
-0.7544387, 0.416687, -1.013536, 0.6156863, 1, 0, 1,
-0.750748, -0.4210459, -1.280797, 0.6078432, 1, 0, 1,
-0.7471518, 0.8107703, 0.7498986, 0.6039216, 1, 0, 1,
-0.7469137, -0.3129514, -2.115648, 0.5960785, 1, 0, 1,
-0.7441004, 0.05600449, -1.561849, 0.5882353, 1, 0, 1,
-0.7329727, 2.264405, -0.08872981, 0.5843138, 1, 0, 1,
-0.7299687, -0.3310563, -2.543947, 0.5764706, 1, 0, 1,
-0.7259604, 1.314444, 1.085425, 0.572549, 1, 0, 1,
-0.7229693, -0.7517725, -1.813896, 0.5647059, 1, 0, 1,
-0.7112821, -0.2148764, -1.79592, 0.5607843, 1, 0, 1,
-0.6993908, -0.2454907, 0.08828317, 0.5529412, 1, 0, 1,
-0.6983554, 0.8890864, -0.8312249, 0.5490196, 1, 0, 1,
-0.6953528, -0.136419, -1.983246, 0.5411765, 1, 0, 1,
-0.6947013, 1.151616, 1.138068, 0.5372549, 1, 0, 1,
-0.6895958, 0.1911205, -1.544314, 0.5294118, 1, 0, 1,
-0.6888961, 0.2778811, -2.336622, 0.5254902, 1, 0, 1,
-0.6827438, 1.140834, -0.05758364, 0.5176471, 1, 0, 1,
-0.6822526, 0.2984735, -0.4978432, 0.5137255, 1, 0, 1,
-0.6687008, -1.513196, -3.387052, 0.5058824, 1, 0, 1,
-0.6662259, -0.02256895, -2.092123, 0.5019608, 1, 0, 1,
-0.6627948, -0.3569171, -2.561665, 0.4941176, 1, 0, 1,
-0.6593066, 0.511506, -0.3682625, 0.4862745, 1, 0, 1,
-0.6545215, 0.2322583, -0.6572112, 0.4823529, 1, 0, 1,
-0.6538227, 1.990109, -0.03711002, 0.4745098, 1, 0, 1,
-0.6523148, -2.259449, -2.805164, 0.4705882, 1, 0, 1,
-0.6500457, -1.60226, -2.836836, 0.4627451, 1, 0, 1,
-0.6499799, 1.577936, 0.7033771, 0.4588235, 1, 0, 1,
-0.6474715, 0.2900615, 0.2260763, 0.4509804, 1, 0, 1,
-0.6461319, 0.3144713, 0.7484365, 0.4470588, 1, 0, 1,
-0.6435242, 1.30527, -0.8296164, 0.4392157, 1, 0, 1,
-0.6375656, -0.05324802, -2.057895, 0.4352941, 1, 0, 1,
-0.6327804, 1.307108, 0.1836987, 0.427451, 1, 0, 1,
-0.6321133, 0.9014427, -1.204542, 0.4235294, 1, 0, 1,
-0.6316391, -0.5342744, -2.7745, 0.4156863, 1, 0, 1,
-0.6238775, 0.8159021, 1.699657, 0.4117647, 1, 0, 1,
-0.6228132, 0.3866127, -1.662754, 0.4039216, 1, 0, 1,
-0.6194558, 0.792596, 0.6424135, 0.3960784, 1, 0, 1,
-0.6119537, 1.255856, 0.05277827, 0.3921569, 1, 0, 1,
-0.6119047, 0.5656607, -1.116735, 0.3843137, 1, 0, 1,
-0.6114936, -1.757197, -4.223476, 0.3803922, 1, 0, 1,
-0.6101584, 0.7676047, -1.482328, 0.372549, 1, 0, 1,
-0.6084911, -0.05484283, -0.9698977, 0.3686275, 1, 0, 1,
-0.6070632, 0.8685056, -0.2469122, 0.3607843, 1, 0, 1,
-0.604418, -0.9384317, -1.876042, 0.3568628, 1, 0, 1,
-0.603624, 1.515981, 0.5497211, 0.3490196, 1, 0, 1,
-0.6035215, -0.3024725, -0.8873329, 0.345098, 1, 0, 1,
-0.6014216, 0.04647813, -1.600329, 0.3372549, 1, 0, 1,
-0.6010271, -0.2804817, -3.806817, 0.3333333, 1, 0, 1,
-0.5997565, 1.72078, 0.0110618, 0.3254902, 1, 0, 1,
-0.5980543, 0.3584119, 0.1469288, 0.3215686, 1, 0, 1,
-0.5965577, 1.186266, -0.6842555, 0.3137255, 1, 0, 1,
-0.5961478, -1.585685, -3.803427, 0.3098039, 1, 0, 1,
-0.5954807, 0.2274664, 0.1688941, 0.3019608, 1, 0, 1,
-0.5948408, -1.466839, -3.304008, 0.2941177, 1, 0, 1,
-0.5943301, -1.141428, -3.493067, 0.2901961, 1, 0, 1,
-0.5896351, 0.5268124, 1.183385, 0.282353, 1, 0, 1,
-0.5859091, 0.5014799, 0.2884015, 0.2784314, 1, 0, 1,
-0.5858533, -0.248145, -0.6963127, 0.2705882, 1, 0, 1,
-0.5849752, -0.3326552, -3.226875, 0.2666667, 1, 0, 1,
-0.5820801, 0.8838463, 0.6101547, 0.2588235, 1, 0, 1,
-0.5795306, -1.088088, -2.237224, 0.254902, 1, 0, 1,
-0.5778583, 0.8337349, -2.541507, 0.2470588, 1, 0, 1,
-0.57744, -0.7050194, -1.837892, 0.2431373, 1, 0, 1,
-0.5714171, 0.1238809, -1.937654, 0.2352941, 1, 0, 1,
-0.5701229, 0.1304182, -0.6326908, 0.2313726, 1, 0, 1,
-0.5669401, -0.690206, -2.391337, 0.2235294, 1, 0, 1,
-0.5653774, -0.4555211, -0.3720102, 0.2196078, 1, 0, 1,
-0.5648165, -0.05343634, -1.425394, 0.2117647, 1, 0, 1,
-0.5625532, -0.1107894, -1.973297, 0.2078431, 1, 0, 1,
-0.5618546, -0.2044977, -2.774861, 0.2, 1, 0, 1,
-0.5556884, 0.7069721, 0.6819695, 0.1921569, 1, 0, 1,
-0.5543172, -0.6908594, -2.397346, 0.1882353, 1, 0, 1,
-0.5452352, 0.2938232, 1.372638, 0.1803922, 1, 0, 1,
-0.5406785, -0.497407, -3.125901, 0.1764706, 1, 0, 1,
-0.5392579, 1.733535, -1.018693, 0.1686275, 1, 0, 1,
-0.5391786, 0.7624371, -1.999695, 0.1647059, 1, 0, 1,
-0.5328331, -0.0790278, -2.673616, 0.1568628, 1, 0, 1,
-0.5315027, -0.6575454, -0.7753513, 0.1529412, 1, 0, 1,
-0.5302861, -0.6370981, -1.507008, 0.145098, 1, 0, 1,
-0.5301886, 1.074524, -1.39017, 0.1411765, 1, 0, 1,
-0.5282306, -0.705546, -2.260431, 0.1333333, 1, 0, 1,
-0.5260952, -0.9324868, -2.728494, 0.1294118, 1, 0, 1,
-0.5250529, 0.7298243, 1.251804, 0.1215686, 1, 0, 1,
-0.5224094, -0.8594068, -3.26521, 0.1176471, 1, 0, 1,
-0.5204237, -0.04897005, -1.767268, 0.1098039, 1, 0, 1,
-0.5160052, 2.172318, -1.715883, 0.1058824, 1, 0, 1,
-0.497295, 0.7033692, -1.287114, 0.09803922, 1, 0, 1,
-0.4869038, -0.8117585, -2.207771, 0.09019608, 1, 0, 1,
-0.4868563, 1.265628, -0.9609767, 0.08627451, 1, 0, 1,
-0.4847298, -2.091477, -2.472455, 0.07843138, 1, 0, 1,
-0.4844181, -1.009168, -1.642392, 0.07450981, 1, 0, 1,
-0.4841566, 0.3641373, 0.1445064, 0.06666667, 1, 0, 1,
-0.4805296, 0.3815543, 0.4296496, 0.0627451, 1, 0, 1,
-0.4725866, -0.7175214, -2.02924, 0.05490196, 1, 0, 1,
-0.4708591, 0.5427189, 1.645583, 0.05098039, 1, 0, 1,
-0.4678715, 0.704684, -2.082633, 0.04313726, 1, 0, 1,
-0.4669961, 1.253621, 0.4341487, 0.03921569, 1, 0, 1,
-0.466495, -0.2767963, -3.040636, 0.03137255, 1, 0, 1,
-0.4632446, 1.069789, 0.5453394, 0.02745098, 1, 0, 1,
-0.453976, -1.157676, -2.970046, 0.01960784, 1, 0, 1,
-0.4538617, -0.07732034, -1.901189, 0.01568628, 1, 0, 1,
-0.4488752, 0.5147289, -0.9408827, 0.007843138, 1, 0, 1,
-0.4472816, -0.3409516, -3.668624, 0.003921569, 1, 0, 1,
-0.4413612, -0.8279957, -2.357051, 0, 1, 0.003921569, 1,
-0.4384203, -0.9196982, -2.608433, 0, 1, 0.01176471, 1,
-0.4333053, 0.7339246, 1.308361, 0, 1, 0.01568628, 1,
-0.4277266, 2.021346, -0.3993916, 0, 1, 0.02352941, 1,
-0.4267005, 1.387736, -0.4184144, 0, 1, 0.02745098, 1,
-0.4231961, 1.588568, 0.04277616, 0, 1, 0.03529412, 1,
-0.4221989, 1.344184, -0.5234445, 0, 1, 0.03921569, 1,
-0.4208795, 1.21382, -1.550524, 0, 1, 0.04705882, 1,
-0.4204934, -1.698052, -2.622776, 0, 1, 0.05098039, 1,
-0.4172507, -0.4067341, -3.615585, 0, 1, 0.05882353, 1,
-0.4167368, -1.161091, -3.324423, 0, 1, 0.0627451, 1,
-0.4137457, 0.380963, -2.463145, 0, 1, 0.07058824, 1,
-0.4018759, -0.4100893, -2.048497, 0, 1, 0.07450981, 1,
-0.3947847, 0.4866895, -0.4099177, 0, 1, 0.08235294, 1,
-0.3891142, 0.7315336, -1.682966, 0, 1, 0.08627451, 1,
-0.3856172, 0.6064636, -0.7715778, 0, 1, 0.09411765, 1,
-0.37875, 2.466017, 0.1419653, 0, 1, 0.1019608, 1,
-0.376474, 0.05999914, -2.243825, 0, 1, 0.1058824, 1,
-0.372631, 0.2041855, -1.447015, 0, 1, 0.1137255, 1,
-0.3699392, 1.904957, 0.5849361, 0, 1, 0.1176471, 1,
-0.3696852, 1.078478, 0.09324419, 0, 1, 0.1254902, 1,
-0.3669794, 0.8050703, -0.462936, 0, 1, 0.1294118, 1,
-0.363659, 1.32794, 0.22417, 0, 1, 0.1372549, 1,
-0.3636136, -0.4141609, -1.699794, 0, 1, 0.1411765, 1,
-0.3612131, -1.062887, -2.648966, 0, 1, 0.1490196, 1,
-0.3609742, 1.802103, -0.3867802, 0, 1, 0.1529412, 1,
-0.3574193, 1.840049, -1.177196, 0, 1, 0.1607843, 1,
-0.3544431, 0.09874231, -1.856734, 0, 1, 0.1647059, 1,
-0.3530459, 1.365626, 0.7502816, 0, 1, 0.172549, 1,
-0.3492064, -0.1457009, -2.439797, 0, 1, 0.1764706, 1,
-0.3430669, 1.066264, 0.3406073, 0, 1, 0.1843137, 1,
-0.3404446, 0.6627135, -1.186379, 0, 1, 0.1882353, 1,
-0.3382263, -0.1407614, -3.086482, 0, 1, 0.1960784, 1,
-0.335562, 0.6394016, 0.3666627, 0, 1, 0.2039216, 1,
-0.3319453, -0.6000867, -1.884767, 0, 1, 0.2078431, 1,
-0.3298724, -1.015243, -1.793072, 0, 1, 0.2156863, 1,
-0.3284204, -0.3517644, -1.343073, 0, 1, 0.2196078, 1,
-0.3225714, -0.5391262, -4.07247, 0, 1, 0.227451, 1,
-0.322251, 0.8778213, -0.8106034, 0, 1, 0.2313726, 1,
-0.3198448, 0.4177063, 0.2022534, 0, 1, 0.2392157, 1,
-0.3109306, -1.00717, -2.099176, 0, 1, 0.2431373, 1,
-0.3066862, 0.01273506, -1.969163, 0, 1, 0.2509804, 1,
-0.2970565, 1.223126, 0.1501208, 0, 1, 0.254902, 1,
-0.2937205, -1.708632, -3.445198, 0, 1, 0.2627451, 1,
-0.2924533, -1.580371, -2.861655, 0, 1, 0.2666667, 1,
-0.2916636, -0.163391, -1.035406, 0, 1, 0.2745098, 1,
-0.2882913, 1.216459, 1.650243, 0, 1, 0.2784314, 1,
-0.2849933, -0.8473093, -4.205239, 0, 1, 0.2862745, 1,
-0.2835285, -1.573076, -2.143831, 0, 1, 0.2901961, 1,
-0.283382, -0.593859, -2.780338, 0, 1, 0.2980392, 1,
-0.2811686, -0.07133214, -0.2187209, 0, 1, 0.3058824, 1,
-0.2802892, -0.001438908, -2.150378, 0, 1, 0.3098039, 1,
-0.2785461, 0.2721462, -1.504471, 0, 1, 0.3176471, 1,
-0.2734112, -1.699916, -4.592562, 0, 1, 0.3215686, 1,
-0.2713865, 0.8632928, 0.02277876, 0, 1, 0.3294118, 1,
-0.2658805, -1.243644, -3.549183, 0, 1, 0.3333333, 1,
-0.2651286, 0.3256895, -0.7624878, 0, 1, 0.3411765, 1,
-0.2646873, -0.4941758, -1.524899, 0, 1, 0.345098, 1,
-0.2608801, 0.988394, -0.0866145, 0, 1, 0.3529412, 1,
-0.2604168, -1.883978, -3.534966, 0, 1, 0.3568628, 1,
-0.2554637, -0.06928363, -0.4467025, 0, 1, 0.3647059, 1,
-0.2501475, 0.4401394, 1.1417, 0, 1, 0.3686275, 1,
-0.2468583, -0.9275457, -2.444844, 0, 1, 0.3764706, 1,
-0.2461642, -1.054575, -2.943117, 0, 1, 0.3803922, 1,
-0.2446569, 1.507985, -0.5664935, 0, 1, 0.3882353, 1,
-0.2357773, 1.10092, 1.580317, 0, 1, 0.3921569, 1,
-0.2298104, -0.1304104, -1.991472, 0, 1, 0.4, 1,
-0.2285918, 0.05982998, -0.9144962, 0, 1, 0.4078431, 1,
-0.2254953, 2.088437, -1.147361, 0, 1, 0.4117647, 1,
-0.2225397, -1.443685, -2.431413, 0, 1, 0.4196078, 1,
-0.2217393, 2.061982, -0.790633, 0, 1, 0.4235294, 1,
-0.2198102, -0.4794758, -3.267269, 0, 1, 0.4313726, 1,
-0.2190947, -0.1415278, -3.585899, 0, 1, 0.4352941, 1,
-0.2176194, 0.4336285, -0.07369398, 0, 1, 0.4431373, 1,
-0.2159685, -0.5037731, -2.452547, 0, 1, 0.4470588, 1,
-0.2117366, 0.3817033, -0.3961682, 0, 1, 0.454902, 1,
-0.2096361, -0.4621924, -1.437399, 0, 1, 0.4588235, 1,
-0.2095352, 0.7967871, 1.107865, 0, 1, 0.4666667, 1,
-0.2041351, -0.7141887, -4.349086, 0, 1, 0.4705882, 1,
-0.2000624, -0.420134, -3.732644, 0, 1, 0.4784314, 1,
-0.1909859, 3.408437, 0.4842029, 0, 1, 0.4823529, 1,
-0.1894749, -2.178531, -3.378685, 0, 1, 0.4901961, 1,
-0.1816874, -0.9280989, -2.647595, 0, 1, 0.4941176, 1,
-0.1813945, -0.713848, -3.573393, 0, 1, 0.5019608, 1,
-0.1810493, -0.1506512, -2.866747, 0, 1, 0.509804, 1,
-0.1790273, -0.3006082, -4.031176, 0, 1, 0.5137255, 1,
-0.1773725, -0.6206487, -2.608364, 0, 1, 0.5215687, 1,
-0.1773238, -1.365855, -2.725489, 0, 1, 0.5254902, 1,
-0.1676564, 0.4070451, -0.4702383, 0, 1, 0.5333334, 1,
-0.1661593, -2.349518, -2.496196, 0, 1, 0.5372549, 1,
-0.1658198, 0.4224905, -0.7886943, 0, 1, 0.5450981, 1,
-0.1648924, 1.158117, -0.6703244, 0, 1, 0.5490196, 1,
-0.1643448, -0.2642003, -2.062515, 0, 1, 0.5568628, 1,
-0.1602506, 1.277483, 0.7851094, 0, 1, 0.5607843, 1,
-0.1593639, 0.3175984, -1.259388, 0, 1, 0.5686275, 1,
-0.154632, 1.689942, -0.7452018, 0, 1, 0.572549, 1,
-0.1519301, -0.2340177, -1.366546, 0, 1, 0.5803922, 1,
-0.1509732, 0.7061905, -1.021373, 0, 1, 0.5843138, 1,
-0.1493991, 0.7560233, -0.2673709, 0, 1, 0.5921569, 1,
-0.148395, 1.169607, 0.4627072, 0, 1, 0.5960785, 1,
-0.145324, -1.747556, -2.365655, 0, 1, 0.6039216, 1,
-0.1432749, -3.263677, -2.812793, 0, 1, 0.6117647, 1,
-0.1399727, 0.8191847, -0.5927818, 0, 1, 0.6156863, 1,
-0.1364524, 1.576013, -1.212281, 0, 1, 0.6235294, 1,
-0.1362142, -0.3153615, -2.465495, 0, 1, 0.627451, 1,
-0.1316098, -0.3349459, -3.059827, 0, 1, 0.6352941, 1,
-0.1302771, -0.4444382, -3.316708, 0, 1, 0.6392157, 1,
-0.1285346, 0.2706922, -1.159132, 0, 1, 0.6470588, 1,
-0.128378, 0.1631094, 1.127401, 0, 1, 0.6509804, 1,
-0.121416, 0.6417249, -3.157435, 0, 1, 0.6588235, 1,
-0.1213111, 0.7426078, -1.641347, 0, 1, 0.6627451, 1,
-0.1208054, -0.2082707, -1.497647, 0, 1, 0.6705883, 1,
-0.1188689, -1.511468, -3.598077, 0, 1, 0.6745098, 1,
-0.1168097, 0.9880613, -0.1106012, 0, 1, 0.682353, 1,
-0.1159021, -0.797971, -1.620106, 0, 1, 0.6862745, 1,
-0.1132112, 0.6571045, 1.196986, 0, 1, 0.6941177, 1,
-0.1085785, 0.4398457, 1.048649, 0, 1, 0.7019608, 1,
-0.1074481, -0.1285367, -2.695009, 0, 1, 0.7058824, 1,
-0.1061763, -1.463649, -3.906718, 0, 1, 0.7137255, 1,
-0.105681, -0.8866739, -3.98439, 0, 1, 0.7176471, 1,
-0.1012491, -0.7867476, -2.302704, 0, 1, 0.7254902, 1,
-0.1008727, -0.9972857, -0.8747336, 0, 1, 0.7294118, 1,
-0.09620507, -1.117034, -2.748827, 0, 1, 0.7372549, 1,
-0.09573114, 1.449237, -0.3304562, 0, 1, 0.7411765, 1,
-0.08836608, 0.9003853, -1.353046, 0, 1, 0.7490196, 1,
-0.08272574, -0.3104271, -2.422098, 0, 1, 0.7529412, 1,
-0.0822571, 1.105643, -1.179559, 0, 1, 0.7607843, 1,
-0.08218169, -0.5478224, -4.742346, 0, 1, 0.7647059, 1,
-0.08004151, 1.479905, -0.9911023, 0, 1, 0.772549, 1,
-0.07995551, 0.3463337, -0.08564851, 0, 1, 0.7764706, 1,
-0.07944393, -0.7817326, -1.779071, 0, 1, 0.7843137, 1,
-0.07494965, -0.9177735, -3.225225, 0, 1, 0.7882353, 1,
-0.07413892, -0.7503107, -2.038841, 0, 1, 0.7960784, 1,
-0.07107794, -0.0171524, -2.110393, 0, 1, 0.8039216, 1,
-0.06877249, 0.7234864, -0.3856269, 0, 1, 0.8078431, 1,
-0.06822654, 1.545545, 1.038627, 0, 1, 0.8156863, 1,
-0.06614325, -0.8285128, -3.69485, 0, 1, 0.8196079, 1,
-0.06395462, 0.208569, 2.067955, 0, 1, 0.827451, 1,
-0.0622672, -1.232976, -3.500818, 0, 1, 0.8313726, 1,
-0.06140422, -1.384494, -3.060123, 0, 1, 0.8392157, 1,
-0.05924215, -0.1469727, -2.595044, 0, 1, 0.8431373, 1,
-0.05838488, -0.2041008, -2.837459, 0, 1, 0.8509804, 1,
-0.05512062, -0.5685171, -3.680927, 0, 1, 0.854902, 1,
-0.04718915, -1.318524, -1.832541, 0, 1, 0.8627451, 1,
-0.04642856, -0.4887612, -4.104248, 0, 1, 0.8666667, 1,
-0.04639798, -0.4301153, -3.901894, 0, 1, 0.8745098, 1,
-0.04033071, 0.01721754, -2.068418, 0, 1, 0.8784314, 1,
-0.03828518, 0.4069955, 0.3028643, 0, 1, 0.8862745, 1,
-0.03796694, -0.4051352, -2.411507, 0, 1, 0.8901961, 1,
-0.03703234, 1.778789, 1.567181, 0, 1, 0.8980392, 1,
-0.02572112, -0.8555221, -1.020251, 0, 1, 0.9058824, 1,
-0.02459541, 1.212741, -0.07212141, 0, 1, 0.9098039, 1,
-0.02436855, -0.05143172, -2.420771, 0, 1, 0.9176471, 1,
-0.01968286, 0.7929289, -0.8722383, 0, 1, 0.9215686, 1,
-0.01759497, 0.3523994, 1.198565, 0, 1, 0.9294118, 1,
-0.01489627, 0.6706866, 0.5773817, 0, 1, 0.9333333, 1,
-0.01337866, 0.1758815, -0.5749584, 0, 1, 0.9411765, 1,
-0.01209522, -0.9836915, -4.079959, 0, 1, 0.945098, 1,
-0.01143717, 0.4845315, 0.3054227, 0, 1, 0.9529412, 1,
-0.01018601, -0.7744167, -4.572048, 0, 1, 0.9568627, 1,
-0.005984971, -0.3596736, -0.7302653, 0, 1, 0.9647059, 1,
2.275177e-05, 0.3802175, 1.13287, 0, 1, 0.9686275, 1,
0.001403717, -0.005310334, 2.65868, 0, 1, 0.9764706, 1,
0.001971988, 0.6764066, -0.3757686, 0, 1, 0.9803922, 1,
0.004810997, 0.9241866, -1.153716, 0, 1, 0.9882353, 1,
0.0113395, -1.430273, 3.655864, 0, 1, 0.9921569, 1,
0.01209938, 0.1877905, 1.744209, 0, 1, 1, 1,
0.01402092, 0.2643161, -2.135967, 0, 0.9921569, 1, 1,
0.0142283, -1.144358, 3.474542, 0, 0.9882353, 1, 1,
0.01776416, 0.8036604, 0.1349083, 0, 0.9803922, 1, 1,
0.01806666, -0.08027267, 4.701832, 0, 0.9764706, 1, 1,
0.02137276, 1.369827, 0.295133, 0, 0.9686275, 1, 1,
0.02349456, -0.8222032, 2.500728, 0, 0.9647059, 1, 1,
0.02556165, 0.3253992, -1.02649, 0, 0.9568627, 1, 1,
0.0271915, 0.8934917, 0.5471653, 0, 0.9529412, 1, 1,
0.03021631, -1.739575, 3.880402, 0, 0.945098, 1, 1,
0.03169529, 0.1856103, 1.044732, 0, 0.9411765, 1, 1,
0.04018537, -0.2979172, 3.200625, 0, 0.9333333, 1, 1,
0.04028492, -1.77904, 3.837112, 0, 0.9294118, 1, 1,
0.04207997, -0.6721064, 3.357777, 0, 0.9215686, 1, 1,
0.04229335, -0.3653242, 4.238825, 0, 0.9176471, 1, 1,
0.04416358, 0.4811558, -2.04178, 0, 0.9098039, 1, 1,
0.04508135, 2.864917, -0.9834949, 0, 0.9058824, 1, 1,
0.04646969, 0.04852854, 1.647479, 0, 0.8980392, 1, 1,
0.04781024, 0.2877209, -0.09717195, 0, 0.8901961, 1, 1,
0.05864321, -0.1240805, 4.058568, 0, 0.8862745, 1, 1,
0.06052088, -0.733978, 3.727629, 0, 0.8784314, 1, 1,
0.06434994, -2.075006, 4.723056, 0, 0.8745098, 1, 1,
0.06524552, 0.7031991, 2.162091, 0, 0.8666667, 1, 1,
0.06557097, -1.808724, 3.529326, 0, 0.8627451, 1, 1,
0.06952276, 0.2561557, 0.7987102, 0, 0.854902, 1, 1,
0.07240157, 1.878054, 0.4111055, 0, 0.8509804, 1, 1,
0.07540667, 0.686168, -0.8730666, 0, 0.8431373, 1, 1,
0.07714476, -1.906424, 3.902707, 0, 0.8392157, 1, 1,
0.07827756, 0.8405436, 2.274644, 0, 0.8313726, 1, 1,
0.08014084, -0.1825258, 2.893946, 0, 0.827451, 1, 1,
0.086004, -1.116963, 3.589028, 0, 0.8196079, 1, 1,
0.09304783, 1.004305, 0.7199609, 0, 0.8156863, 1, 1,
0.09713061, 1.004674, -0.5513391, 0, 0.8078431, 1, 1,
0.09888025, 0.6935251, -0.4701403, 0, 0.8039216, 1, 1,
0.1026864, 0.9473857, 0.9330869, 0, 0.7960784, 1, 1,
0.1028064, -1.121669, 1.520245, 0, 0.7882353, 1, 1,
0.1050497, 1.307753, 0.6537494, 0, 0.7843137, 1, 1,
0.1061497, 0.2542757, 1.154749, 0, 0.7764706, 1, 1,
0.1072938, 0.1821116, 2.45698, 0, 0.772549, 1, 1,
0.1088535, 0.1949824, 1.273726, 0, 0.7647059, 1, 1,
0.1128231, -0.5740842, 2.444431, 0, 0.7607843, 1, 1,
0.1129559, 0.1428361, -0.04477194, 0, 0.7529412, 1, 1,
0.1247997, -2.182158, 2.292537, 0, 0.7490196, 1, 1,
0.125219, -1.735377, 1.604274, 0, 0.7411765, 1, 1,
0.1258753, -2.24585, 1.18248, 0, 0.7372549, 1, 1,
0.1278692, 1.717306, -1.211082, 0, 0.7294118, 1, 1,
0.135731, -0.8865905, 3.091377, 0, 0.7254902, 1, 1,
0.1363856, 0.1924183, -0.5040826, 0, 0.7176471, 1, 1,
0.1402777, -0.6115122, 2.116609, 0, 0.7137255, 1, 1,
0.1415842, 0.5946931, 0.02117822, 0, 0.7058824, 1, 1,
0.1493671, 0.5544657, 0.2629241, 0, 0.6980392, 1, 1,
0.1497778, -0.3958904, 2.391944, 0, 0.6941177, 1, 1,
0.1499388, -0.01693508, 2.122751, 0, 0.6862745, 1, 1,
0.1534014, 1.335304, -0.2340641, 0, 0.682353, 1, 1,
0.1551604, -0.08384352, 2.335348, 0, 0.6745098, 1, 1,
0.1566844, 1.061768, -0.4304127, 0, 0.6705883, 1, 1,
0.1607783, 0.1484237, 0.873041, 0, 0.6627451, 1, 1,
0.1649809, 1.279289, -0.2280084, 0, 0.6588235, 1, 1,
0.1663752, 1.245914, 0.082872, 0, 0.6509804, 1, 1,
0.1664905, -1.213439, 4.257252, 0, 0.6470588, 1, 1,
0.1670554, -0.4400329, 3.688699, 0, 0.6392157, 1, 1,
0.1679168, 1.345205, 2.193951, 0, 0.6352941, 1, 1,
0.1687633, -0.224305, 2.911056, 0, 0.627451, 1, 1,
0.1709678, -0.008613518, 1.298187, 0, 0.6235294, 1, 1,
0.171014, -1.809486, 3.145803, 0, 0.6156863, 1, 1,
0.1716047, 2.165256, -0.4822351, 0, 0.6117647, 1, 1,
0.1750794, -0.02503386, 1.324525, 0, 0.6039216, 1, 1,
0.1781342, 0.9344194, -0.7813276, 0, 0.5960785, 1, 1,
0.1796197, -0.559651, 0.5109553, 0, 0.5921569, 1, 1,
0.1797126, -1.435735, 3.131302, 0, 0.5843138, 1, 1,
0.1802726, -0.6355546, 3.537462, 0, 0.5803922, 1, 1,
0.1848069, -2.171247, 2.580586, 0, 0.572549, 1, 1,
0.1880323, -0.1977578, 3.980176, 0, 0.5686275, 1, 1,
0.1893672, -0.1250087, 3.970922, 0, 0.5607843, 1, 1,
0.1936892, 0.9219432, 0.9222562, 0, 0.5568628, 1, 1,
0.1941018, 1.970665, 0.7196704, 0, 0.5490196, 1, 1,
0.1941786, -0.4010528, 1.517472, 0, 0.5450981, 1, 1,
0.1949414, 2.41981, 0.8078705, 0, 0.5372549, 1, 1,
0.1988149, 0.1225402, 2.310169, 0, 0.5333334, 1, 1,
0.1995451, -0.3723253, 3.021301, 0, 0.5254902, 1, 1,
0.2023685, -0.9861317, 3.204041, 0, 0.5215687, 1, 1,
0.2049844, 0.05301563, 1.48105, 0, 0.5137255, 1, 1,
0.2088125, 0.6956477, -0.2531114, 0, 0.509804, 1, 1,
0.2090569, -1.708485, 1.632016, 0, 0.5019608, 1, 1,
0.2099952, -0.1752391, 3.543917, 0, 0.4941176, 1, 1,
0.2122793, -0.02730824, 0.6982508, 0, 0.4901961, 1, 1,
0.2147841, 0.3716804, -0.8512338, 0, 0.4823529, 1, 1,
0.216256, -0.06182062, 1.304767, 0, 0.4784314, 1, 1,
0.2204778, 1.461539, 0.2095796, 0, 0.4705882, 1, 1,
0.2243015, 0.6975042, -0.2045218, 0, 0.4666667, 1, 1,
0.2251991, 1.149415, 2.184436, 0, 0.4588235, 1, 1,
0.2272011, 0.6886325, 0.7645679, 0, 0.454902, 1, 1,
0.2313492, 0.6538239, -0.06569077, 0, 0.4470588, 1, 1,
0.2337397, 1.626354, 0.7718322, 0, 0.4431373, 1, 1,
0.2349066, -1.872964, 3.096259, 0, 0.4352941, 1, 1,
0.2353794, 0.8894719, -0.3825923, 0, 0.4313726, 1, 1,
0.2386992, 0.6652212, 1.765299, 0, 0.4235294, 1, 1,
0.2407409, 0.06720712, 3.139922, 0, 0.4196078, 1, 1,
0.245204, 0.8230948, 2.035695, 0, 0.4117647, 1, 1,
0.2460695, 0.06460985, 1.456182, 0, 0.4078431, 1, 1,
0.2486301, -0.5550424, 1.164356, 0, 0.4, 1, 1,
0.250004, -0.1846157, 1.60805, 0, 0.3921569, 1, 1,
0.2501968, 1.577887, -0.6568465, 0, 0.3882353, 1, 1,
0.2504615, 0.09265812, 2.966881, 0, 0.3803922, 1, 1,
0.2530652, 0.3102318, 0.12536, 0, 0.3764706, 1, 1,
0.2543365, -0.6228176, 1.899983, 0, 0.3686275, 1, 1,
0.2596331, -1.925784, 2.344346, 0, 0.3647059, 1, 1,
0.2597194, 0.4881132, 2.165555, 0, 0.3568628, 1, 1,
0.2614328, -0.5217541, 3.042371, 0, 0.3529412, 1, 1,
0.2671872, 0.3226773, 1.171799, 0, 0.345098, 1, 1,
0.2674238, -0.9015306, 2.054349, 0, 0.3411765, 1, 1,
0.2701194, 0.07420827, -0.004261335, 0, 0.3333333, 1, 1,
0.2739201, -0.8021188, 2.196157, 0, 0.3294118, 1, 1,
0.2770228, -0.3484075, 0.9688953, 0, 0.3215686, 1, 1,
0.2846125, 0.8249719, 0.3758113, 0, 0.3176471, 1, 1,
0.2865582, 0.4699067, -1.384819, 0, 0.3098039, 1, 1,
0.2882478, -0.01649143, 2.638383, 0, 0.3058824, 1, 1,
0.2889628, -0.7991776, 2.3949, 0, 0.2980392, 1, 1,
0.2916411, 0.5065307, 0.0984938, 0, 0.2901961, 1, 1,
0.2922244, 1.144828, 1.639815, 0, 0.2862745, 1, 1,
0.2935192, -1.80054, 4.057936, 0, 0.2784314, 1, 1,
0.3022791, -0.1816014, 1.739874, 0, 0.2745098, 1, 1,
0.3040288, 1.365063, 0.2867404, 0, 0.2666667, 1, 1,
0.3043819, 0.1283006, 0.1496563, 0, 0.2627451, 1, 1,
0.3050355, -0.3479503, 2.630389, 0, 0.254902, 1, 1,
0.306262, -1.399966, 3.980997, 0, 0.2509804, 1, 1,
0.3075597, 1.150163, -0.6622207, 0, 0.2431373, 1, 1,
0.3088299, 1.49642, 1.906403, 0, 0.2392157, 1, 1,
0.3092346, -0.1094213, 1.757879, 0, 0.2313726, 1, 1,
0.3116637, 0.9810214, 2.184874, 0, 0.227451, 1, 1,
0.3119261, -0.7529436, 1.778054, 0, 0.2196078, 1, 1,
0.3184642, 0.5118607, 0.6847809, 0, 0.2156863, 1, 1,
0.3193613, -0.3335281, 1.202719, 0, 0.2078431, 1, 1,
0.3221776, -1.206015, 0.8324617, 0, 0.2039216, 1, 1,
0.326168, -0.2587198, 1.992426, 0, 0.1960784, 1, 1,
0.3279977, -0.3369938, 2.331027, 0, 0.1882353, 1, 1,
0.3336034, -0.6703051, 2.004074, 0, 0.1843137, 1, 1,
0.3340454, 0.9144546, 0.798441, 0, 0.1764706, 1, 1,
0.3351577, -2.986824, 3.551013, 0, 0.172549, 1, 1,
0.3377947, -0.09284096, 1.849231, 0, 0.1647059, 1, 1,
0.3378431, 2.317717, 1.116708, 0, 0.1607843, 1, 1,
0.3386843, -0.5478593, 2.167591, 0, 0.1529412, 1, 1,
0.3398459, -0.1912293, 3.446438, 0, 0.1490196, 1, 1,
0.341339, -0.5582666, 2.450447, 0, 0.1411765, 1, 1,
0.3421002, 0.1610339, -0.5702584, 0, 0.1372549, 1, 1,
0.342481, 0.0007320298, 1.342469, 0, 0.1294118, 1, 1,
0.3431771, -1.555597, 2.646701, 0, 0.1254902, 1, 1,
0.3483123, -0.01286171, 1.723327, 0, 0.1176471, 1, 1,
0.3509886, -0.2843717, 2.695969, 0, 0.1137255, 1, 1,
0.3547316, -0.6391407, 3.200119, 0, 0.1058824, 1, 1,
0.362643, 0.483241, 1.414041, 0, 0.09803922, 1, 1,
0.3646963, 0.5376833, -0.3007405, 0, 0.09411765, 1, 1,
0.3675404, 0.1213322, 1.078482, 0, 0.08627451, 1, 1,
0.3692265, -0.1982845, 1.150777, 0, 0.08235294, 1, 1,
0.3701697, 0.1080075, 2.459833, 0, 0.07450981, 1, 1,
0.3703277, -0.06770054, 2.239785, 0, 0.07058824, 1, 1,
0.372647, 0.8610379, 1.51294, 0, 0.0627451, 1, 1,
0.3733155, 0.4099436, 0.5358239, 0, 0.05882353, 1, 1,
0.3753729, -0.607183, 3.269316, 0, 0.05098039, 1, 1,
0.3803494, -0.3150857, 2.035517, 0, 0.04705882, 1, 1,
0.3808951, 0.7304719, 0.4730171, 0, 0.03921569, 1, 1,
0.3903591, 0.6145903, -0.5532077, 0, 0.03529412, 1, 1,
0.391191, 0.2236672, 0.3746373, 0, 0.02745098, 1, 1,
0.391192, -0.7643739, 0.3590138, 0, 0.02352941, 1, 1,
0.392825, -0.7941579, 4.1777, 0, 0.01568628, 1, 1,
0.3942283, -1.700516, 1.503013, 0, 0.01176471, 1, 1,
0.4007421, -0.8218642, 2.179282, 0, 0.003921569, 1, 1,
0.4008879, -1.167481, 3.516665, 0.003921569, 0, 1, 1,
0.4025982, 0.8712242, 1.722049, 0.007843138, 0, 1, 1,
0.4059458, 1.120033, -1.341068, 0.01568628, 0, 1, 1,
0.4062768, -0.7214664, 2.250588, 0.01960784, 0, 1, 1,
0.4172944, -1.346343, 2.152112, 0.02745098, 0, 1, 1,
0.4258175, -0.1547522, 0.9668946, 0.03137255, 0, 1, 1,
0.4264383, -0.4518998, -0.7667118, 0.03921569, 0, 1, 1,
0.4273425, -1.282837, 3.913978, 0.04313726, 0, 1, 1,
0.4316131, 0.6307501, 1.322059, 0.05098039, 0, 1, 1,
0.4328495, -0.8233346, 4.17331, 0.05490196, 0, 1, 1,
0.4344658, 0.9232616, -0.08684128, 0.0627451, 0, 1, 1,
0.4388892, 1.004757, -0.302695, 0.06666667, 0, 1, 1,
0.4391008, -0.3815016, 2.184279, 0.07450981, 0, 1, 1,
0.4404214, -0.9964514, 2.581646, 0.07843138, 0, 1, 1,
0.4457204, -0.6681508, 1.007228, 0.08627451, 0, 1, 1,
0.45135, -0.01986327, 0.7162642, 0.09019608, 0, 1, 1,
0.4579631, 0.4678657, 1.821066, 0.09803922, 0, 1, 1,
0.4592558, -0.4286648, 1.890538, 0.1058824, 0, 1, 1,
0.4593218, -0.417108, 3.430368, 0.1098039, 0, 1, 1,
0.4627108, 1.438483, 0.6442252, 0.1176471, 0, 1, 1,
0.4673911, -0.2954162, 1.828524, 0.1215686, 0, 1, 1,
0.4709447, -0.1742504, 3.521136, 0.1294118, 0, 1, 1,
0.4768097, -0.7738299, 1.347999, 0.1333333, 0, 1, 1,
0.4773206, -0.682458, 2.696061, 0.1411765, 0, 1, 1,
0.4775128, 0.07174401, 3.143271, 0.145098, 0, 1, 1,
0.4835408, -0.9038057, 2.596057, 0.1529412, 0, 1, 1,
0.4877676, 0.77911, 0.5608527, 0.1568628, 0, 1, 1,
0.495438, -1.354142, 3.647125, 0.1647059, 0, 1, 1,
0.49832, 0.2319318, 0.7366564, 0.1686275, 0, 1, 1,
0.5096457, 0.4355218, 1.12649, 0.1764706, 0, 1, 1,
0.5118383, -0.1005223, 1.264111, 0.1803922, 0, 1, 1,
0.515705, 1.201608, -0.3283106, 0.1882353, 0, 1, 1,
0.5199059, 0.8380736, 0.3492958, 0.1921569, 0, 1, 1,
0.5264176, 1.042909, 2.086903, 0.2, 0, 1, 1,
0.5343387, -1.304724, 2.286225, 0.2078431, 0, 1, 1,
0.5378814, 0.301715, 1.165061, 0.2117647, 0, 1, 1,
0.5390424, 0.8789439, 0.6780519, 0.2196078, 0, 1, 1,
0.5393062, -1.149879, 2.33268, 0.2235294, 0, 1, 1,
0.541733, -0.2150304, 0.4677121, 0.2313726, 0, 1, 1,
0.5443704, -1.096093, 2.603326, 0.2352941, 0, 1, 1,
0.5453545, -0.6576612, 0.5014946, 0.2431373, 0, 1, 1,
0.5487525, 0.4828395, -0.7054117, 0.2470588, 0, 1, 1,
0.5520792, -0.3971093, 2.339714, 0.254902, 0, 1, 1,
0.5545794, 0.9163314, 2.235476, 0.2588235, 0, 1, 1,
0.5546952, -1.586013, 3.397545, 0.2666667, 0, 1, 1,
0.5687196, -1.050778, 1.710054, 0.2705882, 0, 1, 1,
0.5748366, 0.2836304, -0.7524675, 0.2784314, 0, 1, 1,
0.5763029, 1.390959, -0.2258836, 0.282353, 0, 1, 1,
0.5776052, -2.002399, 2.623843, 0.2901961, 0, 1, 1,
0.5789845, 1.670498, 0.1714778, 0.2941177, 0, 1, 1,
0.579635, -0.5491866, 3.506909, 0.3019608, 0, 1, 1,
0.5797935, 0.3476531, 1.607393, 0.3098039, 0, 1, 1,
0.5808522, 1.136452, 0.5975832, 0.3137255, 0, 1, 1,
0.582774, -0.09587129, 1.419731, 0.3215686, 0, 1, 1,
0.5856969, -1.254381, 2.024615, 0.3254902, 0, 1, 1,
0.5899878, 0.6568075, 1.289731, 0.3333333, 0, 1, 1,
0.5977469, 0.9900956, -1.012424, 0.3372549, 0, 1, 1,
0.5996273, 1.863591, -0.009902571, 0.345098, 0, 1, 1,
0.6073406, -0.1655168, 1.432817, 0.3490196, 0, 1, 1,
0.6080407, -0.01752315, -0.5385388, 0.3568628, 0, 1, 1,
0.6141484, -0.05580177, 0.616951, 0.3607843, 0, 1, 1,
0.6178858, 0.1070354, 3.273539, 0.3686275, 0, 1, 1,
0.6179348, 0.02914892, 1.590394, 0.372549, 0, 1, 1,
0.6192988, -2.327644, 3.281135, 0.3803922, 0, 1, 1,
0.6248912, 1.075952, -1.338967, 0.3843137, 0, 1, 1,
0.6259804, -0.3722069, 1.44029, 0.3921569, 0, 1, 1,
0.626547, 0.7349946, 0.7891392, 0.3960784, 0, 1, 1,
0.6273131, -0.8318834, 3.566547, 0.4039216, 0, 1, 1,
0.6353649, -1.489431, 1.862435, 0.4117647, 0, 1, 1,
0.6407222, -0.698131, -0.1764083, 0.4156863, 0, 1, 1,
0.6429755, 0.6234565, -0.6051455, 0.4235294, 0, 1, 1,
0.6452057, -0.9208544, 5.149694, 0.427451, 0, 1, 1,
0.648474, -0.4520646, 2.766754, 0.4352941, 0, 1, 1,
0.6511829, 1.024662, 2.365402, 0.4392157, 0, 1, 1,
0.6542908, -1.251611, 2.565141, 0.4470588, 0, 1, 1,
0.6547371, 0.5040688, 0.9405956, 0.4509804, 0, 1, 1,
0.6729067, 1.039608, 0.5925344, 0.4588235, 0, 1, 1,
0.6732761, -1.58748, 3.725768, 0.4627451, 0, 1, 1,
0.6735004, 0.05818632, 2.078181, 0.4705882, 0, 1, 1,
0.6739684, 0.1679332, 2.892543, 0.4745098, 0, 1, 1,
0.6763744, 1.261887, 1.521412, 0.4823529, 0, 1, 1,
0.6778738, 0.3236685, -0.1258134, 0.4862745, 0, 1, 1,
0.6782122, -0.6552497, 2.482533, 0.4941176, 0, 1, 1,
0.6849276, 0.9872667, 0.1630141, 0.5019608, 0, 1, 1,
0.690714, -1.082203, 2.086044, 0.5058824, 0, 1, 1,
0.6939576, -1.724135, 2.646587, 0.5137255, 0, 1, 1,
0.6945208, 0.6271712, 0.6012816, 0.5176471, 0, 1, 1,
0.695386, -1.935668, 2.125756, 0.5254902, 0, 1, 1,
0.6971988, -1.036656, 1.903121, 0.5294118, 0, 1, 1,
0.6982235, -0.3603306, 1.462892, 0.5372549, 0, 1, 1,
0.6987702, 0.6822048, 1.649329, 0.5411765, 0, 1, 1,
0.7011992, 0.685142, 0.0429801, 0.5490196, 0, 1, 1,
0.7039163, 0.3564127, 1.076294, 0.5529412, 0, 1, 1,
0.7079139, 0.6750396, 0.4728243, 0.5607843, 0, 1, 1,
0.7109026, -0.2097571, 2.076641, 0.5647059, 0, 1, 1,
0.7116628, -1.280437, 2.190183, 0.572549, 0, 1, 1,
0.7161517, 0.3249002, 0.7960322, 0.5764706, 0, 1, 1,
0.7206913, -0.7746858, 1.799566, 0.5843138, 0, 1, 1,
0.720718, -0.3475165, 2.260771, 0.5882353, 0, 1, 1,
0.7293214, -0.7084046, 1.96727, 0.5960785, 0, 1, 1,
0.7295098, 0.03076859, 0.8365769, 0.6039216, 0, 1, 1,
0.7318155, 0.6584025, -0.1766131, 0.6078432, 0, 1, 1,
0.7403707, 0.02468901, 0.9998599, 0.6156863, 0, 1, 1,
0.7419595, 1.943169, 2.172426, 0.6196079, 0, 1, 1,
0.7427756, -0.297765, 1.472762, 0.627451, 0, 1, 1,
0.7485529, -1.15949, 1.602802, 0.6313726, 0, 1, 1,
0.7556483, -1.522685, 3.255032, 0.6392157, 0, 1, 1,
0.7641682, 0.5703244, 2.081877, 0.6431373, 0, 1, 1,
0.7666381, 0.4394553, 0.5677186, 0.6509804, 0, 1, 1,
0.7674409, 1.658765, 0.4265132, 0.654902, 0, 1, 1,
0.7678592, 0.5321054, -0.1596606, 0.6627451, 0, 1, 1,
0.7688532, -1.088585, 3.357214, 0.6666667, 0, 1, 1,
0.7696521, -0.7208719, 1.701312, 0.6745098, 0, 1, 1,
0.7704509, 0.3952102, 1.464808, 0.6784314, 0, 1, 1,
0.7734798, -0.9410661, 3.24438, 0.6862745, 0, 1, 1,
0.7837313, -0.9896207, 2.356582, 0.6901961, 0, 1, 1,
0.7838942, 1.379725, 0.4756576, 0.6980392, 0, 1, 1,
0.7894017, -0.6075929, 1.793217, 0.7058824, 0, 1, 1,
0.7919106, 1.244265, 0.995247, 0.7098039, 0, 1, 1,
0.7951328, -1.893018, 3.193386, 0.7176471, 0, 1, 1,
0.7963976, -1.110323, 2.538327, 0.7215686, 0, 1, 1,
0.800782, 0.8051174, 2.787075, 0.7294118, 0, 1, 1,
0.810773, -0.3539688, 1.414347, 0.7333333, 0, 1, 1,
0.8131204, 0.7002655, -1.098135, 0.7411765, 0, 1, 1,
0.8210329, -0.284465, 5.024989, 0.7450981, 0, 1, 1,
0.8247617, -0.5136563, 2.687709, 0.7529412, 0, 1, 1,
0.828954, 1.148625, -0.0266193, 0.7568628, 0, 1, 1,
0.8321967, 0.09072582, 0.966253, 0.7647059, 0, 1, 1,
0.8397964, 1.079035, 1.542329, 0.7686275, 0, 1, 1,
0.8399938, -0.471373, 1.183342, 0.7764706, 0, 1, 1,
0.8462909, -0.860095, 0.7598048, 0.7803922, 0, 1, 1,
0.8479065, 0.1836129, 0.8065835, 0.7882353, 0, 1, 1,
0.848991, -1.492741, 1.640915, 0.7921569, 0, 1, 1,
0.8533512, 0.2782655, 0.2024073, 0.8, 0, 1, 1,
0.8537482, -1.131318, 2.702137, 0.8078431, 0, 1, 1,
0.8553389, 0.647494, -0.1209811, 0.8117647, 0, 1, 1,
0.858402, 0.04316745, 1.888865, 0.8196079, 0, 1, 1,
0.8587588, -0.8714935, 1.641229, 0.8235294, 0, 1, 1,
0.8640715, 0.2537869, 0.826591, 0.8313726, 0, 1, 1,
0.8670146, 0.4428264, 1.37694, 0.8352941, 0, 1, 1,
0.8745595, 1.541086, 2.14779, 0.8431373, 0, 1, 1,
0.8752347, 0.7929774, 1.538653, 0.8470588, 0, 1, 1,
0.8779166, 0.1267864, 2.824065, 0.854902, 0, 1, 1,
0.882244, 2.208999, 1.328804, 0.8588235, 0, 1, 1,
0.8835934, 1.010014, 0.5413927, 0.8666667, 0, 1, 1,
0.8840401, -0.5221987, 2.179321, 0.8705882, 0, 1, 1,
0.8847047, 1.050855, 1.195843, 0.8784314, 0, 1, 1,
0.8857237, 0.0442922, 1.994611, 0.8823529, 0, 1, 1,
0.9135401, -0.7119532, 2.492096, 0.8901961, 0, 1, 1,
0.9153624, -0.4714514, 1.021377, 0.8941177, 0, 1, 1,
0.9169033, -0.5619127, 1.7519, 0.9019608, 0, 1, 1,
0.9266964, -1.077337, 0.9195486, 0.9098039, 0, 1, 1,
0.9301447, -0.6267967, 2.503098, 0.9137255, 0, 1, 1,
0.9319056, -0.1835909, -0.5286155, 0.9215686, 0, 1, 1,
0.9368024, -0.4399296, 2.909821, 0.9254902, 0, 1, 1,
0.9459007, -1.291769, 2.347486, 0.9333333, 0, 1, 1,
0.9466566, 0.6956888, 0.2890948, 0.9372549, 0, 1, 1,
0.9476371, 0.1845104, 1.902033, 0.945098, 0, 1, 1,
0.9580352, -1.499876, 2.775583, 0.9490196, 0, 1, 1,
0.9583699, 0.1984422, 1.159215, 0.9568627, 0, 1, 1,
0.9589049, 1.37884, 1.859138, 0.9607843, 0, 1, 1,
0.9623005, -1.245374, 2.320073, 0.9686275, 0, 1, 1,
0.9628337, 0.2487026, 1.539478, 0.972549, 0, 1, 1,
0.9749749, 0.3391266, 3.631534, 0.9803922, 0, 1, 1,
0.9789724, -0.6933347, 2.275588, 0.9843137, 0, 1, 1,
0.9849517, 0.5780974, 1.773009, 0.9921569, 0, 1, 1,
0.9881809, 1.364726, 1.886899, 0.9960784, 0, 1, 1,
0.990046, 0.4746811, 0.4192724, 1, 0, 0.9960784, 1,
0.9902239, 0.05407638, 1.750501, 1, 0, 0.9882353, 1,
0.9902663, 2.312327, 2.966528, 1, 0, 0.9843137, 1,
0.9925166, 0.1898905, 2.38011, 1, 0, 0.9764706, 1,
1.00405, -0.3172647, 1.950013, 1, 0, 0.972549, 1,
1.008913, -0.03772528, 1.315262, 1, 0, 0.9647059, 1,
1.010816, -1.320121, 3.079612, 1, 0, 0.9607843, 1,
1.020524, 0.08503364, 1.535243, 1, 0, 0.9529412, 1,
1.022439, 0.6979488, 1.62557, 1, 0, 0.9490196, 1,
1.026726, -1.075722, 1.495489, 1, 0, 0.9411765, 1,
1.027907, 1.211006, -0.8893967, 1, 0, 0.9372549, 1,
1.031233, 0.883666, 1.023235, 1, 0, 0.9294118, 1,
1.031515, -0.4580969, 2.012277, 1, 0, 0.9254902, 1,
1.043886, 0.8198816, 1.702698, 1, 0, 0.9176471, 1,
1.051411, 1.891247, 1.592263, 1, 0, 0.9137255, 1,
1.055361, 0.3939623, 1.265411, 1, 0, 0.9058824, 1,
1.055489, -1.466812, 0.2721481, 1, 0, 0.9019608, 1,
1.059113, -0.3185875, 0.9868829, 1, 0, 0.8941177, 1,
1.060104, -0.8404409, 1.413255, 1, 0, 0.8862745, 1,
1.060605, -0.3226022, 1.648593, 1, 0, 0.8823529, 1,
1.070318, 0.4512617, 0.7916586, 1, 0, 0.8745098, 1,
1.071627, 1.504408, 1.942613, 1, 0, 0.8705882, 1,
1.073742, -2.40468, 3.084513, 1, 0, 0.8627451, 1,
1.074484, 0.5481079, -0.2065537, 1, 0, 0.8588235, 1,
1.075202, 0.1479684, -0.5514542, 1, 0, 0.8509804, 1,
1.081633, -0.701192, 1.771316, 1, 0, 0.8470588, 1,
1.085526, -1.171932, 0.6732283, 1, 0, 0.8392157, 1,
1.086428, -0.6373872, 1.065111, 1, 0, 0.8352941, 1,
1.087031, 0.6729789, 1.701876, 1, 0, 0.827451, 1,
1.091454, 0.8251938, 1.162129, 1, 0, 0.8235294, 1,
1.095759, 2.204491, -0.5898095, 1, 0, 0.8156863, 1,
1.102041, 1.720727, 0.4928063, 1, 0, 0.8117647, 1,
1.111705, -0.9792109, 2.524764, 1, 0, 0.8039216, 1,
1.116189, 0.01140424, 2.573825, 1, 0, 0.7960784, 1,
1.122929, -1.584159, 2.930439, 1, 0, 0.7921569, 1,
1.129668, -1.458154, 2.713623, 1, 0, 0.7843137, 1,
1.131055, 1.230679, -0.5314202, 1, 0, 0.7803922, 1,
1.138635, 2.001905, -0.3336108, 1, 0, 0.772549, 1,
1.138804, 0.6237374, 0.9734067, 1, 0, 0.7686275, 1,
1.141614, -2.446381, 3.498745, 1, 0, 0.7607843, 1,
1.143533, 0.1067092, 0.09480773, 1, 0, 0.7568628, 1,
1.148089, -1.401034, 1.490285, 1, 0, 0.7490196, 1,
1.152295, 1.23878, 1.440633, 1, 0, 0.7450981, 1,
1.15573, 1.901581, -0.2144431, 1, 0, 0.7372549, 1,
1.155934, 0.113886, -1.140325, 1, 0, 0.7333333, 1,
1.170589, -0.1615066, 2.203291, 1, 0, 0.7254902, 1,
1.171764, 1.818916, 0.8739722, 1, 0, 0.7215686, 1,
1.181323, 1.097553, 2.177349, 1, 0, 0.7137255, 1,
1.193727, 1.505176, 0.3810652, 1, 0, 0.7098039, 1,
1.196915, -1.189319, 3.893259, 1, 0, 0.7019608, 1,
1.19934, -0.2030685, 1.03671, 1, 0, 0.6941177, 1,
1.213191, 1.944616, 0.2743027, 1, 0, 0.6901961, 1,
1.215023, 1.973703, 0.684914, 1, 0, 0.682353, 1,
1.220012, 0.09687412, 1.715032, 1, 0, 0.6784314, 1,
1.240596, -1.047484, 2.134008, 1, 0, 0.6705883, 1,
1.241507, -0.9774386, 2.240597, 1, 0, 0.6666667, 1,
1.250443, -0.2055341, -0.1591775, 1, 0, 0.6588235, 1,
1.261389, 0.1634237, 0.9978282, 1, 0, 0.654902, 1,
1.265299, -1.423497, 0.7210703, 1, 0, 0.6470588, 1,
1.275444, -2.327657, 0.9918554, 1, 0, 0.6431373, 1,
1.276286, 1.433966, 1.982755, 1, 0, 0.6352941, 1,
1.28122, 0.1578821, 1.212285, 1, 0, 0.6313726, 1,
1.290397, 1.006339, -0.02933131, 1, 0, 0.6235294, 1,
1.305104, 0.3545699, -0.8792244, 1, 0, 0.6196079, 1,
1.312764, -0.2416074, 2.810826, 1, 0, 0.6117647, 1,
1.314888, -0.1782416, 0.9623658, 1, 0, 0.6078432, 1,
1.331964, 0.577264, 0.08266737, 1, 0, 0.6, 1,
1.333806, 1.161057, 0.6016414, 1, 0, 0.5921569, 1,
1.334935, -0.6289665, 1.898112, 1, 0, 0.5882353, 1,
1.338886, -0.01928133, -0.3263888, 1, 0, 0.5803922, 1,
1.339971, 0.7506939, 1.078129, 1, 0, 0.5764706, 1,
1.352039, -0.3539202, 2.418977, 1, 0, 0.5686275, 1,
1.364256, 1.362974, 0.7417064, 1, 0, 0.5647059, 1,
1.366949, 0.6982948, 0.6162803, 1, 0, 0.5568628, 1,
1.372073, 0.9957807, -0.6508859, 1, 0, 0.5529412, 1,
1.373792, -0.224299, 2.743131, 1, 0, 0.5450981, 1,
1.374094, 0.3573362, 2.587764, 1, 0, 0.5411765, 1,
1.381458, 1.28358, 0.870792, 1, 0, 0.5333334, 1,
1.393845, -0.3586272, 0.9155846, 1, 0, 0.5294118, 1,
1.412248, -1.102383, 1.470638, 1, 0, 0.5215687, 1,
1.413768, 2.562394, -0.9831165, 1, 0, 0.5176471, 1,
1.418513, -0.5894504, 2.43856, 1, 0, 0.509804, 1,
1.420324, 0.08353116, 2.4509, 1, 0, 0.5058824, 1,
1.421703, -1.386828, 3.286753, 1, 0, 0.4980392, 1,
1.43221, -0.4484089, 1.630689, 1, 0, 0.4901961, 1,
1.432574, 1.595068, -1.550339, 1, 0, 0.4862745, 1,
1.434469, -0.4112368, 0.05868414, 1, 0, 0.4784314, 1,
1.436853, 0.5087125, 1.867929, 1, 0, 0.4745098, 1,
1.448751, 0.6408436, 1.324001, 1, 0, 0.4666667, 1,
1.464033, -0.2881038, 1.702381, 1, 0, 0.4627451, 1,
1.472919, 0.2609552, 2.174934, 1, 0, 0.454902, 1,
1.476508, -0.750841, 1.652291, 1, 0, 0.4509804, 1,
1.480989, 1.058521, 1.73999, 1, 0, 0.4431373, 1,
1.500707, 0.2872712, 1.45118, 1, 0, 0.4392157, 1,
1.504183, -0.2702344, 0.8934665, 1, 0, 0.4313726, 1,
1.512264, -0.09994955, 1.940219, 1, 0, 0.427451, 1,
1.515272, -0.2773196, 2.52493, 1, 0, 0.4196078, 1,
1.528483, 0.6422851, 1.809263, 1, 0, 0.4156863, 1,
1.52932, 0.9242198, 0.5248179, 1, 0, 0.4078431, 1,
1.535053, 0.1753666, 1.012835, 1, 0, 0.4039216, 1,
1.539337, -1.247632, 2.298431, 1, 0, 0.3960784, 1,
1.552127, -0.6328069, 0.8469943, 1, 0, 0.3882353, 1,
1.555717, -1.542205, 0.2122599, 1, 0, 0.3843137, 1,
1.557253, 1.745678, -0.6820084, 1, 0, 0.3764706, 1,
1.567305, -0.7439756, 2.617172, 1, 0, 0.372549, 1,
1.57958, -1.164094, 1.448426, 1, 0, 0.3647059, 1,
1.602887, -0.909429, 2.932093, 1, 0, 0.3607843, 1,
1.607674, 0.9348084, -0.08462703, 1, 0, 0.3529412, 1,
1.608637, 0.3823206, 1.05411, 1, 0, 0.3490196, 1,
1.625206, 0.1566075, 2.023994, 1, 0, 0.3411765, 1,
1.63959, -0.5258185, 3.058234, 1, 0, 0.3372549, 1,
1.640384, -0.5512676, 0.3527347, 1, 0, 0.3294118, 1,
1.645691, 1.30075, -0.4287934, 1, 0, 0.3254902, 1,
1.656571, 1.225899, -0.17395, 1, 0, 0.3176471, 1,
1.657021, 0.4523735, -0.4897949, 1, 0, 0.3137255, 1,
1.675804, 1.324748, 1.270429, 1, 0, 0.3058824, 1,
1.688748, 0.6351532, 1.618069, 1, 0, 0.2980392, 1,
1.71158, -0.2671211, 0.8800754, 1, 0, 0.2941177, 1,
1.716951, 0.6353516, -0.7386796, 1, 0, 0.2862745, 1,
1.750961, 0.01147201, 1.132267, 1, 0, 0.282353, 1,
1.754479, -0.5624287, 3.137342, 1, 0, 0.2745098, 1,
1.762509, -1.403841, 2.357848, 1, 0, 0.2705882, 1,
1.765337, 1.569869, -0.08837808, 1, 0, 0.2627451, 1,
1.769164, 0.4701872, 1.027865, 1, 0, 0.2588235, 1,
1.773102, -0.8686611, 0.6682255, 1, 0, 0.2509804, 1,
1.78048, 0.1765376, 1.552371, 1, 0, 0.2470588, 1,
1.793827, 0.3908005, 1.548025, 1, 0, 0.2392157, 1,
1.797742, -0.4183266, -0.1135386, 1, 0, 0.2352941, 1,
1.801512, -0.4570975, 2.95228, 1, 0, 0.227451, 1,
1.803363, -0.9421609, 3.538349, 1, 0, 0.2235294, 1,
1.809627, -0.5619575, 2.128295, 1, 0, 0.2156863, 1,
1.83691, -0.127386, 1.800096, 1, 0, 0.2117647, 1,
1.857903, -0.979194, 2.25333, 1, 0, 0.2039216, 1,
1.899579, -0.5774062, 3.307462, 1, 0, 0.1960784, 1,
1.916019, 0.5884454, 3.609429, 1, 0, 0.1921569, 1,
1.916209, -0.7445487, 3.954838, 1, 0, 0.1843137, 1,
1.919134, 1.952088, -0.8237757, 1, 0, 0.1803922, 1,
1.937364, 1.834302, 3.168407, 1, 0, 0.172549, 1,
1.969616, 1.083649, 1.983688, 1, 0, 0.1686275, 1,
1.970201, -0.5155597, 3.835778, 1, 0, 0.1607843, 1,
1.972722, -1.661615, 3.475076, 1, 0, 0.1568628, 1,
2.02031, -1.080462, 1.667152, 1, 0, 0.1490196, 1,
2.030464, -0.8877541, 0.5555556, 1, 0, 0.145098, 1,
2.034295, 1.255476, 0.4957218, 1, 0, 0.1372549, 1,
2.054716, -0.2791318, 2.508213, 1, 0, 0.1333333, 1,
2.087827, -1.41538, 2.112808, 1, 0, 0.1254902, 1,
2.095134, -0.8011859, 2.116983, 1, 0, 0.1215686, 1,
2.103256, 0.2767939, 0.7417347, 1, 0, 0.1137255, 1,
2.119147, 0.9828501, 0.8214792, 1, 0, 0.1098039, 1,
2.148674, -0.8550743, 3.660482, 1, 0, 0.1019608, 1,
2.149725, 0.1493321, 1.649124, 1, 0, 0.09411765, 1,
2.163388, 0.5294256, 0.8307561, 1, 0, 0.09019608, 1,
2.169313, -0.4210085, -0.4864014, 1, 0, 0.08235294, 1,
2.183945, 0.6272498, 0.08341742, 1, 0, 0.07843138, 1,
2.22089, -1.028805, 1.682226, 1, 0, 0.07058824, 1,
2.304957, -1.186966, 2.090573, 1, 0, 0.06666667, 1,
2.362178, 1.265817, 0.5560678, 1, 0, 0.05882353, 1,
2.382017, 0.5546334, 2.227845, 1, 0, 0.05490196, 1,
2.400806, 0.1907102, 1.908191, 1, 0, 0.04705882, 1,
2.498956, -0.03182495, 1.041807, 1, 0, 0.04313726, 1,
2.514789, -0.4539148, 0.6326552, 1, 0, 0.03529412, 1,
2.523531, 1.007069, 1.216446, 1, 0, 0.03137255, 1,
2.597008, 1.277854, 1.524189, 1, 0, 0.02352941, 1,
3.019295, -0.191863, 2.342512, 1, 0, 0.01960784, 1,
3.059913, -0.8723131, 1.036201, 1, 0, 0.01176471, 1,
3.500553, -1.214978, 0.9969298, 1, 0, 0.007843138, 1
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
0.03938758, -4.437337, -6.601583, 0, -0.5, 0.5, 0.5,
0.03938758, -4.437337, -6.601583, 1, -0.5, 0.5, 0.5,
0.03938758, -4.437337, -6.601583, 1, 1.5, 0.5, 0.5,
0.03938758, -4.437337, -6.601583, 0, 1.5, 0.5, 0.5
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
-4.595113, 0.05410814, -6.601583, 0, -0.5, 0.5, 0.5,
-4.595113, 0.05410814, -6.601583, 1, -0.5, 0.5, 0.5,
-4.595113, 0.05410814, -6.601583, 1, 1.5, 0.5, 0.5,
-4.595113, 0.05410814, -6.601583, 0, 1.5, 0.5, 0.5
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
-4.595113, -4.437337, 0.125634, 0, -0.5, 0.5, 0.5,
-4.595113, -4.437337, 0.125634, 1, -0.5, 0.5, 0.5,
-4.595113, -4.437337, 0.125634, 1, 1.5, 0.5, 0.5,
-4.595113, -4.437337, 0.125634, 0, 1.5, 0.5, 0.5
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
-3, -3.40085, -5.049149,
3, -3.40085, -5.049149,
-3, -3.40085, -5.049149,
-3, -3.573598, -5.307888,
-2, -3.40085, -5.049149,
-2, -3.573598, -5.307888,
-1, -3.40085, -5.049149,
-1, -3.573598, -5.307888,
0, -3.40085, -5.049149,
0, -3.573598, -5.307888,
1, -3.40085, -5.049149,
1, -3.573598, -5.307888,
2, -3.40085, -5.049149,
2, -3.573598, -5.307888,
3, -3.40085, -5.049149,
3, -3.573598, -5.307888
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
-3, -3.919094, -5.825366, 0, -0.5, 0.5, 0.5,
-3, -3.919094, -5.825366, 1, -0.5, 0.5, 0.5,
-3, -3.919094, -5.825366, 1, 1.5, 0.5, 0.5,
-3, -3.919094, -5.825366, 0, 1.5, 0.5, 0.5,
-2, -3.919094, -5.825366, 0, -0.5, 0.5, 0.5,
-2, -3.919094, -5.825366, 1, -0.5, 0.5, 0.5,
-2, -3.919094, -5.825366, 1, 1.5, 0.5, 0.5,
-2, -3.919094, -5.825366, 0, 1.5, 0.5, 0.5,
-1, -3.919094, -5.825366, 0, -0.5, 0.5, 0.5,
-1, -3.919094, -5.825366, 1, -0.5, 0.5, 0.5,
-1, -3.919094, -5.825366, 1, 1.5, 0.5, 0.5,
-1, -3.919094, -5.825366, 0, 1.5, 0.5, 0.5,
0, -3.919094, -5.825366, 0, -0.5, 0.5, 0.5,
0, -3.919094, -5.825366, 1, -0.5, 0.5, 0.5,
0, -3.919094, -5.825366, 1, 1.5, 0.5, 0.5,
0, -3.919094, -5.825366, 0, 1.5, 0.5, 0.5,
1, -3.919094, -5.825366, 0, -0.5, 0.5, 0.5,
1, -3.919094, -5.825366, 1, -0.5, 0.5, 0.5,
1, -3.919094, -5.825366, 1, 1.5, 0.5, 0.5,
1, -3.919094, -5.825366, 0, 1.5, 0.5, 0.5,
2, -3.919094, -5.825366, 0, -0.5, 0.5, 0.5,
2, -3.919094, -5.825366, 1, -0.5, 0.5, 0.5,
2, -3.919094, -5.825366, 1, 1.5, 0.5, 0.5,
2, -3.919094, -5.825366, 0, 1.5, 0.5, 0.5,
3, -3.919094, -5.825366, 0, -0.5, 0.5, 0.5,
3, -3.919094, -5.825366, 1, -0.5, 0.5, 0.5,
3, -3.919094, -5.825366, 1, 1.5, 0.5, 0.5,
3, -3.919094, -5.825366, 0, 1.5, 0.5, 0.5
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
-3.525613, -3, -5.049149,
-3.525613, 3, -5.049149,
-3.525613, -3, -5.049149,
-3.703863, -3, -5.307888,
-3.525613, -2, -5.049149,
-3.703863, -2, -5.307888,
-3.525613, -1, -5.049149,
-3.703863, -1, -5.307888,
-3.525613, 0, -5.049149,
-3.703863, 0, -5.307888,
-3.525613, 1, -5.049149,
-3.703863, 1, -5.307888,
-3.525613, 2, -5.049149,
-3.703863, 2, -5.307888,
-3.525613, 3, -5.049149,
-3.703863, 3, -5.307888
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
-4.060363, -3, -5.825366, 0, -0.5, 0.5, 0.5,
-4.060363, -3, -5.825366, 1, -0.5, 0.5, 0.5,
-4.060363, -3, -5.825366, 1, 1.5, 0.5, 0.5,
-4.060363, -3, -5.825366, 0, 1.5, 0.5, 0.5,
-4.060363, -2, -5.825366, 0, -0.5, 0.5, 0.5,
-4.060363, -2, -5.825366, 1, -0.5, 0.5, 0.5,
-4.060363, -2, -5.825366, 1, 1.5, 0.5, 0.5,
-4.060363, -2, -5.825366, 0, 1.5, 0.5, 0.5,
-4.060363, -1, -5.825366, 0, -0.5, 0.5, 0.5,
-4.060363, -1, -5.825366, 1, -0.5, 0.5, 0.5,
-4.060363, -1, -5.825366, 1, 1.5, 0.5, 0.5,
-4.060363, -1, -5.825366, 0, 1.5, 0.5, 0.5,
-4.060363, 0, -5.825366, 0, -0.5, 0.5, 0.5,
-4.060363, 0, -5.825366, 1, -0.5, 0.5, 0.5,
-4.060363, 0, -5.825366, 1, 1.5, 0.5, 0.5,
-4.060363, 0, -5.825366, 0, 1.5, 0.5, 0.5,
-4.060363, 1, -5.825366, 0, -0.5, 0.5, 0.5,
-4.060363, 1, -5.825366, 1, -0.5, 0.5, 0.5,
-4.060363, 1, -5.825366, 1, 1.5, 0.5, 0.5,
-4.060363, 1, -5.825366, 0, 1.5, 0.5, 0.5,
-4.060363, 2, -5.825366, 0, -0.5, 0.5, 0.5,
-4.060363, 2, -5.825366, 1, -0.5, 0.5, 0.5,
-4.060363, 2, -5.825366, 1, 1.5, 0.5, 0.5,
-4.060363, 2, -5.825366, 0, 1.5, 0.5, 0.5,
-4.060363, 3, -5.825366, 0, -0.5, 0.5, 0.5,
-4.060363, 3, -5.825366, 1, -0.5, 0.5, 0.5,
-4.060363, 3, -5.825366, 1, 1.5, 0.5, 0.5,
-4.060363, 3, -5.825366, 0, 1.5, 0.5, 0.5
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
-3.525613, -3.40085, -4,
-3.525613, -3.40085, 4,
-3.525613, -3.40085, -4,
-3.703863, -3.573598, -4,
-3.525613, -3.40085, -2,
-3.703863, -3.573598, -2,
-3.525613, -3.40085, 0,
-3.703863, -3.573598, 0,
-3.525613, -3.40085, 2,
-3.703863, -3.573598, 2,
-3.525613, -3.40085, 4,
-3.703863, -3.573598, 4
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
-4.060363, -3.919094, -4, 0, -0.5, 0.5, 0.5,
-4.060363, -3.919094, -4, 1, -0.5, 0.5, 0.5,
-4.060363, -3.919094, -4, 1, 1.5, 0.5, 0.5,
-4.060363, -3.919094, -4, 0, 1.5, 0.5, 0.5,
-4.060363, -3.919094, -2, 0, -0.5, 0.5, 0.5,
-4.060363, -3.919094, -2, 1, -0.5, 0.5, 0.5,
-4.060363, -3.919094, -2, 1, 1.5, 0.5, 0.5,
-4.060363, -3.919094, -2, 0, 1.5, 0.5, 0.5,
-4.060363, -3.919094, 0, 0, -0.5, 0.5, 0.5,
-4.060363, -3.919094, 0, 1, -0.5, 0.5, 0.5,
-4.060363, -3.919094, 0, 1, 1.5, 0.5, 0.5,
-4.060363, -3.919094, 0, 0, 1.5, 0.5, 0.5,
-4.060363, -3.919094, 2, 0, -0.5, 0.5, 0.5,
-4.060363, -3.919094, 2, 1, -0.5, 0.5, 0.5,
-4.060363, -3.919094, 2, 1, 1.5, 0.5, 0.5,
-4.060363, -3.919094, 2, 0, 1.5, 0.5, 0.5,
-4.060363, -3.919094, 4, 0, -0.5, 0.5, 0.5,
-4.060363, -3.919094, 4, 1, -0.5, 0.5, 0.5,
-4.060363, -3.919094, 4, 1, 1.5, 0.5, 0.5,
-4.060363, -3.919094, 4, 0, 1.5, 0.5, 0.5
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
-3.525613, -3.40085, -5.049149,
-3.525613, 3.509066, -5.049149,
-3.525613, -3.40085, 5.300416,
-3.525613, 3.509066, 5.300416,
-3.525613, -3.40085, -5.049149,
-3.525613, -3.40085, 5.300416,
-3.525613, 3.509066, -5.049149,
-3.525613, 3.509066, 5.300416,
-3.525613, -3.40085, -5.049149,
3.604388, -3.40085, -5.049149,
-3.525613, -3.40085, 5.300416,
3.604388, -3.40085, 5.300416,
-3.525613, 3.509066, -5.049149,
3.604388, 3.509066, -5.049149,
-3.525613, 3.509066, 5.300416,
3.604388, 3.509066, 5.300416,
3.604388, -3.40085, -5.049149,
3.604388, 3.509066, -5.049149,
3.604388, -3.40085, 5.300416,
3.604388, 3.509066, 5.300416,
3.604388, -3.40085, -5.049149,
3.604388, -3.40085, 5.300416,
3.604388, 3.509066, -5.049149,
3.604388, 3.509066, 5.300416
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
var radius = 7.658431;
var distance = 34.07322;
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
mvMatrix.translate( -0.03938758, -0.05410814, -0.125634 );
mvMatrix.scale( 1.161353, 1.198342, 0.8000767 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.07322);
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
chlorfenson<-read.table("chlorfenson.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-chlorfenson$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlorfenson' not found
```

```r
y<-chlorfenson$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlorfenson' not found
```

```r
z<-chlorfenson$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlorfenson' not found
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
-3.421778, -0.9088588, -2.476279, 0, 0, 1, 1, 1,
-3.205848, 0.1000785, -1.975803, 1, 0, 0, 1, 1,
-3.173205, 0.6206421, 0.100121, 1, 0, 0, 1, 1,
-2.551848, -0.4210277, -2.291148, 1, 0, 0, 1, 1,
-2.547551, 0.717205, -1.151191, 1, 0, 0, 1, 1,
-2.545077, -0.532799, -0.1854872, 1, 0, 0, 1, 1,
-2.530519, -1.33957, -4.17644, 0, 0, 0, 1, 1,
-2.453573, 1.297941, -1.865223, 0, 0, 0, 1, 1,
-2.43571, -0.04737825, -0.854946, 0, 0, 0, 1, 1,
-2.389896, 0.0462082, -1.724671, 0, 0, 0, 1, 1,
-2.301775, -0.5180407, -2.029485, 0, 0, 0, 1, 1,
-2.300694, 0.02725072, -1.265352, 0, 0, 0, 1, 1,
-2.261351, 1.820948, -1.023854, 0, 0, 0, 1, 1,
-2.255283, -0.1799064, -1.802244, 1, 1, 1, 1, 1,
-2.223983, -0.102403, -0.2668474, 1, 1, 1, 1, 1,
-2.219608, 1.013219, -2.632342, 1, 1, 1, 1, 1,
-2.195704, 1.02696, -1.427373, 1, 1, 1, 1, 1,
-2.173879, 0.02270026, -0.8369672, 1, 1, 1, 1, 1,
-2.158241, 0.3552613, -1.437206, 1, 1, 1, 1, 1,
-2.127152, 0.2735318, -0.886151, 1, 1, 1, 1, 1,
-2.084637, 0.9489053, -0.8025687, 1, 1, 1, 1, 1,
-2.079099, -1.209051, -1.931044, 1, 1, 1, 1, 1,
-2.073694, -0.6918649, -3.456253, 1, 1, 1, 1, 1,
-2.058547, -0.5696231, -2.101918, 1, 1, 1, 1, 1,
-2.055868, -0.4875899, 0.04012657, 1, 1, 1, 1, 1,
-2.036728, 1.654081, 0.0109203, 1, 1, 1, 1, 1,
-1.987214, -0.3671297, -1.011351, 1, 1, 1, 1, 1,
-1.974576, 0.767236, -1.940987, 1, 1, 1, 1, 1,
-1.974163, 1.338721, 0.7394729, 0, 0, 1, 1, 1,
-1.957579, -0.4136957, -2.642625, 1, 0, 0, 1, 1,
-1.925237, 0.06245621, -2.886841, 1, 0, 0, 1, 1,
-1.925137, -1.399799, -1.366769, 1, 0, 0, 1, 1,
-1.91385, -0.8176696, -1.132636, 1, 0, 0, 1, 1,
-1.90324, -0.4033431, -2.58664, 1, 0, 0, 1, 1,
-1.880389, 1.102361, -0.4989382, 0, 0, 0, 1, 1,
-1.856097, 0.5905879, -2.968368, 0, 0, 0, 1, 1,
-1.845581, -0.6360117, -4.240344, 0, 0, 0, 1, 1,
-1.821738, 0.4597816, -0.610046, 0, 0, 0, 1, 1,
-1.821429, 1.115201, 0.3263916, 0, 0, 0, 1, 1,
-1.809322, 0.09818954, -1.985073, 0, 0, 0, 1, 1,
-1.782954, 1.005393, -1.491927, 0, 0, 0, 1, 1,
-1.761227, -1.621029, -1.485835, 1, 1, 1, 1, 1,
-1.751346, 0.2493101, -0.3000008, 1, 1, 1, 1, 1,
-1.747966, 0.6061453, -2.523406, 1, 1, 1, 1, 1,
-1.735186, 0.6811563, 0.07121787, 1, 1, 1, 1, 1,
-1.689725, -0.3244087, -1.512729, 1, 1, 1, 1, 1,
-1.654447, 0.5169428, -0.9287292, 1, 1, 1, 1, 1,
-1.649543, 0.5824015, -1.977996, 1, 1, 1, 1, 1,
-1.643678, 0.07713536, -0.4555293, 1, 1, 1, 1, 1,
-1.63959, -0.1454578, -0.5621039, 1, 1, 1, 1, 1,
-1.639058, 0.1114891, -0.04386635, 1, 1, 1, 1, 1,
-1.636114, -0.1028343, -0.6023599, 1, 1, 1, 1, 1,
-1.631486, -0.01191766, -0.6288886, 1, 1, 1, 1, 1,
-1.628309, -1.631233, -2.325474, 1, 1, 1, 1, 1,
-1.623051, -0.5716835, -2.5328, 1, 1, 1, 1, 1,
-1.621758, 0.9217685, 0.5454415, 1, 1, 1, 1, 1,
-1.601404, -0.6974224, -2.391623, 0, 0, 1, 1, 1,
-1.594611, 1.016967, -0.9558395, 1, 0, 0, 1, 1,
-1.586271, -0.01421053, -1.746099, 1, 0, 0, 1, 1,
-1.585849, 0.447764, -1.06453, 1, 0, 0, 1, 1,
-1.583413, -2.373703, -2.946992, 1, 0, 0, 1, 1,
-1.570116, 1.259852, -1.501472, 1, 0, 0, 1, 1,
-1.558001, 0.4802736, 0.07818157, 0, 0, 0, 1, 1,
-1.555139, 0.5953922, -1.233526, 0, 0, 0, 1, 1,
-1.548463, -0.6614303, -0.7670988, 0, 0, 0, 1, 1,
-1.544388, 0.4982092, -2.950303, 0, 0, 0, 1, 1,
-1.543288, -1.752876, -1.877577, 0, 0, 0, 1, 1,
-1.540622, -0.4055374, -1.319985, 0, 0, 0, 1, 1,
-1.518285, -0.5365075, -1.670806, 0, 0, 0, 1, 1,
-1.51777, 2.210994, 0.2472678, 1, 1, 1, 1, 1,
-1.497738, -0.522314, -1.167618, 1, 1, 1, 1, 1,
-1.474902, 1.39306, -2.00157, 1, 1, 1, 1, 1,
-1.473771, -0.82895, -1.604386, 1, 1, 1, 1, 1,
-1.472778, -0.2852046, -3.053732, 1, 1, 1, 1, 1,
-1.465274, 0.1594067, 0.7898019, 1, 1, 1, 1, 1,
-1.463466, 0.6402922, 0.8214745, 1, 1, 1, 1, 1,
-1.451998, -0.1400645, -2.301826, 1, 1, 1, 1, 1,
-1.4506, -0.5416219, -2.256079, 1, 1, 1, 1, 1,
-1.44786, 0.6750471, -2.144025, 1, 1, 1, 1, 1,
-1.418925, -0.9423693, -3.425651, 1, 1, 1, 1, 1,
-1.405936, 0.9968937, -1.862248, 1, 1, 1, 1, 1,
-1.404654, 0.444055, -1.473511, 1, 1, 1, 1, 1,
-1.400674, -0.5020062, -0.641353, 1, 1, 1, 1, 1,
-1.392857, -0.2333075, -1.146937, 1, 1, 1, 1, 1,
-1.388336, 0.9844394, -0.9366735, 0, 0, 1, 1, 1,
-1.386904, 0.986832, -1.01619, 1, 0, 0, 1, 1,
-1.384631, -0.1372064, -2.213858, 1, 0, 0, 1, 1,
-1.382812, 0.09647704, -1.431985, 1, 0, 0, 1, 1,
-1.378533, -0.6614157, -3.120516, 1, 0, 0, 1, 1,
-1.360568, -0.4113488, -4.123236, 1, 0, 0, 1, 1,
-1.359358, -0.3996626, -1.201818, 0, 0, 0, 1, 1,
-1.357163, -0.4548423, -0.6368904, 0, 0, 0, 1, 1,
-1.351603, -1.520366, -3.389242, 0, 0, 0, 1, 1,
-1.349001, -0.211652, -1.62144, 0, 0, 0, 1, 1,
-1.348953, -0.8659154, -1.094276, 0, 0, 0, 1, 1,
-1.339255, -0.06508127, -3.187737, 0, 0, 0, 1, 1,
-1.321296, 0.4457579, -1.890775, 0, 0, 0, 1, 1,
-1.312971, -1.401147, -2.482337, 1, 1, 1, 1, 1,
-1.30868, 0.3914752, -0.772335, 1, 1, 1, 1, 1,
-1.306387, -1.073562, -3.472639, 1, 1, 1, 1, 1,
-1.292284, -0.5967124, -2.251285, 1, 1, 1, 1, 1,
-1.291967, -0.7490768, -2.832814, 1, 1, 1, 1, 1,
-1.279006, -0.7077976, -2.735332, 1, 1, 1, 1, 1,
-1.272583, 0.2428732, -1.988357, 1, 1, 1, 1, 1,
-1.261469, -1.585148, -2.094707, 1, 1, 1, 1, 1,
-1.250521, 0.1170641, -1.959269, 1, 1, 1, 1, 1,
-1.247031, -0.411919, -1.468889, 1, 1, 1, 1, 1,
-1.243288, 1.390532, 0.5710449, 1, 1, 1, 1, 1,
-1.234398, -0.1432817, -2.458434, 1, 1, 1, 1, 1,
-1.232053, 1.660194, 0.4391321, 1, 1, 1, 1, 1,
-1.21843, -0.3873848, -3.243293, 1, 1, 1, 1, 1,
-1.216756, -0.4909388, -2.335889, 1, 1, 1, 1, 1,
-1.195261, 0.3893567, -1.807477, 0, 0, 1, 1, 1,
-1.194695, -0.3811842, -2.818319, 1, 0, 0, 1, 1,
-1.188916, 0.111989, -1.545831, 1, 0, 0, 1, 1,
-1.179642, -1.796306, -3.380234, 1, 0, 0, 1, 1,
-1.176146, 1.060716, -0.2109873, 1, 0, 0, 1, 1,
-1.173999, 0.7837226, -0.1836495, 1, 0, 0, 1, 1,
-1.161082, 0.6354341, 0.6388067, 0, 0, 0, 1, 1,
-1.149486, 0.6236627, -1.283156, 0, 0, 0, 1, 1,
-1.148505, -1.083049, -2.112258, 0, 0, 0, 1, 1,
-1.148488, 0.2940944, -1.187718, 0, 0, 0, 1, 1,
-1.147817, -0.05133583, -3.208762, 0, 0, 0, 1, 1,
-1.144272, 0.1905203, 0.6968399, 0, 0, 0, 1, 1,
-1.122004, 0.5582216, -2.014368, 0, 0, 0, 1, 1,
-1.121596, -1.294407, -1.797594, 1, 1, 1, 1, 1,
-1.120247, -1.457836, -2.224692, 1, 1, 1, 1, 1,
-1.117082, -0.3832942, -1.950633, 1, 1, 1, 1, 1,
-1.105731, 0.7693288, -2.078841, 1, 1, 1, 1, 1,
-1.103209, -0.2404349, -2.846001, 1, 1, 1, 1, 1,
-1.103048, -1.048527, -2.063601, 1, 1, 1, 1, 1,
-1.098963, 1.208456, -0.9366045, 1, 1, 1, 1, 1,
-1.095615, 0.1391421, -0.117979, 1, 1, 1, 1, 1,
-1.095563, 0.07490832, -3.03655, 1, 1, 1, 1, 1,
-1.089481, -1.59055, -4.898427, 1, 1, 1, 1, 1,
-1.085501, -1.147639, -2.322058, 1, 1, 1, 1, 1,
-1.075318, 0.3134709, -0.04976048, 1, 1, 1, 1, 1,
-1.071169, -1.4524, -4.127645, 1, 1, 1, 1, 1,
-1.067162, -0.5206749, -4.598671, 1, 1, 1, 1, 1,
-1.066608, -0.1897393, -2.682309, 1, 1, 1, 1, 1,
-1.059173, -1.140174, -2.379813, 0, 0, 1, 1, 1,
-1.058752, 1.421216, 0.2385036, 1, 0, 0, 1, 1,
-1.058337, 0.4996862, 0.8052723, 1, 0, 0, 1, 1,
-1.055517, -0.2553233, -4.32738, 1, 0, 0, 1, 1,
-1.054538, -0.09576917, -2.219555, 1, 0, 0, 1, 1,
-1.037487, -0.4111466, -1.981096, 1, 0, 0, 1, 1,
-1.036774, -0.06435536, -2.836298, 0, 0, 0, 1, 1,
-1.036151, -0.4551651, -2.300416, 0, 0, 0, 1, 1,
-1.034042, -1.163429, -0.6730044, 0, 0, 0, 1, 1,
-1.031726, 1.871524, -2.222134, 0, 0, 0, 1, 1,
-1.031252, -0.7077116, -2.445096, 0, 0, 0, 1, 1,
-1.028034, -0.2936699, -3.128376, 0, 0, 0, 1, 1,
-1.011879, 0.4672956, -0.6713367, 0, 0, 0, 1, 1,
-1.005125, 0.4170275, -1.341261, 1, 1, 1, 1, 1,
-1.002021, -0.1686395, -1.507301, 1, 1, 1, 1, 1,
-1.000285, 1.336134, 0.5606075, 1, 1, 1, 1, 1,
-0.9994642, -0.575734, -0.2681266, 1, 1, 1, 1, 1,
-0.9987418, 1.250521, -1.392208, 1, 1, 1, 1, 1,
-0.9968257, 2.363859, -0.5243992, 1, 1, 1, 1, 1,
-0.9960322, -0.8721086, -2.052309, 1, 1, 1, 1, 1,
-0.992204, 1.349735, 0.3828005, 1, 1, 1, 1, 1,
-0.987642, 0.4694635, 0.358514, 1, 1, 1, 1, 1,
-0.9841195, 0.765591, -0.3707111, 1, 1, 1, 1, 1,
-0.9762021, -0.4727353, -1.352043, 1, 1, 1, 1, 1,
-0.973197, 0.5757795, -0.8138632, 1, 1, 1, 1, 1,
-0.9702053, -1.316555, -1.580212, 1, 1, 1, 1, 1,
-0.9629332, -0.8729649, -2.353716, 1, 1, 1, 1, 1,
-0.9515256, -0.1093862, -0.9919978, 1, 1, 1, 1, 1,
-0.9499462, 0.7124756, -1.439983, 0, 0, 1, 1, 1,
-0.9489314, 0.3843288, -1.150134, 1, 0, 0, 1, 1,
-0.9472321, -0.9208468, -2.428245, 1, 0, 0, 1, 1,
-0.9439318, -2.100514, -3.561037, 1, 0, 0, 1, 1,
-0.9420137, -2.106481, -2.324823, 1, 0, 0, 1, 1,
-0.9418983, 0.2986448, -1.940577, 1, 0, 0, 1, 1,
-0.9416311, -0.8221464, -2.503711, 0, 0, 0, 1, 1,
-0.9373811, 0.628422, -0.007617458, 0, 0, 0, 1, 1,
-0.9361212, -1.939618, -1.034599, 0, 0, 0, 1, 1,
-0.9339889, 0.6606138, -1.472242, 0, 0, 0, 1, 1,
-0.930189, -0.8168771, -1.850833, 0, 0, 0, 1, 1,
-0.9296328, 0.1218588, 0.4657449, 0, 0, 0, 1, 1,
-0.9173011, 0.0002692119, -1.04283, 0, 0, 0, 1, 1,
-0.9163573, 0.7424374, -1.355875, 1, 1, 1, 1, 1,
-0.9123993, 1.705786, -0.5876803, 1, 1, 1, 1, 1,
-0.9105166, -0.202365, -2.917165, 1, 1, 1, 1, 1,
-0.9055451, -0.1033576, -1.900725, 1, 1, 1, 1, 1,
-0.9016597, -1.175676, -1.832459, 1, 1, 1, 1, 1,
-0.89667, 0.009143434, -2.462343, 1, 1, 1, 1, 1,
-0.8965462, 0.3564635, -0.3551062, 1, 1, 1, 1, 1,
-0.8944063, 0.6246715, 0.3648794, 1, 1, 1, 1, 1,
-0.8932006, -1.16484, -2.195482, 1, 1, 1, 1, 1,
-0.8920443, -0.0577963, -0.6442037, 1, 1, 1, 1, 1,
-0.8914261, 1.037369, -3.412715, 1, 1, 1, 1, 1,
-0.8725859, 0.9702083, -0.5097537, 1, 1, 1, 1, 1,
-0.8688231, -0.5619705, -3.176502, 1, 1, 1, 1, 1,
-0.866048, -1.173178, -2.259638, 1, 1, 1, 1, 1,
-0.8657897, -0.6109113, -2.310334, 1, 1, 1, 1, 1,
-0.8637223, -1.550652, -1.800838, 0, 0, 1, 1, 1,
-0.8622152, -0.2469506, -2.154148, 1, 0, 0, 1, 1,
-0.8619668, -3.30022, -4.138074, 1, 0, 0, 1, 1,
-0.860907, 1.240529, -1.154367, 1, 0, 0, 1, 1,
-0.8473121, 1.728215, -0.317914, 1, 0, 0, 1, 1,
-0.8404304, 0.7638326, -0.04224461, 1, 0, 0, 1, 1,
-0.8273422, -0.002446358, -2.797502, 0, 0, 0, 1, 1,
-0.8250642, 1.217134, -1.761986, 0, 0, 0, 1, 1,
-0.824908, 1.330319, 0.4148177, 0, 0, 0, 1, 1,
-0.8232588, 1.150162, -2.636444, 0, 0, 0, 1, 1,
-0.8213762, -0.3836231, -1.51493, 0, 0, 0, 1, 1,
-0.8183346, -0.1254945, -0.07215819, 0, 0, 0, 1, 1,
-0.8182665, 0.4792174, -0.7266007, 0, 0, 0, 1, 1,
-0.8156761, 0.7398015, -0.8737266, 1, 1, 1, 1, 1,
-0.8156194, 0.06866172, -2.154737, 1, 1, 1, 1, 1,
-0.8122919, -2.040265, -2.070215, 1, 1, 1, 1, 1,
-0.8109742, -0.2666737, -0.8707052, 1, 1, 1, 1, 1,
-0.8044839, 0.1307832, 0.1729845, 1, 1, 1, 1, 1,
-0.8038736, -0.04759485, -1.73987, 1, 1, 1, 1, 1,
-0.802924, -0.09128501, -0.2116388, 1, 1, 1, 1, 1,
-0.8016112, 0.8049361, -0.186582, 1, 1, 1, 1, 1,
-0.7873035, 1.138983, -1.322046, 1, 1, 1, 1, 1,
-0.7871515, 0.4565249, -0.2413794, 1, 1, 1, 1, 1,
-0.7867575, -0.2777121, -2.518103, 1, 1, 1, 1, 1,
-0.7826258, 1.985825, -0.8077017, 1, 1, 1, 1, 1,
-0.7767048, -1.00521, -1.41595, 1, 1, 1, 1, 1,
-0.7734845, 0.04845108, -0.4917929, 1, 1, 1, 1, 1,
-0.7715568, 0.7271864, -1.814123, 1, 1, 1, 1, 1,
-0.7689071, 0.3378736, -2.249182, 0, 0, 1, 1, 1,
-0.7663466, -1.183366, -2.767488, 1, 0, 0, 1, 1,
-0.7647713, -0.03668359, -0.8344775, 1, 0, 0, 1, 1,
-0.7637315, 1.353307, -0.229351, 1, 0, 0, 1, 1,
-0.761227, -0.170171, -1.709335, 1, 0, 0, 1, 1,
-0.7592222, 0.09074506, -1.856966, 1, 0, 0, 1, 1,
-0.7566849, 0.9125621, -0.1902649, 0, 0, 0, 1, 1,
-0.7544387, 0.416687, -1.013536, 0, 0, 0, 1, 1,
-0.750748, -0.4210459, -1.280797, 0, 0, 0, 1, 1,
-0.7471518, 0.8107703, 0.7498986, 0, 0, 0, 1, 1,
-0.7469137, -0.3129514, -2.115648, 0, 0, 0, 1, 1,
-0.7441004, 0.05600449, -1.561849, 0, 0, 0, 1, 1,
-0.7329727, 2.264405, -0.08872981, 0, 0, 0, 1, 1,
-0.7299687, -0.3310563, -2.543947, 1, 1, 1, 1, 1,
-0.7259604, 1.314444, 1.085425, 1, 1, 1, 1, 1,
-0.7229693, -0.7517725, -1.813896, 1, 1, 1, 1, 1,
-0.7112821, -0.2148764, -1.79592, 1, 1, 1, 1, 1,
-0.6993908, -0.2454907, 0.08828317, 1, 1, 1, 1, 1,
-0.6983554, 0.8890864, -0.8312249, 1, 1, 1, 1, 1,
-0.6953528, -0.136419, -1.983246, 1, 1, 1, 1, 1,
-0.6947013, 1.151616, 1.138068, 1, 1, 1, 1, 1,
-0.6895958, 0.1911205, -1.544314, 1, 1, 1, 1, 1,
-0.6888961, 0.2778811, -2.336622, 1, 1, 1, 1, 1,
-0.6827438, 1.140834, -0.05758364, 1, 1, 1, 1, 1,
-0.6822526, 0.2984735, -0.4978432, 1, 1, 1, 1, 1,
-0.6687008, -1.513196, -3.387052, 1, 1, 1, 1, 1,
-0.6662259, -0.02256895, -2.092123, 1, 1, 1, 1, 1,
-0.6627948, -0.3569171, -2.561665, 1, 1, 1, 1, 1,
-0.6593066, 0.511506, -0.3682625, 0, 0, 1, 1, 1,
-0.6545215, 0.2322583, -0.6572112, 1, 0, 0, 1, 1,
-0.6538227, 1.990109, -0.03711002, 1, 0, 0, 1, 1,
-0.6523148, -2.259449, -2.805164, 1, 0, 0, 1, 1,
-0.6500457, -1.60226, -2.836836, 1, 0, 0, 1, 1,
-0.6499799, 1.577936, 0.7033771, 1, 0, 0, 1, 1,
-0.6474715, 0.2900615, 0.2260763, 0, 0, 0, 1, 1,
-0.6461319, 0.3144713, 0.7484365, 0, 0, 0, 1, 1,
-0.6435242, 1.30527, -0.8296164, 0, 0, 0, 1, 1,
-0.6375656, -0.05324802, -2.057895, 0, 0, 0, 1, 1,
-0.6327804, 1.307108, 0.1836987, 0, 0, 0, 1, 1,
-0.6321133, 0.9014427, -1.204542, 0, 0, 0, 1, 1,
-0.6316391, -0.5342744, -2.7745, 0, 0, 0, 1, 1,
-0.6238775, 0.8159021, 1.699657, 1, 1, 1, 1, 1,
-0.6228132, 0.3866127, -1.662754, 1, 1, 1, 1, 1,
-0.6194558, 0.792596, 0.6424135, 1, 1, 1, 1, 1,
-0.6119537, 1.255856, 0.05277827, 1, 1, 1, 1, 1,
-0.6119047, 0.5656607, -1.116735, 1, 1, 1, 1, 1,
-0.6114936, -1.757197, -4.223476, 1, 1, 1, 1, 1,
-0.6101584, 0.7676047, -1.482328, 1, 1, 1, 1, 1,
-0.6084911, -0.05484283, -0.9698977, 1, 1, 1, 1, 1,
-0.6070632, 0.8685056, -0.2469122, 1, 1, 1, 1, 1,
-0.604418, -0.9384317, -1.876042, 1, 1, 1, 1, 1,
-0.603624, 1.515981, 0.5497211, 1, 1, 1, 1, 1,
-0.6035215, -0.3024725, -0.8873329, 1, 1, 1, 1, 1,
-0.6014216, 0.04647813, -1.600329, 1, 1, 1, 1, 1,
-0.6010271, -0.2804817, -3.806817, 1, 1, 1, 1, 1,
-0.5997565, 1.72078, 0.0110618, 1, 1, 1, 1, 1,
-0.5980543, 0.3584119, 0.1469288, 0, 0, 1, 1, 1,
-0.5965577, 1.186266, -0.6842555, 1, 0, 0, 1, 1,
-0.5961478, -1.585685, -3.803427, 1, 0, 0, 1, 1,
-0.5954807, 0.2274664, 0.1688941, 1, 0, 0, 1, 1,
-0.5948408, -1.466839, -3.304008, 1, 0, 0, 1, 1,
-0.5943301, -1.141428, -3.493067, 1, 0, 0, 1, 1,
-0.5896351, 0.5268124, 1.183385, 0, 0, 0, 1, 1,
-0.5859091, 0.5014799, 0.2884015, 0, 0, 0, 1, 1,
-0.5858533, -0.248145, -0.6963127, 0, 0, 0, 1, 1,
-0.5849752, -0.3326552, -3.226875, 0, 0, 0, 1, 1,
-0.5820801, 0.8838463, 0.6101547, 0, 0, 0, 1, 1,
-0.5795306, -1.088088, -2.237224, 0, 0, 0, 1, 1,
-0.5778583, 0.8337349, -2.541507, 0, 0, 0, 1, 1,
-0.57744, -0.7050194, -1.837892, 1, 1, 1, 1, 1,
-0.5714171, 0.1238809, -1.937654, 1, 1, 1, 1, 1,
-0.5701229, 0.1304182, -0.6326908, 1, 1, 1, 1, 1,
-0.5669401, -0.690206, -2.391337, 1, 1, 1, 1, 1,
-0.5653774, -0.4555211, -0.3720102, 1, 1, 1, 1, 1,
-0.5648165, -0.05343634, -1.425394, 1, 1, 1, 1, 1,
-0.5625532, -0.1107894, -1.973297, 1, 1, 1, 1, 1,
-0.5618546, -0.2044977, -2.774861, 1, 1, 1, 1, 1,
-0.5556884, 0.7069721, 0.6819695, 1, 1, 1, 1, 1,
-0.5543172, -0.6908594, -2.397346, 1, 1, 1, 1, 1,
-0.5452352, 0.2938232, 1.372638, 1, 1, 1, 1, 1,
-0.5406785, -0.497407, -3.125901, 1, 1, 1, 1, 1,
-0.5392579, 1.733535, -1.018693, 1, 1, 1, 1, 1,
-0.5391786, 0.7624371, -1.999695, 1, 1, 1, 1, 1,
-0.5328331, -0.0790278, -2.673616, 1, 1, 1, 1, 1,
-0.5315027, -0.6575454, -0.7753513, 0, 0, 1, 1, 1,
-0.5302861, -0.6370981, -1.507008, 1, 0, 0, 1, 1,
-0.5301886, 1.074524, -1.39017, 1, 0, 0, 1, 1,
-0.5282306, -0.705546, -2.260431, 1, 0, 0, 1, 1,
-0.5260952, -0.9324868, -2.728494, 1, 0, 0, 1, 1,
-0.5250529, 0.7298243, 1.251804, 1, 0, 0, 1, 1,
-0.5224094, -0.8594068, -3.26521, 0, 0, 0, 1, 1,
-0.5204237, -0.04897005, -1.767268, 0, 0, 0, 1, 1,
-0.5160052, 2.172318, -1.715883, 0, 0, 0, 1, 1,
-0.497295, 0.7033692, -1.287114, 0, 0, 0, 1, 1,
-0.4869038, -0.8117585, -2.207771, 0, 0, 0, 1, 1,
-0.4868563, 1.265628, -0.9609767, 0, 0, 0, 1, 1,
-0.4847298, -2.091477, -2.472455, 0, 0, 0, 1, 1,
-0.4844181, -1.009168, -1.642392, 1, 1, 1, 1, 1,
-0.4841566, 0.3641373, 0.1445064, 1, 1, 1, 1, 1,
-0.4805296, 0.3815543, 0.4296496, 1, 1, 1, 1, 1,
-0.4725866, -0.7175214, -2.02924, 1, 1, 1, 1, 1,
-0.4708591, 0.5427189, 1.645583, 1, 1, 1, 1, 1,
-0.4678715, 0.704684, -2.082633, 1, 1, 1, 1, 1,
-0.4669961, 1.253621, 0.4341487, 1, 1, 1, 1, 1,
-0.466495, -0.2767963, -3.040636, 1, 1, 1, 1, 1,
-0.4632446, 1.069789, 0.5453394, 1, 1, 1, 1, 1,
-0.453976, -1.157676, -2.970046, 1, 1, 1, 1, 1,
-0.4538617, -0.07732034, -1.901189, 1, 1, 1, 1, 1,
-0.4488752, 0.5147289, -0.9408827, 1, 1, 1, 1, 1,
-0.4472816, -0.3409516, -3.668624, 1, 1, 1, 1, 1,
-0.4413612, -0.8279957, -2.357051, 1, 1, 1, 1, 1,
-0.4384203, -0.9196982, -2.608433, 1, 1, 1, 1, 1,
-0.4333053, 0.7339246, 1.308361, 0, 0, 1, 1, 1,
-0.4277266, 2.021346, -0.3993916, 1, 0, 0, 1, 1,
-0.4267005, 1.387736, -0.4184144, 1, 0, 0, 1, 1,
-0.4231961, 1.588568, 0.04277616, 1, 0, 0, 1, 1,
-0.4221989, 1.344184, -0.5234445, 1, 0, 0, 1, 1,
-0.4208795, 1.21382, -1.550524, 1, 0, 0, 1, 1,
-0.4204934, -1.698052, -2.622776, 0, 0, 0, 1, 1,
-0.4172507, -0.4067341, -3.615585, 0, 0, 0, 1, 1,
-0.4167368, -1.161091, -3.324423, 0, 0, 0, 1, 1,
-0.4137457, 0.380963, -2.463145, 0, 0, 0, 1, 1,
-0.4018759, -0.4100893, -2.048497, 0, 0, 0, 1, 1,
-0.3947847, 0.4866895, -0.4099177, 0, 0, 0, 1, 1,
-0.3891142, 0.7315336, -1.682966, 0, 0, 0, 1, 1,
-0.3856172, 0.6064636, -0.7715778, 1, 1, 1, 1, 1,
-0.37875, 2.466017, 0.1419653, 1, 1, 1, 1, 1,
-0.376474, 0.05999914, -2.243825, 1, 1, 1, 1, 1,
-0.372631, 0.2041855, -1.447015, 1, 1, 1, 1, 1,
-0.3699392, 1.904957, 0.5849361, 1, 1, 1, 1, 1,
-0.3696852, 1.078478, 0.09324419, 1, 1, 1, 1, 1,
-0.3669794, 0.8050703, -0.462936, 1, 1, 1, 1, 1,
-0.363659, 1.32794, 0.22417, 1, 1, 1, 1, 1,
-0.3636136, -0.4141609, -1.699794, 1, 1, 1, 1, 1,
-0.3612131, -1.062887, -2.648966, 1, 1, 1, 1, 1,
-0.3609742, 1.802103, -0.3867802, 1, 1, 1, 1, 1,
-0.3574193, 1.840049, -1.177196, 1, 1, 1, 1, 1,
-0.3544431, 0.09874231, -1.856734, 1, 1, 1, 1, 1,
-0.3530459, 1.365626, 0.7502816, 1, 1, 1, 1, 1,
-0.3492064, -0.1457009, -2.439797, 1, 1, 1, 1, 1,
-0.3430669, 1.066264, 0.3406073, 0, 0, 1, 1, 1,
-0.3404446, 0.6627135, -1.186379, 1, 0, 0, 1, 1,
-0.3382263, -0.1407614, -3.086482, 1, 0, 0, 1, 1,
-0.335562, 0.6394016, 0.3666627, 1, 0, 0, 1, 1,
-0.3319453, -0.6000867, -1.884767, 1, 0, 0, 1, 1,
-0.3298724, -1.015243, -1.793072, 1, 0, 0, 1, 1,
-0.3284204, -0.3517644, -1.343073, 0, 0, 0, 1, 1,
-0.3225714, -0.5391262, -4.07247, 0, 0, 0, 1, 1,
-0.322251, 0.8778213, -0.8106034, 0, 0, 0, 1, 1,
-0.3198448, 0.4177063, 0.2022534, 0, 0, 0, 1, 1,
-0.3109306, -1.00717, -2.099176, 0, 0, 0, 1, 1,
-0.3066862, 0.01273506, -1.969163, 0, 0, 0, 1, 1,
-0.2970565, 1.223126, 0.1501208, 0, 0, 0, 1, 1,
-0.2937205, -1.708632, -3.445198, 1, 1, 1, 1, 1,
-0.2924533, -1.580371, -2.861655, 1, 1, 1, 1, 1,
-0.2916636, -0.163391, -1.035406, 1, 1, 1, 1, 1,
-0.2882913, 1.216459, 1.650243, 1, 1, 1, 1, 1,
-0.2849933, -0.8473093, -4.205239, 1, 1, 1, 1, 1,
-0.2835285, -1.573076, -2.143831, 1, 1, 1, 1, 1,
-0.283382, -0.593859, -2.780338, 1, 1, 1, 1, 1,
-0.2811686, -0.07133214, -0.2187209, 1, 1, 1, 1, 1,
-0.2802892, -0.001438908, -2.150378, 1, 1, 1, 1, 1,
-0.2785461, 0.2721462, -1.504471, 1, 1, 1, 1, 1,
-0.2734112, -1.699916, -4.592562, 1, 1, 1, 1, 1,
-0.2713865, 0.8632928, 0.02277876, 1, 1, 1, 1, 1,
-0.2658805, -1.243644, -3.549183, 1, 1, 1, 1, 1,
-0.2651286, 0.3256895, -0.7624878, 1, 1, 1, 1, 1,
-0.2646873, -0.4941758, -1.524899, 1, 1, 1, 1, 1,
-0.2608801, 0.988394, -0.0866145, 0, 0, 1, 1, 1,
-0.2604168, -1.883978, -3.534966, 1, 0, 0, 1, 1,
-0.2554637, -0.06928363, -0.4467025, 1, 0, 0, 1, 1,
-0.2501475, 0.4401394, 1.1417, 1, 0, 0, 1, 1,
-0.2468583, -0.9275457, -2.444844, 1, 0, 0, 1, 1,
-0.2461642, -1.054575, -2.943117, 1, 0, 0, 1, 1,
-0.2446569, 1.507985, -0.5664935, 0, 0, 0, 1, 1,
-0.2357773, 1.10092, 1.580317, 0, 0, 0, 1, 1,
-0.2298104, -0.1304104, -1.991472, 0, 0, 0, 1, 1,
-0.2285918, 0.05982998, -0.9144962, 0, 0, 0, 1, 1,
-0.2254953, 2.088437, -1.147361, 0, 0, 0, 1, 1,
-0.2225397, -1.443685, -2.431413, 0, 0, 0, 1, 1,
-0.2217393, 2.061982, -0.790633, 0, 0, 0, 1, 1,
-0.2198102, -0.4794758, -3.267269, 1, 1, 1, 1, 1,
-0.2190947, -0.1415278, -3.585899, 1, 1, 1, 1, 1,
-0.2176194, 0.4336285, -0.07369398, 1, 1, 1, 1, 1,
-0.2159685, -0.5037731, -2.452547, 1, 1, 1, 1, 1,
-0.2117366, 0.3817033, -0.3961682, 1, 1, 1, 1, 1,
-0.2096361, -0.4621924, -1.437399, 1, 1, 1, 1, 1,
-0.2095352, 0.7967871, 1.107865, 1, 1, 1, 1, 1,
-0.2041351, -0.7141887, -4.349086, 1, 1, 1, 1, 1,
-0.2000624, -0.420134, -3.732644, 1, 1, 1, 1, 1,
-0.1909859, 3.408437, 0.4842029, 1, 1, 1, 1, 1,
-0.1894749, -2.178531, -3.378685, 1, 1, 1, 1, 1,
-0.1816874, -0.9280989, -2.647595, 1, 1, 1, 1, 1,
-0.1813945, -0.713848, -3.573393, 1, 1, 1, 1, 1,
-0.1810493, -0.1506512, -2.866747, 1, 1, 1, 1, 1,
-0.1790273, -0.3006082, -4.031176, 1, 1, 1, 1, 1,
-0.1773725, -0.6206487, -2.608364, 0, 0, 1, 1, 1,
-0.1773238, -1.365855, -2.725489, 1, 0, 0, 1, 1,
-0.1676564, 0.4070451, -0.4702383, 1, 0, 0, 1, 1,
-0.1661593, -2.349518, -2.496196, 1, 0, 0, 1, 1,
-0.1658198, 0.4224905, -0.7886943, 1, 0, 0, 1, 1,
-0.1648924, 1.158117, -0.6703244, 1, 0, 0, 1, 1,
-0.1643448, -0.2642003, -2.062515, 0, 0, 0, 1, 1,
-0.1602506, 1.277483, 0.7851094, 0, 0, 0, 1, 1,
-0.1593639, 0.3175984, -1.259388, 0, 0, 0, 1, 1,
-0.154632, 1.689942, -0.7452018, 0, 0, 0, 1, 1,
-0.1519301, -0.2340177, -1.366546, 0, 0, 0, 1, 1,
-0.1509732, 0.7061905, -1.021373, 0, 0, 0, 1, 1,
-0.1493991, 0.7560233, -0.2673709, 0, 0, 0, 1, 1,
-0.148395, 1.169607, 0.4627072, 1, 1, 1, 1, 1,
-0.145324, -1.747556, -2.365655, 1, 1, 1, 1, 1,
-0.1432749, -3.263677, -2.812793, 1, 1, 1, 1, 1,
-0.1399727, 0.8191847, -0.5927818, 1, 1, 1, 1, 1,
-0.1364524, 1.576013, -1.212281, 1, 1, 1, 1, 1,
-0.1362142, -0.3153615, -2.465495, 1, 1, 1, 1, 1,
-0.1316098, -0.3349459, -3.059827, 1, 1, 1, 1, 1,
-0.1302771, -0.4444382, -3.316708, 1, 1, 1, 1, 1,
-0.1285346, 0.2706922, -1.159132, 1, 1, 1, 1, 1,
-0.128378, 0.1631094, 1.127401, 1, 1, 1, 1, 1,
-0.121416, 0.6417249, -3.157435, 1, 1, 1, 1, 1,
-0.1213111, 0.7426078, -1.641347, 1, 1, 1, 1, 1,
-0.1208054, -0.2082707, -1.497647, 1, 1, 1, 1, 1,
-0.1188689, -1.511468, -3.598077, 1, 1, 1, 1, 1,
-0.1168097, 0.9880613, -0.1106012, 1, 1, 1, 1, 1,
-0.1159021, -0.797971, -1.620106, 0, 0, 1, 1, 1,
-0.1132112, 0.6571045, 1.196986, 1, 0, 0, 1, 1,
-0.1085785, 0.4398457, 1.048649, 1, 0, 0, 1, 1,
-0.1074481, -0.1285367, -2.695009, 1, 0, 0, 1, 1,
-0.1061763, -1.463649, -3.906718, 1, 0, 0, 1, 1,
-0.105681, -0.8866739, -3.98439, 1, 0, 0, 1, 1,
-0.1012491, -0.7867476, -2.302704, 0, 0, 0, 1, 1,
-0.1008727, -0.9972857, -0.8747336, 0, 0, 0, 1, 1,
-0.09620507, -1.117034, -2.748827, 0, 0, 0, 1, 1,
-0.09573114, 1.449237, -0.3304562, 0, 0, 0, 1, 1,
-0.08836608, 0.9003853, -1.353046, 0, 0, 0, 1, 1,
-0.08272574, -0.3104271, -2.422098, 0, 0, 0, 1, 1,
-0.0822571, 1.105643, -1.179559, 0, 0, 0, 1, 1,
-0.08218169, -0.5478224, -4.742346, 1, 1, 1, 1, 1,
-0.08004151, 1.479905, -0.9911023, 1, 1, 1, 1, 1,
-0.07995551, 0.3463337, -0.08564851, 1, 1, 1, 1, 1,
-0.07944393, -0.7817326, -1.779071, 1, 1, 1, 1, 1,
-0.07494965, -0.9177735, -3.225225, 1, 1, 1, 1, 1,
-0.07413892, -0.7503107, -2.038841, 1, 1, 1, 1, 1,
-0.07107794, -0.0171524, -2.110393, 1, 1, 1, 1, 1,
-0.06877249, 0.7234864, -0.3856269, 1, 1, 1, 1, 1,
-0.06822654, 1.545545, 1.038627, 1, 1, 1, 1, 1,
-0.06614325, -0.8285128, -3.69485, 1, 1, 1, 1, 1,
-0.06395462, 0.208569, 2.067955, 1, 1, 1, 1, 1,
-0.0622672, -1.232976, -3.500818, 1, 1, 1, 1, 1,
-0.06140422, -1.384494, -3.060123, 1, 1, 1, 1, 1,
-0.05924215, -0.1469727, -2.595044, 1, 1, 1, 1, 1,
-0.05838488, -0.2041008, -2.837459, 1, 1, 1, 1, 1,
-0.05512062, -0.5685171, -3.680927, 0, 0, 1, 1, 1,
-0.04718915, -1.318524, -1.832541, 1, 0, 0, 1, 1,
-0.04642856, -0.4887612, -4.104248, 1, 0, 0, 1, 1,
-0.04639798, -0.4301153, -3.901894, 1, 0, 0, 1, 1,
-0.04033071, 0.01721754, -2.068418, 1, 0, 0, 1, 1,
-0.03828518, 0.4069955, 0.3028643, 1, 0, 0, 1, 1,
-0.03796694, -0.4051352, -2.411507, 0, 0, 0, 1, 1,
-0.03703234, 1.778789, 1.567181, 0, 0, 0, 1, 1,
-0.02572112, -0.8555221, -1.020251, 0, 0, 0, 1, 1,
-0.02459541, 1.212741, -0.07212141, 0, 0, 0, 1, 1,
-0.02436855, -0.05143172, -2.420771, 0, 0, 0, 1, 1,
-0.01968286, 0.7929289, -0.8722383, 0, 0, 0, 1, 1,
-0.01759497, 0.3523994, 1.198565, 0, 0, 0, 1, 1,
-0.01489627, 0.6706866, 0.5773817, 1, 1, 1, 1, 1,
-0.01337866, 0.1758815, -0.5749584, 1, 1, 1, 1, 1,
-0.01209522, -0.9836915, -4.079959, 1, 1, 1, 1, 1,
-0.01143717, 0.4845315, 0.3054227, 1, 1, 1, 1, 1,
-0.01018601, -0.7744167, -4.572048, 1, 1, 1, 1, 1,
-0.005984971, -0.3596736, -0.7302653, 1, 1, 1, 1, 1,
2.275177e-05, 0.3802175, 1.13287, 1, 1, 1, 1, 1,
0.001403717, -0.005310334, 2.65868, 1, 1, 1, 1, 1,
0.001971988, 0.6764066, -0.3757686, 1, 1, 1, 1, 1,
0.004810997, 0.9241866, -1.153716, 1, 1, 1, 1, 1,
0.0113395, -1.430273, 3.655864, 1, 1, 1, 1, 1,
0.01209938, 0.1877905, 1.744209, 1, 1, 1, 1, 1,
0.01402092, 0.2643161, -2.135967, 1, 1, 1, 1, 1,
0.0142283, -1.144358, 3.474542, 1, 1, 1, 1, 1,
0.01776416, 0.8036604, 0.1349083, 1, 1, 1, 1, 1,
0.01806666, -0.08027267, 4.701832, 0, 0, 1, 1, 1,
0.02137276, 1.369827, 0.295133, 1, 0, 0, 1, 1,
0.02349456, -0.8222032, 2.500728, 1, 0, 0, 1, 1,
0.02556165, 0.3253992, -1.02649, 1, 0, 0, 1, 1,
0.0271915, 0.8934917, 0.5471653, 1, 0, 0, 1, 1,
0.03021631, -1.739575, 3.880402, 1, 0, 0, 1, 1,
0.03169529, 0.1856103, 1.044732, 0, 0, 0, 1, 1,
0.04018537, -0.2979172, 3.200625, 0, 0, 0, 1, 1,
0.04028492, -1.77904, 3.837112, 0, 0, 0, 1, 1,
0.04207997, -0.6721064, 3.357777, 0, 0, 0, 1, 1,
0.04229335, -0.3653242, 4.238825, 0, 0, 0, 1, 1,
0.04416358, 0.4811558, -2.04178, 0, 0, 0, 1, 1,
0.04508135, 2.864917, -0.9834949, 0, 0, 0, 1, 1,
0.04646969, 0.04852854, 1.647479, 1, 1, 1, 1, 1,
0.04781024, 0.2877209, -0.09717195, 1, 1, 1, 1, 1,
0.05864321, -0.1240805, 4.058568, 1, 1, 1, 1, 1,
0.06052088, -0.733978, 3.727629, 1, 1, 1, 1, 1,
0.06434994, -2.075006, 4.723056, 1, 1, 1, 1, 1,
0.06524552, 0.7031991, 2.162091, 1, 1, 1, 1, 1,
0.06557097, -1.808724, 3.529326, 1, 1, 1, 1, 1,
0.06952276, 0.2561557, 0.7987102, 1, 1, 1, 1, 1,
0.07240157, 1.878054, 0.4111055, 1, 1, 1, 1, 1,
0.07540667, 0.686168, -0.8730666, 1, 1, 1, 1, 1,
0.07714476, -1.906424, 3.902707, 1, 1, 1, 1, 1,
0.07827756, 0.8405436, 2.274644, 1, 1, 1, 1, 1,
0.08014084, -0.1825258, 2.893946, 1, 1, 1, 1, 1,
0.086004, -1.116963, 3.589028, 1, 1, 1, 1, 1,
0.09304783, 1.004305, 0.7199609, 1, 1, 1, 1, 1,
0.09713061, 1.004674, -0.5513391, 0, 0, 1, 1, 1,
0.09888025, 0.6935251, -0.4701403, 1, 0, 0, 1, 1,
0.1026864, 0.9473857, 0.9330869, 1, 0, 0, 1, 1,
0.1028064, -1.121669, 1.520245, 1, 0, 0, 1, 1,
0.1050497, 1.307753, 0.6537494, 1, 0, 0, 1, 1,
0.1061497, 0.2542757, 1.154749, 1, 0, 0, 1, 1,
0.1072938, 0.1821116, 2.45698, 0, 0, 0, 1, 1,
0.1088535, 0.1949824, 1.273726, 0, 0, 0, 1, 1,
0.1128231, -0.5740842, 2.444431, 0, 0, 0, 1, 1,
0.1129559, 0.1428361, -0.04477194, 0, 0, 0, 1, 1,
0.1247997, -2.182158, 2.292537, 0, 0, 0, 1, 1,
0.125219, -1.735377, 1.604274, 0, 0, 0, 1, 1,
0.1258753, -2.24585, 1.18248, 0, 0, 0, 1, 1,
0.1278692, 1.717306, -1.211082, 1, 1, 1, 1, 1,
0.135731, -0.8865905, 3.091377, 1, 1, 1, 1, 1,
0.1363856, 0.1924183, -0.5040826, 1, 1, 1, 1, 1,
0.1402777, -0.6115122, 2.116609, 1, 1, 1, 1, 1,
0.1415842, 0.5946931, 0.02117822, 1, 1, 1, 1, 1,
0.1493671, 0.5544657, 0.2629241, 1, 1, 1, 1, 1,
0.1497778, -0.3958904, 2.391944, 1, 1, 1, 1, 1,
0.1499388, -0.01693508, 2.122751, 1, 1, 1, 1, 1,
0.1534014, 1.335304, -0.2340641, 1, 1, 1, 1, 1,
0.1551604, -0.08384352, 2.335348, 1, 1, 1, 1, 1,
0.1566844, 1.061768, -0.4304127, 1, 1, 1, 1, 1,
0.1607783, 0.1484237, 0.873041, 1, 1, 1, 1, 1,
0.1649809, 1.279289, -0.2280084, 1, 1, 1, 1, 1,
0.1663752, 1.245914, 0.082872, 1, 1, 1, 1, 1,
0.1664905, -1.213439, 4.257252, 1, 1, 1, 1, 1,
0.1670554, -0.4400329, 3.688699, 0, 0, 1, 1, 1,
0.1679168, 1.345205, 2.193951, 1, 0, 0, 1, 1,
0.1687633, -0.224305, 2.911056, 1, 0, 0, 1, 1,
0.1709678, -0.008613518, 1.298187, 1, 0, 0, 1, 1,
0.171014, -1.809486, 3.145803, 1, 0, 0, 1, 1,
0.1716047, 2.165256, -0.4822351, 1, 0, 0, 1, 1,
0.1750794, -0.02503386, 1.324525, 0, 0, 0, 1, 1,
0.1781342, 0.9344194, -0.7813276, 0, 0, 0, 1, 1,
0.1796197, -0.559651, 0.5109553, 0, 0, 0, 1, 1,
0.1797126, -1.435735, 3.131302, 0, 0, 0, 1, 1,
0.1802726, -0.6355546, 3.537462, 0, 0, 0, 1, 1,
0.1848069, -2.171247, 2.580586, 0, 0, 0, 1, 1,
0.1880323, -0.1977578, 3.980176, 0, 0, 0, 1, 1,
0.1893672, -0.1250087, 3.970922, 1, 1, 1, 1, 1,
0.1936892, 0.9219432, 0.9222562, 1, 1, 1, 1, 1,
0.1941018, 1.970665, 0.7196704, 1, 1, 1, 1, 1,
0.1941786, -0.4010528, 1.517472, 1, 1, 1, 1, 1,
0.1949414, 2.41981, 0.8078705, 1, 1, 1, 1, 1,
0.1988149, 0.1225402, 2.310169, 1, 1, 1, 1, 1,
0.1995451, -0.3723253, 3.021301, 1, 1, 1, 1, 1,
0.2023685, -0.9861317, 3.204041, 1, 1, 1, 1, 1,
0.2049844, 0.05301563, 1.48105, 1, 1, 1, 1, 1,
0.2088125, 0.6956477, -0.2531114, 1, 1, 1, 1, 1,
0.2090569, -1.708485, 1.632016, 1, 1, 1, 1, 1,
0.2099952, -0.1752391, 3.543917, 1, 1, 1, 1, 1,
0.2122793, -0.02730824, 0.6982508, 1, 1, 1, 1, 1,
0.2147841, 0.3716804, -0.8512338, 1, 1, 1, 1, 1,
0.216256, -0.06182062, 1.304767, 1, 1, 1, 1, 1,
0.2204778, 1.461539, 0.2095796, 0, 0, 1, 1, 1,
0.2243015, 0.6975042, -0.2045218, 1, 0, 0, 1, 1,
0.2251991, 1.149415, 2.184436, 1, 0, 0, 1, 1,
0.2272011, 0.6886325, 0.7645679, 1, 0, 0, 1, 1,
0.2313492, 0.6538239, -0.06569077, 1, 0, 0, 1, 1,
0.2337397, 1.626354, 0.7718322, 1, 0, 0, 1, 1,
0.2349066, -1.872964, 3.096259, 0, 0, 0, 1, 1,
0.2353794, 0.8894719, -0.3825923, 0, 0, 0, 1, 1,
0.2386992, 0.6652212, 1.765299, 0, 0, 0, 1, 1,
0.2407409, 0.06720712, 3.139922, 0, 0, 0, 1, 1,
0.245204, 0.8230948, 2.035695, 0, 0, 0, 1, 1,
0.2460695, 0.06460985, 1.456182, 0, 0, 0, 1, 1,
0.2486301, -0.5550424, 1.164356, 0, 0, 0, 1, 1,
0.250004, -0.1846157, 1.60805, 1, 1, 1, 1, 1,
0.2501968, 1.577887, -0.6568465, 1, 1, 1, 1, 1,
0.2504615, 0.09265812, 2.966881, 1, 1, 1, 1, 1,
0.2530652, 0.3102318, 0.12536, 1, 1, 1, 1, 1,
0.2543365, -0.6228176, 1.899983, 1, 1, 1, 1, 1,
0.2596331, -1.925784, 2.344346, 1, 1, 1, 1, 1,
0.2597194, 0.4881132, 2.165555, 1, 1, 1, 1, 1,
0.2614328, -0.5217541, 3.042371, 1, 1, 1, 1, 1,
0.2671872, 0.3226773, 1.171799, 1, 1, 1, 1, 1,
0.2674238, -0.9015306, 2.054349, 1, 1, 1, 1, 1,
0.2701194, 0.07420827, -0.004261335, 1, 1, 1, 1, 1,
0.2739201, -0.8021188, 2.196157, 1, 1, 1, 1, 1,
0.2770228, -0.3484075, 0.9688953, 1, 1, 1, 1, 1,
0.2846125, 0.8249719, 0.3758113, 1, 1, 1, 1, 1,
0.2865582, 0.4699067, -1.384819, 1, 1, 1, 1, 1,
0.2882478, -0.01649143, 2.638383, 0, 0, 1, 1, 1,
0.2889628, -0.7991776, 2.3949, 1, 0, 0, 1, 1,
0.2916411, 0.5065307, 0.0984938, 1, 0, 0, 1, 1,
0.2922244, 1.144828, 1.639815, 1, 0, 0, 1, 1,
0.2935192, -1.80054, 4.057936, 1, 0, 0, 1, 1,
0.3022791, -0.1816014, 1.739874, 1, 0, 0, 1, 1,
0.3040288, 1.365063, 0.2867404, 0, 0, 0, 1, 1,
0.3043819, 0.1283006, 0.1496563, 0, 0, 0, 1, 1,
0.3050355, -0.3479503, 2.630389, 0, 0, 0, 1, 1,
0.306262, -1.399966, 3.980997, 0, 0, 0, 1, 1,
0.3075597, 1.150163, -0.6622207, 0, 0, 0, 1, 1,
0.3088299, 1.49642, 1.906403, 0, 0, 0, 1, 1,
0.3092346, -0.1094213, 1.757879, 0, 0, 0, 1, 1,
0.3116637, 0.9810214, 2.184874, 1, 1, 1, 1, 1,
0.3119261, -0.7529436, 1.778054, 1, 1, 1, 1, 1,
0.3184642, 0.5118607, 0.6847809, 1, 1, 1, 1, 1,
0.3193613, -0.3335281, 1.202719, 1, 1, 1, 1, 1,
0.3221776, -1.206015, 0.8324617, 1, 1, 1, 1, 1,
0.326168, -0.2587198, 1.992426, 1, 1, 1, 1, 1,
0.3279977, -0.3369938, 2.331027, 1, 1, 1, 1, 1,
0.3336034, -0.6703051, 2.004074, 1, 1, 1, 1, 1,
0.3340454, 0.9144546, 0.798441, 1, 1, 1, 1, 1,
0.3351577, -2.986824, 3.551013, 1, 1, 1, 1, 1,
0.3377947, -0.09284096, 1.849231, 1, 1, 1, 1, 1,
0.3378431, 2.317717, 1.116708, 1, 1, 1, 1, 1,
0.3386843, -0.5478593, 2.167591, 1, 1, 1, 1, 1,
0.3398459, -0.1912293, 3.446438, 1, 1, 1, 1, 1,
0.341339, -0.5582666, 2.450447, 1, 1, 1, 1, 1,
0.3421002, 0.1610339, -0.5702584, 0, 0, 1, 1, 1,
0.342481, 0.0007320298, 1.342469, 1, 0, 0, 1, 1,
0.3431771, -1.555597, 2.646701, 1, 0, 0, 1, 1,
0.3483123, -0.01286171, 1.723327, 1, 0, 0, 1, 1,
0.3509886, -0.2843717, 2.695969, 1, 0, 0, 1, 1,
0.3547316, -0.6391407, 3.200119, 1, 0, 0, 1, 1,
0.362643, 0.483241, 1.414041, 0, 0, 0, 1, 1,
0.3646963, 0.5376833, -0.3007405, 0, 0, 0, 1, 1,
0.3675404, 0.1213322, 1.078482, 0, 0, 0, 1, 1,
0.3692265, -0.1982845, 1.150777, 0, 0, 0, 1, 1,
0.3701697, 0.1080075, 2.459833, 0, 0, 0, 1, 1,
0.3703277, -0.06770054, 2.239785, 0, 0, 0, 1, 1,
0.372647, 0.8610379, 1.51294, 0, 0, 0, 1, 1,
0.3733155, 0.4099436, 0.5358239, 1, 1, 1, 1, 1,
0.3753729, -0.607183, 3.269316, 1, 1, 1, 1, 1,
0.3803494, -0.3150857, 2.035517, 1, 1, 1, 1, 1,
0.3808951, 0.7304719, 0.4730171, 1, 1, 1, 1, 1,
0.3903591, 0.6145903, -0.5532077, 1, 1, 1, 1, 1,
0.391191, 0.2236672, 0.3746373, 1, 1, 1, 1, 1,
0.391192, -0.7643739, 0.3590138, 1, 1, 1, 1, 1,
0.392825, -0.7941579, 4.1777, 1, 1, 1, 1, 1,
0.3942283, -1.700516, 1.503013, 1, 1, 1, 1, 1,
0.4007421, -0.8218642, 2.179282, 1, 1, 1, 1, 1,
0.4008879, -1.167481, 3.516665, 1, 1, 1, 1, 1,
0.4025982, 0.8712242, 1.722049, 1, 1, 1, 1, 1,
0.4059458, 1.120033, -1.341068, 1, 1, 1, 1, 1,
0.4062768, -0.7214664, 2.250588, 1, 1, 1, 1, 1,
0.4172944, -1.346343, 2.152112, 1, 1, 1, 1, 1,
0.4258175, -0.1547522, 0.9668946, 0, 0, 1, 1, 1,
0.4264383, -0.4518998, -0.7667118, 1, 0, 0, 1, 1,
0.4273425, -1.282837, 3.913978, 1, 0, 0, 1, 1,
0.4316131, 0.6307501, 1.322059, 1, 0, 0, 1, 1,
0.4328495, -0.8233346, 4.17331, 1, 0, 0, 1, 1,
0.4344658, 0.9232616, -0.08684128, 1, 0, 0, 1, 1,
0.4388892, 1.004757, -0.302695, 0, 0, 0, 1, 1,
0.4391008, -0.3815016, 2.184279, 0, 0, 0, 1, 1,
0.4404214, -0.9964514, 2.581646, 0, 0, 0, 1, 1,
0.4457204, -0.6681508, 1.007228, 0, 0, 0, 1, 1,
0.45135, -0.01986327, 0.7162642, 0, 0, 0, 1, 1,
0.4579631, 0.4678657, 1.821066, 0, 0, 0, 1, 1,
0.4592558, -0.4286648, 1.890538, 0, 0, 0, 1, 1,
0.4593218, -0.417108, 3.430368, 1, 1, 1, 1, 1,
0.4627108, 1.438483, 0.6442252, 1, 1, 1, 1, 1,
0.4673911, -0.2954162, 1.828524, 1, 1, 1, 1, 1,
0.4709447, -0.1742504, 3.521136, 1, 1, 1, 1, 1,
0.4768097, -0.7738299, 1.347999, 1, 1, 1, 1, 1,
0.4773206, -0.682458, 2.696061, 1, 1, 1, 1, 1,
0.4775128, 0.07174401, 3.143271, 1, 1, 1, 1, 1,
0.4835408, -0.9038057, 2.596057, 1, 1, 1, 1, 1,
0.4877676, 0.77911, 0.5608527, 1, 1, 1, 1, 1,
0.495438, -1.354142, 3.647125, 1, 1, 1, 1, 1,
0.49832, 0.2319318, 0.7366564, 1, 1, 1, 1, 1,
0.5096457, 0.4355218, 1.12649, 1, 1, 1, 1, 1,
0.5118383, -0.1005223, 1.264111, 1, 1, 1, 1, 1,
0.515705, 1.201608, -0.3283106, 1, 1, 1, 1, 1,
0.5199059, 0.8380736, 0.3492958, 1, 1, 1, 1, 1,
0.5264176, 1.042909, 2.086903, 0, 0, 1, 1, 1,
0.5343387, -1.304724, 2.286225, 1, 0, 0, 1, 1,
0.5378814, 0.301715, 1.165061, 1, 0, 0, 1, 1,
0.5390424, 0.8789439, 0.6780519, 1, 0, 0, 1, 1,
0.5393062, -1.149879, 2.33268, 1, 0, 0, 1, 1,
0.541733, -0.2150304, 0.4677121, 1, 0, 0, 1, 1,
0.5443704, -1.096093, 2.603326, 0, 0, 0, 1, 1,
0.5453545, -0.6576612, 0.5014946, 0, 0, 0, 1, 1,
0.5487525, 0.4828395, -0.7054117, 0, 0, 0, 1, 1,
0.5520792, -0.3971093, 2.339714, 0, 0, 0, 1, 1,
0.5545794, 0.9163314, 2.235476, 0, 0, 0, 1, 1,
0.5546952, -1.586013, 3.397545, 0, 0, 0, 1, 1,
0.5687196, -1.050778, 1.710054, 0, 0, 0, 1, 1,
0.5748366, 0.2836304, -0.7524675, 1, 1, 1, 1, 1,
0.5763029, 1.390959, -0.2258836, 1, 1, 1, 1, 1,
0.5776052, -2.002399, 2.623843, 1, 1, 1, 1, 1,
0.5789845, 1.670498, 0.1714778, 1, 1, 1, 1, 1,
0.579635, -0.5491866, 3.506909, 1, 1, 1, 1, 1,
0.5797935, 0.3476531, 1.607393, 1, 1, 1, 1, 1,
0.5808522, 1.136452, 0.5975832, 1, 1, 1, 1, 1,
0.582774, -0.09587129, 1.419731, 1, 1, 1, 1, 1,
0.5856969, -1.254381, 2.024615, 1, 1, 1, 1, 1,
0.5899878, 0.6568075, 1.289731, 1, 1, 1, 1, 1,
0.5977469, 0.9900956, -1.012424, 1, 1, 1, 1, 1,
0.5996273, 1.863591, -0.009902571, 1, 1, 1, 1, 1,
0.6073406, -0.1655168, 1.432817, 1, 1, 1, 1, 1,
0.6080407, -0.01752315, -0.5385388, 1, 1, 1, 1, 1,
0.6141484, -0.05580177, 0.616951, 1, 1, 1, 1, 1,
0.6178858, 0.1070354, 3.273539, 0, 0, 1, 1, 1,
0.6179348, 0.02914892, 1.590394, 1, 0, 0, 1, 1,
0.6192988, -2.327644, 3.281135, 1, 0, 0, 1, 1,
0.6248912, 1.075952, -1.338967, 1, 0, 0, 1, 1,
0.6259804, -0.3722069, 1.44029, 1, 0, 0, 1, 1,
0.626547, 0.7349946, 0.7891392, 1, 0, 0, 1, 1,
0.6273131, -0.8318834, 3.566547, 0, 0, 0, 1, 1,
0.6353649, -1.489431, 1.862435, 0, 0, 0, 1, 1,
0.6407222, -0.698131, -0.1764083, 0, 0, 0, 1, 1,
0.6429755, 0.6234565, -0.6051455, 0, 0, 0, 1, 1,
0.6452057, -0.9208544, 5.149694, 0, 0, 0, 1, 1,
0.648474, -0.4520646, 2.766754, 0, 0, 0, 1, 1,
0.6511829, 1.024662, 2.365402, 0, 0, 0, 1, 1,
0.6542908, -1.251611, 2.565141, 1, 1, 1, 1, 1,
0.6547371, 0.5040688, 0.9405956, 1, 1, 1, 1, 1,
0.6729067, 1.039608, 0.5925344, 1, 1, 1, 1, 1,
0.6732761, -1.58748, 3.725768, 1, 1, 1, 1, 1,
0.6735004, 0.05818632, 2.078181, 1, 1, 1, 1, 1,
0.6739684, 0.1679332, 2.892543, 1, 1, 1, 1, 1,
0.6763744, 1.261887, 1.521412, 1, 1, 1, 1, 1,
0.6778738, 0.3236685, -0.1258134, 1, 1, 1, 1, 1,
0.6782122, -0.6552497, 2.482533, 1, 1, 1, 1, 1,
0.6849276, 0.9872667, 0.1630141, 1, 1, 1, 1, 1,
0.690714, -1.082203, 2.086044, 1, 1, 1, 1, 1,
0.6939576, -1.724135, 2.646587, 1, 1, 1, 1, 1,
0.6945208, 0.6271712, 0.6012816, 1, 1, 1, 1, 1,
0.695386, -1.935668, 2.125756, 1, 1, 1, 1, 1,
0.6971988, -1.036656, 1.903121, 1, 1, 1, 1, 1,
0.6982235, -0.3603306, 1.462892, 0, 0, 1, 1, 1,
0.6987702, 0.6822048, 1.649329, 1, 0, 0, 1, 1,
0.7011992, 0.685142, 0.0429801, 1, 0, 0, 1, 1,
0.7039163, 0.3564127, 1.076294, 1, 0, 0, 1, 1,
0.7079139, 0.6750396, 0.4728243, 1, 0, 0, 1, 1,
0.7109026, -0.2097571, 2.076641, 1, 0, 0, 1, 1,
0.7116628, -1.280437, 2.190183, 0, 0, 0, 1, 1,
0.7161517, 0.3249002, 0.7960322, 0, 0, 0, 1, 1,
0.7206913, -0.7746858, 1.799566, 0, 0, 0, 1, 1,
0.720718, -0.3475165, 2.260771, 0, 0, 0, 1, 1,
0.7293214, -0.7084046, 1.96727, 0, 0, 0, 1, 1,
0.7295098, 0.03076859, 0.8365769, 0, 0, 0, 1, 1,
0.7318155, 0.6584025, -0.1766131, 0, 0, 0, 1, 1,
0.7403707, 0.02468901, 0.9998599, 1, 1, 1, 1, 1,
0.7419595, 1.943169, 2.172426, 1, 1, 1, 1, 1,
0.7427756, -0.297765, 1.472762, 1, 1, 1, 1, 1,
0.7485529, -1.15949, 1.602802, 1, 1, 1, 1, 1,
0.7556483, -1.522685, 3.255032, 1, 1, 1, 1, 1,
0.7641682, 0.5703244, 2.081877, 1, 1, 1, 1, 1,
0.7666381, 0.4394553, 0.5677186, 1, 1, 1, 1, 1,
0.7674409, 1.658765, 0.4265132, 1, 1, 1, 1, 1,
0.7678592, 0.5321054, -0.1596606, 1, 1, 1, 1, 1,
0.7688532, -1.088585, 3.357214, 1, 1, 1, 1, 1,
0.7696521, -0.7208719, 1.701312, 1, 1, 1, 1, 1,
0.7704509, 0.3952102, 1.464808, 1, 1, 1, 1, 1,
0.7734798, -0.9410661, 3.24438, 1, 1, 1, 1, 1,
0.7837313, -0.9896207, 2.356582, 1, 1, 1, 1, 1,
0.7838942, 1.379725, 0.4756576, 1, 1, 1, 1, 1,
0.7894017, -0.6075929, 1.793217, 0, 0, 1, 1, 1,
0.7919106, 1.244265, 0.995247, 1, 0, 0, 1, 1,
0.7951328, -1.893018, 3.193386, 1, 0, 0, 1, 1,
0.7963976, -1.110323, 2.538327, 1, 0, 0, 1, 1,
0.800782, 0.8051174, 2.787075, 1, 0, 0, 1, 1,
0.810773, -0.3539688, 1.414347, 1, 0, 0, 1, 1,
0.8131204, 0.7002655, -1.098135, 0, 0, 0, 1, 1,
0.8210329, -0.284465, 5.024989, 0, 0, 0, 1, 1,
0.8247617, -0.5136563, 2.687709, 0, 0, 0, 1, 1,
0.828954, 1.148625, -0.0266193, 0, 0, 0, 1, 1,
0.8321967, 0.09072582, 0.966253, 0, 0, 0, 1, 1,
0.8397964, 1.079035, 1.542329, 0, 0, 0, 1, 1,
0.8399938, -0.471373, 1.183342, 0, 0, 0, 1, 1,
0.8462909, -0.860095, 0.7598048, 1, 1, 1, 1, 1,
0.8479065, 0.1836129, 0.8065835, 1, 1, 1, 1, 1,
0.848991, -1.492741, 1.640915, 1, 1, 1, 1, 1,
0.8533512, 0.2782655, 0.2024073, 1, 1, 1, 1, 1,
0.8537482, -1.131318, 2.702137, 1, 1, 1, 1, 1,
0.8553389, 0.647494, -0.1209811, 1, 1, 1, 1, 1,
0.858402, 0.04316745, 1.888865, 1, 1, 1, 1, 1,
0.8587588, -0.8714935, 1.641229, 1, 1, 1, 1, 1,
0.8640715, 0.2537869, 0.826591, 1, 1, 1, 1, 1,
0.8670146, 0.4428264, 1.37694, 1, 1, 1, 1, 1,
0.8745595, 1.541086, 2.14779, 1, 1, 1, 1, 1,
0.8752347, 0.7929774, 1.538653, 1, 1, 1, 1, 1,
0.8779166, 0.1267864, 2.824065, 1, 1, 1, 1, 1,
0.882244, 2.208999, 1.328804, 1, 1, 1, 1, 1,
0.8835934, 1.010014, 0.5413927, 1, 1, 1, 1, 1,
0.8840401, -0.5221987, 2.179321, 0, 0, 1, 1, 1,
0.8847047, 1.050855, 1.195843, 1, 0, 0, 1, 1,
0.8857237, 0.0442922, 1.994611, 1, 0, 0, 1, 1,
0.9135401, -0.7119532, 2.492096, 1, 0, 0, 1, 1,
0.9153624, -0.4714514, 1.021377, 1, 0, 0, 1, 1,
0.9169033, -0.5619127, 1.7519, 1, 0, 0, 1, 1,
0.9266964, -1.077337, 0.9195486, 0, 0, 0, 1, 1,
0.9301447, -0.6267967, 2.503098, 0, 0, 0, 1, 1,
0.9319056, -0.1835909, -0.5286155, 0, 0, 0, 1, 1,
0.9368024, -0.4399296, 2.909821, 0, 0, 0, 1, 1,
0.9459007, -1.291769, 2.347486, 0, 0, 0, 1, 1,
0.9466566, 0.6956888, 0.2890948, 0, 0, 0, 1, 1,
0.9476371, 0.1845104, 1.902033, 0, 0, 0, 1, 1,
0.9580352, -1.499876, 2.775583, 1, 1, 1, 1, 1,
0.9583699, 0.1984422, 1.159215, 1, 1, 1, 1, 1,
0.9589049, 1.37884, 1.859138, 1, 1, 1, 1, 1,
0.9623005, -1.245374, 2.320073, 1, 1, 1, 1, 1,
0.9628337, 0.2487026, 1.539478, 1, 1, 1, 1, 1,
0.9749749, 0.3391266, 3.631534, 1, 1, 1, 1, 1,
0.9789724, -0.6933347, 2.275588, 1, 1, 1, 1, 1,
0.9849517, 0.5780974, 1.773009, 1, 1, 1, 1, 1,
0.9881809, 1.364726, 1.886899, 1, 1, 1, 1, 1,
0.990046, 0.4746811, 0.4192724, 1, 1, 1, 1, 1,
0.9902239, 0.05407638, 1.750501, 1, 1, 1, 1, 1,
0.9902663, 2.312327, 2.966528, 1, 1, 1, 1, 1,
0.9925166, 0.1898905, 2.38011, 1, 1, 1, 1, 1,
1.00405, -0.3172647, 1.950013, 1, 1, 1, 1, 1,
1.008913, -0.03772528, 1.315262, 1, 1, 1, 1, 1,
1.010816, -1.320121, 3.079612, 0, 0, 1, 1, 1,
1.020524, 0.08503364, 1.535243, 1, 0, 0, 1, 1,
1.022439, 0.6979488, 1.62557, 1, 0, 0, 1, 1,
1.026726, -1.075722, 1.495489, 1, 0, 0, 1, 1,
1.027907, 1.211006, -0.8893967, 1, 0, 0, 1, 1,
1.031233, 0.883666, 1.023235, 1, 0, 0, 1, 1,
1.031515, -0.4580969, 2.012277, 0, 0, 0, 1, 1,
1.043886, 0.8198816, 1.702698, 0, 0, 0, 1, 1,
1.051411, 1.891247, 1.592263, 0, 0, 0, 1, 1,
1.055361, 0.3939623, 1.265411, 0, 0, 0, 1, 1,
1.055489, -1.466812, 0.2721481, 0, 0, 0, 1, 1,
1.059113, -0.3185875, 0.9868829, 0, 0, 0, 1, 1,
1.060104, -0.8404409, 1.413255, 0, 0, 0, 1, 1,
1.060605, -0.3226022, 1.648593, 1, 1, 1, 1, 1,
1.070318, 0.4512617, 0.7916586, 1, 1, 1, 1, 1,
1.071627, 1.504408, 1.942613, 1, 1, 1, 1, 1,
1.073742, -2.40468, 3.084513, 1, 1, 1, 1, 1,
1.074484, 0.5481079, -0.2065537, 1, 1, 1, 1, 1,
1.075202, 0.1479684, -0.5514542, 1, 1, 1, 1, 1,
1.081633, -0.701192, 1.771316, 1, 1, 1, 1, 1,
1.085526, -1.171932, 0.6732283, 1, 1, 1, 1, 1,
1.086428, -0.6373872, 1.065111, 1, 1, 1, 1, 1,
1.087031, 0.6729789, 1.701876, 1, 1, 1, 1, 1,
1.091454, 0.8251938, 1.162129, 1, 1, 1, 1, 1,
1.095759, 2.204491, -0.5898095, 1, 1, 1, 1, 1,
1.102041, 1.720727, 0.4928063, 1, 1, 1, 1, 1,
1.111705, -0.9792109, 2.524764, 1, 1, 1, 1, 1,
1.116189, 0.01140424, 2.573825, 1, 1, 1, 1, 1,
1.122929, -1.584159, 2.930439, 0, 0, 1, 1, 1,
1.129668, -1.458154, 2.713623, 1, 0, 0, 1, 1,
1.131055, 1.230679, -0.5314202, 1, 0, 0, 1, 1,
1.138635, 2.001905, -0.3336108, 1, 0, 0, 1, 1,
1.138804, 0.6237374, 0.9734067, 1, 0, 0, 1, 1,
1.141614, -2.446381, 3.498745, 1, 0, 0, 1, 1,
1.143533, 0.1067092, 0.09480773, 0, 0, 0, 1, 1,
1.148089, -1.401034, 1.490285, 0, 0, 0, 1, 1,
1.152295, 1.23878, 1.440633, 0, 0, 0, 1, 1,
1.15573, 1.901581, -0.2144431, 0, 0, 0, 1, 1,
1.155934, 0.113886, -1.140325, 0, 0, 0, 1, 1,
1.170589, -0.1615066, 2.203291, 0, 0, 0, 1, 1,
1.171764, 1.818916, 0.8739722, 0, 0, 0, 1, 1,
1.181323, 1.097553, 2.177349, 1, 1, 1, 1, 1,
1.193727, 1.505176, 0.3810652, 1, 1, 1, 1, 1,
1.196915, -1.189319, 3.893259, 1, 1, 1, 1, 1,
1.19934, -0.2030685, 1.03671, 1, 1, 1, 1, 1,
1.213191, 1.944616, 0.2743027, 1, 1, 1, 1, 1,
1.215023, 1.973703, 0.684914, 1, 1, 1, 1, 1,
1.220012, 0.09687412, 1.715032, 1, 1, 1, 1, 1,
1.240596, -1.047484, 2.134008, 1, 1, 1, 1, 1,
1.241507, -0.9774386, 2.240597, 1, 1, 1, 1, 1,
1.250443, -0.2055341, -0.1591775, 1, 1, 1, 1, 1,
1.261389, 0.1634237, 0.9978282, 1, 1, 1, 1, 1,
1.265299, -1.423497, 0.7210703, 1, 1, 1, 1, 1,
1.275444, -2.327657, 0.9918554, 1, 1, 1, 1, 1,
1.276286, 1.433966, 1.982755, 1, 1, 1, 1, 1,
1.28122, 0.1578821, 1.212285, 1, 1, 1, 1, 1,
1.290397, 1.006339, -0.02933131, 0, 0, 1, 1, 1,
1.305104, 0.3545699, -0.8792244, 1, 0, 0, 1, 1,
1.312764, -0.2416074, 2.810826, 1, 0, 0, 1, 1,
1.314888, -0.1782416, 0.9623658, 1, 0, 0, 1, 1,
1.331964, 0.577264, 0.08266737, 1, 0, 0, 1, 1,
1.333806, 1.161057, 0.6016414, 1, 0, 0, 1, 1,
1.334935, -0.6289665, 1.898112, 0, 0, 0, 1, 1,
1.338886, -0.01928133, -0.3263888, 0, 0, 0, 1, 1,
1.339971, 0.7506939, 1.078129, 0, 0, 0, 1, 1,
1.352039, -0.3539202, 2.418977, 0, 0, 0, 1, 1,
1.364256, 1.362974, 0.7417064, 0, 0, 0, 1, 1,
1.366949, 0.6982948, 0.6162803, 0, 0, 0, 1, 1,
1.372073, 0.9957807, -0.6508859, 0, 0, 0, 1, 1,
1.373792, -0.224299, 2.743131, 1, 1, 1, 1, 1,
1.374094, 0.3573362, 2.587764, 1, 1, 1, 1, 1,
1.381458, 1.28358, 0.870792, 1, 1, 1, 1, 1,
1.393845, -0.3586272, 0.9155846, 1, 1, 1, 1, 1,
1.412248, -1.102383, 1.470638, 1, 1, 1, 1, 1,
1.413768, 2.562394, -0.9831165, 1, 1, 1, 1, 1,
1.418513, -0.5894504, 2.43856, 1, 1, 1, 1, 1,
1.420324, 0.08353116, 2.4509, 1, 1, 1, 1, 1,
1.421703, -1.386828, 3.286753, 1, 1, 1, 1, 1,
1.43221, -0.4484089, 1.630689, 1, 1, 1, 1, 1,
1.432574, 1.595068, -1.550339, 1, 1, 1, 1, 1,
1.434469, -0.4112368, 0.05868414, 1, 1, 1, 1, 1,
1.436853, 0.5087125, 1.867929, 1, 1, 1, 1, 1,
1.448751, 0.6408436, 1.324001, 1, 1, 1, 1, 1,
1.464033, -0.2881038, 1.702381, 1, 1, 1, 1, 1,
1.472919, 0.2609552, 2.174934, 0, 0, 1, 1, 1,
1.476508, -0.750841, 1.652291, 1, 0, 0, 1, 1,
1.480989, 1.058521, 1.73999, 1, 0, 0, 1, 1,
1.500707, 0.2872712, 1.45118, 1, 0, 0, 1, 1,
1.504183, -0.2702344, 0.8934665, 1, 0, 0, 1, 1,
1.512264, -0.09994955, 1.940219, 1, 0, 0, 1, 1,
1.515272, -0.2773196, 2.52493, 0, 0, 0, 1, 1,
1.528483, 0.6422851, 1.809263, 0, 0, 0, 1, 1,
1.52932, 0.9242198, 0.5248179, 0, 0, 0, 1, 1,
1.535053, 0.1753666, 1.012835, 0, 0, 0, 1, 1,
1.539337, -1.247632, 2.298431, 0, 0, 0, 1, 1,
1.552127, -0.6328069, 0.8469943, 0, 0, 0, 1, 1,
1.555717, -1.542205, 0.2122599, 0, 0, 0, 1, 1,
1.557253, 1.745678, -0.6820084, 1, 1, 1, 1, 1,
1.567305, -0.7439756, 2.617172, 1, 1, 1, 1, 1,
1.57958, -1.164094, 1.448426, 1, 1, 1, 1, 1,
1.602887, -0.909429, 2.932093, 1, 1, 1, 1, 1,
1.607674, 0.9348084, -0.08462703, 1, 1, 1, 1, 1,
1.608637, 0.3823206, 1.05411, 1, 1, 1, 1, 1,
1.625206, 0.1566075, 2.023994, 1, 1, 1, 1, 1,
1.63959, -0.5258185, 3.058234, 1, 1, 1, 1, 1,
1.640384, -0.5512676, 0.3527347, 1, 1, 1, 1, 1,
1.645691, 1.30075, -0.4287934, 1, 1, 1, 1, 1,
1.656571, 1.225899, -0.17395, 1, 1, 1, 1, 1,
1.657021, 0.4523735, -0.4897949, 1, 1, 1, 1, 1,
1.675804, 1.324748, 1.270429, 1, 1, 1, 1, 1,
1.688748, 0.6351532, 1.618069, 1, 1, 1, 1, 1,
1.71158, -0.2671211, 0.8800754, 1, 1, 1, 1, 1,
1.716951, 0.6353516, -0.7386796, 0, 0, 1, 1, 1,
1.750961, 0.01147201, 1.132267, 1, 0, 0, 1, 1,
1.754479, -0.5624287, 3.137342, 1, 0, 0, 1, 1,
1.762509, -1.403841, 2.357848, 1, 0, 0, 1, 1,
1.765337, 1.569869, -0.08837808, 1, 0, 0, 1, 1,
1.769164, 0.4701872, 1.027865, 1, 0, 0, 1, 1,
1.773102, -0.8686611, 0.6682255, 0, 0, 0, 1, 1,
1.78048, 0.1765376, 1.552371, 0, 0, 0, 1, 1,
1.793827, 0.3908005, 1.548025, 0, 0, 0, 1, 1,
1.797742, -0.4183266, -0.1135386, 0, 0, 0, 1, 1,
1.801512, -0.4570975, 2.95228, 0, 0, 0, 1, 1,
1.803363, -0.9421609, 3.538349, 0, 0, 0, 1, 1,
1.809627, -0.5619575, 2.128295, 0, 0, 0, 1, 1,
1.83691, -0.127386, 1.800096, 1, 1, 1, 1, 1,
1.857903, -0.979194, 2.25333, 1, 1, 1, 1, 1,
1.899579, -0.5774062, 3.307462, 1, 1, 1, 1, 1,
1.916019, 0.5884454, 3.609429, 1, 1, 1, 1, 1,
1.916209, -0.7445487, 3.954838, 1, 1, 1, 1, 1,
1.919134, 1.952088, -0.8237757, 1, 1, 1, 1, 1,
1.937364, 1.834302, 3.168407, 1, 1, 1, 1, 1,
1.969616, 1.083649, 1.983688, 1, 1, 1, 1, 1,
1.970201, -0.5155597, 3.835778, 1, 1, 1, 1, 1,
1.972722, -1.661615, 3.475076, 1, 1, 1, 1, 1,
2.02031, -1.080462, 1.667152, 1, 1, 1, 1, 1,
2.030464, -0.8877541, 0.5555556, 1, 1, 1, 1, 1,
2.034295, 1.255476, 0.4957218, 1, 1, 1, 1, 1,
2.054716, -0.2791318, 2.508213, 1, 1, 1, 1, 1,
2.087827, -1.41538, 2.112808, 1, 1, 1, 1, 1,
2.095134, -0.8011859, 2.116983, 0, 0, 1, 1, 1,
2.103256, 0.2767939, 0.7417347, 1, 0, 0, 1, 1,
2.119147, 0.9828501, 0.8214792, 1, 0, 0, 1, 1,
2.148674, -0.8550743, 3.660482, 1, 0, 0, 1, 1,
2.149725, 0.1493321, 1.649124, 1, 0, 0, 1, 1,
2.163388, 0.5294256, 0.8307561, 1, 0, 0, 1, 1,
2.169313, -0.4210085, -0.4864014, 0, 0, 0, 1, 1,
2.183945, 0.6272498, 0.08341742, 0, 0, 0, 1, 1,
2.22089, -1.028805, 1.682226, 0, 0, 0, 1, 1,
2.304957, -1.186966, 2.090573, 0, 0, 0, 1, 1,
2.362178, 1.265817, 0.5560678, 0, 0, 0, 1, 1,
2.382017, 0.5546334, 2.227845, 0, 0, 0, 1, 1,
2.400806, 0.1907102, 1.908191, 0, 0, 0, 1, 1,
2.498956, -0.03182495, 1.041807, 1, 1, 1, 1, 1,
2.514789, -0.4539148, 0.6326552, 1, 1, 1, 1, 1,
2.523531, 1.007069, 1.216446, 1, 1, 1, 1, 1,
2.597008, 1.277854, 1.524189, 1, 1, 1, 1, 1,
3.019295, -0.191863, 2.342512, 1, 1, 1, 1, 1,
3.059913, -0.8723131, 1.036201, 1, 1, 1, 1, 1,
3.500553, -1.214978, 0.9969298, 1, 1, 1, 1, 1
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
var radius = 9.535895;
var distance = 33.49442;
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
mvMatrix.translate( -0.0393877, -0.05410814, -0.125634 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.49442);
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