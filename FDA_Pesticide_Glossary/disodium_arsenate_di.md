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
-3.370242, 0.8107454, -0.6170861, 1, 0, 0, 1,
-2.998499, 1.379199, -0.4654776, 1, 0.007843138, 0, 1,
-2.969121, -1.612301, -1.874388, 1, 0.01176471, 0, 1,
-2.793068, 0.6510473, -1.951064, 1, 0.01960784, 0, 1,
-2.741004, -0.3472504, -2.527934, 1, 0.02352941, 0, 1,
-2.705466, 0.9296088, -0.7704983, 1, 0.03137255, 0, 1,
-2.415009, 1.177067, -1.073618, 1, 0.03529412, 0, 1,
-2.392903, -0.03476745, 0.5604631, 1, 0.04313726, 0, 1,
-2.356317, -1.079508, -2.165841, 1, 0.04705882, 0, 1,
-2.294446, 0.287919, -1.202747, 1, 0.05490196, 0, 1,
-2.238587, -1.923792, -3.644546, 1, 0.05882353, 0, 1,
-2.200061, -0.02344353, -1.723945, 1, 0.06666667, 0, 1,
-2.156921, -0.9264971, -1.557508, 1, 0.07058824, 0, 1,
-2.139735, -1.603743, -0.2438809, 1, 0.07843138, 0, 1,
-2.06977, -0.9578163, 0.8803837, 1, 0.08235294, 0, 1,
-2.045636, -0.6111757, -2.823123, 1, 0.09019608, 0, 1,
-1.998579, 0.3027025, -1.993881, 1, 0.09411765, 0, 1,
-1.93974, 0.8133188, -0.9972786, 1, 0.1019608, 0, 1,
-1.937823, -1.672543, -1.63436, 1, 0.1098039, 0, 1,
-1.919131, 0.1494413, -0.1754728, 1, 0.1137255, 0, 1,
-1.91257, -1.589441, -2.955057, 1, 0.1215686, 0, 1,
-1.891472, -1.272222, -0.3448317, 1, 0.1254902, 0, 1,
-1.86649, -1.485333, -0.9930344, 1, 0.1333333, 0, 1,
-1.861548, -1.286139, -2.382915, 1, 0.1372549, 0, 1,
-1.854168, -1.763238, -2.245969, 1, 0.145098, 0, 1,
-1.820816, 0.6957883, -3.362294, 1, 0.1490196, 0, 1,
-1.805624, 0.4092056, -0.7271909, 1, 0.1568628, 0, 1,
-1.794863, -0.5669975, -3.949298, 1, 0.1607843, 0, 1,
-1.794627, 0.3062395, 1.839274, 1, 0.1686275, 0, 1,
-1.778436, 2.165139, 0.173257, 1, 0.172549, 0, 1,
-1.746141, 0.1164448, -1.37389, 1, 0.1803922, 0, 1,
-1.737932, 1.192843, -0.2813175, 1, 0.1843137, 0, 1,
-1.731253, -1.759831, -1.908013, 1, 0.1921569, 0, 1,
-1.729138, -0.9847118, -1.952802, 1, 0.1960784, 0, 1,
-1.72876, 1.64204, -0.968242, 1, 0.2039216, 0, 1,
-1.727625, 0.8550613, -1.300241, 1, 0.2117647, 0, 1,
-1.722407, 0.4290355, -0.9051607, 1, 0.2156863, 0, 1,
-1.707189, 0.9969415, -0.7516697, 1, 0.2235294, 0, 1,
-1.69773, 0.01202486, -1.491548, 1, 0.227451, 0, 1,
-1.694836, -0.6548842, -2.979941, 1, 0.2352941, 0, 1,
-1.688002, -0.8187832, -0.2740653, 1, 0.2392157, 0, 1,
-1.687582, 0.9029854, -1.017366, 1, 0.2470588, 0, 1,
-1.674905, 1.015332, -1.332221, 1, 0.2509804, 0, 1,
-1.666839, -0.2810094, -3.128588, 1, 0.2588235, 0, 1,
-1.655542, -0.0846651, -2.230561, 1, 0.2627451, 0, 1,
-1.635713, -0.2491487, -0.58206, 1, 0.2705882, 0, 1,
-1.596361, -0.3816508, -2.933536, 1, 0.2745098, 0, 1,
-1.593025, 1.414314, -2.690058, 1, 0.282353, 0, 1,
-1.591809, -1.279475, -1.760989, 1, 0.2862745, 0, 1,
-1.581139, 0.4796574, -2.287855, 1, 0.2941177, 0, 1,
-1.557313, -0.8027609, -3.880109, 1, 0.3019608, 0, 1,
-1.552506, 0.6194752, -1.265827, 1, 0.3058824, 0, 1,
-1.533672, 0.9822108, -0.1908318, 1, 0.3137255, 0, 1,
-1.531027, -0.4481966, -2.072064, 1, 0.3176471, 0, 1,
-1.514112, 1.189376, -3.037126, 1, 0.3254902, 0, 1,
-1.513894, -2.339177, -4.08706, 1, 0.3294118, 0, 1,
-1.508654, -1.656672, -2.597734, 1, 0.3372549, 0, 1,
-1.508115, 0.4822775, -1.369403, 1, 0.3411765, 0, 1,
-1.486231, 0.8846891, 0.6855085, 1, 0.3490196, 0, 1,
-1.485041, 2.111583, 0.1087421, 1, 0.3529412, 0, 1,
-1.484796, -0.3238255, -1.93514, 1, 0.3607843, 0, 1,
-1.474896, -1.426939, -3.05402, 1, 0.3647059, 0, 1,
-1.470302, 0.3463845, -2.105918, 1, 0.372549, 0, 1,
-1.456967, -0.2272119, 0.6111992, 1, 0.3764706, 0, 1,
-1.452363, -0.2837891, -2.684177, 1, 0.3843137, 0, 1,
-1.445942, -1.14328, -1.446297, 1, 0.3882353, 0, 1,
-1.444654, 0.4415168, -1.464308, 1, 0.3960784, 0, 1,
-1.438555, -1.104964, -1.610371, 1, 0.4039216, 0, 1,
-1.436983, 1.357751, -2.63179, 1, 0.4078431, 0, 1,
-1.43374, -0.0175727, -0.9488932, 1, 0.4156863, 0, 1,
-1.433342, -1.393988, -3.090117, 1, 0.4196078, 0, 1,
-1.424785, 0.0250567, -0.7095205, 1, 0.427451, 0, 1,
-1.423316, 1.286329, -1.492064, 1, 0.4313726, 0, 1,
-1.418818, 0.3538616, -1.989622, 1, 0.4392157, 0, 1,
-1.416341, 3.155595, 0.0116867, 1, 0.4431373, 0, 1,
-1.409533, -0.7069275, -1.148723, 1, 0.4509804, 0, 1,
-1.404927, -0.8366156, -0.9289108, 1, 0.454902, 0, 1,
-1.389618, 0.7436181, -0.9943547, 1, 0.4627451, 0, 1,
-1.383501, 0.379014, -1.881258, 1, 0.4666667, 0, 1,
-1.380267, 1.337053, -0.04651956, 1, 0.4745098, 0, 1,
-1.378295, 1.00674, -0.1045932, 1, 0.4784314, 0, 1,
-1.371935, -0.04380179, -1.770616, 1, 0.4862745, 0, 1,
-1.367731, 0.5568244, -0.5345412, 1, 0.4901961, 0, 1,
-1.351129, -0.8564038, -2.721072, 1, 0.4980392, 0, 1,
-1.336958, -0.3799964, -0.1366803, 1, 0.5058824, 0, 1,
-1.318556, -1.234992, -2.813822, 1, 0.509804, 0, 1,
-1.316191, 1.473003, -1.184018, 1, 0.5176471, 0, 1,
-1.31303, -0.1983188, -1.555122, 1, 0.5215687, 0, 1,
-1.308905, 0.36257, -0.3275313, 1, 0.5294118, 0, 1,
-1.308889, 1.067455, -1.482125, 1, 0.5333334, 0, 1,
-1.298446, -0.6985276, -1.977423, 1, 0.5411765, 0, 1,
-1.293259, 0.3394112, -0.2806289, 1, 0.5450981, 0, 1,
-1.286919, -1.661602, -1.676565, 1, 0.5529412, 0, 1,
-1.286026, 0.6141539, -2.405764, 1, 0.5568628, 0, 1,
-1.280414, -0.6816118, -2.542271, 1, 0.5647059, 0, 1,
-1.275425, -0.659595, -1.278605, 1, 0.5686275, 0, 1,
-1.272649, 1.678764, -1.550138, 1, 0.5764706, 0, 1,
-1.266726, -1.049392, -2.973586, 1, 0.5803922, 0, 1,
-1.253936, -1.811101, -2.819797, 1, 0.5882353, 0, 1,
-1.253268, -0.05386063, -0.2913368, 1, 0.5921569, 0, 1,
-1.249758, 1.10297, -2.164695, 1, 0.6, 0, 1,
-1.249264, 0.475321, -1.76131, 1, 0.6078432, 0, 1,
-1.24587, -1.750907, -2.710797, 1, 0.6117647, 0, 1,
-1.243701, -1.392127, -2.295882, 1, 0.6196079, 0, 1,
-1.24005, 0.611775, -0.7860781, 1, 0.6235294, 0, 1,
-1.239618, -0.0140246, -0.8443032, 1, 0.6313726, 0, 1,
-1.232744, 0.9907719, -2.150957, 1, 0.6352941, 0, 1,
-1.205215, 1.036702, -0.9623226, 1, 0.6431373, 0, 1,
-1.203663, 0.8285335, -0.01925733, 1, 0.6470588, 0, 1,
-1.200104, 0.6190591, 0.02969006, 1, 0.654902, 0, 1,
-1.193999, -0.1895684, -3.809054, 1, 0.6588235, 0, 1,
-1.179553, 1.155136, 0.3912168, 1, 0.6666667, 0, 1,
-1.175908, -0.5233883, -3.385943, 1, 0.6705883, 0, 1,
-1.174682, 0.8321764, -1.700132, 1, 0.6784314, 0, 1,
-1.174107, -1.252344, -2.805181, 1, 0.682353, 0, 1,
-1.167646, -0.6452505, -2.665918, 1, 0.6901961, 0, 1,
-1.149244, -0.4059231, -3.104938, 1, 0.6941177, 0, 1,
-1.141114, -0.1998694, -1.772461, 1, 0.7019608, 0, 1,
-1.128784, 0.5589337, 0.2982199, 1, 0.7098039, 0, 1,
-1.115252, -0.8799277, -3.994566, 1, 0.7137255, 0, 1,
-1.113249, 1.273085, -0.8411617, 1, 0.7215686, 0, 1,
-1.112105, -0.1307768, -2.957577, 1, 0.7254902, 0, 1,
-1.111145, -0.0428775, -0.76697, 1, 0.7333333, 0, 1,
-1.107005, 2.026561, 0.08502796, 1, 0.7372549, 0, 1,
-1.103461, 0.1331026, -1.112198, 1, 0.7450981, 0, 1,
-1.102644, 0.004259775, -2.664598, 1, 0.7490196, 0, 1,
-1.090511, 0.4042373, -0.0910167, 1, 0.7568628, 0, 1,
-1.088695, -0.3411348, -1.355682, 1, 0.7607843, 0, 1,
-1.0785, -0.9520039, -2.080487, 1, 0.7686275, 0, 1,
-1.072818, 0.2664536, -1.035986, 1, 0.772549, 0, 1,
-1.06522, -0.5246682, -2.529801, 1, 0.7803922, 0, 1,
-1.0648, 1.518167, 1.412133, 1, 0.7843137, 0, 1,
-1.054386, -1.516946, -4.425242, 1, 0.7921569, 0, 1,
-1.050516, -0.1322443, -1.194262, 1, 0.7960784, 0, 1,
-1.050279, -0.1454742, -1.077953, 1, 0.8039216, 0, 1,
-1.048729, -0.4996116, -1.497219, 1, 0.8117647, 0, 1,
-1.038141, -1.265565, -2.44091, 1, 0.8156863, 0, 1,
-1.031559, 0.1882158, -1.038569, 1, 0.8235294, 0, 1,
-1.026527, -2.311079, -1.081215, 1, 0.827451, 0, 1,
-1.026336, 0.8782048, 0.7585651, 1, 0.8352941, 0, 1,
-1.02297, -0.6072855, -3.633787, 1, 0.8392157, 0, 1,
-1.013675, 1.86152, 0.6702014, 1, 0.8470588, 0, 1,
-1.012444, -0.8827316, -2.866908, 1, 0.8509804, 0, 1,
-1.004321, 0.8134605, -0.6461259, 1, 0.8588235, 0, 1,
-1.002959, -0.7301031, -2.847904, 1, 0.8627451, 0, 1,
-0.9916999, -0.3917975, -2.359877, 1, 0.8705882, 0, 1,
-0.9859524, -0.1147913, -2.737733, 1, 0.8745098, 0, 1,
-0.9806837, -1.532226, -2.71876, 1, 0.8823529, 0, 1,
-0.9790893, -0.6466645, -1.778971, 1, 0.8862745, 0, 1,
-0.9770179, 1.385441, -2.114733, 1, 0.8941177, 0, 1,
-0.9652274, -0.1001647, -4.187666, 1, 0.8980392, 0, 1,
-0.9612151, -1.181015, -2.030179, 1, 0.9058824, 0, 1,
-0.9580519, -0.2889177, -3.087138, 1, 0.9137255, 0, 1,
-0.9554225, -0.1205742, -0.9021285, 1, 0.9176471, 0, 1,
-0.9554102, 0.4429465, -1.98856, 1, 0.9254902, 0, 1,
-0.9553771, -0.4266417, -3.451142, 1, 0.9294118, 0, 1,
-0.9536172, -1.183598, -2.196027, 1, 0.9372549, 0, 1,
-0.9499545, -0.5556195, -1.107865, 1, 0.9411765, 0, 1,
-0.9334661, -0.8338816, -2.243581, 1, 0.9490196, 0, 1,
-0.9313667, -1.130774, -2.81971, 1, 0.9529412, 0, 1,
-0.9300674, 0.837585, -2.408775, 1, 0.9607843, 0, 1,
-0.928188, -0.7901384, -4.266123, 1, 0.9647059, 0, 1,
-0.9278852, -0.7032532, -1.780854, 1, 0.972549, 0, 1,
-0.9276735, 0.2623784, -0.7794948, 1, 0.9764706, 0, 1,
-0.9258795, -0.9342241, -3.271687, 1, 0.9843137, 0, 1,
-0.9252185, -1.197813, -2.092877, 1, 0.9882353, 0, 1,
-0.923292, 0.5993578, -1.15563, 1, 0.9960784, 0, 1,
-0.9215214, -0.9781734, -0.5325288, 0.9960784, 1, 0, 1,
-0.921307, -0.7335028, -2.925158, 0.9921569, 1, 0, 1,
-0.9205222, 0.1042126, -0.7904406, 0.9843137, 1, 0, 1,
-0.9198781, -1.152907, -0.6345832, 0.9803922, 1, 0, 1,
-0.9195258, 0.5884178, -1.269096, 0.972549, 1, 0, 1,
-0.9124901, -0.4153112, -1.394308, 0.9686275, 1, 0, 1,
-0.9067729, -0.2156712, 0.3298484, 0.9607843, 1, 0, 1,
-0.896602, -0.6041241, -3.055225, 0.9568627, 1, 0, 1,
-0.8929053, -0.1664924, -1.782946, 0.9490196, 1, 0, 1,
-0.8917317, 1.325532, 1.068393, 0.945098, 1, 0, 1,
-0.8907138, 0.6248274, 0.05146609, 0.9372549, 1, 0, 1,
-0.8813713, -0.6261669, -2.26305, 0.9333333, 1, 0, 1,
-0.8759159, -0.5972446, -1.946484, 0.9254902, 1, 0, 1,
-0.8727519, -0.1904776, 0.06582692, 0.9215686, 1, 0, 1,
-0.865514, 1.1466, -1.622935, 0.9137255, 1, 0, 1,
-0.8498798, -0.4217986, -1.450377, 0.9098039, 1, 0, 1,
-0.8415651, -0.4188246, -0.5004852, 0.9019608, 1, 0, 1,
-0.8343408, 1.803614, 0.1995712, 0.8941177, 1, 0, 1,
-0.8294669, -1.128357, -2.137753, 0.8901961, 1, 0, 1,
-0.8269702, 0.6252296, 0.1215004, 0.8823529, 1, 0, 1,
-0.8255442, -1.658002, -3.554199, 0.8784314, 1, 0, 1,
-0.8243542, 0.5963218, -0.7932441, 0.8705882, 1, 0, 1,
-0.8165488, -0.6111715, -4.059003, 0.8666667, 1, 0, 1,
-0.8161489, -1.049832, -1.053179, 0.8588235, 1, 0, 1,
-0.8161266, -1.571376, -2.96997, 0.854902, 1, 0, 1,
-0.8134993, -0.7284693, 0.7240707, 0.8470588, 1, 0, 1,
-0.8120695, -0.7226546, -3.017819, 0.8431373, 1, 0, 1,
-0.81062, -0.1427594, -2.127612, 0.8352941, 1, 0, 1,
-0.8074384, 0.6605322, -0.5628877, 0.8313726, 1, 0, 1,
-0.8057807, 0.170229, -0.8695012, 0.8235294, 1, 0, 1,
-0.796251, 0.9575852, 0.06851524, 0.8196079, 1, 0, 1,
-0.7957913, 0.1293169, -1.315185, 0.8117647, 1, 0, 1,
-0.7906042, 0.2332232, -1.548136, 0.8078431, 1, 0, 1,
-0.790529, 0.9152363, -2.433526, 0.8, 1, 0, 1,
-0.7859245, 1.232046, -0.2276543, 0.7921569, 1, 0, 1,
-0.780759, 1.018476, -1.345683, 0.7882353, 1, 0, 1,
-0.7790788, -2.453548, -2.225871, 0.7803922, 1, 0, 1,
-0.773937, 0.4195767, -1.249509, 0.7764706, 1, 0, 1,
-0.7736204, 0.6128403, -1.332445, 0.7686275, 1, 0, 1,
-0.7727427, -0.3928199, -0.6410084, 0.7647059, 1, 0, 1,
-0.7709805, 1.323829, -3.08673, 0.7568628, 1, 0, 1,
-0.7669461, 0.1432353, -0.8519908, 0.7529412, 1, 0, 1,
-0.7632505, -0.6158488, -2.983747, 0.7450981, 1, 0, 1,
-0.7606515, 1.858635, 0.6361108, 0.7411765, 1, 0, 1,
-0.7581718, -2.376484, -2.267755, 0.7333333, 1, 0, 1,
-0.7480108, -0.6469852, -2.816213, 0.7294118, 1, 0, 1,
-0.739959, 0.7242248, 0.3964158, 0.7215686, 1, 0, 1,
-0.7376024, 1.284184, -1.562467, 0.7176471, 1, 0, 1,
-0.7354351, 0.4527134, -0.8067385, 0.7098039, 1, 0, 1,
-0.7327014, -0.3502035, -1.209698, 0.7058824, 1, 0, 1,
-0.7313322, 0.5008425, -0.7086661, 0.6980392, 1, 0, 1,
-0.7293803, -0.4762513, -4.208254, 0.6901961, 1, 0, 1,
-0.7258494, -0.3702338, -3.079361, 0.6862745, 1, 0, 1,
-0.7228017, -0.7904841, -0.8425814, 0.6784314, 1, 0, 1,
-0.7209654, 1.883108, -0.06614681, 0.6745098, 1, 0, 1,
-0.7154051, -1.167825, -3.566327, 0.6666667, 1, 0, 1,
-0.7144498, 0.2197977, -0.8245412, 0.6627451, 1, 0, 1,
-0.709278, 0.5920026, -1.369268, 0.654902, 1, 0, 1,
-0.7063707, 1.952656, 0.4599216, 0.6509804, 1, 0, 1,
-0.7054881, 1.458924, -0.1232175, 0.6431373, 1, 0, 1,
-0.7031987, 1.118641, -2.343133, 0.6392157, 1, 0, 1,
-0.7028018, 1.027357, -0.5197089, 0.6313726, 1, 0, 1,
-0.7004344, -0.5019726, -2.375581, 0.627451, 1, 0, 1,
-0.6927497, -0.3397978, -1.596583, 0.6196079, 1, 0, 1,
-0.6922498, -1.15193, -1.942062, 0.6156863, 1, 0, 1,
-0.6915871, -0.2434046, -2.156262, 0.6078432, 1, 0, 1,
-0.681237, -0.498101, -3.622125, 0.6039216, 1, 0, 1,
-0.6802759, 0.03668759, -3.76001, 0.5960785, 1, 0, 1,
-0.6799529, 0.6968241, -1.686031, 0.5882353, 1, 0, 1,
-0.6762891, -0.7284987, -2.632912, 0.5843138, 1, 0, 1,
-0.6742999, 1.578748, -1.235307, 0.5764706, 1, 0, 1,
-0.6736528, -1.134928, -4.727531, 0.572549, 1, 0, 1,
-0.6715918, -0.7510086, -1.592947, 0.5647059, 1, 0, 1,
-0.6645501, 0.5365596, -2.407613, 0.5607843, 1, 0, 1,
-0.6589877, 1.187069, -0.4833288, 0.5529412, 1, 0, 1,
-0.6566915, 0.3377591, 0.4349215, 0.5490196, 1, 0, 1,
-0.6531962, 0.7601212, 1.026799, 0.5411765, 1, 0, 1,
-0.6517527, 0.5090697, -1.189918, 0.5372549, 1, 0, 1,
-0.6431068, 0.6999359, 0.7637061, 0.5294118, 1, 0, 1,
-0.6411383, -0.5001801, -0.7853142, 0.5254902, 1, 0, 1,
-0.6402913, -0.4606778, -1.999516, 0.5176471, 1, 0, 1,
-0.6391733, 0.4869003, -0.9159779, 0.5137255, 1, 0, 1,
-0.6379217, 1.041061, -1.975658, 0.5058824, 1, 0, 1,
-0.6348788, -1.852648, -3.206125, 0.5019608, 1, 0, 1,
-0.6290958, 1.813647, 0.6666505, 0.4941176, 1, 0, 1,
-0.6250003, -0.5953673, -2.26863, 0.4862745, 1, 0, 1,
-0.6199283, -0.7078627, -2.492358, 0.4823529, 1, 0, 1,
-0.6179637, -0.9718338, -1.567272, 0.4745098, 1, 0, 1,
-0.613928, 0.6273689, 1.896956, 0.4705882, 1, 0, 1,
-0.6117373, 0.7933389, -0.9958724, 0.4627451, 1, 0, 1,
-0.6051772, -0.3823136, -4.413963, 0.4588235, 1, 0, 1,
-0.6045702, -0.2562016, -2.667036, 0.4509804, 1, 0, 1,
-0.6039954, -1.362839, -2.092341, 0.4470588, 1, 0, 1,
-0.5979887, 0.4896187, -2.421329, 0.4392157, 1, 0, 1,
-0.5974531, 1.406512, -1.520786, 0.4352941, 1, 0, 1,
-0.5923073, -0.6546744, -2.711378, 0.427451, 1, 0, 1,
-0.5849597, -0.532913, -2.552378, 0.4235294, 1, 0, 1,
-0.5843158, 1.889261, 1.896458, 0.4156863, 1, 0, 1,
-0.582521, 0.0927421, -0.4139786, 0.4117647, 1, 0, 1,
-0.5750296, -0.5045992, -2.876285, 0.4039216, 1, 0, 1,
-0.5734891, -0.7516522, -2.254942, 0.3960784, 1, 0, 1,
-0.5713625, 0.3193029, -1.61931, 0.3921569, 1, 0, 1,
-0.5690563, 1.175667, -0.5777715, 0.3843137, 1, 0, 1,
-0.5687841, 0.4610174, 1.761363, 0.3803922, 1, 0, 1,
-0.5636085, -1.338549, -2.093455, 0.372549, 1, 0, 1,
-0.5608808, 0.7029217, 1.031445, 0.3686275, 1, 0, 1,
-0.5605152, -0.4601013, -3.26088, 0.3607843, 1, 0, 1,
-0.5593892, -0.3646075, -3.288509, 0.3568628, 1, 0, 1,
-0.5590013, 1.259495, 1.71252, 0.3490196, 1, 0, 1,
-0.5585245, -0.2407702, -2.313254, 0.345098, 1, 0, 1,
-0.5581937, -0.3438427, -1.8946, 0.3372549, 1, 0, 1,
-0.5572367, -0.619858, -1.078662, 0.3333333, 1, 0, 1,
-0.5490144, 0.4051722, 0.7110098, 0.3254902, 1, 0, 1,
-0.5474126, -1.162055, -3.827405, 0.3215686, 1, 0, 1,
-0.5452526, -0.7757153, -1.974351, 0.3137255, 1, 0, 1,
-0.54408, 1.6201, 0.2332874, 0.3098039, 1, 0, 1,
-0.5432821, -0.4367063, -2.095765, 0.3019608, 1, 0, 1,
-0.5432324, 1.502037, -0.3869087, 0.2941177, 1, 0, 1,
-0.541629, 1.260165, -1.153246, 0.2901961, 1, 0, 1,
-0.5401751, 0.3493257, -0.4898189, 0.282353, 1, 0, 1,
-0.5338125, 0.4654679, -1.880912, 0.2784314, 1, 0, 1,
-0.5336797, -1.944581, -4.127458, 0.2705882, 1, 0, 1,
-0.5332981, 1.148651, -1.492996, 0.2666667, 1, 0, 1,
-0.5323865, -1.043162, -3.227033, 0.2588235, 1, 0, 1,
-0.5314596, -0.5816, -0.5590644, 0.254902, 1, 0, 1,
-0.528407, 1.456039, -1.581397, 0.2470588, 1, 0, 1,
-0.5227143, 0.9626343, -0.9599192, 0.2431373, 1, 0, 1,
-0.5194083, -1.68756, -2.28757, 0.2352941, 1, 0, 1,
-0.5171763, -1.553356, -3.92799, 0.2313726, 1, 0, 1,
-0.5138794, -1.526263, -2.826328, 0.2235294, 1, 0, 1,
-0.5112745, 1.939339, 0.6211844, 0.2196078, 1, 0, 1,
-0.5107089, -0.7543535, -3.375647, 0.2117647, 1, 0, 1,
-0.5088621, 1.013175, 0.2217813, 0.2078431, 1, 0, 1,
-0.5046815, -0.3541771, -2.767143, 0.2, 1, 0, 1,
-0.5045418, 0.3302547, -0.08204173, 0.1921569, 1, 0, 1,
-0.5040247, 0.2497495, -1.108136, 0.1882353, 1, 0, 1,
-0.502582, 0.1668099, -1.553353, 0.1803922, 1, 0, 1,
-0.5007316, 0.9703662, -1.597139, 0.1764706, 1, 0, 1,
-0.4995645, -0.09122425, -1.253072, 0.1686275, 1, 0, 1,
-0.4984108, -0.006563963, 1.556525, 0.1647059, 1, 0, 1,
-0.4950162, -1.19844, -3.157778, 0.1568628, 1, 0, 1,
-0.4924331, -1.241114, -2.189517, 0.1529412, 1, 0, 1,
-0.4870262, 0.9255863, -0.1375399, 0.145098, 1, 0, 1,
-0.4701557, 0.2587182, -1.729609, 0.1411765, 1, 0, 1,
-0.4694541, 0.6678862, 0.1885176, 0.1333333, 1, 0, 1,
-0.468333, -0.1523795, -2.048609, 0.1294118, 1, 0, 1,
-0.4676763, -0.0649563, -1.741554, 0.1215686, 1, 0, 1,
-0.4659534, 0.5960354, -0.9836971, 0.1176471, 1, 0, 1,
-0.4652453, 0.7709714, -1.621533, 0.1098039, 1, 0, 1,
-0.45926, -0.5660052, -3.028167, 0.1058824, 1, 0, 1,
-0.456398, -1.025508, -3.964715, 0.09803922, 1, 0, 1,
-0.4552242, 0.3363912, -1.853557, 0.09019608, 1, 0, 1,
-0.4551645, -1.11311, -3.015011, 0.08627451, 1, 0, 1,
-0.4537425, 0.7853118, 0.8742585, 0.07843138, 1, 0, 1,
-0.4516229, 1.088499, 0.2747763, 0.07450981, 1, 0, 1,
-0.4496861, 0.3161936, -2.133858, 0.06666667, 1, 0, 1,
-0.4477127, -0.4596658, -3.037891, 0.0627451, 1, 0, 1,
-0.445291, -0.3413008, -3.072824, 0.05490196, 1, 0, 1,
-0.4446727, 0.09134842, -1.663764, 0.05098039, 1, 0, 1,
-0.4401926, 0.07199312, -0.7547837, 0.04313726, 1, 0, 1,
-0.4399998, 0.2475053, -0.7576952, 0.03921569, 1, 0, 1,
-0.4396605, 1.767998, -0.8116125, 0.03137255, 1, 0, 1,
-0.4348655, 0.1308707, -2.49142, 0.02745098, 1, 0, 1,
-0.4315566, 1.470804, 0.6140863, 0.01960784, 1, 0, 1,
-0.4305344, 0.2669767, -1.328059, 0.01568628, 1, 0, 1,
-0.4298058, -1.111981, -3.456239, 0.007843138, 1, 0, 1,
-0.4290856, 1.492692, 0.1862726, 0.003921569, 1, 0, 1,
-0.4272293, 0.7152797, -0.4846431, 0, 1, 0.003921569, 1,
-0.4223584, -2.48, -2.350848, 0, 1, 0.01176471, 1,
-0.4214333, 1.200182, -0.8494976, 0, 1, 0.01568628, 1,
-0.4179571, 0.02410598, -2.651903, 0, 1, 0.02352941, 1,
-0.4178824, 1.276804, -0.9682477, 0, 1, 0.02745098, 1,
-0.4148597, 2.554443, 1.004593, 0, 1, 0.03529412, 1,
-0.4115567, -0.1520713, -1.483759, 0, 1, 0.03921569, 1,
-0.4099748, -0.7593258, -2.21388, 0, 1, 0.04705882, 1,
-0.4075438, -0.1148124, -2.648729, 0, 1, 0.05098039, 1,
-0.4071569, -0.400702, -2.201875, 0, 1, 0.05882353, 1,
-0.4056956, -0.8515859, -2.452693, 0, 1, 0.0627451, 1,
-0.4047349, 0.3458101, -0.4692578, 0, 1, 0.07058824, 1,
-0.4031264, 0.9150364, -0.9599679, 0, 1, 0.07450981, 1,
-0.3956445, 0.3707341, -2.026027, 0, 1, 0.08235294, 1,
-0.394382, 0.6037643, -0.7036564, 0, 1, 0.08627451, 1,
-0.386033, -0.8392107, -2.842815, 0, 1, 0.09411765, 1,
-0.3834234, -0.6578851, -2.197456, 0, 1, 0.1019608, 1,
-0.3822097, 1.711143, -0.7994688, 0, 1, 0.1058824, 1,
-0.3799713, 0.1881255, -3.281393, 0, 1, 0.1137255, 1,
-0.3780286, -0.7825664, -3.153232, 0, 1, 0.1176471, 1,
-0.3761645, 0.8542159, 0.3553257, 0, 1, 0.1254902, 1,
-0.3749406, 1.571084, -1.042645, 0, 1, 0.1294118, 1,
-0.3721813, -0.6998199, -0.4341213, 0, 1, 0.1372549, 1,
-0.3678512, -1.289471, -3.582588, 0, 1, 0.1411765, 1,
-0.3643368, -0.2096886, -2.80974, 0, 1, 0.1490196, 1,
-0.3633314, 0.2401042, -1.300177, 0, 1, 0.1529412, 1,
-0.362653, -0.3149064, -1.72609, 0, 1, 0.1607843, 1,
-0.3605464, 0.01319216, -1.062841, 0, 1, 0.1647059, 1,
-0.3603935, 0.1696712, 0.3760163, 0, 1, 0.172549, 1,
-0.3578409, -1.003208, -2.679879, 0, 1, 0.1764706, 1,
-0.3576727, -0.3166496, -2.548321, 0, 1, 0.1843137, 1,
-0.3551795, 0.02277827, -1.916343, 0, 1, 0.1882353, 1,
-0.3462464, 0.439477, -1.139525, 0, 1, 0.1960784, 1,
-0.3440239, 0.1497127, -2.318953, 0, 1, 0.2039216, 1,
-0.3397026, 0.1582969, -0.7825407, 0, 1, 0.2078431, 1,
-0.3388003, -0.6538662, -3.400846, 0, 1, 0.2156863, 1,
-0.3352099, 0.6132924, -1.333337, 0, 1, 0.2196078, 1,
-0.3332696, -0.2185078, -3.916246, 0, 1, 0.227451, 1,
-0.3326957, 0.9032093, -3.510214, 0, 1, 0.2313726, 1,
-0.3282562, -1.848691, -2.916211, 0, 1, 0.2392157, 1,
-0.3277651, -0.1537543, -1.485831, 0, 1, 0.2431373, 1,
-0.3255702, 1.21177, -0.512762, 0, 1, 0.2509804, 1,
-0.3202697, 0.6128891, 0.1509324, 0, 1, 0.254902, 1,
-0.3183242, -0.1134354, -1.086464, 0, 1, 0.2627451, 1,
-0.2944627, -0.6531081, -2.473252, 0, 1, 0.2666667, 1,
-0.2932498, -0.6841908, -2.902632, 0, 1, 0.2745098, 1,
-0.2929075, 0.4764746, -0.5496837, 0, 1, 0.2784314, 1,
-0.2926962, -0.5916904, -2.03711, 0, 1, 0.2862745, 1,
-0.2904857, -0.2561856, -3.513322, 0, 1, 0.2901961, 1,
-0.288779, 1.121737, -0.8919979, 0, 1, 0.2980392, 1,
-0.2870003, -1.31715, -3.825223, 0, 1, 0.3058824, 1,
-0.2856644, 1.622426, -0.8675966, 0, 1, 0.3098039, 1,
-0.2804545, 1.118832, -0.7384559, 0, 1, 0.3176471, 1,
-0.2798541, -1.162095, -3.731839, 0, 1, 0.3215686, 1,
-0.2795484, 0.1619124, -1.865162, 0, 1, 0.3294118, 1,
-0.2776724, -0.9028019, -0.595998, 0, 1, 0.3333333, 1,
-0.2766823, 0.9036379, -0.523723, 0, 1, 0.3411765, 1,
-0.2627275, -0.2006713, -3.524318, 0, 1, 0.345098, 1,
-0.252449, 0.9729117, 1.789917, 0, 1, 0.3529412, 1,
-0.2522484, 2.006116, 1.349124, 0, 1, 0.3568628, 1,
-0.2495744, 0.4817061, 0.3431089, 0, 1, 0.3647059, 1,
-0.2477363, -0.648239, -2.70083, 0, 1, 0.3686275, 1,
-0.2449711, -0.9939146, -3.658076, 0, 1, 0.3764706, 1,
-0.2400679, 0.7837345, -0.1608981, 0, 1, 0.3803922, 1,
-0.2336808, -0.5521863, -2.361804, 0, 1, 0.3882353, 1,
-0.226617, -0.03958471, -1.954994, 0, 1, 0.3921569, 1,
-0.2252642, 0.4756564, -0.5538914, 0, 1, 0.4, 1,
-0.2236592, 0.2221488, -0.6402822, 0, 1, 0.4078431, 1,
-0.2224942, -0.2760257, -2.788352, 0, 1, 0.4117647, 1,
-0.2218284, -1.190062, -2.887744, 0, 1, 0.4196078, 1,
-0.2217972, -0.375172, -3.28073, 0, 1, 0.4235294, 1,
-0.2187827, -0.3001286, -2.234056, 0, 1, 0.4313726, 1,
-0.2184884, -0.5660484, -2.562699, 0, 1, 0.4352941, 1,
-0.2173704, 0.2808861, -1.521911, 0, 1, 0.4431373, 1,
-0.2150633, 1.184527, -0.3479939, 0, 1, 0.4470588, 1,
-0.2150057, 1.008124, -0.06484405, 0, 1, 0.454902, 1,
-0.2127828, 0.1990677, -1.683671, 0, 1, 0.4588235, 1,
-0.2098328, 1.649372, -1.23314, 0, 1, 0.4666667, 1,
-0.209452, 0.2458804, 0.198946, 0, 1, 0.4705882, 1,
-0.2067887, -1.49781, -4.39587, 0, 1, 0.4784314, 1,
-0.2046935, 1.126505, 1.476124, 0, 1, 0.4823529, 1,
-0.1971269, -0.5871986, -3.079278, 0, 1, 0.4901961, 1,
-0.1945346, -1.057637, -5.017396, 0, 1, 0.4941176, 1,
-0.1942744, -2.018922, -4.019797, 0, 1, 0.5019608, 1,
-0.1862998, 0.3239052, 0.08319938, 0, 1, 0.509804, 1,
-0.1850238, 0.9326902, -1.181023, 0, 1, 0.5137255, 1,
-0.1844501, -0.7377972, -3.087643, 0, 1, 0.5215687, 1,
-0.1815569, 0.1499803, -2.419476, 0, 1, 0.5254902, 1,
-0.1812387, 0.008079385, -1.354447, 0, 1, 0.5333334, 1,
-0.1809902, -0.5901486, -4.028605, 0, 1, 0.5372549, 1,
-0.1776399, -0.8072481, -2.997963, 0, 1, 0.5450981, 1,
-0.175184, -0.03703616, -2.936852, 0, 1, 0.5490196, 1,
-0.1732213, -0.5557784, -1.384458, 0, 1, 0.5568628, 1,
-0.1712754, -1.247732, -3.171645, 0, 1, 0.5607843, 1,
-0.1705508, 0.7730531, -0.5542166, 0, 1, 0.5686275, 1,
-0.1693335, -0.1145023, -2.450708, 0, 1, 0.572549, 1,
-0.1595699, 1.091403, 0.5770205, 0, 1, 0.5803922, 1,
-0.1585918, -1.008069, -2.462659, 0, 1, 0.5843138, 1,
-0.1467644, 0.9831433, -0.1974002, 0, 1, 0.5921569, 1,
-0.1455838, 1.396182, 1.734338, 0, 1, 0.5960785, 1,
-0.1453025, 0.5480211, -0.6626052, 0, 1, 0.6039216, 1,
-0.1437026, -0.7508868, -3.226548, 0, 1, 0.6117647, 1,
-0.1395728, -0.2612956, -1.922889, 0, 1, 0.6156863, 1,
-0.134353, 0.2274825, -0.7175286, 0, 1, 0.6235294, 1,
-0.1333213, -0.5370277, -2.48173, 0, 1, 0.627451, 1,
-0.1332811, -1.31379, -3.745358, 0, 1, 0.6352941, 1,
-0.1315853, 1.162332, -0.4684584, 0, 1, 0.6392157, 1,
-0.124889, -0.2719191, -2.314984, 0, 1, 0.6470588, 1,
-0.1240958, -1.106129, -2.536068, 0, 1, 0.6509804, 1,
-0.1177754, 0.06755377, -1.103812, 0, 1, 0.6588235, 1,
-0.1031511, 1.678366, 1.012683, 0, 1, 0.6627451, 1,
-0.1023944, 0.5038716, -1.112929, 0, 1, 0.6705883, 1,
-0.1016804, -0.4955517, -2.880381, 0, 1, 0.6745098, 1,
-0.09984422, 0.01119344, -1.504173, 0, 1, 0.682353, 1,
-0.0985189, -0.4591137, -3.683177, 0, 1, 0.6862745, 1,
-0.09340752, 0.212719, 0.3768596, 0, 1, 0.6941177, 1,
-0.08715072, 0.7788255, 1.546772, 0, 1, 0.7019608, 1,
-0.08392828, 1.516164, -0.3473639, 0, 1, 0.7058824, 1,
-0.08383761, -0.3531564, -2.433446, 0, 1, 0.7137255, 1,
-0.08346161, 0.4015685, -0.3250585, 0, 1, 0.7176471, 1,
-0.08274899, -0.3055587, -2.618741, 0, 1, 0.7254902, 1,
-0.08163872, -0.444345, -3.325141, 0, 1, 0.7294118, 1,
-0.08035939, -0.1992386, -2.581622, 0, 1, 0.7372549, 1,
-0.08016538, -0.09982155, -3.734792, 0, 1, 0.7411765, 1,
-0.07996093, -0.5546926, -1.814962, 0, 1, 0.7490196, 1,
-0.07341883, -0.05154799, -2.531148, 0, 1, 0.7529412, 1,
-0.07031305, -1.559949, -2.770964, 0, 1, 0.7607843, 1,
-0.06910326, -1.535115, -5.200445, 0, 1, 0.7647059, 1,
-0.05484498, 0.3644716, -1.607287, 0, 1, 0.772549, 1,
-0.05445982, 0.07096384, -1.673972, 0, 1, 0.7764706, 1,
-0.04997199, -0.9458206, -4.250284, 0, 1, 0.7843137, 1,
-0.04043895, -0.8837749, -3.37394, 0, 1, 0.7882353, 1,
-0.03916207, -0.17385, -2.01456, 0, 1, 0.7960784, 1,
-0.03838667, 1.70758, 2.668883, 0, 1, 0.8039216, 1,
-0.03591808, 0.005963595, -0.1316874, 0, 1, 0.8078431, 1,
-0.03455354, 0.02260526, -1.089712, 0, 1, 0.8156863, 1,
-0.02831203, -1.137829, -2.362146, 0, 1, 0.8196079, 1,
-0.02584186, -1.729171, -2.01245, 0, 1, 0.827451, 1,
-0.02524846, 1.888681, -1.777244, 0, 1, 0.8313726, 1,
-0.0235155, 1.435567, -0.1218485, 0, 1, 0.8392157, 1,
-0.02225019, -2.158009, -2.763008, 0, 1, 0.8431373, 1,
-0.02216498, -0.4605737, -1.579054, 0, 1, 0.8509804, 1,
-0.01977561, 0.7393279, 0.3137127, 0, 1, 0.854902, 1,
-0.01870333, -1.642144, -2.963248, 0, 1, 0.8627451, 1,
-0.01078788, 0.8849705, 0.1953135, 0, 1, 0.8666667, 1,
-0.008254042, 1.426822, -0.199663, 0, 1, 0.8745098, 1,
-0.007883752, 0.7283479, 2.273627, 0, 1, 0.8784314, 1,
-0.00745707, 0.5063412, -0.3023529, 0, 1, 0.8862745, 1,
-0.0054134, 0.09734265, 0.2550254, 0, 1, 0.8901961, 1,
-0.004803485, -0.8080252, -2.004422, 0, 1, 0.8980392, 1,
-0.004398881, 0.2497297, -0.1159161, 0, 1, 0.9058824, 1,
-0.002336321, -0.512952, -1.779947, 0, 1, 0.9098039, 1,
-0.0008772745, 1.627457, -1.028854, 0, 1, 0.9176471, 1,
0.003042485, 2.635781, -0.6508605, 0, 1, 0.9215686, 1,
0.003398509, 1.294225, 0.8079349, 0, 1, 0.9294118, 1,
0.006276784, -0.1501774, 3.709464, 0, 1, 0.9333333, 1,
0.01154893, -1.577885, 1.029179, 0, 1, 0.9411765, 1,
0.01243401, -0.5329835, 4.127459, 0, 1, 0.945098, 1,
0.01341884, -0.4370943, 1.611279, 0, 1, 0.9529412, 1,
0.01349321, -1.369463, 4.249689, 0, 1, 0.9568627, 1,
0.01419654, 1.171522, 0.7107192, 0, 1, 0.9647059, 1,
0.01511027, 0.9620589, 1.176329, 0, 1, 0.9686275, 1,
0.01637736, -0.2752535, 2.622103, 0, 1, 0.9764706, 1,
0.01653245, 1.537281, -0.7045727, 0, 1, 0.9803922, 1,
0.02139783, 0.2174202, 1.250085, 0, 1, 0.9882353, 1,
0.02199707, 0.2514025, 0.5111512, 0, 1, 0.9921569, 1,
0.02278736, -0.2295751, 3.172402, 0, 1, 1, 1,
0.02591899, -0.006811768, 2.413669, 0, 0.9921569, 1, 1,
0.02709409, -0.4655544, 3.100335, 0, 0.9882353, 1, 1,
0.03068642, -1.717247, 3.224518, 0, 0.9803922, 1, 1,
0.03089825, -0.1446345, 3.421099, 0, 0.9764706, 1, 1,
0.03804066, 0.649483, 1.185545, 0, 0.9686275, 1, 1,
0.04309684, -0.3792934, 2.299637, 0, 0.9647059, 1, 1,
0.05010173, 0.1288345, -0.4647043, 0, 0.9568627, 1, 1,
0.05437707, 0.6562818, -0.3414489, 0, 0.9529412, 1, 1,
0.05448029, 0.9979669, 1.070437, 0, 0.945098, 1, 1,
0.06386038, -0.05544478, 1.298057, 0, 0.9411765, 1, 1,
0.06742888, 0.06882031, 0.6334879, 0, 0.9333333, 1, 1,
0.06893855, 0.3656101, -0.04704356, 0, 0.9294118, 1, 1,
0.07238117, -0.1735489, 3.230931, 0, 0.9215686, 1, 1,
0.07322346, -0.9010659, 1.446108, 0, 0.9176471, 1, 1,
0.07462175, 1.196552, -1.248116, 0, 0.9098039, 1, 1,
0.07638118, 1.277285, -0.2849723, 0, 0.9058824, 1, 1,
0.08465492, -0.1915238, 2.875403, 0, 0.8980392, 1, 1,
0.08590561, -1.856556, 3.088383, 0, 0.8901961, 1, 1,
0.08672372, 1.941152, -0.02787251, 0, 0.8862745, 1, 1,
0.08696558, -0.3406551, 2.887983, 0, 0.8784314, 1, 1,
0.08748094, 0.9562561, -1.207326, 0, 0.8745098, 1, 1,
0.08889748, 0.6147178, -0.974895, 0, 0.8666667, 1, 1,
0.08911711, 0.09693299, -0.1924271, 0, 0.8627451, 1, 1,
0.08951158, 0.9692453, 0.0147487, 0, 0.854902, 1, 1,
0.08965615, -0.656103, 3.970602, 0, 0.8509804, 1, 1,
0.09180328, 0.373454, 1.342952, 0, 0.8431373, 1, 1,
0.09301496, 2.238654, 0.09714405, 0, 0.8392157, 1, 1,
0.09341996, -0.1934313, 2.432704, 0, 0.8313726, 1, 1,
0.1011907, 0.02605415, -0.3435161, 0, 0.827451, 1, 1,
0.1087229, -0.07886684, 4.114633, 0, 0.8196079, 1, 1,
0.1170715, -1.267055, 3.704969, 0, 0.8156863, 1, 1,
0.1174187, 0.02808, 0.6498278, 0, 0.8078431, 1, 1,
0.1208238, -0.1637826, 0.9425365, 0, 0.8039216, 1, 1,
0.1210917, 1.109744, 0.5049181, 0, 0.7960784, 1, 1,
0.1232473, 0.1480862, 1.100422, 0, 0.7882353, 1, 1,
0.1233905, 1.420417, -1.327342, 0, 0.7843137, 1, 1,
0.123526, 0.529819, 2.478955, 0, 0.7764706, 1, 1,
0.1292352, -0.4612521, 4.34542, 0, 0.772549, 1, 1,
0.1306503, -0.1817106, 4.355661, 0, 0.7647059, 1, 1,
0.1338525, 1.785794, 0.653721, 0, 0.7607843, 1, 1,
0.136435, -0.6582311, 1.07009, 0, 0.7529412, 1, 1,
0.1439271, -0.6159778, 2.593195, 0, 0.7490196, 1, 1,
0.1469952, 0.4650517, 1.216474, 0, 0.7411765, 1, 1,
0.1499641, 0.7528585, 1.402797, 0, 0.7372549, 1, 1,
0.1585111, -2.242465, 3.07031, 0, 0.7294118, 1, 1,
0.1600593, -0.3193147, 2.412884, 0, 0.7254902, 1, 1,
0.16187, 1.199197, -1.401149, 0, 0.7176471, 1, 1,
0.1641157, -0.02451956, 2.605568, 0, 0.7137255, 1, 1,
0.1726856, -0.6935483, 3.738674, 0, 0.7058824, 1, 1,
0.1761972, 0.588887, -0.1384711, 0, 0.6980392, 1, 1,
0.1764498, 0.1289307, 1.293015, 0, 0.6941177, 1, 1,
0.1770296, -1.30236, 4.458701, 0, 0.6862745, 1, 1,
0.1803493, 0.4751175, -0.4336002, 0, 0.682353, 1, 1,
0.1832392, 0.1605034, -0.01449661, 0, 0.6745098, 1, 1,
0.1845013, -1.459467, 3.189373, 0, 0.6705883, 1, 1,
0.1868572, -1.021192, -0.5146233, 0, 0.6627451, 1, 1,
0.1882153, -1.196807, 2.202876, 0, 0.6588235, 1, 1,
0.1882171, -2.247204, 3.133355, 0, 0.6509804, 1, 1,
0.1923577, -2.131465, 2.565727, 0, 0.6470588, 1, 1,
0.19413, 0.6315705, -0.1778295, 0, 0.6392157, 1, 1,
0.1949479, -1.802218, 4.000417, 0, 0.6352941, 1, 1,
0.1951405, -1.810106, 5.711811, 0, 0.627451, 1, 1,
0.1952189, 0.7075515, 2.375432, 0, 0.6235294, 1, 1,
0.1977124, -0.7223608, 1.745372, 0, 0.6156863, 1, 1,
0.1989081, -0.278654, 3.331357, 0, 0.6117647, 1, 1,
0.2073065, -0.6898864, 4.396336, 0, 0.6039216, 1, 1,
0.209889, 0.3440745, -0.9751446, 0, 0.5960785, 1, 1,
0.2114454, -2.734293, 4.259074, 0, 0.5921569, 1, 1,
0.2184911, 0.2035625, 2.225427, 0, 0.5843138, 1, 1,
0.2191151, 1.095688, 0.1217562, 0, 0.5803922, 1, 1,
0.2239013, 0.8104979, -1.055842, 0, 0.572549, 1, 1,
0.2252479, 0.994144, 0.2915894, 0, 0.5686275, 1, 1,
0.2265928, -0.6115589, 3.286264, 0, 0.5607843, 1, 1,
0.2280566, 2.319502, -0.1558782, 0, 0.5568628, 1, 1,
0.2375552, -1.96516, 2.1794, 0, 0.5490196, 1, 1,
0.2401049, 1.588051, 0.2474612, 0, 0.5450981, 1, 1,
0.2519901, -1.687256, 3.78228, 0, 0.5372549, 1, 1,
0.2556312, 0.271368, 0.1917065, 0, 0.5333334, 1, 1,
0.2588891, -0.04303271, 2.236724, 0, 0.5254902, 1, 1,
0.2608526, -0.1960819, 0.9838415, 0, 0.5215687, 1, 1,
0.2615576, -1.717726, 3.650115, 0, 0.5137255, 1, 1,
0.2616545, 2.649512, -0.2347202, 0, 0.509804, 1, 1,
0.2625468, -0.1439406, 2.685231, 0, 0.5019608, 1, 1,
0.2643213, -0.1506128, 1.836999, 0, 0.4941176, 1, 1,
0.2671877, 0.1204921, 1.197281, 0, 0.4901961, 1, 1,
0.2674952, -0.8584332, 5.150511, 0, 0.4823529, 1, 1,
0.2726718, 0.6661355, -0.3390439, 0, 0.4784314, 1, 1,
0.2766323, 0.7167508, 0.8450927, 0, 0.4705882, 1, 1,
0.2768211, 1.444385, 0.9458639, 0, 0.4666667, 1, 1,
0.2772323, -0.6331732, 1.805571, 0, 0.4588235, 1, 1,
0.278179, 0.7592893, -1.564698, 0, 0.454902, 1, 1,
0.2789101, -0.9249924, 4.38778, 0, 0.4470588, 1, 1,
0.280679, 0.8016444, 1.767937, 0, 0.4431373, 1, 1,
0.2847088, -0.1657306, 1.575293, 0, 0.4352941, 1, 1,
0.2851395, -0.9623446, 4.652378, 0, 0.4313726, 1, 1,
0.2878591, -0.5388339, 3.047913, 0, 0.4235294, 1, 1,
0.2939055, 2.040523, -0.8196436, 0, 0.4196078, 1, 1,
0.3013031, -0.3014387, 1.359489, 0, 0.4117647, 1, 1,
0.3019644, 0.3784034, 2.994164, 0, 0.4078431, 1, 1,
0.3020038, 0.1581789, 0.01642843, 0, 0.4, 1, 1,
0.302077, 0.07028545, 0.4689182, 0, 0.3921569, 1, 1,
0.3021853, 0.6719152, -0.007849311, 0, 0.3882353, 1, 1,
0.3031663, 0.003269618, 1.213851, 0, 0.3803922, 1, 1,
0.3033919, 1.373745, 0.1909303, 0, 0.3764706, 1, 1,
0.3147098, -2.182069, 2.517228, 0, 0.3686275, 1, 1,
0.3156989, -0.7954469, 1.89986, 0, 0.3647059, 1, 1,
0.3166597, -0.5348164, 3.444645, 0, 0.3568628, 1, 1,
0.3185655, -1.421162, 1.989878, 0, 0.3529412, 1, 1,
0.320803, 1.087753, 0.5902165, 0, 0.345098, 1, 1,
0.3242987, 1.572891, 1.134785, 0, 0.3411765, 1, 1,
0.328379, 0.4212279, -0.7709277, 0, 0.3333333, 1, 1,
0.3299533, -1.040876, 2.650245, 0, 0.3294118, 1, 1,
0.3300062, -0.3749921, 1.511544, 0, 0.3215686, 1, 1,
0.3337081, 0.3752342, 1.591993, 0, 0.3176471, 1, 1,
0.3337439, -1.659339, 4.190833, 0, 0.3098039, 1, 1,
0.334563, 0.3199781, 1.345084, 0, 0.3058824, 1, 1,
0.3373301, 0.1933272, 1.76572, 0, 0.2980392, 1, 1,
0.3377416, -2.050382, 3.016751, 0, 0.2901961, 1, 1,
0.3427783, -0.5723413, 4.891129, 0, 0.2862745, 1, 1,
0.3498152, 1.272475, -0.4385634, 0, 0.2784314, 1, 1,
0.3536821, -1.834222, 3.801832, 0, 0.2745098, 1, 1,
0.3558383, -0.4146712, 1.715831, 0, 0.2666667, 1, 1,
0.3563366, 1.798483, -0.01520014, 0, 0.2627451, 1, 1,
0.3590489, -0.1559594, 2.411625, 0, 0.254902, 1, 1,
0.3647366, 0.002507214, 0.4001873, 0, 0.2509804, 1, 1,
0.3652275, -0.5554599, 2.029022, 0, 0.2431373, 1, 1,
0.366092, 0.6976234, 1.110965, 0, 0.2392157, 1, 1,
0.3673204, -0.7519777, 1.535371, 0, 0.2313726, 1, 1,
0.3709951, 0.2401795, 0.8636901, 0, 0.227451, 1, 1,
0.3710609, 1.631881, -0.3340082, 0, 0.2196078, 1, 1,
0.3744834, -0.1658822, 2.524029, 0, 0.2156863, 1, 1,
0.378938, 1.718322, -1.91905, 0, 0.2078431, 1, 1,
0.3810754, -0.4169173, 1.374124, 0, 0.2039216, 1, 1,
0.3820876, 0.6492442, -1.302099, 0, 0.1960784, 1, 1,
0.3832206, -1.339661, 2.565074, 0, 0.1882353, 1, 1,
0.3873769, -1.976447, 3.738836, 0, 0.1843137, 1, 1,
0.3901689, -0.7460039, 4.155433, 0, 0.1764706, 1, 1,
0.3904287, -0.4371688, 4.540308, 0, 0.172549, 1, 1,
0.3995127, 0.58619, -0.7706885, 0, 0.1647059, 1, 1,
0.4002824, -1.520949, 3.909772, 0, 0.1607843, 1, 1,
0.4046684, -1.28987, 3.910251, 0, 0.1529412, 1, 1,
0.4056811, 0.6776267, 1.746914, 0, 0.1490196, 1, 1,
0.4082065, 1.194975, 0.3843554, 0, 0.1411765, 1, 1,
0.4083681, 1.462742, 0.7883286, 0, 0.1372549, 1, 1,
0.4086077, 0.5889347, 0.8845375, 0, 0.1294118, 1, 1,
0.4089323, 0.02533051, 1.36531, 0, 0.1254902, 1, 1,
0.4181887, -1.552146, 4.8398, 0, 0.1176471, 1, 1,
0.4217079, 0.6142895, 1.917136, 0, 0.1137255, 1, 1,
0.4228207, 1.17221, 1.359316, 0, 0.1058824, 1, 1,
0.4247496, 0.4310403, 0.2887756, 0, 0.09803922, 1, 1,
0.4265134, 0.9636378, 0.9249893, 0, 0.09411765, 1, 1,
0.4313339, -0.9119904, 2.339405, 0, 0.08627451, 1, 1,
0.4320878, 0.683188, -0.7349139, 0, 0.08235294, 1, 1,
0.4325847, 0.8176408, -0.7973571, 0, 0.07450981, 1, 1,
0.4326736, 0.2752895, 0.8096282, 0, 0.07058824, 1, 1,
0.4342427, 1.055854, 1.261892, 0, 0.0627451, 1, 1,
0.4347936, 0.6004984, 0.9268611, 0, 0.05882353, 1, 1,
0.4359485, -0.4907596, 1.768834, 0, 0.05098039, 1, 1,
0.4409094, 0.1310629, 3.517412, 0, 0.04705882, 1, 1,
0.4423698, 0.262804, 1.191879, 0, 0.03921569, 1, 1,
0.4467709, 0.1900389, 3.319256, 0, 0.03529412, 1, 1,
0.4503196, -1.416503, 3.243367, 0, 0.02745098, 1, 1,
0.452553, 0.2299969, 0.566158, 0, 0.02352941, 1, 1,
0.4628176, 1.642166, -0.3341505, 0, 0.01568628, 1, 1,
0.4657199, 2.358358, -0.7999473, 0, 0.01176471, 1, 1,
0.4658466, -0.4705879, 3.135738, 0, 0.003921569, 1, 1,
0.4666629, 0.2834036, 0.2606786, 0.003921569, 0, 1, 1,
0.4692737, 0.454535, -1.1104, 0.007843138, 0, 1, 1,
0.4714745, 0.3411255, 1.686642, 0.01568628, 0, 1, 1,
0.4776836, 1.104523, 0.9316525, 0.01960784, 0, 1, 1,
0.4787404, 1.437312, -0.2518731, 0.02745098, 0, 1, 1,
0.4796867, 0.2632323, 1.071757, 0.03137255, 0, 1, 1,
0.4815786, -0.4689307, 1.62289, 0.03921569, 0, 1, 1,
0.4821218, -1.503503, 2.557887, 0.04313726, 0, 1, 1,
0.4830391, -0.1894992, 0.2704014, 0.05098039, 0, 1, 1,
0.4835994, -1.219939, 1.940481, 0.05490196, 0, 1, 1,
0.4924399, 1.083109, 1.296773, 0.0627451, 0, 1, 1,
0.4932418, -0.8519973, 1.771713, 0.06666667, 0, 1, 1,
0.5017415, 0.9257237, 1.778365, 0.07450981, 0, 1, 1,
0.5030575, -0.981218, 2.841147, 0.07843138, 0, 1, 1,
0.5034204, 0.8331543, 0.6680481, 0.08627451, 0, 1, 1,
0.5044836, -0.05900179, 0.623971, 0.09019608, 0, 1, 1,
0.5046318, -1.770726, 2.619431, 0.09803922, 0, 1, 1,
0.5046821, -0.8747596, 1.651819, 0.1058824, 0, 1, 1,
0.5060109, -0.6004208, 4.593616, 0.1098039, 0, 1, 1,
0.5067995, -0.1965423, 2.262258, 0.1176471, 0, 1, 1,
0.5172166, 0.5995803, 2.042278, 0.1215686, 0, 1, 1,
0.5174414, -0.03292652, 2.157076, 0.1294118, 0, 1, 1,
0.5198684, -1.123237, 4.403199, 0.1333333, 0, 1, 1,
0.5210014, -0.5239333, 2.478046, 0.1411765, 0, 1, 1,
0.5244128, 1.214186, -2.407085, 0.145098, 0, 1, 1,
0.5247341, -0.5537953, 3.993153, 0.1529412, 0, 1, 1,
0.532076, -0.006414708, 2.441749, 0.1568628, 0, 1, 1,
0.5421396, -0.1285561, 1.546696, 0.1647059, 0, 1, 1,
0.5434939, -0.6814203, 3.946947, 0.1686275, 0, 1, 1,
0.5610445, 0.3313075, -0.06782018, 0.1764706, 0, 1, 1,
0.5639532, 0.09695042, 1.530434, 0.1803922, 0, 1, 1,
0.5661178, -0.7270169, 2.675815, 0.1882353, 0, 1, 1,
0.5667748, -1.445077, 3.268527, 0.1921569, 0, 1, 1,
0.5739712, 1.129959, 0.8874559, 0.2, 0, 1, 1,
0.577862, -0.1065798, 1.220555, 0.2078431, 0, 1, 1,
0.579334, -0.7992918, 2.799621, 0.2117647, 0, 1, 1,
0.5793353, 0.2263582, 1.694905, 0.2196078, 0, 1, 1,
0.5804369, -1.415817, 2.258927, 0.2235294, 0, 1, 1,
0.5825607, -0.9538684, 2.82634, 0.2313726, 0, 1, 1,
0.5833315, -2.155416, 1.400865, 0.2352941, 0, 1, 1,
0.585629, -0.3694119, 2.688782, 0.2431373, 0, 1, 1,
0.5878895, -0.822708, 3.072024, 0.2470588, 0, 1, 1,
0.5897402, -0.3157622, 1.73965, 0.254902, 0, 1, 1,
0.5921218, 0.1156636, 0.6027973, 0.2588235, 0, 1, 1,
0.5930465, -1.504297, 0.571831, 0.2666667, 0, 1, 1,
0.5949014, 1.048833, 0.7597018, 0.2705882, 0, 1, 1,
0.5964075, 0.6575602, 1.783001, 0.2784314, 0, 1, 1,
0.597317, 1.370999, 0.6386729, 0.282353, 0, 1, 1,
0.5988584, 0.3402094, -0.3059209, 0.2901961, 0, 1, 1,
0.6025077, 0.5959902, -1.194985, 0.2941177, 0, 1, 1,
0.6025515, -1.207082, 1.265674, 0.3019608, 0, 1, 1,
0.602789, -0.3731889, 3.150021, 0.3098039, 0, 1, 1,
0.6030908, -0.139488, 0.5361506, 0.3137255, 0, 1, 1,
0.6130471, -0.9319506, 3.989873, 0.3215686, 0, 1, 1,
0.6146874, 0.1158556, 2.091964, 0.3254902, 0, 1, 1,
0.616036, -0.752008, 1.097825, 0.3333333, 0, 1, 1,
0.6192408, 0.6401389, 0.2089949, 0.3372549, 0, 1, 1,
0.6218374, -0.1612439, 0.8301522, 0.345098, 0, 1, 1,
0.6267262, -0.7056687, 1.401449, 0.3490196, 0, 1, 1,
0.6281545, -1.311213, 1.187144, 0.3568628, 0, 1, 1,
0.6335467, -0.6761049, 2.796559, 0.3607843, 0, 1, 1,
0.6335519, -0.9605711, 2.684487, 0.3686275, 0, 1, 1,
0.6361675, -0.3250016, -0.05597447, 0.372549, 0, 1, 1,
0.6378325, 0.7845386, 0.4220576, 0.3803922, 0, 1, 1,
0.6389149, -0.1661701, 1.253801, 0.3843137, 0, 1, 1,
0.6451061, 0.3727317, 2.376657, 0.3921569, 0, 1, 1,
0.6503504, -1.335313, 3.032522, 0.3960784, 0, 1, 1,
0.65122, 0.1058034, 1.662561, 0.4039216, 0, 1, 1,
0.6513302, 1.111887, -0.1086527, 0.4117647, 0, 1, 1,
0.6514534, 0.9081894, -0.1780418, 0.4156863, 0, 1, 1,
0.6553146, -1.074615, 1.274831, 0.4235294, 0, 1, 1,
0.6555889, -0.8896326, 2.191131, 0.427451, 0, 1, 1,
0.6608953, -0.4114718, 2.812271, 0.4352941, 0, 1, 1,
0.6632305, 0.6397787, 0.7376435, 0.4392157, 0, 1, 1,
0.6644137, -1.542358, 3.737786, 0.4470588, 0, 1, 1,
0.6646457, -1.199348, 3.087404, 0.4509804, 0, 1, 1,
0.6666921, -0.276028, 2.376485, 0.4588235, 0, 1, 1,
0.6725208, 0.5311757, 2.009438, 0.4627451, 0, 1, 1,
0.6868623, -0.3767425, 2.819188, 0.4705882, 0, 1, 1,
0.6885888, 0.4008019, 1.180057, 0.4745098, 0, 1, 1,
0.6901845, 0.3446989, 1.908387, 0.4823529, 0, 1, 1,
0.6963254, -0.09496333, 0.9564632, 0.4862745, 0, 1, 1,
0.6968508, 1.42062, -0.3306938, 0.4941176, 0, 1, 1,
0.7002293, -0.8016953, 1.104476, 0.5019608, 0, 1, 1,
0.7066868, 0.5863272, -0.1355373, 0.5058824, 0, 1, 1,
0.7074121, -1.602228, 4.162409, 0.5137255, 0, 1, 1,
0.7108049, -1.328714, 2.893911, 0.5176471, 0, 1, 1,
0.7137185, -2.353809, 2.395295, 0.5254902, 0, 1, 1,
0.7140462, 0.0006119475, 0.6042086, 0.5294118, 0, 1, 1,
0.7193272, 1.09966, -0.8947695, 0.5372549, 0, 1, 1,
0.7203836, -1.935758, 1.557765, 0.5411765, 0, 1, 1,
0.721799, -1.130135, 3.186353, 0.5490196, 0, 1, 1,
0.7302919, 1.595596, -0.3286191, 0.5529412, 0, 1, 1,
0.7304901, 0.3630719, 3.78539, 0.5607843, 0, 1, 1,
0.7331756, -1.373384, 3.170101, 0.5647059, 0, 1, 1,
0.7351446, -0.8577743, 3.031847, 0.572549, 0, 1, 1,
0.73532, -0.275858, 1.588448, 0.5764706, 0, 1, 1,
0.735413, 0.806961, 0.2028828, 0.5843138, 0, 1, 1,
0.737243, -0.9769374, 4.287881, 0.5882353, 0, 1, 1,
0.739572, 1.690653, 0.7143056, 0.5960785, 0, 1, 1,
0.7516209, -0.04491593, 2.755522, 0.6039216, 0, 1, 1,
0.7535892, -1.208319, 2.935515, 0.6078432, 0, 1, 1,
0.7536855, 0.0295356, 1.238243, 0.6156863, 0, 1, 1,
0.7545981, -1.57694, 0.446195, 0.6196079, 0, 1, 1,
0.7554044, -0.1795754, 0.6666523, 0.627451, 0, 1, 1,
0.7561446, -1.245977, 2.519382, 0.6313726, 0, 1, 1,
0.7622418, 1.805129, -0.431143, 0.6392157, 0, 1, 1,
0.7622859, 0.7718501, 1.067197, 0.6431373, 0, 1, 1,
0.7653449, 0.06593137, 1.639521, 0.6509804, 0, 1, 1,
0.7685274, 1.007049, -0.3898055, 0.654902, 0, 1, 1,
0.7741896, 1.396318, 2.710336, 0.6627451, 0, 1, 1,
0.7833101, 0.9045513, 3.090648, 0.6666667, 0, 1, 1,
0.7860597, 1.955616, -0.1837622, 0.6745098, 0, 1, 1,
0.787015, 0.07345557, 1.914684, 0.6784314, 0, 1, 1,
0.7878528, -1.517897, 1.897969, 0.6862745, 0, 1, 1,
0.7897939, 2.139453, 1.315953, 0.6901961, 0, 1, 1,
0.7900431, 1.045946, 0.8018106, 0.6980392, 0, 1, 1,
0.7951806, -0.4671274, 2.247751, 0.7058824, 0, 1, 1,
0.7963169, 0.5176872, -0.04747329, 0.7098039, 0, 1, 1,
0.7982392, 0.119047, -0.08194771, 0.7176471, 0, 1, 1,
0.7991775, 1.645764, 0.1662433, 0.7215686, 0, 1, 1,
0.8009791, -1.009383, 4.526713, 0.7294118, 0, 1, 1,
0.801051, -1.512097, 2.208376, 0.7333333, 0, 1, 1,
0.8060933, 0.07890878, -0.9033626, 0.7411765, 0, 1, 1,
0.8062286, 1.030008, -0.1862427, 0.7450981, 0, 1, 1,
0.8122627, 0.05641862, 2.376144, 0.7529412, 0, 1, 1,
0.8133611, -0.5642055, 1.088303, 0.7568628, 0, 1, 1,
0.8230733, 0.1221713, 0.8770685, 0.7647059, 0, 1, 1,
0.8279097, -0.2967553, 3.736466, 0.7686275, 0, 1, 1,
0.8294505, 0.07167291, 1.816606, 0.7764706, 0, 1, 1,
0.8337434, -0.5287601, 1.52179, 0.7803922, 0, 1, 1,
0.8400216, -1.529274, 2.61392, 0.7882353, 0, 1, 1,
0.8469251, -1.324118, 2.064641, 0.7921569, 0, 1, 1,
0.8532434, 0.7588689, 1.025985, 0.8, 0, 1, 1,
0.8640944, 1.289111, 1.208494, 0.8078431, 0, 1, 1,
0.8658676, 0.6000596, 0.6744744, 0.8117647, 0, 1, 1,
0.8669454, -0.05623901, 1.3809, 0.8196079, 0, 1, 1,
0.8745178, 1.170519, 0.1433671, 0.8235294, 0, 1, 1,
0.8752424, 0.4388033, 1.285543, 0.8313726, 0, 1, 1,
0.8783011, 2.042066, -0.3571112, 0.8352941, 0, 1, 1,
0.87849, -0.1044381, 0.2991306, 0.8431373, 0, 1, 1,
0.8836851, -2.337079, 2.887488, 0.8470588, 0, 1, 1,
0.8837134, -1.730887, 1.829415, 0.854902, 0, 1, 1,
0.8866012, 0.2790567, 1.743604, 0.8588235, 0, 1, 1,
0.8866879, -0.9066873, 2.797566, 0.8666667, 0, 1, 1,
0.8937791, -0.4538397, 1.408343, 0.8705882, 0, 1, 1,
0.8945507, -0.7730815, 1.824298, 0.8784314, 0, 1, 1,
0.8984097, -1.719462, 2.096434, 0.8823529, 0, 1, 1,
0.9033684, 0.9462324, -0.4330772, 0.8901961, 0, 1, 1,
0.9063444, -1.122961, 5.404656, 0.8941177, 0, 1, 1,
0.9064842, 0.5939711, 2.429119, 0.9019608, 0, 1, 1,
0.9099129, -1.03175, 2.917727, 0.9098039, 0, 1, 1,
0.9135784, -0.03408814, 2.097796, 0.9137255, 0, 1, 1,
0.9156474, -0.339287, 1.548377, 0.9215686, 0, 1, 1,
0.9186921, -1.357018, 2.73795, 0.9254902, 0, 1, 1,
0.930172, -0.0408514, 0.4209833, 0.9333333, 0, 1, 1,
0.9321315, -1.109102, 3.006239, 0.9372549, 0, 1, 1,
0.9394242, -1.152059, 3.103319, 0.945098, 0, 1, 1,
0.9442689, -0.3368956, 1.536164, 0.9490196, 0, 1, 1,
0.9565017, -1.260498, 3.223461, 0.9568627, 0, 1, 1,
0.9606521, -0.5325572, 0.9274185, 0.9607843, 0, 1, 1,
0.9650736, -2.171187, 4.105511, 0.9686275, 0, 1, 1,
0.9765742, -1.159413, 1.979321, 0.972549, 0, 1, 1,
0.9788014, -0.1762667, 3.342058, 0.9803922, 0, 1, 1,
0.9838954, 0.3160712, 2.057772, 0.9843137, 0, 1, 1,
0.9852502, -0.9014046, 1.235072, 0.9921569, 0, 1, 1,
0.9855443, -1.160293, 3.062726, 0.9960784, 0, 1, 1,
0.9879773, 1.396192, 0.7113094, 1, 0, 0.9960784, 1,
0.9980806, 0.04031334, 0.5367451, 1, 0, 0.9882353, 1,
1.004636, -0.1468033, 2.640153, 1, 0, 0.9843137, 1,
1.006821, 0.6883062, 1.125627, 1, 0, 0.9764706, 1,
1.01244, 1.135176, 1.722255, 1, 0, 0.972549, 1,
1.017133, -1.762237, 3.125981, 1, 0, 0.9647059, 1,
1.019299, 0.1499658, 1.508056, 1, 0, 0.9607843, 1,
1.020025, 1.641848, 1.476994, 1, 0, 0.9529412, 1,
1.029297, -2.500908, 3.060685, 1, 0, 0.9490196, 1,
1.044975, -0.8018516, 2.638922, 1, 0, 0.9411765, 1,
1.049641, 0.6021844, 1.28625, 1, 0, 0.9372549, 1,
1.055684, -0.1322982, 1.510869, 1, 0, 0.9294118, 1,
1.057312, -0.6707576, 4.02564, 1, 0, 0.9254902, 1,
1.057743, -0.3850969, 1.754489, 1, 0, 0.9176471, 1,
1.059337, -0.03796642, 2.505608, 1, 0, 0.9137255, 1,
1.078214, 0.2547659, 0.4381121, 1, 0, 0.9058824, 1,
1.078513, -0.1959841, 1.437784, 1, 0, 0.9019608, 1,
1.079264, 0.9450191, -0.3922132, 1, 0, 0.8941177, 1,
1.08339, 1.006473, 2.987398, 1, 0, 0.8862745, 1,
1.084627, 0.6790658, 1.530591, 1, 0, 0.8823529, 1,
1.085951, 1.554068, 0.7936503, 1, 0, 0.8745098, 1,
1.092093, 0.05576837, 0.9815778, 1, 0, 0.8705882, 1,
1.093879, 0.5893798, 2.096786, 1, 0, 0.8627451, 1,
1.098478, 0.5995823, 1.908488, 1, 0, 0.8588235, 1,
1.098864, 1.297328, 1.607958, 1, 0, 0.8509804, 1,
1.103243, -0.1500439, 2.403291, 1, 0, 0.8470588, 1,
1.112236, -0.2381527, 3.00418, 1, 0, 0.8392157, 1,
1.115783, 1.502008, -0.001139762, 1, 0, 0.8352941, 1,
1.115868, 0.2903451, 1.476207, 1, 0, 0.827451, 1,
1.119305, 0.5356919, 0.5466812, 1, 0, 0.8235294, 1,
1.119572, 0.8380337, 1.273941, 1, 0, 0.8156863, 1,
1.121721, -0.1408957, 1.646836, 1, 0, 0.8117647, 1,
1.123318, -0.5844236, 1.542894, 1, 0, 0.8039216, 1,
1.123756, -0.225539, -0.008586064, 1, 0, 0.7960784, 1,
1.124104, -1.696643, 1.889573, 1, 0, 0.7921569, 1,
1.12548, -2.102823, 2.818591, 1, 0, 0.7843137, 1,
1.132963, 1.006078, 0.1404857, 1, 0, 0.7803922, 1,
1.133429, 1.410296, 0.2068811, 1, 0, 0.772549, 1,
1.13777, 0.03969712, 2.217602, 1, 0, 0.7686275, 1,
1.138194, 0.7499931, 1.537201, 1, 0, 0.7607843, 1,
1.139663, -0.5121245, 2.004402, 1, 0, 0.7568628, 1,
1.142965, -1.120972, 1.6877, 1, 0, 0.7490196, 1,
1.143534, -0.4909903, 1.130164, 1, 0, 0.7450981, 1,
1.16053, 0.02042562, 0.2496307, 1, 0, 0.7372549, 1,
1.164838, -1.804959, 1.285408, 1, 0, 0.7333333, 1,
1.165907, -0.6624696, 2.214536, 1, 0, 0.7254902, 1,
1.172557, 0.3703676, 2.257419, 1, 0, 0.7215686, 1,
1.176086, 0.772956, 0.4178018, 1, 0, 0.7137255, 1,
1.176151, -1.84896, 2.683824, 1, 0, 0.7098039, 1,
1.177915, -0.3965729, 2.880545, 1, 0, 0.7019608, 1,
1.180539, 0.109711, 1.094771, 1, 0, 0.6941177, 1,
1.182539, -0.4887224, 3.422163, 1, 0, 0.6901961, 1,
1.193386, -0.9095368, 3.506862, 1, 0, 0.682353, 1,
1.207506, 0.3263974, 3.546182, 1, 0, 0.6784314, 1,
1.207695, -1.576294, 4.332277, 1, 0, 0.6705883, 1,
1.219959, 1.620157, 0.5306282, 1, 0, 0.6666667, 1,
1.228082, 0.9997572, 0.8053076, 1, 0, 0.6588235, 1,
1.232006, -0.9795479, 2.213215, 1, 0, 0.654902, 1,
1.237081, 0.1738197, 0.05027347, 1, 0, 0.6470588, 1,
1.239905, -0.2240552, 1.790369, 1, 0, 0.6431373, 1,
1.241013, -1.47838, 3.610913, 1, 0, 0.6352941, 1,
1.241322, 0.06252213, 0.5837476, 1, 0, 0.6313726, 1,
1.241444, -0.4731358, 1.455709, 1, 0, 0.6235294, 1,
1.242069, -0.2767032, 2.594414, 1, 0, 0.6196079, 1,
1.242466, -0.8254422, 2.587479, 1, 0, 0.6117647, 1,
1.274468, 1.573188, 1.590651, 1, 0, 0.6078432, 1,
1.281157, -0.8148065, 1.246477, 1, 0, 0.6, 1,
1.287381, -0.004605739, 0.3535641, 1, 0, 0.5921569, 1,
1.290499, 1.804109, 1.0669, 1, 0, 0.5882353, 1,
1.291683, -1.078833, 1.6394, 1, 0, 0.5803922, 1,
1.29787, -1.445118, 2.035899, 1, 0, 0.5764706, 1,
1.306745, -0.1122774, 0.7982479, 1, 0, 0.5686275, 1,
1.307126, 0.9460675, 2.963619, 1, 0, 0.5647059, 1,
1.316506, 0.3812434, 1.827218, 1, 0, 0.5568628, 1,
1.322907, -0.7783695, 3.027125, 1, 0, 0.5529412, 1,
1.337071, 0.1128715, 0.7619782, 1, 0, 0.5450981, 1,
1.337542, 0.335861, 0.2360782, 1, 0, 0.5411765, 1,
1.341521, 0.3636318, 1.408611, 1, 0, 0.5333334, 1,
1.342337, 1.038536, 1.792457, 1, 0, 0.5294118, 1,
1.344715, -0.8113908, 1.147112, 1, 0, 0.5215687, 1,
1.347306, -2.904367, 2.287841, 1, 0, 0.5176471, 1,
1.350855, -1.950871, 1.721546, 1, 0, 0.509804, 1,
1.351975, 0.660984, 0.3345559, 1, 0, 0.5058824, 1,
1.35442, 0.1171964, 0.5673175, 1, 0, 0.4980392, 1,
1.36673, -1.156303, 1.864335, 1, 0, 0.4901961, 1,
1.367088, 0.5965871, 0.04990966, 1, 0, 0.4862745, 1,
1.37701, -0.2119438, 0.908236, 1, 0, 0.4784314, 1,
1.379182, 0.7544976, 0.2821276, 1, 0, 0.4745098, 1,
1.405512, -0.8619746, 1.258088, 1, 0, 0.4666667, 1,
1.416076, 0.07062513, 0.7764043, 1, 0, 0.4627451, 1,
1.416928, -0.9883502, 1.028739, 1, 0, 0.454902, 1,
1.420715, -1.244958, 3.840006, 1, 0, 0.4509804, 1,
1.426567, -1.704271, 2.6423, 1, 0, 0.4431373, 1,
1.427269, -1.176419, 2.645386, 1, 0, 0.4392157, 1,
1.436942, -1.641044, 2.963829, 1, 0, 0.4313726, 1,
1.448888, -0.4077984, 1.810128, 1, 0, 0.427451, 1,
1.45471, -0.3315785, 2.396032, 1, 0, 0.4196078, 1,
1.45472, -0.4005038, 0.6432641, 1, 0, 0.4156863, 1,
1.461408, -0.3402185, 2.861479, 1, 0, 0.4078431, 1,
1.466427, 0.4238781, 0.5627346, 1, 0, 0.4039216, 1,
1.509817, -1.073363, 2.921344, 1, 0, 0.3960784, 1,
1.511966, -0.7458946, 3.047915, 1, 0, 0.3882353, 1,
1.513966, 0.3535889, 0.2476347, 1, 0, 0.3843137, 1,
1.514423, -1.312869, 0.2330125, 1, 0, 0.3764706, 1,
1.515516, 0.5318283, 0.8223956, 1, 0, 0.372549, 1,
1.518859, -1.295365, 0.008459141, 1, 0, 0.3647059, 1,
1.526217, -0.2654563, 1.900853, 1, 0, 0.3607843, 1,
1.535141, 1.508731, 0.8222485, 1, 0, 0.3529412, 1,
1.53951, 1.431242, 3.193376, 1, 0, 0.3490196, 1,
1.551946, -0.3878866, -0.4407066, 1, 0, 0.3411765, 1,
1.561449, -0.1348359, 2.424459, 1, 0, 0.3372549, 1,
1.564455, 1.025212, 1.792572, 1, 0, 0.3294118, 1,
1.565026, 0.8830534, 0.7480499, 1, 0, 0.3254902, 1,
1.579307, 0.08821752, 1.135498, 1, 0, 0.3176471, 1,
1.58146, -0.3327121, 1.904949, 1, 0, 0.3137255, 1,
1.59445, -2.519561, 1.811938, 1, 0, 0.3058824, 1,
1.60079, -1.109225, 2.115892, 1, 0, 0.2980392, 1,
1.609724, 0.06697299, 1.817757, 1, 0, 0.2941177, 1,
1.611993, -0.4193266, 1.54674, 1, 0, 0.2862745, 1,
1.630037, -0.01355215, -0.1255422, 1, 0, 0.282353, 1,
1.667417, 0.2349712, 2.145809, 1, 0, 0.2745098, 1,
1.670898, 1.982184, -0.2906414, 1, 0, 0.2705882, 1,
1.678616, 0.7214342, 1.22292, 1, 0, 0.2627451, 1,
1.678625, -0.4531903, 2.222237, 1, 0, 0.2588235, 1,
1.679281, -0.7826625, 1.0746, 1, 0, 0.2509804, 1,
1.686088, 1.325577, 2.766625, 1, 0, 0.2470588, 1,
1.702107, -1.044274, 4.668199, 1, 0, 0.2392157, 1,
1.720398, 0.9762298, -0.09721808, 1, 0, 0.2352941, 1,
1.72405, 2.21488, 0.3049226, 1, 0, 0.227451, 1,
1.732464, 0.9698411, 0.5558083, 1, 0, 0.2235294, 1,
1.735422, -2.908056, 3.205906, 1, 0, 0.2156863, 1,
1.749467, -2.273604, 3.373315, 1, 0, 0.2117647, 1,
1.757866, -0.1089704, 1.521004, 1, 0, 0.2039216, 1,
1.760505, 0.8061165, 1.178058, 1, 0, 0.1960784, 1,
1.773845, -0.4092756, 0.7995989, 1, 0, 0.1921569, 1,
1.787158, -1.88891, 3.374425, 1, 0, 0.1843137, 1,
1.791069, 0.9714549, 2.35465, 1, 0, 0.1803922, 1,
1.798825, 0.8377411, 0.5150484, 1, 0, 0.172549, 1,
1.805087, -0.7108484, 2.75692, 1, 0, 0.1686275, 1,
1.806368, 0.8680856, 0.7218783, 1, 0, 0.1607843, 1,
1.812022, -1.503206, 1.411986, 1, 0, 0.1568628, 1,
1.83121, -0.5285192, 0.933758, 1, 0, 0.1490196, 1,
1.83231, 0.8838742, 0.6895289, 1, 0, 0.145098, 1,
1.860789, 0.158085, 1.165144, 1, 0, 0.1372549, 1,
1.867138, -0.1681933, 2.76963, 1, 0, 0.1333333, 1,
1.887896, -0.5758342, 2.340623, 1, 0, 0.1254902, 1,
1.910532, -0.8059449, 3.947377, 1, 0, 0.1215686, 1,
1.921424, -0.09953058, 0.3434076, 1, 0, 0.1137255, 1,
1.951941, -1.451717, 2.679613, 1, 0, 0.1098039, 1,
1.961104, -2.060179, 3.375228, 1, 0, 0.1019608, 1,
2.016639, -0.23936, -0.1071428, 1, 0, 0.09411765, 1,
2.036768, -0.2331107, 1.602661, 1, 0, 0.09019608, 1,
2.047778, 1.296039, 0.1126958, 1, 0, 0.08235294, 1,
2.060354, -1.188263, 2.875026, 1, 0, 0.07843138, 1,
2.06989, 0.02307045, 2.877288, 1, 0, 0.07058824, 1,
2.096536, 1.386302, 1.04561, 1, 0, 0.06666667, 1,
2.219477, 1.112559, 1.9533, 1, 0, 0.05882353, 1,
2.22874, -1.229757, 1.857469, 1, 0, 0.05490196, 1,
2.237489, 1.255562, 0.9011178, 1, 0, 0.04705882, 1,
2.293097, -0.9922953, 0.8968114, 1, 0, 0.04313726, 1,
2.32959, 0.4962462, 1.057555, 1, 0, 0.03529412, 1,
2.448502, -0.4210232, 2.117126, 1, 0, 0.03137255, 1,
2.472844, 1.066322, 0.7480766, 1, 0, 0.02352941, 1,
2.665226, 0.0364525, 1.158048, 1, 0, 0.01960784, 1,
2.745121, 0.7294, 1.693026, 1, 0, 0.01176471, 1,
2.94726, -0.4495543, 2.582049, 1, 0, 0.007843138, 1
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
-0.2114912, -3.935845, -7.050073, 0, -0.5, 0.5, 0.5,
-0.2114912, -3.935845, -7.050073, 1, -0.5, 0.5, 0.5,
-0.2114912, -3.935845, -7.050073, 1, 1.5, 0.5, 0.5,
-0.2114912, -3.935845, -7.050073, 0, 1.5, 0.5, 0.5
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
-4.441059, 0.1237692, -7.050073, 0, -0.5, 0.5, 0.5,
-4.441059, 0.1237692, -7.050073, 1, -0.5, 0.5, 0.5,
-4.441059, 0.1237692, -7.050073, 1, 1.5, 0.5, 0.5,
-4.441059, 0.1237692, -7.050073, 0, 1.5, 0.5, 0.5
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
-4.441059, -3.935845, 0.2556827, 0, -0.5, 0.5, 0.5,
-4.441059, -3.935845, 0.2556827, 1, -0.5, 0.5, 0.5,
-4.441059, -3.935845, 0.2556827, 1, 1.5, 0.5, 0.5,
-4.441059, -3.935845, 0.2556827, 0, 1.5, 0.5, 0.5
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
-3, -2.999011, -5.364129,
2, -2.999011, -5.364129,
-3, -2.999011, -5.364129,
-3, -3.15515, -5.64512,
-2, -2.999011, -5.364129,
-2, -3.15515, -5.64512,
-1, -2.999011, -5.364129,
-1, -3.15515, -5.64512,
0, -2.999011, -5.364129,
0, -3.15515, -5.64512,
1, -2.999011, -5.364129,
1, -3.15515, -5.64512,
2, -2.999011, -5.364129,
2, -3.15515, -5.64512
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
-3, -3.467428, -6.207101, 0, -0.5, 0.5, 0.5,
-3, -3.467428, -6.207101, 1, -0.5, 0.5, 0.5,
-3, -3.467428, -6.207101, 1, 1.5, 0.5, 0.5,
-3, -3.467428, -6.207101, 0, 1.5, 0.5, 0.5,
-2, -3.467428, -6.207101, 0, -0.5, 0.5, 0.5,
-2, -3.467428, -6.207101, 1, -0.5, 0.5, 0.5,
-2, -3.467428, -6.207101, 1, 1.5, 0.5, 0.5,
-2, -3.467428, -6.207101, 0, 1.5, 0.5, 0.5,
-1, -3.467428, -6.207101, 0, -0.5, 0.5, 0.5,
-1, -3.467428, -6.207101, 1, -0.5, 0.5, 0.5,
-1, -3.467428, -6.207101, 1, 1.5, 0.5, 0.5,
-1, -3.467428, -6.207101, 0, 1.5, 0.5, 0.5,
0, -3.467428, -6.207101, 0, -0.5, 0.5, 0.5,
0, -3.467428, -6.207101, 1, -0.5, 0.5, 0.5,
0, -3.467428, -6.207101, 1, 1.5, 0.5, 0.5,
0, -3.467428, -6.207101, 0, 1.5, 0.5, 0.5,
1, -3.467428, -6.207101, 0, -0.5, 0.5, 0.5,
1, -3.467428, -6.207101, 1, -0.5, 0.5, 0.5,
1, -3.467428, -6.207101, 1, 1.5, 0.5, 0.5,
1, -3.467428, -6.207101, 0, 1.5, 0.5, 0.5,
2, -3.467428, -6.207101, 0, -0.5, 0.5, 0.5,
2, -3.467428, -6.207101, 1, -0.5, 0.5, 0.5,
2, -3.467428, -6.207101, 1, 1.5, 0.5, 0.5,
2, -3.467428, -6.207101, 0, 1.5, 0.5, 0.5
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
-3.465005, -2, -5.364129,
-3.465005, 3, -5.364129,
-3.465005, -2, -5.364129,
-3.62768, -2, -5.64512,
-3.465005, -1, -5.364129,
-3.62768, -1, -5.64512,
-3.465005, 0, -5.364129,
-3.62768, 0, -5.64512,
-3.465005, 1, -5.364129,
-3.62768, 1, -5.64512,
-3.465005, 2, -5.364129,
-3.62768, 2, -5.64512,
-3.465005, 3, -5.364129,
-3.62768, 3, -5.64512
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
-3.953032, -2, -6.207101, 0, -0.5, 0.5, 0.5,
-3.953032, -2, -6.207101, 1, -0.5, 0.5, 0.5,
-3.953032, -2, -6.207101, 1, 1.5, 0.5, 0.5,
-3.953032, -2, -6.207101, 0, 1.5, 0.5, 0.5,
-3.953032, -1, -6.207101, 0, -0.5, 0.5, 0.5,
-3.953032, -1, -6.207101, 1, -0.5, 0.5, 0.5,
-3.953032, -1, -6.207101, 1, 1.5, 0.5, 0.5,
-3.953032, -1, -6.207101, 0, 1.5, 0.5, 0.5,
-3.953032, 0, -6.207101, 0, -0.5, 0.5, 0.5,
-3.953032, 0, -6.207101, 1, -0.5, 0.5, 0.5,
-3.953032, 0, -6.207101, 1, 1.5, 0.5, 0.5,
-3.953032, 0, -6.207101, 0, 1.5, 0.5, 0.5,
-3.953032, 1, -6.207101, 0, -0.5, 0.5, 0.5,
-3.953032, 1, -6.207101, 1, -0.5, 0.5, 0.5,
-3.953032, 1, -6.207101, 1, 1.5, 0.5, 0.5,
-3.953032, 1, -6.207101, 0, 1.5, 0.5, 0.5,
-3.953032, 2, -6.207101, 0, -0.5, 0.5, 0.5,
-3.953032, 2, -6.207101, 1, -0.5, 0.5, 0.5,
-3.953032, 2, -6.207101, 1, 1.5, 0.5, 0.5,
-3.953032, 2, -6.207101, 0, 1.5, 0.5, 0.5,
-3.953032, 3, -6.207101, 0, -0.5, 0.5, 0.5,
-3.953032, 3, -6.207101, 1, -0.5, 0.5, 0.5,
-3.953032, 3, -6.207101, 1, 1.5, 0.5, 0.5,
-3.953032, 3, -6.207101, 0, 1.5, 0.5, 0.5
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
-3.465005, -2.999011, -4,
-3.465005, -2.999011, 4,
-3.465005, -2.999011, -4,
-3.62768, -3.15515, -4,
-3.465005, -2.999011, -2,
-3.62768, -3.15515, -2,
-3.465005, -2.999011, 0,
-3.62768, -3.15515, 0,
-3.465005, -2.999011, 2,
-3.62768, -3.15515, 2,
-3.465005, -2.999011, 4,
-3.62768, -3.15515, 4
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
-3.953032, -3.467428, -4, 0, -0.5, 0.5, 0.5,
-3.953032, -3.467428, -4, 1, -0.5, 0.5, 0.5,
-3.953032, -3.467428, -4, 1, 1.5, 0.5, 0.5,
-3.953032, -3.467428, -4, 0, 1.5, 0.5, 0.5,
-3.953032, -3.467428, -2, 0, -0.5, 0.5, 0.5,
-3.953032, -3.467428, -2, 1, -0.5, 0.5, 0.5,
-3.953032, -3.467428, -2, 1, 1.5, 0.5, 0.5,
-3.953032, -3.467428, -2, 0, 1.5, 0.5, 0.5,
-3.953032, -3.467428, 0, 0, -0.5, 0.5, 0.5,
-3.953032, -3.467428, 0, 1, -0.5, 0.5, 0.5,
-3.953032, -3.467428, 0, 1, 1.5, 0.5, 0.5,
-3.953032, -3.467428, 0, 0, 1.5, 0.5, 0.5,
-3.953032, -3.467428, 2, 0, -0.5, 0.5, 0.5,
-3.953032, -3.467428, 2, 1, -0.5, 0.5, 0.5,
-3.953032, -3.467428, 2, 1, 1.5, 0.5, 0.5,
-3.953032, -3.467428, 2, 0, 1.5, 0.5, 0.5,
-3.953032, -3.467428, 4, 0, -0.5, 0.5, 0.5,
-3.953032, -3.467428, 4, 1, -0.5, 0.5, 0.5,
-3.953032, -3.467428, 4, 1, 1.5, 0.5, 0.5,
-3.953032, -3.467428, 4, 0, 1.5, 0.5, 0.5
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
-3.465005, -2.999011, -5.364129,
-3.465005, 3.246549, -5.364129,
-3.465005, -2.999011, 5.875494,
-3.465005, 3.246549, 5.875494,
-3.465005, -2.999011, -5.364129,
-3.465005, -2.999011, 5.875494,
-3.465005, 3.246549, -5.364129,
-3.465005, 3.246549, 5.875494,
-3.465005, -2.999011, -5.364129,
3.042022, -2.999011, -5.364129,
-3.465005, -2.999011, 5.875494,
3.042022, -2.999011, 5.875494,
-3.465005, 3.246549, -5.364129,
3.042022, 3.246549, -5.364129,
-3.465005, 3.246549, 5.875494,
3.042022, 3.246549, 5.875494,
3.042022, -2.999011, -5.364129,
3.042022, 3.246549, -5.364129,
3.042022, -2.999011, 5.875494,
3.042022, 3.246549, 5.875494,
3.042022, -2.999011, -5.364129,
3.042022, -2.999011, 5.875494,
3.042022, 3.246549, -5.364129,
3.042022, 3.246549, 5.875494
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
var radius = 7.695206;
var distance = 34.23684;
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
mvMatrix.translate( 0.2114912, -0.1237692, -0.2556827 );
mvMatrix.scale( 1.27865, 1.33218, 0.7402568 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.23684);
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
disodium_arsenate_di<-read.table("disodium_arsenate_di.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 5 elements
```

```r
x<-disodium_arsenate_di$V2
```

```
## Error in eval(expr, envir, enclos): object 'disodium_arsenate_di' not found
```

```r
y<-disodium_arsenate_di$V3
```

```
## Error in eval(expr, envir, enclos): object 'disodium_arsenate_di' not found
```

```r
z<-disodium_arsenate_di$V4
```

```
## Error in eval(expr, envir, enclos): object 'disodium_arsenate_di' not found
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
-3.370242, 0.8107454, -0.6170861, 0, 0, 1, 1, 1,
-2.998499, 1.379199, -0.4654776, 1, 0, 0, 1, 1,
-2.969121, -1.612301, -1.874388, 1, 0, 0, 1, 1,
-2.793068, 0.6510473, -1.951064, 1, 0, 0, 1, 1,
-2.741004, -0.3472504, -2.527934, 1, 0, 0, 1, 1,
-2.705466, 0.9296088, -0.7704983, 1, 0, 0, 1, 1,
-2.415009, 1.177067, -1.073618, 0, 0, 0, 1, 1,
-2.392903, -0.03476745, 0.5604631, 0, 0, 0, 1, 1,
-2.356317, -1.079508, -2.165841, 0, 0, 0, 1, 1,
-2.294446, 0.287919, -1.202747, 0, 0, 0, 1, 1,
-2.238587, -1.923792, -3.644546, 0, 0, 0, 1, 1,
-2.200061, -0.02344353, -1.723945, 0, 0, 0, 1, 1,
-2.156921, -0.9264971, -1.557508, 0, 0, 0, 1, 1,
-2.139735, -1.603743, -0.2438809, 1, 1, 1, 1, 1,
-2.06977, -0.9578163, 0.8803837, 1, 1, 1, 1, 1,
-2.045636, -0.6111757, -2.823123, 1, 1, 1, 1, 1,
-1.998579, 0.3027025, -1.993881, 1, 1, 1, 1, 1,
-1.93974, 0.8133188, -0.9972786, 1, 1, 1, 1, 1,
-1.937823, -1.672543, -1.63436, 1, 1, 1, 1, 1,
-1.919131, 0.1494413, -0.1754728, 1, 1, 1, 1, 1,
-1.91257, -1.589441, -2.955057, 1, 1, 1, 1, 1,
-1.891472, -1.272222, -0.3448317, 1, 1, 1, 1, 1,
-1.86649, -1.485333, -0.9930344, 1, 1, 1, 1, 1,
-1.861548, -1.286139, -2.382915, 1, 1, 1, 1, 1,
-1.854168, -1.763238, -2.245969, 1, 1, 1, 1, 1,
-1.820816, 0.6957883, -3.362294, 1, 1, 1, 1, 1,
-1.805624, 0.4092056, -0.7271909, 1, 1, 1, 1, 1,
-1.794863, -0.5669975, -3.949298, 1, 1, 1, 1, 1,
-1.794627, 0.3062395, 1.839274, 0, 0, 1, 1, 1,
-1.778436, 2.165139, 0.173257, 1, 0, 0, 1, 1,
-1.746141, 0.1164448, -1.37389, 1, 0, 0, 1, 1,
-1.737932, 1.192843, -0.2813175, 1, 0, 0, 1, 1,
-1.731253, -1.759831, -1.908013, 1, 0, 0, 1, 1,
-1.729138, -0.9847118, -1.952802, 1, 0, 0, 1, 1,
-1.72876, 1.64204, -0.968242, 0, 0, 0, 1, 1,
-1.727625, 0.8550613, -1.300241, 0, 0, 0, 1, 1,
-1.722407, 0.4290355, -0.9051607, 0, 0, 0, 1, 1,
-1.707189, 0.9969415, -0.7516697, 0, 0, 0, 1, 1,
-1.69773, 0.01202486, -1.491548, 0, 0, 0, 1, 1,
-1.694836, -0.6548842, -2.979941, 0, 0, 0, 1, 1,
-1.688002, -0.8187832, -0.2740653, 0, 0, 0, 1, 1,
-1.687582, 0.9029854, -1.017366, 1, 1, 1, 1, 1,
-1.674905, 1.015332, -1.332221, 1, 1, 1, 1, 1,
-1.666839, -0.2810094, -3.128588, 1, 1, 1, 1, 1,
-1.655542, -0.0846651, -2.230561, 1, 1, 1, 1, 1,
-1.635713, -0.2491487, -0.58206, 1, 1, 1, 1, 1,
-1.596361, -0.3816508, -2.933536, 1, 1, 1, 1, 1,
-1.593025, 1.414314, -2.690058, 1, 1, 1, 1, 1,
-1.591809, -1.279475, -1.760989, 1, 1, 1, 1, 1,
-1.581139, 0.4796574, -2.287855, 1, 1, 1, 1, 1,
-1.557313, -0.8027609, -3.880109, 1, 1, 1, 1, 1,
-1.552506, 0.6194752, -1.265827, 1, 1, 1, 1, 1,
-1.533672, 0.9822108, -0.1908318, 1, 1, 1, 1, 1,
-1.531027, -0.4481966, -2.072064, 1, 1, 1, 1, 1,
-1.514112, 1.189376, -3.037126, 1, 1, 1, 1, 1,
-1.513894, -2.339177, -4.08706, 1, 1, 1, 1, 1,
-1.508654, -1.656672, -2.597734, 0, 0, 1, 1, 1,
-1.508115, 0.4822775, -1.369403, 1, 0, 0, 1, 1,
-1.486231, 0.8846891, 0.6855085, 1, 0, 0, 1, 1,
-1.485041, 2.111583, 0.1087421, 1, 0, 0, 1, 1,
-1.484796, -0.3238255, -1.93514, 1, 0, 0, 1, 1,
-1.474896, -1.426939, -3.05402, 1, 0, 0, 1, 1,
-1.470302, 0.3463845, -2.105918, 0, 0, 0, 1, 1,
-1.456967, -0.2272119, 0.6111992, 0, 0, 0, 1, 1,
-1.452363, -0.2837891, -2.684177, 0, 0, 0, 1, 1,
-1.445942, -1.14328, -1.446297, 0, 0, 0, 1, 1,
-1.444654, 0.4415168, -1.464308, 0, 0, 0, 1, 1,
-1.438555, -1.104964, -1.610371, 0, 0, 0, 1, 1,
-1.436983, 1.357751, -2.63179, 0, 0, 0, 1, 1,
-1.43374, -0.0175727, -0.9488932, 1, 1, 1, 1, 1,
-1.433342, -1.393988, -3.090117, 1, 1, 1, 1, 1,
-1.424785, 0.0250567, -0.7095205, 1, 1, 1, 1, 1,
-1.423316, 1.286329, -1.492064, 1, 1, 1, 1, 1,
-1.418818, 0.3538616, -1.989622, 1, 1, 1, 1, 1,
-1.416341, 3.155595, 0.0116867, 1, 1, 1, 1, 1,
-1.409533, -0.7069275, -1.148723, 1, 1, 1, 1, 1,
-1.404927, -0.8366156, -0.9289108, 1, 1, 1, 1, 1,
-1.389618, 0.7436181, -0.9943547, 1, 1, 1, 1, 1,
-1.383501, 0.379014, -1.881258, 1, 1, 1, 1, 1,
-1.380267, 1.337053, -0.04651956, 1, 1, 1, 1, 1,
-1.378295, 1.00674, -0.1045932, 1, 1, 1, 1, 1,
-1.371935, -0.04380179, -1.770616, 1, 1, 1, 1, 1,
-1.367731, 0.5568244, -0.5345412, 1, 1, 1, 1, 1,
-1.351129, -0.8564038, -2.721072, 1, 1, 1, 1, 1,
-1.336958, -0.3799964, -0.1366803, 0, 0, 1, 1, 1,
-1.318556, -1.234992, -2.813822, 1, 0, 0, 1, 1,
-1.316191, 1.473003, -1.184018, 1, 0, 0, 1, 1,
-1.31303, -0.1983188, -1.555122, 1, 0, 0, 1, 1,
-1.308905, 0.36257, -0.3275313, 1, 0, 0, 1, 1,
-1.308889, 1.067455, -1.482125, 1, 0, 0, 1, 1,
-1.298446, -0.6985276, -1.977423, 0, 0, 0, 1, 1,
-1.293259, 0.3394112, -0.2806289, 0, 0, 0, 1, 1,
-1.286919, -1.661602, -1.676565, 0, 0, 0, 1, 1,
-1.286026, 0.6141539, -2.405764, 0, 0, 0, 1, 1,
-1.280414, -0.6816118, -2.542271, 0, 0, 0, 1, 1,
-1.275425, -0.659595, -1.278605, 0, 0, 0, 1, 1,
-1.272649, 1.678764, -1.550138, 0, 0, 0, 1, 1,
-1.266726, -1.049392, -2.973586, 1, 1, 1, 1, 1,
-1.253936, -1.811101, -2.819797, 1, 1, 1, 1, 1,
-1.253268, -0.05386063, -0.2913368, 1, 1, 1, 1, 1,
-1.249758, 1.10297, -2.164695, 1, 1, 1, 1, 1,
-1.249264, 0.475321, -1.76131, 1, 1, 1, 1, 1,
-1.24587, -1.750907, -2.710797, 1, 1, 1, 1, 1,
-1.243701, -1.392127, -2.295882, 1, 1, 1, 1, 1,
-1.24005, 0.611775, -0.7860781, 1, 1, 1, 1, 1,
-1.239618, -0.0140246, -0.8443032, 1, 1, 1, 1, 1,
-1.232744, 0.9907719, -2.150957, 1, 1, 1, 1, 1,
-1.205215, 1.036702, -0.9623226, 1, 1, 1, 1, 1,
-1.203663, 0.8285335, -0.01925733, 1, 1, 1, 1, 1,
-1.200104, 0.6190591, 0.02969006, 1, 1, 1, 1, 1,
-1.193999, -0.1895684, -3.809054, 1, 1, 1, 1, 1,
-1.179553, 1.155136, 0.3912168, 1, 1, 1, 1, 1,
-1.175908, -0.5233883, -3.385943, 0, 0, 1, 1, 1,
-1.174682, 0.8321764, -1.700132, 1, 0, 0, 1, 1,
-1.174107, -1.252344, -2.805181, 1, 0, 0, 1, 1,
-1.167646, -0.6452505, -2.665918, 1, 0, 0, 1, 1,
-1.149244, -0.4059231, -3.104938, 1, 0, 0, 1, 1,
-1.141114, -0.1998694, -1.772461, 1, 0, 0, 1, 1,
-1.128784, 0.5589337, 0.2982199, 0, 0, 0, 1, 1,
-1.115252, -0.8799277, -3.994566, 0, 0, 0, 1, 1,
-1.113249, 1.273085, -0.8411617, 0, 0, 0, 1, 1,
-1.112105, -0.1307768, -2.957577, 0, 0, 0, 1, 1,
-1.111145, -0.0428775, -0.76697, 0, 0, 0, 1, 1,
-1.107005, 2.026561, 0.08502796, 0, 0, 0, 1, 1,
-1.103461, 0.1331026, -1.112198, 0, 0, 0, 1, 1,
-1.102644, 0.004259775, -2.664598, 1, 1, 1, 1, 1,
-1.090511, 0.4042373, -0.0910167, 1, 1, 1, 1, 1,
-1.088695, -0.3411348, -1.355682, 1, 1, 1, 1, 1,
-1.0785, -0.9520039, -2.080487, 1, 1, 1, 1, 1,
-1.072818, 0.2664536, -1.035986, 1, 1, 1, 1, 1,
-1.06522, -0.5246682, -2.529801, 1, 1, 1, 1, 1,
-1.0648, 1.518167, 1.412133, 1, 1, 1, 1, 1,
-1.054386, -1.516946, -4.425242, 1, 1, 1, 1, 1,
-1.050516, -0.1322443, -1.194262, 1, 1, 1, 1, 1,
-1.050279, -0.1454742, -1.077953, 1, 1, 1, 1, 1,
-1.048729, -0.4996116, -1.497219, 1, 1, 1, 1, 1,
-1.038141, -1.265565, -2.44091, 1, 1, 1, 1, 1,
-1.031559, 0.1882158, -1.038569, 1, 1, 1, 1, 1,
-1.026527, -2.311079, -1.081215, 1, 1, 1, 1, 1,
-1.026336, 0.8782048, 0.7585651, 1, 1, 1, 1, 1,
-1.02297, -0.6072855, -3.633787, 0, 0, 1, 1, 1,
-1.013675, 1.86152, 0.6702014, 1, 0, 0, 1, 1,
-1.012444, -0.8827316, -2.866908, 1, 0, 0, 1, 1,
-1.004321, 0.8134605, -0.6461259, 1, 0, 0, 1, 1,
-1.002959, -0.7301031, -2.847904, 1, 0, 0, 1, 1,
-0.9916999, -0.3917975, -2.359877, 1, 0, 0, 1, 1,
-0.9859524, -0.1147913, -2.737733, 0, 0, 0, 1, 1,
-0.9806837, -1.532226, -2.71876, 0, 0, 0, 1, 1,
-0.9790893, -0.6466645, -1.778971, 0, 0, 0, 1, 1,
-0.9770179, 1.385441, -2.114733, 0, 0, 0, 1, 1,
-0.9652274, -0.1001647, -4.187666, 0, 0, 0, 1, 1,
-0.9612151, -1.181015, -2.030179, 0, 0, 0, 1, 1,
-0.9580519, -0.2889177, -3.087138, 0, 0, 0, 1, 1,
-0.9554225, -0.1205742, -0.9021285, 1, 1, 1, 1, 1,
-0.9554102, 0.4429465, -1.98856, 1, 1, 1, 1, 1,
-0.9553771, -0.4266417, -3.451142, 1, 1, 1, 1, 1,
-0.9536172, -1.183598, -2.196027, 1, 1, 1, 1, 1,
-0.9499545, -0.5556195, -1.107865, 1, 1, 1, 1, 1,
-0.9334661, -0.8338816, -2.243581, 1, 1, 1, 1, 1,
-0.9313667, -1.130774, -2.81971, 1, 1, 1, 1, 1,
-0.9300674, 0.837585, -2.408775, 1, 1, 1, 1, 1,
-0.928188, -0.7901384, -4.266123, 1, 1, 1, 1, 1,
-0.9278852, -0.7032532, -1.780854, 1, 1, 1, 1, 1,
-0.9276735, 0.2623784, -0.7794948, 1, 1, 1, 1, 1,
-0.9258795, -0.9342241, -3.271687, 1, 1, 1, 1, 1,
-0.9252185, -1.197813, -2.092877, 1, 1, 1, 1, 1,
-0.923292, 0.5993578, -1.15563, 1, 1, 1, 1, 1,
-0.9215214, -0.9781734, -0.5325288, 1, 1, 1, 1, 1,
-0.921307, -0.7335028, -2.925158, 0, 0, 1, 1, 1,
-0.9205222, 0.1042126, -0.7904406, 1, 0, 0, 1, 1,
-0.9198781, -1.152907, -0.6345832, 1, 0, 0, 1, 1,
-0.9195258, 0.5884178, -1.269096, 1, 0, 0, 1, 1,
-0.9124901, -0.4153112, -1.394308, 1, 0, 0, 1, 1,
-0.9067729, -0.2156712, 0.3298484, 1, 0, 0, 1, 1,
-0.896602, -0.6041241, -3.055225, 0, 0, 0, 1, 1,
-0.8929053, -0.1664924, -1.782946, 0, 0, 0, 1, 1,
-0.8917317, 1.325532, 1.068393, 0, 0, 0, 1, 1,
-0.8907138, 0.6248274, 0.05146609, 0, 0, 0, 1, 1,
-0.8813713, -0.6261669, -2.26305, 0, 0, 0, 1, 1,
-0.8759159, -0.5972446, -1.946484, 0, 0, 0, 1, 1,
-0.8727519, -0.1904776, 0.06582692, 0, 0, 0, 1, 1,
-0.865514, 1.1466, -1.622935, 1, 1, 1, 1, 1,
-0.8498798, -0.4217986, -1.450377, 1, 1, 1, 1, 1,
-0.8415651, -0.4188246, -0.5004852, 1, 1, 1, 1, 1,
-0.8343408, 1.803614, 0.1995712, 1, 1, 1, 1, 1,
-0.8294669, -1.128357, -2.137753, 1, 1, 1, 1, 1,
-0.8269702, 0.6252296, 0.1215004, 1, 1, 1, 1, 1,
-0.8255442, -1.658002, -3.554199, 1, 1, 1, 1, 1,
-0.8243542, 0.5963218, -0.7932441, 1, 1, 1, 1, 1,
-0.8165488, -0.6111715, -4.059003, 1, 1, 1, 1, 1,
-0.8161489, -1.049832, -1.053179, 1, 1, 1, 1, 1,
-0.8161266, -1.571376, -2.96997, 1, 1, 1, 1, 1,
-0.8134993, -0.7284693, 0.7240707, 1, 1, 1, 1, 1,
-0.8120695, -0.7226546, -3.017819, 1, 1, 1, 1, 1,
-0.81062, -0.1427594, -2.127612, 1, 1, 1, 1, 1,
-0.8074384, 0.6605322, -0.5628877, 1, 1, 1, 1, 1,
-0.8057807, 0.170229, -0.8695012, 0, 0, 1, 1, 1,
-0.796251, 0.9575852, 0.06851524, 1, 0, 0, 1, 1,
-0.7957913, 0.1293169, -1.315185, 1, 0, 0, 1, 1,
-0.7906042, 0.2332232, -1.548136, 1, 0, 0, 1, 1,
-0.790529, 0.9152363, -2.433526, 1, 0, 0, 1, 1,
-0.7859245, 1.232046, -0.2276543, 1, 0, 0, 1, 1,
-0.780759, 1.018476, -1.345683, 0, 0, 0, 1, 1,
-0.7790788, -2.453548, -2.225871, 0, 0, 0, 1, 1,
-0.773937, 0.4195767, -1.249509, 0, 0, 0, 1, 1,
-0.7736204, 0.6128403, -1.332445, 0, 0, 0, 1, 1,
-0.7727427, -0.3928199, -0.6410084, 0, 0, 0, 1, 1,
-0.7709805, 1.323829, -3.08673, 0, 0, 0, 1, 1,
-0.7669461, 0.1432353, -0.8519908, 0, 0, 0, 1, 1,
-0.7632505, -0.6158488, -2.983747, 1, 1, 1, 1, 1,
-0.7606515, 1.858635, 0.6361108, 1, 1, 1, 1, 1,
-0.7581718, -2.376484, -2.267755, 1, 1, 1, 1, 1,
-0.7480108, -0.6469852, -2.816213, 1, 1, 1, 1, 1,
-0.739959, 0.7242248, 0.3964158, 1, 1, 1, 1, 1,
-0.7376024, 1.284184, -1.562467, 1, 1, 1, 1, 1,
-0.7354351, 0.4527134, -0.8067385, 1, 1, 1, 1, 1,
-0.7327014, -0.3502035, -1.209698, 1, 1, 1, 1, 1,
-0.7313322, 0.5008425, -0.7086661, 1, 1, 1, 1, 1,
-0.7293803, -0.4762513, -4.208254, 1, 1, 1, 1, 1,
-0.7258494, -0.3702338, -3.079361, 1, 1, 1, 1, 1,
-0.7228017, -0.7904841, -0.8425814, 1, 1, 1, 1, 1,
-0.7209654, 1.883108, -0.06614681, 1, 1, 1, 1, 1,
-0.7154051, -1.167825, -3.566327, 1, 1, 1, 1, 1,
-0.7144498, 0.2197977, -0.8245412, 1, 1, 1, 1, 1,
-0.709278, 0.5920026, -1.369268, 0, 0, 1, 1, 1,
-0.7063707, 1.952656, 0.4599216, 1, 0, 0, 1, 1,
-0.7054881, 1.458924, -0.1232175, 1, 0, 0, 1, 1,
-0.7031987, 1.118641, -2.343133, 1, 0, 0, 1, 1,
-0.7028018, 1.027357, -0.5197089, 1, 0, 0, 1, 1,
-0.7004344, -0.5019726, -2.375581, 1, 0, 0, 1, 1,
-0.6927497, -0.3397978, -1.596583, 0, 0, 0, 1, 1,
-0.6922498, -1.15193, -1.942062, 0, 0, 0, 1, 1,
-0.6915871, -0.2434046, -2.156262, 0, 0, 0, 1, 1,
-0.681237, -0.498101, -3.622125, 0, 0, 0, 1, 1,
-0.6802759, 0.03668759, -3.76001, 0, 0, 0, 1, 1,
-0.6799529, 0.6968241, -1.686031, 0, 0, 0, 1, 1,
-0.6762891, -0.7284987, -2.632912, 0, 0, 0, 1, 1,
-0.6742999, 1.578748, -1.235307, 1, 1, 1, 1, 1,
-0.6736528, -1.134928, -4.727531, 1, 1, 1, 1, 1,
-0.6715918, -0.7510086, -1.592947, 1, 1, 1, 1, 1,
-0.6645501, 0.5365596, -2.407613, 1, 1, 1, 1, 1,
-0.6589877, 1.187069, -0.4833288, 1, 1, 1, 1, 1,
-0.6566915, 0.3377591, 0.4349215, 1, 1, 1, 1, 1,
-0.6531962, 0.7601212, 1.026799, 1, 1, 1, 1, 1,
-0.6517527, 0.5090697, -1.189918, 1, 1, 1, 1, 1,
-0.6431068, 0.6999359, 0.7637061, 1, 1, 1, 1, 1,
-0.6411383, -0.5001801, -0.7853142, 1, 1, 1, 1, 1,
-0.6402913, -0.4606778, -1.999516, 1, 1, 1, 1, 1,
-0.6391733, 0.4869003, -0.9159779, 1, 1, 1, 1, 1,
-0.6379217, 1.041061, -1.975658, 1, 1, 1, 1, 1,
-0.6348788, -1.852648, -3.206125, 1, 1, 1, 1, 1,
-0.6290958, 1.813647, 0.6666505, 1, 1, 1, 1, 1,
-0.6250003, -0.5953673, -2.26863, 0, 0, 1, 1, 1,
-0.6199283, -0.7078627, -2.492358, 1, 0, 0, 1, 1,
-0.6179637, -0.9718338, -1.567272, 1, 0, 0, 1, 1,
-0.613928, 0.6273689, 1.896956, 1, 0, 0, 1, 1,
-0.6117373, 0.7933389, -0.9958724, 1, 0, 0, 1, 1,
-0.6051772, -0.3823136, -4.413963, 1, 0, 0, 1, 1,
-0.6045702, -0.2562016, -2.667036, 0, 0, 0, 1, 1,
-0.6039954, -1.362839, -2.092341, 0, 0, 0, 1, 1,
-0.5979887, 0.4896187, -2.421329, 0, 0, 0, 1, 1,
-0.5974531, 1.406512, -1.520786, 0, 0, 0, 1, 1,
-0.5923073, -0.6546744, -2.711378, 0, 0, 0, 1, 1,
-0.5849597, -0.532913, -2.552378, 0, 0, 0, 1, 1,
-0.5843158, 1.889261, 1.896458, 0, 0, 0, 1, 1,
-0.582521, 0.0927421, -0.4139786, 1, 1, 1, 1, 1,
-0.5750296, -0.5045992, -2.876285, 1, 1, 1, 1, 1,
-0.5734891, -0.7516522, -2.254942, 1, 1, 1, 1, 1,
-0.5713625, 0.3193029, -1.61931, 1, 1, 1, 1, 1,
-0.5690563, 1.175667, -0.5777715, 1, 1, 1, 1, 1,
-0.5687841, 0.4610174, 1.761363, 1, 1, 1, 1, 1,
-0.5636085, -1.338549, -2.093455, 1, 1, 1, 1, 1,
-0.5608808, 0.7029217, 1.031445, 1, 1, 1, 1, 1,
-0.5605152, -0.4601013, -3.26088, 1, 1, 1, 1, 1,
-0.5593892, -0.3646075, -3.288509, 1, 1, 1, 1, 1,
-0.5590013, 1.259495, 1.71252, 1, 1, 1, 1, 1,
-0.5585245, -0.2407702, -2.313254, 1, 1, 1, 1, 1,
-0.5581937, -0.3438427, -1.8946, 1, 1, 1, 1, 1,
-0.5572367, -0.619858, -1.078662, 1, 1, 1, 1, 1,
-0.5490144, 0.4051722, 0.7110098, 1, 1, 1, 1, 1,
-0.5474126, -1.162055, -3.827405, 0, 0, 1, 1, 1,
-0.5452526, -0.7757153, -1.974351, 1, 0, 0, 1, 1,
-0.54408, 1.6201, 0.2332874, 1, 0, 0, 1, 1,
-0.5432821, -0.4367063, -2.095765, 1, 0, 0, 1, 1,
-0.5432324, 1.502037, -0.3869087, 1, 0, 0, 1, 1,
-0.541629, 1.260165, -1.153246, 1, 0, 0, 1, 1,
-0.5401751, 0.3493257, -0.4898189, 0, 0, 0, 1, 1,
-0.5338125, 0.4654679, -1.880912, 0, 0, 0, 1, 1,
-0.5336797, -1.944581, -4.127458, 0, 0, 0, 1, 1,
-0.5332981, 1.148651, -1.492996, 0, 0, 0, 1, 1,
-0.5323865, -1.043162, -3.227033, 0, 0, 0, 1, 1,
-0.5314596, -0.5816, -0.5590644, 0, 0, 0, 1, 1,
-0.528407, 1.456039, -1.581397, 0, 0, 0, 1, 1,
-0.5227143, 0.9626343, -0.9599192, 1, 1, 1, 1, 1,
-0.5194083, -1.68756, -2.28757, 1, 1, 1, 1, 1,
-0.5171763, -1.553356, -3.92799, 1, 1, 1, 1, 1,
-0.5138794, -1.526263, -2.826328, 1, 1, 1, 1, 1,
-0.5112745, 1.939339, 0.6211844, 1, 1, 1, 1, 1,
-0.5107089, -0.7543535, -3.375647, 1, 1, 1, 1, 1,
-0.5088621, 1.013175, 0.2217813, 1, 1, 1, 1, 1,
-0.5046815, -0.3541771, -2.767143, 1, 1, 1, 1, 1,
-0.5045418, 0.3302547, -0.08204173, 1, 1, 1, 1, 1,
-0.5040247, 0.2497495, -1.108136, 1, 1, 1, 1, 1,
-0.502582, 0.1668099, -1.553353, 1, 1, 1, 1, 1,
-0.5007316, 0.9703662, -1.597139, 1, 1, 1, 1, 1,
-0.4995645, -0.09122425, -1.253072, 1, 1, 1, 1, 1,
-0.4984108, -0.006563963, 1.556525, 1, 1, 1, 1, 1,
-0.4950162, -1.19844, -3.157778, 1, 1, 1, 1, 1,
-0.4924331, -1.241114, -2.189517, 0, 0, 1, 1, 1,
-0.4870262, 0.9255863, -0.1375399, 1, 0, 0, 1, 1,
-0.4701557, 0.2587182, -1.729609, 1, 0, 0, 1, 1,
-0.4694541, 0.6678862, 0.1885176, 1, 0, 0, 1, 1,
-0.468333, -0.1523795, -2.048609, 1, 0, 0, 1, 1,
-0.4676763, -0.0649563, -1.741554, 1, 0, 0, 1, 1,
-0.4659534, 0.5960354, -0.9836971, 0, 0, 0, 1, 1,
-0.4652453, 0.7709714, -1.621533, 0, 0, 0, 1, 1,
-0.45926, -0.5660052, -3.028167, 0, 0, 0, 1, 1,
-0.456398, -1.025508, -3.964715, 0, 0, 0, 1, 1,
-0.4552242, 0.3363912, -1.853557, 0, 0, 0, 1, 1,
-0.4551645, -1.11311, -3.015011, 0, 0, 0, 1, 1,
-0.4537425, 0.7853118, 0.8742585, 0, 0, 0, 1, 1,
-0.4516229, 1.088499, 0.2747763, 1, 1, 1, 1, 1,
-0.4496861, 0.3161936, -2.133858, 1, 1, 1, 1, 1,
-0.4477127, -0.4596658, -3.037891, 1, 1, 1, 1, 1,
-0.445291, -0.3413008, -3.072824, 1, 1, 1, 1, 1,
-0.4446727, 0.09134842, -1.663764, 1, 1, 1, 1, 1,
-0.4401926, 0.07199312, -0.7547837, 1, 1, 1, 1, 1,
-0.4399998, 0.2475053, -0.7576952, 1, 1, 1, 1, 1,
-0.4396605, 1.767998, -0.8116125, 1, 1, 1, 1, 1,
-0.4348655, 0.1308707, -2.49142, 1, 1, 1, 1, 1,
-0.4315566, 1.470804, 0.6140863, 1, 1, 1, 1, 1,
-0.4305344, 0.2669767, -1.328059, 1, 1, 1, 1, 1,
-0.4298058, -1.111981, -3.456239, 1, 1, 1, 1, 1,
-0.4290856, 1.492692, 0.1862726, 1, 1, 1, 1, 1,
-0.4272293, 0.7152797, -0.4846431, 1, 1, 1, 1, 1,
-0.4223584, -2.48, -2.350848, 1, 1, 1, 1, 1,
-0.4214333, 1.200182, -0.8494976, 0, 0, 1, 1, 1,
-0.4179571, 0.02410598, -2.651903, 1, 0, 0, 1, 1,
-0.4178824, 1.276804, -0.9682477, 1, 0, 0, 1, 1,
-0.4148597, 2.554443, 1.004593, 1, 0, 0, 1, 1,
-0.4115567, -0.1520713, -1.483759, 1, 0, 0, 1, 1,
-0.4099748, -0.7593258, -2.21388, 1, 0, 0, 1, 1,
-0.4075438, -0.1148124, -2.648729, 0, 0, 0, 1, 1,
-0.4071569, -0.400702, -2.201875, 0, 0, 0, 1, 1,
-0.4056956, -0.8515859, -2.452693, 0, 0, 0, 1, 1,
-0.4047349, 0.3458101, -0.4692578, 0, 0, 0, 1, 1,
-0.4031264, 0.9150364, -0.9599679, 0, 0, 0, 1, 1,
-0.3956445, 0.3707341, -2.026027, 0, 0, 0, 1, 1,
-0.394382, 0.6037643, -0.7036564, 0, 0, 0, 1, 1,
-0.386033, -0.8392107, -2.842815, 1, 1, 1, 1, 1,
-0.3834234, -0.6578851, -2.197456, 1, 1, 1, 1, 1,
-0.3822097, 1.711143, -0.7994688, 1, 1, 1, 1, 1,
-0.3799713, 0.1881255, -3.281393, 1, 1, 1, 1, 1,
-0.3780286, -0.7825664, -3.153232, 1, 1, 1, 1, 1,
-0.3761645, 0.8542159, 0.3553257, 1, 1, 1, 1, 1,
-0.3749406, 1.571084, -1.042645, 1, 1, 1, 1, 1,
-0.3721813, -0.6998199, -0.4341213, 1, 1, 1, 1, 1,
-0.3678512, -1.289471, -3.582588, 1, 1, 1, 1, 1,
-0.3643368, -0.2096886, -2.80974, 1, 1, 1, 1, 1,
-0.3633314, 0.2401042, -1.300177, 1, 1, 1, 1, 1,
-0.362653, -0.3149064, -1.72609, 1, 1, 1, 1, 1,
-0.3605464, 0.01319216, -1.062841, 1, 1, 1, 1, 1,
-0.3603935, 0.1696712, 0.3760163, 1, 1, 1, 1, 1,
-0.3578409, -1.003208, -2.679879, 1, 1, 1, 1, 1,
-0.3576727, -0.3166496, -2.548321, 0, 0, 1, 1, 1,
-0.3551795, 0.02277827, -1.916343, 1, 0, 0, 1, 1,
-0.3462464, 0.439477, -1.139525, 1, 0, 0, 1, 1,
-0.3440239, 0.1497127, -2.318953, 1, 0, 0, 1, 1,
-0.3397026, 0.1582969, -0.7825407, 1, 0, 0, 1, 1,
-0.3388003, -0.6538662, -3.400846, 1, 0, 0, 1, 1,
-0.3352099, 0.6132924, -1.333337, 0, 0, 0, 1, 1,
-0.3332696, -0.2185078, -3.916246, 0, 0, 0, 1, 1,
-0.3326957, 0.9032093, -3.510214, 0, 0, 0, 1, 1,
-0.3282562, -1.848691, -2.916211, 0, 0, 0, 1, 1,
-0.3277651, -0.1537543, -1.485831, 0, 0, 0, 1, 1,
-0.3255702, 1.21177, -0.512762, 0, 0, 0, 1, 1,
-0.3202697, 0.6128891, 0.1509324, 0, 0, 0, 1, 1,
-0.3183242, -0.1134354, -1.086464, 1, 1, 1, 1, 1,
-0.2944627, -0.6531081, -2.473252, 1, 1, 1, 1, 1,
-0.2932498, -0.6841908, -2.902632, 1, 1, 1, 1, 1,
-0.2929075, 0.4764746, -0.5496837, 1, 1, 1, 1, 1,
-0.2926962, -0.5916904, -2.03711, 1, 1, 1, 1, 1,
-0.2904857, -0.2561856, -3.513322, 1, 1, 1, 1, 1,
-0.288779, 1.121737, -0.8919979, 1, 1, 1, 1, 1,
-0.2870003, -1.31715, -3.825223, 1, 1, 1, 1, 1,
-0.2856644, 1.622426, -0.8675966, 1, 1, 1, 1, 1,
-0.2804545, 1.118832, -0.7384559, 1, 1, 1, 1, 1,
-0.2798541, -1.162095, -3.731839, 1, 1, 1, 1, 1,
-0.2795484, 0.1619124, -1.865162, 1, 1, 1, 1, 1,
-0.2776724, -0.9028019, -0.595998, 1, 1, 1, 1, 1,
-0.2766823, 0.9036379, -0.523723, 1, 1, 1, 1, 1,
-0.2627275, -0.2006713, -3.524318, 1, 1, 1, 1, 1,
-0.252449, 0.9729117, 1.789917, 0, 0, 1, 1, 1,
-0.2522484, 2.006116, 1.349124, 1, 0, 0, 1, 1,
-0.2495744, 0.4817061, 0.3431089, 1, 0, 0, 1, 1,
-0.2477363, -0.648239, -2.70083, 1, 0, 0, 1, 1,
-0.2449711, -0.9939146, -3.658076, 1, 0, 0, 1, 1,
-0.2400679, 0.7837345, -0.1608981, 1, 0, 0, 1, 1,
-0.2336808, -0.5521863, -2.361804, 0, 0, 0, 1, 1,
-0.226617, -0.03958471, -1.954994, 0, 0, 0, 1, 1,
-0.2252642, 0.4756564, -0.5538914, 0, 0, 0, 1, 1,
-0.2236592, 0.2221488, -0.6402822, 0, 0, 0, 1, 1,
-0.2224942, -0.2760257, -2.788352, 0, 0, 0, 1, 1,
-0.2218284, -1.190062, -2.887744, 0, 0, 0, 1, 1,
-0.2217972, -0.375172, -3.28073, 0, 0, 0, 1, 1,
-0.2187827, -0.3001286, -2.234056, 1, 1, 1, 1, 1,
-0.2184884, -0.5660484, -2.562699, 1, 1, 1, 1, 1,
-0.2173704, 0.2808861, -1.521911, 1, 1, 1, 1, 1,
-0.2150633, 1.184527, -0.3479939, 1, 1, 1, 1, 1,
-0.2150057, 1.008124, -0.06484405, 1, 1, 1, 1, 1,
-0.2127828, 0.1990677, -1.683671, 1, 1, 1, 1, 1,
-0.2098328, 1.649372, -1.23314, 1, 1, 1, 1, 1,
-0.209452, 0.2458804, 0.198946, 1, 1, 1, 1, 1,
-0.2067887, -1.49781, -4.39587, 1, 1, 1, 1, 1,
-0.2046935, 1.126505, 1.476124, 1, 1, 1, 1, 1,
-0.1971269, -0.5871986, -3.079278, 1, 1, 1, 1, 1,
-0.1945346, -1.057637, -5.017396, 1, 1, 1, 1, 1,
-0.1942744, -2.018922, -4.019797, 1, 1, 1, 1, 1,
-0.1862998, 0.3239052, 0.08319938, 1, 1, 1, 1, 1,
-0.1850238, 0.9326902, -1.181023, 1, 1, 1, 1, 1,
-0.1844501, -0.7377972, -3.087643, 0, 0, 1, 1, 1,
-0.1815569, 0.1499803, -2.419476, 1, 0, 0, 1, 1,
-0.1812387, 0.008079385, -1.354447, 1, 0, 0, 1, 1,
-0.1809902, -0.5901486, -4.028605, 1, 0, 0, 1, 1,
-0.1776399, -0.8072481, -2.997963, 1, 0, 0, 1, 1,
-0.175184, -0.03703616, -2.936852, 1, 0, 0, 1, 1,
-0.1732213, -0.5557784, -1.384458, 0, 0, 0, 1, 1,
-0.1712754, -1.247732, -3.171645, 0, 0, 0, 1, 1,
-0.1705508, 0.7730531, -0.5542166, 0, 0, 0, 1, 1,
-0.1693335, -0.1145023, -2.450708, 0, 0, 0, 1, 1,
-0.1595699, 1.091403, 0.5770205, 0, 0, 0, 1, 1,
-0.1585918, -1.008069, -2.462659, 0, 0, 0, 1, 1,
-0.1467644, 0.9831433, -0.1974002, 0, 0, 0, 1, 1,
-0.1455838, 1.396182, 1.734338, 1, 1, 1, 1, 1,
-0.1453025, 0.5480211, -0.6626052, 1, 1, 1, 1, 1,
-0.1437026, -0.7508868, -3.226548, 1, 1, 1, 1, 1,
-0.1395728, -0.2612956, -1.922889, 1, 1, 1, 1, 1,
-0.134353, 0.2274825, -0.7175286, 1, 1, 1, 1, 1,
-0.1333213, -0.5370277, -2.48173, 1, 1, 1, 1, 1,
-0.1332811, -1.31379, -3.745358, 1, 1, 1, 1, 1,
-0.1315853, 1.162332, -0.4684584, 1, 1, 1, 1, 1,
-0.124889, -0.2719191, -2.314984, 1, 1, 1, 1, 1,
-0.1240958, -1.106129, -2.536068, 1, 1, 1, 1, 1,
-0.1177754, 0.06755377, -1.103812, 1, 1, 1, 1, 1,
-0.1031511, 1.678366, 1.012683, 1, 1, 1, 1, 1,
-0.1023944, 0.5038716, -1.112929, 1, 1, 1, 1, 1,
-0.1016804, -0.4955517, -2.880381, 1, 1, 1, 1, 1,
-0.09984422, 0.01119344, -1.504173, 1, 1, 1, 1, 1,
-0.0985189, -0.4591137, -3.683177, 0, 0, 1, 1, 1,
-0.09340752, 0.212719, 0.3768596, 1, 0, 0, 1, 1,
-0.08715072, 0.7788255, 1.546772, 1, 0, 0, 1, 1,
-0.08392828, 1.516164, -0.3473639, 1, 0, 0, 1, 1,
-0.08383761, -0.3531564, -2.433446, 1, 0, 0, 1, 1,
-0.08346161, 0.4015685, -0.3250585, 1, 0, 0, 1, 1,
-0.08274899, -0.3055587, -2.618741, 0, 0, 0, 1, 1,
-0.08163872, -0.444345, -3.325141, 0, 0, 0, 1, 1,
-0.08035939, -0.1992386, -2.581622, 0, 0, 0, 1, 1,
-0.08016538, -0.09982155, -3.734792, 0, 0, 0, 1, 1,
-0.07996093, -0.5546926, -1.814962, 0, 0, 0, 1, 1,
-0.07341883, -0.05154799, -2.531148, 0, 0, 0, 1, 1,
-0.07031305, -1.559949, -2.770964, 0, 0, 0, 1, 1,
-0.06910326, -1.535115, -5.200445, 1, 1, 1, 1, 1,
-0.05484498, 0.3644716, -1.607287, 1, 1, 1, 1, 1,
-0.05445982, 0.07096384, -1.673972, 1, 1, 1, 1, 1,
-0.04997199, -0.9458206, -4.250284, 1, 1, 1, 1, 1,
-0.04043895, -0.8837749, -3.37394, 1, 1, 1, 1, 1,
-0.03916207, -0.17385, -2.01456, 1, 1, 1, 1, 1,
-0.03838667, 1.70758, 2.668883, 1, 1, 1, 1, 1,
-0.03591808, 0.005963595, -0.1316874, 1, 1, 1, 1, 1,
-0.03455354, 0.02260526, -1.089712, 1, 1, 1, 1, 1,
-0.02831203, -1.137829, -2.362146, 1, 1, 1, 1, 1,
-0.02584186, -1.729171, -2.01245, 1, 1, 1, 1, 1,
-0.02524846, 1.888681, -1.777244, 1, 1, 1, 1, 1,
-0.0235155, 1.435567, -0.1218485, 1, 1, 1, 1, 1,
-0.02225019, -2.158009, -2.763008, 1, 1, 1, 1, 1,
-0.02216498, -0.4605737, -1.579054, 1, 1, 1, 1, 1,
-0.01977561, 0.7393279, 0.3137127, 0, 0, 1, 1, 1,
-0.01870333, -1.642144, -2.963248, 1, 0, 0, 1, 1,
-0.01078788, 0.8849705, 0.1953135, 1, 0, 0, 1, 1,
-0.008254042, 1.426822, -0.199663, 1, 0, 0, 1, 1,
-0.007883752, 0.7283479, 2.273627, 1, 0, 0, 1, 1,
-0.00745707, 0.5063412, -0.3023529, 1, 0, 0, 1, 1,
-0.0054134, 0.09734265, 0.2550254, 0, 0, 0, 1, 1,
-0.004803485, -0.8080252, -2.004422, 0, 0, 0, 1, 1,
-0.004398881, 0.2497297, -0.1159161, 0, 0, 0, 1, 1,
-0.002336321, -0.512952, -1.779947, 0, 0, 0, 1, 1,
-0.0008772745, 1.627457, -1.028854, 0, 0, 0, 1, 1,
0.003042485, 2.635781, -0.6508605, 0, 0, 0, 1, 1,
0.003398509, 1.294225, 0.8079349, 0, 0, 0, 1, 1,
0.006276784, -0.1501774, 3.709464, 1, 1, 1, 1, 1,
0.01154893, -1.577885, 1.029179, 1, 1, 1, 1, 1,
0.01243401, -0.5329835, 4.127459, 1, 1, 1, 1, 1,
0.01341884, -0.4370943, 1.611279, 1, 1, 1, 1, 1,
0.01349321, -1.369463, 4.249689, 1, 1, 1, 1, 1,
0.01419654, 1.171522, 0.7107192, 1, 1, 1, 1, 1,
0.01511027, 0.9620589, 1.176329, 1, 1, 1, 1, 1,
0.01637736, -0.2752535, 2.622103, 1, 1, 1, 1, 1,
0.01653245, 1.537281, -0.7045727, 1, 1, 1, 1, 1,
0.02139783, 0.2174202, 1.250085, 1, 1, 1, 1, 1,
0.02199707, 0.2514025, 0.5111512, 1, 1, 1, 1, 1,
0.02278736, -0.2295751, 3.172402, 1, 1, 1, 1, 1,
0.02591899, -0.006811768, 2.413669, 1, 1, 1, 1, 1,
0.02709409, -0.4655544, 3.100335, 1, 1, 1, 1, 1,
0.03068642, -1.717247, 3.224518, 1, 1, 1, 1, 1,
0.03089825, -0.1446345, 3.421099, 0, 0, 1, 1, 1,
0.03804066, 0.649483, 1.185545, 1, 0, 0, 1, 1,
0.04309684, -0.3792934, 2.299637, 1, 0, 0, 1, 1,
0.05010173, 0.1288345, -0.4647043, 1, 0, 0, 1, 1,
0.05437707, 0.6562818, -0.3414489, 1, 0, 0, 1, 1,
0.05448029, 0.9979669, 1.070437, 1, 0, 0, 1, 1,
0.06386038, -0.05544478, 1.298057, 0, 0, 0, 1, 1,
0.06742888, 0.06882031, 0.6334879, 0, 0, 0, 1, 1,
0.06893855, 0.3656101, -0.04704356, 0, 0, 0, 1, 1,
0.07238117, -0.1735489, 3.230931, 0, 0, 0, 1, 1,
0.07322346, -0.9010659, 1.446108, 0, 0, 0, 1, 1,
0.07462175, 1.196552, -1.248116, 0, 0, 0, 1, 1,
0.07638118, 1.277285, -0.2849723, 0, 0, 0, 1, 1,
0.08465492, -0.1915238, 2.875403, 1, 1, 1, 1, 1,
0.08590561, -1.856556, 3.088383, 1, 1, 1, 1, 1,
0.08672372, 1.941152, -0.02787251, 1, 1, 1, 1, 1,
0.08696558, -0.3406551, 2.887983, 1, 1, 1, 1, 1,
0.08748094, 0.9562561, -1.207326, 1, 1, 1, 1, 1,
0.08889748, 0.6147178, -0.974895, 1, 1, 1, 1, 1,
0.08911711, 0.09693299, -0.1924271, 1, 1, 1, 1, 1,
0.08951158, 0.9692453, 0.0147487, 1, 1, 1, 1, 1,
0.08965615, -0.656103, 3.970602, 1, 1, 1, 1, 1,
0.09180328, 0.373454, 1.342952, 1, 1, 1, 1, 1,
0.09301496, 2.238654, 0.09714405, 1, 1, 1, 1, 1,
0.09341996, -0.1934313, 2.432704, 1, 1, 1, 1, 1,
0.1011907, 0.02605415, -0.3435161, 1, 1, 1, 1, 1,
0.1087229, -0.07886684, 4.114633, 1, 1, 1, 1, 1,
0.1170715, -1.267055, 3.704969, 1, 1, 1, 1, 1,
0.1174187, 0.02808, 0.6498278, 0, 0, 1, 1, 1,
0.1208238, -0.1637826, 0.9425365, 1, 0, 0, 1, 1,
0.1210917, 1.109744, 0.5049181, 1, 0, 0, 1, 1,
0.1232473, 0.1480862, 1.100422, 1, 0, 0, 1, 1,
0.1233905, 1.420417, -1.327342, 1, 0, 0, 1, 1,
0.123526, 0.529819, 2.478955, 1, 0, 0, 1, 1,
0.1292352, -0.4612521, 4.34542, 0, 0, 0, 1, 1,
0.1306503, -0.1817106, 4.355661, 0, 0, 0, 1, 1,
0.1338525, 1.785794, 0.653721, 0, 0, 0, 1, 1,
0.136435, -0.6582311, 1.07009, 0, 0, 0, 1, 1,
0.1439271, -0.6159778, 2.593195, 0, 0, 0, 1, 1,
0.1469952, 0.4650517, 1.216474, 0, 0, 0, 1, 1,
0.1499641, 0.7528585, 1.402797, 0, 0, 0, 1, 1,
0.1585111, -2.242465, 3.07031, 1, 1, 1, 1, 1,
0.1600593, -0.3193147, 2.412884, 1, 1, 1, 1, 1,
0.16187, 1.199197, -1.401149, 1, 1, 1, 1, 1,
0.1641157, -0.02451956, 2.605568, 1, 1, 1, 1, 1,
0.1726856, -0.6935483, 3.738674, 1, 1, 1, 1, 1,
0.1761972, 0.588887, -0.1384711, 1, 1, 1, 1, 1,
0.1764498, 0.1289307, 1.293015, 1, 1, 1, 1, 1,
0.1770296, -1.30236, 4.458701, 1, 1, 1, 1, 1,
0.1803493, 0.4751175, -0.4336002, 1, 1, 1, 1, 1,
0.1832392, 0.1605034, -0.01449661, 1, 1, 1, 1, 1,
0.1845013, -1.459467, 3.189373, 1, 1, 1, 1, 1,
0.1868572, -1.021192, -0.5146233, 1, 1, 1, 1, 1,
0.1882153, -1.196807, 2.202876, 1, 1, 1, 1, 1,
0.1882171, -2.247204, 3.133355, 1, 1, 1, 1, 1,
0.1923577, -2.131465, 2.565727, 1, 1, 1, 1, 1,
0.19413, 0.6315705, -0.1778295, 0, 0, 1, 1, 1,
0.1949479, -1.802218, 4.000417, 1, 0, 0, 1, 1,
0.1951405, -1.810106, 5.711811, 1, 0, 0, 1, 1,
0.1952189, 0.7075515, 2.375432, 1, 0, 0, 1, 1,
0.1977124, -0.7223608, 1.745372, 1, 0, 0, 1, 1,
0.1989081, -0.278654, 3.331357, 1, 0, 0, 1, 1,
0.2073065, -0.6898864, 4.396336, 0, 0, 0, 1, 1,
0.209889, 0.3440745, -0.9751446, 0, 0, 0, 1, 1,
0.2114454, -2.734293, 4.259074, 0, 0, 0, 1, 1,
0.2184911, 0.2035625, 2.225427, 0, 0, 0, 1, 1,
0.2191151, 1.095688, 0.1217562, 0, 0, 0, 1, 1,
0.2239013, 0.8104979, -1.055842, 0, 0, 0, 1, 1,
0.2252479, 0.994144, 0.2915894, 0, 0, 0, 1, 1,
0.2265928, -0.6115589, 3.286264, 1, 1, 1, 1, 1,
0.2280566, 2.319502, -0.1558782, 1, 1, 1, 1, 1,
0.2375552, -1.96516, 2.1794, 1, 1, 1, 1, 1,
0.2401049, 1.588051, 0.2474612, 1, 1, 1, 1, 1,
0.2519901, -1.687256, 3.78228, 1, 1, 1, 1, 1,
0.2556312, 0.271368, 0.1917065, 1, 1, 1, 1, 1,
0.2588891, -0.04303271, 2.236724, 1, 1, 1, 1, 1,
0.2608526, -0.1960819, 0.9838415, 1, 1, 1, 1, 1,
0.2615576, -1.717726, 3.650115, 1, 1, 1, 1, 1,
0.2616545, 2.649512, -0.2347202, 1, 1, 1, 1, 1,
0.2625468, -0.1439406, 2.685231, 1, 1, 1, 1, 1,
0.2643213, -0.1506128, 1.836999, 1, 1, 1, 1, 1,
0.2671877, 0.1204921, 1.197281, 1, 1, 1, 1, 1,
0.2674952, -0.8584332, 5.150511, 1, 1, 1, 1, 1,
0.2726718, 0.6661355, -0.3390439, 1, 1, 1, 1, 1,
0.2766323, 0.7167508, 0.8450927, 0, 0, 1, 1, 1,
0.2768211, 1.444385, 0.9458639, 1, 0, 0, 1, 1,
0.2772323, -0.6331732, 1.805571, 1, 0, 0, 1, 1,
0.278179, 0.7592893, -1.564698, 1, 0, 0, 1, 1,
0.2789101, -0.9249924, 4.38778, 1, 0, 0, 1, 1,
0.280679, 0.8016444, 1.767937, 1, 0, 0, 1, 1,
0.2847088, -0.1657306, 1.575293, 0, 0, 0, 1, 1,
0.2851395, -0.9623446, 4.652378, 0, 0, 0, 1, 1,
0.2878591, -0.5388339, 3.047913, 0, 0, 0, 1, 1,
0.2939055, 2.040523, -0.8196436, 0, 0, 0, 1, 1,
0.3013031, -0.3014387, 1.359489, 0, 0, 0, 1, 1,
0.3019644, 0.3784034, 2.994164, 0, 0, 0, 1, 1,
0.3020038, 0.1581789, 0.01642843, 0, 0, 0, 1, 1,
0.302077, 0.07028545, 0.4689182, 1, 1, 1, 1, 1,
0.3021853, 0.6719152, -0.007849311, 1, 1, 1, 1, 1,
0.3031663, 0.003269618, 1.213851, 1, 1, 1, 1, 1,
0.3033919, 1.373745, 0.1909303, 1, 1, 1, 1, 1,
0.3147098, -2.182069, 2.517228, 1, 1, 1, 1, 1,
0.3156989, -0.7954469, 1.89986, 1, 1, 1, 1, 1,
0.3166597, -0.5348164, 3.444645, 1, 1, 1, 1, 1,
0.3185655, -1.421162, 1.989878, 1, 1, 1, 1, 1,
0.320803, 1.087753, 0.5902165, 1, 1, 1, 1, 1,
0.3242987, 1.572891, 1.134785, 1, 1, 1, 1, 1,
0.328379, 0.4212279, -0.7709277, 1, 1, 1, 1, 1,
0.3299533, -1.040876, 2.650245, 1, 1, 1, 1, 1,
0.3300062, -0.3749921, 1.511544, 1, 1, 1, 1, 1,
0.3337081, 0.3752342, 1.591993, 1, 1, 1, 1, 1,
0.3337439, -1.659339, 4.190833, 1, 1, 1, 1, 1,
0.334563, 0.3199781, 1.345084, 0, 0, 1, 1, 1,
0.3373301, 0.1933272, 1.76572, 1, 0, 0, 1, 1,
0.3377416, -2.050382, 3.016751, 1, 0, 0, 1, 1,
0.3427783, -0.5723413, 4.891129, 1, 0, 0, 1, 1,
0.3498152, 1.272475, -0.4385634, 1, 0, 0, 1, 1,
0.3536821, -1.834222, 3.801832, 1, 0, 0, 1, 1,
0.3558383, -0.4146712, 1.715831, 0, 0, 0, 1, 1,
0.3563366, 1.798483, -0.01520014, 0, 0, 0, 1, 1,
0.3590489, -0.1559594, 2.411625, 0, 0, 0, 1, 1,
0.3647366, 0.002507214, 0.4001873, 0, 0, 0, 1, 1,
0.3652275, -0.5554599, 2.029022, 0, 0, 0, 1, 1,
0.366092, 0.6976234, 1.110965, 0, 0, 0, 1, 1,
0.3673204, -0.7519777, 1.535371, 0, 0, 0, 1, 1,
0.3709951, 0.2401795, 0.8636901, 1, 1, 1, 1, 1,
0.3710609, 1.631881, -0.3340082, 1, 1, 1, 1, 1,
0.3744834, -0.1658822, 2.524029, 1, 1, 1, 1, 1,
0.378938, 1.718322, -1.91905, 1, 1, 1, 1, 1,
0.3810754, -0.4169173, 1.374124, 1, 1, 1, 1, 1,
0.3820876, 0.6492442, -1.302099, 1, 1, 1, 1, 1,
0.3832206, -1.339661, 2.565074, 1, 1, 1, 1, 1,
0.3873769, -1.976447, 3.738836, 1, 1, 1, 1, 1,
0.3901689, -0.7460039, 4.155433, 1, 1, 1, 1, 1,
0.3904287, -0.4371688, 4.540308, 1, 1, 1, 1, 1,
0.3995127, 0.58619, -0.7706885, 1, 1, 1, 1, 1,
0.4002824, -1.520949, 3.909772, 1, 1, 1, 1, 1,
0.4046684, -1.28987, 3.910251, 1, 1, 1, 1, 1,
0.4056811, 0.6776267, 1.746914, 1, 1, 1, 1, 1,
0.4082065, 1.194975, 0.3843554, 1, 1, 1, 1, 1,
0.4083681, 1.462742, 0.7883286, 0, 0, 1, 1, 1,
0.4086077, 0.5889347, 0.8845375, 1, 0, 0, 1, 1,
0.4089323, 0.02533051, 1.36531, 1, 0, 0, 1, 1,
0.4181887, -1.552146, 4.8398, 1, 0, 0, 1, 1,
0.4217079, 0.6142895, 1.917136, 1, 0, 0, 1, 1,
0.4228207, 1.17221, 1.359316, 1, 0, 0, 1, 1,
0.4247496, 0.4310403, 0.2887756, 0, 0, 0, 1, 1,
0.4265134, 0.9636378, 0.9249893, 0, 0, 0, 1, 1,
0.4313339, -0.9119904, 2.339405, 0, 0, 0, 1, 1,
0.4320878, 0.683188, -0.7349139, 0, 0, 0, 1, 1,
0.4325847, 0.8176408, -0.7973571, 0, 0, 0, 1, 1,
0.4326736, 0.2752895, 0.8096282, 0, 0, 0, 1, 1,
0.4342427, 1.055854, 1.261892, 0, 0, 0, 1, 1,
0.4347936, 0.6004984, 0.9268611, 1, 1, 1, 1, 1,
0.4359485, -0.4907596, 1.768834, 1, 1, 1, 1, 1,
0.4409094, 0.1310629, 3.517412, 1, 1, 1, 1, 1,
0.4423698, 0.262804, 1.191879, 1, 1, 1, 1, 1,
0.4467709, 0.1900389, 3.319256, 1, 1, 1, 1, 1,
0.4503196, -1.416503, 3.243367, 1, 1, 1, 1, 1,
0.452553, 0.2299969, 0.566158, 1, 1, 1, 1, 1,
0.4628176, 1.642166, -0.3341505, 1, 1, 1, 1, 1,
0.4657199, 2.358358, -0.7999473, 1, 1, 1, 1, 1,
0.4658466, -0.4705879, 3.135738, 1, 1, 1, 1, 1,
0.4666629, 0.2834036, 0.2606786, 1, 1, 1, 1, 1,
0.4692737, 0.454535, -1.1104, 1, 1, 1, 1, 1,
0.4714745, 0.3411255, 1.686642, 1, 1, 1, 1, 1,
0.4776836, 1.104523, 0.9316525, 1, 1, 1, 1, 1,
0.4787404, 1.437312, -0.2518731, 1, 1, 1, 1, 1,
0.4796867, 0.2632323, 1.071757, 0, 0, 1, 1, 1,
0.4815786, -0.4689307, 1.62289, 1, 0, 0, 1, 1,
0.4821218, -1.503503, 2.557887, 1, 0, 0, 1, 1,
0.4830391, -0.1894992, 0.2704014, 1, 0, 0, 1, 1,
0.4835994, -1.219939, 1.940481, 1, 0, 0, 1, 1,
0.4924399, 1.083109, 1.296773, 1, 0, 0, 1, 1,
0.4932418, -0.8519973, 1.771713, 0, 0, 0, 1, 1,
0.5017415, 0.9257237, 1.778365, 0, 0, 0, 1, 1,
0.5030575, -0.981218, 2.841147, 0, 0, 0, 1, 1,
0.5034204, 0.8331543, 0.6680481, 0, 0, 0, 1, 1,
0.5044836, -0.05900179, 0.623971, 0, 0, 0, 1, 1,
0.5046318, -1.770726, 2.619431, 0, 0, 0, 1, 1,
0.5046821, -0.8747596, 1.651819, 0, 0, 0, 1, 1,
0.5060109, -0.6004208, 4.593616, 1, 1, 1, 1, 1,
0.5067995, -0.1965423, 2.262258, 1, 1, 1, 1, 1,
0.5172166, 0.5995803, 2.042278, 1, 1, 1, 1, 1,
0.5174414, -0.03292652, 2.157076, 1, 1, 1, 1, 1,
0.5198684, -1.123237, 4.403199, 1, 1, 1, 1, 1,
0.5210014, -0.5239333, 2.478046, 1, 1, 1, 1, 1,
0.5244128, 1.214186, -2.407085, 1, 1, 1, 1, 1,
0.5247341, -0.5537953, 3.993153, 1, 1, 1, 1, 1,
0.532076, -0.006414708, 2.441749, 1, 1, 1, 1, 1,
0.5421396, -0.1285561, 1.546696, 1, 1, 1, 1, 1,
0.5434939, -0.6814203, 3.946947, 1, 1, 1, 1, 1,
0.5610445, 0.3313075, -0.06782018, 1, 1, 1, 1, 1,
0.5639532, 0.09695042, 1.530434, 1, 1, 1, 1, 1,
0.5661178, -0.7270169, 2.675815, 1, 1, 1, 1, 1,
0.5667748, -1.445077, 3.268527, 1, 1, 1, 1, 1,
0.5739712, 1.129959, 0.8874559, 0, 0, 1, 1, 1,
0.577862, -0.1065798, 1.220555, 1, 0, 0, 1, 1,
0.579334, -0.7992918, 2.799621, 1, 0, 0, 1, 1,
0.5793353, 0.2263582, 1.694905, 1, 0, 0, 1, 1,
0.5804369, -1.415817, 2.258927, 1, 0, 0, 1, 1,
0.5825607, -0.9538684, 2.82634, 1, 0, 0, 1, 1,
0.5833315, -2.155416, 1.400865, 0, 0, 0, 1, 1,
0.585629, -0.3694119, 2.688782, 0, 0, 0, 1, 1,
0.5878895, -0.822708, 3.072024, 0, 0, 0, 1, 1,
0.5897402, -0.3157622, 1.73965, 0, 0, 0, 1, 1,
0.5921218, 0.1156636, 0.6027973, 0, 0, 0, 1, 1,
0.5930465, -1.504297, 0.571831, 0, 0, 0, 1, 1,
0.5949014, 1.048833, 0.7597018, 0, 0, 0, 1, 1,
0.5964075, 0.6575602, 1.783001, 1, 1, 1, 1, 1,
0.597317, 1.370999, 0.6386729, 1, 1, 1, 1, 1,
0.5988584, 0.3402094, -0.3059209, 1, 1, 1, 1, 1,
0.6025077, 0.5959902, -1.194985, 1, 1, 1, 1, 1,
0.6025515, -1.207082, 1.265674, 1, 1, 1, 1, 1,
0.602789, -0.3731889, 3.150021, 1, 1, 1, 1, 1,
0.6030908, -0.139488, 0.5361506, 1, 1, 1, 1, 1,
0.6130471, -0.9319506, 3.989873, 1, 1, 1, 1, 1,
0.6146874, 0.1158556, 2.091964, 1, 1, 1, 1, 1,
0.616036, -0.752008, 1.097825, 1, 1, 1, 1, 1,
0.6192408, 0.6401389, 0.2089949, 1, 1, 1, 1, 1,
0.6218374, -0.1612439, 0.8301522, 1, 1, 1, 1, 1,
0.6267262, -0.7056687, 1.401449, 1, 1, 1, 1, 1,
0.6281545, -1.311213, 1.187144, 1, 1, 1, 1, 1,
0.6335467, -0.6761049, 2.796559, 1, 1, 1, 1, 1,
0.6335519, -0.9605711, 2.684487, 0, 0, 1, 1, 1,
0.6361675, -0.3250016, -0.05597447, 1, 0, 0, 1, 1,
0.6378325, 0.7845386, 0.4220576, 1, 0, 0, 1, 1,
0.6389149, -0.1661701, 1.253801, 1, 0, 0, 1, 1,
0.6451061, 0.3727317, 2.376657, 1, 0, 0, 1, 1,
0.6503504, -1.335313, 3.032522, 1, 0, 0, 1, 1,
0.65122, 0.1058034, 1.662561, 0, 0, 0, 1, 1,
0.6513302, 1.111887, -0.1086527, 0, 0, 0, 1, 1,
0.6514534, 0.9081894, -0.1780418, 0, 0, 0, 1, 1,
0.6553146, -1.074615, 1.274831, 0, 0, 0, 1, 1,
0.6555889, -0.8896326, 2.191131, 0, 0, 0, 1, 1,
0.6608953, -0.4114718, 2.812271, 0, 0, 0, 1, 1,
0.6632305, 0.6397787, 0.7376435, 0, 0, 0, 1, 1,
0.6644137, -1.542358, 3.737786, 1, 1, 1, 1, 1,
0.6646457, -1.199348, 3.087404, 1, 1, 1, 1, 1,
0.6666921, -0.276028, 2.376485, 1, 1, 1, 1, 1,
0.6725208, 0.5311757, 2.009438, 1, 1, 1, 1, 1,
0.6868623, -0.3767425, 2.819188, 1, 1, 1, 1, 1,
0.6885888, 0.4008019, 1.180057, 1, 1, 1, 1, 1,
0.6901845, 0.3446989, 1.908387, 1, 1, 1, 1, 1,
0.6963254, -0.09496333, 0.9564632, 1, 1, 1, 1, 1,
0.6968508, 1.42062, -0.3306938, 1, 1, 1, 1, 1,
0.7002293, -0.8016953, 1.104476, 1, 1, 1, 1, 1,
0.7066868, 0.5863272, -0.1355373, 1, 1, 1, 1, 1,
0.7074121, -1.602228, 4.162409, 1, 1, 1, 1, 1,
0.7108049, -1.328714, 2.893911, 1, 1, 1, 1, 1,
0.7137185, -2.353809, 2.395295, 1, 1, 1, 1, 1,
0.7140462, 0.0006119475, 0.6042086, 1, 1, 1, 1, 1,
0.7193272, 1.09966, -0.8947695, 0, 0, 1, 1, 1,
0.7203836, -1.935758, 1.557765, 1, 0, 0, 1, 1,
0.721799, -1.130135, 3.186353, 1, 0, 0, 1, 1,
0.7302919, 1.595596, -0.3286191, 1, 0, 0, 1, 1,
0.7304901, 0.3630719, 3.78539, 1, 0, 0, 1, 1,
0.7331756, -1.373384, 3.170101, 1, 0, 0, 1, 1,
0.7351446, -0.8577743, 3.031847, 0, 0, 0, 1, 1,
0.73532, -0.275858, 1.588448, 0, 0, 0, 1, 1,
0.735413, 0.806961, 0.2028828, 0, 0, 0, 1, 1,
0.737243, -0.9769374, 4.287881, 0, 0, 0, 1, 1,
0.739572, 1.690653, 0.7143056, 0, 0, 0, 1, 1,
0.7516209, -0.04491593, 2.755522, 0, 0, 0, 1, 1,
0.7535892, -1.208319, 2.935515, 0, 0, 0, 1, 1,
0.7536855, 0.0295356, 1.238243, 1, 1, 1, 1, 1,
0.7545981, -1.57694, 0.446195, 1, 1, 1, 1, 1,
0.7554044, -0.1795754, 0.6666523, 1, 1, 1, 1, 1,
0.7561446, -1.245977, 2.519382, 1, 1, 1, 1, 1,
0.7622418, 1.805129, -0.431143, 1, 1, 1, 1, 1,
0.7622859, 0.7718501, 1.067197, 1, 1, 1, 1, 1,
0.7653449, 0.06593137, 1.639521, 1, 1, 1, 1, 1,
0.7685274, 1.007049, -0.3898055, 1, 1, 1, 1, 1,
0.7741896, 1.396318, 2.710336, 1, 1, 1, 1, 1,
0.7833101, 0.9045513, 3.090648, 1, 1, 1, 1, 1,
0.7860597, 1.955616, -0.1837622, 1, 1, 1, 1, 1,
0.787015, 0.07345557, 1.914684, 1, 1, 1, 1, 1,
0.7878528, -1.517897, 1.897969, 1, 1, 1, 1, 1,
0.7897939, 2.139453, 1.315953, 1, 1, 1, 1, 1,
0.7900431, 1.045946, 0.8018106, 1, 1, 1, 1, 1,
0.7951806, -0.4671274, 2.247751, 0, 0, 1, 1, 1,
0.7963169, 0.5176872, -0.04747329, 1, 0, 0, 1, 1,
0.7982392, 0.119047, -0.08194771, 1, 0, 0, 1, 1,
0.7991775, 1.645764, 0.1662433, 1, 0, 0, 1, 1,
0.8009791, -1.009383, 4.526713, 1, 0, 0, 1, 1,
0.801051, -1.512097, 2.208376, 1, 0, 0, 1, 1,
0.8060933, 0.07890878, -0.9033626, 0, 0, 0, 1, 1,
0.8062286, 1.030008, -0.1862427, 0, 0, 0, 1, 1,
0.8122627, 0.05641862, 2.376144, 0, 0, 0, 1, 1,
0.8133611, -0.5642055, 1.088303, 0, 0, 0, 1, 1,
0.8230733, 0.1221713, 0.8770685, 0, 0, 0, 1, 1,
0.8279097, -0.2967553, 3.736466, 0, 0, 0, 1, 1,
0.8294505, 0.07167291, 1.816606, 0, 0, 0, 1, 1,
0.8337434, -0.5287601, 1.52179, 1, 1, 1, 1, 1,
0.8400216, -1.529274, 2.61392, 1, 1, 1, 1, 1,
0.8469251, -1.324118, 2.064641, 1, 1, 1, 1, 1,
0.8532434, 0.7588689, 1.025985, 1, 1, 1, 1, 1,
0.8640944, 1.289111, 1.208494, 1, 1, 1, 1, 1,
0.8658676, 0.6000596, 0.6744744, 1, 1, 1, 1, 1,
0.8669454, -0.05623901, 1.3809, 1, 1, 1, 1, 1,
0.8745178, 1.170519, 0.1433671, 1, 1, 1, 1, 1,
0.8752424, 0.4388033, 1.285543, 1, 1, 1, 1, 1,
0.8783011, 2.042066, -0.3571112, 1, 1, 1, 1, 1,
0.87849, -0.1044381, 0.2991306, 1, 1, 1, 1, 1,
0.8836851, -2.337079, 2.887488, 1, 1, 1, 1, 1,
0.8837134, -1.730887, 1.829415, 1, 1, 1, 1, 1,
0.8866012, 0.2790567, 1.743604, 1, 1, 1, 1, 1,
0.8866879, -0.9066873, 2.797566, 1, 1, 1, 1, 1,
0.8937791, -0.4538397, 1.408343, 0, 0, 1, 1, 1,
0.8945507, -0.7730815, 1.824298, 1, 0, 0, 1, 1,
0.8984097, -1.719462, 2.096434, 1, 0, 0, 1, 1,
0.9033684, 0.9462324, -0.4330772, 1, 0, 0, 1, 1,
0.9063444, -1.122961, 5.404656, 1, 0, 0, 1, 1,
0.9064842, 0.5939711, 2.429119, 1, 0, 0, 1, 1,
0.9099129, -1.03175, 2.917727, 0, 0, 0, 1, 1,
0.9135784, -0.03408814, 2.097796, 0, 0, 0, 1, 1,
0.9156474, -0.339287, 1.548377, 0, 0, 0, 1, 1,
0.9186921, -1.357018, 2.73795, 0, 0, 0, 1, 1,
0.930172, -0.0408514, 0.4209833, 0, 0, 0, 1, 1,
0.9321315, -1.109102, 3.006239, 0, 0, 0, 1, 1,
0.9394242, -1.152059, 3.103319, 0, 0, 0, 1, 1,
0.9442689, -0.3368956, 1.536164, 1, 1, 1, 1, 1,
0.9565017, -1.260498, 3.223461, 1, 1, 1, 1, 1,
0.9606521, -0.5325572, 0.9274185, 1, 1, 1, 1, 1,
0.9650736, -2.171187, 4.105511, 1, 1, 1, 1, 1,
0.9765742, -1.159413, 1.979321, 1, 1, 1, 1, 1,
0.9788014, -0.1762667, 3.342058, 1, 1, 1, 1, 1,
0.9838954, 0.3160712, 2.057772, 1, 1, 1, 1, 1,
0.9852502, -0.9014046, 1.235072, 1, 1, 1, 1, 1,
0.9855443, -1.160293, 3.062726, 1, 1, 1, 1, 1,
0.9879773, 1.396192, 0.7113094, 1, 1, 1, 1, 1,
0.9980806, 0.04031334, 0.5367451, 1, 1, 1, 1, 1,
1.004636, -0.1468033, 2.640153, 1, 1, 1, 1, 1,
1.006821, 0.6883062, 1.125627, 1, 1, 1, 1, 1,
1.01244, 1.135176, 1.722255, 1, 1, 1, 1, 1,
1.017133, -1.762237, 3.125981, 1, 1, 1, 1, 1,
1.019299, 0.1499658, 1.508056, 0, 0, 1, 1, 1,
1.020025, 1.641848, 1.476994, 1, 0, 0, 1, 1,
1.029297, -2.500908, 3.060685, 1, 0, 0, 1, 1,
1.044975, -0.8018516, 2.638922, 1, 0, 0, 1, 1,
1.049641, 0.6021844, 1.28625, 1, 0, 0, 1, 1,
1.055684, -0.1322982, 1.510869, 1, 0, 0, 1, 1,
1.057312, -0.6707576, 4.02564, 0, 0, 0, 1, 1,
1.057743, -0.3850969, 1.754489, 0, 0, 0, 1, 1,
1.059337, -0.03796642, 2.505608, 0, 0, 0, 1, 1,
1.078214, 0.2547659, 0.4381121, 0, 0, 0, 1, 1,
1.078513, -0.1959841, 1.437784, 0, 0, 0, 1, 1,
1.079264, 0.9450191, -0.3922132, 0, 0, 0, 1, 1,
1.08339, 1.006473, 2.987398, 0, 0, 0, 1, 1,
1.084627, 0.6790658, 1.530591, 1, 1, 1, 1, 1,
1.085951, 1.554068, 0.7936503, 1, 1, 1, 1, 1,
1.092093, 0.05576837, 0.9815778, 1, 1, 1, 1, 1,
1.093879, 0.5893798, 2.096786, 1, 1, 1, 1, 1,
1.098478, 0.5995823, 1.908488, 1, 1, 1, 1, 1,
1.098864, 1.297328, 1.607958, 1, 1, 1, 1, 1,
1.103243, -0.1500439, 2.403291, 1, 1, 1, 1, 1,
1.112236, -0.2381527, 3.00418, 1, 1, 1, 1, 1,
1.115783, 1.502008, -0.001139762, 1, 1, 1, 1, 1,
1.115868, 0.2903451, 1.476207, 1, 1, 1, 1, 1,
1.119305, 0.5356919, 0.5466812, 1, 1, 1, 1, 1,
1.119572, 0.8380337, 1.273941, 1, 1, 1, 1, 1,
1.121721, -0.1408957, 1.646836, 1, 1, 1, 1, 1,
1.123318, -0.5844236, 1.542894, 1, 1, 1, 1, 1,
1.123756, -0.225539, -0.008586064, 1, 1, 1, 1, 1,
1.124104, -1.696643, 1.889573, 0, 0, 1, 1, 1,
1.12548, -2.102823, 2.818591, 1, 0, 0, 1, 1,
1.132963, 1.006078, 0.1404857, 1, 0, 0, 1, 1,
1.133429, 1.410296, 0.2068811, 1, 0, 0, 1, 1,
1.13777, 0.03969712, 2.217602, 1, 0, 0, 1, 1,
1.138194, 0.7499931, 1.537201, 1, 0, 0, 1, 1,
1.139663, -0.5121245, 2.004402, 0, 0, 0, 1, 1,
1.142965, -1.120972, 1.6877, 0, 0, 0, 1, 1,
1.143534, -0.4909903, 1.130164, 0, 0, 0, 1, 1,
1.16053, 0.02042562, 0.2496307, 0, 0, 0, 1, 1,
1.164838, -1.804959, 1.285408, 0, 0, 0, 1, 1,
1.165907, -0.6624696, 2.214536, 0, 0, 0, 1, 1,
1.172557, 0.3703676, 2.257419, 0, 0, 0, 1, 1,
1.176086, 0.772956, 0.4178018, 1, 1, 1, 1, 1,
1.176151, -1.84896, 2.683824, 1, 1, 1, 1, 1,
1.177915, -0.3965729, 2.880545, 1, 1, 1, 1, 1,
1.180539, 0.109711, 1.094771, 1, 1, 1, 1, 1,
1.182539, -0.4887224, 3.422163, 1, 1, 1, 1, 1,
1.193386, -0.9095368, 3.506862, 1, 1, 1, 1, 1,
1.207506, 0.3263974, 3.546182, 1, 1, 1, 1, 1,
1.207695, -1.576294, 4.332277, 1, 1, 1, 1, 1,
1.219959, 1.620157, 0.5306282, 1, 1, 1, 1, 1,
1.228082, 0.9997572, 0.8053076, 1, 1, 1, 1, 1,
1.232006, -0.9795479, 2.213215, 1, 1, 1, 1, 1,
1.237081, 0.1738197, 0.05027347, 1, 1, 1, 1, 1,
1.239905, -0.2240552, 1.790369, 1, 1, 1, 1, 1,
1.241013, -1.47838, 3.610913, 1, 1, 1, 1, 1,
1.241322, 0.06252213, 0.5837476, 1, 1, 1, 1, 1,
1.241444, -0.4731358, 1.455709, 0, 0, 1, 1, 1,
1.242069, -0.2767032, 2.594414, 1, 0, 0, 1, 1,
1.242466, -0.8254422, 2.587479, 1, 0, 0, 1, 1,
1.274468, 1.573188, 1.590651, 1, 0, 0, 1, 1,
1.281157, -0.8148065, 1.246477, 1, 0, 0, 1, 1,
1.287381, -0.004605739, 0.3535641, 1, 0, 0, 1, 1,
1.290499, 1.804109, 1.0669, 0, 0, 0, 1, 1,
1.291683, -1.078833, 1.6394, 0, 0, 0, 1, 1,
1.29787, -1.445118, 2.035899, 0, 0, 0, 1, 1,
1.306745, -0.1122774, 0.7982479, 0, 0, 0, 1, 1,
1.307126, 0.9460675, 2.963619, 0, 0, 0, 1, 1,
1.316506, 0.3812434, 1.827218, 0, 0, 0, 1, 1,
1.322907, -0.7783695, 3.027125, 0, 0, 0, 1, 1,
1.337071, 0.1128715, 0.7619782, 1, 1, 1, 1, 1,
1.337542, 0.335861, 0.2360782, 1, 1, 1, 1, 1,
1.341521, 0.3636318, 1.408611, 1, 1, 1, 1, 1,
1.342337, 1.038536, 1.792457, 1, 1, 1, 1, 1,
1.344715, -0.8113908, 1.147112, 1, 1, 1, 1, 1,
1.347306, -2.904367, 2.287841, 1, 1, 1, 1, 1,
1.350855, -1.950871, 1.721546, 1, 1, 1, 1, 1,
1.351975, 0.660984, 0.3345559, 1, 1, 1, 1, 1,
1.35442, 0.1171964, 0.5673175, 1, 1, 1, 1, 1,
1.36673, -1.156303, 1.864335, 1, 1, 1, 1, 1,
1.367088, 0.5965871, 0.04990966, 1, 1, 1, 1, 1,
1.37701, -0.2119438, 0.908236, 1, 1, 1, 1, 1,
1.379182, 0.7544976, 0.2821276, 1, 1, 1, 1, 1,
1.405512, -0.8619746, 1.258088, 1, 1, 1, 1, 1,
1.416076, 0.07062513, 0.7764043, 1, 1, 1, 1, 1,
1.416928, -0.9883502, 1.028739, 0, 0, 1, 1, 1,
1.420715, -1.244958, 3.840006, 1, 0, 0, 1, 1,
1.426567, -1.704271, 2.6423, 1, 0, 0, 1, 1,
1.427269, -1.176419, 2.645386, 1, 0, 0, 1, 1,
1.436942, -1.641044, 2.963829, 1, 0, 0, 1, 1,
1.448888, -0.4077984, 1.810128, 1, 0, 0, 1, 1,
1.45471, -0.3315785, 2.396032, 0, 0, 0, 1, 1,
1.45472, -0.4005038, 0.6432641, 0, 0, 0, 1, 1,
1.461408, -0.3402185, 2.861479, 0, 0, 0, 1, 1,
1.466427, 0.4238781, 0.5627346, 0, 0, 0, 1, 1,
1.509817, -1.073363, 2.921344, 0, 0, 0, 1, 1,
1.511966, -0.7458946, 3.047915, 0, 0, 0, 1, 1,
1.513966, 0.3535889, 0.2476347, 0, 0, 0, 1, 1,
1.514423, -1.312869, 0.2330125, 1, 1, 1, 1, 1,
1.515516, 0.5318283, 0.8223956, 1, 1, 1, 1, 1,
1.518859, -1.295365, 0.008459141, 1, 1, 1, 1, 1,
1.526217, -0.2654563, 1.900853, 1, 1, 1, 1, 1,
1.535141, 1.508731, 0.8222485, 1, 1, 1, 1, 1,
1.53951, 1.431242, 3.193376, 1, 1, 1, 1, 1,
1.551946, -0.3878866, -0.4407066, 1, 1, 1, 1, 1,
1.561449, -0.1348359, 2.424459, 1, 1, 1, 1, 1,
1.564455, 1.025212, 1.792572, 1, 1, 1, 1, 1,
1.565026, 0.8830534, 0.7480499, 1, 1, 1, 1, 1,
1.579307, 0.08821752, 1.135498, 1, 1, 1, 1, 1,
1.58146, -0.3327121, 1.904949, 1, 1, 1, 1, 1,
1.59445, -2.519561, 1.811938, 1, 1, 1, 1, 1,
1.60079, -1.109225, 2.115892, 1, 1, 1, 1, 1,
1.609724, 0.06697299, 1.817757, 1, 1, 1, 1, 1,
1.611993, -0.4193266, 1.54674, 0, 0, 1, 1, 1,
1.630037, -0.01355215, -0.1255422, 1, 0, 0, 1, 1,
1.667417, 0.2349712, 2.145809, 1, 0, 0, 1, 1,
1.670898, 1.982184, -0.2906414, 1, 0, 0, 1, 1,
1.678616, 0.7214342, 1.22292, 1, 0, 0, 1, 1,
1.678625, -0.4531903, 2.222237, 1, 0, 0, 1, 1,
1.679281, -0.7826625, 1.0746, 0, 0, 0, 1, 1,
1.686088, 1.325577, 2.766625, 0, 0, 0, 1, 1,
1.702107, -1.044274, 4.668199, 0, 0, 0, 1, 1,
1.720398, 0.9762298, -0.09721808, 0, 0, 0, 1, 1,
1.72405, 2.21488, 0.3049226, 0, 0, 0, 1, 1,
1.732464, 0.9698411, 0.5558083, 0, 0, 0, 1, 1,
1.735422, -2.908056, 3.205906, 0, 0, 0, 1, 1,
1.749467, -2.273604, 3.373315, 1, 1, 1, 1, 1,
1.757866, -0.1089704, 1.521004, 1, 1, 1, 1, 1,
1.760505, 0.8061165, 1.178058, 1, 1, 1, 1, 1,
1.773845, -0.4092756, 0.7995989, 1, 1, 1, 1, 1,
1.787158, -1.88891, 3.374425, 1, 1, 1, 1, 1,
1.791069, 0.9714549, 2.35465, 1, 1, 1, 1, 1,
1.798825, 0.8377411, 0.5150484, 1, 1, 1, 1, 1,
1.805087, -0.7108484, 2.75692, 1, 1, 1, 1, 1,
1.806368, 0.8680856, 0.7218783, 1, 1, 1, 1, 1,
1.812022, -1.503206, 1.411986, 1, 1, 1, 1, 1,
1.83121, -0.5285192, 0.933758, 1, 1, 1, 1, 1,
1.83231, 0.8838742, 0.6895289, 1, 1, 1, 1, 1,
1.860789, 0.158085, 1.165144, 1, 1, 1, 1, 1,
1.867138, -0.1681933, 2.76963, 1, 1, 1, 1, 1,
1.887896, -0.5758342, 2.340623, 1, 1, 1, 1, 1,
1.910532, -0.8059449, 3.947377, 0, 0, 1, 1, 1,
1.921424, -0.09953058, 0.3434076, 1, 0, 0, 1, 1,
1.951941, -1.451717, 2.679613, 1, 0, 0, 1, 1,
1.961104, -2.060179, 3.375228, 1, 0, 0, 1, 1,
2.016639, -0.23936, -0.1071428, 1, 0, 0, 1, 1,
2.036768, -0.2331107, 1.602661, 1, 0, 0, 1, 1,
2.047778, 1.296039, 0.1126958, 0, 0, 0, 1, 1,
2.060354, -1.188263, 2.875026, 0, 0, 0, 1, 1,
2.06989, 0.02307045, 2.877288, 0, 0, 0, 1, 1,
2.096536, 1.386302, 1.04561, 0, 0, 0, 1, 1,
2.219477, 1.112559, 1.9533, 0, 0, 0, 1, 1,
2.22874, -1.229757, 1.857469, 0, 0, 0, 1, 1,
2.237489, 1.255562, 0.9011178, 0, 0, 0, 1, 1,
2.293097, -0.9922953, 0.8968114, 1, 1, 1, 1, 1,
2.32959, 0.4962462, 1.057555, 1, 1, 1, 1, 1,
2.448502, -0.4210232, 2.117126, 1, 1, 1, 1, 1,
2.472844, 1.066322, 0.7480766, 1, 1, 1, 1, 1,
2.665226, 0.0364525, 1.158048, 1, 1, 1, 1, 1,
2.745121, 0.7294, 1.693026, 1, 1, 1, 1, 1,
2.94726, -0.4495543, 2.582049, 1, 1, 1, 1, 1
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
var radius = 9.541028;
var distance = 33.51246;
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
mvMatrix.translate( 0.2114912, -0.1237693, -0.2556827 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.51246);
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
