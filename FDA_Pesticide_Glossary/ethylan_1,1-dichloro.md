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
-3.125253, -0.1241234, -2.127673, 1, 0, 0, 1,
-2.927079, 1.088289, -0.5249383, 1, 0.007843138, 0, 1,
-2.901818, 0.932026, -2.550266, 1, 0.01176471, 0, 1,
-2.724742, -2.103516, -3.974218, 1, 0.01960784, 0, 1,
-2.627834, -0.6022831, -1.175205, 1, 0.02352941, 0, 1,
-2.605294, -0.6093416, -2.914371, 1, 0.03137255, 0, 1,
-2.60216, -0.1862072, -0.879815, 1, 0.03529412, 0, 1,
-2.550765, -0.007920285, -2.029444, 1, 0.04313726, 0, 1,
-2.506657, -1.623234, -0.991461, 1, 0.04705882, 0, 1,
-2.456608, -0.5041523, -1.066293, 1, 0.05490196, 0, 1,
-2.412189, -0.8335482, -1.301428, 1, 0.05882353, 0, 1,
-2.346725, -0.7956781, -1.90253, 1, 0.06666667, 0, 1,
-2.322004, 0.3193063, -0.3167503, 1, 0.07058824, 0, 1,
-2.186278, -0.638763, -3.109714, 1, 0.07843138, 0, 1,
-2.172841, -1.718989, -3.210832, 1, 0.08235294, 0, 1,
-2.165844, 0.3940874, -1.155445, 1, 0.09019608, 0, 1,
-2.164744, 0.3974025, -2.075632, 1, 0.09411765, 0, 1,
-2.113521, 1.107672, -1.770291, 1, 0.1019608, 0, 1,
-2.103191, -0.5568852, -1.884514, 1, 0.1098039, 0, 1,
-2.087692, 0.05718117, -2.136553, 1, 0.1137255, 0, 1,
-2.06964, -0.7631799, -2.436399, 1, 0.1215686, 0, 1,
-2.056619, 0.4521498, -1.211909, 1, 0.1254902, 0, 1,
-2.050153, 0.06026251, -0.0369282, 1, 0.1333333, 0, 1,
-1.993152, -1.165725, -2.492755, 1, 0.1372549, 0, 1,
-1.961339, -0.5943732, -3.33724, 1, 0.145098, 0, 1,
-1.937194, 0.5480901, 0.2437887, 1, 0.1490196, 0, 1,
-1.935435, -0.8015161, -1.201879, 1, 0.1568628, 0, 1,
-1.920209, -0.04530329, -1.207722, 1, 0.1607843, 0, 1,
-1.915552, 0.6523458, -2.159702, 1, 0.1686275, 0, 1,
-1.896132, -1.097728, -2.300393, 1, 0.172549, 0, 1,
-1.87211, 0.7764335, -1.732084, 1, 0.1803922, 0, 1,
-1.868587, -0.4232657, -1.681943, 1, 0.1843137, 0, 1,
-1.8601, -0.5704948, -2.09514, 1, 0.1921569, 0, 1,
-1.855075, -1.690339, -1.538631, 1, 0.1960784, 0, 1,
-1.846439, 1.629716, -2.060722, 1, 0.2039216, 0, 1,
-1.833868, -1.229706, -2.822751, 1, 0.2117647, 0, 1,
-1.823962, -0.1953087, -0.474613, 1, 0.2156863, 0, 1,
-1.782636, -1.156752, -1.024096, 1, 0.2235294, 0, 1,
-1.779776, 0.1699669, 1.722144, 1, 0.227451, 0, 1,
-1.759302, -0.162534, -1.965095, 1, 0.2352941, 0, 1,
-1.756262, 0.7013979, -0.8048837, 1, 0.2392157, 0, 1,
-1.755718, -0.1388961, -1.190939, 1, 0.2470588, 0, 1,
-1.746676, 0.8752639, -0.4250847, 1, 0.2509804, 0, 1,
-1.745452, 2.295344, -1.09341, 1, 0.2588235, 0, 1,
-1.711581, 2.069395, -0.3975981, 1, 0.2627451, 0, 1,
-1.705037, 0.5170373, -0.3698068, 1, 0.2705882, 0, 1,
-1.701453, 0.6540965, 0.2447782, 1, 0.2745098, 0, 1,
-1.694103, -1.105203, -2.636045, 1, 0.282353, 0, 1,
-1.691113, 2.172447, 1.622888, 1, 0.2862745, 0, 1,
-1.688679, -2.014119, -0.6742313, 1, 0.2941177, 0, 1,
-1.679526, 1.286577, 1.762437, 1, 0.3019608, 0, 1,
-1.66196, -0.9169801, -3.061472, 1, 0.3058824, 0, 1,
-1.656985, 0.3121217, -1.57033, 1, 0.3137255, 0, 1,
-1.640272, 2.089387, -1.879048, 1, 0.3176471, 0, 1,
-1.61308, -0.09772025, -3.057045, 1, 0.3254902, 0, 1,
-1.602629, 0.7511749, -3.038503, 1, 0.3294118, 0, 1,
-1.590668, 0.752461, -1.30621, 1, 0.3372549, 0, 1,
-1.586854, -0.06992538, -2.37045, 1, 0.3411765, 0, 1,
-1.586552, 0.8893645, -1.08668, 1, 0.3490196, 0, 1,
-1.580544, 0.7427589, -0.3652031, 1, 0.3529412, 0, 1,
-1.576129, 0.01060059, -1.937601, 1, 0.3607843, 0, 1,
-1.568417, 0.7082532, -0.4166034, 1, 0.3647059, 0, 1,
-1.566701, 0.4564027, -1.312156, 1, 0.372549, 0, 1,
-1.5538, -1.494791, -2.826899, 1, 0.3764706, 0, 1,
-1.552847, 0.1247157, -1.203938, 1, 0.3843137, 0, 1,
-1.543543, 1.648364, -0.3370665, 1, 0.3882353, 0, 1,
-1.540631, -1.14158, -2.929505, 1, 0.3960784, 0, 1,
-1.536484, -0.28121, -2.283216, 1, 0.4039216, 0, 1,
-1.528835, -0.2887156, -0.1148576, 1, 0.4078431, 0, 1,
-1.526982, 0.735482, -1.862824, 1, 0.4156863, 0, 1,
-1.524116, 1.732365, -0.9159365, 1, 0.4196078, 0, 1,
-1.49843, -0.1124803, -3.044236, 1, 0.427451, 0, 1,
-1.482751, 0.2747936, -1.697458, 1, 0.4313726, 0, 1,
-1.482744, 0.607253, -0.6368635, 1, 0.4392157, 0, 1,
-1.481672, -0.7630073, -0.8509037, 1, 0.4431373, 0, 1,
-1.47342, -0.3657975, -1.13166, 1, 0.4509804, 0, 1,
-1.473373, -0.03560563, -3.644057, 1, 0.454902, 0, 1,
-1.44905, 0.5592847, 0.2411053, 1, 0.4627451, 0, 1,
-1.445996, -0.3148573, -2.482129, 1, 0.4666667, 0, 1,
-1.443448, 0.9303436, -2.431936, 1, 0.4745098, 0, 1,
-1.438161, 0.26578, -1.101811, 1, 0.4784314, 0, 1,
-1.428013, -0.6087129, -2.729503, 1, 0.4862745, 0, 1,
-1.425285, -0.6784915, -2.358796, 1, 0.4901961, 0, 1,
-1.421852, -0.4563284, -2.348254, 1, 0.4980392, 0, 1,
-1.414948, -1.305453, -1.488694, 1, 0.5058824, 0, 1,
-1.403666, -1.130592, -3.954151, 1, 0.509804, 0, 1,
-1.380536, 1.838064, -2.793142, 1, 0.5176471, 0, 1,
-1.377133, 0.8841612, -0.655053, 1, 0.5215687, 0, 1,
-1.368245, 2.117155, 0.9020938, 1, 0.5294118, 0, 1,
-1.361955, 1.126951, 0.4250164, 1, 0.5333334, 0, 1,
-1.359498, 0.4344124, -1.851699, 1, 0.5411765, 0, 1,
-1.354451, 0.2095292, -2.614295, 1, 0.5450981, 0, 1,
-1.352026, -1.150443, -0.5863964, 1, 0.5529412, 0, 1,
-1.343264, -0.6075329, -1.857023, 1, 0.5568628, 0, 1,
-1.330387, 0.427151, -2.21248, 1, 0.5647059, 0, 1,
-1.326053, 0.7227688, -0.7205568, 1, 0.5686275, 0, 1,
-1.317498, 0.9656308, -1.264455, 1, 0.5764706, 0, 1,
-1.304947, 0.01741269, -0.6615469, 1, 0.5803922, 0, 1,
-1.304793, -0.4276893, -2.339712, 1, 0.5882353, 0, 1,
-1.303531, 0.7831239, -2.654462, 1, 0.5921569, 0, 1,
-1.299024, -0.1058477, -2.765699, 1, 0.6, 0, 1,
-1.292652, -0.3610381, -3.275318, 1, 0.6078432, 0, 1,
-1.270714, 1.990344, -2.092822, 1, 0.6117647, 0, 1,
-1.265768, -0.3731849, -2.925115, 1, 0.6196079, 0, 1,
-1.260008, -3.714399, -4.696971, 1, 0.6235294, 0, 1,
-1.249601, 1.133735, -0.5976657, 1, 0.6313726, 0, 1,
-1.245928, 0.2085024, -1.438437, 1, 0.6352941, 0, 1,
-1.245084, 0.3415152, -1.189703, 1, 0.6431373, 0, 1,
-1.239168, -0.06137868, -1.092852, 1, 0.6470588, 0, 1,
-1.23915, 0.7034246, -1.318603, 1, 0.654902, 0, 1,
-1.23502, -1.270859, -1.224197, 1, 0.6588235, 0, 1,
-1.23462, 1.080748, -1.481264, 1, 0.6666667, 0, 1,
-1.233438, 1.800071, 0.7189449, 1, 0.6705883, 0, 1,
-1.220306, -0.5100839, -1.876457, 1, 0.6784314, 0, 1,
-1.219171, 0.03904766, -1.993553, 1, 0.682353, 0, 1,
-1.217634, -1.116448, -3.41264, 1, 0.6901961, 0, 1,
-1.211433, 0.5015573, -0.6556283, 1, 0.6941177, 0, 1,
-1.204895, -2.096152, -1.93609, 1, 0.7019608, 0, 1,
-1.199979, -0.6351064, -2.179977, 1, 0.7098039, 0, 1,
-1.194763, 1.144177, -1.565485, 1, 0.7137255, 0, 1,
-1.189116, -1.685534, -2.888516, 1, 0.7215686, 0, 1,
-1.187717, 0.3347014, 0.3014909, 1, 0.7254902, 0, 1,
-1.18685, -0.3329778, -2.632771, 1, 0.7333333, 0, 1,
-1.179781, 1.97211, 0.3802077, 1, 0.7372549, 0, 1,
-1.173275, -0.5763763, 0.2714626, 1, 0.7450981, 0, 1,
-1.173204, 0.1634115, -2.02451, 1, 0.7490196, 0, 1,
-1.170954, 0.6088033, -1.310919, 1, 0.7568628, 0, 1,
-1.162563, -0.7738897, -3.560519, 1, 0.7607843, 0, 1,
-1.152815, -0.4250118, -1.79537, 1, 0.7686275, 0, 1,
-1.150797, 0.119056, -0.8551125, 1, 0.772549, 0, 1,
-1.149566, -0.8209036, -4.228646, 1, 0.7803922, 0, 1,
-1.148746, -1.90117, -1.863344, 1, 0.7843137, 0, 1,
-1.143829, -1.213526, -2.094726, 1, 0.7921569, 0, 1,
-1.137852, 1.099334, -2.25952, 1, 0.7960784, 0, 1,
-1.126514, 0.02551981, -2.748393, 1, 0.8039216, 0, 1,
-1.125954, 2.673559, 0.1560494, 1, 0.8117647, 0, 1,
-1.121992, 2.047072, 0.9146078, 1, 0.8156863, 0, 1,
-1.119565, 0.04557141, -1.191478, 1, 0.8235294, 0, 1,
-1.115523, -0.9954718, -2.455154, 1, 0.827451, 0, 1,
-1.113921, 1.620706, -0.4272101, 1, 0.8352941, 0, 1,
-1.112262, -1.008878, -2.256239, 1, 0.8392157, 0, 1,
-1.111579, 1.32458, -1.388713, 1, 0.8470588, 0, 1,
-1.103655, -1.553004, -2.669935, 1, 0.8509804, 0, 1,
-1.101967, 0.252191, 0.05298294, 1, 0.8588235, 0, 1,
-1.096469, -0.6086601, -2.711584, 1, 0.8627451, 0, 1,
-1.092772, 1.708069, 1.94645, 1, 0.8705882, 0, 1,
-1.090003, 1.03052, -0.4412505, 1, 0.8745098, 0, 1,
-1.087878, -0.106682, 0.6128117, 1, 0.8823529, 0, 1,
-1.085813, 1.035476, 0.3337943, 1, 0.8862745, 0, 1,
-1.084134, 1.070966, -0.4913713, 1, 0.8941177, 0, 1,
-1.081377, 1.513323, -1.08271, 1, 0.8980392, 0, 1,
-1.076993, -0.5078934, -1.40574, 1, 0.9058824, 0, 1,
-1.065875, -0.2299416, -0.4475426, 1, 0.9137255, 0, 1,
-1.056051, -0.498215, -1.612565, 1, 0.9176471, 0, 1,
-1.055463, 1.143387, -2.798129, 1, 0.9254902, 0, 1,
-1.051549, -1.4284, -1.257479, 1, 0.9294118, 0, 1,
-1.030624, 1.215619, 0.1987577, 1, 0.9372549, 0, 1,
-1.028071, 1.146838, -0.7550921, 1, 0.9411765, 0, 1,
-1.019511, 0.3372646, -1.010242, 1, 0.9490196, 0, 1,
-1.007951, -0.1705623, -0.2604542, 1, 0.9529412, 0, 1,
-1.00096, 1.394452, -0.4760982, 1, 0.9607843, 0, 1,
-0.9993822, -0.6130868, -0.08617482, 1, 0.9647059, 0, 1,
-0.9988542, -1.049376, -1.594624, 1, 0.972549, 0, 1,
-0.9968955, -2.037105, -2.989336, 1, 0.9764706, 0, 1,
-0.9920946, 1.05949, -1.508407, 1, 0.9843137, 0, 1,
-0.988195, 1.559593, -0.9503216, 1, 0.9882353, 0, 1,
-0.9845765, 1.033776, -1.084059, 1, 0.9960784, 0, 1,
-0.9830752, 0.4676816, -0.9358175, 0.9960784, 1, 0, 1,
-0.9708288, 0.04480048, -0.957727, 0.9921569, 1, 0, 1,
-0.9684855, 0.7518856, -0.8349056, 0.9843137, 1, 0, 1,
-0.9639074, -1.11911, -1.694076, 0.9803922, 1, 0, 1,
-0.957398, -0.1332542, -1.177016, 0.972549, 1, 0, 1,
-0.9500788, 0.3251634, 0.6357419, 0.9686275, 1, 0, 1,
-0.9466336, -0.06533164, -2.030592, 0.9607843, 1, 0, 1,
-0.9422274, 0.4856834, -1.18769, 0.9568627, 1, 0, 1,
-0.9395817, -0.8654718, -2.439548, 0.9490196, 1, 0, 1,
-0.9373412, -1.543382, -3.025152, 0.945098, 1, 0, 1,
-0.9373326, -0.4993382, -1.084985, 0.9372549, 1, 0, 1,
-0.9357679, 0.6789179, -2.103355, 0.9333333, 1, 0, 1,
-0.9324403, -0.4055827, -2.587378, 0.9254902, 1, 0, 1,
-0.9303005, 0.3798859, -2.916676, 0.9215686, 1, 0, 1,
-0.9255831, 0.928229, -0.5975873, 0.9137255, 1, 0, 1,
-0.9177654, -0.4862034, -1.929282, 0.9098039, 1, 0, 1,
-0.9109078, -0.6903928, -3.892092, 0.9019608, 1, 0, 1,
-0.9031478, -1.241277, -1.243972, 0.8941177, 1, 0, 1,
-0.902954, 0.5558322, 0.2667192, 0.8901961, 1, 0, 1,
-0.8999162, 0.3006804, -2.540093, 0.8823529, 1, 0, 1,
-0.8993785, 0.2708851, -2.276557, 0.8784314, 1, 0, 1,
-0.8982378, 0.1270851, -0.5001169, 0.8705882, 1, 0, 1,
-0.8929669, -0.4128474, -2.212965, 0.8666667, 1, 0, 1,
-0.8909891, -0.8352461, -2.392598, 0.8588235, 1, 0, 1,
-0.8908577, -0.96321, -3.821583, 0.854902, 1, 0, 1,
-0.8901343, -0.1504044, -1.330645, 0.8470588, 1, 0, 1,
-0.8899205, -0.905308, -1.122853, 0.8431373, 1, 0, 1,
-0.8858867, 0.4465078, -2.174946, 0.8352941, 1, 0, 1,
-0.8790527, -1.718931, -1.658273, 0.8313726, 1, 0, 1,
-0.8782366, -0.3801325, -2.352449, 0.8235294, 1, 0, 1,
-0.873501, 1.318779, 0.0518951, 0.8196079, 1, 0, 1,
-0.8621581, 0.05693109, -2.372201, 0.8117647, 1, 0, 1,
-0.8536595, -1.087349, -1.170551, 0.8078431, 1, 0, 1,
-0.8528317, 0.07610136, -0.8864771, 0.8, 1, 0, 1,
-0.8491578, 0.393148, -1.722375, 0.7921569, 1, 0, 1,
-0.8458986, 0.1630828, -2.320565, 0.7882353, 1, 0, 1,
-0.8441373, -0.4962209, -3.065232, 0.7803922, 1, 0, 1,
-0.8424705, -0.1242664, -3.94502, 0.7764706, 1, 0, 1,
-0.8410256, 1.339305, 0.1362631, 0.7686275, 1, 0, 1,
-0.8400655, 1.807289, 0.2945253, 0.7647059, 1, 0, 1,
-0.839556, 1.427762, -1.996331, 0.7568628, 1, 0, 1,
-0.8393875, -0.6999428, -3.148687, 0.7529412, 1, 0, 1,
-0.8392026, -1.124238, -2.753994, 0.7450981, 1, 0, 1,
-0.8319614, -1.739105, -3.71619, 0.7411765, 1, 0, 1,
-0.8302506, -0.3461668, -2.291564, 0.7333333, 1, 0, 1,
-0.8294663, 0.9876714, -0.4664866, 0.7294118, 1, 0, 1,
-0.8110413, -1.589532, -2.224041, 0.7215686, 1, 0, 1,
-0.8014777, 0.5819688, -0.2558307, 0.7176471, 1, 0, 1,
-0.7914013, 0.3295233, -0.5598665, 0.7098039, 1, 0, 1,
-0.7873522, -1.308903, -2.883736, 0.7058824, 1, 0, 1,
-0.7817275, 0.1228615, -1.798515, 0.6980392, 1, 0, 1,
-0.7816703, 1.202132, 0.2984162, 0.6901961, 1, 0, 1,
-0.7801718, 1.096159, 0.2796001, 0.6862745, 1, 0, 1,
-0.7779325, -0.5414402, -2.157941, 0.6784314, 1, 0, 1,
-0.7765817, -0.3515872, -2.854267, 0.6745098, 1, 0, 1,
-0.7701268, 0.7777234, 0.4859118, 0.6666667, 1, 0, 1,
-0.7694229, 0.9525554, 0.09394111, 0.6627451, 1, 0, 1,
-0.7688838, 1.415052, 1.868143, 0.654902, 1, 0, 1,
-0.7666517, 0.2405803, -0.156571, 0.6509804, 1, 0, 1,
-0.7648776, -0.4402804, -2.019823, 0.6431373, 1, 0, 1,
-0.7614279, 0.6385595, -0.2334657, 0.6392157, 1, 0, 1,
-0.7548507, 1.304938, -2.305415, 0.6313726, 1, 0, 1,
-0.7527339, -0.2525719, -1.685801, 0.627451, 1, 0, 1,
-0.7438154, 0.2137213, -1.216185, 0.6196079, 1, 0, 1,
-0.7384561, 0.9818782, 0.8525776, 0.6156863, 1, 0, 1,
-0.7342963, 2.305616, -1.013442, 0.6078432, 1, 0, 1,
-0.7297478, 1.924137, 0.9354282, 0.6039216, 1, 0, 1,
-0.729736, -0.7993364, -1.509671, 0.5960785, 1, 0, 1,
-0.7238538, 0.6297392, -1.003462, 0.5882353, 1, 0, 1,
-0.7205107, 0.4945621, -0.7475198, 0.5843138, 1, 0, 1,
-0.7196891, 0.1765889, -2.766237, 0.5764706, 1, 0, 1,
-0.7186264, 0.3418849, 0.003364739, 0.572549, 1, 0, 1,
-0.7130518, 0.439032, -1.035724, 0.5647059, 1, 0, 1,
-0.7101419, -0.9926621, -3.329327, 0.5607843, 1, 0, 1,
-0.7095788, 0.3468929, 0.3046544, 0.5529412, 1, 0, 1,
-0.7083883, -0.8194398, -1.197061, 0.5490196, 1, 0, 1,
-0.7077257, -0.7731229, -2.914885, 0.5411765, 1, 0, 1,
-0.7046406, 2.204396, -0.3552891, 0.5372549, 1, 0, 1,
-0.6981034, -0.8110907, -1.200207, 0.5294118, 1, 0, 1,
-0.6967286, -0.1811772, -2.500146, 0.5254902, 1, 0, 1,
-0.6906781, 0.1176168, -2.674839, 0.5176471, 1, 0, 1,
-0.6879129, -0.07589177, -0.94378, 0.5137255, 1, 0, 1,
-0.6811973, -0.09965557, -2.345017, 0.5058824, 1, 0, 1,
-0.6783604, 0.2483455, -0.3796512, 0.5019608, 1, 0, 1,
-0.6672508, -0.4110535, -2.120297, 0.4941176, 1, 0, 1,
-0.6632963, 0.05813223, -0.3264323, 0.4862745, 1, 0, 1,
-0.6627498, 0.5326876, 0.4566505, 0.4823529, 1, 0, 1,
-0.6616328, 1.08243, 0.5591708, 0.4745098, 1, 0, 1,
-0.6581144, 1.115047, -0.1178765, 0.4705882, 1, 0, 1,
-0.6524967, 0.6275703, -2.92362, 0.4627451, 1, 0, 1,
-0.649819, -0.1503089, -1.659081, 0.4588235, 1, 0, 1,
-0.645582, 1.356171, -2.425327, 0.4509804, 1, 0, 1,
-0.6453704, -0.5813009, -2.068376, 0.4470588, 1, 0, 1,
-0.6445023, 0.1472593, 0.4682075, 0.4392157, 1, 0, 1,
-0.6426197, 1.463867, -0.416573, 0.4352941, 1, 0, 1,
-0.6392177, 0.6736956, -1.193612, 0.427451, 1, 0, 1,
-0.6387672, -0.4929217, -2.667527, 0.4235294, 1, 0, 1,
-0.6352373, -2.29808, -2.492715, 0.4156863, 1, 0, 1,
-0.626461, -0.8628736, -3.218769, 0.4117647, 1, 0, 1,
-0.6255226, -0.5717815, -4.184666, 0.4039216, 1, 0, 1,
-0.6220036, 0.07038295, -0.3114572, 0.3960784, 1, 0, 1,
-0.6219641, -0.7327555, -3.107291, 0.3921569, 1, 0, 1,
-0.6199934, 0.6356372, -1.927056, 0.3843137, 1, 0, 1,
-0.6177974, -1.422073, -5.546791, 0.3803922, 1, 0, 1,
-0.6153611, 0.2142364, 1.304713, 0.372549, 1, 0, 1,
-0.6138431, -0.7808456, -0.4700168, 0.3686275, 1, 0, 1,
-0.6121872, 0.6714771, -0.6004046, 0.3607843, 1, 0, 1,
-0.6087745, 0.07243302, 0.6023633, 0.3568628, 1, 0, 1,
-0.6054283, 0.310032, -2.584435, 0.3490196, 1, 0, 1,
-0.5995011, -2.532028, -3.460302, 0.345098, 1, 0, 1,
-0.5941109, -1.42519, -1.783866, 0.3372549, 1, 0, 1,
-0.5816611, -0.6506615, -3.507678, 0.3333333, 1, 0, 1,
-0.5814812, -0.139651, -3.05376, 0.3254902, 1, 0, 1,
-0.5769983, 0.08276204, 0.1682309, 0.3215686, 1, 0, 1,
-0.5716521, -1.280908, -3.042478, 0.3137255, 1, 0, 1,
-0.5704769, -1.785172, -3.16627, 0.3098039, 1, 0, 1,
-0.5685288, -0.4618241, -3.251205, 0.3019608, 1, 0, 1,
-0.5677587, 1.266086, -0.4760467, 0.2941177, 1, 0, 1,
-0.5637116, 0.01803897, -1.154391, 0.2901961, 1, 0, 1,
-0.5546343, -1.358098, -1.993403, 0.282353, 1, 0, 1,
-0.55125, 0.6879942, 0.6580935, 0.2784314, 1, 0, 1,
-0.5511724, 2.383944, -1.041298, 0.2705882, 1, 0, 1,
-0.5478414, 0.6574982, -0.4048257, 0.2666667, 1, 0, 1,
-0.5382507, -1.166263, -3.474274, 0.2588235, 1, 0, 1,
-0.536549, -0.2323528, -2.301032, 0.254902, 1, 0, 1,
-0.5363838, 0.2726651, -1.299208, 0.2470588, 1, 0, 1,
-0.5341924, -0.1476151, -0.7203677, 0.2431373, 1, 0, 1,
-0.5335113, 2.226574, 0.2268394, 0.2352941, 1, 0, 1,
-0.5288769, 0.6492822, 0.2745605, 0.2313726, 1, 0, 1,
-0.5282261, 0.7470188, 0.6688657, 0.2235294, 1, 0, 1,
-0.5246023, 1.205047, 0.9867012, 0.2196078, 1, 0, 1,
-0.5231578, -0.3231292, -1.851533, 0.2117647, 1, 0, 1,
-0.5225731, -0.1230337, -2.91064, 0.2078431, 1, 0, 1,
-0.5222905, 0.3117757, -0.4526534, 0.2, 1, 0, 1,
-0.5222823, -0.8965445, -3.307223, 0.1921569, 1, 0, 1,
-0.5207329, -0.7493774, -2.476471, 0.1882353, 1, 0, 1,
-0.5206032, -0.09555528, -2.593106, 0.1803922, 1, 0, 1,
-0.5188062, 1.097486, -0.4596454, 0.1764706, 1, 0, 1,
-0.5172367, 1.236647, 0.294825, 0.1686275, 1, 0, 1,
-0.5165151, -0.7090332, -3.709003, 0.1647059, 1, 0, 1,
-0.5160369, -1.129499, -4.164867, 0.1568628, 1, 0, 1,
-0.5138384, -0.3279667, -1.168901, 0.1529412, 1, 0, 1,
-0.5138081, -1.540298, -1.920986, 0.145098, 1, 0, 1,
-0.5075234, 0.6800009, -1.616446, 0.1411765, 1, 0, 1,
-0.5056509, -0.7705219, -2.416025, 0.1333333, 1, 0, 1,
-0.4996957, -0.4913273, -1.901079, 0.1294118, 1, 0, 1,
-0.499029, -1.456391, -2.950341, 0.1215686, 1, 0, 1,
-0.4891645, -0.8852602, -1.998311, 0.1176471, 1, 0, 1,
-0.4884513, -0.03380728, -2.198852, 0.1098039, 1, 0, 1,
-0.4881508, 0.36992, -1.004994, 0.1058824, 1, 0, 1,
-0.4853899, -0.3975974, -2.432778, 0.09803922, 1, 0, 1,
-0.4821934, -0.71592, -2.893275, 0.09019608, 1, 0, 1,
-0.4809628, -1.096717, -3.362343, 0.08627451, 1, 0, 1,
-0.4753025, -0.6493757, -2.508764, 0.07843138, 1, 0, 1,
-0.4687305, 0.6181934, -1.410484, 0.07450981, 1, 0, 1,
-0.4677333, -0.5884028, -2.014514, 0.06666667, 1, 0, 1,
-0.4672473, -0.400909, -2.745209, 0.0627451, 1, 0, 1,
-0.4661503, -0.2878882, -2.543823, 0.05490196, 1, 0, 1,
-0.4595399, 0.5711626, -0.2157532, 0.05098039, 1, 0, 1,
-0.4588035, -1.119051, -2.281639, 0.04313726, 1, 0, 1,
-0.443638, 1.312971, -1.10971, 0.03921569, 1, 0, 1,
-0.4416435, 1.015477, -2.93012, 0.03137255, 1, 0, 1,
-0.4393511, 0.158158, 0.2549762, 0.02745098, 1, 0, 1,
-0.4365993, 0.8536103, -0.3458012, 0.01960784, 1, 0, 1,
-0.4358764, -0.2739777, -2.29559, 0.01568628, 1, 0, 1,
-0.4340132, 0.6077781, -0.612459, 0.007843138, 1, 0, 1,
-0.4337116, 0.603996, 0.4998263, 0.003921569, 1, 0, 1,
-0.4328259, -0.5261075, -2.829422, 0, 1, 0.003921569, 1,
-0.4289325, -0.02437744, -2.139695, 0, 1, 0.01176471, 1,
-0.4190603, 0.4186985, -1.088807, 0, 1, 0.01568628, 1,
-0.4178237, 0.6451174, -0.6132882, 0, 1, 0.02352941, 1,
-0.4163499, 0.9830689, -2.133117, 0, 1, 0.02745098, 1,
-0.4118755, -0.1313719, -3.309592, 0, 1, 0.03529412, 1,
-0.4076681, 1.817791, 0.9187773, 0, 1, 0.03921569, 1,
-0.4045947, -0.1750232, -4.075561, 0, 1, 0.04705882, 1,
-0.3959361, -0.6121345, -2.904934, 0, 1, 0.05098039, 1,
-0.3947662, -0.1207467, -1.292939, 0, 1, 0.05882353, 1,
-0.3936988, 1.042718, 0.4790647, 0, 1, 0.0627451, 1,
-0.3920164, -1.825842, -3.683037, 0, 1, 0.07058824, 1,
-0.3800271, 0.1160979, -0.6500643, 0, 1, 0.07450981, 1,
-0.3792602, -0.9611771, -2.694263, 0, 1, 0.08235294, 1,
-0.3770259, 0.8082441, 1.507216, 0, 1, 0.08627451, 1,
-0.3760365, -0.6665673, -2.968204, 0, 1, 0.09411765, 1,
-0.3729447, 0.6896465, 1.366236, 0, 1, 0.1019608, 1,
-0.3717803, 0.7909074, -1.169401, 0, 1, 0.1058824, 1,
-0.3642654, 1.335551, -0.6794443, 0, 1, 0.1137255, 1,
-0.3637856, -0.2092537, -2.939155, 0, 1, 0.1176471, 1,
-0.3608479, 0.05563268, -2.634134, 0, 1, 0.1254902, 1,
-0.3491938, 1.180125, 0.2515216, 0, 1, 0.1294118, 1,
-0.3489808, -1.153293, -3.723426, 0, 1, 0.1372549, 1,
-0.3449632, 0.6318284, -0.4420075, 0, 1, 0.1411765, 1,
-0.3439812, -0.7875233, -0.7107273, 0, 1, 0.1490196, 1,
-0.3370876, 1.620637, -2.275089, 0, 1, 0.1529412, 1,
-0.3363293, 0.9679966, -1.098597, 0, 1, 0.1607843, 1,
-0.3326657, 0.179267, 0.8132892, 0, 1, 0.1647059, 1,
-0.3252714, -1.33383, -2.036832, 0, 1, 0.172549, 1,
-0.3215482, -0.7160029, -2.935028, 0, 1, 0.1764706, 1,
-0.3180068, -0.04498528, -3.365868, 0, 1, 0.1843137, 1,
-0.3165769, -0.8898971, -2.188404, 0, 1, 0.1882353, 1,
-0.3109021, -0.6711498, -1.958676, 0, 1, 0.1960784, 1,
-0.3105458, -0.09013772, -1.278477, 0, 1, 0.2039216, 1,
-0.3104753, -1.280813, -4.31744, 0, 1, 0.2078431, 1,
-0.3049766, -1.233157, -1.496301, 0, 1, 0.2156863, 1,
-0.2984234, -1.04936, -2.12869, 0, 1, 0.2196078, 1,
-0.2972513, 0.572359, -1.652835, 0, 1, 0.227451, 1,
-0.2937092, -0.6419325, -2.071962, 0, 1, 0.2313726, 1,
-0.2895741, 0.1811142, 0.7814268, 0, 1, 0.2392157, 1,
-0.2866338, 0.008140939, -1.611671, 0, 1, 0.2431373, 1,
-0.2826269, -0.2432483, -2.161659, 0, 1, 0.2509804, 1,
-0.2789969, -1.087369, -3.676624, 0, 1, 0.254902, 1,
-0.2766436, -1.441637, -2.61105, 0, 1, 0.2627451, 1,
-0.270959, 0.8356327, -1.252839, 0, 1, 0.2666667, 1,
-0.2693694, 0.4485079, 1.531788, 0, 1, 0.2745098, 1,
-0.2666085, -0.3088891, -3.551478, 0, 1, 0.2784314, 1,
-0.2643155, -0.7049229, -3.131782, 0, 1, 0.2862745, 1,
-0.2636913, -0.6779806, -4.526575, 0, 1, 0.2901961, 1,
-0.2618192, 0.4407813, 0.9032564, 0, 1, 0.2980392, 1,
-0.2609531, 0.8500614, -0.1328492, 0, 1, 0.3058824, 1,
-0.2606549, -0.01499793, -2.870353, 0, 1, 0.3098039, 1,
-0.2595227, -0.4473479, -2.446685, 0, 1, 0.3176471, 1,
-0.2552165, -0.1407149, -2.038245, 0, 1, 0.3215686, 1,
-0.2526772, 0.7176871, 0.196038, 0, 1, 0.3294118, 1,
-0.2525462, 0.6205519, -1.220973, 0, 1, 0.3333333, 1,
-0.2521701, -0.9501289, -3.433311, 0, 1, 0.3411765, 1,
-0.2487281, 0.02597176, -1.160041, 0, 1, 0.345098, 1,
-0.2474431, -1.228678, -3.075118, 0, 1, 0.3529412, 1,
-0.2437002, 0.3441812, -1.00768, 0, 1, 0.3568628, 1,
-0.242716, -0.8821142, -3.500169, 0, 1, 0.3647059, 1,
-0.2371373, 0.02811744, -3.073186, 0, 1, 0.3686275, 1,
-0.2312723, -0.3897953, -4.75772, 0, 1, 0.3764706, 1,
-0.2219067, 1.14012, -0.419338, 0, 1, 0.3803922, 1,
-0.2215576, 2.106955, 1.334318, 0, 1, 0.3882353, 1,
-0.2212661, -1.094389, -3.17903, 0, 1, 0.3921569, 1,
-0.217977, 2.386989, 0.1195227, 0, 1, 0.4, 1,
-0.2135924, 1.215839, 1.417345, 0, 1, 0.4078431, 1,
-0.2125387, -1.231148, -3.343074, 0, 1, 0.4117647, 1,
-0.2120451, 1.263922, -0.3094137, 0, 1, 0.4196078, 1,
-0.2113057, 1.478858, 1.058587, 0, 1, 0.4235294, 1,
-0.2090299, 0.5290662, 0.3252755, 0, 1, 0.4313726, 1,
-0.2086204, -0.7083245, -2.711821, 0, 1, 0.4352941, 1,
-0.2083978, -0.7679707, -2.672498, 0, 1, 0.4431373, 1,
-0.201285, -0.6026469, -2.052589, 0, 1, 0.4470588, 1,
-0.2004631, -0.4802592, -0.7893798, 0, 1, 0.454902, 1,
-0.1959889, 1.946777, 0.2482128, 0, 1, 0.4588235, 1,
-0.1878183, -1.081648, -3.155896, 0, 1, 0.4666667, 1,
-0.1841616, -0.5844154, -1.493259, 0, 1, 0.4705882, 1,
-0.1841383, -0.09617797, -2.117102, 0, 1, 0.4784314, 1,
-0.1837708, -0.2085507, -1.615412, 0, 1, 0.4823529, 1,
-0.1810752, 1.995195, -2.412203, 0, 1, 0.4901961, 1,
-0.1773904, 2.898957, -0.6439088, 0, 1, 0.4941176, 1,
-0.1747359, 0.5997976, -0.8313025, 0, 1, 0.5019608, 1,
-0.1728022, -0.7768364, -2.98357, 0, 1, 0.509804, 1,
-0.1717209, 0.7686805, 0.1181666, 0, 1, 0.5137255, 1,
-0.1691405, 0.9200884, -0.4688082, 0, 1, 0.5215687, 1,
-0.1537794, 1.458676, -1.275234, 0, 1, 0.5254902, 1,
-0.1505405, -0.08834633, -0.9090389, 0, 1, 0.5333334, 1,
-0.149197, 0.8649201, 0.5338566, 0, 1, 0.5372549, 1,
-0.1485149, -2.923813, -3.067738, 0, 1, 0.5450981, 1,
-0.1471726, 1.321765, -0.6302236, 0, 1, 0.5490196, 1,
-0.1466852, -1.021991, -2.167071, 0, 1, 0.5568628, 1,
-0.1452852, 0.4674727, -0.2942645, 0, 1, 0.5607843, 1,
-0.1443492, -0.4382839, -3.016815, 0, 1, 0.5686275, 1,
-0.1434192, 0.4545129, -0.9570417, 0, 1, 0.572549, 1,
-0.1427783, -0.4909469, -3.406491, 0, 1, 0.5803922, 1,
-0.1372901, 0.5372581, 0.7647763, 0, 1, 0.5843138, 1,
-0.1370761, -0.7180997, -1.606195, 0, 1, 0.5921569, 1,
-0.1308565, -0.6247085, -2.801561, 0, 1, 0.5960785, 1,
-0.1263781, 0.4981202, -0.5052714, 0, 1, 0.6039216, 1,
-0.1240332, -0.5675007, -3.340795, 0, 1, 0.6117647, 1,
-0.1212029, 0.5364657, -0.6872056, 0, 1, 0.6156863, 1,
-0.1191782, 0.5544258, -1.003243, 0, 1, 0.6235294, 1,
-0.1188035, 0.5169284, 0.64641, 0, 1, 0.627451, 1,
-0.1176012, -0.674533, -2.841043, 0, 1, 0.6352941, 1,
-0.1173385, -1.694488, -4.018625, 0, 1, 0.6392157, 1,
-0.1144783, -0.1048394, -0.95789, 0, 1, 0.6470588, 1,
-0.1126837, 1.896358, -0.5042926, 0, 1, 0.6509804, 1,
-0.1123914, 0.4044035, 0.7170777, 0, 1, 0.6588235, 1,
-0.1015238, 0.2968197, -0.9327849, 0, 1, 0.6627451, 1,
-0.09961529, 1.547659, -0.3713073, 0, 1, 0.6705883, 1,
-0.09387223, -0.376772, -3.285457, 0, 1, 0.6745098, 1,
-0.09027416, -0.0743608, -2.80877, 0, 1, 0.682353, 1,
-0.08783303, 0.7026379, 1.090259, 0, 1, 0.6862745, 1,
-0.08746772, -2.557408, -3.677712, 0, 1, 0.6941177, 1,
-0.08661557, 0.4250172, 0.5879671, 0, 1, 0.7019608, 1,
-0.084529, 0.8187256, -1.470497, 0, 1, 0.7058824, 1,
-0.0837149, 0.7604888, -0.8620679, 0, 1, 0.7137255, 1,
-0.08238103, -1.176792, -3.906111, 0, 1, 0.7176471, 1,
-0.08082921, -1.149488, -1.959127, 0, 1, 0.7254902, 1,
-0.0807141, 0.4945555, -0.9055636, 0, 1, 0.7294118, 1,
-0.08034211, 0.9511145, 0.9032407, 0, 1, 0.7372549, 1,
-0.07522534, -0.6028762, -3.544878, 0, 1, 0.7411765, 1,
-0.07516331, 0.06137258, -0.7041101, 0, 1, 0.7490196, 1,
-0.07495606, -1.627434, -3.642534, 0, 1, 0.7529412, 1,
-0.07385041, 1.722256, 2.477366, 0, 1, 0.7607843, 1,
-0.07350461, 0.2185407, 0.2957695, 0, 1, 0.7647059, 1,
-0.07126984, 0.4370931, 0.3665276, 0, 1, 0.772549, 1,
-0.07070255, -0.3427823, -1.65699, 0, 1, 0.7764706, 1,
-0.06963699, -1.494202, -4.163157, 0, 1, 0.7843137, 1,
-0.06960899, -0.897635, -2.885298, 0, 1, 0.7882353, 1,
-0.06868523, 1.619407, 0.0348809, 0, 1, 0.7960784, 1,
-0.06850134, 1.46777, -0.07973567, 0, 1, 0.8039216, 1,
-0.06555126, -0.4863872, -3.950139, 0, 1, 0.8078431, 1,
-0.06490097, 2.184977, -0.2823112, 0, 1, 0.8156863, 1,
-0.06197776, -1.168093, -3.844504, 0, 1, 0.8196079, 1,
-0.06151111, 0.454946, 1.531584, 0, 1, 0.827451, 1,
-0.05685345, 0.47785, -0.4293643, 0, 1, 0.8313726, 1,
-0.05283054, -1.605005, -2.167221, 0, 1, 0.8392157, 1,
-0.05254745, 0.4858408, -0.6454974, 0, 1, 0.8431373, 1,
-0.05209177, -1.967868, -3.069635, 0, 1, 0.8509804, 1,
-0.05203566, 0.03077444, -3.729388, 0, 1, 0.854902, 1,
-0.05197902, -0.05655672, -2.026311, 0, 1, 0.8627451, 1,
-0.05088366, 0.7477238, -0.7674477, 0, 1, 0.8666667, 1,
-0.04263634, 1.270077, -0.245221, 0, 1, 0.8745098, 1,
-0.0421681, 0.9908712, 0.5716383, 0, 1, 0.8784314, 1,
-0.03888258, -1.072368, -3.121102, 0, 1, 0.8862745, 1,
-0.03702789, -0.4010898, -1.975404, 0, 1, 0.8901961, 1,
-0.03491954, 1.721331, 0.8775529, 0, 1, 0.8980392, 1,
-0.03316668, 0.9493768, 0.8869417, 0, 1, 0.9058824, 1,
-0.02876596, 1.880745, 0.8609998, 0, 1, 0.9098039, 1,
-0.02711793, 0.3216927, -1.427955, 0, 1, 0.9176471, 1,
-0.02694173, -0.193933, -3.574692, 0, 1, 0.9215686, 1,
-0.02642207, -1.261109, -1.368341, 0, 1, 0.9294118, 1,
-0.02131736, -0.359068, -5.876519, 0, 1, 0.9333333, 1,
-0.02043833, 1.13284, 0.8585935, 0, 1, 0.9411765, 1,
-0.0175566, -2.258319, -3.61982, 0, 1, 0.945098, 1,
-0.01487533, 0.4992501, -0.7761596, 0, 1, 0.9529412, 1,
-0.01459022, 0.1587006, 1.144986, 0, 1, 0.9568627, 1,
-0.01410844, -1.510842, -5.167114, 0, 1, 0.9647059, 1,
-0.01132196, 0.4080713, 0.1590953, 0, 1, 0.9686275, 1,
-0.009832574, -0.8947695, -2.370118, 0, 1, 0.9764706, 1,
-0.00809717, -0.6045435, -3.449732, 0, 1, 0.9803922, 1,
-0.007640563, 0.8243765, -0.4279007, 0, 1, 0.9882353, 1,
-0.004720903, 1.463406, -1.672786, 0, 1, 0.9921569, 1,
-0.002880477, 1.073306, -0.4001548, 0, 1, 1, 1,
0.004940546, 1.626624, 0.860711, 0, 0.9921569, 1, 1,
0.00632, 0.5160522, 0.237696, 0, 0.9882353, 1, 1,
0.007213881, -0.6782408, 2.921809, 0, 0.9803922, 1, 1,
0.008440738, -0.2224901, 2.822975, 0, 0.9764706, 1, 1,
0.008447851, 0.9221138, -0.05136212, 0, 0.9686275, 1, 1,
0.009000023, -0.7682216, 3.53681, 0, 0.9647059, 1, 1,
0.01018164, -0.1704949, 3.361931, 0, 0.9568627, 1, 1,
0.01135302, 0.0426909, -0.1906152, 0, 0.9529412, 1, 1,
0.01201212, 0.1427413, 0.3949508, 0, 0.945098, 1, 1,
0.01610586, -0.165207, 2.797992, 0, 0.9411765, 1, 1,
0.0171337, -0.9053756, 3.649955, 0, 0.9333333, 1, 1,
0.01763402, -0.01091117, 3.82069, 0, 0.9294118, 1, 1,
0.02229905, -0.8811008, 3.210835, 0, 0.9215686, 1, 1,
0.02333408, -1.295892, 2.414838, 0, 0.9176471, 1, 1,
0.02356311, -1.752645, 3.525432, 0, 0.9098039, 1, 1,
0.02554101, -1.616243, 2.156047, 0, 0.9058824, 1, 1,
0.02710407, -1.651811, 3.876338, 0, 0.8980392, 1, 1,
0.03107282, -2.023349, 2.490633, 0, 0.8901961, 1, 1,
0.03138866, -0.5412306, 3.285206, 0, 0.8862745, 1, 1,
0.03229565, 0.7582617, -0.4139189, 0, 0.8784314, 1, 1,
0.03252181, 1.052658, 0.5467741, 0, 0.8745098, 1, 1,
0.03575405, 0.7923257, 1.643193, 0, 0.8666667, 1, 1,
0.03914229, 1.221782, 0.3495236, 0, 0.8627451, 1, 1,
0.03932102, 0.9115608, 0.217896, 0, 0.854902, 1, 1,
0.04014711, 0.2761454, -0.0621621, 0, 0.8509804, 1, 1,
0.04506948, -0.5579996, 4.84036, 0, 0.8431373, 1, 1,
0.05154821, 0.2333587, 1.662888, 0, 0.8392157, 1, 1,
0.0568439, 0.3659164, 0.5030112, 0, 0.8313726, 1, 1,
0.05771462, 1.440556, -0.8701878, 0, 0.827451, 1, 1,
0.05867046, -1.796232, 4.384205, 0, 0.8196079, 1, 1,
0.0609359, -1.279269, 2.615552, 0, 0.8156863, 1, 1,
0.06212689, 0.1896998, 0.6873895, 0, 0.8078431, 1, 1,
0.06238911, 1.356513, -0.8569167, 0, 0.8039216, 1, 1,
0.06447584, 1.000438, -0.8363792, 0, 0.7960784, 1, 1,
0.06580483, -0.9710495, 2.594235, 0, 0.7882353, 1, 1,
0.07077783, 0.7845293, 0.744122, 0, 0.7843137, 1, 1,
0.07182533, 0.3822245, 0.06876722, 0, 0.7764706, 1, 1,
0.07221483, -0.300162, 4.514606, 0, 0.772549, 1, 1,
0.07292117, -0.2143788, 1.897029, 0, 0.7647059, 1, 1,
0.07296461, -0.9635153, 1.757793, 0, 0.7607843, 1, 1,
0.07432014, 0.840504, 2.930976, 0, 0.7529412, 1, 1,
0.07915269, -1.393577, 2.32011, 0, 0.7490196, 1, 1,
0.08060469, -0.8949472, 3.884268, 0, 0.7411765, 1, 1,
0.08344353, 0.553544, 1.633915, 0, 0.7372549, 1, 1,
0.08741271, 0.6933925, -0.2317913, 0, 0.7294118, 1, 1,
0.09043606, 1.211766, -0.4560381, 0, 0.7254902, 1, 1,
0.09065624, -2.155104, 1.87533, 0, 0.7176471, 1, 1,
0.09084572, 0.01241883, 1.822184, 0, 0.7137255, 1, 1,
0.09909255, -0.7595696, 2.641775, 0, 0.7058824, 1, 1,
0.1044826, -0.2466617, 1.979643, 0, 0.6980392, 1, 1,
0.107245, -0.1709968, 2.329309, 0, 0.6941177, 1, 1,
0.1084488, 0.3281159, -0.8779978, 0, 0.6862745, 1, 1,
0.1085458, 1.464517, 0.571872, 0, 0.682353, 1, 1,
0.1121366, 2.359012, -1.441293, 0, 0.6745098, 1, 1,
0.1153205, -0.854934, 3.411844, 0, 0.6705883, 1, 1,
0.1180228, 0.8285301, 0.4527351, 0, 0.6627451, 1, 1,
0.1185984, -0.005858503, 3.378688, 0, 0.6588235, 1, 1,
0.1222957, -1.521451, 2.897069, 0, 0.6509804, 1, 1,
0.1236609, -0.6355854, 2.757419, 0, 0.6470588, 1, 1,
0.1258228, 0.01997454, -1.048462, 0, 0.6392157, 1, 1,
0.1263476, 1.137598, 0.3667368, 0, 0.6352941, 1, 1,
0.1273976, 1.164723, 0.1101265, 0, 0.627451, 1, 1,
0.1274109, 1.302089, -1.342365, 0, 0.6235294, 1, 1,
0.1303001, 0.5204314, 1.332476, 0, 0.6156863, 1, 1,
0.1303199, -0.1226148, 0.5694842, 0, 0.6117647, 1, 1,
0.1323454, -1.623782, 2.689241, 0, 0.6039216, 1, 1,
0.1351551, -0.4743055, 2.987789, 0, 0.5960785, 1, 1,
0.1367707, -0.1044858, 1.651716, 0, 0.5921569, 1, 1,
0.1426634, -0.5808455, 4.389078, 0, 0.5843138, 1, 1,
0.1471783, -0.3617156, 1.189173, 0, 0.5803922, 1, 1,
0.1536579, 0.5785, -1.02259, 0, 0.572549, 1, 1,
0.1541787, -0.9054498, 3.400733, 0, 0.5686275, 1, 1,
0.1561226, 1.252542, 0.8470012, 0, 0.5607843, 1, 1,
0.157347, -1.51921, 2.857998, 0, 0.5568628, 1, 1,
0.1585828, 1.590674, -0.1043277, 0, 0.5490196, 1, 1,
0.1622556, 0.6233676, -1.278133, 0, 0.5450981, 1, 1,
0.1731305, -0.9407198, 3.433459, 0, 0.5372549, 1, 1,
0.1770362, -0.4573784, 2.401547, 0, 0.5333334, 1, 1,
0.1777153, -0.2626856, 3.013371, 0, 0.5254902, 1, 1,
0.1791958, 0.8990809, -0.2194941, 0, 0.5215687, 1, 1,
0.1825283, -0.9170347, 3.170676, 0, 0.5137255, 1, 1,
0.1829605, -0.6029335, 2.964112, 0, 0.509804, 1, 1,
0.1835478, 1.031464, 0.1152471, 0, 0.5019608, 1, 1,
0.1848033, -1.382516, 4.550123, 0, 0.4941176, 1, 1,
0.1851408, -1.278332, 2.310183, 0, 0.4901961, 1, 1,
0.1876114, 0.03259969, 1.346041, 0, 0.4823529, 1, 1,
0.1905109, -0.7276168, 3.767725, 0, 0.4784314, 1, 1,
0.1969808, -0.6609091, 2.326592, 0, 0.4705882, 1, 1,
0.1998241, 0.7071112, -0.2683769, 0, 0.4666667, 1, 1,
0.2009103, -0.1243131, 2.769156, 0, 0.4588235, 1, 1,
0.2017182, 0.5608639, -0.05507, 0, 0.454902, 1, 1,
0.2056509, 1.333894, -0.2518234, 0, 0.4470588, 1, 1,
0.2111099, -0.4950993, 2.296037, 0, 0.4431373, 1, 1,
0.2123411, -1.020053, 1.924676, 0, 0.4352941, 1, 1,
0.2189182, 0.3446763, 0.04755894, 0, 0.4313726, 1, 1,
0.2200368, -0.3761768, 2.258451, 0, 0.4235294, 1, 1,
0.222604, -0.4687172, 1.435025, 0, 0.4196078, 1, 1,
0.2226607, 0.7331764, 1.622715, 0, 0.4117647, 1, 1,
0.2235551, -1.288818, 4.431286, 0, 0.4078431, 1, 1,
0.2241708, -0.4838798, 1.084741, 0, 0.4, 1, 1,
0.2304382, 0.6091464, 1.166616, 0, 0.3921569, 1, 1,
0.2336446, -1.033112, 0.4523109, 0, 0.3882353, 1, 1,
0.2348319, -0.5564136, 2.189578, 0, 0.3803922, 1, 1,
0.2455776, -1.170202, 1.639168, 0, 0.3764706, 1, 1,
0.2473839, 0.6550322, 0.2578681, 0, 0.3686275, 1, 1,
0.2474488, -2.977554, 4.73076, 0, 0.3647059, 1, 1,
0.2541172, -0.623225, 2.013536, 0, 0.3568628, 1, 1,
0.2575027, 0.3075602, 0.08965726, 0, 0.3529412, 1, 1,
0.2575239, 0.1130163, 0.9678904, 0, 0.345098, 1, 1,
0.259178, -2.767869, 3.74367, 0, 0.3411765, 1, 1,
0.2618897, -0.8897984, 4.758243, 0, 0.3333333, 1, 1,
0.2624808, -2.373771, 3.747549, 0, 0.3294118, 1, 1,
0.2636374, 0.2921509, 0.08314069, 0, 0.3215686, 1, 1,
0.2658153, 1.413771, -0.1822907, 0, 0.3176471, 1, 1,
0.2677031, -1.254886, 1.780778, 0, 0.3098039, 1, 1,
0.2687472, -0.150768, 3.150157, 0, 0.3058824, 1, 1,
0.2690204, 1.595924, 0.1943606, 0, 0.2980392, 1, 1,
0.2690375, -2.915385, 3.043452, 0, 0.2901961, 1, 1,
0.2747903, 0.7404975, 2.207797, 0, 0.2862745, 1, 1,
0.275454, -1.571276, 3.752414, 0, 0.2784314, 1, 1,
0.2777348, -3.073807, 3.681142, 0, 0.2745098, 1, 1,
0.2808428, -1.050718, 4.029235, 0, 0.2666667, 1, 1,
0.2940313, 0.1972631, -1.430186, 0, 0.2627451, 1, 1,
0.2957806, 2.546909, -0.4416059, 0, 0.254902, 1, 1,
0.2960986, -2.584885, 4.221303, 0, 0.2509804, 1, 1,
0.300217, 1.347245, 1.330976, 0, 0.2431373, 1, 1,
0.3019437, -0.8435773, 2.455948, 0, 0.2392157, 1, 1,
0.303658, 0.9258661, -1.502412, 0, 0.2313726, 1, 1,
0.3071401, -0.2844732, 1.848623, 0, 0.227451, 1, 1,
0.3082, -0.244387, 0.8407674, 0, 0.2196078, 1, 1,
0.3153651, 0.2501291, 1.74209, 0, 0.2156863, 1, 1,
0.3169285, 1.115561, 1.11058, 0, 0.2078431, 1, 1,
0.3177883, -0.2850102, 2.18897, 0, 0.2039216, 1, 1,
0.3210865, 0.6936089, 2.106768, 0, 0.1960784, 1, 1,
0.3249537, 0.2298006, 0.4031235, 0, 0.1882353, 1, 1,
0.3302947, -0.591639, 2.553868, 0, 0.1843137, 1, 1,
0.3322682, 0.0643191, 1.306346, 0, 0.1764706, 1, 1,
0.3336917, -1.981115, 5.047335, 0, 0.172549, 1, 1,
0.3342907, -2.226595, 2.342558, 0, 0.1647059, 1, 1,
0.3482774, 0.7903259, -0.7241111, 0, 0.1607843, 1, 1,
0.3539037, 0.3499137, 1.694844, 0, 0.1529412, 1, 1,
0.3553498, -0.7347671, 2.879183, 0, 0.1490196, 1, 1,
0.35578, 0.5249867, -1.061623, 0, 0.1411765, 1, 1,
0.3565547, -0.4326542, -1.246583, 0, 0.1372549, 1, 1,
0.3568984, 0.4739363, 1.359405, 0, 0.1294118, 1, 1,
0.357508, -0.3147413, 2.875151, 0, 0.1254902, 1, 1,
0.3614001, 1.201625, 1.573093, 0, 0.1176471, 1, 1,
0.3619666, 1.432426, 0.6819497, 0, 0.1137255, 1, 1,
0.3626049, -1.105415, 1.723642, 0, 0.1058824, 1, 1,
0.3632607, 1.016341, 0.189363, 0, 0.09803922, 1, 1,
0.3657337, 1.217044, -0.3415746, 0, 0.09411765, 1, 1,
0.3665071, -0.2172941, 1.338979, 0, 0.08627451, 1, 1,
0.366519, -0.9610279, 1.184714, 0, 0.08235294, 1, 1,
0.3709601, 1.664124, 0.07530317, 0, 0.07450981, 1, 1,
0.3713539, -0.9457906, 3.512202, 0, 0.07058824, 1, 1,
0.3765304, -0.6630282, 2.670417, 0, 0.0627451, 1, 1,
0.3786613, -0.6156033, 2.430118, 0, 0.05882353, 1, 1,
0.3834829, 0.710085, 0.3535689, 0, 0.05098039, 1, 1,
0.3836125, 0.5368086, 0.6119162, 0, 0.04705882, 1, 1,
0.3860612, 1.085148, 0.08447737, 0, 0.03921569, 1, 1,
0.39007, 1.510885, -0.9437865, 0, 0.03529412, 1, 1,
0.3932033, -0.6358365, 2.845025, 0, 0.02745098, 1, 1,
0.3960655, -0.7632991, 1.965233, 0, 0.02352941, 1, 1,
0.3984729, 0.594898, 0.6148202, 0, 0.01568628, 1, 1,
0.403765, -0.8252979, 3.111304, 0, 0.01176471, 1, 1,
0.4058739, 0.2726508, -0.2039738, 0, 0.003921569, 1, 1,
0.4124062, -0.8647625, 1.837556, 0.003921569, 0, 1, 1,
0.4130147, -0.8020674, 2.764315, 0.007843138, 0, 1, 1,
0.4176166, -0.589352, 2.434004, 0.01568628, 0, 1, 1,
0.4219011, -1.098515, 1.906161, 0.01960784, 0, 1, 1,
0.4235727, -1.644617, 2.139881, 0.02745098, 0, 1, 1,
0.4263565, 0.3896244, -0.3760713, 0.03137255, 0, 1, 1,
0.4270651, -1.510377, 3.26253, 0.03921569, 0, 1, 1,
0.4300198, -0.1813312, 3.495071, 0.04313726, 0, 1, 1,
0.4357436, -0.7806371, 2.506729, 0.05098039, 0, 1, 1,
0.4400522, 0.5814595, 1.319784, 0.05490196, 0, 1, 1,
0.4403337, 0.8212391, 0.4292705, 0.0627451, 0, 1, 1,
0.4408099, 1.999141, 0.08034856, 0.06666667, 0, 1, 1,
0.4419903, -1.358776, 1.934816, 0.07450981, 0, 1, 1,
0.4455009, -1.355728, 2.138545, 0.07843138, 0, 1, 1,
0.4464242, -0.792785, 2.831711, 0.08627451, 0, 1, 1,
0.4469918, 0.5636744, 0.02661868, 0.09019608, 0, 1, 1,
0.4511874, -1.571601, 3.13631, 0.09803922, 0, 1, 1,
0.4585016, -1.280563, 2.499374, 0.1058824, 0, 1, 1,
0.4706715, 0.578432, 0.6836028, 0.1098039, 0, 1, 1,
0.4736469, -1.813924, 2.237546, 0.1176471, 0, 1, 1,
0.4753199, -1.286571, 3.216189, 0.1215686, 0, 1, 1,
0.475516, -0.277978, 0.04954021, 0.1294118, 0, 1, 1,
0.4822529, -0.3372782, 3.325341, 0.1333333, 0, 1, 1,
0.4823022, 0.5831397, 1.281171, 0.1411765, 0, 1, 1,
0.4841145, -0.06732175, 3.1403, 0.145098, 0, 1, 1,
0.4859127, -0.9542384, 3.303376, 0.1529412, 0, 1, 1,
0.4866134, 1.249947, -0.4106919, 0.1568628, 0, 1, 1,
0.4869041, -0.1874223, 1.438187, 0.1647059, 0, 1, 1,
0.4875576, -0.004379875, 3.877175, 0.1686275, 0, 1, 1,
0.4891473, 0.01254318, 0.1602265, 0.1764706, 0, 1, 1,
0.4919609, -0.8135307, 1.936093, 0.1803922, 0, 1, 1,
0.4935008, 0.6415002, 2.083876, 0.1882353, 0, 1, 1,
0.4946021, -1.867202, 2.331378, 0.1921569, 0, 1, 1,
0.4952801, 1.538828, 0.08567774, 0.2, 0, 1, 1,
0.4993206, -2.014911, 2.864804, 0.2078431, 0, 1, 1,
0.4999037, 0.8010093, 1.546104, 0.2117647, 0, 1, 1,
0.5009506, 0.7427905, 1.457016, 0.2196078, 0, 1, 1,
0.5020311, -1.375038, 3.281582, 0.2235294, 0, 1, 1,
0.503696, 1.528089, 1.277363, 0.2313726, 0, 1, 1,
0.5059015, 0.7296264, -1.033953, 0.2352941, 0, 1, 1,
0.5071382, 0.2701975, 1.171828, 0.2431373, 0, 1, 1,
0.5094466, 1.091566, 0.3784066, 0.2470588, 0, 1, 1,
0.5096651, -0.3337853, 3.085477, 0.254902, 0, 1, 1,
0.511749, 1.58174, 0.3088275, 0.2588235, 0, 1, 1,
0.5119206, 1.930611, 0.003084756, 0.2666667, 0, 1, 1,
0.5233404, 0.3171803, -0.2926521, 0.2705882, 0, 1, 1,
0.5244101, 1.680009, -0.9567463, 0.2784314, 0, 1, 1,
0.5248827, -1.062116, 2.932087, 0.282353, 0, 1, 1,
0.5271159, -0.3637051, 1.115932, 0.2901961, 0, 1, 1,
0.5289833, -0.4814189, 1.702454, 0.2941177, 0, 1, 1,
0.5343066, 1.685519, -1.40046, 0.3019608, 0, 1, 1,
0.5355, 0.09363797, 1.707951, 0.3098039, 0, 1, 1,
0.5363865, 0.03372681, 0.3808104, 0.3137255, 0, 1, 1,
0.5417606, -0.1523419, 1.939646, 0.3215686, 0, 1, 1,
0.5427489, -1.330459, 2.947366, 0.3254902, 0, 1, 1,
0.5432771, -0.247295, 2.687742, 0.3333333, 0, 1, 1,
0.5449288, 0.7592745, 0.3443191, 0.3372549, 0, 1, 1,
0.5452401, 1.519675, 0.3998913, 0.345098, 0, 1, 1,
0.5472939, -0.621334, 3.202692, 0.3490196, 0, 1, 1,
0.548149, 0.7547531, 0.002769205, 0.3568628, 0, 1, 1,
0.5514088, 0.6011082, 0.516306, 0.3607843, 0, 1, 1,
0.5538532, 0.8882259, 2.344248, 0.3686275, 0, 1, 1,
0.5577047, -0.2652541, 1.283345, 0.372549, 0, 1, 1,
0.558207, 0.1746761, 2.841702, 0.3803922, 0, 1, 1,
0.5666457, -1.193261, 1.907412, 0.3843137, 0, 1, 1,
0.5669083, 0.7662303, 3.540013, 0.3921569, 0, 1, 1,
0.5735976, 0.006586816, 1.10536, 0.3960784, 0, 1, 1,
0.5752033, -0.0521095, 1.808039, 0.4039216, 0, 1, 1,
0.5764797, 0.4935502, 0.2530329, 0.4117647, 0, 1, 1,
0.5825331, 1.176318, 0.0006858192, 0.4156863, 0, 1, 1,
0.5862539, 0.07363219, 1.718997, 0.4235294, 0, 1, 1,
0.5875236, 1.112458, 1.555894, 0.427451, 0, 1, 1,
0.5878639, 0.3360507, 2.253775, 0.4352941, 0, 1, 1,
0.5901371, -0.3316112, 1.864499, 0.4392157, 0, 1, 1,
0.5926811, 1.163118, -0.07571062, 0.4470588, 0, 1, 1,
0.5937501, 0.5183044, -0.1699606, 0.4509804, 0, 1, 1,
0.5963411, 0.09292645, 3.504225, 0.4588235, 0, 1, 1,
0.6033753, 0.3836657, 0.0552035, 0.4627451, 0, 1, 1,
0.6080651, -0.4125729, 1.310839, 0.4705882, 0, 1, 1,
0.6112919, -0.4302076, 2.740031, 0.4745098, 0, 1, 1,
0.6116486, -0.7725316, 2.289579, 0.4823529, 0, 1, 1,
0.6119239, 0.8379451, 0.8002538, 0.4862745, 0, 1, 1,
0.6146705, -1.492439, 2.663843, 0.4941176, 0, 1, 1,
0.6158402, -0.4168463, 3.840281, 0.5019608, 0, 1, 1,
0.616202, 0.6317557, -0.1255319, 0.5058824, 0, 1, 1,
0.6269314, -1.838474, 3.896589, 0.5137255, 0, 1, 1,
0.6303747, 0.1055414, 1.511457, 0.5176471, 0, 1, 1,
0.6304504, 0.9401247, 0.3380652, 0.5254902, 0, 1, 1,
0.6312799, -0.09529243, 3.780726, 0.5294118, 0, 1, 1,
0.6315854, -1.097187, 0.6402917, 0.5372549, 0, 1, 1,
0.6392176, -0.2423463, 1.638595, 0.5411765, 0, 1, 1,
0.6394232, -1.432692, 2.55668, 0.5490196, 0, 1, 1,
0.6418752, 0.620203, 0.980579, 0.5529412, 0, 1, 1,
0.6441403, -0.7775678, 1.270008, 0.5607843, 0, 1, 1,
0.6457823, -0.1356575, 1.243389, 0.5647059, 0, 1, 1,
0.6504499, 0.03557213, 0.5637139, 0.572549, 0, 1, 1,
0.6519902, -1.715615, 1.938316, 0.5764706, 0, 1, 1,
0.6677942, -1.890846, 0.3456515, 0.5843138, 0, 1, 1,
0.6741955, -0.4934816, 1.839791, 0.5882353, 0, 1, 1,
0.6767831, -0.09814963, 1.891751, 0.5960785, 0, 1, 1,
0.6815096, -0.04986554, 3.332559, 0.6039216, 0, 1, 1,
0.6843362, -0.4067384, 2.74048, 0.6078432, 0, 1, 1,
0.6881347, -0.5890111, 3.25732, 0.6156863, 0, 1, 1,
0.6971832, -0.02764842, 1.073658, 0.6196079, 0, 1, 1,
0.702381, -0.5268521, 4.911197, 0.627451, 0, 1, 1,
0.7074284, 1.61618, 0.5083189, 0.6313726, 0, 1, 1,
0.7093766, -0.0380485, 3.190328, 0.6392157, 0, 1, 1,
0.7117187, 0.6128932, 0.06181564, 0.6431373, 0, 1, 1,
0.7172023, 0.659315, 1.511207, 0.6509804, 0, 1, 1,
0.7175617, -0.9832236, 3.703205, 0.654902, 0, 1, 1,
0.7180914, 1.391236, -0.5888411, 0.6627451, 0, 1, 1,
0.7205419, 1.341578, 0.1880649, 0.6666667, 0, 1, 1,
0.7244492, -0.2410996, 1.17992, 0.6745098, 0, 1, 1,
0.7289512, 0.5680982, 0.8793093, 0.6784314, 0, 1, 1,
0.733385, -0.6362446, 1.283842, 0.6862745, 0, 1, 1,
0.7336856, -0.5842021, 3.473011, 0.6901961, 0, 1, 1,
0.736426, -1.630661, 2.364257, 0.6980392, 0, 1, 1,
0.7368664, 1.388605, 1.117182, 0.7058824, 0, 1, 1,
0.7387049, -0.3792556, 1.316208, 0.7098039, 0, 1, 1,
0.7412871, 0.3727843, 3.349806, 0.7176471, 0, 1, 1,
0.7419344, 0.1851634, 1.800316, 0.7215686, 0, 1, 1,
0.7422075, -0.1516288, 2.531083, 0.7294118, 0, 1, 1,
0.7430288, 0.8233176, 0.6574346, 0.7333333, 0, 1, 1,
0.7486759, 0.357398, 1.962117, 0.7411765, 0, 1, 1,
0.7565827, -0.2473844, 1.387851, 0.7450981, 0, 1, 1,
0.7566344, -0.7813946, 2.962361, 0.7529412, 0, 1, 1,
0.7567273, 0.5884454, -0.932618, 0.7568628, 0, 1, 1,
0.758955, 1.037908, -0.04202553, 0.7647059, 0, 1, 1,
0.7595541, 0.5681373, 0.4017352, 0.7686275, 0, 1, 1,
0.7599841, -1.048715, 2.534812, 0.7764706, 0, 1, 1,
0.7603357, 0.1430087, 1.611307, 0.7803922, 0, 1, 1,
0.7643844, 0.6359622, 1.678545, 0.7882353, 0, 1, 1,
0.7681242, 0.5154502, 1.879249, 0.7921569, 0, 1, 1,
0.7703909, -0.8306842, -0.09035596, 0.8, 0, 1, 1,
0.7751997, 0.0572297, 2.027443, 0.8078431, 0, 1, 1,
0.7860986, 0.6217521, 0.4565196, 0.8117647, 0, 1, 1,
0.7966425, 1.393497, 0.9195481, 0.8196079, 0, 1, 1,
0.7974572, 0.748579, 0.005014054, 0.8235294, 0, 1, 1,
0.8030051, 1.749565, -0.4923196, 0.8313726, 0, 1, 1,
0.8194262, -1.150235, 1.947216, 0.8352941, 0, 1, 1,
0.8240075, -0.3941388, 1.145703, 0.8431373, 0, 1, 1,
0.8290126, 1.113549, 2.080979, 0.8470588, 0, 1, 1,
0.8297031, 0.3635415, 1.925689, 0.854902, 0, 1, 1,
0.8388221, 0.089518, 1.619031, 0.8588235, 0, 1, 1,
0.8424156, 0.8515899, 0.1471908, 0.8666667, 0, 1, 1,
0.8454282, -0.299304, 3.66643, 0.8705882, 0, 1, 1,
0.8508522, 0.3852998, 0.5025206, 0.8784314, 0, 1, 1,
0.8568287, -1.197577, 2.433445, 0.8823529, 0, 1, 1,
0.8636231, 0.3216757, 1.065213, 0.8901961, 0, 1, 1,
0.8640492, 1.04015, 1.872074, 0.8941177, 0, 1, 1,
0.8656331, -0.4639747, 0.94552, 0.9019608, 0, 1, 1,
0.8676884, 1.466094, -1.820947, 0.9098039, 0, 1, 1,
0.8687899, 1.537397, -0.3684386, 0.9137255, 0, 1, 1,
0.8738612, 0.1712631, 0.7349638, 0.9215686, 0, 1, 1,
0.8773261, 0.3670402, 0.7601195, 0.9254902, 0, 1, 1,
0.8879623, -0.2827999, 2.126591, 0.9333333, 0, 1, 1,
0.8909544, 0.193979, 1.629288, 0.9372549, 0, 1, 1,
0.8932143, -0.2072625, 0.8566636, 0.945098, 0, 1, 1,
0.8952429, 0.1852229, 0.4775403, 0.9490196, 0, 1, 1,
0.8953177, -1.331043, 1.972174, 0.9568627, 0, 1, 1,
0.895605, -0.3904914, 4.812047, 0.9607843, 0, 1, 1,
0.8978935, 1.733183, -1.130247, 0.9686275, 0, 1, 1,
0.9002176, -2.312188, 3.712345, 0.972549, 0, 1, 1,
0.9014141, -0.6282651, 2.849862, 0.9803922, 0, 1, 1,
0.9147022, 0.91564, 1.539575, 0.9843137, 0, 1, 1,
0.9177509, 0.2941804, 0.8403589, 0.9921569, 0, 1, 1,
0.9223233, 1.1809, 2.550359, 0.9960784, 0, 1, 1,
0.9238052, -0.9164609, 4.682582, 1, 0, 0.9960784, 1,
0.9381236, 0.2601165, 1.139457, 1, 0, 0.9882353, 1,
0.9429685, -1.379663, 2.989664, 1, 0, 0.9843137, 1,
0.944545, 0.05524772, 1.196128, 1, 0, 0.9764706, 1,
0.9489233, 0.2166148, 1.760647, 1, 0, 0.972549, 1,
0.9516029, -0.2071707, 1.316009, 1, 0, 0.9647059, 1,
0.956304, 1.748126, 1.387032, 1, 0, 0.9607843, 1,
0.9616273, 0.6428415, -0.07619595, 1, 0, 0.9529412, 1,
0.9658294, -0.2783347, 1.965097, 1, 0, 0.9490196, 1,
0.9662174, 2.218151, 0.07737161, 1, 0, 0.9411765, 1,
0.9700503, 0.4092405, 2.350535, 1, 0, 0.9372549, 1,
0.9808757, -0.09484457, 1.90334, 1, 0, 0.9294118, 1,
0.9896419, -2.356218, 1.033385, 1, 0, 0.9254902, 1,
0.9905532, -1.27457, 2.767859, 1, 0, 0.9176471, 1,
0.9945615, 0.5097928, 0.7804282, 1, 0, 0.9137255, 1,
0.9966436, -0.9152816, 2.712916, 1, 0, 0.9058824, 1,
0.9996319, -1.326822, 2.217656, 1, 0, 0.9019608, 1,
1.001582, -0.4578898, 0.6106749, 1, 0, 0.8941177, 1,
1.004171, 1.787208, 1.039379, 1, 0, 0.8862745, 1,
1.018601, 0.9800424, -0.05628829, 1, 0, 0.8823529, 1,
1.019262, 0.7471373, 0.3249136, 1, 0, 0.8745098, 1,
1.019787, -0.5450919, 0.8635047, 1, 0, 0.8705882, 1,
1.028488, 0.1099634, 2.244332, 1, 0, 0.8627451, 1,
1.0339, -0.5746514, 0.5016125, 1, 0, 0.8588235, 1,
1.040704, 0.3448071, 2.643546, 1, 0, 0.8509804, 1,
1.040971, 1.768618, -1.024228, 1, 0, 0.8470588, 1,
1.0481, 0.0334045, 2.491266, 1, 0, 0.8392157, 1,
1.05979, -1.386281, 0.8158987, 1, 0, 0.8352941, 1,
1.061921, 2.502116, 1.953988, 1, 0, 0.827451, 1,
1.064593, -1.125275, 1.434254, 1, 0, 0.8235294, 1,
1.072376, -1.133564, 2.57393, 1, 0, 0.8156863, 1,
1.078285, 0.7362038, 0.7836429, 1, 0, 0.8117647, 1,
1.081576, -0.1772929, 2.94332, 1, 0, 0.8039216, 1,
1.083481, 0.4298019, 0.3681797, 1, 0, 0.7960784, 1,
1.095505, -1.052647, 1.844711, 1, 0, 0.7921569, 1,
1.096829, -0.3581823, 3.906311, 1, 0, 0.7843137, 1,
1.102086, 1.487928, -0.1031259, 1, 0, 0.7803922, 1,
1.107113, 0.6970119, -0.2247307, 1, 0, 0.772549, 1,
1.11364, 1.588937, 1.448179, 1, 0, 0.7686275, 1,
1.114753, 0.4593393, 0.239159, 1, 0, 0.7607843, 1,
1.117416, -0.04351848, 3.086924, 1, 0, 0.7568628, 1,
1.118165, -1.062604, 3.835841, 1, 0, 0.7490196, 1,
1.118779, -0.7022765, 1.133719, 1, 0, 0.7450981, 1,
1.125669, 1.738477, 2.301416, 1, 0, 0.7372549, 1,
1.133704, -0.1660753, 1.807108, 1, 0, 0.7333333, 1,
1.135165, -0.9700264, 0.9464309, 1, 0, 0.7254902, 1,
1.154419, 0.002175785, 2.502721, 1, 0, 0.7215686, 1,
1.157044, -0.8862756, 1.398677, 1, 0, 0.7137255, 1,
1.157229, -0.1860531, 2.512337, 1, 0, 0.7098039, 1,
1.159407, -0.6936737, 2.893824, 1, 0, 0.7019608, 1,
1.175098, -0.2080353, 2.16066, 1, 0, 0.6941177, 1,
1.191906, -3.554158, 2.014183, 1, 0, 0.6901961, 1,
1.20244, 0.2696192, 2.122896, 1, 0, 0.682353, 1,
1.210488, 1.948744, 1.220114, 1, 0, 0.6784314, 1,
1.213366, -1.217642, 2.280523, 1, 0, 0.6705883, 1,
1.215659, -0.4555669, 3.558228, 1, 0, 0.6666667, 1,
1.236841, 1.579418, 0.4324505, 1, 0, 0.6588235, 1,
1.254628, 0.5627037, 1.57132, 1, 0, 0.654902, 1,
1.257163, 0.6582074, 0.8556845, 1, 0, 0.6470588, 1,
1.259674, 1.408986, 1.289346, 1, 0, 0.6431373, 1,
1.260046, 0.3840486, 0.7843725, 1, 0, 0.6352941, 1,
1.26994, 0.5621708, 2.049175, 1, 0, 0.6313726, 1,
1.274032, 1.365994, 0.5824694, 1, 0, 0.6235294, 1,
1.275326, 1.152617, 0.776343, 1, 0, 0.6196079, 1,
1.276454, -1.748137, 2.467274, 1, 0, 0.6117647, 1,
1.277766, -0.1723329, 2.369032, 1, 0, 0.6078432, 1,
1.281847, 0.5720106, 2.337147, 1, 0, 0.6, 1,
1.287197, -0.3987524, 1.467537, 1, 0, 0.5921569, 1,
1.292163, -1.129621, 2.251503, 1, 0, 0.5882353, 1,
1.294734, -1.377464, 1.950692, 1, 0, 0.5803922, 1,
1.301911, 1.244218, -0.39448, 1, 0, 0.5764706, 1,
1.302881, 1.026533, 0.2648079, 1, 0, 0.5686275, 1,
1.3039, -1.030002, 3.526031, 1, 0, 0.5647059, 1,
1.307415, -0.7144768, 1.783919, 1, 0, 0.5568628, 1,
1.307445, -1.552153, 1.913715, 1, 0, 0.5529412, 1,
1.316472, -0.007517294, 0.9916138, 1, 0, 0.5450981, 1,
1.316479, 0.6198086, 0.6686527, 1, 0, 0.5411765, 1,
1.31784, -0.6179487, 2.255241, 1, 0, 0.5333334, 1,
1.318061, -3.250929, 2.884973, 1, 0, 0.5294118, 1,
1.326002, -0.3250414, 1.023451, 1, 0, 0.5215687, 1,
1.336254, 1.101014, -0.7860222, 1, 0, 0.5176471, 1,
1.346281, -0.1055465, 1.824675, 1, 0, 0.509804, 1,
1.351783, -0.9579624, 3.060677, 1, 0, 0.5058824, 1,
1.357276, -0.4751835, 0.7801529, 1, 0, 0.4980392, 1,
1.357906, -0.4074876, 2.507101, 1, 0, 0.4901961, 1,
1.35817, 0.08969447, 0.01793732, 1, 0, 0.4862745, 1,
1.35891, 0.7889925, 1.972732, 1, 0, 0.4784314, 1,
1.359325, 0.4460396, 2.657625, 1, 0, 0.4745098, 1,
1.364882, -0.4693366, 1.24378, 1, 0, 0.4666667, 1,
1.38622, -1.295634, 0.1925762, 1, 0, 0.4627451, 1,
1.411854, 0.7539319, -0.3827726, 1, 0, 0.454902, 1,
1.413333, 1.426241, -0.65521, 1, 0, 0.4509804, 1,
1.415159, 0.597141, 2.054888, 1, 0, 0.4431373, 1,
1.422687, -0.2085918, 0.55826, 1, 0, 0.4392157, 1,
1.424655, 0.5196797, 0.6867257, 1, 0, 0.4313726, 1,
1.429097, -0.9404966, 3.133641, 1, 0, 0.427451, 1,
1.430099, -0.07197385, 0.2271467, 1, 0, 0.4196078, 1,
1.439746, -0.4892477, 2.384548, 1, 0, 0.4156863, 1,
1.441093, -2.660274, 2.148038, 1, 0, 0.4078431, 1,
1.444708, 0.3201639, 2.06007, 1, 0, 0.4039216, 1,
1.450813, 1.740114, -0.6804234, 1, 0, 0.3960784, 1,
1.478338, -1.146022, 1.050405, 1, 0, 0.3882353, 1,
1.481695, -1.001432, 1.418113, 1, 0, 0.3843137, 1,
1.48997, 1.169627, 0.04485709, 1, 0, 0.3764706, 1,
1.490823, 0.7634399, 1.893189, 1, 0, 0.372549, 1,
1.500683, 0.08965857, 2.666861, 1, 0, 0.3647059, 1,
1.502772, -1.372831, 1.651661, 1, 0, 0.3607843, 1,
1.503112, -0.928782, 2.136835, 1, 0, 0.3529412, 1,
1.511811, 0.666441, 1.536557, 1, 0, 0.3490196, 1,
1.528299, -1.192208, 3.853204, 1, 0, 0.3411765, 1,
1.546684, 0.5816692, 2.670579, 1, 0, 0.3372549, 1,
1.550282, 0.0599472, 1.531575, 1, 0, 0.3294118, 1,
1.563396, -0.4438981, 2.857437, 1, 0, 0.3254902, 1,
1.572571, -0.4411958, 2.743733, 1, 0, 0.3176471, 1,
1.574794, -1.383569, 2.175511, 1, 0, 0.3137255, 1,
1.578374, 0.1624349, 1.871278, 1, 0, 0.3058824, 1,
1.601655, 1.065567, 0.8685985, 1, 0, 0.2980392, 1,
1.627268, -0.9164193, 1.243264, 1, 0, 0.2941177, 1,
1.633247, -0.3593256, 2.7212, 1, 0, 0.2862745, 1,
1.671823, 1.376118, 0.6807076, 1, 0, 0.282353, 1,
1.675387, 0.6794642, 1.252751, 1, 0, 0.2745098, 1,
1.680073, -0.4410161, 0.5139605, 1, 0, 0.2705882, 1,
1.680797, -0.8981221, 2.210905, 1, 0, 0.2627451, 1,
1.695631, -0.2014751, 1.509786, 1, 0, 0.2588235, 1,
1.70197, 0.002872187, 1.624392, 1, 0, 0.2509804, 1,
1.712023, 1.175167, -0.280054, 1, 0, 0.2470588, 1,
1.71561, 0.6324344, 1.297728, 1, 0, 0.2392157, 1,
1.717424, 0.3942132, 1.253377, 1, 0, 0.2352941, 1,
1.741846, -0.9756559, 2.661914, 1, 0, 0.227451, 1,
1.744934, -1.632809, 3.480111, 1, 0, 0.2235294, 1,
1.784053, -0.489601, 2.748907, 1, 0, 0.2156863, 1,
1.787718, -0.5496488, 2.568721, 1, 0, 0.2117647, 1,
1.803216, 0.6880484, 1.643495, 1, 0, 0.2039216, 1,
1.808619, 0.2324348, 2.068294, 1, 0, 0.1960784, 1,
1.812962, 0.06009236, 2.19171, 1, 0, 0.1921569, 1,
1.815711, 0.3459932, 2.535955, 1, 0, 0.1843137, 1,
1.817529, -0.7095183, 1.726358, 1, 0, 0.1803922, 1,
1.821787, -0.639616, 3.110069, 1, 0, 0.172549, 1,
1.836699, 0.8440287, 0.5422147, 1, 0, 0.1686275, 1,
1.851827, -0.07260187, 2.039699, 1, 0, 0.1607843, 1,
1.857382, 0.3548743, 2.313418, 1, 0, 0.1568628, 1,
1.913625, -1.249341, 2.429493, 1, 0, 0.1490196, 1,
1.914668, -0.5735264, 2.04674, 1, 0, 0.145098, 1,
1.929986, -0.1295542, 1.70134, 1, 0, 0.1372549, 1,
1.937705, 0.3010821, 2.640054, 1, 0, 0.1333333, 1,
1.945052, 1.502994, -0.1627023, 1, 0, 0.1254902, 1,
1.950959, -0.1964225, -0.7912667, 1, 0, 0.1215686, 1,
2.01994, -0.5194667, 3.026814, 1, 0, 0.1137255, 1,
2.037494, 1.299695, 1.845209, 1, 0, 0.1098039, 1,
2.061146, -0.5114994, 2.808247, 1, 0, 0.1019608, 1,
2.100946, -1.626154, 1.887493, 1, 0, 0.09411765, 1,
2.110835, -0.09331936, 0.8376151, 1, 0, 0.09019608, 1,
2.130092, -2.003436, 1.885975, 1, 0, 0.08235294, 1,
2.187603, 0.002012881, 2.149885, 1, 0, 0.07843138, 1,
2.21046, 0.05297317, 1.511111, 1, 0, 0.07058824, 1,
2.221682, 0.7204773, 1.793115, 1, 0, 0.06666667, 1,
2.227374, 0.5680844, 1.91056, 1, 0, 0.05882353, 1,
2.245806, 0.4749695, 1.805837, 1, 0, 0.05490196, 1,
2.245991, -0.8198069, 3.014085, 1, 0, 0.04705882, 1,
2.259022, -0.1998241, 2.120954, 1, 0, 0.04313726, 1,
2.310163, -0.7859995, 1.677928, 1, 0, 0.03529412, 1,
2.342027, -0.9873299, 1.109005, 1, 0, 0.03137255, 1,
2.367915, 1.181817, 0.5955319, 1, 0, 0.02352941, 1,
2.412603, -0.1403104, 2.719647, 1, 0, 0.01960784, 1,
2.722049, 0.418572, 0.07787367, 1, 0, 0.01176471, 1,
2.879575, -0.1364592, 1.866324, 1, 0, 0.007843138, 1
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
-0.1228391, -4.835362, -7.728112, 0, -0.5, 0.5, 0.5,
-0.1228391, -4.835362, -7.728112, 1, -0.5, 0.5, 0.5,
-0.1228391, -4.835362, -7.728112, 1, 1.5, 0.5, 0.5,
-0.1228391, -4.835362, -7.728112, 0, 1.5, 0.5, 0.5
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
-4.143071, -0.407721, -7.728112, 0, -0.5, 0.5, 0.5,
-4.143071, -0.407721, -7.728112, 1, -0.5, 0.5, 0.5,
-4.143071, -0.407721, -7.728112, 1, 1.5, 0.5, 0.5,
-4.143071, -0.407721, -7.728112, 0, 1.5, 0.5, 0.5
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
-4.143071, -4.835362, -0.4145918, 0, -0.5, 0.5, 0.5,
-4.143071, -4.835362, -0.4145918, 1, -0.5, 0.5, 0.5,
-4.143071, -4.835362, -0.4145918, 1, 1.5, 0.5, 0.5,
-4.143071, -4.835362, -0.4145918, 0, 1.5, 0.5, 0.5
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
-3, -3.813599, -6.040377,
2, -3.813599, -6.040377,
-3, -3.813599, -6.040377,
-3, -3.983893, -6.321666,
-2, -3.813599, -6.040377,
-2, -3.983893, -6.321666,
-1, -3.813599, -6.040377,
-1, -3.983893, -6.321666,
0, -3.813599, -6.040377,
0, -3.983893, -6.321666,
1, -3.813599, -6.040377,
1, -3.983893, -6.321666,
2, -3.813599, -6.040377,
2, -3.983893, -6.321666
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
-3, -4.324481, -6.884244, 0, -0.5, 0.5, 0.5,
-3, -4.324481, -6.884244, 1, -0.5, 0.5, 0.5,
-3, -4.324481, -6.884244, 1, 1.5, 0.5, 0.5,
-3, -4.324481, -6.884244, 0, 1.5, 0.5, 0.5,
-2, -4.324481, -6.884244, 0, -0.5, 0.5, 0.5,
-2, -4.324481, -6.884244, 1, -0.5, 0.5, 0.5,
-2, -4.324481, -6.884244, 1, 1.5, 0.5, 0.5,
-2, -4.324481, -6.884244, 0, 1.5, 0.5, 0.5,
-1, -4.324481, -6.884244, 0, -0.5, 0.5, 0.5,
-1, -4.324481, -6.884244, 1, -0.5, 0.5, 0.5,
-1, -4.324481, -6.884244, 1, 1.5, 0.5, 0.5,
-1, -4.324481, -6.884244, 0, 1.5, 0.5, 0.5,
0, -4.324481, -6.884244, 0, -0.5, 0.5, 0.5,
0, -4.324481, -6.884244, 1, -0.5, 0.5, 0.5,
0, -4.324481, -6.884244, 1, 1.5, 0.5, 0.5,
0, -4.324481, -6.884244, 0, 1.5, 0.5, 0.5,
1, -4.324481, -6.884244, 0, -0.5, 0.5, 0.5,
1, -4.324481, -6.884244, 1, -0.5, 0.5, 0.5,
1, -4.324481, -6.884244, 1, 1.5, 0.5, 0.5,
1, -4.324481, -6.884244, 0, 1.5, 0.5, 0.5,
2, -4.324481, -6.884244, 0, -0.5, 0.5, 0.5,
2, -4.324481, -6.884244, 1, -0.5, 0.5, 0.5,
2, -4.324481, -6.884244, 1, 1.5, 0.5, 0.5,
2, -4.324481, -6.884244, 0, 1.5, 0.5, 0.5
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
-3.215325, -3, -6.040377,
-3.215325, 2, -6.040377,
-3.215325, -3, -6.040377,
-3.36995, -3, -6.321666,
-3.215325, -2, -6.040377,
-3.36995, -2, -6.321666,
-3.215325, -1, -6.040377,
-3.36995, -1, -6.321666,
-3.215325, 0, -6.040377,
-3.36995, 0, -6.321666,
-3.215325, 1, -6.040377,
-3.36995, 1, -6.321666,
-3.215325, 2, -6.040377,
-3.36995, 2, -6.321666
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
-3.679198, -3, -6.884244, 0, -0.5, 0.5, 0.5,
-3.679198, -3, -6.884244, 1, -0.5, 0.5, 0.5,
-3.679198, -3, -6.884244, 1, 1.5, 0.5, 0.5,
-3.679198, -3, -6.884244, 0, 1.5, 0.5, 0.5,
-3.679198, -2, -6.884244, 0, -0.5, 0.5, 0.5,
-3.679198, -2, -6.884244, 1, -0.5, 0.5, 0.5,
-3.679198, -2, -6.884244, 1, 1.5, 0.5, 0.5,
-3.679198, -2, -6.884244, 0, 1.5, 0.5, 0.5,
-3.679198, -1, -6.884244, 0, -0.5, 0.5, 0.5,
-3.679198, -1, -6.884244, 1, -0.5, 0.5, 0.5,
-3.679198, -1, -6.884244, 1, 1.5, 0.5, 0.5,
-3.679198, -1, -6.884244, 0, 1.5, 0.5, 0.5,
-3.679198, 0, -6.884244, 0, -0.5, 0.5, 0.5,
-3.679198, 0, -6.884244, 1, -0.5, 0.5, 0.5,
-3.679198, 0, -6.884244, 1, 1.5, 0.5, 0.5,
-3.679198, 0, -6.884244, 0, 1.5, 0.5, 0.5,
-3.679198, 1, -6.884244, 0, -0.5, 0.5, 0.5,
-3.679198, 1, -6.884244, 1, -0.5, 0.5, 0.5,
-3.679198, 1, -6.884244, 1, 1.5, 0.5, 0.5,
-3.679198, 1, -6.884244, 0, 1.5, 0.5, 0.5,
-3.679198, 2, -6.884244, 0, -0.5, 0.5, 0.5,
-3.679198, 2, -6.884244, 1, -0.5, 0.5, 0.5,
-3.679198, 2, -6.884244, 1, 1.5, 0.5, 0.5,
-3.679198, 2, -6.884244, 0, 1.5, 0.5, 0.5
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
-3.215325, -3.813599, -4,
-3.215325, -3.813599, 4,
-3.215325, -3.813599, -4,
-3.36995, -3.983893, -4,
-3.215325, -3.813599, -2,
-3.36995, -3.983893, -2,
-3.215325, -3.813599, 0,
-3.36995, -3.983893, 0,
-3.215325, -3.813599, 2,
-3.36995, -3.983893, 2,
-3.215325, -3.813599, 4,
-3.36995, -3.983893, 4
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
-3.679198, -4.324481, -4, 0, -0.5, 0.5, 0.5,
-3.679198, -4.324481, -4, 1, -0.5, 0.5, 0.5,
-3.679198, -4.324481, -4, 1, 1.5, 0.5, 0.5,
-3.679198, -4.324481, -4, 0, 1.5, 0.5, 0.5,
-3.679198, -4.324481, -2, 0, -0.5, 0.5, 0.5,
-3.679198, -4.324481, -2, 1, -0.5, 0.5, 0.5,
-3.679198, -4.324481, -2, 1, 1.5, 0.5, 0.5,
-3.679198, -4.324481, -2, 0, 1.5, 0.5, 0.5,
-3.679198, -4.324481, 0, 0, -0.5, 0.5, 0.5,
-3.679198, -4.324481, 0, 1, -0.5, 0.5, 0.5,
-3.679198, -4.324481, 0, 1, 1.5, 0.5, 0.5,
-3.679198, -4.324481, 0, 0, 1.5, 0.5, 0.5,
-3.679198, -4.324481, 2, 0, -0.5, 0.5, 0.5,
-3.679198, -4.324481, 2, 1, -0.5, 0.5, 0.5,
-3.679198, -4.324481, 2, 1, 1.5, 0.5, 0.5,
-3.679198, -4.324481, 2, 0, 1.5, 0.5, 0.5,
-3.679198, -4.324481, 4, 0, -0.5, 0.5, 0.5,
-3.679198, -4.324481, 4, 1, -0.5, 0.5, 0.5,
-3.679198, -4.324481, 4, 1, 1.5, 0.5, 0.5,
-3.679198, -4.324481, 4, 0, 1.5, 0.5, 0.5
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
-3.215325, -3.813599, -6.040377,
-3.215325, 2.998157, -6.040377,
-3.215325, -3.813599, 5.211193,
-3.215325, 2.998157, 5.211193,
-3.215325, -3.813599, -6.040377,
-3.215325, -3.813599, 5.211193,
-3.215325, 2.998157, -6.040377,
-3.215325, 2.998157, 5.211193,
-3.215325, -3.813599, -6.040377,
2.969647, -3.813599, -6.040377,
-3.215325, -3.813599, 5.211193,
2.969647, -3.813599, 5.211193,
-3.215325, 2.998157, -6.040377,
2.969647, 2.998157, -6.040377,
-3.215325, 2.998157, 5.211193,
2.969647, 2.998157, 5.211193,
2.969647, -3.813599, -6.040377,
2.969647, 2.998157, -6.040377,
2.969647, -3.813599, 5.211193,
2.969647, 2.998157, 5.211193,
2.969647, -3.813599, -6.040377,
2.969647, -3.813599, 5.211193,
2.969647, 2.998157, -6.040377,
2.969647, 2.998157, 5.211193
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
var radius = 7.761141;
var distance = 34.53019;
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
mvMatrix.translate( 0.1228391, 0.407721, 0.4145918 );
mvMatrix.scale( 1.356756, 1.231914, 0.7458069 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.53019);
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


