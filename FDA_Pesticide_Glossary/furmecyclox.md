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
-2.653799, -0.3691974, -0.7902087, 1, 0, 0, 1,
-2.521574, -0.7657107, -0.5135968, 1, 0.007843138, 0, 1,
-2.473056, -0.9141099, -2.83659, 1, 0.01176471, 0, 1,
-2.291892, 1.358391, -0.9930234, 1, 0.01960784, 0, 1,
-2.271328, -1.153156, -0.6522896, 1, 0.02352941, 0, 1,
-2.23995, -1.931519, -1.353839, 1, 0.03137255, 0, 1,
-2.235849, -0.659606, -1.314373, 1, 0.03529412, 0, 1,
-2.201968, 2.358715, 0.0953598, 1, 0.04313726, 0, 1,
-2.165151, 0.2127612, -0.6202017, 1, 0.04705882, 0, 1,
-2.098629, -1.19947, -2.580271, 1, 0.05490196, 0, 1,
-2.093185, 0.3501153, -1.711135, 1, 0.05882353, 0, 1,
-2.06133, -1.332491, -1.612944, 1, 0.06666667, 0, 1,
-2.039053, -1.036695, -2.65425, 1, 0.07058824, 0, 1,
-2.037793, 0.2953376, -0.8398988, 1, 0.07843138, 0, 1,
-2.023882, 2.121401, -1.301571, 1, 0.08235294, 0, 1,
-2.018658, 1.571897, -0.2732494, 1, 0.09019608, 0, 1,
-2.008859, -0.1975153, -1.781948, 1, 0.09411765, 0, 1,
-1.997698, 1.97509, 0.3656406, 1, 0.1019608, 0, 1,
-1.962004, -0.3630292, -0.954863, 1, 0.1098039, 0, 1,
-1.950353, -1.586831, -0.8884158, 1, 0.1137255, 0, 1,
-1.926043, 1.25438, 0.6099682, 1, 0.1215686, 0, 1,
-1.924415, 0.8574681, -0.1856536, 1, 0.1254902, 0, 1,
-1.922156, -0.2399514, -0.266521, 1, 0.1333333, 0, 1,
-1.918373, 0.07969452, -2.099239, 1, 0.1372549, 0, 1,
-1.901921, -0.3089579, -1.831753, 1, 0.145098, 0, 1,
-1.855161, 0.6679176, -1.900414, 1, 0.1490196, 0, 1,
-1.852799, 0.314678, -1.816432, 1, 0.1568628, 0, 1,
-1.839729, -0.4175718, -1.327562, 1, 0.1607843, 0, 1,
-1.837426, -0.2887649, -1.562963, 1, 0.1686275, 0, 1,
-1.827468, -1.035982, -1.415957, 1, 0.172549, 0, 1,
-1.788162, -0.6314613, -1.56407, 1, 0.1803922, 0, 1,
-1.784205, 0.865372, -0.6006839, 1, 0.1843137, 0, 1,
-1.761065, 0.1964592, -0.8495877, 1, 0.1921569, 0, 1,
-1.747005, -0.7189716, -2.657873, 1, 0.1960784, 0, 1,
-1.743557, -0.7753781, -1.169193, 1, 0.2039216, 0, 1,
-1.738925, 0.6551605, -2.226215, 1, 0.2117647, 0, 1,
-1.7377, 0.1426513, -2.03791, 1, 0.2156863, 0, 1,
-1.733677, 1.475038, -2.180718, 1, 0.2235294, 0, 1,
-1.733593, 0.4305953, -1.67449, 1, 0.227451, 0, 1,
-1.73347, 2.042785, 0.1092776, 1, 0.2352941, 0, 1,
-1.724159, 0.5891869, -0.9813285, 1, 0.2392157, 0, 1,
-1.723426, 1.735541, -0.4353025, 1, 0.2470588, 0, 1,
-1.72123, 0.681492, -0.763412, 1, 0.2509804, 0, 1,
-1.719844, -0.1083515, -1.750892, 1, 0.2588235, 0, 1,
-1.707328, 0.2666449, -1.78504, 1, 0.2627451, 0, 1,
-1.684416, 1.500406, -0.9847441, 1, 0.2705882, 0, 1,
-1.644595, -0.8682098, -1.906001, 1, 0.2745098, 0, 1,
-1.640732, 0.01401987, -2.571661, 1, 0.282353, 0, 1,
-1.633902, 0.3554972, -1.451226, 1, 0.2862745, 0, 1,
-1.632565, -0.4028887, -2.611969, 1, 0.2941177, 0, 1,
-1.595655, 0.5400667, -1.009356, 1, 0.3019608, 0, 1,
-1.584523, 0.01120503, -1.921974, 1, 0.3058824, 0, 1,
-1.563825, 1.255594, -0.9504496, 1, 0.3137255, 0, 1,
-1.559368, 0.9140666, -1.887683, 1, 0.3176471, 0, 1,
-1.552776, 0.436646, -2.065132, 1, 0.3254902, 0, 1,
-1.544067, -1.036254, -2.577081, 1, 0.3294118, 0, 1,
-1.538685, 1.275926, 0.613524, 1, 0.3372549, 0, 1,
-1.530633, -0.2856232, -2.398655, 1, 0.3411765, 0, 1,
-1.521986, -0.3350741, -2.591994, 1, 0.3490196, 0, 1,
-1.521654, -0.5334857, -1.682742, 1, 0.3529412, 0, 1,
-1.521646, -1.339002, -3.028813, 1, 0.3607843, 0, 1,
-1.515501, 0.1634459, -1.815126, 1, 0.3647059, 0, 1,
-1.510036, -0.2339534, -3.045056, 1, 0.372549, 0, 1,
-1.49987, -1.159069, -1.988819, 1, 0.3764706, 0, 1,
-1.498868, -0.0114636, -1.529181, 1, 0.3843137, 0, 1,
-1.491976, -1.35905, -1.741095, 1, 0.3882353, 0, 1,
-1.474242, -0.7302922, -1.363858, 1, 0.3960784, 0, 1,
-1.443742, -0.6242937, -0.1967918, 1, 0.4039216, 0, 1,
-1.439523, 1.813769, -0.440378, 1, 0.4078431, 0, 1,
-1.439245, -0.1831925, -2.299752, 1, 0.4156863, 0, 1,
-1.43044, 0.3617316, -1.50715, 1, 0.4196078, 0, 1,
-1.42849, -1.414728, -2.924368, 1, 0.427451, 0, 1,
-1.426213, -0.5515674, -2.306256, 1, 0.4313726, 0, 1,
-1.422774, -0.3246013, -2.049143, 1, 0.4392157, 0, 1,
-1.413845, 0.2659191, -1.443909, 1, 0.4431373, 0, 1,
-1.412346, -0.9795023, -2.063739, 1, 0.4509804, 0, 1,
-1.41043, -1.21542, -2.53969, 1, 0.454902, 0, 1,
-1.404997, 0.8816088, -0.7956131, 1, 0.4627451, 0, 1,
-1.402082, 0.8361804, -4.638081, 1, 0.4666667, 0, 1,
-1.39925, -0.4094924, -1.9994, 1, 0.4745098, 0, 1,
-1.385968, 0.598438, -1.608023, 1, 0.4784314, 0, 1,
-1.379408, 1.165432, -0.8907381, 1, 0.4862745, 0, 1,
-1.353177, 0.04026746, -0.1363626, 1, 0.4901961, 0, 1,
-1.350095, -0.00676593, -1.291263, 1, 0.4980392, 0, 1,
-1.348449, -1.251907, -4.407644, 1, 0.5058824, 0, 1,
-1.346819, -0.774569, -0.309883, 1, 0.509804, 0, 1,
-1.335356, 2.210361, -0.2885057, 1, 0.5176471, 0, 1,
-1.326694, 2.153928, 1.86707, 1, 0.5215687, 0, 1,
-1.318432, -0.7478042, -3.361197, 1, 0.5294118, 0, 1,
-1.313753, -0.5240113, -3.112993, 1, 0.5333334, 0, 1,
-1.311994, -0.4938719, -2.530587, 1, 0.5411765, 0, 1,
-1.311856, 0.2456678, -1.236991, 1, 0.5450981, 0, 1,
-1.306389, 0.5806791, -2.324703, 1, 0.5529412, 0, 1,
-1.298614, 0.2509526, -0.410135, 1, 0.5568628, 0, 1,
-1.29726, -1.612327, -4.240127, 1, 0.5647059, 0, 1,
-1.296188, 0.6535616, -1.690571, 1, 0.5686275, 0, 1,
-1.296114, -0.2530242, -2.931406, 1, 0.5764706, 0, 1,
-1.295375, 0.6649321, -0.8119603, 1, 0.5803922, 0, 1,
-1.292865, 1.22745, -1.303067, 1, 0.5882353, 0, 1,
-1.288171, -0.04078094, -2.848844, 1, 0.5921569, 0, 1,
-1.281626, -0.3399056, -1.532852, 1, 0.6, 0, 1,
-1.281361, -0.1557278, -1.214548, 1, 0.6078432, 0, 1,
-1.281325, -0.3069875, -2.886724, 1, 0.6117647, 0, 1,
-1.276622, 0.04987124, -1.218339, 1, 0.6196079, 0, 1,
-1.273923, -1.515547, -0.3594799, 1, 0.6235294, 0, 1,
-1.26235, -1.222279, -3.536935, 1, 0.6313726, 0, 1,
-1.260555, 1.428859, -0.7019283, 1, 0.6352941, 0, 1,
-1.260006, 0.9333079, -0.9685555, 1, 0.6431373, 0, 1,
-1.258809, -0.2996507, -2.256167, 1, 0.6470588, 0, 1,
-1.258323, 0.447266, 0.5054633, 1, 0.654902, 0, 1,
-1.254347, 0.6157962, -1.971328, 1, 0.6588235, 0, 1,
-1.247362, 1.035222, -0.9396086, 1, 0.6666667, 0, 1,
-1.246876, -0.1028028, -0.8974059, 1, 0.6705883, 0, 1,
-1.240345, 2.008003, -1.5839, 1, 0.6784314, 0, 1,
-1.236231, -0.3661368, -3.3271, 1, 0.682353, 0, 1,
-1.222897, 0.4520937, -1.366179, 1, 0.6901961, 0, 1,
-1.215896, -0.4182745, -2.297302, 1, 0.6941177, 0, 1,
-1.214633, -1.962198, -1.953845, 1, 0.7019608, 0, 1,
-1.209082, 0.3017756, -1.874681, 1, 0.7098039, 0, 1,
-1.204092, 0.7783874, -0.3648322, 1, 0.7137255, 0, 1,
-1.196121, -0.07462903, -1.225794, 1, 0.7215686, 0, 1,
-1.1932, 0.8042115, -1.360868, 1, 0.7254902, 0, 1,
-1.187374, 0.6421154, -0.6869755, 1, 0.7333333, 0, 1,
-1.181221, -0.585774, -1.66513, 1, 0.7372549, 0, 1,
-1.179049, 1.052634, -1.40771, 1, 0.7450981, 0, 1,
-1.168557, 0.8034807, 0.9387008, 1, 0.7490196, 0, 1,
-1.159544, -0.8052957, -3.234889, 1, 0.7568628, 0, 1,
-1.153691, 0.5671487, -3.012849, 1, 0.7607843, 0, 1,
-1.153579, 0.4766873, 0.1943173, 1, 0.7686275, 0, 1,
-1.146536, -0.9340017, -2.302165, 1, 0.772549, 0, 1,
-1.145825, 0.07828097, -2.494231, 1, 0.7803922, 0, 1,
-1.140638, 0.4634779, -1.615538, 1, 0.7843137, 0, 1,
-1.140373, 0.1912729, -1.639661, 1, 0.7921569, 0, 1,
-1.138626, -1.46016, -1.960912, 1, 0.7960784, 0, 1,
-1.136152, 0.9373576, -0.9462014, 1, 0.8039216, 0, 1,
-1.135153, 0.4823986, -1.575183, 1, 0.8117647, 0, 1,
-1.134444, -1.536068, -1.976771, 1, 0.8156863, 0, 1,
-1.134008, -0.4600237, -2.593024, 1, 0.8235294, 0, 1,
-1.122421, 0.5703612, -1.143044, 1, 0.827451, 0, 1,
-1.120993, -1.095728, -1.145042, 1, 0.8352941, 0, 1,
-1.109036, -0.2842682, -1.077432, 1, 0.8392157, 0, 1,
-1.107875, -0.664614, -2.8432, 1, 0.8470588, 0, 1,
-1.107779, -0.8585485, 0.1095508, 1, 0.8509804, 0, 1,
-1.104386, -2.463256, -2.136615, 1, 0.8588235, 0, 1,
-1.094777, 1.011441, 1.324008, 1, 0.8627451, 0, 1,
-1.086791, -0.6613557, -0.9674632, 1, 0.8705882, 0, 1,
-1.085829, -1.650281, -2.695327, 1, 0.8745098, 0, 1,
-1.068572, 0.3214424, -2.189492, 1, 0.8823529, 0, 1,
-1.066617, -1.320317, -2.669597, 1, 0.8862745, 0, 1,
-1.062567, -0.7156211, -3.297621, 1, 0.8941177, 0, 1,
-1.061936, 1.307122, 0.8087952, 1, 0.8980392, 0, 1,
-1.060883, -0.03844808, -2.552736, 1, 0.9058824, 0, 1,
-1.058569, -2.517041, -1.674703, 1, 0.9137255, 0, 1,
-1.057422, 0.4020914, -0.3812701, 1, 0.9176471, 0, 1,
-1.04735, -0.4623685, -1.972209, 1, 0.9254902, 0, 1,
-1.04633, -0.2633402, -2.788665, 1, 0.9294118, 0, 1,
-1.045558, 0.2095568, -3.045868, 1, 0.9372549, 0, 1,
-1.043706, -0.1517999, -1.434584, 1, 0.9411765, 0, 1,
-1.041151, 1.530831, -1.526199, 1, 0.9490196, 0, 1,
-1.040889, -0.9589238, -0.2427904, 1, 0.9529412, 0, 1,
-1.024354, -0.02853418, -2.139175, 1, 0.9607843, 0, 1,
-1.022158, -0.9189254, -3.363894, 1, 0.9647059, 0, 1,
-1.019121, 0.5840715, -2.023665, 1, 0.972549, 0, 1,
-1.017373, 1.536661, 0.5643919, 1, 0.9764706, 0, 1,
-1.012408, 0.708195, -0.9577637, 1, 0.9843137, 0, 1,
-1.012196, -1.151397, -2.647002, 1, 0.9882353, 0, 1,
-0.9832006, -0.5164175, -2.00871, 1, 0.9960784, 0, 1,
-0.9776813, -0.5467874, -1.875112, 0.9960784, 1, 0, 1,
-0.9752707, -0.02292224, -0.298686, 0.9921569, 1, 0, 1,
-0.9727065, 1.352364, -1.01465, 0.9843137, 1, 0, 1,
-0.9716748, 0.2270815, -1.891612, 0.9803922, 1, 0, 1,
-0.9693267, -0.3922589, -2.714146, 0.972549, 1, 0, 1,
-0.9649034, 0.06881215, -1.578623, 0.9686275, 1, 0, 1,
-0.9636559, 0.206806, -1.265404, 0.9607843, 1, 0, 1,
-0.959609, -0.8847033, -3.217982, 0.9568627, 1, 0, 1,
-0.9589984, 0.3123733, -1.119217, 0.9490196, 1, 0, 1,
-0.9540267, 0.6068885, -2.339391, 0.945098, 1, 0, 1,
-0.9492766, 1.658032, 1.586053, 0.9372549, 1, 0, 1,
-0.9490145, 0.953748, -0.1085785, 0.9333333, 1, 0, 1,
-0.9329382, -0.06697652, -1.550123, 0.9254902, 1, 0, 1,
-0.9239604, -0.05493212, -0.9743239, 0.9215686, 1, 0, 1,
-0.9200405, 1.763588, -1.150316, 0.9137255, 1, 0, 1,
-0.915264, 0.2797767, -1.319535, 0.9098039, 1, 0, 1,
-0.9131179, 0.475608, -0.7820149, 0.9019608, 1, 0, 1,
-0.9130493, -0.2173759, -3.659387, 0.8941177, 1, 0, 1,
-0.8946758, -1.361692, -2.740782, 0.8901961, 1, 0, 1,
-0.8892667, 0.4202963, -1.81603, 0.8823529, 1, 0, 1,
-0.8881456, 0.4099633, -0.6118847, 0.8784314, 1, 0, 1,
-0.8792955, -0.209077, -2.373465, 0.8705882, 1, 0, 1,
-0.8748097, -0.4342496, -1.011958, 0.8666667, 1, 0, 1,
-0.8734765, 0.9300734, -0.4837418, 0.8588235, 1, 0, 1,
-0.8618221, 0.9262161, -1.552497, 0.854902, 1, 0, 1,
-0.8600495, 0.6016026, 0.149162, 0.8470588, 1, 0, 1,
-0.8568686, -0.9706114, -1.974599, 0.8431373, 1, 0, 1,
-0.8566324, -0.1640723, -1.14893, 0.8352941, 1, 0, 1,
-0.8524058, -0.6389603, -5.177499, 0.8313726, 1, 0, 1,
-0.8481584, -0.131395, 0.09367754, 0.8235294, 1, 0, 1,
-0.8478547, 0.8245012, -1.807055, 0.8196079, 1, 0, 1,
-0.8299453, 1.743268, 1.41384, 0.8117647, 1, 0, 1,
-0.8275766, 0.2810165, -2.695556, 0.8078431, 1, 0, 1,
-0.8228701, 0.8055769, -2.141405, 0.8, 1, 0, 1,
-0.8207339, -0.5818623, -1.315699, 0.7921569, 1, 0, 1,
-0.8201286, -0.03330061, -1.687994, 0.7882353, 1, 0, 1,
-0.8172587, 1.621075, -2.077734, 0.7803922, 1, 0, 1,
-0.813854, -1.557855, -4.554414, 0.7764706, 1, 0, 1,
-0.8077679, -0.06065706, -3.204662, 0.7686275, 1, 0, 1,
-0.8050072, 1.730616, -1.606376, 0.7647059, 1, 0, 1,
-0.8027974, 1.04554, -1.120137, 0.7568628, 1, 0, 1,
-0.799858, -0.1568232, -1.480006, 0.7529412, 1, 0, 1,
-0.7995512, -0.5294158, -1.086238, 0.7450981, 1, 0, 1,
-0.787926, 0.6356429, -0.5306833, 0.7411765, 1, 0, 1,
-0.7872214, 0.8544099, 0.7677663, 0.7333333, 1, 0, 1,
-0.7840008, -1.727177, -4.863135, 0.7294118, 1, 0, 1,
-0.781887, 0.3508477, -0.4916356, 0.7215686, 1, 0, 1,
-0.7758417, 0.4300592, -0.4913819, 0.7176471, 1, 0, 1,
-0.7731768, 1.686822, -0.6645288, 0.7098039, 1, 0, 1,
-0.771978, 0.2906403, -1.236045, 0.7058824, 1, 0, 1,
-0.769864, -0.04098403, -1.622012, 0.6980392, 1, 0, 1,
-0.7672476, 1.34632, -0.8555405, 0.6901961, 1, 0, 1,
-0.7611582, -1.411125, -1.742766, 0.6862745, 1, 0, 1,
-0.7584652, 0.2065977, -1.003628, 0.6784314, 1, 0, 1,
-0.7550415, -1.332086, -4.371354, 0.6745098, 1, 0, 1,
-0.7549441, 1.342617, -1.780951, 0.6666667, 1, 0, 1,
-0.7531108, -1.180113, -2.291911, 0.6627451, 1, 0, 1,
-0.7503744, 0.5723607, 0.704052, 0.654902, 1, 0, 1,
-0.7490154, -1.192474, -1.289412, 0.6509804, 1, 0, 1,
-0.7485844, -0.3143927, -2.98868, 0.6431373, 1, 0, 1,
-0.7485347, -0.3288012, -2.46763, 0.6392157, 1, 0, 1,
-0.748141, 0.8100317, -1.02248, 0.6313726, 1, 0, 1,
-0.7430333, 0.4833941, -2.066149, 0.627451, 1, 0, 1,
-0.7427447, 0.4712468, -2.758721, 0.6196079, 1, 0, 1,
-0.7365927, -0.5908149, -2.604722, 0.6156863, 1, 0, 1,
-0.7353553, 1.356089, 0.03799371, 0.6078432, 1, 0, 1,
-0.7338896, 0.4666589, -0.453169, 0.6039216, 1, 0, 1,
-0.7308317, 1.457611, -1.491575, 0.5960785, 1, 0, 1,
-0.7281747, -1.193317, -2.834028, 0.5882353, 1, 0, 1,
-0.7236788, -1.122987, -4.605228, 0.5843138, 1, 0, 1,
-0.7223036, 0.8508844, -0.4959236, 0.5764706, 1, 0, 1,
-0.7208535, -0.1102007, -1.964733, 0.572549, 1, 0, 1,
-0.7185748, -0.7763733, -0.3253117, 0.5647059, 1, 0, 1,
-0.7172888, 0.03138768, 0.0413209, 0.5607843, 1, 0, 1,
-0.7160698, -0.4242896, -1.208177, 0.5529412, 1, 0, 1,
-0.713341, 0.3000067, -1.632129, 0.5490196, 1, 0, 1,
-0.7037241, -0.8360661, -3.235777, 0.5411765, 1, 0, 1,
-0.7025035, -0.93041, -0.4544035, 0.5372549, 1, 0, 1,
-0.7013874, -1.206645, -1.472778, 0.5294118, 1, 0, 1,
-0.7010674, 0.5385588, -1.56503, 0.5254902, 1, 0, 1,
-0.7009026, 0.4866615, -0.855105, 0.5176471, 1, 0, 1,
-0.7007881, 0.8091145, -0.7518678, 0.5137255, 1, 0, 1,
-0.6974137, 1.187442, 0.3278843, 0.5058824, 1, 0, 1,
-0.6947613, 1.739412, 0.6737947, 0.5019608, 1, 0, 1,
-0.692237, 0.2337351, -2.398305, 0.4941176, 1, 0, 1,
-0.682584, -0.2297636, -3.211446, 0.4862745, 1, 0, 1,
-0.682237, 1.474203, -0.4114918, 0.4823529, 1, 0, 1,
-0.6812734, 0.560483, -2.597979, 0.4745098, 1, 0, 1,
-0.678887, 0.7415509, 0.3813158, 0.4705882, 1, 0, 1,
-0.6750725, 1.459802, -0.6555279, 0.4627451, 1, 0, 1,
-0.6725348, 2.100924, 0.02879573, 0.4588235, 1, 0, 1,
-0.6706706, -1.609748, -1.504806, 0.4509804, 1, 0, 1,
-0.6656774, -1.567415, -2.729511, 0.4470588, 1, 0, 1,
-0.6642887, 0.07015144, -0.633733, 0.4392157, 1, 0, 1,
-0.6639993, 0.1379514, -4.92835, 0.4352941, 1, 0, 1,
-0.6553169, -0.4575968, -1.905167, 0.427451, 1, 0, 1,
-0.6499237, 0.4305113, -0.8921467, 0.4235294, 1, 0, 1,
-0.6374417, 0.01093983, -1.255285, 0.4156863, 1, 0, 1,
-0.6343228, -0.6676099, -2.857138, 0.4117647, 1, 0, 1,
-0.6269584, -1.621501, -4.89016, 0.4039216, 1, 0, 1,
-0.6260914, -1.372623, -1.918622, 0.3960784, 1, 0, 1,
-0.6248188, -0.04864227, -1.646231, 0.3921569, 1, 0, 1,
-0.6248112, 1.465094, -0.6503174, 0.3843137, 1, 0, 1,
-0.6212777, 0.1735428, -1.891711, 0.3803922, 1, 0, 1,
-0.6190429, -0.75964, -2.209051, 0.372549, 1, 0, 1,
-0.618466, 2.708795, -0.703613, 0.3686275, 1, 0, 1,
-0.6166255, -0.9670266, -3.862584, 0.3607843, 1, 0, 1,
-0.6153808, 0.579895, -1.490631, 0.3568628, 1, 0, 1,
-0.6135185, 1.118642, 0.2595737, 0.3490196, 1, 0, 1,
-0.6130302, 0.5845639, -0.4177524, 0.345098, 1, 0, 1,
-0.6110092, 0.3207084, -2.376754, 0.3372549, 1, 0, 1,
-0.6027949, -0.3742424, -2.093971, 0.3333333, 1, 0, 1,
-0.6008298, 0.6229914, 0.02612003, 0.3254902, 1, 0, 1,
-0.6007271, -0.01118343, -2.036213, 0.3215686, 1, 0, 1,
-0.5992968, -0.8652761, -1.922728, 0.3137255, 1, 0, 1,
-0.5986772, 0.1414013, -3.484663, 0.3098039, 1, 0, 1,
-0.5974218, -0.2767696, -0.9768505, 0.3019608, 1, 0, 1,
-0.5968451, -1.552682, -2.107886, 0.2941177, 1, 0, 1,
-0.5935009, -2.854798, -2.365188, 0.2901961, 1, 0, 1,
-0.5844817, -1.773845, -2.069966, 0.282353, 1, 0, 1,
-0.5803835, 0.1004065, -0.1792111, 0.2784314, 1, 0, 1,
-0.5797157, -1.401899, -3.012262, 0.2705882, 1, 0, 1,
-0.5775621, 0.7260501, -0.8713599, 0.2666667, 1, 0, 1,
-0.5775492, -0.8268753, -1.666107, 0.2588235, 1, 0, 1,
-0.5754751, -0.0736153, -1.628907, 0.254902, 1, 0, 1,
-0.5750639, -0.9081278, -3.202971, 0.2470588, 1, 0, 1,
-0.5729088, 0.5757141, -1.692514, 0.2431373, 1, 0, 1,
-0.5676746, 1.13473, 0.05034499, 0.2352941, 1, 0, 1,
-0.5625533, -0.3848063, -2.70934, 0.2313726, 1, 0, 1,
-0.5610346, -0.4360154, -2.397944, 0.2235294, 1, 0, 1,
-0.5585569, -1.731764, -1.460316, 0.2196078, 1, 0, 1,
-0.5584097, 0.8089108, -1.096655, 0.2117647, 1, 0, 1,
-0.5569886, -0.7390354, -4.22314, 0.2078431, 1, 0, 1,
-0.5564561, -0.7342528, -2.158078, 0.2, 1, 0, 1,
-0.5561981, 0.2892282, -1.5099, 0.1921569, 1, 0, 1,
-0.5546796, -0.5955274, -2.355045, 0.1882353, 1, 0, 1,
-0.5516925, 0.7873365, -1.256189, 0.1803922, 1, 0, 1,
-0.5512488, 0.1893342, -1.230519, 0.1764706, 1, 0, 1,
-0.5477583, 0.8458886, 2.239665, 0.1686275, 1, 0, 1,
-0.5470329, 2.2239, -0.8760142, 0.1647059, 1, 0, 1,
-0.5459993, 1.04341, -1.799546, 0.1568628, 1, 0, 1,
-0.5442485, -1.023898, -2.665895, 0.1529412, 1, 0, 1,
-0.5432542, 2.232199, -0.7670636, 0.145098, 1, 0, 1,
-0.5419839, -0.9616215, -2.987614, 0.1411765, 1, 0, 1,
-0.5409508, -1.326133, -3.599344, 0.1333333, 1, 0, 1,
-0.537982, 0.1719578, -1.712596, 0.1294118, 1, 0, 1,
-0.5376719, 3.052575, 2.547187, 0.1215686, 1, 0, 1,
-0.5359247, -1.243441, -3.332579, 0.1176471, 1, 0, 1,
-0.5352455, -0.2831074, -2.007301, 0.1098039, 1, 0, 1,
-0.5339313, -0.5100733, -2.419912, 0.1058824, 1, 0, 1,
-0.530553, 1.019933, -1.768247, 0.09803922, 1, 0, 1,
-0.5286061, -1.299048, -1.846364, 0.09019608, 1, 0, 1,
-0.5249661, -0.9051748, -3.159457, 0.08627451, 1, 0, 1,
-0.5191236, -1.117072, -4.570845, 0.07843138, 1, 0, 1,
-0.5189828, 0.8282796, -1.324493, 0.07450981, 1, 0, 1,
-0.5158253, -0.7225655, -2.493796, 0.06666667, 1, 0, 1,
-0.5138046, 0.5942753, -2.211348, 0.0627451, 1, 0, 1,
-0.5097749, -1.623854, -4.060206, 0.05490196, 1, 0, 1,
-0.5009708, 0.477064, -0.6508492, 0.05098039, 1, 0, 1,
-0.4981702, 0.6798736, -1.217717, 0.04313726, 1, 0, 1,
-0.4944863, -1.250975, -3.674636, 0.03921569, 1, 0, 1,
-0.4935209, -1.203727, -2.224229, 0.03137255, 1, 0, 1,
-0.4849055, -1.617792, -1.235784, 0.02745098, 1, 0, 1,
-0.483514, 0.8794683, -1.311148, 0.01960784, 1, 0, 1,
-0.4802234, 1.33603, -1.523644, 0.01568628, 1, 0, 1,
-0.4760614, 1.547362, -0.3861759, 0.007843138, 1, 0, 1,
-0.4710519, -0.3260174, -3.776031, 0.003921569, 1, 0, 1,
-0.4658516, -0.2619456, -0.7779013, 0, 1, 0.003921569, 1,
-0.4654245, 0.265788, 0.4805293, 0, 1, 0.01176471, 1,
-0.4647088, -0.3939112, -1.224145, 0, 1, 0.01568628, 1,
-0.4638891, -0.01459874, 0.09220037, 0, 1, 0.02352941, 1,
-0.4637547, 1.186914, 0.5502905, 0, 1, 0.02745098, 1,
-0.4457849, 0.8897517, -1.426092, 0, 1, 0.03529412, 1,
-0.4410125, -0.4047111, -1.026483, 0, 1, 0.03921569, 1,
-0.4379475, 1.018431, 0.7761844, 0, 1, 0.04705882, 1,
-0.4376189, -0.03391523, -2.04582, 0, 1, 0.05098039, 1,
-0.4365866, -1.694784, -4.094502, 0, 1, 0.05882353, 1,
-0.4363179, 0.6805723, 1.448776, 0, 1, 0.0627451, 1,
-0.4328305, -0.8954208, -4.318875, 0, 1, 0.07058824, 1,
-0.4313163, -0.9214281, -2.616793, 0, 1, 0.07450981, 1,
-0.426139, 0.1476398, -0.8306345, 0, 1, 0.08235294, 1,
-0.4253482, 0.8612419, 0.8225061, 0, 1, 0.08627451, 1,
-0.4127935, 1.349682, -1.362349, 0, 1, 0.09411765, 1,
-0.4124162, 0.09187761, -2.438661, 0, 1, 0.1019608, 1,
-0.4046745, -2.32892, -4.469486, 0, 1, 0.1058824, 1,
-0.403991, -0.07153969, -1.606451, 0, 1, 0.1137255, 1,
-0.4035137, 0.698495, -0.1678828, 0, 1, 0.1176471, 1,
-0.4024504, 0.4567433, 0.2900471, 0, 1, 0.1254902, 1,
-0.3952497, 0.01684095, -1.449269, 0, 1, 0.1294118, 1,
-0.3916654, -1.240204, -2.03828, 0, 1, 0.1372549, 1,
-0.3855408, 0.8552215, 0.2791788, 0, 1, 0.1411765, 1,
-0.3835822, 0.9344373, 0.17296, 0, 1, 0.1490196, 1,
-0.3774588, 2.282751, -0.2547925, 0, 1, 0.1529412, 1,
-0.3769521, 1.523991, -0.9838653, 0, 1, 0.1607843, 1,
-0.3742641, -1.058228, -3.746552, 0, 1, 0.1647059, 1,
-0.3738751, 1.516103, -1.536714, 0, 1, 0.172549, 1,
-0.3716763, 0.6045773, -0.4379412, 0, 1, 0.1764706, 1,
-0.3687295, 0.6331013, 0.409977, 0, 1, 0.1843137, 1,
-0.3570169, 0.8647354, 1.313209, 0, 1, 0.1882353, 1,
-0.3523885, -0.6405959, -2.979354, 0, 1, 0.1960784, 1,
-0.3517085, -1.3622, -2.118814, 0, 1, 0.2039216, 1,
-0.3485253, -1.083606, -3.134198, 0, 1, 0.2078431, 1,
-0.3481182, 0.1428582, -0.3614057, 0, 1, 0.2156863, 1,
-0.3471185, -0.3323386, -3.06097, 0, 1, 0.2196078, 1,
-0.3459025, 1.092387, 0.9504613, 0, 1, 0.227451, 1,
-0.3431546, -1.709965, -3.757386, 0, 1, 0.2313726, 1,
-0.3430391, -1.849322, -2.2687, 0, 1, 0.2392157, 1,
-0.3307151, 0.3516751, -2.185856, 0, 1, 0.2431373, 1,
-0.3296427, -1.482026, -2.05717, 0, 1, 0.2509804, 1,
-0.3287221, 0.5830536, -0.5480485, 0, 1, 0.254902, 1,
-0.3254968, -0.37432, -2.507483, 0, 1, 0.2627451, 1,
-0.3217552, -0.1315614, -1.797363, 0, 1, 0.2666667, 1,
-0.3214184, -1.926712, -2.915369, 0, 1, 0.2745098, 1,
-0.319919, 0.1194136, -1.167365, 0, 1, 0.2784314, 1,
-0.3156002, -0.7581795, -3.686873, 0, 1, 0.2862745, 1,
-0.3155434, -0.3688504, -1.122791, 0, 1, 0.2901961, 1,
-0.3097021, 0.1612212, -0.266026, 0, 1, 0.2980392, 1,
-0.3081652, -0.006667047, -1.441806, 0, 1, 0.3058824, 1,
-0.3074533, 0.5913286, 0.6727134, 0, 1, 0.3098039, 1,
-0.2943797, -0.04395419, -2.577623, 0, 1, 0.3176471, 1,
-0.2942989, 1.076837, -0.6059753, 0, 1, 0.3215686, 1,
-0.2933591, -0.2742117, -2.393041, 0, 1, 0.3294118, 1,
-0.2911485, 0.1267048, -1.999936, 0, 1, 0.3333333, 1,
-0.28873, 0.2924813, -0.1546241, 0, 1, 0.3411765, 1,
-0.2869666, -0.8843251, -4.057854, 0, 1, 0.345098, 1,
-0.2861578, 1.135968, 0.3571227, 0, 1, 0.3529412, 1,
-0.2831356, 0.6387791, -0.9964554, 0, 1, 0.3568628, 1,
-0.2803269, 0.4887576, -1.870908, 0, 1, 0.3647059, 1,
-0.2795962, -1.047975, -3.20714, 0, 1, 0.3686275, 1,
-0.2760532, 1.722011, -0.4165695, 0, 1, 0.3764706, 1,
-0.2752681, 0.486048, -0.3143754, 0, 1, 0.3803922, 1,
-0.2735795, 0.02281477, -1.989279, 0, 1, 0.3882353, 1,
-0.2729115, -0.4241713, -1.226727, 0, 1, 0.3921569, 1,
-0.2712468, -0.3284824, -0.9813391, 0, 1, 0.4, 1,
-0.2683556, -0.06444851, -2.147304, 0, 1, 0.4078431, 1,
-0.2663655, -0.2116979, -2.23164, 0, 1, 0.4117647, 1,
-0.2654188, 0.7923783, 0.3872827, 0, 1, 0.4196078, 1,
-0.2619252, 0.8108846, -0.2195665, 0, 1, 0.4235294, 1,
-0.2610019, 0.6947017, -0.09435824, 0, 1, 0.4313726, 1,
-0.2607722, -0.5056294, -2.555856, 0, 1, 0.4352941, 1,
-0.2572301, -0.3641019, -3.179266, 0, 1, 0.4431373, 1,
-0.2556356, -0.6379746, -2.80628, 0, 1, 0.4470588, 1,
-0.2511386, -0.4913189, -3.841648, 0, 1, 0.454902, 1,
-0.2499358, -0.3849426, -5.265841, 0, 1, 0.4588235, 1,
-0.249918, 0.9994845, -0.9231899, 0, 1, 0.4666667, 1,
-0.2490258, -0.9231117, -2.561372, 0, 1, 0.4705882, 1,
-0.2487435, -0.5757368, -3.048183, 0, 1, 0.4784314, 1,
-0.2467118, -2.168081, -4.208713, 0, 1, 0.4823529, 1,
-0.2452507, -0.02999021, -1.548653, 0, 1, 0.4901961, 1,
-0.2431274, 0.5585896, -0.7719606, 0, 1, 0.4941176, 1,
-0.2409183, 0.03220309, -0.8044041, 0, 1, 0.5019608, 1,
-0.2398096, -1.206688, -3.775618, 0, 1, 0.509804, 1,
-0.2366688, 0.04434996, -2.267468, 0, 1, 0.5137255, 1,
-0.2311651, 1.118132, 0.07517702, 0, 1, 0.5215687, 1,
-0.2299609, 1.680336, 1.469396, 0, 1, 0.5254902, 1,
-0.2236949, 0.4261971, -0.6930262, 0, 1, 0.5333334, 1,
-0.2224533, -2.019944, -3.548604, 0, 1, 0.5372549, 1,
-0.2202848, -0.7522337, -1.797629, 0, 1, 0.5450981, 1,
-0.2197768, -1.867939, -2.248305, 0, 1, 0.5490196, 1,
-0.2196302, -0.3381408, -2.364947, 0, 1, 0.5568628, 1,
-0.2173549, -1.692411, -4.443039, 0, 1, 0.5607843, 1,
-0.2172381, 0.2576173, 1.078523, 0, 1, 0.5686275, 1,
-0.2116614, 1.502892, 0.4807569, 0, 1, 0.572549, 1,
-0.2113085, -0.03494596, -1.770597, 0, 1, 0.5803922, 1,
-0.2082313, -0.08861662, -1.202983, 0, 1, 0.5843138, 1,
-0.2082266, -0.9435591, -1.656704, 0, 1, 0.5921569, 1,
-0.2035095, 0.4115373, 2.011278, 0, 1, 0.5960785, 1,
-0.2016107, 1.642021, -1.101217, 0, 1, 0.6039216, 1,
-0.1999195, 0.08168636, -1.298864, 0, 1, 0.6117647, 1,
-0.199761, 0.1901961, -1.498504, 0, 1, 0.6156863, 1,
-0.1995595, -0.3354487, -1.743497, 0, 1, 0.6235294, 1,
-0.194814, 0.7180208, -1.157741, 0, 1, 0.627451, 1,
-0.1920185, 1.568989, -0.6903973, 0, 1, 0.6352941, 1,
-0.1863538, -0.8921294, -3.642759, 0, 1, 0.6392157, 1,
-0.184984, -0.3717129, -2.159013, 0, 1, 0.6470588, 1,
-0.1827612, 0.6853927, -1.262283, 0, 1, 0.6509804, 1,
-0.1826642, 0.3549399, -1.375038, 0, 1, 0.6588235, 1,
-0.1771736, 1.139768, -1.285172, 0, 1, 0.6627451, 1,
-0.1760564, 0.7395378, 1.104913, 0, 1, 0.6705883, 1,
-0.1711169, 0.03781424, -0.0001951094, 0, 1, 0.6745098, 1,
-0.1691154, 0.7490957, -0.5574152, 0, 1, 0.682353, 1,
-0.1679558, -0.4328076, -1.770215, 0, 1, 0.6862745, 1,
-0.1673916, 0.7907034, 1.754154, 0, 1, 0.6941177, 1,
-0.1660312, -0.9428936, -3.080414, 0, 1, 0.7019608, 1,
-0.1639441, -1.960212, -3.050444, 0, 1, 0.7058824, 1,
-0.1619344, 0.932584, 0.4159975, 0, 1, 0.7137255, 1,
-0.1606018, -0.8022979, -1.972952, 0, 1, 0.7176471, 1,
-0.1597998, -0.09556555, -1.75613, 0, 1, 0.7254902, 1,
-0.1593378, -1.572716, -3.121571, 0, 1, 0.7294118, 1,
-0.1587752, 0.7099091, -0.1113421, 0, 1, 0.7372549, 1,
-0.1572328, -0.1457843, -4.05281, 0, 1, 0.7411765, 1,
-0.1499012, -2.835651, -3.602515, 0, 1, 0.7490196, 1,
-0.1486104, 2.715982, -0.6207561, 0, 1, 0.7529412, 1,
-0.1460302, -0.2804441, -3.464133, 0, 1, 0.7607843, 1,
-0.1442519, -0.9451734, -1.671861, 0, 1, 0.7647059, 1,
-0.1440959, -0.9524169, -2.243154, 0, 1, 0.772549, 1,
-0.1408949, -0.5201131, -2.33695, 0, 1, 0.7764706, 1,
-0.1364195, 0.7797052, -0.733035, 0, 1, 0.7843137, 1,
-0.1340208, -0.447765, -2.270222, 0, 1, 0.7882353, 1,
-0.1310219, -1.961504, -2.832584, 0, 1, 0.7960784, 1,
-0.1255983, -1.415545, -4.172171, 0, 1, 0.8039216, 1,
-0.1230819, -0.6825385, -2.398068, 0, 1, 0.8078431, 1,
-0.1225515, 0.2343817, -0.2163603, 0, 1, 0.8156863, 1,
-0.1211551, -0.4685879, -4.088186, 0, 1, 0.8196079, 1,
-0.1066678, -0.9265684, -0.9755439, 0, 1, 0.827451, 1,
-0.1040195, 0.3147053, -1.569716, 0, 1, 0.8313726, 1,
-0.1032853, -0.2894319, -3.365939, 0, 1, 0.8392157, 1,
-0.1013654, -1.41954, -2.152127, 0, 1, 0.8431373, 1,
-0.09846342, 0.705328, -0.9893306, 0, 1, 0.8509804, 1,
-0.0967235, 1.273739, -1.289249, 0, 1, 0.854902, 1,
-0.0955015, -0.5530028, -4.27686, 0, 1, 0.8627451, 1,
-0.09351666, 0.2851971, -2.56828, 0, 1, 0.8666667, 1,
-0.08675621, -0.5844813, -2.5411, 0, 1, 0.8745098, 1,
-0.08387422, -0.7075818, -3.594991, 0, 1, 0.8784314, 1,
-0.07388479, -0.6859652, -2.600879, 0, 1, 0.8862745, 1,
-0.07221839, -0.2155553, -2.825271, 0, 1, 0.8901961, 1,
-0.06449615, -2.454932, -3.915682, 0, 1, 0.8980392, 1,
-0.06407821, 0.06763892, -1.026269, 0, 1, 0.9058824, 1,
-0.06123986, 0.8821209, 0.3894616, 0, 1, 0.9098039, 1,
-0.06039365, 1.284352, 0.4271504, 0, 1, 0.9176471, 1,
-0.05791103, -1.358582, -1.95705, 0, 1, 0.9215686, 1,
-0.05772049, -0.3926771, -2.438978, 0, 1, 0.9294118, 1,
-0.05735063, -1.464657, -3.307581, 0, 1, 0.9333333, 1,
-0.05283827, -0.03625304, -2.696502, 0, 1, 0.9411765, 1,
-0.05109495, 0.5124702, 0.4163887, 0, 1, 0.945098, 1,
-0.04952975, 1.232056, 0.5403345, 0, 1, 0.9529412, 1,
-0.0492241, -0.495439, -1.975089, 0, 1, 0.9568627, 1,
-0.04518782, -0.317095, -3.129211, 0, 1, 0.9647059, 1,
-0.04093482, 1.462374, 0.1808952, 0, 1, 0.9686275, 1,
-0.04034662, 2.230501, 0.5518137, 0, 1, 0.9764706, 1,
-0.0386476, 1.043682, -1.236136, 0, 1, 0.9803922, 1,
-0.03660126, -1.006802, -3.655255, 0, 1, 0.9882353, 1,
-0.03332736, 2.034867, -0.8860546, 0, 1, 0.9921569, 1,
-0.03253875, -0.3052401, -3.32371, 0, 1, 1, 1,
-0.03003775, -1.169587, -2.923666, 0, 0.9921569, 1, 1,
-0.02140492, 1.131556, 0.1767458, 0, 0.9882353, 1, 1,
-0.02021291, 0.6619503, 0.08851004, 0, 0.9803922, 1, 1,
-0.0146873, 0.7691581, -1.118847, 0, 0.9764706, 1, 1,
-0.01384815, -0.8490787, -3.121162, 0, 0.9686275, 1, 1,
-0.01275736, -1.505174, -3.450029, 0, 0.9647059, 1, 1,
-0.01014314, -0.5681704, -2.848879, 0, 0.9568627, 1, 1,
-0.008725142, 1.035418, 0.7467936, 0, 0.9529412, 1, 1,
-0.005417509, -0.2772388, -4.047713, 0, 0.945098, 1, 1,
-0.0008131787, 0.4033057, 1.588844, 0, 0.9411765, 1, 1,
0.0002857423, 0.1166769, 3.505194, 0, 0.9333333, 1, 1,
0.001287125, 0.2238365, -0.8180763, 0, 0.9294118, 1, 1,
0.00538556, -0.1486269, 4.111677, 0, 0.9215686, 1, 1,
0.006506977, -0.4244649, 3.008237, 0, 0.9176471, 1, 1,
0.008286109, -0.2037576, 3.537178, 0, 0.9098039, 1, 1,
0.009072733, -0.4509289, 2.46062, 0, 0.9058824, 1, 1,
0.01121014, 0.8240969, 0.389091, 0, 0.8980392, 1, 1,
0.01505726, -1.546648, 3.613462, 0, 0.8901961, 1, 1,
0.01825364, -1.153921, 4.073805, 0, 0.8862745, 1, 1,
0.02210126, -1.978209, 3.914128, 0, 0.8784314, 1, 1,
0.02571117, -1.094328, 2.318459, 0, 0.8745098, 1, 1,
0.02904722, 1.487386, 2.386768, 0, 0.8666667, 1, 1,
0.04405976, 0.6406356, -0.9888968, 0, 0.8627451, 1, 1,
0.04882288, 0.1049137, 0.5621927, 0, 0.854902, 1, 1,
0.04946192, -0.2988095, 4.478922, 0, 0.8509804, 1, 1,
0.04971906, 0.8458173, -0.9908345, 0, 0.8431373, 1, 1,
0.05011787, 0.8610155, -0.7753919, 0, 0.8392157, 1, 1,
0.05501451, -0.85038, 2.031856, 0, 0.8313726, 1, 1,
0.05551914, -0.2558731, 2.705047, 0, 0.827451, 1, 1,
0.05624199, 0.6097419, 0.5153822, 0, 0.8196079, 1, 1,
0.05684205, -1.928687, 3.718815, 0, 0.8156863, 1, 1,
0.060706, -0.314549, 3.856477, 0, 0.8078431, 1, 1,
0.06076182, 0.1878615, 1.265794, 0, 0.8039216, 1, 1,
0.06099953, 0.7376683, -0.2995346, 0, 0.7960784, 1, 1,
0.06276243, -1.884234, 2.975472, 0, 0.7882353, 1, 1,
0.06293594, 1.858972, 0.3087799, 0, 0.7843137, 1, 1,
0.06316464, -0.5728862, 2.632545, 0, 0.7764706, 1, 1,
0.06422096, -1.066642, 3.770264, 0, 0.772549, 1, 1,
0.06454674, 0.8721358, 1.645863, 0, 0.7647059, 1, 1,
0.06673915, -0.2811775, 4.579471, 0, 0.7607843, 1, 1,
0.06818572, 1.921007, -0.4911001, 0, 0.7529412, 1, 1,
0.06820091, 1.832393, 0.3474604, 0, 0.7490196, 1, 1,
0.06915557, -0.23963, 1.881565, 0, 0.7411765, 1, 1,
0.06977873, -0.118989, 3.092897, 0, 0.7372549, 1, 1,
0.0708768, 1.036206, 2.032082, 0, 0.7294118, 1, 1,
0.07131172, -2.826673, 2.927929, 0, 0.7254902, 1, 1,
0.07807433, 0.07102481, 1.641018, 0, 0.7176471, 1, 1,
0.08413936, 0.5366579, -0.06947609, 0, 0.7137255, 1, 1,
0.08493876, -0.2352276, 2.634526, 0, 0.7058824, 1, 1,
0.09438211, -0.02558293, 1.881791, 0, 0.6980392, 1, 1,
0.09660979, 0.7022167, 1.012968, 0, 0.6941177, 1, 1,
0.09667609, 0.4822068, 0.03185256, 0, 0.6862745, 1, 1,
0.09816711, -0.2127318, 1.544655, 0, 0.682353, 1, 1,
0.09874648, 0.2470749, 0.9369135, 0, 0.6745098, 1, 1,
0.1055019, -1.199202, 3.838642, 0, 0.6705883, 1, 1,
0.1066508, -1.278745, 2.713509, 0, 0.6627451, 1, 1,
0.1076851, -0.8693653, 4.010304, 0, 0.6588235, 1, 1,
0.1115867, 1.498936, 2.263235, 0, 0.6509804, 1, 1,
0.11731, -0.2835088, 2.206608, 0, 0.6470588, 1, 1,
0.1243679, -1.418227, 2.926689, 0, 0.6392157, 1, 1,
0.126172, 0.8512635, -0.4492025, 0, 0.6352941, 1, 1,
0.1321314, 1.717885, -0.4477337, 0, 0.627451, 1, 1,
0.1334754, 0.06918073, 1.865557, 0, 0.6235294, 1, 1,
0.1386921, -1.938308, 4.593507, 0, 0.6156863, 1, 1,
0.139025, 1.539368, -1.477489, 0, 0.6117647, 1, 1,
0.1395067, 0.9985516, -0.213444, 0, 0.6039216, 1, 1,
0.1404685, 1.080622, -1.143655, 0, 0.5960785, 1, 1,
0.1443564, -0.4686291, 3.43093, 0, 0.5921569, 1, 1,
0.1496004, -1.973133, 4.100923, 0, 0.5843138, 1, 1,
0.1515725, -0.7841247, 2.376566, 0, 0.5803922, 1, 1,
0.1559707, -0.495134, 3.345335, 0, 0.572549, 1, 1,
0.1626051, -0.02058184, 1.896148, 0, 0.5686275, 1, 1,
0.1639564, 0.4023687, 0.8581675, 0, 0.5607843, 1, 1,
0.1685511, 1.751073, 1.713521, 0, 0.5568628, 1, 1,
0.1712089, 0.3751279, 1.759254, 0, 0.5490196, 1, 1,
0.1717751, 1.504829, -0.1091138, 0, 0.5450981, 1, 1,
0.173682, -1.305697, 3.215546, 0, 0.5372549, 1, 1,
0.1751875, -0.2614959, 1.040501, 0, 0.5333334, 1, 1,
0.175308, 0.2462718, 2.104096, 0, 0.5254902, 1, 1,
0.1776928, -0.2969121, 1.592003, 0, 0.5215687, 1, 1,
0.1780159, -0.003430468, 2.413972, 0, 0.5137255, 1, 1,
0.178985, -0.7416602, 1.223382, 0, 0.509804, 1, 1,
0.1821318, 0.8704333, 0.06258348, 0, 0.5019608, 1, 1,
0.1839323, 0.001432455, 1.467261, 0, 0.4941176, 1, 1,
0.189857, -0.09849169, 2.206614, 0, 0.4901961, 1, 1,
0.1964041, -0.1720075, 2.913212, 0, 0.4823529, 1, 1,
0.2001297, -2.25459, 2.96783, 0, 0.4784314, 1, 1,
0.2026822, 0.8950667, -0.6072747, 0, 0.4705882, 1, 1,
0.2027731, 1.389788, 0.2612266, 0, 0.4666667, 1, 1,
0.2051979, -0.7931799, 3.28766, 0, 0.4588235, 1, 1,
0.2059359, -0.9300135, 2.46395, 0, 0.454902, 1, 1,
0.2073163, -0.1116953, 2.148689, 0, 0.4470588, 1, 1,
0.2147437, 1.890522, -0.1292037, 0, 0.4431373, 1, 1,
0.2176098, -0.4339282, 2.809028, 0, 0.4352941, 1, 1,
0.2183009, 1.371699, 1.781262, 0, 0.4313726, 1, 1,
0.2233396, -0.05529429, 2.519239, 0, 0.4235294, 1, 1,
0.2281894, 0.5470176, 0.5741273, 0, 0.4196078, 1, 1,
0.2292396, 0.7631224, 0.001498168, 0, 0.4117647, 1, 1,
0.2295607, 1.187386, -1.239668, 0, 0.4078431, 1, 1,
0.2301012, -2.468457, 2.345188, 0, 0.4, 1, 1,
0.2337931, -0.7857997, 1.971384, 0, 0.3921569, 1, 1,
0.2344698, 1.247967, 0.1448508, 0, 0.3882353, 1, 1,
0.2370137, 1.726383, 0.1507719, 0, 0.3803922, 1, 1,
0.2449831, 0.9730636, -0.5239919, 0, 0.3764706, 1, 1,
0.2451256, 0.1793195, 1.207296, 0, 0.3686275, 1, 1,
0.2460566, -0.5193188, 3.125167, 0, 0.3647059, 1, 1,
0.2461077, 0.09990497, 0.6556367, 0, 0.3568628, 1, 1,
0.2477366, -0.4442669, 1.829621, 0, 0.3529412, 1, 1,
0.2494982, 0.04128578, 2.526697, 0, 0.345098, 1, 1,
0.2532008, -1.35495, 2.993111, 0, 0.3411765, 1, 1,
0.2576889, 0.7092673, 0.6774955, 0, 0.3333333, 1, 1,
0.2594037, -0.8814388, 3.588374, 0, 0.3294118, 1, 1,
0.2621448, -0.2205908, 1.143682, 0, 0.3215686, 1, 1,
0.2638018, 0.8867114, -0.4469037, 0, 0.3176471, 1, 1,
0.2689393, 1.267573, -2.798024, 0, 0.3098039, 1, 1,
0.2699126, 1.565936, 0.8661723, 0, 0.3058824, 1, 1,
0.2736745, -0.02029315, 1.744018, 0, 0.2980392, 1, 1,
0.2769278, -1.015575, 1.847494, 0, 0.2901961, 1, 1,
0.2797953, 0.3183579, 1.430929, 0, 0.2862745, 1, 1,
0.2821258, -1.996487, 4.500661, 0, 0.2784314, 1, 1,
0.2842734, 0.400817, 1.067589, 0, 0.2745098, 1, 1,
0.2950802, 0.4546864, 0.4939162, 0, 0.2666667, 1, 1,
0.295986, -0.8393509, 2.982965, 0, 0.2627451, 1, 1,
0.2960332, 1.780892, -0.5741474, 0, 0.254902, 1, 1,
0.2960964, 1.642964, -0.3195191, 0, 0.2509804, 1, 1,
0.2965971, -1.17967, 3.183783, 0, 0.2431373, 1, 1,
0.2980413, -1.17827, 2.300713, 0, 0.2392157, 1, 1,
0.3014104, 0.1905267, 3.587135, 0, 0.2313726, 1, 1,
0.3036935, 0.8400509, -0.03851143, 0, 0.227451, 1, 1,
0.3055278, -0.2612103, 1.793663, 0, 0.2196078, 1, 1,
0.3076569, -0.2738154, 1.384611, 0, 0.2156863, 1, 1,
0.3087752, 1.844072, 1.551168, 0, 0.2078431, 1, 1,
0.3140593, 0.5172796, -0.4676119, 0, 0.2039216, 1, 1,
0.3173816, 0.01640762, 1.659617, 0, 0.1960784, 1, 1,
0.3183081, -0.09696908, 1.37475, 0, 0.1882353, 1, 1,
0.3202105, -0.3937537, 2.523668, 0, 0.1843137, 1, 1,
0.3212585, -1.335069, 1.324348, 0, 0.1764706, 1, 1,
0.3224814, -0.4491355, 1.232627, 0, 0.172549, 1, 1,
0.3256835, 0.3499255, 0.8406665, 0, 0.1647059, 1, 1,
0.3282207, 1.54286, 0.5705215, 0, 0.1607843, 1, 1,
0.3334614, 0.04730619, 0.9671553, 0, 0.1529412, 1, 1,
0.3375964, 0.5209911, 0.8939361, 0, 0.1490196, 1, 1,
0.3408583, -0.4231668, 2.351407, 0, 0.1411765, 1, 1,
0.3421964, 0.1653077, -0.2411126, 0, 0.1372549, 1, 1,
0.3427533, 1.019406, -1.700948, 0, 0.1294118, 1, 1,
0.3429391, 1.384166, -1.672706, 0, 0.1254902, 1, 1,
0.3446017, -1.805068, 2.306132, 0, 0.1176471, 1, 1,
0.3488673, -0.6539435, 0.9928043, 0, 0.1137255, 1, 1,
0.3491406, 1.9449, 2.291185, 0, 0.1058824, 1, 1,
0.3500016, 1.319727, 1.457585, 0, 0.09803922, 1, 1,
0.3516046, -1.578528, 3.058762, 0, 0.09411765, 1, 1,
0.353324, -2.302296, 4.570489, 0, 0.08627451, 1, 1,
0.3537037, 0.5494611, 0.5944591, 0, 0.08235294, 1, 1,
0.3565118, 0.4489225, 1.070973, 0, 0.07450981, 1, 1,
0.3574963, 1.496332, 1.230558, 0, 0.07058824, 1, 1,
0.3628979, -0.4197314, 1.974585, 0, 0.0627451, 1, 1,
0.3683425, 1.473434, 1.00999, 0, 0.05882353, 1, 1,
0.3717455, 0.3316721, -0.08133186, 0, 0.05098039, 1, 1,
0.3726925, -0.1975515, 1.579092, 0, 0.04705882, 1, 1,
0.3760601, -0.2832376, 2.405393, 0, 0.03921569, 1, 1,
0.3768141, -1.171957, 3.741035, 0, 0.03529412, 1, 1,
0.3821502, -0.9789814, 2.351556, 0, 0.02745098, 1, 1,
0.3833252, -0.6399519, 4.89712, 0, 0.02352941, 1, 1,
0.3837827, -0.3508682, 3.007501, 0, 0.01568628, 1, 1,
0.3864619, 1.086429, -0.3727762, 0, 0.01176471, 1, 1,
0.3869878, 0.6633267, 1.157188, 0, 0.003921569, 1, 1,
0.3886104, -0.3222678, 1.540569, 0.003921569, 0, 1, 1,
0.3920717, -0.526927, 3.313627, 0.007843138, 0, 1, 1,
0.3934727, -0.04101422, 1.392906, 0.01568628, 0, 1, 1,
0.3958576, 1.919929, 1.571522, 0.01960784, 0, 1, 1,
0.3971944, 0.9387703, 1.327398, 0.02745098, 0, 1, 1,
0.3975297, -0.3825151, 2.584575, 0.03137255, 0, 1, 1,
0.4021708, -0.4582709, 2.460636, 0.03921569, 0, 1, 1,
0.40241, 1.18777, -0.6823211, 0.04313726, 0, 1, 1,
0.4166818, -1.659278, 4.464064, 0.05098039, 0, 1, 1,
0.4170508, -1.461705, 3.730682, 0.05490196, 0, 1, 1,
0.4210663, 0.04782212, 0.4531769, 0.0627451, 0, 1, 1,
0.4273823, 1.73312, 1.826729, 0.06666667, 0, 1, 1,
0.4305041, 0.1492727, 0.1106063, 0.07450981, 0, 1, 1,
0.4321725, -0.08040243, 2.188099, 0.07843138, 0, 1, 1,
0.4425025, 0.41769, 0.2396923, 0.08627451, 0, 1, 1,
0.459795, -0.637911, 0.9428763, 0.09019608, 0, 1, 1,
0.4611581, -1.02487, 0.9056722, 0.09803922, 0, 1, 1,
0.4613352, 1.692624, 0.4625155, 0.1058824, 0, 1, 1,
0.4614172, -1.320413, 4.861939, 0.1098039, 0, 1, 1,
0.4615737, -1.089285, 3.403673, 0.1176471, 0, 1, 1,
0.4617607, -0.05065097, -1.506402, 0.1215686, 0, 1, 1,
0.4668126, 0.8044499, -0.295587, 0.1294118, 0, 1, 1,
0.4675145, -0.6199278, 1.261755, 0.1333333, 0, 1, 1,
0.475116, -1.282497, 2.765989, 0.1411765, 0, 1, 1,
0.4756721, 0.6014799, 1.090436, 0.145098, 0, 1, 1,
0.4759065, -0.4239942, 1.262583, 0.1529412, 0, 1, 1,
0.4791026, 0.007217206, 2.956548, 0.1568628, 0, 1, 1,
0.4801822, 1.018204, 1.781308, 0.1647059, 0, 1, 1,
0.4813154, -2.049258, 2.870482, 0.1686275, 0, 1, 1,
0.4842147, 0.1128564, 0.6482071, 0.1764706, 0, 1, 1,
0.4858633, 0.736846, 0.1534425, 0.1803922, 0, 1, 1,
0.486258, -0.9217299, 2.358298, 0.1882353, 0, 1, 1,
0.4896469, 0.2823176, 1.812906, 0.1921569, 0, 1, 1,
0.4898744, -2.240882, 4.954171, 0.2, 0, 1, 1,
0.4899011, -1.107951, 4.050314, 0.2078431, 0, 1, 1,
0.4932639, 0.7641651, 0.9684533, 0.2117647, 0, 1, 1,
0.4948999, -0.0412441, 1.996644, 0.2196078, 0, 1, 1,
0.4957898, -1.021692, 0.3005407, 0.2235294, 0, 1, 1,
0.4984154, 0.802728, 0.7987756, 0.2313726, 0, 1, 1,
0.5038208, 0.3849074, -0.2569702, 0.2352941, 0, 1, 1,
0.5076847, -0.7458503, 4.364887, 0.2431373, 0, 1, 1,
0.5089791, 0.36361, 1.477301, 0.2470588, 0, 1, 1,
0.5103688, 0.162724, -0.1145311, 0.254902, 0, 1, 1,
0.5203096, 1.196007, 0.8916056, 0.2588235, 0, 1, 1,
0.5223549, -2.286764, 2.110426, 0.2666667, 0, 1, 1,
0.5252844, 0.73657, 0.46945, 0.2705882, 0, 1, 1,
0.5299599, 1.262973, -0.6274518, 0.2784314, 0, 1, 1,
0.5313419, -0.3628478, 1.65903, 0.282353, 0, 1, 1,
0.5323376, 0.19726, 0.8930341, 0.2901961, 0, 1, 1,
0.534003, -0.9728529, 2.967301, 0.2941177, 0, 1, 1,
0.5359207, 0.6909119, 0.9451826, 0.3019608, 0, 1, 1,
0.5445979, -1.861872, 1.340268, 0.3098039, 0, 1, 1,
0.5505809, -0.8583086, 3.357487, 0.3137255, 0, 1, 1,
0.5525708, 0.3748407, 1.360786, 0.3215686, 0, 1, 1,
0.5529826, 1.654949, -0.3490042, 0.3254902, 0, 1, 1,
0.5534714, -0.4781136, 2.067216, 0.3333333, 0, 1, 1,
0.5571752, 0.4762156, 2.601057, 0.3372549, 0, 1, 1,
0.5598154, 1.550617, -1.803082, 0.345098, 0, 1, 1,
0.5619102, 1.154923, -0.7645098, 0.3490196, 0, 1, 1,
0.5630974, -0.3160734, 1.51773, 0.3568628, 0, 1, 1,
0.5640112, -0.6437705, 4.074342, 0.3607843, 0, 1, 1,
0.5661116, 0.2262874, 1.773749, 0.3686275, 0, 1, 1,
0.5664613, 0.579142, -0.130906, 0.372549, 0, 1, 1,
0.5689, -0.9007716, 3.718905, 0.3803922, 0, 1, 1,
0.5719337, -0.3424647, 1.715268, 0.3843137, 0, 1, 1,
0.5772351, -2.143376, 3.351386, 0.3921569, 0, 1, 1,
0.577399, -1.4673, 4.637828, 0.3960784, 0, 1, 1,
0.5791706, -0.936147, 1.318898, 0.4039216, 0, 1, 1,
0.5857862, 1.204582, 0.7831106, 0.4117647, 0, 1, 1,
0.5867727, -0.9015794, 0.6060302, 0.4156863, 0, 1, 1,
0.5892085, -0.1323838, 3.570985, 0.4235294, 0, 1, 1,
0.5928164, -0.5917343, 2.836427, 0.427451, 0, 1, 1,
0.5968304, 0.609623, 0.3766721, 0.4352941, 0, 1, 1,
0.5983304, 1.002479, -0.4026051, 0.4392157, 0, 1, 1,
0.6035319, -0.9375914, 3.373001, 0.4470588, 0, 1, 1,
0.6080124, 1.107728, 1.956715, 0.4509804, 0, 1, 1,
0.609278, 0.03428743, 1.958073, 0.4588235, 0, 1, 1,
0.6123886, 0.1668734, 0.4193597, 0.4627451, 0, 1, 1,
0.6190207, 0.1011296, 1.82095, 0.4705882, 0, 1, 1,
0.6209968, -0.1243812, 2.518922, 0.4745098, 0, 1, 1,
0.6221799, 0.3281658, 1.147883, 0.4823529, 0, 1, 1,
0.6236167, -1.510029, 3.17355, 0.4862745, 0, 1, 1,
0.6282285, -0.7643675, 1.000476, 0.4941176, 0, 1, 1,
0.6337341, -0.08245718, 0.8469968, 0.5019608, 0, 1, 1,
0.6348384, 1.612391, 0.9847407, 0.5058824, 0, 1, 1,
0.6404004, -0.5078858, 1.92189, 0.5137255, 0, 1, 1,
0.641094, 0.466329, 1.475477, 0.5176471, 0, 1, 1,
0.6427965, 0.2723963, -0.7418274, 0.5254902, 0, 1, 1,
0.6429204, -0.4970088, 2.961218, 0.5294118, 0, 1, 1,
0.6443721, -0.2471443, 3.571332, 0.5372549, 0, 1, 1,
0.6460415, -0.6284443, 2.175742, 0.5411765, 0, 1, 1,
0.6556296, -0.9928277, 2.377942, 0.5490196, 0, 1, 1,
0.6556516, -0.3251396, 0.1700507, 0.5529412, 0, 1, 1,
0.6598537, 0.1082249, 0.7482609, 0.5607843, 0, 1, 1,
0.6604858, -0.9717886, 4.487034, 0.5647059, 0, 1, 1,
0.6663483, 0.1004246, 1.750301, 0.572549, 0, 1, 1,
0.6691828, 1.291667, 2.335456, 0.5764706, 0, 1, 1,
0.6764845, -1.132112, 2.667231, 0.5843138, 0, 1, 1,
0.6822795, -2.565386, 1.852168, 0.5882353, 0, 1, 1,
0.6864534, -0.4302658, 0.7722717, 0.5960785, 0, 1, 1,
0.689002, -1.227845, 0.4113886, 0.6039216, 0, 1, 1,
0.6897258, 0.3134184, 1.792513, 0.6078432, 0, 1, 1,
0.6898453, -0.9956076, 3.55722, 0.6156863, 0, 1, 1,
0.6929291, -0.6929168, 2.843088, 0.6196079, 0, 1, 1,
0.6938307, -0.8163031, 2.985791, 0.627451, 0, 1, 1,
0.6940464, 1.893156, 0.9580614, 0.6313726, 0, 1, 1,
0.7131475, 0.8487986, 0.9020532, 0.6392157, 0, 1, 1,
0.7132987, 0.3998342, 2.401611, 0.6431373, 0, 1, 1,
0.7147812, 0.05902053, 3.882899, 0.6509804, 0, 1, 1,
0.7147937, 0.881822, 0.1522366, 0.654902, 0, 1, 1,
0.7172924, -0.9199374, 1.074759, 0.6627451, 0, 1, 1,
0.7212362, -0.3643298, 3.938449, 0.6666667, 0, 1, 1,
0.7237923, -1.50465, 2.700809, 0.6745098, 0, 1, 1,
0.7251848, 1.028179, 0.875891, 0.6784314, 0, 1, 1,
0.7304589, -0.4619235, 3.124486, 0.6862745, 0, 1, 1,
0.7305022, 0.3965434, 0.9314558, 0.6901961, 0, 1, 1,
0.734287, 0.02198869, 1.369803, 0.6980392, 0, 1, 1,
0.7365803, 0.03334292, 2.415808, 0.7058824, 0, 1, 1,
0.7412643, 0.9750584, 0.3566568, 0.7098039, 0, 1, 1,
0.7481328, 0.9992473, -1.118604, 0.7176471, 0, 1, 1,
0.7516462, -1.039699, 2.89466, 0.7215686, 0, 1, 1,
0.7547832, 1.593345, 0.2458395, 0.7294118, 0, 1, 1,
0.7671367, 1.662417, 1.103962, 0.7333333, 0, 1, 1,
0.7671377, -0.2784216, 1.917028, 0.7411765, 0, 1, 1,
0.7702991, 0.1409414, 4.261224, 0.7450981, 0, 1, 1,
0.7708182, -1.141173, 2.052535, 0.7529412, 0, 1, 1,
0.7862048, -0.5906476, 3.495249, 0.7568628, 0, 1, 1,
0.7918743, -0.05944039, 2.520951, 0.7647059, 0, 1, 1,
0.7933624, 0.2511202, 1.45316, 0.7686275, 0, 1, 1,
0.7964832, 1.056337, -0.08772473, 0.7764706, 0, 1, 1,
0.7975334, -0.5586402, 3.949988, 0.7803922, 0, 1, 1,
0.798142, -0.2116611, 0.1747549, 0.7882353, 0, 1, 1,
0.7990659, 0.7874413, -0.1136871, 0.7921569, 0, 1, 1,
0.8066165, 0.04449908, 2.118011, 0.8, 0, 1, 1,
0.8108014, -2.030164, 3.397569, 0.8078431, 0, 1, 1,
0.8148984, 1.29385, 1.157258, 0.8117647, 0, 1, 1,
0.8214692, -0.6226074, 0.8907954, 0.8196079, 0, 1, 1,
0.8315321, -2.412729, 1.735242, 0.8235294, 0, 1, 1,
0.8369862, 0.7780865, 1.393941, 0.8313726, 0, 1, 1,
0.8457032, -0.5068095, 2.63235, 0.8352941, 0, 1, 1,
0.8485469, -1.977593, 2.208653, 0.8431373, 0, 1, 1,
0.8485947, -0.8805798, 0.9013812, 0.8470588, 0, 1, 1,
0.8593566, 0.9550388, 0.2558162, 0.854902, 0, 1, 1,
0.8706414, -1.636289, -0.3436384, 0.8588235, 0, 1, 1,
0.8738835, 1.955044, -0.4173755, 0.8666667, 0, 1, 1,
0.8748174, 1.255055, -0.6409107, 0.8705882, 0, 1, 1,
0.8755057, 1.302685, 1.40074, 0.8784314, 0, 1, 1,
0.9016727, 0.4451495, -0.9439512, 0.8823529, 0, 1, 1,
0.902975, 2.560814, -0.3700227, 0.8901961, 0, 1, 1,
0.9100716, 0.8455616, 0.70679, 0.8941177, 0, 1, 1,
0.9123071, -0.04777351, 1.198516, 0.9019608, 0, 1, 1,
0.9141502, 0.4044942, -0.53343, 0.9098039, 0, 1, 1,
0.9197137, 1.497724, -1.624312, 0.9137255, 0, 1, 1,
0.9223241, -1.375047, 3.874069, 0.9215686, 0, 1, 1,
0.9225372, -1.037502, 3.963016, 0.9254902, 0, 1, 1,
0.9247966, -1.1494, 4.446304, 0.9333333, 0, 1, 1,
0.9304795, -1.356465, 2.141971, 0.9372549, 0, 1, 1,
0.9353788, -0.409492, 1.351405, 0.945098, 0, 1, 1,
0.942213, -0.1346805, 2.10533, 0.9490196, 0, 1, 1,
0.9447973, -1.737722, 3.074716, 0.9568627, 0, 1, 1,
0.9492211, -2.068251, 1.969708, 0.9607843, 0, 1, 1,
0.9501587, 0.5929038, 0.7301562, 0.9686275, 0, 1, 1,
0.9516497, 0.2227122, 0.5968196, 0.972549, 0, 1, 1,
0.9537242, -2.198595, 2.191004, 0.9803922, 0, 1, 1,
0.9580758, 0.1162799, 2.301385, 0.9843137, 0, 1, 1,
0.9624853, 0.6770363, 0.7681807, 0.9921569, 0, 1, 1,
0.9627134, 1.126679, -0.7893667, 0.9960784, 0, 1, 1,
0.9649896, 0.5512524, -0.5618258, 1, 0, 0.9960784, 1,
0.9650066, 1.865208, 1.057021, 1, 0, 0.9882353, 1,
0.9654301, -0.7978291, 2.49688, 1, 0, 0.9843137, 1,
0.9661005, 1.762578, 0.1315371, 1, 0, 0.9764706, 1,
0.969583, -0.4349691, 0.2596764, 1, 0, 0.972549, 1,
0.9733917, 0.06019545, 2.523804, 1, 0, 0.9647059, 1,
0.974764, -1.942816, 2.811379, 1, 0, 0.9607843, 1,
0.9763412, 0.2554749, 1.416236, 1, 0, 0.9529412, 1,
0.9767514, -0.4097422, 1.451579, 1, 0, 0.9490196, 1,
0.9776664, 0.5812655, -0.3234949, 1, 0, 0.9411765, 1,
0.9834092, 0.904805, 0.398534, 1, 0, 0.9372549, 1,
0.9847873, -0.9949044, 1.786504, 1, 0, 0.9294118, 1,
0.9869041, 1.706879, -0.8067241, 1, 0, 0.9254902, 1,
0.989215, -1.03176, 2.90555, 1, 0, 0.9176471, 1,
0.9985098, -1.21678, 3.075583, 1, 0, 0.9137255, 1,
1.00098, 0.3698964, 2.206526, 1, 0, 0.9058824, 1,
1.001168, -0.4334766, 0.8546956, 1, 0, 0.9019608, 1,
1.001972, 0.6165703, 0.6495841, 1, 0, 0.8941177, 1,
1.004478, 0.8802111, -0.02087034, 1, 0, 0.8862745, 1,
1.010805, -1.67943, 3.171494, 1, 0, 0.8823529, 1,
1.020111, -0.5546584, 1.125469, 1, 0, 0.8745098, 1,
1.022616, 1.257546, 1.607951, 1, 0, 0.8705882, 1,
1.025, 0.6900179, -0.8818238, 1, 0, 0.8627451, 1,
1.031317, -0.5889818, 0.6978178, 1, 0, 0.8588235, 1,
1.031578, 0.255843, 1.271696, 1, 0, 0.8509804, 1,
1.040194, -1.925088, 2.897543, 1, 0, 0.8470588, 1,
1.0405, 0.5870047, 0.5206276, 1, 0, 0.8392157, 1,
1.041316, 1.540926, 1.79348, 1, 0, 0.8352941, 1,
1.053967, -1.642303, 2.695106, 1, 0, 0.827451, 1,
1.062195, -0.4254119, 1.123482, 1, 0, 0.8235294, 1,
1.069506, -0.2349479, 1.365347, 1, 0, 0.8156863, 1,
1.070037, -1.703314, 2.084157, 1, 0, 0.8117647, 1,
1.073091, -0.1476472, 5.4638e-05, 1, 0, 0.8039216, 1,
1.074213, 0.02924569, 2.200637, 1, 0, 0.7960784, 1,
1.074264, -0.1048357, 3.130187, 1, 0, 0.7921569, 1,
1.077482, -0.8156052, 1.466805, 1, 0, 0.7843137, 1,
1.081634, -0.08992188, 1.67657, 1, 0, 0.7803922, 1,
1.090531, 0.1886219, 1.458235, 1, 0, 0.772549, 1,
1.101072, 1.80688, -0.4781002, 1, 0, 0.7686275, 1,
1.106251, 0.4955629, -0.5826504, 1, 0, 0.7607843, 1,
1.108178, -1.059348, 3.345584, 1, 0, 0.7568628, 1,
1.110897, -0.5602036, 0.6246021, 1, 0, 0.7490196, 1,
1.116031, 1.446086, 1.208046, 1, 0, 0.7450981, 1,
1.117366, 0.8073794, 0.7172405, 1, 0, 0.7372549, 1,
1.117545, 1.208061, -0.4250812, 1, 0, 0.7333333, 1,
1.132632, 0.7109184, -0.1130587, 1, 0, 0.7254902, 1,
1.133386, 0.04236754, 0.7772598, 1, 0, 0.7215686, 1,
1.13959, 0.7558201, -0.4958227, 1, 0, 0.7137255, 1,
1.140221, 0.2627887, 1.725802, 1, 0, 0.7098039, 1,
1.15497, 0.416209, 1.392767, 1, 0, 0.7019608, 1,
1.161058, 0.5227863, 1.962638, 1, 0, 0.6941177, 1,
1.169507, 2.061309, 0.3168242, 1, 0, 0.6901961, 1,
1.174093, -0.6538163, 0.5537218, 1, 0, 0.682353, 1,
1.177219, 0.6145772, 0.852841, 1, 0, 0.6784314, 1,
1.177263, 0.2958865, 0.5293378, 1, 0, 0.6705883, 1,
1.182207, -0.5231507, 1.200043, 1, 0, 0.6666667, 1,
1.18321, 0.4908893, 2.516047, 1, 0, 0.6588235, 1,
1.188952, -0.9984207, 2.162495, 1, 0, 0.654902, 1,
1.193745, -0.3540824, 1.515469, 1, 0, 0.6470588, 1,
1.198248, 0.2684443, 1.174403, 1, 0, 0.6431373, 1,
1.199219, 1.061298, 2.275711, 1, 0, 0.6352941, 1,
1.201627, 0.9085415, 0.6439844, 1, 0, 0.6313726, 1,
1.20918, -0.03556278, 1.626625, 1, 0, 0.6235294, 1,
1.216143, -0.2655653, -0.6401841, 1, 0, 0.6196079, 1,
1.216756, 1.082631, -0.7085754, 1, 0, 0.6117647, 1,
1.223302, -0.2216867, -0.544292, 1, 0, 0.6078432, 1,
1.226508, -1.730813, 2.877657, 1, 0, 0.6, 1,
1.242459, -0.0004496822, 1.10831, 1, 0, 0.5921569, 1,
1.262188, -1.063492, 2.231583, 1, 0, 0.5882353, 1,
1.274225, -0.4441681, 1.053572, 1, 0, 0.5803922, 1,
1.274807, -0.1539703, 1.167974, 1, 0, 0.5764706, 1,
1.287575, 0.6519065, 1.668679, 1, 0, 0.5686275, 1,
1.298103, -0.557423, 2.192798, 1, 0, 0.5647059, 1,
1.30571, -1.35894, 1.26386, 1, 0, 0.5568628, 1,
1.309812, -0.2160455, 2.481289, 1, 0, 0.5529412, 1,
1.319025, -2.186269, 1.664271, 1, 0, 0.5450981, 1,
1.322315, -0.4020169, 1.948806, 1, 0, 0.5411765, 1,
1.327446, -0.3669591, -0.09678816, 1, 0, 0.5333334, 1,
1.328819, -0.5978679, 1.345034, 1, 0, 0.5294118, 1,
1.331582, 0.9680785, 2.053778, 1, 0, 0.5215687, 1,
1.338472, 2.107937, -0.6318809, 1, 0, 0.5176471, 1,
1.343889, 1.32146, 0.5099531, 1, 0, 0.509804, 1,
1.345955, 0.5702562, -0.1420061, 1, 0, 0.5058824, 1,
1.351076, 0.7245075, -0.1129514, 1, 0, 0.4980392, 1,
1.356052, 0.1058887, 1.416073, 1, 0, 0.4901961, 1,
1.358984, 0.776432, 1.718872, 1, 0, 0.4862745, 1,
1.361335, -0.7760035, 1.055761, 1, 0, 0.4784314, 1,
1.38216, -0.1313648, 2.981131, 1, 0, 0.4745098, 1,
1.397759, 0.2918239, 1.817856, 1, 0, 0.4666667, 1,
1.405694, 0.1100545, 1.425757, 1, 0, 0.4627451, 1,
1.410534, -1.569783, 3.367915, 1, 0, 0.454902, 1,
1.411329, 1.383076, -0.3743599, 1, 0, 0.4509804, 1,
1.419197, -0.5734242, 1.877227, 1, 0, 0.4431373, 1,
1.425249, 0.6163593, 1.550985, 1, 0, 0.4392157, 1,
1.434324, 1.135209, 0.486336, 1, 0, 0.4313726, 1,
1.448777, 1.063485, 0.9407616, 1, 0, 0.427451, 1,
1.449478, -1.173311, 2.088021, 1, 0, 0.4196078, 1,
1.458862, -1.31849, 2.580127, 1, 0, 0.4156863, 1,
1.460849, 2.283018, 2.581093, 1, 0, 0.4078431, 1,
1.479236, -1.607407, 4.470096, 1, 0, 0.4039216, 1,
1.481219, -0.7279317, 2.325566, 1, 0, 0.3960784, 1,
1.484847, 1.783917, 0.2519553, 1, 0, 0.3882353, 1,
1.485849, 2.086267, 1.342053, 1, 0, 0.3843137, 1,
1.486675, -1.03903, 1.631675, 1, 0, 0.3764706, 1,
1.49234, -0.7014225, 0.3877901, 1, 0, 0.372549, 1,
1.497546, 1.705409, -0.01900864, 1, 0, 0.3647059, 1,
1.506538, -0.5323465, 1.08949, 1, 0, 0.3607843, 1,
1.511682, -0.3578609, 0.9741135, 1, 0, 0.3529412, 1,
1.522814, -2.428037, 3.991898, 1, 0, 0.3490196, 1,
1.523326, -1.467396, 1.179579, 1, 0, 0.3411765, 1,
1.529492, -1.349115, 2.507365, 1, 0, 0.3372549, 1,
1.530378, -0.7997728, 2.519002, 1, 0, 0.3294118, 1,
1.531809, 1.100303, 1.658646, 1, 0, 0.3254902, 1,
1.533275, -0.2558752, 0.9959148, 1, 0, 0.3176471, 1,
1.538543, -0.3618675, 1.51627, 1, 0, 0.3137255, 1,
1.546316, 0.08457291, 2.013684, 1, 0, 0.3058824, 1,
1.558886, 2.483658, 1.95468, 1, 0, 0.2980392, 1,
1.560152, 0.6905141, 0.6852509, 1, 0, 0.2941177, 1,
1.570618, -1.148675, 2.957087, 1, 0, 0.2862745, 1,
1.57499, 0.1608705, 1.362789, 1, 0, 0.282353, 1,
1.581749, 2.562704, 0.9907141, 1, 0, 0.2745098, 1,
1.587238, 0.2193321, 1.063411, 1, 0, 0.2705882, 1,
1.606292, -0.2985824, 2.085953, 1, 0, 0.2627451, 1,
1.633695, 0.8885245, 2.433527, 1, 0, 0.2588235, 1,
1.669832, 0.9007699, 2.357909, 1, 0, 0.2509804, 1,
1.67946, -0.135572, -0.3139386, 1, 0, 0.2470588, 1,
1.684225, 0.6767275, 1.536311, 1, 0, 0.2392157, 1,
1.707429, 1.297024, 1.699314, 1, 0, 0.2352941, 1,
1.733113, -0.5056158, 0.8300366, 1, 0, 0.227451, 1,
1.762045, -1.83544, 1.566438, 1, 0, 0.2235294, 1,
1.778736, -0.01353969, 1.508075, 1, 0, 0.2156863, 1,
1.787432, 0.0741675, 1.648925, 1, 0, 0.2117647, 1,
1.789269, 1.34959, 1.113958, 1, 0, 0.2039216, 1,
1.800935, 0.8214056, 0.3636478, 1, 0, 0.1960784, 1,
1.819918, -1.55351, 3.774657, 1, 0, 0.1921569, 1,
1.830853, 0.7851868, -0.08107597, 1, 0, 0.1843137, 1,
1.851219, 1.350336, -0.3844437, 1, 0, 0.1803922, 1,
1.896969, 0.7817542, 0.7702527, 1, 0, 0.172549, 1,
1.904641, -0.6180131, 1.593103, 1, 0, 0.1686275, 1,
1.908844, -1.835516, 2.04598, 1, 0, 0.1607843, 1,
1.947819, 0.06148863, 0.5105128, 1, 0, 0.1568628, 1,
1.955706, -1.412553, 0.8191443, 1, 0, 0.1490196, 1,
2.005701, -0.8921012, 1.509287, 1, 0, 0.145098, 1,
2.065123, 0.005265383, -0.09970285, 1, 0, 0.1372549, 1,
2.066489, -0.3822804, 1.693673, 1, 0, 0.1333333, 1,
2.084159, -0.5795459, 3.298907, 1, 0, 0.1254902, 1,
2.093658, 0.4340447, 1.763693, 1, 0, 0.1215686, 1,
2.098385, 1.000845, -0.9184538, 1, 0, 0.1137255, 1,
2.110917, 1.25489, 1.661447, 1, 0, 0.1098039, 1,
2.145293, 0.4320883, 2.113488, 1, 0, 0.1019608, 1,
2.158404, 0.4184685, 2.748371, 1, 0, 0.09411765, 1,
2.160112, 0.3343561, 1.229928, 1, 0, 0.09019608, 1,
2.160821, -0.8674258, 1.264306, 1, 0, 0.08235294, 1,
2.180278, 1.728192, -0.2696599, 1, 0, 0.07843138, 1,
2.227105, 0.09365574, 1.467757, 1, 0, 0.07058824, 1,
2.251275, -0.02223525, 3.874629, 1, 0, 0.06666667, 1,
2.273841, 0.447903, 1.83973, 1, 0, 0.05882353, 1,
2.311587, 0.4325463, -1.111255, 1, 0, 0.05490196, 1,
2.323658, -1.428701, 2.886533, 1, 0, 0.04705882, 1,
2.358109, 0.808066, 1.480228, 1, 0, 0.04313726, 1,
2.427043, -1.681447, 3.216626, 1, 0, 0.03529412, 1,
2.440835, -1.642068, 1.555524, 1, 0, 0.03137255, 1,
2.521419, -0.932744, -0.155939, 1, 0, 0.02352941, 1,
2.721968, -1.340253, 2.608636, 1, 0, 0.01960784, 1,
2.728422, 1.157827, 1.429762, 1, 0, 0.01176471, 1,
4.563172, 1.279438, 1.88408, 1, 0, 0.007843138, 1
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
0.9546869, -3.856097, -6.998133, 0, -0.5, 0.5, 0.5,
0.9546869, -3.856097, -6.998133, 1, -0.5, 0.5, 0.5,
0.9546869, -3.856097, -6.998133, 1, 1.5, 0.5, 0.5,
0.9546869, -3.856097, -6.998133, 0, 1.5, 0.5, 0.5
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
-3.877075, 0.09888887, -6.998133, 0, -0.5, 0.5, 0.5,
-3.877075, 0.09888887, -6.998133, 1, -0.5, 0.5, 0.5,
-3.877075, 0.09888887, -6.998133, 1, 1.5, 0.5, 0.5,
-3.877075, 0.09888887, -6.998133, 0, 1.5, 0.5, 0.5
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
-3.877075, -3.856097, -0.1558347, 0, -0.5, 0.5, 0.5,
-3.877075, -3.856097, -0.1558347, 1, -0.5, 0.5, 0.5,
-3.877075, -3.856097, -0.1558347, 1, 1.5, 0.5, 0.5,
-3.877075, -3.856097, -0.1558347, 0, 1.5, 0.5, 0.5
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
-2, -2.943408, -5.419141,
4, -2.943408, -5.419141,
-2, -2.943408, -5.419141,
-2, -3.095523, -5.682306,
0, -2.943408, -5.419141,
0, -3.095523, -5.682306,
2, -2.943408, -5.419141,
2, -3.095523, -5.682306,
4, -2.943408, -5.419141,
4, -3.095523, -5.682306
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
-2, -3.399753, -6.208637, 0, -0.5, 0.5, 0.5,
-2, -3.399753, -6.208637, 1, -0.5, 0.5, 0.5,
-2, -3.399753, -6.208637, 1, 1.5, 0.5, 0.5,
-2, -3.399753, -6.208637, 0, 1.5, 0.5, 0.5,
0, -3.399753, -6.208637, 0, -0.5, 0.5, 0.5,
0, -3.399753, -6.208637, 1, -0.5, 0.5, 0.5,
0, -3.399753, -6.208637, 1, 1.5, 0.5, 0.5,
0, -3.399753, -6.208637, 0, 1.5, 0.5, 0.5,
2, -3.399753, -6.208637, 0, -0.5, 0.5, 0.5,
2, -3.399753, -6.208637, 1, -0.5, 0.5, 0.5,
2, -3.399753, -6.208637, 1, 1.5, 0.5, 0.5,
2, -3.399753, -6.208637, 0, 1.5, 0.5, 0.5,
4, -3.399753, -6.208637, 0, -0.5, 0.5, 0.5,
4, -3.399753, -6.208637, 1, -0.5, 0.5, 0.5,
4, -3.399753, -6.208637, 1, 1.5, 0.5, 0.5,
4, -3.399753, -6.208637, 0, 1.5, 0.5, 0.5
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
-2.762053, -2, -5.419141,
-2.762053, 3, -5.419141,
-2.762053, -2, -5.419141,
-2.94789, -2, -5.682306,
-2.762053, -1, -5.419141,
-2.94789, -1, -5.682306,
-2.762053, 0, -5.419141,
-2.94789, 0, -5.682306,
-2.762053, 1, -5.419141,
-2.94789, 1, -5.682306,
-2.762053, 2, -5.419141,
-2.94789, 2, -5.682306,
-2.762053, 3, -5.419141,
-2.94789, 3, -5.682306
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
-3.319564, -2, -6.208637, 0, -0.5, 0.5, 0.5,
-3.319564, -2, -6.208637, 1, -0.5, 0.5, 0.5,
-3.319564, -2, -6.208637, 1, 1.5, 0.5, 0.5,
-3.319564, -2, -6.208637, 0, 1.5, 0.5, 0.5,
-3.319564, -1, -6.208637, 0, -0.5, 0.5, 0.5,
-3.319564, -1, -6.208637, 1, -0.5, 0.5, 0.5,
-3.319564, -1, -6.208637, 1, 1.5, 0.5, 0.5,
-3.319564, -1, -6.208637, 0, 1.5, 0.5, 0.5,
-3.319564, 0, -6.208637, 0, -0.5, 0.5, 0.5,
-3.319564, 0, -6.208637, 1, -0.5, 0.5, 0.5,
-3.319564, 0, -6.208637, 1, 1.5, 0.5, 0.5,
-3.319564, 0, -6.208637, 0, 1.5, 0.5, 0.5,
-3.319564, 1, -6.208637, 0, -0.5, 0.5, 0.5,
-3.319564, 1, -6.208637, 1, -0.5, 0.5, 0.5,
-3.319564, 1, -6.208637, 1, 1.5, 0.5, 0.5,
-3.319564, 1, -6.208637, 0, 1.5, 0.5, 0.5,
-3.319564, 2, -6.208637, 0, -0.5, 0.5, 0.5,
-3.319564, 2, -6.208637, 1, -0.5, 0.5, 0.5,
-3.319564, 2, -6.208637, 1, 1.5, 0.5, 0.5,
-3.319564, 2, -6.208637, 0, 1.5, 0.5, 0.5,
-3.319564, 3, -6.208637, 0, -0.5, 0.5, 0.5,
-3.319564, 3, -6.208637, 1, -0.5, 0.5, 0.5,
-3.319564, 3, -6.208637, 1, 1.5, 0.5, 0.5,
-3.319564, 3, -6.208637, 0, 1.5, 0.5, 0.5
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
-2.762053, -2.943408, -4,
-2.762053, -2.943408, 4,
-2.762053, -2.943408, -4,
-2.94789, -3.095523, -4,
-2.762053, -2.943408, -2,
-2.94789, -3.095523, -2,
-2.762053, -2.943408, 0,
-2.94789, -3.095523, 0,
-2.762053, -2.943408, 2,
-2.94789, -3.095523, 2,
-2.762053, -2.943408, 4,
-2.94789, -3.095523, 4
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
-3.319564, -3.399753, -4, 0, -0.5, 0.5, 0.5,
-3.319564, -3.399753, -4, 1, -0.5, 0.5, 0.5,
-3.319564, -3.399753, -4, 1, 1.5, 0.5, 0.5,
-3.319564, -3.399753, -4, 0, 1.5, 0.5, 0.5,
-3.319564, -3.399753, -2, 0, -0.5, 0.5, 0.5,
-3.319564, -3.399753, -2, 1, -0.5, 0.5, 0.5,
-3.319564, -3.399753, -2, 1, 1.5, 0.5, 0.5,
-3.319564, -3.399753, -2, 0, 1.5, 0.5, 0.5,
-3.319564, -3.399753, 0, 0, -0.5, 0.5, 0.5,
-3.319564, -3.399753, 0, 1, -0.5, 0.5, 0.5,
-3.319564, -3.399753, 0, 1, 1.5, 0.5, 0.5,
-3.319564, -3.399753, 0, 0, 1.5, 0.5, 0.5,
-3.319564, -3.399753, 2, 0, -0.5, 0.5, 0.5,
-3.319564, -3.399753, 2, 1, -0.5, 0.5, 0.5,
-3.319564, -3.399753, 2, 1, 1.5, 0.5, 0.5,
-3.319564, -3.399753, 2, 0, 1.5, 0.5, 0.5,
-3.319564, -3.399753, 4, 0, -0.5, 0.5, 0.5,
-3.319564, -3.399753, 4, 1, -0.5, 0.5, 0.5,
-3.319564, -3.399753, 4, 1, 1.5, 0.5, 0.5,
-3.319564, -3.399753, 4, 0, 1.5, 0.5, 0.5
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
-2.762053, -2.943408, -5.419141,
-2.762053, 3.141186, -5.419141,
-2.762053, -2.943408, 5.107471,
-2.762053, 3.141186, 5.107471,
-2.762053, -2.943408, -5.419141,
-2.762053, -2.943408, 5.107471,
-2.762053, 3.141186, -5.419141,
-2.762053, 3.141186, 5.107471,
-2.762053, -2.943408, -5.419141,
4.671427, -2.943408, -5.419141,
-2.762053, -2.943408, 5.107471,
4.671427, -2.943408, 5.107471,
-2.762053, 3.141186, -5.419141,
4.671427, 3.141186, -5.419141,
-2.762053, 3.141186, 5.107471,
4.671427, 3.141186, 5.107471,
4.671427, -2.943408, -5.419141,
4.671427, 3.141186, -5.419141,
4.671427, -2.943408, 5.107471,
4.671427, 3.141186, 5.107471,
4.671427, -2.943408, -5.419141,
4.671427, -2.943408, 5.107471,
4.671427, 3.141186, -5.419141,
4.671427, 3.141186, 5.107471
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
var radius = 7.60971;
var distance = 33.85646;
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
mvMatrix.translate( -0.9546869, -0.09888887, 0.1558347 );
mvMatrix.scale( 1.106853, 1.352229, 0.7816159 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.85646);
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
furmecyclox<-read.table("furmecyclox.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-furmecyclox$V2
```

```
## Error in eval(expr, envir, enclos): object 'furmecyclox' not found
```

```r
y<-furmecyclox$V3
```

```
## Error in eval(expr, envir, enclos): object 'furmecyclox' not found
```

```r
z<-furmecyclox$V4
```

```
## Error in eval(expr, envir, enclos): object 'furmecyclox' not found
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
-2.653799, -0.3691974, -0.7902087, 0, 0, 1, 1, 1,
-2.521574, -0.7657107, -0.5135968, 1, 0, 0, 1, 1,
-2.473056, -0.9141099, -2.83659, 1, 0, 0, 1, 1,
-2.291892, 1.358391, -0.9930234, 1, 0, 0, 1, 1,
-2.271328, -1.153156, -0.6522896, 1, 0, 0, 1, 1,
-2.23995, -1.931519, -1.353839, 1, 0, 0, 1, 1,
-2.235849, -0.659606, -1.314373, 0, 0, 0, 1, 1,
-2.201968, 2.358715, 0.0953598, 0, 0, 0, 1, 1,
-2.165151, 0.2127612, -0.6202017, 0, 0, 0, 1, 1,
-2.098629, -1.19947, -2.580271, 0, 0, 0, 1, 1,
-2.093185, 0.3501153, -1.711135, 0, 0, 0, 1, 1,
-2.06133, -1.332491, -1.612944, 0, 0, 0, 1, 1,
-2.039053, -1.036695, -2.65425, 0, 0, 0, 1, 1,
-2.037793, 0.2953376, -0.8398988, 1, 1, 1, 1, 1,
-2.023882, 2.121401, -1.301571, 1, 1, 1, 1, 1,
-2.018658, 1.571897, -0.2732494, 1, 1, 1, 1, 1,
-2.008859, -0.1975153, -1.781948, 1, 1, 1, 1, 1,
-1.997698, 1.97509, 0.3656406, 1, 1, 1, 1, 1,
-1.962004, -0.3630292, -0.954863, 1, 1, 1, 1, 1,
-1.950353, -1.586831, -0.8884158, 1, 1, 1, 1, 1,
-1.926043, 1.25438, 0.6099682, 1, 1, 1, 1, 1,
-1.924415, 0.8574681, -0.1856536, 1, 1, 1, 1, 1,
-1.922156, -0.2399514, -0.266521, 1, 1, 1, 1, 1,
-1.918373, 0.07969452, -2.099239, 1, 1, 1, 1, 1,
-1.901921, -0.3089579, -1.831753, 1, 1, 1, 1, 1,
-1.855161, 0.6679176, -1.900414, 1, 1, 1, 1, 1,
-1.852799, 0.314678, -1.816432, 1, 1, 1, 1, 1,
-1.839729, -0.4175718, -1.327562, 1, 1, 1, 1, 1,
-1.837426, -0.2887649, -1.562963, 0, 0, 1, 1, 1,
-1.827468, -1.035982, -1.415957, 1, 0, 0, 1, 1,
-1.788162, -0.6314613, -1.56407, 1, 0, 0, 1, 1,
-1.784205, 0.865372, -0.6006839, 1, 0, 0, 1, 1,
-1.761065, 0.1964592, -0.8495877, 1, 0, 0, 1, 1,
-1.747005, -0.7189716, -2.657873, 1, 0, 0, 1, 1,
-1.743557, -0.7753781, -1.169193, 0, 0, 0, 1, 1,
-1.738925, 0.6551605, -2.226215, 0, 0, 0, 1, 1,
-1.7377, 0.1426513, -2.03791, 0, 0, 0, 1, 1,
-1.733677, 1.475038, -2.180718, 0, 0, 0, 1, 1,
-1.733593, 0.4305953, -1.67449, 0, 0, 0, 1, 1,
-1.73347, 2.042785, 0.1092776, 0, 0, 0, 1, 1,
-1.724159, 0.5891869, -0.9813285, 0, 0, 0, 1, 1,
-1.723426, 1.735541, -0.4353025, 1, 1, 1, 1, 1,
-1.72123, 0.681492, -0.763412, 1, 1, 1, 1, 1,
-1.719844, -0.1083515, -1.750892, 1, 1, 1, 1, 1,
-1.707328, 0.2666449, -1.78504, 1, 1, 1, 1, 1,
-1.684416, 1.500406, -0.9847441, 1, 1, 1, 1, 1,
-1.644595, -0.8682098, -1.906001, 1, 1, 1, 1, 1,
-1.640732, 0.01401987, -2.571661, 1, 1, 1, 1, 1,
-1.633902, 0.3554972, -1.451226, 1, 1, 1, 1, 1,
-1.632565, -0.4028887, -2.611969, 1, 1, 1, 1, 1,
-1.595655, 0.5400667, -1.009356, 1, 1, 1, 1, 1,
-1.584523, 0.01120503, -1.921974, 1, 1, 1, 1, 1,
-1.563825, 1.255594, -0.9504496, 1, 1, 1, 1, 1,
-1.559368, 0.9140666, -1.887683, 1, 1, 1, 1, 1,
-1.552776, 0.436646, -2.065132, 1, 1, 1, 1, 1,
-1.544067, -1.036254, -2.577081, 1, 1, 1, 1, 1,
-1.538685, 1.275926, 0.613524, 0, 0, 1, 1, 1,
-1.530633, -0.2856232, -2.398655, 1, 0, 0, 1, 1,
-1.521986, -0.3350741, -2.591994, 1, 0, 0, 1, 1,
-1.521654, -0.5334857, -1.682742, 1, 0, 0, 1, 1,
-1.521646, -1.339002, -3.028813, 1, 0, 0, 1, 1,
-1.515501, 0.1634459, -1.815126, 1, 0, 0, 1, 1,
-1.510036, -0.2339534, -3.045056, 0, 0, 0, 1, 1,
-1.49987, -1.159069, -1.988819, 0, 0, 0, 1, 1,
-1.498868, -0.0114636, -1.529181, 0, 0, 0, 1, 1,
-1.491976, -1.35905, -1.741095, 0, 0, 0, 1, 1,
-1.474242, -0.7302922, -1.363858, 0, 0, 0, 1, 1,
-1.443742, -0.6242937, -0.1967918, 0, 0, 0, 1, 1,
-1.439523, 1.813769, -0.440378, 0, 0, 0, 1, 1,
-1.439245, -0.1831925, -2.299752, 1, 1, 1, 1, 1,
-1.43044, 0.3617316, -1.50715, 1, 1, 1, 1, 1,
-1.42849, -1.414728, -2.924368, 1, 1, 1, 1, 1,
-1.426213, -0.5515674, -2.306256, 1, 1, 1, 1, 1,
-1.422774, -0.3246013, -2.049143, 1, 1, 1, 1, 1,
-1.413845, 0.2659191, -1.443909, 1, 1, 1, 1, 1,
-1.412346, -0.9795023, -2.063739, 1, 1, 1, 1, 1,
-1.41043, -1.21542, -2.53969, 1, 1, 1, 1, 1,
-1.404997, 0.8816088, -0.7956131, 1, 1, 1, 1, 1,
-1.402082, 0.8361804, -4.638081, 1, 1, 1, 1, 1,
-1.39925, -0.4094924, -1.9994, 1, 1, 1, 1, 1,
-1.385968, 0.598438, -1.608023, 1, 1, 1, 1, 1,
-1.379408, 1.165432, -0.8907381, 1, 1, 1, 1, 1,
-1.353177, 0.04026746, -0.1363626, 1, 1, 1, 1, 1,
-1.350095, -0.00676593, -1.291263, 1, 1, 1, 1, 1,
-1.348449, -1.251907, -4.407644, 0, 0, 1, 1, 1,
-1.346819, -0.774569, -0.309883, 1, 0, 0, 1, 1,
-1.335356, 2.210361, -0.2885057, 1, 0, 0, 1, 1,
-1.326694, 2.153928, 1.86707, 1, 0, 0, 1, 1,
-1.318432, -0.7478042, -3.361197, 1, 0, 0, 1, 1,
-1.313753, -0.5240113, -3.112993, 1, 0, 0, 1, 1,
-1.311994, -0.4938719, -2.530587, 0, 0, 0, 1, 1,
-1.311856, 0.2456678, -1.236991, 0, 0, 0, 1, 1,
-1.306389, 0.5806791, -2.324703, 0, 0, 0, 1, 1,
-1.298614, 0.2509526, -0.410135, 0, 0, 0, 1, 1,
-1.29726, -1.612327, -4.240127, 0, 0, 0, 1, 1,
-1.296188, 0.6535616, -1.690571, 0, 0, 0, 1, 1,
-1.296114, -0.2530242, -2.931406, 0, 0, 0, 1, 1,
-1.295375, 0.6649321, -0.8119603, 1, 1, 1, 1, 1,
-1.292865, 1.22745, -1.303067, 1, 1, 1, 1, 1,
-1.288171, -0.04078094, -2.848844, 1, 1, 1, 1, 1,
-1.281626, -0.3399056, -1.532852, 1, 1, 1, 1, 1,
-1.281361, -0.1557278, -1.214548, 1, 1, 1, 1, 1,
-1.281325, -0.3069875, -2.886724, 1, 1, 1, 1, 1,
-1.276622, 0.04987124, -1.218339, 1, 1, 1, 1, 1,
-1.273923, -1.515547, -0.3594799, 1, 1, 1, 1, 1,
-1.26235, -1.222279, -3.536935, 1, 1, 1, 1, 1,
-1.260555, 1.428859, -0.7019283, 1, 1, 1, 1, 1,
-1.260006, 0.9333079, -0.9685555, 1, 1, 1, 1, 1,
-1.258809, -0.2996507, -2.256167, 1, 1, 1, 1, 1,
-1.258323, 0.447266, 0.5054633, 1, 1, 1, 1, 1,
-1.254347, 0.6157962, -1.971328, 1, 1, 1, 1, 1,
-1.247362, 1.035222, -0.9396086, 1, 1, 1, 1, 1,
-1.246876, -0.1028028, -0.8974059, 0, 0, 1, 1, 1,
-1.240345, 2.008003, -1.5839, 1, 0, 0, 1, 1,
-1.236231, -0.3661368, -3.3271, 1, 0, 0, 1, 1,
-1.222897, 0.4520937, -1.366179, 1, 0, 0, 1, 1,
-1.215896, -0.4182745, -2.297302, 1, 0, 0, 1, 1,
-1.214633, -1.962198, -1.953845, 1, 0, 0, 1, 1,
-1.209082, 0.3017756, -1.874681, 0, 0, 0, 1, 1,
-1.204092, 0.7783874, -0.3648322, 0, 0, 0, 1, 1,
-1.196121, -0.07462903, -1.225794, 0, 0, 0, 1, 1,
-1.1932, 0.8042115, -1.360868, 0, 0, 0, 1, 1,
-1.187374, 0.6421154, -0.6869755, 0, 0, 0, 1, 1,
-1.181221, -0.585774, -1.66513, 0, 0, 0, 1, 1,
-1.179049, 1.052634, -1.40771, 0, 0, 0, 1, 1,
-1.168557, 0.8034807, 0.9387008, 1, 1, 1, 1, 1,
-1.159544, -0.8052957, -3.234889, 1, 1, 1, 1, 1,
-1.153691, 0.5671487, -3.012849, 1, 1, 1, 1, 1,
-1.153579, 0.4766873, 0.1943173, 1, 1, 1, 1, 1,
-1.146536, -0.9340017, -2.302165, 1, 1, 1, 1, 1,
-1.145825, 0.07828097, -2.494231, 1, 1, 1, 1, 1,
-1.140638, 0.4634779, -1.615538, 1, 1, 1, 1, 1,
-1.140373, 0.1912729, -1.639661, 1, 1, 1, 1, 1,
-1.138626, -1.46016, -1.960912, 1, 1, 1, 1, 1,
-1.136152, 0.9373576, -0.9462014, 1, 1, 1, 1, 1,
-1.135153, 0.4823986, -1.575183, 1, 1, 1, 1, 1,
-1.134444, -1.536068, -1.976771, 1, 1, 1, 1, 1,
-1.134008, -0.4600237, -2.593024, 1, 1, 1, 1, 1,
-1.122421, 0.5703612, -1.143044, 1, 1, 1, 1, 1,
-1.120993, -1.095728, -1.145042, 1, 1, 1, 1, 1,
-1.109036, -0.2842682, -1.077432, 0, 0, 1, 1, 1,
-1.107875, -0.664614, -2.8432, 1, 0, 0, 1, 1,
-1.107779, -0.8585485, 0.1095508, 1, 0, 0, 1, 1,
-1.104386, -2.463256, -2.136615, 1, 0, 0, 1, 1,
-1.094777, 1.011441, 1.324008, 1, 0, 0, 1, 1,
-1.086791, -0.6613557, -0.9674632, 1, 0, 0, 1, 1,
-1.085829, -1.650281, -2.695327, 0, 0, 0, 1, 1,
-1.068572, 0.3214424, -2.189492, 0, 0, 0, 1, 1,
-1.066617, -1.320317, -2.669597, 0, 0, 0, 1, 1,
-1.062567, -0.7156211, -3.297621, 0, 0, 0, 1, 1,
-1.061936, 1.307122, 0.8087952, 0, 0, 0, 1, 1,
-1.060883, -0.03844808, -2.552736, 0, 0, 0, 1, 1,
-1.058569, -2.517041, -1.674703, 0, 0, 0, 1, 1,
-1.057422, 0.4020914, -0.3812701, 1, 1, 1, 1, 1,
-1.04735, -0.4623685, -1.972209, 1, 1, 1, 1, 1,
-1.04633, -0.2633402, -2.788665, 1, 1, 1, 1, 1,
-1.045558, 0.2095568, -3.045868, 1, 1, 1, 1, 1,
-1.043706, -0.1517999, -1.434584, 1, 1, 1, 1, 1,
-1.041151, 1.530831, -1.526199, 1, 1, 1, 1, 1,
-1.040889, -0.9589238, -0.2427904, 1, 1, 1, 1, 1,
-1.024354, -0.02853418, -2.139175, 1, 1, 1, 1, 1,
-1.022158, -0.9189254, -3.363894, 1, 1, 1, 1, 1,
-1.019121, 0.5840715, -2.023665, 1, 1, 1, 1, 1,
-1.017373, 1.536661, 0.5643919, 1, 1, 1, 1, 1,
-1.012408, 0.708195, -0.9577637, 1, 1, 1, 1, 1,
-1.012196, -1.151397, -2.647002, 1, 1, 1, 1, 1,
-0.9832006, -0.5164175, -2.00871, 1, 1, 1, 1, 1,
-0.9776813, -0.5467874, -1.875112, 1, 1, 1, 1, 1,
-0.9752707, -0.02292224, -0.298686, 0, 0, 1, 1, 1,
-0.9727065, 1.352364, -1.01465, 1, 0, 0, 1, 1,
-0.9716748, 0.2270815, -1.891612, 1, 0, 0, 1, 1,
-0.9693267, -0.3922589, -2.714146, 1, 0, 0, 1, 1,
-0.9649034, 0.06881215, -1.578623, 1, 0, 0, 1, 1,
-0.9636559, 0.206806, -1.265404, 1, 0, 0, 1, 1,
-0.959609, -0.8847033, -3.217982, 0, 0, 0, 1, 1,
-0.9589984, 0.3123733, -1.119217, 0, 0, 0, 1, 1,
-0.9540267, 0.6068885, -2.339391, 0, 0, 0, 1, 1,
-0.9492766, 1.658032, 1.586053, 0, 0, 0, 1, 1,
-0.9490145, 0.953748, -0.1085785, 0, 0, 0, 1, 1,
-0.9329382, -0.06697652, -1.550123, 0, 0, 0, 1, 1,
-0.9239604, -0.05493212, -0.9743239, 0, 0, 0, 1, 1,
-0.9200405, 1.763588, -1.150316, 1, 1, 1, 1, 1,
-0.915264, 0.2797767, -1.319535, 1, 1, 1, 1, 1,
-0.9131179, 0.475608, -0.7820149, 1, 1, 1, 1, 1,
-0.9130493, -0.2173759, -3.659387, 1, 1, 1, 1, 1,
-0.8946758, -1.361692, -2.740782, 1, 1, 1, 1, 1,
-0.8892667, 0.4202963, -1.81603, 1, 1, 1, 1, 1,
-0.8881456, 0.4099633, -0.6118847, 1, 1, 1, 1, 1,
-0.8792955, -0.209077, -2.373465, 1, 1, 1, 1, 1,
-0.8748097, -0.4342496, -1.011958, 1, 1, 1, 1, 1,
-0.8734765, 0.9300734, -0.4837418, 1, 1, 1, 1, 1,
-0.8618221, 0.9262161, -1.552497, 1, 1, 1, 1, 1,
-0.8600495, 0.6016026, 0.149162, 1, 1, 1, 1, 1,
-0.8568686, -0.9706114, -1.974599, 1, 1, 1, 1, 1,
-0.8566324, -0.1640723, -1.14893, 1, 1, 1, 1, 1,
-0.8524058, -0.6389603, -5.177499, 1, 1, 1, 1, 1,
-0.8481584, -0.131395, 0.09367754, 0, 0, 1, 1, 1,
-0.8478547, 0.8245012, -1.807055, 1, 0, 0, 1, 1,
-0.8299453, 1.743268, 1.41384, 1, 0, 0, 1, 1,
-0.8275766, 0.2810165, -2.695556, 1, 0, 0, 1, 1,
-0.8228701, 0.8055769, -2.141405, 1, 0, 0, 1, 1,
-0.8207339, -0.5818623, -1.315699, 1, 0, 0, 1, 1,
-0.8201286, -0.03330061, -1.687994, 0, 0, 0, 1, 1,
-0.8172587, 1.621075, -2.077734, 0, 0, 0, 1, 1,
-0.813854, -1.557855, -4.554414, 0, 0, 0, 1, 1,
-0.8077679, -0.06065706, -3.204662, 0, 0, 0, 1, 1,
-0.8050072, 1.730616, -1.606376, 0, 0, 0, 1, 1,
-0.8027974, 1.04554, -1.120137, 0, 0, 0, 1, 1,
-0.799858, -0.1568232, -1.480006, 0, 0, 0, 1, 1,
-0.7995512, -0.5294158, -1.086238, 1, 1, 1, 1, 1,
-0.787926, 0.6356429, -0.5306833, 1, 1, 1, 1, 1,
-0.7872214, 0.8544099, 0.7677663, 1, 1, 1, 1, 1,
-0.7840008, -1.727177, -4.863135, 1, 1, 1, 1, 1,
-0.781887, 0.3508477, -0.4916356, 1, 1, 1, 1, 1,
-0.7758417, 0.4300592, -0.4913819, 1, 1, 1, 1, 1,
-0.7731768, 1.686822, -0.6645288, 1, 1, 1, 1, 1,
-0.771978, 0.2906403, -1.236045, 1, 1, 1, 1, 1,
-0.769864, -0.04098403, -1.622012, 1, 1, 1, 1, 1,
-0.7672476, 1.34632, -0.8555405, 1, 1, 1, 1, 1,
-0.7611582, -1.411125, -1.742766, 1, 1, 1, 1, 1,
-0.7584652, 0.2065977, -1.003628, 1, 1, 1, 1, 1,
-0.7550415, -1.332086, -4.371354, 1, 1, 1, 1, 1,
-0.7549441, 1.342617, -1.780951, 1, 1, 1, 1, 1,
-0.7531108, -1.180113, -2.291911, 1, 1, 1, 1, 1,
-0.7503744, 0.5723607, 0.704052, 0, 0, 1, 1, 1,
-0.7490154, -1.192474, -1.289412, 1, 0, 0, 1, 1,
-0.7485844, -0.3143927, -2.98868, 1, 0, 0, 1, 1,
-0.7485347, -0.3288012, -2.46763, 1, 0, 0, 1, 1,
-0.748141, 0.8100317, -1.02248, 1, 0, 0, 1, 1,
-0.7430333, 0.4833941, -2.066149, 1, 0, 0, 1, 1,
-0.7427447, 0.4712468, -2.758721, 0, 0, 0, 1, 1,
-0.7365927, -0.5908149, -2.604722, 0, 0, 0, 1, 1,
-0.7353553, 1.356089, 0.03799371, 0, 0, 0, 1, 1,
-0.7338896, 0.4666589, -0.453169, 0, 0, 0, 1, 1,
-0.7308317, 1.457611, -1.491575, 0, 0, 0, 1, 1,
-0.7281747, -1.193317, -2.834028, 0, 0, 0, 1, 1,
-0.7236788, -1.122987, -4.605228, 0, 0, 0, 1, 1,
-0.7223036, 0.8508844, -0.4959236, 1, 1, 1, 1, 1,
-0.7208535, -0.1102007, -1.964733, 1, 1, 1, 1, 1,
-0.7185748, -0.7763733, -0.3253117, 1, 1, 1, 1, 1,
-0.7172888, 0.03138768, 0.0413209, 1, 1, 1, 1, 1,
-0.7160698, -0.4242896, -1.208177, 1, 1, 1, 1, 1,
-0.713341, 0.3000067, -1.632129, 1, 1, 1, 1, 1,
-0.7037241, -0.8360661, -3.235777, 1, 1, 1, 1, 1,
-0.7025035, -0.93041, -0.4544035, 1, 1, 1, 1, 1,
-0.7013874, -1.206645, -1.472778, 1, 1, 1, 1, 1,
-0.7010674, 0.5385588, -1.56503, 1, 1, 1, 1, 1,
-0.7009026, 0.4866615, -0.855105, 1, 1, 1, 1, 1,
-0.7007881, 0.8091145, -0.7518678, 1, 1, 1, 1, 1,
-0.6974137, 1.187442, 0.3278843, 1, 1, 1, 1, 1,
-0.6947613, 1.739412, 0.6737947, 1, 1, 1, 1, 1,
-0.692237, 0.2337351, -2.398305, 1, 1, 1, 1, 1,
-0.682584, -0.2297636, -3.211446, 0, 0, 1, 1, 1,
-0.682237, 1.474203, -0.4114918, 1, 0, 0, 1, 1,
-0.6812734, 0.560483, -2.597979, 1, 0, 0, 1, 1,
-0.678887, 0.7415509, 0.3813158, 1, 0, 0, 1, 1,
-0.6750725, 1.459802, -0.6555279, 1, 0, 0, 1, 1,
-0.6725348, 2.100924, 0.02879573, 1, 0, 0, 1, 1,
-0.6706706, -1.609748, -1.504806, 0, 0, 0, 1, 1,
-0.6656774, -1.567415, -2.729511, 0, 0, 0, 1, 1,
-0.6642887, 0.07015144, -0.633733, 0, 0, 0, 1, 1,
-0.6639993, 0.1379514, -4.92835, 0, 0, 0, 1, 1,
-0.6553169, -0.4575968, -1.905167, 0, 0, 0, 1, 1,
-0.6499237, 0.4305113, -0.8921467, 0, 0, 0, 1, 1,
-0.6374417, 0.01093983, -1.255285, 0, 0, 0, 1, 1,
-0.6343228, -0.6676099, -2.857138, 1, 1, 1, 1, 1,
-0.6269584, -1.621501, -4.89016, 1, 1, 1, 1, 1,
-0.6260914, -1.372623, -1.918622, 1, 1, 1, 1, 1,
-0.6248188, -0.04864227, -1.646231, 1, 1, 1, 1, 1,
-0.6248112, 1.465094, -0.6503174, 1, 1, 1, 1, 1,
-0.6212777, 0.1735428, -1.891711, 1, 1, 1, 1, 1,
-0.6190429, -0.75964, -2.209051, 1, 1, 1, 1, 1,
-0.618466, 2.708795, -0.703613, 1, 1, 1, 1, 1,
-0.6166255, -0.9670266, -3.862584, 1, 1, 1, 1, 1,
-0.6153808, 0.579895, -1.490631, 1, 1, 1, 1, 1,
-0.6135185, 1.118642, 0.2595737, 1, 1, 1, 1, 1,
-0.6130302, 0.5845639, -0.4177524, 1, 1, 1, 1, 1,
-0.6110092, 0.3207084, -2.376754, 1, 1, 1, 1, 1,
-0.6027949, -0.3742424, -2.093971, 1, 1, 1, 1, 1,
-0.6008298, 0.6229914, 0.02612003, 1, 1, 1, 1, 1,
-0.6007271, -0.01118343, -2.036213, 0, 0, 1, 1, 1,
-0.5992968, -0.8652761, -1.922728, 1, 0, 0, 1, 1,
-0.5986772, 0.1414013, -3.484663, 1, 0, 0, 1, 1,
-0.5974218, -0.2767696, -0.9768505, 1, 0, 0, 1, 1,
-0.5968451, -1.552682, -2.107886, 1, 0, 0, 1, 1,
-0.5935009, -2.854798, -2.365188, 1, 0, 0, 1, 1,
-0.5844817, -1.773845, -2.069966, 0, 0, 0, 1, 1,
-0.5803835, 0.1004065, -0.1792111, 0, 0, 0, 1, 1,
-0.5797157, -1.401899, -3.012262, 0, 0, 0, 1, 1,
-0.5775621, 0.7260501, -0.8713599, 0, 0, 0, 1, 1,
-0.5775492, -0.8268753, -1.666107, 0, 0, 0, 1, 1,
-0.5754751, -0.0736153, -1.628907, 0, 0, 0, 1, 1,
-0.5750639, -0.9081278, -3.202971, 0, 0, 0, 1, 1,
-0.5729088, 0.5757141, -1.692514, 1, 1, 1, 1, 1,
-0.5676746, 1.13473, 0.05034499, 1, 1, 1, 1, 1,
-0.5625533, -0.3848063, -2.70934, 1, 1, 1, 1, 1,
-0.5610346, -0.4360154, -2.397944, 1, 1, 1, 1, 1,
-0.5585569, -1.731764, -1.460316, 1, 1, 1, 1, 1,
-0.5584097, 0.8089108, -1.096655, 1, 1, 1, 1, 1,
-0.5569886, -0.7390354, -4.22314, 1, 1, 1, 1, 1,
-0.5564561, -0.7342528, -2.158078, 1, 1, 1, 1, 1,
-0.5561981, 0.2892282, -1.5099, 1, 1, 1, 1, 1,
-0.5546796, -0.5955274, -2.355045, 1, 1, 1, 1, 1,
-0.5516925, 0.7873365, -1.256189, 1, 1, 1, 1, 1,
-0.5512488, 0.1893342, -1.230519, 1, 1, 1, 1, 1,
-0.5477583, 0.8458886, 2.239665, 1, 1, 1, 1, 1,
-0.5470329, 2.2239, -0.8760142, 1, 1, 1, 1, 1,
-0.5459993, 1.04341, -1.799546, 1, 1, 1, 1, 1,
-0.5442485, -1.023898, -2.665895, 0, 0, 1, 1, 1,
-0.5432542, 2.232199, -0.7670636, 1, 0, 0, 1, 1,
-0.5419839, -0.9616215, -2.987614, 1, 0, 0, 1, 1,
-0.5409508, -1.326133, -3.599344, 1, 0, 0, 1, 1,
-0.537982, 0.1719578, -1.712596, 1, 0, 0, 1, 1,
-0.5376719, 3.052575, 2.547187, 1, 0, 0, 1, 1,
-0.5359247, -1.243441, -3.332579, 0, 0, 0, 1, 1,
-0.5352455, -0.2831074, -2.007301, 0, 0, 0, 1, 1,
-0.5339313, -0.5100733, -2.419912, 0, 0, 0, 1, 1,
-0.530553, 1.019933, -1.768247, 0, 0, 0, 1, 1,
-0.5286061, -1.299048, -1.846364, 0, 0, 0, 1, 1,
-0.5249661, -0.9051748, -3.159457, 0, 0, 0, 1, 1,
-0.5191236, -1.117072, -4.570845, 0, 0, 0, 1, 1,
-0.5189828, 0.8282796, -1.324493, 1, 1, 1, 1, 1,
-0.5158253, -0.7225655, -2.493796, 1, 1, 1, 1, 1,
-0.5138046, 0.5942753, -2.211348, 1, 1, 1, 1, 1,
-0.5097749, -1.623854, -4.060206, 1, 1, 1, 1, 1,
-0.5009708, 0.477064, -0.6508492, 1, 1, 1, 1, 1,
-0.4981702, 0.6798736, -1.217717, 1, 1, 1, 1, 1,
-0.4944863, -1.250975, -3.674636, 1, 1, 1, 1, 1,
-0.4935209, -1.203727, -2.224229, 1, 1, 1, 1, 1,
-0.4849055, -1.617792, -1.235784, 1, 1, 1, 1, 1,
-0.483514, 0.8794683, -1.311148, 1, 1, 1, 1, 1,
-0.4802234, 1.33603, -1.523644, 1, 1, 1, 1, 1,
-0.4760614, 1.547362, -0.3861759, 1, 1, 1, 1, 1,
-0.4710519, -0.3260174, -3.776031, 1, 1, 1, 1, 1,
-0.4658516, -0.2619456, -0.7779013, 1, 1, 1, 1, 1,
-0.4654245, 0.265788, 0.4805293, 1, 1, 1, 1, 1,
-0.4647088, -0.3939112, -1.224145, 0, 0, 1, 1, 1,
-0.4638891, -0.01459874, 0.09220037, 1, 0, 0, 1, 1,
-0.4637547, 1.186914, 0.5502905, 1, 0, 0, 1, 1,
-0.4457849, 0.8897517, -1.426092, 1, 0, 0, 1, 1,
-0.4410125, -0.4047111, -1.026483, 1, 0, 0, 1, 1,
-0.4379475, 1.018431, 0.7761844, 1, 0, 0, 1, 1,
-0.4376189, -0.03391523, -2.04582, 0, 0, 0, 1, 1,
-0.4365866, -1.694784, -4.094502, 0, 0, 0, 1, 1,
-0.4363179, 0.6805723, 1.448776, 0, 0, 0, 1, 1,
-0.4328305, -0.8954208, -4.318875, 0, 0, 0, 1, 1,
-0.4313163, -0.9214281, -2.616793, 0, 0, 0, 1, 1,
-0.426139, 0.1476398, -0.8306345, 0, 0, 0, 1, 1,
-0.4253482, 0.8612419, 0.8225061, 0, 0, 0, 1, 1,
-0.4127935, 1.349682, -1.362349, 1, 1, 1, 1, 1,
-0.4124162, 0.09187761, -2.438661, 1, 1, 1, 1, 1,
-0.4046745, -2.32892, -4.469486, 1, 1, 1, 1, 1,
-0.403991, -0.07153969, -1.606451, 1, 1, 1, 1, 1,
-0.4035137, 0.698495, -0.1678828, 1, 1, 1, 1, 1,
-0.4024504, 0.4567433, 0.2900471, 1, 1, 1, 1, 1,
-0.3952497, 0.01684095, -1.449269, 1, 1, 1, 1, 1,
-0.3916654, -1.240204, -2.03828, 1, 1, 1, 1, 1,
-0.3855408, 0.8552215, 0.2791788, 1, 1, 1, 1, 1,
-0.3835822, 0.9344373, 0.17296, 1, 1, 1, 1, 1,
-0.3774588, 2.282751, -0.2547925, 1, 1, 1, 1, 1,
-0.3769521, 1.523991, -0.9838653, 1, 1, 1, 1, 1,
-0.3742641, -1.058228, -3.746552, 1, 1, 1, 1, 1,
-0.3738751, 1.516103, -1.536714, 1, 1, 1, 1, 1,
-0.3716763, 0.6045773, -0.4379412, 1, 1, 1, 1, 1,
-0.3687295, 0.6331013, 0.409977, 0, 0, 1, 1, 1,
-0.3570169, 0.8647354, 1.313209, 1, 0, 0, 1, 1,
-0.3523885, -0.6405959, -2.979354, 1, 0, 0, 1, 1,
-0.3517085, -1.3622, -2.118814, 1, 0, 0, 1, 1,
-0.3485253, -1.083606, -3.134198, 1, 0, 0, 1, 1,
-0.3481182, 0.1428582, -0.3614057, 1, 0, 0, 1, 1,
-0.3471185, -0.3323386, -3.06097, 0, 0, 0, 1, 1,
-0.3459025, 1.092387, 0.9504613, 0, 0, 0, 1, 1,
-0.3431546, -1.709965, -3.757386, 0, 0, 0, 1, 1,
-0.3430391, -1.849322, -2.2687, 0, 0, 0, 1, 1,
-0.3307151, 0.3516751, -2.185856, 0, 0, 0, 1, 1,
-0.3296427, -1.482026, -2.05717, 0, 0, 0, 1, 1,
-0.3287221, 0.5830536, -0.5480485, 0, 0, 0, 1, 1,
-0.3254968, -0.37432, -2.507483, 1, 1, 1, 1, 1,
-0.3217552, -0.1315614, -1.797363, 1, 1, 1, 1, 1,
-0.3214184, -1.926712, -2.915369, 1, 1, 1, 1, 1,
-0.319919, 0.1194136, -1.167365, 1, 1, 1, 1, 1,
-0.3156002, -0.7581795, -3.686873, 1, 1, 1, 1, 1,
-0.3155434, -0.3688504, -1.122791, 1, 1, 1, 1, 1,
-0.3097021, 0.1612212, -0.266026, 1, 1, 1, 1, 1,
-0.3081652, -0.006667047, -1.441806, 1, 1, 1, 1, 1,
-0.3074533, 0.5913286, 0.6727134, 1, 1, 1, 1, 1,
-0.2943797, -0.04395419, -2.577623, 1, 1, 1, 1, 1,
-0.2942989, 1.076837, -0.6059753, 1, 1, 1, 1, 1,
-0.2933591, -0.2742117, -2.393041, 1, 1, 1, 1, 1,
-0.2911485, 0.1267048, -1.999936, 1, 1, 1, 1, 1,
-0.28873, 0.2924813, -0.1546241, 1, 1, 1, 1, 1,
-0.2869666, -0.8843251, -4.057854, 1, 1, 1, 1, 1,
-0.2861578, 1.135968, 0.3571227, 0, 0, 1, 1, 1,
-0.2831356, 0.6387791, -0.9964554, 1, 0, 0, 1, 1,
-0.2803269, 0.4887576, -1.870908, 1, 0, 0, 1, 1,
-0.2795962, -1.047975, -3.20714, 1, 0, 0, 1, 1,
-0.2760532, 1.722011, -0.4165695, 1, 0, 0, 1, 1,
-0.2752681, 0.486048, -0.3143754, 1, 0, 0, 1, 1,
-0.2735795, 0.02281477, -1.989279, 0, 0, 0, 1, 1,
-0.2729115, -0.4241713, -1.226727, 0, 0, 0, 1, 1,
-0.2712468, -0.3284824, -0.9813391, 0, 0, 0, 1, 1,
-0.2683556, -0.06444851, -2.147304, 0, 0, 0, 1, 1,
-0.2663655, -0.2116979, -2.23164, 0, 0, 0, 1, 1,
-0.2654188, 0.7923783, 0.3872827, 0, 0, 0, 1, 1,
-0.2619252, 0.8108846, -0.2195665, 0, 0, 0, 1, 1,
-0.2610019, 0.6947017, -0.09435824, 1, 1, 1, 1, 1,
-0.2607722, -0.5056294, -2.555856, 1, 1, 1, 1, 1,
-0.2572301, -0.3641019, -3.179266, 1, 1, 1, 1, 1,
-0.2556356, -0.6379746, -2.80628, 1, 1, 1, 1, 1,
-0.2511386, -0.4913189, -3.841648, 1, 1, 1, 1, 1,
-0.2499358, -0.3849426, -5.265841, 1, 1, 1, 1, 1,
-0.249918, 0.9994845, -0.9231899, 1, 1, 1, 1, 1,
-0.2490258, -0.9231117, -2.561372, 1, 1, 1, 1, 1,
-0.2487435, -0.5757368, -3.048183, 1, 1, 1, 1, 1,
-0.2467118, -2.168081, -4.208713, 1, 1, 1, 1, 1,
-0.2452507, -0.02999021, -1.548653, 1, 1, 1, 1, 1,
-0.2431274, 0.5585896, -0.7719606, 1, 1, 1, 1, 1,
-0.2409183, 0.03220309, -0.8044041, 1, 1, 1, 1, 1,
-0.2398096, -1.206688, -3.775618, 1, 1, 1, 1, 1,
-0.2366688, 0.04434996, -2.267468, 1, 1, 1, 1, 1,
-0.2311651, 1.118132, 0.07517702, 0, 0, 1, 1, 1,
-0.2299609, 1.680336, 1.469396, 1, 0, 0, 1, 1,
-0.2236949, 0.4261971, -0.6930262, 1, 0, 0, 1, 1,
-0.2224533, -2.019944, -3.548604, 1, 0, 0, 1, 1,
-0.2202848, -0.7522337, -1.797629, 1, 0, 0, 1, 1,
-0.2197768, -1.867939, -2.248305, 1, 0, 0, 1, 1,
-0.2196302, -0.3381408, -2.364947, 0, 0, 0, 1, 1,
-0.2173549, -1.692411, -4.443039, 0, 0, 0, 1, 1,
-0.2172381, 0.2576173, 1.078523, 0, 0, 0, 1, 1,
-0.2116614, 1.502892, 0.4807569, 0, 0, 0, 1, 1,
-0.2113085, -0.03494596, -1.770597, 0, 0, 0, 1, 1,
-0.2082313, -0.08861662, -1.202983, 0, 0, 0, 1, 1,
-0.2082266, -0.9435591, -1.656704, 0, 0, 0, 1, 1,
-0.2035095, 0.4115373, 2.011278, 1, 1, 1, 1, 1,
-0.2016107, 1.642021, -1.101217, 1, 1, 1, 1, 1,
-0.1999195, 0.08168636, -1.298864, 1, 1, 1, 1, 1,
-0.199761, 0.1901961, -1.498504, 1, 1, 1, 1, 1,
-0.1995595, -0.3354487, -1.743497, 1, 1, 1, 1, 1,
-0.194814, 0.7180208, -1.157741, 1, 1, 1, 1, 1,
-0.1920185, 1.568989, -0.6903973, 1, 1, 1, 1, 1,
-0.1863538, -0.8921294, -3.642759, 1, 1, 1, 1, 1,
-0.184984, -0.3717129, -2.159013, 1, 1, 1, 1, 1,
-0.1827612, 0.6853927, -1.262283, 1, 1, 1, 1, 1,
-0.1826642, 0.3549399, -1.375038, 1, 1, 1, 1, 1,
-0.1771736, 1.139768, -1.285172, 1, 1, 1, 1, 1,
-0.1760564, 0.7395378, 1.104913, 1, 1, 1, 1, 1,
-0.1711169, 0.03781424, -0.0001951094, 1, 1, 1, 1, 1,
-0.1691154, 0.7490957, -0.5574152, 1, 1, 1, 1, 1,
-0.1679558, -0.4328076, -1.770215, 0, 0, 1, 1, 1,
-0.1673916, 0.7907034, 1.754154, 1, 0, 0, 1, 1,
-0.1660312, -0.9428936, -3.080414, 1, 0, 0, 1, 1,
-0.1639441, -1.960212, -3.050444, 1, 0, 0, 1, 1,
-0.1619344, 0.932584, 0.4159975, 1, 0, 0, 1, 1,
-0.1606018, -0.8022979, -1.972952, 1, 0, 0, 1, 1,
-0.1597998, -0.09556555, -1.75613, 0, 0, 0, 1, 1,
-0.1593378, -1.572716, -3.121571, 0, 0, 0, 1, 1,
-0.1587752, 0.7099091, -0.1113421, 0, 0, 0, 1, 1,
-0.1572328, -0.1457843, -4.05281, 0, 0, 0, 1, 1,
-0.1499012, -2.835651, -3.602515, 0, 0, 0, 1, 1,
-0.1486104, 2.715982, -0.6207561, 0, 0, 0, 1, 1,
-0.1460302, -0.2804441, -3.464133, 0, 0, 0, 1, 1,
-0.1442519, -0.9451734, -1.671861, 1, 1, 1, 1, 1,
-0.1440959, -0.9524169, -2.243154, 1, 1, 1, 1, 1,
-0.1408949, -0.5201131, -2.33695, 1, 1, 1, 1, 1,
-0.1364195, 0.7797052, -0.733035, 1, 1, 1, 1, 1,
-0.1340208, -0.447765, -2.270222, 1, 1, 1, 1, 1,
-0.1310219, -1.961504, -2.832584, 1, 1, 1, 1, 1,
-0.1255983, -1.415545, -4.172171, 1, 1, 1, 1, 1,
-0.1230819, -0.6825385, -2.398068, 1, 1, 1, 1, 1,
-0.1225515, 0.2343817, -0.2163603, 1, 1, 1, 1, 1,
-0.1211551, -0.4685879, -4.088186, 1, 1, 1, 1, 1,
-0.1066678, -0.9265684, -0.9755439, 1, 1, 1, 1, 1,
-0.1040195, 0.3147053, -1.569716, 1, 1, 1, 1, 1,
-0.1032853, -0.2894319, -3.365939, 1, 1, 1, 1, 1,
-0.1013654, -1.41954, -2.152127, 1, 1, 1, 1, 1,
-0.09846342, 0.705328, -0.9893306, 1, 1, 1, 1, 1,
-0.0967235, 1.273739, -1.289249, 0, 0, 1, 1, 1,
-0.0955015, -0.5530028, -4.27686, 1, 0, 0, 1, 1,
-0.09351666, 0.2851971, -2.56828, 1, 0, 0, 1, 1,
-0.08675621, -0.5844813, -2.5411, 1, 0, 0, 1, 1,
-0.08387422, -0.7075818, -3.594991, 1, 0, 0, 1, 1,
-0.07388479, -0.6859652, -2.600879, 1, 0, 0, 1, 1,
-0.07221839, -0.2155553, -2.825271, 0, 0, 0, 1, 1,
-0.06449615, -2.454932, -3.915682, 0, 0, 0, 1, 1,
-0.06407821, 0.06763892, -1.026269, 0, 0, 0, 1, 1,
-0.06123986, 0.8821209, 0.3894616, 0, 0, 0, 1, 1,
-0.06039365, 1.284352, 0.4271504, 0, 0, 0, 1, 1,
-0.05791103, -1.358582, -1.95705, 0, 0, 0, 1, 1,
-0.05772049, -0.3926771, -2.438978, 0, 0, 0, 1, 1,
-0.05735063, -1.464657, -3.307581, 1, 1, 1, 1, 1,
-0.05283827, -0.03625304, -2.696502, 1, 1, 1, 1, 1,
-0.05109495, 0.5124702, 0.4163887, 1, 1, 1, 1, 1,
-0.04952975, 1.232056, 0.5403345, 1, 1, 1, 1, 1,
-0.0492241, -0.495439, -1.975089, 1, 1, 1, 1, 1,
-0.04518782, -0.317095, -3.129211, 1, 1, 1, 1, 1,
-0.04093482, 1.462374, 0.1808952, 1, 1, 1, 1, 1,
-0.04034662, 2.230501, 0.5518137, 1, 1, 1, 1, 1,
-0.0386476, 1.043682, -1.236136, 1, 1, 1, 1, 1,
-0.03660126, -1.006802, -3.655255, 1, 1, 1, 1, 1,
-0.03332736, 2.034867, -0.8860546, 1, 1, 1, 1, 1,
-0.03253875, -0.3052401, -3.32371, 1, 1, 1, 1, 1,
-0.03003775, -1.169587, -2.923666, 1, 1, 1, 1, 1,
-0.02140492, 1.131556, 0.1767458, 1, 1, 1, 1, 1,
-0.02021291, 0.6619503, 0.08851004, 1, 1, 1, 1, 1,
-0.0146873, 0.7691581, -1.118847, 0, 0, 1, 1, 1,
-0.01384815, -0.8490787, -3.121162, 1, 0, 0, 1, 1,
-0.01275736, -1.505174, -3.450029, 1, 0, 0, 1, 1,
-0.01014314, -0.5681704, -2.848879, 1, 0, 0, 1, 1,
-0.008725142, 1.035418, 0.7467936, 1, 0, 0, 1, 1,
-0.005417509, -0.2772388, -4.047713, 1, 0, 0, 1, 1,
-0.0008131787, 0.4033057, 1.588844, 0, 0, 0, 1, 1,
0.0002857423, 0.1166769, 3.505194, 0, 0, 0, 1, 1,
0.001287125, 0.2238365, -0.8180763, 0, 0, 0, 1, 1,
0.00538556, -0.1486269, 4.111677, 0, 0, 0, 1, 1,
0.006506977, -0.4244649, 3.008237, 0, 0, 0, 1, 1,
0.008286109, -0.2037576, 3.537178, 0, 0, 0, 1, 1,
0.009072733, -0.4509289, 2.46062, 0, 0, 0, 1, 1,
0.01121014, 0.8240969, 0.389091, 1, 1, 1, 1, 1,
0.01505726, -1.546648, 3.613462, 1, 1, 1, 1, 1,
0.01825364, -1.153921, 4.073805, 1, 1, 1, 1, 1,
0.02210126, -1.978209, 3.914128, 1, 1, 1, 1, 1,
0.02571117, -1.094328, 2.318459, 1, 1, 1, 1, 1,
0.02904722, 1.487386, 2.386768, 1, 1, 1, 1, 1,
0.04405976, 0.6406356, -0.9888968, 1, 1, 1, 1, 1,
0.04882288, 0.1049137, 0.5621927, 1, 1, 1, 1, 1,
0.04946192, -0.2988095, 4.478922, 1, 1, 1, 1, 1,
0.04971906, 0.8458173, -0.9908345, 1, 1, 1, 1, 1,
0.05011787, 0.8610155, -0.7753919, 1, 1, 1, 1, 1,
0.05501451, -0.85038, 2.031856, 1, 1, 1, 1, 1,
0.05551914, -0.2558731, 2.705047, 1, 1, 1, 1, 1,
0.05624199, 0.6097419, 0.5153822, 1, 1, 1, 1, 1,
0.05684205, -1.928687, 3.718815, 1, 1, 1, 1, 1,
0.060706, -0.314549, 3.856477, 0, 0, 1, 1, 1,
0.06076182, 0.1878615, 1.265794, 1, 0, 0, 1, 1,
0.06099953, 0.7376683, -0.2995346, 1, 0, 0, 1, 1,
0.06276243, -1.884234, 2.975472, 1, 0, 0, 1, 1,
0.06293594, 1.858972, 0.3087799, 1, 0, 0, 1, 1,
0.06316464, -0.5728862, 2.632545, 1, 0, 0, 1, 1,
0.06422096, -1.066642, 3.770264, 0, 0, 0, 1, 1,
0.06454674, 0.8721358, 1.645863, 0, 0, 0, 1, 1,
0.06673915, -0.2811775, 4.579471, 0, 0, 0, 1, 1,
0.06818572, 1.921007, -0.4911001, 0, 0, 0, 1, 1,
0.06820091, 1.832393, 0.3474604, 0, 0, 0, 1, 1,
0.06915557, -0.23963, 1.881565, 0, 0, 0, 1, 1,
0.06977873, -0.118989, 3.092897, 0, 0, 0, 1, 1,
0.0708768, 1.036206, 2.032082, 1, 1, 1, 1, 1,
0.07131172, -2.826673, 2.927929, 1, 1, 1, 1, 1,
0.07807433, 0.07102481, 1.641018, 1, 1, 1, 1, 1,
0.08413936, 0.5366579, -0.06947609, 1, 1, 1, 1, 1,
0.08493876, -0.2352276, 2.634526, 1, 1, 1, 1, 1,
0.09438211, -0.02558293, 1.881791, 1, 1, 1, 1, 1,
0.09660979, 0.7022167, 1.012968, 1, 1, 1, 1, 1,
0.09667609, 0.4822068, 0.03185256, 1, 1, 1, 1, 1,
0.09816711, -0.2127318, 1.544655, 1, 1, 1, 1, 1,
0.09874648, 0.2470749, 0.9369135, 1, 1, 1, 1, 1,
0.1055019, -1.199202, 3.838642, 1, 1, 1, 1, 1,
0.1066508, -1.278745, 2.713509, 1, 1, 1, 1, 1,
0.1076851, -0.8693653, 4.010304, 1, 1, 1, 1, 1,
0.1115867, 1.498936, 2.263235, 1, 1, 1, 1, 1,
0.11731, -0.2835088, 2.206608, 1, 1, 1, 1, 1,
0.1243679, -1.418227, 2.926689, 0, 0, 1, 1, 1,
0.126172, 0.8512635, -0.4492025, 1, 0, 0, 1, 1,
0.1321314, 1.717885, -0.4477337, 1, 0, 0, 1, 1,
0.1334754, 0.06918073, 1.865557, 1, 0, 0, 1, 1,
0.1386921, -1.938308, 4.593507, 1, 0, 0, 1, 1,
0.139025, 1.539368, -1.477489, 1, 0, 0, 1, 1,
0.1395067, 0.9985516, -0.213444, 0, 0, 0, 1, 1,
0.1404685, 1.080622, -1.143655, 0, 0, 0, 1, 1,
0.1443564, -0.4686291, 3.43093, 0, 0, 0, 1, 1,
0.1496004, -1.973133, 4.100923, 0, 0, 0, 1, 1,
0.1515725, -0.7841247, 2.376566, 0, 0, 0, 1, 1,
0.1559707, -0.495134, 3.345335, 0, 0, 0, 1, 1,
0.1626051, -0.02058184, 1.896148, 0, 0, 0, 1, 1,
0.1639564, 0.4023687, 0.8581675, 1, 1, 1, 1, 1,
0.1685511, 1.751073, 1.713521, 1, 1, 1, 1, 1,
0.1712089, 0.3751279, 1.759254, 1, 1, 1, 1, 1,
0.1717751, 1.504829, -0.1091138, 1, 1, 1, 1, 1,
0.173682, -1.305697, 3.215546, 1, 1, 1, 1, 1,
0.1751875, -0.2614959, 1.040501, 1, 1, 1, 1, 1,
0.175308, 0.2462718, 2.104096, 1, 1, 1, 1, 1,
0.1776928, -0.2969121, 1.592003, 1, 1, 1, 1, 1,
0.1780159, -0.003430468, 2.413972, 1, 1, 1, 1, 1,
0.178985, -0.7416602, 1.223382, 1, 1, 1, 1, 1,
0.1821318, 0.8704333, 0.06258348, 1, 1, 1, 1, 1,
0.1839323, 0.001432455, 1.467261, 1, 1, 1, 1, 1,
0.189857, -0.09849169, 2.206614, 1, 1, 1, 1, 1,
0.1964041, -0.1720075, 2.913212, 1, 1, 1, 1, 1,
0.2001297, -2.25459, 2.96783, 1, 1, 1, 1, 1,
0.2026822, 0.8950667, -0.6072747, 0, 0, 1, 1, 1,
0.2027731, 1.389788, 0.2612266, 1, 0, 0, 1, 1,
0.2051979, -0.7931799, 3.28766, 1, 0, 0, 1, 1,
0.2059359, -0.9300135, 2.46395, 1, 0, 0, 1, 1,
0.2073163, -0.1116953, 2.148689, 1, 0, 0, 1, 1,
0.2147437, 1.890522, -0.1292037, 1, 0, 0, 1, 1,
0.2176098, -0.4339282, 2.809028, 0, 0, 0, 1, 1,
0.2183009, 1.371699, 1.781262, 0, 0, 0, 1, 1,
0.2233396, -0.05529429, 2.519239, 0, 0, 0, 1, 1,
0.2281894, 0.5470176, 0.5741273, 0, 0, 0, 1, 1,
0.2292396, 0.7631224, 0.001498168, 0, 0, 0, 1, 1,
0.2295607, 1.187386, -1.239668, 0, 0, 0, 1, 1,
0.2301012, -2.468457, 2.345188, 0, 0, 0, 1, 1,
0.2337931, -0.7857997, 1.971384, 1, 1, 1, 1, 1,
0.2344698, 1.247967, 0.1448508, 1, 1, 1, 1, 1,
0.2370137, 1.726383, 0.1507719, 1, 1, 1, 1, 1,
0.2449831, 0.9730636, -0.5239919, 1, 1, 1, 1, 1,
0.2451256, 0.1793195, 1.207296, 1, 1, 1, 1, 1,
0.2460566, -0.5193188, 3.125167, 1, 1, 1, 1, 1,
0.2461077, 0.09990497, 0.6556367, 1, 1, 1, 1, 1,
0.2477366, -0.4442669, 1.829621, 1, 1, 1, 1, 1,
0.2494982, 0.04128578, 2.526697, 1, 1, 1, 1, 1,
0.2532008, -1.35495, 2.993111, 1, 1, 1, 1, 1,
0.2576889, 0.7092673, 0.6774955, 1, 1, 1, 1, 1,
0.2594037, -0.8814388, 3.588374, 1, 1, 1, 1, 1,
0.2621448, -0.2205908, 1.143682, 1, 1, 1, 1, 1,
0.2638018, 0.8867114, -0.4469037, 1, 1, 1, 1, 1,
0.2689393, 1.267573, -2.798024, 1, 1, 1, 1, 1,
0.2699126, 1.565936, 0.8661723, 0, 0, 1, 1, 1,
0.2736745, -0.02029315, 1.744018, 1, 0, 0, 1, 1,
0.2769278, -1.015575, 1.847494, 1, 0, 0, 1, 1,
0.2797953, 0.3183579, 1.430929, 1, 0, 0, 1, 1,
0.2821258, -1.996487, 4.500661, 1, 0, 0, 1, 1,
0.2842734, 0.400817, 1.067589, 1, 0, 0, 1, 1,
0.2950802, 0.4546864, 0.4939162, 0, 0, 0, 1, 1,
0.295986, -0.8393509, 2.982965, 0, 0, 0, 1, 1,
0.2960332, 1.780892, -0.5741474, 0, 0, 0, 1, 1,
0.2960964, 1.642964, -0.3195191, 0, 0, 0, 1, 1,
0.2965971, -1.17967, 3.183783, 0, 0, 0, 1, 1,
0.2980413, -1.17827, 2.300713, 0, 0, 0, 1, 1,
0.3014104, 0.1905267, 3.587135, 0, 0, 0, 1, 1,
0.3036935, 0.8400509, -0.03851143, 1, 1, 1, 1, 1,
0.3055278, -0.2612103, 1.793663, 1, 1, 1, 1, 1,
0.3076569, -0.2738154, 1.384611, 1, 1, 1, 1, 1,
0.3087752, 1.844072, 1.551168, 1, 1, 1, 1, 1,
0.3140593, 0.5172796, -0.4676119, 1, 1, 1, 1, 1,
0.3173816, 0.01640762, 1.659617, 1, 1, 1, 1, 1,
0.3183081, -0.09696908, 1.37475, 1, 1, 1, 1, 1,
0.3202105, -0.3937537, 2.523668, 1, 1, 1, 1, 1,
0.3212585, -1.335069, 1.324348, 1, 1, 1, 1, 1,
0.3224814, -0.4491355, 1.232627, 1, 1, 1, 1, 1,
0.3256835, 0.3499255, 0.8406665, 1, 1, 1, 1, 1,
0.3282207, 1.54286, 0.5705215, 1, 1, 1, 1, 1,
0.3334614, 0.04730619, 0.9671553, 1, 1, 1, 1, 1,
0.3375964, 0.5209911, 0.8939361, 1, 1, 1, 1, 1,
0.3408583, -0.4231668, 2.351407, 1, 1, 1, 1, 1,
0.3421964, 0.1653077, -0.2411126, 0, 0, 1, 1, 1,
0.3427533, 1.019406, -1.700948, 1, 0, 0, 1, 1,
0.3429391, 1.384166, -1.672706, 1, 0, 0, 1, 1,
0.3446017, -1.805068, 2.306132, 1, 0, 0, 1, 1,
0.3488673, -0.6539435, 0.9928043, 1, 0, 0, 1, 1,
0.3491406, 1.9449, 2.291185, 1, 0, 0, 1, 1,
0.3500016, 1.319727, 1.457585, 0, 0, 0, 1, 1,
0.3516046, -1.578528, 3.058762, 0, 0, 0, 1, 1,
0.353324, -2.302296, 4.570489, 0, 0, 0, 1, 1,
0.3537037, 0.5494611, 0.5944591, 0, 0, 0, 1, 1,
0.3565118, 0.4489225, 1.070973, 0, 0, 0, 1, 1,
0.3574963, 1.496332, 1.230558, 0, 0, 0, 1, 1,
0.3628979, -0.4197314, 1.974585, 0, 0, 0, 1, 1,
0.3683425, 1.473434, 1.00999, 1, 1, 1, 1, 1,
0.3717455, 0.3316721, -0.08133186, 1, 1, 1, 1, 1,
0.3726925, -0.1975515, 1.579092, 1, 1, 1, 1, 1,
0.3760601, -0.2832376, 2.405393, 1, 1, 1, 1, 1,
0.3768141, -1.171957, 3.741035, 1, 1, 1, 1, 1,
0.3821502, -0.9789814, 2.351556, 1, 1, 1, 1, 1,
0.3833252, -0.6399519, 4.89712, 1, 1, 1, 1, 1,
0.3837827, -0.3508682, 3.007501, 1, 1, 1, 1, 1,
0.3864619, 1.086429, -0.3727762, 1, 1, 1, 1, 1,
0.3869878, 0.6633267, 1.157188, 1, 1, 1, 1, 1,
0.3886104, -0.3222678, 1.540569, 1, 1, 1, 1, 1,
0.3920717, -0.526927, 3.313627, 1, 1, 1, 1, 1,
0.3934727, -0.04101422, 1.392906, 1, 1, 1, 1, 1,
0.3958576, 1.919929, 1.571522, 1, 1, 1, 1, 1,
0.3971944, 0.9387703, 1.327398, 1, 1, 1, 1, 1,
0.3975297, -0.3825151, 2.584575, 0, 0, 1, 1, 1,
0.4021708, -0.4582709, 2.460636, 1, 0, 0, 1, 1,
0.40241, 1.18777, -0.6823211, 1, 0, 0, 1, 1,
0.4166818, -1.659278, 4.464064, 1, 0, 0, 1, 1,
0.4170508, -1.461705, 3.730682, 1, 0, 0, 1, 1,
0.4210663, 0.04782212, 0.4531769, 1, 0, 0, 1, 1,
0.4273823, 1.73312, 1.826729, 0, 0, 0, 1, 1,
0.4305041, 0.1492727, 0.1106063, 0, 0, 0, 1, 1,
0.4321725, -0.08040243, 2.188099, 0, 0, 0, 1, 1,
0.4425025, 0.41769, 0.2396923, 0, 0, 0, 1, 1,
0.459795, -0.637911, 0.9428763, 0, 0, 0, 1, 1,
0.4611581, -1.02487, 0.9056722, 0, 0, 0, 1, 1,
0.4613352, 1.692624, 0.4625155, 0, 0, 0, 1, 1,
0.4614172, -1.320413, 4.861939, 1, 1, 1, 1, 1,
0.4615737, -1.089285, 3.403673, 1, 1, 1, 1, 1,
0.4617607, -0.05065097, -1.506402, 1, 1, 1, 1, 1,
0.4668126, 0.8044499, -0.295587, 1, 1, 1, 1, 1,
0.4675145, -0.6199278, 1.261755, 1, 1, 1, 1, 1,
0.475116, -1.282497, 2.765989, 1, 1, 1, 1, 1,
0.4756721, 0.6014799, 1.090436, 1, 1, 1, 1, 1,
0.4759065, -0.4239942, 1.262583, 1, 1, 1, 1, 1,
0.4791026, 0.007217206, 2.956548, 1, 1, 1, 1, 1,
0.4801822, 1.018204, 1.781308, 1, 1, 1, 1, 1,
0.4813154, -2.049258, 2.870482, 1, 1, 1, 1, 1,
0.4842147, 0.1128564, 0.6482071, 1, 1, 1, 1, 1,
0.4858633, 0.736846, 0.1534425, 1, 1, 1, 1, 1,
0.486258, -0.9217299, 2.358298, 1, 1, 1, 1, 1,
0.4896469, 0.2823176, 1.812906, 1, 1, 1, 1, 1,
0.4898744, -2.240882, 4.954171, 0, 0, 1, 1, 1,
0.4899011, -1.107951, 4.050314, 1, 0, 0, 1, 1,
0.4932639, 0.7641651, 0.9684533, 1, 0, 0, 1, 1,
0.4948999, -0.0412441, 1.996644, 1, 0, 0, 1, 1,
0.4957898, -1.021692, 0.3005407, 1, 0, 0, 1, 1,
0.4984154, 0.802728, 0.7987756, 1, 0, 0, 1, 1,
0.5038208, 0.3849074, -0.2569702, 0, 0, 0, 1, 1,
0.5076847, -0.7458503, 4.364887, 0, 0, 0, 1, 1,
0.5089791, 0.36361, 1.477301, 0, 0, 0, 1, 1,
0.5103688, 0.162724, -0.1145311, 0, 0, 0, 1, 1,
0.5203096, 1.196007, 0.8916056, 0, 0, 0, 1, 1,
0.5223549, -2.286764, 2.110426, 0, 0, 0, 1, 1,
0.5252844, 0.73657, 0.46945, 0, 0, 0, 1, 1,
0.5299599, 1.262973, -0.6274518, 1, 1, 1, 1, 1,
0.5313419, -0.3628478, 1.65903, 1, 1, 1, 1, 1,
0.5323376, 0.19726, 0.8930341, 1, 1, 1, 1, 1,
0.534003, -0.9728529, 2.967301, 1, 1, 1, 1, 1,
0.5359207, 0.6909119, 0.9451826, 1, 1, 1, 1, 1,
0.5445979, -1.861872, 1.340268, 1, 1, 1, 1, 1,
0.5505809, -0.8583086, 3.357487, 1, 1, 1, 1, 1,
0.5525708, 0.3748407, 1.360786, 1, 1, 1, 1, 1,
0.5529826, 1.654949, -0.3490042, 1, 1, 1, 1, 1,
0.5534714, -0.4781136, 2.067216, 1, 1, 1, 1, 1,
0.5571752, 0.4762156, 2.601057, 1, 1, 1, 1, 1,
0.5598154, 1.550617, -1.803082, 1, 1, 1, 1, 1,
0.5619102, 1.154923, -0.7645098, 1, 1, 1, 1, 1,
0.5630974, -0.3160734, 1.51773, 1, 1, 1, 1, 1,
0.5640112, -0.6437705, 4.074342, 1, 1, 1, 1, 1,
0.5661116, 0.2262874, 1.773749, 0, 0, 1, 1, 1,
0.5664613, 0.579142, -0.130906, 1, 0, 0, 1, 1,
0.5689, -0.9007716, 3.718905, 1, 0, 0, 1, 1,
0.5719337, -0.3424647, 1.715268, 1, 0, 0, 1, 1,
0.5772351, -2.143376, 3.351386, 1, 0, 0, 1, 1,
0.577399, -1.4673, 4.637828, 1, 0, 0, 1, 1,
0.5791706, -0.936147, 1.318898, 0, 0, 0, 1, 1,
0.5857862, 1.204582, 0.7831106, 0, 0, 0, 1, 1,
0.5867727, -0.9015794, 0.6060302, 0, 0, 0, 1, 1,
0.5892085, -0.1323838, 3.570985, 0, 0, 0, 1, 1,
0.5928164, -0.5917343, 2.836427, 0, 0, 0, 1, 1,
0.5968304, 0.609623, 0.3766721, 0, 0, 0, 1, 1,
0.5983304, 1.002479, -0.4026051, 0, 0, 0, 1, 1,
0.6035319, -0.9375914, 3.373001, 1, 1, 1, 1, 1,
0.6080124, 1.107728, 1.956715, 1, 1, 1, 1, 1,
0.609278, 0.03428743, 1.958073, 1, 1, 1, 1, 1,
0.6123886, 0.1668734, 0.4193597, 1, 1, 1, 1, 1,
0.6190207, 0.1011296, 1.82095, 1, 1, 1, 1, 1,
0.6209968, -0.1243812, 2.518922, 1, 1, 1, 1, 1,
0.6221799, 0.3281658, 1.147883, 1, 1, 1, 1, 1,
0.6236167, -1.510029, 3.17355, 1, 1, 1, 1, 1,
0.6282285, -0.7643675, 1.000476, 1, 1, 1, 1, 1,
0.6337341, -0.08245718, 0.8469968, 1, 1, 1, 1, 1,
0.6348384, 1.612391, 0.9847407, 1, 1, 1, 1, 1,
0.6404004, -0.5078858, 1.92189, 1, 1, 1, 1, 1,
0.641094, 0.466329, 1.475477, 1, 1, 1, 1, 1,
0.6427965, 0.2723963, -0.7418274, 1, 1, 1, 1, 1,
0.6429204, -0.4970088, 2.961218, 1, 1, 1, 1, 1,
0.6443721, -0.2471443, 3.571332, 0, 0, 1, 1, 1,
0.6460415, -0.6284443, 2.175742, 1, 0, 0, 1, 1,
0.6556296, -0.9928277, 2.377942, 1, 0, 0, 1, 1,
0.6556516, -0.3251396, 0.1700507, 1, 0, 0, 1, 1,
0.6598537, 0.1082249, 0.7482609, 1, 0, 0, 1, 1,
0.6604858, -0.9717886, 4.487034, 1, 0, 0, 1, 1,
0.6663483, 0.1004246, 1.750301, 0, 0, 0, 1, 1,
0.6691828, 1.291667, 2.335456, 0, 0, 0, 1, 1,
0.6764845, -1.132112, 2.667231, 0, 0, 0, 1, 1,
0.6822795, -2.565386, 1.852168, 0, 0, 0, 1, 1,
0.6864534, -0.4302658, 0.7722717, 0, 0, 0, 1, 1,
0.689002, -1.227845, 0.4113886, 0, 0, 0, 1, 1,
0.6897258, 0.3134184, 1.792513, 0, 0, 0, 1, 1,
0.6898453, -0.9956076, 3.55722, 1, 1, 1, 1, 1,
0.6929291, -0.6929168, 2.843088, 1, 1, 1, 1, 1,
0.6938307, -0.8163031, 2.985791, 1, 1, 1, 1, 1,
0.6940464, 1.893156, 0.9580614, 1, 1, 1, 1, 1,
0.7131475, 0.8487986, 0.9020532, 1, 1, 1, 1, 1,
0.7132987, 0.3998342, 2.401611, 1, 1, 1, 1, 1,
0.7147812, 0.05902053, 3.882899, 1, 1, 1, 1, 1,
0.7147937, 0.881822, 0.1522366, 1, 1, 1, 1, 1,
0.7172924, -0.9199374, 1.074759, 1, 1, 1, 1, 1,
0.7212362, -0.3643298, 3.938449, 1, 1, 1, 1, 1,
0.7237923, -1.50465, 2.700809, 1, 1, 1, 1, 1,
0.7251848, 1.028179, 0.875891, 1, 1, 1, 1, 1,
0.7304589, -0.4619235, 3.124486, 1, 1, 1, 1, 1,
0.7305022, 0.3965434, 0.9314558, 1, 1, 1, 1, 1,
0.734287, 0.02198869, 1.369803, 1, 1, 1, 1, 1,
0.7365803, 0.03334292, 2.415808, 0, 0, 1, 1, 1,
0.7412643, 0.9750584, 0.3566568, 1, 0, 0, 1, 1,
0.7481328, 0.9992473, -1.118604, 1, 0, 0, 1, 1,
0.7516462, -1.039699, 2.89466, 1, 0, 0, 1, 1,
0.7547832, 1.593345, 0.2458395, 1, 0, 0, 1, 1,
0.7671367, 1.662417, 1.103962, 1, 0, 0, 1, 1,
0.7671377, -0.2784216, 1.917028, 0, 0, 0, 1, 1,
0.7702991, 0.1409414, 4.261224, 0, 0, 0, 1, 1,
0.7708182, -1.141173, 2.052535, 0, 0, 0, 1, 1,
0.7862048, -0.5906476, 3.495249, 0, 0, 0, 1, 1,
0.7918743, -0.05944039, 2.520951, 0, 0, 0, 1, 1,
0.7933624, 0.2511202, 1.45316, 0, 0, 0, 1, 1,
0.7964832, 1.056337, -0.08772473, 0, 0, 0, 1, 1,
0.7975334, -0.5586402, 3.949988, 1, 1, 1, 1, 1,
0.798142, -0.2116611, 0.1747549, 1, 1, 1, 1, 1,
0.7990659, 0.7874413, -0.1136871, 1, 1, 1, 1, 1,
0.8066165, 0.04449908, 2.118011, 1, 1, 1, 1, 1,
0.8108014, -2.030164, 3.397569, 1, 1, 1, 1, 1,
0.8148984, 1.29385, 1.157258, 1, 1, 1, 1, 1,
0.8214692, -0.6226074, 0.8907954, 1, 1, 1, 1, 1,
0.8315321, -2.412729, 1.735242, 1, 1, 1, 1, 1,
0.8369862, 0.7780865, 1.393941, 1, 1, 1, 1, 1,
0.8457032, -0.5068095, 2.63235, 1, 1, 1, 1, 1,
0.8485469, -1.977593, 2.208653, 1, 1, 1, 1, 1,
0.8485947, -0.8805798, 0.9013812, 1, 1, 1, 1, 1,
0.8593566, 0.9550388, 0.2558162, 1, 1, 1, 1, 1,
0.8706414, -1.636289, -0.3436384, 1, 1, 1, 1, 1,
0.8738835, 1.955044, -0.4173755, 1, 1, 1, 1, 1,
0.8748174, 1.255055, -0.6409107, 0, 0, 1, 1, 1,
0.8755057, 1.302685, 1.40074, 1, 0, 0, 1, 1,
0.9016727, 0.4451495, -0.9439512, 1, 0, 0, 1, 1,
0.902975, 2.560814, -0.3700227, 1, 0, 0, 1, 1,
0.9100716, 0.8455616, 0.70679, 1, 0, 0, 1, 1,
0.9123071, -0.04777351, 1.198516, 1, 0, 0, 1, 1,
0.9141502, 0.4044942, -0.53343, 0, 0, 0, 1, 1,
0.9197137, 1.497724, -1.624312, 0, 0, 0, 1, 1,
0.9223241, -1.375047, 3.874069, 0, 0, 0, 1, 1,
0.9225372, -1.037502, 3.963016, 0, 0, 0, 1, 1,
0.9247966, -1.1494, 4.446304, 0, 0, 0, 1, 1,
0.9304795, -1.356465, 2.141971, 0, 0, 0, 1, 1,
0.9353788, -0.409492, 1.351405, 0, 0, 0, 1, 1,
0.942213, -0.1346805, 2.10533, 1, 1, 1, 1, 1,
0.9447973, -1.737722, 3.074716, 1, 1, 1, 1, 1,
0.9492211, -2.068251, 1.969708, 1, 1, 1, 1, 1,
0.9501587, 0.5929038, 0.7301562, 1, 1, 1, 1, 1,
0.9516497, 0.2227122, 0.5968196, 1, 1, 1, 1, 1,
0.9537242, -2.198595, 2.191004, 1, 1, 1, 1, 1,
0.9580758, 0.1162799, 2.301385, 1, 1, 1, 1, 1,
0.9624853, 0.6770363, 0.7681807, 1, 1, 1, 1, 1,
0.9627134, 1.126679, -0.7893667, 1, 1, 1, 1, 1,
0.9649896, 0.5512524, -0.5618258, 1, 1, 1, 1, 1,
0.9650066, 1.865208, 1.057021, 1, 1, 1, 1, 1,
0.9654301, -0.7978291, 2.49688, 1, 1, 1, 1, 1,
0.9661005, 1.762578, 0.1315371, 1, 1, 1, 1, 1,
0.969583, -0.4349691, 0.2596764, 1, 1, 1, 1, 1,
0.9733917, 0.06019545, 2.523804, 1, 1, 1, 1, 1,
0.974764, -1.942816, 2.811379, 0, 0, 1, 1, 1,
0.9763412, 0.2554749, 1.416236, 1, 0, 0, 1, 1,
0.9767514, -0.4097422, 1.451579, 1, 0, 0, 1, 1,
0.9776664, 0.5812655, -0.3234949, 1, 0, 0, 1, 1,
0.9834092, 0.904805, 0.398534, 1, 0, 0, 1, 1,
0.9847873, -0.9949044, 1.786504, 1, 0, 0, 1, 1,
0.9869041, 1.706879, -0.8067241, 0, 0, 0, 1, 1,
0.989215, -1.03176, 2.90555, 0, 0, 0, 1, 1,
0.9985098, -1.21678, 3.075583, 0, 0, 0, 1, 1,
1.00098, 0.3698964, 2.206526, 0, 0, 0, 1, 1,
1.001168, -0.4334766, 0.8546956, 0, 0, 0, 1, 1,
1.001972, 0.6165703, 0.6495841, 0, 0, 0, 1, 1,
1.004478, 0.8802111, -0.02087034, 0, 0, 0, 1, 1,
1.010805, -1.67943, 3.171494, 1, 1, 1, 1, 1,
1.020111, -0.5546584, 1.125469, 1, 1, 1, 1, 1,
1.022616, 1.257546, 1.607951, 1, 1, 1, 1, 1,
1.025, 0.6900179, -0.8818238, 1, 1, 1, 1, 1,
1.031317, -0.5889818, 0.6978178, 1, 1, 1, 1, 1,
1.031578, 0.255843, 1.271696, 1, 1, 1, 1, 1,
1.040194, -1.925088, 2.897543, 1, 1, 1, 1, 1,
1.0405, 0.5870047, 0.5206276, 1, 1, 1, 1, 1,
1.041316, 1.540926, 1.79348, 1, 1, 1, 1, 1,
1.053967, -1.642303, 2.695106, 1, 1, 1, 1, 1,
1.062195, -0.4254119, 1.123482, 1, 1, 1, 1, 1,
1.069506, -0.2349479, 1.365347, 1, 1, 1, 1, 1,
1.070037, -1.703314, 2.084157, 1, 1, 1, 1, 1,
1.073091, -0.1476472, 5.4638e-05, 1, 1, 1, 1, 1,
1.074213, 0.02924569, 2.200637, 1, 1, 1, 1, 1,
1.074264, -0.1048357, 3.130187, 0, 0, 1, 1, 1,
1.077482, -0.8156052, 1.466805, 1, 0, 0, 1, 1,
1.081634, -0.08992188, 1.67657, 1, 0, 0, 1, 1,
1.090531, 0.1886219, 1.458235, 1, 0, 0, 1, 1,
1.101072, 1.80688, -0.4781002, 1, 0, 0, 1, 1,
1.106251, 0.4955629, -0.5826504, 1, 0, 0, 1, 1,
1.108178, -1.059348, 3.345584, 0, 0, 0, 1, 1,
1.110897, -0.5602036, 0.6246021, 0, 0, 0, 1, 1,
1.116031, 1.446086, 1.208046, 0, 0, 0, 1, 1,
1.117366, 0.8073794, 0.7172405, 0, 0, 0, 1, 1,
1.117545, 1.208061, -0.4250812, 0, 0, 0, 1, 1,
1.132632, 0.7109184, -0.1130587, 0, 0, 0, 1, 1,
1.133386, 0.04236754, 0.7772598, 0, 0, 0, 1, 1,
1.13959, 0.7558201, -0.4958227, 1, 1, 1, 1, 1,
1.140221, 0.2627887, 1.725802, 1, 1, 1, 1, 1,
1.15497, 0.416209, 1.392767, 1, 1, 1, 1, 1,
1.161058, 0.5227863, 1.962638, 1, 1, 1, 1, 1,
1.169507, 2.061309, 0.3168242, 1, 1, 1, 1, 1,
1.174093, -0.6538163, 0.5537218, 1, 1, 1, 1, 1,
1.177219, 0.6145772, 0.852841, 1, 1, 1, 1, 1,
1.177263, 0.2958865, 0.5293378, 1, 1, 1, 1, 1,
1.182207, -0.5231507, 1.200043, 1, 1, 1, 1, 1,
1.18321, 0.4908893, 2.516047, 1, 1, 1, 1, 1,
1.188952, -0.9984207, 2.162495, 1, 1, 1, 1, 1,
1.193745, -0.3540824, 1.515469, 1, 1, 1, 1, 1,
1.198248, 0.2684443, 1.174403, 1, 1, 1, 1, 1,
1.199219, 1.061298, 2.275711, 1, 1, 1, 1, 1,
1.201627, 0.9085415, 0.6439844, 1, 1, 1, 1, 1,
1.20918, -0.03556278, 1.626625, 0, 0, 1, 1, 1,
1.216143, -0.2655653, -0.6401841, 1, 0, 0, 1, 1,
1.216756, 1.082631, -0.7085754, 1, 0, 0, 1, 1,
1.223302, -0.2216867, -0.544292, 1, 0, 0, 1, 1,
1.226508, -1.730813, 2.877657, 1, 0, 0, 1, 1,
1.242459, -0.0004496822, 1.10831, 1, 0, 0, 1, 1,
1.262188, -1.063492, 2.231583, 0, 0, 0, 1, 1,
1.274225, -0.4441681, 1.053572, 0, 0, 0, 1, 1,
1.274807, -0.1539703, 1.167974, 0, 0, 0, 1, 1,
1.287575, 0.6519065, 1.668679, 0, 0, 0, 1, 1,
1.298103, -0.557423, 2.192798, 0, 0, 0, 1, 1,
1.30571, -1.35894, 1.26386, 0, 0, 0, 1, 1,
1.309812, -0.2160455, 2.481289, 0, 0, 0, 1, 1,
1.319025, -2.186269, 1.664271, 1, 1, 1, 1, 1,
1.322315, -0.4020169, 1.948806, 1, 1, 1, 1, 1,
1.327446, -0.3669591, -0.09678816, 1, 1, 1, 1, 1,
1.328819, -0.5978679, 1.345034, 1, 1, 1, 1, 1,
1.331582, 0.9680785, 2.053778, 1, 1, 1, 1, 1,
1.338472, 2.107937, -0.6318809, 1, 1, 1, 1, 1,
1.343889, 1.32146, 0.5099531, 1, 1, 1, 1, 1,
1.345955, 0.5702562, -0.1420061, 1, 1, 1, 1, 1,
1.351076, 0.7245075, -0.1129514, 1, 1, 1, 1, 1,
1.356052, 0.1058887, 1.416073, 1, 1, 1, 1, 1,
1.358984, 0.776432, 1.718872, 1, 1, 1, 1, 1,
1.361335, -0.7760035, 1.055761, 1, 1, 1, 1, 1,
1.38216, -0.1313648, 2.981131, 1, 1, 1, 1, 1,
1.397759, 0.2918239, 1.817856, 1, 1, 1, 1, 1,
1.405694, 0.1100545, 1.425757, 1, 1, 1, 1, 1,
1.410534, -1.569783, 3.367915, 0, 0, 1, 1, 1,
1.411329, 1.383076, -0.3743599, 1, 0, 0, 1, 1,
1.419197, -0.5734242, 1.877227, 1, 0, 0, 1, 1,
1.425249, 0.6163593, 1.550985, 1, 0, 0, 1, 1,
1.434324, 1.135209, 0.486336, 1, 0, 0, 1, 1,
1.448777, 1.063485, 0.9407616, 1, 0, 0, 1, 1,
1.449478, -1.173311, 2.088021, 0, 0, 0, 1, 1,
1.458862, -1.31849, 2.580127, 0, 0, 0, 1, 1,
1.460849, 2.283018, 2.581093, 0, 0, 0, 1, 1,
1.479236, -1.607407, 4.470096, 0, 0, 0, 1, 1,
1.481219, -0.7279317, 2.325566, 0, 0, 0, 1, 1,
1.484847, 1.783917, 0.2519553, 0, 0, 0, 1, 1,
1.485849, 2.086267, 1.342053, 0, 0, 0, 1, 1,
1.486675, -1.03903, 1.631675, 1, 1, 1, 1, 1,
1.49234, -0.7014225, 0.3877901, 1, 1, 1, 1, 1,
1.497546, 1.705409, -0.01900864, 1, 1, 1, 1, 1,
1.506538, -0.5323465, 1.08949, 1, 1, 1, 1, 1,
1.511682, -0.3578609, 0.9741135, 1, 1, 1, 1, 1,
1.522814, -2.428037, 3.991898, 1, 1, 1, 1, 1,
1.523326, -1.467396, 1.179579, 1, 1, 1, 1, 1,
1.529492, -1.349115, 2.507365, 1, 1, 1, 1, 1,
1.530378, -0.7997728, 2.519002, 1, 1, 1, 1, 1,
1.531809, 1.100303, 1.658646, 1, 1, 1, 1, 1,
1.533275, -0.2558752, 0.9959148, 1, 1, 1, 1, 1,
1.538543, -0.3618675, 1.51627, 1, 1, 1, 1, 1,
1.546316, 0.08457291, 2.013684, 1, 1, 1, 1, 1,
1.558886, 2.483658, 1.95468, 1, 1, 1, 1, 1,
1.560152, 0.6905141, 0.6852509, 1, 1, 1, 1, 1,
1.570618, -1.148675, 2.957087, 0, 0, 1, 1, 1,
1.57499, 0.1608705, 1.362789, 1, 0, 0, 1, 1,
1.581749, 2.562704, 0.9907141, 1, 0, 0, 1, 1,
1.587238, 0.2193321, 1.063411, 1, 0, 0, 1, 1,
1.606292, -0.2985824, 2.085953, 1, 0, 0, 1, 1,
1.633695, 0.8885245, 2.433527, 1, 0, 0, 1, 1,
1.669832, 0.9007699, 2.357909, 0, 0, 0, 1, 1,
1.67946, -0.135572, -0.3139386, 0, 0, 0, 1, 1,
1.684225, 0.6767275, 1.536311, 0, 0, 0, 1, 1,
1.707429, 1.297024, 1.699314, 0, 0, 0, 1, 1,
1.733113, -0.5056158, 0.8300366, 0, 0, 0, 1, 1,
1.762045, -1.83544, 1.566438, 0, 0, 0, 1, 1,
1.778736, -0.01353969, 1.508075, 0, 0, 0, 1, 1,
1.787432, 0.0741675, 1.648925, 1, 1, 1, 1, 1,
1.789269, 1.34959, 1.113958, 1, 1, 1, 1, 1,
1.800935, 0.8214056, 0.3636478, 1, 1, 1, 1, 1,
1.819918, -1.55351, 3.774657, 1, 1, 1, 1, 1,
1.830853, 0.7851868, -0.08107597, 1, 1, 1, 1, 1,
1.851219, 1.350336, -0.3844437, 1, 1, 1, 1, 1,
1.896969, 0.7817542, 0.7702527, 1, 1, 1, 1, 1,
1.904641, -0.6180131, 1.593103, 1, 1, 1, 1, 1,
1.908844, -1.835516, 2.04598, 1, 1, 1, 1, 1,
1.947819, 0.06148863, 0.5105128, 1, 1, 1, 1, 1,
1.955706, -1.412553, 0.8191443, 1, 1, 1, 1, 1,
2.005701, -0.8921012, 1.509287, 1, 1, 1, 1, 1,
2.065123, 0.005265383, -0.09970285, 1, 1, 1, 1, 1,
2.066489, -0.3822804, 1.693673, 1, 1, 1, 1, 1,
2.084159, -0.5795459, 3.298907, 1, 1, 1, 1, 1,
2.093658, 0.4340447, 1.763693, 0, 0, 1, 1, 1,
2.098385, 1.000845, -0.9184538, 1, 0, 0, 1, 1,
2.110917, 1.25489, 1.661447, 1, 0, 0, 1, 1,
2.145293, 0.4320883, 2.113488, 1, 0, 0, 1, 1,
2.158404, 0.4184685, 2.748371, 1, 0, 0, 1, 1,
2.160112, 0.3343561, 1.229928, 1, 0, 0, 1, 1,
2.160821, -0.8674258, 1.264306, 0, 0, 0, 1, 1,
2.180278, 1.728192, -0.2696599, 0, 0, 0, 1, 1,
2.227105, 0.09365574, 1.467757, 0, 0, 0, 1, 1,
2.251275, -0.02223525, 3.874629, 0, 0, 0, 1, 1,
2.273841, 0.447903, 1.83973, 0, 0, 0, 1, 1,
2.311587, 0.4325463, -1.111255, 0, 0, 0, 1, 1,
2.323658, -1.428701, 2.886533, 0, 0, 0, 1, 1,
2.358109, 0.808066, 1.480228, 1, 1, 1, 1, 1,
2.427043, -1.681447, 3.216626, 1, 1, 1, 1, 1,
2.440835, -1.642068, 1.555524, 1, 1, 1, 1, 1,
2.521419, -0.932744, -0.155939, 1, 1, 1, 1, 1,
2.721968, -1.340253, 2.608636, 1, 1, 1, 1, 1,
2.728422, 1.157827, 1.429762, 1, 1, 1, 1, 1,
4.563172, 1.279438, 1.88408, 1, 1, 1, 1, 1
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
var radius = 9.475461;
var distance = 33.28215;
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
mvMatrix.translate( -0.9546869, -0.09888875, 0.1558347 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.28215);
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
