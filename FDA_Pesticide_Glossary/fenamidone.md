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
-3.013862, -0.9545033, -2.040561, 1, 0, 0, 1,
-3.007573, -1.61676, -3.167559, 1, 0.007843138, 0, 1,
-2.9369, 1.879693, -1.26296, 1, 0.01176471, 0, 1,
-2.768952, -0.008425504, 0.2645719, 1, 0.01960784, 0, 1,
-2.713533, -0.8393291, -1.204107, 1, 0.02352941, 0, 1,
-2.660707, 0.095626, -0.5557709, 1, 0.03137255, 0, 1,
-2.609554, 0.6140567, -0.7702475, 1, 0.03529412, 0, 1,
-2.560826, -1.541135, -4.201795, 1, 0.04313726, 0, 1,
-2.560526, 0.6352103, -2.025767, 1, 0.04705882, 0, 1,
-2.534969, -0.1386007, -1.817332, 1, 0.05490196, 0, 1,
-2.438786, 2.320153, -1.025604, 1, 0.05882353, 0, 1,
-2.391295, -0.170016, -0.8455793, 1, 0.06666667, 0, 1,
-2.368669, 0.3951857, -1.438978, 1, 0.07058824, 0, 1,
-2.361907, -0.3500686, -0.3804287, 1, 0.07843138, 0, 1,
-2.336357, -0.4074503, -2.463798, 1, 0.08235294, 0, 1,
-2.311887, 0.701085, -0.6406644, 1, 0.09019608, 0, 1,
-2.284097, -0.27255, -3.418067, 1, 0.09411765, 0, 1,
-2.281384, 0.1768763, -1.525634, 1, 0.1019608, 0, 1,
-2.265138, 0.02663434, -2.049311, 1, 0.1098039, 0, 1,
-2.200231, -0.3392186, -2.202024, 1, 0.1137255, 0, 1,
-2.044062, -0.01926277, -2.898115, 1, 0.1215686, 0, 1,
-1.991312, -0.3015646, -1.681314, 1, 0.1254902, 0, 1,
-1.990185, -0.9047512, -1.809983, 1, 0.1333333, 0, 1,
-1.979404, -0.4811524, -0.7391902, 1, 0.1372549, 0, 1,
-1.929741, 0.5245957, -1.629635, 1, 0.145098, 0, 1,
-1.925645, -0.4494304, -3.143987, 1, 0.1490196, 0, 1,
-1.925064, 1.963537, -0.01825699, 1, 0.1568628, 0, 1,
-1.899607, 0.1721998, -1.241065, 1, 0.1607843, 0, 1,
-1.881274, -0.2367804, -0.5395272, 1, 0.1686275, 0, 1,
-1.837159, -0.9653125, -2.587703, 1, 0.172549, 0, 1,
-1.830758, -0.3281216, 0.7353811, 1, 0.1803922, 0, 1,
-1.823076, -0.2976885, -2.134751, 1, 0.1843137, 0, 1,
-1.810925, 0.08812693, -0.5226187, 1, 0.1921569, 0, 1,
-1.796434, -0.4604854, 0.4049255, 1, 0.1960784, 0, 1,
-1.771453, 0.00489223, -2.962256, 1, 0.2039216, 0, 1,
-1.758283, 0.9854138, -0.960734, 1, 0.2117647, 0, 1,
-1.739532, 0.6097867, 1.666652, 1, 0.2156863, 0, 1,
-1.729719, 0.0995857, -1.581671, 1, 0.2235294, 0, 1,
-1.702477, -0.9313889, -2.503283, 1, 0.227451, 0, 1,
-1.698992, 0.3377661, -0.9910984, 1, 0.2352941, 0, 1,
-1.681591, 0.8288776, 0.04674576, 1, 0.2392157, 0, 1,
-1.66712, -0.1136144, 1.122797, 1, 0.2470588, 0, 1,
-1.659716, 1.228737, -1.290045, 1, 0.2509804, 0, 1,
-1.637643, -0.5598079, -1.491182, 1, 0.2588235, 0, 1,
-1.635768, 1.899005, -1.803888, 1, 0.2627451, 0, 1,
-1.620816, -1.15128, -2.776476, 1, 0.2705882, 0, 1,
-1.616512, -1.109693, -0.4192659, 1, 0.2745098, 0, 1,
-1.611309, 1.820138, -2.709057, 1, 0.282353, 0, 1,
-1.599568, -0.09481744, -1.334387, 1, 0.2862745, 0, 1,
-1.599024, 0.8499221, -0.8028957, 1, 0.2941177, 0, 1,
-1.590114, -1.264842, -2.2122, 1, 0.3019608, 0, 1,
-1.589371, -0.3850433, -1.27879, 1, 0.3058824, 0, 1,
-1.583431, 0.2571241, -3.394877, 1, 0.3137255, 0, 1,
-1.55798, -1.300084, -2.948222, 1, 0.3176471, 0, 1,
-1.549852, -0.006269651, -1.036698, 1, 0.3254902, 0, 1,
-1.54728, -0.1488484, -1.544748, 1, 0.3294118, 0, 1,
-1.545082, -0.8723578, -1.968061, 1, 0.3372549, 0, 1,
-1.542722, -0.8171204, -1.892247, 1, 0.3411765, 0, 1,
-1.542658, -1.622788, -2.625538, 1, 0.3490196, 0, 1,
-1.539241, -0.6023459, -2.330364, 1, 0.3529412, 0, 1,
-1.534773, 0.01881555, -0.8485312, 1, 0.3607843, 0, 1,
-1.520514, 1.365666, -0.6988993, 1, 0.3647059, 0, 1,
-1.509794, -1.719104, -2.569791, 1, 0.372549, 0, 1,
-1.509649, -0.009621535, -1.360303, 1, 0.3764706, 0, 1,
-1.502, -1.220887, -3.892135, 1, 0.3843137, 0, 1,
-1.496326, 1.953615, 1.106654, 1, 0.3882353, 0, 1,
-1.490138, 0.7955636, -1.222998, 1, 0.3960784, 0, 1,
-1.474686, -0.2297394, -0.817932, 1, 0.4039216, 0, 1,
-1.462435, -0.2057181, -1.751098, 1, 0.4078431, 0, 1,
-1.462116, -0.675736, -0.5861561, 1, 0.4156863, 0, 1,
-1.432943, -1.386878, -4.594209, 1, 0.4196078, 0, 1,
-1.431916, -0.2389722, -2.069299, 1, 0.427451, 0, 1,
-1.410366, 1.237244, -1.014082, 1, 0.4313726, 0, 1,
-1.408717, 0.8856956, -0.881565, 1, 0.4392157, 0, 1,
-1.404413, -1.204782, -1.698125, 1, 0.4431373, 0, 1,
-1.398086, -0.02847798, -1.285178, 1, 0.4509804, 0, 1,
-1.390943, 0.1291692, -1.263868, 1, 0.454902, 0, 1,
-1.390174, -1.102081, -3.223886, 1, 0.4627451, 0, 1,
-1.38512, -0.1936557, -2.341497, 1, 0.4666667, 0, 1,
-1.369827, -0.369354, -2.406843, 1, 0.4745098, 0, 1,
-1.369623, 1.185799, -1.30034, 1, 0.4784314, 0, 1,
-1.36376, -0.1096632, -1.726934, 1, 0.4862745, 0, 1,
-1.358345, 0.1999968, 0.5796081, 1, 0.4901961, 0, 1,
-1.354139, 1.20304, -0.04133605, 1, 0.4980392, 0, 1,
-1.349456, 1.182504, 0.2901706, 1, 0.5058824, 0, 1,
-1.314905, 0.1593482, -0.5328102, 1, 0.509804, 0, 1,
-1.30374, -0.6578098, -2.896974, 1, 0.5176471, 0, 1,
-1.292987, -0.4050962, -2.420399, 1, 0.5215687, 0, 1,
-1.292757, -1.480819, -2.774356, 1, 0.5294118, 0, 1,
-1.289514, 0.8889056, -0.9029653, 1, 0.5333334, 0, 1,
-1.288429, 0.8393244, -0.2908787, 1, 0.5411765, 0, 1,
-1.280777, 1.606809, -1.629054, 1, 0.5450981, 0, 1,
-1.279825, -1.429973, -3.024026, 1, 0.5529412, 0, 1,
-1.260566, 1.240848, -1.435565, 1, 0.5568628, 0, 1,
-1.25899, -0.2456442, -1.814527, 1, 0.5647059, 0, 1,
-1.256482, 0.6131089, 0.1844153, 1, 0.5686275, 0, 1,
-1.247077, -0.4625291, -2.383042, 1, 0.5764706, 0, 1,
-1.243673, -0.7857228, -1.060419, 1, 0.5803922, 0, 1,
-1.23755, -1.650219, -1.566567, 1, 0.5882353, 0, 1,
-1.237223, -1.289034, -2.11029, 1, 0.5921569, 0, 1,
-1.228511, 2.475877, -1.110834, 1, 0.6, 0, 1,
-1.225778, 0.279879, -1.24165, 1, 0.6078432, 0, 1,
-1.225415, -0.004745216, -2.905361, 1, 0.6117647, 0, 1,
-1.216234, -0.2780883, -2.587956, 1, 0.6196079, 0, 1,
-1.202943, 2.473336, -1.079618, 1, 0.6235294, 0, 1,
-1.199662, 1.154678, -1.882646, 1, 0.6313726, 0, 1,
-1.199115, 1.531609, -2.358685, 1, 0.6352941, 0, 1,
-1.193282, -1.826121, -2.415195, 1, 0.6431373, 0, 1,
-1.188437, -1.763418, -3.745404, 1, 0.6470588, 0, 1,
-1.18265, 1.83663, -0.8770342, 1, 0.654902, 0, 1,
-1.179266, 0.9566927, -2.392541, 1, 0.6588235, 0, 1,
-1.172206, -0.2310057, -0.1455221, 1, 0.6666667, 0, 1,
-1.158769, -1.928631, -1.754362, 1, 0.6705883, 0, 1,
-1.145297, 0.634719, -0.4053147, 1, 0.6784314, 0, 1,
-1.14229, 0.4654791, -0.9820399, 1, 0.682353, 0, 1,
-1.142137, 1.932832, 1.009727, 1, 0.6901961, 0, 1,
-1.13576, 0.1475207, -2.688312, 1, 0.6941177, 0, 1,
-1.131779, -2.067314, -3.506475, 1, 0.7019608, 0, 1,
-1.127338, 1.279521, -1.024899, 1, 0.7098039, 0, 1,
-1.126986, -0.4068675, -3.131803, 1, 0.7137255, 0, 1,
-1.120752, -0.7060741, -4.163009, 1, 0.7215686, 0, 1,
-1.118254, -1.130418, -2.935266, 1, 0.7254902, 0, 1,
-1.114776, 0.1596166, -1.031521, 1, 0.7333333, 0, 1,
-1.112129, -0.4822377, -4.482979, 1, 0.7372549, 0, 1,
-1.110529, 0.05416262, -2.475348, 1, 0.7450981, 0, 1,
-1.109707, 0.9608653, -1.526646, 1, 0.7490196, 0, 1,
-1.105121, -1.10288, -2.020736, 1, 0.7568628, 0, 1,
-1.102378, 2.597254, -0.9768878, 1, 0.7607843, 0, 1,
-1.097506, -1.032316, -3.552708, 1, 0.7686275, 0, 1,
-1.09483, 0.5363014, -1.87029, 1, 0.772549, 0, 1,
-1.092503, -0.1354308, -1.572034, 1, 0.7803922, 0, 1,
-1.082614, 1.067409, -0.2233164, 1, 0.7843137, 0, 1,
-1.077994, 1.591898, -1.566189, 1, 0.7921569, 0, 1,
-1.074623, 0.9796889, -1.262467, 1, 0.7960784, 0, 1,
-1.071105, -2.380951, -0.7814304, 1, 0.8039216, 0, 1,
-1.066985, 0.2553994, -1.179256, 1, 0.8117647, 0, 1,
-1.060449, -0.6805618, -2.481787, 1, 0.8156863, 0, 1,
-1.058599, 1.370076, -1.283586, 1, 0.8235294, 0, 1,
-1.056814, 0.8126672, -0.7975338, 1, 0.827451, 0, 1,
-1.055646, -0.450996, -0.720592, 1, 0.8352941, 0, 1,
-1.053954, -0.05417614, -1.703279, 1, 0.8392157, 0, 1,
-1.053295, 0.8077959, -0.8611861, 1, 0.8470588, 0, 1,
-1.051518, -0.1133913, -1.756752, 1, 0.8509804, 0, 1,
-1.049398, -0.9905652, -2.557366, 1, 0.8588235, 0, 1,
-1.042447, 1.037669, -1.027191, 1, 0.8627451, 0, 1,
-1.039829, -0.241982, -0.9304653, 1, 0.8705882, 0, 1,
-1.020834, -0.4258587, -0.1251993, 1, 0.8745098, 0, 1,
-1.02036, -1.255851, -2.575053, 1, 0.8823529, 0, 1,
-1.020022, -0.3043554, -0.9007193, 1, 0.8862745, 0, 1,
-1.015634, 0.6939452, 3.345865, 1, 0.8941177, 0, 1,
-1.015507, 2.30715, -3.447014, 1, 0.8980392, 0, 1,
-0.9975373, -0.7513275, -2.923109, 1, 0.9058824, 0, 1,
-0.997467, -0.8786551, -3.136503, 1, 0.9137255, 0, 1,
-0.9961529, 0.4440016, -0.914459, 1, 0.9176471, 0, 1,
-0.994372, -0.5173141, -1.964566, 1, 0.9254902, 0, 1,
-0.9892165, -1.236111, -1.756726, 1, 0.9294118, 0, 1,
-0.9866834, 0.2856373, 3.032325, 1, 0.9372549, 0, 1,
-0.9851785, 1.200427, -1.880747, 1, 0.9411765, 0, 1,
-0.9785349, -0.8085181, -3.18865, 1, 0.9490196, 0, 1,
-0.9778816, -0.2439898, -3.076512, 1, 0.9529412, 0, 1,
-0.9774205, -1.8318, -0.7659651, 1, 0.9607843, 0, 1,
-0.9742719, -0.4187027, -2.632208, 1, 0.9647059, 0, 1,
-0.9737813, -0.5805073, -2.875138, 1, 0.972549, 0, 1,
-0.9730918, -0.1137479, -1.533998, 1, 0.9764706, 0, 1,
-0.9680158, -0.1846503, -0.2951538, 1, 0.9843137, 0, 1,
-0.9650298, 0.5663932, -2.091153, 1, 0.9882353, 0, 1,
-0.9609747, 0.1365697, -0.3627712, 1, 0.9960784, 0, 1,
-0.9608375, 0.0198877, -0.0886312, 0.9960784, 1, 0, 1,
-0.9492318, -1.325284, -3.518705, 0.9921569, 1, 0, 1,
-0.9414577, -0.5705833, -2.294724, 0.9843137, 1, 0, 1,
-0.9341092, -0.4219871, -2.763267, 0.9803922, 1, 0, 1,
-0.9292249, -0.3704244, -0.6106251, 0.972549, 1, 0, 1,
-0.9279361, 0.3422009, -2.643694, 0.9686275, 1, 0, 1,
-0.9269062, -0.6296815, -0.9972786, 0.9607843, 1, 0, 1,
-0.9198895, -0.6307181, -2.367874, 0.9568627, 1, 0, 1,
-0.919887, 0.8139624, -1.193348, 0.9490196, 1, 0, 1,
-0.9194082, -1.797326, -1.577022, 0.945098, 1, 0, 1,
-0.9165906, 0.4069422, -1.439357, 0.9372549, 1, 0, 1,
-0.9150873, -0.7412, -3.80431, 0.9333333, 1, 0, 1,
-0.9145258, -1.360456, -0.8789901, 0.9254902, 1, 0, 1,
-0.9135672, 1.78077, -1.79848, 0.9215686, 1, 0, 1,
-0.9075351, 1.282147, -0.5280117, 0.9137255, 1, 0, 1,
-0.907186, 0.3335763, 1.321556, 0.9098039, 1, 0, 1,
-0.9016493, -1.000934, -2.781119, 0.9019608, 1, 0, 1,
-0.8952324, 0.5022601, -1.678745, 0.8941177, 1, 0, 1,
-0.8921021, -0.3276156, -2.340476, 0.8901961, 1, 0, 1,
-0.8838611, 0.8729634, 0.05120829, 0.8823529, 1, 0, 1,
-0.8837509, -0.002810786, -1.923428, 0.8784314, 1, 0, 1,
-0.8806663, -1.604029, -3.321659, 0.8705882, 1, 0, 1,
-0.8775457, -0.1787438, 0.3921203, 0.8666667, 1, 0, 1,
-0.8765903, 1.265292, -0.8321612, 0.8588235, 1, 0, 1,
-0.8762742, -0.7564312, -1.318541, 0.854902, 1, 0, 1,
-0.873018, -0.3329819, -2.708095, 0.8470588, 1, 0, 1,
-0.8700534, 0.02773708, -1.41194, 0.8431373, 1, 0, 1,
-0.8683603, -1.529542, -2.013955, 0.8352941, 1, 0, 1,
-0.8656264, -0.0818585, -1.969293, 0.8313726, 1, 0, 1,
-0.8652597, 1.652053, 1.164274, 0.8235294, 1, 0, 1,
-0.8549013, 1.272071, 0.8510441, 0.8196079, 1, 0, 1,
-0.8526958, 0.3006803, -0.1366783, 0.8117647, 1, 0, 1,
-0.8475432, 0.4729494, -1.102472, 0.8078431, 1, 0, 1,
-0.8312513, -1.175307, -2.64651, 0.8, 1, 0, 1,
-0.8306956, 0.08160467, -0.6847995, 0.7921569, 1, 0, 1,
-0.8277273, 0.1952669, -1.369619, 0.7882353, 1, 0, 1,
-0.8257107, -0.2630531, -2.005898, 0.7803922, 1, 0, 1,
-0.8187129, 0.7731507, -1.023122, 0.7764706, 1, 0, 1,
-0.8104383, 0.9342958, -1.399942, 0.7686275, 1, 0, 1,
-0.7993002, 1.040692, -0.2251722, 0.7647059, 1, 0, 1,
-0.7991395, -1.200085, -1.045864, 0.7568628, 1, 0, 1,
-0.7936542, 0.7431948, -0.5701108, 0.7529412, 1, 0, 1,
-0.7905092, -0.83053, -3.026874, 0.7450981, 1, 0, 1,
-0.7869623, -0.3544087, -2.163907, 0.7411765, 1, 0, 1,
-0.7827023, 0.7140324, -0.7429431, 0.7333333, 1, 0, 1,
-0.7767892, 0.6563902, -2.540118, 0.7294118, 1, 0, 1,
-0.7738202, -0.9474171, -2.409224, 0.7215686, 1, 0, 1,
-0.7683079, 1.137368, -0.4709631, 0.7176471, 1, 0, 1,
-0.7666898, 0.3645996, -3.123706, 0.7098039, 1, 0, 1,
-0.7655643, -1.464911, -3.711424, 0.7058824, 1, 0, 1,
-0.7626702, 0.3698981, -1.608168, 0.6980392, 1, 0, 1,
-0.7604985, -0.4205194, -1.797332, 0.6901961, 1, 0, 1,
-0.7603225, -0.8987734, -3.870358, 0.6862745, 1, 0, 1,
-0.7480471, 0.5081575, 0.4819067, 0.6784314, 1, 0, 1,
-0.7426601, -0.8134542, -2.598722, 0.6745098, 1, 0, 1,
-0.7408852, 1.413214, 0.6448277, 0.6666667, 1, 0, 1,
-0.7379609, 0.7912864, -0.9948122, 0.6627451, 1, 0, 1,
-0.736538, -0.674566, -1.485093, 0.654902, 1, 0, 1,
-0.7318358, 0.938145, -0.9427948, 0.6509804, 1, 0, 1,
-0.7260627, -1.176478, -3.089354, 0.6431373, 1, 0, 1,
-0.7247826, 0.2333192, -3.030415, 0.6392157, 1, 0, 1,
-0.7247365, -0.5814869, -2.608255, 0.6313726, 1, 0, 1,
-0.7234721, -1.531807, -3.19975, 0.627451, 1, 0, 1,
-0.7228524, 0.8337061, -0.2315338, 0.6196079, 1, 0, 1,
-0.7181281, 1.149747, -2.022269, 0.6156863, 1, 0, 1,
-0.7154183, 0.7832584, -1.093729, 0.6078432, 1, 0, 1,
-0.7151253, 0.5135447, -1.968315, 0.6039216, 1, 0, 1,
-0.7128773, 0.1467739, -2.646053, 0.5960785, 1, 0, 1,
-0.7121699, -0.9968826, -1.089452, 0.5882353, 1, 0, 1,
-0.710678, 2.70492, 1.935307, 0.5843138, 1, 0, 1,
-0.7103163, -0.5824879, -3.064876, 0.5764706, 1, 0, 1,
-0.7090811, -0.2800962, -1.107074, 0.572549, 1, 0, 1,
-0.7069978, 0.06439004, -1.346115, 0.5647059, 1, 0, 1,
-0.6947405, 2.461961, -1.677652, 0.5607843, 1, 0, 1,
-0.6942478, 0.394587, -1.684722, 0.5529412, 1, 0, 1,
-0.6921197, 0.5163058, -1.011799, 0.5490196, 1, 0, 1,
-0.6905038, 0.8004124, -0.5771604, 0.5411765, 1, 0, 1,
-0.6843336, -0.7472884, -0.7381778, 0.5372549, 1, 0, 1,
-0.6811086, -0.3949055, -2.813361, 0.5294118, 1, 0, 1,
-0.6741785, -0.9905036, -1.430882, 0.5254902, 1, 0, 1,
-0.6619498, -0.4056983, -2.973681, 0.5176471, 1, 0, 1,
-0.6591243, -0.222566, -3.639817, 0.5137255, 1, 0, 1,
-0.6521514, 1.881192, 0.697206, 0.5058824, 1, 0, 1,
-0.6511362, 0.5360875, -0.7148958, 0.5019608, 1, 0, 1,
-0.6510708, 0.15303, -0.4980594, 0.4941176, 1, 0, 1,
-0.6481379, 0.351202, -0.8633702, 0.4862745, 1, 0, 1,
-0.6454772, 0.6249999, -2.283795, 0.4823529, 1, 0, 1,
-0.6448394, 0.7839565, -1.095459, 0.4745098, 1, 0, 1,
-0.6419871, 1.618962, 0.4289443, 0.4705882, 1, 0, 1,
-0.6395199, -0.07847454, -1.327763, 0.4627451, 1, 0, 1,
-0.6393344, -0.835709, -3.99731, 0.4588235, 1, 0, 1,
-0.6393296, -0.4180597, -2.917916, 0.4509804, 1, 0, 1,
-0.6392659, -0.4707029, -2.393034, 0.4470588, 1, 0, 1,
-0.6361961, -0.2137411, -1.742576, 0.4392157, 1, 0, 1,
-0.6282681, 1.301851, -0.9534766, 0.4352941, 1, 0, 1,
-0.6271419, 0.0513185, 0.1295061, 0.427451, 1, 0, 1,
-0.6268421, -1.117913, -3.167937, 0.4235294, 1, 0, 1,
-0.6171108, -1.23021, -3.371704, 0.4156863, 1, 0, 1,
-0.6145995, -0.1457999, -2.365167, 0.4117647, 1, 0, 1,
-0.6134873, -0.8541793, -2.125619, 0.4039216, 1, 0, 1,
-0.6083316, 2.104718, -1.543401, 0.3960784, 1, 0, 1,
-0.607271, -0.9331649, -2.465572, 0.3921569, 1, 0, 1,
-0.6043665, -3.042382, -1.712878, 0.3843137, 1, 0, 1,
-0.6013054, -1.320528, -1.936161, 0.3803922, 1, 0, 1,
-0.5988182, 0.5358667, 0.129686, 0.372549, 1, 0, 1,
-0.5891734, -0.07358722, -0.6453694, 0.3686275, 1, 0, 1,
-0.5867911, -1.003696, -1.517056, 0.3607843, 1, 0, 1,
-0.5853261, -0.03889442, -1.346721, 0.3568628, 1, 0, 1,
-0.5847955, 1.995997, -1.116273, 0.3490196, 1, 0, 1,
-0.5835555, 0.813394, 0.2516423, 0.345098, 1, 0, 1,
-0.5805966, 1.010167, -1.55509, 0.3372549, 1, 0, 1,
-0.5798866, 0.5952554, 0.7861913, 0.3333333, 1, 0, 1,
-0.578627, -1.402406, -1.369178, 0.3254902, 1, 0, 1,
-0.5777919, 1.631995, -1.06085, 0.3215686, 1, 0, 1,
-0.5773585, 2.055869, -0.7647655, 0.3137255, 1, 0, 1,
-0.5764988, -1.338144, -4.27916, 0.3098039, 1, 0, 1,
-0.5713313, -0.4916086, -3.082947, 0.3019608, 1, 0, 1,
-0.5690929, -0.9223812, -2.144052, 0.2941177, 1, 0, 1,
-0.5679543, -1.9997, -2.845158, 0.2901961, 1, 0, 1,
-0.5637949, -0.6124668, -1.335623, 0.282353, 1, 0, 1,
-0.5506931, 1.092749, -1.114824, 0.2784314, 1, 0, 1,
-0.5475834, -0.647922, -3.629256, 0.2705882, 1, 0, 1,
-0.5423259, -1.378619, -1.6259, 0.2666667, 1, 0, 1,
-0.5418329, 0.2693061, -0.183548, 0.2588235, 1, 0, 1,
-0.5368413, 0.9445499, -0.4669834, 0.254902, 1, 0, 1,
-0.5216472, 0.3537582, -0.9997747, 0.2470588, 1, 0, 1,
-0.5202931, 0.3172394, -1.803449, 0.2431373, 1, 0, 1,
-0.5131191, 0.9498293, -2.961035, 0.2352941, 1, 0, 1,
-0.5066525, 1.096435, -0.1435694, 0.2313726, 1, 0, 1,
-0.5054796, 0.9855111, 0.7704308, 0.2235294, 1, 0, 1,
-0.5018871, 0.06695687, -2.812408, 0.2196078, 1, 0, 1,
-0.5015931, 1.323006, -0.1198106, 0.2117647, 1, 0, 1,
-0.500284, -0.7190584, -3.674788, 0.2078431, 1, 0, 1,
-0.5001351, -1.988042, -2.58695, 0.2, 1, 0, 1,
-0.4975151, 2.662158, 0.7968715, 0.1921569, 1, 0, 1,
-0.4935232, -0.08575962, -2.098281, 0.1882353, 1, 0, 1,
-0.4927441, -1.333282, -3.223743, 0.1803922, 1, 0, 1,
-0.4898881, -0.3181948, -2.06678, 0.1764706, 1, 0, 1,
-0.4885712, -0.5727903, -3.181566, 0.1686275, 1, 0, 1,
-0.4847409, -0.7654909, -3.566129, 0.1647059, 1, 0, 1,
-0.475028, 0.4608663, 0.3740552, 0.1568628, 1, 0, 1,
-0.4745516, 0.1958816, -1.183735, 0.1529412, 1, 0, 1,
-0.4627278, -0.3011706, -2.450949, 0.145098, 1, 0, 1,
-0.4616954, -1.305252, -0.9385856, 0.1411765, 1, 0, 1,
-0.4610428, 0.3680631, -2.102803, 0.1333333, 1, 0, 1,
-0.4609289, -0.7051245, -3.636757, 0.1294118, 1, 0, 1,
-0.4605977, -1.512856, -3.197049, 0.1215686, 1, 0, 1,
-0.4598332, 1.508104, 0.1738428, 0.1176471, 1, 0, 1,
-0.4592386, 0.3890322, -1.545521, 0.1098039, 1, 0, 1,
-0.4590145, 1.3733, -0.3421413, 0.1058824, 1, 0, 1,
-0.4549249, -0.7838191, -3.100623, 0.09803922, 1, 0, 1,
-0.4529996, -1.542119, -3.679731, 0.09019608, 1, 0, 1,
-0.4528136, -0.7923901, -2.397283, 0.08627451, 1, 0, 1,
-0.4514123, -0.814095, -2.016436, 0.07843138, 1, 0, 1,
-0.4463241, 1.302644, -1.509668, 0.07450981, 1, 0, 1,
-0.4420268, 0.7216412, -0.11475, 0.06666667, 1, 0, 1,
-0.4384293, 0.7649341, 0.608111, 0.0627451, 1, 0, 1,
-0.437338, -1.508044, -2.204966, 0.05490196, 1, 0, 1,
-0.4356514, 0.3888583, 0.1271492, 0.05098039, 1, 0, 1,
-0.430261, 0.7023484, -1.63191, 0.04313726, 1, 0, 1,
-0.4302034, -0.5895477, -3.348015, 0.03921569, 1, 0, 1,
-0.428851, -0.2106185, -2.427463, 0.03137255, 1, 0, 1,
-0.4266429, -2.099735, -2.703299, 0.02745098, 1, 0, 1,
-0.4241535, -0.2230813, -1.243041, 0.01960784, 1, 0, 1,
-0.423492, 0.4007828, -0.5008727, 0.01568628, 1, 0, 1,
-0.4231028, -1.170101, -2.916653, 0.007843138, 1, 0, 1,
-0.4211816, -0.7345626, -4.412602, 0.003921569, 1, 0, 1,
-0.4207723, -0.04128852, -0.5290682, 0, 1, 0.003921569, 1,
-0.4128482, 0.1435204, -1.14154, 0, 1, 0.01176471, 1,
-0.4107057, -0.27077, -0.5032161, 0, 1, 0.01568628, 1,
-0.408854, 1.518807, -1.491137, 0, 1, 0.02352941, 1,
-0.4050937, -0.5653141, -3.048695, 0, 1, 0.02745098, 1,
-0.403478, -0.9901425, -1.33911, 0, 1, 0.03529412, 1,
-0.399609, -3.405631, -2.107742, 0, 1, 0.03921569, 1,
-0.3948704, -0.1741165, -0.3943307, 0, 1, 0.04705882, 1,
-0.3943323, 0.9812297, 1.212496, 0, 1, 0.05098039, 1,
-0.3889371, -0.2824527, -3.048133, 0, 1, 0.05882353, 1,
-0.3884025, 1.954051, -0.06597324, 0, 1, 0.0627451, 1,
-0.3760632, 1.130959, -1.412979, 0, 1, 0.07058824, 1,
-0.3756204, 1.302677, 1.220485, 0, 1, 0.07450981, 1,
-0.370682, 0.8289008, -1.187361, 0, 1, 0.08235294, 1,
-0.3704929, -0.1305097, -1.211671, 0, 1, 0.08627451, 1,
-0.3691016, 1.560128, -1.179794, 0, 1, 0.09411765, 1,
-0.36807, -0.6061541, -2.961331, 0, 1, 0.1019608, 1,
-0.3680328, 2.438559, -0.4822752, 0, 1, 0.1058824, 1,
-0.3676146, -1.4846, -4.442746, 0, 1, 0.1137255, 1,
-0.3650962, 0.8233648, -1.404355, 0, 1, 0.1176471, 1,
-0.3597764, -0.8072644, -2.900654, 0, 1, 0.1254902, 1,
-0.351624, 1.061508, -0.1884288, 0, 1, 0.1294118, 1,
-0.3493766, 0.7912451, -0.5225415, 0, 1, 0.1372549, 1,
-0.3493201, -0.8681647, -3.738958, 0, 1, 0.1411765, 1,
-0.3420978, 0.4352491, -1.637425, 0, 1, 0.1490196, 1,
-0.3354234, 0.1666845, -1.310735, 0, 1, 0.1529412, 1,
-0.3353463, 1.414964, -0.3330012, 0, 1, 0.1607843, 1,
-0.3349929, -0.1826945, -1.011551, 0, 1, 0.1647059, 1,
-0.3340978, -0.4254223, -0.8629018, 0, 1, 0.172549, 1,
-0.3328834, 1.39054, 0.7591299, 0, 1, 0.1764706, 1,
-0.3325216, 0.8766463, -0.8875626, 0, 1, 0.1843137, 1,
-0.3301171, -0.2874457, -2.867028, 0, 1, 0.1882353, 1,
-0.3271628, 0.3347497, 0.988346, 0, 1, 0.1960784, 1,
-0.3238149, -0.101471, -2.522068, 0, 1, 0.2039216, 1,
-0.3222223, -0.702626, -1.559823, 0, 1, 0.2078431, 1,
-0.3178457, -0.3471191, -1.769457, 0, 1, 0.2156863, 1,
-0.3137165, -1.451072, -3.942951, 0, 1, 0.2196078, 1,
-0.3095578, 0.01019222, -2.090527, 0, 1, 0.227451, 1,
-0.3061847, 0.6844249, 0.4265692, 0, 1, 0.2313726, 1,
-0.302765, -0.04823824, -1.232486, 0, 1, 0.2392157, 1,
-0.2993392, -1.736141, -2.36116, 0, 1, 0.2431373, 1,
-0.2951302, 0.6236082, 0.1156358, 0, 1, 0.2509804, 1,
-0.2949141, 1.199831, 0.2555262, 0, 1, 0.254902, 1,
-0.2938429, 0.06743539, -0.07964098, 0, 1, 0.2627451, 1,
-0.2928801, -0.187104, -1.801468, 0, 1, 0.2666667, 1,
-0.2926552, 0.4234339, -1.153545, 0, 1, 0.2745098, 1,
-0.2853022, 0.132647, -2.954688, 0, 1, 0.2784314, 1,
-0.284422, -1.164637, -2.590839, 0, 1, 0.2862745, 1,
-0.2829153, -0.5482121, -2.336399, 0, 1, 0.2901961, 1,
-0.2821514, -0.4863379, -3.496569, 0, 1, 0.2980392, 1,
-0.2736555, -0.4464942, -2.570985, 0, 1, 0.3058824, 1,
-0.2709982, -0.1449242, -1.154853, 0, 1, 0.3098039, 1,
-0.2706415, -0.2436504, -4.262516, 0, 1, 0.3176471, 1,
-0.2684287, -0.1761824, -1.307522, 0, 1, 0.3215686, 1,
-0.2679532, -0.849441, -1.921754, 0, 1, 0.3294118, 1,
-0.2642184, 0.2949377, -0.1384471, 0, 1, 0.3333333, 1,
-0.2630403, 2.307991, 0.8362072, 0, 1, 0.3411765, 1,
-0.2577538, 1.319806, -2.169788, 0, 1, 0.345098, 1,
-0.2537209, 0.3757061, -1.60865, 0, 1, 0.3529412, 1,
-0.2531217, -2.00087, -4.908459, 0, 1, 0.3568628, 1,
-0.2479583, -0.5825572, -2.243456, 0, 1, 0.3647059, 1,
-0.2382033, 0.1426381, -2.710802, 0, 1, 0.3686275, 1,
-0.2377102, -0.5743961, -1.785047, 0, 1, 0.3764706, 1,
-0.2292383, -1.695599, -4.113427, 0, 1, 0.3803922, 1,
-0.2275869, 0.04800695, -1.189205, 0, 1, 0.3882353, 1,
-0.2265945, 0.297349, -0.6358587, 0, 1, 0.3921569, 1,
-0.2264392, -0.04886021, -1.806538, 0, 1, 0.4, 1,
-0.2261672, 1.310197, 0.5599473, 0, 1, 0.4078431, 1,
-0.2232961, 0.4815682, 0.9405321, 0, 1, 0.4117647, 1,
-0.2178145, -0.1744925, -2.369079, 0, 1, 0.4196078, 1,
-0.217624, -1.614824, -6.551363, 0, 1, 0.4235294, 1,
-0.2154332, 0.07539982, -0.9189149, 0, 1, 0.4313726, 1,
-0.2144913, -1.594563, -2.641048, 0, 1, 0.4352941, 1,
-0.2135612, 0.1395214, -1.712289, 0, 1, 0.4431373, 1,
-0.2115813, -0.1412501, -3.146114, 0, 1, 0.4470588, 1,
-0.2079957, 1.573892, 0.1393815, 0, 1, 0.454902, 1,
-0.2067765, -0.7233008, -2.584118, 0, 1, 0.4588235, 1,
-0.2037436, 0.2443925, -0.2830307, 0, 1, 0.4666667, 1,
-0.2035971, -0.6449356, -2.169907, 0, 1, 0.4705882, 1,
-0.2031679, -0.909901, -4.58232, 0, 1, 0.4784314, 1,
-0.1999074, -0.07794373, -2.860896, 0, 1, 0.4823529, 1,
-0.1933536, -0.1440804, -3.668921, 0, 1, 0.4901961, 1,
-0.1918007, -0.5816435, -3.267187, 0, 1, 0.4941176, 1,
-0.1915501, 0.5708396, -1.332126, 0, 1, 0.5019608, 1,
-0.1848085, 0.4716013, 0.0343241, 0, 1, 0.509804, 1,
-0.1832339, -0.9303499, -2.3938, 0, 1, 0.5137255, 1,
-0.1820059, 0.3473074, -2.458323, 0, 1, 0.5215687, 1,
-0.1808516, 0.2630429, -2.184955, 0, 1, 0.5254902, 1,
-0.1759009, -1.393135, -4.190839, 0, 1, 0.5333334, 1,
-0.1739943, -0.3952209, -3.20349, 0, 1, 0.5372549, 1,
-0.1725597, 0.5728421, -0.3884989, 0, 1, 0.5450981, 1,
-0.1716523, -1.547211, -3.627184, 0, 1, 0.5490196, 1,
-0.1710296, -1.140721, -3.698268, 0, 1, 0.5568628, 1,
-0.165194, 0.7308044, -0.390644, 0, 1, 0.5607843, 1,
-0.1620698, -0.4364712, -3.865644, 0, 1, 0.5686275, 1,
-0.1587559, -1.147984, -3.432797, 0, 1, 0.572549, 1,
-0.1576581, -0.2497009, -2.154326, 0, 1, 0.5803922, 1,
-0.1555567, 0.2899606, 0.07483966, 0, 1, 0.5843138, 1,
-0.1516328, 0.3943749, 0.3650704, 0, 1, 0.5921569, 1,
-0.1510454, -0.9234696, -3.822219, 0, 1, 0.5960785, 1,
-0.1491012, 1.206849, -0.2546402, 0, 1, 0.6039216, 1,
-0.1475145, -0.3121203, -2.107101, 0, 1, 0.6117647, 1,
-0.1470086, 0.3724746, -0.9122594, 0, 1, 0.6156863, 1,
-0.1466768, 0.1821846, -0.707817, 0, 1, 0.6235294, 1,
-0.1465713, -0.3861941, -2.373688, 0, 1, 0.627451, 1,
-0.143023, 0.6514485, -0.3272712, 0, 1, 0.6352941, 1,
-0.1423547, -0.3456717, -3.429137, 0, 1, 0.6392157, 1,
-0.141373, 0.7829652, -1.685403, 0, 1, 0.6470588, 1,
-0.1400788, -1.069592, -3.744431, 0, 1, 0.6509804, 1,
-0.1399919, -1.005224, -4.109128, 0, 1, 0.6588235, 1,
-0.1393594, -0.9362004, -4.029327, 0, 1, 0.6627451, 1,
-0.137621, 0.825727, 1.446958, 0, 1, 0.6705883, 1,
-0.1367426, -0.2892736, -2.140694, 0, 1, 0.6745098, 1,
-0.1361875, -0.7044863, -3.304974, 0, 1, 0.682353, 1,
-0.13496, 0.07537739, -0.7577062, 0, 1, 0.6862745, 1,
-0.1341201, -1.491077, -3.211661, 0, 1, 0.6941177, 1,
-0.1334829, 1.186351, 0.3393128, 0, 1, 0.7019608, 1,
-0.1307044, 1.585896, -0.09232333, 0, 1, 0.7058824, 1,
-0.1270671, -1.24109, -3.145611, 0, 1, 0.7137255, 1,
-0.1250526, -0.2717429, -3.015702, 0, 1, 0.7176471, 1,
-0.1239392, 0.9748754, -0.01916897, 0, 1, 0.7254902, 1,
-0.1143941, -0.08434867, -1.837142, 0, 1, 0.7294118, 1,
-0.1137323, 0.8167022, -0.7548691, 0, 1, 0.7372549, 1,
-0.1110354, -0.6338001, -4.533354, 0, 1, 0.7411765, 1,
-0.1093719, -0.006938172, -2.047085, 0, 1, 0.7490196, 1,
-0.1078665, -1.157907, -0.9148473, 0, 1, 0.7529412, 1,
-0.1038274, -0.534557, -2.288771, 0, 1, 0.7607843, 1,
-0.1020733, -1.710212, -2.934017, 0, 1, 0.7647059, 1,
-0.0994719, -2.501833, -1.66672, 0, 1, 0.772549, 1,
-0.09857466, 0.04202627, -0.389822, 0, 1, 0.7764706, 1,
-0.09794761, 1.531358, -0.07603897, 0, 1, 0.7843137, 1,
-0.09385769, 0.5011277, -0.05549449, 0, 1, 0.7882353, 1,
-0.09137961, 0.008515549, -1.126119, 0, 1, 0.7960784, 1,
-0.08696853, -0.4011949, -3.11516, 0, 1, 0.8039216, 1,
-0.08505547, 0.09728824, -0.4829655, 0, 1, 0.8078431, 1,
-0.07914191, 3.090913, 1.232635, 0, 1, 0.8156863, 1,
-0.07270532, -0.1436886, -2.411559, 0, 1, 0.8196079, 1,
-0.06993873, 0.1389753, -0.806042, 0, 1, 0.827451, 1,
-0.06984544, 0.6309116, -0.4912264, 0, 1, 0.8313726, 1,
-0.06771825, 0.05303435, -0.4385115, 0, 1, 0.8392157, 1,
-0.06708986, 0.1140483, -0.3243584, 0, 1, 0.8431373, 1,
-0.06618533, 0.1780039, -0.6348342, 0, 1, 0.8509804, 1,
-0.06175468, 0.961931, 0.2670197, 0, 1, 0.854902, 1,
-0.06126714, 0.003804944, -0.3003696, 0, 1, 0.8627451, 1,
-0.05347457, 0.781533, 0.2187778, 0, 1, 0.8666667, 1,
-0.05204568, 0.4181962, -1.38479, 0, 1, 0.8745098, 1,
-0.04948839, -0.1354759, -2.207193, 0, 1, 0.8784314, 1,
-0.04818061, 1.25126, -1.682009, 0, 1, 0.8862745, 1,
-0.04784783, -1.70355, -2.896495, 0, 1, 0.8901961, 1,
-0.03999351, -0.8528027, -2.212694, 0, 1, 0.8980392, 1,
-0.03715378, -0.3267518, -2.711752, 0, 1, 0.9058824, 1,
-0.03436852, 0.73475, 0.5495369, 0, 1, 0.9098039, 1,
-0.03275751, 0.3892849, 0.3413241, 0, 1, 0.9176471, 1,
-0.03115556, -0.8315299, -3.488876, 0, 1, 0.9215686, 1,
-0.02854191, -0.1214553, -3.204017, 0, 1, 0.9294118, 1,
-0.02744308, 1.297456, 1.540414, 0, 1, 0.9333333, 1,
-0.02664229, -0.7635732, -2.62543, 0, 1, 0.9411765, 1,
-0.0248767, -0.546914, -2.841724, 0, 1, 0.945098, 1,
-0.01868577, 0.1062403, 1.620216, 0, 1, 0.9529412, 1,
-0.01775515, -1.733922, -3.336624, 0, 1, 0.9568627, 1,
-0.01720147, -0.4447193, -3.493828, 0, 1, 0.9647059, 1,
-0.01175081, 0.06179061, 1.293827, 0, 1, 0.9686275, 1,
-0.01015229, 0.06229443, -0.04070936, 0, 1, 0.9764706, 1,
-0.01014037, -0.5532715, -2.441336, 0, 1, 0.9803922, 1,
-0.009465239, 0.4577509, 1.313693, 0, 1, 0.9882353, 1,
-0.006606741, -0.8736859, -4.316482, 0, 1, 0.9921569, 1,
-0.00574543, -0.4722292, -2.911354, 0, 1, 1, 1,
-0.0008134001, 1.501452, 0.04070541, 0, 0.9921569, 1, 1,
0.002408346, 0.7849839, -0.1392399, 0, 0.9882353, 1, 1,
0.00562668, -0.03266035, 3.990211, 0, 0.9803922, 1, 1,
0.00804894, 0.669378, -0.7879525, 0, 0.9764706, 1, 1,
0.01060665, -0.5779457, 3.271376, 0, 0.9686275, 1, 1,
0.01154855, 0.07954834, 1.068534, 0, 0.9647059, 1, 1,
0.0119998, -0.1822501, 3.046818, 0, 0.9568627, 1, 1,
0.01277437, 1.153691, 1.24013, 0, 0.9529412, 1, 1,
0.0151506, 0.8085024, -0.6524352, 0, 0.945098, 1, 1,
0.01818879, -0.4716851, 2.443194, 0, 0.9411765, 1, 1,
0.02013767, -0.4940691, 2.074907, 0, 0.9333333, 1, 1,
0.02275131, -0.8258508, 3.004358, 0, 0.9294118, 1, 1,
0.02338605, -0.04318317, 3.904295, 0, 0.9215686, 1, 1,
0.02435021, 0.8585833, 3.240716, 0, 0.9176471, 1, 1,
0.02554161, -1.526306, 2.348892, 0, 0.9098039, 1, 1,
0.02629727, 1.377938, -0.4921314, 0, 0.9058824, 1, 1,
0.02920457, 0.7159976, 0.7907289, 0, 0.8980392, 1, 1,
0.02947979, 1.157123, -0.6868748, 0, 0.8901961, 1, 1,
0.03175505, 0.8757143, 0.6993185, 0, 0.8862745, 1, 1,
0.03431477, -0.9135039, 2.316831, 0, 0.8784314, 1, 1,
0.03655186, -0.1354865, 2.90919, 0, 0.8745098, 1, 1,
0.04795373, 0.169554, -0.02871034, 0, 0.8666667, 1, 1,
0.04851636, 0.5302054, 0.8418262, 0, 0.8627451, 1, 1,
0.05040738, 0.1963401, 0.7020465, 0, 0.854902, 1, 1,
0.05463094, -0.02455328, 1.849816, 0, 0.8509804, 1, 1,
0.0547019, -0.7910776, 0.8134353, 0, 0.8431373, 1, 1,
0.05877588, -1.751096, 2.622255, 0, 0.8392157, 1, 1,
0.05935193, -1.718331, 1.731368, 0, 0.8313726, 1, 1,
0.05946209, 0.5926432, 0.01933159, 0, 0.827451, 1, 1,
0.0596095, 0.7978105, -0.5019358, 0, 0.8196079, 1, 1,
0.06376092, 1.21616, -0.6396692, 0, 0.8156863, 1, 1,
0.06507333, 1.100914, -0.7243809, 0, 0.8078431, 1, 1,
0.06575666, -2.443629, 4.53245, 0, 0.8039216, 1, 1,
0.06809087, 0.9875041, 0.1468203, 0, 0.7960784, 1, 1,
0.07112791, -0.3305117, 2.797364, 0, 0.7882353, 1, 1,
0.07163236, -0.0728205, 1.736896, 0, 0.7843137, 1, 1,
0.07248884, 0.9220968, 0.4549214, 0, 0.7764706, 1, 1,
0.07358305, 0.6094989, -1.500098, 0, 0.772549, 1, 1,
0.08027308, -0.771184, 3.104495, 0, 0.7647059, 1, 1,
0.08059093, 0.1844776, 0.2598035, 0, 0.7607843, 1, 1,
0.08687482, 0.2135233, 0.9334993, 0, 0.7529412, 1, 1,
0.08946323, -0.8857176, 2.571019, 0, 0.7490196, 1, 1,
0.09097832, 0.2791846, -1.069393, 0, 0.7411765, 1, 1,
0.09177021, -0.09510156, 2.042909, 0, 0.7372549, 1, 1,
0.09177113, 1.278847, 1.915393, 0, 0.7294118, 1, 1,
0.09370057, 0.2286908, -0.2404001, 0, 0.7254902, 1, 1,
0.09403515, 0.1762234, 0.9458072, 0, 0.7176471, 1, 1,
0.0969954, 0.6640514, -0.581461, 0, 0.7137255, 1, 1,
0.1064545, 3.168181, 1.459284, 0, 0.7058824, 1, 1,
0.1091669, -0.5664884, 1.128376, 0, 0.6980392, 1, 1,
0.1106433, 0.4281914, 0.9383368, 0, 0.6941177, 1, 1,
0.1115141, 0.007503527, 1.487641, 0, 0.6862745, 1, 1,
0.1119692, -0.09756568, 2.144129, 0, 0.682353, 1, 1,
0.1144185, 1.000699, 1.09126, 0, 0.6745098, 1, 1,
0.1221452, -0.5300328, 3.656176, 0, 0.6705883, 1, 1,
0.1225549, 1.178031, 0.08406784, 0, 0.6627451, 1, 1,
0.1233415, -0.07171602, 3.187852, 0, 0.6588235, 1, 1,
0.1244705, 0.7088138, 0.3772672, 0, 0.6509804, 1, 1,
0.1257941, -0.0223796, 1.932024, 0, 0.6470588, 1, 1,
0.1311915, 0.3039006, -0.8338023, 0, 0.6392157, 1, 1,
0.1335154, 1.877621, -0.05208351, 0, 0.6352941, 1, 1,
0.1369392, -1.642508, 3.487325, 0, 0.627451, 1, 1,
0.1375843, 0.6195352, 1.095739, 0, 0.6235294, 1, 1,
0.1396464, -0.56074, 1.409109, 0, 0.6156863, 1, 1,
0.1464217, 0.7005613, 0.8230149, 0, 0.6117647, 1, 1,
0.1465588, -0.02043125, 1.374555, 0, 0.6039216, 1, 1,
0.1543917, -0.3270176, 3.535413, 0, 0.5960785, 1, 1,
0.1548354, -0.4754647, 1.753211, 0, 0.5921569, 1, 1,
0.1602407, -0.756168, 3.054732, 0, 0.5843138, 1, 1,
0.1638237, 0.5384457, -1.559287, 0, 0.5803922, 1, 1,
0.1655142, 0.115763, 0.4401079, 0, 0.572549, 1, 1,
0.1702768, -2.119174, 3.20441, 0, 0.5686275, 1, 1,
0.1716045, 1.446803, -0.6375567, 0, 0.5607843, 1, 1,
0.1722852, 1.02228, -0.7459922, 0, 0.5568628, 1, 1,
0.1727002, 0.5275773, -0.6698565, 0, 0.5490196, 1, 1,
0.1738254, -0.3687786, 1.767258, 0, 0.5450981, 1, 1,
0.1765894, 1.59459, -0.8109978, 0, 0.5372549, 1, 1,
0.1800933, -0.4090899, 1.191273, 0, 0.5333334, 1, 1,
0.184201, -1.318152, 1.972734, 0, 0.5254902, 1, 1,
0.1883255, 0.5880356, -0.4926784, 0, 0.5215687, 1, 1,
0.1919799, -1.312938, 2.801823, 0, 0.5137255, 1, 1,
0.1929848, 2.090795, -0.2455428, 0, 0.509804, 1, 1,
0.1965224, -0.07787497, 4.220117, 0, 0.5019608, 1, 1,
0.2021657, -0.7637097, 2.585857, 0, 0.4941176, 1, 1,
0.2048789, 1.465661, 1.168539, 0, 0.4901961, 1, 1,
0.2071426, 0.185466, -0.4392992, 0, 0.4823529, 1, 1,
0.2072879, -1.684652, 3.159428, 0, 0.4784314, 1, 1,
0.2087891, -1.303535, 3.424481, 0, 0.4705882, 1, 1,
0.2118609, 0.7589032, 0.4698482, 0, 0.4666667, 1, 1,
0.212463, -0.9625981, 2.074322, 0, 0.4588235, 1, 1,
0.2131904, -0.9703683, 2.472312, 0, 0.454902, 1, 1,
0.2140524, -1.006493, 2.020647, 0, 0.4470588, 1, 1,
0.2173253, 0.4151179, -0.8606496, 0, 0.4431373, 1, 1,
0.2179401, 0.9575623, -0.391631, 0, 0.4352941, 1, 1,
0.2196041, -0.3418305, 4.370579, 0, 0.4313726, 1, 1,
0.2232064, 0.4701524, 1.614167, 0, 0.4235294, 1, 1,
0.2245617, -0.2189558, 2.399908, 0, 0.4196078, 1, 1,
0.2265136, 0.9776682, 1.76397, 0, 0.4117647, 1, 1,
0.2291891, -0.3336713, 2.50333, 0, 0.4078431, 1, 1,
0.2292645, -0.3786732, 3.413714, 0, 0.4, 1, 1,
0.2294324, -1.995878, 3.563393, 0, 0.3921569, 1, 1,
0.231211, -0.7411367, 4.213186, 0, 0.3882353, 1, 1,
0.235381, -2.28074, 3.185961, 0, 0.3803922, 1, 1,
0.2407919, -0.439466, 4.290242, 0, 0.3764706, 1, 1,
0.241381, 2.814431, 0.4190349, 0, 0.3686275, 1, 1,
0.2418673, -0.5300698, 4.277667, 0, 0.3647059, 1, 1,
0.241905, 0.8140526, 0.0985868, 0, 0.3568628, 1, 1,
0.2441898, 1.964864, 0.4752591, 0, 0.3529412, 1, 1,
0.2461421, -2.581627, 4.043775, 0, 0.345098, 1, 1,
0.246599, 0.3281406, 0.02355778, 0, 0.3411765, 1, 1,
0.2467044, 1.906308, -0.9724024, 0, 0.3333333, 1, 1,
0.250795, -0.03611004, 1.288891, 0, 0.3294118, 1, 1,
0.2539468, -0.03310949, 2.006735, 0, 0.3215686, 1, 1,
0.2565001, 0.1000194, 0.3538262, 0, 0.3176471, 1, 1,
0.2570132, 0.5478035, -2.096304, 0, 0.3098039, 1, 1,
0.2601915, -0.7064485, 2.375439, 0, 0.3058824, 1, 1,
0.2699515, -0.06846384, 2.383307, 0, 0.2980392, 1, 1,
0.2705191, -0.04197387, 1.883716, 0, 0.2901961, 1, 1,
0.2714441, -0.2175602, 2.176467, 0, 0.2862745, 1, 1,
0.2730666, 0.00755605, -0.02555507, 0, 0.2784314, 1, 1,
0.2790446, -2.599605, 3.833972, 0, 0.2745098, 1, 1,
0.2821907, 0.1294977, -0.5050927, 0, 0.2666667, 1, 1,
0.2854345, -1.002557, 3.100634, 0, 0.2627451, 1, 1,
0.2865938, -0.1502234, 2.008854, 0, 0.254902, 1, 1,
0.2884177, 0.4697254, 1.774522, 0, 0.2509804, 1, 1,
0.288547, 0.4231287, -0.2295001, 0, 0.2431373, 1, 1,
0.2892875, -0.8321041, 2.148179, 0, 0.2392157, 1, 1,
0.2898551, -0.3529486, 2.003427, 0, 0.2313726, 1, 1,
0.2961708, -0.4091302, 3.929901, 0, 0.227451, 1, 1,
0.2976393, -0.02805497, 1.43669, 0, 0.2196078, 1, 1,
0.3038751, 1.148805, -0.6441999, 0, 0.2156863, 1, 1,
0.3070824, -0.2485316, 2.063939, 0, 0.2078431, 1, 1,
0.3075833, 0.262163, 0.7147921, 0, 0.2039216, 1, 1,
0.3083246, 1.937276, 1.35505, 0, 0.1960784, 1, 1,
0.3090521, -0.4337149, 1.976617, 0, 0.1882353, 1, 1,
0.3124146, 0.5217938, 0.08454441, 0, 0.1843137, 1, 1,
0.3156631, 0.3905684, -0.2081684, 0, 0.1764706, 1, 1,
0.3159258, -0.08065567, 0.7944353, 0, 0.172549, 1, 1,
0.3161916, 1.193083, 0.3089159, 0, 0.1647059, 1, 1,
0.3173785, -0.5691546, 1.285722, 0, 0.1607843, 1, 1,
0.3178888, 1.196473, -0.3773786, 0, 0.1529412, 1, 1,
0.3184834, 1.109247, 0.3589173, 0, 0.1490196, 1, 1,
0.3185092, 0.3430197, -0.2307659, 0, 0.1411765, 1, 1,
0.32039, 1.704444, 0.4142824, 0, 0.1372549, 1, 1,
0.3245202, 0.3372352, 0.9442406, 0, 0.1294118, 1, 1,
0.3277415, -1.265675, 2.583983, 0, 0.1254902, 1, 1,
0.3277967, -1.36428, 2.299307, 0, 0.1176471, 1, 1,
0.3294524, -0.4184164, 2.542876, 0, 0.1137255, 1, 1,
0.3306707, 0.8304984, -0.3605111, 0, 0.1058824, 1, 1,
0.3333702, -1.318245, 2.747154, 0, 0.09803922, 1, 1,
0.3405119, 0.8250066, 0.842645, 0, 0.09411765, 1, 1,
0.3422786, 0.8296463, -0.6242776, 0, 0.08627451, 1, 1,
0.3433013, 1.162601, -0.8632089, 0, 0.08235294, 1, 1,
0.3467056, -0.4960494, 3.947428, 0, 0.07450981, 1, 1,
0.3514726, -1.211916, 1.274326, 0, 0.07058824, 1, 1,
0.3610847, -1.168584, 1.116394, 0, 0.0627451, 1, 1,
0.36468, -1.299217, 2.883575, 0, 0.05882353, 1, 1,
0.367655, -0.09315074, 3.224706, 0, 0.05098039, 1, 1,
0.3706846, -0.3561288, 2.203717, 0, 0.04705882, 1, 1,
0.3741407, 0.1820779, 1.340486, 0, 0.03921569, 1, 1,
0.3761469, 0.3688042, -1.584912, 0, 0.03529412, 1, 1,
0.3763491, -0.0108898, 1.425619, 0, 0.02745098, 1, 1,
0.3776619, -0.5334623, 3.064217, 0, 0.02352941, 1, 1,
0.3785718, -0.185546, 0.2175182, 0, 0.01568628, 1, 1,
0.3860985, -0.9587114, 1.58192, 0, 0.01176471, 1, 1,
0.3888661, 0.3641444, 0.2568228, 0, 0.003921569, 1, 1,
0.3888897, 1.212206, 0.1751447, 0.003921569, 0, 1, 1,
0.389903, -0.3083027, 2.351066, 0.007843138, 0, 1, 1,
0.3916383, -0.7410745, 2.266474, 0.01568628, 0, 1, 1,
0.3923593, 1.145272, -0.1768679, 0.01960784, 0, 1, 1,
0.3974152, -1.196006, 2.585196, 0.02745098, 0, 1, 1,
0.402233, -0.04376257, 1.980491, 0.03137255, 0, 1, 1,
0.4031991, -0.74036, 1.699301, 0.03921569, 0, 1, 1,
0.4034891, 1.152788, 0.1994255, 0.04313726, 0, 1, 1,
0.4035171, -0.9635721, 2.827551, 0.05098039, 0, 1, 1,
0.4037016, 1.022142, 1.368783, 0.05490196, 0, 1, 1,
0.4057195, -1.053021, 3.54015, 0.0627451, 0, 1, 1,
0.4077243, 0.6513214, 0.3842827, 0.06666667, 0, 1, 1,
0.4117254, -0.7335971, 2.997676, 0.07450981, 0, 1, 1,
0.4142996, 0.77338, 3.222778, 0.07843138, 0, 1, 1,
0.4179082, 1.180068, 2.033709, 0.08627451, 0, 1, 1,
0.424161, -0.04309582, 2.002964, 0.09019608, 0, 1, 1,
0.4292848, -1.230995, 3.24402, 0.09803922, 0, 1, 1,
0.4297012, 0.2657946, 1.134929, 0.1058824, 0, 1, 1,
0.4340432, -1.791056, 2.498262, 0.1098039, 0, 1, 1,
0.4394411, 0.1083794, 0.4294131, 0.1176471, 0, 1, 1,
0.439532, -0.7677492, 0.9260256, 0.1215686, 0, 1, 1,
0.4507042, -0.3434905, 1.891258, 0.1294118, 0, 1, 1,
0.4535933, -0.042302, 0.761556, 0.1333333, 0, 1, 1,
0.4546627, -0.3322542, 2.087914, 0.1411765, 0, 1, 1,
0.4553899, -2.695907, 4.037836, 0.145098, 0, 1, 1,
0.457063, -1.806404, 3.939384, 0.1529412, 0, 1, 1,
0.4639976, -0.7415094, 4.045395, 0.1568628, 0, 1, 1,
0.4744766, 0.6104755, 0.4066277, 0.1647059, 0, 1, 1,
0.4767562, 0.101555, 1.63214, 0.1686275, 0, 1, 1,
0.4769535, -0.4944125, 2.419045, 0.1764706, 0, 1, 1,
0.4781415, -0.1765165, 2.494966, 0.1803922, 0, 1, 1,
0.4786288, -1.066524, 1.21837, 0.1882353, 0, 1, 1,
0.4842926, 0.4950755, -0.09674206, 0.1921569, 0, 1, 1,
0.4939266, 1.016909, 0.1523296, 0.2, 0, 1, 1,
0.4948983, 0.4659745, 0.01401782, 0.2078431, 0, 1, 1,
0.4955485, -0.0288418, 0.7712722, 0.2117647, 0, 1, 1,
0.5015515, -0.3190519, 0.2572891, 0.2196078, 0, 1, 1,
0.5032142, 0.6029462, 0.1139802, 0.2235294, 0, 1, 1,
0.507133, -0.1118361, 1.10822, 0.2313726, 0, 1, 1,
0.5148017, 1.452812, -0.8828279, 0.2352941, 0, 1, 1,
0.521481, 1.729058, 0.9299971, 0.2431373, 0, 1, 1,
0.5219443, 0.2008965, 0.8257336, 0.2470588, 0, 1, 1,
0.5233864, 0.8321152, 1.80785, 0.254902, 0, 1, 1,
0.5330665, -0.01836601, 1.61477, 0.2588235, 0, 1, 1,
0.534468, -2.174372, 1.304323, 0.2666667, 0, 1, 1,
0.5376843, -1.105869, 3.317734, 0.2705882, 0, 1, 1,
0.5450844, -0.6229905, 2.25972, 0.2784314, 0, 1, 1,
0.5469519, 1.721995, -1.281515, 0.282353, 0, 1, 1,
0.5474436, -0.02738834, 2.10295, 0.2901961, 0, 1, 1,
0.5510367, 0.7150781, 0.4885942, 0.2941177, 0, 1, 1,
0.555914, 1.311127, 1.909585, 0.3019608, 0, 1, 1,
0.5590454, 0.8349804, 2.720445, 0.3098039, 0, 1, 1,
0.5596702, -1.046946, 1.330054, 0.3137255, 0, 1, 1,
0.5624396, -0.4630905, 0.6733695, 0.3215686, 0, 1, 1,
0.5668287, -0.6618647, 1.719592, 0.3254902, 0, 1, 1,
0.5675165, 0.2286557, 1.384304, 0.3333333, 0, 1, 1,
0.5841458, 1.038572, -0.7093263, 0.3372549, 0, 1, 1,
0.5862152, 0.7119198, 1.413298, 0.345098, 0, 1, 1,
0.5863383, 0.9431177, 0.1529807, 0.3490196, 0, 1, 1,
0.5889604, 0.8854538, 1.232837, 0.3568628, 0, 1, 1,
0.5974475, -0.1084471, 1.991942, 0.3607843, 0, 1, 1,
0.5987176, -0.246251, 4.656813, 0.3686275, 0, 1, 1,
0.6043305, -0.6121035, 2.063615, 0.372549, 0, 1, 1,
0.6076229, 1.268765, 0.210303, 0.3803922, 0, 1, 1,
0.6084579, 1.420026, -1.207607, 0.3843137, 0, 1, 1,
0.609699, -0.3312688, 2.064019, 0.3921569, 0, 1, 1,
0.6107521, 1.140592, 1.166575, 0.3960784, 0, 1, 1,
0.612502, 0.9164578, 0.7289456, 0.4039216, 0, 1, 1,
0.6169789, -1.029754, 0.3756704, 0.4117647, 0, 1, 1,
0.6223904, 1.017361, 0.9946488, 0.4156863, 0, 1, 1,
0.6245568, 0.3301323, 0.9750954, 0.4235294, 0, 1, 1,
0.6274723, -1.625676, 4.885253, 0.427451, 0, 1, 1,
0.6278214, -1.435301, 2.601345, 0.4352941, 0, 1, 1,
0.6289815, -0.132542, 1.699318, 0.4392157, 0, 1, 1,
0.6295596, 0.2035426, 0.7504881, 0.4470588, 0, 1, 1,
0.6325929, 0.4343437, -0.289086, 0.4509804, 0, 1, 1,
0.6371987, 0.06216333, 1.922047, 0.4588235, 0, 1, 1,
0.6384122, 0.1273383, 0.323411, 0.4627451, 0, 1, 1,
0.6416288, -0.2564147, 2.283674, 0.4705882, 0, 1, 1,
0.6457556, -1.512987, 5.053037, 0.4745098, 0, 1, 1,
0.650847, 0.3904551, 1.940267, 0.4823529, 0, 1, 1,
0.6563493, -1.111709, 2.055919, 0.4862745, 0, 1, 1,
0.6584314, 0.8707371, 0.8456073, 0.4941176, 0, 1, 1,
0.6585838, -0.09311736, 0.9639394, 0.5019608, 0, 1, 1,
0.6624681, 0.6531598, -0.4791544, 0.5058824, 0, 1, 1,
0.6650322, -0.9896176, 3.142363, 0.5137255, 0, 1, 1,
0.6671392, -0.8168045, 1.667302, 0.5176471, 0, 1, 1,
0.6707215, -1.491586, 3.248007, 0.5254902, 0, 1, 1,
0.6841856, -1.946689, 2.372153, 0.5294118, 0, 1, 1,
0.6881826, 0.6208436, 2.895949, 0.5372549, 0, 1, 1,
0.6885705, -0.1936906, 1.589528, 0.5411765, 0, 1, 1,
0.69608, 1.071647, -0.1875553, 0.5490196, 0, 1, 1,
0.6983279, 0.8841407, 0.5616054, 0.5529412, 0, 1, 1,
0.706259, 0.6698858, 0.7125367, 0.5607843, 0, 1, 1,
0.7141543, -0.5715454, 1.784149, 0.5647059, 0, 1, 1,
0.7153443, 0.2683798, 1.524491, 0.572549, 0, 1, 1,
0.7228786, -0.7853141, 2.27966, 0.5764706, 0, 1, 1,
0.7259304, -0.0194285, 1.382695, 0.5843138, 0, 1, 1,
0.7267886, -0.256446, 2.183082, 0.5882353, 0, 1, 1,
0.7279843, 0.8865563, -0.6209236, 0.5960785, 0, 1, 1,
0.7286342, -1.04629, 3.975346, 0.6039216, 0, 1, 1,
0.7305222, -0.2562717, 2.020394, 0.6078432, 0, 1, 1,
0.7349794, 0.539804, 1.996806, 0.6156863, 0, 1, 1,
0.7388144, 0.2017662, 2.383998, 0.6196079, 0, 1, 1,
0.7417979, 0.9871345, 0.9455447, 0.627451, 0, 1, 1,
0.7433669, -1.105589, 3.294643, 0.6313726, 0, 1, 1,
0.7449085, -0.5626441, 1.624831, 0.6392157, 0, 1, 1,
0.7489911, -0.1550236, 3.485616, 0.6431373, 0, 1, 1,
0.749779, 0.6378358, 0.6776908, 0.6509804, 0, 1, 1,
0.7535537, -1.341058, 1.555585, 0.654902, 0, 1, 1,
0.7543508, -0.779079, 1.049044, 0.6627451, 0, 1, 1,
0.7621015, 0.3270609, 0.44079, 0.6666667, 0, 1, 1,
0.7720158, 0.4773903, 0.2719417, 0.6745098, 0, 1, 1,
0.7760814, -0.4055009, 1.685589, 0.6784314, 0, 1, 1,
0.7764195, 0.2974039, 0.6384681, 0.6862745, 0, 1, 1,
0.7777632, 1.081314, 1.122605, 0.6901961, 0, 1, 1,
0.7807135, 0.3510832, 1.288745, 0.6980392, 0, 1, 1,
0.7877393, -0.8031904, 2.017163, 0.7058824, 0, 1, 1,
0.8024338, -0.3500205, 3.130278, 0.7098039, 0, 1, 1,
0.8039963, -2.064358, 2.951233, 0.7176471, 0, 1, 1,
0.8056082, 0.9440187, -0.05601249, 0.7215686, 0, 1, 1,
0.8064178, 0.7375257, 0.6955641, 0.7294118, 0, 1, 1,
0.8094262, 2.150182, 1.085207, 0.7333333, 0, 1, 1,
0.819519, -0.6484299, 2.05997, 0.7411765, 0, 1, 1,
0.8274012, 1.119293, 1.469889, 0.7450981, 0, 1, 1,
0.8305334, -1.035634, 1.277675, 0.7529412, 0, 1, 1,
0.8336979, -1.056484, 2.062995, 0.7568628, 0, 1, 1,
0.8359613, 0.05049676, 1.08507, 0.7647059, 0, 1, 1,
0.8442415, 0.3695934, 1.934197, 0.7686275, 0, 1, 1,
0.8447192, 1.715794, -0.7788044, 0.7764706, 0, 1, 1,
0.848981, -0.264001, 0.638822, 0.7803922, 0, 1, 1,
0.8577542, 0.03999721, 1.783322, 0.7882353, 0, 1, 1,
0.859906, 0.1707851, 0.348281, 0.7921569, 0, 1, 1,
0.8628648, -0.641892, 2.051033, 0.8, 0, 1, 1,
0.8642729, -0.5716004, 4.004426, 0.8078431, 0, 1, 1,
0.8655825, -1.586545, 3.135009, 0.8117647, 0, 1, 1,
0.8666101, 1.380352, 0.9536089, 0.8196079, 0, 1, 1,
0.8693106, -0.5040447, 3.52091, 0.8235294, 0, 1, 1,
0.8704628, 1.867793, 2.142204, 0.8313726, 0, 1, 1,
0.8705477, -0.6875798, 1.482566, 0.8352941, 0, 1, 1,
0.8709674, 0.6963263, 2.058665, 0.8431373, 0, 1, 1,
0.8764817, 0.06287283, 1.305938, 0.8470588, 0, 1, 1,
0.8768582, -0.8833063, 1.767263, 0.854902, 0, 1, 1,
0.8809835, -0.1310895, 1.002012, 0.8588235, 0, 1, 1,
0.8860214, -0.4354344, 1.860309, 0.8666667, 0, 1, 1,
0.8867958, 0.7532061, -0.03819725, 0.8705882, 0, 1, 1,
0.8883765, 0.6676316, 0.6914232, 0.8784314, 0, 1, 1,
0.8910685, 0.690707, 0.2059846, 0.8823529, 0, 1, 1,
0.8969098, 0.011913, 1.006507, 0.8901961, 0, 1, 1,
0.9012394, -0.1407674, 2.658019, 0.8941177, 0, 1, 1,
0.9048727, 1.215375, 1.369826, 0.9019608, 0, 1, 1,
0.9073834, -0.8556573, 0.5605748, 0.9098039, 0, 1, 1,
0.909313, 1.268895, 0.1276275, 0.9137255, 0, 1, 1,
0.9139534, 0.01781598, 1.05552, 0.9215686, 0, 1, 1,
0.9211047, -1.089085, 2.27951, 0.9254902, 0, 1, 1,
0.9253159, -2.163001, 1.376394, 0.9333333, 0, 1, 1,
0.9263565, -0.4317997, 2.104819, 0.9372549, 0, 1, 1,
0.9273583, -2.186566, 3.19223, 0.945098, 0, 1, 1,
0.9297695, -1.737776, 1.675787, 0.9490196, 0, 1, 1,
0.9314615, 1.090514, 0.836911, 0.9568627, 0, 1, 1,
0.9469548, 0.145761, 1.761249, 0.9607843, 0, 1, 1,
0.984078, -0.3001818, 1.930075, 0.9686275, 0, 1, 1,
0.9872047, 0.6993968, 1.072836, 0.972549, 0, 1, 1,
0.9882864, 1.615745, 0.9903833, 0.9803922, 0, 1, 1,
0.9896231, 0.9802945, 1.005964, 0.9843137, 0, 1, 1,
0.9944824, -0.6326886, 2.750145, 0.9921569, 0, 1, 1,
0.9971196, 0.5445313, 0.7931413, 0.9960784, 0, 1, 1,
1.003725, -0.03044826, 0.9520373, 1, 0, 0.9960784, 1,
1.007825, 0.1433547, 1.761633, 1, 0, 0.9882353, 1,
1.009462, -2.156045, 2.557109, 1, 0, 0.9843137, 1,
1.015674, 1.096882, 0.565982, 1, 0, 0.9764706, 1,
1.021033, -0.7123417, 1.462675, 1, 0, 0.972549, 1,
1.028684, 0.06625399, 1.745533, 1, 0, 0.9647059, 1,
1.038655, 0.9216068, 1.280817, 1, 0, 0.9607843, 1,
1.041663, -1.243639, 1.37511, 1, 0, 0.9529412, 1,
1.063203, 1.244826, 0.5578596, 1, 0, 0.9490196, 1,
1.066633, 0.1813446, 0.9235752, 1, 0, 0.9411765, 1,
1.071516, 0.3095922, 0.9763942, 1, 0, 0.9372549, 1,
1.072406, 0.3098803, 1.694016, 1, 0, 0.9294118, 1,
1.075606, 0.6035031, 0.04871245, 1, 0, 0.9254902, 1,
1.08041, -0.7146474, 1.355733, 1, 0, 0.9176471, 1,
1.088134, 0.04379708, 1.353609, 1, 0, 0.9137255, 1,
1.092188, 1.272968, 1.330936, 1, 0, 0.9058824, 1,
1.095686, -2.20464, 2.890198, 1, 0, 0.9019608, 1,
1.098522, -1.185746, 3.224961, 1, 0, 0.8941177, 1,
1.098768, 0.4480876, 1.719368, 1, 0, 0.8862745, 1,
1.105627, -0.5196144, 1.794773, 1, 0, 0.8823529, 1,
1.106422, -2.388094, 0.862551, 1, 0, 0.8745098, 1,
1.114114, 0.3303292, 2.328079, 1, 0, 0.8705882, 1,
1.121689, 1.197813, 0.2497881, 1, 0, 0.8627451, 1,
1.121964, 1.031337, 2.936652, 1, 0, 0.8588235, 1,
1.125596, 0.0004932308, 2.980021, 1, 0, 0.8509804, 1,
1.137562, 0.3224977, 1.293458, 1, 0, 0.8470588, 1,
1.140684, -0.4489392, 2.561017, 1, 0, 0.8392157, 1,
1.148295, -2.746473, 3.021792, 1, 0, 0.8352941, 1,
1.149433, 0.5959159, -0.03734986, 1, 0, 0.827451, 1,
1.151255, 2.101247, -0.690289, 1, 0, 0.8235294, 1,
1.152628, -0.6864995, 0.6538502, 1, 0, 0.8156863, 1,
1.153217, -0.5067285, 1.956913, 1, 0, 0.8117647, 1,
1.153625, -2.23672, 1.373833, 1, 0, 0.8039216, 1,
1.154158, -0.01065, 2.06199, 1, 0, 0.7960784, 1,
1.158152, -0.4911951, 1.346507, 1, 0, 0.7921569, 1,
1.17532, -1.126669, 0.8725162, 1, 0, 0.7843137, 1,
1.176141, -0.3048187, 2.007787, 1, 0, 0.7803922, 1,
1.179172, -0.5562267, 2.72415, 1, 0, 0.772549, 1,
1.182687, -1.007797, 2.855391, 1, 0, 0.7686275, 1,
1.197144, -0.7431174, 2.6745, 1, 0, 0.7607843, 1,
1.200306, -0.6398131, 0.6819128, 1, 0, 0.7568628, 1,
1.201433, 0.823559, 1.389741, 1, 0, 0.7490196, 1,
1.203979, -0.2376448, 2.091393, 1, 0, 0.7450981, 1,
1.20973, -1.821681, 4.395483, 1, 0, 0.7372549, 1,
1.213018, -0.1121715, 0.481125, 1, 0, 0.7333333, 1,
1.215906, 2.072451, 0.6119915, 1, 0, 0.7254902, 1,
1.223073, 1.077798, 1.629433, 1, 0, 0.7215686, 1,
1.226625, -0.3488176, 0.869615, 1, 0, 0.7137255, 1,
1.227598, 0.04540852, 1.23414, 1, 0, 0.7098039, 1,
1.229644, 1.023703, 1.719796, 1, 0, 0.7019608, 1,
1.234549, -2.664981, 4.680142, 1, 0, 0.6941177, 1,
1.246067, -1.547246, 0.8113117, 1, 0, 0.6901961, 1,
1.24932, 1.326173, 1.442622, 1, 0, 0.682353, 1,
1.252464, 1.144161, 0.3467441, 1, 0, 0.6784314, 1,
1.258018, -1.903215, 3.25028, 1, 0, 0.6705883, 1,
1.258731, -0.9191896, 0.9936299, 1, 0, 0.6666667, 1,
1.259348, 1.626393, -0.9916734, 1, 0, 0.6588235, 1,
1.268021, -1.404019, 2.703161, 1, 0, 0.654902, 1,
1.270149, 0.5949414, 0.6539074, 1, 0, 0.6470588, 1,
1.28233, -0.3346775, 1.658114, 1, 0, 0.6431373, 1,
1.290517, -0.2601328, 1.247991, 1, 0, 0.6352941, 1,
1.303415, 1.419291, 0.2093006, 1, 0, 0.6313726, 1,
1.312919, -0.5174087, 3.554187, 1, 0, 0.6235294, 1,
1.315388, -1.636536, 2.951442, 1, 0, 0.6196079, 1,
1.316243, 0.1863174, 1.9657, 1, 0, 0.6117647, 1,
1.327007, 1.618117, 2.016105, 1, 0, 0.6078432, 1,
1.327897, 1.237245, 1.34951, 1, 0, 0.6, 1,
1.33008, -0.2516645, 0.1708876, 1, 0, 0.5921569, 1,
1.332284, -0.2436108, 1.787683, 1, 0, 0.5882353, 1,
1.33538, 0.4684359, 1.872204, 1, 0, 0.5803922, 1,
1.33584, 0.6959671, 1.933758, 1, 0, 0.5764706, 1,
1.335951, -0.3838766, 1.670578, 1, 0, 0.5686275, 1,
1.33831, 0.3062023, 0.9969949, 1, 0, 0.5647059, 1,
1.341555, -1.02448, 2.094086, 1, 0, 0.5568628, 1,
1.348436, -0.2340183, 2.808579, 1, 0, 0.5529412, 1,
1.354047, 0.1544249, 1.526646, 1, 0, 0.5450981, 1,
1.374719, -0.152044, 2.438237, 1, 0, 0.5411765, 1,
1.375751, 1.610314, 1.866843, 1, 0, 0.5333334, 1,
1.378656, 1.339051, 2.014881, 1, 0, 0.5294118, 1,
1.383733, -0.5868914, 0.7902033, 1, 0, 0.5215687, 1,
1.386513, 1.360857, 1.543257, 1, 0, 0.5176471, 1,
1.390617, -0.1501757, 3.003314, 1, 0, 0.509804, 1,
1.393119, 0.5882333, 2.825715, 1, 0, 0.5058824, 1,
1.398825, -1.148479, 2.335835, 1, 0, 0.4980392, 1,
1.404602, -1.205282, 3.014809, 1, 0, 0.4901961, 1,
1.408258, 0.1750542, 2.126468, 1, 0, 0.4862745, 1,
1.408334, -0.07883368, 1.895677, 1, 0, 0.4784314, 1,
1.411153, 0.09645774, 1.845341, 1, 0, 0.4745098, 1,
1.420961, 2.307864, 0.496839, 1, 0, 0.4666667, 1,
1.42865, -0.9173865, 2.057989, 1, 0, 0.4627451, 1,
1.433689, 0.6234611, 1.904928, 1, 0, 0.454902, 1,
1.433709, 0.2754757, 0.1887757, 1, 0, 0.4509804, 1,
1.444461, -1.877002, 0.7487094, 1, 0, 0.4431373, 1,
1.467156, 0.05274816, 1.305216, 1, 0, 0.4392157, 1,
1.469813, -0.6597623, 2.579289, 1, 0, 0.4313726, 1,
1.471294, 1.368144, 1.111079, 1, 0, 0.427451, 1,
1.472828, 1.221498, 0.05198354, 1, 0, 0.4196078, 1,
1.494327, 0.5632029, 0.4845476, 1, 0, 0.4156863, 1,
1.510554, -0.5016456, 2.569854, 1, 0, 0.4078431, 1,
1.510776, 0.1968989, 1.526886, 1, 0, 0.4039216, 1,
1.524327, -1.027218, 1.469836, 1, 0, 0.3960784, 1,
1.53973, -0.402053, 2.71001, 1, 0, 0.3882353, 1,
1.540033, -0.2324819, 1.192815, 1, 0, 0.3843137, 1,
1.541444, 0.8086854, -0.07269182, 1, 0, 0.3764706, 1,
1.542985, 1.063058, 1.922058, 1, 0, 0.372549, 1,
1.543384, 0.629194, 2.436032, 1, 0, 0.3647059, 1,
1.549508, 0.01296376, 2.791458, 1, 0, 0.3607843, 1,
1.566427, 0.6549231, 0.486567, 1, 0, 0.3529412, 1,
1.584262, -0.9897006, 2.377903, 1, 0, 0.3490196, 1,
1.587905, -0.2765389, 0.3931342, 1, 0, 0.3411765, 1,
1.592933, -1.184738, -0.3124466, 1, 0, 0.3372549, 1,
1.597885, -0.6289431, 1.302357, 1, 0, 0.3294118, 1,
1.599193, 0.1739052, 1.836091, 1, 0, 0.3254902, 1,
1.605665, -0.2042359, 3.188661, 1, 0, 0.3176471, 1,
1.606195, -1.94689, 1.481739, 1, 0, 0.3137255, 1,
1.609656, 1.270653, 0.5645227, 1, 0, 0.3058824, 1,
1.621085, 0.6874853, 1.675134, 1, 0, 0.2980392, 1,
1.621512, 0.1609981, 1.530063, 1, 0, 0.2941177, 1,
1.63834, 0.7807487, 0.7616098, 1, 0, 0.2862745, 1,
1.645947, 0.8234271, 2.502181, 1, 0, 0.282353, 1,
1.647865, -0.09400763, 3.076357, 1, 0, 0.2745098, 1,
1.65335, 0.3224439, 1.771856, 1, 0, 0.2705882, 1,
1.656907, 0.08248373, 1.103062, 1, 0, 0.2627451, 1,
1.676498, -0.8478626, 2.171472, 1, 0, 0.2588235, 1,
1.699856, 0.06383994, 3.304477, 1, 0, 0.2509804, 1,
1.724005, -1.951256, 1.696415, 1, 0, 0.2470588, 1,
1.727303, -0.4550699, 1.499156, 1, 0, 0.2392157, 1,
1.75347, 0.3901061, 2.388604, 1, 0, 0.2352941, 1,
1.778674, 2.561589, 0.9688316, 1, 0, 0.227451, 1,
1.778866, 1.994295, 0.7040758, 1, 0, 0.2235294, 1,
1.782388, -0.2457428, 1.411162, 1, 0, 0.2156863, 1,
1.79439, 0.1077012, -0.4025494, 1, 0, 0.2117647, 1,
1.800159, -0.2785149, 2.779675, 1, 0, 0.2039216, 1,
1.80524, 1.548238, 1.439767, 1, 0, 0.1960784, 1,
1.80941, -0.4786725, 3.191487, 1, 0, 0.1921569, 1,
1.818066, -1.140091, 1.72224, 1, 0, 0.1843137, 1,
1.830352, -1.096202, 1.286729, 1, 0, 0.1803922, 1,
1.833781, -0.181747, 3.625794, 1, 0, 0.172549, 1,
1.853848, -0.1678512, 1.420227, 1, 0, 0.1686275, 1,
1.85402, 0.01362502, 2.597792, 1, 0, 0.1607843, 1,
1.860503, 0.5021616, 1.73442, 1, 0, 0.1568628, 1,
1.927005, -1.471033, 1.394688, 1, 0, 0.1490196, 1,
1.947504, 1.533345, 0.2631494, 1, 0, 0.145098, 1,
1.952449, 0.1059697, 2.328773, 1, 0, 0.1372549, 1,
1.987466, -2.285565, 4.0573, 1, 0, 0.1333333, 1,
1.994616, -0.1450379, 1.617348, 1, 0, 0.1254902, 1,
2.017352, 0.6528967, 2.884544, 1, 0, 0.1215686, 1,
2.021171, -0.6987642, -0.2027102, 1, 0, 0.1137255, 1,
2.026044, -0.1706719, 1.283246, 1, 0, 0.1098039, 1,
2.036264, -0.8848748, 2.078078, 1, 0, 0.1019608, 1,
2.060524, -1.014215, 4.162753, 1, 0, 0.09411765, 1,
2.09545, 1.649153, -0.9599103, 1, 0, 0.09019608, 1,
2.101985, -2.479091, 2.996615, 1, 0, 0.08235294, 1,
2.123576, 0.3749361, 1.430402, 1, 0, 0.07843138, 1,
2.139786, 0.4230373, 1.541175, 1, 0, 0.07058824, 1,
2.229344, 1.906231, -0.2421538, 1, 0, 0.06666667, 1,
2.251266, 1.297911, 1.131326, 1, 0, 0.05882353, 1,
2.338373, 1.256683, 1.168739, 1, 0, 0.05490196, 1,
2.341892, 0.2216504, 1.062624, 1, 0, 0.04705882, 1,
2.407536, 1.953153, 1.661508, 1, 0, 0.04313726, 1,
2.425833, -1.771677, 1.264845, 1, 0, 0.03529412, 1,
2.506511, -0.4280617, 2.493264, 1, 0, 0.03137255, 1,
2.716642, 0.3866134, 3.906222, 1, 0, 0.02352941, 1,
2.718973, -0.02020243, 2.186287, 1, 0, 0.01960784, 1,
2.823682, 0.704743, 1.268298, 1, 0, 0.01176471, 1,
2.899616, 0.09083726, 1.547343, 1, 0, 0.007843138, 1
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
-0.05712342, -4.519892, -8.518309, 0, -0.5, 0.5, 0.5,
-0.05712342, -4.519892, -8.518309, 1, -0.5, 0.5, 0.5,
-0.05712342, -4.519892, -8.518309, 1, 1.5, 0.5, 0.5,
-0.05712342, -4.519892, -8.518309, 0, 1.5, 0.5, 0.5
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
-4.016197, -0.1187247, -8.518309, 0, -0.5, 0.5, 0.5,
-4.016197, -0.1187247, -8.518309, 1, -0.5, 0.5, 0.5,
-4.016197, -0.1187247, -8.518309, 1, 1.5, 0.5, 0.5,
-4.016197, -0.1187247, -8.518309, 0, 1.5, 0.5, 0.5
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
-4.016197, -4.519892, -0.7491632, 0, -0.5, 0.5, 0.5,
-4.016197, -4.519892, -0.7491632, 1, -0.5, 0.5, 0.5,
-4.016197, -4.519892, -0.7491632, 1, 1.5, 0.5, 0.5,
-4.016197, -4.519892, -0.7491632, 0, 1.5, 0.5, 0.5
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
-3, -3.504238, -6.725429,
2, -3.504238, -6.725429,
-3, -3.504238, -6.725429,
-3, -3.673514, -7.024242,
-2, -3.504238, -6.725429,
-2, -3.673514, -7.024242,
-1, -3.504238, -6.725429,
-1, -3.673514, -7.024242,
0, -3.504238, -6.725429,
0, -3.673514, -7.024242,
1, -3.504238, -6.725429,
1, -3.673514, -7.024242,
2, -3.504238, -6.725429,
2, -3.673514, -7.024242
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
-3, -4.012065, -7.621869, 0, -0.5, 0.5, 0.5,
-3, -4.012065, -7.621869, 1, -0.5, 0.5, 0.5,
-3, -4.012065, -7.621869, 1, 1.5, 0.5, 0.5,
-3, -4.012065, -7.621869, 0, 1.5, 0.5, 0.5,
-2, -4.012065, -7.621869, 0, -0.5, 0.5, 0.5,
-2, -4.012065, -7.621869, 1, -0.5, 0.5, 0.5,
-2, -4.012065, -7.621869, 1, 1.5, 0.5, 0.5,
-2, -4.012065, -7.621869, 0, 1.5, 0.5, 0.5,
-1, -4.012065, -7.621869, 0, -0.5, 0.5, 0.5,
-1, -4.012065, -7.621869, 1, -0.5, 0.5, 0.5,
-1, -4.012065, -7.621869, 1, 1.5, 0.5, 0.5,
-1, -4.012065, -7.621869, 0, 1.5, 0.5, 0.5,
0, -4.012065, -7.621869, 0, -0.5, 0.5, 0.5,
0, -4.012065, -7.621869, 1, -0.5, 0.5, 0.5,
0, -4.012065, -7.621869, 1, 1.5, 0.5, 0.5,
0, -4.012065, -7.621869, 0, 1.5, 0.5, 0.5,
1, -4.012065, -7.621869, 0, -0.5, 0.5, 0.5,
1, -4.012065, -7.621869, 1, -0.5, 0.5, 0.5,
1, -4.012065, -7.621869, 1, 1.5, 0.5, 0.5,
1, -4.012065, -7.621869, 0, 1.5, 0.5, 0.5,
2, -4.012065, -7.621869, 0, -0.5, 0.5, 0.5,
2, -4.012065, -7.621869, 1, -0.5, 0.5, 0.5,
2, -4.012065, -7.621869, 1, 1.5, 0.5, 0.5,
2, -4.012065, -7.621869, 0, 1.5, 0.5, 0.5
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
-3.102565, -3, -6.725429,
-3.102565, 3, -6.725429,
-3.102565, -3, -6.725429,
-3.254837, -3, -7.024242,
-3.102565, -2, -6.725429,
-3.254837, -2, -7.024242,
-3.102565, -1, -6.725429,
-3.254837, -1, -7.024242,
-3.102565, 0, -6.725429,
-3.254837, 0, -7.024242,
-3.102565, 1, -6.725429,
-3.254837, 1, -7.024242,
-3.102565, 2, -6.725429,
-3.254837, 2, -7.024242,
-3.102565, 3, -6.725429,
-3.254837, 3, -7.024242
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
-3.559381, -3, -7.621869, 0, -0.5, 0.5, 0.5,
-3.559381, -3, -7.621869, 1, -0.5, 0.5, 0.5,
-3.559381, -3, -7.621869, 1, 1.5, 0.5, 0.5,
-3.559381, -3, -7.621869, 0, 1.5, 0.5, 0.5,
-3.559381, -2, -7.621869, 0, -0.5, 0.5, 0.5,
-3.559381, -2, -7.621869, 1, -0.5, 0.5, 0.5,
-3.559381, -2, -7.621869, 1, 1.5, 0.5, 0.5,
-3.559381, -2, -7.621869, 0, 1.5, 0.5, 0.5,
-3.559381, -1, -7.621869, 0, -0.5, 0.5, 0.5,
-3.559381, -1, -7.621869, 1, -0.5, 0.5, 0.5,
-3.559381, -1, -7.621869, 1, 1.5, 0.5, 0.5,
-3.559381, -1, -7.621869, 0, 1.5, 0.5, 0.5,
-3.559381, 0, -7.621869, 0, -0.5, 0.5, 0.5,
-3.559381, 0, -7.621869, 1, -0.5, 0.5, 0.5,
-3.559381, 0, -7.621869, 1, 1.5, 0.5, 0.5,
-3.559381, 0, -7.621869, 0, 1.5, 0.5, 0.5,
-3.559381, 1, -7.621869, 0, -0.5, 0.5, 0.5,
-3.559381, 1, -7.621869, 1, -0.5, 0.5, 0.5,
-3.559381, 1, -7.621869, 1, 1.5, 0.5, 0.5,
-3.559381, 1, -7.621869, 0, 1.5, 0.5, 0.5,
-3.559381, 2, -7.621869, 0, -0.5, 0.5, 0.5,
-3.559381, 2, -7.621869, 1, -0.5, 0.5, 0.5,
-3.559381, 2, -7.621869, 1, 1.5, 0.5, 0.5,
-3.559381, 2, -7.621869, 0, 1.5, 0.5, 0.5,
-3.559381, 3, -7.621869, 0, -0.5, 0.5, 0.5,
-3.559381, 3, -7.621869, 1, -0.5, 0.5, 0.5,
-3.559381, 3, -7.621869, 1, 1.5, 0.5, 0.5,
-3.559381, 3, -7.621869, 0, 1.5, 0.5, 0.5
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
-3.102565, -3.504238, -6,
-3.102565, -3.504238, 4,
-3.102565, -3.504238, -6,
-3.254837, -3.673514, -6,
-3.102565, -3.504238, -4,
-3.254837, -3.673514, -4,
-3.102565, -3.504238, -2,
-3.254837, -3.673514, -2,
-3.102565, -3.504238, 0,
-3.254837, -3.673514, 0,
-3.102565, -3.504238, 2,
-3.254837, -3.673514, 2,
-3.102565, -3.504238, 4,
-3.254837, -3.673514, 4
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
-3.559381, -4.012065, -6, 0, -0.5, 0.5, 0.5,
-3.559381, -4.012065, -6, 1, -0.5, 0.5, 0.5,
-3.559381, -4.012065, -6, 1, 1.5, 0.5, 0.5,
-3.559381, -4.012065, -6, 0, 1.5, 0.5, 0.5,
-3.559381, -4.012065, -4, 0, -0.5, 0.5, 0.5,
-3.559381, -4.012065, -4, 1, -0.5, 0.5, 0.5,
-3.559381, -4.012065, -4, 1, 1.5, 0.5, 0.5,
-3.559381, -4.012065, -4, 0, 1.5, 0.5, 0.5,
-3.559381, -4.012065, -2, 0, -0.5, 0.5, 0.5,
-3.559381, -4.012065, -2, 1, -0.5, 0.5, 0.5,
-3.559381, -4.012065, -2, 1, 1.5, 0.5, 0.5,
-3.559381, -4.012065, -2, 0, 1.5, 0.5, 0.5,
-3.559381, -4.012065, 0, 0, -0.5, 0.5, 0.5,
-3.559381, -4.012065, 0, 1, -0.5, 0.5, 0.5,
-3.559381, -4.012065, 0, 1, 1.5, 0.5, 0.5,
-3.559381, -4.012065, 0, 0, 1.5, 0.5, 0.5,
-3.559381, -4.012065, 2, 0, -0.5, 0.5, 0.5,
-3.559381, -4.012065, 2, 1, -0.5, 0.5, 0.5,
-3.559381, -4.012065, 2, 1, 1.5, 0.5, 0.5,
-3.559381, -4.012065, 2, 0, 1.5, 0.5, 0.5,
-3.559381, -4.012065, 4, 0, -0.5, 0.5, 0.5,
-3.559381, -4.012065, 4, 1, -0.5, 0.5, 0.5,
-3.559381, -4.012065, 4, 1, 1.5, 0.5, 0.5,
-3.559381, -4.012065, 4, 0, 1.5, 0.5, 0.5
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
-3.102565, -3.504238, -6.725429,
-3.102565, 3.266789, -6.725429,
-3.102565, -3.504238, 5.227103,
-3.102565, 3.266789, 5.227103,
-3.102565, -3.504238, -6.725429,
-3.102565, -3.504238, 5.227103,
-3.102565, 3.266789, -6.725429,
-3.102565, 3.266789, 5.227103,
-3.102565, -3.504238, -6.725429,
2.988318, -3.504238, -6.725429,
-3.102565, -3.504238, 5.227103,
2.988318, -3.504238, 5.227103,
-3.102565, 3.266789, -6.725429,
2.988318, 3.266789, -6.725429,
-3.102565, 3.266789, 5.227103,
2.988318, 3.266789, 5.227103,
2.988318, -3.504238, -6.725429,
2.988318, 3.266789, -6.725429,
2.988318, -3.504238, 5.227103,
2.988318, 3.266789, 5.227103,
2.988318, -3.504238, -6.725429,
2.988318, -3.504238, 5.227103,
2.988318, 3.266789, -6.725429,
2.988318, 3.266789, 5.227103
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
var radius = 8.024089;
var distance = 35.70008;
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
mvMatrix.translate( 0.05712342, 0.1187247, 0.7491632 );
mvMatrix.scale( 1.424392, 1.281313, 0.7258548 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.70008);
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
fenamidone<-read.table("fenamidone.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fenamidone$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenamidone' not found
```

```r
y<-fenamidone$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenamidone' not found
```

```r
z<-fenamidone$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenamidone' not found
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
-3.013862, -0.9545033, -2.040561, 0, 0, 1, 1, 1,
-3.007573, -1.61676, -3.167559, 1, 0, 0, 1, 1,
-2.9369, 1.879693, -1.26296, 1, 0, 0, 1, 1,
-2.768952, -0.008425504, 0.2645719, 1, 0, 0, 1, 1,
-2.713533, -0.8393291, -1.204107, 1, 0, 0, 1, 1,
-2.660707, 0.095626, -0.5557709, 1, 0, 0, 1, 1,
-2.609554, 0.6140567, -0.7702475, 0, 0, 0, 1, 1,
-2.560826, -1.541135, -4.201795, 0, 0, 0, 1, 1,
-2.560526, 0.6352103, -2.025767, 0, 0, 0, 1, 1,
-2.534969, -0.1386007, -1.817332, 0, 0, 0, 1, 1,
-2.438786, 2.320153, -1.025604, 0, 0, 0, 1, 1,
-2.391295, -0.170016, -0.8455793, 0, 0, 0, 1, 1,
-2.368669, 0.3951857, -1.438978, 0, 0, 0, 1, 1,
-2.361907, -0.3500686, -0.3804287, 1, 1, 1, 1, 1,
-2.336357, -0.4074503, -2.463798, 1, 1, 1, 1, 1,
-2.311887, 0.701085, -0.6406644, 1, 1, 1, 1, 1,
-2.284097, -0.27255, -3.418067, 1, 1, 1, 1, 1,
-2.281384, 0.1768763, -1.525634, 1, 1, 1, 1, 1,
-2.265138, 0.02663434, -2.049311, 1, 1, 1, 1, 1,
-2.200231, -0.3392186, -2.202024, 1, 1, 1, 1, 1,
-2.044062, -0.01926277, -2.898115, 1, 1, 1, 1, 1,
-1.991312, -0.3015646, -1.681314, 1, 1, 1, 1, 1,
-1.990185, -0.9047512, -1.809983, 1, 1, 1, 1, 1,
-1.979404, -0.4811524, -0.7391902, 1, 1, 1, 1, 1,
-1.929741, 0.5245957, -1.629635, 1, 1, 1, 1, 1,
-1.925645, -0.4494304, -3.143987, 1, 1, 1, 1, 1,
-1.925064, 1.963537, -0.01825699, 1, 1, 1, 1, 1,
-1.899607, 0.1721998, -1.241065, 1, 1, 1, 1, 1,
-1.881274, -0.2367804, -0.5395272, 0, 0, 1, 1, 1,
-1.837159, -0.9653125, -2.587703, 1, 0, 0, 1, 1,
-1.830758, -0.3281216, 0.7353811, 1, 0, 0, 1, 1,
-1.823076, -0.2976885, -2.134751, 1, 0, 0, 1, 1,
-1.810925, 0.08812693, -0.5226187, 1, 0, 0, 1, 1,
-1.796434, -0.4604854, 0.4049255, 1, 0, 0, 1, 1,
-1.771453, 0.00489223, -2.962256, 0, 0, 0, 1, 1,
-1.758283, 0.9854138, -0.960734, 0, 0, 0, 1, 1,
-1.739532, 0.6097867, 1.666652, 0, 0, 0, 1, 1,
-1.729719, 0.0995857, -1.581671, 0, 0, 0, 1, 1,
-1.702477, -0.9313889, -2.503283, 0, 0, 0, 1, 1,
-1.698992, 0.3377661, -0.9910984, 0, 0, 0, 1, 1,
-1.681591, 0.8288776, 0.04674576, 0, 0, 0, 1, 1,
-1.66712, -0.1136144, 1.122797, 1, 1, 1, 1, 1,
-1.659716, 1.228737, -1.290045, 1, 1, 1, 1, 1,
-1.637643, -0.5598079, -1.491182, 1, 1, 1, 1, 1,
-1.635768, 1.899005, -1.803888, 1, 1, 1, 1, 1,
-1.620816, -1.15128, -2.776476, 1, 1, 1, 1, 1,
-1.616512, -1.109693, -0.4192659, 1, 1, 1, 1, 1,
-1.611309, 1.820138, -2.709057, 1, 1, 1, 1, 1,
-1.599568, -0.09481744, -1.334387, 1, 1, 1, 1, 1,
-1.599024, 0.8499221, -0.8028957, 1, 1, 1, 1, 1,
-1.590114, -1.264842, -2.2122, 1, 1, 1, 1, 1,
-1.589371, -0.3850433, -1.27879, 1, 1, 1, 1, 1,
-1.583431, 0.2571241, -3.394877, 1, 1, 1, 1, 1,
-1.55798, -1.300084, -2.948222, 1, 1, 1, 1, 1,
-1.549852, -0.006269651, -1.036698, 1, 1, 1, 1, 1,
-1.54728, -0.1488484, -1.544748, 1, 1, 1, 1, 1,
-1.545082, -0.8723578, -1.968061, 0, 0, 1, 1, 1,
-1.542722, -0.8171204, -1.892247, 1, 0, 0, 1, 1,
-1.542658, -1.622788, -2.625538, 1, 0, 0, 1, 1,
-1.539241, -0.6023459, -2.330364, 1, 0, 0, 1, 1,
-1.534773, 0.01881555, -0.8485312, 1, 0, 0, 1, 1,
-1.520514, 1.365666, -0.6988993, 1, 0, 0, 1, 1,
-1.509794, -1.719104, -2.569791, 0, 0, 0, 1, 1,
-1.509649, -0.009621535, -1.360303, 0, 0, 0, 1, 1,
-1.502, -1.220887, -3.892135, 0, 0, 0, 1, 1,
-1.496326, 1.953615, 1.106654, 0, 0, 0, 1, 1,
-1.490138, 0.7955636, -1.222998, 0, 0, 0, 1, 1,
-1.474686, -0.2297394, -0.817932, 0, 0, 0, 1, 1,
-1.462435, -0.2057181, -1.751098, 0, 0, 0, 1, 1,
-1.462116, -0.675736, -0.5861561, 1, 1, 1, 1, 1,
-1.432943, -1.386878, -4.594209, 1, 1, 1, 1, 1,
-1.431916, -0.2389722, -2.069299, 1, 1, 1, 1, 1,
-1.410366, 1.237244, -1.014082, 1, 1, 1, 1, 1,
-1.408717, 0.8856956, -0.881565, 1, 1, 1, 1, 1,
-1.404413, -1.204782, -1.698125, 1, 1, 1, 1, 1,
-1.398086, -0.02847798, -1.285178, 1, 1, 1, 1, 1,
-1.390943, 0.1291692, -1.263868, 1, 1, 1, 1, 1,
-1.390174, -1.102081, -3.223886, 1, 1, 1, 1, 1,
-1.38512, -0.1936557, -2.341497, 1, 1, 1, 1, 1,
-1.369827, -0.369354, -2.406843, 1, 1, 1, 1, 1,
-1.369623, 1.185799, -1.30034, 1, 1, 1, 1, 1,
-1.36376, -0.1096632, -1.726934, 1, 1, 1, 1, 1,
-1.358345, 0.1999968, 0.5796081, 1, 1, 1, 1, 1,
-1.354139, 1.20304, -0.04133605, 1, 1, 1, 1, 1,
-1.349456, 1.182504, 0.2901706, 0, 0, 1, 1, 1,
-1.314905, 0.1593482, -0.5328102, 1, 0, 0, 1, 1,
-1.30374, -0.6578098, -2.896974, 1, 0, 0, 1, 1,
-1.292987, -0.4050962, -2.420399, 1, 0, 0, 1, 1,
-1.292757, -1.480819, -2.774356, 1, 0, 0, 1, 1,
-1.289514, 0.8889056, -0.9029653, 1, 0, 0, 1, 1,
-1.288429, 0.8393244, -0.2908787, 0, 0, 0, 1, 1,
-1.280777, 1.606809, -1.629054, 0, 0, 0, 1, 1,
-1.279825, -1.429973, -3.024026, 0, 0, 0, 1, 1,
-1.260566, 1.240848, -1.435565, 0, 0, 0, 1, 1,
-1.25899, -0.2456442, -1.814527, 0, 0, 0, 1, 1,
-1.256482, 0.6131089, 0.1844153, 0, 0, 0, 1, 1,
-1.247077, -0.4625291, -2.383042, 0, 0, 0, 1, 1,
-1.243673, -0.7857228, -1.060419, 1, 1, 1, 1, 1,
-1.23755, -1.650219, -1.566567, 1, 1, 1, 1, 1,
-1.237223, -1.289034, -2.11029, 1, 1, 1, 1, 1,
-1.228511, 2.475877, -1.110834, 1, 1, 1, 1, 1,
-1.225778, 0.279879, -1.24165, 1, 1, 1, 1, 1,
-1.225415, -0.004745216, -2.905361, 1, 1, 1, 1, 1,
-1.216234, -0.2780883, -2.587956, 1, 1, 1, 1, 1,
-1.202943, 2.473336, -1.079618, 1, 1, 1, 1, 1,
-1.199662, 1.154678, -1.882646, 1, 1, 1, 1, 1,
-1.199115, 1.531609, -2.358685, 1, 1, 1, 1, 1,
-1.193282, -1.826121, -2.415195, 1, 1, 1, 1, 1,
-1.188437, -1.763418, -3.745404, 1, 1, 1, 1, 1,
-1.18265, 1.83663, -0.8770342, 1, 1, 1, 1, 1,
-1.179266, 0.9566927, -2.392541, 1, 1, 1, 1, 1,
-1.172206, -0.2310057, -0.1455221, 1, 1, 1, 1, 1,
-1.158769, -1.928631, -1.754362, 0, 0, 1, 1, 1,
-1.145297, 0.634719, -0.4053147, 1, 0, 0, 1, 1,
-1.14229, 0.4654791, -0.9820399, 1, 0, 0, 1, 1,
-1.142137, 1.932832, 1.009727, 1, 0, 0, 1, 1,
-1.13576, 0.1475207, -2.688312, 1, 0, 0, 1, 1,
-1.131779, -2.067314, -3.506475, 1, 0, 0, 1, 1,
-1.127338, 1.279521, -1.024899, 0, 0, 0, 1, 1,
-1.126986, -0.4068675, -3.131803, 0, 0, 0, 1, 1,
-1.120752, -0.7060741, -4.163009, 0, 0, 0, 1, 1,
-1.118254, -1.130418, -2.935266, 0, 0, 0, 1, 1,
-1.114776, 0.1596166, -1.031521, 0, 0, 0, 1, 1,
-1.112129, -0.4822377, -4.482979, 0, 0, 0, 1, 1,
-1.110529, 0.05416262, -2.475348, 0, 0, 0, 1, 1,
-1.109707, 0.9608653, -1.526646, 1, 1, 1, 1, 1,
-1.105121, -1.10288, -2.020736, 1, 1, 1, 1, 1,
-1.102378, 2.597254, -0.9768878, 1, 1, 1, 1, 1,
-1.097506, -1.032316, -3.552708, 1, 1, 1, 1, 1,
-1.09483, 0.5363014, -1.87029, 1, 1, 1, 1, 1,
-1.092503, -0.1354308, -1.572034, 1, 1, 1, 1, 1,
-1.082614, 1.067409, -0.2233164, 1, 1, 1, 1, 1,
-1.077994, 1.591898, -1.566189, 1, 1, 1, 1, 1,
-1.074623, 0.9796889, -1.262467, 1, 1, 1, 1, 1,
-1.071105, -2.380951, -0.7814304, 1, 1, 1, 1, 1,
-1.066985, 0.2553994, -1.179256, 1, 1, 1, 1, 1,
-1.060449, -0.6805618, -2.481787, 1, 1, 1, 1, 1,
-1.058599, 1.370076, -1.283586, 1, 1, 1, 1, 1,
-1.056814, 0.8126672, -0.7975338, 1, 1, 1, 1, 1,
-1.055646, -0.450996, -0.720592, 1, 1, 1, 1, 1,
-1.053954, -0.05417614, -1.703279, 0, 0, 1, 1, 1,
-1.053295, 0.8077959, -0.8611861, 1, 0, 0, 1, 1,
-1.051518, -0.1133913, -1.756752, 1, 0, 0, 1, 1,
-1.049398, -0.9905652, -2.557366, 1, 0, 0, 1, 1,
-1.042447, 1.037669, -1.027191, 1, 0, 0, 1, 1,
-1.039829, -0.241982, -0.9304653, 1, 0, 0, 1, 1,
-1.020834, -0.4258587, -0.1251993, 0, 0, 0, 1, 1,
-1.02036, -1.255851, -2.575053, 0, 0, 0, 1, 1,
-1.020022, -0.3043554, -0.9007193, 0, 0, 0, 1, 1,
-1.015634, 0.6939452, 3.345865, 0, 0, 0, 1, 1,
-1.015507, 2.30715, -3.447014, 0, 0, 0, 1, 1,
-0.9975373, -0.7513275, -2.923109, 0, 0, 0, 1, 1,
-0.997467, -0.8786551, -3.136503, 0, 0, 0, 1, 1,
-0.9961529, 0.4440016, -0.914459, 1, 1, 1, 1, 1,
-0.994372, -0.5173141, -1.964566, 1, 1, 1, 1, 1,
-0.9892165, -1.236111, -1.756726, 1, 1, 1, 1, 1,
-0.9866834, 0.2856373, 3.032325, 1, 1, 1, 1, 1,
-0.9851785, 1.200427, -1.880747, 1, 1, 1, 1, 1,
-0.9785349, -0.8085181, -3.18865, 1, 1, 1, 1, 1,
-0.9778816, -0.2439898, -3.076512, 1, 1, 1, 1, 1,
-0.9774205, -1.8318, -0.7659651, 1, 1, 1, 1, 1,
-0.9742719, -0.4187027, -2.632208, 1, 1, 1, 1, 1,
-0.9737813, -0.5805073, -2.875138, 1, 1, 1, 1, 1,
-0.9730918, -0.1137479, -1.533998, 1, 1, 1, 1, 1,
-0.9680158, -0.1846503, -0.2951538, 1, 1, 1, 1, 1,
-0.9650298, 0.5663932, -2.091153, 1, 1, 1, 1, 1,
-0.9609747, 0.1365697, -0.3627712, 1, 1, 1, 1, 1,
-0.9608375, 0.0198877, -0.0886312, 1, 1, 1, 1, 1,
-0.9492318, -1.325284, -3.518705, 0, 0, 1, 1, 1,
-0.9414577, -0.5705833, -2.294724, 1, 0, 0, 1, 1,
-0.9341092, -0.4219871, -2.763267, 1, 0, 0, 1, 1,
-0.9292249, -0.3704244, -0.6106251, 1, 0, 0, 1, 1,
-0.9279361, 0.3422009, -2.643694, 1, 0, 0, 1, 1,
-0.9269062, -0.6296815, -0.9972786, 1, 0, 0, 1, 1,
-0.9198895, -0.6307181, -2.367874, 0, 0, 0, 1, 1,
-0.919887, 0.8139624, -1.193348, 0, 0, 0, 1, 1,
-0.9194082, -1.797326, -1.577022, 0, 0, 0, 1, 1,
-0.9165906, 0.4069422, -1.439357, 0, 0, 0, 1, 1,
-0.9150873, -0.7412, -3.80431, 0, 0, 0, 1, 1,
-0.9145258, -1.360456, -0.8789901, 0, 0, 0, 1, 1,
-0.9135672, 1.78077, -1.79848, 0, 0, 0, 1, 1,
-0.9075351, 1.282147, -0.5280117, 1, 1, 1, 1, 1,
-0.907186, 0.3335763, 1.321556, 1, 1, 1, 1, 1,
-0.9016493, -1.000934, -2.781119, 1, 1, 1, 1, 1,
-0.8952324, 0.5022601, -1.678745, 1, 1, 1, 1, 1,
-0.8921021, -0.3276156, -2.340476, 1, 1, 1, 1, 1,
-0.8838611, 0.8729634, 0.05120829, 1, 1, 1, 1, 1,
-0.8837509, -0.002810786, -1.923428, 1, 1, 1, 1, 1,
-0.8806663, -1.604029, -3.321659, 1, 1, 1, 1, 1,
-0.8775457, -0.1787438, 0.3921203, 1, 1, 1, 1, 1,
-0.8765903, 1.265292, -0.8321612, 1, 1, 1, 1, 1,
-0.8762742, -0.7564312, -1.318541, 1, 1, 1, 1, 1,
-0.873018, -0.3329819, -2.708095, 1, 1, 1, 1, 1,
-0.8700534, 0.02773708, -1.41194, 1, 1, 1, 1, 1,
-0.8683603, -1.529542, -2.013955, 1, 1, 1, 1, 1,
-0.8656264, -0.0818585, -1.969293, 1, 1, 1, 1, 1,
-0.8652597, 1.652053, 1.164274, 0, 0, 1, 1, 1,
-0.8549013, 1.272071, 0.8510441, 1, 0, 0, 1, 1,
-0.8526958, 0.3006803, -0.1366783, 1, 0, 0, 1, 1,
-0.8475432, 0.4729494, -1.102472, 1, 0, 0, 1, 1,
-0.8312513, -1.175307, -2.64651, 1, 0, 0, 1, 1,
-0.8306956, 0.08160467, -0.6847995, 1, 0, 0, 1, 1,
-0.8277273, 0.1952669, -1.369619, 0, 0, 0, 1, 1,
-0.8257107, -0.2630531, -2.005898, 0, 0, 0, 1, 1,
-0.8187129, 0.7731507, -1.023122, 0, 0, 0, 1, 1,
-0.8104383, 0.9342958, -1.399942, 0, 0, 0, 1, 1,
-0.7993002, 1.040692, -0.2251722, 0, 0, 0, 1, 1,
-0.7991395, -1.200085, -1.045864, 0, 0, 0, 1, 1,
-0.7936542, 0.7431948, -0.5701108, 0, 0, 0, 1, 1,
-0.7905092, -0.83053, -3.026874, 1, 1, 1, 1, 1,
-0.7869623, -0.3544087, -2.163907, 1, 1, 1, 1, 1,
-0.7827023, 0.7140324, -0.7429431, 1, 1, 1, 1, 1,
-0.7767892, 0.6563902, -2.540118, 1, 1, 1, 1, 1,
-0.7738202, -0.9474171, -2.409224, 1, 1, 1, 1, 1,
-0.7683079, 1.137368, -0.4709631, 1, 1, 1, 1, 1,
-0.7666898, 0.3645996, -3.123706, 1, 1, 1, 1, 1,
-0.7655643, -1.464911, -3.711424, 1, 1, 1, 1, 1,
-0.7626702, 0.3698981, -1.608168, 1, 1, 1, 1, 1,
-0.7604985, -0.4205194, -1.797332, 1, 1, 1, 1, 1,
-0.7603225, -0.8987734, -3.870358, 1, 1, 1, 1, 1,
-0.7480471, 0.5081575, 0.4819067, 1, 1, 1, 1, 1,
-0.7426601, -0.8134542, -2.598722, 1, 1, 1, 1, 1,
-0.7408852, 1.413214, 0.6448277, 1, 1, 1, 1, 1,
-0.7379609, 0.7912864, -0.9948122, 1, 1, 1, 1, 1,
-0.736538, -0.674566, -1.485093, 0, 0, 1, 1, 1,
-0.7318358, 0.938145, -0.9427948, 1, 0, 0, 1, 1,
-0.7260627, -1.176478, -3.089354, 1, 0, 0, 1, 1,
-0.7247826, 0.2333192, -3.030415, 1, 0, 0, 1, 1,
-0.7247365, -0.5814869, -2.608255, 1, 0, 0, 1, 1,
-0.7234721, -1.531807, -3.19975, 1, 0, 0, 1, 1,
-0.7228524, 0.8337061, -0.2315338, 0, 0, 0, 1, 1,
-0.7181281, 1.149747, -2.022269, 0, 0, 0, 1, 1,
-0.7154183, 0.7832584, -1.093729, 0, 0, 0, 1, 1,
-0.7151253, 0.5135447, -1.968315, 0, 0, 0, 1, 1,
-0.7128773, 0.1467739, -2.646053, 0, 0, 0, 1, 1,
-0.7121699, -0.9968826, -1.089452, 0, 0, 0, 1, 1,
-0.710678, 2.70492, 1.935307, 0, 0, 0, 1, 1,
-0.7103163, -0.5824879, -3.064876, 1, 1, 1, 1, 1,
-0.7090811, -0.2800962, -1.107074, 1, 1, 1, 1, 1,
-0.7069978, 0.06439004, -1.346115, 1, 1, 1, 1, 1,
-0.6947405, 2.461961, -1.677652, 1, 1, 1, 1, 1,
-0.6942478, 0.394587, -1.684722, 1, 1, 1, 1, 1,
-0.6921197, 0.5163058, -1.011799, 1, 1, 1, 1, 1,
-0.6905038, 0.8004124, -0.5771604, 1, 1, 1, 1, 1,
-0.6843336, -0.7472884, -0.7381778, 1, 1, 1, 1, 1,
-0.6811086, -0.3949055, -2.813361, 1, 1, 1, 1, 1,
-0.6741785, -0.9905036, -1.430882, 1, 1, 1, 1, 1,
-0.6619498, -0.4056983, -2.973681, 1, 1, 1, 1, 1,
-0.6591243, -0.222566, -3.639817, 1, 1, 1, 1, 1,
-0.6521514, 1.881192, 0.697206, 1, 1, 1, 1, 1,
-0.6511362, 0.5360875, -0.7148958, 1, 1, 1, 1, 1,
-0.6510708, 0.15303, -0.4980594, 1, 1, 1, 1, 1,
-0.6481379, 0.351202, -0.8633702, 0, 0, 1, 1, 1,
-0.6454772, 0.6249999, -2.283795, 1, 0, 0, 1, 1,
-0.6448394, 0.7839565, -1.095459, 1, 0, 0, 1, 1,
-0.6419871, 1.618962, 0.4289443, 1, 0, 0, 1, 1,
-0.6395199, -0.07847454, -1.327763, 1, 0, 0, 1, 1,
-0.6393344, -0.835709, -3.99731, 1, 0, 0, 1, 1,
-0.6393296, -0.4180597, -2.917916, 0, 0, 0, 1, 1,
-0.6392659, -0.4707029, -2.393034, 0, 0, 0, 1, 1,
-0.6361961, -0.2137411, -1.742576, 0, 0, 0, 1, 1,
-0.6282681, 1.301851, -0.9534766, 0, 0, 0, 1, 1,
-0.6271419, 0.0513185, 0.1295061, 0, 0, 0, 1, 1,
-0.6268421, -1.117913, -3.167937, 0, 0, 0, 1, 1,
-0.6171108, -1.23021, -3.371704, 0, 0, 0, 1, 1,
-0.6145995, -0.1457999, -2.365167, 1, 1, 1, 1, 1,
-0.6134873, -0.8541793, -2.125619, 1, 1, 1, 1, 1,
-0.6083316, 2.104718, -1.543401, 1, 1, 1, 1, 1,
-0.607271, -0.9331649, -2.465572, 1, 1, 1, 1, 1,
-0.6043665, -3.042382, -1.712878, 1, 1, 1, 1, 1,
-0.6013054, -1.320528, -1.936161, 1, 1, 1, 1, 1,
-0.5988182, 0.5358667, 0.129686, 1, 1, 1, 1, 1,
-0.5891734, -0.07358722, -0.6453694, 1, 1, 1, 1, 1,
-0.5867911, -1.003696, -1.517056, 1, 1, 1, 1, 1,
-0.5853261, -0.03889442, -1.346721, 1, 1, 1, 1, 1,
-0.5847955, 1.995997, -1.116273, 1, 1, 1, 1, 1,
-0.5835555, 0.813394, 0.2516423, 1, 1, 1, 1, 1,
-0.5805966, 1.010167, -1.55509, 1, 1, 1, 1, 1,
-0.5798866, 0.5952554, 0.7861913, 1, 1, 1, 1, 1,
-0.578627, -1.402406, -1.369178, 1, 1, 1, 1, 1,
-0.5777919, 1.631995, -1.06085, 0, 0, 1, 1, 1,
-0.5773585, 2.055869, -0.7647655, 1, 0, 0, 1, 1,
-0.5764988, -1.338144, -4.27916, 1, 0, 0, 1, 1,
-0.5713313, -0.4916086, -3.082947, 1, 0, 0, 1, 1,
-0.5690929, -0.9223812, -2.144052, 1, 0, 0, 1, 1,
-0.5679543, -1.9997, -2.845158, 1, 0, 0, 1, 1,
-0.5637949, -0.6124668, -1.335623, 0, 0, 0, 1, 1,
-0.5506931, 1.092749, -1.114824, 0, 0, 0, 1, 1,
-0.5475834, -0.647922, -3.629256, 0, 0, 0, 1, 1,
-0.5423259, -1.378619, -1.6259, 0, 0, 0, 1, 1,
-0.5418329, 0.2693061, -0.183548, 0, 0, 0, 1, 1,
-0.5368413, 0.9445499, -0.4669834, 0, 0, 0, 1, 1,
-0.5216472, 0.3537582, -0.9997747, 0, 0, 0, 1, 1,
-0.5202931, 0.3172394, -1.803449, 1, 1, 1, 1, 1,
-0.5131191, 0.9498293, -2.961035, 1, 1, 1, 1, 1,
-0.5066525, 1.096435, -0.1435694, 1, 1, 1, 1, 1,
-0.5054796, 0.9855111, 0.7704308, 1, 1, 1, 1, 1,
-0.5018871, 0.06695687, -2.812408, 1, 1, 1, 1, 1,
-0.5015931, 1.323006, -0.1198106, 1, 1, 1, 1, 1,
-0.500284, -0.7190584, -3.674788, 1, 1, 1, 1, 1,
-0.5001351, -1.988042, -2.58695, 1, 1, 1, 1, 1,
-0.4975151, 2.662158, 0.7968715, 1, 1, 1, 1, 1,
-0.4935232, -0.08575962, -2.098281, 1, 1, 1, 1, 1,
-0.4927441, -1.333282, -3.223743, 1, 1, 1, 1, 1,
-0.4898881, -0.3181948, -2.06678, 1, 1, 1, 1, 1,
-0.4885712, -0.5727903, -3.181566, 1, 1, 1, 1, 1,
-0.4847409, -0.7654909, -3.566129, 1, 1, 1, 1, 1,
-0.475028, 0.4608663, 0.3740552, 1, 1, 1, 1, 1,
-0.4745516, 0.1958816, -1.183735, 0, 0, 1, 1, 1,
-0.4627278, -0.3011706, -2.450949, 1, 0, 0, 1, 1,
-0.4616954, -1.305252, -0.9385856, 1, 0, 0, 1, 1,
-0.4610428, 0.3680631, -2.102803, 1, 0, 0, 1, 1,
-0.4609289, -0.7051245, -3.636757, 1, 0, 0, 1, 1,
-0.4605977, -1.512856, -3.197049, 1, 0, 0, 1, 1,
-0.4598332, 1.508104, 0.1738428, 0, 0, 0, 1, 1,
-0.4592386, 0.3890322, -1.545521, 0, 0, 0, 1, 1,
-0.4590145, 1.3733, -0.3421413, 0, 0, 0, 1, 1,
-0.4549249, -0.7838191, -3.100623, 0, 0, 0, 1, 1,
-0.4529996, -1.542119, -3.679731, 0, 0, 0, 1, 1,
-0.4528136, -0.7923901, -2.397283, 0, 0, 0, 1, 1,
-0.4514123, -0.814095, -2.016436, 0, 0, 0, 1, 1,
-0.4463241, 1.302644, -1.509668, 1, 1, 1, 1, 1,
-0.4420268, 0.7216412, -0.11475, 1, 1, 1, 1, 1,
-0.4384293, 0.7649341, 0.608111, 1, 1, 1, 1, 1,
-0.437338, -1.508044, -2.204966, 1, 1, 1, 1, 1,
-0.4356514, 0.3888583, 0.1271492, 1, 1, 1, 1, 1,
-0.430261, 0.7023484, -1.63191, 1, 1, 1, 1, 1,
-0.4302034, -0.5895477, -3.348015, 1, 1, 1, 1, 1,
-0.428851, -0.2106185, -2.427463, 1, 1, 1, 1, 1,
-0.4266429, -2.099735, -2.703299, 1, 1, 1, 1, 1,
-0.4241535, -0.2230813, -1.243041, 1, 1, 1, 1, 1,
-0.423492, 0.4007828, -0.5008727, 1, 1, 1, 1, 1,
-0.4231028, -1.170101, -2.916653, 1, 1, 1, 1, 1,
-0.4211816, -0.7345626, -4.412602, 1, 1, 1, 1, 1,
-0.4207723, -0.04128852, -0.5290682, 1, 1, 1, 1, 1,
-0.4128482, 0.1435204, -1.14154, 1, 1, 1, 1, 1,
-0.4107057, -0.27077, -0.5032161, 0, 0, 1, 1, 1,
-0.408854, 1.518807, -1.491137, 1, 0, 0, 1, 1,
-0.4050937, -0.5653141, -3.048695, 1, 0, 0, 1, 1,
-0.403478, -0.9901425, -1.33911, 1, 0, 0, 1, 1,
-0.399609, -3.405631, -2.107742, 1, 0, 0, 1, 1,
-0.3948704, -0.1741165, -0.3943307, 1, 0, 0, 1, 1,
-0.3943323, 0.9812297, 1.212496, 0, 0, 0, 1, 1,
-0.3889371, -0.2824527, -3.048133, 0, 0, 0, 1, 1,
-0.3884025, 1.954051, -0.06597324, 0, 0, 0, 1, 1,
-0.3760632, 1.130959, -1.412979, 0, 0, 0, 1, 1,
-0.3756204, 1.302677, 1.220485, 0, 0, 0, 1, 1,
-0.370682, 0.8289008, -1.187361, 0, 0, 0, 1, 1,
-0.3704929, -0.1305097, -1.211671, 0, 0, 0, 1, 1,
-0.3691016, 1.560128, -1.179794, 1, 1, 1, 1, 1,
-0.36807, -0.6061541, -2.961331, 1, 1, 1, 1, 1,
-0.3680328, 2.438559, -0.4822752, 1, 1, 1, 1, 1,
-0.3676146, -1.4846, -4.442746, 1, 1, 1, 1, 1,
-0.3650962, 0.8233648, -1.404355, 1, 1, 1, 1, 1,
-0.3597764, -0.8072644, -2.900654, 1, 1, 1, 1, 1,
-0.351624, 1.061508, -0.1884288, 1, 1, 1, 1, 1,
-0.3493766, 0.7912451, -0.5225415, 1, 1, 1, 1, 1,
-0.3493201, -0.8681647, -3.738958, 1, 1, 1, 1, 1,
-0.3420978, 0.4352491, -1.637425, 1, 1, 1, 1, 1,
-0.3354234, 0.1666845, -1.310735, 1, 1, 1, 1, 1,
-0.3353463, 1.414964, -0.3330012, 1, 1, 1, 1, 1,
-0.3349929, -0.1826945, -1.011551, 1, 1, 1, 1, 1,
-0.3340978, -0.4254223, -0.8629018, 1, 1, 1, 1, 1,
-0.3328834, 1.39054, 0.7591299, 1, 1, 1, 1, 1,
-0.3325216, 0.8766463, -0.8875626, 0, 0, 1, 1, 1,
-0.3301171, -0.2874457, -2.867028, 1, 0, 0, 1, 1,
-0.3271628, 0.3347497, 0.988346, 1, 0, 0, 1, 1,
-0.3238149, -0.101471, -2.522068, 1, 0, 0, 1, 1,
-0.3222223, -0.702626, -1.559823, 1, 0, 0, 1, 1,
-0.3178457, -0.3471191, -1.769457, 1, 0, 0, 1, 1,
-0.3137165, -1.451072, -3.942951, 0, 0, 0, 1, 1,
-0.3095578, 0.01019222, -2.090527, 0, 0, 0, 1, 1,
-0.3061847, 0.6844249, 0.4265692, 0, 0, 0, 1, 1,
-0.302765, -0.04823824, -1.232486, 0, 0, 0, 1, 1,
-0.2993392, -1.736141, -2.36116, 0, 0, 0, 1, 1,
-0.2951302, 0.6236082, 0.1156358, 0, 0, 0, 1, 1,
-0.2949141, 1.199831, 0.2555262, 0, 0, 0, 1, 1,
-0.2938429, 0.06743539, -0.07964098, 1, 1, 1, 1, 1,
-0.2928801, -0.187104, -1.801468, 1, 1, 1, 1, 1,
-0.2926552, 0.4234339, -1.153545, 1, 1, 1, 1, 1,
-0.2853022, 0.132647, -2.954688, 1, 1, 1, 1, 1,
-0.284422, -1.164637, -2.590839, 1, 1, 1, 1, 1,
-0.2829153, -0.5482121, -2.336399, 1, 1, 1, 1, 1,
-0.2821514, -0.4863379, -3.496569, 1, 1, 1, 1, 1,
-0.2736555, -0.4464942, -2.570985, 1, 1, 1, 1, 1,
-0.2709982, -0.1449242, -1.154853, 1, 1, 1, 1, 1,
-0.2706415, -0.2436504, -4.262516, 1, 1, 1, 1, 1,
-0.2684287, -0.1761824, -1.307522, 1, 1, 1, 1, 1,
-0.2679532, -0.849441, -1.921754, 1, 1, 1, 1, 1,
-0.2642184, 0.2949377, -0.1384471, 1, 1, 1, 1, 1,
-0.2630403, 2.307991, 0.8362072, 1, 1, 1, 1, 1,
-0.2577538, 1.319806, -2.169788, 1, 1, 1, 1, 1,
-0.2537209, 0.3757061, -1.60865, 0, 0, 1, 1, 1,
-0.2531217, -2.00087, -4.908459, 1, 0, 0, 1, 1,
-0.2479583, -0.5825572, -2.243456, 1, 0, 0, 1, 1,
-0.2382033, 0.1426381, -2.710802, 1, 0, 0, 1, 1,
-0.2377102, -0.5743961, -1.785047, 1, 0, 0, 1, 1,
-0.2292383, -1.695599, -4.113427, 1, 0, 0, 1, 1,
-0.2275869, 0.04800695, -1.189205, 0, 0, 0, 1, 1,
-0.2265945, 0.297349, -0.6358587, 0, 0, 0, 1, 1,
-0.2264392, -0.04886021, -1.806538, 0, 0, 0, 1, 1,
-0.2261672, 1.310197, 0.5599473, 0, 0, 0, 1, 1,
-0.2232961, 0.4815682, 0.9405321, 0, 0, 0, 1, 1,
-0.2178145, -0.1744925, -2.369079, 0, 0, 0, 1, 1,
-0.217624, -1.614824, -6.551363, 0, 0, 0, 1, 1,
-0.2154332, 0.07539982, -0.9189149, 1, 1, 1, 1, 1,
-0.2144913, -1.594563, -2.641048, 1, 1, 1, 1, 1,
-0.2135612, 0.1395214, -1.712289, 1, 1, 1, 1, 1,
-0.2115813, -0.1412501, -3.146114, 1, 1, 1, 1, 1,
-0.2079957, 1.573892, 0.1393815, 1, 1, 1, 1, 1,
-0.2067765, -0.7233008, -2.584118, 1, 1, 1, 1, 1,
-0.2037436, 0.2443925, -0.2830307, 1, 1, 1, 1, 1,
-0.2035971, -0.6449356, -2.169907, 1, 1, 1, 1, 1,
-0.2031679, -0.909901, -4.58232, 1, 1, 1, 1, 1,
-0.1999074, -0.07794373, -2.860896, 1, 1, 1, 1, 1,
-0.1933536, -0.1440804, -3.668921, 1, 1, 1, 1, 1,
-0.1918007, -0.5816435, -3.267187, 1, 1, 1, 1, 1,
-0.1915501, 0.5708396, -1.332126, 1, 1, 1, 1, 1,
-0.1848085, 0.4716013, 0.0343241, 1, 1, 1, 1, 1,
-0.1832339, -0.9303499, -2.3938, 1, 1, 1, 1, 1,
-0.1820059, 0.3473074, -2.458323, 0, 0, 1, 1, 1,
-0.1808516, 0.2630429, -2.184955, 1, 0, 0, 1, 1,
-0.1759009, -1.393135, -4.190839, 1, 0, 0, 1, 1,
-0.1739943, -0.3952209, -3.20349, 1, 0, 0, 1, 1,
-0.1725597, 0.5728421, -0.3884989, 1, 0, 0, 1, 1,
-0.1716523, -1.547211, -3.627184, 1, 0, 0, 1, 1,
-0.1710296, -1.140721, -3.698268, 0, 0, 0, 1, 1,
-0.165194, 0.7308044, -0.390644, 0, 0, 0, 1, 1,
-0.1620698, -0.4364712, -3.865644, 0, 0, 0, 1, 1,
-0.1587559, -1.147984, -3.432797, 0, 0, 0, 1, 1,
-0.1576581, -0.2497009, -2.154326, 0, 0, 0, 1, 1,
-0.1555567, 0.2899606, 0.07483966, 0, 0, 0, 1, 1,
-0.1516328, 0.3943749, 0.3650704, 0, 0, 0, 1, 1,
-0.1510454, -0.9234696, -3.822219, 1, 1, 1, 1, 1,
-0.1491012, 1.206849, -0.2546402, 1, 1, 1, 1, 1,
-0.1475145, -0.3121203, -2.107101, 1, 1, 1, 1, 1,
-0.1470086, 0.3724746, -0.9122594, 1, 1, 1, 1, 1,
-0.1466768, 0.1821846, -0.707817, 1, 1, 1, 1, 1,
-0.1465713, -0.3861941, -2.373688, 1, 1, 1, 1, 1,
-0.143023, 0.6514485, -0.3272712, 1, 1, 1, 1, 1,
-0.1423547, -0.3456717, -3.429137, 1, 1, 1, 1, 1,
-0.141373, 0.7829652, -1.685403, 1, 1, 1, 1, 1,
-0.1400788, -1.069592, -3.744431, 1, 1, 1, 1, 1,
-0.1399919, -1.005224, -4.109128, 1, 1, 1, 1, 1,
-0.1393594, -0.9362004, -4.029327, 1, 1, 1, 1, 1,
-0.137621, 0.825727, 1.446958, 1, 1, 1, 1, 1,
-0.1367426, -0.2892736, -2.140694, 1, 1, 1, 1, 1,
-0.1361875, -0.7044863, -3.304974, 1, 1, 1, 1, 1,
-0.13496, 0.07537739, -0.7577062, 0, 0, 1, 1, 1,
-0.1341201, -1.491077, -3.211661, 1, 0, 0, 1, 1,
-0.1334829, 1.186351, 0.3393128, 1, 0, 0, 1, 1,
-0.1307044, 1.585896, -0.09232333, 1, 0, 0, 1, 1,
-0.1270671, -1.24109, -3.145611, 1, 0, 0, 1, 1,
-0.1250526, -0.2717429, -3.015702, 1, 0, 0, 1, 1,
-0.1239392, 0.9748754, -0.01916897, 0, 0, 0, 1, 1,
-0.1143941, -0.08434867, -1.837142, 0, 0, 0, 1, 1,
-0.1137323, 0.8167022, -0.7548691, 0, 0, 0, 1, 1,
-0.1110354, -0.6338001, -4.533354, 0, 0, 0, 1, 1,
-0.1093719, -0.006938172, -2.047085, 0, 0, 0, 1, 1,
-0.1078665, -1.157907, -0.9148473, 0, 0, 0, 1, 1,
-0.1038274, -0.534557, -2.288771, 0, 0, 0, 1, 1,
-0.1020733, -1.710212, -2.934017, 1, 1, 1, 1, 1,
-0.0994719, -2.501833, -1.66672, 1, 1, 1, 1, 1,
-0.09857466, 0.04202627, -0.389822, 1, 1, 1, 1, 1,
-0.09794761, 1.531358, -0.07603897, 1, 1, 1, 1, 1,
-0.09385769, 0.5011277, -0.05549449, 1, 1, 1, 1, 1,
-0.09137961, 0.008515549, -1.126119, 1, 1, 1, 1, 1,
-0.08696853, -0.4011949, -3.11516, 1, 1, 1, 1, 1,
-0.08505547, 0.09728824, -0.4829655, 1, 1, 1, 1, 1,
-0.07914191, 3.090913, 1.232635, 1, 1, 1, 1, 1,
-0.07270532, -0.1436886, -2.411559, 1, 1, 1, 1, 1,
-0.06993873, 0.1389753, -0.806042, 1, 1, 1, 1, 1,
-0.06984544, 0.6309116, -0.4912264, 1, 1, 1, 1, 1,
-0.06771825, 0.05303435, -0.4385115, 1, 1, 1, 1, 1,
-0.06708986, 0.1140483, -0.3243584, 1, 1, 1, 1, 1,
-0.06618533, 0.1780039, -0.6348342, 1, 1, 1, 1, 1,
-0.06175468, 0.961931, 0.2670197, 0, 0, 1, 1, 1,
-0.06126714, 0.003804944, -0.3003696, 1, 0, 0, 1, 1,
-0.05347457, 0.781533, 0.2187778, 1, 0, 0, 1, 1,
-0.05204568, 0.4181962, -1.38479, 1, 0, 0, 1, 1,
-0.04948839, -0.1354759, -2.207193, 1, 0, 0, 1, 1,
-0.04818061, 1.25126, -1.682009, 1, 0, 0, 1, 1,
-0.04784783, -1.70355, -2.896495, 0, 0, 0, 1, 1,
-0.03999351, -0.8528027, -2.212694, 0, 0, 0, 1, 1,
-0.03715378, -0.3267518, -2.711752, 0, 0, 0, 1, 1,
-0.03436852, 0.73475, 0.5495369, 0, 0, 0, 1, 1,
-0.03275751, 0.3892849, 0.3413241, 0, 0, 0, 1, 1,
-0.03115556, -0.8315299, -3.488876, 0, 0, 0, 1, 1,
-0.02854191, -0.1214553, -3.204017, 0, 0, 0, 1, 1,
-0.02744308, 1.297456, 1.540414, 1, 1, 1, 1, 1,
-0.02664229, -0.7635732, -2.62543, 1, 1, 1, 1, 1,
-0.0248767, -0.546914, -2.841724, 1, 1, 1, 1, 1,
-0.01868577, 0.1062403, 1.620216, 1, 1, 1, 1, 1,
-0.01775515, -1.733922, -3.336624, 1, 1, 1, 1, 1,
-0.01720147, -0.4447193, -3.493828, 1, 1, 1, 1, 1,
-0.01175081, 0.06179061, 1.293827, 1, 1, 1, 1, 1,
-0.01015229, 0.06229443, -0.04070936, 1, 1, 1, 1, 1,
-0.01014037, -0.5532715, -2.441336, 1, 1, 1, 1, 1,
-0.009465239, 0.4577509, 1.313693, 1, 1, 1, 1, 1,
-0.006606741, -0.8736859, -4.316482, 1, 1, 1, 1, 1,
-0.00574543, -0.4722292, -2.911354, 1, 1, 1, 1, 1,
-0.0008134001, 1.501452, 0.04070541, 1, 1, 1, 1, 1,
0.002408346, 0.7849839, -0.1392399, 1, 1, 1, 1, 1,
0.00562668, -0.03266035, 3.990211, 1, 1, 1, 1, 1,
0.00804894, 0.669378, -0.7879525, 0, 0, 1, 1, 1,
0.01060665, -0.5779457, 3.271376, 1, 0, 0, 1, 1,
0.01154855, 0.07954834, 1.068534, 1, 0, 0, 1, 1,
0.0119998, -0.1822501, 3.046818, 1, 0, 0, 1, 1,
0.01277437, 1.153691, 1.24013, 1, 0, 0, 1, 1,
0.0151506, 0.8085024, -0.6524352, 1, 0, 0, 1, 1,
0.01818879, -0.4716851, 2.443194, 0, 0, 0, 1, 1,
0.02013767, -0.4940691, 2.074907, 0, 0, 0, 1, 1,
0.02275131, -0.8258508, 3.004358, 0, 0, 0, 1, 1,
0.02338605, -0.04318317, 3.904295, 0, 0, 0, 1, 1,
0.02435021, 0.8585833, 3.240716, 0, 0, 0, 1, 1,
0.02554161, -1.526306, 2.348892, 0, 0, 0, 1, 1,
0.02629727, 1.377938, -0.4921314, 0, 0, 0, 1, 1,
0.02920457, 0.7159976, 0.7907289, 1, 1, 1, 1, 1,
0.02947979, 1.157123, -0.6868748, 1, 1, 1, 1, 1,
0.03175505, 0.8757143, 0.6993185, 1, 1, 1, 1, 1,
0.03431477, -0.9135039, 2.316831, 1, 1, 1, 1, 1,
0.03655186, -0.1354865, 2.90919, 1, 1, 1, 1, 1,
0.04795373, 0.169554, -0.02871034, 1, 1, 1, 1, 1,
0.04851636, 0.5302054, 0.8418262, 1, 1, 1, 1, 1,
0.05040738, 0.1963401, 0.7020465, 1, 1, 1, 1, 1,
0.05463094, -0.02455328, 1.849816, 1, 1, 1, 1, 1,
0.0547019, -0.7910776, 0.8134353, 1, 1, 1, 1, 1,
0.05877588, -1.751096, 2.622255, 1, 1, 1, 1, 1,
0.05935193, -1.718331, 1.731368, 1, 1, 1, 1, 1,
0.05946209, 0.5926432, 0.01933159, 1, 1, 1, 1, 1,
0.0596095, 0.7978105, -0.5019358, 1, 1, 1, 1, 1,
0.06376092, 1.21616, -0.6396692, 1, 1, 1, 1, 1,
0.06507333, 1.100914, -0.7243809, 0, 0, 1, 1, 1,
0.06575666, -2.443629, 4.53245, 1, 0, 0, 1, 1,
0.06809087, 0.9875041, 0.1468203, 1, 0, 0, 1, 1,
0.07112791, -0.3305117, 2.797364, 1, 0, 0, 1, 1,
0.07163236, -0.0728205, 1.736896, 1, 0, 0, 1, 1,
0.07248884, 0.9220968, 0.4549214, 1, 0, 0, 1, 1,
0.07358305, 0.6094989, -1.500098, 0, 0, 0, 1, 1,
0.08027308, -0.771184, 3.104495, 0, 0, 0, 1, 1,
0.08059093, 0.1844776, 0.2598035, 0, 0, 0, 1, 1,
0.08687482, 0.2135233, 0.9334993, 0, 0, 0, 1, 1,
0.08946323, -0.8857176, 2.571019, 0, 0, 0, 1, 1,
0.09097832, 0.2791846, -1.069393, 0, 0, 0, 1, 1,
0.09177021, -0.09510156, 2.042909, 0, 0, 0, 1, 1,
0.09177113, 1.278847, 1.915393, 1, 1, 1, 1, 1,
0.09370057, 0.2286908, -0.2404001, 1, 1, 1, 1, 1,
0.09403515, 0.1762234, 0.9458072, 1, 1, 1, 1, 1,
0.0969954, 0.6640514, -0.581461, 1, 1, 1, 1, 1,
0.1064545, 3.168181, 1.459284, 1, 1, 1, 1, 1,
0.1091669, -0.5664884, 1.128376, 1, 1, 1, 1, 1,
0.1106433, 0.4281914, 0.9383368, 1, 1, 1, 1, 1,
0.1115141, 0.007503527, 1.487641, 1, 1, 1, 1, 1,
0.1119692, -0.09756568, 2.144129, 1, 1, 1, 1, 1,
0.1144185, 1.000699, 1.09126, 1, 1, 1, 1, 1,
0.1221452, -0.5300328, 3.656176, 1, 1, 1, 1, 1,
0.1225549, 1.178031, 0.08406784, 1, 1, 1, 1, 1,
0.1233415, -0.07171602, 3.187852, 1, 1, 1, 1, 1,
0.1244705, 0.7088138, 0.3772672, 1, 1, 1, 1, 1,
0.1257941, -0.0223796, 1.932024, 1, 1, 1, 1, 1,
0.1311915, 0.3039006, -0.8338023, 0, 0, 1, 1, 1,
0.1335154, 1.877621, -0.05208351, 1, 0, 0, 1, 1,
0.1369392, -1.642508, 3.487325, 1, 0, 0, 1, 1,
0.1375843, 0.6195352, 1.095739, 1, 0, 0, 1, 1,
0.1396464, -0.56074, 1.409109, 1, 0, 0, 1, 1,
0.1464217, 0.7005613, 0.8230149, 1, 0, 0, 1, 1,
0.1465588, -0.02043125, 1.374555, 0, 0, 0, 1, 1,
0.1543917, -0.3270176, 3.535413, 0, 0, 0, 1, 1,
0.1548354, -0.4754647, 1.753211, 0, 0, 0, 1, 1,
0.1602407, -0.756168, 3.054732, 0, 0, 0, 1, 1,
0.1638237, 0.5384457, -1.559287, 0, 0, 0, 1, 1,
0.1655142, 0.115763, 0.4401079, 0, 0, 0, 1, 1,
0.1702768, -2.119174, 3.20441, 0, 0, 0, 1, 1,
0.1716045, 1.446803, -0.6375567, 1, 1, 1, 1, 1,
0.1722852, 1.02228, -0.7459922, 1, 1, 1, 1, 1,
0.1727002, 0.5275773, -0.6698565, 1, 1, 1, 1, 1,
0.1738254, -0.3687786, 1.767258, 1, 1, 1, 1, 1,
0.1765894, 1.59459, -0.8109978, 1, 1, 1, 1, 1,
0.1800933, -0.4090899, 1.191273, 1, 1, 1, 1, 1,
0.184201, -1.318152, 1.972734, 1, 1, 1, 1, 1,
0.1883255, 0.5880356, -0.4926784, 1, 1, 1, 1, 1,
0.1919799, -1.312938, 2.801823, 1, 1, 1, 1, 1,
0.1929848, 2.090795, -0.2455428, 1, 1, 1, 1, 1,
0.1965224, -0.07787497, 4.220117, 1, 1, 1, 1, 1,
0.2021657, -0.7637097, 2.585857, 1, 1, 1, 1, 1,
0.2048789, 1.465661, 1.168539, 1, 1, 1, 1, 1,
0.2071426, 0.185466, -0.4392992, 1, 1, 1, 1, 1,
0.2072879, -1.684652, 3.159428, 1, 1, 1, 1, 1,
0.2087891, -1.303535, 3.424481, 0, 0, 1, 1, 1,
0.2118609, 0.7589032, 0.4698482, 1, 0, 0, 1, 1,
0.212463, -0.9625981, 2.074322, 1, 0, 0, 1, 1,
0.2131904, -0.9703683, 2.472312, 1, 0, 0, 1, 1,
0.2140524, -1.006493, 2.020647, 1, 0, 0, 1, 1,
0.2173253, 0.4151179, -0.8606496, 1, 0, 0, 1, 1,
0.2179401, 0.9575623, -0.391631, 0, 0, 0, 1, 1,
0.2196041, -0.3418305, 4.370579, 0, 0, 0, 1, 1,
0.2232064, 0.4701524, 1.614167, 0, 0, 0, 1, 1,
0.2245617, -0.2189558, 2.399908, 0, 0, 0, 1, 1,
0.2265136, 0.9776682, 1.76397, 0, 0, 0, 1, 1,
0.2291891, -0.3336713, 2.50333, 0, 0, 0, 1, 1,
0.2292645, -0.3786732, 3.413714, 0, 0, 0, 1, 1,
0.2294324, -1.995878, 3.563393, 1, 1, 1, 1, 1,
0.231211, -0.7411367, 4.213186, 1, 1, 1, 1, 1,
0.235381, -2.28074, 3.185961, 1, 1, 1, 1, 1,
0.2407919, -0.439466, 4.290242, 1, 1, 1, 1, 1,
0.241381, 2.814431, 0.4190349, 1, 1, 1, 1, 1,
0.2418673, -0.5300698, 4.277667, 1, 1, 1, 1, 1,
0.241905, 0.8140526, 0.0985868, 1, 1, 1, 1, 1,
0.2441898, 1.964864, 0.4752591, 1, 1, 1, 1, 1,
0.2461421, -2.581627, 4.043775, 1, 1, 1, 1, 1,
0.246599, 0.3281406, 0.02355778, 1, 1, 1, 1, 1,
0.2467044, 1.906308, -0.9724024, 1, 1, 1, 1, 1,
0.250795, -0.03611004, 1.288891, 1, 1, 1, 1, 1,
0.2539468, -0.03310949, 2.006735, 1, 1, 1, 1, 1,
0.2565001, 0.1000194, 0.3538262, 1, 1, 1, 1, 1,
0.2570132, 0.5478035, -2.096304, 1, 1, 1, 1, 1,
0.2601915, -0.7064485, 2.375439, 0, 0, 1, 1, 1,
0.2699515, -0.06846384, 2.383307, 1, 0, 0, 1, 1,
0.2705191, -0.04197387, 1.883716, 1, 0, 0, 1, 1,
0.2714441, -0.2175602, 2.176467, 1, 0, 0, 1, 1,
0.2730666, 0.00755605, -0.02555507, 1, 0, 0, 1, 1,
0.2790446, -2.599605, 3.833972, 1, 0, 0, 1, 1,
0.2821907, 0.1294977, -0.5050927, 0, 0, 0, 1, 1,
0.2854345, -1.002557, 3.100634, 0, 0, 0, 1, 1,
0.2865938, -0.1502234, 2.008854, 0, 0, 0, 1, 1,
0.2884177, 0.4697254, 1.774522, 0, 0, 0, 1, 1,
0.288547, 0.4231287, -0.2295001, 0, 0, 0, 1, 1,
0.2892875, -0.8321041, 2.148179, 0, 0, 0, 1, 1,
0.2898551, -0.3529486, 2.003427, 0, 0, 0, 1, 1,
0.2961708, -0.4091302, 3.929901, 1, 1, 1, 1, 1,
0.2976393, -0.02805497, 1.43669, 1, 1, 1, 1, 1,
0.3038751, 1.148805, -0.6441999, 1, 1, 1, 1, 1,
0.3070824, -0.2485316, 2.063939, 1, 1, 1, 1, 1,
0.3075833, 0.262163, 0.7147921, 1, 1, 1, 1, 1,
0.3083246, 1.937276, 1.35505, 1, 1, 1, 1, 1,
0.3090521, -0.4337149, 1.976617, 1, 1, 1, 1, 1,
0.3124146, 0.5217938, 0.08454441, 1, 1, 1, 1, 1,
0.3156631, 0.3905684, -0.2081684, 1, 1, 1, 1, 1,
0.3159258, -0.08065567, 0.7944353, 1, 1, 1, 1, 1,
0.3161916, 1.193083, 0.3089159, 1, 1, 1, 1, 1,
0.3173785, -0.5691546, 1.285722, 1, 1, 1, 1, 1,
0.3178888, 1.196473, -0.3773786, 1, 1, 1, 1, 1,
0.3184834, 1.109247, 0.3589173, 1, 1, 1, 1, 1,
0.3185092, 0.3430197, -0.2307659, 1, 1, 1, 1, 1,
0.32039, 1.704444, 0.4142824, 0, 0, 1, 1, 1,
0.3245202, 0.3372352, 0.9442406, 1, 0, 0, 1, 1,
0.3277415, -1.265675, 2.583983, 1, 0, 0, 1, 1,
0.3277967, -1.36428, 2.299307, 1, 0, 0, 1, 1,
0.3294524, -0.4184164, 2.542876, 1, 0, 0, 1, 1,
0.3306707, 0.8304984, -0.3605111, 1, 0, 0, 1, 1,
0.3333702, -1.318245, 2.747154, 0, 0, 0, 1, 1,
0.3405119, 0.8250066, 0.842645, 0, 0, 0, 1, 1,
0.3422786, 0.8296463, -0.6242776, 0, 0, 0, 1, 1,
0.3433013, 1.162601, -0.8632089, 0, 0, 0, 1, 1,
0.3467056, -0.4960494, 3.947428, 0, 0, 0, 1, 1,
0.3514726, -1.211916, 1.274326, 0, 0, 0, 1, 1,
0.3610847, -1.168584, 1.116394, 0, 0, 0, 1, 1,
0.36468, -1.299217, 2.883575, 1, 1, 1, 1, 1,
0.367655, -0.09315074, 3.224706, 1, 1, 1, 1, 1,
0.3706846, -0.3561288, 2.203717, 1, 1, 1, 1, 1,
0.3741407, 0.1820779, 1.340486, 1, 1, 1, 1, 1,
0.3761469, 0.3688042, -1.584912, 1, 1, 1, 1, 1,
0.3763491, -0.0108898, 1.425619, 1, 1, 1, 1, 1,
0.3776619, -0.5334623, 3.064217, 1, 1, 1, 1, 1,
0.3785718, -0.185546, 0.2175182, 1, 1, 1, 1, 1,
0.3860985, -0.9587114, 1.58192, 1, 1, 1, 1, 1,
0.3888661, 0.3641444, 0.2568228, 1, 1, 1, 1, 1,
0.3888897, 1.212206, 0.1751447, 1, 1, 1, 1, 1,
0.389903, -0.3083027, 2.351066, 1, 1, 1, 1, 1,
0.3916383, -0.7410745, 2.266474, 1, 1, 1, 1, 1,
0.3923593, 1.145272, -0.1768679, 1, 1, 1, 1, 1,
0.3974152, -1.196006, 2.585196, 1, 1, 1, 1, 1,
0.402233, -0.04376257, 1.980491, 0, 0, 1, 1, 1,
0.4031991, -0.74036, 1.699301, 1, 0, 0, 1, 1,
0.4034891, 1.152788, 0.1994255, 1, 0, 0, 1, 1,
0.4035171, -0.9635721, 2.827551, 1, 0, 0, 1, 1,
0.4037016, 1.022142, 1.368783, 1, 0, 0, 1, 1,
0.4057195, -1.053021, 3.54015, 1, 0, 0, 1, 1,
0.4077243, 0.6513214, 0.3842827, 0, 0, 0, 1, 1,
0.4117254, -0.7335971, 2.997676, 0, 0, 0, 1, 1,
0.4142996, 0.77338, 3.222778, 0, 0, 0, 1, 1,
0.4179082, 1.180068, 2.033709, 0, 0, 0, 1, 1,
0.424161, -0.04309582, 2.002964, 0, 0, 0, 1, 1,
0.4292848, -1.230995, 3.24402, 0, 0, 0, 1, 1,
0.4297012, 0.2657946, 1.134929, 0, 0, 0, 1, 1,
0.4340432, -1.791056, 2.498262, 1, 1, 1, 1, 1,
0.4394411, 0.1083794, 0.4294131, 1, 1, 1, 1, 1,
0.439532, -0.7677492, 0.9260256, 1, 1, 1, 1, 1,
0.4507042, -0.3434905, 1.891258, 1, 1, 1, 1, 1,
0.4535933, -0.042302, 0.761556, 1, 1, 1, 1, 1,
0.4546627, -0.3322542, 2.087914, 1, 1, 1, 1, 1,
0.4553899, -2.695907, 4.037836, 1, 1, 1, 1, 1,
0.457063, -1.806404, 3.939384, 1, 1, 1, 1, 1,
0.4639976, -0.7415094, 4.045395, 1, 1, 1, 1, 1,
0.4744766, 0.6104755, 0.4066277, 1, 1, 1, 1, 1,
0.4767562, 0.101555, 1.63214, 1, 1, 1, 1, 1,
0.4769535, -0.4944125, 2.419045, 1, 1, 1, 1, 1,
0.4781415, -0.1765165, 2.494966, 1, 1, 1, 1, 1,
0.4786288, -1.066524, 1.21837, 1, 1, 1, 1, 1,
0.4842926, 0.4950755, -0.09674206, 1, 1, 1, 1, 1,
0.4939266, 1.016909, 0.1523296, 0, 0, 1, 1, 1,
0.4948983, 0.4659745, 0.01401782, 1, 0, 0, 1, 1,
0.4955485, -0.0288418, 0.7712722, 1, 0, 0, 1, 1,
0.5015515, -0.3190519, 0.2572891, 1, 0, 0, 1, 1,
0.5032142, 0.6029462, 0.1139802, 1, 0, 0, 1, 1,
0.507133, -0.1118361, 1.10822, 1, 0, 0, 1, 1,
0.5148017, 1.452812, -0.8828279, 0, 0, 0, 1, 1,
0.521481, 1.729058, 0.9299971, 0, 0, 0, 1, 1,
0.5219443, 0.2008965, 0.8257336, 0, 0, 0, 1, 1,
0.5233864, 0.8321152, 1.80785, 0, 0, 0, 1, 1,
0.5330665, -0.01836601, 1.61477, 0, 0, 0, 1, 1,
0.534468, -2.174372, 1.304323, 0, 0, 0, 1, 1,
0.5376843, -1.105869, 3.317734, 0, 0, 0, 1, 1,
0.5450844, -0.6229905, 2.25972, 1, 1, 1, 1, 1,
0.5469519, 1.721995, -1.281515, 1, 1, 1, 1, 1,
0.5474436, -0.02738834, 2.10295, 1, 1, 1, 1, 1,
0.5510367, 0.7150781, 0.4885942, 1, 1, 1, 1, 1,
0.555914, 1.311127, 1.909585, 1, 1, 1, 1, 1,
0.5590454, 0.8349804, 2.720445, 1, 1, 1, 1, 1,
0.5596702, -1.046946, 1.330054, 1, 1, 1, 1, 1,
0.5624396, -0.4630905, 0.6733695, 1, 1, 1, 1, 1,
0.5668287, -0.6618647, 1.719592, 1, 1, 1, 1, 1,
0.5675165, 0.2286557, 1.384304, 1, 1, 1, 1, 1,
0.5841458, 1.038572, -0.7093263, 1, 1, 1, 1, 1,
0.5862152, 0.7119198, 1.413298, 1, 1, 1, 1, 1,
0.5863383, 0.9431177, 0.1529807, 1, 1, 1, 1, 1,
0.5889604, 0.8854538, 1.232837, 1, 1, 1, 1, 1,
0.5974475, -0.1084471, 1.991942, 1, 1, 1, 1, 1,
0.5987176, -0.246251, 4.656813, 0, 0, 1, 1, 1,
0.6043305, -0.6121035, 2.063615, 1, 0, 0, 1, 1,
0.6076229, 1.268765, 0.210303, 1, 0, 0, 1, 1,
0.6084579, 1.420026, -1.207607, 1, 0, 0, 1, 1,
0.609699, -0.3312688, 2.064019, 1, 0, 0, 1, 1,
0.6107521, 1.140592, 1.166575, 1, 0, 0, 1, 1,
0.612502, 0.9164578, 0.7289456, 0, 0, 0, 1, 1,
0.6169789, -1.029754, 0.3756704, 0, 0, 0, 1, 1,
0.6223904, 1.017361, 0.9946488, 0, 0, 0, 1, 1,
0.6245568, 0.3301323, 0.9750954, 0, 0, 0, 1, 1,
0.6274723, -1.625676, 4.885253, 0, 0, 0, 1, 1,
0.6278214, -1.435301, 2.601345, 0, 0, 0, 1, 1,
0.6289815, -0.132542, 1.699318, 0, 0, 0, 1, 1,
0.6295596, 0.2035426, 0.7504881, 1, 1, 1, 1, 1,
0.6325929, 0.4343437, -0.289086, 1, 1, 1, 1, 1,
0.6371987, 0.06216333, 1.922047, 1, 1, 1, 1, 1,
0.6384122, 0.1273383, 0.323411, 1, 1, 1, 1, 1,
0.6416288, -0.2564147, 2.283674, 1, 1, 1, 1, 1,
0.6457556, -1.512987, 5.053037, 1, 1, 1, 1, 1,
0.650847, 0.3904551, 1.940267, 1, 1, 1, 1, 1,
0.6563493, -1.111709, 2.055919, 1, 1, 1, 1, 1,
0.6584314, 0.8707371, 0.8456073, 1, 1, 1, 1, 1,
0.6585838, -0.09311736, 0.9639394, 1, 1, 1, 1, 1,
0.6624681, 0.6531598, -0.4791544, 1, 1, 1, 1, 1,
0.6650322, -0.9896176, 3.142363, 1, 1, 1, 1, 1,
0.6671392, -0.8168045, 1.667302, 1, 1, 1, 1, 1,
0.6707215, -1.491586, 3.248007, 1, 1, 1, 1, 1,
0.6841856, -1.946689, 2.372153, 1, 1, 1, 1, 1,
0.6881826, 0.6208436, 2.895949, 0, 0, 1, 1, 1,
0.6885705, -0.1936906, 1.589528, 1, 0, 0, 1, 1,
0.69608, 1.071647, -0.1875553, 1, 0, 0, 1, 1,
0.6983279, 0.8841407, 0.5616054, 1, 0, 0, 1, 1,
0.706259, 0.6698858, 0.7125367, 1, 0, 0, 1, 1,
0.7141543, -0.5715454, 1.784149, 1, 0, 0, 1, 1,
0.7153443, 0.2683798, 1.524491, 0, 0, 0, 1, 1,
0.7228786, -0.7853141, 2.27966, 0, 0, 0, 1, 1,
0.7259304, -0.0194285, 1.382695, 0, 0, 0, 1, 1,
0.7267886, -0.256446, 2.183082, 0, 0, 0, 1, 1,
0.7279843, 0.8865563, -0.6209236, 0, 0, 0, 1, 1,
0.7286342, -1.04629, 3.975346, 0, 0, 0, 1, 1,
0.7305222, -0.2562717, 2.020394, 0, 0, 0, 1, 1,
0.7349794, 0.539804, 1.996806, 1, 1, 1, 1, 1,
0.7388144, 0.2017662, 2.383998, 1, 1, 1, 1, 1,
0.7417979, 0.9871345, 0.9455447, 1, 1, 1, 1, 1,
0.7433669, -1.105589, 3.294643, 1, 1, 1, 1, 1,
0.7449085, -0.5626441, 1.624831, 1, 1, 1, 1, 1,
0.7489911, -0.1550236, 3.485616, 1, 1, 1, 1, 1,
0.749779, 0.6378358, 0.6776908, 1, 1, 1, 1, 1,
0.7535537, -1.341058, 1.555585, 1, 1, 1, 1, 1,
0.7543508, -0.779079, 1.049044, 1, 1, 1, 1, 1,
0.7621015, 0.3270609, 0.44079, 1, 1, 1, 1, 1,
0.7720158, 0.4773903, 0.2719417, 1, 1, 1, 1, 1,
0.7760814, -0.4055009, 1.685589, 1, 1, 1, 1, 1,
0.7764195, 0.2974039, 0.6384681, 1, 1, 1, 1, 1,
0.7777632, 1.081314, 1.122605, 1, 1, 1, 1, 1,
0.7807135, 0.3510832, 1.288745, 1, 1, 1, 1, 1,
0.7877393, -0.8031904, 2.017163, 0, 0, 1, 1, 1,
0.8024338, -0.3500205, 3.130278, 1, 0, 0, 1, 1,
0.8039963, -2.064358, 2.951233, 1, 0, 0, 1, 1,
0.8056082, 0.9440187, -0.05601249, 1, 0, 0, 1, 1,
0.8064178, 0.7375257, 0.6955641, 1, 0, 0, 1, 1,
0.8094262, 2.150182, 1.085207, 1, 0, 0, 1, 1,
0.819519, -0.6484299, 2.05997, 0, 0, 0, 1, 1,
0.8274012, 1.119293, 1.469889, 0, 0, 0, 1, 1,
0.8305334, -1.035634, 1.277675, 0, 0, 0, 1, 1,
0.8336979, -1.056484, 2.062995, 0, 0, 0, 1, 1,
0.8359613, 0.05049676, 1.08507, 0, 0, 0, 1, 1,
0.8442415, 0.3695934, 1.934197, 0, 0, 0, 1, 1,
0.8447192, 1.715794, -0.7788044, 0, 0, 0, 1, 1,
0.848981, -0.264001, 0.638822, 1, 1, 1, 1, 1,
0.8577542, 0.03999721, 1.783322, 1, 1, 1, 1, 1,
0.859906, 0.1707851, 0.348281, 1, 1, 1, 1, 1,
0.8628648, -0.641892, 2.051033, 1, 1, 1, 1, 1,
0.8642729, -0.5716004, 4.004426, 1, 1, 1, 1, 1,
0.8655825, -1.586545, 3.135009, 1, 1, 1, 1, 1,
0.8666101, 1.380352, 0.9536089, 1, 1, 1, 1, 1,
0.8693106, -0.5040447, 3.52091, 1, 1, 1, 1, 1,
0.8704628, 1.867793, 2.142204, 1, 1, 1, 1, 1,
0.8705477, -0.6875798, 1.482566, 1, 1, 1, 1, 1,
0.8709674, 0.6963263, 2.058665, 1, 1, 1, 1, 1,
0.8764817, 0.06287283, 1.305938, 1, 1, 1, 1, 1,
0.8768582, -0.8833063, 1.767263, 1, 1, 1, 1, 1,
0.8809835, -0.1310895, 1.002012, 1, 1, 1, 1, 1,
0.8860214, -0.4354344, 1.860309, 1, 1, 1, 1, 1,
0.8867958, 0.7532061, -0.03819725, 0, 0, 1, 1, 1,
0.8883765, 0.6676316, 0.6914232, 1, 0, 0, 1, 1,
0.8910685, 0.690707, 0.2059846, 1, 0, 0, 1, 1,
0.8969098, 0.011913, 1.006507, 1, 0, 0, 1, 1,
0.9012394, -0.1407674, 2.658019, 1, 0, 0, 1, 1,
0.9048727, 1.215375, 1.369826, 1, 0, 0, 1, 1,
0.9073834, -0.8556573, 0.5605748, 0, 0, 0, 1, 1,
0.909313, 1.268895, 0.1276275, 0, 0, 0, 1, 1,
0.9139534, 0.01781598, 1.05552, 0, 0, 0, 1, 1,
0.9211047, -1.089085, 2.27951, 0, 0, 0, 1, 1,
0.9253159, -2.163001, 1.376394, 0, 0, 0, 1, 1,
0.9263565, -0.4317997, 2.104819, 0, 0, 0, 1, 1,
0.9273583, -2.186566, 3.19223, 0, 0, 0, 1, 1,
0.9297695, -1.737776, 1.675787, 1, 1, 1, 1, 1,
0.9314615, 1.090514, 0.836911, 1, 1, 1, 1, 1,
0.9469548, 0.145761, 1.761249, 1, 1, 1, 1, 1,
0.984078, -0.3001818, 1.930075, 1, 1, 1, 1, 1,
0.9872047, 0.6993968, 1.072836, 1, 1, 1, 1, 1,
0.9882864, 1.615745, 0.9903833, 1, 1, 1, 1, 1,
0.9896231, 0.9802945, 1.005964, 1, 1, 1, 1, 1,
0.9944824, -0.6326886, 2.750145, 1, 1, 1, 1, 1,
0.9971196, 0.5445313, 0.7931413, 1, 1, 1, 1, 1,
1.003725, -0.03044826, 0.9520373, 1, 1, 1, 1, 1,
1.007825, 0.1433547, 1.761633, 1, 1, 1, 1, 1,
1.009462, -2.156045, 2.557109, 1, 1, 1, 1, 1,
1.015674, 1.096882, 0.565982, 1, 1, 1, 1, 1,
1.021033, -0.7123417, 1.462675, 1, 1, 1, 1, 1,
1.028684, 0.06625399, 1.745533, 1, 1, 1, 1, 1,
1.038655, 0.9216068, 1.280817, 0, 0, 1, 1, 1,
1.041663, -1.243639, 1.37511, 1, 0, 0, 1, 1,
1.063203, 1.244826, 0.5578596, 1, 0, 0, 1, 1,
1.066633, 0.1813446, 0.9235752, 1, 0, 0, 1, 1,
1.071516, 0.3095922, 0.9763942, 1, 0, 0, 1, 1,
1.072406, 0.3098803, 1.694016, 1, 0, 0, 1, 1,
1.075606, 0.6035031, 0.04871245, 0, 0, 0, 1, 1,
1.08041, -0.7146474, 1.355733, 0, 0, 0, 1, 1,
1.088134, 0.04379708, 1.353609, 0, 0, 0, 1, 1,
1.092188, 1.272968, 1.330936, 0, 0, 0, 1, 1,
1.095686, -2.20464, 2.890198, 0, 0, 0, 1, 1,
1.098522, -1.185746, 3.224961, 0, 0, 0, 1, 1,
1.098768, 0.4480876, 1.719368, 0, 0, 0, 1, 1,
1.105627, -0.5196144, 1.794773, 1, 1, 1, 1, 1,
1.106422, -2.388094, 0.862551, 1, 1, 1, 1, 1,
1.114114, 0.3303292, 2.328079, 1, 1, 1, 1, 1,
1.121689, 1.197813, 0.2497881, 1, 1, 1, 1, 1,
1.121964, 1.031337, 2.936652, 1, 1, 1, 1, 1,
1.125596, 0.0004932308, 2.980021, 1, 1, 1, 1, 1,
1.137562, 0.3224977, 1.293458, 1, 1, 1, 1, 1,
1.140684, -0.4489392, 2.561017, 1, 1, 1, 1, 1,
1.148295, -2.746473, 3.021792, 1, 1, 1, 1, 1,
1.149433, 0.5959159, -0.03734986, 1, 1, 1, 1, 1,
1.151255, 2.101247, -0.690289, 1, 1, 1, 1, 1,
1.152628, -0.6864995, 0.6538502, 1, 1, 1, 1, 1,
1.153217, -0.5067285, 1.956913, 1, 1, 1, 1, 1,
1.153625, -2.23672, 1.373833, 1, 1, 1, 1, 1,
1.154158, -0.01065, 2.06199, 1, 1, 1, 1, 1,
1.158152, -0.4911951, 1.346507, 0, 0, 1, 1, 1,
1.17532, -1.126669, 0.8725162, 1, 0, 0, 1, 1,
1.176141, -0.3048187, 2.007787, 1, 0, 0, 1, 1,
1.179172, -0.5562267, 2.72415, 1, 0, 0, 1, 1,
1.182687, -1.007797, 2.855391, 1, 0, 0, 1, 1,
1.197144, -0.7431174, 2.6745, 1, 0, 0, 1, 1,
1.200306, -0.6398131, 0.6819128, 0, 0, 0, 1, 1,
1.201433, 0.823559, 1.389741, 0, 0, 0, 1, 1,
1.203979, -0.2376448, 2.091393, 0, 0, 0, 1, 1,
1.20973, -1.821681, 4.395483, 0, 0, 0, 1, 1,
1.213018, -0.1121715, 0.481125, 0, 0, 0, 1, 1,
1.215906, 2.072451, 0.6119915, 0, 0, 0, 1, 1,
1.223073, 1.077798, 1.629433, 0, 0, 0, 1, 1,
1.226625, -0.3488176, 0.869615, 1, 1, 1, 1, 1,
1.227598, 0.04540852, 1.23414, 1, 1, 1, 1, 1,
1.229644, 1.023703, 1.719796, 1, 1, 1, 1, 1,
1.234549, -2.664981, 4.680142, 1, 1, 1, 1, 1,
1.246067, -1.547246, 0.8113117, 1, 1, 1, 1, 1,
1.24932, 1.326173, 1.442622, 1, 1, 1, 1, 1,
1.252464, 1.144161, 0.3467441, 1, 1, 1, 1, 1,
1.258018, -1.903215, 3.25028, 1, 1, 1, 1, 1,
1.258731, -0.9191896, 0.9936299, 1, 1, 1, 1, 1,
1.259348, 1.626393, -0.9916734, 1, 1, 1, 1, 1,
1.268021, -1.404019, 2.703161, 1, 1, 1, 1, 1,
1.270149, 0.5949414, 0.6539074, 1, 1, 1, 1, 1,
1.28233, -0.3346775, 1.658114, 1, 1, 1, 1, 1,
1.290517, -0.2601328, 1.247991, 1, 1, 1, 1, 1,
1.303415, 1.419291, 0.2093006, 1, 1, 1, 1, 1,
1.312919, -0.5174087, 3.554187, 0, 0, 1, 1, 1,
1.315388, -1.636536, 2.951442, 1, 0, 0, 1, 1,
1.316243, 0.1863174, 1.9657, 1, 0, 0, 1, 1,
1.327007, 1.618117, 2.016105, 1, 0, 0, 1, 1,
1.327897, 1.237245, 1.34951, 1, 0, 0, 1, 1,
1.33008, -0.2516645, 0.1708876, 1, 0, 0, 1, 1,
1.332284, -0.2436108, 1.787683, 0, 0, 0, 1, 1,
1.33538, 0.4684359, 1.872204, 0, 0, 0, 1, 1,
1.33584, 0.6959671, 1.933758, 0, 0, 0, 1, 1,
1.335951, -0.3838766, 1.670578, 0, 0, 0, 1, 1,
1.33831, 0.3062023, 0.9969949, 0, 0, 0, 1, 1,
1.341555, -1.02448, 2.094086, 0, 0, 0, 1, 1,
1.348436, -0.2340183, 2.808579, 0, 0, 0, 1, 1,
1.354047, 0.1544249, 1.526646, 1, 1, 1, 1, 1,
1.374719, -0.152044, 2.438237, 1, 1, 1, 1, 1,
1.375751, 1.610314, 1.866843, 1, 1, 1, 1, 1,
1.378656, 1.339051, 2.014881, 1, 1, 1, 1, 1,
1.383733, -0.5868914, 0.7902033, 1, 1, 1, 1, 1,
1.386513, 1.360857, 1.543257, 1, 1, 1, 1, 1,
1.390617, -0.1501757, 3.003314, 1, 1, 1, 1, 1,
1.393119, 0.5882333, 2.825715, 1, 1, 1, 1, 1,
1.398825, -1.148479, 2.335835, 1, 1, 1, 1, 1,
1.404602, -1.205282, 3.014809, 1, 1, 1, 1, 1,
1.408258, 0.1750542, 2.126468, 1, 1, 1, 1, 1,
1.408334, -0.07883368, 1.895677, 1, 1, 1, 1, 1,
1.411153, 0.09645774, 1.845341, 1, 1, 1, 1, 1,
1.420961, 2.307864, 0.496839, 1, 1, 1, 1, 1,
1.42865, -0.9173865, 2.057989, 1, 1, 1, 1, 1,
1.433689, 0.6234611, 1.904928, 0, 0, 1, 1, 1,
1.433709, 0.2754757, 0.1887757, 1, 0, 0, 1, 1,
1.444461, -1.877002, 0.7487094, 1, 0, 0, 1, 1,
1.467156, 0.05274816, 1.305216, 1, 0, 0, 1, 1,
1.469813, -0.6597623, 2.579289, 1, 0, 0, 1, 1,
1.471294, 1.368144, 1.111079, 1, 0, 0, 1, 1,
1.472828, 1.221498, 0.05198354, 0, 0, 0, 1, 1,
1.494327, 0.5632029, 0.4845476, 0, 0, 0, 1, 1,
1.510554, -0.5016456, 2.569854, 0, 0, 0, 1, 1,
1.510776, 0.1968989, 1.526886, 0, 0, 0, 1, 1,
1.524327, -1.027218, 1.469836, 0, 0, 0, 1, 1,
1.53973, -0.402053, 2.71001, 0, 0, 0, 1, 1,
1.540033, -0.2324819, 1.192815, 0, 0, 0, 1, 1,
1.541444, 0.8086854, -0.07269182, 1, 1, 1, 1, 1,
1.542985, 1.063058, 1.922058, 1, 1, 1, 1, 1,
1.543384, 0.629194, 2.436032, 1, 1, 1, 1, 1,
1.549508, 0.01296376, 2.791458, 1, 1, 1, 1, 1,
1.566427, 0.6549231, 0.486567, 1, 1, 1, 1, 1,
1.584262, -0.9897006, 2.377903, 1, 1, 1, 1, 1,
1.587905, -0.2765389, 0.3931342, 1, 1, 1, 1, 1,
1.592933, -1.184738, -0.3124466, 1, 1, 1, 1, 1,
1.597885, -0.6289431, 1.302357, 1, 1, 1, 1, 1,
1.599193, 0.1739052, 1.836091, 1, 1, 1, 1, 1,
1.605665, -0.2042359, 3.188661, 1, 1, 1, 1, 1,
1.606195, -1.94689, 1.481739, 1, 1, 1, 1, 1,
1.609656, 1.270653, 0.5645227, 1, 1, 1, 1, 1,
1.621085, 0.6874853, 1.675134, 1, 1, 1, 1, 1,
1.621512, 0.1609981, 1.530063, 1, 1, 1, 1, 1,
1.63834, 0.7807487, 0.7616098, 0, 0, 1, 1, 1,
1.645947, 0.8234271, 2.502181, 1, 0, 0, 1, 1,
1.647865, -0.09400763, 3.076357, 1, 0, 0, 1, 1,
1.65335, 0.3224439, 1.771856, 1, 0, 0, 1, 1,
1.656907, 0.08248373, 1.103062, 1, 0, 0, 1, 1,
1.676498, -0.8478626, 2.171472, 1, 0, 0, 1, 1,
1.699856, 0.06383994, 3.304477, 0, 0, 0, 1, 1,
1.724005, -1.951256, 1.696415, 0, 0, 0, 1, 1,
1.727303, -0.4550699, 1.499156, 0, 0, 0, 1, 1,
1.75347, 0.3901061, 2.388604, 0, 0, 0, 1, 1,
1.778674, 2.561589, 0.9688316, 0, 0, 0, 1, 1,
1.778866, 1.994295, 0.7040758, 0, 0, 0, 1, 1,
1.782388, -0.2457428, 1.411162, 0, 0, 0, 1, 1,
1.79439, 0.1077012, -0.4025494, 1, 1, 1, 1, 1,
1.800159, -0.2785149, 2.779675, 1, 1, 1, 1, 1,
1.80524, 1.548238, 1.439767, 1, 1, 1, 1, 1,
1.80941, -0.4786725, 3.191487, 1, 1, 1, 1, 1,
1.818066, -1.140091, 1.72224, 1, 1, 1, 1, 1,
1.830352, -1.096202, 1.286729, 1, 1, 1, 1, 1,
1.833781, -0.181747, 3.625794, 1, 1, 1, 1, 1,
1.853848, -0.1678512, 1.420227, 1, 1, 1, 1, 1,
1.85402, 0.01362502, 2.597792, 1, 1, 1, 1, 1,
1.860503, 0.5021616, 1.73442, 1, 1, 1, 1, 1,
1.927005, -1.471033, 1.394688, 1, 1, 1, 1, 1,
1.947504, 1.533345, 0.2631494, 1, 1, 1, 1, 1,
1.952449, 0.1059697, 2.328773, 1, 1, 1, 1, 1,
1.987466, -2.285565, 4.0573, 1, 1, 1, 1, 1,
1.994616, -0.1450379, 1.617348, 1, 1, 1, 1, 1,
2.017352, 0.6528967, 2.884544, 0, 0, 1, 1, 1,
2.021171, -0.6987642, -0.2027102, 1, 0, 0, 1, 1,
2.026044, -0.1706719, 1.283246, 1, 0, 0, 1, 1,
2.036264, -0.8848748, 2.078078, 1, 0, 0, 1, 1,
2.060524, -1.014215, 4.162753, 1, 0, 0, 1, 1,
2.09545, 1.649153, -0.9599103, 1, 0, 0, 1, 1,
2.101985, -2.479091, 2.996615, 0, 0, 0, 1, 1,
2.123576, 0.3749361, 1.430402, 0, 0, 0, 1, 1,
2.139786, 0.4230373, 1.541175, 0, 0, 0, 1, 1,
2.229344, 1.906231, -0.2421538, 0, 0, 0, 1, 1,
2.251266, 1.297911, 1.131326, 0, 0, 0, 1, 1,
2.338373, 1.256683, 1.168739, 0, 0, 0, 1, 1,
2.341892, 0.2216504, 1.062624, 0, 0, 0, 1, 1,
2.407536, 1.953153, 1.661508, 1, 1, 1, 1, 1,
2.425833, -1.771677, 1.264845, 1, 1, 1, 1, 1,
2.506511, -0.4280617, 2.493264, 1, 1, 1, 1, 1,
2.716642, 0.3866134, 3.906222, 1, 1, 1, 1, 1,
2.718973, -0.02020243, 2.186287, 1, 1, 1, 1, 1,
2.823682, 0.704743, 1.268298, 1, 1, 1, 1, 1,
2.899616, 0.09083726, 1.547343, 1, 1, 1, 1, 1
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
var radius = 9.85733;
var distance = 34.62346;
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
mvMatrix.translate( 0.05712354, 0.1187248, 0.7491632 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.62346);
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
