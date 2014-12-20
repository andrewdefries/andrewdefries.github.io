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
-3.501803, 2.30727, 0.07410579, 1, 0, 0, 1,
-3.343076, -0.0755216, -1.468943, 1, 0.007843138, 0, 1,
-3.168595, -0.124207, -2.397594, 1, 0.01176471, 0, 1,
-2.836156, -0.554471, -2.662508, 1, 0.01960784, 0, 1,
-2.654991, -0.8364182, -2.192283, 1, 0.02352941, 0, 1,
-2.561086, -0.8376228, -3.667672, 1, 0.03137255, 0, 1,
-2.53547, -0.8641807, -1.711515, 1, 0.03529412, 0, 1,
-2.511569, 1.53304, -0.1344111, 1, 0.04313726, 0, 1,
-2.460025, 0.3240947, -2.816875, 1, 0.04705882, 0, 1,
-2.436225, -0.3140639, -1.620934, 1, 0.05490196, 0, 1,
-2.425243, 2.238952, -1.570572, 1, 0.05882353, 0, 1,
-2.361328, 0.2153029, -2.307079, 1, 0.06666667, 0, 1,
-2.315504, 0.9390985, -1.718463, 1, 0.07058824, 0, 1,
-2.27429, -0.8651471, -1.021664, 1, 0.07843138, 0, 1,
-2.230199, -2.60448, -1.666569, 1, 0.08235294, 0, 1,
-2.160006, -0.2612292, -2.945271, 1, 0.09019608, 0, 1,
-2.139638, -0.0216202, -3.819411, 1, 0.09411765, 0, 1,
-2.109002, -1.827673, -2.429635, 1, 0.1019608, 0, 1,
-2.105151, -1.306348, -2.861514, 1, 0.1098039, 0, 1,
-2.067584, -0.3875468, -0.5124921, 1, 0.1137255, 0, 1,
-2.061509, -1.344528, -1.349271, 1, 0.1215686, 0, 1,
-2.0586, -1.473636, -0.6257043, 1, 0.1254902, 0, 1,
-2.052279, -1.983118, -3.503278, 1, 0.1333333, 0, 1,
-2.047395, -1.743165, -3.031012, 1, 0.1372549, 0, 1,
-2.034381, -1.787827, -3.020098, 1, 0.145098, 0, 1,
-2.029583, 0.7509226, -1.842591, 1, 0.1490196, 0, 1,
-2.010692, 0.8489028, -0.5360267, 1, 0.1568628, 0, 1,
-2.007603, 0.6798295, -2.30339, 1, 0.1607843, 0, 1,
-2.004526, 1.49943, -1.575822, 1, 0.1686275, 0, 1,
-1.951309, 1.24186, -1.790807, 1, 0.172549, 0, 1,
-1.948502, -0.3711392, -0.6552702, 1, 0.1803922, 0, 1,
-1.893027, 2.10351, -0.6358452, 1, 0.1843137, 0, 1,
-1.888534, 1.598164, 0.8060508, 1, 0.1921569, 0, 1,
-1.886745, -3.594444, -2.542189, 1, 0.1960784, 0, 1,
-1.882338, 0.6518409, 0.04193018, 1, 0.2039216, 0, 1,
-1.867817, 2.448019, -0.8100875, 1, 0.2117647, 0, 1,
-1.865135, -0.3927655, -2.528834, 1, 0.2156863, 0, 1,
-1.865052, 0.01854419, -1.362523, 1, 0.2235294, 0, 1,
-1.845394, -1.392402, -1.834213, 1, 0.227451, 0, 1,
-1.820809, -1.511331, -3.144356, 1, 0.2352941, 0, 1,
-1.815601, 0.1995422, -0.3038402, 1, 0.2392157, 0, 1,
-1.811595, -1.068245, -2.403454, 1, 0.2470588, 0, 1,
-1.806808, -0.9724532, -1.564691, 1, 0.2509804, 0, 1,
-1.781017, -0.2320556, -2.76042, 1, 0.2588235, 0, 1,
-1.761173, 2.191305, -0.7320484, 1, 0.2627451, 0, 1,
-1.760624, -0.2991675, -2.480215, 1, 0.2705882, 0, 1,
-1.745, -1.462246, -3.161121, 1, 0.2745098, 0, 1,
-1.742182, 0.3210192, -1.702283, 1, 0.282353, 0, 1,
-1.735393, 0.1661093, -0.9080722, 1, 0.2862745, 0, 1,
-1.735147, -0.2754007, -0.9817747, 1, 0.2941177, 0, 1,
-1.721243, -0.1867137, -2.217917, 1, 0.3019608, 0, 1,
-1.720958, 1.815666, -2.771388, 1, 0.3058824, 0, 1,
-1.681416, 1.739873, -1.268625, 1, 0.3137255, 0, 1,
-1.678451, 0.0683351, 0.2217014, 1, 0.3176471, 0, 1,
-1.674929, -0.9606155, -2.042234, 1, 0.3254902, 0, 1,
-1.672667, -1.404483, -1.379345, 1, 0.3294118, 0, 1,
-1.632574, -0.8950534, -1.681312, 1, 0.3372549, 0, 1,
-1.632308, 0.0746265, -1.475505, 1, 0.3411765, 0, 1,
-1.629442, -0.3202133, -1.960931, 1, 0.3490196, 0, 1,
-1.627455, 1.091811, -0.7279536, 1, 0.3529412, 0, 1,
-1.623917, 0.4079668, 0.0928084, 1, 0.3607843, 0, 1,
-1.586541, -1.540646, -1.678116, 1, 0.3647059, 0, 1,
-1.585742, 0.3683722, -1.206305, 1, 0.372549, 0, 1,
-1.578329, -0.395136, -0.7948617, 1, 0.3764706, 0, 1,
-1.571393, -0.05465028, -2.823939, 1, 0.3843137, 0, 1,
-1.570335, 1.52731, -1.332392, 1, 0.3882353, 0, 1,
-1.566743, -0.6946503, -2.131022, 1, 0.3960784, 0, 1,
-1.542456, 1.11904, -4.186238, 1, 0.4039216, 0, 1,
-1.515374, -1.312371, -2.935362, 1, 0.4078431, 0, 1,
-1.503262, -0.3014842, -0.004887246, 1, 0.4156863, 0, 1,
-1.496202, 1.65774, -0.08847504, 1, 0.4196078, 0, 1,
-1.492971, 1.638805, -0.7670953, 1, 0.427451, 0, 1,
-1.482622, 1.964766, -0.7703804, 1, 0.4313726, 0, 1,
-1.480016, 0.5537195, -2.134651, 1, 0.4392157, 0, 1,
-1.4754, -0.3224172, -2.492737, 1, 0.4431373, 0, 1,
-1.450097, -1.75532, -1.95285, 1, 0.4509804, 0, 1,
-1.443806, -1.079928, -2.564228, 1, 0.454902, 0, 1,
-1.443321, 0.09601833, 0.1460311, 1, 0.4627451, 0, 1,
-1.437635, 1.062378, -1.727279, 1, 0.4666667, 0, 1,
-1.431956, 0.1710344, -2.259827, 1, 0.4745098, 0, 1,
-1.430381, 0.1176002, -1.604219, 1, 0.4784314, 0, 1,
-1.413278, 1.458845, -1.479476, 1, 0.4862745, 0, 1,
-1.405154, 0.5082331, -1.189756, 1, 0.4901961, 0, 1,
-1.40112, -0.5597779, -0.2377162, 1, 0.4980392, 0, 1,
-1.399886, 0.2551134, -1.554539, 1, 0.5058824, 0, 1,
-1.399402, -0.8048769, -3.558728, 1, 0.509804, 0, 1,
-1.394084, -2.02202, -3.685302, 1, 0.5176471, 0, 1,
-1.38964, -2.076955, -1.757303, 1, 0.5215687, 0, 1,
-1.387877, 0.2841318, -2.218035, 1, 0.5294118, 0, 1,
-1.384115, -0.159892, -0.8610413, 1, 0.5333334, 0, 1,
-1.365775, 1.226638, -0.8029295, 1, 0.5411765, 0, 1,
-1.362818, 1.984535, 0.2162145, 1, 0.5450981, 0, 1,
-1.356282, 0.1484991, -1.605451, 1, 0.5529412, 0, 1,
-1.350089, 0.1486278, -0.3323945, 1, 0.5568628, 0, 1,
-1.349126, 0.6774493, 0.5658134, 1, 0.5647059, 0, 1,
-1.343977, -1.90081, -3.699685, 1, 0.5686275, 0, 1,
-1.341614, 0.515724, -0.2743128, 1, 0.5764706, 0, 1,
-1.332246, 0.7945965, -2.175342, 1, 0.5803922, 0, 1,
-1.314036, -0.2980972, -1.627249, 1, 0.5882353, 0, 1,
-1.310438, 0.4289265, -2.263293, 1, 0.5921569, 0, 1,
-1.306776, -2.187235, -2.659244, 1, 0.6, 0, 1,
-1.298863, 0.7304869, -1.542759, 1, 0.6078432, 0, 1,
-1.297721, -0.3894438, -0.08979001, 1, 0.6117647, 0, 1,
-1.295725, -0.4568139, -1.377986, 1, 0.6196079, 0, 1,
-1.282343, -0.3185461, -0.5377528, 1, 0.6235294, 0, 1,
-1.267281, -0.3848179, -1.974012, 1, 0.6313726, 0, 1,
-1.26658, -1.141792, -2.746982, 1, 0.6352941, 0, 1,
-1.263599, -0.6789746, -2.23364, 1, 0.6431373, 0, 1,
-1.258099, 0.1015214, -1.915803, 1, 0.6470588, 0, 1,
-1.246786, -0.2599173, -1.435032, 1, 0.654902, 0, 1,
-1.239066, 1.156976, -0.4455934, 1, 0.6588235, 0, 1,
-1.238578, -0.2837041, -0.6147999, 1, 0.6666667, 0, 1,
-1.236133, -1.63056, -2.800184, 1, 0.6705883, 0, 1,
-1.232473, 0.6744194, 0.3839296, 1, 0.6784314, 0, 1,
-1.231466, -0.9060094, -2.61024, 1, 0.682353, 0, 1,
-1.225973, 0.4454314, -2.368039, 1, 0.6901961, 0, 1,
-1.219145, 1.36177, -1.487151, 1, 0.6941177, 0, 1,
-1.217498, -1.620512, -3.033321, 1, 0.7019608, 0, 1,
-1.217053, 0.4255329, -1.30385, 1, 0.7098039, 0, 1,
-1.214346, -1.34409, -1.198697, 1, 0.7137255, 0, 1,
-1.206078, -1.714713, -3.906713, 1, 0.7215686, 0, 1,
-1.193929, -0.430949, -1.809288, 1, 0.7254902, 0, 1,
-1.187148, 0.6843618, -3.189965, 1, 0.7333333, 0, 1,
-1.180065, 0.6606885, -1.15126, 1, 0.7372549, 0, 1,
-1.175334, 0.8118985, 0.4198745, 1, 0.7450981, 0, 1,
-1.174016, -0.1472082, -2.075339, 1, 0.7490196, 0, 1,
-1.173883, -0.8876391, -2.051898, 1, 0.7568628, 0, 1,
-1.171348, -0.478858, -3.56535, 1, 0.7607843, 0, 1,
-1.166909, -0.9059804, -2.906106, 1, 0.7686275, 0, 1,
-1.166502, 0.5204778, -0.3657449, 1, 0.772549, 0, 1,
-1.163197, -0.8315132, -0.3959982, 1, 0.7803922, 0, 1,
-1.16189, -1.24079, -3.508702, 1, 0.7843137, 0, 1,
-1.154975, 1.814605, 0.4950832, 1, 0.7921569, 0, 1,
-1.15278, -0.3764783, -1.644234, 1, 0.7960784, 0, 1,
-1.149514, -1.341194, -3.154413, 1, 0.8039216, 0, 1,
-1.147241, 0.3681499, -0.5299623, 1, 0.8117647, 0, 1,
-1.143782, -0.3575088, -1.750004, 1, 0.8156863, 0, 1,
-1.140917, 0.6963891, -1.130714, 1, 0.8235294, 0, 1,
-1.139192, -0.8473996, -3.593673, 1, 0.827451, 0, 1,
-1.136333, 0.8511084, -1.005601, 1, 0.8352941, 0, 1,
-1.134641, 0.9644135, -1.100814, 1, 0.8392157, 0, 1,
-1.129264, -0.5360022, -0.8867704, 1, 0.8470588, 0, 1,
-1.12838, -0.1746355, -1.133423, 1, 0.8509804, 0, 1,
-1.119484, 0.5599693, -0.7112942, 1, 0.8588235, 0, 1,
-1.114706, -0.1951958, 0.03439841, 1, 0.8627451, 0, 1,
-1.1112, -0.9551116, -3.338068, 1, 0.8705882, 0, 1,
-1.104495, -1.983777, -4.021374, 1, 0.8745098, 0, 1,
-1.092309, -0.8657512, -1.840391, 1, 0.8823529, 0, 1,
-1.075735, -0.9788724, -2.727439, 1, 0.8862745, 0, 1,
-1.070361, 0.3490806, -1.046539, 1, 0.8941177, 0, 1,
-1.063156, -0.5586712, -0.9176083, 1, 0.8980392, 0, 1,
-1.060739, 0.9147441, -0.3195251, 1, 0.9058824, 0, 1,
-1.05863, -0.03994846, -1.425523, 1, 0.9137255, 0, 1,
-1.041302, -1.138956, -2.441489, 1, 0.9176471, 0, 1,
-1.03013, 0.9649264, 0.2833925, 1, 0.9254902, 0, 1,
-1.028298, -1.078423, -1.163448, 1, 0.9294118, 0, 1,
-1.025265, 0.2652738, -0.2386866, 1, 0.9372549, 0, 1,
-1.021954, 1.41844, -0.125392, 1, 0.9411765, 0, 1,
-1.020812, -0.6299459, -2.928963, 1, 0.9490196, 0, 1,
-1.019233, 0.8806686, -1.501695, 1, 0.9529412, 0, 1,
-1.018794, 2.067939, -1.709045, 1, 0.9607843, 0, 1,
-1.01789, 0.907931, -1.533567, 1, 0.9647059, 0, 1,
-1.015651, 0.6517858, -2.002532, 1, 0.972549, 0, 1,
-1.008407, 1.523574, -0.445441, 1, 0.9764706, 0, 1,
-0.9987417, 1.012018, -0.7382498, 1, 0.9843137, 0, 1,
-0.9957783, 0.4754428, -0.5298502, 1, 0.9882353, 0, 1,
-0.9930605, 1.475545, -1.771464, 1, 0.9960784, 0, 1,
-0.9915527, -0.6803423, -2.844983, 0.9960784, 1, 0, 1,
-0.9800007, 0.1386898, -0.4169559, 0.9921569, 1, 0, 1,
-0.9740142, -0.1837922, -2.795462, 0.9843137, 1, 0, 1,
-0.9732974, -0.6730533, -2.422612, 0.9803922, 1, 0, 1,
-0.9698396, -0.6399435, -0.8359261, 0.972549, 1, 0, 1,
-0.9659557, 1.38377, 0.9789726, 0.9686275, 1, 0, 1,
-0.9648358, 1.17223, -1.060159, 0.9607843, 1, 0, 1,
-0.9605957, -0.8933916, -1.335833, 0.9568627, 1, 0, 1,
-0.9593435, -0.1000794, -2.171861, 0.9490196, 1, 0, 1,
-0.9590037, -0.1155212, -1.648069, 0.945098, 1, 0, 1,
-0.958937, 0.0615112, -0.8219543, 0.9372549, 1, 0, 1,
-0.9583026, -0.3499411, -1.168974, 0.9333333, 1, 0, 1,
-0.9499717, 0.8604842, -3.296023, 0.9254902, 1, 0, 1,
-0.9452396, -0.7980568, -1.778548, 0.9215686, 1, 0, 1,
-0.9433206, 0.5597335, 0.20156, 0.9137255, 1, 0, 1,
-0.9410601, 0.08711959, -1.560908, 0.9098039, 1, 0, 1,
-0.9402452, -1.475443, -2.764381, 0.9019608, 1, 0, 1,
-0.934906, -0.7135432, -0.682001, 0.8941177, 1, 0, 1,
-0.9329082, 0.5936574, -1.502224, 0.8901961, 1, 0, 1,
-0.9319559, -1.079985, -3.4491, 0.8823529, 1, 0, 1,
-0.9231911, 0.2504897, -0.9886463, 0.8784314, 1, 0, 1,
-0.9197912, -1.562122, -1.939257, 0.8705882, 1, 0, 1,
-0.9093406, 0.658984, -1.37915, 0.8666667, 1, 0, 1,
-0.9089448, 0.2347208, 0.2449702, 0.8588235, 1, 0, 1,
-0.9034681, -0.05577392, -2.192809, 0.854902, 1, 0, 1,
-0.9028748, 0.2120332, -1.259473, 0.8470588, 1, 0, 1,
-0.9015035, -0.8660032, -3.290287, 0.8431373, 1, 0, 1,
-0.8969889, -0.5052694, -2.273175, 0.8352941, 1, 0, 1,
-0.8883624, 1.045861, -0.1390405, 0.8313726, 1, 0, 1,
-0.8878849, 1.282936, -0.5899881, 0.8235294, 1, 0, 1,
-0.8831248, -0.3179208, -1.143432, 0.8196079, 1, 0, 1,
-0.8821983, -1.030689, -2.35682, 0.8117647, 1, 0, 1,
-0.8809572, -0.412531, -1.815995, 0.8078431, 1, 0, 1,
-0.8796696, -0.8355913, -3.2992, 0.8, 1, 0, 1,
-0.8742744, -0.3947949, -2.569177, 0.7921569, 1, 0, 1,
-0.8658094, 0.338092, -1.121187, 0.7882353, 1, 0, 1,
-0.8624178, 1.699184, 0.7325022, 0.7803922, 1, 0, 1,
-0.8581724, 0.1192584, -0.9297568, 0.7764706, 1, 0, 1,
-0.8574366, 0.2606794, -1.903491, 0.7686275, 1, 0, 1,
-0.8521674, -1.575134, -3.632832, 0.7647059, 1, 0, 1,
-0.8458002, -0.00203174, -0.354891, 0.7568628, 1, 0, 1,
-0.8400767, -0.9937484, -2.88174, 0.7529412, 1, 0, 1,
-0.8400617, 0.4557893, -2.185163, 0.7450981, 1, 0, 1,
-0.8378616, -0.1132906, -2.036855, 0.7411765, 1, 0, 1,
-0.8368485, 0.4998232, -1.306644, 0.7333333, 1, 0, 1,
-0.8324353, -0.0698598, -0.948137, 0.7294118, 1, 0, 1,
-0.8254237, 0.2907206, -1.555368, 0.7215686, 1, 0, 1,
-0.8253816, -0.1486742, -0.2591615, 0.7176471, 1, 0, 1,
-0.8182589, -1.583285, -3.925644, 0.7098039, 1, 0, 1,
-0.8170615, -1.207818, -3.746379, 0.7058824, 1, 0, 1,
-0.8121279, -1.530737, -3.357721, 0.6980392, 1, 0, 1,
-0.8114856, -0.6137287, -3.436054, 0.6901961, 1, 0, 1,
-0.8052208, 2.005454, -0.1414045, 0.6862745, 1, 0, 1,
-0.805172, -0.7246707, -1.155966, 0.6784314, 1, 0, 1,
-0.8025829, 0.3416244, -0.941451, 0.6745098, 1, 0, 1,
-0.7989186, -0.4197318, -3.010679, 0.6666667, 1, 0, 1,
-0.7984861, -0.02064248, -1.339581, 0.6627451, 1, 0, 1,
-0.797382, -1.732311, -3.338758, 0.654902, 1, 0, 1,
-0.7960098, 0.352261, -2.965618, 0.6509804, 1, 0, 1,
-0.7870839, -1.146046, -3.09598, 0.6431373, 1, 0, 1,
-0.7862634, 0.1820169, -2.529942, 0.6392157, 1, 0, 1,
-0.7862359, 0.7549567, -1.747673, 0.6313726, 1, 0, 1,
-0.7841608, 0.2238446, -1.810062, 0.627451, 1, 0, 1,
-0.7798548, 0.378102, -0.03944311, 0.6196079, 1, 0, 1,
-0.77801, 1.977047, -0.4086689, 0.6156863, 1, 0, 1,
-0.776439, 0.2891769, -1.750881, 0.6078432, 1, 0, 1,
-0.7722097, -2.784033, -3.193249, 0.6039216, 1, 0, 1,
-0.7679883, -1.125909, -1.420402, 0.5960785, 1, 0, 1,
-0.7673905, -0.4923377, -1.376169, 0.5882353, 1, 0, 1,
-0.7614527, 0.229831, -0.8416593, 0.5843138, 1, 0, 1,
-0.7581326, -0.3796821, -0.8571208, 0.5764706, 1, 0, 1,
-0.7554607, 0.2268278, -2.208891, 0.572549, 1, 0, 1,
-0.7554285, -0.2946313, -1.097654, 0.5647059, 1, 0, 1,
-0.7484405, -0.08513609, -0.846046, 0.5607843, 1, 0, 1,
-0.7465083, -0.1513222, -2.224543, 0.5529412, 1, 0, 1,
-0.7421069, -0.231321, -1.721153, 0.5490196, 1, 0, 1,
-0.7401571, 0.9451913, -0.9867641, 0.5411765, 1, 0, 1,
-0.7398713, -0.6907145, -2.018301, 0.5372549, 1, 0, 1,
-0.7316269, 1.227204, 0.685289, 0.5294118, 1, 0, 1,
-0.7285626, 1.090385, -1.966824, 0.5254902, 1, 0, 1,
-0.7234007, 1.090955, 0.1301454, 0.5176471, 1, 0, 1,
-0.7062345, 0.6463498, -1.535377, 0.5137255, 1, 0, 1,
-0.6940704, -0.2475053, -0.2494673, 0.5058824, 1, 0, 1,
-0.6929779, -0.5882861, -1.703162, 0.5019608, 1, 0, 1,
-0.6882488, 0.06298499, -2.448543, 0.4941176, 1, 0, 1,
-0.6856366, -0.316757, -2.578535, 0.4862745, 1, 0, 1,
-0.6823995, 0.5670208, 0.09581281, 0.4823529, 1, 0, 1,
-0.6777666, 0.8744541, -1.494589, 0.4745098, 1, 0, 1,
-0.6748397, 2.371308, -2.282303, 0.4705882, 1, 0, 1,
-0.6721047, -1.251935, -2.007239, 0.4627451, 1, 0, 1,
-0.6658613, 0.1088569, -0.4341601, 0.4588235, 1, 0, 1,
-0.6647581, 1.198274, -0.8599756, 0.4509804, 1, 0, 1,
-0.6647525, 0.562636, -0.1843418, 0.4470588, 1, 0, 1,
-0.6615247, -2.264094, -1.63276, 0.4392157, 1, 0, 1,
-0.6594233, -0.9477372, -2.835548, 0.4352941, 1, 0, 1,
-0.6555052, 0.2501658, -0.8297288, 0.427451, 1, 0, 1,
-0.6544136, 0.2871838, -1.197541, 0.4235294, 1, 0, 1,
-0.6532597, -2.965857, -3.041529, 0.4156863, 1, 0, 1,
-0.6500348, 0.3685465, 0.0213738, 0.4117647, 1, 0, 1,
-0.6496143, -1.099715, -2.977062, 0.4039216, 1, 0, 1,
-0.6462401, 1.915364, -1.73105, 0.3960784, 1, 0, 1,
-0.6398368, -0.2579223, -3.123827, 0.3921569, 1, 0, 1,
-0.6373704, -1.625759, -2.289554, 0.3843137, 1, 0, 1,
-0.6350957, 0.3100013, -0.9823478, 0.3803922, 1, 0, 1,
-0.6284441, 0.691519, -1.746753, 0.372549, 1, 0, 1,
-0.6275728, 0.3049904, -0.9265221, 0.3686275, 1, 0, 1,
-0.6254476, -0.1871085, -2.733456, 0.3607843, 1, 0, 1,
-0.6245294, 0.1173239, -2.533312, 0.3568628, 1, 0, 1,
-0.6242619, 0.3838064, -0.3984528, 0.3490196, 1, 0, 1,
-0.621849, -0.1132511, -1.438684, 0.345098, 1, 0, 1,
-0.6218266, -0.8868169, -1.566757, 0.3372549, 1, 0, 1,
-0.6158951, 1.836872, -2.139085, 0.3333333, 1, 0, 1,
-0.614549, -0.6225403, -2.801023, 0.3254902, 1, 0, 1,
-0.6108457, 0.6081659, -0.4237842, 0.3215686, 1, 0, 1,
-0.60905, -0.9361213, -1.015505, 0.3137255, 1, 0, 1,
-0.6049567, 0.3184519, -0.6256492, 0.3098039, 1, 0, 1,
-0.5973642, 0.07694171, -1.204601, 0.3019608, 1, 0, 1,
-0.5967562, 8.598479e-05, 0.1857432, 0.2941177, 1, 0, 1,
-0.5923311, 0.5147148, 0.1599657, 0.2901961, 1, 0, 1,
-0.5822651, -1.685054, -4.030785, 0.282353, 1, 0, 1,
-0.5757475, -1.238853, -2.30801, 0.2784314, 1, 0, 1,
-0.5742525, 0.4673462, 0.188204, 0.2705882, 1, 0, 1,
-0.5704209, 0.7463132, -0.3474656, 0.2666667, 1, 0, 1,
-0.5703938, -0.3888054, -2.471886, 0.2588235, 1, 0, 1,
-0.5697268, -0.3509825, -1.829085, 0.254902, 1, 0, 1,
-0.5641132, -0.1424768, -0.9525036, 0.2470588, 1, 0, 1,
-0.5639091, 0.4136461, -0.5765454, 0.2431373, 1, 0, 1,
-0.5599417, -0.1843234, -2.349032, 0.2352941, 1, 0, 1,
-0.5457874, -1.139213, -2.905481, 0.2313726, 1, 0, 1,
-0.5408753, 0.7100148, -0.6260153, 0.2235294, 1, 0, 1,
-0.5395389, -0.3040652, -0.9827884, 0.2196078, 1, 0, 1,
-0.5395135, -1.889467, -5.070502, 0.2117647, 1, 0, 1,
-0.5377518, -1.293032, -3.030396, 0.2078431, 1, 0, 1,
-0.53118, -0.01757273, 1.38613, 0.2, 1, 0, 1,
-0.526564, 0.3163596, -0.8016592, 0.1921569, 1, 0, 1,
-0.5242599, -1.248176, -4.172936, 0.1882353, 1, 0, 1,
-0.520413, 0.9740282, 0.4214505, 0.1803922, 1, 0, 1,
-0.5186877, 0.3265338, -1.16307, 0.1764706, 1, 0, 1,
-0.5170082, -0.2833558, -2.916414, 0.1686275, 1, 0, 1,
-0.5155739, 0.5183344, -1.389046, 0.1647059, 1, 0, 1,
-0.5090115, 0.007284059, -3.233393, 0.1568628, 1, 0, 1,
-0.5084755, -0.06300022, -0.4788269, 0.1529412, 1, 0, 1,
-0.5025182, -1.07717, -1.5065, 0.145098, 1, 0, 1,
-0.5021082, -0.5869346, -3.621271, 0.1411765, 1, 0, 1,
-0.5000361, 1.326228, 0.6391669, 0.1333333, 1, 0, 1,
-0.4994287, -1.686476, -2.176362, 0.1294118, 1, 0, 1,
-0.4974975, 1.902395, -0.1897074, 0.1215686, 1, 0, 1,
-0.4966011, -0.1329479, -2.473634, 0.1176471, 1, 0, 1,
-0.4928614, -0.4944922, -2.28569, 0.1098039, 1, 0, 1,
-0.4916696, 0.531088, -1.739439, 0.1058824, 1, 0, 1,
-0.4890305, -0.06893864, 0.6136717, 0.09803922, 1, 0, 1,
-0.4856953, -0.55111, -3.200249, 0.09019608, 1, 0, 1,
-0.485622, 0.5701709, -1.420514, 0.08627451, 1, 0, 1,
-0.4824888, 0.3025081, -1.544005, 0.07843138, 1, 0, 1,
-0.4770355, 0.5487428, -0.6421478, 0.07450981, 1, 0, 1,
-0.4763975, 0.6177546, -0.6134367, 0.06666667, 1, 0, 1,
-0.4710536, 0.9956572, 0.5771741, 0.0627451, 1, 0, 1,
-0.4699717, -0.4627682, -4.309506, 0.05490196, 1, 0, 1,
-0.4665245, -0.8216537, -2.623113, 0.05098039, 1, 0, 1,
-0.4653109, 0.5929033, 1.36816, 0.04313726, 1, 0, 1,
-0.4591665, -1.930623, -4.315281, 0.03921569, 1, 0, 1,
-0.4590655, -1.136699, -2.182247, 0.03137255, 1, 0, 1,
-0.4581857, 0.01736088, -1.218809, 0.02745098, 1, 0, 1,
-0.4543612, 0.6217793, -0.7804167, 0.01960784, 1, 0, 1,
-0.4511595, -1.899243, -3.217268, 0.01568628, 1, 0, 1,
-0.449953, 0.1614083, -0.2821024, 0.007843138, 1, 0, 1,
-0.4463836, 0.3478915, -1.83316, 0.003921569, 1, 0, 1,
-0.444412, 1.395726, -0.5087438, 0, 1, 0.003921569, 1,
-0.4368675, -0.691525, -1.241316, 0, 1, 0.01176471, 1,
-0.4345684, -0.2584186, -5.282456, 0, 1, 0.01568628, 1,
-0.4344055, 0.2620643, -1.659745, 0, 1, 0.02352941, 1,
-0.4303515, 1.607238, -0.6404376, 0, 1, 0.02745098, 1,
-0.422722, -0.9531954, -3.224521, 0, 1, 0.03529412, 1,
-0.4204602, -0.7155238, -3.552376, 0, 1, 0.03921569, 1,
-0.4184908, 0.1420178, -3.220973, 0, 1, 0.04705882, 1,
-0.4170991, -1.978647, -1.713994, 0, 1, 0.05098039, 1,
-0.4170897, -2.198667, -2.340652, 0, 1, 0.05882353, 1,
-0.4161721, 2.832212, 0.5548751, 0, 1, 0.0627451, 1,
-0.4159753, 0.3599416, -1.924634, 0, 1, 0.07058824, 1,
-0.4012248, 1.358235, 0.9244048, 0, 1, 0.07450981, 1,
-0.4008892, 0.7362769, 0.7789322, 0, 1, 0.08235294, 1,
-0.3990032, 0.1682078, -1.454633, 0, 1, 0.08627451, 1,
-0.3988208, 0.1741471, -1.726076, 0, 1, 0.09411765, 1,
-0.3938495, -0.8397121, -3.029428, 0, 1, 0.1019608, 1,
-0.3932976, -2.237159, -4.081306, 0, 1, 0.1058824, 1,
-0.3925265, -0.306311, -2.190926, 0, 1, 0.1137255, 1,
-0.3915009, 0.09071153, -2.724622, 0, 1, 0.1176471, 1,
-0.391293, -0.5866145, -3.343131, 0, 1, 0.1254902, 1,
-0.3905455, 0.9855078, -2.031718, 0, 1, 0.1294118, 1,
-0.388338, 0.5534292, -1.385109, 0, 1, 0.1372549, 1,
-0.3871694, 1.001917, -0.6376783, 0, 1, 0.1411765, 1,
-0.3868821, 0.772758, -1.576841, 0, 1, 0.1490196, 1,
-0.383612, 0.5244762, -1.475087, 0, 1, 0.1529412, 1,
-0.3815032, 0.7738617, -0.9022685, 0, 1, 0.1607843, 1,
-0.3810419, 0.5882284, -0.7377861, 0, 1, 0.1647059, 1,
-0.3767526, -0.1318663, -2.231567, 0, 1, 0.172549, 1,
-0.3762392, -0.5268816, -1.729664, 0, 1, 0.1764706, 1,
-0.3720511, -1.816619, -4.2509, 0, 1, 0.1843137, 1,
-0.3716701, -1.529045, -2.231208, 0, 1, 0.1882353, 1,
-0.3708654, 0.4702949, 0.0023952, 0, 1, 0.1960784, 1,
-0.3702474, -1.894354, -3.232201, 0, 1, 0.2039216, 1,
-0.368699, 1.14017, -1.352695, 0, 1, 0.2078431, 1,
-0.3620986, 0.9270542, -0.8791902, 0, 1, 0.2156863, 1,
-0.3610965, 0.1135192, -1.690209, 0, 1, 0.2196078, 1,
-0.3608962, -0.3715759, -1.182878, 0, 1, 0.227451, 1,
-0.3608167, -0.2674471, -3.299407, 0, 1, 0.2313726, 1,
-0.3604492, -1.664595, -2.633977, 0, 1, 0.2392157, 1,
-0.3603567, -0.2880436, -2.766672, 0, 1, 0.2431373, 1,
-0.3598144, 0.2610824, -0.7696348, 0, 1, 0.2509804, 1,
-0.3578368, 0.5544723, -1.014836, 0, 1, 0.254902, 1,
-0.3543899, 0.3086047, -1.376563, 0, 1, 0.2627451, 1,
-0.3536257, 1.046264, -1.367248, 0, 1, 0.2666667, 1,
-0.3528899, -1.489657, -3.960134, 0, 1, 0.2745098, 1,
-0.3505447, 0.9363239, -0.5542915, 0, 1, 0.2784314, 1,
-0.3457325, -0.2492131, -1.575858, 0, 1, 0.2862745, 1,
-0.3455003, -0.2415028, -2.8629, 0, 1, 0.2901961, 1,
-0.3409738, -0.1051225, -1.608676, 0, 1, 0.2980392, 1,
-0.3388363, 0.3858833, -0.4854203, 0, 1, 0.3058824, 1,
-0.3374529, 1.678214, 0.2150447, 0, 1, 0.3098039, 1,
-0.3367434, 0.634059, 1.346533, 0, 1, 0.3176471, 1,
-0.3284688, 1.003003, 0.2847396, 0, 1, 0.3215686, 1,
-0.325942, 0.2256163, 0.08473348, 0, 1, 0.3294118, 1,
-0.3258657, -0.3688963, -5.248427, 0, 1, 0.3333333, 1,
-0.3257959, 0.07656068, -0.1860383, 0, 1, 0.3411765, 1,
-0.3252899, -1.511701, -1.931595, 0, 1, 0.345098, 1,
-0.3211258, -1.898581, -1.373485, 0, 1, 0.3529412, 1,
-0.3189197, -0.7496082, -2.556539, 0, 1, 0.3568628, 1,
-0.3143524, 0.3072855, -0.2244015, 0, 1, 0.3647059, 1,
-0.3128271, -0.1759365, -4.351874, 0, 1, 0.3686275, 1,
-0.3126346, 0.2691119, 0.6376097, 0, 1, 0.3764706, 1,
-0.3106937, 0.6874777, 0.5732633, 0, 1, 0.3803922, 1,
-0.3064763, 0.1945115, -1.154637, 0, 1, 0.3882353, 1,
-0.3051499, 1.905919, 0.6888317, 0, 1, 0.3921569, 1,
-0.2997571, -1.642294, -2.717322, 0, 1, 0.4, 1,
-0.2972167, 0.7022639, 2.484019, 0, 1, 0.4078431, 1,
-0.2951615, 1.626453, -0.5196449, 0, 1, 0.4117647, 1,
-0.2927518, 0.9060903, -1.401292, 0, 1, 0.4196078, 1,
-0.2903262, -0.8347659, -3.723683, 0, 1, 0.4235294, 1,
-0.2890669, -0.711036, -2.131561, 0, 1, 0.4313726, 1,
-0.2782482, -0.06950767, -1.775174, 0, 1, 0.4352941, 1,
-0.2779133, -0.2947189, -2.06082, 0, 1, 0.4431373, 1,
-0.276393, 0.2090625, -2.297427, 0, 1, 0.4470588, 1,
-0.2751553, -0.5027925, -5.269418, 0, 1, 0.454902, 1,
-0.273946, -1.500673, -2.898494, 0, 1, 0.4588235, 1,
-0.2713909, 0.3808548, 1.700834, 0, 1, 0.4666667, 1,
-0.2631351, 0.6576578, -2.50121, 0, 1, 0.4705882, 1,
-0.2624997, 0.8728091, 0.409898, 0, 1, 0.4784314, 1,
-0.259592, -0.6308096, -5.125704, 0, 1, 0.4823529, 1,
-0.2595354, 0.03253131, -0.7338423, 0, 1, 0.4901961, 1,
-0.2578939, 0.2588925, 0.3727028, 0, 1, 0.4941176, 1,
-0.2545942, -0.2583606, -1.281936, 0, 1, 0.5019608, 1,
-0.254494, -0.2576787, -4.026305, 0, 1, 0.509804, 1,
-0.2525463, 1.08381, 0.02740268, 0, 1, 0.5137255, 1,
-0.2495722, 0.3274852, 0.09692936, 0, 1, 0.5215687, 1,
-0.2456836, -0.3765064, -1.736743, 0, 1, 0.5254902, 1,
-0.2404696, -0.4047464, -2.798347, 0, 1, 0.5333334, 1,
-0.2402745, 0.390037, -1.267378, 0, 1, 0.5372549, 1,
-0.2381977, -0.06694035, -1.800021, 0, 1, 0.5450981, 1,
-0.238186, -0.7374526, -2.821779, 0, 1, 0.5490196, 1,
-0.237259, -0.5490346, -4.907565, 0, 1, 0.5568628, 1,
-0.2364611, -0.1305918, -3.100775, 0, 1, 0.5607843, 1,
-0.234383, -1.883689, -2.241815, 0, 1, 0.5686275, 1,
-0.2260423, 1.561735, -0.6843254, 0, 1, 0.572549, 1,
-0.2173777, -0.5744245, -3.984615, 0, 1, 0.5803922, 1,
-0.2160985, 0.7513762, -0.005340869, 0, 1, 0.5843138, 1,
-0.2126001, 0.4337646, -0.537123, 0, 1, 0.5921569, 1,
-0.2076061, 0.1207421, -0.643257, 0, 1, 0.5960785, 1,
-0.2070092, 1.115964, -0.1265453, 0, 1, 0.6039216, 1,
-0.2060743, 0.06485455, -1.586597, 0, 1, 0.6117647, 1,
-0.203861, -0.5100703, -2.734499, 0, 1, 0.6156863, 1,
-0.2018955, -0.7629298, -3.198375, 0, 1, 0.6235294, 1,
-0.2003115, 3.074554, 1.084039, 0, 1, 0.627451, 1,
-0.1964293, -0.5428455, -1.800264, 0, 1, 0.6352941, 1,
-0.1948781, -0.8205069, -5.083354, 0, 1, 0.6392157, 1,
-0.1913231, -1.7695, -2.496043, 0, 1, 0.6470588, 1,
-0.1853202, -0.3605665, -2.770401, 0, 1, 0.6509804, 1,
-0.1771308, -0.2598998, -2.324048, 0, 1, 0.6588235, 1,
-0.1751947, -0.7734241, -4.203861, 0, 1, 0.6627451, 1,
-0.173139, -1.344125, -2.913449, 0, 1, 0.6705883, 1,
-0.1724263, -0.5713276, -2.96055, 0, 1, 0.6745098, 1,
-0.1715905, 1.738799, -0.7459238, 0, 1, 0.682353, 1,
-0.1694187, 0.5785449, 0.3410253, 0, 1, 0.6862745, 1,
-0.1654118, 0.9260048, -0.7709053, 0, 1, 0.6941177, 1,
-0.1606611, -0.9262106, -3.205123, 0, 1, 0.7019608, 1,
-0.1582497, 1.302726, 0.6276191, 0, 1, 0.7058824, 1,
-0.1534062, 1.012366, 0.5823328, 0, 1, 0.7137255, 1,
-0.1531423, 0.4017545, -1.055692, 0, 1, 0.7176471, 1,
-0.1528858, 0.5271988, -0.9346692, 0, 1, 0.7254902, 1,
-0.1517862, -0.1669937, -2.198704, 0, 1, 0.7294118, 1,
-0.1500131, -0.6724287, -3.852655, 0, 1, 0.7372549, 1,
-0.1494357, -1.197849, -2.338153, 0, 1, 0.7411765, 1,
-0.1492397, -1.106822, -3.835087, 0, 1, 0.7490196, 1,
-0.1456307, 0.656969, 0.7497647, 0, 1, 0.7529412, 1,
-0.1437709, -1.161482, -3.963308, 0, 1, 0.7607843, 1,
-0.1410924, 0.1947163, -0.3153703, 0, 1, 0.7647059, 1,
-0.1385789, -1.754905, -2.829032, 0, 1, 0.772549, 1,
-0.1381677, 0.3233948, -0.59931, 0, 1, 0.7764706, 1,
-0.1370062, -0.6110312, -3.151168, 0, 1, 0.7843137, 1,
-0.1364983, 0.6451417, -0.2824677, 0, 1, 0.7882353, 1,
-0.1331184, -0.3799753, -0.6832597, 0, 1, 0.7960784, 1,
-0.1328412, 0.8550095, -1.102373, 0, 1, 0.8039216, 1,
-0.1318756, 0.3090659, -0.1754772, 0, 1, 0.8078431, 1,
-0.131737, 1.106881, 0.3052039, 0, 1, 0.8156863, 1,
-0.1310601, -0.03334169, -3.26596, 0, 1, 0.8196079, 1,
-0.1230811, 0.7984298, 0.2706488, 0, 1, 0.827451, 1,
-0.1199131, -0.9489836, -2.651157, 0, 1, 0.8313726, 1,
-0.1190565, 1.049659, 0.4252669, 0, 1, 0.8392157, 1,
-0.1179187, 0.6186472, 0.6314687, 0, 1, 0.8431373, 1,
-0.1177669, 1.044466, -1.310328, 0, 1, 0.8509804, 1,
-0.1121504, 0.1056296, 0.2319883, 0, 1, 0.854902, 1,
-0.1057416, 0.5028823, 0.933286, 0, 1, 0.8627451, 1,
-0.1056106, -0.9816954, -0.9908926, 0, 1, 0.8666667, 1,
-0.1054334, -1.095627, -3.645556, 0, 1, 0.8745098, 1,
-0.1046368, 0.1472237, -0.3407506, 0, 1, 0.8784314, 1,
-0.1042195, 1.155054, 0.9217846, 0, 1, 0.8862745, 1,
-0.09921431, -2.030681, -1.939981, 0, 1, 0.8901961, 1,
-0.09758915, -1.714346, -4.621906, 0, 1, 0.8980392, 1,
-0.09600346, -0.413521, -2.801237, 0, 1, 0.9058824, 1,
-0.09195852, -1.429252, -3.372825, 0, 1, 0.9098039, 1,
-0.09138955, -0.8971266, -2.181975, 0, 1, 0.9176471, 1,
-0.09054109, -0.3503042, -2.621531, 0, 1, 0.9215686, 1,
-0.08942538, -0.3824965, -0.1544488, 0, 1, 0.9294118, 1,
-0.08933266, -0.1079874, -2.707366, 0, 1, 0.9333333, 1,
-0.08898757, -0.3744372, -4.017582, 0, 1, 0.9411765, 1,
-0.08861328, 0.923676, -0.6046599, 0, 1, 0.945098, 1,
-0.0865921, 2.045792, -1.334428, 0, 1, 0.9529412, 1,
-0.08634285, 0.2083037, -0.781512, 0, 1, 0.9568627, 1,
-0.08349816, -1.539648, -1.90679, 0, 1, 0.9647059, 1,
-0.08156285, -0.3592247, -3.887713, 0, 1, 0.9686275, 1,
-0.08056891, -0.6128213, -3.322393, 0, 1, 0.9764706, 1,
-0.07875356, -0.544975, -3.118543, 0, 1, 0.9803922, 1,
-0.07639485, -1.271193, -4.683696, 0, 1, 0.9882353, 1,
-0.07566421, -1.194853, -5.344172, 0, 1, 0.9921569, 1,
-0.07490072, -1.330999, -4.656904, 0, 1, 1, 1,
-0.07397448, -1.397451, -4.775275, 0, 0.9921569, 1, 1,
-0.07074395, -0.1509908, -0.8829134, 0, 0.9882353, 1, 1,
-0.07006595, -1.163846, -2.495526, 0, 0.9803922, 1, 1,
-0.06861193, 0.6385284, 1.042833, 0, 0.9764706, 1, 1,
-0.06791979, 1.499224, 2.29138, 0, 0.9686275, 1, 1,
-0.06527565, -0.02286847, -1.751218, 0, 0.9647059, 1, 1,
-0.06366837, 0.9660369, -0.1756761, 0, 0.9568627, 1, 1,
-0.06349459, -0.609098, -2.059197, 0, 0.9529412, 1, 1,
-0.06102096, -0.7491419, -2.372227, 0, 0.945098, 1, 1,
-0.05614875, -2.453267, -2.894659, 0, 0.9411765, 1, 1,
-0.05530247, 0.4877503, 0.3385712, 0, 0.9333333, 1, 1,
-0.05302487, -0.832383, -3.159636, 0, 0.9294118, 1, 1,
-0.05265354, -0.932865, -2.63717, 0, 0.9215686, 1, 1,
-0.04992374, -0.6705818, -4.126471, 0, 0.9176471, 1, 1,
-0.04086259, 0.1322541, 0.04695952, 0, 0.9098039, 1, 1,
-0.03823839, -1.448247, -2.6787, 0, 0.9058824, 1, 1,
-0.03696191, 0.6117186, 0.2475606, 0, 0.8980392, 1, 1,
-0.03571308, -0.06170909, -3.087824, 0, 0.8901961, 1, 1,
-0.03193699, -0.2479549, -1.40546, 0, 0.8862745, 1, 1,
-0.02835148, 0.6653817, 0.382803, 0, 0.8784314, 1, 1,
-0.01717518, 0.4106557, 0.1247782, 0, 0.8745098, 1, 1,
-0.0126477, 0.5471591, -1.056259, 0, 0.8666667, 1, 1,
-0.01235022, -0.8062494, -3.431844, 0, 0.8627451, 1, 1,
-0.01211641, -1.026175, -3.762426, 0, 0.854902, 1, 1,
-0.01022734, -0.8051332, -4.738224, 0, 0.8509804, 1, 1,
-0.009716735, -1.561796, -2.343063, 0, 0.8431373, 1, 1,
-0.008781172, 0.2352792, 0.5997221, 0, 0.8392157, 1, 1,
-0.008140626, 0.7712169, -0.1801053, 0, 0.8313726, 1, 1,
-0.003888518, -1.693439, -2.447069, 0, 0.827451, 1, 1,
-0.002795423, -0.02888545, -1.739529, 0, 0.8196079, 1, 1,
0.001788563, 0.2585065, 0.2416855, 0, 0.8156863, 1, 1,
0.004150341, -0.3525843, 3.892501, 0, 0.8078431, 1, 1,
0.007231975, -0.1374074, 2.785469, 0, 0.8039216, 1, 1,
0.007363024, 0.539409, 0.5046049, 0, 0.7960784, 1, 1,
0.01364546, -0.1686209, 2.208673, 0, 0.7882353, 1, 1,
0.01444054, -0.04909975, 2.501415, 0, 0.7843137, 1, 1,
0.02322727, 0.3221462, 1.106766, 0, 0.7764706, 1, 1,
0.02373468, -0.4372775, 3.554281, 0, 0.772549, 1, 1,
0.0263289, 0.790413, 0.5920665, 0, 0.7647059, 1, 1,
0.030621, -0.4301232, 2.643541, 0, 0.7607843, 1, 1,
0.03310318, -0.02684909, 0.7650225, 0, 0.7529412, 1, 1,
0.03328449, 0.2796316, 1.335758, 0, 0.7490196, 1, 1,
0.03833658, -0.3827436, 0.2723117, 0, 0.7411765, 1, 1,
0.03853258, 1.019411, 1.567158, 0, 0.7372549, 1, 1,
0.03930947, 1.560107, 2.234125, 0, 0.7294118, 1, 1,
0.0431379, -0.1800334, 2.797201, 0, 0.7254902, 1, 1,
0.04484925, 0.6159866, 1.893819, 0, 0.7176471, 1, 1,
0.05131534, 0.3338902, -0.9186521, 0, 0.7137255, 1, 1,
0.05214711, 0.6988755, 0.1743586, 0, 0.7058824, 1, 1,
0.06199943, -0.8302653, 3.950144, 0, 0.6980392, 1, 1,
0.06489256, 2.436719, 0.3334181, 0, 0.6941177, 1, 1,
0.0653824, -0.6066712, 0.9016196, 0, 0.6862745, 1, 1,
0.07400284, 1.727575, 0.1127727, 0, 0.682353, 1, 1,
0.07861543, -0.4556277, 3.399716, 0, 0.6745098, 1, 1,
0.07887507, 0.6540747, 2.173275, 0, 0.6705883, 1, 1,
0.07914934, 0.7010367, 1.994384, 0, 0.6627451, 1, 1,
0.08176801, -0.7452007, 2.984515, 0, 0.6588235, 1, 1,
0.08356234, 0.603295, -0.1212754, 0, 0.6509804, 1, 1,
0.08436549, 1.413925, 1.617404, 0, 0.6470588, 1, 1,
0.08599725, 0.183572, -0.4198429, 0, 0.6392157, 1, 1,
0.08732248, 0.1793552, 1.780769, 0, 0.6352941, 1, 1,
0.08896237, 1.552633, -0.6489437, 0, 0.627451, 1, 1,
0.09084496, 0.06314913, 1.809992, 0, 0.6235294, 1, 1,
0.09296712, 0.1287119, 0.2888743, 0, 0.6156863, 1, 1,
0.09487483, -0.3322272, 3.618712, 0, 0.6117647, 1, 1,
0.09813886, 0.3646553, 0.02482158, 0, 0.6039216, 1, 1,
0.09845323, -3.111555, 2.629349, 0, 0.5960785, 1, 1,
0.1012817, -1.55351, 2.046779, 0, 0.5921569, 1, 1,
0.1016812, -0.3589455, 2.75154, 0, 0.5843138, 1, 1,
0.1049178, 2.524008, -1.478923, 0, 0.5803922, 1, 1,
0.1072263, -0.2690617, 4.366635, 0, 0.572549, 1, 1,
0.1098586, 1.831796, -1.014856, 0, 0.5686275, 1, 1,
0.1183496, 0.06861863, 1.816054, 0, 0.5607843, 1, 1,
0.1190356, 0.4947437, -0.02716999, 0, 0.5568628, 1, 1,
0.1193725, 1.00678, 1.884595, 0, 0.5490196, 1, 1,
0.1246507, 0.5211558, 1.948246, 0, 0.5450981, 1, 1,
0.1255592, 0.16395, 2.382318, 0, 0.5372549, 1, 1,
0.1271108, 0.2473731, 0.9656412, 0, 0.5333334, 1, 1,
0.1281616, 0.6464286, -0.6384394, 0, 0.5254902, 1, 1,
0.1287047, 0.2953514, -1.154855, 0, 0.5215687, 1, 1,
0.1310247, 1.102777, 0.4742512, 0, 0.5137255, 1, 1,
0.1371436, -1.295014, 4.081286, 0, 0.509804, 1, 1,
0.1400743, 0.8479692, -1.228581, 0, 0.5019608, 1, 1,
0.1451678, -0.2097107, 3.453712, 0, 0.4941176, 1, 1,
0.147193, -1.615826, 3.555579, 0, 0.4901961, 1, 1,
0.1519104, -1.228555, 3.035919, 0, 0.4823529, 1, 1,
0.1593366, -0.6444178, 4.030985, 0, 0.4784314, 1, 1,
0.1608707, -0.8297935, 4.086689, 0, 0.4705882, 1, 1,
0.1617774, -0.2649162, 3.169127, 0, 0.4666667, 1, 1,
0.1643837, -0.8397593, 2.548734, 0, 0.4588235, 1, 1,
0.1651611, -0.6837722, 4.293407, 0, 0.454902, 1, 1,
0.1664707, 0.7015924, 0.8238397, 0, 0.4470588, 1, 1,
0.1681891, -0.05211642, 0.3600032, 0, 0.4431373, 1, 1,
0.1682528, -0.003429479, 2.814632, 0, 0.4352941, 1, 1,
0.1688243, -1.076087, 2.492965, 0, 0.4313726, 1, 1,
0.1703615, -1.387922, 2.154442, 0, 0.4235294, 1, 1,
0.1722586, -0.3811423, 2.262288, 0, 0.4196078, 1, 1,
0.1746386, -0.5172192, 2.062333, 0, 0.4117647, 1, 1,
0.1758257, -0.4385031, 3.623021, 0, 0.4078431, 1, 1,
0.1771255, -1.309699, 3.286415, 0, 0.4, 1, 1,
0.1778227, 0.02229728, 0.1720754, 0, 0.3921569, 1, 1,
0.1800079, -0.715238, 2.694228, 0, 0.3882353, 1, 1,
0.181376, -0.529737, 2.756437, 0, 0.3803922, 1, 1,
0.1821577, -1.01664, 2.179115, 0, 0.3764706, 1, 1,
0.1832884, -1.099934, 4.279156, 0, 0.3686275, 1, 1,
0.1838479, 0.328026, 3.155653, 0, 0.3647059, 1, 1,
0.185868, -0.937725, 2.414256, 0, 0.3568628, 1, 1,
0.1869993, 0.2846628, 2.373179, 0, 0.3529412, 1, 1,
0.1891416, -0.5566369, 1.389766, 0, 0.345098, 1, 1,
0.1892676, -0.5222283, 1.612499, 0, 0.3411765, 1, 1,
0.1927779, -1.749395, 3.79926, 0, 0.3333333, 1, 1,
0.1931813, 2.876144, -0.4581521, 0, 0.3294118, 1, 1,
0.1935171, -0.4214021, 2.808116, 0, 0.3215686, 1, 1,
0.1949137, -0.8698227, 3.50494, 0, 0.3176471, 1, 1,
0.1989258, -0.9935504, 3.904832, 0, 0.3098039, 1, 1,
0.2048687, 0.778452, -0.7207814, 0, 0.3058824, 1, 1,
0.2102247, 0.8470888, -1.065045, 0, 0.2980392, 1, 1,
0.211296, 1.363446, -0.2494698, 0, 0.2901961, 1, 1,
0.2122317, 0.3151025, 2.374202, 0, 0.2862745, 1, 1,
0.2143501, 0.09061179, 0.686018, 0, 0.2784314, 1, 1,
0.2143697, -0.7775099, 3.091244, 0, 0.2745098, 1, 1,
0.2217453, -0.2898985, 3.169343, 0, 0.2666667, 1, 1,
0.2231573, 1.113108, 0.2055238, 0, 0.2627451, 1, 1,
0.2238929, -1.954888, 3.980028, 0, 0.254902, 1, 1,
0.2254002, 1.170542, -0.815404, 0, 0.2509804, 1, 1,
0.2268047, 0.06412026, 0.6118735, 0, 0.2431373, 1, 1,
0.2283692, -0.3287964, 2.335881, 0, 0.2392157, 1, 1,
0.2316703, 1.114798, 0.2372074, 0, 0.2313726, 1, 1,
0.2334665, 0.455635, -0.9099286, 0, 0.227451, 1, 1,
0.2335117, -1.808043, 2.990224, 0, 0.2196078, 1, 1,
0.234312, 2.050815, 1.729465, 0, 0.2156863, 1, 1,
0.2349183, 1.956374, 0.1568424, 0, 0.2078431, 1, 1,
0.240195, -1.775867, 3.214069, 0, 0.2039216, 1, 1,
0.2412185, -1.38319, 4.066282, 0, 0.1960784, 1, 1,
0.2451242, -0.3353405, 4.368093, 0, 0.1882353, 1, 1,
0.2495514, 1.156778, -0.2982575, 0, 0.1843137, 1, 1,
0.2521843, -0.847029, 4.014842, 0, 0.1764706, 1, 1,
0.2529697, -0.5976709, 1.968879, 0, 0.172549, 1, 1,
0.2542537, 0.3928276, -0.3733378, 0, 0.1647059, 1, 1,
0.2564763, 1.255875, -0.1339963, 0, 0.1607843, 1, 1,
0.2600234, -0.5374217, 1.665018, 0, 0.1529412, 1, 1,
0.2645488, -0.7819328, 1.071253, 0, 0.1490196, 1, 1,
0.264695, -1.835464, 0.6305775, 0, 0.1411765, 1, 1,
0.2712301, -2.050395, 2.477083, 0, 0.1372549, 1, 1,
0.2715871, 1.679574, -0.2284112, 0, 0.1294118, 1, 1,
0.2768872, 0.3680199, 1.569247, 0, 0.1254902, 1, 1,
0.2804087, 0.5147845, 2.374185, 0, 0.1176471, 1, 1,
0.2809364, -2.108931, 3.393047, 0, 0.1137255, 1, 1,
0.2848938, -0.2773168, 3.328707, 0, 0.1058824, 1, 1,
0.2905287, -1.599058, 2.774956, 0, 0.09803922, 1, 1,
0.2947026, 0.3107286, 0.680443, 0, 0.09411765, 1, 1,
0.2958641, 1.193476, 0.8637514, 0, 0.08627451, 1, 1,
0.3009579, -0.6389681, 3.425975, 0, 0.08235294, 1, 1,
0.3024802, 1.157939, -1.087071, 0, 0.07450981, 1, 1,
0.3134152, -0.1291985, 2.180488, 0, 0.07058824, 1, 1,
0.3134198, -0.9090314, 4.162934, 0, 0.0627451, 1, 1,
0.3154344, -0.3029398, 3.19318, 0, 0.05882353, 1, 1,
0.3213988, 0.5114649, 0.05885261, 0, 0.05098039, 1, 1,
0.3223484, -1.615928, 4.237866, 0, 0.04705882, 1, 1,
0.3255022, -0.5884784, 3.625375, 0, 0.03921569, 1, 1,
0.3258648, 0.6417364, 1.646497, 0, 0.03529412, 1, 1,
0.3260042, 0.8843756, -0.3477755, 0, 0.02745098, 1, 1,
0.3263182, 0.5046692, 0.2634839, 0, 0.02352941, 1, 1,
0.3295632, -0.4623062, 0.9221364, 0, 0.01568628, 1, 1,
0.3314601, 1.808166, 0.126843, 0, 0.01176471, 1, 1,
0.3319241, -0.3160092, 1.485164, 0, 0.003921569, 1, 1,
0.336744, -0.2138158, 2.824158, 0.003921569, 0, 1, 1,
0.3374959, -0.8884157, 3.412277, 0.007843138, 0, 1, 1,
0.3378582, -1.904867, 4.115616, 0.01568628, 0, 1, 1,
0.3380816, -0.4729241, 3.244589, 0.01960784, 0, 1, 1,
0.3395258, 1.414267, 1.322461, 0.02745098, 0, 1, 1,
0.350287, -0.6581051, 2.441277, 0.03137255, 0, 1, 1,
0.3512192, -1.15335, 3.442978, 0.03921569, 0, 1, 1,
0.3525087, -1.07661, 1.553451, 0.04313726, 0, 1, 1,
0.3531748, -0.1988635, 0.01274305, 0.05098039, 0, 1, 1,
0.35329, -2.219569, 2.337018, 0.05490196, 0, 1, 1,
0.3572778, -1.333146, 1.998572, 0.0627451, 0, 1, 1,
0.3579531, 0.7254906, -1.389221, 0.06666667, 0, 1, 1,
0.3593894, -2.79566, 2.561729, 0.07450981, 0, 1, 1,
0.3622693, -0.09604767, 2.600087, 0.07843138, 0, 1, 1,
0.3648496, -0.6283151, 3.839714, 0.08627451, 0, 1, 1,
0.3687267, -1.20129, 2.941784, 0.09019608, 0, 1, 1,
0.3688773, -1.308783, 1.619486, 0.09803922, 0, 1, 1,
0.3708911, -0.8096873, 2.457925, 0.1058824, 0, 1, 1,
0.3722263, -0.8762979, 0.8481367, 0.1098039, 0, 1, 1,
0.3760121, -0.4286888, 3.896575, 0.1176471, 0, 1, 1,
0.3763133, 0.984028, 0.1876173, 0.1215686, 0, 1, 1,
0.3811661, 0.4983703, 0.7703986, 0.1294118, 0, 1, 1,
0.3840939, 0.3380785, 0.2138043, 0.1333333, 0, 1, 1,
0.3873793, -1.043728, 3.777699, 0.1411765, 0, 1, 1,
0.3898158, 0.5862815, 0.1119845, 0.145098, 0, 1, 1,
0.3950196, 0.4439298, 0.8549612, 0.1529412, 0, 1, 1,
0.3996956, -0.5235298, 3.33325, 0.1568628, 0, 1, 1,
0.40779, 0.4554508, 1.514236, 0.1647059, 0, 1, 1,
0.4078172, 0.6898029, -0.2636301, 0.1686275, 0, 1, 1,
0.4099578, 0.3870154, -1.615299, 0.1764706, 0, 1, 1,
0.4118171, 0.4287304, 1.504296, 0.1803922, 0, 1, 1,
0.412308, -0.2411598, 0.6755784, 0.1882353, 0, 1, 1,
0.4210482, 0.8975866, -1.432571, 0.1921569, 0, 1, 1,
0.4219398, -0.4778311, 2.590374, 0.2, 0, 1, 1,
0.4270297, -0.5013382, 1.640537, 0.2078431, 0, 1, 1,
0.4275563, -1.443398, 2.825095, 0.2117647, 0, 1, 1,
0.4290546, -0.4951077, 3.183808, 0.2196078, 0, 1, 1,
0.4324458, 1.16898, 1.173549, 0.2235294, 0, 1, 1,
0.43398, 1.558794, -0.7939728, 0.2313726, 0, 1, 1,
0.4354399, -1.261085, 2.40571, 0.2352941, 0, 1, 1,
0.4369128, 0.5693368, 0.7576343, 0.2431373, 0, 1, 1,
0.4416902, 0.3411335, 0.4174476, 0.2470588, 0, 1, 1,
0.4463913, 1.08969, 0.7980077, 0.254902, 0, 1, 1,
0.4497703, -0.6952598, 3.584109, 0.2588235, 0, 1, 1,
0.4502275, -0.7849726, 3.117749, 0.2666667, 0, 1, 1,
0.4522174, 0.8181931, 1.22195, 0.2705882, 0, 1, 1,
0.4584191, 0.1340975, 2.190174, 0.2784314, 0, 1, 1,
0.4680353, -0.684818, 1.95576, 0.282353, 0, 1, 1,
0.4687984, 0.6036769, -0.09039561, 0.2901961, 0, 1, 1,
0.4695644, -0.7548699, 3.446708, 0.2941177, 0, 1, 1,
0.4746316, -0.175733, 2.018068, 0.3019608, 0, 1, 1,
0.477241, -0.1528853, 2.184365, 0.3098039, 0, 1, 1,
0.4791822, -0.8652496, 4.088857, 0.3137255, 0, 1, 1,
0.4811595, -0.253833, 1.815486, 0.3215686, 0, 1, 1,
0.4846363, 0.9750073, 3.022555, 0.3254902, 0, 1, 1,
0.4886757, -0.4838337, 2.311896, 0.3333333, 0, 1, 1,
0.4903533, -0.604583, 2.091769, 0.3372549, 0, 1, 1,
0.4931926, -0.9132007, 3.537179, 0.345098, 0, 1, 1,
0.4949557, 1.329591, 1.402593, 0.3490196, 0, 1, 1,
0.495869, -0.3972712, 3.815715, 0.3568628, 0, 1, 1,
0.5018091, -0.7278996, 0.5132769, 0.3607843, 0, 1, 1,
0.5038221, -1.332141, 3.460223, 0.3686275, 0, 1, 1,
0.5076586, 0.5895309, 0.7839912, 0.372549, 0, 1, 1,
0.5085659, -1.378053, 1.806357, 0.3803922, 0, 1, 1,
0.5137256, -0.06728704, 0.2705993, 0.3843137, 0, 1, 1,
0.5168403, -0.2854781, 2.292759, 0.3921569, 0, 1, 1,
0.516961, 0.5026286, 1.967226, 0.3960784, 0, 1, 1,
0.5260634, 0.2071363, 0.2028048, 0.4039216, 0, 1, 1,
0.528897, -2.039937, 1.624758, 0.4117647, 0, 1, 1,
0.5291227, 0.9830607, 0.4602281, 0.4156863, 0, 1, 1,
0.5365812, 0.5954385, 0.9702879, 0.4235294, 0, 1, 1,
0.5421289, -0.2849833, 2.688432, 0.427451, 0, 1, 1,
0.5467315, 0.3471266, -0.1042027, 0.4352941, 0, 1, 1,
0.5483797, 0.5007889, 1.566169, 0.4392157, 0, 1, 1,
0.5511634, 0.8437551, 2.274317, 0.4470588, 0, 1, 1,
0.5597611, 0.2459677, 2.050169, 0.4509804, 0, 1, 1,
0.5621001, 1.155645, 0.06589211, 0.4588235, 0, 1, 1,
0.5659099, -0.722444, 3.986872, 0.4627451, 0, 1, 1,
0.5668598, 0.00269308, 1.269322, 0.4705882, 0, 1, 1,
0.5688089, 2.225928, 0.143845, 0.4745098, 0, 1, 1,
0.5703675, 0.3912977, -0.3861609, 0.4823529, 0, 1, 1,
0.5708201, 0.4122462, 0.9153803, 0.4862745, 0, 1, 1,
0.5848622, -0.07382526, 1.800847, 0.4941176, 0, 1, 1,
0.5859512, 0.3305033, 0.4430216, 0.5019608, 0, 1, 1,
0.5871961, 0.008362997, 1.846835, 0.5058824, 0, 1, 1,
0.5965564, 0.3541229, 1.518622, 0.5137255, 0, 1, 1,
0.5971338, -0.1812933, 3.314503, 0.5176471, 0, 1, 1,
0.597763, -0.0478918, 0.6565945, 0.5254902, 0, 1, 1,
0.5988452, 1.512943, 2.799775, 0.5294118, 0, 1, 1,
0.6032619, 0.469391, 1.74857, 0.5372549, 0, 1, 1,
0.6124309, -0.4470814, 2.644738, 0.5411765, 0, 1, 1,
0.6157588, 1.033154, -0.1497664, 0.5490196, 0, 1, 1,
0.615775, -0.5804119, 2.412542, 0.5529412, 0, 1, 1,
0.6222319, -0.3932516, 1.461564, 0.5607843, 0, 1, 1,
0.6227545, 0.2344119, 1.144664, 0.5647059, 0, 1, 1,
0.6325139, -0.5907323, 1.174373, 0.572549, 0, 1, 1,
0.6334304, -0.0262968, 1.780316, 0.5764706, 0, 1, 1,
0.6446286, 0.5164908, 2.757174, 0.5843138, 0, 1, 1,
0.644717, 0.2762041, 1.148867, 0.5882353, 0, 1, 1,
0.6500998, 1.312527, -1.079292, 0.5960785, 0, 1, 1,
0.6608386, 0.9352672, 1.366636, 0.6039216, 0, 1, 1,
0.6636279, -0.3463358, 2.23614, 0.6078432, 0, 1, 1,
0.6680043, -0.477174, 2.255061, 0.6156863, 0, 1, 1,
0.6681608, -2.552923, 0.1487413, 0.6196079, 0, 1, 1,
0.6790251, -0.3557654, 0.6622981, 0.627451, 0, 1, 1,
0.6884401, 1.159569, 1.535394, 0.6313726, 0, 1, 1,
0.6889136, -2.011346, 2.485412, 0.6392157, 0, 1, 1,
0.6972513, 0.353344, 3.26311, 0.6431373, 0, 1, 1,
0.7061705, -1.048721, 3.327069, 0.6509804, 0, 1, 1,
0.7131359, -1.479935, 3.181304, 0.654902, 0, 1, 1,
0.7179376, 0.04420853, 0.8431411, 0.6627451, 0, 1, 1,
0.7213928, -0.570274, 0.4973146, 0.6666667, 0, 1, 1,
0.7221006, 0.579886, 1.742409, 0.6745098, 0, 1, 1,
0.7248129, 0.1834831, 1.455518, 0.6784314, 0, 1, 1,
0.7270674, 2.612248, 0.182031, 0.6862745, 0, 1, 1,
0.7315654, 0.8951477, 0.3721489, 0.6901961, 0, 1, 1,
0.7384987, -0.6355872, 2.248067, 0.6980392, 0, 1, 1,
0.7424541, -0.2106432, 0.753302, 0.7058824, 0, 1, 1,
0.7466738, -0.8854259, 3.819108, 0.7098039, 0, 1, 1,
0.7500054, 0.8825646, 1.428775, 0.7176471, 0, 1, 1,
0.7621796, -1.625224, 3.217462, 0.7215686, 0, 1, 1,
0.7628071, 0.1784353, 1.56357, 0.7294118, 0, 1, 1,
0.7645987, 0.1371859, -0.289089, 0.7333333, 0, 1, 1,
0.7657471, 1.678083, -0.5162544, 0.7411765, 0, 1, 1,
0.7850487, 1.249174, 2.231854, 0.7450981, 0, 1, 1,
0.7858983, -0.799461, 2.088996, 0.7529412, 0, 1, 1,
0.7878073, -2.461728, 2.18297, 0.7568628, 0, 1, 1,
0.7878799, 0.2910323, 1.939948, 0.7647059, 0, 1, 1,
0.8017802, -0.6289383, 3.032598, 0.7686275, 0, 1, 1,
0.8044396, -0.1642248, 1.582512, 0.7764706, 0, 1, 1,
0.8079827, 0.1422587, 0.8753149, 0.7803922, 0, 1, 1,
0.8123427, -0.9001534, 1.867457, 0.7882353, 0, 1, 1,
0.820136, -0.1591874, 2.694145, 0.7921569, 0, 1, 1,
0.8233698, -0.1136575, 0.755631, 0.8, 0, 1, 1,
0.824866, -2.232455, 3.479496, 0.8078431, 0, 1, 1,
0.8333456, -0.1924627, 2.182185, 0.8117647, 0, 1, 1,
0.8362061, -0.2999489, 1.837323, 0.8196079, 0, 1, 1,
0.8382644, -0.03044751, 1.518458, 0.8235294, 0, 1, 1,
0.8403155, 0.7302583, 0.4543588, 0.8313726, 0, 1, 1,
0.8410873, -0.650089, 3.258778, 0.8352941, 0, 1, 1,
0.841153, -0.4168952, 2.123561, 0.8431373, 0, 1, 1,
0.84422, 0.2581216, 0.8038929, 0.8470588, 0, 1, 1,
0.8488078, 1.114889, 0.2715653, 0.854902, 0, 1, 1,
0.8658078, 0.7501364, -1.097029, 0.8588235, 0, 1, 1,
0.8699048, -0.6766157, 1.533667, 0.8666667, 0, 1, 1,
0.8716652, -0.7916129, 3.504585, 0.8705882, 0, 1, 1,
0.8718624, 0.9245658, 0.7354347, 0.8784314, 0, 1, 1,
0.8770486, -1.177939, 1.578211, 0.8823529, 0, 1, 1,
0.8797616, 0.2361161, 0.04801496, 0.8901961, 0, 1, 1,
0.8825035, 0.6657808, 1.692727, 0.8941177, 0, 1, 1,
0.8876277, -0.7967182, 0.6308695, 0.9019608, 0, 1, 1,
0.8899579, -0.2836392, 2.42605, 0.9098039, 0, 1, 1,
0.8912948, 0.05705665, 3.21233, 0.9137255, 0, 1, 1,
0.892279, 0.5044337, 1.772468, 0.9215686, 0, 1, 1,
0.8957002, -0.9132561, 2.043566, 0.9254902, 0, 1, 1,
0.895874, 0.03899283, 0.9267121, 0.9333333, 0, 1, 1,
0.8985435, -0.2909248, 3.125798, 0.9372549, 0, 1, 1,
0.9017906, -0.1211882, 2.069108, 0.945098, 0, 1, 1,
0.902196, 0.5670924, 0.4315113, 0.9490196, 0, 1, 1,
0.9023458, 1.078795, 0.5915228, 0.9568627, 0, 1, 1,
0.9102494, -1.388245, 1.993472, 0.9607843, 0, 1, 1,
0.9105341, 0.484491, 1.194597, 0.9686275, 0, 1, 1,
0.9106818, -1.393195, 1.826433, 0.972549, 0, 1, 1,
0.9142174, 0.2316035, 1.383324, 0.9803922, 0, 1, 1,
0.9144598, 1.744621, -0.1241151, 0.9843137, 0, 1, 1,
0.9212061, 0.9749378, 0.4745669, 0.9921569, 0, 1, 1,
0.9223742, -0.2295664, 3.088, 0.9960784, 0, 1, 1,
0.9276678, -0.2168092, 2.518929, 1, 0, 0.9960784, 1,
0.9354746, -1.155783, 2.149074, 1, 0, 0.9882353, 1,
0.9379339, -0.8127397, 1.52902, 1, 0, 0.9843137, 1,
0.9405798, -0.07307586, 3.324617, 1, 0, 0.9764706, 1,
0.9501025, 1.21575, -0.1455901, 1, 0, 0.972549, 1,
0.9635623, 0.01985266, 1.403197, 1, 0, 0.9647059, 1,
0.9648221, -1.699666, 3.156123, 1, 0, 0.9607843, 1,
0.968621, -1.899281, 2.417066, 1, 0, 0.9529412, 1,
0.9787294, 0.06492721, 0.627342, 1, 0, 0.9490196, 1,
0.9802846, 0.1443914, 0.9444132, 1, 0, 0.9411765, 1,
0.9825645, -1.704607, 1.484552, 1, 0, 0.9372549, 1,
0.9862434, -0.3870737, 1.288594, 1, 0, 0.9294118, 1,
0.9928905, -0.6905124, 2.702717, 1, 0, 0.9254902, 1,
0.9957032, -1.35323, 1.321332, 1, 0, 0.9176471, 1,
1.003178, 1.082003, 0.4219559, 1, 0, 0.9137255, 1,
1.027184, 0.4521522, 0.7548419, 1, 0, 0.9058824, 1,
1.039573, 0.0151729, -0.6621417, 1, 0, 0.9019608, 1,
1.046285, -1.291538, 4.085889, 1, 0, 0.8941177, 1,
1.048315, -0.2185727, 1.3189, 1, 0, 0.8862745, 1,
1.051169, -0.2143045, 0.9852031, 1, 0, 0.8823529, 1,
1.054065, -0.9037994, 1.239932, 1, 0, 0.8745098, 1,
1.074033, -1.128162, 1.964527, 1, 0, 0.8705882, 1,
1.07653, -0.2264604, 0.8393705, 1, 0, 0.8627451, 1,
1.077946, -0.2914935, 1.382537, 1, 0, 0.8588235, 1,
1.084413, -1.897995, 3.428337, 1, 0, 0.8509804, 1,
1.091095, 1.100251, -0.1783895, 1, 0, 0.8470588, 1,
1.094008, -1.186883, 0.777809, 1, 0, 0.8392157, 1,
1.117847, 1.127241, 0.43167, 1, 0, 0.8352941, 1,
1.120944, -0.8911685, 2.865572, 1, 0, 0.827451, 1,
1.124543, -0.3485671, 1.763405, 1, 0, 0.8235294, 1,
1.12542, -0.2097791, 2.078887, 1, 0, 0.8156863, 1,
1.126448, 1.303144, 1.144683, 1, 0, 0.8117647, 1,
1.128529, 0.9749718, 1.673937, 1, 0, 0.8039216, 1,
1.130185, -0.4232778, 0.8392947, 1, 0, 0.7960784, 1,
1.132831, 0.2559387, 1.77657, 1, 0, 0.7921569, 1,
1.142782, -1.250022, 2.595023, 1, 0, 0.7843137, 1,
1.151336, 0.8954329, -0.5075225, 1, 0, 0.7803922, 1,
1.153897, 0.1072087, 1.170157, 1, 0, 0.772549, 1,
1.154171, 1.257044, 0.107932, 1, 0, 0.7686275, 1,
1.154996, -0.3575332, 2.881811, 1, 0, 0.7607843, 1,
1.158897, 0.04149819, 1.773725, 1, 0, 0.7568628, 1,
1.165927, 1.187715, 1.133726, 1, 0, 0.7490196, 1,
1.184574, 1.159146, 1.049776, 1, 0, 0.7450981, 1,
1.213273, -1.47838, 2.481875, 1, 0, 0.7372549, 1,
1.228122, 0.6248155, 0.969858, 1, 0, 0.7333333, 1,
1.229063, -0.8222372, 3.780434, 1, 0, 0.7254902, 1,
1.23356, -0.2159791, 0.9036311, 1, 0, 0.7215686, 1,
1.242579, 1.932582, 0.2467041, 1, 0, 0.7137255, 1,
1.243735, -0.583293, 0.3938081, 1, 0, 0.7098039, 1,
1.24525, 1.113266, 0.2725783, 1, 0, 0.7019608, 1,
1.246682, 0.4412353, 1.570062, 1, 0, 0.6941177, 1,
1.251569, -0.1408914, 3.602623, 1, 0, 0.6901961, 1,
1.25745, -2.617186, 3.386626, 1, 0, 0.682353, 1,
1.25976, 0.3335126, 0.4853509, 1, 0, 0.6784314, 1,
1.261976, -1.686911, 2.39951, 1, 0, 0.6705883, 1,
1.277049, -1.448486, 2.592803, 1, 0, 0.6666667, 1,
1.277815, -0.4161005, 3.439949, 1, 0, 0.6588235, 1,
1.280403, 0.1503869, -0.05852225, 1, 0, 0.654902, 1,
1.282927, 0.9831593, -0.4011058, 1, 0, 0.6470588, 1,
1.285506, -0.192367, 2.509872, 1, 0, 0.6431373, 1,
1.285567, -2.413748, 0.1638112, 1, 0, 0.6352941, 1,
1.292477, -1.51515, 2.423394, 1, 0, 0.6313726, 1,
1.293391, 0.9140295, 1.144946, 1, 0, 0.6235294, 1,
1.296278, -1.979569, 2.540347, 1, 0, 0.6196079, 1,
1.296545, 0.5177133, 1.268194, 1, 0, 0.6117647, 1,
1.306805, 0.007714875, 1.119949, 1, 0, 0.6078432, 1,
1.31438, -1.565326, 3.79174, 1, 0, 0.6, 1,
1.322719, 0.6669599, 0.326789, 1, 0, 0.5921569, 1,
1.324395, -1.190139, 2.259914, 1, 0, 0.5882353, 1,
1.338755, -0.1058395, 2.192945, 1, 0, 0.5803922, 1,
1.346659, 0.2338294, 2.649055, 1, 0, 0.5764706, 1,
1.373253, -1.523938, 1.21334, 1, 0, 0.5686275, 1,
1.377872, -0.07941715, 2.44395, 1, 0, 0.5647059, 1,
1.380431, 0.8936167, -0.6976027, 1, 0, 0.5568628, 1,
1.381919, 0.5043586, 1.010522, 1, 0, 0.5529412, 1,
1.388514, -1.069559, 4.538871, 1, 0, 0.5450981, 1,
1.390386, 0.5503842, 1.555324, 1, 0, 0.5411765, 1,
1.393823, 0.5699546, 2.559494, 1, 0, 0.5333334, 1,
1.4, -0.7542417, 2.208721, 1, 0, 0.5294118, 1,
1.403934, -0.2037441, 3.352722, 1, 0, 0.5215687, 1,
1.413859, 1.284693, 1.639414, 1, 0, 0.5176471, 1,
1.416886, 0.9225569, 0.3652402, 1, 0, 0.509804, 1,
1.419667, -0.6522229, 1.762302, 1, 0, 0.5058824, 1,
1.428983, 1.476571, -0.1868287, 1, 0, 0.4980392, 1,
1.431828, -0.7657247, 1.536209, 1, 0, 0.4901961, 1,
1.432511, 0.6176934, 1.47491, 1, 0, 0.4862745, 1,
1.440336, 0.4882413, 2.54495, 1, 0, 0.4784314, 1,
1.452206, -0.2327585, 2.478721, 1, 0, 0.4745098, 1,
1.468026, 0.3770768, 2.254081, 1, 0, 0.4666667, 1,
1.46958, 0.3861072, 0.3712147, 1, 0, 0.4627451, 1,
1.476353, 1.079109, 1.258788, 1, 0, 0.454902, 1,
1.49813, -0.4240226, 2.002286, 1, 0, 0.4509804, 1,
1.498992, -0.6592995, 2.399476, 1, 0, 0.4431373, 1,
1.507777, 1.647206, 1.255406, 1, 0, 0.4392157, 1,
1.509133, -1.247834, 1.589288, 1, 0, 0.4313726, 1,
1.522342, 0.1596335, 0.5094373, 1, 0, 0.427451, 1,
1.52263, 0.1758963, 2.042748, 1, 0, 0.4196078, 1,
1.523689, 0.5196848, 0.3254719, 1, 0, 0.4156863, 1,
1.535075, -1.118572, 1.847882, 1, 0, 0.4078431, 1,
1.544431, 0.577226, 0.3759352, 1, 0, 0.4039216, 1,
1.547358, -1.445912, 0.9292058, 1, 0, 0.3960784, 1,
1.549046, 0.9941956, 0.1612558, 1, 0, 0.3882353, 1,
1.554856, -1.260726, 1.837738, 1, 0, 0.3843137, 1,
1.558506, -1.565233, 0.8058864, 1, 0, 0.3764706, 1,
1.570681, 0.7675059, 0.8943891, 1, 0, 0.372549, 1,
1.57081, -0.2703137, 1.030139, 1, 0, 0.3647059, 1,
1.59203, -0.6332467, 1.223274, 1, 0, 0.3607843, 1,
1.601853, 0.6253165, 0.5286306, 1, 0, 0.3529412, 1,
1.608596, -0.4600566, 2.216857, 1, 0, 0.3490196, 1,
1.609965, 0.1205625, 1.09162, 1, 0, 0.3411765, 1,
1.621572, 0.1436858, 0.6948042, 1, 0, 0.3372549, 1,
1.638621, -0.4857919, 0.9913598, 1, 0, 0.3294118, 1,
1.64882, 0.7422993, -0.6174824, 1, 0, 0.3254902, 1,
1.661814, 1.161386, 1.046363, 1, 0, 0.3176471, 1,
1.690241, -0.4100261, 2.904245, 1, 0, 0.3137255, 1,
1.690938, 1.598351, -0.3429124, 1, 0, 0.3058824, 1,
1.706803, 0.7983087, 1.736726, 1, 0, 0.2980392, 1,
1.724518, -0.2020009, 2.488587, 1, 0, 0.2941177, 1,
1.730481, 0.8436896, 0.9765897, 1, 0, 0.2862745, 1,
1.736606, 0.4226597, 1.613003, 1, 0, 0.282353, 1,
1.738602, 0.9226794, 3.737286, 1, 0, 0.2745098, 1,
1.764612, 0.8761821, 1.746987, 1, 0, 0.2705882, 1,
1.767876, 0.8651658, 3.414193, 1, 0, 0.2627451, 1,
1.777639, -0.3135368, 1.841943, 1, 0, 0.2588235, 1,
1.781567, -1.281685, 1.102994, 1, 0, 0.2509804, 1,
1.78731, -0.8046603, 1.313989, 1, 0, 0.2470588, 1,
1.788903, -0.7444151, 3.345691, 1, 0, 0.2392157, 1,
1.796273, -0.6699942, 1.687549, 1, 0, 0.2352941, 1,
1.804489, -0.1389907, 2.198923, 1, 0, 0.227451, 1,
1.819245, -0.6053622, 1.326529, 1, 0, 0.2235294, 1,
1.829351, -1.330964, 1.918001, 1, 0, 0.2156863, 1,
1.841312, 1.086121, 1.557597, 1, 0, 0.2117647, 1,
1.856262, 1.243994, 1.735857, 1, 0, 0.2039216, 1,
1.85719, -1.646909, 3.546352, 1, 0, 0.1960784, 1,
1.867004, -1.261107, 0.588716, 1, 0, 0.1921569, 1,
1.880189, -0.4235864, 2.508335, 1, 0, 0.1843137, 1,
1.891782, -0.4245747, 2.601551, 1, 0, 0.1803922, 1,
1.94318, 2.067436, -0.5849412, 1, 0, 0.172549, 1,
1.965971, -0.8024797, 2.115919, 1, 0, 0.1686275, 1,
1.98541, -0.3523715, 1.733697, 1, 0, 0.1607843, 1,
2.011569, -0.4390075, 2.769089, 1, 0, 0.1568628, 1,
2.094776, 0.08762168, 1.001928, 1, 0, 0.1490196, 1,
2.120598, -1.297877, 2.085808, 1, 0, 0.145098, 1,
2.159251, -0.4680381, 1.566404, 1, 0, 0.1372549, 1,
2.173743, -0.1057275, 2.157489, 1, 0, 0.1333333, 1,
2.180837, 1.97158, -0.4710068, 1, 0, 0.1254902, 1,
2.197866, -1.454305, 2.323953, 1, 0, 0.1215686, 1,
2.22656, 0.5407308, 0.5099761, 1, 0, 0.1137255, 1,
2.234803, 0.8339801, 3.208799, 1, 0, 0.1098039, 1,
2.253818, 1.081032, 1.174266, 1, 0, 0.1019608, 1,
2.293369, 0.5871487, 2.188371, 1, 0, 0.09411765, 1,
2.304814, -1.676365, 2.876351, 1, 0, 0.09019608, 1,
2.312596, 3.558919, -0.2121224, 1, 0, 0.08235294, 1,
2.361487, -0.09145404, 1.31668, 1, 0, 0.07843138, 1,
2.499121, -0.9408013, 1.26466, 1, 0, 0.07058824, 1,
2.519386, -0.8918956, 1.282757, 1, 0, 0.06666667, 1,
2.544078, 0.8063435, 3.073884, 1, 0, 0.05882353, 1,
2.569548, -1.732378, 2.503771, 1, 0, 0.05490196, 1,
2.570154, 0.672909, 1.762514, 1, 0, 0.04705882, 1,
2.592004, -0.048338, 2.031236, 1, 0, 0.04313726, 1,
2.657485, -1.590825, 1.735433, 1, 0, 0.03529412, 1,
2.681415, 0.08370411, 2.043628, 1, 0, 0.03137255, 1,
2.794255, 0.3762659, 3.576803, 1, 0, 0.02352941, 1,
2.973566, -1.359288, 1.68087, 1, 0, 0.01960784, 1,
3.100108, -1.218486, 3.587316, 1, 0, 0.01176471, 1,
3.177922, -0.1126303, 2.427172, 1, 0, 0.007843138, 1
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
-0.1619405, -4.806939, -7.019347, 0, -0.5, 0.5, 0.5,
-0.1619405, -4.806939, -7.019347, 1, -0.5, 0.5, 0.5,
-0.1619405, -4.806939, -7.019347, 1, 1.5, 0.5, 0.5,
-0.1619405, -4.806939, -7.019347, 0, 1.5, 0.5, 0.5
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
-4.634017, -0.01776218, -7.019347, 0, -0.5, 0.5, 0.5,
-4.634017, -0.01776218, -7.019347, 1, -0.5, 0.5, 0.5,
-4.634017, -0.01776218, -7.019347, 1, 1.5, 0.5, 0.5,
-4.634017, -0.01776218, -7.019347, 0, 1.5, 0.5, 0.5
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
-4.634017, -4.806939, -0.4026504, 0, -0.5, 0.5, 0.5,
-4.634017, -4.806939, -0.4026504, 1, -0.5, 0.5, 0.5,
-4.634017, -4.806939, -0.4026504, 1, 1.5, 0.5, 0.5,
-4.634017, -4.806939, -0.4026504, 0, 1.5, 0.5, 0.5
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
-3, -3.701744, -5.492417,
3, -3.701744, -5.492417,
-3, -3.701744, -5.492417,
-3, -3.885943, -5.746905,
-2, -3.701744, -5.492417,
-2, -3.885943, -5.746905,
-1, -3.701744, -5.492417,
-1, -3.885943, -5.746905,
0, -3.701744, -5.492417,
0, -3.885943, -5.746905,
1, -3.701744, -5.492417,
1, -3.885943, -5.746905,
2, -3.701744, -5.492417,
2, -3.885943, -5.746905,
3, -3.701744, -5.492417,
3, -3.885943, -5.746905
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
-3, -4.254342, -6.255882, 0, -0.5, 0.5, 0.5,
-3, -4.254342, -6.255882, 1, -0.5, 0.5, 0.5,
-3, -4.254342, -6.255882, 1, 1.5, 0.5, 0.5,
-3, -4.254342, -6.255882, 0, 1.5, 0.5, 0.5,
-2, -4.254342, -6.255882, 0, -0.5, 0.5, 0.5,
-2, -4.254342, -6.255882, 1, -0.5, 0.5, 0.5,
-2, -4.254342, -6.255882, 1, 1.5, 0.5, 0.5,
-2, -4.254342, -6.255882, 0, 1.5, 0.5, 0.5,
-1, -4.254342, -6.255882, 0, -0.5, 0.5, 0.5,
-1, -4.254342, -6.255882, 1, -0.5, 0.5, 0.5,
-1, -4.254342, -6.255882, 1, 1.5, 0.5, 0.5,
-1, -4.254342, -6.255882, 0, 1.5, 0.5, 0.5,
0, -4.254342, -6.255882, 0, -0.5, 0.5, 0.5,
0, -4.254342, -6.255882, 1, -0.5, 0.5, 0.5,
0, -4.254342, -6.255882, 1, 1.5, 0.5, 0.5,
0, -4.254342, -6.255882, 0, 1.5, 0.5, 0.5,
1, -4.254342, -6.255882, 0, -0.5, 0.5, 0.5,
1, -4.254342, -6.255882, 1, -0.5, 0.5, 0.5,
1, -4.254342, -6.255882, 1, 1.5, 0.5, 0.5,
1, -4.254342, -6.255882, 0, 1.5, 0.5, 0.5,
2, -4.254342, -6.255882, 0, -0.5, 0.5, 0.5,
2, -4.254342, -6.255882, 1, -0.5, 0.5, 0.5,
2, -4.254342, -6.255882, 1, 1.5, 0.5, 0.5,
2, -4.254342, -6.255882, 0, 1.5, 0.5, 0.5,
3, -4.254342, -6.255882, 0, -0.5, 0.5, 0.5,
3, -4.254342, -6.255882, 1, -0.5, 0.5, 0.5,
3, -4.254342, -6.255882, 1, 1.5, 0.5, 0.5,
3, -4.254342, -6.255882, 0, 1.5, 0.5, 0.5
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
-3.601999, -2, -5.492417,
-3.601999, 2, -5.492417,
-3.601999, -2, -5.492417,
-3.774002, -2, -5.746905,
-3.601999, 0, -5.492417,
-3.774002, 0, -5.746905,
-3.601999, 2, -5.492417,
-3.774002, 2, -5.746905
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
-4.118008, -2, -6.255882, 0, -0.5, 0.5, 0.5,
-4.118008, -2, -6.255882, 1, -0.5, 0.5, 0.5,
-4.118008, -2, -6.255882, 1, 1.5, 0.5, 0.5,
-4.118008, -2, -6.255882, 0, 1.5, 0.5, 0.5,
-4.118008, 0, -6.255882, 0, -0.5, 0.5, 0.5,
-4.118008, 0, -6.255882, 1, -0.5, 0.5, 0.5,
-4.118008, 0, -6.255882, 1, 1.5, 0.5, 0.5,
-4.118008, 0, -6.255882, 0, 1.5, 0.5, 0.5,
-4.118008, 2, -6.255882, 0, -0.5, 0.5, 0.5,
-4.118008, 2, -6.255882, 1, -0.5, 0.5, 0.5,
-4.118008, 2, -6.255882, 1, 1.5, 0.5, 0.5,
-4.118008, 2, -6.255882, 0, 1.5, 0.5, 0.5
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
-3.601999, -3.701744, -4,
-3.601999, -3.701744, 4,
-3.601999, -3.701744, -4,
-3.774002, -3.885943, -4,
-3.601999, -3.701744, -2,
-3.774002, -3.885943, -2,
-3.601999, -3.701744, 0,
-3.774002, -3.885943, 0,
-3.601999, -3.701744, 2,
-3.774002, -3.885943, 2,
-3.601999, -3.701744, 4,
-3.774002, -3.885943, 4
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
-4.118008, -4.254342, -4, 0, -0.5, 0.5, 0.5,
-4.118008, -4.254342, -4, 1, -0.5, 0.5, 0.5,
-4.118008, -4.254342, -4, 1, 1.5, 0.5, 0.5,
-4.118008, -4.254342, -4, 0, 1.5, 0.5, 0.5,
-4.118008, -4.254342, -2, 0, -0.5, 0.5, 0.5,
-4.118008, -4.254342, -2, 1, -0.5, 0.5, 0.5,
-4.118008, -4.254342, -2, 1, 1.5, 0.5, 0.5,
-4.118008, -4.254342, -2, 0, 1.5, 0.5, 0.5,
-4.118008, -4.254342, 0, 0, -0.5, 0.5, 0.5,
-4.118008, -4.254342, 0, 1, -0.5, 0.5, 0.5,
-4.118008, -4.254342, 0, 1, 1.5, 0.5, 0.5,
-4.118008, -4.254342, 0, 0, 1.5, 0.5, 0.5,
-4.118008, -4.254342, 2, 0, -0.5, 0.5, 0.5,
-4.118008, -4.254342, 2, 1, -0.5, 0.5, 0.5,
-4.118008, -4.254342, 2, 1, 1.5, 0.5, 0.5,
-4.118008, -4.254342, 2, 0, 1.5, 0.5, 0.5,
-4.118008, -4.254342, 4, 0, -0.5, 0.5, 0.5,
-4.118008, -4.254342, 4, 1, -0.5, 0.5, 0.5,
-4.118008, -4.254342, 4, 1, 1.5, 0.5, 0.5,
-4.118008, -4.254342, 4, 0, 1.5, 0.5, 0.5
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
-3.601999, -3.701744, -5.492417,
-3.601999, 3.66622, -5.492417,
-3.601999, -3.701744, 4.687117,
-3.601999, 3.66622, 4.687117,
-3.601999, -3.701744, -5.492417,
-3.601999, -3.701744, 4.687117,
-3.601999, 3.66622, -5.492417,
-3.601999, 3.66622, 4.687117,
-3.601999, -3.701744, -5.492417,
3.278118, -3.701744, -5.492417,
-3.601999, -3.701744, 4.687117,
3.278118, -3.701744, 4.687117,
-3.601999, 3.66622, -5.492417,
3.278118, 3.66622, -5.492417,
-3.601999, 3.66622, 4.687117,
3.278118, 3.66622, 4.687117,
3.278118, -3.701744, -5.492417,
3.278118, 3.66622, -5.492417,
3.278118, -3.701744, 4.687117,
3.278118, 3.66622, 4.687117,
3.278118, -3.701744, -5.492417,
3.278118, -3.701744, 4.687117,
3.278118, 3.66622, -5.492417,
3.278118, 3.66622, 4.687117
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
var radius = 7.650021;
var distance = 34.0358;
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
mvMatrix.translate( 0.1619405, 0.01776218, 0.4026504 );
mvMatrix.scale( 1.202211, 1.12261, 0.8125473 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.0358);
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
dimethipin<-read.table("dimethipin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dimethipin$V2
```

```
## Error in eval(expr, envir, enclos): object 'dimethipin' not found
```

```r
y<-dimethipin$V3
```

```
## Error in eval(expr, envir, enclos): object 'dimethipin' not found
```

```r
z<-dimethipin$V4
```

```
## Error in eval(expr, envir, enclos): object 'dimethipin' not found
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
-3.501803, 2.30727, 0.07410579, 0, 0, 1, 1, 1,
-3.343076, -0.0755216, -1.468943, 1, 0, 0, 1, 1,
-3.168595, -0.124207, -2.397594, 1, 0, 0, 1, 1,
-2.836156, -0.554471, -2.662508, 1, 0, 0, 1, 1,
-2.654991, -0.8364182, -2.192283, 1, 0, 0, 1, 1,
-2.561086, -0.8376228, -3.667672, 1, 0, 0, 1, 1,
-2.53547, -0.8641807, -1.711515, 0, 0, 0, 1, 1,
-2.511569, 1.53304, -0.1344111, 0, 0, 0, 1, 1,
-2.460025, 0.3240947, -2.816875, 0, 0, 0, 1, 1,
-2.436225, -0.3140639, -1.620934, 0, 0, 0, 1, 1,
-2.425243, 2.238952, -1.570572, 0, 0, 0, 1, 1,
-2.361328, 0.2153029, -2.307079, 0, 0, 0, 1, 1,
-2.315504, 0.9390985, -1.718463, 0, 0, 0, 1, 1,
-2.27429, -0.8651471, -1.021664, 1, 1, 1, 1, 1,
-2.230199, -2.60448, -1.666569, 1, 1, 1, 1, 1,
-2.160006, -0.2612292, -2.945271, 1, 1, 1, 1, 1,
-2.139638, -0.0216202, -3.819411, 1, 1, 1, 1, 1,
-2.109002, -1.827673, -2.429635, 1, 1, 1, 1, 1,
-2.105151, -1.306348, -2.861514, 1, 1, 1, 1, 1,
-2.067584, -0.3875468, -0.5124921, 1, 1, 1, 1, 1,
-2.061509, -1.344528, -1.349271, 1, 1, 1, 1, 1,
-2.0586, -1.473636, -0.6257043, 1, 1, 1, 1, 1,
-2.052279, -1.983118, -3.503278, 1, 1, 1, 1, 1,
-2.047395, -1.743165, -3.031012, 1, 1, 1, 1, 1,
-2.034381, -1.787827, -3.020098, 1, 1, 1, 1, 1,
-2.029583, 0.7509226, -1.842591, 1, 1, 1, 1, 1,
-2.010692, 0.8489028, -0.5360267, 1, 1, 1, 1, 1,
-2.007603, 0.6798295, -2.30339, 1, 1, 1, 1, 1,
-2.004526, 1.49943, -1.575822, 0, 0, 1, 1, 1,
-1.951309, 1.24186, -1.790807, 1, 0, 0, 1, 1,
-1.948502, -0.3711392, -0.6552702, 1, 0, 0, 1, 1,
-1.893027, 2.10351, -0.6358452, 1, 0, 0, 1, 1,
-1.888534, 1.598164, 0.8060508, 1, 0, 0, 1, 1,
-1.886745, -3.594444, -2.542189, 1, 0, 0, 1, 1,
-1.882338, 0.6518409, 0.04193018, 0, 0, 0, 1, 1,
-1.867817, 2.448019, -0.8100875, 0, 0, 0, 1, 1,
-1.865135, -0.3927655, -2.528834, 0, 0, 0, 1, 1,
-1.865052, 0.01854419, -1.362523, 0, 0, 0, 1, 1,
-1.845394, -1.392402, -1.834213, 0, 0, 0, 1, 1,
-1.820809, -1.511331, -3.144356, 0, 0, 0, 1, 1,
-1.815601, 0.1995422, -0.3038402, 0, 0, 0, 1, 1,
-1.811595, -1.068245, -2.403454, 1, 1, 1, 1, 1,
-1.806808, -0.9724532, -1.564691, 1, 1, 1, 1, 1,
-1.781017, -0.2320556, -2.76042, 1, 1, 1, 1, 1,
-1.761173, 2.191305, -0.7320484, 1, 1, 1, 1, 1,
-1.760624, -0.2991675, -2.480215, 1, 1, 1, 1, 1,
-1.745, -1.462246, -3.161121, 1, 1, 1, 1, 1,
-1.742182, 0.3210192, -1.702283, 1, 1, 1, 1, 1,
-1.735393, 0.1661093, -0.9080722, 1, 1, 1, 1, 1,
-1.735147, -0.2754007, -0.9817747, 1, 1, 1, 1, 1,
-1.721243, -0.1867137, -2.217917, 1, 1, 1, 1, 1,
-1.720958, 1.815666, -2.771388, 1, 1, 1, 1, 1,
-1.681416, 1.739873, -1.268625, 1, 1, 1, 1, 1,
-1.678451, 0.0683351, 0.2217014, 1, 1, 1, 1, 1,
-1.674929, -0.9606155, -2.042234, 1, 1, 1, 1, 1,
-1.672667, -1.404483, -1.379345, 1, 1, 1, 1, 1,
-1.632574, -0.8950534, -1.681312, 0, 0, 1, 1, 1,
-1.632308, 0.0746265, -1.475505, 1, 0, 0, 1, 1,
-1.629442, -0.3202133, -1.960931, 1, 0, 0, 1, 1,
-1.627455, 1.091811, -0.7279536, 1, 0, 0, 1, 1,
-1.623917, 0.4079668, 0.0928084, 1, 0, 0, 1, 1,
-1.586541, -1.540646, -1.678116, 1, 0, 0, 1, 1,
-1.585742, 0.3683722, -1.206305, 0, 0, 0, 1, 1,
-1.578329, -0.395136, -0.7948617, 0, 0, 0, 1, 1,
-1.571393, -0.05465028, -2.823939, 0, 0, 0, 1, 1,
-1.570335, 1.52731, -1.332392, 0, 0, 0, 1, 1,
-1.566743, -0.6946503, -2.131022, 0, 0, 0, 1, 1,
-1.542456, 1.11904, -4.186238, 0, 0, 0, 1, 1,
-1.515374, -1.312371, -2.935362, 0, 0, 0, 1, 1,
-1.503262, -0.3014842, -0.004887246, 1, 1, 1, 1, 1,
-1.496202, 1.65774, -0.08847504, 1, 1, 1, 1, 1,
-1.492971, 1.638805, -0.7670953, 1, 1, 1, 1, 1,
-1.482622, 1.964766, -0.7703804, 1, 1, 1, 1, 1,
-1.480016, 0.5537195, -2.134651, 1, 1, 1, 1, 1,
-1.4754, -0.3224172, -2.492737, 1, 1, 1, 1, 1,
-1.450097, -1.75532, -1.95285, 1, 1, 1, 1, 1,
-1.443806, -1.079928, -2.564228, 1, 1, 1, 1, 1,
-1.443321, 0.09601833, 0.1460311, 1, 1, 1, 1, 1,
-1.437635, 1.062378, -1.727279, 1, 1, 1, 1, 1,
-1.431956, 0.1710344, -2.259827, 1, 1, 1, 1, 1,
-1.430381, 0.1176002, -1.604219, 1, 1, 1, 1, 1,
-1.413278, 1.458845, -1.479476, 1, 1, 1, 1, 1,
-1.405154, 0.5082331, -1.189756, 1, 1, 1, 1, 1,
-1.40112, -0.5597779, -0.2377162, 1, 1, 1, 1, 1,
-1.399886, 0.2551134, -1.554539, 0, 0, 1, 1, 1,
-1.399402, -0.8048769, -3.558728, 1, 0, 0, 1, 1,
-1.394084, -2.02202, -3.685302, 1, 0, 0, 1, 1,
-1.38964, -2.076955, -1.757303, 1, 0, 0, 1, 1,
-1.387877, 0.2841318, -2.218035, 1, 0, 0, 1, 1,
-1.384115, -0.159892, -0.8610413, 1, 0, 0, 1, 1,
-1.365775, 1.226638, -0.8029295, 0, 0, 0, 1, 1,
-1.362818, 1.984535, 0.2162145, 0, 0, 0, 1, 1,
-1.356282, 0.1484991, -1.605451, 0, 0, 0, 1, 1,
-1.350089, 0.1486278, -0.3323945, 0, 0, 0, 1, 1,
-1.349126, 0.6774493, 0.5658134, 0, 0, 0, 1, 1,
-1.343977, -1.90081, -3.699685, 0, 0, 0, 1, 1,
-1.341614, 0.515724, -0.2743128, 0, 0, 0, 1, 1,
-1.332246, 0.7945965, -2.175342, 1, 1, 1, 1, 1,
-1.314036, -0.2980972, -1.627249, 1, 1, 1, 1, 1,
-1.310438, 0.4289265, -2.263293, 1, 1, 1, 1, 1,
-1.306776, -2.187235, -2.659244, 1, 1, 1, 1, 1,
-1.298863, 0.7304869, -1.542759, 1, 1, 1, 1, 1,
-1.297721, -0.3894438, -0.08979001, 1, 1, 1, 1, 1,
-1.295725, -0.4568139, -1.377986, 1, 1, 1, 1, 1,
-1.282343, -0.3185461, -0.5377528, 1, 1, 1, 1, 1,
-1.267281, -0.3848179, -1.974012, 1, 1, 1, 1, 1,
-1.26658, -1.141792, -2.746982, 1, 1, 1, 1, 1,
-1.263599, -0.6789746, -2.23364, 1, 1, 1, 1, 1,
-1.258099, 0.1015214, -1.915803, 1, 1, 1, 1, 1,
-1.246786, -0.2599173, -1.435032, 1, 1, 1, 1, 1,
-1.239066, 1.156976, -0.4455934, 1, 1, 1, 1, 1,
-1.238578, -0.2837041, -0.6147999, 1, 1, 1, 1, 1,
-1.236133, -1.63056, -2.800184, 0, 0, 1, 1, 1,
-1.232473, 0.6744194, 0.3839296, 1, 0, 0, 1, 1,
-1.231466, -0.9060094, -2.61024, 1, 0, 0, 1, 1,
-1.225973, 0.4454314, -2.368039, 1, 0, 0, 1, 1,
-1.219145, 1.36177, -1.487151, 1, 0, 0, 1, 1,
-1.217498, -1.620512, -3.033321, 1, 0, 0, 1, 1,
-1.217053, 0.4255329, -1.30385, 0, 0, 0, 1, 1,
-1.214346, -1.34409, -1.198697, 0, 0, 0, 1, 1,
-1.206078, -1.714713, -3.906713, 0, 0, 0, 1, 1,
-1.193929, -0.430949, -1.809288, 0, 0, 0, 1, 1,
-1.187148, 0.6843618, -3.189965, 0, 0, 0, 1, 1,
-1.180065, 0.6606885, -1.15126, 0, 0, 0, 1, 1,
-1.175334, 0.8118985, 0.4198745, 0, 0, 0, 1, 1,
-1.174016, -0.1472082, -2.075339, 1, 1, 1, 1, 1,
-1.173883, -0.8876391, -2.051898, 1, 1, 1, 1, 1,
-1.171348, -0.478858, -3.56535, 1, 1, 1, 1, 1,
-1.166909, -0.9059804, -2.906106, 1, 1, 1, 1, 1,
-1.166502, 0.5204778, -0.3657449, 1, 1, 1, 1, 1,
-1.163197, -0.8315132, -0.3959982, 1, 1, 1, 1, 1,
-1.16189, -1.24079, -3.508702, 1, 1, 1, 1, 1,
-1.154975, 1.814605, 0.4950832, 1, 1, 1, 1, 1,
-1.15278, -0.3764783, -1.644234, 1, 1, 1, 1, 1,
-1.149514, -1.341194, -3.154413, 1, 1, 1, 1, 1,
-1.147241, 0.3681499, -0.5299623, 1, 1, 1, 1, 1,
-1.143782, -0.3575088, -1.750004, 1, 1, 1, 1, 1,
-1.140917, 0.6963891, -1.130714, 1, 1, 1, 1, 1,
-1.139192, -0.8473996, -3.593673, 1, 1, 1, 1, 1,
-1.136333, 0.8511084, -1.005601, 1, 1, 1, 1, 1,
-1.134641, 0.9644135, -1.100814, 0, 0, 1, 1, 1,
-1.129264, -0.5360022, -0.8867704, 1, 0, 0, 1, 1,
-1.12838, -0.1746355, -1.133423, 1, 0, 0, 1, 1,
-1.119484, 0.5599693, -0.7112942, 1, 0, 0, 1, 1,
-1.114706, -0.1951958, 0.03439841, 1, 0, 0, 1, 1,
-1.1112, -0.9551116, -3.338068, 1, 0, 0, 1, 1,
-1.104495, -1.983777, -4.021374, 0, 0, 0, 1, 1,
-1.092309, -0.8657512, -1.840391, 0, 0, 0, 1, 1,
-1.075735, -0.9788724, -2.727439, 0, 0, 0, 1, 1,
-1.070361, 0.3490806, -1.046539, 0, 0, 0, 1, 1,
-1.063156, -0.5586712, -0.9176083, 0, 0, 0, 1, 1,
-1.060739, 0.9147441, -0.3195251, 0, 0, 0, 1, 1,
-1.05863, -0.03994846, -1.425523, 0, 0, 0, 1, 1,
-1.041302, -1.138956, -2.441489, 1, 1, 1, 1, 1,
-1.03013, 0.9649264, 0.2833925, 1, 1, 1, 1, 1,
-1.028298, -1.078423, -1.163448, 1, 1, 1, 1, 1,
-1.025265, 0.2652738, -0.2386866, 1, 1, 1, 1, 1,
-1.021954, 1.41844, -0.125392, 1, 1, 1, 1, 1,
-1.020812, -0.6299459, -2.928963, 1, 1, 1, 1, 1,
-1.019233, 0.8806686, -1.501695, 1, 1, 1, 1, 1,
-1.018794, 2.067939, -1.709045, 1, 1, 1, 1, 1,
-1.01789, 0.907931, -1.533567, 1, 1, 1, 1, 1,
-1.015651, 0.6517858, -2.002532, 1, 1, 1, 1, 1,
-1.008407, 1.523574, -0.445441, 1, 1, 1, 1, 1,
-0.9987417, 1.012018, -0.7382498, 1, 1, 1, 1, 1,
-0.9957783, 0.4754428, -0.5298502, 1, 1, 1, 1, 1,
-0.9930605, 1.475545, -1.771464, 1, 1, 1, 1, 1,
-0.9915527, -0.6803423, -2.844983, 1, 1, 1, 1, 1,
-0.9800007, 0.1386898, -0.4169559, 0, 0, 1, 1, 1,
-0.9740142, -0.1837922, -2.795462, 1, 0, 0, 1, 1,
-0.9732974, -0.6730533, -2.422612, 1, 0, 0, 1, 1,
-0.9698396, -0.6399435, -0.8359261, 1, 0, 0, 1, 1,
-0.9659557, 1.38377, 0.9789726, 1, 0, 0, 1, 1,
-0.9648358, 1.17223, -1.060159, 1, 0, 0, 1, 1,
-0.9605957, -0.8933916, -1.335833, 0, 0, 0, 1, 1,
-0.9593435, -0.1000794, -2.171861, 0, 0, 0, 1, 1,
-0.9590037, -0.1155212, -1.648069, 0, 0, 0, 1, 1,
-0.958937, 0.0615112, -0.8219543, 0, 0, 0, 1, 1,
-0.9583026, -0.3499411, -1.168974, 0, 0, 0, 1, 1,
-0.9499717, 0.8604842, -3.296023, 0, 0, 0, 1, 1,
-0.9452396, -0.7980568, -1.778548, 0, 0, 0, 1, 1,
-0.9433206, 0.5597335, 0.20156, 1, 1, 1, 1, 1,
-0.9410601, 0.08711959, -1.560908, 1, 1, 1, 1, 1,
-0.9402452, -1.475443, -2.764381, 1, 1, 1, 1, 1,
-0.934906, -0.7135432, -0.682001, 1, 1, 1, 1, 1,
-0.9329082, 0.5936574, -1.502224, 1, 1, 1, 1, 1,
-0.9319559, -1.079985, -3.4491, 1, 1, 1, 1, 1,
-0.9231911, 0.2504897, -0.9886463, 1, 1, 1, 1, 1,
-0.9197912, -1.562122, -1.939257, 1, 1, 1, 1, 1,
-0.9093406, 0.658984, -1.37915, 1, 1, 1, 1, 1,
-0.9089448, 0.2347208, 0.2449702, 1, 1, 1, 1, 1,
-0.9034681, -0.05577392, -2.192809, 1, 1, 1, 1, 1,
-0.9028748, 0.2120332, -1.259473, 1, 1, 1, 1, 1,
-0.9015035, -0.8660032, -3.290287, 1, 1, 1, 1, 1,
-0.8969889, -0.5052694, -2.273175, 1, 1, 1, 1, 1,
-0.8883624, 1.045861, -0.1390405, 1, 1, 1, 1, 1,
-0.8878849, 1.282936, -0.5899881, 0, 0, 1, 1, 1,
-0.8831248, -0.3179208, -1.143432, 1, 0, 0, 1, 1,
-0.8821983, -1.030689, -2.35682, 1, 0, 0, 1, 1,
-0.8809572, -0.412531, -1.815995, 1, 0, 0, 1, 1,
-0.8796696, -0.8355913, -3.2992, 1, 0, 0, 1, 1,
-0.8742744, -0.3947949, -2.569177, 1, 0, 0, 1, 1,
-0.8658094, 0.338092, -1.121187, 0, 0, 0, 1, 1,
-0.8624178, 1.699184, 0.7325022, 0, 0, 0, 1, 1,
-0.8581724, 0.1192584, -0.9297568, 0, 0, 0, 1, 1,
-0.8574366, 0.2606794, -1.903491, 0, 0, 0, 1, 1,
-0.8521674, -1.575134, -3.632832, 0, 0, 0, 1, 1,
-0.8458002, -0.00203174, -0.354891, 0, 0, 0, 1, 1,
-0.8400767, -0.9937484, -2.88174, 0, 0, 0, 1, 1,
-0.8400617, 0.4557893, -2.185163, 1, 1, 1, 1, 1,
-0.8378616, -0.1132906, -2.036855, 1, 1, 1, 1, 1,
-0.8368485, 0.4998232, -1.306644, 1, 1, 1, 1, 1,
-0.8324353, -0.0698598, -0.948137, 1, 1, 1, 1, 1,
-0.8254237, 0.2907206, -1.555368, 1, 1, 1, 1, 1,
-0.8253816, -0.1486742, -0.2591615, 1, 1, 1, 1, 1,
-0.8182589, -1.583285, -3.925644, 1, 1, 1, 1, 1,
-0.8170615, -1.207818, -3.746379, 1, 1, 1, 1, 1,
-0.8121279, -1.530737, -3.357721, 1, 1, 1, 1, 1,
-0.8114856, -0.6137287, -3.436054, 1, 1, 1, 1, 1,
-0.8052208, 2.005454, -0.1414045, 1, 1, 1, 1, 1,
-0.805172, -0.7246707, -1.155966, 1, 1, 1, 1, 1,
-0.8025829, 0.3416244, -0.941451, 1, 1, 1, 1, 1,
-0.7989186, -0.4197318, -3.010679, 1, 1, 1, 1, 1,
-0.7984861, -0.02064248, -1.339581, 1, 1, 1, 1, 1,
-0.797382, -1.732311, -3.338758, 0, 0, 1, 1, 1,
-0.7960098, 0.352261, -2.965618, 1, 0, 0, 1, 1,
-0.7870839, -1.146046, -3.09598, 1, 0, 0, 1, 1,
-0.7862634, 0.1820169, -2.529942, 1, 0, 0, 1, 1,
-0.7862359, 0.7549567, -1.747673, 1, 0, 0, 1, 1,
-0.7841608, 0.2238446, -1.810062, 1, 0, 0, 1, 1,
-0.7798548, 0.378102, -0.03944311, 0, 0, 0, 1, 1,
-0.77801, 1.977047, -0.4086689, 0, 0, 0, 1, 1,
-0.776439, 0.2891769, -1.750881, 0, 0, 0, 1, 1,
-0.7722097, -2.784033, -3.193249, 0, 0, 0, 1, 1,
-0.7679883, -1.125909, -1.420402, 0, 0, 0, 1, 1,
-0.7673905, -0.4923377, -1.376169, 0, 0, 0, 1, 1,
-0.7614527, 0.229831, -0.8416593, 0, 0, 0, 1, 1,
-0.7581326, -0.3796821, -0.8571208, 1, 1, 1, 1, 1,
-0.7554607, 0.2268278, -2.208891, 1, 1, 1, 1, 1,
-0.7554285, -0.2946313, -1.097654, 1, 1, 1, 1, 1,
-0.7484405, -0.08513609, -0.846046, 1, 1, 1, 1, 1,
-0.7465083, -0.1513222, -2.224543, 1, 1, 1, 1, 1,
-0.7421069, -0.231321, -1.721153, 1, 1, 1, 1, 1,
-0.7401571, 0.9451913, -0.9867641, 1, 1, 1, 1, 1,
-0.7398713, -0.6907145, -2.018301, 1, 1, 1, 1, 1,
-0.7316269, 1.227204, 0.685289, 1, 1, 1, 1, 1,
-0.7285626, 1.090385, -1.966824, 1, 1, 1, 1, 1,
-0.7234007, 1.090955, 0.1301454, 1, 1, 1, 1, 1,
-0.7062345, 0.6463498, -1.535377, 1, 1, 1, 1, 1,
-0.6940704, -0.2475053, -0.2494673, 1, 1, 1, 1, 1,
-0.6929779, -0.5882861, -1.703162, 1, 1, 1, 1, 1,
-0.6882488, 0.06298499, -2.448543, 1, 1, 1, 1, 1,
-0.6856366, -0.316757, -2.578535, 0, 0, 1, 1, 1,
-0.6823995, 0.5670208, 0.09581281, 1, 0, 0, 1, 1,
-0.6777666, 0.8744541, -1.494589, 1, 0, 0, 1, 1,
-0.6748397, 2.371308, -2.282303, 1, 0, 0, 1, 1,
-0.6721047, -1.251935, -2.007239, 1, 0, 0, 1, 1,
-0.6658613, 0.1088569, -0.4341601, 1, 0, 0, 1, 1,
-0.6647581, 1.198274, -0.8599756, 0, 0, 0, 1, 1,
-0.6647525, 0.562636, -0.1843418, 0, 0, 0, 1, 1,
-0.6615247, -2.264094, -1.63276, 0, 0, 0, 1, 1,
-0.6594233, -0.9477372, -2.835548, 0, 0, 0, 1, 1,
-0.6555052, 0.2501658, -0.8297288, 0, 0, 0, 1, 1,
-0.6544136, 0.2871838, -1.197541, 0, 0, 0, 1, 1,
-0.6532597, -2.965857, -3.041529, 0, 0, 0, 1, 1,
-0.6500348, 0.3685465, 0.0213738, 1, 1, 1, 1, 1,
-0.6496143, -1.099715, -2.977062, 1, 1, 1, 1, 1,
-0.6462401, 1.915364, -1.73105, 1, 1, 1, 1, 1,
-0.6398368, -0.2579223, -3.123827, 1, 1, 1, 1, 1,
-0.6373704, -1.625759, -2.289554, 1, 1, 1, 1, 1,
-0.6350957, 0.3100013, -0.9823478, 1, 1, 1, 1, 1,
-0.6284441, 0.691519, -1.746753, 1, 1, 1, 1, 1,
-0.6275728, 0.3049904, -0.9265221, 1, 1, 1, 1, 1,
-0.6254476, -0.1871085, -2.733456, 1, 1, 1, 1, 1,
-0.6245294, 0.1173239, -2.533312, 1, 1, 1, 1, 1,
-0.6242619, 0.3838064, -0.3984528, 1, 1, 1, 1, 1,
-0.621849, -0.1132511, -1.438684, 1, 1, 1, 1, 1,
-0.6218266, -0.8868169, -1.566757, 1, 1, 1, 1, 1,
-0.6158951, 1.836872, -2.139085, 1, 1, 1, 1, 1,
-0.614549, -0.6225403, -2.801023, 1, 1, 1, 1, 1,
-0.6108457, 0.6081659, -0.4237842, 0, 0, 1, 1, 1,
-0.60905, -0.9361213, -1.015505, 1, 0, 0, 1, 1,
-0.6049567, 0.3184519, -0.6256492, 1, 0, 0, 1, 1,
-0.5973642, 0.07694171, -1.204601, 1, 0, 0, 1, 1,
-0.5967562, 8.598479e-05, 0.1857432, 1, 0, 0, 1, 1,
-0.5923311, 0.5147148, 0.1599657, 1, 0, 0, 1, 1,
-0.5822651, -1.685054, -4.030785, 0, 0, 0, 1, 1,
-0.5757475, -1.238853, -2.30801, 0, 0, 0, 1, 1,
-0.5742525, 0.4673462, 0.188204, 0, 0, 0, 1, 1,
-0.5704209, 0.7463132, -0.3474656, 0, 0, 0, 1, 1,
-0.5703938, -0.3888054, -2.471886, 0, 0, 0, 1, 1,
-0.5697268, -0.3509825, -1.829085, 0, 0, 0, 1, 1,
-0.5641132, -0.1424768, -0.9525036, 0, 0, 0, 1, 1,
-0.5639091, 0.4136461, -0.5765454, 1, 1, 1, 1, 1,
-0.5599417, -0.1843234, -2.349032, 1, 1, 1, 1, 1,
-0.5457874, -1.139213, -2.905481, 1, 1, 1, 1, 1,
-0.5408753, 0.7100148, -0.6260153, 1, 1, 1, 1, 1,
-0.5395389, -0.3040652, -0.9827884, 1, 1, 1, 1, 1,
-0.5395135, -1.889467, -5.070502, 1, 1, 1, 1, 1,
-0.5377518, -1.293032, -3.030396, 1, 1, 1, 1, 1,
-0.53118, -0.01757273, 1.38613, 1, 1, 1, 1, 1,
-0.526564, 0.3163596, -0.8016592, 1, 1, 1, 1, 1,
-0.5242599, -1.248176, -4.172936, 1, 1, 1, 1, 1,
-0.520413, 0.9740282, 0.4214505, 1, 1, 1, 1, 1,
-0.5186877, 0.3265338, -1.16307, 1, 1, 1, 1, 1,
-0.5170082, -0.2833558, -2.916414, 1, 1, 1, 1, 1,
-0.5155739, 0.5183344, -1.389046, 1, 1, 1, 1, 1,
-0.5090115, 0.007284059, -3.233393, 1, 1, 1, 1, 1,
-0.5084755, -0.06300022, -0.4788269, 0, 0, 1, 1, 1,
-0.5025182, -1.07717, -1.5065, 1, 0, 0, 1, 1,
-0.5021082, -0.5869346, -3.621271, 1, 0, 0, 1, 1,
-0.5000361, 1.326228, 0.6391669, 1, 0, 0, 1, 1,
-0.4994287, -1.686476, -2.176362, 1, 0, 0, 1, 1,
-0.4974975, 1.902395, -0.1897074, 1, 0, 0, 1, 1,
-0.4966011, -0.1329479, -2.473634, 0, 0, 0, 1, 1,
-0.4928614, -0.4944922, -2.28569, 0, 0, 0, 1, 1,
-0.4916696, 0.531088, -1.739439, 0, 0, 0, 1, 1,
-0.4890305, -0.06893864, 0.6136717, 0, 0, 0, 1, 1,
-0.4856953, -0.55111, -3.200249, 0, 0, 0, 1, 1,
-0.485622, 0.5701709, -1.420514, 0, 0, 0, 1, 1,
-0.4824888, 0.3025081, -1.544005, 0, 0, 0, 1, 1,
-0.4770355, 0.5487428, -0.6421478, 1, 1, 1, 1, 1,
-0.4763975, 0.6177546, -0.6134367, 1, 1, 1, 1, 1,
-0.4710536, 0.9956572, 0.5771741, 1, 1, 1, 1, 1,
-0.4699717, -0.4627682, -4.309506, 1, 1, 1, 1, 1,
-0.4665245, -0.8216537, -2.623113, 1, 1, 1, 1, 1,
-0.4653109, 0.5929033, 1.36816, 1, 1, 1, 1, 1,
-0.4591665, -1.930623, -4.315281, 1, 1, 1, 1, 1,
-0.4590655, -1.136699, -2.182247, 1, 1, 1, 1, 1,
-0.4581857, 0.01736088, -1.218809, 1, 1, 1, 1, 1,
-0.4543612, 0.6217793, -0.7804167, 1, 1, 1, 1, 1,
-0.4511595, -1.899243, -3.217268, 1, 1, 1, 1, 1,
-0.449953, 0.1614083, -0.2821024, 1, 1, 1, 1, 1,
-0.4463836, 0.3478915, -1.83316, 1, 1, 1, 1, 1,
-0.444412, 1.395726, -0.5087438, 1, 1, 1, 1, 1,
-0.4368675, -0.691525, -1.241316, 1, 1, 1, 1, 1,
-0.4345684, -0.2584186, -5.282456, 0, 0, 1, 1, 1,
-0.4344055, 0.2620643, -1.659745, 1, 0, 0, 1, 1,
-0.4303515, 1.607238, -0.6404376, 1, 0, 0, 1, 1,
-0.422722, -0.9531954, -3.224521, 1, 0, 0, 1, 1,
-0.4204602, -0.7155238, -3.552376, 1, 0, 0, 1, 1,
-0.4184908, 0.1420178, -3.220973, 1, 0, 0, 1, 1,
-0.4170991, -1.978647, -1.713994, 0, 0, 0, 1, 1,
-0.4170897, -2.198667, -2.340652, 0, 0, 0, 1, 1,
-0.4161721, 2.832212, 0.5548751, 0, 0, 0, 1, 1,
-0.4159753, 0.3599416, -1.924634, 0, 0, 0, 1, 1,
-0.4012248, 1.358235, 0.9244048, 0, 0, 0, 1, 1,
-0.4008892, 0.7362769, 0.7789322, 0, 0, 0, 1, 1,
-0.3990032, 0.1682078, -1.454633, 0, 0, 0, 1, 1,
-0.3988208, 0.1741471, -1.726076, 1, 1, 1, 1, 1,
-0.3938495, -0.8397121, -3.029428, 1, 1, 1, 1, 1,
-0.3932976, -2.237159, -4.081306, 1, 1, 1, 1, 1,
-0.3925265, -0.306311, -2.190926, 1, 1, 1, 1, 1,
-0.3915009, 0.09071153, -2.724622, 1, 1, 1, 1, 1,
-0.391293, -0.5866145, -3.343131, 1, 1, 1, 1, 1,
-0.3905455, 0.9855078, -2.031718, 1, 1, 1, 1, 1,
-0.388338, 0.5534292, -1.385109, 1, 1, 1, 1, 1,
-0.3871694, 1.001917, -0.6376783, 1, 1, 1, 1, 1,
-0.3868821, 0.772758, -1.576841, 1, 1, 1, 1, 1,
-0.383612, 0.5244762, -1.475087, 1, 1, 1, 1, 1,
-0.3815032, 0.7738617, -0.9022685, 1, 1, 1, 1, 1,
-0.3810419, 0.5882284, -0.7377861, 1, 1, 1, 1, 1,
-0.3767526, -0.1318663, -2.231567, 1, 1, 1, 1, 1,
-0.3762392, -0.5268816, -1.729664, 1, 1, 1, 1, 1,
-0.3720511, -1.816619, -4.2509, 0, 0, 1, 1, 1,
-0.3716701, -1.529045, -2.231208, 1, 0, 0, 1, 1,
-0.3708654, 0.4702949, 0.0023952, 1, 0, 0, 1, 1,
-0.3702474, -1.894354, -3.232201, 1, 0, 0, 1, 1,
-0.368699, 1.14017, -1.352695, 1, 0, 0, 1, 1,
-0.3620986, 0.9270542, -0.8791902, 1, 0, 0, 1, 1,
-0.3610965, 0.1135192, -1.690209, 0, 0, 0, 1, 1,
-0.3608962, -0.3715759, -1.182878, 0, 0, 0, 1, 1,
-0.3608167, -0.2674471, -3.299407, 0, 0, 0, 1, 1,
-0.3604492, -1.664595, -2.633977, 0, 0, 0, 1, 1,
-0.3603567, -0.2880436, -2.766672, 0, 0, 0, 1, 1,
-0.3598144, 0.2610824, -0.7696348, 0, 0, 0, 1, 1,
-0.3578368, 0.5544723, -1.014836, 0, 0, 0, 1, 1,
-0.3543899, 0.3086047, -1.376563, 1, 1, 1, 1, 1,
-0.3536257, 1.046264, -1.367248, 1, 1, 1, 1, 1,
-0.3528899, -1.489657, -3.960134, 1, 1, 1, 1, 1,
-0.3505447, 0.9363239, -0.5542915, 1, 1, 1, 1, 1,
-0.3457325, -0.2492131, -1.575858, 1, 1, 1, 1, 1,
-0.3455003, -0.2415028, -2.8629, 1, 1, 1, 1, 1,
-0.3409738, -0.1051225, -1.608676, 1, 1, 1, 1, 1,
-0.3388363, 0.3858833, -0.4854203, 1, 1, 1, 1, 1,
-0.3374529, 1.678214, 0.2150447, 1, 1, 1, 1, 1,
-0.3367434, 0.634059, 1.346533, 1, 1, 1, 1, 1,
-0.3284688, 1.003003, 0.2847396, 1, 1, 1, 1, 1,
-0.325942, 0.2256163, 0.08473348, 1, 1, 1, 1, 1,
-0.3258657, -0.3688963, -5.248427, 1, 1, 1, 1, 1,
-0.3257959, 0.07656068, -0.1860383, 1, 1, 1, 1, 1,
-0.3252899, -1.511701, -1.931595, 1, 1, 1, 1, 1,
-0.3211258, -1.898581, -1.373485, 0, 0, 1, 1, 1,
-0.3189197, -0.7496082, -2.556539, 1, 0, 0, 1, 1,
-0.3143524, 0.3072855, -0.2244015, 1, 0, 0, 1, 1,
-0.3128271, -0.1759365, -4.351874, 1, 0, 0, 1, 1,
-0.3126346, 0.2691119, 0.6376097, 1, 0, 0, 1, 1,
-0.3106937, 0.6874777, 0.5732633, 1, 0, 0, 1, 1,
-0.3064763, 0.1945115, -1.154637, 0, 0, 0, 1, 1,
-0.3051499, 1.905919, 0.6888317, 0, 0, 0, 1, 1,
-0.2997571, -1.642294, -2.717322, 0, 0, 0, 1, 1,
-0.2972167, 0.7022639, 2.484019, 0, 0, 0, 1, 1,
-0.2951615, 1.626453, -0.5196449, 0, 0, 0, 1, 1,
-0.2927518, 0.9060903, -1.401292, 0, 0, 0, 1, 1,
-0.2903262, -0.8347659, -3.723683, 0, 0, 0, 1, 1,
-0.2890669, -0.711036, -2.131561, 1, 1, 1, 1, 1,
-0.2782482, -0.06950767, -1.775174, 1, 1, 1, 1, 1,
-0.2779133, -0.2947189, -2.06082, 1, 1, 1, 1, 1,
-0.276393, 0.2090625, -2.297427, 1, 1, 1, 1, 1,
-0.2751553, -0.5027925, -5.269418, 1, 1, 1, 1, 1,
-0.273946, -1.500673, -2.898494, 1, 1, 1, 1, 1,
-0.2713909, 0.3808548, 1.700834, 1, 1, 1, 1, 1,
-0.2631351, 0.6576578, -2.50121, 1, 1, 1, 1, 1,
-0.2624997, 0.8728091, 0.409898, 1, 1, 1, 1, 1,
-0.259592, -0.6308096, -5.125704, 1, 1, 1, 1, 1,
-0.2595354, 0.03253131, -0.7338423, 1, 1, 1, 1, 1,
-0.2578939, 0.2588925, 0.3727028, 1, 1, 1, 1, 1,
-0.2545942, -0.2583606, -1.281936, 1, 1, 1, 1, 1,
-0.254494, -0.2576787, -4.026305, 1, 1, 1, 1, 1,
-0.2525463, 1.08381, 0.02740268, 1, 1, 1, 1, 1,
-0.2495722, 0.3274852, 0.09692936, 0, 0, 1, 1, 1,
-0.2456836, -0.3765064, -1.736743, 1, 0, 0, 1, 1,
-0.2404696, -0.4047464, -2.798347, 1, 0, 0, 1, 1,
-0.2402745, 0.390037, -1.267378, 1, 0, 0, 1, 1,
-0.2381977, -0.06694035, -1.800021, 1, 0, 0, 1, 1,
-0.238186, -0.7374526, -2.821779, 1, 0, 0, 1, 1,
-0.237259, -0.5490346, -4.907565, 0, 0, 0, 1, 1,
-0.2364611, -0.1305918, -3.100775, 0, 0, 0, 1, 1,
-0.234383, -1.883689, -2.241815, 0, 0, 0, 1, 1,
-0.2260423, 1.561735, -0.6843254, 0, 0, 0, 1, 1,
-0.2173777, -0.5744245, -3.984615, 0, 0, 0, 1, 1,
-0.2160985, 0.7513762, -0.005340869, 0, 0, 0, 1, 1,
-0.2126001, 0.4337646, -0.537123, 0, 0, 0, 1, 1,
-0.2076061, 0.1207421, -0.643257, 1, 1, 1, 1, 1,
-0.2070092, 1.115964, -0.1265453, 1, 1, 1, 1, 1,
-0.2060743, 0.06485455, -1.586597, 1, 1, 1, 1, 1,
-0.203861, -0.5100703, -2.734499, 1, 1, 1, 1, 1,
-0.2018955, -0.7629298, -3.198375, 1, 1, 1, 1, 1,
-0.2003115, 3.074554, 1.084039, 1, 1, 1, 1, 1,
-0.1964293, -0.5428455, -1.800264, 1, 1, 1, 1, 1,
-0.1948781, -0.8205069, -5.083354, 1, 1, 1, 1, 1,
-0.1913231, -1.7695, -2.496043, 1, 1, 1, 1, 1,
-0.1853202, -0.3605665, -2.770401, 1, 1, 1, 1, 1,
-0.1771308, -0.2598998, -2.324048, 1, 1, 1, 1, 1,
-0.1751947, -0.7734241, -4.203861, 1, 1, 1, 1, 1,
-0.173139, -1.344125, -2.913449, 1, 1, 1, 1, 1,
-0.1724263, -0.5713276, -2.96055, 1, 1, 1, 1, 1,
-0.1715905, 1.738799, -0.7459238, 1, 1, 1, 1, 1,
-0.1694187, 0.5785449, 0.3410253, 0, 0, 1, 1, 1,
-0.1654118, 0.9260048, -0.7709053, 1, 0, 0, 1, 1,
-0.1606611, -0.9262106, -3.205123, 1, 0, 0, 1, 1,
-0.1582497, 1.302726, 0.6276191, 1, 0, 0, 1, 1,
-0.1534062, 1.012366, 0.5823328, 1, 0, 0, 1, 1,
-0.1531423, 0.4017545, -1.055692, 1, 0, 0, 1, 1,
-0.1528858, 0.5271988, -0.9346692, 0, 0, 0, 1, 1,
-0.1517862, -0.1669937, -2.198704, 0, 0, 0, 1, 1,
-0.1500131, -0.6724287, -3.852655, 0, 0, 0, 1, 1,
-0.1494357, -1.197849, -2.338153, 0, 0, 0, 1, 1,
-0.1492397, -1.106822, -3.835087, 0, 0, 0, 1, 1,
-0.1456307, 0.656969, 0.7497647, 0, 0, 0, 1, 1,
-0.1437709, -1.161482, -3.963308, 0, 0, 0, 1, 1,
-0.1410924, 0.1947163, -0.3153703, 1, 1, 1, 1, 1,
-0.1385789, -1.754905, -2.829032, 1, 1, 1, 1, 1,
-0.1381677, 0.3233948, -0.59931, 1, 1, 1, 1, 1,
-0.1370062, -0.6110312, -3.151168, 1, 1, 1, 1, 1,
-0.1364983, 0.6451417, -0.2824677, 1, 1, 1, 1, 1,
-0.1331184, -0.3799753, -0.6832597, 1, 1, 1, 1, 1,
-0.1328412, 0.8550095, -1.102373, 1, 1, 1, 1, 1,
-0.1318756, 0.3090659, -0.1754772, 1, 1, 1, 1, 1,
-0.131737, 1.106881, 0.3052039, 1, 1, 1, 1, 1,
-0.1310601, -0.03334169, -3.26596, 1, 1, 1, 1, 1,
-0.1230811, 0.7984298, 0.2706488, 1, 1, 1, 1, 1,
-0.1199131, -0.9489836, -2.651157, 1, 1, 1, 1, 1,
-0.1190565, 1.049659, 0.4252669, 1, 1, 1, 1, 1,
-0.1179187, 0.6186472, 0.6314687, 1, 1, 1, 1, 1,
-0.1177669, 1.044466, -1.310328, 1, 1, 1, 1, 1,
-0.1121504, 0.1056296, 0.2319883, 0, 0, 1, 1, 1,
-0.1057416, 0.5028823, 0.933286, 1, 0, 0, 1, 1,
-0.1056106, -0.9816954, -0.9908926, 1, 0, 0, 1, 1,
-0.1054334, -1.095627, -3.645556, 1, 0, 0, 1, 1,
-0.1046368, 0.1472237, -0.3407506, 1, 0, 0, 1, 1,
-0.1042195, 1.155054, 0.9217846, 1, 0, 0, 1, 1,
-0.09921431, -2.030681, -1.939981, 0, 0, 0, 1, 1,
-0.09758915, -1.714346, -4.621906, 0, 0, 0, 1, 1,
-0.09600346, -0.413521, -2.801237, 0, 0, 0, 1, 1,
-0.09195852, -1.429252, -3.372825, 0, 0, 0, 1, 1,
-0.09138955, -0.8971266, -2.181975, 0, 0, 0, 1, 1,
-0.09054109, -0.3503042, -2.621531, 0, 0, 0, 1, 1,
-0.08942538, -0.3824965, -0.1544488, 0, 0, 0, 1, 1,
-0.08933266, -0.1079874, -2.707366, 1, 1, 1, 1, 1,
-0.08898757, -0.3744372, -4.017582, 1, 1, 1, 1, 1,
-0.08861328, 0.923676, -0.6046599, 1, 1, 1, 1, 1,
-0.0865921, 2.045792, -1.334428, 1, 1, 1, 1, 1,
-0.08634285, 0.2083037, -0.781512, 1, 1, 1, 1, 1,
-0.08349816, -1.539648, -1.90679, 1, 1, 1, 1, 1,
-0.08156285, -0.3592247, -3.887713, 1, 1, 1, 1, 1,
-0.08056891, -0.6128213, -3.322393, 1, 1, 1, 1, 1,
-0.07875356, -0.544975, -3.118543, 1, 1, 1, 1, 1,
-0.07639485, -1.271193, -4.683696, 1, 1, 1, 1, 1,
-0.07566421, -1.194853, -5.344172, 1, 1, 1, 1, 1,
-0.07490072, -1.330999, -4.656904, 1, 1, 1, 1, 1,
-0.07397448, -1.397451, -4.775275, 1, 1, 1, 1, 1,
-0.07074395, -0.1509908, -0.8829134, 1, 1, 1, 1, 1,
-0.07006595, -1.163846, -2.495526, 1, 1, 1, 1, 1,
-0.06861193, 0.6385284, 1.042833, 0, 0, 1, 1, 1,
-0.06791979, 1.499224, 2.29138, 1, 0, 0, 1, 1,
-0.06527565, -0.02286847, -1.751218, 1, 0, 0, 1, 1,
-0.06366837, 0.9660369, -0.1756761, 1, 0, 0, 1, 1,
-0.06349459, -0.609098, -2.059197, 1, 0, 0, 1, 1,
-0.06102096, -0.7491419, -2.372227, 1, 0, 0, 1, 1,
-0.05614875, -2.453267, -2.894659, 0, 0, 0, 1, 1,
-0.05530247, 0.4877503, 0.3385712, 0, 0, 0, 1, 1,
-0.05302487, -0.832383, -3.159636, 0, 0, 0, 1, 1,
-0.05265354, -0.932865, -2.63717, 0, 0, 0, 1, 1,
-0.04992374, -0.6705818, -4.126471, 0, 0, 0, 1, 1,
-0.04086259, 0.1322541, 0.04695952, 0, 0, 0, 1, 1,
-0.03823839, -1.448247, -2.6787, 0, 0, 0, 1, 1,
-0.03696191, 0.6117186, 0.2475606, 1, 1, 1, 1, 1,
-0.03571308, -0.06170909, -3.087824, 1, 1, 1, 1, 1,
-0.03193699, -0.2479549, -1.40546, 1, 1, 1, 1, 1,
-0.02835148, 0.6653817, 0.382803, 1, 1, 1, 1, 1,
-0.01717518, 0.4106557, 0.1247782, 1, 1, 1, 1, 1,
-0.0126477, 0.5471591, -1.056259, 1, 1, 1, 1, 1,
-0.01235022, -0.8062494, -3.431844, 1, 1, 1, 1, 1,
-0.01211641, -1.026175, -3.762426, 1, 1, 1, 1, 1,
-0.01022734, -0.8051332, -4.738224, 1, 1, 1, 1, 1,
-0.009716735, -1.561796, -2.343063, 1, 1, 1, 1, 1,
-0.008781172, 0.2352792, 0.5997221, 1, 1, 1, 1, 1,
-0.008140626, 0.7712169, -0.1801053, 1, 1, 1, 1, 1,
-0.003888518, -1.693439, -2.447069, 1, 1, 1, 1, 1,
-0.002795423, -0.02888545, -1.739529, 1, 1, 1, 1, 1,
0.001788563, 0.2585065, 0.2416855, 1, 1, 1, 1, 1,
0.004150341, -0.3525843, 3.892501, 0, 0, 1, 1, 1,
0.007231975, -0.1374074, 2.785469, 1, 0, 0, 1, 1,
0.007363024, 0.539409, 0.5046049, 1, 0, 0, 1, 1,
0.01364546, -0.1686209, 2.208673, 1, 0, 0, 1, 1,
0.01444054, -0.04909975, 2.501415, 1, 0, 0, 1, 1,
0.02322727, 0.3221462, 1.106766, 1, 0, 0, 1, 1,
0.02373468, -0.4372775, 3.554281, 0, 0, 0, 1, 1,
0.0263289, 0.790413, 0.5920665, 0, 0, 0, 1, 1,
0.030621, -0.4301232, 2.643541, 0, 0, 0, 1, 1,
0.03310318, -0.02684909, 0.7650225, 0, 0, 0, 1, 1,
0.03328449, 0.2796316, 1.335758, 0, 0, 0, 1, 1,
0.03833658, -0.3827436, 0.2723117, 0, 0, 0, 1, 1,
0.03853258, 1.019411, 1.567158, 0, 0, 0, 1, 1,
0.03930947, 1.560107, 2.234125, 1, 1, 1, 1, 1,
0.0431379, -0.1800334, 2.797201, 1, 1, 1, 1, 1,
0.04484925, 0.6159866, 1.893819, 1, 1, 1, 1, 1,
0.05131534, 0.3338902, -0.9186521, 1, 1, 1, 1, 1,
0.05214711, 0.6988755, 0.1743586, 1, 1, 1, 1, 1,
0.06199943, -0.8302653, 3.950144, 1, 1, 1, 1, 1,
0.06489256, 2.436719, 0.3334181, 1, 1, 1, 1, 1,
0.0653824, -0.6066712, 0.9016196, 1, 1, 1, 1, 1,
0.07400284, 1.727575, 0.1127727, 1, 1, 1, 1, 1,
0.07861543, -0.4556277, 3.399716, 1, 1, 1, 1, 1,
0.07887507, 0.6540747, 2.173275, 1, 1, 1, 1, 1,
0.07914934, 0.7010367, 1.994384, 1, 1, 1, 1, 1,
0.08176801, -0.7452007, 2.984515, 1, 1, 1, 1, 1,
0.08356234, 0.603295, -0.1212754, 1, 1, 1, 1, 1,
0.08436549, 1.413925, 1.617404, 1, 1, 1, 1, 1,
0.08599725, 0.183572, -0.4198429, 0, 0, 1, 1, 1,
0.08732248, 0.1793552, 1.780769, 1, 0, 0, 1, 1,
0.08896237, 1.552633, -0.6489437, 1, 0, 0, 1, 1,
0.09084496, 0.06314913, 1.809992, 1, 0, 0, 1, 1,
0.09296712, 0.1287119, 0.2888743, 1, 0, 0, 1, 1,
0.09487483, -0.3322272, 3.618712, 1, 0, 0, 1, 1,
0.09813886, 0.3646553, 0.02482158, 0, 0, 0, 1, 1,
0.09845323, -3.111555, 2.629349, 0, 0, 0, 1, 1,
0.1012817, -1.55351, 2.046779, 0, 0, 0, 1, 1,
0.1016812, -0.3589455, 2.75154, 0, 0, 0, 1, 1,
0.1049178, 2.524008, -1.478923, 0, 0, 0, 1, 1,
0.1072263, -0.2690617, 4.366635, 0, 0, 0, 1, 1,
0.1098586, 1.831796, -1.014856, 0, 0, 0, 1, 1,
0.1183496, 0.06861863, 1.816054, 1, 1, 1, 1, 1,
0.1190356, 0.4947437, -0.02716999, 1, 1, 1, 1, 1,
0.1193725, 1.00678, 1.884595, 1, 1, 1, 1, 1,
0.1246507, 0.5211558, 1.948246, 1, 1, 1, 1, 1,
0.1255592, 0.16395, 2.382318, 1, 1, 1, 1, 1,
0.1271108, 0.2473731, 0.9656412, 1, 1, 1, 1, 1,
0.1281616, 0.6464286, -0.6384394, 1, 1, 1, 1, 1,
0.1287047, 0.2953514, -1.154855, 1, 1, 1, 1, 1,
0.1310247, 1.102777, 0.4742512, 1, 1, 1, 1, 1,
0.1371436, -1.295014, 4.081286, 1, 1, 1, 1, 1,
0.1400743, 0.8479692, -1.228581, 1, 1, 1, 1, 1,
0.1451678, -0.2097107, 3.453712, 1, 1, 1, 1, 1,
0.147193, -1.615826, 3.555579, 1, 1, 1, 1, 1,
0.1519104, -1.228555, 3.035919, 1, 1, 1, 1, 1,
0.1593366, -0.6444178, 4.030985, 1, 1, 1, 1, 1,
0.1608707, -0.8297935, 4.086689, 0, 0, 1, 1, 1,
0.1617774, -0.2649162, 3.169127, 1, 0, 0, 1, 1,
0.1643837, -0.8397593, 2.548734, 1, 0, 0, 1, 1,
0.1651611, -0.6837722, 4.293407, 1, 0, 0, 1, 1,
0.1664707, 0.7015924, 0.8238397, 1, 0, 0, 1, 1,
0.1681891, -0.05211642, 0.3600032, 1, 0, 0, 1, 1,
0.1682528, -0.003429479, 2.814632, 0, 0, 0, 1, 1,
0.1688243, -1.076087, 2.492965, 0, 0, 0, 1, 1,
0.1703615, -1.387922, 2.154442, 0, 0, 0, 1, 1,
0.1722586, -0.3811423, 2.262288, 0, 0, 0, 1, 1,
0.1746386, -0.5172192, 2.062333, 0, 0, 0, 1, 1,
0.1758257, -0.4385031, 3.623021, 0, 0, 0, 1, 1,
0.1771255, -1.309699, 3.286415, 0, 0, 0, 1, 1,
0.1778227, 0.02229728, 0.1720754, 1, 1, 1, 1, 1,
0.1800079, -0.715238, 2.694228, 1, 1, 1, 1, 1,
0.181376, -0.529737, 2.756437, 1, 1, 1, 1, 1,
0.1821577, -1.01664, 2.179115, 1, 1, 1, 1, 1,
0.1832884, -1.099934, 4.279156, 1, 1, 1, 1, 1,
0.1838479, 0.328026, 3.155653, 1, 1, 1, 1, 1,
0.185868, -0.937725, 2.414256, 1, 1, 1, 1, 1,
0.1869993, 0.2846628, 2.373179, 1, 1, 1, 1, 1,
0.1891416, -0.5566369, 1.389766, 1, 1, 1, 1, 1,
0.1892676, -0.5222283, 1.612499, 1, 1, 1, 1, 1,
0.1927779, -1.749395, 3.79926, 1, 1, 1, 1, 1,
0.1931813, 2.876144, -0.4581521, 1, 1, 1, 1, 1,
0.1935171, -0.4214021, 2.808116, 1, 1, 1, 1, 1,
0.1949137, -0.8698227, 3.50494, 1, 1, 1, 1, 1,
0.1989258, -0.9935504, 3.904832, 1, 1, 1, 1, 1,
0.2048687, 0.778452, -0.7207814, 0, 0, 1, 1, 1,
0.2102247, 0.8470888, -1.065045, 1, 0, 0, 1, 1,
0.211296, 1.363446, -0.2494698, 1, 0, 0, 1, 1,
0.2122317, 0.3151025, 2.374202, 1, 0, 0, 1, 1,
0.2143501, 0.09061179, 0.686018, 1, 0, 0, 1, 1,
0.2143697, -0.7775099, 3.091244, 1, 0, 0, 1, 1,
0.2217453, -0.2898985, 3.169343, 0, 0, 0, 1, 1,
0.2231573, 1.113108, 0.2055238, 0, 0, 0, 1, 1,
0.2238929, -1.954888, 3.980028, 0, 0, 0, 1, 1,
0.2254002, 1.170542, -0.815404, 0, 0, 0, 1, 1,
0.2268047, 0.06412026, 0.6118735, 0, 0, 0, 1, 1,
0.2283692, -0.3287964, 2.335881, 0, 0, 0, 1, 1,
0.2316703, 1.114798, 0.2372074, 0, 0, 0, 1, 1,
0.2334665, 0.455635, -0.9099286, 1, 1, 1, 1, 1,
0.2335117, -1.808043, 2.990224, 1, 1, 1, 1, 1,
0.234312, 2.050815, 1.729465, 1, 1, 1, 1, 1,
0.2349183, 1.956374, 0.1568424, 1, 1, 1, 1, 1,
0.240195, -1.775867, 3.214069, 1, 1, 1, 1, 1,
0.2412185, -1.38319, 4.066282, 1, 1, 1, 1, 1,
0.2451242, -0.3353405, 4.368093, 1, 1, 1, 1, 1,
0.2495514, 1.156778, -0.2982575, 1, 1, 1, 1, 1,
0.2521843, -0.847029, 4.014842, 1, 1, 1, 1, 1,
0.2529697, -0.5976709, 1.968879, 1, 1, 1, 1, 1,
0.2542537, 0.3928276, -0.3733378, 1, 1, 1, 1, 1,
0.2564763, 1.255875, -0.1339963, 1, 1, 1, 1, 1,
0.2600234, -0.5374217, 1.665018, 1, 1, 1, 1, 1,
0.2645488, -0.7819328, 1.071253, 1, 1, 1, 1, 1,
0.264695, -1.835464, 0.6305775, 1, 1, 1, 1, 1,
0.2712301, -2.050395, 2.477083, 0, 0, 1, 1, 1,
0.2715871, 1.679574, -0.2284112, 1, 0, 0, 1, 1,
0.2768872, 0.3680199, 1.569247, 1, 0, 0, 1, 1,
0.2804087, 0.5147845, 2.374185, 1, 0, 0, 1, 1,
0.2809364, -2.108931, 3.393047, 1, 0, 0, 1, 1,
0.2848938, -0.2773168, 3.328707, 1, 0, 0, 1, 1,
0.2905287, -1.599058, 2.774956, 0, 0, 0, 1, 1,
0.2947026, 0.3107286, 0.680443, 0, 0, 0, 1, 1,
0.2958641, 1.193476, 0.8637514, 0, 0, 0, 1, 1,
0.3009579, -0.6389681, 3.425975, 0, 0, 0, 1, 1,
0.3024802, 1.157939, -1.087071, 0, 0, 0, 1, 1,
0.3134152, -0.1291985, 2.180488, 0, 0, 0, 1, 1,
0.3134198, -0.9090314, 4.162934, 0, 0, 0, 1, 1,
0.3154344, -0.3029398, 3.19318, 1, 1, 1, 1, 1,
0.3213988, 0.5114649, 0.05885261, 1, 1, 1, 1, 1,
0.3223484, -1.615928, 4.237866, 1, 1, 1, 1, 1,
0.3255022, -0.5884784, 3.625375, 1, 1, 1, 1, 1,
0.3258648, 0.6417364, 1.646497, 1, 1, 1, 1, 1,
0.3260042, 0.8843756, -0.3477755, 1, 1, 1, 1, 1,
0.3263182, 0.5046692, 0.2634839, 1, 1, 1, 1, 1,
0.3295632, -0.4623062, 0.9221364, 1, 1, 1, 1, 1,
0.3314601, 1.808166, 0.126843, 1, 1, 1, 1, 1,
0.3319241, -0.3160092, 1.485164, 1, 1, 1, 1, 1,
0.336744, -0.2138158, 2.824158, 1, 1, 1, 1, 1,
0.3374959, -0.8884157, 3.412277, 1, 1, 1, 1, 1,
0.3378582, -1.904867, 4.115616, 1, 1, 1, 1, 1,
0.3380816, -0.4729241, 3.244589, 1, 1, 1, 1, 1,
0.3395258, 1.414267, 1.322461, 1, 1, 1, 1, 1,
0.350287, -0.6581051, 2.441277, 0, 0, 1, 1, 1,
0.3512192, -1.15335, 3.442978, 1, 0, 0, 1, 1,
0.3525087, -1.07661, 1.553451, 1, 0, 0, 1, 1,
0.3531748, -0.1988635, 0.01274305, 1, 0, 0, 1, 1,
0.35329, -2.219569, 2.337018, 1, 0, 0, 1, 1,
0.3572778, -1.333146, 1.998572, 1, 0, 0, 1, 1,
0.3579531, 0.7254906, -1.389221, 0, 0, 0, 1, 1,
0.3593894, -2.79566, 2.561729, 0, 0, 0, 1, 1,
0.3622693, -0.09604767, 2.600087, 0, 0, 0, 1, 1,
0.3648496, -0.6283151, 3.839714, 0, 0, 0, 1, 1,
0.3687267, -1.20129, 2.941784, 0, 0, 0, 1, 1,
0.3688773, -1.308783, 1.619486, 0, 0, 0, 1, 1,
0.3708911, -0.8096873, 2.457925, 0, 0, 0, 1, 1,
0.3722263, -0.8762979, 0.8481367, 1, 1, 1, 1, 1,
0.3760121, -0.4286888, 3.896575, 1, 1, 1, 1, 1,
0.3763133, 0.984028, 0.1876173, 1, 1, 1, 1, 1,
0.3811661, 0.4983703, 0.7703986, 1, 1, 1, 1, 1,
0.3840939, 0.3380785, 0.2138043, 1, 1, 1, 1, 1,
0.3873793, -1.043728, 3.777699, 1, 1, 1, 1, 1,
0.3898158, 0.5862815, 0.1119845, 1, 1, 1, 1, 1,
0.3950196, 0.4439298, 0.8549612, 1, 1, 1, 1, 1,
0.3996956, -0.5235298, 3.33325, 1, 1, 1, 1, 1,
0.40779, 0.4554508, 1.514236, 1, 1, 1, 1, 1,
0.4078172, 0.6898029, -0.2636301, 1, 1, 1, 1, 1,
0.4099578, 0.3870154, -1.615299, 1, 1, 1, 1, 1,
0.4118171, 0.4287304, 1.504296, 1, 1, 1, 1, 1,
0.412308, -0.2411598, 0.6755784, 1, 1, 1, 1, 1,
0.4210482, 0.8975866, -1.432571, 1, 1, 1, 1, 1,
0.4219398, -0.4778311, 2.590374, 0, 0, 1, 1, 1,
0.4270297, -0.5013382, 1.640537, 1, 0, 0, 1, 1,
0.4275563, -1.443398, 2.825095, 1, 0, 0, 1, 1,
0.4290546, -0.4951077, 3.183808, 1, 0, 0, 1, 1,
0.4324458, 1.16898, 1.173549, 1, 0, 0, 1, 1,
0.43398, 1.558794, -0.7939728, 1, 0, 0, 1, 1,
0.4354399, -1.261085, 2.40571, 0, 0, 0, 1, 1,
0.4369128, 0.5693368, 0.7576343, 0, 0, 0, 1, 1,
0.4416902, 0.3411335, 0.4174476, 0, 0, 0, 1, 1,
0.4463913, 1.08969, 0.7980077, 0, 0, 0, 1, 1,
0.4497703, -0.6952598, 3.584109, 0, 0, 0, 1, 1,
0.4502275, -0.7849726, 3.117749, 0, 0, 0, 1, 1,
0.4522174, 0.8181931, 1.22195, 0, 0, 0, 1, 1,
0.4584191, 0.1340975, 2.190174, 1, 1, 1, 1, 1,
0.4680353, -0.684818, 1.95576, 1, 1, 1, 1, 1,
0.4687984, 0.6036769, -0.09039561, 1, 1, 1, 1, 1,
0.4695644, -0.7548699, 3.446708, 1, 1, 1, 1, 1,
0.4746316, -0.175733, 2.018068, 1, 1, 1, 1, 1,
0.477241, -0.1528853, 2.184365, 1, 1, 1, 1, 1,
0.4791822, -0.8652496, 4.088857, 1, 1, 1, 1, 1,
0.4811595, -0.253833, 1.815486, 1, 1, 1, 1, 1,
0.4846363, 0.9750073, 3.022555, 1, 1, 1, 1, 1,
0.4886757, -0.4838337, 2.311896, 1, 1, 1, 1, 1,
0.4903533, -0.604583, 2.091769, 1, 1, 1, 1, 1,
0.4931926, -0.9132007, 3.537179, 1, 1, 1, 1, 1,
0.4949557, 1.329591, 1.402593, 1, 1, 1, 1, 1,
0.495869, -0.3972712, 3.815715, 1, 1, 1, 1, 1,
0.5018091, -0.7278996, 0.5132769, 1, 1, 1, 1, 1,
0.5038221, -1.332141, 3.460223, 0, 0, 1, 1, 1,
0.5076586, 0.5895309, 0.7839912, 1, 0, 0, 1, 1,
0.5085659, -1.378053, 1.806357, 1, 0, 0, 1, 1,
0.5137256, -0.06728704, 0.2705993, 1, 0, 0, 1, 1,
0.5168403, -0.2854781, 2.292759, 1, 0, 0, 1, 1,
0.516961, 0.5026286, 1.967226, 1, 0, 0, 1, 1,
0.5260634, 0.2071363, 0.2028048, 0, 0, 0, 1, 1,
0.528897, -2.039937, 1.624758, 0, 0, 0, 1, 1,
0.5291227, 0.9830607, 0.4602281, 0, 0, 0, 1, 1,
0.5365812, 0.5954385, 0.9702879, 0, 0, 0, 1, 1,
0.5421289, -0.2849833, 2.688432, 0, 0, 0, 1, 1,
0.5467315, 0.3471266, -0.1042027, 0, 0, 0, 1, 1,
0.5483797, 0.5007889, 1.566169, 0, 0, 0, 1, 1,
0.5511634, 0.8437551, 2.274317, 1, 1, 1, 1, 1,
0.5597611, 0.2459677, 2.050169, 1, 1, 1, 1, 1,
0.5621001, 1.155645, 0.06589211, 1, 1, 1, 1, 1,
0.5659099, -0.722444, 3.986872, 1, 1, 1, 1, 1,
0.5668598, 0.00269308, 1.269322, 1, 1, 1, 1, 1,
0.5688089, 2.225928, 0.143845, 1, 1, 1, 1, 1,
0.5703675, 0.3912977, -0.3861609, 1, 1, 1, 1, 1,
0.5708201, 0.4122462, 0.9153803, 1, 1, 1, 1, 1,
0.5848622, -0.07382526, 1.800847, 1, 1, 1, 1, 1,
0.5859512, 0.3305033, 0.4430216, 1, 1, 1, 1, 1,
0.5871961, 0.008362997, 1.846835, 1, 1, 1, 1, 1,
0.5965564, 0.3541229, 1.518622, 1, 1, 1, 1, 1,
0.5971338, -0.1812933, 3.314503, 1, 1, 1, 1, 1,
0.597763, -0.0478918, 0.6565945, 1, 1, 1, 1, 1,
0.5988452, 1.512943, 2.799775, 1, 1, 1, 1, 1,
0.6032619, 0.469391, 1.74857, 0, 0, 1, 1, 1,
0.6124309, -0.4470814, 2.644738, 1, 0, 0, 1, 1,
0.6157588, 1.033154, -0.1497664, 1, 0, 0, 1, 1,
0.615775, -0.5804119, 2.412542, 1, 0, 0, 1, 1,
0.6222319, -0.3932516, 1.461564, 1, 0, 0, 1, 1,
0.6227545, 0.2344119, 1.144664, 1, 0, 0, 1, 1,
0.6325139, -0.5907323, 1.174373, 0, 0, 0, 1, 1,
0.6334304, -0.0262968, 1.780316, 0, 0, 0, 1, 1,
0.6446286, 0.5164908, 2.757174, 0, 0, 0, 1, 1,
0.644717, 0.2762041, 1.148867, 0, 0, 0, 1, 1,
0.6500998, 1.312527, -1.079292, 0, 0, 0, 1, 1,
0.6608386, 0.9352672, 1.366636, 0, 0, 0, 1, 1,
0.6636279, -0.3463358, 2.23614, 0, 0, 0, 1, 1,
0.6680043, -0.477174, 2.255061, 1, 1, 1, 1, 1,
0.6681608, -2.552923, 0.1487413, 1, 1, 1, 1, 1,
0.6790251, -0.3557654, 0.6622981, 1, 1, 1, 1, 1,
0.6884401, 1.159569, 1.535394, 1, 1, 1, 1, 1,
0.6889136, -2.011346, 2.485412, 1, 1, 1, 1, 1,
0.6972513, 0.353344, 3.26311, 1, 1, 1, 1, 1,
0.7061705, -1.048721, 3.327069, 1, 1, 1, 1, 1,
0.7131359, -1.479935, 3.181304, 1, 1, 1, 1, 1,
0.7179376, 0.04420853, 0.8431411, 1, 1, 1, 1, 1,
0.7213928, -0.570274, 0.4973146, 1, 1, 1, 1, 1,
0.7221006, 0.579886, 1.742409, 1, 1, 1, 1, 1,
0.7248129, 0.1834831, 1.455518, 1, 1, 1, 1, 1,
0.7270674, 2.612248, 0.182031, 1, 1, 1, 1, 1,
0.7315654, 0.8951477, 0.3721489, 1, 1, 1, 1, 1,
0.7384987, -0.6355872, 2.248067, 1, 1, 1, 1, 1,
0.7424541, -0.2106432, 0.753302, 0, 0, 1, 1, 1,
0.7466738, -0.8854259, 3.819108, 1, 0, 0, 1, 1,
0.7500054, 0.8825646, 1.428775, 1, 0, 0, 1, 1,
0.7621796, -1.625224, 3.217462, 1, 0, 0, 1, 1,
0.7628071, 0.1784353, 1.56357, 1, 0, 0, 1, 1,
0.7645987, 0.1371859, -0.289089, 1, 0, 0, 1, 1,
0.7657471, 1.678083, -0.5162544, 0, 0, 0, 1, 1,
0.7850487, 1.249174, 2.231854, 0, 0, 0, 1, 1,
0.7858983, -0.799461, 2.088996, 0, 0, 0, 1, 1,
0.7878073, -2.461728, 2.18297, 0, 0, 0, 1, 1,
0.7878799, 0.2910323, 1.939948, 0, 0, 0, 1, 1,
0.8017802, -0.6289383, 3.032598, 0, 0, 0, 1, 1,
0.8044396, -0.1642248, 1.582512, 0, 0, 0, 1, 1,
0.8079827, 0.1422587, 0.8753149, 1, 1, 1, 1, 1,
0.8123427, -0.9001534, 1.867457, 1, 1, 1, 1, 1,
0.820136, -0.1591874, 2.694145, 1, 1, 1, 1, 1,
0.8233698, -0.1136575, 0.755631, 1, 1, 1, 1, 1,
0.824866, -2.232455, 3.479496, 1, 1, 1, 1, 1,
0.8333456, -0.1924627, 2.182185, 1, 1, 1, 1, 1,
0.8362061, -0.2999489, 1.837323, 1, 1, 1, 1, 1,
0.8382644, -0.03044751, 1.518458, 1, 1, 1, 1, 1,
0.8403155, 0.7302583, 0.4543588, 1, 1, 1, 1, 1,
0.8410873, -0.650089, 3.258778, 1, 1, 1, 1, 1,
0.841153, -0.4168952, 2.123561, 1, 1, 1, 1, 1,
0.84422, 0.2581216, 0.8038929, 1, 1, 1, 1, 1,
0.8488078, 1.114889, 0.2715653, 1, 1, 1, 1, 1,
0.8658078, 0.7501364, -1.097029, 1, 1, 1, 1, 1,
0.8699048, -0.6766157, 1.533667, 1, 1, 1, 1, 1,
0.8716652, -0.7916129, 3.504585, 0, 0, 1, 1, 1,
0.8718624, 0.9245658, 0.7354347, 1, 0, 0, 1, 1,
0.8770486, -1.177939, 1.578211, 1, 0, 0, 1, 1,
0.8797616, 0.2361161, 0.04801496, 1, 0, 0, 1, 1,
0.8825035, 0.6657808, 1.692727, 1, 0, 0, 1, 1,
0.8876277, -0.7967182, 0.6308695, 1, 0, 0, 1, 1,
0.8899579, -0.2836392, 2.42605, 0, 0, 0, 1, 1,
0.8912948, 0.05705665, 3.21233, 0, 0, 0, 1, 1,
0.892279, 0.5044337, 1.772468, 0, 0, 0, 1, 1,
0.8957002, -0.9132561, 2.043566, 0, 0, 0, 1, 1,
0.895874, 0.03899283, 0.9267121, 0, 0, 0, 1, 1,
0.8985435, -0.2909248, 3.125798, 0, 0, 0, 1, 1,
0.9017906, -0.1211882, 2.069108, 0, 0, 0, 1, 1,
0.902196, 0.5670924, 0.4315113, 1, 1, 1, 1, 1,
0.9023458, 1.078795, 0.5915228, 1, 1, 1, 1, 1,
0.9102494, -1.388245, 1.993472, 1, 1, 1, 1, 1,
0.9105341, 0.484491, 1.194597, 1, 1, 1, 1, 1,
0.9106818, -1.393195, 1.826433, 1, 1, 1, 1, 1,
0.9142174, 0.2316035, 1.383324, 1, 1, 1, 1, 1,
0.9144598, 1.744621, -0.1241151, 1, 1, 1, 1, 1,
0.9212061, 0.9749378, 0.4745669, 1, 1, 1, 1, 1,
0.9223742, -0.2295664, 3.088, 1, 1, 1, 1, 1,
0.9276678, -0.2168092, 2.518929, 1, 1, 1, 1, 1,
0.9354746, -1.155783, 2.149074, 1, 1, 1, 1, 1,
0.9379339, -0.8127397, 1.52902, 1, 1, 1, 1, 1,
0.9405798, -0.07307586, 3.324617, 1, 1, 1, 1, 1,
0.9501025, 1.21575, -0.1455901, 1, 1, 1, 1, 1,
0.9635623, 0.01985266, 1.403197, 1, 1, 1, 1, 1,
0.9648221, -1.699666, 3.156123, 0, 0, 1, 1, 1,
0.968621, -1.899281, 2.417066, 1, 0, 0, 1, 1,
0.9787294, 0.06492721, 0.627342, 1, 0, 0, 1, 1,
0.9802846, 0.1443914, 0.9444132, 1, 0, 0, 1, 1,
0.9825645, -1.704607, 1.484552, 1, 0, 0, 1, 1,
0.9862434, -0.3870737, 1.288594, 1, 0, 0, 1, 1,
0.9928905, -0.6905124, 2.702717, 0, 0, 0, 1, 1,
0.9957032, -1.35323, 1.321332, 0, 0, 0, 1, 1,
1.003178, 1.082003, 0.4219559, 0, 0, 0, 1, 1,
1.027184, 0.4521522, 0.7548419, 0, 0, 0, 1, 1,
1.039573, 0.0151729, -0.6621417, 0, 0, 0, 1, 1,
1.046285, -1.291538, 4.085889, 0, 0, 0, 1, 1,
1.048315, -0.2185727, 1.3189, 0, 0, 0, 1, 1,
1.051169, -0.2143045, 0.9852031, 1, 1, 1, 1, 1,
1.054065, -0.9037994, 1.239932, 1, 1, 1, 1, 1,
1.074033, -1.128162, 1.964527, 1, 1, 1, 1, 1,
1.07653, -0.2264604, 0.8393705, 1, 1, 1, 1, 1,
1.077946, -0.2914935, 1.382537, 1, 1, 1, 1, 1,
1.084413, -1.897995, 3.428337, 1, 1, 1, 1, 1,
1.091095, 1.100251, -0.1783895, 1, 1, 1, 1, 1,
1.094008, -1.186883, 0.777809, 1, 1, 1, 1, 1,
1.117847, 1.127241, 0.43167, 1, 1, 1, 1, 1,
1.120944, -0.8911685, 2.865572, 1, 1, 1, 1, 1,
1.124543, -0.3485671, 1.763405, 1, 1, 1, 1, 1,
1.12542, -0.2097791, 2.078887, 1, 1, 1, 1, 1,
1.126448, 1.303144, 1.144683, 1, 1, 1, 1, 1,
1.128529, 0.9749718, 1.673937, 1, 1, 1, 1, 1,
1.130185, -0.4232778, 0.8392947, 1, 1, 1, 1, 1,
1.132831, 0.2559387, 1.77657, 0, 0, 1, 1, 1,
1.142782, -1.250022, 2.595023, 1, 0, 0, 1, 1,
1.151336, 0.8954329, -0.5075225, 1, 0, 0, 1, 1,
1.153897, 0.1072087, 1.170157, 1, 0, 0, 1, 1,
1.154171, 1.257044, 0.107932, 1, 0, 0, 1, 1,
1.154996, -0.3575332, 2.881811, 1, 0, 0, 1, 1,
1.158897, 0.04149819, 1.773725, 0, 0, 0, 1, 1,
1.165927, 1.187715, 1.133726, 0, 0, 0, 1, 1,
1.184574, 1.159146, 1.049776, 0, 0, 0, 1, 1,
1.213273, -1.47838, 2.481875, 0, 0, 0, 1, 1,
1.228122, 0.6248155, 0.969858, 0, 0, 0, 1, 1,
1.229063, -0.8222372, 3.780434, 0, 0, 0, 1, 1,
1.23356, -0.2159791, 0.9036311, 0, 0, 0, 1, 1,
1.242579, 1.932582, 0.2467041, 1, 1, 1, 1, 1,
1.243735, -0.583293, 0.3938081, 1, 1, 1, 1, 1,
1.24525, 1.113266, 0.2725783, 1, 1, 1, 1, 1,
1.246682, 0.4412353, 1.570062, 1, 1, 1, 1, 1,
1.251569, -0.1408914, 3.602623, 1, 1, 1, 1, 1,
1.25745, -2.617186, 3.386626, 1, 1, 1, 1, 1,
1.25976, 0.3335126, 0.4853509, 1, 1, 1, 1, 1,
1.261976, -1.686911, 2.39951, 1, 1, 1, 1, 1,
1.277049, -1.448486, 2.592803, 1, 1, 1, 1, 1,
1.277815, -0.4161005, 3.439949, 1, 1, 1, 1, 1,
1.280403, 0.1503869, -0.05852225, 1, 1, 1, 1, 1,
1.282927, 0.9831593, -0.4011058, 1, 1, 1, 1, 1,
1.285506, -0.192367, 2.509872, 1, 1, 1, 1, 1,
1.285567, -2.413748, 0.1638112, 1, 1, 1, 1, 1,
1.292477, -1.51515, 2.423394, 1, 1, 1, 1, 1,
1.293391, 0.9140295, 1.144946, 0, 0, 1, 1, 1,
1.296278, -1.979569, 2.540347, 1, 0, 0, 1, 1,
1.296545, 0.5177133, 1.268194, 1, 0, 0, 1, 1,
1.306805, 0.007714875, 1.119949, 1, 0, 0, 1, 1,
1.31438, -1.565326, 3.79174, 1, 0, 0, 1, 1,
1.322719, 0.6669599, 0.326789, 1, 0, 0, 1, 1,
1.324395, -1.190139, 2.259914, 0, 0, 0, 1, 1,
1.338755, -0.1058395, 2.192945, 0, 0, 0, 1, 1,
1.346659, 0.2338294, 2.649055, 0, 0, 0, 1, 1,
1.373253, -1.523938, 1.21334, 0, 0, 0, 1, 1,
1.377872, -0.07941715, 2.44395, 0, 0, 0, 1, 1,
1.380431, 0.8936167, -0.6976027, 0, 0, 0, 1, 1,
1.381919, 0.5043586, 1.010522, 0, 0, 0, 1, 1,
1.388514, -1.069559, 4.538871, 1, 1, 1, 1, 1,
1.390386, 0.5503842, 1.555324, 1, 1, 1, 1, 1,
1.393823, 0.5699546, 2.559494, 1, 1, 1, 1, 1,
1.4, -0.7542417, 2.208721, 1, 1, 1, 1, 1,
1.403934, -0.2037441, 3.352722, 1, 1, 1, 1, 1,
1.413859, 1.284693, 1.639414, 1, 1, 1, 1, 1,
1.416886, 0.9225569, 0.3652402, 1, 1, 1, 1, 1,
1.419667, -0.6522229, 1.762302, 1, 1, 1, 1, 1,
1.428983, 1.476571, -0.1868287, 1, 1, 1, 1, 1,
1.431828, -0.7657247, 1.536209, 1, 1, 1, 1, 1,
1.432511, 0.6176934, 1.47491, 1, 1, 1, 1, 1,
1.440336, 0.4882413, 2.54495, 1, 1, 1, 1, 1,
1.452206, -0.2327585, 2.478721, 1, 1, 1, 1, 1,
1.468026, 0.3770768, 2.254081, 1, 1, 1, 1, 1,
1.46958, 0.3861072, 0.3712147, 1, 1, 1, 1, 1,
1.476353, 1.079109, 1.258788, 0, 0, 1, 1, 1,
1.49813, -0.4240226, 2.002286, 1, 0, 0, 1, 1,
1.498992, -0.6592995, 2.399476, 1, 0, 0, 1, 1,
1.507777, 1.647206, 1.255406, 1, 0, 0, 1, 1,
1.509133, -1.247834, 1.589288, 1, 0, 0, 1, 1,
1.522342, 0.1596335, 0.5094373, 1, 0, 0, 1, 1,
1.52263, 0.1758963, 2.042748, 0, 0, 0, 1, 1,
1.523689, 0.5196848, 0.3254719, 0, 0, 0, 1, 1,
1.535075, -1.118572, 1.847882, 0, 0, 0, 1, 1,
1.544431, 0.577226, 0.3759352, 0, 0, 0, 1, 1,
1.547358, -1.445912, 0.9292058, 0, 0, 0, 1, 1,
1.549046, 0.9941956, 0.1612558, 0, 0, 0, 1, 1,
1.554856, -1.260726, 1.837738, 0, 0, 0, 1, 1,
1.558506, -1.565233, 0.8058864, 1, 1, 1, 1, 1,
1.570681, 0.7675059, 0.8943891, 1, 1, 1, 1, 1,
1.57081, -0.2703137, 1.030139, 1, 1, 1, 1, 1,
1.59203, -0.6332467, 1.223274, 1, 1, 1, 1, 1,
1.601853, 0.6253165, 0.5286306, 1, 1, 1, 1, 1,
1.608596, -0.4600566, 2.216857, 1, 1, 1, 1, 1,
1.609965, 0.1205625, 1.09162, 1, 1, 1, 1, 1,
1.621572, 0.1436858, 0.6948042, 1, 1, 1, 1, 1,
1.638621, -0.4857919, 0.9913598, 1, 1, 1, 1, 1,
1.64882, 0.7422993, -0.6174824, 1, 1, 1, 1, 1,
1.661814, 1.161386, 1.046363, 1, 1, 1, 1, 1,
1.690241, -0.4100261, 2.904245, 1, 1, 1, 1, 1,
1.690938, 1.598351, -0.3429124, 1, 1, 1, 1, 1,
1.706803, 0.7983087, 1.736726, 1, 1, 1, 1, 1,
1.724518, -0.2020009, 2.488587, 1, 1, 1, 1, 1,
1.730481, 0.8436896, 0.9765897, 0, 0, 1, 1, 1,
1.736606, 0.4226597, 1.613003, 1, 0, 0, 1, 1,
1.738602, 0.9226794, 3.737286, 1, 0, 0, 1, 1,
1.764612, 0.8761821, 1.746987, 1, 0, 0, 1, 1,
1.767876, 0.8651658, 3.414193, 1, 0, 0, 1, 1,
1.777639, -0.3135368, 1.841943, 1, 0, 0, 1, 1,
1.781567, -1.281685, 1.102994, 0, 0, 0, 1, 1,
1.78731, -0.8046603, 1.313989, 0, 0, 0, 1, 1,
1.788903, -0.7444151, 3.345691, 0, 0, 0, 1, 1,
1.796273, -0.6699942, 1.687549, 0, 0, 0, 1, 1,
1.804489, -0.1389907, 2.198923, 0, 0, 0, 1, 1,
1.819245, -0.6053622, 1.326529, 0, 0, 0, 1, 1,
1.829351, -1.330964, 1.918001, 0, 0, 0, 1, 1,
1.841312, 1.086121, 1.557597, 1, 1, 1, 1, 1,
1.856262, 1.243994, 1.735857, 1, 1, 1, 1, 1,
1.85719, -1.646909, 3.546352, 1, 1, 1, 1, 1,
1.867004, -1.261107, 0.588716, 1, 1, 1, 1, 1,
1.880189, -0.4235864, 2.508335, 1, 1, 1, 1, 1,
1.891782, -0.4245747, 2.601551, 1, 1, 1, 1, 1,
1.94318, 2.067436, -0.5849412, 1, 1, 1, 1, 1,
1.965971, -0.8024797, 2.115919, 1, 1, 1, 1, 1,
1.98541, -0.3523715, 1.733697, 1, 1, 1, 1, 1,
2.011569, -0.4390075, 2.769089, 1, 1, 1, 1, 1,
2.094776, 0.08762168, 1.001928, 1, 1, 1, 1, 1,
2.120598, -1.297877, 2.085808, 1, 1, 1, 1, 1,
2.159251, -0.4680381, 1.566404, 1, 1, 1, 1, 1,
2.173743, -0.1057275, 2.157489, 1, 1, 1, 1, 1,
2.180837, 1.97158, -0.4710068, 1, 1, 1, 1, 1,
2.197866, -1.454305, 2.323953, 0, 0, 1, 1, 1,
2.22656, 0.5407308, 0.5099761, 1, 0, 0, 1, 1,
2.234803, 0.8339801, 3.208799, 1, 0, 0, 1, 1,
2.253818, 1.081032, 1.174266, 1, 0, 0, 1, 1,
2.293369, 0.5871487, 2.188371, 1, 0, 0, 1, 1,
2.304814, -1.676365, 2.876351, 1, 0, 0, 1, 1,
2.312596, 3.558919, -0.2121224, 0, 0, 0, 1, 1,
2.361487, -0.09145404, 1.31668, 0, 0, 0, 1, 1,
2.499121, -0.9408013, 1.26466, 0, 0, 0, 1, 1,
2.519386, -0.8918956, 1.282757, 0, 0, 0, 1, 1,
2.544078, 0.8063435, 3.073884, 0, 0, 0, 1, 1,
2.569548, -1.732378, 2.503771, 0, 0, 0, 1, 1,
2.570154, 0.672909, 1.762514, 0, 0, 0, 1, 1,
2.592004, -0.048338, 2.031236, 1, 1, 1, 1, 1,
2.657485, -1.590825, 1.735433, 1, 1, 1, 1, 1,
2.681415, 0.08370411, 2.043628, 1, 1, 1, 1, 1,
2.794255, 0.3762659, 3.576803, 1, 1, 1, 1, 1,
2.973566, -1.359288, 1.68087, 1, 1, 1, 1, 1,
3.100108, -1.218486, 3.587316, 1, 1, 1, 1, 1,
3.177922, -0.1126303, 2.427172, 1, 1, 1, 1, 1
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
var radius = 9.531492;
var distance = 33.47896;
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
mvMatrix.translate( 0.1619406, 0.01776218, 0.4026504 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.47896);
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
