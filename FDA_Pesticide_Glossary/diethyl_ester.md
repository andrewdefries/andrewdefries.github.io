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
-3.373359, 0.3256651, -0.6030496, 1, 0, 0, 1,
-3.171512, -0.6668798, -3.533343, 1, 0.007843138, 0, 1,
-3.146526, -0.3264808, -0.201736, 1, 0.01176471, 0, 1,
-3.07727, -0.4524475, -0.9593564, 1, 0.01960784, 0, 1,
-3.066361, -0.5907449, -1.126647, 1, 0.02352941, 0, 1,
-2.992745, 0.4329074, -0.4439455, 1, 0.03137255, 0, 1,
-2.946277, -2.055841, -3.088144, 1, 0.03529412, 0, 1,
-2.735571, -0.6477948, -3.222595, 1, 0.04313726, 0, 1,
-2.734386, -1.371339, -2.210276, 1, 0.04705882, 0, 1,
-2.373621, 1.231097, -0.3237449, 1, 0.05490196, 0, 1,
-2.305462, 0.01973818, -1.936773, 1, 0.05882353, 0, 1,
-2.255004, 0.2798798, -2.174191, 1, 0.06666667, 0, 1,
-2.243497, 2.132703, -1.095417, 1, 0.07058824, 0, 1,
-2.222159, 1.114477, 0.1854809, 1, 0.07843138, 0, 1,
-2.20041, -0.4434689, -3.093069, 1, 0.08235294, 0, 1,
-2.170856, 0.4993235, -2.494815, 1, 0.09019608, 0, 1,
-2.169706, 0.6395217, -2.640075, 1, 0.09411765, 0, 1,
-2.151798, -1.303276, -1.798236, 1, 0.1019608, 0, 1,
-2.099125, 1.762783, -1.872721, 1, 0.1098039, 0, 1,
-2.064677, 0.5806097, -1.246077, 1, 0.1137255, 0, 1,
-2.052321, -0.4147137, 0.6375408, 1, 0.1215686, 0, 1,
-2.037966, -0.08425815, -2.053205, 1, 0.1254902, 0, 1,
-1.999268, 0.9011745, 1.104643, 1, 0.1333333, 0, 1,
-1.964135, -2.159477, -3.490779, 1, 0.1372549, 0, 1,
-1.916367, -1.0793, -2.23464, 1, 0.145098, 0, 1,
-1.914608, 0.434221, 0.1631957, 1, 0.1490196, 0, 1,
-1.902207, -0.331125, -2.202425, 1, 0.1568628, 0, 1,
-1.863685, -2.524782, -5.270512, 1, 0.1607843, 0, 1,
-1.852966, -0.9070581, -0.729532, 1, 0.1686275, 0, 1,
-1.83972, 0.342497, -1.400403, 1, 0.172549, 0, 1,
-1.821043, 0.2999217, -1.394545, 1, 0.1803922, 0, 1,
-1.813262, 0.6672698, -1.214796, 1, 0.1843137, 0, 1,
-1.812938, -0.4553493, -0.3761138, 1, 0.1921569, 0, 1,
-1.812593, -0.1742253, -1.806377, 1, 0.1960784, 0, 1,
-1.807983, 0.9143713, -2.59914, 1, 0.2039216, 0, 1,
-1.807763, -0.6748766, -3.238968, 1, 0.2117647, 0, 1,
-1.800726, -1.903813, -0.6081719, 1, 0.2156863, 0, 1,
-1.785267, -2.127935, -3.907179, 1, 0.2235294, 0, 1,
-1.781365, 1.779357, 1.708311, 1, 0.227451, 0, 1,
-1.734962, 0.9659854, 0.6252397, 1, 0.2352941, 0, 1,
-1.71525, 0.07590005, -1.756801, 1, 0.2392157, 0, 1,
-1.710509, 1.057876, -2.553203, 1, 0.2470588, 0, 1,
-1.70584, -0.1235482, -1.888857, 1, 0.2509804, 0, 1,
-1.67171, 0.1882485, -3.157459, 1, 0.2588235, 0, 1,
-1.658255, -0.6381763, -1.216709, 1, 0.2627451, 0, 1,
-1.658067, -0.5058376, -1.785617, 1, 0.2705882, 0, 1,
-1.646782, 0.4774644, -1.874953, 1, 0.2745098, 0, 1,
-1.58641, -0.6384424, -2.323162, 1, 0.282353, 0, 1,
-1.585956, -0.3160291, -3.178723, 1, 0.2862745, 0, 1,
-1.580114, 0.2364547, -2.404663, 1, 0.2941177, 0, 1,
-1.553572, -0.788166, -1.643516, 1, 0.3019608, 0, 1,
-1.53502, 0.4991344, -1.926128, 1, 0.3058824, 0, 1,
-1.525425, -1.360985, -2.18492, 1, 0.3137255, 0, 1,
-1.522093, 1.20362, -1.811455, 1, 0.3176471, 0, 1,
-1.52141, 0.07485443, -1.436471, 1, 0.3254902, 0, 1,
-1.499659, -0.7000679, -0.9325446, 1, 0.3294118, 0, 1,
-1.49928, -1.919428, -2.103989, 1, 0.3372549, 0, 1,
-1.488004, -0.02611942, -3.001232, 1, 0.3411765, 0, 1,
-1.474497, 2.157326, -2.588974, 1, 0.3490196, 0, 1,
-1.474445, 1.132771, 0.7499301, 1, 0.3529412, 0, 1,
-1.469699, 1.600466, -0.5787863, 1, 0.3607843, 0, 1,
-1.466005, -0.5850586, -1.954383, 1, 0.3647059, 0, 1,
-1.464517, 0.872911, -2.706023, 1, 0.372549, 0, 1,
-1.416997, 0.1800293, -2.309236, 1, 0.3764706, 0, 1,
-1.409778, 1.527974, -0.03283386, 1, 0.3843137, 0, 1,
-1.407724, 0.6528996, -0.3517672, 1, 0.3882353, 0, 1,
-1.392766, 1.196043, 0.3941769, 1, 0.3960784, 0, 1,
-1.39147, 1.777081, 0.8196561, 1, 0.4039216, 0, 1,
-1.384878, 0.2474035, -1.961609, 1, 0.4078431, 0, 1,
-1.384293, 0.5370064, -0.09004365, 1, 0.4156863, 0, 1,
-1.369189, -0.8348848, -1.956883, 1, 0.4196078, 0, 1,
-1.361604, -1.40635, -2.004639, 1, 0.427451, 0, 1,
-1.348997, 0.4304274, -1.507128, 1, 0.4313726, 0, 1,
-1.340608, 0.3146992, -2.019291, 1, 0.4392157, 0, 1,
-1.327852, -0.07743641, -1.041218, 1, 0.4431373, 0, 1,
-1.323836, -0.6069481, -2.800663, 1, 0.4509804, 0, 1,
-1.308763, 0.1804941, -1.074429, 1, 0.454902, 0, 1,
-1.305284, 0.1193513, -1.841267, 1, 0.4627451, 0, 1,
-1.300087, 0.647876, -1.990819, 1, 0.4666667, 0, 1,
-1.298977, 0.4484536, -1.09229, 1, 0.4745098, 0, 1,
-1.295705, -0.5513346, -0.312984, 1, 0.4784314, 0, 1,
-1.291938, -1.255751, -2.205816, 1, 0.4862745, 0, 1,
-1.291324, 2.149623, -0.06537369, 1, 0.4901961, 0, 1,
-1.287325, 0.7365626, -1.757365, 1, 0.4980392, 0, 1,
-1.286965, 0.02477757, -0.5572539, 1, 0.5058824, 0, 1,
-1.267196, 0.8038096, -1.448304, 1, 0.509804, 0, 1,
-1.264413, -0.1494745, -3.264803, 1, 0.5176471, 0, 1,
-1.255844, -0.2900347, -0.3449985, 1, 0.5215687, 0, 1,
-1.246097, -0.5292309, -1.838467, 1, 0.5294118, 0, 1,
-1.242511, -2.385209, -3.679942, 1, 0.5333334, 0, 1,
-1.240715, -0.1691505, -1.695344, 1, 0.5411765, 0, 1,
-1.230748, -0.06867076, -1.19564, 1, 0.5450981, 0, 1,
-1.230597, -1.199683, -1.985008, 1, 0.5529412, 0, 1,
-1.230529, -0.8562695, -3.98941, 1, 0.5568628, 0, 1,
-1.224834, 1.060697, -0.1946039, 1, 0.5647059, 0, 1,
-1.221674, -0.8493994, -1.4738, 1, 0.5686275, 0, 1,
-1.212631, 0.8510346, -0.8130262, 1, 0.5764706, 0, 1,
-1.21018, 0.1051191, -1.411895, 1, 0.5803922, 0, 1,
-1.209393, 0.2160517, -2.427584, 1, 0.5882353, 0, 1,
-1.202987, 1.695707, -2.210651, 1, 0.5921569, 0, 1,
-1.190311, 0.9152595, -0.8539428, 1, 0.6, 0, 1,
-1.189959, -2.054536, -1.569262, 1, 0.6078432, 0, 1,
-1.186439, 1.472757, -0.7161232, 1, 0.6117647, 0, 1,
-1.180737, 1.553508, 0.05549107, 1, 0.6196079, 0, 1,
-1.178745, 0.03972362, -1.132377, 1, 0.6235294, 0, 1,
-1.175359, -1.251313, -2.769602, 1, 0.6313726, 0, 1,
-1.158114, -1.924559, -1.485109, 1, 0.6352941, 0, 1,
-1.151109, 1.071274, -1.486493, 1, 0.6431373, 0, 1,
-1.147682, -0.7781895, -3.93529, 1, 0.6470588, 0, 1,
-1.142728, 1.921706, -0.1022797, 1, 0.654902, 0, 1,
-1.139406, 1.623757, -0.1169574, 1, 0.6588235, 0, 1,
-1.12643, 0.7393131, -2.653286, 1, 0.6666667, 0, 1,
-1.12488, -1.092146, -2.535132, 1, 0.6705883, 0, 1,
-1.12421, 2.073282, -0.9587483, 1, 0.6784314, 0, 1,
-1.122815, 0.2128261, -0.4770314, 1, 0.682353, 0, 1,
-1.121266, 0.4098118, -1.329434, 1, 0.6901961, 0, 1,
-1.119277, 1.75157, -0.2958486, 1, 0.6941177, 0, 1,
-1.116374, -0.1084803, -3.035289, 1, 0.7019608, 0, 1,
-1.10869, -0.6870568, -3.71634, 1, 0.7098039, 0, 1,
-1.108429, 1.634289, 0.936101, 1, 0.7137255, 0, 1,
-1.104935, 0.4497981, -1.098503, 1, 0.7215686, 0, 1,
-1.0994, 0.5551631, -1.162438, 1, 0.7254902, 0, 1,
-1.092836, 1.093362, -1.982457, 1, 0.7333333, 0, 1,
-1.091977, 0.7430569, 0.1913845, 1, 0.7372549, 0, 1,
-1.089033, -0.6174229, -2.234908, 1, 0.7450981, 0, 1,
-1.086819, 0.3474384, -3.179041, 1, 0.7490196, 0, 1,
-1.084293, 0.2691617, -0.1127396, 1, 0.7568628, 0, 1,
-1.080325, -0.3912308, -1.090695, 1, 0.7607843, 0, 1,
-1.079577, -1.938786, -1.95713, 1, 0.7686275, 0, 1,
-1.079146, 0.06738512, -2.191153, 1, 0.772549, 0, 1,
-1.075127, 0.6482629, -2.245969, 1, 0.7803922, 0, 1,
-1.068501, 1.111924, -0.04842099, 1, 0.7843137, 0, 1,
-1.066365, 1.284012, -1.991258, 1, 0.7921569, 0, 1,
-1.065654, 1.393817, -1.268757, 1, 0.7960784, 0, 1,
-1.059208, -0.2390521, -2.729856, 1, 0.8039216, 0, 1,
-1.056678, 3.340082, 0.5856937, 1, 0.8117647, 0, 1,
-1.053272, 0.6834484, -0.5396267, 1, 0.8156863, 0, 1,
-1.032728, -0.8462937, -1.642991, 1, 0.8235294, 0, 1,
-1.032462, 0.7193679, -1.679684, 1, 0.827451, 0, 1,
-1.031949, 0.7472367, -0.9748514, 1, 0.8352941, 0, 1,
-1.029525, 0.2805228, -1.861995, 1, 0.8392157, 0, 1,
-1.023795, 0.8573014, -0.2984472, 1, 0.8470588, 0, 1,
-1.01797, 0.7149564, -2.150308, 1, 0.8509804, 0, 1,
-1.017581, 0.3205822, -1.319492, 1, 0.8588235, 0, 1,
-1.017024, 0.6739094, -0.4888696, 1, 0.8627451, 0, 1,
-1.0146, 0.1044943, -1.401388, 1, 0.8705882, 0, 1,
-1.008753, -1.010543, -2.531636, 1, 0.8745098, 0, 1,
-1.006839, -0.904377, -1.233203, 1, 0.8823529, 0, 1,
-0.9988655, -0.6882126, -2.457398, 1, 0.8862745, 0, 1,
-0.995091, 1.129591, 0.7017672, 1, 0.8941177, 0, 1,
-0.9939113, -0.1313609, -1.472339, 1, 0.8980392, 0, 1,
-0.9908431, -1.192641, -0.6753471, 1, 0.9058824, 0, 1,
-0.9864006, -1.24223, -4.290075, 1, 0.9137255, 0, 1,
-0.9847549, -0.8076988, -3.598991, 1, 0.9176471, 0, 1,
-0.9836754, -0.7654088, -1.395184, 1, 0.9254902, 0, 1,
-0.9818935, -0.07990006, -0.7692086, 1, 0.9294118, 0, 1,
-0.9766044, -0.5234514, -1.536311, 1, 0.9372549, 0, 1,
-0.9721656, -0.6237103, -1.43197, 1, 0.9411765, 0, 1,
-0.9664787, -0.7155859, -2.610924, 1, 0.9490196, 0, 1,
-0.9619302, -0.6712468, -4.047058, 1, 0.9529412, 0, 1,
-0.960556, -1.546128, -2.911328, 1, 0.9607843, 0, 1,
-0.9603169, 0.8224006, 0.8768799, 1, 0.9647059, 0, 1,
-0.9579768, -0.8258465, -1.667299, 1, 0.972549, 0, 1,
-0.9528306, 0.4112153, -1.588951, 1, 0.9764706, 0, 1,
-0.9495106, 0.3645338, -1.438515, 1, 0.9843137, 0, 1,
-0.9446513, 1.352082, -0.2933069, 1, 0.9882353, 0, 1,
-0.9431933, 0.4401689, -0.5387856, 1, 0.9960784, 0, 1,
-0.9410917, 0.6646165, 0.0867547, 0.9960784, 1, 0, 1,
-0.9357726, -0.7096729, -0.3173022, 0.9921569, 1, 0, 1,
-0.9317483, 2.969788, -2.405188, 0.9843137, 1, 0, 1,
-0.9312884, -0.116647, -1.096215, 0.9803922, 1, 0, 1,
-0.930702, 0.1909054, -1.403214, 0.972549, 1, 0, 1,
-0.9302208, -0.6326592, -2.011111, 0.9686275, 1, 0, 1,
-0.9288033, 0.5253419, -0.408937, 0.9607843, 1, 0, 1,
-0.925595, -0.7847016, -2.349758, 0.9568627, 1, 0, 1,
-0.9244768, -0.2268761, -3.341213, 0.9490196, 1, 0, 1,
-0.9203387, 1.285365, 0.7141709, 0.945098, 1, 0, 1,
-0.9187872, 1.091491, -0.8306795, 0.9372549, 1, 0, 1,
-0.9159812, -0.6054324, -0.7641872, 0.9333333, 1, 0, 1,
-0.9132323, 2.001507, -0.3786888, 0.9254902, 1, 0, 1,
-0.9125507, -0.1805522, -3.31552, 0.9215686, 1, 0, 1,
-0.9095232, -0.8876765, -1.679889, 0.9137255, 1, 0, 1,
-0.9074329, 0.6670854, -3.015067, 0.9098039, 1, 0, 1,
-0.9034353, 1.328647, 0.4706773, 0.9019608, 1, 0, 1,
-0.9034216, -1.848871, -3.551817, 0.8941177, 1, 0, 1,
-0.9010239, -1.063476, -2.446437, 0.8901961, 1, 0, 1,
-0.8964034, 1.610138, -2.249611, 0.8823529, 1, 0, 1,
-0.8957024, -1.068416, -2.341269, 0.8784314, 1, 0, 1,
-0.8867778, -0.7797336, -2.036587, 0.8705882, 1, 0, 1,
-0.8841569, -0.3708971, -2.032965, 0.8666667, 1, 0, 1,
-0.8840929, 1.581219, 0.6592427, 0.8588235, 1, 0, 1,
-0.8836925, -1.103795, -1.799525, 0.854902, 1, 0, 1,
-0.8829163, -0.7567053, -2.962033, 0.8470588, 1, 0, 1,
-0.8781171, -0.8515626, -2.450876, 0.8431373, 1, 0, 1,
-0.8770421, -0.2332673, -3.16846, 0.8352941, 1, 0, 1,
-0.8602622, -0.3183216, -2.773064, 0.8313726, 1, 0, 1,
-0.856449, -0.008982549, -2.141228, 0.8235294, 1, 0, 1,
-0.8564361, 0.1880386, -2.104437, 0.8196079, 1, 0, 1,
-0.8538529, -0.9475653, -2.528736, 0.8117647, 1, 0, 1,
-0.8516344, 0.4777433, -2.032151, 0.8078431, 1, 0, 1,
-0.8466518, 0.9913511, -1.915616, 0.8, 1, 0, 1,
-0.8458718, 0.2493828, -1.142804, 0.7921569, 1, 0, 1,
-0.8394361, 0.8078302, -1.08853, 0.7882353, 1, 0, 1,
-0.8350776, 2.10913, -0.603698, 0.7803922, 1, 0, 1,
-0.834358, -0.8225084, -3.362483, 0.7764706, 1, 0, 1,
-0.8310834, -0.2561417, -2.068861, 0.7686275, 1, 0, 1,
-0.8305597, 0.4150992, -1.083136, 0.7647059, 1, 0, 1,
-0.8234105, -1.810823, -3.262598, 0.7568628, 1, 0, 1,
-0.8225208, 3.342981, 0.759809, 0.7529412, 1, 0, 1,
-0.8142514, 0.566201, -1.887024, 0.7450981, 1, 0, 1,
-0.8038492, -0.01469974, 1.229203, 0.7411765, 1, 0, 1,
-0.8034903, 1.324231, -0.3147887, 0.7333333, 1, 0, 1,
-0.8000851, 0.5259713, -0.2478268, 0.7294118, 1, 0, 1,
-0.7953056, 1.068978, 0.2713917, 0.7215686, 1, 0, 1,
-0.7936707, -0.9190997, -0.8081167, 0.7176471, 1, 0, 1,
-0.7929577, 1.356438, -0.08486506, 0.7098039, 1, 0, 1,
-0.7863696, -1.206148, -3.878029, 0.7058824, 1, 0, 1,
-0.7840114, 0.370131, -1.884543, 0.6980392, 1, 0, 1,
-0.7796917, 0.07814446, -0.8302279, 0.6901961, 1, 0, 1,
-0.7771657, -1.482406, -2.072497, 0.6862745, 1, 0, 1,
-0.7725472, 1.310689, -0.6523891, 0.6784314, 1, 0, 1,
-0.7645631, -0.2413286, -3.475642, 0.6745098, 1, 0, 1,
-0.7645457, 1.244035, -0.2727015, 0.6666667, 1, 0, 1,
-0.76306, -0.445982, -1.880553, 0.6627451, 1, 0, 1,
-0.7525703, 0.7681226, 1.007502, 0.654902, 1, 0, 1,
-0.7524485, -0.8566113, -3.711787, 0.6509804, 1, 0, 1,
-0.7461252, -1.014009, -2.152686, 0.6431373, 1, 0, 1,
-0.7411936, 0.7453548, -0.7764719, 0.6392157, 1, 0, 1,
-0.7397004, -0.5545082, -2.227812, 0.6313726, 1, 0, 1,
-0.7396247, -1.298496, -2.085043, 0.627451, 1, 0, 1,
-0.7338931, -0.2942441, -2.558982, 0.6196079, 1, 0, 1,
-0.7273716, -2.445603, -5.893728, 0.6156863, 1, 0, 1,
-0.7213644, 1.226464, -1.027806, 0.6078432, 1, 0, 1,
-0.7187436, 0.640326, -1.291361, 0.6039216, 1, 0, 1,
-0.712349, -0.2684677, -1.844711, 0.5960785, 1, 0, 1,
-0.7064614, -0.3848946, -1.610318, 0.5882353, 1, 0, 1,
-0.7052901, -0.05963465, -1.13502, 0.5843138, 1, 0, 1,
-0.7035051, -0.5638403, -2.857665, 0.5764706, 1, 0, 1,
-0.7012105, 0.02893422, -2.444081, 0.572549, 1, 0, 1,
-0.699413, -0.5380396, -2.446675, 0.5647059, 1, 0, 1,
-0.6983047, -0.3872572, -1.377957, 0.5607843, 1, 0, 1,
-0.696778, -0.3431317, -1.384538, 0.5529412, 1, 0, 1,
-0.6942058, 0.956952, -1.067828, 0.5490196, 1, 0, 1,
-0.6910599, -0.4252872, -3.754593, 0.5411765, 1, 0, 1,
-0.6897294, -0.1616959, -2.16673, 0.5372549, 1, 0, 1,
-0.6842187, 0.2406815, -1.962752, 0.5294118, 1, 0, 1,
-0.6822156, 0.4421479, -2.579506, 0.5254902, 1, 0, 1,
-0.6765449, 0.9159001, 0.6814811, 0.5176471, 1, 0, 1,
-0.6764346, -0.05585244, -2.388554, 0.5137255, 1, 0, 1,
-0.6761888, 0.4736906, -0.781744, 0.5058824, 1, 0, 1,
-0.6738206, -1.460142, -3.793427, 0.5019608, 1, 0, 1,
-0.6731408, -1.505358, -3.536587, 0.4941176, 1, 0, 1,
-0.6678172, -1.146636, -2.376312, 0.4862745, 1, 0, 1,
-0.665296, 0.5381361, -0.7524604, 0.4823529, 1, 0, 1,
-0.6626241, -0.2303002, -0.6350789, 0.4745098, 1, 0, 1,
-0.657467, 0.6078054, -2.159925, 0.4705882, 1, 0, 1,
-0.6505867, 1.143056, -0.2204676, 0.4627451, 1, 0, 1,
-0.6460077, 1.277866, -0.7235511, 0.4588235, 1, 0, 1,
-0.6455544, 0.713972, 1.193552, 0.4509804, 1, 0, 1,
-0.6395575, 1.722494, 0.7315552, 0.4470588, 1, 0, 1,
-0.6301131, -0.0950139, -2.605705, 0.4392157, 1, 0, 1,
-0.627371, -0.8523782, -2.973048, 0.4352941, 1, 0, 1,
-0.6203312, -0.5117923, -3.665931, 0.427451, 1, 0, 1,
-0.6182956, 0.7877013, -0.7793927, 0.4235294, 1, 0, 1,
-0.6157379, 2.378241, 0.2281012, 0.4156863, 1, 0, 1,
-0.6154064, -0.7265251, -1.518778, 0.4117647, 1, 0, 1,
-0.6137372, -0.4584355, -0.8110666, 0.4039216, 1, 0, 1,
-0.6116323, -1.392761, -2.582842, 0.3960784, 1, 0, 1,
-0.6112833, 1.098325, -0.9792594, 0.3921569, 1, 0, 1,
-0.6110809, 0.6611223, -1.41419, 0.3843137, 1, 0, 1,
-0.6079889, -0.3625826, -1.343859, 0.3803922, 1, 0, 1,
-0.607801, 0.09548737, -1.425312, 0.372549, 1, 0, 1,
-0.6049508, -1.145882, -2.59691, 0.3686275, 1, 0, 1,
-0.604893, -1.356977, -1.770829, 0.3607843, 1, 0, 1,
-0.6045147, 1.517704, -0.9396673, 0.3568628, 1, 0, 1,
-0.6009371, 1.301039, 0.8305236, 0.3490196, 1, 0, 1,
-0.5974669, 1.573841, -1.456359, 0.345098, 1, 0, 1,
-0.5859543, 0.05208547, -1.934731, 0.3372549, 1, 0, 1,
-0.5843207, -0.8048772, -3.527556, 0.3333333, 1, 0, 1,
-0.5782109, -1.185604, -4.086242, 0.3254902, 1, 0, 1,
-0.573397, 0.7293375, 0.5225614, 0.3215686, 1, 0, 1,
-0.5686722, 0.7302068, -2.42331, 0.3137255, 1, 0, 1,
-0.560097, 1.654226, 0.3060709, 0.3098039, 1, 0, 1,
-0.5595003, 0.2394654, 0.2843237, 0.3019608, 1, 0, 1,
-0.5545022, 1.475247, -1.108903, 0.2941177, 1, 0, 1,
-0.5459129, -0.2716641, -2.329743, 0.2901961, 1, 0, 1,
-0.5414972, 0.2172242, -1.16531, 0.282353, 1, 0, 1,
-0.5384124, -1.662707, -3.554222, 0.2784314, 1, 0, 1,
-0.5380203, 0.3019449, -0.4397314, 0.2705882, 1, 0, 1,
-0.536912, -0.3231743, -2.123514, 0.2666667, 1, 0, 1,
-0.5305277, 0.2546402, -0.7467611, 0.2588235, 1, 0, 1,
-0.5288287, -1.345344, -2.732885, 0.254902, 1, 0, 1,
-0.5219351, -0.5465741, -3.65617, 0.2470588, 1, 0, 1,
-0.5188995, 0.2557849, -1.245964, 0.2431373, 1, 0, 1,
-0.5186839, 0.5994918, -1.081152, 0.2352941, 1, 0, 1,
-0.5159526, 0.4142212, -1.469735, 0.2313726, 1, 0, 1,
-0.5156596, 0.2572419, -1.634041, 0.2235294, 1, 0, 1,
-0.5137171, 0.661839, -0.8956681, 0.2196078, 1, 0, 1,
-0.5135484, 0.7043746, 0.1204578, 0.2117647, 1, 0, 1,
-0.5090443, 0.8339443, -0.04037676, 0.2078431, 1, 0, 1,
-0.5036131, 0.4876274, -0.2678528, 0.2, 1, 0, 1,
-0.5021213, 0.8679658, -0.5548759, 0.1921569, 1, 0, 1,
-0.5015535, -1.103479, -2.753498, 0.1882353, 1, 0, 1,
-0.4997627, -1.690725, -4.101429, 0.1803922, 1, 0, 1,
-0.4993916, -0.2994303, -3.364634, 0.1764706, 1, 0, 1,
-0.4986242, -0.5959914, -1.153312, 0.1686275, 1, 0, 1,
-0.4963537, 1.611225, -3.019959, 0.1647059, 1, 0, 1,
-0.4947599, -1.256518, -2.63929, 0.1568628, 1, 0, 1,
-0.4933924, 1.481307, -0.9208292, 0.1529412, 1, 0, 1,
-0.4911351, 0.9928931, -2.93121, 0.145098, 1, 0, 1,
-0.4910678, -0.09927088, -3.069856, 0.1411765, 1, 0, 1,
-0.4860721, 1.605888, 0.4832066, 0.1333333, 1, 0, 1,
-0.4843236, -1.986603, -2.434378, 0.1294118, 1, 0, 1,
-0.4766773, -2.778803, -3.041129, 0.1215686, 1, 0, 1,
-0.4759497, -0.1961868, -2.470213, 0.1176471, 1, 0, 1,
-0.475894, -0.4344673, -2.35413, 0.1098039, 1, 0, 1,
-0.4737186, 0.3973461, -0.3996857, 0.1058824, 1, 0, 1,
-0.4734223, -0.8495926, -3.072539, 0.09803922, 1, 0, 1,
-0.4671667, -0.8503261, -0.456826, 0.09019608, 1, 0, 1,
-0.4665479, 0.1744763, -1.027725, 0.08627451, 1, 0, 1,
-0.4615771, -0.3698968, -0.2724204, 0.07843138, 1, 0, 1,
-0.4609473, -0.1926787, -1.744936, 0.07450981, 1, 0, 1,
-0.4587976, -0.4309344, -4.206097, 0.06666667, 1, 0, 1,
-0.4586931, 0.1237517, -0.005103845, 0.0627451, 1, 0, 1,
-0.4575858, 0.6766679, 0.8507044, 0.05490196, 1, 0, 1,
-0.4519832, 0.7275906, -0.9729562, 0.05098039, 1, 0, 1,
-0.4512387, -0.5861105, -0.7901412, 0.04313726, 1, 0, 1,
-0.449551, 1.600533, 0.513112, 0.03921569, 1, 0, 1,
-0.4493285, -1.836274, -1.345433, 0.03137255, 1, 0, 1,
-0.4413916, -0.3296589, -3.185316, 0.02745098, 1, 0, 1,
-0.440538, 1.312017, -1.530433, 0.01960784, 1, 0, 1,
-0.4349815, 0.3985832, -2.017579, 0.01568628, 1, 0, 1,
-0.4268445, -0.2105103, -1.099412, 0.007843138, 1, 0, 1,
-0.4221537, -0.09204312, -3.751038, 0.003921569, 1, 0, 1,
-0.421778, 0.7778152, -0.8141724, 0, 1, 0.003921569, 1,
-0.4196526, -0.7792365, -1.633579, 0, 1, 0.01176471, 1,
-0.4153766, -0.6780716, -2.441967, 0, 1, 0.01568628, 1,
-0.414896, -0.2334058, -3.632879, 0, 1, 0.02352941, 1,
-0.4101065, -0.1522961, -0.2512973, 0, 1, 0.02745098, 1,
-0.4096314, -0.3193412, -2.775671, 0, 1, 0.03529412, 1,
-0.4077854, -0.586766, -3.789516, 0, 1, 0.03921569, 1,
-0.4075072, 0.7188234, -1.826068, 0, 1, 0.04705882, 1,
-0.4012516, -0.6731495, -3.516748, 0, 1, 0.05098039, 1,
-0.3973028, -0.2559532, -1.485752, 0, 1, 0.05882353, 1,
-0.3949508, 0.9146978, -0.07007858, 0, 1, 0.0627451, 1,
-0.3923973, -0.05948736, -1.517451, 0, 1, 0.07058824, 1,
-0.3923275, -2.275561, -4.297738, 0, 1, 0.07450981, 1,
-0.3914671, 1.275722, -0.3871849, 0, 1, 0.08235294, 1,
-0.3905162, 1.030936, -0.3962732, 0, 1, 0.08627451, 1,
-0.3896308, 1.020925, 0.6692421, 0, 1, 0.09411765, 1,
-0.3895823, 1.57614, -0.8618753, 0, 1, 0.1019608, 1,
-0.3882021, 0.6306379, 0.3888716, 0, 1, 0.1058824, 1,
-0.3872529, 0.965371, 1.068219, 0, 1, 0.1137255, 1,
-0.3865328, -0.2229176, -1.24641, 0, 1, 0.1176471, 1,
-0.3830665, -1.306986, -2.565978, 0, 1, 0.1254902, 1,
-0.3812996, -1.132182, -1.547627, 0, 1, 0.1294118, 1,
-0.3780428, -1.370335, -2.082949, 0, 1, 0.1372549, 1,
-0.3765317, -0.7149964, -1.544244, 0, 1, 0.1411765, 1,
-0.3743595, 1.097417, -0.2807765, 0, 1, 0.1490196, 1,
-0.3728949, -1.471881, -1.325866, 0, 1, 0.1529412, 1,
-0.3669203, 0.192381, -0.3760803, 0, 1, 0.1607843, 1,
-0.3653136, 0.9997067, 0.6193358, 0, 1, 0.1647059, 1,
-0.362238, -0.7702267, -3.877937, 0, 1, 0.172549, 1,
-0.3565991, -1.61634, -2.105599, 0, 1, 0.1764706, 1,
-0.3553377, 0.8656276, -0.7282603, 0, 1, 0.1843137, 1,
-0.3540545, -0.2045115, -2.034762, 0, 1, 0.1882353, 1,
-0.3521416, 0.237116, -2.172764, 0, 1, 0.1960784, 1,
-0.3497902, -1.15132, -2.679347, 0, 1, 0.2039216, 1,
-0.3477281, 1.628793, 0.7816387, 0, 1, 0.2078431, 1,
-0.3461889, -0.1076178, -3.217417, 0, 1, 0.2156863, 1,
-0.3393341, -0.4026793, -2.522437, 0, 1, 0.2196078, 1,
-0.331059, 0.1488066, -1.162456, 0, 1, 0.227451, 1,
-0.3231659, 1.338584, -0.961628, 0, 1, 0.2313726, 1,
-0.3204709, -0.2861586, -2.585939, 0, 1, 0.2392157, 1,
-0.3191811, -0.4048539, -4.110868, 0, 1, 0.2431373, 1,
-0.3177792, 0.07075823, -0.76766, 0, 1, 0.2509804, 1,
-0.3165632, 0.154843, -1.197791, 0, 1, 0.254902, 1,
-0.3163717, 0.5358603, -0.9686922, 0, 1, 0.2627451, 1,
-0.3142656, -1.011483, -3.55933, 0, 1, 0.2666667, 1,
-0.3086898, 0.08860088, -0.7001911, 0, 1, 0.2745098, 1,
-0.3023897, -0.4221484, -4.479096, 0, 1, 0.2784314, 1,
-0.299345, 0.3918884, -1.431811, 0, 1, 0.2862745, 1,
-0.2957343, -0.1396964, -4.692096, 0, 1, 0.2901961, 1,
-0.2907413, -1.464413, -1.61808, 0, 1, 0.2980392, 1,
-0.2890665, -0.5461918, -4.164772, 0, 1, 0.3058824, 1,
-0.2884713, -1.331134, -2.812414, 0, 1, 0.3098039, 1,
-0.2868766, 0.2366739, -1.471775, 0, 1, 0.3176471, 1,
-0.2832486, 1.307844, -1.44259, 0, 1, 0.3215686, 1,
-0.2823257, -0.8095208, -2.611569, 0, 1, 0.3294118, 1,
-0.2782729, -1.734716, -1.486568, 0, 1, 0.3333333, 1,
-0.2747248, 1.319291, 1.694119, 0, 1, 0.3411765, 1,
-0.2745586, -0.6942862, -2.386363, 0, 1, 0.345098, 1,
-0.2705905, -1.136466, -3.368159, 0, 1, 0.3529412, 1,
-0.2703172, -0.07667431, -1.768137, 0, 1, 0.3568628, 1,
-0.2694786, 0.1564739, -1.003775, 0, 1, 0.3647059, 1,
-0.2675231, -2.123371, -2.371197, 0, 1, 0.3686275, 1,
-0.266768, 0.1758942, -1.397791, 0, 1, 0.3764706, 1,
-0.2635536, -0.4789205, -3.273527, 0, 1, 0.3803922, 1,
-0.2572353, -0.2380277, 0.5070248, 0, 1, 0.3882353, 1,
-0.2546923, 1.135599, 1.627707, 0, 1, 0.3921569, 1,
-0.2539246, 0.9261822, -0.4773622, 0, 1, 0.4, 1,
-0.2500149, -0.578006, -3.665799, 0, 1, 0.4078431, 1,
-0.2462265, -0.05707986, -1.15649, 0, 1, 0.4117647, 1,
-0.2451383, 0.6554382, -1.652834, 0, 1, 0.4196078, 1,
-0.242194, -0.9266908, -2.05971, 0, 1, 0.4235294, 1,
-0.2419298, 1.030341, 1.352376, 0, 1, 0.4313726, 1,
-0.239474, -0.9946412, -2.555919, 0, 1, 0.4352941, 1,
-0.2391269, -0.07327147, -1.651273, 0, 1, 0.4431373, 1,
-0.2360531, 0.3885127, -0.8180363, 0, 1, 0.4470588, 1,
-0.233444, 0.3293875, -1.773775, 0, 1, 0.454902, 1,
-0.2306613, -0.3146662, -2.126042, 0, 1, 0.4588235, 1,
-0.2290363, -0.6812726, -2.403631, 0, 1, 0.4666667, 1,
-0.2282895, 1.396451, 1.256675, 0, 1, 0.4705882, 1,
-0.2217299, 0.4632469, 1.907073, 0, 1, 0.4784314, 1,
-0.2214123, -1.731694, -1.828722, 0, 1, 0.4823529, 1,
-0.2210832, 1.005264, -0.1363765, 0, 1, 0.4901961, 1,
-0.2194755, -0.5181681, -2.293739, 0, 1, 0.4941176, 1,
-0.2180656, -0.1133678, -1.506464, 0, 1, 0.5019608, 1,
-0.217293, 3.71673, -0.7331982, 0, 1, 0.509804, 1,
-0.2052454, -1.240164, -1.630824, 0, 1, 0.5137255, 1,
-0.1997086, 0.5639518, -0.3523944, 0, 1, 0.5215687, 1,
-0.1988771, -0.7179499, -1.727563, 0, 1, 0.5254902, 1,
-0.198202, 0.6368036, 1.056943, 0, 1, 0.5333334, 1,
-0.1971396, 1.531406, -0.2320758, 0, 1, 0.5372549, 1,
-0.1940345, -0.5674091, -4.176396, 0, 1, 0.5450981, 1,
-0.1912838, -0.894905, -3.581804, 0, 1, 0.5490196, 1,
-0.1901074, -1.360126, -3.123052, 0, 1, 0.5568628, 1,
-0.1886441, -2.773416, -6.269274, 0, 1, 0.5607843, 1,
-0.1876213, 0.4292263, -0.7151415, 0, 1, 0.5686275, 1,
-0.1844928, -0.2421625, -1.32617, 0, 1, 0.572549, 1,
-0.1779168, 0.02721385, -1.25667, 0, 1, 0.5803922, 1,
-0.1713241, 0.9355701, -0.02445749, 0, 1, 0.5843138, 1,
-0.1709525, 0.04440716, -2.185401, 0, 1, 0.5921569, 1,
-0.1692084, -1.12819, -3.546383, 0, 1, 0.5960785, 1,
-0.168303, -0.7860134, -4.883731, 0, 1, 0.6039216, 1,
-0.1676071, -0.793612, -2.496462, 0, 1, 0.6117647, 1,
-0.1600486, 0.7387209, 0.2767832, 0, 1, 0.6156863, 1,
-0.1592666, -0.9097533, -2.439102, 0, 1, 0.6235294, 1,
-0.1576044, -0.9548544, -1.890039, 0, 1, 0.627451, 1,
-0.1538907, 0.1503054, -1.108661, 0, 1, 0.6352941, 1,
-0.1528427, 0.04125335, -0.8623778, 0, 1, 0.6392157, 1,
-0.1522627, -0.003253363, -1.168473, 0, 1, 0.6470588, 1,
-0.1521545, -0.7534177, -3.983791, 0, 1, 0.6509804, 1,
-0.1463613, -0.5228474, -5.117573, 0, 1, 0.6588235, 1,
-0.1449871, 0.3564037, -1.72331, 0, 1, 0.6627451, 1,
-0.1343209, 1.125568, -0.7175134, 0, 1, 0.6705883, 1,
-0.1276322, -1.866838, -2.026609, 0, 1, 0.6745098, 1,
-0.126414, -0.6143962, -3.999108, 0, 1, 0.682353, 1,
-0.1263859, -1.812486, -2.500337, 0, 1, 0.6862745, 1,
-0.1259468, -0.05171726, -1.909914, 0, 1, 0.6941177, 1,
-0.1242112, -0.4632189, -2.966555, 0, 1, 0.7019608, 1,
-0.1241309, 1.777912, -0.09068996, 0, 1, 0.7058824, 1,
-0.1229076, 2.294676, 0.4655059, 0, 1, 0.7137255, 1,
-0.1219794, 1.344769, -0.588677, 0, 1, 0.7176471, 1,
-0.120005, -1.257696, -4.892817, 0, 1, 0.7254902, 1,
-0.1180314, 1.171679, 1.435187, 0, 1, 0.7294118, 1,
-0.1147731, 0.8222305, 0.6145596, 0, 1, 0.7372549, 1,
-0.1138931, -0.4493013, -1.458776, 0, 1, 0.7411765, 1,
-0.1107347, -0.5768026, -1.954079, 0, 1, 0.7490196, 1,
-0.1102943, 0.527476, 0.3060063, 0, 1, 0.7529412, 1,
-0.1093136, -0.4155699, -2.664183, 0, 1, 0.7607843, 1,
-0.1060517, 2.721996, -0.1786075, 0, 1, 0.7647059, 1,
-0.09934336, -0.7136918, -3.596109, 0, 1, 0.772549, 1,
-0.09571107, -3.517701, -2.592144, 0, 1, 0.7764706, 1,
-0.09553469, 0.3682113, 1.162738, 0, 1, 0.7843137, 1,
-0.09499965, -0.4580145, -2.464441, 0, 1, 0.7882353, 1,
-0.09268966, -0.3148977, -1.400185, 0, 1, 0.7960784, 1,
-0.0912977, 1.291687, 0.3972526, 0, 1, 0.8039216, 1,
-0.09074867, 0.373893, -1.830548, 0, 1, 0.8078431, 1,
-0.08987053, 0.130804, -0.7793951, 0, 1, 0.8156863, 1,
-0.08816729, 1.218843, 0.5676138, 0, 1, 0.8196079, 1,
-0.08706502, 0.4188489, -0.2091351, 0, 1, 0.827451, 1,
-0.08505915, -2.034739, -3.699912, 0, 1, 0.8313726, 1,
-0.08432624, 1.629138, -0.8765299, 0, 1, 0.8392157, 1,
-0.08038237, 0.5585119, 0.06740896, 0, 1, 0.8431373, 1,
-0.07988845, 1.057563, -1.219155, 0, 1, 0.8509804, 1,
-0.07906128, -0.0808798, -4.071637, 0, 1, 0.854902, 1,
-0.07575395, -0.7111052, -3.55711, 0, 1, 0.8627451, 1,
-0.07355863, 1.782357, -0.2446443, 0, 1, 0.8666667, 1,
-0.06762941, -1.106647, -3.20313, 0, 1, 0.8745098, 1,
-0.06537677, -0.2238729, -4.448329, 0, 1, 0.8784314, 1,
-0.06296422, 0.11041, -0.1959902, 0, 1, 0.8862745, 1,
-0.05687473, -0.506797, -3.562248, 0, 1, 0.8901961, 1,
-0.05459834, -0.8371751, -2.13834, 0, 1, 0.8980392, 1,
-0.05297355, -0.3240933, -2.985732, 0, 1, 0.9058824, 1,
-0.05278767, 0.2318588, -2.807978, 0, 1, 0.9098039, 1,
-0.04729175, 0.9220769, 1.302499, 0, 1, 0.9176471, 1,
-0.04666527, -0.442751, -3.479983, 0, 1, 0.9215686, 1,
-0.04136015, -0.08745404, -1.312959, 0, 1, 0.9294118, 1,
-0.04114147, -0.2282935, -3.385385, 0, 1, 0.9333333, 1,
-0.04081421, 0.4867721, 0.2818217, 0, 1, 0.9411765, 1,
-0.04047202, 1.046527, 0.8976812, 0, 1, 0.945098, 1,
-0.03954088, 0.9233232, 0.2712117, 0, 1, 0.9529412, 1,
-0.0359145, 0.00327099, -1.008907, 0, 1, 0.9568627, 1,
-0.03429163, 0.07936405, -0.4535245, 0, 1, 0.9647059, 1,
-0.03423515, 1.458981, 0.5255889, 0, 1, 0.9686275, 1,
-0.03256459, -1.046794, -2.473703, 0, 1, 0.9764706, 1,
-0.02977937, 0.3673798, 0.1729643, 0, 1, 0.9803922, 1,
-0.02410218, -0.2114454, -2.715799, 0, 1, 0.9882353, 1,
-0.02264093, 0.06651172, 0.3917338, 0, 1, 0.9921569, 1,
-0.02051931, -0.02291572, -4.06448, 0, 1, 1, 1,
-0.01893039, -0.140638, -4.540262, 0, 0.9921569, 1, 1,
-0.01737537, -2.500564, -4.843231, 0, 0.9882353, 1, 1,
-0.01546759, -0.3900662, -3.575544, 0, 0.9803922, 1, 1,
-0.01373324, -1.497438, -3.316767, 0, 0.9764706, 1, 1,
-0.01306157, -0.1877086, -2.173643, 0, 0.9686275, 1, 1,
-0.006107443, -0.4319986, -1.490023, 0, 0.9647059, 1, 1,
-0.005659466, -0.8479041, -2.923448, 0, 0.9568627, 1, 1,
0.004885079, -0.1058525, 2.349568, 0, 0.9529412, 1, 1,
0.004919697, -0.7391896, 4.495595, 0, 0.945098, 1, 1,
0.005729725, -0.7000178, 4.071477, 0, 0.9411765, 1, 1,
0.00593229, -0.3758046, 5.313649, 0, 0.9333333, 1, 1,
0.009631434, -0.1182161, 4.356902, 0, 0.9294118, 1, 1,
0.01289574, -0.2409044, 4.705598, 0, 0.9215686, 1, 1,
0.02051507, 0.434223, -0.2411885, 0, 0.9176471, 1, 1,
0.02217791, -1.521327, 4.256353, 0, 0.9098039, 1, 1,
0.02287564, 0.2466325, -1.262265, 0, 0.9058824, 1, 1,
0.02910022, 0.849551, -0.9690316, 0, 0.8980392, 1, 1,
0.03372062, 0.009764319, 1.569421, 0, 0.8901961, 1, 1,
0.03556548, -0.4683177, 2.947698, 0, 0.8862745, 1, 1,
0.03619663, 0.4300159, -1.281158, 0, 0.8784314, 1, 1,
0.04326723, 0.3518975, -1.561811, 0, 0.8745098, 1, 1,
0.04353566, -0.6365691, 3.528693, 0, 0.8666667, 1, 1,
0.04489375, 0.09272577, 1.383788, 0, 0.8627451, 1, 1,
0.04924309, 0.0646484, 1.185138, 0, 0.854902, 1, 1,
0.05323906, 1.110897, 0.435063, 0, 0.8509804, 1, 1,
0.05431085, 0.03555857, 0.2011022, 0, 0.8431373, 1, 1,
0.05556753, 1.546956, 0.6860162, 0, 0.8392157, 1, 1,
0.05596972, -0.3110937, 1.776244, 0, 0.8313726, 1, 1,
0.05697563, -0.8694423, 2.092087, 0, 0.827451, 1, 1,
0.05765592, 0.6247019, -0.353209, 0, 0.8196079, 1, 1,
0.05967731, -0.9186789, 1.434841, 0, 0.8156863, 1, 1,
0.05998417, -1.635795, 3.739141, 0, 0.8078431, 1, 1,
0.06104523, -1.689203, 3.874342, 0, 0.8039216, 1, 1,
0.06335089, 1.228406, 0.8633805, 0, 0.7960784, 1, 1,
0.06579974, -1.108296, 3.823874, 0, 0.7882353, 1, 1,
0.06874882, 0.6918702, 0.8438941, 0, 0.7843137, 1, 1,
0.07181877, 0.01806808, 0.8601572, 0, 0.7764706, 1, 1,
0.07302473, -0.7018487, 3.870637, 0, 0.772549, 1, 1,
0.07816641, -1.585237, 3.223034, 0, 0.7647059, 1, 1,
0.08065353, -1.150711, 3.017755, 0, 0.7607843, 1, 1,
0.08610091, 1.333309, -0.699801, 0, 0.7529412, 1, 1,
0.08768244, 0.5181718, 0.9375501, 0, 0.7490196, 1, 1,
0.08806618, 0.6545875, 1.254824, 0, 0.7411765, 1, 1,
0.09163577, -0.7358817, 2.210639, 0, 0.7372549, 1, 1,
0.09472244, -0.03559577, 1.663468, 0, 0.7294118, 1, 1,
0.09648982, 1.392804, -0.5685707, 0, 0.7254902, 1, 1,
0.09775934, -1.719497, 5.00811, 0, 0.7176471, 1, 1,
0.1016136, -0.3052585, 3.010814, 0, 0.7137255, 1, 1,
0.1052011, 2.1803, 0.2943658, 0, 0.7058824, 1, 1,
0.1063617, -0.4638198, 3.61093, 0, 0.6980392, 1, 1,
0.106495, -0.4198506, 1.029135, 0, 0.6941177, 1, 1,
0.1084848, 0.9058906, 0.9931056, 0, 0.6862745, 1, 1,
0.1105631, 0.4015948, 1.225873, 0, 0.682353, 1, 1,
0.1138869, 1.707962, 0.7818093, 0, 0.6745098, 1, 1,
0.1176454, -0.9038713, 2.407614, 0, 0.6705883, 1, 1,
0.118478, -0.2427577, 4.02029, 0, 0.6627451, 1, 1,
0.1209843, -0.01544836, 2.507435, 0, 0.6588235, 1, 1,
0.1236293, 1.414905, -1.796193, 0, 0.6509804, 1, 1,
0.1261066, 0.790298, -0.7971, 0, 0.6470588, 1, 1,
0.1268709, 0.1300115, 2.060493, 0, 0.6392157, 1, 1,
0.1279502, 2.072778, -0.1104173, 0, 0.6352941, 1, 1,
0.1289692, 2.952546, 0.7934563, 0, 0.627451, 1, 1,
0.1291245, -0.4036137, 1.441768, 0, 0.6235294, 1, 1,
0.1293643, 2.340845, 0.5535923, 0, 0.6156863, 1, 1,
0.1362774, -0.5217745, 3.809553, 0, 0.6117647, 1, 1,
0.1451776, -0.6490492, 2.433793, 0, 0.6039216, 1, 1,
0.1474459, 0.9091336, -1.38902, 0, 0.5960785, 1, 1,
0.1484299, 0.5089245, 1.190842, 0, 0.5921569, 1, 1,
0.1502998, 0.2022756, 1.57261, 0, 0.5843138, 1, 1,
0.1513253, 1.244392, -0.5796731, 0, 0.5803922, 1, 1,
0.1545965, 1.176399, 0.404051, 0, 0.572549, 1, 1,
0.1590444, 0.2487932, -0.6220421, 0, 0.5686275, 1, 1,
0.1640928, -1.227668, 2.11599, 0, 0.5607843, 1, 1,
0.165527, -0.5175033, 2.88259, 0, 0.5568628, 1, 1,
0.1668556, -1.312805, 1.266771, 0, 0.5490196, 1, 1,
0.1696012, 0.5187271, -0.245941, 0, 0.5450981, 1, 1,
0.1771285, 1.582491, 0.9098629, 0, 0.5372549, 1, 1,
0.1805168, -1.773444, 2.563316, 0, 0.5333334, 1, 1,
0.1831696, 1.00677, -1.351768, 0, 0.5254902, 1, 1,
0.1870299, -0.9019662, 2.342825, 0, 0.5215687, 1, 1,
0.1872004, -1.515932, 2.648885, 0, 0.5137255, 1, 1,
0.1872855, -0.7231929, 3.077278, 0, 0.509804, 1, 1,
0.1877944, 0.5128063, 1.191033, 0, 0.5019608, 1, 1,
0.1955962, 0.2696317, 0.8365297, 0, 0.4941176, 1, 1,
0.2008812, 0.648136, -0.3165396, 0, 0.4901961, 1, 1,
0.2077326, 0.5095938, 0.9915943, 0, 0.4823529, 1, 1,
0.2121707, -0.068577, 2.910354, 0, 0.4784314, 1, 1,
0.2186513, -0.04103565, 1.860751, 0, 0.4705882, 1, 1,
0.2190398, 0.5564554, -0.9597472, 0, 0.4666667, 1, 1,
0.2218077, 0.4433449, 1.94343, 0, 0.4588235, 1, 1,
0.2266967, 0.6607609, -0.02050271, 0, 0.454902, 1, 1,
0.2350326, -0.5509858, 1.974153, 0, 0.4470588, 1, 1,
0.2374962, 1.634042, -0.2473969, 0, 0.4431373, 1, 1,
0.2390438, 0.5499183, 0.7699468, 0, 0.4352941, 1, 1,
0.2402293, -0.4321302, 2.110043, 0, 0.4313726, 1, 1,
0.2424245, -0.4052784, 2.702868, 0, 0.4235294, 1, 1,
0.2473577, -1.102765, 3.37858, 0, 0.4196078, 1, 1,
0.2548307, 0.6952227, 2.11722, 0, 0.4117647, 1, 1,
0.2627473, 0.1116999, 1.146345, 0, 0.4078431, 1, 1,
0.265337, -0.710278, 2.050747, 0, 0.4, 1, 1,
0.2707365, 0.1344121, 1.60815, 0, 0.3921569, 1, 1,
0.2714363, 0.1154241, 3.247102, 0, 0.3882353, 1, 1,
0.2720388, -1.118138, 2.895723, 0, 0.3803922, 1, 1,
0.2748792, 0.4833265, -0.8906072, 0, 0.3764706, 1, 1,
0.2752767, -0.1345419, 3.086097, 0, 0.3686275, 1, 1,
0.2814928, -1.056991, 4.322114, 0, 0.3647059, 1, 1,
0.2826566, 0.4998609, 0.3369596, 0, 0.3568628, 1, 1,
0.2838213, -0.6656514, 2.604266, 0, 0.3529412, 1, 1,
0.2859933, 0.4947031, 0.2686573, 0, 0.345098, 1, 1,
0.2896656, -0.1726245, 2.243253, 0, 0.3411765, 1, 1,
0.2911204, 0.5145443, -0.7770649, 0, 0.3333333, 1, 1,
0.2915332, -0.04847106, 3.869958, 0, 0.3294118, 1, 1,
0.2974496, -0.1777068, 2.386402, 0, 0.3215686, 1, 1,
0.3036479, -0.4718293, 2.373802, 0, 0.3176471, 1, 1,
0.3088553, -0.7107189, 3.602689, 0, 0.3098039, 1, 1,
0.3109655, -1.515725, 2.381922, 0, 0.3058824, 1, 1,
0.3171282, 0.1186091, 1.385934, 0, 0.2980392, 1, 1,
0.3172042, 0.8675013, -0.5062132, 0, 0.2901961, 1, 1,
0.318245, 0.5867204, 0.03780632, 0, 0.2862745, 1, 1,
0.3200028, -0.02275295, 0.9900276, 0, 0.2784314, 1, 1,
0.3245319, 1.063183, -0.552824, 0, 0.2745098, 1, 1,
0.3331097, 0.339319, 1.121723, 0, 0.2666667, 1, 1,
0.3350113, 0.7492617, 1.182322, 0, 0.2627451, 1, 1,
0.3358881, -0.3183458, 2.199295, 0, 0.254902, 1, 1,
0.3386593, -0.5831591, 1.959351, 0, 0.2509804, 1, 1,
0.3388016, -1.667594, 3.836509, 0, 0.2431373, 1, 1,
0.3413894, -2.101064, 3.239612, 0, 0.2392157, 1, 1,
0.3458036, 1.38659, 1.456492, 0, 0.2313726, 1, 1,
0.3468758, 0.4532307, 0.1381779, 0, 0.227451, 1, 1,
0.3534628, -0.08911365, 1.228257, 0, 0.2196078, 1, 1,
0.3542906, -0.1876237, 2.044672, 0, 0.2156863, 1, 1,
0.3544793, -0.2156371, 3.322961, 0, 0.2078431, 1, 1,
0.356813, 1.273556, 0.9670179, 0, 0.2039216, 1, 1,
0.3628473, -1.906126, 1.751088, 0, 0.1960784, 1, 1,
0.3804671, 1.298817, 1.131481, 0, 0.1882353, 1, 1,
0.3932773, 1.521363, 0.7128945, 0, 0.1843137, 1, 1,
0.3962168, 0.1544309, 1.295506, 0, 0.1764706, 1, 1,
0.4014863, -0.4159718, 4.482795, 0, 0.172549, 1, 1,
0.4034772, -1.732567, 2.601492, 0, 0.1647059, 1, 1,
0.404447, 0.8557271, 0.5308089, 0, 0.1607843, 1, 1,
0.4046678, 1.661667, 0.3320105, 0, 0.1529412, 1, 1,
0.4077585, 0.7542599, -0.09826967, 0, 0.1490196, 1, 1,
0.4083939, 1.601964, -2.307837, 0, 0.1411765, 1, 1,
0.4113733, 2.949103, 3.097073, 0, 0.1372549, 1, 1,
0.411387, 9.819747e-05, 3.302824, 0, 0.1294118, 1, 1,
0.4161947, 0.2692451, 0.7084349, 0, 0.1254902, 1, 1,
0.4226329, -0.8137796, 3.249999, 0, 0.1176471, 1, 1,
0.4246027, 0.7571649, -0.583374, 0, 0.1137255, 1, 1,
0.4249839, -0.8818884, 2.221636, 0, 0.1058824, 1, 1,
0.4261583, -0.4835823, 2.560019, 0, 0.09803922, 1, 1,
0.4295207, 1.04863, 1.786315, 0, 0.09411765, 1, 1,
0.4319563, 0.2700872, 0.1413966, 0, 0.08627451, 1, 1,
0.4342209, -0.8411939, 2.959873, 0, 0.08235294, 1, 1,
0.4367283, -1.032456, 2.759051, 0, 0.07450981, 1, 1,
0.4446149, -0.461386, 2.762022, 0, 0.07058824, 1, 1,
0.4467014, -2.199645, 3.913615, 0, 0.0627451, 1, 1,
0.4493502, -0.1724688, 4.021311, 0, 0.05882353, 1, 1,
0.4547832, -1.327962, 3.955447, 0, 0.05098039, 1, 1,
0.4610721, -0.2479504, 1.546907, 0, 0.04705882, 1, 1,
0.4617391, -1.05582, 1.551768, 0, 0.03921569, 1, 1,
0.4619986, -0.3913585, 2.527672, 0, 0.03529412, 1, 1,
0.4637578, 0.8002003, 2.490416, 0, 0.02745098, 1, 1,
0.4640309, -1.183277, 3.215316, 0, 0.02352941, 1, 1,
0.4694537, -1.094167, 3.669443, 0, 0.01568628, 1, 1,
0.4707043, -1.205973, 1.160747, 0, 0.01176471, 1, 1,
0.4746035, 1.161333, 1.727615, 0, 0.003921569, 1, 1,
0.4746531, -0.8627566, 2.385513, 0.003921569, 0, 1, 1,
0.4751208, 1.288561, 0.8283927, 0.007843138, 0, 1, 1,
0.4762577, -0.5031873, 2.529954, 0.01568628, 0, 1, 1,
0.4791638, 0.292864, 1.838599, 0.01960784, 0, 1, 1,
0.4833569, 0.5472321, 0.8966651, 0.02745098, 0, 1, 1,
0.4913465, -1.231426, 3.726399, 0.03137255, 0, 1, 1,
0.491701, 0.5823901, 1.149082, 0.03921569, 0, 1, 1,
0.4948097, -0.208477, 2.044987, 0.04313726, 0, 1, 1,
0.4986924, -0.2273991, 1.321389, 0.05098039, 0, 1, 1,
0.5005534, -0.5034477, 0.4871644, 0.05490196, 0, 1, 1,
0.5006169, 0.3871958, 0.656581, 0.0627451, 0, 1, 1,
0.5046487, -0.7297236, 2.379751, 0.06666667, 0, 1, 1,
0.5068106, -0.1073879, 2.698392, 0.07450981, 0, 1, 1,
0.5094085, -0.2709806, 2.488793, 0.07843138, 0, 1, 1,
0.510033, -1.358068, 2.867439, 0.08627451, 0, 1, 1,
0.5146765, -1.848389, 4.466279, 0.09019608, 0, 1, 1,
0.5153325, 1.896801, -0.2620373, 0.09803922, 0, 1, 1,
0.5240795, -1.1157, 1.72666, 0.1058824, 0, 1, 1,
0.5288809, -1.214955, 1.323682, 0.1098039, 0, 1, 1,
0.5365475, -1.297509, 4.378525, 0.1176471, 0, 1, 1,
0.5401931, 0.4690812, 0.8979379, 0.1215686, 0, 1, 1,
0.543728, 1.98441, 0.01262698, 0.1294118, 0, 1, 1,
0.548226, 0.3819902, 1.780121, 0.1333333, 0, 1, 1,
0.5492824, 2.194161, 1.330031, 0.1411765, 0, 1, 1,
0.5542107, -0.07633839, 3.195233, 0.145098, 0, 1, 1,
0.5564312, -0.957541, 4.017195, 0.1529412, 0, 1, 1,
0.5571424, -0.1821933, 0.9605902, 0.1568628, 0, 1, 1,
0.5646762, -1.033527, 1.616457, 0.1647059, 0, 1, 1,
0.5701162, 0.2286642, 0.2194949, 0.1686275, 0, 1, 1,
0.5704006, -0.7585225, 2.993432, 0.1764706, 0, 1, 1,
0.5716934, -0.849598, 1.708962, 0.1803922, 0, 1, 1,
0.5718053, 0.1487744, 3.334265, 0.1882353, 0, 1, 1,
0.5745978, -2.495538, 3.733052, 0.1921569, 0, 1, 1,
0.5844188, 1.24953, 2.080893, 0.2, 0, 1, 1,
0.5893505, 0.8477526, 0.08330455, 0.2078431, 0, 1, 1,
0.5907778, -0.6578357, 1.864272, 0.2117647, 0, 1, 1,
0.5958929, -0.2015316, 0.4859937, 0.2196078, 0, 1, 1,
0.5964007, 0.5375069, -0.4768758, 0.2235294, 0, 1, 1,
0.5974717, 0.7215478, -0.1794176, 0.2313726, 0, 1, 1,
0.598214, 2.830179, 0.3885878, 0.2352941, 0, 1, 1,
0.5991454, -1.662362, 4.035312, 0.2431373, 0, 1, 1,
0.6062633, -0.08090778, 1.708998, 0.2470588, 0, 1, 1,
0.6079649, -0.6416179, 2.133924, 0.254902, 0, 1, 1,
0.608522, -0.1330561, 1.96177, 0.2588235, 0, 1, 1,
0.6127006, -0.6156541, 2.786107, 0.2666667, 0, 1, 1,
0.6133546, -1.355345, 3.69479, 0.2705882, 0, 1, 1,
0.6190469, 0.5607858, 1.49068, 0.2784314, 0, 1, 1,
0.6324177, 1.457514, -0.1665785, 0.282353, 0, 1, 1,
0.6341269, 1.40831, 1.137997, 0.2901961, 0, 1, 1,
0.6382251, -0.9567414, 1.19448, 0.2941177, 0, 1, 1,
0.6410945, -0.4736178, 1.745638, 0.3019608, 0, 1, 1,
0.6431413, -0.8751182, 3.370383, 0.3098039, 0, 1, 1,
0.6536989, -0.09585097, 1.21124, 0.3137255, 0, 1, 1,
0.6544175, 1.323948, -0.1808383, 0.3215686, 0, 1, 1,
0.6607437, 0.1914215, 1.909678, 0.3254902, 0, 1, 1,
0.6615981, -0.839196, 2.752423, 0.3333333, 0, 1, 1,
0.6705515, 0.2980314, 2.237302, 0.3372549, 0, 1, 1,
0.6724114, -0.5446979, 0.918579, 0.345098, 0, 1, 1,
0.6760699, 1.373825, 1.162052, 0.3490196, 0, 1, 1,
0.6781735, 0.8358984, 0.5319299, 0.3568628, 0, 1, 1,
0.6802737, -0.8675194, 2.63311, 0.3607843, 0, 1, 1,
0.6805111, -0.2214026, 2.0752, 0.3686275, 0, 1, 1,
0.6817783, -0.1067642, 0.8588836, 0.372549, 0, 1, 1,
0.6828074, -0.5955835, 1.31367, 0.3803922, 0, 1, 1,
0.6850704, -0.3921939, 2.376098, 0.3843137, 0, 1, 1,
0.6889998, 1.965485, -1.919858, 0.3921569, 0, 1, 1,
0.6925886, -1.9284, 2.663994, 0.3960784, 0, 1, 1,
0.6941039, -0.4125966, 2.224384, 0.4039216, 0, 1, 1,
0.6976618, -1.15315, 1.275779, 0.4117647, 0, 1, 1,
0.7042732, -0.520186, 3.913095, 0.4156863, 0, 1, 1,
0.7070028, 0.9567819, 2.689709, 0.4235294, 0, 1, 1,
0.7120926, 0.08078936, 0.03604258, 0.427451, 0, 1, 1,
0.7130524, -1.762198, 3.669834, 0.4352941, 0, 1, 1,
0.7171177, -0.231751, 2.952561, 0.4392157, 0, 1, 1,
0.7181906, 0.8645265, 0.5711619, 0.4470588, 0, 1, 1,
0.7223385, -0.3782428, 2.549079, 0.4509804, 0, 1, 1,
0.7244475, -2.151442, 3.100156, 0.4588235, 0, 1, 1,
0.7394536, -0.7224331, 2.959998, 0.4627451, 0, 1, 1,
0.7403291, 0.7002057, 2.073986, 0.4705882, 0, 1, 1,
0.7614616, -0.7288958, 3.63826, 0.4745098, 0, 1, 1,
0.7623189, 1.539428, -0.3093923, 0.4823529, 0, 1, 1,
0.7626256, 0.7534693, 0.5448604, 0.4862745, 0, 1, 1,
0.7640193, -0.7321832, 2.605034, 0.4941176, 0, 1, 1,
0.7664148, -0.9545202, 3.096366, 0.5019608, 0, 1, 1,
0.768005, -2.23742, 2.300628, 0.5058824, 0, 1, 1,
0.7701223, 0.9261845, 1.374938, 0.5137255, 0, 1, 1,
0.7721252, -2.272097, 0.2296765, 0.5176471, 0, 1, 1,
0.7748672, -0.5422463, 1.387665, 0.5254902, 0, 1, 1,
0.7753775, -0.3696406, 3.974529, 0.5294118, 0, 1, 1,
0.7805369, 0.9476478, -0.3053065, 0.5372549, 0, 1, 1,
0.7841131, 0.1714625, 1.652282, 0.5411765, 0, 1, 1,
0.7866539, 0.7559091, -0.03075049, 0.5490196, 0, 1, 1,
0.786958, 0.4535177, 0.971992, 0.5529412, 0, 1, 1,
0.7955836, 0.3446687, 1.567389, 0.5607843, 0, 1, 1,
0.8108236, -1.806745, 4.140058, 0.5647059, 0, 1, 1,
0.8174481, 1.076739, -0.1772571, 0.572549, 0, 1, 1,
0.8188151, 0.4691751, -0.1787626, 0.5764706, 0, 1, 1,
0.8188956, -1.144048, 3.810205, 0.5843138, 0, 1, 1,
0.8217344, 0.5532467, -1.643709, 0.5882353, 0, 1, 1,
0.8241816, 0.3099899, 0.3881485, 0.5960785, 0, 1, 1,
0.8303621, 0.7953448, 1.390121, 0.6039216, 0, 1, 1,
0.8314231, -1.120193, 2.507607, 0.6078432, 0, 1, 1,
0.832368, -0.370386, 1.193014, 0.6156863, 0, 1, 1,
0.8375587, -1.106474, 4.097321, 0.6196079, 0, 1, 1,
0.8422366, -0.6474762, 1.772085, 0.627451, 0, 1, 1,
0.8514301, 0.983997, 1.598438, 0.6313726, 0, 1, 1,
0.856366, 0.2409047, -0.1543261, 0.6392157, 0, 1, 1,
0.8581283, 0.9592053, -0.140838, 0.6431373, 0, 1, 1,
0.8595305, -0.7407525, 0.9153525, 0.6509804, 0, 1, 1,
0.8596465, 0.5872961, 1.929695, 0.654902, 0, 1, 1,
0.8614998, 0.4548429, 1.119876, 0.6627451, 0, 1, 1,
0.8638223, 0.5704864, 1.510113, 0.6666667, 0, 1, 1,
0.8649352, 0.2122432, 2.130363, 0.6745098, 0, 1, 1,
0.8686461, 0.6521485, 0.4027897, 0.6784314, 0, 1, 1,
0.8697409, -1.449991, 0.6649171, 0.6862745, 0, 1, 1,
0.8705353, 1.723812, 0.2121858, 0.6901961, 0, 1, 1,
0.8832286, 0.4496798, 0.8611303, 0.6980392, 0, 1, 1,
0.8844458, 0.03413019, 0.6746964, 0.7058824, 0, 1, 1,
0.8989427, 0.4378017, 3.034996, 0.7098039, 0, 1, 1,
0.902083, 0.1735383, 0.7612218, 0.7176471, 0, 1, 1,
0.9024925, -0.3597701, 2.164256, 0.7215686, 0, 1, 1,
0.9059026, -1.190481, 1.931407, 0.7294118, 0, 1, 1,
0.9204587, 1.332776, 1.606827, 0.7333333, 0, 1, 1,
0.9275133, 0.05047018, 2.831867, 0.7411765, 0, 1, 1,
0.9298897, 0.3893763, 1.148244, 0.7450981, 0, 1, 1,
0.930672, -0.3642959, 1.395411, 0.7529412, 0, 1, 1,
0.9348448, -1.447657, 3.608855, 0.7568628, 0, 1, 1,
0.9368712, -0.181302, 2.574514, 0.7647059, 0, 1, 1,
0.9450051, -0.08615068, 1.184755, 0.7686275, 0, 1, 1,
0.9458632, -0.3401737, 2.57532, 0.7764706, 0, 1, 1,
0.9488918, 1.451, -0.4134069, 0.7803922, 0, 1, 1,
0.9518157, -0.04655522, 0.1762971, 0.7882353, 0, 1, 1,
0.9543351, 0.2962415, -0.8667431, 0.7921569, 0, 1, 1,
0.9552637, -0.0271091, 3.259832, 0.8, 0, 1, 1,
0.9591815, 0.9082804, -0.3731559, 0.8078431, 0, 1, 1,
0.9621418, 0.01550755, 2.325346, 0.8117647, 0, 1, 1,
0.9627025, -0.1110253, 1.437282, 0.8196079, 0, 1, 1,
0.9634936, 0.4870505, -0.04220144, 0.8235294, 0, 1, 1,
0.9661293, 0.4484152, 1.139766, 0.8313726, 0, 1, 1,
0.9663071, -0.9602347, 3.346541, 0.8352941, 0, 1, 1,
0.9796622, -0.002901388, 1.13715, 0.8431373, 0, 1, 1,
0.9826759, -0.7314004, 1.360724, 0.8470588, 0, 1, 1,
0.9832436, 1.760831, 0.1378448, 0.854902, 0, 1, 1,
0.9834645, 0.5120715, 0.5503861, 0.8588235, 0, 1, 1,
0.9911801, -0.5897614, 2.633089, 0.8666667, 0, 1, 1,
0.992617, 0.6557683, 0.5493481, 0.8705882, 0, 1, 1,
0.9940323, -0.6192768, 2.462263, 0.8784314, 0, 1, 1,
0.999813, 0.03453512, 1.722331, 0.8823529, 0, 1, 1,
1.002689, -0.9827105, 3.870649, 0.8901961, 0, 1, 1,
1.010068, 0.8463889, 1.252547, 0.8941177, 0, 1, 1,
1.015754, 0.7415017, 1.627752, 0.9019608, 0, 1, 1,
1.019561, -2.232829, 2.066047, 0.9098039, 0, 1, 1,
1.026273, 0.2766436, 0.1362122, 0.9137255, 0, 1, 1,
1.027277, -0.1959946, -0.1175525, 0.9215686, 0, 1, 1,
1.028145, 0.8334228, 0.9242724, 0.9254902, 0, 1, 1,
1.031034, 1.302003, 1.991467, 0.9333333, 0, 1, 1,
1.031812, 0.7804886, -0.06951683, 0.9372549, 0, 1, 1,
1.032194, -0.8433052, 1.839934, 0.945098, 0, 1, 1,
1.032449, -0.6531278, 1.964737, 0.9490196, 0, 1, 1,
1.040512, -0.6345819, 1.162658, 0.9568627, 0, 1, 1,
1.054516, 1.291677, 0.140822, 0.9607843, 0, 1, 1,
1.056841, -0.9244452, 2.82437, 0.9686275, 0, 1, 1,
1.063963, 0.8177316, 0.380875, 0.972549, 0, 1, 1,
1.064279, 1.105047, 0.3630008, 0.9803922, 0, 1, 1,
1.067011, -0.2083865, 1.550149, 0.9843137, 0, 1, 1,
1.067742, -0.6012005, 0.731266, 0.9921569, 0, 1, 1,
1.078612, -2.158602, 2.013844, 0.9960784, 0, 1, 1,
1.086371, 2.015663, 0.9334836, 1, 0, 0.9960784, 1,
1.094677, 0.7407731, 0.2000562, 1, 0, 0.9882353, 1,
1.095597, 1.220214, 0.1058048, 1, 0, 0.9843137, 1,
1.097726, 0.5122045, 0.3186944, 1, 0, 0.9764706, 1,
1.099216, 0.6921788, 0.9145473, 1, 0, 0.972549, 1,
1.101287, -1.039055, 1.281838, 1, 0, 0.9647059, 1,
1.102751, 1.229817, -0.8093442, 1, 0, 0.9607843, 1,
1.117404, 0.09155025, 1.920911, 1, 0, 0.9529412, 1,
1.121901, -0.6106613, 1.00342, 1, 0, 0.9490196, 1,
1.13093, -0.4061501, 1.927919, 1, 0, 0.9411765, 1,
1.13457, 1.249992, 2.061989, 1, 0, 0.9372549, 1,
1.137622, -1.602386, 3.200045, 1, 0, 0.9294118, 1,
1.145176, -0.9424628, 3.248618, 1, 0, 0.9254902, 1,
1.162089, 0.9993731, 2.794667, 1, 0, 0.9176471, 1,
1.163683, 0.8197345, 0.5083171, 1, 0, 0.9137255, 1,
1.170344, -0.5235206, 0.381371, 1, 0, 0.9058824, 1,
1.176856, -1.713495, 2.204263, 1, 0, 0.9019608, 1,
1.180208, -1.803913, 2.26755, 1, 0, 0.8941177, 1,
1.199681, 0.1247733, -0.06315205, 1, 0, 0.8862745, 1,
1.199934, 1.012093, 0.4679074, 1, 0, 0.8823529, 1,
1.208372, -0.4462552, 1.68735, 1, 0, 0.8745098, 1,
1.219557, 1.698795, 0.2362082, 1, 0, 0.8705882, 1,
1.221326, -2.334234, 2.654759, 1, 0, 0.8627451, 1,
1.22852, -0.3166914, 2.140903, 1, 0, 0.8588235, 1,
1.230338, -0.7282304, 3.414959, 1, 0, 0.8509804, 1,
1.233037, 0.2183919, 0.9880244, 1, 0, 0.8470588, 1,
1.243616, 1.180104, 0.2855883, 1, 0, 0.8392157, 1,
1.243864, -0.9237687, 2.100361, 1, 0, 0.8352941, 1,
1.24563, 1.437486, 0.2676021, 1, 0, 0.827451, 1,
1.256801, 1.68229, -0.2344011, 1, 0, 0.8235294, 1,
1.2572, -1.284429, -0.0588861, 1, 0, 0.8156863, 1,
1.259763, 1.523683, 1.097514, 1, 0, 0.8117647, 1,
1.264632, 0.5673943, 0.5729717, 1, 0, 0.8039216, 1,
1.266034, -1.758595, 4.851322, 1, 0, 0.7960784, 1,
1.267644, -0.1332687, -1.103212, 1, 0, 0.7921569, 1,
1.273543, -0.4318315, 0.01195526, 1, 0, 0.7843137, 1,
1.276282, 0.1610995, 2.390356, 1, 0, 0.7803922, 1,
1.277542, -0.7436718, 1.861074, 1, 0, 0.772549, 1,
1.280364, 0.4401039, 2.125651, 1, 0, 0.7686275, 1,
1.28424, -0.1501759, 2.871565, 1, 0, 0.7607843, 1,
1.286764, -0.4080812, 3.39414, 1, 0, 0.7568628, 1,
1.299334, -0.1941212, 2.963336, 1, 0, 0.7490196, 1,
1.300294, -1.770047, 3.030185, 1, 0, 0.7450981, 1,
1.300585, 0.2096022, -0.6962554, 1, 0, 0.7372549, 1,
1.300986, 0.1563685, 3.052388, 1, 0, 0.7333333, 1,
1.302951, -0.7648032, 5.067512, 1, 0, 0.7254902, 1,
1.308019, 2.062675, 0.3814949, 1, 0, 0.7215686, 1,
1.312355, -0.01852817, 2.929703, 1, 0, 0.7137255, 1,
1.312408, -0.4889497, 0.3234242, 1, 0, 0.7098039, 1,
1.321917, -0.01511275, 1.987797, 1, 0, 0.7019608, 1,
1.328105, -0.2626969, 0.1364938, 1, 0, 0.6941177, 1,
1.332994, 0.5597198, -0.7509729, 1, 0, 0.6901961, 1,
1.33654, 0.8125965, 1.594147, 1, 0, 0.682353, 1,
1.337125, 1.041923, -0.506463, 1, 0, 0.6784314, 1,
1.362962, 0.8851447, -0.2964912, 1, 0, 0.6705883, 1,
1.36362, -0.4965369, 3.824069, 1, 0, 0.6666667, 1,
1.3716, -0.629347, 3.093504, 1, 0, 0.6588235, 1,
1.375401, 0.2852988, 0.4967867, 1, 0, 0.654902, 1,
1.384754, 1.804764, 0.05632097, 1, 0, 0.6470588, 1,
1.397529, -0.6399699, 1.136397, 1, 0, 0.6431373, 1,
1.398788, 0.7019213, 0.3315795, 1, 0, 0.6352941, 1,
1.400268, -1.762207, 4.45758, 1, 0, 0.6313726, 1,
1.408697, -0.613918, 1.863923, 1, 0, 0.6235294, 1,
1.414947, 0.3361392, 1.389069, 1, 0, 0.6196079, 1,
1.423107, 0.2635827, 0.2591643, 1, 0, 0.6117647, 1,
1.4248, -0.540481, 2.327183, 1, 0, 0.6078432, 1,
1.430616, -0.3375073, 3.001155, 1, 0, 0.6, 1,
1.443068, 0.305109, 2.587752, 1, 0, 0.5921569, 1,
1.443645, 0.6621719, 1.631734, 1, 0, 0.5882353, 1,
1.455884, -0.4145391, 2.355513, 1, 0, 0.5803922, 1,
1.456611, 0.569995, 2.209215, 1, 0, 0.5764706, 1,
1.464141, 0.359663, -0.2432136, 1, 0, 0.5686275, 1,
1.467043, 0.6842288, 2.363761, 1, 0, 0.5647059, 1,
1.470489, -2.111994, 3.200003, 1, 0, 0.5568628, 1,
1.478897, -1.042815, -0.2703831, 1, 0, 0.5529412, 1,
1.481408, 0.1830136, 1.364073, 1, 0, 0.5450981, 1,
1.484749, -0.0489979, 1.933166, 1, 0, 0.5411765, 1,
1.49154, 0.5201722, 0.6332895, 1, 0, 0.5333334, 1,
1.494195, -0.2941138, 3.183674, 1, 0, 0.5294118, 1,
1.495524, 0.9574866, 0.7167715, 1, 0, 0.5215687, 1,
1.49613, 0.6855462, 1.445199, 1, 0, 0.5176471, 1,
1.504555, 0.263623, -0.09395473, 1, 0, 0.509804, 1,
1.505335, 2.089134, 0.5175821, 1, 0, 0.5058824, 1,
1.51795, 0.1860428, 0.7480997, 1, 0, 0.4980392, 1,
1.526471, 0.3639714, 0.9369335, 1, 0, 0.4901961, 1,
1.53166, 0.778172, 1.275282, 1, 0, 0.4862745, 1,
1.533609, 0.5247284, 0.5423123, 1, 0, 0.4784314, 1,
1.533853, 0.4911539, 0.263568, 1, 0, 0.4745098, 1,
1.538331, 0.8060732, 1.521841, 1, 0, 0.4666667, 1,
1.557769, -0.5554292, 2.537273, 1, 0, 0.4627451, 1,
1.561661, 0.1697478, 0.8835405, 1, 0, 0.454902, 1,
1.57243, -0.6141943, 0.8194946, 1, 0, 0.4509804, 1,
1.581739, 0.6397528, 1.802981, 1, 0, 0.4431373, 1,
1.595464, -0.1022577, 1.805884, 1, 0, 0.4392157, 1,
1.609706, 0.01603894, 2.250362, 1, 0, 0.4313726, 1,
1.612936, -0.05421665, 1.668843, 1, 0, 0.427451, 1,
1.620482, 1.574668, 1.453849, 1, 0, 0.4196078, 1,
1.621145, 1.289965, 1.729206, 1, 0, 0.4156863, 1,
1.624918, 1.91206, 1.778569, 1, 0, 0.4078431, 1,
1.627308, -0.6434644, 1.550545, 1, 0, 0.4039216, 1,
1.631692, 1.169185, -1.677699, 1, 0, 0.3960784, 1,
1.640192, -0.2165749, 0.7889062, 1, 0, 0.3882353, 1,
1.654317, -1.096146, 1.601615, 1, 0, 0.3843137, 1,
1.675241, -0.8815072, 1.886823, 1, 0, 0.3764706, 1,
1.68527, 1.438058, 0.7478213, 1, 0, 0.372549, 1,
1.687981, 0.6468939, 2.9943, 1, 0, 0.3647059, 1,
1.693566, 1.255983, 0.9161673, 1, 0, 0.3607843, 1,
1.702709, -0.3665738, -0.09105453, 1, 0, 0.3529412, 1,
1.718231, 0.08090171, 1.329466, 1, 0, 0.3490196, 1,
1.72035, 0.8507756, 2.765471, 1, 0, 0.3411765, 1,
1.726098, -1.459846, 3.043867, 1, 0, 0.3372549, 1,
1.738801, 0.6039268, -0.6106387, 1, 0, 0.3294118, 1,
1.739586, -0.9814305, 1.895734, 1, 0, 0.3254902, 1,
1.751784, -0.2491718, 2.787033, 1, 0, 0.3176471, 1,
1.774149, -0.1492873, 2.798864, 1, 0, 0.3137255, 1,
1.795994, 1.372779, -0.08681232, 1, 0, 0.3058824, 1,
1.815179, 0.6580324, 0.9306924, 1, 0, 0.2980392, 1,
1.844949, 1.100748, 1.286003, 1, 0, 0.2941177, 1,
1.858469, -1.587725, 1.453317, 1, 0, 0.2862745, 1,
1.871199, 0.6797649, -0.3416068, 1, 0, 0.282353, 1,
1.877027, -0.2825606, 1.169917, 1, 0, 0.2745098, 1,
1.880713, -2.565929, 2.321702, 1, 0, 0.2705882, 1,
1.881071, -0.3425421, 0.9361997, 1, 0, 0.2627451, 1,
1.88705, 0.3298777, -0.2300737, 1, 0, 0.2588235, 1,
1.926626, -0.01912488, 0.2448769, 1, 0, 0.2509804, 1,
1.934719, 0.949385, -0.00181138, 1, 0, 0.2470588, 1,
1.945134, -0.776166, 2.97788, 1, 0, 0.2392157, 1,
1.956253, 0.2662941, 1.18132, 1, 0, 0.2352941, 1,
1.962883, -0.3615385, 2.094349, 1, 0, 0.227451, 1,
1.969321, -1.07816, 2.14735, 1, 0, 0.2235294, 1,
1.984138, -0.6589518, 0.5929775, 1, 0, 0.2156863, 1,
1.989477, -1.195283, 2.460254, 1, 0, 0.2117647, 1,
2.014332, -0.2033219, 1.914558, 1, 0, 0.2039216, 1,
2.017327, -0.1191804, 1.957916, 1, 0, 0.1960784, 1,
2.019639, 1.644287, 1.796296, 1, 0, 0.1921569, 1,
2.026041, 0.719122, 2.864322, 1, 0, 0.1843137, 1,
2.029898, 0.2588919, 2.141764, 1, 0, 0.1803922, 1,
2.079546, -0.1717166, 1.478666, 1, 0, 0.172549, 1,
2.085443, -1.223918, 3.256468, 1, 0, 0.1686275, 1,
2.088393, 0.5610111, 0.3551807, 1, 0, 0.1607843, 1,
2.103163, -0.5095434, 2.833564, 1, 0, 0.1568628, 1,
2.137738, 0.7470063, 1.011161, 1, 0, 0.1490196, 1,
2.164867, -1.54329, 2.30463, 1, 0, 0.145098, 1,
2.165136, -0.1234999, 0.8137839, 1, 0, 0.1372549, 1,
2.18405, 0.02228865, 0.09963705, 1, 0, 0.1333333, 1,
2.235358, -1.313421, 1.799008, 1, 0, 0.1254902, 1,
2.329779, -0.7188021, 0.420646, 1, 0, 0.1215686, 1,
2.335428, -0.4379872, 2.952296, 1, 0, 0.1137255, 1,
2.358111, 0.1776135, 2.379628, 1, 0, 0.1098039, 1,
2.366635, -0.0649838, 1.459565, 1, 0, 0.1019608, 1,
2.37709, -2.023175, 2.430445, 1, 0, 0.09411765, 1,
2.439973, 0.3791245, -0.6903243, 1, 0, 0.09019608, 1,
2.464154, -0.2731261, 2.582973, 1, 0, 0.08235294, 1,
2.488724, 1.468133, -0.72878, 1, 0, 0.07843138, 1,
2.488746, -0.9788975, 1.978707, 1, 0, 0.07058824, 1,
2.49887, -0.4717837, 0.3307175, 1, 0, 0.06666667, 1,
2.561604, 1.386967, 0.6181877, 1, 0, 0.05882353, 1,
2.564534, 0.4154178, 1.623637, 1, 0, 0.05490196, 1,
2.568718, 0.685576, 0.3538491, 1, 0, 0.04705882, 1,
2.610574, -1.305079, 2.525271, 1, 0, 0.04313726, 1,
2.631567, 0.2316824, 0.7025746, 1, 0, 0.03529412, 1,
2.811593, -0.9704235, 1.583913, 1, 0, 0.03137255, 1,
2.912115, -0.5604529, -0.9864139, 1, 0, 0.02352941, 1,
2.918061, 0.629493, 1.524184, 1, 0, 0.01960784, 1,
3.133619, 1.075607, -0.4059336, 1, 0, 0.01176471, 1,
4.31076, 2.852384, -0.3802681, 1, 0, 0.007843138, 1
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
0.4687003, -4.743937, -8.232579, 0, -0.5, 0.5, 0.5,
0.4687003, -4.743937, -8.232579, 1, -0.5, 0.5, 0.5,
0.4687003, -4.743937, -8.232579, 1, 1.5, 0.5, 0.5,
0.4687003, -4.743937, -8.232579, 0, 1.5, 0.5, 0.5
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
-4.675817, 0.09951448, -8.232579, 0, -0.5, 0.5, 0.5,
-4.675817, 0.09951448, -8.232579, 1, -0.5, 0.5, 0.5,
-4.675817, 0.09951448, -8.232579, 1, 1.5, 0.5, 0.5,
-4.675817, 0.09951448, -8.232579, 0, 1.5, 0.5, 0.5
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
-4.675817, -4.743937, -0.4778125, 0, -0.5, 0.5, 0.5,
-4.675817, -4.743937, -0.4778125, 1, -0.5, 0.5, 0.5,
-4.675817, -4.743937, -0.4778125, 1, 1.5, 0.5, 0.5,
-4.675817, -4.743937, -0.4778125, 0, 1.5, 0.5, 0.5
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
-2, -3.626218, -6.443017,
4, -3.626218, -6.443017,
-2, -3.626218, -6.443017,
-2, -3.812504, -6.741278,
0, -3.626218, -6.443017,
0, -3.812504, -6.741278,
2, -3.626218, -6.443017,
2, -3.812504, -6.741278,
4, -3.626218, -6.443017,
4, -3.812504, -6.741278
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
-2, -4.185078, -7.337798, 0, -0.5, 0.5, 0.5,
-2, -4.185078, -7.337798, 1, -0.5, 0.5, 0.5,
-2, -4.185078, -7.337798, 1, 1.5, 0.5, 0.5,
-2, -4.185078, -7.337798, 0, 1.5, 0.5, 0.5,
0, -4.185078, -7.337798, 0, -0.5, 0.5, 0.5,
0, -4.185078, -7.337798, 1, -0.5, 0.5, 0.5,
0, -4.185078, -7.337798, 1, 1.5, 0.5, 0.5,
0, -4.185078, -7.337798, 0, 1.5, 0.5, 0.5,
2, -4.185078, -7.337798, 0, -0.5, 0.5, 0.5,
2, -4.185078, -7.337798, 1, -0.5, 0.5, 0.5,
2, -4.185078, -7.337798, 1, 1.5, 0.5, 0.5,
2, -4.185078, -7.337798, 0, 1.5, 0.5, 0.5,
4, -4.185078, -7.337798, 0, -0.5, 0.5, 0.5,
4, -4.185078, -7.337798, 1, -0.5, 0.5, 0.5,
4, -4.185078, -7.337798, 1, 1.5, 0.5, 0.5,
4, -4.185078, -7.337798, 0, 1.5, 0.5, 0.5
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
-3.488621, -2, -6.443017,
-3.488621, 2, -6.443017,
-3.488621, -2, -6.443017,
-3.686487, -2, -6.741278,
-3.488621, 0, -6.443017,
-3.686487, 0, -6.741278,
-3.488621, 2, -6.443017,
-3.686487, 2, -6.741278
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
-4.08222, -2, -7.337798, 0, -0.5, 0.5, 0.5,
-4.08222, -2, -7.337798, 1, -0.5, 0.5, 0.5,
-4.08222, -2, -7.337798, 1, 1.5, 0.5, 0.5,
-4.08222, -2, -7.337798, 0, 1.5, 0.5, 0.5,
-4.08222, 0, -7.337798, 0, -0.5, 0.5, 0.5,
-4.08222, 0, -7.337798, 1, -0.5, 0.5, 0.5,
-4.08222, 0, -7.337798, 1, 1.5, 0.5, 0.5,
-4.08222, 0, -7.337798, 0, 1.5, 0.5, 0.5,
-4.08222, 2, -7.337798, 0, -0.5, 0.5, 0.5,
-4.08222, 2, -7.337798, 1, -0.5, 0.5, 0.5,
-4.08222, 2, -7.337798, 1, 1.5, 0.5, 0.5,
-4.08222, 2, -7.337798, 0, 1.5, 0.5, 0.5
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
-3.488621, -3.626218, -6,
-3.488621, -3.626218, 4,
-3.488621, -3.626218, -6,
-3.686487, -3.812504, -6,
-3.488621, -3.626218, -4,
-3.686487, -3.812504, -4,
-3.488621, -3.626218, -2,
-3.686487, -3.812504, -2,
-3.488621, -3.626218, 0,
-3.686487, -3.812504, 0,
-3.488621, -3.626218, 2,
-3.686487, -3.812504, 2,
-3.488621, -3.626218, 4,
-3.686487, -3.812504, 4
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
-4.08222, -4.185078, -6, 0, -0.5, 0.5, 0.5,
-4.08222, -4.185078, -6, 1, -0.5, 0.5, 0.5,
-4.08222, -4.185078, -6, 1, 1.5, 0.5, 0.5,
-4.08222, -4.185078, -6, 0, 1.5, 0.5, 0.5,
-4.08222, -4.185078, -4, 0, -0.5, 0.5, 0.5,
-4.08222, -4.185078, -4, 1, -0.5, 0.5, 0.5,
-4.08222, -4.185078, -4, 1, 1.5, 0.5, 0.5,
-4.08222, -4.185078, -4, 0, 1.5, 0.5, 0.5,
-4.08222, -4.185078, -2, 0, -0.5, 0.5, 0.5,
-4.08222, -4.185078, -2, 1, -0.5, 0.5, 0.5,
-4.08222, -4.185078, -2, 1, 1.5, 0.5, 0.5,
-4.08222, -4.185078, -2, 0, 1.5, 0.5, 0.5,
-4.08222, -4.185078, 0, 0, -0.5, 0.5, 0.5,
-4.08222, -4.185078, 0, 1, -0.5, 0.5, 0.5,
-4.08222, -4.185078, 0, 1, 1.5, 0.5, 0.5,
-4.08222, -4.185078, 0, 0, 1.5, 0.5, 0.5,
-4.08222, -4.185078, 2, 0, -0.5, 0.5, 0.5,
-4.08222, -4.185078, 2, 1, -0.5, 0.5, 0.5,
-4.08222, -4.185078, 2, 1, 1.5, 0.5, 0.5,
-4.08222, -4.185078, 2, 0, 1.5, 0.5, 0.5,
-4.08222, -4.185078, 4, 0, -0.5, 0.5, 0.5,
-4.08222, -4.185078, 4, 1, -0.5, 0.5, 0.5,
-4.08222, -4.185078, 4, 1, 1.5, 0.5, 0.5,
-4.08222, -4.185078, 4, 0, 1.5, 0.5, 0.5
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
-3.488621, -3.626218, -6.443017,
-3.488621, 3.825247, -6.443017,
-3.488621, -3.626218, 5.487392,
-3.488621, 3.825247, 5.487392,
-3.488621, -3.626218, -6.443017,
-3.488621, -3.626218, 5.487392,
-3.488621, 3.825247, -6.443017,
-3.488621, 3.825247, 5.487392,
-3.488621, -3.626218, -6.443017,
4.426022, -3.626218, -6.443017,
-3.488621, -3.626218, 5.487392,
4.426022, -3.626218, 5.487392,
-3.488621, 3.825247, -6.443017,
4.426022, 3.825247, -6.443017,
-3.488621, 3.825247, 5.487392,
4.426022, 3.825247, 5.487392,
4.426022, -3.626218, -6.443017,
4.426022, 3.825247, -6.443017,
4.426022, -3.626218, 5.487392,
4.426022, 3.825247, 5.487392,
4.426022, -3.626218, -6.443017,
4.426022, -3.626218, 5.487392,
4.426022, 3.825247, -6.443017,
4.426022, 3.825247, 5.487392
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
var radius = 8.618463;
var distance = 38.34451;
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
mvMatrix.translate( -0.4687003, -0.09951448, 0.4778125 );
mvMatrix.scale( 1.177368, 1.250553, 0.7810671 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -38.34451);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
diethyl_ester<-read.table("diethyl_ester.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-diethyl_ester$V2
```

```
## Error in eval(expr, envir, enclos): object 'diethyl_ester' not found
```

```r
y<-diethyl_ester$V3
```

```
## Error in eval(expr, envir, enclos): object 'diethyl_ester' not found
```

```r
z<-diethyl_ester$V4
```

```
## Error in eval(expr, envir, enclos): object 'diethyl_ester' not found
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
-3.373359, 0.3256651, -0.6030496, 0, 0, 1, 1, 1,
-3.171512, -0.6668798, -3.533343, 1, 0, 0, 1, 1,
-3.146526, -0.3264808, -0.201736, 1, 0, 0, 1, 1,
-3.07727, -0.4524475, -0.9593564, 1, 0, 0, 1, 1,
-3.066361, -0.5907449, -1.126647, 1, 0, 0, 1, 1,
-2.992745, 0.4329074, -0.4439455, 1, 0, 0, 1, 1,
-2.946277, -2.055841, -3.088144, 0, 0, 0, 1, 1,
-2.735571, -0.6477948, -3.222595, 0, 0, 0, 1, 1,
-2.734386, -1.371339, -2.210276, 0, 0, 0, 1, 1,
-2.373621, 1.231097, -0.3237449, 0, 0, 0, 1, 1,
-2.305462, 0.01973818, -1.936773, 0, 0, 0, 1, 1,
-2.255004, 0.2798798, -2.174191, 0, 0, 0, 1, 1,
-2.243497, 2.132703, -1.095417, 0, 0, 0, 1, 1,
-2.222159, 1.114477, 0.1854809, 1, 1, 1, 1, 1,
-2.20041, -0.4434689, -3.093069, 1, 1, 1, 1, 1,
-2.170856, 0.4993235, -2.494815, 1, 1, 1, 1, 1,
-2.169706, 0.6395217, -2.640075, 1, 1, 1, 1, 1,
-2.151798, -1.303276, -1.798236, 1, 1, 1, 1, 1,
-2.099125, 1.762783, -1.872721, 1, 1, 1, 1, 1,
-2.064677, 0.5806097, -1.246077, 1, 1, 1, 1, 1,
-2.052321, -0.4147137, 0.6375408, 1, 1, 1, 1, 1,
-2.037966, -0.08425815, -2.053205, 1, 1, 1, 1, 1,
-1.999268, 0.9011745, 1.104643, 1, 1, 1, 1, 1,
-1.964135, -2.159477, -3.490779, 1, 1, 1, 1, 1,
-1.916367, -1.0793, -2.23464, 1, 1, 1, 1, 1,
-1.914608, 0.434221, 0.1631957, 1, 1, 1, 1, 1,
-1.902207, -0.331125, -2.202425, 1, 1, 1, 1, 1,
-1.863685, -2.524782, -5.270512, 1, 1, 1, 1, 1,
-1.852966, -0.9070581, -0.729532, 0, 0, 1, 1, 1,
-1.83972, 0.342497, -1.400403, 1, 0, 0, 1, 1,
-1.821043, 0.2999217, -1.394545, 1, 0, 0, 1, 1,
-1.813262, 0.6672698, -1.214796, 1, 0, 0, 1, 1,
-1.812938, -0.4553493, -0.3761138, 1, 0, 0, 1, 1,
-1.812593, -0.1742253, -1.806377, 1, 0, 0, 1, 1,
-1.807983, 0.9143713, -2.59914, 0, 0, 0, 1, 1,
-1.807763, -0.6748766, -3.238968, 0, 0, 0, 1, 1,
-1.800726, -1.903813, -0.6081719, 0, 0, 0, 1, 1,
-1.785267, -2.127935, -3.907179, 0, 0, 0, 1, 1,
-1.781365, 1.779357, 1.708311, 0, 0, 0, 1, 1,
-1.734962, 0.9659854, 0.6252397, 0, 0, 0, 1, 1,
-1.71525, 0.07590005, -1.756801, 0, 0, 0, 1, 1,
-1.710509, 1.057876, -2.553203, 1, 1, 1, 1, 1,
-1.70584, -0.1235482, -1.888857, 1, 1, 1, 1, 1,
-1.67171, 0.1882485, -3.157459, 1, 1, 1, 1, 1,
-1.658255, -0.6381763, -1.216709, 1, 1, 1, 1, 1,
-1.658067, -0.5058376, -1.785617, 1, 1, 1, 1, 1,
-1.646782, 0.4774644, -1.874953, 1, 1, 1, 1, 1,
-1.58641, -0.6384424, -2.323162, 1, 1, 1, 1, 1,
-1.585956, -0.3160291, -3.178723, 1, 1, 1, 1, 1,
-1.580114, 0.2364547, -2.404663, 1, 1, 1, 1, 1,
-1.553572, -0.788166, -1.643516, 1, 1, 1, 1, 1,
-1.53502, 0.4991344, -1.926128, 1, 1, 1, 1, 1,
-1.525425, -1.360985, -2.18492, 1, 1, 1, 1, 1,
-1.522093, 1.20362, -1.811455, 1, 1, 1, 1, 1,
-1.52141, 0.07485443, -1.436471, 1, 1, 1, 1, 1,
-1.499659, -0.7000679, -0.9325446, 1, 1, 1, 1, 1,
-1.49928, -1.919428, -2.103989, 0, 0, 1, 1, 1,
-1.488004, -0.02611942, -3.001232, 1, 0, 0, 1, 1,
-1.474497, 2.157326, -2.588974, 1, 0, 0, 1, 1,
-1.474445, 1.132771, 0.7499301, 1, 0, 0, 1, 1,
-1.469699, 1.600466, -0.5787863, 1, 0, 0, 1, 1,
-1.466005, -0.5850586, -1.954383, 1, 0, 0, 1, 1,
-1.464517, 0.872911, -2.706023, 0, 0, 0, 1, 1,
-1.416997, 0.1800293, -2.309236, 0, 0, 0, 1, 1,
-1.409778, 1.527974, -0.03283386, 0, 0, 0, 1, 1,
-1.407724, 0.6528996, -0.3517672, 0, 0, 0, 1, 1,
-1.392766, 1.196043, 0.3941769, 0, 0, 0, 1, 1,
-1.39147, 1.777081, 0.8196561, 0, 0, 0, 1, 1,
-1.384878, 0.2474035, -1.961609, 0, 0, 0, 1, 1,
-1.384293, 0.5370064, -0.09004365, 1, 1, 1, 1, 1,
-1.369189, -0.8348848, -1.956883, 1, 1, 1, 1, 1,
-1.361604, -1.40635, -2.004639, 1, 1, 1, 1, 1,
-1.348997, 0.4304274, -1.507128, 1, 1, 1, 1, 1,
-1.340608, 0.3146992, -2.019291, 1, 1, 1, 1, 1,
-1.327852, -0.07743641, -1.041218, 1, 1, 1, 1, 1,
-1.323836, -0.6069481, -2.800663, 1, 1, 1, 1, 1,
-1.308763, 0.1804941, -1.074429, 1, 1, 1, 1, 1,
-1.305284, 0.1193513, -1.841267, 1, 1, 1, 1, 1,
-1.300087, 0.647876, -1.990819, 1, 1, 1, 1, 1,
-1.298977, 0.4484536, -1.09229, 1, 1, 1, 1, 1,
-1.295705, -0.5513346, -0.312984, 1, 1, 1, 1, 1,
-1.291938, -1.255751, -2.205816, 1, 1, 1, 1, 1,
-1.291324, 2.149623, -0.06537369, 1, 1, 1, 1, 1,
-1.287325, 0.7365626, -1.757365, 1, 1, 1, 1, 1,
-1.286965, 0.02477757, -0.5572539, 0, 0, 1, 1, 1,
-1.267196, 0.8038096, -1.448304, 1, 0, 0, 1, 1,
-1.264413, -0.1494745, -3.264803, 1, 0, 0, 1, 1,
-1.255844, -0.2900347, -0.3449985, 1, 0, 0, 1, 1,
-1.246097, -0.5292309, -1.838467, 1, 0, 0, 1, 1,
-1.242511, -2.385209, -3.679942, 1, 0, 0, 1, 1,
-1.240715, -0.1691505, -1.695344, 0, 0, 0, 1, 1,
-1.230748, -0.06867076, -1.19564, 0, 0, 0, 1, 1,
-1.230597, -1.199683, -1.985008, 0, 0, 0, 1, 1,
-1.230529, -0.8562695, -3.98941, 0, 0, 0, 1, 1,
-1.224834, 1.060697, -0.1946039, 0, 0, 0, 1, 1,
-1.221674, -0.8493994, -1.4738, 0, 0, 0, 1, 1,
-1.212631, 0.8510346, -0.8130262, 0, 0, 0, 1, 1,
-1.21018, 0.1051191, -1.411895, 1, 1, 1, 1, 1,
-1.209393, 0.2160517, -2.427584, 1, 1, 1, 1, 1,
-1.202987, 1.695707, -2.210651, 1, 1, 1, 1, 1,
-1.190311, 0.9152595, -0.8539428, 1, 1, 1, 1, 1,
-1.189959, -2.054536, -1.569262, 1, 1, 1, 1, 1,
-1.186439, 1.472757, -0.7161232, 1, 1, 1, 1, 1,
-1.180737, 1.553508, 0.05549107, 1, 1, 1, 1, 1,
-1.178745, 0.03972362, -1.132377, 1, 1, 1, 1, 1,
-1.175359, -1.251313, -2.769602, 1, 1, 1, 1, 1,
-1.158114, -1.924559, -1.485109, 1, 1, 1, 1, 1,
-1.151109, 1.071274, -1.486493, 1, 1, 1, 1, 1,
-1.147682, -0.7781895, -3.93529, 1, 1, 1, 1, 1,
-1.142728, 1.921706, -0.1022797, 1, 1, 1, 1, 1,
-1.139406, 1.623757, -0.1169574, 1, 1, 1, 1, 1,
-1.12643, 0.7393131, -2.653286, 1, 1, 1, 1, 1,
-1.12488, -1.092146, -2.535132, 0, 0, 1, 1, 1,
-1.12421, 2.073282, -0.9587483, 1, 0, 0, 1, 1,
-1.122815, 0.2128261, -0.4770314, 1, 0, 0, 1, 1,
-1.121266, 0.4098118, -1.329434, 1, 0, 0, 1, 1,
-1.119277, 1.75157, -0.2958486, 1, 0, 0, 1, 1,
-1.116374, -0.1084803, -3.035289, 1, 0, 0, 1, 1,
-1.10869, -0.6870568, -3.71634, 0, 0, 0, 1, 1,
-1.108429, 1.634289, 0.936101, 0, 0, 0, 1, 1,
-1.104935, 0.4497981, -1.098503, 0, 0, 0, 1, 1,
-1.0994, 0.5551631, -1.162438, 0, 0, 0, 1, 1,
-1.092836, 1.093362, -1.982457, 0, 0, 0, 1, 1,
-1.091977, 0.7430569, 0.1913845, 0, 0, 0, 1, 1,
-1.089033, -0.6174229, -2.234908, 0, 0, 0, 1, 1,
-1.086819, 0.3474384, -3.179041, 1, 1, 1, 1, 1,
-1.084293, 0.2691617, -0.1127396, 1, 1, 1, 1, 1,
-1.080325, -0.3912308, -1.090695, 1, 1, 1, 1, 1,
-1.079577, -1.938786, -1.95713, 1, 1, 1, 1, 1,
-1.079146, 0.06738512, -2.191153, 1, 1, 1, 1, 1,
-1.075127, 0.6482629, -2.245969, 1, 1, 1, 1, 1,
-1.068501, 1.111924, -0.04842099, 1, 1, 1, 1, 1,
-1.066365, 1.284012, -1.991258, 1, 1, 1, 1, 1,
-1.065654, 1.393817, -1.268757, 1, 1, 1, 1, 1,
-1.059208, -0.2390521, -2.729856, 1, 1, 1, 1, 1,
-1.056678, 3.340082, 0.5856937, 1, 1, 1, 1, 1,
-1.053272, 0.6834484, -0.5396267, 1, 1, 1, 1, 1,
-1.032728, -0.8462937, -1.642991, 1, 1, 1, 1, 1,
-1.032462, 0.7193679, -1.679684, 1, 1, 1, 1, 1,
-1.031949, 0.7472367, -0.9748514, 1, 1, 1, 1, 1,
-1.029525, 0.2805228, -1.861995, 0, 0, 1, 1, 1,
-1.023795, 0.8573014, -0.2984472, 1, 0, 0, 1, 1,
-1.01797, 0.7149564, -2.150308, 1, 0, 0, 1, 1,
-1.017581, 0.3205822, -1.319492, 1, 0, 0, 1, 1,
-1.017024, 0.6739094, -0.4888696, 1, 0, 0, 1, 1,
-1.0146, 0.1044943, -1.401388, 1, 0, 0, 1, 1,
-1.008753, -1.010543, -2.531636, 0, 0, 0, 1, 1,
-1.006839, -0.904377, -1.233203, 0, 0, 0, 1, 1,
-0.9988655, -0.6882126, -2.457398, 0, 0, 0, 1, 1,
-0.995091, 1.129591, 0.7017672, 0, 0, 0, 1, 1,
-0.9939113, -0.1313609, -1.472339, 0, 0, 0, 1, 1,
-0.9908431, -1.192641, -0.6753471, 0, 0, 0, 1, 1,
-0.9864006, -1.24223, -4.290075, 0, 0, 0, 1, 1,
-0.9847549, -0.8076988, -3.598991, 1, 1, 1, 1, 1,
-0.9836754, -0.7654088, -1.395184, 1, 1, 1, 1, 1,
-0.9818935, -0.07990006, -0.7692086, 1, 1, 1, 1, 1,
-0.9766044, -0.5234514, -1.536311, 1, 1, 1, 1, 1,
-0.9721656, -0.6237103, -1.43197, 1, 1, 1, 1, 1,
-0.9664787, -0.7155859, -2.610924, 1, 1, 1, 1, 1,
-0.9619302, -0.6712468, -4.047058, 1, 1, 1, 1, 1,
-0.960556, -1.546128, -2.911328, 1, 1, 1, 1, 1,
-0.9603169, 0.8224006, 0.8768799, 1, 1, 1, 1, 1,
-0.9579768, -0.8258465, -1.667299, 1, 1, 1, 1, 1,
-0.9528306, 0.4112153, -1.588951, 1, 1, 1, 1, 1,
-0.9495106, 0.3645338, -1.438515, 1, 1, 1, 1, 1,
-0.9446513, 1.352082, -0.2933069, 1, 1, 1, 1, 1,
-0.9431933, 0.4401689, -0.5387856, 1, 1, 1, 1, 1,
-0.9410917, 0.6646165, 0.0867547, 1, 1, 1, 1, 1,
-0.9357726, -0.7096729, -0.3173022, 0, 0, 1, 1, 1,
-0.9317483, 2.969788, -2.405188, 1, 0, 0, 1, 1,
-0.9312884, -0.116647, -1.096215, 1, 0, 0, 1, 1,
-0.930702, 0.1909054, -1.403214, 1, 0, 0, 1, 1,
-0.9302208, -0.6326592, -2.011111, 1, 0, 0, 1, 1,
-0.9288033, 0.5253419, -0.408937, 1, 0, 0, 1, 1,
-0.925595, -0.7847016, -2.349758, 0, 0, 0, 1, 1,
-0.9244768, -0.2268761, -3.341213, 0, 0, 0, 1, 1,
-0.9203387, 1.285365, 0.7141709, 0, 0, 0, 1, 1,
-0.9187872, 1.091491, -0.8306795, 0, 0, 0, 1, 1,
-0.9159812, -0.6054324, -0.7641872, 0, 0, 0, 1, 1,
-0.9132323, 2.001507, -0.3786888, 0, 0, 0, 1, 1,
-0.9125507, -0.1805522, -3.31552, 0, 0, 0, 1, 1,
-0.9095232, -0.8876765, -1.679889, 1, 1, 1, 1, 1,
-0.9074329, 0.6670854, -3.015067, 1, 1, 1, 1, 1,
-0.9034353, 1.328647, 0.4706773, 1, 1, 1, 1, 1,
-0.9034216, -1.848871, -3.551817, 1, 1, 1, 1, 1,
-0.9010239, -1.063476, -2.446437, 1, 1, 1, 1, 1,
-0.8964034, 1.610138, -2.249611, 1, 1, 1, 1, 1,
-0.8957024, -1.068416, -2.341269, 1, 1, 1, 1, 1,
-0.8867778, -0.7797336, -2.036587, 1, 1, 1, 1, 1,
-0.8841569, -0.3708971, -2.032965, 1, 1, 1, 1, 1,
-0.8840929, 1.581219, 0.6592427, 1, 1, 1, 1, 1,
-0.8836925, -1.103795, -1.799525, 1, 1, 1, 1, 1,
-0.8829163, -0.7567053, -2.962033, 1, 1, 1, 1, 1,
-0.8781171, -0.8515626, -2.450876, 1, 1, 1, 1, 1,
-0.8770421, -0.2332673, -3.16846, 1, 1, 1, 1, 1,
-0.8602622, -0.3183216, -2.773064, 1, 1, 1, 1, 1,
-0.856449, -0.008982549, -2.141228, 0, 0, 1, 1, 1,
-0.8564361, 0.1880386, -2.104437, 1, 0, 0, 1, 1,
-0.8538529, -0.9475653, -2.528736, 1, 0, 0, 1, 1,
-0.8516344, 0.4777433, -2.032151, 1, 0, 0, 1, 1,
-0.8466518, 0.9913511, -1.915616, 1, 0, 0, 1, 1,
-0.8458718, 0.2493828, -1.142804, 1, 0, 0, 1, 1,
-0.8394361, 0.8078302, -1.08853, 0, 0, 0, 1, 1,
-0.8350776, 2.10913, -0.603698, 0, 0, 0, 1, 1,
-0.834358, -0.8225084, -3.362483, 0, 0, 0, 1, 1,
-0.8310834, -0.2561417, -2.068861, 0, 0, 0, 1, 1,
-0.8305597, 0.4150992, -1.083136, 0, 0, 0, 1, 1,
-0.8234105, -1.810823, -3.262598, 0, 0, 0, 1, 1,
-0.8225208, 3.342981, 0.759809, 0, 0, 0, 1, 1,
-0.8142514, 0.566201, -1.887024, 1, 1, 1, 1, 1,
-0.8038492, -0.01469974, 1.229203, 1, 1, 1, 1, 1,
-0.8034903, 1.324231, -0.3147887, 1, 1, 1, 1, 1,
-0.8000851, 0.5259713, -0.2478268, 1, 1, 1, 1, 1,
-0.7953056, 1.068978, 0.2713917, 1, 1, 1, 1, 1,
-0.7936707, -0.9190997, -0.8081167, 1, 1, 1, 1, 1,
-0.7929577, 1.356438, -0.08486506, 1, 1, 1, 1, 1,
-0.7863696, -1.206148, -3.878029, 1, 1, 1, 1, 1,
-0.7840114, 0.370131, -1.884543, 1, 1, 1, 1, 1,
-0.7796917, 0.07814446, -0.8302279, 1, 1, 1, 1, 1,
-0.7771657, -1.482406, -2.072497, 1, 1, 1, 1, 1,
-0.7725472, 1.310689, -0.6523891, 1, 1, 1, 1, 1,
-0.7645631, -0.2413286, -3.475642, 1, 1, 1, 1, 1,
-0.7645457, 1.244035, -0.2727015, 1, 1, 1, 1, 1,
-0.76306, -0.445982, -1.880553, 1, 1, 1, 1, 1,
-0.7525703, 0.7681226, 1.007502, 0, 0, 1, 1, 1,
-0.7524485, -0.8566113, -3.711787, 1, 0, 0, 1, 1,
-0.7461252, -1.014009, -2.152686, 1, 0, 0, 1, 1,
-0.7411936, 0.7453548, -0.7764719, 1, 0, 0, 1, 1,
-0.7397004, -0.5545082, -2.227812, 1, 0, 0, 1, 1,
-0.7396247, -1.298496, -2.085043, 1, 0, 0, 1, 1,
-0.7338931, -0.2942441, -2.558982, 0, 0, 0, 1, 1,
-0.7273716, -2.445603, -5.893728, 0, 0, 0, 1, 1,
-0.7213644, 1.226464, -1.027806, 0, 0, 0, 1, 1,
-0.7187436, 0.640326, -1.291361, 0, 0, 0, 1, 1,
-0.712349, -0.2684677, -1.844711, 0, 0, 0, 1, 1,
-0.7064614, -0.3848946, -1.610318, 0, 0, 0, 1, 1,
-0.7052901, -0.05963465, -1.13502, 0, 0, 0, 1, 1,
-0.7035051, -0.5638403, -2.857665, 1, 1, 1, 1, 1,
-0.7012105, 0.02893422, -2.444081, 1, 1, 1, 1, 1,
-0.699413, -0.5380396, -2.446675, 1, 1, 1, 1, 1,
-0.6983047, -0.3872572, -1.377957, 1, 1, 1, 1, 1,
-0.696778, -0.3431317, -1.384538, 1, 1, 1, 1, 1,
-0.6942058, 0.956952, -1.067828, 1, 1, 1, 1, 1,
-0.6910599, -0.4252872, -3.754593, 1, 1, 1, 1, 1,
-0.6897294, -0.1616959, -2.16673, 1, 1, 1, 1, 1,
-0.6842187, 0.2406815, -1.962752, 1, 1, 1, 1, 1,
-0.6822156, 0.4421479, -2.579506, 1, 1, 1, 1, 1,
-0.6765449, 0.9159001, 0.6814811, 1, 1, 1, 1, 1,
-0.6764346, -0.05585244, -2.388554, 1, 1, 1, 1, 1,
-0.6761888, 0.4736906, -0.781744, 1, 1, 1, 1, 1,
-0.6738206, -1.460142, -3.793427, 1, 1, 1, 1, 1,
-0.6731408, -1.505358, -3.536587, 1, 1, 1, 1, 1,
-0.6678172, -1.146636, -2.376312, 0, 0, 1, 1, 1,
-0.665296, 0.5381361, -0.7524604, 1, 0, 0, 1, 1,
-0.6626241, -0.2303002, -0.6350789, 1, 0, 0, 1, 1,
-0.657467, 0.6078054, -2.159925, 1, 0, 0, 1, 1,
-0.6505867, 1.143056, -0.2204676, 1, 0, 0, 1, 1,
-0.6460077, 1.277866, -0.7235511, 1, 0, 0, 1, 1,
-0.6455544, 0.713972, 1.193552, 0, 0, 0, 1, 1,
-0.6395575, 1.722494, 0.7315552, 0, 0, 0, 1, 1,
-0.6301131, -0.0950139, -2.605705, 0, 0, 0, 1, 1,
-0.627371, -0.8523782, -2.973048, 0, 0, 0, 1, 1,
-0.6203312, -0.5117923, -3.665931, 0, 0, 0, 1, 1,
-0.6182956, 0.7877013, -0.7793927, 0, 0, 0, 1, 1,
-0.6157379, 2.378241, 0.2281012, 0, 0, 0, 1, 1,
-0.6154064, -0.7265251, -1.518778, 1, 1, 1, 1, 1,
-0.6137372, -0.4584355, -0.8110666, 1, 1, 1, 1, 1,
-0.6116323, -1.392761, -2.582842, 1, 1, 1, 1, 1,
-0.6112833, 1.098325, -0.9792594, 1, 1, 1, 1, 1,
-0.6110809, 0.6611223, -1.41419, 1, 1, 1, 1, 1,
-0.6079889, -0.3625826, -1.343859, 1, 1, 1, 1, 1,
-0.607801, 0.09548737, -1.425312, 1, 1, 1, 1, 1,
-0.6049508, -1.145882, -2.59691, 1, 1, 1, 1, 1,
-0.604893, -1.356977, -1.770829, 1, 1, 1, 1, 1,
-0.6045147, 1.517704, -0.9396673, 1, 1, 1, 1, 1,
-0.6009371, 1.301039, 0.8305236, 1, 1, 1, 1, 1,
-0.5974669, 1.573841, -1.456359, 1, 1, 1, 1, 1,
-0.5859543, 0.05208547, -1.934731, 1, 1, 1, 1, 1,
-0.5843207, -0.8048772, -3.527556, 1, 1, 1, 1, 1,
-0.5782109, -1.185604, -4.086242, 1, 1, 1, 1, 1,
-0.573397, 0.7293375, 0.5225614, 0, 0, 1, 1, 1,
-0.5686722, 0.7302068, -2.42331, 1, 0, 0, 1, 1,
-0.560097, 1.654226, 0.3060709, 1, 0, 0, 1, 1,
-0.5595003, 0.2394654, 0.2843237, 1, 0, 0, 1, 1,
-0.5545022, 1.475247, -1.108903, 1, 0, 0, 1, 1,
-0.5459129, -0.2716641, -2.329743, 1, 0, 0, 1, 1,
-0.5414972, 0.2172242, -1.16531, 0, 0, 0, 1, 1,
-0.5384124, -1.662707, -3.554222, 0, 0, 0, 1, 1,
-0.5380203, 0.3019449, -0.4397314, 0, 0, 0, 1, 1,
-0.536912, -0.3231743, -2.123514, 0, 0, 0, 1, 1,
-0.5305277, 0.2546402, -0.7467611, 0, 0, 0, 1, 1,
-0.5288287, -1.345344, -2.732885, 0, 0, 0, 1, 1,
-0.5219351, -0.5465741, -3.65617, 0, 0, 0, 1, 1,
-0.5188995, 0.2557849, -1.245964, 1, 1, 1, 1, 1,
-0.5186839, 0.5994918, -1.081152, 1, 1, 1, 1, 1,
-0.5159526, 0.4142212, -1.469735, 1, 1, 1, 1, 1,
-0.5156596, 0.2572419, -1.634041, 1, 1, 1, 1, 1,
-0.5137171, 0.661839, -0.8956681, 1, 1, 1, 1, 1,
-0.5135484, 0.7043746, 0.1204578, 1, 1, 1, 1, 1,
-0.5090443, 0.8339443, -0.04037676, 1, 1, 1, 1, 1,
-0.5036131, 0.4876274, -0.2678528, 1, 1, 1, 1, 1,
-0.5021213, 0.8679658, -0.5548759, 1, 1, 1, 1, 1,
-0.5015535, -1.103479, -2.753498, 1, 1, 1, 1, 1,
-0.4997627, -1.690725, -4.101429, 1, 1, 1, 1, 1,
-0.4993916, -0.2994303, -3.364634, 1, 1, 1, 1, 1,
-0.4986242, -0.5959914, -1.153312, 1, 1, 1, 1, 1,
-0.4963537, 1.611225, -3.019959, 1, 1, 1, 1, 1,
-0.4947599, -1.256518, -2.63929, 1, 1, 1, 1, 1,
-0.4933924, 1.481307, -0.9208292, 0, 0, 1, 1, 1,
-0.4911351, 0.9928931, -2.93121, 1, 0, 0, 1, 1,
-0.4910678, -0.09927088, -3.069856, 1, 0, 0, 1, 1,
-0.4860721, 1.605888, 0.4832066, 1, 0, 0, 1, 1,
-0.4843236, -1.986603, -2.434378, 1, 0, 0, 1, 1,
-0.4766773, -2.778803, -3.041129, 1, 0, 0, 1, 1,
-0.4759497, -0.1961868, -2.470213, 0, 0, 0, 1, 1,
-0.475894, -0.4344673, -2.35413, 0, 0, 0, 1, 1,
-0.4737186, 0.3973461, -0.3996857, 0, 0, 0, 1, 1,
-0.4734223, -0.8495926, -3.072539, 0, 0, 0, 1, 1,
-0.4671667, -0.8503261, -0.456826, 0, 0, 0, 1, 1,
-0.4665479, 0.1744763, -1.027725, 0, 0, 0, 1, 1,
-0.4615771, -0.3698968, -0.2724204, 0, 0, 0, 1, 1,
-0.4609473, -0.1926787, -1.744936, 1, 1, 1, 1, 1,
-0.4587976, -0.4309344, -4.206097, 1, 1, 1, 1, 1,
-0.4586931, 0.1237517, -0.005103845, 1, 1, 1, 1, 1,
-0.4575858, 0.6766679, 0.8507044, 1, 1, 1, 1, 1,
-0.4519832, 0.7275906, -0.9729562, 1, 1, 1, 1, 1,
-0.4512387, -0.5861105, -0.7901412, 1, 1, 1, 1, 1,
-0.449551, 1.600533, 0.513112, 1, 1, 1, 1, 1,
-0.4493285, -1.836274, -1.345433, 1, 1, 1, 1, 1,
-0.4413916, -0.3296589, -3.185316, 1, 1, 1, 1, 1,
-0.440538, 1.312017, -1.530433, 1, 1, 1, 1, 1,
-0.4349815, 0.3985832, -2.017579, 1, 1, 1, 1, 1,
-0.4268445, -0.2105103, -1.099412, 1, 1, 1, 1, 1,
-0.4221537, -0.09204312, -3.751038, 1, 1, 1, 1, 1,
-0.421778, 0.7778152, -0.8141724, 1, 1, 1, 1, 1,
-0.4196526, -0.7792365, -1.633579, 1, 1, 1, 1, 1,
-0.4153766, -0.6780716, -2.441967, 0, 0, 1, 1, 1,
-0.414896, -0.2334058, -3.632879, 1, 0, 0, 1, 1,
-0.4101065, -0.1522961, -0.2512973, 1, 0, 0, 1, 1,
-0.4096314, -0.3193412, -2.775671, 1, 0, 0, 1, 1,
-0.4077854, -0.586766, -3.789516, 1, 0, 0, 1, 1,
-0.4075072, 0.7188234, -1.826068, 1, 0, 0, 1, 1,
-0.4012516, -0.6731495, -3.516748, 0, 0, 0, 1, 1,
-0.3973028, -0.2559532, -1.485752, 0, 0, 0, 1, 1,
-0.3949508, 0.9146978, -0.07007858, 0, 0, 0, 1, 1,
-0.3923973, -0.05948736, -1.517451, 0, 0, 0, 1, 1,
-0.3923275, -2.275561, -4.297738, 0, 0, 0, 1, 1,
-0.3914671, 1.275722, -0.3871849, 0, 0, 0, 1, 1,
-0.3905162, 1.030936, -0.3962732, 0, 0, 0, 1, 1,
-0.3896308, 1.020925, 0.6692421, 1, 1, 1, 1, 1,
-0.3895823, 1.57614, -0.8618753, 1, 1, 1, 1, 1,
-0.3882021, 0.6306379, 0.3888716, 1, 1, 1, 1, 1,
-0.3872529, 0.965371, 1.068219, 1, 1, 1, 1, 1,
-0.3865328, -0.2229176, -1.24641, 1, 1, 1, 1, 1,
-0.3830665, -1.306986, -2.565978, 1, 1, 1, 1, 1,
-0.3812996, -1.132182, -1.547627, 1, 1, 1, 1, 1,
-0.3780428, -1.370335, -2.082949, 1, 1, 1, 1, 1,
-0.3765317, -0.7149964, -1.544244, 1, 1, 1, 1, 1,
-0.3743595, 1.097417, -0.2807765, 1, 1, 1, 1, 1,
-0.3728949, -1.471881, -1.325866, 1, 1, 1, 1, 1,
-0.3669203, 0.192381, -0.3760803, 1, 1, 1, 1, 1,
-0.3653136, 0.9997067, 0.6193358, 1, 1, 1, 1, 1,
-0.362238, -0.7702267, -3.877937, 1, 1, 1, 1, 1,
-0.3565991, -1.61634, -2.105599, 1, 1, 1, 1, 1,
-0.3553377, 0.8656276, -0.7282603, 0, 0, 1, 1, 1,
-0.3540545, -0.2045115, -2.034762, 1, 0, 0, 1, 1,
-0.3521416, 0.237116, -2.172764, 1, 0, 0, 1, 1,
-0.3497902, -1.15132, -2.679347, 1, 0, 0, 1, 1,
-0.3477281, 1.628793, 0.7816387, 1, 0, 0, 1, 1,
-0.3461889, -0.1076178, -3.217417, 1, 0, 0, 1, 1,
-0.3393341, -0.4026793, -2.522437, 0, 0, 0, 1, 1,
-0.331059, 0.1488066, -1.162456, 0, 0, 0, 1, 1,
-0.3231659, 1.338584, -0.961628, 0, 0, 0, 1, 1,
-0.3204709, -0.2861586, -2.585939, 0, 0, 0, 1, 1,
-0.3191811, -0.4048539, -4.110868, 0, 0, 0, 1, 1,
-0.3177792, 0.07075823, -0.76766, 0, 0, 0, 1, 1,
-0.3165632, 0.154843, -1.197791, 0, 0, 0, 1, 1,
-0.3163717, 0.5358603, -0.9686922, 1, 1, 1, 1, 1,
-0.3142656, -1.011483, -3.55933, 1, 1, 1, 1, 1,
-0.3086898, 0.08860088, -0.7001911, 1, 1, 1, 1, 1,
-0.3023897, -0.4221484, -4.479096, 1, 1, 1, 1, 1,
-0.299345, 0.3918884, -1.431811, 1, 1, 1, 1, 1,
-0.2957343, -0.1396964, -4.692096, 1, 1, 1, 1, 1,
-0.2907413, -1.464413, -1.61808, 1, 1, 1, 1, 1,
-0.2890665, -0.5461918, -4.164772, 1, 1, 1, 1, 1,
-0.2884713, -1.331134, -2.812414, 1, 1, 1, 1, 1,
-0.2868766, 0.2366739, -1.471775, 1, 1, 1, 1, 1,
-0.2832486, 1.307844, -1.44259, 1, 1, 1, 1, 1,
-0.2823257, -0.8095208, -2.611569, 1, 1, 1, 1, 1,
-0.2782729, -1.734716, -1.486568, 1, 1, 1, 1, 1,
-0.2747248, 1.319291, 1.694119, 1, 1, 1, 1, 1,
-0.2745586, -0.6942862, -2.386363, 1, 1, 1, 1, 1,
-0.2705905, -1.136466, -3.368159, 0, 0, 1, 1, 1,
-0.2703172, -0.07667431, -1.768137, 1, 0, 0, 1, 1,
-0.2694786, 0.1564739, -1.003775, 1, 0, 0, 1, 1,
-0.2675231, -2.123371, -2.371197, 1, 0, 0, 1, 1,
-0.266768, 0.1758942, -1.397791, 1, 0, 0, 1, 1,
-0.2635536, -0.4789205, -3.273527, 1, 0, 0, 1, 1,
-0.2572353, -0.2380277, 0.5070248, 0, 0, 0, 1, 1,
-0.2546923, 1.135599, 1.627707, 0, 0, 0, 1, 1,
-0.2539246, 0.9261822, -0.4773622, 0, 0, 0, 1, 1,
-0.2500149, -0.578006, -3.665799, 0, 0, 0, 1, 1,
-0.2462265, -0.05707986, -1.15649, 0, 0, 0, 1, 1,
-0.2451383, 0.6554382, -1.652834, 0, 0, 0, 1, 1,
-0.242194, -0.9266908, -2.05971, 0, 0, 0, 1, 1,
-0.2419298, 1.030341, 1.352376, 1, 1, 1, 1, 1,
-0.239474, -0.9946412, -2.555919, 1, 1, 1, 1, 1,
-0.2391269, -0.07327147, -1.651273, 1, 1, 1, 1, 1,
-0.2360531, 0.3885127, -0.8180363, 1, 1, 1, 1, 1,
-0.233444, 0.3293875, -1.773775, 1, 1, 1, 1, 1,
-0.2306613, -0.3146662, -2.126042, 1, 1, 1, 1, 1,
-0.2290363, -0.6812726, -2.403631, 1, 1, 1, 1, 1,
-0.2282895, 1.396451, 1.256675, 1, 1, 1, 1, 1,
-0.2217299, 0.4632469, 1.907073, 1, 1, 1, 1, 1,
-0.2214123, -1.731694, -1.828722, 1, 1, 1, 1, 1,
-0.2210832, 1.005264, -0.1363765, 1, 1, 1, 1, 1,
-0.2194755, -0.5181681, -2.293739, 1, 1, 1, 1, 1,
-0.2180656, -0.1133678, -1.506464, 1, 1, 1, 1, 1,
-0.217293, 3.71673, -0.7331982, 1, 1, 1, 1, 1,
-0.2052454, -1.240164, -1.630824, 1, 1, 1, 1, 1,
-0.1997086, 0.5639518, -0.3523944, 0, 0, 1, 1, 1,
-0.1988771, -0.7179499, -1.727563, 1, 0, 0, 1, 1,
-0.198202, 0.6368036, 1.056943, 1, 0, 0, 1, 1,
-0.1971396, 1.531406, -0.2320758, 1, 0, 0, 1, 1,
-0.1940345, -0.5674091, -4.176396, 1, 0, 0, 1, 1,
-0.1912838, -0.894905, -3.581804, 1, 0, 0, 1, 1,
-0.1901074, -1.360126, -3.123052, 0, 0, 0, 1, 1,
-0.1886441, -2.773416, -6.269274, 0, 0, 0, 1, 1,
-0.1876213, 0.4292263, -0.7151415, 0, 0, 0, 1, 1,
-0.1844928, -0.2421625, -1.32617, 0, 0, 0, 1, 1,
-0.1779168, 0.02721385, -1.25667, 0, 0, 0, 1, 1,
-0.1713241, 0.9355701, -0.02445749, 0, 0, 0, 1, 1,
-0.1709525, 0.04440716, -2.185401, 0, 0, 0, 1, 1,
-0.1692084, -1.12819, -3.546383, 1, 1, 1, 1, 1,
-0.168303, -0.7860134, -4.883731, 1, 1, 1, 1, 1,
-0.1676071, -0.793612, -2.496462, 1, 1, 1, 1, 1,
-0.1600486, 0.7387209, 0.2767832, 1, 1, 1, 1, 1,
-0.1592666, -0.9097533, -2.439102, 1, 1, 1, 1, 1,
-0.1576044, -0.9548544, -1.890039, 1, 1, 1, 1, 1,
-0.1538907, 0.1503054, -1.108661, 1, 1, 1, 1, 1,
-0.1528427, 0.04125335, -0.8623778, 1, 1, 1, 1, 1,
-0.1522627, -0.003253363, -1.168473, 1, 1, 1, 1, 1,
-0.1521545, -0.7534177, -3.983791, 1, 1, 1, 1, 1,
-0.1463613, -0.5228474, -5.117573, 1, 1, 1, 1, 1,
-0.1449871, 0.3564037, -1.72331, 1, 1, 1, 1, 1,
-0.1343209, 1.125568, -0.7175134, 1, 1, 1, 1, 1,
-0.1276322, -1.866838, -2.026609, 1, 1, 1, 1, 1,
-0.126414, -0.6143962, -3.999108, 1, 1, 1, 1, 1,
-0.1263859, -1.812486, -2.500337, 0, 0, 1, 1, 1,
-0.1259468, -0.05171726, -1.909914, 1, 0, 0, 1, 1,
-0.1242112, -0.4632189, -2.966555, 1, 0, 0, 1, 1,
-0.1241309, 1.777912, -0.09068996, 1, 0, 0, 1, 1,
-0.1229076, 2.294676, 0.4655059, 1, 0, 0, 1, 1,
-0.1219794, 1.344769, -0.588677, 1, 0, 0, 1, 1,
-0.120005, -1.257696, -4.892817, 0, 0, 0, 1, 1,
-0.1180314, 1.171679, 1.435187, 0, 0, 0, 1, 1,
-0.1147731, 0.8222305, 0.6145596, 0, 0, 0, 1, 1,
-0.1138931, -0.4493013, -1.458776, 0, 0, 0, 1, 1,
-0.1107347, -0.5768026, -1.954079, 0, 0, 0, 1, 1,
-0.1102943, 0.527476, 0.3060063, 0, 0, 0, 1, 1,
-0.1093136, -0.4155699, -2.664183, 0, 0, 0, 1, 1,
-0.1060517, 2.721996, -0.1786075, 1, 1, 1, 1, 1,
-0.09934336, -0.7136918, -3.596109, 1, 1, 1, 1, 1,
-0.09571107, -3.517701, -2.592144, 1, 1, 1, 1, 1,
-0.09553469, 0.3682113, 1.162738, 1, 1, 1, 1, 1,
-0.09499965, -0.4580145, -2.464441, 1, 1, 1, 1, 1,
-0.09268966, -0.3148977, -1.400185, 1, 1, 1, 1, 1,
-0.0912977, 1.291687, 0.3972526, 1, 1, 1, 1, 1,
-0.09074867, 0.373893, -1.830548, 1, 1, 1, 1, 1,
-0.08987053, 0.130804, -0.7793951, 1, 1, 1, 1, 1,
-0.08816729, 1.218843, 0.5676138, 1, 1, 1, 1, 1,
-0.08706502, 0.4188489, -0.2091351, 1, 1, 1, 1, 1,
-0.08505915, -2.034739, -3.699912, 1, 1, 1, 1, 1,
-0.08432624, 1.629138, -0.8765299, 1, 1, 1, 1, 1,
-0.08038237, 0.5585119, 0.06740896, 1, 1, 1, 1, 1,
-0.07988845, 1.057563, -1.219155, 1, 1, 1, 1, 1,
-0.07906128, -0.0808798, -4.071637, 0, 0, 1, 1, 1,
-0.07575395, -0.7111052, -3.55711, 1, 0, 0, 1, 1,
-0.07355863, 1.782357, -0.2446443, 1, 0, 0, 1, 1,
-0.06762941, -1.106647, -3.20313, 1, 0, 0, 1, 1,
-0.06537677, -0.2238729, -4.448329, 1, 0, 0, 1, 1,
-0.06296422, 0.11041, -0.1959902, 1, 0, 0, 1, 1,
-0.05687473, -0.506797, -3.562248, 0, 0, 0, 1, 1,
-0.05459834, -0.8371751, -2.13834, 0, 0, 0, 1, 1,
-0.05297355, -0.3240933, -2.985732, 0, 0, 0, 1, 1,
-0.05278767, 0.2318588, -2.807978, 0, 0, 0, 1, 1,
-0.04729175, 0.9220769, 1.302499, 0, 0, 0, 1, 1,
-0.04666527, -0.442751, -3.479983, 0, 0, 0, 1, 1,
-0.04136015, -0.08745404, -1.312959, 0, 0, 0, 1, 1,
-0.04114147, -0.2282935, -3.385385, 1, 1, 1, 1, 1,
-0.04081421, 0.4867721, 0.2818217, 1, 1, 1, 1, 1,
-0.04047202, 1.046527, 0.8976812, 1, 1, 1, 1, 1,
-0.03954088, 0.9233232, 0.2712117, 1, 1, 1, 1, 1,
-0.0359145, 0.00327099, -1.008907, 1, 1, 1, 1, 1,
-0.03429163, 0.07936405, -0.4535245, 1, 1, 1, 1, 1,
-0.03423515, 1.458981, 0.5255889, 1, 1, 1, 1, 1,
-0.03256459, -1.046794, -2.473703, 1, 1, 1, 1, 1,
-0.02977937, 0.3673798, 0.1729643, 1, 1, 1, 1, 1,
-0.02410218, -0.2114454, -2.715799, 1, 1, 1, 1, 1,
-0.02264093, 0.06651172, 0.3917338, 1, 1, 1, 1, 1,
-0.02051931, -0.02291572, -4.06448, 1, 1, 1, 1, 1,
-0.01893039, -0.140638, -4.540262, 1, 1, 1, 1, 1,
-0.01737537, -2.500564, -4.843231, 1, 1, 1, 1, 1,
-0.01546759, -0.3900662, -3.575544, 1, 1, 1, 1, 1,
-0.01373324, -1.497438, -3.316767, 0, 0, 1, 1, 1,
-0.01306157, -0.1877086, -2.173643, 1, 0, 0, 1, 1,
-0.006107443, -0.4319986, -1.490023, 1, 0, 0, 1, 1,
-0.005659466, -0.8479041, -2.923448, 1, 0, 0, 1, 1,
0.004885079, -0.1058525, 2.349568, 1, 0, 0, 1, 1,
0.004919697, -0.7391896, 4.495595, 1, 0, 0, 1, 1,
0.005729725, -0.7000178, 4.071477, 0, 0, 0, 1, 1,
0.00593229, -0.3758046, 5.313649, 0, 0, 0, 1, 1,
0.009631434, -0.1182161, 4.356902, 0, 0, 0, 1, 1,
0.01289574, -0.2409044, 4.705598, 0, 0, 0, 1, 1,
0.02051507, 0.434223, -0.2411885, 0, 0, 0, 1, 1,
0.02217791, -1.521327, 4.256353, 0, 0, 0, 1, 1,
0.02287564, 0.2466325, -1.262265, 0, 0, 0, 1, 1,
0.02910022, 0.849551, -0.9690316, 1, 1, 1, 1, 1,
0.03372062, 0.009764319, 1.569421, 1, 1, 1, 1, 1,
0.03556548, -0.4683177, 2.947698, 1, 1, 1, 1, 1,
0.03619663, 0.4300159, -1.281158, 1, 1, 1, 1, 1,
0.04326723, 0.3518975, -1.561811, 1, 1, 1, 1, 1,
0.04353566, -0.6365691, 3.528693, 1, 1, 1, 1, 1,
0.04489375, 0.09272577, 1.383788, 1, 1, 1, 1, 1,
0.04924309, 0.0646484, 1.185138, 1, 1, 1, 1, 1,
0.05323906, 1.110897, 0.435063, 1, 1, 1, 1, 1,
0.05431085, 0.03555857, 0.2011022, 1, 1, 1, 1, 1,
0.05556753, 1.546956, 0.6860162, 1, 1, 1, 1, 1,
0.05596972, -0.3110937, 1.776244, 1, 1, 1, 1, 1,
0.05697563, -0.8694423, 2.092087, 1, 1, 1, 1, 1,
0.05765592, 0.6247019, -0.353209, 1, 1, 1, 1, 1,
0.05967731, -0.9186789, 1.434841, 1, 1, 1, 1, 1,
0.05998417, -1.635795, 3.739141, 0, 0, 1, 1, 1,
0.06104523, -1.689203, 3.874342, 1, 0, 0, 1, 1,
0.06335089, 1.228406, 0.8633805, 1, 0, 0, 1, 1,
0.06579974, -1.108296, 3.823874, 1, 0, 0, 1, 1,
0.06874882, 0.6918702, 0.8438941, 1, 0, 0, 1, 1,
0.07181877, 0.01806808, 0.8601572, 1, 0, 0, 1, 1,
0.07302473, -0.7018487, 3.870637, 0, 0, 0, 1, 1,
0.07816641, -1.585237, 3.223034, 0, 0, 0, 1, 1,
0.08065353, -1.150711, 3.017755, 0, 0, 0, 1, 1,
0.08610091, 1.333309, -0.699801, 0, 0, 0, 1, 1,
0.08768244, 0.5181718, 0.9375501, 0, 0, 0, 1, 1,
0.08806618, 0.6545875, 1.254824, 0, 0, 0, 1, 1,
0.09163577, -0.7358817, 2.210639, 0, 0, 0, 1, 1,
0.09472244, -0.03559577, 1.663468, 1, 1, 1, 1, 1,
0.09648982, 1.392804, -0.5685707, 1, 1, 1, 1, 1,
0.09775934, -1.719497, 5.00811, 1, 1, 1, 1, 1,
0.1016136, -0.3052585, 3.010814, 1, 1, 1, 1, 1,
0.1052011, 2.1803, 0.2943658, 1, 1, 1, 1, 1,
0.1063617, -0.4638198, 3.61093, 1, 1, 1, 1, 1,
0.106495, -0.4198506, 1.029135, 1, 1, 1, 1, 1,
0.1084848, 0.9058906, 0.9931056, 1, 1, 1, 1, 1,
0.1105631, 0.4015948, 1.225873, 1, 1, 1, 1, 1,
0.1138869, 1.707962, 0.7818093, 1, 1, 1, 1, 1,
0.1176454, -0.9038713, 2.407614, 1, 1, 1, 1, 1,
0.118478, -0.2427577, 4.02029, 1, 1, 1, 1, 1,
0.1209843, -0.01544836, 2.507435, 1, 1, 1, 1, 1,
0.1236293, 1.414905, -1.796193, 1, 1, 1, 1, 1,
0.1261066, 0.790298, -0.7971, 1, 1, 1, 1, 1,
0.1268709, 0.1300115, 2.060493, 0, 0, 1, 1, 1,
0.1279502, 2.072778, -0.1104173, 1, 0, 0, 1, 1,
0.1289692, 2.952546, 0.7934563, 1, 0, 0, 1, 1,
0.1291245, -0.4036137, 1.441768, 1, 0, 0, 1, 1,
0.1293643, 2.340845, 0.5535923, 1, 0, 0, 1, 1,
0.1362774, -0.5217745, 3.809553, 1, 0, 0, 1, 1,
0.1451776, -0.6490492, 2.433793, 0, 0, 0, 1, 1,
0.1474459, 0.9091336, -1.38902, 0, 0, 0, 1, 1,
0.1484299, 0.5089245, 1.190842, 0, 0, 0, 1, 1,
0.1502998, 0.2022756, 1.57261, 0, 0, 0, 1, 1,
0.1513253, 1.244392, -0.5796731, 0, 0, 0, 1, 1,
0.1545965, 1.176399, 0.404051, 0, 0, 0, 1, 1,
0.1590444, 0.2487932, -0.6220421, 0, 0, 0, 1, 1,
0.1640928, -1.227668, 2.11599, 1, 1, 1, 1, 1,
0.165527, -0.5175033, 2.88259, 1, 1, 1, 1, 1,
0.1668556, -1.312805, 1.266771, 1, 1, 1, 1, 1,
0.1696012, 0.5187271, -0.245941, 1, 1, 1, 1, 1,
0.1771285, 1.582491, 0.9098629, 1, 1, 1, 1, 1,
0.1805168, -1.773444, 2.563316, 1, 1, 1, 1, 1,
0.1831696, 1.00677, -1.351768, 1, 1, 1, 1, 1,
0.1870299, -0.9019662, 2.342825, 1, 1, 1, 1, 1,
0.1872004, -1.515932, 2.648885, 1, 1, 1, 1, 1,
0.1872855, -0.7231929, 3.077278, 1, 1, 1, 1, 1,
0.1877944, 0.5128063, 1.191033, 1, 1, 1, 1, 1,
0.1955962, 0.2696317, 0.8365297, 1, 1, 1, 1, 1,
0.2008812, 0.648136, -0.3165396, 1, 1, 1, 1, 1,
0.2077326, 0.5095938, 0.9915943, 1, 1, 1, 1, 1,
0.2121707, -0.068577, 2.910354, 1, 1, 1, 1, 1,
0.2186513, -0.04103565, 1.860751, 0, 0, 1, 1, 1,
0.2190398, 0.5564554, -0.9597472, 1, 0, 0, 1, 1,
0.2218077, 0.4433449, 1.94343, 1, 0, 0, 1, 1,
0.2266967, 0.6607609, -0.02050271, 1, 0, 0, 1, 1,
0.2350326, -0.5509858, 1.974153, 1, 0, 0, 1, 1,
0.2374962, 1.634042, -0.2473969, 1, 0, 0, 1, 1,
0.2390438, 0.5499183, 0.7699468, 0, 0, 0, 1, 1,
0.2402293, -0.4321302, 2.110043, 0, 0, 0, 1, 1,
0.2424245, -0.4052784, 2.702868, 0, 0, 0, 1, 1,
0.2473577, -1.102765, 3.37858, 0, 0, 0, 1, 1,
0.2548307, 0.6952227, 2.11722, 0, 0, 0, 1, 1,
0.2627473, 0.1116999, 1.146345, 0, 0, 0, 1, 1,
0.265337, -0.710278, 2.050747, 0, 0, 0, 1, 1,
0.2707365, 0.1344121, 1.60815, 1, 1, 1, 1, 1,
0.2714363, 0.1154241, 3.247102, 1, 1, 1, 1, 1,
0.2720388, -1.118138, 2.895723, 1, 1, 1, 1, 1,
0.2748792, 0.4833265, -0.8906072, 1, 1, 1, 1, 1,
0.2752767, -0.1345419, 3.086097, 1, 1, 1, 1, 1,
0.2814928, -1.056991, 4.322114, 1, 1, 1, 1, 1,
0.2826566, 0.4998609, 0.3369596, 1, 1, 1, 1, 1,
0.2838213, -0.6656514, 2.604266, 1, 1, 1, 1, 1,
0.2859933, 0.4947031, 0.2686573, 1, 1, 1, 1, 1,
0.2896656, -0.1726245, 2.243253, 1, 1, 1, 1, 1,
0.2911204, 0.5145443, -0.7770649, 1, 1, 1, 1, 1,
0.2915332, -0.04847106, 3.869958, 1, 1, 1, 1, 1,
0.2974496, -0.1777068, 2.386402, 1, 1, 1, 1, 1,
0.3036479, -0.4718293, 2.373802, 1, 1, 1, 1, 1,
0.3088553, -0.7107189, 3.602689, 1, 1, 1, 1, 1,
0.3109655, -1.515725, 2.381922, 0, 0, 1, 1, 1,
0.3171282, 0.1186091, 1.385934, 1, 0, 0, 1, 1,
0.3172042, 0.8675013, -0.5062132, 1, 0, 0, 1, 1,
0.318245, 0.5867204, 0.03780632, 1, 0, 0, 1, 1,
0.3200028, -0.02275295, 0.9900276, 1, 0, 0, 1, 1,
0.3245319, 1.063183, -0.552824, 1, 0, 0, 1, 1,
0.3331097, 0.339319, 1.121723, 0, 0, 0, 1, 1,
0.3350113, 0.7492617, 1.182322, 0, 0, 0, 1, 1,
0.3358881, -0.3183458, 2.199295, 0, 0, 0, 1, 1,
0.3386593, -0.5831591, 1.959351, 0, 0, 0, 1, 1,
0.3388016, -1.667594, 3.836509, 0, 0, 0, 1, 1,
0.3413894, -2.101064, 3.239612, 0, 0, 0, 1, 1,
0.3458036, 1.38659, 1.456492, 0, 0, 0, 1, 1,
0.3468758, 0.4532307, 0.1381779, 1, 1, 1, 1, 1,
0.3534628, -0.08911365, 1.228257, 1, 1, 1, 1, 1,
0.3542906, -0.1876237, 2.044672, 1, 1, 1, 1, 1,
0.3544793, -0.2156371, 3.322961, 1, 1, 1, 1, 1,
0.356813, 1.273556, 0.9670179, 1, 1, 1, 1, 1,
0.3628473, -1.906126, 1.751088, 1, 1, 1, 1, 1,
0.3804671, 1.298817, 1.131481, 1, 1, 1, 1, 1,
0.3932773, 1.521363, 0.7128945, 1, 1, 1, 1, 1,
0.3962168, 0.1544309, 1.295506, 1, 1, 1, 1, 1,
0.4014863, -0.4159718, 4.482795, 1, 1, 1, 1, 1,
0.4034772, -1.732567, 2.601492, 1, 1, 1, 1, 1,
0.404447, 0.8557271, 0.5308089, 1, 1, 1, 1, 1,
0.4046678, 1.661667, 0.3320105, 1, 1, 1, 1, 1,
0.4077585, 0.7542599, -0.09826967, 1, 1, 1, 1, 1,
0.4083939, 1.601964, -2.307837, 1, 1, 1, 1, 1,
0.4113733, 2.949103, 3.097073, 0, 0, 1, 1, 1,
0.411387, 9.819747e-05, 3.302824, 1, 0, 0, 1, 1,
0.4161947, 0.2692451, 0.7084349, 1, 0, 0, 1, 1,
0.4226329, -0.8137796, 3.249999, 1, 0, 0, 1, 1,
0.4246027, 0.7571649, -0.583374, 1, 0, 0, 1, 1,
0.4249839, -0.8818884, 2.221636, 1, 0, 0, 1, 1,
0.4261583, -0.4835823, 2.560019, 0, 0, 0, 1, 1,
0.4295207, 1.04863, 1.786315, 0, 0, 0, 1, 1,
0.4319563, 0.2700872, 0.1413966, 0, 0, 0, 1, 1,
0.4342209, -0.8411939, 2.959873, 0, 0, 0, 1, 1,
0.4367283, -1.032456, 2.759051, 0, 0, 0, 1, 1,
0.4446149, -0.461386, 2.762022, 0, 0, 0, 1, 1,
0.4467014, -2.199645, 3.913615, 0, 0, 0, 1, 1,
0.4493502, -0.1724688, 4.021311, 1, 1, 1, 1, 1,
0.4547832, -1.327962, 3.955447, 1, 1, 1, 1, 1,
0.4610721, -0.2479504, 1.546907, 1, 1, 1, 1, 1,
0.4617391, -1.05582, 1.551768, 1, 1, 1, 1, 1,
0.4619986, -0.3913585, 2.527672, 1, 1, 1, 1, 1,
0.4637578, 0.8002003, 2.490416, 1, 1, 1, 1, 1,
0.4640309, -1.183277, 3.215316, 1, 1, 1, 1, 1,
0.4694537, -1.094167, 3.669443, 1, 1, 1, 1, 1,
0.4707043, -1.205973, 1.160747, 1, 1, 1, 1, 1,
0.4746035, 1.161333, 1.727615, 1, 1, 1, 1, 1,
0.4746531, -0.8627566, 2.385513, 1, 1, 1, 1, 1,
0.4751208, 1.288561, 0.8283927, 1, 1, 1, 1, 1,
0.4762577, -0.5031873, 2.529954, 1, 1, 1, 1, 1,
0.4791638, 0.292864, 1.838599, 1, 1, 1, 1, 1,
0.4833569, 0.5472321, 0.8966651, 1, 1, 1, 1, 1,
0.4913465, -1.231426, 3.726399, 0, 0, 1, 1, 1,
0.491701, 0.5823901, 1.149082, 1, 0, 0, 1, 1,
0.4948097, -0.208477, 2.044987, 1, 0, 0, 1, 1,
0.4986924, -0.2273991, 1.321389, 1, 0, 0, 1, 1,
0.5005534, -0.5034477, 0.4871644, 1, 0, 0, 1, 1,
0.5006169, 0.3871958, 0.656581, 1, 0, 0, 1, 1,
0.5046487, -0.7297236, 2.379751, 0, 0, 0, 1, 1,
0.5068106, -0.1073879, 2.698392, 0, 0, 0, 1, 1,
0.5094085, -0.2709806, 2.488793, 0, 0, 0, 1, 1,
0.510033, -1.358068, 2.867439, 0, 0, 0, 1, 1,
0.5146765, -1.848389, 4.466279, 0, 0, 0, 1, 1,
0.5153325, 1.896801, -0.2620373, 0, 0, 0, 1, 1,
0.5240795, -1.1157, 1.72666, 0, 0, 0, 1, 1,
0.5288809, -1.214955, 1.323682, 1, 1, 1, 1, 1,
0.5365475, -1.297509, 4.378525, 1, 1, 1, 1, 1,
0.5401931, 0.4690812, 0.8979379, 1, 1, 1, 1, 1,
0.543728, 1.98441, 0.01262698, 1, 1, 1, 1, 1,
0.548226, 0.3819902, 1.780121, 1, 1, 1, 1, 1,
0.5492824, 2.194161, 1.330031, 1, 1, 1, 1, 1,
0.5542107, -0.07633839, 3.195233, 1, 1, 1, 1, 1,
0.5564312, -0.957541, 4.017195, 1, 1, 1, 1, 1,
0.5571424, -0.1821933, 0.9605902, 1, 1, 1, 1, 1,
0.5646762, -1.033527, 1.616457, 1, 1, 1, 1, 1,
0.5701162, 0.2286642, 0.2194949, 1, 1, 1, 1, 1,
0.5704006, -0.7585225, 2.993432, 1, 1, 1, 1, 1,
0.5716934, -0.849598, 1.708962, 1, 1, 1, 1, 1,
0.5718053, 0.1487744, 3.334265, 1, 1, 1, 1, 1,
0.5745978, -2.495538, 3.733052, 1, 1, 1, 1, 1,
0.5844188, 1.24953, 2.080893, 0, 0, 1, 1, 1,
0.5893505, 0.8477526, 0.08330455, 1, 0, 0, 1, 1,
0.5907778, -0.6578357, 1.864272, 1, 0, 0, 1, 1,
0.5958929, -0.2015316, 0.4859937, 1, 0, 0, 1, 1,
0.5964007, 0.5375069, -0.4768758, 1, 0, 0, 1, 1,
0.5974717, 0.7215478, -0.1794176, 1, 0, 0, 1, 1,
0.598214, 2.830179, 0.3885878, 0, 0, 0, 1, 1,
0.5991454, -1.662362, 4.035312, 0, 0, 0, 1, 1,
0.6062633, -0.08090778, 1.708998, 0, 0, 0, 1, 1,
0.6079649, -0.6416179, 2.133924, 0, 0, 0, 1, 1,
0.608522, -0.1330561, 1.96177, 0, 0, 0, 1, 1,
0.6127006, -0.6156541, 2.786107, 0, 0, 0, 1, 1,
0.6133546, -1.355345, 3.69479, 0, 0, 0, 1, 1,
0.6190469, 0.5607858, 1.49068, 1, 1, 1, 1, 1,
0.6324177, 1.457514, -0.1665785, 1, 1, 1, 1, 1,
0.6341269, 1.40831, 1.137997, 1, 1, 1, 1, 1,
0.6382251, -0.9567414, 1.19448, 1, 1, 1, 1, 1,
0.6410945, -0.4736178, 1.745638, 1, 1, 1, 1, 1,
0.6431413, -0.8751182, 3.370383, 1, 1, 1, 1, 1,
0.6536989, -0.09585097, 1.21124, 1, 1, 1, 1, 1,
0.6544175, 1.323948, -0.1808383, 1, 1, 1, 1, 1,
0.6607437, 0.1914215, 1.909678, 1, 1, 1, 1, 1,
0.6615981, -0.839196, 2.752423, 1, 1, 1, 1, 1,
0.6705515, 0.2980314, 2.237302, 1, 1, 1, 1, 1,
0.6724114, -0.5446979, 0.918579, 1, 1, 1, 1, 1,
0.6760699, 1.373825, 1.162052, 1, 1, 1, 1, 1,
0.6781735, 0.8358984, 0.5319299, 1, 1, 1, 1, 1,
0.6802737, -0.8675194, 2.63311, 1, 1, 1, 1, 1,
0.6805111, -0.2214026, 2.0752, 0, 0, 1, 1, 1,
0.6817783, -0.1067642, 0.8588836, 1, 0, 0, 1, 1,
0.6828074, -0.5955835, 1.31367, 1, 0, 0, 1, 1,
0.6850704, -0.3921939, 2.376098, 1, 0, 0, 1, 1,
0.6889998, 1.965485, -1.919858, 1, 0, 0, 1, 1,
0.6925886, -1.9284, 2.663994, 1, 0, 0, 1, 1,
0.6941039, -0.4125966, 2.224384, 0, 0, 0, 1, 1,
0.6976618, -1.15315, 1.275779, 0, 0, 0, 1, 1,
0.7042732, -0.520186, 3.913095, 0, 0, 0, 1, 1,
0.7070028, 0.9567819, 2.689709, 0, 0, 0, 1, 1,
0.7120926, 0.08078936, 0.03604258, 0, 0, 0, 1, 1,
0.7130524, -1.762198, 3.669834, 0, 0, 0, 1, 1,
0.7171177, -0.231751, 2.952561, 0, 0, 0, 1, 1,
0.7181906, 0.8645265, 0.5711619, 1, 1, 1, 1, 1,
0.7223385, -0.3782428, 2.549079, 1, 1, 1, 1, 1,
0.7244475, -2.151442, 3.100156, 1, 1, 1, 1, 1,
0.7394536, -0.7224331, 2.959998, 1, 1, 1, 1, 1,
0.7403291, 0.7002057, 2.073986, 1, 1, 1, 1, 1,
0.7614616, -0.7288958, 3.63826, 1, 1, 1, 1, 1,
0.7623189, 1.539428, -0.3093923, 1, 1, 1, 1, 1,
0.7626256, 0.7534693, 0.5448604, 1, 1, 1, 1, 1,
0.7640193, -0.7321832, 2.605034, 1, 1, 1, 1, 1,
0.7664148, -0.9545202, 3.096366, 1, 1, 1, 1, 1,
0.768005, -2.23742, 2.300628, 1, 1, 1, 1, 1,
0.7701223, 0.9261845, 1.374938, 1, 1, 1, 1, 1,
0.7721252, -2.272097, 0.2296765, 1, 1, 1, 1, 1,
0.7748672, -0.5422463, 1.387665, 1, 1, 1, 1, 1,
0.7753775, -0.3696406, 3.974529, 1, 1, 1, 1, 1,
0.7805369, 0.9476478, -0.3053065, 0, 0, 1, 1, 1,
0.7841131, 0.1714625, 1.652282, 1, 0, 0, 1, 1,
0.7866539, 0.7559091, -0.03075049, 1, 0, 0, 1, 1,
0.786958, 0.4535177, 0.971992, 1, 0, 0, 1, 1,
0.7955836, 0.3446687, 1.567389, 1, 0, 0, 1, 1,
0.8108236, -1.806745, 4.140058, 1, 0, 0, 1, 1,
0.8174481, 1.076739, -0.1772571, 0, 0, 0, 1, 1,
0.8188151, 0.4691751, -0.1787626, 0, 0, 0, 1, 1,
0.8188956, -1.144048, 3.810205, 0, 0, 0, 1, 1,
0.8217344, 0.5532467, -1.643709, 0, 0, 0, 1, 1,
0.8241816, 0.3099899, 0.3881485, 0, 0, 0, 1, 1,
0.8303621, 0.7953448, 1.390121, 0, 0, 0, 1, 1,
0.8314231, -1.120193, 2.507607, 0, 0, 0, 1, 1,
0.832368, -0.370386, 1.193014, 1, 1, 1, 1, 1,
0.8375587, -1.106474, 4.097321, 1, 1, 1, 1, 1,
0.8422366, -0.6474762, 1.772085, 1, 1, 1, 1, 1,
0.8514301, 0.983997, 1.598438, 1, 1, 1, 1, 1,
0.856366, 0.2409047, -0.1543261, 1, 1, 1, 1, 1,
0.8581283, 0.9592053, -0.140838, 1, 1, 1, 1, 1,
0.8595305, -0.7407525, 0.9153525, 1, 1, 1, 1, 1,
0.8596465, 0.5872961, 1.929695, 1, 1, 1, 1, 1,
0.8614998, 0.4548429, 1.119876, 1, 1, 1, 1, 1,
0.8638223, 0.5704864, 1.510113, 1, 1, 1, 1, 1,
0.8649352, 0.2122432, 2.130363, 1, 1, 1, 1, 1,
0.8686461, 0.6521485, 0.4027897, 1, 1, 1, 1, 1,
0.8697409, -1.449991, 0.6649171, 1, 1, 1, 1, 1,
0.8705353, 1.723812, 0.2121858, 1, 1, 1, 1, 1,
0.8832286, 0.4496798, 0.8611303, 1, 1, 1, 1, 1,
0.8844458, 0.03413019, 0.6746964, 0, 0, 1, 1, 1,
0.8989427, 0.4378017, 3.034996, 1, 0, 0, 1, 1,
0.902083, 0.1735383, 0.7612218, 1, 0, 0, 1, 1,
0.9024925, -0.3597701, 2.164256, 1, 0, 0, 1, 1,
0.9059026, -1.190481, 1.931407, 1, 0, 0, 1, 1,
0.9204587, 1.332776, 1.606827, 1, 0, 0, 1, 1,
0.9275133, 0.05047018, 2.831867, 0, 0, 0, 1, 1,
0.9298897, 0.3893763, 1.148244, 0, 0, 0, 1, 1,
0.930672, -0.3642959, 1.395411, 0, 0, 0, 1, 1,
0.9348448, -1.447657, 3.608855, 0, 0, 0, 1, 1,
0.9368712, -0.181302, 2.574514, 0, 0, 0, 1, 1,
0.9450051, -0.08615068, 1.184755, 0, 0, 0, 1, 1,
0.9458632, -0.3401737, 2.57532, 0, 0, 0, 1, 1,
0.9488918, 1.451, -0.4134069, 1, 1, 1, 1, 1,
0.9518157, -0.04655522, 0.1762971, 1, 1, 1, 1, 1,
0.9543351, 0.2962415, -0.8667431, 1, 1, 1, 1, 1,
0.9552637, -0.0271091, 3.259832, 1, 1, 1, 1, 1,
0.9591815, 0.9082804, -0.3731559, 1, 1, 1, 1, 1,
0.9621418, 0.01550755, 2.325346, 1, 1, 1, 1, 1,
0.9627025, -0.1110253, 1.437282, 1, 1, 1, 1, 1,
0.9634936, 0.4870505, -0.04220144, 1, 1, 1, 1, 1,
0.9661293, 0.4484152, 1.139766, 1, 1, 1, 1, 1,
0.9663071, -0.9602347, 3.346541, 1, 1, 1, 1, 1,
0.9796622, -0.002901388, 1.13715, 1, 1, 1, 1, 1,
0.9826759, -0.7314004, 1.360724, 1, 1, 1, 1, 1,
0.9832436, 1.760831, 0.1378448, 1, 1, 1, 1, 1,
0.9834645, 0.5120715, 0.5503861, 1, 1, 1, 1, 1,
0.9911801, -0.5897614, 2.633089, 1, 1, 1, 1, 1,
0.992617, 0.6557683, 0.5493481, 0, 0, 1, 1, 1,
0.9940323, -0.6192768, 2.462263, 1, 0, 0, 1, 1,
0.999813, 0.03453512, 1.722331, 1, 0, 0, 1, 1,
1.002689, -0.9827105, 3.870649, 1, 0, 0, 1, 1,
1.010068, 0.8463889, 1.252547, 1, 0, 0, 1, 1,
1.015754, 0.7415017, 1.627752, 1, 0, 0, 1, 1,
1.019561, -2.232829, 2.066047, 0, 0, 0, 1, 1,
1.026273, 0.2766436, 0.1362122, 0, 0, 0, 1, 1,
1.027277, -0.1959946, -0.1175525, 0, 0, 0, 1, 1,
1.028145, 0.8334228, 0.9242724, 0, 0, 0, 1, 1,
1.031034, 1.302003, 1.991467, 0, 0, 0, 1, 1,
1.031812, 0.7804886, -0.06951683, 0, 0, 0, 1, 1,
1.032194, -0.8433052, 1.839934, 0, 0, 0, 1, 1,
1.032449, -0.6531278, 1.964737, 1, 1, 1, 1, 1,
1.040512, -0.6345819, 1.162658, 1, 1, 1, 1, 1,
1.054516, 1.291677, 0.140822, 1, 1, 1, 1, 1,
1.056841, -0.9244452, 2.82437, 1, 1, 1, 1, 1,
1.063963, 0.8177316, 0.380875, 1, 1, 1, 1, 1,
1.064279, 1.105047, 0.3630008, 1, 1, 1, 1, 1,
1.067011, -0.2083865, 1.550149, 1, 1, 1, 1, 1,
1.067742, -0.6012005, 0.731266, 1, 1, 1, 1, 1,
1.078612, -2.158602, 2.013844, 1, 1, 1, 1, 1,
1.086371, 2.015663, 0.9334836, 1, 1, 1, 1, 1,
1.094677, 0.7407731, 0.2000562, 1, 1, 1, 1, 1,
1.095597, 1.220214, 0.1058048, 1, 1, 1, 1, 1,
1.097726, 0.5122045, 0.3186944, 1, 1, 1, 1, 1,
1.099216, 0.6921788, 0.9145473, 1, 1, 1, 1, 1,
1.101287, -1.039055, 1.281838, 1, 1, 1, 1, 1,
1.102751, 1.229817, -0.8093442, 0, 0, 1, 1, 1,
1.117404, 0.09155025, 1.920911, 1, 0, 0, 1, 1,
1.121901, -0.6106613, 1.00342, 1, 0, 0, 1, 1,
1.13093, -0.4061501, 1.927919, 1, 0, 0, 1, 1,
1.13457, 1.249992, 2.061989, 1, 0, 0, 1, 1,
1.137622, -1.602386, 3.200045, 1, 0, 0, 1, 1,
1.145176, -0.9424628, 3.248618, 0, 0, 0, 1, 1,
1.162089, 0.9993731, 2.794667, 0, 0, 0, 1, 1,
1.163683, 0.8197345, 0.5083171, 0, 0, 0, 1, 1,
1.170344, -0.5235206, 0.381371, 0, 0, 0, 1, 1,
1.176856, -1.713495, 2.204263, 0, 0, 0, 1, 1,
1.180208, -1.803913, 2.26755, 0, 0, 0, 1, 1,
1.199681, 0.1247733, -0.06315205, 0, 0, 0, 1, 1,
1.199934, 1.012093, 0.4679074, 1, 1, 1, 1, 1,
1.208372, -0.4462552, 1.68735, 1, 1, 1, 1, 1,
1.219557, 1.698795, 0.2362082, 1, 1, 1, 1, 1,
1.221326, -2.334234, 2.654759, 1, 1, 1, 1, 1,
1.22852, -0.3166914, 2.140903, 1, 1, 1, 1, 1,
1.230338, -0.7282304, 3.414959, 1, 1, 1, 1, 1,
1.233037, 0.2183919, 0.9880244, 1, 1, 1, 1, 1,
1.243616, 1.180104, 0.2855883, 1, 1, 1, 1, 1,
1.243864, -0.9237687, 2.100361, 1, 1, 1, 1, 1,
1.24563, 1.437486, 0.2676021, 1, 1, 1, 1, 1,
1.256801, 1.68229, -0.2344011, 1, 1, 1, 1, 1,
1.2572, -1.284429, -0.0588861, 1, 1, 1, 1, 1,
1.259763, 1.523683, 1.097514, 1, 1, 1, 1, 1,
1.264632, 0.5673943, 0.5729717, 1, 1, 1, 1, 1,
1.266034, -1.758595, 4.851322, 1, 1, 1, 1, 1,
1.267644, -0.1332687, -1.103212, 0, 0, 1, 1, 1,
1.273543, -0.4318315, 0.01195526, 1, 0, 0, 1, 1,
1.276282, 0.1610995, 2.390356, 1, 0, 0, 1, 1,
1.277542, -0.7436718, 1.861074, 1, 0, 0, 1, 1,
1.280364, 0.4401039, 2.125651, 1, 0, 0, 1, 1,
1.28424, -0.1501759, 2.871565, 1, 0, 0, 1, 1,
1.286764, -0.4080812, 3.39414, 0, 0, 0, 1, 1,
1.299334, -0.1941212, 2.963336, 0, 0, 0, 1, 1,
1.300294, -1.770047, 3.030185, 0, 0, 0, 1, 1,
1.300585, 0.2096022, -0.6962554, 0, 0, 0, 1, 1,
1.300986, 0.1563685, 3.052388, 0, 0, 0, 1, 1,
1.302951, -0.7648032, 5.067512, 0, 0, 0, 1, 1,
1.308019, 2.062675, 0.3814949, 0, 0, 0, 1, 1,
1.312355, -0.01852817, 2.929703, 1, 1, 1, 1, 1,
1.312408, -0.4889497, 0.3234242, 1, 1, 1, 1, 1,
1.321917, -0.01511275, 1.987797, 1, 1, 1, 1, 1,
1.328105, -0.2626969, 0.1364938, 1, 1, 1, 1, 1,
1.332994, 0.5597198, -0.7509729, 1, 1, 1, 1, 1,
1.33654, 0.8125965, 1.594147, 1, 1, 1, 1, 1,
1.337125, 1.041923, -0.506463, 1, 1, 1, 1, 1,
1.362962, 0.8851447, -0.2964912, 1, 1, 1, 1, 1,
1.36362, -0.4965369, 3.824069, 1, 1, 1, 1, 1,
1.3716, -0.629347, 3.093504, 1, 1, 1, 1, 1,
1.375401, 0.2852988, 0.4967867, 1, 1, 1, 1, 1,
1.384754, 1.804764, 0.05632097, 1, 1, 1, 1, 1,
1.397529, -0.6399699, 1.136397, 1, 1, 1, 1, 1,
1.398788, 0.7019213, 0.3315795, 1, 1, 1, 1, 1,
1.400268, -1.762207, 4.45758, 1, 1, 1, 1, 1,
1.408697, -0.613918, 1.863923, 0, 0, 1, 1, 1,
1.414947, 0.3361392, 1.389069, 1, 0, 0, 1, 1,
1.423107, 0.2635827, 0.2591643, 1, 0, 0, 1, 1,
1.4248, -0.540481, 2.327183, 1, 0, 0, 1, 1,
1.430616, -0.3375073, 3.001155, 1, 0, 0, 1, 1,
1.443068, 0.305109, 2.587752, 1, 0, 0, 1, 1,
1.443645, 0.6621719, 1.631734, 0, 0, 0, 1, 1,
1.455884, -0.4145391, 2.355513, 0, 0, 0, 1, 1,
1.456611, 0.569995, 2.209215, 0, 0, 0, 1, 1,
1.464141, 0.359663, -0.2432136, 0, 0, 0, 1, 1,
1.467043, 0.6842288, 2.363761, 0, 0, 0, 1, 1,
1.470489, -2.111994, 3.200003, 0, 0, 0, 1, 1,
1.478897, -1.042815, -0.2703831, 0, 0, 0, 1, 1,
1.481408, 0.1830136, 1.364073, 1, 1, 1, 1, 1,
1.484749, -0.0489979, 1.933166, 1, 1, 1, 1, 1,
1.49154, 0.5201722, 0.6332895, 1, 1, 1, 1, 1,
1.494195, -0.2941138, 3.183674, 1, 1, 1, 1, 1,
1.495524, 0.9574866, 0.7167715, 1, 1, 1, 1, 1,
1.49613, 0.6855462, 1.445199, 1, 1, 1, 1, 1,
1.504555, 0.263623, -0.09395473, 1, 1, 1, 1, 1,
1.505335, 2.089134, 0.5175821, 1, 1, 1, 1, 1,
1.51795, 0.1860428, 0.7480997, 1, 1, 1, 1, 1,
1.526471, 0.3639714, 0.9369335, 1, 1, 1, 1, 1,
1.53166, 0.778172, 1.275282, 1, 1, 1, 1, 1,
1.533609, 0.5247284, 0.5423123, 1, 1, 1, 1, 1,
1.533853, 0.4911539, 0.263568, 1, 1, 1, 1, 1,
1.538331, 0.8060732, 1.521841, 1, 1, 1, 1, 1,
1.557769, -0.5554292, 2.537273, 1, 1, 1, 1, 1,
1.561661, 0.1697478, 0.8835405, 0, 0, 1, 1, 1,
1.57243, -0.6141943, 0.8194946, 1, 0, 0, 1, 1,
1.581739, 0.6397528, 1.802981, 1, 0, 0, 1, 1,
1.595464, -0.1022577, 1.805884, 1, 0, 0, 1, 1,
1.609706, 0.01603894, 2.250362, 1, 0, 0, 1, 1,
1.612936, -0.05421665, 1.668843, 1, 0, 0, 1, 1,
1.620482, 1.574668, 1.453849, 0, 0, 0, 1, 1,
1.621145, 1.289965, 1.729206, 0, 0, 0, 1, 1,
1.624918, 1.91206, 1.778569, 0, 0, 0, 1, 1,
1.627308, -0.6434644, 1.550545, 0, 0, 0, 1, 1,
1.631692, 1.169185, -1.677699, 0, 0, 0, 1, 1,
1.640192, -0.2165749, 0.7889062, 0, 0, 0, 1, 1,
1.654317, -1.096146, 1.601615, 0, 0, 0, 1, 1,
1.675241, -0.8815072, 1.886823, 1, 1, 1, 1, 1,
1.68527, 1.438058, 0.7478213, 1, 1, 1, 1, 1,
1.687981, 0.6468939, 2.9943, 1, 1, 1, 1, 1,
1.693566, 1.255983, 0.9161673, 1, 1, 1, 1, 1,
1.702709, -0.3665738, -0.09105453, 1, 1, 1, 1, 1,
1.718231, 0.08090171, 1.329466, 1, 1, 1, 1, 1,
1.72035, 0.8507756, 2.765471, 1, 1, 1, 1, 1,
1.726098, -1.459846, 3.043867, 1, 1, 1, 1, 1,
1.738801, 0.6039268, -0.6106387, 1, 1, 1, 1, 1,
1.739586, -0.9814305, 1.895734, 1, 1, 1, 1, 1,
1.751784, -0.2491718, 2.787033, 1, 1, 1, 1, 1,
1.774149, -0.1492873, 2.798864, 1, 1, 1, 1, 1,
1.795994, 1.372779, -0.08681232, 1, 1, 1, 1, 1,
1.815179, 0.6580324, 0.9306924, 1, 1, 1, 1, 1,
1.844949, 1.100748, 1.286003, 1, 1, 1, 1, 1,
1.858469, -1.587725, 1.453317, 0, 0, 1, 1, 1,
1.871199, 0.6797649, -0.3416068, 1, 0, 0, 1, 1,
1.877027, -0.2825606, 1.169917, 1, 0, 0, 1, 1,
1.880713, -2.565929, 2.321702, 1, 0, 0, 1, 1,
1.881071, -0.3425421, 0.9361997, 1, 0, 0, 1, 1,
1.88705, 0.3298777, -0.2300737, 1, 0, 0, 1, 1,
1.926626, -0.01912488, 0.2448769, 0, 0, 0, 1, 1,
1.934719, 0.949385, -0.00181138, 0, 0, 0, 1, 1,
1.945134, -0.776166, 2.97788, 0, 0, 0, 1, 1,
1.956253, 0.2662941, 1.18132, 0, 0, 0, 1, 1,
1.962883, -0.3615385, 2.094349, 0, 0, 0, 1, 1,
1.969321, -1.07816, 2.14735, 0, 0, 0, 1, 1,
1.984138, -0.6589518, 0.5929775, 0, 0, 0, 1, 1,
1.989477, -1.195283, 2.460254, 1, 1, 1, 1, 1,
2.014332, -0.2033219, 1.914558, 1, 1, 1, 1, 1,
2.017327, -0.1191804, 1.957916, 1, 1, 1, 1, 1,
2.019639, 1.644287, 1.796296, 1, 1, 1, 1, 1,
2.026041, 0.719122, 2.864322, 1, 1, 1, 1, 1,
2.029898, 0.2588919, 2.141764, 1, 1, 1, 1, 1,
2.079546, -0.1717166, 1.478666, 1, 1, 1, 1, 1,
2.085443, -1.223918, 3.256468, 1, 1, 1, 1, 1,
2.088393, 0.5610111, 0.3551807, 1, 1, 1, 1, 1,
2.103163, -0.5095434, 2.833564, 1, 1, 1, 1, 1,
2.137738, 0.7470063, 1.011161, 1, 1, 1, 1, 1,
2.164867, -1.54329, 2.30463, 1, 1, 1, 1, 1,
2.165136, -0.1234999, 0.8137839, 1, 1, 1, 1, 1,
2.18405, 0.02228865, 0.09963705, 1, 1, 1, 1, 1,
2.235358, -1.313421, 1.799008, 1, 1, 1, 1, 1,
2.329779, -0.7188021, 0.420646, 0, 0, 1, 1, 1,
2.335428, -0.4379872, 2.952296, 1, 0, 0, 1, 1,
2.358111, 0.1776135, 2.379628, 1, 0, 0, 1, 1,
2.366635, -0.0649838, 1.459565, 1, 0, 0, 1, 1,
2.37709, -2.023175, 2.430445, 1, 0, 0, 1, 1,
2.439973, 0.3791245, -0.6903243, 1, 0, 0, 1, 1,
2.464154, -0.2731261, 2.582973, 0, 0, 0, 1, 1,
2.488724, 1.468133, -0.72878, 0, 0, 0, 1, 1,
2.488746, -0.9788975, 1.978707, 0, 0, 0, 1, 1,
2.49887, -0.4717837, 0.3307175, 0, 0, 0, 1, 1,
2.561604, 1.386967, 0.6181877, 0, 0, 0, 1, 1,
2.564534, 0.4154178, 1.623637, 0, 0, 0, 1, 1,
2.568718, 0.685576, 0.3538491, 0, 0, 0, 1, 1,
2.610574, -1.305079, 2.525271, 1, 1, 1, 1, 1,
2.631567, 0.2316824, 0.7025746, 1, 1, 1, 1, 1,
2.811593, -0.9704235, 1.583913, 1, 1, 1, 1, 1,
2.912115, -0.5604529, -0.9864139, 1, 1, 1, 1, 1,
2.918061, 0.629493, 1.524184, 1, 1, 1, 1, 1,
3.133619, 1.075607, -0.4059336, 1, 1, 1, 1, 1,
4.31076, 2.852384, -0.3802681, 1, 1, 1, 1, 1
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
var radius = 10.48688;
var distance = 36.83472;
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
mvMatrix.translate( -0.4687002, -0.09951448, 0.4778125 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.83472);
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
