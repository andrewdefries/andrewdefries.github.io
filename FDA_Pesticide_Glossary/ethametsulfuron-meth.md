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
-2.664756, -0.5259313, -0.7687865, 1, 0, 0, 1,
-2.664672, 0.0185835, -1.868489, 1, 0.007843138, 0, 1,
-2.603637, -0.9506004, -0.5650348, 1, 0.01176471, 0, 1,
-2.561009, 0.04320146, 1.572621, 1, 0.01960784, 0, 1,
-2.541796, -0.6457543, -3.173586, 1, 0.02352941, 0, 1,
-2.337383, -0.2659339, -2.267278, 1, 0.03137255, 0, 1,
-2.276018, -0.2537613, -3.33864, 1, 0.03529412, 0, 1,
-2.262002, 0.1502889, -2.594579, 1, 0.04313726, 0, 1,
-2.124857, -1.441993, -1.885022, 1, 0.04705882, 0, 1,
-2.108249, 1.143186, -1.869682, 1, 0.05490196, 0, 1,
-2.094906, -1.371808, -0.4238939, 1, 0.05882353, 0, 1,
-2.08532, 0.1203261, -0.8574566, 1, 0.06666667, 0, 1,
-2.082776, 0.7614846, -0.09841152, 1, 0.07058824, 0, 1,
-2.063046, -0.0965637, -2.055078, 1, 0.07843138, 0, 1,
-1.986631, -0.2657413, -1.480668, 1, 0.08235294, 0, 1,
-1.971036, 0.2969085, -0.6807629, 1, 0.09019608, 0, 1,
-1.948164, 0.2534627, -0.8138741, 1, 0.09411765, 0, 1,
-1.927934, 0.2540269, -1.633206, 1, 0.1019608, 0, 1,
-1.918531, -0.9439709, -1.991322, 1, 0.1098039, 0, 1,
-1.887697, -0.2794631, -3.104129, 1, 0.1137255, 0, 1,
-1.874204, -1.004764, -2.662525, 1, 0.1215686, 0, 1,
-1.862037, 0.8593967, -2.162395, 1, 0.1254902, 0, 1,
-1.834469, 0.5332208, 0.5352099, 1, 0.1333333, 0, 1,
-1.819814, 0.1325596, -0.6328056, 1, 0.1372549, 0, 1,
-1.810382, -1.317777, -3.765685, 1, 0.145098, 0, 1,
-1.810252, 0.6853982, 0.132208, 1, 0.1490196, 0, 1,
-1.7629, -0.07310963, -2.403826, 1, 0.1568628, 0, 1,
-1.743463, -0.5390739, -0.8333525, 1, 0.1607843, 0, 1,
-1.738485, -0.07737344, -0.9816102, 1, 0.1686275, 0, 1,
-1.704101, 2.102156, -0.1311641, 1, 0.172549, 0, 1,
-1.699416, -0.2599984, -1.108068, 1, 0.1803922, 0, 1,
-1.675281, -1.49419, -1.437383, 1, 0.1843137, 0, 1,
-1.667891, -0.4608475, -2.662621, 1, 0.1921569, 0, 1,
-1.654587, 1.508073, -1.514057, 1, 0.1960784, 0, 1,
-1.647092, -0.9017861, -1.176025, 1, 0.2039216, 0, 1,
-1.63406, -0.1973794, -2.34731, 1, 0.2117647, 0, 1,
-1.631784, -2.144863, -2.481207, 1, 0.2156863, 0, 1,
-1.626903, 0.911102, 0.4862539, 1, 0.2235294, 0, 1,
-1.624143, -0.4583467, -2.179971, 1, 0.227451, 0, 1,
-1.616459, 0.2040016, -1.95814, 1, 0.2352941, 0, 1,
-1.604473, -1.486336, -2.517364, 1, 0.2392157, 0, 1,
-1.599862, 1.110276, -1.12679, 1, 0.2470588, 0, 1,
-1.598974, 1.034104, 0.0197696, 1, 0.2509804, 0, 1,
-1.597808, 0.7241177, -0.6540666, 1, 0.2588235, 0, 1,
-1.587201, 1.138552, -1.438391, 1, 0.2627451, 0, 1,
-1.58628, 0.2081628, -1.287401, 1, 0.2705882, 0, 1,
-1.584274, 1.357895, -1.135632, 1, 0.2745098, 0, 1,
-1.583512, 0.9412808, -0.2797737, 1, 0.282353, 0, 1,
-1.557729, -0.7510055, -0.4197982, 1, 0.2862745, 0, 1,
-1.543487, 0.1432929, -0.8069413, 1, 0.2941177, 0, 1,
-1.535964, 0.02703857, -1.912571, 1, 0.3019608, 0, 1,
-1.534029, 2.381458, -0.4224085, 1, 0.3058824, 0, 1,
-1.533007, 0.3491302, -1.275182, 1, 0.3137255, 0, 1,
-1.520215, -0.1168619, -2.298868, 1, 0.3176471, 0, 1,
-1.510109, -1.288106, -4.359809, 1, 0.3254902, 0, 1,
-1.477164, 0.04899559, -2.495149, 1, 0.3294118, 0, 1,
-1.465809, -0.7130399, -3.409666, 1, 0.3372549, 0, 1,
-1.463133, 0.2481336, -2.665786, 1, 0.3411765, 0, 1,
-1.455167, 0.2667252, -0.4853425, 1, 0.3490196, 0, 1,
-1.4453, 0.4198949, 0.8361933, 1, 0.3529412, 0, 1,
-1.442084, 1.050763, 0.1213197, 1, 0.3607843, 0, 1,
-1.439175, 0.05380787, -2.583919, 1, 0.3647059, 0, 1,
-1.438679, 0.6085092, -1.367308, 1, 0.372549, 0, 1,
-1.438334, -0.9323663, -1.779775, 1, 0.3764706, 0, 1,
-1.427526, -0.8888388, -2.578214, 1, 0.3843137, 0, 1,
-1.423667, -0.08751517, -2.157932, 1, 0.3882353, 0, 1,
-1.423475, -0.2934719, -2.0176, 1, 0.3960784, 0, 1,
-1.418715, -0.9720314, -3.547377, 1, 0.4039216, 0, 1,
-1.408529, 0.2234568, -0.9498572, 1, 0.4078431, 0, 1,
-1.400347, 0.537391, -1.054625, 1, 0.4156863, 0, 1,
-1.399373, -0.4468231, -3.000999, 1, 0.4196078, 0, 1,
-1.396463, -1.08398, -1.149697, 1, 0.427451, 0, 1,
-1.394866, -0.5038904, -1.478354, 1, 0.4313726, 0, 1,
-1.388945, 1.378941, -3.288089, 1, 0.4392157, 0, 1,
-1.374291, -0.8822294, -2.22144, 1, 0.4431373, 0, 1,
-1.371652, 0.05006536, -2.902883, 1, 0.4509804, 0, 1,
-1.370825, -0.1776108, -1.813475, 1, 0.454902, 0, 1,
-1.360401, -0.5186456, -1.681913, 1, 0.4627451, 0, 1,
-1.357892, 1.034878, -0.8913957, 1, 0.4666667, 0, 1,
-1.355021, -1.792089, -2.716172, 1, 0.4745098, 0, 1,
-1.352267, 2.049121, 0.7778603, 1, 0.4784314, 0, 1,
-1.348662, -1.280238, -1.958336, 1, 0.4862745, 0, 1,
-1.347937, -0.5542939, -2.076059, 1, 0.4901961, 0, 1,
-1.346691, -0.1340187, -1.183474, 1, 0.4980392, 0, 1,
-1.338349, -0.2157327, -0.3498177, 1, 0.5058824, 0, 1,
-1.3225, -0.668358, -2.760594, 1, 0.509804, 0, 1,
-1.319922, 0.29717, -3.314219, 1, 0.5176471, 0, 1,
-1.319825, 0.163133, -2.418987, 1, 0.5215687, 0, 1,
-1.303787, 0.03864763, -2.473699, 1, 0.5294118, 0, 1,
-1.297263, 0.5258511, -0.08360488, 1, 0.5333334, 0, 1,
-1.295936, -1.322445, -1.323424, 1, 0.5411765, 0, 1,
-1.293892, -1.135933, -1.957217, 1, 0.5450981, 0, 1,
-1.281625, -0.5386379, -1.561425, 1, 0.5529412, 0, 1,
-1.268492, 1.048079, -0.1681501, 1, 0.5568628, 0, 1,
-1.267771, 1.363261, -0.4785768, 1, 0.5647059, 0, 1,
-1.26717, -0.4652596, -2.290833, 1, 0.5686275, 0, 1,
-1.265149, -0.6658973, -3.257479, 1, 0.5764706, 0, 1,
-1.262849, 0.6821021, -0.4953294, 1, 0.5803922, 0, 1,
-1.25765, 2.411454, -0.1438526, 1, 0.5882353, 0, 1,
-1.24783, 0.1645913, 0.2734452, 1, 0.5921569, 0, 1,
-1.244726, 0.05787498, -0.5724717, 1, 0.6, 0, 1,
-1.2283, -0.7537007, -0.6945932, 1, 0.6078432, 0, 1,
-1.220675, 0.5051072, -1.148034, 1, 0.6117647, 0, 1,
-1.204655, 0.5782239, 0.3680303, 1, 0.6196079, 0, 1,
-1.202723, -0.1765688, -2.693884, 1, 0.6235294, 0, 1,
-1.197268, 0.3679926, -2.354058, 1, 0.6313726, 0, 1,
-1.194677, 1.781949, -0.8190241, 1, 0.6352941, 0, 1,
-1.185312, 1.052727, -0.1525731, 1, 0.6431373, 0, 1,
-1.177572, 0.1368445, -1.107219, 1, 0.6470588, 0, 1,
-1.173987, 0.08041292, -1.161848, 1, 0.654902, 0, 1,
-1.173714, -0.4256112, -3.097987, 1, 0.6588235, 0, 1,
-1.173394, 0.379573, -2.413979, 1, 0.6666667, 0, 1,
-1.168645, -0.4277607, -1.652835, 1, 0.6705883, 0, 1,
-1.16551, 0.09581226, -0.671142, 1, 0.6784314, 0, 1,
-1.164262, 0.03038953, -0.6955314, 1, 0.682353, 0, 1,
-1.160617, -0.8154308, -3.205011, 1, 0.6901961, 0, 1,
-1.142062, -0.2959826, -0.3541324, 1, 0.6941177, 0, 1,
-1.140793, 0.9924902, 0.640885, 1, 0.7019608, 0, 1,
-1.131181, 0.09214435, -0.7514008, 1, 0.7098039, 0, 1,
-1.128845, -1.576446, -1.744312, 1, 0.7137255, 0, 1,
-1.124444, 1.00773, -0.5308286, 1, 0.7215686, 0, 1,
-1.117042, 1.436634, -0.847368, 1, 0.7254902, 0, 1,
-1.091888, -0.917035, -2.230999, 1, 0.7333333, 0, 1,
-1.090523, 1.260762, 0.2980633, 1, 0.7372549, 0, 1,
-1.07652, -1.722995, -1.368326, 1, 0.7450981, 0, 1,
-1.072963, -0.8235864, -1.015052, 1, 0.7490196, 0, 1,
-1.068238, -1.482622, -2.419984, 1, 0.7568628, 0, 1,
-1.064121, 0.8724263, 0.1948446, 1, 0.7607843, 0, 1,
-1.063273, 0.7949299, -0.4593742, 1, 0.7686275, 0, 1,
-1.05514, -1.512082, -4.372579, 1, 0.772549, 0, 1,
-1.054863, -0.05085533, -2.77791, 1, 0.7803922, 0, 1,
-1.052907, -0.342639, -1.50635, 1, 0.7843137, 0, 1,
-1.051995, -0.1630361, -0.9228653, 1, 0.7921569, 0, 1,
-1.050153, -1.610119, -2.538591, 1, 0.7960784, 0, 1,
-1.047572, 0.4136513, -1.417464, 1, 0.8039216, 0, 1,
-1.037228, -0.5187244, -1.644263, 1, 0.8117647, 0, 1,
-1.034117, -0.0930529, -0.1449833, 1, 0.8156863, 0, 1,
-1.029513, -0.358203, -1.285406, 1, 0.8235294, 0, 1,
-1.02371, -0.8819004, -2.979025, 1, 0.827451, 0, 1,
-1.021548, -0.3457031, -2.470983, 1, 0.8352941, 0, 1,
-1.015319, 0.9204888, -0.3846284, 1, 0.8392157, 0, 1,
-1.014369, 1.435483, -0.59087, 1, 0.8470588, 0, 1,
-1.01375, 0.5638668, 0.04145132, 1, 0.8509804, 0, 1,
-1.006431, -0.6619819, -1.982119, 1, 0.8588235, 0, 1,
-1.004886, -1.883383, -2.787199, 1, 0.8627451, 0, 1,
-1.003262, -0.01651344, 0.6318319, 1, 0.8705882, 0, 1,
-1.001744, 0.5806528, -0.5441068, 1, 0.8745098, 0, 1,
-0.9999312, -0.102332, -2.223058, 1, 0.8823529, 0, 1,
-0.9966818, 0.6296316, -1.404616, 1, 0.8862745, 0, 1,
-0.9963392, -0.743582, -2.259423, 1, 0.8941177, 0, 1,
-0.9929052, 1.736743, 1.646011, 1, 0.8980392, 0, 1,
-0.9922974, -0.05455929, -2.628518, 1, 0.9058824, 0, 1,
-0.9874557, 0.9074628, -1.460366, 1, 0.9137255, 0, 1,
-0.9781845, -0.9391397, -2.86777, 1, 0.9176471, 0, 1,
-0.9759867, -1.106135, -2.78224, 1, 0.9254902, 0, 1,
-0.971094, 0.9428943, -1.056682, 1, 0.9294118, 0, 1,
-0.9651435, -1.220144, -1.83487, 1, 0.9372549, 0, 1,
-0.9623089, 2.239881, -0.5500433, 1, 0.9411765, 0, 1,
-0.9447085, -2.297809, -4.287965, 1, 0.9490196, 0, 1,
-0.9407572, 0.9789827, 0.253252, 1, 0.9529412, 0, 1,
-0.9304497, 0.5207128, -2.370343, 1, 0.9607843, 0, 1,
-0.9243885, -0.1242452, -1.079841, 1, 0.9647059, 0, 1,
-0.9236832, 1.350221, -0.4147868, 1, 0.972549, 0, 1,
-0.9195172, -0.6192502, -0.594763, 1, 0.9764706, 0, 1,
-0.9189188, 1.373691, 0.6985875, 1, 0.9843137, 0, 1,
-0.9145218, -0.1044835, -1.751904, 1, 0.9882353, 0, 1,
-0.9131792, 0.0790663, -2.930622, 1, 0.9960784, 0, 1,
-0.9085255, 0.3376488, -1.780323, 0.9960784, 1, 0, 1,
-0.9020092, -1.747209, -2.122509, 0.9921569, 1, 0, 1,
-0.9014726, -0.5324075, -2.51799, 0.9843137, 1, 0, 1,
-0.9007435, 0.6106287, -0.7307625, 0.9803922, 1, 0, 1,
-0.9004876, 0.6686267, -2.011641, 0.972549, 1, 0, 1,
-0.8993525, -1.385738, -1.817856, 0.9686275, 1, 0, 1,
-0.891367, -1.088753, -2.554313, 0.9607843, 1, 0, 1,
-0.889715, 0.563125, -2.3454, 0.9568627, 1, 0, 1,
-0.889449, 0.41904, -1.053185, 0.9490196, 1, 0, 1,
-0.8679731, 1.10113, 1.270581, 0.945098, 1, 0, 1,
-0.8619063, 0.07766845, -3.177195, 0.9372549, 1, 0, 1,
-0.8611709, -0.6586289, -3.022165, 0.9333333, 1, 0, 1,
-0.8602582, -0.020972, -1.752574, 0.9254902, 1, 0, 1,
-0.8578583, -0.3643275, -1.176852, 0.9215686, 1, 0, 1,
-0.8577279, -1.731666, -1.911939, 0.9137255, 1, 0, 1,
-0.8558245, -1.090283, -2.357749, 0.9098039, 1, 0, 1,
-0.85534, 0.370035, -0.5743001, 0.9019608, 1, 0, 1,
-0.8537841, 0.1802266, -0.6449776, 0.8941177, 1, 0, 1,
-0.8529292, -0.5063106, -2.006422, 0.8901961, 1, 0, 1,
-0.8522295, -0.1106537, -3.049046, 0.8823529, 1, 0, 1,
-0.8477565, -1.153757, -2.599249, 0.8784314, 1, 0, 1,
-0.847513, -1.089676, -4.434546, 0.8705882, 1, 0, 1,
-0.8383676, -0.2755261, -1.645192, 0.8666667, 1, 0, 1,
-0.8381609, 0.111219, -1.01561, 0.8588235, 1, 0, 1,
-0.8369389, 0.7293405, 0.1748761, 0.854902, 1, 0, 1,
-0.8350762, -0.6475725, -1.862887, 0.8470588, 1, 0, 1,
-0.8348524, -2.219693, -2.809189, 0.8431373, 1, 0, 1,
-0.8297868, 0.04224932, -2.107649, 0.8352941, 1, 0, 1,
-0.8244913, 1.220228, -0.1440495, 0.8313726, 1, 0, 1,
-0.8203821, 0.5772017, -0.2805009, 0.8235294, 1, 0, 1,
-0.8146866, 2.043653, -0.1660242, 0.8196079, 1, 0, 1,
-0.8132982, -1.209524, -3.137251, 0.8117647, 1, 0, 1,
-0.8052157, -0.45228, -1.92705, 0.8078431, 1, 0, 1,
-0.8044814, -0.2986, -3.963183, 0.8, 1, 0, 1,
-0.801303, 1.575913, -1.305597, 0.7921569, 1, 0, 1,
-0.7930676, 0.03681378, -1.385391, 0.7882353, 1, 0, 1,
-0.7929463, 1.154597, -1.41035, 0.7803922, 1, 0, 1,
-0.7837016, -0.4477495, -0.2863265, 0.7764706, 1, 0, 1,
-0.781991, 0.5984468, -1.744068, 0.7686275, 1, 0, 1,
-0.7798362, 0.8874333, -0.6595708, 0.7647059, 1, 0, 1,
-0.7783668, -1.082144, -1.529522, 0.7568628, 1, 0, 1,
-0.768169, 0.2394188, -0.1325765, 0.7529412, 1, 0, 1,
-0.7631133, -2.053754, -3.451916, 0.7450981, 1, 0, 1,
-0.7601007, -0.7420319, -2.509503, 0.7411765, 1, 0, 1,
-0.759258, -0.04542977, -2.922959, 0.7333333, 1, 0, 1,
-0.7589918, 0.06374134, -2.122963, 0.7294118, 1, 0, 1,
-0.7578737, -0.158414, -0.8370038, 0.7215686, 1, 0, 1,
-0.7496849, -0.6450372, -2.130204, 0.7176471, 1, 0, 1,
-0.7440276, -1.362611, -3.042608, 0.7098039, 1, 0, 1,
-0.7395378, 0.307362, -0.5203624, 0.7058824, 1, 0, 1,
-0.739287, -0.00107372, -2.136189, 0.6980392, 1, 0, 1,
-0.7373123, 0.3787607, -2.64528, 0.6901961, 1, 0, 1,
-0.7371667, 0.9729051, -0.6290917, 0.6862745, 1, 0, 1,
-0.7350198, 0.8184025, -0.5135157, 0.6784314, 1, 0, 1,
-0.7330117, 0.6461602, -0.00700062, 0.6745098, 1, 0, 1,
-0.73058, -0.3647957, -1.152858, 0.6666667, 1, 0, 1,
-0.7130916, -1.410412, -2.586898, 0.6627451, 1, 0, 1,
-0.7028787, 1.714013, -1.06757, 0.654902, 1, 0, 1,
-0.7010266, 0.1565414, -1.74621, 0.6509804, 1, 0, 1,
-0.6973263, 0.6357703, -0.8305151, 0.6431373, 1, 0, 1,
-0.6968679, 0.8775795, 0.5185243, 0.6392157, 1, 0, 1,
-0.6919791, -0.3035832, -1.140003, 0.6313726, 1, 0, 1,
-0.6872694, 0.1435193, -0.5642792, 0.627451, 1, 0, 1,
-0.6858177, 1.489405, -2.448524, 0.6196079, 1, 0, 1,
-0.6844835, -0.1133623, -2.70015, 0.6156863, 1, 0, 1,
-0.6797279, -1.581186, -2.791746, 0.6078432, 1, 0, 1,
-0.6775715, 1.205812, 0.5640605, 0.6039216, 1, 0, 1,
-0.670642, 0.6351905, -2.418984, 0.5960785, 1, 0, 1,
-0.6698261, 0.07598586, -0.165536, 0.5882353, 1, 0, 1,
-0.6651338, -1.174099, -2.282939, 0.5843138, 1, 0, 1,
-0.6623152, 0.4266204, 0.8676941, 0.5764706, 1, 0, 1,
-0.6570086, 0.01337216, -1.266706, 0.572549, 1, 0, 1,
-0.6550214, -0.5834612, -1.299441, 0.5647059, 1, 0, 1,
-0.6535609, 0.03831241, -1.648147, 0.5607843, 1, 0, 1,
-0.6530197, -2.006516, -3.459257, 0.5529412, 1, 0, 1,
-0.6489733, 0.03847686, 0.0639859, 0.5490196, 1, 0, 1,
-0.6457943, 1.833611, -0.7512281, 0.5411765, 1, 0, 1,
-0.6449677, 0.3111706, -1.745177, 0.5372549, 1, 0, 1,
-0.6391285, 0.4863865, -1.68969, 0.5294118, 1, 0, 1,
-0.6386345, -0.09397009, -1.699917, 0.5254902, 1, 0, 1,
-0.6384591, 0.1805583, -2.007147, 0.5176471, 1, 0, 1,
-0.6366462, 0.2805162, -2.269721, 0.5137255, 1, 0, 1,
-0.6344601, -0.8196846, -3.828033, 0.5058824, 1, 0, 1,
-0.6261823, 0.06005451, -2.042538, 0.5019608, 1, 0, 1,
-0.6209872, 0.6513219, 0.3717662, 0.4941176, 1, 0, 1,
-0.6181054, 1.087585, -1.467995, 0.4862745, 1, 0, 1,
-0.6160222, 1.21476, -0.8836942, 0.4823529, 1, 0, 1,
-0.6097649, 1.050364, -0.1244985, 0.4745098, 1, 0, 1,
-0.6056724, -0.2160916, -1.464026, 0.4705882, 1, 0, 1,
-0.6034807, 1.191727, -1.050373, 0.4627451, 1, 0, 1,
-0.6032459, -0.9451711, -3.071092, 0.4588235, 1, 0, 1,
-0.6028836, 0.531076, -0.3819797, 0.4509804, 1, 0, 1,
-0.6027569, -0.9349552, 0.6248692, 0.4470588, 1, 0, 1,
-0.6007489, 0.9925888, -2.190716, 0.4392157, 1, 0, 1,
-0.6002838, 0.2179818, -1.788488, 0.4352941, 1, 0, 1,
-0.5958992, 1.178787, -2.699456, 0.427451, 1, 0, 1,
-0.5954866, 0.8253182, -2.974669, 0.4235294, 1, 0, 1,
-0.5932632, 0.5143674, -1.414826, 0.4156863, 1, 0, 1,
-0.5903806, -0.05913967, -1.149882, 0.4117647, 1, 0, 1,
-0.58958, 0.2992372, -0.6439182, 0.4039216, 1, 0, 1,
-0.5888448, 0.101982, 0.4482147, 0.3960784, 1, 0, 1,
-0.5860329, 0.3757802, -1.737097, 0.3921569, 1, 0, 1,
-0.5849541, -0.1971164, -1.745089, 0.3843137, 1, 0, 1,
-0.5841758, 0.4666917, -0.5343265, 0.3803922, 1, 0, 1,
-0.5830392, 0.5747468, -1.769941, 0.372549, 1, 0, 1,
-0.5819362, 1.518195, -0.6353008, 0.3686275, 1, 0, 1,
-0.5811887, -0.892026, 0.9994373, 0.3607843, 1, 0, 1,
-0.5797327, -0.2076455, -4.274878, 0.3568628, 1, 0, 1,
-0.5684912, 0.2495118, -3.211152, 0.3490196, 1, 0, 1,
-0.5682428, -1.949218, -3.023788, 0.345098, 1, 0, 1,
-0.563684, 3.000711, -0.7782292, 0.3372549, 1, 0, 1,
-0.5604377, 0.4631325, -1.680784, 0.3333333, 1, 0, 1,
-0.5386339, 0.6592894, 0.9388431, 0.3254902, 1, 0, 1,
-0.5372581, 0.4430345, -0.1181741, 0.3215686, 1, 0, 1,
-0.5357994, 0.2907746, -1.672874, 0.3137255, 1, 0, 1,
-0.533709, 0.07474604, -0.1057111, 0.3098039, 1, 0, 1,
-0.5335049, 0.07416115, -2.877434, 0.3019608, 1, 0, 1,
-0.5296722, -0.2188704, -3.371176, 0.2941177, 1, 0, 1,
-0.527447, 2.321998, -0.7628568, 0.2901961, 1, 0, 1,
-0.5263879, -1.255016, -4.355182, 0.282353, 1, 0, 1,
-0.5252663, 0.003680754, -0.5852134, 0.2784314, 1, 0, 1,
-0.5220599, 0.677888, -1.441539, 0.2705882, 1, 0, 1,
-0.5197761, -0.7896374, -1.365359, 0.2666667, 1, 0, 1,
-0.5189738, -0.4562146, -2.538636, 0.2588235, 1, 0, 1,
-0.5183258, 0.0856171, -2.27723, 0.254902, 1, 0, 1,
-0.516629, -0.3104703, -1.406787, 0.2470588, 1, 0, 1,
-0.5130166, 0.6141651, -0.8237591, 0.2431373, 1, 0, 1,
-0.5091753, -1.50968, -2.330298, 0.2352941, 1, 0, 1,
-0.5069718, 0.5196378, -0.2642165, 0.2313726, 1, 0, 1,
-0.5044733, 0.6700392, 1.268206, 0.2235294, 1, 0, 1,
-0.5009906, -0.3185969, -2.718493, 0.2196078, 1, 0, 1,
-0.499917, 0.1530453, -2.683169, 0.2117647, 1, 0, 1,
-0.4931432, -0.04690123, -2.043735, 0.2078431, 1, 0, 1,
-0.486706, 1.938779, 2.214054, 0.2, 1, 0, 1,
-0.4801697, 2.427356, 0.3182414, 0.1921569, 1, 0, 1,
-0.4766358, 0.6885611, 0.3997359, 0.1882353, 1, 0, 1,
-0.4682628, -0.3127481, -0.1615439, 0.1803922, 1, 0, 1,
-0.4650131, -0.5403955, -3.615721, 0.1764706, 1, 0, 1,
-0.4643042, -0.1856087, -1.749675, 0.1686275, 1, 0, 1,
-0.4642253, 0.4009047, -2.323886, 0.1647059, 1, 0, 1,
-0.4618651, -0.2354025, -3.361992, 0.1568628, 1, 0, 1,
-0.4575236, 0.2722565, -1.501546, 0.1529412, 1, 0, 1,
-0.4561175, 1.290961, -0.6051433, 0.145098, 1, 0, 1,
-0.4540826, 0.8768071, -0.8648614, 0.1411765, 1, 0, 1,
-0.4509437, 1.536168, -0.6708182, 0.1333333, 1, 0, 1,
-0.449398, 1.176759, -2.761744, 0.1294118, 1, 0, 1,
-0.4453988, 0.3109901, -0.7854909, 0.1215686, 1, 0, 1,
-0.4451837, -0.4140116, -3.193657, 0.1176471, 1, 0, 1,
-0.4449791, 0.06083148, -0.5313346, 0.1098039, 1, 0, 1,
-0.4388412, 2.345892, -0.9594541, 0.1058824, 1, 0, 1,
-0.435503, 0.5301074, -0.8671387, 0.09803922, 1, 0, 1,
-0.4347452, -0.0007350713, -2.914951, 0.09019608, 1, 0, 1,
-0.4313777, 0.8394498, -0.5913655, 0.08627451, 1, 0, 1,
-0.4275831, 0.7449703, -0.2754332, 0.07843138, 1, 0, 1,
-0.4274267, -1.184092, -2.23435, 0.07450981, 1, 0, 1,
-0.426215, 0.2321024, -1.336353, 0.06666667, 1, 0, 1,
-0.4261928, -0.3186435, -3.11072, 0.0627451, 1, 0, 1,
-0.4224828, 0.9163089, -1.775377, 0.05490196, 1, 0, 1,
-0.4143621, -0.177279, -1.130328, 0.05098039, 1, 0, 1,
-0.413208, 1.799185, 1.136661, 0.04313726, 1, 0, 1,
-0.4131073, -0.282284, -0.3234758, 0.03921569, 1, 0, 1,
-0.4089173, 1.188742, 1.230943, 0.03137255, 1, 0, 1,
-0.4072714, -0.5242752, -1.773745, 0.02745098, 1, 0, 1,
-0.4058063, 1.164386, -0.3555827, 0.01960784, 1, 0, 1,
-0.4051213, -0.3306214, -2.149706, 0.01568628, 1, 0, 1,
-0.4046933, 0.4333658, 0.05259417, 0.007843138, 1, 0, 1,
-0.4045377, -1.140995, -3.677364, 0.003921569, 1, 0, 1,
-0.4008848, 0.3489419, -1.003993, 0, 1, 0.003921569, 1,
-0.4003507, -1.119472, -2.061536, 0, 1, 0.01176471, 1,
-0.3984011, 0.5693845, -0.3143213, 0, 1, 0.01568628, 1,
-0.3968748, -0.2060789, -1.034099, 0, 1, 0.02352941, 1,
-0.3862912, 0.1894608, -0.06943311, 0, 1, 0.02745098, 1,
-0.3860558, -0.9247595, -2.053728, 0, 1, 0.03529412, 1,
-0.3859553, 0.8315361, -2.027864, 0, 1, 0.03921569, 1,
-0.3854045, -0.2781252, -3.31802, 0, 1, 0.04705882, 1,
-0.3842657, -1.262127, -2.949916, 0, 1, 0.05098039, 1,
-0.3815109, -1.032516, -3.203086, 0, 1, 0.05882353, 1,
-0.3787863, 0.3706178, -1.504933, 0, 1, 0.0627451, 1,
-0.3781878, -1.826365, -4.21041, 0, 1, 0.07058824, 1,
-0.3778062, 0.4492663, 0.02654236, 0, 1, 0.07450981, 1,
-0.3777465, -1.639269, -3.133289, 0, 1, 0.08235294, 1,
-0.3760436, -1.077252, -3.47351, 0, 1, 0.08627451, 1,
-0.3734909, 1.500481, -1.159159, 0, 1, 0.09411765, 1,
-0.3706711, 0.5006405, -0.1988441, 0, 1, 0.1019608, 1,
-0.3639459, 1.128883, -1.964824, 0, 1, 0.1058824, 1,
-0.3620879, -0.605917, -2.335016, 0, 1, 0.1137255, 1,
-0.3609719, -0.1979452, -2.411173, 0, 1, 0.1176471, 1,
-0.3589714, 2.014445, -1.25744, 0, 1, 0.1254902, 1,
-0.3574857, -0.4931557, -0.3006907, 0, 1, 0.1294118, 1,
-0.3528947, -0.3796589, -3.59303, 0, 1, 0.1372549, 1,
-0.3510375, 0.03678399, -2.275136, 0, 1, 0.1411765, 1,
-0.3507556, -1.641803, -2.746253, 0, 1, 0.1490196, 1,
-0.3493433, -0.1290278, -2.042136, 0, 1, 0.1529412, 1,
-0.3486472, -0.4920713, -2.936616, 0, 1, 0.1607843, 1,
-0.3468055, -0.2680653, -1.598657, 0, 1, 0.1647059, 1,
-0.3460132, -1.188788, -2.53065, 0, 1, 0.172549, 1,
-0.3458166, 0.7380271, -2.100548, 0, 1, 0.1764706, 1,
-0.3440321, 0.9593735, -2.537348, 0, 1, 0.1843137, 1,
-0.3421202, 0.3520197, -3.500766, 0, 1, 0.1882353, 1,
-0.3412953, -1.568139, -4.441899, 0, 1, 0.1960784, 1,
-0.3405506, 0.9575827, -0.8657479, 0, 1, 0.2039216, 1,
-0.3400381, 0.1972097, -1.099402, 0, 1, 0.2078431, 1,
-0.3357401, -0.5119461, -3.478836, 0, 1, 0.2156863, 1,
-0.3338334, -0.4550489, -3.257162, 0, 1, 0.2196078, 1,
-0.3298364, -2.854759, -2.756701, 0, 1, 0.227451, 1,
-0.3135225, -3.094876, -2.680886, 0, 1, 0.2313726, 1,
-0.3132586, -0.1173803, -2.48996, 0, 1, 0.2392157, 1,
-0.3114426, 1.130118, 0.8576808, 0, 1, 0.2431373, 1,
-0.310473, -2.037694, -1.904461, 0, 1, 0.2509804, 1,
-0.3058379, 2.151501, 0.572859, 0, 1, 0.254902, 1,
-0.3052059, 1.111294, -1.326801, 0, 1, 0.2627451, 1,
-0.2998003, 1.795638, -0.04539376, 0, 1, 0.2666667, 1,
-0.2956166, 0.9633493, 0.0478486, 0, 1, 0.2745098, 1,
-0.2951698, 0.8830974, -1.170122, 0, 1, 0.2784314, 1,
-0.295049, -1.005516, -3.188748, 0, 1, 0.2862745, 1,
-0.2943488, 1.21414, -0.08044492, 0, 1, 0.2901961, 1,
-0.293648, -0.3901629, -3.086251, 0, 1, 0.2980392, 1,
-0.2911146, 0.3581654, -0.6917627, 0, 1, 0.3058824, 1,
-0.2897936, 0.7374288, -1.762246, 0, 1, 0.3098039, 1,
-0.2822785, 2.646702, -1.132795, 0, 1, 0.3176471, 1,
-0.2805846, 0.5625885, -0.7627806, 0, 1, 0.3215686, 1,
-0.2787515, 0.169253, -0.9596412, 0, 1, 0.3294118, 1,
-0.2722676, -0.009067402, -0.5349652, 0, 1, 0.3333333, 1,
-0.2708762, -0.6558416, -4.436479, 0, 1, 0.3411765, 1,
-0.2698925, -0.7801691, -5.071748, 0, 1, 0.345098, 1,
-0.2623194, 0.09338981, -0.06800017, 0, 1, 0.3529412, 1,
-0.2586599, -0.9394541, -4.076425, 0, 1, 0.3568628, 1,
-0.2565508, 2.403978, 0.747815, 0, 1, 0.3647059, 1,
-0.256007, 0.6009912, -1.296493, 0, 1, 0.3686275, 1,
-0.255308, -1.007128, -3.157431, 0, 1, 0.3764706, 1,
-0.2506748, -1.668906, -1.813855, 0, 1, 0.3803922, 1,
-0.245826, 0.4935285, 0.686886, 0, 1, 0.3882353, 1,
-0.2429664, 0.7181727, 0.1833876, 0, 1, 0.3921569, 1,
-0.2423726, -0.8472949, -1.274198, 0, 1, 0.4, 1,
-0.2385438, 1.399441, 0.5382332, 0, 1, 0.4078431, 1,
-0.2379658, 0.7045678, -1.110895, 0, 1, 0.4117647, 1,
-0.2371253, 0.5582479, 0.3444109, 0, 1, 0.4196078, 1,
-0.2334293, -2.661679, -3.268183, 0, 1, 0.4235294, 1,
-0.2330741, -0.7603509, -2.732748, 0, 1, 0.4313726, 1,
-0.2300122, 0.1601411, -2.048239, 0, 1, 0.4352941, 1,
-0.2297167, 0.2795186, -0.3587408, 0, 1, 0.4431373, 1,
-0.2289291, 0.3401706, -0.8415816, 0, 1, 0.4470588, 1,
-0.2279485, 0.4187917, -0.2254754, 0, 1, 0.454902, 1,
-0.2256481, 0.1737778, -0.04058855, 0, 1, 0.4588235, 1,
-0.2252102, -1.228332, -2.376974, 0, 1, 0.4666667, 1,
-0.223065, 0.1940574, -2.125195, 0, 1, 0.4705882, 1,
-0.2229398, -0.06658667, -1.9593, 0, 1, 0.4784314, 1,
-0.2189045, 1.619188, -1.648678, 0, 1, 0.4823529, 1,
-0.2179275, 0.2664204, -2.662682, 0, 1, 0.4901961, 1,
-0.2168151, -0.04732312, -2.10029, 0, 1, 0.4941176, 1,
-0.2166435, 0.0224307, -0.5695428, 0, 1, 0.5019608, 1,
-0.2117867, 0.2056946, -0.8997869, 0, 1, 0.509804, 1,
-0.2093577, 0.9173371, 0.6039056, 0, 1, 0.5137255, 1,
-0.2070918, 0.8643515, -0.7661791, 0, 1, 0.5215687, 1,
-0.2008514, -1.643308, -2.669487, 0, 1, 0.5254902, 1,
-0.2008342, 0.1706062, 0.5945383, 0, 1, 0.5333334, 1,
-0.2004302, -0.06819171, -2.818244, 0, 1, 0.5372549, 1,
-0.1998907, -0.2003841, -3.372404, 0, 1, 0.5450981, 1,
-0.199743, 0.2773726, -0.1688291, 0, 1, 0.5490196, 1,
-0.1975451, -0.1243601, -1.787167, 0, 1, 0.5568628, 1,
-0.1894782, -1.732181, -3.078381, 0, 1, 0.5607843, 1,
-0.1839793, -1.813302, -3.599998, 0, 1, 0.5686275, 1,
-0.1823636, 1.389415, -0.8366192, 0, 1, 0.572549, 1,
-0.1816384, 0.3332951, -1.000242, 0, 1, 0.5803922, 1,
-0.1795706, -0.685485, -2.49684, 0, 1, 0.5843138, 1,
-0.1778153, -1.639956, -2.245919, 0, 1, 0.5921569, 1,
-0.1769898, 0.2360741, -1.180373, 0, 1, 0.5960785, 1,
-0.17596, 1.527768, -0.6890625, 0, 1, 0.6039216, 1,
-0.1753109, -0.1370956, -1.602463, 0, 1, 0.6117647, 1,
-0.1748021, -0.3475612, -1.428838, 0, 1, 0.6156863, 1,
-0.1739867, -0.01938669, -0.5390292, 0, 1, 0.6235294, 1,
-0.1716024, 0.359909, 0.153234, 0, 1, 0.627451, 1,
-0.1680253, -1.473333, -0.5160035, 0, 1, 0.6352941, 1,
-0.1667372, 0.6236435, 0.4043312, 0, 1, 0.6392157, 1,
-0.164878, -0.2177955, -2.651234, 0, 1, 0.6470588, 1,
-0.1603756, -1.41173, -2.065654, 0, 1, 0.6509804, 1,
-0.1591148, 0.2250468, -1.61982, 0, 1, 0.6588235, 1,
-0.1476573, -0.1707832, -2.593349, 0, 1, 0.6627451, 1,
-0.1456059, 2.271473, -0.2954604, 0, 1, 0.6705883, 1,
-0.1442646, -1.420411, -2.620628, 0, 1, 0.6745098, 1,
-0.1398752, -2.714103, -3.401647, 0, 1, 0.682353, 1,
-0.1314443, 1.533838, -0.5321021, 0, 1, 0.6862745, 1,
-0.1309823, -1.365429, -3.412061, 0, 1, 0.6941177, 1,
-0.1283047, -0.6654191, -2.957486, 0, 1, 0.7019608, 1,
-0.1282013, 1.098891, -0.1592536, 0, 1, 0.7058824, 1,
-0.1235081, 1.875476, -0.197668, 0, 1, 0.7137255, 1,
-0.1219235, -0.619916, -3.153525, 0, 1, 0.7176471, 1,
-0.1219152, -0.2617713, -1.643464, 0, 1, 0.7254902, 1,
-0.115973, 1.015861, -0.8739138, 0, 1, 0.7294118, 1,
-0.1107296, 0.1964867, -1.251046, 0, 1, 0.7372549, 1,
-0.1073287, -1.409154, -3.188391, 0, 1, 0.7411765, 1,
-0.1069716, -1.419452, -3.588901, 0, 1, 0.7490196, 1,
-0.1029233, 0.213837, -0.7042708, 0, 1, 0.7529412, 1,
-0.1023897, 0.5766391, 0.1259458, 0, 1, 0.7607843, 1,
-0.09873694, 1.864531, 0.9026233, 0, 1, 0.7647059, 1,
-0.09330506, -0.9159703, -2.54672, 0, 1, 0.772549, 1,
-0.09180549, 0.388187, 0.4236435, 0, 1, 0.7764706, 1,
-0.08085298, 0.1008064, -1.870696, 0, 1, 0.7843137, 1,
-0.07599407, 0.7158701, 0.869009, 0, 1, 0.7882353, 1,
-0.07585653, -0.4977345, -3.312933, 0, 1, 0.7960784, 1,
-0.0740182, -0.4620968, -3.509566, 0, 1, 0.8039216, 1,
-0.07269882, 0.281617, 1.003335, 0, 1, 0.8078431, 1,
-0.07113042, -0.5207816, -4.799003, 0, 1, 0.8156863, 1,
-0.06882678, 0.3150356, -0.3141391, 0, 1, 0.8196079, 1,
-0.06669527, 1.50826, 0.5686123, 0, 1, 0.827451, 1,
-0.06208279, 0.05858295, -2.12693, 0, 1, 0.8313726, 1,
-0.06082992, 0.5254887, -0.05963929, 0, 1, 0.8392157, 1,
-0.06046402, 0.0731207, -2.305154, 0, 1, 0.8431373, 1,
-0.05685474, -1.495121, -2.245385, 0, 1, 0.8509804, 1,
-0.05680377, -0.8808275, -2.977058, 0, 1, 0.854902, 1,
-0.05637987, -0.2409991, -1.531831, 0, 1, 0.8627451, 1,
-0.05007007, -1.340969, -3.955438, 0, 1, 0.8666667, 1,
-0.04926869, 0.4974208, 2.011865, 0, 1, 0.8745098, 1,
-0.04210931, -0.2111835, -2.545864, 0, 1, 0.8784314, 1,
-0.0392055, -1.643034, -3.417893, 0, 1, 0.8862745, 1,
-0.03532481, 1.599928, -0.1731736, 0, 1, 0.8901961, 1,
-0.03392795, 1.090454, -0.5225397, 0, 1, 0.8980392, 1,
-0.03175403, -0.02983735, -3.269609, 0, 1, 0.9058824, 1,
-0.03072154, 1.395965, 0.1288736, 0, 1, 0.9098039, 1,
-0.02609134, -0.0779945, -2.144266, 0, 1, 0.9176471, 1,
-0.02361406, 0.9163423, 0.5972227, 0, 1, 0.9215686, 1,
-0.02134208, -0.114448, -4.05422, 0, 1, 0.9294118, 1,
-0.0210482, -0.8304837, -2.195329, 0, 1, 0.9333333, 1,
-0.01804935, 1.195061, -0.3745004, 0, 1, 0.9411765, 1,
-0.01770474, 0.6494328, -0.938547, 0, 1, 0.945098, 1,
-0.008710489, 0.3001765, -0.3398006, 0, 1, 0.9529412, 1,
-0.006432259, 1.413948, 0.03580463, 0, 1, 0.9568627, 1,
-0.006316662, 0.3762879, -0.1173791, 0, 1, 0.9647059, 1,
-0.006010767, -0.8312468, -4.20363, 0, 1, 0.9686275, 1,
-0.00414373, 0.5650277, -0.2611382, 0, 1, 0.9764706, 1,
0.001723633, 0.3901299, -0.4074456, 0, 1, 0.9803922, 1,
0.002645012, -1.356718, 1.428372, 0, 1, 0.9882353, 1,
0.01112398, 0.7196218, 1.782267, 0, 1, 0.9921569, 1,
0.01182504, -0.9286527, 3.519288, 0, 1, 1, 1,
0.01377976, 1.190852, -0.1311756, 0, 0.9921569, 1, 1,
0.01411193, 0.714766, -1.755997, 0, 0.9882353, 1, 1,
0.01745499, -1.796854, 4.21834, 0, 0.9803922, 1, 1,
0.02513774, -0.7785388, 4.669914, 0, 0.9764706, 1, 1,
0.03049141, -0.8892813, 1.908152, 0, 0.9686275, 1, 1,
0.0317907, 1.373527, -0.1493306, 0, 0.9647059, 1, 1,
0.03238914, 0.6070347, -1.226173, 0, 0.9568627, 1, 1,
0.03415878, 1.250717, 0.8777875, 0, 0.9529412, 1, 1,
0.0345454, -0.9540528, 3.11568, 0, 0.945098, 1, 1,
0.03605567, -0.1544875, 2.271562, 0, 0.9411765, 1, 1,
0.03978965, -0.001702373, 1.990722, 0, 0.9333333, 1, 1,
0.04338619, -0.9972658, 3.647436, 0, 0.9294118, 1, 1,
0.04388267, 0.03281206, 1.388643, 0, 0.9215686, 1, 1,
0.05437487, -0.5953056, 1.258597, 0, 0.9176471, 1, 1,
0.05699566, 0.313177, 0.7063199, 0, 0.9098039, 1, 1,
0.05792816, -0.8169767, 1.853786, 0, 0.9058824, 1, 1,
0.05918918, -0.4423268, 1.738152, 0, 0.8980392, 1, 1,
0.06118232, 0.7166016, 0.8159381, 0, 0.8901961, 1, 1,
0.06358071, -0.6179447, 3.686255, 0, 0.8862745, 1, 1,
0.06951816, 1.049087, -0.8154372, 0, 0.8784314, 1, 1,
0.07071511, 1.242227, 0.504047, 0, 0.8745098, 1, 1,
0.0718456, 0.0754649, 2.030817, 0, 0.8666667, 1, 1,
0.07515249, -0.003424327, 2.609649, 0, 0.8627451, 1, 1,
0.07570539, -2.909688, 3.371685, 0, 0.854902, 1, 1,
0.07602062, -0.1305979, 1.438221, 0, 0.8509804, 1, 1,
0.07942481, -0.7912381, 4.337957, 0, 0.8431373, 1, 1,
0.08004663, 0.7380127, 0.1125608, 0, 0.8392157, 1, 1,
0.08302812, 1.343211, -2.995477, 0, 0.8313726, 1, 1,
0.08532102, -1.194745, 4.160606, 0, 0.827451, 1, 1,
0.08563692, 0.7640749, -0.7673693, 0, 0.8196079, 1, 1,
0.08760563, 0.6606635, -0.1216798, 0, 0.8156863, 1, 1,
0.08872973, -0.2847907, 3.26015, 0, 0.8078431, 1, 1,
0.08922453, -0.2714879, 3.436338, 0, 0.8039216, 1, 1,
0.09077609, -0.8118941, 2.003185, 0, 0.7960784, 1, 1,
0.09113801, 0.986926, -0.300073, 0, 0.7882353, 1, 1,
0.09169174, -1.302516, 3.417904, 0, 0.7843137, 1, 1,
0.09492039, 1.505407, -0.7224391, 0, 0.7764706, 1, 1,
0.09538169, -0.3700072, 4.720352, 0, 0.772549, 1, 1,
0.1046889, 0.4577271, -0.8675959, 0, 0.7647059, 1, 1,
0.1066438, 2.270498, 1.19537, 0, 0.7607843, 1, 1,
0.1080264, -0.04673069, 3.44247, 0, 0.7529412, 1, 1,
0.1092389, -0.1792764, 4.698916, 0, 0.7490196, 1, 1,
0.1155193, -2.148654, 3.759035, 0, 0.7411765, 1, 1,
0.119958, -1.98156, 2.855153, 0, 0.7372549, 1, 1,
0.1244529, 2.03825, 0.1508108, 0, 0.7294118, 1, 1,
0.125839, 1.380702, 0.7700319, 0, 0.7254902, 1, 1,
0.1287672, 0.1982502, -0.04236976, 0, 0.7176471, 1, 1,
0.1313994, 0.559576, -0.7232922, 0, 0.7137255, 1, 1,
0.1314367, -1.014049, 2.084743, 0, 0.7058824, 1, 1,
0.1371049, -1.341794, 2.550014, 0, 0.6980392, 1, 1,
0.1402662, -0.8157694, 0.1839193, 0, 0.6941177, 1, 1,
0.1413649, 0.9923933, 0.3085939, 0, 0.6862745, 1, 1,
0.1424074, -0.7231386, 3.091643, 0, 0.682353, 1, 1,
0.1424456, -0.2410133, 3.538624, 0, 0.6745098, 1, 1,
0.1444876, 0.2254082, 2.098504, 0, 0.6705883, 1, 1,
0.1448401, 0.4003524, -0.8959616, 0, 0.6627451, 1, 1,
0.1462784, -1.250522, 3.705467, 0, 0.6588235, 1, 1,
0.1471938, -1.825608, 2.691047, 0, 0.6509804, 1, 1,
0.151052, 0.1918979, -1.574535, 0, 0.6470588, 1, 1,
0.1526341, 0.229523, 0.02530352, 0, 0.6392157, 1, 1,
0.1535847, -0.1680585, 1.737665, 0, 0.6352941, 1, 1,
0.1575715, 0.09327833, 2.068437, 0, 0.627451, 1, 1,
0.157956, -1.478988, 4.190189, 0, 0.6235294, 1, 1,
0.1687848, -1.175102, 4.174288, 0, 0.6156863, 1, 1,
0.1700677, 0.372158, 0.5891944, 0, 0.6117647, 1, 1,
0.1710895, 0.2013941, -0.952864, 0, 0.6039216, 1, 1,
0.1720981, 0.6320469, 0.2005435, 0, 0.5960785, 1, 1,
0.1721198, -3.202377, 2.802904, 0, 0.5921569, 1, 1,
0.1723661, -1.475749, 1.894508, 0, 0.5843138, 1, 1,
0.1735004, 0.6476514, -0.4083151, 0, 0.5803922, 1, 1,
0.1753733, 0.2996579, 1.4176, 0, 0.572549, 1, 1,
0.1764972, 1.643314, -0.40671, 0, 0.5686275, 1, 1,
0.179622, -0.4289839, 3.071897, 0, 0.5607843, 1, 1,
0.1807488, -0.5144348, 2.841153, 0, 0.5568628, 1, 1,
0.1817825, 0.1173915, 2.154365, 0, 0.5490196, 1, 1,
0.1895188, -1.861424, 0.01391328, 0, 0.5450981, 1, 1,
0.1953839, -0.9067718, 3.48213, 0, 0.5372549, 1, 1,
0.1960833, -0.3652884, 0.6585731, 0, 0.5333334, 1, 1,
0.1965117, 1.248311, -0.1140077, 0, 0.5254902, 1, 1,
0.196902, -0.02532934, 1.495321, 0, 0.5215687, 1, 1,
0.1975171, 2.396576, -0.2871674, 0, 0.5137255, 1, 1,
0.1986481, 1.256485, 1.19556, 0, 0.509804, 1, 1,
0.1989485, -0.920006, 1.989064, 0, 0.5019608, 1, 1,
0.1999235, -0.8720251, 2.962818, 0, 0.4941176, 1, 1,
0.2003718, 0.8422825, -0.8957758, 0, 0.4901961, 1, 1,
0.2008324, -0.9035322, 3.545981, 0, 0.4823529, 1, 1,
0.2039922, -1.301119, 3.354647, 0, 0.4784314, 1, 1,
0.2045864, 0.3325226, 2.219782, 0, 0.4705882, 1, 1,
0.2047911, 1.005738, 0.9400997, 0, 0.4666667, 1, 1,
0.2050467, -0.7852741, 2.021829, 0, 0.4588235, 1, 1,
0.2112024, 0.3593267, -0.2748692, 0, 0.454902, 1, 1,
0.2132521, 0.1135621, 1.571039, 0, 0.4470588, 1, 1,
0.213678, 0.177163, 1.592598, 0, 0.4431373, 1, 1,
0.2247915, -0.03666351, 0.7960126, 0, 0.4352941, 1, 1,
0.2258845, 0.1392266, 1.806957, 0, 0.4313726, 1, 1,
0.2269777, -0.7835439, 1.28915, 0, 0.4235294, 1, 1,
0.2288465, -0.4336081, 1.186922, 0, 0.4196078, 1, 1,
0.2293885, -1.260303, 3.286306, 0, 0.4117647, 1, 1,
0.2317366, -1.094144, 2.474317, 0, 0.4078431, 1, 1,
0.2325664, 1.153959, 0.2187755, 0, 0.4, 1, 1,
0.2337176, -0.433754, 3.776342, 0, 0.3921569, 1, 1,
0.2370808, 0.6146381, 2.347983, 0, 0.3882353, 1, 1,
0.2373953, -0.4140726, 2.685657, 0, 0.3803922, 1, 1,
0.2440588, -0.1331129, 1.535996, 0, 0.3764706, 1, 1,
0.2501825, -1.092131, 3.571084, 0, 0.3686275, 1, 1,
0.2511722, -1.418224, 2.646864, 0, 0.3647059, 1, 1,
0.252497, -0.3595611, 2.359235, 0, 0.3568628, 1, 1,
0.2538039, 0.6970345, 1.934187, 0, 0.3529412, 1, 1,
0.2558983, 0.598439, 0.1167699, 0, 0.345098, 1, 1,
0.2611562, 0.5753921, -0.5495359, 0, 0.3411765, 1, 1,
0.2626336, -0.3990066, 1.754573, 0, 0.3333333, 1, 1,
0.2630491, -0.9745612, 2.780197, 0, 0.3294118, 1, 1,
0.2645355, 0.2415056, -1.719631, 0, 0.3215686, 1, 1,
0.2678544, -0.909552, 4.453592, 0, 0.3176471, 1, 1,
0.2741314, -0.4868269, 2.715094, 0, 0.3098039, 1, 1,
0.2788874, 0.5527665, -0.9376513, 0, 0.3058824, 1, 1,
0.2798013, -0.67793, 2.63397, 0, 0.2980392, 1, 1,
0.2854955, 0.7059057, -0.5006273, 0, 0.2901961, 1, 1,
0.2877086, -1.405875, 2.717761, 0, 0.2862745, 1, 1,
0.2910427, 0.2351419, 2.104059, 0, 0.2784314, 1, 1,
0.3011375, 0.7005335, 1.561946, 0, 0.2745098, 1, 1,
0.3037705, -0.3250715, 2.383539, 0, 0.2666667, 1, 1,
0.3100504, -0.6352564, 2.640257, 0, 0.2627451, 1, 1,
0.3151793, -0.8308587, 1.679538, 0, 0.254902, 1, 1,
0.3160524, -1.02737, 2.295569, 0, 0.2509804, 1, 1,
0.3169709, 0.3591899, 0.7763783, 0, 0.2431373, 1, 1,
0.3206481, -0.9662867, 4.015558, 0, 0.2392157, 1, 1,
0.3215626, -0.06420673, 2.936919, 0, 0.2313726, 1, 1,
0.3282569, 0.2411613, 1.162839, 0, 0.227451, 1, 1,
0.3392999, -0.6377379, 4.424968, 0, 0.2196078, 1, 1,
0.3403253, -0.3049242, 3.623435, 0, 0.2156863, 1, 1,
0.3408436, -0.594957, 1.85493, 0, 0.2078431, 1, 1,
0.3422342, 0.6288694, 3.596611, 0, 0.2039216, 1, 1,
0.3422809, -0.7001868, 3.050424, 0, 0.1960784, 1, 1,
0.3427146, 0.8138424, 1.543618, 0, 0.1882353, 1, 1,
0.3433417, -0.05811483, 2.124282, 0, 0.1843137, 1, 1,
0.3456114, 1.921632, 0.5289658, 0, 0.1764706, 1, 1,
0.3515196, 0.06381232, 0.3339557, 0, 0.172549, 1, 1,
0.3521199, -0.06327983, 2.642428, 0, 0.1647059, 1, 1,
0.3538199, -2.406598, 2.399636, 0, 0.1607843, 1, 1,
0.3562566, 1.709406, 0.02195592, 0, 0.1529412, 1, 1,
0.3589091, -0.6839813, 2.772144, 0, 0.1490196, 1, 1,
0.3609207, 0.01732994, 1.43099, 0, 0.1411765, 1, 1,
0.3695259, 0.2139516, -0.1054645, 0, 0.1372549, 1, 1,
0.3737512, 0.8077154, 0.5767225, 0, 0.1294118, 1, 1,
0.3757382, 0.5650822, 0.07133288, 0, 0.1254902, 1, 1,
0.3782796, 0.7730478, 0.9611438, 0, 0.1176471, 1, 1,
0.3812048, 0.960597, -0.514926, 0, 0.1137255, 1, 1,
0.3843605, -1.65334, 3.207503, 0, 0.1058824, 1, 1,
0.388462, -2.170421, 2.397075, 0, 0.09803922, 1, 1,
0.3885512, -2.083712, 3.335852, 0, 0.09411765, 1, 1,
0.3997303, 0.004437414, 3.742307, 0, 0.08627451, 1, 1,
0.4001974, 0.3240286, -0.8130842, 0, 0.08235294, 1, 1,
0.4021018, 1.906638, 2.066795, 0, 0.07450981, 1, 1,
0.4070207, 0.5122113, 1.546274, 0, 0.07058824, 1, 1,
0.4105045, 0.6435642, 0.4842598, 0, 0.0627451, 1, 1,
0.4121549, -0.9029066, 4.47708, 0, 0.05882353, 1, 1,
0.4184722, 1.105188, -0.6134184, 0, 0.05098039, 1, 1,
0.4201957, 1.864139, 0.8595005, 0, 0.04705882, 1, 1,
0.4242393, -0.6853725, 3.655946, 0, 0.03921569, 1, 1,
0.4249173, 0.6175041, 0.2167016, 0, 0.03529412, 1, 1,
0.4264078, 0.06028801, 0.8593752, 0, 0.02745098, 1, 1,
0.4264136, 0.2239485, 0.9508179, 0, 0.02352941, 1, 1,
0.4293334, 1.63082, 1.836383, 0, 0.01568628, 1, 1,
0.4327207, 0.7968094, 1.845695, 0, 0.01176471, 1, 1,
0.4338733, 0.1926973, 2.832375, 0, 0.003921569, 1, 1,
0.4364242, -0.1228982, 1.302338, 0.003921569, 0, 1, 1,
0.4405512, 2.427104, 0.5704286, 0.007843138, 0, 1, 1,
0.4419107, 0.7861918, -0.6323591, 0.01568628, 0, 1, 1,
0.4438237, -0.7976897, 3.397725, 0.01960784, 0, 1, 1,
0.449259, -0.7699297, 1.066552, 0.02745098, 0, 1, 1,
0.4569118, -1.503965, 4.488413, 0.03137255, 0, 1, 1,
0.4587023, -0.6182833, 2.385258, 0.03921569, 0, 1, 1,
0.4590429, 0.8126396, 0.3099124, 0.04313726, 0, 1, 1,
0.4609767, 1.809708, 0.9593053, 0.05098039, 0, 1, 1,
0.4618248, 1.307884, 0.5819715, 0.05490196, 0, 1, 1,
0.4682659, 0.5256757, 0.3814885, 0.0627451, 0, 1, 1,
0.4690959, 1.091924, 0.655744, 0.06666667, 0, 1, 1,
0.469446, 0.5527316, -1.057165, 0.07450981, 0, 1, 1,
0.473686, -0.2493044, 2.0824, 0.07843138, 0, 1, 1,
0.4759872, -0.6658751, 2.345007, 0.08627451, 0, 1, 1,
0.4764432, -0.5291052, 2.613881, 0.09019608, 0, 1, 1,
0.4786378, 1.286369, 0.08670714, 0.09803922, 0, 1, 1,
0.4842136, 0.564405, 1.157936, 0.1058824, 0, 1, 1,
0.484925, 1.450744, 2.578661, 0.1098039, 0, 1, 1,
0.4861519, 0.5793216, 0.7079653, 0.1176471, 0, 1, 1,
0.4873311, -0.2402169, 1.087466, 0.1215686, 0, 1, 1,
0.4895742, -0.5722142, 3.531415, 0.1294118, 0, 1, 1,
0.4911733, -1.150037, 2.223238, 0.1333333, 0, 1, 1,
0.4969659, 0.9615982, 0.1099128, 0.1411765, 0, 1, 1,
0.497924, -0.27412, 2.415606, 0.145098, 0, 1, 1,
0.5012114, 1.248448, -0.565238, 0.1529412, 0, 1, 1,
0.505901, 0.7685992, 1.386116, 0.1568628, 0, 1, 1,
0.5075824, -0.8887168, 1.883064, 0.1647059, 0, 1, 1,
0.512198, -0.5790446, 1.948048, 0.1686275, 0, 1, 1,
0.5129787, 1.429099, 0.7931151, 0.1764706, 0, 1, 1,
0.5133401, 0.6936931, 0.974791, 0.1803922, 0, 1, 1,
0.5147918, 1.526827, -0.2937174, 0.1882353, 0, 1, 1,
0.5164303, 1.24424, -1.696513, 0.1921569, 0, 1, 1,
0.5171185, 0.4271543, 1.858743, 0.2, 0, 1, 1,
0.5175552, -0.6477637, 2.139112, 0.2078431, 0, 1, 1,
0.5192169, 0.6255677, 0.9285197, 0.2117647, 0, 1, 1,
0.5213797, 0.1180502, 0.8347923, 0.2196078, 0, 1, 1,
0.5234667, 0.7785436, 0.8502026, 0.2235294, 0, 1, 1,
0.5328489, -0.6856984, 1.656915, 0.2313726, 0, 1, 1,
0.5332904, 0.3467253, -0.5606747, 0.2352941, 0, 1, 1,
0.5350089, 1.715058, 0.3608991, 0.2431373, 0, 1, 1,
0.5385224, 0.9044729, 2.001092, 0.2470588, 0, 1, 1,
0.5397363, 0.336229, 1.378072, 0.254902, 0, 1, 1,
0.5413398, -1.113152, 2.442106, 0.2588235, 0, 1, 1,
0.5430706, -1.427758, 1.696365, 0.2666667, 0, 1, 1,
0.546632, -2.215664, 4.072352, 0.2705882, 0, 1, 1,
0.5492357, -0.7032303, 2.734034, 0.2784314, 0, 1, 1,
0.5506224, -0.3331143, 1.452403, 0.282353, 0, 1, 1,
0.5556623, 0.6087464, 1.257344, 0.2901961, 0, 1, 1,
0.5581515, 0.2911094, 0.7778961, 0.2941177, 0, 1, 1,
0.5583363, 1.035195, -0.5646976, 0.3019608, 0, 1, 1,
0.5643475, -0.4858688, 2.952389, 0.3098039, 0, 1, 1,
0.5645245, 1.098921, 0.6043939, 0.3137255, 0, 1, 1,
0.5645666, 1.632743, 0.9977951, 0.3215686, 0, 1, 1,
0.5657403, 0.06833665, 2.40554, 0.3254902, 0, 1, 1,
0.5666621, 2.213046, 1.295809, 0.3333333, 0, 1, 1,
0.5683013, 0.9572037, 1.7146, 0.3372549, 0, 1, 1,
0.5749156, 0.5002665, 3.028994, 0.345098, 0, 1, 1,
0.5784786, 0.7608541, 1.152596, 0.3490196, 0, 1, 1,
0.5823681, 0.01854273, 1.519348, 0.3568628, 0, 1, 1,
0.5856196, -0.214462, 1.573601, 0.3607843, 0, 1, 1,
0.5904032, -2.568589, 3.174132, 0.3686275, 0, 1, 1,
0.6028571, -0.9705362, 2.748017, 0.372549, 0, 1, 1,
0.6115732, 0.8463249, 0.9740163, 0.3803922, 0, 1, 1,
0.6144525, 0.6769077, 0.06436963, 0.3843137, 0, 1, 1,
0.6175551, 0.2349639, 1.806937, 0.3921569, 0, 1, 1,
0.6185769, -0.01207572, 2.043488, 0.3960784, 0, 1, 1,
0.6203483, -1.245905, 3.56755, 0.4039216, 0, 1, 1,
0.6278666, 0.1158221, -0.07249635, 0.4117647, 0, 1, 1,
0.6323313, 0.3388195, -0.1869166, 0.4156863, 0, 1, 1,
0.6323603, 0.7493849, 1.189056, 0.4235294, 0, 1, 1,
0.6337082, 0.09687487, 2.512642, 0.427451, 0, 1, 1,
0.6399372, 2.187733, -0.315397, 0.4352941, 0, 1, 1,
0.6400054, 0.4519431, 0.4003581, 0.4392157, 0, 1, 1,
0.6458667, -0.4660399, 3.573957, 0.4470588, 0, 1, 1,
0.6479467, 1.629243, -0.6646391, 0.4509804, 0, 1, 1,
0.6522586, -0.8342288, 2.958474, 0.4588235, 0, 1, 1,
0.6527247, 0.6367729, 0.2734376, 0.4627451, 0, 1, 1,
0.6533248, 0.3818194, -0.1741318, 0.4705882, 0, 1, 1,
0.6535254, 0.9874448, -0.4909154, 0.4745098, 0, 1, 1,
0.6543182, -2.15362, 1.220033, 0.4823529, 0, 1, 1,
0.6552387, -0.3642082, 0.8619027, 0.4862745, 0, 1, 1,
0.6571518, 0.3467171, 2.128433, 0.4941176, 0, 1, 1,
0.6573085, 0.2389693, 2.353855, 0.5019608, 0, 1, 1,
0.6599424, -0.185479, 1.12351, 0.5058824, 0, 1, 1,
0.6600669, -0.6608645, 3.830708, 0.5137255, 0, 1, 1,
0.661683, -0.7500522, 1.900625, 0.5176471, 0, 1, 1,
0.6683917, 0.5199422, 0.451463, 0.5254902, 0, 1, 1,
0.6752405, 0.1852496, 1.991808, 0.5294118, 0, 1, 1,
0.6790953, -1.430845, 3.387514, 0.5372549, 0, 1, 1,
0.6793782, -0.04096046, 1.441252, 0.5411765, 0, 1, 1,
0.6800916, -0.4906804, 3.292063, 0.5490196, 0, 1, 1,
0.6818296, -0.1276781, 1.57148, 0.5529412, 0, 1, 1,
0.6820493, -0.01937418, 1.447801, 0.5607843, 0, 1, 1,
0.6820807, 0.3141726, 0.5684907, 0.5647059, 0, 1, 1,
0.6884686, -1.113991, 3.50738, 0.572549, 0, 1, 1,
0.6923878, 0.04011479, 1.435136, 0.5764706, 0, 1, 1,
0.7005638, 1.122837, 0.9723471, 0.5843138, 0, 1, 1,
0.7015793, 0.03189845, 0.8302386, 0.5882353, 0, 1, 1,
0.7031546, 0.3810244, 0.1038692, 0.5960785, 0, 1, 1,
0.7049119, -2.056786, 2.272142, 0.6039216, 0, 1, 1,
0.7053007, -0.9257405, 1.404558, 0.6078432, 0, 1, 1,
0.7077603, 1.267987, 1.826543, 0.6156863, 0, 1, 1,
0.7082589, 0.08494707, 2.190666, 0.6196079, 0, 1, 1,
0.7094682, -2.014307, 4.276017, 0.627451, 0, 1, 1,
0.7128863, 0.5461544, -0.6756024, 0.6313726, 0, 1, 1,
0.7142832, 1.159645, -0.6358765, 0.6392157, 0, 1, 1,
0.7182589, 0.4831809, 1.739869, 0.6431373, 0, 1, 1,
0.7210308, 0.5992723, 0.1766501, 0.6509804, 0, 1, 1,
0.7253228, -0.7211246, 2.09756, 0.654902, 0, 1, 1,
0.7255947, -1.434706, 4.210146, 0.6627451, 0, 1, 1,
0.7284655, 0.7546189, 2.13091, 0.6666667, 0, 1, 1,
0.7337935, -0.8145236, 1.58127, 0.6745098, 0, 1, 1,
0.7399728, 1.500642, -0.0803019, 0.6784314, 0, 1, 1,
0.742456, -0.8925869, 2.538995, 0.6862745, 0, 1, 1,
0.7481748, 0.5133165, 0.5736303, 0.6901961, 0, 1, 1,
0.7495017, -0.4972418, 1.222238, 0.6980392, 0, 1, 1,
0.7507737, 0.4435357, -0.5644081, 0.7058824, 0, 1, 1,
0.7531253, 1.176405, 0.6687571, 0.7098039, 0, 1, 1,
0.7577129, 0.1340174, 0.06989685, 0.7176471, 0, 1, 1,
0.7598528, -0.01239241, 1.112458, 0.7215686, 0, 1, 1,
0.7599798, 1.387777, 1.118856, 0.7294118, 0, 1, 1,
0.7647315, 0.3101059, 1.94913, 0.7333333, 0, 1, 1,
0.7664676, 0.1268429, 1.113634, 0.7411765, 0, 1, 1,
0.7695395, 0.1872283, 0.6286926, 0.7450981, 0, 1, 1,
0.7696087, -0.8797387, 1.899423, 0.7529412, 0, 1, 1,
0.7759131, 0.1704614, 1.80326, 0.7568628, 0, 1, 1,
0.7824011, 0.4254139, 2.446077, 0.7647059, 0, 1, 1,
0.7899653, -0.4692463, 1.298559, 0.7686275, 0, 1, 1,
0.7986516, -0.1977971, 2.310436, 0.7764706, 0, 1, 1,
0.8004515, -0.4365531, 1.365256, 0.7803922, 0, 1, 1,
0.801816, -0.6953522, 3.385831, 0.7882353, 0, 1, 1,
0.8029277, 0.009975935, 2.317031, 0.7921569, 0, 1, 1,
0.8077208, 0.07055704, 2.584588, 0.8, 0, 1, 1,
0.8116631, 1.052765, -0.2247659, 0.8078431, 0, 1, 1,
0.8139812, 0.7887995, -0.9930243, 0.8117647, 0, 1, 1,
0.8153631, -0.1417805, 1.783011, 0.8196079, 0, 1, 1,
0.8165844, 1.253152, 1.134402, 0.8235294, 0, 1, 1,
0.8167798, 0.2941697, 2.241457, 0.8313726, 0, 1, 1,
0.8258993, 0.6358179, 0.6471945, 0.8352941, 0, 1, 1,
0.8278335, 0.4357217, -0.7628958, 0.8431373, 0, 1, 1,
0.8286759, -1.317676, 2.392699, 0.8470588, 0, 1, 1,
0.8343264, -1.77868, 1.590386, 0.854902, 0, 1, 1,
0.8361682, -0.03378461, 1.182043, 0.8588235, 0, 1, 1,
0.8371949, 1.234775, 0.6355219, 0.8666667, 0, 1, 1,
0.8384523, -2.325772, 1.22254, 0.8705882, 0, 1, 1,
0.8390637, -0.6116592, 1.511107, 0.8784314, 0, 1, 1,
0.8448262, 1.090272, -0.6421678, 0.8823529, 0, 1, 1,
0.8463603, -0.8466998, 3.410226, 0.8901961, 0, 1, 1,
0.8478414, -0.3506116, 1.65325, 0.8941177, 0, 1, 1,
0.8594271, -0.01209215, 0.9691218, 0.9019608, 0, 1, 1,
0.8686184, -1.422625, 1.907207, 0.9098039, 0, 1, 1,
0.8706042, 0.3939652, 2.30999, 0.9137255, 0, 1, 1,
0.8754932, 0.5919225, 1.386481, 0.9215686, 0, 1, 1,
0.8768263, -0.8536263, 3.246089, 0.9254902, 0, 1, 1,
0.8795448, 0.6355388, 0.8230414, 0.9333333, 0, 1, 1,
0.8798909, 0.7991649, -0.5656682, 0.9372549, 0, 1, 1,
0.8801868, 0.8530841, -0.3564164, 0.945098, 0, 1, 1,
0.885468, -1.533841, 4.09536, 0.9490196, 0, 1, 1,
0.8917369, -0.9933994, 2.275887, 0.9568627, 0, 1, 1,
0.9021116, -0.6263678, 2.350856, 0.9607843, 0, 1, 1,
0.905634, -0.1516517, 2.289288, 0.9686275, 0, 1, 1,
0.9099489, -0.3982334, 1.45416, 0.972549, 0, 1, 1,
0.9126165, 0.5159379, 0.9470524, 0.9803922, 0, 1, 1,
0.9149347, -0.4728537, 1.343755, 0.9843137, 0, 1, 1,
0.9157367, 1.033897, 1.578148, 0.9921569, 0, 1, 1,
0.9162665, -1.298698, 4.060884, 0.9960784, 0, 1, 1,
0.9182573, 1.084014, 0.2928736, 1, 0, 0.9960784, 1,
0.9268779, -0.2515258, 0.9208196, 1, 0, 0.9882353, 1,
0.9300442, 1.898146, 0.04406798, 1, 0, 0.9843137, 1,
0.9332914, 0.5977642, -0.1173333, 1, 0, 0.9764706, 1,
0.9352041, -0.1450646, 3.440098, 1, 0, 0.972549, 1,
0.9391971, -2.230126, 2.737236, 1, 0, 0.9647059, 1,
0.9394822, -0.3580575, 2.506837, 1, 0, 0.9607843, 1,
0.9452908, -1.813916, 2.506799, 1, 0, 0.9529412, 1,
0.9597501, 0.1172919, 2.210099, 1, 0, 0.9490196, 1,
0.9627881, 1.198159, 0.8935645, 1, 0, 0.9411765, 1,
0.9677936, -1.434865, 1.859636, 1, 0, 0.9372549, 1,
0.9711192, 0.9759979, 3.360337, 1, 0, 0.9294118, 1,
0.9726358, 0.1981882, 1.69815, 1, 0, 0.9254902, 1,
0.9736856, -1.398848, 2.014457, 1, 0, 0.9176471, 1,
0.9753463, -0.7367146, 1.997466, 1, 0, 0.9137255, 1,
0.9773347, -0.2523338, 1.039122, 1, 0, 0.9058824, 1,
0.9805188, -0.3162292, 2.557642, 1, 0, 0.9019608, 1,
0.9833012, -0.1123601, 1.59666, 1, 0, 0.8941177, 1,
0.9864464, 1.159026, 1.709154, 1, 0, 0.8862745, 1,
0.9888928, 0.4254889, 0.598461, 1, 0, 0.8823529, 1,
0.9988835, 0.1270055, 1.554839, 1, 0, 0.8745098, 1,
1.00292, -1.698327, 3.471651, 1, 0, 0.8705882, 1,
1.004, 0.6024079, 1.322593, 1, 0, 0.8627451, 1,
1.004915, -0.01561014, 0.8447365, 1, 0, 0.8588235, 1,
1.010089, 0.01799037, 1.407064, 1, 0, 0.8509804, 1,
1.014417, 1.403101, 0.243041, 1, 0, 0.8470588, 1,
1.018068, 0.6115826, 2.283609, 1, 0, 0.8392157, 1,
1.018545, -0.9402909, 4.015134, 1, 0, 0.8352941, 1,
1.04025, -1.200562, 2.875354, 1, 0, 0.827451, 1,
1.042455, 0.09523957, 1.222909, 1, 0, 0.8235294, 1,
1.04264, -1.149087, 4.355599, 1, 0, 0.8156863, 1,
1.050279, 2.019593, 2.843229, 1, 0, 0.8117647, 1,
1.05058, -0.4194015, 1.242162, 1, 0, 0.8039216, 1,
1.054696, -2.386936, 2.913127, 1, 0, 0.7960784, 1,
1.069605, 0.6405501, 2.257955, 1, 0, 0.7921569, 1,
1.075573, -0.4156565, 0.8583144, 1, 0, 0.7843137, 1,
1.086973, -0.3041898, 0.41448, 1, 0, 0.7803922, 1,
1.092153, -1.975904, 1.653696, 1, 0, 0.772549, 1,
1.099312, -0.2033163, 0.9250011, 1, 0, 0.7686275, 1,
1.100449, 1.843314, 0.07284082, 1, 0, 0.7607843, 1,
1.108962, 0.2482729, 1.500128, 1, 0, 0.7568628, 1,
1.11148, -0.6053182, 1.606545, 1, 0, 0.7490196, 1,
1.113492, -0.3664839, 2.070643, 1, 0, 0.7450981, 1,
1.115092, 0.1094633, 1.853015, 1, 0, 0.7372549, 1,
1.115595, -0.5790216, 1.269181, 1, 0, 0.7333333, 1,
1.121163, 2.260505, 2.034428, 1, 0, 0.7254902, 1,
1.12238, -1.727759, 3.645076, 1, 0, 0.7215686, 1,
1.156127, 0.8872882, 1.998534, 1, 0, 0.7137255, 1,
1.160306, -0.05435677, -0.5873297, 1, 0, 0.7098039, 1,
1.16202, -2.536929, 2.457204, 1, 0, 0.7019608, 1,
1.168456, 1.276885, -0.3827981, 1, 0, 0.6941177, 1,
1.180377, 0.3329322, -0.294201, 1, 0, 0.6901961, 1,
1.180719, -1.22365, 3.761254, 1, 0, 0.682353, 1,
1.191516, 0.0489539, 0.4851834, 1, 0, 0.6784314, 1,
1.210256, -0.2786014, 1.688233, 1, 0, 0.6705883, 1,
1.214836, -0.6299466, 3.648494, 1, 0, 0.6666667, 1,
1.216716, 0.2238663, 0.8439276, 1, 0, 0.6588235, 1,
1.218884, 0.3005275, 1.211676, 1, 0, 0.654902, 1,
1.223513, 0.1423237, 1.131835, 1, 0, 0.6470588, 1,
1.227095, -0.7785766, 2.279504, 1, 0, 0.6431373, 1,
1.229168, 0.0482662, 1.427466, 1, 0, 0.6352941, 1,
1.263869, 1.651863, 2.312447, 1, 0, 0.6313726, 1,
1.267086, -0.6624579, 2.173528, 1, 0, 0.6235294, 1,
1.27122, 1.599165, 0.4631377, 1, 0, 0.6196079, 1,
1.273658, 1.053118, 0.9701817, 1, 0, 0.6117647, 1,
1.274052, 0.252395, 1.4256, 1, 0, 0.6078432, 1,
1.299438, 0.4147722, 1.533661, 1, 0, 0.6, 1,
1.304883, 0.4170487, 1.004564, 1, 0, 0.5921569, 1,
1.310917, 1.13099, -0.1392587, 1, 0, 0.5882353, 1,
1.313879, -0.141847, 0.5413474, 1, 0, 0.5803922, 1,
1.316161, -0.2129104, 0.3376828, 1, 0, 0.5764706, 1,
1.32297, -0.1603476, 1.651681, 1, 0, 0.5686275, 1,
1.346125, 1.245489, 0.5705106, 1, 0, 0.5647059, 1,
1.346213, -0.449371, 1.991823, 1, 0, 0.5568628, 1,
1.349419, -0.4430729, 1.646209, 1, 0, 0.5529412, 1,
1.353217, 0.2857915, 3.812002, 1, 0, 0.5450981, 1,
1.363804, -0.5746213, 2.861088, 1, 0, 0.5411765, 1,
1.36782, 1.644893, 0.2026246, 1, 0, 0.5333334, 1,
1.368651, 1.052086, 0.9698953, 1, 0, 0.5294118, 1,
1.374649, -1.485519, 2.922848, 1, 0, 0.5215687, 1,
1.376237, 1.288866, -0.5129385, 1, 0, 0.5176471, 1,
1.380839, -1.276936, 3.64485, 1, 0, 0.509804, 1,
1.388895, -0.3148764, 1.616037, 1, 0, 0.5058824, 1,
1.401351, 0.7987111, 1.668787, 1, 0, 0.4980392, 1,
1.416831, -0.08556981, 2.762661, 1, 0, 0.4901961, 1,
1.420585, -0.4700516, 3.14083, 1, 0, 0.4862745, 1,
1.444208, -0.2591424, 0.2287183, 1, 0, 0.4784314, 1,
1.452242, -0.6879021, 2.524362, 1, 0, 0.4745098, 1,
1.465502, 0.1626308, 1.106117, 1, 0, 0.4666667, 1,
1.466746, -1.149344, 1.905568, 1, 0, 0.4627451, 1,
1.467242, -1.263249, 4.000676, 1, 0, 0.454902, 1,
1.47553, 0.3752652, 1.846241, 1, 0, 0.4509804, 1,
1.507274, -1.127276, 1.491043, 1, 0, 0.4431373, 1,
1.508775, 1.098619, 0.06552915, 1, 0, 0.4392157, 1,
1.51166, 0.7991679, 0.08757487, 1, 0, 0.4313726, 1,
1.516454, 0.8961965, 1.486272, 1, 0, 0.427451, 1,
1.521246, 1.053121, 0.6148938, 1, 0, 0.4196078, 1,
1.5238, -2.008056, 1.443579, 1, 0, 0.4156863, 1,
1.532765, -0.1795571, 0.3854639, 1, 0, 0.4078431, 1,
1.538453, -1.665355, 2.196858, 1, 0, 0.4039216, 1,
1.541572, -1.212916, 2.05948, 1, 0, 0.3960784, 1,
1.564848, -0.6246407, 2.69252, 1, 0, 0.3882353, 1,
1.597544, -1.34308, 3.816363, 1, 0, 0.3843137, 1,
1.608793, 0.1652111, 3.844872, 1, 0, 0.3764706, 1,
1.609387, -0.6692842, 1.153843, 1, 0, 0.372549, 1,
1.632249, 0.449665, -0.1135885, 1, 0, 0.3647059, 1,
1.632558, 0.5184759, 2.340862, 1, 0, 0.3607843, 1,
1.633369, 0.9638478, 0.6423204, 1, 0, 0.3529412, 1,
1.641619, -1.200662, 1.879182, 1, 0, 0.3490196, 1,
1.651627, -1.038089, 2.69733, 1, 0, 0.3411765, 1,
1.657155, 0.002078405, 0.8488097, 1, 0, 0.3372549, 1,
1.674324, 0.00757247, 3.144655, 1, 0, 0.3294118, 1,
1.675005, 0.9819397, 2.932032, 1, 0, 0.3254902, 1,
1.69499, -1.052824, 2.545673, 1, 0, 0.3176471, 1,
1.696566, 0.6841869, 1.546929, 1, 0, 0.3137255, 1,
1.697982, 0.4302467, 0.9988611, 1, 0, 0.3058824, 1,
1.71232, -0.316482, 1.395856, 1, 0, 0.2980392, 1,
1.720442, 1.080388, 2.223646, 1, 0, 0.2941177, 1,
1.729721, 1.507079, -0.1980464, 1, 0, 0.2862745, 1,
1.730555, 1.743191, -0.5660926, 1, 0, 0.282353, 1,
1.732626, -1.459246, 1.311016, 1, 0, 0.2745098, 1,
1.732821, -0.2944788, 2.659613, 1, 0, 0.2705882, 1,
1.745512, -0.3837181, 1.289486, 1, 0, 0.2627451, 1,
1.761692, -1.040256, 2.133735, 1, 0, 0.2588235, 1,
1.763706, -0.5490696, 0.7234291, 1, 0, 0.2509804, 1,
1.765635, 0.05369477, 1.013153, 1, 0, 0.2470588, 1,
1.798422, -1.262966, 1.88658, 1, 0, 0.2392157, 1,
1.803696, -0.003883032, -0.3694574, 1, 0, 0.2352941, 1,
1.809316, 2.696023, 0.3095411, 1, 0, 0.227451, 1,
1.83312, 0.2145327, 2.301558, 1, 0, 0.2235294, 1,
1.83879, 0.8728105, 1.766128, 1, 0, 0.2156863, 1,
1.838873, 0.005525035, 1.483431, 1, 0, 0.2117647, 1,
1.842597, -0.6614723, 1.278432, 1, 0, 0.2039216, 1,
1.858969, -0.180066, 1.559488, 1, 0, 0.1960784, 1,
1.866257, 0.5272093, 1.064315, 1, 0, 0.1921569, 1,
1.870565, -1.053876, 2.850323, 1, 0, 0.1843137, 1,
1.883217, -0.9633989, -0.2259927, 1, 0, 0.1803922, 1,
1.893086, 1.919604, 0.6946455, 1, 0, 0.172549, 1,
1.894981, 2.090725, 1.134794, 1, 0, 0.1686275, 1,
1.897562, 0.8543777, 0.8066528, 1, 0, 0.1607843, 1,
1.897576, -0.7503006, 2.016854, 1, 0, 0.1568628, 1,
1.906951, -0.2430816, 1.524178, 1, 0, 0.1490196, 1,
1.918742, -0.08028366, 2.072608, 1, 0, 0.145098, 1,
1.961619, -0.4884816, 2.746915, 1, 0, 0.1372549, 1,
1.985643, 0.08585885, 1.999787, 1, 0, 0.1333333, 1,
2.070574, -0.05363678, 2.809814, 1, 0, 0.1254902, 1,
2.08984, 1.324299, 0.7611579, 1, 0, 0.1215686, 1,
2.094961, 1.769898, 1.066603, 1, 0, 0.1137255, 1,
2.122187, 1.260814, 0.7502166, 1, 0, 0.1098039, 1,
2.156131, 0.1382008, 1.040198, 1, 0, 0.1019608, 1,
2.166931, 0.9102173, 1.094497, 1, 0, 0.09411765, 1,
2.181399, -0.8420192, 1.349123, 1, 0, 0.09019608, 1,
2.191647, 0.7006775, 1.626408, 1, 0, 0.08235294, 1,
2.24128, 0.6926861, 2.414335, 1, 0, 0.07843138, 1,
2.284143, 0.1097071, 1.000138, 1, 0, 0.07058824, 1,
2.340128, -2.39831, 2.180926, 1, 0, 0.06666667, 1,
2.386342, 1.328184, -0.5849473, 1, 0, 0.05882353, 1,
2.423423, -2.034896, 1.505384, 1, 0, 0.05490196, 1,
2.512872, -1.038195, 2.375912, 1, 0, 0.04705882, 1,
2.534642, 0.9312059, 1.972019, 1, 0, 0.04313726, 1,
2.578959, 1.065441, 1.967981, 1, 0, 0.03529412, 1,
2.6079, 1.042103, 0.5190374, 1, 0, 0.03137255, 1,
2.6297, 1.401351, -0.4879536, 1, 0, 0.02352941, 1,
2.73203, 1.305057, 0.4540156, 1, 0, 0.01960784, 1,
2.757033, -0.5337011, 0.9212303, 1, 0, 0.01176471, 1,
3.013722, 1.834175, 0.3007478, 1, 0, 0.007843138, 1
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
0.1744827, -4.253801, -6.731509, 0, -0.5, 0.5, 0.5,
0.1744827, -4.253801, -6.731509, 1, -0.5, 0.5, 0.5,
0.1744827, -4.253801, -6.731509, 1, 1.5, 0.5, 0.5,
0.1744827, -4.253801, -6.731509, 0, 1.5, 0.5, 0.5
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
-3.627258, -0.1008331, -6.731509, 0, -0.5, 0.5, 0.5,
-3.627258, -0.1008331, -6.731509, 1, -0.5, 0.5, 0.5,
-3.627258, -0.1008331, -6.731509, 1, 1.5, 0.5, 0.5,
-3.627258, -0.1008331, -6.731509, 0, 1.5, 0.5, 0.5
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
-3.627258, -4.253801, -0.1756983, 0, -0.5, 0.5, 0.5,
-3.627258, -4.253801, -0.1756983, 1, -0.5, 0.5, 0.5,
-3.627258, -4.253801, -0.1756983, 1, 1.5, 0.5, 0.5,
-3.627258, -4.253801, -0.1756983, 0, 1.5, 0.5, 0.5
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
-2, -3.295424, -5.21863,
3, -3.295424, -5.21863,
-2, -3.295424, -5.21863,
-2, -3.455153, -5.470777,
-1, -3.295424, -5.21863,
-1, -3.455153, -5.470777,
0, -3.295424, -5.21863,
0, -3.455153, -5.470777,
1, -3.295424, -5.21863,
1, -3.455153, -5.470777,
2, -3.295424, -5.21863,
2, -3.455153, -5.470777,
3, -3.295424, -5.21863,
3, -3.455153, -5.470777
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
-2, -3.774612, -5.97507, 0, -0.5, 0.5, 0.5,
-2, -3.774612, -5.97507, 1, -0.5, 0.5, 0.5,
-2, -3.774612, -5.97507, 1, 1.5, 0.5, 0.5,
-2, -3.774612, -5.97507, 0, 1.5, 0.5, 0.5,
-1, -3.774612, -5.97507, 0, -0.5, 0.5, 0.5,
-1, -3.774612, -5.97507, 1, -0.5, 0.5, 0.5,
-1, -3.774612, -5.97507, 1, 1.5, 0.5, 0.5,
-1, -3.774612, -5.97507, 0, 1.5, 0.5, 0.5,
0, -3.774612, -5.97507, 0, -0.5, 0.5, 0.5,
0, -3.774612, -5.97507, 1, -0.5, 0.5, 0.5,
0, -3.774612, -5.97507, 1, 1.5, 0.5, 0.5,
0, -3.774612, -5.97507, 0, 1.5, 0.5, 0.5,
1, -3.774612, -5.97507, 0, -0.5, 0.5, 0.5,
1, -3.774612, -5.97507, 1, -0.5, 0.5, 0.5,
1, -3.774612, -5.97507, 1, 1.5, 0.5, 0.5,
1, -3.774612, -5.97507, 0, 1.5, 0.5, 0.5,
2, -3.774612, -5.97507, 0, -0.5, 0.5, 0.5,
2, -3.774612, -5.97507, 1, -0.5, 0.5, 0.5,
2, -3.774612, -5.97507, 1, 1.5, 0.5, 0.5,
2, -3.774612, -5.97507, 0, 1.5, 0.5, 0.5,
3, -3.774612, -5.97507, 0, -0.5, 0.5, 0.5,
3, -3.774612, -5.97507, 1, -0.5, 0.5, 0.5,
3, -3.774612, -5.97507, 1, 1.5, 0.5, 0.5,
3, -3.774612, -5.97507, 0, 1.5, 0.5, 0.5
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
-2.749933, -3, -5.21863,
-2.749933, 3, -5.21863,
-2.749933, -3, -5.21863,
-2.896154, -3, -5.470777,
-2.749933, -2, -5.21863,
-2.896154, -2, -5.470777,
-2.749933, -1, -5.21863,
-2.896154, -1, -5.470777,
-2.749933, 0, -5.21863,
-2.896154, 0, -5.470777,
-2.749933, 1, -5.21863,
-2.896154, 1, -5.470777,
-2.749933, 2, -5.21863,
-2.896154, 2, -5.470777,
-2.749933, 3, -5.21863,
-2.896154, 3, -5.470777
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
-3.188596, -3, -5.97507, 0, -0.5, 0.5, 0.5,
-3.188596, -3, -5.97507, 1, -0.5, 0.5, 0.5,
-3.188596, -3, -5.97507, 1, 1.5, 0.5, 0.5,
-3.188596, -3, -5.97507, 0, 1.5, 0.5, 0.5,
-3.188596, -2, -5.97507, 0, -0.5, 0.5, 0.5,
-3.188596, -2, -5.97507, 1, -0.5, 0.5, 0.5,
-3.188596, -2, -5.97507, 1, 1.5, 0.5, 0.5,
-3.188596, -2, -5.97507, 0, 1.5, 0.5, 0.5,
-3.188596, -1, -5.97507, 0, -0.5, 0.5, 0.5,
-3.188596, -1, -5.97507, 1, -0.5, 0.5, 0.5,
-3.188596, -1, -5.97507, 1, 1.5, 0.5, 0.5,
-3.188596, -1, -5.97507, 0, 1.5, 0.5, 0.5,
-3.188596, 0, -5.97507, 0, -0.5, 0.5, 0.5,
-3.188596, 0, -5.97507, 1, -0.5, 0.5, 0.5,
-3.188596, 0, -5.97507, 1, 1.5, 0.5, 0.5,
-3.188596, 0, -5.97507, 0, 1.5, 0.5, 0.5,
-3.188596, 1, -5.97507, 0, -0.5, 0.5, 0.5,
-3.188596, 1, -5.97507, 1, -0.5, 0.5, 0.5,
-3.188596, 1, -5.97507, 1, 1.5, 0.5, 0.5,
-3.188596, 1, -5.97507, 0, 1.5, 0.5, 0.5,
-3.188596, 2, -5.97507, 0, -0.5, 0.5, 0.5,
-3.188596, 2, -5.97507, 1, -0.5, 0.5, 0.5,
-3.188596, 2, -5.97507, 1, 1.5, 0.5, 0.5,
-3.188596, 2, -5.97507, 0, 1.5, 0.5, 0.5,
-3.188596, 3, -5.97507, 0, -0.5, 0.5, 0.5,
-3.188596, 3, -5.97507, 1, -0.5, 0.5, 0.5,
-3.188596, 3, -5.97507, 1, 1.5, 0.5, 0.5,
-3.188596, 3, -5.97507, 0, 1.5, 0.5, 0.5
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
-2.749933, -3.295424, -4,
-2.749933, -3.295424, 4,
-2.749933, -3.295424, -4,
-2.896154, -3.455153, -4,
-2.749933, -3.295424, -2,
-2.896154, -3.455153, -2,
-2.749933, -3.295424, 0,
-2.896154, -3.455153, 0,
-2.749933, -3.295424, 2,
-2.896154, -3.455153, 2,
-2.749933, -3.295424, 4,
-2.896154, -3.455153, 4
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
-3.188596, -3.774612, -4, 0, -0.5, 0.5, 0.5,
-3.188596, -3.774612, -4, 1, -0.5, 0.5, 0.5,
-3.188596, -3.774612, -4, 1, 1.5, 0.5, 0.5,
-3.188596, -3.774612, -4, 0, 1.5, 0.5, 0.5,
-3.188596, -3.774612, -2, 0, -0.5, 0.5, 0.5,
-3.188596, -3.774612, -2, 1, -0.5, 0.5, 0.5,
-3.188596, -3.774612, -2, 1, 1.5, 0.5, 0.5,
-3.188596, -3.774612, -2, 0, 1.5, 0.5, 0.5,
-3.188596, -3.774612, 0, 0, -0.5, 0.5, 0.5,
-3.188596, -3.774612, 0, 1, -0.5, 0.5, 0.5,
-3.188596, -3.774612, 0, 1, 1.5, 0.5, 0.5,
-3.188596, -3.774612, 0, 0, 1.5, 0.5, 0.5,
-3.188596, -3.774612, 2, 0, -0.5, 0.5, 0.5,
-3.188596, -3.774612, 2, 1, -0.5, 0.5, 0.5,
-3.188596, -3.774612, 2, 1, 1.5, 0.5, 0.5,
-3.188596, -3.774612, 2, 0, 1.5, 0.5, 0.5,
-3.188596, -3.774612, 4, 0, -0.5, 0.5, 0.5,
-3.188596, -3.774612, 4, 1, -0.5, 0.5, 0.5,
-3.188596, -3.774612, 4, 1, 1.5, 0.5, 0.5,
-3.188596, -3.774612, 4, 0, 1.5, 0.5, 0.5
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
-2.749933, -3.295424, -5.21863,
-2.749933, 3.093758, -5.21863,
-2.749933, -3.295424, 4.867233,
-2.749933, 3.093758, 4.867233,
-2.749933, -3.295424, -5.21863,
-2.749933, -3.295424, 4.867233,
-2.749933, 3.093758, -5.21863,
-2.749933, 3.093758, 4.867233,
-2.749933, -3.295424, -5.21863,
3.098899, -3.295424, -5.21863,
-2.749933, -3.295424, 4.867233,
3.098899, -3.295424, 4.867233,
-2.749933, 3.093758, -5.21863,
3.098899, 3.093758, -5.21863,
-2.749933, 3.093758, 4.867233,
3.098899, 3.093758, 4.867233,
3.098899, -3.295424, -5.21863,
3.098899, 3.093758, -5.21863,
3.098899, -3.295424, 4.867233,
3.098899, 3.093758, 4.867233,
3.098899, -3.295424, -5.21863,
3.098899, -3.295424, 4.867233,
3.098899, 3.093758, -5.21863,
3.098899, 3.093758, 4.867233
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
var radius = 7.099233;
var distance = 31.58529;
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
mvMatrix.translate( -0.1744827, 0.1008331, 0.1756983 );
mvMatrix.scale( 1.31237, 1.201379, 0.7610484 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -31.58529);
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
ethametsulfuron-meth<-read.table("ethametsulfuron-meth.xyz")
```

```
## Error in read.table("ethametsulfuron-meth.xyz"): no lines available in input
```

```r
x<-ethametsulfuron-meth$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethametsulfuron' not found
```

```r
y<-ethametsulfuron-meth$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethametsulfuron' not found
```

```r
z<-ethametsulfuron-meth$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethametsulfuron' not found
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
-2.664756, -0.5259313, -0.7687865, 0, 0, 1, 1, 1,
-2.664672, 0.0185835, -1.868489, 1, 0, 0, 1, 1,
-2.603637, -0.9506004, -0.5650348, 1, 0, 0, 1, 1,
-2.561009, 0.04320146, 1.572621, 1, 0, 0, 1, 1,
-2.541796, -0.6457543, -3.173586, 1, 0, 0, 1, 1,
-2.337383, -0.2659339, -2.267278, 1, 0, 0, 1, 1,
-2.276018, -0.2537613, -3.33864, 0, 0, 0, 1, 1,
-2.262002, 0.1502889, -2.594579, 0, 0, 0, 1, 1,
-2.124857, -1.441993, -1.885022, 0, 0, 0, 1, 1,
-2.108249, 1.143186, -1.869682, 0, 0, 0, 1, 1,
-2.094906, -1.371808, -0.4238939, 0, 0, 0, 1, 1,
-2.08532, 0.1203261, -0.8574566, 0, 0, 0, 1, 1,
-2.082776, 0.7614846, -0.09841152, 0, 0, 0, 1, 1,
-2.063046, -0.0965637, -2.055078, 1, 1, 1, 1, 1,
-1.986631, -0.2657413, -1.480668, 1, 1, 1, 1, 1,
-1.971036, 0.2969085, -0.6807629, 1, 1, 1, 1, 1,
-1.948164, 0.2534627, -0.8138741, 1, 1, 1, 1, 1,
-1.927934, 0.2540269, -1.633206, 1, 1, 1, 1, 1,
-1.918531, -0.9439709, -1.991322, 1, 1, 1, 1, 1,
-1.887697, -0.2794631, -3.104129, 1, 1, 1, 1, 1,
-1.874204, -1.004764, -2.662525, 1, 1, 1, 1, 1,
-1.862037, 0.8593967, -2.162395, 1, 1, 1, 1, 1,
-1.834469, 0.5332208, 0.5352099, 1, 1, 1, 1, 1,
-1.819814, 0.1325596, -0.6328056, 1, 1, 1, 1, 1,
-1.810382, -1.317777, -3.765685, 1, 1, 1, 1, 1,
-1.810252, 0.6853982, 0.132208, 1, 1, 1, 1, 1,
-1.7629, -0.07310963, -2.403826, 1, 1, 1, 1, 1,
-1.743463, -0.5390739, -0.8333525, 1, 1, 1, 1, 1,
-1.738485, -0.07737344, -0.9816102, 0, 0, 1, 1, 1,
-1.704101, 2.102156, -0.1311641, 1, 0, 0, 1, 1,
-1.699416, -0.2599984, -1.108068, 1, 0, 0, 1, 1,
-1.675281, -1.49419, -1.437383, 1, 0, 0, 1, 1,
-1.667891, -0.4608475, -2.662621, 1, 0, 0, 1, 1,
-1.654587, 1.508073, -1.514057, 1, 0, 0, 1, 1,
-1.647092, -0.9017861, -1.176025, 0, 0, 0, 1, 1,
-1.63406, -0.1973794, -2.34731, 0, 0, 0, 1, 1,
-1.631784, -2.144863, -2.481207, 0, 0, 0, 1, 1,
-1.626903, 0.911102, 0.4862539, 0, 0, 0, 1, 1,
-1.624143, -0.4583467, -2.179971, 0, 0, 0, 1, 1,
-1.616459, 0.2040016, -1.95814, 0, 0, 0, 1, 1,
-1.604473, -1.486336, -2.517364, 0, 0, 0, 1, 1,
-1.599862, 1.110276, -1.12679, 1, 1, 1, 1, 1,
-1.598974, 1.034104, 0.0197696, 1, 1, 1, 1, 1,
-1.597808, 0.7241177, -0.6540666, 1, 1, 1, 1, 1,
-1.587201, 1.138552, -1.438391, 1, 1, 1, 1, 1,
-1.58628, 0.2081628, -1.287401, 1, 1, 1, 1, 1,
-1.584274, 1.357895, -1.135632, 1, 1, 1, 1, 1,
-1.583512, 0.9412808, -0.2797737, 1, 1, 1, 1, 1,
-1.557729, -0.7510055, -0.4197982, 1, 1, 1, 1, 1,
-1.543487, 0.1432929, -0.8069413, 1, 1, 1, 1, 1,
-1.535964, 0.02703857, -1.912571, 1, 1, 1, 1, 1,
-1.534029, 2.381458, -0.4224085, 1, 1, 1, 1, 1,
-1.533007, 0.3491302, -1.275182, 1, 1, 1, 1, 1,
-1.520215, -0.1168619, -2.298868, 1, 1, 1, 1, 1,
-1.510109, -1.288106, -4.359809, 1, 1, 1, 1, 1,
-1.477164, 0.04899559, -2.495149, 1, 1, 1, 1, 1,
-1.465809, -0.7130399, -3.409666, 0, 0, 1, 1, 1,
-1.463133, 0.2481336, -2.665786, 1, 0, 0, 1, 1,
-1.455167, 0.2667252, -0.4853425, 1, 0, 0, 1, 1,
-1.4453, 0.4198949, 0.8361933, 1, 0, 0, 1, 1,
-1.442084, 1.050763, 0.1213197, 1, 0, 0, 1, 1,
-1.439175, 0.05380787, -2.583919, 1, 0, 0, 1, 1,
-1.438679, 0.6085092, -1.367308, 0, 0, 0, 1, 1,
-1.438334, -0.9323663, -1.779775, 0, 0, 0, 1, 1,
-1.427526, -0.8888388, -2.578214, 0, 0, 0, 1, 1,
-1.423667, -0.08751517, -2.157932, 0, 0, 0, 1, 1,
-1.423475, -0.2934719, -2.0176, 0, 0, 0, 1, 1,
-1.418715, -0.9720314, -3.547377, 0, 0, 0, 1, 1,
-1.408529, 0.2234568, -0.9498572, 0, 0, 0, 1, 1,
-1.400347, 0.537391, -1.054625, 1, 1, 1, 1, 1,
-1.399373, -0.4468231, -3.000999, 1, 1, 1, 1, 1,
-1.396463, -1.08398, -1.149697, 1, 1, 1, 1, 1,
-1.394866, -0.5038904, -1.478354, 1, 1, 1, 1, 1,
-1.388945, 1.378941, -3.288089, 1, 1, 1, 1, 1,
-1.374291, -0.8822294, -2.22144, 1, 1, 1, 1, 1,
-1.371652, 0.05006536, -2.902883, 1, 1, 1, 1, 1,
-1.370825, -0.1776108, -1.813475, 1, 1, 1, 1, 1,
-1.360401, -0.5186456, -1.681913, 1, 1, 1, 1, 1,
-1.357892, 1.034878, -0.8913957, 1, 1, 1, 1, 1,
-1.355021, -1.792089, -2.716172, 1, 1, 1, 1, 1,
-1.352267, 2.049121, 0.7778603, 1, 1, 1, 1, 1,
-1.348662, -1.280238, -1.958336, 1, 1, 1, 1, 1,
-1.347937, -0.5542939, -2.076059, 1, 1, 1, 1, 1,
-1.346691, -0.1340187, -1.183474, 1, 1, 1, 1, 1,
-1.338349, -0.2157327, -0.3498177, 0, 0, 1, 1, 1,
-1.3225, -0.668358, -2.760594, 1, 0, 0, 1, 1,
-1.319922, 0.29717, -3.314219, 1, 0, 0, 1, 1,
-1.319825, 0.163133, -2.418987, 1, 0, 0, 1, 1,
-1.303787, 0.03864763, -2.473699, 1, 0, 0, 1, 1,
-1.297263, 0.5258511, -0.08360488, 1, 0, 0, 1, 1,
-1.295936, -1.322445, -1.323424, 0, 0, 0, 1, 1,
-1.293892, -1.135933, -1.957217, 0, 0, 0, 1, 1,
-1.281625, -0.5386379, -1.561425, 0, 0, 0, 1, 1,
-1.268492, 1.048079, -0.1681501, 0, 0, 0, 1, 1,
-1.267771, 1.363261, -0.4785768, 0, 0, 0, 1, 1,
-1.26717, -0.4652596, -2.290833, 0, 0, 0, 1, 1,
-1.265149, -0.6658973, -3.257479, 0, 0, 0, 1, 1,
-1.262849, 0.6821021, -0.4953294, 1, 1, 1, 1, 1,
-1.25765, 2.411454, -0.1438526, 1, 1, 1, 1, 1,
-1.24783, 0.1645913, 0.2734452, 1, 1, 1, 1, 1,
-1.244726, 0.05787498, -0.5724717, 1, 1, 1, 1, 1,
-1.2283, -0.7537007, -0.6945932, 1, 1, 1, 1, 1,
-1.220675, 0.5051072, -1.148034, 1, 1, 1, 1, 1,
-1.204655, 0.5782239, 0.3680303, 1, 1, 1, 1, 1,
-1.202723, -0.1765688, -2.693884, 1, 1, 1, 1, 1,
-1.197268, 0.3679926, -2.354058, 1, 1, 1, 1, 1,
-1.194677, 1.781949, -0.8190241, 1, 1, 1, 1, 1,
-1.185312, 1.052727, -0.1525731, 1, 1, 1, 1, 1,
-1.177572, 0.1368445, -1.107219, 1, 1, 1, 1, 1,
-1.173987, 0.08041292, -1.161848, 1, 1, 1, 1, 1,
-1.173714, -0.4256112, -3.097987, 1, 1, 1, 1, 1,
-1.173394, 0.379573, -2.413979, 1, 1, 1, 1, 1,
-1.168645, -0.4277607, -1.652835, 0, 0, 1, 1, 1,
-1.16551, 0.09581226, -0.671142, 1, 0, 0, 1, 1,
-1.164262, 0.03038953, -0.6955314, 1, 0, 0, 1, 1,
-1.160617, -0.8154308, -3.205011, 1, 0, 0, 1, 1,
-1.142062, -0.2959826, -0.3541324, 1, 0, 0, 1, 1,
-1.140793, 0.9924902, 0.640885, 1, 0, 0, 1, 1,
-1.131181, 0.09214435, -0.7514008, 0, 0, 0, 1, 1,
-1.128845, -1.576446, -1.744312, 0, 0, 0, 1, 1,
-1.124444, 1.00773, -0.5308286, 0, 0, 0, 1, 1,
-1.117042, 1.436634, -0.847368, 0, 0, 0, 1, 1,
-1.091888, -0.917035, -2.230999, 0, 0, 0, 1, 1,
-1.090523, 1.260762, 0.2980633, 0, 0, 0, 1, 1,
-1.07652, -1.722995, -1.368326, 0, 0, 0, 1, 1,
-1.072963, -0.8235864, -1.015052, 1, 1, 1, 1, 1,
-1.068238, -1.482622, -2.419984, 1, 1, 1, 1, 1,
-1.064121, 0.8724263, 0.1948446, 1, 1, 1, 1, 1,
-1.063273, 0.7949299, -0.4593742, 1, 1, 1, 1, 1,
-1.05514, -1.512082, -4.372579, 1, 1, 1, 1, 1,
-1.054863, -0.05085533, -2.77791, 1, 1, 1, 1, 1,
-1.052907, -0.342639, -1.50635, 1, 1, 1, 1, 1,
-1.051995, -0.1630361, -0.9228653, 1, 1, 1, 1, 1,
-1.050153, -1.610119, -2.538591, 1, 1, 1, 1, 1,
-1.047572, 0.4136513, -1.417464, 1, 1, 1, 1, 1,
-1.037228, -0.5187244, -1.644263, 1, 1, 1, 1, 1,
-1.034117, -0.0930529, -0.1449833, 1, 1, 1, 1, 1,
-1.029513, -0.358203, -1.285406, 1, 1, 1, 1, 1,
-1.02371, -0.8819004, -2.979025, 1, 1, 1, 1, 1,
-1.021548, -0.3457031, -2.470983, 1, 1, 1, 1, 1,
-1.015319, 0.9204888, -0.3846284, 0, 0, 1, 1, 1,
-1.014369, 1.435483, -0.59087, 1, 0, 0, 1, 1,
-1.01375, 0.5638668, 0.04145132, 1, 0, 0, 1, 1,
-1.006431, -0.6619819, -1.982119, 1, 0, 0, 1, 1,
-1.004886, -1.883383, -2.787199, 1, 0, 0, 1, 1,
-1.003262, -0.01651344, 0.6318319, 1, 0, 0, 1, 1,
-1.001744, 0.5806528, -0.5441068, 0, 0, 0, 1, 1,
-0.9999312, -0.102332, -2.223058, 0, 0, 0, 1, 1,
-0.9966818, 0.6296316, -1.404616, 0, 0, 0, 1, 1,
-0.9963392, -0.743582, -2.259423, 0, 0, 0, 1, 1,
-0.9929052, 1.736743, 1.646011, 0, 0, 0, 1, 1,
-0.9922974, -0.05455929, -2.628518, 0, 0, 0, 1, 1,
-0.9874557, 0.9074628, -1.460366, 0, 0, 0, 1, 1,
-0.9781845, -0.9391397, -2.86777, 1, 1, 1, 1, 1,
-0.9759867, -1.106135, -2.78224, 1, 1, 1, 1, 1,
-0.971094, 0.9428943, -1.056682, 1, 1, 1, 1, 1,
-0.9651435, -1.220144, -1.83487, 1, 1, 1, 1, 1,
-0.9623089, 2.239881, -0.5500433, 1, 1, 1, 1, 1,
-0.9447085, -2.297809, -4.287965, 1, 1, 1, 1, 1,
-0.9407572, 0.9789827, 0.253252, 1, 1, 1, 1, 1,
-0.9304497, 0.5207128, -2.370343, 1, 1, 1, 1, 1,
-0.9243885, -0.1242452, -1.079841, 1, 1, 1, 1, 1,
-0.9236832, 1.350221, -0.4147868, 1, 1, 1, 1, 1,
-0.9195172, -0.6192502, -0.594763, 1, 1, 1, 1, 1,
-0.9189188, 1.373691, 0.6985875, 1, 1, 1, 1, 1,
-0.9145218, -0.1044835, -1.751904, 1, 1, 1, 1, 1,
-0.9131792, 0.0790663, -2.930622, 1, 1, 1, 1, 1,
-0.9085255, 0.3376488, -1.780323, 1, 1, 1, 1, 1,
-0.9020092, -1.747209, -2.122509, 0, 0, 1, 1, 1,
-0.9014726, -0.5324075, -2.51799, 1, 0, 0, 1, 1,
-0.9007435, 0.6106287, -0.7307625, 1, 0, 0, 1, 1,
-0.9004876, 0.6686267, -2.011641, 1, 0, 0, 1, 1,
-0.8993525, -1.385738, -1.817856, 1, 0, 0, 1, 1,
-0.891367, -1.088753, -2.554313, 1, 0, 0, 1, 1,
-0.889715, 0.563125, -2.3454, 0, 0, 0, 1, 1,
-0.889449, 0.41904, -1.053185, 0, 0, 0, 1, 1,
-0.8679731, 1.10113, 1.270581, 0, 0, 0, 1, 1,
-0.8619063, 0.07766845, -3.177195, 0, 0, 0, 1, 1,
-0.8611709, -0.6586289, -3.022165, 0, 0, 0, 1, 1,
-0.8602582, -0.020972, -1.752574, 0, 0, 0, 1, 1,
-0.8578583, -0.3643275, -1.176852, 0, 0, 0, 1, 1,
-0.8577279, -1.731666, -1.911939, 1, 1, 1, 1, 1,
-0.8558245, -1.090283, -2.357749, 1, 1, 1, 1, 1,
-0.85534, 0.370035, -0.5743001, 1, 1, 1, 1, 1,
-0.8537841, 0.1802266, -0.6449776, 1, 1, 1, 1, 1,
-0.8529292, -0.5063106, -2.006422, 1, 1, 1, 1, 1,
-0.8522295, -0.1106537, -3.049046, 1, 1, 1, 1, 1,
-0.8477565, -1.153757, -2.599249, 1, 1, 1, 1, 1,
-0.847513, -1.089676, -4.434546, 1, 1, 1, 1, 1,
-0.8383676, -0.2755261, -1.645192, 1, 1, 1, 1, 1,
-0.8381609, 0.111219, -1.01561, 1, 1, 1, 1, 1,
-0.8369389, 0.7293405, 0.1748761, 1, 1, 1, 1, 1,
-0.8350762, -0.6475725, -1.862887, 1, 1, 1, 1, 1,
-0.8348524, -2.219693, -2.809189, 1, 1, 1, 1, 1,
-0.8297868, 0.04224932, -2.107649, 1, 1, 1, 1, 1,
-0.8244913, 1.220228, -0.1440495, 1, 1, 1, 1, 1,
-0.8203821, 0.5772017, -0.2805009, 0, 0, 1, 1, 1,
-0.8146866, 2.043653, -0.1660242, 1, 0, 0, 1, 1,
-0.8132982, -1.209524, -3.137251, 1, 0, 0, 1, 1,
-0.8052157, -0.45228, -1.92705, 1, 0, 0, 1, 1,
-0.8044814, -0.2986, -3.963183, 1, 0, 0, 1, 1,
-0.801303, 1.575913, -1.305597, 1, 0, 0, 1, 1,
-0.7930676, 0.03681378, -1.385391, 0, 0, 0, 1, 1,
-0.7929463, 1.154597, -1.41035, 0, 0, 0, 1, 1,
-0.7837016, -0.4477495, -0.2863265, 0, 0, 0, 1, 1,
-0.781991, 0.5984468, -1.744068, 0, 0, 0, 1, 1,
-0.7798362, 0.8874333, -0.6595708, 0, 0, 0, 1, 1,
-0.7783668, -1.082144, -1.529522, 0, 0, 0, 1, 1,
-0.768169, 0.2394188, -0.1325765, 0, 0, 0, 1, 1,
-0.7631133, -2.053754, -3.451916, 1, 1, 1, 1, 1,
-0.7601007, -0.7420319, -2.509503, 1, 1, 1, 1, 1,
-0.759258, -0.04542977, -2.922959, 1, 1, 1, 1, 1,
-0.7589918, 0.06374134, -2.122963, 1, 1, 1, 1, 1,
-0.7578737, -0.158414, -0.8370038, 1, 1, 1, 1, 1,
-0.7496849, -0.6450372, -2.130204, 1, 1, 1, 1, 1,
-0.7440276, -1.362611, -3.042608, 1, 1, 1, 1, 1,
-0.7395378, 0.307362, -0.5203624, 1, 1, 1, 1, 1,
-0.739287, -0.00107372, -2.136189, 1, 1, 1, 1, 1,
-0.7373123, 0.3787607, -2.64528, 1, 1, 1, 1, 1,
-0.7371667, 0.9729051, -0.6290917, 1, 1, 1, 1, 1,
-0.7350198, 0.8184025, -0.5135157, 1, 1, 1, 1, 1,
-0.7330117, 0.6461602, -0.00700062, 1, 1, 1, 1, 1,
-0.73058, -0.3647957, -1.152858, 1, 1, 1, 1, 1,
-0.7130916, -1.410412, -2.586898, 1, 1, 1, 1, 1,
-0.7028787, 1.714013, -1.06757, 0, 0, 1, 1, 1,
-0.7010266, 0.1565414, -1.74621, 1, 0, 0, 1, 1,
-0.6973263, 0.6357703, -0.8305151, 1, 0, 0, 1, 1,
-0.6968679, 0.8775795, 0.5185243, 1, 0, 0, 1, 1,
-0.6919791, -0.3035832, -1.140003, 1, 0, 0, 1, 1,
-0.6872694, 0.1435193, -0.5642792, 1, 0, 0, 1, 1,
-0.6858177, 1.489405, -2.448524, 0, 0, 0, 1, 1,
-0.6844835, -0.1133623, -2.70015, 0, 0, 0, 1, 1,
-0.6797279, -1.581186, -2.791746, 0, 0, 0, 1, 1,
-0.6775715, 1.205812, 0.5640605, 0, 0, 0, 1, 1,
-0.670642, 0.6351905, -2.418984, 0, 0, 0, 1, 1,
-0.6698261, 0.07598586, -0.165536, 0, 0, 0, 1, 1,
-0.6651338, -1.174099, -2.282939, 0, 0, 0, 1, 1,
-0.6623152, 0.4266204, 0.8676941, 1, 1, 1, 1, 1,
-0.6570086, 0.01337216, -1.266706, 1, 1, 1, 1, 1,
-0.6550214, -0.5834612, -1.299441, 1, 1, 1, 1, 1,
-0.6535609, 0.03831241, -1.648147, 1, 1, 1, 1, 1,
-0.6530197, -2.006516, -3.459257, 1, 1, 1, 1, 1,
-0.6489733, 0.03847686, 0.0639859, 1, 1, 1, 1, 1,
-0.6457943, 1.833611, -0.7512281, 1, 1, 1, 1, 1,
-0.6449677, 0.3111706, -1.745177, 1, 1, 1, 1, 1,
-0.6391285, 0.4863865, -1.68969, 1, 1, 1, 1, 1,
-0.6386345, -0.09397009, -1.699917, 1, 1, 1, 1, 1,
-0.6384591, 0.1805583, -2.007147, 1, 1, 1, 1, 1,
-0.6366462, 0.2805162, -2.269721, 1, 1, 1, 1, 1,
-0.6344601, -0.8196846, -3.828033, 1, 1, 1, 1, 1,
-0.6261823, 0.06005451, -2.042538, 1, 1, 1, 1, 1,
-0.6209872, 0.6513219, 0.3717662, 1, 1, 1, 1, 1,
-0.6181054, 1.087585, -1.467995, 0, 0, 1, 1, 1,
-0.6160222, 1.21476, -0.8836942, 1, 0, 0, 1, 1,
-0.6097649, 1.050364, -0.1244985, 1, 0, 0, 1, 1,
-0.6056724, -0.2160916, -1.464026, 1, 0, 0, 1, 1,
-0.6034807, 1.191727, -1.050373, 1, 0, 0, 1, 1,
-0.6032459, -0.9451711, -3.071092, 1, 0, 0, 1, 1,
-0.6028836, 0.531076, -0.3819797, 0, 0, 0, 1, 1,
-0.6027569, -0.9349552, 0.6248692, 0, 0, 0, 1, 1,
-0.6007489, 0.9925888, -2.190716, 0, 0, 0, 1, 1,
-0.6002838, 0.2179818, -1.788488, 0, 0, 0, 1, 1,
-0.5958992, 1.178787, -2.699456, 0, 0, 0, 1, 1,
-0.5954866, 0.8253182, -2.974669, 0, 0, 0, 1, 1,
-0.5932632, 0.5143674, -1.414826, 0, 0, 0, 1, 1,
-0.5903806, -0.05913967, -1.149882, 1, 1, 1, 1, 1,
-0.58958, 0.2992372, -0.6439182, 1, 1, 1, 1, 1,
-0.5888448, 0.101982, 0.4482147, 1, 1, 1, 1, 1,
-0.5860329, 0.3757802, -1.737097, 1, 1, 1, 1, 1,
-0.5849541, -0.1971164, -1.745089, 1, 1, 1, 1, 1,
-0.5841758, 0.4666917, -0.5343265, 1, 1, 1, 1, 1,
-0.5830392, 0.5747468, -1.769941, 1, 1, 1, 1, 1,
-0.5819362, 1.518195, -0.6353008, 1, 1, 1, 1, 1,
-0.5811887, -0.892026, 0.9994373, 1, 1, 1, 1, 1,
-0.5797327, -0.2076455, -4.274878, 1, 1, 1, 1, 1,
-0.5684912, 0.2495118, -3.211152, 1, 1, 1, 1, 1,
-0.5682428, -1.949218, -3.023788, 1, 1, 1, 1, 1,
-0.563684, 3.000711, -0.7782292, 1, 1, 1, 1, 1,
-0.5604377, 0.4631325, -1.680784, 1, 1, 1, 1, 1,
-0.5386339, 0.6592894, 0.9388431, 1, 1, 1, 1, 1,
-0.5372581, 0.4430345, -0.1181741, 0, 0, 1, 1, 1,
-0.5357994, 0.2907746, -1.672874, 1, 0, 0, 1, 1,
-0.533709, 0.07474604, -0.1057111, 1, 0, 0, 1, 1,
-0.5335049, 0.07416115, -2.877434, 1, 0, 0, 1, 1,
-0.5296722, -0.2188704, -3.371176, 1, 0, 0, 1, 1,
-0.527447, 2.321998, -0.7628568, 1, 0, 0, 1, 1,
-0.5263879, -1.255016, -4.355182, 0, 0, 0, 1, 1,
-0.5252663, 0.003680754, -0.5852134, 0, 0, 0, 1, 1,
-0.5220599, 0.677888, -1.441539, 0, 0, 0, 1, 1,
-0.5197761, -0.7896374, -1.365359, 0, 0, 0, 1, 1,
-0.5189738, -0.4562146, -2.538636, 0, 0, 0, 1, 1,
-0.5183258, 0.0856171, -2.27723, 0, 0, 0, 1, 1,
-0.516629, -0.3104703, -1.406787, 0, 0, 0, 1, 1,
-0.5130166, 0.6141651, -0.8237591, 1, 1, 1, 1, 1,
-0.5091753, -1.50968, -2.330298, 1, 1, 1, 1, 1,
-0.5069718, 0.5196378, -0.2642165, 1, 1, 1, 1, 1,
-0.5044733, 0.6700392, 1.268206, 1, 1, 1, 1, 1,
-0.5009906, -0.3185969, -2.718493, 1, 1, 1, 1, 1,
-0.499917, 0.1530453, -2.683169, 1, 1, 1, 1, 1,
-0.4931432, -0.04690123, -2.043735, 1, 1, 1, 1, 1,
-0.486706, 1.938779, 2.214054, 1, 1, 1, 1, 1,
-0.4801697, 2.427356, 0.3182414, 1, 1, 1, 1, 1,
-0.4766358, 0.6885611, 0.3997359, 1, 1, 1, 1, 1,
-0.4682628, -0.3127481, -0.1615439, 1, 1, 1, 1, 1,
-0.4650131, -0.5403955, -3.615721, 1, 1, 1, 1, 1,
-0.4643042, -0.1856087, -1.749675, 1, 1, 1, 1, 1,
-0.4642253, 0.4009047, -2.323886, 1, 1, 1, 1, 1,
-0.4618651, -0.2354025, -3.361992, 1, 1, 1, 1, 1,
-0.4575236, 0.2722565, -1.501546, 0, 0, 1, 1, 1,
-0.4561175, 1.290961, -0.6051433, 1, 0, 0, 1, 1,
-0.4540826, 0.8768071, -0.8648614, 1, 0, 0, 1, 1,
-0.4509437, 1.536168, -0.6708182, 1, 0, 0, 1, 1,
-0.449398, 1.176759, -2.761744, 1, 0, 0, 1, 1,
-0.4453988, 0.3109901, -0.7854909, 1, 0, 0, 1, 1,
-0.4451837, -0.4140116, -3.193657, 0, 0, 0, 1, 1,
-0.4449791, 0.06083148, -0.5313346, 0, 0, 0, 1, 1,
-0.4388412, 2.345892, -0.9594541, 0, 0, 0, 1, 1,
-0.435503, 0.5301074, -0.8671387, 0, 0, 0, 1, 1,
-0.4347452, -0.0007350713, -2.914951, 0, 0, 0, 1, 1,
-0.4313777, 0.8394498, -0.5913655, 0, 0, 0, 1, 1,
-0.4275831, 0.7449703, -0.2754332, 0, 0, 0, 1, 1,
-0.4274267, -1.184092, -2.23435, 1, 1, 1, 1, 1,
-0.426215, 0.2321024, -1.336353, 1, 1, 1, 1, 1,
-0.4261928, -0.3186435, -3.11072, 1, 1, 1, 1, 1,
-0.4224828, 0.9163089, -1.775377, 1, 1, 1, 1, 1,
-0.4143621, -0.177279, -1.130328, 1, 1, 1, 1, 1,
-0.413208, 1.799185, 1.136661, 1, 1, 1, 1, 1,
-0.4131073, -0.282284, -0.3234758, 1, 1, 1, 1, 1,
-0.4089173, 1.188742, 1.230943, 1, 1, 1, 1, 1,
-0.4072714, -0.5242752, -1.773745, 1, 1, 1, 1, 1,
-0.4058063, 1.164386, -0.3555827, 1, 1, 1, 1, 1,
-0.4051213, -0.3306214, -2.149706, 1, 1, 1, 1, 1,
-0.4046933, 0.4333658, 0.05259417, 1, 1, 1, 1, 1,
-0.4045377, -1.140995, -3.677364, 1, 1, 1, 1, 1,
-0.4008848, 0.3489419, -1.003993, 1, 1, 1, 1, 1,
-0.4003507, -1.119472, -2.061536, 1, 1, 1, 1, 1,
-0.3984011, 0.5693845, -0.3143213, 0, 0, 1, 1, 1,
-0.3968748, -0.2060789, -1.034099, 1, 0, 0, 1, 1,
-0.3862912, 0.1894608, -0.06943311, 1, 0, 0, 1, 1,
-0.3860558, -0.9247595, -2.053728, 1, 0, 0, 1, 1,
-0.3859553, 0.8315361, -2.027864, 1, 0, 0, 1, 1,
-0.3854045, -0.2781252, -3.31802, 1, 0, 0, 1, 1,
-0.3842657, -1.262127, -2.949916, 0, 0, 0, 1, 1,
-0.3815109, -1.032516, -3.203086, 0, 0, 0, 1, 1,
-0.3787863, 0.3706178, -1.504933, 0, 0, 0, 1, 1,
-0.3781878, -1.826365, -4.21041, 0, 0, 0, 1, 1,
-0.3778062, 0.4492663, 0.02654236, 0, 0, 0, 1, 1,
-0.3777465, -1.639269, -3.133289, 0, 0, 0, 1, 1,
-0.3760436, -1.077252, -3.47351, 0, 0, 0, 1, 1,
-0.3734909, 1.500481, -1.159159, 1, 1, 1, 1, 1,
-0.3706711, 0.5006405, -0.1988441, 1, 1, 1, 1, 1,
-0.3639459, 1.128883, -1.964824, 1, 1, 1, 1, 1,
-0.3620879, -0.605917, -2.335016, 1, 1, 1, 1, 1,
-0.3609719, -0.1979452, -2.411173, 1, 1, 1, 1, 1,
-0.3589714, 2.014445, -1.25744, 1, 1, 1, 1, 1,
-0.3574857, -0.4931557, -0.3006907, 1, 1, 1, 1, 1,
-0.3528947, -0.3796589, -3.59303, 1, 1, 1, 1, 1,
-0.3510375, 0.03678399, -2.275136, 1, 1, 1, 1, 1,
-0.3507556, -1.641803, -2.746253, 1, 1, 1, 1, 1,
-0.3493433, -0.1290278, -2.042136, 1, 1, 1, 1, 1,
-0.3486472, -0.4920713, -2.936616, 1, 1, 1, 1, 1,
-0.3468055, -0.2680653, -1.598657, 1, 1, 1, 1, 1,
-0.3460132, -1.188788, -2.53065, 1, 1, 1, 1, 1,
-0.3458166, 0.7380271, -2.100548, 1, 1, 1, 1, 1,
-0.3440321, 0.9593735, -2.537348, 0, 0, 1, 1, 1,
-0.3421202, 0.3520197, -3.500766, 1, 0, 0, 1, 1,
-0.3412953, -1.568139, -4.441899, 1, 0, 0, 1, 1,
-0.3405506, 0.9575827, -0.8657479, 1, 0, 0, 1, 1,
-0.3400381, 0.1972097, -1.099402, 1, 0, 0, 1, 1,
-0.3357401, -0.5119461, -3.478836, 1, 0, 0, 1, 1,
-0.3338334, -0.4550489, -3.257162, 0, 0, 0, 1, 1,
-0.3298364, -2.854759, -2.756701, 0, 0, 0, 1, 1,
-0.3135225, -3.094876, -2.680886, 0, 0, 0, 1, 1,
-0.3132586, -0.1173803, -2.48996, 0, 0, 0, 1, 1,
-0.3114426, 1.130118, 0.8576808, 0, 0, 0, 1, 1,
-0.310473, -2.037694, -1.904461, 0, 0, 0, 1, 1,
-0.3058379, 2.151501, 0.572859, 0, 0, 0, 1, 1,
-0.3052059, 1.111294, -1.326801, 1, 1, 1, 1, 1,
-0.2998003, 1.795638, -0.04539376, 1, 1, 1, 1, 1,
-0.2956166, 0.9633493, 0.0478486, 1, 1, 1, 1, 1,
-0.2951698, 0.8830974, -1.170122, 1, 1, 1, 1, 1,
-0.295049, -1.005516, -3.188748, 1, 1, 1, 1, 1,
-0.2943488, 1.21414, -0.08044492, 1, 1, 1, 1, 1,
-0.293648, -0.3901629, -3.086251, 1, 1, 1, 1, 1,
-0.2911146, 0.3581654, -0.6917627, 1, 1, 1, 1, 1,
-0.2897936, 0.7374288, -1.762246, 1, 1, 1, 1, 1,
-0.2822785, 2.646702, -1.132795, 1, 1, 1, 1, 1,
-0.2805846, 0.5625885, -0.7627806, 1, 1, 1, 1, 1,
-0.2787515, 0.169253, -0.9596412, 1, 1, 1, 1, 1,
-0.2722676, -0.009067402, -0.5349652, 1, 1, 1, 1, 1,
-0.2708762, -0.6558416, -4.436479, 1, 1, 1, 1, 1,
-0.2698925, -0.7801691, -5.071748, 1, 1, 1, 1, 1,
-0.2623194, 0.09338981, -0.06800017, 0, 0, 1, 1, 1,
-0.2586599, -0.9394541, -4.076425, 1, 0, 0, 1, 1,
-0.2565508, 2.403978, 0.747815, 1, 0, 0, 1, 1,
-0.256007, 0.6009912, -1.296493, 1, 0, 0, 1, 1,
-0.255308, -1.007128, -3.157431, 1, 0, 0, 1, 1,
-0.2506748, -1.668906, -1.813855, 1, 0, 0, 1, 1,
-0.245826, 0.4935285, 0.686886, 0, 0, 0, 1, 1,
-0.2429664, 0.7181727, 0.1833876, 0, 0, 0, 1, 1,
-0.2423726, -0.8472949, -1.274198, 0, 0, 0, 1, 1,
-0.2385438, 1.399441, 0.5382332, 0, 0, 0, 1, 1,
-0.2379658, 0.7045678, -1.110895, 0, 0, 0, 1, 1,
-0.2371253, 0.5582479, 0.3444109, 0, 0, 0, 1, 1,
-0.2334293, -2.661679, -3.268183, 0, 0, 0, 1, 1,
-0.2330741, -0.7603509, -2.732748, 1, 1, 1, 1, 1,
-0.2300122, 0.1601411, -2.048239, 1, 1, 1, 1, 1,
-0.2297167, 0.2795186, -0.3587408, 1, 1, 1, 1, 1,
-0.2289291, 0.3401706, -0.8415816, 1, 1, 1, 1, 1,
-0.2279485, 0.4187917, -0.2254754, 1, 1, 1, 1, 1,
-0.2256481, 0.1737778, -0.04058855, 1, 1, 1, 1, 1,
-0.2252102, -1.228332, -2.376974, 1, 1, 1, 1, 1,
-0.223065, 0.1940574, -2.125195, 1, 1, 1, 1, 1,
-0.2229398, -0.06658667, -1.9593, 1, 1, 1, 1, 1,
-0.2189045, 1.619188, -1.648678, 1, 1, 1, 1, 1,
-0.2179275, 0.2664204, -2.662682, 1, 1, 1, 1, 1,
-0.2168151, -0.04732312, -2.10029, 1, 1, 1, 1, 1,
-0.2166435, 0.0224307, -0.5695428, 1, 1, 1, 1, 1,
-0.2117867, 0.2056946, -0.8997869, 1, 1, 1, 1, 1,
-0.2093577, 0.9173371, 0.6039056, 1, 1, 1, 1, 1,
-0.2070918, 0.8643515, -0.7661791, 0, 0, 1, 1, 1,
-0.2008514, -1.643308, -2.669487, 1, 0, 0, 1, 1,
-0.2008342, 0.1706062, 0.5945383, 1, 0, 0, 1, 1,
-0.2004302, -0.06819171, -2.818244, 1, 0, 0, 1, 1,
-0.1998907, -0.2003841, -3.372404, 1, 0, 0, 1, 1,
-0.199743, 0.2773726, -0.1688291, 1, 0, 0, 1, 1,
-0.1975451, -0.1243601, -1.787167, 0, 0, 0, 1, 1,
-0.1894782, -1.732181, -3.078381, 0, 0, 0, 1, 1,
-0.1839793, -1.813302, -3.599998, 0, 0, 0, 1, 1,
-0.1823636, 1.389415, -0.8366192, 0, 0, 0, 1, 1,
-0.1816384, 0.3332951, -1.000242, 0, 0, 0, 1, 1,
-0.1795706, -0.685485, -2.49684, 0, 0, 0, 1, 1,
-0.1778153, -1.639956, -2.245919, 0, 0, 0, 1, 1,
-0.1769898, 0.2360741, -1.180373, 1, 1, 1, 1, 1,
-0.17596, 1.527768, -0.6890625, 1, 1, 1, 1, 1,
-0.1753109, -0.1370956, -1.602463, 1, 1, 1, 1, 1,
-0.1748021, -0.3475612, -1.428838, 1, 1, 1, 1, 1,
-0.1739867, -0.01938669, -0.5390292, 1, 1, 1, 1, 1,
-0.1716024, 0.359909, 0.153234, 1, 1, 1, 1, 1,
-0.1680253, -1.473333, -0.5160035, 1, 1, 1, 1, 1,
-0.1667372, 0.6236435, 0.4043312, 1, 1, 1, 1, 1,
-0.164878, -0.2177955, -2.651234, 1, 1, 1, 1, 1,
-0.1603756, -1.41173, -2.065654, 1, 1, 1, 1, 1,
-0.1591148, 0.2250468, -1.61982, 1, 1, 1, 1, 1,
-0.1476573, -0.1707832, -2.593349, 1, 1, 1, 1, 1,
-0.1456059, 2.271473, -0.2954604, 1, 1, 1, 1, 1,
-0.1442646, -1.420411, -2.620628, 1, 1, 1, 1, 1,
-0.1398752, -2.714103, -3.401647, 1, 1, 1, 1, 1,
-0.1314443, 1.533838, -0.5321021, 0, 0, 1, 1, 1,
-0.1309823, -1.365429, -3.412061, 1, 0, 0, 1, 1,
-0.1283047, -0.6654191, -2.957486, 1, 0, 0, 1, 1,
-0.1282013, 1.098891, -0.1592536, 1, 0, 0, 1, 1,
-0.1235081, 1.875476, -0.197668, 1, 0, 0, 1, 1,
-0.1219235, -0.619916, -3.153525, 1, 0, 0, 1, 1,
-0.1219152, -0.2617713, -1.643464, 0, 0, 0, 1, 1,
-0.115973, 1.015861, -0.8739138, 0, 0, 0, 1, 1,
-0.1107296, 0.1964867, -1.251046, 0, 0, 0, 1, 1,
-0.1073287, -1.409154, -3.188391, 0, 0, 0, 1, 1,
-0.1069716, -1.419452, -3.588901, 0, 0, 0, 1, 1,
-0.1029233, 0.213837, -0.7042708, 0, 0, 0, 1, 1,
-0.1023897, 0.5766391, 0.1259458, 0, 0, 0, 1, 1,
-0.09873694, 1.864531, 0.9026233, 1, 1, 1, 1, 1,
-0.09330506, -0.9159703, -2.54672, 1, 1, 1, 1, 1,
-0.09180549, 0.388187, 0.4236435, 1, 1, 1, 1, 1,
-0.08085298, 0.1008064, -1.870696, 1, 1, 1, 1, 1,
-0.07599407, 0.7158701, 0.869009, 1, 1, 1, 1, 1,
-0.07585653, -0.4977345, -3.312933, 1, 1, 1, 1, 1,
-0.0740182, -0.4620968, -3.509566, 1, 1, 1, 1, 1,
-0.07269882, 0.281617, 1.003335, 1, 1, 1, 1, 1,
-0.07113042, -0.5207816, -4.799003, 1, 1, 1, 1, 1,
-0.06882678, 0.3150356, -0.3141391, 1, 1, 1, 1, 1,
-0.06669527, 1.50826, 0.5686123, 1, 1, 1, 1, 1,
-0.06208279, 0.05858295, -2.12693, 1, 1, 1, 1, 1,
-0.06082992, 0.5254887, -0.05963929, 1, 1, 1, 1, 1,
-0.06046402, 0.0731207, -2.305154, 1, 1, 1, 1, 1,
-0.05685474, -1.495121, -2.245385, 1, 1, 1, 1, 1,
-0.05680377, -0.8808275, -2.977058, 0, 0, 1, 1, 1,
-0.05637987, -0.2409991, -1.531831, 1, 0, 0, 1, 1,
-0.05007007, -1.340969, -3.955438, 1, 0, 0, 1, 1,
-0.04926869, 0.4974208, 2.011865, 1, 0, 0, 1, 1,
-0.04210931, -0.2111835, -2.545864, 1, 0, 0, 1, 1,
-0.0392055, -1.643034, -3.417893, 1, 0, 0, 1, 1,
-0.03532481, 1.599928, -0.1731736, 0, 0, 0, 1, 1,
-0.03392795, 1.090454, -0.5225397, 0, 0, 0, 1, 1,
-0.03175403, -0.02983735, -3.269609, 0, 0, 0, 1, 1,
-0.03072154, 1.395965, 0.1288736, 0, 0, 0, 1, 1,
-0.02609134, -0.0779945, -2.144266, 0, 0, 0, 1, 1,
-0.02361406, 0.9163423, 0.5972227, 0, 0, 0, 1, 1,
-0.02134208, -0.114448, -4.05422, 0, 0, 0, 1, 1,
-0.0210482, -0.8304837, -2.195329, 1, 1, 1, 1, 1,
-0.01804935, 1.195061, -0.3745004, 1, 1, 1, 1, 1,
-0.01770474, 0.6494328, -0.938547, 1, 1, 1, 1, 1,
-0.008710489, 0.3001765, -0.3398006, 1, 1, 1, 1, 1,
-0.006432259, 1.413948, 0.03580463, 1, 1, 1, 1, 1,
-0.006316662, 0.3762879, -0.1173791, 1, 1, 1, 1, 1,
-0.006010767, -0.8312468, -4.20363, 1, 1, 1, 1, 1,
-0.00414373, 0.5650277, -0.2611382, 1, 1, 1, 1, 1,
0.001723633, 0.3901299, -0.4074456, 1, 1, 1, 1, 1,
0.002645012, -1.356718, 1.428372, 1, 1, 1, 1, 1,
0.01112398, 0.7196218, 1.782267, 1, 1, 1, 1, 1,
0.01182504, -0.9286527, 3.519288, 1, 1, 1, 1, 1,
0.01377976, 1.190852, -0.1311756, 1, 1, 1, 1, 1,
0.01411193, 0.714766, -1.755997, 1, 1, 1, 1, 1,
0.01745499, -1.796854, 4.21834, 1, 1, 1, 1, 1,
0.02513774, -0.7785388, 4.669914, 0, 0, 1, 1, 1,
0.03049141, -0.8892813, 1.908152, 1, 0, 0, 1, 1,
0.0317907, 1.373527, -0.1493306, 1, 0, 0, 1, 1,
0.03238914, 0.6070347, -1.226173, 1, 0, 0, 1, 1,
0.03415878, 1.250717, 0.8777875, 1, 0, 0, 1, 1,
0.0345454, -0.9540528, 3.11568, 1, 0, 0, 1, 1,
0.03605567, -0.1544875, 2.271562, 0, 0, 0, 1, 1,
0.03978965, -0.001702373, 1.990722, 0, 0, 0, 1, 1,
0.04338619, -0.9972658, 3.647436, 0, 0, 0, 1, 1,
0.04388267, 0.03281206, 1.388643, 0, 0, 0, 1, 1,
0.05437487, -0.5953056, 1.258597, 0, 0, 0, 1, 1,
0.05699566, 0.313177, 0.7063199, 0, 0, 0, 1, 1,
0.05792816, -0.8169767, 1.853786, 0, 0, 0, 1, 1,
0.05918918, -0.4423268, 1.738152, 1, 1, 1, 1, 1,
0.06118232, 0.7166016, 0.8159381, 1, 1, 1, 1, 1,
0.06358071, -0.6179447, 3.686255, 1, 1, 1, 1, 1,
0.06951816, 1.049087, -0.8154372, 1, 1, 1, 1, 1,
0.07071511, 1.242227, 0.504047, 1, 1, 1, 1, 1,
0.0718456, 0.0754649, 2.030817, 1, 1, 1, 1, 1,
0.07515249, -0.003424327, 2.609649, 1, 1, 1, 1, 1,
0.07570539, -2.909688, 3.371685, 1, 1, 1, 1, 1,
0.07602062, -0.1305979, 1.438221, 1, 1, 1, 1, 1,
0.07942481, -0.7912381, 4.337957, 1, 1, 1, 1, 1,
0.08004663, 0.7380127, 0.1125608, 1, 1, 1, 1, 1,
0.08302812, 1.343211, -2.995477, 1, 1, 1, 1, 1,
0.08532102, -1.194745, 4.160606, 1, 1, 1, 1, 1,
0.08563692, 0.7640749, -0.7673693, 1, 1, 1, 1, 1,
0.08760563, 0.6606635, -0.1216798, 1, 1, 1, 1, 1,
0.08872973, -0.2847907, 3.26015, 0, 0, 1, 1, 1,
0.08922453, -0.2714879, 3.436338, 1, 0, 0, 1, 1,
0.09077609, -0.8118941, 2.003185, 1, 0, 0, 1, 1,
0.09113801, 0.986926, -0.300073, 1, 0, 0, 1, 1,
0.09169174, -1.302516, 3.417904, 1, 0, 0, 1, 1,
0.09492039, 1.505407, -0.7224391, 1, 0, 0, 1, 1,
0.09538169, -0.3700072, 4.720352, 0, 0, 0, 1, 1,
0.1046889, 0.4577271, -0.8675959, 0, 0, 0, 1, 1,
0.1066438, 2.270498, 1.19537, 0, 0, 0, 1, 1,
0.1080264, -0.04673069, 3.44247, 0, 0, 0, 1, 1,
0.1092389, -0.1792764, 4.698916, 0, 0, 0, 1, 1,
0.1155193, -2.148654, 3.759035, 0, 0, 0, 1, 1,
0.119958, -1.98156, 2.855153, 0, 0, 0, 1, 1,
0.1244529, 2.03825, 0.1508108, 1, 1, 1, 1, 1,
0.125839, 1.380702, 0.7700319, 1, 1, 1, 1, 1,
0.1287672, 0.1982502, -0.04236976, 1, 1, 1, 1, 1,
0.1313994, 0.559576, -0.7232922, 1, 1, 1, 1, 1,
0.1314367, -1.014049, 2.084743, 1, 1, 1, 1, 1,
0.1371049, -1.341794, 2.550014, 1, 1, 1, 1, 1,
0.1402662, -0.8157694, 0.1839193, 1, 1, 1, 1, 1,
0.1413649, 0.9923933, 0.3085939, 1, 1, 1, 1, 1,
0.1424074, -0.7231386, 3.091643, 1, 1, 1, 1, 1,
0.1424456, -0.2410133, 3.538624, 1, 1, 1, 1, 1,
0.1444876, 0.2254082, 2.098504, 1, 1, 1, 1, 1,
0.1448401, 0.4003524, -0.8959616, 1, 1, 1, 1, 1,
0.1462784, -1.250522, 3.705467, 1, 1, 1, 1, 1,
0.1471938, -1.825608, 2.691047, 1, 1, 1, 1, 1,
0.151052, 0.1918979, -1.574535, 1, 1, 1, 1, 1,
0.1526341, 0.229523, 0.02530352, 0, 0, 1, 1, 1,
0.1535847, -0.1680585, 1.737665, 1, 0, 0, 1, 1,
0.1575715, 0.09327833, 2.068437, 1, 0, 0, 1, 1,
0.157956, -1.478988, 4.190189, 1, 0, 0, 1, 1,
0.1687848, -1.175102, 4.174288, 1, 0, 0, 1, 1,
0.1700677, 0.372158, 0.5891944, 1, 0, 0, 1, 1,
0.1710895, 0.2013941, -0.952864, 0, 0, 0, 1, 1,
0.1720981, 0.6320469, 0.2005435, 0, 0, 0, 1, 1,
0.1721198, -3.202377, 2.802904, 0, 0, 0, 1, 1,
0.1723661, -1.475749, 1.894508, 0, 0, 0, 1, 1,
0.1735004, 0.6476514, -0.4083151, 0, 0, 0, 1, 1,
0.1753733, 0.2996579, 1.4176, 0, 0, 0, 1, 1,
0.1764972, 1.643314, -0.40671, 0, 0, 0, 1, 1,
0.179622, -0.4289839, 3.071897, 1, 1, 1, 1, 1,
0.1807488, -0.5144348, 2.841153, 1, 1, 1, 1, 1,
0.1817825, 0.1173915, 2.154365, 1, 1, 1, 1, 1,
0.1895188, -1.861424, 0.01391328, 1, 1, 1, 1, 1,
0.1953839, -0.9067718, 3.48213, 1, 1, 1, 1, 1,
0.1960833, -0.3652884, 0.6585731, 1, 1, 1, 1, 1,
0.1965117, 1.248311, -0.1140077, 1, 1, 1, 1, 1,
0.196902, -0.02532934, 1.495321, 1, 1, 1, 1, 1,
0.1975171, 2.396576, -0.2871674, 1, 1, 1, 1, 1,
0.1986481, 1.256485, 1.19556, 1, 1, 1, 1, 1,
0.1989485, -0.920006, 1.989064, 1, 1, 1, 1, 1,
0.1999235, -0.8720251, 2.962818, 1, 1, 1, 1, 1,
0.2003718, 0.8422825, -0.8957758, 1, 1, 1, 1, 1,
0.2008324, -0.9035322, 3.545981, 1, 1, 1, 1, 1,
0.2039922, -1.301119, 3.354647, 1, 1, 1, 1, 1,
0.2045864, 0.3325226, 2.219782, 0, 0, 1, 1, 1,
0.2047911, 1.005738, 0.9400997, 1, 0, 0, 1, 1,
0.2050467, -0.7852741, 2.021829, 1, 0, 0, 1, 1,
0.2112024, 0.3593267, -0.2748692, 1, 0, 0, 1, 1,
0.2132521, 0.1135621, 1.571039, 1, 0, 0, 1, 1,
0.213678, 0.177163, 1.592598, 1, 0, 0, 1, 1,
0.2247915, -0.03666351, 0.7960126, 0, 0, 0, 1, 1,
0.2258845, 0.1392266, 1.806957, 0, 0, 0, 1, 1,
0.2269777, -0.7835439, 1.28915, 0, 0, 0, 1, 1,
0.2288465, -0.4336081, 1.186922, 0, 0, 0, 1, 1,
0.2293885, -1.260303, 3.286306, 0, 0, 0, 1, 1,
0.2317366, -1.094144, 2.474317, 0, 0, 0, 1, 1,
0.2325664, 1.153959, 0.2187755, 0, 0, 0, 1, 1,
0.2337176, -0.433754, 3.776342, 1, 1, 1, 1, 1,
0.2370808, 0.6146381, 2.347983, 1, 1, 1, 1, 1,
0.2373953, -0.4140726, 2.685657, 1, 1, 1, 1, 1,
0.2440588, -0.1331129, 1.535996, 1, 1, 1, 1, 1,
0.2501825, -1.092131, 3.571084, 1, 1, 1, 1, 1,
0.2511722, -1.418224, 2.646864, 1, 1, 1, 1, 1,
0.252497, -0.3595611, 2.359235, 1, 1, 1, 1, 1,
0.2538039, 0.6970345, 1.934187, 1, 1, 1, 1, 1,
0.2558983, 0.598439, 0.1167699, 1, 1, 1, 1, 1,
0.2611562, 0.5753921, -0.5495359, 1, 1, 1, 1, 1,
0.2626336, -0.3990066, 1.754573, 1, 1, 1, 1, 1,
0.2630491, -0.9745612, 2.780197, 1, 1, 1, 1, 1,
0.2645355, 0.2415056, -1.719631, 1, 1, 1, 1, 1,
0.2678544, -0.909552, 4.453592, 1, 1, 1, 1, 1,
0.2741314, -0.4868269, 2.715094, 1, 1, 1, 1, 1,
0.2788874, 0.5527665, -0.9376513, 0, 0, 1, 1, 1,
0.2798013, -0.67793, 2.63397, 1, 0, 0, 1, 1,
0.2854955, 0.7059057, -0.5006273, 1, 0, 0, 1, 1,
0.2877086, -1.405875, 2.717761, 1, 0, 0, 1, 1,
0.2910427, 0.2351419, 2.104059, 1, 0, 0, 1, 1,
0.3011375, 0.7005335, 1.561946, 1, 0, 0, 1, 1,
0.3037705, -0.3250715, 2.383539, 0, 0, 0, 1, 1,
0.3100504, -0.6352564, 2.640257, 0, 0, 0, 1, 1,
0.3151793, -0.8308587, 1.679538, 0, 0, 0, 1, 1,
0.3160524, -1.02737, 2.295569, 0, 0, 0, 1, 1,
0.3169709, 0.3591899, 0.7763783, 0, 0, 0, 1, 1,
0.3206481, -0.9662867, 4.015558, 0, 0, 0, 1, 1,
0.3215626, -0.06420673, 2.936919, 0, 0, 0, 1, 1,
0.3282569, 0.2411613, 1.162839, 1, 1, 1, 1, 1,
0.3392999, -0.6377379, 4.424968, 1, 1, 1, 1, 1,
0.3403253, -0.3049242, 3.623435, 1, 1, 1, 1, 1,
0.3408436, -0.594957, 1.85493, 1, 1, 1, 1, 1,
0.3422342, 0.6288694, 3.596611, 1, 1, 1, 1, 1,
0.3422809, -0.7001868, 3.050424, 1, 1, 1, 1, 1,
0.3427146, 0.8138424, 1.543618, 1, 1, 1, 1, 1,
0.3433417, -0.05811483, 2.124282, 1, 1, 1, 1, 1,
0.3456114, 1.921632, 0.5289658, 1, 1, 1, 1, 1,
0.3515196, 0.06381232, 0.3339557, 1, 1, 1, 1, 1,
0.3521199, -0.06327983, 2.642428, 1, 1, 1, 1, 1,
0.3538199, -2.406598, 2.399636, 1, 1, 1, 1, 1,
0.3562566, 1.709406, 0.02195592, 1, 1, 1, 1, 1,
0.3589091, -0.6839813, 2.772144, 1, 1, 1, 1, 1,
0.3609207, 0.01732994, 1.43099, 1, 1, 1, 1, 1,
0.3695259, 0.2139516, -0.1054645, 0, 0, 1, 1, 1,
0.3737512, 0.8077154, 0.5767225, 1, 0, 0, 1, 1,
0.3757382, 0.5650822, 0.07133288, 1, 0, 0, 1, 1,
0.3782796, 0.7730478, 0.9611438, 1, 0, 0, 1, 1,
0.3812048, 0.960597, -0.514926, 1, 0, 0, 1, 1,
0.3843605, -1.65334, 3.207503, 1, 0, 0, 1, 1,
0.388462, -2.170421, 2.397075, 0, 0, 0, 1, 1,
0.3885512, -2.083712, 3.335852, 0, 0, 0, 1, 1,
0.3997303, 0.004437414, 3.742307, 0, 0, 0, 1, 1,
0.4001974, 0.3240286, -0.8130842, 0, 0, 0, 1, 1,
0.4021018, 1.906638, 2.066795, 0, 0, 0, 1, 1,
0.4070207, 0.5122113, 1.546274, 0, 0, 0, 1, 1,
0.4105045, 0.6435642, 0.4842598, 0, 0, 0, 1, 1,
0.4121549, -0.9029066, 4.47708, 1, 1, 1, 1, 1,
0.4184722, 1.105188, -0.6134184, 1, 1, 1, 1, 1,
0.4201957, 1.864139, 0.8595005, 1, 1, 1, 1, 1,
0.4242393, -0.6853725, 3.655946, 1, 1, 1, 1, 1,
0.4249173, 0.6175041, 0.2167016, 1, 1, 1, 1, 1,
0.4264078, 0.06028801, 0.8593752, 1, 1, 1, 1, 1,
0.4264136, 0.2239485, 0.9508179, 1, 1, 1, 1, 1,
0.4293334, 1.63082, 1.836383, 1, 1, 1, 1, 1,
0.4327207, 0.7968094, 1.845695, 1, 1, 1, 1, 1,
0.4338733, 0.1926973, 2.832375, 1, 1, 1, 1, 1,
0.4364242, -0.1228982, 1.302338, 1, 1, 1, 1, 1,
0.4405512, 2.427104, 0.5704286, 1, 1, 1, 1, 1,
0.4419107, 0.7861918, -0.6323591, 1, 1, 1, 1, 1,
0.4438237, -0.7976897, 3.397725, 1, 1, 1, 1, 1,
0.449259, -0.7699297, 1.066552, 1, 1, 1, 1, 1,
0.4569118, -1.503965, 4.488413, 0, 0, 1, 1, 1,
0.4587023, -0.6182833, 2.385258, 1, 0, 0, 1, 1,
0.4590429, 0.8126396, 0.3099124, 1, 0, 0, 1, 1,
0.4609767, 1.809708, 0.9593053, 1, 0, 0, 1, 1,
0.4618248, 1.307884, 0.5819715, 1, 0, 0, 1, 1,
0.4682659, 0.5256757, 0.3814885, 1, 0, 0, 1, 1,
0.4690959, 1.091924, 0.655744, 0, 0, 0, 1, 1,
0.469446, 0.5527316, -1.057165, 0, 0, 0, 1, 1,
0.473686, -0.2493044, 2.0824, 0, 0, 0, 1, 1,
0.4759872, -0.6658751, 2.345007, 0, 0, 0, 1, 1,
0.4764432, -0.5291052, 2.613881, 0, 0, 0, 1, 1,
0.4786378, 1.286369, 0.08670714, 0, 0, 0, 1, 1,
0.4842136, 0.564405, 1.157936, 0, 0, 0, 1, 1,
0.484925, 1.450744, 2.578661, 1, 1, 1, 1, 1,
0.4861519, 0.5793216, 0.7079653, 1, 1, 1, 1, 1,
0.4873311, -0.2402169, 1.087466, 1, 1, 1, 1, 1,
0.4895742, -0.5722142, 3.531415, 1, 1, 1, 1, 1,
0.4911733, -1.150037, 2.223238, 1, 1, 1, 1, 1,
0.4969659, 0.9615982, 0.1099128, 1, 1, 1, 1, 1,
0.497924, -0.27412, 2.415606, 1, 1, 1, 1, 1,
0.5012114, 1.248448, -0.565238, 1, 1, 1, 1, 1,
0.505901, 0.7685992, 1.386116, 1, 1, 1, 1, 1,
0.5075824, -0.8887168, 1.883064, 1, 1, 1, 1, 1,
0.512198, -0.5790446, 1.948048, 1, 1, 1, 1, 1,
0.5129787, 1.429099, 0.7931151, 1, 1, 1, 1, 1,
0.5133401, 0.6936931, 0.974791, 1, 1, 1, 1, 1,
0.5147918, 1.526827, -0.2937174, 1, 1, 1, 1, 1,
0.5164303, 1.24424, -1.696513, 1, 1, 1, 1, 1,
0.5171185, 0.4271543, 1.858743, 0, 0, 1, 1, 1,
0.5175552, -0.6477637, 2.139112, 1, 0, 0, 1, 1,
0.5192169, 0.6255677, 0.9285197, 1, 0, 0, 1, 1,
0.5213797, 0.1180502, 0.8347923, 1, 0, 0, 1, 1,
0.5234667, 0.7785436, 0.8502026, 1, 0, 0, 1, 1,
0.5328489, -0.6856984, 1.656915, 1, 0, 0, 1, 1,
0.5332904, 0.3467253, -0.5606747, 0, 0, 0, 1, 1,
0.5350089, 1.715058, 0.3608991, 0, 0, 0, 1, 1,
0.5385224, 0.9044729, 2.001092, 0, 0, 0, 1, 1,
0.5397363, 0.336229, 1.378072, 0, 0, 0, 1, 1,
0.5413398, -1.113152, 2.442106, 0, 0, 0, 1, 1,
0.5430706, -1.427758, 1.696365, 0, 0, 0, 1, 1,
0.546632, -2.215664, 4.072352, 0, 0, 0, 1, 1,
0.5492357, -0.7032303, 2.734034, 1, 1, 1, 1, 1,
0.5506224, -0.3331143, 1.452403, 1, 1, 1, 1, 1,
0.5556623, 0.6087464, 1.257344, 1, 1, 1, 1, 1,
0.5581515, 0.2911094, 0.7778961, 1, 1, 1, 1, 1,
0.5583363, 1.035195, -0.5646976, 1, 1, 1, 1, 1,
0.5643475, -0.4858688, 2.952389, 1, 1, 1, 1, 1,
0.5645245, 1.098921, 0.6043939, 1, 1, 1, 1, 1,
0.5645666, 1.632743, 0.9977951, 1, 1, 1, 1, 1,
0.5657403, 0.06833665, 2.40554, 1, 1, 1, 1, 1,
0.5666621, 2.213046, 1.295809, 1, 1, 1, 1, 1,
0.5683013, 0.9572037, 1.7146, 1, 1, 1, 1, 1,
0.5749156, 0.5002665, 3.028994, 1, 1, 1, 1, 1,
0.5784786, 0.7608541, 1.152596, 1, 1, 1, 1, 1,
0.5823681, 0.01854273, 1.519348, 1, 1, 1, 1, 1,
0.5856196, -0.214462, 1.573601, 1, 1, 1, 1, 1,
0.5904032, -2.568589, 3.174132, 0, 0, 1, 1, 1,
0.6028571, -0.9705362, 2.748017, 1, 0, 0, 1, 1,
0.6115732, 0.8463249, 0.9740163, 1, 0, 0, 1, 1,
0.6144525, 0.6769077, 0.06436963, 1, 0, 0, 1, 1,
0.6175551, 0.2349639, 1.806937, 1, 0, 0, 1, 1,
0.6185769, -0.01207572, 2.043488, 1, 0, 0, 1, 1,
0.6203483, -1.245905, 3.56755, 0, 0, 0, 1, 1,
0.6278666, 0.1158221, -0.07249635, 0, 0, 0, 1, 1,
0.6323313, 0.3388195, -0.1869166, 0, 0, 0, 1, 1,
0.6323603, 0.7493849, 1.189056, 0, 0, 0, 1, 1,
0.6337082, 0.09687487, 2.512642, 0, 0, 0, 1, 1,
0.6399372, 2.187733, -0.315397, 0, 0, 0, 1, 1,
0.6400054, 0.4519431, 0.4003581, 0, 0, 0, 1, 1,
0.6458667, -0.4660399, 3.573957, 1, 1, 1, 1, 1,
0.6479467, 1.629243, -0.6646391, 1, 1, 1, 1, 1,
0.6522586, -0.8342288, 2.958474, 1, 1, 1, 1, 1,
0.6527247, 0.6367729, 0.2734376, 1, 1, 1, 1, 1,
0.6533248, 0.3818194, -0.1741318, 1, 1, 1, 1, 1,
0.6535254, 0.9874448, -0.4909154, 1, 1, 1, 1, 1,
0.6543182, -2.15362, 1.220033, 1, 1, 1, 1, 1,
0.6552387, -0.3642082, 0.8619027, 1, 1, 1, 1, 1,
0.6571518, 0.3467171, 2.128433, 1, 1, 1, 1, 1,
0.6573085, 0.2389693, 2.353855, 1, 1, 1, 1, 1,
0.6599424, -0.185479, 1.12351, 1, 1, 1, 1, 1,
0.6600669, -0.6608645, 3.830708, 1, 1, 1, 1, 1,
0.661683, -0.7500522, 1.900625, 1, 1, 1, 1, 1,
0.6683917, 0.5199422, 0.451463, 1, 1, 1, 1, 1,
0.6752405, 0.1852496, 1.991808, 1, 1, 1, 1, 1,
0.6790953, -1.430845, 3.387514, 0, 0, 1, 1, 1,
0.6793782, -0.04096046, 1.441252, 1, 0, 0, 1, 1,
0.6800916, -0.4906804, 3.292063, 1, 0, 0, 1, 1,
0.6818296, -0.1276781, 1.57148, 1, 0, 0, 1, 1,
0.6820493, -0.01937418, 1.447801, 1, 0, 0, 1, 1,
0.6820807, 0.3141726, 0.5684907, 1, 0, 0, 1, 1,
0.6884686, -1.113991, 3.50738, 0, 0, 0, 1, 1,
0.6923878, 0.04011479, 1.435136, 0, 0, 0, 1, 1,
0.7005638, 1.122837, 0.9723471, 0, 0, 0, 1, 1,
0.7015793, 0.03189845, 0.8302386, 0, 0, 0, 1, 1,
0.7031546, 0.3810244, 0.1038692, 0, 0, 0, 1, 1,
0.7049119, -2.056786, 2.272142, 0, 0, 0, 1, 1,
0.7053007, -0.9257405, 1.404558, 0, 0, 0, 1, 1,
0.7077603, 1.267987, 1.826543, 1, 1, 1, 1, 1,
0.7082589, 0.08494707, 2.190666, 1, 1, 1, 1, 1,
0.7094682, -2.014307, 4.276017, 1, 1, 1, 1, 1,
0.7128863, 0.5461544, -0.6756024, 1, 1, 1, 1, 1,
0.7142832, 1.159645, -0.6358765, 1, 1, 1, 1, 1,
0.7182589, 0.4831809, 1.739869, 1, 1, 1, 1, 1,
0.7210308, 0.5992723, 0.1766501, 1, 1, 1, 1, 1,
0.7253228, -0.7211246, 2.09756, 1, 1, 1, 1, 1,
0.7255947, -1.434706, 4.210146, 1, 1, 1, 1, 1,
0.7284655, 0.7546189, 2.13091, 1, 1, 1, 1, 1,
0.7337935, -0.8145236, 1.58127, 1, 1, 1, 1, 1,
0.7399728, 1.500642, -0.0803019, 1, 1, 1, 1, 1,
0.742456, -0.8925869, 2.538995, 1, 1, 1, 1, 1,
0.7481748, 0.5133165, 0.5736303, 1, 1, 1, 1, 1,
0.7495017, -0.4972418, 1.222238, 1, 1, 1, 1, 1,
0.7507737, 0.4435357, -0.5644081, 0, 0, 1, 1, 1,
0.7531253, 1.176405, 0.6687571, 1, 0, 0, 1, 1,
0.7577129, 0.1340174, 0.06989685, 1, 0, 0, 1, 1,
0.7598528, -0.01239241, 1.112458, 1, 0, 0, 1, 1,
0.7599798, 1.387777, 1.118856, 1, 0, 0, 1, 1,
0.7647315, 0.3101059, 1.94913, 1, 0, 0, 1, 1,
0.7664676, 0.1268429, 1.113634, 0, 0, 0, 1, 1,
0.7695395, 0.1872283, 0.6286926, 0, 0, 0, 1, 1,
0.7696087, -0.8797387, 1.899423, 0, 0, 0, 1, 1,
0.7759131, 0.1704614, 1.80326, 0, 0, 0, 1, 1,
0.7824011, 0.4254139, 2.446077, 0, 0, 0, 1, 1,
0.7899653, -0.4692463, 1.298559, 0, 0, 0, 1, 1,
0.7986516, -0.1977971, 2.310436, 0, 0, 0, 1, 1,
0.8004515, -0.4365531, 1.365256, 1, 1, 1, 1, 1,
0.801816, -0.6953522, 3.385831, 1, 1, 1, 1, 1,
0.8029277, 0.009975935, 2.317031, 1, 1, 1, 1, 1,
0.8077208, 0.07055704, 2.584588, 1, 1, 1, 1, 1,
0.8116631, 1.052765, -0.2247659, 1, 1, 1, 1, 1,
0.8139812, 0.7887995, -0.9930243, 1, 1, 1, 1, 1,
0.8153631, -0.1417805, 1.783011, 1, 1, 1, 1, 1,
0.8165844, 1.253152, 1.134402, 1, 1, 1, 1, 1,
0.8167798, 0.2941697, 2.241457, 1, 1, 1, 1, 1,
0.8258993, 0.6358179, 0.6471945, 1, 1, 1, 1, 1,
0.8278335, 0.4357217, -0.7628958, 1, 1, 1, 1, 1,
0.8286759, -1.317676, 2.392699, 1, 1, 1, 1, 1,
0.8343264, -1.77868, 1.590386, 1, 1, 1, 1, 1,
0.8361682, -0.03378461, 1.182043, 1, 1, 1, 1, 1,
0.8371949, 1.234775, 0.6355219, 1, 1, 1, 1, 1,
0.8384523, -2.325772, 1.22254, 0, 0, 1, 1, 1,
0.8390637, -0.6116592, 1.511107, 1, 0, 0, 1, 1,
0.8448262, 1.090272, -0.6421678, 1, 0, 0, 1, 1,
0.8463603, -0.8466998, 3.410226, 1, 0, 0, 1, 1,
0.8478414, -0.3506116, 1.65325, 1, 0, 0, 1, 1,
0.8594271, -0.01209215, 0.9691218, 1, 0, 0, 1, 1,
0.8686184, -1.422625, 1.907207, 0, 0, 0, 1, 1,
0.8706042, 0.3939652, 2.30999, 0, 0, 0, 1, 1,
0.8754932, 0.5919225, 1.386481, 0, 0, 0, 1, 1,
0.8768263, -0.8536263, 3.246089, 0, 0, 0, 1, 1,
0.8795448, 0.6355388, 0.8230414, 0, 0, 0, 1, 1,
0.8798909, 0.7991649, -0.5656682, 0, 0, 0, 1, 1,
0.8801868, 0.8530841, -0.3564164, 0, 0, 0, 1, 1,
0.885468, -1.533841, 4.09536, 1, 1, 1, 1, 1,
0.8917369, -0.9933994, 2.275887, 1, 1, 1, 1, 1,
0.9021116, -0.6263678, 2.350856, 1, 1, 1, 1, 1,
0.905634, -0.1516517, 2.289288, 1, 1, 1, 1, 1,
0.9099489, -0.3982334, 1.45416, 1, 1, 1, 1, 1,
0.9126165, 0.5159379, 0.9470524, 1, 1, 1, 1, 1,
0.9149347, -0.4728537, 1.343755, 1, 1, 1, 1, 1,
0.9157367, 1.033897, 1.578148, 1, 1, 1, 1, 1,
0.9162665, -1.298698, 4.060884, 1, 1, 1, 1, 1,
0.9182573, 1.084014, 0.2928736, 1, 1, 1, 1, 1,
0.9268779, -0.2515258, 0.9208196, 1, 1, 1, 1, 1,
0.9300442, 1.898146, 0.04406798, 1, 1, 1, 1, 1,
0.9332914, 0.5977642, -0.1173333, 1, 1, 1, 1, 1,
0.9352041, -0.1450646, 3.440098, 1, 1, 1, 1, 1,
0.9391971, -2.230126, 2.737236, 1, 1, 1, 1, 1,
0.9394822, -0.3580575, 2.506837, 0, 0, 1, 1, 1,
0.9452908, -1.813916, 2.506799, 1, 0, 0, 1, 1,
0.9597501, 0.1172919, 2.210099, 1, 0, 0, 1, 1,
0.9627881, 1.198159, 0.8935645, 1, 0, 0, 1, 1,
0.9677936, -1.434865, 1.859636, 1, 0, 0, 1, 1,
0.9711192, 0.9759979, 3.360337, 1, 0, 0, 1, 1,
0.9726358, 0.1981882, 1.69815, 0, 0, 0, 1, 1,
0.9736856, -1.398848, 2.014457, 0, 0, 0, 1, 1,
0.9753463, -0.7367146, 1.997466, 0, 0, 0, 1, 1,
0.9773347, -0.2523338, 1.039122, 0, 0, 0, 1, 1,
0.9805188, -0.3162292, 2.557642, 0, 0, 0, 1, 1,
0.9833012, -0.1123601, 1.59666, 0, 0, 0, 1, 1,
0.9864464, 1.159026, 1.709154, 0, 0, 0, 1, 1,
0.9888928, 0.4254889, 0.598461, 1, 1, 1, 1, 1,
0.9988835, 0.1270055, 1.554839, 1, 1, 1, 1, 1,
1.00292, -1.698327, 3.471651, 1, 1, 1, 1, 1,
1.004, 0.6024079, 1.322593, 1, 1, 1, 1, 1,
1.004915, -0.01561014, 0.8447365, 1, 1, 1, 1, 1,
1.010089, 0.01799037, 1.407064, 1, 1, 1, 1, 1,
1.014417, 1.403101, 0.243041, 1, 1, 1, 1, 1,
1.018068, 0.6115826, 2.283609, 1, 1, 1, 1, 1,
1.018545, -0.9402909, 4.015134, 1, 1, 1, 1, 1,
1.04025, -1.200562, 2.875354, 1, 1, 1, 1, 1,
1.042455, 0.09523957, 1.222909, 1, 1, 1, 1, 1,
1.04264, -1.149087, 4.355599, 1, 1, 1, 1, 1,
1.050279, 2.019593, 2.843229, 1, 1, 1, 1, 1,
1.05058, -0.4194015, 1.242162, 1, 1, 1, 1, 1,
1.054696, -2.386936, 2.913127, 1, 1, 1, 1, 1,
1.069605, 0.6405501, 2.257955, 0, 0, 1, 1, 1,
1.075573, -0.4156565, 0.8583144, 1, 0, 0, 1, 1,
1.086973, -0.3041898, 0.41448, 1, 0, 0, 1, 1,
1.092153, -1.975904, 1.653696, 1, 0, 0, 1, 1,
1.099312, -0.2033163, 0.9250011, 1, 0, 0, 1, 1,
1.100449, 1.843314, 0.07284082, 1, 0, 0, 1, 1,
1.108962, 0.2482729, 1.500128, 0, 0, 0, 1, 1,
1.11148, -0.6053182, 1.606545, 0, 0, 0, 1, 1,
1.113492, -0.3664839, 2.070643, 0, 0, 0, 1, 1,
1.115092, 0.1094633, 1.853015, 0, 0, 0, 1, 1,
1.115595, -0.5790216, 1.269181, 0, 0, 0, 1, 1,
1.121163, 2.260505, 2.034428, 0, 0, 0, 1, 1,
1.12238, -1.727759, 3.645076, 0, 0, 0, 1, 1,
1.156127, 0.8872882, 1.998534, 1, 1, 1, 1, 1,
1.160306, -0.05435677, -0.5873297, 1, 1, 1, 1, 1,
1.16202, -2.536929, 2.457204, 1, 1, 1, 1, 1,
1.168456, 1.276885, -0.3827981, 1, 1, 1, 1, 1,
1.180377, 0.3329322, -0.294201, 1, 1, 1, 1, 1,
1.180719, -1.22365, 3.761254, 1, 1, 1, 1, 1,
1.191516, 0.0489539, 0.4851834, 1, 1, 1, 1, 1,
1.210256, -0.2786014, 1.688233, 1, 1, 1, 1, 1,
1.214836, -0.6299466, 3.648494, 1, 1, 1, 1, 1,
1.216716, 0.2238663, 0.8439276, 1, 1, 1, 1, 1,
1.218884, 0.3005275, 1.211676, 1, 1, 1, 1, 1,
1.223513, 0.1423237, 1.131835, 1, 1, 1, 1, 1,
1.227095, -0.7785766, 2.279504, 1, 1, 1, 1, 1,
1.229168, 0.0482662, 1.427466, 1, 1, 1, 1, 1,
1.263869, 1.651863, 2.312447, 1, 1, 1, 1, 1,
1.267086, -0.6624579, 2.173528, 0, 0, 1, 1, 1,
1.27122, 1.599165, 0.4631377, 1, 0, 0, 1, 1,
1.273658, 1.053118, 0.9701817, 1, 0, 0, 1, 1,
1.274052, 0.252395, 1.4256, 1, 0, 0, 1, 1,
1.299438, 0.4147722, 1.533661, 1, 0, 0, 1, 1,
1.304883, 0.4170487, 1.004564, 1, 0, 0, 1, 1,
1.310917, 1.13099, -0.1392587, 0, 0, 0, 1, 1,
1.313879, -0.141847, 0.5413474, 0, 0, 0, 1, 1,
1.316161, -0.2129104, 0.3376828, 0, 0, 0, 1, 1,
1.32297, -0.1603476, 1.651681, 0, 0, 0, 1, 1,
1.346125, 1.245489, 0.5705106, 0, 0, 0, 1, 1,
1.346213, -0.449371, 1.991823, 0, 0, 0, 1, 1,
1.349419, -0.4430729, 1.646209, 0, 0, 0, 1, 1,
1.353217, 0.2857915, 3.812002, 1, 1, 1, 1, 1,
1.363804, -0.5746213, 2.861088, 1, 1, 1, 1, 1,
1.36782, 1.644893, 0.2026246, 1, 1, 1, 1, 1,
1.368651, 1.052086, 0.9698953, 1, 1, 1, 1, 1,
1.374649, -1.485519, 2.922848, 1, 1, 1, 1, 1,
1.376237, 1.288866, -0.5129385, 1, 1, 1, 1, 1,
1.380839, -1.276936, 3.64485, 1, 1, 1, 1, 1,
1.388895, -0.3148764, 1.616037, 1, 1, 1, 1, 1,
1.401351, 0.7987111, 1.668787, 1, 1, 1, 1, 1,
1.416831, -0.08556981, 2.762661, 1, 1, 1, 1, 1,
1.420585, -0.4700516, 3.14083, 1, 1, 1, 1, 1,
1.444208, -0.2591424, 0.2287183, 1, 1, 1, 1, 1,
1.452242, -0.6879021, 2.524362, 1, 1, 1, 1, 1,
1.465502, 0.1626308, 1.106117, 1, 1, 1, 1, 1,
1.466746, -1.149344, 1.905568, 1, 1, 1, 1, 1,
1.467242, -1.263249, 4.000676, 0, 0, 1, 1, 1,
1.47553, 0.3752652, 1.846241, 1, 0, 0, 1, 1,
1.507274, -1.127276, 1.491043, 1, 0, 0, 1, 1,
1.508775, 1.098619, 0.06552915, 1, 0, 0, 1, 1,
1.51166, 0.7991679, 0.08757487, 1, 0, 0, 1, 1,
1.516454, 0.8961965, 1.486272, 1, 0, 0, 1, 1,
1.521246, 1.053121, 0.6148938, 0, 0, 0, 1, 1,
1.5238, -2.008056, 1.443579, 0, 0, 0, 1, 1,
1.532765, -0.1795571, 0.3854639, 0, 0, 0, 1, 1,
1.538453, -1.665355, 2.196858, 0, 0, 0, 1, 1,
1.541572, -1.212916, 2.05948, 0, 0, 0, 1, 1,
1.564848, -0.6246407, 2.69252, 0, 0, 0, 1, 1,
1.597544, -1.34308, 3.816363, 0, 0, 0, 1, 1,
1.608793, 0.1652111, 3.844872, 1, 1, 1, 1, 1,
1.609387, -0.6692842, 1.153843, 1, 1, 1, 1, 1,
1.632249, 0.449665, -0.1135885, 1, 1, 1, 1, 1,
1.632558, 0.5184759, 2.340862, 1, 1, 1, 1, 1,
1.633369, 0.9638478, 0.6423204, 1, 1, 1, 1, 1,
1.641619, -1.200662, 1.879182, 1, 1, 1, 1, 1,
1.651627, -1.038089, 2.69733, 1, 1, 1, 1, 1,
1.657155, 0.002078405, 0.8488097, 1, 1, 1, 1, 1,
1.674324, 0.00757247, 3.144655, 1, 1, 1, 1, 1,
1.675005, 0.9819397, 2.932032, 1, 1, 1, 1, 1,
1.69499, -1.052824, 2.545673, 1, 1, 1, 1, 1,
1.696566, 0.6841869, 1.546929, 1, 1, 1, 1, 1,
1.697982, 0.4302467, 0.9988611, 1, 1, 1, 1, 1,
1.71232, -0.316482, 1.395856, 1, 1, 1, 1, 1,
1.720442, 1.080388, 2.223646, 1, 1, 1, 1, 1,
1.729721, 1.507079, -0.1980464, 0, 0, 1, 1, 1,
1.730555, 1.743191, -0.5660926, 1, 0, 0, 1, 1,
1.732626, -1.459246, 1.311016, 1, 0, 0, 1, 1,
1.732821, -0.2944788, 2.659613, 1, 0, 0, 1, 1,
1.745512, -0.3837181, 1.289486, 1, 0, 0, 1, 1,
1.761692, -1.040256, 2.133735, 1, 0, 0, 1, 1,
1.763706, -0.5490696, 0.7234291, 0, 0, 0, 1, 1,
1.765635, 0.05369477, 1.013153, 0, 0, 0, 1, 1,
1.798422, -1.262966, 1.88658, 0, 0, 0, 1, 1,
1.803696, -0.003883032, -0.3694574, 0, 0, 0, 1, 1,
1.809316, 2.696023, 0.3095411, 0, 0, 0, 1, 1,
1.83312, 0.2145327, 2.301558, 0, 0, 0, 1, 1,
1.83879, 0.8728105, 1.766128, 0, 0, 0, 1, 1,
1.838873, 0.005525035, 1.483431, 1, 1, 1, 1, 1,
1.842597, -0.6614723, 1.278432, 1, 1, 1, 1, 1,
1.858969, -0.180066, 1.559488, 1, 1, 1, 1, 1,
1.866257, 0.5272093, 1.064315, 1, 1, 1, 1, 1,
1.870565, -1.053876, 2.850323, 1, 1, 1, 1, 1,
1.883217, -0.9633989, -0.2259927, 1, 1, 1, 1, 1,
1.893086, 1.919604, 0.6946455, 1, 1, 1, 1, 1,
1.894981, 2.090725, 1.134794, 1, 1, 1, 1, 1,
1.897562, 0.8543777, 0.8066528, 1, 1, 1, 1, 1,
1.897576, -0.7503006, 2.016854, 1, 1, 1, 1, 1,
1.906951, -0.2430816, 1.524178, 1, 1, 1, 1, 1,
1.918742, -0.08028366, 2.072608, 1, 1, 1, 1, 1,
1.961619, -0.4884816, 2.746915, 1, 1, 1, 1, 1,
1.985643, 0.08585885, 1.999787, 1, 1, 1, 1, 1,
2.070574, -0.05363678, 2.809814, 1, 1, 1, 1, 1,
2.08984, 1.324299, 0.7611579, 0, 0, 1, 1, 1,
2.094961, 1.769898, 1.066603, 1, 0, 0, 1, 1,
2.122187, 1.260814, 0.7502166, 1, 0, 0, 1, 1,
2.156131, 0.1382008, 1.040198, 1, 0, 0, 1, 1,
2.166931, 0.9102173, 1.094497, 1, 0, 0, 1, 1,
2.181399, -0.8420192, 1.349123, 1, 0, 0, 1, 1,
2.191647, 0.7006775, 1.626408, 0, 0, 0, 1, 1,
2.24128, 0.6926861, 2.414335, 0, 0, 0, 1, 1,
2.284143, 0.1097071, 1.000138, 0, 0, 0, 1, 1,
2.340128, -2.39831, 2.180926, 0, 0, 0, 1, 1,
2.386342, 1.328184, -0.5849473, 0, 0, 0, 1, 1,
2.423423, -2.034896, 1.505384, 0, 0, 0, 1, 1,
2.512872, -1.038195, 2.375912, 0, 0, 0, 1, 1,
2.534642, 0.9312059, 1.972019, 1, 1, 1, 1, 1,
2.578959, 1.065441, 1.967981, 1, 1, 1, 1, 1,
2.6079, 1.042103, 0.5190374, 1, 1, 1, 1, 1,
2.6297, 1.401351, -0.4879536, 1, 1, 1, 1, 1,
2.73203, 1.305057, 0.4540156, 1, 1, 1, 1, 1,
2.757033, -0.5337011, 0.9212303, 1, 1, 1, 1, 1,
3.013722, 1.834175, 0.3007478, 1, 1, 1, 1, 1
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
var radius = 8.958474;
var distance = 31.46626;
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
mvMatrix.translate( -0.1744826, 0.1008329, 0.1756983 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.46626);
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
