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
-3.233578, 0.1158481, -1.693709, 1, 0, 0, 1,
-2.768989, 0.8867536, -2.065086, 1, 0.007843138, 0, 1,
-2.436949, 1.446979, 0.3208539, 1, 0.01176471, 0, 1,
-2.301414, 0.2824894, -0.6115458, 1, 0.01960784, 0, 1,
-2.239202, -0.3622809, -3.128279, 1, 0.02352941, 0, 1,
-2.195673, 0.8484309, -1.071041, 1, 0.03137255, 0, 1,
-2.188121, -0.7017024, -2.439064, 1, 0.03529412, 0, 1,
-2.171601, -1.172624, -3.5685, 1, 0.04313726, 0, 1,
-2.125615, 1.210865, -0.9174854, 1, 0.04705882, 0, 1,
-2.125598, 2.667436, 0.3409968, 1, 0.05490196, 0, 1,
-2.080817, -1.09619, -2.25449, 1, 0.05882353, 0, 1,
-2.06909, -0.2418585, -0.4234478, 1, 0.06666667, 0, 1,
-2.050143, -0.564806, -2.5624, 1, 0.07058824, 0, 1,
-2.021811, 1.506835, -2.60297, 1, 0.07843138, 0, 1,
-1.993274, -0.2310457, -1.52598, 1, 0.08235294, 0, 1,
-1.992785, -0.03542364, -2.325349, 1, 0.09019608, 0, 1,
-1.989519, -0.1559574, -3.193696, 1, 0.09411765, 0, 1,
-1.97283, -0.720945, -1.624943, 1, 0.1019608, 0, 1,
-1.968278, 1.025375, -0.1651535, 1, 0.1098039, 0, 1,
-1.953892, -1.607438, -2.351247, 1, 0.1137255, 0, 1,
-1.927798, 0.7162763, -2.693562, 1, 0.1215686, 0, 1,
-1.896744, 1.183718, -0.2588068, 1, 0.1254902, 0, 1,
-1.891108, -0.3860345, -0.8588294, 1, 0.1333333, 0, 1,
-1.838736, -0.3309235, -0.7615933, 1, 0.1372549, 0, 1,
-1.835168, 0.8152534, -1.566421, 1, 0.145098, 0, 1,
-1.796977, 1.194625, -1.312966, 1, 0.1490196, 0, 1,
-1.796708, 0.6262742, -1.428614, 1, 0.1568628, 0, 1,
-1.782942, 0.02236538, -1.560306, 1, 0.1607843, 0, 1,
-1.777107, -2.57041, -2.616958, 1, 0.1686275, 0, 1,
-1.766937, -0.4131074, -1.960651, 1, 0.172549, 0, 1,
-1.766311, -0.6790174, -2.050519, 1, 0.1803922, 0, 1,
-1.765744, 0.3518567, -1.157648, 1, 0.1843137, 0, 1,
-1.729438, -0.3790781, -2.203026, 1, 0.1921569, 0, 1,
-1.72943, -0.4773637, -0.1089429, 1, 0.1960784, 0, 1,
-1.726356, -0.9022322, -1.269295, 1, 0.2039216, 0, 1,
-1.724158, -0.2305798, -2.106897, 1, 0.2117647, 0, 1,
-1.721224, -1.453449, -3.964645, 1, 0.2156863, 0, 1,
-1.67903, -0.9343755, -3.23222, 1, 0.2235294, 0, 1,
-1.64989, -0.4121125, -1.337266, 1, 0.227451, 0, 1,
-1.648278, 1.100029, -0.4888057, 1, 0.2352941, 0, 1,
-1.64628, -0.5631897, -1.300183, 1, 0.2392157, 0, 1,
-1.637343, -0.3219438, -2.88238, 1, 0.2470588, 0, 1,
-1.633102, 0.6328562, -1.04102, 1, 0.2509804, 0, 1,
-1.613214, 1.212675, -0.5478096, 1, 0.2588235, 0, 1,
-1.607638, -0.2471476, -1.771127, 1, 0.2627451, 0, 1,
-1.597941, -0.01753299, -1.242101, 1, 0.2705882, 0, 1,
-1.557185, 0.2760454, -1.233801, 1, 0.2745098, 0, 1,
-1.552786, -0.8363129, -1.950089, 1, 0.282353, 0, 1,
-1.546663, -0.2064688, -1.734431, 1, 0.2862745, 0, 1,
-1.536991, -0.5369961, -2.192149, 1, 0.2941177, 0, 1,
-1.516309, 0.9229947, -1.922278, 1, 0.3019608, 0, 1,
-1.514875, 1.138972, -0.9753942, 1, 0.3058824, 0, 1,
-1.506756, 0.1258328, -1.03338, 1, 0.3137255, 0, 1,
-1.491783, 1.825911, -1.147985, 1, 0.3176471, 0, 1,
-1.487183, 0.7501482, 0.7319089, 1, 0.3254902, 0, 1,
-1.486981, 0.08406229, -0.8251876, 1, 0.3294118, 0, 1,
-1.477498, 2.704484, -0.5724527, 1, 0.3372549, 0, 1,
-1.477051, 0.07111609, -0.4007181, 1, 0.3411765, 0, 1,
-1.460483, 0.004667954, 0.3621962, 1, 0.3490196, 0, 1,
-1.458954, -2.345971, -2.675317, 1, 0.3529412, 0, 1,
-1.45413, -2.08041, -4.966062, 1, 0.3607843, 0, 1,
-1.448246, -1.501887, -1.070902, 1, 0.3647059, 0, 1,
-1.440608, -0.8704428, -0.5248821, 1, 0.372549, 0, 1,
-1.437329, 0.427947, 0.5135559, 1, 0.3764706, 0, 1,
-1.427795, -0.1233432, -2.037646, 1, 0.3843137, 0, 1,
-1.418995, 0.9963633, -1.145155, 1, 0.3882353, 0, 1,
-1.416927, -0.3453656, -2.44649, 1, 0.3960784, 0, 1,
-1.410298, -0.6712335, -1.673212, 1, 0.4039216, 0, 1,
-1.390144, -0.06765962, -0.9104477, 1, 0.4078431, 0, 1,
-1.389909, 1.100242, -1.584159, 1, 0.4156863, 0, 1,
-1.380925, 0.9947498, -0.8543046, 1, 0.4196078, 0, 1,
-1.379299, -1.135418, -2.556626, 1, 0.427451, 0, 1,
-1.378233, 0.8631353, -3.173, 1, 0.4313726, 0, 1,
-1.372567, 0.3226117, -2.682686, 1, 0.4392157, 0, 1,
-1.365055, 0.5845947, -0.8587329, 1, 0.4431373, 0, 1,
-1.36421, 0.376277, 0.3317563, 1, 0.4509804, 0, 1,
-1.362291, -1.978353, -1.573592, 1, 0.454902, 0, 1,
-1.352825, 0.03103613, -1.530742, 1, 0.4627451, 0, 1,
-1.351783, -0.05451335, -2.301193, 1, 0.4666667, 0, 1,
-1.349243, 0.4451699, -1.19282, 1, 0.4745098, 0, 1,
-1.341691, -0.9075267, -2.291718, 1, 0.4784314, 0, 1,
-1.329092, -0.4186484, -0.9712837, 1, 0.4862745, 0, 1,
-1.328485, -0.9415925, -2.354147, 1, 0.4901961, 0, 1,
-1.32665, -0.1714655, -0.4517001, 1, 0.4980392, 0, 1,
-1.318735, 0.5162429, 0.2615674, 1, 0.5058824, 0, 1,
-1.313565, -1.043771, -1.541482, 1, 0.509804, 0, 1,
-1.309988, -0.7825601, -2.261024, 1, 0.5176471, 0, 1,
-1.297304, -1.892871, -2.207082, 1, 0.5215687, 0, 1,
-1.293446, 0.8646083, -1.879134, 1, 0.5294118, 0, 1,
-1.291507, 1.946681, 0.1019931, 1, 0.5333334, 0, 1,
-1.289821, -1.009674, -1.084549, 1, 0.5411765, 0, 1,
-1.287493, -1.317919, -2.096874, 1, 0.5450981, 0, 1,
-1.281871, -1.35368, -1.170781, 1, 0.5529412, 0, 1,
-1.280909, 0.4313073, -1.069155, 1, 0.5568628, 0, 1,
-1.264577, 0.2833133, -1.05043, 1, 0.5647059, 0, 1,
-1.245383, 0.4123148, -1.376119, 1, 0.5686275, 0, 1,
-1.203939, 0.7070121, -1.268797, 1, 0.5764706, 0, 1,
-1.195638, 0.7108487, -2.47058, 1, 0.5803922, 0, 1,
-1.186446, 0.07581851, -1.67165, 1, 0.5882353, 0, 1,
-1.185126, -0.2175724, -2.539659, 1, 0.5921569, 0, 1,
-1.18412, -0.9839008, -0.6876578, 1, 0.6, 0, 1,
-1.180459, 0.8078385, -0.6972822, 1, 0.6078432, 0, 1,
-1.17391, 1.37679, 0.6592308, 1, 0.6117647, 0, 1,
-1.170932, 1.81839, -0.6501073, 1, 0.6196079, 0, 1,
-1.170394, -1.072973, -2.599501, 1, 0.6235294, 0, 1,
-1.169838, 0.6246299, 0.159421, 1, 0.6313726, 0, 1,
-1.169459, -0.7933101, -2.445608, 1, 0.6352941, 0, 1,
-1.168121, 1.508052, 0.6294509, 1, 0.6431373, 0, 1,
-1.165875, -1.487397, -3.09983, 1, 0.6470588, 0, 1,
-1.159021, 1.430288, -1.278215, 1, 0.654902, 0, 1,
-1.158448, -0.7444713, -1.175007, 1, 0.6588235, 0, 1,
-1.157056, -2.340669, -2.3209, 1, 0.6666667, 0, 1,
-1.149871, 1.091655, -1.664865, 1, 0.6705883, 0, 1,
-1.149691, -0.2594174, -0.6896512, 1, 0.6784314, 0, 1,
-1.142856, 0.4584755, -1.529112, 1, 0.682353, 0, 1,
-1.140254, 2.045764, -0.871219, 1, 0.6901961, 0, 1,
-1.139301, 2.040633, -1.225462, 1, 0.6941177, 0, 1,
-1.132446, -1.305182, -2.655723, 1, 0.7019608, 0, 1,
-1.12373, 0.7639978, -1.55708, 1, 0.7098039, 0, 1,
-1.122053, -0.4405049, -2.773627, 1, 0.7137255, 0, 1,
-1.119201, 0.9379604, -1.573429, 1, 0.7215686, 0, 1,
-1.114918, -0.893427, -2.522855, 1, 0.7254902, 0, 1,
-1.112979, 0.8217657, -0.9107032, 1, 0.7333333, 0, 1,
-1.108813, -0.5266178, -1.23685, 1, 0.7372549, 0, 1,
-1.105823, 1.914722, 0.9567254, 1, 0.7450981, 0, 1,
-1.093932, -1.743943, -2.694, 1, 0.7490196, 0, 1,
-1.093015, 0.7792214, 0.1645312, 1, 0.7568628, 0, 1,
-1.092159, -0.04747456, -0.9589412, 1, 0.7607843, 0, 1,
-1.088545, -0.1059286, -1.398629, 1, 0.7686275, 0, 1,
-1.082648, 0.6772678, -1.118916, 1, 0.772549, 0, 1,
-1.082298, -0.4893358, 0.3495717, 1, 0.7803922, 0, 1,
-1.078176, -0.8829265, -1.73636, 1, 0.7843137, 0, 1,
-1.069256, -0.7458968, -3.444751, 1, 0.7921569, 0, 1,
-1.066572, -0.5121799, -0.1537137, 1, 0.7960784, 0, 1,
-1.062679, 1.518789, 0.1902045, 1, 0.8039216, 0, 1,
-1.059278, 0.3727848, -0.5455825, 1, 0.8117647, 0, 1,
-1.048099, -1.060243, -2.467808, 1, 0.8156863, 0, 1,
-1.047095, 0.5142702, -2.405388, 1, 0.8235294, 0, 1,
-1.043696, 0.1934662, -2.604801, 1, 0.827451, 0, 1,
-1.042667, 0.2845595, -1.005361, 1, 0.8352941, 0, 1,
-1.038363, -2.197296, -3.05384, 1, 0.8392157, 0, 1,
-1.035137, 0.9878989, -1.65808, 1, 0.8470588, 0, 1,
-1.029136, -0.7811689, -2.032042, 1, 0.8509804, 0, 1,
-1.018518, 0.505061, -3.776431, 1, 0.8588235, 0, 1,
-1.017355, -1.550369, -3.063445, 1, 0.8627451, 0, 1,
-1.017109, -0.2718162, -3.494995, 1, 0.8705882, 0, 1,
-1.016856, 2.558493, -0.861927, 1, 0.8745098, 0, 1,
-1.016093, -0.02810428, -1.323363, 1, 0.8823529, 0, 1,
-1.015208, -0.8312862, -2.197724, 1, 0.8862745, 0, 1,
-1.000555, -0.7825245, -1.789935, 1, 0.8941177, 0, 1,
-0.9995347, -0.04668408, -2.849835, 1, 0.8980392, 0, 1,
-0.9992905, 0.5058546, -0.7626603, 1, 0.9058824, 0, 1,
-0.9859315, -0.3072584, -2.711058, 1, 0.9137255, 0, 1,
-0.9758071, -0.4415945, -2.897027, 1, 0.9176471, 0, 1,
-0.969982, 0.08331243, -0.9758061, 1, 0.9254902, 0, 1,
-0.9660532, 0.9856236, -0.7285389, 1, 0.9294118, 0, 1,
-0.9656765, -2.036361, -1.785442, 1, 0.9372549, 0, 1,
-0.9639522, 1.553555, -0.3882539, 1, 0.9411765, 0, 1,
-0.9614206, -0.01327161, -0.8999398, 1, 0.9490196, 0, 1,
-0.9574758, 1.608252, -2.441936, 1, 0.9529412, 0, 1,
-0.9561757, -1.190675, -1.613962, 1, 0.9607843, 0, 1,
-0.9465247, 0.1008309, -0.8833804, 1, 0.9647059, 0, 1,
-0.9357266, 1.041334, -0.1164844, 1, 0.972549, 0, 1,
-0.9342699, 0.2428332, -0.5514196, 1, 0.9764706, 0, 1,
-0.928617, 1.180807, -1.215482, 1, 0.9843137, 0, 1,
-0.9193342, 0.8541716, -1.259467, 1, 0.9882353, 0, 1,
-0.9128857, -0.9568315, -2.288568, 1, 0.9960784, 0, 1,
-0.9096996, 0.5003585, -1.340471, 0.9960784, 1, 0, 1,
-0.9052555, -2.039854, -3.067804, 0.9921569, 1, 0, 1,
-0.9027717, -0.09214789, -1.058183, 0.9843137, 1, 0, 1,
-0.8974404, 2.048755, 0.5237346, 0.9803922, 1, 0, 1,
-0.8952554, 1.650645, -0.1658123, 0.972549, 1, 0, 1,
-0.8929992, -0.1594009, -0.9495493, 0.9686275, 1, 0, 1,
-0.8923936, -1.964069, -1.782911, 0.9607843, 1, 0, 1,
-0.8891553, 0.5167046, -1.598611, 0.9568627, 1, 0, 1,
-0.8881952, -0.1829237, -0.6368623, 0.9490196, 1, 0, 1,
-0.857168, -0.7462742, -2.984412, 0.945098, 1, 0, 1,
-0.8567556, -1.886824, -3.037406, 0.9372549, 1, 0, 1,
-0.8556718, 1.106445, -0.2239659, 0.9333333, 1, 0, 1,
-0.853932, -0.2079445, -1.825381, 0.9254902, 1, 0, 1,
-0.8539171, -0.5302644, -3.563669, 0.9215686, 1, 0, 1,
-0.8538212, -1.615027, -2.03482, 0.9137255, 1, 0, 1,
-0.8512775, 0.1639834, -1.894857, 0.9098039, 1, 0, 1,
-0.8479721, 1.04177, -2.106954, 0.9019608, 1, 0, 1,
-0.8461276, -2.262373, -2.208023, 0.8941177, 1, 0, 1,
-0.8447057, 0.5148737, -1.968288, 0.8901961, 1, 0, 1,
-0.8385789, 2.166522, 1.46124, 0.8823529, 1, 0, 1,
-0.837231, -2.137334, -4.094781, 0.8784314, 1, 0, 1,
-0.8368334, 1.692774, 0.2347293, 0.8705882, 1, 0, 1,
-0.8359474, 1.034607, -1.140431, 0.8666667, 1, 0, 1,
-0.830484, -1.202659, -2.940225, 0.8588235, 1, 0, 1,
-0.828292, -1.134141, -1.836735, 0.854902, 1, 0, 1,
-0.8264086, -0.9815879, -0.8883371, 0.8470588, 1, 0, 1,
-0.8245969, -0.3273397, -2.237577, 0.8431373, 1, 0, 1,
-0.8202326, 1.475083, -0.8918151, 0.8352941, 1, 0, 1,
-0.8168154, -0.003161734, -2.184816, 0.8313726, 1, 0, 1,
-0.8161269, -0.5168197, 0.08633876, 0.8235294, 1, 0, 1,
-0.8147278, 0.1115603, -1.915975, 0.8196079, 1, 0, 1,
-0.8135915, -0.2824964, -1.699544, 0.8117647, 1, 0, 1,
-0.8095442, 0.6001946, -2.113001, 0.8078431, 1, 0, 1,
-0.8093899, -1.267754, -1.97779, 0.8, 1, 0, 1,
-0.80827, 0.1510607, -0.8591695, 0.7921569, 1, 0, 1,
-0.8000407, -0.7427322, -2.132338, 0.7882353, 1, 0, 1,
-0.7964661, -1.194958, -3.863269, 0.7803922, 1, 0, 1,
-0.79074, -1.553826, -1.782326, 0.7764706, 1, 0, 1,
-0.7892197, -1.077555, -4.395014, 0.7686275, 1, 0, 1,
-0.7887518, -1.43941, -2.316484, 0.7647059, 1, 0, 1,
-0.7871141, 0.6238642, 0.7361487, 0.7568628, 1, 0, 1,
-0.7859049, 0.2924891, -1.849899, 0.7529412, 1, 0, 1,
-0.7851489, 0.4631588, -1.60495, 0.7450981, 1, 0, 1,
-0.784582, -0.8901334, -0.7621048, 0.7411765, 1, 0, 1,
-0.7831246, 1.051315, -2.324571, 0.7333333, 1, 0, 1,
-0.7756371, -0.2986335, -1.064629, 0.7294118, 1, 0, 1,
-0.7745975, -0.3451072, -1.880357, 0.7215686, 1, 0, 1,
-0.7718293, -0.8008046, -2.21259, 0.7176471, 1, 0, 1,
-0.7692556, -0.09312344, -1.392056, 0.7098039, 1, 0, 1,
-0.7677138, 0.6480063, -1.704253, 0.7058824, 1, 0, 1,
-0.7636728, 0.2176602, -2.144557, 0.6980392, 1, 0, 1,
-0.7625389, -1.381903, -3.972778, 0.6901961, 1, 0, 1,
-0.7605758, -1.735945, -2.746543, 0.6862745, 1, 0, 1,
-0.7564803, 0.4305192, -1.247167, 0.6784314, 1, 0, 1,
-0.7532516, -0.5003393, -1.353035, 0.6745098, 1, 0, 1,
-0.7465988, -0.07964901, -2.69668, 0.6666667, 1, 0, 1,
-0.7450646, 0.8323177, 0.1511045, 0.6627451, 1, 0, 1,
-0.7326608, -0.8050748, 0.3002789, 0.654902, 1, 0, 1,
-0.7271003, -0.5614163, -0.8686439, 0.6509804, 1, 0, 1,
-0.7213101, -0.1769504, -0.787975, 0.6431373, 1, 0, 1,
-0.7182819, -1.179515, -3.855426, 0.6392157, 1, 0, 1,
-0.7081683, 0.03359398, -1.344551, 0.6313726, 1, 0, 1,
-0.7076302, -0.1274077, -0.6090765, 0.627451, 1, 0, 1,
-0.7060652, -0.8373901, -2.885323, 0.6196079, 1, 0, 1,
-0.7046668, 0.4085925, -1.129092, 0.6156863, 1, 0, 1,
-0.7007697, 0.4945226, -1.345932, 0.6078432, 1, 0, 1,
-0.6957539, -0.7469703, -2.052123, 0.6039216, 1, 0, 1,
-0.6923046, -2.049313, -2.221121, 0.5960785, 1, 0, 1,
-0.6904473, 0.4855003, -0.5725418, 0.5882353, 1, 0, 1,
-0.6867546, -0.8804009, -3.733647, 0.5843138, 1, 0, 1,
-0.6862257, 0.8370732, -1.375902, 0.5764706, 1, 0, 1,
-0.6850159, -1.091577, -3.753733, 0.572549, 1, 0, 1,
-0.6831141, -0.6894118, -1.825737, 0.5647059, 1, 0, 1,
-0.6810924, 0.7494482, 1.06567, 0.5607843, 1, 0, 1,
-0.6795219, -0.6015564, -3.580327, 0.5529412, 1, 0, 1,
-0.6748279, 0.8987834, -0.7045215, 0.5490196, 1, 0, 1,
-0.6678699, 1.295965, -0.4977956, 0.5411765, 1, 0, 1,
-0.6678561, -0.8563856, -1.456528, 0.5372549, 1, 0, 1,
-0.6660571, -0.9713281, -2.298971, 0.5294118, 1, 0, 1,
-0.654458, 0.2394426, -1.387305, 0.5254902, 1, 0, 1,
-0.6526365, -0.3663164, -1.096266, 0.5176471, 1, 0, 1,
-0.6462066, 0.04291165, -2.068535, 0.5137255, 1, 0, 1,
-0.6444005, 2.693327, -0.4388597, 0.5058824, 1, 0, 1,
-0.6408724, 0.8748602, 0.6075993, 0.5019608, 1, 0, 1,
-0.6388872, 0.5565521, 0.5875335, 0.4941176, 1, 0, 1,
-0.6367723, 0.4752539, 0.1072681, 0.4862745, 1, 0, 1,
-0.6306859, -0.1156878, -0.3448264, 0.4823529, 1, 0, 1,
-0.6296926, 1.180342, 0.2407368, 0.4745098, 1, 0, 1,
-0.6272942, -0.1128925, -0.2085257, 0.4705882, 1, 0, 1,
-0.6234311, -0.8411284, -0.8639753, 0.4627451, 1, 0, 1,
-0.6114912, 0.1180032, -1.768723, 0.4588235, 1, 0, 1,
-0.6042162, -0.7279257, -1.990373, 0.4509804, 1, 0, 1,
-0.6025004, -0.6331255, -2.157026, 0.4470588, 1, 0, 1,
-0.5992803, -0.081217, -2.272359, 0.4392157, 1, 0, 1,
-0.5954975, -0.4446273, -2.914735, 0.4352941, 1, 0, 1,
-0.5926069, 1.119321, -1.288674, 0.427451, 1, 0, 1,
-0.5894995, -1.182109, -3.706861, 0.4235294, 1, 0, 1,
-0.5868942, -2.100707, -2.052169, 0.4156863, 1, 0, 1,
-0.5854906, 0.4894445, -1.417719, 0.4117647, 1, 0, 1,
-0.5853727, -0.5672094, -2.041582, 0.4039216, 1, 0, 1,
-0.5832932, 2.364105, -0.426578, 0.3960784, 1, 0, 1,
-0.580379, 0.3887876, 1.1336, 0.3921569, 1, 0, 1,
-0.5782042, 0.6379883, 0.07686565, 0.3843137, 1, 0, 1,
-0.576661, 0.09763096, -0.6555066, 0.3803922, 1, 0, 1,
-0.5766505, -0.9733894, -2.311779, 0.372549, 1, 0, 1,
-0.5737235, -0.6823825, -3.447763, 0.3686275, 1, 0, 1,
-0.5733326, 0.2584245, -2.407591, 0.3607843, 1, 0, 1,
-0.5689467, 0.06392773, -1.428771, 0.3568628, 1, 0, 1,
-0.565549, -0.1187246, -1.761648, 0.3490196, 1, 0, 1,
-0.5581762, -0.01208131, -2.187384, 0.345098, 1, 0, 1,
-0.5566465, -0.3148771, -2.122463, 0.3372549, 1, 0, 1,
-0.5554135, -1.643252, -2.544931, 0.3333333, 1, 0, 1,
-0.5552933, 0.8779472, -0.2603254, 0.3254902, 1, 0, 1,
-0.5537146, 0.1196706, -1.460212, 0.3215686, 1, 0, 1,
-0.549987, 1.701446, -0.1014559, 0.3137255, 1, 0, 1,
-0.5491533, 0.5095115, -1.356743, 0.3098039, 1, 0, 1,
-0.5444955, -1.0851, -2.983654, 0.3019608, 1, 0, 1,
-0.5410993, -1.334171, -4.379578, 0.2941177, 1, 0, 1,
-0.5409598, 0.8478367, 1.027056, 0.2901961, 1, 0, 1,
-0.5373137, -0.6644847, -3.950304, 0.282353, 1, 0, 1,
-0.5362093, -0.1396967, -1.016198, 0.2784314, 1, 0, 1,
-0.5310143, -1.380535, -2.237469, 0.2705882, 1, 0, 1,
-0.5242059, -0.4190364, -2.159177, 0.2666667, 1, 0, 1,
-0.5236277, 0.4817649, -1.432257, 0.2588235, 1, 0, 1,
-0.5233153, -0.4564304, -4.325958, 0.254902, 1, 0, 1,
-0.5217086, -2.508382, -2.046892, 0.2470588, 1, 0, 1,
-0.5164344, 0.7490766, -1.05869, 0.2431373, 1, 0, 1,
-0.5160026, -0.9423268, -2.850551, 0.2352941, 1, 0, 1,
-0.5071511, 2.015325, 0.1923093, 0.2313726, 1, 0, 1,
-0.5028383, 0.5933974, -1.426769, 0.2235294, 1, 0, 1,
-0.502552, -0.2324683, -0.9600672, 0.2196078, 1, 0, 1,
-0.4986635, -1.327617, -4.198298, 0.2117647, 1, 0, 1,
-0.4968877, 0.240932, -0.03668447, 0.2078431, 1, 0, 1,
-0.4966495, -0.5769659, -2.118539, 0.2, 1, 0, 1,
-0.495547, -0.3493069, -0.8570516, 0.1921569, 1, 0, 1,
-0.4952742, 0.05531481, -2.48581, 0.1882353, 1, 0, 1,
-0.4931987, -1.314359, -2.957329, 0.1803922, 1, 0, 1,
-0.4905373, 0.5136508, -1.59379, 0.1764706, 1, 0, 1,
-0.487825, -0.519909, -1.719319, 0.1686275, 1, 0, 1,
-0.4875001, 0.2890458, -2.083349, 0.1647059, 1, 0, 1,
-0.4872302, -0.2759247, -2.73415, 0.1568628, 1, 0, 1,
-0.4860204, -0.08415501, -2.876978, 0.1529412, 1, 0, 1,
-0.484744, 1.867593, 0.1785848, 0.145098, 1, 0, 1,
-0.4754498, 0.936952, -0.8161457, 0.1411765, 1, 0, 1,
-0.4752815, -0.3614564, -3.553347, 0.1333333, 1, 0, 1,
-0.4740239, 0.9286062, 0.01718039, 0.1294118, 1, 0, 1,
-0.4737565, 0.2704332, -2.204851, 0.1215686, 1, 0, 1,
-0.4716563, -0.0715118, -1.030921, 0.1176471, 1, 0, 1,
-0.4614196, -0.1093369, -1.086915, 0.1098039, 1, 0, 1,
-0.4610106, 0.1514738, -1.054502, 0.1058824, 1, 0, 1,
-0.4558782, 2.593597, -1.839668, 0.09803922, 1, 0, 1,
-0.4522203, 0.3438085, -2.107398, 0.09019608, 1, 0, 1,
-0.4442108, -1.285735, -2.618126, 0.08627451, 1, 0, 1,
-0.4432475, -0.7599756, -1.738043, 0.07843138, 1, 0, 1,
-0.442543, 1.697277, -1.437039, 0.07450981, 1, 0, 1,
-0.4402975, 0.7066329, 0.4269423, 0.06666667, 1, 0, 1,
-0.4389512, -0.02864452, -0.5058829, 0.0627451, 1, 0, 1,
-0.4311402, 1.175986, -1.563358, 0.05490196, 1, 0, 1,
-0.4299778, 2.116943, -1.632564, 0.05098039, 1, 0, 1,
-0.4294452, 1.409477, 0.8230098, 0.04313726, 1, 0, 1,
-0.4277968, -1.123369, -3.358172, 0.03921569, 1, 0, 1,
-0.4247484, -0.2738887, -2.27703, 0.03137255, 1, 0, 1,
-0.4234093, -0.1310913, -3.172857, 0.02745098, 1, 0, 1,
-0.4233414, -0.895045, -3.14649, 0.01960784, 1, 0, 1,
-0.4210442, -0.5797718, -3.026793, 0.01568628, 1, 0, 1,
-0.418756, 0.6628056, -0.6951768, 0.007843138, 1, 0, 1,
-0.4187382, -1.130781, -2.682626, 0.003921569, 1, 0, 1,
-0.414134, 0.6990343, -0.5887358, 0, 1, 0.003921569, 1,
-0.4125287, -0.6071993, -1.835265, 0, 1, 0.01176471, 1,
-0.4089963, 0.3350461, 0.9451942, 0, 1, 0.01568628, 1,
-0.4075437, -1.59087, -2.491219, 0, 1, 0.02352941, 1,
-0.4066573, -0.2045616, -3.387831, 0, 1, 0.02745098, 1,
-0.4062243, 0.5687159, -1.367364, 0, 1, 0.03529412, 1,
-0.4049041, -1.036965, -2.120088, 0, 1, 0.03921569, 1,
-0.4010113, -1.023073, -2.77442, 0, 1, 0.04705882, 1,
-0.3996314, -1.132822, -3.572851, 0, 1, 0.05098039, 1,
-0.3980457, 0.02206322, -0.6009982, 0, 1, 0.05882353, 1,
-0.3970111, 1.128744, -1.519051, 0, 1, 0.0627451, 1,
-0.3961116, -0.4432873, -1.695279, 0, 1, 0.07058824, 1,
-0.3939412, 0.3647487, -1.262892, 0, 1, 0.07450981, 1,
-0.3923841, 0.5989448, -1.252244, 0, 1, 0.08235294, 1,
-0.3910665, -1.282995, -1.877864, 0, 1, 0.08627451, 1,
-0.3862285, 0.08820815, 0.1736502, 0, 1, 0.09411765, 1,
-0.3856433, -0.8157931, -2.669829, 0, 1, 0.1019608, 1,
-0.3761173, 0.6802298, -0.5432856, 0, 1, 0.1058824, 1,
-0.3737806, -1.149079, -2.067476, 0, 1, 0.1137255, 1,
-0.3724079, 0.5908171, -1.046765, 0, 1, 0.1176471, 1,
-0.3715384, -0.2940601, -0.5843422, 0, 1, 0.1254902, 1,
-0.3677729, -1.434611, -2.695117, 0, 1, 0.1294118, 1,
-0.3672834, 1.214942, -1.04898, 0, 1, 0.1372549, 1,
-0.36533, 0.7241457, -0.3452525, 0, 1, 0.1411765, 1,
-0.3650142, 0.9795178, -2.183022, 0, 1, 0.1490196, 1,
-0.3611227, -1.304978, -3.881804, 0, 1, 0.1529412, 1,
-0.360616, -0.5271628, -2.966735, 0, 1, 0.1607843, 1,
-0.3600925, 1.406882, -0.01900644, 0, 1, 0.1647059, 1,
-0.3569387, -1.181044, -1.759034, 0, 1, 0.172549, 1,
-0.3559193, -1.162996, -2.711593, 0, 1, 0.1764706, 1,
-0.3537408, -1.669186, -2.183629, 0, 1, 0.1843137, 1,
-0.3510219, 0.3381422, -0.9578034, 0, 1, 0.1882353, 1,
-0.3477214, -1.04857, -4.489326, 0, 1, 0.1960784, 1,
-0.3469861, 0.8054177, -0.2742125, 0, 1, 0.2039216, 1,
-0.3405595, 0.8011608, 0.1544515, 0, 1, 0.2078431, 1,
-0.3365704, 1.175162, -1.623724, 0, 1, 0.2156863, 1,
-0.3358658, -1.134899, -2.433523, 0, 1, 0.2196078, 1,
-0.3358391, 0.4301942, 0.2762437, 0, 1, 0.227451, 1,
-0.3335245, 0.1098488, -1.040128, 0, 1, 0.2313726, 1,
-0.3321992, 1.750202, -0.3215782, 0, 1, 0.2392157, 1,
-0.3296459, -0.30321, -2.68054, 0, 1, 0.2431373, 1,
-0.3200291, 0.5726824, 0.3135055, 0, 1, 0.2509804, 1,
-0.3169735, -0.967866, -1.020365, 0, 1, 0.254902, 1,
-0.3151045, -0.6611096, -0.8706886, 0, 1, 0.2627451, 1,
-0.314624, -1.137226, -1.787534, 0, 1, 0.2666667, 1,
-0.3124765, 0.9677402, -1.330995, 0, 1, 0.2745098, 1,
-0.3118139, 0.4780374, -0.0448375, 0, 1, 0.2784314, 1,
-0.3100905, -0.5476024, -2.083511, 0, 1, 0.2862745, 1,
-0.3092877, 2.302966, 0.143468, 0, 1, 0.2901961, 1,
-0.3090104, 0.2846472, 1.944503, 0, 1, 0.2980392, 1,
-0.3068859, 1.234202, -0.3504929, 0, 1, 0.3058824, 1,
-0.3046455, 1.152113, -1.255227, 0, 1, 0.3098039, 1,
-0.3039775, 0.139264, -1.912247, 0, 1, 0.3176471, 1,
-0.3034661, -0.539755, -4.090423, 0, 1, 0.3215686, 1,
-0.3031294, 0.8548495, -0.3782999, 0, 1, 0.3294118, 1,
-0.3031118, -0.7290079, -1.717537, 0, 1, 0.3333333, 1,
-0.2964746, 0.7842788, -1.108517, 0, 1, 0.3411765, 1,
-0.2935734, 1.352451, -0.9984428, 0, 1, 0.345098, 1,
-0.2924233, -0.4716123, -2.253967, 0, 1, 0.3529412, 1,
-0.2902541, -0.7420951, -4.090274, 0, 1, 0.3568628, 1,
-0.2894315, -0.2749222, -2.488523, 0, 1, 0.3647059, 1,
-0.2893461, -0.9577318, -1.504208, 0, 1, 0.3686275, 1,
-0.2888456, 0.4717603, 0.6233534, 0, 1, 0.3764706, 1,
-0.2849731, -0.1925624, -1.971383, 0, 1, 0.3803922, 1,
-0.2817334, -0.197068, -2.867902, 0, 1, 0.3882353, 1,
-0.2797707, -0.01359811, -1.442734, 0, 1, 0.3921569, 1,
-0.2797577, -0.5674706, -3.091168, 0, 1, 0.4, 1,
-0.279696, -0.5638982, -2.67724, 0, 1, 0.4078431, 1,
-0.278203, -0.4577601, -1.715082, 0, 1, 0.4117647, 1,
-0.2781142, 0.1704456, -0.7043191, 0, 1, 0.4196078, 1,
-0.2665867, 0.3280071, 0.7908002, 0, 1, 0.4235294, 1,
-0.2664948, -1.708995, -3.590017, 0, 1, 0.4313726, 1,
-0.2662772, 0.919503, -0.911907, 0, 1, 0.4352941, 1,
-0.2612932, -2.464068, -2.068004, 0, 1, 0.4431373, 1,
-0.2513125, -0.898386, -3.978885, 0, 1, 0.4470588, 1,
-0.2509182, -0.5780913, -1.489643, 0, 1, 0.454902, 1,
-0.2505586, -0.6698389, -1.058102, 0, 1, 0.4588235, 1,
-0.2485859, 0.9197088, 1.083708, 0, 1, 0.4666667, 1,
-0.2461684, -1.296793, -2.598701, 0, 1, 0.4705882, 1,
-0.2461102, 0.2664934, -1.501819, 0, 1, 0.4784314, 1,
-0.2447152, -1.003322, -2.041265, 0, 1, 0.4823529, 1,
-0.242197, -0.2961381, -2.577759, 0, 1, 0.4901961, 1,
-0.2412379, 0.6501319, 0.5801046, 0, 1, 0.4941176, 1,
-0.2345335, -0.6604771, -1.70211, 0, 1, 0.5019608, 1,
-0.2325689, 0.3726936, -0.3972287, 0, 1, 0.509804, 1,
-0.2299255, -0.1367657, -2.596015, 0, 1, 0.5137255, 1,
-0.2275586, -1.18218, -2.594286, 0, 1, 0.5215687, 1,
-0.2274151, 1.478057, 0.4965895, 0, 1, 0.5254902, 1,
-0.2270373, 1.130484, -0.4097344, 0, 1, 0.5333334, 1,
-0.2260581, -0.4282117, -1.748944, 0, 1, 0.5372549, 1,
-0.225356, 0.6434816, -0.4795977, 0, 1, 0.5450981, 1,
-0.2217676, -0.6216469, -1.784993, 0, 1, 0.5490196, 1,
-0.2159826, -0.5207474, -3.002682, 0, 1, 0.5568628, 1,
-0.2159391, 1.846599, -0.7061393, 0, 1, 0.5607843, 1,
-0.2128718, 1.224284, 0.3949636, 0, 1, 0.5686275, 1,
-0.2121246, 1.671389, -0.1366013, 0, 1, 0.572549, 1,
-0.2110517, 0.2635164, -1.428705, 0, 1, 0.5803922, 1,
-0.2077073, -0.6383705, -1.894248, 0, 1, 0.5843138, 1,
-0.2055847, -0.2116645, -1.307885, 0, 1, 0.5921569, 1,
-0.2029867, -1.319259, -2.759532, 0, 1, 0.5960785, 1,
-0.2005157, -0.576228, -2.593759, 0, 1, 0.6039216, 1,
-0.1926091, -0.4389856, -4.392172, 0, 1, 0.6117647, 1,
-0.1906563, 0.849378, 0.2915604, 0, 1, 0.6156863, 1,
-0.1888971, 0.4193174, -1.958282, 0, 1, 0.6235294, 1,
-0.1879033, -0.6994368, -4.182126, 0, 1, 0.627451, 1,
-0.1854005, -0.3077416, -2.055729, 0, 1, 0.6352941, 1,
-0.1844193, -1.955628, -3.147442, 0, 1, 0.6392157, 1,
-0.1828258, -0.3748515, -3.112381, 0, 1, 0.6470588, 1,
-0.1821355, -0.4469957, -4.464958, 0, 1, 0.6509804, 1,
-0.1788148, -0.10895, -0.7715268, 0, 1, 0.6588235, 1,
-0.1718929, -1.305578, -3.084043, 0, 1, 0.6627451, 1,
-0.1686416, 0.8184663, 1.046941, 0, 1, 0.6705883, 1,
-0.168454, -0.2367187, -1.907802, 0, 1, 0.6745098, 1,
-0.1670009, 0.1156382, -1.795022, 0, 1, 0.682353, 1,
-0.16537, 0.6831419, -0.2198907, 0, 1, 0.6862745, 1,
-0.1644483, 1.412503, 1.000654, 0, 1, 0.6941177, 1,
-0.1623959, -0.7735847, -5.158154, 0, 1, 0.7019608, 1,
-0.1610603, -1.181441, -3.767472, 0, 1, 0.7058824, 1,
-0.1589769, 1.864508, -0.7986463, 0, 1, 0.7137255, 1,
-0.1580511, -0.5245081, -2.906009, 0, 1, 0.7176471, 1,
-0.1561136, -0.7712337, -3.291794, 0, 1, 0.7254902, 1,
-0.1553504, -0.4810404, -1.794673, 0, 1, 0.7294118, 1,
-0.1534382, 3.303815, -0.7470364, 0, 1, 0.7372549, 1,
-0.1515373, 0.4103299, -0.08460006, 0, 1, 0.7411765, 1,
-0.1480345, -0.2043726, -0.860059, 0, 1, 0.7490196, 1,
-0.147155, 0.9263424, -0.1616711, 0, 1, 0.7529412, 1,
-0.1470694, -1.26488, -2.081896, 0, 1, 0.7607843, 1,
-0.1464505, -0.6552575, -3.940853, 0, 1, 0.7647059, 1,
-0.1430531, -0.7915578, -1.600245, 0, 1, 0.772549, 1,
-0.1372189, 0.9730201, -0.8644851, 0, 1, 0.7764706, 1,
-0.1346199, 0.4885838, -0.0857828, 0, 1, 0.7843137, 1,
-0.1333867, -0.7159172, -3.14822, 0, 1, 0.7882353, 1,
-0.1328966, 0.05241467, -0.9753811, 0, 1, 0.7960784, 1,
-0.1323153, 2.246442, -0.6674804, 0, 1, 0.8039216, 1,
-0.1312216, -0.6845838, -4.188313, 0, 1, 0.8078431, 1,
-0.1271241, 0.9347202, -0.6183725, 0, 1, 0.8156863, 1,
-0.126026, 0.2873387, 0.440956, 0, 1, 0.8196079, 1,
-0.1239566, 0.7484114, -0.149221, 0, 1, 0.827451, 1,
-0.1228194, -1.243415, -3.062012, 0, 1, 0.8313726, 1,
-0.1217978, -0.3045844, -3.426967, 0, 1, 0.8392157, 1,
-0.1201248, -0.5894105, -2.591315, 0, 1, 0.8431373, 1,
-0.1186777, -1.695479, -3.59864, 0, 1, 0.8509804, 1,
-0.1129804, 1.13306, 0.07965925, 0, 1, 0.854902, 1,
-0.1103558, 1.454295, -1.536791, 0, 1, 0.8627451, 1,
-0.1093882, 0.4836995, 0.2938311, 0, 1, 0.8666667, 1,
-0.1058217, 1.187914, 2.001548, 0, 1, 0.8745098, 1,
-0.1051033, -0.8397571, -3.0368, 0, 1, 0.8784314, 1,
-0.1037051, 0.6672921, 0.743187, 0, 1, 0.8862745, 1,
-0.100993, -0.5579369, -1.489493, 0, 1, 0.8901961, 1,
-0.09917004, 1.106157, -1.231505, 0, 1, 0.8980392, 1,
-0.09429505, -0.9294806, -1.341405, 0, 1, 0.9058824, 1,
-0.09327711, -1.03645, -2.343903, 0, 1, 0.9098039, 1,
-0.08746916, -1.674523, -0.2673525, 0, 1, 0.9176471, 1,
-0.08346812, -0.9819354, -2.848415, 0, 1, 0.9215686, 1,
-0.08244673, 0.3875011, -1.769139, 0, 1, 0.9294118, 1,
-0.08154257, -0.2168438, -3.291507, 0, 1, 0.9333333, 1,
-0.07829582, 2.07764, 0.6555876, 0, 1, 0.9411765, 1,
-0.07647371, 0.8021521, -0.2231129, 0, 1, 0.945098, 1,
-0.07491116, -0.09708455, -3.292886, 0, 1, 0.9529412, 1,
-0.06736463, -0.527213, -1.606591, 0, 1, 0.9568627, 1,
-0.06398336, 0.3246855, 0.890155, 0, 1, 0.9647059, 1,
-0.06197253, 1.165905, -0.01181641, 0, 1, 0.9686275, 1,
-0.05815526, -0.5253555, -4.068511, 0, 1, 0.9764706, 1,
-0.05454936, -2.43649, -5.120236, 0, 1, 0.9803922, 1,
-0.05111453, -1.66107, -2.876818, 0, 1, 0.9882353, 1,
-0.04979326, 1.425949, 0.8940635, 0, 1, 0.9921569, 1,
-0.04870855, -1.006285, -4.371568, 0, 1, 1, 1,
-0.04864121, -0.7543375, -1.555253, 0, 0.9921569, 1, 1,
-0.04697189, 1.467287, 2.119732, 0, 0.9882353, 1, 1,
-0.039921, 0.2039255, 0.1582755, 0, 0.9803922, 1, 1,
-0.03858146, 1.192865, 0.8991131, 0, 0.9764706, 1, 1,
-0.03297259, 0.2164221, 0.2599113, 0, 0.9686275, 1, 1,
-0.03146277, -1.189085, -3.378059, 0, 0.9647059, 1, 1,
-0.02991556, 0.1442951, 0.7687498, 0, 0.9568627, 1, 1,
-0.02982021, -0.611382, -3.658276, 0, 0.9529412, 1, 1,
-0.02633652, 1.113558, -0.9848985, 0, 0.945098, 1, 1,
-0.02439278, 0.6961972, -0.2639672, 0, 0.9411765, 1, 1,
-0.02151099, 0.60349, -1.14379, 0, 0.9333333, 1, 1,
-0.01424944, 0.8842092, -0.8707464, 0, 0.9294118, 1, 1,
-0.0132825, 0.7531384, -1.316824, 0, 0.9215686, 1, 1,
-0.009189432, 1.424361, -0.4077796, 0, 0.9176471, 1, 1,
-0.004609131, -1.006918, -4.159927, 0, 0.9098039, 1, 1,
-0.002007596, 0.9534205, -0.5339942, 0, 0.9058824, 1, 1,
0.003076194, -0.6565071, 3.943266, 0, 0.8980392, 1, 1,
0.005838024, 1.723019, -0.3925017, 0, 0.8901961, 1, 1,
0.007797708, 0.3170892, -0.1243465, 0, 0.8862745, 1, 1,
0.01284382, -0.4421425, 3.962236, 0, 0.8784314, 1, 1,
0.01504894, 0.3844061, 0.6233225, 0, 0.8745098, 1, 1,
0.0158891, 1.010363, 1.22324, 0, 0.8666667, 1, 1,
0.01756627, -1.131108, 4.970952, 0, 0.8627451, 1, 1,
0.02074054, -0.3622351, 3.77656, 0, 0.854902, 1, 1,
0.02222168, 0.5136873, 1.038713, 0, 0.8509804, 1, 1,
0.02418733, 1.309681, -0.9838355, 0, 0.8431373, 1, 1,
0.02569339, -0.2100149, 4.544969, 0, 0.8392157, 1, 1,
0.02911894, 0.6402769, 0.5918462, 0, 0.8313726, 1, 1,
0.03519671, -0.07237396, 3.299247, 0, 0.827451, 1, 1,
0.03611525, 1.20406, 0.06602904, 0, 0.8196079, 1, 1,
0.04121755, -0.8020229, 3.22111, 0, 0.8156863, 1, 1,
0.04467686, 0.2543342, 1.180875, 0, 0.8078431, 1, 1,
0.04988564, 0.9030703, -0.428299, 0, 0.8039216, 1, 1,
0.05466206, 0.3433414, 0.6877432, 0, 0.7960784, 1, 1,
0.06214962, -0.6679904, 3.661417, 0, 0.7882353, 1, 1,
0.06220025, -0.01376303, 2.35259, 0, 0.7843137, 1, 1,
0.06466936, 1.731407, 0.1785034, 0, 0.7764706, 1, 1,
0.06519181, 2.36591, 1.6218, 0, 0.772549, 1, 1,
0.06821699, -1.471722, 2.14426, 0, 0.7647059, 1, 1,
0.07513668, -0.8816315, 1.714355, 0, 0.7607843, 1, 1,
0.07537078, 1.654017, -0.269629, 0, 0.7529412, 1, 1,
0.08195052, 1.429243, 0.08154482, 0, 0.7490196, 1, 1,
0.0823114, -1.972299, 1.341863, 0, 0.7411765, 1, 1,
0.08572157, -0.002960495, -0.1385264, 0, 0.7372549, 1, 1,
0.09075882, 0.8653331, -0.5117963, 0, 0.7294118, 1, 1,
0.09171519, -1.626232, 4.182365, 0, 0.7254902, 1, 1,
0.09424548, 0.06646827, 2.398428, 0, 0.7176471, 1, 1,
0.09496877, 1.302287, -0.9940872, 0, 0.7137255, 1, 1,
0.09546483, -2.237635, 5.535472, 0, 0.7058824, 1, 1,
0.09620163, 0.2585205, 2.97989, 0, 0.6980392, 1, 1,
0.09866553, 0.6143452, 1.069476, 0, 0.6941177, 1, 1,
0.1039313, 1.746255, 0.05407185, 0, 0.6862745, 1, 1,
0.1053285, -0.171047, 2.791427, 0, 0.682353, 1, 1,
0.1098992, -0.2795831, 2.217696, 0, 0.6745098, 1, 1,
0.1100951, -1.689694, 0.5606509, 0, 0.6705883, 1, 1,
0.1159279, -0.6052197, 3.922869, 0, 0.6627451, 1, 1,
0.1160695, -0.2843508, 1.722176, 0, 0.6588235, 1, 1,
0.1245541, -1.371566, 0.7789793, 0, 0.6509804, 1, 1,
0.1288714, -0.008643016, 2.131828, 0, 0.6470588, 1, 1,
0.1300135, 0.6499175, -0.1250623, 0, 0.6392157, 1, 1,
0.1304819, -1.252525, 3.578177, 0, 0.6352941, 1, 1,
0.1309966, 1.071695, 1.570488, 0, 0.627451, 1, 1,
0.1313211, 0.8951437, 0.7170984, 0, 0.6235294, 1, 1,
0.1369408, -0.4328154, 4.450255, 0, 0.6156863, 1, 1,
0.1370771, 1.590759, -0.5339167, 0, 0.6117647, 1, 1,
0.1376029, 0.05727034, 2.426854, 0, 0.6039216, 1, 1,
0.1377228, -0.7878062, 1.878399, 0, 0.5960785, 1, 1,
0.1385005, 0.1335415, 1.970042, 0, 0.5921569, 1, 1,
0.1396974, 0.6399496, -0.6991904, 0, 0.5843138, 1, 1,
0.1407034, -0.5067198, 3.600643, 0, 0.5803922, 1, 1,
0.1437069, 0.3461526, -0.06095146, 0, 0.572549, 1, 1,
0.1466577, 0.6421134, -0.05445914, 0, 0.5686275, 1, 1,
0.1492617, -1.757397, 1.437226, 0, 0.5607843, 1, 1,
0.1511912, -0.6795292, 3.260382, 0, 0.5568628, 1, 1,
0.1516487, -0.05358844, 2.578874, 0, 0.5490196, 1, 1,
0.1562732, -1.769571, 3.203845, 0, 0.5450981, 1, 1,
0.158487, 0.2855814, 1.180809, 0, 0.5372549, 1, 1,
0.1604352, 1.487946, -0.216294, 0, 0.5333334, 1, 1,
0.1630989, 1.366312, -0.9004073, 0, 0.5254902, 1, 1,
0.1657772, 1.131976, 0.01168422, 0, 0.5215687, 1, 1,
0.1719407, -1.120255, 3.130651, 0, 0.5137255, 1, 1,
0.1757476, -0.8465353, 4.268423, 0, 0.509804, 1, 1,
0.1762476, -0.4980887, 4.654629, 0, 0.5019608, 1, 1,
0.1809993, -1.009328, 1.883069, 0, 0.4941176, 1, 1,
0.1825535, -2.223486, 4.537925, 0, 0.4901961, 1, 1,
0.186145, 1.385626, 1.013608, 0, 0.4823529, 1, 1,
0.1887673, -1.628616, 3.287961, 0, 0.4784314, 1, 1,
0.1908805, -1.740575, 5.085928, 0, 0.4705882, 1, 1,
0.1943792, 0.2503401, 0.01083915, 0, 0.4666667, 1, 1,
0.1955936, -1.295406, 3.019655, 0, 0.4588235, 1, 1,
0.1956628, -0.8586072, 1.979362, 0, 0.454902, 1, 1,
0.1988871, -0.274965, 0.7429152, 0, 0.4470588, 1, 1,
0.1996303, 1.039183, -0.8002557, 0, 0.4431373, 1, 1,
0.205187, -1.412646, 2.555466, 0, 0.4352941, 1, 1,
0.2058964, -0.9405464, 1.000706, 0, 0.4313726, 1, 1,
0.2110159, -0.06696958, 1.00676, 0, 0.4235294, 1, 1,
0.2135251, -1.382972, 3.985924, 0, 0.4196078, 1, 1,
0.2135392, 0.6527212, -0.4812116, 0, 0.4117647, 1, 1,
0.2232445, 0.1540816, 0.2786956, 0, 0.4078431, 1, 1,
0.2318602, -1.026659, 3.455779, 0, 0.4, 1, 1,
0.2326329, 2.029908, -0.3409589, 0, 0.3921569, 1, 1,
0.2403723, 0.6813558, 0.6826474, 0, 0.3882353, 1, 1,
0.2498542, 0.2450342, 1.502126, 0, 0.3803922, 1, 1,
0.251412, 0.3713342, 0.3843572, 0, 0.3764706, 1, 1,
0.2583863, -0.3418726, 2.433154, 0, 0.3686275, 1, 1,
0.2589323, -1.416792, 5.5415, 0, 0.3647059, 1, 1,
0.2619397, -0.154354, 1.974196, 0, 0.3568628, 1, 1,
0.2701009, 1.340615, 0.4319741, 0, 0.3529412, 1, 1,
0.2705483, -2.499524, 2.469588, 0, 0.345098, 1, 1,
0.2745735, 0.7794222, -0.2393528, 0, 0.3411765, 1, 1,
0.2759817, 0.6934901, 0.9074636, 0, 0.3333333, 1, 1,
0.2761016, -0.2804162, 1.444895, 0, 0.3294118, 1, 1,
0.2762301, 0.2479146, 0.6392831, 0, 0.3215686, 1, 1,
0.2783689, -0.112354, 2.323832, 0, 0.3176471, 1, 1,
0.2829689, 0.409558, -0.03784491, 0, 0.3098039, 1, 1,
0.2832216, -0.1184989, 1.127942, 0, 0.3058824, 1, 1,
0.2877772, -0.2791264, 2.299952, 0, 0.2980392, 1, 1,
0.2902982, -1.454845, 4.195549, 0, 0.2901961, 1, 1,
0.2931239, -0.1177346, 1.118607, 0, 0.2862745, 1, 1,
0.2931604, -1.560437, 0.08916605, 0, 0.2784314, 1, 1,
0.2962851, 1.317511, 0.5335032, 0, 0.2745098, 1, 1,
0.3015814, 0.811807, 0.3087172, 0, 0.2666667, 1, 1,
0.308152, 0.4716424, 1.794927, 0, 0.2627451, 1, 1,
0.3083945, -0.9360297, 2.776865, 0, 0.254902, 1, 1,
0.3093767, -0.6828936, 3.231605, 0, 0.2509804, 1, 1,
0.3118329, -0.7265756, 4.810828, 0, 0.2431373, 1, 1,
0.3134034, 0.1377084, 0.926214, 0, 0.2392157, 1, 1,
0.3136629, 0.3655179, -0.07031025, 0, 0.2313726, 1, 1,
0.3147493, -1.513294, 1.304137, 0, 0.227451, 1, 1,
0.3153617, 0.4412081, 1.547653, 0, 0.2196078, 1, 1,
0.316236, -0.6246219, 1.814734, 0, 0.2156863, 1, 1,
0.3194612, 0.3664281, 0.1244556, 0, 0.2078431, 1, 1,
0.3244685, 1.70716, -0.2626954, 0, 0.2039216, 1, 1,
0.328777, -1.096275, 2.020149, 0, 0.1960784, 1, 1,
0.3311201, 0.1418705, 1.125986, 0, 0.1882353, 1, 1,
0.3357537, -0.539836, 3.326708, 0, 0.1843137, 1, 1,
0.3364745, -0.01956993, 1.673892, 0, 0.1764706, 1, 1,
0.3371291, -0.8265924, 3.241871, 0, 0.172549, 1, 1,
0.3437844, 2.608298, -0.7132889, 0, 0.1647059, 1, 1,
0.3549104, 0.7962011, -0.0003565204, 0, 0.1607843, 1, 1,
0.3573931, 0.4551639, 1.774507, 0, 0.1529412, 1, 1,
0.3695057, -1.240286, 3.317408, 0, 0.1490196, 1, 1,
0.3707251, 0.6756159, 0.3329315, 0, 0.1411765, 1, 1,
0.3760408, -0.6971475, 1.632453, 0, 0.1372549, 1, 1,
0.3787652, 0.1771291, -0.4579746, 0, 0.1294118, 1, 1,
0.3836828, 0.2152649, 1.682492, 0, 0.1254902, 1, 1,
0.3849198, -0.1064218, 0.8259888, 0, 0.1176471, 1, 1,
0.3867377, 0.02081404, 1.759515, 0, 0.1137255, 1, 1,
0.3898534, -0.9370413, 1.58187, 0, 0.1058824, 1, 1,
0.3921494, 0.6788079, 0.4742824, 0, 0.09803922, 1, 1,
0.3927343, 0.3602782, 1.045974, 0, 0.09411765, 1, 1,
0.3937355, -0.4116311, 3.591856, 0, 0.08627451, 1, 1,
0.3937405, 0.02989589, 1.548749, 0, 0.08235294, 1, 1,
0.4025097, 0.7840235, -0.4773616, 0, 0.07450981, 1, 1,
0.402928, 0.7100503, 0.4309951, 0, 0.07058824, 1, 1,
0.4040017, 1.668244, 0.9681865, 0, 0.0627451, 1, 1,
0.4064541, 0.05611497, -0.2362854, 0, 0.05882353, 1, 1,
0.4148193, 0.4975107, -0.4981698, 0, 0.05098039, 1, 1,
0.4163525, 0.2782141, -0.8835654, 0, 0.04705882, 1, 1,
0.4165333, 2.326981, 1.591806, 0, 0.03921569, 1, 1,
0.41734, -0.751154, 1.737431, 0, 0.03529412, 1, 1,
0.4195526, -0.3817987, 2.810851, 0, 0.02745098, 1, 1,
0.4210287, 1.155608, -1.566825, 0, 0.02352941, 1, 1,
0.4212682, -0.5439113, 1.029834, 0, 0.01568628, 1, 1,
0.4234887, -0.0439726, 2.695479, 0, 0.01176471, 1, 1,
0.4235635, 0.5432386, 1.67515, 0, 0.003921569, 1, 1,
0.4249425, -0.8512626, 1.605565, 0.003921569, 0, 1, 1,
0.4250605, -1.181169, 2.76329, 0.007843138, 0, 1, 1,
0.4271929, 1.294565, -0.6162629, 0.01568628, 0, 1, 1,
0.4346727, -0.5374981, 3.024989, 0.01960784, 0, 1, 1,
0.434781, 1.72358, 0.05088464, 0.02745098, 0, 1, 1,
0.4357475, -0.03585429, 1.439135, 0.03137255, 0, 1, 1,
0.4405057, -0.05334838, 2.793894, 0.03921569, 0, 1, 1,
0.4455098, 0.8993515, 0.4780892, 0.04313726, 0, 1, 1,
0.4492333, 1.036912, 0.1460325, 0.05098039, 0, 1, 1,
0.4510219, -0.1909362, 0.5633957, 0.05490196, 0, 1, 1,
0.4604332, -0.3628527, 3.415619, 0.0627451, 0, 1, 1,
0.4617223, -0.6442056, 2.741261, 0.06666667, 0, 1, 1,
0.4634411, -0.3813317, 2.066245, 0.07450981, 0, 1, 1,
0.4736218, 1.010778, -0.3146029, 0.07843138, 0, 1, 1,
0.478186, -0.2845508, 2.207295, 0.08627451, 0, 1, 1,
0.4827567, -0.8820899, 2.49047, 0.09019608, 0, 1, 1,
0.4843178, 0.5984975, 1.574725, 0.09803922, 0, 1, 1,
0.487864, 0.07573878, 2.440441, 0.1058824, 0, 1, 1,
0.4926211, 0.9077973, 0.1549188, 0.1098039, 0, 1, 1,
0.4944692, -0.0207347, 2.214379, 0.1176471, 0, 1, 1,
0.4959765, 0.1655774, 0.8903123, 0.1215686, 0, 1, 1,
0.4982519, 1.908256, -0.4275197, 0.1294118, 0, 1, 1,
0.5037733, -0.154887, 3.031934, 0.1333333, 0, 1, 1,
0.506409, -0.608452, 0.8751624, 0.1411765, 0, 1, 1,
0.508028, 1.369672, 0.6561688, 0.145098, 0, 1, 1,
0.5106059, -1.449274, 2.366012, 0.1529412, 0, 1, 1,
0.5114529, 0.430381, 1.259241, 0.1568628, 0, 1, 1,
0.5116071, 1.176089, -0.1768306, 0.1647059, 0, 1, 1,
0.5144423, 1.306365, 0.1105697, 0.1686275, 0, 1, 1,
0.5182945, 1.346512, 1.48276, 0.1764706, 0, 1, 1,
0.5186155, -0.214263, 0.7053373, 0.1803922, 0, 1, 1,
0.5203187, -0.04905035, 1.41571, 0.1882353, 0, 1, 1,
0.5252467, -1.396529, 1.497722, 0.1921569, 0, 1, 1,
0.5286861, 1.411905, 1.432495, 0.2, 0, 1, 1,
0.5288715, -0.1189574, 0.6411229, 0.2078431, 0, 1, 1,
0.5295169, -1.606478, 4.603213, 0.2117647, 0, 1, 1,
0.5305759, -0.1816048, 3.154709, 0.2196078, 0, 1, 1,
0.5434814, -1.678236, 2.147324, 0.2235294, 0, 1, 1,
0.5455109, 0.709219, 1.000202, 0.2313726, 0, 1, 1,
0.5474893, -1.169342, 3.835298, 0.2352941, 0, 1, 1,
0.5480395, -0.5393791, 2.133845, 0.2431373, 0, 1, 1,
0.5549261, 0.8984443, 1.064242, 0.2470588, 0, 1, 1,
0.5556172, -1.330416, 3.522764, 0.254902, 0, 1, 1,
0.556255, -0.0196211, 2.063995, 0.2588235, 0, 1, 1,
0.5573215, -0.8398613, 2.260457, 0.2666667, 0, 1, 1,
0.558701, 0.4725813, 1.34712, 0.2705882, 0, 1, 1,
0.5616079, -0.1296031, 2.126949, 0.2784314, 0, 1, 1,
0.5688683, -0.9492885, 1.763247, 0.282353, 0, 1, 1,
0.5711964, -0.7337182, 2.49425, 0.2901961, 0, 1, 1,
0.572163, -0.7523109, 1.574372, 0.2941177, 0, 1, 1,
0.5742106, 1.569843, 0.1368354, 0.3019608, 0, 1, 1,
0.5753736, -0.5045325, 3.166384, 0.3098039, 0, 1, 1,
0.5795395, 1.527933, -0.1729176, 0.3137255, 0, 1, 1,
0.5799672, -1.848092, 3.318167, 0.3215686, 0, 1, 1,
0.5824077, -0.1634658, 1.451347, 0.3254902, 0, 1, 1,
0.5827724, -0.4252364, 0.7255625, 0.3333333, 0, 1, 1,
0.5836948, 0.7053284, -1.827668, 0.3372549, 0, 1, 1,
0.5877929, -0.005234453, 0.4462748, 0.345098, 0, 1, 1,
0.587815, 0.9092191, -0.5398404, 0.3490196, 0, 1, 1,
0.6008143, 1.050897, 0.7623125, 0.3568628, 0, 1, 1,
0.6044066, -0.1683892, 1.375527, 0.3607843, 0, 1, 1,
0.6071686, -1.657189, 3.014604, 0.3686275, 0, 1, 1,
0.6079229, -0.982153, 0.843025, 0.372549, 0, 1, 1,
0.6095954, 2.551022, -0.2299926, 0.3803922, 0, 1, 1,
0.6132239, -0.3790294, 3.61027, 0.3843137, 0, 1, 1,
0.6144298, 0.7271165, -0.13569, 0.3921569, 0, 1, 1,
0.619723, -0.7686433, 4.304876, 0.3960784, 0, 1, 1,
0.6219538, -0.703609, 2.043916, 0.4039216, 0, 1, 1,
0.6320189, -1.240276, 1.92734, 0.4117647, 0, 1, 1,
0.6369247, 0.5142571, 1.24904, 0.4156863, 0, 1, 1,
0.6387494, 0.7242448, -1.174622, 0.4235294, 0, 1, 1,
0.6396613, -0.05746313, 1.503042, 0.427451, 0, 1, 1,
0.6434346, 0.01352358, 1.513314, 0.4352941, 0, 1, 1,
0.6440344, 0.2067866, 1.060815, 0.4392157, 0, 1, 1,
0.6519445, -0.117575, 1.759498, 0.4470588, 0, 1, 1,
0.6577386, -0.2159334, 2.808972, 0.4509804, 0, 1, 1,
0.6601878, -1.902812, 1.842721, 0.4588235, 0, 1, 1,
0.6623815, -0.7031032, 1.593841, 0.4627451, 0, 1, 1,
0.6627195, -2.012417, 3.857537, 0.4705882, 0, 1, 1,
0.6661094, 0.2313595, 1.614686, 0.4745098, 0, 1, 1,
0.6669634, -0.2128802, 1.998598, 0.4823529, 0, 1, 1,
0.6669962, -0.3844852, 3.699656, 0.4862745, 0, 1, 1,
0.6671098, -1.164345, 3.016997, 0.4941176, 0, 1, 1,
0.6698565, -0.3955646, 0.4874817, 0.5019608, 0, 1, 1,
0.672546, 0.5325376, 1.23956, 0.5058824, 0, 1, 1,
0.6736585, -0.3637662, 1.568526, 0.5137255, 0, 1, 1,
0.6811815, 0.2034726, 1.360567, 0.5176471, 0, 1, 1,
0.6812988, -1.162177, 1.670634, 0.5254902, 0, 1, 1,
0.6816113, 1.718419, -0.1408016, 0.5294118, 0, 1, 1,
0.6835557, -1.377333, 1.718442, 0.5372549, 0, 1, 1,
0.6842789, 0.31727, 1.690174, 0.5411765, 0, 1, 1,
0.6854992, 0.0939408, 0.5819519, 0.5490196, 0, 1, 1,
0.6872431, -0.1756189, 2.433364, 0.5529412, 0, 1, 1,
0.6889004, -0.710517, 2.376452, 0.5607843, 0, 1, 1,
0.6923977, 0.2113288, 2.62405, 0.5647059, 0, 1, 1,
0.6997465, -1.121743, 3.871521, 0.572549, 0, 1, 1,
0.7028766, -0.1760635, 1.705528, 0.5764706, 0, 1, 1,
0.707414, 0.2044477, 0.637382, 0.5843138, 0, 1, 1,
0.7094355, 1.041774, 1.879032, 0.5882353, 0, 1, 1,
0.7265558, 0.7067311, 1.260515, 0.5960785, 0, 1, 1,
0.73093, -0.4154744, 1.383855, 0.6039216, 0, 1, 1,
0.7317676, -1.719882, 2.49418, 0.6078432, 0, 1, 1,
0.7338841, 0.2713181, 0.341273, 0.6156863, 0, 1, 1,
0.7388425, 0.008981048, 1.668429, 0.6196079, 0, 1, 1,
0.7406187, 1.439535, 0.5807397, 0.627451, 0, 1, 1,
0.7427217, 1.719917, -0.6206542, 0.6313726, 0, 1, 1,
0.7505332, -0.08040901, 3.726378, 0.6392157, 0, 1, 1,
0.7543466, -0.8330494, 2.451151, 0.6431373, 0, 1, 1,
0.7558709, -0.6587152, 3.072052, 0.6509804, 0, 1, 1,
0.7586513, 0.5243796, 0.293995, 0.654902, 0, 1, 1,
0.7620595, 1.614885, -0.1140862, 0.6627451, 0, 1, 1,
0.7630032, -1.129532, 2.442988, 0.6666667, 0, 1, 1,
0.7649387, -0.6449441, 4.16964, 0.6745098, 0, 1, 1,
0.765264, -1.247383, 3.207119, 0.6784314, 0, 1, 1,
0.77175, 0.4056665, 2.264328, 0.6862745, 0, 1, 1,
0.7730398, 0.1275338, 1.804285, 0.6901961, 0, 1, 1,
0.7780786, -1.13581, 2.307053, 0.6980392, 0, 1, 1,
0.7817771, 1.180906, -0.6838156, 0.7058824, 0, 1, 1,
0.7821814, 1.322666, 1.606935, 0.7098039, 0, 1, 1,
0.7824409, -1.110299, 3.728236, 0.7176471, 0, 1, 1,
0.7866833, -0.2807784, 2.604498, 0.7215686, 0, 1, 1,
0.788632, -0.7516078, 0.9464887, 0.7294118, 0, 1, 1,
0.7911921, 0.1859824, 0.9934005, 0.7333333, 0, 1, 1,
0.7914987, -0.09352458, 0.7733621, 0.7411765, 0, 1, 1,
0.7929036, 1.698228, 0.06198454, 0.7450981, 0, 1, 1,
0.7933034, -0.4826679, 2.160993, 0.7529412, 0, 1, 1,
0.8035398, -0.5264037, 1.659281, 0.7568628, 0, 1, 1,
0.8058233, 0.3585179, 0.549235, 0.7647059, 0, 1, 1,
0.8059648, -0.783087, 1.59028, 0.7686275, 0, 1, 1,
0.8068978, 1.363131, -2.14454, 0.7764706, 0, 1, 1,
0.8070884, -0.02258282, 3.914903, 0.7803922, 0, 1, 1,
0.8117167, 1.418143, -0.464521, 0.7882353, 0, 1, 1,
0.8118325, 0.05750202, 1.76711, 0.7921569, 0, 1, 1,
0.8123767, 0.170992, -0.06768376, 0.8, 0, 1, 1,
0.8168591, 0.4843926, 0.3197673, 0.8078431, 0, 1, 1,
0.8194953, -0.9606423, 2.459998, 0.8117647, 0, 1, 1,
0.8249112, 0.09529154, 2.124708, 0.8196079, 0, 1, 1,
0.8293203, -0.3887678, 3.084638, 0.8235294, 0, 1, 1,
0.8293731, -0.1480405, 2.301892, 0.8313726, 0, 1, 1,
0.8347542, 1.330134, 0.8960417, 0.8352941, 0, 1, 1,
0.835678, 0.5104536, 1.899538, 0.8431373, 0, 1, 1,
0.8395136, -1.270105, 1.359676, 0.8470588, 0, 1, 1,
0.8509598, 0.09143943, -0.4004235, 0.854902, 0, 1, 1,
0.8526323, 0.6149292, 1.2454, 0.8588235, 0, 1, 1,
0.8550695, 0.6916316, 0.6510177, 0.8666667, 0, 1, 1,
0.8597843, -0.380714, 1.63055, 0.8705882, 0, 1, 1,
0.8602431, -0.6847337, 1.605919, 0.8784314, 0, 1, 1,
0.8630674, -0.6248451, 0.8472148, 0.8823529, 0, 1, 1,
0.8661152, 0.8540245, 1.726283, 0.8901961, 0, 1, 1,
0.8682329, 0.2512358, 1.96757, 0.8941177, 0, 1, 1,
0.873775, -1.288994, 1.236805, 0.9019608, 0, 1, 1,
0.8776565, 1.958619, 0.2626852, 0.9098039, 0, 1, 1,
0.8802141, -0.2749807, 3.135757, 0.9137255, 0, 1, 1,
0.8910395, -0.2589347, 1.183956, 0.9215686, 0, 1, 1,
0.8941889, 1.498212, 0.8670999, 0.9254902, 0, 1, 1,
0.9019591, -0.1517931, 2.049304, 0.9333333, 0, 1, 1,
0.9073206, 1.922188, 1.279817, 0.9372549, 0, 1, 1,
0.9084283, 0.03650003, 0.2009015, 0.945098, 0, 1, 1,
0.9092968, 0.7714299, 0.6103102, 0.9490196, 0, 1, 1,
0.9105861, 0.5747725, 2.668246, 0.9568627, 0, 1, 1,
0.9120393, -1.032902, 0.6189553, 0.9607843, 0, 1, 1,
0.9215727, 0.457721, 0.6767811, 0.9686275, 0, 1, 1,
0.921607, -1.177737, 3.204954, 0.972549, 0, 1, 1,
0.9256306, -0.08073732, 0.6217376, 0.9803922, 0, 1, 1,
0.9287599, 2.026301, -0.6767194, 0.9843137, 0, 1, 1,
0.9328058, -0.6523872, 0.9635063, 0.9921569, 0, 1, 1,
0.9512435, -0.2955647, 3.106534, 0.9960784, 0, 1, 1,
0.9545258, -1.286902, 1.920915, 1, 0, 0.9960784, 1,
0.9600888, -2.627593, 2.307959, 1, 0, 0.9882353, 1,
0.9603375, 0.724472, 0.8598319, 1, 0, 0.9843137, 1,
0.9630758, -0.2588406, 4.039857, 1, 0, 0.9764706, 1,
0.9632169, -0.8698509, 2.15983, 1, 0, 0.972549, 1,
0.9708154, -1.332265, 3.549346, 1, 0, 0.9647059, 1,
0.9732262, -0.1927611, 1.048395, 1, 0, 0.9607843, 1,
0.9755729, -1.619341, 2.025518, 1, 0, 0.9529412, 1,
0.9810679, 0.6307282, 0.7505839, 1, 0, 0.9490196, 1,
0.9896883, -0.3237068, 0.6988099, 1, 0, 0.9411765, 1,
0.9944985, 0.303476, 1.729924, 1, 0, 0.9372549, 1,
1.000659, 0.8446426, -0.0474068, 1, 0, 0.9294118, 1,
1.011997, 0.06304651, 2.374867, 1, 0, 0.9254902, 1,
1.019701, -0.06726607, 1.957685, 1, 0, 0.9176471, 1,
1.020249, 1.203183, 1.045359, 1, 0, 0.9137255, 1,
1.021214, -0.03956869, 2.100005, 1, 0, 0.9058824, 1,
1.023266, -0.8743927, 3.948478, 1, 0, 0.9019608, 1,
1.023572, -0.3107544, 0.133991, 1, 0, 0.8941177, 1,
1.028735, -0.02638441, 3.19832, 1, 0, 0.8862745, 1,
1.030911, 0.7398291, -1.043367, 1, 0, 0.8823529, 1,
1.033365, -0.1210808, 0.5566587, 1, 0, 0.8745098, 1,
1.050588, -2.119358, 4.078179, 1, 0, 0.8705882, 1,
1.05697, -0.01552654, 1.378381, 1, 0, 0.8627451, 1,
1.05865, -1.578626, 2.795424, 1, 0, 0.8588235, 1,
1.063795, 0.09806644, -0.01775494, 1, 0, 0.8509804, 1,
1.065059, -0.170982, 2.252836, 1, 0, 0.8470588, 1,
1.066647, -0.2747391, 1.440343, 1, 0, 0.8392157, 1,
1.069784, -0.4637811, 1.047705, 1, 0, 0.8352941, 1,
1.071333, -0.9732748, 0.3737584, 1, 0, 0.827451, 1,
1.071669, -0.03894812, 0.06847163, 1, 0, 0.8235294, 1,
1.078227, 0.2832202, 1.599473, 1, 0, 0.8156863, 1,
1.08416, 0.7930246, 1.86717, 1, 0, 0.8117647, 1,
1.085481, 0.5375894, -0.3783964, 1, 0, 0.8039216, 1,
1.09245, -1.512634, 1.031672, 1, 0, 0.7960784, 1,
1.093442, -0.4221407, 3.242404, 1, 0, 0.7921569, 1,
1.102879, -0.5597378, 3.873057, 1, 0, 0.7843137, 1,
1.105427, 1.306274, -0.2682077, 1, 0, 0.7803922, 1,
1.105964, -0.8105941, 1.046436, 1, 0, 0.772549, 1,
1.106556, -0.0247466, 1.334736, 1, 0, 0.7686275, 1,
1.116669, 0.5863949, 0.8782391, 1, 0, 0.7607843, 1,
1.120309, 0.7253881, -0.335995, 1, 0, 0.7568628, 1,
1.128334, -0.3235722, 0.9768832, 1, 0, 0.7490196, 1,
1.132828, 0.816528, 2.218047, 1, 0, 0.7450981, 1,
1.13831, -1.475592, 3.939702, 1, 0, 0.7372549, 1,
1.152575, -0.3020453, 3.414799, 1, 0, 0.7333333, 1,
1.152755, 0.2457582, 0.8618948, 1, 0, 0.7254902, 1,
1.155504, -1.177897, 0.4715507, 1, 0, 0.7215686, 1,
1.166811, -0.261617, 0.319522, 1, 0, 0.7137255, 1,
1.168327, -0.3808607, 2.757719, 1, 0, 0.7098039, 1,
1.17068, 0.2131217, 1.166258, 1, 0, 0.7019608, 1,
1.17205, 0.9310538, 0.6757749, 1, 0, 0.6941177, 1,
1.182309, 0.8096736, 0.7781352, 1, 0, 0.6901961, 1,
1.186242, 0.5987601, -0.2044407, 1, 0, 0.682353, 1,
1.189157, 0.5016975, 1.532926, 1, 0, 0.6784314, 1,
1.190818, 0.6661353, 0.6689878, 1, 0, 0.6705883, 1,
1.191149, -1.04965, 1.67922, 1, 0, 0.6666667, 1,
1.194427, 0.393911, 2.991264, 1, 0, 0.6588235, 1,
1.215828, -3.142035, 3.639488, 1, 0, 0.654902, 1,
1.221239, 1.394134, 3.073794, 1, 0, 0.6470588, 1,
1.231423, 0.08824607, 1.452061, 1, 0, 0.6431373, 1,
1.235906, -1.488873, 1.424683, 1, 0, 0.6352941, 1,
1.238731, 1.41334, 2.432549, 1, 0, 0.6313726, 1,
1.247268, -0.7037976, -0.1237004, 1, 0, 0.6235294, 1,
1.270787, -0.3928364, 1.499371, 1, 0, 0.6196079, 1,
1.301688, 0.6280699, 2.159293, 1, 0, 0.6117647, 1,
1.322044, 0.5823638, 1.163561, 1, 0, 0.6078432, 1,
1.322285, 1.320899, -0.9389871, 1, 0, 0.6, 1,
1.322357, -0.9503886, 4.959464, 1, 0, 0.5921569, 1,
1.329826, -1.700915, 2.009528, 1, 0, 0.5882353, 1,
1.330244, 2.312962, 2.077255, 1, 0, 0.5803922, 1,
1.336184, 0.3888571, 2.005947, 1, 0, 0.5764706, 1,
1.354322, -0.2479402, 0.9682189, 1, 0, 0.5686275, 1,
1.355063, -0.2292838, 1.6281, 1, 0, 0.5647059, 1,
1.35517, 0.1719912, 2.256904, 1, 0, 0.5568628, 1,
1.357911, 0.1880443, -0.004159471, 1, 0, 0.5529412, 1,
1.361121, -0.6100827, 0.8431868, 1, 0, 0.5450981, 1,
1.363967, 0.8265171, 2.292854, 1, 0, 0.5411765, 1,
1.379977, 0.29439, 0.7740037, 1, 0, 0.5333334, 1,
1.388551, 0.338442, 0.8803562, 1, 0, 0.5294118, 1,
1.38926, -1.089856, 2.140237, 1, 0, 0.5215687, 1,
1.390991, 0.5914509, 0.1818002, 1, 0, 0.5176471, 1,
1.399369, -0.5344186, 2.598965, 1, 0, 0.509804, 1,
1.401223, 0.1853062, 1.466738, 1, 0, 0.5058824, 1,
1.423404, -0.0903721, 2.136655, 1, 0, 0.4980392, 1,
1.436338, 1.888724, 1.111249, 1, 0, 0.4901961, 1,
1.438296, 0.0808515, 1.741775, 1, 0, 0.4862745, 1,
1.438908, -0.4202808, 2.410047, 1, 0, 0.4784314, 1,
1.441069, -0.4576056, 1.077181, 1, 0, 0.4745098, 1,
1.464287, -0.5982201, 2.80471, 1, 0, 0.4666667, 1,
1.469344, 0.4906817, -0.09622833, 1, 0, 0.4627451, 1,
1.469769, -0.88035, 0.7458404, 1, 0, 0.454902, 1,
1.471688, 1.535602, 1.438082, 1, 0, 0.4509804, 1,
1.481557, -0.4976195, 1.984711, 1, 0, 0.4431373, 1,
1.490436, 0.1559403, 2.101152, 1, 0, 0.4392157, 1,
1.519813, -0.7827863, 1.248253, 1, 0, 0.4313726, 1,
1.522463, -1.047141, 3.160409, 1, 0, 0.427451, 1,
1.523426, -2.091108, 3.440563, 1, 0, 0.4196078, 1,
1.527558, -0.4752117, 1.151241, 1, 0, 0.4156863, 1,
1.531504, -0.5957638, 1.725203, 1, 0, 0.4078431, 1,
1.53723, 0.07999468, 2.685181, 1, 0, 0.4039216, 1,
1.541598, 0.5725544, 1.510964, 1, 0, 0.3960784, 1,
1.542508, -0.3828319, 1.84619, 1, 0, 0.3882353, 1,
1.542654, 0.02935862, 3.43008, 1, 0, 0.3843137, 1,
1.543937, -0.5430381, 3.127911, 1, 0, 0.3764706, 1,
1.553522, -0.0493877, 2.383782, 1, 0, 0.372549, 1,
1.553824, -0.6339269, 2.2853, 1, 0, 0.3647059, 1,
1.572233, -0.1171141, 1.98718, 1, 0, 0.3607843, 1,
1.579485, -1.047911, 1.652277, 1, 0, 0.3529412, 1,
1.61131, -0.2918131, 1.207339, 1, 0, 0.3490196, 1,
1.618252, 1.280064, 0.7482642, 1, 0, 0.3411765, 1,
1.621627, 1.513767, 2.374666, 1, 0, 0.3372549, 1,
1.626328, -0.1772826, 1.286141, 1, 0, 0.3294118, 1,
1.635375, 0.6479642, -0.234292, 1, 0, 0.3254902, 1,
1.64788, -0.03064093, 2.788156, 1, 0, 0.3176471, 1,
1.660119, -0.7519785, 0.2400608, 1, 0, 0.3137255, 1,
1.660546, 2.013323, 1.328991, 1, 0, 0.3058824, 1,
1.694344, -0.3476456, 1.213976, 1, 0, 0.2980392, 1,
1.695262, 1.722373, 1.207057, 1, 0, 0.2941177, 1,
1.700894, 0.09607406, 1.665939, 1, 0, 0.2862745, 1,
1.702295, 1.141646, -0.2793616, 1, 0, 0.282353, 1,
1.704389, -0.8426896, 2.867831, 1, 0, 0.2745098, 1,
1.723793, -0.9616033, 2.270597, 1, 0, 0.2705882, 1,
1.728771, 0.5910994, 0.3402062, 1, 0, 0.2627451, 1,
1.729788, 0.08593979, 1.403639, 1, 0, 0.2588235, 1,
1.735431, -0.4060138, 2.206949, 1, 0, 0.2509804, 1,
1.73544, 1.372329, -0.08337471, 1, 0, 0.2470588, 1,
1.741774, 1.829781, 0.7754628, 1, 0, 0.2392157, 1,
1.754634, -0.2073011, 2.916279, 1, 0, 0.2352941, 1,
1.758314, 0.245502, 1.17626, 1, 0, 0.227451, 1,
1.769414, 0.02765681, 1.75496, 1, 0, 0.2235294, 1,
1.772336, 0.7810544, 1.537774, 1, 0, 0.2156863, 1,
1.773163, 0.8721057, 1.776022, 1, 0, 0.2117647, 1,
1.777116, -0.1174983, -0.3198624, 1, 0, 0.2039216, 1,
1.805985, 0.2999453, -0.1301223, 1, 0, 0.1960784, 1,
1.852288, 1.094453, 1.701877, 1, 0, 0.1921569, 1,
1.869264, 0.9364632, 1.399239, 1, 0, 0.1843137, 1,
1.870889, 0.1030896, 1.531039, 1, 0, 0.1803922, 1,
1.901753, -0.1587955, 0.9189003, 1, 0, 0.172549, 1,
1.902925, -1.402949, 1.483539, 1, 0, 0.1686275, 1,
1.910689, 0.8054281, -0.3065607, 1, 0, 0.1607843, 1,
1.911288, 1.621573, 2.046292, 1, 0, 0.1568628, 1,
1.917679, 0.5609222, 1.846952, 1, 0, 0.1490196, 1,
1.919685, 0.3631232, 2.1101, 1, 0, 0.145098, 1,
1.922465, -0.1484621, 3.177051, 1, 0, 0.1372549, 1,
1.923604, 0.2221707, 2.820639, 1, 0, 0.1333333, 1,
1.946846, -1.849515, 3.63697, 1, 0, 0.1254902, 1,
1.960203, 0.4056517, 0.5627348, 1, 0, 0.1215686, 1,
1.966205, -2.144116, 1.188264, 1, 0, 0.1137255, 1,
1.998004, 0.3564916, 1.205177, 1, 0, 0.1098039, 1,
2.000574, -0.2573911, 0.7086822, 1, 0, 0.1019608, 1,
2.024734, -2.360256, 0.6150647, 1, 0, 0.09411765, 1,
2.040133, 0.2825086, 1.191301, 1, 0, 0.09019608, 1,
2.046002, 1.11607, 1.346499, 1, 0, 0.08235294, 1,
2.061158, -0.2096495, -0.01354927, 1, 0, 0.07843138, 1,
2.077403, 0.9517961, 0.9958251, 1, 0, 0.07058824, 1,
2.099306, 0.166733, 2.425055, 1, 0, 0.06666667, 1,
2.18078, -0.1494956, 3.655703, 1, 0, 0.05882353, 1,
2.192477, 0.03270352, 1.55082, 1, 0, 0.05490196, 1,
2.233023, 1.189559, 0.8113802, 1, 0, 0.04705882, 1,
2.243397, 0.2237933, -0.4605097, 1, 0, 0.04313726, 1,
2.253249, -3.011055, 1.683865, 1, 0, 0.03529412, 1,
2.262224, 1.233582, 1.044976, 1, 0, 0.03137255, 1,
2.363746, 0.3021724, 0.2859944, 1, 0, 0.02352941, 1,
2.880062, 0.3804599, 3.282172, 1, 0, 0.01960784, 1,
3.200291, 0.842043, 2.358806, 1, 0, 0.01176471, 1,
3.55752, -0.5861627, 3.394616, 1, 0, 0.007843138, 1
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
0.1619711, -4.234607, -6.971746, 0, -0.5, 0.5, 0.5,
0.1619711, -4.234607, -6.971746, 1, -0.5, 0.5, 0.5,
0.1619711, -4.234607, -6.971746, 1, 1.5, 0.5, 0.5,
0.1619711, -4.234607, -6.971746, 0, 1.5, 0.5, 0.5
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
-4.384669, 0.0808897, -6.971746, 0, -0.5, 0.5, 0.5,
-4.384669, 0.0808897, -6.971746, 1, -0.5, 0.5, 0.5,
-4.384669, 0.0808897, -6.971746, 1, 1.5, 0.5, 0.5,
-4.384669, 0.0808897, -6.971746, 0, 1.5, 0.5, 0.5
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
-4.384669, -4.234607, 0.1916728, 0, -0.5, 0.5, 0.5,
-4.384669, -4.234607, 0.1916728, 1, -0.5, 0.5, 0.5,
-4.384669, -4.234607, 0.1916728, 1, 1.5, 0.5, 0.5,
-4.384669, -4.234607, 0.1916728, 0, 1.5, 0.5, 0.5
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
-3, -3.238723, -5.318649,
3, -3.238723, -5.318649,
-3, -3.238723, -5.318649,
-3, -3.404704, -5.594165,
-2, -3.238723, -5.318649,
-2, -3.404704, -5.594165,
-1, -3.238723, -5.318649,
-1, -3.404704, -5.594165,
0, -3.238723, -5.318649,
0, -3.404704, -5.594165,
1, -3.238723, -5.318649,
1, -3.404704, -5.594165,
2, -3.238723, -5.318649,
2, -3.404704, -5.594165,
3, -3.238723, -5.318649,
3, -3.404704, -5.594165
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
-3, -3.736665, -6.145197, 0, -0.5, 0.5, 0.5,
-3, -3.736665, -6.145197, 1, -0.5, 0.5, 0.5,
-3, -3.736665, -6.145197, 1, 1.5, 0.5, 0.5,
-3, -3.736665, -6.145197, 0, 1.5, 0.5, 0.5,
-2, -3.736665, -6.145197, 0, -0.5, 0.5, 0.5,
-2, -3.736665, -6.145197, 1, -0.5, 0.5, 0.5,
-2, -3.736665, -6.145197, 1, 1.5, 0.5, 0.5,
-2, -3.736665, -6.145197, 0, 1.5, 0.5, 0.5,
-1, -3.736665, -6.145197, 0, -0.5, 0.5, 0.5,
-1, -3.736665, -6.145197, 1, -0.5, 0.5, 0.5,
-1, -3.736665, -6.145197, 1, 1.5, 0.5, 0.5,
-1, -3.736665, -6.145197, 0, 1.5, 0.5, 0.5,
0, -3.736665, -6.145197, 0, -0.5, 0.5, 0.5,
0, -3.736665, -6.145197, 1, -0.5, 0.5, 0.5,
0, -3.736665, -6.145197, 1, 1.5, 0.5, 0.5,
0, -3.736665, -6.145197, 0, 1.5, 0.5, 0.5,
1, -3.736665, -6.145197, 0, -0.5, 0.5, 0.5,
1, -3.736665, -6.145197, 1, -0.5, 0.5, 0.5,
1, -3.736665, -6.145197, 1, 1.5, 0.5, 0.5,
1, -3.736665, -6.145197, 0, 1.5, 0.5, 0.5,
2, -3.736665, -6.145197, 0, -0.5, 0.5, 0.5,
2, -3.736665, -6.145197, 1, -0.5, 0.5, 0.5,
2, -3.736665, -6.145197, 1, 1.5, 0.5, 0.5,
2, -3.736665, -6.145197, 0, 1.5, 0.5, 0.5,
3, -3.736665, -6.145197, 0, -0.5, 0.5, 0.5,
3, -3.736665, -6.145197, 1, -0.5, 0.5, 0.5,
3, -3.736665, -6.145197, 1, 1.5, 0.5, 0.5,
3, -3.736665, -6.145197, 0, 1.5, 0.5, 0.5
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
-3.335444, -3, -5.318649,
-3.335444, 3, -5.318649,
-3.335444, -3, -5.318649,
-3.510315, -3, -5.594165,
-3.335444, -2, -5.318649,
-3.510315, -2, -5.594165,
-3.335444, -1, -5.318649,
-3.510315, -1, -5.594165,
-3.335444, 0, -5.318649,
-3.510315, 0, -5.594165,
-3.335444, 1, -5.318649,
-3.510315, 1, -5.594165,
-3.335444, 2, -5.318649,
-3.510315, 2, -5.594165,
-3.335444, 3, -5.318649,
-3.510315, 3, -5.594165
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
-3.860056, -3, -6.145197, 0, -0.5, 0.5, 0.5,
-3.860056, -3, -6.145197, 1, -0.5, 0.5, 0.5,
-3.860056, -3, -6.145197, 1, 1.5, 0.5, 0.5,
-3.860056, -3, -6.145197, 0, 1.5, 0.5, 0.5,
-3.860056, -2, -6.145197, 0, -0.5, 0.5, 0.5,
-3.860056, -2, -6.145197, 1, -0.5, 0.5, 0.5,
-3.860056, -2, -6.145197, 1, 1.5, 0.5, 0.5,
-3.860056, -2, -6.145197, 0, 1.5, 0.5, 0.5,
-3.860056, -1, -6.145197, 0, -0.5, 0.5, 0.5,
-3.860056, -1, -6.145197, 1, -0.5, 0.5, 0.5,
-3.860056, -1, -6.145197, 1, 1.5, 0.5, 0.5,
-3.860056, -1, -6.145197, 0, 1.5, 0.5, 0.5,
-3.860056, 0, -6.145197, 0, -0.5, 0.5, 0.5,
-3.860056, 0, -6.145197, 1, -0.5, 0.5, 0.5,
-3.860056, 0, -6.145197, 1, 1.5, 0.5, 0.5,
-3.860056, 0, -6.145197, 0, 1.5, 0.5, 0.5,
-3.860056, 1, -6.145197, 0, -0.5, 0.5, 0.5,
-3.860056, 1, -6.145197, 1, -0.5, 0.5, 0.5,
-3.860056, 1, -6.145197, 1, 1.5, 0.5, 0.5,
-3.860056, 1, -6.145197, 0, 1.5, 0.5, 0.5,
-3.860056, 2, -6.145197, 0, -0.5, 0.5, 0.5,
-3.860056, 2, -6.145197, 1, -0.5, 0.5, 0.5,
-3.860056, 2, -6.145197, 1, 1.5, 0.5, 0.5,
-3.860056, 2, -6.145197, 0, 1.5, 0.5, 0.5,
-3.860056, 3, -6.145197, 0, -0.5, 0.5, 0.5,
-3.860056, 3, -6.145197, 1, -0.5, 0.5, 0.5,
-3.860056, 3, -6.145197, 1, 1.5, 0.5, 0.5,
-3.860056, 3, -6.145197, 0, 1.5, 0.5, 0.5
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
-3.335444, -3.238723, -4,
-3.335444, -3.238723, 4,
-3.335444, -3.238723, -4,
-3.510315, -3.404704, -4,
-3.335444, -3.238723, -2,
-3.510315, -3.404704, -2,
-3.335444, -3.238723, 0,
-3.510315, -3.404704, 0,
-3.335444, -3.238723, 2,
-3.510315, -3.404704, 2,
-3.335444, -3.238723, 4,
-3.510315, -3.404704, 4
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
-3.860056, -3.736665, -4, 0, -0.5, 0.5, 0.5,
-3.860056, -3.736665, -4, 1, -0.5, 0.5, 0.5,
-3.860056, -3.736665, -4, 1, 1.5, 0.5, 0.5,
-3.860056, -3.736665, -4, 0, 1.5, 0.5, 0.5,
-3.860056, -3.736665, -2, 0, -0.5, 0.5, 0.5,
-3.860056, -3.736665, -2, 1, -0.5, 0.5, 0.5,
-3.860056, -3.736665, -2, 1, 1.5, 0.5, 0.5,
-3.860056, -3.736665, -2, 0, 1.5, 0.5, 0.5,
-3.860056, -3.736665, 0, 0, -0.5, 0.5, 0.5,
-3.860056, -3.736665, 0, 1, -0.5, 0.5, 0.5,
-3.860056, -3.736665, 0, 1, 1.5, 0.5, 0.5,
-3.860056, -3.736665, 0, 0, 1.5, 0.5, 0.5,
-3.860056, -3.736665, 2, 0, -0.5, 0.5, 0.5,
-3.860056, -3.736665, 2, 1, -0.5, 0.5, 0.5,
-3.860056, -3.736665, 2, 1, 1.5, 0.5, 0.5,
-3.860056, -3.736665, 2, 0, 1.5, 0.5, 0.5,
-3.860056, -3.736665, 4, 0, -0.5, 0.5, 0.5,
-3.860056, -3.736665, 4, 1, -0.5, 0.5, 0.5,
-3.860056, -3.736665, 4, 1, 1.5, 0.5, 0.5,
-3.860056, -3.736665, 4, 0, 1.5, 0.5, 0.5
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
-3.335444, -3.238723, -5.318649,
-3.335444, 3.400503, -5.318649,
-3.335444, -3.238723, 5.701995,
-3.335444, 3.400503, 5.701995,
-3.335444, -3.238723, -5.318649,
-3.335444, -3.238723, 5.701995,
-3.335444, 3.400503, -5.318649,
-3.335444, 3.400503, 5.701995,
-3.335444, -3.238723, -5.318649,
3.659386, -3.238723, -5.318649,
-3.335444, -3.238723, 5.701995,
3.659386, -3.238723, 5.701995,
-3.335444, 3.400503, -5.318649,
3.659386, 3.400503, -5.318649,
-3.335444, 3.400503, 5.701995,
3.659386, 3.400503, 5.701995,
3.659386, -3.238723, -5.318649,
3.659386, 3.400503, -5.318649,
3.659386, -3.238723, 5.701995,
3.659386, 3.400503, 5.701995,
3.659386, -3.238723, -5.318649,
3.659386, -3.238723, 5.701995,
3.659386, 3.400503, -5.318649,
3.659386, 3.400503, 5.701995
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
var radius = 7.819882;
var distance = 34.79154;
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
mvMatrix.translate( -0.1619711, -0.0808897, -0.1916728 );
mvMatrix.scale( 1.208751, 1.273493, 0.7671974 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.79154);
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
desmetryne<-read.table("desmetryne.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-desmetryne$V2
```

```
## Error in eval(expr, envir, enclos): object 'desmetryne' not found
```

```r
y<-desmetryne$V3
```

```
## Error in eval(expr, envir, enclos): object 'desmetryne' not found
```

```r
z<-desmetryne$V4
```

```
## Error in eval(expr, envir, enclos): object 'desmetryne' not found
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
-3.233578, 0.1158481, -1.693709, 0, 0, 1, 1, 1,
-2.768989, 0.8867536, -2.065086, 1, 0, 0, 1, 1,
-2.436949, 1.446979, 0.3208539, 1, 0, 0, 1, 1,
-2.301414, 0.2824894, -0.6115458, 1, 0, 0, 1, 1,
-2.239202, -0.3622809, -3.128279, 1, 0, 0, 1, 1,
-2.195673, 0.8484309, -1.071041, 1, 0, 0, 1, 1,
-2.188121, -0.7017024, -2.439064, 0, 0, 0, 1, 1,
-2.171601, -1.172624, -3.5685, 0, 0, 0, 1, 1,
-2.125615, 1.210865, -0.9174854, 0, 0, 0, 1, 1,
-2.125598, 2.667436, 0.3409968, 0, 0, 0, 1, 1,
-2.080817, -1.09619, -2.25449, 0, 0, 0, 1, 1,
-2.06909, -0.2418585, -0.4234478, 0, 0, 0, 1, 1,
-2.050143, -0.564806, -2.5624, 0, 0, 0, 1, 1,
-2.021811, 1.506835, -2.60297, 1, 1, 1, 1, 1,
-1.993274, -0.2310457, -1.52598, 1, 1, 1, 1, 1,
-1.992785, -0.03542364, -2.325349, 1, 1, 1, 1, 1,
-1.989519, -0.1559574, -3.193696, 1, 1, 1, 1, 1,
-1.97283, -0.720945, -1.624943, 1, 1, 1, 1, 1,
-1.968278, 1.025375, -0.1651535, 1, 1, 1, 1, 1,
-1.953892, -1.607438, -2.351247, 1, 1, 1, 1, 1,
-1.927798, 0.7162763, -2.693562, 1, 1, 1, 1, 1,
-1.896744, 1.183718, -0.2588068, 1, 1, 1, 1, 1,
-1.891108, -0.3860345, -0.8588294, 1, 1, 1, 1, 1,
-1.838736, -0.3309235, -0.7615933, 1, 1, 1, 1, 1,
-1.835168, 0.8152534, -1.566421, 1, 1, 1, 1, 1,
-1.796977, 1.194625, -1.312966, 1, 1, 1, 1, 1,
-1.796708, 0.6262742, -1.428614, 1, 1, 1, 1, 1,
-1.782942, 0.02236538, -1.560306, 1, 1, 1, 1, 1,
-1.777107, -2.57041, -2.616958, 0, 0, 1, 1, 1,
-1.766937, -0.4131074, -1.960651, 1, 0, 0, 1, 1,
-1.766311, -0.6790174, -2.050519, 1, 0, 0, 1, 1,
-1.765744, 0.3518567, -1.157648, 1, 0, 0, 1, 1,
-1.729438, -0.3790781, -2.203026, 1, 0, 0, 1, 1,
-1.72943, -0.4773637, -0.1089429, 1, 0, 0, 1, 1,
-1.726356, -0.9022322, -1.269295, 0, 0, 0, 1, 1,
-1.724158, -0.2305798, -2.106897, 0, 0, 0, 1, 1,
-1.721224, -1.453449, -3.964645, 0, 0, 0, 1, 1,
-1.67903, -0.9343755, -3.23222, 0, 0, 0, 1, 1,
-1.64989, -0.4121125, -1.337266, 0, 0, 0, 1, 1,
-1.648278, 1.100029, -0.4888057, 0, 0, 0, 1, 1,
-1.64628, -0.5631897, -1.300183, 0, 0, 0, 1, 1,
-1.637343, -0.3219438, -2.88238, 1, 1, 1, 1, 1,
-1.633102, 0.6328562, -1.04102, 1, 1, 1, 1, 1,
-1.613214, 1.212675, -0.5478096, 1, 1, 1, 1, 1,
-1.607638, -0.2471476, -1.771127, 1, 1, 1, 1, 1,
-1.597941, -0.01753299, -1.242101, 1, 1, 1, 1, 1,
-1.557185, 0.2760454, -1.233801, 1, 1, 1, 1, 1,
-1.552786, -0.8363129, -1.950089, 1, 1, 1, 1, 1,
-1.546663, -0.2064688, -1.734431, 1, 1, 1, 1, 1,
-1.536991, -0.5369961, -2.192149, 1, 1, 1, 1, 1,
-1.516309, 0.9229947, -1.922278, 1, 1, 1, 1, 1,
-1.514875, 1.138972, -0.9753942, 1, 1, 1, 1, 1,
-1.506756, 0.1258328, -1.03338, 1, 1, 1, 1, 1,
-1.491783, 1.825911, -1.147985, 1, 1, 1, 1, 1,
-1.487183, 0.7501482, 0.7319089, 1, 1, 1, 1, 1,
-1.486981, 0.08406229, -0.8251876, 1, 1, 1, 1, 1,
-1.477498, 2.704484, -0.5724527, 0, 0, 1, 1, 1,
-1.477051, 0.07111609, -0.4007181, 1, 0, 0, 1, 1,
-1.460483, 0.004667954, 0.3621962, 1, 0, 0, 1, 1,
-1.458954, -2.345971, -2.675317, 1, 0, 0, 1, 1,
-1.45413, -2.08041, -4.966062, 1, 0, 0, 1, 1,
-1.448246, -1.501887, -1.070902, 1, 0, 0, 1, 1,
-1.440608, -0.8704428, -0.5248821, 0, 0, 0, 1, 1,
-1.437329, 0.427947, 0.5135559, 0, 0, 0, 1, 1,
-1.427795, -0.1233432, -2.037646, 0, 0, 0, 1, 1,
-1.418995, 0.9963633, -1.145155, 0, 0, 0, 1, 1,
-1.416927, -0.3453656, -2.44649, 0, 0, 0, 1, 1,
-1.410298, -0.6712335, -1.673212, 0, 0, 0, 1, 1,
-1.390144, -0.06765962, -0.9104477, 0, 0, 0, 1, 1,
-1.389909, 1.100242, -1.584159, 1, 1, 1, 1, 1,
-1.380925, 0.9947498, -0.8543046, 1, 1, 1, 1, 1,
-1.379299, -1.135418, -2.556626, 1, 1, 1, 1, 1,
-1.378233, 0.8631353, -3.173, 1, 1, 1, 1, 1,
-1.372567, 0.3226117, -2.682686, 1, 1, 1, 1, 1,
-1.365055, 0.5845947, -0.8587329, 1, 1, 1, 1, 1,
-1.36421, 0.376277, 0.3317563, 1, 1, 1, 1, 1,
-1.362291, -1.978353, -1.573592, 1, 1, 1, 1, 1,
-1.352825, 0.03103613, -1.530742, 1, 1, 1, 1, 1,
-1.351783, -0.05451335, -2.301193, 1, 1, 1, 1, 1,
-1.349243, 0.4451699, -1.19282, 1, 1, 1, 1, 1,
-1.341691, -0.9075267, -2.291718, 1, 1, 1, 1, 1,
-1.329092, -0.4186484, -0.9712837, 1, 1, 1, 1, 1,
-1.328485, -0.9415925, -2.354147, 1, 1, 1, 1, 1,
-1.32665, -0.1714655, -0.4517001, 1, 1, 1, 1, 1,
-1.318735, 0.5162429, 0.2615674, 0, 0, 1, 1, 1,
-1.313565, -1.043771, -1.541482, 1, 0, 0, 1, 1,
-1.309988, -0.7825601, -2.261024, 1, 0, 0, 1, 1,
-1.297304, -1.892871, -2.207082, 1, 0, 0, 1, 1,
-1.293446, 0.8646083, -1.879134, 1, 0, 0, 1, 1,
-1.291507, 1.946681, 0.1019931, 1, 0, 0, 1, 1,
-1.289821, -1.009674, -1.084549, 0, 0, 0, 1, 1,
-1.287493, -1.317919, -2.096874, 0, 0, 0, 1, 1,
-1.281871, -1.35368, -1.170781, 0, 0, 0, 1, 1,
-1.280909, 0.4313073, -1.069155, 0, 0, 0, 1, 1,
-1.264577, 0.2833133, -1.05043, 0, 0, 0, 1, 1,
-1.245383, 0.4123148, -1.376119, 0, 0, 0, 1, 1,
-1.203939, 0.7070121, -1.268797, 0, 0, 0, 1, 1,
-1.195638, 0.7108487, -2.47058, 1, 1, 1, 1, 1,
-1.186446, 0.07581851, -1.67165, 1, 1, 1, 1, 1,
-1.185126, -0.2175724, -2.539659, 1, 1, 1, 1, 1,
-1.18412, -0.9839008, -0.6876578, 1, 1, 1, 1, 1,
-1.180459, 0.8078385, -0.6972822, 1, 1, 1, 1, 1,
-1.17391, 1.37679, 0.6592308, 1, 1, 1, 1, 1,
-1.170932, 1.81839, -0.6501073, 1, 1, 1, 1, 1,
-1.170394, -1.072973, -2.599501, 1, 1, 1, 1, 1,
-1.169838, 0.6246299, 0.159421, 1, 1, 1, 1, 1,
-1.169459, -0.7933101, -2.445608, 1, 1, 1, 1, 1,
-1.168121, 1.508052, 0.6294509, 1, 1, 1, 1, 1,
-1.165875, -1.487397, -3.09983, 1, 1, 1, 1, 1,
-1.159021, 1.430288, -1.278215, 1, 1, 1, 1, 1,
-1.158448, -0.7444713, -1.175007, 1, 1, 1, 1, 1,
-1.157056, -2.340669, -2.3209, 1, 1, 1, 1, 1,
-1.149871, 1.091655, -1.664865, 0, 0, 1, 1, 1,
-1.149691, -0.2594174, -0.6896512, 1, 0, 0, 1, 1,
-1.142856, 0.4584755, -1.529112, 1, 0, 0, 1, 1,
-1.140254, 2.045764, -0.871219, 1, 0, 0, 1, 1,
-1.139301, 2.040633, -1.225462, 1, 0, 0, 1, 1,
-1.132446, -1.305182, -2.655723, 1, 0, 0, 1, 1,
-1.12373, 0.7639978, -1.55708, 0, 0, 0, 1, 1,
-1.122053, -0.4405049, -2.773627, 0, 0, 0, 1, 1,
-1.119201, 0.9379604, -1.573429, 0, 0, 0, 1, 1,
-1.114918, -0.893427, -2.522855, 0, 0, 0, 1, 1,
-1.112979, 0.8217657, -0.9107032, 0, 0, 0, 1, 1,
-1.108813, -0.5266178, -1.23685, 0, 0, 0, 1, 1,
-1.105823, 1.914722, 0.9567254, 0, 0, 0, 1, 1,
-1.093932, -1.743943, -2.694, 1, 1, 1, 1, 1,
-1.093015, 0.7792214, 0.1645312, 1, 1, 1, 1, 1,
-1.092159, -0.04747456, -0.9589412, 1, 1, 1, 1, 1,
-1.088545, -0.1059286, -1.398629, 1, 1, 1, 1, 1,
-1.082648, 0.6772678, -1.118916, 1, 1, 1, 1, 1,
-1.082298, -0.4893358, 0.3495717, 1, 1, 1, 1, 1,
-1.078176, -0.8829265, -1.73636, 1, 1, 1, 1, 1,
-1.069256, -0.7458968, -3.444751, 1, 1, 1, 1, 1,
-1.066572, -0.5121799, -0.1537137, 1, 1, 1, 1, 1,
-1.062679, 1.518789, 0.1902045, 1, 1, 1, 1, 1,
-1.059278, 0.3727848, -0.5455825, 1, 1, 1, 1, 1,
-1.048099, -1.060243, -2.467808, 1, 1, 1, 1, 1,
-1.047095, 0.5142702, -2.405388, 1, 1, 1, 1, 1,
-1.043696, 0.1934662, -2.604801, 1, 1, 1, 1, 1,
-1.042667, 0.2845595, -1.005361, 1, 1, 1, 1, 1,
-1.038363, -2.197296, -3.05384, 0, 0, 1, 1, 1,
-1.035137, 0.9878989, -1.65808, 1, 0, 0, 1, 1,
-1.029136, -0.7811689, -2.032042, 1, 0, 0, 1, 1,
-1.018518, 0.505061, -3.776431, 1, 0, 0, 1, 1,
-1.017355, -1.550369, -3.063445, 1, 0, 0, 1, 1,
-1.017109, -0.2718162, -3.494995, 1, 0, 0, 1, 1,
-1.016856, 2.558493, -0.861927, 0, 0, 0, 1, 1,
-1.016093, -0.02810428, -1.323363, 0, 0, 0, 1, 1,
-1.015208, -0.8312862, -2.197724, 0, 0, 0, 1, 1,
-1.000555, -0.7825245, -1.789935, 0, 0, 0, 1, 1,
-0.9995347, -0.04668408, -2.849835, 0, 0, 0, 1, 1,
-0.9992905, 0.5058546, -0.7626603, 0, 0, 0, 1, 1,
-0.9859315, -0.3072584, -2.711058, 0, 0, 0, 1, 1,
-0.9758071, -0.4415945, -2.897027, 1, 1, 1, 1, 1,
-0.969982, 0.08331243, -0.9758061, 1, 1, 1, 1, 1,
-0.9660532, 0.9856236, -0.7285389, 1, 1, 1, 1, 1,
-0.9656765, -2.036361, -1.785442, 1, 1, 1, 1, 1,
-0.9639522, 1.553555, -0.3882539, 1, 1, 1, 1, 1,
-0.9614206, -0.01327161, -0.8999398, 1, 1, 1, 1, 1,
-0.9574758, 1.608252, -2.441936, 1, 1, 1, 1, 1,
-0.9561757, -1.190675, -1.613962, 1, 1, 1, 1, 1,
-0.9465247, 0.1008309, -0.8833804, 1, 1, 1, 1, 1,
-0.9357266, 1.041334, -0.1164844, 1, 1, 1, 1, 1,
-0.9342699, 0.2428332, -0.5514196, 1, 1, 1, 1, 1,
-0.928617, 1.180807, -1.215482, 1, 1, 1, 1, 1,
-0.9193342, 0.8541716, -1.259467, 1, 1, 1, 1, 1,
-0.9128857, -0.9568315, -2.288568, 1, 1, 1, 1, 1,
-0.9096996, 0.5003585, -1.340471, 1, 1, 1, 1, 1,
-0.9052555, -2.039854, -3.067804, 0, 0, 1, 1, 1,
-0.9027717, -0.09214789, -1.058183, 1, 0, 0, 1, 1,
-0.8974404, 2.048755, 0.5237346, 1, 0, 0, 1, 1,
-0.8952554, 1.650645, -0.1658123, 1, 0, 0, 1, 1,
-0.8929992, -0.1594009, -0.9495493, 1, 0, 0, 1, 1,
-0.8923936, -1.964069, -1.782911, 1, 0, 0, 1, 1,
-0.8891553, 0.5167046, -1.598611, 0, 0, 0, 1, 1,
-0.8881952, -0.1829237, -0.6368623, 0, 0, 0, 1, 1,
-0.857168, -0.7462742, -2.984412, 0, 0, 0, 1, 1,
-0.8567556, -1.886824, -3.037406, 0, 0, 0, 1, 1,
-0.8556718, 1.106445, -0.2239659, 0, 0, 0, 1, 1,
-0.853932, -0.2079445, -1.825381, 0, 0, 0, 1, 1,
-0.8539171, -0.5302644, -3.563669, 0, 0, 0, 1, 1,
-0.8538212, -1.615027, -2.03482, 1, 1, 1, 1, 1,
-0.8512775, 0.1639834, -1.894857, 1, 1, 1, 1, 1,
-0.8479721, 1.04177, -2.106954, 1, 1, 1, 1, 1,
-0.8461276, -2.262373, -2.208023, 1, 1, 1, 1, 1,
-0.8447057, 0.5148737, -1.968288, 1, 1, 1, 1, 1,
-0.8385789, 2.166522, 1.46124, 1, 1, 1, 1, 1,
-0.837231, -2.137334, -4.094781, 1, 1, 1, 1, 1,
-0.8368334, 1.692774, 0.2347293, 1, 1, 1, 1, 1,
-0.8359474, 1.034607, -1.140431, 1, 1, 1, 1, 1,
-0.830484, -1.202659, -2.940225, 1, 1, 1, 1, 1,
-0.828292, -1.134141, -1.836735, 1, 1, 1, 1, 1,
-0.8264086, -0.9815879, -0.8883371, 1, 1, 1, 1, 1,
-0.8245969, -0.3273397, -2.237577, 1, 1, 1, 1, 1,
-0.8202326, 1.475083, -0.8918151, 1, 1, 1, 1, 1,
-0.8168154, -0.003161734, -2.184816, 1, 1, 1, 1, 1,
-0.8161269, -0.5168197, 0.08633876, 0, 0, 1, 1, 1,
-0.8147278, 0.1115603, -1.915975, 1, 0, 0, 1, 1,
-0.8135915, -0.2824964, -1.699544, 1, 0, 0, 1, 1,
-0.8095442, 0.6001946, -2.113001, 1, 0, 0, 1, 1,
-0.8093899, -1.267754, -1.97779, 1, 0, 0, 1, 1,
-0.80827, 0.1510607, -0.8591695, 1, 0, 0, 1, 1,
-0.8000407, -0.7427322, -2.132338, 0, 0, 0, 1, 1,
-0.7964661, -1.194958, -3.863269, 0, 0, 0, 1, 1,
-0.79074, -1.553826, -1.782326, 0, 0, 0, 1, 1,
-0.7892197, -1.077555, -4.395014, 0, 0, 0, 1, 1,
-0.7887518, -1.43941, -2.316484, 0, 0, 0, 1, 1,
-0.7871141, 0.6238642, 0.7361487, 0, 0, 0, 1, 1,
-0.7859049, 0.2924891, -1.849899, 0, 0, 0, 1, 1,
-0.7851489, 0.4631588, -1.60495, 1, 1, 1, 1, 1,
-0.784582, -0.8901334, -0.7621048, 1, 1, 1, 1, 1,
-0.7831246, 1.051315, -2.324571, 1, 1, 1, 1, 1,
-0.7756371, -0.2986335, -1.064629, 1, 1, 1, 1, 1,
-0.7745975, -0.3451072, -1.880357, 1, 1, 1, 1, 1,
-0.7718293, -0.8008046, -2.21259, 1, 1, 1, 1, 1,
-0.7692556, -0.09312344, -1.392056, 1, 1, 1, 1, 1,
-0.7677138, 0.6480063, -1.704253, 1, 1, 1, 1, 1,
-0.7636728, 0.2176602, -2.144557, 1, 1, 1, 1, 1,
-0.7625389, -1.381903, -3.972778, 1, 1, 1, 1, 1,
-0.7605758, -1.735945, -2.746543, 1, 1, 1, 1, 1,
-0.7564803, 0.4305192, -1.247167, 1, 1, 1, 1, 1,
-0.7532516, -0.5003393, -1.353035, 1, 1, 1, 1, 1,
-0.7465988, -0.07964901, -2.69668, 1, 1, 1, 1, 1,
-0.7450646, 0.8323177, 0.1511045, 1, 1, 1, 1, 1,
-0.7326608, -0.8050748, 0.3002789, 0, 0, 1, 1, 1,
-0.7271003, -0.5614163, -0.8686439, 1, 0, 0, 1, 1,
-0.7213101, -0.1769504, -0.787975, 1, 0, 0, 1, 1,
-0.7182819, -1.179515, -3.855426, 1, 0, 0, 1, 1,
-0.7081683, 0.03359398, -1.344551, 1, 0, 0, 1, 1,
-0.7076302, -0.1274077, -0.6090765, 1, 0, 0, 1, 1,
-0.7060652, -0.8373901, -2.885323, 0, 0, 0, 1, 1,
-0.7046668, 0.4085925, -1.129092, 0, 0, 0, 1, 1,
-0.7007697, 0.4945226, -1.345932, 0, 0, 0, 1, 1,
-0.6957539, -0.7469703, -2.052123, 0, 0, 0, 1, 1,
-0.6923046, -2.049313, -2.221121, 0, 0, 0, 1, 1,
-0.6904473, 0.4855003, -0.5725418, 0, 0, 0, 1, 1,
-0.6867546, -0.8804009, -3.733647, 0, 0, 0, 1, 1,
-0.6862257, 0.8370732, -1.375902, 1, 1, 1, 1, 1,
-0.6850159, -1.091577, -3.753733, 1, 1, 1, 1, 1,
-0.6831141, -0.6894118, -1.825737, 1, 1, 1, 1, 1,
-0.6810924, 0.7494482, 1.06567, 1, 1, 1, 1, 1,
-0.6795219, -0.6015564, -3.580327, 1, 1, 1, 1, 1,
-0.6748279, 0.8987834, -0.7045215, 1, 1, 1, 1, 1,
-0.6678699, 1.295965, -0.4977956, 1, 1, 1, 1, 1,
-0.6678561, -0.8563856, -1.456528, 1, 1, 1, 1, 1,
-0.6660571, -0.9713281, -2.298971, 1, 1, 1, 1, 1,
-0.654458, 0.2394426, -1.387305, 1, 1, 1, 1, 1,
-0.6526365, -0.3663164, -1.096266, 1, 1, 1, 1, 1,
-0.6462066, 0.04291165, -2.068535, 1, 1, 1, 1, 1,
-0.6444005, 2.693327, -0.4388597, 1, 1, 1, 1, 1,
-0.6408724, 0.8748602, 0.6075993, 1, 1, 1, 1, 1,
-0.6388872, 0.5565521, 0.5875335, 1, 1, 1, 1, 1,
-0.6367723, 0.4752539, 0.1072681, 0, 0, 1, 1, 1,
-0.6306859, -0.1156878, -0.3448264, 1, 0, 0, 1, 1,
-0.6296926, 1.180342, 0.2407368, 1, 0, 0, 1, 1,
-0.6272942, -0.1128925, -0.2085257, 1, 0, 0, 1, 1,
-0.6234311, -0.8411284, -0.8639753, 1, 0, 0, 1, 1,
-0.6114912, 0.1180032, -1.768723, 1, 0, 0, 1, 1,
-0.6042162, -0.7279257, -1.990373, 0, 0, 0, 1, 1,
-0.6025004, -0.6331255, -2.157026, 0, 0, 0, 1, 1,
-0.5992803, -0.081217, -2.272359, 0, 0, 0, 1, 1,
-0.5954975, -0.4446273, -2.914735, 0, 0, 0, 1, 1,
-0.5926069, 1.119321, -1.288674, 0, 0, 0, 1, 1,
-0.5894995, -1.182109, -3.706861, 0, 0, 0, 1, 1,
-0.5868942, -2.100707, -2.052169, 0, 0, 0, 1, 1,
-0.5854906, 0.4894445, -1.417719, 1, 1, 1, 1, 1,
-0.5853727, -0.5672094, -2.041582, 1, 1, 1, 1, 1,
-0.5832932, 2.364105, -0.426578, 1, 1, 1, 1, 1,
-0.580379, 0.3887876, 1.1336, 1, 1, 1, 1, 1,
-0.5782042, 0.6379883, 0.07686565, 1, 1, 1, 1, 1,
-0.576661, 0.09763096, -0.6555066, 1, 1, 1, 1, 1,
-0.5766505, -0.9733894, -2.311779, 1, 1, 1, 1, 1,
-0.5737235, -0.6823825, -3.447763, 1, 1, 1, 1, 1,
-0.5733326, 0.2584245, -2.407591, 1, 1, 1, 1, 1,
-0.5689467, 0.06392773, -1.428771, 1, 1, 1, 1, 1,
-0.565549, -0.1187246, -1.761648, 1, 1, 1, 1, 1,
-0.5581762, -0.01208131, -2.187384, 1, 1, 1, 1, 1,
-0.5566465, -0.3148771, -2.122463, 1, 1, 1, 1, 1,
-0.5554135, -1.643252, -2.544931, 1, 1, 1, 1, 1,
-0.5552933, 0.8779472, -0.2603254, 1, 1, 1, 1, 1,
-0.5537146, 0.1196706, -1.460212, 0, 0, 1, 1, 1,
-0.549987, 1.701446, -0.1014559, 1, 0, 0, 1, 1,
-0.5491533, 0.5095115, -1.356743, 1, 0, 0, 1, 1,
-0.5444955, -1.0851, -2.983654, 1, 0, 0, 1, 1,
-0.5410993, -1.334171, -4.379578, 1, 0, 0, 1, 1,
-0.5409598, 0.8478367, 1.027056, 1, 0, 0, 1, 1,
-0.5373137, -0.6644847, -3.950304, 0, 0, 0, 1, 1,
-0.5362093, -0.1396967, -1.016198, 0, 0, 0, 1, 1,
-0.5310143, -1.380535, -2.237469, 0, 0, 0, 1, 1,
-0.5242059, -0.4190364, -2.159177, 0, 0, 0, 1, 1,
-0.5236277, 0.4817649, -1.432257, 0, 0, 0, 1, 1,
-0.5233153, -0.4564304, -4.325958, 0, 0, 0, 1, 1,
-0.5217086, -2.508382, -2.046892, 0, 0, 0, 1, 1,
-0.5164344, 0.7490766, -1.05869, 1, 1, 1, 1, 1,
-0.5160026, -0.9423268, -2.850551, 1, 1, 1, 1, 1,
-0.5071511, 2.015325, 0.1923093, 1, 1, 1, 1, 1,
-0.5028383, 0.5933974, -1.426769, 1, 1, 1, 1, 1,
-0.502552, -0.2324683, -0.9600672, 1, 1, 1, 1, 1,
-0.4986635, -1.327617, -4.198298, 1, 1, 1, 1, 1,
-0.4968877, 0.240932, -0.03668447, 1, 1, 1, 1, 1,
-0.4966495, -0.5769659, -2.118539, 1, 1, 1, 1, 1,
-0.495547, -0.3493069, -0.8570516, 1, 1, 1, 1, 1,
-0.4952742, 0.05531481, -2.48581, 1, 1, 1, 1, 1,
-0.4931987, -1.314359, -2.957329, 1, 1, 1, 1, 1,
-0.4905373, 0.5136508, -1.59379, 1, 1, 1, 1, 1,
-0.487825, -0.519909, -1.719319, 1, 1, 1, 1, 1,
-0.4875001, 0.2890458, -2.083349, 1, 1, 1, 1, 1,
-0.4872302, -0.2759247, -2.73415, 1, 1, 1, 1, 1,
-0.4860204, -0.08415501, -2.876978, 0, 0, 1, 1, 1,
-0.484744, 1.867593, 0.1785848, 1, 0, 0, 1, 1,
-0.4754498, 0.936952, -0.8161457, 1, 0, 0, 1, 1,
-0.4752815, -0.3614564, -3.553347, 1, 0, 0, 1, 1,
-0.4740239, 0.9286062, 0.01718039, 1, 0, 0, 1, 1,
-0.4737565, 0.2704332, -2.204851, 1, 0, 0, 1, 1,
-0.4716563, -0.0715118, -1.030921, 0, 0, 0, 1, 1,
-0.4614196, -0.1093369, -1.086915, 0, 0, 0, 1, 1,
-0.4610106, 0.1514738, -1.054502, 0, 0, 0, 1, 1,
-0.4558782, 2.593597, -1.839668, 0, 0, 0, 1, 1,
-0.4522203, 0.3438085, -2.107398, 0, 0, 0, 1, 1,
-0.4442108, -1.285735, -2.618126, 0, 0, 0, 1, 1,
-0.4432475, -0.7599756, -1.738043, 0, 0, 0, 1, 1,
-0.442543, 1.697277, -1.437039, 1, 1, 1, 1, 1,
-0.4402975, 0.7066329, 0.4269423, 1, 1, 1, 1, 1,
-0.4389512, -0.02864452, -0.5058829, 1, 1, 1, 1, 1,
-0.4311402, 1.175986, -1.563358, 1, 1, 1, 1, 1,
-0.4299778, 2.116943, -1.632564, 1, 1, 1, 1, 1,
-0.4294452, 1.409477, 0.8230098, 1, 1, 1, 1, 1,
-0.4277968, -1.123369, -3.358172, 1, 1, 1, 1, 1,
-0.4247484, -0.2738887, -2.27703, 1, 1, 1, 1, 1,
-0.4234093, -0.1310913, -3.172857, 1, 1, 1, 1, 1,
-0.4233414, -0.895045, -3.14649, 1, 1, 1, 1, 1,
-0.4210442, -0.5797718, -3.026793, 1, 1, 1, 1, 1,
-0.418756, 0.6628056, -0.6951768, 1, 1, 1, 1, 1,
-0.4187382, -1.130781, -2.682626, 1, 1, 1, 1, 1,
-0.414134, 0.6990343, -0.5887358, 1, 1, 1, 1, 1,
-0.4125287, -0.6071993, -1.835265, 1, 1, 1, 1, 1,
-0.4089963, 0.3350461, 0.9451942, 0, 0, 1, 1, 1,
-0.4075437, -1.59087, -2.491219, 1, 0, 0, 1, 1,
-0.4066573, -0.2045616, -3.387831, 1, 0, 0, 1, 1,
-0.4062243, 0.5687159, -1.367364, 1, 0, 0, 1, 1,
-0.4049041, -1.036965, -2.120088, 1, 0, 0, 1, 1,
-0.4010113, -1.023073, -2.77442, 1, 0, 0, 1, 1,
-0.3996314, -1.132822, -3.572851, 0, 0, 0, 1, 1,
-0.3980457, 0.02206322, -0.6009982, 0, 0, 0, 1, 1,
-0.3970111, 1.128744, -1.519051, 0, 0, 0, 1, 1,
-0.3961116, -0.4432873, -1.695279, 0, 0, 0, 1, 1,
-0.3939412, 0.3647487, -1.262892, 0, 0, 0, 1, 1,
-0.3923841, 0.5989448, -1.252244, 0, 0, 0, 1, 1,
-0.3910665, -1.282995, -1.877864, 0, 0, 0, 1, 1,
-0.3862285, 0.08820815, 0.1736502, 1, 1, 1, 1, 1,
-0.3856433, -0.8157931, -2.669829, 1, 1, 1, 1, 1,
-0.3761173, 0.6802298, -0.5432856, 1, 1, 1, 1, 1,
-0.3737806, -1.149079, -2.067476, 1, 1, 1, 1, 1,
-0.3724079, 0.5908171, -1.046765, 1, 1, 1, 1, 1,
-0.3715384, -0.2940601, -0.5843422, 1, 1, 1, 1, 1,
-0.3677729, -1.434611, -2.695117, 1, 1, 1, 1, 1,
-0.3672834, 1.214942, -1.04898, 1, 1, 1, 1, 1,
-0.36533, 0.7241457, -0.3452525, 1, 1, 1, 1, 1,
-0.3650142, 0.9795178, -2.183022, 1, 1, 1, 1, 1,
-0.3611227, -1.304978, -3.881804, 1, 1, 1, 1, 1,
-0.360616, -0.5271628, -2.966735, 1, 1, 1, 1, 1,
-0.3600925, 1.406882, -0.01900644, 1, 1, 1, 1, 1,
-0.3569387, -1.181044, -1.759034, 1, 1, 1, 1, 1,
-0.3559193, -1.162996, -2.711593, 1, 1, 1, 1, 1,
-0.3537408, -1.669186, -2.183629, 0, 0, 1, 1, 1,
-0.3510219, 0.3381422, -0.9578034, 1, 0, 0, 1, 1,
-0.3477214, -1.04857, -4.489326, 1, 0, 0, 1, 1,
-0.3469861, 0.8054177, -0.2742125, 1, 0, 0, 1, 1,
-0.3405595, 0.8011608, 0.1544515, 1, 0, 0, 1, 1,
-0.3365704, 1.175162, -1.623724, 1, 0, 0, 1, 1,
-0.3358658, -1.134899, -2.433523, 0, 0, 0, 1, 1,
-0.3358391, 0.4301942, 0.2762437, 0, 0, 0, 1, 1,
-0.3335245, 0.1098488, -1.040128, 0, 0, 0, 1, 1,
-0.3321992, 1.750202, -0.3215782, 0, 0, 0, 1, 1,
-0.3296459, -0.30321, -2.68054, 0, 0, 0, 1, 1,
-0.3200291, 0.5726824, 0.3135055, 0, 0, 0, 1, 1,
-0.3169735, -0.967866, -1.020365, 0, 0, 0, 1, 1,
-0.3151045, -0.6611096, -0.8706886, 1, 1, 1, 1, 1,
-0.314624, -1.137226, -1.787534, 1, 1, 1, 1, 1,
-0.3124765, 0.9677402, -1.330995, 1, 1, 1, 1, 1,
-0.3118139, 0.4780374, -0.0448375, 1, 1, 1, 1, 1,
-0.3100905, -0.5476024, -2.083511, 1, 1, 1, 1, 1,
-0.3092877, 2.302966, 0.143468, 1, 1, 1, 1, 1,
-0.3090104, 0.2846472, 1.944503, 1, 1, 1, 1, 1,
-0.3068859, 1.234202, -0.3504929, 1, 1, 1, 1, 1,
-0.3046455, 1.152113, -1.255227, 1, 1, 1, 1, 1,
-0.3039775, 0.139264, -1.912247, 1, 1, 1, 1, 1,
-0.3034661, -0.539755, -4.090423, 1, 1, 1, 1, 1,
-0.3031294, 0.8548495, -0.3782999, 1, 1, 1, 1, 1,
-0.3031118, -0.7290079, -1.717537, 1, 1, 1, 1, 1,
-0.2964746, 0.7842788, -1.108517, 1, 1, 1, 1, 1,
-0.2935734, 1.352451, -0.9984428, 1, 1, 1, 1, 1,
-0.2924233, -0.4716123, -2.253967, 0, 0, 1, 1, 1,
-0.2902541, -0.7420951, -4.090274, 1, 0, 0, 1, 1,
-0.2894315, -0.2749222, -2.488523, 1, 0, 0, 1, 1,
-0.2893461, -0.9577318, -1.504208, 1, 0, 0, 1, 1,
-0.2888456, 0.4717603, 0.6233534, 1, 0, 0, 1, 1,
-0.2849731, -0.1925624, -1.971383, 1, 0, 0, 1, 1,
-0.2817334, -0.197068, -2.867902, 0, 0, 0, 1, 1,
-0.2797707, -0.01359811, -1.442734, 0, 0, 0, 1, 1,
-0.2797577, -0.5674706, -3.091168, 0, 0, 0, 1, 1,
-0.279696, -0.5638982, -2.67724, 0, 0, 0, 1, 1,
-0.278203, -0.4577601, -1.715082, 0, 0, 0, 1, 1,
-0.2781142, 0.1704456, -0.7043191, 0, 0, 0, 1, 1,
-0.2665867, 0.3280071, 0.7908002, 0, 0, 0, 1, 1,
-0.2664948, -1.708995, -3.590017, 1, 1, 1, 1, 1,
-0.2662772, 0.919503, -0.911907, 1, 1, 1, 1, 1,
-0.2612932, -2.464068, -2.068004, 1, 1, 1, 1, 1,
-0.2513125, -0.898386, -3.978885, 1, 1, 1, 1, 1,
-0.2509182, -0.5780913, -1.489643, 1, 1, 1, 1, 1,
-0.2505586, -0.6698389, -1.058102, 1, 1, 1, 1, 1,
-0.2485859, 0.9197088, 1.083708, 1, 1, 1, 1, 1,
-0.2461684, -1.296793, -2.598701, 1, 1, 1, 1, 1,
-0.2461102, 0.2664934, -1.501819, 1, 1, 1, 1, 1,
-0.2447152, -1.003322, -2.041265, 1, 1, 1, 1, 1,
-0.242197, -0.2961381, -2.577759, 1, 1, 1, 1, 1,
-0.2412379, 0.6501319, 0.5801046, 1, 1, 1, 1, 1,
-0.2345335, -0.6604771, -1.70211, 1, 1, 1, 1, 1,
-0.2325689, 0.3726936, -0.3972287, 1, 1, 1, 1, 1,
-0.2299255, -0.1367657, -2.596015, 1, 1, 1, 1, 1,
-0.2275586, -1.18218, -2.594286, 0, 0, 1, 1, 1,
-0.2274151, 1.478057, 0.4965895, 1, 0, 0, 1, 1,
-0.2270373, 1.130484, -0.4097344, 1, 0, 0, 1, 1,
-0.2260581, -0.4282117, -1.748944, 1, 0, 0, 1, 1,
-0.225356, 0.6434816, -0.4795977, 1, 0, 0, 1, 1,
-0.2217676, -0.6216469, -1.784993, 1, 0, 0, 1, 1,
-0.2159826, -0.5207474, -3.002682, 0, 0, 0, 1, 1,
-0.2159391, 1.846599, -0.7061393, 0, 0, 0, 1, 1,
-0.2128718, 1.224284, 0.3949636, 0, 0, 0, 1, 1,
-0.2121246, 1.671389, -0.1366013, 0, 0, 0, 1, 1,
-0.2110517, 0.2635164, -1.428705, 0, 0, 0, 1, 1,
-0.2077073, -0.6383705, -1.894248, 0, 0, 0, 1, 1,
-0.2055847, -0.2116645, -1.307885, 0, 0, 0, 1, 1,
-0.2029867, -1.319259, -2.759532, 1, 1, 1, 1, 1,
-0.2005157, -0.576228, -2.593759, 1, 1, 1, 1, 1,
-0.1926091, -0.4389856, -4.392172, 1, 1, 1, 1, 1,
-0.1906563, 0.849378, 0.2915604, 1, 1, 1, 1, 1,
-0.1888971, 0.4193174, -1.958282, 1, 1, 1, 1, 1,
-0.1879033, -0.6994368, -4.182126, 1, 1, 1, 1, 1,
-0.1854005, -0.3077416, -2.055729, 1, 1, 1, 1, 1,
-0.1844193, -1.955628, -3.147442, 1, 1, 1, 1, 1,
-0.1828258, -0.3748515, -3.112381, 1, 1, 1, 1, 1,
-0.1821355, -0.4469957, -4.464958, 1, 1, 1, 1, 1,
-0.1788148, -0.10895, -0.7715268, 1, 1, 1, 1, 1,
-0.1718929, -1.305578, -3.084043, 1, 1, 1, 1, 1,
-0.1686416, 0.8184663, 1.046941, 1, 1, 1, 1, 1,
-0.168454, -0.2367187, -1.907802, 1, 1, 1, 1, 1,
-0.1670009, 0.1156382, -1.795022, 1, 1, 1, 1, 1,
-0.16537, 0.6831419, -0.2198907, 0, 0, 1, 1, 1,
-0.1644483, 1.412503, 1.000654, 1, 0, 0, 1, 1,
-0.1623959, -0.7735847, -5.158154, 1, 0, 0, 1, 1,
-0.1610603, -1.181441, -3.767472, 1, 0, 0, 1, 1,
-0.1589769, 1.864508, -0.7986463, 1, 0, 0, 1, 1,
-0.1580511, -0.5245081, -2.906009, 1, 0, 0, 1, 1,
-0.1561136, -0.7712337, -3.291794, 0, 0, 0, 1, 1,
-0.1553504, -0.4810404, -1.794673, 0, 0, 0, 1, 1,
-0.1534382, 3.303815, -0.7470364, 0, 0, 0, 1, 1,
-0.1515373, 0.4103299, -0.08460006, 0, 0, 0, 1, 1,
-0.1480345, -0.2043726, -0.860059, 0, 0, 0, 1, 1,
-0.147155, 0.9263424, -0.1616711, 0, 0, 0, 1, 1,
-0.1470694, -1.26488, -2.081896, 0, 0, 0, 1, 1,
-0.1464505, -0.6552575, -3.940853, 1, 1, 1, 1, 1,
-0.1430531, -0.7915578, -1.600245, 1, 1, 1, 1, 1,
-0.1372189, 0.9730201, -0.8644851, 1, 1, 1, 1, 1,
-0.1346199, 0.4885838, -0.0857828, 1, 1, 1, 1, 1,
-0.1333867, -0.7159172, -3.14822, 1, 1, 1, 1, 1,
-0.1328966, 0.05241467, -0.9753811, 1, 1, 1, 1, 1,
-0.1323153, 2.246442, -0.6674804, 1, 1, 1, 1, 1,
-0.1312216, -0.6845838, -4.188313, 1, 1, 1, 1, 1,
-0.1271241, 0.9347202, -0.6183725, 1, 1, 1, 1, 1,
-0.126026, 0.2873387, 0.440956, 1, 1, 1, 1, 1,
-0.1239566, 0.7484114, -0.149221, 1, 1, 1, 1, 1,
-0.1228194, -1.243415, -3.062012, 1, 1, 1, 1, 1,
-0.1217978, -0.3045844, -3.426967, 1, 1, 1, 1, 1,
-0.1201248, -0.5894105, -2.591315, 1, 1, 1, 1, 1,
-0.1186777, -1.695479, -3.59864, 1, 1, 1, 1, 1,
-0.1129804, 1.13306, 0.07965925, 0, 0, 1, 1, 1,
-0.1103558, 1.454295, -1.536791, 1, 0, 0, 1, 1,
-0.1093882, 0.4836995, 0.2938311, 1, 0, 0, 1, 1,
-0.1058217, 1.187914, 2.001548, 1, 0, 0, 1, 1,
-0.1051033, -0.8397571, -3.0368, 1, 0, 0, 1, 1,
-0.1037051, 0.6672921, 0.743187, 1, 0, 0, 1, 1,
-0.100993, -0.5579369, -1.489493, 0, 0, 0, 1, 1,
-0.09917004, 1.106157, -1.231505, 0, 0, 0, 1, 1,
-0.09429505, -0.9294806, -1.341405, 0, 0, 0, 1, 1,
-0.09327711, -1.03645, -2.343903, 0, 0, 0, 1, 1,
-0.08746916, -1.674523, -0.2673525, 0, 0, 0, 1, 1,
-0.08346812, -0.9819354, -2.848415, 0, 0, 0, 1, 1,
-0.08244673, 0.3875011, -1.769139, 0, 0, 0, 1, 1,
-0.08154257, -0.2168438, -3.291507, 1, 1, 1, 1, 1,
-0.07829582, 2.07764, 0.6555876, 1, 1, 1, 1, 1,
-0.07647371, 0.8021521, -0.2231129, 1, 1, 1, 1, 1,
-0.07491116, -0.09708455, -3.292886, 1, 1, 1, 1, 1,
-0.06736463, -0.527213, -1.606591, 1, 1, 1, 1, 1,
-0.06398336, 0.3246855, 0.890155, 1, 1, 1, 1, 1,
-0.06197253, 1.165905, -0.01181641, 1, 1, 1, 1, 1,
-0.05815526, -0.5253555, -4.068511, 1, 1, 1, 1, 1,
-0.05454936, -2.43649, -5.120236, 1, 1, 1, 1, 1,
-0.05111453, -1.66107, -2.876818, 1, 1, 1, 1, 1,
-0.04979326, 1.425949, 0.8940635, 1, 1, 1, 1, 1,
-0.04870855, -1.006285, -4.371568, 1, 1, 1, 1, 1,
-0.04864121, -0.7543375, -1.555253, 1, 1, 1, 1, 1,
-0.04697189, 1.467287, 2.119732, 1, 1, 1, 1, 1,
-0.039921, 0.2039255, 0.1582755, 1, 1, 1, 1, 1,
-0.03858146, 1.192865, 0.8991131, 0, 0, 1, 1, 1,
-0.03297259, 0.2164221, 0.2599113, 1, 0, 0, 1, 1,
-0.03146277, -1.189085, -3.378059, 1, 0, 0, 1, 1,
-0.02991556, 0.1442951, 0.7687498, 1, 0, 0, 1, 1,
-0.02982021, -0.611382, -3.658276, 1, 0, 0, 1, 1,
-0.02633652, 1.113558, -0.9848985, 1, 0, 0, 1, 1,
-0.02439278, 0.6961972, -0.2639672, 0, 0, 0, 1, 1,
-0.02151099, 0.60349, -1.14379, 0, 0, 0, 1, 1,
-0.01424944, 0.8842092, -0.8707464, 0, 0, 0, 1, 1,
-0.0132825, 0.7531384, -1.316824, 0, 0, 0, 1, 1,
-0.009189432, 1.424361, -0.4077796, 0, 0, 0, 1, 1,
-0.004609131, -1.006918, -4.159927, 0, 0, 0, 1, 1,
-0.002007596, 0.9534205, -0.5339942, 0, 0, 0, 1, 1,
0.003076194, -0.6565071, 3.943266, 1, 1, 1, 1, 1,
0.005838024, 1.723019, -0.3925017, 1, 1, 1, 1, 1,
0.007797708, 0.3170892, -0.1243465, 1, 1, 1, 1, 1,
0.01284382, -0.4421425, 3.962236, 1, 1, 1, 1, 1,
0.01504894, 0.3844061, 0.6233225, 1, 1, 1, 1, 1,
0.0158891, 1.010363, 1.22324, 1, 1, 1, 1, 1,
0.01756627, -1.131108, 4.970952, 1, 1, 1, 1, 1,
0.02074054, -0.3622351, 3.77656, 1, 1, 1, 1, 1,
0.02222168, 0.5136873, 1.038713, 1, 1, 1, 1, 1,
0.02418733, 1.309681, -0.9838355, 1, 1, 1, 1, 1,
0.02569339, -0.2100149, 4.544969, 1, 1, 1, 1, 1,
0.02911894, 0.6402769, 0.5918462, 1, 1, 1, 1, 1,
0.03519671, -0.07237396, 3.299247, 1, 1, 1, 1, 1,
0.03611525, 1.20406, 0.06602904, 1, 1, 1, 1, 1,
0.04121755, -0.8020229, 3.22111, 1, 1, 1, 1, 1,
0.04467686, 0.2543342, 1.180875, 0, 0, 1, 1, 1,
0.04988564, 0.9030703, -0.428299, 1, 0, 0, 1, 1,
0.05466206, 0.3433414, 0.6877432, 1, 0, 0, 1, 1,
0.06214962, -0.6679904, 3.661417, 1, 0, 0, 1, 1,
0.06220025, -0.01376303, 2.35259, 1, 0, 0, 1, 1,
0.06466936, 1.731407, 0.1785034, 1, 0, 0, 1, 1,
0.06519181, 2.36591, 1.6218, 0, 0, 0, 1, 1,
0.06821699, -1.471722, 2.14426, 0, 0, 0, 1, 1,
0.07513668, -0.8816315, 1.714355, 0, 0, 0, 1, 1,
0.07537078, 1.654017, -0.269629, 0, 0, 0, 1, 1,
0.08195052, 1.429243, 0.08154482, 0, 0, 0, 1, 1,
0.0823114, -1.972299, 1.341863, 0, 0, 0, 1, 1,
0.08572157, -0.002960495, -0.1385264, 0, 0, 0, 1, 1,
0.09075882, 0.8653331, -0.5117963, 1, 1, 1, 1, 1,
0.09171519, -1.626232, 4.182365, 1, 1, 1, 1, 1,
0.09424548, 0.06646827, 2.398428, 1, 1, 1, 1, 1,
0.09496877, 1.302287, -0.9940872, 1, 1, 1, 1, 1,
0.09546483, -2.237635, 5.535472, 1, 1, 1, 1, 1,
0.09620163, 0.2585205, 2.97989, 1, 1, 1, 1, 1,
0.09866553, 0.6143452, 1.069476, 1, 1, 1, 1, 1,
0.1039313, 1.746255, 0.05407185, 1, 1, 1, 1, 1,
0.1053285, -0.171047, 2.791427, 1, 1, 1, 1, 1,
0.1098992, -0.2795831, 2.217696, 1, 1, 1, 1, 1,
0.1100951, -1.689694, 0.5606509, 1, 1, 1, 1, 1,
0.1159279, -0.6052197, 3.922869, 1, 1, 1, 1, 1,
0.1160695, -0.2843508, 1.722176, 1, 1, 1, 1, 1,
0.1245541, -1.371566, 0.7789793, 1, 1, 1, 1, 1,
0.1288714, -0.008643016, 2.131828, 1, 1, 1, 1, 1,
0.1300135, 0.6499175, -0.1250623, 0, 0, 1, 1, 1,
0.1304819, -1.252525, 3.578177, 1, 0, 0, 1, 1,
0.1309966, 1.071695, 1.570488, 1, 0, 0, 1, 1,
0.1313211, 0.8951437, 0.7170984, 1, 0, 0, 1, 1,
0.1369408, -0.4328154, 4.450255, 1, 0, 0, 1, 1,
0.1370771, 1.590759, -0.5339167, 1, 0, 0, 1, 1,
0.1376029, 0.05727034, 2.426854, 0, 0, 0, 1, 1,
0.1377228, -0.7878062, 1.878399, 0, 0, 0, 1, 1,
0.1385005, 0.1335415, 1.970042, 0, 0, 0, 1, 1,
0.1396974, 0.6399496, -0.6991904, 0, 0, 0, 1, 1,
0.1407034, -0.5067198, 3.600643, 0, 0, 0, 1, 1,
0.1437069, 0.3461526, -0.06095146, 0, 0, 0, 1, 1,
0.1466577, 0.6421134, -0.05445914, 0, 0, 0, 1, 1,
0.1492617, -1.757397, 1.437226, 1, 1, 1, 1, 1,
0.1511912, -0.6795292, 3.260382, 1, 1, 1, 1, 1,
0.1516487, -0.05358844, 2.578874, 1, 1, 1, 1, 1,
0.1562732, -1.769571, 3.203845, 1, 1, 1, 1, 1,
0.158487, 0.2855814, 1.180809, 1, 1, 1, 1, 1,
0.1604352, 1.487946, -0.216294, 1, 1, 1, 1, 1,
0.1630989, 1.366312, -0.9004073, 1, 1, 1, 1, 1,
0.1657772, 1.131976, 0.01168422, 1, 1, 1, 1, 1,
0.1719407, -1.120255, 3.130651, 1, 1, 1, 1, 1,
0.1757476, -0.8465353, 4.268423, 1, 1, 1, 1, 1,
0.1762476, -0.4980887, 4.654629, 1, 1, 1, 1, 1,
0.1809993, -1.009328, 1.883069, 1, 1, 1, 1, 1,
0.1825535, -2.223486, 4.537925, 1, 1, 1, 1, 1,
0.186145, 1.385626, 1.013608, 1, 1, 1, 1, 1,
0.1887673, -1.628616, 3.287961, 1, 1, 1, 1, 1,
0.1908805, -1.740575, 5.085928, 0, 0, 1, 1, 1,
0.1943792, 0.2503401, 0.01083915, 1, 0, 0, 1, 1,
0.1955936, -1.295406, 3.019655, 1, 0, 0, 1, 1,
0.1956628, -0.8586072, 1.979362, 1, 0, 0, 1, 1,
0.1988871, -0.274965, 0.7429152, 1, 0, 0, 1, 1,
0.1996303, 1.039183, -0.8002557, 1, 0, 0, 1, 1,
0.205187, -1.412646, 2.555466, 0, 0, 0, 1, 1,
0.2058964, -0.9405464, 1.000706, 0, 0, 0, 1, 1,
0.2110159, -0.06696958, 1.00676, 0, 0, 0, 1, 1,
0.2135251, -1.382972, 3.985924, 0, 0, 0, 1, 1,
0.2135392, 0.6527212, -0.4812116, 0, 0, 0, 1, 1,
0.2232445, 0.1540816, 0.2786956, 0, 0, 0, 1, 1,
0.2318602, -1.026659, 3.455779, 0, 0, 0, 1, 1,
0.2326329, 2.029908, -0.3409589, 1, 1, 1, 1, 1,
0.2403723, 0.6813558, 0.6826474, 1, 1, 1, 1, 1,
0.2498542, 0.2450342, 1.502126, 1, 1, 1, 1, 1,
0.251412, 0.3713342, 0.3843572, 1, 1, 1, 1, 1,
0.2583863, -0.3418726, 2.433154, 1, 1, 1, 1, 1,
0.2589323, -1.416792, 5.5415, 1, 1, 1, 1, 1,
0.2619397, -0.154354, 1.974196, 1, 1, 1, 1, 1,
0.2701009, 1.340615, 0.4319741, 1, 1, 1, 1, 1,
0.2705483, -2.499524, 2.469588, 1, 1, 1, 1, 1,
0.2745735, 0.7794222, -0.2393528, 1, 1, 1, 1, 1,
0.2759817, 0.6934901, 0.9074636, 1, 1, 1, 1, 1,
0.2761016, -0.2804162, 1.444895, 1, 1, 1, 1, 1,
0.2762301, 0.2479146, 0.6392831, 1, 1, 1, 1, 1,
0.2783689, -0.112354, 2.323832, 1, 1, 1, 1, 1,
0.2829689, 0.409558, -0.03784491, 1, 1, 1, 1, 1,
0.2832216, -0.1184989, 1.127942, 0, 0, 1, 1, 1,
0.2877772, -0.2791264, 2.299952, 1, 0, 0, 1, 1,
0.2902982, -1.454845, 4.195549, 1, 0, 0, 1, 1,
0.2931239, -0.1177346, 1.118607, 1, 0, 0, 1, 1,
0.2931604, -1.560437, 0.08916605, 1, 0, 0, 1, 1,
0.2962851, 1.317511, 0.5335032, 1, 0, 0, 1, 1,
0.3015814, 0.811807, 0.3087172, 0, 0, 0, 1, 1,
0.308152, 0.4716424, 1.794927, 0, 0, 0, 1, 1,
0.3083945, -0.9360297, 2.776865, 0, 0, 0, 1, 1,
0.3093767, -0.6828936, 3.231605, 0, 0, 0, 1, 1,
0.3118329, -0.7265756, 4.810828, 0, 0, 0, 1, 1,
0.3134034, 0.1377084, 0.926214, 0, 0, 0, 1, 1,
0.3136629, 0.3655179, -0.07031025, 0, 0, 0, 1, 1,
0.3147493, -1.513294, 1.304137, 1, 1, 1, 1, 1,
0.3153617, 0.4412081, 1.547653, 1, 1, 1, 1, 1,
0.316236, -0.6246219, 1.814734, 1, 1, 1, 1, 1,
0.3194612, 0.3664281, 0.1244556, 1, 1, 1, 1, 1,
0.3244685, 1.70716, -0.2626954, 1, 1, 1, 1, 1,
0.328777, -1.096275, 2.020149, 1, 1, 1, 1, 1,
0.3311201, 0.1418705, 1.125986, 1, 1, 1, 1, 1,
0.3357537, -0.539836, 3.326708, 1, 1, 1, 1, 1,
0.3364745, -0.01956993, 1.673892, 1, 1, 1, 1, 1,
0.3371291, -0.8265924, 3.241871, 1, 1, 1, 1, 1,
0.3437844, 2.608298, -0.7132889, 1, 1, 1, 1, 1,
0.3549104, 0.7962011, -0.0003565204, 1, 1, 1, 1, 1,
0.3573931, 0.4551639, 1.774507, 1, 1, 1, 1, 1,
0.3695057, -1.240286, 3.317408, 1, 1, 1, 1, 1,
0.3707251, 0.6756159, 0.3329315, 1, 1, 1, 1, 1,
0.3760408, -0.6971475, 1.632453, 0, 0, 1, 1, 1,
0.3787652, 0.1771291, -0.4579746, 1, 0, 0, 1, 1,
0.3836828, 0.2152649, 1.682492, 1, 0, 0, 1, 1,
0.3849198, -0.1064218, 0.8259888, 1, 0, 0, 1, 1,
0.3867377, 0.02081404, 1.759515, 1, 0, 0, 1, 1,
0.3898534, -0.9370413, 1.58187, 1, 0, 0, 1, 1,
0.3921494, 0.6788079, 0.4742824, 0, 0, 0, 1, 1,
0.3927343, 0.3602782, 1.045974, 0, 0, 0, 1, 1,
0.3937355, -0.4116311, 3.591856, 0, 0, 0, 1, 1,
0.3937405, 0.02989589, 1.548749, 0, 0, 0, 1, 1,
0.4025097, 0.7840235, -0.4773616, 0, 0, 0, 1, 1,
0.402928, 0.7100503, 0.4309951, 0, 0, 0, 1, 1,
0.4040017, 1.668244, 0.9681865, 0, 0, 0, 1, 1,
0.4064541, 0.05611497, -0.2362854, 1, 1, 1, 1, 1,
0.4148193, 0.4975107, -0.4981698, 1, 1, 1, 1, 1,
0.4163525, 0.2782141, -0.8835654, 1, 1, 1, 1, 1,
0.4165333, 2.326981, 1.591806, 1, 1, 1, 1, 1,
0.41734, -0.751154, 1.737431, 1, 1, 1, 1, 1,
0.4195526, -0.3817987, 2.810851, 1, 1, 1, 1, 1,
0.4210287, 1.155608, -1.566825, 1, 1, 1, 1, 1,
0.4212682, -0.5439113, 1.029834, 1, 1, 1, 1, 1,
0.4234887, -0.0439726, 2.695479, 1, 1, 1, 1, 1,
0.4235635, 0.5432386, 1.67515, 1, 1, 1, 1, 1,
0.4249425, -0.8512626, 1.605565, 1, 1, 1, 1, 1,
0.4250605, -1.181169, 2.76329, 1, 1, 1, 1, 1,
0.4271929, 1.294565, -0.6162629, 1, 1, 1, 1, 1,
0.4346727, -0.5374981, 3.024989, 1, 1, 1, 1, 1,
0.434781, 1.72358, 0.05088464, 1, 1, 1, 1, 1,
0.4357475, -0.03585429, 1.439135, 0, 0, 1, 1, 1,
0.4405057, -0.05334838, 2.793894, 1, 0, 0, 1, 1,
0.4455098, 0.8993515, 0.4780892, 1, 0, 0, 1, 1,
0.4492333, 1.036912, 0.1460325, 1, 0, 0, 1, 1,
0.4510219, -0.1909362, 0.5633957, 1, 0, 0, 1, 1,
0.4604332, -0.3628527, 3.415619, 1, 0, 0, 1, 1,
0.4617223, -0.6442056, 2.741261, 0, 0, 0, 1, 1,
0.4634411, -0.3813317, 2.066245, 0, 0, 0, 1, 1,
0.4736218, 1.010778, -0.3146029, 0, 0, 0, 1, 1,
0.478186, -0.2845508, 2.207295, 0, 0, 0, 1, 1,
0.4827567, -0.8820899, 2.49047, 0, 0, 0, 1, 1,
0.4843178, 0.5984975, 1.574725, 0, 0, 0, 1, 1,
0.487864, 0.07573878, 2.440441, 0, 0, 0, 1, 1,
0.4926211, 0.9077973, 0.1549188, 1, 1, 1, 1, 1,
0.4944692, -0.0207347, 2.214379, 1, 1, 1, 1, 1,
0.4959765, 0.1655774, 0.8903123, 1, 1, 1, 1, 1,
0.4982519, 1.908256, -0.4275197, 1, 1, 1, 1, 1,
0.5037733, -0.154887, 3.031934, 1, 1, 1, 1, 1,
0.506409, -0.608452, 0.8751624, 1, 1, 1, 1, 1,
0.508028, 1.369672, 0.6561688, 1, 1, 1, 1, 1,
0.5106059, -1.449274, 2.366012, 1, 1, 1, 1, 1,
0.5114529, 0.430381, 1.259241, 1, 1, 1, 1, 1,
0.5116071, 1.176089, -0.1768306, 1, 1, 1, 1, 1,
0.5144423, 1.306365, 0.1105697, 1, 1, 1, 1, 1,
0.5182945, 1.346512, 1.48276, 1, 1, 1, 1, 1,
0.5186155, -0.214263, 0.7053373, 1, 1, 1, 1, 1,
0.5203187, -0.04905035, 1.41571, 1, 1, 1, 1, 1,
0.5252467, -1.396529, 1.497722, 1, 1, 1, 1, 1,
0.5286861, 1.411905, 1.432495, 0, 0, 1, 1, 1,
0.5288715, -0.1189574, 0.6411229, 1, 0, 0, 1, 1,
0.5295169, -1.606478, 4.603213, 1, 0, 0, 1, 1,
0.5305759, -0.1816048, 3.154709, 1, 0, 0, 1, 1,
0.5434814, -1.678236, 2.147324, 1, 0, 0, 1, 1,
0.5455109, 0.709219, 1.000202, 1, 0, 0, 1, 1,
0.5474893, -1.169342, 3.835298, 0, 0, 0, 1, 1,
0.5480395, -0.5393791, 2.133845, 0, 0, 0, 1, 1,
0.5549261, 0.8984443, 1.064242, 0, 0, 0, 1, 1,
0.5556172, -1.330416, 3.522764, 0, 0, 0, 1, 1,
0.556255, -0.0196211, 2.063995, 0, 0, 0, 1, 1,
0.5573215, -0.8398613, 2.260457, 0, 0, 0, 1, 1,
0.558701, 0.4725813, 1.34712, 0, 0, 0, 1, 1,
0.5616079, -0.1296031, 2.126949, 1, 1, 1, 1, 1,
0.5688683, -0.9492885, 1.763247, 1, 1, 1, 1, 1,
0.5711964, -0.7337182, 2.49425, 1, 1, 1, 1, 1,
0.572163, -0.7523109, 1.574372, 1, 1, 1, 1, 1,
0.5742106, 1.569843, 0.1368354, 1, 1, 1, 1, 1,
0.5753736, -0.5045325, 3.166384, 1, 1, 1, 1, 1,
0.5795395, 1.527933, -0.1729176, 1, 1, 1, 1, 1,
0.5799672, -1.848092, 3.318167, 1, 1, 1, 1, 1,
0.5824077, -0.1634658, 1.451347, 1, 1, 1, 1, 1,
0.5827724, -0.4252364, 0.7255625, 1, 1, 1, 1, 1,
0.5836948, 0.7053284, -1.827668, 1, 1, 1, 1, 1,
0.5877929, -0.005234453, 0.4462748, 1, 1, 1, 1, 1,
0.587815, 0.9092191, -0.5398404, 1, 1, 1, 1, 1,
0.6008143, 1.050897, 0.7623125, 1, 1, 1, 1, 1,
0.6044066, -0.1683892, 1.375527, 1, 1, 1, 1, 1,
0.6071686, -1.657189, 3.014604, 0, 0, 1, 1, 1,
0.6079229, -0.982153, 0.843025, 1, 0, 0, 1, 1,
0.6095954, 2.551022, -0.2299926, 1, 0, 0, 1, 1,
0.6132239, -0.3790294, 3.61027, 1, 0, 0, 1, 1,
0.6144298, 0.7271165, -0.13569, 1, 0, 0, 1, 1,
0.619723, -0.7686433, 4.304876, 1, 0, 0, 1, 1,
0.6219538, -0.703609, 2.043916, 0, 0, 0, 1, 1,
0.6320189, -1.240276, 1.92734, 0, 0, 0, 1, 1,
0.6369247, 0.5142571, 1.24904, 0, 0, 0, 1, 1,
0.6387494, 0.7242448, -1.174622, 0, 0, 0, 1, 1,
0.6396613, -0.05746313, 1.503042, 0, 0, 0, 1, 1,
0.6434346, 0.01352358, 1.513314, 0, 0, 0, 1, 1,
0.6440344, 0.2067866, 1.060815, 0, 0, 0, 1, 1,
0.6519445, -0.117575, 1.759498, 1, 1, 1, 1, 1,
0.6577386, -0.2159334, 2.808972, 1, 1, 1, 1, 1,
0.6601878, -1.902812, 1.842721, 1, 1, 1, 1, 1,
0.6623815, -0.7031032, 1.593841, 1, 1, 1, 1, 1,
0.6627195, -2.012417, 3.857537, 1, 1, 1, 1, 1,
0.6661094, 0.2313595, 1.614686, 1, 1, 1, 1, 1,
0.6669634, -0.2128802, 1.998598, 1, 1, 1, 1, 1,
0.6669962, -0.3844852, 3.699656, 1, 1, 1, 1, 1,
0.6671098, -1.164345, 3.016997, 1, 1, 1, 1, 1,
0.6698565, -0.3955646, 0.4874817, 1, 1, 1, 1, 1,
0.672546, 0.5325376, 1.23956, 1, 1, 1, 1, 1,
0.6736585, -0.3637662, 1.568526, 1, 1, 1, 1, 1,
0.6811815, 0.2034726, 1.360567, 1, 1, 1, 1, 1,
0.6812988, -1.162177, 1.670634, 1, 1, 1, 1, 1,
0.6816113, 1.718419, -0.1408016, 1, 1, 1, 1, 1,
0.6835557, -1.377333, 1.718442, 0, 0, 1, 1, 1,
0.6842789, 0.31727, 1.690174, 1, 0, 0, 1, 1,
0.6854992, 0.0939408, 0.5819519, 1, 0, 0, 1, 1,
0.6872431, -0.1756189, 2.433364, 1, 0, 0, 1, 1,
0.6889004, -0.710517, 2.376452, 1, 0, 0, 1, 1,
0.6923977, 0.2113288, 2.62405, 1, 0, 0, 1, 1,
0.6997465, -1.121743, 3.871521, 0, 0, 0, 1, 1,
0.7028766, -0.1760635, 1.705528, 0, 0, 0, 1, 1,
0.707414, 0.2044477, 0.637382, 0, 0, 0, 1, 1,
0.7094355, 1.041774, 1.879032, 0, 0, 0, 1, 1,
0.7265558, 0.7067311, 1.260515, 0, 0, 0, 1, 1,
0.73093, -0.4154744, 1.383855, 0, 0, 0, 1, 1,
0.7317676, -1.719882, 2.49418, 0, 0, 0, 1, 1,
0.7338841, 0.2713181, 0.341273, 1, 1, 1, 1, 1,
0.7388425, 0.008981048, 1.668429, 1, 1, 1, 1, 1,
0.7406187, 1.439535, 0.5807397, 1, 1, 1, 1, 1,
0.7427217, 1.719917, -0.6206542, 1, 1, 1, 1, 1,
0.7505332, -0.08040901, 3.726378, 1, 1, 1, 1, 1,
0.7543466, -0.8330494, 2.451151, 1, 1, 1, 1, 1,
0.7558709, -0.6587152, 3.072052, 1, 1, 1, 1, 1,
0.7586513, 0.5243796, 0.293995, 1, 1, 1, 1, 1,
0.7620595, 1.614885, -0.1140862, 1, 1, 1, 1, 1,
0.7630032, -1.129532, 2.442988, 1, 1, 1, 1, 1,
0.7649387, -0.6449441, 4.16964, 1, 1, 1, 1, 1,
0.765264, -1.247383, 3.207119, 1, 1, 1, 1, 1,
0.77175, 0.4056665, 2.264328, 1, 1, 1, 1, 1,
0.7730398, 0.1275338, 1.804285, 1, 1, 1, 1, 1,
0.7780786, -1.13581, 2.307053, 1, 1, 1, 1, 1,
0.7817771, 1.180906, -0.6838156, 0, 0, 1, 1, 1,
0.7821814, 1.322666, 1.606935, 1, 0, 0, 1, 1,
0.7824409, -1.110299, 3.728236, 1, 0, 0, 1, 1,
0.7866833, -0.2807784, 2.604498, 1, 0, 0, 1, 1,
0.788632, -0.7516078, 0.9464887, 1, 0, 0, 1, 1,
0.7911921, 0.1859824, 0.9934005, 1, 0, 0, 1, 1,
0.7914987, -0.09352458, 0.7733621, 0, 0, 0, 1, 1,
0.7929036, 1.698228, 0.06198454, 0, 0, 0, 1, 1,
0.7933034, -0.4826679, 2.160993, 0, 0, 0, 1, 1,
0.8035398, -0.5264037, 1.659281, 0, 0, 0, 1, 1,
0.8058233, 0.3585179, 0.549235, 0, 0, 0, 1, 1,
0.8059648, -0.783087, 1.59028, 0, 0, 0, 1, 1,
0.8068978, 1.363131, -2.14454, 0, 0, 0, 1, 1,
0.8070884, -0.02258282, 3.914903, 1, 1, 1, 1, 1,
0.8117167, 1.418143, -0.464521, 1, 1, 1, 1, 1,
0.8118325, 0.05750202, 1.76711, 1, 1, 1, 1, 1,
0.8123767, 0.170992, -0.06768376, 1, 1, 1, 1, 1,
0.8168591, 0.4843926, 0.3197673, 1, 1, 1, 1, 1,
0.8194953, -0.9606423, 2.459998, 1, 1, 1, 1, 1,
0.8249112, 0.09529154, 2.124708, 1, 1, 1, 1, 1,
0.8293203, -0.3887678, 3.084638, 1, 1, 1, 1, 1,
0.8293731, -0.1480405, 2.301892, 1, 1, 1, 1, 1,
0.8347542, 1.330134, 0.8960417, 1, 1, 1, 1, 1,
0.835678, 0.5104536, 1.899538, 1, 1, 1, 1, 1,
0.8395136, -1.270105, 1.359676, 1, 1, 1, 1, 1,
0.8509598, 0.09143943, -0.4004235, 1, 1, 1, 1, 1,
0.8526323, 0.6149292, 1.2454, 1, 1, 1, 1, 1,
0.8550695, 0.6916316, 0.6510177, 1, 1, 1, 1, 1,
0.8597843, -0.380714, 1.63055, 0, 0, 1, 1, 1,
0.8602431, -0.6847337, 1.605919, 1, 0, 0, 1, 1,
0.8630674, -0.6248451, 0.8472148, 1, 0, 0, 1, 1,
0.8661152, 0.8540245, 1.726283, 1, 0, 0, 1, 1,
0.8682329, 0.2512358, 1.96757, 1, 0, 0, 1, 1,
0.873775, -1.288994, 1.236805, 1, 0, 0, 1, 1,
0.8776565, 1.958619, 0.2626852, 0, 0, 0, 1, 1,
0.8802141, -0.2749807, 3.135757, 0, 0, 0, 1, 1,
0.8910395, -0.2589347, 1.183956, 0, 0, 0, 1, 1,
0.8941889, 1.498212, 0.8670999, 0, 0, 0, 1, 1,
0.9019591, -0.1517931, 2.049304, 0, 0, 0, 1, 1,
0.9073206, 1.922188, 1.279817, 0, 0, 0, 1, 1,
0.9084283, 0.03650003, 0.2009015, 0, 0, 0, 1, 1,
0.9092968, 0.7714299, 0.6103102, 1, 1, 1, 1, 1,
0.9105861, 0.5747725, 2.668246, 1, 1, 1, 1, 1,
0.9120393, -1.032902, 0.6189553, 1, 1, 1, 1, 1,
0.9215727, 0.457721, 0.6767811, 1, 1, 1, 1, 1,
0.921607, -1.177737, 3.204954, 1, 1, 1, 1, 1,
0.9256306, -0.08073732, 0.6217376, 1, 1, 1, 1, 1,
0.9287599, 2.026301, -0.6767194, 1, 1, 1, 1, 1,
0.9328058, -0.6523872, 0.9635063, 1, 1, 1, 1, 1,
0.9512435, -0.2955647, 3.106534, 1, 1, 1, 1, 1,
0.9545258, -1.286902, 1.920915, 1, 1, 1, 1, 1,
0.9600888, -2.627593, 2.307959, 1, 1, 1, 1, 1,
0.9603375, 0.724472, 0.8598319, 1, 1, 1, 1, 1,
0.9630758, -0.2588406, 4.039857, 1, 1, 1, 1, 1,
0.9632169, -0.8698509, 2.15983, 1, 1, 1, 1, 1,
0.9708154, -1.332265, 3.549346, 1, 1, 1, 1, 1,
0.9732262, -0.1927611, 1.048395, 0, 0, 1, 1, 1,
0.9755729, -1.619341, 2.025518, 1, 0, 0, 1, 1,
0.9810679, 0.6307282, 0.7505839, 1, 0, 0, 1, 1,
0.9896883, -0.3237068, 0.6988099, 1, 0, 0, 1, 1,
0.9944985, 0.303476, 1.729924, 1, 0, 0, 1, 1,
1.000659, 0.8446426, -0.0474068, 1, 0, 0, 1, 1,
1.011997, 0.06304651, 2.374867, 0, 0, 0, 1, 1,
1.019701, -0.06726607, 1.957685, 0, 0, 0, 1, 1,
1.020249, 1.203183, 1.045359, 0, 0, 0, 1, 1,
1.021214, -0.03956869, 2.100005, 0, 0, 0, 1, 1,
1.023266, -0.8743927, 3.948478, 0, 0, 0, 1, 1,
1.023572, -0.3107544, 0.133991, 0, 0, 0, 1, 1,
1.028735, -0.02638441, 3.19832, 0, 0, 0, 1, 1,
1.030911, 0.7398291, -1.043367, 1, 1, 1, 1, 1,
1.033365, -0.1210808, 0.5566587, 1, 1, 1, 1, 1,
1.050588, -2.119358, 4.078179, 1, 1, 1, 1, 1,
1.05697, -0.01552654, 1.378381, 1, 1, 1, 1, 1,
1.05865, -1.578626, 2.795424, 1, 1, 1, 1, 1,
1.063795, 0.09806644, -0.01775494, 1, 1, 1, 1, 1,
1.065059, -0.170982, 2.252836, 1, 1, 1, 1, 1,
1.066647, -0.2747391, 1.440343, 1, 1, 1, 1, 1,
1.069784, -0.4637811, 1.047705, 1, 1, 1, 1, 1,
1.071333, -0.9732748, 0.3737584, 1, 1, 1, 1, 1,
1.071669, -0.03894812, 0.06847163, 1, 1, 1, 1, 1,
1.078227, 0.2832202, 1.599473, 1, 1, 1, 1, 1,
1.08416, 0.7930246, 1.86717, 1, 1, 1, 1, 1,
1.085481, 0.5375894, -0.3783964, 1, 1, 1, 1, 1,
1.09245, -1.512634, 1.031672, 1, 1, 1, 1, 1,
1.093442, -0.4221407, 3.242404, 0, 0, 1, 1, 1,
1.102879, -0.5597378, 3.873057, 1, 0, 0, 1, 1,
1.105427, 1.306274, -0.2682077, 1, 0, 0, 1, 1,
1.105964, -0.8105941, 1.046436, 1, 0, 0, 1, 1,
1.106556, -0.0247466, 1.334736, 1, 0, 0, 1, 1,
1.116669, 0.5863949, 0.8782391, 1, 0, 0, 1, 1,
1.120309, 0.7253881, -0.335995, 0, 0, 0, 1, 1,
1.128334, -0.3235722, 0.9768832, 0, 0, 0, 1, 1,
1.132828, 0.816528, 2.218047, 0, 0, 0, 1, 1,
1.13831, -1.475592, 3.939702, 0, 0, 0, 1, 1,
1.152575, -0.3020453, 3.414799, 0, 0, 0, 1, 1,
1.152755, 0.2457582, 0.8618948, 0, 0, 0, 1, 1,
1.155504, -1.177897, 0.4715507, 0, 0, 0, 1, 1,
1.166811, -0.261617, 0.319522, 1, 1, 1, 1, 1,
1.168327, -0.3808607, 2.757719, 1, 1, 1, 1, 1,
1.17068, 0.2131217, 1.166258, 1, 1, 1, 1, 1,
1.17205, 0.9310538, 0.6757749, 1, 1, 1, 1, 1,
1.182309, 0.8096736, 0.7781352, 1, 1, 1, 1, 1,
1.186242, 0.5987601, -0.2044407, 1, 1, 1, 1, 1,
1.189157, 0.5016975, 1.532926, 1, 1, 1, 1, 1,
1.190818, 0.6661353, 0.6689878, 1, 1, 1, 1, 1,
1.191149, -1.04965, 1.67922, 1, 1, 1, 1, 1,
1.194427, 0.393911, 2.991264, 1, 1, 1, 1, 1,
1.215828, -3.142035, 3.639488, 1, 1, 1, 1, 1,
1.221239, 1.394134, 3.073794, 1, 1, 1, 1, 1,
1.231423, 0.08824607, 1.452061, 1, 1, 1, 1, 1,
1.235906, -1.488873, 1.424683, 1, 1, 1, 1, 1,
1.238731, 1.41334, 2.432549, 1, 1, 1, 1, 1,
1.247268, -0.7037976, -0.1237004, 0, 0, 1, 1, 1,
1.270787, -0.3928364, 1.499371, 1, 0, 0, 1, 1,
1.301688, 0.6280699, 2.159293, 1, 0, 0, 1, 1,
1.322044, 0.5823638, 1.163561, 1, 0, 0, 1, 1,
1.322285, 1.320899, -0.9389871, 1, 0, 0, 1, 1,
1.322357, -0.9503886, 4.959464, 1, 0, 0, 1, 1,
1.329826, -1.700915, 2.009528, 0, 0, 0, 1, 1,
1.330244, 2.312962, 2.077255, 0, 0, 0, 1, 1,
1.336184, 0.3888571, 2.005947, 0, 0, 0, 1, 1,
1.354322, -0.2479402, 0.9682189, 0, 0, 0, 1, 1,
1.355063, -0.2292838, 1.6281, 0, 0, 0, 1, 1,
1.35517, 0.1719912, 2.256904, 0, 0, 0, 1, 1,
1.357911, 0.1880443, -0.004159471, 0, 0, 0, 1, 1,
1.361121, -0.6100827, 0.8431868, 1, 1, 1, 1, 1,
1.363967, 0.8265171, 2.292854, 1, 1, 1, 1, 1,
1.379977, 0.29439, 0.7740037, 1, 1, 1, 1, 1,
1.388551, 0.338442, 0.8803562, 1, 1, 1, 1, 1,
1.38926, -1.089856, 2.140237, 1, 1, 1, 1, 1,
1.390991, 0.5914509, 0.1818002, 1, 1, 1, 1, 1,
1.399369, -0.5344186, 2.598965, 1, 1, 1, 1, 1,
1.401223, 0.1853062, 1.466738, 1, 1, 1, 1, 1,
1.423404, -0.0903721, 2.136655, 1, 1, 1, 1, 1,
1.436338, 1.888724, 1.111249, 1, 1, 1, 1, 1,
1.438296, 0.0808515, 1.741775, 1, 1, 1, 1, 1,
1.438908, -0.4202808, 2.410047, 1, 1, 1, 1, 1,
1.441069, -0.4576056, 1.077181, 1, 1, 1, 1, 1,
1.464287, -0.5982201, 2.80471, 1, 1, 1, 1, 1,
1.469344, 0.4906817, -0.09622833, 1, 1, 1, 1, 1,
1.469769, -0.88035, 0.7458404, 0, 0, 1, 1, 1,
1.471688, 1.535602, 1.438082, 1, 0, 0, 1, 1,
1.481557, -0.4976195, 1.984711, 1, 0, 0, 1, 1,
1.490436, 0.1559403, 2.101152, 1, 0, 0, 1, 1,
1.519813, -0.7827863, 1.248253, 1, 0, 0, 1, 1,
1.522463, -1.047141, 3.160409, 1, 0, 0, 1, 1,
1.523426, -2.091108, 3.440563, 0, 0, 0, 1, 1,
1.527558, -0.4752117, 1.151241, 0, 0, 0, 1, 1,
1.531504, -0.5957638, 1.725203, 0, 0, 0, 1, 1,
1.53723, 0.07999468, 2.685181, 0, 0, 0, 1, 1,
1.541598, 0.5725544, 1.510964, 0, 0, 0, 1, 1,
1.542508, -0.3828319, 1.84619, 0, 0, 0, 1, 1,
1.542654, 0.02935862, 3.43008, 0, 0, 0, 1, 1,
1.543937, -0.5430381, 3.127911, 1, 1, 1, 1, 1,
1.553522, -0.0493877, 2.383782, 1, 1, 1, 1, 1,
1.553824, -0.6339269, 2.2853, 1, 1, 1, 1, 1,
1.572233, -0.1171141, 1.98718, 1, 1, 1, 1, 1,
1.579485, -1.047911, 1.652277, 1, 1, 1, 1, 1,
1.61131, -0.2918131, 1.207339, 1, 1, 1, 1, 1,
1.618252, 1.280064, 0.7482642, 1, 1, 1, 1, 1,
1.621627, 1.513767, 2.374666, 1, 1, 1, 1, 1,
1.626328, -0.1772826, 1.286141, 1, 1, 1, 1, 1,
1.635375, 0.6479642, -0.234292, 1, 1, 1, 1, 1,
1.64788, -0.03064093, 2.788156, 1, 1, 1, 1, 1,
1.660119, -0.7519785, 0.2400608, 1, 1, 1, 1, 1,
1.660546, 2.013323, 1.328991, 1, 1, 1, 1, 1,
1.694344, -0.3476456, 1.213976, 1, 1, 1, 1, 1,
1.695262, 1.722373, 1.207057, 1, 1, 1, 1, 1,
1.700894, 0.09607406, 1.665939, 0, 0, 1, 1, 1,
1.702295, 1.141646, -0.2793616, 1, 0, 0, 1, 1,
1.704389, -0.8426896, 2.867831, 1, 0, 0, 1, 1,
1.723793, -0.9616033, 2.270597, 1, 0, 0, 1, 1,
1.728771, 0.5910994, 0.3402062, 1, 0, 0, 1, 1,
1.729788, 0.08593979, 1.403639, 1, 0, 0, 1, 1,
1.735431, -0.4060138, 2.206949, 0, 0, 0, 1, 1,
1.73544, 1.372329, -0.08337471, 0, 0, 0, 1, 1,
1.741774, 1.829781, 0.7754628, 0, 0, 0, 1, 1,
1.754634, -0.2073011, 2.916279, 0, 0, 0, 1, 1,
1.758314, 0.245502, 1.17626, 0, 0, 0, 1, 1,
1.769414, 0.02765681, 1.75496, 0, 0, 0, 1, 1,
1.772336, 0.7810544, 1.537774, 0, 0, 0, 1, 1,
1.773163, 0.8721057, 1.776022, 1, 1, 1, 1, 1,
1.777116, -0.1174983, -0.3198624, 1, 1, 1, 1, 1,
1.805985, 0.2999453, -0.1301223, 1, 1, 1, 1, 1,
1.852288, 1.094453, 1.701877, 1, 1, 1, 1, 1,
1.869264, 0.9364632, 1.399239, 1, 1, 1, 1, 1,
1.870889, 0.1030896, 1.531039, 1, 1, 1, 1, 1,
1.901753, -0.1587955, 0.9189003, 1, 1, 1, 1, 1,
1.902925, -1.402949, 1.483539, 1, 1, 1, 1, 1,
1.910689, 0.8054281, -0.3065607, 1, 1, 1, 1, 1,
1.911288, 1.621573, 2.046292, 1, 1, 1, 1, 1,
1.917679, 0.5609222, 1.846952, 1, 1, 1, 1, 1,
1.919685, 0.3631232, 2.1101, 1, 1, 1, 1, 1,
1.922465, -0.1484621, 3.177051, 1, 1, 1, 1, 1,
1.923604, 0.2221707, 2.820639, 1, 1, 1, 1, 1,
1.946846, -1.849515, 3.63697, 1, 1, 1, 1, 1,
1.960203, 0.4056517, 0.5627348, 0, 0, 1, 1, 1,
1.966205, -2.144116, 1.188264, 1, 0, 0, 1, 1,
1.998004, 0.3564916, 1.205177, 1, 0, 0, 1, 1,
2.000574, -0.2573911, 0.7086822, 1, 0, 0, 1, 1,
2.024734, -2.360256, 0.6150647, 1, 0, 0, 1, 1,
2.040133, 0.2825086, 1.191301, 1, 0, 0, 1, 1,
2.046002, 1.11607, 1.346499, 0, 0, 0, 1, 1,
2.061158, -0.2096495, -0.01354927, 0, 0, 0, 1, 1,
2.077403, 0.9517961, 0.9958251, 0, 0, 0, 1, 1,
2.099306, 0.166733, 2.425055, 0, 0, 0, 1, 1,
2.18078, -0.1494956, 3.655703, 0, 0, 0, 1, 1,
2.192477, 0.03270352, 1.55082, 0, 0, 0, 1, 1,
2.233023, 1.189559, 0.8113802, 0, 0, 0, 1, 1,
2.243397, 0.2237933, -0.4605097, 1, 1, 1, 1, 1,
2.253249, -3.011055, 1.683865, 1, 1, 1, 1, 1,
2.262224, 1.233582, 1.044976, 1, 1, 1, 1, 1,
2.363746, 0.3021724, 0.2859944, 1, 1, 1, 1, 1,
2.880062, 0.3804599, 3.282172, 1, 1, 1, 1, 1,
3.200291, 0.842043, 2.358806, 1, 1, 1, 1, 1,
3.55752, -0.5861627, 3.394616, 1, 1, 1, 1, 1
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
var radius = 9.682141;
var distance = 34.00811;
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
mvMatrix.translate( -0.1619711, -0.0808897, -0.1916728 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.00811);
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
