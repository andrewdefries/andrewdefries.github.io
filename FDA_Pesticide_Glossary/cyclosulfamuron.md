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
-3.724271, -2.671364, -1.224623, 1, 0, 0, 1,
-3.18677, -0.2545091, -1.279557, 1, 0.007843138, 0, 1,
-2.94806, 0.7934232, -2.553909, 1, 0.01176471, 0, 1,
-2.813909, -0.3378359, 0.3499463, 1, 0.01960784, 0, 1,
-2.732733, -0.1751041, -1.202521, 1, 0.02352941, 0, 1,
-2.647969, -1.204068, -2.20959, 1, 0.03137255, 0, 1,
-2.513756, -0.8300635, -2.838478, 1, 0.03529412, 0, 1,
-2.495393, -0.08133443, 0.4839607, 1, 0.04313726, 0, 1,
-2.442315, 2.539281, -0.7969409, 1, 0.04705882, 0, 1,
-2.419361, 2.272959, 0.003436832, 1, 0.05490196, 0, 1,
-2.411809, 0.1273953, -1.411988, 1, 0.05882353, 0, 1,
-2.36859, 1.146488, -1.368988, 1, 0.06666667, 0, 1,
-2.25615, -1.66696, -3.609642, 1, 0.07058824, 0, 1,
-2.250057, -2.085922, -1.482754, 1, 0.07843138, 0, 1,
-2.208343, -1.493655, -3.640193, 1, 0.08235294, 0, 1,
-2.204056, -0.8769444, -1.273509, 1, 0.09019608, 0, 1,
-2.177042, -0.6589046, -2.071734, 1, 0.09411765, 0, 1,
-2.152773, 0.390809, -2.161018, 1, 0.1019608, 0, 1,
-2.116194, -0.3803592, -3.642239, 1, 0.1098039, 0, 1,
-2.103153, -0.7764463, -2.323638, 1, 0.1137255, 0, 1,
-2.096704, -0.8026012, -2.215719, 1, 0.1215686, 0, 1,
-2.069263, 1.415546, -2.59268, 1, 0.1254902, 0, 1,
-2.054878, -0.5230487, -1.535827, 1, 0.1333333, 0, 1,
-2.054246, -1.179108, -1.956887, 1, 0.1372549, 0, 1,
-2.046387, 0.8898958, -1.345075, 1, 0.145098, 0, 1,
-2.030703, -1.066375, -1.686292, 1, 0.1490196, 0, 1,
-2.009736, -0.0966483, -0.4045943, 1, 0.1568628, 0, 1,
-2.006594, 1.439697, 0.9268185, 1, 0.1607843, 0, 1,
-2.00142, 1.60747, 0.5618558, 1, 0.1686275, 0, 1,
-1.943807, -0.3214582, -0.8406393, 1, 0.172549, 0, 1,
-1.931846, 0.6966998, -2.922452, 1, 0.1803922, 0, 1,
-1.897745, 1.223271, -1.012226, 1, 0.1843137, 0, 1,
-1.887565, -0.3761767, -1.335091, 1, 0.1921569, 0, 1,
-1.876794, 0.1405483, -1.616006, 1, 0.1960784, 0, 1,
-1.870195, -0.7954002, -0.9509173, 1, 0.2039216, 0, 1,
-1.857332, -1.575426, -2.68491, 1, 0.2117647, 0, 1,
-1.844397, 1.41526, 0.01230026, 1, 0.2156863, 0, 1,
-1.830287, 0.4523676, -0.4439841, 1, 0.2235294, 0, 1,
-1.827, 0.6429561, -0.3936459, 1, 0.227451, 0, 1,
-1.819291, -1.190528, -0.7875261, 1, 0.2352941, 0, 1,
-1.811358, 0.6120045, -0.350291, 1, 0.2392157, 0, 1,
-1.799203, 1.390348, 0.5406538, 1, 0.2470588, 0, 1,
-1.792545, -1.197427, -1.224563, 1, 0.2509804, 0, 1,
-1.775766, 0.3855129, -0.35805, 1, 0.2588235, 0, 1,
-1.714182, -1.080548, -4.009662, 1, 0.2627451, 0, 1,
-1.708226, 0.04441069, -1.883259, 1, 0.2705882, 0, 1,
-1.707615, 1.619202, -1.245442, 1, 0.2745098, 0, 1,
-1.705515, -0.02630977, -1.706588, 1, 0.282353, 0, 1,
-1.690006, 1.751021, -0.282252, 1, 0.2862745, 0, 1,
-1.685003, -0.5387111, -1.857457, 1, 0.2941177, 0, 1,
-1.667308, 0.1821227, -1.897141, 1, 0.3019608, 0, 1,
-1.648421, -1.032158, -0.4930487, 1, 0.3058824, 0, 1,
-1.639857, -1.897983, -3.105155, 1, 0.3137255, 0, 1,
-1.636452, 0.08183163, -2.331461, 1, 0.3176471, 0, 1,
-1.632474, -2.058964, -2.159822, 1, 0.3254902, 0, 1,
-1.631559, 0.7641085, -1.391016, 1, 0.3294118, 0, 1,
-1.618195, -0.4117131, -1.27898, 1, 0.3372549, 0, 1,
-1.5979, 1.402499, -0.8107639, 1, 0.3411765, 0, 1,
-1.592126, 1.174331, -0.6802417, 1, 0.3490196, 0, 1,
-1.591224, -1.870032, -2.71605, 1, 0.3529412, 0, 1,
-1.581724, -1.655108, -3.264691, 1, 0.3607843, 0, 1,
-1.57687, -0.6374801, -1.575511, 1, 0.3647059, 0, 1,
-1.574883, 1.562593, 0.7834106, 1, 0.372549, 0, 1,
-1.572372, -1.299005, -2.638265, 1, 0.3764706, 0, 1,
-1.570948, -0.3080386, -0.9813016, 1, 0.3843137, 0, 1,
-1.554836, -0.7528191, -2.131072, 1, 0.3882353, 0, 1,
-1.550177, -0.6004381, -2.274598, 1, 0.3960784, 0, 1,
-1.547226, -0.8025727, -1.625924, 1, 0.4039216, 0, 1,
-1.545119, 0.4775143, -2.08169, 1, 0.4078431, 0, 1,
-1.542267, 0.08871686, -2.573131, 1, 0.4156863, 0, 1,
-1.540686, -1.079107, -2.082304, 1, 0.4196078, 0, 1,
-1.519598, 0.240187, -2.089927, 1, 0.427451, 0, 1,
-1.515537, 1.708937, -0.5784901, 1, 0.4313726, 0, 1,
-1.495666, -0.9927655, -1.154312, 1, 0.4392157, 0, 1,
-1.491343, -0.8828944, -3.897864, 1, 0.4431373, 0, 1,
-1.490278, 1.169331, -0.2005192, 1, 0.4509804, 0, 1,
-1.484126, 0.3653598, -1.161068, 1, 0.454902, 0, 1,
-1.481662, 1.748375, -0.5211872, 1, 0.4627451, 0, 1,
-1.461187, 0.5699934, -1.138872, 1, 0.4666667, 0, 1,
-1.459503, 1.767475, -0.1208445, 1, 0.4745098, 0, 1,
-1.431844, 0.2916127, -0.1559712, 1, 0.4784314, 0, 1,
-1.425651, -0.6121139, -1.049138, 1, 0.4862745, 0, 1,
-1.408516, 0.5065791, -1.820928, 1, 0.4901961, 0, 1,
-1.405924, 1.098045, 0.01146049, 1, 0.4980392, 0, 1,
-1.3954, 0.005186854, -1.147034, 1, 0.5058824, 0, 1,
-1.393043, 0.05466413, -1.24209, 1, 0.509804, 0, 1,
-1.386351, -0.3075469, -1.514063, 1, 0.5176471, 0, 1,
-1.384392, -0.5775385, -0.1977174, 1, 0.5215687, 0, 1,
-1.379593, -1.512421, -3.933628, 1, 0.5294118, 0, 1,
-1.378784, 0.4646844, -1.022176, 1, 0.5333334, 0, 1,
-1.372555, -1.044826, -2.101165, 1, 0.5411765, 0, 1,
-1.371932, -1.275915, -2.438445, 1, 0.5450981, 0, 1,
-1.370175, 0.07078986, -0.3829516, 1, 0.5529412, 0, 1,
-1.369043, 0.805143, -0.6755326, 1, 0.5568628, 0, 1,
-1.363966, -1.114447, -2.402079, 1, 0.5647059, 0, 1,
-1.341956, -1.885216, -3.39117, 1, 0.5686275, 0, 1,
-1.339491, -1.01022, -3.361685, 1, 0.5764706, 0, 1,
-1.339222, 0.6615662, -0.6643119, 1, 0.5803922, 0, 1,
-1.335438, 1.64726, -0.6419435, 1, 0.5882353, 0, 1,
-1.334339, -0.06779986, -0.6039574, 1, 0.5921569, 0, 1,
-1.333338, 0.02338842, -0.6142446, 1, 0.6, 0, 1,
-1.328973, 0.2093492, -1.915204, 1, 0.6078432, 0, 1,
-1.322802, -0.2403769, -1.39664, 1, 0.6117647, 0, 1,
-1.315039, 1.309468, -0.9833548, 1, 0.6196079, 0, 1,
-1.308634, -0.7324213, -1.662166, 1, 0.6235294, 0, 1,
-1.30602, 0.1962831, -0.2140075, 1, 0.6313726, 0, 1,
-1.304485, -0.9939274, -0.716046, 1, 0.6352941, 0, 1,
-1.294477, 0.8326338, -2.565361, 1, 0.6431373, 0, 1,
-1.290931, 1.119403, -0.04005477, 1, 0.6470588, 0, 1,
-1.288581, 1.664021, -0.4946232, 1, 0.654902, 0, 1,
-1.285586, 0.6787791, -0.6761997, 1, 0.6588235, 0, 1,
-1.250357, -1.049461, -1.603361, 1, 0.6666667, 0, 1,
-1.225542, 0.7903207, -0.3915609, 1, 0.6705883, 0, 1,
-1.224218, -0.993147, -1.630871, 1, 0.6784314, 0, 1,
-1.224105, 0.2440137, -2.723634, 1, 0.682353, 0, 1,
-1.218889, -0.7106705, -3.826699, 1, 0.6901961, 0, 1,
-1.209583, 0.7136468, -1.285671, 1, 0.6941177, 0, 1,
-1.195782, 0.1759332, -1.982798, 1, 0.7019608, 0, 1,
-1.194964, -2.19337, -3.379882, 1, 0.7098039, 0, 1,
-1.194522, -1.446679, -2.45208, 1, 0.7137255, 0, 1,
-1.187344, -0.119595, -0.8119505, 1, 0.7215686, 0, 1,
-1.178196, 1.125959, -2.029049, 1, 0.7254902, 0, 1,
-1.177001, -0.3898187, -3.382668, 1, 0.7333333, 0, 1,
-1.169415, -0.7591748, -2.165387, 1, 0.7372549, 0, 1,
-1.165292, 0.4568827, -1.155766, 1, 0.7450981, 0, 1,
-1.159074, 1.297122, -0.5261025, 1, 0.7490196, 0, 1,
-1.153082, -0.4771971, -1.235672, 1, 0.7568628, 0, 1,
-1.144325, 1.242152, -0.535943, 1, 0.7607843, 0, 1,
-1.144218, 1.519265, -0.9901422, 1, 0.7686275, 0, 1,
-1.144143, 0.9436378, -0.2185339, 1, 0.772549, 0, 1,
-1.142392, 0.690159, -0.2446238, 1, 0.7803922, 0, 1,
-1.136962, -0.06315475, -1.738471, 1, 0.7843137, 0, 1,
-1.134848, -0.466798, -2.784436, 1, 0.7921569, 0, 1,
-1.133499, 0.8793176, -0.3050833, 1, 0.7960784, 0, 1,
-1.132099, 0.7879059, -1.173105, 1, 0.8039216, 0, 1,
-1.131149, 0.5121335, -1.204221, 1, 0.8117647, 0, 1,
-1.125333, 0.1676578, -2.305319, 1, 0.8156863, 0, 1,
-1.111373, 0.1570817, -1.48431, 1, 0.8235294, 0, 1,
-1.104344, -1.420993, -2.355966, 1, 0.827451, 0, 1,
-1.103179, -0.5947354, -4.309381, 1, 0.8352941, 0, 1,
-1.091952, 0.9635984, -1.264525, 1, 0.8392157, 0, 1,
-1.090801, 0.7710335, -2.540866, 1, 0.8470588, 0, 1,
-1.090364, -1.186663, -2.507641, 1, 0.8509804, 0, 1,
-1.080856, 0.003630462, -2.028975, 1, 0.8588235, 0, 1,
-1.075295, -0.7692719, -3.545124, 1, 0.8627451, 0, 1,
-1.070055, 1.029739, -0.8654754, 1, 0.8705882, 0, 1,
-1.067854, -1.853445, -3.484759, 1, 0.8745098, 0, 1,
-1.066866, -0.5610265, -2.252288, 1, 0.8823529, 0, 1,
-1.06441, 0.8170013, -1.588255, 1, 0.8862745, 0, 1,
-1.064072, 0.1701404, -2.760175, 1, 0.8941177, 0, 1,
-1.059981, -0.3945527, -0.7038694, 1, 0.8980392, 0, 1,
-1.052022, 0.9951596, -3.78509, 1, 0.9058824, 0, 1,
-1.033505, 1.164421, -1.605155, 1, 0.9137255, 0, 1,
-1.030792, 2.308205, -0.6194718, 1, 0.9176471, 0, 1,
-1.021342, -2.175411, -4.14819, 1, 0.9254902, 0, 1,
-1.015026, -0.7451232, -1.679616, 1, 0.9294118, 0, 1,
-1.010585, 0.4494385, -1.026501, 1, 0.9372549, 0, 1,
-1.009781, 1.662972, -0.7564421, 1, 0.9411765, 0, 1,
-1.000842, -0.9403611, -2.724738, 1, 0.9490196, 0, 1,
-0.9947063, -0.9841657, -2.740947, 1, 0.9529412, 0, 1,
-0.9938884, 0.7779049, 1.164727, 1, 0.9607843, 0, 1,
-0.9903397, -0.8463111, -2.461564, 1, 0.9647059, 0, 1,
-0.9706646, -1.439327, -3.100401, 1, 0.972549, 0, 1,
-0.965194, -2.24017, -3.143641, 1, 0.9764706, 0, 1,
-0.9379255, 0.5684243, -0.8105744, 1, 0.9843137, 0, 1,
-0.9362882, 1.635827, -1.353861, 1, 0.9882353, 0, 1,
-0.9307501, -1.10336, -1.785533, 1, 0.9960784, 0, 1,
-0.9188069, 0.05580299, 0.7264733, 0.9960784, 1, 0, 1,
-0.9114863, 0.6903433, -1.726161, 0.9921569, 1, 0, 1,
-0.9081575, -1.014672, -2.040527, 0.9843137, 1, 0, 1,
-0.9028329, -0.05763319, -0.1067585, 0.9803922, 1, 0, 1,
-0.8988622, 0.3081537, -2.224483, 0.972549, 1, 0, 1,
-0.8935429, -2.304348, -2.984882, 0.9686275, 1, 0, 1,
-0.890141, -0.7331686, -1.967411, 0.9607843, 1, 0, 1,
-0.8860355, 1.292098, 0.1661242, 0.9568627, 1, 0, 1,
-0.8855727, 1.417595, -0.6535095, 0.9490196, 1, 0, 1,
-0.8827759, -0.7660778, -2.320513, 0.945098, 1, 0, 1,
-0.878346, 0.2132834, -1.505586, 0.9372549, 1, 0, 1,
-0.8763912, -0.4276315, -3.90498, 0.9333333, 1, 0, 1,
-0.8750867, 1.185536, 0.579966, 0.9254902, 1, 0, 1,
-0.8739189, -0.1376312, -2.542339, 0.9215686, 1, 0, 1,
-0.8734642, -0.8312422, -1.690934, 0.9137255, 1, 0, 1,
-0.8711452, 0.5583848, -1.179903, 0.9098039, 1, 0, 1,
-0.8691567, -0.8770143, 0.2237563, 0.9019608, 1, 0, 1,
-0.8648065, -0.04377623, -1.349692, 0.8941177, 1, 0, 1,
-0.8646089, 1.965078, -1.776257, 0.8901961, 1, 0, 1,
-0.8570689, 1.307445, -1.427541, 0.8823529, 1, 0, 1,
-0.8547111, 0.243341, 1.343968, 0.8784314, 1, 0, 1,
-0.8540382, 1.600947, 1.558805, 0.8705882, 1, 0, 1,
-0.8481823, 1.022617, 0.2212677, 0.8666667, 1, 0, 1,
-0.8477881, 0.163947, -1.082365, 0.8588235, 1, 0, 1,
-0.8455389, 0.5831618, -1.808408, 0.854902, 1, 0, 1,
-0.8441187, 2.011092, 0.0263122, 0.8470588, 1, 0, 1,
-0.8436403, -0.751227, -2.456067, 0.8431373, 1, 0, 1,
-0.8422973, -0.7267466, -3.786555, 0.8352941, 1, 0, 1,
-0.8391954, -0.2742539, -2.118909, 0.8313726, 1, 0, 1,
-0.8369122, -0.03699133, -2.314233, 0.8235294, 1, 0, 1,
-0.8363803, 0.6155882, -1.193184, 0.8196079, 1, 0, 1,
-0.8350192, 0.2006884, -2.030679, 0.8117647, 1, 0, 1,
-0.8302665, 1.013128, -1.000103, 0.8078431, 1, 0, 1,
-0.8301311, 1.282505, -0.9291371, 0.8, 1, 0, 1,
-0.8212599, -0.2091273, -1.239541, 0.7921569, 1, 0, 1,
-0.8132629, -0.8639318, -3.502965, 0.7882353, 1, 0, 1,
-0.8130307, 1.672517, 0.702905, 0.7803922, 1, 0, 1,
-0.8120461, 0.3548853, -2.105851, 0.7764706, 1, 0, 1,
-0.8092033, 0.03856659, -1.416739, 0.7686275, 1, 0, 1,
-0.8067515, -1.324593, -1.75657, 0.7647059, 1, 0, 1,
-0.806211, -0.8027365, -2.161687, 0.7568628, 1, 0, 1,
-0.7969718, -0.03117592, -2.23862, 0.7529412, 1, 0, 1,
-0.7955632, 0.9699871, 1.225246, 0.7450981, 1, 0, 1,
-0.7945335, 0.4926062, -2.602991, 0.7411765, 1, 0, 1,
-0.7932361, -0.8494758, -2.494148, 0.7333333, 1, 0, 1,
-0.7927037, 0.2129953, -1.901726, 0.7294118, 1, 0, 1,
-0.7924684, -0.4797839, -1.496199, 0.7215686, 1, 0, 1,
-0.7883155, -0.02785026, -0.5466275, 0.7176471, 1, 0, 1,
-0.7862046, 0.6862764, -0.7209902, 0.7098039, 1, 0, 1,
-0.7813941, -1.116168, -3.104812, 0.7058824, 1, 0, 1,
-0.7777379, -0.3900875, -2.860665, 0.6980392, 1, 0, 1,
-0.7713414, 1.576679, 0.9661171, 0.6901961, 1, 0, 1,
-0.7672002, 0.2779464, -1.087158, 0.6862745, 1, 0, 1,
-0.750895, -0.5657209, -2.639274, 0.6784314, 1, 0, 1,
-0.7496634, -2.054005, -2.916723, 0.6745098, 1, 0, 1,
-0.7430885, 1.681399, -0.6577452, 0.6666667, 1, 0, 1,
-0.7423319, -0.2989628, -0.3149791, 0.6627451, 1, 0, 1,
-0.7349659, -1.771039, -2.596682, 0.654902, 1, 0, 1,
-0.7276374, 1.244279, 0.2043812, 0.6509804, 1, 0, 1,
-0.7241182, -0.3601159, -1.448969, 0.6431373, 1, 0, 1,
-0.7238172, 0.604897, -1.356089, 0.6392157, 1, 0, 1,
-0.7223201, 0.08980049, -2.657481, 0.6313726, 1, 0, 1,
-0.721454, 1.169908, -0.8624955, 0.627451, 1, 0, 1,
-0.7193421, 0.1151865, -2.129991, 0.6196079, 1, 0, 1,
-0.718873, -0.3469913, -4.028021, 0.6156863, 1, 0, 1,
-0.7118874, -0.3659139, -2.236146, 0.6078432, 1, 0, 1,
-0.7082214, 0.0466373, -2.389149, 0.6039216, 1, 0, 1,
-0.7003068, 1.388395, 1.266114, 0.5960785, 1, 0, 1,
-0.6899934, 0.9104573, -1.07389, 0.5882353, 1, 0, 1,
-0.689859, -0.7964529, -3.718395, 0.5843138, 1, 0, 1,
-0.6789152, -0.1323364, -0.4938592, 0.5764706, 1, 0, 1,
-0.6783998, 1.140795, 1.40996, 0.572549, 1, 0, 1,
-0.6776341, -1.547573, -2.598422, 0.5647059, 1, 0, 1,
-0.677348, -0.007328752, -1.225824, 0.5607843, 1, 0, 1,
-0.6683494, 0.2884945, -0.9095979, 0.5529412, 1, 0, 1,
-0.6639584, -1.33976, -3.738871, 0.5490196, 1, 0, 1,
-0.6602372, 0.6597509, -1.304067, 0.5411765, 1, 0, 1,
-0.6567436, -0.4339985, -1.816521, 0.5372549, 1, 0, 1,
-0.6544725, 1.120055, -1.1096, 0.5294118, 1, 0, 1,
-0.6526178, 1.223626, -1.554309, 0.5254902, 1, 0, 1,
-0.6517169, 1.655937, -0.859025, 0.5176471, 1, 0, 1,
-0.646118, 0.2835709, -2.937901, 0.5137255, 1, 0, 1,
-0.6457717, 0.3694527, -0.2885337, 0.5058824, 1, 0, 1,
-0.6449252, -1.363809, -2.733733, 0.5019608, 1, 0, 1,
-0.6444387, 0.7066668, -0.9180289, 0.4941176, 1, 0, 1,
-0.635565, 0.1423051, -2.067449, 0.4862745, 1, 0, 1,
-0.6320984, -1.736655, -1.522435, 0.4823529, 1, 0, 1,
-0.6274633, -1.841869, -2.430834, 0.4745098, 1, 0, 1,
-0.6241024, 1.647992, -0.1022077, 0.4705882, 1, 0, 1,
-0.6085143, -0.9071437, -1.826107, 0.4627451, 1, 0, 1,
-0.605498, 0.4195734, -1.494678, 0.4588235, 1, 0, 1,
-0.6049308, 0.1065982, -0.4642248, 0.4509804, 1, 0, 1,
-0.6047106, -1.935517, -5.106905, 0.4470588, 1, 0, 1,
-0.6039084, 1.625137, -1.218233, 0.4392157, 1, 0, 1,
-0.6009902, 0.8351933, -2.193192, 0.4352941, 1, 0, 1,
-0.6001766, 1.254023, -0.0947383, 0.427451, 1, 0, 1,
-0.5980856, 0.06910299, -0.9667044, 0.4235294, 1, 0, 1,
-0.5977222, -0.5879803, -2.361699, 0.4156863, 1, 0, 1,
-0.5946472, 0.8841882, -0.7813478, 0.4117647, 1, 0, 1,
-0.5941752, -0.1142385, -2.771413, 0.4039216, 1, 0, 1,
-0.5911837, 0.2152342, -0.8936692, 0.3960784, 1, 0, 1,
-0.5905309, 0.2841305, -1.258031, 0.3921569, 1, 0, 1,
-0.5874169, 2.13623, -1.560897, 0.3843137, 1, 0, 1,
-0.5864703, 1.346868, 0.7540889, 0.3803922, 1, 0, 1,
-0.5861608, 0.6952354, -0.2180778, 0.372549, 1, 0, 1,
-0.5791481, 0.013549, -0.8574731, 0.3686275, 1, 0, 1,
-0.5731621, 1.517072, -0.9121686, 0.3607843, 1, 0, 1,
-0.572381, -0.0806773, -1.501588, 0.3568628, 1, 0, 1,
-0.5700734, 1.972419, 0.5539165, 0.3490196, 1, 0, 1,
-0.5688214, 1.793261, 0.951636, 0.345098, 1, 0, 1,
-0.568303, -1.093946, -2.791343, 0.3372549, 1, 0, 1,
-0.5659596, 1.871705, -2.139362, 0.3333333, 1, 0, 1,
-0.5653985, -1.121116, -0.5278535, 0.3254902, 1, 0, 1,
-0.5630063, -0.6309544, -3.005068, 0.3215686, 1, 0, 1,
-0.5560598, 1.085181, -0.5613934, 0.3137255, 1, 0, 1,
-0.5458341, -0.9036389, -1.415602, 0.3098039, 1, 0, 1,
-0.5446876, 1.583051, 0.5280792, 0.3019608, 1, 0, 1,
-0.5373687, -0.08836017, -0.8475782, 0.2941177, 1, 0, 1,
-0.5355473, -0.8929721, -4.312646, 0.2901961, 1, 0, 1,
-0.5329524, -0.2957887, -2.394673, 0.282353, 1, 0, 1,
-0.5306771, -1.647325, -1.471243, 0.2784314, 1, 0, 1,
-0.5292614, -0.7530949, -4.200937, 0.2705882, 1, 0, 1,
-0.520839, 2.228147, 0.1781128, 0.2666667, 1, 0, 1,
-0.5202528, -1.371422, -2.490963, 0.2588235, 1, 0, 1,
-0.5198883, -0.7004429, -3.043023, 0.254902, 1, 0, 1,
-0.5191872, -0.917098, -2.617744, 0.2470588, 1, 0, 1,
-0.5175858, -0.5294755, -3.034587, 0.2431373, 1, 0, 1,
-0.5162635, -1.447791, -2.907746, 0.2352941, 1, 0, 1,
-0.5150439, 1.829655, 0.03651777, 0.2313726, 1, 0, 1,
-0.5111557, 0.5003042, -1.168854, 0.2235294, 1, 0, 1,
-0.5077069, -2.23094, -3.066435, 0.2196078, 1, 0, 1,
-0.5069357, 0.7183517, 0.3111776, 0.2117647, 1, 0, 1,
-0.5056377, 1.603602, -2.730783, 0.2078431, 1, 0, 1,
-0.5033817, -0.8411478, -3.404092, 0.2, 1, 0, 1,
-0.5019035, -0.9756073, -0.9573657, 0.1921569, 1, 0, 1,
-0.4938703, -0.1830097, -1.664534, 0.1882353, 1, 0, 1,
-0.4914634, -0.9155787, -1.925909, 0.1803922, 1, 0, 1,
-0.4901087, 1.285972, 0.4217614, 0.1764706, 1, 0, 1,
-0.4897675, 0.1434543, -2.175283, 0.1686275, 1, 0, 1,
-0.4887869, -1.839232, -1.405261, 0.1647059, 1, 0, 1,
-0.4884722, 1.286469, 0.1669077, 0.1568628, 1, 0, 1,
-0.4852329, 0.9187793, -0.5410731, 0.1529412, 1, 0, 1,
-0.4828727, 0.4960241, -0.4587795, 0.145098, 1, 0, 1,
-0.4827105, 1.89407, 0.1758791, 0.1411765, 1, 0, 1,
-0.4822756, 0.440486, -0.03529261, 0.1333333, 1, 0, 1,
-0.4786719, 0.4622828, -2.0959, 0.1294118, 1, 0, 1,
-0.4773555, -0.8018528, -2.012304, 0.1215686, 1, 0, 1,
-0.473804, 0.4516237, -1.851159, 0.1176471, 1, 0, 1,
-0.4716555, -0.01093098, -2.30037, 0.1098039, 1, 0, 1,
-0.4710439, 0.2971871, 0.3907013, 0.1058824, 1, 0, 1,
-0.4641159, 0.4875265, -0.2022818, 0.09803922, 1, 0, 1,
-0.4635162, -0.1444453, -0.6168088, 0.09019608, 1, 0, 1,
-0.4633037, 0.2168075, -0.3472831, 0.08627451, 1, 0, 1,
-0.4586134, 0.9198508, -0.2075055, 0.07843138, 1, 0, 1,
-0.4584368, -0.6815947, -3.232131, 0.07450981, 1, 0, 1,
-0.4559581, -0.2853312, -2.600107, 0.06666667, 1, 0, 1,
-0.4511678, 0.2585589, -2.623063, 0.0627451, 1, 0, 1,
-0.4464607, 1.163439, -1.826852, 0.05490196, 1, 0, 1,
-0.4464141, -0.4958831, -1.004739, 0.05098039, 1, 0, 1,
-0.4425014, -1.261692, -2.692967, 0.04313726, 1, 0, 1,
-0.4419246, 2.069938, -0.6563216, 0.03921569, 1, 0, 1,
-0.4401257, -0.583766, -4.425717, 0.03137255, 1, 0, 1,
-0.4379973, -0.2762333, -3.037201, 0.02745098, 1, 0, 1,
-0.4356669, -0.6262713, -2.580213, 0.01960784, 1, 0, 1,
-0.4313698, 0.3762669, -1.026076, 0.01568628, 1, 0, 1,
-0.4270917, 0.9295021, -0.8611755, 0.007843138, 1, 0, 1,
-0.4238186, 1.532432, 0.3388218, 0.003921569, 1, 0, 1,
-0.4190859, 1.562485, -1.075357, 0, 1, 0.003921569, 1,
-0.4188514, 0.4637432, -2.186454, 0, 1, 0.01176471, 1,
-0.4176722, -1.176285, -2.850662, 0, 1, 0.01568628, 1,
-0.4160668, 1.002503, 0.4529751, 0, 1, 0.02352941, 1,
-0.4068266, 0.1907639, -4.198755, 0, 1, 0.02745098, 1,
-0.4035009, 0.1339377, -2.385344, 0, 1, 0.03529412, 1,
-0.3948087, -1.005661, -2.10713, 0, 1, 0.03921569, 1,
-0.394739, -0.382802, -2.54656, 0, 1, 0.04705882, 1,
-0.3922491, -0.1712544, -3.285107, 0, 1, 0.05098039, 1,
-0.3907608, -0.9116727, -2.101607, 0, 1, 0.05882353, 1,
-0.3876115, 1.139018, -0.3096419, 0, 1, 0.0627451, 1,
-0.3865377, 0.6496375, -1.080485, 0, 1, 0.07058824, 1,
-0.3844357, 0.996694, 0.1030243, 0, 1, 0.07450981, 1,
-0.3815263, 1.106308, -0.3944159, 0, 1, 0.08235294, 1,
-0.3799215, 1.152927, 0.1083759, 0, 1, 0.08627451, 1,
-0.3763151, 0.9508113, 0.4625792, 0, 1, 0.09411765, 1,
-0.3753065, 0.1006189, -1.962318, 0, 1, 0.1019608, 1,
-0.3745821, 0.02557231, -1.972579, 0, 1, 0.1058824, 1,
-0.367713, -1.113606, -3.446101, 0, 1, 0.1137255, 1,
-0.3673881, 0.2698478, -0.9610186, 0, 1, 0.1176471, 1,
-0.3661708, 0.3345477, -2.629997, 0, 1, 0.1254902, 1,
-0.3619471, -0.0414867, -3.756729, 0, 1, 0.1294118, 1,
-0.3597212, 0.1382069, -0.5038776, 0, 1, 0.1372549, 1,
-0.3562455, -1.405447, -2.464774, 0, 1, 0.1411765, 1,
-0.3546417, -0.2041217, -2.134049, 0, 1, 0.1490196, 1,
-0.3540214, -1.890575, -2.267176, 0, 1, 0.1529412, 1,
-0.3526351, 1.558968, 0.3678841, 0, 1, 0.1607843, 1,
-0.349681, -1.411538, -1.33925, 0, 1, 0.1647059, 1,
-0.3436662, 1.124698, 0.4559876, 0, 1, 0.172549, 1,
-0.343049, -1.1722, -3.726872, 0, 1, 0.1764706, 1,
-0.3420933, 1.339177, -1.469699, 0, 1, 0.1843137, 1,
-0.3396113, -0.9904532, -2.930543, 0, 1, 0.1882353, 1,
-0.3383309, 0.1219631, -2.088124, 0, 1, 0.1960784, 1,
-0.3380277, 0.1503561, -1.548917, 0, 1, 0.2039216, 1,
-0.337513, 0.09403919, -0.1987968, 0, 1, 0.2078431, 1,
-0.3314426, -0.5163561, -2.432683, 0, 1, 0.2156863, 1,
-0.3281123, 1.319553, 0.6005415, 0, 1, 0.2196078, 1,
-0.3279451, -0.2268211, -2.648157, 0, 1, 0.227451, 1,
-0.3264551, 1.491062, -3.132941, 0, 1, 0.2313726, 1,
-0.3254071, -0.9940548, -3.190458, 0, 1, 0.2392157, 1,
-0.3252975, -0.2317287, -3.110949, 0, 1, 0.2431373, 1,
-0.3218615, -1.275953, -3.924959, 0, 1, 0.2509804, 1,
-0.3162624, 1.111404, 0.2545658, 0, 1, 0.254902, 1,
-0.3142019, -0.1844739, -4.31615, 0, 1, 0.2627451, 1,
-0.3092842, 1.194231, -1.093016, 0, 1, 0.2666667, 1,
-0.3071647, -0.4585296, -1.204141, 0, 1, 0.2745098, 1,
-0.3035275, 2.451137, 0.5014368, 0, 1, 0.2784314, 1,
-0.3016355, -1.267856, -3.395839, 0, 1, 0.2862745, 1,
-0.299446, -0.4287143, -2.99744, 0, 1, 0.2901961, 1,
-0.2986565, 0.3543159, -0.7326427, 0, 1, 0.2980392, 1,
-0.297302, -0.2290715, -2.739278, 0, 1, 0.3058824, 1,
-0.2950228, -1.188078, -3.186996, 0, 1, 0.3098039, 1,
-0.2807653, -0.03108617, -1.270745, 0, 1, 0.3176471, 1,
-0.2800245, 0.9320202, -0.1924686, 0, 1, 0.3215686, 1,
-0.2787714, 2.069802, 0.0160241, 0, 1, 0.3294118, 1,
-0.2760808, -0.338461, -5.009613, 0, 1, 0.3333333, 1,
-0.2751372, 0.190169, -0.7907892, 0, 1, 0.3411765, 1,
-0.2683881, 0.22707, 0.3703626, 0, 1, 0.345098, 1,
-0.2673525, -1.575904, -2.915494, 0, 1, 0.3529412, 1,
-0.2659558, -0.07584371, -0.2978304, 0, 1, 0.3568628, 1,
-0.2612186, -0.3490008, -1.411414, 0, 1, 0.3647059, 1,
-0.2602881, -0.6484529, -2.220819, 0, 1, 0.3686275, 1,
-0.2550134, 0.02646439, -1.629216, 0, 1, 0.3764706, 1,
-0.2501451, -0.6402964, -2.030197, 0, 1, 0.3803922, 1,
-0.2490563, 1.564374, -0.01517725, 0, 1, 0.3882353, 1,
-0.2489054, -0.7861274, -2.665835, 0, 1, 0.3921569, 1,
-0.2463686, -0.2164748, -2.837019, 0, 1, 0.4, 1,
-0.2451144, -0.8758473, -3.121346, 0, 1, 0.4078431, 1,
-0.2450065, -0.6420289, -0.9171823, 0, 1, 0.4117647, 1,
-0.2426978, -0.5604324, -2.395463, 0, 1, 0.4196078, 1,
-0.2425608, 1.371575, -0.04864062, 0, 1, 0.4235294, 1,
-0.2417293, 1.014878, -0.1615635, 0, 1, 0.4313726, 1,
-0.2375132, 1.414379, -1.913409, 0, 1, 0.4352941, 1,
-0.2344737, 1.19383, -0.6550293, 0, 1, 0.4431373, 1,
-0.2327424, -1.699596, -2.075573, 0, 1, 0.4470588, 1,
-0.2317012, 1.313716, 0.6539293, 0, 1, 0.454902, 1,
-0.227753, 0.01412029, -1.653965, 0, 1, 0.4588235, 1,
-0.2244171, -1.21934, -1.901241, 0, 1, 0.4666667, 1,
-0.220395, -1.075578, -1.236947, 0, 1, 0.4705882, 1,
-0.2182113, -0.6609007, -2.761765, 0, 1, 0.4784314, 1,
-0.2175088, 0.1310165, -2.396769, 0, 1, 0.4823529, 1,
-0.2161425, 1.098373, -1.074767, 0, 1, 0.4901961, 1,
-0.2160255, 2.419689, -0.3971933, 0, 1, 0.4941176, 1,
-0.2091903, 0.7361894, -0.5897358, 0, 1, 0.5019608, 1,
-0.2078299, 0.08910512, -2.021008, 0, 1, 0.509804, 1,
-0.2039443, -0.5305069, -3.619982, 0, 1, 0.5137255, 1,
-0.2034702, 0.8105177, 0.07868905, 0, 1, 0.5215687, 1,
-0.1988875, 1.110241, 0.3591344, 0, 1, 0.5254902, 1,
-0.19718, -1.315224, -3.957635, 0, 1, 0.5333334, 1,
-0.1941652, 0.8976114, -1.467346, 0, 1, 0.5372549, 1,
-0.1937311, -0.5330958, -3.243833, 0, 1, 0.5450981, 1,
-0.1894384, -1.687648, -1.153021, 0, 1, 0.5490196, 1,
-0.1857848, 0.2924606, -1.121906, 0, 1, 0.5568628, 1,
-0.1790676, -0.3021978, -2.681965, 0, 1, 0.5607843, 1,
-0.1760454, -0.7870552, -1.079499, 0, 1, 0.5686275, 1,
-0.1755767, -0.3678697, -1.040086, 0, 1, 0.572549, 1,
-0.1741607, 2.562768, -1.420335, 0, 1, 0.5803922, 1,
-0.164919, 0.05360456, -2.931343, 0, 1, 0.5843138, 1,
-0.1640589, 0.2570011, 1.435477, 0, 1, 0.5921569, 1,
-0.1516422, 0.1429027, -1.919764, 0, 1, 0.5960785, 1,
-0.1486345, 3.786841, -1.89826, 0, 1, 0.6039216, 1,
-0.1481524, -0.917075, -3.54378, 0, 1, 0.6117647, 1,
-0.1460058, 0.04391139, -2.119942, 0, 1, 0.6156863, 1,
-0.1456553, 0.5651465, 0.5095569, 0, 1, 0.6235294, 1,
-0.1446945, -1.356581, -0.9764245, 0, 1, 0.627451, 1,
-0.1433927, -1.455129, -3.808558, 0, 1, 0.6352941, 1,
-0.142529, -0.8151803, -2.37065, 0, 1, 0.6392157, 1,
-0.1396042, -0.09317802, -4.27859, 0, 1, 0.6470588, 1,
-0.1392369, -0.01536181, -0.4873874, 0, 1, 0.6509804, 1,
-0.1372316, -1.504912, -3.850686, 0, 1, 0.6588235, 1,
-0.1348668, 0.8044657, -0.5826778, 0, 1, 0.6627451, 1,
-0.1322609, -0.2819027, -3.644644, 0, 1, 0.6705883, 1,
-0.1287377, -1.122648, -5.042263, 0, 1, 0.6745098, 1,
-0.1244765, -2.679925, -0.9417798, 0, 1, 0.682353, 1,
-0.123732, 1.083657, -0.01212711, 0, 1, 0.6862745, 1,
-0.1236723, -0.5581558, -2.230905, 0, 1, 0.6941177, 1,
-0.1235439, 1.097365, 0.6964057, 0, 1, 0.7019608, 1,
-0.1217288, -1.810563, -3.429336, 0, 1, 0.7058824, 1,
-0.1161485, -0.9848506, -2.378555, 0, 1, 0.7137255, 1,
-0.1148447, 0.5193592, -0.6022688, 0, 1, 0.7176471, 1,
-0.1104473, -0.2572393, -2.260185, 0, 1, 0.7254902, 1,
-0.1096861, 1.898423, -0.3593939, 0, 1, 0.7294118, 1,
-0.1062508, -0.1525649, -3.664994, 0, 1, 0.7372549, 1,
-0.1058551, 1.271565, -0.2755875, 0, 1, 0.7411765, 1,
-0.1048776, -1.892745, -1.32099, 0, 1, 0.7490196, 1,
-0.100293, -0.2318828, -1.651365, 0, 1, 0.7529412, 1,
-0.1001323, 0.3981668, 0.08317211, 0, 1, 0.7607843, 1,
-0.09862469, 2.444336, 1.91942, 0, 1, 0.7647059, 1,
-0.0981398, 0.2006524, -0.06754439, 0, 1, 0.772549, 1,
-0.09739543, -0.1229658, -3.643232, 0, 1, 0.7764706, 1,
-0.09190197, 0.3600948, -2.058106, 0, 1, 0.7843137, 1,
-0.08999002, 1.121876, 0.3957407, 0, 1, 0.7882353, 1,
-0.08885487, 1.160055, 0.5755323, 0, 1, 0.7960784, 1,
-0.08592378, 0.5958643, -0.06492472, 0, 1, 0.8039216, 1,
-0.08234204, -0.8335731, -3.360025, 0, 1, 0.8078431, 1,
-0.07956834, 0.03862131, -2.383728, 0, 1, 0.8156863, 1,
-0.07802813, 0.3353961, -0.187822, 0, 1, 0.8196079, 1,
-0.07427397, -0.9076591, -2.306424, 0, 1, 0.827451, 1,
-0.07419144, -0.0906406, -3.695535, 0, 1, 0.8313726, 1,
-0.07266335, 2.250189, 0.5244488, 0, 1, 0.8392157, 1,
-0.07091983, 0.4635476, 1.540968, 0, 1, 0.8431373, 1,
-0.07009912, -0.7934934, -1.877972, 0, 1, 0.8509804, 1,
-0.06601617, -1.101916, -3.728815, 0, 1, 0.854902, 1,
-0.05904531, -0.551635, -2.084304, 0, 1, 0.8627451, 1,
-0.05775256, 0.04173876, -0.2003905, 0, 1, 0.8666667, 1,
-0.04961946, 0.5963451, 0.1917751, 0, 1, 0.8745098, 1,
-0.04958061, 0.2961695, -0.6925017, 0, 1, 0.8784314, 1,
-0.04605885, 1.340491, -1.188164, 0, 1, 0.8862745, 1,
-0.04329045, 1.231694, -1.046653, 0, 1, 0.8901961, 1,
-0.04225665, -1.117584, -2.229329, 0, 1, 0.8980392, 1,
-0.04075803, -1.695747, -4.090149, 0, 1, 0.9058824, 1,
-0.03884782, -1.236265, -2.078662, 0, 1, 0.9098039, 1,
-0.03571418, 1.012715, -0.8640801, 0, 1, 0.9176471, 1,
-0.03504638, 1.072815, -0.4252546, 0, 1, 0.9215686, 1,
-0.03323245, -0.02347974, -2.047778, 0, 1, 0.9294118, 1,
-0.02888503, -1.367319, -4.003341, 0, 1, 0.9333333, 1,
-0.02588281, -0.8591559, -2.775832, 0, 1, 0.9411765, 1,
-0.02585661, 0.9705947, -0.5474566, 0, 1, 0.945098, 1,
-0.02441379, 2.317238, -0.2142105, 0, 1, 0.9529412, 1,
-0.02258241, 0.2248195, -1.238715, 0, 1, 0.9568627, 1,
-0.01184633, 0.8690028, 0.5825006, 0, 1, 0.9647059, 1,
-0.01174317, -1.563404, -2.687081, 0, 1, 0.9686275, 1,
-0.01132854, -0.4204116, -3.88757, 0, 1, 0.9764706, 1,
-0.0109294, -0.1927275, -1.297014, 0, 1, 0.9803922, 1,
-0.006489017, 1.423155, -0.6873069, 0, 1, 0.9882353, 1,
-0.003949447, -1.245389, -1.777462, 0, 1, 0.9921569, 1,
-0.003013459, 1.346583, 1.134109, 0, 1, 1, 1,
-0.002982681, -0.501613, -3.505591, 0, 0.9921569, 1, 1,
-0.002160117, 0.5183022, 0.9668453, 0, 0.9882353, 1, 1,
0.001608245, 0.5574545, 0.1888491, 0, 0.9803922, 1, 1,
0.003313053, 0.06385137, 1.317839, 0, 0.9764706, 1, 1,
0.003895965, -0.07844606, 2.701655, 0, 0.9686275, 1, 1,
0.005154203, -1.236264, 4.163356, 0, 0.9647059, 1, 1,
0.005646431, -1.75882, 1.105959, 0, 0.9568627, 1, 1,
0.0056957, -0.7338416, 3.650929, 0, 0.9529412, 1, 1,
0.007524421, 0.5422845, -1.098275, 0, 0.945098, 1, 1,
0.01168075, 1.422905, -0.3340469, 0, 0.9411765, 1, 1,
0.01405099, 0.6600071, -0.832067, 0, 0.9333333, 1, 1,
0.01409602, -0.7159779, 3.410261, 0, 0.9294118, 1, 1,
0.01649905, 0.05680436, -0.965273, 0, 0.9215686, 1, 1,
0.0176542, 0.6460497, -1.709302, 0, 0.9176471, 1, 1,
0.01822744, 0.2384346, -0.7945355, 0, 0.9098039, 1, 1,
0.0185381, -0.07785067, 3.288585, 0, 0.9058824, 1, 1,
0.02296396, -0.7561302, 4.229437, 0, 0.8980392, 1, 1,
0.02387312, -0.1083082, 2.933608, 0, 0.8901961, 1, 1,
0.02430128, 0.1605495, 1.097131, 0, 0.8862745, 1, 1,
0.02446288, -2.262469, 4.570021, 0, 0.8784314, 1, 1,
0.02741781, 0.2411159, -0.8550317, 0, 0.8745098, 1, 1,
0.02959423, -0.3453792, 1.869485, 0, 0.8666667, 1, 1,
0.03048608, 0.2886514, -1.072587, 0, 0.8627451, 1, 1,
0.04413011, 0.3264262, 0.4410059, 0, 0.854902, 1, 1,
0.0446343, 0.4809912, -1.383468, 0, 0.8509804, 1, 1,
0.04644715, -0.012613, 0.2740518, 0, 0.8431373, 1, 1,
0.04929056, -0.2123505, 3.908504, 0, 0.8392157, 1, 1,
0.05161788, -0.1012123, 2.246869, 0, 0.8313726, 1, 1,
0.05335432, 0.2818749, 0.4791968, 0, 0.827451, 1, 1,
0.05366861, 2.267341, -0.167963, 0, 0.8196079, 1, 1,
0.05618025, 1.410951, 0.9617375, 0, 0.8156863, 1, 1,
0.05703693, 0.2812425, -1.288751, 0, 0.8078431, 1, 1,
0.0626651, 0.2431497, 1.55326, 0, 0.8039216, 1, 1,
0.06476576, -0.7051597, 4.183641, 0, 0.7960784, 1, 1,
0.06648369, 1.239637, 1.291046, 0, 0.7882353, 1, 1,
0.06782443, 0.4819964, 0.7043648, 0, 0.7843137, 1, 1,
0.06814165, -0.02284327, 2.380471, 0, 0.7764706, 1, 1,
0.06878927, 0.09520742, 0.9697106, 0, 0.772549, 1, 1,
0.07245612, -1.018137, 2.550725, 0, 0.7647059, 1, 1,
0.09027893, 0.4632466, 0.4950629, 0, 0.7607843, 1, 1,
0.09384917, 0.2477893, 0.4455799, 0, 0.7529412, 1, 1,
0.09779857, 1.765317, 0.6677268, 0, 0.7490196, 1, 1,
0.1018495, -0.3876351, 2.067722, 0, 0.7411765, 1, 1,
0.1047567, -0.4381873, 1.760934, 0, 0.7372549, 1, 1,
0.1068653, -0.5659198, 2.728012, 0, 0.7294118, 1, 1,
0.1085872, -0.4148596, 3.039946, 0, 0.7254902, 1, 1,
0.1124184, 1.086404, 0.654909, 0, 0.7176471, 1, 1,
0.118363, -1.102363, 2.746751, 0, 0.7137255, 1, 1,
0.1364833, -1.798368, 2.850255, 0, 0.7058824, 1, 1,
0.1392552, -0.5416321, 2.827639, 0, 0.6980392, 1, 1,
0.14345, 1.03805, -0.521029, 0, 0.6941177, 1, 1,
0.1440933, -0.03198637, 3.079714, 0, 0.6862745, 1, 1,
0.1449043, 0.7254739, 1.347246, 0, 0.682353, 1, 1,
0.1463768, 0.02999918, 1.395637, 0, 0.6745098, 1, 1,
0.1465994, -0.2249079, 4.569794, 0, 0.6705883, 1, 1,
0.1470926, 1.280987, -1.35091, 0, 0.6627451, 1, 1,
0.149175, 1.252387, 1.727101, 0, 0.6588235, 1, 1,
0.150435, -1.908389, 3.970392, 0, 0.6509804, 1, 1,
0.1505095, -0.7476923, 4.318089, 0, 0.6470588, 1, 1,
0.1507362, -0.915298, 4.183953, 0, 0.6392157, 1, 1,
0.1577522, -0.06169377, 1.834538, 0, 0.6352941, 1, 1,
0.1593844, 0.5079645, 2.440672, 0, 0.627451, 1, 1,
0.1609124, 0.2820717, 2.381086, 0, 0.6235294, 1, 1,
0.1649798, -0.7002823, 2.241117, 0, 0.6156863, 1, 1,
0.167164, 0.1448917, 0.3209878, 0, 0.6117647, 1, 1,
0.1694751, -0.07029615, 0.5817018, 0, 0.6039216, 1, 1,
0.1721924, 1.413798, 0.6677802, 0, 0.5960785, 1, 1,
0.1756849, 1.350697, -0.3140412, 0, 0.5921569, 1, 1,
0.1805962, 0.3355267, -0.04872411, 0, 0.5843138, 1, 1,
0.1815947, 0.311381, 2.14068, 0, 0.5803922, 1, 1,
0.1818892, 1.727316, 0.3008282, 0, 0.572549, 1, 1,
0.1992102, 0.2697481, 1.420499, 0, 0.5686275, 1, 1,
0.2006343, -0.716162, 2.985063, 0, 0.5607843, 1, 1,
0.2007939, -0.5516269, 3.445966, 0, 0.5568628, 1, 1,
0.202196, -1.065361, 3.590852, 0, 0.5490196, 1, 1,
0.2029135, 0.1410556, 0.5902225, 0, 0.5450981, 1, 1,
0.2050781, -0.3060831, 1.013749, 0, 0.5372549, 1, 1,
0.2080469, 0.2420817, -0.2811834, 0, 0.5333334, 1, 1,
0.2082655, -1.515694, 3.685463, 0, 0.5254902, 1, 1,
0.2132446, 2.258246, 0.1567749, 0, 0.5215687, 1, 1,
0.2138364, 0.05083589, 2.277558, 0, 0.5137255, 1, 1,
0.214888, -0.5541806, 4.719503, 0, 0.509804, 1, 1,
0.2151487, -1.579596, 2.907495, 0, 0.5019608, 1, 1,
0.2175396, -0.5445111, 2.861362, 0, 0.4941176, 1, 1,
0.2250111, 0.3178334, 0.7109282, 0, 0.4901961, 1, 1,
0.2255753, 1.034603, -0.3540069, 0, 0.4823529, 1, 1,
0.2272553, -0.3157936, 3.459815, 0, 0.4784314, 1, 1,
0.2301643, 2.731033, -0.3489265, 0, 0.4705882, 1, 1,
0.2349985, 0.4435389, 0.03331895, 0, 0.4666667, 1, 1,
0.2386991, 2.395609, 1.392521, 0, 0.4588235, 1, 1,
0.2457297, 1.247728, 0.5702235, 0, 0.454902, 1, 1,
0.2463599, -1.201762, 2.168854, 0, 0.4470588, 1, 1,
0.2487666, 0.4555389, -0.5164771, 0, 0.4431373, 1, 1,
0.2542524, -0.9987031, 2.475195, 0, 0.4352941, 1, 1,
0.2584879, -0.1363751, 2.547328, 0, 0.4313726, 1, 1,
0.2644901, -1.271023, 2.951896, 0, 0.4235294, 1, 1,
0.2665293, 0.2305305, 1.650763, 0, 0.4196078, 1, 1,
0.268057, -0.9653907, 2.880459, 0, 0.4117647, 1, 1,
0.2748227, -0.2739379, 2.926425, 0, 0.4078431, 1, 1,
0.2755968, 0.1521996, 0.699275, 0, 0.4, 1, 1,
0.2840784, 2.351392, -0.3542536, 0, 0.3921569, 1, 1,
0.2872419, -0.7551265, 4.094974, 0, 0.3882353, 1, 1,
0.2872654, 1.850515, -0.2071457, 0, 0.3803922, 1, 1,
0.2877309, 0.8485772, 0.359864, 0, 0.3764706, 1, 1,
0.2897419, 0.1391485, 1.416698, 0, 0.3686275, 1, 1,
0.2915501, 0.4028191, -0.6934435, 0, 0.3647059, 1, 1,
0.2924651, 2.372916, -0.3055251, 0, 0.3568628, 1, 1,
0.2927268, 1.145594, -0.3984929, 0, 0.3529412, 1, 1,
0.2953183, 0.8810484, 0.3952934, 0, 0.345098, 1, 1,
0.2953444, 2.02444, 0.7650046, 0, 0.3411765, 1, 1,
0.3015833, 0.2038098, 1.009935, 0, 0.3333333, 1, 1,
0.30622, -0.7998557, 2.766085, 0, 0.3294118, 1, 1,
0.3083237, -0.3370297, 3.577104, 0, 0.3215686, 1, 1,
0.3084267, -1.59541, 3.595057, 0, 0.3176471, 1, 1,
0.3093943, 0.07784616, 1.833722, 0, 0.3098039, 1, 1,
0.3135739, 0.2304344, 0.4148954, 0, 0.3058824, 1, 1,
0.3162, -0.152817, 1.518428, 0, 0.2980392, 1, 1,
0.3163858, -0.3610608, 2.248971, 0, 0.2901961, 1, 1,
0.3196587, 0.3390597, 0.6523621, 0, 0.2862745, 1, 1,
0.3233552, -0.2710834, 0.7554987, 0, 0.2784314, 1, 1,
0.3253193, 1.788612, 0.8569531, 0, 0.2745098, 1, 1,
0.3265671, 0.3181609, 2.140803, 0, 0.2666667, 1, 1,
0.3273373, 2.679161, -0.7687248, 0, 0.2627451, 1, 1,
0.3319651, 0.3424935, -0.6944186, 0, 0.254902, 1, 1,
0.3333811, -1.080963, 3.330314, 0, 0.2509804, 1, 1,
0.3387752, -1.514544, 2.969489, 0, 0.2431373, 1, 1,
0.3389768, -1.063039, 3.264632, 0, 0.2392157, 1, 1,
0.3443779, -0.9494377, 4.252707, 0, 0.2313726, 1, 1,
0.3499717, 0.8274876, 0.8514526, 0, 0.227451, 1, 1,
0.3528795, -0.06730792, 0.06595961, 0, 0.2196078, 1, 1,
0.3534589, 0.2182935, 2.832117, 0, 0.2156863, 1, 1,
0.3541906, 0.5549467, -1.656239, 0, 0.2078431, 1, 1,
0.3544878, 0.458579, -1.618281, 0, 0.2039216, 1, 1,
0.3549051, 0.03020411, 2.200799, 0, 0.1960784, 1, 1,
0.3580736, 0.8033739, 0.3053786, 0, 0.1882353, 1, 1,
0.3733594, 1.285959, 0.08259826, 0, 0.1843137, 1, 1,
0.3787233, 1.198185, -1.079079, 0, 0.1764706, 1, 1,
0.38048, 2.023538, 1.412639, 0, 0.172549, 1, 1,
0.3814203, -0.1192887, 1.95602, 0, 0.1647059, 1, 1,
0.3828247, -0.5493287, 2.782158, 0, 0.1607843, 1, 1,
0.3864309, -2.484363, 2.477425, 0, 0.1529412, 1, 1,
0.3889011, 2.277724, -0.09223126, 0, 0.1490196, 1, 1,
0.3941406, -1.060017, 3.457608, 0, 0.1411765, 1, 1,
0.3942211, 0.1085237, 0.3603352, 0, 0.1372549, 1, 1,
0.3944034, -0.9414189, 2.080442, 0, 0.1294118, 1, 1,
0.4007626, 1.42907, -0.3853191, 0, 0.1254902, 1, 1,
0.4017743, 0.6538252, 0.1186841, 0, 0.1176471, 1, 1,
0.4097878, -0.2654797, 4.642284, 0, 0.1137255, 1, 1,
0.4141044, -0.08475605, 3.620532, 0, 0.1058824, 1, 1,
0.4142953, -0.1384554, 2.49484, 0, 0.09803922, 1, 1,
0.4148523, -1.768222, 2.909482, 0, 0.09411765, 1, 1,
0.4148958, 0.2185182, 2.903435, 0, 0.08627451, 1, 1,
0.4161507, -0.3575312, 1.927592, 0, 0.08235294, 1, 1,
0.4170092, 1.606261, 2.002975, 0, 0.07450981, 1, 1,
0.4215939, 0.9858072, 1.997985, 0, 0.07058824, 1, 1,
0.4326871, -0.01658411, 1.789264, 0, 0.0627451, 1, 1,
0.4345535, 0.6740001, 0.487175, 0, 0.05882353, 1, 1,
0.4349242, -0.2082936, 2.577721, 0, 0.05098039, 1, 1,
0.4419452, -2.847189, 2.673178, 0, 0.04705882, 1, 1,
0.4433787, -0.5873139, 1.887932, 0, 0.03921569, 1, 1,
0.4485587, -0.7146064, 1.932774, 0, 0.03529412, 1, 1,
0.4491268, -0.4011065, 0.9600557, 0, 0.02745098, 1, 1,
0.4504472, 0.674279, 0.9382478, 0, 0.02352941, 1, 1,
0.452655, -0.08614642, 2.178864, 0, 0.01568628, 1, 1,
0.4545965, 0.5818571, -0.8124746, 0, 0.01176471, 1, 1,
0.4597327, -0.8937406, 1.63253, 0, 0.003921569, 1, 1,
0.4607654, -0.3347126, 1.821759, 0.003921569, 0, 1, 1,
0.46499, -1.432985, 0.9553826, 0.007843138, 0, 1, 1,
0.4673053, 1.365188, 1.055542, 0.01568628, 0, 1, 1,
0.4698219, 2.536655, 0.5148256, 0.01960784, 0, 1, 1,
0.4724824, 1.102103, -0.2682374, 0.02745098, 0, 1, 1,
0.4736115, 0.3822174, 0.2266341, 0.03137255, 0, 1, 1,
0.4786371, -0.1954236, 5.100622, 0.03921569, 0, 1, 1,
0.4788315, -0.1555008, 1.721769, 0.04313726, 0, 1, 1,
0.4789706, -1.564426, 3.201965, 0.05098039, 0, 1, 1,
0.4805498, 0.6346555, 1.403428, 0.05490196, 0, 1, 1,
0.4807382, 0.5678629, 0.2269468, 0.0627451, 0, 1, 1,
0.4877498, -0.3525715, 3.053015, 0.06666667, 0, 1, 1,
0.4892855, 0.4305884, -1.20002, 0.07450981, 0, 1, 1,
0.4897332, 0.4739892, 2.961232, 0.07843138, 0, 1, 1,
0.4942032, 1.562081, -0.3774881, 0.08627451, 0, 1, 1,
0.4990219, 1.672268, 0.02328693, 0.09019608, 0, 1, 1,
0.5005661, -2.474191, 2.186663, 0.09803922, 0, 1, 1,
0.5029945, -0.2095568, 0.7648342, 0.1058824, 0, 1, 1,
0.505748, -0.2783628, 2.44473, 0.1098039, 0, 1, 1,
0.5092852, 1.435166, -0.3513899, 0.1176471, 0, 1, 1,
0.5095874, 1.162523, 0.02926772, 0.1215686, 0, 1, 1,
0.5131259, -2.165446, 2.362777, 0.1294118, 0, 1, 1,
0.5146928, 2.471117, 1.911563, 0.1333333, 0, 1, 1,
0.5158876, 0.439024, -0.670117, 0.1411765, 0, 1, 1,
0.5176017, 0.4283118, 0.2178012, 0.145098, 0, 1, 1,
0.5178347, 0.03117819, -0.4194048, 0.1529412, 0, 1, 1,
0.5178435, -0.2526931, 1.547804, 0.1568628, 0, 1, 1,
0.5206612, 0.09794616, 2.136699, 0.1647059, 0, 1, 1,
0.5253581, 1.294779, -0.1302619, 0.1686275, 0, 1, 1,
0.5274534, 0.2201401, 0.4570718, 0.1764706, 0, 1, 1,
0.5285109, -1.199783, 3.823777, 0.1803922, 0, 1, 1,
0.5287691, -0.6834735, 4.164962, 0.1882353, 0, 1, 1,
0.5305156, 0.2867965, 0.1097752, 0.1921569, 0, 1, 1,
0.5305699, -0.5544523, 0.09720565, 0.2, 0, 1, 1,
0.5444078, -0.01713046, 1.435877, 0.2078431, 0, 1, 1,
0.544548, 0.6844552, 1.323678, 0.2117647, 0, 1, 1,
0.5451361, -0.3313158, 1.005551, 0.2196078, 0, 1, 1,
0.5452634, -0.2103047, 2.662456, 0.2235294, 0, 1, 1,
0.5469731, 0.8219232, 1.638928, 0.2313726, 0, 1, 1,
0.5481505, -0.521318, 4.034887, 0.2352941, 0, 1, 1,
0.555338, -1.227078, 2.858325, 0.2431373, 0, 1, 1,
0.5556194, -0.0359779, 0.65903, 0.2470588, 0, 1, 1,
0.5618308, 0.5817665, 0.2877373, 0.254902, 0, 1, 1,
0.5703322, -0.8964592, 2.192724, 0.2588235, 0, 1, 1,
0.5713054, -0.1130298, 1.272993, 0.2666667, 0, 1, 1,
0.5741381, 0.05218163, 2.693592, 0.2705882, 0, 1, 1,
0.5741875, -0.8548751, 1.261764, 0.2784314, 0, 1, 1,
0.5742691, -0.2721246, 1.283515, 0.282353, 0, 1, 1,
0.5748652, 0.4540485, 0.8765815, 0.2901961, 0, 1, 1,
0.5806447, 1.930857, 0.4135956, 0.2941177, 0, 1, 1,
0.5819647, 0.1027235, 1.068576, 0.3019608, 0, 1, 1,
0.5883542, 0.5069774, 2.236641, 0.3098039, 0, 1, 1,
0.5953274, 0.4931578, 2.346997, 0.3137255, 0, 1, 1,
0.5973222, -0.2152639, 0.9729376, 0.3215686, 0, 1, 1,
0.5980536, -2.179974, 3.359205, 0.3254902, 0, 1, 1,
0.5997592, 0.4657031, 1.789533, 0.3333333, 0, 1, 1,
0.6006833, 0.9112471, 0.564583, 0.3372549, 0, 1, 1,
0.6012154, 0.05559202, 1.397016, 0.345098, 0, 1, 1,
0.6032792, -0.5926649, 1.905635, 0.3490196, 0, 1, 1,
0.6040137, 1.046689, 1.713593, 0.3568628, 0, 1, 1,
0.6058574, 1.67075, 0.9662568, 0.3607843, 0, 1, 1,
0.6059366, -0.4275748, 2.195131, 0.3686275, 0, 1, 1,
0.6066727, -1.195887, 2.014495, 0.372549, 0, 1, 1,
0.620859, -0.8570232, 0.8947023, 0.3803922, 0, 1, 1,
0.6234153, -0.3395066, 3.882975, 0.3843137, 0, 1, 1,
0.6293987, 0.2903248, 1.188641, 0.3921569, 0, 1, 1,
0.6310386, 0.9801247, 1.269382, 0.3960784, 0, 1, 1,
0.638725, 0.2530799, -0.1278254, 0.4039216, 0, 1, 1,
0.64373, 1.239448, 1.408494, 0.4117647, 0, 1, 1,
0.6447616, -0.2714806, 1.396093, 0.4156863, 0, 1, 1,
0.6602411, 3.092628, 0.1222448, 0.4235294, 0, 1, 1,
0.6684098, -1.100649, 0.5603869, 0.427451, 0, 1, 1,
0.6685045, -1.086389, 2.240019, 0.4352941, 0, 1, 1,
0.6752368, -0.5252502, 2.386966, 0.4392157, 0, 1, 1,
0.678346, 0.8123356, 0.7206843, 0.4470588, 0, 1, 1,
0.6822097, -0.2555268, 2.001445, 0.4509804, 0, 1, 1,
0.6840194, 0.6765031, 0.4733688, 0.4588235, 0, 1, 1,
0.6852224, -0.7144909, 1.924883, 0.4627451, 0, 1, 1,
0.6908459, 1.237534, 1.676509, 0.4705882, 0, 1, 1,
0.6913602, -1.107943, 2.75189, 0.4745098, 0, 1, 1,
0.7022341, -0.01448535, 0.3728281, 0.4823529, 0, 1, 1,
0.7074384, -1.315577, 2.342963, 0.4862745, 0, 1, 1,
0.7087936, -0.6000243, 2.50617, 0.4941176, 0, 1, 1,
0.711579, -0.3649899, 1.506809, 0.5019608, 0, 1, 1,
0.7170868, -0.3322578, 1.778626, 0.5058824, 0, 1, 1,
0.7255999, 1.599363, 1.652699, 0.5137255, 0, 1, 1,
0.7268357, -0.4691493, 3.510375, 0.5176471, 0, 1, 1,
0.7300677, 0.01339726, 1.416517, 0.5254902, 0, 1, 1,
0.7307251, 0.5366992, -1.148354, 0.5294118, 0, 1, 1,
0.7309256, -0.3755374, 2.087069, 0.5372549, 0, 1, 1,
0.7315467, -1.530529, 3.012498, 0.5411765, 0, 1, 1,
0.7363006, -0.4347422, 3.95488, 0.5490196, 0, 1, 1,
0.7366007, -1.473404, 2.42726, 0.5529412, 0, 1, 1,
0.7375392, -1.898147, 3.184074, 0.5607843, 0, 1, 1,
0.7449707, -2.47782, 0.8730241, 0.5647059, 0, 1, 1,
0.7469516, -0.5615534, 2.843499, 0.572549, 0, 1, 1,
0.7478434, 0.2665419, 1.190625, 0.5764706, 0, 1, 1,
0.7532262, -1.068985, -0.09531744, 0.5843138, 0, 1, 1,
0.7579454, 1.514189, 0.6927432, 0.5882353, 0, 1, 1,
0.7586516, 0.562218, 1.046643, 0.5960785, 0, 1, 1,
0.759221, -1.157935, 1.897832, 0.6039216, 0, 1, 1,
0.7594302, 0.513099, 2.738961, 0.6078432, 0, 1, 1,
0.7649894, 1.249984, 1.125005, 0.6156863, 0, 1, 1,
0.7738627, 0.617761, 0.9512724, 0.6196079, 0, 1, 1,
0.778505, 0.3316703, 1.91663, 0.627451, 0, 1, 1,
0.7847015, -2.088423, 2.580524, 0.6313726, 0, 1, 1,
0.7866877, 1.52729, 2.159189, 0.6392157, 0, 1, 1,
0.7878885, -0.2603065, 1.910557, 0.6431373, 0, 1, 1,
0.7914054, 1.212123, -0.103694, 0.6509804, 0, 1, 1,
0.7946666, 0.7920547, -0.2136179, 0.654902, 0, 1, 1,
0.7979109, -1.640762, 3.499465, 0.6627451, 0, 1, 1,
0.7989423, -1.132439, 2.846202, 0.6666667, 0, 1, 1,
0.8025899, 0.4414482, 0.524063, 0.6745098, 0, 1, 1,
0.8051597, 1.008439, -1.537518, 0.6784314, 0, 1, 1,
0.8112969, -1.149442, 2.035393, 0.6862745, 0, 1, 1,
0.8188843, -1.398798, 2.883576, 0.6901961, 0, 1, 1,
0.8221458, -0.7800349, 3.626553, 0.6980392, 0, 1, 1,
0.8301048, -0.1274966, 2.44488, 0.7058824, 0, 1, 1,
0.8326107, -1.206431, 2.070827, 0.7098039, 0, 1, 1,
0.8346913, 0.5506915, 1.218621, 0.7176471, 0, 1, 1,
0.838631, -2.403004, 2.379136, 0.7215686, 0, 1, 1,
0.8428783, -0.3627071, 3.430475, 0.7294118, 0, 1, 1,
0.8431855, 0.9018705, 2.356745, 0.7333333, 0, 1, 1,
0.8432442, 0.6447267, -0.3583767, 0.7411765, 0, 1, 1,
0.8446013, -0.7711455, -0.15241, 0.7450981, 0, 1, 1,
0.8450662, -0.02640563, 2.284537, 0.7529412, 0, 1, 1,
0.8475732, -0.5191838, 3.739597, 0.7568628, 0, 1, 1,
0.8499407, -0.7656574, 3.64341, 0.7647059, 0, 1, 1,
0.8505285, 0.06283371, 0.07783525, 0.7686275, 0, 1, 1,
0.850735, 1.36087, 1.595102, 0.7764706, 0, 1, 1,
0.8509383, -0.04550528, 1.597408, 0.7803922, 0, 1, 1,
0.8517063, -0.9663845, 2.758464, 0.7882353, 0, 1, 1,
0.8602047, -0.556073, 0.9458338, 0.7921569, 0, 1, 1,
0.866693, -0.6876377, 3.45374, 0.8, 0, 1, 1,
0.8668558, 1.356974, 0.39047, 0.8078431, 0, 1, 1,
0.869681, 1.468719, -2.252324, 0.8117647, 0, 1, 1,
0.8755593, 0.1179932, 0.6780503, 0.8196079, 0, 1, 1,
0.8786298, -0.7123735, 1.680136, 0.8235294, 0, 1, 1,
0.8830295, -2.420089, 3.18138, 0.8313726, 0, 1, 1,
0.8836578, 0.04538126, 0.7928914, 0.8352941, 0, 1, 1,
0.8900676, 0.7428322, 1.553596, 0.8431373, 0, 1, 1,
0.8908008, -0.7732729, 0.6202481, 0.8470588, 0, 1, 1,
0.8956133, 0.7604769, -1.338148, 0.854902, 0, 1, 1,
0.8960555, -1.24878, 2.973838, 0.8588235, 0, 1, 1,
0.8961459, 0.3120233, 0.2806481, 0.8666667, 0, 1, 1,
0.9051005, -1.415897, 2.123242, 0.8705882, 0, 1, 1,
0.9227123, 0.459704, 0.7920399, 0.8784314, 0, 1, 1,
0.9245898, 1.497124, -0.2679292, 0.8823529, 0, 1, 1,
0.925153, -1.314686, 4.966625, 0.8901961, 0, 1, 1,
0.9278661, -1.188398, 1.108411, 0.8941177, 0, 1, 1,
0.9296879, 2.274793, -0.3610144, 0.9019608, 0, 1, 1,
0.929736, 1.167507, 1.426048, 0.9098039, 0, 1, 1,
0.9337668, 0.5403079, 0.9951772, 0.9137255, 0, 1, 1,
0.9338551, -1.016637, 0.721047, 0.9215686, 0, 1, 1,
0.9357964, 1.089751, 1.40726, 0.9254902, 0, 1, 1,
0.937277, 0.3007628, 0.6755678, 0.9333333, 0, 1, 1,
0.9382675, -0.8826166, 3.365449, 0.9372549, 0, 1, 1,
0.9411168, -0.2111076, 1.817147, 0.945098, 0, 1, 1,
0.9425624, -1.687697, 1.484734, 0.9490196, 0, 1, 1,
0.9433568, -1.491513, 3.49819, 0.9568627, 0, 1, 1,
0.9434586, 1.253312, 2.0192, 0.9607843, 0, 1, 1,
0.9481282, 0.9374373, 1.580411, 0.9686275, 0, 1, 1,
0.9484617, 0.8214806, -1.080765, 0.972549, 0, 1, 1,
0.9510441, 0.3556389, 1.36584, 0.9803922, 0, 1, 1,
0.9559041, -0.4677989, 1.659723, 0.9843137, 0, 1, 1,
0.9635898, -1.239912, 0.7171835, 0.9921569, 0, 1, 1,
0.9668193, -1.192126, 1.544583, 0.9960784, 0, 1, 1,
0.9758624, 1.313817, 0.1603874, 1, 0, 0.9960784, 1,
0.9773113, 0.2913837, 3.144387, 1, 0, 0.9882353, 1,
0.9793829, -0.604674, 0.3537807, 1, 0, 0.9843137, 1,
0.98063, 2.461085, 0.2578259, 1, 0, 0.9764706, 1,
0.9869521, 1.751952, -0.4091966, 1, 0, 0.972549, 1,
0.9936103, 0.218891, 1.212813, 1, 0, 0.9647059, 1,
0.9942003, 1.359384, 0.8191683, 1, 0, 0.9607843, 1,
0.9967171, 1.072749, 0.2750742, 1, 0, 0.9529412, 1,
1.009877, 0.5516177, 0.6506418, 1, 0, 0.9490196, 1,
1.014608, 1.077648, 0.9499004, 1, 0, 0.9411765, 1,
1.014824, 0.1844529, 0.9382815, 1, 0, 0.9372549, 1,
1.017336, 1.315321, -0.7350188, 1, 0, 0.9294118, 1,
1.020806, -0.6540782, 2.826578, 1, 0, 0.9254902, 1,
1.02145, -0.6298288, 3.280876, 1, 0, 0.9176471, 1,
1.027314, 0.2161241, 1.835767, 1, 0, 0.9137255, 1,
1.027901, 0.04092913, 0.8205232, 1, 0, 0.9058824, 1,
1.032142, -0.5405744, 3.445288, 1, 0, 0.9019608, 1,
1.032885, -1.189654, 1.657581, 1, 0, 0.8941177, 1,
1.03839, -1.164396, 1.275337, 1, 0, 0.8862745, 1,
1.045035, -0.03102374, 1.441009, 1, 0, 0.8823529, 1,
1.048605, -0.7224853, 2.597955, 1, 0, 0.8745098, 1,
1.057066, 2.372501, 1.40222, 1, 0, 0.8705882, 1,
1.058224, -0.6176561, 2.025994, 1, 0, 0.8627451, 1,
1.067862, -0.3241913, 1.209103, 1, 0, 0.8588235, 1,
1.070579, -0.4142322, 2.571277, 1, 0, 0.8509804, 1,
1.073959, 0.3084401, 0.7236543, 1, 0, 0.8470588, 1,
1.076647, 0.1868244, 1.278534, 1, 0, 0.8392157, 1,
1.077107, 0.07203056, 0.8809657, 1, 0, 0.8352941, 1,
1.07756, 0.5360981, 0.8441694, 1, 0, 0.827451, 1,
1.083179, -0.5724454, 1.56179, 1, 0, 0.8235294, 1,
1.091926, -1.294261, 4.334692, 1, 0, 0.8156863, 1,
1.092236, 1.075149, 0.03277689, 1, 0, 0.8117647, 1,
1.092718, 0.8316079, 0.6321834, 1, 0, 0.8039216, 1,
1.093137, 1.099578, 2.364829, 1, 0, 0.7960784, 1,
1.093443, -1.197128, 0.9938128, 1, 0, 0.7921569, 1,
1.099583, -0.1680216, 2.315412, 1, 0, 0.7843137, 1,
1.100776, -0.3312549, 0.9813713, 1, 0, 0.7803922, 1,
1.126016, -0.4120314, 0.8092742, 1, 0, 0.772549, 1,
1.129786, 0.4523392, 0.258844, 1, 0, 0.7686275, 1,
1.137943, 0.5160816, -0.5302143, 1, 0, 0.7607843, 1,
1.139327, -1.299304, 2.781738, 1, 0, 0.7568628, 1,
1.140227, -0.2628347, 3.233909, 1, 0, 0.7490196, 1,
1.143515, -0.4441961, 1.902832, 1, 0, 0.7450981, 1,
1.149379, -1.011596, 1.651619, 1, 0, 0.7372549, 1,
1.151583, 0.8925467, 0.3618408, 1, 0, 0.7333333, 1,
1.154439, 0.5497462, -0.2061821, 1, 0, 0.7254902, 1,
1.159142, -0.928749, 2.32213, 1, 0, 0.7215686, 1,
1.160959, 0.1984264, 0.7244967, 1, 0, 0.7137255, 1,
1.168968, 1.071207, 2.130117, 1, 0, 0.7098039, 1,
1.172966, -0.06295893, 2.288812, 1, 0, 0.7019608, 1,
1.188139, 0.1848659, -0.3814853, 1, 0, 0.6941177, 1,
1.210512, 0.2125928, -0.3726584, 1, 0, 0.6901961, 1,
1.229915, 0.0769609, 1.622487, 1, 0, 0.682353, 1,
1.230845, 1.086241, 0.1145574, 1, 0, 0.6784314, 1,
1.233628, -1.385288, 2.836489, 1, 0, 0.6705883, 1,
1.242097, -1.841323, 5.485395, 1, 0, 0.6666667, 1,
1.262443, 1.156228, 0.5454639, 1, 0, 0.6588235, 1,
1.264031, 0.3363219, 1.786628, 1, 0, 0.654902, 1,
1.269761, 0.9423156, 2.25867, 1, 0, 0.6470588, 1,
1.27297, 1.094195, -0.2671278, 1, 0, 0.6431373, 1,
1.276508, -1.977981, 2.403833, 1, 0, 0.6352941, 1,
1.284814, 1.422393, 1.066828, 1, 0, 0.6313726, 1,
1.28754, 0.7998704, 2.184326, 1, 0, 0.6235294, 1,
1.290272, 0.3098387, -0.1053058, 1, 0, 0.6196079, 1,
1.324754, 0.1702142, 1.732314, 1, 0, 0.6117647, 1,
1.329441, 2.577645, -0.4566628, 1, 0, 0.6078432, 1,
1.329752, 1.295126, 1.58146, 1, 0, 0.6, 1,
1.329798, 0.224467, -0.111597, 1, 0, 0.5921569, 1,
1.332356, 0.5791166, 0.6441706, 1, 0, 0.5882353, 1,
1.337218, -1.619511, 3.545553, 1, 0, 0.5803922, 1,
1.341365, -1.68749, 3.834697, 1, 0, 0.5764706, 1,
1.346369, 0.1441869, 3.073862, 1, 0, 0.5686275, 1,
1.349243, -0.8457515, 1.098342, 1, 0, 0.5647059, 1,
1.349997, -0.7187958, 2.706076, 1, 0, 0.5568628, 1,
1.35708, -0.8216417, 1.906449, 1, 0, 0.5529412, 1,
1.358327, 0.5217559, 1.128096, 1, 0, 0.5450981, 1,
1.365043, -1.617411, 1.695867, 1, 0, 0.5411765, 1,
1.371677, 0.05448655, 3.113028, 1, 0, 0.5333334, 1,
1.374566, 0.4146157, 1.981053, 1, 0, 0.5294118, 1,
1.385456, -0.761272, 1.369299, 1, 0, 0.5215687, 1,
1.390244, 0.03733983, 2.048236, 1, 0, 0.5176471, 1,
1.392952, 0.8567532, 1.482212, 1, 0, 0.509804, 1,
1.407389, 0.729118, 0.57781, 1, 0, 0.5058824, 1,
1.409608, 1.676604, 1.070971, 1, 0, 0.4980392, 1,
1.413274, -1.789737, 3.011478, 1, 0, 0.4901961, 1,
1.414322, 0.5812311, 1.250588, 1, 0, 0.4862745, 1,
1.416622, 0.1917, 2.491347, 1, 0, 0.4784314, 1,
1.420016, 0.2569987, 1.959546, 1, 0, 0.4745098, 1,
1.421546, -0.3694858, 1.217287, 1, 0, 0.4666667, 1,
1.423072, -1.68502, 3.076867, 1, 0, 0.4627451, 1,
1.423846, 0.8241733, -0.7255794, 1, 0, 0.454902, 1,
1.426041, 0.8873833, 1.219033, 1, 0, 0.4509804, 1,
1.430403, -0.5511206, 0.9553224, 1, 0, 0.4431373, 1,
1.432616, -0.294258, 0.8818781, 1, 0, 0.4392157, 1,
1.434358, -0.5218906, 2.239535, 1, 0, 0.4313726, 1,
1.438455, -1.866901, 1.40407, 1, 0, 0.427451, 1,
1.441262, -0.6286512, 2.441876, 1, 0, 0.4196078, 1,
1.448409, 0.8520454, 2.123638, 1, 0, 0.4156863, 1,
1.460562, 0.7458808, 1.753376, 1, 0, 0.4078431, 1,
1.471484, 0.1669289, 0.4709304, 1, 0, 0.4039216, 1,
1.486048, -1.34346, 3.697784, 1, 0, 0.3960784, 1,
1.534289, -0.6563872, 0.2973484, 1, 0, 0.3882353, 1,
1.549125, 0.4172346, 1.64302, 1, 0, 0.3843137, 1,
1.549725, 0.2668289, 1.184186, 1, 0, 0.3764706, 1,
1.553311, 0.7123298, 0.781248, 1, 0, 0.372549, 1,
1.558, 0.05083151, 1.135088, 1, 0, 0.3647059, 1,
1.563438, -0.8558003, 1.668386, 1, 0, 0.3607843, 1,
1.565638, -0.6504272, 2.899232, 1, 0, 0.3529412, 1,
1.567878, -0.1421408, 2.451234, 1, 0, 0.3490196, 1,
1.57097, 0.05839551, 2.44231, 1, 0, 0.3411765, 1,
1.583451, 1.124938, 0.7391969, 1, 0, 0.3372549, 1,
1.589791, 0.5541095, 2.264208, 1, 0, 0.3294118, 1,
1.592028, 1.718283, 0.3496224, 1, 0, 0.3254902, 1,
1.596257, 0.4666631, 0.791922, 1, 0, 0.3176471, 1,
1.605232, 0.1744476, -0.1159569, 1, 0, 0.3137255, 1,
1.606783, 0.6970022, -0.2055579, 1, 0, 0.3058824, 1,
1.612889, 0.7999917, -1.290424, 1, 0, 0.2980392, 1,
1.630213, 0.2889501, -0.6352111, 1, 0, 0.2941177, 1,
1.643718, 0.7234538, 0.5467316, 1, 0, 0.2862745, 1,
1.679536, 0.02453581, 1.640043, 1, 0, 0.282353, 1,
1.690545, -0.3841322, 1.443404, 1, 0, 0.2745098, 1,
1.732212, 0.8478341, 1.630928, 1, 0, 0.2705882, 1,
1.738638, -2.043094, 2.313262, 1, 0, 0.2627451, 1,
1.765061, 1.06206, 1.086254, 1, 0, 0.2588235, 1,
1.767026, -0.0177931, 2.210561, 1, 0, 0.2509804, 1,
1.776782, -0.9591137, 1.271353, 1, 0, 0.2470588, 1,
1.790635, 1.394144, -1.178106, 1, 0, 0.2392157, 1,
1.807244, -0.7607145, -0.2523129, 1, 0, 0.2352941, 1,
1.854384, -0.1733111, -0.1660527, 1, 0, 0.227451, 1,
1.858354, -0.6586155, 0.8900488, 1, 0, 0.2235294, 1,
1.879378, -0.2619076, 0.1398833, 1, 0, 0.2156863, 1,
1.914054, 1.793961, 1.538566, 1, 0, 0.2117647, 1,
1.917168, -1.227272, 2.801104, 1, 0, 0.2039216, 1,
1.917934, -0.2903746, 1.484431, 1, 0, 0.1960784, 1,
1.925078, -0.1187, 0.9613935, 1, 0, 0.1921569, 1,
1.949642, -0.9568848, 1.812364, 1, 0, 0.1843137, 1,
1.988275, -1.074428, 0.7894796, 1, 0, 0.1803922, 1,
2.036609, -1.588464, 1.790913, 1, 0, 0.172549, 1,
2.038707, 0.7582344, 4.465435, 1, 0, 0.1686275, 1,
2.05605, 0.394618, 2.014835, 1, 0, 0.1607843, 1,
2.086337, 0.8857499, -0.01189507, 1, 0, 0.1568628, 1,
2.094011, 0.5120707, 1.807282, 1, 0, 0.1490196, 1,
2.118329, -2.300749, 2.609554, 1, 0, 0.145098, 1,
2.119642, -0.2379856, 0.7953994, 1, 0, 0.1372549, 1,
2.141468, 0.1748513, 1.899511, 1, 0, 0.1333333, 1,
2.172026, 2.009088, -0.1468517, 1, 0, 0.1254902, 1,
2.174663, 0.01651027, 2.166477, 1, 0, 0.1215686, 1,
2.177738, -0.8266079, 2.102871, 1, 0, 0.1137255, 1,
2.20843, -1.27381, 0.1992568, 1, 0, 0.1098039, 1,
2.22326, -2.261511, 3.568263, 1, 0, 0.1019608, 1,
2.225902, 0.1363706, 1.521264, 1, 0, 0.09411765, 1,
2.22718, 0.6834942, 1.801468, 1, 0, 0.09019608, 1,
2.244112, -1.501994, 1.915515, 1, 0, 0.08235294, 1,
2.251535, -0.3326543, 0.6238432, 1, 0, 0.07843138, 1,
2.284429, -0.2950041, 2.494145, 1, 0, 0.07058824, 1,
2.302679, 0.1928429, 2.707608, 1, 0, 0.06666667, 1,
2.309086, -1.595254, 3.33959, 1, 0, 0.05882353, 1,
2.319838, 0.047235, 1.56969, 1, 0, 0.05490196, 1,
2.333039, 0.1848648, 1.548103, 1, 0, 0.04705882, 1,
2.339915, 0.4227925, 2.724648, 1, 0, 0.04313726, 1,
2.445843, -0.7512752, 2.656675, 1, 0, 0.03529412, 1,
2.648637, -0.147208, 1.323637, 1, 0, 0.03137255, 1,
2.723656, -0.2025593, 3.218375, 1, 0, 0.02352941, 1,
2.847625, -2.410406, 2.37183, 1, 0, 0.01960784, 1,
3.258416, 0.6096527, 0.8407223, 1, 0, 0.01176471, 1,
3.294479, -2.402599, 0.9162544, 1, 0, 0.007843138, 1
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
-0.2148956, -3.971657, -6.902299, 0, -0.5, 0.5, 0.5,
-0.2148956, -3.971657, -6.902299, 1, -0.5, 0.5, 0.5,
-0.2148956, -3.971657, -6.902299, 1, 1.5, 0.5, 0.5,
-0.2148956, -3.971657, -6.902299, 0, 1.5, 0.5, 0.5
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
-4.913949, 0.4698259, -6.902299, 0, -0.5, 0.5, 0.5,
-4.913949, 0.4698259, -6.902299, 1, -0.5, 0.5, 0.5,
-4.913949, 0.4698259, -6.902299, 1, 1.5, 0.5, 0.5,
-4.913949, 0.4698259, -6.902299, 0, 1.5, 0.5, 0.5
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
-4.913949, -3.971657, 0.1892452, 0, -0.5, 0.5, 0.5,
-4.913949, -3.971657, 0.1892452, 1, -0.5, 0.5, 0.5,
-4.913949, -3.971657, 0.1892452, 1, 1.5, 0.5, 0.5,
-4.913949, -3.971657, 0.1892452, 0, 1.5, 0.5, 0.5
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
-2, -2.946699, -5.265789,
2, -2.946699, -5.265789,
-2, -2.946699, -5.265789,
-2, -3.117526, -5.538541,
0, -2.946699, -5.265789,
0, -3.117526, -5.538541,
2, -2.946699, -5.265789,
2, -3.117526, -5.538541
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
-2, -3.459178, -6.084044, 0, -0.5, 0.5, 0.5,
-2, -3.459178, -6.084044, 1, -0.5, 0.5, 0.5,
-2, -3.459178, -6.084044, 1, 1.5, 0.5, 0.5,
-2, -3.459178, -6.084044, 0, 1.5, 0.5, 0.5,
0, -3.459178, -6.084044, 0, -0.5, 0.5, 0.5,
0, -3.459178, -6.084044, 1, -0.5, 0.5, 0.5,
0, -3.459178, -6.084044, 1, 1.5, 0.5, 0.5,
0, -3.459178, -6.084044, 0, 1.5, 0.5, 0.5,
2, -3.459178, -6.084044, 0, -0.5, 0.5, 0.5,
2, -3.459178, -6.084044, 1, -0.5, 0.5, 0.5,
2, -3.459178, -6.084044, 1, 1.5, 0.5, 0.5,
2, -3.459178, -6.084044, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.829552, -2, -5.265789,
-3.829552, 3, -5.265789,
-3.829552, -2, -5.265789,
-4.010284, -2, -5.538541,
-3.829552, -1, -5.265789,
-4.010284, -1, -5.538541,
-3.829552, 0, -5.265789,
-4.010284, 0, -5.538541,
-3.829552, 1, -5.265789,
-4.010284, 1, -5.538541,
-3.829552, 2, -5.265789,
-4.010284, 2, -5.538541,
-3.829552, 3, -5.265789,
-4.010284, 3, -5.538541
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
-4.37175, -2, -6.084044, 0, -0.5, 0.5, 0.5,
-4.37175, -2, -6.084044, 1, -0.5, 0.5, 0.5,
-4.37175, -2, -6.084044, 1, 1.5, 0.5, 0.5,
-4.37175, -2, -6.084044, 0, 1.5, 0.5, 0.5,
-4.37175, -1, -6.084044, 0, -0.5, 0.5, 0.5,
-4.37175, -1, -6.084044, 1, -0.5, 0.5, 0.5,
-4.37175, -1, -6.084044, 1, 1.5, 0.5, 0.5,
-4.37175, -1, -6.084044, 0, 1.5, 0.5, 0.5,
-4.37175, 0, -6.084044, 0, -0.5, 0.5, 0.5,
-4.37175, 0, -6.084044, 1, -0.5, 0.5, 0.5,
-4.37175, 0, -6.084044, 1, 1.5, 0.5, 0.5,
-4.37175, 0, -6.084044, 0, 1.5, 0.5, 0.5,
-4.37175, 1, -6.084044, 0, -0.5, 0.5, 0.5,
-4.37175, 1, -6.084044, 1, -0.5, 0.5, 0.5,
-4.37175, 1, -6.084044, 1, 1.5, 0.5, 0.5,
-4.37175, 1, -6.084044, 0, 1.5, 0.5, 0.5,
-4.37175, 2, -6.084044, 0, -0.5, 0.5, 0.5,
-4.37175, 2, -6.084044, 1, -0.5, 0.5, 0.5,
-4.37175, 2, -6.084044, 1, 1.5, 0.5, 0.5,
-4.37175, 2, -6.084044, 0, 1.5, 0.5, 0.5,
-4.37175, 3, -6.084044, 0, -0.5, 0.5, 0.5,
-4.37175, 3, -6.084044, 1, -0.5, 0.5, 0.5,
-4.37175, 3, -6.084044, 1, 1.5, 0.5, 0.5,
-4.37175, 3, -6.084044, 0, 1.5, 0.5, 0.5
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
-3.829552, -2.946699, -4,
-3.829552, -2.946699, 4,
-3.829552, -2.946699, -4,
-4.010284, -3.117526, -4,
-3.829552, -2.946699, -2,
-4.010284, -3.117526, -2,
-3.829552, -2.946699, 0,
-4.010284, -3.117526, 0,
-3.829552, -2.946699, 2,
-4.010284, -3.117526, 2,
-3.829552, -2.946699, 4,
-4.010284, -3.117526, 4
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
-4.37175, -3.459178, -4, 0, -0.5, 0.5, 0.5,
-4.37175, -3.459178, -4, 1, -0.5, 0.5, 0.5,
-4.37175, -3.459178, -4, 1, 1.5, 0.5, 0.5,
-4.37175, -3.459178, -4, 0, 1.5, 0.5, 0.5,
-4.37175, -3.459178, -2, 0, -0.5, 0.5, 0.5,
-4.37175, -3.459178, -2, 1, -0.5, 0.5, 0.5,
-4.37175, -3.459178, -2, 1, 1.5, 0.5, 0.5,
-4.37175, -3.459178, -2, 0, 1.5, 0.5, 0.5,
-4.37175, -3.459178, 0, 0, -0.5, 0.5, 0.5,
-4.37175, -3.459178, 0, 1, -0.5, 0.5, 0.5,
-4.37175, -3.459178, 0, 1, 1.5, 0.5, 0.5,
-4.37175, -3.459178, 0, 0, 1.5, 0.5, 0.5,
-4.37175, -3.459178, 2, 0, -0.5, 0.5, 0.5,
-4.37175, -3.459178, 2, 1, -0.5, 0.5, 0.5,
-4.37175, -3.459178, 2, 1, 1.5, 0.5, 0.5,
-4.37175, -3.459178, 2, 0, 1.5, 0.5, 0.5,
-4.37175, -3.459178, 4, 0, -0.5, 0.5, 0.5,
-4.37175, -3.459178, 4, 1, -0.5, 0.5, 0.5,
-4.37175, -3.459178, 4, 1, 1.5, 0.5, 0.5,
-4.37175, -3.459178, 4, 0, 1.5, 0.5, 0.5
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
-3.829552, -2.946699, -5.265789,
-3.829552, 3.886351, -5.265789,
-3.829552, -2.946699, 5.644279,
-3.829552, 3.886351, 5.644279,
-3.829552, -2.946699, -5.265789,
-3.829552, -2.946699, 5.644279,
-3.829552, 3.886351, -5.265789,
-3.829552, 3.886351, 5.644279,
-3.829552, -2.946699, -5.265789,
3.399761, -2.946699, -5.265789,
-3.829552, -2.946699, 5.644279,
3.399761, -2.946699, 5.644279,
-3.829552, 3.886351, -5.265789,
3.399761, 3.886351, -5.265789,
-3.829552, 3.886351, 5.644279,
3.399761, 3.886351, 5.644279,
3.399761, -2.946699, -5.265789,
3.399761, 3.886351, -5.265789,
3.399761, -2.946699, 5.644279,
3.399761, 3.886351, 5.644279,
3.399761, -2.946699, -5.265789,
3.399761, -2.946699, 5.644279,
3.399761, 3.886351, -5.265789,
3.399761, 3.886351, 5.644279
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
var radius = 7.883824;
var distance = 35.07602;
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
mvMatrix.translate( 0.2148956, -0.4698259, -0.1892452 );
mvMatrix.scale( 1.179109, 1.247487, 0.7813099 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.07602);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
cyclosulfamuron<-read.table("cyclosulfamuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cyclosulfamuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'cyclosulfamuron' not found
```

```r
y<-cyclosulfamuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'cyclosulfamuron' not found
```

```r
z<-cyclosulfamuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'cyclosulfamuron' not found
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
-3.724271, -2.671364, -1.224623, 0, 0, 1, 1, 1,
-3.18677, -0.2545091, -1.279557, 1, 0, 0, 1, 1,
-2.94806, 0.7934232, -2.553909, 1, 0, 0, 1, 1,
-2.813909, -0.3378359, 0.3499463, 1, 0, 0, 1, 1,
-2.732733, -0.1751041, -1.202521, 1, 0, 0, 1, 1,
-2.647969, -1.204068, -2.20959, 1, 0, 0, 1, 1,
-2.513756, -0.8300635, -2.838478, 0, 0, 0, 1, 1,
-2.495393, -0.08133443, 0.4839607, 0, 0, 0, 1, 1,
-2.442315, 2.539281, -0.7969409, 0, 0, 0, 1, 1,
-2.419361, 2.272959, 0.003436832, 0, 0, 0, 1, 1,
-2.411809, 0.1273953, -1.411988, 0, 0, 0, 1, 1,
-2.36859, 1.146488, -1.368988, 0, 0, 0, 1, 1,
-2.25615, -1.66696, -3.609642, 0, 0, 0, 1, 1,
-2.250057, -2.085922, -1.482754, 1, 1, 1, 1, 1,
-2.208343, -1.493655, -3.640193, 1, 1, 1, 1, 1,
-2.204056, -0.8769444, -1.273509, 1, 1, 1, 1, 1,
-2.177042, -0.6589046, -2.071734, 1, 1, 1, 1, 1,
-2.152773, 0.390809, -2.161018, 1, 1, 1, 1, 1,
-2.116194, -0.3803592, -3.642239, 1, 1, 1, 1, 1,
-2.103153, -0.7764463, -2.323638, 1, 1, 1, 1, 1,
-2.096704, -0.8026012, -2.215719, 1, 1, 1, 1, 1,
-2.069263, 1.415546, -2.59268, 1, 1, 1, 1, 1,
-2.054878, -0.5230487, -1.535827, 1, 1, 1, 1, 1,
-2.054246, -1.179108, -1.956887, 1, 1, 1, 1, 1,
-2.046387, 0.8898958, -1.345075, 1, 1, 1, 1, 1,
-2.030703, -1.066375, -1.686292, 1, 1, 1, 1, 1,
-2.009736, -0.0966483, -0.4045943, 1, 1, 1, 1, 1,
-2.006594, 1.439697, 0.9268185, 1, 1, 1, 1, 1,
-2.00142, 1.60747, 0.5618558, 0, 0, 1, 1, 1,
-1.943807, -0.3214582, -0.8406393, 1, 0, 0, 1, 1,
-1.931846, 0.6966998, -2.922452, 1, 0, 0, 1, 1,
-1.897745, 1.223271, -1.012226, 1, 0, 0, 1, 1,
-1.887565, -0.3761767, -1.335091, 1, 0, 0, 1, 1,
-1.876794, 0.1405483, -1.616006, 1, 0, 0, 1, 1,
-1.870195, -0.7954002, -0.9509173, 0, 0, 0, 1, 1,
-1.857332, -1.575426, -2.68491, 0, 0, 0, 1, 1,
-1.844397, 1.41526, 0.01230026, 0, 0, 0, 1, 1,
-1.830287, 0.4523676, -0.4439841, 0, 0, 0, 1, 1,
-1.827, 0.6429561, -0.3936459, 0, 0, 0, 1, 1,
-1.819291, -1.190528, -0.7875261, 0, 0, 0, 1, 1,
-1.811358, 0.6120045, -0.350291, 0, 0, 0, 1, 1,
-1.799203, 1.390348, 0.5406538, 1, 1, 1, 1, 1,
-1.792545, -1.197427, -1.224563, 1, 1, 1, 1, 1,
-1.775766, 0.3855129, -0.35805, 1, 1, 1, 1, 1,
-1.714182, -1.080548, -4.009662, 1, 1, 1, 1, 1,
-1.708226, 0.04441069, -1.883259, 1, 1, 1, 1, 1,
-1.707615, 1.619202, -1.245442, 1, 1, 1, 1, 1,
-1.705515, -0.02630977, -1.706588, 1, 1, 1, 1, 1,
-1.690006, 1.751021, -0.282252, 1, 1, 1, 1, 1,
-1.685003, -0.5387111, -1.857457, 1, 1, 1, 1, 1,
-1.667308, 0.1821227, -1.897141, 1, 1, 1, 1, 1,
-1.648421, -1.032158, -0.4930487, 1, 1, 1, 1, 1,
-1.639857, -1.897983, -3.105155, 1, 1, 1, 1, 1,
-1.636452, 0.08183163, -2.331461, 1, 1, 1, 1, 1,
-1.632474, -2.058964, -2.159822, 1, 1, 1, 1, 1,
-1.631559, 0.7641085, -1.391016, 1, 1, 1, 1, 1,
-1.618195, -0.4117131, -1.27898, 0, 0, 1, 1, 1,
-1.5979, 1.402499, -0.8107639, 1, 0, 0, 1, 1,
-1.592126, 1.174331, -0.6802417, 1, 0, 0, 1, 1,
-1.591224, -1.870032, -2.71605, 1, 0, 0, 1, 1,
-1.581724, -1.655108, -3.264691, 1, 0, 0, 1, 1,
-1.57687, -0.6374801, -1.575511, 1, 0, 0, 1, 1,
-1.574883, 1.562593, 0.7834106, 0, 0, 0, 1, 1,
-1.572372, -1.299005, -2.638265, 0, 0, 0, 1, 1,
-1.570948, -0.3080386, -0.9813016, 0, 0, 0, 1, 1,
-1.554836, -0.7528191, -2.131072, 0, 0, 0, 1, 1,
-1.550177, -0.6004381, -2.274598, 0, 0, 0, 1, 1,
-1.547226, -0.8025727, -1.625924, 0, 0, 0, 1, 1,
-1.545119, 0.4775143, -2.08169, 0, 0, 0, 1, 1,
-1.542267, 0.08871686, -2.573131, 1, 1, 1, 1, 1,
-1.540686, -1.079107, -2.082304, 1, 1, 1, 1, 1,
-1.519598, 0.240187, -2.089927, 1, 1, 1, 1, 1,
-1.515537, 1.708937, -0.5784901, 1, 1, 1, 1, 1,
-1.495666, -0.9927655, -1.154312, 1, 1, 1, 1, 1,
-1.491343, -0.8828944, -3.897864, 1, 1, 1, 1, 1,
-1.490278, 1.169331, -0.2005192, 1, 1, 1, 1, 1,
-1.484126, 0.3653598, -1.161068, 1, 1, 1, 1, 1,
-1.481662, 1.748375, -0.5211872, 1, 1, 1, 1, 1,
-1.461187, 0.5699934, -1.138872, 1, 1, 1, 1, 1,
-1.459503, 1.767475, -0.1208445, 1, 1, 1, 1, 1,
-1.431844, 0.2916127, -0.1559712, 1, 1, 1, 1, 1,
-1.425651, -0.6121139, -1.049138, 1, 1, 1, 1, 1,
-1.408516, 0.5065791, -1.820928, 1, 1, 1, 1, 1,
-1.405924, 1.098045, 0.01146049, 1, 1, 1, 1, 1,
-1.3954, 0.005186854, -1.147034, 0, 0, 1, 1, 1,
-1.393043, 0.05466413, -1.24209, 1, 0, 0, 1, 1,
-1.386351, -0.3075469, -1.514063, 1, 0, 0, 1, 1,
-1.384392, -0.5775385, -0.1977174, 1, 0, 0, 1, 1,
-1.379593, -1.512421, -3.933628, 1, 0, 0, 1, 1,
-1.378784, 0.4646844, -1.022176, 1, 0, 0, 1, 1,
-1.372555, -1.044826, -2.101165, 0, 0, 0, 1, 1,
-1.371932, -1.275915, -2.438445, 0, 0, 0, 1, 1,
-1.370175, 0.07078986, -0.3829516, 0, 0, 0, 1, 1,
-1.369043, 0.805143, -0.6755326, 0, 0, 0, 1, 1,
-1.363966, -1.114447, -2.402079, 0, 0, 0, 1, 1,
-1.341956, -1.885216, -3.39117, 0, 0, 0, 1, 1,
-1.339491, -1.01022, -3.361685, 0, 0, 0, 1, 1,
-1.339222, 0.6615662, -0.6643119, 1, 1, 1, 1, 1,
-1.335438, 1.64726, -0.6419435, 1, 1, 1, 1, 1,
-1.334339, -0.06779986, -0.6039574, 1, 1, 1, 1, 1,
-1.333338, 0.02338842, -0.6142446, 1, 1, 1, 1, 1,
-1.328973, 0.2093492, -1.915204, 1, 1, 1, 1, 1,
-1.322802, -0.2403769, -1.39664, 1, 1, 1, 1, 1,
-1.315039, 1.309468, -0.9833548, 1, 1, 1, 1, 1,
-1.308634, -0.7324213, -1.662166, 1, 1, 1, 1, 1,
-1.30602, 0.1962831, -0.2140075, 1, 1, 1, 1, 1,
-1.304485, -0.9939274, -0.716046, 1, 1, 1, 1, 1,
-1.294477, 0.8326338, -2.565361, 1, 1, 1, 1, 1,
-1.290931, 1.119403, -0.04005477, 1, 1, 1, 1, 1,
-1.288581, 1.664021, -0.4946232, 1, 1, 1, 1, 1,
-1.285586, 0.6787791, -0.6761997, 1, 1, 1, 1, 1,
-1.250357, -1.049461, -1.603361, 1, 1, 1, 1, 1,
-1.225542, 0.7903207, -0.3915609, 0, 0, 1, 1, 1,
-1.224218, -0.993147, -1.630871, 1, 0, 0, 1, 1,
-1.224105, 0.2440137, -2.723634, 1, 0, 0, 1, 1,
-1.218889, -0.7106705, -3.826699, 1, 0, 0, 1, 1,
-1.209583, 0.7136468, -1.285671, 1, 0, 0, 1, 1,
-1.195782, 0.1759332, -1.982798, 1, 0, 0, 1, 1,
-1.194964, -2.19337, -3.379882, 0, 0, 0, 1, 1,
-1.194522, -1.446679, -2.45208, 0, 0, 0, 1, 1,
-1.187344, -0.119595, -0.8119505, 0, 0, 0, 1, 1,
-1.178196, 1.125959, -2.029049, 0, 0, 0, 1, 1,
-1.177001, -0.3898187, -3.382668, 0, 0, 0, 1, 1,
-1.169415, -0.7591748, -2.165387, 0, 0, 0, 1, 1,
-1.165292, 0.4568827, -1.155766, 0, 0, 0, 1, 1,
-1.159074, 1.297122, -0.5261025, 1, 1, 1, 1, 1,
-1.153082, -0.4771971, -1.235672, 1, 1, 1, 1, 1,
-1.144325, 1.242152, -0.535943, 1, 1, 1, 1, 1,
-1.144218, 1.519265, -0.9901422, 1, 1, 1, 1, 1,
-1.144143, 0.9436378, -0.2185339, 1, 1, 1, 1, 1,
-1.142392, 0.690159, -0.2446238, 1, 1, 1, 1, 1,
-1.136962, -0.06315475, -1.738471, 1, 1, 1, 1, 1,
-1.134848, -0.466798, -2.784436, 1, 1, 1, 1, 1,
-1.133499, 0.8793176, -0.3050833, 1, 1, 1, 1, 1,
-1.132099, 0.7879059, -1.173105, 1, 1, 1, 1, 1,
-1.131149, 0.5121335, -1.204221, 1, 1, 1, 1, 1,
-1.125333, 0.1676578, -2.305319, 1, 1, 1, 1, 1,
-1.111373, 0.1570817, -1.48431, 1, 1, 1, 1, 1,
-1.104344, -1.420993, -2.355966, 1, 1, 1, 1, 1,
-1.103179, -0.5947354, -4.309381, 1, 1, 1, 1, 1,
-1.091952, 0.9635984, -1.264525, 0, 0, 1, 1, 1,
-1.090801, 0.7710335, -2.540866, 1, 0, 0, 1, 1,
-1.090364, -1.186663, -2.507641, 1, 0, 0, 1, 1,
-1.080856, 0.003630462, -2.028975, 1, 0, 0, 1, 1,
-1.075295, -0.7692719, -3.545124, 1, 0, 0, 1, 1,
-1.070055, 1.029739, -0.8654754, 1, 0, 0, 1, 1,
-1.067854, -1.853445, -3.484759, 0, 0, 0, 1, 1,
-1.066866, -0.5610265, -2.252288, 0, 0, 0, 1, 1,
-1.06441, 0.8170013, -1.588255, 0, 0, 0, 1, 1,
-1.064072, 0.1701404, -2.760175, 0, 0, 0, 1, 1,
-1.059981, -0.3945527, -0.7038694, 0, 0, 0, 1, 1,
-1.052022, 0.9951596, -3.78509, 0, 0, 0, 1, 1,
-1.033505, 1.164421, -1.605155, 0, 0, 0, 1, 1,
-1.030792, 2.308205, -0.6194718, 1, 1, 1, 1, 1,
-1.021342, -2.175411, -4.14819, 1, 1, 1, 1, 1,
-1.015026, -0.7451232, -1.679616, 1, 1, 1, 1, 1,
-1.010585, 0.4494385, -1.026501, 1, 1, 1, 1, 1,
-1.009781, 1.662972, -0.7564421, 1, 1, 1, 1, 1,
-1.000842, -0.9403611, -2.724738, 1, 1, 1, 1, 1,
-0.9947063, -0.9841657, -2.740947, 1, 1, 1, 1, 1,
-0.9938884, 0.7779049, 1.164727, 1, 1, 1, 1, 1,
-0.9903397, -0.8463111, -2.461564, 1, 1, 1, 1, 1,
-0.9706646, -1.439327, -3.100401, 1, 1, 1, 1, 1,
-0.965194, -2.24017, -3.143641, 1, 1, 1, 1, 1,
-0.9379255, 0.5684243, -0.8105744, 1, 1, 1, 1, 1,
-0.9362882, 1.635827, -1.353861, 1, 1, 1, 1, 1,
-0.9307501, -1.10336, -1.785533, 1, 1, 1, 1, 1,
-0.9188069, 0.05580299, 0.7264733, 1, 1, 1, 1, 1,
-0.9114863, 0.6903433, -1.726161, 0, 0, 1, 1, 1,
-0.9081575, -1.014672, -2.040527, 1, 0, 0, 1, 1,
-0.9028329, -0.05763319, -0.1067585, 1, 0, 0, 1, 1,
-0.8988622, 0.3081537, -2.224483, 1, 0, 0, 1, 1,
-0.8935429, -2.304348, -2.984882, 1, 0, 0, 1, 1,
-0.890141, -0.7331686, -1.967411, 1, 0, 0, 1, 1,
-0.8860355, 1.292098, 0.1661242, 0, 0, 0, 1, 1,
-0.8855727, 1.417595, -0.6535095, 0, 0, 0, 1, 1,
-0.8827759, -0.7660778, -2.320513, 0, 0, 0, 1, 1,
-0.878346, 0.2132834, -1.505586, 0, 0, 0, 1, 1,
-0.8763912, -0.4276315, -3.90498, 0, 0, 0, 1, 1,
-0.8750867, 1.185536, 0.579966, 0, 0, 0, 1, 1,
-0.8739189, -0.1376312, -2.542339, 0, 0, 0, 1, 1,
-0.8734642, -0.8312422, -1.690934, 1, 1, 1, 1, 1,
-0.8711452, 0.5583848, -1.179903, 1, 1, 1, 1, 1,
-0.8691567, -0.8770143, 0.2237563, 1, 1, 1, 1, 1,
-0.8648065, -0.04377623, -1.349692, 1, 1, 1, 1, 1,
-0.8646089, 1.965078, -1.776257, 1, 1, 1, 1, 1,
-0.8570689, 1.307445, -1.427541, 1, 1, 1, 1, 1,
-0.8547111, 0.243341, 1.343968, 1, 1, 1, 1, 1,
-0.8540382, 1.600947, 1.558805, 1, 1, 1, 1, 1,
-0.8481823, 1.022617, 0.2212677, 1, 1, 1, 1, 1,
-0.8477881, 0.163947, -1.082365, 1, 1, 1, 1, 1,
-0.8455389, 0.5831618, -1.808408, 1, 1, 1, 1, 1,
-0.8441187, 2.011092, 0.0263122, 1, 1, 1, 1, 1,
-0.8436403, -0.751227, -2.456067, 1, 1, 1, 1, 1,
-0.8422973, -0.7267466, -3.786555, 1, 1, 1, 1, 1,
-0.8391954, -0.2742539, -2.118909, 1, 1, 1, 1, 1,
-0.8369122, -0.03699133, -2.314233, 0, 0, 1, 1, 1,
-0.8363803, 0.6155882, -1.193184, 1, 0, 0, 1, 1,
-0.8350192, 0.2006884, -2.030679, 1, 0, 0, 1, 1,
-0.8302665, 1.013128, -1.000103, 1, 0, 0, 1, 1,
-0.8301311, 1.282505, -0.9291371, 1, 0, 0, 1, 1,
-0.8212599, -0.2091273, -1.239541, 1, 0, 0, 1, 1,
-0.8132629, -0.8639318, -3.502965, 0, 0, 0, 1, 1,
-0.8130307, 1.672517, 0.702905, 0, 0, 0, 1, 1,
-0.8120461, 0.3548853, -2.105851, 0, 0, 0, 1, 1,
-0.8092033, 0.03856659, -1.416739, 0, 0, 0, 1, 1,
-0.8067515, -1.324593, -1.75657, 0, 0, 0, 1, 1,
-0.806211, -0.8027365, -2.161687, 0, 0, 0, 1, 1,
-0.7969718, -0.03117592, -2.23862, 0, 0, 0, 1, 1,
-0.7955632, 0.9699871, 1.225246, 1, 1, 1, 1, 1,
-0.7945335, 0.4926062, -2.602991, 1, 1, 1, 1, 1,
-0.7932361, -0.8494758, -2.494148, 1, 1, 1, 1, 1,
-0.7927037, 0.2129953, -1.901726, 1, 1, 1, 1, 1,
-0.7924684, -0.4797839, -1.496199, 1, 1, 1, 1, 1,
-0.7883155, -0.02785026, -0.5466275, 1, 1, 1, 1, 1,
-0.7862046, 0.6862764, -0.7209902, 1, 1, 1, 1, 1,
-0.7813941, -1.116168, -3.104812, 1, 1, 1, 1, 1,
-0.7777379, -0.3900875, -2.860665, 1, 1, 1, 1, 1,
-0.7713414, 1.576679, 0.9661171, 1, 1, 1, 1, 1,
-0.7672002, 0.2779464, -1.087158, 1, 1, 1, 1, 1,
-0.750895, -0.5657209, -2.639274, 1, 1, 1, 1, 1,
-0.7496634, -2.054005, -2.916723, 1, 1, 1, 1, 1,
-0.7430885, 1.681399, -0.6577452, 1, 1, 1, 1, 1,
-0.7423319, -0.2989628, -0.3149791, 1, 1, 1, 1, 1,
-0.7349659, -1.771039, -2.596682, 0, 0, 1, 1, 1,
-0.7276374, 1.244279, 0.2043812, 1, 0, 0, 1, 1,
-0.7241182, -0.3601159, -1.448969, 1, 0, 0, 1, 1,
-0.7238172, 0.604897, -1.356089, 1, 0, 0, 1, 1,
-0.7223201, 0.08980049, -2.657481, 1, 0, 0, 1, 1,
-0.721454, 1.169908, -0.8624955, 1, 0, 0, 1, 1,
-0.7193421, 0.1151865, -2.129991, 0, 0, 0, 1, 1,
-0.718873, -0.3469913, -4.028021, 0, 0, 0, 1, 1,
-0.7118874, -0.3659139, -2.236146, 0, 0, 0, 1, 1,
-0.7082214, 0.0466373, -2.389149, 0, 0, 0, 1, 1,
-0.7003068, 1.388395, 1.266114, 0, 0, 0, 1, 1,
-0.6899934, 0.9104573, -1.07389, 0, 0, 0, 1, 1,
-0.689859, -0.7964529, -3.718395, 0, 0, 0, 1, 1,
-0.6789152, -0.1323364, -0.4938592, 1, 1, 1, 1, 1,
-0.6783998, 1.140795, 1.40996, 1, 1, 1, 1, 1,
-0.6776341, -1.547573, -2.598422, 1, 1, 1, 1, 1,
-0.677348, -0.007328752, -1.225824, 1, 1, 1, 1, 1,
-0.6683494, 0.2884945, -0.9095979, 1, 1, 1, 1, 1,
-0.6639584, -1.33976, -3.738871, 1, 1, 1, 1, 1,
-0.6602372, 0.6597509, -1.304067, 1, 1, 1, 1, 1,
-0.6567436, -0.4339985, -1.816521, 1, 1, 1, 1, 1,
-0.6544725, 1.120055, -1.1096, 1, 1, 1, 1, 1,
-0.6526178, 1.223626, -1.554309, 1, 1, 1, 1, 1,
-0.6517169, 1.655937, -0.859025, 1, 1, 1, 1, 1,
-0.646118, 0.2835709, -2.937901, 1, 1, 1, 1, 1,
-0.6457717, 0.3694527, -0.2885337, 1, 1, 1, 1, 1,
-0.6449252, -1.363809, -2.733733, 1, 1, 1, 1, 1,
-0.6444387, 0.7066668, -0.9180289, 1, 1, 1, 1, 1,
-0.635565, 0.1423051, -2.067449, 0, 0, 1, 1, 1,
-0.6320984, -1.736655, -1.522435, 1, 0, 0, 1, 1,
-0.6274633, -1.841869, -2.430834, 1, 0, 0, 1, 1,
-0.6241024, 1.647992, -0.1022077, 1, 0, 0, 1, 1,
-0.6085143, -0.9071437, -1.826107, 1, 0, 0, 1, 1,
-0.605498, 0.4195734, -1.494678, 1, 0, 0, 1, 1,
-0.6049308, 0.1065982, -0.4642248, 0, 0, 0, 1, 1,
-0.6047106, -1.935517, -5.106905, 0, 0, 0, 1, 1,
-0.6039084, 1.625137, -1.218233, 0, 0, 0, 1, 1,
-0.6009902, 0.8351933, -2.193192, 0, 0, 0, 1, 1,
-0.6001766, 1.254023, -0.0947383, 0, 0, 0, 1, 1,
-0.5980856, 0.06910299, -0.9667044, 0, 0, 0, 1, 1,
-0.5977222, -0.5879803, -2.361699, 0, 0, 0, 1, 1,
-0.5946472, 0.8841882, -0.7813478, 1, 1, 1, 1, 1,
-0.5941752, -0.1142385, -2.771413, 1, 1, 1, 1, 1,
-0.5911837, 0.2152342, -0.8936692, 1, 1, 1, 1, 1,
-0.5905309, 0.2841305, -1.258031, 1, 1, 1, 1, 1,
-0.5874169, 2.13623, -1.560897, 1, 1, 1, 1, 1,
-0.5864703, 1.346868, 0.7540889, 1, 1, 1, 1, 1,
-0.5861608, 0.6952354, -0.2180778, 1, 1, 1, 1, 1,
-0.5791481, 0.013549, -0.8574731, 1, 1, 1, 1, 1,
-0.5731621, 1.517072, -0.9121686, 1, 1, 1, 1, 1,
-0.572381, -0.0806773, -1.501588, 1, 1, 1, 1, 1,
-0.5700734, 1.972419, 0.5539165, 1, 1, 1, 1, 1,
-0.5688214, 1.793261, 0.951636, 1, 1, 1, 1, 1,
-0.568303, -1.093946, -2.791343, 1, 1, 1, 1, 1,
-0.5659596, 1.871705, -2.139362, 1, 1, 1, 1, 1,
-0.5653985, -1.121116, -0.5278535, 1, 1, 1, 1, 1,
-0.5630063, -0.6309544, -3.005068, 0, 0, 1, 1, 1,
-0.5560598, 1.085181, -0.5613934, 1, 0, 0, 1, 1,
-0.5458341, -0.9036389, -1.415602, 1, 0, 0, 1, 1,
-0.5446876, 1.583051, 0.5280792, 1, 0, 0, 1, 1,
-0.5373687, -0.08836017, -0.8475782, 1, 0, 0, 1, 1,
-0.5355473, -0.8929721, -4.312646, 1, 0, 0, 1, 1,
-0.5329524, -0.2957887, -2.394673, 0, 0, 0, 1, 1,
-0.5306771, -1.647325, -1.471243, 0, 0, 0, 1, 1,
-0.5292614, -0.7530949, -4.200937, 0, 0, 0, 1, 1,
-0.520839, 2.228147, 0.1781128, 0, 0, 0, 1, 1,
-0.5202528, -1.371422, -2.490963, 0, 0, 0, 1, 1,
-0.5198883, -0.7004429, -3.043023, 0, 0, 0, 1, 1,
-0.5191872, -0.917098, -2.617744, 0, 0, 0, 1, 1,
-0.5175858, -0.5294755, -3.034587, 1, 1, 1, 1, 1,
-0.5162635, -1.447791, -2.907746, 1, 1, 1, 1, 1,
-0.5150439, 1.829655, 0.03651777, 1, 1, 1, 1, 1,
-0.5111557, 0.5003042, -1.168854, 1, 1, 1, 1, 1,
-0.5077069, -2.23094, -3.066435, 1, 1, 1, 1, 1,
-0.5069357, 0.7183517, 0.3111776, 1, 1, 1, 1, 1,
-0.5056377, 1.603602, -2.730783, 1, 1, 1, 1, 1,
-0.5033817, -0.8411478, -3.404092, 1, 1, 1, 1, 1,
-0.5019035, -0.9756073, -0.9573657, 1, 1, 1, 1, 1,
-0.4938703, -0.1830097, -1.664534, 1, 1, 1, 1, 1,
-0.4914634, -0.9155787, -1.925909, 1, 1, 1, 1, 1,
-0.4901087, 1.285972, 0.4217614, 1, 1, 1, 1, 1,
-0.4897675, 0.1434543, -2.175283, 1, 1, 1, 1, 1,
-0.4887869, -1.839232, -1.405261, 1, 1, 1, 1, 1,
-0.4884722, 1.286469, 0.1669077, 1, 1, 1, 1, 1,
-0.4852329, 0.9187793, -0.5410731, 0, 0, 1, 1, 1,
-0.4828727, 0.4960241, -0.4587795, 1, 0, 0, 1, 1,
-0.4827105, 1.89407, 0.1758791, 1, 0, 0, 1, 1,
-0.4822756, 0.440486, -0.03529261, 1, 0, 0, 1, 1,
-0.4786719, 0.4622828, -2.0959, 1, 0, 0, 1, 1,
-0.4773555, -0.8018528, -2.012304, 1, 0, 0, 1, 1,
-0.473804, 0.4516237, -1.851159, 0, 0, 0, 1, 1,
-0.4716555, -0.01093098, -2.30037, 0, 0, 0, 1, 1,
-0.4710439, 0.2971871, 0.3907013, 0, 0, 0, 1, 1,
-0.4641159, 0.4875265, -0.2022818, 0, 0, 0, 1, 1,
-0.4635162, -0.1444453, -0.6168088, 0, 0, 0, 1, 1,
-0.4633037, 0.2168075, -0.3472831, 0, 0, 0, 1, 1,
-0.4586134, 0.9198508, -0.2075055, 0, 0, 0, 1, 1,
-0.4584368, -0.6815947, -3.232131, 1, 1, 1, 1, 1,
-0.4559581, -0.2853312, -2.600107, 1, 1, 1, 1, 1,
-0.4511678, 0.2585589, -2.623063, 1, 1, 1, 1, 1,
-0.4464607, 1.163439, -1.826852, 1, 1, 1, 1, 1,
-0.4464141, -0.4958831, -1.004739, 1, 1, 1, 1, 1,
-0.4425014, -1.261692, -2.692967, 1, 1, 1, 1, 1,
-0.4419246, 2.069938, -0.6563216, 1, 1, 1, 1, 1,
-0.4401257, -0.583766, -4.425717, 1, 1, 1, 1, 1,
-0.4379973, -0.2762333, -3.037201, 1, 1, 1, 1, 1,
-0.4356669, -0.6262713, -2.580213, 1, 1, 1, 1, 1,
-0.4313698, 0.3762669, -1.026076, 1, 1, 1, 1, 1,
-0.4270917, 0.9295021, -0.8611755, 1, 1, 1, 1, 1,
-0.4238186, 1.532432, 0.3388218, 1, 1, 1, 1, 1,
-0.4190859, 1.562485, -1.075357, 1, 1, 1, 1, 1,
-0.4188514, 0.4637432, -2.186454, 1, 1, 1, 1, 1,
-0.4176722, -1.176285, -2.850662, 0, 0, 1, 1, 1,
-0.4160668, 1.002503, 0.4529751, 1, 0, 0, 1, 1,
-0.4068266, 0.1907639, -4.198755, 1, 0, 0, 1, 1,
-0.4035009, 0.1339377, -2.385344, 1, 0, 0, 1, 1,
-0.3948087, -1.005661, -2.10713, 1, 0, 0, 1, 1,
-0.394739, -0.382802, -2.54656, 1, 0, 0, 1, 1,
-0.3922491, -0.1712544, -3.285107, 0, 0, 0, 1, 1,
-0.3907608, -0.9116727, -2.101607, 0, 0, 0, 1, 1,
-0.3876115, 1.139018, -0.3096419, 0, 0, 0, 1, 1,
-0.3865377, 0.6496375, -1.080485, 0, 0, 0, 1, 1,
-0.3844357, 0.996694, 0.1030243, 0, 0, 0, 1, 1,
-0.3815263, 1.106308, -0.3944159, 0, 0, 0, 1, 1,
-0.3799215, 1.152927, 0.1083759, 0, 0, 0, 1, 1,
-0.3763151, 0.9508113, 0.4625792, 1, 1, 1, 1, 1,
-0.3753065, 0.1006189, -1.962318, 1, 1, 1, 1, 1,
-0.3745821, 0.02557231, -1.972579, 1, 1, 1, 1, 1,
-0.367713, -1.113606, -3.446101, 1, 1, 1, 1, 1,
-0.3673881, 0.2698478, -0.9610186, 1, 1, 1, 1, 1,
-0.3661708, 0.3345477, -2.629997, 1, 1, 1, 1, 1,
-0.3619471, -0.0414867, -3.756729, 1, 1, 1, 1, 1,
-0.3597212, 0.1382069, -0.5038776, 1, 1, 1, 1, 1,
-0.3562455, -1.405447, -2.464774, 1, 1, 1, 1, 1,
-0.3546417, -0.2041217, -2.134049, 1, 1, 1, 1, 1,
-0.3540214, -1.890575, -2.267176, 1, 1, 1, 1, 1,
-0.3526351, 1.558968, 0.3678841, 1, 1, 1, 1, 1,
-0.349681, -1.411538, -1.33925, 1, 1, 1, 1, 1,
-0.3436662, 1.124698, 0.4559876, 1, 1, 1, 1, 1,
-0.343049, -1.1722, -3.726872, 1, 1, 1, 1, 1,
-0.3420933, 1.339177, -1.469699, 0, 0, 1, 1, 1,
-0.3396113, -0.9904532, -2.930543, 1, 0, 0, 1, 1,
-0.3383309, 0.1219631, -2.088124, 1, 0, 0, 1, 1,
-0.3380277, 0.1503561, -1.548917, 1, 0, 0, 1, 1,
-0.337513, 0.09403919, -0.1987968, 1, 0, 0, 1, 1,
-0.3314426, -0.5163561, -2.432683, 1, 0, 0, 1, 1,
-0.3281123, 1.319553, 0.6005415, 0, 0, 0, 1, 1,
-0.3279451, -0.2268211, -2.648157, 0, 0, 0, 1, 1,
-0.3264551, 1.491062, -3.132941, 0, 0, 0, 1, 1,
-0.3254071, -0.9940548, -3.190458, 0, 0, 0, 1, 1,
-0.3252975, -0.2317287, -3.110949, 0, 0, 0, 1, 1,
-0.3218615, -1.275953, -3.924959, 0, 0, 0, 1, 1,
-0.3162624, 1.111404, 0.2545658, 0, 0, 0, 1, 1,
-0.3142019, -0.1844739, -4.31615, 1, 1, 1, 1, 1,
-0.3092842, 1.194231, -1.093016, 1, 1, 1, 1, 1,
-0.3071647, -0.4585296, -1.204141, 1, 1, 1, 1, 1,
-0.3035275, 2.451137, 0.5014368, 1, 1, 1, 1, 1,
-0.3016355, -1.267856, -3.395839, 1, 1, 1, 1, 1,
-0.299446, -0.4287143, -2.99744, 1, 1, 1, 1, 1,
-0.2986565, 0.3543159, -0.7326427, 1, 1, 1, 1, 1,
-0.297302, -0.2290715, -2.739278, 1, 1, 1, 1, 1,
-0.2950228, -1.188078, -3.186996, 1, 1, 1, 1, 1,
-0.2807653, -0.03108617, -1.270745, 1, 1, 1, 1, 1,
-0.2800245, 0.9320202, -0.1924686, 1, 1, 1, 1, 1,
-0.2787714, 2.069802, 0.0160241, 1, 1, 1, 1, 1,
-0.2760808, -0.338461, -5.009613, 1, 1, 1, 1, 1,
-0.2751372, 0.190169, -0.7907892, 1, 1, 1, 1, 1,
-0.2683881, 0.22707, 0.3703626, 1, 1, 1, 1, 1,
-0.2673525, -1.575904, -2.915494, 0, 0, 1, 1, 1,
-0.2659558, -0.07584371, -0.2978304, 1, 0, 0, 1, 1,
-0.2612186, -0.3490008, -1.411414, 1, 0, 0, 1, 1,
-0.2602881, -0.6484529, -2.220819, 1, 0, 0, 1, 1,
-0.2550134, 0.02646439, -1.629216, 1, 0, 0, 1, 1,
-0.2501451, -0.6402964, -2.030197, 1, 0, 0, 1, 1,
-0.2490563, 1.564374, -0.01517725, 0, 0, 0, 1, 1,
-0.2489054, -0.7861274, -2.665835, 0, 0, 0, 1, 1,
-0.2463686, -0.2164748, -2.837019, 0, 0, 0, 1, 1,
-0.2451144, -0.8758473, -3.121346, 0, 0, 0, 1, 1,
-0.2450065, -0.6420289, -0.9171823, 0, 0, 0, 1, 1,
-0.2426978, -0.5604324, -2.395463, 0, 0, 0, 1, 1,
-0.2425608, 1.371575, -0.04864062, 0, 0, 0, 1, 1,
-0.2417293, 1.014878, -0.1615635, 1, 1, 1, 1, 1,
-0.2375132, 1.414379, -1.913409, 1, 1, 1, 1, 1,
-0.2344737, 1.19383, -0.6550293, 1, 1, 1, 1, 1,
-0.2327424, -1.699596, -2.075573, 1, 1, 1, 1, 1,
-0.2317012, 1.313716, 0.6539293, 1, 1, 1, 1, 1,
-0.227753, 0.01412029, -1.653965, 1, 1, 1, 1, 1,
-0.2244171, -1.21934, -1.901241, 1, 1, 1, 1, 1,
-0.220395, -1.075578, -1.236947, 1, 1, 1, 1, 1,
-0.2182113, -0.6609007, -2.761765, 1, 1, 1, 1, 1,
-0.2175088, 0.1310165, -2.396769, 1, 1, 1, 1, 1,
-0.2161425, 1.098373, -1.074767, 1, 1, 1, 1, 1,
-0.2160255, 2.419689, -0.3971933, 1, 1, 1, 1, 1,
-0.2091903, 0.7361894, -0.5897358, 1, 1, 1, 1, 1,
-0.2078299, 0.08910512, -2.021008, 1, 1, 1, 1, 1,
-0.2039443, -0.5305069, -3.619982, 1, 1, 1, 1, 1,
-0.2034702, 0.8105177, 0.07868905, 0, 0, 1, 1, 1,
-0.1988875, 1.110241, 0.3591344, 1, 0, 0, 1, 1,
-0.19718, -1.315224, -3.957635, 1, 0, 0, 1, 1,
-0.1941652, 0.8976114, -1.467346, 1, 0, 0, 1, 1,
-0.1937311, -0.5330958, -3.243833, 1, 0, 0, 1, 1,
-0.1894384, -1.687648, -1.153021, 1, 0, 0, 1, 1,
-0.1857848, 0.2924606, -1.121906, 0, 0, 0, 1, 1,
-0.1790676, -0.3021978, -2.681965, 0, 0, 0, 1, 1,
-0.1760454, -0.7870552, -1.079499, 0, 0, 0, 1, 1,
-0.1755767, -0.3678697, -1.040086, 0, 0, 0, 1, 1,
-0.1741607, 2.562768, -1.420335, 0, 0, 0, 1, 1,
-0.164919, 0.05360456, -2.931343, 0, 0, 0, 1, 1,
-0.1640589, 0.2570011, 1.435477, 0, 0, 0, 1, 1,
-0.1516422, 0.1429027, -1.919764, 1, 1, 1, 1, 1,
-0.1486345, 3.786841, -1.89826, 1, 1, 1, 1, 1,
-0.1481524, -0.917075, -3.54378, 1, 1, 1, 1, 1,
-0.1460058, 0.04391139, -2.119942, 1, 1, 1, 1, 1,
-0.1456553, 0.5651465, 0.5095569, 1, 1, 1, 1, 1,
-0.1446945, -1.356581, -0.9764245, 1, 1, 1, 1, 1,
-0.1433927, -1.455129, -3.808558, 1, 1, 1, 1, 1,
-0.142529, -0.8151803, -2.37065, 1, 1, 1, 1, 1,
-0.1396042, -0.09317802, -4.27859, 1, 1, 1, 1, 1,
-0.1392369, -0.01536181, -0.4873874, 1, 1, 1, 1, 1,
-0.1372316, -1.504912, -3.850686, 1, 1, 1, 1, 1,
-0.1348668, 0.8044657, -0.5826778, 1, 1, 1, 1, 1,
-0.1322609, -0.2819027, -3.644644, 1, 1, 1, 1, 1,
-0.1287377, -1.122648, -5.042263, 1, 1, 1, 1, 1,
-0.1244765, -2.679925, -0.9417798, 1, 1, 1, 1, 1,
-0.123732, 1.083657, -0.01212711, 0, 0, 1, 1, 1,
-0.1236723, -0.5581558, -2.230905, 1, 0, 0, 1, 1,
-0.1235439, 1.097365, 0.6964057, 1, 0, 0, 1, 1,
-0.1217288, -1.810563, -3.429336, 1, 0, 0, 1, 1,
-0.1161485, -0.9848506, -2.378555, 1, 0, 0, 1, 1,
-0.1148447, 0.5193592, -0.6022688, 1, 0, 0, 1, 1,
-0.1104473, -0.2572393, -2.260185, 0, 0, 0, 1, 1,
-0.1096861, 1.898423, -0.3593939, 0, 0, 0, 1, 1,
-0.1062508, -0.1525649, -3.664994, 0, 0, 0, 1, 1,
-0.1058551, 1.271565, -0.2755875, 0, 0, 0, 1, 1,
-0.1048776, -1.892745, -1.32099, 0, 0, 0, 1, 1,
-0.100293, -0.2318828, -1.651365, 0, 0, 0, 1, 1,
-0.1001323, 0.3981668, 0.08317211, 0, 0, 0, 1, 1,
-0.09862469, 2.444336, 1.91942, 1, 1, 1, 1, 1,
-0.0981398, 0.2006524, -0.06754439, 1, 1, 1, 1, 1,
-0.09739543, -0.1229658, -3.643232, 1, 1, 1, 1, 1,
-0.09190197, 0.3600948, -2.058106, 1, 1, 1, 1, 1,
-0.08999002, 1.121876, 0.3957407, 1, 1, 1, 1, 1,
-0.08885487, 1.160055, 0.5755323, 1, 1, 1, 1, 1,
-0.08592378, 0.5958643, -0.06492472, 1, 1, 1, 1, 1,
-0.08234204, -0.8335731, -3.360025, 1, 1, 1, 1, 1,
-0.07956834, 0.03862131, -2.383728, 1, 1, 1, 1, 1,
-0.07802813, 0.3353961, -0.187822, 1, 1, 1, 1, 1,
-0.07427397, -0.9076591, -2.306424, 1, 1, 1, 1, 1,
-0.07419144, -0.0906406, -3.695535, 1, 1, 1, 1, 1,
-0.07266335, 2.250189, 0.5244488, 1, 1, 1, 1, 1,
-0.07091983, 0.4635476, 1.540968, 1, 1, 1, 1, 1,
-0.07009912, -0.7934934, -1.877972, 1, 1, 1, 1, 1,
-0.06601617, -1.101916, -3.728815, 0, 0, 1, 1, 1,
-0.05904531, -0.551635, -2.084304, 1, 0, 0, 1, 1,
-0.05775256, 0.04173876, -0.2003905, 1, 0, 0, 1, 1,
-0.04961946, 0.5963451, 0.1917751, 1, 0, 0, 1, 1,
-0.04958061, 0.2961695, -0.6925017, 1, 0, 0, 1, 1,
-0.04605885, 1.340491, -1.188164, 1, 0, 0, 1, 1,
-0.04329045, 1.231694, -1.046653, 0, 0, 0, 1, 1,
-0.04225665, -1.117584, -2.229329, 0, 0, 0, 1, 1,
-0.04075803, -1.695747, -4.090149, 0, 0, 0, 1, 1,
-0.03884782, -1.236265, -2.078662, 0, 0, 0, 1, 1,
-0.03571418, 1.012715, -0.8640801, 0, 0, 0, 1, 1,
-0.03504638, 1.072815, -0.4252546, 0, 0, 0, 1, 1,
-0.03323245, -0.02347974, -2.047778, 0, 0, 0, 1, 1,
-0.02888503, -1.367319, -4.003341, 1, 1, 1, 1, 1,
-0.02588281, -0.8591559, -2.775832, 1, 1, 1, 1, 1,
-0.02585661, 0.9705947, -0.5474566, 1, 1, 1, 1, 1,
-0.02441379, 2.317238, -0.2142105, 1, 1, 1, 1, 1,
-0.02258241, 0.2248195, -1.238715, 1, 1, 1, 1, 1,
-0.01184633, 0.8690028, 0.5825006, 1, 1, 1, 1, 1,
-0.01174317, -1.563404, -2.687081, 1, 1, 1, 1, 1,
-0.01132854, -0.4204116, -3.88757, 1, 1, 1, 1, 1,
-0.0109294, -0.1927275, -1.297014, 1, 1, 1, 1, 1,
-0.006489017, 1.423155, -0.6873069, 1, 1, 1, 1, 1,
-0.003949447, -1.245389, -1.777462, 1, 1, 1, 1, 1,
-0.003013459, 1.346583, 1.134109, 1, 1, 1, 1, 1,
-0.002982681, -0.501613, -3.505591, 1, 1, 1, 1, 1,
-0.002160117, 0.5183022, 0.9668453, 1, 1, 1, 1, 1,
0.001608245, 0.5574545, 0.1888491, 1, 1, 1, 1, 1,
0.003313053, 0.06385137, 1.317839, 0, 0, 1, 1, 1,
0.003895965, -0.07844606, 2.701655, 1, 0, 0, 1, 1,
0.005154203, -1.236264, 4.163356, 1, 0, 0, 1, 1,
0.005646431, -1.75882, 1.105959, 1, 0, 0, 1, 1,
0.0056957, -0.7338416, 3.650929, 1, 0, 0, 1, 1,
0.007524421, 0.5422845, -1.098275, 1, 0, 0, 1, 1,
0.01168075, 1.422905, -0.3340469, 0, 0, 0, 1, 1,
0.01405099, 0.6600071, -0.832067, 0, 0, 0, 1, 1,
0.01409602, -0.7159779, 3.410261, 0, 0, 0, 1, 1,
0.01649905, 0.05680436, -0.965273, 0, 0, 0, 1, 1,
0.0176542, 0.6460497, -1.709302, 0, 0, 0, 1, 1,
0.01822744, 0.2384346, -0.7945355, 0, 0, 0, 1, 1,
0.0185381, -0.07785067, 3.288585, 0, 0, 0, 1, 1,
0.02296396, -0.7561302, 4.229437, 1, 1, 1, 1, 1,
0.02387312, -0.1083082, 2.933608, 1, 1, 1, 1, 1,
0.02430128, 0.1605495, 1.097131, 1, 1, 1, 1, 1,
0.02446288, -2.262469, 4.570021, 1, 1, 1, 1, 1,
0.02741781, 0.2411159, -0.8550317, 1, 1, 1, 1, 1,
0.02959423, -0.3453792, 1.869485, 1, 1, 1, 1, 1,
0.03048608, 0.2886514, -1.072587, 1, 1, 1, 1, 1,
0.04413011, 0.3264262, 0.4410059, 1, 1, 1, 1, 1,
0.0446343, 0.4809912, -1.383468, 1, 1, 1, 1, 1,
0.04644715, -0.012613, 0.2740518, 1, 1, 1, 1, 1,
0.04929056, -0.2123505, 3.908504, 1, 1, 1, 1, 1,
0.05161788, -0.1012123, 2.246869, 1, 1, 1, 1, 1,
0.05335432, 0.2818749, 0.4791968, 1, 1, 1, 1, 1,
0.05366861, 2.267341, -0.167963, 1, 1, 1, 1, 1,
0.05618025, 1.410951, 0.9617375, 1, 1, 1, 1, 1,
0.05703693, 0.2812425, -1.288751, 0, 0, 1, 1, 1,
0.0626651, 0.2431497, 1.55326, 1, 0, 0, 1, 1,
0.06476576, -0.7051597, 4.183641, 1, 0, 0, 1, 1,
0.06648369, 1.239637, 1.291046, 1, 0, 0, 1, 1,
0.06782443, 0.4819964, 0.7043648, 1, 0, 0, 1, 1,
0.06814165, -0.02284327, 2.380471, 1, 0, 0, 1, 1,
0.06878927, 0.09520742, 0.9697106, 0, 0, 0, 1, 1,
0.07245612, -1.018137, 2.550725, 0, 0, 0, 1, 1,
0.09027893, 0.4632466, 0.4950629, 0, 0, 0, 1, 1,
0.09384917, 0.2477893, 0.4455799, 0, 0, 0, 1, 1,
0.09779857, 1.765317, 0.6677268, 0, 0, 0, 1, 1,
0.1018495, -0.3876351, 2.067722, 0, 0, 0, 1, 1,
0.1047567, -0.4381873, 1.760934, 0, 0, 0, 1, 1,
0.1068653, -0.5659198, 2.728012, 1, 1, 1, 1, 1,
0.1085872, -0.4148596, 3.039946, 1, 1, 1, 1, 1,
0.1124184, 1.086404, 0.654909, 1, 1, 1, 1, 1,
0.118363, -1.102363, 2.746751, 1, 1, 1, 1, 1,
0.1364833, -1.798368, 2.850255, 1, 1, 1, 1, 1,
0.1392552, -0.5416321, 2.827639, 1, 1, 1, 1, 1,
0.14345, 1.03805, -0.521029, 1, 1, 1, 1, 1,
0.1440933, -0.03198637, 3.079714, 1, 1, 1, 1, 1,
0.1449043, 0.7254739, 1.347246, 1, 1, 1, 1, 1,
0.1463768, 0.02999918, 1.395637, 1, 1, 1, 1, 1,
0.1465994, -0.2249079, 4.569794, 1, 1, 1, 1, 1,
0.1470926, 1.280987, -1.35091, 1, 1, 1, 1, 1,
0.149175, 1.252387, 1.727101, 1, 1, 1, 1, 1,
0.150435, -1.908389, 3.970392, 1, 1, 1, 1, 1,
0.1505095, -0.7476923, 4.318089, 1, 1, 1, 1, 1,
0.1507362, -0.915298, 4.183953, 0, 0, 1, 1, 1,
0.1577522, -0.06169377, 1.834538, 1, 0, 0, 1, 1,
0.1593844, 0.5079645, 2.440672, 1, 0, 0, 1, 1,
0.1609124, 0.2820717, 2.381086, 1, 0, 0, 1, 1,
0.1649798, -0.7002823, 2.241117, 1, 0, 0, 1, 1,
0.167164, 0.1448917, 0.3209878, 1, 0, 0, 1, 1,
0.1694751, -0.07029615, 0.5817018, 0, 0, 0, 1, 1,
0.1721924, 1.413798, 0.6677802, 0, 0, 0, 1, 1,
0.1756849, 1.350697, -0.3140412, 0, 0, 0, 1, 1,
0.1805962, 0.3355267, -0.04872411, 0, 0, 0, 1, 1,
0.1815947, 0.311381, 2.14068, 0, 0, 0, 1, 1,
0.1818892, 1.727316, 0.3008282, 0, 0, 0, 1, 1,
0.1992102, 0.2697481, 1.420499, 0, 0, 0, 1, 1,
0.2006343, -0.716162, 2.985063, 1, 1, 1, 1, 1,
0.2007939, -0.5516269, 3.445966, 1, 1, 1, 1, 1,
0.202196, -1.065361, 3.590852, 1, 1, 1, 1, 1,
0.2029135, 0.1410556, 0.5902225, 1, 1, 1, 1, 1,
0.2050781, -0.3060831, 1.013749, 1, 1, 1, 1, 1,
0.2080469, 0.2420817, -0.2811834, 1, 1, 1, 1, 1,
0.2082655, -1.515694, 3.685463, 1, 1, 1, 1, 1,
0.2132446, 2.258246, 0.1567749, 1, 1, 1, 1, 1,
0.2138364, 0.05083589, 2.277558, 1, 1, 1, 1, 1,
0.214888, -0.5541806, 4.719503, 1, 1, 1, 1, 1,
0.2151487, -1.579596, 2.907495, 1, 1, 1, 1, 1,
0.2175396, -0.5445111, 2.861362, 1, 1, 1, 1, 1,
0.2250111, 0.3178334, 0.7109282, 1, 1, 1, 1, 1,
0.2255753, 1.034603, -0.3540069, 1, 1, 1, 1, 1,
0.2272553, -0.3157936, 3.459815, 1, 1, 1, 1, 1,
0.2301643, 2.731033, -0.3489265, 0, 0, 1, 1, 1,
0.2349985, 0.4435389, 0.03331895, 1, 0, 0, 1, 1,
0.2386991, 2.395609, 1.392521, 1, 0, 0, 1, 1,
0.2457297, 1.247728, 0.5702235, 1, 0, 0, 1, 1,
0.2463599, -1.201762, 2.168854, 1, 0, 0, 1, 1,
0.2487666, 0.4555389, -0.5164771, 1, 0, 0, 1, 1,
0.2542524, -0.9987031, 2.475195, 0, 0, 0, 1, 1,
0.2584879, -0.1363751, 2.547328, 0, 0, 0, 1, 1,
0.2644901, -1.271023, 2.951896, 0, 0, 0, 1, 1,
0.2665293, 0.2305305, 1.650763, 0, 0, 0, 1, 1,
0.268057, -0.9653907, 2.880459, 0, 0, 0, 1, 1,
0.2748227, -0.2739379, 2.926425, 0, 0, 0, 1, 1,
0.2755968, 0.1521996, 0.699275, 0, 0, 0, 1, 1,
0.2840784, 2.351392, -0.3542536, 1, 1, 1, 1, 1,
0.2872419, -0.7551265, 4.094974, 1, 1, 1, 1, 1,
0.2872654, 1.850515, -0.2071457, 1, 1, 1, 1, 1,
0.2877309, 0.8485772, 0.359864, 1, 1, 1, 1, 1,
0.2897419, 0.1391485, 1.416698, 1, 1, 1, 1, 1,
0.2915501, 0.4028191, -0.6934435, 1, 1, 1, 1, 1,
0.2924651, 2.372916, -0.3055251, 1, 1, 1, 1, 1,
0.2927268, 1.145594, -0.3984929, 1, 1, 1, 1, 1,
0.2953183, 0.8810484, 0.3952934, 1, 1, 1, 1, 1,
0.2953444, 2.02444, 0.7650046, 1, 1, 1, 1, 1,
0.3015833, 0.2038098, 1.009935, 1, 1, 1, 1, 1,
0.30622, -0.7998557, 2.766085, 1, 1, 1, 1, 1,
0.3083237, -0.3370297, 3.577104, 1, 1, 1, 1, 1,
0.3084267, -1.59541, 3.595057, 1, 1, 1, 1, 1,
0.3093943, 0.07784616, 1.833722, 1, 1, 1, 1, 1,
0.3135739, 0.2304344, 0.4148954, 0, 0, 1, 1, 1,
0.3162, -0.152817, 1.518428, 1, 0, 0, 1, 1,
0.3163858, -0.3610608, 2.248971, 1, 0, 0, 1, 1,
0.3196587, 0.3390597, 0.6523621, 1, 0, 0, 1, 1,
0.3233552, -0.2710834, 0.7554987, 1, 0, 0, 1, 1,
0.3253193, 1.788612, 0.8569531, 1, 0, 0, 1, 1,
0.3265671, 0.3181609, 2.140803, 0, 0, 0, 1, 1,
0.3273373, 2.679161, -0.7687248, 0, 0, 0, 1, 1,
0.3319651, 0.3424935, -0.6944186, 0, 0, 0, 1, 1,
0.3333811, -1.080963, 3.330314, 0, 0, 0, 1, 1,
0.3387752, -1.514544, 2.969489, 0, 0, 0, 1, 1,
0.3389768, -1.063039, 3.264632, 0, 0, 0, 1, 1,
0.3443779, -0.9494377, 4.252707, 0, 0, 0, 1, 1,
0.3499717, 0.8274876, 0.8514526, 1, 1, 1, 1, 1,
0.3528795, -0.06730792, 0.06595961, 1, 1, 1, 1, 1,
0.3534589, 0.2182935, 2.832117, 1, 1, 1, 1, 1,
0.3541906, 0.5549467, -1.656239, 1, 1, 1, 1, 1,
0.3544878, 0.458579, -1.618281, 1, 1, 1, 1, 1,
0.3549051, 0.03020411, 2.200799, 1, 1, 1, 1, 1,
0.3580736, 0.8033739, 0.3053786, 1, 1, 1, 1, 1,
0.3733594, 1.285959, 0.08259826, 1, 1, 1, 1, 1,
0.3787233, 1.198185, -1.079079, 1, 1, 1, 1, 1,
0.38048, 2.023538, 1.412639, 1, 1, 1, 1, 1,
0.3814203, -0.1192887, 1.95602, 1, 1, 1, 1, 1,
0.3828247, -0.5493287, 2.782158, 1, 1, 1, 1, 1,
0.3864309, -2.484363, 2.477425, 1, 1, 1, 1, 1,
0.3889011, 2.277724, -0.09223126, 1, 1, 1, 1, 1,
0.3941406, -1.060017, 3.457608, 1, 1, 1, 1, 1,
0.3942211, 0.1085237, 0.3603352, 0, 0, 1, 1, 1,
0.3944034, -0.9414189, 2.080442, 1, 0, 0, 1, 1,
0.4007626, 1.42907, -0.3853191, 1, 0, 0, 1, 1,
0.4017743, 0.6538252, 0.1186841, 1, 0, 0, 1, 1,
0.4097878, -0.2654797, 4.642284, 1, 0, 0, 1, 1,
0.4141044, -0.08475605, 3.620532, 1, 0, 0, 1, 1,
0.4142953, -0.1384554, 2.49484, 0, 0, 0, 1, 1,
0.4148523, -1.768222, 2.909482, 0, 0, 0, 1, 1,
0.4148958, 0.2185182, 2.903435, 0, 0, 0, 1, 1,
0.4161507, -0.3575312, 1.927592, 0, 0, 0, 1, 1,
0.4170092, 1.606261, 2.002975, 0, 0, 0, 1, 1,
0.4215939, 0.9858072, 1.997985, 0, 0, 0, 1, 1,
0.4326871, -0.01658411, 1.789264, 0, 0, 0, 1, 1,
0.4345535, 0.6740001, 0.487175, 1, 1, 1, 1, 1,
0.4349242, -0.2082936, 2.577721, 1, 1, 1, 1, 1,
0.4419452, -2.847189, 2.673178, 1, 1, 1, 1, 1,
0.4433787, -0.5873139, 1.887932, 1, 1, 1, 1, 1,
0.4485587, -0.7146064, 1.932774, 1, 1, 1, 1, 1,
0.4491268, -0.4011065, 0.9600557, 1, 1, 1, 1, 1,
0.4504472, 0.674279, 0.9382478, 1, 1, 1, 1, 1,
0.452655, -0.08614642, 2.178864, 1, 1, 1, 1, 1,
0.4545965, 0.5818571, -0.8124746, 1, 1, 1, 1, 1,
0.4597327, -0.8937406, 1.63253, 1, 1, 1, 1, 1,
0.4607654, -0.3347126, 1.821759, 1, 1, 1, 1, 1,
0.46499, -1.432985, 0.9553826, 1, 1, 1, 1, 1,
0.4673053, 1.365188, 1.055542, 1, 1, 1, 1, 1,
0.4698219, 2.536655, 0.5148256, 1, 1, 1, 1, 1,
0.4724824, 1.102103, -0.2682374, 1, 1, 1, 1, 1,
0.4736115, 0.3822174, 0.2266341, 0, 0, 1, 1, 1,
0.4786371, -0.1954236, 5.100622, 1, 0, 0, 1, 1,
0.4788315, -0.1555008, 1.721769, 1, 0, 0, 1, 1,
0.4789706, -1.564426, 3.201965, 1, 0, 0, 1, 1,
0.4805498, 0.6346555, 1.403428, 1, 0, 0, 1, 1,
0.4807382, 0.5678629, 0.2269468, 1, 0, 0, 1, 1,
0.4877498, -0.3525715, 3.053015, 0, 0, 0, 1, 1,
0.4892855, 0.4305884, -1.20002, 0, 0, 0, 1, 1,
0.4897332, 0.4739892, 2.961232, 0, 0, 0, 1, 1,
0.4942032, 1.562081, -0.3774881, 0, 0, 0, 1, 1,
0.4990219, 1.672268, 0.02328693, 0, 0, 0, 1, 1,
0.5005661, -2.474191, 2.186663, 0, 0, 0, 1, 1,
0.5029945, -0.2095568, 0.7648342, 0, 0, 0, 1, 1,
0.505748, -0.2783628, 2.44473, 1, 1, 1, 1, 1,
0.5092852, 1.435166, -0.3513899, 1, 1, 1, 1, 1,
0.5095874, 1.162523, 0.02926772, 1, 1, 1, 1, 1,
0.5131259, -2.165446, 2.362777, 1, 1, 1, 1, 1,
0.5146928, 2.471117, 1.911563, 1, 1, 1, 1, 1,
0.5158876, 0.439024, -0.670117, 1, 1, 1, 1, 1,
0.5176017, 0.4283118, 0.2178012, 1, 1, 1, 1, 1,
0.5178347, 0.03117819, -0.4194048, 1, 1, 1, 1, 1,
0.5178435, -0.2526931, 1.547804, 1, 1, 1, 1, 1,
0.5206612, 0.09794616, 2.136699, 1, 1, 1, 1, 1,
0.5253581, 1.294779, -0.1302619, 1, 1, 1, 1, 1,
0.5274534, 0.2201401, 0.4570718, 1, 1, 1, 1, 1,
0.5285109, -1.199783, 3.823777, 1, 1, 1, 1, 1,
0.5287691, -0.6834735, 4.164962, 1, 1, 1, 1, 1,
0.5305156, 0.2867965, 0.1097752, 1, 1, 1, 1, 1,
0.5305699, -0.5544523, 0.09720565, 0, 0, 1, 1, 1,
0.5444078, -0.01713046, 1.435877, 1, 0, 0, 1, 1,
0.544548, 0.6844552, 1.323678, 1, 0, 0, 1, 1,
0.5451361, -0.3313158, 1.005551, 1, 0, 0, 1, 1,
0.5452634, -0.2103047, 2.662456, 1, 0, 0, 1, 1,
0.5469731, 0.8219232, 1.638928, 1, 0, 0, 1, 1,
0.5481505, -0.521318, 4.034887, 0, 0, 0, 1, 1,
0.555338, -1.227078, 2.858325, 0, 0, 0, 1, 1,
0.5556194, -0.0359779, 0.65903, 0, 0, 0, 1, 1,
0.5618308, 0.5817665, 0.2877373, 0, 0, 0, 1, 1,
0.5703322, -0.8964592, 2.192724, 0, 0, 0, 1, 1,
0.5713054, -0.1130298, 1.272993, 0, 0, 0, 1, 1,
0.5741381, 0.05218163, 2.693592, 0, 0, 0, 1, 1,
0.5741875, -0.8548751, 1.261764, 1, 1, 1, 1, 1,
0.5742691, -0.2721246, 1.283515, 1, 1, 1, 1, 1,
0.5748652, 0.4540485, 0.8765815, 1, 1, 1, 1, 1,
0.5806447, 1.930857, 0.4135956, 1, 1, 1, 1, 1,
0.5819647, 0.1027235, 1.068576, 1, 1, 1, 1, 1,
0.5883542, 0.5069774, 2.236641, 1, 1, 1, 1, 1,
0.5953274, 0.4931578, 2.346997, 1, 1, 1, 1, 1,
0.5973222, -0.2152639, 0.9729376, 1, 1, 1, 1, 1,
0.5980536, -2.179974, 3.359205, 1, 1, 1, 1, 1,
0.5997592, 0.4657031, 1.789533, 1, 1, 1, 1, 1,
0.6006833, 0.9112471, 0.564583, 1, 1, 1, 1, 1,
0.6012154, 0.05559202, 1.397016, 1, 1, 1, 1, 1,
0.6032792, -0.5926649, 1.905635, 1, 1, 1, 1, 1,
0.6040137, 1.046689, 1.713593, 1, 1, 1, 1, 1,
0.6058574, 1.67075, 0.9662568, 1, 1, 1, 1, 1,
0.6059366, -0.4275748, 2.195131, 0, 0, 1, 1, 1,
0.6066727, -1.195887, 2.014495, 1, 0, 0, 1, 1,
0.620859, -0.8570232, 0.8947023, 1, 0, 0, 1, 1,
0.6234153, -0.3395066, 3.882975, 1, 0, 0, 1, 1,
0.6293987, 0.2903248, 1.188641, 1, 0, 0, 1, 1,
0.6310386, 0.9801247, 1.269382, 1, 0, 0, 1, 1,
0.638725, 0.2530799, -0.1278254, 0, 0, 0, 1, 1,
0.64373, 1.239448, 1.408494, 0, 0, 0, 1, 1,
0.6447616, -0.2714806, 1.396093, 0, 0, 0, 1, 1,
0.6602411, 3.092628, 0.1222448, 0, 0, 0, 1, 1,
0.6684098, -1.100649, 0.5603869, 0, 0, 0, 1, 1,
0.6685045, -1.086389, 2.240019, 0, 0, 0, 1, 1,
0.6752368, -0.5252502, 2.386966, 0, 0, 0, 1, 1,
0.678346, 0.8123356, 0.7206843, 1, 1, 1, 1, 1,
0.6822097, -0.2555268, 2.001445, 1, 1, 1, 1, 1,
0.6840194, 0.6765031, 0.4733688, 1, 1, 1, 1, 1,
0.6852224, -0.7144909, 1.924883, 1, 1, 1, 1, 1,
0.6908459, 1.237534, 1.676509, 1, 1, 1, 1, 1,
0.6913602, -1.107943, 2.75189, 1, 1, 1, 1, 1,
0.7022341, -0.01448535, 0.3728281, 1, 1, 1, 1, 1,
0.7074384, -1.315577, 2.342963, 1, 1, 1, 1, 1,
0.7087936, -0.6000243, 2.50617, 1, 1, 1, 1, 1,
0.711579, -0.3649899, 1.506809, 1, 1, 1, 1, 1,
0.7170868, -0.3322578, 1.778626, 1, 1, 1, 1, 1,
0.7255999, 1.599363, 1.652699, 1, 1, 1, 1, 1,
0.7268357, -0.4691493, 3.510375, 1, 1, 1, 1, 1,
0.7300677, 0.01339726, 1.416517, 1, 1, 1, 1, 1,
0.7307251, 0.5366992, -1.148354, 1, 1, 1, 1, 1,
0.7309256, -0.3755374, 2.087069, 0, 0, 1, 1, 1,
0.7315467, -1.530529, 3.012498, 1, 0, 0, 1, 1,
0.7363006, -0.4347422, 3.95488, 1, 0, 0, 1, 1,
0.7366007, -1.473404, 2.42726, 1, 0, 0, 1, 1,
0.7375392, -1.898147, 3.184074, 1, 0, 0, 1, 1,
0.7449707, -2.47782, 0.8730241, 1, 0, 0, 1, 1,
0.7469516, -0.5615534, 2.843499, 0, 0, 0, 1, 1,
0.7478434, 0.2665419, 1.190625, 0, 0, 0, 1, 1,
0.7532262, -1.068985, -0.09531744, 0, 0, 0, 1, 1,
0.7579454, 1.514189, 0.6927432, 0, 0, 0, 1, 1,
0.7586516, 0.562218, 1.046643, 0, 0, 0, 1, 1,
0.759221, -1.157935, 1.897832, 0, 0, 0, 1, 1,
0.7594302, 0.513099, 2.738961, 0, 0, 0, 1, 1,
0.7649894, 1.249984, 1.125005, 1, 1, 1, 1, 1,
0.7738627, 0.617761, 0.9512724, 1, 1, 1, 1, 1,
0.778505, 0.3316703, 1.91663, 1, 1, 1, 1, 1,
0.7847015, -2.088423, 2.580524, 1, 1, 1, 1, 1,
0.7866877, 1.52729, 2.159189, 1, 1, 1, 1, 1,
0.7878885, -0.2603065, 1.910557, 1, 1, 1, 1, 1,
0.7914054, 1.212123, -0.103694, 1, 1, 1, 1, 1,
0.7946666, 0.7920547, -0.2136179, 1, 1, 1, 1, 1,
0.7979109, -1.640762, 3.499465, 1, 1, 1, 1, 1,
0.7989423, -1.132439, 2.846202, 1, 1, 1, 1, 1,
0.8025899, 0.4414482, 0.524063, 1, 1, 1, 1, 1,
0.8051597, 1.008439, -1.537518, 1, 1, 1, 1, 1,
0.8112969, -1.149442, 2.035393, 1, 1, 1, 1, 1,
0.8188843, -1.398798, 2.883576, 1, 1, 1, 1, 1,
0.8221458, -0.7800349, 3.626553, 1, 1, 1, 1, 1,
0.8301048, -0.1274966, 2.44488, 0, 0, 1, 1, 1,
0.8326107, -1.206431, 2.070827, 1, 0, 0, 1, 1,
0.8346913, 0.5506915, 1.218621, 1, 0, 0, 1, 1,
0.838631, -2.403004, 2.379136, 1, 0, 0, 1, 1,
0.8428783, -0.3627071, 3.430475, 1, 0, 0, 1, 1,
0.8431855, 0.9018705, 2.356745, 1, 0, 0, 1, 1,
0.8432442, 0.6447267, -0.3583767, 0, 0, 0, 1, 1,
0.8446013, -0.7711455, -0.15241, 0, 0, 0, 1, 1,
0.8450662, -0.02640563, 2.284537, 0, 0, 0, 1, 1,
0.8475732, -0.5191838, 3.739597, 0, 0, 0, 1, 1,
0.8499407, -0.7656574, 3.64341, 0, 0, 0, 1, 1,
0.8505285, 0.06283371, 0.07783525, 0, 0, 0, 1, 1,
0.850735, 1.36087, 1.595102, 0, 0, 0, 1, 1,
0.8509383, -0.04550528, 1.597408, 1, 1, 1, 1, 1,
0.8517063, -0.9663845, 2.758464, 1, 1, 1, 1, 1,
0.8602047, -0.556073, 0.9458338, 1, 1, 1, 1, 1,
0.866693, -0.6876377, 3.45374, 1, 1, 1, 1, 1,
0.8668558, 1.356974, 0.39047, 1, 1, 1, 1, 1,
0.869681, 1.468719, -2.252324, 1, 1, 1, 1, 1,
0.8755593, 0.1179932, 0.6780503, 1, 1, 1, 1, 1,
0.8786298, -0.7123735, 1.680136, 1, 1, 1, 1, 1,
0.8830295, -2.420089, 3.18138, 1, 1, 1, 1, 1,
0.8836578, 0.04538126, 0.7928914, 1, 1, 1, 1, 1,
0.8900676, 0.7428322, 1.553596, 1, 1, 1, 1, 1,
0.8908008, -0.7732729, 0.6202481, 1, 1, 1, 1, 1,
0.8956133, 0.7604769, -1.338148, 1, 1, 1, 1, 1,
0.8960555, -1.24878, 2.973838, 1, 1, 1, 1, 1,
0.8961459, 0.3120233, 0.2806481, 1, 1, 1, 1, 1,
0.9051005, -1.415897, 2.123242, 0, 0, 1, 1, 1,
0.9227123, 0.459704, 0.7920399, 1, 0, 0, 1, 1,
0.9245898, 1.497124, -0.2679292, 1, 0, 0, 1, 1,
0.925153, -1.314686, 4.966625, 1, 0, 0, 1, 1,
0.9278661, -1.188398, 1.108411, 1, 0, 0, 1, 1,
0.9296879, 2.274793, -0.3610144, 1, 0, 0, 1, 1,
0.929736, 1.167507, 1.426048, 0, 0, 0, 1, 1,
0.9337668, 0.5403079, 0.9951772, 0, 0, 0, 1, 1,
0.9338551, -1.016637, 0.721047, 0, 0, 0, 1, 1,
0.9357964, 1.089751, 1.40726, 0, 0, 0, 1, 1,
0.937277, 0.3007628, 0.6755678, 0, 0, 0, 1, 1,
0.9382675, -0.8826166, 3.365449, 0, 0, 0, 1, 1,
0.9411168, -0.2111076, 1.817147, 0, 0, 0, 1, 1,
0.9425624, -1.687697, 1.484734, 1, 1, 1, 1, 1,
0.9433568, -1.491513, 3.49819, 1, 1, 1, 1, 1,
0.9434586, 1.253312, 2.0192, 1, 1, 1, 1, 1,
0.9481282, 0.9374373, 1.580411, 1, 1, 1, 1, 1,
0.9484617, 0.8214806, -1.080765, 1, 1, 1, 1, 1,
0.9510441, 0.3556389, 1.36584, 1, 1, 1, 1, 1,
0.9559041, -0.4677989, 1.659723, 1, 1, 1, 1, 1,
0.9635898, -1.239912, 0.7171835, 1, 1, 1, 1, 1,
0.9668193, -1.192126, 1.544583, 1, 1, 1, 1, 1,
0.9758624, 1.313817, 0.1603874, 1, 1, 1, 1, 1,
0.9773113, 0.2913837, 3.144387, 1, 1, 1, 1, 1,
0.9793829, -0.604674, 0.3537807, 1, 1, 1, 1, 1,
0.98063, 2.461085, 0.2578259, 1, 1, 1, 1, 1,
0.9869521, 1.751952, -0.4091966, 1, 1, 1, 1, 1,
0.9936103, 0.218891, 1.212813, 1, 1, 1, 1, 1,
0.9942003, 1.359384, 0.8191683, 0, 0, 1, 1, 1,
0.9967171, 1.072749, 0.2750742, 1, 0, 0, 1, 1,
1.009877, 0.5516177, 0.6506418, 1, 0, 0, 1, 1,
1.014608, 1.077648, 0.9499004, 1, 0, 0, 1, 1,
1.014824, 0.1844529, 0.9382815, 1, 0, 0, 1, 1,
1.017336, 1.315321, -0.7350188, 1, 0, 0, 1, 1,
1.020806, -0.6540782, 2.826578, 0, 0, 0, 1, 1,
1.02145, -0.6298288, 3.280876, 0, 0, 0, 1, 1,
1.027314, 0.2161241, 1.835767, 0, 0, 0, 1, 1,
1.027901, 0.04092913, 0.8205232, 0, 0, 0, 1, 1,
1.032142, -0.5405744, 3.445288, 0, 0, 0, 1, 1,
1.032885, -1.189654, 1.657581, 0, 0, 0, 1, 1,
1.03839, -1.164396, 1.275337, 0, 0, 0, 1, 1,
1.045035, -0.03102374, 1.441009, 1, 1, 1, 1, 1,
1.048605, -0.7224853, 2.597955, 1, 1, 1, 1, 1,
1.057066, 2.372501, 1.40222, 1, 1, 1, 1, 1,
1.058224, -0.6176561, 2.025994, 1, 1, 1, 1, 1,
1.067862, -0.3241913, 1.209103, 1, 1, 1, 1, 1,
1.070579, -0.4142322, 2.571277, 1, 1, 1, 1, 1,
1.073959, 0.3084401, 0.7236543, 1, 1, 1, 1, 1,
1.076647, 0.1868244, 1.278534, 1, 1, 1, 1, 1,
1.077107, 0.07203056, 0.8809657, 1, 1, 1, 1, 1,
1.07756, 0.5360981, 0.8441694, 1, 1, 1, 1, 1,
1.083179, -0.5724454, 1.56179, 1, 1, 1, 1, 1,
1.091926, -1.294261, 4.334692, 1, 1, 1, 1, 1,
1.092236, 1.075149, 0.03277689, 1, 1, 1, 1, 1,
1.092718, 0.8316079, 0.6321834, 1, 1, 1, 1, 1,
1.093137, 1.099578, 2.364829, 1, 1, 1, 1, 1,
1.093443, -1.197128, 0.9938128, 0, 0, 1, 1, 1,
1.099583, -0.1680216, 2.315412, 1, 0, 0, 1, 1,
1.100776, -0.3312549, 0.9813713, 1, 0, 0, 1, 1,
1.126016, -0.4120314, 0.8092742, 1, 0, 0, 1, 1,
1.129786, 0.4523392, 0.258844, 1, 0, 0, 1, 1,
1.137943, 0.5160816, -0.5302143, 1, 0, 0, 1, 1,
1.139327, -1.299304, 2.781738, 0, 0, 0, 1, 1,
1.140227, -0.2628347, 3.233909, 0, 0, 0, 1, 1,
1.143515, -0.4441961, 1.902832, 0, 0, 0, 1, 1,
1.149379, -1.011596, 1.651619, 0, 0, 0, 1, 1,
1.151583, 0.8925467, 0.3618408, 0, 0, 0, 1, 1,
1.154439, 0.5497462, -0.2061821, 0, 0, 0, 1, 1,
1.159142, -0.928749, 2.32213, 0, 0, 0, 1, 1,
1.160959, 0.1984264, 0.7244967, 1, 1, 1, 1, 1,
1.168968, 1.071207, 2.130117, 1, 1, 1, 1, 1,
1.172966, -0.06295893, 2.288812, 1, 1, 1, 1, 1,
1.188139, 0.1848659, -0.3814853, 1, 1, 1, 1, 1,
1.210512, 0.2125928, -0.3726584, 1, 1, 1, 1, 1,
1.229915, 0.0769609, 1.622487, 1, 1, 1, 1, 1,
1.230845, 1.086241, 0.1145574, 1, 1, 1, 1, 1,
1.233628, -1.385288, 2.836489, 1, 1, 1, 1, 1,
1.242097, -1.841323, 5.485395, 1, 1, 1, 1, 1,
1.262443, 1.156228, 0.5454639, 1, 1, 1, 1, 1,
1.264031, 0.3363219, 1.786628, 1, 1, 1, 1, 1,
1.269761, 0.9423156, 2.25867, 1, 1, 1, 1, 1,
1.27297, 1.094195, -0.2671278, 1, 1, 1, 1, 1,
1.276508, -1.977981, 2.403833, 1, 1, 1, 1, 1,
1.284814, 1.422393, 1.066828, 1, 1, 1, 1, 1,
1.28754, 0.7998704, 2.184326, 0, 0, 1, 1, 1,
1.290272, 0.3098387, -0.1053058, 1, 0, 0, 1, 1,
1.324754, 0.1702142, 1.732314, 1, 0, 0, 1, 1,
1.329441, 2.577645, -0.4566628, 1, 0, 0, 1, 1,
1.329752, 1.295126, 1.58146, 1, 0, 0, 1, 1,
1.329798, 0.224467, -0.111597, 1, 0, 0, 1, 1,
1.332356, 0.5791166, 0.6441706, 0, 0, 0, 1, 1,
1.337218, -1.619511, 3.545553, 0, 0, 0, 1, 1,
1.341365, -1.68749, 3.834697, 0, 0, 0, 1, 1,
1.346369, 0.1441869, 3.073862, 0, 0, 0, 1, 1,
1.349243, -0.8457515, 1.098342, 0, 0, 0, 1, 1,
1.349997, -0.7187958, 2.706076, 0, 0, 0, 1, 1,
1.35708, -0.8216417, 1.906449, 0, 0, 0, 1, 1,
1.358327, 0.5217559, 1.128096, 1, 1, 1, 1, 1,
1.365043, -1.617411, 1.695867, 1, 1, 1, 1, 1,
1.371677, 0.05448655, 3.113028, 1, 1, 1, 1, 1,
1.374566, 0.4146157, 1.981053, 1, 1, 1, 1, 1,
1.385456, -0.761272, 1.369299, 1, 1, 1, 1, 1,
1.390244, 0.03733983, 2.048236, 1, 1, 1, 1, 1,
1.392952, 0.8567532, 1.482212, 1, 1, 1, 1, 1,
1.407389, 0.729118, 0.57781, 1, 1, 1, 1, 1,
1.409608, 1.676604, 1.070971, 1, 1, 1, 1, 1,
1.413274, -1.789737, 3.011478, 1, 1, 1, 1, 1,
1.414322, 0.5812311, 1.250588, 1, 1, 1, 1, 1,
1.416622, 0.1917, 2.491347, 1, 1, 1, 1, 1,
1.420016, 0.2569987, 1.959546, 1, 1, 1, 1, 1,
1.421546, -0.3694858, 1.217287, 1, 1, 1, 1, 1,
1.423072, -1.68502, 3.076867, 1, 1, 1, 1, 1,
1.423846, 0.8241733, -0.7255794, 0, 0, 1, 1, 1,
1.426041, 0.8873833, 1.219033, 1, 0, 0, 1, 1,
1.430403, -0.5511206, 0.9553224, 1, 0, 0, 1, 1,
1.432616, -0.294258, 0.8818781, 1, 0, 0, 1, 1,
1.434358, -0.5218906, 2.239535, 1, 0, 0, 1, 1,
1.438455, -1.866901, 1.40407, 1, 0, 0, 1, 1,
1.441262, -0.6286512, 2.441876, 0, 0, 0, 1, 1,
1.448409, 0.8520454, 2.123638, 0, 0, 0, 1, 1,
1.460562, 0.7458808, 1.753376, 0, 0, 0, 1, 1,
1.471484, 0.1669289, 0.4709304, 0, 0, 0, 1, 1,
1.486048, -1.34346, 3.697784, 0, 0, 0, 1, 1,
1.534289, -0.6563872, 0.2973484, 0, 0, 0, 1, 1,
1.549125, 0.4172346, 1.64302, 0, 0, 0, 1, 1,
1.549725, 0.2668289, 1.184186, 1, 1, 1, 1, 1,
1.553311, 0.7123298, 0.781248, 1, 1, 1, 1, 1,
1.558, 0.05083151, 1.135088, 1, 1, 1, 1, 1,
1.563438, -0.8558003, 1.668386, 1, 1, 1, 1, 1,
1.565638, -0.6504272, 2.899232, 1, 1, 1, 1, 1,
1.567878, -0.1421408, 2.451234, 1, 1, 1, 1, 1,
1.57097, 0.05839551, 2.44231, 1, 1, 1, 1, 1,
1.583451, 1.124938, 0.7391969, 1, 1, 1, 1, 1,
1.589791, 0.5541095, 2.264208, 1, 1, 1, 1, 1,
1.592028, 1.718283, 0.3496224, 1, 1, 1, 1, 1,
1.596257, 0.4666631, 0.791922, 1, 1, 1, 1, 1,
1.605232, 0.1744476, -0.1159569, 1, 1, 1, 1, 1,
1.606783, 0.6970022, -0.2055579, 1, 1, 1, 1, 1,
1.612889, 0.7999917, -1.290424, 1, 1, 1, 1, 1,
1.630213, 0.2889501, -0.6352111, 1, 1, 1, 1, 1,
1.643718, 0.7234538, 0.5467316, 0, 0, 1, 1, 1,
1.679536, 0.02453581, 1.640043, 1, 0, 0, 1, 1,
1.690545, -0.3841322, 1.443404, 1, 0, 0, 1, 1,
1.732212, 0.8478341, 1.630928, 1, 0, 0, 1, 1,
1.738638, -2.043094, 2.313262, 1, 0, 0, 1, 1,
1.765061, 1.06206, 1.086254, 1, 0, 0, 1, 1,
1.767026, -0.0177931, 2.210561, 0, 0, 0, 1, 1,
1.776782, -0.9591137, 1.271353, 0, 0, 0, 1, 1,
1.790635, 1.394144, -1.178106, 0, 0, 0, 1, 1,
1.807244, -0.7607145, -0.2523129, 0, 0, 0, 1, 1,
1.854384, -0.1733111, -0.1660527, 0, 0, 0, 1, 1,
1.858354, -0.6586155, 0.8900488, 0, 0, 0, 1, 1,
1.879378, -0.2619076, 0.1398833, 0, 0, 0, 1, 1,
1.914054, 1.793961, 1.538566, 1, 1, 1, 1, 1,
1.917168, -1.227272, 2.801104, 1, 1, 1, 1, 1,
1.917934, -0.2903746, 1.484431, 1, 1, 1, 1, 1,
1.925078, -0.1187, 0.9613935, 1, 1, 1, 1, 1,
1.949642, -0.9568848, 1.812364, 1, 1, 1, 1, 1,
1.988275, -1.074428, 0.7894796, 1, 1, 1, 1, 1,
2.036609, -1.588464, 1.790913, 1, 1, 1, 1, 1,
2.038707, 0.7582344, 4.465435, 1, 1, 1, 1, 1,
2.05605, 0.394618, 2.014835, 1, 1, 1, 1, 1,
2.086337, 0.8857499, -0.01189507, 1, 1, 1, 1, 1,
2.094011, 0.5120707, 1.807282, 1, 1, 1, 1, 1,
2.118329, -2.300749, 2.609554, 1, 1, 1, 1, 1,
2.119642, -0.2379856, 0.7953994, 1, 1, 1, 1, 1,
2.141468, 0.1748513, 1.899511, 1, 1, 1, 1, 1,
2.172026, 2.009088, -0.1468517, 1, 1, 1, 1, 1,
2.174663, 0.01651027, 2.166477, 0, 0, 1, 1, 1,
2.177738, -0.8266079, 2.102871, 1, 0, 0, 1, 1,
2.20843, -1.27381, 0.1992568, 1, 0, 0, 1, 1,
2.22326, -2.261511, 3.568263, 1, 0, 0, 1, 1,
2.225902, 0.1363706, 1.521264, 1, 0, 0, 1, 1,
2.22718, 0.6834942, 1.801468, 1, 0, 0, 1, 1,
2.244112, -1.501994, 1.915515, 0, 0, 0, 1, 1,
2.251535, -0.3326543, 0.6238432, 0, 0, 0, 1, 1,
2.284429, -0.2950041, 2.494145, 0, 0, 0, 1, 1,
2.302679, 0.1928429, 2.707608, 0, 0, 0, 1, 1,
2.309086, -1.595254, 3.33959, 0, 0, 0, 1, 1,
2.319838, 0.047235, 1.56969, 0, 0, 0, 1, 1,
2.333039, 0.1848648, 1.548103, 0, 0, 0, 1, 1,
2.339915, 0.4227925, 2.724648, 1, 1, 1, 1, 1,
2.445843, -0.7512752, 2.656675, 1, 1, 1, 1, 1,
2.648637, -0.147208, 1.323637, 1, 1, 1, 1, 1,
2.723656, -0.2025593, 3.218375, 1, 1, 1, 1, 1,
2.847625, -2.410406, 2.37183, 1, 1, 1, 1, 1,
3.258416, 0.6096527, 0.8407223, 1, 1, 1, 1, 1,
3.294479, -2.402599, 0.9162544, 1, 1, 1, 1, 1
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
var radius = 9.753011;
var distance = 34.25703;
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
mvMatrix.translate( 0.2148957, -0.4698257, -0.1892452 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.25703);
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
