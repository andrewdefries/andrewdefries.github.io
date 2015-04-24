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
-3.300298, 0.1824672, -0.2876895, 1, 0, 0, 1,
-3.005218, -2.342755, -1.127832, 1, 0.007843138, 0, 1,
-2.937607, 0.0252161, 0.1608384, 1, 0.01176471, 0, 1,
-2.869037, -0.1627514, 0.1659616, 1, 0.01960784, 0, 1,
-2.778855, -0.3018439, -1.406166, 1, 0.02352941, 0, 1,
-2.620922, 1.48546, -1.449723, 1, 0.03137255, 0, 1,
-2.574813, -0.2644494, -1.818121, 1, 0.03529412, 0, 1,
-2.557903, -0.713764, -0.7424647, 1, 0.04313726, 0, 1,
-2.533533, -0.8151284, -1.780689, 1, 0.04705882, 0, 1,
-2.495849, 0.5219719, 0.5152878, 1, 0.05490196, 0, 1,
-2.479255, 0.6402943, -1.821381, 1, 0.05882353, 0, 1,
-2.434991, 0.6093537, 0.4990083, 1, 0.06666667, 0, 1,
-2.37047, -1.854972, -1.774414, 1, 0.07058824, 0, 1,
-2.354493, 1.359122, -2.317201, 1, 0.07843138, 0, 1,
-2.326452, -0.9684258, -2.016035, 1, 0.08235294, 0, 1,
-2.325034, 1.023835, -0.7055025, 1, 0.09019608, 0, 1,
-2.238255, -1.298549, -2.043596, 1, 0.09411765, 0, 1,
-2.212573, 0.2908526, -2.552063, 1, 0.1019608, 0, 1,
-2.186113, -0.1103166, -1.68668, 1, 0.1098039, 0, 1,
-2.113947, 0.5507952, -2.216471, 1, 0.1137255, 0, 1,
-2.081788, 0.09896298, -0.9245105, 1, 0.1215686, 0, 1,
-2.052769, 0.2412726, -1.741754, 1, 0.1254902, 0, 1,
-2.011743, -0.9530272, -1.72752, 1, 0.1333333, 0, 1,
-2.010026, -0.1789693, -2.831731, 1, 0.1372549, 0, 1,
-1.990313, 1.346828, -0.4657744, 1, 0.145098, 0, 1,
-1.984588, 0.303984, -1.491786, 1, 0.1490196, 0, 1,
-1.971572, 0.3224809, -0.8650826, 1, 0.1568628, 0, 1,
-1.953778, -0.5222941, -2.831506, 1, 0.1607843, 0, 1,
-1.942867, 2.028945, -0.1973448, 1, 0.1686275, 0, 1,
-1.940498, 0.1225853, -2.145054, 1, 0.172549, 0, 1,
-1.938641, -1.748428, -1.760521, 1, 0.1803922, 0, 1,
-1.928544, -2.443885, -2.874959, 1, 0.1843137, 0, 1,
-1.915069, -2.907432, -4.203247, 1, 0.1921569, 0, 1,
-1.871379, 0.3104975, -0.1345109, 1, 0.1960784, 0, 1,
-1.868093, 0.886256, -0.3751612, 1, 0.2039216, 0, 1,
-1.865987, 0.9651275, -0.830521, 1, 0.2117647, 0, 1,
-1.855555, 2.406476, -1.551589, 1, 0.2156863, 0, 1,
-1.821364, -1.197804, -1.780874, 1, 0.2235294, 0, 1,
-1.820152, -1.466469, -2.728722, 1, 0.227451, 0, 1,
-1.802201, -0.9833459, -1.810503, 1, 0.2352941, 0, 1,
-1.785346, -0.8337274, -1.65367, 1, 0.2392157, 0, 1,
-1.766026, 0.1939483, -3.156474, 1, 0.2470588, 0, 1,
-1.765894, -1.949406, -2.497856, 1, 0.2509804, 0, 1,
-1.746522, -0.875388, -1.526838, 1, 0.2588235, 0, 1,
-1.74613, -0.06757735, -3.330875, 1, 0.2627451, 0, 1,
-1.745955, -0.446539, -3.47411, 1, 0.2705882, 0, 1,
-1.743228, -0.3830209, -2.964479, 1, 0.2745098, 0, 1,
-1.738438, -1.091645, -1.795394, 1, 0.282353, 0, 1,
-1.714508, 2.433825, -0.5596156, 1, 0.2862745, 0, 1,
-1.714123, 0.06070572, -0.6664698, 1, 0.2941177, 0, 1,
-1.713792, -0.06436575, -4.408887, 1, 0.3019608, 0, 1,
-1.704075, 1.538466, -0.8435928, 1, 0.3058824, 0, 1,
-1.700267, -1.466808, -2.09017, 1, 0.3137255, 0, 1,
-1.697152, 0.7772107, -0.2060768, 1, 0.3176471, 0, 1,
-1.69563, 1.167573, -0.4003206, 1, 0.3254902, 0, 1,
-1.691992, 1.044441, -1.22206, 1, 0.3294118, 0, 1,
-1.679089, -0.6463763, -2.629632, 1, 0.3372549, 0, 1,
-1.67579, -1.867394, -2.678001, 1, 0.3411765, 0, 1,
-1.672182, -0.1778178, -2.692522, 1, 0.3490196, 0, 1,
-1.671948, -1.347591, -3.377388, 1, 0.3529412, 0, 1,
-1.664044, -1.082069, -1.941975, 1, 0.3607843, 0, 1,
-1.642278, -1.577974, -1.593393, 1, 0.3647059, 0, 1,
-1.613929, 1.19768, -1.945435, 1, 0.372549, 0, 1,
-1.605753, 0.525831, -1.778551, 1, 0.3764706, 0, 1,
-1.600637, 1.639843, 0.973031, 1, 0.3843137, 0, 1,
-1.592954, -0.08779313, -0.9779189, 1, 0.3882353, 0, 1,
-1.591631, 0.1719885, -0.5143289, 1, 0.3960784, 0, 1,
-1.55411, 0.1880751, -0.5413669, 1, 0.4039216, 0, 1,
-1.542267, -1.084086, -3.727635, 1, 0.4078431, 0, 1,
-1.538811, -0.5937051, -1.192512, 1, 0.4156863, 0, 1,
-1.531952, 0.2562287, -2.920479, 1, 0.4196078, 0, 1,
-1.520946, 1.94096, -0.5080118, 1, 0.427451, 0, 1,
-1.515611, 0.6070679, -1.298571, 1, 0.4313726, 0, 1,
-1.504069, -0.3085358, -1.579161, 1, 0.4392157, 0, 1,
-1.503908, 0.8366306, -0.5676138, 1, 0.4431373, 0, 1,
-1.484667, -0.4490079, -2.702034, 1, 0.4509804, 0, 1,
-1.484021, -0.2415775, -1.742438, 1, 0.454902, 0, 1,
-1.471642, -0.5564082, -1.421176, 1, 0.4627451, 0, 1,
-1.465544, 0.5409397, -0.4597583, 1, 0.4666667, 0, 1,
-1.461766, 2.902628, -1.333549, 1, 0.4745098, 0, 1,
-1.461077, 0.4230264, -2.689514, 1, 0.4784314, 0, 1,
-1.460071, 1.506079, -2.302746, 1, 0.4862745, 0, 1,
-1.457124, 0.5873099, -1.152722, 1, 0.4901961, 0, 1,
-1.44636, 1.794029, -1.889619, 1, 0.4980392, 0, 1,
-1.439812, -1.146313, -3.126538, 1, 0.5058824, 0, 1,
-1.437949, 0.3982368, -1.384657, 1, 0.509804, 0, 1,
-1.436201, -0.2757589, -2.261637, 1, 0.5176471, 0, 1,
-1.426846, -0.03151191, -0.9897898, 1, 0.5215687, 0, 1,
-1.42557, -0.6539675, -2.290567, 1, 0.5294118, 0, 1,
-1.414582, -1.070595, -1.25515, 1, 0.5333334, 0, 1,
-1.410682, 0.6447997, -1.028173, 1, 0.5411765, 0, 1,
-1.404397, 1.547887, -1.156156, 1, 0.5450981, 0, 1,
-1.397558, 0.3412578, -1.809056, 1, 0.5529412, 0, 1,
-1.397193, -0.6197786, -1.967324, 1, 0.5568628, 0, 1,
-1.392197, 0.1553928, -0.6280609, 1, 0.5647059, 0, 1,
-1.39183, -0.9167841, -1.934519, 1, 0.5686275, 0, 1,
-1.389485, 1.143182, -1.317188, 1, 0.5764706, 0, 1,
-1.388041, -1.924894, -0.9952924, 1, 0.5803922, 0, 1,
-1.386433, 1.072265, -0.1886016, 1, 0.5882353, 0, 1,
-1.378606, 1.06343, -0.8016958, 1, 0.5921569, 0, 1,
-1.371335, -0.5309465, -2.024788, 1, 0.6, 0, 1,
-1.361757, 1.798569, -2.173476, 1, 0.6078432, 0, 1,
-1.360669, -1.818618, -1.380528, 1, 0.6117647, 0, 1,
-1.342551, 0.9435922, -1.182367, 1, 0.6196079, 0, 1,
-1.339855, 0.1880858, -2.061815, 1, 0.6235294, 0, 1,
-1.339617, -0.8880371, -2.467614, 1, 0.6313726, 0, 1,
-1.335755, 0.2872942, -1.45196, 1, 0.6352941, 0, 1,
-1.334015, -0.3038904, -1.698501, 1, 0.6431373, 0, 1,
-1.327582, 0.1649565, -0.002168174, 1, 0.6470588, 0, 1,
-1.321828, 3.046852, -2.200014, 1, 0.654902, 0, 1,
-1.320225, -0.5499716, -2.188025, 1, 0.6588235, 0, 1,
-1.319504, -0.6576478, -1.176036, 1, 0.6666667, 0, 1,
-1.316182, 1.391048, 0.01761744, 1, 0.6705883, 0, 1,
-1.313802, -1.017156, -1.543541, 1, 0.6784314, 0, 1,
-1.310109, -0.0097737, -3.014154, 1, 0.682353, 0, 1,
-1.307658, 1.332159, -0.2706594, 1, 0.6901961, 0, 1,
-1.301654, 1.216635, -1.036904, 1, 0.6941177, 0, 1,
-1.298137, 0.5281581, -0.2975933, 1, 0.7019608, 0, 1,
-1.28812, -0.3319002, -1.369004, 1, 0.7098039, 0, 1,
-1.287547, -1.272769, -1.67313, 1, 0.7137255, 0, 1,
-1.278521, 0.1418588, -0.562834, 1, 0.7215686, 0, 1,
-1.276883, 1.140077, -0.8746151, 1, 0.7254902, 0, 1,
-1.273733, 0.1903741, -2.137779, 1, 0.7333333, 0, 1,
-1.26871, -0.1796772, -2.87471, 1, 0.7372549, 0, 1,
-1.265619, -1.042074, -2.502491, 1, 0.7450981, 0, 1,
-1.259477, -0.07114364, -1.07266, 1, 0.7490196, 0, 1,
-1.259267, 0.121691, -2.798766, 1, 0.7568628, 0, 1,
-1.254112, -0.1941456, -0.8732503, 1, 0.7607843, 0, 1,
-1.24845, 0.6844383, -0.4939095, 1, 0.7686275, 0, 1,
-1.239075, 0.88679, -1.330668, 1, 0.772549, 0, 1,
-1.232908, 0.4580692, -2.566329, 1, 0.7803922, 0, 1,
-1.230927, 1.505087, -1.10177, 1, 0.7843137, 0, 1,
-1.219242, -1.131398, -2.598798, 1, 0.7921569, 0, 1,
-1.198139, 1.494453, -1.085081, 1, 0.7960784, 0, 1,
-1.193472, 1.90037, 0.5107059, 1, 0.8039216, 0, 1,
-1.179554, -0.1865278, -2.501592, 1, 0.8117647, 0, 1,
-1.174382, -1.306178, -3.384306, 1, 0.8156863, 0, 1,
-1.16889, -0.06737674, -0.7670785, 1, 0.8235294, 0, 1,
-1.165607, -1.688424, -2.860671, 1, 0.827451, 0, 1,
-1.164269, 0.7113881, -2.405705, 1, 0.8352941, 0, 1,
-1.163735, -1.504485, -4.096379, 1, 0.8392157, 0, 1,
-1.160173, -1.642663, -1.969457, 1, 0.8470588, 0, 1,
-1.148902, -0.6266102, -1.389938, 1, 0.8509804, 0, 1,
-1.142553, -0.4181699, -1.697596, 1, 0.8588235, 0, 1,
-1.141013, -0.7361112, -2.629416, 1, 0.8627451, 0, 1,
-1.137111, 1.592741, -1.903243, 1, 0.8705882, 0, 1,
-1.136264, -2.179317, -2.897814, 1, 0.8745098, 0, 1,
-1.126783, 1.135344, -1.450908, 1, 0.8823529, 0, 1,
-1.122471, 0.1852945, -1.135031, 1, 0.8862745, 0, 1,
-1.120991, -0.007844052, -2.132911, 1, 0.8941177, 0, 1,
-1.113087, 0.3426724, 0.8478131, 1, 0.8980392, 0, 1,
-1.110899, -0.08518879, -0.7270479, 1, 0.9058824, 0, 1,
-1.1086, -1.728511, -2.111229, 1, 0.9137255, 0, 1,
-1.108336, -1.157295, -2.201756, 1, 0.9176471, 0, 1,
-1.099004, -1.292667, -2.884787, 1, 0.9254902, 0, 1,
-1.098339, 1.290918, -3.414389, 1, 0.9294118, 0, 1,
-1.095391, -0.1574773, -1.424404, 1, 0.9372549, 0, 1,
-1.091953, 0.4535391, -1.774009, 1, 0.9411765, 0, 1,
-1.090531, 1.550338, -2.01549, 1, 0.9490196, 0, 1,
-1.090406, -0.2402533, -3.11508, 1, 0.9529412, 0, 1,
-1.089847, 0.9569521, 0.8363153, 1, 0.9607843, 0, 1,
-1.089582, -1.446553, -2.016467, 1, 0.9647059, 0, 1,
-1.089237, 0.01583752, -1.735242, 1, 0.972549, 0, 1,
-1.082797, -1.383219, -3.40611, 1, 0.9764706, 0, 1,
-1.082715, 0.2745471, 0.2003809, 1, 0.9843137, 0, 1,
-1.067383, -1.253482, -2.428705, 1, 0.9882353, 0, 1,
-1.066828, 0.3928847, -2.759872, 1, 0.9960784, 0, 1,
-1.064429, -0.2974828, -0.04592758, 0.9960784, 1, 0, 1,
-1.058869, 1.080078, 0.4037091, 0.9921569, 1, 0, 1,
-1.055996, -1.166092, -3.433371, 0.9843137, 1, 0, 1,
-1.043057, -0.3185475, -1.046157, 0.9803922, 1, 0, 1,
-1.04116, 0.3711984, -2.558026, 0.972549, 1, 0, 1,
-1.037973, 0.6310307, -2.114016, 0.9686275, 1, 0, 1,
-1.030739, -1.710392, -4.075341, 0.9607843, 1, 0, 1,
-1.030385, 0.8965042, 1.091558, 0.9568627, 1, 0, 1,
-1.029188, 0.4477237, -1.381863, 0.9490196, 1, 0, 1,
-1.024477, 1.112125, -0.7933269, 0.945098, 1, 0, 1,
-1.020964, 0.1880702, -2.063703, 0.9372549, 1, 0, 1,
-1.018643, -1.847585, -4.787964, 0.9333333, 1, 0, 1,
-1.00553, -1.774142, -3.521819, 0.9254902, 1, 0, 1,
-0.9982784, 2.105728, -1.684794, 0.9215686, 1, 0, 1,
-0.9972911, -1.108251, -2.558654, 0.9137255, 1, 0, 1,
-0.9908685, -1.065207, -2.912733, 0.9098039, 1, 0, 1,
-0.9900811, 2.25683, 0.1139103, 0.9019608, 1, 0, 1,
-0.9893966, 0.835272, -1.492105, 0.8941177, 1, 0, 1,
-0.9879773, 0.2887601, -0.5018227, 0.8901961, 1, 0, 1,
-0.9815322, 0.08212811, 0.6259485, 0.8823529, 1, 0, 1,
-0.9804426, -0.325573, -2.533535, 0.8784314, 1, 0, 1,
-0.9790835, 0.04245052, -1.163444, 0.8705882, 1, 0, 1,
-0.9720055, -0.2018944, -1.286246, 0.8666667, 1, 0, 1,
-0.9659563, -0.03887298, -2.837332, 0.8588235, 1, 0, 1,
-0.9540378, -1.08625, -2.264231, 0.854902, 1, 0, 1,
-0.9539676, 0.4323117, -1.598025, 0.8470588, 1, 0, 1,
-0.9472452, -1.074723, -2.447546, 0.8431373, 1, 0, 1,
-0.9462574, 0.2379906, -2.051477, 0.8352941, 1, 0, 1,
-0.9447498, -0.5664305, -2.623563, 0.8313726, 1, 0, 1,
-0.9447057, -0.1850792, -0.8359439, 0.8235294, 1, 0, 1,
-0.9388625, -0.1953295, -1.686614, 0.8196079, 1, 0, 1,
-0.938763, -1.201833, -2.682796, 0.8117647, 1, 0, 1,
-0.9362145, 1.041501, -0.9078689, 0.8078431, 1, 0, 1,
-0.9299914, 1.428348, -2.133904, 0.8, 1, 0, 1,
-0.9167927, -0.8718393, -3.238794, 0.7921569, 1, 0, 1,
-0.9129449, -0.1329097, -3.078549, 0.7882353, 1, 0, 1,
-0.9113792, 1.582934, -1.111596, 0.7803922, 1, 0, 1,
-0.9058415, 0.8825019, -0.1371965, 0.7764706, 1, 0, 1,
-0.9006718, -0.5217491, -2.079255, 0.7686275, 1, 0, 1,
-0.8983068, 0.7702248, -1.178691, 0.7647059, 1, 0, 1,
-0.8932148, -0.2280591, -1.886358, 0.7568628, 1, 0, 1,
-0.8930175, 0.1136755, -0.1500543, 0.7529412, 1, 0, 1,
-0.8928947, 1.53749, -0.3843568, 0.7450981, 1, 0, 1,
-0.879866, -0.3683094, -1.899838, 0.7411765, 1, 0, 1,
-0.8759193, 0.8191879, 0.2577893, 0.7333333, 1, 0, 1,
-0.8757544, 0.8394826, -1.278373, 0.7294118, 1, 0, 1,
-0.8711119, -0.06221979, -1.420339, 0.7215686, 1, 0, 1,
-0.869393, 0.8580629, -1.187849, 0.7176471, 1, 0, 1,
-0.8606548, 0.8002036, -0.6233938, 0.7098039, 1, 0, 1,
-0.8603887, 0.4122318, -1.618413, 0.7058824, 1, 0, 1,
-0.8577361, 0.335046, -2.787666, 0.6980392, 1, 0, 1,
-0.8576219, 0.1773768, -1.733592, 0.6901961, 1, 0, 1,
-0.8549843, 1.340931, 0.550039, 0.6862745, 1, 0, 1,
-0.848929, -1.148129, -2.926084, 0.6784314, 1, 0, 1,
-0.8462445, 0.6985701, -1.445279, 0.6745098, 1, 0, 1,
-0.8462198, 0.549885, 0.7624788, 0.6666667, 1, 0, 1,
-0.8446285, -0.201288, -2.897583, 0.6627451, 1, 0, 1,
-0.8380386, 0.4893688, 1.802973, 0.654902, 1, 0, 1,
-0.8366125, 0.9289603, -0.2249326, 0.6509804, 1, 0, 1,
-0.8359783, 1.300718, -0.9512161, 0.6431373, 1, 0, 1,
-0.8352302, 0.5929947, 0.05880871, 0.6392157, 1, 0, 1,
-0.8344837, -0.02035257, -0.01864834, 0.6313726, 1, 0, 1,
-0.8335018, 2.090334, -0.5691152, 0.627451, 1, 0, 1,
-0.8299653, -0.8218715, -1.664642, 0.6196079, 1, 0, 1,
-0.8262934, -1.216536, -1.642347, 0.6156863, 1, 0, 1,
-0.822286, -0.5487672, -4.272712, 0.6078432, 1, 0, 1,
-0.8130112, 1.736996, -0.9552879, 0.6039216, 1, 0, 1,
-0.8104144, 0.3884372, -0.6142265, 0.5960785, 1, 0, 1,
-0.8084742, 0.4875864, -1.988041, 0.5882353, 1, 0, 1,
-0.8009396, 0.2441459, -3.001317, 0.5843138, 1, 0, 1,
-0.7988436, 0.6300294, -0.4880267, 0.5764706, 1, 0, 1,
-0.7954348, 0.8832269, 0.02183238, 0.572549, 1, 0, 1,
-0.7911275, -0.1752081, -1.939052, 0.5647059, 1, 0, 1,
-0.7903443, -1.658628, -2.233273, 0.5607843, 1, 0, 1,
-0.7795993, -0.984317, -2.846843, 0.5529412, 1, 0, 1,
-0.7753229, -2.112795, -2.574157, 0.5490196, 1, 0, 1,
-0.7730462, 1.287724, -0.2004787, 0.5411765, 1, 0, 1,
-0.7676766, 1.103604, 0.5611628, 0.5372549, 1, 0, 1,
-0.7573507, -0.1914778, -0.9393459, 0.5294118, 1, 0, 1,
-0.7510352, 0.1192086, -0.914686, 0.5254902, 1, 0, 1,
-0.7503614, -0.6162342, -3.455446, 0.5176471, 1, 0, 1,
-0.7483994, 0.4711068, -0.2840622, 0.5137255, 1, 0, 1,
-0.7393813, 0.321812, -2.270253, 0.5058824, 1, 0, 1,
-0.7377358, -1.039848, -4.94791, 0.5019608, 1, 0, 1,
-0.7325518, -1.61796, -1.805539, 0.4941176, 1, 0, 1,
-0.7271338, 0.9011475, -0.6098825, 0.4862745, 1, 0, 1,
-0.7245913, 0.7670856, -1.952262, 0.4823529, 1, 0, 1,
-0.7244888, -0.4542741, -1.273658, 0.4745098, 1, 0, 1,
-0.7191561, 0.7569814, 0.2490891, 0.4705882, 1, 0, 1,
-0.7164904, -1.225034, -2.52064, 0.4627451, 1, 0, 1,
-0.7148896, -0.07600597, -1.715253, 0.4588235, 1, 0, 1,
-0.7144611, 0.4298978, 0.006821066, 0.4509804, 1, 0, 1,
-0.7135063, -0.115595, -1.230147, 0.4470588, 1, 0, 1,
-0.71243, -0.302493, -2.625431, 0.4392157, 1, 0, 1,
-0.7058945, -0.405784, -0.3798313, 0.4352941, 1, 0, 1,
-0.7046043, 0.3308851, -1.826219, 0.427451, 1, 0, 1,
-0.7044235, 0.7303122, 0.08719879, 0.4235294, 1, 0, 1,
-0.7009087, 0.1536154, -0.6274784, 0.4156863, 1, 0, 1,
-0.6852525, 0.48733, 0.5609244, 0.4117647, 1, 0, 1,
-0.6852136, 1.210353, -0.7482841, 0.4039216, 1, 0, 1,
-0.6850718, -0.4183771, -1.981626, 0.3960784, 1, 0, 1,
-0.6803653, 0.6598812, -0.5940532, 0.3921569, 1, 0, 1,
-0.6740029, -0.3300444, -3.01103, 0.3843137, 1, 0, 1,
-0.6737476, -0.4152403, -2.103627, 0.3803922, 1, 0, 1,
-0.6723566, -1.724072, -2.519443, 0.372549, 1, 0, 1,
-0.6710691, 0.6281027, -1.446554, 0.3686275, 1, 0, 1,
-0.6688365, -0.5477552, -2.975863, 0.3607843, 1, 0, 1,
-0.6678654, -0.03673734, -0.9871087, 0.3568628, 1, 0, 1,
-0.6608561, -0.1492757, -1.425274, 0.3490196, 1, 0, 1,
-0.6603748, -0.4546742, -2.852181, 0.345098, 1, 0, 1,
-0.6574653, 0.2724589, -0.7040667, 0.3372549, 1, 0, 1,
-0.656117, 0.5486975, 0.1815473, 0.3333333, 1, 0, 1,
-0.6523886, -0.902908, -1.913017, 0.3254902, 1, 0, 1,
-0.6498355, 1.643741, -0.8489945, 0.3215686, 1, 0, 1,
-0.644085, 0.3186088, -2.708247, 0.3137255, 1, 0, 1,
-0.6430771, 0.677062, -0.3379641, 0.3098039, 1, 0, 1,
-0.6416001, 0.1559518, -1.771814, 0.3019608, 1, 0, 1,
-0.6411869, -0.6457822, -1.939441, 0.2941177, 1, 0, 1,
-0.6325384, 0.8245254, -0.02204788, 0.2901961, 1, 0, 1,
-0.6296566, 0.7364524, -3.114404, 0.282353, 1, 0, 1,
-0.6266279, -0.1806239, -0.5489781, 0.2784314, 1, 0, 1,
-0.6214594, 0.431762, -2.410654, 0.2705882, 1, 0, 1,
-0.6139839, -1.322677, -2.28732, 0.2666667, 1, 0, 1,
-0.6103669, -0.4370161, -1.755553, 0.2588235, 1, 0, 1,
-0.6078732, 0.1496624, -1.169984, 0.254902, 1, 0, 1,
-0.6049684, 0.7905238, -1.307772, 0.2470588, 1, 0, 1,
-0.6028415, 0.7518932, -1.048113, 0.2431373, 1, 0, 1,
-0.6012964, 0.1465607, -1.430766, 0.2352941, 1, 0, 1,
-0.600837, -0.002207677, -1.94804, 0.2313726, 1, 0, 1,
-0.5987542, 0.7483428, 0.2136691, 0.2235294, 1, 0, 1,
-0.5972617, -0.9125009, -1.008652, 0.2196078, 1, 0, 1,
-0.5924955, 0.845263, -2.588078, 0.2117647, 1, 0, 1,
-0.592073, -0.8516741, -3.239927, 0.2078431, 1, 0, 1,
-0.5914971, 0.9383035, -0.1356657, 0.2, 1, 0, 1,
-0.5845416, -0.55629, -2.759869, 0.1921569, 1, 0, 1,
-0.5819876, -0.9004141, -2.320063, 0.1882353, 1, 0, 1,
-0.5802681, -0.2222109, -1.04634, 0.1803922, 1, 0, 1,
-0.5799941, 1.503362, 0.7347964, 0.1764706, 1, 0, 1,
-0.5764307, -1.083955, -1.035338, 0.1686275, 1, 0, 1,
-0.5736828, -1.340651, -4.051488, 0.1647059, 1, 0, 1,
-0.5701563, -0.2709325, -2.344074, 0.1568628, 1, 0, 1,
-0.5677443, 1.54338, -1.521877, 0.1529412, 1, 0, 1,
-0.5617546, -0.6341705, -2.742587, 0.145098, 1, 0, 1,
-0.55997, 0.8182108, -0.3248118, 0.1411765, 1, 0, 1,
-0.5591444, -0.07261585, -1.930889, 0.1333333, 1, 0, 1,
-0.5564468, -0.3488402, -2.773909, 0.1294118, 1, 0, 1,
-0.5545356, -0.1392417, 0.2402005, 0.1215686, 1, 0, 1,
-0.553721, -0.01924164, -1.556537, 0.1176471, 1, 0, 1,
-0.5508505, -1.635631, -1.953042, 0.1098039, 1, 0, 1,
-0.5508057, 0.2527759, 0.4341858, 0.1058824, 1, 0, 1,
-0.5435486, 0.9582418, -0.4581631, 0.09803922, 1, 0, 1,
-0.5412586, 0.3590847, -0.8569305, 0.09019608, 1, 0, 1,
-0.5388573, 1.059518, -1.392766, 0.08627451, 1, 0, 1,
-0.5364183, -0.3514872, -2.444711, 0.07843138, 1, 0, 1,
-0.5330835, -0.3134625, -0.7685085, 0.07450981, 1, 0, 1,
-0.5327479, -0.8291131, -1.795556, 0.06666667, 1, 0, 1,
-0.529786, 0.4118923, -0.09237593, 0.0627451, 1, 0, 1,
-0.5270011, 0.9636158, -1.835767, 0.05490196, 1, 0, 1,
-0.5263618, 0.7063408, -0.340144, 0.05098039, 1, 0, 1,
-0.5262918, 1.818265, -0.005118101, 0.04313726, 1, 0, 1,
-0.5132102, 0.9636585, 0.07221573, 0.03921569, 1, 0, 1,
-0.5128048, -0.1752268, -3.163983, 0.03137255, 1, 0, 1,
-0.5089214, 1.618839, -1.209732, 0.02745098, 1, 0, 1,
-0.5076716, -1.925359, -3.749673, 0.01960784, 1, 0, 1,
-0.5024116, -2.832498, -1.702633, 0.01568628, 1, 0, 1,
-0.4980052, 1.091612, -1.132109, 0.007843138, 1, 0, 1,
-0.4892813, 0.3214928, -0.3338008, 0.003921569, 1, 0, 1,
-0.486837, 1.237606, -1.114495, 0, 1, 0.003921569, 1,
-0.4820154, -0.506733, -1.350145, 0, 1, 0.01176471, 1,
-0.4773408, 0.2203331, -0.2731135, 0, 1, 0.01568628, 1,
-0.475133, -0.9892154, -3.87501, 0, 1, 0.02352941, 1,
-0.4730107, 0.1679782, -2.322496, 0, 1, 0.02745098, 1,
-0.4693955, -0.01586702, -1.657293, 0, 1, 0.03529412, 1,
-0.4688109, -0.05096899, -1.221977, 0, 1, 0.03921569, 1,
-0.4609552, 1.299441, -0.5833391, 0, 1, 0.04705882, 1,
-0.4593927, 0.5679451, -1.360404, 0, 1, 0.05098039, 1,
-0.4567029, 1.165917, 1.525936, 0, 1, 0.05882353, 1,
-0.4564952, 1.136716, -1.076138, 0, 1, 0.0627451, 1,
-0.4535537, -1.821644, -4.783906, 0, 1, 0.07058824, 1,
-0.4505391, -0.8630615, -3.674081, 0, 1, 0.07450981, 1,
-0.4495041, -0.1566101, -1.124213, 0, 1, 0.08235294, 1,
-0.4482346, -0.8435744, -0.8264956, 0, 1, 0.08627451, 1,
-0.4471498, 2.303243, -0.5587583, 0, 1, 0.09411765, 1,
-0.4470278, -0.388807, -2.393244, 0, 1, 0.1019608, 1,
-0.4467697, 0.1637201, -2.299739, 0, 1, 0.1058824, 1,
-0.4443585, 1.050209, 0.1521339, 0, 1, 0.1137255, 1,
-0.4403259, 1.343194, -0.4251453, 0, 1, 0.1176471, 1,
-0.4401003, 0.8138147, -0.5820289, 0, 1, 0.1254902, 1,
-0.4386109, -0.2680044, -2.249154, 0, 1, 0.1294118, 1,
-0.4375932, 0.6365519, -1.045849, 0, 1, 0.1372549, 1,
-0.4271997, 0.06439622, -1.721237, 0, 1, 0.1411765, 1,
-0.4211296, 1.962331, 0.9904883, 0, 1, 0.1490196, 1,
-0.4208359, 0.5214942, 0.4694754, 0, 1, 0.1529412, 1,
-0.4078232, 1.679805, 2.676376, 0, 1, 0.1607843, 1,
-0.4071443, -0.2558497, -0.946671, 0, 1, 0.1647059, 1,
-0.4048835, 0.2351519, -2.161872, 0, 1, 0.172549, 1,
-0.4015357, 1.181071, -1.431975, 0, 1, 0.1764706, 1,
-0.3992416, -0.5599433, -2.62411, 0, 1, 0.1843137, 1,
-0.3984114, 1.41484, -0.531049, 0, 1, 0.1882353, 1,
-0.3944756, 0.7641616, -1.188402, 0, 1, 0.1960784, 1,
-0.3928116, 0.4518209, 1.001276, 0, 1, 0.2039216, 1,
-0.390359, 0.9186519, -1.164872, 0, 1, 0.2078431, 1,
-0.3862957, 1.15049, 0.2517971, 0, 1, 0.2156863, 1,
-0.3845396, 0.483402, 0.6264926, 0, 1, 0.2196078, 1,
-0.3844084, 1.178442, 0.1742115, 0, 1, 0.227451, 1,
-0.3775119, 0.3875008, -1.635481, 0, 1, 0.2313726, 1,
-0.3762183, 0.2548573, -1.644243, 0, 1, 0.2392157, 1,
-0.3740279, 0.6345644, 0.5832829, 0, 1, 0.2431373, 1,
-0.3685267, -1.710375, -4.143066, 0, 1, 0.2509804, 1,
-0.3670355, 0.5847999, 0.2881297, 0, 1, 0.254902, 1,
-0.3666351, -1.170893, -3.207432, 0, 1, 0.2627451, 1,
-0.3664865, -2.515115, -3.334894, 0, 1, 0.2666667, 1,
-0.3653483, -0.8918069, -1.872682, 0, 1, 0.2745098, 1,
-0.3604065, 1.594628, 0.3766837, 0, 1, 0.2784314, 1,
-0.3602173, -1.005605, -2.062376, 0, 1, 0.2862745, 1,
-0.3596673, -1.634109, -2.998267, 0, 1, 0.2901961, 1,
-0.3589637, 0.4911621, -1.033117, 0, 1, 0.2980392, 1,
-0.3579431, 0.7795977, -2.560735, 0, 1, 0.3058824, 1,
-0.3545692, 1.488781, -0.7859783, 0, 1, 0.3098039, 1,
-0.3535192, -1.053601, -1.552387, 0, 1, 0.3176471, 1,
-0.3494155, -0.5572765, -2.72071, 0, 1, 0.3215686, 1,
-0.3460594, -0.8187988, -4.067572, 0, 1, 0.3294118, 1,
-0.3425078, 0.288259, -1.131812, 0, 1, 0.3333333, 1,
-0.341027, -0.3066713, -1.643399, 0, 1, 0.3411765, 1,
-0.3385661, 1.075816, 0.7160215, 0, 1, 0.345098, 1,
-0.3372814, 2.286307, 0.6188606, 0, 1, 0.3529412, 1,
-0.3362357, -0.3295374, -1.5152, 0, 1, 0.3568628, 1,
-0.3334979, -0.9325571, -3.852735, 0, 1, 0.3647059, 1,
-0.3318762, 1.090409, -0.9833608, 0, 1, 0.3686275, 1,
-0.327271, 0.6943046, -0.645166, 0, 1, 0.3764706, 1,
-0.3241226, -0.3384717, -3.489751, 0, 1, 0.3803922, 1,
-0.3233381, 0.07554258, -2.264272, 0, 1, 0.3882353, 1,
-0.3229204, 1.077239, -0.4707088, 0, 1, 0.3921569, 1,
-0.3151057, 0.9485939, -1.007527, 0, 1, 0.4, 1,
-0.3136721, -0.3462645, -0.970643, 0, 1, 0.4078431, 1,
-0.3135038, 0.1638523, -0.7045404, 0, 1, 0.4117647, 1,
-0.307421, -0.2625515, -1.33479, 0, 1, 0.4196078, 1,
-0.30385, -1.431053, -3.886628, 0, 1, 0.4235294, 1,
-0.3031844, -0.8857757, -2.977651, 0, 1, 0.4313726, 1,
-0.3029588, -0.7708299, -2.998435, 0, 1, 0.4352941, 1,
-0.3002183, -0.03892574, -2.004172, 0, 1, 0.4431373, 1,
-0.2964547, -0.2845263, -2.224004, 0, 1, 0.4470588, 1,
-0.2935535, -0.2351197, -2.540324, 0, 1, 0.454902, 1,
-0.2933558, -0.07615109, -1.092086, 0, 1, 0.4588235, 1,
-0.2911784, 0.04228343, -1.8852, 0, 1, 0.4666667, 1,
-0.2894596, -1.060335, -2.534622, 0, 1, 0.4705882, 1,
-0.2871827, -2.041104, -2.957336, 0, 1, 0.4784314, 1,
-0.2859406, 0.3804364, -0.4780411, 0, 1, 0.4823529, 1,
-0.281143, 1.749149, 0.7582362, 0, 1, 0.4901961, 1,
-0.272741, -1.069376, -3.265113, 0, 1, 0.4941176, 1,
-0.2680563, -0.9951131, -3.358066, 0, 1, 0.5019608, 1,
-0.264542, -0.4465363, -2.281412, 0, 1, 0.509804, 1,
-0.2633614, 1.769012, 0.6763108, 0, 1, 0.5137255, 1,
-0.2628372, 0.8629627, -0.04884568, 0, 1, 0.5215687, 1,
-0.2555141, 1.443841, 0.166824, 0, 1, 0.5254902, 1,
-0.2552146, -0.3170753, -3.377823, 0, 1, 0.5333334, 1,
-0.2543344, 0.3110272, -0.7407867, 0, 1, 0.5372549, 1,
-0.2534442, -0.1347959, -3.428514, 0, 1, 0.5450981, 1,
-0.2527761, 0.08081751, -0.3010916, 0, 1, 0.5490196, 1,
-0.2479087, 1.417112, 0.4234866, 0, 1, 0.5568628, 1,
-0.2456576, -0.1877785, -3.261948, 0, 1, 0.5607843, 1,
-0.2450411, 0.774747, -0.744564, 0, 1, 0.5686275, 1,
-0.2441783, 0.09052805, -1.633979, 0, 1, 0.572549, 1,
-0.2407512, 1.210479, -0.9187263, 0, 1, 0.5803922, 1,
-0.2388071, 0.4325467, -1.025137, 0, 1, 0.5843138, 1,
-0.2378311, 1.337765, -1.436634, 0, 1, 0.5921569, 1,
-0.2341421, -1.27659, -4.129654, 0, 1, 0.5960785, 1,
-0.2262096, 0.1933903, 0.3244918, 0, 1, 0.6039216, 1,
-0.2183656, 0.6654474, 1.033441, 0, 1, 0.6117647, 1,
-0.2136323, 0.3423521, -1.111672, 0, 1, 0.6156863, 1,
-0.2102114, 0.6318472, -0.3141779, 0, 1, 0.6235294, 1,
-0.2085383, -0.6626862, -3.88084, 0, 1, 0.627451, 1,
-0.2065163, -0.7104029, -2.17778, 0, 1, 0.6352941, 1,
-0.2037583, -0.4274926, -1.526956, 0, 1, 0.6392157, 1,
-0.2037419, 0.6483536, -0.5676758, 0, 1, 0.6470588, 1,
-0.1993212, 0.2803755, -0.3807437, 0, 1, 0.6509804, 1,
-0.1984964, 0.521991, -0.2730033, 0, 1, 0.6588235, 1,
-0.1960585, -0.759189, -2.668075, 0, 1, 0.6627451, 1,
-0.1936827, -1.488701, -1.21005, 0, 1, 0.6705883, 1,
-0.1925146, -0.5959548, -2.270688, 0, 1, 0.6745098, 1,
-0.1921262, -0.1342995, -1.14981, 0, 1, 0.682353, 1,
-0.1914491, 0.8918565, 0.06613116, 0, 1, 0.6862745, 1,
-0.190193, -0.06313961, -4.206086, 0, 1, 0.6941177, 1,
-0.1870534, 1.32178, 0.3550613, 0, 1, 0.7019608, 1,
-0.1861263, -1.393834, -0.9238805, 0, 1, 0.7058824, 1,
-0.1808393, -1.15313, -2.475788, 0, 1, 0.7137255, 1,
-0.1739416, 1.30731, -2.421433, 0, 1, 0.7176471, 1,
-0.1728044, 1.075749, 1.200009, 0, 1, 0.7254902, 1,
-0.1705938, -0.9412977, -4.52526, 0, 1, 0.7294118, 1,
-0.1684054, 1.131889, 0.7920413, 0, 1, 0.7372549, 1,
-0.1664291, 1.085472, 0.5614719, 0, 1, 0.7411765, 1,
-0.1631259, -0.5599985, -1.44047, 0, 1, 0.7490196, 1,
-0.1611215, -0.5182059, -3.268906, 0, 1, 0.7529412, 1,
-0.1573555, 0.59017, -1.85961, 0, 1, 0.7607843, 1,
-0.1521037, 1.940343, 0.9267229, 0, 1, 0.7647059, 1,
-0.1488842, 0.2617995, -1.243739, 0, 1, 0.772549, 1,
-0.1481437, 1.599578, 1.153937, 0, 1, 0.7764706, 1,
-0.1465519, 0.7907969, 1.149126, 0, 1, 0.7843137, 1,
-0.1450239, 1.708907, -1.348308, 0, 1, 0.7882353, 1,
-0.1422868, -0.1719499, -1.19836, 0, 1, 0.7960784, 1,
-0.1411895, 0.6713907, 0.3758571, 0, 1, 0.8039216, 1,
-0.1376787, 0.06337146, -1.619384, 0, 1, 0.8078431, 1,
-0.1368374, 1.529851, -1.457981, 0, 1, 0.8156863, 1,
-0.1362986, 0.1625455, 0.2670714, 0, 1, 0.8196079, 1,
-0.1362609, -1.337895, -2.477852, 0, 1, 0.827451, 1,
-0.1356137, -1.548801, -3.782258, 0, 1, 0.8313726, 1,
-0.1330825, 0.5609456, -2.09049, 0, 1, 0.8392157, 1,
-0.132122, 0.4955102, 0.2294054, 0, 1, 0.8431373, 1,
-0.1312703, 1.214842, -0.6906024, 0, 1, 0.8509804, 1,
-0.1288808, -0.3768921, -2.570577, 0, 1, 0.854902, 1,
-0.128647, 0.5782173, 0.6932396, 0, 1, 0.8627451, 1,
-0.1264121, -0.8330512, -3.077708, 0, 1, 0.8666667, 1,
-0.1252333, -0.0873522, -1.697023, 0, 1, 0.8745098, 1,
-0.1248691, 0.2478482, -1.90619, 0, 1, 0.8784314, 1,
-0.1217302, 0.399403, 2.0272, 0, 1, 0.8862745, 1,
-0.1214009, 0.7348399, 0.7801412, 0, 1, 0.8901961, 1,
-0.1192733, 0.3008039, 0.6708923, 0, 1, 0.8980392, 1,
-0.1179723, 0.3547392, -1.28161, 0, 1, 0.9058824, 1,
-0.1156032, 0.2498514, -0.5428978, 0, 1, 0.9098039, 1,
-0.1049752, -0.04734016, -1.501309, 0, 1, 0.9176471, 1,
-0.1043406, -0.00590063, -3.098752, 0, 1, 0.9215686, 1,
-0.1037688, -0.7400813, -3.145842, 0, 1, 0.9294118, 1,
-0.1026813, -0.8045769, -1.933199, 0, 1, 0.9333333, 1,
-0.1025033, 0.887042, 0.811218, 0, 1, 0.9411765, 1,
-0.1016764, -0.203857, -2.743147, 0, 1, 0.945098, 1,
-0.09916607, 0.5595491, -0.218192, 0, 1, 0.9529412, 1,
-0.09815767, 1.009787, 0.04760174, 0, 1, 0.9568627, 1,
-0.09647913, -0.887732, -3.359807, 0, 1, 0.9647059, 1,
-0.09509104, -0.6880984, -1.500213, 0, 1, 0.9686275, 1,
-0.0888357, -1.629197, -2.174955, 0, 1, 0.9764706, 1,
-0.07801084, -1.546452, -2.618341, 0, 1, 0.9803922, 1,
-0.0682165, 0.3083621, 1.898677, 0, 1, 0.9882353, 1,
-0.06762055, -1.118254, -2.484426, 0, 1, 0.9921569, 1,
-0.066975, -0.9480283, -3.307534, 0, 1, 1, 1,
-0.06601232, -0.6612344, -2.386932, 0, 0.9921569, 1, 1,
-0.06393249, -1.652463, -2.494494, 0, 0.9882353, 1, 1,
-0.06189232, -0.6676405, -3.228354, 0, 0.9803922, 1, 1,
-0.0611573, 0.4596556, -0.337994, 0, 0.9764706, 1, 1,
-0.06014733, 0.44218, -0.8538581, 0, 0.9686275, 1, 1,
-0.05337206, 2.368258, -0.2447496, 0, 0.9647059, 1, 1,
-0.05217328, -0.9567625, -3.349599, 0, 0.9568627, 1, 1,
-0.05213547, -1.483044, -1.898998, 0, 0.9529412, 1, 1,
-0.04817554, -2.309118, -2.326576, 0, 0.945098, 1, 1,
-0.04793221, -0.8698231, -2.457203, 0, 0.9411765, 1, 1,
-0.04072658, -1.069059, -1.251075, 0, 0.9333333, 1, 1,
-0.03662103, 0.3606904, -0.3735908, 0, 0.9294118, 1, 1,
-0.03584177, 0.3881066, 0.364826, 0, 0.9215686, 1, 1,
-0.03456737, -0.2728451, -4.860059, 0, 0.9176471, 1, 1,
-0.0318283, -1.446136, -2.960128, 0, 0.9098039, 1, 1,
-0.02946303, -1.066338, -3.357552, 0, 0.9058824, 1, 1,
-0.02744909, -1.326246, -2.730773, 0, 0.8980392, 1, 1,
-0.02703142, 0.8563667, 0.4988491, 0, 0.8901961, 1, 1,
-0.02619817, -1.015227, -3.724732, 0, 0.8862745, 1, 1,
-0.02265771, 0.7849381, -0.6164071, 0, 0.8784314, 1, 1,
-0.02254416, -0.9980162, -3.103498, 0, 0.8745098, 1, 1,
-0.0194327, -0.1640132, -4.654259, 0, 0.8666667, 1, 1,
-0.008310844, 1.152434, -1.104056, 0, 0.8627451, 1, 1,
-0.00511391, -1.345767, -1.796989, 0, 0.854902, 1, 1,
0.000872886, 1.150508, 0.3372978, 0, 0.8509804, 1, 1,
0.005268711, 1.187461, -0.6504913, 0, 0.8431373, 1, 1,
0.007559691, -1.335503, 2.866669, 0, 0.8392157, 1, 1,
0.008608068, -0.2631283, 3.999389, 0, 0.8313726, 1, 1,
0.01862411, 0.8112577, -0.7558562, 0, 0.827451, 1, 1,
0.01979506, 0.3999697, -2.237409, 0, 0.8196079, 1, 1,
0.02096506, 1.195205, -0.9123507, 0, 0.8156863, 1, 1,
0.02293004, -0.5898256, 2.550323, 0, 0.8078431, 1, 1,
0.02779243, -1.707397, 3.113929, 0, 0.8039216, 1, 1,
0.03268696, 0.09558706, -0.7028887, 0, 0.7960784, 1, 1,
0.03293122, 1.577483, -0.2417907, 0, 0.7882353, 1, 1,
0.03393961, 1.247768, -1.035998, 0, 0.7843137, 1, 1,
0.03680369, -0.4392455, 4.006202, 0, 0.7764706, 1, 1,
0.04078862, 0.1056322, 0.01725887, 0, 0.772549, 1, 1,
0.04450493, -1.206838, 2.904984, 0, 0.7647059, 1, 1,
0.04627682, 0.02345062, 1.383335, 0, 0.7607843, 1, 1,
0.04659092, 1.019976, 0.3444393, 0, 0.7529412, 1, 1,
0.04768538, -0.2993229, 3.307867, 0, 0.7490196, 1, 1,
0.05016499, -0.9246824, 2.799311, 0, 0.7411765, 1, 1,
0.05678858, 1.817916, -2.471277, 0, 0.7372549, 1, 1,
0.05868107, -0.6212068, 3.149983, 0, 0.7294118, 1, 1,
0.05975039, -1.599451, 3.652946, 0, 0.7254902, 1, 1,
0.06107812, 2.514031, -1.153258, 0, 0.7176471, 1, 1,
0.06229508, 1.947241, -2.197216, 0, 0.7137255, 1, 1,
0.0624099, 0.3623207, -0.376978, 0, 0.7058824, 1, 1,
0.06306456, 1.227362, 1.063052, 0, 0.6980392, 1, 1,
0.06331248, -0.3887514, 3.12959, 0, 0.6941177, 1, 1,
0.06427421, 0.7631273, -0.06680077, 0, 0.6862745, 1, 1,
0.06470866, 1.995426, 1.077325, 0, 0.682353, 1, 1,
0.06619354, 0.04096781, 2.58935, 0, 0.6745098, 1, 1,
0.07862217, 0.09342597, 2.01052, 0, 0.6705883, 1, 1,
0.08007535, 0.3363991, 0.402331, 0, 0.6627451, 1, 1,
0.08070084, -0.3210963, 2.402719, 0, 0.6588235, 1, 1,
0.08819704, 0.5670592, -1.027903, 0, 0.6509804, 1, 1,
0.0899936, 1.273452, 1.40557, 0, 0.6470588, 1, 1,
0.09238002, 0.6752288, -0.08707175, 0, 0.6392157, 1, 1,
0.09273277, 0.007213499, 1.285989, 0, 0.6352941, 1, 1,
0.09728971, -1.463855, 3.533309, 0, 0.627451, 1, 1,
0.09967188, 2.285742, -1.460311, 0, 0.6235294, 1, 1,
0.1034281, -0.05160056, 1.945373, 0, 0.6156863, 1, 1,
0.1124486, 0.5664291, -0.2953796, 0, 0.6117647, 1, 1,
0.113097, -1.902795, 4.304338, 0, 0.6039216, 1, 1,
0.1137844, -0.8560531, 2.681423, 0, 0.5960785, 1, 1,
0.1167366, -0.4857795, 1.875992, 0, 0.5921569, 1, 1,
0.1195291, -0.1590783, 3.328855, 0, 0.5843138, 1, 1,
0.1221754, 0.0360695, 0.1501935, 0, 0.5803922, 1, 1,
0.1226852, -1.612042, 2.006543, 0, 0.572549, 1, 1,
0.1287248, 1.208631, -0.1626004, 0, 0.5686275, 1, 1,
0.1298171, -0.6413416, 4.58457, 0, 0.5607843, 1, 1,
0.1332081, -1.037694, 3.583746, 0, 0.5568628, 1, 1,
0.1340683, 0.3034334, 0.8760084, 0, 0.5490196, 1, 1,
0.1351112, -0.5792863, 2.572581, 0, 0.5450981, 1, 1,
0.1351354, 0.9301152, 0.05184064, 0, 0.5372549, 1, 1,
0.1428781, 0.3003845, 1.03022, 0, 0.5333334, 1, 1,
0.1466987, 0.07691675, 0.3535953, 0, 0.5254902, 1, 1,
0.1472946, -0.008196454, 1.923952, 0, 0.5215687, 1, 1,
0.1502949, -0.8183545, 3.775523, 0, 0.5137255, 1, 1,
0.151765, -0.1123312, 2.366026, 0, 0.509804, 1, 1,
0.1541771, -2.296774, 2.344527, 0, 0.5019608, 1, 1,
0.1587936, -1.875863, 3.96189, 0, 0.4941176, 1, 1,
0.1588359, -0.172311, 5.230162, 0, 0.4901961, 1, 1,
0.1606066, 1.781113, -0.6038758, 0, 0.4823529, 1, 1,
0.1608065, -0.4568941, 1.98631, 0, 0.4784314, 1, 1,
0.161204, 1.02876, 0.08086071, 0, 0.4705882, 1, 1,
0.1620253, -0.8750763, 2.324533, 0, 0.4666667, 1, 1,
0.1645496, 0.6452062, 2.000985, 0, 0.4588235, 1, 1,
0.1714347, -0.8603316, 2.560488, 0, 0.454902, 1, 1,
0.1744825, 1.355083, -1.089273, 0, 0.4470588, 1, 1,
0.175064, 2.107371, 0.8043652, 0, 0.4431373, 1, 1,
0.1776565, 0.1837219, 1.098387, 0, 0.4352941, 1, 1,
0.1780542, -1.965046, 2.932376, 0, 0.4313726, 1, 1,
0.1801458, 0.05036911, 0.311365, 0, 0.4235294, 1, 1,
0.1901572, -0.6230322, 1.753825, 0, 0.4196078, 1, 1,
0.1915958, 0.5063269, 1.720508, 0, 0.4117647, 1, 1,
0.1976536, 1.02669, 1.414174, 0, 0.4078431, 1, 1,
0.1995212, 0.2750136, 0.9248564, 0, 0.4, 1, 1,
0.2075668, 0.7775351, 0.04219395, 0, 0.3921569, 1, 1,
0.2086358, 0.06923437, 0.7877537, 0, 0.3882353, 1, 1,
0.2103985, 0.6931126, 2.172375, 0, 0.3803922, 1, 1,
0.2112286, -0.1464705, 1.091442, 0, 0.3764706, 1, 1,
0.2156358, 3.267723, 0.9088513, 0, 0.3686275, 1, 1,
0.2290708, -1.805357, 3.897895, 0, 0.3647059, 1, 1,
0.2428551, 1.619479, 1.177913, 0, 0.3568628, 1, 1,
0.2485003, -0.7429699, 4.581083, 0, 0.3529412, 1, 1,
0.2522339, 0.9497284, 1.607591, 0, 0.345098, 1, 1,
0.2523946, -0.664137, 2.526667, 0, 0.3411765, 1, 1,
0.2556791, -0.3067338, 3.39525, 0, 0.3333333, 1, 1,
0.2562308, -0.8849639, 1.172804, 0, 0.3294118, 1, 1,
0.2595369, 0.01801553, 1.49394, 0, 0.3215686, 1, 1,
0.2596954, -1.102559, 1.866156, 0, 0.3176471, 1, 1,
0.2600159, -0.2359598, 1.272852, 0, 0.3098039, 1, 1,
0.2697032, 0.7518281, -0.6724044, 0, 0.3058824, 1, 1,
0.2754929, -0.3097208, 3.063838, 0, 0.2980392, 1, 1,
0.2851406, -0.576286, 2.029658, 0, 0.2901961, 1, 1,
0.2857625, 0.4761601, 0.9203073, 0, 0.2862745, 1, 1,
0.2941526, -0.1456605, 2.359647, 0, 0.2784314, 1, 1,
0.2948846, 0.7196656, 0.4954723, 0, 0.2745098, 1, 1,
0.2997676, 0.3031932, 0.7488229, 0, 0.2666667, 1, 1,
0.2999357, -1.339336, 3.081967, 0, 0.2627451, 1, 1,
0.2999941, -0.02493193, 0.8822488, 0, 0.254902, 1, 1,
0.3057376, -0.8329945, 3.816777, 0, 0.2509804, 1, 1,
0.3139849, 2.251298, 1.608149, 0, 0.2431373, 1, 1,
0.3169877, -0.2606538, 2.124586, 0, 0.2392157, 1, 1,
0.317581, -0.9893019, 2.030916, 0, 0.2313726, 1, 1,
0.317697, -1.007759, 4.483706, 0, 0.227451, 1, 1,
0.3185069, 0.8092133, 0.3447626, 0, 0.2196078, 1, 1,
0.3201459, 0.02799524, 1.924687, 0, 0.2156863, 1, 1,
0.3214125, 0.2860145, 0.6824389, 0, 0.2078431, 1, 1,
0.3217539, -0.4722256, 2.398958, 0, 0.2039216, 1, 1,
0.32837, -0.1689537, 0.2847368, 0, 0.1960784, 1, 1,
0.330714, -1.716535, 3.86665, 0, 0.1882353, 1, 1,
0.3358164, 0.1377796, 0.7463101, 0, 0.1843137, 1, 1,
0.3361982, 1.938344, -0.02533401, 0, 0.1764706, 1, 1,
0.3383145, -1.069588, 2.77338, 0, 0.172549, 1, 1,
0.3388654, -2.503964, 3.656099, 0, 0.1647059, 1, 1,
0.3413077, 0.2096813, 0.140968, 0, 0.1607843, 1, 1,
0.3439718, 0.6757512, 1.843859, 0, 0.1529412, 1, 1,
0.3480313, -0.08278802, 2.121393, 0, 0.1490196, 1, 1,
0.3496431, 0.5064985, -1.081068, 0, 0.1411765, 1, 1,
0.3497432, 0.9217002, 0.1739321, 0, 0.1372549, 1, 1,
0.355707, -1.450584, 2.492258, 0, 0.1294118, 1, 1,
0.3570266, 0.9486409, 0.7170199, 0, 0.1254902, 1, 1,
0.3579612, -0.8733582, 4.148427, 0, 0.1176471, 1, 1,
0.3612187, 0.8910384, -0.9568478, 0, 0.1137255, 1, 1,
0.3617391, 0.3428385, 1.116199, 0, 0.1058824, 1, 1,
0.3634129, 0.07326012, 3.40609, 0, 0.09803922, 1, 1,
0.36464, 0.8825439, -0.1158937, 0, 0.09411765, 1, 1,
0.3661701, 1.615899, 1.214253, 0, 0.08627451, 1, 1,
0.3723619, -0.7946861, 2.64084, 0, 0.08235294, 1, 1,
0.3732385, -0.7007763, 2.544693, 0, 0.07450981, 1, 1,
0.3747925, -0.05478134, 3.659106, 0, 0.07058824, 1, 1,
0.3812375, 1.597941, 1.531888, 0, 0.0627451, 1, 1,
0.3814569, -3.079764, 2.358588, 0, 0.05882353, 1, 1,
0.3814858, -0.1838068, 0.2167488, 0, 0.05098039, 1, 1,
0.3863538, 0.4862309, 1.423584, 0, 0.04705882, 1, 1,
0.3894535, 0.3567909, 2.501276, 0, 0.03921569, 1, 1,
0.3924454, 0.4125174, -0.4637274, 0, 0.03529412, 1, 1,
0.3959846, 0.3256241, 1.526367, 0, 0.02745098, 1, 1,
0.3967989, 0.2293497, -1.062168, 0, 0.02352941, 1, 1,
0.4032809, 0.83882, 3.334754, 0, 0.01568628, 1, 1,
0.4135213, 0.7339014, 1.40813, 0, 0.01176471, 1, 1,
0.4139866, 0.3728025, 0.08486133, 0, 0.003921569, 1, 1,
0.4167401, -0.4172657, 2.567756, 0.003921569, 0, 1, 1,
0.4175294, -0.1973549, 3.551439, 0.007843138, 0, 1, 1,
0.4251295, 0.2331154, 1.157533, 0.01568628, 0, 1, 1,
0.4274177, 0.9728174, -0.5953937, 0.01960784, 0, 1, 1,
0.4286048, -0.03686928, 1.474959, 0.02745098, 0, 1, 1,
0.4308173, 0.5897198, 1.072104, 0.03137255, 0, 1, 1,
0.432901, 0.8156632, 0.05600212, 0.03921569, 0, 1, 1,
0.4347952, -0.4717593, 4.125189, 0.04313726, 0, 1, 1,
0.4358934, -0.2592895, 3.30529, 0.05098039, 0, 1, 1,
0.4384817, 0.0170453, 2.411764, 0.05490196, 0, 1, 1,
0.4430186, 1.614553, 2.403581, 0.0627451, 0, 1, 1,
0.4444574, 0.515408, -0.2929975, 0.06666667, 0, 1, 1,
0.4472387, 0.9415917, -2.192897, 0.07450981, 0, 1, 1,
0.4504417, -0.2924156, 2.23331, 0.07843138, 0, 1, 1,
0.4507522, 0.3216113, 1.90931, 0.08627451, 0, 1, 1,
0.4551494, -0.2634603, 3.059618, 0.09019608, 0, 1, 1,
0.4622153, -0.03580688, 0.1298583, 0.09803922, 0, 1, 1,
0.4659494, 1.151516, -0.6705189, 0.1058824, 0, 1, 1,
0.4695442, 1.472986, 0.3873618, 0.1098039, 0, 1, 1,
0.4710376, -1.456869, 1.387922, 0.1176471, 0, 1, 1,
0.4787828, 0.1280593, 2.902753, 0.1215686, 0, 1, 1,
0.4844717, 0.08910208, 1.506402, 0.1294118, 0, 1, 1,
0.4900571, 0.3952547, -1.11267, 0.1333333, 0, 1, 1,
0.5034514, 0.1742323, 1.00624, 0.1411765, 0, 1, 1,
0.5119264, -0.1841535, 0.8348523, 0.145098, 0, 1, 1,
0.5140091, -0.909265, 3.349752, 0.1529412, 0, 1, 1,
0.5205674, 0.8575674, -0.1326647, 0.1568628, 0, 1, 1,
0.5217071, -0.6164016, 1.660029, 0.1647059, 0, 1, 1,
0.5221984, 0.3566043, -0.7287626, 0.1686275, 0, 1, 1,
0.5226334, 0.1681107, 1.866332, 0.1764706, 0, 1, 1,
0.5239222, -1.717558, 3.654191, 0.1803922, 0, 1, 1,
0.5251743, -1.14739, 3.943771, 0.1882353, 0, 1, 1,
0.5257328, -1.691808, 3.648557, 0.1921569, 0, 1, 1,
0.5263229, -1.639394, 4.942978, 0.2, 0, 1, 1,
0.5279623, 0.6764582, 1.050023, 0.2078431, 0, 1, 1,
0.531223, -1.060838, 3.159806, 0.2117647, 0, 1, 1,
0.5336516, -2.511909, 1.083414, 0.2196078, 0, 1, 1,
0.5376903, -1.736617, 3.850712, 0.2235294, 0, 1, 1,
0.540141, 1.730346, 0.3372563, 0.2313726, 0, 1, 1,
0.5453393, 0.7490714, 0.5154272, 0.2352941, 0, 1, 1,
0.5474306, -2.04336, 2.455578, 0.2431373, 0, 1, 1,
0.5486143, 1.424467, 0.06237693, 0.2470588, 0, 1, 1,
0.5498992, 0.3627307, 1.010007, 0.254902, 0, 1, 1,
0.5504932, 1.011414, 1.087203, 0.2588235, 0, 1, 1,
0.5552912, 0.3793716, 1.424981, 0.2666667, 0, 1, 1,
0.5556597, 0.4902297, 0.5441989, 0.2705882, 0, 1, 1,
0.5563179, 1.158236, 0.3116432, 0.2784314, 0, 1, 1,
0.5589989, 1.151292, -0.4000041, 0.282353, 0, 1, 1,
0.5602909, 1.838319, 0.8368867, 0.2901961, 0, 1, 1,
0.5605215, 0.01015967, 1.575116, 0.2941177, 0, 1, 1,
0.5628145, -0.06894787, 2.488362, 0.3019608, 0, 1, 1,
0.5634162, -0.5717725, 2.569681, 0.3098039, 0, 1, 1,
0.5647847, -0.7408813, 2.903345, 0.3137255, 0, 1, 1,
0.5686206, 0.230415, 2.73473, 0.3215686, 0, 1, 1,
0.5735081, 1.352486, 2.414873, 0.3254902, 0, 1, 1,
0.578987, 0.623466, -0.01950325, 0.3333333, 0, 1, 1,
0.595689, 2.43977, -0.005287632, 0.3372549, 0, 1, 1,
0.5976756, -0.3257945, 4.487774, 0.345098, 0, 1, 1,
0.5979675, -0.547452, 1.466283, 0.3490196, 0, 1, 1,
0.606057, 0.2475923, 1.580502, 0.3568628, 0, 1, 1,
0.6101952, 0.08098216, 1.678347, 0.3607843, 0, 1, 1,
0.6114137, -1.319881, 3.619178, 0.3686275, 0, 1, 1,
0.6134142, -0.8336514, 3.327261, 0.372549, 0, 1, 1,
0.6136749, 0.7998785, 0.3064275, 0.3803922, 0, 1, 1,
0.6138051, 0.3855537, 2.483315, 0.3843137, 0, 1, 1,
0.6149429, 0.9483206, 0.6345229, 0.3921569, 0, 1, 1,
0.6215854, -0.08303695, 3.052505, 0.3960784, 0, 1, 1,
0.6219803, -0.9060034, 1.294732, 0.4039216, 0, 1, 1,
0.6231568, -1.689073, 2.512244, 0.4117647, 0, 1, 1,
0.6247947, 0.5717761, 0.1422026, 0.4156863, 0, 1, 1,
0.6313801, -0.4543976, 2.654871, 0.4235294, 0, 1, 1,
0.6345801, 0.3696683, 1.96958, 0.427451, 0, 1, 1,
0.6407456, 1.26378, -0.2950116, 0.4352941, 0, 1, 1,
0.6440944, 0.9698645, 0.1777319, 0.4392157, 0, 1, 1,
0.655284, 0.5158676, -0.1520522, 0.4470588, 0, 1, 1,
0.6556606, -2.238569, 1.778384, 0.4509804, 0, 1, 1,
0.6580809, -1.055467, 3.005635, 0.4588235, 0, 1, 1,
0.6595224, -0.5961398, 2.439425, 0.4627451, 0, 1, 1,
0.6631157, 0.180256, 0.7602467, 0.4705882, 0, 1, 1,
0.6650724, 1.001839, 0.03047017, 0.4745098, 0, 1, 1,
0.672117, 0.4813743, 1.501899, 0.4823529, 0, 1, 1,
0.6736587, -0.7726585, 0.8849922, 0.4862745, 0, 1, 1,
0.6886792, 1.40021, 0.4438492, 0.4941176, 0, 1, 1,
0.6932908, 1.011258, -1.156541, 0.5019608, 0, 1, 1,
0.6939559, -0.172059, 4.260549, 0.5058824, 0, 1, 1,
0.6971884, 1.387201, 0.224212, 0.5137255, 0, 1, 1,
0.6993909, -0.2032961, 0.5020468, 0.5176471, 0, 1, 1,
0.7033575, -0.3062844, 1.869484, 0.5254902, 0, 1, 1,
0.7037482, -0.3809895, 0.3745366, 0.5294118, 0, 1, 1,
0.7047611, 0.2601658, 0.3031234, 0.5372549, 0, 1, 1,
0.7049034, -1.318451, 2.399269, 0.5411765, 0, 1, 1,
0.7062305, -0.292293, 1.572911, 0.5490196, 0, 1, 1,
0.7085716, -1.255417, 2.532026, 0.5529412, 0, 1, 1,
0.7107149, -0.4849169, 2.369753, 0.5607843, 0, 1, 1,
0.7107607, 1.133718, 1.366228, 0.5647059, 0, 1, 1,
0.7137846, -0.7162662, 2.835945, 0.572549, 0, 1, 1,
0.7144256, -0.98531, 3.253081, 0.5764706, 0, 1, 1,
0.7208841, 1.409945, 0.4444058, 0.5843138, 0, 1, 1,
0.7269419, 0.4305516, 1.398091, 0.5882353, 0, 1, 1,
0.7284791, -0.6275181, 3.146917, 0.5960785, 0, 1, 1,
0.7548965, -0.220651, 0.302309, 0.6039216, 0, 1, 1,
0.7612665, 0.3114076, 0.3438432, 0.6078432, 0, 1, 1,
0.7627693, 0.863031, 1.292803, 0.6156863, 0, 1, 1,
0.768171, -1.494721, 0.5346494, 0.6196079, 0, 1, 1,
0.7682756, -1.352427, 1.886318, 0.627451, 0, 1, 1,
0.7695268, 1.058371, 3.14324, 0.6313726, 0, 1, 1,
0.7696997, -1.326196, 2.356401, 0.6392157, 0, 1, 1,
0.770251, -0.4105234, 2.113166, 0.6431373, 0, 1, 1,
0.7712018, 0.9484481, -1.342049, 0.6509804, 0, 1, 1,
0.7714313, 0.7160792, 0.7426341, 0.654902, 0, 1, 1,
0.773912, -0.08526164, 2.481864, 0.6627451, 0, 1, 1,
0.7753299, -1.281664, 2.596085, 0.6666667, 0, 1, 1,
0.7782694, 2.200884, 0.6704191, 0.6745098, 0, 1, 1,
0.7956647, 0.1741746, 3.701163, 0.6784314, 0, 1, 1,
0.8070992, 2.467044, 0.3187804, 0.6862745, 0, 1, 1,
0.8071616, -1.036188, 2.922486, 0.6901961, 0, 1, 1,
0.8115205, 0.6161054, 0.582434, 0.6980392, 0, 1, 1,
0.8153737, -0.9382442, 3.990245, 0.7058824, 0, 1, 1,
0.8188867, 0.3745297, 1.837791, 0.7098039, 0, 1, 1,
0.8223082, -0.04931344, 1.714088, 0.7176471, 0, 1, 1,
0.8292882, 1.384031, 1.279343, 0.7215686, 0, 1, 1,
0.8304349, -0.5970367, 2.086548, 0.7294118, 0, 1, 1,
0.8325212, 0.6095721, 0.5072139, 0.7333333, 0, 1, 1,
0.8376896, -0.4001687, 1.887946, 0.7411765, 0, 1, 1,
0.8413026, -1.902442, 2.046265, 0.7450981, 0, 1, 1,
0.8449794, 0.1936596, 0.07536007, 0.7529412, 0, 1, 1,
0.8457456, 0.6866431, 1.641, 0.7568628, 0, 1, 1,
0.8472439, 0.27674, 0.6517961, 0.7647059, 0, 1, 1,
0.8474253, -0.8858582, 1.84139, 0.7686275, 0, 1, 1,
0.8491871, 1.513858, 0.6790169, 0.7764706, 0, 1, 1,
0.8509344, -1.422885, 3.008025, 0.7803922, 0, 1, 1,
0.8518822, -0.1142853, 2.60612, 0.7882353, 0, 1, 1,
0.8533217, -0.06486355, 1.495528, 0.7921569, 0, 1, 1,
0.8538319, -0.3535168, 1.932981, 0.8, 0, 1, 1,
0.8549144, -0.3232298, 2.278759, 0.8078431, 0, 1, 1,
0.8563122, 0.1706292, 1.131454, 0.8117647, 0, 1, 1,
0.8698084, -0.48906, 1.710718, 0.8196079, 0, 1, 1,
0.8720596, 0.4170923, 2.326798, 0.8235294, 0, 1, 1,
0.8784215, 0.2344311, 1.580768, 0.8313726, 0, 1, 1,
0.8809802, -0.8541502, 3.298569, 0.8352941, 0, 1, 1,
0.8906272, -0.9525114, 1.784853, 0.8431373, 0, 1, 1,
0.8956001, -0.4300458, 2.629894, 0.8470588, 0, 1, 1,
0.8969052, -0.5590792, 3.743089, 0.854902, 0, 1, 1,
0.9045358, 1.124484, 1.551219, 0.8588235, 0, 1, 1,
0.9064603, 0.9321021, -0.8852646, 0.8666667, 0, 1, 1,
0.9087714, 2.01846, 1.995143, 0.8705882, 0, 1, 1,
0.9097074, -0.7174179, 0.9760072, 0.8784314, 0, 1, 1,
0.9235235, 1.733359, 0.7522038, 0.8823529, 0, 1, 1,
0.9279258, -0.8316035, 3.000436, 0.8901961, 0, 1, 1,
0.929391, -0.5407482, 1.584841, 0.8941177, 0, 1, 1,
0.9317777, 0.3969871, 2.49217, 0.9019608, 0, 1, 1,
0.9354313, 0.1827701, -0.3336278, 0.9098039, 0, 1, 1,
0.9398527, -0.7136897, -0.4235797, 0.9137255, 0, 1, 1,
0.9426112, 0.2114538, -0.7193424, 0.9215686, 0, 1, 1,
0.9426559, 1.281057, 0.07387551, 0.9254902, 0, 1, 1,
0.9436195, -0.6868018, 1.670058, 0.9333333, 0, 1, 1,
0.953739, 1.193216, 1.03219, 0.9372549, 0, 1, 1,
0.9596078, 0.2948242, 0.86699, 0.945098, 0, 1, 1,
0.9658061, 1.209834, 0.5758289, 0.9490196, 0, 1, 1,
0.9663533, -0.450408, 1.949623, 0.9568627, 0, 1, 1,
0.9664726, -0.07752297, 0.7631457, 0.9607843, 0, 1, 1,
0.9670791, -0.428733, 0.4334247, 0.9686275, 0, 1, 1,
0.9693499, -0.579269, 1.002822, 0.972549, 0, 1, 1,
0.969426, -0.8261908, 0.8983772, 0.9803922, 0, 1, 1,
0.9744024, -0.8039119, 2.839226, 0.9843137, 0, 1, 1,
0.9776415, -0.5426786, 1.611591, 0.9921569, 0, 1, 1,
0.9807113, -1.78122, 2.597078, 0.9960784, 0, 1, 1,
0.9868687, 0.5451594, 1.843147, 1, 0, 0.9960784, 1,
0.9922498, -0.4709894, 1.407395, 1, 0, 0.9882353, 1,
1.000402, -1.638233, 1.035642, 1, 0, 0.9843137, 1,
1.003043, 0.7253215, 1.126939, 1, 0, 0.9764706, 1,
1.009566, -0.7671321, 2.724191, 1, 0, 0.972549, 1,
1.012278, 0.6027806, 0.1219038, 1, 0, 0.9647059, 1,
1.019729, 0.4650666, 0.324746, 1, 0, 0.9607843, 1,
1.02091, -1.46785, 1.435476, 1, 0, 0.9529412, 1,
1.021931, 0.1537498, 2.056929, 1, 0, 0.9490196, 1,
1.024574, 1.180059, -0.3270353, 1, 0, 0.9411765, 1,
1.026667, 0.2612046, 0.669533, 1, 0, 0.9372549, 1,
1.040925, -1.255534, 4.245785, 1, 0, 0.9294118, 1,
1.041791, 1.219376, -0.8068624, 1, 0, 0.9254902, 1,
1.047372, 0.5179455, 0.8807294, 1, 0, 0.9176471, 1,
1.051125, 2.59763, 0.9117753, 1, 0, 0.9137255, 1,
1.056096, 0.8186566, 1.540436, 1, 0, 0.9058824, 1,
1.057219, -0.4150426, 1.43689, 1, 0, 0.9019608, 1,
1.067441, 0.5189764, 1.319685, 1, 0, 0.8941177, 1,
1.069533, 1.065681, 1.959649, 1, 0, 0.8862745, 1,
1.080678, -1.128436, 1.185394, 1, 0, 0.8823529, 1,
1.082017, 0.2021344, 0.5186769, 1, 0, 0.8745098, 1,
1.087029, 0.3418083, 2.170883, 1, 0, 0.8705882, 1,
1.096158, 0.1493279, 1.252897, 1, 0, 0.8627451, 1,
1.106473, -0.2488663, 2.27215, 1, 0, 0.8588235, 1,
1.107938, -1.51831, 3.35881, 1, 0, 0.8509804, 1,
1.11139, 0.301542, 1.767214, 1, 0, 0.8470588, 1,
1.118741, 0.3977023, 2.239437, 1, 0, 0.8392157, 1,
1.118779, -1.343849, 1.607416, 1, 0, 0.8352941, 1,
1.120841, -0.7942192, 2.350691, 1, 0, 0.827451, 1,
1.126823, 0.2168267, 2.650303, 1, 0, 0.8235294, 1,
1.129663, -0.1590476, 2.672772, 1, 0, 0.8156863, 1,
1.131716, 1.065081, 1.334902, 1, 0, 0.8117647, 1,
1.139649, -0.8544421, 1.916499, 1, 0, 0.8039216, 1,
1.145197, 1.019602, 0.1877612, 1, 0, 0.7960784, 1,
1.151336, 0.3957214, -1.163405, 1, 0, 0.7921569, 1,
1.152208, 2.508572, -0.4684738, 1, 0, 0.7843137, 1,
1.158937, 1.481988, 0.0147476, 1, 0, 0.7803922, 1,
1.159109, -1.741668, 2.510054, 1, 0, 0.772549, 1,
1.163009, 0.9442946, 0.6371198, 1, 0, 0.7686275, 1,
1.164999, -0.6021089, 1.739125, 1, 0, 0.7607843, 1,
1.167925, -2.085527, 3.13025, 1, 0, 0.7568628, 1,
1.178226, 2.261886, 0.6882444, 1, 0, 0.7490196, 1,
1.180131, -0.5554888, 1.797057, 1, 0, 0.7450981, 1,
1.181912, 0.1869788, 0.2771179, 1, 0, 0.7372549, 1,
1.185611, 0.286751, 1.424671, 1, 0, 0.7333333, 1,
1.187847, 0.8671989, 2.084612, 1, 0, 0.7254902, 1,
1.202283, -1.363343, 4.253407, 1, 0, 0.7215686, 1,
1.206029, 0.3172271, 0.1871328, 1, 0, 0.7137255, 1,
1.209883, -0.569604, 0.804994, 1, 0, 0.7098039, 1,
1.210714, 0.4508572, 1.768782, 1, 0, 0.7019608, 1,
1.211574, 0.01350823, 2.59368, 1, 0, 0.6941177, 1,
1.214967, -2.108799, 2.745162, 1, 0, 0.6901961, 1,
1.218499, -1.351509, 2.35376, 1, 0, 0.682353, 1,
1.22283, 0.3357716, 3.215483, 1, 0, 0.6784314, 1,
1.235844, 1.980196, 1.121867, 1, 0, 0.6705883, 1,
1.23678, 0.3822594, 2.135393, 1, 0, 0.6666667, 1,
1.236873, -0.3561837, 3.333214, 1, 0, 0.6588235, 1,
1.244287, -0.7485213, 1.364357, 1, 0, 0.654902, 1,
1.247592, -0.7950085, 0.5302984, 1, 0, 0.6470588, 1,
1.249616, 0.1500314, 1.392908, 1, 0, 0.6431373, 1,
1.256304, 0.4552228, -0.08105134, 1, 0, 0.6352941, 1,
1.2647, -1.998258, 2.973482, 1, 0, 0.6313726, 1,
1.268761, -1.028865, 1.675455, 1, 0, 0.6235294, 1,
1.269377, -0.6387491, 2.008377, 1, 0, 0.6196079, 1,
1.270279, 0.6232333, 1.37953, 1, 0, 0.6117647, 1,
1.270841, -0.2891729, 2.314163, 1, 0, 0.6078432, 1,
1.271722, -0.2437494, -0.6743982, 1, 0, 0.6, 1,
1.27667, 2.904832, -0.2585878, 1, 0, 0.5921569, 1,
1.285872, -0.2521005, 3.058393, 1, 0, 0.5882353, 1,
1.289614, 0.643588, -0.122173, 1, 0, 0.5803922, 1,
1.297981, 1.041002, 0.6465036, 1, 0, 0.5764706, 1,
1.298752, 0.5172486, 1.554153, 1, 0, 0.5686275, 1,
1.300174, 0.2737963, 2.721494, 1, 0, 0.5647059, 1,
1.304747, 0.15354, 2.144418, 1, 0, 0.5568628, 1,
1.310713, -0.1964525, 1.108662, 1, 0, 0.5529412, 1,
1.319951, -0.09770094, 0.5757409, 1, 0, 0.5450981, 1,
1.320722, -0.03548765, 2.49364, 1, 0, 0.5411765, 1,
1.326052, -0.9774313, 2.298611, 1, 0, 0.5333334, 1,
1.3369, -0.4976965, 1.869311, 1, 0, 0.5294118, 1,
1.339083, 0.145486, 1.563441, 1, 0, 0.5215687, 1,
1.349939, 0.2805416, 2.124397, 1, 0, 0.5176471, 1,
1.351177, 0.7701324, 0.8428801, 1, 0, 0.509804, 1,
1.370204, 0.4924346, -0.761277, 1, 0, 0.5058824, 1,
1.379107, -0.3994634, 1.850544, 1, 0, 0.4980392, 1,
1.385306, 0.9092848, -0.3164998, 1, 0, 0.4901961, 1,
1.393416, 0.8093977, 1.529327, 1, 0, 0.4862745, 1,
1.400225, 0.2085915, 3.243506, 1, 0, 0.4784314, 1,
1.407853, 1.346224, 0.114268, 1, 0, 0.4745098, 1,
1.418712, -0.1257342, 1.062747, 1, 0, 0.4666667, 1,
1.442252, -0.194168, 3.493948, 1, 0, 0.4627451, 1,
1.450432, 0.3081821, 2.364694, 1, 0, 0.454902, 1,
1.453744, -0.8823968, 1.60833, 1, 0, 0.4509804, 1,
1.464836, 2.170308, 1.467017, 1, 0, 0.4431373, 1,
1.467137, 1.481001, 2.451387, 1, 0, 0.4392157, 1,
1.473687, 0.05363535, 1.879161, 1, 0, 0.4313726, 1,
1.477154, -2.250721, 3.402228, 1, 0, 0.427451, 1,
1.479657, 0.372569, 0.4548082, 1, 0, 0.4196078, 1,
1.490645, -0.028222, 0.8737956, 1, 0, 0.4156863, 1,
1.49895, 0.08178221, 1.859793, 1, 0, 0.4078431, 1,
1.503353, -0.2978384, 2.267918, 1, 0, 0.4039216, 1,
1.52571, 1.045894, 3.192599, 1, 0, 0.3960784, 1,
1.534759, 0.5337783, 2.754052, 1, 0, 0.3882353, 1,
1.535552, -0.4691172, 1.072473, 1, 0, 0.3843137, 1,
1.546825, -0.02076747, 1.342087, 1, 0, 0.3764706, 1,
1.551637, -0.2802812, 2.282838, 1, 0, 0.372549, 1,
1.553396, 0.5171841, 1.038545, 1, 0, 0.3647059, 1,
1.561419, -1.139993, 1.565186, 1, 0, 0.3607843, 1,
1.565261, -0.25034, 3.591073, 1, 0, 0.3529412, 1,
1.576268, -0.810868, 1.419466, 1, 0, 0.3490196, 1,
1.602868, -1.564161, 1.232643, 1, 0, 0.3411765, 1,
1.612824, -1.190568, 2.17889, 1, 0, 0.3372549, 1,
1.627607, -1.106261, 3.588004, 1, 0, 0.3294118, 1,
1.627703, -0.2819857, 1.825911, 1, 0, 0.3254902, 1,
1.636157, -0.8714787, 1.515911, 1, 0, 0.3176471, 1,
1.651218, -0.3382453, 0.5625277, 1, 0, 0.3137255, 1,
1.658769, 1.209522, 1.159923, 1, 0, 0.3058824, 1,
1.659454, -1.818369, 1.465264, 1, 0, 0.2980392, 1,
1.666558, 0.7345854, -0.08096087, 1, 0, 0.2941177, 1,
1.678503, -0.7973576, -0.3100407, 1, 0, 0.2862745, 1,
1.684827, 0.09488009, 0.6484274, 1, 0, 0.282353, 1,
1.697506, 1.964436, 1.965555, 1, 0, 0.2745098, 1,
1.725766, 1.367819, 0.7210523, 1, 0, 0.2705882, 1,
1.726805, -1.544242, 1.17277, 1, 0, 0.2627451, 1,
1.742706, -0.2038594, 1.951758, 1, 0, 0.2588235, 1,
1.766012, -0.3746476, 3.033672, 1, 0, 0.2509804, 1,
1.773297, -0.7007189, 3.112849, 1, 0, 0.2470588, 1,
1.776934, -0.5713318, 1.511899, 1, 0, 0.2392157, 1,
1.79462, 0.6646436, 0.1058684, 1, 0, 0.2352941, 1,
1.797769, 0.3685961, 2.044353, 1, 0, 0.227451, 1,
1.811517, -0.04898644, 3.016179, 1, 0, 0.2235294, 1,
1.813088, 0.2719682, 0.6698903, 1, 0, 0.2156863, 1,
1.83967, -0.1032037, -0.3979776, 1, 0, 0.2117647, 1,
1.842105, 1.465377, -0.5887449, 1, 0, 0.2039216, 1,
1.856731, -0.7582801, 2.495844, 1, 0, 0.1960784, 1,
1.929092, -0.5163431, 2.707389, 1, 0, 0.1921569, 1,
1.940079, -0.2101072, 1.72319, 1, 0, 0.1843137, 1,
1.941821, -1.229599, 5.134126, 1, 0, 0.1803922, 1,
1.946324, 0.9517882, 0.02426254, 1, 0, 0.172549, 1,
1.978669, -0.7096696, 0.8140748, 1, 0, 0.1686275, 1,
1.995717, -0.130513, 3.303073, 1, 0, 0.1607843, 1,
2.003711, -0.7042353, 1.812008, 1, 0, 0.1568628, 1,
2.029117, -1.048344, 1.369306, 1, 0, 0.1490196, 1,
2.029795, 0.6266876, 3.130126, 1, 0, 0.145098, 1,
2.032689, -0.6362807, 2.811389, 1, 0, 0.1372549, 1,
2.045243, 0.6061615, 1.541269, 1, 0, 0.1333333, 1,
2.06913, 0.3873415, 1.479328, 1, 0, 0.1254902, 1,
2.08132, 0.9159933, 2.021351, 1, 0, 0.1215686, 1,
2.14959, 0.7911235, 1.764367, 1, 0, 0.1137255, 1,
2.152839, -0.5046822, 1.968559, 1, 0, 0.1098039, 1,
2.263092, -1.850594, 2.822531, 1, 0, 0.1019608, 1,
2.306955, 0.4029984, 1.216917, 1, 0, 0.09411765, 1,
2.312643, 1.263594, -1.055692, 1, 0, 0.09019608, 1,
2.397952, -2.796102, 3.157574, 1, 0, 0.08235294, 1,
2.403687, 0.3715465, 0.2511968, 1, 0, 0.07843138, 1,
2.411345, -0.3640322, 1.219944, 1, 0, 0.07058824, 1,
2.434851, -0.4615749, 1.890468, 1, 0, 0.06666667, 1,
2.451446, -2.041853, 3.977679, 1, 0, 0.05882353, 1,
2.462962, 0.8454408, 0.117276, 1, 0, 0.05490196, 1,
2.525244, 0.6211314, 2.129669, 1, 0, 0.04705882, 1,
2.684263, -0.1829109, 1.075959, 1, 0, 0.04313726, 1,
2.701764, -0.331971, 1.396322, 1, 0, 0.03529412, 1,
2.751939, -1.075077, 1.201124, 1, 0, 0.03137255, 1,
2.880888, 1.9445, 3.75208, 1, 0, 0.02352941, 1,
2.97428, -0.7349311, 2.546692, 1, 0, 0.01960784, 1,
3.211097, 1.491093, -0.2597418, 1, 0, 0.01176471, 1,
3.243019, -1.112365, 2.61218, 1, 0, 0.007843138, 1
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
-0.0286392, -4.155663, -6.673093, 0, -0.5, 0.5, 0.5,
-0.0286392, -4.155663, -6.673093, 1, -0.5, 0.5, 0.5,
-0.0286392, -4.155663, -6.673093, 1, 1.5, 0.5, 0.5,
-0.0286392, -4.155663, -6.673093, 0, 1.5, 0.5, 0.5
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
-4.40939, 0.09397948, -6.673093, 0, -0.5, 0.5, 0.5,
-4.40939, 0.09397948, -6.673093, 1, -0.5, 0.5, 0.5,
-4.40939, 0.09397948, -6.673093, 1, 1.5, 0.5, 0.5,
-4.40939, 0.09397948, -6.673093, 0, 1.5, 0.5, 0.5
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
-4.40939, -4.155663, 0.1411259, 0, -0.5, 0.5, 0.5,
-4.40939, -4.155663, 0.1411259, 1, -0.5, 0.5, 0.5,
-4.40939, -4.155663, 0.1411259, 1, 1.5, 0.5, 0.5,
-4.40939, -4.155663, 0.1411259, 0, 1.5, 0.5, 0.5
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
-3, -3.174976, -5.100581,
3, -3.174976, -5.100581,
-3, -3.174976, -5.100581,
-3, -3.338424, -5.362666,
-2, -3.174976, -5.100581,
-2, -3.338424, -5.362666,
-1, -3.174976, -5.100581,
-1, -3.338424, -5.362666,
0, -3.174976, -5.100581,
0, -3.338424, -5.362666,
1, -3.174976, -5.100581,
1, -3.338424, -5.362666,
2, -3.174976, -5.100581,
2, -3.338424, -5.362666,
3, -3.174976, -5.100581,
3, -3.338424, -5.362666
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
-3, -3.665319, -5.886837, 0, -0.5, 0.5, 0.5,
-3, -3.665319, -5.886837, 1, -0.5, 0.5, 0.5,
-3, -3.665319, -5.886837, 1, 1.5, 0.5, 0.5,
-3, -3.665319, -5.886837, 0, 1.5, 0.5, 0.5,
-2, -3.665319, -5.886837, 0, -0.5, 0.5, 0.5,
-2, -3.665319, -5.886837, 1, -0.5, 0.5, 0.5,
-2, -3.665319, -5.886837, 1, 1.5, 0.5, 0.5,
-2, -3.665319, -5.886837, 0, 1.5, 0.5, 0.5,
-1, -3.665319, -5.886837, 0, -0.5, 0.5, 0.5,
-1, -3.665319, -5.886837, 1, -0.5, 0.5, 0.5,
-1, -3.665319, -5.886837, 1, 1.5, 0.5, 0.5,
-1, -3.665319, -5.886837, 0, 1.5, 0.5, 0.5,
0, -3.665319, -5.886837, 0, -0.5, 0.5, 0.5,
0, -3.665319, -5.886837, 1, -0.5, 0.5, 0.5,
0, -3.665319, -5.886837, 1, 1.5, 0.5, 0.5,
0, -3.665319, -5.886837, 0, 1.5, 0.5, 0.5,
1, -3.665319, -5.886837, 0, -0.5, 0.5, 0.5,
1, -3.665319, -5.886837, 1, -0.5, 0.5, 0.5,
1, -3.665319, -5.886837, 1, 1.5, 0.5, 0.5,
1, -3.665319, -5.886837, 0, 1.5, 0.5, 0.5,
2, -3.665319, -5.886837, 0, -0.5, 0.5, 0.5,
2, -3.665319, -5.886837, 1, -0.5, 0.5, 0.5,
2, -3.665319, -5.886837, 1, 1.5, 0.5, 0.5,
2, -3.665319, -5.886837, 0, 1.5, 0.5, 0.5,
3, -3.665319, -5.886837, 0, -0.5, 0.5, 0.5,
3, -3.665319, -5.886837, 1, -0.5, 0.5, 0.5,
3, -3.665319, -5.886837, 1, 1.5, 0.5, 0.5,
3, -3.665319, -5.886837, 0, 1.5, 0.5, 0.5
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
-3.398448, -3, -5.100581,
-3.398448, 3, -5.100581,
-3.398448, -3, -5.100581,
-3.566938, -3, -5.362666,
-3.398448, -2, -5.100581,
-3.566938, -2, -5.362666,
-3.398448, -1, -5.100581,
-3.566938, -1, -5.362666,
-3.398448, 0, -5.100581,
-3.566938, 0, -5.362666,
-3.398448, 1, -5.100581,
-3.566938, 1, -5.362666,
-3.398448, 2, -5.100581,
-3.566938, 2, -5.362666,
-3.398448, 3, -5.100581,
-3.566938, 3, -5.362666
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
-3.903919, -3, -5.886837, 0, -0.5, 0.5, 0.5,
-3.903919, -3, -5.886837, 1, -0.5, 0.5, 0.5,
-3.903919, -3, -5.886837, 1, 1.5, 0.5, 0.5,
-3.903919, -3, -5.886837, 0, 1.5, 0.5, 0.5,
-3.903919, -2, -5.886837, 0, -0.5, 0.5, 0.5,
-3.903919, -2, -5.886837, 1, -0.5, 0.5, 0.5,
-3.903919, -2, -5.886837, 1, 1.5, 0.5, 0.5,
-3.903919, -2, -5.886837, 0, 1.5, 0.5, 0.5,
-3.903919, -1, -5.886837, 0, -0.5, 0.5, 0.5,
-3.903919, -1, -5.886837, 1, -0.5, 0.5, 0.5,
-3.903919, -1, -5.886837, 1, 1.5, 0.5, 0.5,
-3.903919, -1, -5.886837, 0, 1.5, 0.5, 0.5,
-3.903919, 0, -5.886837, 0, -0.5, 0.5, 0.5,
-3.903919, 0, -5.886837, 1, -0.5, 0.5, 0.5,
-3.903919, 0, -5.886837, 1, 1.5, 0.5, 0.5,
-3.903919, 0, -5.886837, 0, 1.5, 0.5, 0.5,
-3.903919, 1, -5.886837, 0, -0.5, 0.5, 0.5,
-3.903919, 1, -5.886837, 1, -0.5, 0.5, 0.5,
-3.903919, 1, -5.886837, 1, 1.5, 0.5, 0.5,
-3.903919, 1, -5.886837, 0, 1.5, 0.5, 0.5,
-3.903919, 2, -5.886837, 0, -0.5, 0.5, 0.5,
-3.903919, 2, -5.886837, 1, -0.5, 0.5, 0.5,
-3.903919, 2, -5.886837, 1, 1.5, 0.5, 0.5,
-3.903919, 2, -5.886837, 0, 1.5, 0.5, 0.5,
-3.903919, 3, -5.886837, 0, -0.5, 0.5, 0.5,
-3.903919, 3, -5.886837, 1, -0.5, 0.5, 0.5,
-3.903919, 3, -5.886837, 1, 1.5, 0.5, 0.5,
-3.903919, 3, -5.886837, 0, 1.5, 0.5, 0.5
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
-3.398448, -3.174976, -4,
-3.398448, -3.174976, 4,
-3.398448, -3.174976, -4,
-3.566938, -3.338424, -4,
-3.398448, -3.174976, -2,
-3.566938, -3.338424, -2,
-3.398448, -3.174976, 0,
-3.566938, -3.338424, 0,
-3.398448, -3.174976, 2,
-3.566938, -3.338424, 2,
-3.398448, -3.174976, 4,
-3.566938, -3.338424, 4
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
-3.903919, -3.665319, -4, 0, -0.5, 0.5, 0.5,
-3.903919, -3.665319, -4, 1, -0.5, 0.5, 0.5,
-3.903919, -3.665319, -4, 1, 1.5, 0.5, 0.5,
-3.903919, -3.665319, -4, 0, 1.5, 0.5, 0.5,
-3.903919, -3.665319, -2, 0, -0.5, 0.5, 0.5,
-3.903919, -3.665319, -2, 1, -0.5, 0.5, 0.5,
-3.903919, -3.665319, -2, 1, 1.5, 0.5, 0.5,
-3.903919, -3.665319, -2, 0, 1.5, 0.5, 0.5,
-3.903919, -3.665319, 0, 0, -0.5, 0.5, 0.5,
-3.903919, -3.665319, 0, 1, -0.5, 0.5, 0.5,
-3.903919, -3.665319, 0, 1, 1.5, 0.5, 0.5,
-3.903919, -3.665319, 0, 0, 1.5, 0.5, 0.5,
-3.903919, -3.665319, 2, 0, -0.5, 0.5, 0.5,
-3.903919, -3.665319, 2, 1, -0.5, 0.5, 0.5,
-3.903919, -3.665319, 2, 1, 1.5, 0.5, 0.5,
-3.903919, -3.665319, 2, 0, 1.5, 0.5, 0.5,
-3.903919, -3.665319, 4, 0, -0.5, 0.5, 0.5,
-3.903919, -3.665319, 4, 1, -0.5, 0.5, 0.5,
-3.903919, -3.665319, 4, 1, 1.5, 0.5, 0.5,
-3.903919, -3.665319, 4, 0, 1.5, 0.5, 0.5
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
-3.398448, -3.174976, -5.100581,
-3.398448, 3.362935, -5.100581,
-3.398448, -3.174976, 5.382833,
-3.398448, 3.362935, 5.382833,
-3.398448, -3.174976, -5.100581,
-3.398448, -3.174976, 5.382833,
-3.398448, 3.362935, -5.100581,
-3.398448, 3.362935, 5.382833,
-3.398448, -3.174976, -5.100581,
3.341169, -3.174976, -5.100581,
-3.398448, -3.174976, 5.382833,
3.341169, -3.174976, 5.382833,
-3.398448, 3.362935, -5.100581,
3.341169, 3.362935, -5.100581,
-3.398448, 3.362935, 5.382833,
3.341169, 3.362935, 5.382833,
3.341169, -3.174976, -5.100581,
3.341169, 3.362935, -5.100581,
3.341169, -3.174976, 5.382833,
3.341169, 3.362935, 5.382833,
3.341169, -3.174976, -5.100581,
3.341169, -3.174976, 5.382833,
3.341169, 3.362935, -5.100581,
3.341169, 3.362935, 5.382833
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
var radius = 7.515076;
var distance = 33.43542;
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
mvMatrix.translate( 0.0286392, -0.09397948, -0.1411259 );
mvMatrix.scale( 1.205625, 1.24282, 0.7750764 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.43542);
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
fluroxypyr-meptyl<-read.table("fluroxypyr-meptyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fluroxypyr-meptyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'fluroxypyr' not found
```

```r
y<-fluroxypyr-meptyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'fluroxypyr' not found
```

```r
z<-fluroxypyr-meptyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'fluroxypyr' not found
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
-3.300298, 0.1824672, -0.2876895, 0, 0, 1, 1, 1,
-3.005218, -2.342755, -1.127832, 1, 0, 0, 1, 1,
-2.937607, 0.0252161, 0.1608384, 1, 0, 0, 1, 1,
-2.869037, -0.1627514, 0.1659616, 1, 0, 0, 1, 1,
-2.778855, -0.3018439, -1.406166, 1, 0, 0, 1, 1,
-2.620922, 1.48546, -1.449723, 1, 0, 0, 1, 1,
-2.574813, -0.2644494, -1.818121, 0, 0, 0, 1, 1,
-2.557903, -0.713764, -0.7424647, 0, 0, 0, 1, 1,
-2.533533, -0.8151284, -1.780689, 0, 0, 0, 1, 1,
-2.495849, 0.5219719, 0.5152878, 0, 0, 0, 1, 1,
-2.479255, 0.6402943, -1.821381, 0, 0, 0, 1, 1,
-2.434991, 0.6093537, 0.4990083, 0, 0, 0, 1, 1,
-2.37047, -1.854972, -1.774414, 0, 0, 0, 1, 1,
-2.354493, 1.359122, -2.317201, 1, 1, 1, 1, 1,
-2.326452, -0.9684258, -2.016035, 1, 1, 1, 1, 1,
-2.325034, 1.023835, -0.7055025, 1, 1, 1, 1, 1,
-2.238255, -1.298549, -2.043596, 1, 1, 1, 1, 1,
-2.212573, 0.2908526, -2.552063, 1, 1, 1, 1, 1,
-2.186113, -0.1103166, -1.68668, 1, 1, 1, 1, 1,
-2.113947, 0.5507952, -2.216471, 1, 1, 1, 1, 1,
-2.081788, 0.09896298, -0.9245105, 1, 1, 1, 1, 1,
-2.052769, 0.2412726, -1.741754, 1, 1, 1, 1, 1,
-2.011743, -0.9530272, -1.72752, 1, 1, 1, 1, 1,
-2.010026, -0.1789693, -2.831731, 1, 1, 1, 1, 1,
-1.990313, 1.346828, -0.4657744, 1, 1, 1, 1, 1,
-1.984588, 0.303984, -1.491786, 1, 1, 1, 1, 1,
-1.971572, 0.3224809, -0.8650826, 1, 1, 1, 1, 1,
-1.953778, -0.5222941, -2.831506, 1, 1, 1, 1, 1,
-1.942867, 2.028945, -0.1973448, 0, 0, 1, 1, 1,
-1.940498, 0.1225853, -2.145054, 1, 0, 0, 1, 1,
-1.938641, -1.748428, -1.760521, 1, 0, 0, 1, 1,
-1.928544, -2.443885, -2.874959, 1, 0, 0, 1, 1,
-1.915069, -2.907432, -4.203247, 1, 0, 0, 1, 1,
-1.871379, 0.3104975, -0.1345109, 1, 0, 0, 1, 1,
-1.868093, 0.886256, -0.3751612, 0, 0, 0, 1, 1,
-1.865987, 0.9651275, -0.830521, 0, 0, 0, 1, 1,
-1.855555, 2.406476, -1.551589, 0, 0, 0, 1, 1,
-1.821364, -1.197804, -1.780874, 0, 0, 0, 1, 1,
-1.820152, -1.466469, -2.728722, 0, 0, 0, 1, 1,
-1.802201, -0.9833459, -1.810503, 0, 0, 0, 1, 1,
-1.785346, -0.8337274, -1.65367, 0, 0, 0, 1, 1,
-1.766026, 0.1939483, -3.156474, 1, 1, 1, 1, 1,
-1.765894, -1.949406, -2.497856, 1, 1, 1, 1, 1,
-1.746522, -0.875388, -1.526838, 1, 1, 1, 1, 1,
-1.74613, -0.06757735, -3.330875, 1, 1, 1, 1, 1,
-1.745955, -0.446539, -3.47411, 1, 1, 1, 1, 1,
-1.743228, -0.3830209, -2.964479, 1, 1, 1, 1, 1,
-1.738438, -1.091645, -1.795394, 1, 1, 1, 1, 1,
-1.714508, 2.433825, -0.5596156, 1, 1, 1, 1, 1,
-1.714123, 0.06070572, -0.6664698, 1, 1, 1, 1, 1,
-1.713792, -0.06436575, -4.408887, 1, 1, 1, 1, 1,
-1.704075, 1.538466, -0.8435928, 1, 1, 1, 1, 1,
-1.700267, -1.466808, -2.09017, 1, 1, 1, 1, 1,
-1.697152, 0.7772107, -0.2060768, 1, 1, 1, 1, 1,
-1.69563, 1.167573, -0.4003206, 1, 1, 1, 1, 1,
-1.691992, 1.044441, -1.22206, 1, 1, 1, 1, 1,
-1.679089, -0.6463763, -2.629632, 0, 0, 1, 1, 1,
-1.67579, -1.867394, -2.678001, 1, 0, 0, 1, 1,
-1.672182, -0.1778178, -2.692522, 1, 0, 0, 1, 1,
-1.671948, -1.347591, -3.377388, 1, 0, 0, 1, 1,
-1.664044, -1.082069, -1.941975, 1, 0, 0, 1, 1,
-1.642278, -1.577974, -1.593393, 1, 0, 0, 1, 1,
-1.613929, 1.19768, -1.945435, 0, 0, 0, 1, 1,
-1.605753, 0.525831, -1.778551, 0, 0, 0, 1, 1,
-1.600637, 1.639843, 0.973031, 0, 0, 0, 1, 1,
-1.592954, -0.08779313, -0.9779189, 0, 0, 0, 1, 1,
-1.591631, 0.1719885, -0.5143289, 0, 0, 0, 1, 1,
-1.55411, 0.1880751, -0.5413669, 0, 0, 0, 1, 1,
-1.542267, -1.084086, -3.727635, 0, 0, 0, 1, 1,
-1.538811, -0.5937051, -1.192512, 1, 1, 1, 1, 1,
-1.531952, 0.2562287, -2.920479, 1, 1, 1, 1, 1,
-1.520946, 1.94096, -0.5080118, 1, 1, 1, 1, 1,
-1.515611, 0.6070679, -1.298571, 1, 1, 1, 1, 1,
-1.504069, -0.3085358, -1.579161, 1, 1, 1, 1, 1,
-1.503908, 0.8366306, -0.5676138, 1, 1, 1, 1, 1,
-1.484667, -0.4490079, -2.702034, 1, 1, 1, 1, 1,
-1.484021, -0.2415775, -1.742438, 1, 1, 1, 1, 1,
-1.471642, -0.5564082, -1.421176, 1, 1, 1, 1, 1,
-1.465544, 0.5409397, -0.4597583, 1, 1, 1, 1, 1,
-1.461766, 2.902628, -1.333549, 1, 1, 1, 1, 1,
-1.461077, 0.4230264, -2.689514, 1, 1, 1, 1, 1,
-1.460071, 1.506079, -2.302746, 1, 1, 1, 1, 1,
-1.457124, 0.5873099, -1.152722, 1, 1, 1, 1, 1,
-1.44636, 1.794029, -1.889619, 1, 1, 1, 1, 1,
-1.439812, -1.146313, -3.126538, 0, 0, 1, 1, 1,
-1.437949, 0.3982368, -1.384657, 1, 0, 0, 1, 1,
-1.436201, -0.2757589, -2.261637, 1, 0, 0, 1, 1,
-1.426846, -0.03151191, -0.9897898, 1, 0, 0, 1, 1,
-1.42557, -0.6539675, -2.290567, 1, 0, 0, 1, 1,
-1.414582, -1.070595, -1.25515, 1, 0, 0, 1, 1,
-1.410682, 0.6447997, -1.028173, 0, 0, 0, 1, 1,
-1.404397, 1.547887, -1.156156, 0, 0, 0, 1, 1,
-1.397558, 0.3412578, -1.809056, 0, 0, 0, 1, 1,
-1.397193, -0.6197786, -1.967324, 0, 0, 0, 1, 1,
-1.392197, 0.1553928, -0.6280609, 0, 0, 0, 1, 1,
-1.39183, -0.9167841, -1.934519, 0, 0, 0, 1, 1,
-1.389485, 1.143182, -1.317188, 0, 0, 0, 1, 1,
-1.388041, -1.924894, -0.9952924, 1, 1, 1, 1, 1,
-1.386433, 1.072265, -0.1886016, 1, 1, 1, 1, 1,
-1.378606, 1.06343, -0.8016958, 1, 1, 1, 1, 1,
-1.371335, -0.5309465, -2.024788, 1, 1, 1, 1, 1,
-1.361757, 1.798569, -2.173476, 1, 1, 1, 1, 1,
-1.360669, -1.818618, -1.380528, 1, 1, 1, 1, 1,
-1.342551, 0.9435922, -1.182367, 1, 1, 1, 1, 1,
-1.339855, 0.1880858, -2.061815, 1, 1, 1, 1, 1,
-1.339617, -0.8880371, -2.467614, 1, 1, 1, 1, 1,
-1.335755, 0.2872942, -1.45196, 1, 1, 1, 1, 1,
-1.334015, -0.3038904, -1.698501, 1, 1, 1, 1, 1,
-1.327582, 0.1649565, -0.002168174, 1, 1, 1, 1, 1,
-1.321828, 3.046852, -2.200014, 1, 1, 1, 1, 1,
-1.320225, -0.5499716, -2.188025, 1, 1, 1, 1, 1,
-1.319504, -0.6576478, -1.176036, 1, 1, 1, 1, 1,
-1.316182, 1.391048, 0.01761744, 0, 0, 1, 1, 1,
-1.313802, -1.017156, -1.543541, 1, 0, 0, 1, 1,
-1.310109, -0.0097737, -3.014154, 1, 0, 0, 1, 1,
-1.307658, 1.332159, -0.2706594, 1, 0, 0, 1, 1,
-1.301654, 1.216635, -1.036904, 1, 0, 0, 1, 1,
-1.298137, 0.5281581, -0.2975933, 1, 0, 0, 1, 1,
-1.28812, -0.3319002, -1.369004, 0, 0, 0, 1, 1,
-1.287547, -1.272769, -1.67313, 0, 0, 0, 1, 1,
-1.278521, 0.1418588, -0.562834, 0, 0, 0, 1, 1,
-1.276883, 1.140077, -0.8746151, 0, 0, 0, 1, 1,
-1.273733, 0.1903741, -2.137779, 0, 0, 0, 1, 1,
-1.26871, -0.1796772, -2.87471, 0, 0, 0, 1, 1,
-1.265619, -1.042074, -2.502491, 0, 0, 0, 1, 1,
-1.259477, -0.07114364, -1.07266, 1, 1, 1, 1, 1,
-1.259267, 0.121691, -2.798766, 1, 1, 1, 1, 1,
-1.254112, -0.1941456, -0.8732503, 1, 1, 1, 1, 1,
-1.24845, 0.6844383, -0.4939095, 1, 1, 1, 1, 1,
-1.239075, 0.88679, -1.330668, 1, 1, 1, 1, 1,
-1.232908, 0.4580692, -2.566329, 1, 1, 1, 1, 1,
-1.230927, 1.505087, -1.10177, 1, 1, 1, 1, 1,
-1.219242, -1.131398, -2.598798, 1, 1, 1, 1, 1,
-1.198139, 1.494453, -1.085081, 1, 1, 1, 1, 1,
-1.193472, 1.90037, 0.5107059, 1, 1, 1, 1, 1,
-1.179554, -0.1865278, -2.501592, 1, 1, 1, 1, 1,
-1.174382, -1.306178, -3.384306, 1, 1, 1, 1, 1,
-1.16889, -0.06737674, -0.7670785, 1, 1, 1, 1, 1,
-1.165607, -1.688424, -2.860671, 1, 1, 1, 1, 1,
-1.164269, 0.7113881, -2.405705, 1, 1, 1, 1, 1,
-1.163735, -1.504485, -4.096379, 0, 0, 1, 1, 1,
-1.160173, -1.642663, -1.969457, 1, 0, 0, 1, 1,
-1.148902, -0.6266102, -1.389938, 1, 0, 0, 1, 1,
-1.142553, -0.4181699, -1.697596, 1, 0, 0, 1, 1,
-1.141013, -0.7361112, -2.629416, 1, 0, 0, 1, 1,
-1.137111, 1.592741, -1.903243, 1, 0, 0, 1, 1,
-1.136264, -2.179317, -2.897814, 0, 0, 0, 1, 1,
-1.126783, 1.135344, -1.450908, 0, 0, 0, 1, 1,
-1.122471, 0.1852945, -1.135031, 0, 0, 0, 1, 1,
-1.120991, -0.007844052, -2.132911, 0, 0, 0, 1, 1,
-1.113087, 0.3426724, 0.8478131, 0, 0, 0, 1, 1,
-1.110899, -0.08518879, -0.7270479, 0, 0, 0, 1, 1,
-1.1086, -1.728511, -2.111229, 0, 0, 0, 1, 1,
-1.108336, -1.157295, -2.201756, 1, 1, 1, 1, 1,
-1.099004, -1.292667, -2.884787, 1, 1, 1, 1, 1,
-1.098339, 1.290918, -3.414389, 1, 1, 1, 1, 1,
-1.095391, -0.1574773, -1.424404, 1, 1, 1, 1, 1,
-1.091953, 0.4535391, -1.774009, 1, 1, 1, 1, 1,
-1.090531, 1.550338, -2.01549, 1, 1, 1, 1, 1,
-1.090406, -0.2402533, -3.11508, 1, 1, 1, 1, 1,
-1.089847, 0.9569521, 0.8363153, 1, 1, 1, 1, 1,
-1.089582, -1.446553, -2.016467, 1, 1, 1, 1, 1,
-1.089237, 0.01583752, -1.735242, 1, 1, 1, 1, 1,
-1.082797, -1.383219, -3.40611, 1, 1, 1, 1, 1,
-1.082715, 0.2745471, 0.2003809, 1, 1, 1, 1, 1,
-1.067383, -1.253482, -2.428705, 1, 1, 1, 1, 1,
-1.066828, 0.3928847, -2.759872, 1, 1, 1, 1, 1,
-1.064429, -0.2974828, -0.04592758, 1, 1, 1, 1, 1,
-1.058869, 1.080078, 0.4037091, 0, 0, 1, 1, 1,
-1.055996, -1.166092, -3.433371, 1, 0, 0, 1, 1,
-1.043057, -0.3185475, -1.046157, 1, 0, 0, 1, 1,
-1.04116, 0.3711984, -2.558026, 1, 0, 0, 1, 1,
-1.037973, 0.6310307, -2.114016, 1, 0, 0, 1, 1,
-1.030739, -1.710392, -4.075341, 1, 0, 0, 1, 1,
-1.030385, 0.8965042, 1.091558, 0, 0, 0, 1, 1,
-1.029188, 0.4477237, -1.381863, 0, 0, 0, 1, 1,
-1.024477, 1.112125, -0.7933269, 0, 0, 0, 1, 1,
-1.020964, 0.1880702, -2.063703, 0, 0, 0, 1, 1,
-1.018643, -1.847585, -4.787964, 0, 0, 0, 1, 1,
-1.00553, -1.774142, -3.521819, 0, 0, 0, 1, 1,
-0.9982784, 2.105728, -1.684794, 0, 0, 0, 1, 1,
-0.9972911, -1.108251, -2.558654, 1, 1, 1, 1, 1,
-0.9908685, -1.065207, -2.912733, 1, 1, 1, 1, 1,
-0.9900811, 2.25683, 0.1139103, 1, 1, 1, 1, 1,
-0.9893966, 0.835272, -1.492105, 1, 1, 1, 1, 1,
-0.9879773, 0.2887601, -0.5018227, 1, 1, 1, 1, 1,
-0.9815322, 0.08212811, 0.6259485, 1, 1, 1, 1, 1,
-0.9804426, -0.325573, -2.533535, 1, 1, 1, 1, 1,
-0.9790835, 0.04245052, -1.163444, 1, 1, 1, 1, 1,
-0.9720055, -0.2018944, -1.286246, 1, 1, 1, 1, 1,
-0.9659563, -0.03887298, -2.837332, 1, 1, 1, 1, 1,
-0.9540378, -1.08625, -2.264231, 1, 1, 1, 1, 1,
-0.9539676, 0.4323117, -1.598025, 1, 1, 1, 1, 1,
-0.9472452, -1.074723, -2.447546, 1, 1, 1, 1, 1,
-0.9462574, 0.2379906, -2.051477, 1, 1, 1, 1, 1,
-0.9447498, -0.5664305, -2.623563, 1, 1, 1, 1, 1,
-0.9447057, -0.1850792, -0.8359439, 0, 0, 1, 1, 1,
-0.9388625, -0.1953295, -1.686614, 1, 0, 0, 1, 1,
-0.938763, -1.201833, -2.682796, 1, 0, 0, 1, 1,
-0.9362145, 1.041501, -0.9078689, 1, 0, 0, 1, 1,
-0.9299914, 1.428348, -2.133904, 1, 0, 0, 1, 1,
-0.9167927, -0.8718393, -3.238794, 1, 0, 0, 1, 1,
-0.9129449, -0.1329097, -3.078549, 0, 0, 0, 1, 1,
-0.9113792, 1.582934, -1.111596, 0, 0, 0, 1, 1,
-0.9058415, 0.8825019, -0.1371965, 0, 0, 0, 1, 1,
-0.9006718, -0.5217491, -2.079255, 0, 0, 0, 1, 1,
-0.8983068, 0.7702248, -1.178691, 0, 0, 0, 1, 1,
-0.8932148, -0.2280591, -1.886358, 0, 0, 0, 1, 1,
-0.8930175, 0.1136755, -0.1500543, 0, 0, 0, 1, 1,
-0.8928947, 1.53749, -0.3843568, 1, 1, 1, 1, 1,
-0.879866, -0.3683094, -1.899838, 1, 1, 1, 1, 1,
-0.8759193, 0.8191879, 0.2577893, 1, 1, 1, 1, 1,
-0.8757544, 0.8394826, -1.278373, 1, 1, 1, 1, 1,
-0.8711119, -0.06221979, -1.420339, 1, 1, 1, 1, 1,
-0.869393, 0.8580629, -1.187849, 1, 1, 1, 1, 1,
-0.8606548, 0.8002036, -0.6233938, 1, 1, 1, 1, 1,
-0.8603887, 0.4122318, -1.618413, 1, 1, 1, 1, 1,
-0.8577361, 0.335046, -2.787666, 1, 1, 1, 1, 1,
-0.8576219, 0.1773768, -1.733592, 1, 1, 1, 1, 1,
-0.8549843, 1.340931, 0.550039, 1, 1, 1, 1, 1,
-0.848929, -1.148129, -2.926084, 1, 1, 1, 1, 1,
-0.8462445, 0.6985701, -1.445279, 1, 1, 1, 1, 1,
-0.8462198, 0.549885, 0.7624788, 1, 1, 1, 1, 1,
-0.8446285, -0.201288, -2.897583, 1, 1, 1, 1, 1,
-0.8380386, 0.4893688, 1.802973, 0, 0, 1, 1, 1,
-0.8366125, 0.9289603, -0.2249326, 1, 0, 0, 1, 1,
-0.8359783, 1.300718, -0.9512161, 1, 0, 0, 1, 1,
-0.8352302, 0.5929947, 0.05880871, 1, 0, 0, 1, 1,
-0.8344837, -0.02035257, -0.01864834, 1, 0, 0, 1, 1,
-0.8335018, 2.090334, -0.5691152, 1, 0, 0, 1, 1,
-0.8299653, -0.8218715, -1.664642, 0, 0, 0, 1, 1,
-0.8262934, -1.216536, -1.642347, 0, 0, 0, 1, 1,
-0.822286, -0.5487672, -4.272712, 0, 0, 0, 1, 1,
-0.8130112, 1.736996, -0.9552879, 0, 0, 0, 1, 1,
-0.8104144, 0.3884372, -0.6142265, 0, 0, 0, 1, 1,
-0.8084742, 0.4875864, -1.988041, 0, 0, 0, 1, 1,
-0.8009396, 0.2441459, -3.001317, 0, 0, 0, 1, 1,
-0.7988436, 0.6300294, -0.4880267, 1, 1, 1, 1, 1,
-0.7954348, 0.8832269, 0.02183238, 1, 1, 1, 1, 1,
-0.7911275, -0.1752081, -1.939052, 1, 1, 1, 1, 1,
-0.7903443, -1.658628, -2.233273, 1, 1, 1, 1, 1,
-0.7795993, -0.984317, -2.846843, 1, 1, 1, 1, 1,
-0.7753229, -2.112795, -2.574157, 1, 1, 1, 1, 1,
-0.7730462, 1.287724, -0.2004787, 1, 1, 1, 1, 1,
-0.7676766, 1.103604, 0.5611628, 1, 1, 1, 1, 1,
-0.7573507, -0.1914778, -0.9393459, 1, 1, 1, 1, 1,
-0.7510352, 0.1192086, -0.914686, 1, 1, 1, 1, 1,
-0.7503614, -0.6162342, -3.455446, 1, 1, 1, 1, 1,
-0.7483994, 0.4711068, -0.2840622, 1, 1, 1, 1, 1,
-0.7393813, 0.321812, -2.270253, 1, 1, 1, 1, 1,
-0.7377358, -1.039848, -4.94791, 1, 1, 1, 1, 1,
-0.7325518, -1.61796, -1.805539, 1, 1, 1, 1, 1,
-0.7271338, 0.9011475, -0.6098825, 0, 0, 1, 1, 1,
-0.7245913, 0.7670856, -1.952262, 1, 0, 0, 1, 1,
-0.7244888, -0.4542741, -1.273658, 1, 0, 0, 1, 1,
-0.7191561, 0.7569814, 0.2490891, 1, 0, 0, 1, 1,
-0.7164904, -1.225034, -2.52064, 1, 0, 0, 1, 1,
-0.7148896, -0.07600597, -1.715253, 1, 0, 0, 1, 1,
-0.7144611, 0.4298978, 0.006821066, 0, 0, 0, 1, 1,
-0.7135063, -0.115595, -1.230147, 0, 0, 0, 1, 1,
-0.71243, -0.302493, -2.625431, 0, 0, 0, 1, 1,
-0.7058945, -0.405784, -0.3798313, 0, 0, 0, 1, 1,
-0.7046043, 0.3308851, -1.826219, 0, 0, 0, 1, 1,
-0.7044235, 0.7303122, 0.08719879, 0, 0, 0, 1, 1,
-0.7009087, 0.1536154, -0.6274784, 0, 0, 0, 1, 1,
-0.6852525, 0.48733, 0.5609244, 1, 1, 1, 1, 1,
-0.6852136, 1.210353, -0.7482841, 1, 1, 1, 1, 1,
-0.6850718, -0.4183771, -1.981626, 1, 1, 1, 1, 1,
-0.6803653, 0.6598812, -0.5940532, 1, 1, 1, 1, 1,
-0.6740029, -0.3300444, -3.01103, 1, 1, 1, 1, 1,
-0.6737476, -0.4152403, -2.103627, 1, 1, 1, 1, 1,
-0.6723566, -1.724072, -2.519443, 1, 1, 1, 1, 1,
-0.6710691, 0.6281027, -1.446554, 1, 1, 1, 1, 1,
-0.6688365, -0.5477552, -2.975863, 1, 1, 1, 1, 1,
-0.6678654, -0.03673734, -0.9871087, 1, 1, 1, 1, 1,
-0.6608561, -0.1492757, -1.425274, 1, 1, 1, 1, 1,
-0.6603748, -0.4546742, -2.852181, 1, 1, 1, 1, 1,
-0.6574653, 0.2724589, -0.7040667, 1, 1, 1, 1, 1,
-0.656117, 0.5486975, 0.1815473, 1, 1, 1, 1, 1,
-0.6523886, -0.902908, -1.913017, 1, 1, 1, 1, 1,
-0.6498355, 1.643741, -0.8489945, 0, 0, 1, 1, 1,
-0.644085, 0.3186088, -2.708247, 1, 0, 0, 1, 1,
-0.6430771, 0.677062, -0.3379641, 1, 0, 0, 1, 1,
-0.6416001, 0.1559518, -1.771814, 1, 0, 0, 1, 1,
-0.6411869, -0.6457822, -1.939441, 1, 0, 0, 1, 1,
-0.6325384, 0.8245254, -0.02204788, 1, 0, 0, 1, 1,
-0.6296566, 0.7364524, -3.114404, 0, 0, 0, 1, 1,
-0.6266279, -0.1806239, -0.5489781, 0, 0, 0, 1, 1,
-0.6214594, 0.431762, -2.410654, 0, 0, 0, 1, 1,
-0.6139839, -1.322677, -2.28732, 0, 0, 0, 1, 1,
-0.6103669, -0.4370161, -1.755553, 0, 0, 0, 1, 1,
-0.6078732, 0.1496624, -1.169984, 0, 0, 0, 1, 1,
-0.6049684, 0.7905238, -1.307772, 0, 0, 0, 1, 1,
-0.6028415, 0.7518932, -1.048113, 1, 1, 1, 1, 1,
-0.6012964, 0.1465607, -1.430766, 1, 1, 1, 1, 1,
-0.600837, -0.002207677, -1.94804, 1, 1, 1, 1, 1,
-0.5987542, 0.7483428, 0.2136691, 1, 1, 1, 1, 1,
-0.5972617, -0.9125009, -1.008652, 1, 1, 1, 1, 1,
-0.5924955, 0.845263, -2.588078, 1, 1, 1, 1, 1,
-0.592073, -0.8516741, -3.239927, 1, 1, 1, 1, 1,
-0.5914971, 0.9383035, -0.1356657, 1, 1, 1, 1, 1,
-0.5845416, -0.55629, -2.759869, 1, 1, 1, 1, 1,
-0.5819876, -0.9004141, -2.320063, 1, 1, 1, 1, 1,
-0.5802681, -0.2222109, -1.04634, 1, 1, 1, 1, 1,
-0.5799941, 1.503362, 0.7347964, 1, 1, 1, 1, 1,
-0.5764307, -1.083955, -1.035338, 1, 1, 1, 1, 1,
-0.5736828, -1.340651, -4.051488, 1, 1, 1, 1, 1,
-0.5701563, -0.2709325, -2.344074, 1, 1, 1, 1, 1,
-0.5677443, 1.54338, -1.521877, 0, 0, 1, 1, 1,
-0.5617546, -0.6341705, -2.742587, 1, 0, 0, 1, 1,
-0.55997, 0.8182108, -0.3248118, 1, 0, 0, 1, 1,
-0.5591444, -0.07261585, -1.930889, 1, 0, 0, 1, 1,
-0.5564468, -0.3488402, -2.773909, 1, 0, 0, 1, 1,
-0.5545356, -0.1392417, 0.2402005, 1, 0, 0, 1, 1,
-0.553721, -0.01924164, -1.556537, 0, 0, 0, 1, 1,
-0.5508505, -1.635631, -1.953042, 0, 0, 0, 1, 1,
-0.5508057, 0.2527759, 0.4341858, 0, 0, 0, 1, 1,
-0.5435486, 0.9582418, -0.4581631, 0, 0, 0, 1, 1,
-0.5412586, 0.3590847, -0.8569305, 0, 0, 0, 1, 1,
-0.5388573, 1.059518, -1.392766, 0, 0, 0, 1, 1,
-0.5364183, -0.3514872, -2.444711, 0, 0, 0, 1, 1,
-0.5330835, -0.3134625, -0.7685085, 1, 1, 1, 1, 1,
-0.5327479, -0.8291131, -1.795556, 1, 1, 1, 1, 1,
-0.529786, 0.4118923, -0.09237593, 1, 1, 1, 1, 1,
-0.5270011, 0.9636158, -1.835767, 1, 1, 1, 1, 1,
-0.5263618, 0.7063408, -0.340144, 1, 1, 1, 1, 1,
-0.5262918, 1.818265, -0.005118101, 1, 1, 1, 1, 1,
-0.5132102, 0.9636585, 0.07221573, 1, 1, 1, 1, 1,
-0.5128048, -0.1752268, -3.163983, 1, 1, 1, 1, 1,
-0.5089214, 1.618839, -1.209732, 1, 1, 1, 1, 1,
-0.5076716, -1.925359, -3.749673, 1, 1, 1, 1, 1,
-0.5024116, -2.832498, -1.702633, 1, 1, 1, 1, 1,
-0.4980052, 1.091612, -1.132109, 1, 1, 1, 1, 1,
-0.4892813, 0.3214928, -0.3338008, 1, 1, 1, 1, 1,
-0.486837, 1.237606, -1.114495, 1, 1, 1, 1, 1,
-0.4820154, -0.506733, -1.350145, 1, 1, 1, 1, 1,
-0.4773408, 0.2203331, -0.2731135, 0, 0, 1, 1, 1,
-0.475133, -0.9892154, -3.87501, 1, 0, 0, 1, 1,
-0.4730107, 0.1679782, -2.322496, 1, 0, 0, 1, 1,
-0.4693955, -0.01586702, -1.657293, 1, 0, 0, 1, 1,
-0.4688109, -0.05096899, -1.221977, 1, 0, 0, 1, 1,
-0.4609552, 1.299441, -0.5833391, 1, 0, 0, 1, 1,
-0.4593927, 0.5679451, -1.360404, 0, 0, 0, 1, 1,
-0.4567029, 1.165917, 1.525936, 0, 0, 0, 1, 1,
-0.4564952, 1.136716, -1.076138, 0, 0, 0, 1, 1,
-0.4535537, -1.821644, -4.783906, 0, 0, 0, 1, 1,
-0.4505391, -0.8630615, -3.674081, 0, 0, 0, 1, 1,
-0.4495041, -0.1566101, -1.124213, 0, 0, 0, 1, 1,
-0.4482346, -0.8435744, -0.8264956, 0, 0, 0, 1, 1,
-0.4471498, 2.303243, -0.5587583, 1, 1, 1, 1, 1,
-0.4470278, -0.388807, -2.393244, 1, 1, 1, 1, 1,
-0.4467697, 0.1637201, -2.299739, 1, 1, 1, 1, 1,
-0.4443585, 1.050209, 0.1521339, 1, 1, 1, 1, 1,
-0.4403259, 1.343194, -0.4251453, 1, 1, 1, 1, 1,
-0.4401003, 0.8138147, -0.5820289, 1, 1, 1, 1, 1,
-0.4386109, -0.2680044, -2.249154, 1, 1, 1, 1, 1,
-0.4375932, 0.6365519, -1.045849, 1, 1, 1, 1, 1,
-0.4271997, 0.06439622, -1.721237, 1, 1, 1, 1, 1,
-0.4211296, 1.962331, 0.9904883, 1, 1, 1, 1, 1,
-0.4208359, 0.5214942, 0.4694754, 1, 1, 1, 1, 1,
-0.4078232, 1.679805, 2.676376, 1, 1, 1, 1, 1,
-0.4071443, -0.2558497, -0.946671, 1, 1, 1, 1, 1,
-0.4048835, 0.2351519, -2.161872, 1, 1, 1, 1, 1,
-0.4015357, 1.181071, -1.431975, 1, 1, 1, 1, 1,
-0.3992416, -0.5599433, -2.62411, 0, 0, 1, 1, 1,
-0.3984114, 1.41484, -0.531049, 1, 0, 0, 1, 1,
-0.3944756, 0.7641616, -1.188402, 1, 0, 0, 1, 1,
-0.3928116, 0.4518209, 1.001276, 1, 0, 0, 1, 1,
-0.390359, 0.9186519, -1.164872, 1, 0, 0, 1, 1,
-0.3862957, 1.15049, 0.2517971, 1, 0, 0, 1, 1,
-0.3845396, 0.483402, 0.6264926, 0, 0, 0, 1, 1,
-0.3844084, 1.178442, 0.1742115, 0, 0, 0, 1, 1,
-0.3775119, 0.3875008, -1.635481, 0, 0, 0, 1, 1,
-0.3762183, 0.2548573, -1.644243, 0, 0, 0, 1, 1,
-0.3740279, 0.6345644, 0.5832829, 0, 0, 0, 1, 1,
-0.3685267, -1.710375, -4.143066, 0, 0, 0, 1, 1,
-0.3670355, 0.5847999, 0.2881297, 0, 0, 0, 1, 1,
-0.3666351, -1.170893, -3.207432, 1, 1, 1, 1, 1,
-0.3664865, -2.515115, -3.334894, 1, 1, 1, 1, 1,
-0.3653483, -0.8918069, -1.872682, 1, 1, 1, 1, 1,
-0.3604065, 1.594628, 0.3766837, 1, 1, 1, 1, 1,
-0.3602173, -1.005605, -2.062376, 1, 1, 1, 1, 1,
-0.3596673, -1.634109, -2.998267, 1, 1, 1, 1, 1,
-0.3589637, 0.4911621, -1.033117, 1, 1, 1, 1, 1,
-0.3579431, 0.7795977, -2.560735, 1, 1, 1, 1, 1,
-0.3545692, 1.488781, -0.7859783, 1, 1, 1, 1, 1,
-0.3535192, -1.053601, -1.552387, 1, 1, 1, 1, 1,
-0.3494155, -0.5572765, -2.72071, 1, 1, 1, 1, 1,
-0.3460594, -0.8187988, -4.067572, 1, 1, 1, 1, 1,
-0.3425078, 0.288259, -1.131812, 1, 1, 1, 1, 1,
-0.341027, -0.3066713, -1.643399, 1, 1, 1, 1, 1,
-0.3385661, 1.075816, 0.7160215, 1, 1, 1, 1, 1,
-0.3372814, 2.286307, 0.6188606, 0, 0, 1, 1, 1,
-0.3362357, -0.3295374, -1.5152, 1, 0, 0, 1, 1,
-0.3334979, -0.9325571, -3.852735, 1, 0, 0, 1, 1,
-0.3318762, 1.090409, -0.9833608, 1, 0, 0, 1, 1,
-0.327271, 0.6943046, -0.645166, 1, 0, 0, 1, 1,
-0.3241226, -0.3384717, -3.489751, 1, 0, 0, 1, 1,
-0.3233381, 0.07554258, -2.264272, 0, 0, 0, 1, 1,
-0.3229204, 1.077239, -0.4707088, 0, 0, 0, 1, 1,
-0.3151057, 0.9485939, -1.007527, 0, 0, 0, 1, 1,
-0.3136721, -0.3462645, -0.970643, 0, 0, 0, 1, 1,
-0.3135038, 0.1638523, -0.7045404, 0, 0, 0, 1, 1,
-0.307421, -0.2625515, -1.33479, 0, 0, 0, 1, 1,
-0.30385, -1.431053, -3.886628, 0, 0, 0, 1, 1,
-0.3031844, -0.8857757, -2.977651, 1, 1, 1, 1, 1,
-0.3029588, -0.7708299, -2.998435, 1, 1, 1, 1, 1,
-0.3002183, -0.03892574, -2.004172, 1, 1, 1, 1, 1,
-0.2964547, -0.2845263, -2.224004, 1, 1, 1, 1, 1,
-0.2935535, -0.2351197, -2.540324, 1, 1, 1, 1, 1,
-0.2933558, -0.07615109, -1.092086, 1, 1, 1, 1, 1,
-0.2911784, 0.04228343, -1.8852, 1, 1, 1, 1, 1,
-0.2894596, -1.060335, -2.534622, 1, 1, 1, 1, 1,
-0.2871827, -2.041104, -2.957336, 1, 1, 1, 1, 1,
-0.2859406, 0.3804364, -0.4780411, 1, 1, 1, 1, 1,
-0.281143, 1.749149, 0.7582362, 1, 1, 1, 1, 1,
-0.272741, -1.069376, -3.265113, 1, 1, 1, 1, 1,
-0.2680563, -0.9951131, -3.358066, 1, 1, 1, 1, 1,
-0.264542, -0.4465363, -2.281412, 1, 1, 1, 1, 1,
-0.2633614, 1.769012, 0.6763108, 1, 1, 1, 1, 1,
-0.2628372, 0.8629627, -0.04884568, 0, 0, 1, 1, 1,
-0.2555141, 1.443841, 0.166824, 1, 0, 0, 1, 1,
-0.2552146, -0.3170753, -3.377823, 1, 0, 0, 1, 1,
-0.2543344, 0.3110272, -0.7407867, 1, 0, 0, 1, 1,
-0.2534442, -0.1347959, -3.428514, 1, 0, 0, 1, 1,
-0.2527761, 0.08081751, -0.3010916, 1, 0, 0, 1, 1,
-0.2479087, 1.417112, 0.4234866, 0, 0, 0, 1, 1,
-0.2456576, -0.1877785, -3.261948, 0, 0, 0, 1, 1,
-0.2450411, 0.774747, -0.744564, 0, 0, 0, 1, 1,
-0.2441783, 0.09052805, -1.633979, 0, 0, 0, 1, 1,
-0.2407512, 1.210479, -0.9187263, 0, 0, 0, 1, 1,
-0.2388071, 0.4325467, -1.025137, 0, 0, 0, 1, 1,
-0.2378311, 1.337765, -1.436634, 0, 0, 0, 1, 1,
-0.2341421, -1.27659, -4.129654, 1, 1, 1, 1, 1,
-0.2262096, 0.1933903, 0.3244918, 1, 1, 1, 1, 1,
-0.2183656, 0.6654474, 1.033441, 1, 1, 1, 1, 1,
-0.2136323, 0.3423521, -1.111672, 1, 1, 1, 1, 1,
-0.2102114, 0.6318472, -0.3141779, 1, 1, 1, 1, 1,
-0.2085383, -0.6626862, -3.88084, 1, 1, 1, 1, 1,
-0.2065163, -0.7104029, -2.17778, 1, 1, 1, 1, 1,
-0.2037583, -0.4274926, -1.526956, 1, 1, 1, 1, 1,
-0.2037419, 0.6483536, -0.5676758, 1, 1, 1, 1, 1,
-0.1993212, 0.2803755, -0.3807437, 1, 1, 1, 1, 1,
-0.1984964, 0.521991, -0.2730033, 1, 1, 1, 1, 1,
-0.1960585, -0.759189, -2.668075, 1, 1, 1, 1, 1,
-0.1936827, -1.488701, -1.21005, 1, 1, 1, 1, 1,
-0.1925146, -0.5959548, -2.270688, 1, 1, 1, 1, 1,
-0.1921262, -0.1342995, -1.14981, 1, 1, 1, 1, 1,
-0.1914491, 0.8918565, 0.06613116, 0, 0, 1, 1, 1,
-0.190193, -0.06313961, -4.206086, 1, 0, 0, 1, 1,
-0.1870534, 1.32178, 0.3550613, 1, 0, 0, 1, 1,
-0.1861263, -1.393834, -0.9238805, 1, 0, 0, 1, 1,
-0.1808393, -1.15313, -2.475788, 1, 0, 0, 1, 1,
-0.1739416, 1.30731, -2.421433, 1, 0, 0, 1, 1,
-0.1728044, 1.075749, 1.200009, 0, 0, 0, 1, 1,
-0.1705938, -0.9412977, -4.52526, 0, 0, 0, 1, 1,
-0.1684054, 1.131889, 0.7920413, 0, 0, 0, 1, 1,
-0.1664291, 1.085472, 0.5614719, 0, 0, 0, 1, 1,
-0.1631259, -0.5599985, -1.44047, 0, 0, 0, 1, 1,
-0.1611215, -0.5182059, -3.268906, 0, 0, 0, 1, 1,
-0.1573555, 0.59017, -1.85961, 0, 0, 0, 1, 1,
-0.1521037, 1.940343, 0.9267229, 1, 1, 1, 1, 1,
-0.1488842, 0.2617995, -1.243739, 1, 1, 1, 1, 1,
-0.1481437, 1.599578, 1.153937, 1, 1, 1, 1, 1,
-0.1465519, 0.7907969, 1.149126, 1, 1, 1, 1, 1,
-0.1450239, 1.708907, -1.348308, 1, 1, 1, 1, 1,
-0.1422868, -0.1719499, -1.19836, 1, 1, 1, 1, 1,
-0.1411895, 0.6713907, 0.3758571, 1, 1, 1, 1, 1,
-0.1376787, 0.06337146, -1.619384, 1, 1, 1, 1, 1,
-0.1368374, 1.529851, -1.457981, 1, 1, 1, 1, 1,
-0.1362986, 0.1625455, 0.2670714, 1, 1, 1, 1, 1,
-0.1362609, -1.337895, -2.477852, 1, 1, 1, 1, 1,
-0.1356137, -1.548801, -3.782258, 1, 1, 1, 1, 1,
-0.1330825, 0.5609456, -2.09049, 1, 1, 1, 1, 1,
-0.132122, 0.4955102, 0.2294054, 1, 1, 1, 1, 1,
-0.1312703, 1.214842, -0.6906024, 1, 1, 1, 1, 1,
-0.1288808, -0.3768921, -2.570577, 0, 0, 1, 1, 1,
-0.128647, 0.5782173, 0.6932396, 1, 0, 0, 1, 1,
-0.1264121, -0.8330512, -3.077708, 1, 0, 0, 1, 1,
-0.1252333, -0.0873522, -1.697023, 1, 0, 0, 1, 1,
-0.1248691, 0.2478482, -1.90619, 1, 0, 0, 1, 1,
-0.1217302, 0.399403, 2.0272, 1, 0, 0, 1, 1,
-0.1214009, 0.7348399, 0.7801412, 0, 0, 0, 1, 1,
-0.1192733, 0.3008039, 0.6708923, 0, 0, 0, 1, 1,
-0.1179723, 0.3547392, -1.28161, 0, 0, 0, 1, 1,
-0.1156032, 0.2498514, -0.5428978, 0, 0, 0, 1, 1,
-0.1049752, -0.04734016, -1.501309, 0, 0, 0, 1, 1,
-0.1043406, -0.00590063, -3.098752, 0, 0, 0, 1, 1,
-0.1037688, -0.7400813, -3.145842, 0, 0, 0, 1, 1,
-0.1026813, -0.8045769, -1.933199, 1, 1, 1, 1, 1,
-0.1025033, 0.887042, 0.811218, 1, 1, 1, 1, 1,
-0.1016764, -0.203857, -2.743147, 1, 1, 1, 1, 1,
-0.09916607, 0.5595491, -0.218192, 1, 1, 1, 1, 1,
-0.09815767, 1.009787, 0.04760174, 1, 1, 1, 1, 1,
-0.09647913, -0.887732, -3.359807, 1, 1, 1, 1, 1,
-0.09509104, -0.6880984, -1.500213, 1, 1, 1, 1, 1,
-0.0888357, -1.629197, -2.174955, 1, 1, 1, 1, 1,
-0.07801084, -1.546452, -2.618341, 1, 1, 1, 1, 1,
-0.0682165, 0.3083621, 1.898677, 1, 1, 1, 1, 1,
-0.06762055, -1.118254, -2.484426, 1, 1, 1, 1, 1,
-0.066975, -0.9480283, -3.307534, 1, 1, 1, 1, 1,
-0.06601232, -0.6612344, -2.386932, 1, 1, 1, 1, 1,
-0.06393249, -1.652463, -2.494494, 1, 1, 1, 1, 1,
-0.06189232, -0.6676405, -3.228354, 1, 1, 1, 1, 1,
-0.0611573, 0.4596556, -0.337994, 0, 0, 1, 1, 1,
-0.06014733, 0.44218, -0.8538581, 1, 0, 0, 1, 1,
-0.05337206, 2.368258, -0.2447496, 1, 0, 0, 1, 1,
-0.05217328, -0.9567625, -3.349599, 1, 0, 0, 1, 1,
-0.05213547, -1.483044, -1.898998, 1, 0, 0, 1, 1,
-0.04817554, -2.309118, -2.326576, 1, 0, 0, 1, 1,
-0.04793221, -0.8698231, -2.457203, 0, 0, 0, 1, 1,
-0.04072658, -1.069059, -1.251075, 0, 0, 0, 1, 1,
-0.03662103, 0.3606904, -0.3735908, 0, 0, 0, 1, 1,
-0.03584177, 0.3881066, 0.364826, 0, 0, 0, 1, 1,
-0.03456737, -0.2728451, -4.860059, 0, 0, 0, 1, 1,
-0.0318283, -1.446136, -2.960128, 0, 0, 0, 1, 1,
-0.02946303, -1.066338, -3.357552, 0, 0, 0, 1, 1,
-0.02744909, -1.326246, -2.730773, 1, 1, 1, 1, 1,
-0.02703142, 0.8563667, 0.4988491, 1, 1, 1, 1, 1,
-0.02619817, -1.015227, -3.724732, 1, 1, 1, 1, 1,
-0.02265771, 0.7849381, -0.6164071, 1, 1, 1, 1, 1,
-0.02254416, -0.9980162, -3.103498, 1, 1, 1, 1, 1,
-0.0194327, -0.1640132, -4.654259, 1, 1, 1, 1, 1,
-0.008310844, 1.152434, -1.104056, 1, 1, 1, 1, 1,
-0.00511391, -1.345767, -1.796989, 1, 1, 1, 1, 1,
0.000872886, 1.150508, 0.3372978, 1, 1, 1, 1, 1,
0.005268711, 1.187461, -0.6504913, 1, 1, 1, 1, 1,
0.007559691, -1.335503, 2.866669, 1, 1, 1, 1, 1,
0.008608068, -0.2631283, 3.999389, 1, 1, 1, 1, 1,
0.01862411, 0.8112577, -0.7558562, 1, 1, 1, 1, 1,
0.01979506, 0.3999697, -2.237409, 1, 1, 1, 1, 1,
0.02096506, 1.195205, -0.9123507, 1, 1, 1, 1, 1,
0.02293004, -0.5898256, 2.550323, 0, 0, 1, 1, 1,
0.02779243, -1.707397, 3.113929, 1, 0, 0, 1, 1,
0.03268696, 0.09558706, -0.7028887, 1, 0, 0, 1, 1,
0.03293122, 1.577483, -0.2417907, 1, 0, 0, 1, 1,
0.03393961, 1.247768, -1.035998, 1, 0, 0, 1, 1,
0.03680369, -0.4392455, 4.006202, 1, 0, 0, 1, 1,
0.04078862, 0.1056322, 0.01725887, 0, 0, 0, 1, 1,
0.04450493, -1.206838, 2.904984, 0, 0, 0, 1, 1,
0.04627682, 0.02345062, 1.383335, 0, 0, 0, 1, 1,
0.04659092, 1.019976, 0.3444393, 0, 0, 0, 1, 1,
0.04768538, -0.2993229, 3.307867, 0, 0, 0, 1, 1,
0.05016499, -0.9246824, 2.799311, 0, 0, 0, 1, 1,
0.05678858, 1.817916, -2.471277, 0, 0, 0, 1, 1,
0.05868107, -0.6212068, 3.149983, 1, 1, 1, 1, 1,
0.05975039, -1.599451, 3.652946, 1, 1, 1, 1, 1,
0.06107812, 2.514031, -1.153258, 1, 1, 1, 1, 1,
0.06229508, 1.947241, -2.197216, 1, 1, 1, 1, 1,
0.0624099, 0.3623207, -0.376978, 1, 1, 1, 1, 1,
0.06306456, 1.227362, 1.063052, 1, 1, 1, 1, 1,
0.06331248, -0.3887514, 3.12959, 1, 1, 1, 1, 1,
0.06427421, 0.7631273, -0.06680077, 1, 1, 1, 1, 1,
0.06470866, 1.995426, 1.077325, 1, 1, 1, 1, 1,
0.06619354, 0.04096781, 2.58935, 1, 1, 1, 1, 1,
0.07862217, 0.09342597, 2.01052, 1, 1, 1, 1, 1,
0.08007535, 0.3363991, 0.402331, 1, 1, 1, 1, 1,
0.08070084, -0.3210963, 2.402719, 1, 1, 1, 1, 1,
0.08819704, 0.5670592, -1.027903, 1, 1, 1, 1, 1,
0.0899936, 1.273452, 1.40557, 1, 1, 1, 1, 1,
0.09238002, 0.6752288, -0.08707175, 0, 0, 1, 1, 1,
0.09273277, 0.007213499, 1.285989, 1, 0, 0, 1, 1,
0.09728971, -1.463855, 3.533309, 1, 0, 0, 1, 1,
0.09967188, 2.285742, -1.460311, 1, 0, 0, 1, 1,
0.1034281, -0.05160056, 1.945373, 1, 0, 0, 1, 1,
0.1124486, 0.5664291, -0.2953796, 1, 0, 0, 1, 1,
0.113097, -1.902795, 4.304338, 0, 0, 0, 1, 1,
0.1137844, -0.8560531, 2.681423, 0, 0, 0, 1, 1,
0.1167366, -0.4857795, 1.875992, 0, 0, 0, 1, 1,
0.1195291, -0.1590783, 3.328855, 0, 0, 0, 1, 1,
0.1221754, 0.0360695, 0.1501935, 0, 0, 0, 1, 1,
0.1226852, -1.612042, 2.006543, 0, 0, 0, 1, 1,
0.1287248, 1.208631, -0.1626004, 0, 0, 0, 1, 1,
0.1298171, -0.6413416, 4.58457, 1, 1, 1, 1, 1,
0.1332081, -1.037694, 3.583746, 1, 1, 1, 1, 1,
0.1340683, 0.3034334, 0.8760084, 1, 1, 1, 1, 1,
0.1351112, -0.5792863, 2.572581, 1, 1, 1, 1, 1,
0.1351354, 0.9301152, 0.05184064, 1, 1, 1, 1, 1,
0.1428781, 0.3003845, 1.03022, 1, 1, 1, 1, 1,
0.1466987, 0.07691675, 0.3535953, 1, 1, 1, 1, 1,
0.1472946, -0.008196454, 1.923952, 1, 1, 1, 1, 1,
0.1502949, -0.8183545, 3.775523, 1, 1, 1, 1, 1,
0.151765, -0.1123312, 2.366026, 1, 1, 1, 1, 1,
0.1541771, -2.296774, 2.344527, 1, 1, 1, 1, 1,
0.1587936, -1.875863, 3.96189, 1, 1, 1, 1, 1,
0.1588359, -0.172311, 5.230162, 1, 1, 1, 1, 1,
0.1606066, 1.781113, -0.6038758, 1, 1, 1, 1, 1,
0.1608065, -0.4568941, 1.98631, 1, 1, 1, 1, 1,
0.161204, 1.02876, 0.08086071, 0, 0, 1, 1, 1,
0.1620253, -0.8750763, 2.324533, 1, 0, 0, 1, 1,
0.1645496, 0.6452062, 2.000985, 1, 0, 0, 1, 1,
0.1714347, -0.8603316, 2.560488, 1, 0, 0, 1, 1,
0.1744825, 1.355083, -1.089273, 1, 0, 0, 1, 1,
0.175064, 2.107371, 0.8043652, 1, 0, 0, 1, 1,
0.1776565, 0.1837219, 1.098387, 0, 0, 0, 1, 1,
0.1780542, -1.965046, 2.932376, 0, 0, 0, 1, 1,
0.1801458, 0.05036911, 0.311365, 0, 0, 0, 1, 1,
0.1901572, -0.6230322, 1.753825, 0, 0, 0, 1, 1,
0.1915958, 0.5063269, 1.720508, 0, 0, 0, 1, 1,
0.1976536, 1.02669, 1.414174, 0, 0, 0, 1, 1,
0.1995212, 0.2750136, 0.9248564, 0, 0, 0, 1, 1,
0.2075668, 0.7775351, 0.04219395, 1, 1, 1, 1, 1,
0.2086358, 0.06923437, 0.7877537, 1, 1, 1, 1, 1,
0.2103985, 0.6931126, 2.172375, 1, 1, 1, 1, 1,
0.2112286, -0.1464705, 1.091442, 1, 1, 1, 1, 1,
0.2156358, 3.267723, 0.9088513, 1, 1, 1, 1, 1,
0.2290708, -1.805357, 3.897895, 1, 1, 1, 1, 1,
0.2428551, 1.619479, 1.177913, 1, 1, 1, 1, 1,
0.2485003, -0.7429699, 4.581083, 1, 1, 1, 1, 1,
0.2522339, 0.9497284, 1.607591, 1, 1, 1, 1, 1,
0.2523946, -0.664137, 2.526667, 1, 1, 1, 1, 1,
0.2556791, -0.3067338, 3.39525, 1, 1, 1, 1, 1,
0.2562308, -0.8849639, 1.172804, 1, 1, 1, 1, 1,
0.2595369, 0.01801553, 1.49394, 1, 1, 1, 1, 1,
0.2596954, -1.102559, 1.866156, 1, 1, 1, 1, 1,
0.2600159, -0.2359598, 1.272852, 1, 1, 1, 1, 1,
0.2697032, 0.7518281, -0.6724044, 0, 0, 1, 1, 1,
0.2754929, -0.3097208, 3.063838, 1, 0, 0, 1, 1,
0.2851406, -0.576286, 2.029658, 1, 0, 0, 1, 1,
0.2857625, 0.4761601, 0.9203073, 1, 0, 0, 1, 1,
0.2941526, -0.1456605, 2.359647, 1, 0, 0, 1, 1,
0.2948846, 0.7196656, 0.4954723, 1, 0, 0, 1, 1,
0.2997676, 0.3031932, 0.7488229, 0, 0, 0, 1, 1,
0.2999357, -1.339336, 3.081967, 0, 0, 0, 1, 1,
0.2999941, -0.02493193, 0.8822488, 0, 0, 0, 1, 1,
0.3057376, -0.8329945, 3.816777, 0, 0, 0, 1, 1,
0.3139849, 2.251298, 1.608149, 0, 0, 0, 1, 1,
0.3169877, -0.2606538, 2.124586, 0, 0, 0, 1, 1,
0.317581, -0.9893019, 2.030916, 0, 0, 0, 1, 1,
0.317697, -1.007759, 4.483706, 1, 1, 1, 1, 1,
0.3185069, 0.8092133, 0.3447626, 1, 1, 1, 1, 1,
0.3201459, 0.02799524, 1.924687, 1, 1, 1, 1, 1,
0.3214125, 0.2860145, 0.6824389, 1, 1, 1, 1, 1,
0.3217539, -0.4722256, 2.398958, 1, 1, 1, 1, 1,
0.32837, -0.1689537, 0.2847368, 1, 1, 1, 1, 1,
0.330714, -1.716535, 3.86665, 1, 1, 1, 1, 1,
0.3358164, 0.1377796, 0.7463101, 1, 1, 1, 1, 1,
0.3361982, 1.938344, -0.02533401, 1, 1, 1, 1, 1,
0.3383145, -1.069588, 2.77338, 1, 1, 1, 1, 1,
0.3388654, -2.503964, 3.656099, 1, 1, 1, 1, 1,
0.3413077, 0.2096813, 0.140968, 1, 1, 1, 1, 1,
0.3439718, 0.6757512, 1.843859, 1, 1, 1, 1, 1,
0.3480313, -0.08278802, 2.121393, 1, 1, 1, 1, 1,
0.3496431, 0.5064985, -1.081068, 1, 1, 1, 1, 1,
0.3497432, 0.9217002, 0.1739321, 0, 0, 1, 1, 1,
0.355707, -1.450584, 2.492258, 1, 0, 0, 1, 1,
0.3570266, 0.9486409, 0.7170199, 1, 0, 0, 1, 1,
0.3579612, -0.8733582, 4.148427, 1, 0, 0, 1, 1,
0.3612187, 0.8910384, -0.9568478, 1, 0, 0, 1, 1,
0.3617391, 0.3428385, 1.116199, 1, 0, 0, 1, 1,
0.3634129, 0.07326012, 3.40609, 0, 0, 0, 1, 1,
0.36464, 0.8825439, -0.1158937, 0, 0, 0, 1, 1,
0.3661701, 1.615899, 1.214253, 0, 0, 0, 1, 1,
0.3723619, -0.7946861, 2.64084, 0, 0, 0, 1, 1,
0.3732385, -0.7007763, 2.544693, 0, 0, 0, 1, 1,
0.3747925, -0.05478134, 3.659106, 0, 0, 0, 1, 1,
0.3812375, 1.597941, 1.531888, 0, 0, 0, 1, 1,
0.3814569, -3.079764, 2.358588, 1, 1, 1, 1, 1,
0.3814858, -0.1838068, 0.2167488, 1, 1, 1, 1, 1,
0.3863538, 0.4862309, 1.423584, 1, 1, 1, 1, 1,
0.3894535, 0.3567909, 2.501276, 1, 1, 1, 1, 1,
0.3924454, 0.4125174, -0.4637274, 1, 1, 1, 1, 1,
0.3959846, 0.3256241, 1.526367, 1, 1, 1, 1, 1,
0.3967989, 0.2293497, -1.062168, 1, 1, 1, 1, 1,
0.4032809, 0.83882, 3.334754, 1, 1, 1, 1, 1,
0.4135213, 0.7339014, 1.40813, 1, 1, 1, 1, 1,
0.4139866, 0.3728025, 0.08486133, 1, 1, 1, 1, 1,
0.4167401, -0.4172657, 2.567756, 1, 1, 1, 1, 1,
0.4175294, -0.1973549, 3.551439, 1, 1, 1, 1, 1,
0.4251295, 0.2331154, 1.157533, 1, 1, 1, 1, 1,
0.4274177, 0.9728174, -0.5953937, 1, 1, 1, 1, 1,
0.4286048, -0.03686928, 1.474959, 1, 1, 1, 1, 1,
0.4308173, 0.5897198, 1.072104, 0, 0, 1, 1, 1,
0.432901, 0.8156632, 0.05600212, 1, 0, 0, 1, 1,
0.4347952, -0.4717593, 4.125189, 1, 0, 0, 1, 1,
0.4358934, -0.2592895, 3.30529, 1, 0, 0, 1, 1,
0.4384817, 0.0170453, 2.411764, 1, 0, 0, 1, 1,
0.4430186, 1.614553, 2.403581, 1, 0, 0, 1, 1,
0.4444574, 0.515408, -0.2929975, 0, 0, 0, 1, 1,
0.4472387, 0.9415917, -2.192897, 0, 0, 0, 1, 1,
0.4504417, -0.2924156, 2.23331, 0, 0, 0, 1, 1,
0.4507522, 0.3216113, 1.90931, 0, 0, 0, 1, 1,
0.4551494, -0.2634603, 3.059618, 0, 0, 0, 1, 1,
0.4622153, -0.03580688, 0.1298583, 0, 0, 0, 1, 1,
0.4659494, 1.151516, -0.6705189, 0, 0, 0, 1, 1,
0.4695442, 1.472986, 0.3873618, 1, 1, 1, 1, 1,
0.4710376, -1.456869, 1.387922, 1, 1, 1, 1, 1,
0.4787828, 0.1280593, 2.902753, 1, 1, 1, 1, 1,
0.4844717, 0.08910208, 1.506402, 1, 1, 1, 1, 1,
0.4900571, 0.3952547, -1.11267, 1, 1, 1, 1, 1,
0.5034514, 0.1742323, 1.00624, 1, 1, 1, 1, 1,
0.5119264, -0.1841535, 0.8348523, 1, 1, 1, 1, 1,
0.5140091, -0.909265, 3.349752, 1, 1, 1, 1, 1,
0.5205674, 0.8575674, -0.1326647, 1, 1, 1, 1, 1,
0.5217071, -0.6164016, 1.660029, 1, 1, 1, 1, 1,
0.5221984, 0.3566043, -0.7287626, 1, 1, 1, 1, 1,
0.5226334, 0.1681107, 1.866332, 1, 1, 1, 1, 1,
0.5239222, -1.717558, 3.654191, 1, 1, 1, 1, 1,
0.5251743, -1.14739, 3.943771, 1, 1, 1, 1, 1,
0.5257328, -1.691808, 3.648557, 1, 1, 1, 1, 1,
0.5263229, -1.639394, 4.942978, 0, 0, 1, 1, 1,
0.5279623, 0.6764582, 1.050023, 1, 0, 0, 1, 1,
0.531223, -1.060838, 3.159806, 1, 0, 0, 1, 1,
0.5336516, -2.511909, 1.083414, 1, 0, 0, 1, 1,
0.5376903, -1.736617, 3.850712, 1, 0, 0, 1, 1,
0.540141, 1.730346, 0.3372563, 1, 0, 0, 1, 1,
0.5453393, 0.7490714, 0.5154272, 0, 0, 0, 1, 1,
0.5474306, -2.04336, 2.455578, 0, 0, 0, 1, 1,
0.5486143, 1.424467, 0.06237693, 0, 0, 0, 1, 1,
0.5498992, 0.3627307, 1.010007, 0, 0, 0, 1, 1,
0.5504932, 1.011414, 1.087203, 0, 0, 0, 1, 1,
0.5552912, 0.3793716, 1.424981, 0, 0, 0, 1, 1,
0.5556597, 0.4902297, 0.5441989, 0, 0, 0, 1, 1,
0.5563179, 1.158236, 0.3116432, 1, 1, 1, 1, 1,
0.5589989, 1.151292, -0.4000041, 1, 1, 1, 1, 1,
0.5602909, 1.838319, 0.8368867, 1, 1, 1, 1, 1,
0.5605215, 0.01015967, 1.575116, 1, 1, 1, 1, 1,
0.5628145, -0.06894787, 2.488362, 1, 1, 1, 1, 1,
0.5634162, -0.5717725, 2.569681, 1, 1, 1, 1, 1,
0.5647847, -0.7408813, 2.903345, 1, 1, 1, 1, 1,
0.5686206, 0.230415, 2.73473, 1, 1, 1, 1, 1,
0.5735081, 1.352486, 2.414873, 1, 1, 1, 1, 1,
0.578987, 0.623466, -0.01950325, 1, 1, 1, 1, 1,
0.595689, 2.43977, -0.005287632, 1, 1, 1, 1, 1,
0.5976756, -0.3257945, 4.487774, 1, 1, 1, 1, 1,
0.5979675, -0.547452, 1.466283, 1, 1, 1, 1, 1,
0.606057, 0.2475923, 1.580502, 1, 1, 1, 1, 1,
0.6101952, 0.08098216, 1.678347, 1, 1, 1, 1, 1,
0.6114137, -1.319881, 3.619178, 0, 0, 1, 1, 1,
0.6134142, -0.8336514, 3.327261, 1, 0, 0, 1, 1,
0.6136749, 0.7998785, 0.3064275, 1, 0, 0, 1, 1,
0.6138051, 0.3855537, 2.483315, 1, 0, 0, 1, 1,
0.6149429, 0.9483206, 0.6345229, 1, 0, 0, 1, 1,
0.6215854, -0.08303695, 3.052505, 1, 0, 0, 1, 1,
0.6219803, -0.9060034, 1.294732, 0, 0, 0, 1, 1,
0.6231568, -1.689073, 2.512244, 0, 0, 0, 1, 1,
0.6247947, 0.5717761, 0.1422026, 0, 0, 0, 1, 1,
0.6313801, -0.4543976, 2.654871, 0, 0, 0, 1, 1,
0.6345801, 0.3696683, 1.96958, 0, 0, 0, 1, 1,
0.6407456, 1.26378, -0.2950116, 0, 0, 0, 1, 1,
0.6440944, 0.9698645, 0.1777319, 0, 0, 0, 1, 1,
0.655284, 0.5158676, -0.1520522, 1, 1, 1, 1, 1,
0.6556606, -2.238569, 1.778384, 1, 1, 1, 1, 1,
0.6580809, -1.055467, 3.005635, 1, 1, 1, 1, 1,
0.6595224, -0.5961398, 2.439425, 1, 1, 1, 1, 1,
0.6631157, 0.180256, 0.7602467, 1, 1, 1, 1, 1,
0.6650724, 1.001839, 0.03047017, 1, 1, 1, 1, 1,
0.672117, 0.4813743, 1.501899, 1, 1, 1, 1, 1,
0.6736587, -0.7726585, 0.8849922, 1, 1, 1, 1, 1,
0.6886792, 1.40021, 0.4438492, 1, 1, 1, 1, 1,
0.6932908, 1.011258, -1.156541, 1, 1, 1, 1, 1,
0.6939559, -0.172059, 4.260549, 1, 1, 1, 1, 1,
0.6971884, 1.387201, 0.224212, 1, 1, 1, 1, 1,
0.6993909, -0.2032961, 0.5020468, 1, 1, 1, 1, 1,
0.7033575, -0.3062844, 1.869484, 1, 1, 1, 1, 1,
0.7037482, -0.3809895, 0.3745366, 1, 1, 1, 1, 1,
0.7047611, 0.2601658, 0.3031234, 0, 0, 1, 1, 1,
0.7049034, -1.318451, 2.399269, 1, 0, 0, 1, 1,
0.7062305, -0.292293, 1.572911, 1, 0, 0, 1, 1,
0.7085716, -1.255417, 2.532026, 1, 0, 0, 1, 1,
0.7107149, -0.4849169, 2.369753, 1, 0, 0, 1, 1,
0.7107607, 1.133718, 1.366228, 1, 0, 0, 1, 1,
0.7137846, -0.7162662, 2.835945, 0, 0, 0, 1, 1,
0.7144256, -0.98531, 3.253081, 0, 0, 0, 1, 1,
0.7208841, 1.409945, 0.4444058, 0, 0, 0, 1, 1,
0.7269419, 0.4305516, 1.398091, 0, 0, 0, 1, 1,
0.7284791, -0.6275181, 3.146917, 0, 0, 0, 1, 1,
0.7548965, -0.220651, 0.302309, 0, 0, 0, 1, 1,
0.7612665, 0.3114076, 0.3438432, 0, 0, 0, 1, 1,
0.7627693, 0.863031, 1.292803, 1, 1, 1, 1, 1,
0.768171, -1.494721, 0.5346494, 1, 1, 1, 1, 1,
0.7682756, -1.352427, 1.886318, 1, 1, 1, 1, 1,
0.7695268, 1.058371, 3.14324, 1, 1, 1, 1, 1,
0.7696997, -1.326196, 2.356401, 1, 1, 1, 1, 1,
0.770251, -0.4105234, 2.113166, 1, 1, 1, 1, 1,
0.7712018, 0.9484481, -1.342049, 1, 1, 1, 1, 1,
0.7714313, 0.7160792, 0.7426341, 1, 1, 1, 1, 1,
0.773912, -0.08526164, 2.481864, 1, 1, 1, 1, 1,
0.7753299, -1.281664, 2.596085, 1, 1, 1, 1, 1,
0.7782694, 2.200884, 0.6704191, 1, 1, 1, 1, 1,
0.7956647, 0.1741746, 3.701163, 1, 1, 1, 1, 1,
0.8070992, 2.467044, 0.3187804, 1, 1, 1, 1, 1,
0.8071616, -1.036188, 2.922486, 1, 1, 1, 1, 1,
0.8115205, 0.6161054, 0.582434, 1, 1, 1, 1, 1,
0.8153737, -0.9382442, 3.990245, 0, 0, 1, 1, 1,
0.8188867, 0.3745297, 1.837791, 1, 0, 0, 1, 1,
0.8223082, -0.04931344, 1.714088, 1, 0, 0, 1, 1,
0.8292882, 1.384031, 1.279343, 1, 0, 0, 1, 1,
0.8304349, -0.5970367, 2.086548, 1, 0, 0, 1, 1,
0.8325212, 0.6095721, 0.5072139, 1, 0, 0, 1, 1,
0.8376896, -0.4001687, 1.887946, 0, 0, 0, 1, 1,
0.8413026, -1.902442, 2.046265, 0, 0, 0, 1, 1,
0.8449794, 0.1936596, 0.07536007, 0, 0, 0, 1, 1,
0.8457456, 0.6866431, 1.641, 0, 0, 0, 1, 1,
0.8472439, 0.27674, 0.6517961, 0, 0, 0, 1, 1,
0.8474253, -0.8858582, 1.84139, 0, 0, 0, 1, 1,
0.8491871, 1.513858, 0.6790169, 0, 0, 0, 1, 1,
0.8509344, -1.422885, 3.008025, 1, 1, 1, 1, 1,
0.8518822, -0.1142853, 2.60612, 1, 1, 1, 1, 1,
0.8533217, -0.06486355, 1.495528, 1, 1, 1, 1, 1,
0.8538319, -0.3535168, 1.932981, 1, 1, 1, 1, 1,
0.8549144, -0.3232298, 2.278759, 1, 1, 1, 1, 1,
0.8563122, 0.1706292, 1.131454, 1, 1, 1, 1, 1,
0.8698084, -0.48906, 1.710718, 1, 1, 1, 1, 1,
0.8720596, 0.4170923, 2.326798, 1, 1, 1, 1, 1,
0.8784215, 0.2344311, 1.580768, 1, 1, 1, 1, 1,
0.8809802, -0.8541502, 3.298569, 1, 1, 1, 1, 1,
0.8906272, -0.9525114, 1.784853, 1, 1, 1, 1, 1,
0.8956001, -0.4300458, 2.629894, 1, 1, 1, 1, 1,
0.8969052, -0.5590792, 3.743089, 1, 1, 1, 1, 1,
0.9045358, 1.124484, 1.551219, 1, 1, 1, 1, 1,
0.9064603, 0.9321021, -0.8852646, 1, 1, 1, 1, 1,
0.9087714, 2.01846, 1.995143, 0, 0, 1, 1, 1,
0.9097074, -0.7174179, 0.9760072, 1, 0, 0, 1, 1,
0.9235235, 1.733359, 0.7522038, 1, 0, 0, 1, 1,
0.9279258, -0.8316035, 3.000436, 1, 0, 0, 1, 1,
0.929391, -0.5407482, 1.584841, 1, 0, 0, 1, 1,
0.9317777, 0.3969871, 2.49217, 1, 0, 0, 1, 1,
0.9354313, 0.1827701, -0.3336278, 0, 0, 0, 1, 1,
0.9398527, -0.7136897, -0.4235797, 0, 0, 0, 1, 1,
0.9426112, 0.2114538, -0.7193424, 0, 0, 0, 1, 1,
0.9426559, 1.281057, 0.07387551, 0, 0, 0, 1, 1,
0.9436195, -0.6868018, 1.670058, 0, 0, 0, 1, 1,
0.953739, 1.193216, 1.03219, 0, 0, 0, 1, 1,
0.9596078, 0.2948242, 0.86699, 0, 0, 0, 1, 1,
0.9658061, 1.209834, 0.5758289, 1, 1, 1, 1, 1,
0.9663533, -0.450408, 1.949623, 1, 1, 1, 1, 1,
0.9664726, -0.07752297, 0.7631457, 1, 1, 1, 1, 1,
0.9670791, -0.428733, 0.4334247, 1, 1, 1, 1, 1,
0.9693499, -0.579269, 1.002822, 1, 1, 1, 1, 1,
0.969426, -0.8261908, 0.8983772, 1, 1, 1, 1, 1,
0.9744024, -0.8039119, 2.839226, 1, 1, 1, 1, 1,
0.9776415, -0.5426786, 1.611591, 1, 1, 1, 1, 1,
0.9807113, -1.78122, 2.597078, 1, 1, 1, 1, 1,
0.9868687, 0.5451594, 1.843147, 1, 1, 1, 1, 1,
0.9922498, -0.4709894, 1.407395, 1, 1, 1, 1, 1,
1.000402, -1.638233, 1.035642, 1, 1, 1, 1, 1,
1.003043, 0.7253215, 1.126939, 1, 1, 1, 1, 1,
1.009566, -0.7671321, 2.724191, 1, 1, 1, 1, 1,
1.012278, 0.6027806, 0.1219038, 1, 1, 1, 1, 1,
1.019729, 0.4650666, 0.324746, 0, 0, 1, 1, 1,
1.02091, -1.46785, 1.435476, 1, 0, 0, 1, 1,
1.021931, 0.1537498, 2.056929, 1, 0, 0, 1, 1,
1.024574, 1.180059, -0.3270353, 1, 0, 0, 1, 1,
1.026667, 0.2612046, 0.669533, 1, 0, 0, 1, 1,
1.040925, -1.255534, 4.245785, 1, 0, 0, 1, 1,
1.041791, 1.219376, -0.8068624, 0, 0, 0, 1, 1,
1.047372, 0.5179455, 0.8807294, 0, 0, 0, 1, 1,
1.051125, 2.59763, 0.9117753, 0, 0, 0, 1, 1,
1.056096, 0.8186566, 1.540436, 0, 0, 0, 1, 1,
1.057219, -0.4150426, 1.43689, 0, 0, 0, 1, 1,
1.067441, 0.5189764, 1.319685, 0, 0, 0, 1, 1,
1.069533, 1.065681, 1.959649, 0, 0, 0, 1, 1,
1.080678, -1.128436, 1.185394, 1, 1, 1, 1, 1,
1.082017, 0.2021344, 0.5186769, 1, 1, 1, 1, 1,
1.087029, 0.3418083, 2.170883, 1, 1, 1, 1, 1,
1.096158, 0.1493279, 1.252897, 1, 1, 1, 1, 1,
1.106473, -0.2488663, 2.27215, 1, 1, 1, 1, 1,
1.107938, -1.51831, 3.35881, 1, 1, 1, 1, 1,
1.11139, 0.301542, 1.767214, 1, 1, 1, 1, 1,
1.118741, 0.3977023, 2.239437, 1, 1, 1, 1, 1,
1.118779, -1.343849, 1.607416, 1, 1, 1, 1, 1,
1.120841, -0.7942192, 2.350691, 1, 1, 1, 1, 1,
1.126823, 0.2168267, 2.650303, 1, 1, 1, 1, 1,
1.129663, -0.1590476, 2.672772, 1, 1, 1, 1, 1,
1.131716, 1.065081, 1.334902, 1, 1, 1, 1, 1,
1.139649, -0.8544421, 1.916499, 1, 1, 1, 1, 1,
1.145197, 1.019602, 0.1877612, 1, 1, 1, 1, 1,
1.151336, 0.3957214, -1.163405, 0, 0, 1, 1, 1,
1.152208, 2.508572, -0.4684738, 1, 0, 0, 1, 1,
1.158937, 1.481988, 0.0147476, 1, 0, 0, 1, 1,
1.159109, -1.741668, 2.510054, 1, 0, 0, 1, 1,
1.163009, 0.9442946, 0.6371198, 1, 0, 0, 1, 1,
1.164999, -0.6021089, 1.739125, 1, 0, 0, 1, 1,
1.167925, -2.085527, 3.13025, 0, 0, 0, 1, 1,
1.178226, 2.261886, 0.6882444, 0, 0, 0, 1, 1,
1.180131, -0.5554888, 1.797057, 0, 0, 0, 1, 1,
1.181912, 0.1869788, 0.2771179, 0, 0, 0, 1, 1,
1.185611, 0.286751, 1.424671, 0, 0, 0, 1, 1,
1.187847, 0.8671989, 2.084612, 0, 0, 0, 1, 1,
1.202283, -1.363343, 4.253407, 0, 0, 0, 1, 1,
1.206029, 0.3172271, 0.1871328, 1, 1, 1, 1, 1,
1.209883, -0.569604, 0.804994, 1, 1, 1, 1, 1,
1.210714, 0.4508572, 1.768782, 1, 1, 1, 1, 1,
1.211574, 0.01350823, 2.59368, 1, 1, 1, 1, 1,
1.214967, -2.108799, 2.745162, 1, 1, 1, 1, 1,
1.218499, -1.351509, 2.35376, 1, 1, 1, 1, 1,
1.22283, 0.3357716, 3.215483, 1, 1, 1, 1, 1,
1.235844, 1.980196, 1.121867, 1, 1, 1, 1, 1,
1.23678, 0.3822594, 2.135393, 1, 1, 1, 1, 1,
1.236873, -0.3561837, 3.333214, 1, 1, 1, 1, 1,
1.244287, -0.7485213, 1.364357, 1, 1, 1, 1, 1,
1.247592, -0.7950085, 0.5302984, 1, 1, 1, 1, 1,
1.249616, 0.1500314, 1.392908, 1, 1, 1, 1, 1,
1.256304, 0.4552228, -0.08105134, 1, 1, 1, 1, 1,
1.2647, -1.998258, 2.973482, 1, 1, 1, 1, 1,
1.268761, -1.028865, 1.675455, 0, 0, 1, 1, 1,
1.269377, -0.6387491, 2.008377, 1, 0, 0, 1, 1,
1.270279, 0.6232333, 1.37953, 1, 0, 0, 1, 1,
1.270841, -0.2891729, 2.314163, 1, 0, 0, 1, 1,
1.271722, -0.2437494, -0.6743982, 1, 0, 0, 1, 1,
1.27667, 2.904832, -0.2585878, 1, 0, 0, 1, 1,
1.285872, -0.2521005, 3.058393, 0, 0, 0, 1, 1,
1.289614, 0.643588, -0.122173, 0, 0, 0, 1, 1,
1.297981, 1.041002, 0.6465036, 0, 0, 0, 1, 1,
1.298752, 0.5172486, 1.554153, 0, 0, 0, 1, 1,
1.300174, 0.2737963, 2.721494, 0, 0, 0, 1, 1,
1.304747, 0.15354, 2.144418, 0, 0, 0, 1, 1,
1.310713, -0.1964525, 1.108662, 0, 0, 0, 1, 1,
1.319951, -0.09770094, 0.5757409, 1, 1, 1, 1, 1,
1.320722, -0.03548765, 2.49364, 1, 1, 1, 1, 1,
1.326052, -0.9774313, 2.298611, 1, 1, 1, 1, 1,
1.3369, -0.4976965, 1.869311, 1, 1, 1, 1, 1,
1.339083, 0.145486, 1.563441, 1, 1, 1, 1, 1,
1.349939, 0.2805416, 2.124397, 1, 1, 1, 1, 1,
1.351177, 0.7701324, 0.8428801, 1, 1, 1, 1, 1,
1.370204, 0.4924346, -0.761277, 1, 1, 1, 1, 1,
1.379107, -0.3994634, 1.850544, 1, 1, 1, 1, 1,
1.385306, 0.9092848, -0.3164998, 1, 1, 1, 1, 1,
1.393416, 0.8093977, 1.529327, 1, 1, 1, 1, 1,
1.400225, 0.2085915, 3.243506, 1, 1, 1, 1, 1,
1.407853, 1.346224, 0.114268, 1, 1, 1, 1, 1,
1.418712, -0.1257342, 1.062747, 1, 1, 1, 1, 1,
1.442252, -0.194168, 3.493948, 1, 1, 1, 1, 1,
1.450432, 0.3081821, 2.364694, 0, 0, 1, 1, 1,
1.453744, -0.8823968, 1.60833, 1, 0, 0, 1, 1,
1.464836, 2.170308, 1.467017, 1, 0, 0, 1, 1,
1.467137, 1.481001, 2.451387, 1, 0, 0, 1, 1,
1.473687, 0.05363535, 1.879161, 1, 0, 0, 1, 1,
1.477154, -2.250721, 3.402228, 1, 0, 0, 1, 1,
1.479657, 0.372569, 0.4548082, 0, 0, 0, 1, 1,
1.490645, -0.028222, 0.8737956, 0, 0, 0, 1, 1,
1.49895, 0.08178221, 1.859793, 0, 0, 0, 1, 1,
1.503353, -0.2978384, 2.267918, 0, 0, 0, 1, 1,
1.52571, 1.045894, 3.192599, 0, 0, 0, 1, 1,
1.534759, 0.5337783, 2.754052, 0, 0, 0, 1, 1,
1.535552, -0.4691172, 1.072473, 0, 0, 0, 1, 1,
1.546825, -0.02076747, 1.342087, 1, 1, 1, 1, 1,
1.551637, -0.2802812, 2.282838, 1, 1, 1, 1, 1,
1.553396, 0.5171841, 1.038545, 1, 1, 1, 1, 1,
1.561419, -1.139993, 1.565186, 1, 1, 1, 1, 1,
1.565261, -0.25034, 3.591073, 1, 1, 1, 1, 1,
1.576268, -0.810868, 1.419466, 1, 1, 1, 1, 1,
1.602868, -1.564161, 1.232643, 1, 1, 1, 1, 1,
1.612824, -1.190568, 2.17889, 1, 1, 1, 1, 1,
1.627607, -1.106261, 3.588004, 1, 1, 1, 1, 1,
1.627703, -0.2819857, 1.825911, 1, 1, 1, 1, 1,
1.636157, -0.8714787, 1.515911, 1, 1, 1, 1, 1,
1.651218, -0.3382453, 0.5625277, 1, 1, 1, 1, 1,
1.658769, 1.209522, 1.159923, 1, 1, 1, 1, 1,
1.659454, -1.818369, 1.465264, 1, 1, 1, 1, 1,
1.666558, 0.7345854, -0.08096087, 1, 1, 1, 1, 1,
1.678503, -0.7973576, -0.3100407, 0, 0, 1, 1, 1,
1.684827, 0.09488009, 0.6484274, 1, 0, 0, 1, 1,
1.697506, 1.964436, 1.965555, 1, 0, 0, 1, 1,
1.725766, 1.367819, 0.7210523, 1, 0, 0, 1, 1,
1.726805, -1.544242, 1.17277, 1, 0, 0, 1, 1,
1.742706, -0.2038594, 1.951758, 1, 0, 0, 1, 1,
1.766012, -0.3746476, 3.033672, 0, 0, 0, 1, 1,
1.773297, -0.7007189, 3.112849, 0, 0, 0, 1, 1,
1.776934, -0.5713318, 1.511899, 0, 0, 0, 1, 1,
1.79462, 0.6646436, 0.1058684, 0, 0, 0, 1, 1,
1.797769, 0.3685961, 2.044353, 0, 0, 0, 1, 1,
1.811517, -0.04898644, 3.016179, 0, 0, 0, 1, 1,
1.813088, 0.2719682, 0.6698903, 0, 0, 0, 1, 1,
1.83967, -0.1032037, -0.3979776, 1, 1, 1, 1, 1,
1.842105, 1.465377, -0.5887449, 1, 1, 1, 1, 1,
1.856731, -0.7582801, 2.495844, 1, 1, 1, 1, 1,
1.929092, -0.5163431, 2.707389, 1, 1, 1, 1, 1,
1.940079, -0.2101072, 1.72319, 1, 1, 1, 1, 1,
1.941821, -1.229599, 5.134126, 1, 1, 1, 1, 1,
1.946324, 0.9517882, 0.02426254, 1, 1, 1, 1, 1,
1.978669, -0.7096696, 0.8140748, 1, 1, 1, 1, 1,
1.995717, -0.130513, 3.303073, 1, 1, 1, 1, 1,
2.003711, -0.7042353, 1.812008, 1, 1, 1, 1, 1,
2.029117, -1.048344, 1.369306, 1, 1, 1, 1, 1,
2.029795, 0.6266876, 3.130126, 1, 1, 1, 1, 1,
2.032689, -0.6362807, 2.811389, 1, 1, 1, 1, 1,
2.045243, 0.6061615, 1.541269, 1, 1, 1, 1, 1,
2.06913, 0.3873415, 1.479328, 1, 1, 1, 1, 1,
2.08132, 0.9159933, 2.021351, 0, 0, 1, 1, 1,
2.14959, 0.7911235, 1.764367, 1, 0, 0, 1, 1,
2.152839, -0.5046822, 1.968559, 1, 0, 0, 1, 1,
2.263092, -1.850594, 2.822531, 1, 0, 0, 1, 1,
2.306955, 0.4029984, 1.216917, 1, 0, 0, 1, 1,
2.312643, 1.263594, -1.055692, 1, 0, 0, 1, 1,
2.397952, -2.796102, 3.157574, 0, 0, 0, 1, 1,
2.403687, 0.3715465, 0.2511968, 0, 0, 0, 1, 1,
2.411345, -0.3640322, 1.219944, 0, 0, 0, 1, 1,
2.434851, -0.4615749, 1.890468, 0, 0, 0, 1, 1,
2.451446, -2.041853, 3.977679, 0, 0, 0, 1, 1,
2.462962, 0.8454408, 0.117276, 0, 0, 0, 1, 1,
2.525244, 0.6211314, 2.129669, 0, 0, 0, 1, 1,
2.684263, -0.1829109, 1.075959, 1, 1, 1, 1, 1,
2.701764, -0.331971, 1.396322, 1, 1, 1, 1, 1,
2.751939, -1.075077, 1.201124, 1, 1, 1, 1, 1,
2.880888, 1.9445, 3.75208, 1, 1, 1, 1, 1,
2.97428, -0.7349311, 2.546692, 1, 1, 1, 1, 1,
3.211097, 1.491093, -0.2597418, 1, 1, 1, 1, 1,
3.243019, -1.112365, 2.61218, 1, 1, 1, 1, 1
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
var radius = 9.381882;
var distance = 32.95346;
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
mvMatrix.translate( 0.02863932, -0.0939796, -0.1411259 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.95346);
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