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
-3.923718, -0.8290818, -1.141592, 1, 0, 0, 1,
-3.555447, -0.1873591, -3.044722, 1, 0.007843138, 0, 1,
-3.409519, -1.224483, -2.849929, 1, 0.01176471, 0, 1,
-2.907456, -0.9383471, -2.266768, 1, 0.01960784, 0, 1,
-2.772808, -1.109589, -4.239891, 1, 0.02352941, 0, 1,
-2.767283, 1.094371, 0.631817, 1, 0.03137255, 0, 1,
-2.673238, -1.098069, -2.332883, 1, 0.03529412, 0, 1,
-2.524328, 0.2233847, -2.927917, 1, 0.04313726, 0, 1,
-2.521775, -1.735959, -2.872096, 1, 0.04705882, 0, 1,
-2.437365, -0.09556798, -2.556936, 1, 0.05490196, 0, 1,
-2.381371, -0.07009258, -2.092486, 1, 0.05882353, 0, 1,
-2.36413, -1.077996, -2.168073, 1, 0.06666667, 0, 1,
-2.327245, -0.4628805, -1.680009, 1, 0.07058824, 0, 1,
-2.297221, 0.6540892, -1.109117, 1, 0.07843138, 0, 1,
-2.253189, 0.0539224, -2.675904, 1, 0.08235294, 0, 1,
-2.250629, -7.844555e-05, -1.714916, 1, 0.09019608, 0, 1,
-2.243928, 1.125522, 0.4443305, 1, 0.09411765, 0, 1,
-2.236976, -1.543513, -2.493193, 1, 0.1019608, 0, 1,
-2.216138, -1.276549, -2.404932, 1, 0.1098039, 0, 1,
-2.180502, 0.7830955, -0.2625185, 1, 0.1137255, 0, 1,
-2.166415, -0.06078058, -1.219823, 1, 0.1215686, 0, 1,
-2.090627, -1.600108, -2.332261, 1, 0.1254902, 0, 1,
-2.071791, 0.9939613, -2.663231, 1, 0.1333333, 0, 1,
-2.068233, -0.2943727, -1.811776, 1, 0.1372549, 0, 1,
-2.039058, -1.065779, -1.803274, 1, 0.145098, 0, 1,
-2.03221, -0.06279509, -1.645895, 1, 0.1490196, 0, 1,
-2.031853, -0.7884926, -1.607957, 1, 0.1568628, 0, 1,
-2.024714, 0.7815306, -1.933156, 1, 0.1607843, 0, 1,
-2.008153, 0.109096, -0.4984027, 1, 0.1686275, 0, 1,
-1.977494, -1.438622, -2.069148, 1, 0.172549, 0, 1,
-1.97034, -1.303893, -4.189035, 1, 0.1803922, 0, 1,
-1.968462, 1.0892, -0.1379735, 1, 0.1843137, 0, 1,
-1.960292, 1.167275, -0.3863744, 1, 0.1921569, 0, 1,
-1.934065, -0.6207188, -3.279433, 1, 0.1960784, 0, 1,
-1.92546, 0.6736137, 0.2390519, 1, 0.2039216, 0, 1,
-1.917039, 0.8502325, -0.070224, 1, 0.2117647, 0, 1,
-1.909062, 0.3636231, -1.469335, 1, 0.2156863, 0, 1,
-1.883781, -1.160437, -1.947184, 1, 0.2235294, 0, 1,
-1.876491, -0.1552239, -3.376864, 1, 0.227451, 0, 1,
-1.860345, 0.4572293, 0.2935778, 1, 0.2352941, 0, 1,
-1.835598, 0.3349434, -1.714745, 1, 0.2392157, 0, 1,
-1.831868, -0.5312338, -1.275313, 1, 0.2470588, 0, 1,
-1.824435, 1.182424, -2.008614, 1, 0.2509804, 0, 1,
-1.817518, -1.165733, -1.438138, 1, 0.2588235, 0, 1,
-1.805877, 1.482833, -0.837632, 1, 0.2627451, 0, 1,
-1.796655, -0.6226503, -3.365443, 1, 0.2705882, 0, 1,
-1.796515, -0.1508057, -0.9450039, 1, 0.2745098, 0, 1,
-1.78979, -0.4450858, -3.09857, 1, 0.282353, 0, 1,
-1.781628, 0.3010055, -2.361878, 1, 0.2862745, 0, 1,
-1.735659, 1.519829, -0.6706958, 1, 0.2941177, 0, 1,
-1.729963, -0.5392981, -1.769183, 1, 0.3019608, 0, 1,
-1.7261, -0.2868838, -2.383069, 1, 0.3058824, 0, 1,
-1.724977, -0.2518544, -1.837051, 1, 0.3137255, 0, 1,
-1.720196, -1.67072, -4.283925, 1, 0.3176471, 0, 1,
-1.656845, -1.370043, -2.174419, 1, 0.3254902, 0, 1,
-1.647749, 0.219907, 0.9844362, 1, 0.3294118, 0, 1,
-1.644974, -1.417385, -1.985968, 1, 0.3372549, 0, 1,
-1.640259, 0.6137156, -1.690813, 1, 0.3411765, 0, 1,
-1.636894, 0.3047069, -1.770464, 1, 0.3490196, 0, 1,
-1.627605, -0.7166924, -2.171145, 1, 0.3529412, 0, 1,
-1.623276, 0.3800266, -2.579402, 1, 0.3607843, 0, 1,
-1.595737, 0.1409234, -0.07721541, 1, 0.3647059, 0, 1,
-1.587726, -0.7624437, -1.581096, 1, 0.372549, 0, 1,
-1.578976, 0.9885138, -2.270645, 1, 0.3764706, 0, 1,
-1.567919, -0.7073884, -3.97879, 1, 0.3843137, 0, 1,
-1.537256, -1.209174, -2.452476, 1, 0.3882353, 0, 1,
-1.522657, -0.3953381, -2.924526, 1, 0.3960784, 0, 1,
-1.495754, -1.004364, -2.872941, 1, 0.4039216, 0, 1,
-1.486896, -0.4838885, -2.464123, 1, 0.4078431, 0, 1,
-1.48181, -0.1852471, -1.02572, 1, 0.4156863, 0, 1,
-1.473541, 1.50422, -0.6057698, 1, 0.4196078, 0, 1,
-1.466898, 0.5910705, -0.8998769, 1, 0.427451, 0, 1,
-1.465814, -0.271152, -1.869757, 1, 0.4313726, 0, 1,
-1.451121, 0.922662, -1.677265, 1, 0.4392157, 0, 1,
-1.444538, 1.902968, 0.1129278, 1, 0.4431373, 0, 1,
-1.432789, 0.9073165, -1.219392, 1, 0.4509804, 0, 1,
-1.430201, -0.9823012, -1.804128, 1, 0.454902, 0, 1,
-1.416601, -1.677352, 0.462578, 1, 0.4627451, 0, 1,
-1.412193, 1.111141, -1.703184, 1, 0.4666667, 0, 1,
-1.411172, -0.105433, -1.389986, 1, 0.4745098, 0, 1,
-1.403138, 1.33009, -0.5811681, 1, 0.4784314, 0, 1,
-1.381704, -1.412937, -3.648157, 1, 0.4862745, 0, 1,
-1.376053, -0.06570525, -0.420164, 1, 0.4901961, 0, 1,
-1.364621, -0.7046133, -2.217507, 1, 0.4980392, 0, 1,
-1.35947, -0.5404655, 0.2524012, 1, 0.5058824, 0, 1,
-1.358479, -1.180311, -2.569117, 1, 0.509804, 0, 1,
-1.356371, 1.416936, -0.560779, 1, 0.5176471, 0, 1,
-1.353241, -0.9341062, -3.516642, 1, 0.5215687, 0, 1,
-1.328673, 1.63945, 0.7636509, 1, 0.5294118, 0, 1,
-1.322423, -0.2826506, -1.227109, 1, 0.5333334, 0, 1,
-1.321361, -0.567973, -1.351064, 1, 0.5411765, 0, 1,
-1.317527, -0.1167487, -1.355944, 1, 0.5450981, 0, 1,
-1.310567, -0.3444256, -1.141117, 1, 0.5529412, 0, 1,
-1.307428, -1.894201, -1.423511, 1, 0.5568628, 0, 1,
-1.306821, 0.3807748, -1.12864, 1, 0.5647059, 0, 1,
-1.276598, -1.062582, -2.440085, 1, 0.5686275, 0, 1,
-1.266526, 0.3540182, -1.998178, 1, 0.5764706, 0, 1,
-1.264095, 0.9845465, -1.544792, 1, 0.5803922, 0, 1,
-1.264005, -0.01590212, -2.305156, 1, 0.5882353, 0, 1,
-1.252019, 0.2575243, -1.943522, 1, 0.5921569, 0, 1,
-1.246979, 0.4965062, -2.706101, 1, 0.6, 0, 1,
-1.243368, 0.6088044, -4.412569, 1, 0.6078432, 0, 1,
-1.240827, 1.398973, -1.137356, 1, 0.6117647, 0, 1,
-1.240437, -0.5988263, -1.051863, 1, 0.6196079, 0, 1,
-1.236359, 0.01171519, -2.276508, 1, 0.6235294, 0, 1,
-1.223113, -1.310057, -3.596061, 1, 0.6313726, 0, 1,
-1.219289, 0.07845621, -2.996444, 1, 0.6352941, 0, 1,
-1.218682, -0.6860042, -2.467067, 1, 0.6431373, 0, 1,
-1.202506, 0.9476065, -1.795099, 1, 0.6470588, 0, 1,
-1.201592, -1.570225, -1.419485, 1, 0.654902, 0, 1,
-1.197213, -1.774667, -2.760374, 1, 0.6588235, 0, 1,
-1.194842, -0.104757, -3.342663, 1, 0.6666667, 0, 1,
-1.190403, 0.3666508, -0.9377335, 1, 0.6705883, 0, 1,
-1.186904, 0.1621186, -3.041688, 1, 0.6784314, 0, 1,
-1.178168, 0.537293, -1.624309, 1, 0.682353, 0, 1,
-1.173634, -0.7788387, -2.417722, 1, 0.6901961, 0, 1,
-1.17093, -0.8441617, -1.137293, 1, 0.6941177, 0, 1,
-1.168548, -1.879636, -1.978024, 1, 0.7019608, 0, 1,
-1.157764, 2.267457, 0.2036633, 1, 0.7098039, 0, 1,
-1.155103, 0.5200174, -0.03078935, 1, 0.7137255, 0, 1,
-1.149489, -0.4569148, 0.4628137, 1, 0.7215686, 0, 1,
-1.146857, 1.075537, 0.02148383, 1, 0.7254902, 0, 1,
-1.144299, 0.4593783, -1.06472, 1, 0.7333333, 0, 1,
-1.14124, 0.7381355, -1.257007, 1, 0.7372549, 0, 1,
-1.138652, 0.6048135, -0.8543931, 1, 0.7450981, 0, 1,
-1.1355, 0.04290582, -3.190797, 1, 0.7490196, 0, 1,
-1.134006, 0.5511383, -1.071077, 1, 0.7568628, 0, 1,
-1.130415, 2.502825, -0.6260973, 1, 0.7607843, 0, 1,
-1.129167, 2.059313, -0.1793846, 1, 0.7686275, 0, 1,
-1.116002, 0.3056749, -2.284482, 1, 0.772549, 0, 1,
-1.115863, 1.201549, 0.674158, 1, 0.7803922, 0, 1,
-1.112531, -1.108886, -3.154571, 1, 0.7843137, 0, 1,
-1.110359, -0.4691915, -2.577402, 1, 0.7921569, 0, 1,
-1.094838, -0.8152479, -1.157432, 1, 0.7960784, 0, 1,
-1.090374, -0.1494273, -2.300326, 1, 0.8039216, 0, 1,
-1.088889, 2.92197, -1.308556, 1, 0.8117647, 0, 1,
-1.077635, -0.8532837, -1.619857, 1, 0.8156863, 0, 1,
-1.069811, 1.304607, -2.650092, 1, 0.8235294, 0, 1,
-1.066321, -0.4792757, -0.6166459, 1, 0.827451, 0, 1,
-1.064037, -0.5715961, -0.1089395, 1, 0.8352941, 0, 1,
-1.06341, 0.008216457, -0.2092577, 1, 0.8392157, 0, 1,
-1.061909, -1.251099, -2.559638, 1, 0.8470588, 0, 1,
-1.043646, 0.9162453, -1.392867, 1, 0.8509804, 0, 1,
-1.033513, 0.3558742, -0.3291629, 1, 0.8588235, 0, 1,
-1.025581, 0.03730323, -1.710365, 1, 0.8627451, 0, 1,
-1.025341, -1.827739, -2.402366, 1, 0.8705882, 0, 1,
-1.021005, 0.917728, -1.70282, 1, 0.8745098, 0, 1,
-1.02081, 0.9770142, -0.08128162, 1, 0.8823529, 0, 1,
-1.016384, -0.334867, -3.801938, 1, 0.8862745, 0, 1,
-1.005906, -0.6682121, -3.600122, 1, 0.8941177, 0, 1,
-1.003192, 0.4352692, 0.3921566, 1, 0.8980392, 0, 1,
-0.9975795, 1.561892, 1.24464, 1, 0.9058824, 0, 1,
-0.9958098, -0.4442032, -1.680684, 1, 0.9137255, 0, 1,
-0.9944863, 1.394533, -0.9818645, 1, 0.9176471, 0, 1,
-0.9906245, -1.190004, -2.837253, 1, 0.9254902, 0, 1,
-0.9886262, 0.50945, -0.3366836, 1, 0.9294118, 0, 1,
-0.9876173, -0.4873006, -1.419322, 1, 0.9372549, 0, 1,
-0.9874629, 2.505926, -0.773073, 1, 0.9411765, 0, 1,
-0.9874333, 0.5816006, -3.549963, 1, 0.9490196, 0, 1,
-0.9801864, -1.245203, -1.621334, 1, 0.9529412, 0, 1,
-0.9735419, -0.5906064, -3.394954, 1, 0.9607843, 0, 1,
-0.9720951, 0.5763055, -1.897786, 1, 0.9647059, 0, 1,
-0.9705887, -0.8683884, -3.410874, 1, 0.972549, 0, 1,
-0.9694776, -1.024857, -2.508123, 1, 0.9764706, 0, 1,
-0.9671701, -0.08077063, -0.5492054, 1, 0.9843137, 0, 1,
-0.9667764, -1.008096, -1.342611, 1, 0.9882353, 0, 1,
-0.9660436, 1.247279, 0.6250988, 1, 0.9960784, 0, 1,
-0.9629461, -1.230617, -2.435585, 0.9960784, 1, 0, 1,
-0.9598826, -0.5922049, -2.453731, 0.9921569, 1, 0, 1,
-0.9592317, 0.9867572, -1.556397, 0.9843137, 1, 0, 1,
-0.9578784, 0.4529037, -2.824947, 0.9803922, 1, 0, 1,
-0.9561931, 1.8996, 1.482439, 0.972549, 1, 0, 1,
-0.9531191, -0.7319892, -0.8703102, 0.9686275, 1, 0, 1,
-0.9501204, 0.5884011, -0.03164973, 0.9607843, 1, 0, 1,
-0.9483945, 0.7665266, -0.7909719, 0.9568627, 1, 0, 1,
-0.9372907, 0.2775997, -0.4543208, 0.9490196, 1, 0, 1,
-0.9359836, -0.8434581, -4.372, 0.945098, 1, 0, 1,
-0.9338819, -0.9884794, -2.779676, 0.9372549, 1, 0, 1,
-0.932909, -0.05606136, -1.369892, 0.9333333, 1, 0, 1,
-0.9313005, -1.680175, -2.283451, 0.9254902, 1, 0, 1,
-0.928701, -0.3949361, -0.9714196, 0.9215686, 1, 0, 1,
-0.9271773, -0.9099573, -1.180943, 0.9137255, 1, 0, 1,
-0.9245276, -0.8739393, -2.05424, 0.9098039, 1, 0, 1,
-0.9211894, 0.2044694, -0.1135694, 0.9019608, 1, 0, 1,
-0.9207277, -1.535192, -1.133572, 0.8941177, 1, 0, 1,
-0.9171104, -0.4963945, -3.817033, 0.8901961, 1, 0, 1,
-0.9088175, 1.375726, 0.8777675, 0.8823529, 1, 0, 1,
-0.9039087, -0.7348419, -2.300516, 0.8784314, 1, 0, 1,
-0.899001, -1.031725, -1.399406, 0.8705882, 1, 0, 1,
-0.8957256, 0.4596222, -0.7961949, 0.8666667, 1, 0, 1,
-0.8640243, -1.506616, -3.231132, 0.8588235, 1, 0, 1,
-0.8627588, -0.8798053, -1.463102, 0.854902, 1, 0, 1,
-0.8609315, -0.2518864, -0.6922321, 0.8470588, 1, 0, 1,
-0.8607416, -0.2399293, -4.219006, 0.8431373, 1, 0, 1,
-0.8599135, 0.2023404, -3.221514, 0.8352941, 1, 0, 1,
-0.8424512, -1.142262, -1.051408, 0.8313726, 1, 0, 1,
-0.8412725, -1.586202, -3.761088, 0.8235294, 1, 0, 1,
-0.8345871, -0.9791948, -3.409488, 0.8196079, 1, 0, 1,
-0.8282751, 0.1511576, 0.2901791, 0.8117647, 1, 0, 1,
-0.8260065, 0.09229957, -1.28442, 0.8078431, 1, 0, 1,
-0.8256804, -0.1305185, -1.014313, 0.8, 1, 0, 1,
-0.8228297, 0.6651855, -1.222308, 0.7921569, 1, 0, 1,
-0.8207369, -1.27959, -3.137545, 0.7882353, 1, 0, 1,
-0.820485, -0.4241543, -3.523665, 0.7803922, 1, 0, 1,
-0.820067, 1.779818, -0.03485782, 0.7764706, 1, 0, 1,
-0.8198714, 1.081361, -0.2255355, 0.7686275, 1, 0, 1,
-0.81846, 0.9217387, -0.4214029, 0.7647059, 1, 0, 1,
-0.816599, -0.5423314, -3.862195, 0.7568628, 1, 0, 1,
-0.8156033, -0.5594136, -1.105594, 0.7529412, 1, 0, 1,
-0.8130831, -0.223257, 0.5857838, 0.7450981, 1, 0, 1,
-0.8120294, -0.301504, -1.51021, 0.7411765, 1, 0, 1,
-0.8074276, -0.5681288, -1.455504, 0.7333333, 1, 0, 1,
-0.8063452, 0.06451861, -1.730189, 0.7294118, 1, 0, 1,
-0.8055785, 0.01935448, -2.355658, 0.7215686, 1, 0, 1,
-0.8002032, -0.2385941, -2.417822, 0.7176471, 1, 0, 1,
-0.7987483, -0.2660941, -3.161974, 0.7098039, 1, 0, 1,
-0.7971448, -1.494236, -2.385427, 0.7058824, 1, 0, 1,
-0.7966698, 1.042674, -1.249888, 0.6980392, 1, 0, 1,
-0.7949216, -0.4836655, -2.778774, 0.6901961, 1, 0, 1,
-0.7931661, -0.3586463, 0.01283994, 0.6862745, 1, 0, 1,
-0.7845482, -0.6314775, -1.339021, 0.6784314, 1, 0, 1,
-0.7788863, 1.126971, -0.615376, 0.6745098, 1, 0, 1,
-0.7774417, -0.8986501, -2.365626, 0.6666667, 1, 0, 1,
-0.7752258, 0.3218051, -0.4625429, 0.6627451, 1, 0, 1,
-0.7647806, 0.6002517, -1.437459, 0.654902, 1, 0, 1,
-0.7572798, 1.431596, 1.143312, 0.6509804, 1, 0, 1,
-0.7529418, 0.6057265, -0.1783947, 0.6431373, 1, 0, 1,
-0.7508423, -1.302155, -2.824574, 0.6392157, 1, 0, 1,
-0.7456404, 0.3658923, 0.5513982, 0.6313726, 1, 0, 1,
-0.7448541, -0.1704198, -2.708438, 0.627451, 1, 0, 1,
-0.7443815, -0.4829712, -3.322813, 0.6196079, 1, 0, 1,
-0.7389625, 1.102422, -0.5576282, 0.6156863, 1, 0, 1,
-0.7378414, -1.135812, -2.686407, 0.6078432, 1, 0, 1,
-0.7326605, 0.8468294, 0.6762927, 0.6039216, 1, 0, 1,
-0.7316443, -0.3687907, -2.49679, 0.5960785, 1, 0, 1,
-0.7298571, -1.953926, -1.917494, 0.5882353, 1, 0, 1,
-0.7225272, 1.081981, -0.5439853, 0.5843138, 1, 0, 1,
-0.7217451, -0.04647458, -2.308417, 0.5764706, 1, 0, 1,
-0.7188504, 0.503949, -2.029994, 0.572549, 1, 0, 1,
-0.718169, 0.8314452, -1.172793, 0.5647059, 1, 0, 1,
-0.7106938, -0.7843896, -1.845454, 0.5607843, 1, 0, 1,
-0.7063259, 2.214933, -0.7164667, 0.5529412, 1, 0, 1,
-0.7034156, 0.08017434, -1.356127, 0.5490196, 1, 0, 1,
-0.6996878, 0.2272911, -1.003373, 0.5411765, 1, 0, 1,
-0.6934238, 2.604201, 0.6695688, 0.5372549, 1, 0, 1,
-0.693419, -0.3097704, -0.3544412, 0.5294118, 1, 0, 1,
-0.6931356, 0.1000684, -2.396684, 0.5254902, 1, 0, 1,
-0.6858026, 0.4588672, -0.1921197, 0.5176471, 1, 0, 1,
-0.6857715, 1.405047, -0.8871127, 0.5137255, 1, 0, 1,
-0.6819128, -0.3265763, -1.872629, 0.5058824, 1, 0, 1,
-0.6813686, 0.3908906, -1.452816, 0.5019608, 1, 0, 1,
-0.6772001, -0.7360566, -1.890826, 0.4941176, 1, 0, 1,
-0.6740474, -0.06759991, -1.524178, 0.4862745, 1, 0, 1,
-0.6717795, -0.1732656, -5.013623, 0.4823529, 1, 0, 1,
-0.6688148, 1.078653, -1.395467, 0.4745098, 1, 0, 1,
-0.6615441, 1.179104, -0.4204239, 0.4705882, 1, 0, 1,
-0.6535921, 1.167028, -0.1012661, 0.4627451, 1, 0, 1,
-0.653211, -0.5788968, -0.885297, 0.4588235, 1, 0, 1,
-0.6507891, 1.218136, -0.03254538, 0.4509804, 1, 0, 1,
-0.6480889, 0.3719999, -2.27054, 0.4470588, 1, 0, 1,
-0.6475831, -1.231062, -2.053535, 0.4392157, 1, 0, 1,
-0.6467277, 1.590098, 1.223866, 0.4352941, 1, 0, 1,
-0.6425191, 0.5261918, -2.713225, 0.427451, 1, 0, 1,
-0.6411288, 0.7837364, 0.5563952, 0.4235294, 1, 0, 1,
-0.6384659, 0.7798045, -1.534147, 0.4156863, 1, 0, 1,
-0.6375744, -0.6799921, -2.21061, 0.4117647, 1, 0, 1,
-0.6281934, 0.9075073, 1.086594, 0.4039216, 1, 0, 1,
-0.6261319, -0.2930475, -3.711586, 0.3960784, 1, 0, 1,
-0.6249088, -0.9485381, -4.209087, 0.3921569, 1, 0, 1,
-0.6144055, 1.241285, 0.8178306, 0.3843137, 1, 0, 1,
-0.6142415, 0.4887691, -1.107228, 0.3803922, 1, 0, 1,
-0.613115, -0.7314072, -2.026116, 0.372549, 1, 0, 1,
-0.6127117, -0.5502911, -2.392376, 0.3686275, 1, 0, 1,
-0.6105921, 0.6796107, 0.9569361, 0.3607843, 1, 0, 1,
-0.6075616, 1.921245, -0.5339914, 0.3568628, 1, 0, 1,
-0.6067576, -0.6636583, -2.341732, 0.3490196, 1, 0, 1,
-0.6000955, -0.4685947, -3.020834, 0.345098, 1, 0, 1,
-0.599293, -0.4154758, -2.219805, 0.3372549, 1, 0, 1,
-0.5987431, -0.03323393, -2.234967, 0.3333333, 1, 0, 1,
-0.5966718, 1.347606, 1.189289, 0.3254902, 1, 0, 1,
-0.5963657, 0.2303424, -1.532533, 0.3215686, 1, 0, 1,
-0.5946648, 0.7240367, -0.1046936, 0.3137255, 1, 0, 1,
-0.5945463, 0.9314268, -0.7970861, 0.3098039, 1, 0, 1,
-0.5927391, -0.6845075, -0.1637, 0.3019608, 1, 0, 1,
-0.5891967, 0.01087561, -0.923391, 0.2941177, 1, 0, 1,
-0.589077, -0.09903216, -0.7639934, 0.2901961, 1, 0, 1,
-0.5844388, -0.2313439, -0.7838225, 0.282353, 1, 0, 1,
-0.5809988, -0.3825682, -1.515283, 0.2784314, 1, 0, 1,
-0.5732601, 0.4115092, -1.819599, 0.2705882, 1, 0, 1,
-0.5656572, 0.959133, -0.7812383, 0.2666667, 1, 0, 1,
-0.5638974, -0.9803215, -4.128448, 0.2588235, 1, 0, 1,
-0.5620381, -0.6651738, -1.276928, 0.254902, 1, 0, 1,
-0.5594838, 0.1446623, -1.485239, 0.2470588, 1, 0, 1,
-0.55936, 1.543728, -1.115102, 0.2431373, 1, 0, 1,
-0.5586104, -1.286806, -2.491369, 0.2352941, 1, 0, 1,
-0.5568568, 0.6189548, 0.2632176, 0.2313726, 1, 0, 1,
-0.5494431, 1.735275, -1.091802, 0.2235294, 1, 0, 1,
-0.5377613, 0.4764062, -1.152127, 0.2196078, 1, 0, 1,
-0.5325156, 0.4834091, -1.622126, 0.2117647, 1, 0, 1,
-0.532108, -0.3782942, -2.47386, 0.2078431, 1, 0, 1,
-0.5304056, -0.442205, -1.397174, 0.2, 1, 0, 1,
-0.5289844, -0.2390317, -2.514494, 0.1921569, 1, 0, 1,
-0.5261654, 0.1518637, -0.7179842, 0.1882353, 1, 0, 1,
-0.5259745, 0.9579628, -0.524002, 0.1803922, 1, 0, 1,
-0.5258769, 1.50447, -2.135356, 0.1764706, 1, 0, 1,
-0.5241198, -0.3913094, -4.241919, 0.1686275, 1, 0, 1,
-0.5201715, 1.529287, -0.4049701, 0.1647059, 1, 0, 1,
-0.5166697, -0.04692709, -4.095428, 0.1568628, 1, 0, 1,
-0.5155767, 1.350792, -0.01478097, 0.1529412, 1, 0, 1,
-0.5145571, -0.4066209, -3.731795, 0.145098, 1, 0, 1,
-0.5139039, 2.200214, -0.9112816, 0.1411765, 1, 0, 1,
-0.5138709, -0.2143093, -1.963155, 0.1333333, 1, 0, 1,
-0.5072212, -0.5952467, -2.138158, 0.1294118, 1, 0, 1,
-0.504195, 0.05019883, -2.011946, 0.1215686, 1, 0, 1,
-0.5014146, 2.41647, -0.3488463, 0.1176471, 1, 0, 1,
-0.4987443, 1.838576, -1.90989, 0.1098039, 1, 0, 1,
-0.4970737, -2.346097, -4.188055, 0.1058824, 1, 0, 1,
-0.4946306, 0.05204576, -0.9944268, 0.09803922, 1, 0, 1,
-0.4865895, -0.5857971, -2.736292, 0.09019608, 1, 0, 1,
-0.484676, 0.9760696, -2.954855, 0.08627451, 1, 0, 1,
-0.4701899, -0.3218366, -1.123277, 0.07843138, 1, 0, 1,
-0.4653458, 0.2427103, -4.125585, 0.07450981, 1, 0, 1,
-0.4641884, 0.03483445, -1.159175, 0.06666667, 1, 0, 1,
-0.4592205, -0.8392733, -2.83347, 0.0627451, 1, 0, 1,
-0.4553648, 0.1848487, -0.9269823, 0.05490196, 1, 0, 1,
-0.454162, -0.3479928, -2.224058, 0.05098039, 1, 0, 1,
-0.4503083, 2.038574, 1.427287, 0.04313726, 1, 0, 1,
-0.4466501, 0.645179, -1.750268, 0.03921569, 1, 0, 1,
-0.4419983, 0.7816443, -0.5967938, 0.03137255, 1, 0, 1,
-0.4412787, 0.08627514, -1.924978, 0.02745098, 1, 0, 1,
-0.4356831, -1.433457, -3.045038, 0.01960784, 1, 0, 1,
-0.433703, 0.2173004, -1.345408, 0.01568628, 1, 0, 1,
-0.4321741, 1.40997, -0.1028903, 0.007843138, 1, 0, 1,
-0.4301518, -0.9463204, -3.947984, 0.003921569, 1, 0, 1,
-0.4259914, 1.375289, 1.160729, 0, 1, 0.003921569, 1,
-0.4221932, -0.1981042, -3.987987, 0, 1, 0.01176471, 1,
-0.4205008, -0.4329122, -2.078283, 0, 1, 0.01568628, 1,
-0.414307, 0.9740018, -1.213483, 0, 1, 0.02352941, 1,
-0.4111034, 0.2062565, 0.3803245, 0, 1, 0.02745098, 1,
-0.4085769, 1.286123, -0.4633588, 0, 1, 0.03529412, 1,
-0.406805, -0.4912896, -4.033269, 0, 1, 0.03921569, 1,
-0.40576, -0.363548, -1.747022, 0, 1, 0.04705882, 1,
-0.4029132, 0.4101849, -1.600985, 0, 1, 0.05098039, 1,
-0.4028867, 1.027527, 0.06033507, 0, 1, 0.05882353, 1,
-0.4025692, -0.5955507, -2.389161, 0, 1, 0.0627451, 1,
-0.3991816, -1.077797, -1.223916, 0, 1, 0.07058824, 1,
-0.3988318, -1.461422, -3.16059, 0, 1, 0.07450981, 1,
-0.3962722, -0.1845798, -2.135244, 0, 1, 0.08235294, 1,
-0.3925613, -0.3961949, -2.209867, 0, 1, 0.08627451, 1,
-0.3880362, 0.112728, -0.8759437, 0, 1, 0.09411765, 1,
-0.3857571, -1.856749, -2.152701, 0, 1, 0.1019608, 1,
-0.3845775, -0.7621349, -3.664096, 0, 1, 0.1058824, 1,
-0.3793005, -0.4393756, -2.54416, 0, 1, 0.1137255, 1,
-0.377346, 1.372716, 0.6079376, 0, 1, 0.1176471, 1,
-0.3741988, 0.8342514, -0.1024083, 0, 1, 0.1254902, 1,
-0.3700363, 1.677864, 1.044279, 0, 1, 0.1294118, 1,
-0.3675374, 0.2488119, -1.973509, 0, 1, 0.1372549, 1,
-0.3656934, 0.1617665, -1.120552, 0, 1, 0.1411765, 1,
-0.3644956, -1.616267, -1.491205, 0, 1, 0.1490196, 1,
-0.3613661, -1.208165, -3.486642, 0, 1, 0.1529412, 1,
-0.360196, -1.706355, -2.722823, 0, 1, 0.1607843, 1,
-0.3584807, 0.7872952, 0.2240588, 0, 1, 0.1647059, 1,
-0.3535496, 0.4704269, -2.162582, 0, 1, 0.172549, 1,
-0.3522524, -0.9255548, -2.030591, 0, 1, 0.1764706, 1,
-0.3503398, 0.5937741, -2.685251, 0, 1, 0.1843137, 1,
-0.3472743, -1.387666, -3.13306, 0, 1, 0.1882353, 1,
-0.3457644, 0.6559061, -0.4834868, 0, 1, 0.1960784, 1,
-0.3444161, -1.863095, -3.969035, 0, 1, 0.2039216, 1,
-0.3436145, -1.208362, -1.42387, 0, 1, 0.2078431, 1,
-0.3415698, -0.1450355, -2.103647, 0, 1, 0.2156863, 1,
-0.3393902, -0.9381002, -1.399181, 0, 1, 0.2196078, 1,
-0.3350616, 0.2967801, 0.394729, 0, 1, 0.227451, 1,
-0.3305376, -2.407372, -3.258481, 0, 1, 0.2313726, 1,
-0.3278483, -1.781445, -3.591502, 0, 1, 0.2392157, 1,
-0.3277077, 0.3191754, 0.6457008, 0, 1, 0.2431373, 1,
-0.3206115, 0.4045931, -0.5852713, 0, 1, 0.2509804, 1,
-0.3197844, -0.454788, -2.212154, 0, 1, 0.254902, 1,
-0.3167196, 0.2021201, -2.023567, 0, 1, 0.2627451, 1,
-0.3111369, 1.45751, -0.3038397, 0, 1, 0.2666667, 1,
-0.3082208, -0.8661499, -2.065277, 0, 1, 0.2745098, 1,
-0.3079167, 0.6842499, -1.260937, 0, 1, 0.2784314, 1,
-0.299142, -0.02992396, -2.950135, 0, 1, 0.2862745, 1,
-0.295294, 0.7788155, 0.252455, 0, 1, 0.2901961, 1,
-0.292651, -0.002015023, -0.1116269, 0, 1, 0.2980392, 1,
-0.2878185, -0.7474719, -3.398016, 0, 1, 0.3058824, 1,
-0.2875927, 0.3449211, 0.9856135, 0, 1, 0.3098039, 1,
-0.2871117, 1.133379, -0.4764416, 0, 1, 0.3176471, 1,
-0.2819139, -1.172964, -2.840646, 0, 1, 0.3215686, 1,
-0.2804557, -0.1919468, -2.701225, 0, 1, 0.3294118, 1,
-0.2790585, 0.03738805, -1.465446, 0, 1, 0.3333333, 1,
-0.2716575, 0.3214946, 0.2835116, 0, 1, 0.3411765, 1,
-0.271618, 2.265085, -0.2816971, 0, 1, 0.345098, 1,
-0.2706016, -0.5605479, -1.868738, 0, 1, 0.3529412, 1,
-0.2699116, -1.752898, -2.924533, 0, 1, 0.3568628, 1,
-0.267198, 0.4189379, -0.3153686, 0, 1, 0.3647059, 1,
-0.2598097, 1.096117, 0.4137096, 0, 1, 0.3686275, 1,
-0.2562546, 2.13016, 0.7356558, 0, 1, 0.3764706, 1,
-0.2562278, 0.8304028, -0.4911393, 0, 1, 0.3803922, 1,
-0.2552361, 1.109935, 0.1038904, 0, 1, 0.3882353, 1,
-0.2543155, 0.5799404, -2.259391, 0, 1, 0.3921569, 1,
-0.254199, -0.448225, -1.78186, 0, 1, 0.4, 1,
-0.2526305, -0.0785156, -1.28962, 0, 1, 0.4078431, 1,
-0.2513942, -0.5011477, -2.436969, 0, 1, 0.4117647, 1,
-0.2473393, -0.2790603, -3.747785, 0, 1, 0.4196078, 1,
-0.2427915, 0.1595513, -2.138954, 0, 1, 0.4235294, 1,
-0.2405504, 0.2981411, -2.889305, 0, 1, 0.4313726, 1,
-0.2359554, -1.762563, -3.60264, 0, 1, 0.4352941, 1,
-0.235361, -0.227028, -2.005616, 0, 1, 0.4431373, 1,
-0.2305939, -1.537442, -3.251066, 0, 1, 0.4470588, 1,
-0.2283935, 1.703319, -0.5939378, 0, 1, 0.454902, 1,
-0.2260344, 0.2006003, 0.06246973, 0, 1, 0.4588235, 1,
-0.2243484, 0.7233368, -1.225004, 0, 1, 0.4666667, 1,
-0.2201377, 0.03755607, -1.468499, 0, 1, 0.4705882, 1,
-0.2155219, 0.3424352, 0.5714954, 0, 1, 0.4784314, 1,
-0.209195, 0.3418649, -0.2719102, 0, 1, 0.4823529, 1,
-0.2075527, 1.125506, -1.465569, 0, 1, 0.4901961, 1,
-0.2039132, 0.4885903, 0.4961681, 0, 1, 0.4941176, 1,
-0.2025302, -0.1694475, -2.542974, 0, 1, 0.5019608, 1,
-0.2018707, 1.010045, 0.6621207, 0, 1, 0.509804, 1,
-0.2010544, -0.07956775, -2.303453, 0, 1, 0.5137255, 1,
-0.1920804, -0.6258438, -3.468888, 0, 1, 0.5215687, 1,
-0.1919067, 1.283653, 0.510505, 0, 1, 0.5254902, 1,
-0.1886963, -1.382728, -1.189587, 0, 1, 0.5333334, 1,
-0.1859294, 0.4351761, -0.02811354, 0, 1, 0.5372549, 1,
-0.1809506, 1.138301, 0.2654353, 0, 1, 0.5450981, 1,
-0.1807957, -1.174637, -1.679669, 0, 1, 0.5490196, 1,
-0.1800645, 1.834599, -0.2052144, 0, 1, 0.5568628, 1,
-0.1799767, 0.4873136, -0.1789756, 0, 1, 0.5607843, 1,
-0.1765963, 0.3281424, -0.4027648, 0, 1, 0.5686275, 1,
-0.1763745, 1.129716, -0.848889, 0, 1, 0.572549, 1,
-0.176132, -0.4454901, -2.113545, 0, 1, 0.5803922, 1,
-0.1714856, -0.264146, -4.187633, 0, 1, 0.5843138, 1,
-0.1700414, -0.1225119, -1.782933, 0, 1, 0.5921569, 1,
-0.1685101, 0.984132, 0.01517093, 0, 1, 0.5960785, 1,
-0.163762, 0.3883507, -1.588699, 0, 1, 0.6039216, 1,
-0.1578533, -0.684467, -3.06415, 0, 1, 0.6117647, 1,
-0.1563744, -1.22429, -3.813442, 0, 1, 0.6156863, 1,
-0.1563251, 0.284118, -1.377505, 0, 1, 0.6235294, 1,
-0.1560889, 1.244877, 0.6725224, 0, 1, 0.627451, 1,
-0.1557426, -0.14381, -3.863521, 0, 1, 0.6352941, 1,
-0.1535207, -0.6074562, -2.349255, 0, 1, 0.6392157, 1,
-0.1513263, 1.52499, 1.499205, 0, 1, 0.6470588, 1,
-0.1485498, 0.4462659, -0.003840394, 0, 1, 0.6509804, 1,
-0.1474192, 0.5748743, -0.2845421, 0, 1, 0.6588235, 1,
-0.1469577, -0.260311, -3.654938, 0, 1, 0.6627451, 1,
-0.1389039, -1.295909, -1.824573, 0, 1, 0.6705883, 1,
-0.1350132, 1.388883, 0.1211214, 0, 1, 0.6745098, 1,
-0.13281, -0.0656819, -2.396498, 0, 1, 0.682353, 1,
-0.1285861, -1.996745, -3.289204, 0, 1, 0.6862745, 1,
-0.1245351, 0.5164347, -0.9720778, 0, 1, 0.6941177, 1,
-0.1244955, -0.5941885, -3.673892, 0, 1, 0.7019608, 1,
-0.1242001, 1.090068, 1.218255, 0, 1, 0.7058824, 1,
-0.1221845, 0.7015241, -0.05056729, 0, 1, 0.7137255, 1,
-0.1204874, -0.1342875, -2.509355, 0, 1, 0.7176471, 1,
-0.1200884, -1.045401, -3.133519, 0, 1, 0.7254902, 1,
-0.1178381, -0.5747899, -4.024862, 0, 1, 0.7294118, 1,
-0.1118988, 0.08787227, -1.546691, 0, 1, 0.7372549, 1,
-0.108916, -0.7331233, -1.950758, 0, 1, 0.7411765, 1,
-0.1087371, 1.689176, 0.1329164, 0, 1, 0.7490196, 1,
-0.1054013, 0.4767424, -1.196107, 0, 1, 0.7529412, 1,
-0.1042787, 0.769492, 2.008301, 0, 1, 0.7607843, 1,
-0.1009549, -0.1153452, -2.681966, 0, 1, 0.7647059, 1,
-0.1005564, 0.9788865, 2.31381, 0, 1, 0.772549, 1,
-0.09899587, -0.8866164, -2.105477, 0, 1, 0.7764706, 1,
-0.09593955, 0.244369, -0.05505479, 0, 1, 0.7843137, 1,
-0.09576088, -0.7262995, -2.657407, 0, 1, 0.7882353, 1,
-0.0930619, 0.9104308, 0.03330234, 0, 1, 0.7960784, 1,
-0.09066357, 0.9900833, 0.7391838, 0, 1, 0.8039216, 1,
-0.08793261, -0.3048796, -3.423982, 0, 1, 0.8078431, 1,
-0.08768537, 0.2566335, 0.658086, 0, 1, 0.8156863, 1,
-0.08690522, -1.236402, -2.917746, 0, 1, 0.8196079, 1,
-0.08615822, -0.2168459, -4.514392, 0, 1, 0.827451, 1,
-0.08536378, -1.734931, -4.672016, 0, 1, 0.8313726, 1,
-0.08395104, 1.566176, -0.1061998, 0, 1, 0.8392157, 1,
-0.08078741, -0.7799035, -1.79091, 0, 1, 0.8431373, 1,
-0.07866119, 0.1598162, 0.8301195, 0, 1, 0.8509804, 1,
-0.06623142, -0.6188315, -2.509319, 0, 1, 0.854902, 1,
-0.0564693, -0.4985138, -1.576256, 0, 1, 0.8627451, 1,
-0.05250639, 0.7374855, 0.2242405, 0, 1, 0.8666667, 1,
-0.05166022, -0.4190856, -1.938225, 0, 1, 0.8745098, 1,
-0.04569392, 0.5375484, 0.02979224, 0, 1, 0.8784314, 1,
-0.04429841, 0.1242944, -0.6511702, 0, 1, 0.8862745, 1,
-0.04382239, 0.1540675, -0.3604545, 0, 1, 0.8901961, 1,
-0.04287007, -0.4796627, -3.751709, 0, 1, 0.8980392, 1,
-0.03175537, -0.619001, -2.153216, 0, 1, 0.9058824, 1,
-0.03048913, 0.7431952, -1.111537, 0, 1, 0.9098039, 1,
-0.02713181, -0.6958933, -2.646015, 0, 1, 0.9176471, 1,
-0.0266095, 1.236894, -0.6089327, 0, 1, 0.9215686, 1,
-0.02538691, -1.177861, -3.590111, 0, 1, 0.9294118, 1,
-0.02469425, 0.2893554, 1.130638, 0, 1, 0.9333333, 1,
-0.02368424, -0.2261905, -3.514426, 0, 1, 0.9411765, 1,
-0.02311149, -0.4939053, -1.833707, 0, 1, 0.945098, 1,
-0.01976671, 0.701597, -1.906549, 0, 1, 0.9529412, 1,
-0.01950795, -0.5726704, -3.528929, 0, 1, 0.9568627, 1,
-0.01893575, -0.6226063, -3.682972, 0, 1, 0.9647059, 1,
-0.01868668, -1.115262, -4.402876, 0, 1, 0.9686275, 1,
-0.01568589, 2.34753, -1.138859, 0, 1, 0.9764706, 1,
-0.01255868, 1.068523, 1.209133, 0, 1, 0.9803922, 1,
-0.0124407, -0.2562819, -3.295053, 0, 1, 0.9882353, 1,
-0.008362562, -0.09115221, -1.614509, 0, 1, 0.9921569, 1,
-0.005464687, -1.635438, -3.511183, 0, 1, 1, 1,
0.0005798041, -0.413551, 3.445638, 0, 0.9921569, 1, 1,
0.004448993, -0.7302998, 3.025445, 0, 0.9882353, 1, 1,
0.004618533, 1.016117, 0.1820462, 0, 0.9803922, 1, 1,
0.004797313, 1.138846, -0.2771425, 0, 0.9764706, 1, 1,
0.007434139, -0.5241753, 3.746051, 0, 0.9686275, 1, 1,
0.01689419, -1.673103, 2.415697, 0, 0.9647059, 1, 1,
0.01750614, -2.97017, 2.760009, 0, 0.9568627, 1, 1,
0.01782843, 0.1294858, 0.5225636, 0, 0.9529412, 1, 1,
0.02067744, 0.04117585, -1.478419, 0, 0.945098, 1, 1,
0.02231022, 1.589662, 1.312635, 0, 0.9411765, 1, 1,
0.02410799, -1.470243, 3.537908, 0, 0.9333333, 1, 1,
0.02511263, 1.485228, 0.5564513, 0, 0.9294118, 1, 1,
0.02957412, -0.4254969, 4.151815, 0, 0.9215686, 1, 1,
0.03005716, 0.008939549, -1.130022, 0, 0.9176471, 1, 1,
0.03097714, -2.191517, 3.681689, 0, 0.9098039, 1, 1,
0.03167365, 2.570047, -0.0337359, 0, 0.9058824, 1, 1,
0.03961683, 0.2738861, 0.02511032, 0, 0.8980392, 1, 1,
0.03992138, 1.202426, -0.3530955, 0, 0.8901961, 1, 1,
0.04265562, -0.05200447, 1.737373, 0, 0.8862745, 1, 1,
0.04434532, -1.473093, 3.602339, 0, 0.8784314, 1, 1,
0.04846841, 0.951152, 0.2114096, 0, 0.8745098, 1, 1,
0.05067417, 0.1930847, 3.693207, 0, 0.8666667, 1, 1,
0.05078121, 0.3929867, -0.7805905, 0, 0.8627451, 1, 1,
0.05275237, 0.07083947, -0.6047652, 0, 0.854902, 1, 1,
0.05416913, 0.1415523, 1.884809, 0, 0.8509804, 1, 1,
0.05482172, -0.7945892, 1.31291, 0, 0.8431373, 1, 1,
0.05597321, 0.8415967, -0.1794052, 0, 0.8392157, 1, 1,
0.05606288, -1.68295, 1.987893, 0, 0.8313726, 1, 1,
0.05666355, 0.9744555, -0.9491296, 0, 0.827451, 1, 1,
0.05719798, 0.2151181, -0.01214467, 0, 0.8196079, 1, 1,
0.05857806, 0.5081587, -0.125504, 0, 0.8156863, 1, 1,
0.06222977, 0.9284939, -1.218431, 0, 0.8078431, 1, 1,
0.06289852, 0.6236913, -0.9118268, 0, 0.8039216, 1, 1,
0.06418322, -1.558466, 2.347033, 0, 0.7960784, 1, 1,
0.06584177, -0.792883, 2.308336, 0, 0.7882353, 1, 1,
0.06683981, -1.465325, 2.456341, 0, 0.7843137, 1, 1,
0.06970311, -0.5978612, 2.23362, 0, 0.7764706, 1, 1,
0.07043706, -0.1892752, 3.332674, 0, 0.772549, 1, 1,
0.07473731, 0.5181941, -0.5125545, 0, 0.7647059, 1, 1,
0.07575146, 0.5096471, -0.9387443, 0, 0.7607843, 1, 1,
0.07644589, 0.9787148, 0.3124856, 0, 0.7529412, 1, 1,
0.07647823, -0.03218568, 4.715953, 0, 0.7490196, 1, 1,
0.07797268, -1.60824, 3.291489, 0, 0.7411765, 1, 1,
0.08552154, 0.535404, 0.7191069, 0, 0.7372549, 1, 1,
0.0895857, -0.7876013, 4.897491, 0, 0.7294118, 1, 1,
0.09017724, 0.4574042, -0.9872757, 0, 0.7254902, 1, 1,
0.09564785, -0.4465951, 4.131399, 0, 0.7176471, 1, 1,
0.09596554, 0.1566524, 1.292153, 0, 0.7137255, 1, 1,
0.09656518, -1.668654, 2.491659, 0, 0.7058824, 1, 1,
0.1073848, -0.4195566, 2.763094, 0, 0.6980392, 1, 1,
0.1079492, 1.29871, 0.07092472, 0, 0.6941177, 1, 1,
0.1109837, -0.7814289, 2.162533, 0, 0.6862745, 1, 1,
0.1124288, 0.2243329, -0.1405272, 0, 0.682353, 1, 1,
0.1125793, -1.000774, 4.535669, 0, 0.6745098, 1, 1,
0.1155752, 0.6463737, -1.356695, 0, 0.6705883, 1, 1,
0.1220988, 1.226646, 0.3502402, 0, 0.6627451, 1, 1,
0.1228701, -1.211246, 3.438018, 0, 0.6588235, 1, 1,
0.1235621, -0.9186401, 3.554935, 0, 0.6509804, 1, 1,
0.1256439, -0.4357632, 1.995256, 0, 0.6470588, 1, 1,
0.1260097, 0.3146646, 0.539639, 0, 0.6392157, 1, 1,
0.1280735, 1.179422, 1.973548, 0, 0.6352941, 1, 1,
0.1297477, 0.4210273, 1.151732, 0, 0.627451, 1, 1,
0.1300285, 1.122842, -0.3058625, 0, 0.6235294, 1, 1,
0.1355808, 0.2451336, -0.5424717, 0, 0.6156863, 1, 1,
0.1357056, 1.172417, -0.1983033, 0, 0.6117647, 1, 1,
0.1411917, -0.9258126, 3.936782, 0, 0.6039216, 1, 1,
0.1462995, 0.03606082, 0.5834044, 0, 0.5960785, 1, 1,
0.1606135, 0.0677724, 2.342922, 0, 0.5921569, 1, 1,
0.1619811, -0.7474949, 3.768468, 0, 0.5843138, 1, 1,
0.1657564, -0.1001251, 3.344813, 0, 0.5803922, 1, 1,
0.1658181, -0.7686634, 4.233158, 0, 0.572549, 1, 1,
0.1660929, -0.4675361, 4.138741, 0, 0.5686275, 1, 1,
0.1676889, -0.5391726, 1.360395, 0, 0.5607843, 1, 1,
0.1700008, 0.9873892, 1.002668, 0, 0.5568628, 1, 1,
0.1712975, 0.2279399, 0.4943045, 0, 0.5490196, 1, 1,
0.1759817, -1.14512, 3.490819, 0, 0.5450981, 1, 1,
0.1830978, 0.6347956, -0.9645109, 0, 0.5372549, 1, 1,
0.1833034, 0.5218694, -0.965485, 0, 0.5333334, 1, 1,
0.1835302, -1.855133, 2.461729, 0, 0.5254902, 1, 1,
0.1852894, 0.3277687, 1.308627, 0, 0.5215687, 1, 1,
0.1872053, -1.157648, 3.713479, 0, 0.5137255, 1, 1,
0.1965623, 0.3840222, -0.1897354, 0, 0.509804, 1, 1,
0.2024934, 0.2077361, 0.3682525, 0, 0.5019608, 1, 1,
0.2029405, 0.8341427, 0.2544846, 0, 0.4941176, 1, 1,
0.2056873, 0.0996658, 2.103948, 0, 0.4901961, 1, 1,
0.2106901, 1.198173, 0.1857905, 0, 0.4823529, 1, 1,
0.2110257, -1.623267, 3.224343, 0, 0.4784314, 1, 1,
0.2119305, -0.1429924, 3.563586, 0, 0.4705882, 1, 1,
0.2131318, -0.1890504, 2.580699, 0, 0.4666667, 1, 1,
0.215188, 2.087016, 0.8503351, 0, 0.4588235, 1, 1,
0.2154671, 0.2828174, 1.875609, 0, 0.454902, 1, 1,
0.2162108, -0.6979738, 2.862476, 0, 0.4470588, 1, 1,
0.2294456, -0.6883652, 3.893661, 0, 0.4431373, 1, 1,
0.2296091, -0.3485283, 1.715432, 0, 0.4352941, 1, 1,
0.2327795, -1.051767, 2.130977, 0, 0.4313726, 1, 1,
0.2362521, -0.2887607, 2.413126, 0, 0.4235294, 1, 1,
0.2414757, 0.3135818, 0.1302893, 0, 0.4196078, 1, 1,
0.2448573, -0.1752137, 1.525918, 0, 0.4117647, 1, 1,
0.2549521, -1.703555, 1.213952, 0, 0.4078431, 1, 1,
0.2678822, -0.1306448, 0.9272919, 0, 0.4, 1, 1,
0.2707742, -1.293197, 3.653732, 0, 0.3921569, 1, 1,
0.2752609, 1.354799, 0.3255728, 0, 0.3882353, 1, 1,
0.2846426, -0.0321096, 1.353871, 0, 0.3803922, 1, 1,
0.2914403, -1.78625, 3.587174, 0, 0.3764706, 1, 1,
0.2976865, 1.135317, -0.4972389, 0, 0.3686275, 1, 1,
0.2980934, -0.7289554, 0.8378438, 0, 0.3647059, 1, 1,
0.3100925, -0.836963, 3.106721, 0, 0.3568628, 1, 1,
0.3172977, -0.5448869, 2.690682, 0, 0.3529412, 1, 1,
0.3182842, 1.160414, -0.4065766, 0, 0.345098, 1, 1,
0.319547, -0.7331542, 0.6459833, 0, 0.3411765, 1, 1,
0.3196865, 0.1535077, 1.831282, 0, 0.3333333, 1, 1,
0.3201553, 0.06504131, 1.537948, 0, 0.3294118, 1, 1,
0.32192, -0.7175464, 4.00226, 0, 0.3215686, 1, 1,
0.332843, 0.2653287, 1.464177, 0, 0.3176471, 1, 1,
0.3332216, -0.179274, 1.459612, 0, 0.3098039, 1, 1,
0.3341864, 0.1271606, 0.857146, 0, 0.3058824, 1, 1,
0.3342627, 0.9652476, -0.9671873, 0, 0.2980392, 1, 1,
0.3345527, 0.6573692, 1.156663, 0, 0.2901961, 1, 1,
0.3369418, -1.104397, 1.195697, 0, 0.2862745, 1, 1,
0.3382379, -0.6105118, 4.73162, 0, 0.2784314, 1, 1,
0.3404778, -0.473258, 1.201322, 0, 0.2745098, 1, 1,
0.34309, 0.09396967, 1.765787, 0, 0.2666667, 1, 1,
0.3470689, -0.5086991, 0.8849973, 0, 0.2627451, 1, 1,
0.3499618, -0.3351462, 3.766186, 0, 0.254902, 1, 1,
0.352124, -0.5535536, 3.304404, 0, 0.2509804, 1, 1,
0.3557862, -1.72, 2.834178, 0, 0.2431373, 1, 1,
0.3577718, 0.2086132, 2.355647, 0, 0.2392157, 1, 1,
0.3611224, -0.1718681, 3.989939, 0, 0.2313726, 1, 1,
0.3625823, -0.6963125, 2.038949, 0, 0.227451, 1, 1,
0.363285, -0.6366957, 2.324073, 0, 0.2196078, 1, 1,
0.3640502, 0.4833296, 1.085296, 0, 0.2156863, 1, 1,
0.3659605, 0.5564806, 1.226817, 0, 0.2078431, 1, 1,
0.3734584, -1.229312, 3.083668, 0, 0.2039216, 1, 1,
0.3818195, -0.9572762, 1.218035, 0, 0.1960784, 1, 1,
0.3827288, -0.7955165, 1.587035, 0, 0.1882353, 1, 1,
0.3857639, 0.7988406, -0.5794557, 0, 0.1843137, 1, 1,
0.3878189, 2.425082, -0.1108163, 0, 0.1764706, 1, 1,
0.3905428, -1.226885, 3.386045, 0, 0.172549, 1, 1,
0.3914152, -0.9579753, 2.156646, 0, 0.1647059, 1, 1,
0.3934416, -0.9747494, 2.965006, 0, 0.1607843, 1, 1,
0.3971711, 0.3023793, 0.3589345, 0, 0.1529412, 1, 1,
0.3983545, 0.2253844, 0.283373, 0, 0.1490196, 1, 1,
0.3996139, -0.2228097, 1.229408, 0, 0.1411765, 1, 1,
0.4002736, 0.8412482, -0.8050685, 0, 0.1372549, 1, 1,
0.4006123, -0.2346191, 3.527828, 0, 0.1294118, 1, 1,
0.4037458, -1.519167, 1.723286, 0, 0.1254902, 1, 1,
0.4056562, -0.427626, 3.152153, 0, 0.1176471, 1, 1,
0.4070862, 0.09276187, 1.016942, 0, 0.1137255, 1, 1,
0.4099851, 1.315902, 0.113908, 0, 0.1058824, 1, 1,
0.4103782, 0.8249173, 1.252928, 0, 0.09803922, 1, 1,
0.4109648, 0.8834206, -0.9991254, 0, 0.09411765, 1, 1,
0.4116786, 0.2046698, 1.160666, 0, 0.08627451, 1, 1,
0.4169357, -1.128049, 2.810958, 0, 0.08235294, 1, 1,
0.4170857, 1.804992, 1.508453, 0, 0.07450981, 1, 1,
0.4183714, -1.258416, 2.191747, 0, 0.07058824, 1, 1,
0.4190738, -1.66915, 3.312643, 0, 0.0627451, 1, 1,
0.4193617, -1.4841, 2.549875, 0, 0.05882353, 1, 1,
0.4195832, 1.169022, 0.1249864, 0, 0.05098039, 1, 1,
0.4380886, 1.973598, 0.2515495, 0, 0.04705882, 1, 1,
0.4409997, -0.2323391, 1.509462, 0, 0.03921569, 1, 1,
0.4450135, -0.8674667, 2.670421, 0, 0.03529412, 1, 1,
0.4474646, 0.1770722, 0.6921113, 0, 0.02745098, 1, 1,
0.4492971, -0.3970363, 3.368552, 0, 0.02352941, 1, 1,
0.4529992, 0.01427672, 1.472206, 0, 0.01568628, 1, 1,
0.4560895, -0.3763245, 2.665014, 0, 0.01176471, 1, 1,
0.457404, -0.1992937, 2.591464, 0, 0.003921569, 1, 1,
0.4641604, 0.2723906, 0.1046659, 0.003921569, 0, 1, 1,
0.4679983, 0.2085187, 1.800041, 0.007843138, 0, 1, 1,
0.4695337, 0.8602675, -0.5634075, 0.01568628, 0, 1, 1,
0.4712115, 0.7591503, -0.6140881, 0.01960784, 0, 1, 1,
0.4736399, -0.601528, 2.695706, 0.02745098, 0, 1, 1,
0.476539, -0.1644662, 0.06584428, 0.03137255, 0, 1, 1,
0.4769809, 1.880126, -1.611985, 0.03921569, 0, 1, 1,
0.4814982, -0.3640928, 1.016733, 0.04313726, 0, 1, 1,
0.482447, -0.61712, 1.721061, 0.05098039, 0, 1, 1,
0.4846493, -2.829462, 0.4179863, 0.05490196, 0, 1, 1,
0.4848213, -0.6729784, 3.608156, 0.0627451, 0, 1, 1,
0.4863495, -0.2695289, 2.584351, 0.06666667, 0, 1, 1,
0.4872341, -2.292953, 3.363938, 0.07450981, 0, 1, 1,
0.4942783, 1.284046, -0.1005178, 0.07843138, 0, 1, 1,
0.4961451, -0.7852905, 3.475232, 0.08627451, 0, 1, 1,
0.4964391, -0.4378052, 3.109, 0.09019608, 0, 1, 1,
0.4989404, 0.1856479, 0.9330537, 0.09803922, 0, 1, 1,
0.499551, -3.76687, 3.380598, 0.1058824, 0, 1, 1,
0.5004526, 0.5679683, 0.1695503, 0.1098039, 0, 1, 1,
0.5020761, -0.3570989, 0.8661013, 0.1176471, 0, 1, 1,
0.5024574, 0.5466154, 0.6091649, 0.1215686, 0, 1, 1,
0.503347, -0.4837318, 3.005109, 0.1294118, 0, 1, 1,
0.5147052, -0.7285689, 2.798202, 0.1333333, 0, 1, 1,
0.5170412, 0.8375112, 0.5473537, 0.1411765, 0, 1, 1,
0.5200995, 0.3708011, 1.171317, 0.145098, 0, 1, 1,
0.5202772, -0.9828541, 3.277353, 0.1529412, 0, 1, 1,
0.5212502, -2.248339, 2.971299, 0.1568628, 0, 1, 1,
0.5214973, 0.5986145, 1.452614, 0.1647059, 0, 1, 1,
0.5240647, -0.7104607, 1.908081, 0.1686275, 0, 1, 1,
0.5243858, 0.08722819, 1.136694, 0.1764706, 0, 1, 1,
0.5247282, 0.2592175, 0.2199427, 0.1803922, 0, 1, 1,
0.5381071, 0.05239359, 4.104176, 0.1882353, 0, 1, 1,
0.5395064, 1.439281, -0.9605809, 0.1921569, 0, 1, 1,
0.5399992, 0.2258273, 0.826158, 0.2, 0, 1, 1,
0.5441397, -0.783188, 2.599714, 0.2078431, 0, 1, 1,
0.5445602, -0.475341, 0.7750843, 0.2117647, 0, 1, 1,
0.5461875, 0.0343504, 2.91581, 0.2196078, 0, 1, 1,
0.5480002, -0.3269836, 1.598165, 0.2235294, 0, 1, 1,
0.5542094, 0.4357957, -0.2649187, 0.2313726, 0, 1, 1,
0.5602611, 0.1668174, 2.347502, 0.2352941, 0, 1, 1,
0.5621281, -0.3454099, 2.305372, 0.2431373, 0, 1, 1,
0.5647751, -0.7817187, 2.460413, 0.2470588, 0, 1, 1,
0.5666091, 0.8438423, -0.656849, 0.254902, 0, 1, 1,
0.5726746, 1.426309, -0.5526314, 0.2588235, 0, 1, 1,
0.5769487, -1.133479, 3.983101, 0.2666667, 0, 1, 1,
0.5827397, -0.7908041, 2.18028, 0.2705882, 0, 1, 1,
0.5979424, -0.2983484, -0.04941932, 0.2784314, 0, 1, 1,
0.6025367, -1.87326, 2.951478, 0.282353, 0, 1, 1,
0.6105093, 0.001652188, 4.918306, 0.2901961, 0, 1, 1,
0.6109157, 1.116058, 0.4814321, 0.2941177, 0, 1, 1,
0.6152782, -0.2883933, 2.163498, 0.3019608, 0, 1, 1,
0.6165636, 0.3471054, 1.974608, 0.3098039, 0, 1, 1,
0.6168309, -0.5658301, 2.344051, 0.3137255, 0, 1, 1,
0.6221371, 2.084662, 0.1347141, 0.3215686, 0, 1, 1,
0.6228221, 0.00096887, -0.4329782, 0.3254902, 0, 1, 1,
0.6245706, 1.969177, -0.05687449, 0.3333333, 0, 1, 1,
0.6256021, 1.90929, 2.40471, 0.3372549, 0, 1, 1,
0.6273776, -0.4725186, 0.4899958, 0.345098, 0, 1, 1,
0.6283056, 1.006174, -0.243595, 0.3490196, 0, 1, 1,
0.6289851, 0.1741755, -0.03833783, 0.3568628, 0, 1, 1,
0.6290482, -0.1882744, 1.29364, 0.3607843, 0, 1, 1,
0.6292838, -0.08369944, 3.583905, 0.3686275, 0, 1, 1,
0.6307636, -1.293898, 3.664382, 0.372549, 0, 1, 1,
0.6401166, -1.065239, 2.563517, 0.3803922, 0, 1, 1,
0.6471978, 0.6326235, -0.9139637, 0.3843137, 0, 1, 1,
0.6503263, -0.6650116, 3.099912, 0.3921569, 0, 1, 1,
0.6559733, 1.125888, 1.113562, 0.3960784, 0, 1, 1,
0.6570677, 0.8554458, 1.809495, 0.4039216, 0, 1, 1,
0.6631096, -1.800437, 1.548107, 0.4117647, 0, 1, 1,
0.6680129, -0.8991091, 3.050829, 0.4156863, 0, 1, 1,
0.6750773, -1.028823, 3.047765, 0.4235294, 0, 1, 1,
0.6790603, 1.031869, -0.7097446, 0.427451, 0, 1, 1,
0.6824409, 0.3515656, 2.387293, 0.4352941, 0, 1, 1,
0.6840122, 0.4835425, -1.281064, 0.4392157, 0, 1, 1,
0.6859769, -0.1514271, 1.264318, 0.4470588, 0, 1, 1,
0.6860685, -1.308827, 3.106997, 0.4509804, 0, 1, 1,
0.6873631, -0.202628, 3.311764, 0.4588235, 0, 1, 1,
0.6970179, -0.06803577, 0.7657461, 0.4627451, 0, 1, 1,
0.6976372, -0.9636966, 3.03252, 0.4705882, 0, 1, 1,
0.7002296, -1.388294, 1.873942, 0.4745098, 0, 1, 1,
0.7052169, -0.7414155, 2.47269, 0.4823529, 0, 1, 1,
0.709632, -0.3079873, 1.028286, 0.4862745, 0, 1, 1,
0.709815, 1.698585, 2.197773, 0.4941176, 0, 1, 1,
0.7121956, 1.261574, 0.5902748, 0.5019608, 0, 1, 1,
0.71597, -0.2445225, 0.9562353, 0.5058824, 0, 1, 1,
0.7166979, -0.2973362, 2.922761, 0.5137255, 0, 1, 1,
0.7228205, -0.6415356, 2.441413, 0.5176471, 0, 1, 1,
0.7265121, -2.011395, 2.849548, 0.5254902, 0, 1, 1,
0.7387535, -0.9966938, 2.973768, 0.5294118, 0, 1, 1,
0.7402388, -0.03409921, 0.7751022, 0.5372549, 0, 1, 1,
0.7445159, 0.06336378, 2.04123, 0.5411765, 0, 1, 1,
0.749881, -0.3907604, 1.921195, 0.5490196, 0, 1, 1,
0.765235, 1.028728, -0.04151287, 0.5529412, 0, 1, 1,
0.7704931, -0.09652044, 1.262442, 0.5607843, 0, 1, 1,
0.7730166, -0.8691148, 1.160321, 0.5647059, 0, 1, 1,
0.779981, 1.383715, 1.593994, 0.572549, 0, 1, 1,
0.7829691, 0.1313016, 1.41467, 0.5764706, 0, 1, 1,
0.784329, 0.1972741, 1.222978, 0.5843138, 0, 1, 1,
0.7858503, 0.2344046, 0.10035, 0.5882353, 0, 1, 1,
0.7867898, 1.383393, 1.070909, 0.5960785, 0, 1, 1,
0.7947234, 0.7185349, 0.8779672, 0.6039216, 0, 1, 1,
0.7976433, 1.319778, -0.4027424, 0.6078432, 0, 1, 1,
0.7986253, -0.5832244, 2.800228, 0.6156863, 0, 1, 1,
0.8027584, 0.1217708, 1.436863, 0.6196079, 0, 1, 1,
0.8060349, 1.763133, 0.1896682, 0.627451, 0, 1, 1,
0.8078261, 1.406371, 1.604782, 0.6313726, 0, 1, 1,
0.8117069, -1.20449, 1.891988, 0.6392157, 0, 1, 1,
0.8128075, 1.034349, 1.175838, 0.6431373, 0, 1, 1,
0.8190376, 1.005078, -0.5813196, 0.6509804, 0, 1, 1,
0.8216923, -0.7182061, 2.251942, 0.654902, 0, 1, 1,
0.8234347, 0.8299464, 0.01371886, 0.6627451, 0, 1, 1,
0.8300053, 1.600572, 1.439895, 0.6666667, 0, 1, 1,
0.836387, 0.8137759, 0.7621636, 0.6745098, 0, 1, 1,
0.8365753, -0.7396916, 1.226027, 0.6784314, 0, 1, 1,
0.8390852, 0.6428351, 0.4887627, 0.6862745, 0, 1, 1,
0.8391327, 0.3697947, 1.075147, 0.6901961, 0, 1, 1,
0.8391389, 1.141969, 0.9163546, 0.6980392, 0, 1, 1,
0.8453911, -2.328545, 3.120592, 0.7058824, 0, 1, 1,
0.847187, -1.679685, 1.588199, 0.7098039, 0, 1, 1,
0.8480666, 1.986426, 0.618705, 0.7176471, 0, 1, 1,
0.8525503, 0.9426296, 2.388382, 0.7215686, 0, 1, 1,
0.8541969, -1.09784, 2.486063, 0.7294118, 0, 1, 1,
0.8568344, 1.276121, 0.3538889, 0.7333333, 0, 1, 1,
0.8581033, 0.0447442, 0.6350821, 0.7411765, 0, 1, 1,
0.8648637, 0.7307509, 0.8634322, 0.7450981, 0, 1, 1,
0.8672077, 0.5166952, 0.007134573, 0.7529412, 0, 1, 1,
0.8690419, 0.1858855, 1.683757, 0.7568628, 0, 1, 1,
0.8727412, -2.39801, 1.865483, 0.7647059, 0, 1, 1,
0.8734756, -1.029225, 0.8493301, 0.7686275, 0, 1, 1,
0.873851, 0.3573283, -1.205636, 0.7764706, 0, 1, 1,
0.8880062, -1.623462, 3.208884, 0.7803922, 0, 1, 1,
0.8898736, 1.114729, 3.292214, 0.7882353, 0, 1, 1,
0.8905481, -2.403321, 1.498878, 0.7921569, 0, 1, 1,
0.8906637, -1.541071, 0.8494436, 0.8, 0, 1, 1,
0.9003791, -0.1675026, 2.899694, 0.8078431, 0, 1, 1,
0.901558, -0.6668864, 2.474958, 0.8117647, 0, 1, 1,
0.9076806, -1.290333, 3.140625, 0.8196079, 0, 1, 1,
0.9100333, -0.7128943, 2.40179, 0.8235294, 0, 1, 1,
0.9101856, -0.4513949, 3.356077, 0.8313726, 0, 1, 1,
0.9113424, -1.111385, 2.547648, 0.8352941, 0, 1, 1,
0.9136031, -0.6606435, 2.749431, 0.8431373, 0, 1, 1,
0.9243582, -0.4471523, 2.643327, 0.8470588, 0, 1, 1,
0.9270139, 1.834877, 0.9890489, 0.854902, 0, 1, 1,
0.9302858, -0.704433, 2.034383, 0.8588235, 0, 1, 1,
0.9383133, -1.065853, 0.8381657, 0.8666667, 0, 1, 1,
0.9483454, 1.217349, 1.824121, 0.8705882, 0, 1, 1,
0.9531108, -0.5342501, 4.680702, 0.8784314, 0, 1, 1,
0.9551526, -0.09648189, 1.997384, 0.8823529, 0, 1, 1,
0.9596415, -0.009802729, 0.6453809, 0.8901961, 0, 1, 1,
0.9630021, 0.03332098, 1.067553, 0.8941177, 0, 1, 1,
0.967132, -1.1201, 2.41202, 0.9019608, 0, 1, 1,
0.971447, 2.204846, 1.5534, 0.9098039, 0, 1, 1,
0.9728, -1.302047, 2.33159, 0.9137255, 0, 1, 1,
0.9728425, -0.4396861, 0.5880281, 0.9215686, 0, 1, 1,
0.9737242, 1.177719, 1.106712, 0.9254902, 0, 1, 1,
0.9753818, 1.208486, 1.293045, 0.9333333, 0, 1, 1,
0.9797087, 0.7099231, 2.083255, 0.9372549, 0, 1, 1,
0.9856949, -1.113058, 1.508048, 0.945098, 0, 1, 1,
0.9864141, 0.08693192, 2.971328, 0.9490196, 0, 1, 1,
0.9878308, -0.8129786, 1.183024, 0.9568627, 0, 1, 1,
0.9897294, 0.2352525, 1.370261, 0.9607843, 0, 1, 1,
0.9899957, -2.137554, 3.397688, 0.9686275, 0, 1, 1,
0.9901479, 1.370785, 1.731043, 0.972549, 0, 1, 1,
0.9906243, 0.6109798, 2.281244, 0.9803922, 0, 1, 1,
0.9934011, -0.5873498, 1.540382, 0.9843137, 0, 1, 1,
0.9987685, 0.6502683, 1.7196, 0.9921569, 0, 1, 1,
0.9989355, 0.1209691, 2.030308, 0.9960784, 0, 1, 1,
1.007355, -2.316495, 1.513358, 1, 0, 0.9960784, 1,
1.012742, -0.0372455, 3.33967, 1, 0, 0.9882353, 1,
1.019824, -0.5392076, 1.954155, 1, 0, 0.9843137, 1,
1.024979, 1.087243, 0.027196, 1, 0, 0.9764706, 1,
1.034307, 1.621788, -0.3164723, 1, 0, 0.972549, 1,
1.034421, 0.1722776, 2.005139, 1, 0, 0.9647059, 1,
1.038002, -0.1404933, 2.268422, 1, 0, 0.9607843, 1,
1.042259, -0.8134652, 1.314974, 1, 0, 0.9529412, 1,
1.044969, 0.5855643, 1.89283, 1, 0, 0.9490196, 1,
1.0513, 0.9026645, 1.148664, 1, 0, 0.9411765, 1,
1.054214, -0.0461816, 1.37619, 1, 0, 0.9372549, 1,
1.057796, -1.221197, 2.09851, 1, 0, 0.9294118, 1,
1.059701, -0.1559034, 0.8060527, 1, 0, 0.9254902, 1,
1.061848, 0.4153465, 0.5278646, 1, 0, 0.9176471, 1,
1.06543, 0.3100762, 1.347893, 1, 0, 0.9137255, 1,
1.065887, 0.6074901, -1.139633, 1, 0, 0.9058824, 1,
1.070264, 0.04415527, 2.460944, 1, 0, 0.9019608, 1,
1.073243, 1.284838, 0.07797239, 1, 0, 0.8941177, 1,
1.079546, -0.8134305, 1.169022, 1, 0, 0.8862745, 1,
1.089468, -0.5024303, 3.411327, 1, 0, 0.8823529, 1,
1.09069, 0.05648796, 1.8522, 1, 0, 0.8745098, 1,
1.093298, 0.2147822, 2.401532, 1, 0, 0.8705882, 1,
1.097116, -0.3709902, 0.591543, 1, 0, 0.8627451, 1,
1.103723, -0.1206446, 2.840016, 1, 0, 0.8588235, 1,
1.104151, 0.470211, 0.6600907, 1, 0, 0.8509804, 1,
1.10602, 0.1469296, 2.147526, 1, 0, 0.8470588, 1,
1.10616, 0.9117215, 2.26402, 1, 0, 0.8392157, 1,
1.110352, -0.0786044, 1.676738, 1, 0, 0.8352941, 1,
1.114438, -1.573953, 2.036192, 1, 0, 0.827451, 1,
1.132187, -0.3852575, 2.196489, 1, 0, 0.8235294, 1,
1.134833, 0.2137212, 1.239273, 1, 0, 0.8156863, 1,
1.14551, 0.4520763, 1.289441, 1, 0, 0.8117647, 1,
1.149674, -0.3730279, 2.613084, 1, 0, 0.8039216, 1,
1.152422, 0.4633171, 1.551209, 1, 0, 0.7960784, 1,
1.157191, 0.7793211, 1.657297, 1, 0, 0.7921569, 1,
1.160078, -0.9758199, 3.464364, 1, 0, 0.7843137, 1,
1.172701, -0.2335665, 2.410049, 1, 0, 0.7803922, 1,
1.176857, -0.01752111, 2.460189, 1, 0, 0.772549, 1,
1.182819, 0.08849027, 0.6205224, 1, 0, 0.7686275, 1,
1.18865, -1.243627, 4.391959, 1, 0, 0.7607843, 1,
1.191641, -0.8425913, 2.082218, 1, 0, 0.7568628, 1,
1.195782, 1.418939, 2.746516, 1, 0, 0.7490196, 1,
1.205717, -0.6533507, -0.06389344, 1, 0, 0.7450981, 1,
1.207799, -0.4690345, 1.415138, 1, 0, 0.7372549, 1,
1.22318, 0.04752531, 1.980922, 1, 0, 0.7333333, 1,
1.226187, -2.008636, 2.060843, 1, 0, 0.7254902, 1,
1.233136, -0.7803093, 3.328026, 1, 0, 0.7215686, 1,
1.233804, -0.9633708, 3.395266, 1, 0, 0.7137255, 1,
1.235242, -0.2009421, 1.802051, 1, 0, 0.7098039, 1,
1.239267, -0.9349577, 2.998177, 1, 0, 0.7019608, 1,
1.24004, 2.109525, -0.09559282, 1, 0, 0.6941177, 1,
1.250751, -0.2124243, 2.160501, 1, 0, 0.6901961, 1,
1.265009, 0.1805682, 1.282435, 1, 0, 0.682353, 1,
1.271029, 0.2898657, 1.010453, 1, 0, 0.6784314, 1,
1.272942, 0.08805274, 0.1102348, 1, 0, 0.6705883, 1,
1.286705, 1.193508, 2.330394, 1, 0, 0.6666667, 1,
1.290779, 1.28597, 1.750723, 1, 0, 0.6588235, 1,
1.295442, 1.072368, 0.8329585, 1, 0, 0.654902, 1,
1.302178, 0.7097368, 1.162886, 1, 0, 0.6470588, 1,
1.315937, 0.6560315, 1.009766, 1, 0, 0.6431373, 1,
1.317414, -1.171274, 2.802391, 1, 0, 0.6352941, 1,
1.324548, 1.413304, 1.237732, 1, 0, 0.6313726, 1,
1.325189, 0.2308592, 0.3665108, 1, 0, 0.6235294, 1,
1.329999, -0.203989, 2.910962, 1, 0, 0.6196079, 1,
1.330049, -1.03141, 1.350599, 1, 0, 0.6117647, 1,
1.334259, 2.762915, -0.4425958, 1, 0, 0.6078432, 1,
1.357298, -0.5332598, 2.251649, 1, 0, 0.6, 1,
1.364213, 0.3022649, 1.545837, 1, 0, 0.5921569, 1,
1.367797, 0.2841247, 1.991051, 1, 0, 0.5882353, 1,
1.380147, 0.368729, 1.526737, 1, 0, 0.5803922, 1,
1.384545, 1.024935, 1.159558, 1, 0, 0.5764706, 1,
1.386296, 0.970247, -0.1524139, 1, 0, 0.5686275, 1,
1.400029, -0.5541041, 2.645956, 1, 0, 0.5647059, 1,
1.403703, -0.08201022, 0.7775374, 1, 0, 0.5568628, 1,
1.408211, 0.3632831, 0.3516973, 1, 0, 0.5529412, 1,
1.409599, 2.273062, 1.097203, 1, 0, 0.5450981, 1,
1.413603, -1.283462, 3.023717, 1, 0, 0.5411765, 1,
1.418337, 1.59187, 0.8959494, 1, 0, 0.5333334, 1,
1.419678, -1.401007, 2.22743, 1, 0, 0.5294118, 1,
1.42681, 0.2544023, 2.855387, 1, 0, 0.5215687, 1,
1.427572, -2.21386, 1.812996, 1, 0, 0.5176471, 1,
1.440665, -1.023122, 2.088355, 1, 0, 0.509804, 1,
1.443775, 0.7029177, 1.086809, 1, 0, 0.5058824, 1,
1.463234, 1.794574, -0.3433638, 1, 0, 0.4980392, 1,
1.476201, -1.405974, 3.34742, 1, 0, 0.4901961, 1,
1.489685, 1.249313, 1.675123, 1, 0, 0.4862745, 1,
1.50495, 0.815253, 0.5587775, 1, 0, 0.4784314, 1,
1.530673, 1.447071, 1.497046, 1, 0, 0.4745098, 1,
1.535621, 0.08203653, 2.984327, 1, 0, 0.4666667, 1,
1.541121, -0.261727, 2.134499, 1, 0, 0.4627451, 1,
1.54266, -0.6320027, 2.042227, 1, 0, 0.454902, 1,
1.559545, 1.141185, -0.5789836, 1, 0, 0.4509804, 1,
1.567416, 0.5912977, 0.5736052, 1, 0, 0.4431373, 1,
1.572619, 0.4707669, 1.438615, 1, 0, 0.4392157, 1,
1.578406, 0.3232204, 1.929565, 1, 0, 0.4313726, 1,
1.583456, -0.8772506, 3.213061, 1, 0, 0.427451, 1,
1.585939, -0.2667796, 2.665332, 1, 0, 0.4196078, 1,
1.594786, -0.3598191, 1.606752, 1, 0, 0.4156863, 1,
1.596787, 1.330043, 0.5308648, 1, 0, 0.4078431, 1,
1.609493, -0.9628965, 1.080563, 1, 0, 0.4039216, 1,
1.614966, 0.9727182, -0.6239033, 1, 0, 0.3960784, 1,
1.625066, -0.4268579, 1.296613, 1, 0, 0.3882353, 1,
1.646001, -1.304432, 0.2309971, 1, 0, 0.3843137, 1,
1.647983, -1.351463, 1.220918, 1, 0, 0.3764706, 1,
1.653032, 1.613659, -1.045164, 1, 0, 0.372549, 1,
1.655048, -2.063437, 1.070212, 1, 0, 0.3647059, 1,
1.664199, -0.04369835, 1.703116, 1, 0, 0.3607843, 1,
1.66825, 0.6091989, 1.995205, 1, 0, 0.3529412, 1,
1.677541, -2.173028, 3.32071, 1, 0, 0.3490196, 1,
1.689758, -0.967647, 1.850949, 1, 0, 0.3411765, 1,
1.690454, 1.428694, 1.518501, 1, 0, 0.3372549, 1,
1.691169, 1.092824, 0.9629718, 1, 0, 0.3294118, 1,
1.697077, -1.920705, 3.455034, 1, 0, 0.3254902, 1,
1.700674, -1.471559, 0.2469476, 1, 0, 0.3176471, 1,
1.702054, -0.1228374, 0.9337455, 1, 0, 0.3137255, 1,
1.718285, -1.524215, 2.171332, 1, 0, 0.3058824, 1,
1.720101, 1.170414, 1.666858, 1, 0, 0.2980392, 1,
1.730161, 1.069432, 0.9134147, 1, 0, 0.2941177, 1,
1.74664, 2.312374, -1.007594, 1, 0, 0.2862745, 1,
1.747276, 1.727173, 0.8171041, 1, 0, 0.282353, 1,
1.748777, 1.32455, -0.441064, 1, 0, 0.2745098, 1,
1.748856, -0.1249165, 0.09177089, 1, 0, 0.2705882, 1,
1.750119, 2.327683, -0.240053, 1, 0, 0.2627451, 1,
1.750464, 0.09398103, 0.1597105, 1, 0, 0.2588235, 1,
1.751659, -0.04334689, 0.3149122, 1, 0, 0.2509804, 1,
1.757761, 0.8286486, 1.808321, 1, 0, 0.2470588, 1,
1.801986, -0.9398819, 2.124722, 1, 0, 0.2392157, 1,
1.802143, -1.324078, 2.742601, 1, 0, 0.2352941, 1,
1.819288, 1.429224, 0.2227088, 1, 0, 0.227451, 1,
1.81985, 0.8049225, 2.99967, 1, 0, 0.2235294, 1,
1.833773, 0.1133343, 0.4042853, 1, 0, 0.2156863, 1,
1.836126, -0.8202804, 2.160658, 1, 0, 0.2117647, 1,
1.861951, -0.2025685, 0.3985429, 1, 0, 0.2039216, 1,
1.866704, 0.8748857, 1.199648, 1, 0, 0.1960784, 1,
1.872651, 0.4987518, -0.4044521, 1, 0, 0.1921569, 1,
1.873731, -0.1153132, 0.8039623, 1, 0, 0.1843137, 1,
1.888714, -0.3096471, 1.471624, 1, 0, 0.1803922, 1,
1.917193, -0.3174387, 0.9796945, 1, 0, 0.172549, 1,
1.92802, -0.3296818, 3.96872, 1, 0, 0.1686275, 1,
1.948822, -0.0381366, 1.319795, 1, 0, 0.1607843, 1,
1.959178, -1.620235, 1.694417, 1, 0, 0.1568628, 1,
1.970652, -0.2864151, 1.932595, 1, 0, 0.1490196, 1,
1.979975, 0.5429546, 1.573804, 1, 0, 0.145098, 1,
1.996429, -0.5234683, -0.3952911, 1, 0, 0.1372549, 1,
2.001108, 0.1969982, 1.207209, 1, 0, 0.1333333, 1,
2.056836, -0.7729052, 2.33527, 1, 0, 0.1254902, 1,
2.057442, 2.474383, 0.7742925, 1, 0, 0.1215686, 1,
2.063507, -1.487348, 1.152868, 1, 0, 0.1137255, 1,
2.094015, 0.3777711, 0.6357315, 1, 0, 0.1098039, 1,
2.112212, -0.2706803, 0.06786475, 1, 0, 0.1019608, 1,
2.123873, 0.6475248, -0.3473775, 1, 0, 0.09411765, 1,
2.193851, -1.05826, 2.43813, 1, 0, 0.09019608, 1,
2.227243, -0.8490902, 0.2264856, 1, 0, 0.08235294, 1,
2.235105, 1.161435, 2.834893, 1, 0, 0.07843138, 1,
2.245955, 1.320068, 1.550353, 1, 0, 0.07058824, 1,
2.248065, 0.4632033, 1.811712, 1, 0, 0.06666667, 1,
2.30044, -0.5708752, 2.624776, 1, 0, 0.05882353, 1,
2.384262, 0.8247868, 2.250636, 1, 0, 0.05490196, 1,
2.410156, -0.164121, 1.243003, 1, 0, 0.04705882, 1,
2.463623, 0.574864, 2.417382, 1, 0, 0.04313726, 1,
2.617208, -1.465085, 2.091509, 1, 0, 0.03529412, 1,
2.725675, -0.4905763, 2.139767, 1, 0, 0.03137255, 1,
2.874732, 0.6407242, 3.484424, 1, 0, 0.02352941, 1,
2.887029, 0.3877193, 0.9709309, 1, 0, 0.01960784, 1,
2.891517, 0.1318039, 1.509332, 1, 0, 0.01176471, 1,
2.909195, 1.011717, 2.158998, 1, 0, 0.007843138, 1
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
-0.5072615, -4.900629, -6.697085, 0, -0.5, 0.5, 0.5,
-0.5072615, -4.900629, -6.697085, 1, -0.5, 0.5, 0.5,
-0.5072615, -4.900629, -6.697085, 1, 1.5, 0.5, 0.5,
-0.5072615, -4.900629, -6.697085, 0, 1.5, 0.5, 0.5
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
-5.081897, -0.4224503, -6.697085, 0, -0.5, 0.5, 0.5,
-5.081897, -0.4224503, -6.697085, 1, -0.5, 0.5, 0.5,
-5.081897, -0.4224503, -6.697085, 1, 1.5, 0.5, 0.5,
-5.081897, -0.4224503, -6.697085, 0, 1.5, 0.5, 0.5
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
-5.081897, -4.900629, -0.04765821, 0, -0.5, 0.5, 0.5,
-5.081897, -4.900629, -0.04765821, 1, -0.5, 0.5, 0.5,
-5.081897, -4.900629, -0.04765821, 1, 1.5, 0.5, 0.5,
-5.081897, -4.900629, -0.04765821, 0, 1.5, 0.5, 0.5
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
-3, -3.867203, -5.162601,
2, -3.867203, -5.162601,
-3, -3.867203, -5.162601,
-3, -4.039441, -5.418349,
-2, -3.867203, -5.162601,
-2, -4.039441, -5.418349,
-1, -3.867203, -5.162601,
-1, -4.039441, -5.418349,
0, -3.867203, -5.162601,
0, -4.039441, -5.418349,
1, -3.867203, -5.162601,
1, -4.039441, -5.418349,
2, -3.867203, -5.162601,
2, -4.039441, -5.418349
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
-3, -4.383916, -5.929843, 0, -0.5, 0.5, 0.5,
-3, -4.383916, -5.929843, 1, -0.5, 0.5, 0.5,
-3, -4.383916, -5.929843, 1, 1.5, 0.5, 0.5,
-3, -4.383916, -5.929843, 0, 1.5, 0.5, 0.5,
-2, -4.383916, -5.929843, 0, -0.5, 0.5, 0.5,
-2, -4.383916, -5.929843, 1, -0.5, 0.5, 0.5,
-2, -4.383916, -5.929843, 1, 1.5, 0.5, 0.5,
-2, -4.383916, -5.929843, 0, 1.5, 0.5, 0.5,
-1, -4.383916, -5.929843, 0, -0.5, 0.5, 0.5,
-1, -4.383916, -5.929843, 1, -0.5, 0.5, 0.5,
-1, -4.383916, -5.929843, 1, 1.5, 0.5, 0.5,
-1, -4.383916, -5.929843, 0, 1.5, 0.5, 0.5,
0, -4.383916, -5.929843, 0, -0.5, 0.5, 0.5,
0, -4.383916, -5.929843, 1, -0.5, 0.5, 0.5,
0, -4.383916, -5.929843, 1, 1.5, 0.5, 0.5,
0, -4.383916, -5.929843, 0, 1.5, 0.5, 0.5,
1, -4.383916, -5.929843, 0, -0.5, 0.5, 0.5,
1, -4.383916, -5.929843, 1, -0.5, 0.5, 0.5,
1, -4.383916, -5.929843, 1, 1.5, 0.5, 0.5,
1, -4.383916, -5.929843, 0, 1.5, 0.5, 0.5,
2, -4.383916, -5.929843, 0, -0.5, 0.5, 0.5,
2, -4.383916, -5.929843, 1, -0.5, 0.5, 0.5,
2, -4.383916, -5.929843, 1, 1.5, 0.5, 0.5,
2, -4.383916, -5.929843, 0, 1.5, 0.5, 0.5
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
-4.026212, -3, -5.162601,
-4.026212, 2, -5.162601,
-4.026212, -3, -5.162601,
-4.20216, -3, -5.418349,
-4.026212, -2, -5.162601,
-4.20216, -2, -5.418349,
-4.026212, -1, -5.162601,
-4.20216, -1, -5.418349,
-4.026212, 0, -5.162601,
-4.20216, 0, -5.418349,
-4.026212, 1, -5.162601,
-4.20216, 1, -5.418349,
-4.026212, 2, -5.162601,
-4.20216, 2, -5.418349
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
-4.554055, -3, -5.929843, 0, -0.5, 0.5, 0.5,
-4.554055, -3, -5.929843, 1, -0.5, 0.5, 0.5,
-4.554055, -3, -5.929843, 1, 1.5, 0.5, 0.5,
-4.554055, -3, -5.929843, 0, 1.5, 0.5, 0.5,
-4.554055, -2, -5.929843, 0, -0.5, 0.5, 0.5,
-4.554055, -2, -5.929843, 1, -0.5, 0.5, 0.5,
-4.554055, -2, -5.929843, 1, 1.5, 0.5, 0.5,
-4.554055, -2, -5.929843, 0, 1.5, 0.5, 0.5,
-4.554055, -1, -5.929843, 0, -0.5, 0.5, 0.5,
-4.554055, -1, -5.929843, 1, -0.5, 0.5, 0.5,
-4.554055, -1, -5.929843, 1, 1.5, 0.5, 0.5,
-4.554055, -1, -5.929843, 0, 1.5, 0.5, 0.5,
-4.554055, 0, -5.929843, 0, -0.5, 0.5, 0.5,
-4.554055, 0, -5.929843, 1, -0.5, 0.5, 0.5,
-4.554055, 0, -5.929843, 1, 1.5, 0.5, 0.5,
-4.554055, 0, -5.929843, 0, 1.5, 0.5, 0.5,
-4.554055, 1, -5.929843, 0, -0.5, 0.5, 0.5,
-4.554055, 1, -5.929843, 1, -0.5, 0.5, 0.5,
-4.554055, 1, -5.929843, 1, 1.5, 0.5, 0.5,
-4.554055, 1, -5.929843, 0, 1.5, 0.5, 0.5,
-4.554055, 2, -5.929843, 0, -0.5, 0.5, 0.5,
-4.554055, 2, -5.929843, 1, -0.5, 0.5, 0.5,
-4.554055, 2, -5.929843, 1, 1.5, 0.5, 0.5,
-4.554055, 2, -5.929843, 0, 1.5, 0.5, 0.5
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
-4.026212, -3.867203, -4,
-4.026212, -3.867203, 4,
-4.026212, -3.867203, -4,
-4.20216, -4.039441, -4,
-4.026212, -3.867203, -2,
-4.20216, -4.039441, -2,
-4.026212, -3.867203, 0,
-4.20216, -4.039441, 0,
-4.026212, -3.867203, 2,
-4.20216, -4.039441, 2,
-4.026212, -3.867203, 4,
-4.20216, -4.039441, 4
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
-4.554055, -4.383916, -4, 0, -0.5, 0.5, 0.5,
-4.554055, -4.383916, -4, 1, -0.5, 0.5, 0.5,
-4.554055, -4.383916, -4, 1, 1.5, 0.5, 0.5,
-4.554055, -4.383916, -4, 0, 1.5, 0.5, 0.5,
-4.554055, -4.383916, -2, 0, -0.5, 0.5, 0.5,
-4.554055, -4.383916, -2, 1, -0.5, 0.5, 0.5,
-4.554055, -4.383916, -2, 1, 1.5, 0.5, 0.5,
-4.554055, -4.383916, -2, 0, 1.5, 0.5, 0.5,
-4.554055, -4.383916, 0, 0, -0.5, 0.5, 0.5,
-4.554055, -4.383916, 0, 1, -0.5, 0.5, 0.5,
-4.554055, -4.383916, 0, 1, 1.5, 0.5, 0.5,
-4.554055, -4.383916, 0, 0, 1.5, 0.5, 0.5,
-4.554055, -4.383916, 2, 0, -0.5, 0.5, 0.5,
-4.554055, -4.383916, 2, 1, -0.5, 0.5, 0.5,
-4.554055, -4.383916, 2, 1, 1.5, 0.5, 0.5,
-4.554055, -4.383916, 2, 0, 1.5, 0.5, 0.5,
-4.554055, -4.383916, 4, 0, -0.5, 0.5, 0.5,
-4.554055, -4.383916, 4, 1, -0.5, 0.5, 0.5,
-4.554055, -4.383916, 4, 1, 1.5, 0.5, 0.5,
-4.554055, -4.383916, 4, 0, 1.5, 0.5, 0.5
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
-4.026212, -3.867203, -5.162601,
-4.026212, 3.022302, -5.162601,
-4.026212, -3.867203, 5.067285,
-4.026212, 3.022302, 5.067285,
-4.026212, -3.867203, -5.162601,
-4.026212, -3.867203, 5.067285,
-4.026212, 3.022302, -5.162601,
-4.026212, 3.022302, 5.067285,
-4.026212, -3.867203, -5.162601,
3.011689, -3.867203, -5.162601,
-4.026212, -3.867203, 5.067285,
3.011689, -3.867203, 5.067285,
-4.026212, 3.022302, -5.162601,
3.011689, 3.022302, -5.162601,
-4.026212, 3.022302, 5.067285,
3.011689, 3.022302, 5.067285,
3.011689, -3.867203, -5.162601,
3.011689, 3.022302, -5.162601,
3.011689, -3.867203, 5.067285,
3.011689, 3.022302, 5.067285,
3.011689, -3.867203, -5.162601,
3.011689, -3.867203, 5.067285,
3.011689, 3.022302, -5.162601,
3.011689, 3.022302, 5.067285
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
var radius = 7.582673;
var distance = 33.73617;
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
mvMatrix.translate( 0.5072615, 0.4224503, 0.04765821 );
mvMatrix.scale( 1.164912, 1.190003, 0.8014297 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.73617);
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
choline_chloride<-read.table("choline_chloride.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-choline_chloride$V2
```

```
## Error in eval(expr, envir, enclos): object 'choline_chloride' not found
```

```r
y<-choline_chloride$V3
```

```
## Error in eval(expr, envir, enclos): object 'choline_chloride' not found
```

```r
z<-choline_chloride$V4
```

```
## Error in eval(expr, envir, enclos): object 'choline_chloride' not found
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
-3.923718, -0.8290818, -1.141592, 0, 0, 1, 1, 1,
-3.555447, -0.1873591, -3.044722, 1, 0, 0, 1, 1,
-3.409519, -1.224483, -2.849929, 1, 0, 0, 1, 1,
-2.907456, -0.9383471, -2.266768, 1, 0, 0, 1, 1,
-2.772808, -1.109589, -4.239891, 1, 0, 0, 1, 1,
-2.767283, 1.094371, 0.631817, 1, 0, 0, 1, 1,
-2.673238, -1.098069, -2.332883, 0, 0, 0, 1, 1,
-2.524328, 0.2233847, -2.927917, 0, 0, 0, 1, 1,
-2.521775, -1.735959, -2.872096, 0, 0, 0, 1, 1,
-2.437365, -0.09556798, -2.556936, 0, 0, 0, 1, 1,
-2.381371, -0.07009258, -2.092486, 0, 0, 0, 1, 1,
-2.36413, -1.077996, -2.168073, 0, 0, 0, 1, 1,
-2.327245, -0.4628805, -1.680009, 0, 0, 0, 1, 1,
-2.297221, 0.6540892, -1.109117, 1, 1, 1, 1, 1,
-2.253189, 0.0539224, -2.675904, 1, 1, 1, 1, 1,
-2.250629, -7.844555e-05, -1.714916, 1, 1, 1, 1, 1,
-2.243928, 1.125522, 0.4443305, 1, 1, 1, 1, 1,
-2.236976, -1.543513, -2.493193, 1, 1, 1, 1, 1,
-2.216138, -1.276549, -2.404932, 1, 1, 1, 1, 1,
-2.180502, 0.7830955, -0.2625185, 1, 1, 1, 1, 1,
-2.166415, -0.06078058, -1.219823, 1, 1, 1, 1, 1,
-2.090627, -1.600108, -2.332261, 1, 1, 1, 1, 1,
-2.071791, 0.9939613, -2.663231, 1, 1, 1, 1, 1,
-2.068233, -0.2943727, -1.811776, 1, 1, 1, 1, 1,
-2.039058, -1.065779, -1.803274, 1, 1, 1, 1, 1,
-2.03221, -0.06279509, -1.645895, 1, 1, 1, 1, 1,
-2.031853, -0.7884926, -1.607957, 1, 1, 1, 1, 1,
-2.024714, 0.7815306, -1.933156, 1, 1, 1, 1, 1,
-2.008153, 0.109096, -0.4984027, 0, 0, 1, 1, 1,
-1.977494, -1.438622, -2.069148, 1, 0, 0, 1, 1,
-1.97034, -1.303893, -4.189035, 1, 0, 0, 1, 1,
-1.968462, 1.0892, -0.1379735, 1, 0, 0, 1, 1,
-1.960292, 1.167275, -0.3863744, 1, 0, 0, 1, 1,
-1.934065, -0.6207188, -3.279433, 1, 0, 0, 1, 1,
-1.92546, 0.6736137, 0.2390519, 0, 0, 0, 1, 1,
-1.917039, 0.8502325, -0.070224, 0, 0, 0, 1, 1,
-1.909062, 0.3636231, -1.469335, 0, 0, 0, 1, 1,
-1.883781, -1.160437, -1.947184, 0, 0, 0, 1, 1,
-1.876491, -0.1552239, -3.376864, 0, 0, 0, 1, 1,
-1.860345, 0.4572293, 0.2935778, 0, 0, 0, 1, 1,
-1.835598, 0.3349434, -1.714745, 0, 0, 0, 1, 1,
-1.831868, -0.5312338, -1.275313, 1, 1, 1, 1, 1,
-1.824435, 1.182424, -2.008614, 1, 1, 1, 1, 1,
-1.817518, -1.165733, -1.438138, 1, 1, 1, 1, 1,
-1.805877, 1.482833, -0.837632, 1, 1, 1, 1, 1,
-1.796655, -0.6226503, -3.365443, 1, 1, 1, 1, 1,
-1.796515, -0.1508057, -0.9450039, 1, 1, 1, 1, 1,
-1.78979, -0.4450858, -3.09857, 1, 1, 1, 1, 1,
-1.781628, 0.3010055, -2.361878, 1, 1, 1, 1, 1,
-1.735659, 1.519829, -0.6706958, 1, 1, 1, 1, 1,
-1.729963, -0.5392981, -1.769183, 1, 1, 1, 1, 1,
-1.7261, -0.2868838, -2.383069, 1, 1, 1, 1, 1,
-1.724977, -0.2518544, -1.837051, 1, 1, 1, 1, 1,
-1.720196, -1.67072, -4.283925, 1, 1, 1, 1, 1,
-1.656845, -1.370043, -2.174419, 1, 1, 1, 1, 1,
-1.647749, 0.219907, 0.9844362, 1, 1, 1, 1, 1,
-1.644974, -1.417385, -1.985968, 0, 0, 1, 1, 1,
-1.640259, 0.6137156, -1.690813, 1, 0, 0, 1, 1,
-1.636894, 0.3047069, -1.770464, 1, 0, 0, 1, 1,
-1.627605, -0.7166924, -2.171145, 1, 0, 0, 1, 1,
-1.623276, 0.3800266, -2.579402, 1, 0, 0, 1, 1,
-1.595737, 0.1409234, -0.07721541, 1, 0, 0, 1, 1,
-1.587726, -0.7624437, -1.581096, 0, 0, 0, 1, 1,
-1.578976, 0.9885138, -2.270645, 0, 0, 0, 1, 1,
-1.567919, -0.7073884, -3.97879, 0, 0, 0, 1, 1,
-1.537256, -1.209174, -2.452476, 0, 0, 0, 1, 1,
-1.522657, -0.3953381, -2.924526, 0, 0, 0, 1, 1,
-1.495754, -1.004364, -2.872941, 0, 0, 0, 1, 1,
-1.486896, -0.4838885, -2.464123, 0, 0, 0, 1, 1,
-1.48181, -0.1852471, -1.02572, 1, 1, 1, 1, 1,
-1.473541, 1.50422, -0.6057698, 1, 1, 1, 1, 1,
-1.466898, 0.5910705, -0.8998769, 1, 1, 1, 1, 1,
-1.465814, -0.271152, -1.869757, 1, 1, 1, 1, 1,
-1.451121, 0.922662, -1.677265, 1, 1, 1, 1, 1,
-1.444538, 1.902968, 0.1129278, 1, 1, 1, 1, 1,
-1.432789, 0.9073165, -1.219392, 1, 1, 1, 1, 1,
-1.430201, -0.9823012, -1.804128, 1, 1, 1, 1, 1,
-1.416601, -1.677352, 0.462578, 1, 1, 1, 1, 1,
-1.412193, 1.111141, -1.703184, 1, 1, 1, 1, 1,
-1.411172, -0.105433, -1.389986, 1, 1, 1, 1, 1,
-1.403138, 1.33009, -0.5811681, 1, 1, 1, 1, 1,
-1.381704, -1.412937, -3.648157, 1, 1, 1, 1, 1,
-1.376053, -0.06570525, -0.420164, 1, 1, 1, 1, 1,
-1.364621, -0.7046133, -2.217507, 1, 1, 1, 1, 1,
-1.35947, -0.5404655, 0.2524012, 0, 0, 1, 1, 1,
-1.358479, -1.180311, -2.569117, 1, 0, 0, 1, 1,
-1.356371, 1.416936, -0.560779, 1, 0, 0, 1, 1,
-1.353241, -0.9341062, -3.516642, 1, 0, 0, 1, 1,
-1.328673, 1.63945, 0.7636509, 1, 0, 0, 1, 1,
-1.322423, -0.2826506, -1.227109, 1, 0, 0, 1, 1,
-1.321361, -0.567973, -1.351064, 0, 0, 0, 1, 1,
-1.317527, -0.1167487, -1.355944, 0, 0, 0, 1, 1,
-1.310567, -0.3444256, -1.141117, 0, 0, 0, 1, 1,
-1.307428, -1.894201, -1.423511, 0, 0, 0, 1, 1,
-1.306821, 0.3807748, -1.12864, 0, 0, 0, 1, 1,
-1.276598, -1.062582, -2.440085, 0, 0, 0, 1, 1,
-1.266526, 0.3540182, -1.998178, 0, 0, 0, 1, 1,
-1.264095, 0.9845465, -1.544792, 1, 1, 1, 1, 1,
-1.264005, -0.01590212, -2.305156, 1, 1, 1, 1, 1,
-1.252019, 0.2575243, -1.943522, 1, 1, 1, 1, 1,
-1.246979, 0.4965062, -2.706101, 1, 1, 1, 1, 1,
-1.243368, 0.6088044, -4.412569, 1, 1, 1, 1, 1,
-1.240827, 1.398973, -1.137356, 1, 1, 1, 1, 1,
-1.240437, -0.5988263, -1.051863, 1, 1, 1, 1, 1,
-1.236359, 0.01171519, -2.276508, 1, 1, 1, 1, 1,
-1.223113, -1.310057, -3.596061, 1, 1, 1, 1, 1,
-1.219289, 0.07845621, -2.996444, 1, 1, 1, 1, 1,
-1.218682, -0.6860042, -2.467067, 1, 1, 1, 1, 1,
-1.202506, 0.9476065, -1.795099, 1, 1, 1, 1, 1,
-1.201592, -1.570225, -1.419485, 1, 1, 1, 1, 1,
-1.197213, -1.774667, -2.760374, 1, 1, 1, 1, 1,
-1.194842, -0.104757, -3.342663, 1, 1, 1, 1, 1,
-1.190403, 0.3666508, -0.9377335, 0, 0, 1, 1, 1,
-1.186904, 0.1621186, -3.041688, 1, 0, 0, 1, 1,
-1.178168, 0.537293, -1.624309, 1, 0, 0, 1, 1,
-1.173634, -0.7788387, -2.417722, 1, 0, 0, 1, 1,
-1.17093, -0.8441617, -1.137293, 1, 0, 0, 1, 1,
-1.168548, -1.879636, -1.978024, 1, 0, 0, 1, 1,
-1.157764, 2.267457, 0.2036633, 0, 0, 0, 1, 1,
-1.155103, 0.5200174, -0.03078935, 0, 0, 0, 1, 1,
-1.149489, -0.4569148, 0.4628137, 0, 0, 0, 1, 1,
-1.146857, 1.075537, 0.02148383, 0, 0, 0, 1, 1,
-1.144299, 0.4593783, -1.06472, 0, 0, 0, 1, 1,
-1.14124, 0.7381355, -1.257007, 0, 0, 0, 1, 1,
-1.138652, 0.6048135, -0.8543931, 0, 0, 0, 1, 1,
-1.1355, 0.04290582, -3.190797, 1, 1, 1, 1, 1,
-1.134006, 0.5511383, -1.071077, 1, 1, 1, 1, 1,
-1.130415, 2.502825, -0.6260973, 1, 1, 1, 1, 1,
-1.129167, 2.059313, -0.1793846, 1, 1, 1, 1, 1,
-1.116002, 0.3056749, -2.284482, 1, 1, 1, 1, 1,
-1.115863, 1.201549, 0.674158, 1, 1, 1, 1, 1,
-1.112531, -1.108886, -3.154571, 1, 1, 1, 1, 1,
-1.110359, -0.4691915, -2.577402, 1, 1, 1, 1, 1,
-1.094838, -0.8152479, -1.157432, 1, 1, 1, 1, 1,
-1.090374, -0.1494273, -2.300326, 1, 1, 1, 1, 1,
-1.088889, 2.92197, -1.308556, 1, 1, 1, 1, 1,
-1.077635, -0.8532837, -1.619857, 1, 1, 1, 1, 1,
-1.069811, 1.304607, -2.650092, 1, 1, 1, 1, 1,
-1.066321, -0.4792757, -0.6166459, 1, 1, 1, 1, 1,
-1.064037, -0.5715961, -0.1089395, 1, 1, 1, 1, 1,
-1.06341, 0.008216457, -0.2092577, 0, 0, 1, 1, 1,
-1.061909, -1.251099, -2.559638, 1, 0, 0, 1, 1,
-1.043646, 0.9162453, -1.392867, 1, 0, 0, 1, 1,
-1.033513, 0.3558742, -0.3291629, 1, 0, 0, 1, 1,
-1.025581, 0.03730323, -1.710365, 1, 0, 0, 1, 1,
-1.025341, -1.827739, -2.402366, 1, 0, 0, 1, 1,
-1.021005, 0.917728, -1.70282, 0, 0, 0, 1, 1,
-1.02081, 0.9770142, -0.08128162, 0, 0, 0, 1, 1,
-1.016384, -0.334867, -3.801938, 0, 0, 0, 1, 1,
-1.005906, -0.6682121, -3.600122, 0, 0, 0, 1, 1,
-1.003192, 0.4352692, 0.3921566, 0, 0, 0, 1, 1,
-0.9975795, 1.561892, 1.24464, 0, 0, 0, 1, 1,
-0.9958098, -0.4442032, -1.680684, 0, 0, 0, 1, 1,
-0.9944863, 1.394533, -0.9818645, 1, 1, 1, 1, 1,
-0.9906245, -1.190004, -2.837253, 1, 1, 1, 1, 1,
-0.9886262, 0.50945, -0.3366836, 1, 1, 1, 1, 1,
-0.9876173, -0.4873006, -1.419322, 1, 1, 1, 1, 1,
-0.9874629, 2.505926, -0.773073, 1, 1, 1, 1, 1,
-0.9874333, 0.5816006, -3.549963, 1, 1, 1, 1, 1,
-0.9801864, -1.245203, -1.621334, 1, 1, 1, 1, 1,
-0.9735419, -0.5906064, -3.394954, 1, 1, 1, 1, 1,
-0.9720951, 0.5763055, -1.897786, 1, 1, 1, 1, 1,
-0.9705887, -0.8683884, -3.410874, 1, 1, 1, 1, 1,
-0.9694776, -1.024857, -2.508123, 1, 1, 1, 1, 1,
-0.9671701, -0.08077063, -0.5492054, 1, 1, 1, 1, 1,
-0.9667764, -1.008096, -1.342611, 1, 1, 1, 1, 1,
-0.9660436, 1.247279, 0.6250988, 1, 1, 1, 1, 1,
-0.9629461, -1.230617, -2.435585, 1, 1, 1, 1, 1,
-0.9598826, -0.5922049, -2.453731, 0, 0, 1, 1, 1,
-0.9592317, 0.9867572, -1.556397, 1, 0, 0, 1, 1,
-0.9578784, 0.4529037, -2.824947, 1, 0, 0, 1, 1,
-0.9561931, 1.8996, 1.482439, 1, 0, 0, 1, 1,
-0.9531191, -0.7319892, -0.8703102, 1, 0, 0, 1, 1,
-0.9501204, 0.5884011, -0.03164973, 1, 0, 0, 1, 1,
-0.9483945, 0.7665266, -0.7909719, 0, 0, 0, 1, 1,
-0.9372907, 0.2775997, -0.4543208, 0, 0, 0, 1, 1,
-0.9359836, -0.8434581, -4.372, 0, 0, 0, 1, 1,
-0.9338819, -0.9884794, -2.779676, 0, 0, 0, 1, 1,
-0.932909, -0.05606136, -1.369892, 0, 0, 0, 1, 1,
-0.9313005, -1.680175, -2.283451, 0, 0, 0, 1, 1,
-0.928701, -0.3949361, -0.9714196, 0, 0, 0, 1, 1,
-0.9271773, -0.9099573, -1.180943, 1, 1, 1, 1, 1,
-0.9245276, -0.8739393, -2.05424, 1, 1, 1, 1, 1,
-0.9211894, 0.2044694, -0.1135694, 1, 1, 1, 1, 1,
-0.9207277, -1.535192, -1.133572, 1, 1, 1, 1, 1,
-0.9171104, -0.4963945, -3.817033, 1, 1, 1, 1, 1,
-0.9088175, 1.375726, 0.8777675, 1, 1, 1, 1, 1,
-0.9039087, -0.7348419, -2.300516, 1, 1, 1, 1, 1,
-0.899001, -1.031725, -1.399406, 1, 1, 1, 1, 1,
-0.8957256, 0.4596222, -0.7961949, 1, 1, 1, 1, 1,
-0.8640243, -1.506616, -3.231132, 1, 1, 1, 1, 1,
-0.8627588, -0.8798053, -1.463102, 1, 1, 1, 1, 1,
-0.8609315, -0.2518864, -0.6922321, 1, 1, 1, 1, 1,
-0.8607416, -0.2399293, -4.219006, 1, 1, 1, 1, 1,
-0.8599135, 0.2023404, -3.221514, 1, 1, 1, 1, 1,
-0.8424512, -1.142262, -1.051408, 1, 1, 1, 1, 1,
-0.8412725, -1.586202, -3.761088, 0, 0, 1, 1, 1,
-0.8345871, -0.9791948, -3.409488, 1, 0, 0, 1, 1,
-0.8282751, 0.1511576, 0.2901791, 1, 0, 0, 1, 1,
-0.8260065, 0.09229957, -1.28442, 1, 0, 0, 1, 1,
-0.8256804, -0.1305185, -1.014313, 1, 0, 0, 1, 1,
-0.8228297, 0.6651855, -1.222308, 1, 0, 0, 1, 1,
-0.8207369, -1.27959, -3.137545, 0, 0, 0, 1, 1,
-0.820485, -0.4241543, -3.523665, 0, 0, 0, 1, 1,
-0.820067, 1.779818, -0.03485782, 0, 0, 0, 1, 1,
-0.8198714, 1.081361, -0.2255355, 0, 0, 0, 1, 1,
-0.81846, 0.9217387, -0.4214029, 0, 0, 0, 1, 1,
-0.816599, -0.5423314, -3.862195, 0, 0, 0, 1, 1,
-0.8156033, -0.5594136, -1.105594, 0, 0, 0, 1, 1,
-0.8130831, -0.223257, 0.5857838, 1, 1, 1, 1, 1,
-0.8120294, -0.301504, -1.51021, 1, 1, 1, 1, 1,
-0.8074276, -0.5681288, -1.455504, 1, 1, 1, 1, 1,
-0.8063452, 0.06451861, -1.730189, 1, 1, 1, 1, 1,
-0.8055785, 0.01935448, -2.355658, 1, 1, 1, 1, 1,
-0.8002032, -0.2385941, -2.417822, 1, 1, 1, 1, 1,
-0.7987483, -0.2660941, -3.161974, 1, 1, 1, 1, 1,
-0.7971448, -1.494236, -2.385427, 1, 1, 1, 1, 1,
-0.7966698, 1.042674, -1.249888, 1, 1, 1, 1, 1,
-0.7949216, -0.4836655, -2.778774, 1, 1, 1, 1, 1,
-0.7931661, -0.3586463, 0.01283994, 1, 1, 1, 1, 1,
-0.7845482, -0.6314775, -1.339021, 1, 1, 1, 1, 1,
-0.7788863, 1.126971, -0.615376, 1, 1, 1, 1, 1,
-0.7774417, -0.8986501, -2.365626, 1, 1, 1, 1, 1,
-0.7752258, 0.3218051, -0.4625429, 1, 1, 1, 1, 1,
-0.7647806, 0.6002517, -1.437459, 0, 0, 1, 1, 1,
-0.7572798, 1.431596, 1.143312, 1, 0, 0, 1, 1,
-0.7529418, 0.6057265, -0.1783947, 1, 0, 0, 1, 1,
-0.7508423, -1.302155, -2.824574, 1, 0, 0, 1, 1,
-0.7456404, 0.3658923, 0.5513982, 1, 0, 0, 1, 1,
-0.7448541, -0.1704198, -2.708438, 1, 0, 0, 1, 1,
-0.7443815, -0.4829712, -3.322813, 0, 0, 0, 1, 1,
-0.7389625, 1.102422, -0.5576282, 0, 0, 0, 1, 1,
-0.7378414, -1.135812, -2.686407, 0, 0, 0, 1, 1,
-0.7326605, 0.8468294, 0.6762927, 0, 0, 0, 1, 1,
-0.7316443, -0.3687907, -2.49679, 0, 0, 0, 1, 1,
-0.7298571, -1.953926, -1.917494, 0, 0, 0, 1, 1,
-0.7225272, 1.081981, -0.5439853, 0, 0, 0, 1, 1,
-0.7217451, -0.04647458, -2.308417, 1, 1, 1, 1, 1,
-0.7188504, 0.503949, -2.029994, 1, 1, 1, 1, 1,
-0.718169, 0.8314452, -1.172793, 1, 1, 1, 1, 1,
-0.7106938, -0.7843896, -1.845454, 1, 1, 1, 1, 1,
-0.7063259, 2.214933, -0.7164667, 1, 1, 1, 1, 1,
-0.7034156, 0.08017434, -1.356127, 1, 1, 1, 1, 1,
-0.6996878, 0.2272911, -1.003373, 1, 1, 1, 1, 1,
-0.6934238, 2.604201, 0.6695688, 1, 1, 1, 1, 1,
-0.693419, -0.3097704, -0.3544412, 1, 1, 1, 1, 1,
-0.6931356, 0.1000684, -2.396684, 1, 1, 1, 1, 1,
-0.6858026, 0.4588672, -0.1921197, 1, 1, 1, 1, 1,
-0.6857715, 1.405047, -0.8871127, 1, 1, 1, 1, 1,
-0.6819128, -0.3265763, -1.872629, 1, 1, 1, 1, 1,
-0.6813686, 0.3908906, -1.452816, 1, 1, 1, 1, 1,
-0.6772001, -0.7360566, -1.890826, 1, 1, 1, 1, 1,
-0.6740474, -0.06759991, -1.524178, 0, 0, 1, 1, 1,
-0.6717795, -0.1732656, -5.013623, 1, 0, 0, 1, 1,
-0.6688148, 1.078653, -1.395467, 1, 0, 0, 1, 1,
-0.6615441, 1.179104, -0.4204239, 1, 0, 0, 1, 1,
-0.6535921, 1.167028, -0.1012661, 1, 0, 0, 1, 1,
-0.653211, -0.5788968, -0.885297, 1, 0, 0, 1, 1,
-0.6507891, 1.218136, -0.03254538, 0, 0, 0, 1, 1,
-0.6480889, 0.3719999, -2.27054, 0, 0, 0, 1, 1,
-0.6475831, -1.231062, -2.053535, 0, 0, 0, 1, 1,
-0.6467277, 1.590098, 1.223866, 0, 0, 0, 1, 1,
-0.6425191, 0.5261918, -2.713225, 0, 0, 0, 1, 1,
-0.6411288, 0.7837364, 0.5563952, 0, 0, 0, 1, 1,
-0.6384659, 0.7798045, -1.534147, 0, 0, 0, 1, 1,
-0.6375744, -0.6799921, -2.21061, 1, 1, 1, 1, 1,
-0.6281934, 0.9075073, 1.086594, 1, 1, 1, 1, 1,
-0.6261319, -0.2930475, -3.711586, 1, 1, 1, 1, 1,
-0.6249088, -0.9485381, -4.209087, 1, 1, 1, 1, 1,
-0.6144055, 1.241285, 0.8178306, 1, 1, 1, 1, 1,
-0.6142415, 0.4887691, -1.107228, 1, 1, 1, 1, 1,
-0.613115, -0.7314072, -2.026116, 1, 1, 1, 1, 1,
-0.6127117, -0.5502911, -2.392376, 1, 1, 1, 1, 1,
-0.6105921, 0.6796107, 0.9569361, 1, 1, 1, 1, 1,
-0.6075616, 1.921245, -0.5339914, 1, 1, 1, 1, 1,
-0.6067576, -0.6636583, -2.341732, 1, 1, 1, 1, 1,
-0.6000955, -0.4685947, -3.020834, 1, 1, 1, 1, 1,
-0.599293, -0.4154758, -2.219805, 1, 1, 1, 1, 1,
-0.5987431, -0.03323393, -2.234967, 1, 1, 1, 1, 1,
-0.5966718, 1.347606, 1.189289, 1, 1, 1, 1, 1,
-0.5963657, 0.2303424, -1.532533, 0, 0, 1, 1, 1,
-0.5946648, 0.7240367, -0.1046936, 1, 0, 0, 1, 1,
-0.5945463, 0.9314268, -0.7970861, 1, 0, 0, 1, 1,
-0.5927391, -0.6845075, -0.1637, 1, 0, 0, 1, 1,
-0.5891967, 0.01087561, -0.923391, 1, 0, 0, 1, 1,
-0.589077, -0.09903216, -0.7639934, 1, 0, 0, 1, 1,
-0.5844388, -0.2313439, -0.7838225, 0, 0, 0, 1, 1,
-0.5809988, -0.3825682, -1.515283, 0, 0, 0, 1, 1,
-0.5732601, 0.4115092, -1.819599, 0, 0, 0, 1, 1,
-0.5656572, 0.959133, -0.7812383, 0, 0, 0, 1, 1,
-0.5638974, -0.9803215, -4.128448, 0, 0, 0, 1, 1,
-0.5620381, -0.6651738, -1.276928, 0, 0, 0, 1, 1,
-0.5594838, 0.1446623, -1.485239, 0, 0, 0, 1, 1,
-0.55936, 1.543728, -1.115102, 1, 1, 1, 1, 1,
-0.5586104, -1.286806, -2.491369, 1, 1, 1, 1, 1,
-0.5568568, 0.6189548, 0.2632176, 1, 1, 1, 1, 1,
-0.5494431, 1.735275, -1.091802, 1, 1, 1, 1, 1,
-0.5377613, 0.4764062, -1.152127, 1, 1, 1, 1, 1,
-0.5325156, 0.4834091, -1.622126, 1, 1, 1, 1, 1,
-0.532108, -0.3782942, -2.47386, 1, 1, 1, 1, 1,
-0.5304056, -0.442205, -1.397174, 1, 1, 1, 1, 1,
-0.5289844, -0.2390317, -2.514494, 1, 1, 1, 1, 1,
-0.5261654, 0.1518637, -0.7179842, 1, 1, 1, 1, 1,
-0.5259745, 0.9579628, -0.524002, 1, 1, 1, 1, 1,
-0.5258769, 1.50447, -2.135356, 1, 1, 1, 1, 1,
-0.5241198, -0.3913094, -4.241919, 1, 1, 1, 1, 1,
-0.5201715, 1.529287, -0.4049701, 1, 1, 1, 1, 1,
-0.5166697, -0.04692709, -4.095428, 1, 1, 1, 1, 1,
-0.5155767, 1.350792, -0.01478097, 0, 0, 1, 1, 1,
-0.5145571, -0.4066209, -3.731795, 1, 0, 0, 1, 1,
-0.5139039, 2.200214, -0.9112816, 1, 0, 0, 1, 1,
-0.5138709, -0.2143093, -1.963155, 1, 0, 0, 1, 1,
-0.5072212, -0.5952467, -2.138158, 1, 0, 0, 1, 1,
-0.504195, 0.05019883, -2.011946, 1, 0, 0, 1, 1,
-0.5014146, 2.41647, -0.3488463, 0, 0, 0, 1, 1,
-0.4987443, 1.838576, -1.90989, 0, 0, 0, 1, 1,
-0.4970737, -2.346097, -4.188055, 0, 0, 0, 1, 1,
-0.4946306, 0.05204576, -0.9944268, 0, 0, 0, 1, 1,
-0.4865895, -0.5857971, -2.736292, 0, 0, 0, 1, 1,
-0.484676, 0.9760696, -2.954855, 0, 0, 0, 1, 1,
-0.4701899, -0.3218366, -1.123277, 0, 0, 0, 1, 1,
-0.4653458, 0.2427103, -4.125585, 1, 1, 1, 1, 1,
-0.4641884, 0.03483445, -1.159175, 1, 1, 1, 1, 1,
-0.4592205, -0.8392733, -2.83347, 1, 1, 1, 1, 1,
-0.4553648, 0.1848487, -0.9269823, 1, 1, 1, 1, 1,
-0.454162, -0.3479928, -2.224058, 1, 1, 1, 1, 1,
-0.4503083, 2.038574, 1.427287, 1, 1, 1, 1, 1,
-0.4466501, 0.645179, -1.750268, 1, 1, 1, 1, 1,
-0.4419983, 0.7816443, -0.5967938, 1, 1, 1, 1, 1,
-0.4412787, 0.08627514, -1.924978, 1, 1, 1, 1, 1,
-0.4356831, -1.433457, -3.045038, 1, 1, 1, 1, 1,
-0.433703, 0.2173004, -1.345408, 1, 1, 1, 1, 1,
-0.4321741, 1.40997, -0.1028903, 1, 1, 1, 1, 1,
-0.4301518, -0.9463204, -3.947984, 1, 1, 1, 1, 1,
-0.4259914, 1.375289, 1.160729, 1, 1, 1, 1, 1,
-0.4221932, -0.1981042, -3.987987, 1, 1, 1, 1, 1,
-0.4205008, -0.4329122, -2.078283, 0, 0, 1, 1, 1,
-0.414307, 0.9740018, -1.213483, 1, 0, 0, 1, 1,
-0.4111034, 0.2062565, 0.3803245, 1, 0, 0, 1, 1,
-0.4085769, 1.286123, -0.4633588, 1, 0, 0, 1, 1,
-0.406805, -0.4912896, -4.033269, 1, 0, 0, 1, 1,
-0.40576, -0.363548, -1.747022, 1, 0, 0, 1, 1,
-0.4029132, 0.4101849, -1.600985, 0, 0, 0, 1, 1,
-0.4028867, 1.027527, 0.06033507, 0, 0, 0, 1, 1,
-0.4025692, -0.5955507, -2.389161, 0, 0, 0, 1, 1,
-0.3991816, -1.077797, -1.223916, 0, 0, 0, 1, 1,
-0.3988318, -1.461422, -3.16059, 0, 0, 0, 1, 1,
-0.3962722, -0.1845798, -2.135244, 0, 0, 0, 1, 1,
-0.3925613, -0.3961949, -2.209867, 0, 0, 0, 1, 1,
-0.3880362, 0.112728, -0.8759437, 1, 1, 1, 1, 1,
-0.3857571, -1.856749, -2.152701, 1, 1, 1, 1, 1,
-0.3845775, -0.7621349, -3.664096, 1, 1, 1, 1, 1,
-0.3793005, -0.4393756, -2.54416, 1, 1, 1, 1, 1,
-0.377346, 1.372716, 0.6079376, 1, 1, 1, 1, 1,
-0.3741988, 0.8342514, -0.1024083, 1, 1, 1, 1, 1,
-0.3700363, 1.677864, 1.044279, 1, 1, 1, 1, 1,
-0.3675374, 0.2488119, -1.973509, 1, 1, 1, 1, 1,
-0.3656934, 0.1617665, -1.120552, 1, 1, 1, 1, 1,
-0.3644956, -1.616267, -1.491205, 1, 1, 1, 1, 1,
-0.3613661, -1.208165, -3.486642, 1, 1, 1, 1, 1,
-0.360196, -1.706355, -2.722823, 1, 1, 1, 1, 1,
-0.3584807, 0.7872952, 0.2240588, 1, 1, 1, 1, 1,
-0.3535496, 0.4704269, -2.162582, 1, 1, 1, 1, 1,
-0.3522524, -0.9255548, -2.030591, 1, 1, 1, 1, 1,
-0.3503398, 0.5937741, -2.685251, 0, 0, 1, 1, 1,
-0.3472743, -1.387666, -3.13306, 1, 0, 0, 1, 1,
-0.3457644, 0.6559061, -0.4834868, 1, 0, 0, 1, 1,
-0.3444161, -1.863095, -3.969035, 1, 0, 0, 1, 1,
-0.3436145, -1.208362, -1.42387, 1, 0, 0, 1, 1,
-0.3415698, -0.1450355, -2.103647, 1, 0, 0, 1, 1,
-0.3393902, -0.9381002, -1.399181, 0, 0, 0, 1, 1,
-0.3350616, 0.2967801, 0.394729, 0, 0, 0, 1, 1,
-0.3305376, -2.407372, -3.258481, 0, 0, 0, 1, 1,
-0.3278483, -1.781445, -3.591502, 0, 0, 0, 1, 1,
-0.3277077, 0.3191754, 0.6457008, 0, 0, 0, 1, 1,
-0.3206115, 0.4045931, -0.5852713, 0, 0, 0, 1, 1,
-0.3197844, -0.454788, -2.212154, 0, 0, 0, 1, 1,
-0.3167196, 0.2021201, -2.023567, 1, 1, 1, 1, 1,
-0.3111369, 1.45751, -0.3038397, 1, 1, 1, 1, 1,
-0.3082208, -0.8661499, -2.065277, 1, 1, 1, 1, 1,
-0.3079167, 0.6842499, -1.260937, 1, 1, 1, 1, 1,
-0.299142, -0.02992396, -2.950135, 1, 1, 1, 1, 1,
-0.295294, 0.7788155, 0.252455, 1, 1, 1, 1, 1,
-0.292651, -0.002015023, -0.1116269, 1, 1, 1, 1, 1,
-0.2878185, -0.7474719, -3.398016, 1, 1, 1, 1, 1,
-0.2875927, 0.3449211, 0.9856135, 1, 1, 1, 1, 1,
-0.2871117, 1.133379, -0.4764416, 1, 1, 1, 1, 1,
-0.2819139, -1.172964, -2.840646, 1, 1, 1, 1, 1,
-0.2804557, -0.1919468, -2.701225, 1, 1, 1, 1, 1,
-0.2790585, 0.03738805, -1.465446, 1, 1, 1, 1, 1,
-0.2716575, 0.3214946, 0.2835116, 1, 1, 1, 1, 1,
-0.271618, 2.265085, -0.2816971, 1, 1, 1, 1, 1,
-0.2706016, -0.5605479, -1.868738, 0, 0, 1, 1, 1,
-0.2699116, -1.752898, -2.924533, 1, 0, 0, 1, 1,
-0.267198, 0.4189379, -0.3153686, 1, 0, 0, 1, 1,
-0.2598097, 1.096117, 0.4137096, 1, 0, 0, 1, 1,
-0.2562546, 2.13016, 0.7356558, 1, 0, 0, 1, 1,
-0.2562278, 0.8304028, -0.4911393, 1, 0, 0, 1, 1,
-0.2552361, 1.109935, 0.1038904, 0, 0, 0, 1, 1,
-0.2543155, 0.5799404, -2.259391, 0, 0, 0, 1, 1,
-0.254199, -0.448225, -1.78186, 0, 0, 0, 1, 1,
-0.2526305, -0.0785156, -1.28962, 0, 0, 0, 1, 1,
-0.2513942, -0.5011477, -2.436969, 0, 0, 0, 1, 1,
-0.2473393, -0.2790603, -3.747785, 0, 0, 0, 1, 1,
-0.2427915, 0.1595513, -2.138954, 0, 0, 0, 1, 1,
-0.2405504, 0.2981411, -2.889305, 1, 1, 1, 1, 1,
-0.2359554, -1.762563, -3.60264, 1, 1, 1, 1, 1,
-0.235361, -0.227028, -2.005616, 1, 1, 1, 1, 1,
-0.2305939, -1.537442, -3.251066, 1, 1, 1, 1, 1,
-0.2283935, 1.703319, -0.5939378, 1, 1, 1, 1, 1,
-0.2260344, 0.2006003, 0.06246973, 1, 1, 1, 1, 1,
-0.2243484, 0.7233368, -1.225004, 1, 1, 1, 1, 1,
-0.2201377, 0.03755607, -1.468499, 1, 1, 1, 1, 1,
-0.2155219, 0.3424352, 0.5714954, 1, 1, 1, 1, 1,
-0.209195, 0.3418649, -0.2719102, 1, 1, 1, 1, 1,
-0.2075527, 1.125506, -1.465569, 1, 1, 1, 1, 1,
-0.2039132, 0.4885903, 0.4961681, 1, 1, 1, 1, 1,
-0.2025302, -0.1694475, -2.542974, 1, 1, 1, 1, 1,
-0.2018707, 1.010045, 0.6621207, 1, 1, 1, 1, 1,
-0.2010544, -0.07956775, -2.303453, 1, 1, 1, 1, 1,
-0.1920804, -0.6258438, -3.468888, 0, 0, 1, 1, 1,
-0.1919067, 1.283653, 0.510505, 1, 0, 0, 1, 1,
-0.1886963, -1.382728, -1.189587, 1, 0, 0, 1, 1,
-0.1859294, 0.4351761, -0.02811354, 1, 0, 0, 1, 1,
-0.1809506, 1.138301, 0.2654353, 1, 0, 0, 1, 1,
-0.1807957, -1.174637, -1.679669, 1, 0, 0, 1, 1,
-0.1800645, 1.834599, -0.2052144, 0, 0, 0, 1, 1,
-0.1799767, 0.4873136, -0.1789756, 0, 0, 0, 1, 1,
-0.1765963, 0.3281424, -0.4027648, 0, 0, 0, 1, 1,
-0.1763745, 1.129716, -0.848889, 0, 0, 0, 1, 1,
-0.176132, -0.4454901, -2.113545, 0, 0, 0, 1, 1,
-0.1714856, -0.264146, -4.187633, 0, 0, 0, 1, 1,
-0.1700414, -0.1225119, -1.782933, 0, 0, 0, 1, 1,
-0.1685101, 0.984132, 0.01517093, 1, 1, 1, 1, 1,
-0.163762, 0.3883507, -1.588699, 1, 1, 1, 1, 1,
-0.1578533, -0.684467, -3.06415, 1, 1, 1, 1, 1,
-0.1563744, -1.22429, -3.813442, 1, 1, 1, 1, 1,
-0.1563251, 0.284118, -1.377505, 1, 1, 1, 1, 1,
-0.1560889, 1.244877, 0.6725224, 1, 1, 1, 1, 1,
-0.1557426, -0.14381, -3.863521, 1, 1, 1, 1, 1,
-0.1535207, -0.6074562, -2.349255, 1, 1, 1, 1, 1,
-0.1513263, 1.52499, 1.499205, 1, 1, 1, 1, 1,
-0.1485498, 0.4462659, -0.003840394, 1, 1, 1, 1, 1,
-0.1474192, 0.5748743, -0.2845421, 1, 1, 1, 1, 1,
-0.1469577, -0.260311, -3.654938, 1, 1, 1, 1, 1,
-0.1389039, -1.295909, -1.824573, 1, 1, 1, 1, 1,
-0.1350132, 1.388883, 0.1211214, 1, 1, 1, 1, 1,
-0.13281, -0.0656819, -2.396498, 1, 1, 1, 1, 1,
-0.1285861, -1.996745, -3.289204, 0, 0, 1, 1, 1,
-0.1245351, 0.5164347, -0.9720778, 1, 0, 0, 1, 1,
-0.1244955, -0.5941885, -3.673892, 1, 0, 0, 1, 1,
-0.1242001, 1.090068, 1.218255, 1, 0, 0, 1, 1,
-0.1221845, 0.7015241, -0.05056729, 1, 0, 0, 1, 1,
-0.1204874, -0.1342875, -2.509355, 1, 0, 0, 1, 1,
-0.1200884, -1.045401, -3.133519, 0, 0, 0, 1, 1,
-0.1178381, -0.5747899, -4.024862, 0, 0, 0, 1, 1,
-0.1118988, 0.08787227, -1.546691, 0, 0, 0, 1, 1,
-0.108916, -0.7331233, -1.950758, 0, 0, 0, 1, 1,
-0.1087371, 1.689176, 0.1329164, 0, 0, 0, 1, 1,
-0.1054013, 0.4767424, -1.196107, 0, 0, 0, 1, 1,
-0.1042787, 0.769492, 2.008301, 0, 0, 0, 1, 1,
-0.1009549, -0.1153452, -2.681966, 1, 1, 1, 1, 1,
-0.1005564, 0.9788865, 2.31381, 1, 1, 1, 1, 1,
-0.09899587, -0.8866164, -2.105477, 1, 1, 1, 1, 1,
-0.09593955, 0.244369, -0.05505479, 1, 1, 1, 1, 1,
-0.09576088, -0.7262995, -2.657407, 1, 1, 1, 1, 1,
-0.0930619, 0.9104308, 0.03330234, 1, 1, 1, 1, 1,
-0.09066357, 0.9900833, 0.7391838, 1, 1, 1, 1, 1,
-0.08793261, -0.3048796, -3.423982, 1, 1, 1, 1, 1,
-0.08768537, 0.2566335, 0.658086, 1, 1, 1, 1, 1,
-0.08690522, -1.236402, -2.917746, 1, 1, 1, 1, 1,
-0.08615822, -0.2168459, -4.514392, 1, 1, 1, 1, 1,
-0.08536378, -1.734931, -4.672016, 1, 1, 1, 1, 1,
-0.08395104, 1.566176, -0.1061998, 1, 1, 1, 1, 1,
-0.08078741, -0.7799035, -1.79091, 1, 1, 1, 1, 1,
-0.07866119, 0.1598162, 0.8301195, 1, 1, 1, 1, 1,
-0.06623142, -0.6188315, -2.509319, 0, 0, 1, 1, 1,
-0.0564693, -0.4985138, -1.576256, 1, 0, 0, 1, 1,
-0.05250639, 0.7374855, 0.2242405, 1, 0, 0, 1, 1,
-0.05166022, -0.4190856, -1.938225, 1, 0, 0, 1, 1,
-0.04569392, 0.5375484, 0.02979224, 1, 0, 0, 1, 1,
-0.04429841, 0.1242944, -0.6511702, 1, 0, 0, 1, 1,
-0.04382239, 0.1540675, -0.3604545, 0, 0, 0, 1, 1,
-0.04287007, -0.4796627, -3.751709, 0, 0, 0, 1, 1,
-0.03175537, -0.619001, -2.153216, 0, 0, 0, 1, 1,
-0.03048913, 0.7431952, -1.111537, 0, 0, 0, 1, 1,
-0.02713181, -0.6958933, -2.646015, 0, 0, 0, 1, 1,
-0.0266095, 1.236894, -0.6089327, 0, 0, 0, 1, 1,
-0.02538691, -1.177861, -3.590111, 0, 0, 0, 1, 1,
-0.02469425, 0.2893554, 1.130638, 1, 1, 1, 1, 1,
-0.02368424, -0.2261905, -3.514426, 1, 1, 1, 1, 1,
-0.02311149, -0.4939053, -1.833707, 1, 1, 1, 1, 1,
-0.01976671, 0.701597, -1.906549, 1, 1, 1, 1, 1,
-0.01950795, -0.5726704, -3.528929, 1, 1, 1, 1, 1,
-0.01893575, -0.6226063, -3.682972, 1, 1, 1, 1, 1,
-0.01868668, -1.115262, -4.402876, 1, 1, 1, 1, 1,
-0.01568589, 2.34753, -1.138859, 1, 1, 1, 1, 1,
-0.01255868, 1.068523, 1.209133, 1, 1, 1, 1, 1,
-0.0124407, -0.2562819, -3.295053, 1, 1, 1, 1, 1,
-0.008362562, -0.09115221, -1.614509, 1, 1, 1, 1, 1,
-0.005464687, -1.635438, -3.511183, 1, 1, 1, 1, 1,
0.0005798041, -0.413551, 3.445638, 1, 1, 1, 1, 1,
0.004448993, -0.7302998, 3.025445, 1, 1, 1, 1, 1,
0.004618533, 1.016117, 0.1820462, 1, 1, 1, 1, 1,
0.004797313, 1.138846, -0.2771425, 0, 0, 1, 1, 1,
0.007434139, -0.5241753, 3.746051, 1, 0, 0, 1, 1,
0.01689419, -1.673103, 2.415697, 1, 0, 0, 1, 1,
0.01750614, -2.97017, 2.760009, 1, 0, 0, 1, 1,
0.01782843, 0.1294858, 0.5225636, 1, 0, 0, 1, 1,
0.02067744, 0.04117585, -1.478419, 1, 0, 0, 1, 1,
0.02231022, 1.589662, 1.312635, 0, 0, 0, 1, 1,
0.02410799, -1.470243, 3.537908, 0, 0, 0, 1, 1,
0.02511263, 1.485228, 0.5564513, 0, 0, 0, 1, 1,
0.02957412, -0.4254969, 4.151815, 0, 0, 0, 1, 1,
0.03005716, 0.008939549, -1.130022, 0, 0, 0, 1, 1,
0.03097714, -2.191517, 3.681689, 0, 0, 0, 1, 1,
0.03167365, 2.570047, -0.0337359, 0, 0, 0, 1, 1,
0.03961683, 0.2738861, 0.02511032, 1, 1, 1, 1, 1,
0.03992138, 1.202426, -0.3530955, 1, 1, 1, 1, 1,
0.04265562, -0.05200447, 1.737373, 1, 1, 1, 1, 1,
0.04434532, -1.473093, 3.602339, 1, 1, 1, 1, 1,
0.04846841, 0.951152, 0.2114096, 1, 1, 1, 1, 1,
0.05067417, 0.1930847, 3.693207, 1, 1, 1, 1, 1,
0.05078121, 0.3929867, -0.7805905, 1, 1, 1, 1, 1,
0.05275237, 0.07083947, -0.6047652, 1, 1, 1, 1, 1,
0.05416913, 0.1415523, 1.884809, 1, 1, 1, 1, 1,
0.05482172, -0.7945892, 1.31291, 1, 1, 1, 1, 1,
0.05597321, 0.8415967, -0.1794052, 1, 1, 1, 1, 1,
0.05606288, -1.68295, 1.987893, 1, 1, 1, 1, 1,
0.05666355, 0.9744555, -0.9491296, 1, 1, 1, 1, 1,
0.05719798, 0.2151181, -0.01214467, 1, 1, 1, 1, 1,
0.05857806, 0.5081587, -0.125504, 1, 1, 1, 1, 1,
0.06222977, 0.9284939, -1.218431, 0, 0, 1, 1, 1,
0.06289852, 0.6236913, -0.9118268, 1, 0, 0, 1, 1,
0.06418322, -1.558466, 2.347033, 1, 0, 0, 1, 1,
0.06584177, -0.792883, 2.308336, 1, 0, 0, 1, 1,
0.06683981, -1.465325, 2.456341, 1, 0, 0, 1, 1,
0.06970311, -0.5978612, 2.23362, 1, 0, 0, 1, 1,
0.07043706, -0.1892752, 3.332674, 0, 0, 0, 1, 1,
0.07473731, 0.5181941, -0.5125545, 0, 0, 0, 1, 1,
0.07575146, 0.5096471, -0.9387443, 0, 0, 0, 1, 1,
0.07644589, 0.9787148, 0.3124856, 0, 0, 0, 1, 1,
0.07647823, -0.03218568, 4.715953, 0, 0, 0, 1, 1,
0.07797268, -1.60824, 3.291489, 0, 0, 0, 1, 1,
0.08552154, 0.535404, 0.7191069, 0, 0, 0, 1, 1,
0.0895857, -0.7876013, 4.897491, 1, 1, 1, 1, 1,
0.09017724, 0.4574042, -0.9872757, 1, 1, 1, 1, 1,
0.09564785, -0.4465951, 4.131399, 1, 1, 1, 1, 1,
0.09596554, 0.1566524, 1.292153, 1, 1, 1, 1, 1,
0.09656518, -1.668654, 2.491659, 1, 1, 1, 1, 1,
0.1073848, -0.4195566, 2.763094, 1, 1, 1, 1, 1,
0.1079492, 1.29871, 0.07092472, 1, 1, 1, 1, 1,
0.1109837, -0.7814289, 2.162533, 1, 1, 1, 1, 1,
0.1124288, 0.2243329, -0.1405272, 1, 1, 1, 1, 1,
0.1125793, -1.000774, 4.535669, 1, 1, 1, 1, 1,
0.1155752, 0.6463737, -1.356695, 1, 1, 1, 1, 1,
0.1220988, 1.226646, 0.3502402, 1, 1, 1, 1, 1,
0.1228701, -1.211246, 3.438018, 1, 1, 1, 1, 1,
0.1235621, -0.9186401, 3.554935, 1, 1, 1, 1, 1,
0.1256439, -0.4357632, 1.995256, 1, 1, 1, 1, 1,
0.1260097, 0.3146646, 0.539639, 0, 0, 1, 1, 1,
0.1280735, 1.179422, 1.973548, 1, 0, 0, 1, 1,
0.1297477, 0.4210273, 1.151732, 1, 0, 0, 1, 1,
0.1300285, 1.122842, -0.3058625, 1, 0, 0, 1, 1,
0.1355808, 0.2451336, -0.5424717, 1, 0, 0, 1, 1,
0.1357056, 1.172417, -0.1983033, 1, 0, 0, 1, 1,
0.1411917, -0.9258126, 3.936782, 0, 0, 0, 1, 1,
0.1462995, 0.03606082, 0.5834044, 0, 0, 0, 1, 1,
0.1606135, 0.0677724, 2.342922, 0, 0, 0, 1, 1,
0.1619811, -0.7474949, 3.768468, 0, 0, 0, 1, 1,
0.1657564, -0.1001251, 3.344813, 0, 0, 0, 1, 1,
0.1658181, -0.7686634, 4.233158, 0, 0, 0, 1, 1,
0.1660929, -0.4675361, 4.138741, 0, 0, 0, 1, 1,
0.1676889, -0.5391726, 1.360395, 1, 1, 1, 1, 1,
0.1700008, 0.9873892, 1.002668, 1, 1, 1, 1, 1,
0.1712975, 0.2279399, 0.4943045, 1, 1, 1, 1, 1,
0.1759817, -1.14512, 3.490819, 1, 1, 1, 1, 1,
0.1830978, 0.6347956, -0.9645109, 1, 1, 1, 1, 1,
0.1833034, 0.5218694, -0.965485, 1, 1, 1, 1, 1,
0.1835302, -1.855133, 2.461729, 1, 1, 1, 1, 1,
0.1852894, 0.3277687, 1.308627, 1, 1, 1, 1, 1,
0.1872053, -1.157648, 3.713479, 1, 1, 1, 1, 1,
0.1965623, 0.3840222, -0.1897354, 1, 1, 1, 1, 1,
0.2024934, 0.2077361, 0.3682525, 1, 1, 1, 1, 1,
0.2029405, 0.8341427, 0.2544846, 1, 1, 1, 1, 1,
0.2056873, 0.0996658, 2.103948, 1, 1, 1, 1, 1,
0.2106901, 1.198173, 0.1857905, 1, 1, 1, 1, 1,
0.2110257, -1.623267, 3.224343, 1, 1, 1, 1, 1,
0.2119305, -0.1429924, 3.563586, 0, 0, 1, 1, 1,
0.2131318, -0.1890504, 2.580699, 1, 0, 0, 1, 1,
0.215188, 2.087016, 0.8503351, 1, 0, 0, 1, 1,
0.2154671, 0.2828174, 1.875609, 1, 0, 0, 1, 1,
0.2162108, -0.6979738, 2.862476, 1, 0, 0, 1, 1,
0.2294456, -0.6883652, 3.893661, 1, 0, 0, 1, 1,
0.2296091, -0.3485283, 1.715432, 0, 0, 0, 1, 1,
0.2327795, -1.051767, 2.130977, 0, 0, 0, 1, 1,
0.2362521, -0.2887607, 2.413126, 0, 0, 0, 1, 1,
0.2414757, 0.3135818, 0.1302893, 0, 0, 0, 1, 1,
0.2448573, -0.1752137, 1.525918, 0, 0, 0, 1, 1,
0.2549521, -1.703555, 1.213952, 0, 0, 0, 1, 1,
0.2678822, -0.1306448, 0.9272919, 0, 0, 0, 1, 1,
0.2707742, -1.293197, 3.653732, 1, 1, 1, 1, 1,
0.2752609, 1.354799, 0.3255728, 1, 1, 1, 1, 1,
0.2846426, -0.0321096, 1.353871, 1, 1, 1, 1, 1,
0.2914403, -1.78625, 3.587174, 1, 1, 1, 1, 1,
0.2976865, 1.135317, -0.4972389, 1, 1, 1, 1, 1,
0.2980934, -0.7289554, 0.8378438, 1, 1, 1, 1, 1,
0.3100925, -0.836963, 3.106721, 1, 1, 1, 1, 1,
0.3172977, -0.5448869, 2.690682, 1, 1, 1, 1, 1,
0.3182842, 1.160414, -0.4065766, 1, 1, 1, 1, 1,
0.319547, -0.7331542, 0.6459833, 1, 1, 1, 1, 1,
0.3196865, 0.1535077, 1.831282, 1, 1, 1, 1, 1,
0.3201553, 0.06504131, 1.537948, 1, 1, 1, 1, 1,
0.32192, -0.7175464, 4.00226, 1, 1, 1, 1, 1,
0.332843, 0.2653287, 1.464177, 1, 1, 1, 1, 1,
0.3332216, -0.179274, 1.459612, 1, 1, 1, 1, 1,
0.3341864, 0.1271606, 0.857146, 0, 0, 1, 1, 1,
0.3342627, 0.9652476, -0.9671873, 1, 0, 0, 1, 1,
0.3345527, 0.6573692, 1.156663, 1, 0, 0, 1, 1,
0.3369418, -1.104397, 1.195697, 1, 0, 0, 1, 1,
0.3382379, -0.6105118, 4.73162, 1, 0, 0, 1, 1,
0.3404778, -0.473258, 1.201322, 1, 0, 0, 1, 1,
0.34309, 0.09396967, 1.765787, 0, 0, 0, 1, 1,
0.3470689, -0.5086991, 0.8849973, 0, 0, 0, 1, 1,
0.3499618, -0.3351462, 3.766186, 0, 0, 0, 1, 1,
0.352124, -0.5535536, 3.304404, 0, 0, 0, 1, 1,
0.3557862, -1.72, 2.834178, 0, 0, 0, 1, 1,
0.3577718, 0.2086132, 2.355647, 0, 0, 0, 1, 1,
0.3611224, -0.1718681, 3.989939, 0, 0, 0, 1, 1,
0.3625823, -0.6963125, 2.038949, 1, 1, 1, 1, 1,
0.363285, -0.6366957, 2.324073, 1, 1, 1, 1, 1,
0.3640502, 0.4833296, 1.085296, 1, 1, 1, 1, 1,
0.3659605, 0.5564806, 1.226817, 1, 1, 1, 1, 1,
0.3734584, -1.229312, 3.083668, 1, 1, 1, 1, 1,
0.3818195, -0.9572762, 1.218035, 1, 1, 1, 1, 1,
0.3827288, -0.7955165, 1.587035, 1, 1, 1, 1, 1,
0.3857639, 0.7988406, -0.5794557, 1, 1, 1, 1, 1,
0.3878189, 2.425082, -0.1108163, 1, 1, 1, 1, 1,
0.3905428, -1.226885, 3.386045, 1, 1, 1, 1, 1,
0.3914152, -0.9579753, 2.156646, 1, 1, 1, 1, 1,
0.3934416, -0.9747494, 2.965006, 1, 1, 1, 1, 1,
0.3971711, 0.3023793, 0.3589345, 1, 1, 1, 1, 1,
0.3983545, 0.2253844, 0.283373, 1, 1, 1, 1, 1,
0.3996139, -0.2228097, 1.229408, 1, 1, 1, 1, 1,
0.4002736, 0.8412482, -0.8050685, 0, 0, 1, 1, 1,
0.4006123, -0.2346191, 3.527828, 1, 0, 0, 1, 1,
0.4037458, -1.519167, 1.723286, 1, 0, 0, 1, 1,
0.4056562, -0.427626, 3.152153, 1, 0, 0, 1, 1,
0.4070862, 0.09276187, 1.016942, 1, 0, 0, 1, 1,
0.4099851, 1.315902, 0.113908, 1, 0, 0, 1, 1,
0.4103782, 0.8249173, 1.252928, 0, 0, 0, 1, 1,
0.4109648, 0.8834206, -0.9991254, 0, 0, 0, 1, 1,
0.4116786, 0.2046698, 1.160666, 0, 0, 0, 1, 1,
0.4169357, -1.128049, 2.810958, 0, 0, 0, 1, 1,
0.4170857, 1.804992, 1.508453, 0, 0, 0, 1, 1,
0.4183714, -1.258416, 2.191747, 0, 0, 0, 1, 1,
0.4190738, -1.66915, 3.312643, 0, 0, 0, 1, 1,
0.4193617, -1.4841, 2.549875, 1, 1, 1, 1, 1,
0.4195832, 1.169022, 0.1249864, 1, 1, 1, 1, 1,
0.4380886, 1.973598, 0.2515495, 1, 1, 1, 1, 1,
0.4409997, -0.2323391, 1.509462, 1, 1, 1, 1, 1,
0.4450135, -0.8674667, 2.670421, 1, 1, 1, 1, 1,
0.4474646, 0.1770722, 0.6921113, 1, 1, 1, 1, 1,
0.4492971, -0.3970363, 3.368552, 1, 1, 1, 1, 1,
0.4529992, 0.01427672, 1.472206, 1, 1, 1, 1, 1,
0.4560895, -0.3763245, 2.665014, 1, 1, 1, 1, 1,
0.457404, -0.1992937, 2.591464, 1, 1, 1, 1, 1,
0.4641604, 0.2723906, 0.1046659, 1, 1, 1, 1, 1,
0.4679983, 0.2085187, 1.800041, 1, 1, 1, 1, 1,
0.4695337, 0.8602675, -0.5634075, 1, 1, 1, 1, 1,
0.4712115, 0.7591503, -0.6140881, 1, 1, 1, 1, 1,
0.4736399, -0.601528, 2.695706, 1, 1, 1, 1, 1,
0.476539, -0.1644662, 0.06584428, 0, 0, 1, 1, 1,
0.4769809, 1.880126, -1.611985, 1, 0, 0, 1, 1,
0.4814982, -0.3640928, 1.016733, 1, 0, 0, 1, 1,
0.482447, -0.61712, 1.721061, 1, 0, 0, 1, 1,
0.4846493, -2.829462, 0.4179863, 1, 0, 0, 1, 1,
0.4848213, -0.6729784, 3.608156, 1, 0, 0, 1, 1,
0.4863495, -0.2695289, 2.584351, 0, 0, 0, 1, 1,
0.4872341, -2.292953, 3.363938, 0, 0, 0, 1, 1,
0.4942783, 1.284046, -0.1005178, 0, 0, 0, 1, 1,
0.4961451, -0.7852905, 3.475232, 0, 0, 0, 1, 1,
0.4964391, -0.4378052, 3.109, 0, 0, 0, 1, 1,
0.4989404, 0.1856479, 0.9330537, 0, 0, 0, 1, 1,
0.499551, -3.76687, 3.380598, 0, 0, 0, 1, 1,
0.5004526, 0.5679683, 0.1695503, 1, 1, 1, 1, 1,
0.5020761, -0.3570989, 0.8661013, 1, 1, 1, 1, 1,
0.5024574, 0.5466154, 0.6091649, 1, 1, 1, 1, 1,
0.503347, -0.4837318, 3.005109, 1, 1, 1, 1, 1,
0.5147052, -0.7285689, 2.798202, 1, 1, 1, 1, 1,
0.5170412, 0.8375112, 0.5473537, 1, 1, 1, 1, 1,
0.5200995, 0.3708011, 1.171317, 1, 1, 1, 1, 1,
0.5202772, -0.9828541, 3.277353, 1, 1, 1, 1, 1,
0.5212502, -2.248339, 2.971299, 1, 1, 1, 1, 1,
0.5214973, 0.5986145, 1.452614, 1, 1, 1, 1, 1,
0.5240647, -0.7104607, 1.908081, 1, 1, 1, 1, 1,
0.5243858, 0.08722819, 1.136694, 1, 1, 1, 1, 1,
0.5247282, 0.2592175, 0.2199427, 1, 1, 1, 1, 1,
0.5381071, 0.05239359, 4.104176, 1, 1, 1, 1, 1,
0.5395064, 1.439281, -0.9605809, 1, 1, 1, 1, 1,
0.5399992, 0.2258273, 0.826158, 0, 0, 1, 1, 1,
0.5441397, -0.783188, 2.599714, 1, 0, 0, 1, 1,
0.5445602, -0.475341, 0.7750843, 1, 0, 0, 1, 1,
0.5461875, 0.0343504, 2.91581, 1, 0, 0, 1, 1,
0.5480002, -0.3269836, 1.598165, 1, 0, 0, 1, 1,
0.5542094, 0.4357957, -0.2649187, 1, 0, 0, 1, 1,
0.5602611, 0.1668174, 2.347502, 0, 0, 0, 1, 1,
0.5621281, -0.3454099, 2.305372, 0, 0, 0, 1, 1,
0.5647751, -0.7817187, 2.460413, 0, 0, 0, 1, 1,
0.5666091, 0.8438423, -0.656849, 0, 0, 0, 1, 1,
0.5726746, 1.426309, -0.5526314, 0, 0, 0, 1, 1,
0.5769487, -1.133479, 3.983101, 0, 0, 0, 1, 1,
0.5827397, -0.7908041, 2.18028, 0, 0, 0, 1, 1,
0.5979424, -0.2983484, -0.04941932, 1, 1, 1, 1, 1,
0.6025367, -1.87326, 2.951478, 1, 1, 1, 1, 1,
0.6105093, 0.001652188, 4.918306, 1, 1, 1, 1, 1,
0.6109157, 1.116058, 0.4814321, 1, 1, 1, 1, 1,
0.6152782, -0.2883933, 2.163498, 1, 1, 1, 1, 1,
0.6165636, 0.3471054, 1.974608, 1, 1, 1, 1, 1,
0.6168309, -0.5658301, 2.344051, 1, 1, 1, 1, 1,
0.6221371, 2.084662, 0.1347141, 1, 1, 1, 1, 1,
0.6228221, 0.00096887, -0.4329782, 1, 1, 1, 1, 1,
0.6245706, 1.969177, -0.05687449, 1, 1, 1, 1, 1,
0.6256021, 1.90929, 2.40471, 1, 1, 1, 1, 1,
0.6273776, -0.4725186, 0.4899958, 1, 1, 1, 1, 1,
0.6283056, 1.006174, -0.243595, 1, 1, 1, 1, 1,
0.6289851, 0.1741755, -0.03833783, 1, 1, 1, 1, 1,
0.6290482, -0.1882744, 1.29364, 1, 1, 1, 1, 1,
0.6292838, -0.08369944, 3.583905, 0, 0, 1, 1, 1,
0.6307636, -1.293898, 3.664382, 1, 0, 0, 1, 1,
0.6401166, -1.065239, 2.563517, 1, 0, 0, 1, 1,
0.6471978, 0.6326235, -0.9139637, 1, 0, 0, 1, 1,
0.6503263, -0.6650116, 3.099912, 1, 0, 0, 1, 1,
0.6559733, 1.125888, 1.113562, 1, 0, 0, 1, 1,
0.6570677, 0.8554458, 1.809495, 0, 0, 0, 1, 1,
0.6631096, -1.800437, 1.548107, 0, 0, 0, 1, 1,
0.6680129, -0.8991091, 3.050829, 0, 0, 0, 1, 1,
0.6750773, -1.028823, 3.047765, 0, 0, 0, 1, 1,
0.6790603, 1.031869, -0.7097446, 0, 0, 0, 1, 1,
0.6824409, 0.3515656, 2.387293, 0, 0, 0, 1, 1,
0.6840122, 0.4835425, -1.281064, 0, 0, 0, 1, 1,
0.6859769, -0.1514271, 1.264318, 1, 1, 1, 1, 1,
0.6860685, -1.308827, 3.106997, 1, 1, 1, 1, 1,
0.6873631, -0.202628, 3.311764, 1, 1, 1, 1, 1,
0.6970179, -0.06803577, 0.7657461, 1, 1, 1, 1, 1,
0.6976372, -0.9636966, 3.03252, 1, 1, 1, 1, 1,
0.7002296, -1.388294, 1.873942, 1, 1, 1, 1, 1,
0.7052169, -0.7414155, 2.47269, 1, 1, 1, 1, 1,
0.709632, -0.3079873, 1.028286, 1, 1, 1, 1, 1,
0.709815, 1.698585, 2.197773, 1, 1, 1, 1, 1,
0.7121956, 1.261574, 0.5902748, 1, 1, 1, 1, 1,
0.71597, -0.2445225, 0.9562353, 1, 1, 1, 1, 1,
0.7166979, -0.2973362, 2.922761, 1, 1, 1, 1, 1,
0.7228205, -0.6415356, 2.441413, 1, 1, 1, 1, 1,
0.7265121, -2.011395, 2.849548, 1, 1, 1, 1, 1,
0.7387535, -0.9966938, 2.973768, 1, 1, 1, 1, 1,
0.7402388, -0.03409921, 0.7751022, 0, 0, 1, 1, 1,
0.7445159, 0.06336378, 2.04123, 1, 0, 0, 1, 1,
0.749881, -0.3907604, 1.921195, 1, 0, 0, 1, 1,
0.765235, 1.028728, -0.04151287, 1, 0, 0, 1, 1,
0.7704931, -0.09652044, 1.262442, 1, 0, 0, 1, 1,
0.7730166, -0.8691148, 1.160321, 1, 0, 0, 1, 1,
0.779981, 1.383715, 1.593994, 0, 0, 0, 1, 1,
0.7829691, 0.1313016, 1.41467, 0, 0, 0, 1, 1,
0.784329, 0.1972741, 1.222978, 0, 0, 0, 1, 1,
0.7858503, 0.2344046, 0.10035, 0, 0, 0, 1, 1,
0.7867898, 1.383393, 1.070909, 0, 0, 0, 1, 1,
0.7947234, 0.7185349, 0.8779672, 0, 0, 0, 1, 1,
0.7976433, 1.319778, -0.4027424, 0, 0, 0, 1, 1,
0.7986253, -0.5832244, 2.800228, 1, 1, 1, 1, 1,
0.8027584, 0.1217708, 1.436863, 1, 1, 1, 1, 1,
0.8060349, 1.763133, 0.1896682, 1, 1, 1, 1, 1,
0.8078261, 1.406371, 1.604782, 1, 1, 1, 1, 1,
0.8117069, -1.20449, 1.891988, 1, 1, 1, 1, 1,
0.8128075, 1.034349, 1.175838, 1, 1, 1, 1, 1,
0.8190376, 1.005078, -0.5813196, 1, 1, 1, 1, 1,
0.8216923, -0.7182061, 2.251942, 1, 1, 1, 1, 1,
0.8234347, 0.8299464, 0.01371886, 1, 1, 1, 1, 1,
0.8300053, 1.600572, 1.439895, 1, 1, 1, 1, 1,
0.836387, 0.8137759, 0.7621636, 1, 1, 1, 1, 1,
0.8365753, -0.7396916, 1.226027, 1, 1, 1, 1, 1,
0.8390852, 0.6428351, 0.4887627, 1, 1, 1, 1, 1,
0.8391327, 0.3697947, 1.075147, 1, 1, 1, 1, 1,
0.8391389, 1.141969, 0.9163546, 1, 1, 1, 1, 1,
0.8453911, -2.328545, 3.120592, 0, 0, 1, 1, 1,
0.847187, -1.679685, 1.588199, 1, 0, 0, 1, 1,
0.8480666, 1.986426, 0.618705, 1, 0, 0, 1, 1,
0.8525503, 0.9426296, 2.388382, 1, 0, 0, 1, 1,
0.8541969, -1.09784, 2.486063, 1, 0, 0, 1, 1,
0.8568344, 1.276121, 0.3538889, 1, 0, 0, 1, 1,
0.8581033, 0.0447442, 0.6350821, 0, 0, 0, 1, 1,
0.8648637, 0.7307509, 0.8634322, 0, 0, 0, 1, 1,
0.8672077, 0.5166952, 0.007134573, 0, 0, 0, 1, 1,
0.8690419, 0.1858855, 1.683757, 0, 0, 0, 1, 1,
0.8727412, -2.39801, 1.865483, 0, 0, 0, 1, 1,
0.8734756, -1.029225, 0.8493301, 0, 0, 0, 1, 1,
0.873851, 0.3573283, -1.205636, 0, 0, 0, 1, 1,
0.8880062, -1.623462, 3.208884, 1, 1, 1, 1, 1,
0.8898736, 1.114729, 3.292214, 1, 1, 1, 1, 1,
0.8905481, -2.403321, 1.498878, 1, 1, 1, 1, 1,
0.8906637, -1.541071, 0.8494436, 1, 1, 1, 1, 1,
0.9003791, -0.1675026, 2.899694, 1, 1, 1, 1, 1,
0.901558, -0.6668864, 2.474958, 1, 1, 1, 1, 1,
0.9076806, -1.290333, 3.140625, 1, 1, 1, 1, 1,
0.9100333, -0.7128943, 2.40179, 1, 1, 1, 1, 1,
0.9101856, -0.4513949, 3.356077, 1, 1, 1, 1, 1,
0.9113424, -1.111385, 2.547648, 1, 1, 1, 1, 1,
0.9136031, -0.6606435, 2.749431, 1, 1, 1, 1, 1,
0.9243582, -0.4471523, 2.643327, 1, 1, 1, 1, 1,
0.9270139, 1.834877, 0.9890489, 1, 1, 1, 1, 1,
0.9302858, -0.704433, 2.034383, 1, 1, 1, 1, 1,
0.9383133, -1.065853, 0.8381657, 1, 1, 1, 1, 1,
0.9483454, 1.217349, 1.824121, 0, 0, 1, 1, 1,
0.9531108, -0.5342501, 4.680702, 1, 0, 0, 1, 1,
0.9551526, -0.09648189, 1.997384, 1, 0, 0, 1, 1,
0.9596415, -0.009802729, 0.6453809, 1, 0, 0, 1, 1,
0.9630021, 0.03332098, 1.067553, 1, 0, 0, 1, 1,
0.967132, -1.1201, 2.41202, 1, 0, 0, 1, 1,
0.971447, 2.204846, 1.5534, 0, 0, 0, 1, 1,
0.9728, -1.302047, 2.33159, 0, 0, 0, 1, 1,
0.9728425, -0.4396861, 0.5880281, 0, 0, 0, 1, 1,
0.9737242, 1.177719, 1.106712, 0, 0, 0, 1, 1,
0.9753818, 1.208486, 1.293045, 0, 0, 0, 1, 1,
0.9797087, 0.7099231, 2.083255, 0, 0, 0, 1, 1,
0.9856949, -1.113058, 1.508048, 0, 0, 0, 1, 1,
0.9864141, 0.08693192, 2.971328, 1, 1, 1, 1, 1,
0.9878308, -0.8129786, 1.183024, 1, 1, 1, 1, 1,
0.9897294, 0.2352525, 1.370261, 1, 1, 1, 1, 1,
0.9899957, -2.137554, 3.397688, 1, 1, 1, 1, 1,
0.9901479, 1.370785, 1.731043, 1, 1, 1, 1, 1,
0.9906243, 0.6109798, 2.281244, 1, 1, 1, 1, 1,
0.9934011, -0.5873498, 1.540382, 1, 1, 1, 1, 1,
0.9987685, 0.6502683, 1.7196, 1, 1, 1, 1, 1,
0.9989355, 0.1209691, 2.030308, 1, 1, 1, 1, 1,
1.007355, -2.316495, 1.513358, 1, 1, 1, 1, 1,
1.012742, -0.0372455, 3.33967, 1, 1, 1, 1, 1,
1.019824, -0.5392076, 1.954155, 1, 1, 1, 1, 1,
1.024979, 1.087243, 0.027196, 1, 1, 1, 1, 1,
1.034307, 1.621788, -0.3164723, 1, 1, 1, 1, 1,
1.034421, 0.1722776, 2.005139, 1, 1, 1, 1, 1,
1.038002, -0.1404933, 2.268422, 0, 0, 1, 1, 1,
1.042259, -0.8134652, 1.314974, 1, 0, 0, 1, 1,
1.044969, 0.5855643, 1.89283, 1, 0, 0, 1, 1,
1.0513, 0.9026645, 1.148664, 1, 0, 0, 1, 1,
1.054214, -0.0461816, 1.37619, 1, 0, 0, 1, 1,
1.057796, -1.221197, 2.09851, 1, 0, 0, 1, 1,
1.059701, -0.1559034, 0.8060527, 0, 0, 0, 1, 1,
1.061848, 0.4153465, 0.5278646, 0, 0, 0, 1, 1,
1.06543, 0.3100762, 1.347893, 0, 0, 0, 1, 1,
1.065887, 0.6074901, -1.139633, 0, 0, 0, 1, 1,
1.070264, 0.04415527, 2.460944, 0, 0, 0, 1, 1,
1.073243, 1.284838, 0.07797239, 0, 0, 0, 1, 1,
1.079546, -0.8134305, 1.169022, 0, 0, 0, 1, 1,
1.089468, -0.5024303, 3.411327, 1, 1, 1, 1, 1,
1.09069, 0.05648796, 1.8522, 1, 1, 1, 1, 1,
1.093298, 0.2147822, 2.401532, 1, 1, 1, 1, 1,
1.097116, -0.3709902, 0.591543, 1, 1, 1, 1, 1,
1.103723, -0.1206446, 2.840016, 1, 1, 1, 1, 1,
1.104151, 0.470211, 0.6600907, 1, 1, 1, 1, 1,
1.10602, 0.1469296, 2.147526, 1, 1, 1, 1, 1,
1.10616, 0.9117215, 2.26402, 1, 1, 1, 1, 1,
1.110352, -0.0786044, 1.676738, 1, 1, 1, 1, 1,
1.114438, -1.573953, 2.036192, 1, 1, 1, 1, 1,
1.132187, -0.3852575, 2.196489, 1, 1, 1, 1, 1,
1.134833, 0.2137212, 1.239273, 1, 1, 1, 1, 1,
1.14551, 0.4520763, 1.289441, 1, 1, 1, 1, 1,
1.149674, -0.3730279, 2.613084, 1, 1, 1, 1, 1,
1.152422, 0.4633171, 1.551209, 1, 1, 1, 1, 1,
1.157191, 0.7793211, 1.657297, 0, 0, 1, 1, 1,
1.160078, -0.9758199, 3.464364, 1, 0, 0, 1, 1,
1.172701, -0.2335665, 2.410049, 1, 0, 0, 1, 1,
1.176857, -0.01752111, 2.460189, 1, 0, 0, 1, 1,
1.182819, 0.08849027, 0.6205224, 1, 0, 0, 1, 1,
1.18865, -1.243627, 4.391959, 1, 0, 0, 1, 1,
1.191641, -0.8425913, 2.082218, 0, 0, 0, 1, 1,
1.195782, 1.418939, 2.746516, 0, 0, 0, 1, 1,
1.205717, -0.6533507, -0.06389344, 0, 0, 0, 1, 1,
1.207799, -0.4690345, 1.415138, 0, 0, 0, 1, 1,
1.22318, 0.04752531, 1.980922, 0, 0, 0, 1, 1,
1.226187, -2.008636, 2.060843, 0, 0, 0, 1, 1,
1.233136, -0.7803093, 3.328026, 0, 0, 0, 1, 1,
1.233804, -0.9633708, 3.395266, 1, 1, 1, 1, 1,
1.235242, -0.2009421, 1.802051, 1, 1, 1, 1, 1,
1.239267, -0.9349577, 2.998177, 1, 1, 1, 1, 1,
1.24004, 2.109525, -0.09559282, 1, 1, 1, 1, 1,
1.250751, -0.2124243, 2.160501, 1, 1, 1, 1, 1,
1.265009, 0.1805682, 1.282435, 1, 1, 1, 1, 1,
1.271029, 0.2898657, 1.010453, 1, 1, 1, 1, 1,
1.272942, 0.08805274, 0.1102348, 1, 1, 1, 1, 1,
1.286705, 1.193508, 2.330394, 1, 1, 1, 1, 1,
1.290779, 1.28597, 1.750723, 1, 1, 1, 1, 1,
1.295442, 1.072368, 0.8329585, 1, 1, 1, 1, 1,
1.302178, 0.7097368, 1.162886, 1, 1, 1, 1, 1,
1.315937, 0.6560315, 1.009766, 1, 1, 1, 1, 1,
1.317414, -1.171274, 2.802391, 1, 1, 1, 1, 1,
1.324548, 1.413304, 1.237732, 1, 1, 1, 1, 1,
1.325189, 0.2308592, 0.3665108, 0, 0, 1, 1, 1,
1.329999, -0.203989, 2.910962, 1, 0, 0, 1, 1,
1.330049, -1.03141, 1.350599, 1, 0, 0, 1, 1,
1.334259, 2.762915, -0.4425958, 1, 0, 0, 1, 1,
1.357298, -0.5332598, 2.251649, 1, 0, 0, 1, 1,
1.364213, 0.3022649, 1.545837, 1, 0, 0, 1, 1,
1.367797, 0.2841247, 1.991051, 0, 0, 0, 1, 1,
1.380147, 0.368729, 1.526737, 0, 0, 0, 1, 1,
1.384545, 1.024935, 1.159558, 0, 0, 0, 1, 1,
1.386296, 0.970247, -0.1524139, 0, 0, 0, 1, 1,
1.400029, -0.5541041, 2.645956, 0, 0, 0, 1, 1,
1.403703, -0.08201022, 0.7775374, 0, 0, 0, 1, 1,
1.408211, 0.3632831, 0.3516973, 0, 0, 0, 1, 1,
1.409599, 2.273062, 1.097203, 1, 1, 1, 1, 1,
1.413603, -1.283462, 3.023717, 1, 1, 1, 1, 1,
1.418337, 1.59187, 0.8959494, 1, 1, 1, 1, 1,
1.419678, -1.401007, 2.22743, 1, 1, 1, 1, 1,
1.42681, 0.2544023, 2.855387, 1, 1, 1, 1, 1,
1.427572, -2.21386, 1.812996, 1, 1, 1, 1, 1,
1.440665, -1.023122, 2.088355, 1, 1, 1, 1, 1,
1.443775, 0.7029177, 1.086809, 1, 1, 1, 1, 1,
1.463234, 1.794574, -0.3433638, 1, 1, 1, 1, 1,
1.476201, -1.405974, 3.34742, 1, 1, 1, 1, 1,
1.489685, 1.249313, 1.675123, 1, 1, 1, 1, 1,
1.50495, 0.815253, 0.5587775, 1, 1, 1, 1, 1,
1.530673, 1.447071, 1.497046, 1, 1, 1, 1, 1,
1.535621, 0.08203653, 2.984327, 1, 1, 1, 1, 1,
1.541121, -0.261727, 2.134499, 1, 1, 1, 1, 1,
1.54266, -0.6320027, 2.042227, 0, 0, 1, 1, 1,
1.559545, 1.141185, -0.5789836, 1, 0, 0, 1, 1,
1.567416, 0.5912977, 0.5736052, 1, 0, 0, 1, 1,
1.572619, 0.4707669, 1.438615, 1, 0, 0, 1, 1,
1.578406, 0.3232204, 1.929565, 1, 0, 0, 1, 1,
1.583456, -0.8772506, 3.213061, 1, 0, 0, 1, 1,
1.585939, -0.2667796, 2.665332, 0, 0, 0, 1, 1,
1.594786, -0.3598191, 1.606752, 0, 0, 0, 1, 1,
1.596787, 1.330043, 0.5308648, 0, 0, 0, 1, 1,
1.609493, -0.9628965, 1.080563, 0, 0, 0, 1, 1,
1.614966, 0.9727182, -0.6239033, 0, 0, 0, 1, 1,
1.625066, -0.4268579, 1.296613, 0, 0, 0, 1, 1,
1.646001, -1.304432, 0.2309971, 0, 0, 0, 1, 1,
1.647983, -1.351463, 1.220918, 1, 1, 1, 1, 1,
1.653032, 1.613659, -1.045164, 1, 1, 1, 1, 1,
1.655048, -2.063437, 1.070212, 1, 1, 1, 1, 1,
1.664199, -0.04369835, 1.703116, 1, 1, 1, 1, 1,
1.66825, 0.6091989, 1.995205, 1, 1, 1, 1, 1,
1.677541, -2.173028, 3.32071, 1, 1, 1, 1, 1,
1.689758, -0.967647, 1.850949, 1, 1, 1, 1, 1,
1.690454, 1.428694, 1.518501, 1, 1, 1, 1, 1,
1.691169, 1.092824, 0.9629718, 1, 1, 1, 1, 1,
1.697077, -1.920705, 3.455034, 1, 1, 1, 1, 1,
1.700674, -1.471559, 0.2469476, 1, 1, 1, 1, 1,
1.702054, -0.1228374, 0.9337455, 1, 1, 1, 1, 1,
1.718285, -1.524215, 2.171332, 1, 1, 1, 1, 1,
1.720101, 1.170414, 1.666858, 1, 1, 1, 1, 1,
1.730161, 1.069432, 0.9134147, 1, 1, 1, 1, 1,
1.74664, 2.312374, -1.007594, 0, 0, 1, 1, 1,
1.747276, 1.727173, 0.8171041, 1, 0, 0, 1, 1,
1.748777, 1.32455, -0.441064, 1, 0, 0, 1, 1,
1.748856, -0.1249165, 0.09177089, 1, 0, 0, 1, 1,
1.750119, 2.327683, -0.240053, 1, 0, 0, 1, 1,
1.750464, 0.09398103, 0.1597105, 1, 0, 0, 1, 1,
1.751659, -0.04334689, 0.3149122, 0, 0, 0, 1, 1,
1.757761, 0.8286486, 1.808321, 0, 0, 0, 1, 1,
1.801986, -0.9398819, 2.124722, 0, 0, 0, 1, 1,
1.802143, -1.324078, 2.742601, 0, 0, 0, 1, 1,
1.819288, 1.429224, 0.2227088, 0, 0, 0, 1, 1,
1.81985, 0.8049225, 2.99967, 0, 0, 0, 1, 1,
1.833773, 0.1133343, 0.4042853, 0, 0, 0, 1, 1,
1.836126, -0.8202804, 2.160658, 1, 1, 1, 1, 1,
1.861951, -0.2025685, 0.3985429, 1, 1, 1, 1, 1,
1.866704, 0.8748857, 1.199648, 1, 1, 1, 1, 1,
1.872651, 0.4987518, -0.4044521, 1, 1, 1, 1, 1,
1.873731, -0.1153132, 0.8039623, 1, 1, 1, 1, 1,
1.888714, -0.3096471, 1.471624, 1, 1, 1, 1, 1,
1.917193, -0.3174387, 0.9796945, 1, 1, 1, 1, 1,
1.92802, -0.3296818, 3.96872, 1, 1, 1, 1, 1,
1.948822, -0.0381366, 1.319795, 1, 1, 1, 1, 1,
1.959178, -1.620235, 1.694417, 1, 1, 1, 1, 1,
1.970652, -0.2864151, 1.932595, 1, 1, 1, 1, 1,
1.979975, 0.5429546, 1.573804, 1, 1, 1, 1, 1,
1.996429, -0.5234683, -0.3952911, 1, 1, 1, 1, 1,
2.001108, 0.1969982, 1.207209, 1, 1, 1, 1, 1,
2.056836, -0.7729052, 2.33527, 1, 1, 1, 1, 1,
2.057442, 2.474383, 0.7742925, 0, 0, 1, 1, 1,
2.063507, -1.487348, 1.152868, 1, 0, 0, 1, 1,
2.094015, 0.3777711, 0.6357315, 1, 0, 0, 1, 1,
2.112212, -0.2706803, 0.06786475, 1, 0, 0, 1, 1,
2.123873, 0.6475248, -0.3473775, 1, 0, 0, 1, 1,
2.193851, -1.05826, 2.43813, 1, 0, 0, 1, 1,
2.227243, -0.8490902, 0.2264856, 0, 0, 0, 1, 1,
2.235105, 1.161435, 2.834893, 0, 0, 0, 1, 1,
2.245955, 1.320068, 1.550353, 0, 0, 0, 1, 1,
2.248065, 0.4632033, 1.811712, 0, 0, 0, 1, 1,
2.30044, -0.5708752, 2.624776, 0, 0, 0, 1, 1,
2.384262, 0.8247868, 2.250636, 0, 0, 0, 1, 1,
2.410156, -0.164121, 1.243003, 0, 0, 0, 1, 1,
2.463623, 0.574864, 2.417382, 1, 1, 1, 1, 1,
2.617208, -1.465085, 2.091509, 1, 1, 1, 1, 1,
2.725675, -0.4905763, 2.139767, 1, 1, 1, 1, 1,
2.874732, 0.6407242, 3.484424, 1, 1, 1, 1, 1,
2.887029, 0.3877193, 0.9709309, 1, 1, 1, 1, 1,
2.891517, 0.1318039, 1.509332, 1, 1, 1, 1, 1,
2.909195, 1.011717, 2.158998, 1, 1, 1, 1, 1
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
var radius = 9.460755;
var distance = 33.2305;
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
mvMatrix.translate( 0.5072615, 0.4224503, 0.04765821 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.2305);
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
