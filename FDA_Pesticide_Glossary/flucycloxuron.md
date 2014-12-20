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
-3.056102, 0.8305857, -0.6344576, 1, 0, 0, 1,
-2.939385, 1.174959, 0.3528553, 1, 0.007843138, 0, 1,
-2.794978, -0.5183912, -1.549485, 1, 0.01176471, 0, 1,
-2.782284, 0.5323233, 1.477964, 1, 0.01960784, 0, 1,
-2.771546, 0.264584, -2.514074, 1, 0.02352941, 0, 1,
-2.672987, -0.01701557, -2.1107, 1, 0.03137255, 0, 1,
-2.633471, -0.691592, -1.64512, 1, 0.03529412, 0, 1,
-2.574365, -1.110947, -0.2753353, 1, 0.04313726, 0, 1,
-2.552568, 0.1974224, -0.8038111, 1, 0.04705882, 0, 1,
-2.549305, 0.4111176, 0.01642473, 1, 0.05490196, 0, 1,
-2.392638, 2.095497, -2.604382, 1, 0.05882353, 0, 1,
-2.376866, 0.4944907, -3.34778, 1, 0.06666667, 0, 1,
-2.370437, 1.266962, -2.731292, 1, 0.07058824, 0, 1,
-2.326294, 0.5144127, -0.3295088, 1, 0.07843138, 0, 1,
-2.315428, 0.3556623, -1.546699, 1, 0.08235294, 0, 1,
-2.293353, 0.5897807, -0.2462537, 1, 0.09019608, 0, 1,
-2.235614, -0.9901053, -1.901421, 1, 0.09411765, 0, 1,
-2.108914, -1.267681, -2.116498, 1, 0.1019608, 0, 1,
-2.102995, -0.480707, -2.252514, 1, 0.1098039, 0, 1,
-2.097805, -1.496534, -1.590533, 1, 0.1137255, 0, 1,
-2.092944, 0.0472143, -1.616174, 1, 0.1215686, 0, 1,
-2.078737, 0.7876213, -0.07655761, 1, 0.1254902, 0, 1,
-2.024289, -0.4456536, -1.743126, 1, 0.1333333, 0, 1,
-1.990452, -0.6163536, -1.629566, 1, 0.1372549, 0, 1,
-1.981826, 0.3682004, -1.339294, 1, 0.145098, 0, 1,
-1.95924, 1.120417, 1.665018, 1, 0.1490196, 0, 1,
-1.957748, 0.009790127, -2.138052, 1, 0.1568628, 0, 1,
-1.956074, 1.114032, -0.8522928, 1, 0.1607843, 0, 1,
-1.944585, -0.2831954, -2.884956, 1, 0.1686275, 0, 1,
-1.9167, -0.2382365, -3.128215, 1, 0.172549, 0, 1,
-1.909553, -0.0350955, 0.1827123, 1, 0.1803922, 0, 1,
-1.874598, 0.5686203, -2.006229, 1, 0.1843137, 0, 1,
-1.872554, -1.195431, -3.697203, 1, 0.1921569, 0, 1,
-1.86902, -1.122509, -3.021027, 1, 0.1960784, 0, 1,
-1.848177, 0.9048444, -0.3776816, 1, 0.2039216, 0, 1,
-1.838449, 0.8167022, -1.981083, 1, 0.2117647, 0, 1,
-1.833833, -0.5930578, -1.651636, 1, 0.2156863, 0, 1,
-1.833078, -1.78172, -2.714142, 1, 0.2235294, 0, 1,
-1.82121, -0.1021117, -3.239549e-05, 1, 0.227451, 0, 1,
-1.8158, -1.178403, -1.092403, 1, 0.2352941, 0, 1,
-1.799414, 2.293797, -0.914446, 1, 0.2392157, 0, 1,
-1.780845, -0.1895649, -1.337604, 1, 0.2470588, 0, 1,
-1.780529, 0.77902, -0.5202302, 1, 0.2509804, 0, 1,
-1.773864, 0.4329271, -0.9304014, 1, 0.2588235, 0, 1,
-1.771516, 0.09065017, -1.853836, 1, 0.2627451, 0, 1,
-1.759045, -0.1826039, -2.021058, 1, 0.2705882, 0, 1,
-1.75698, -0.1481785, -0.825609, 1, 0.2745098, 0, 1,
-1.750212, 1.538506, -1.414663, 1, 0.282353, 0, 1,
-1.741645, -0.2028908, -2.390305, 1, 0.2862745, 0, 1,
-1.679247, -2.137991, -1.519655, 1, 0.2941177, 0, 1,
-1.67455, -0.34335, -1.001676, 1, 0.3019608, 0, 1,
-1.666391, -0.957579, -1.55296, 1, 0.3058824, 0, 1,
-1.649696, 0.1104803, -2.023536, 1, 0.3137255, 0, 1,
-1.645438, 1.158239, -1.073085, 1, 0.3176471, 0, 1,
-1.609304, 0.1221988, -2.039025, 1, 0.3254902, 0, 1,
-1.60727, 1.796377, -0.302743, 1, 0.3294118, 0, 1,
-1.586177, -0.8204706, -2.8998, 1, 0.3372549, 0, 1,
-1.578812, 0.2809907, -2.970639, 1, 0.3411765, 0, 1,
-1.554347, 0.6065846, -0.8107732, 1, 0.3490196, 0, 1,
-1.548417, -0.400244, -1.575182, 1, 0.3529412, 0, 1,
-1.536275, 1.760599, 0.4403907, 1, 0.3607843, 0, 1,
-1.533447, -1.398248, -2.085803, 1, 0.3647059, 0, 1,
-1.52944, 0.1520704, -1.717487, 1, 0.372549, 0, 1,
-1.528189, -0.7861334, -1.558009, 1, 0.3764706, 0, 1,
-1.504713, 0.02051351, -2.065519, 1, 0.3843137, 0, 1,
-1.502556, 0.2111898, -1.083238, 1, 0.3882353, 0, 1,
-1.497756, 0.7174369, -1.234132, 1, 0.3960784, 0, 1,
-1.488718, -0.6058456, -4.926424, 1, 0.4039216, 0, 1,
-1.480763, 1.107114, -0.1998523, 1, 0.4078431, 0, 1,
-1.476749, -0.4671699, -2.082729, 1, 0.4156863, 0, 1,
-1.453955, -1.936694, -1.530794, 1, 0.4196078, 0, 1,
-1.447526, 1.220049, 0.2238806, 1, 0.427451, 0, 1,
-1.444574, 0.2848197, -2.54276, 1, 0.4313726, 0, 1,
-1.441573, 1.456327, -1.351885, 1, 0.4392157, 0, 1,
-1.437491, -1.721731, -3.737388, 1, 0.4431373, 0, 1,
-1.433653, 0.0344035, -1.814115, 1, 0.4509804, 0, 1,
-1.426823, -0.02015164, -1.422216, 1, 0.454902, 0, 1,
-1.42274, -0.01296917, -1.48484, 1, 0.4627451, 0, 1,
-1.410772, 0.2691387, -2.159965, 1, 0.4666667, 0, 1,
-1.408041, -1.013858, -2.795825, 1, 0.4745098, 0, 1,
-1.399011, -0.9106148, -1.445416, 1, 0.4784314, 0, 1,
-1.398815, 2.245594, -0.0615386, 1, 0.4862745, 0, 1,
-1.392531, 0.6855255, 0.9210004, 1, 0.4901961, 0, 1,
-1.387249, 1.192861, -1.784648, 1, 0.4980392, 0, 1,
-1.383645, -0.5137848, -2.517654, 1, 0.5058824, 0, 1,
-1.364582, -0.7544231, -1.709665, 1, 0.509804, 0, 1,
-1.35997, -1.74652, -1.851275, 1, 0.5176471, 0, 1,
-1.353548, -1.21432, -0.8390254, 1, 0.5215687, 0, 1,
-1.350407, -0.1091272, -1.710085, 1, 0.5294118, 0, 1,
-1.341905, 1.055413, -2.04641, 1, 0.5333334, 0, 1,
-1.338669, 0.3490653, 0.005597016, 1, 0.5411765, 0, 1,
-1.319262, -0.03194094, -2.631777, 1, 0.5450981, 0, 1,
-1.316798, 0.2170636, -0.4965642, 1, 0.5529412, 0, 1,
-1.312801, -0.07255504, -1.774612, 1, 0.5568628, 0, 1,
-1.310492, -0.9817384, -3.640902, 1, 0.5647059, 0, 1,
-1.308738, 1.249251, -0.8171653, 1, 0.5686275, 0, 1,
-1.297747, -1.179753, -0.5379313, 1, 0.5764706, 0, 1,
-1.29092, 1.207585, -1.220011, 1, 0.5803922, 0, 1,
-1.274991, -0.6187335, -2.583808, 1, 0.5882353, 0, 1,
-1.274492, -2.342265, -2.383455, 1, 0.5921569, 0, 1,
-1.265966, -1.553972, -2.530893, 1, 0.6, 0, 1,
-1.265806, 0.1629486, -0.7425967, 1, 0.6078432, 0, 1,
-1.265527, 0.1929785, 0.1365725, 1, 0.6117647, 0, 1,
-1.243695, 0.3855035, -0.2059988, 1, 0.6196079, 0, 1,
-1.233249, 0.704548, -0.08630335, 1, 0.6235294, 0, 1,
-1.224732, -0.2152346, -2.252423, 1, 0.6313726, 0, 1,
-1.224463, -1.031754, -2.456844, 1, 0.6352941, 0, 1,
-1.223786, 0.2649089, -1.347319, 1, 0.6431373, 0, 1,
-1.22333, 1.283502, 1.123394, 1, 0.6470588, 0, 1,
-1.222146, -0.2810645, -1.219531, 1, 0.654902, 0, 1,
-1.218695, -0.2777452, -3.835519, 1, 0.6588235, 0, 1,
-1.216753, 0.4614024, -1.547976, 1, 0.6666667, 0, 1,
-1.211334, -0.4487801, -2.758846, 1, 0.6705883, 0, 1,
-1.210538, 0.2800382, -1.705244, 1, 0.6784314, 0, 1,
-1.207838, 0.5714869, -1.421397, 1, 0.682353, 0, 1,
-1.206928, 1.040558, -1.234364, 1, 0.6901961, 0, 1,
-1.200282, -1.175709, -1.043136, 1, 0.6941177, 0, 1,
-1.198834, -0.406035, -1.877521, 1, 0.7019608, 0, 1,
-1.198066, 0.381811, -2.324042, 1, 0.7098039, 0, 1,
-1.190583, 0.4972304, -1.765243, 1, 0.7137255, 0, 1,
-1.189489, 2.662088, -1.396304, 1, 0.7215686, 0, 1,
-1.179345, 1.05914, -0.8209575, 1, 0.7254902, 0, 1,
-1.175521, 0.5530637, 0.7138514, 1, 0.7333333, 0, 1,
-1.163152, 0.2956383, -1.12733, 1, 0.7372549, 0, 1,
-1.157156, -0.7266412, -3.429594, 1, 0.7450981, 0, 1,
-1.155074, -0.01552236, -1.595727, 1, 0.7490196, 0, 1,
-1.154173, -0.01537848, -0.6404482, 1, 0.7568628, 0, 1,
-1.153904, -0.3526282, -2.829375, 1, 0.7607843, 0, 1,
-1.153034, 0.4964539, -0.3314281, 1, 0.7686275, 0, 1,
-1.146334, -0.5187867, -1.894011, 1, 0.772549, 0, 1,
-1.143347, -0.3531264, -1.614401, 1, 0.7803922, 0, 1,
-1.143244, -0.2152747, -2.538525, 1, 0.7843137, 0, 1,
-1.136326, 0.009548564, -0.7336187, 1, 0.7921569, 0, 1,
-1.121901, 1.253458, -1.367813, 1, 0.7960784, 0, 1,
-1.1163, 0.1960236, -1.841419, 1, 0.8039216, 0, 1,
-1.115638, 0.6996214, -0.9517634, 1, 0.8117647, 0, 1,
-1.099629, -0.3139738, -2.321155, 1, 0.8156863, 0, 1,
-1.098759, 0.2843172, -0.06845456, 1, 0.8235294, 0, 1,
-1.096152, -0.3425887, -2.719599, 1, 0.827451, 0, 1,
-1.082756, -0.185615, -0.6742709, 1, 0.8352941, 0, 1,
-1.079273, 0.509828, -0.4503743, 1, 0.8392157, 0, 1,
-1.073706, -1.437801, -2.27381, 1, 0.8470588, 0, 1,
-1.073545, 0.6159841, -0.2006031, 1, 0.8509804, 0, 1,
-1.073076, -1.365618, -2.938946, 1, 0.8588235, 0, 1,
-1.071836, -0.7392586, -1.985526, 1, 0.8627451, 0, 1,
-1.067878, 0.9804839, -1.389706, 1, 0.8705882, 0, 1,
-1.066349, 1.159806, -1.035012, 1, 0.8745098, 0, 1,
-1.058243, -0.326151, -0.9250972, 1, 0.8823529, 0, 1,
-1.048165, 1.040866, -1.366405, 1, 0.8862745, 0, 1,
-1.044888, -0.6009833, -3.199017, 1, 0.8941177, 0, 1,
-1.039961, -0.9293365, -3.198613, 1, 0.8980392, 0, 1,
-1.039619, -1.484885, -2.910716, 1, 0.9058824, 0, 1,
-1.037865, -1.166207, -1.135751, 1, 0.9137255, 0, 1,
-1.02985, 0.8866208, -2.80569, 1, 0.9176471, 0, 1,
-1.028215, 1.313395, -1.960855, 1, 0.9254902, 0, 1,
-1.016974, 0.5952505, -0.7247371, 1, 0.9294118, 0, 1,
-1.016793, 0.7381136, -0.508256, 1, 0.9372549, 0, 1,
-1.006742, 2.832385, -0.196891, 1, 0.9411765, 0, 1,
-1.002981, -0.861383, -2.200767, 1, 0.9490196, 0, 1,
-1.002783, 0.7096739, -0.9612652, 1, 0.9529412, 0, 1,
-1.002109, -0.8867946, -2.037077, 1, 0.9607843, 0, 1,
-0.9905503, -0.5131081, -3.547636, 1, 0.9647059, 0, 1,
-0.9883551, 1.337238, 0.4061107, 1, 0.972549, 0, 1,
-0.9739925, 1.854815, 0.6392789, 1, 0.9764706, 0, 1,
-0.9722202, -0.05178174, -0.1280343, 1, 0.9843137, 0, 1,
-0.9716099, 0.9597403, -1.382104, 1, 0.9882353, 0, 1,
-0.970897, -0.1621397, -3.016931, 1, 0.9960784, 0, 1,
-0.9701778, 0.5318618, -0.8292685, 0.9960784, 1, 0, 1,
-0.9671016, 0.3112571, -1.637493, 0.9921569, 1, 0, 1,
-0.9664847, -1.76318, -1.413646, 0.9843137, 1, 0, 1,
-0.9620918, -1.453161, -2.311934, 0.9803922, 1, 0, 1,
-0.9620836, -1.173852, -2.277586, 0.972549, 1, 0, 1,
-0.9595608, -0.1248187, -1.635721, 0.9686275, 1, 0, 1,
-0.9548615, 0.7425978, -2.079289, 0.9607843, 1, 0, 1,
-0.9546475, -0.3201468, -4.229214, 0.9568627, 1, 0, 1,
-0.9490227, 0.8652521, 0.3669614, 0.9490196, 1, 0, 1,
-0.9327571, 1.65919, 0.799364, 0.945098, 1, 0, 1,
-0.9290688, 0.04849704, -0.4643694, 0.9372549, 1, 0, 1,
-0.9272535, -0.08620878, -0.417467, 0.9333333, 1, 0, 1,
-0.9206257, 1.238517, -1.854878, 0.9254902, 1, 0, 1,
-0.9199198, 0.931504, -1.44172, 0.9215686, 1, 0, 1,
-0.9195663, 1.342035, -0.8339436, 0.9137255, 1, 0, 1,
-0.9132749, 0.8095405, -1.067855, 0.9098039, 1, 0, 1,
-0.9086521, 0.2662273, -2.853348, 0.9019608, 1, 0, 1,
-0.9078258, -0.09378722, 0.1113431, 0.8941177, 1, 0, 1,
-0.9025624, 0.6883926, -2.249594, 0.8901961, 1, 0, 1,
-0.8989731, -0.2782933, -1.458887, 0.8823529, 1, 0, 1,
-0.8982575, -1.460715, -2.067445, 0.8784314, 1, 0, 1,
-0.8971854, 0.2394997, -1.348311, 0.8705882, 1, 0, 1,
-0.8886663, 0.07590831, -2.542278, 0.8666667, 1, 0, 1,
-0.8863865, 0.2950146, -1.297454, 0.8588235, 1, 0, 1,
-0.8849592, 0.134449, -2.564308, 0.854902, 1, 0, 1,
-0.884591, 0.5298901, -1.651225, 0.8470588, 1, 0, 1,
-0.8795493, 0.2481939, -1.170826, 0.8431373, 1, 0, 1,
-0.8794287, -1.633568, -4.435831, 0.8352941, 1, 0, 1,
-0.8784608, 0.3336209, -1.210392, 0.8313726, 1, 0, 1,
-0.8747161, -0.4933118, -2.011347, 0.8235294, 1, 0, 1,
-0.8671494, 0.03296374, -1.921667, 0.8196079, 1, 0, 1,
-0.8554257, -1.198137, -3.149137, 0.8117647, 1, 0, 1,
-0.849876, -0.313991, -0.969875, 0.8078431, 1, 0, 1,
-0.8480327, -1.26803, -3.86124, 0.8, 1, 0, 1,
-0.8477236, -0.7588438, -1.903372, 0.7921569, 1, 0, 1,
-0.8468114, 2.289001, -0.8194511, 0.7882353, 1, 0, 1,
-0.844946, 0.7023358, -0.01073785, 0.7803922, 1, 0, 1,
-0.8408849, -0.5588756, -2.151051, 0.7764706, 1, 0, 1,
-0.8373411, 0.6820384, 0.4806113, 0.7686275, 1, 0, 1,
-0.8355677, 0.7007751, -2.047124, 0.7647059, 1, 0, 1,
-0.8344042, 2.57086, 0.868376, 0.7568628, 1, 0, 1,
-0.8322918, 1.365078, -0.06571695, 0.7529412, 1, 0, 1,
-0.8315879, -2.138904, -5.010604, 0.7450981, 1, 0, 1,
-0.8160391, -1.355167, -3.683, 0.7411765, 1, 0, 1,
-0.8112454, 0.3088822, -0.9774507, 0.7333333, 1, 0, 1,
-0.8109191, 0.05472912, -2.104844, 0.7294118, 1, 0, 1,
-0.8095086, 1.149063, 0.4205374, 0.7215686, 1, 0, 1,
-0.7924162, 2.207295, 0.07886078, 0.7176471, 1, 0, 1,
-0.7898191, 0.7563086, -0.9596548, 0.7098039, 1, 0, 1,
-0.788133, -1.156218, -2.184356, 0.7058824, 1, 0, 1,
-0.7838654, -0.7345293, -2.943393, 0.6980392, 1, 0, 1,
-0.7837454, -1.60836, -2.847989, 0.6901961, 1, 0, 1,
-0.7766425, -1.17145, -1.631759, 0.6862745, 1, 0, 1,
-0.7749839, 1.244166, -0.6202474, 0.6784314, 1, 0, 1,
-0.7718021, -1.271634, -2.422465, 0.6745098, 1, 0, 1,
-0.7710083, 1.028988, -2.067454, 0.6666667, 1, 0, 1,
-0.7695369, -0.7427117, -2.306865, 0.6627451, 1, 0, 1,
-0.7681946, -0.3237926, -1.125026, 0.654902, 1, 0, 1,
-0.7665753, 0.01299724, -0.403554, 0.6509804, 1, 0, 1,
-0.7595279, -1.115742, -3.426455, 0.6431373, 1, 0, 1,
-0.7582973, -1.913922, -2.150104, 0.6392157, 1, 0, 1,
-0.7496868, 1.927508, 0.3441911, 0.6313726, 1, 0, 1,
-0.7458828, -0.8189439, -2.865933, 0.627451, 1, 0, 1,
-0.7444693, -1.270513, -3.024064, 0.6196079, 1, 0, 1,
-0.7389597, 0.7004094, 0.003124342, 0.6156863, 1, 0, 1,
-0.7350321, -1.117253, -4.463227, 0.6078432, 1, 0, 1,
-0.7279766, -0.396008, -0.8817785, 0.6039216, 1, 0, 1,
-0.723759, 0.4839628, -1.056448, 0.5960785, 1, 0, 1,
-0.7216405, 0.7192054, 0.009922273, 0.5882353, 1, 0, 1,
-0.7201325, 2.094847, -0.03523091, 0.5843138, 1, 0, 1,
-0.7152571, -0.9339558, -3.37364, 0.5764706, 1, 0, 1,
-0.7099143, -1.052455, -2.832535, 0.572549, 1, 0, 1,
-0.7034732, 0.8044618, -1.005221, 0.5647059, 1, 0, 1,
-0.7013718, -0.5846599, -4.14499, 0.5607843, 1, 0, 1,
-0.701214, 0.3106415, -0.8732169, 0.5529412, 1, 0, 1,
-0.6877342, -0.1197552, -2.086642, 0.5490196, 1, 0, 1,
-0.6868862, 0.3679257, -0.4109514, 0.5411765, 1, 0, 1,
-0.679885, -2.493384, -3.281189, 0.5372549, 1, 0, 1,
-0.6687696, 0.9791101, -0.7770919, 0.5294118, 1, 0, 1,
-0.6603054, 2.278613, -0.6579093, 0.5254902, 1, 0, 1,
-0.6573435, 0.1644608, -1.776324, 0.5176471, 1, 0, 1,
-0.655529, -0.2476707, -2.703493, 0.5137255, 1, 0, 1,
-0.6551384, 0.258639, -1.30869, 0.5058824, 1, 0, 1,
-0.6513726, 0.9216759, 0.384269, 0.5019608, 1, 0, 1,
-0.6476895, 0.3881657, -1.965128, 0.4941176, 1, 0, 1,
-0.6457279, -1.314476, -2.699117, 0.4862745, 1, 0, 1,
-0.6387613, 0.3045207, -2.19222, 0.4823529, 1, 0, 1,
-0.6270173, -0.6143783, -0.8516247, 0.4745098, 1, 0, 1,
-0.6229168, 0.8216937, 0.3994557, 0.4705882, 1, 0, 1,
-0.6223184, 0.1876989, -1.270653, 0.4627451, 1, 0, 1,
-0.6202677, -0.4889567, -4.62919, 0.4588235, 1, 0, 1,
-0.6194142, 0.02037674, -0.1038622, 0.4509804, 1, 0, 1,
-0.6180112, -0.9137057, -4.252337, 0.4470588, 1, 0, 1,
-0.6124254, 0.9506447, -0.1814794, 0.4392157, 1, 0, 1,
-0.611922, 0.009140541, -2.619441, 0.4352941, 1, 0, 1,
-0.6011476, 0.7797794, -0.9165389, 0.427451, 1, 0, 1,
-0.5997106, 0.5324894, -0.07558121, 0.4235294, 1, 0, 1,
-0.5970271, -0.6261148, -1.537613, 0.4156863, 1, 0, 1,
-0.5870429, 1.451913, 0.3757547, 0.4117647, 1, 0, 1,
-0.5835195, 0.5981746, -0.9117531, 0.4039216, 1, 0, 1,
-0.5823742, -0.2081345, -1.791589, 0.3960784, 1, 0, 1,
-0.5798563, 1.730863, -1.001719, 0.3921569, 1, 0, 1,
-0.5790648, -0.5828325, -3.028716, 0.3843137, 1, 0, 1,
-0.5783736, -1.026161, -2.708807, 0.3803922, 1, 0, 1,
-0.5695624, 0.1241764, -0.8712271, 0.372549, 1, 0, 1,
-0.5659518, 0.761087, 0.3908072, 0.3686275, 1, 0, 1,
-0.5658253, 1.350545, 0.3892935, 0.3607843, 1, 0, 1,
-0.565361, -0.1405055, -2.201166, 0.3568628, 1, 0, 1,
-0.5637397, 0.2696916, -0.3727524, 0.3490196, 1, 0, 1,
-0.5621704, 0.5236101, -1.031556, 0.345098, 1, 0, 1,
-0.5573363, 0.9534874, -0.1094491, 0.3372549, 1, 0, 1,
-0.5541346, -1.567708, -2.062405, 0.3333333, 1, 0, 1,
-0.5527582, -0.2824454, -2.962155, 0.3254902, 1, 0, 1,
-0.5511442, -0.5402055, -1.569823, 0.3215686, 1, 0, 1,
-0.5499868, -0.5959735, -1.945972, 0.3137255, 1, 0, 1,
-0.5477187, 0.6040707, 0.2967611, 0.3098039, 1, 0, 1,
-0.5476267, 1.483806, -1.503593, 0.3019608, 1, 0, 1,
-0.5436896, -0.4081883, -2.506194, 0.2941177, 1, 0, 1,
-0.5390139, 1.057633, -0.02922612, 0.2901961, 1, 0, 1,
-0.5376258, -1.713648, -3.133328, 0.282353, 1, 0, 1,
-0.5346853, 0.1919495, -1.578738, 0.2784314, 1, 0, 1,
-0.5196368, 0.4971097, 0.485234, 0.2705882, 1, 0, 1,
-0.5131569, 0.3220046, -0.2428279, 0.2666667, 1, 0, 1,
-0.5130919, 1.56025, -1.440616, 0.2588235, 1, 0, 1,
-0.5117482, -0.5162336, -3.481072, 0.254902, 1, 0, 1,
-0.4999913, 0.4001343, -1.118167, 0.2470588, 1, 0, 1,
-0.4998868, 0.6521912, -1.03143, 0.2431373, 1, 0, 1,
-0.4997536, 0.3163895, -1.450421, 0.2352941, 1, 0, 1,
-0.4996693, 1.952359, -0.3123988, 0.2313726, 1, 0, 1,
-0.4988511, -0.5071529, -4.048753, 0.2235294, 1, 0, 1,
-0.4925548, 0.4102933, -0.1587776, 0.2196078, 1, 0, 1,
-0.4917774, -2.272897, -3.619644, 0.2117647, 1, 0, 1,
-0.4913467, -1.422146, -2.368819, 0.2078431, 1, 0, 1,
-0.4905183, 0.2223598, -1.916354, 0.2, 1, 0, 1,
-0.489838, 0.6567086, -0.3480175, 0.1921569, 1, 0, 1,
-0.4890636, -0.6355, -3.521036, 0.1882353, 1, 0, 1,
-0.488604, -1.535097, -2.634583, 0.1803922, 1, 0, 1,
-0.4872566, -0.585093, -0.01871935, 0.1764706, 1, 0, 1,
-0.4855771, 0.9804137, -1.62336, 0.1686275, 1, 0, 1,
-0.4853634, -0.06767908, -2.63232, 0.1647059, 1, 0, 1,
-0.4833334, 0.6546074, -1.916355, 0.1568628, 1, 0, 1,
-0.4829352, 0.8057466, -1.641629, 0.1529412, 1, 0, 1,
-0.4825242, 0.3751893, 0.03094055, 0.145098, 1, 0, 1,
-0.480676, -1.875917, -4.047064, 0.1411765, 1, 0, 1,
-0.4780487, -1.073003, -2.244226, 0.1333333, 1, 0, 1,
-0.47763, -1.321944, -2.609309, 0.1294118, 1, 0, 1,
-0.4734335, 0.3243506, -0.821676, 0.1215686, 1, 0, 1,
-0.4732052, 0.8626909, 1.292302, 0.1176471, 1, 0, 1,
-0.4640516, 0.4272541, -0.9555449, 0.1098039, 1, 0, 1,
-0.4619679, -0.6133271, -3.310293, 0.1058824, 1, 0, 1,
-0.4595067, 1.023012, -2.075858, 0.09803922, 1, 0, 1,
-0.4567178, 1.21613, 0.2352106, 0.09019608, 1, 0, 1,
-0.4563759, 0.2195396, -0.573775, 0.08627451, 1, 0, 1,
-0.4537446, -0.5635934, -2.757373, 0.07843138, 1, 0, 1,
-0.4467579, 0.5022678, 1.160608, 0.07450981, 1, 0, 1,
-0.4394079, 0.8149294, 0.4388905, 0.06666667, 1, 0, 1,
-0.4392992, -0.1993489, -2.553002, 0.0627451, 1, 0, 1,
-0.43864, 0.4638707, 1.211374, 0.05490196, 1, 0, 1,
-0.4373155, 0.01331364, -4.234759, 0.05098039, 1, 0, 1,
-0.4355313, -0.06923599, -2.420667, 0.04313726, 1, 0, 1,
-0.4334548, 0.3138691, -1.498606, 0.03921569, 1, 0, 1,
-0.4330899, -0.5365013, -1.610305, 0.03137255, 1, 0, 1,
-0.4329779, 0.2017068, -0.9055867, 0.02745098, 1, 0, 1,
-0.429664, 2.028821, 0.2872325, 0.01960784, 1, 0, 1,
-0.4254873, -0.1270831, -2.461456, 0.01568628, 1, 0, 1,
-0.4218234, -1.117718, -2.304804, 0.007843138, 1, 0, 1,
-0.4211654, 0.517162, -1.645855, 0.003921569, 1, 0, 1,
-0.419945, -1.111956, -2.802851, 0, 1, 0.003921569, 1,
-0.419705, -0.6523446, -2.979047, 0, 1, 0.01176471, 1,
-0.4165753, 0.1515768, -1.041904, 0, 1, 0.01568628, 1,
-0.4124898, -0.2959983, -1.483586, 0, 1, 0.02352941, 1,
-0.4112757, -0.2489155, -0.5018089, 0, 1, 0.02745098, 1,
-0.4103371, -2.36749, -3.823734, 0, 1, 0.03529412, 1,
-0.4096261, -0.6844004, -0.4999527, 0, 1, 0.03921569, 1,
-0.4092478, -0.1118705, -3.049999, 0, 1, 0.04705882, 1,
-0.4059201, 0.07106744, -1.491273, 0, 1, 0.05098039, 1,
-0.4039326, -0.5848219, -3.034567, 0, 1, 0.05882353, 1,
-0.402383, -0.06707802, -0.8918964, 0, 1, 0.0627451, 1,
-0.3998232, 1.527216, -1.248662, 0, 1, 0.07058824, 1,
-0.3977138, 0.5290301, 0.2907639, 0, 1, 0.07450981, 1,
-0.3964427, -1.011999, -1.436913, 0, 1, 0.08235294, 1,
-0.3909265, 0.8080109, 0.5738768, 0, 1, 0.08627451, 1,
-0.3900115, -1.295833, -2.722907, 0, 1, 0.09411765, 1,
-0.389267, -0.2172308, -1.245512, 0, 1, 0.1019608, 1,
-0.3879915, 0.5403868, -0.6944692, 0, 1, 0.1058824, 1,
-0.3842361, 0.06289448, -1.149602, 0, 1, 0.1137255, 1,
-0.3841563, -0.153001, -3.717725, 0, 1, 0.1176471, 1,
-0.3743784, -0.4106769, -3.838546, 0, 1, 0.1254902, 1,
-0.3737619, 2.483872, -1.594376, 0, 1, 0.1294118, 1,
-0.3703911, -0.255894, -2.832879, 0, 1, 0.1372549, 1,
-0.3673001, -0.4177427, -3.384731, 0, 1, 0.1411765, 1,
-0.3669838, -0.8086404, -3.76343, 0, 1, 0.1490196, 1,
-0.3661965, -0.1774794, -3.054249, 0, 1, 0.1529412, 1,
-0.3641709, -1.623067, -3.942178, 0, 1, 0.1607843, 1,
-0.3566571, 0.4340132, -1.257063, 0, 1, 0.1647059, 1,
-0.3541794, -0.6497623, -2.882735, 0, 1, 0.172549, 1,
-0.3533212, -0.8902109, -3.604695, 0, 1, 0.1764706, 1,
-0.3505755, 0.8472106, 1.332301, 0, 1, 0.1843137, 1,
-0.3430363, 0.9848563, -1.137009, 0, 1, 0.1882353, 1,
-0.3332638, 1.065684, -0.6998934, 0, 1, 0.1960784, 1,
-0.3324785, 0.9697265, -1.656595, 0, 1, 0.2039216, 1,
-0.3293037, 1.997486, 1.335519, 0, 1, 0.2078431, 1,
-0.3270034, 1.345261, -0.965958, 0, 1, 0.2156863, 1,
-0.3223499, -0.5377153, -4.22847, 0, 1, 0.2196078, 1,
-0.3187628, 1.147897, -0.3302855, 0, 1, 0.227451, 1,
-0.3176292, -0.07285386, -0.9473063, 0, 1, 0.2313726, 1,
-0.3138374, 0.8582916, -0.1173972, 0, 1, 0.2392157, 1,
-0.3133672, -0.03475279, -1.495522, 0, 1, 0.2431373, 1,
-0.3116646, 0.8627777, -2.037234, 0, 1, 0.2509804, 1,
-0.310035, -0.3676562, -2.415052, 0, 1, 0.254902, 1,
-0.3090889, 1.453912, -0.1802299, 0, 1, 0.2627451, 1,
-0.3087823, -0.3791526, -1.207135, 0, 1, 0.2666667, 1,
-0.3087441, 0.6263901, -2.000437, 0, 1, 0.2745098, 1,
-0.308383, 0.550976, -1.097822, 0, 1, 0.2784314, 1,
-0.3010256, 2.637319, -0.2450792, 0, 1, 0.2862745, 1,
-0.3001471, -1.399261, -1.815349, 0, 1, 0.2901961, 1,
-0.2962816, -0.436241, -3.624041, 0, 1, 0.2980392, 1,
-0.2922296, -0.3756922, -1.402983, 0, 1, 0.3058824, 1,
-0.289217, -0.3381471, -2.912862, 0, 1, 0.3098039, 1,
-0.2883323, 0.5308601, -1.189482, 0, 1, 0.3176471, 1,
-0.2842501, 0.5240556, -1.71446, 0, 1, 0.3215686, 1,
-0.2831217, 0.3640637, -1.382555, 0, 1, 0.3294118, 1,
-0.2830247, -0.824536, -1.717641, 0, 1, 0.3333333, 1,
-0.2798914, -0.5300691, -2.222794, 0, 1, 0.3411765, 1,
-0.2784779, -0.8998119, -3.562828, 0, 1, 0.345098, 1,
-0.2781557, 1.934773, -0.4750655, 0, 1, 0.3529412, 1,
-0.2780082, 0.3201476, 0.4176771, 0, 1, 0.3568628, 1,
-0.2772398, -0.4851854, -4.942807, 0, 1, 0.3647059, 1,
-0.2765855, 0.2556728, -1.123467, 0, 1, 0.3686275, 1,
-0.2709962, -0.8342631, -4.040124, 0, 1, 0.3764706, 1,
-0.2709127, 0.4345094, -0.3991389, 0, 1, 0.3803922, 1,
-0.2705146, -0.1061898, -1.185851, 0, 1, 0.3882353, 1,
-0.2695014, 0.3975141, -0.1757808, 0, 1, 0.3921569, 1,
-0.2673872, -0.0369801, -2.841156, 0, 1, 0.4, 1,
-0.2651644, -1.231962, -1.543941, 0, 1, 0.4078431, 1,
-0.2557552, 0.9675778, -2.245456, 0, 1, 0.4117647, 1,
-0.2540058, 2.199748, -0.3943346, 0, 1, 0.4196078, 1,
-0.2526869, -0.6098351, -1.784088, 0, 1, 0.4235294, 1,
-0.249475, -0.9277909, -2.322066, 0, 1, 0.4313726, 1,
-0.244077, -0.267111, -3.525212, 0, 1, 0.4352941, 1,
-0.2439813, 0.05927349, -1.433844, 0, 1, 0.4431373, 1,
-0.2438645, 0.8903773, -0.8049446, 0, 1, 0.4470588, 1,
-0.2398727, 0.9468407, 0.955649, 0, 1, 0.454902, 1,
-0.2367018, -0.346691, -2.526852, 0, 1, 0.4588235, 1,
-0.2255597, -0.502961, -1.770766, 0, 1, 0.4666667, 1,
-0.2239389, 2.87387, -0.5041654, 0, 1, 0.4705882, 1,
-0.2235589, 1.833659, -0.7867866, 0, 1, 0.4784314, 1,
-0.2154712, -1.777431, -3.068168, 0, 1, 0.4823529, 1,
-0.2130094, -0.1734157, -2.779254, 0, 1, 0.4901961, 1,
-0.2089257, 0.733492, -0.5018756, 0, 1, 0.4941176, 1,
-0.2086754, -0.2844065, -2.853399, 0, 1, 0.5019608, 1,
-0.2079619, 0.9577342, -0.5362722, 0, 1, 0.509804, 1,
-0.2046194, -1.328192, -3.688586, 0, 1, 0.5137255, 1,
-0.2039919, 0.4330359, 0.5465441, 0, 1, 0.5215687, 1,
-0.2019833, 0.7648317, -3.515186, 0, 1, 0.5254902, 1,
-0.2003701, 2.711426, -0.3067387, 0, 1, 0.5333334, 1,
-0.1977508, -0.1830758, -2.494588, 0, 1, 0.5372549, 1,
-0.197735, 0.6993672, 0.09897932, 0, 1, 0.5450981, 1,
-0.1914414, 0.7995038, 0.0004539206, 0, 1, 0.5490196, 1,
-0.1875201, -0.7988167, -2.328924, 0, 1, 0.5568628, 1,
-0.1825051, -1.013254, -4.029173, 0, 1, 0.5607843, 1,
-0.1824298, -2.120517, -3.928598, 0, 1, 0.5686275, 1,
-0.1809613, -1.196752, -3.843553, 0, 1, 0.572549, 1,
-0.173331, -1.109589, -3.464246, 0, 1, 0.5803922, 1,
-0.1712559, -1.062642, -2.849392, 0, 1, 0.5843138, 1,
-0.166582, -0.169562, -3.41223, 0, 1, 0.5921569, 1,
-0.1613047, 1.300468, -0.5930387, 0, 1, 0.5960785, 1,
-0.1503381, -1.251538, -4.286289, 0, 1, 0.6039216, 1,
-0.1490005, -0.8139651, -3.555261, 0, 1, 0.6117647, 1,
-0.1466743, 1.891155, -1.150308, 0, 1, 0.6156863, 1,
-0.1447546, 1.575612, 0.4605966, 0, 1, 0.6235294, 1,
-0.1435758, -0.6473167, -2.157023, 0, 1, 0.627451, 1,
-0.1435387, 0.09558603, -0.4222345, 0, 1, 0.6352941, 1,
-0.1408483, 0.4151948, -0.2126258, 0, 1, 0.6392157, 1,
-0.1403778, -2.750973, -2.91317, 0, 1, 0.6470588, 1,
-0.1391381, 1.710626, 1.243335, 0, 1, 0.6509804, 1,
-0.1387792, 1.048725, -0.4050955, 0, 1, 0.6588235, 1,
-0.1361711, 0.6084729, 0.4760863, 0, 1, 0.6627451, 1,
-0.1355026, 0.7813212, -0.8826821, 0, 1, 0.6705883, 1,
-0.1347857, -0.6161587, -5.323777, 0, 1, 0.6745098, 1,
-0.1316867, 0.752647, -2.525379, 0, 1, 0.682353, 1,
-0.1277381, 0.324595, -1.73768, 0, 1, 0.6862745, 1,
-0.1276593, 2.330852, -0.6967475, 0, 1, 0.6941177, 1,
-0.1265301, 0.4707439, -0.5277542, 0, 1, 0.7019608, 1,
-0.1252714, 0.118278, -1.870577, 0, 1, 0.7058824, 1,
-0.1251833, 0.4820081, 0.1151323, 0, 1, 0.7137255, 1,
-0.1248394, -1.230101, -2.22124, 0, 1, 0.7176471, 1,
-0.118554, -0.7444538, -0.6734521, 0, 1, 0.7254902, 1,
-0.1184111, 0.5083327, -0.5868977, 0, 1, 0.7294118, 1,
-0.1067752, -0.7136109, -4.32341, 0, 1, 0.7372549, 1,
-0.106338, 1.025426, -0.2543265, 0, 1, 0.7411765, 1,
-0.1041759, -0.1661575, -3.567361, 0, 1, 0.7490196, 1,
-0.1003784, -0.5368579, -1.805379, 0, 1, 0.7529412, 1,
-0.09774178, -0.5522507, -2.091076, 0, 1, 0.7607843, 1,
-0.09722525, 1.749741, -1.133258, 0, 1, 0.7647059, 1,
-0.08867371, -1.666727, -3.831075, 0, 1, 0.772549, 1,
-0.08860252, 1.276329, 0.5510485, 0, 1, 0.7764706, 1,
-0.08345022, 1.165755, -2.075927, 0, 1, 0.7843137, 1,
-0.08282836, 0.5707152, -0.1307921, 0, 1, 0.7882353, 1,
-0.08044031, -0.9414946, -3.916277, 0, 1, 0.7960784, 1,
-0.07816169, 0.9090643, 2.421939, 0, 1, 0.8039216, 1,
-0.07534549, 0.8751358, -0.3177682, 0, 1, 0.8078431, 1,
-0.07110941, -0.6977294, -1.852578, 0, 1, 0.8156863, 1,
-0.06922277, 0.9952809, -2.111272, 0, 1, 0.8196079, 1,
-0.0647644, 1.67863, 1.97411, 0, 1, 0.827451, 1,
-0.06365949, -1.35284, -2.393867, 0, 1, 0.8313726, 1,
-0.06012323, -0.81874, -2.990878, 0, 1, 0.8392157, 1,
-0.05888738, 1.391449, 0.7055513, 0, 1, 0.8431373, 1,
-0.0579039, -0.1343133, -2.853133, 0, 1, 0.8509804, 1,
-0.05745462, -0.7307463, -3.240437, 0, 1, 0.854902, 1,
-0.05170536, 1.081915, 1.104419, 0, 1, 0.8627451, 1,
-0.0489994, 0.01699574, -1.381846, 0, 1, 0.8666667, 1,
-0.04880407, -0.06495694, -1.920277, 0, 1, 0.8745098, 1,
-0.04786267, 0.5903959, -0.7438008, 0, 1, 0.8784314, 1,
-0.0423302, 0.798703, -0.4260752, 0, 1, 0.8862745, 1,
-0.03992571, 0.1305558, -1.247584, 0, 1, 0.8901961, 1,
-0.03868275, 0.8056989, 0.7154586, 0, 1, 0.8980392, 1,
-0.03685203, -0.3365782, -2.051659, 0, 1, 0.9058824, 1,
-0.03465398, -1.228056, -3.598761, 0, 1, 0.9098039, 1,
-0.03337267, 2.153646, -1.368798, 0, 1, 0.9176471, 1,
-0.03267129, 1.172098, 1.198331, 0, 1, 0.9215686, 1,
-0.0314233, 1.428016, 1.09909, 0, 1, 0.9294118, 1,
-0.03062773, 1.574679, 0.1721199, 0, 1, 0.9333333, 1,
-0.02579281, -1.641021, -3.128011, 0, 1, 0.9411765, 1,
-0.02537882, -1.057195, -3.40731, 0, 1, 0.945098, 1,
-0.02453114, 0.194902, 0.0009594132, 0, 1, 0.9529412, 1,
-0.02409827, 0.5281078, -2.169204, 0, 1, 0.9568627, 1,
-0.02273827, 0.7643733, -1.196697, 0, 1, 0.9647059, 1,
-0.01858625, 0.1449001, -0.5227612, 0, 1, 0.9686275, 1,
-0.01272676, 0.5028963, 0.50735, 0, 1, 0.9764706, 1,
-0.01094532, 1.00794, -1.751345, 0, 1, 0.9803922, 1,
-0.01071794, 1.650057, 0.3445207, 0, 1, 0.9882353, 1,
-0.008922554, -0.2366142, -2.951238, 0, 1, 0.9921569, 1,
-0.008627805, -1.167721, -2.95334, 0, 1, 1, 1,
-0.007633842, 0.8655102, -0.1386734, 0, 0.9921569, 1, 1,
-0.00596403, -0.3519549, -1.38027, 0, 0.9882353, 1, 1,
-0.004412037, -0.1462321, -4.799669, 0, 0.9803922, 1, 1,
0.0002310989, -1.26219, 5.142731, 0, 0.9764706, 1, 1,
0.0007046011, 0.2958797, -0.5878577, 0, 0.9686275, 1, 1,
0.01217328, -0.8956581, 2.196039, 0, 0.9647059, 1, 1,
0.01515882, -0.07306495, 2.897812, 0, 0.9568627, 1, 1,
0.01721396, -1.092702, 3.199681, 0, 0.9529412, 1, 1,
0.01767665, 0.3610581, 2.015297, 0, 0.945098, 1, 1,
0.02016842, 1.264128, 0.3403366, 0, 0.9411765, 1, 1,
0.02303925, -0.4206487, 3.087413, 0, 0.9333333, 1, 1,
0.02352745, 2.391896, -0.7227993, 0, 0.9294118, 1, 1,
0.03260659, -0.6359826, 2.246337, 0, 0.9215686, 1, 1,
0.03694693, 1.454218, 0.8037888, 0, 0.9176471, 1, 1,
0.04187635, -0.677108, 2.959007, 0, 0.9098039, 1, 1,
0.04969545, -0.9279383, 2.496795, 0, 0.9058824, 1, 1,
0.05408461, 0.2593127, 2.102169, 0, 0.8980392, 1, 1,
0.05726677, -2.177738, 4.493665, 0, 0.8901961, 1, 1,
0.0578064, -0.3334384, 2.232957, 0, 0.8862745, 1, 1,
0.05991151, -1.247087, 4.167611, 0, 0.8784314, 1, 1,
0.06063801, 1.506814, -1.520372, 0, 0.8745098, 1, 1,
0.06123965, 0.9705909, -0.1222656, 0, 0.8666667, 1, 1,
0.06731673, 0.9885715, -0.5046991, 0, 0.8627451, 1, 1,
0.07115319, 0.03893785, 2.086433, 0, 0.854902, 1, 1,
0.07572278, -0.2742457, 2.705026, 0, 0.8509804, 1, 1,
0.07574182, 1.559627, 0.008650729, 0, 0.8431373, 1, 1,
0.07743356, 1.295682, -1.714551, 0, 0.8392157, 1, 1,
0.07857613, -2.149272, 4.133942, 0, 0.8313726, 1, 1,
0.07876932, -0.7024845, 2.798687, 0, 0.827451, 1, 1,
0.08045156, 0.860246, 0.5503205, 0, 0.8196079, 1, 1,
0.08117063, 1.860373, 0.996707, 0, 0.8156863, 1, 1,
0.08702592, -0.1028958, 1.745826, 0, 0.8078431, 1, 1,
0.08726106, 0.2843565, 0.8585824, 0, 0.8039216, 1, 1,
0.08877715, -0.0518306, 2.989994, 0, 0.7960784, 1, 1,
0.08908767, 0.1905502, -0.5729981, 0, 0.7882353, 1, 1,
0.09117441, -1.320224, 3.87324, 0, 0.7843137, 1, 1,
0.09197354, 1.218103, 0.1816031, 0, 0.7764706, 1, 1,
0.09464079, -0.04221108, 1.77809, 0, 0.772549, 1, 1,
0.1081277, -1.424902, 3.617378, 0, 0.7647059, 1, 1,
0.1125346, 0.494384, -0.9329934, 0, 0.7607843, 1, 1,
0.1130133, 0.140903, -0.03326811, 0, 0.7529412, 1, 1,
0.1136097, 1.164652, -1.128533, 0, 0.7490196, 1, 1,
0.1152178, -0.2688051, 1.613088, 0, 0.7411765, 1, 1,
0.1193614, -0.6633992, 2.016936, 0, 0.7372549, 1, 1,
0.1220249, -0.03839348, 2.577888, 0, 0.7294118, 1, 1,
0.1247557, 0.07951789, 1.67514, 0, 0.7254902, 1, 1,
0.1268297, 2.294062, -0.7841648, 0, 0.7176471, 1, 1,
0.1355863, 0.4357889, 1.409487, 0, 0.7137255, 1, 1,
0.1385459, -0.5202706, 3.926404, 0, 0.7058824, 1, 1,
0.1406738, 1.067775, 0.0483958, 0, 0.6980392, 1, 1,
0.1409426, -0.3389461, 2.732602, 0, 0.6941177, 1, 1,
0.1422999, 1.087663, 1.611071, 0, 0.6862745, 1, 1,
0.1433222, 0.2169082, 0.8410253, 0, 0.682353, 1, 1,
0.1434322, -0.002671959, 0.5998771, 0, 0.6745098, 1, 1,
0.1440705, 0.4508966, 2.636198, 0, 0.6705883, 1, 1,
0.1470323, -1.671087, 3.115709, 0, 0.6627451, 1, 1,
0.1501411, 1.053187, -0.6744899, 0, 0.6588235, 1, 1,
0.1502673, -1.242233, 2.512012, 0, 0.6509804, 1, 1,
0.1527251, 0.7448208, -0.3408606, 0, 0.6470588, 1, 1,
0.1545317, -1.069902, 1.494381, 0, 0.6392157, 1, 1,
0.1618197, -0.7932642, 3.033767, 0, 0.6352941, 1, 1,
0.1625516, 0.8325009, -1.793906, 0, 0.627451, 1, 1,
0.16536, 1.634724, -0.2213547, 0, 0.6235294, 1, 1,
0.1674737, 0.5392976, 2.036835, 0, 0.6156863, 1, 1,
0.1731348, 0.5339252, 0.1671521, 0, 0.6117647, 1, 1,
0.1754607, 1.385175, -0.2448894, 0, 0.6039216, 1, 1,
0.1772195, 0.2860015, 1.7667, 0, 0.5960785, 1, 1,
0.1834377, 1.003984, 0.9106629, 0, 0.5921569, 1, 1,
0.1856496, 0.09052952, -0.7734291, 0, 0.5843138, 1, 1,
0.1865999, 0.7013122, 0.7249599, 0, 0.5803922, 1, 1,
0.190805, 2.183011, 0.8332465, 0, 0.572549, 1, 1,
0.1910083, -2.084258, 2.796509, 0, 0.5686275, 1, 1,
0.1948423, -1.489009, 3.016723, 0, 0.5607843, 1, 1,
0.1994342, 1.488121, -0.5688174, 0, 0.5568628, 1, 1,
0.1997569, -1.958896, 2.453846, 0, 0.5490196, 1, 1,
0.203104, -0.1363725, 1.952786, 0, 0.5450981, 1, 1,
0.2033531, 0.1010433, 0.6547235, 0, 0.5372549, 1, 1,
0.2039082, -0.08233441, 3.628156, 0, 0.5333334, 1, 1,
0.2140621, -0.9300928, 3.825398, 0, 0.5254902, 1, 1,
0.2195172, -1.266895, 2.798871, 0, 0.5215687, 1, 1,
0.22279, -1.191125, 3.278231, 0, 0.5137255, 1, 1,
0.2308897, -0.2740777, 2.105987, 0, 0.509804, 1, 1,
0.2314211, -0.940037, 3.419397, 0, 0.5019608, 1, 1,
0.2352378, -0.5235702, 2.001013, 0, 0.4941176, 1, 1,
0.2366492, 0.1941173, 2.403414, 0, 0.4901961, 1, 1,
0.2484643, -1.296933, 3.832256, 0, 0.4823529, 1, 1,
0.2497169, -0.9750003, 2.564219, 0, 0.4784314, 1, 1,
0.2505208, -0.3331556, 3.071263, 0, 0.4705882, 1, 1,
0.2506519, 1.117851, -0.01072304, 0, 0.4666667, 1, 1,
0.2531711, -1.967715, 2.688752, 0, 0.4588235, 1, 1,
0.2545653, 1.42233, 2.144043, 0, 0.454902, 1, 1,
0.2567376, -0.955403, 2.617859, 0, 0.4470588, 1, 1,
0.2586493, 0.0160287, 2.446965, 0, 0.4431373, 1, 1,
0.2602172, 1.761549, 1.944244, 0, 0.4352941, 1, 1,
0.2661438, 0.4397455, 1.045554, 0, 0.4313726, 1, 1,
0.2680096, 0.1710033, 1.536124, 0, 0.4235294, 1, 1,
0.2749395, 0.9221305, 1.924473, 0, 0.4196078, 1, 1,
0.2756071, 0.4263659, 0.09952255, 0, 0.4117647, 1, 1,
0.2770672, 1.350496, 0.5095362, 0, 0.4078431, 1, 1,
0.278666, 0.6384334, -0.4821216, 0, 0.4, 1, 1,
0.2813649, 0.4505289, 0.8707557, 0, 0.3921569, 1, 1,
0.2820092, 0.8142537, -0.5110102, 0, 0.3882353, 1, 1,
0.2838064, -0.9484655, 2.932657, 0, 0.3803922, 1, 1,
0.2892598, -0.2520252, 4.336717, 0, 0.3764706, 1, 1,
0.2985431, -0.3958663, 2.346891, 0, 0.3686275, 1, 1,
0.3001967, -0.3115204, 2.278092, 0, 0.3647059, 1, 1,
0.3009707, 0.2617703, 0.8676864, 0, 0.3568628, 1, 1,
0.3016546, 0.3616761, 0.9032367, 0, 0.3529412, 1, 1,
0.3034759, 0.9706099, 0.1873863, 0, 0.345098, 1, 1,
0.3079182, 0.221764, 0.07306063, 0, 0.3411765, 1, 1,
0.3089468, 0.09279308, 0.8755722, 0, 0.3333333, 1, 1,
0.3097579, 0.7811477, 0.0777523, 0, 0.3294118, 1, 1,
0.3107527, 0.456846, 0.5590001, 0, 0.3215686, 1, 1,
0.3154173, 2.559829, -0.6315354, 0, 0.3176471, 1, 1,
0.3154759, -1.224209, 1.654552, 0, 0.3098039, 1, 1,
0.3190696, 0.2115385, 1.243828, 0, 0.3058824, 1, 1,
0.3193332, -0.1338147, 0.8468258, 0, 0.2980392, 1, 1,
0.321355, 0.4803793, 1.747935, 0, 0.2901961, 1, 1,
0.3277094, 0.07891362, 1.641142, 0, 0.2862745, 1, 1,
0.3330779, 0.4897199, 1.044179, 0, 0.2784314, 1, 1,
0.3365758, -0.3020537, 1.7329, 0, 0.2745098, 1, 1,
0.3366429, 0.6307775, 2.211462, 0, 0.2666667, 1, 1,
0.3513801, -0.03780387, 3.060743, 0, 0.2627451, 1, 1,
0.3532513, 0.4815448, 0.1756614, 0, 0.254902, 1, 1,
0.3573798, -1.444428, 4.651006, 0, 0.2509804, 1, 1,
0.3580665, 0.146473, 1.31111, 0, 0.2431373, 1, 1,
0.3591757, 0.3039791, 1.665336, 0, 0.2392157, 1, 1,
0.3613782, 0.7923334, 0.8010814, 0, 0.2313726, 1, 1,
0.3642652, -1.703645, 0.9360558, 0, 0.227451, 1, 1,
0.365092, 0.010873, 4.828609, 0, 0.2196078, 1, 1,
0.369483, 1.641789, -0.5279126, 0, 0.2156863, 1, 1,
0.3719473, 0.4721516, 0.1148103, 0, 0.2078431, 1, 1,
0.3720866, -0.6879099, 1.538224, 0, 0.2039216, 1, 1,
0.3723243, -0.01331542, 2.017524, 0, 0.1960784, 1, 1,
0.377788, 0.7297184, 0.484642, 0, 0.1882353, 1, 1,
0.3806839, -0.5164284, 3.456056, 0, 0.1843137, 1, 1,
0.381574, -0.5959907, 3.199059, 0, 0.1764706, 1, 1,
0.3823728, -1.635506, 2.699651, 0, 0.172549, 1, 1,
0.3890035, 0.1944952, 0.9006078, 0, 0.1647059, 1, 1,
0.3901164, -0.474142, 0.8337963, 0, 0.1607843, 1, 1,
0.3914849, 0.9255536, -0.3527802, 0, 0.1529412, 1, 1,
0.3949957, 1.280985, 0.6553162, 0, 0.1490196, 1, 1,
0.3995715, 0.1208038, 1.548312, 0, 0.1411765, 1, 1,
0.4070219, 1.088805, -0.7100189, 0, 0.1372549, 1, 1,
0.4071425, -0.6130001, 3.249845, 0, 0.1294118, 1, 1,
0.4098862, -0.05381758, 1.575326, 0, 0.1254902, 1, 1,
0.4122003, 0.7489741, -0.0489151, 0, 0.1176471, 1, 1,
0.4149562, 0.5206477, 1.340388, 0, 0.1137255, 1, 1,
0.4186094, 1.460042, -0.7310042, 0, 0.1058824, 1, 1,
0.4193349, 3.171577, 0.5430292, 0, 0.09803922, 1, 1,
0.4205235, 0.06349804, 1.222629, 0, 0.09411765, 1, 1,
0.421178, 0.2879029, 0.334031, 0, 0.08627451, 1, 1,
0.4235884, 0.8868745, 1.702949, 0, 0.08235294, 1, 1,
0.4306445, -0.824251, 2.596767, 0, 0.07450981, 1, 1,
0.4350766, -0.4833699, 4.016541, 0, 0.07058824, 1, 1,
0.4367839, 0.7726558, 1.057884, 0, 0.0627451, 1, 1,
0.4383188, -0.5328732, 4.229026, 0, 0.05882353, 1, 1,
0.4434933, -2.91595, 2.609914, 0, 0.05098039, 1, 1,
0.4445491, 1.367275, -1.069832, 0, 0.04705882, 1, 1,
0.4470901, 1.363168, 1.169181, 0, 0.03921569, 1, 1,
0.4481117, 0.1417412, 1.980046, 0, 0.03529412, 1, 1,
0.4484607, 1.041961, 2.319701, 0, 0.02745098, 1, 1,
0.4612707, -3.003736, 3.918261, 0, 0.02352941, 1, 1,
0.4619049, 0.00725353, 2.042799, 0, 0.01568628, 1, 1,
0.4665037, 1.382156, 0.7268693, 0, 0.01176471, 1, 1,
0.4667476, 2.122955, -0.9068133, 0, 0.003921569, 1, 1,
0.4687622, -0.3524853, 0.6247677, 0.003921569, 0, 1, 1,
0.4693719, 0.4210795, 1.469489, 0.007843138, 0, 1, 1,
0.4712805, 2.001247, -0.4694754, 0.01568628, 0, 1, 1,
0.4757373, 0.849943, 1.272253, 0.01960784, 0, 1, 1,
0.4759528, 0.6344028, 1.230406, 0.02745098, 0, 1, 1,
0.4765205, 0.4544459, -0.2745382, 0.03137255, 0, 1, 1,
0.4786358, -1.590614, 1.245096, 0.03921569, 0, 1, 1,
0.4815752, 1.641956, 0.9400585, 0.04313726, 0, 1, 1,
0.4843306, 2.843844, 0.8530481, 0.05098039, 0, 1, 1,
0.4873586, -0.5786936, 3.245675, 0.05490196, 0, 1, 1,
0.4895444, -0.5100457, 3.069713, 0.0627451, 0, 1, 1,
0.4954451, 0.3695487, 0.4184753, 0.06666667, 0, 1, 1,
0.4983574, -1.131197, 2.21259, 0.07450981, 0, 1, 1,
0.5018669, -1.5883, 1.458407, 0.07843138, 0, 1, 1,
0.5025373, -0.2859618, 2.620101, 0.08627451, 0, 1, 1,
0.5049087, 0.5151692, 0.7311243, 0.09019608, 0, 1, 1,
0.5090745, -2.130374, 4.333275, 0.09803922, 0, 1, 1,
0.5108106, -0.3830521, 3.439105, 0.1058824, 0, 1, 1,
0.5152247, -0.7348427, 1.542195, 0.1098039, 0, 1, 1,
0.5197023, -0.5600705, 3.5141, 0.1176471, 0, 1, 1,
0.53364, 0.3216393, 1.283576, 0.1215686, 0, 1, 1,
0.5363191, -0.4196612, 3.706722, 0.1294118, 0, 1, 1,
0.5371699, 0.9739717, -1.238894, 0.1333333, 0, 1, 1,
0.5424832, -1.197367, 2.909448, 0.1411765, 0, 1, 1,
0.5451161, -1.063887, 3.10203, 0.145098, 0, 1, 1,
0.5484614, 0.04461313, -0.07032323, 0.1529412, 0, 1, 1,
0.5533525, -1.091863, 3.629597, 0.1568628, 0, 1, 1,
0.5560441, -0.9362488, 4.313336, 0.1647059, 0, 1, 1,
0.5614793, 0.7616038, 1.803903, 0.1686275, 0, 1, 1,
0.564441, -1.163762, 4.738896, 0.1764706, 0, 1, 1,
0.5645199, 1.317468, 1.538052, 0.1803922, 0, 1, 1,
0.5739771, 1.327483, -0.07116024, 0.1882353, 0, 1, 1,
0.5762347, -1.438638, 2.452233, 0.1921569, 0, 1, 1,
0.5829337, 1.563508, 0.5101808, 0.2, 0, 1, 1,
0.591233, 0.2075795, 3.256593, 0.2078431, 0, 1, 1,
0.5922303, -1.085622, 2.786695, 0.2117647, 0, 1, 1,
0.5930966, 0.2352564, 2.950861, 0.2196078, 0, 1, 1,
0.5957271, 1.114619, -1.552301, 0.2235294, 0, 1, 1,
0.5969407, 0.1500131, 2.670306, 0.2313726, 0, 1, 1,
0.6035285, 0.4264419, 1.893484, 0.2352941, 0, 1, 1,
0.6062977, 1.025833, 0.7291854, 0.2431373, 0, 1, 1,
0.608047, 1.331645, 1.492218, 0.2470588, 0, 1, 1,
0.6086674, -0.1817038, -0.8591487, 0.254902, 0, 1, 1,
0.6105277, 0.4645315, 1.58267, 0.2588235, 0, 1, 1,
0.61352, 0.7092525, 0.3169631, 0.2666667, 0, 1, 1,
0.6196853, 0.03842733, 2.756942, 0.2705882, 0, 1, 1,
0.6250216, 1.171943, -0.3251768, 0.2784314, 0, 1, 1,
0.6253632, -0.7769466, 2.316915, 0.282353, 0, 1, 1,
0.6256807, 0.3374175, -0.3733675, 0.2901961, 0, 1, 1,
0.6270145, -0.04816264, 2.503938, 0.2941177, 0, 1, 1,
0.6291279, 0.261155, -1.109985, 0.3019608, 0, 1, 1,
0.6301589, 0.09736089, 1.807945, 0.3098039, 0, 1, 1,
0.6325941, 0.1037031, 1.225206, 0.3137255, 0, 1, 1,
0.6325989, -0.776421, 2.43769, 0.3215686, 0, 1, 1,
0.6326342, -0.4251584, 2.253495, 0.3254902, 0, 1, 1,
0.6329396, 0.2573018, 0.9129738, 0.3333333, 0, 1, 1,
0.6337003, 0.1386807, 1.888332, 0.3372549, 0, 1, 1,
0.6344336, 0.1121661, 1.628203, 0.345098, 0, 1, 1,
0.6382625, -1.684091, 2.286537, 0.3490196, 0, 1, 1,
0.6443994, 0.7522648, -1.145045, 0.3568628, 0, 1, 1,
0.6451588, 0.1519761, 1.985045, 0.3607843, 0, 1, 1,
0.6464496, 0.3767605, 0.8521109, 0.3686275, 0, 1, 1,
0.6491029, -0.1152059, 3.252439, 0.372549, 0, 1, 1,
0.662305, 0.8682298, -0.08263645, 0.3803922, 0, 1, 1,
0.6646875, 0.7804102, -0.6996253, 0.3843137, 0, 1, 1,
0.6665246, -0.6827694, 2.009475, 0.3921569, 0, 1, 1,
0.6728046, -0.05304302, -0.8999446, 0.3960784, 0, 1, 1,
0.6736578, 0.229859, 1.425807, 0.4039216, 0, 1, 1,
0.6790106, 0.1874169, 0.2007958, 0.4117647, 0, 1, 1,
0.6797246, 0.1655439, 1.460217, 0.4156863, 0, 1, 1,
0.6829579, -1.349374, 2.79826, 0.4235294, 0, 1, 1,
0.6866131, -0.4719163, 1.876674, 0.427451, 0, 1, 1,
0.6874254, -0.7666589, 3.679956, 0.4352941, 0, 1, 1,
0.6890548, -0.01038958, 3.530766, 0.4392157, 0, 1, 1,
0.690956, 0.2341388, 2.553942, 0.4470588, 0, 1, 1,
0.6949056, 1.346896, -0.5166421, 0.4509804, 0, 1, 1,
0.6970157, 0.3250748, -0.1533322, 0.4588235, 0, 1, 1,
0.7092865, -0.4043495, -0.04046026, 0.4627451, 0, 1, 1,
0.7095317, -1.738199, 2.496321, 0.4705882, 0, 1, 1,
0.7121902, -0.1470354, 3.256228, 0.4745098, 0, 1, 1,
0.7178567, -3.494979, 2.948584, 0.4823529, 0, 1, 1,
0.7213061, 0.1790648, 0.9801223, 0.4862745, 0, 1, 1,
0.7219216, 1.363294, -1.177968, 0.4941176, 0, 1, 1,
0.7246701, 1.304421, -0.04661099, 0.5019608, 0, 1, 1,
0.7250021, 0.03214024, 3.708106, 0.5058824, 0, 1, 1,
0.7260668, 0.7478689, 1.795316, 0.5137255, 0, 1, 1,
0.7263049, 0.07363592, 1.183095, 0.5176471, 0, 1, 1,
0.7271723, -0.01936578, 1.289926, 0.5254902, 0, 1, 1,
0.7282959, -0.6300688, 1.368381, 0.5294118, 0, 1, 1,
0.7324055, -0.3663479, 2.116528, 0.5372549, 0, 1, 1,
0.7337072, 2.231594, 0.4163867, 0.5411765, 0, 1, 1,
0.7363356, -0.3687333, 1.215208, 0.5490196, 0, 1, 1,
0.7394535, -1.069637, 3.408575, 0.5529412, 0, 1, 1,
0.7480811, 1.315022, -0.6393985, 0.5607843, 0, 1, 1,
0.7547811, 0.6728504, 0.7760736, 0.5647059, 0, 1, 1,
0.7552082, 1.080976, -0.2383432, 0.572549, 0, 1, 1,
0.7571474, -1.260783, 1.361355, 0.5764706, 0, 1, 1,
0.7672341, -0.3984469, 3.945845, 0.5843138, 0, 1, 1,
0.7719538, -1.524052, 1.902283, 0.5882353, 0, 1, 1,
0.7746173, -0.2266115, 1.92003, 0.5960785, 0, 1, 1,
0.7814653, 0.7902864, -1.016863, 0.6039216, 0, 1, 1,
0.7817711, -0.1761165, 0.4714512, 0.6078432, 0, 1, 1,
0.7915215, -0.8405638, 2.061327, 0.6156863, 0, 1, 1,
0.7926185, -0.8943892, 1.769947, 0.6196079, 0, 1, 1,
0.7928519, -1.271321, 1.245009, 0.627451, 0, 1, 1,
0.792968, -0.02626568, 1.221145, 0.6313726, 0, 1, 1,
0.7950404, 0.5745905, 0.3604093, 0.6392157, 0, 1, 1,
0.796719, -1.320163, 2.45613, 0.6431373, 0, 1, 1,
0.8048159, -1.239673, 1.791603, 0.6509804, 0, 1, 1,
0.8078235, 1.109154, -0.2635067, 0.654902, 0, 1, 1,
0.8104899, 1.438475, 0.8306248, 0.6627451, 0, 1, 1,
0.8148396, 0.5170023, 0.1225963, 0.6666667, 0, 1, 1,
0.8185525, 0.6067169, 0.8651525, 0.6745098, 0, 1, 1,
0.8200888, 0.2788862, -0.7993746, 0.6784314, 0, 1, 1,
0.8224987, -0.3071407, 0.9160674, 0.6862745, 0, 1, 1,
0.8284352, 1.802575, 0.1143909, 0.6901961, 0, 1, 1,
0.8398889, 1.962218, -0.6200429, 0.6980392, 0, 1, 1,
0.8404654, -1.046759, 2.970831, 0.7058824, 0, 1, 1,
0.8424269, 0.1174688, -0.7105847, 0.7098039, 0, 1, 1,
0.8468471, -0.6807376, 2.846341, 0.7176471, 0, 1, 1,
0.8468663, 0.4428636, 0.8880762, 0.7215686, 0, 1, 1,
0.8471251, -0.02151111, 2.133414, 0.7294118, 0, 1, 1,
0.8494734, 0.1335192, 1.213654, 0.7333333, 0, 1, 1,
0.8513813, 0.2870781, 0.7715126, 0.7411765, 0, 1, 1,
0.8570578, -0.9742078, 2.499354, 0.7450981, 0, 1, 1,
0.8577294, -1.563742, 4.278118, 0.7529412, 0, 1, 1,
0.8596954, -0.3322774, 3.077114, 0.7568628, 0, 1, 1,
0.8604541, -0.5832888, 1.719072, 0.7647059, 0, 1, 1,
0.8680241, 0.01221724, 1.831862, 0.7686275, 0, 1, 1,
0.8708217, 0.684462, 0.9624435, 0.7764706, 0, 1, 1,
0.8708282, 0.03805473, 2.369754, 0.7803922, 0, 1, 1,
0.8722097, 1.134383, 1.922292, 0.7882353, 0, 1, 1,
0.8747242, -0.2755004, 1.819285, 0.7921569, 0, 1, 1,
0.8748254, -0.6148037, 1.97872, 0.8, 0, 1, 1,
0.8748844, -0.6306449, 2.628252, 0.8078431, 0, 1, 1,
0.8762112, 1.979413, 0.6901633, 0.8117647, 0, 1, 1,
0.879106, -1.088689, 3.041275, 0.8196079, 0, 1, 1,
0.8823082, 1.866444, 0.4954895, 0.8235294, 0, 1, 1,
0.8835503, -1.039025, 2.254697, 0.8313726, 0, 1, 1,
0.8862479, -0.6868951, 1.153395, 0.8352941, 0, 1, 1,
0.8936399, -1.281175, 2.049148, 0.8431373, 0, 1, 1,
0.8973303, -0.6472543, 2.497613, 0.8470588, 0, 1, 1,
0.8989231, 0.2647397, -1.017512, 0.854902, 0, 1, 1,
0.9041343, 0.838327, 1.297575, 0.8588235, 0, 1, 1,
0.9043482, 1.703527, 0.1411163, 0.8666667, 0, 1, 1,
0.9174204, 0.9108776, 2.563886, 0.8705882, 0, 1, 1,
0.9175987, 0.5745102, 0.8179732, 0.8784314, 0, 1, 1,
0.9179187, 1.143397, 2.646717, 0.8823529, 0, 1, 1,
0.9184574, 1.010673, 0.7620844, 0.8901961, 0, 1, 1,
0.9249828, -1.052065, 1.47889, 0.8941177, 0, 1, 1,
0.9274744, 0.5031251, 2.272112, 0.9019608, 0, 1, 1,
0.932846, 0.1862475, 1.712578, 0.9098039, 0, 1, 1,
0.9354822, 0.7477746, 1.627196, 0.9137255, 0, 1, 1,
0.9449527, 0.2888142, 0.8574536, 0.9215686, 0, 1, 1,
0.9528031, 0.2956335, -0.3234251, 0.9254902, 0, 1, 1,
0.9581843, -1.567291, 4.058435, 0.9333333, 0, 1, 1,
0.9703597, 1.347566, -1.532838, 0.9372549, 0, 1, 1,
0.9708953, 1.882741, 1.205321, 0.945098, 0, 1, 1,
0.9752041, -3.189316, 3.226655, 0.9490196, 0, 1, 1,
0.9800274, -1.43084, 3.04739, 0.9568627, 0, 1, 1,
0.9896514, 0.04997598, 2.012883, 0.9607843, 0, 1, 1,
0.9983922, 0.7870294, 2.043876, 0.9686275, 0, 1, 1,
1.000395, 0.4325599, 1.370677, 0.972549, 0, 1, 1,
1.001253, 0.2903911, 1.472933, 0.9803922, 0, 1, 1,
1.002224, -0.1207681, 1.701286, 0.9843137, 0, 1, 1,
1.002834, -1.54404, 3.758096, 0.9921569, 0, 1, 1,
1.003046, -1.383018, 2.51053, 0.9960784, 0, 1, 1,
1.012668, 0.1869671, 0.513951, 1, 0, 0.9960784, 1,
1.014027, 0.8613205, -0.8184248, 1, 0, 0.9882353, 1,
1.01428, 0.04781044, 1.661451, 1, 0, 0.9843137, 1,
1.023336, 2.073823, 0.8935087, 1, 0, 0.9764706, 1,
1.026646, 1.343318, -0.7734839, 1, 0, 0.972549, 1,
1.028473, -0.9265662, 2.190261, 1, 0, 0.9647059, 1,
1.029853, 1.009839, 0.8880522, 1, 0, 0.9607843, 1,
1.030594, 0.3211954, 2.125497, 1, 0, 0.9529412, 1,
1.030943, 0.9989405, 0.9929324, 1, 0, 0.9490196, 1,
1.031911, -0.8148433, 2.592155, 1, 0, 0.9411765, 1,
1.041556, 1.233876, -0.1470668, 1, 0, 0.9372549, 1,
1.044003, 0.1700199, 1.635304, 1, 0, 0.9294118, 1,
1.047703, -1.394675, 2.149579, 1, 0, 0.9254902, 1,
1.048732, 1.074149, 0.5553803, 1, 0, 0.9176471, 1,
1.056809, -2.363558, 1.062499, 1, 0, 0.9137255, 1,
1.057445, 1.042994, 0.7710468, 1, 0, 0.9058824, 1,
1.060695, 0.7159672, -0.4992063, 1, 0, 0.9019608, 1,
1.074684, 0.05508408, 2.080119, 1, 0, 0.8941177, 1,
1.07904, 0.4025227, 1.953345, 1, 0, 0.8862745, 1,
1.080095, -2.838367, 2.907759, 1, 0, 0.8823529, 1,
1.087061, 0.05805919, 1.493418, 1, 0, 0.8745098, 1,
1.088676, -0.4573703, 2.094075, 1, 0, 0.8705882, 1,
1.091664, 0.3144841, -0.07992973, 1, 0, 0.8627451, 1,
1.101807, -0.01994872, 1.081184, 1, 0, 0.8588235, 1,
1.103306, -0.8661795, 1.357195, 1, 0, 0.8509804, 1,
1.104166, -0.906712, 2.563514, 1, 0, 0.8470588, 1,
1.105624, -0.6932075, 1.814719, 1, 0, 0.8392157, 1,
1.10638, -0.1473131, 2.530638, 1, 0, 0.8352941, 1,
1.123343, -1.377494, 2.353268, 1, 0, 0.827451, 1,
1.131278, 1.449681, 1.544416, 1, 0, 0.8235294, 1,
1.13495, -0.8198808, 2.837438, 1, 0, 0.8156863, 1,
1.135277, -1.112236, 2.312368, 1, 0, 0.8117647, 1,
1.140201, 2.245567, -0.7373755, 1, 0, 0.8039216, 1,
1.14229, 1.149126, 1.058415, 1, 0, 0.7960784, 1,
1.143029, 0.5290936, 1.016158, 1, 0, 0.7921569, 1,
1.145056, 0.1861993, -0.1168162, 1, 0, 0.7843137, 1,
1.148259, 0.006833112, 0.1865144, 1, 0, 0.7803922, 1,
1.152385, -0.05150223, 1.968951, 1, 0, 0.772549, 1,
1.154928, -0.5864907, 2.361164, 1, 0, 0.7686275, 1,
1.156217, -1.641948, 3.434063, 1, 0, 0.7607843, 1,
1.162894, 0.3135805, 0.09843572, 1, 0, 0.7568628, 1,
1.168932, -0.2190029, 2.319808, 1, 0, 0.7490196, 1,
1.173162, 1.188254, 0.7749739, 1, 0, 0.7450981, 1,
1.179631, -0.6845946, 2.455527, 1, 0, 0.7372549, 1,
1.1804, 0.9792742, 2.079091, 1, 0, 0.7333333, 1,
1.182723, 0.1377315, 2.668335, 1, 0, 0.7254902, 1,
1.18289, -1.070066, 2.939311, 1, 0, 0.7215686, 1,
1.185425, 1.022807, -0.7710089, 1, 0, 0.7137255, 1,
1.185504, 0.2530236, 0.4747189, 1, 0, 0.7098039, 1,
1.189015, 0.9914078, -0.7374797, 1, 0, 0.7019608, 1,
1.191034, 2.564978, -0.7369944, 1, 0, 0.6941177, 1,
1.19503, 0.09331689, 1.432482, 1, 0, 0.6901961, 1,
1.195164, -0.8115084, 0.9542062, 1, 0, 0.682353, 1,
1.198162, 0.2003222, 1.204593, 1, 0, 0.6784314, 1,
1.203152, 0.7792069, 1.182203, 1, 0, 0.6705883, 1,
1.203622, 0.07129721, 1.699424, 1, 0, 0.6666667, 1,
1.222004, -0.2312501, 0.435834, 1, 0, 0.6588235, 1,
1.222299, -1.110557, 1.454168, 1, 0, 0.654902, 1,
1.224944, -0.2943042, 1.236091, 1, 0, 0.6470588, 1,
1.228335, -1.21765, 0.8764492, 1, 0, 0.6431373, 1,
1.244809, -0.8406359, 2.065546, 1, 0, 0.6352941, 1,
1.252945, 0.3876412, 0.1844634, 1, 0, 0.6313726, 1,
1.2562, 0.6178094, -0.2462848, 1, 0, 0.6235294, 1,
1.257945, -0.9472352, 3.004204, 1, 0, 0.6196079, 1,
1.287613, 0.07929493, 1.930743, 1, 0, 0.6117647, 1,
1.288297, 1.229508, 1.057868, 1, 0, 0.6078432, 1,
1.291791, -0.6592426, 2.274097, 1, 0, 0.6, 1,
1.294469, -0.5344156, 2.52373, 1, 0, 0.5921569, 1,
1.296871, 0.01738972, 3.664714, 1, 0, 0.5882353, 1,
1.310256, -0.3299421, 1.591995, 1, 0, 0.5803922, 1,
1.320429, 2.24647, 1.924583, 1, 0, 0.5764706, 1,
1.320629, -0.7691886, 3.390503, 1, 0, 0.5686275, 1,
1.322544, 0.4850149, 0.5174366, 1, 0, 0.5647059, 1,
1.354815, 1.063806, -0.1935792, 1, 0, 0.5568628, 1,
1.355245, -1.120633, 2.912832, 1, 0, 0.5529412, 1,
1.357787, 0.6141672, 2.135225, 1, 0, 0.5450981, 1,
1.35796, -0.5850863, 3.067775, 1, 0, 0.5411765, 1,
1.359536, 0.1990555, -0.5725288, 1, 0, 0.5333334, 1,
1.366423, -0.1641923, 1.370298, 1, 0, 0.5294118, 1,
1.368214, -0.6200194, 0.8651777, 1, 0, 0.5215687, 1,
1.376177, 1.629645, 1.089576, 1, 0, 0.5176471, 1,
1.382409, 0.5594413, 0.6036118, 1, 0, 0.509804, 1,
1.383016, 0.1412372, 1.539693, 1, 0, 0.5058824, 1,
1.386265, 1.283881, 0.9641364, 1, 0, 0.4980392, 1,
1.392718, -0.3965078, 3.179128, 1, 0, 0.4901961, 1,
1.394761, 0.3723669, 1.299737, 1, 0, 0.4862745, 1,
1.4045, -1.290896, -0.2320731, 1, 0, 0.4784314, 1,
1.409861, -0.1295576, 2.247376, 1, 0, 0.4745098, 1,
1.418808, -1.003001, 2.625195, 1, 0, 0.4666667, 1,
1.419445, 0.7223325, 2.06027, 1, 0, 0.4627451, 1,
1.422784, -0.6408839, 0.8928274, 1, 0, 0.454902, 1,
1.43022, 1.899477, 1.916686, 1, 0, 0.4509804, 1,
1.431598, -0.04984122, 0.6972996, 1, 0, 0.4431373, 1,
1.438159, 0.6316246, -0.6200919, 1, 0, 0.4392157, 1,
1.438178, -0.359063, 3.259008, 1, 0, 0.4313726, 1,
1.438808, 1.815267, 0.7383802, 1, 0, 0.427451, 1,
1.444408, 0.2180126, 2.509093, 1, 0, 0.4196078, 1,
1.448397, -0.4340687, 1.112309, 1, 0, 0.4156863, 1,
1.460423, 1.756876, -0.408611, 1, 0, 0.4078431, 1,
1.468348, 0.1231554, 1.483263, 1, 0, 0.4039216, 1,
1.475306, -0.489627, 3.396682, 1, 0, 0.3960784, 1,
1.479181, -1.011235, 2.177982, 1, 0, 0.3882353, 1,
1.488689, 2.080392, 0.7173066, 1, 0, 0.3843137, 1,
1.49533, -0.8883162, 3.490561, 1, 0, 0.3764706, 1,
1.501669, 0.6320806, 1.576001, 1, 0, 0.372549, 1,
1.516725, 0.3948414, 0.3691269, 1, 0, 0.3647059, 1,
1.521539, -0.9214509, 1.776473, 1, 0, 0.3607843, 1,
1.529988, -0.2177328, 1.222147, 1, 0, 0.3529412, 1,
1.538564, -1.612687, 2.806886, 1, 0, 0.3490196, 1,
1.54094, -0.1349261, 2.249463, 1, 0, 0.3411765, 1,
1.550942, -1.449541, 2.126483, 1, 0, 0.3372549, 1,
1.557538, 0.2538298, 2.120134, 1, 0, 0.3294118, 1,
1.581544, -2.720927, 3.260888, 1, 0, 0.3254902, 1,
1.620754, 0.8778211, 1.389985, 1, 0, 0.3176471, 1,
1.648986, 0.8039122, 1.157084, 1, 0, 0.3137255, 1,
1.649891, 1.914417, -0.4988625, 1, 0, 0.3058824, 1,
1.65493, -0.4734765, 1.221751, 1, 0, 0.2980392, 1,
1.682183, 1.442688, 0.4908491, 1, 0, 0.2941177, 1,
1.687253, -0.0170765, 1.741522, 1, 0, 0.2862745, 1,
1.696594, -0.9974985, 3.722236, 1, 0, 0.282353, 1,
1.699624, -0.473698, 3.643161, 1, 0, 0.2745098, 1,
1.716705, -0.5633718, 2.701929, 1, 0, 0.2705882, 1,
1.722795, 0.475212, 1.477273, 1, 0, 0.2627451, 1,
1.775804, 0.08813518, 1.648927, 1, 0, 0.2588235, 1,
1.77675, -0.002311347, 1.293038, 1, 0, 0.2509804, 1,
1.80189, -0.3673159, 1.783885, 1, 0, 0.2470588, 1,
1.836527, -0.7969701, 1.547829, 1, 0, 0.2392157, 1,
1.847801, 0.2145467, 1.57834, 1, 0, 0.2352941, 1,
1.853356, 0.9375916, 1.626445, 1, 0, 0.227451, 1,
1.86062, -0.8280103, 0.8913996, 1, 0, 0.2235294, 1,
1.863036, -1.578599, 1.114083, 1, 0, 0.2156863, 1,
1.884656, -0.8076583, 1.44002, 1, 0, 0.2117647, 1,
1.895448, -0.1283558, 0.3015169, 1, 0, 0.2039216, 1,
1.895637, -1.323871, 2.141022, 1, 0, 0.1960784, 1,
1.909232, -0.5766518, 2.958181, 1, 0, 0.1921569, 1,
1.933555, 0.9576585, 1.881613, 1, 0, 0.1843137, 1,
1.93659, 0.6725848, 0.4091002, 1, 0, 0.1803922, 1,
1.961302, -0.6542445, 2.462038, 1, 0, 0.172549, 1,
1.995506, -1.175654, 2.605139, 1, 0, 0.1686275, 1,
2.012987, 0.01676304, 0.08144917, 1, 0, 0.1607843, 1,
2.038483, -0.2629046, 1.282495, 1, 0, 0.1568628, 1,
2.03894, -2.159655, 1.904467, 1, 0, 0.1490196, 1,
2.06059, 0.552406, -0.099695, 1, 0, 0.145098, 1,
2.089667, 0.9203973, 0.9485725, 1, 0, 0.1372549, 1,
2.092792, -2.591625, 2.933771, 1, 0, 0.1333333, 1,
2.113574, 0.005473773, 1.915302, 1, 0, 0.1254902, 1,
2.151641, 0.04308381, 4.01298, 1, 0, 0.1215686, 1,
2.186826, 0.4181308, 2.35005, 1, 0, 0.1137255, 1,
2.251967, -0.569839, 2.522683, 1, 0, 0.1098039, 1,
2.252277, -0.412174, 2.764313, 1, 0, 0.1019608, 1,
2.276371, -0.5956619, 0.4134864, 1, 0, 0.09411765, 1,
2.29268, 0.3113404, 1.833984, 1, 0, 0.09019608, 1,
2.300674, 1.190069, 0.7110861, 1, 0, 0.08235294, 1,
2.358065, 1.956619, 0.2332513, 1, 0, 0.07843138, 1,
2.359585, 0.3215185, 1.59164, 1, 0, 0.07058824, 1,
2.374465, -0.9729507, 0.4780865, 1, 0, 0.06666667, 1,
2.594426, -0.5485967, 1.996085, 1, 0, 0.05882353, 1,
2.634733, 1.010418, 0.7688822, 1, 0, 0.05490196, 1,
2.743162, 1.712668, 1.014841, 1, 0, 0.04705882, 1,
2.758904, 0.3374476, 1.918965, 1, 0, 0.04313726, 1,
2.848932, -0.5458655, 2.732711, 1, 0, 0.03529412, 1,
2.953042, 0.8609788, 1.963361, 1, 0, 0.03137255, 1,
2.965822, -0.8284932, 2.193654, 1, 0, 0.02352941, 1,
3.004037, 0.4903378, 0.6884589, 1, 0, 0.01960784, 1,
3.353521, 1.301985, -0.2888059, 1, 0, 0.01176471, 1,
3.440604, 0.4635349, 0.4190742, 1, 0, 0.007843138, 1
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
0.1922508, -4.624961, -7.09785, 0, -0.5, 0.5, 0.5,
0.1922508, -4.624961, -7.09785, 1, -0.5, 0.5, 0.5,
0.1922508, -4.624961, -7.09785, 1, 1.5, 0.5, 0.5,
0.1922508, -4.624961, -7.09785, 0, 1.5, 0.5, 0.5
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
-4.157294, -0.1617011, -7.09785, 0, -0.5, 0.5, 0.5,
-4.157294, -0.1617011, -7.09785, 1, -0.5, 0.5, 0.5,
-4.157294, -0.1617011, -7.09785, 1, 1.5, 0.5, 0.5,
-4.157294, -0.1617011, -7.09785, 0, 1.5, 0.5, 0.5
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
-4.157294, -4.624961, -0.09052277, 0, -0.5, 0.5, 0.5,
-4.157294, -4.624961, -0.09052277, 1, -0.5, 0.5, 0.5,
-4.157294, -4.624961, -0.09052277, 1, 1.5, 0.5, 0.5,
-4.157294, -4.624961, -0.09052277, 0, 1.5, 0.5, 0.5
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
-3, -3.594978, -5.480774,
3, -3.594978, -5.480774,
-3, -3.594978, -5.480774,
-3, -3.766642, -5.750287,
-2, -3.594978, -5.480774,
-2, -3.766642, -5.750287,
-1, -3.594978, -5.480774,
-1, -3.766642, -5.750287,
0, -3.594978, -5.480774,
0, -3.766642, -5.750287,
1, -3.594978, -5.480774,
1, -3.766642, -5.750287,
2, -3.594978, -5.480774,
2, -3.766642, -5.750287,
3, -3.594978, -5.480774,
3, -3.766642, -5.750287
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
-3, -4.109969, -6.289312, 0, -0.5, 0.5, 0.5,
-3, -4.109969, -6.289312, 1, -0.5, 0.5, 0.5,
-3, -4.109969, -6.289312, 1, 1.5, 0.5, 0.5,
-3, -4.109969, -6.289312, 0, 1.5, 0.5, 0.5,
-2, -4.109969, -6.289312, 0, -0.5, 0.5, 0.5,
-2, -4.109969, -6.289312, 1, -0.5, 0.5, 0.5,
-2, -4.109969, -6.289312, 1, 1.5, 0.5, 0.5,
-2, -4.109969, -6.289312, 0, 1.5, 0.5, 0.5,
-1, -4.109969, -6.289312, 0, -0.5, 0.5, 0.5,
-1, -4.109969, -6.289312, 1, -0.5, 0.5, 0.5,
-1, -4.109969, -6.289312, 1, 1.5, 0.5, 0.5,
-1, -4.109969, -6.289312, 0, 1.5, 0.5, 0.5,
0, -4.109969, -6.289312, 0, -0.5, 0.5, 0.5,
0, -4.109969, -6.289312, 1, -0.5, 0.5, 0.5,
0, -4.109969, -6.289312, 1, 1.5, 0.5, 0.5,
0, -4.109969, -6.289312, 0, 1.5, 0.5, 0.5,
1, -4.109969, -6.289312, 0, -0.5, 0.5, 0.5,
1, -4.109969, -6.289312, 1, -0.5, 0.5, 0.5,
1, -4.109969, -6.289312, 1, 1.5, 0.5, 0.5,
1, -4.109969, -6.289312, 0, 1.5, 0.5, 0.5,
2, -4.109969, -6.289312, 0, -0.5, 0.5, 0.5,
2, -4.109969, -6.289312, 1, -0.5, 0.5, 0.5,
2, -4.109969, -6.289312, 1, 1.5, 0.5, 0.5,
2, -4.109969, -6.289312, 0, 1.5, 0.5, 0.5,
3, -4.109969, -6.289312, 0, -0.5, 0.5, 0.5,
3, -4.109969, -6.289312, 1, -0.5, 0.5, 0.5,
3, -4.109969, -6.289312, 1, 1.5, 0.5, 0.5,
3, -4.109969, -6.289312, 0, 1.5, 0.5, 0.5
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
-3.153553, -3, -5.480774,
-3.153553, 3, -5.480774,
-3.153553, -3, -5.480774,
-3.320843, -3, -5.750287,
-3.153553, -2, -5.480774,
-3.320843, -2, -5.750287,
-3.153553, -1, -5.480774,
-3.320843, -1, -5.750287,
-3.153553, 0, -5.480774,
-3.320843, 0, -5.750287,
-3.153553, 1, -5.480774,
-3.320843, 1, -5.750287,
-3.153553, 2, -5.480774,
-3.320843, 2, -5.750287,
-3.153553, 3, -5.480774,
-3.320843, 3, -5.750287
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
-3.655423, -3, -6.289312, 0, -0.5, 0.5, 0.5,
-3.655423, -3, -6.289312, 1, -0.5, 0.5, 0.5,
-3.655423, -3, -6.289312, 1, 1.5, 0.5, 0.5,
-3.655423, -3, -6.289312, 0, 1.5, 0.5, 0.5,
-3.655423, -2, -6.289312, 0, -0.5, 0.5, 0.5,
-3.655423, -2, -6.289312, 1, -0.5, 0.5, 0.5,
-3.655423, -2, -6.289312, 1, 1.5, 0.5, 0.5,
-3.655423, -2, -6.289312, 0, 1.5, 0.5, 0.5,
-3.655423, -1, -6.289312, 0, -0.5, 0.5, 0.5,
-3.655423, -1, -6.289312, 1, -0.5, 0.5, 0.5,
-3.655423, -1, -6.289312, 1, 1.5, 0.5, 0.5,
-3.655423, -1, -6.289312, 0, 1.5, 0.5, 0.5,
-3.655423, 0, -6.289312, 0, -0.5, 0.5, 0.5,
-3.655423, 0, -6.289312, 1, -0.5, 0.5, 0.5,
-3.655423, 0, -6.289312, 1, 1.5, 0.5, 0.5,
-3.655423, 0, -6.289312, 0, 1.5, 0.5, 0.5,
-3.655423, 1, -6.289312, 0, -0.5, 0.5, 0.5,
-3.655423, 1, -6.289312, 1, -0.5, 0.5, 0.5,
-3.655423, 1, -6.289312, 1, 1.5, 0.5, 0.5,
-3.655423, 1, -6.289312, 0, 1.5, 0.5, 0.5,
-3.655423, 2, -6.289312, 0, -0.5, 0.5, 0.5,
-3.655423, 2, -6.289312, 1, -0.5, 0.5, 0.5,
-3.655423, 2, -6.289312, 1, 1.5, 0.5, 0.5,
-3.655423, 2, -6.289312, 0, 1.5, 0.5, 0.5,
-3.655423, 3, -6.289312, 0, -0.5, 0.5, 0.5,
-3.655423, 3, -6.289312, 1, -0.5, 0.5, 0.5,
-3.655423, 3, -6.289312, 1, 1.5, 0.5, 0.5,
-3.655423, 3, -6.289312, 0, 1.5, 0.5, 0.5
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
-3.153553, -3.594978, -4,
-3.153553, -3.594978, 4,
-3.153553, -3.594978, -4,
-3.320843, -3.766642, -4,
-3.153553, -3.594978, -2,
-3.320843, -3.766642, -2,
-3.153553, -3.594978, 0,
-3.320843, -3.766642, 0,
-3.153553, -3.594978, 2,
-3.320843, -3.766642, 2,
-3.153553, -3.594978, 4,
-3.320843, -3.766642, 4
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
-3.655423, -4.109969, -4, 0, -0.5, 0.5, 0.5,
-3.655423, -4.109969, -4, 1, -0.5, 0.5, 0.5,
-3.655423, -4.109969, -4, 1, 1.5, 0.5, 0.5,
-3.655423, -4.109969, -4, 0, 1.5, 0.5, 0.5,
-3.655423, -4.109969, -2, 0, -0.5, 0.5, 0.5,
-3.655423, -4.109969, -2, 1, -0.5, 0.5, 0.5,
-3.655423, -4.109969, -2, 1, 1.5, 0.5, 0.5,
-3.655423, -4.109969, -2, 0, 1.5, 0.5, 0.5,
-3.655423, -4.109969, 0, 0, -0.5, 0.5, 0.5,
-3.655423, -4.109969, 0, 1, -0.5, 0.5, 0.5,
-3.655423, -4.109969, 0, 1, 1.5, 0.5, 0.5,
-3.655423, -4.109969, 0, 0, 1.5, 0.5, 0.5,
-3.655423, -4.109969, 2, 0, -0.5, 0.5, 0.5,
-3.655423, -4.109969, 2, 1, -0.5, 0.5, 0.5,
-3.655423, -4.109969, 2, 1, 1.5, 0.5, 0.5,
-3.655423, -4.109969, 2, 0, 1.5, 0.5, 0.5,
-3.655423, -4.109969, 4, 0, -0.5, 0.5, 0.5,
-3.655423, -4.109969, 4, 1, -0.5, 0.5, 0.5,
-3.655423, -4.109969, 4, 1, 1.5, 0.5, 0.5,
-3.655423, -4.109969, 4, 0, 1.5, 0.5, 0.5
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
-3.153553, -3.594978, -5.480774,
-3.153553, 3.271575, -5.480774,
-3.153553, -3.594978, 5.299729,
-3.153553, 3.271575, 5.299729,
-3.153553, -3.594978, -5.480774,
-3.153553, -3.594978, 5.299729,
-3.153553, 3.271575, -5.480774,
-3.153553, 3.271575, 5.299729,
-3.153553, -3.594978, -5.480774,
3.538054, -3.594978, -5.480774,
-3.153553, -3.594978, 5.299729,
3.538054, -3.594978, 5.299729,
-3.153553, 3.271575, -5.480774,
3.538054, 3.271575, -5.480774,
-3.153553, 3.271575, 5.299729,
3.538054, 3.271575, 5.299729,
3.538054, -3.594978, -5.480774,
3.538054, 3.271575, -5.480774,
3.538054, -3.594978, 5.299729,
3.538054, 3.271575, 5.299729,
3.538054, -3.594978, -5.480774,
3.538054, -3.594978, 5.299729,
3.538054, 3.271575, -5.480774,
3.538054, 3.271575, 5.299729
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
var radius = 7.703887;
var distance = 34.27546;
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
mvMatrix.translate( -0.1922508, 0.1617011, 0.09052277 );
mvMatrix.scale( 1.244782, 1.213068, 0.7726535 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.27546);
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
flucycloxuron<-read.table("flucycloxuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-flucycloxuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'flucycloxuron' not found
```

```r
y<-flucycloxuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'flucycloxuron' not found
```

```r
z<-flucycloxuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'flucycloxuron' not found
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
-3.056102, 0.8305857, -0.6344576, 0, 0, 1, 1, 1,
-2.939385, 1.174959, 0.3528553, 1, 0, 0, 1, 1,
-2.794978, -0.5183912, -1.549485, 1, 0, 0, 1, 1,
-2.782284, 0.5323233, 1.477964, 1, 0, 0, 1, 1,
-2.771546, 0.264584, -2.514074, 1, 0, 0, 1, 1,
-2.672987, -0.01701557, -2.1107, 1, 0, 0, 1, 1,
-2.633471, -0.691592, -1.64512, 0, 0, 0, 1, 1,
-2.574365, -1.110947, -0.2753353, 0, 0, 0, 1, 1,
-2.552568, 0.1974224, -0.8038111, 0, 0, 0, 1, 1,
-2.549305, 0.4111176, 0.01642473, 0, 0, 0, 1, 1,
-2.392638, 2.095497, -2.604382, 0, 0, 0, 1, 1,
-2.376866, 0.4944907, -3.34778, 0, 0, 0, 1, 1,
-2.370437, 1.266962, -2.731292, 0, 0, 0, 1, 1,
-2.326294, 0.5144127, -0.3295088, 1, 1, 1, 1, 1,
-2.315428, 0.3556623, -1.546699, 1, 1, 1, 1, 1,
-2.293353, 0.5897807, -0.2462537, 1, 1, 1, 1, 1,
-2.235614, -0.9901053, -1.901421, 1, 1, 1, 1, 1,
-2.108914, -1.267681, -2.116498, 1, 1, 1, 1, 1,
-2.102995, -0.480707, -2.252514, 1, 1, 1, 1, 1,
-2.097805, -1.496534, -1.590533, 1, 1, 1, 1, 1,
-2.092944, 0.0472143, -1.616174, 1, 1, 1, 1, 1,
-2.078737, 0.7876213, -0.07655761, 1, 1, 1, 1, 1,
-2.024289, -0.4456536, -1.743126, 1, 1, 1, 1, 1,
-1.990452, -0.6163536, -1.629566, 1, 1, 1, 1, 1,
-1.981826, 0.3682004, -1.339294, 1, 1, 1, 1, 1,
-1.95924, 1.120417, 1.665018, 1, 1, 1, 1, 1,
-1.957748, 0.009790127, -2.138052, 1, 1, 1, 1, 1,
-1.956074, 1.114032, -0.8522928, 1, 1, 1, 1, 1,
-1.944585, -0.2831954, -2.884956, 0, 0, 1, 1, 1,
-1.9167, -0.2382365, -3.128215, 1, 0, 0, 1, 1,
-1.909553, -0.0350955, 0.1827123, 1, 0, 0, 1, 1,
-1.874598, 0.5686203, -2.006229, 1, 0, 0, 1, 1,
-1.872554, -1.195431, -3.697203, 1, 0, 0, 1, 1,
-1.86902, -1.122509, -3.021027, 1, 0, 0, 1, 1,
-1.848177, 0.9048444, -0.3776816, 0, 0, 0, 1, 1,
-1.838449, 0.8167022, -1.981083, 0, 0, 0, 1, 1,
-1.833833, -0.5930578, -1.651636, 0, 0, 0, 1, 1,
-1.833078, -1.78172, -2.714142, 0, 0, 0, 1, 1,
-1.82121, -0.1021117, -3.239549e-05, 0, 0, 0, 1, 1,
-1.8158, -1.178403, -1.092403, 0, 0, 0, 1, 1,
-1.799414, 2.293797, -0.914446, 0, 0, 0, 1, 1,
-1.780845, -0.1895649, -1.337604, 1, 1, 1, 1, 1,
-1.780529, 0.77902, -0.5202302, 1, 1, 1, 1, 1,
-1.773864, 0.4329271, -0.9304014, 1, 1, 1, 1, 1,
-1.771516, 0.09065017, -1.853836, 1, 1, 1, 1, 1,
-1.759045, -0.1826039, -2.021058, 1, 1, 1, 1, 1,
-1.75698, -0.1481785, -0.825609, 1, 1, 1, 1, 1,
-1.750212, 1.538506, -1.414663, 1, 1, 1, 1, 1,
-1.741645, -0.2028908, -2.390305, 1, 1, 1, 1, 1,
-1.679247, -2.137991, -1.519655, 1, 1, 1, 1, 1,
-1.67455, -0.34335, -1.001676, 1, 1, 1, 1, 1,
-1.666391, -0.957579, -1.55296, 1, 1, 1, 1, 1,
-1.649696, 0.1104803, -2.023536, 1, 1, 1, 1, 1,
-1.645438, 1.158239, -1.073085, 1, 1, 1, 1, 1,
-1.609304, 0.1221988, -2.039025, 1, 1, 1, 1, 1,
-1.60727, 1.796377, -0.302743, 1, 1, 1, 1, 1,
-1.586177, -0.8204706, -2.8998, 0, 0, 1, 1, 1,
-1.578812, 0.2809907, -2.970639, 1, 0, 0, 1, 1,
-1.554347, 0.6065846, -0.8107732, 1, 0, 0, 1, 1,
-1.548417, -0.400244, -1.575182, 1, 0, 0, 1, 1,
-1.536275, 1.760599, 0.4403907, 1, 0, 0, 1, 1,
-1.533447, -1.398248, -2.085803, 1, 0, 0, 1, 1,
-1.52944, 0.1520704, -1.717487, 0, 0, 0, 1, 1,
-1.528189, -0.7861334, -1.558009, 0, 0, 0, 1, 1,
-1.504713, 0.02051351, -2.065519, 0, 0, 0, 1, 1,
-1.502556, 0.2111898, -1.083238, 0, 0, 0, 1, 1,
-1.497756, 0.7174369, -1.234132, 0, 0, 0, 1, 1,
-1.488718, -0.6058456, -4.926424, 0, 0, 0, 1, 1,
-1.480763, 1.107114, -0.1998523, 0, 0, 0, 1, 1,
-1.476749, -0.4671699, -2.082729, 1, 1, 1, 1, 1,
-1.453955, -1.936694, -1.530794, 1, 1, 1, 1, 1,
-1.447526, 1.220049, 0.2238806, 1, 1, 1, 1, 1,
-1.444574, 0.2848197, -2.54276, 1, 1, 1, 1, 1,
-1.441573, 1.456327, -1.351885, 1, 1, 1, 1, 1,
-1.437491, -1.721731, -3.737388, 1, 1, 1, 1, 1,
-1.433653, 0.0344035, -1.814115, 1, 1, 1, 1, 1,
-1.426823, -0.02015164, -1.422216, 1, 1, 1, 1, 1,
-1.42274, -0.01296917, -1.48484, 1, 1, 1, 1, 1,
-1.410772, 0.2691387, -2.159965, 1, 1, 1, 1, 1,
-1.408041, -1.013858, -2.795825, 1, 1, 1, 1, 1,
-1.399011, -0.9106148, -1.445416, 1, 1, 1, 1, 1,
-1.398815, 2.245594, -0.0615386, 1, 1, 1, 1, 1,
-1.392531, 0.6855255, 0.9210004, 1, 1, 1, 1, 1,
-1.387249, 1.192861, -1.784648, 1, 1, 1, 1, 1,
-1.383645, -0.5137848, -2.517654, 0, 0, 1, 1, 1,
-1.364582, -0.7544231, -1.709665, 1, 0, 0, 1, 1,
-1.35997, -1.74652, -1.851275, 1, 0, 0, 1, 1,
-1.353548, -1.21432, -0.8390254, 1, 0, 0, 1, 1,
-1.350407, -0.1091272, -1.710085, 1, 0, 0, 1, 1,
-1.341905, 1.055413, -2.04641, 1, 0, 0, 1, 1,
-1.338669, 0.3490653, 0.005597016, 0, 0, 0, 1, 1,
-1.319262, -0.03194094, -2.631777, 0, 0, 0, 1, 1,
-1.316798, 0.2170636, -0.4965642, 0, 0, 0, 1, 1,
-1.312801, -0.07255504, -1.774612, 0, 0, 0, 1, 1,
-1.310492, -0.9817384, -3.640902, 0, 0, 0, 1, 1,
-1.308738, 1.249251, -0.8171653, 0, 0, 0, 1, 1,
-1.297747, -1.179753, -0.5379313, 0, 0, 0, 1, 1,
-1.29092, 1.207585, -1.220011, 1, 1, 1, 1, 1,
-1.274991, -0.6187335, -2.583808, 1, 1, 1, 1, 1,
-1.274492, -2.342265, -2.383455, 1, 1, 1, 1, 1,
-1.265966, -1.553972, -2.530893, 1, 1, 1, 1, 1,
-1.265806, 0.1629486, -0.7425967, 1, 1, 1, 1, 1,
-1.265527, 0.1929785, 0.1365725, 1, 1, 1, 1, 1,
-1.243695, 0.3855035, -0.2059988, 1, 1, 1, 1, 1,
-1.233249, 0.704548, -0.08630335, 1, 1, 1, 1, 1,
-1.224732, -0.2152346, -2.252423, 1, 1, 1, 1, 1,
-1.224463, -1.031754, -2.456844, 1, 1, 1, 1, 1,
-1.223786, 0.2649089, -1.347319, 1, 1, 1, 1, 1,
-1.22333, 1.283502, 1.123394, 1, 1, 1, 1, 1,
-1.222146, -0.2810645, -1.219531, 1, 1, 1, 1, 1,
-1.218695, -0.2777452, -3.835519, 1, 1, 1, 1, 1,
-1.216753, 0.4614024, -1.547976, 1, 1, 1, 1, 1,
-1.211334, -0.4487801, -2.758846, 0, 0, 1, 1, 1,
-1.210538, 0.2800382, -1.705244, 1, 0, 0, 1, 1,
-1.207838, 0.5714869, -1.421397, 1, 0, 0, 1, 1,
-1.206928, 1.040558, -1.234364, 1, 0, 0, 1, 1,
-1.200282, -1.175709, -1.043136, 1, 0, 0, 1, 1,
-1.198834, -0.406035, -1.877521, 1, 0, 0, 1, 1,
-1.198066, 0.381811, -2.324042, 0, 0, 0, 1, 1,
-1.190583, 0.4972304, -1.765243, 0, 0, 0, 1, 1,
-1.189489, 2.662088, -1.396304, 0, 0, 0, 1, 1,
-1.179345, 1.05914, -0.8209575, 0, 0, 0, 1, 1,
-1.175521, 0.5530637, 0.7138514, 0, 0, 0, 1, 1,
-1.163152, 0.2956383, -1.12733, 0, 0, 0, 1, 1,
-1.157156, -0.7266412, -3.429594, 0, 0, 0, 1, 1,
-1.155074, -0.01552236, -1.595727, 1, 1, 1, 1, 1,
-1.154173, -0.01537848, -0.6404482, 1, 1, 1, 1, 1,
-1.153904, -0.3526282, -2.829375, 1, 1, 1, 1, 1,
-1.153034, 0.4964539, -0.3314281, 1, 1, 1, 1, 1,
-1.146334, -0.5187867, -1.894011, 1, 1, 1, 1, 1,
-1.143347, -0.3531264, -1.614401, 1, 1, 1, 1, 1,
-1.143244, -0.2152747, -2.538525, 1, 1, 1, 1, 1,
-1.136326, 0.009548564, -0.7336187, 1, 1, 1, 1, 1,
-1.121901, 1.253458, -1.367813, 1, 1, 1, 1, 1,
-1.1163, 0.1960236, -1.841419, 1, 1, 1, 1, 1,
-1.115638, 0.6996214, -0.9517634, 1, 1, 1, 1, 1,
-1.099629, -0.3139738, -2.321155, 1, 1, 1, 1, 1,
-1.098759, 0.2843172, -0.06845456, 1, 1, 1, 1, 1,
-1.096152, -0.3425887, -2.719599, 1, 1, 1, 1, 1,
-1.082756, -0.185615, -0.6742709, 1, 1, 1, 1, 1,
-1.079273, 0.509828, -0.4503743, 0, 0, 1, 1, 1,
-1.073706, -1.437801, -2.27381, 1, 0, 0, 1, 1,
-1.073545, 0.6159841, -0.2006031, 1, 0, 0, 1, 1,
-1.073076, -1.365618, -2.938946, 1, 0, 0, 1, 1,
-1.071836, -0.7392586, -1.985526, 1, 0, 0, 1, 1,
-1.067878, 0.9804839, -1.389706, 1, 0, 0, 1, 1,
-1.066349, 1.159806, -1.035012, 0, 0, 0, 1, 1,
-1.058243, -0.326151, -0.9250972, 0, 0, 0, 1, 1,
-1.048165, 1.040866, -1.366405, 0, 0, 0, 1, 1,
-1.044888, -0.6009833, -3.199017, 0, 0, 0, 1, 1,
-1.039961, -0.9293365, -3.198613, 0, 0, 0, 1, 1,
-1.039619, -1.484885, -2.910716, 0, 0, 0, 1, 1,
-1.037865, -1.166207, -1.135751, 0, 0, 0, 1, 1,
-1.02985, 0.8866208, -2.80569, 1, 1, 1, 1, 1,
-1.028215, 1.313395, -1.960855, 1, 1, 1, 1, 1,
-1.016974, 0.5952505, -0.7247371, 1, 1, 1, 1, 1,
-1.016793, 0.7381136, -0.508256, 1, 1, 1, 1, 1,
-1.006742, 2.832385, -0.196891, 1, 1, 1, 1, 1,
-1.002981, -0.861383, -2.200767, 1, 1, 1, 1, 1,
-1.002783, 0.7096739, -0.9612652, 1, 1, 1, 1, 1,
-1.002109, -0.8867946, -2.037077, 1, 1, 1, 1, 1,
-0.9905503, -0.5131081, -3.547636, 1, 1, 1, 1, 1,
-0.9883551, 1.337238, 0.4061107, 1, 1, 1, 1, 1,
-0.9739925, 1.854815, 0.6392789, 1, 1, 1, 1, 1,
-0.9722202, -0.05178174, -0.1280343, 1, 1, 1, 1, 1,
-0.9716099, 0.9597403, -1.382104, 1, 1, 1, 1, 1,
-0.970897, -0.1621397, -3.016931, 1, 1, 1, 1, 1,
-0.9701778, 0.5318618, -0.8292685, 1, 1, 1, 1, 1,
-0.9671016, 0.3112571, -1.637493, 0, 0, 1, 1, 1,
-0.9664847, -1.76318, -1.413646, 1, 0, 0, 1, 1,
-0.9620918, -1.453161, -2.311934, 1, 0, 0, 1, 1,
-0.9620836, -1.173852, -2.277586, 1, 0, 0, 1, 1,
-0.9595608, -0.1248187, -1.635721, 1, 0, 0, 1, 1,
-0.9548615, 0.7425978, -2.079289, 1, 0, 0, 1, 1,
-0.9546475, -0.3201468, -4.229214, 0, 0, 0, 1, 1,
-0.9490227, 0.8652521, 0.3669614, 0, 0, 0, 1, 1,
-0.9327571, 1.65919, 0.799364, 0, 0, 0, 1, 1,
-0.9290688, 0.04849704, -0.4643694, 0, 0, 0, 1, 1,
-0.9272535, -0.08620878, -0.417467, 0, 0, 0, 1, 1,
-0.9206257, 1.238517, -1.854878, 0, 0, 0, 1, 1,
-0.9199198, 0.931504, -1.44172, 0, 0, 0, 1, 1,
-0.9195663, 1.342035, -0.8339436, 1, 1, 1, 1, 1,
-0.9132749, 0.8095405, -1.067855, 1, 1, 1, 1, 1,
-0.9086521, 0.2662273, -2.853348, 1, 1, 1, 1, 1,
-0.9078258, -0.09378722, 0.1113431, 1, 1, 1, 1, 1,
-0.9025624, 0.6883926, -2.249594, 1, 1, 1, 1, 1,
-0.8989731, -0.2782933, -1.458887, 1, 1, 1, 1, 1,
-0.8982575, -1.460715, -2.067445, 1, 1, 1, 1, 1,
-0.8971854, 0.2394997, -1.348311, 1, 1, 1, 1, 1,
-0.8886663, 0.07590831, -2.542278, 1, 1, 1, 1, 1,
-0.8863865, 0.2950146, -1.297454, 1, 1, 1, 1, 1,
-0.8849592, 0.134449, -2.564308, 1, 1, 1, 1, 1,
-0.884591, 0.5298901, -1.651225, 1, 1, 1, 1, 1,
-0.8795493, 0.2481939, -1.170826, 1, 1, 1, 1, 1,
-0.8794287, -1.633568, -4.435831, 1, 1, 1, 1, 1,
-0.8784608, 0.3336209, -1.210392, 1, 1, 1, 1, 1,
-0.8747161, -0.4933118, -2.011347, 0, 0, 1, 1, 1,
-0.8671494, 0.03296374, -1.921667, 1, 0, 0, 1, 1,
-0.8554257, -1.198137, -3.149137, 1, 0, 0, 1, 1,
-0.849876, -0.313991, -0.969875, 1, 0, 0, 1, 1,
-0.8480327, -1.26803, -3.86124, 1, 0, 0, 1, 1,
-0.8477236, -0.7588438, -1.903372, 1, 0, 0, 1, 1,
-0.8468114, 2.289001, -0.8194511, 0, 0, 0, 1, 1,
-0.844946, 0.7023358, -0.01073785, 0, 0, 0, 1, 1,
-0.8408849, -0.5588756, -2.151051, 0, 0, 0, 1, 1,
-0.8373411, 0.6820384, 0.4806113, 0, 0, 0, 1, 1,
-0.8355677, 0.7007751, -2.047124, 0, 0, 0, 1, 1,
-0.8344042, 2.57086, 0.868376, 0, 0, 0, 1, 1,
-0.8322918, 1.365078, -0.06571695, 0, 0, 0, 1, 1,
-0.8315879, -2.138904, -5.010604, 1, 1, 1, 1, 1,
-0.8160391, -1.355167, -3.683, 1, 1, 1, 1, 1,
-0.8112454, 0.3088822, -0.9774507, 1, 1, 1, 1, 1,
-0.8109191, 0.05472912, -2.104844, 1, 1, 1, 1, 1,
-0.8095086, 1.149063, 0.4205374, 1, 1, 1, 1, 1,
-0.7924162, 2.207295, 0.07886078, 1, 1, 1, 1, 1,
-0.7898191, 0.7563086, -0.9596548, 1, 1, 1, 1, 1,
-0.788133, -1.156218, -2.184356, 1, 1, 1, 1, 1,
-0.7838654, -0.7345293, -2.943393, 1, 1, 1, 1, 1,
-0.7837454, -1.60836, -2.847989, 1, 1, 1, 1, 1,
-0.7766425, -1.17145, -1.631759, 1, 1, 1, 1, 1,
-0.7749839, 1.244166, -0.6202474, 1, 1, 1, 1, 1,
-0.7718021, -1.271634, -2.422465, 1, 1, 1, 1, 1,
-0.7710083, 1.028988, -2.067454, 1, 1, 1, 1, 1,
-0.7695369, -0.7427117, -2.306865, 1, 1, 1, 1, 1,
-0.7681946, -0.3237926, -1.125026, 0, 0, 1, 1, 1,
-0.7665753, 0.01299724, -0.403554, 1, 0, 0, 1, 1,
-0.7595279, -1.115742, -3.426455, 1, 0, 0, 1, 1,
-0.7582973, -1.913922, -2.150104, 1, 0, 0, 1, 1,
-0.7496868, 1.927508, 0.3441911, 1, 0, 0, 1, 1,
-0.7458828, -0.8189439, -2.865933, 1, 0, 0, 1, 1,
-0.7444693, -1.270513, -3.024064, 0, 0, 0, 1, 1,
-0.7389597, 0.7004094, 0.003124342, 0, 0, 0, 1, 1,
-0.7350321, -1.117253, -4.463227, 0, 0, 0, 1, 1,
-0.7279766, -0.396008, -0.8817785, 0, 0, 0, 1, 1,
-0.723759, 0.4839628, -1.056448, 0, 0, 0, 1, 1,
-0.7216405, 0.7192054, 0.009922273, 0, 0, 0, 1, 1,
-0.7201325, 2.094847, -0.03523091, 0, 0, 0, 1, 1,
-0.7152571, -0.9339558, -3.37364, 1, 1, 1, 1, 1,
-0.7099143, -1.052455, -2.832535, 1, 1, 1, 1, 1,
-0.7034732, 0.8044618, -1.005221, 1, 1, 1, 1, 1,
-0.7013718, -0.5846599, -4.14499, 1, 1, 1, 1, 1,
-0.701214, 0.3106415, -0.8732169, 1, 1, 1, 1, 1,
-0.6877342, -0.1197552, -2.086642, 1, 1, 1, 1, 1,
-0.6868862, 0.3679257, -0.4109514, 1, 1, 1, 1, 1,
-0.679885, -2.493384, -3.281189, 1, 1, 1, 1, 1,
-0.6687696, 0.9791101, -0.7770919, 1, 1, 1, 1, 1,
-0.6603054, 2.278613, -0.6579093, 1, 1, 1, 1, 1,
-0.6573435, 0.1644608, -1.776324, 1, 1, 1, 1, 1,
-0.655529, -0.2476707, -2.703493, 1, 1, 1, 1, 1,
-0.6551384, 0.258639, -1.30869, 1, 1, 1, 1, 1,
-0.6513726, 0.9216759, 0.384269, 1, 1, 1, 1, 1,
-0.6476895, 0.3881657, -1.965128, 1, 1, 1, 1, 1,
-0.6457279, -1.314476, -2.699117, 0, 0, 1, 1, 1,
-0.6387613, 0.3045207, -2.19222, 1, 0, 0, 1, 1,
-0.6270173, -0.6143783, -0.8516247, 1, 0, 0, 1, 1,
-0.6229168, 0.8216937, 0.3994557, 1, 0, 0, 1, 1,
-0.6223184, 0.1876989, -1.270653, 1, 0, 0, 1, 1,
-0.6202677, -0.4889567, -4.62919, 1, 0, 0, 1, 1,
-0.6194142, 0.02037674, -0.1038622, 0, 0, 0, 1, 1,
-0.6180112, -0.9137057, -4.252337, 0, 0, 0, 1, 1,
-0.6124254, 0.9506447, -0.1814794, 0, 0, 0, 1, 1,
-0.611922, 0.009140541, -2.619441, 0, 0, 0, 1, 1,
-0.6011476, 0.7797794, -0.9165389, 0, 0, 0, 1, 1,
-0.5997106, 0.5324894, -0.07558121, 0, 0, 0, 1, 1,
-0.5970271, -0.6261148, -1.537613, 0, 0, 0, 1, 1,
-0.5870429, 1.451913, 0.3757547, 1, 1, 1, 1, 1,
-0.5835195, 0.5981746, -0.9117531, 1, 1, 1, 1, 1,
-0.5823742, -0.2081345, -1.791589, 1, 1, 1, 1, 1,
-0.5798563, 1.730863, -1.001719, 1, 1, 1, 1, 1,
-0.5790648, -0.5828325, -3.028716, 1, 1, 1, 1, 1,
-0.5783736, -1.026161, -2.708807, 1, 1, 1, 1, 1,
-0.5695624, 0.1241764, -0.8712271, 1, 1, 1, 1, 1,
-0.5659518, 0.761087, 0.3908072, 1, 1, 1, 1, 1,
-0.5658253, 1.350545, 0.3892935, 1, 1, 1, 1, 1,
-0.565361, -0.1405055, -2.201166, 1, 1, 1, 1, 1,
-0.5637397, 0.2696916, -0.3727524, 1, 1, 1, 1, 1,
-0.5621704, 0.5236101, -1.031556, 1, 1, 1, 1, 1,
-0.5573363, 0.9534874, -0.1094491, 1, 1, 1, 1, 1,
-0.5541346, -1.567708, -2.062405, 1, 1, 1, 1, 1,
-0.5527582, -0.2824454, -2.962155, 1, 1, 1, 1, 1,
-0.5511442, -0.5402055, -1.569823, 0, 0, 1, 1, 1,
-0.5499868, -0.5959735, -1.945972, 1, 0, 0, 1, 1,
-0.5477187, 0.6040707, 0.2967611, 1, 0, 0, 1, 1,
-0.5476267, 1.483806, -1.503593, 1, 0, 0, 1, 1,
-0.5436896, -0.4081883, -2.506194, 1, 0, 0, 1, 1,
-0.5390139, 1.057633, -0.02922612, 1, 0, 0, 1, 1,
-0.5376258, -1.713648, -3.133328, 0, 0, 0, 1, 1,
-0.5346853, 0.1919495, -1.578738, 0, 0, 0, 1, 1,
-0.5196368, 0.4971097, 0.485234, 0, 0, 0, 1, 1,
-0.5131569, 0.3220046, -0.2428279, 0, 0, 0, 1, 1,
-0.5130919, 1.56025, -1.440616, 0, 0, 0, 1, 1,
-0.5117482, -0.5162336, -3.481072, 0, 0, 0, 1, 1,
-0.4999913, 0.4001343, -1.118167, 0, 0, 0, 1, 1,
-0.4998868, 0.6521912, -1.03143, 1, 1, 1, 1, 1,
-0.4997536, 0.3163895, -1.450421, 1, 1, 1, 1, 1,
-0.4996693, 1.952359, -0.3123988, 1, 1, 1, 1, 1,
-0.4988511, -0.5071529, -4.048753, 1, 1, 1, 1, 1,
-0.4925548, 0.4102933, -0.1587776, 1, 1, 1, 1, 1,
-0.4917774, -2.272897, -3.619644, 1, 1, 1, 1, 1,
-0.4913467, -1.422146, -2.368819, 1, 1, 1, 1, 1,
-0.4905183, 0.2223598, -1.916354, 1, 1, 1, 1, 1,
-0.489838, 0.6567086, -0.3480175, 1, 1, 1, 1, 1,
-0.4890636, -0.6355, -3.521036, 1, 1, 1, 1, 1,
-0.488604, -1.535097, -2.634583, 1, 1, 1, 1, 1,
-0.4872566, -0.585093, -0.01871935, 1, 1, 1, 1, 1,
-0.4855771, 0.9804137, -1.62336, 1, 1, 1, 1, 1,
-0.4853634, -0.06767908, -2.63232, 1, 1, 1, 1, 1,
-0.4833334, 0.6546074, -1.916355, 1, 1, 1, 1, 1,
-0.4829352, 0.8057466, -1.641629, 0, 0, 1, 1, 1,
-0.4825242, 0.3751893, 0.03094055, 1, 0, 0, 1, 1,
-0.480676, -1.875917, -4.047064, 1, 0, 0, 1, 1,
-0.4780487, -1.073003, -2.244226, 1, 0, 0, 1, 1,
-0.47763, -1.321944, -2.609309, 1, 0, 0, 1, 1,
-0.4734335, 0.3243506, -0.821676, 1, 0, 0, 1, 1,
-0.4732052, 0.8626909, 1.292302, 0, 0, 0, 1, 1,
-0.4640516, 0.4272541, -0.9555449, 0, 0, 0, 1, 1,
-0.4619679, -0.6133271, -3.310293, 0, 0, 0, 1, 1,
-0.4595067, 1.023012, -2.075858, 0, 0, 0, 1, 1,
-0.4567178, 1.21613, 0.2352106, 0, 0, 0, 1, 1,
-0.4563759, 0.2195396, -0.573775, 0, 0, 0, 1, 1,
-0.4537446, -0.5635934, -2.757373, 0, 0, 0, 1, 1,
-0.4467579, 0.5022678, 1.160608, 1, 1, 1, 1, 1,
-0.4394079, 0.8149294, 0.4388905, 1, 1, 1, 1, 1,
-0.4392992, -0.1993489, -2.553002, 1, 1, 1, 1, 1,
-0.43864, 0.4638707, 1.211374, 1, 1, 1, 1, 1,
-0.4373155, 0.01331364, -4.234759, 1, 1, 1, 1, 1,
-0.4355313, -0.06923599, -2.420667, 1, 1, 1, 1, 1,
-0.4334548, 0.3138691, -1.498606, 1, 1, 1, 1, 1,
-0.4330899, -0.5365013, -1.610305, 1, 1, 1, 1, 1,
-0.4329779, 0.2017068, -0.9055867, 1, 1, 1, 1, 1,
-0.429664, 2.028821, 0.2872325, 1, 1, 1, 1, 1,
-0.4254873, -0.1270831, -2.461456, 1, 1, 1, 1, 1,
-0.4218234, -1.117718, -2.304804, 1, 1, 1, 1, 1,
-0.4211654, 0.517162, -1.645855, 1, 1, 1, 1, 1,
-0.419945, -1.111956, -2.802851, 1, 1, 1, 1, 1,
-0.419705, -0.6523446, -2.979047, 1, 1, 1, 1, 1,
-0.4165753, 0.1515768, -1.041904, 0, 0, 1, 1, 1,
-0.4124898, -0.2959983, -1.483586, 1, 0, 0, 1, 1,
-0.4112757, -0.2489155, -0.5018089, 1, 0, 0, 1, 1,
-0.4103371, -2.36749, -3.823734, 1, 0, 0, 1, 1,
-0.4096261, -0.6844004, -0.4999527, 1, 0, 0, 1, 1,
-0.4092478, -0.1118705, -3.049999, 1, 0, 0, 1, 1,
-0.4059201, 0.07106744, -1.491273, 0, 0, 0, 1, 1,
-0.4039326, -0.5848219, -3.034567, 0, 0, 0, 1, 1,
-0.402383, -0.06707802, -0.8918964, 0, 0, 0, 1, 1,
-0.3998232, 1.527216, -1.248662, 0, 0, 0, 1, 1,
-0.3977138, 0.5290301, 0.2907639, 0, 0, 0, 1, 1,
-0.3964427, -1.011999, -1.436913, 0, 0, 0, 1, 1,
-0.3909265, 0.8080109, 0.5738768, 0, 0, 0, 1, 1,
-0.3900115, -1.295833, -2.722907, 1, 1, 1, 1, 1,
-0.389267, -0.2172308, -1.245512, 1, 1, 1, 1, 1,
-0.3879915, 0.5403868, -0.6944692, 1, 1, 1, 1, 1,
-0.3842361, 0.06289448, -1.149602, 1, 1, 1, 1, 1,
-0.3841563, -0.153001, -3.717725, 1, 1, 1, 1, 1,
-0.3743784, -0.4106769, -3.838546, 1, 1, 1, 1, 1,
-0.3737619, 2.483872, -1.594376, 1, 1, 1, 1, 1,
-0.3703911, -0.255894, -2.832879, 1, 1, 1, 1, 1,
-0.3673001, -0.4177427, -3.384731, 1, 1, 1, 1, 1,
-0.3669838, -0.8086404, -3.76343, 1, 1, 1, 1, 1,
-0.3661965, -0.1774794, -3.054249, 1, 1, 1, 1, 1,
-0.3641709, -1.623067, -3.942178, 1, 1, 1, 1, 1,
-0.3566571, 0.4340132, -1.257063, 1, 1, 1, 1, 1,
-0.3541794, -0.6497623, -2.882735, 1, 1, 1, 1, 1,
-0.3533212, -0.8902109, -3.604695, 1, 1, 1, 1, 1,
-0.3505755, 0.8472106, 1.332301, 0, 0, 1, 1, 1,
-0.3430363, 0.9848563, -1.137009, 1, 0, 0, 1, 1,
-0.3332638, 1.065684, -0.6998934, 1, 0, 0, 1, 1,
-0.3324785, 0.9697265, -1.656595, 1, 0, 0, 1, 1,
-0.3293037, 1.997486, 1.335519, 1, 0, 0, 1, 1,
-0.3270034, 1.345261, -0.965958, 1, 0, 0, 1, 1,
-0.3223499, -0.5377153, -4.22847, 0, 0, 0, 1, 1,
-0.3187628, 1.147897, -0.3302855, 0, 0, 0, 1, 1,
-0.3176292, -0.07285386, -0.9473063, 0, 0, 0, 1, 1,
-0.3138374, 0.8582916, -0.1173972, 0, 0, 0, 1, 1,
-0.3133672, -0.03475279, -1.495522, 0, 0, 0, 1, 1,
-0.3116646, 0.8627777, -2.037234, 0, 0, 0, 1, 1,
-0.310035, -0.3676562, -2.415052, 0, 0, 0, 1, 1,
-0.3090889, 1.453912, -0.1802299, 1, 1, 1, 1, 1,
-0.3087823, -0.3791526, -1.207135, 1, 1, 1, 1, 1,
-0.3087441, 0.6263901, -2.000437, 1, 1, 1, 1, 1,
-0.308383, 0.550976, -1.097822, 1, 1, 1, 1, 1,
-0.3010256, 2.637319, -0.2450792, 1, 1, 1, 1, 1,
-0.3001471, -1.399261, -1.815349, 1, 1, 1, 1, 1,
-0.2962816, -0.436241, -3.624041, 1, 1, 1, 1, 1,
-0.2922296, -0.3756922, -1.402983, 1, 1, 1, 1, 1,
-0.289217, -0.3381471, -2.912862, 1, 1, 1, 1, 1,
-0.2883323, 0.5308601, -1.189482, 1, 1, 1, 1, 1,
-0.2842501, 0.5240556, -1.71446, 1, 1, 1, 1, 1,
-0.2831217, 0.3640637, -1.382555, 1, 1, 1, 1, 1,
-0.2830247, -0.824536, -1.717641, 1, 1, 1, 1, 1,
-0.2798914, -0.5300691, -2.222794, 1, 1, 1, 1, 1,
-0.2784779, -0.8998119, -3.562828, 1, 1, 1, 1, 1,
-0.2781557, 1.934773, -0.4750655, 0, 0, 1, 1, 1,
-0.2780082, 0.3201476, 0.4176771, 1, 0, 0, 1, 1,
-0.2772398, -0.4851854, -4.942807, 1, 0, 0, 1, 1,
-0.2765855, 0.2556728, -1.123467, 1, 0, 0, 1, 1,
-0.2709962, -0.8342631, -4.040124, 1, 0, 0, 1, 1,
-0.2709127, 0.4345094, -0.3991389, 1, 0, 0, 1, 1,
-0.2705146, -0.1061898, -1.185851, 0, 0, 0, 1, 1,
-0.2695014, 0.3975141, -0.1757808, 0, 0, 0, 1, 1,
-0.2673872, -0.0369801, -2.841156, 0, 0, 0, 1, 1,
-0.2651644, -1.231962, -1.543941, 0, 0, 0, 1, 1,
-0.2557552, 0.9675778, -2.245456, 0, 0, 0, 1, 1,
-0.2540058, 2.199748, -0.3943346, 0, 0, 0, 1, 1,
-0.2526869, -0.6098351, -1.784088, 0, 0, 0, 1, 1,
-0.249475, -0.9277909, -2.322066, 1, 1, 1, 1, 1,
-0.244077, -0.267111, -3.525212, 1, 1, 1, 1, 1,
-0.2439813, 0.05927349, -1.433844, 1, 1, 1, 1, 1,
-0.2438645, 0.8903773, -0.8049446, 1, 1, 1, 1, 1,
-0.2398727, 0.9468407, 0.955649, 1, 1, 1, 1, 1,
-0.2367018, -0.346691, -2.526852, 1, 1, 1, 1, 1,
-0.2255597, -0.502961, -1.770766, 1, 1, 1, 1, 1,
-0.2239389, 2.87387, -0.5041654, 1, 1, 1, 1, 1,
-0.2235589, 1.833659, -0.7867866, 1, 1, 1, 1, 1,
-0.2154712, -1.777431, -3.068168, 1, 1, 1, 1, 1,
-0.2130094, -0.1734157, -2.779254, 1, 1, 1, 1, 1,
-0.2089257, 0.733492, -0.5018756, 1, 1, 1, 1, 1,
-0.2086754, -0.2844065, -2.853399, 1, 1, 1, 1, 1,
-0.2079619, 0.9577342, -0.5362722, 1, 1, 1, 1, 1,
-0.2046194, -1.328192, -3.688586, 1, 1, 1, 1, 1,
-0.2039919, 0.4330359, 0.5465441, 0, 0, 1, 1, 1,
-0.2019833, 0.7648317, -3.515186, 1, 0, 0, 1, 1,
-0.2003701, 2.711426, -0.3067387, 1, 0, 0, 1, 1,
-0.1977508, -0.1830758, -2.494588, 1, 0, 0, 1, 1,
-0.197735, 0.6993672, 0.09897932, 1, 0, 0, 1, 1,
-0.1914414, 0.7995038, 0.0004539206, 1, 0, 0, 1, 1,
-0.1875201, -0.7988167, -2.328924, 0, 0, 0, 1, 1,
-0.1825051, -1.013254, -4.029173, 0, 0, 0, 1, 1,
-0.1824298, -2.120517, -3.928598, 0, 0, 0, 1, 1,
-0.1809613, -1.196752, -3.843553, 0, 0, 0, 1, 1,
-0.173331, -1.109589, -3.464246, 0, 0, 0, 1, 1,
-0.1712559, -1.062642, -2.849392, 0, 0, 0, 1, 1,
-0.166582, -0.169562, -3.41223, 0, 0, 0, 1, 1,
-0.1613047, 1.300468, -0.5930387, 1, 1, 1, 1, 1,
-0.1503381, -1.251538, -4.286289, 1, 1, 1, 1, 1,
-0.1490005, -0.8139651, -3.555261, 1, 1, 1, 1, 1,
-0.1466743, 1.891155, -1.150308, 1, 1, 1, 1, 1,
-0.1447546, 1.575612, 0.4605966, 1, 1, 1, 1, 1,
-0.1435758, -0.6473167, -2.157023, 1, 1, 1, 1, 1,
-0.1435387, 0.09558603, -0.4222345, 1, 1, 1, 1, 1,
-0.1408483, 0.4151948, -0.2126258, 1, 1, 1, 1, 1,
-0.1403778, -2.750973, -2.91317, 1, 1, 1, 1, 1,
-0.1391381, 1.710626, 1.243335, 1, 1, 1, 1, 1,
-0.1387792, 1.048725, -0.4050955, 1, 1, 1, 1, 1,
-0.1361711, 0.6084729, 0.4760863, 1, 1, 1, 1, 1,
-0.1355026, 0.7813212, -0.8826821, 1, 1, 1, 1, 1,
-0.1347857, -0.6161587, -5.323777, 1, 1, 1, 1, 1,
-0.1316867, 0.752647, -2.525379, 1, 1, 1, 1, 1,
-0.1277381, 0.324595, -1.73768, 0, 0, 1, 1, 1,
-0.1276593, 2.330852, -0.6967475, 1, 0, 0, 1, 1,
-0.1265301, 0.4707439, -0.5277542, 1, 0, 0, 1, 1,
-0.1252714, 0.118278, -1.870577, 1, 0, 0, 1, 1,
-0.1251833, 0.4820081, 0.1151323, 1, 0, 0, 1, 1,
-0.1248394, -1.230101, -2.22124, 1, 0, 0, 1, 1,
-0.118554, -0.7444538, -0.6734521, 0, 0, 0, 1, 1,
-0.1184111, 0.5083327, -0.5868977, 0, 0, 0, 1, 1,
-0.1067752, -0.7136109, -4.32341, 0, 0, 0, 1, 1,
-0.106338, 1.025426, -0.2543265, 0, 0, 0, 1, 1,
-0.1041759, -0.1661575, -3.567361, 0, 0, 0, 1, 1,
-0.1003784, -0.5368579, -1.805379, 0, 0, 0, 1, 1,
-0.09774178, -0.5522507, -2.091076, 0, 0, 0, 1, 1,
-0.09722525, 1.749741, -1.133258, 1, 1, 1, 1, 1,
-0.08867371, -1.666727, -3.831075, 1, 1, 1, 1, 1,
-0.08860252, 1.276329, 0.5510485, 1, 1, 1, 1, 1,
-0.08345022, 1.165755, -2.075927, 1, 1, 1, 1, 1,
-0.08282836, 0.5707152, -0.1307921, 1, 1, 1, 1, 1,
-0.08044031, -0.9414946, -3.916277, 1, 1, 1, 1, 1,
-0.07816169, 0.9090643, 2.421939, 1, 1, 1, 1, 1,
-0.07534549, 0.8751358, -0.3177682, 1, 1, 1, 1, 1,
-0.07110941, -0.6977294, -1.852578, 1, 1, 1, 1, 1,
-0.06922277, 0.9952809, -2.111272, 1, 1, 1, 1, 1,
-0.0647644, 1.67863, 1.97411, 1, 1, 1, 1, 1,
-0.06365949, -1.35284, -2.393867, 1, 1, 1, 1, 1,
-0.06012323, -0.81874, -2.990878, 1, 1, 1, 1, 1,
-0.05888738, 1.391449, 0.7055513, 1, 1, 1, 1, 1,
-0.0579039, -0.1343133, -2.853133, 1, 1, 1, 1, 1,
-0.05745462, -0.7307463, -3.240437, 0, 0, 1, 1, 1,
-0.05170536, 1.081915, 1.104419, 1, 0, 0, 1, 1,
-0.0489994, 0.01699574, -1.381846, 1, 0, 0, 1, 1,
-0.04880407, -0.06495694, -1.920277, 1, 0, 0, 1, 1,
-0.04786267, 0.5903959, -0.7438008, 1, 0, 0, 1, 1,
-0.0423302, 0.798703, -0.4260752, 1, 0, 0, 1, 1,
-0.03992571, 0.1305558, -1.247584, 0, 0, 0, 1, 1,
-0.03868275, 0.8056989, 0.7154586, 0, 0, 0, 1, 1,
-0.03685203, -0.3365782, -2.051659, 0, 0, 0, 1, 1,
-0.03465398, -1.228056, -3.598761, 0, 0, 0, 1, 1,
-0.03337267, 2.153646, -1.368798, 0, 0, 0, 1, 1,
-0.03267129, 1.172098, 1.198331, 0, 0, 0, 1, 1,
-0.0314233, 1.428016, 1.09909, 0, 0, 0, 1, 1,
-0.03062773, 1.574679, 0.1721199, 1, 1, 1, 1, 1,
-0.02579281, -1.641021, -3.128011, 1, 1, 1, 1, 1,
-0.02537882, -1.057195, -3.40731, 1, 1, 1, 1, 1,
-0.02453114, 0.194902, 0.0009594132, 1, 1, 1, 1, 1,
-0.02409827, 0.5281078, -2.169204, 1, 1, 1, 1, 1,
-0.02273827, 0.7643733, -1.196697, 1, 1, 1, 1, 1,
-0.01858625, 0.1449001, -0.5227612, 1, 1, 1, 1, 1,
-0.01272676, 0.5028963, 0.50735, 1, 1, 1, 1, 1,
-0.01094532, 1.00794, -1.751345, 1, 1, 1, 1, 1,
-0.01071794, 1.650057, 0.3445207, 1, 1, 1, 1, 1,
-0.008922554, -0.2366142, -2.951238, 1, 1, 1, 1, 1,
-0.008627805, -1.167721, -2.95334, 1, 1, 1, 1, 1,
-0.007633842, 0.8655102, -0.1386734, 1, 1, 1, 1, 1,
-0.00596403, -0.3519549, -1.38027, 1, 1, 1, 1, 1,
-0.004412037, -0.1462321, -4.799669, 1, 1, 1, 1, 1,
0.0002310989, -1.26219, 5.142731, 0, 0, 1, 1, 1,
0.0007046011, 0.2958797, -0.5878577, 1, 0, 0, 1, 1,
0.01217328, -0.8956581, 2.196039, 1, 0, 0, 1, 1,
0.01515882, -0.07306495, 2.897812, 1, 0, 0, 1, 1,
0.01721396, -1.092702, 3.199681, 1, 0, 0, 1, 1,
0.01767665, 0.3610581, 2.015297, 1, 0, 0, 1, 1,
0.02016842, 1.264128, 0.3403366, 0, 0, 0, 1, 1,
0.02303925, -0.4206487, 3.087413, 0, 0, 0, 1, 1,
0.02352745, 2.391896, -0.7227993, 0, 0, 0, 1, 1,
0.03260659, -0.6359826, 2.246337, 0, 0, 0, 1, 1,
0.03694693, 1.454218, 0.8037888, 0, 0, 0, 1, 1,
0.04187635, -0.677108, 2.959007, 0, 0, 0, 1, 1,
0.04969545, -0.9279383, 2.496795, 0, 0, 0, 1, 1,
0.05408461, 0.2593127, 2.102169, 1, 1, 1, 1, 1,
0.05726677, -2.177738, 4.493665, 1, 1, 1, 1, 1,
0.0578064, -0.3334384, 2.232957, 1, 1, 1, 1, 1,
0.05991151, -1.247087, 4.167611, 1, 1, 1, 1, 1,
0.06063801, 1.506814, -1.520372, 1, 1, 1, 1, 1,
0.06123965, 0.9705909, -0.1222656, 1, 1, 1, 1, 1,
0.06731673, 0.9885715, -0.5046991, 1, 1, 1, 1, 1,
0.07115319, 0.03893785, 2.086433, 1, 1, 1, 1, 1,
0.07572278, -0.2742457, 2.705026, 1, 1, 1, 1, 1,
0.07574182, 1.559627, 0.008650729, 1, 1, 1, 1, 1,
0.07743356, 1.295682, -1.714551, 1, 1, 1, 1, 1,
0.07857613, -2.149272, 4.133942, 1, 1, 1, 1, 1,
0.07876932, -0.7024845, 2.798687, 1, 1, 1, 1, 1,
0.08045156, 0.860246, 0.5503205, 1, 1, 1, 1, 1,
0.08117063, 1.860373, 0.996707, 1, 1, 1, 1, 1,
0.08702592, -0.1028958, 1.745826, 0, 0, 1, 1, 1,
0.08726106, 0.2843565, 0.8585824, 1, 0, 0, 1, 1,
0.08877715, -0.0518306, 2.989994, 1, 0, 0, 1, 1,
0.08908767, 0.1905502, -0.5729981, 1, 0, 0, 1, 1,
0.09117441, -1.320224, 3.87324, 1, 0, 0, 1, 1,
0.09197354, 1.218103, 0.1816031, 1, 0, 0, 1, 1,
0.09464079, -0.04221108, 1.77809, 0, 0, 0, 1, 1,
0.1081277, -1.424902, 3.617378, 0, 0, 0, 1, 1,
0.1125346, 0.494384, -0.9329934, 0, 0, 0, 1, 1,
0.1130133, 0.140903, -0.03326811, 0, 0, 0, 1, 1,
0.1136097, 1.164652, -1.128533, 0, 0, 0, 1, 1,
0.1152178, -0.2688051, 1.613088, 0, 0, 0, 1, 1,
0.1193614, -0.6633992, 2.016936, 0, 0, 0, 1, 1,
0.1220249, -0.03839348, 2.577888, 1, 1, 1, 1, 1,
0.1247557, 0.07951789, 1.67514, 1, 1, 1, 1, 1,
0.1268297, 2.294062, -0.7841648, 1, 1, 1, 1, 1,
0.1355863, 0.4357889, 1.409487, 1, 1, 1, 1, 1,
0.1385459, -0.5202706, 3.926404, 1, 1, 1, 1, 1,
0.1406738, 1.067775, 0.0483958, 1, 1, 1, 1, 1,
0.1409426, -0.3389461, 2.732602, 1, 1, 1, 1, 1,
0.1422999, 1.087663, 1.611071, 1, 1, 1, 1, 1,
0.1433222, 0.2169082, 0.8410253, 1, 1, 1, 1, 1,
0.1434322, -0.002671959, 0.5998771, 1, 1, 1, 1, 1,
0.1440705, 0.4508966, 2.636198, 1, 1, 1, 1, 1,
0.1470323, -1.671087, 3.115709, 1, 1, 1, 1, 1,
0.1501411, 1.053187, -0.6744899, 1, 1, 1, 1, 1,
0.1502673, -1.242233, 2.512012, 1, 1, 1, 1, 1,
0.1527251, 0.7448208, -0.3408606, 1, 1, 1, 1, 1,
0.1545317, -1.069902, 1.494381, 0, 0, 1, 1, 1,
0.1618197, -0.7932642, 3.033767, 1, 0, 0, 1, 1,
0.1625516, 0.8325009, -1.793906, 1, 0, 0, 1, 1,
0.16536, 1.634724, -0.2213547, 1, 0, 0, 1, 1,
0.1674737, 0.5392976, 2.036835, 1, 0, 0, 1, 1,
0.1731348, 0.5339252, 0.1671521, 1, 0, 0, 1, 1,
0.1754607, 1.385175, -0.2448894, 0, 0, 0, 1, 1,
0.1772195, 0.2860015, 1.7667, 0, 0, 0, 1, 1,
0.1834377, 1.003984, 0.9106629, 0, 0, 0, 1, 1,
0.1856496, 0.09052952, -0.7734291, 0, 0, 0, 1, 1,
0.1865999, 0.7013122, 0.7249599, 0, 0, 0, 1, 1,
0.190805, 2.183011, 0.8332465, 0, 0, 0, 1, 1,
0.1910083, -2.084258, 2.796509, 0, 0, 0, 1, 1,
0.1948423, -1.489009, 3.016723, 1, 1, 1, 1, 1,
0.1994342, 1.488121, -0.5688174, 1, 1, 1, 1, 1,
0.1997569, -1.958896, 2.453846, 1, 1, 1, 1, 1,
0.203104, -0.1363725, 1.952786, 1, 1, 1, 1, 1,
0.2033531, 0.1010433, 0.6547235, 1, 1, 1, 1, 1,
0.2039082, -0.08233441, 3.628156, 1, 1, 1, 1, 1,
0.2140621, -0.9300928, 3.825398, 1, 1, 1, 1, 1,
0.2195172, -1.266895, 2.798871, 1, 1, 1, 1, 1,
0.22279, -1.191125, 3.278231, 1, 1, 1, 1, 1,
0.2308897, -0.2740777, 2.105987, 1, 1, 1, 1, 1,
0.2314211, -0.940037, 3.419397, 1, 1, 1, 1, 1,
0.2352378, -0.5235702, 2.001013, 1, 1, 1, 1, 1,
0.2366492, 0.1941173, 2.403414, 1, 1, 1, 1, 1,
0.2484643, -1.296933, 3.832256, 1, 1, 1, 1, 1,
0.2497169, -0.9750003, 2.564219, 1, 1, 1, 1, 1,
0.2505208, -0.3331556, 3.071263, 0, 0, 1, 1, 1,
0.2506519, 1.117851, -0.01072304, 1, 0, 0, 1, 1,
0.2531711, -1.967715, 2.688752, 1, 0, 0, 1, 1,
0.2545653, 1.42233, 2.144043, 1, 0, 0, 1, 1,
0.2567376, -0.955403, 2.617859, 1, 0, 0, 1, 1,
0.2586493, 0.0160287, 2.446965, 1, 0, 0, 1, 1,
0.2602172, 1.761549, 1.944244, 0, 0, 0, 1, 1,
0.2661438, 0.4397455, 1.045554, 0, 0, 0, 1, 1,
0.2680096, 0.1710033, 1.536124, 0, 0, 0, 1, 1,
0.2749395, 0.9221305, 1.924473, 0, 0, 0, 1, 1,
0.2756071, 0.4263659, 0.09952255, 0, 0, 0, 1, 1,
0.2770672, 1.350496, 0.5095362, 0, 0, 0, 1, 1,
0.278666, 0.6384334, -0.4821216, 0, 0, 0, 1, 1,
0.2813649, 0.4505289, 0.8707557, 1, 1, 1, 1, 1,
0.2820092, 0.8142537, -0.5110102, 1, 1, 1, 1, 1,
0.2838064, -0.9484655, 2.932657, 1, 1, 1, 1, 1,
0.2892598, -0.2520252, 4.336717, 1, 1, 1, 1, 1,
0.2985431, -0.3958663, 2.346891, 1, 1, 1, 1, 1,
0.3001967, -0.3115204, 2.278092, 1, 1, 1, 1, 1,
0.3009707, 0.2617703, 0.8676864, 1, 1, 1, 1, 1,
0.3016546, 0.3616761, 0.9032367, 1, 1, 1, 1, 1,
0.3034759, 0.9706099, 0.1873863, 1, 1, 1, 1, 1,
0.3079182, 0.221764, 0.07306063, 1, 1, 1, 1, 1,
0.3089468, 0.09279308, 0.8755722, 1, 1, 1, 1, 1,
0.3097579, 0.7811477, 0.0777523, 1, 1, 1, 1, 1,
0.3107527, 0.456846, 0.5590001, 1, 1, 1, 1, 1,
0.3154173, 2.559829, -0.6315354, 1, 1, 1, 1, 1,
0.3154759, -1.224209, 1.654552, 1, 1, 1, 1, 1,
0.3190696, 0.2115385, 1.243828, 0, 0, 1, 1, 1,
0.3193332, -0.1338147, 0.8468258, 1, 0, 0, 1, 1,
0.321355, 0.4803793, 1.747935, 1, 0, 0, 1, 1,
0.3277094, 0.07891362, 1.641142, 1, 0, 0, 1, 1,
0.3330779, 0.4897199, 1.044179, 1, 0, 0, 1, 1,
0.3365758, -0.3020537, 1.7329, 1, 0, 0, 1, 1,
0.3366429, 0.6307775, 2.211462, 0, 0, 0, 1, 1,
0.3513801, -0.03780387, 3.060743, 0, 0, 0, 1, 1,
0.3532513, 0.4815448, 0.1756614, 0, 0, 0, 1, 1,
0.3573798, -1.444428, 4.651006, 0, 0, 0, 1, 1,
0.3580665, 0.146473, 1.31111, 0, 0, 0, 1, 1,
0.3591757, 0.3039791, 1.665336, 0, 0, 0, 1, 1,
0.3613782, 0.7923334, 0.8010814, 0, 0, 0, 1, 1,
0.3642652, -1.703645, 0.9360558, 1, 1, 1, 1, 1,
0.365092, 0.010873, 4.828609, 1, 1, 1, 1, 1,
0.369483, 1.641789, -0.5279126, 1, 1, 1, 1, 1,
0.3719473, 0.4721516, 0.1148103, 1, 1, 1, 1, 1,
0.3720866, -0.6879099, 1.538224, 1, 1, 1, 1, 1,
0.3723243, -0.01331542, 2.017524, 1, 1, 1, 1, 1,
0.377788, 0.7297184, 0.484642, 1, 1, 1, 1, 1,
0.3806839, -0.5164284, 3.456056, 1, 1, 1, 1, 1,
0.381574, -0.5959907, 3.199059, 1, 1, 1, 1, 1,
0.3823728, -1.635506, 2.699651, 1, 1, 1, 1, 1,
0.3890035, 0.1944952, 0.9006078, 1, 1, 1, 1, 1,
0.3901164, -0.474142, 0.8337963, 1, 1, 1, 1, 1,
0.3914849, 0.9255536, -0.3527802, 1, 1, 1, 1, 1,
0.3949957, 1.280985, 0.6553162, 1, 1, 1, 1, 1,
0.3995715, 0.1208038, 1.548312, 1, 1, 1, 1, 1,
0.4070219, 1.088805, -0.7100189, 0, 0, 1, 1, 1,
0.4071425, -0.6130001, 3.249845, 1, 0, 0, 1, 1,
0.4098862, -0.05381758, 1.575326, 1, 0, 0, 1, 1,
0.4122003, 0.7489741, -0.0489151, 1, 0, 0, 1, 1,
0.4149562, 0.5206477, 1.340388, 1, 0, 0, 1, 1,
0.4186094, 1.460042, -0.7310042, 1, 0, 0, 1, 1,
0.4193349, 3.171577, 0.5430292, 0, 0, 0, 1, 1,
0.4205235, 0.06349804, 1.222629, 0, 0, 0, 1, 1,
0.421178, 0.2879029, 0.334031, 0, 0, 0, 1, 1,
0.4235884, 0.8868745, 1.702949, 0, 0, 0, 1, 1,
0.4306445, -0.824251, 2.596767, 0, 0, 0, 1, 1,
0.4350766, -0.4833699, 4.016541, 0, 0, 0, 1, 1,
0.4367839, 0.7726558, 1.057884, 0, 0, 0, 1, 1,
0.4383188, -0.5328732, 4.229026, 1, 1, 1, 1, 1,
0.4434933, -2.91595, 2.609914, 1, 1, 1, 1, 1,
0.4445491, 1.367275, -1.069832, 1, 1, 1, 1, 1,
0.4470901, 1.363168, 1.169181, 1, 1, 1, 1, 1,
0.4481117, 0.1417412, 1.980046, 1, 1, 1, 1, 1,
0.4484607, 1.041961, 2.319701, 1, 1, 1, 1, 1,
0.4612707, -3.003736, 3.918261, 1, 1, 1, 1, 1,
0.4619049, 0.00725353, 2.042799, 1, 1, 1, 1, 1,
0.4665037, 1.382156, 0.7268693, 1, 1, 1, 1, 1,
0.4667476, 2.122955, -0.9068133, 1, 1, 1, 1, 1,
0.4687622, -0.3524853, 0.6247677, 1, 1, 1, 1, 1,
0.4693719, 0.4210795, 1.469489, 1, 1, 1, 1, 1,
0.4712805, 2.001247, -0.4694754, 1, 1, 1, 1, 1,
0.4757373, 0.849943, 1.272253, 1, 1, 1, 1, 1,
0.4759528, 0.6344028, 1.230406, 1, 1, 1, 1, 1,
0.4765205, 0.4544459, -0.2745382, 0, 0, 1, 1, 1,
0.4786358, -1.590614, 1.245096, 1, 0, 0, 1, 1,
0.4815752, 1.641956, 0.9400585, 1, 0, 0, 1, 1,
0.4843306, 2.843844, 0.8530481, 1, 0, 0, 1, 1,
0.4873586, -0.5786936, 3.245675, 1, 0, 0, 1, 1,
0.4895444, -0.5100457, 3.069713, 1, 0, 0, 1, 1,
0.4954451, 0.3695487, 0.4184753, 0, 0, 0, 1, 1,
0.4983574, -1.131197, 2.21259, 0, 0, 0, 1, 1,
0.5018669, -1.5883, 1.458407, 0, 0, 0, 1, 1,
0.5025373, -0.2859618, 2.620101, 0, 0, 0, 1, 1,
0.5049087, 0.5151692, 0.7311243, 0, 0, 0, 1, 1,
0.5090745, -2.130374, 4.333275, 0, 0, 0, 1, 1,
0.5108106, -0.3830521, 3.439105, 0, 0, 0, 1, 1,
0.5152247, -0.7348427, 1.542195, 1, 1, 1, 1, 1,
0.5197023, -0.5600705, 3.5141, 1, 1, 1, 1, 1,
0.53364, 0.3216393, 1.283576, 1, 1, 1, 1, 1,
0.5363191, -0.4196612, 3.706722, 1, 1, 1, 1, 1,
0.5371699, 0.9739717, -1.238894, 1, 1, 1, 1, 1,
0.5424832, -1.197367, 2.909448, 1, 1, 1, 1, 1,
0.5451161, -1.063887, 3.10203, 1, 1, 1, 1, 1,
0.5484614, 0.04461313, -0.07032323, 1, 1, 1, 1, 1,
0.5533525, -1.091863, 3.629597, 1, 1, 1, 1, 1,
0.5560441, -0.9362488, 4.313336, 1, 1, 1, 1, 1,
0.5614793, 0.7616038, 1.803903, 1, 1, 1, 1, 1,
0.564441, -1.163762, 4.738896, 1, 1, 1, 1, 1,
0.5645199, 1.317468, 1.538052, 1, 1, 1, 1, 1,
0.5739771, 1.327483, -0.07116024, 1, 1, 1, 1, 1,
0.5762347, -1.438638, 2.452233, 1, 1, 1, 1, 1,
0.5829337, 1.563508, 0.5101808, 0, 0, 1, 1, 1,
0.591233, 0.2075795, 3.256593, 1, 0, 0, 1, 1,
0.5922303, -1.085622, 2.786695, 1, 0, 0, 1, 1,
0.5930966, 0.2352564, 2.950861, 1, 0, 0, 1, 1,
0.5957271, 1.114619, -1.552301, 1, 0, 0, 1, 1,
0.5969407, 0.1500131, 2.670306, 1, 0, 0, 1, 1,
0.6035285, 0.4264419, 1.893484, 0, 0, 0, 1, 1,
0.6062977, 1.025833, 0.7291854, 0, 0, 0, 1, 1,
0.608047, 1.331645, 1.492218, 0, 0, 0, 1, 1,
0.6086674, -0.1817038, -0.8591487, 0, 0, 0, 1, 1,
0.6105277, 0.4645315, 1.58267, 0, 0, 0, 1, 1,
0.61352, 0.7092525, 0.3169631, 0, 0, 0, 1, 1,
0.6196853, 0.03842733, 2.756942, 0, 0, 0, 1, 1,
0.6250216, 1.171943, -0.3251768, 1, 1, 1, 1, 1,
0.6253632, -0.7769466, 2.316915, 1, 1, 1, 1, 1,
0.6256807, 0.3374175, -0.3733675, 1, 1, 1, 1, 1,
0.6270145, -0.04816264, 2.503938, 1, 1, 1, 1, 1,
0.6291279, 0.261155, -1.109985, 1, 1, 1, 1, 1,
0.6301589, 0.09736089, 1.807945, 1, 1, 1, 1, 1,
0.6325941, 0.1037031, 1.225206, 1, 1, 1, 1, 1,
0.6325989, -0.776421, 2.43769, 1, 1, 1, 1, 1,
0.6326342, -0.4251584, 2.253495, 1, 1, 1, 1, 1,
0.6329396, 0.2573018, 0.9129738, 1, 1, 1, 1, 1,
0.6337003, 0.1386807, 1.888332, 1, 1, 1, 1, 1,
0.6344336, 0.1121661, 1.628203, 1, 1, 1, 1, 1,
0.6382625, -1.684091, 2.286537, 1, 1, 1, 1, 1,
0.6443994, 0.7522648, -1.145045, 1, 1, 1, 1, 1,
0.6451588, 0.1519761, 1.985045, 1, 1, 1, 1, 1,
0.6464496, 0.3767605, 0.8521109, 0, 0, 1, 1, 1,
0.6491029, -0.1152059, 3.252439, 1, 0, 0, 1, 1,
0.662305, 0.8682298, -0.08263645, 1, 0, 0, 1, 1,
0.6646875, 0.7804102, -0.6996253, 1, 0, 0, 1, 1,
0.6665246, -0.6827694, 2.009475, 1, 0, 0, 1, 1,
0.6728046, -0.05304302, -0.8999446, 1, 0, 0, 1, 1,
0.6736578, 0.229859, 1.425807, 0, 0, 0, 1, 1,
0.6790106, 0.1874169, 0.2007958, 0, 0, 0, 1, 1,
0.6797246, 0.1655439, 1.460217, 0, 0, 0, 1, 1,
0.6829579, -1.349374, 2.79826, 0, 0, 0, 1, 1,
0.6866131, -0.4719163, 1.876674, 0, 0, 0, 1, 1,
0.6874254, -0.7666589, 3.679956, 0, 0, 0, 1, 1,
0.6890548, -0.01038958, 3.530766, 0, 0, 0, 1, 1,
0.690956, 0.2341388, 2.553942, 1, 1, 1, 1, 1,
0.6949056, 1.346896, -0.5166421, 1, 1, 1, 1, 1,
0.6970157, 0.3250748, -0.1533322, 1, 1, 1, 1, 1,
0.7092865, -0.4043495, -0.04046026, 1, 1, 1, 1, 1,
0.7095317, -1.738199, 2.496321, 1, 1, 1, 1, 1,
0.7121902, -0.1470354, 3.256228, 1, 1, 1, 1, 1,
0.7178567, -3.494979, 2.948584, 1, 1, 1, 1, 1,
0.7213061, 0.1790648, 0.9801223, 1, 1, 1, 1, 1,
0.7219216, 1.363294, -1.177968, 1, 1, 1, 1, 1,
0.7246701, 1.304421, -0.04661099, 1, 1, 1, 1, 1,
0.7250021, 0.03214024, 3.708106, 1, 1, 1, 1, 1,
0.7260668, 0.7478689, 1.795316, 1, 1, 1, 1, 1,
0.7263049, 0.07363592, 1.183095, 1, 1, 1, 1, 1,
0.7271723, -0.01936578, 1.289926, 1, 1, 1, 1, 1,
0.7282959, -0.6300688, 1.368381, 1, 1, 1, 1, 1,
0.7324055, -0.3663479, 2.116528, 0, 0, 1, 1, 1,
0.7337072, 2.231594, 0.4163867, 1, 0, 0, 1, 1,
0.7363356, -0.3687333, 1.215208, 1, 0, 0, 1, 1,
0.7394535, -1.069637, 3.408575, 1, 0, 0, 1, 1,
0.7480811, 1.315022, -0.6393985, 1, 0, 0, 1, 1,
0.7547811, 0.6728504, 0.7760736, 1, 0, 0, 1, 1,
0.7552082, 1.080976, -0.2383432, 0, 0, 0, 1, 1,
0.7571474, -1.260783, 1.361355, 0, 0, 0, 1, 1,
0.7672341, -0.3984469, 3.945845, 0, 0, 0, 1, 1,
0.7719538, -1.524052, 1.902283, 0, 0, 0, 1, 1,
0.7746173, -0.2266115, 1.92003, 0, 0, 0, 1, 1,
0.7814653, 0.7902864, -1.016863, 0, 0, 0, 1, 1,
0.7817711, -0.1761165, 0.4714512, 0, 0, 0, 1, 1,
0.7915215, -0.8405638, 2.061327, 1, 1, 1, 1, 1,
0.7926185, -0.8943892, 1.769947, 1, 1, 1, 1, 1,
0.7928519, -1.271321, 1.245009, 1, 1, 1, 1, 1,
0.792968, -0.02626568, 1.221145, 1, 1, 1, 1, 1,
0.7950404, 0.5745905, 0.3604093, 1, 1, 1, 1, 1,
0.796719, -1.320163, 2.45613, 1, 1, 1, 1, 1,
0.8048159, -1.239673, 1.791603, 1, 1, 1, 1, 1,
0.8078235, 1.109154, -0.2635067, 1, 1, 1, 1, 1,
0.8104899, 1.438475, 0.8306248, 1, 1, 1, 1, 1,
0.8148396, 0.5170023, 0.1225963, 1, 1, 1, 1, 1,
0.8185525, 0.6067169, 0.8651525, 1, 1, 1, 1, 1,
0.8200888, 0.2788862, -0.7993746, 1, 1, 1, 1, 1,
0.8224987, -0.3071407, 0.9160674, 1, 1, 1, 1, 1,
0.8284352, 1.802575, 0.1143909, 1, 1, 1, 1, 1,
0.8398889, 1.962218, -0.6200429, 1, 1, 1, 1, 1,
0.8404654, -1.046759, 2.970831, 0, 0, 1, 1, 1,
0.8424269, 0.1174688, -0.7105847, 1, 0, 0, 1, 1,
0.8468471, -0.6807376, 2.846341, 1, 0, 0, 1, 1,
0.8468663, 0.4428636, 0.8880762, 1, 0, 0, 1, 1,
0.8471251, -0.02151111, 2.133414, 1, 0, 0, 1, 1,
0.8494734, 0.1335192, 1.213654, 1, 0, 0, 1, 1,
0.8513813, 0.2870781, 0.7715126, 0, 0, 0, 1, 1,
0.8570578, -0.9742078, 2.499354, 0, 0, 0, 1, 1,
0.8577294, -1.563742, 4.278118, 0, 0, 0, 1, 1,
0.8596954, -0.3322774, 3.077114, 0, 0, 0, 1, 1,
0.8604541, -0.5832888, 1.719072, 0, 0, 0, 1, 1,
0.8680241, 0.01221724, 1.831862, 0, 0, 0, 1, 1,
0.8708217, 0.684462, 0.9624435, 0, 0, 0, 1, 1,
0.8708282, 0.03805473, 2.369754, 1, 1, 1, 1, 1,
0.8722097, 1.134383, 1.922292, 1, 1, 1, 1, 1,
0.8747242, -0.2755004, 1.819285, 1, 1, 1, 1, 1,
0.8748254, -0.6148037, 1.97872, 1, 1, 1, 1, 1,
0.8748844, -0.6306449, 2.628252, 1, 1, 1, 1, 1,
0.8762112, 1.979413, 0.6901633, 1, 1, 1, 1, 1,
0.879106, -1.088689, 3.041275, 1, 1, 1, 1, 1,
0.8823082, 1.866444, 0.4954895, 1, 1, 1, 1, 1,
0.8835503, -1.039025, 2.254697, 1, 1, 1, 1, 1,
0.8862479, -0.6868951, 1.153395, 1, 1, 1, 1, 1,
0.8936399, -1.281175, 2.049148, 1, 1, 1, 1, 1,
0.8973303, -0.6472543, 2.497613, 1, 1, 1, 1, 1,
0.8989231, 0.2647397, -1.017512, 1, 1, 1, 1, 1,
0.9041343, 0.838327, 1.297575, 1, 1, 1, 1, 1,
0.9043482, 1.703527, 0.1411163, 1, 1, 1, 1, 1,
0.9174204, 0.9108776, 2.563886, 0, 0, 1, 1, 1,
0.9175987, 0.5745102, 0.8179732, 1, 0, 0, 1, 1,
0.9179187, 1.143397, 2.646717, 1, 0, 0, 1, 1,
0.9184574, 1.010673, 0.7620844, 1, 0, 0, 1, 1,
0.9249828, -1.052065, 1.47889, 1, 0, 0, 1, 1,
0.9274744, 0.5031251, 2.272112, 1, 0, 0, 1, 1,
0.932846, 0.1862475, 1.712578, 0, 0, 0, 1, 1,
0.9354822, 0.7477746, 1.627196, 0, 0, 0, 1, 1,
0.9449527, 0.2888142, 0.8574536, 0, 0, 0, 1, 1,
0.9528031, 0.2956335, -0.3234251, 0, 0, 0, 1, 1,
0.9581843, -1.567291, 4.058435, 0, 0, 0, 1, 1,
0.9703597, 1.347566, -1.532838, 0, 0, 0, 1, 1,
0.9708953, 1.882741, 1.205321, 0, 0, 0, 1, 1,
0.9752041, -3.189316, 3.226655, 1, 1, 1, 1, 1,
0.9800274, -1.43084, 3.04739, 1, 1, 1, 1, 1,
0.9896514, 0.04997598, 2.012883, 1, 1, 1, 1, 1,
0.9983922, 0.7870294, 2.043876, 1, 1, 1, 1, 1,
1.000395, 0.4325599, 1.370677, 1, 1, 1, 1, 1,
1.001253, 0.2903911, 1.472933, 1, 1, 1, 1, 1,
1.002224, -0.1207681, 1.701286, 1, 1, 1, 1, 1,
1.002834, -1.54404, 3.758096, 1, 1, 1, 1, 1,
1.003046, -1.383018, 2.51053, 1, 1, 1, 1, 1,
1.012668, 0.1869671, 0.513951, 1, 1, 1, 1, 1,
1.014027, 0.8613205, -0.8184248, 1, 1, 1, 1, 1,
1.01428, 0.04781044, 1.661451, 1, 1, 1, 1, 1,
1.023336, 2.073823, 0.8935087, 1, 1, 1, 1, 1,
1.026646, 1.343318, -0.7734839, 1, 1, 1, 1, 1,
1.028473, -0.9265662, 2.190261, 1, 1, 1, 1, 1,
1.029853, 1.009839, 0.8880522, 0, 0, 1, 1, 1,
1.030594, 0.3211954, 2.125497, 1, 0, 0, 1, 1,
1.030943, 0.9989405, 0.9929324, 1, 0, 0, 1, 1,
1.031911, -0.8148433, 2.592155, 1, 0, 0, 1, 1,
1.041556, 1.233876, -0.1470668, 1, 0, 0, 1, 1,
1.044003, 0.1700199, 1.635304, 1, 0, 0, 1, 1,
1.047703, -1.394675, 2.149579, 0, 0, 0, 1, 1,
1.048732, 1.074149, 0.5553803, 0, 0, 0, 1, 1,
1.056809, -2.363558, 1.062499, 0, 0, 0, 1, 1,
1.057445, 1.042994, 0.7710468, 0, 0, 0, 1, 1,
1.060695, 0.7159672, -0.4992063, 0, 0, 0, 1, 1,
1.074684, 0.05508408, 2.080119, 0, 0, 0, 1, 1,
1.07904, 0.4025227, 1.953345, 0, 0, 0, 1, 1,
1.080095, -2.838367, 2.907759, 1, 1, 1, 1, 1,
1.087061, 0.05805919, 1.493418, 1, 1, 1, 1, 1,
1.088676, -0.4573703, 2.094075, 1, 1, 1, 1, 1,
1.091664, 0.3144841, -0.07992973, 1, 1, 1, 1, 1,
1.101807, -0.01994872, 1.081184, 1, 1, 1, 1, 1,
1.103306, -0.8661795, 1.357195, 1, 1, 1, 1, 1,
1.104166, -0.906712, 2.563514, 1, 1, 1, 1, 1,
1.105624, -0.6932075, 1.814719, 1, 1, 1, 1, 1,
1.10638, -0.1473131, 2.530638, 1, 1, 1, 1, 1,
1.123343, -1.377494, 2.353268, 1, 1, 1, 1, 1,
1.131278, 1.449681, 1.544416, 1, 1, 1, 1, 1,
1.13495, -0.8198808, 2.837438, 1, 1, 1, 1, 1,
1.135277, -1.112236, 2.312368, 1, 1, 1, 1, 1,
1.140201, 2.245567, -0.7373755, 1, 1, 1, 1, 1,
1.14229, 1.149126, 1.058415, 1, 1, 1, 1, 1,
1.143029, 0.5290936, 1.016158, 0, 0, 1, 1, 1,
1.145056, 0.1861993, -0.1168162, 1, 0, 0, 1, 1,
1.148259, 0.006833112, 0.1865144, 1, 0, 0, 1, 1,
1.152385, -0.05150223, 1.968951, 1, 0, 0, 1, 1,
1.154928, -0.5864907, 2.361164, 1, 0, 0, 1, 1,
1.156217, -1.641948, 3.434063, 1, 0, 0, 1, 1,
1.162894, 0.3135805, 0.09843572, 0, 0, 0, 1, 1,
1.168932, -0.2190029, 2.319808, 0, 0, 0, 1, 1,
1.173162, 1.188254, 0.7749739, 0, 0, 0, 1, 1,
1.179631, -0.6845946, 2.455527, 0, 0, 0, 1, 1,
1.1804, 0.9792742, 2.079091, 0, 0, 0, 1, 1,
1.182723, 0.1377315, 2.668335, 0, 0, 0, 1, 1,
1.18289, -1.070066, 2.939311, 0, 0, 0, 1, 1,
1.185425, 1.022807, -0.7710089, 1, 1, 1, 1, 1,
1.185504, 0.2530236, 0.4747189, 1, 1, 1, 1, 1,
1.189015, 0.9914078, -0.7374797, 1, 1, 1, 1, 1,
1.191034, 2.564978, -0.7369944, 1, 1, 1, 1, 1,
1.19503, 0.09331689, 1.432482, 1, 1, 1, 1, 1,
1.195164, -0.8115084, 0.9542062, 1, 1, 1, 1, 1,
1.198162, 0.2003222, 1.204593, 1, 1, 1, 1, 1,
1.203152, 0.7792069, 1.182203, 1, 1, 1, 1, 1,
1.203622, 0.07129721, 1.699424, 1, 1, 1, 1, 1,
1.222004, -0.2312501, 0.435834, 1, 1, 1, 1, 1,
1.222299, -1.110557, 1.454168, 1, 1, 1, 1, 1,
1.224944, -0.2943042, 1.236091, 1, 1, 1, 1, 1,
1.228335, -1.21765, 0.8764492, 1, 1, 1, 1, 1,
1.244809, -0.8406359, 2.065546, 1, 1, 1, 1, 1,
1.252945, 0.3876412, 0.1844634, 1, 1, 1, 1, 1,
1.2562, 0.6178094, -0.2462848, 0, 0, 1, 1, 1,
1.257945, -0.9472352, 3.004204, 1, 0, 0, 1, 1,
1.287613, 0.07929493, 1.930743, 1, 0, 0, 1, 1,
1.288297, 1.229508, 1.057868, 1, 0, 0, 1, 1,
1.291791, -0.6592426, 2.274097, 1, 0, 0, 1, 1,
1.294469, -0.5344156, 2.52373, 1, 0, 0, 1, 1,
1.296871, 0.01738972, 3.664714, 0, 0, 0, 1, 1,
1.310256, -0.3299421, 1.591995, 0, 0, 0, 1, 1,
1.320429, 2.24647, 1.924583, 0, 0, 0, 1, 1,
1.320629, -0.7691886, 3.390503, 0, 0, 0, 1, 1,
1.322544, 0.4850149, 0.5174366, 0, 0, 0, 1, 1,
1.354815, 1.063806, -0.1935792, 0, 0, 0, 1, 1,
1.355245, -1.120633, 2.912832, 0, 0, 0, 1, 1,
1.357787, 0.6141672, 2.135225, 1, 1, 1, 1, 1,
1.35796, -0.5850863, 3.067775, 1, 1, 1, 1, 1,
1.359536, 0.1990555, -0.5725288, 1, 1, 1, 1, 1,
1.366423, -0.1641923, 1.370298, 1, 1, 1, 1, 1,
1.368214, -0.6200194, 0.8651777, 1, 1, 1, 1, 1,
1.376177, 1.629645, 1.089576, 1, 1, 1, 1, 1,
1.382409, 0.5594413, 0.6036118, 1, 1, 1, 1, 1,
1.383016, 0.1412372, 1.539693, 1, 1, 1, 1, 1,
1.386265, 1.283881, 0.9641364, 1, 1, 1, 1, 1,
1.392718, -0.3965078, 3.179128, 1, 1, 1, 1, 1,
1.394761, 0.3723669, 1.299737, 1, 1, 1, 1, 1,
1.4045, -1.290896, -0.2320731, 1, 1, 1, 1, 1,
1.409861, -0.1295576, 2.247376, 1, 1, 1, 1, 1,
1.418808, -1.003001, 2.625195, 1, 1, 1, 1, 1,
1.419445, 0.7223325, 2.06027, 1, 1, 1, 1, 1,
1.422784, -0.6408839, 0.8928274, 0, 0, 1, 1, 1,
1.43022, 1.899477, 1.916686, 1, 0, 0, 1, 1,
1.431598, -0.04984122, 0.6972996, 1, 0, 0, 1, 1,
1.438159, 0.6316246, -0.6200919, 1, 0, 0, 1, 1,
1.438178, -0.359063, 3.259008, 1, 0, 0, 1, 1,
1.438808, 1.815267, 0.7383802, 1, 0, 0, 1, 1,
1.444408, 0.2180126, 2.509093, 0, 0, 0, 1, 1,
1.448397, -0.4340687, 1.112309, 0, 0, 0, 1, 1,
1.460423, 1.756876, -0.408611, 0, 0, 0, 1, 1,
1.468348, 0.1231554, 1.483263, 0, 0, 0, 1, 1,
1.475306, -0.489627, 3.396682, 0, 0, 0, 1, 1,
1.479181, -1.011235, 2.177982, 0, 0, 0, 1, 1,
1.488689, 2.080392, 0.7173066, 0, 0, 0, 1, 1,
1.49533, -0.8883162, 3.490561, 1, 1, 1, 1, 1,
1.501669, 0.6320806, 1.576001, 1, 1, 1, 1, 1,
1.516725, 0.3948414, 0.3691269, 1, 1, 1, 1, 1,
1.521539, -0.9214509, 1.776473, 1, 1, 1, 1, 1,
1.529988, -0.2177328, 1.222147, 1, 1, 1, 1, 1,
1.538564, -1.612687, 2.806886, 1, 1, 1, 1, 1,
1.54094, -0.1349261, 2.249463, 1, 1, 1, 1, 1,
1.550942, -1.449541, 2.126483, 1, 1, 1, 1, 1,
1.557538, 0.2538298, 2.120134, 1, 1, 1, 1, 1,
1.581544, -2.720927, 3.260888, 1, 1, 1, 1, 1,
1.620754, 0.8778211, 1.389985, 1, 1, 1, 1, 1,
1.648986, 0.8039122, 1.157084, 1, 1, 1, 1, 1,
1.649891, 1.914417, -0.4988625, 1, 1, 1, 1, 1,
1.65493, -0.4734765, 1.221751, 1, 1, 1, 1, 1,
1.682183, 1.442688, 0.4908491, 1, 1, 1, 1, 1,
1.687253, -0.0170765, 1.741522, 0, 0, 1, 1, 1,
1.696594, -0.9974985, 3.722236, 1, 0, 0, 1, 1,
1.699624, -0.473698, 3.643161, 1, 0, 0, 1, 1,
1.716705, -0.5633718, 2.701929, 1, 0, 0, 1, 1,
1.722795, 0.475212, 1.477273, 1, 0, 0, 1, 1,
1.775804, 0.08813518, 1.648927, 1, 0, 0, 1, 1,
1.77675, -0.002311347, 1.293038, 0, 0, 0, 1, 1,
1.80189, -0.3673159, 1.783885, 0, 0, 0, 1, 1,
1.836527, -0.7969701, 1.547829, 0, 0, 0, 1, 1,
1.847801, 0.2145467, 1.57834, 0, 0, 0, 1, 1,
1.853356, 0.9375916, 1.626445, 0, 0, 0, 1, 1,
1.86062, -0.8280103, 0.8913996, 0, 0, 0, 1, 1,
1.863036, -1.578599, 1.114083, 0, 0, 0, 1, 1,
1.884656, -0.8076583, 1.44002, 1, 1, 1, 1, 1,
1.895448, -0.1283558, 0.3015169, 1, 1, 1, 1, 1,
1.895637, -1.323871, 2.141022, 1, 1, 1, 1, 1,
1.909232, -0.5766518, 2.958181, 1, 1, 1, 1, 1,
1.933555, 0.9576585, 1.881613, 1, 1, 1, 1, 1,
1.93659, 0.6725848, 0.4091002, 1, 1, 1, 1, 1,
1.961302, -0.6542445, 2.462038, 1, 1, 1, 1, 1,
1.995506, -1.175654, 2.605139, 1, 1, 1, 1, 1,
2.012987, 0.01676304, 0.08144917, 1, 1, 1, 1, 1,
2.038483, -0.2629046, 1.282495, 1, 1, 1, 1, 1,
2.03894, -2.159655, 1.904467, 1, 1, 1, 1, 1,
2.06059, 0.552406, -0.099695, 1, 1, 1, 1, 1,
2.089667, 0.9203973, 0.9485725, 1, 1, 1, 1, 1,
2.092792, -2.591625, 2.933771, 1, 1, 1, 1, 1,
2.113574, 0.005473773, 1.915302, 1, 1, 1, 1, 1,
2.151641, 0.04308381, 4.01298, 0, 0, 1, 1, 1,
2.186826, 0.4181308, 2.35005, 1, 0, 0, 1, 1,
2.251967, -0.569839, 2.522683, 1, 0, 0, 1, 1,
2.252277, -0.412174, 2.764313, 1, 0, 0, 1, 1,
2.276371, -0.5956619, 0.4134864, 1, 0, 0, 1, 1,
2.29268, 0.3113404, 1.833984, 1, 0, 0, 1, 1,
2.300674, 1.190069, 0.7110861, 0, 0, 0, 1, 1,
2.358065, 1.956619, 0.2332513, 0, 0, 0, 1, 1,
2.359585, 0.3215185, 1.59164, 0, 0, 0, 1, 1,
2.374465, -0.9729507, 0.4780865, 0, 0, 0, 1, 1,
2.594426, -0.5485967, 1.996085, 0, 0, 0, 1, 1,
2.634733, 1.010418, 0.7688822, 0, 0, 0, 1, 1,
2.743162, 1.712668, 1.014841, 0, 0, 0, 1, 1,
2.758904, 0.3374476, 1.918965, 1, 1, 1, 1, 1,
2.848932, -0.5458655, 2.732711, 1, 1, 1, 1, 1,
2.953042, 0.8609788, 1.963361, 1, 1, 1, 1, 1,
2.965822, -0.8284932, 2.193654, 1, 1, 1, 1, 1,
3.004037, 0.4903378, 0.6884589, 1, 1, 1, 1, 1,
3.353521, 1.301985, -0.2888059, 1, 1, 1, 1, 1,
3.440604, 0.4635349, 0.4190742, 1, 1, 1, 1, 1
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
var radius = 9.569321;
var distance = 33.61184;
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
mvMatrix.translate( -0.192251, 0.161701, 0.09052277 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.61184);
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
