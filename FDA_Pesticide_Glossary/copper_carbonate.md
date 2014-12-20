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
-2.992841, 1.275241, -1.294126, 1, 0, 0, 1,
-2.929959, 1.351285, -1.330514, 1, 0.007843138, 0, 1,
-2.844296, 0.6019475, -0.9680666, 1, 0.01176471, 0, 1,
-2.516647, 0.7140254, -1.289036, 1, 0.01960784, 0, 1,
-2.471722, 0.4253182, 0.2008925, 1, 0.02352941, 0, 1,
-2.331928, 0.8076089, -2.804292, 1, 0.03137255, 0, 1,
-2.280375, -0.3721934, -0.3735154, 1, 0.03529412, 0, 1,
-2.262087, -0.609361, -1.882197, 1, 0.04313726, 0, 1,
-2.244334, -1.450639, -3.602356, 1, 0.04705882, 0, 1,
-2.134304, 0.5964781, -0.2733762, 1, 0.05490196, 0, 1,
-2.085303, 0.1118791, 0.7095687, 1, 0.05882353, 0, 1,
-2.078378, 0.2097095, -2.94591, 1, 0.06666667, 0, 1,
-2.02529, 1.026773, -1.008747, 1, 0.07058824, 0, 1,
-2.011285, 0.1789485, -0.9477611, 1, 0.07843138, 0, 1,
-1.981001, -1.275206, -1.545969, 1, 0.08235294, 0, 1,
-1.977326, -1.003167, -2.224764, 1, 0.09019608, 0, 1,
-1.97555, 0.0542494, -0.9164364, 1, 0.09411765, 0, 1,
-1.96385, -0.7091298, -1.67277, 1, 0.1019608, 0, 1,
-1.962596, -1.243152, -2.302153, 1, 0.1098039, 0, 1,
-1.958756, 0.4021774, -0.5826257, 1, 0.1137255, 0, 1,
-1.930583, 0.5842877, -0.7736081, 1, 0.1215686, 0, 1,
-1.886114, -0.05709374, -2.055049, 1, 0.1254902, 0, 1,
-1.884117, -0.2044208, -1.839156, 1, 0.1333333, 0, 1,
-1.879544, 0.1118262, -1.498051, 1, 0.1372549, 0, 1,
-1.846437, 0.7709414, -1.569204, 1, 0.145098, 0, 1,
-1.845584, -0.3527374, -2.643112, 1, 0.1490196, 0, 1,
-1.829204, -0.01701455, -2.737065, 1, 0.1568628, 0, 1,
-1.797273, 0.4085001, -1.273146, 1, 0.1607843, 0, 1,
-1.79259, 1.084925, -0.9671333, 1, 0.1686275, 0, 1,
-1.786686, -0.1082363, -2.738395, 1, 0.172549, 0, 1,
-1.782588, -1.671782, -4.665441, 1, 0.1803922, 0, 1,
-1.774462, 0.4675559, -0.8809887, 1, 0.1843137, 0, 1,
-1.755133, -0.3425372, -1.420321, 1, 0.1921569, 0, 1,
-1.748885, 0.4870751, -0.5248621, 1, 0.1960784, 0, 1,
-1.736124, -1.861969, -3.180863, 1, 0.2039216, 0, 1,
-1.727235, -1.398365, -1.991866, 1, 0.2117647, 0, 1,
-1.720271, -0.6938666, 0.3416297, 1, 0.2156863, 0, 1,
-1.697685, -0.3477228, -1.992427, 1, 0.2235294, 0, 1,
-1.65725, -0.1204958, -0.5118905, 1, 0.227451, 0, 1,
-1.653663, 1.212222, -1.229431, 1, 0.2352941, 0, 1,
-1.636388, 1.152956, -2.589713, 1, 0.2392157, 0, 1,
-1.634179, 1.778585, -0.3687111, 1, 0.2470588, 0, 1,
-1.59824, 0.25743, -1.345209, 1, 0.2509804, 0, 1,
-1.588803, 1.437932, 0.4466248, 1, 0.2588235, 0, 1,
-1.583176, -0.03391499, -2.298999, 1, 0.2627451, 0, 1,
-1.581254, -0.3043287, -1.22052, 1, 0.2705882, 0, 1,
-1.567708, 1.439702, -2.894359, 1, 0.2745098, 0, 1,
-1.558791, -1.022838, -2.28605, 1, 0.282353, 0, 1,
-1.520267, 2.653321, 1.19878, 1, 0.2862745, 0, 1,
-1.514888, -0.1409132, -0.7598726, 1, 0.2941177, 0, 1,
-1.511691, 1.237305, 0.5689366, 1, 0.3019608, 0, 1,
-1.509919, -1.323033, -0.5621451, 1, 0.3058824, 0, 1,
-1.502491, -0.7972237, -1.732477, 1, 0.3137255, 0, 1,
-1.500683, 0.7300755, -0.1094053, 1, 0.3176471, 0, 1,
-1.490903, 0.4090906, -0.5963268, 1, 0.3254902, 0, 1,
-1.487563, 0.8043665, -0.7063125, 1, 0.3294118, 0, 1,
-1.484192, 0.4901263, -0.321301, 1, 0.3372549, 0, 1,
-1.480425, 0.001847949, -1.486612, 1, 0.3411765, 0, 1,
-1.472297, -0.3197489, -1.876186, 1, 0.3490196, 0, 1,
-1.464876, 1.381304, -0.9274601, 1, 0.3529412, 0, 1,
-1.453895, -0.4954821, -1.992874, 1, 0.3607843, 0, 1,
-1.447749, 1.460811, -0.2733643, 1, 0.3647059, 0, 1,
-1.442705, -0.337931, -2.085929, 1, 0.372549, 0, 1,
-1.442394, 0.7737248, -1.357844, 1, 0.3764706, 0, 1,
-1.441406, 0.6184703, -1.131379, 1, 0.3843137, 0, 1,
-1.433618, -1.143008, -1.005959, 1, 0.3882353, 0, 1,
-1.430984, -0.8882596, -3.813279, 1, 0.3960784, 0, 1,
-1.430498, -0.9605209, -2.018652, 1, 0.4039216, 0, 1,
-1.42712, -0.9186432, -3.992363, 1, 0.4078431, 0, 1,
-1.420647, -1.218045, -2.334293, 1, 0.4156863, 0, 1,
-1.383367, -0.1114141, -2.539195, 1, 0.4196078, 0, 1,
-1.373554, 0.7738891, -1.763686, 1, 0.427451, 0, 1,
-1.361198, 0.3459456, -1.065158, 1, 0.4313726, 0, 1,
-1.345902, -0.2261576, -1.414396, 1, 0.4392157, 0, 1,
-1.34115, 0.8592421, -1.812996, 1, 0.4431373, 0, 1,
-1.338954, -0.5906237, -2.719314, 1, 0.4509804, 0, 1,
-1.336395, -0.233137, -2.614631, 1, 0.454902, 0, 1,
-1.328062, 0.3251391, -3.035957, 1, 0.4627451, 0, 1,
-1.313031, 0.1558579, -2.351759, 1, 0.4666667, 0, 1,
-1.304153, -0.2820422, -2.034648, 1, 0.4745098, 0, 1,
-1.301498, 0.597165, 0.3724192, 1, 0.4784314, 0, 1,
-1.298713, -0.2948736, -3.397756, 1, 0.4862745, 0, 1,
-1.29295, -1.206204, -4.161195, 1, 0.4901961, 0, 1,
-1.289567, 0.7336999, -2.152556, 1, 0.4980392, 0, 1,
-1.284273, 0.4824407, -0.07366084, 1, 0.5058824, 0, 1,
-1.280593, -0.451409, -3.380567, 1, 0.509804, 0, 1,
-1.280014, -1.727748, -3.589397, 1, 0.5176471, 0, 1,
-1.273483, 0.1876635, -0.2264459, 1, 0.5215687, 0, 1,
-1.266201, 0.3429065, -2.507122, 1, 0.5294118, 0, 1,
-1.263806, 0.6068621, -0.5753172, 1, 0.5333334, 0, 1,
-1.252782, -0.1750623, 0.05435167, 1, 0.5411765, 0, 1,
-1.248652, 1.03144, -2.020838, 1, 0.5450981, 0, 1,
-1.247102, -0.08908286, -1.122376, 1, 0.5529412, 0, 1,
-1.245546, -0.9481431, -1.492706, 1, 0.5568628, 0, 1,
-1.234459, 0.007188164, -2.404916, 1, 0.5647059, 0, 1,
-1.210792, 1.083891, 0.02330605, 1, 0.5686275, 0, 1,
-1.209953, 1.069889, -0.8200883, 1, 0.5764706, 0, 1,
-1.203228, -0.5003998, -2.662928, 1, 0.5803922, 0, 1,
-1.20296, -0.09557538, -0.640985, 1, 0.5882353, 0, 1,
-1.20247, -0.2606008, -1.375089, 1, 0.5921569, 0, 1,
-1.200321, 0.6676087, -0.8569875, 1, 0.6, 0, 1,
-1.199659, -0.7893547, -1.508374, 1, 0.6078432, 0, 1,
-1.199606, 0.8729915, -0.9537777, 1, 0.6117647, 0, 1,
-1.192965, -0.922834, 0.5102632, 1, 0.6196079, 0, 1,
-1.180719, 1.002212, -0.5905473, 1, 0.6235294, 0, 1,
-1.180035, -0.3055275, -2.608597, 1, 0.6313726, 0, 1,
-1.179869, 0.6410416, -1.23476, 1, 0.6352941, 0, 1,
-1.175821, 0.5906159, -1.705564, 1, 0.6431373, 0, 1,
-1.171167, -0.7276093, -2.092214, 1, 0.6470588, 0, 1,
-1.170858, -0.7325558, -1.745038, 1, 0.654902, 0, 1,
-1.167416, -0.8956909, -4.461101, 1, 0.6588235, 0, 1,
-1.15849, 1.814545, 0.1156065, 1, 0.6666667, 0, 1,
-1.157726, -0.6241567, -2.497621, 1, 0.6705883, 0, 1,
-1.140327, -1.265299, -3.262938, 1, 0.6784314, 0, 1,
-1.133536, 1.134311, -1.008979, 1, 0.682353, 0, 1,
-1.12749, -0.8000954, -2.151484, 1, 0.6901961, 0, 1,
-1.119632, 2.054503, -0.05865276, 1, 0.6941177, 0, 1,
-1.117081, 0.2632777, -0.788099, 1, 0.7019608, 0, 1,
-1.116369, 2.282031, -0.6329116, 1, 0.7098039, 0, 1,
-1.111243, 1.723152, -0.7418855, 1, 0.7137255, 0, 1,
-1.104598, 1.092023, -1.964686, 1, 0.7215686, 0, 1,
-1.094083, -1.253963, -3.512358, 1, 0.7254902, 0, 1,
-1.093789, 0.301385, -2.187499, 1, 0.7333333, 0, 1,
-1.092195, 1.657742, -1.780261, 1, 0.7372549, 0, 1,
-1.084371, 0.7482807, -0.6356896, 1, 0.7450981, 0, 1,
-1.080831, -0.2648811, -1.659555, 1, 0.7490196, 0, 1,
-1.072564, -1.140932, -2.081249, 1, 0.7568628, 0, 1,
-1.065482, -1.760264, -3.707522, 1, 0.7607843, 0, 1,
-1.065166, 0.6909429, -0.7429059, 1, 0.7686275, 0, 1,
-1.062677, 0.612442, -0.9359697, 1, 0.772549, 0, 1,
-1.062219, -0.9055706, -2.099916, 1, 0.7803922, 0, 1,
-1.057886, -0.622146, -1.827573, 1, 0.7843137, 0, 1,
-1.057879, -2.336156, -3.937396, 1, 0.7921569, 0, 1,
-1.042789, 0.5080528, -1.299984, 1, 0.7960784, 0, 1,
-1.038952, -1.109421, -2.889897, 1, 0.8039216, 0, 1,
-1.037435, 0.8424466, -1.237676, 1, 0.8117647, 0, 1,
-1.037374, -1.065696, -1.663733, 1, 0.8156863, 0, 1,
-1.02389, 2.073305, -1.71911, 1, 0.8235294, 0, 1,
-1.021217, -0.531994, -3.281128, 1, 0.827451, 0, 1,
-1.00807, 2.070292, -0.08325534, 1, 0.8352941, 0, 1,
-1.006468, 0.03825323, -0.8244468, 1, 0.8392157, 0, 1,
-1.003919, -0.03199147, -0.8620786, 1, 0.8470588, 0, 1,
-1.00243, -0.40804, -1.199492, 1, 0.8509804, 0, 1,
-0.9989712, -0.1385418, -1.904121, 1, 0.8588235, 0, 1,
-0.992933, -0.4817868, -1.14377, 1, 0.8627451, 0, 1,
-0.9893541, -0.1186206, -1.923088, 1, 0.8705882, 0, 1,
-0.9826288, -1.495247, -3.121681, 1, 0.8745098, 0, 1,
-0.98195, 0.6710255, -0.8172532, 1, 0.8823529, 0, 1,
-0.9776872, 0.8000057, -0.8146963, 1, 0.8862745, 0, 1,
-0.9650307, -0.4336239, -2.678224, 1, 0.8941177, 0, 1,
-0.9645794, 1.121784, -0.7803994, 1, 0.8980392, 0, 1,
-0.9630213, -1.684965, -1.492099, 1, 0.9058824, 0, 1,
-0.9597666, -0.8297004, -3.476858, 1, 0.9137255, 0, 1,
-0.9554871, 0.122661, -2.61724, 1, 0.9176471, 0, 1,
-0.9527236, 0.0197085, -2.018843, 1, 0.9254902, 0, 1,
-0.9521649, 0.5262055, -0.7336665, 1, 0.9294118, 0, 1,
-0.9518108, 0.5368668, -0.8703251, 1, 0.9372549, 0, 1,
-0.9464127, -0.2478116, -2.649995, 1, 0.9411765, 0, 1,
-0.9429795, -1.162133, -2.383639, 1, 0.9490196, 0, 1,
-0.9401152, -2.555417, -3.648083, 1, 0.9529412, 0, 1,
-0.9339371, -1.325182, -2.388858, 1, 0.9607843, 0, 1,
-0.9304629, -0.5402051, -3.448901, 1, 0.9647059, 0, 1,
-0.9261848, -0.3090122, -2.126976, 1, 0.972549, 0, 1,
-0.9224952, -0.3308465, -2.727696, 1, 0.9764706, 0, 1,
-0.9188589, -0.4832314, -1.656385, 1, 0.9843137, 0, 1,
-0.9140447, -0.8052236, -1.676848, 1, 0.9882353, 0, 1,
-0.9074998, -1.020588, -1.908382, 1, 0.9960784, 0, 1,
-0.9019837, -0.1968996, -0.9680389, 0.9960784, 1, 0, 1,
-0.8948412, 0.5749659, -1.881237, 0.9921569, 1, 0, 1,
-0.8838773, 0.7986834, -0.5056291, 0.9843137, 1, 0, 1,
-0.8836312, 0.2271903, -2.020474, 0.9803922, 1, 0, 1,
-0.8819376, -0.1480979, -1.572102, 0.972549, 1, 0, 1,
-0.8794246, -0.5770669, -2.101358, 0.9686275, 1, 0, 1,
-0.8771865, -1.177546, -2.596924, 0.9607843, 1, 0, 1,
-0.8756935, -0.8595008, -3.826213, 0.9568627, 1, 0, 1,
-0.8746198, -0.9159744, -1.893982, 0.9490196, 1, 0, 1,
-0.8741779, 1.433594, -1.786573, 0.945098, 1, 0, 1,
-0.8715793, -0.5538617, -2.850552, 0.9372549, 1, 0, 1,
-0.8712719, -0.6273097, -1.62146, 0.9333333, 1, 0, 1,
-0.8695517, -0.9918928, -2.457546, 0.9254902, 1, 0, 1,
-0.8605442, 2.162438, -1.303254, 0.9215686, 1, 0, 1,
-0.8578257, -0.3777656, -1.329622, 0.9137255, 1, 0, 1,
-0.8535972, -1.630437, -2.54773, 0.9098039, 1, 0, 1,
-0.8529502, 0.5628197, 0.02321886, 0.9019608, 1, 0, 1,
-0.8492423, 1.886335, -0.9571522, 0.8941177, 1, 0, 1,
-0.8467453, -1.349508, -1.691319, 0.8901961, 1, 0, 1,
-0.8460823, -0.8922051, -2.119838, 0.8823529, 1, 0, 1,
-0.8446644, -0.620425, -2.220469, 0.8784314, 1, 0, 1,
-0.839757, 1.326703, -0.4103295, 0.8705882, 1, 0, 1,
-0.8371835, -0.1128136, -0.6142341, 0.8666667, 1, 0, 1,
-0.8347044, 1.051777, -0.8937439, 0.8588235, 1, 0, 1,
-0.8300083, -0.9556219, -3.322898, 0.854902, 1, 0, 1,
-0.8251776, 0.639107, 0.767445, 0.8470588, 1, 0, 1,
-0.823094, -0.6154603, -1.572952, 0.8431373, 1, 0, 1,
-0.8149492, -0.3965563, -2.971959, 0.8352941, 1, 0, 1,
-0.8142399, -0.1569931, -1.900967, 0.8313726, 1, 0, 1,
-0.8113424, -0.9973582, -2.572266, 0.8235294, 1, 0, 1,
-0.8083035, 0.5491382, -1.216917, 0.8196079, 1, 0, 1,
-0.8073722, 0.03751587, -2.995391, 0.8117647, 1, 0, 1,
-0.8036168, 1.617154, -0.530821, 0.8078431, 1, 0, 1,
-0.8028575, 0.1559929, -2.639971, 0.8, 1, 0, 1,
-0.7958609, 1.299448, 0.2891961, 0.7921569, 1, 0, 1,
-0.7952758, 1.243969, -2.587898, 0.7882353, 1, 0, 1,
-0.7931176, 0.418899, -1.16551, 0.7803922, 1, 0, 1,
-0.7871805, -0.8836788, -3.765876, 0.7764706, 1, 0, 1,
-0.7852073, 0.6653596, -1.237378, 0.7686275, 1, 0, 1,
-0.7807162, 1.334681, 1.483847, 0.7647059, 1, 0, 1,
-0.7763544, 0.8089185, -1.310358, 0.7568628, 1, 0, 1,
-0.7720032, -0.8948849, -2.393852, 0.7529412, 1, 0, 1,
-0.7707602, -0.01995422, -3.719672, 0.7450981, 1, 0, 1,
-0.7685646, -1.11502, -2.359782, 0.7411765, 1, 0, 1,
-0.7682728, -0.9065884, -1.325666, 0.7333333, 1, 0, 1,
-0.7626607, -0.4646344, -0.8297032, 0.7294118, 1, 0, 1,
-0.760474, 0.6215644, 0.4698654, 0.7215686, 1, 0, 1,
-0.7598922, 0.2603539, -2.708664, 0.7176471, 1, 0, 1,
-0.7557721, -0.8383461, -0.444591, 0.7098039, 1, 0, 1,
-0.7504004, -0.3177381, -2.566427, 0.7058824, 1, 0, 1,
-0.7453597, -0.3878907, -2.526044, 0.6980392, 1, 0, 1,
-0.7358838, -0.8653172, -1.002627, 0.6901961, 1, 0, 1,
-0.7345089, 0.9078607, -0.7593027, 0.6862745, 1, 0, 1,
-0.7294379, 0.1344987, 0.3669852, 0.6784314, 1, 0, 1,
-0.7240001, -1.337438, -1.9101, 0.6745098, 1, 0, 1,
-0.7233666, 0.09207301, -0.5634523, 0.6666667, 1, 0, 1,
-0.7233399, -0.7411655, -1.647092, 0.6627451, 1, 0, 1,
-0.7215609, -0.7085099, -2.717373, 0.654902, 1, 0, 1,
-0.7153689, -1.804928, -1.128555, 0.6509804, 1, 0, 1,
-0.7147435, 0.4598894, -1.698149, 0.6431373, 1, 0, 1,
-0.7132286, -0.9582418, -2.513413, 0.6392157, 1, 0, 1,
-0.7122009, 0.3879355, -1.0497, 0.6313726, 1, 0, 1,
-0.7062976, 2.791873, 0.2671455, 0.627451, 1, 0, 1,
-0.7034363, 0.167013, -1.048394, 0.6196079, 1, 0, 1,
-0.695242, 0.3170385, 0.3337871, 0.6156863, 1, 0, 1,
-0.6948197, -0.8692793, -2.695543, 0.6078432, 1, 0, 1,
-0.6945791, -1.10093, -2.107834, 0.6039216, 1, 0, 1,
-0.6938899, -0.7219632, -0.9479815, 0.5960785, 1, 0, 1,
-0.6937635, 0.6000151, 1.027678, 0.5882353, 1, 0, 1,
-0.6870897, 1.621797, -0.06009103, 0.5843138, 1, 0, 1,
-0.6843004, -1.801051, -4.257696, 0.5764706, 1, 0, 1,
-0.6823246, 1.173502, -0.7489927, 0.572549, 1, 0, 1,
-0.6823103, 1.491609, 0.7614877, 0.5647059, 1, 0, 1,
-0.6745856, -0.5108959, -1.873514, 0.5607843, 1, 0, 1,
-0.6703831, 1.419887, 0.6620531, 0.5529412, 1, 0, 1,
-0.6643444, 1.323448, 0.2707468, 0.5490196, 1, 0, 1,
-0.6599147, 0.3118834, -1.251812, 0.5411765, 1, 0, 1,
-0.6551687, -0.7137519, -3.12165, 0.5372549, 1, 0, 1,
-0.6523956, 0.02156943, -0.9954415, 0.5294118, 1, 0, 1,
-0.6485095, -0.04274926, -2.151742, 0.5254902, 1, 0, 1,
-0.6442403, 0.04157619, -1.416316, 0.5176471, 1, 0, 1,
-0.6439604, -1.216623, -3.502582, 0.5137255, 1, 0, 1,
-0.6425302, -1.162869, -3.293422, 0.5058824, 1, 0, 1,
-0.637995, -0.3371021, -2.04778, 0.5019608, 1, 0, 1,
-0.6370418, -2.530348, -3.698121, 0.4941176, 1, 0, 1,
-0.6266635, -0.1263541, -3.036347, 0.4862745, 1, 0, 1,
-0.6250096, 2.303468, -0.3967709, 0.4823529, 1, 0, 1,
-0.6242958, 1.089074, -1.913536, 0.4745098, 1, 0, 1,
-0.6238727, -0.5774573, -2.191176, 0.4705882, 1, 0, 1,
-0.6222296, 1.140639, -0.1213699, 0.4627451, 1, 0, 1,
-0.618587, 0.03922099, -2.15731, 0.4588235, 1, 0, 1,
-0.6153628, -0.9158022, -2.88137, 0.4509804, 1, 0, 1,
-0.6131091, 1.744145, -1.182699, 0.4470588, 1, 0, 1,
-0.611618, 0.9473175, -0.3742488, 0.4392157, 1, 0, 1,
-0.610828, 0.5029907, -0.4716575, 0.4352941, 1, 0, 1,
-0.6106901, 0.647053, -0.4670196, 0.427451, 1, 0, 1,
-0.607107, 1.700531, -0.4263371, 0.4235294, 1, 0, 1,
-0.5940158, -0.4282337, -2.173563, 0.4156863, 1, 0, 1,
-0.5873362, -0.8549978, -0.4781939, 0.4117647, 1, 0, 1,
-0.5857863, -1.185778, -2.265437, 0.4039216, 1, 0, 1,
-0.5825745, -0.3187727, -3.518452, 0.3960784, 1, 0, 1,
-0.5805938, -0.2039883, -1.513912, 0.3921569, 1, 0, 1,
-0.580551, 0.6629236, -0.5937449, 0.3843137, 1, 0, 1,
-0.5783038, 0.3902126, -2.142347, 0.3803922, 1, 0, 1,
-0.5748855, 1.077884, -0.1467959, 0.372549, 1, 0, 1,
-0.5713595, -0.8964275, -2.413459, 0.3686275, 1, 0, 1,
-0.5684242, 1.572291, -0.6210436, 0.3607843, 1, 0, 1,
-0.556397, -0.1316104, -2.582758, 0.3568628, 1, 0, 1,
-0.5536253, -0.1511468, -0.6007538, 0.3490196, 1, 0, 1,
-0.5528433, -0.7440911, -3.21061, 0.345098, 1, 0, 1,
-0.5507525, 1.360194, -1.481105, 0.3372549, 1, 0, 1,
-0.537985, -0.2589141, -3.297086, 0.3333333, 1, 0, 1,
-0.5377985, 0.2056495, -1.170239, 0.3254902, 1, 0, 1,
-0.5339604, 1.221107, -0.1972986, 0.3215686, 1, 0, 1,
-0.5329494, 0.167014, -0.5508394, 0.3137255, 1, 0, 1,
-0.5194097, 0.1899618, -1.421091, 0.3098039, 1, 0, 1,
-0.5181293, 1.36773, -0.5490494, 0.3019608, 1, 0, 1,
-0.5169704, -0.1392897, -2.353593, 0.2941177, 1, 0, 1,
-0.5169449, -0.2967537, -2.894225, 0.2901961, 1, 0, 1,
-0.5164801, -0.03440912, 0.221192, 0.282353, 1, 0, 1,
-0.5164413, -1.228896, -2.344464, 0.2784314, 1, 0, 1,
-0.5163894, 0.887247, -0.1075236, 0.2705882, 1, 0, 1,
-0.5135761, 0.7623392, 0.4504042, 0.2666667, 1, 0, 1,
-0.5076878, -0.1019688, -1.473421, 0.2588235, 1, 0, 1,
-0.5059741, 0.2451963, -0.7084901, 0.254902, 1, 0, 1,
-0.4997068, 1.669865, -0.1776467, 0.2470588, 1, 0, 1,
-0.4993201, -0.1364821, -3.797773, 0.2431373, 1, 0, 1,
-0.4980017, 2.730407, 1.740751, 0.2352941, 1, 0, 1,
-0.4964903, 1.375465, -2.129853, 0.2313726, 1, 0, 1,
-0.4958004, 1.828346, -1.627765, 0.2235294, 1, 0, 1,
-0.4953939, 0.04101916, -1.60032, 0.2196078, 1, 0, 1,
-0.4864346, -0.3323921, -1.973811, 0.2117647, 1, 0, 1,
-0.4828553, 1.777905, 0.6297466, 0.2078431, 1, 0, 1,
-0.4808525, -0.01634875, -1.906145, 0.2, 1, 0, 1,
-0.4747539, 0.04947234, -0.5981835, 0.1921569, 1, 0, 1,
-0.4730099, -1.148789, -3.048451, 0.1882353, 1, 0, 1,
-0.4711907, -0.4345974, -1.848831, 0.1803922, 1, 0, 1,
-0.4701183, 0.2482289, 0.3991204, 0.1764706, 1, 0, 1,
-0.4670605, 0.03343663, -2.119399, 0.1686275, 1, 0, 1,
-0.4603961, -1.674422, -1.425253, 0.1647059, 1, 0, 1,
-0.4597293, -0.8145734, -3.166353, 0.1568628, 1, 0, 1,
-0.4552529, 1.209302, 0.2759423, 0.1529412, 1, 0, 1,
-0.4480889, 1.300007, -1.540927, 0.145098, 1, 0, 1,
-0.4478734, -0.3710241, -4.003368, 0.1411765, 1, 0, 1,
-0.4469395, 0.0125569, -1.219496, 0.1333333, 1, 0, 1,
-0.4440265, 0.3531175, -0.3492709, 0.1294118, 1, 0, 1,
-0.4397841, 0.602774, 0.8560144, 0.1215686, 1, 0, 1,
-0.4377684, -0.4986744, -2.337893, 0.1176471, 1, 0, 1,
-0.431082, 0.7118818, -1.791187, 0.1098039, 1, 0, 1,
-0.4272985, -0.1258613, -2.068808, 0.1058824, 1, 0, 1,
-0.4229515, -2.493362, -2.809357, 0.09803922, 1, 0, 1,
-0.4216425, 0.2739914, -0.0783762, 0.09019608, 1, 0, 1,
-0.4214482, 0.465037, -0.2190809, 0.08627451, 1, 0, 1,
-0.4180572, 0.5313012, -0.2455198, 0.07843138, 1, 0, 1,
-0.4142522, 0.2861571, -1.434835, 0.07450981, 1, 0, 1,
-0.4123497, 0.5663726, -0.3682845, 0.06666667, 1, 0, 1,
-0.4104242, 0.08577087, -2.784679, 0.0627451, 1, 0, 1,
-0.4091332, -2.496259, -3.379603, 0.05490196, 1, 0, 1,
-0.4085761, 1.758418, -0.1884226, 0.05098039, 1, 0, 1,
-0.4082249, -0.272987, -1.298006, 0.04313726, 1, 0, 1,
-0.4068168, 1.121026, -0.607243, 0.03921569, 1, 0, 1,
-0.4052497, 1.375233, -1.631961, 0.03137255, 1, 0, 1,
-0.4026601, 0.7396137, -0.6182272, 0.02745098, 1, 0, 1,
-0.4010772, -1.743317, -3.486007, 0.01960784, 1, 0, 1,
-0.3972395, -0.48702, -2.539805, 0.01568628, 1, 0, 1,
-0.3960245, 0.1027067, -1.490479, 0.007843138, 1, 0, 1,
-0.3870068, -0.09262703, -2.093565, 0.003921569, 1, 0, 1,
-0.3864987, 0.8636531, -1.504545, 0, 1, 0.003921569, 1,
-0.3855752, 0.3710161, -0.6183487, 0, 1, 0.01176471, 1,
-0.3841844, 0.550204, -1.260752, 0, 1, 0.01568628, 1,
-0.3824056, -1.798069, -3.2941, 0, 1, 0.02352941, 1,
-0.381869, -0.09279785, -3.038946, 0, 1, 0.02745098, 1,
-0.3795913, 1.303618, 0.6793721, 0, 1, 0.03529412, 1,
-0.3776695, -2.102998, -3.471491, 0, 1, 0.03921569, 1,
-0.3748963, -0.3726032, -1.259278, 0, 1, 0.04705882, 1,
-0.3693416, -0.3099665, -2.379615, 0, 1, 0.05098039, 1,
-0.359139, -0.3822196, -3.987895, 0, 1, 0.05882353, 1,
-0.3556795, 1.553686, 1.072359, 0, 1, 0.0627451, 1,
-0.3444191, -0.4380064, -2.586627, 0, 1, 0.07058824, 1,
-0.3441603, -0.7298716, -3.451855, 0, 1, 0.07450981, 1,
-0.3435637, 1.16521, -1.263942, 0, 1, 0.08235294, 1,
-0.3422009, 0.1654373, -0.5753988, 0, 1, 0.08627451, 1,
-0.3404459, 0.3195938, -1.138024, 0, 1, 0.09411765, 1,
-0.3398436, -1.143472, -2.790611, 0, 1, 0.1019608, 1,
-0.337859, 0.5266915, 0.4137225, 0, 1, 0.1058824, 1,
-0.3373165, 0.1862733, -0.0761661, 0, 1, 0.1137255, 1,
-0.3280264, -0.3792277, -1.951068, 0, 1, 0.1176471, 1,
-0.3265689, -0.32844, -4.428882, 0, 1, 0.1254902, 1,
-0.3261476, 0.2375132, -0.8564292, 0, 1, 0.1294118, 1,
-0.3260356, -0.3828958, -2.434631, 0, 1, 0.1372549, 1,
-0.3181672, 1.976215, 0.5514362, 0, 1, 0.1411765, 1,
-0.3181537, 1.408412, 0.3500162, 0, 1, 0.1490196, 1,
-0.3132559, 1.58237, -1.913315, 0, 1, 0.1529412, 1,
-0.3064191, -0.3479011, -1.067687, 0, 1, 0.1607843, 1,
-0.2969369, 1.09008, -0.9642665, 0, 1, 0.1647059, 1,
-0.2958626, -1.052004, -2.858845, 0, 1, 0.172549, 1,
-0.290159, 1.192224, -1.398137, 0, 1, 0.1764706, 1,
-0.2844156, 0.4094146, -0.4074529, 0, 1, 0.1843137, 1,
-0.2833295, 0.1782637, -1.072224, 0, 1, 0.1882353, 1,
-0.2820045, 0.489889, -0.3682238, 0, 1, 0.1960784, 1,
-0.2787352, 0.2477899, -1.911662, 0, 1, 0.2039216, 1,
-0.2733054, -0.2574755, -0.1796891, 0, 1, 0.2078431, 1,
-0.272429, -0.1675611, -2.228998, 0, 1, 0.2156863, 1,
-0.2696979, -0.9970305, -2.19435, 0, 1, 0.2196078, 1,
-0.2664573, -1.335876, -2.223036, 0, 1, 0.227451, 1,
-0.2662045, 1.56402, -0.305693, 0, 1, 0.2313726, 1,
-0.266159, 0.04899558, -0.7154869, 0, 1, 0.2392157, 1,
-0.2659684, 1.56928, -0.1347591, 0, 1, 0.2431373, 1,
-0.260013, -0.6910678, -2.557405, 0, 1, 0.2509804, 1,
-0.257695, -0.9882564, -2.829042, 0, 1, 0.254902, 1,
-0.2557868, -1.376042, -4.929159, 0, 1, 0.2627451, 1,
-0.2543989, -0.5876683, -1.786405, 0, 1, 0.2666667, 1,
-0.2539762, 0.04561801, -2.599092, 0, 1, 0.2745098, 1,
-0.2509949, -1.054621, -2.336723, 0, 1, 0.2784314, 1,
-0.2478561, 2.200867, 0.5371227, 0, 1, 0.2862745, 1,
-0.2434493, 0.400593, -0.9204985, 0, 1, 0.2901961, 1,
-0.2387874, 0.02655089, -2.51976, 0, 1, 0.2980392, 1,
-0.2378272, 1.874611, -1.623821, 0, 1, 0.3058824, 1,
-0.2354983, 0.4518345, -1.33962, 0, 1, 0.3098039, 1,
-0.2351698, 0.1541136, -0.6279604, 0, 1, 0.3176471, 1,
-0.2338794, 0.2696898, -1.277653, 0, 1, 0.3215686, 1,
-0.2316748, 0.2338639, -1.009671, 0, 1, 0.3294118, 1,
-0.2309249, -0.4257446, -2.064289, 0, 1, 0.3333333, 1,
-0.2265069, 0.8761917, 1.697201, 0, 1, 0.3411765, 1,
-0.2258481, -0.5156338, -3.104566, 0, 1, 0.345098, 1,
-0.2190546, -0.08004153, -2.518353, 0, 1, 0.3529412, 1,
-0.2166193, 0.7906806, 0.2482858, 0, 1, 0.3568628, 1,
-0.2140498, 0.2675993, 0.2217698, 0, 1, 0.3647059, 1,
-0.2077072, -0.6366476, -2.864638, 0, 1, 0.3686275, 1,
-0.206139, -0.4227722, -1.685098, 0, 1, 0.3764706, 1,
-0.1994953, 1.222226, -0.08877386, 0, 1, 0.3803922, 1,
-0.1946559, -0.3255593, -2.743905, 0, 1, 0.3882353, 1,
-0.1938054, 0.9294059, -0.3431613, 0, 1, 0.3921569, 1,
-0.1909951, -0.3733908, -1.477592, 0, 1, 0.4, 1,
-0.1896897, 0.7767798, 0.005653067, 0, 1, 0.4078431, 1,
-0.1876849, -1.672032, -2.454534, 0, 1, 0.4117647, 1,
-0.1867069, -0.5190926, -3.31746, 0, 1, 0.4196078, 1,
-0.1853497, -2.202093, -3.934297, 0, 1, 0.4235294, 1,
-0.1843901, 0.6487717, 1.420291, 0, 1, 0.4313726, 1,
-0.1841181, 0.1526723, 0.8098668, 0, 1, 0.4352941, 1,
-0.1832461, -0.5349284, -4.093002, 0, 1, 0.4431373, 1,
-0.1830038, 0.8071885, 1.645968, 0, 1, 0.4470588, 1,
-0.182916, -1.086257, -3.576342, 0, 1, 0.454902, 1,
-0.1825565, -1.552695, -4.94594, 0, 1, 0.4588235, 1,
-0.1822667, 0.2500717, -1.620045, 0, 1, 0.4666667, 1,
-0.1821834, -0.05661951, -3.527691, 0, 1, 0.4705882, 1,
-0.1756332, 1.343051, 1.587688, 0, 1, 0.4784314, 1,
-0.171513, 1.172751, -0.7446895, 0, 1, 0.4823529, 1,
-0.1703749, -1.564705, -3.99531, 0, 1, 0.4901961, 1,
-0.1687225, -0.4286669, -2.41389, 0, 1, 0.4941176, 1,
-0.1685443, -0.374158, -2.197061, 0, 1, 0.5019608, 1,
-0.1684489, -0.6296794, -2.327579, 0, 1, 0.509804, 1,
-0.1665021, 0.7544187, -0.7218454, 0, 1, 0.5137255, 1,
-0.1654443, -0.3578697, -2.664013, 0, 1, 0.5215687, 1,
-0.1643507, 0.4886998, -0.00966193, 0, 1, 0.5254902, 1,
-0.1557078, -0.9975619, -4.112533, 0, 1, 0.5333334, 1,
-0.1531793, -1.000608, -3.240495, 0, 1, 0.5372549, 1,
-0.1529918, 0.1185252, -1.113734, 0, 1, 0.5450981, 1,
-0.1484258, 0.5788794, 0.4822839, 0, 1, 0.5490196, 1,
-0.1421104, -1.33905, -2.635484, 0, 1, 0.5568628, 1,
-0.1417563, 0.4889956, -0.2009154, 0, 1, 0.5607843, 1,
-0.1383558, 0.9923614, -0.2936433, 0, 1, 0.5686275, 1,
-0.1377108, 0.1555846, -1.900927, 0, 1, 0.572549, 1,
-0.1365507, 0.2451145, -0.5349807, 0, 1, 0.5803922, 1,
-0.1354339, 1.654967, 0.8418407, 0, 1, 0.5843138, 1,
-0.1337959, -0.5566036, -4.502822, 0, 1, 0.5921569, 1,
-0.1326326, -0.5658231, -3.36151, 0, 1, 0.5960785, 1,
-0.1311825, -0.1894359, -2.426547, 0, 1, 0.6039216, 1,
-0.1222456, 0.7739362, 0.8592091, 0, 1, 0.6117647, 1,
-0.1198254, 0.760684, 0.2898866, 0, 1, 0.6156863, 1,
-0.1197403, 0.7830955, -0.1447318, 0, 1, 0.6235294, 1,
-0.1179882, -0.2782162, -3.874378, 0, 1, 0.627451, 1,
-0.1145536, -1.274418, -4.508832, 0, 1, 0.6352941, 1,
-0.1059816, -0.2952861, -2.44734, 0, 1, 0.6392157, 1,
-0.1051482, -0.8523293, -1.094813, 0, 1, 0.6470588, 1,
-0.1045396, -0.8084378, -4.856891, 0, 1, 0.6509804, 1,
-0.1045337, -0.7298796, -3.477387, 0, 1, 0.6588235, 1,
-0.1025059, -0.9808955, -3.74168, 0, 1, 0.6627451, 1,
-0.1022761, -0.5970035, -3.15073, 0, 1, 0.6705883, 1,
-0.1003378, -0.1745539, -2.782794, 0, 1, 0.6745098, 1,
-0.09467345, 1.978817, -1.267178, 0, 1, 0.682353, 1,
-0.08844177, -0.2443691, -4.293078, 0, 1, 0.6862745, 1,
-0.08280895, -0.4116312, -3.298448, 0, 1, 0.6941177, 1,
-0.07958109, 0.3713175, -0.3339456, 0, 1, 0.7019608, 1,
-0.07905348, -0.4838452, -4.227079, 0, 1, 0.7058824, 1,
-0.07808995, -0.472914, -2.8983, 0, 1, 0.7137255, 1,
-0.07805821, -0.9637922, -2.420001, 0, 1, 0.7176471, 1,
-0.07404882, -0.5584644, -4.29688, 0, 1, 0.7254902, 1,
-0.06984197, -0.2249614, -4.475698, 0, 1, 0.7294118, 1,
-0.06942347, -0.363391, -2.108081, 0, 1, 0.7372549, 1,
-0.06931606, 0.4045119, -1.068055, 0, 1, 0.7411765, 1,
-0.0685561, -1.983092, -3.941026, 0, 1, 0.7490196, 1,
-0.06800956, -0.1797664, -4.132444, 0, 1, 0.7529412, 1,
-0.06584608, -0.0341814, -1.217136, 0, 1, 0.7607843, 1,
-0.06490967, 1.11223, 0.1913571, 0, 1, 0.7647059, 1,
-0.06125, 0.8589117, 0.05217135, 0, 1, 0.772549, 1,
-0.05684788, 0.4758825, -0.5175633, 0, 1, 0.7764706, 1,
-0.0479066, -1.877167, -3.806744, 0, 1, 0.7843137, 1,
-0.04623, -1.753472, -3.445009, 0, 1, 0.7882353, 1,
-0.04481541, 0.1002875, -0.3058623, 0, 1, 0.7960784, 1,
-0.0419375, 0.9154047, -1.715854, 0, 1, 0.8039216, 1,
-0.04151372, 0.8242739, 1.953432, 0, 1, 0.8078431, 1,
-0.04110924, -1.086508, -2.93765, 0, 1, 0.8156863, 1,
-0.03534747, -1.060038, -2.987087, 0, 1, 0.8196079, 1,
-0.0346356, 0.1518327, -1.000256, 0, 1, 0.827451, 1,
-0.03278627, 0.4203442, -0.3162677, 0, 1, 0.8313726, 1,
-0.03126886, -0.6742778, -2.777971, 0, 1, 0.8392157, 1,
-0.03105406, 1.387797, 1.426807, 0, 1, 0.8431373, 1,
-0.03027266, -0.1322849, -3.360509, 0, 1, 0.8509804, 1,
-0.02766836, -0.2948292, -2.547431, 0, 1, 0.854902, 1,
-0.02611374, 1.301067, -0.5580833, 0, 1, 0.8627451, 1,
-0.0258855, 0.4307323, 1.060096, 0, 1, 0.8666667, 1,
-0.01903439, -1.591327, -1.669583, 0, 1, 0.8745098, 1,
-0.01592941, 1.458803, -0.8008406, 0, 1, 0.8784314, 1,
-0.01225849, -1.697971, -3.234348, 0, 1, 0.8862745, 1,
-0.008916126, -1.629346, -3.60437, 0, 1, 0.8901961, 1,
-0.007178687, -0.31807, -2.854018, 0, 1, 0.8980392, 1,
-0.005689271, -1.026125, -1.806245, 0, 1, 0.9058824, 1,
-0.0026654, -1.381215, -2.583989, 0, 1, 0.9098039, 1,
-0.002080098, 1.013618, -1.864161, 0, 1, 0.9176471, 1,
-0.0002194487, -0.49516, -1.740547, 0, 1, 0.9215686, 1,
0.0005747529, -0.4204676, 3.665962, 0, 1, 0.9294118, 1,
0.002211248, 0.07144193, -0.3695293, 0, 1, 0.9333333, 1,
0.003560082, 0.1541515, 0.5719086, 0, 1, 0.9411765, 1,
0.003625016, 2.003394, -0.01669203, 0, 1, 0.945098, 1,
0.008561094, -2.688686, 4.031368, 0, 1, 0.9529412, 1,
0.009100799, -0.6605958, 3.510007, 0, 1, 0.9568627, 1,
0.01259672, 0.8789423, 1.044888, 0, 1, 0.9647059, 1,
0.01440579, -1.271849, 2.803504, 0, 1, 0.9686275, 1,
0.01525925, 1.746294, -0.7072991, 0, 1, 0.9764706, 1,
0.01612543, -1.520496, 2.132491, 0, 1, 0.9803922, 1,
0.0169809, 0.4508969, -0.03485494, 0, 1, 0.9882353, 1,
0.01833345, -0.3170035, 3.115835, 0, 1, 0.9921569, 1,
0.02091728, -0.7203122, 3.821278, 0, 1, 1, 1,
0.02208805, -0.8098504, 3.043463, 0, 0.9921569, 1, 1,
0.02402689, -1.738371, 3.129363, 0, 0.9882353, 1, 1,
0.02553135, -1.420007, 3.344114, 0, 0.9803922, 1, 1,
0.02769816, 0.3751016, 0.2054994, 0, 0.9764706, 1, 1,
0.02918259, 1.97857, -0.1067548, 0, 0.9686275, 1, 1,
0.02932323, -0.5996852, 1.089498, 0, 0.9647059, 1, 1,
0.04023502, 2.047343, 1.042282, 0, 0.9568627, 1, 1,
0.04099656, -0.5553658, 3.716368, 0, 0.9529412, 1, 1,
0.04478303, -0.5057507, 4.776781, 0, 0.945098, 1, 1,
0.04667868, -0.958793, 2.63507, 0, 0.9411765, 1, 1,
0.046821, -0.1398798, 3.113115, 0, 0.9333333, 1, 1,
0.05156806, -0.4853359, 1.860985, 0, 0.9294118, 1, 1,
0.05881329, -0.4110399, 3.638042, 0, 0.9215686, 1, 1,
0.05982988, 0.232175, -0.9272237, 0, 0.9176471, 1, 1,
0.06115501, -0.08045445, 2.158422, 0, 0.9098039, 1, 1,
0.0638203, -1.285631, 4.668365, 0, 0.9058824, 1, 1,
0.06526868, 0.06412649, 0.06108034, 0, 0.8980392, 1, 1,
0.06747835, 0.966294, 0.8358629, 0, 0.8901961, 1, 1,
0.06844489, 1.296326, 1.796654, 0, 0.8862745, 1, 1,
0.07079182, 0.6882684, -1.325165, 0, 0.8784314, 1, 1,
0.0728398, -0.7439731, 3.470859, 0, 0.8745098, 1, 1,
0.07785898, -0.4470062, 3.267059, 0, 0.8666667, 1, 1,
0.07843808, 2.032867, -0.2752244, 0, 0.8627451, 1, 1,
0.08044069, 0.001604186, 3.521099, 0, 0.854902, 1, 1,
0.08287742, -1.16879, 2.077333, 0, 0.8509804, 1, 1,
0.08872217, -0.6123626, 3.174603, 0, 0.8431373, 1, 1,
0.09145958, -0.2355041, 2.97513, 0, 0.8392157, 1, 1,
0.09523292, 0.6306262, -0.5516915, 0, 0.8313726, 1, 1,
0.0988094, -0.4828117, 1.52589, 0, 0.827451, 1, 1,
0.1013932, 0.9030058, -1.023305, 0, 0.8196079, 1, 1,
0.1019874, 0.303107, 1.533403, 0, 0.8156863, 1, 1,
0.1042538, -0.9822569, 2.243881, 0, 0.8078431, 1, 1,
0.1044783, -1.933362, 3.67728, 0, 0.8039216, 1, 1,
0.1052865, -0.004920149, 0.5776849, 0, 0.7960784, 1, 1,
0.1073247, -0.4778019, 3.276355, 0, 0.7882353, 1, 1,
0.1083271, -0.06036206, 0.8934591, 0, 0.7843137, 1, 1,
0.1091553, -0.4364434, 3.093267, 0, 0.7764706, 1, 1,
0.1103168, -1.589232, 2.035659, 0, 0.772549, 1, 1,
0.1103873, -1.271343, 1.393606, 0, 0.7647059, 1, 1,
0.111408, -0.9271532, 2.972815, 0, 0.7607843, 1, 1,
0.1121548, -0.5757787, 1.971526, 0, 0.7529412, 1, 1,
0.1141686, 0.9874116, 1.162249, 0, 0.7490196, 1, 1,
0.1163651, 1.957774, -2.157305, 0, 0.7411765, 1, 1,
0.1206936, -1.014363, 2.780419, 0, 0.7372549, 1, 1,
0.1242447, -0.8357383, 4.03933, 0, 0.7294118, 1, 1,
0.126162, -1.652016, 3.591897, 0, 0.7254902, 1, 1,
0.1269265, 0.03857299, -0.5279858, 0, 0.7176471, 1, 1,
0.135428, 1.172303, -1.193288, 0, 0.7137255, 1, 1,
0.1365419, -1.196045, 2.364461, 0, 0.7058824, 1, 1,
0.1410476, -0.5132496, 2.165273, 0, 0.6980392, 1, 1,
0.141624, 0.804749, 2.102078, 0, 0.6941177, 1, 1,
0.1435976, -0.3978837, 3.039956, 0, 0.6862745, 1, 1,
0.1445379, 1.238882, 0.04544412, 0, 0.682353, 1, 1,
0.14646, 0.4563825, 1.749118, 0, 0.6745098, 1, 1,
0.147874, 0.7644546, 0.9795187, 0, 0.6705883, 1, 1,
0.1522933, 2.336968, -1.282136, 0, 0.6627451, 1, 1,
0.1536052, 1.227736, 1.767347, 0, 0.6588235, 1, 1,
0.15671, -2.067336, 4.638296, 0, 0.6509804, 1, 1,
0.1583946, -1.041444, 3.814213, 0, 0.6470588, 1, 1,
0.1616296, 0.7662341, 1.262069, 0, 0.6392157, 1, 1,
0.1622999, 0.1728566, 1.232133, 0, 0.6352941, 1, 1,
0.1644159, -0.7847459, 3.045844, 0, 0.627451, 1, 1,
0.1737847, 1.424618, -0.676413, 0, 0.6235294, 1, 1,
0.1739236, -0.5619086, 3.095145, 0, 0.6156863, 1, 1,
0.1740935, 0.09270099, 0.6751609, 0, 0.6117647, 1, 1,
0.1751674, 2.425259, -0.1801827, 0, 0.6039216, 1, 1,
0.1758982, -0.2356831, 2.036703, 0, 0.5960785, 1, 1,
0.1759648, 0.8012301, -0.7507672, 0, 0.5921569, 1, 1,
0.1843322, 0.4619675, -0.7046568, 0, 0.5843138, 1, 1,
0.1873266, -1.612116, 5.152234, 0, 0.5803922, 1, 1,
0.1888943, 1.016333, -0.5963119, 0, 0.572549, 1, 1,
0.1893479, -0.8162473, 3.303139, 0, 0.5686275, 1, 1,
0.1925737, -1.940947, 4.008175, 0, 0.5607843, 1, 1,
0.193596, -1.006462, 3.708373, 0, 0.5568628, 1, 1,
0.1959643, -0.09759799, 1.725391, 0, 0.5490196, 1, 1,
0.1980072, -1.249595, 2.380993, 0, 0.5450981, 1, 1,
0.199101, -0.8788665, 2.440514, 0, 0.5372549, 1, 1,
0.203119, -0.6162594, 2.490621, 0, 0.5333334, 1, 1,
0.2058302, -2.789983, 5.338813, 0, 0.5254902, 1, 1,
0.2059645, -0.544247, 4.061004, 0, 0.5215687, 1, 1,
0.2091523, 0.5658675, 0.2290898, 0, 0.5137255, 1, 1,
0.2098414, -0.6209111, 4.492299, 0, 0.509804, 1, 1,
0.210876, 1.094501, -1.597604, 0, 0.5019608, 1, 1,
0.2124171, -0.8052712, 2.324251, 0, 0.4941176, 1, 1,
0.2143574, -1.239243, 2.256564, 0, 0.4901961, 1, 1,
0.2164592, -0.04060572, 2.519934, 0, 0.4823529, 1, 1,
0.2165038, 0.9285183, 0.01240107, 0, 0.4784314, 1, 1,
0.2168718, 0.9940268, 0.7869716, 0, 0.4705882, 1, 1,
0.2169772, 0.1567124, 1.004518, 0, 0.4666667, 1, 1,
0.2191443, 0.2406934, 0.513364, 0, 0.4588235, 1, 1,
0.2214968, 1.331229, -0.5353434, 0, 0.454902, 1, 1,
0.2240549, 2.251495, 0.9628959, 0, 0.4470588, 1, 1,
0.2252064, 1.236566, 1.312096, 0, 0.4431373, 1, 1,
0.2270924, 1.623417, -0.9762134, 0, 0.4352941, 1, 1,
0.2278842, 0.05947501, 2.092157, 0, 0.4313726, 1, 1,
0.229551, 1.7249, 0.3185006, 0, 0.4235294, 1, 1,
0.2309081, -1.51215, 2.333657, 0, 0.4196078, 1, 1,
0.2314068, 0.1863064, -0.6866407, 0, 0.4117647, 1, 1,
0.2335489, -1.200749, 3.657265, 0, 0.4078431, 1, 1,
0.2383915, -0.6624215, 2.580291, 0, 0.4, 1, 1,
0.2433087, -0.1287951, 1.285902, 0, 0.3921569, 1, 1,
0.2472626, 1.907753, 1.769661, 0, 0.3882353, 1, 1,
0.2526426, -0.3022225, 2.943485, 0, 0.3803922, 1, 1,
0.2540966, -1.058779, 1.827375, 0, 0.3764706, 1, 1,
0.2592588, -0.1632532, 2.656029, 0, 0.3686275, 1, 1,
0.2624189, -0.4471321, 2.468992, 0, 0.3647059, 1, 1,
0.2627187, 1.247988, -2.795703, 0, 0.3568628, 1, 1,
0.2742524, 0.7047423, 0.5219526, 0, 0.3529412, 1, 1,
0.2777436, 1.621815, 0.9620968, 0, 0.345098, 1, 1,
0.2779336, -0.7125289, 1.886803, 0, 0.3411765, 1, 1,
0.2811929, -0.2636203, 3.236278, 0, 0.3333333, 1, 1,
0.2850101, 0.4975369, 0.01860084, 0, 0.3294118, 1, 1,
0.2858709, -0.06931596, 0.2804637, 0, 0.3215686, 1, 1,
0.2899843, 0.5313526, -0.3223381, 0, 0.3176471, 1, 1,
0.2969126, 0.2624069, 0.4904358, 0, 0.3098039, 1, 1,
0.2979603, 0.6120057, -0.8229249, 0, 0.3058824, 1, 1,
0.2992467, 0.3153847, 1.17253, 0, 0.2980392, 1, 1,
0.3041553, 1.375611, 0.6200854, 0, 0.2901961, 1, 1,
0.3059041, -0.02459292, 1.184031, 0, 0.2862745, 1, 1,
0.3060515, -0.6464428, 2.402644, 0, 0.2784314, 1, 1,
0.3109227, 0.3616219, 0.3276333, 0, 0.2745098, 1, 1,
0.311145, 1.408157, 0.9217744, 0, 0.2666667, 1, 1,
0.3123451, 1.212516, 0.4116427, 0, 0.2627451, 1, 1,
0.3133443, -0.82894, 3.501565, 0, 0.254902, 1, 1,
0.3136128, 0.801906, 1.504697, 0, 0.2509804, 1, 1,
0.3178669, 0.6205806, 0.6736406, 0, 0.2431373, 1, 1,
0.3179164, -0.8971742, 3.373327, 0, 0.2392157, 1, 1,
0.3190065, 1.421634, 1.167033, 0, 0.2313726, 1, 1,
0.3216218, 1.889819, 1.710048, 0, 0.227451, 1, 1,
0.3242142, 0.7865538, 0.3929929, 0, 0.2196078, 1, 1,
0.3243851, 0.677869, -1.665083, 0, 0.2156863, 1, 1,
0.3274352, -0.221237, 2.819544, 0, 0.2078431, 1, 1,
0.3293185, 0.2220649, 1.007628, 0, 0.2039216, 1, 1,
0.329766, 0.3961353, 1.058417, 0, 0.1960784, 1, 1,
0.3374095, 0.2079813, -0.9103212, 0, 0.1882353, 1, 1,
0.3435397, 0.390354, -0.3643655, 0, 0.1843137, 1, 1,
0.3450739, 0.7770618, 1.786797, 0, 0.1764706, 1, 1,
0.3460058, 3.085462, 1.091206, 0, 0.172549, 1, 1,
0.3461665, -0.7671349, 1.620753, 0, 0.1647059, 1, 1,
0.3473454, -0.01113824, 1.406961, 0, 0.1607843, 1, 1,
0.3498541, 0.9863917, -1.844204, 0, 0.1529412, 1, 1,
0.3567141, -1.966984, 2.940373, 0, 0.1490196, 1, 1,
0.3609114, -1.101982, 1.233491, 0, 0.1411765, 1, 1,
0.3609189, -1.895945, 2.498145, 0, 0.1372549, 1, 1,
0.361136, -0.7157589, 2.075474, 0, 0.1294118, 1, 1,
0.3618816, -1.26382, 3.13355, 0, 0.1254902, 1, 1,
0.3629309, -0.5961888, 2.237025, 0, 0.1176471, 1, 1,
0.3705964, 0.2430834, 2.855728, 0, 0.1137255, 1, 1,
0.3707192, 0.2085963, 1.691906, 0, 0.1058824, 1, 1,
0.3718959, -0.567026, 3.620762, 0, 0.09803922, 1, 1,
0.3871179, 0.6776102, 2.501369, 0, 0.09411765, 1, 1,
0.3872625, -0.2775848, 1.881226, 0, 0.08627451, 1, 1,
0.3952573, -0.9294663, 3.165941, 0, 0.08235294, 1, 1,
0.3973182, -0.7678564, 0.7294799, 0, 0.07450981, 1, 1,
0.3993451, 2.023431, -0.1528178, 0, 0.07058824, 1, 1,
0.4013194, 0.2574042, 1.174915, 0, 0.0627451, 1, 1,
0.4034962, -0.5285145, 4.156325, 0, 0.05882353, 1, 1,
0.4053826, -1.649854, 3.661946, 0, 0.05098039, 1, 1,
0.4068204, 0.6583451, 0.05133612, 0, 0.04705882, 1, 1,
0.4112951, -0.1538566, 0.2328749, 0, 0.03921569, 1, 1,
0.416575, -0.5254259, 2.941004, 0, 0.03529412, 1, 1,
0.4235557, 1.226802, 0.7971087, 0, 0.02745098, 1, 1,
0.4245731, 0.1696596, 2.41315, 0, 0.02352941, 1, 1,
0.424955, 1.138361, -0.1439591, 0, 0.01568628, 1, 1,
0.4281026, -1.91512, 2.450842, 0, 0.01176471, 1, 1,
0.4282183, -0.006593016, 0.7175587, 0, 0.003921569, 1, 1,
0.4390246, -0.6581863, 0.3206859, 0.003921569, 0, 1, 1,
0.4431574, -0.7885383, 2.490186, 0.007843138, 0, 1, 1,
0.4464951, -0.1361417, 3.802101, 0.01568628, 0, 1, 1,
0.4492627, -1.296604, 3.280256, 0.01960784, 0, 1, 1,
0.4548732, -0.490519, 3.084893, 0.02745098, 0, 1, 1,
0.4641549, 0.6682231, -1.161029, 0.03137255, 0, 1, 1,
0.4686447, 0.4338407, 0.2599609, 0.03921569, 0, 1, 1,
0.4692476, 1.674102, 1.057541, 0.04313726, 0, 1, 1,
0.4798498, 0.7901678, 0.7424326, 0.05098039, 0, 1, 1,
0.4835534, -1.131624, 2.116422, 0.05490196, 0, 1, 1,
0.4937779, 0.811209, 0.6076635, 0.0627451, 0, 1, 1,
0.4946291, 0.5145993, 1.614847, 0.06666667, 0, 1, 1,
0.4952864, -0.1600256, 1.185622, 0.07450981, 0, 1, 1,
0.5003822, 0.04882479, 2.432155, 0.07843138, 0, 1, 1,
0.5106902, -0.3008127, 1.745943, 0.08627451, 0, 1, 1,
0.5167443, 1.665338, 0.3345153, 0.09019608, 0, 1, 1,
0.5170454, -1.671501, 1.38271, 0.09803922, 0, 1, 1,
0.5175433, 0.3326775, 1.870648, 0.1058824, 0, 1, 1,
0.5217988, 0.3409497, 1.100675, 0.1098039, 0, 1, 1,
0.5240091, 0.7809912, 3.767648, 0.1176471, 0, 1, 1,
0.5290598, -1.237942, 2.525729, 0.1215686, 0, 1, 1,
0.5382147, -0.04649426, 1.816359, 0.1294118, 0, 1, 1,
0.5388742, -0.6762654, 1.077712, 0.1333333, 0, 1, 1,
0.5400711, 1.118053, 1.820925, 0.1411765, 0, 1, 1,
0.5406032, 0.5158294, 1.46288, 0.145098, 0, 1, 1,
0.5417858, 1.864482, -0.701899, 0.1529412, 0, 1, 1,
0.5472133, -0.07212023, 1.475641, 0.1568628, 0, 1, 1,
0.5476571, -1.11697, 2.552397, 0.1647059, 0, 1, 1,
0.5477777, 1.252236, 0.5726318, 0.1686275, 0, 1, 1,
0.5479182, -0.6134983, 3.443332, 0.1764706, 0, 1, 1,
0.5506477, 0.8495792, 2.255382, 0.1803922, 0, 1, 1,
0.5582834, -1.580479, 3.097238, 0.1882353, 0, 1, 1,
0.5599658, -0.04891602, 0.4940986, 0.1921569, 0, 1, 1,
0.5656086, -0.8411009, 2.313136, 0.2, 0, 1, 1,
0.5672692, 0.359237, 0.7815135, 0.2078431, 0, 1, 1,
0.5699181, -2.31953, 0.7255563, 0.2117647, 0, 1, 1,
0.573532, 0.1113652, 0.06668828, 0.2196078, 0, 1, 1,
0.5831209, 0.4997614, 0.9053403, 0.2235294, 0, 1, 1,
0.5858943, 0.2574605, 0.6813841, 0.2313726, 0, 1, 1,
0.5887216, 0.3779895, 1.52283, 0.2352941, 0, 1, 1,
0.5933843, 0.1991551, 1.336668, 0.2431373, 0, 1, 1,
0.5947088, -0.4445961, 3.221542, 0.2470588, 0, 1, 1,
0.598811, 1.538881, 0.9091406, 0.254902, 0, 1, 1,
0.6011042, 1.920259, 0.2200546, 0.2588235, 0, 1, 1,
0.6012304, 0.8550754, 2.051709, 0.2666667, 0, 1, 1,
0.6013544, 0.04857584, 0.6353851, 0.2705882, 0, 1, 1,
0.6063417, -0.1595972, 1.134391, 0.2784314, 0, 1, 1,
0.6067623, 1.599892, -1.656781, 0.282353, 0, 1, 1,
0.6144605, 0.5997256, 1.152822, 0.2901961, 0, 1, 1,
0.6179498, -1.770828, 0.5641575, 0.2941177, 0, 1, 1,
0.6182729, 0.3326957, 0.678344, 0.3019608, 0, 1, 1,
0.6201172, -0.8891039, 3.005623, 0.3098039, 0, 1, 1,
0.6238114, -2.43246, 2.846338, 0.3137255, 0, 1, 1,
0.6247226, -1.43773, 3.994774, 0.3215686, 0, 1, 1,
0.6344494, -0.3945985, 2.574862, 0.3254902, 0, 1, 1,
0.6371447, -0.7685946, 2.522337, 0.3333333, 0, 1, 1,
0.6402391, -0.908636, 3.059293, 0.3372549, 0, 1, 1,
0.6405735, 0.3034295, 1.735608, 0.345098, 0, 1, 1,
0.641918, 0.74457, 0.9514158, 0.3490196, 0, 1, 1,
0.6428195, -0.5773469, 2.26519, 0.3568628, 0, 1, 1,
0.6451091, 0.6229386, 1.807269, 0.3607843, 0, 1, 1,
0.6508387, 1.351848, 0.891929, 0.3686275, 0, 1, 1,
0.6535189, 0.4664473, 0.790313, 0.372549, 0, 1, 1,
0.6541219, -0.8209527, 2.952186, 0.3803922, 0, 1, 1,
0.6551795, 1.030961, 3.89654, 0.3843137, 0, 1, 1,
0.6556196, -1.574491, 2.459378, 0.3921569, 0, 1, 1,
0.6580078, 1.831127, 1.483417, 0.3960784, 0, 1, 1,
0.6621279, 0.1797326, 2.924189, 0.4039216, 0, 1, 1,
0.6667877, 0.1299417, 1.139015, 0.4117647, 0, 1, 1,
0.667058, 1.394616, 1.312279, 0.4156863, 0, 1, 1,
0.668018, -1.070777, 1.933709, 0.4235294, 0, 1, 1,
0.6697258, 0.3584779, 1.630937, 0.427451, 0, 1, 1,
0.6718146, 0.7967302, -0.2608694, 0.4352941, 0, 1, 1,
0.6736, 1.38506, 0.5663124, 0.4392157, 0, 1, 1,
0.6794331, 0.1440277, 3.534068, 0.4470588, 0, 1, 1,
0.6810123, 0.2681083, 1.358946, 0.4509804, 0, 1, 1,
0.6943313, -0.06815749, 1.453667, 0.4588235, 0, 1, 1,
0.7040178, -1.605933, 3.324283, 0.4627451, 0, 1, 1,
0.708091, 0.6022471, 0.3489217, 0.4705882, 0, 1, 1,
0.7082331, -1.659649, 2.530205, 0.4745098, 0, 1, 1,
0.7084652, -1.402743, 2.721557, 0.4823529, 0, 1, 1,
0.7086084, -0.8885863, 2.875164, 0.4862745, 0, 1, 1,
0.7150524, 0.4327581, 3.303109, 0.4941176, 0, 1, 1,
0.7166227, -1.524623, 4.363946, 0.5019608, 0, 1, 1,
0.72252, -0.1824019, 3.006524, 0.5058824, 0, 1, 1,
0.7241136, 0.4083738, 2.496548, 0.5137255, 0, 1, 1,
0.7246193, 1.08279, -0.2294622, 0.5176471, 0, 1, 1,
0.7264181, 0.3677551, 1.58618, 0.5254902, 0, 1, 1,
0.7360557, -2.564245, 1.930024, 0.5294118, 0, 1, 1,
0.7394382, -0.4386945, 2.177079, 0.5372549, 0, 1, 1,
0.7455307, -1.472943, 2.545656, 0.5411765, 0, 1, 1,
0.7458298, 0.1259659, 2.229507, 0.5490196, 0, 1, 1,
0.7465749, -0.5203846, 2.891275, 0.5529412, 0, 1, 1,
0.7485643, 0.4227747, 0.502168, 0.5607843, 0, 1, 1,
0.7587178, -2.164975, 4.40049, 0.5647059, 0, 1, 1,
0.7596623, -0.03939648, 1.117019, 0.572549, 0, 1, 1,
0.7604756, 1.052704, -1.440369, 0.5764706, 0, 1, 1,
0.766167, -0.4076188, 0.2875662, 0.5843138, 0, 1, 1,
0.7664252, 1.739025, 0.07265799, 0.5882353, 0, 1, 1,
0.766764, -1.030083, 1.931565, 0.5960785, 0, 1, 1,
0.7693243, 0.104527, 2.630171, 0.6039216, 0, 1, 1,
0.7724673, 0.4072191, 0.2809745, 0.6078432, 0, 1, 1,
0.7807108, 1.005133, 0.6860968, 0.6156863, 0, 1, 1,
0.7813512, -0.7005476, 1.070971, 0.6196079, 0, 1, 1,
0.786366, -0.6246767, 2.04162, 0.627451, 0, 1, 1,
0.7886627, 0.2523567, 1.637381, 0.6313726, 0, 1, 1,
0.7923501, -1.262457, 2.991968, 0.6392157, 0, 1, 1,
0.7933794, 1.363545, 0.2956172, 0.6431373, 0, 1, 1,
0.7970805, 1.134532, 1.128546, 0.6509804, 0, 1, 1,
0.7990251, 0.05506234, 0.8836294, 0.654902, 0, 1, 1,
0.799728, 0.4992125, 0.1238418, 0.6627451, 0, 1, 1,
0.8041407, 0.4810802, 2.142754, 0.6666667, 0, 1, 1,
0.8049561, 0.4831634, 1.164981, 0.6745098, 0, 1, 1,
0.8071269, -0.3833449, 2.53976, 0.6784314, 0, 1, 1,
0.808391, 0.3941372, 1.430926, 0.6862745, 0, 1, 1,
0.8191637, 0.06116157, 1.795311, 0.6901961, 0, 1, 1,
0.8206756, 0.8904833, -0.5649613, 0.6980392, 0, 1, 1,
0.8254206, -0.3815149, 3.354479, 0.7058824, 0, 1, 1,
0.828079, -0.370851, 1.209908, 0.7098039, 0, 1, 1,
0.8334275, -0.3006711, 2.431975, 0.7176471, 0, 1, 1,
0.8357086, -0.3849876, -0.2160199, 0.7215686, 0, 1, 1,
0.8374363, -0.2916664, 2.054076, 0.7294118, 0, 1, 1,
0.8408168, -1.30756, 2.501357, 0.7333333, 0, 1, 1,
0.854826, -0.08084708, 0.5499694, 0.7411765, 0, 1, 1,
0.8560022, -0.5788357, 2.468287, 0.7450981, 0, 1, 1,
0.8604016, 0.7292998, -0.895666, 0.7529412, 0, 1, 1,
0.8656893, 0.2858166, 1.512424, 0.7568628, 0, 1, 1,
0.8682415, 1.881738, 2.360058, 0.7647059, 0, 1, 1,
0.8790767, 1.444831, 1.403148, 0.7686275, 0, 1, 1,
0.8808576, 0.4413413, 0.2797743, 0.7764706, 0, 1, 1,
0.8867065, 1.463634, 0.1698681, 0.7803922, 0, 1, 1,
0.9014482, 0.580549, 0.1514689, 0.7882353, 0, 1, 1,
0.9019614, 0.6699502, -2.917035, 0.7921569, 0, 1, 1,
0.9040407, -1.33059, 2.503175, 0.8, 0, 1, 1,
0.9162615, -0.5680737, 3.154414, 0.8078431, 0, 1, 1,
0.9165432, -0.03369598, 2.14002, 0.8117647, 0, 1, 1,
0.9170471, 0.08014791, 2.517121, 0.8196079, 0, 1, 1,
0.921424, -1.297054, 0.9595186, 0.8235294, 0, 1, 1,
0.9217129, 0.3601297, 0.8304759, 0.8313726, 0, 1, 1,
0.924887, -0.550395, 2.346567, 0.8352941, 0, 1, 1,
0.9261884, -0.04292647, 0.6777777, 0.8431373, 0, 1, 1,
0.9272955, 0.9504244, -0.01772364, 0.8470588, 0, 1, 1,
0.9313691, -1.675776, 3.510044, 0.854902, 0, 1, 1,
0.9317811, 0.3080025, 2.554225, 0.8588235, 0, 1, 1,
0.9331723, -1.520596, 3.302169, 0.8666667, 0, 1, 1,
0.9350292, 0.06271816, 1.411135, 0.8705882, 0, 1, 1,
0.9354035, -0.04162902, 0.6806257, 0.8784314, 0, 1, 1,
0.939974, -1.163702, 1.652287, 0.8823529, 0, 1, 1,
0.9442194, -2.036956, 3.894046, 0.8901961, 0, 1, 1,
0.9446127, 1.04726, 0.5109242, 0.8941177, 0, 1, 1,
0.9474196, 0.5960503, -0.01174421, 0.9019608, 0, 1, 1,
0.9532528, -1.349463, 2.806701, 0.9098039, 0, 1, 1,
0.956327, -0.6966299, 4.200245, 0.9137255, 0, 1, 1,
0.9587776, -0.2347011, 2.153242, 0.9215686, 0, 1, 1,
0.9607742, 1.504623, 1.376369, 0.9254902, 0, 1, 1,
0.9616475, -1.473285, 4.226649, 0.9333333, 0, 1, 1,
0.9650375, 0.3864862, 1.379524, 0.9372549, 0, 1, 1,
0.96965, -1.521835, 2.954948, 0.945098, 0, 1, 1,
0.970247, 0.3822994, 2.097711, 0.9490196, 0, 1, 1,
0.971232, 0.4310396, 2.231198, 0.9568627, 0, 1, 1,
0.9941039, 0.1336613, 0.5173025, 0.9607843, 0, 1, 1,
0.9955457, -1.720974, 2.509339, 0.9686275, 0, 1, 1,
0.9960479, -1.495205, 3.031042, 0.972549, 0, 1, 1,
0.9990451, 1.446327, 0.58513, 0.9803922, 0, 1, 1,
1.01406, -0.7504756, 2.532316, 0.9843137, 0, 1, 1,
1.015128, 2.115767, 3.013294, 0.9921569, 0, 1, 1,
1.017266, 0.2663064, 3.529132, 0.9960784, 0, 1, 1,
1.018087, -0.2860084, 0.1026049, 1, 0, 0.9960784, 1,
1.022915, 0.6556944, 2.194878, 1, 0, 0.9882353, 1,
1.02545, 2.858552, -0.07819687, 1, 0, 0.9843137, 1,
1.025517, -1.267579, 2.44008, 1, 0, 0.9764706, 1,
1.026385, -0.8070927, 3.343414, 1, 0, 0.972549, 1,
1.032813, -1.1006, 3.456368, 1, 0, 0.9647059, 1,
1.039873, 0.2027969, 2.077778, 1, 0, 0.9607843, 1,
1.043174, -1.647849, 4.650987, 1, 0, 0.9529412, 1,
1.04415, 0.4350212, 1.706572, 1, 0, 0.9490196, 1,
1.050642, -0.5418347, 2.835244, 1, 0, 0.9411765, 1,
1.05318, 0.9790668, 1.638825, 1, 0, 0.9372549, 1,
1.054918, 0.2315869, 1.800074, 1, 0, 0.9294118, 1,
1.05671, -0.5020289, 1.052781, 1, 0, 0.9254902, 1,
1.05891, -2.087358, 2.152771, 1, 0, 0.9176471, 1,
1.061078, -1.958466, 2.808421, 1, 0, 0.9137255, 1,
1.069826, 0.7013243, -0.9232035, 1, 0, 0.9058824, 1,
1.072121, -0.08857507, 1.457241, 1, 0, 0.9019608, 1,
1.091828, -0.3385034, 4.285605, 1, 0, 0.8941177, 1,
1.09437, 2.079837, 0.2507738, 1, 0, 0.8862745, 1,
1.097749, 0.8399543, 1.447954, 1, 0, 0.8823529, 1,
1.105202, -0.3765647, 2.919813, 1, 0, 0.8745098, 1,
1.105805, 0.569445, 0.3268364, 1, 0, 0.8705882, 1,
1.107532, -2.444914, 2.299426, 1, 0, 0.8627451, 1,
1.11031, 0.9264665, -0.866037, 1, 0, 0.8588235, 1,
1.118572, -0.9539858, 2.384573, 1, 0, 0.8509804, 1,
1.122503, 0.6669312, 1.072325, 1, 0, 0.8470588, 1,
1.129058, 0.2997845, 0.2093487, 1, 0, 0.8392157, 1,
1.133322, 0.3544236, -0.3977234, 1, 0, 0.8352941, 1,
1.137346, 0.2636216, 0.3719181, 1, 0, 0.827451, 1,
1.143913, -0.4691107, 2.370618, 1, 0, 0.8235294, 1,
1.145455, -0.004918056, 0.4444801, 1, 0, 0.8156863, 1,
1.154143, -0.5272654, 1.293877, 1, 0, 0.8117647, 1,
1.154244, -0.4583125, 2.790281, 1, 0, 0.8039216, 1,
1.156359, 0.1501465, 0.8804551, 1, 0, 0.7960784, 1,
1.156703, -0.1902394, 1.172677, 1, 0, 0.7921569, 1,
1.157488, -0.4711877, 2.937188, 1, 0, 0.7843137, 1,
1.163856, -0.4997465, -0.4269278, 1, 0, 0.7803922, 1,
1.169455, 0.9324604, 0.9600111, 1, 0, 0.772549, 1,
1.175246, -2.231485, 3.251477, 1, 0, 0.7686275, 1,
1.187047, -1.29088, 3.376681, 1, 0, 0.7607843, 1,
1.189321, -0.4975632, 1.439735, 1, 0, 0.7568628, 1,
1.192334, 1.932104, 0.3990816, 1, 0, 0.7490196, 1,
1.198898, -0.917798, 1.07715, 1, 0, 0.7450981, 1,
1.220952, 0.5588388, 1.740636, 1, 0, 0.7372549, 1,
1.231765, 0.5551101, 0.6424078, 1, 0, 0.7333333, 1,
1.236595, -0.6857359, 1.525191, 1, 0, 0.7254902, 1,
1.23679, 0.7016361, 2.477097, 1, 0, 0.7215686, 1,
1.238006, 1.469083, 0.5226359, 1, 0, 0.7137255, 1,
1.239873, -0.3767808, -0.4407725, 1, 0, 0.7098039, 1,
1.241517, -0.1696538, 0.428751, 1, 0, 0.7019608, 1,
1.241931, 1.483759, 1.143366, 1, 0, 0.6941177, 1,
1.253803, 0.6605589, 1.590702, 1, 0, 0.6901961, 1,
1.25818, 0.3134854, 0.929404, 1, 0, 0.682353, 1,
1.261647, 1.03983, 0.3340877, 1, 0, 0.6784314, 1,
1.275072, 1.815292, 0.8885895, 1, 0, 0.6705883, 1,
1.279266, 0.4414782, 1.220105, 1, 0, 0.6666667, 1,
1.285814, 0.4454957, 0.977716, 1, 0, 0.6588235, 1,
1.287132, -0.2373841, 1.638819, 1, 0, 0.654902, 1,
1.289479, -0.1623405, 1.330588, 1, 0, 0.6470588, 1,
1.296606, 1.373339, 0.6843532, 1, 0, 0.6431373, 1,
1.312974, -0.8065894, 2.86375, 1, 0, 0.6352941, 1,
1.323696, 4.130035, 1.159151, 1, 0, 0.6313726, 1,
1.325387, 1.043229, 1.124659, 1, 0, 0.6235294, 1,
1.32544, -0.6150228, 1.169434, 1, 0, 0.6196079, 1,
1.331052, -0.07173581, 2.278918, 1, 0, 0.6117647, 1,
1.331817, -0.06195044, 0.6337223, 1, 0, 0.6078432, 1,
1.341339, -0.6942694, 1.781546, 1, 0, 0.6, 1,
1.342792, -0.4403724, 1.104891, 1, 0, 0.5921569, 1,
1.343065, 0.3546113, 1.346448, 1, 0, 0.5882353, 1,
1.343071, 0.5694436, 0.5703189, 1, 0, 0.5803922, 1,
1.345149, -0.6637078, 1.977103, 1, 0, 0.5764706, 1,
1.358606, -1.154025, 2.060916, 1, 0, 0.5686275, 1,
1.36599, -0.967507, 1.218485, 1, 0, 0.5647059, 1,
1.367059, 0.4868611, 1.978892, 1, 0, 0.5568628, 1,
1.36785, -0.9249215, 0.6897405, 1, 0, 0.5529412, 1,
1.384788, 1.976023, 1.890925, 1, 0, 0.5450981, 1,
1.391773, 0.3632551, 1.060043, 1, 0, 0.5411765, 1,
1.399601, 0.2502988, 2.464203, 1, 0, 0.5333334, 1,
1.405207, 1.374493, -1.11514, 1, 0, 0.5294118, 1,
1.411227, -0.5674126, 1.723736, 1, 0, 0.5215687, 1,
1.422908, 0.3393472, -0.007846468, 1, 0, 0.5176471, 1,
1.427109, 0.3824764, 2.272912, 1, 0, 0.509804, 1,
1.430752, 1.024703, 0.4748127, 1, 0, 0.5058824, 1,
1.438968, 0.2556569, -0.7906939, 1, 0, 0.4980392, 1,
1.443352, -0.1183791, 0.87869, 1, 0, 0.4901961, 1,
1.453855, 0.1909441, 1.496686, 1, 0, 0.4862745, 1,
1.454835, 1.58667, -0.2122447, 1, 0, 0.4784314, 1,
1.454895, 0.79794, 0.7990818, 1, 0, 0.4745098, 1,
1.477116, 0.9521025, 2.416027, 1, 0, 0.4666667, 1,
1.481624, -1.938722, 2.848089, 1, 0, 0.4627451, 1,
1.485146, 0.4203665, 0.98629, 1, 0, 0.454902, 1,
1.489174, -0.6205772, 0.687513, 1, 0, 0.4509804, 1,
1.497925, 1.051928, 0.8582907, 1, 0, 0.4431373, 1,
1.520017, -0.2981404, 2.518917, 1, 0, 0.4392157, 1,
1.525963, 1.304258, 1.153681, 1, 0, 0.4313726, 1,
1.544312, -0.1970813, 3.262418, 1, 0, 0.427451, 1,
1.545104, 0.1669099, 3.900772, 1, 0, 0.4196078, 1,
1.555263, 0.2787666, 2.430707, 1, 0, 0.4156863, 1,
1.584934, 0.9024578, 1.844789, 1, 0, 0.4078431, 1,
1.592478, 1.116291, 1.607617, 1, 0, 0.4039216, 1,
1.594334, -0.4305517, 3.158156, 1, 0, 0.3960784, 1,
1.59482, -1.039133, 2.4782, 1, 0, 0.3882353, 1,
1.594874, -0.8819832, 1.224495, 1, 0, 0.3843137, 1,
1.626331, 0.43694, 3.302715, 1, 0, 0.3764706, 1,
1.629809, -0.1583849, 1.881793, 1, 0, 0.372549, 1,
1.656582, 0.4206837, 2.695275, 1, 0, 0.3647059, 1,
1.679634, -1.981857, 1.173226, 1, 0, 0.3607843, 1,
1.683042, 2.045327, 0.2351348, 1, 0, 0.3529412, 1,
1.685637, -0.40442, 0.6319229, 1, 0, 0.3490196, 1,
1.697469, -1.67727, 2.153981, 1, 0, 0.3411765, 1,
1.700396, 1.565604, 2.335557, 1, 0, 0.3372549, 1,
1.706614, 1.377036, 0.2391957, 1, 0, 0.3294118, 1,
1.707439, 0.8044496, -0.5941591, 1, 0, 0.3254902, 1,
1.720724, 0.6050704, 1.073858, 1, 0, 0.3176471, 1,
1.724931, 0.003473605, 2.55321, 1, 0, 0.3137255, 1,
1.735139, 0.7632087, 2.797903, 1, 0, 0.3058824, 1,
1.740635, 1.743348, 1.743295, 1, 0, 0.2980392, 1,
1.75265, 1.464975, -0.6518365, 1, 0, 0.2941177, 1,
1.753068, -0.6852356, 2.983514, 1, 0, 0.2862745, 1,
1.760664, 0.5219178, 1.455827, 1, 0, 0.282353, 1,
1.765504, -1.598383, 2.541153, 1, 0, 0.2745098, 1,
1.780832, -0.6848673, 2.724735, 1, 0, 0.2705882, 1,
1.787256, -0.1059159, 2.183865, 1, 0, 0.2627451, 1,
1.799318, 0.9735765, 1.780809, 1, 0, 0.2588235, 1,
1.817045, -0.4720837, 0.8804026, 1, 0, 0.2509804, 1,
1.878937, 1.326095, 0.944914, 1, 0, 0.2470588, 1,
1.889516, 0.09787556, 2.938704, 1, 0, 0.2392157, 1,
1.89817, -0.7902056, 0.5593902, 1, 0, 0.2352941, 1,
1.899621, 0.08707243, 1.156854, 1, 0, 0.227451, 1,
1.906451, 0.9784145, 1.453871, 1, 0, 0.2235294, 1,
1.9119, 0.03946556, 1.044606, 1, 0, 0.2156863, 1,
1.923181, 0.7665449, 0.1572122, 1, 0, 0.2117647, 1,
1.925877, -2.475718, 4.479317, 1, 0, 0.2039216, 1,
1.982856, -0.1464342, 2.340212, 1, 0, 0.1960784, 1,
1.990631, 1.59069, -0.152209, 1, 0, 0.1921569, 1,
1.991212, 0.1077515, 1.991392, 1, 0, 0.1843137, 1,
1.994095, 1.079513, -0.2229973, 1, 0, 0.1803922, 1,
2.008855, 1.430975, 0.1611205, 1, 0, 0.172549, 1,
2.048012, 0.1488895, -0.6082534, 1, 0, 0.1686275, 1,
2.049355, 0.4570452, 1.83883, 1, 0, 0.1607843, 1,
2.058608, 0.9283291, 1.313899, 1, 0, 0.1568628, 1,
2.062822, -1.691071, 2.742798, 1, 0, 0.1490196, 1,
2.066075, -0.3242862, -1.744288, 1, 0, 0.145098, 1,
2.103998, 0.1762509, 2.089242, 1, 0, 0.1372549, 1,
2.109591, -2.875702, 2.477004, 1, 0, 0.1333333, 1,
2.111099, 1.064091, 1.533371, 1, 0, 0.1254902, 1,
2.130325, 1.077027, 1.652728, 1, 0, 0.1215686, 1,
2.19621, -0.9361449, 3.391809, 1, 0, 0.1137255, 1,
2.198986, -0.4882507, 3.080018, 1, 0, 0.1098039, 1,
2.204145, 1.206383, 3.171547, 1, 0, 0.1019608, 1,
2.211019, 0.7377642, 1.607077, 1, 0, 0.09411765, 1,
2.222906, 2.099643, 0.5129377, 1, 0, 0.09019608, 1,
2.230684, 1.413038, 1.442215, 1, 0, 0.08235294, 1,
2.283012, 0.2114516, 1.395732, 1, 0, 0.07843138, 1,
2.348327, 0.6093395, 0.9447377, 1, 0, 0.07058824, 1,
2.348963, 0.522906, 2.810744, 1, 0, 0.06666667, 1,
2.360651, 0.48902, 2.356547, 1, 0, 0.05882353, 1,
2.379041, -0.5124348, 0.6176624, 1, 0, 0.05490196, 1,
2.43495, -0.5841258, 1.57326, 1, 0, 0.04705882, 1,
2.543256, -0.3614269, 0.8200761, 1, 0, 0.04313726, 1,
2.559811, 1.324323, -0.9193156, 1, 0, 0.03529412, 1,
2.571657, -1.288445, 1.392363, 1, 0, 0.03137255, 1,
2.58484, 0.2279801, -0.01761193, 1, 0, 0.02352941, 1,
2.65221, 0.314184, 2.226656, 1, 0, 0.01960784, 1,
2.756171, -1.642315, 0.9218515, 1, 0, 0.01176471, 1,
2.89297, -1.497875, 2.085793, 1, 0, 0.007843138, 1
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
-0.04993558, -4.063174, -6.689206, 0, -0.5, 0.5, 0.5,
-0.04993558, -4.063174, -6.689206, 1, -0.5, 0.5, 0.5,
-0.04993558, -4.063174, -6.689206, 1, 1.5, 0.5, 0.5,
-0.04993558, -4.063174, -6.689206, 0, 1.5, 0.5, 0.5
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
-3.990486, 0.6271669, -6.689206, 0, -0.5, 0.5, 0.5,
-3.990486, 0.6271669, -6.689206, 1, -0.5, 0.5, 0.5,
-3.990486, 0.6271669, -6.689206, 1, 1.5, 0.5, 0.5,
-3.990486, 0.6271669, -6.689206, 0, 1.5, 0.5, 0.5
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
-3.990486, -4.063174, 0.1964364, 0, -0.5, 0.5, 0.5,
-3.990486, -4.063174, 0.1964364, 1, -0.5, 0.5, 0.5,
-3.990486, -4.063174, 0.1964364, 1, 1.5, 0.5, 0.5,
-3.990486, -4.063174, 0.1964364, 0, 1.5, 0.5, 0.5
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
-2, -2.980788, -5.100211,
2, -2.980788, -5.100211,
-2, -2.980788, -5.100211,
-2, -3.161186, -5.365044,
-1, -2.980788, -5.100211,
-1, -3.161186, -5.365044,
0, -2.980788, -5.100211,
0, -3.161186, -5.365044,
1, -2.980788, -5.100211,
1, -3.161186, -5.365044,
2, -2.980788, -5.100211,
2, -3.161186, -5.365044
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
-2, -3.521981, -5.894709, 0, -0.5, 0.5, 0.5,
-2, -3.521981, -5.894709, 1, -0.5, 0.5, 0.5,
-2, -3.521981, -5.894709, 1, 1.5, 0.5, 0.5,
-2, -3.521981, -5.894709, 0, 1.5, 0.5, 0.5,
-1, -3.521981, -5.894709, 0, -0.5, 0.5, 0.5,
-1, -3.521981, -5.894709, 1, -0.5, 0.5, 0.5,
-1, -3.521981, -5.894709, 1, 1.5, 0.5, 0.5,
-1, -3.521981, -5.894709, 0, 1.5, 0.5, 0.5,
0, -3.521981, -5.894709, 0, -0.5, 0.5, 0.5,
0, -3.521981, -5.894709, 1, -0.5, 0.5, 0.5,
0, -3.521981, -5.894709, 1, 1.5, 0.5, 0.5,
0, -3.521981, -5.894709, 0, 1.5, 0.5, 0.5,
1, -3.521981, -5.894709, 0, -0.5, 0.5, 0.5,
1, -3.521981, -5.894709, 1, -0.5, 0.5, 0.5,
1, -3.521981, -5.894709, 1, 1.5, 0.5, 0.5,
1, -3.521981, -5.894709, 0, 1.5, 0.5, 0.5,
2, -3.521981, -5.894709, 0, -0.5, 0.5, 0.5,
2, -3.521981, -5.894709, 1, -0.5, 0.5, 0.5,
2, -3.521981, -5.894709, 1, 1.5, 0.5, 0.5,
2, -3.521981, -5.894709, 0, 1.5, 0.5, 0.5
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
-3.081128, -2, -5.100211,
-3.081128, 4, -5.100211,
-3.081128, -2, -5.100211,
-3.232688, -2, -5.365044,
-3.081128, 0, -5.100211,
-3.232688, 0, -5.365044,
-3.081128, 2, -5.100211,
-3.232688, 2, -5.365044,
-3.081128, 4, -5.100211,
-3.232688, 4, -5.365044
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
"0",
"2",
"4"
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
-3.535807, -2, -5.894709, 0, -0.5, 0.5, 0.5,
-3.535807, -2, -5.894709, 1, -0.5, 0.5, 0.5,
-3.535807, -2, -5.894709, 1, 1.5, 0.5, 0.5,
-3.535807, -2, -5.894709, 0, 1.5, 0.5, 0.5,
-3.535807, 0, -5.894709, 0, -0.5, 0.5, 0.5,
-3.535807, 0, -5.894709, 1, -0.5, 0.5, 0.5,
-3.535807, 0, -5.894709, 1, 1.5, 0.5, 0.5,
-3.535807, 0, -5.894709, 0, 1.5, 0.5, 0.5,
-3.535807, 2, -5.894709, 0, -0.5, 0.5, 0.5,
-3.535807, 2, -5.894709, 1, -0.5, 0.5, 0.5,
-3.535807, 2, -5.894709, 1, 1.5, 0.5, 0.5,
-3.535807, 2, -5.894709, 0, 1.5, 0.5, 0.5,
-3.535807, 4, -5.894709, 0, -0.5, 0.5, 0.5,
-3.535807, 4, -5.894709, 1, -0.5, 0.5, 0.5,
-3.535807, 4, -5.894709, 1, 1.5, 0.5, 0.5,
-3.535807, 4, -5.894709, 0, 1.5, 0.5, 0.5
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
-3.081128, -2.980788, -4,
-3.081128, -2.980788, 4,
-3.081128, -2.980788, -4,
-3.232688, -3.161186, -4,
-3.081128, -2.980788, -2,
-3.232688, -3.161186, -2,
-3.081128, -2.980788, 0,
-3.232688, -3.161186, 0,
-3.081128, -2.980788, 2,
-3.232688, -3.161186, 2,
-3.081128, -2.980788, 4,
-3.232688, -3.161186, 4
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
-3.535807, -3.521981, -4, 0, -0.5, 0.5, 0.5,
-3.535807, -3.521981, -4, 1, -0.5, 0.5, 0.5,
-3.535807, -3.521981, -4, 1, 1.5, 0.5, 0.5,
-3.535807, -3.521981, -4, 0, 1.5, 0.5, 0.5,
-3.535807, -3.521981, -2, 0, -0.5, 0.5, 0.5,
-3.535807, -3.521981, -2, 1, -0.5, 0.5, 0.5,
-3.535807, -3.521981, -2, 1, 1.5, 0.5, 0.5,
-3.535807, -3.521981, -2, 0, 1.5, 0.5, 0.5,
-3.535807, -3.521981, 0, 0, -0.5, 0.5, 0.5,
-3.535807, -3.521981, 0, 1, -0.5, 0.5, 0.5,
-3.535807, -3.521981, 0, 1, 1.5, 0.5, 0.5,
-3.535807, -3.521981, 0, 0, 1.5, 0.5, 0.5,
-3.535807, -3.521981, 2, 0, -0.5, 0.5, 0.5,
-3.535807, -3.521981, 2, 1, -0.5, 0.5, 0.5,
-3.535807, -3.521981, 2, 1, 1.5, 0.5, 0.5,
-3.535807, -3.521981, 2, 0, 1.5, 0.5, 0.5,
-3.535807, -3.521981, 4, 0, -0.5, 0.5, 0.5,
-3.535807, -3.521981, 4, 1, -0.5, 0.5, 0.5,
-3.535807, -3.521981, 4, 1, 1.5, 0.5, 0.5,
-3.535807, -3.521981, 4, 0, 1.5, 0.5, 0.5
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
-3.081128, -2.980788, -5.100211,
-3.081128, 4.235121, -5.100211,
-3.081128, -2.980788, 5.493084,
-3.081128, 4.235121, 5.493084,
-3.081128, -2.980788, -5.100211,
-3.081128, -2.980788, 5.493084,
-3.081128, 4.235121, -5.100211,
-3.081128, 4.235121, 5.493084,
-3.081128, -2.980788, -5.100211,
2.981257, -2.980788, -5.100211,
-3.081128, -2.980788, 5.493084,
2.981257, -2.980788, 5.493084,
-3.081128, 4.235121, -5.100211,
2.981257, 4.235121, -5.100211,
-3.081128, 4.235121, 5.493084,
2.981257, 4.235121, 5.493084,
2.981257, -2.980788, -5.100211,
2.981257, 4.235121, -5.100211,
2.981257, -2.980788, 5.493084,
2.981257, 4.235121, 5.493084,
2.981257, -2.980788, -5.100211,
2.981257, -2.980788, 5.493084,
2.981257, 4.235121, -5.100211,
2.981257, 4.235121, 5.493084
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
var radius = 7.57123;
var distance = 33.68526;
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
mvMatrix.translate( 0.04993558, -0.6271669, -0.1964364 );
mvMatrix.scale( 1.35032, 1.13446, 0.7727683 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.68526);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
copper_carbonate<-read.table("copper_carbonate.xyz")
```

```
## Error in read.table("copper_carbonate.xyz"): no lines available in input
```

```r
x<-copper_carbonate$V2
```

```
## Error in eval(expr, envir, enclos): object 'copper_carbonate' not found
```

```r
y<-copper_carbonate$V3
```

```
## Error in eval(expr, envir, enclos): object 'copper_carbonate' not found
```

```r
z<-copper_carbonate$V4
```

```
## Error in eval(expr, envir, enclos): object 'copper_carbonate' not found
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
-2.992841, 1.275241, -1.294126, 0, 0, 1, 1, 1,
-2.929959, 1.351285, -1.330514, 1, 0, 0, 1, 1,
-2.844296, 0.6019475, -0.9680666, 1, 0, 0, 1, 1,
-2.516647, 0.7140254, -1.289036, 1, 0, 0, 1, 1,
-2.471722, 0.4253182, 0.2008925, 1, 0, 0, 1, 1,
-2.331928, 0.8076089, -2.804292, 1, 0, 0, 1, 1,
-2.280375, -0.3721934, -0.3735154, 0, 0, 0, 1, 1,
-2.262087, -0.609361, -1.882197, 0, 0, 0, 1, 1,
-2.244334, -1.450639, -3.602356, 0, 0, 0, 1, 1,
-2.134304, 0.5964781, -0.2733762, 0, 0, 0, 1, 1,
-2.085303, 0.1118791, 0.7095687, 0, 0, 0, 1, 1,
-2.078378, 0.2097095, -2.94591, 0, 0, 0, 1, 1,
-2.02529, 1.026773, -1.008747, 0, 0, 0, 1, 1,
-2.011285, 0.1789485, -0.9477611, 1, 1, 1, 1, 1,
-1.981001, -1.275206, -1.545969, 1, 1, 1, 1, 1,
-1.977326, -1.003167, -2.224764, 1, 1, 1, 1, 1,
-1.97555, 0.0542494, -0.9164364, 1, 1, 1, 1, 1,
-1.96385, -0.7091298, -1.67277, 1, 1, 1, 1, 1,
-1.962596, -1.243152, -2.302153, 1, 1, 1, 1, 1,
-1.958756, 0.4021774, -0.5826257, 1, 1, 1, 1, 1,
-1.930583, 0.5842877, -0.7736081, 1, 1, 1, 1, 1,
-1.886114, -0.05709374, -2.055049, 1, 1, 1, 1, 1,
-1.884117, -0.2044208, -1.839156, 1, 1, 1, 1, 1,
-1.879544, 0.1118262, -1.498051, 1, 1, 1, 1, 1,
-1.846437, 0.7709414, -1.569204, 1, 1, 1, 1, 1,
-1.845584, -0.3527374, -2.643112, 1, 1, 1, 1, 1,
-1.829204, -0.01701455, -2.737065, 1, 1, 1, 1, 1,
-1.797273, 0.4085001, -1.273146, 1, 1, 1, 1, 1,
-1.79259, 1.084925, -0.9671333, 0, 0, 1, 1, 1,
-1.786686, -0.1082363, -2.738395, 1, 0, 0, 1, 1,
-1.782588, -1.671782, -4.665441, 1, 0, 0, 1, 1,
-1.774462, 0.4675559, -0.8809887, 1, 0, 0, 1, 1,
-1.755133, -0.3425372, -1.420321, 1, 0, 0, 1, 1,
-1.748885, 0.4870751, -0.5248621, 1, 0, 0, 1, 1,
-1.736124, -1.861969, -3.180863, 0, 0, 0, 1, 1,
-1.727235, -1.398365, -1.991866, 0, 0, 0, 1, 1,
-1.720271, -0.6938666, 0.3416297, 0, 0, 0, 1, 1,
-1.697685, -0.3477228, -1.992427, 0, 0, 0, 1, 1,
-1.65725, -0.1204958, -0.5118905, 0, 0, 0, 1, 1,
-1.653663, 1.212222, -1.229431, 0, 0, 0, 1, 1,
-1.636388, 1.152956, -2.589713, 0, 0, 0, 1, 1,
-1.634179, 1.778585, -0.3687111, 1, 1, 1, 1, 1,
-1.59824, 0.25743, -1.345209, 1, 1, 1, 1, 1,
-1.588803, 1.437932, 0.4466248, 1, 1, 1, 1, 1,
-1.583176, -0.03391499, -2.298999, 1, 1, 1, 1, 1,
-1.581254, -0.3043287, -1.22052, 1, 1, 1, 1, 1,
-1.567708, 1.439702, -2.894359, 1, 1, 1, 1, 1,
-1.558791, -1.022838, -2.28605, 1, 1, 1, 1, 1,
-1.520267, 2.653321, 1.19878, 1, 1, 1, 1, 1,
-1.514888, -0.1409132, -0.7598726, 1, 1, 1, 1, 1,
-1.511691, 1.237305, 0.5689366, 1, 1, 1, 1, 1,
-1.509919, -1.323033, -0.5621451, 1, 1, 1, 1, 1,
-1.502491, -0.7972237, -1.732477, 1, 1, 1, 1, 1,
-1.500683, 0.7300755, -0.1094053, 1, 1, 1, 1, 1,
-1.490903, 0.4090906, -0.5963268, 1, 1, 1, 1, 1,
-1.487563, 0.8043665, -0.7063125, 1, 1, 1, 1, 1,
-1.484192, 0.4901263, -0.321301, 0, 0, 1, 1, 1,
-1.480425, 0.001847949, -1.486612, 1, 0, 0, 1, 1,
-1.472297, -0.3197489, -1.876186, 1, 0, 0, 1, 1,
-1.464876, 1.381304, -0.9274601, 1, 0, 0, 1, 1,
-1.453895, -0.4954821, -1.992874, 1, 0, 0, 1, 1,
-1.447749, 1.460811, -0.2733643, 1, 0, 0, 1, 1,
-1.442705, -0.337931, -2.085929, 0, 0, 0, 1, 1,
-1.442394, 0.7737248, -1.357844, 0, 0, 0, 1, 1,
-1.441406, 0.6184703, -1.131379, 0, 0, 0, 1, 1,
-1.433618, -1.143008, -1.005959, 0, 0, 0, 1, 1,
-1.430984, -0.8882596, -3.813279, 0, 0, 0, 1, 1,
-1.430498, -0.9605209, -2.018652, 0, 0, 0, 1, 1,
-1.42712, -0.9186432, -3.992363, 0, 0, 0, 1, 1,
-1.420647, -1.218045, -2.334293, 1, 1, 1, 1, 1,
-1.383367, -0.1114141, -2.539195, 1, 1, 1, 1, 1,
-1.373554, 0.7738891, -1.763686, 1, 1, 1, 1, 1,
-1.361198, 0.3459456, -1.065158, 1, 1, 1, 1, 1,
-1.345902, -0.2261576, -1.414396, 1, 1, 1, 1, 1,
-1.34115, 0.8592421, -1.812996, 1, 1, 1, 1, 1,
-1.338954, -0.5906237, -2.719314, 1, 1, 1, 1, 1,
-1.336395, -0.233137, -2.614631, 1, 1, 1, 1, 1,
-1.328062, 0.3251391, -3.035957, 1, 1, 1, 1, 1,
-1.313031, 0.1558579, -2.351759, 1, 1, 1, 1, 1,
-1.304153, -0.2820422, -2.034648, 1, 1, 1, 1, 1,
-1.301498, 0.597165, 0.3724192, 1, 1, 1, 1, 1,
-1.298713, -0.2948736, -3.397756, 1, 1, 1, 1, 1,
-1.29295, -1.206204, -4.161195, 1, 1, 1, 1, 1,
-1.289567, 0.7336999, -2.152556, 1, 1, 1, 1, 1,
-1.284273, 0.4824407, -0.07366084, 0, 0, 1, 1, 1,
-1.280593, -0.451409, -3.380567, 1, 0, 0, 1, 1,
-1.280014, -1.727748, -3.589397, 1, 0, 0, 1, 1,
-1.273483, 0.1876635, -0.2264459, 1, 0, 0, 1, 1,
-1.266201, 0.3429065, -2.507122, 1, 0, 0, 1, 1,
-1.263806, 0.6068621, -0.5753172, 1, 0, 0, 1, 1,
-1.252782, -0.1750623, 0.05435167, 0, 0, 0, 1, 1,
-1.248652, 1.03144, -2.020838, 0, 0, 0, 1, 1,
-1.247102, -0.08908286, -1.122376, 0, 0, 0, 1, 1,
-1.245546, -0.9481431, -1.492706, 0, 0, 0, 1, 1,
-1.234459, 0.007188164, -2.404916, 0, 0, 0, 1, 1,
-1.210792, 1.083891, 0.02330605, 0, 0, 0, 1, 1,
-1.209953, 1.069889, -0.8200883, 0, 0, 0, 1, 1,
-1.203228, -0.5003998, -2.662928, 1, 1, 1, 1, 1,
-1.20296, -0.09557538, -0.640985, 1, 1, 1, 1, 1,
-1.20247, -0.2606008, -1.375089, 1, 1, 1, 1, 1,
-1.200321, 0.6676087, -0.8569875, 1, 1, 1, 1, 1,
-1.199659, -0.7893547, -1.508374, 1, 1, 1, 1, 1,
-1.199606, 0.8729915, -0.9537777, 1, 1, 1, 1, 1,
-1.192965, -0.922834, 0.5102632, 1, 1, 1, 1, 1,
-1.180719, 1.002212, -0.5905473, 1, 1, 1, 1, 1,
-1.180035, -0.3055275, -2.608597, 1, 1, 1, 1, 1,
-1.179869, 0.6410416, -1.23476, 1, 1, 1, 1, 1,
-1.175821, 0.5906159, -1.705564, 1, 1, 1, 1, 1,
-1.171167, -0.7276093, -2.092214, 1, 1, 1, 1, 1,
-1.170858, -0.7325558, -1.745038, 1, 1, 1, 1, 1,
-1.167416, -0.8956909, -4.461101, 1, 1, 1, 1, 1,
-1.15849, 1.814545, 0.1156065, 1, 1, 1, 1, 1,
-1.157726, -0.6241567, -2.497621, 0, 0, 1, 1, 1,
-1.140327, -1.265299, -3.262938, 1, 0, 0, 1, 1,
-1.133536, 1.134311, -1.008979, 1, 0, 0, 1, 1,
-1.12749, -0.8000954, -2.151484, 1, 0, 0, 1, 1,
-1.119632, 2.054503, -0.05865276, 1, 0, 0, 1, 1,
-1.117081, 0.2632777, -0.788099, 1, 0, 0, 1, 1,
-1.116369, 2.282031, -0.6329116, 0, 0, 0, 1, 1,
-1.111243, 1.723152, -0.7418855, 0, 0, 0, 1, 1,
-1.104598, 1.092023, -1.964686, 0, 0, 0, 1, 1,
-1.094083, -1.253963, -3.512358, 0, 0, 0, 1, 1,
-1.093789, 0.301385, -2.187499, 0, 0, 0, 1, 1,
-1.092195, 1.657742, -1.780261, 0, 0, 0, 1, 1,
-1.084371, 0.7482807, -0.6356896, 0, 0, 0, 1, 1,
-1.080831, -0.2648811, -1.659555, 1, 1, 1, 1, 1,
-1.072564, -1.140932, -2.081249, 1, 1, 1, 1, 1,
-1.065482, -1.760264, -3.707522, 1, 1, 1, 1, 1,
-1.065166, 0.6909429, -0.7429059, 1, 1, 1, 1, 1,
-1.062677, 0.612442, -0.9359697, 1, 1, 1, 1, 1,
-1.062219, -0.9055706, -2.099916, 1, 1, 1, 1, 1,
-1.057886, -0.622146, -1.827573, 1, 1, 1, 1, 1,
-1.057879, -2.336156, -3.937396, 1, 1, 1, 1, 1,
-1.042789, 0.5080528, -1.299984, 1, 1, 1, 1, 1,
-1.038952, -1.109421, -2.889897, 1, 1, 1, 1, 1,
-1.037435, 0.8424466, -1.237676, 1, 1, 1, 1, 1,
-1.037374, -1.065696, -1.663733, 1, 1, 1, 1, 1,
-1.02389, 2.073305, -1.71911, 1, 1, 1, 1, 1,
-1.021217, -0.531994, -3.281128, 1, 1, 1, 1, 1,
-1.00807, 2.070292, -0.08325534, 1, 1, 1, 1, 1,
-1.006468, 0.03825323, -0.8244468, 0, 0, 1, 1, 1,
-1.003919, -0.03199147, -0.8620786, 1, 0, 0, 1, 1,
-1.00243, -0.40804, -1.199492, 1, 0, 0, 1, 1,
-0.9989712, -0.1385418, -1.904121, 1, 0, 0, 1, 1,
-0.992933, -0.4817868, -1.14377, 1, 0, 0, 1, 1,
-0.9893541, -0.1186206, -1.923088, 1, 0, 0, 1, 1,
-0.9826288, -1.495247, -3.121681, 0, 0, 0, 1, 1,
-0.98195, 0.6710255, -0.8172532, 0, 0, 0, 1, 1,
-0.9776872, 0.8000057, -0.8146963, 0, 0, 0, 1, 1,
-0.9650307, -0.4336239, -2.678224, 0, 0, 0, 1, 1,
-0.9645794, 1.121784, -0.7803994, 0, 0, 0, 1, 1,
-0.9630213, -1.684965, -1.492099, 0, 0, 0, 1, 1,
-0.9597666, -0.8297004, -3.476858, 0, 0, 0, 1, 1,
-0.9554871, 0.122661, -2.61724, 1, 1, 1, 1, 1,
-0.9527236, 0.0197085, -2.018843, 1, 1, 1, 1, 1,
-0.9521649, 0.5262055, -0.7336665, 1, 1, 1, 1, 1,
-0.9518108, 0.5368668, -0.8703251, 1, 1, 1, 1, 1,
-0.9464127, -0.2478116, -2.649995, 1, 1, 1, 1, 1,
-0.9429795, -1.162133, -2.383639, 1, 1, 1, 1, 1,
-0.9401152, -2.555417, -3.648083, 1, 1, 1, 1, 1,
-0.9339371, -1.325182, -2.388858, 1, 1, 1, 1, 1,
-0.9304629, -0.5402051, -3.448901, 1, 1, 1, 1, 1,
-0.9261848, -0.3090122, -2.126976, 1, 1, 1, 1, 1,
-0.9224952, -0.3308465, -2.727696, 1, 1, 1, 1, 1,
-0.9188589, -0.4832314, -1.656385, 1, 1, 1, 1, 1,
-0.9140447, -0.8052236, -1.676848, 1, 1, 1, 1, 1,
-0.9074998, -1.020588, -1.908382, 1, 1, 1, 1, 1,
-0.9019837, -0.1968996, -0.9680389, 1, 1, 1, 1, 1,
-0.8948412, 0.5749659, -1.881237, 0, 0, 1, 1, 1,
-0.8838773, 0.7986834, -0.5056291, 1, 0, 0, 1, 1,
-0.8836312, 0.2271903, -2.020474, 1, 0, 0, 1, 1,
-0.8819376, -0.1480979, -1.572102, 1, 0, 0, 1, 1,
-0.8794246, -0.5770669, -2.101358, 1, 0, 0, 1, 1,
-0.8771865, -1.177546, -2.596924, 1, 0, 0, 1, 1,
-0.8756935, -0.8595008, -3.826213, 0, 0, 0, 1, 1,
-0.8746198, -0.9159744, -1.893982, 0, 0, 0, 1, 1,
-0.8741779, 1.433594, -1.786573, 0, 0, 0, 1, 1,
-0.8715793, -0.5538617, -2.850552, 0, 0, 0, 1, 1,
-0.8712719, -0.6273097, -1.62146, 0, 0, 0, 1, 1,
-0.8695517, -0.9918928, -2.457546, 0, 0, 0, 1, 1,
-0.8605442, 2.162438, -1.303254, 0, 0, 0, 1, 1,
-0.8578257, -0.3777656, -1.329622, 1, 1, 1, 1, 1,
-0.8535972, -1.630437, -2.54773, 1, 1, 1, 1, 1,
-0.8529502, 0.5628197, 0.02321886, 1, 1, 1, 1, 1,
-0.8492423, 1.886335, -0.9571522, 1, 1, 1, 1, 1,
-0.8467453, -1.349508, -1.691319, 1, 1, 1, 1, 1,
-0.8460823, -0.8922051, -2.119838, 1, 1, 1, 1, 1,
-0.8446644, -0.620425, -2.220469, 1, 1, 1, 1, 1,
-0.839757, 1.326703, -0.4103295, 1, 1, 1, 1, 1,
-0.8371835, -0.1128136, -0.6142341, 1, 1, 1, 1, 1,
-0.8347044, 1.051777, -0.8937439, 1, 1, 1, 1, 1,
-0.8300083, -0.9556219, -3.322898, 1, 1, 1, 1, 1,
-0.8251776, 0.639107, 0.767445, 1, 1, 1, 1, 1,
-0.823094, -0.6154603, -1.572952, 1, 1, 1, 1, 1,
-0.8149492, -0.3965563, -2.971959, 1, 1, 1, 1, 1,
-0.8142399, -0.1569931, -1.900967, 1, 1, 1, 1, 1,
-0.8113424, -0.9973582, -2.572266, 0, 0, 1, 1, 1,
-0.8083035, 0.5491382, -1.216917, 1, 0, 0, 1, 1,
-0.8073722, 0.03751587, -2.995391, 1, 0, 0, 1, 1,
-0.8036168, 1.617154, -0.530821, 1, 0, 0, 1, 1,
-0.8028575, 0.1559929, -2.639971, 1, 0, 0, 1, 1,
-0.7958609, 1.299448, 0.2891961, 1, 0, 0, 1, 1,
-0.7952758, 1.243969, -2.587898, 0, 0, 0, 1, 1,
-0.7931176, 0.418899, -1.16551, 0, 0, 0, 1, 1,
-0.7871805, -0.8836788, -3.765876, 0, 0, 0, 1, 1,
-0.7852073, 0.6653596, -1.237378, 0, 0, 0, 1, 1,
-0.7807162, 1.334681, 1.483847, 0, 0, 0, 1, 1,
-0.7763544, 0.8089185, -1.310358, 0, 0, 0, 1, 1,
-0.7720032, -0.8948849, -2.393852, 0, 0, 0, 1, 1,
-0.7707602, -0.01995422, -3.719672, 1, 1, 1, 1, 1,
-0.7685646, -1.11502, -2.359782, 1, 1, 1, 1, 1,
-0.7682728, -0.9065884, -1.325666, 1, 1, 1, 1, 1,
-0.7626607, -0.4646344, -0.8297032, 1, 1, 1, 1, 1,
-0.760474, 0.6215644, 0.4698654, 1, 1, 1, 1, 1,
-0.7598922, 0.2603539, -2.708664, 1, 1, 1, 1, 1,
-0.7557721, -0.8383461, -0.444591, 1, 1, 1, 1, 1,
-0.7504004, -0.3177381, -2.566427, 1, 1, 1, 1, 1,
-0.7453597, -0.3878907, -2.526044, 1, 1, 1, 1, 1,
-0.7358838, -0.8653172, -1.002627, 1, 1, 1, 1, 1,
-0.7345089, 0.9078607, -0.7593027, 1, 1, 1, 1, 1,
-0.7294379, 0.1344987, 0.3669852, 1, 1, 1, 1, 1,
-0.7240001, -1.337438, -1.9101, 1, 1, 1, 1, 1,
-0.7233666, 0.09207301, -0.5634523, 1, 1, 1, 1, 1,
-0.7233399, -0.7411655, -1.647092, 1, 1, 1, 1, 1,
-0.7215609, -0.7085099, -2.717373, 0, 0, 1, 1, 1,
-0.7153689, -1.804928, -1.128555, 1, 0, 0, 1, 1,
-0.7147435, 0.4598894, -1.698149, 1, 0, 0, 1, 1,
-0.7132286, -0.9582418, -2.513413, 1, 0, 0, 1, 1,
-0.7122009, 0.3879355, -1.0497, 1, 0, 0, 1, 1,
-0.7062976, 2.791873, 0.2671455, 1, 0, 0, 1, 1,
-0.7034363, 0.167013, -1.048394, 0, 0, 0, 1, 1,
-0.695242, 0.3170385, 0.3337871, 0, 0, 0, 1, 1,
-0.6948197, -0.8692793, -2.695543, 0, 0, 0, 1, 1,
-0.6945791, -1.10093, -2.107834, 0, 0, 0, 1, 1,
-0.6938899, -0.7219632, -0.9479815, 0, 0, 0, 1, 1,
-0.6937635, 0.6000151, 1.027678, 0, 0, 0, 1, 1,
-0.6870897, 1.621797, -0.06009103, 0, 0, 0, 1, 1,
-0.6843004, -1.801051, -4.257696, 1, 1, 1, 1, 1,
-0.6823246, 1.173502, -0.7489927, 1, 1, 1, 1, 1,
-0.6823103, 1.491609, 0.7614877, 1, 1, 1, 1, 1,
-0.6745856, -0.5108959, -1.873514, 1, 1, 1, 1, 1,
-0.6703831, 1.419887, 0.6620531, 1, 1, 1, 1, 1,
-0.6643444, 1.323448, 0.2707468, 1, 1, 1, 1, 1,
-0.6599147, 0.3118834, -1.251812, 1, 1, 1, 1, 1,
-0.6551687, -0.7137519, -3.12165, 1, 1, 1, 1, 1,
-0.6523956, 0.02156943, -0.9954415, 1, 1, 1, 1, 1,
-0.6485095, -0.04274926, -2.151742, 1, 1, 1, 1, 1,
-0.6442403, 0.04157619, -1.416316, 1, 1, 1, 1, 1,
-0.6439604, -1.216623, -3.502582, 1, 1, 1, 1, 1,
-0.6425302, -1.162869, -3.293422, 1, 1, 1, 1, 1,
-0.637995, -0.3371021, -2.04778, 1, 1, 1, 1, 1,
-0.6370418, -2.530348, -3.698121, 1, 1, 1, 1, 1,
-0.6266635, -0.1263541, -3.036347, 0, 0, 1, 1, 1,
-0.6250096, 2.303468, -0.3967709, 1, 0, 0, 1, 1,
-0.6242958, 1.089074, -1.913536, 1, 0, 0, 1, 1,
-0.6238727, -0.5774573, -2.191176, 1, 0, 0, 1, 1,
-0.6222296, 1.140639, -0.1213699, 1, 0, 0, 1, 1,
-0.618587, 0.03922099, -2.15731, 1, 0, 0, 1, 1,
-0.6153628, -0.9158022, -2.88137, 0, 0, 0, 1, 1,
-0.6131091, 1.744145, -1.182699, 0, 0, 0, 1, 1,
-0.611618, 0.9473175, -0.3742488, 0, 0, 0, 1, 1,
-0.610828, 0.5029907, -0.4716575, 0, 0, 0, 1, 1,
-0.6106901, 0.647053, -0.4670196, 0, 0, 0, 1, 1,
-0.607107, 1.700531, -0.4263371, 0, 0, 0, 1, 1,
-0.5940158, -0.4282337, -2.173563, 0, 0, 0, 1, 1,
-0.5873362, -0.8549978, -0.4781939, 1, 1, 1, 1, 1,
-0.5857863, -1.185778, -2.265437, 1, 1, 1, 1, 1,
-0.5825745, -0.3187727, -3.518452, 1, 1, 1, 1, 1,
-0.5805938, -0.2039883, -1.513912, 1, 1, 1, 1, 1,
-0.580551, 0.6629236, -0.5937449, 1, 1, 1, 1, 1,
-0.5783038, 0.3902126, -2.142347, 1, 1, 1, 1, 1,
-0.5748855, 1.077884, -0.1467959, 1, 1, 1, 1, 1,
-0.5713595, -0.8964275, -2.413459, 1, 1, 1, 1, 1,
-0.5684242, 1.572291, -0.6210436, 1, 1, 1, 1, 1,
-0.556397, -0.1316104, -2.582758, 1, 1, 1, 1, 1,
-0.5536253, -0.1511468, -0.6007538, 1, 1, 1, 1, 1,
-0.5528433, -0.7440911, -3.21061, 1, 1, 1, 1, 1,
-0.5507525, 1.360194, -1.481105, 1, 1, 1, 1, 1,
-0.537985, -0.2589141, -3.297086, 1, 1, 1, 1, 1,
-0.5377985, 0.2056495, -1.170239, 1, 1, 1, 1, 1,
-0.5339604, 1.221107, -0.1972986, 0, 0, 1, 1, 1,
-0.5329494, 0.167014, -0.5508394, 1, 0, 0, 1, 1,
-0.5194097, 0.1899618, -1.421091, 1, 0, 0, 1, 1,
-0.5181293, 1.36773, -0.5490494, 1, 0, 0, 1, 1,
-0.5169704, -0.1392897, -2.353593, 1, 0, 0, 1, 1,
-0.5169449, -0.2967537, -2.894225, 1, 0, 0, 1, 1,
-0.5164801, -0.03440912, 0.221192, 0, 0, 0, 1, 1,
-0.5164413, -1.228896, -2.344464, 0, 0, 0, 1, 1,
-0.5163894, 0.887247, -0.1075236, 0, 0, 0, 1, 1,
-0.5135761, 0.7623392, 0.4504042, 0, 0, 0, 1, 1,
-0.5076878, -0.1019688, -1.473421, 0, 0, 0, 1, 1,
-0.5059741, 0.2451963, -0.7084901, 0, 0, 0, 1, 1,
-0.4997068, 1.669865, -0.1776467, 0, 0, 0, 1, 1,
-0.4993201, -0.1364821, -3.797773, 1, 1, 1, 1, 1,
-0.4980017, 2.730407, 1.740751, 1, 1, 1, 1, 1,
-0.4964903, 1.375465, -2.129853, 1, 1, 1, 1, 1,
-0.4958004, 1.828346, -1.627765, 1, 1, 1, 1, 1,
-0.4953939, 0.04101916, -1.60032, 1, 1, 1, 1, 1,
-0.4864346, -0.3323921, -1.973811, 1, 1, 1, 1, 1,
-0.4828553, 1.777905, 0.6297466, 1, 1, 1, 1, 1,
-0.4808525, -0.01634875, -1.906145, 1, 1, 1, 1, 1,
-0.4747539, 0.04947234, -0.5981835, 1, 1, 1, 1, 1,
-0.4730099, -1.148789, -3.048451, 1, 1, 1, 1, 1,
-0.4711907, -0.4345974, -1.848831, 1, 1, 1, 1, 1,
-0.4701183, 0.2482289, 0.3991204, 1, 1, 1, 1, 1,
-0.4670605, 0.03343663, -2.119399, 1, 1, 1, 1, 1,
-0.4603961, -1.674422, -1.425253, 1, 1, 1, 1, 1,
-0.4597293, -0.8145734, -3.166353, 1, 1, 1, 1, 1,
-0.4552529, 1.209302, 0.2759423, 0, 0, 1, 1, 1,
-0.4480889, 1.300007, -1.540927, 1, 0, 0, 1, 1,
-0.4478734, -0.3710241, -4.003368, 1, 0, 0, 1, 1,
-0.4469395, 0.0125569, -1.219496, 1, 0, 0, 1, 1,
-0.4440265, 0.3531175, -0.3492709, 1, 0, 0, 1, 1,
-0.4397841, 0.602774, 0.8560144, 1, 0, 0, 1, 1,
-0.4377684, -0.4986744, -2.337893, 0, 0, 0, 1, 1,
-0.431082, 0.7118818, -1.791187, 0, 0, 0, 1, 1,
-0.4272985, -0.1258613, -2.068808, 0, 0, 0, 1, 1,
-0.4229515, -2.493362, -2.809357, 0, 0, 0, 1, 1,
-0.4216425, 0.2739914, -0.0783762, 0, 0, 0, 1, 1,
-0.4214482, 0.465037, -0.2190809, 0, 0, 0, 1, 1,
-0.4180572, 0.5313012, -0.2455198, 0, 0, 0, 1, 1,
-0.4142522, 0.2861571, -1.434835, 1, 1, 1, 1, 1,
-0.4123497, 0.5663726, -0.3682845, 1, 1, 1, 1, 1,
-0.4104242, 0.08577087, -2.784679, 1, 1, 1, 1, 1,
-0.4091332, -2.496259, -3.379603, 1, 1, 1, 1, 1,
-0.4085761, 1.758418, -0.1884226, 1, 1, 1, 1, 1,
-0.4082249, -0.272987, -1.298006, 1, 1, 1, 1, 1,
-0.4068168, 1.121026, -0.607243, 1, 1, 1, 1, 1,
-0.4052497, 1.375233, -1.631961, 1, 1, 1, 1, 1,
-0.4026601, 0.7396137, -0.6182272, 1, 1, 1, 1, 1,
-0.4010772, -1.743317, -3.486007, 1, 1, 1, 1, 1,
-0.3972395, -0.48702, -2.539805, 1, 1, 1, 1, 1,
-0.3960245, 0.1027067, -1.490479, 1, 1, 1, 1, 1,
-0.3870068, -0.09262703, -2.093565, 1, 1, 1, 1, 1,
-0.3864987, 0.8636531, -1.504545, 1, 1, 1, 1, 1,
-0.3855752, 0.3710161, -0.6183487, 1, 1, 1, 1, 1,
-0.3841844, 0.550204, -1.260752, 0, 0, 1, 1, 1,
-0.3824056, -1.798069, -3.2941, 1, 0, 0, 1, 1,
-0.381869, -0.09279785, -3.038946, 1, 0, 0, 1, 1,
-0.3795913, 1.303618, 0.6793721, 1, 0, 0, 1, 1,
-0.3776695, -2.102998, -3.471491, 1, 0, 0, 1, 1,
-0.3748963, -0.3726032, -1.259278, 1, 0, 0, 1, 1,
-0.3693416, -0.3099665, -2.379615, 0, 0, 0, 1, 1,
-0.359139, -0.3822196, -3.987895, 0, 0, 0, 1, 1,
-0.3556795, 1.553686, 1.072359, 0, 0, 0, 1, 1,
-0.3444191, -0.4380064, -2.586627, 0, 0, 0, 1, 1,
-0.3441603, -0.7298716, -3.451855, 0, 0, 0, 1, 1,
-0.3435637, 1.16521, -1.263942, 0, 0, 0, 1, 1,
-0.3422009, 0.1654373, -0.5753988, 0, 0, 0, 1, 1,
-0.3404459, 0.3195938, -1.138024, 1, 1, 1, 1, 1,
-0.3398436, -1.143472, -2.790611, 1, 1, 1, 1, 1,
-0.337859, 0.5266915, 0.4137225, 1, 1, 1, 1, 1,
-0.3373165, 0.1862733, -0.0761661, 1, 1, 1, 1, 1,
-0.3280264, -0.3792277, -1.951068, 1, 1, 1, 1, 1,
-0.3265689, -0.32844, -4.428882, 1, 1, 1, 1, 1,
-0.3261476, 0.2375132, -0.8564292, 1, 1, 1, 1, 1,
-0.3260356, -0.3828958, -2.434631, 1, 1, 1, 1, 1,
-0.3181672, 1.976215, 0.5514362, 1, 1, 1, 1, 1,
-0.3181537, 1.408412, 0.3500162, 1, 1, 1, 1, 1,
-0.3132559, 1.58237, -1.913315, 1, 1, 1, 1, 1,
-0.3064191, -0.3479011, -1.067687, 1, 1, 1, 1, 1,
-0.2969369, 1.09008, -0.9642665, 1, 1, 1, 1, 1,
-0.2958626, -1.052004, -2.858845, 1, 1, 1, 1, 1,
-0.290159, 1.192224, -1.398137, 1, 1, 1, 1, 1,
-0.2844156, 0.4094146, -0.4074529, 0, 0, 1, 1, 1,
-0.2833295, 0.1782637, -1.072224, 1, 0, 0, 1, 1,
-0.2820045, 0.489889, -0.3682238, 1, 0, 0, 1, 1,
-0.2787352, 0.2477899, -1.911662, 1, 0, 0, 1, 1,
-0.2733054, -0.2574755, -0.1796891, 1, 0, 0, 1, 1,
-0.272429, -0.1675611, -2.228998, 1, 0, 0, 1, 1,
-0.2696979, -0.9970305, -2.19435, 0, 0, 0, 1, 1,
-0.2664573, -1.335876, -2.223036, 0, 0, 0, 1, 1,
-0.2662045, 1.56402, -0.305693, 0, 0, 0, 1, 1,
-0.266159, 0.04899558, -0.7154869, 0, 0, 0, 1, 1,
-0.2659684, 1.56928, -0.1347591, 0, 0, 0, 1, 1,
-0.260013, -0.6910678, -2.557405, 0, 0, 0, 1, 1,
-0.257695, -0.9882564, -2.829042, 0, 0, 0, 1, 1,
-0.2557868, -1.376042, -4.929159, 1, 1, 1, 1, 1,
-0.2543989, -0.5876683, -1.786405, 1, 1, 1, 1, 1,
-0.2539762, 0.04561801, -2.599092, 1, 1, 1, 1, 1,
-0.2509949, -1.054621, -2.336723, 1, 1, 1, 1, 1,
-0.2478561, 2.200867, 0.5371227, 1, 1, 1, 1, 1,
-0.2434493, 0.400593, -0.9204985, 1, 1, 1, 1, 1,
-0.2387874, 0.02655089, -2.51976, 1, 1, 1, 1, 1,
-0.2378272, 1.874611, -1.623821, 1, 1, 1, 1, 1,
-0.2354983, 0.4518345, -1.33962, 1, 1, 1, 1, 1,
-0.2351698, 0.1541136, -0.6279604, 1, 1, 1, 1, 1,
-0.2338794, 0.2696898, -1.277653, 1, 1, 1, 1, 1,
-0.2316748, 0.2338639, -1.009671, 1, 1, 1, 1, 1,
-0.2309249, -0.4257446, -2.064289, 1, 1, 1, 1, 1,
-0.2265069, 0.8761917, 1.697201, 1, 1, 1, 1, 1,
-0.2258481, -0.5156338, -3.104566, 1, 1, 1, 1, 1,
-0.2190546, -0.08004153, -2.518353, 0, 0, 1, 1, 1,
-0.2166193, 0.7906806, 0.2482858, 1, 0, 0, 1, 1,
-0.2140498, 0.2675993, 0.2217698, 1, 0, 0, 1, 1,
-0.2077072, -0.6366476, -2.864638, 1, 0, 0, 1, 1,
-0.206139, -0.4227722, -1.685098, 1, 0, 0, 1, 1,
-0.1994953, 1.222226, -0.08877386, 1, 0, 0, 1, 1,
-0.1946559, -0.3255593, -2.743905, 0, 0, 0, 1, 1,
-0.1938054, 0.9294059, -0.3431613, 0, 0, 0, 1, 1,
-0.1909951, -0.3733908, -1.477592, 0, 0, 0, 1, 1,
-0.1896897, 0.7767798, 0.005653067, 0, 0, 0, 1, 1,
-0.1876849, -1.672032, -2.454534, 0, 0, 0, 1, 1,
-0.1867069, -0.5190926, -3.31746, 0, 0, 0, 1, 1,
-0.1853497, -2.202093, -3.934297, 0, 0, 0, 1, 1,
-0.1843901, 0.6487717, 1.420291, 1, 1, 1, 1, 1,
-0.1841181, 0.1526723, 0.8098668, 1, 1, 1, 1, 1,
-0.1832461, -0.5349284, -4.093002, 1, 1, 1, 1, 1,
-0.1830038, 0.8071885, 1.645968, 1, 1, 1, 1, 1,
-0.182916, -1.086257, -3.576342, 1, 1, 1, 1, 1,
-0.1825565, -1.552695, -4.94594, 1, 1, 1, 1, 1,
-0.1822667, 0.2500717, -1.620045, 1, 1, 1, 1, 1,
-0.1821834, -0.05661951, -3.527691, 1, 1, 1, 1, 1,
-0.1756332, 1.343051, 1.587688, 1, 1, 1, 1, 1,
-0.171513, 1.172751, -0.7446895, 1, 1, 1, 1, 1,
-0.1703749, -1.564705, -3.99531, 1, 1, 1, 1, 1,
-0.1687225, -0.4286669, -2.41389, 1, 1, 1, 1, 1,
-0.1685443, -0.374158, -2.197061, 1, 1, 1, 1, 1,
-0.1684489, -0.6296794, -2.327579, 1, 1, 1, 1, 1,
-0.1665021, 0.7544187, -0.7218454, 1, 1, 1, 1, 1,
-0.1654443, -0.3578697, -2.664013, 0, 0, 1, 1, 1,
-0.1643507, 0.4886998, -0.00966193, 1, 0, 0, 1, 1,
-0.1557078, -0.9975619, -4.112533, 1, 0, 0, 1, 1,
-0.1531793, -1.000608, -3.240495, 1, 0, 0, 1, 1,
-0.1529918, 0.1185252, -1.113734, 1, 0, 0, 1, 1,
-0.1484258, 0.5788794, 0.4822839, 1, 0, 0, 1, 1,
-0.1421104, -1.33905, -2.635484, 0, 0, 0, 1, 1,
-0.1417563, 0.4889956, -0.2009154, 0, 0, 0, 1, 1,
-0.1383558, 0.9923614, -0.2936433, 0, 0, 0, 1, 1,
-0.1377108, 0.1555846, -1.900927, 0, 0, 0, 1, 1,
-0.1365507, 0.2451145, -0.5349807, 0, 0, 0, 1, 1,
-0.1354339, 1.654967, 0.8418407, 0, 0, 0, 1, 1,
-0.1337959, -0.5566036, -4.502822, 0, 0, 0, 1, 1,
-0.1326326, -0.5658231, -3.36151, 1, 1, 1, 1, 1,
-0.1311825, -0.1894359, -2.426547, 1, 1, 1, 1, 1,
-0.1222456, 0.7739362, 0.8592091, 1, 1, 1, 1, 1,
-0.1198254, 0.760684, 0.2898866, 1, 1, 1, 1, 1,
-0.1197403, 0.7830955, -0.1447318, 1, 1, 1, 1, 1,
-0.1179882, -0.2782162, -3.874378, 1, 1, 1, 1, 1,
-0.1145536, -1.274418, -4.508832, 1, 1, 1, 1, 1,
-0.1059816, -0.2952861, -2.44734, 1, 1, 1, 1, 1,
-0.1051482, -0.8523293, -1.094813, 1, 1, 1, 1, 1,
-0.1045396, -0.8084378, -4.856891, 1, 1, 1, 1, 1,
-0.1045337, -0.7298796, -3.477387, 1, 1, 1, 1, 1,
-0.1025059, -0.9808955, -3.74168, 1, 1, 1, 1, 1,
-0.1022761, -0.5970035, -3.15073, 1, 1, 1, 1, 1,
-0.1003378, -0.1745539, -2.782794, 1, 1, 1, 1, 1,
-0.09467345, 1.978817, -1.267178, 1, 1, 1, 1, 1,
-0.08844177, -0.2443691, -4.293078, 0, 0, 1, 1, 1,
-0.08280895, -0.4116312, -3.298448, 1, 0, 0, 1, 1,
-0.07958109, 0.3713175, -0.3339456, 1, 0, 0, 1, 1,
-0.07905348, -0.4838452, -4.227079, 1, 0, 0, 1, 1,
-0.07808995, -0.472914, -2.8983, 1, 0, 0, 1, 1,
-0.07805821, -0.9637922, -2.420001, 1, 0, 0, 1, 1,
-0.07404882, -0.5584644, -4.29688, 0, 0, 0, 1, 1,
-0.06984197, -0.2249614, -4.475698, 0, 0, 0, 1, 1,
-0.06942347, -0.363391, -2.108081, 0, 0, 0, 1, 1,
-0.06931606, 0.4045119, -1.068055, 0, 0, 0, 1, 1,
-0.0685561, -1.983092, -3.941026, 0, 0, 0, 1, 1,
-0.06800956, -0.1797664, -4.132444, 0, 0, 0, 1, 1,
-0.06584608, -0.0341814, -1.217136, 0, 0, 0, 1, 1,
-0.06490967, 1.11223, 0.1913571, 1, 1, 1, 1, 1,
-0.06125, 0.8589117, 0.05217135, 1, 1, 1, 1, 1,
-0.05684788, 0.4758825, -0.5175633, 1, 1, 1, 1, 1,
-0.0479066, -1.877167, -3.806744, 1, 1, 1, 1, 1,
-0.04623, -1.753472, -3.445009, 1, 1, 1, 1, 1,
-0.04481541, 0.1002875, -0.3058623, 1, 1, 1, 1, 1,
-0.0419375, 0.9154047, -1.715854, 1, 1, 1, 1, 1,
-0.04151372, 0.8242739, 1.953432, 1, 1, 1, 1, 1,
-0.04110924, -1.086508, -2.93765, 1, 1, 1, 1, 1,
-0.03534747, -1.060038, -2.987087, 1, 1, 1, 1, 1,
-0.0346356, 0.1518327, -1.000256, 1, 1, 1, 1, 1,
-0.03278627, 0.4203442, -0.3162677, 1, 1, 1, 1, 1,
-0.03126886, -0.6742778, -2.777971, 1, 1, 1, 1, 1,
-0.03105406, 1.387797, 1.426807, 1, 1, 1, 1, 1,
-0.03027266, -0.1322849, -3.360509, 1, 1, 1, 1, 1,
-0.02766836, -0.2948292, -2.547431, 0, 0, 1, 1, 1,
-0.02611374, 1.301067, -0.5580833, 1, 0, 0, 1, 1,
-0.0258855, 0.4307323, 1.060096, 1, 0, 0, 1, 1,
-0.01903439, -1.591327, -1.669583, 1, 0, 0, 1, 1,
-0.01592941, 1.458803, -0.8008406, 1, 0, 0, 1, 1,
-0.01225849, -1.697971, -3.234348, 1, 0, 0, 1, 1,
-0.008916126, -1.629346, -3.60437, 0, 0, 0, 1, 1,
-0.007178687, -0.31807, -2.854018, 0, 0, 0, 1, 1,
-0.005689271, -1.026125, -1.806245, 0, 0, 0, 1, 1,
-0.0026654, -1.381215, -2.583989, 0, 0, 0, 1, 1,
-0.002080098, 1.013618, -1.864161, 0, 0, 0, 1, 1,
-0.0002194487, -0.49516, -1.740547, 0, 0, 0, 1, 1,
0.0005747529, -0.4204676, 3.665962, 0, 0, 0, 1, 1,
0.002211248, 0.07144193, -0.3695293, 1, 1, 1, 1, 1,
0.003560082, 0.1541515, 0.5719086, 1, 1, 1, 1, 1,
0.003625016, 2.003394, -0.01669203, 1, 1, 1, 1, 1,
0.008561094, -2.688686, 4.031368, 1, 1, 1, 1, 1,
0.009100799, -0.6605958, 3.510007, 1, 1, 1, 1, 1,
0.01259672, 0.8789423, 1.044888, 1, 1, 1, 1, 1,
0.01440579, -1.271849, 2.803504, 1, 1, 1, 1, 1,
0.01525925, 1.746294, -0.7072991, 1, 1, 1, 1, 1,
0.01612543, -1.520496, 2.132491, 1, 1, 1, 1, 1,
0.0169809, 0.4508969, -0.03485494, 1, 1, 1, 1, 1,
0.01833345, -0.3170035, 3.115835, 1, 1, 1, 1, 1,
0.02091728, -0.7203122, 3.821278, 1, 1, 1, 1, 1,
0.02208805, -0.8098504, 3.043463, 1, 1, 1, 1, 1,
0.02402689, -1.738371, 3.129363, 1, 1, 1, 1, 1,
0.02553135, -1.420007, 3.344114, 1, 1, 1, 1, 1,
0.02769816, 0.3751016, 0.2054994, 0, 0, 1, 1, 1,
0.02918259, 1.97857, -0.1067548, 1, 0, 0, 1, 1,
0.02932323, -0.5996852, 1.089498, 1, 0, 0, 1, 1,
0.04023502, 2.047343, 1.042282, 1, 0, 0, 1, 1,
0.04099656, -0.5553658, 3.716368, 1, 0, 0, 1, 1,
0.04478303, -0.5057507, 4.776781, 1, 0, 0, 1, 1,
0.04667868, -0.958793, 2.63507, 0, 0, 0, 1, 1,
0.046821, -0.1398798, 3.113115, 0, 0, 0, 1, 1,
0.05156806, -0.4853359, 1.860985, 0, 0, 0, 1, 1,
0.05881329, -0.4110399, 3.638042, 0, 0, 0, 1, 1,
0.05982988, 0.232175, -0.9272237, 0, 0, 0, 1, 1,
0.06115501, -0.08045445, 2.158422, 0, 0, 0, 1, 1,
0.0638203, -1.285631, 4.668365, 0, 0, 0, 1, 1,
0.06526868, 0.06412649, 0.06108034, 1, 1, 1, 1, 1,
0.06747835, 0.966294, 0.8358629, 1, 1, 1, 1, 1,
0.06844489, 1.296326, 1.796654, 1, 1, 1, 1, 1,
0.07079182, 0.6882684, -1.325165, 1, 1, 1, 1, 1,
0.0728398, -0.7439731, 3.470859, 1, 1, 1, 1, 1,
0.07785898, -0.4470062, 3.267059, 1, 1, 1, 1, 1,
0.07843808, 2.032867, -0.2752244, 1, 1, 1, 1, 1,
0.08044069, 0.001604186, 3.521099, 1, 1, 1, 1, 1,
0.08287742, -1.16879, 2.077333, 1, 1, 1, 1, 1,
0.08872217, -0.6123626, 3.174603, 1, 1, 1, 1, 1,
0.09145958, -0.2355041, 2.97513, 1, 1, 1, 1, 1,
0.09523292, 0.6306262, -0.5516915, 1, 1, 1, 1, 1,
0.0988094, -0.4828117, 1.52589, 1, 1, 1, 1, 1,
0.1013932, 0.9030058, -1.023305, 1, 1, 1, 1, 1,
0.1019874, 0.303107, 1.533403, 1, 1, 1, 1, 1,
0.1042538, -0.9822569, 2.243881, 0, 0, 1, 1, 1,
0.1044783, -1.933362, 3.67728, 1, 0, 0, 1, 1,
0.1052865, -0.004920149, 0.5776849, 1, 0, 0, 1, 1,
0.1073247, -0.4778019, 3.276355, 1, 0, 0, 1, 1,
0.1083271, -0.06036206, 0.8934591, 1, 0, 0, 1, 1,
0.1091553, -0.4364434, 3.093267, 1, 0, 0, 1, 1,
0.1103168, -1.589232, 2.035659, 0, 0, 0, 1, 1,
0.1103873, -1.271343, 1.393606, 0, 0, 0, 1, 1,
0.111408, -0.9271532, 2.972815, 0, 0, 0, 1, 1,
0.1121548, -0.5757787, 1.971526, 0, 0, 0, 1, 1,
0.1141686, 0.9874116, 1.162249, 0, 0, 0, 1, 1,
0.1163651, 1.957774, -2.157305, 0, 0, 0, 1, 1,
0.1206936, -1.014363, 2.780419, 0, 0, 0, 1, 1,
0.1242447, -0.8357383, 4.03933, 1, 1, 1, 1, 1,
0.126162, -1.652016, 3.591897, 1, 1, 1, 1, 1,
0.1269265, 0.03857299, -0.5279858, 1, 1, 1, 1, 1,
0.135428, 1.172303, -1.193288, 1, 1, 1, 1, 1,
0.1365419, -1.196045, 2.364461, 1, 1, 1, 1, 1,
0.1410476, -0.5132496, 2.165273, 1, 1, 1, 1, 1,
0.141624, 0.804749, 2.102078, 1, 1, 1, 1, 1,
0.1435976, -0.3978837, 3.039956, 1, 1, 1, 1, 1,
0.1445379, 1.238882, 0.04544412, 1, 1, 1, 1, 1,
0.14646, 0.4563825, 1.749118, 1, 1, 1, 1, 1,
0.147874, 0.7644546, 0.9795187, 1, 1, 1, 1, 1,
0.1522933, 2.336968, -1.282136, 1, 1, 1, 1, 1,
0.1536052, 1.227736, 1.767347, 1, 1, 1, 1, 1,
0.15671, -2.067336, 4.638296, 1, 1, 1, 1, 1,
0.1583946, -1.041444, 3.814213, 1, 1, 1, 1, 1,
0.1616296, 0.7662341, 1.262069, 0, 0, 1, 1, 1,
0.1622999, 0.1728566, 1.232133, 1, 0, 0, 1, 1,
0.1644159, -0.7847459, 3.045844, 1, 0, 0, 1, 1,
0.1737847, 1.424618, -0.676413, 1, 0, 0, 1, 1,
0.1739236, -0.5619086, 3.095145, 1, 0, 0, 1, 1,
0.1740935, 0.09270099, 0.6751609, 1, 0, 0, 1, 1,
0.1751674, 2.425259, -0.1801827, 0, 0, 0, 1, 1,
0.1758982, -0.2356831, 2.036703, 0, 0, 0, 1, 1,
0.1759648, 0.8012301, -0.7507672, 0, 0, 0, 1, 1,
0.1843322, 0.4619675, -0.7046568, 0, 0, 0, 1, 1,
0.1873266, -1.612116, 5.152234, 0, 0, 0, 1, 1,
0.1888943, 1.016333, -0.5963119, 0, 0, 0, 1, 1,
0.1893479, -0.8162473, 3.303139, 0, 0, 0, 1, 1,
0.1925737, -1.940947, 4.008175, 1, 1, 1, 1, 1,
0.193596, -1.006462, 3.708373, 1, 1, 1, 1, 1,
0.1959643, -0.09759799, 1.725391, 1, 1, 1, 1, 1,
0.1980072, -1.249595, 2.380993, 1, 1, 1, 1, 1,
0.199101, -0.8788665, 2.440514, 1, 1, 1, 1, 1,
0.203119, -0.6162594, 2.490621, 1, 1, 1, 1, 1,
0.2058302, -2.789983, 5.338813, 1, 1, 1, 1, 1,
0.2059645, -0.544247, 4.061004, 1, 1, 1, 1, 1,
0.2091523, 0.5658675, 0.2290898, 1, 1, 1, 1, 1,
0.2098414, -0.6209111, 4.492299, 1, 1, 1, 1, 1,
0.210876, 1.094501, -1.597604, 1, 1, 1, 1, 1,
0.2124171, -0.8052712, 2.324251, 1, 1, 1, 1, 1,
0.2143574, -1.239243, 2.256564, 1, 1, 1, 1, 1,
0.2164592, -0.04060572, 2.519934, 1, 1, 1, 1, 1,
0.2165038, 0.9285183, 0.01240107, 1, 1, 1, 1, 1,
0.2168718, 0.9940268, 0.7869716, 0, 0, 1, 1, 1,
0.2169772, 0.1567124, 1.004518, 1, 0, 0, 1, 1,
0.2191443, 0.2406934, 0.513364, 1, 0, 0, 1, 1,
0.2214968, 1.331229, -0.5353434, 1, 0, 0, 1, 1,
0.2240549, 2.251495, 0.9628959, 1, 0, 0, 1, 1,
0.2252064, 1.236566, 1.312096, 1, 0, 0, 1, 1,
0.2270924, 1.623417, -0.9762134, 0, 0, 0, 1, 1,
0.2278842, 0.05947501, 2.092157, 0, 0, 0, 1, 1,
0.229551, 1.7249, 0.3185006, 0, 0, 0, 1, 1,
0.2309081, -1.51215, 2.333657, 0, 0, 0, 1, 1,
0.2314068, 0.1863064, -0.6866407, 0, 0, 0, 1, 1,
0.2335489, -1.200749, 3.657265, 0, 0, 0, 1, 1,
0.2383915, -0.6624215, 2.580291, 0, 0, 0, 1, 1,
0.2433087, -0.1287951, 1.285902, 1, 1, 1, 1, 1,
0.2472626, 1.907753, 1.769661, 1, 1, 1, 1, 1,
0.2526426, -0.3022225, 2.943485, 1, 1, 1, 1, 1,
0.2540966, -1.058779, 1.827375, 1, 1, 1, 1, 1,
0.2592588, -0.1632532, 2.656029, 1, 1, 1, 1, 1,
0.2624189, -0.4471321, 2.468992, 1, 1, 1, 1, 1,
0.2627187, 1.247988, -2.795703, 1, 1, 1, 1, 1,
0.2742524, 0.7047423, 0.5219526, 1, 1, 1, 1, 1,
0.2777436, 1.621815, 0.9620968, 1, 1, 1, 1, 1,
0.2779336, -0.7125289, 1.886803, 1, 1, 1, 1, 1,
0.2811929, -0.2636203, 3.236278, 1, 1, 1, 1, 1,
0.2850101, 0.4975369, 0.01860084, 1, 1, 1, 1, 1,
0.2858709, -0.06931596, 0.2804637, 1, 1, 1, 1, 1,
0.2899843, 0.5313526, -0.3223381, 1, 1, 1, 1, 1,
0.2969126, 0.2624069, 0.4904358, 1, 1, 1, 1, 1,
0.2979603, 0.6120057, -0.8229249, 0, 0, 1, 1, 1,
0.2992467, 0.3153847, 1.17253, 1, 0, 0, 1, 1,
0.3041553, 1.375611, 0.6200854, 1, 0, 0, 1, 1,
0.3059041, -0.02459292, 1.184031, 1, 0, 0, 1, 1,
0.3060515, -0.6464428, 2.402644, 1, 0, 0, 1, 1,
0.3109227, 0.3616219, 0.3276333, 1, 0, 0, 1, 1,
0.311145, 1.408157, 0.9217744, 0, 0, 0, 1, 1,
0.3123451, 1.212516, 0.4116427, 0, 0, 0, 1, 1,
0.3133443, -0.82894, 3.501565, 0, 0, 0, 1, 1,
0.3136128, 0.801906, 1.504697, 0, 0, 0, 1, 1,
0.3178669, 0.6205806, 0.6736406, 0, 0, 0, 1, 1,
0.3179164, -0.8971742, 3.373327, 0, 0, 0, 1, 1,
0.3190065, 1.421634, 1.167033, 0, 0, 0, 1, 1,
0.3216218, 1.889819, 1.710048, 1, 1, 1, 1, 1,
0.3242142, 0.7865538, 0.3929929, 1, 1, 1, 1, 1,
0.3243851, 0.677869, -1.665083, 1, 1, 1, 1, 1,
0.3274352, -0.221237, 2.819544, 1, 1, 1, 1, 1,
0.3293185, 0.2220649, 1.007628, 1, 1, 1, 1, 1,
0.329766, 0.3961353, 1.058417, 1, 1, 1, 1, 1,
0.3374095, 0.2079813, -0.9103212, 1, 1, 1, 1, 1,
0.3435397, 0.390354, -0.3643655, 1, 1, 1, 1, 1,
0.3450739, 0.7770618, 1.786797, 1, 1, 1, 1, 1,
0.3460058, 3.085462, 1.091206, 1, 1, 1, 1, 1,
0.3461665, -0.7671349, 1.620753, 1, 1, 1, 1, 1,
0.3473454, -0.01113824, 1.406961, 1, 1, 1, 1, 1,
0.3498541, 0.9863917, -1.844204, 1, 1, 1, 1, 1,
0.3567141, -1.966984, 2.940373, 1, 1, 1, 1, 1,
0.3609114, -1.101982, 1.233491, 1, 1, 1, 1, 1,
0.3609189, -1.895945, 2.498145, 0, 0, 1, 1, 1,
0.361136, -0.7157589, 2.075474, 1, 0, 0, 1, 1,
0.3618816, -1.26382, 3.13355, 1, 0, 0, 1, 1,
0.3629309, -0.5961888, 2.237025, 1, 0, 0, 1, 1,
0.3705964, 0.2430834, 2.855728, 1, 0, 0, 1, 1,
0.3707192, 0.2085963, 1.691906, 1, 0, 0, 1, 1,
0.3718959, -0.567026, 3.620762, 0, 0, 0, 1, 1,
0.3871179, 0.6776102, 2.501369, 0, 0, 0, 1, 1,
0.3872625, -0.2775848, 1.881226, 0, 0, 0, 1, 1,
0.3952573, -0.9294663, 3.165941, 0, 0, 0, 1, 1,
0.3973182, -0.7678564, 0.7294799, 0, 0, 0, 1, 1,
0.3993451, 2.023431, -0.1528178, 0, 0, 0, 1, 1,
0.4013194, 0.2574042, 1.174915, 0, 0, 0, 1, 1,
0.4034962, -0.5285145, 4.156325, 1, 1, 1, 1, 1,
0.4053826, -1.649854, 3.661946, 1, 1, 1, 1, 1,
0.4068204, 0.6583451, 0.05133612, 1, 1, 1, 1, 1,
0.4112951, -0.1538566, 0.2328749, 1, 1, 1, 1, 1,
0.416575, -0.5254259, 2.941004, 1, 1, 1, 1, 1,
0.4235557, 1.226802, 0.7971087, 1, 1, 1, 1, 1,
0.4245731, 0.1696596, 2.41315, 1, 1, 1, 1, 1,
0.424955, 1.138361, -0.1439591, 1, 1, 1, 1, 1,
0.4281026, -1.91512, 2.450842, 1, 1, 1, 1, 1,
0.4282183, -0.006593016, 0.7175587, 1, 1, 1, 1, 1,
0.4390246, -0.6581863, 0.3206859, 1, 1, 1, 1, 1,
0.4431574, -0.7885383, 2.490186, 1, 1, 1, 1, 1,
0.4464951, -0.1361417, 3.802101, 1, 1, 1, 1, 1,
0.4492627, -1.296604, 3.280256, 1, 1, 1, 1, 1,
0.4548732, -0.490519, 3.084893, 1, 1, 1, 1, 1,
0.4641549, 0.6682231, -1.161029, 0, 0, 1, 1, 1,
0.4686447, 0.4338407, 0.2599609, 1, 0, 0, 1, 1,
0.4692476, 1.674102, 1.057541, 1, 0, 0, 1, 1,
0.4798498, 0.7901678, 0.7424326, 1, 0, 0, 1, 1,
0.4835534, -1.131624, 2.116422, 1, 0, 0, 1, 1,
0.4937779, 0.811209, 0.6076635, 1, 0, 0, 1, 1,
0.4946291, 0.5145993, 1.614847, 0, 0, 0, 1, 1,
0.4952864, -0.1600256, 1.185622, 0, 0, 0, 1, 1,
0.5003822, 0.04882479, 2.432155, 0, 0, 0, 1, 1,
0.5106902, -0.3008127, 1.745943, 0, 0, 0, 1, 1,
0.5167443, 1.665338, 0.3345153, 0, 0, 0, 1, 1,
0.5170454, -1.671501, 1.38271, 0, 0, 0, 1, 1,
0.5175433, 0.3326775, 1.870648, 0, 0, 0, 1, 1,
0.5217988, 0.3409497, 1.100675, 1, 1, 1, 1, 1,
0.5240091, 0.7809912, 3.767648, 1, 1, 1, 1, 1,
0.5290598, -1.237942, 2.525729, 1, 1, 1, 1, 1,
0.5382147, -0.04649426, 1.816359, 1, 1, 1, 1, 1,
0.5388742, -0.6762654, 1.077712, 1, 1, 1, 1, 1,
0.5400711, 1.118053, 1.820925, 1, 1, 1, 1, 1,
0.5406032, 0.5158294, 1.46288, 1, 1, 1, 1, 1,
0.5417858, 1.864482, -0.701899, 1, 1, 1, 1, 1,
0.5472133, -0.07212023, 1.475641, 1, 1, 1, 1, 1,
0.5476571, -1.11697, 2.552397, 1, 1, 1, 1, 1,
0.5477777, 1.252236, 0.5726318, 1, 1, 1, 1, 1,
0.5479182, -0.6134983, 3.443332, 1, 1, 1, 1, 1,
0.5506477, 0.8495792, 2.255382, 1, 1, 1, 1, 1,
0.5582834, -1.580479, 3.097238, 1, 1, 1, 1, 1,
0.5599658, -0.04891602, 0.4940986, 1, 1, 1, 1, 1,
0.5656086, -0.8411009, 2.313136, 0, 0, 1, 1, 1,
0.5672692, 0.359237, 0.7815135, 1, 0, 0, 1, 1,
0.5699181, -2.31953, 0.7255563, 1, 0, 0, 1, 1,
0.573532, 0.1113652, 0.06668828, 1, 0, 0, 1, 1,
0.5831209, 0.4997614, 0.9053403, 1, 0, 0, 1, 1,
0.5858943, 0.2574605, 0.6813841, 1, 0, 0, 1, 1,
0.5887216, 0.3779895, 1.52283, 0, 0, 0, 1, 1,
0.5933843, 0.1991551, 1.336668, 0, 0, 0, 1, 1,
0.5947088, -0.4445961, 3.221542, 0, 0, 0, 1, 1,
0.598811, 1.538881, 0.9091406, 0, 0, 0, 1, 1,
0.6011042, 1.920259, 0.2200546, 0, 0, 0, 1, 1,
0.6012304, 0.8550754, 2.051709, 0, 0, 0, 1, 1,
0.6013544, 0.04857584, 0.6353851, 0, 0, 0, 1, 1,
0.6063417, -0.1595972, 1.134391, 1, 1, 1, 1, 1,
0.6067623, 1.599892, -1.656781, 1, 1, 1, 1, 1,
0.6144605, 0.5997256, 1.152822, 1, 1, 1, 1, 1,
0.6179498, -1.770828, 0.5641575, 1, 1, 1, 1, 1,
0.6182729, 0.3326957, 0.678344, 1, 1, 1, 1, 1,
0.6201172, -0.8891039, 3.005623, 1, 1, 1, 1, 1,
0.6238114, -2.43246, 2.846338, 1, 1, 1, 1, 1,
0.6247226, -1.43773, 3.994774, 1, 1, 1, 1, 1,
0.6344494, -0.3945985, 2.574862, 1, 1, 1, 1, 1,
0.6371447, -0.7685946, 2.522337, 1, 1, 1, 1, 1,
0.6402391, -0.908636, 3.059293, 1, 1, 1, 1, 1,
0.6405735, 0.3034295, 1.735608, 1, 1, 1, 1, 1,
0.641918, 0.74457, 0.9514158, 1, 1, 1, 1, 1,
0.6428195, -0.5773469, 2.26519, 1, 1, 1, 1, 1,
0.6451091, 0.6229386, 1.807269, 1, 1, 1, 1, 1,
0.6508387, 1.351848, 0.891929, 0, 0, 1, 1, 1,
0.6535189, 0.4664473, 0.790313, 1, 0, 0, 1, 1,
0.6541219, -0.8209527, 2.952186, 1, 0, 0, 1, 1,
0.6551795, 1.030961, 3.89654, 1, 0, 0, 1, 1,
0.6556196, -1.574491, 2.459378, 1, 0, 0, 1, 1,
0.6580078, 1.831127, 1.483417, 1, 0, 0, 1, 1,
0.6621279, 0.1797326, 2.924189, 0, 0, 0, 1, 1,
0.6667877, 0.1299417, 1.139015, 0, 0, 0, 1, 1,
0.667058, 1.394616, 1.312279, 0, 0, 0, 1, 1,
0.668018, -1.070777, 1.933709, 0, 0, 0, 1, 1,
0.6697258, 0.3584779, 1.630937, 0, 0, 0, 1, 1,
0.6718146, 0.7967302, -0.2608694, 0, 0, 0, 1, 1,
0.6736, 1.38506, 0.5663124, 0, 0, 0, 1, 1,
0.6794331, 0.1440277, 3.534068, 1, 1, 1, 1, 1,
0.6810123, 0.2681083, 1.358946, 1, 1, 1, 1, 1,
0.6943313, -0.06815749, 1.453667, 1, 1, 1, 1, 1,
0.7040178, -1.605933, 3.324283, 1, 1, 1, 1, 1,
0.708091, 0.6022471, 0.3489217, 1, 1, 1, 1, 1,
0.7082331, -1.659649, 2.530205, 1, 1, 1, 1, 1,
0.7084652, -1.402743, 2.721557, 1, 1, 1, 1, 1,
0.7086084, -0.8885863, 2.875164, 1, 1, 1, 1, 1,
0.7150524, 0.4327581, 3.303109, 1, 1, 1, 1, 1,
0.7166227, -1.524623, 4.363946, 1, 1, 1, 1, 1,
0.72252, -0.1824019, 3.006524, 1, 1, 1, 1, 1,
0.7241136, 0.4083738, 2.496548, 1, 1, 1, 1, 1,
0.7246193, 1.08279, -0.2294622, 1, 1, 1, 1, 1,
0.7264181, 0.3677551, 1.58618, 1, 1, 1, 1, 1,
0.7360557, -2.564245, 1.930024, 1, 1, 1, 1, 1,
0.7394382, -0.4386945, 2.177079, 0, 0, 1, 1, 1,
0.7455307, -1.472943, 2.545656, 1, 0, 0, 1, 1,
0.7458298, 0.1259659, 2.229507, 1, 0, 0, 1, 1,
0.7465749, -0.5203846, 2.891275, 1, 0, 0, 1, 1,
0.7485643, 0.4227747, 0.502168, 1, 0, 0, 1, 1,
0.7587178, -2.164975, 4.40049, 1, 0, 0, 1, 1,
0.7596623, -0.03939648, 1.117019, 0, 0, 0, 1, 1,
0.7604756, 1.052704, -1.440369, 0, 0, 0, 1, 1,
0.766167, -0.4076188, 0.2875662, 0, 0, 0, 1, 1,
0.7664252, 1.739025, 0.07265799, 0, 0, 0, 1, 1,
0.766764, -1.030083, 1.931565, 0, 0, 0, 1, 1,
0.7693243, 0.104527, 2.630171, 0, 0, 0, 1, 1,
0.7724673, 0.4072191, 0.2809745, 0, 0, 0, 1, 1,
0.7807108, 1.005133, 0.6860968, 1, 1, 1, 1, 1,
0.7813512, -0.7005476, 1.070971, 1, 1, 1, 1, 1,
0.786366, -0.6246767, 2.04162, 1, 1, 1, 1, 1,
0.7886627, 0.2523567, 1.637381, 1, 1, 1, 1, 1,
0.7923501, -1.262457, 2.991968, 1, 1, 1, 1, 1,
0.7933794, 1.363545, 0.2956172, 1, 1, 1, 1, 1,
0.7970805, 1.134532, 1.128546, 1, 1, 1, 1, 1,
0.7990251, 0.05506234, 0.8836294, 1, 1, 1, 1, 1,
0.799728, 0.4992125, 0.1238418, 1, 1, 1, 1, 1,
0.8041407, 0.4810802, 2.142754, 1, 1, 1, 1, 1,
0.8049561, 0.4831634, 1.164981, 1, 1, 1, 1, 1,
0.8071269, -0.3833449, 2.53976, 1, 1, 1, 1, 1,
0.808391, 0.3941372, 1.430926, 1, 1, 1, 1, 1,
0.8191637, 0.06116157, 1.795311, 1, 1, 1, 1, 1,
0.8206756, 0.8904833, -0.5649613, 1, 1, 1, 1, 1,
0.8254206, -0.3815149, 3.354479, 0, 0, 1, 1, 1,
0.828079, -0.370851, 1.209908, 1, 0, 0, 1, 1,
0.8334275, -0.3006711, 2.431975, 1, 0, 0, 1, 1,
0.8357086, -0.3849876, -0.2160199, 1, 0, 0, 1, 1,
0.8374363, -0.2916664, 2.054076, 1, 0, 0, 1, 1,
0.8408168, -1.30756, 2.501357, 1, 0, 0, 1, 1,
0.854826, -0.08084708, 0.5499694, 0, 0, 0, 1, 1,
0.8560022, -0.5788357, 2.468287, 0, 0, 0, 1, 1,
0.8604016, 0.7292998, -0.895666, 0, 0, 0, 1, 1,
0.8656893, 0.2858166, 1.512424, 0, 0, 0, 1, 1,
0.8682415, 1.881738, 2.360058, 0, 0, 0, 1, 1,
0.8790767, 1.444831, 1.403148, 0, 0, 0, 1, 1,
0.8808576, 0.4413413, 0.2797743, 0, 0, 0, 1, 1,
0.8867065, 1.463634, 0.1698681, 1, 1, 1, 1, 1,
0.9014482, 0.580549, 0.1514689, 1, 1, 1, 1, 1,
0.9019614, 0.6699502, -2.917035, 1, 1, 1, 1, 1,
0.9040407, -1.33059, 2.503175, 1, 1, 1, 1, 1,
0.9162615, -0.5680737, 3.154414, 1, 1, 1, 1, 1,
0.9165432, -0.03369598, 2.14002, 1, 1, 1, 1, 1,
0.9170471, 0.08014791, 2.517121, 1, 1, 1, 1, 1,
0.921424, -1.297054, 0.9595186, 1, 1, 1, 1, 1,
0.9217129, 0.3601297, 0.8304759, 1, 1, 1, 1, 1,
0.924887, -0.550395, 2.346567, 1, 1, 1, 1, 1,
0.9261884, -0.04292647, 0.6777777, 1, 1, 1, 1, 1,
0.9272955, 0.9504244, -0.01772364, 1, 1, 1, 1, 1,
0.9313691, -1.675776, 3.510044, 1, 1, 1, 1, 1,
0.9317811, 0.3080025, 2.554225, 1, 1, 1, 1, 1,
0.9331723, -1.520596, 3.302169, 1, 1, 1, 1, 1,
0.9350292, 0.06271816, 1.411135, 0, 0, 1, 1, 1,
0.9354035, -0.04162902, 0.6806257, 1, 0, 0, 1, 1,
0.939974, -1.163702, 1.652287, 1, 0, 0, 1, 1,
0.9442194, -2.036956, 3.894046, 1, 0, 0, 1, 1,
0.9446127, 1.04726, 0.5109242, 1, 0, 0, 1, 1,
0.9474196, 0.5960503, -0.01174421, 1, 0, 0, 1, 1,
0.9532528, -1.349463, 2.806701, 0, 0, 0, 1, 1,
0.956327, -0.6966299, 4.200245, 0, 0, 0, 1, 1,
0.9587776, -0.2347011, 2.153242, 0, 0, 0, 1, 1,
0.9607742, 1.504623, 1.376369, 0, 0, 0, 1, 1,
0.9616475, -1.473285, 4.226649, 0, 0, 0, 1, 1,
0.9650375, 0.3864862, 1.379524, 0, 0, 0, 1, 1,
0.96965, -1.521835, 2.954948, 0, 0, 0, 1, 1,
0.970247, 0.3822994, 2.097711, 1, 1, 1, 1, 1,
0.971232, 0.4310396, 2.231198, 1, 1, 1, 1, 1,
0.9941039, 0.1336613, 0.5173025, 1, 1, 1, 1, 1,
0.9955457, -1.720974, 2.509339, 1, 1, 1, 1, 1,
0.9960479, -1.495205, 3.031042, 1, 1, 1, 1, 1,
0.9990451, 1.446327, 0.58513, 1, 1, 1, 1, 1,
1.01406, -0.7504756, 2.532316, 1, 1, 1, 1, 1,
1.015128, 2.115767, 3.013294, 1, 1, 1, 1, 1,
1.017266, 0.2663064, 3.529132, 1, 1, 1, 1, 1,
1.018087, -0.2860084, 0.1026049, 1, 1, 1, 1, 1,
1.022915, 0.6556944, 2.194878, 1, 1, 1, 1, 1,
1.02545, 2.858552, -0.07819687, 1, 1, 1, 1, 1,
1.025517, -1.267579, 2.44008, 1, 1, 1, 1, 1,
1.026385, -0.8070927, 3.343414, 1, 1, 1, 1, 1,
1.032813, -1.1006, 3.456368, 1, 1, 1, 1, 1,
1.039873, 0.2027969, 2.077778, 0, 0, 1, 1, 1,
1.043174, -1.647849, 4.650987, 1, 0, 0, 1, 1,
1.04415, 0.4350212, 1.706572, 1, 0, 0, 1, 1,
1.050642, -0.5418347, 2.835244, 1, 0, 0, 1, 1,
1.05318, 0.9790668, 1.638825, 1, 0, 0, 1, 1,
1.054918, 0.2315869, 1.800074, 1, 0, 0, 1, 1,
1.05671, -0.5020289, 1.052781, 0, 0, 0, 1, 1,
1.05891, -2.087358, 2.152771, 0, 0, 0, 1, 1,
1.061078, -1.958466, 2.808421, 0, 0, 0, 1, 1,
1.069826, 0.7013243, -0.9232035, 0, 0, 0, 1, 1,
1.072121, -0.08857507, 1.457241, 0, 0, 0, 1, 1,
1.091828, -0.3385034, 4.285605, 0, 0, 0, 1, 1,
1.09437, 2.079837, 0.2507738, 0, 0, 0, 1, 1,
1.097749, 0.8399543, 1.447954, 1, 1, 1, 1, 1,
1.105202, -0.3765647, 2.919813, 1, 1, 1, 1, 1,
1.105805, 0.569445, 0.3268364, 1, 1, 1, 1, 1,
1.107532, -2.444914, 2.299426, 1, 1, 1, 1, 1,
1.11031, 0.9264665, -0.866037, 1, 1, 1, 1, 1,
1.118572, -0.9539858, 2.384573, 1, 1, 1, 1, 1,
1.122503, 0.6669312, 1.072325, 1, 1, 1, 1, 1,
1.129058, 0.2997845, 0.2093487, 1, 1, 1, 1, 1,
1.133322, 0.3544236, -0.3977234, 1, 1, 1, 1, 1,
1.137346, 0.2636216, 0.3719181, 1, 1, 1, 1, 1,
1.143913, -0.4691107, 2.370618, 1, 1, 1, 1, 1,
1.145455, -0.004918056, 0.4444801, 1, 1, 1, 1, 1,
1.154143, -0.5272654, 1.293877, 1, 1, 1, 1, 1,
1.154244, -0.4583125, 2.790281, 1, 1, 1, 1, 1,
1.156359, 0.1501465, 0.8804551, 1, 1, 1, 1, 1,
1.156703, -0.1902394, 1.172677, 0, 0, 1, 1, 1,
1.157488, -0.4711877, 2.937188, 1, 0, 0, 1, 1,
1.163856, -0.4997465, -0.4269278, 1, 0, 0, 1, 1,
1.169455, 0.9324604, 0.9600111, 1, 0, 0, 1, 1,
1.175246, -2.231485, 3.251477, 1, 0, 0, 1, 1,
1.187047, -1.29088, 3.376681, 1, 0, 0, 1, 1,
1.189321, -0.4975632, 1.439735, 0, 0, 0, 1, 1,
1.192334, 1.932104, 0.3990816, 0, 0, 0, 1, 1,
1.198898, -0.917798, 1.07715, 0, 0, 0, 1, 1,
1.220952, 0.5588388, 1.740636, 0, 0, 0, 1, 1,
1.231765, 0.5551101, 0.6424078, 0, 0, 0, 1, 1,
1.236595, -0.6857359, 1.525191, 0, 0, 0, 1, 1,
1.23679, 0.7016361, 2.477097, 0, 0, 0, 1, 1,
1.238006, 1.469083, 0.5226359, 1, 1, 1, 1, 1,
1.239873, -0.3767808, -0.4407725, 1, 1, 1, 1, 1,
1.241517, -0.1696538, 0.428751, 1, 1, 1, 1, 1,
1.241931, 1.483759, 1.143366, 1, 1, 1, 1, 1,
1.253803, 0.6605589, 1.590702, 1, 1, 1, 1, 1,
1.25818, 0.3134854, 0.929404, 1, 1, 1, 1, 1,
1.261647, 1.03983, 0.3340877, 1, 1, 1, 1, 1,
1.275072, 1.815292, 0.8885895, 1, 1, 1, 1, 1,
1.279266, 0.4414782, 1.220105, 1, 1, 1, 1, 1,
1.285814, 0.4454957, 0.977716, 1, 1, 1, 1, 1,
1.287132, -0.2373841, 1.638819, 1, 1, 1, 1, 1,
1.289479, -0.1623405, 1.330588, 1, 1, 1, 1, 1,
1.296606, 1.373339, 0.6843532, 1, 1, 1, 1, 1,
1.312974, -0.8065894, 2.86375, 1, 1, 1, 1, 1,
1.323696, 4.130035, 1.159151, 1, 1, 1, 1, 1,
1.325387, 1.043229, 1.124659, 0, 0, 1, 1, 1,
1.32544, -0.6150228, 1.169434, 1, 0, 0, 1, 1,
1.331052, -0.07173581, 2.278918, 1, 0, 0, 1, 1,
1.331817, -0.06195044, 0.6337223, 1, 0, 0, 1, 1,
1.341339, -0.6942694, 1.781546, 1, 0, 0, 1, 1,
1.342792, -0.4403724, 1.104891, 1, 0, 0, 1, 1,
1.343065, 0.3546113, 1.346448, 0, 0, 0, 1, 1,
1.343071, 0.5694436, 0.5703189, 0, 0, 0, 1, 1,
1.345149, -0.6637078, 1.977103, 0, 0, 0, 1, 1,
1.358606, -1.154025, 2.060916, 0, 0, 0, 1, 1,
1.36599, -0.967507, 1.218485, 0, 0, 0, 1, 1,
1.367059, 0.4868611, 1.978892, 0, 0, 0, 1, 1,
1.36785, -0.9249215, 0.6897405, 0, 0, 0, 1, 1,
1.384788, 1.976023, 1.890925, 1, 1, 1, 1, 1,
1.391773, 0.3632551, 1.060043, 1, 1, 1, 1, 1,
1.399601, 0.2502988, 2.464203, 1, 1, 1, 1, 1,
1.405207, 1.374493, -1.11514, 1, 1, 1, 1, 1,
1.411227, -0.5674126, 1.723736, 1, 1, 1, 1, 1,
1.422908, 0.3393472, -0.007846468, 1, 1, 1, 1, 1,
1.427109, 0.3824764, 2.272912, 1, 1, 1, 1, 1,
1.430752, 1.024703, 0.4748127, 1, 1, 1, 1, 1,
1.438968, 0.2556569, -0.7906939, 1, 1, 1, 1, 1,
1.443352, -0.1183791, 0.87869, 1, 1, 1, 1, 1,
1.453855, 0.1909441, 1.496686, 1, 1, 1, 1, 1,
1.454835, 1.58667, -0.2122447, 1, 1, 1, 1, 1,
1.454895, 0.79794, 0.7990818, 1, 1, 1, 1, 1,
1.477116, 0.9521025, 2.416027, 1, 1, 1, 1, 1,
1.481624, -1.938722, 2.848089, 1, 1, 1, 1, 1,
1.485146, 0.4203665, 0.98629, 0, 0, 1, 1, 1,
1.489174, -0.6205772, 0.687513, 1, 0, 0, 1, 1,
1.497925, 1.051928, 0.8582907, 1, 0, 0, 1, 1,
1.520017, -0.2981404, 2.518917, 1, 0, 0, 1, 1,
1.525963, 1.304258, 1.153681, 1, 0, 0, 1, 1,
1.544312, -0.1970813, 3.262418, 1, 0, 0, 1, 1,
1.545104, 0.1669099, 3.900772, 0, 0, 0, 1, 1,
1.555263, 0.2787666, 2.430707, 0, 0, 0, 1, 1,
1.584934, 0.9024578, 1.844789, 0, 0, 0, 1, 1,
1.592478, 1.116291, 1.607617, 0, 0, 0, 1, 1,
1.594334, -0.4305517, 3.158156, 0, 0, 0, 1, 1,
1.59482, -1.039133, 2.4782, 0, 0, 0, 1, 1,
1.594874, -0.8819832, 1.224495, 0, 0, 0, 1, 1,
1.626331, 0.43694, 3.302715, 1, 1, 1, 1, 1,
1.629809, -0.1583849, 1.881793, 1, 1, 1, 1, 1,
1.656582, 0.4206837, 2.695275, 1, 1, 1, 1, 1,
1.679634, -1.981857, 1.173226, 1, 1, 1, 1, 1,
1.683042, 2.045327, 0.2351348, 1, 1, 1, 1, 1,
1.685637, -0.40442, 0.6319229, 1, 1, 1, 1, 1,
1.697469, -1.67727, 2.153981, 1, 1, 1, 1, 1,
1.700396, 1.565604, 2.335557, 1, 1, 1, 1, 1,
1.706614, 1.377036, 0.2391957, 1, 1, 1, 1, 1,
1.707439, 0.8044496, -0.5941591, 1, 1, 1, 1, 1,
1.720724, 0.6050704, 1.073858, 1, 1, 1, 1, 1,
1.724931, 0.003473605, 2.55321, 1, 1, 1, 1, 1,
1.735139, 0.7632087, 2.797903, 1, 1, 1, 1, 1,
1.740635, 1.743348, 1.743295, 1, 1, 1, 1, 1,
1.75265, 1.464975, -0.6518365, 1, 1, 1, 1, 1,
1.753068, -0.6852356, 2.983514, 0, 0, 1, 1, 1,
1.760664, 0.5219178, 1.455827, 1, 0, 0, 1, 1,
1.765504, -1.598383, 2.541153, 1, 0, 0, 1, 1,
1.780832, -0.6848673, 2.724735, 1, 0, 0, 1, 1,
1.787256, -0.1059159, 2.183865, 1, 0, 0, 1, 1,
1.799318, 0.9735765, 1.780809, 1, 0, 0, 1, 1,
1.817045, -0.4720837, 0.8804026, 0, 0, 0, 1, 1,
1.878937, 1.326095, 0.944914, 0, 0, 0, 1, 1,
1.889516, 0.09787556, 2.938704, 0, 0, 0, 1, 1,
1.89817, -0.7902056, 0.5593902, 0, 0, 0, 1, 1,
1.899621, 0.08707243, 1.156854, 0, 0, 0, 1, 1,
1.906451, 0.9784145, 1.453871, 0, 0, 0, 1, 1,
1.9119, 0.03946556, 1.044606, 0, 0, 0, 1, 1,
1.923181, 0.7665449, 0.1572122, 1, 1, 1, 1, 1,
1.925877, -2.475718, 4.479317, 1, 1, 1, 1, 1,
1.982856, -0.1464342, 2.340212, 1, 1, 1, 1, 1,
1.990631, 1.59069, -0.152209, 1, 1, 1, 1, 1,
1.991212, 0.1077515, 1.991392, 1, 1, 1, 1, 1,
1.994095, 1.079513, -0.2229973, 1, 1, 1, 1, 1,
2.008855, 1.430975, 0.1611205, 1, 1, 1, 1, 1,
2.048012, 0.1488895, -0.6082534, 1, 1, 1, 1, 1,
2.049355, 0.4570452, 1.83883, 1, 1, 1, 1, 1,
2.058608, 0.9283291, 1.313899, 1, 1, 1, 1, 1,
2.062822, -1.691071, 2.742798, 1, 1, 1, 1, 1,
2.066075, -0.3242862, -1.744288, 1, 1, 1, 1, 1,
2.103998, 0.1762509, 2.089242, 1, 1, 1, 1, 1,
2.109591, -2.875702, 2.477004, 1, 1, 1, 1, 1,
2.111099, 1.064091, 1.533371, 1, 1, 1, 1, 1,
2.130325, 1.077027, 1.652728, 0, 0, 1, 1, 1,
2.19621, -0.9361449, 3.391809, 1, 0, 0, 1, 1,
2.198986, -0.4882507, 3.080018, 1, 0, 0, 1, 1,
2.204145, 1.206383, 3.171547, 1, 0, 0, 1, 1,
2.211019, 0.7377642, 1.607077, 1, 0, 0, 1, 1,
2.222906, 2.099643, 0.5129377, 1, 0, 0, 1, 1,
2.230684, 1.413038, 1.442215, 0, 0, 0, 1, 1,
2.283012, 0.2114516, 1.395732, 0, 0, 0, 1, 1,
2.348327, 0.6093395, 0.9447377, 0, 0, 0, 1, 1,
2.348963, 0.522906, 2.810744, 0, 0, 0, 1, 1,
2.360651, 0.48902, 2.356547, 0, 0, 0, 1, 1,
2.379041, -0.5124348, 0.6176624, 0, 0, 0, 1, 1,
2.43495, -0.5841258, 1.57326, 0, 0, 0, 1, 1,
2.543256, -0.3614269, 0.8200761, 1, 1, 1, 1, 1,
2.559811, 1.324323, -0.9193156, 1, 1, 1, 1, 1,
2.571657, -1.288445, 1.392363, 1, 1, 1, 1, 1,
2.58484, 0.2279801, -0.01761193, 1, 1, 1, 1, 1,
2.65221, 0.314184, 2.226656, 1, 1, 1, 1, 1,
2.756171, -1.642315, 0.9218515, 1, 1, 1, 1, 1,
2.89297, -1.497875, 2.085793, 1, 1, 1, 1, 1
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
var radius = 9.433814;
var distance = 33.13587;
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
mvMatrix.translate( 0.04993558, -0.6271669, -0.1964364 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.13587);
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
