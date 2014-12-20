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
-3.725498, 3.01231, 0.1026117, 1, 0, 0, 1,
-3.247881, -0.3423547, -1.435924, 1, 0.007843138, 0, 1,
-2.913405, -1.023014, -1.030185, 1, 0.01176471, 0, 1,
-2.909559, -0.2691762, -2.659118, 1, 0.01960784, 0, 1,
-2.802658, 0.9712132, -0.6448752, 1, 0.02352941, 0, 1,
-2.692696, 1.002369, -1.316201, 1, 0.03137255, 0, 1,
-2.613535, 0.1334851, -3.505198, 1, 0.03529412, 0, 1,
-2.570893, 0.001695055, -0.5409862, 1, 0.04313726, 0, 1,
-2.521667, 1.066439, -2.537813, 1, 0.04705882, 0, 1,
-2.490123, -0.6811104, -3.634296, 1, 0.05490196, 0, 1,
-2.388158, -0.5905623, -3.397992, 1, 0.05882353, 0, 1,
-2.346351, -0.3751735, -1.270911, 1, 0.06666667, 0, 1,
-2.281799, 0.3373282, -1.982976, 1, 0.07058824, 0, 1,
-2.253714, -0.1245446, -1.442346, 1, 0.07843138, 0, 1,
-2.23186, 0.24542, -2.399702, 1, 0.08235294, 0, 1,
-2.157504, 0.6486668, -0.4388386, 1, 0.09019608, 0, 1,
-2.140053, -1.241297, -1.432613, 1, 0.09411765, 0, 1,
-2.127948, 0.5863233, -3.164442, 1, 0.1019608, 0, 1,
-2.126921, -1.167575, -2.160288, 1, 0.1098039, 0, 1,
-2.123624, -1.986223, -2.726525, 1, 0.1137255, 0, 1,
-2.093677, -0.07629052, -1.160929, 1, 0.1215686, 0, 1,
-2.081866, -0.4031754, -1.419788, 1, 0.1254902, 0, 1,
-2.081465, -0.7331458, -0.7923645, 1, 0.1333333, 0, 1,
-2.081247, -0.06112369, -1.9759, 1, 0.1372549, 0, 1,
-2.0564, -0.3893873, -1.08843, 1, 0.145098, 0, 1,
-2.033717, 0.0682899, -1.13507, 1, 0.1490196, 0, 1,
-1.996666, 0.4166633, 0.2753939, 1, 0.1568628, 0, 1,
-1.974947, 0.3819624, -0.0564529, 1, 0.1607843, 0, 1,
-1.972264, 0.551402, 0.3492966, 1, 0.1686275, 0, 1,
-1.971623, -1.351421, -0.9766226, 1, 0.172549, 0, 1,
-1.953094, 0.1746103, -2.904713, 1, 0.1803922, 0, 1,
-1.914781, -0.6089839, -3.341081, 1, 0.1843137, 0, 1,
-1.908748, -0.3137878, -3.530843, 1, 0.1921569, 0, 1,
-1.897407, 0.2947041, -1.750896, 1, 0.1960784, 0, 1,
-1.89355, -0.5419823, -3.397188, 1, 0.2039216, 0, 1,
-1.889554, 0.2036397, -1.184476, 1, 0.2117647, 0, 1,
-1.878282, 0.07628819, -2.95472, 1, 0.2156863, 0, 1,
-1.870749, 0.1282268, -2.323928, 1, 0.2235294, 0, 1,
-1.841752, -0.4932833, 0.2542191, 1, 0.227451, 0, 1,
-1.813538, 1.549447, 0.2066721, 1, 0.2352941, 0, 1,
-1.79567, -0.6769956, 0.112493, 1, 0.2392157, 0, 1,
-1.767373, -0.4645929, -2.93025, 1, 0.2470588, 0, 1,
-1.766051, 0.5103139, -0.9719646, 1, 0.2509804, 0, 1,
-1.765925, -0.9470867, -2.637511, 1, 0.2588235, 0, 1,
-1.753857, -0.3029768, -1.441941, 1, 0.2627451, 0, 1,
-1.732812, -1.075987, -2.208395, 1, 0.2705882, 0, 1,
-1.729627, 0.7428179, -1.410769, 1, 0.2745098, 0, 1,
-1.709269, 0.7069575, -0.4756385, 1, 0.282353, 0, 1,
-1.703798, 0.111062, -1.27712, 1, 0.2862745, 0, 1,
-1.699162, -0.1013627, -1.290696, 1, 0.2941177, 0, 1,
-1.690994, -0.4484545, -2.867058, 1, 0.3019608, 0, 1,
-1.688455, -1.054757, -2.086009, 1, 0.3058824, 0, 1,
-1.685963, 0.3410776, -0.07437705, 1, 0.3137255, 0, 1,
-1.675829, 0.5281831, 0.7354081, 1, 0.3176471, 0, 1,
-1.66906, -0.4695184, -1.069604, 1, 0.3254902, 0, 1,
-1.667951, 0.9114625, -1.534499, 1, 0.3294118, 0, 1,
-1.663115, -1.182297, -2.60806, 1, 0.3372549, 0, 1,
-1.624145, -0.25689, -3.026765, 1, 0.3411765, 0, 1,
-1.622734, -0.6503918, -2.025961, 1, 0.3490196, 0, 1,
-1.613138, -1.05863, -3.144901, 1, 0.3529412, 0, 1,
-1.603186, 0.4241135, -1.776931, 1, 0.3607843, 0, 1,
-1.602012, -1.195754, -3.724683, 1, 0.3647059, 0, 1,
-1.600841, 1.099989, -0.7054472, 1, 0.372549, 0, 1,
-1.591486, 2.424085, 0.01837525, 1, 0.3764706, 0, 1,
-1.581233, -0.6773415, -2.571427, 1, 0.3843137, 0, 1,
-1.561819, 0.01438391, -2.258451, 1, 0.3882353, 0, 1,
-1.556957, 1.421098, -2.551494, 1, 0.3960784, 0, 1,
-1.550291, -0.1019441, -0.9443822, 1, 0.4039216, 0, 1,
-1.546684, 2.47614, -0.5757545, 1, 0.4078431, 0, 1,
-1.534711, -0.6158646, -2.285273, 1, 0.4156863, 0, 1,
-1.528391, -1.157731, -1.806682, 1, 0.4196078, 0, 1,
-1.525992, -0.2579296, -0.6923158, 1, 0.427451, 0, 1,
-1.517414, 0.7258372, -0.8698849, 1, 0.4313726, 0, 1,
-1.515406, 0.4735689, -0.9920166, 1, 0.4392157, 0, 1,
-1.499538, 0.1546911, -1.71698, 1, 0.4431373, 0, 1,
-1.497915, 0.9400442, -0.0446373, 1, 0.4509804, 0, 1,
-1.495156, -0.3937661, -0.5576708, 1, 0.454902, 0, 1,
-1.494439, 0.1858274, 0.3827783, 1, 0.4627451, 0, 1,
-1.49195, -0.05615698, -2.161212, 1, 0.4666667, 0, 1,
-1.479107, -0.9241529, -1.74015, 1, 0.4745098, 0, 1,
-1.473198, 0.825371, -0.1239298, 1, 0.4784314, 0, 1,
-1.467276, -0.8548729, -2.469185, 1, 0.4862745, 0, 1,
-1.463175, 0.9173042, 0.960192, 1, 0.4901961, 0, 1,
-1.462997, 2.313277, 0.5458601, 1, 0.4980392, 0, 1,
-1.46112, 0.6656874, -0.6907803, 1, 0.5058824, 0, 1,
-1.459971, 0.781724, -0.1852051, 1, 0.509804, 0, 1,
-1.457306, -0.7575949, -0.4592235, 1, 0.5176471, 0, 1,
-1.431079, 0.3502796, 0.7275837, 1, 0.5215687, 0, 1,
-1.425134, 0.3760188, -2.661835, 1, 0.5294118, 0, 1,
-1.422644, 0.184519, -0.3742694, 1, 0.5333334, 0, 1,
-1.421536, 0.9375997, 0.1326058, 1, 0.5411765, 0, 1,
-1.408729, -0.3499815, -2.608955, 1, 0.5450981, 0, 1,
-1.405743, 0.4072894, -1.420053, 1, 0.5529412, 0, 1,
-1.403642, 0.2340703, -1.840918, 1, 0.5568628, 0, 1,
-1.399091, -0.1467686, -1.305014, 1, 0.5647059, 0, 1,
-1.3878, 0.3953906, -3.01247, 1, 0.5686275, 0, 1,
-1.382642, -0.8633739, -0.1525453, 1, 0.5764706, 0, 1,
-1.374563, 1.517545, -0.2987973, 1, 0.5803922, 0, 1,
-1.370702, -1.226883, -1.572524, 1, 0.5882353, 0, 1,
-1.362963, 0.8380731, -0.6464953, 1, 0.5921569, 0, 1,
-1.359803, 0.4147412, -0.06060643, 1, 0.6, 0, 1,
-1.356004, -0.4328109, -3.134975, 1, 0.6078432, 0, 1,
-1.354978, -0.3918143, -2.615155, 1, 0.6117647, 0, 1,
-1.353464, -0.4931646, -1.243994, 1, 0.6196079, 0, 1,
-1.349601, -1.654462, -3.943341, 1, 0.6235294, 0, 1,
-1.342796, 0.4323016, -1.025873, 1, 0.6313726, 0, 1,
-1.341233, -0.8516093, -1.700571, 1, 0.6352941, 0, 1,
-1.33631, 0.5829516, -1.023574, 1, 0.6431373, 0, 1,
-1.328657, 0.6890512, -2.732931, 1, 0.6470588, 0, 1,
-1.327704, 0.3356009, -2.558887, 1, 0.654902, 0, 1,
-1.315354, -1.328699, -2.170103, 1, 0.6588235, 0, 1,
-1.302945, 0.9143885, -1.781327, 1, 0.6666667, 0, 1,
-1.298222, 0.02562019, -1.962033, 1, 0.6705883, 0, 1,
-1.29371, 0.04338787, -0.5607408, 1, 0.6784314, 0, 1,
-1.293463, -0.6659443, -2.122913, 1, 0.682353, 0, 1,
-1.274912, -0.3456544, -1.658656, 1, 0.6901961, 0, 1,
-1.273085, -0.06620551, -1.739784, 1, 0.6941177, 0, 1,
-1.265489, -1.42987, -3.238624, 1, 0.7019608, 0, 1,
-1.260485, -0.1669932, -2.808654, 1, 0.7098039, 0, 1,
-1.259167, -1.689071, -3.715858, 1, 0.7137255, 0, 1,
-1.248597, -0.131834, -2.671357, 1, 0.7215686, 0, 1,
-1.243086, -1.277314, -1.628768, 1, 0.7254902, 0, 1,
-1.23557, 0.8236921, -0.421483, 1, 0.7333333, 0, 1,
-1.22046, 0.5555643, 1.006043, 1, 0.7372549, 0, 1,
-1.21765, -0.04212227, -1.409736, 1, 0.7450981, 0, 1,
-1.21019, -0.5884468, -1.605061, 1, 0.7490196, 0, 1,
-1.202738, 0.02067113, -1.481096, 1, 0.7568628, 0, 1,
-1.193672, -1.719908, -2.388682, 1, 0.7607843, 0, 1,
-1.182997, -0.5371211, -1.08611, 1, 0.7686275, 0, 1,
-1.174428, -0.9919987, -2.803112, 1, 0.772549, 0, 1,
-1.17184, 0.3025432, -1.537359, 1, 0.7803922, 0, 1,
-1.169697, 0.8950095, -1.818316, 1, 0.7843137, 0, 1,
-1.164485, -0.462796, -2.085335, 1, 0.7921569, 0, 1,
-1.163481, -0.3294353, -4.214409, 1, 0.7960784, 0, 1,
-1.162181, -0.5118794, 0.07988427, 1, 0.8039216, 0, 1,
-1.1555, -0.4199792, -3.459415, 1, 0.8117647, 0, 1,
-1.153187, -0.1916509, -2.853427, 1, 0.8156863, 0, 1,
-1.153116, -1.804846, -2.702716, 1, 0.8235294, 0, 1,
-1.152939, -0.04592459, -2.381989, 1, 0.827451, 0, 1,
-1.151425, -0.6588591, -1.532088, 1, 0.8352941, 0, 1,
-1.149, -1.310623, -3.795713, 1, 0.8392157, 0, 1,
-1.147429, -0.9866182, -3.351008, 1, 0.8470588, 0, 1,
-1.144209, -0.523268, -3.58706, 1, 0.8509804, 0, 1,
-1.120839, 0.482602, -0.712794, 1, 0.8588235, 0, 1,
-1.12074, 1.816898, -0.6244609, 1, 0.8627451, 0, 1,
-1.112403, -0.9796537, -2.089618, 1, 0.8705882, 0, 1,
-1.111615, -0.1034235, -2.151532, 1, 0.8745098, 0, 1,
-1.109132, -0.294384, -2.025475, 1, 0.8823529, 0, 1,
-1.108996, -0.4653101, -2.364426, 1, 0.8862745, 0, 1,
-1.108309, -1.312528, -3.463998, 1, 0.8941177, 0, 1,
-1.107385, 0.647375, 0.9604546, 1, 0.8980392, 0, 1,
-1.095455, -1.382936, -2.501263, 1, 0.9058824, 0, 1,
-1.095153, -1.461856, -1.615321, 1, 0.9137255, 0, 1,
-1.091763, 0.6379578, -1.351277, 1, 0.9176471, 0, 1,
-1.091493, 1.252421, -1.420843, 1, 0.9254902, 0, 1,
-1.090132, 1.65814, 0.02905279, 1, 0.9294118, 0, 1,
-1.081947, -0.3470932, -2.213506, 1, 0.9372549, 0, 1,
-1.077601, -1.170102, -0.698653, 1, 0.9411765, 0, 1,
-1.076959, 0.04842171, -0.8868573, 1, 0.9490196, 0, 1,
-1.075388, -1.25938, -1.860336, 1, 0.9529412, 0, 1,
-1.070034, -0.9767624, -3.273254, 1, 0.9607843, 0, 1,
-1.061523, 1.026704, 0.2959452, 1, 0.9647059, 0, 1,
-1.060378, 0.04939827, -1.058007, 1, 0.972549, 0, 1,
-1.058993, -1.267085, -4.448446, 1, 0.9764706, 0, 1,
-1.05895, -1.289144, -1.900062, 1, 0.9843137, 0, 1,
-1.050073, 0.3371052, -0.1396055, 1, 0.9882353, 0, 1,
-1.038199, -1.234492, -1.697116, 1, 0.9960784, 0, 1,
-1.033506, 0.2571974, -0.5539405, 0.9960784, 1, 0, 1,
-1.026631, -0.9119332, -4.101751, 0.9921569, 1, 0, 1,
-1.026036, -0.4655265, -1.959439, 0.9843137, 1, 0, 1,
-1.011142, 0.6587387, -0.8298734, 0.9803922, 1, 0, 1,
-1.004969, -1.410319, -3.182365, 0.972549, 1, 0, 1,
-1.000109, -1.427109, -3.483523, 0.9686275, 1, 0, 1,
-0.9982963, -0.3704253, -3.062419, 0.9607843, 1, 0, 1,
-0.9968851, -1.135561, -2.894983, 0.9568627, 1, 0, 1,
-0.9947739, -0.2454996, -1.605858, 0.9490196, 1, 0, 1,
-0.9896697, -0.2242545, -2.440948, 0.945098, 1, 0, 1,
-0.9886042, -1.64071, -3.20872, 0.9372549, 1, 0, 1,
-0.9861156, -1.892314, -2.316683, 0.9333333, 1, 0, 1,
-0.9830637, 1.657913, -1.908633, 0.9254902, 1, 0, 1,
-0.977455, -1.6108, -1.632955, 0.9215686, 1, 0, 1,
-0.9740325, -1.343481, -5.251324, 0.9137255, 1, 0, 1,
-0.9711292, -0.5378875, -2.03592, 0.9098039, 1, 0, 1,
-0.9660428, 0.4376586, -1.180023, 0.9019608, 1, 0, 1,
-0.9650823, 0.1028411, -1.897835, 0.8941177, 1, 0, 1,
-0.9645799, -0.4656696, -2.134648, 0.8901961, 1, 0, 1,
-0.9634795, -1.059857, -1.864651, 0.8823529, 1, 0, 1,
-0.9435006, -1.349427, -2.80619, 0.8784314, 1, 0, 1,
-0.9388168, 0.9631903, -0.2149774, 0.8705882, 1, 0, 1,
-0.9211816, -0.2790272, -2.233275, 0.8666667, 1, 0, 1,
-0.9162155, 0.1959645, -2.717431, 0.8588235, 1, 0, 1,
-0.9008524, -1.061518, -2.614284, 0.854902, 1, 0, 1,
-0.8972468, -1.037244, -2.149028, 0.8470588, 1, 0, 1,
-0.8959273, -1.102612, -3.448827, 0.8431373, 1, 0, 1,
-0.8942676, 1.625279, -1.06913, 0.8352941, 1, 0, 1,
-0.8926427, 0.4397146, -0.6513572, 0.8313726, 1, 0, 1,
-0.890551, -0.4963823, -3.454632, 0.8235294, 1, 0, 1,
-0.8856002, -1.352327, -3.058617, 0.8196079, 1, 0, 1,
-0.8823752, 1.503855, -0.682997, 0.8117647, 1, 0, 1,
-0.8760416, 0.10538, -3.014155, 0.8078431, 1, 0, 1,
-0.8759268, -1.111345, -2.217575, 0.8, 1, 0, 1,
-0.8716717, -0.9908848, -3.485313, 0.7921569, 1, 0, 1,
-0.8619358, 0.3972038, -0.6274098, 0.7882353, 1, 0, 1,
-0.8609208, -0.1996468, -2.411429, 0.7803922, 1, 0, 1,
-0.8605103, 3.192453, -0.4616969, 0.7764706, 1, 0, 1,
-0.8579186, -0.7857225, -2.389925, 0.7686275, 1, 0, 1,
-0.8571163, -1.054603, -4.014644, 0.7647059, 1, 0, 1,
-0.8544803, 0.03559304, -2.101884, 0.7568628, 1, 0, 1,
-0.849461, 1.487324, -0.1714029, 0.7529412, 1, 0, 1,
-0.8478594, 0.3912892, -1.8879, 0.7450981, 1, 0, 1,
-0.8474854, 0.2039206, -2.356878, 0.7411765, 1, 0, 1,
-0.8391668, 0.8789029, -2.230475, 0.7333333, 1, 0, 1,
-0.838725, 0.3303002, -0.5771902, 0.7294118, 1, 0, 1,
-0.8321608, 0.03295714, -2.178497, 0.7215686, 1, 0, 1,
-0.8265283, -0.5308681, -1.107789, 0.7176471, 1, 0, 1,
-0.8219874, -0.6406682, -2.016948, 0.7098039, 1, 0, 1,
-0.8196518, -0.01367617, -1.938482, 0.7058824, 1, 0, 1,
-0.8189757, 0.3227983, 0.8840423, 0.6980392, 1, 0, 1,
-0.8094103, 0.2900304, -0.2501341, 0.6901961, 1, 0, 1,
-0.8055251, 1.297053, -0.1597861, 0.6862745, 1, 0, 1,
-0.804113, 0.009297275, -1.773365, 0.6784314, 1, 0, 1,
-0.8019106, 0.3468637, -1.414322, 0.6745098, 1, 0, 1,
-0.8009695, 0.8920594, -0.3802221, 0.6666667, 1, 0, 1,
-0.7979689, -0.3941015, -1.718053, 0.6627451, 1, 0, 1,
-0.7967058, 0.5302505, -2.898877, 0.654902, 1, 0, 1,
-0.7952381, 0.831175, -1.083567, 0.6509804, 1, 0, 1,
-0.7948931, 1.293419, -0.9761783, 0.6431373, 1, 0, 1,
-0.7892498, 0.1517436, -1.119654, 0.6392157, 1, 0, 1,
-0.7887711, -0.153046, -2.100703, 0.6313726, 1, 0, 1,
-0.7802813, -0.3848325, -2.918145, 0.627451, 1, 0, 1,
-0.7785434, -1.666005, -3.226332, 0.6196079, 1, 0, 1,
-0.7771018, 0.08048731, -0.9591987, 0.6156863, 1, 0, 1,
-0.7758889, -0.2932915, -3.433661, 0.6078432, 1, 0, 1,
-0.7741253, -0.3828133, -2.225383, 0.6039216, 1, 0, 1,
-0.7703424, 0.4914528, -0.4406411, 0.5960785, 1, 0, 1,
-0.7702289, 0.239197, 1.360669, 0.5882353, 1, 0, 1,
-0.7636499, 0.04207862, -3.130679, 0.5843138, 1, 0, 1,
-0.7604906, -0.470499, -2.199198, 0.5764706, 1, 0, 1,
-0.7572381, 0.2940293, -1.209962, 0.572549, 1, 0, 1,
-0.7564937, 1.244296, -1.31408, 0.5647059, 1, 0, 1,
-0.7535103, -0.5247797, -3.178353, 0.5607843, 1, 0, 1,
-0.7513787, 0.4612157, -0.5165128, 0.5529412, 1, 0, 1,
-0.7455798, -0.09433987, -1.726078, 0.5490196, 1, 0, 1,
-0.7409524, -0.2096287, -2.337491, 0.5411765, 1, 0, 1,
-0.7408636, -0.5517058, -1.354863, 0.5372549, 1, 0, 1,
-0.7404264, 0.6419339, 0.5508305, 0.5294118, 1, 0, 1,
-0.7377222, 1.460708, -1.856004, 0.5254902, 1, 0, 1,
-0.7374819, 0.1317393, -1.669642, 0.5176471, 1, 0, 1,
-0.7306585, -0.5124838, -4.092225, 0.5137255, 1, 0, 1,
-0.7226859, -0.5055569, -2.709544, 0.5058824, 1, 0, 1,
-0.7225683, 0.08616216, -0.3046822, 0.5019608, 1, 0, 1,
-0.7173043, -0.9995491, -2.578578, 0.4941176, 1, 0, 1,
-0.716328, -3.152338, -1.016031, 0.4862745, 1, 0, 1,
-0.7100723, -1.344857, -3.208193, 0.4823529, 1, 0, 1,
-0.7097932, 1.703599, -0.4500194, 0.4745098, 1, 0, 1,
-0.7083276, -1.126132, -4.312953, 0.4705882, 1, 0, 1,
-0.7070853, 1.271183, 0.2846059, 0.4627451, 1, 0, 1,
-0.6987979, -0.209863, -4.613665, 0.4588235, 1, 0, 1,
-0.6959636, 0.3819973, -1.341587, 0.4509804, 1, 0, 1,
-0.6931675, -0.8977057, -1.207425, 0.4470588, 1, 0, 1,
-0.6914977, -1.651398, -4.161986, 0.4392157, 1, 0, 1,
-0.686186, -1.333175, -3.646807, 0.4352941, 1, 0, 1,
-0.6798317, 0.3742303, -0.840261, 0.427451, 1, 0, 1,
-0.6775591, -0.7992524, -3.153862, 0.4235294, 1, 0, 1,
-0.6766632, -0.7698235, -5.015796, 0.4156863, 1, 0, 1,
-0.6757231, 2.003035, 1.181538, 0.4117647, 1, 0, 1,
-0.6748005, -1.205309, -3.739208, 0.4039216, 1, 0, 1,
-0.6726974, 0.08825355, -1.884213, 0.3960784, 1, 0, 1,
-0.6666223, 1.094233, -0.6023736, 0.3921569, 1, 0, 1,
-0.6618811, 0.4647612, -0.7606903, 0.3843137, 1, 0, 1,
-0.661505, -1.872913, -2.372578, 0.3803922, 1, 0, 1,
-0.6595592, 0.4521953, -0.1105145, 0.372549, 1, 0, 1,
-0.6567438, -0.4387732, -0.2946432, 0.3686275, 1, 0, 1,
-0.6520801, -0.984973, -1.957846, 0.3607843, 1, 0, 1,
-0.6431385, 0.4470621, -2.530163, 0.3568628, 1, 0, 1,
-0.6418666, -0.9065217, -1.444174, 0.3490196, 1, 0, 1,
-0.6394328, 0.6630469, -0.2745619, 0.345098, 1, 0, 1,
-0.6342181, -0.2276091, -1.174281, 0.3372549, 1, 0, 1,
-0.6307417, 0.2172134, -2.30146, 0.3333333, 1, 0, 1,
-0.6282099, 1.103727, -1.231536, 0.3254902, 1, 0, 1,
-0.6276614, -0.4195407, -2.956658, 0.3215686, 1, 0, 1,
-0.6183956, -0.6570054, -1.682691, 0.3137255, 1, 0, 1,
-0.6154652, 0.2422434, -1.277442, 0.3098039, 1, 0, 1,
-0.6144732, -0.9417339, -1.765623, 0.3019608, 1, 0, 1,
-0.6142088, 1.075204, -0.9050043, 0.2941177, 1, 0, 1,
-0.6125396, 0.6135646, -2.315409, 0.2901961, 1, 0, 1,
-0.6124205, 1.83257, -0.9525992, 0.282353, 1, 0, 1,
-0.6116512, -0.8545289, -2.762216, 0.2784314, 1, 0, 1,
-0.6109983, 0.7799363, -0.4511577, 0.2705882, 1, 0, 1,
-0.609728, -0.06126837, -0.7904223, 0.2666667, 1, 0, 1,
-0.6066176, 0.560678, -2.43935, 0.2588235, 1, 0, 1,
-0.6026146, 0.9254904, 0.4964848, 0.254902, 1, 0, 1,
-0.5930075, -2.914944, -3.358144, 0.2470588, 1, 0, 1,
-0.5919614, 0.5564474, -0.7667787, 0.2431373, 1, 0, 1,
-0.5908311, -0.3856229, -1.072766, 0.2352941, 1, 0, 1,
-0.5899189, -0.580842, -3.181886, 0.2313726, 1, 0, 1,
-0.5790807, -0.4748813, -0.4652994, 0.2235294, 1, 0, 1,
-0.5777577, 0.4926838, -0.5982066, 0.2196078, 1, 0, 1,
-0.5775436, 0.7654774, -2.23123, 0.2117647, 1, 0, 1,
-0.5737425, 1.016944, -0.1571965, 0.2078431, 1, 0, 1,
-0.5706104, -0.8787026, -4.027559, 0.2, 1, 0, 1,
-0.5693666, -0.1109943, -1.85455, 0.1921569, 1, 0, 1,
-0.5676775, 0.3952555, 0.03989419, 0.1882353, 1, 0, 1,
-0.5647802, 1.768116, -0.7387497, 0.1803922, 1, 0, 1,
-0.5601718, 1.48276, -0.6350148, 0.1764706, 1, 0, 1,
-0.5593864, 0.8165168, -0.7614943, 0.1686275, 1, 0, 1,
-0.5585959, 1.117883, -0.09984332, 0.1647059, 1, 0, 1,
-0.5521224, -0.02257488, 1.409269, 0.1568628, 1, 0, 1,
-0.548719, 0.8176994, -0.5476577, 0.1529412, 1, 0, 1,
-0.5461604, -0.8074558, -2.492973, 0.145098, 1, 0, 1,
-0.5428487, -0.4573461, -0.5296938, 0.1411765, 1, 0, 1,
-0.5403768, 0.02854722, -3.021855, 0.1333333, 1, 0, 1,
-0.5354325, -0.3641636, -2.779408, 0.1294118, 1, 0, 1,
-0.5350051, 0.4064223, 0.9255381, 0.1215686, 1, 0, 1,
-0.534816, -1.387453, -2.672523, 0.1176471, 1, 0, 1,
-0.5338519, -0.2525479, -0.3159912, 0.1098039, 1, 0, 1,
-0.5329661, 0.3889979, -1.536672, 0.1058824, 1, 0, 1,
-0.5308323, 0.8758223, 0.854108, 0.09803922, 1, 0, 1,
-0.5292081, -1.303821, -2.013798, 0.09019608, 1, 0, 1,
-0.5224862, 1.069286, -0.1157196, 0.08627451, 1, 0, 1,
-0.5193858, 1.241998, 0.9959158, 0.07843138, 1, 0, 1,
-0.5183079, -1.879314, -3.637989, 0.07450981, 1, 0, 1,
-0.5167563, 0.4558674, -2.51355, 0.06666667, 1, 0, 1,
-0.5147324, 0.09409245, -1.047873, 0.0627451, 1, 0, 1,
-0.5129051, -0.6024035, -1.153649, 0.05490196, 1, 0, 1,
-0.5123626, 1.44617, 0.7356445, 0.05098039, 1, 0, 1,
-0.5052778, -1.548786, -2.978944, 0.04313726, 1, 0, 1,
-0.5030664, -1.094507, -1.396548, 0.03921569, 1, 0, 1,
-0.4954719, -1.479463, -2.549186, 0.03137255, 1, 0, 1,
-0.4931366, 0.9763709, -1.210168, 0.02745098, 1, 0, 1,
-0.4819123, -0.2491374, -1.539345, 0.01960784, 1, 0, 1,
-0.4787458, -0.9993541, -4.684802, 0.01568628, 1, 0, 1,
-0.477266, -0.003534429, -1.888493, 0.007843138, 1, 0, 1,
-0.4755468, 1.009196, -2.397083, 0.003921569, 1, 0, 1,
-0.4744453, -0.5871509, -2.779355, 0, 1, 0.003921569, 1,
-0.4701597, 0.1337098, -1.509663, 0, 1, 0.01176471, 1,
-0.4695076, -0.4487102, -0.9738678, 0, 1, 0.01568628, 1,
-0.4676737, 1.860954, -1.183079, 0, 1, 0.02352941, 1,
-0.4654829, -1.349812, -2.733521, 0, 1, 0.02745098, 1,
-0.4586811, -0.6878815, -1.303391, 0, 1, 0.03529412, 1,
-0.4586314, 1.308526, -1.002451, 0, 1, 0.03921569, 1,
-0.4582122, 1.686959, -1.384269, 0, 1, 0.04705882, 1,
-0.457155, 0.0871328, -0.5734969, 0, 1, 0.05098039, 1,
-0.4549431, -0.7799748, -1.391011, 0, 1, 0.05882353, 1,
-0.4544747, 0.7548733, -0.9751273, 0, 1, 0.0627451, 1,
-0.4524965, 0.07394985, -2.431436, 0, 1, 0.07058824, 1,
-0.4522658, 0.9471588, 2.173589, 0, 1, 0.07450981, 1,
-0.451845, 0.373796, -0.201265, 0, 1, 0.08235294, 1,
-0.4517262, 0.50271, -1.089396, 0, 1, 0.08627451, 1,
-0.4511956, -0.4365654, -3.308928, 0, 1, 0.09411765, 1,
-0.4492158, -0.4659175, -1.980567, 0, 1, 0.1019608, 1,
-0.4491796, 0.713344, -1.844909, 0, 1, 0.1058824, 1,
-0.441785, -0.2405656, -3.889481, 0, 1, 0.1137255, 1,
-0.4373624, -0.2635974, -1.556821, 0, 1, 0.1176471, 1,
-0.4296542, -0.2945143, -3.612193, 0, 1, 0.1254902, 1,
-0.4285242, 0.1076791, -2.316712, 0, 1, 0.1294118, 1,
-0.4284688, -1.883819, -4.869157, 0, 1, 0.1372549, 1,
-0.426394, 0.5863034, -1.407626, 0, 1, 0.1411765, 1,
-0.4231907, -0.9156046, -3.382987, 0, 1, 0.1490196, 1,
-0.4220582, 1.877976, -3.471271, 0, 1, 0.1529412, 1,
-0.4176745, -1.143617, -1.253667, 0, 1, 0.1607843, 1,
-0.41407, 0.2666111, 0.690054, 0, 1, 0.1647059, 1,
-0.4130442, -0.7144792, -3.137168, 0, 1, 0.172549, 1,
-0.3969654, 0.2065537, -1.721405, 0, 1, 0.1764706, 1,
-0.3941722, -1.307887, -3.55481, 0, 1, 0.1843137, 1,
-0.3938, 0.2630501, -1.47769, 0, 1, 0.1882353, 1,
-0.3934917, 0.2879564, -0.8314922, 0, 1, 0.1960784, 1,
-0.3856496, 0.6043639, -1.008161, 0, 1, 0.2039216, 1,
-0.3832779, 0.8623205, 0.6157418, 0, 1, 0.2078431, 1,
-0.3821145, 1.210826, -0.09690006, 0, 1, 0.2156863, 1,
-0.3796616, -0.9819391, -1.446326, 0, 1, 0.2196078, 1,
-0.3778625, 0.1625563, 0.890278, 0, 1, 0.227451, 1,
-0.376641, -0.4846613, -3.733812, 0, 1, 0.2313726, 1,
-0.3760727, -1.170758, -1.640886, 0, 1, 0.2392157, 1,
-0.3749552, 3.116798, 1.207392, 0, 1, 0.2431373, 1,
-0.3740592, 0.1138657, -2.527823, 0, 1, 0.2509804, 1,
-0.3725823, 0.296467, -0.2906038, 0, 1, 0.254902, 1,
-0.3713512, -1.737227, -3.12296, 0, 1, 0.2627451, 1,
-0.366368, -0.4357524, -2.708883, 0, 1, 0.2666667, 1,
-0.3656543, -1.822667, -1.680623, 0, 1, 0.2745098, 1,
-0.3649336, 0.4148751, -0.7204995, 0, 1, 0.2784314, 1,
-0.3643992, 0.2058693, -4.395065, 0, 1, 0.2862745, 1,
-0.3621455, -0.5418455, -1.599525, 0, 1, 0.2901961, 1,
-0.3603545, -0.02422633, -1.975994, 0, 1, 0.2980392, 1,
-0.3590287, 1.507355, -0.4804027, 0, 1, 0.3058824, 1,
-0.3564723, -0.4586433, -1.982052, 0, 1, 0.3098039, 1,
-0.353581, 1.749999, -1.322367, 0, 1, 0.3176471, 1,
-0.3523877, -0.7261369, -0.9171649, 0, 1, 0.3215686, 1,
-0.3516105, 0.1967257, -1.660254, 0, 1, 0.3294118, 1,
-0.3509142, -1.273299, -2.409034, 0, 1, 0.3333333, 1,
-0.3471712, 0.6664833, -0.2977586, 0, 1, 0.3411765, 1,
-0.3469522, 0.799695, 0.382163, 0, 1, 0.345098, 1,
-0.3414042, 0.2983946, -0.7886074, 0, 1, 0.3529412, 1,
-0.3388971, 0.3824201, 1.250007, 0, 1, 0.3568628, 1,
-0.3384943, 0.3199075, -0.9564186, 0, 1, 0.3647059, 1,
-0.331885, -1.811597, -1.609059, 0, 1, 0.3686275, 1,
-0.3292972, 1.459895, 0.7576548, 0, 1, 0.3764706, 1,
-0.327781, -0.936222, -4.275489, 0, 1, 0.3803922, 1,
-0.3259346, 1.523052, -2.433786, 0, 1, 0.3882353, 1,
-0.3257829, 0.5098993, -0.07640664, 0, 1, 0.3921569, 1,
-0.3219624, -1.355926, -3.35744, 0, 1, 0.4, 1,
-0.3193537, -2.431111, -3.318683, 0, 1, 0.4078431, 1,
-0.3170691, -1.222789, -2.102663, 0, 1, 0.4117647, 1,
-0.3168171, -0.04824523, -2.21703, 0, 1, 0.4196078, 1,
-0.3166164, -1.014374, -1.88247, 0, 1, 0.4235294, 1,
-0.3122153, 0.4744567, -0.2950873, 0, 1, 0.4313726, 1,
-0.3107218, -1.106465, -2.710705, 0, 1, 0.4352941, 1,
-0.3103655, 0.4155444, -0.3004916, 0, 1, 0.4431373, 1,
-0.3051333, 0.8400292, -1.360041, 0, 1, 0.4470588, 1,
-0.3010094, 0.5153602, 0.2939738, 0, 1, 0.454902, 1,
-0.2978659, -1.910905, -3.758572, 0, 1, 0.4588235, 1,
-0.2968521, 0.2732379, -1.737404, 0, 1, 0.4666667, 1,
-0.2959234, -1.169605, -1.753243, 0, 1, 0.4705882, 1,
-0.2954557, 0.58089, 0.625214, 0, 1, 0.4784314, 1,
-0.2938471, -1.448099, -2.580351, 0, 1, 0.4823529, 1,
-0.2937993, -0.2783183, -2.208368, 0, 1, 0.4901961, 1,
-0.2926703, 0.6715724, -1.301027, 0, 1, 0.4941176, 1,
-0.2817478, -1.713757, -3.637359, 0, 1, 0.5019608, 1,
-0.2808724, 0.1897835, -0.10558, 0, 1, 0.509804, 1,
-0.2779151, 1.081916, 1.586953, 0, 1, 0.5137255, 1,
-0.2704889, 1.690217, 0.7474477, 0, 1, 0.5215687, 1,
-0.2689539, -0.03247626, -1.3484, 0, 1, 0.5254902, 1,
-0.2627692, -0.0117097, -4.058372, 0, 1, 0.5333334, 1,
-0.262712, -0.9477596, -2.107563, 0, 1, 0.5372549, 1,
-0.2565826, 2.327941, 0.5718253, 0, 1, 0.5450981, 1,
-0.2548406, 0.8478646, -0.8691135, 0, 1, 0.5490196, 1,
-0.25214, 1.328038, -0.3691213, 0, 1, 0.5568628, 1,
-0.2516569, -0.8628252, -4.334873, 0, 1, 0.5607843, 1,
-0.2460011, -0.4998958, -1.567891, 0, 1, 0.5686275, 1,
-0.2433319, -0.2567453, -2.781517, 0, 1, 0.572549, 1,
-0.2415766, 1.467847, -0.3927694, 0, 1, 0.5803922, 1,
-0.2392547, 1.398401, 0.1079822, 0, 1, 0.5843138, 1,
-0.2382157, -0.7116551, -2.264222, 0, 1, 0.5921569, 1,
-0.2373062, 1.706578, 0.1628064, 0, 1, 0.5960785, 1,
-0.2338666, -0.0424688, -1.383077, 0, 1, 0.6039216, 1,
-0.2319303, -1.291268, -4.200835, 0, 1, 0.6117647, 1,
-0.2310771, 0.4608427, -1.057036, 0, 1, 0.6156863, 1,
-0.2250059, -2.366077, -4.07889, 0, 1, 0.6235294, 1,
-0.224414, 0.9496552, 0.6463497, 0, 1, 0.627451, 1,
-0.2161895, 1.246175, -1.367862, 0, 1, 0.6352941, 1,
-0.2151569, -0.1639374, -3.232164, 0, 1, 0.6392157, 1,
-0.2141845, -1.27727, -3.494836, 0, 1, 0.6470588, 1,
-0.2129976, -0.574545, -0.7328466, 0, 1, 0.6509804, 1,
-0.2122207, 0.1280508, -1.239138, 0, 1, 0.6588235, 1,
-0.2107306, -0.4049904, -3.915812, 0, 1, 0.6627451, 1,
-0.2083586, -0.2353424, -0.7898593, 0, 1, 0.6705883, 1,
-0.1981432, 0.7535505, -1.608224, 0, 1, 0.6745098, 1,
-0.197285, -1.017979, -4.011497, 0, 1, 0.682353, 1,
-0.1965636, 0.8673639, -0.8107148, 0, 1, 0.6862745, 1,
-0.1963145, 1.564467, 0.6078346, 0, 1, 0.6941177, 1,
-0.1947494, -1.1298, -3.81688, 0, 1, 0.7019608, 1,
-0.1903554, 0.4624773, 0.1173661, 0, 1, 0.7058824, 1,
-0.1901872, -0.8173597, -2.866807, 0, 1, 0.7137255, 1,
-0.1897452, -1.592, -3.677991, 0, 1, 0.7176471, 1,
-0.1862488, -0.3313765, -0.9967397, 0, 1, 0.7254902, 1,
-0.1860028, 0.1094114, 0.09342967, 0, 1, 0.7294118, 1,
-0.1837307, 0.7751401, 0.7562813, 0, 1, 0.7372549, 1,
-0.178662, -0.2101292, -1.959486, 0, 1, 0.7411765, 1,
-0.1767355, 0.0196967, -0.353604, 0, 1, 0.7490196, 1,
-0.1763836, -0.6327932, -3.024407, 0, 1, 0.7529412, 1,
-0.1738149, 1.465181, -0.2735432, 0, 1, 0.7607843, 1,
-0.1697679, -1.32188, -2.41254, 0, 1, 0.7647059, 1,
-0.1663432, -0.4796919, -4.160966, 0, 1, 0.772549, 1,
-0.159129, -0.3860741, -3.039356, 0, 1, 0.7764706, 1,
-0.1581866, 0.8117165, -1.35473, 0, 1, 0.7843137, 1,
-0.1576815, 0.4439806, -1.49731, 0, 1, 0.7882353, 1,
-0.1575033, 0.2551725, -0.8482088, 0, 1, 0.7960784, 1,
-0.1573172, 0.9072068, 1.107161, 0, 1, 0.8039216, 1,
-0.1567316, -0.248808, -3.5162, 0, 1, 0.8078431, 1,
-0.15375, 0.3475064, -0.06766082, 0, 1, 0.8156863, 1,
-0.152254, 0.6659582, 0.149014, 0, 1, 0.8196079, 1,
-0.1521205, -0.688588, -2.923926, 0, 1, 0.827451, 1,
-0.1513821, 0.3587341, -0.1065367, 0, 1, 0.8313726, 1,
-0.1508094, -0.389935, -1.382102, 0, 1, 0.8392157, 1,
-0.150126, 1.652456, -0.1070279, 0, 1, 0.8431373, 1,
-0.1471024, -1.39005, -3.616775, 0, 1, 0.8509804, 1,
-0.1460554, -1.373196, -3.680342, 0, 1, 0.854902, 1,
-0.1450989, -1.069014, -2.558626, 0, 1, 0.8627451, 1,
-0.1448449, 1.934295, -0.6541469, 0, 1, 0.8666667, 1,
-0.1418791, -0.480356, -0.9374031, 0, 1, 0.8745098, 1,
-0.141598, -0.4722666, -1.717162, 0, 1, 0.8784314, 1,
-0.1391906, -1.247946, -4.22195, 0, 1, 0.8862745, 1,
-0.1364986, -0.5070233, -2.685375, 0, 1, 0.8901961, 1,
-0.1364851, -0.3260251, -1.718578, 0, 1, 0.8980392, 1,
-0.1355107, 0.2584943, -0.3626172, 0, 1, 0.9058824, 1,
-0.130692, -0.08492175, -1.86097, 0, 1, 0.9098039, 1,
-0.1283562, 0.8172153, 0.6168219, 0, 1, 0.9176471, 1,
-0.1268172, -0.9911793, -4.793694, 0, 1, 0.9215686, 1,
-0.1259372, 0.9183436, 0.001423947, 0, 1, 0.9294118, 1,
-0.1100345, 0.1293055, -0.08750957, 0, 1, 0.9333333, 1,
-0.1094168, -0.3589004, 0.06019289, 0, 1, 0.9411765, 1,
-0.1093866, 1.665365, -2.426822, 0, 1, 0.945098, 1,
-0.1083657, 1.200609, -0.6168301, 0, 1, 0.9529412, 1,
-0.1068846, -0.06922808, -3.00469, 0, 1, 0.9568627, 1,
-0.1049728, -0.3173204, -3.005107, 0, 1, 0.9647059, 1,
-0.1031615, 0.8982303, -0.0984903, 0, 1, 0.9686275, 1,
-0.09998623, 1.053636, -0.05813483, 0, 1, 0.9764706, 1,
-0.09704868, 0.873934, -0.5622901, 0, 1, 0.9803922, 1,
-0.09566782, -1.178905, -2.14797, 0, 1, 0.9882353, 1,
-0.09457175, -0.03341789, -2.482618, 0, 1, 0.9921569, 1,
-0.09417187, 1.097242, 0.2137243, 0, 1, 1, 1,
-0.093442, -1.043619, -3.048741, 0, 0.9921569, 1, 1,
-0.09318546, 2.245975, -0.6665183, 0, 0.9882353, 1, 1,
-0.09083039, 0.6284155, -0.7913742, 0, 0.9803922, 1, 1,
-0.07433417, -0.4437397, -3.32591, 0, 0.9764706, 1, 1,
-0.07394426, 0.899848, 0.2977103, 0, 0.9686275, 1, 1,
-0.07154225, 0.5553619, 0.2018616, 0, 0.9647059, 1, 1,
-0.06802646, 0.1149987, 1.137071, 0, 0.9568627, 1, 1,
-0.06409261, 2.143128, -0.9821654, 0, 0.9529412, 1, 1,
-0.06394043, 1.130174, 0.129833, 0, 0.945098, 1, 1,
-0.06021855, -1.542692, -2.192755, 0, 0.9411765, 1, 1,
-0.0518346, -0.9223682, -1.672721, 0, 0.9333333, 1, 1,
-0.04276839, -1.206851, -2.941185, 0, 0.9294118, 1, 1,
-0.0372115, 0.7827051, -0.5115725, 0, 0.9215686, 1, 1,
-0.03700681, 0.10838, 0.9280807, 0, 0.9176471, 1, 1,
-0.03643217, -0.1582737, -4.605953, 0, 0.9098039, 1, 1,
-0.02125885, -1.151259, -3.651635, 0, 0.9058824, 1, 1,
-0.01970035, -0.5185963, -4.538145, 0, 0.8980392, 1, 1,
-0.01964767, -0.004505267, -0.6830578, 0, 0.8901961, 1, 1,
-0.01084132, 0.7759705, -1.921359, 0, 0.8862745, 1, 1,
-0.00988376, 0.668668, -1.278588, 0, 0.8784314, 1, 1,
-0.006976034, 0.4944975, -0.2956562, 0, 0.8745098, 1, 1,
-0.006492714, -1.073288, -3.928643, 0, 0.8666667, 1, 1,
-0.004534943, -0.6321034, -1.916227, 0, 0.8627451, 1, 1,
-0.0004091854, 0.4727204, -0.4919229, 0, 0.854902, 1, 1,
0.0005747059, -0.7224905, 3.502575, 0, 0.8509804, 1, 1,
0.001714564, 0.3737012, -1.735846, 0, 0.8431373, 1, 1,
0.004523266, 0.1957404, -0.86402, 0, 0.8392157, 1, 1,
0.008278538, 1.143083, 0.3325647, 0, 0.8313726, 1, 1,
0.008511545, 0.4814514, -0.4883933, 0, 0.827451, 1, 1,
0.008939809, 0.6804935, -0.3669217, 0, 0.8196079, 1, 1,
0.01415471, 0.8152464, 1.084675, 0, 0.8156863, 1, 1,
0.02448783, -0.274779, 2.034058, 0, 0.8078431, 1, 1,
0.02560444, 0.2451351, -1.817947, 0, 0.8039216, 1, 1,
0.02769214, 0.0463645, 0.9682062, 0, 0.7960784, 1, 1,
0.02778465, 0.8739076, -0.4983811, 0, 0.7882353, 1, 1,
0.02793089, 0.1203291, 0.1574734, 0, 0.7843137, 1, 1,
0.0298159, 1.300791, 1.083984, 0, 0.7764706, 1, 1,
0.0436589, 0.8515399, 0.4291722, 0, 0.772549, 1, 1,
0.04864655, 0.396773, -1.637541, 0, 0.7647059, 1, 1,
0.04899471, -0.5905167, 1.516339, 0, 0.7607843, 1, 1,
0.05431176, 0.159041, -1.37365, 0, 0.7529412, 1, 1,
0.05868223, 0.4703606, 0.9154733, 0, 0.7490196, 1, 1,
0.05909828, 1.61379, -0.5899631, 0, 0.7411765, 1, 1,
0.07038846, 1.121143, 1.415717, 0, 0.7372549, 1, 1,
0.0709236, -0.2259562, 2.038345, 0, 0.7294118, 1, 1,
0.07172398, -0.5609167, 2.293356, 0, 0.7254902, 1, 1,
0.07198731, -0.7852311, 4.432828, 0, 0.7176471, 1, 1,
0.07286389, 0.9407326, -0.3874446, 0, 0.7137255, 1, 1,
0.07391098, 0.357586, 2.124896, 0, 0.7058824, 1, 1,
0.07542569, -0.7247728, 1.884048, 0, 0.6980392, 1, 1,
0.07552794, 1.319476, 0.1125229, 0, 0.6941177, 1, 1,
0.08539109, -0.4901259, 0.9463833, 0, 0.6862745, 1, 1,
0.0866503, -0.20214, 0.9077529, 0, 0.682353, 1, 1,
0.08738875, 0.8678142, 2.580416, 0, 0.6745098, 1, 1,
0.09415159, 0.2084261, 1.570444, 0, 0.6705883, 1, 1,
0.09472922, 0.2383653, -1.238356, 0, 0.6627451, 1, 1,
0.09690329, -2.729703, 4.917118, 0, 0.6588235, 1, 1,
0.1051047, 0.3937576, -0.9447271, 0, 0.6509804, 1, 1,
0.1067905, 0.5731769, 0.5690066, 0, 0.6470588, 1, 1,
0.1096346, 1.475197, 0.4508215, 0, 0.6392157, 1, 1,
0.1134645, 0.1053705, 2.614843, 0, 0.6352941, 1, 1,
0.113642, -0.0518904, 2.895565, 0, 0.627451, 1, 1,
0.1167774, 0.8279783, 0.287964, 0, 0.6235294, 1, 1,
0.1178011, -0.2709278, 1.03953, 0, 0.6156863, 1, 1,
0.1201745, -0.5325955, 2.884291, 0, 0.6117647, 1, 1,
0.122957, -0.59333, 5.383391, 0, 0.6039216, 1, 1,
0.1255584, 0.4614827, -0.5144014, 0, 0.5960785, 1, 1,
0.1262536, 0.3298095, -0.6108951, 0, 0.5921569, 1, 1,
0.1276462, -0.2767622, 1.785493, 0, 0.5843138, 1, 1,
0.1282879, 0.4077024, 2.171537, 0, 0.5803922, 1, 1,
0.1326806, -0.6919412, 3.620455, 0, 0.572549, 1, 1,
0.1365809, -0.9848628, 3.248863, 0, 0.5686275, 1, 1,
0.1521101, 0.4063989, 1.114181, 0, 0.5607843, 1, 1,
0.1772833, 0.6736183, -0.2592469, 0, 0.5568628, 1, 1,
0.1812172, -0.5113934, 1.790443, 0, 0.5490196, 1, 1,
0.1829032, -0.2094092, 4.257587, 0, 0.5450981, 1, 1,
0.1865594, 0.5902825, -0.06398979, 0, 0.5372549, 1, 1,
0.186828, 2.073618, 0.1813024, 0, 0.5333334, 1, 1,
0.1915894, 0.3755987, 0.2198924, 0, 0.5254902, 1, 1,
0.1945271, -0.1387313, 2.290576, 0, 0.5215687, 1, 1,
0.2004056, -1.336167, 2.87743, 0, 0.5137255, 1, 1,
0.2016858, -1.09745, 3.875739, 0, 0.509804, 1, 1,
0.2039354, -1.911586, 3.007788, 0, 0.5019608, 1, 1,
0.2045933, -1.331746, 5.582467, 0, 0.4941176, 1, 1,
0.2053056, -2.293493, 4.547058, 0, 0.4901961, 1, 1,
0.2053631, -0.441653, 2.996233, 0, 0.4823529, 1, 1,
0.2056886, -0.7956924, 2.673988, 0, 0.4784314, 1, 1,
0.2079855, 0.6257046, 0.5238805, 0, 0.4705882, 1, 1,
0.2144323, -0.483671, 0.7453077, 0, 0.4666667, 1, 1,
0.2155225, -0.3314989, 2.460274, 0, 0.4588235, 1, 1,
0.2230563, 1.27624, -0.8131671, 0, 0.454902, 1, 1,
0.2309013, 0.7548748, -0.365971, 0, 0.4470588, 1, 1,
0.2320844, -0.1940133, 2.936134, 0, 0.4431373, 1, 1,
0.2323547, -1.286575, 3.318435, 0, 0.4352941, 1, 1,
0.2327772, 0.363719, 1.178486, 0, 0.4313726, 1, 1,
0.2331022, 0.1194464, 1.69433, 0, 0.4235294, 1, 1,
0.2399128, 0.3059843, 0.6405166, 0, 0.4196078, 1, 1,
0.2425703, -0.0387229, 3.457685, 0, 0.4117647, 1, 1,
0.2456527, -1.085297, 3.494331, 0, 0.4078431, 1, 1,
0.2466708, 1.067839, 0.5723214, 0, 0.4, 1, 1,
0.2496088, 0.715472, -1.168967, 0, 0.3921569, 1, 1,
0.2534849, -0.8742355, 1.893231, 0, 0.3882353, 1, 1,
0.255633, 0.3544666, 0.388282, 0, 0.3803922, 1, 1,
0.2584113, -2.017395, 3.940759, 0, 0.3764706, 1, 1,
0.2597223, -0.0632759, 0.7711298, 0, 0.3686275, 1, 1,
0.2602591, 1.429045, 2.221523, 0, 0.3647059, 1, 1,
0.2630833, 1.33428, 1.256374, 0, 0.3568628, 1, 1,
0.2643269, -0.7043254, 1.747799, 0, 0.3529412, 1, 1,
0.2682217, -0.9914848, 1.955634, 0, 0.345098, 1, 1,
0.2701217, 1.447849, 0.009953849, 0, 0.3411765, 1, 1,
0.270244, -1.115098, 2.807818, 0, 0.3333333, 1, 1,
0.2718938, -0.6620917, 2.624755, 0, 0.3294118, 1, 1,
0.2733606, -0.08215982, 2.482723, 0, 0.3215686, 1, 1,
0.274493, 1.982941, -0.2949445, 0, 0.3176471, 1, 1,
0.2762674, -0.8065704, 2.558128, 0, 0.3098039, 1, 1,
0.2764673, -1.839272, 3.869796, 0, 0.3058824, 1, 1,
0.2767878, 0.6332241, 0.1722994, 0, 0.2980392, 1, 1,
0.2778201, 0.8997358, -0.6749068, 0, 0.2901961, 1, 1,
0.2783338, 0.6699646, 0.7080212, 0, 0.2862745, 1, 1,
0.2788773, 0.7501689, -0.5726188, 0, 0.2784314, 1, 1,
0.2792907, 1.464845, 0.5177588, 0, 0.2745098, 1, 1,
0.2809603, 2.143979, -1.265224, 0, 0.2666667, 1, 1,
0.2826735, -1.718964, 2.637347, 0, 0.2627451, 1, 1,
0.2839249, 1.911146, -0.1624215, 0, 0.254902, 1, 1,
0.2853429, 1.285129, 2.327489, 0, 0.2509804, 1, 1,
0.2896819, 0.2729359, 2.036012, 0, 0.2431373, 1, 1,
0.2899851, 0.3331397, 1.062802, 0, 0.2392157, 1, 1,
0.294722, 1.34362, 0.188391, 0, 0.2313726, 1, 1,
0.2958519, -0.5183543, 3.46568, 0, 0.227451, 1, 1,
0.3015912, 0.5435416, -0.006728345, 0, 0.2196078, 1, 1,
0.3035225, -0.6142915, 2.520349, 0, 0.2156863, 1, 1,
0.3068602, -0.03773569, -0.3124776, 0, 0.2078431, 1, 1,
0.3085095, -0.307091, 3.39859, 0, 0.2039216, 1, 1,
0.3118968, -1.199916, 2.958999, 0, 0.1960784, 1, 1,
0.3125326, 1.52154, 0.04388379, 0, 0.1882353, 1, 1,
0.3153154, 0.4862315, 1.924092, 0, 0.1843137, 1, 1,
0.3160765, -2.002351, 4.076355, 0, 0.1764706, 1, 1,
0.3181691, 0.2789237, 0.2566984, 0, 0.172549, 1, 1,
0.3194159, 1.615487, 0.7426411, 0, 0.1647059, 1, 1,
0.3216058, 1.172774, 1.988668, 0, 0.1607843, 1, 1,
0.3220637, 1.365829, 1.152682, 0, 0.1529412, 1, 1,
0.3229639, 0.4618846, 1.247496, 0, 0.1490196, 1, 1,
0.3296871, -0.3191885, 0.2915815, 0, 0.1411765, 1, 1,
0.3345394, -1.26229, 3.592031, 0, 0.1372549, 1, 1,
0.3398272, -0.08714972, 2.322668, 0, 0.1294118, 1, 1,
0.3435049, 0.005116516, 1.690564, 0, 0.1254902, 1, 1,
0.3480726, -1.922619, 1.87523, 0, 0.1176471, 1, 1,
0.3494487, -0.5599863, 3.565748, 0, 0.1137255, 1, 1,
0.3518332, -0.9723503, 4.82478, 0, 0.1058824, 1, 1,
0.3618998, -1.961297, 3.966376, 0, 0.09803922, 1, 1,
0.3635773, -0.5327591, 3.969564, 0, 0.09411765, 1, 1,
0.3653547, -1.403232, 4.327154, 0, 0.08627451, 1, 1,
0.3687639, -0.7527409, 4.233084, 0, 0.08235294, 1, 1,
0.37582, -0.8804063, 2.69123, 0, 0.07450981, 1, 1,
0.3764789, -1.438844, 3.972419, 0, 0.07058824, 1, 1,
0.3831334, 1.822254, 0.4206447, 0, 0.0627451, 1, 1,
0.389522, -1.043827, 3.830733, 0, 0.05882353, 1, 1,
0.393292, -0.8550999, 1.467378, 0, 0.05098039, 1, 1,
0.4023836, -0.3716012, 3.127209, 0, 0.04705882, 1, 1,
0.4036711, -2.837784, 3.6438, 0, 0.03921569, 1, 1,
0.4046235, 1.156705, 0.09857912, 0, 0.03529412, 1, 1,
0.4070167, -0.9398878, 2.194568, 0, 0.02745098, 1, 1,
0.4071528, -0.8854426, 2.298167, 0, 0.02352941, 1, 1,
0.4125603, -0.7973318, 2.6885, 0, 0.01568628, 1, 1,
0.4136534, 0.0189815, 1.487351, 0, 0.01176471, 1, 1,
0.4245842, -0.2265744, 0.7217295, 0, 0.003921569, 1, 1,
0.4250779, -2.669822, 3.242473, 0.003921569, 0, 1, 1,
0.4262893, 1.543284, -0.6003262, 0.007843138, 0, 1, 1,
0.4320119, 1.291629, 0.4004816, 0.01568628, 0, 1, 1,
0.4330436, 0.3493443, -0.6418664, 0.01960784, 0, 1, 1,
0.4414866, -1.10217, 1.113204, 0.02745098, 0, 1, 1,
0.4422883, 0.6977891, 0.6763318, 0.03137255, 0, 1, 1,
0.4424343, -1.461828, 3.215003, 0.03921569, 0, 1, 1,
0.4428865, -0.7765371, 1.12524, 0.04313726, 0, 1, 1,
0.4435885, -0.9160522, 3.900825, 0.05098039, 0, 1, 1,
0.4442344, 0.270175, -0.00875303, 0.05490196, 0, 1, 1,
0.4446526, -0.490969, 2.894033, 0.0627451, 0, 1, 1,
0.4457665, -1.713923, 3.027527, 0.06666667, 0, 1, 1,
0.4468949, -0.2781975, 1.400589, 0.07450981, 0, 1, 1,
0.4485518, 1.267239, 1.085526, 0.07843138, 0, 1, 1,
0.4518118, -0.4414263, 1.838343, 0.08627451, 0, 1, 1,
0.4520479, 0.8297185, -1.730032, 0.09019608, 0, 1, 1,
0.452139, 1.522477, 0.9516239, 0.09803922, 0, 1, 1,
0.4534518, -0.8161898, 2.023533, 0.1058824, 0, 1, 1,
0.4545073, 1.019351, -0.2045169, 0.1098039, 0, 1, 1,
0.4552907, 1.205049, -0.3839767, 0.1176471, 0, 1, 1,
0.4573709, 1.161241, 1.245735, 0.1215686, 0, 1, 1,
0.4575125, -0.6267169, 0.518931, 0.1294118, 0, 1, 1,
0.462344, 0.08821862, -0.8214096, 0.1333333, 0, 1, 1,
0.46281, -1.889727, 3.068678, 0.1411765, 0, 1, 1,
0.4646502, 1.644174, 0.2857526, 0.145098, 0, 1, 1,
0.4654346, -0.7740842, 1.261531, 0.1529412, 0, 1, 1,
0.4705998, -0.7054611, 1.859142, 0.1568628, 0, 1, 1,
0.4732122, 0.1362274, 0.6213018, 0.1647059, 0, 1, 1,
0.4760628, -1.19108, 2.719042, 0.1686275, 0, 1, 1,
0.4820954, -0.8190526, 2.534403, 0.1764706, 0, 1, 1,
0.488975, -0.06947963, 1.881649, 0.1803922, 0, 1, 1,
0.4993921, -0.9799617, 1.552727, 0.1882353, 0, 1, 1,
0.5005299, -0.2423857, 1.590063, 0.1921569, 0, 1, 1,
0.5011543, -2.257462, 2.724902, 0.2, 0, 1, 1,
0.5034401, 0.1721405, 1.018733, 0.2078431, 0, 1, 1,
0.5038395, -0.04247852, 0.2638202, 0.2117647, 0, 1, 1,
0.5059178, -0.3572801, 2.726935, 0.2196078, 0, 1, 1,
0.511825, -0.4920158, 3.775404, 0.2235294, 0, 1, 1,
0.5152225, -0.4139893, 2.778337, 0.2313726, 0, 1, 1,
0.518914, 0.3701131, 1.441144, 0.2352941, 0, 1, 1,
0.5241637, 0.8692974, 1.352871, 0.2431373, 0, 1, 1,
0.5259194, -1.67931, 1.476837, 0.2470588, 0, 1, 1,
0.5265265, 1.069356, 1.182195, 0.254902, 0, 1, 1,
0.5285487, 0.7704679, -0.6035255, 0.2588235, 0, 1, 1,
0.5285747, 0.4103935, 1.317777, 0.2666667, 0, 1, 1,
0.53076, -0.02515401, 1.491951, 0.2705882, 0, 1, 1,
0.5326982, 0.8054912, -1.250907, 0.2784314, 0, 1, 1,
0.5358727, 0.6628178, -0.1188729, 0.282353, 0, 1, 1,
0.5394957, 0.5622513, 2.815891, 0.2901961, 0, 1, 1,
0.5411268, -0.7003257, 2.820167, 0.2941177, 0, 1, 1,
0.5418497, 0.4439301, 0.4244418, 0.3019608, 0, 1, 1,
0.5484267, -0.9947584, 3.142711, 0.3098039, 0, 1, 1,
0.5493174, 0.2656653, 1.164207, 0.3137255, 0, 1, 1,
0.55208, 0.6289008, 1.699269, 0.3215686, 0, 1, 1,
0.5536162, 0.4763304, 1.11536, 0.3254902, 0, 1, 1,
0.5562629, -0.08453093, 2.010432, 0.3333333, 0, 1, 1,
0.5595898, -0.42264, 0.936251, 0.3372549, 0, 1, 1,
0.5658143, -0.4191549, -0.01232648, 0.345098, 0, 1, 1,
0.5687997, 0.5106708, 0.8551749, 0.3490196, 0, 1, 1,
0.5692409, 0.6950317, -0.5708927, 0.3568628, 0, 1, 1,
0.5706221, -0.2519935, 0.8959283, 0.3607843, 0, 1, 1,
0.5742044, -1.347524, 1.423825, 0.3686275, 0, 1, 1,
0.5743688, 0.2128432, 0.2747, 0.372549, 0, 1, 1,
0.5744007, -0.5655023, 3.720948, 0.3803922, 0, 1, 1,
0.5771936, -0.9111078, 3.459855, 0.3843137, 0, 1, 1,
0.5808844, -0.1900946, 2.469779, 0.3921569, 0, 1, 1,
0.5863619, 1.107657, 0.9860336, 0.3960784, 0, 1, 1,
0.5900443, 0.8408681, 0.2588756, 0.4039216, 0, 1, 1,
0.590308, -0.5968844, 2.108829, 0.4117647, 0, 1, 1,
0.5904328, 0.2388937, 1.943474, 0.4156863, 0, 1, 1,
0.5910891, 1.648151, -0.4411827, 0.4235294, 0, 1, 1,
0.5927584, 0.2900433, 1.910954, 0.427451, 0, 1, 1,
0.5934104, -0.4600345, 4.606962, 0.4352941, 0, 1, 1,
0.6035064, -0.7700469, 1.580883, 0.4392157, 0, 1, 1,
0.606175, 0.986278, 0.7985224, 0.4470588, 0, 1, 1,
0.6120734, -0.07867125, 1.658674, 0.4509804, 0, 1, 1,
0.6124733, 0.6086772, 0.6363487, 0.4588235, 0, 1, 1,
0.617188, -1.189705, 3.007644, 0.4627451, 0, 1, 1,
0.6189676, 0.8735849, 1.052292, 0.4705882, 0, 1, 1,
0.6225398, 1.32332, 1.491238, 0.4745098, 0, 1, 1,
0.6292403, -1.377806, 2.700136, 0.4823529, 0, 1, 1,
0.6304477, -1.513136, 2.039191, 0.4862745, 0, 1, 1,
0.6310558, 0.2932557, 1.081195, 0.4941176, 0, 1, 1,
0.6338061, 1.753627, -0.721836, 0.5019608, 0, 1, 1,
0.6394819, 0.9676543, 1.09489, 0.5058824, 0, 1, 1,
0.640828, 0.009870245, 4.205514, 0.5137255, 0, 1, 1,
0.6417021, -1.918395, 2.323623, 0.5176471, 0, 1, 1,
0.6419857, 0.6535316, 1.407247, 0.5254902, 0, 1, 1,
0.6458581, -1.116733, 3.517127, 0.5294118, 0, 1, 1,
0.6557017, -0.3826168, 1.40858, 0.5372549, 0, 1, 1,
0.6603291, 0.4561484, -0.01894404, 0.5411765, 0, 1, 1,
0.661855, -0.1046185, 1.58214, 0.5490196, 0, 1, 1,
0.6630405, -0.6491181, 0.110901, 0.5529412, 0, 1, 1,
0.6637522, -0.2190702, 1.15059, 0.5607843, 0, 1, 1,
0.664345, 1.58044, -0.5719799, 0.5647059, 0, 1, 1,
0.6647654, 1.04878, 1.448298, 0.572549, 0, 1, 1,
0.6708875, -0.6402819, 3.141685, 0.5764706, 0, 1, 1,
0.6730511, -1.045897, 1.96013, 0.5843138, 0, 1, 1,
0.6737763, 0.8376964, 1.612092, 0.5882353, 0, 1, 1,
0.678075, -0.515576, 1.178306, 0.5960785, 0, 1, 1,
0.6813565, -2.250718, 3.893137, 0.6039216, 0, 1, 1,
0.6891281, -0.2922919, 1.536708, 0.6078432, 0, 1, 1,
0.6992743, -0.02423095, 1.465813, 0.6156863, 0, 1, 1,
0.7073222, 1.227286, -0.5562342, 0.6196079, 0, 1, 1,
0.714415, 0.7319149, -0.473117, 0.627451, 0, 1, 1,
0.7189302, 0.4002329, 1.067345, 0.6313726, 0, 1, 1,
0.7210554, -0.2016983, 0.2967413, 0.6392157, 0, 1, 1,
0.7223931, 0.783859, 1.302349, 0.6431373, 0, 1, 1,
0.7318491, -1.168713, 1.787328, 0.6509804, 0, 1, 1,
0.7326391, -0.5699117, 2.519104, 0.654902, 0, 1, 1,
0.7366584, 1.470886, 0.1291859, 0.6627451, 0, 1, 1,
0.7369241, 1.095986, 1.724517, 0.6666667, 0, 1, 1,
0.7409442, 0.1467707, 1.585385, 0.6745098, 0, 1, 1,
0.7416766, -1.307846, 4.407436, 0.6784314, 0, 1, 1,
0.7434681, -1.443239, 3.908828, 0.6862745, 0, 1, 1,
0.7451788, 1.182391, 0.2329999, 0.6901961, 0, 1, 1,
0.745392, -0.1696516, 1.178537, 0.6980392, 0, 1, 1,
0.7460619, 0.4222172, 0.1906813, 0.7058824, 0, 1, 1,
0.7486438, -0.4214399, 1.520217, 0.7098039, 0, 1, 1,
0.7512342, -0.03056265, 1.404434, 0.7176471, 0, 1, 1,
0.7521269, -1.19846, 3.441303, 0.7215686, 0, 1, 1,
0.7561752, 1.13226, -0.4177089, 0.7294118, 0, 1, 1,
0.7601694, 1.393535, -0.08095817, 0.7333333, 0, 1, 1,
0.7620022, -0.8602314, 3.344058, 0.7411765, 0, 1, 1,
0.762554, 0.585651, 0.3123389, 0.7450981, 0, 1, 1,
0.765378, 2.684531, 0.3339723, 0.7529412, 0, 1, 1,
0.7674457, -0.1771438, 0.5690533, 0.7568628, 0, 1, 1,
0.7685172, -0.07988784, 1.616038, 0.7647059, 0, 1, 1,
0.7707354, -0.2921323, 0.6478357, 0.7686275, 0, 1, 1,
0.770951, 0.5162569, 3.213316, 0.7764706, 0, 1, 1,
0.771203, -0.0614479, 1.128006, 0.7803922, 0, 1, 1,
0.7717109, -0.3939505, 2.303988, 0.7882353, 0, 1, 1,
0.7723776, -1.329417, 3.152216, 0.7921569, 0, 1, 1,
0.772495, 0.2103406, 1.399655, 0.8, 0, 1, 1,
0.7749451, 0.01813496, 1.088716, 0.8078431, 0, 1, 1,
0.775047, 0.2803909, 2.308863, 0.8117647, 0, 1, 1,
0.7777548, -0.5103245, 1.761383, 0.8196079, 0, 1, 1,
0.7780521, -0.9739835, 2.179298, 0.8235294, 0, 1, 1,
0.7803053, 0.9879415, 2.04383, 0.8313726, 0, 1, 1,
0.7812244, -0.6345802, 1.729471, 0.8352941, 0, 1, 1,
0.7837834, -0.3510364, 2.974462, 0.8431373, 0, 1, 1,
0.7908402, -0.5532086, 0.1275462, 0.8470588, 0, 1, 1,
0.7917201, -0.203634, 1.721212, 0.854902, 0, 1, 1,
0.7918479, -0.1576896, 2.064366, 0.8588235, 0, 1, 1,
0.795867, -1.189663, 0.6554435, 0.8666667, 0, 1, 1,
0.8153917, 1.247737, 1.565152, 0.8705882, 0, 1, 1,
0.8183201, -2.134482, 3.530773, 0.8784314, 0, 1, 1,
0.8238232, 0.7485054, 1.915992, 0.8823529, 0, 1, 1,
0.8297376, 2.402092, 0.9133033, 0.8901961, 0, 1, 1,
0.8308557, 0.5876847, 2.128213, 0.8941177, 0, 1, 1,
0.831835, 1.077314, 1.604794, 0.9019608, 0, 1, 1,
0.8382311, -1.459135, 3.725191, 0.9098039, 0, 1, 1,
0.8384908, 1.288258, 0.6682511, 0.9137255, 0, 1, 1,
0.8465552, 1.771779, -0.248514, 0.9215686, 0, 1, 1,
0.8497539, -0.6727262, 2.076104, 0.9254902, 0, 1, 1,
0.8527554, -1.074166, 3.343161, 0.9333333, 0, 1, 1,
0.855354, -0.9131457, 2.213111, 0.9372549, 0, 1, 1,
0.8663151, -0.6921501, 1.582792, 0.945098, 0, 1, 1,
0.870179, -0.06172251, 3.292826, 0.9490196, 0, 1, 1,
0.8725796, -0.5525652, 1.167156, 0.9568627, 0, 1, 1,
0.8770082, -0.2366841, 1.20585, 0.9607843, 0, 1, 1,
0.882752, 1.114254, 2.573939, 0.9686275, 0, 1, 1,
0.8851838, 1.674374, 1.693442, 0.972549, 0, 1, 1,
0.8886657, -1.3578, 1.336171, 0.9803922, 0, 1, 1,
0.8921659, 1.740253, 1.295944, 0.9843137, 0, 1, 1,
0.9041118, 1.187209, 0.2884088, 0.9921569, 0, 1, 1,
0.9073818, 1.574363, 0.9482654, 0.9960784, 0, 1, 1,
0.9085034, 1.800112, 0.2226858, 1, 0, 0.9960784, 1,
0.9149727, -1.151967, 2.572978, 1, 0, 0.9882353, 1,
0.9187586, -0.5273298, 1.664179, 1, 0, 0.9843137, 1,
0.9195632, -0.04680831, 3.744896, 1, 0, 0.9764706, 1,
0.9263501, -1.026214, 2.661114, 1, 0, 0.972549, 1,
0.9319371, 0.5531139, 0.5269505, 1, 0, 0.9647059, 1,
0.9348415, -0.3737421, 1.865326, 1, 0, 0.9607843, 1,
0.9392824, -0.5626833, 2.625748, 1, 0, 0.9529412, 1,
0.9423148, 1.350467, 1.598801, 1, 0, 0.9490196, 1,
0.9433399, 1.288632, 0.6979017, 1, 0, 0.9411765, 1,
0.9461994, 0.5318796, 2.472102, 1, 0, 0.9372549, 1,
0.9476087, 1.091034, -1.063212, 1, 0, 0.9294118, 1,
0.9499223, 0.8087102, 2.824012, 1, 0, 0.9254902, 1,
0.9523693, -0.1012737, 1.279329, 1, 0, 0.9176471, 1,
0.957004, -1.61191, 3.244855, 1, 0, 0.9137255, 1,
0.9598777, -0.5814844, 1.735981, 1, 0, 0.9058824, 1,
0.9620814, -0.91658, 2.357111, 1, 0, 0.9019608, 1,
0.9660395, 1.635132, 0.7577201, 1, 0, 0.8941177, 1,
0.9683855, -0.3251721, 1.523774, 1, 0, 0.8862745, 1,
0.9704616, -0.02813992, 0.2487537, 1, 0, 0.8823529, 1,
0.9834946, 0.3852324, 1.60596, 1, 0, 0.8745098, 1,
0.9997371, 1.123156, 0.4842074, 1, 0, 0.8705882, 1,
1.000335, 0.8933107, 1.228664, 1, 0, 0.8627451, 1,
1.000587, -0.3611879, 1.756027, 1, 0, 0.8588235, 1,
1.009282, 0.5077509, 0.8780335, 1, 0, 0.8509804, 1,
1.014874, 0.2719573, 1.638614, 1, 0, 0.8470588, 1,
1.015736, -1.803165, 2.954321, 1, 0, 0.8392157, 1,
1.01896, -0.4543822, 1.42643, 1, 0, 0.8352941, 1,
1.025502, -0.7642471, 1.09545, 1, 0, 0.827451, 1,
1.026621, 0.3220211, 1.366972, 1, 0, 0.8235294, 1,
1.026862, -0.6234506, 0.7933567, 1, 0, 0.8156863, 1,
1.030753, 1.268993, -0.3626992, 1, 0, 0.8117647, 1,
1.04988, -0.01937756, -0.03861483, 1, 0, 0.8039216, 1,
1.055659, 1.182765, 2.229092, 1, 0, 0.7960784, 1,
1.066667, 1.060286, 3.349506, 1, 0, 0.7921569, 1,
1.082641, 0.7926033, 0.8603355, 1, 0, 0.7843137, 1,
1.084896, -0.7056682, 2.936247, 1, 0, 0.7803922, 1,
1.096322, -1.378713, 2.660109, 1, 0, 0.772549, 1,
1.103698, -0.2140322, 2.227822, 1, 0, 0.7686275, 1,
1.105444, -0.5830781, 2.40198, 1, 0, 0.7607843, 1,
1.121304, -0.1336478, 2.705402, 1, 0, 0.7568628, 1,
1.129963, 0.7205857, 1.644315, 1, 0, 0.7490196, 1,
1.130541, -0.6777053, 1.690406, 1, 0, 0.7450981, 1,
1.142991, -0.3739763, 0.816323, 1, 0, 0.7372549, 1,
1.151515, 2.644804, 1.814428, 1, 0, 0.7333333, 1,
1.152183, 1.370583, 0.1170759, 1, 0, 0.7254902, 1,
1.155144, -0.353979, 0.7300471, 1, 0, 0.7215686, 1,
1.156359, -1.361582, 1.077028, 1, 0, 0.7137255, 1,
1.158239, 1.34427, -1.475908, 1, 0, 0.7098039, 1,
1.159766, -0.05012048, 0.6493121, 1, 0, 0.7019608, 1,
1.168904, 2.338847, -0.6655101, 1, 0, 0.6941177, 1,
1.182349, 0.6899977, 1.037441, 1, 0, 0.6901961, 1,
1.182886, 0.9036523, 0.9846102, 1, 0, 0.682353, 1,
1.186628, 0.8985588, 0.8945178, 1, 0, 0.6784314, 1,
1.190204, 0.8143018, 0.8513486, 1, 0, 0.6705883, 1,
1.191996, -0.7282417, 0.7345983, 1, 0, 0.6666667, 1,
1.194975, 0.1666879, 1.564732, 1, 0, 0.6588235, 1,
1.195036, -0.5368041, 1.023942, 1, 0, 0.654902, 1,
1.195103, 0.4690167, 2.038197, 1, 0, 0.6470588, 1,
1.196946, 0.1441522, 0.4375346, 1, 0, 0.6431373, 1,
1.219107, -1.201896, 2.200114, 1, 0, 0.6352941, 1,
1.220247, 0.3513545, 1.978947, 1, 0, 0.6313726, 1,
1.220487, -1.524969, 3.670485, 1, 0, 0.6235294, 1,
1.22987, -0.8950595, 3.59968, 1, 0, 0.6196079, 1,
1.238301, 0.2798052, 0.9683024, 1, 0, 0.6117647, 1,
1.252565, -0.7955015, 1.758704, 1, 0, 0.6078432, 1,
1.254943, 0.01085726, 1.200606, 1, 0, 0.6, 1,
1.256475, -0.5870362, 2.311563, 1, 0, 0.5921569, 1,
1.264871, -2.317233, 2.048114, 1, 0, 0.5882353, 1,
1.268829, 1.06697, 0.8369226, 1, 0, 0.5803922, 1,
1.288138, -2.30359, 3.634343, 1, 0, 0.5764706, 1,
1.303763, -0.2950826, 3.834619, 1, 0, 0.5686275, 1,
1.309056, 0.9204149, 1.804697, 1, 0, 0.5647059, 1,
1.323023, -0.1590065, -1.764391, 1, 0, 0.5568628, 1,
1.324341, -0.2810474, 2.70744, 1, 0, 0.5529412, 1,
1.328001, 0.04747126, 0.422383, 1, 0, 0.5450981, 1,
1.33727, -1.589154, 2.016234, 1, 0, 0.5411765, 1,
1.340437, 0.633154, 1.268026, 1, 0, 0.5333334, 1,
1.343459, -0.02800236, 2.491712, 1, 0, 0.5294118, 1,
1.348821, -1.052562, 3.959806, 1, 0, 0.5215687, 1,
1.361223, 0.4795074, 0.08747222, 1, 0, 0.5176471, 1,
1.363156, 0.9712179, 1.447781, 1, 0, 0.509804, 1,
1.372378, 0.7883791, 0.9576768, 1, 0, 0.5058824, 1,
1.376389, 1.304634, 0.1152158, 1, 0, 0.4980392, 1,
1.381255, 0.1174622, 3.195297, 1, 0, 0.4901961, 1,
1.399921, -0.4875335, 1.122073, 1, 0, 0.4862745, 1,
1.401992, -0.9884444, 2.34952, 1, 0, 0.4784314, 1,
1.411796, -0.2700517, 1.612876, 1, 0, 0.4745098, 1,
1.413177, -0.4268338, 2.185609, 1, 0, 0.4666667, 1,
1.4146, 0.8871139, -0.1200081, 1, 0, 0.4627451, 1,
1.41586, -0.4459811, 1.966423, 1, 0, 0.454902, 1,
1.419651, 1.330904, 2.792611, 1, 0, 0.4509804, 1,
1.420802, -0.6982608, 1.46577, 1, 0, 0.4431373, 1,
1.423932, -0.4973026, 2.859539, 1, 0, 0.4392157, 1,
1.424449, -0.1766131, 1.13131, 1, 0, 0.4313726, 1,
1.425586, -0.8448789, 1.118106, 1, 0, 0.427451, 1,
1.44686, 0.1651098, 0.9622995, 1, 0, 0.4196078, 1,
1.450759, 1.359096, 1.92078, 1, 0, 0.4156863, 1,
1.462177, -0.4200598, 2.149487, 1, 0, 0.4078431, 1,
1.482857, 0.1219599, 2.401585, 1, 0, 0.4039216, 1,
1.491677, -1.452608, 3.015908, 1, 0, 0.3960784, 1,
1.509395, 0.7815168, 1.580511, 1, 0, 0.3882353, 1,
1.511164, 1.985971, 2.484571, 1, 0, 0.3843137, 1,
1.525923, 0.1298198, 3.993111, 1, 0, 0.3764706, 1,
1.550008, -0.2988717, 3.26143, 1, 0, 0.372549, 1,
1.573833, -1.588444, 2.069155, 1, 0, 0.3647059, 1,
1.574887, -1.093615, 1.677575, 1, 0, 0.3607843, 1,
1.575343, 1.216396, 1.701365, 1, 0, 0.3529412, 1,
1.581585, 1.559152, 0.5069333, 1, 0, 0.3490196, 1,
1.586197, -2.16217, 1.022035, 1, 0, 0.3411765, 1,
1.588653, 0.9028581, -0.3544407, 1, 0, 0.3372549, 1,
1.592719, -1.360513, 1.089718, 1, 0, 0.3294118, 1,
1.593605, 0.9206682, 2.176109, 1, 0, 0.3254902, 1,
1.598409, -1.943981, 4.225802, 1, 0, 0.3176471, 1,
1.599064, -1.010406, 2.536226, 1, 0, 0.3137255, 1,
1.601261, -0.52551, 2.110991, 1, 0, 0.3058824, 1,
1.616509, 1.666418, -1.078687, 1, 0, 0.2980392, 1,
1.623984, 1.624872, 0.02989972, 1, 0, 0.2941177, 1,
1.65644, -2.55612, 2.35372, 1, 0, 0.2862745, 1,
1.658068, -1.372533, 3.295168, 1, 0, 0.282353, 1,
1.664308, 0.1907069, 1.261538, 1, 0, 0.2745098, 1,
1.669025, -0.1957, 2.797394, 1, 0, 0.2705882, 1,
1.673491, -1.044096, 0.9461094, 1, 0, 0.2627451, 1,
1.678689, -1.311781, 0.4581308, 1, 0, 0.2588235, 1,
1.684467, 1.044263, 1.752376, 1, 0, 0.2509804, 1,
1.690789, -0.7637798, 0.4963764, 1, 0, 0.2470588, 1,
1.705152, -2.009513, 4.021895, 1, 0, 0.2392157, 1,
1.705965, 0.8231718, -0.2274446, 1, 0, 0.2352941, 1,
1.714285, 1.057865, 3.411254, 1, 0, 0.227451, 1,
1.728524, -1.773421, 2.180512, 1, 0, 0.2235294, 1,
1.729902, -0.1967364, 1.913761, 1, 0, 0.2156863, 1,
1.731335, -0.5720986, 0.5924445, 1, 0, 0.2117647, 1,
1.769946, -0.2071042, 1.39561, 1, 0, 0.2039216, 1,
1.77724, 0.9266362, -0.8554244, 1, 0, 0.1960784, 1,
1.808351, 0.8948499, 0.5446641, 1, 0, 0.1921569, 1,
1.81281, 0.4940732, 2.173085, 1, 0, 0.1843137, 1,
1.830032, -1.09218, 1.432431, 1, 0, 0.1803922, 1,
1.837006, 0.5189855, 1.770365, 1, 0, 0.172549, 1,
1.840116, -2.026551, 3.596437, 1, 0, 0.1686275, 1,
1.84492, 1.165776, -0.7404884, 1, 0, 0.1607843, 1,
1.848022, -0.1127751, 2.055404, 1, 0, 0.1568628, 1,
1.849258, 0.5954738, 1.232098, 1, 0, 0.1490196, 1,
1.860718, 0.6390029, 1.20789, 1, 0, 0.145098, 1,
1.919296, -0.0003645627, 1.046771, 1, 0, 0.1372549, 1,
1.92558, 1.107279, 1.862028, 1, 0, 0.1333333, 1,
1.934756, -0.8177099, 2.925626, 1, 0, 0.1254902, 1,
1.950542, -0.541246, 3.251685, 1, 0, 0.1215686, 1,
1.951494, -0.0701044, 1.444957, 1, 0, 0.1137255, 1,
1.954459, 0.3679003, 0.365826, 1, 0, 0.1098039, 1,
1.965304, -2.009606, 4.656453, 1, 0, 0.1019608, 1,
2.058632, -0.07308866, 2.331419, 1, 0, 0.09411765, 1,
2.128922, 0.7878593, 1.305198, 1, 0, 0.09019608, 1,
2.18996, 0.654686, 2.014729, 1, 0, 0.08235294, 1,
2.253625, 1.695293, 3.75046, 1, 0, 0.07843138, 1,
2.310303, 0.01868913, 1.821737, 1, 0, 0.07058824, 1,
2.345945, 0.7328051, 1.07912, 1, 0, 0.06666667, 1,
2.383518, -0.2381673, 2.891479, 1, 0, 0.05882353, 1,
2.42226, 1.2006, 1.810243, 1, 0, 0.05490196, 1,
2.491666, 0.3657473, 2.534125, 1, 0, 0.04705882, 1,
2.552859, -2.154002, 2.889086, 1, 0, 0.04313726, 1,
2.61728, -0.9561501, 0.09595458, 1, 0, 0.03529412, 1,
2.648202, -0.2227568, 2.058208, 1, 0, 0.03137255, 1,
2.650159, -1.405599, -0.06401837, 1, 0, 0.02352941, 1,
2.653758, -1.328129, 3.921098, 1, 0, 0.01960784, 1,
2.736179, 1.229412, -0.3494388, 1, 0, 0.01176471, 1,
3.349928, 0.6890534, -0.5605733, 1, 0, 0.007843138, 1
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
-0.1877851, -4.227779, -7.087651, 0, -0.5, 0.5, 0.5,
-0.1877851, -4.227779, -7.087651, 1, -0.5, 0.5, 0.5,
-0.1877851, -4.227779, -7.087651, 1, 1.5, 0.5, 0.5,
-0.1877851, -4.227779, -7.087651, 0, 1.5, 0.5, 0.5
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
-4.924783, 0.02005756, -7.087651, 0, -0.5, 0.5, 0.5,
-4.924783, 0.02005756, -7.087651, 1, -0.5, 0.5, 0.5,
-4.924783, 0.02005756, -7.087651, 1, 1.5, 0.5, 0.5,
-4.924783, 0.02005756, -7.087651, 0, 1.5, 0.5, 0.5
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
-4.924783, -4.227779, 0.1655717, 0, -0.5, 0.5, 0.5,
-4.924783, -4.227779, 0.1655717, 1, -0.5, 0.5, 0.5,
-4.924783, -4.227779, 0.1655717, 1, 1.5, 0.5, 0.5,
-4.924783, -4.227779, 0.1655717, 0, 1.5, 0.5, 0.5
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
-2, -3.247509, -5.413831,
2, -3.247509, -5.413831,
-2, -3.247509, -5.413831,
-2, -3.410888, -5.692801,
0, -3.247509, -5.413831,
0, -3.410888, -5.692801,
2, -3.247509, -5.413831,
2, -3.410888, -5.692801
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
-2, -3.737644, -6.250741, 0, -0.5, 0.5, 0.5,
-2, -3.737644, -6.250741, 1, -0.5, 0.5, 0.5,
-2, -3.737644, -6.250741, 1, 1.5, 0.5, 0.5,
-2, -3.737644, -6.250741, 0, 1.5, 0.5, 0.5,
0, -3.737644, -6.250741, 0, -0.5, 0.5, 0.5,
0, -3.737644, -6.250741, 1, -0.5, 0.5, 0.5,
0, -3.737644, -6.250741, 1, 1.5, 0.5, 0.5,
0, -3.737644, -6.250741, 0, 1.5, 0.5, 0.5,
2, -3.737644, -6.250741, 0, -0.5, 0.5, 0.5,
2, -3.737644, -6.250741, 1, -0.5, 0.5, 0.5,
2, -3.737644, -6.250741, 1, 1.5, 0.5, 0.5,
2, -3.737644, -6.250741, 0, 1.5, 0.5, 0.5
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
-3.83163, -3, -5.413831,
-3.83163, 3, -5.413831,
-3.83163, -3, -5.413831,
-4.013822, -3, -5.692801,
-3.83163, -2, -5.413831,
-4.013822, -2, -5.692801,
-3.83163, -1, -5.413831,
-4.013822, -1, -5.692801,
-3.83163, 0, -5.413831,
-4.013822, 0, -5.692801,
-3.83163, 1, -5.413831,
-4.013822, 1, -5.692801,
-3.83163, 2, -5.413831,
-4.013822, 2, -5.692801,
-3.83163, 3, -5.413831,
-4.013822, 3, -5.692801
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
-4.378207, -3, -6.250741, 0, -0.5, 0.5, 0.5,
-4.378207, -3, -6.250741, 1, -0.5, 0.5, 0.5,
-4.378207, -3, -6.250741, 1, 1.5, 0.5, 0.5,
-4.378207, -3, -6.250741, 0, 1.5, 0.5, 0.5,
-4.378207, -2, -6.250741, 0, -0.5, 0.5, 0.5,
-4.378207, -2, -6.250741, 1, -0.5, 0.5, 0.5,
-4.378207, -2, -6.250741, 1, 1.5, 0.5, 0.5,
-4.378207, -2, -6.250741, 0, 1.5, 0.5, 0.5,
-4.378207, -1, -6.250741, 0, -0.5, 0.5, 0.5,
-4.378207, -1, -6.250741, 1, -0.5, 0.5, 0.5,
-4.378207, -1, -6.250741, 1, 1.5, 0.5, 0.5,
-4.378207, -1, -6.250741, 0, 1.5, 0.5, 0.5,
-4.378207, 0, -6.250741, 0, -0.5, 0.5, 0.5,
-4.378207, 0, -6.250741, 1, -0.5, 0.5, 0.5,
-4.378207, 0, -6.250741, 1, 1.5, 0.5, 0.5,
-4.378207, 0, -6.250741, 0, 1.5, 0.5, 0.5,
-4.378207, 1, -6.250741, 0, -0.5, 0.5, 0.5,
-4.378207, 1, -6.250741, 1, -0.5, 0.5, 0.5,
-4.378207, 1, -6.250741, 1, 1.5, 0.5, 0.5,
-4.378207, 1, -6.250741, 0, 1.5, 0.5, 0.5,
-4.378207, 2, -6.250741, 0, -0.5, 0.5, 0.5,
-4.378207, 2, -6.250741, 1, -0.5, 0.5, 0.5,
-4.378207, 2, -6.250741, 1, 1.5, 0.5, 0.5,
-4.378207, 2, -6.250741, 0, 1.5, 0.5, 0.5,
-4.378207, 3, -6.250741, 0, -0.5, 0.5, 0.5,
-4.378207, 3, -6.250741, 1, -0.5, 0.5, 0.5,
-4.378207, 3, -6.250741, 1, 1.5, 0.5, 0.5,
-4.378207, 3, -6.250741, 0, 1.5, 0.5, 0.5
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
-3.83163, -3.247509, -4,
-3.83163, -3.247509, 4,
-3.83163, -3.247509, -4,
-4.013822, -3.410888, -4,
-3.83163, -3.247509, -2,
-4.013822, -3.410888, -2,
-3.83163, -3.247509, 0,
-4.013822, -3.410888, 0,
-3.83163, -3.247509, 2,
-4.013822, -3.410888, 2,
-3.83163, -3.247509, 4,
-4.013822, -3.410888, 4
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
-4.378207, -3.737644, -4, 0, -0.5, 0.5, 0.5,
-4.378207, -3.737644, -4, 1, -0.5, 0.5, 0.5,
-4.378207, -3.737644, -4, 1, 1.5, 0.5, 0.5,
-4.378207, -3.737644, -4, 0, 1.5, 0.5, 0.5,
-4.378207, -3.737644, -2, 0, -0.5, 0.5, 0.5,
-4.378207, -3.737644, -2, 1, -0.5, 0.5, 0.5,
-4.378207, -3.737644, -2, 1, 1.5, 0.5, 0.5,
-4.378207, -3.737644, -2, 0, 1.5, 0.5, 0.5,
-4.378207, -3.737644, 0, 0, -0.5, 0.5, 0.5,
-4.378207, -3.737644, 0, 1, -0.5, 0.5, 0.5,
-4.378207, -3.737644, 0, 1, 1.5, 0.5, 0.5,
-4.378207, -3.737644, 0, 0, 1.5, 0.5, 0.5,
-4.378207, -3.737644, 2, 0, -0.5, 0.5, 0.5,
-4.378207, -3.737644, 2, 1, -0.5, 0.5, 0.5,
-4.378207, -3.737644, 2, 1, 1.5, 0.5, 0.5,
-4.378207, -3.737644, 2, 0, 1.5, 0.5, 0.5,
-4.378207, -3.737644, 4, 0, -0.5, 0.5, 0.5,
-4.378207, -3.737644, 4, 1, -0.5, 0.5, 0.5,
-4.378207, -3.737644, 4, 1, 1.5, 0.5, 0.5,
-4.378207, -3.737644, 4, 0, 1.5, 0.5, 0.5
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
-3.83163, -3.247509, -5.413831,
-3.83163, 3.287625, -5.413831,
-3.83163, -3.247509, 5.744974,
-3.83163, 3.287625, 5.744974,
-3.83163, -3.247509, -5.413831,
-3.83163, -3.247509, 5.744974,
-3.83163, 3.287625, -5.413831,
-3.83163, 3.287625, 5.744974,
-3.83163, -3.247509, -5.413831,
3.456059, -3.247509, -5.413831,
-3.83163, -3.247509, 5.744974,
3.456059, -3.247509, 5.744974,
-3.83163, 3.287625, -5.413831,
3.456059, 3.287625, -5.413831,
-3.83163, 3.287625, 5.744974,
3.456059, 3.287625, 5.744974,
3.456059, -3.247509, -5.413831,
3.456059, 3.287625, -5.413831,
3.456059, -3.247509, 5.744974,
3.456059, 3.287625, 5.744974,
3.456059, -3.247509, -5.413831,
3.456059, -3.247509, 5.744974,
3.456059, 3.287625, -5.413831,
3.456059, 3.287625, 5.744974
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
var radius = 7.926282;
var distance = 35.26492;
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
mvMatrix.translate( 0.1877851, -0.02005756, -0.1655717 );
mvMatrix.scale( 1.175963, 1.311381, 0.768008 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.26492);
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
fentin<-read.table("fentin.xyz")
```

```
## Error in read.table("fentin.xyz"): no lines available in input
```

```r
x<-fentin$V2
```

```
## Error in eval(expr, envir, enclos): object 'fentin' not found
```

```r
y<-fentin$V3
```

```
## Error in eval(expr, envir, enclos): object 'fentin' not found
```

```r
z<-fentin$V4
```

```
## Error in eval(expr, envir, enclos): object 'fentin' not found
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
-3.725498, 3.01231, 0.1026117, 0, 0, 1, 1, 1,
-3.247881, -0.3423547, -1.435924, 1, 0, 0, 1, 1,
-2.913405, -1.023014, -1.030185, 1, 0, 0, 1, 1,
-2.909559, -0.2691762, -2.659118, 1, 0, 0, 1, 1,
-2.802658, 0.9712132, -0.6448752, 1, 0, 0, 1, 1,
-2.692696, 1.002369, -1.316201, 1, 0, 0, 1, 1,
-2.613535, 0.1334851, -3.505198, 0, 0, 0, 1, 1,
-2.570893, 0.001695055, -0.5409862, 0, 0, 0, 1, 1,
-2.521667, 1.066439, -2.537813, 0, 0, 0, 1, 1,
-2.490123, -0.6811104, -3.634296, 0, 0, 0, 1, 1,
-2.388158, -0.5905623, -3.397992, 0, 0, 0, 1, 1,
-2.346351, -0.3751735, -1.270911, 0, 0, 0, 1, 1,
-2.281799, 0.3373282, -1.982976, 0, 0, 0, 1, 1,
-2.253714, -0.1245446, -1.442346, 1, 1, 1, 1, 1,
-2.23186, 0.24542, -2.399702, 1, 1, 1, 1, 1,
-2.157504, 0.6486668, -0.4388386, 1, 1, 1, 1, 1,
-2.140053, -1.241297, -1.432613, 1, 1, 1, 1, 1,
-2.127948, 0.5863233, -3.164442, 1, 1, 1, 1, 1,
-2.126921, -1.167575, -2.160288, 1, 1, 1, 1, 1,
-2.123624, -1.986223, -2.726525, 1, 1, 1, 1, 1,
-2.093677, -0.07629052, -1.160929, 1, 1, 1, 1, 1,
-2.081866, -0.4031754, -1.419788, 1, 1, 1, 1, 1,
-2.081465, -0.7331458, -0.7923645, 1, 1, 1, 1, 1,
-2.081247, -0.06112369, -1.9759, 1, 1, 1, 1, 1,
-2.0564, -0.3893873, -1.08843, 1, 1, 1, 1, 1,
-2.033717, 0.0682899, -1.13507, 1, 1, 1, 1, 1,
-1.996666, 0.4166633, 0.2753939, 1, 1, 1, 1, 1,
-1.974947, 0.3819624, -0.0564529, 1, 1, 1, 1, 1,
-1.972264, 0.551402, 0.3492966, 0, 0, 1, 1, 1,
-1.971623, -1.351421, -0.9766226, 1, 0, 0, 1, 1,
-1.953094, 0.1746103, -2.904713, 1, 0, 0, 1, 1,
-1.914781, -0.6089839, -3.341081, 1, 0, 0, 1, 1,
-1.908748, -0.3137878, -3.530843, 1, 0, 0, 1, 1,
-1.897407, 0.2947041, -1.750896, 1, 0, 0, 1, 1,
-1.89355, -0.5419823, -3.397188, 0, 0, 0, 1, 1,
-1.889554, 0.2036397, -1.184476, 0, 0, 0, 1, 1,
-1.878282, 0.07628819, -2.95472, 0, 0, 0, 1, 1,
-1.870749, 0.1282268, -2.323928, 0, 0, 0, 1, 1,
-1.841752, -0.4932833, 0.2542191, 0, 0, 0, 1, 1,
-1.813538, 1.549447, 0.2066721, 0, 0, 0, 1, 1,
-1.79567, -0.6769956, 0.112493, 0, 0, 0, 1, 1,
-1.767373, -0.4645929, -2.93025, 1, 1, 1, 1, 1,
-1.766051, 0.5103139, -0.9719646, 1, 1, 1, 1, 1,
-1.765925, -0.9470867, -2.637511, 1, 1, 1, 1, 1,
-1.753857, -0.3029768, -1.441941, 1, 1, 1, 1, 1,
-1.732812, -1.075987, -2.208395, 1, 1, 1, 1, 1,
-1.729627, 0.7428179, -1.410769, 1, 1, 1, 1, 1,
-1.709269, 0.7069575, -0.4756385, 1, 1, 1, 1, 1,
-1.703798, 0.111062, -1.27712, 1, 1, 1, 1, 1,
-1.699162, -0.1013627, -1.290696, 1, 1, 1, 1, 1,
-1.690994, -0.4484545, -2.867058, 1, 1, 1, 1, 1,
-1.688455, -1.054757, -2.086009, 1, 1, 1, 1, 1,
-1.685963, 0.3410776, -0.07437705, 1, 1, 1, 1, 1,
-1.675829, 0.5281831, 0.7354081, 1, 1, 1, 1, 1,
-1.66906, -0.4695184, -1.069604, 1, 1, 1, 1, 1,
-1.667951, 0.9114625, -1.534499, 1, 1, 1, 1, 1,
-1.663115, -1.182297, -2.60806, 0, 0, 1, 1, 1,
-1.624145, -0.25689, -3.026765, 1, 0, 0, 1, 1,
-1.622734, -0.6503918, -2.025961, 1, 0, 0, 1, 1,
-1.613138, -1.05863, -3.144901, 1, 0, 0, 1, 1,
-1.603186, 0.4241135, -1.776931, 1, 0, 0, 1, 1,
-1.602012, -1.195754, -3.724683, 1, 0, 0, 1, 1,
-1.600841, 1.099989, -0.7054472, 0, 0, 0, 1, 1,
-1.591486, 2.424085, 0.01837525, 0, 0, 0, 1, 1,
-1.581233, -0.6773415, -2.571427, 0, 0, 0, 1, 1,
-1.561819, 0.01438391, -2.258451, 0, 0, 0, 1, 1,
-1.556957, 1.421098, -2.551494, 0, 0, 0, 1, 1,
-1.550291, -0.1019441, -0.9443822, 0, 0, 0, 1, 1,
-1.546684, 2.47614, -0.5757545, 0, 0, 0, 1, 1,
-1.534711, -0.6158646, -2.285273, 1, 1, 1, 1, 1,
-1.528391, -1.157731, -1.806682, 1, 1, 1, 1, 1,
-1.525992, -0.2579296, -0.6923158, 1, 1, 1, 1, 1,
-1.517414, 0.7258372, -0.8698849, 1, 1, 1, 1, 1,
-1.515406, 0.4735689, -0.9920166, 1, 1, 1, 1, 1,
-1.499538, 0.1546911, -1.71698, 1, 1, 1, 1, 1,
-1.497915, 0.9400442, -0.0446373, 1, 1, 1, 1, 1,
-1.495156, -0.3937661, -0.5576708, 1, 1, 1, 1, 1,
-1.494439, 0.1858274, 0.3827783, 1, 1, 1, 1, 1,
-1.49195, -0.05615698, -2.161212, 1, 1, 1, 1, 1,
-1.479107, -0.9241529, -1.74015, 1, 1, 1, 1, 1,
-1.473198, 0.825371, -0.1239298, 1, 1, 1, 1, 1,
-1.467276, -0.8548729, -2.469185, 1, 1, 1, 1, 1,
-1.463175, 0.9173042, 0.960192, 1, 1, 1, 1, 1,
-1.462997, 2.313277, 0.5458601, 1, 1, 1, 1, 1,
-1.46112, 0.6656874, -0.6907803, 0, 0, 1, 1, 1,
-1.459971, 0.781724, -0.1852051, 1, 0, 0, 1, 1,
-1.457306, -0.7575949, -0.4592235, 1, 0, 0, 1, 1,
-1.431079, 0.3502796, 0.7275837, 1, 0, 0, 1, 1,
-1.425134, 0.3760188, -2.661835, 1, 0, 0, 1, 1,
-1.422644, 0.184519, -0.3742694, 1, 0, 0, 1, 1,
-1.421536, 0.9375997, 0.1326058, 0, 0, 0, 1, 1,
-1.408729, -0.3499815, -2.608955, 0, 0, 0, 1, 1,
-1.405743, 0.4072894, -1.420053, 0, 0, 0, 1, 1,
-1.403642, 0.2340703, -1.840918, 0, 0, 0, 1, 1,
-1.399091, -0.1467686, -1.305014, 0, 0, 0, 1, 1,
-1.3878, 0.3953906, -3.01247, 0, 0, 0, 1, 1,
-1.382642, -0.8633739, -0.1525453, 0, 0, 0, 1, 1,
-1.374563, 1.517545, -0.2987973, 1, 1, 1, 1, 1,
-1.370702, -1.226883, -1.572524, 1, 1, 1, 1, 1,
-1.362963, 0.8380731, -0.6464953, 1, 1, 1, 1, 1,
-1.359803, 0.4147412, -0.06060643, 1, 1, 1, 1, 1,
-1.356004, -0.4328109, -3.134975, 1, 1, 1, 1, 1,
-1.354978, -0.3918143, -2.615155, 1, 1, 1, 1, 1,
-1.353464, -0.4931646, -1.243994, 1, 1, 1, 1, 1,
-1.349601, -1.654462, -3.943341, 1, 1, 1, 1, 1,
-1.342796, 0.4323016, -1.025873, 1, 1, 1, 1, 1,
-1.341233, -0.8516093, -1.700571, 1, 1, 1, 1, 1,
-1.33631, 0.5829516, -1.023574, 1, 1, 1, 1, 1,
-1.328657, 0.6890512, -2.732931, 1, 1, 1, 1, 1,
-1.327704, 0.3356009, -2.558887, 1, 1, 1, 1, 1,
-1.315354, -1.328699, -2.170103, 1, 1, 1, 1, 1,
-1.302945, 0.9143885, -1.781327, 1, 1, 1, 1, 1,
-1.298222, 0.02562019, -1.962033, 0, 0, 1, 1, 1,
-1.29371, 0.04338787, -0.5607408, 1, 0, 0, 1, 1,
-1.293463, -0.6659443, -2.122913, 1, 0, 0, 1, 1,
-1.274912, -0.3456544, -1.658656, 1, 0, 0, 1, 1,
-1.273085, -0.06620551, -1.739784, 1, 0, 0, 1, 1,
-1.265489, -1.42987, -3.238624, 1, 0, 0, 1, 1,
-1.260485, -0.1669932, -2.808654, 0, 0, 0, 1, 1,
-1.259167, -1.689071, -3.715858, 0, 0, 0, 1, 1,
-1.248597, -0.131834, -2.671357, 0, 0, 0, 1, 1,
-1.243086, -1.277314, -1.628768, 0, 0, 0, 1, 1,
-1.23557, 0.8236921, -0.421483, 0, 0, 0, 1, 1,
-1.22046, 0.5555643, 1.006043, 0, 0, 0, 1, 1,
-1.21765, -0.04212227, -1.409736, 0, 0, 0, 1, 1,
-1.21019, -0.5884468, -1.605061, 1, 1, 1, 1, 1,
-1.202738, 0.02067113, -1.481096, 1, 1, 1, 1, 1,
-1.193672, -1.719908, -2.388682, 1, 1, 1, 1, 1,
-1.182997, -0.5371211, -1.08611, 1, 1, 1, 1, 1,
-1.174428, -0.9919987, -2.803112, 1, 1, 1, 1, 1,
-1.17184, 0.3025432, -1.537359, 1, 1, 1, 1, 1,
-1.169697, 0.8950095, -1.818316, 1, 1, 1, 1, 1,
-1.164485, -0.462796, -2.085335, 1, 1, 1, 1, 1,
-1.163481, -0.3294353, -4.214409, 1, 1, 1, 1, 1,
-1.162181, -0.5118794, 0.07988427, 1, 1, 1, 1, 1,
-1.1555, -0.4199792, -3.459415, 1, 1, 1, 1, 1,
-1.153187, -0.1916509, -2.853427, 1, 1, 1, 1, 1,
-1.153116, -1.804846, -2.702716, 1, 1, 1, 1, 1,
-1.152939, -0.04592459, -2.381989, 1, 1, 1, 1, 1,
-1.151425, -0.6588591, -1.532088, 1, 1, 1, 1, 1,
-1.149, -1.310623, -3.795713, 0, 0, 1, 1, 1,
-1.147429, -0.9866182, -3.351008, 1, 0, 0, 1, 1,
-1.144209, -0.523268, -3.58706, 1, 0, 0, 1, 1,
-1.120839, 0.482602, -0.712794, 1, 0, 0, 1, 1,
-1.12074, 1.816898, -0.6244609, 1, 0, 0, 1, 1,
-1.112403, -0.9796537, -2.089618, 1, 0, 0, 1, 1,
-1.111615, -0.1034235, -2.151532, 0, 0, 0, 1, 1,
-1.109132, -0.294384, -2.025475, 0, 0, 0, 1, 1,
-1.108996, -0.4653101, -2.364426, 0, 0, 0, 1, 1,
-1.108309, -1.312528, -3.463998, 0, 0, 0, 1, 1,
-1.107385, 0.647375, 0.9604546, 0, 0, 0, 1, 1,
-1.095455, -1.382936, -2.501263, 0, 0, 0, 1, 1,
-1.095153, -1.461856, -1.615321, 0, 0, 0, 1, 1,
-1.091763, 0.6379578, -1.351277, 1, 1, 1, 1, 1,
-1.091493, 1.252421, -1.420843, 1, 1, 1, 1, 1,
-1.090132, 1.65814, 0.02905279, 1, 1, 1, 1, 1,
-1.081947, -0.3470932, -2.213506, 1, 1, 1, 1, 1,
-1.077601, -1.170102, -0.698653, 1, 1, 1, 1, 1,
-1.076959, 0.04842171, -0.8868573, 1, 1, 1, 1, 1,
-1.075388, -1.25938, -1.860336, 1, 1, 1, 1, 1,
-1.070034, -0.9767624, -3.273254, 1, 1, 1, 1, 1,
-1.061523, 1.026704, 0.2959452, 1, 1, 1, 1, 1,
-1.060378, 0.04939827, -1.058007, 1, 1, 1, 1, 1,
-1.058993, -1.267085, -4.448446, 1, 1, 1, 1, 1,
-1.05895, -1.289144, -1.900062, 1, 1, 1, 1, 1,
-1.050073, 0.3371052, -0.1396055, 1, 1, 1, 1, 1,
-1.038199, -1.234492, -1.697116, 1, 1, 1, 1, 1,
-1.033506, 0.2571974, -0.5539405, 1, 1, 1, 1, 1,
-1.026631, -0.9119332, -4.101751, 0, 0, 1, 1, 1,
-1.026036, -0.4655265, -1.959439, 1, 0, 0, 1, 1,
-1.011142, 0.6587387, -0.8298734, 1, 0, 0, 1, 1,
-1.004969, -1.410319, -3.182365, 1, 0, 0, 1, 1,
-1.000109, -1.427109, -3.483523, 1, 0, 0, 1, 1,
-0.9982963, -0.3704253, -3.062419, 1, 0, 0, 1, 1,
-0.9968851, -1.135561, -2.894983, 0, 0, 0, 1, 1,
-0.9947739, -0.2454996, -1.605858, 0, 0, 0, 1, 1,
-0.9896697, -0.2242545, -2.440948, 0, 0, 0, 1, 1,
-0.9886042, -1.64071, -3.20872, 0, 0, 0, 1, 1,
-0.9861156, -1.892314, -2.316683, 0, 0, 0, 1, 1,
-0.9830637, 1.657913, -1.908633, 0, 0, 0, 1, 1,
-0.977455, -1.6108, -1.632955, 0, 0, 0, 1, 1,
-0.9740325, -1.343481, -5.251324, 1, 1, 1, 1, 1,
-0.9711292, -0.5378875, -2.03592, 1, 1, 1, 1, 1,
-0.9660428, 0.4376586, -1.180023, 1, 1, 1, 1, 1,
-0.9650823, 0.1028411, -1.897835, 1, 1, 1, 1, 1,
-0.9645799, -0.4656696, -2.134648, 1, 1, 1, 1, 1,
-0.9634795, -1.059857, -1.864651, 1, 1, 1, 1, 1,
-0.9435006, -1.349427, -2.80619, 1, 1, 1, 1, 1,
-0.9388168, 0.9631903, -0.2149774, 1, 1, 1, 1, 1,
-0.9211816, -0.2790272, -2.233275, 1, 1, 1, 1, 1,
-0.9162155, 0.1959645, -2.717431, 1, 1, 1, 1, 1,
-0.9008524, -1.061518, -2.614284, 1, 1, 1, 1, 1,
-0.8972468, -1.037244, -2.149028, 1, 1, 1, 1, 1,
-0.8959273, -1.102612, -3.448827, 1, 1, 1, 1, 1,
-0.8942676, 1.625279, -1.06913, 1, 1, 1, 1, 1,
-0.8926427, 0.4397146, -0.6513572, 1, 1, 1, 1, 1,
-0.890551, -0.4963823, -3.454632, 0, 0, 1, 1, 1,
-0.8856002, -1.352327, -3.058617, 1, 0, 0, 1, 1,
-0.8823752, 1.503855, -0.682997, 1, 0, 0, 1, 1,
-0.8760416, 0.10538, -3.014155, 1, 0, 0, 1, 1,
-0.8759268, -1.111345, -2.217575, 1, 0, 0, 1, 1,
-0.8716717, -0.9908848, -3.485313, 1, 0, 0, 1, 1,
-0.8619358, 0.3972038, -0.6274098, 0, 0, 0, 1, 1,
-0.8609208, -0.1996468, -2.411429, 0, 0, 0, 1, 1,
-0.8605103, 3.192453, -0.4616969, 0, 0, 0, 1, 1,
-0.8579186, -0.7857225, -2.389925, 0, 0, 0, 1, 1,
-0.8571163, -1.054603, -4.014644, 0, 0, 0, 1, 1,
-0.8544803, 0.03559304, -2.101884, 0, 0, 0, 1, 1,
-0.849461, 1.487324, -0.1714029, 0, 0, 0, 1, 1,
-0.8478594, 0.3912892, -1.8879, 1, 1, 1, 1, 1,
-0.8474854, 0.2039206, -2.356878, 1, 1, 1, 1, 1,
-0.8391668, 0.8789029, -2.230475, 1, 1, 1, 1, 1,
-0.838725, 0.3303002, -0.5771902, 1, 1, 1, 1, 1,
-0.8321608, 0.03295714, -2.178497, 1, 1, 1, 1, 1,
-0.8265283, -0.5308681, -1.107789, 1, 1, 1, 1, 1,
-0.8219874, -0.6406682, -2.016948, 1, 1, 1, 1, 1,
-0.8196518, -0.01367617, -1.938482, 1, 1, 1, 1, 1,
-0.8189757, 0.3227983, 0.8840423, 1, 1, 1, 1, 1,
-0.8094103, 0.2900304, -0.2501341, 1, 1, 1, 1, 1,
-0.8055251, 1.297053, -0.1597861, 1, 1, 1, 1, 1,
-0.804113, 0.009297275, -1.773365, 1, 1, 1, 1, 1,
-0.8019106, 0.3468637, -1.414322, 1, 1, 1, 1, 1,
-0.8009695, 0.8920594, -0.3802221, 1, 1, 1, 1, 1,
-0.7979689, -0.3941015, -1.718053, 1, 1, 1, 1, 1,
-0.7967058, 0.5302505, -2.898877, 0, 0, 1, 1, 1,
-0.7952381, 0.831175, -1.083567, 1, 0, 0, 1, 1,
-0.7948931, 1.293419, -0.9761783, 1, 0, 0, 1, 1,
-0.7892498, 0.1517436, -1.119654, 1, 0, 0, 1, 1,
-0.7887711, -0.153046, -2.100703, 1, 0, 0, 1, 1,
-0.7802813, -0.3848325, -2.918145, 1, 0, 0, 1, 1,
-0.7785434, -1.666005, -3.226332, 0, 0, 0, 1, 1,
-0.7771018, 0.08048731, -0.9591987, 0, 0, 0, 1, 1,
-0.7758889, -0.2932915, -3.433661, 0, 0, 0, 1, 1,
-0.7741253, -0.3828133, -2.225383, 0, 0, 0, 1, 1,
-0.7703424, 0.4914528, -0.4406411, 0, 0, 0, 1, 1,
-0.7702289, 0.239197, 1.360669, 0, 0, 0, 1, 1,
-0.7636499, 0.04207862, -3.130679, 0, 0, 0, 1, 1,
-0.7604906, -0.470499, -2.199198, 1, 1, 1, 1, 1,
-0.7572381, 0.2940293, -1.209962, 1, 1, 1, 1, 1,
-0.7564937, 1.244296, -1.31408, 1, 1, 1, 1, 1,
-0.7535103, -0.5247797, -3.178353, 1, 1, 1, 1, 1,
-0.7513787, 0.4612157, -0.5165128, 1, 1, 1, 1, 1,
-0.7455798, -0.09433987, -1.726078, 1, 1, 1, 1, 1,
-0.7409524, -0.2096287, -2.337491, 1, 1, 1, 1, 1,
-0.7408636, -0.5517058, -1.354863, 1, 1, 1, 1, 1,
-0.7404264, 0.6419339, 0.5508305, 1, 1, 1, 1, 1,
-0.7377222, 1.460708, -1.856004, 1, 1, 1, 1, 1,
-0.7374819, 0.1317393, -1.669642, 1, 1, 1, 1, 1,
-0.7306585, -0.5124838, -4.092225, 1, 1, 1, 1, 1,
-0.7226859, -0.5055569, -2.709544, 1, 1, 1, 1, 1,
-0.7225683, 0.08616216, -0.3046822, 1, 1, 1, 1, 1,
-0.7173043, -0.9995491, -2.578578, 1, 1, 1, 1, 1,
-0.716328, -3.152338, -1.016031, 0, 0, 1, 1, 1,
-0.7100723, -1.344857, -3.208193, 1, 0, 0, 1, 1,
-0.7097932, 1.703599, -0.4500194, 1, 0, 0, 1, 1,
-0.7083276, -1.126132, -4.312953, 1, 0, 0, 1, 1,
-0.7070853, 1.271183, 0.2846059, 1, 0, 0, 1, 1,
-0.6987979, -0.209863, -4.613665, 1, 0, 0, 1, 1,
-0.6959636, 0.3819973, -1.341587, 0, 0, 0, 1, 1,
-0.6931675, -0.8977057, -1.207425, 0, 0, 0, 1, 1,
-0.6914977, -1.651398, -4.161986, 0, 0, 0, 1, 1,
-0.686186, -1.333175, -3.646807, 0, 0, 0, 1, 1,
-0.6798317, 0.3742303, -0.840261, 0, 0, 0, 1, 1,
-0.6775591, -0.7992524, -3.153862, 0, 0, 0, 1, 1,
-0.6766632, -0.7698235, -5.015796, 0, 0, 0, 1, 1,
-0.6757231, 2.003035, 1.181538, 1, 1, 1, 1, 1,
-0.6748005, -1.205309, -3.739208, 1, 1, 1, 1, 1,
-0.6726974, 0.08825355, -1.884213, 1, 1, 1, 1, 1,
-0.6666223, 1.094233, -0.6023736, 1, 1, 1, 1, 1,
-0.6618811, 0.4647612, -0.7606903, 1, 1, 1, 1, 1,
-0.661505, -1.872913, -2.372578, 1, 1, 1, 1, 1,
-0.6595592, 0.4521953, -0.1105145, 1, 1, 1, 1, 1,
-0.6567438, -0.4387732, -0.2946432, 1, 1, 1, 1, 1,
-0.6520801, -0.984973, -1.957846, 1, 1, 1, 1, 1,
-0.6431385, 0.4470621, -2.530163, 1, 1, 1, 1, 1,
-0.6418666, -0.9065217, -1.444174, 1, 1, 1, 1, 1,
-0.6394328, 0.6630469, -0.2745619, 1, 1, 1, 1, 1,
-0.6342181, -0.2276091, -1.174281, 1, 1, 1, 1, 1,
-0.6307417, 0.2172134, -2.30146, 1, 1, 1, 1, 1,
-0.6282099, 1.103727, -1.231536, 1, 1, 1, 1, 1,
-0.6276614, -0.4195407, -2.956658, 0, 0, 1, 1, 1,
-0.6183956, -0.6570054, -1.682691, 1, 0, 0, 1, 1,
-0.6154652, 0.2422434, -1.277442, 1, 0, 0, 1, 1,
-0.6144732, -0.9417339, -1.765623, 1, 0, 0, 1, 1,
-0.6142088, 1.075204, -0.9050043, 1, 0, 0, 1, 1,
-0.6125396, 0.6135646, -2.315409, 1, 0, 0, 1, 1,
-0.6124205, 1.83257, -0.9525992, 0, 0, 0, 1, 1,
-0.6116512, -0.8545289, -2.762216, 0, 0, 0, 1, 1,
-0.6109983, 0.7799363, -0.4511577, 0, 0, 0, 1, 1,
-0.609728, -0.06126837, -0.7904223, 0, 0, 0, 1, 1,
-0.6066176, 0.560678, -2.43935, 0, 0, 0, 1, 1,
-0.6026146, 0.9254904, 0.4964848, 0, 0, 0, 1, 1,
-0.5930075, -2.914944, -3.358144, 0, 0, 0, 1, 1,
-0.5919614, 0.5564474, -0.7667787, 1, 1, 1, 1, 1,
-0.5908311, -0.3856229, -1.072766, 1, 1, 1, 1, 1,
-0.5899189, -0.580842, -3.181886, 1, 1, 1, 1, 1,
-0.5790807, -0.4748813, -0.4652994, 1, 1, 1, 1, 1,
-0.5777577, 0.4926838, -0.5982066, 1, 1, 1, 1, 1,
-0.5775436, 0.7654774, -2.23123, 1, 1, 1, 1, 1,
-0.5737425, 1.016944, -0.1571965, 1, 1, 1, 1, 1,
-0.5706104, -0.8787026, -4.027559, 1, 1, 1, 1, 1,
-0.5693666, -0.1109943, -1.85455, 1, 1, 1, 1, 1,
-0.5676775, 0.3952555, 0.03989419, 1, 1, 1, 1, 1,
-0.5647802, 1.768116, -0.7387497, 1, 1, 1, 1, 1,
-0.5601718, 1.48276, -0.6350148, 1, 1, 1, 1, 1,
-0.5593864, 0.8165168, -0.7614943, 1, 1, 1, 1, 1,
-0.5585959, 1.117883, -0.09984332, 1, 1, 1, 1, 1,
-0.5521224, -0.02257488, 1.409269, 1, 1, 1, 1, 1,
-0.548719, 0.8176994, -0.5476577, 0, 0, 1, 1, 1,
-0.5461604, -0.8074558, -2.492973, 1, 0, 0, 1, 1,
-0.5428487, -0.4573461, -0.5296938, 1, 0, 0, 1, 1,
-0.5403768, 0.02854722, -3.021855, 1, 0, 0, 1, 1,
-0.5354325, -0.3641636, -2.779408, 1, 0, 0, 1, 1,
-0.5350051, 0.4064223, 0.9255381, 1, 0, 0, 1, 1,
-0.534816, -1.387453, -2.672523, 0, 0, 0, 1, 1,
-0.5338519, -0.2525479, -0.3159912, 0, 0, 0, 1, 1,
-0.5329661, 0.3889979, -1.536672, 0, 0, 0, 1, 1,
-0.5308323, 0.8758223, 0.854108, 0, 0, 0, 1, 1,
-0.5292081, -1.303821, -2.013798, 0, 0, 0, 1, 1,
-0.5224862, 1.069286, -0.1157196, 0, 0, 0, 1, 1,
-0.5193858, 1.241998, 0.9959158, 0, 0, 0, 1, 1,
-0.5183079, -1.879314, -3.637989, 1, 1, 1, 1, 1,
-0.5167563, 0.4558674, -2.51355, 1, 1, 1, 1, 1,
-0.5147324, 0.09409245, -1.047873, 1, 1, 1, 1, 1,
-0.5129051, -0.6024035, -1.153649, 1, 1, 1, 1, 1,
-0.5123626, 1.44617, 0.7356445, 1, 1, 1, 1, 1,
-0.5052778, -1.548786, -2.978944, 1, 1, 1, 1, 1,
-0.5030664, -1.094507, -1.396548, 1, 1, 1, 1, 1,
-0.4954719, -1.479463, -2.549186, 1, 1, 1, 1, 1,
-0.4931366, 0.9763709, -1.210168, 1, 1, 1, 1, 1,
-0.4819123, -0.2491374, -1.539345, 1, 1, 1, 1, 1,
-0.4787458, -0.9993541, -4.684802, 1, 1, 1, 1, 1,
-0.477266, -0.003534429, -1.888493, 1, 1, 1, 1, 1,
-0.4755468, 1.009196, -2.397083, 1, 1, 1, 1, 1,
-0.4744453, -0.5871509, -2.779355, 1, 1, 1, 1, 1,
-0.4701597, 0.1337098, -1.509663, 1, 1, 1, 1, 1,
-0.4695076, -0.4487102, -0.9738678, 0, 0, 1, 1, 1,
-0.4676737, 1.860954, -1.183079, 1, 0, 0, 1, 1,
-0.4654829, -1.349812, -2.733521, 1, 0, 0, 1, 1,
-0.4586811, -0.6878815, -1.303391, 1, 0, 0, 1, 1,
-0.4586314, 1.308526, -1.002451, 1, 0, 0, 1, 1,
-0.4582122, 1.686959, -1.384269, 1, 0, 0, 1, 1,
-0.457155, 0.0871328, -0.5734969, 0, 0, 0, 1, 1,
-0.4549431, -0.7799748, -1.391011, 0, 0, 0, 1, 1,
-0.4544747, 0.7548733, -0.9751273, 0, 0, 0, 1, 1,
-0.4524965, 0.07394985, -2.431436, 0, 0, 0, 1, 1,
-0.4522658, 0.9471588, 2.173589, 0, 0, 0, 1, 1,
-0.451845, 0.373796, -0.201265, 0, 0, 0, 1, 1,
-0.4517262, 0.50271, -1.089396, 0, 0, 0, 1, 1,
-0.4511956, -0.4365654, -3.308928, 1, 1, 1, 1, 1,
-0.4492158, -0.4659175, -1.980567, 1, 1, 1, 1, 1,
-0.4491796, 0.713344, -1.844909, 1, 1, 1, 1, 1,
-0.441785, -0.2405656, -3.889481, 1, 1, 1, 1, 1,
-0.4373624, -0.2635974, -1.556821, 1, 1, 1, 1, 1,
-0.4296542, -0.2945143, -3.612193, 1, 1, 1, 1, 1,
-0.4285242, 0.1076791, -2.316712, 1, 1, 1, 1, 1,
-0.4284688, -1.883819, -4.869157, 1, 1, 1, 1, 1,
-0.426394, 0.5863034, -1.407626, 1, 1, 1, 1, 1,
-0.4231907, -0.9156046, -3.382987, 1, 1, 1, 1, 1,
-0.4220582, 1.877976, -3.471271, 1, 1, 1, 1, 1,
-0.4176745, -1.143617, -1.253667, 1, 1, 1, 1, 1,
-0.41407, 0.2666111, 0.690054, 1, 1, 1, 1, 1,
-0.4130442, -0.7144792, -3.137168, 1, 1, 1, 1, 1,
-0.3969654, 0.2065537, -1.721405, 1, 1, 1, 1, 1,
-0.3941722, -1.307887, -3.55481, 0, 0, 1, 1, 1,
-0.3938, 0.2630501, -1.47769, 1, 0, 0, 1, 1,
-0.3934917, 0.2879564, -0.8314922, 1, 0, 0, 1, 1,
-0.3856496, 0.6043639, -1.008161, 1, 0, 0, 1, 1,
-0.3832779, 0.8623205, 0.6157418, 1, 0, 0, 1, 1,
-0.3821145, 1.210826, -0.09690006, 1, 0, 0, 1, 1,
-0.3796616, -0.9819391, -1.446326, 0, 0, 0, 1, 1,
-0.3778625, 0.1625563, 0.890278, 0, 0, 0, 1, 1,
-0.376641, -0.4846613, -3.733812, 0, 0, 0, 1, 1,
-0.3760727, -1.170758, -1.640886, 0, 0, 0, 1, 1,
-0.3749552, 3.116798, 1.207392, 0, 0, 0, 1, 1,
-0.3740592, 0.1138657, -2.527823, 0, 0, 0, 1, 1,
-0.3725823, 0.296467, -0.2906038, 0, 0, 0, 1, 1,
-0.3713512, -1.737227, -3.12296, 1, 1, 1, 1, 1,
-0.366368, -0.4357524, -2.708883, 1, 1, 1, 1, 1,
-0.3656543, -1.822667, -1.680623, 1, 1, 1, 1, 1,
-0.3649336, 0.4148751, -0.7204995, 1, 1, 1, 1, 1,
-0.3643992, 0.2058693, -4.395065, 1, 1, 1, 1, 1,
-0.3621455, -0.5418455, -1.599525, 1, 1, 1, 1, 1,
-0.3603545, -0.02422633, -1.975994, 1, 1, 1, 1, 1,
-0.3590287, 1.507355, -0.4804027, 1, 1, 1, 1, 1,
-0.3564723, -0.4586433, -1.982052, 1, 1, 1, 1, 1,
-0.353581, 1.749999, -1.322367, 1, 1, 1, 1, 1,
-0.3523877, -0.7261369, -0.9171649, 1, 1, 1, 1, 1,
-0.3516105, 0.1967257, -1.660254, 1, 1, 1, 1, 1,
-0.3509142, -1.273299, -2.409034, 1, 1, 1, 1, 1,
-0.3471712, 0.6664833, -0.2977586, 1, 1, 1, 1, 1,
-0.3469522, 0.799695, 0.382163, 1, 1, 1, 1, 1,
-0.3414042, 0.2983946, -0.7886074, 0, 0, 1, 1, 1,
-0.3388971, 0.3824201, 1.250007, 1, 0, 0, 1, 1,
-0.3384943, 0.3199075, -0.9564186, 1, 0, 0, 1, 1,
-0.331885, -1.811597, -1.609059, 1, 0, 0, 1, 1,
-0.3292972, 1.459895, 0.7576548, 1, 0, 0, 1, 1,
-0.327781, -0.936222, -4.275489, 1, 0, 0, 1, 1,
-0.3259346, 1.523052, -2.433786, 0, 0, 0, 1, 1,
-0.3257829, 0.5098993, -0.07640664, 0, 0, 0, 1, 1,
-0.3219624, -1.355926, -3.35744, 0, 0, 0, 1, 1,
-0.3193537, -2.431111, -3.318683, 0, 0, 0, 1, 1,
-0.3170691, -1.222789, -2.102663, 0, 0, 0, 1, 1,
-0.3168171, -0.04824523, -2.21703, 0, 0, 0, 1, 1,
-0.3166164, -1.014374, -1.88247, 0, 0, 0, 1, 1,
-0.3122153, 0.4744567, -0.2950873, 1, 1, 1, 1, 1,
-0.3107218, -1.106465, -2.710705, 1, 1, 1, 1, 1,
-0.3103655, 0.4155444, -0.3004916, 1, 1, 1, 1, 1,
-0.3051333, 0.8400292, -1.360041, 1, 1, 1, 1, 1,
-0.3010094, 0.5153602, 0.2939738, 1, 1, 1, 1, 1,
-0.2978659, -1.910905, -3.758572, 1, 1, 1, 1, 1,
-0.2968521, 0.2732379, -1.737404, 1, 1, 1, 1, 1,
-0.2959234, -1.169605, -1.753243, 1, 1, 1, 1, 1,
-0.2954557, 0.58089, 0.625214, 1, 1, 1, 1, 1,
-0.2938471, -1.448099, -2.580351, 1, 1, 1, 1, 1,
-0.2937993, -0.2783183, -2.208368, 1, 1, 1, 1, 1,
-0.2926703, 0.6715724, -1.301027, 1, 1, 1, 1, 1,
-0.2817478, -1.713757, -3.637359, 1, 1, 1, 1, 1,
-0.2808724, 0.1897835, -0.10558, 1, 1, 1, 1, 1,
-0.2779151, 1.081916, 1.586953, 1, 1, 1, 1, 1,
-0.2704889, 1.690217, 0.7474477, 0, 0, 1, 1, 1,
-0.2689539, -0.03247626, -1.3484, 1, 0, 0, 1, 1,
-0.2627692, -0.0117097, -4.058372, 1, 0, 0, 1, 1,
-0.262712, -0.9477596, -2.107563, 1, 0, 0, 1, 1,
-0.2565826, 2.327941, 0.5718253, 1, 0, 0, 1, 1,
-0.2548406, 0.8478646, -0.8691135, 1, 0, 0, 1, 1,
-0.25214, 1.328038, -0.3691213, 0, 0, 0, 1, 1,
-0.2516569, -0.8628252, -4.334873, 0, 0, 0, 1, 1,
-0.2460011, -0.4998958, -1.567891, 0, 0, 0, 1, 1,
-0.2433319, -0.2567453, -2.781517, 0, 0, 0, 1, 1,
-0.2415766, 1.467847, -0.3927694, 0, 0, 0, 1, 1,
-0.2392547, 1.398401, 0.1079822, 0, 0, 0, 1, 1,
-0.2382157, -0.7116551, -2.264222, 0, 0, 0, 1, 1,
-0.2373062, 1.706578, 0.1628064, 1, 1, 1, 1, 1,
-0.2338666, -0.0424688, -1.383077, 1, 1, 1, 1, 1,
-0.2319303, -1.291268, -4.200835, 1, 1, 1, 1, 1,
-0.2310771, 0.4608427, -1.057036, 1, 1, 1, 1, 1,
-0.2250059, -2.366077, -4.07889, 1, 1, 1, 1, 1,
-0.224414, 0.9496552, 0.6463497, 1, 1, 1, 1, 1,
-0.2161895, 1.246175, -1.367862, 1, 1, 1, 1, 1,
-0.2151569, -0.1639374, -3.232164, 1, 1, 1, 1, 1,
-0.2141845, -1.27727, -3.494836, 1, 1, 1, 1, 1,
-0.2129976, -0.574545, -0.7328466, 1, 1, 1, 1, 1,
-0.2122207, 0.1280508, -1.239138, 1, 1, 1, 1, 1,
-0.2107306, -0.4049904, -3.915812, 1, 1, 1, 1, 1,
-0.2083586, -0.2353424, -0.7898593, 1, 1, 1, 1, 1,
-0.1981432, 0.7535505, -1.608224, 1, 1, 1, 1, 1,
-0.197285, -1.017979, -4.011497, 1, 1, 1, 1, 1,
-0.1965636, 0.8673639, -0.8107148, 0, 0, 1, 1, 1,
-0.1963145, 1.564467, 0.6078346, 1, 0, 0, 1, 1,
-0.1947494, -1.1298, -3.81688, 1, 0, 0, 1, 1,
-0.1903554, 0.4624773, 0.1173661, 1, 0, 0, 1, 1,
-0.1901872, -0.8173597, -2.866807, 1, 0, 0, 1, 1,
-0.1897452, -1.592, -3.677991, 1, 0, 0, 1, 1,
-0.1862488, -0.3313765, -0.9967397, 0, 0, 0, 1, 1,
-0.1860028, 0.1094114, 0.09342967, 0, 0, 0, 1, 1,
-0.1837307, 0.7751401, 0.7562813, 0, 0, 0, 1, 1,
-0.178662, -0.2101292, -1.959486, 0, 0, 0, 1, 1,
-0.1767355, 0.0196967, -0.353604, 0, 0, 0, 1, 1,
-0.1763836, -0.6327932, -3.024407, 0, 0, 0, 1, 1,
-0.1738149, 1.465181, -0.2735432, 0, 0, 0, 1, 1,
-0.1697679, -1.32188, -2.41254, 1, 1, 1, 1, 1,
-0.1663432, -0.4796919, -4.160966, 1, 1, 1, 1, 1,
-0.159129, -0.3860741, -3.039356, 1, 1, 1, 1, 1,
-0.1581866, 0.8117165, -1.35473, 1, 1, 1, 1, 1,
-0.1576815, 0.4439806, -1.49731, 1, 1, 1, 1, 1,
-0.1575033, 0.2551725, -0.8482088, 1, 1, 1, 1, 1,
-0.1573172, 0.9072068, 1.107161, 1, 1, 1, 1, 1,
-0.1567316, -0.248808, -3.5162, 1, 1, 1, 1, 1,
-0.15375, 0.3475064, -0.06766082, 1, 1, 1, 1, 1,
-0.152254, 0.6659582, 0.149014, 1, 1, 1, 1, 1,
-0.1521205, -0.688588, -2.923926, 1, 1, 1, 1, 1,
-0.1513821, 0.3587341, -0.1065367, 1, 1, 1, 1, 1,
-0.1508094, -0.389935, -1.382102, 1, 1, 1, 1, 1,
-0.150126, 1.652456, -0.1070279, 1, 1, 1, 1, 1,
-0.1471024, -1.39005, -3.616775, 1, 1, 1, 1, 1,
-0.1460554, -1.373196, -3.680342, 0, 0, 1, 1, 1,
-0.1450989, -1.069014, -2.558626, 1, 0, 0, 1, 1,
-0.1448449, 1.934295, -0.6541469, 1, 0, 0, 1, 1,
-0.1418791, -0.480356, -0.9374031, 1, 0, 0, 1, 1,
-0.141598, -0.4722666, -1.717162, 1, 0, 0, 1, 1,
-0.1391906, -1.247946, -4.22195, 1, 0, 0, 1, 1,
-0.1364986, -0.5070233, -2.685375, 0, 0, 0, 1, 1,
-0.1364851, -0.3260251, -1.718578, 0, 0, 0, 1, 1,
-0.1355107, 0.2584943, -0.3626172, 0, 0, 0, 1, 1,
-0.130692, -0.08492175, -1.86097, 0, 0, 0, 1, 1,
-0.1283562, 0.8172153, 0.6168219, 0, 0, 0, 1, 1,
-0.1268172, -0.9911793, -4.793694, 0, 0, 0, 1, 1,
-0.1259372, 0.9183436, 0.001423947, 0, 0, 0, 1, 1,
-0.1100345, 0.1293055, -0.08750957, 1, 1, 1, 1, 1,
-0.1094168, -0.3589004, 0.06019289, 1, 1, 1, 1, 1,
-0.1093866, 1.665365, -2.426822, 1, 1, 1, 1, 1,
-0.1083657, 1.200609, -0.6168301, 1, 1, 1, 1, 1,
-0.1068846, -0.06922808, -3.00469, 1, 1, 1, 1, 1,
-0.1049728, -0.3173204, -3.005107, 1, 1, 1, 1, 1,
-0.1031615, 0.8982303, -0.0984903, 1, 1, 1, 1, 1,
-0.09998623, 1.053636, -0.05813483, 1, 1, 1, 1, 1,
-0.09704868, 0.873934, -0.5622901, 1, 1, 1, 1, 1,
-0.09566782, -1.178905, -2.14797, 1, 1, 1, 1, 1,
-0.09457175, -0.03341789, -2.482618, 1, 1, 1, 1, 1,
-0.09417187, 1.097242, 0.2137243, 1, 1, 1, 1, 1,
-0.093442, -1.043619, -3.048741, 1, 1, 1, 1, 1,
-0.09318546, 2.245975, -0.6665183, 1, 1, 1, 1, 1,
-0.09083039, 0.6284155, -0.7913742, 1, 1, 1, 1, 1,
-0.07433417, -0.4437397, -3.32591, 0, 0, 1, 1, 1,
-0.07394426, 0.899848, 0.2977103, 1, 0, 0, 1, 1,
-0.07154225, 0.5553619, 0.2018616, 1, 0, 0, 1, 1,
-0.06802646, 0.1149987, 1.137071, 1, 0, 0, 1, 1,
-0.06409261, 2.143128, -0.9821654, 1, 0, 0, 1, 1,
-0.06394043, 1.130174, 0.129833, 1, 0, 0, 1, 1,
-0.06021855, -1.542692, -2.192755, 0, 0, 0, 1, 1,
-0.0518346, -0.9223682, -1.672721, 0, 0, 0, 1, 1,
-0.04276839, -1.206851, -2.941185, 0, 0, 0, 1, 1,
-0.0372115, 0.7827051, -0.5115725, 0, 0, 0, 1, 1,
-0.03700681, 0.10838, 0.9280807, 0, 0, 0, 1, 1,
-0.03643217, -0.1582737, -4.605953, 0, 0, 0, 1, 1,
-0.02125885, -1.151259, -3.651635, 0, 0, 0, 1, 1,
-0.01970035, -0.5185963, -4.538145, 1, 1, 1, 1, 1,
-0.01964767, -0.004505267, -0.6830578, 1, 1, 1, 1, 1,
-0.01084132, 0.7759705, -1.921359, 1, 1, 1, 1, 1,
-0.00988376, 0.668668, -1.278588, 1, 1, 1, 1, 1,
-0.006976034, 0.4944975, -0.2956562, 1, 1, 1, 1, 1,
-0.006492714, -1.073288, -3.928643, 1, 1, 1, 1, 1,
-0.004534943, -0.6321034, -1.916227, 1, 1, 1, 1, 1,
-0.0004091854, 0.4727204, -0.4919229, 1, 1, 1, 1, 1,
0.0005747059, -0.7224905, 3.502575, 1, 1, 1, 1, 1,
0.001714564, 0.3737012, -1.735846, 1, 1, 1, 1, 1,
0.004523266, 0.1957404, -0.86402, 1, 1, 1, 1, 1,
0.008278538, 1.143083, 0.3325647, 1, 1, 1, 1, 1,
0.008511545, 0.4814514, -0.4883933, 1, 1, 1, 1, 1,
0.008939809, 0.6804935, -0.3669217, 1, 1, 1, 1, 1,
0.01415471, 0.8152464, 1.084675, 1, 1, 1, 1, 1,
0.02448783, -0.274779, 2.034058, 0, 0, 1, 1, 1,
0.02560444, 0.2451351, -1.817947, 1, 0, 0, 1, 1,
0.02769214, 0.0463645, 0.9682062, 1, 0, 0, 1, 1,
0.02778465, 0.8739076, -0.4983811, 1, 0, 0, 1, 1,
0.02793089, 0.1203291, 0.1574734, 1, 0, 0, 1, 1,
0.0298159, 1.300791, 1.083984, 1, 0, 0, 1, 1,
0.0436589, 0.8515399, 0.4291722, 0, 0, 0, 1, 1,
0.04864655, 0.396773, -1.637541, 0, 0, 0, 1, 1,
0.04899471, -0.5905167, 1.516339, 0, 0, 0, 1, 1,
0.05431176, 0.159041, -1.37365, 0, 0, 0, 1, 1,
0.05868223, 0.4703606, 0.9154733, 0, 0, 0, 1, 1,
0.05909828, 1.61379, -0.5899631, 0, 0, 0, 1, 1,
0.07038846, 1.121143, 1.415717, 0, 0, 0, 1, 1,
0.0709236, -0.2259562, 2.038345, 1, 1, 1, 1, 1,
0.07172398, -0.5609167, 2.293356, 1, 1, 1, 1, 1,
0.07198731, -0.7852311, 4.432828, 1, 1, 1, 1, 1,
0.07286389, 0.9407326, -0.3874446, 1, 1, 1, 1, 1,
0.07391098, 0.357586, 2.124896, 1, 1, 1, 1, 1,
0.07542569, -0.7247728, 1.884048, 1, 1, 1, 1, 1,
0.07552794, 1.319476, 0.1125229, 1, 1, 1, 1, 1,
0.08539109, -0.4901259, 0.9463833, 1, 1, 1, 1, 1,
0.0866503, -0.20214, 0.9077529, 1, 1, 1, 1, 1,
0.08738875, 0.8678142, 2.580416, 1, 1, 1, 1, 1,
0.09415159, 0.2084261, 1.570444, 1, 1, 1, 1, 1,
0.09472922, 0.2383653, -1.238356, 1, 1, 1, 1, 1,
0.09690329, -2.729703, 4.917118, 1, 1, 1, 1, 1,
0.1051047, 0.3937576, -0.9447271, 1, 1, 1, 1, 1,
0.1067905, 0.5731769, 0.5690066, 1, 1, 1, 1, 1,
0.1096346, 1.475197, 0.4508215, 0, 0, 1, 1, 1,
0.1134645, 0.1053705, 2.614843, 1, 0, 0, 1, 1,
0.113642, -0.0518904, 2.895565, 1, 0, 0, 1, 1,
0.1167774, 0.8279783, 0.287964, 1, 0, 0, 1, 1,
0.1178011, -0.2709278, 1.03953, 1, 0, 0, 1, 1,
0.1201745, -0.5325955, 2.884291, 1, 0, 0, 1, 1,
0.122957, -0.59333, 5.383391, 0, 0, 0, 1, 1,
0.1255584, 0.4614827, -0.5144014, 0, 0, 0, 1, 1,
0.1262536, 0.3298095, -0.6108951, 0, 0, 0, 1, 1,
0.1276462, -0.2767622, 1.785493, 0, 0, 0, 1, 1,
0.1282879, 0.4077024, 2.171537, 0, 0, 0, 1, 1,
0.1326806, -0.6919412, 3.620455, 0, 0, 0, 1, 1,
0.1365809, -0.9848628, 3.248863, 0, 0, 0, 1, 1,
0.1521101, 0.4063989, 1.114181, 1, 1, 1, 1, 1,
0.1772833, 0.6736183, -0.2592469, 1, 1, 1, 1, 1,
0.1812172, -0.5113934, 1.790443, 1, 1, 1, 1, 1,
0.1829032, -0.2094092, 4.257587, 1, 1, 1, 1, 1,
0.1865594, 0.5902825, -0.06398979, 1, 1, 1, 1, 1,
0.186828, 2.073618, 0.1813024, 1, 1, 1, 1, 1,
0.1915894, 0.3755987, 0.2198924, 1, 1, 1, 1, 1,
0.1945271, -0.1387313, 2.290576, 1, 1, 1, 1, 1,
0.2004056, -1.336167, 2.87743, 1, 1, 1, 1, 1,
0.2016858, -1.09745, 3.875739, 1, 1, 1, 1, 1,
0.2039354, -1.911586, 3.007788, 1, 1, 1, 1, 1,
0.2045933, -1.331746, 5.582467, 1, 1, 1, 1, 1,
0.2053056, -2.293493, 4.547058, 1, 1, 1, 1, 1,
0.2053631, -0.441653, 2.996233, 1, 1, 1, 1, 1,
0.2056886, -0.7956924, 2.673988, 1, 1, 1, 1, 1,
0.2079855, 0.6257046, 0.5238805, 0, 0, 1, 1, 1,
0.2144323, -0.483671, 0.7453077, 1, 0, 0, 1, 1,
0.2155225, -0.3314989, 2.460274, 1, 0, 0, 1, 1,
0.2230563, 1.27624, -0.8131671, 1, 0, 0, 1, 1,
0.2309013, 0.7548748, -0.365971, 1, 0, 0, 1, 1,
0.2320844, -0.1940133, 2.936134, 1, 0, 0, 1, 1,
0.2323547, -1.286575, 3.318435, 0, 0, 0, 1, 1,
0.2327772, 0.363719, 1.178486, 0, 0, 0, 1, 1,
0.2331022, 0.1194464, 1.69433, 0, 0, 0, 1, 1,
0.2399128, 0.3059843, 0.6405166, 0, 0, 0, 1, 1,
0.2425703, -0.0387229, 3.457685, 0, 0, 0, 1, 1,
0.2456527, -1.085297, 3.494331, 0, 0, 0, 1, 1,
0.2466708, 1.067839, 0.5723214, 0, 0, 0, 1, 1,
0.2496088, 0.715472, -1.168967, 1, 1, 1, 1, 1,
0.2534849, -0.8742355, 1.893231, 1, 1, 1, 1, 1,
0.255633, 0.3544666, 0.388282, 1, 1, 1, 1, 1,
0.2584113, -2.017395, 3.940759, 1, 1, 1, 1, 1,
0.2597223, -0.0632759, 0.7711298, 1, 1, 1, 1, 1,
0.2602591, 1.429045, 2.221523, 1, 1, 1, 1, 1,
0.2630833, 1.33428, 1.256374, 1, 1, 1, 1, 1,
0.2643269, -0.7043254, 1.747799, 1, 1, 1, 1, 1,
0.2682217, -0.9914848, 1.955634, 1, 1, 1, 1, 1,
0.2701217, 1.447849, 0.009953849, 1, 1, 1, 1, 1,
0.270244, -1.115098, 2.807818, 1, 1, 1, 1, 1,
0.2718938, -0.6620917, 2.624755, 1, 1, 1, 1, 1,
0.2733606, -0.08215982, 2.482723, 1, 1, 1, 1, 1,
0.274493, 1.982941, -0.2949445, 1, 1, 1, 1, 1,
0.2762674, -0.8065704, 2.558128, 1, 1, 1, 1, 1,
0.2764673, -1.839272, 3.869796, 0, 0, 1, 1, 1,
0.2767878, 0.6332241, 0.1722994, 1, 0, 0, 1, 1,
0.2778201, 0.8997358, -0.6749068, 1, 0, 0, 1, 1,
0.2783338, 0.6699646, 0.7080212, 1, 0, 0, 1, 1,
0.2788773, 0.7501689, -0.5726188, 1, 0, 0, 1, 1,
0.2792907, 1.464845, 0.5177588, 1, 0, 0, 1, 1,
0.2809603, 2.143979, -1.265224, 0, 0, 0, 1, 1,
0.2826735, -1.718964, 2.637347, 0, 0, 0, 1, 1,
0.2839249, 1.911146, -0.1624215, 0, 0, 0, 1, 1,
0.2853429, 1.285129, 2.327489, 0, 0, 0, 1, 1,
0.2896819, 0.2729359, 2.036012, 0, 0, 0, 1, 1,
0.2899851, 0.3331397, 1.062802, 0, 0, 0, 1, 1,
0.294722, 1.34362, 0.188391, 0, 0, 0, 1, 1,
0.2958519, -0.5183543, 3.46568, 1, 1, 1, 1, 1,
0.3015912, 0.5435416, -0.006728345, 1, 1, 1, 1, 1,
0.3035225, -0.6142915, 2.520349, 1, 1, 1, 1, 1,
0.3068602, -0.03773569, -0.3124776, 1, 1, 1, 1, 1,
0.3085095, -0.307091, 3.39859, 1, 1, 1, 1, 1,
0.3118968, -1.199916, 2.958999, 1, 1, 1, 1, 1,
0.3125326, 1.52154, 0.04388379, 1, 1, 1, 1, 1,
0.3153154, 0.4862315, 1.924092, 1, 1, 1, 1, 1,
0.3160765, -2.002351, 4.076355, 1, 1, 1, 1, 1,
0.3181691, 0.2789237, 0.2566984, 1, 1, 1, 1, 1,
0.3194159, 1.615487, 0.7426411, 1, 1, 1, 1, 1,
0.3216058, 1.172774, 1.988668, 1, 1, 1, 1, 1,
0.3220637, 1.365829, 1.152682, 1, 1, 1, 1, 1,
0.3229639, 0.4618846, 1.247496, 1, 1, 1, 1, 1,
0.3296871, -0.3191885, 0.2915815, 1, 1, 1, 1, 1,
0.3345394, -1.26229, 3.592031, 0, 0, 1, 1, 1,
0.3398272, -0.08714972, 2.322668, 1, 0, 0, 1, 1,
0.3435049, 0.005116516, 1.690564, 1, 0, 0, 1, 1,
0.3480726, -1.922619, 1.87523, 1, 0, 0, 1, 1,
0.3494487, -0.5599863, 3.565748, 1, 0, 0, 1, 1,
0.3518332, -0.9723503, 4.82478, 1, 0, 0, 1, 1,
0.3618998, -1.961297, 3.966376, 0, 0, 0, 1, 1,
0.3635773, -0.5327591, 3.969564, 0, 0, 0, 1, 1,
0.3653547, -1.403232, 4.327154, 0, 0, 0, 1, 1,
0.3687639, -0.7527409, 4.233084, 0, 0, 0, 1, 1,
0.37582, -0.8804063, 2.69123, 0, 0, 0, 1, 1,
0.3764789, -1.438844, 3.972419, 0, 0, 0, 1, 1,
0.3831334, 1.822254, 0.4206447, 0, 0, 0, 1, 1,
0.389522, -1.043827, 3.830733, 1, 1, 1, 1, 1,
0.393292, -0.8550999, 1.467378, 1, 1, 1, 1, 1,
0.4023836, -0.3716012, 3.127209, 1, 1, 1, 1, 1,
0.4036711, -2.837784, 3.6438, 1, 1, 1, 1, 1,
0.4046235, 1.156705, 0.09857912, 1, 1, 1, 1, 1,
0.4070167, -0.9398878, 2.194568, 1, 1, 1, 1, 1,
0.4071528, -0.8854426, 2.298167, 1, 1, 1, 1, 1,
0.4125603, -0.7973318, 2.6885, 1, 1, 1, 1, 1,
0.4136534, 0.0189815, 1.487351, 1, 1, 1, 1, 1,
0.4245842, -0.2265744, 0.7217295, 1, 1, 1, 1, 1,
0.4250779, -2.669822, 3.242473, 1, 1, 1, 1, 1,
0.4262893, 1.543284, -0.6003262, 1, 1, 1, 1, 1,
0.4320119, 1.291629, 0.4004816, 1, 1, 1, 1, 1,
0.4330436, 0.3493443, -0.6418664, 1, 1, 1, 1, 1,
0.4414866, -1.10217, 1.113204, 1, 1, 1, 1, 1,
0.4422883, 0.6977891, 0.6763318, 0, 0, 1, 1, 1,
0.4424343, -1.461828, 3.215003, 1, 0, 0, 1, 1,
0.4428865, -0.7765371, 1.12524, 1, 0, 0, 1, 1,
0.4435885, -0.9160522, 3.900825, 1, 0, 0, 1, 1,
0.4442344, 0.270175, -0.00875303, 1, 0, 0, 1, 1,
0.4446526, -0.490969, 2.894033, 1, 0, 0, 1, 1,
0.4457665, -1.713923, 3.027527, 0, 0, 0, 1, 1,
0.4468949, -0.2781975, 1.400589, 0, 0, 0, 1, 1,
0.4485518, 1.267239, 1.085526, 0, 0, 0, 1, 1,
0.4518118, -0.4414263, 1.838343, 0, 0, 0, 1, 1,
0.4520479, 0.8297185, -1.730032, 0, 0, 0, 1, 1,
0.452139, 1.522477, 0.9516239, 0, 0, 0, 1, 1,
0.4534518, -0.8161898, 2.023533, 0, 0, 0, 1, 1,
0.4545073, 1.019351, -0.2045169, 1, 1, 1, 1, 1,
0.4552907, 1.205049, -0.3839767, 1, 1, 1, 1, 1,
0.4573709, 1.161241, 1.245735, 1, 1, 1, 1, 1,
0.4575125, -0.6267169, 0.518931, 1, 1, 1, 1, 1,
0.462344, 0.08821862, -0.8214096, 1, 1, 1, 1, 1,
0.46281, -1.889727, 3.068678, 1, 1, 1, 1, 1,
0.4646502, 1.644174, 0.2857526, 1, 1, 1, 1, 1,
0.4654346, -0.7740842, 1.261531, 1, 1, 1, 1, 1,
0.4705998, -0.7054611, 1.859142, 1, 1, 1, 1, 1,
0.4732122, 0.1362274, 0.6213018, 1, 1, 1, 1, 1,
0.4760628, -1.19108, 2.719042, 1, 1, 1, 1, 1,
0.4820954, -0.8190526, 2.534403, 1, 1, 1, 1, 1,
0.488975, -0.06947963, 1.881649, 1, 1, 1, 1, 1,
0.4993921, -0.9799617, 1.552727, 1, 1, 1, 1, 1,
0.5005299, -0.2423857, 1.590063, 1, 1, 1, 1, 1,
0.5011543, -2.257462, 2.724902, 0, 0, 1, 1, 1,
0.5034401, 0.1721405, 1.018733, 1, 0, 0, 1, 1,
0.5038395, -0.04247852, 0.2638202, 1, 0, 0, 1, 1,
0.5059178, -0.3572801, 2.726935, 1, 0, 0, 1, 1,
0.511825, -0.4920158, 3.775404, 1, 0, 0, 1, 1,
0.5152225, -0.4139893, 2.778337, 1, 0, 0, 1, 1,
0.518914, 0.3701131, 1.441144, 0, 0, 0, 1, 1,
0.5241637, 0.8692974, 1.352871, 0, 0, 0, 1, 1,
0.5259194, -1.67931, 1.476837, 0, 0, 0, 1, 1,
0.5265265, 1.069356, 1.182195, 0, 0, 0, 1, 1,
0.5285487, 0.7704679, -0.6035255, 0, 0, 0, 1, 1,
0.5285747, 0.4103935, 1.317777, 0, 0, 0, 1, 1,
0.53076, -0.02515401, 1.491951, 0, 0, 0, 1, 1,
0.5326982, 0.8054912, -1.250907, 1, 1, 1, 1, 1,
0.5358727, 0.6628178, -0.1188729, 1, 1, 1, 1, 1,
0.5394957, 0.5622513, 2.815891, 1, 1, 1, 1, 1,
0.5411268, -0.7003257, 2.820167, 1, 1, 1, 1, 1,
0.5418497, 0.4439301, 0.4244418, 1, 1, 1, 1, 1,
0.5484267, -0.9947584, 3.142711, 1, 1, 1, 1, 1,
0.5493174, 0.2656653, 1.164207, 1, 1, 1, 1, 1,
0.55208, 0.6289008, 1.699269, 1, 1, 1, 1, 1,
0.5536162, 0.4763304, 1.11536, 1, 1, 1, 1, 1,
0.5562629, -0.08453093, 2.010432, 1, 1, 1, 1, 1,
0.5595898, -0.42264, 0.936251, 1, 1, 1, 1, 1,
0.5658143, -0.4191549, -0.01232648, 1, 1, 1, 1, 1,
0.5687997, 0.5106708, 0.8551749, 1, 1, 1, 1, 1,
0.5692409, 0.6950317, -0.5708927, 1, 1, 1, 1, 1,
0.5706221, -0.2519935, 0.8959283, 1, 1, 1, 1, 1,
0.5742044, -1.347524, 1.423825, 0, 0, 1, 1, 1,
0.5743688, 0.2128432, 0.2747, 1, 0, 0, 1, 1,
0.5744007, -0.5655023, 3.720948, 1, 0, 0, 1, 1,
0.5771936, -0.9111078, 3.459855, 1, 0, 0, 1, 1,
0.5808844, -0.1900946, 2.469779, 1, 0, 0, 1, 1,
0.5863619, 1.107657, 0.9860336, 1, 0, 0, 1, 1,
0.5900443, 0.8408681, 0.2588756, 0, 0, 0, 1, 1,
0.590308, -0.5968844, 2.108829, 0, 0, 0, 1, 1,
0.5904328, 0.2388937, 1.943474, 0, 0, 0, 1, 1,
0.5910891, 1.648151, -0.4411827, 0, 0, 0, 1, 1,
0.5927584, 0.2900433, 1.910954, 0, 0, 0, 1, 1,
0.5934104, -0.4600345, 4.606962, 0, 0, 0, 1, 1,
0.6035064, -0.7700469, 1.580883, 0, 0, 0, 1, 1,
0.606175, 0.986278, 0.7985224, 1, 1, 1, 1, 1,
0.6120734, -0.07867125, 1.658674, 1, 1, 1, 1, 1,
0.6124733, 0.6086772, 0.6363487, 1, 1, 1, 1, 1,
0.617188, -1.189705, 3.007644, 1, 1, 1, 1, 1,
0.6189676, 0.8735849, 1.052292, 1, 1, 1, 1, 1,
0.6225398, 1.32332, 1.491238, 1, 1, 1, 1, 1,
0.6292403, -1.377806, 2.700136, 1, 1, 1, 1, 1,
0.6304477, -1.513136, 2.039191, 1, 1, 1, 1, 1,
0.6310558, 0.2932557, 1.081195, 1, 1, 1, 1, 1,
0.6338061, 1.753627, -0.721836, 1, 1, 1, 1, 1,
0.6394819, 0.9676543, 1.09489, 1, 1, 1, 1, 1,
0.640828, 0.009870245, 4.205514, 1, 1, 1, 1, 1,
0.6417021, -1.918395, 2.323623, 1, 1, 1, 1, 1,
0.6419857, 0.6535316, 1.407247, 1, 1, 1, 1, 1,
0.6458581, -1.116733, 3.517127, 1, 1, 1, 1, 1,
0.6557017, -0.3826168, 1.40858, 0, 0, 1, 1, 1,
0.6603291, 0.4561484, -0.01894404, 1, 0, 0, 1, 1,
0.661855, -0.1046185, 1.58214, 1, 0, 0, 1, 1,
0.6630405, -0.6491181, 0.110901, 1, 0, 0, 1, 1,
0.6637522, -0.2190702, 1.15059, 1, 0, 0, 1, 1,
0.664345, 1.58044, -0.5719799, 1, 0, 0, 1, 1,
0.6647654, 1.04878, 1.448298, 0, 0, 0, 1, 1,
0.6708875, -0.6402819, 3.141685, 0, 0, 0, 1, 1,
0.6730511, -1.045897, 1.96013, 0, 0, 0, 1, 1,
0.6737763, 0.8376964, 1.612092, 0, 0, 0, 1, 1,
0.678075, -0.515576, 1.178306, 0, 0, 0, 1, 1,
0.6813565, -2.250718, 3.893137, 0, 0, 0, 1, 1,
0.6891281, -0.2922919, 1.536708, 0, 0, 0, 1, 1,
0.6992743, -0.02423095, 1.465813, 1, 1, 1, 1, 1,
0.7073222, 1.227286, -0.5562342, 1, 1, 1, 1, 1,
0.714415, 0.7319149, -0.473117, 1, 1, 1, 1, 1,
0.7189302, 0.4002329, 1.067345, 1, 1, 1, 1, 1,
0.7210554, -0.2016983, 0.2967413, 1, 1, 1, 1, 1,
0.7223931, 0.783859, 1.302349, 1, 1, 1, 1, 1,
0.7318491, -1.168713, 1.787328, 1, 1, 1, 1, 1,
0.7326391, -0.5699117, 2.519104, 1, 1, 1, 1, 1,
0.7366584, 1.470886, 0.1291859, 1, 1, 1, 1, 1,
0.7369241, 1.095986, 1.724517, 1, 1, 1, 1, 1,
0.7409442, 0.1467707, 1.585385, 1, 1, 1, 1, 1,
0.7416766, -1.307846, 4.407436, 1, 1, 1, 1, 1,
0.7434681, -1.443239, 3.908828, 1, 1, 1, 1, 1,
0.7451788, 1.182391, 0.2329999, 1, 1, 1, 1, 1,
0.745392, -0.1696516, 1.178537, 1, 1, 1, 1, 1,
0.7460619, 0.4222172, 0.1906813, 0, 0, 1, 1, 1,
0.7486438, -0.4214399, 1.520217, 1, 0, 0, 1, 1,
0.7512342, -0.03056265, 1.404434, 1, 0, 0, 1, 1,
0.7521269, -1.19846, 3.441303, 1, 0, 0, 1, 1,
0.7561752, 1.13226, -0.4177089, 1, 0, 0, 1, 1,
0.7601694, 1.393535, -0.08095817, 1, 0, 0, 1, 1,
0.7620022, -0.8602314, 3.344058, 0, 0, 0, 1, 1,
0.762554, 0.585651, 0.3123389, 0, 0, 0, 1, 1,
0.765378, 2.684531, 0.3339723, 0, 0, 0, 1, 1,
0.7674457, -0.1771438, 0.5690533, 0, 0, 0, 1, 1,
0.7685172, -0.07988784, 1.616038, 0, 0, 0, 1, 1,
0.7707354, -0.2921323, 0.6478357, 0, 0, 0, 1, 1,
0.770951, 0.5162569, 3.213316, 0, 0, 0, 1, 1,
0.771203, -0.0614479, 1.128006, 1, 1, 1, 1, 1,
0.7717109, -0.3939505, 2.303988, 1, 1, 1, 1, 1,
0.7723776, -1.329417, 3.152216, 1, 1, 1, 1, 1,
0.772495, 0.2103406, 1.399655, 1, 1, 1, 1, 1,
0.7749451, 0.01813496, 1.088716, 1, 1, 1, 1, 1,
0.775047, 0.2803909, 2.308863, 1, 1, 1, 1, 1,
0.7777548, -0.5103245, 1.761383, 1, 1, 1, 1, 1,
0.7780521, -0.9739835, 2.179298, 1, 1, 1, 1, 1,
0.7803053, 0.9879415, 2.04383, 1, 1, 1, 1, 1,
0.7812244, -0.6345802, 1.729471, 1, 1, 1, 1, 1,
0.7837834, -0.3510364, 2.974462, 1, 1, 1, 1, 1,
0.7908402, -0.5532086, 0.1275462, 1, 1, 1, 1, 1,
0.7917201, -0.203634, 1.721212, 1, 1, 1, 1, 1,
0.7918479, -0.1576896, 2.064366, 1, 1, 1, 1, 1,
0.795867, -1.189663, 0.6554435, 1, 1, 1, 1, 1,
0.8153917, 1.247737, 1.565152, 0, 0, 1, 1, 1,
0.8183201, -2.134482, 3.530773, 1, 0, 0, 1, 1,
0.8238232, 0.7485054, 1.915992, 1, 0, 0, 1, 1,
0.8297376, 2.402092, 0.9133033, 1, 0, 0, 1, 1,
0.8308557, 0.5876847, 2.128213, 1, 0, 0, 1, 1,
0.831835, 1.077314, 1.604794, 1, 0, 0, 1, 1,
0.8382311, -1.459135, 3.725191, 0, 0, 0, 1, 1,
0.8384908, 1.288258, 0.6682511, 0, 0, 0, 1, 1,
0.8465552, 1.771779, -0.248514, 0, 0, 0, 1, 1,
0.8497539, -0.6727262, 2.076104, 0, 0, 0, 1, 1,
0.8527554, -1.074166, 3.343161, 0, 0, 0, 1, 1,
0.855354, -0.9131457, 2.213111, 0, 0, 0, 1, 1,
0.8663151, -0.6921501, 1.582792, 0, 0, 0, 1, 1,
0.870179, -0.06172251, 3.292826, 1, 1, 1, 1, 1,
0.8725796, -0.5525652, 1.167156, 1, 1, 1, 1, 1,
0.8770082, -0.2366841, 1.20585, 1, 1, 1, 1, 1,
0.882752, 1.114254, 2.573939, 1, 1, 1, 1, 1,
0.8851838, 1.674374, 1.693442, 1, 1, 1, 1, 1,
0.8886657, -1.3578, 1.336171, 1, 1, 1, 1, 1,
0.8921659, 1.740253, 1.295944, 1, 1, 1, 1, 1,
0.9041118, 1.187209, 0.2884088, 1, 1, 1, 1, 1,
0.9073818, 1.574363, 0.9482654, 1, 1, 1, 1, 1,
0.9085034, 1.800112, 0.2226858, 1, 1, 1, 1, 1,
0.9149727, -1.151967, 2.572978, 1, 1, 1, 1, 1,
0.9187586, -0.5273298, 1.664179, 1, 1, 1, 1, 1,
0.9195632, -0.04680831, 3.744896, 1, 1, 1, 1, 1,
0.9263501, -1.026214, 2.661114, 1, 1, 1, 1, 1,
0.9319371, 0.5531139, 0.5269505, 1, 1, 1, 1, 1,
0.9348415, -0.3737421, 1.865326, 0, 0, 1, 1, 1,
0.9392824, -0.5626833, 2.625748, 1, 0, 0, 1, 1,
0.9423148, 1.350467, 1.598801, 1, 0, 0, 1, 1,
0.9433399, 1.288632, 0.6979017, 1, 0, 0, 1, 1,
0.9461994, 0.5318796, 2.472102, 1, 0, 0, 1, 1,
0.9476087, 1.091034, -1.063212, 1, 0, 0, 1, 1,
0.9499223, 0.8087102, 2.824012, 0, 0, 0, 1, 1,
0.9523693, -0.1012737, 1.279329, 0, 0, 0, 1, 1,
0.957004, -1.61191, 3.244855, 0, 0, 0, 1, 1,
0.9598777, -0.5814844, 1.735981, 0, 0, 0, 1, 1,
0.9620814, -0.91658, 2.357111, 0, 0, 0, 1, 1,
0.9660395, 1.635132, 0.7577201, 0, 0, 0, 1, 1,
0.9683855, -0.3251721, 1.523774, 0, 0, 0, 1, 1,
0.9704616, -0.02813992, 0.2487537, 1, 1, 1, 1, 1,
0.9834946, 0.3852324, 1.60596, 1, 1, 1, 1, 1,
0.9997371, 1.123156, 0.4842074, 1, 1, 1, 1, 1,
1.000335, 0.8933107, 1.228664, 1, 1, 1, 1, 1,
1.000587, -0.3611879, 1.756027, 1, 1, 1, 1, 1,
1.009282, 0.5077509, 0.8780335, 1, 1, 1, 1, 1,
1.014874, 0.2719573, 1.638614, 1, 1, 1, 1, 1,
1.015736, -1.803165, 2.954321, 1, 1, 1, 1, 1,
1.01896, -0.4543822, 1.42643, 1, 1, 1, 1, 1,
1.025502, -0.7642471, 1.09545, 1, 1, 1, 1, 1,
1.026621, 0.3220211, 1.366972, 1, 1, 1, 1, 1,
1.026862, -0.6234506, 0.7933567, 1, 1, 1, 1, 1,
1.030753, 1.268993, -0.3626992, 1, 1, 1, 1, 1,
1.04988, -0.01937756, -0.03861483, 1, 1, 1, 1, 1,
1.055659, 1.182765, 2.229092, 1, 1, 1, 1, 1,
1.066667, 1.060286, 3.349506, 0, 0, 1, 1, 1,
1.082641, 0.7926033, 0.8603355, 1, 0, 0, 1, 1,
1.084896, -0.7056682, 2.936247, 1, 0, 0, 1, 1,
1.096322, -1.378713, 2.660109, 1, 0, 0, 1, 1,
1.103698, -0.2140322, 2.227822, 1, 0, 0, 1, 1,
1.105444, -0.5830781, 2.40198, 1, 0, 0, 1, 1,
1.121304, -0.1336478, 2.705402, 0, 0, 0, 1, 1,
1.129963, 0.7205857, 1.644315, 0, 0, 0, 1, 1,
1.130541, -0.6777053, 1.690406, 0, 0, 0, 1, 1,
1.142991, -0.3739763, 0.816323, 0, 0, 0, 1, 1,
1.151515, 2.644804, 1.814428, 0, 0, 0, 1, 1,
1.152183, 1.370583, 0.1170759, 0, 0, 0, 1, 1,
1.155144, -0.353979, 0.7300471, 0, 0, 0, 1, 1,
1.156359, -1.361582, 1.077028, 1, 1, 1, 1, 1,
1.158239, 1.34427, -1.475908, 1, 1, 1, 1, 1,
1.159766, -0.05012048, 0.6493121, 1, 1, 1, 1, 1,
1.168904, 2.338847, -0.6655101, 1, 1, 1, 1, 1,
1.182349, 0.6899977, 1.037441, 1, 1, 1, 1, 1,
1.182886, 0.9036523, 0.9846102, 1, 1, 1, 1, 1,
1.186628, 0.8985588, 0.8945178, 1, 1, 1, 1, 1,
1.190204, 0.8143018, 0.8513486, 1, 1, 1, 1, 1,
1.191996, -0.7282417, 0.7345983, 1, 1, 1, 1, 1,
1.194975, 0.1666879, 1.564732, 1, 1, 1, 1, 1,
1.195036, -0.5368041, 1.023942, 1, 1, 1, 1, 1,
1.195103, 0.4690167, 2.038197, 1, 1, 1, 1, 1,
1.196946, 0.1441522, 0.4375346, 1, 1, 1, 1, 1,
1.219107, -1.201896, 2.200114, 1, 1, 1, 1, 1,
1.220247, 0.3513545, 1.978947, 1, 1, 1, 1, 1,
1.220487, -1.524969, 3.670485, 0, 0, 1, 1, 1,
1.22987, -0.8950595, 3.59968, 1, 0, 0, 1, 1,
1.238301, 0.2798052, 0.9683024, 1, 0, 0, 1, 1,
1.252565, -0.7955015, 1.758704, 1, 0, 0, 1, 1,
1.254943, 0.01085726, 1.200606, 1, 0, 0, 1, 1,
1.256475, -0.5870362, 2.311563, 1, 0, 0, 1, 1,
1.264871, -2.317233, 2.048114, 0, 0, 0, 1, 1,
1.268829, 1.06697, 0.8369226, 0, 0, 0, 1, 1,
1.288138, -2.30359, 3.634343, 0, 0, 0, 1, 1,
1.303763, -0.2950826, 3.834619, 0, 0, 0, 1, 1,
1.309056, 0.9204149, 1.804697, 0, 0, 0, 1, 1,
1.323023, -0.1590065, -1.764391, 0, 0, 0, 1, 1,
1.324341, -0.2810474, 2.70744, 0, 0, 0, 1, 1,
1.328001, 0.04747126, 0.422383, 1, 1, 1, 1, 1,
1.33727, -1.589154, 2.016234, 1, 1, 1, 1, 1,
1.340437, 0.633154, 1.268026, 1, 1, 1, 1, 1,
1.343459, -0.02800236, 2.491712, 1, 1, 1, 1, 1,
1.348821, -1.052562, 3.959806, 1, 1, 1, 1, 1,
1.361223, 0.4795074, 0.08747222, 1, 1, 1, 1, 1,
1.363156, 0.9712179, 1.447781, 1, 1, 1, 1, 1,
1.372378, 0.7883791, 0.9576768, 1, 1, 1, 1, 1,
1.376389, 1.304634, 0.1152158, 1, 1, 1, 1, 1,
1.381255, 0.1174622, 3.195297, 1, 1, 1, 1, 1,
1.399921, -0.4875335, 1.122073, 1, 1, 1, 1, 1,
1.401992, -0.9884444, 2.34952, 1, 1, 1, 1, 1,
1.411796, -0.2700517, 1.612876, 1, 1, 1, 1, 1,
1.413177, -0.4268338, 2.185609, 1, 1, 1, 1, 1,
1.4146, 0.8871139, -0.1200081, 1, 1, 1, 1, 1,
1.41586, -0.4459811, 1.966423, 0, 0, 1, 1, 1,
1.419651, 1.330904, 2.792611, 1, 0, 0, 1, 1,
1.420802, -0.6982608, 1.46577, 1, 0, 0, 1, 1,
1.423932, -0.4973026, 2.859539, 1, 0, 0, 1, 1,
1.424449, -0.1766131, 1.13131, 1, 0, 0, 1, 1,
1.425586, -0.8448789, 1.118106, 1, 0, 0, 1, 1,
1.44686, 0.1651098, 0.9622995, 0, 0, 0, 1, 1,
1.450759, 1.359096, 1.92078, 0, 0, 0, 1, 1,
1.462177, -0.4200598, 2.149487, 0, 0, 0, 1, 1,
1.482857, 0.1219599, 2.401585, 0, 0, 0, 1, 1,
1.491677, -1.452608, 3.015908, 0, 0, 0, 1, 1,
1.509395, 0.7815168, 1.580511, 0, 0, 0, 1, 1,
1.511164, 1.985971, 2.484571, 0, 0, 0, 1, 1,
1.525923, 0.1298198, 3.993111, 1, 1, 1, 1, 1,
1.550008, -0.2988717, 3.26143, 1, 1, 1, 1, 1,
1.573833, -1.588444, 2.069155, 1, 1, 1, 1, 1,
1.574887, -1.093615, 1.677575, 1, 1, 1, 1, 1,
1.575343, 1.216396, 1.701365, 1, 1, 1, 1, 1,
1.581585, 1.559152, 0.5069333, 1, 1, 1, 1, 1,
1.586197, -2.16217, 1.022035, 1, 1, 1, 1, 1,
1.588653, 0.9028581, -0.3544407, 1, 1, 1, 1, 1,
1.592719, -1.360513, 1.089718, 1, 1, 1, 1, 1,
1.593605, 0.9206682, 2.176109, 1, 1, 1, 1, 1,
1.598409, -1.943981, 4.225802, 1, 1, 1, 1, 1,
1.599064, -1.010406, 2.536226, 1, 1, 1, 1, 1,
1.601261, -0.52551, 2.110991, 1, 1, 1, 1, 1,
1.616509, 1.666418, -1.078687, 1, 1, 1, 1, 1,
1.623984, 1.624872, 0.02989972, 1, 1, 1, 1, 1,
1.65644, -2.55612, 2.35372, 0, 0, 1, 1, 1,
1.658068, -1.372533, 3.295168, 1, 0, 0, 1, 1,
1.664308, 0.1907069, 1.261538, 1, 0, 0, 1, 1,
1.669025, -0.1957, 2.797394, 1, 0, 0, 1, 1,
1.673491, -1.044096, 0.9461094, 1, 0, 0, 1, 1,
1.678689, -1.311781, 0.4581308, 1, 0, 0, 1, 1,
1.684467, 1.044263, 1.752376, 0, 0, 0, 1, 1,
1.690789, -0.7637798, 0.4963764, 0, 0, 0, 1, 1,
1.705152, -2.009513, 4.021895, 0, 0, 0, 1, 1,
1.705965, 0.8231718, -0.2274446, 0, 0, 0, 1, 1,
1.714285, 1.057865, 3.411254, 0, 0, 0, 1, 1,
1.728524, -1.773421, 2.180512, 0, 0, 0, 1, 1,
1.729902, -0.1967364, 1.913761, 0, 0, 0, 1, 1,
1.731335, -0.5720986, 0.5924445, 1, 1, 1, 1, 1,
1.769946, -0.2071042, 1.39561, 1, 1, 1, 1, 1,
1.77724, 0.9266362, -0.8554244, 1, 1, 1, 1, 1,
1.808351, 0.8948499, 0.5446641, 1, 1, 1, 1, 1,
1.81281, 0.4940732, 2.173085, 1, 1, 1, 1, 1,
1.830032, -1.09218, 1.432431, 1, 1, 1, 1, 1,
1.837006, 0.5189855, 1.770365, 1, 1, 1, 1, 1,
1.840116, -2.026551, 3.596437, 1, 1, 1, 1, 1,
1.84492, 1.165776, -0.7404884, 1, 1, 1, 1, 1,
1.848022, -0.1127751, 2.055404, 1, 1, 1, 1, 1,
1.849258, 0.5954738, 1.232098, 1, 1, 1, 1, 1,
1.860718, 0.6390029, 1.20789, 1, 1, 1, 1, 1,
1.919296, -0.0003645627, 1.046771, 1, 1, 1, 1, 1,
1.92558, 1.107279, 1.862028, 1, 1, 1, 1, 1,
1.934756, -0.8177099, 2.925626, 1, 1, 1, 1, 1,
1.950542, -0.541246, 3.251685, 0, 0, 1, 1, 1,
1.951494, -0.0701044, 1.444957, 1, 0, 0, 1, 1,
1.954459, 0.3679003, 0.365826, 1, 0, 0, 1, 1,
1.965304, -2.009606, 4.656453, 1, 0, 0, 1, 1,
2.058632, -0.07308866, 2.331419, 1, 0, 0, 1, 1,
2.128922, 0.7878593, 1.305198, 1, 0, 0, 1, 1,
2.18996, 0.654686, 2.014729, 0, 0, 0, 1, 1,
2.253625, 1.695293, 3.75046, 0, 0, 0, 1, 1,
2.310303, 0.01868913, 1.821737, 0, 0, 0, 1, 1,
2.345945, 0.7328051, 1.07912, 0, 0, 0, 1, 1,
2.383518, -0.2381673, 2.891479, 0, 0, 0, 1, 1,
2.42226, 1.2006, 1.810243, 0, 0, 0, 1, 1,
2.491666, 0.3657473, 2.534125, 0, 0, 0, 1, 1,
2.552859, -2.154002, 2.889086, 1, 1, 1, 1, 1,
2.61728, -0.9561501, 0.09595458, 1, 1, 1, 1, 1,
2.648202, -0.2227568, 2.058208, 1, 1, 1, 1, 1,
2.650159, -1.405599, -0.06401837, 1, 1, 1, 1, 1,
2.653758, -1.328129, 3.921098, 1, 1, 1, 1, 1,
2.736179, 1.229412, -0.3494388, 1, 1, 1, 1, 1,
3.349928, 0.6890534, -0.5605733, 1, 1, 1, 1, 1
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
var radius = 9.787915;
var distance = 34.37963;
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
mvMatrix.translate( 0.1877851, -0.02005744, -0.1655717 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.37963);
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
