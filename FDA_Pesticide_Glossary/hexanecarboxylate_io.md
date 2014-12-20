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
-4.014546, 0.3496152, -0.8851226, 1, 0, 0, 1,
-3.806764, -0.07344965, -0.1247833, 1, 0.007843138, 0, 1,
-3.455278, 0.1545999, -0.7092995, 1, 0.01176471, 0, 1,
-3.380219, 1.2219, -2.356658, 1, 0.01960784, 0, 1,
-3.300045, -1.006483, -0.6345274, 1, 0.02352941, 0, 1,
-3.084724, -1.202788, -2.89838, 1, 0.03137255, 0, 1,
-2.926743, -0.8278989, -1.920091, 1, 0.03529412, 0, 1,
-2.919796, 0.18639, -1.652293, 1, 0.04313726, 0, 1,
-2.790173, 0.3582567, -1.655816, 1, 0.04705882, 0, 1,
-2.771094, -1.091326, -0.7428393, 1, 0.05490196, 0, 1,
-2.718572, -0.2889904, -1.607055, 1, 0.05882353, 0, 1,
-2.712042, 0.4762595, -0.4599412, 1, 0.06666667, 0, 1,
-2.645435, -2.453967, -2.855361, 1, 0.07058824, 0, 1,
-2.54148, 0.6261335, -2.101668, 1, 0.07843138, 0, 1,
-2.438326, 0.633594, -2.288191, 1, 0.08235294, 0, 1,
-2.433174, 0.3140771, -1.49981, 1, 0.09019608, 0, 1,
-2.41089, -0.7551398, -0.3115869, 1, 0.09411765, 0, 1,
-2.39184, 2.169791, -0.5384523, 1, 0.1019608, 0, 1,
-2.358362, -0.07706244, -2.417391, 1, 0.1098039, 0, 1,
-2.335098, 0.3539526, -1.320178, 1, 0.1137255, 0, 1,
-2.240113, 0.6262935, -2.089669, 1, 0.1215686, 0, 1,
-2.21994, -0.6682393, -3.054599, 1, 0.1254902, 0, 1,
-2.207129, 1.75702, -0.3813274, 1, 0.1333333, 0, 1,
-2.162702, 0.6121088, -2.042497, 1, 0.1372549, 0, 1,
-2.142587, 1.366751, 1.449628, 1, 0.145098, 0, 1,
-2.126971, 2.12392, -0.6042194, 1, 0.1490196, 0, 1,
-2.125746, -0.1566305, -1.480082, 1, 0.1568628, 0, 1,
-2.112297, 1.261581, -2.305823, 1, 0.1607843, 0, 1,
-2.104859, -0.7691637, -2.880661, 1, 0.1686275, 0, 1,
-2.073426, 0.7734389, 0.009937479, 1, 0.172549, 0, 1,
-2.022859, 0.5782821, -2.85234, 1, 0.1803922, 0, 1,
-2.015254, -0.3392083, -1.450765, 1, 0.1843137, 0, 1,
-1.988892, 0.8680995, -1.166331, 1, 0.1921569, 0, 1,
-1.98547, -1.127472, -0.6758908, 1, 0.1960784, 0, 1,
-1.952881, -2.371516, -2.78181, 1, 0.2039216, 0, 1,
-1.942178, -0.7294383, -0.9708143, 1, 0.2117647, 0, 1,
-1.937497, 1.563354, -0.1177208, 1, 0.2156863, 0, 1,
-1.932511, 0.01242461, -1.720865, 1, 0.2235294, 0, 1,
-1.932243, 0.8706418, -1.132296, 1, 0.227451, 0, 1,
-1.912354, -0.7209175, -1.577297, 1, 0.2352941, 0, 1,
-1.901081, -0.5808448, -1.619982, 1, 0.2392157, 0, 1,
-1.864696, 1.475732, -2.614088, 1, 0.2470588, 0, 1,
-1.863594, 0.08389664, -0.7224194, 1, 0.2509804, 0, 1,
-1.863236, 1.910155, 0.06140118, 1, 0.2588235, 0, 1,
-1.851046, 0.03157563, -1.94326, 1, 0.2627451, 0, 1,
-1.84035, 0.6130596, -0.7378777, 1, 0.2705882, 0, 1,
-1.836007, -1.958798, -2.345923, 1, 0.2745098, 0, 1,
-1.831772, -1.582818, -1.007642, 1, 0.282353, 0, 1,
-1.777184, -0.4877497, -1.028458, 1, 0.2862745, 0, 1,
-1.768238, 1.367429, -1.156402, 1, 0.2941177, 0, 1,
-1.747752, 0.09495443, -1.681196, 1, 0.3019608, 0, 1,
-1.743151, 0.4814903, -1.235066, 1, 0.3058824, 0, 1,
-1.738171, 0.8481184, -0.7922708, 1, 0.3137255, 0, 1,
-1.711979, -2.030498, -1.792291, 1, 0.3176471, 0, 1,
-1.689919, -0.2992837, -4.113375, 1, 0.3254902, 0, 1,
-1.685663, 0.9000728, 0.6918444, 1, 0.3294118, 0, 1,
-1.678953, 0.8406554, -0.9242229, 1, 0.3372549, 0, 1,
-1.675835, 1.234681, -2.308395, 1, 0.3411765, 0, 1,
-1.665444, 0.5587629, -0.1391001, 1, 0.3490196, 0, 1,
-1.663651, -0.001251337, -1.169349, 1, 0.3529412, 0, 1,
-1.645282, 0.1872545, -0.9540239, 1, 0.3607843, 0, 1,
-1.642213, -0.4106653, -2.046544, 1, 0.3647059, 0, 1,
-1.640437, 0.1818579, -0.5285136, 1, 0.372549, 0, 1,
-1.57103, 0.7476665, 0.26567, 1, 0.3764706, 0, 1,
-1.570486, 1.571492, -0.8580055, 1, 0.3843137, 0, 1,
-1.565082, -1.498951, -1.175721, 1, 0.3882353, 0, 1,
-1.560842, 0.7731195, -0.3821424, 1, 0.3960784, 0, 1,
-1.517234, 0.7056124, -1.343524, 1, 0.4039216, 0, 1,
-1.511914, -0.6508899, -1.338472, 1, 0.4078431, 0, 1,
-1.508958, 0.4636374, -2.760224, 1, 0.4156863, 0, 1,
-1.502185, 0.8689024, -0.5835035, 1, 0.4196078, 0, 1,
-1.496102, -1.339371, -2.826471, 1, 0.427451, 0, 1,
-1.49048, -1.171901, -2.669774, 1, 0.4313726, 0, 1,
-1.486726, 0.2576165, -1.469474, 1, 0.4392157, 0, 1,
-1.486213, 0.01342391, -0.3414197, 1, 0.4431373, 0, 1,
-1.483734, 0.6352431, -2.572574, 1, 0.4509804, 0, 1,
-1.463282, -0.3581946, -2.203975, 1, 0.454902, 0, 1,
-1.450173, 0.6812031, -2.068787, 1, 0.4627451, 0, 1,
-1.440116, -0.1254822, -1.377704, 1, 0.4666667, 0, 1,
-1.430359, -0.8890718, -1.365245, 1, 0.4745098, 0, 1,
-1.42397, 0.3520635, -2.628932, 1, 0.4784314, 0, 1,
-1.409717, -0.7371284, -0.992088, 1, 0.4862745, 0, 1,
-1.408486, 0.215508, -1.526459, 1, 0.4901961, 0, 1,
-1.40695, -0.5315103, -1.954375, 1, 0.4980392, 0, 1,
-1.403862, -1.147967, -1.102957, 1, 0.5058824, 0, 1,
-1.399255, -0.9273201, -2.482293, 1, 0.509804, 0, 1,
-1.398009, 0.1100404, -0.8425012, 1, 0.5176471, 0, 1,
-1.397997, 0.2695459, 0.07948416, 1, 0.5215687, 0, 1,
-1.396092, 1.595492, -1.204642, 1, 0.5294118, 0, 1,
-1.389907, 0.8380659, -1.579746, 1, 0.5333334, 0, 1,
-1.365949, -0.5027722, -1.42509, 1, 0.5411765, 0, 1,
-1.356596, 0.5309566, -0.8439859, 1, 0.5450981, 0, 1,
-1.350507, 0.3000615, -0.9753174, 1, 0.5529412, 0, 1,
-1.349032, 1.706713, -0.7380694, 1, 0.5568628, 0, 1,
-1.342469, 1.195515, -0.9074551, 1, 0.5647059, 0, 1,
-1.339646, 2.289295, 1.008378, 1, 0.5686275, 0, 1,
-1.337214, -1.378675, -3.249573, 1, 0.5764706, 0, 1,
-1.318877, 1.619416, -1.296693, 1, 0.5803922, 0, 1,
-1.317327, 0.2496364, -2.640848, 1, 0.5882353, 0, 1,
-1.304928, 1.259574, -0.3902073, 1, 0.5921569, 0, 1,
-1.29816, -1.150116, -2.282757, 1, 0.6, 0, 1,
-1.275918, -0.4422571, -1.483557, 1, 0.6078432, 0, 1,
-1.26773, -0.2957398, -1.768819, 1, 0.6117647, 0, 1,
-1.260683, 0.3401805, -1.816539, 1, 0.6196079, 0, 1,
-1.258824, 0.05568681, -3.400732, 1, 0.6235294, 0, 1,
-1.25386, 0.7663375, -1.057839, 1, 0.6313726, 0, 1,
-1.249081, 0.26765, -0.418293, 1, 0.6352941, 0, 1,
-1.241076, 0.6501527, -0.9664668, 1, 0.6431373, 0, 1,
-1.2328, 0.9491307, -0.9697745, 1, 0.6470588, 0, 1,
-1.228491, -1.341277, -1.651106, 1, 0.654902, 0, 1,
-1.220171, -0.6096686, -3.172654, 1, 0.6588235, 0, 1,
-1.213826, 0.6140084, -0.6851534, 1, 0.6666667, 0, 1,
-1.211433, 0.005817405, -1.586316, 1, 0.6705883, 0, 1,
-1.204731, -0.1327644, -0.6025169, 1, 0.6784314, 0, 1,
-1.20024, -0.8074356, -0.6302607, 1, 0.682353, 0, 1,
-1.189811, 1.681477, 0.8122248, 1, 0.6901961, 0, 1,
-1.187043, 1.208474, -1.522795, 1, 0.6941177, 0, 1,
-1.182789, -0.4053898, -4.558774, 1, 0.7019608, 0, 1,
-1.182381, -1.831884, -0.6893004, 1, 0.7098039, 0, 1,
-1.168065, 0.7953743, -1.284282, 1, 0.7137255, 0, 1,
-1.165542, 0.7766201, -1.904089, 1, 0.7215686, 0, 1,
-1.156042, -1.742571, 0.0249846, 1, 0.7254902, 0, 1,
-1.154259, -0.0173778, -1.774995, 1, 0.7333333, 0, 1,
-1.151175, 0.9420432, -1.28235, 1, 0.7372549, 0, 1,
-1.149818, -0.2937812, -0.6207618, 1, 0.7450981, 0, 1,
-1.149609, 1.88025, -0.5982988, 1, 0.7490196, 0, 1,
-1.128401, -0.3181224, -0.8992371, 1, 0.7568628, 0, 1,
-1.127051, 2.224873, -0.5152617, 1, 0.7607843, 0, 1,
-1.126675, -0.8775405, -2.33115, 1, 0.7686275, 0, 1,
-1.124397, 1.138697, 1.527071, 1, 0.772549, 0, 1,
-1.116039, -0.7710546, -2.346239, 1, 0.7803922, 0, 1,
-1.101817, -1.876787, -3.161248, 1, 0.7843137, 0, 1,
-1.086299, -0.1050105, -0.3198592, 1, 0.7921569, 0, 1,
-1.083275, 0.4350144, -1.424946, 1, 0.7960784, 0, 1,
-1.067005, -0.72701, -0.6861141, 1, 0.8039216, 0, 1,
-1.060482, 0.4356392, 0.8607625, 1, 0.8117647, 0, 1,
-1.059929, -1.645099, -2.117184, 1, 0.8156863, 0, 1,
-1.059795, 1.760056, -0.3495426, 1, 0.8235294, 0, 1,
-1.056594, 0.6403744, -1.404663, 1, 0.827451, 0, 1,
-1.056443, -0.8089231, -3.065569, 1, 0.8352941, 0, 1,
-1.052991, 0.8946239, -0.9803592, 1, 0.8392157, 0, 1,
-1.047588, -1.007632, -3.003492, 1, 0.8470588, 0, 1,
-1.04043, -0.05303425, -1.096855, 1, 0.8509804, 0, 1,
-1.039638, 0.7599484, -1.573999, 1, 0.8588235, 0, 1,
-1.036443, 1.332418, -1.64712, 1, 0.8627451, 0, 1,
-1.034445, 0.4886142, -0.6348761, 1, 0.8705882, 0, 1,
-1.03012, -0.205992, -1.934605, 1, 0.8745098, 0, 1,
-1.030001, -0.1330488, -2.067382, 1, 0.8823529, 0, 1,
-1.027941, 1.499674, 1.052325, 1, 0.8862745, 0, 1,
-1.022153, 0.4821707, -0.8100818, 1, 0.8941177, 0, 1,
-1.017248, -0.9188854, -1.359335, 1, 0.8980392, 0, 1,
-1.013197, -0.855709, -2.150594, 1, 0.9058824, 0, 1,
-1.012913, -0.6543862, -2.214596, 1, 0.9137255, 0, 1,
-1.012152, -0.2083748, -0.3353446, 1, 0.9176471, 0, 1,
-1.007363, 0.2585559, -1.787731, 1, 0.9254902, 0, 1,
-1.006135, -1.10821, -1.897557, 1, 0.9294118, 0, 1,
-1.003379, 0.9736779, -1.131705, 1, 0.9372549, 0, 1,
-1.00247, 0.6894991, 0.1830151, 1, 0.9411765, 0, 1,
-0.9923882, -0.2390103, -2.287499, 1, 0.9490196, 0, 1,
-0.9921369, -0.02087763, -2.081449, 1, 0.9529412, 0, 1,
-0.9821082, -1.49621, -3.238114, 1, 0.9607843, 0, 1,
-0.9659038, 0.5420685, -0.9124498, 1, 0.9647059, 0, 1,
-0.9640778, -0.567992, -0.7713603, 1, 0.972549, 0, 1,
-0.9578471, -0.304795, -1.04451, 1, 0.9764706, 0, 1,
-0.9577622, -0.8696558, -4.242304, 1, 0.9843137, 0, 1,
-0.9526549, 1.110111, -0.2538414, 1, 0.9882353, 0, 1,
-0.9522693, -0.05469545, -1.937424, 1, 0.9960784, 0, 1,
-0.9501654, 0.4884875, 0.438323, 0.9960784, 1, 0, 1,
-0.9406739, 0.127341, -3.227075, 0.9921569, 1, 0, 1,
-0.9373792, 1.855943, -1.426925, 0.9843137, 1, 0, 1,
-0.9354449, -0.5904359, -1.955233, 0.9803922, 1, 0, 1,
-0.9340805, 0.8205783, -1.453878, 0.972549, 1, 0, 1,
-0.9329445, -1.196303, -3.165707, 0.9686275, 1, 0, 1,
-0.9257274, 1.716935, -0.3714314, 0.9607843, 1, 0, 1,
-0.9202255, -1.150491, -2.976899, 0.9568627, 1, 0, 1,
-0.9152059, 0.2637173, -1.013491, 0.9490196, 1, 0, 1,
-0.9104943, -0.4091429, -2.611554, 0.945098, 1, 0, 1,
-0.9065217, 0.04414017, -1.729252, 0.9372549, 1, 0, 1,
-0.9057816, -1.2462, -2.31529, 0.9333333, 1, 0, 1,
-0.8917107, 0.6271681, -1.216954, 0.9254902, 1, 0, 1,
-0.8808243, 0.7390899, -1.824226, 0.9215686, 1, 0, 1,
-0.8788556, -0.9606685, -3.012425, 0.9137255, 1, 0, 1,
-0.8733512, -0.6922159, -2.789118, 0.9098039, 1, 0, 1,
-0.8728223, 2.602018, -0.9894565, 0.9019608, 1, 0, 1,
-0.8666732, -0.5424497, -2.427324, 0.8941177, 1, 0, 1,
-0.8611754, 1.61936, -1.611722, 0.8901961, 1, 0, 1,
-0.8573951, 0.5139289, 0.02982506, 0.8823529, 1, 0, 1,
-0.8502703, -0.2245457, -3.793396, 0.8784314, 1, 0, 1,
-0.8449564, 0.77077, -0.9441391, 0.8705882, 1, 0, 1,
-0.8407971, 1.416476, -0.8983504, 0.8666667, 1, 0, 1,
-0.8397986, 0.077785, -1.060013, 0.8588235, 1, 0, 1,
-0.8277568, -1.233629, -1.553187, 0.854902, 1, 0, 1,
-0.8185329, 1.737961, -0.3508355, 0.8470588, 1, 0, 1,
-0.8020692, -0.4222429, -2.550915, 0.8431373, 1, 0, 1,
-0.801662, 0.9318354, -2.669147, 0.8352941, 1, 0, 1,
-0.8015632, 0.4835698, 0.9828259, 0.8313726, 1, 0, 1,
-0.8009639, 0.6618298, -0.4158743, 0.8235294, 1, 0, 1,
-0.8003835, 0.6421924, -2.095016, 0.8196079, 1, 0, 1,
-0.7917888, -0.2096616, -2.804992, 0.8117647, 1, 0, 1,
-0.7912874, 0.5613757, -2.198587, 0.8078431, 1, 0, 1,
-0.7900155, -0.3975686, -2.766376, 0.8, 1, 0, 1,
-0.7819227, -0.03725304, -2.114012, 0.7921569, 1, 0, 1,
-0.7765431, 0.1510574, -4.374727, 0.7882353, 1, 0, 1,
-0.7751447, 0.6022846, -1.515417, 0.7803922, 1, 0, 1,
-0.7608553, 0.5079378, -1.917253, 0.7764706, 1, 0, 1,
-0.7587853, -1.068812, -3.977682, 0.7686275, 1, 0, 1,
-0.7553559, 1.478513, 1.113021, 0.7647059, 1, 0, 1,
-0.7528817, -1.869876, -3.10829, 0.7568628, 1, 0, 1,
-0.7527235, 0.8378398, -1.23427, 0.7529412, 1, 0, 1,
-0.752561, -0.609403, -1.756244, 0.7450981, 1, 0, 1,
-0.7247875, -1.250199, -2.356635, 0.7411765, 1, 0, 1,
-0.7237729, -1.17348, -0.3620191, 0.7333333, 1, 0, 1,
-0.7226148, 0.163901, -1.076734, 0.7294118, 1, 0, 1,
-0.7221065, 0.01188432, -1.969509, 0.7215686, 1, 0, 1,
-0.7166055, 0.08033814, -1.114357, 0.7176471, 1, 0, 1,
-0.7145498, -0.06833933, -2.675683, 0.7098039, 1, 0, 1,
-0.7119542, -0.664642, -3.252377, 0.7058824, 1, 0, 1,
-0.7112778, -2.019575, -3.801612, 0.6980392, 1, 0, 1,
-0.7103021, 1.161287, 1.110494, 0.6901961, 1, 0, 1,
-0.7085217, 1.378703, -2.302341, 0.6862745, 1, 0, 1,
-0.7068968, -0.3986526, -1.253347, 0.6784314, 1, 0, 1,
-0.7057628, -0.4933701, 0.7298408, 0.6745098, 1, 0, 1,
-0.7057371, 1.789824, -1.735453, 0.6666667, 1, 0, 1,
-0.7023864, -0.664117, -2.019, 0.6627451, 1, 0, 1,
-0.7009364, 1.373461, -1.094864, 0.654902, 1, 0, 1,
-0.6872378, -0.3138812, -0.7693313, 0.6509804, 1, 0, 1,
-0.6828032, -0.6184906, -2.303961, 0.6431373, 1, 0, 1,
-0.6796132, -1.61936, -2.723969, 0.6392157, 1, 0, 1,
-0.6791751, 0.4558344, -2.141244, 0.6313726, 1, 0, 1,
-0.6669778, -1.446997, -1.123939, 0.627451, 1, 0, 1,
-0.6663893, -0.09651764, -1.194911, 0.6196079, 1, 0, 1,
-0.6549482, -0.837677, -4.538108, 0.6156863, 1, 0, 1,
-0.6528631, -0.2267441, -1.206072, 0.6078432, 1, 0, 1,
-0.6522421, 0.2320722, -0.5684089, 0.6039216, 1, 0, 1,
-0.6516903, 0.8970094, 0.5183989, 0.5960785, 1, 0, 1,
-0.64701, -2.209068, -2.008047, 0.5882353, 1, 0, 1,
-0.6451113, 0.03268434, -3.513522, 0.5843138, 1, 0, 1,
-0.6400018, -0.540037, -1.173431, 0.5764706, 1, 0, 1,
-0.6393192, -0.8633845, -2.641803, 0.572549, 1, 0, 1,
-0.6366615, -1.568983, -2.180642, 0.5647059, 1, 0, 1,
-0.6331728, -0.7948483, -3.16261, 0.5607843, 1, 0, 1,
-0.6327077, 0.9533928, -1.577631, 0.5529412, 1, 0, 1,
-0.6280088, 0.4325856, -2.14018, 0.5490196, 1, 0, 1,
-0.6279875, 0.5818571, -0.9940563, 0.5411765, 1, 0, 1,
-0.6224779, 1.973655, 0.1696047, 0.5372549, 1, 0, 1,
-0.6223503, 0.9496094, -1.30039, 0.5294118, 1, 0, 1,
-0.6219653, 0.4068989, -1.627654, 0.5254902, 1, 0, 1,
-0.6212013, -0.5180835, -1.011631, 0.5176471, 1, 0, 1,
-0.6188866, 1.676794, 0.5150017, 0.5137255, 1, 0, 1,
-0.6179703, 0.5976167, -0.5834033, 0.5058824, 1, 0, 1,
-0.6172981, -0.4025745, -3.283901, 0.5019608, 1, 0, 1,
-0.6135485, -1.018639, -2.30873, 0.4941176, 1, 0, 1,
-0.6135051, -1.015509, -3.396889, 0.4862745, 1, 0, 1,
-0.6120905, 0.6044285, -0.9334096, 0.4823529, 1, 0, 1,
-0.6120148, 1.569414, -0.09403325, 0.4745098, 1, 0, 1,
-0.6114324, 0.3624229, -0.5240587, 0.4705882, 1, 0, 1,
-0.6113976, 2.278891, -0.4434605, 0.4627451, 1, 0, 1,
-0.6109383, -0.8916365, -2.213362, 0.4588235, 1, 0, 1,
-0.6098622, 0.9092464, -1.221304, 0.4509804, 1, 0, 1,
-0.6083263, -0.8390668, -1.744612, 0.4470588, 1, 0, 1,
-0.6045954, -0.203364, -1.178871, 0.4392157, 1, 0, 1,
-0.6003082, -1.454766, -2.138533, 0.4352941, 1, 0, 1,
-0.6001841, -1.321485, -3.780465, 0.427451, 1, 0, 1,
-0.5960407, 1.212889, -0.1452659, 0.4235294, 1, 0, 1,
-0.591243, -0.7690181, -2.979666, 0.4156863, 1, 0, 1,
-0.5909925, 1.634145, 1.284627, 0.4117647, 1, 0, 1,
-0.5904674, -1.003289, -2.494979, 0.4039216, 1, 0, 1,
-0.5855582, 0.7586049, 0.7121037, 0.3960784, 1, 0, 1,
-0.5760331, 0.9712517, -0.372499, 0.3921569, 1, 0, 1,
-0.5730372, -0.07287471, -2.057335, 0.3843137, 1, 0, 1,
-0.5720218, 3.183079, -0.9383125, 0.3803922, 1, 0, 1,
-0.5693203, -0.3797967, -1.336972, 0.372549, 1, 0, 1,
-0.5656487, -0.5524337, -1.029864, 0.3686275, 1, 0, 1,
-0.5620551, 0.04960848, -0.9795378, 0.3607843, 1, 0, 1,
-0.5612428, -1.477101, -3.778526, 0.3568628, 1, 0, 1,
-0.5591552, 0.6568329, -1.742921, 0.3490196, 1, 0, 1,
-0.5583045, 0.9942577, -0.1725874, 0.345098, 1, 0, 1,
-0.558075, -0.7193485, -2.928506, 0.3372549, 1, 0, 1,
-0.5577379, -0.5570681, -0.8750984, 0.3333333, 1, 0, 1,
-0.5566397, -0.3664412, -2.448618, 0.3254902, 1, 0, 1,
-0.5559031, -0.5644186, -3.871385, 0.3215686, 1, 0, 1,
-0.5522888, -0.2896872, -1.711851, 0.3137255, 1, 0, 1,
-0.5515799, -0.1009904, 0.07310877, 0.3098039, 1, 0, 1,
-0.5483866, 1.614384, -0.4934159, 0.3019608, 1, 0, 1,
-0.5453534, 0.0457528, -1.702546, 0.2941177, 1, 0, 1,
-0.5401269, -0.7948947, -2.201266, 0.2901961, 1, 0, 1,
-0.5361955, 0.06251372, -2.172496, 0.282353, 1, 0, 1,
-0.5341729, -0.3376105, -2.74294, 0.2784314, 1, 0, 1,
-0.533784, -0.02586969, -1.064358, 0.2705882, 1, 0, 1,
-0.5322421, 0.6037209, -0.3564446, 0.2666667, 1, 0, 1,
-0.5275812, 1.663885, 0.7341599, 0.2588235, 1, 0, 1,
-0.5261002, 0.5703787, -0.8373168, 0.254902, 1, 0, 1,
-0.5225422, -0.6734442, -3.419145, 0.2470588, 1, 0, 1,
-0.5218894, 0.7272649, 0.359254, 0.2431373, 1, 0, 1,
-0.5210001, -0.841954, -1.597025, 0.2352941, 1, 0, 1,
-0.5057052, 0.07223081, -0.6936095, 0.2313726, 1, 0, 1,
-0.5024352, 1.134889, 0.009579484, 0.2235294, 1, 0, 1,
-0.5014057, 1.728269, -0.6987732, 0.2196078, 1, 0, 1,
-0.5010661, 1.228006, -0.4363093, 0.2117647, 1, 0, 1,
-0.4997906, 0.5055574, -0.007235482, 0.2078431, 1, 0, 1,
-0.499505, 1.462897, -0.5171059, 0.2, 1, 0, 1,
-0.4964266, -0.8517601, -1.789347, 0.1921569, 1, 0, 1,
-0.4937047, 0.3032011, -0.883018, 0.1882353, 1, 0, 1,
-0.4919994, 0.842689, -0.5247442, 0.1803922, 1, 0, 1,
-0.4910854, 0.8405313, -0.3849177, 0.1764706, 1, 0, 1,
-0.4909719, 0.0582991, 0.545676, 0.1686275, 1, 0, 1,
-0.4824358, 0.7186853, -1.740768, 0.1647059, 1, 0, 1,
-0.482276, 0.5774667, 0.757929, 0.1568628, 1, 0, 1,
-0.4814795, -0.3929706, -2.603474, 0.1529412, 1, 0, 1,
-0.4784824, -0.7187049, -1.479123, 0.145098, 1, 0, 1,
-0.478263, 0.2174904, -2.827767, 0.1411765, 1, 0, 1,
-0.4648218, 0.125131, -0.4936278, 0.1333333, 1, 0, 1,
-0.4530153, 0.5330594, -0.9524626, 0.1294118, 1, 0, 1,
-0.4528804, 1.438059, 1.038038, 0.1215686, 1, 0, 1,
-0.4499956, -0.6854774, -2.570378, 0.1176471, 1, 0, 1,
-0.4419285, -0.3965572, -1.83726, 0.1098039, 1, 0, 1,
-0.4384356, 1.567349, -0.05537713, 0.1058824, 1, 0, 1,
-0.4345434, 0.7180062, -0.2801668, 0.09803922, 1, 0, 1,
-0.434076, -0.8571479, -2.305098, 0.09019608, 1, 0, 1,
-0.4308369, -0.06553439, -0.7916414, 0.08627451, 1, 0, 1,
-0.4292116, -1.351641, -3.141204, 0.07843138, 1, 0, 1,
-0.4197027, 0.2337518, -0.5856882, 0.07450981, 1, 0, 1,
-0.4167042, -0.8457881, -3.722363, 0.06666667, 1, 0, 1,
-0.4135329, 0.2951704, -1.462581, 0.0627451, 1, 0, 1,
-0.4110335, -0.672226, -3.412604, 0.05490196, 1, 0, 1,
-0.4108342, 1.243821, 1.603736, 0.05098039, 1, 0, 1,
-0.3853575, -1.884697, -3.533255, 0.04313726, 1, 0, 1,
-0.3843623, 1.328185, 0.6032966, 0.03921569, 1, 0, 1,
-0.376216, 1.270212, -0.6964753, 0.03137255, 1, 0, 1,
-0.3747527, 0.3740053, 0.1480916, 0.02745098, 1, 0, 1,
-0.3742583, -0.7531399, -0.6209422, 0.01960784, 1, 0, 1,
-0.3734487, -1.087348, -1.501999, 0.01568628, 1, 0, 1,
-0.3716847, 0.9591662, -2.484751, 0.007843138, 1, 0, 1,
-0.3711212, -0.5562722, -0.4949279, 0.003921569, 1, 0, 1,
-0.3657636, 0.01937172, -1.541539, 0, 1, 0.003921569, 1,
-0.3646525, 1.902723, 0.2315279, 0, 1, 0.01176471, 1,
-0.3642183, 1.697272, 0.8948129, 0, 1, 0.01568628, 1,
-0.3612463, 0.8094889, -0.666106, 0, 1, 0.02352941, 1,
-0.3569472, -1.10567, -2.332607, 0, 1, 0.02745098, 1,
-0.3420363, 0.2254105, -0.6038952, 0, 1, 0.03529412, 1,
-0.3407594, -0.7128596, -5.057248, 0, 1, 0.03921569, 1,
-0.3363358, 1.500806, -1.8319, 0, 1, 0.04705882, 1,
-0.3342133, -0.1023961, -3.146993, 0, 1, 0.05098039, 1,
-0.3308193, -0.7956232, -3.164281, 0, 1, 0.05882353, 1,
-0.3265779, -0.212638, -3.150142, 0, 1, 0.0627451, 1,
-0.3260533, -0.8336041, -4.320652, 0, 1, 0.07058824, 1,
-0.3242732, -0.3245824, -0.9565799, 0, 1, 0.07450981, 1,
-0.3235189, 1.560794, -0.4401823, 0, 1, 0.08235294, 1,
-0.3155012, -0.2153062, -3.294162, 0, 1, 0.08627451, 1,
-0.313128, -1.404401, -3.449368, 0, 1, 0.09411765, 1,
-0.3112344, 1.167207, -0.2015024, 0, 1, 0.1019608, 1,
-0.304418, -1.120766, -0.9892669, 0, 1, 0.1058824, 1,
-0.3042535, -0.1211474, -0.1241181, 0, 1, 0.1137255, 1,
-0.3022605, -0.07029113, -1.134941, 0, 1, 0.1176471, 1,
-0.3016047, -0.3777206, -2.27989, 0, 1, 0.1254902, 1,
-0.2967517, 0.7259948, -1.089106, 0, 1, 0.1294118, 1,
-0.2966317, -0.4788927, -2.327119, 0, 1, 0.1372549, 1,
-0.2916404, -1.673285, -2.94108, 0, 1, 0.1411765, 1,
-0.2854213, -1.223418, -5.42885, 0, 1, 0.1490196, 1,
-0.2799402, 1.006547, -1.026179, 0, 1, 0.1529412, 1,
-0.2798062, 0.0143644, -0.8006708, 0, 1, 0.1607843, 1,
-0.2718262, -0.4263109, -2.216793, 0, 1, 0.1647059, 1,
-0.2701058, 0.9833186, 0.6086022, 0, 1, 0.172549, 1,
-0.2691035, 1.352196, -1.861688, 0, 1, 0.1764706, 1,
-0.2690889, 0.1242179, -0.7594966, 0, 1, 0.1843137, 1,
-0.2664062, -0.9015691, -3.087784, 0, 1, 0.1882353, 1,
-0.2650392, -0.1471968, -2.494511, 0, 1, 0.1960784, 1,
-0.2642297, 0.9894462, 0.8671616, 0, 1, 0.2039216, 1,
-0.2636487, -0.6031786, -2.679194, 0, 1, 0.2078431, 1,
-0.2630463, -0.4717698, -1.409104, 0, 1, 0.2156863, 1,
-0.2629887, -0.4131793, -3.03188, 0, 1, 0.2196078, 1,
-0.2623843, -0.6077542, -1.705336, 0, 1, 0.227451, 1,
-0.2610476, 1.964635, -0.2817263, 0, 1, 0.2313726, 1,
-0.259786, -0.2911952, -1.924342, 0, 1, 0.2392157, 1,
-0.2593418, 1.363578, 0.4758759, 0, 1, 0.2431373, 1,
-0.2569848, 0.2082167, -0.06923179, 0, 1, 0.2509804, 1,
-0.2533653, 0.1859188, -2.653331, 0, 1, 0.254902, 1,
-0.2481313, -0.5278125, -2.570329, 0, 1, 0.2627451, 1,
-0.2471332, 0.3605081, -1.112305, 0, 1, 0.2666667, 1,
-0.2410545, -0.1886094, -0.1821344, 0, 1, 0.2745098, 1,
-0.2357221, -1.811688, -1.995776, 0, 1, 0.2784314, 1,
-0.2356312, -0.09104686, -2.32526, 0, 1, 0.2862745, 1,
-0.2338088, 2.022873, -1.360294, 0, 1, 0.2901961, 1,
-0.2313292, 0.1788994, -1.507245, 0, 1, 0.2980392, 1,
-0.231088, -0.2655132, -3.419163, 0, 1, 0.3058824, 1,
-0.227978, 1.447106, -0.7809535, 0, 1, 0.3098039, 1,
-0.2188728, 2.024732, 0.5330975, 0, 1, 0.3176471, 1,
-0.216309, 1.437867, -1.007403, 0, 1, 0.3215686, 1,
-0.2160053, 0.561079, -0.6727967, 0, 1, 0.3294118, 1,
-0.2124779, -0.6109244, -1.721436, 0, 1, 0.3333333, 1,
-0.2082892, 0.1074656, -1.795926, 0, 1, 0.3411765, 1,
-0.2074794, 0.2577607, 0.757731, 0, 1, 0.345098, 1,
-0.2071006, -0.9879609, -3.011822, 0, 1, 0.3529412, 1,
-0.2070998, -1.495018, -2.687961, 0, 1, 0.3568628, 1,
-0.2042869, 1.833875, -1.230833, 0, 1, 0.3647059, 1,
-0.2032605, 0.5456922, 1.450651, 0, 1, 0.3686275, 1,
-0.2029574, -0.6334417, -2.908015, 0, 1, 0.3764706, 1,
-0.2011515, -0.3857727, -3.80388, 0, 1, 0.3803922, 1,
-0.198199, -0.612074, -3.317603, 0, 1, 0.3882353, 1,
-0.1964436, 0.3114493, -0.3349544, 0, 1, 0.3921569, 1,
-0.1961437, -1.657503, -2.457094, 0, 1, 0.4, 1,
-0.1903433, -0.0128068, -1.344323, 0, 1, 0.4078431, 1,
-0.1894148, -0.1691643, -3.410855, 0, 1, 0.4117647, 1,
-0.18934, -0.2760033, -1.596091, 0, 1, 0.4196078, 1,
-0.1842957, 0.36809, 0.3063021, 0, 1, 0.4235294, 1,
-0.1797786, 0.4887213, 0.05239239, 0, 1, 0.4313726, 1,
-0.1787585, -2.474376, -1.642529, 0, 1, 0.4352941, 1,
-0.1775143, 0.3566266, -0.4311163, 0, 1, 0.4431373, 1,
-0.176542, -1.177088, -3.114751, 0, 1, 0.4470588, 1,
-0.1759604, 1.431217, -1.179265, 0, 1, 0.454902, 1,
-0.173603, 0.2316354, 1.201989, 0, 1, 0.4588235, 1,
-0.1709469, 1.945349, 0.8647578, 0, 1, 0.4666667, 1,
-0.168008, -1.277014, -4.06122, 0, 1, 0.4705882, 1,
-0.1656551, 2.151471, -0.1437425, 0, 1, 0.4784314, 1,
-0.163758, -0.6133388, -3.587009, 0, 1, 0.4823529, 1,
-0.1633268, -0.9409092, -3.626644, 0, 1, 0.4901961, 1,
-0.162038, -0.1669369, -3.21228, 0, 1, 0.4941176, 1,
-0.1588322, 1.765341, -0.0738295, 0, 1, 0.5019608, 1,
-0.1544712, 3.042155, -0.2912868, 0, 1, 0.509804, 1,
-0.1538477, 1.901855, -0.4020049, 0, 1, 0.5137255, 1,
-0.1489303, 0.5504723, 1.22281, 0, 1, 0.5215687, 1,
-0.1477055, 1.179797, -1.001791, 0, 1, 0.5254902, 1,
-0.1436906, 0.1740126, -1.82442, 0, 1, 0.5333334, 1,
-0.1301257, -0.2962948, -1.073112, 0, 1, 0.5372549, 1,
-0.1255981, -0.4573561, -3.194102, 0, 1, 0.5450981, 1,
-0.1232905, -0.4073609, -2.448278, 0, 1, 0.5490196, 1,
-0.1191123, 1.741491, -2.037264, 0, 1, 0.5568628, 1,
-0.1170136, 1.926968, 1.494283, 0, 1, 0.5607843, 1,
-0.1144679, -0.3117224, -1.073578, 0, 1, 0.5686275, 1,
-0.11353, -0.5532882, -1.444256, 0, 1, 0.572549, 1,
-0.1106447, -2.241165, -1.373798, 0, 1, 0.5803922, 1,
-0.1100456, -1.449046, -4.594439, 0, 1, 0.5843138, 1,
-0.1067323, 1.269966, -0.2478587, 0, 1, 0.5921569, 1,
-0.1032767, -1.387973, -2.290428, 0, 1, 0.5960785, 1,
-0.1030894, 0.09924482, -2.093637, 0, 1, 0.6039216, 1,
-0.1008149, 0.3129365, 0.1435622, 0, 1, 0.6117647, 1,
-0.09972621, 1.789568, -0.4616598, 0, 1, 0.6156863, 1,
-0.09900226, -0.1023875, -1.599788, 0, 1, 0.6235294, 1,
-0.09677925, -0.4092913, -4.150544, 0, 1, 0.627451, 1,
-0.09631418, -1.163506, -3.481177, 0, 1, 0.6352941, 1,
-0.0918807, -0.6469579, -2.18498, 0, 1, 0.6392157, 1,
-0.08908246, -0.1423901, -3.6281, 0, 1, 0.6470588, 1,
-0.08716954, -0.5211077, -2.474053, 0, 1, 0.6509804, 1,
-0.08659511, 0.179007, 0.1247754, 0, 1, 0.6588235, 1,
-0.08603172, -0.6007546, -2.820624, 0, 1, 0.6627451, 1,
-0.08471853, 0.9009382, 0.5657858, 0, 1, 0.6705883, 1,
-0.08319192, 0.2267104, 0.2825739, 0, 1, 0.6745098, 1,
-0.08080076, 0.2848993, 0.6893189, 0, 1, 0.682353, 1,
-0.07894952, 1.189197, -1.783391, 0, 1, 0.6862745, 1,
-0.07801439, 0.3403084, 0.0002500811, 0, 1, 0.6941177, 1,
-0.07780877, 0.7110679, -1.578593, 0, 1, 0.7019608, 1,
-0.07744299, 0.3524863, -0.663838, 0, 1, 0.7058824, 1,
-0.07670014, -1.059375, -4.266498, 0, 1, 0.7137255, 1,
-0.07204872, -0.3742865, -2.001255, 0, 1, 0.7176471, 1,
-0.06902053, 1.085921, -0.4612042, 0, 1, 0.7254902, 1,
-0.06654505, -0.2604124, -4.084109, 0, 1, 0.7294118, 1,
-0.06626667, -0.3745497, -0.6545507, 0, 1, 0.7372549, 1,
-0.06613678, -1.563486, -3.392215, 0, 1, 0.7411765, 1,
-0.06406112, 0.6611506, -1.271031, 0, 1, 0.7490196, 1,
-0.06087057, -0.2964524, -3.697069, 0, 1, 0.7529412, 1,
-0.05465721, -1.208899, -3.783075, 0, 1, 0.7607843, 1,
-0.05229428, 0.05950662, -1.848089, 0, 1, 0.7647059, 1,
-0.04876339, -1.819507, -2.582909, 0, 1, 0.772549, 1,
-0.04722288, 1.151189, -2.21275, 0, 1, 0.7764706, 1,
-0.04600923, 0.5503671, -1.716649, 0, 1, 0.7843137, 1,
-0.04577507, 0.1737689, -1.068655, 0, 1, 0.7882353, 1,
-0.04195599, 2.19883, 0.4083566, 0, 1, 0.7960784, 1,
-0.03719438, 1.247074, -0.2578121, 0, 1, 0.8039216, 1,
-0.03638537, 0.8626179, -1.091647, 0, 1, 0.8078431, 1,
-0.034968, 0.530376, -1.138662, 0, 1, 0.8156863, 1,
-0.03409429, -0.05076988, -4.120913, 0, 1, 0.8196079, 1,
-0.03135975, 0.1714278, 2.854563, 0, 1, 0.827451, 1,
-0.03020998, 1.577564, 0.554063, 0, 1, 0.8313726, 1,
-0.02725474, 0.08870415, -0.8484827, 0, 1, 0.8392157, 1,
-0.02323047, -0.992029, -1.098619, 0, 1, 0.8431373, 1,
-0.02181923, 0.6926689, -1.50026, 0, 1, 0.8509804, 1,
-0.02026756, -0.5698398, -3.339448, 0, 1, 0.854902, 1,
-0.01853315, -0.8041153, -1.456643, 0, 1, 0.8627451, 1,
-0.01720597, -0.3706356, -3.360723, 0, 1, 0.8666667, 1,
-0.01097581, 1.018596, -0.5968962, 0, 1, 0.8745098, 1,
-0.006192807, -0.06575348, -2.637413, 0, 1, 0.8784314, 1,
-0.003248701, -1.242502, -2.746309, 0, 1, 0.8862745, 1,
-0.00182522, -0.700049, -3.43115, 0, 1, 0.8901961, 1,
0.0001427254, 0.4803765, -2.218757, 0, 1, 0.8980392, 1,
0.008753798, 1.243553, -0.6511497, 0, 1, 0.9058824, 1,
0.009948547, -0.6920565, 1.784262, 0, 1, 0.9098039, 1,
0.01084922, 1.37636, -1.151323, 0, 1, 0.9176471, 1,
0.01099379, -0.5731203, 3.929903, 0, 1, 0.9215686, 1,
0.01600518, 0.2378357, -0.5149919, 0, 1, 0.9294118, 1,
0.02185779, -0.7476591, 3.051259, 0, 1, 0.9333333, 1,
0.02290061, -0.03490359, 1.9774, 0, 1, 0.9411765, 1,
0.03180483, -0.08079611, 3.540765, 0, 1, 0.945098, 1,
0.03798866, 0.8960449, 0.1994258, 0, 1, 0.9529412, 1,
0.04008929, -0.7930944, 5.041386, 0, 1, 0.9568627, 1,
0.04197454, 0.4953471, 0.06177332, 0, 1, 0.9647059, 1,
0.05181406, 0.7466654, -1.114946, 0, 1, 0.9686275, 1,
0.05227816, 0.5208484, -2.344182, 0, 1, 0.9764706, 1,
0.05267267, 2.453, 0.7371426, 0, 1, 0.9803922, 1,
0.05380729, 0.2564822, -0.5483567, 0, 1, 0.9882353, 1,
0.05671634, 0.8026246, -0.0863104, 0, 1, 0.9921569, 1,
0.06196822, -0.6514931, 2.887173, 0, 1, 1, 1,
0.06613175, 1.039688, 0.762227, 0, 0.9921569, 1, 1,
0.07069957, 1.632002, -0.476055, 0, 0.9882353, 1, 1,
0.07072344, -0.955381, 5.052106, 0, 0.9803922, 1, 1,
0.07194738, -0.8155544, 1.007872, 0, 0.9764706, 1, 1,
0.07607104, -0.3214392, 3.658578, 0, 0.9686275, 1, 1,
0.07777821, -0.2079654, 2.888086, 0, 0.9647059, 1, 1,
0.07942509, 0.08831248, 0.7101009, 0, 0.9568627, 1, 1,
0.08027788, -0.03258153, 3.662806, 0, 0.9529412, 1, 1,
0.08501623, -0.2663181, 1.934015, 0, 0.945098, 1, 1,
0.08683188, -0.7069526, 3.685481, 0, 0.9411765, 1, 1,
0.08691237, -0.6416316, 1.261253, 0, 0.9333333, 1, 1,
0.08866513, -0.6399953, 2.512637, 0, 0.9294118, 1, 1,
0.0915069, 2.472502, -0.6782717, 0, 0.9215686, 1, 1,
0.09266225, 0.8728263, 0.6160741, 0, 0.9176471, 1, 1,
0.09401359, -0.1140766, 2.630276, 0, 0.9098039, 1, 1,
0.09693538, -0.8366333, 2.721577, 0, 0.9058824, 1, 1,
0.1049975, -0.6928077, 4.481151, 0, 0.8980392, 1, 1,
0.1071866, -0.2172684, 2.751033, 0, 0.8901961, 1, 1,
0.1140724, -1.500521, 1.571511, 0, 0.8862745, 1, 1,
0.1150733, -0.2622715, 3.582239, 0, 0.8784314, 1, 1,
0.1162914, 1.176989, 1.423763, 0, 0.8745098, 1, 1,
0.1169693, -0.7235306, 1.672321, 0, 0.8666667, 1, 1,
0.1177043, 0.5340547, -1.503334, 0, 0.8627451, 1, 1,
0.1193112, -1.273495, 2.349734, 0, 0.854902, 1, 1,
0.1201942, -0.4205011, 2.305985, 0, 0.8509804, 1, 1,
0.1224114, -1.55449, 2.219509, 0, 0.8431373, 1, 1,
0.1226851, -0.02609431, 2.983232, 0, 0.8392157, 1, 1,
0.1274188, 0.7687218, 0.9713358, 0, 0.8313726, 1, 1,
0.1295379, -0.9966412, 2.313054, 0, 0.827451, 1, 1,
0.1297139, 0.8681923, 0.4604613, 0, 0.8196079, 1, 1,
0.1308923, 0.3593938, 0.5068564, 0, 0.8156863, 1, 1,
0.1319799, 2.470628, 0.07389731, 0, 0.8078431, 1, 1,
0.1334205, 1.715312, 1.748207, 0, 0.8039216, 1, 1,
0.135508, -0.1544722, 3.015573, 0, 0.7960784, 1, 1,
0.1373295, -0.216269, 2.574812, 0, 0.7882353, 1, 1,
0.1384598, 0.05197737, 3.25034, 0, 0.7843137, 1, 1,
0.1394408, -0.4771079, 2.796915, 0, 0.7764706, 1, 1,
0.1402246, 0.06445277, -1.39647, 0, 0.772549, 1, 1,
0.1405173, -0.2313113, 3.278211, 0, 0.7647059, 1, 1,
0.1437227, 0.1884269, 2.475871, 0, 0.7607843, 1, 1,
0.1458807, -0.7302494, 2.698213, 0, 0.7529412, 1, 1,
0.1498241, -0.1255087, 1.712583, 0, 0.7490196, 1, 1,
0.1544862, 0.5468379, 0.6311057, 0, 0.7411765, 1, 1,
0.1582676, 0.63095, 0.8620645, 0, 0.7372549, 1, 1,
0.1604006, 0.9782506, 2.698522, 0, 0.7294118, 1, 1,
0.1666032, -0.8452427, 3.173065, 0, 0.7254902, 1, 1,
0.1668481, 1.682202, 2.735385, 0, 0.7176471, 1, 1,
0.1689997, -0.6170145, 3.618014, 0, 0.7137255, 1, 1,
0.1739095, 0.6255664, 1.149845, 0, 0.7058824, 1, 1,
0.1741031, -0.3589307, 3.043078, 0, 0.6980392, 1, 1,
0.1753217, 0.1832994, -0.2383716, 0, 0.6941177, 1, 1,
0.1810557, -0.2800173, 5.148253, 0, 0.6862745, 1, 1,
0.1827806, -0.6667897, 4.316937, 0, 0.682353, 1, 1,
0.1848339, 0.8147154, -0.940559, 0, 0.6745098, 1, 1,
0.1850721, 0.3542711, 1.198839, 0, 0.6705883, 1, 1,
0.1871337, 0.06643819, 0.730188, 0, 0.6627451, 1, 1,
0.1883223, -0.3916432, 2.613011, 0, 0.6588235, 1, 1,
0.1906091, 0.2720349, -0.3245099, 0, 0.6509804, 1, 1,
0.1920668, -0.1260152, 4.045661, 0, 0.6470588, 1, 1,
0.1928831, -0.5154651, 0.8284056, 0, 0.6392157, 1, 1,
0.196515, 0.7093596, 0.6529297, 0, 0.6352941, 1, 1,
0.1968227, -0.1455478, 2.278008, 0, 0.627451, 1, 1,
0.1995508, -0.4909668, 2.755514, 0, 0.6235294, 1, 1,
0.1997226, -1.220254, 1.053774, 0, 0.6156863, 1, 1,
0.2008177, 0.9832985, -0.4643415, 0, 0.6117647, 1, 1,
0.2069871, 0.7513311, 3.153606, 0, 0.6039216, 1, 1,
0.207666, -0.5417552, 2.694957, 0, 0.5960785, 1, 1,
0.2088838, -1.464924, 1.746964, 0, 0.5921569, 1, 1,
0.2138646, 1.166428, -0.5438562, 0, 0.5843138, 1, 1,
0.2156838, -0.4234622, 3.556965, 0, 0.5803922, 1, 1,
0.2166033, 0.06757461, 0.8625905, 0, 0.572549, 1, 1,
0.2174114, 1.053603, -0.2829472, 0, 0.5686275, 1, 1,
0.2278418, 0.09957003, 0.9755497, 0, 0.5607843, 1, 1,
0.230006, -0.102446, 1.818676, 0, 0.5568628, 1, 1,
0.2316841, -0.04782362, 1.620086, 0, 0.5490196, 1, 1,
0.2354518, -0.5500242, 2.145422, 0, 0.5450981, 1, 1,
0.235889, -0.3588268, 6.248337, 0, 0.5372549, 1, 1,
0.2406681, 1.727959, 1.358854, 0, 0.5333334, 1, 1,
0.2410354, 2.234041, 1.586182, 0, 0.5254902, 1, 1,
0.2413704, 0.9015251, 0.2999192, 0, 0.5215687, 1, 1,
0.2416398, -0.464177, 0.8542815, 0, 0.5137255, 1, 1,
0.2417469, -0.391447, 2.213133, 0, 0.509804, 1, 1,
0.2425522, -1.856325, 3.70015, 0, 0.5019608, 1, 1,
0.2437087, -0.3915468, 3.567921, 0, 0.4941176, 1, 1,
0.2494597, -0.8566794, 2.412881, 0, 0.4901961, 1, 1,
0.2561034, 0.8198029, -0.3720397, 0, 0.4823529, 1, 1,
0.2579099, 1.35427, 0.3761902, 0, 0.4784314, 1, 1,
0.2582702, -1.026469, 2.752266, 0, 0.4705882, 1, 1,
0.2584873, -0.2784149, 0.4726633, 0, 0.4666667, 1, 1,
0.2597283, -0.6638927, 3.883062, 0, 0.4588235, 1, 1,
0.2607812, -0.5215387, 1.75592, 0, 0.454902, 1, 1,
0.268672, -0.7835213, 3.827825, 0, 0.4470588, 1, 1,
0.2795545, 0.09745657, 2.134374, 0, 0.4431373, 1, 1,
0.2809448, 0.01997486, -1.070464, 0, 0.4352941, 1, 1,
0.2818215, -0.6015114, 2.719011, 0, 0.4313726, 1, 1,
0.2868572, 0.4885799, 0.7679078, 0, 0.4235294, 1, 1,
0.2980675, -0.134539, 1.884881, 0, 0.4196078, 1, 1,
0.2982493, -1.373746, 2.756183, 0, 0.4117647, 1, 1,
0.3002052, -0.2472741, 2.526845, 0, 0.4078431, 1, 1,
0.3005683, -0.3033299, 2.618519, 0, 0.4, 1, 1,
0.3023527, -1.716924, 3.163993, 0, 0.3921569, 1, 1,
0.3024247, 0.9910282, -0.8811183, 0, 0.3882353, 1, 1,
0.3118087, 1.302451, -1.110917, 0, 0.3803922, 1, 1,
0.3120489, -0.8215952, 2.915774, 0, 0.3764706, 1, 1,
0.3148452, 0.3749157, 3.642853, 0, 0.3686275, 1, 1,
0.317263, -0.7460435, 1.407721, 0, 0.3647059, 1, 1,
0.3202457, -1.03947, 3.709819, 0, 0.3568628, 1, 1,
0.3215604, -0.07634851, 0.1907206, 0, 0.3529412, 1, 1,
0.3238503, -0.6472019, 4.352276, 0, 0.345098, 1, 1,
0.3259387, 0.09906694, 0.9646394, 0, 0.3411765, 1, 1,
0.326119, -0.6151393, 3.243762, 0, 0.3333333, 1, 1,
0.3270228, 2.068088, -1.103502, 0, 0.3294118, 1, 1,
0.3273286, 2.131117, -0.3659776, 0, 0.3215686, 1, 1,
0.3280407, 0.3074975, 0.3686629, 0, 0.3176471, 1, 1,
0.3284687, -0.324779, 3.468826, 0, 0.3098039, 1, 1,
0.3293348, -0.4493542, 3.805984, 0, 0.3058824, 1, 1,
0.336778, 0.6171956, 1.014279, 0, 0.2980392, 1, 1,
0.3373476, -1.260388, 1.823295, 0, 0.2901961, 1, 1,
0.3432937, 1.657622, -0.2995623, 0, 0.2862745, 1, 1,
0.3472797, 0.6350245, 0.9850179, 0, 0.2784314, 1, 1,
0.3473946, -0.6047575, 4.040475, 0, 0.2745098, 1, 1,
0.3483572, -0.9665995, 4.032614, 0, 0.2666667, 1, 1,
0.3487835, 1.138734, 0.7361422, 0, 0.2627451, 1, 1,
0.3489601, 0.321323, -0.1490064, 0, 0.254902, 1, 1,
0.3561838, 0.5740613, -1.504726, 0, 0.2509804, 1, 1,
0.356252, 0.07271471, 2.664281, 0, 0.2431373, 1, 1,
0.3587746, 0.7766718, 1.62099, 0, 0.2392157, 1, 1,
0.3594951, 0.3184947, -1.017457, 0, 0.2313726, 1, 1,
0.3603613, -1.575605, 2.566872, 0, 0.227451, 1, 1,
0.3611694, 0.8161254, 0.6852191, 0, 0.2196078, 1, 1,
0.3615443, -0.7149639, 3.322443, 0, 0.2156863, 1, 1,
0.3674764, -0.6704559, 3.616089, 0, 0.2078431, 1, 1,
0.374893, 0.4930469, -0.02654799, 0, 0.2039216, 1, 1,
0.3749616, 0.3899112, -0.751576, 0, 0.1960784, 1, 1,
0.3758475, 0.3279102, 1.413386, 0, 0.1882353, 1, 1,
0.3765602, -1.271842, 2.694649, 0, 0.1843137, 1, 1,
0.3773647, 0.1663826, 1.63234, 0, 0.1764706, 1, 1,
0.3854117, 1.736888, -0.8324178, 0, 0.172549, 1, 1,
0.385812, -0.9300882, 2.146575, 0, 0.1647059, 1, 1,
0.3883092, 0.009593667, 1.852012, 0, 0.1607843, 1, 1,
0.3916908, -0.7475822, 3.48272, 0, 0.1529412, 1, 1,
0.3925629, -0.02104385, 1.585429, 0, 0.1490196, 1, 1,
0.3956271, 1.607441, 0.5442474, 0, 0.1411765, 1, 1,
0.3980899, -1.57808, 3.250626, 0, 0.1372549, 1, 1,
0.3987385, 0.01679424, 0.3768196, 0, 0.1294118, 1, 1,
0.3990024, -0.5662953, 2.235617, 0, 0.1254902, 1, 1,
0.4001876, -0.6767966, 3.519858, 0, 0.1176471, 1, 1,
0.400605, -0.9366842, 2.888363, 0, 0.1137255, 1, 1,
0.4009835, -0.07990202, 1.220285, 0, 0.1058824, 1, 1,
0.4064031, -0.8451468, 2.59632, 0, 0.09803922, 1, 1,
0.4073516, -0.4776931, 3.457906, 0, 0.09411765, 1, 1,
0.4081655, 0.002604509, 0.568022, 0, 0.08627451, 1, 1,
0.4109225, 0.7323931, -0.2693622, 0, 0.08235294, 1, 1,
0.41235, 0.8736992, -0.7175582, 0, 0.07450981, 1, 1,
0.4125295, -1.810871, 2.963505, 0, 0.07058824, 1, 1,
0.4325172, -0.3844207, 1.925698, 0, 0.0627451, 1, 1,
0.4325276, -2.282772, 2.943256, 0, 0.05882353, 1, 1,
0.4335759, -0.3485527, 3.560305, 0, 0.05098039, 1, 1,
0.439463, -0.7983462, 4.776237, 0, 0.04705882, 1, 1,
0.4426087, 1.384444, 0.911398, 0, 0.03921569, 1, 1,
0.45011, 0.1456799, 1.434767, 0, 0.03529412, 1, 1,
0.4503717, -1.317029, 4.748526, 0, 0.02745098, 1, 1,
0.4503729, -0.5094417, 1.070376, 0, 0.02352941, 1, 1,
0.4543344, -0.328945, 2.361213, 0, 0.01568628, 1, 1,
0.4584589, 1.466416, -0.1027469, 0, 0.01176471, 1, 1,
0.4614105, 2.365297, 0.2371561, 0, 0.003921569, 1, 1,
0.4622262, -0.598836, 3.685107, 0.003921569, 0, 1, 1,
0.4647838, 1.093768, -0.4705581, 0.007843138, 0, 1, 1,
0.4665044, 1.215157, 0.264121, 0.01568628, 0, 1, 1,
0.4674053, -1.4131, 3.039985, 0.01960784, 0, 1, 1,
0.4727848, 1.300876, 1.166672, 0.02745098, 0, 1, 1,
0.4734554, 0.4289227, -1.784049, 0.03137255, 0, 1, 1,
0.4787304, -0.2280763, 2.940187, 0.03921569, 0, 1, 1,
0.4834534, 0.3635239, 0.5317711, 0.04313726, 0, 1, 1,
0.48509, -0.2560834, -0.9816071, 0.05098039, 0, 1, 1,
0.4858061, -0.05849944, 2.314668, 0.05490196, 0, 1, 1,
0.486611, -0.2570582, 3.573479, 0.0627451, 0, 1, 1,
0.4884149, 0.8525984, -0.8096563, 0.06666667, 0, 1, 1,
0.4896391, 0.9058214, 1.673069, 0.07450981, 0, 1, 1,
0.4921589, 0.1322884, 1.562137, 0.07843138, 0, 1, 1,
0.4945627, -1.674693, 3.499089, 0.08627451, 0, 1, 1,
0.4982076, -0.8849685, 4.57419, 0.09019608, 0, 1, 1,
0.5043674, 1.049353, 0.7807245, 0.09803922, 0, 1, 1,
0.5047164, -0.6409487, 1.801314, 0.1058824, 0, 1, 1,
0.5093474, 0.1942443, 2.249168, 0.1098039, 0, 1, 1,
0.5103537, -0.4975145, 3.611816, 0.1176471, 0, 1, 1,
0.5109794, -0.6840298, 2.091733, 0.1215686, 0, 1, 1,
0.5113807, 1.364284, 1.724411, 0.1294118, 0, 1, 1,
0.5132379, -0.2969709, 2.378331, 0.1333333, 0, 1, 1,
0.5137012, -0.2134612, 0.3677075, 0.1411765, 0, 1, 1,
0.518837, -1.765807, 1.933812, 0.145098, 0, 1, 1,
0.5241652, 0.9698615, -0.9845614, 0.1529412, 0, 1, 1,
0.5245605, -1.093001, 1.281973, 0.1568628, 0, 1, 1,
0.5257427, -0.6521226, 3.695456, 0.1647059, 0, 1, 1,
0.5283315, -0.7205961, 1.263207, 0.1686275, 0, 1, 1,
0.5286232, 0.5318699, 0.4562126, 0.1764706, 0, 1, 1,
0.5343612, 0.4918795, 1.020223, 0.1803922, 0, 1, 1,
0.5343879, -0.203062, 1.80394, 0.1882353, 0, 1, 1,
0.5361257, 0.5137327, 3.06136, 0.1921569, 0, 1, 1,
0.5406467, -1.783699, 4.453176, 0.2, 0, 1, 1,
0.5467904, 0.3509223, 2.036738, 0.2078431, 0, 1, 1,
0.5615759, 1.484124, 2.210799, 0.2117647, 0, 1, 1,
0.5627447, 0.6901109, 1.401489, 0.2196078, 0, 1, 1,
0.5632706, -0.1144431, 1.958901, 0.2235294, 0, 1, 1,
0.5648974, 0.9803007, -0.2114271, 0.2313726, 0, 1, 1,
0.5658868, -0.9955913, 2.336517, 0.2352941, 0, 1, 1,
0.5681977, 0.5739464, 0.2846254, 0.2431373, 0, 1, 1,
0.569899, 0.622981, -0.6779851, 0.2470588, 0, 1, 1,
0.5733035, 0.1987526, 0.9067373, 0.254902, 0, 1, 1,
0.5767001, -1.14463, 1.01041, 0.2588235, 0, 1, 1,
0.5772018, -0.8733318, 4.472481, 0.2666667, 0, 1, 1,
0.5801724, 1.66176, 0.8829907, 0.2705882, 0, 1, 1,
0.5808678, 0.1818225, 2.639369, 0.2784314, 0, 1, 1,
0.5821442, -1.092105, 2.399053, 0.282353, 0, 1, 1,
0.5821539, 0.05554387, 1.7292, 0.2901961, 0, 1, 1,
0.5834806, -0.7818524, 3.160853, 0.2941177, 0, 1, 1,
0.5934598, 0.1313047, 2.343357, 0.3019608, 0, 1, 1,
0.5965573, -0.5400063, 1.662492, 0.3098039, 0, 1, 1,
0.5968829, 0.5345863, 1.294131, 0.3137255, 0, 1, 1,
0.5980597, 0.6156569, 1.539681, 0.3215686, 0, 1, 1,
0.5981219, 0.08232931, 1.383883, 0.3254902, 0, 1, 1,
0.6028063, -0.8560732, 3.498104, 0.3333333, 0, 1, 1,
0.6065505, -0.1156037, 1.592164, 0.3372549, 0, 1, 1,
0.6138341, -1.056067, 2.264196, 0.345098, 0, 1, 1,
0.6185371, 1.044624, 2.041209, 0.3490196, 0, 1, 1,
0.6255049, -1.86063, 2.847113, 0.3568628, 0, 1, 1,
0.6267515, 0.9605373, -0.3856856, 0.3607843, 0, 1, 1,
0.6272024, -0.872878, 2.381296, 0.3686275, 0, 1, 1,
0.6329702, 0.07088282, 1.757816, 0.372549, 0, 1, 1,
0.6334302, -1.244626, 2.166273, 0.3803922, 0, 1, 1,
0.6344321, 0.8517351, -0.371253, 0.3843137, 0, 1, 1,
0.6345595, -0.9475587, 3.061289, 0.3921569, 0, 1, 1,
0.6458906, 0.5122685, 1.287151, 0.3960784, 0, 1, 1,
0.6558794, -1.295991, 2.581815, 0.4039216, 0, 1, 1,
0.6562917, -0.5009744, 2.35773, 0.4117647, 0, 1, 1,
0.660398, -0.7957616, 4.330518, 0.4156863, 0, 1, 1,
0.6626406, 1.095172, 0.7581604, 0.4235294, 0, 1, 1,
0.6655372, 1.353835, -0.2280972, 0.427451, 0, 1, 1,
0.6661474, -0.1099211, 1.721666, 0.4352941, 0, 1, 1,
0.6758454, 0.2290518, 0.343687, 0.4392157, 0, 1, 1,
0.6796612, -1.446009, 3.460671, 0.4470588, 0, 1, 1,
0.6818867, -1.771547, 1.016807, 0.4509804, 0, 1, 1,
0.6821195, 0.4274168, 0.6882997, 0.4588235, 0, 1, 1,
0.6835882, 0.7355047, -0.2896384, 0.4627451, 0, 1, 1,
0.6876379, -2.074311, 2.564799, 0.4705882, 0, 1, 1,
0.6928686, -1.239985, 1.084099, 0.4745098, 0, 1, 1,
0.6949983, 0.2231928, 1.783105, 0.4823529, 0, 1, 1,
0.6960075, 1.439567, 0.01334931, 0.4862745, 0, 1, 1,
0.6966799, -1.216631, 3.144987, 0.4941176, 0, 1, 1,
0.6995725, -1.26335, 0.7976238, 0.5019608, 0, 1, 1,
0.7005489, -0.9503678, 3.519409, 0.5058824, 0, 1, 1,
0.7018836, -0.1147092, 1.755355, 0.5137255, 0, 1, 1,
0.7054971, 0.4834507, 1.118189, 0.5176471, 0, 1, 1,
0.7065008, 0.7262421, 0.8048078, 0.5254902, 0, 1, 1,
0.7083064, -0.06708393, 1.240337, 0.5294118, 0, 1, 1,
0.7098233, 0.09970484, 2.975687, 0.5372549, 0, 1, 1,
0.7107001, 0.07278109, 1.418676, 0.5411765, 0, 1, 1,
0.7123014, 0.3286588, -0.4892829, 0.5490196, 0, 1, 1,
0.7128711, 0.5288747, 3.547461, 0.5529412, 0, 1, 1,
0.7145717, -1.008179, 3.307074, 0.5607843, 0, 1, 1,
0.7175224, -0.1330722, 0.04292539, 0.5647059, 0, 1, 1,
0.7232351, 0.4213329, 1.164676, 0.572549, 0, 1, 1,
0.7285256, 0.3578356, 1.407674, 0.5764706, 0, 1, 1,
0.7313001, 1.515835, 0.9239156, 0.5843138, 0, 1, 1,
0.7314773, 0.2147085, 3.246959, 0.5882353, 0, 1, 1,
0.7315049, -0.5310581, 2.19848, 0.5960785, 0, 1, 1,
0.7376976, -0.2489563, 1.767311, 0.6039216, 0, 1, 1,
0.7377003, 0.5140869, 0.6478822, 0.6078432, 0, 1, 1,
0.7417451, -0.23011, 1.483295, 0.6156863, 0, 1, 1,
0.7442164, 0.3098118, -0.0579396, 0.6196079, 0, 1, 1,
0.7561493, -0.4165649, 2.584403, 0.627451, 0, 1, 1,
0.760783, -1.328239, 2.647964, 0.6313726, 0, 1, 1,
0.7642387, -1.774079, 3.399737, 0.6392157, 0, 1, 1,
0.7670823, 0.7900103, 1.099507, 0.6431373, 0, 1, 1,
0.7794073, 0.1898095, 0.2254658, 0.6509804, 0, 1, 1,
0.7810664, -0.1658196, 1.980844, 0.654902, 0, 1, 1,
0.7833608, -0.9455004, 1.989265, 0.6627451, 0, 1, 1,
0.7834042, -0.3721428, 0.4032208, 0.6666667, 0, 1, 1,
0.7857862, -0.6240301, 3.47539, 0.6745098, 0, 1, 1,
0.7926306, -0.1545441, 1.734667, 0.6784314, 0, 1, 1,
0.7987205, 0.1338279, 2.128587, 0.6862745, 0, 1, 1,
0.805127, -0.02365369, 2.872137, 0.6901961, 0, 1, 1,
0.8092909, -0.760296, 4.021261, 0.6980392, 0, 1, 1,
0.8150455, 0.7456297, 1.069286, 0.7058824, 0, 1, 1,
0.8159374, 1.036057, 2.440224, 0.7098039, 0, 1, 1,
0.8263524, 1.176564, -1.066141, 0.7176471, 0, 1, 1,
0.8263749, 1.526922, -0.5408951, 0.7215686, 0, 1, 1,
0.8282107, -0.5769494, 2.257146, 0.7294118, 0, 1, 1,
0.8391007, -0.3345886, 2.184076, 0.7333333, 0, 1, 1,
0.8392658, -0.3305466, 0.499767, 0.7411765, 0, 1, 1,
0.8407818, 2.808944, 0.169489, 0.7450981, 0, 1, 1,
0.8493422, 0.2556285, 1.820596, 0.7529412, 0, 1, 1,
0.8511602, -1.379772, 2.719728, 0.7568628, 0, 1, 1,
0.8530064, -0.6060683, -0.3592074, 0.7647059, 0, 1, 1,
0.8561574, 1.182867, 1.391849, 0.7686275, 0, 1, 1,
0.8577083, -0.3187354, 2.012372, 0.7764706, 0, 1, 1,
0.8642317, -0.2835411, 2.522636, 0.7803922, 0, 1, 1,
0.8669989, 0.3066348, 1.795921, 0.7882353, 0, 1, 1,
0.8674955, -0.7438792, 0.9334053, 0.7921569, 0, 1, 1,
0.8712748, 0.6973608, 1.119348, 0.8, 0, 1, 1,
0.8784117, 0.2772762, 1.759567, 0.8078431, 0, 1, 1,
0.8800561, -0.5683912, 3.886781, 0.8117647, 0, 1, 1,
0.8826731, -0.1314433, 2.672503, 0.8196079, 0, 1, 1,
0.8833224, -1.188949, 3.81311, 0.8235294, 0, 1, 1,
0.8850971, -0.5013211, 2.112326, 0.8313726, 0, 1, 1,
0.8885779, -0.1229174, -0.2134723, 0.8352941, 0, 1, 1,
0.8892444, 1.066987, 1.513577, 0.8431373, 0, 1, 1,
0.8912849, 1.464981, 2.935231, 0.8470588, 0, 1, 1,
0.8936945, 2.103405, 1.816841, 0.854902, 0, 1, 1,
0.8998708, 0.5131581, 0.3515629, 0.8588235, 0, 1, 1,
0.9001296, -2.382647, 2.795377, 0.8666667, 0, 1, 1,
0.9061131, -1.859771, 2.247938, 0.8705882, 0, 1, 1,
0.9063071, -0.9038489, 4.477914, 0.8784314, 0, 1, 1,
0.9110705, 0.768123, -0.1862285, 0.8823529, 0, 1, 1,
0.9136284, -0.8952791, 1.778473, 0.8901961, 0, 1, 1,
0.915606, -0.3255109, 1.570286, 0.8941177, 0, 1, 1,
0.9156307, 1.785157, 1.192878, 0.9019608, 0, 1, 1,
0.9159339, 0.5056218, 0.9439458, 0.9098039, 0, 1, 1,
0.9337248, 1.384386, 2.291777, 0.9137255, 0, 1, 1,
0.9478492, -1.482872, 1.308543, 0.9215686, 0, 1, 1,
0.9483045, -1.852467, 2.898802, 0.9254902, 0, 1, 1,
0.9497897, 0.08676196, 0.8944554, 0.9333333, 0, 1, 1,
0.9534831, 0.006360951, -0.04208248, 0.9372549, 0, 1, 1,
0.9633246, -0.3429496, -0.1488552, 0.945098, 0, 1, 1,
0.96572, 1.141713, 0.9408165, 0.9490196, 0, 1, 1,
0.9667437, -1.102208, 3.587052, 0.9568627, 0, 1, 1,
0.9722855, 0.7395992, 1.61539, 0.9607843, 0, 1, 1,
0.9807771, -1.158132, 3.311731, 0.9686275, 0, 1, 1,
0.9878269, -2.436425, 2.478112, 0.972549, 0, 1, 1,
0.9887506, 2.086505, 0.3915114, 0.9803922, 0, 1, 1,
0.9905109, -0.5563203, 1.633616, 0.9843137, 0, 1, 1,
0.995613, 0.5990662, 2.365699, 0.9921569, 0, 1, 1,
0.9976511, 0.3065528, -0.7676824, 0.9960784, 0, 1, 1,
1.001333, 0.8662498, 1.386094, 1, 0, 0.9960784, 1,
1.001681, 0.1897214, 0.2347358, 1, 0, 0.9882353, 1,
1.012206, -1.62631, 3.006079, 1, 0, 0.9843137, 1,
1.01461, -0.0749674, 1.201395, 1, 0, 0.9764706, 1,
1.01513, 1.066748, 1.611344, 1, 0, 0.972549, 1,
1.024817, 0.7624851, 1.723031, 1, 0, 0.9647059, 1,
1.025036, 1.441834, 0.3234245, 1, 0, 0.9607843, 1,
1.025853, 1.191924, -1.09212, 1, 0, 0.9529412, 1,
1.032136, 0.3228747, 0.3662362, 1, 0, 0.9490196, 1,
1.038748, 0.1314267, 1.730408, 1, 0, 0.9411765, 1,
1.04473, 1.654166, -0.3262718, 1, 0, 0.9372549, 1,
1.048402, -0.2642081, 2.901851, 1, 0, 0.9294118, 1,
1.051228, -1.843296, 1.000948, 1, 0, 0.9254902, 1,
1.056909, -0.6262076, 2.586912, 1, 0, 0.9176471, 1,
1.060805, -0.8201912, 2.156984, 1, 0, 0.9137255, 1,
1.06114, -0.7812725, 2.977953, 1, 0, 0.9058824, 1,
1.061972, 1.841991, 1.324511, 1, 0, 0.9019608, 1,
1.062283, 0.1867081, 0.5414451, 1, 0, 0.8941177, 1,
1.062605, -2.4143, 4.326581, 1, 0, 0.8862745, 1,
1.066008, 1.348498, 0.752928, 1, 0, 0.8823529, 1,
1.07049, -1.66143, 3.150211, 1, 0, 0.8745098, 1,
1.071971, -0.6237223, 2.799645, 1, 0, 0.8705882, 1,
1.079049, 0.5817562, 0.8822212, 1, 0, 0.8627451, 1,
1.081199, -0.65401, 3.855408, 1, 0, 0.8588235, 1,
1.087494, -0.3952862, 1.613544, 1, 0, 0.8509804, 1,
1.089699, 0.2600387, 2.391099, 1, 0, 0.8470588, 1,
1.092621, -2.353031, 2.476829, 1, 0, 0.8392157, 1,
1.092875, 0.7874583, 0.330229, 1, 0, 0.8352941, 1,
1.096341, 1.985936, -1.101641, 1, 0, 0.827451, 1,
1.098389, 0.0527052, 2.707058, 1, 0, 0.8235294, 1,
1.103542, 1.394197, 1.754963, 1, 0, 0.8156863, 1,
1.105597, -0.6498215, 4.79556, 1, 0, 0.8117647, 1,
1.107403, -0.5256768, 2.820818, 1, 0, 0.8039216, 1,
1.118466, 1.12382, -0.3118013, 1, 0, 0.7960784, 1,
1.121712, -0.150669, 0.9933886, 1, 0, 0.7921569, 1,
1.121918, -0.8825392, 2.821081, 1, 0, 0.7843137, 1,
1.126232, -0.7460595, 1.918932, 1, 0, 0.7803922, 1,
1.13077, -1.572069, 2.620209, 1, 0, 0.772549, 1,
1.14054, -0.5028229, 2.298249, 1, 0, 0.7686275, 1,
1.140681, -0.4436283, 2.673349, 1, 0, 0.7607843, 1,
1.141262, -2.737224, 1.495709, 1, 0, 0.7568628, 1,
1.150537, 1.65271, -0.01682226, 1, 0, 0.7490196, 1,
1.165695, 2.430816, 0.2510762, 1, 0, 0.7450981, 1,
1.173002, -0.9527603, 3.340279, 1, 0, 0.7372549, 1,
1.17401, 0.6639496, 1.914492, 1, 0, 0.7333333, 1,
1.179956, 0.6799073, 1.555791, 1, 0, 0.7254902, 1,
1.183535, 0.3239153, 2.309113, 1, 0, 0.7215686, 1,
1.192365, -1.251137, 3.391575, 1, 0, 0.7137255, 1,
1.196099, 0.2998601, 0.5807443, 1, 0, 0.7098039, 1,
1.202427, -0.4085761, 1.435158, 1, 0, 0.7019608, 1,
1.207173, 1.424703, 0.1117646, 1, 0, 0.6941177, 1,
1.213651, -0.9962192, 0.7177455, 1, 0, 0.6901961, 1,
1.217865, -0.3917113, 0.8249004, 1, 0, 0.682353, 1,
1.219194, -0.07458856, 1.17757, 1, 0, 0.6784314, 1,
1.223032, 0.5089144, 1.167786, 1, 0, 0.6705883, 1,
1.24451, 1.29633, 0.003195997, 1, 0, 0.6666667, 1,
1.260288, 2.197306, 0.1385066, 1, 0, 0.6588235, 1,
1.265586, -0.4782801, 2.156077, 1, 0, 0.654902, 1,
1.265919, 0.5298625, 1.480085, 1, 0, 0.6470588, 1,
1.269164, 0.2651258, 2.465169, 1, 0, 0.6431373, 1,
1.274777, -1.384119, 2.040138, 1, 0, 0.6352941, 1,
1.282945, -0.053535, 1.981663, 1, 0, 0.6313726, 1,
1.285703, -0.4313579, 2.931757, 1, 0, 0.6235294, 1,
1.286562, 0.4517352, 2.015871, 1, 0, 0.6196079, 1,
1.297323, 0.5145157, -0.2315882, 1, 0, 0.6117647, 1,
1.305818, 0.8079431, 1.282159, 1, 0, 0.6078432, 1,
1.312249, 1.121192, -0.2857686, 1, 0, 0.6, 1,
1.320879, 0.2070294, 2.655911, 1, 0, 0.5921569, 1,
1.323438, -0.4165575, -0.05703039, 1, 0, 0.5882353, 1,
1.334369, 1.029156, 2.839146, 1, 0, 0.5803922, 1,
1.339914, 0.4452819, -1.245239, 1, 0, 0.5764706, 1,
1.342011, -0.7854249, 2.264012, 1, 0, 0.5686275, 1,
1.344283, -2.12317, 1.867057, 1, 0, 0.5647059, 1,
1.356091, 0.7776283, 2.571738, 1, 0, 0.5568628, 1,
1.365071, 2.023929, -0.4382676, 1, 0, 0.5529412, 1,
1.365123, -0.5782082, 2.430046, 1, 0, 0.5450981, 1,
1.370933, 0.5872965, 0.862767, 1, 0, 0.5411765, 1,
1.371641, -1.402737, 3.517746, 1, 0, 0.5333334, 1,
1.386633, 0.9171196, 1.452378, 1, 0, 0.5294118, 1,
1.387251, -0.3740199, 1.687355, 1, 0, 0.5215687, 1,
1.402632, 1.305478, 0.3823334, 1, 0, 0.5176471, 1,
1.402768, 1.491931, -0.07605936, 1, 0, 0.509804, 1,
1.413303, 0.758194, 1.284169, 1, 0, 0.5058824, 1,
1.429207, -0.8769517, 1.818249, 1, 0, 0.4980392, 1,
1.437415, -0.6431733, 2.411512, 1, 0, 0.4901961, 1,
1.442613, 2.667188, 0.9305401, 1, 0, 0.4862745, 1,
1.447156, 0.6091583, 0.1160793, 1, 0, 0.4784314, 1,
1.449411, -0.6229588, 2.874873, 1, 0, 0.4745098, 1,
1.464649, 0.3497216, 1.541081, 1, 0, 0.4666667, 1,
1.467118, 0.8096934, 0.9938365, 1, 0, 0.4627451, 1,
1.471275, 0.876695, 1.996211, 1, 0, 0.454902, 1,
1.476768, 2.034136, 0.2547295, 1, 0, 0.4509804, 1,
1.47952, -0.8906616, 1.100113, 1, 0, 0.4431373, 1,
1.480499, -2.211631, 3.257334, 1, 0, 0.4392157, 1,
1.484551, 0.5795668, 1.069548, 1, 0, 0.4313726, 1,
1.486996, 0.4230824, 2.44161, 1, 0, 0.427451, 1,
1.487779, -0.01331329, 4.537591, 1, 0, 0.4196078, 1,
1.499732, -0.6785777, 2.35851, 1, 0, 0.4156863, 1,
1.51035, 2.183972, -0.5404832, 1, 0, 0.4078431, 1,
1.513148, 0.1857693, 0.1236626, 1, 0, 0.4039216, 1,
1.519466, 0.05653752, 2.964895, 1, 0, 0.3960784, 1,
1.538523, -1.016922, 2.081971, 1, 0, 0.3882353, 1,
1.539367, -0.05251621, 1.57119, 1, 0, 0.3843137, 1,
1.539887, 0.203074, 1.577089, 1, 0, 0.3764706, 1,
1.543034, -1.422186, 2.026349, 1, 0, 0.372549, 1,
1.5435, 2.055534, 0.02924161, 1, 0, 0.3647059, 1,
1.555087, -1.376296, 1.921831, 1, 0, 0.3607843, 1,
1.561892, -0.2399217, 3.09733, 1, 0, 0.3529412, 1,
1.566396, -1.474612, 0.8820156, 1, 0, 0.3490196, 1,
1.575259, 0.8035857, 2.108231, 1, 0, 0.3411765, 1,
1.596272, 0.3827883, 0.5869414, 1, 0, 0.3372549, 1,
1.616348, -0.02377222, 2.933323, 1, 0, 0.3294118, 1,
1.618419, 0.9426494, 0.9970813, 1, 0, 0.3254902, 1,
1.623612, -0.4312502, 1.117595, 1, 0, 0.3176471, 1,
1.629579, -1.768157, 4.730719, 1, 0, 0.3137255, 1,
1.629957, -0.279707, 2.041826, 1, 0, 0.3058824, 1,
1.638743, -0.3167924, 1.593502, 1, 0, 0.2980392, 1,
1.649525, -0.3134241, 0.8743421, 1, 0, 0.2941177, 1,
1.661342, 1.050167, 2.248284, 1, 0, 0.2862745, 1,
1.668896, -0.9689801, 2.123378, 1, 0, 0.282353, 1,
1.677527, -0.4654871, -0.08746728, 1, 0, 0.2745098, 1,
1.67966, -1.104783, 1.806551, 1, 0, 0.2705882, 1,
1.696253, -0.0985551, 2.071115, 1, 0, 0.2627451, 1,
1.715366, -1.01066, 2.207752, 1, 0, 0.2588235, 1,
1.717731, 0.7846648, 0.8085262, 1, 0, 0.2509804, 1,
1.73777, -0.726046, 1.316793, 1, 0, 0.2470588, 1,
1.754041, -0.4656833, 1.329663, 1, 0, 0.2392157, 1,
1.764285, -0.3912089, 1.81511, 1, 0, 0.2352941, 1,
1.801979, 1.784523, 0.2218817, 1, 0, 0.227451, 1,
1.807306, -0.2567196, 3.062454, 1, 0, 0.2235294, 1,
1.820569, 1.176631, 1.679116, 1, 0, 0.2156863, 1,
1.86894, -1.183622, 2.808957, 1, 0, 0.2117647, 1,
1.872779, 0.3322626, 0.4437245, 1, 0, 0.2039216, 1,
1.873864, 1.22564, 1.578372, 1, 0, 0.1960784, 1,
1.878318, 1.620807, -3.099624, 1, 0, 0.1921569, 1,
1.881634, 0.6218089, 1.174817, 1, 0, 0.1843137, 1,
1.88803, -1.115975, 2.625152, 1, 0, 0.1803922, 1,
1.913501, 1.080891, 0.4739436, 1, 0, 0.172549, 1,
1.918859, -0.2464767, 1.267941, 1, 0, 0.1686275, 1,
1.929778, -1.568391, 2.736176, 1, 0, 0.1607843, 1,
1.96584, -1.911487, 2.00632, 1, 0, 0.1568628, 1,
1.972404, 0.09264153, 3.578815, 1, 0, 0.1490196, 1,
1.975893, -1.177069, 0.7577559, 1, 0, 0.145098, 1,
1.980706, -0.09561434, 1.180927, 1, 0, 0.1372549, 1,
2.015112, -1.832822, 2.651298, 1, 0, 0.1333333, 1,
2.044877, -0.8194243, 2.739372, 1, 0, 0.1254902, 1,
2.044966, -0.3955027, 0.9178979, 1, 0, 0.1215686, 1,
2.060223, -0.7521671, 0.9487013, 1, 0, 0.1137255, 1,
2.108082, 0.05726865, 0.6482621, 1, 0, 0.1098039, 1,
2.118605, 0.1778832, 1.469054, 1, 0, 0.1019608, 1,
2.152211, 0.5906839, 0.7943865, 1, 0, 0.09411765, 1,
2.154393, -1.425771, 1.679791, 1, 0, 0.09019608, 1,
2.171348, 0.07145876, 3.195666, 1, 0, 0.08235294, 1,
2.191759, 1.729398, -0.5594104, 1, 0, 0.07843138, 1,
2.191772, -0.515806, 1.872007, 1, 0, 0.07058824, 1,
2.20773, 0.6618814, 3.17468, 1, 0, 0.06666667, 1,
2.246149, -1.876685, 2.836646, 1, 0, 0.05882353, 1,
2.385626, -1.930454, 2.509399, 1, 0, 0.05490196, 1,
2.420165, -0.2197872, 1.037179, 1, 0, 0.04705882, 1,
2.465936, -0.0356129, 3.389103, 1, 0, 0.04313726, 1,
2.505419, 1.218972, 0.1754634, 1, 0, 0.03529412, 1,
2.619763, 0.8623509, 1.669986, 1, 0, 0.03137255, 1,
2.695318, 0.988872, -0.6580793, 1, 0, 0.02352941, 1,
2.741719, -1.199446, 1.993029, 1, 0, 0.01960784, 1,
2.745706, -0.6320319, 2.645918, 1, 0, 0.01176471, 1,
2.972663, -1.655222, 3.292978, 1, 0, 0.007843138, 1
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
-0.5209415, -3.740715, -7.408134, 0, -0.5, 0.5, 0.5,
-0.5209415, -3.740715, -7.408134, 1, -0.5, 0.5, 0.5,
-0.5209415, -3.740715, -7.408134, 1, 1.5, 0.5, 0.5,
-0.5209415, -3.740715, -7.408134, 0, 1.5, 0.5, 0.5
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
-5.198878, 0.2229276, -7.408134, 0, -0.5, 0.5, 0.5,
-5.198878, 0.2229276, -7.408134, 1, -0.5, 0.5, 0.5,
-5.198878, 0.2229276, -7.408134, 1, 1.5, 0.5, 0.5,
-5.198878, 0.2229276, -7.408134, 0, 1.5, 0.5, 0.5
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
-5.198878, -3.740715, 0.4097433, 0, -0.5, 0.5, 0.5,
-5.198878, -3.740715, 0.4097433, 1, -0.5, 0.5, 0.5,
-5.198878, -3.740715, 0.4097433, 1, 1.5, 0.5, 0.5,
-5.198878, -3.740715, 0.4097433, 0, 1.5, 0.5, 0.5
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
-4, -2.826028, -5.604008,
2, -2.826028, -5.604008,
-4, -2.826028, -5.604008,
-4, -2.978476, -5.904696,
-3, -2.826028, -5.604008,
-3, -2.978476, -5.904696,
-2, -2.826028, -5.604008,
-2, -2.978476, -5.904696,
-1, -2.826028, -5.604008,
-1, -2.978476, -5.904696,
0, -2.826028, -5.604008,
0, -2.978476, -5.904696,
1, -2.826028, -5.604008,
1, -2.978476, -5.904696,
2, -2.826028, -5.604008,
2, -2.978476, -5.904696
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
"-4",
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
-4, -3.283372, -6.506071, 0, -0.5, 0.5, 0.5,
-4, -3.283372, -6.506071, 1, -0.5, 0.5, 0.5,
-4, -3.283372, -6.506071, 1, 1.5, 0.5, 0.5,
-4, -3.283372, -6.506071, 0, 1.5, 0.5, 0.5,
-3, -3.283372, -6.506071, 0, -0.5, 0.5, 0.5,
-3, -3.283372, -6.506071, 1, -0.5, 0.5, 0.5,
-3, -3.283372, -6.506071, 1, 1.5, 0.5, 0.5,
-3, -3.283372, -6.506071, 0, 1.5, 0.5, 0.5,
-2, -3.283372, -6.506071, 0, -0.5, 0.5, 0.5,
-2, -3.283372, -6.506071, 1, -0.5, 0.5, 0.5,
-2, -3.283372, -6.506071, 1, 1.5, 0.5, 0.5,
-2, -3.283372, -6.506071, 0, 1.5, 0.5, 0.5,
-1, -3.283372, -6.506071, 0, -0.5, 0.5, 0.5,
-1, -3.283372, -6.506071, 1, -0.5, 0.5, 0.5,
-1, -3.283372, -6.506071, 1, 1.5, 0.5, 0.5,
-1, -3.283372, -6.506071, 0, 1.5, 0.5, 0.5,
0, -3.283372, -6.506071, 0, -0.5, 0.5, 0.5,
0, -3.283372, -6.506071, 1, -0.5, 0.5, 0.5,
0, -3.283372, -6.506071, 1, 1.5, 0.5, 0.5,
0, -3.283372, -6.506071, 0, 1.5, 0.5, 0.5,
1, -3.283372, -6.506071, 0, -0.5, 0.5, 0.5,
1, -3.283372, -6.506071, 1, -0.5, 0.5, 0.5,
1, -3.283372, -6.506071, 1, 1.5, 0.5, 0.5,
1, -3.283372, -6.506071, 0, 1.5, 0.5, 0.5,
2, -3.283372, -6.506071, 0, -0.5, 0.5, 0.5,
2, -3.283372, -6.506071, 1, -0.5, 0.5, 0.5,
2, -3.283372, -6.506071, 1, 1.5, 0.5, 0.5,
2, -3.283372, -6.506071, 0, 1.5, 0.5, 0.5
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
-4.119355, -2, -5.604008,
-4.119355, 3, -5.604008,
-4.119355, -2, -5.604008,
-4.299275, -2, -5.904696,
-4.119355, -1, -5.604008,
-4.299275, -1, -5.904696,
-4.119355, 0, -5.604008,
-4.299275, 0, -5.904696,
-4.119355, 1, -5.604008,
-4.299275, 1, -5.904696,
-4.119355, 2, -5.604008,
-4.299275, 2, -5.904696,
-4.119355, 3, -5.604008,
-4.299275, 3, -5.904696
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
-4.659116, -2, -6.506071, 0, -0.5, 0.5, 0.5,
-4.659116, -2, -6.506071, 1, -0.5, 0.5, 0.5,
-4.659116, -2, -6.506071, 1, 1.5, 0.5, 0.5,
-4.659116, -2, -6.506071, 0, 1.5, 0.5, 0.5,
-4.659116, -1, -6.506071, 0, -0.5, 0.5, 0.5,
-4.659116, -1, -6.506071, 1, -0.5, 0.5, 0.5,
-4.659116, -1, -6.506071, 1, 1.5, 0.5, 0.5,
-4.659116, -1, -6.506071, 0, 1.5, 0.5, 0.5,
-4.659116, 0, -6.506071, 0, -0.5, 0.5, 0.5,
-4.659116, 0, -6.506071, 1, -0.5, 0.5, 0.5,
-4.659116, 0, -6.506071, 1, 1.5, 0.5, 0.5,
-4.659116, 0, -6.506071, 0, 1.5, 0.5, 0.5,
-4.659116, 1, -6.506071, 0, -0.5, 0.5, 0.5,
-4.659116, 1, -6.506071, 1, -0.5, 0.5, 0.5,
-4.659116, 1, -6.506071, 1, 1.5, 0.5, 0.5,
-4.659116, 1, -6.506071, 0, 1.5, 0.5, 0.5,
-4.659116, 2, -6.506071, 0, -0.5, 0.5, 0.5,
-4.659116, 2, -6.506071, 1, -0.5, 0.5, 0.5,
-4.659116, 2, -6.506071, 1, 1.5, 0.5, 0.5,
-4.659116, 2, -6.506071, 0, 1.5, 0.5, 0.5,
-4.659116, 3, -6.506071, 0, -0.5, 0.5, 0.5,
-4.659116, 3, -6.506071, 1, -0.5, 0.5, 0.5,
-4.659116, 3, -6.506071, 1, 1.5, 0.5, 0.5,
-4.659116, 3, -6.506071, 0, 1.5, 0.5, 0.5
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
-4.119355, -2.826028, -4,
-4.119355, -2.826028, 6,
-4.119355, -2.826028, -4,
-4.299275, -2.978476, -4,
-4.119355, -2.826028, -2,
-4.299275, -2.978476, -2,
-4.119355, -2.826028, 0,
-4.299275, -2.978476, 0,
-4.119355, -2.826028, 2,
-4.299275, -2.978476, 2,
-4.119355, -2.826028, 4,
-4.299275, -2.978476, 4,
-4.119355, -2.826028, 6,
-4.299275, -2.978476, 6
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
"4",
"6"
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
-4.659116, -3.283372, -4, 0, -0.5, 0.5, 0.5,
-4.659116, -3.283372, -4, 1, -0.5, 0.5, 0.5,
-4.659116, -3.283372, -4, 1, 1.5, 0.5, 0.5,
-4.659116, -3.283372, -4, 0, 1.5, 0.5, 0.5,
-4.659116, -3.283372, -2, 0, -0.5, 0.5, 0.5,
-4.659116, -3.283372, -2, 1, -0.5, 0.5, 0.5,
-4.659116, -3.283372, -2, 1, 1.5, 0.5, 0.5,
-4.659116, -3.283372, -2, 0, 1.5, 0.5, 0.5,
-4.659116, -3.283372, 0, 0, -0.5, 0.5, 0.5,
-4.659116, -3.283372, 0, 1, -0.5, 0.5, 0.5,
-4.659116, -3.283372, 0, 1, 1.5, 0.5, 0.5,
-4.659116, -3.283372, 0, 0, 1.5, 0.5, 0.5,
-4.659116, -3.283372, 2, 0, -0.5, 0.5, 0.5,
-4.659116, -3.283372, 2, 1, -0.5, 0.5, 0.5,
-4.659116, -3.283372, 2, 1, 1.5, 0.5, 0.5,
-4.659116, -3.283372, 2, 0, 1.5, 0.5, 0.5,
-4.659116, -3.283372, 4, 0, -0.5, 0.5, 0.5,
-4.659116, -3.283372, 4, 1, -0.5, 0.5, 0.5,
-4.659116, -3.283372, 4, 1, 1.5, 0.5, 0.5,
-4.659116, -3.283372, 4, 0, 1.5, 0.5, 0.5,
-4.659116, -3.283372, 6, 0, -0.5, 0.5, 0.5,
-4.659116, -3.283372, 6, 1, -0.5, 0.5, 0.5,
-4.659116, -3.283372, 6, 1, 1.5, 0.5, 0.5,
-4.659116, -3.283372, 6, 0, 1.5, 0.5, 0.5
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
-4.119355, -2.826028, -5.604008,
-4.119355, 3.271883, -5.604008,
-4.119355, -2.826028, 6.423495,
-4.119355, 3.271883, 6.423495,
-4.119355, -2.826028, -5.604008,
-4.119355, -2.826028, 6.423495,
-4.119355, 3.271883, -5.604008,
-4.119355, 3.271883, 6.423495,
-4.119355, -2.826028, -5.604008,
3.077471, -2.826028, -5.604008,
-4.119355, -2.826028, 6.423495,
3.077471, -2.826028, 6.423495,
-4.119355, 3.271883, -5.604008,
3.077471, 3.271883, -5.604008,
-4.119355, 3.271883, 6.423495,
3.077471, 3.271883, 6.423495,
3.077471, -2.826028, -5.604008,
3.077471, 3.271883, -5.604008,
3.077471, -2.826028, 6.423495,
3.077471, 3.271883, 6.423495,
3.077471, -2.826028, -5.604008,
3.077471, -2.826028, 6.423495,
3.077471, 3.271883, -5.604008,
3.077471, 3.271883, 6.423495
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
var radius = 8.162041;
var distance = 36.31384;
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
mvMatrix.translate( 0.5209415, -0.2229276, -0.4097433 );
mvMatrix.scale( 1.226229, 1.44721, 0.7337316 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.31384);
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
hexanecarboxylate_io<-read.table("hexanecarboxylate_io.xyz")
```

```
## Error in read.table("hexanecarboxylate_io.xyz"): no lines available in input
```

```r
x<-hexanecarboxylate_io$V2
```

```
## Error in eval(expr, envir, enclos): object 'hexanecarboxylate_io' not found
```

```r
y<-hexanecarboxylate_io$V3
```

```
## Error in eval(expr, envir, enclos): object 'hexanecarboxylate_io' not found
```

```r
z<-hexanecarboxylate_io$V4
```

```
## Error in eval(expr, envir, enclos): object 'hexanecarboxylate_io' not found
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
-4.014546, 0.3496152, -0.8851226, 0, 0, 1, 1, 1,
-3.806764, -0.07344965, -0.1247833, 1, 0, 0, 1, 1,
-3.455278, 0.1545999, -0.7092995, 1, 0, 0, 1, 1,
-3.380219, 1.2219, -2.356658, 1, 0, 0, 1, 1,
-3.300045, -1.006483, -0.6345274, 1, 0, 0, 1, 1,
-3.084724, -1.202788, -2.89838, 1, 0, 0, 1, 1,
-2.926743, -0.8278989, -1.920091, 0, 0, 0, 1, 1,
-2.919796, 0.18639, -1.652293, 0, 0, 0, 1, 1,
-2.790173, 0.3582567, -1.655816, 0, 0, 0, 1, 1,
-2.771094, -1.091326, -0.7428393, 0, 0, 0, 1, 1,
-2.718572, -0.2889904, -1.607055, 0, 0, 0, 1, 1,
-2.712042, 0.4762595, -0.4599412, 0, 0, 0, 1, 1,
-2.645435, -2.453967, -2.855361, 0, 0, 0, 1, 1,
-2.54148, 0.6261335, -2.101668, 1, 1, 1, 1, 1,
-2.438326, 0.633594, -2.288191, 1, 1, 1, 1, 1,
-2.433174, 0.3140771, -1.49981, 1, 1, 1, 1, 1,
-2.41089, -0.7551398, -0.3115869, 1, 1, 1, 1, 1,
-2.39184, 2.169791, -0.5384523, 1, 1, 1, 1, 1,
-2.358362, -0.07706244, -2.417391, 1, 1, 1, 1, 1,
-2.335098, 0.3539526, -1.320178, 1, 1, 1, 1, 1,
-2.240113, 0.6262935, -2.089669, 1, 1, 1, 1, 1,
-2.21994, -0.6682393, -3.054599, 1, 1, 1, 1, 1,
-2.207129, 1.75702, -0.3813274, 1, 1, 1, 1, 1,
-2.162702, 0.6121088, -2.042497, 1, 1, 1, 1, 1,
-2.142587, 1.366751, 1.449628, 1, 1, 1, 1, 1,
-2.126971, 2.12392, -0.6042194, 1, 1, 1, 1, 1,
-2.125746, -0.1566305, -1.480082, 1, 1, 1, 1, 1,
-2.112297, 1.261581, -2.305823, 1, 1, 1, 1, 1,
-2.104859, -0.7691637, -2.880661, 0, 0, 1, 1, 1,
-2.073426, 0.7734389, 0.009937479, 1, 0, 0, 1, 1,
-2.022859, 0.5782821, -2.85234, 1, 0, 0, 1, 1,
-2.015254, -0.3392083, -1.450765, 1, 0, 0, 1, 1,
-1.988892, 0.8680995, -1.166331, 1, 0, 0, 1, 1,
-1.98547, -1.127472, -0.6758908, 1, 0, 0, 1, 1,
-1.952881, -2.371516, -2.78181, 0, 0, 0, 1, 1,
-1.942178, -0.7294383, -0.9708143, 0, 0, 0, 1, 1,
-1.937497, 1.563354, -0.1177208, 0, 0, 0, 1, 1,
-1.932511, 0.01242461, -1.720865, 0, 0, 0, 1, 1,
-1.932243, 0.8706418, -1.132296, 0, 0, 0, 1, 1,
-1.912354, -0.7209175, -1.577297, 0, 0, 0, 1, 1,
-1.901081, -0.5808448, -1.619982, 0, 0, 0, 1, 1,
-1.864696, 1.475732, -2.614088, 1, 1, 1, 1, 1,
-1.863594, 0.08389664, -0.7224194, 1, 1, 1, 1, 1,
-1.863236, 1.910155, 0.06140118, 1, 1, 1, 1, 1,
-1.851046, 0.03157563, -1.94326, 1, 1, 1, 1, 1,
-1.84035, 0.6130596, -0.7378777, 1, 1, 1, 1, 1,
-1.836007, -1.958798, -2.345923, 1, 1, 1, 1, 1,
-1.831772, -1.582818, -1.007642, 1, 1, 1, 1, 1,
-1.777184, -0.4877497, -1.028458, 1, 1, 1, 1, 1,
-1.768238, 1.367429, -1.156402, 1, 1, 1, 1, 1,
-1.747752, 0.09495443, -1.681196, 1, 1, 1, 1, 1,
-1.743151, 0.4814903, -1.235066, 1, 1, 1, 1, 1,
-1.738171, 0.8481184, -0.7922708, 1, 1, 1, 1, 1,
-1.711979, -2.030498, -1.792291, 1, 1, 1, 1, 1,
-1.689919, -0.2992837, -4.113375, 1, 1, 1, 1, 1,
-1.685663, 0.9000728, 0.6918444, 1, 1, 1, 1, 1,
-1.678953, 0.8406554, -0.9242229, 0, 0, 1, 1, 1,
-1.675835, 1.234681, -2.308395, 1, 0, 0, 1, 1,
-1.665444, 0.5587629, -0.1391001, 1, 0, 0, 1, 1,
-1.663651, -0.001251337, -1.169349, 1, 0, 0, 1, 1,
-1.645282, 0.1872545, -0.9540239, 1, 0, 0, 1, 1,
-1.642213, -0.4106653, -2.046544, 1, 0, 0, 1, 1,
-1.640437, 0.1818579, -0.5285136, 0, 0, 0, 1, 1,
-1.57103, 0.7476665, 0.26567, 0, 0, 0, 1, 1,
-1.570486, 1.571492, -0.8580055, 0, 0, 0, 1, 1,
-1.565082, -1.498951, -1.175721, 0, 0, 0, 1, 1,
-1.560842, 0.7731195, -0.3821424, 0, 0, 0, 1, 1,
-1.517234, 0.7056124, -1.343524, 0, 0, 0, 1, 1,
-1.511914, -0.6508899, -1.338472, 0, 0, 0, 1, 1,
-1.508958, 0.4636374, -2.760224, 1, 1, 1, 1, 1,
-1.502185, 0.8689024, -0.5835035, 1, 1, 1, 1, 1,
-1.496102, -1.339371, -2.826471, 1, 1, 1, 1, 1,
-1.49048, -1.171901, -2.669774, 1, 1, 1, 1, 1,
-1.486726, 0.2576165, -1.469474, 1, 1, 1, 1, 1,
-1.486213, 0.01342391, -0.3414197, 1, 1, 1, 1, 1,
-1.483734, 0.6352431, -2.572574, 1, 1, 1, 1, 1,
-1.463282, -0.3581946, -2.203975, 1, 1, 1, 1, 1,
-1.450173, 0.6812031, -2.068787, 1, 1, 1, 1, 1,
-1.440116, -0.1254822, -1.377704, 1, 1, 1, 1, 1,
-1.430359, -0.8890718, -1.365245, 1, 1, 1, 1, 1,
-1.42397, 0.3520635, -2.628932, 1, 1, 1, 1, 1,
-1.409717, -0.7371284, -0.992088, 1, 1, 1, 1, 1,
-1.408486, 0.215508, -1.526459, 1, 1, 1, 1, 1,
-1.40695, -0.5315103, -1.954375, 1, 1, 1, 1, 1,
-1.403862, -1.147967, -1.102957, 0, 0, 1, 1, 1,
-1.399255, -0.9273201, -2.482293, 1, 0, 0, 1, 1,
-1.398009, 0.1100404, -0.8425012, 1, 0, 0, 1, 1,
-1.397997, 0.2695459, 0.07948416, 1, 0, 0, 1, 1,
-1.396092, 1.595492, -1.204642, 1, 0, 0, 1, 1,
-1.389907, 0.8380659, -1.579746, 1, 0, 0, 1, 1,
-1.365949, -0.5027722, -1.42509, 0, 0, 0, 1, 1,
-1.356596, 0.5309566, -0.8439859, 0, 0, 0, 1, 1,
-1.350507, 0.3000615, -0.9753174, 0, 0, 0, 1, 1,
-1.349032, 1.706713, -0.7380694, 0, 0, 0, 1, 1,
-1.342469, 1.195515, -0.9074551, 0, 0, 0, 1, 1,
-1.339646, 2.289295, 1.008378, 0, 0, 0, 1, 1,
-1.337214, -1.378675, -3.249573, 0, 0, 0, 1, 1,
-1.318877, 1.619416, -1.296693, 1, 1, 1, 1, 1,
-1.317327, 0.2496364, -2.640848, 1, 1, 1, 1, 1,
-1.304928, 1.259574, -0.3902073, 1, 1, 1, 1, 1,
-1.29816, -1.150116, -2.282757, 1, 1, 1, 1, 1,
-1.275918, -0.4422571, -1.483557, 1, 1, 1, 1, 1,
-1.26773, -0.2957398, -1.768819, 1, 1, 1, 1, 1,
-1.260683, 0.3401805, -1.816539, 1, 1, 1, 1, 1,
-1.258824, 0.05568681, -3.400732, 1, 1, 1, 1, 1,
-1.25386, 0.7663375, -1.057839, 1, 1, 1, 1, 1,
-1.249081, 0.26765, -0.418293, 1, 1, 1, 1, 1,
-1.241076, 0.6501527, -0.9664668, 1, 1, 1, 1, 1,
-1.2328, 0.9491307, -0.9697745, 1, 1, 1, 1, 1,
-1.228491, -1.341277, -1.651106, 1, 1, 1, 1, 1,
-1.220171, -0.6096686, -3.172654, 1, 1, 1, 1, 1,
-1.213826, 0.6140084, -0.6851534, 1, 1, 1, 1, 1,
-1.211433, 0.005817405, -1.586316, 0, 0, 1, 1, 1,
-1.204731, -0.1327644, -0.6025169, 1, 0, 0, 1, 1,
-1.20024, -0.8074356, -0.6302607, 1, 0, 0, 1, 1,
-1.189811, 1.681477, 0.8122248, 1, 0, 0, 1, 1,
-1.187043, 1.208474, -1.522795, 1, 0, 0, 1, 1,
-1.182789, -0.4053898, -4.558774, 1, 0, 0, 1, 1,
-1.182381, -1.831884, -0.6893004, 0, 0, 0, 1, 1,
-1.168065, 0.7953743, -1.284282, 0, 0, 0, 1, 1,
-1.165542, 0.7766201, -1.904089, 0, 0, 0, 1, 1,
-1.156042, -1.742571, 0.0249846, 0, 0, 0, 1, 1,
-1.154259, -0.0173778, -1.774995, 0, 0, 0, 1, 1,
-1.151175, 0.9420432, -1.28235, 0, 0, 0, 1, 1,
-1.149818, -0.2937812, -0.6207618, 0, 0, 0, 1, 1,
-1.149609, 1.88025, -0.5982988, 1, 1, 1, 1, 1,
-1.128401, -0.3181224, -0.8992371, 1, 1, 1, 1, 1,
-1.127051, 2.224873, -0.5152617, 1, 1, 1, 1, 1,
-1.126675, -0.8775405, -2.33115, 1, 1, 1, 1, 1,
-1.124397, 1.138697, 1.527071, 1, 1, 1, 1, 1,
-1.116039, -0.7710546, -2.346239, 1, 1, 1, 1, 1,
-1.101817, -1.876787, -3.161248, 1, 1, 1, 1, 1,
-1.086299, -0.1050105, -0.3198592, 1, 1, 1, 1, 1,
-1.083275, 0.4350144, -1.424946, 1, 1, 1, 1, 1,
-1.067005, -0.72701, -0.6861141, 1, 1, 1, 1, 1,
-1.060482, 0.4356392, 0.8607625, 1, 1, 1, 1, 1,
-1.059929, -1.645099, -2.117184, 1, 1, 1, 1, 1,
-1.059795, 1.760056, -0.3495426, 1, 1, 1, 1, 1,
-1.056594, 0.6403744, -1.404663, 1, 1, 1, 1, 1,
-1.056443, -0.8089231, -3.065569, 1, 1, 1, 1, 1,
-1.052991, 0.8946239, -0.9803592, 0, 0, 1, 1, 1,
-1.047588, -1.007632, -3.003492, 1, 0, 0, 1, 1,
-1.04043, -0.05303425, -1.096855, 1, 0, 0, 1, 1,
-1.039638, 0.7599484, -1.573999, 1, 0, 0, 1, 1,
-1.036443, 1.332418, -1.64712, 1, 0, 0, 1, 1,
-1.034445, 0.4886142, -0.6348761, 1, 0, 0, 1, 1,
-1.03012, -0.205992, -1.934605, 0, 0, 0, 1, 1,
-1.030001, -0.1330488, -2.067382, 0, 0, 0, 1, 1,
-1.027941, 1.499674, 1.052325, 0, 0, 0, 1, 1,
-1.022153, 0.4821707, -0.8100818, 0, 0, 0, 1, 1,
-1.017248, -0.9188854, -1.359335, 0, 0, 0, 1, 1,
-1.013197, -0.855709, -2.150594, 0, 0, 0, 1, 1,
-1.012913, -0.6543862, -2.214596, 0, 0, 0, 1, 1,
-1.012152, -0.2083748, -0.3353446, 1, 1, 1, 1, 1,
-1.007363, 0.2585559, -1.787731, 1, 1, 1, 1, 1,
-1.006135, -1.10821, -1.897557, 1, 1, 1, 1, 1,
-1.003379, 0.9736779, -1.131705, 1, 1, 1, 1, 1,
-1.00247, 0.6894991, 0.1830151, 1, 1, 1, 1, 1,
-0.9923882, -0.2390103, -2.287499, 1, 1, 1, 1, 1,
-0.9921369, -0.02087763, -2.081449, 1, 1, 1, 1, 1,
-0.9821082, -1.49621, -3.238114, 1, 1, 1, 1, 1,
-0.9659038, 0.5420685, -0.9124498, 1, 1, 1, 1, 1,
-0.9640778, -0.567992, -0.7713603, 1, 1, 1, 1, 1,
-0.9578471, -0.304795, -1.04451, 1, 1, 1, 1, 1,
-0.9577622, -0.8696558, -4.242304, 1, 1, 1, 1, 1,
-0.9526549, 1.110111, -0.2538414, 1, 1, 1, 1, 1,
-0.9522693, -0.05469545, -1.937424, 1, 1, 1, 1, 1,
-0.9501654, 0.4884875, 0.438323, 1, 1, 1, 1, 1,
-0.9406739, 0.127341, -3.227075, 0, 0, 1, 1, 1,
-0.9373792, 1.855943, -1.426925, 1, 0, 0, 1, 1,
-0.9354449, -0.5904359, -1.955233, 1, 0, 0, 1, 1,
-0.9340805, 0.8205783, -1.453878, 1, 0, 0, 1, 1,
-0.9329445, -1.196303, -3.165707, 1, 0, 0, 1, 1,
-0.9257274, 1.716935, -0.3714314, 1, 0, 0, 1, 1,
-0.9202255, -1.150491, -2.976899, 0, 0, 0, 1, 1,
-0.9152059, 0.2637173, -1.013491, 0, 0, 0, 1, 1,
-0.9104943, -0.4091429, -2.611554, 0, 0, 0, 1, 1,
-0.9065217, 0.04414017, -1.729252, 0, 0, 0, 1, 1,
-0.9057816, -1.2462, -2.31529, 0, 0, 0, 1, 1,
-0.8917107, 0.6271681, -1.216954, 0, 0, 0, 1, 1,
-0.8808243, 0.7390899, -1.824226, 0, 0, 0, 1, 1,
-0.8788556, -0.9606685, -3.012425, 1, 1, 1, 1, 1,
-0.8733512, -0.6922159, -2.789118, 1, 1, 1, 1, 1,
-0.8728223, 2.602018, -0.9894565, 1, 1, 1, 1, 1,
-0.8666732, -0.5424497, -2.427324, 1, 1, 1, 1, 1,
-0.8611754, 1.61936, -1.611722, 1, 1, 1, 1, 1,
-0.8573951, 0.5139289, 0.02982506, 1, 1, 1, 1, 1,
-0.8502703, -0.2245457, -3.793396, 1, 1, 1, 1, 1,
-0.8449564, 0.77077, -0.9441391, 1, 1, 1, 1, 1,
-0.8407971, 1.416476, -0.8983504, 1, 1, 1, 1, 1,
-0.8397986, 0.077785, -1.060013, 1, 1, 1, 1, 1,
-0.8277568, -1.233629, -1.553187, 1, 1, 1, 1, 1,
-0.8185329, 1.737961, -0.3508355, 1, 1, 1, 1, 1,
-0.8020692, -0.4222429, -2.550915, 1, 1, 1, 1, 1,
-0.801662, 0.9318354, -2.669147, 1, 1, 1, 1, 1,
-0.8015632, 0.4835698, 0.9828259, 1, 1, 1, 1, 1,
-0.8009639, 0.6618298, -0.4158743, 0, 0, 1, 1, 1,
-0.8003835, 0.6421924, -2.095016, 1, 0, 0, 1, 1,
-0.7917888, -0.2096616, -2.804992, 1, 0, 0, 1, 1,
-0.7912874, 0.5613757, -2.198587, 1, 0, 0, 1, 1,
-0.7900155, -0.3975686, -2.766376, 1, 0, 0, 1, 1,
-0.7819227, -0.03725304, -2.114012, 1, 0, 0, 1, 1,
-0.7765431, 0.1510574, -4.374727, 0, 0, 0, 1, 1,
-0.7751447, 0.6022846, -1.515417, 0, 0, 0, 1, 1,
-0.7608553, 0.5079378, -1.917253, 0, 0, 0, 1, 1,
-0.7587853, -1.068812, -3.977682, 0, 0, 0, 1, 1,
-0.7553559, 1.478513, 1.113021, 0, 0, 0, 1, 1,
-0.7528817, -1.869876, -3.10829, 0, 0, 0, 1, 1,
-0.7527235, 0.8378398, -1.23427, 0, 0, 0, 1, 1,
-0.752561, -0.609403, -1.756244, 1, 1, 1, 1, 1,
-0.7247875, -1.250199, -2.356635, 1, 1, 1, 1, 1,
-0.7237729, -1.17348, -0.3620191, 1, 1, 1, 1, 1,
-0.7226148, 0.163901, -1.076734, 1, 1, 1, 1, 1,
-0.7221065, 0.01188432, -1.969509, 1, 1, 1, 1, 1,
-0.7166055, 0.08033814, -1.114357, 1, 1, 1, 1, 1,
-0.7145498, -0.06833933, -2.675683, 1, 1, 1, 1, 1,
-0.7119542, -0.664642, -3.252377, 1, 1, 1, 1, 1,
-0.7112778, -2.019575, -3.801612, 1, 1, 1, 1, 1,
-0.7103021, 1.161287, 1.110494, 1, 1, 1, 1, 1,
-0.7085217, 1.378703, -2.302341, 1, 1, 1, 1, 1,
-0.7068968, -0.3986526, -1.253347, 1, 1, 1, 1, 1,
-0.7057628, -0.4933701, 0.7298408, 1, 1, 1, 1, 1,
-0.7057371, 1.789824, -1.735453, 1, 1, 1, 1, 1,
-0.7023864, -0.664117, -2.019, 1, 1, 1, 1, 1,
-0.7009364, 1.373461, -1.094864, 0, 0, 1, 1, 1,
-0.6872378, -0.3138812, -0.7693313, 1, 0, 0, 1, 1,
-0.6828032, -0.6184906, -2.303961, 1, 0, 0, 1, 1,
-0.6796132, -1.61936, -2.723969, 1, 0, 0, 1, 1,
-0.6791751, 0.4558344, -2.141244, 1, 0, 0, 1, 1,
-0.6669778, -1.446997, -1.123939, 1, 0, 0, 1, 1,
-0.6663893, -0.09651764, -1.194911, 0, 0, 0, 1, 1,
-0.6549482, -0.837677, -4.538108, 0, 0, 0, 1, 1,
-0.6528631, -0.2267441, -1.206072, 0, 0, 0, 1, 1,
-0.6522421, 0.2320722, -0.5684089, 0, 0, 0, 1, 1,
-0.6516903, 0.8970094, 0.5183989, 0, 0, 0, 1, 1,
-0.64701, -2.209068, -2.008047, 0, 0, 0, 1, 1,
-0.6451113, 0.03268434, -3.513522, 0, 0, 0, 1, 1,
-0.6400018, -0.540037, -1.173431, 1, 1, 1, 1, 1,
-0.6393192, -0.8633845, -2.641803, 1, 1, 1, 1, 1,
-0.6366615, -1.568983, -2.180642, 1, 1, 1, 1, 1,
-0.6331728, -0.7948483, -3.16261, 1, 1, 1, 1, 1,
-0.6327077, 0.9533928, -1.577631, 1, 1, 1, 1, 1,
-0.6280088, 0.4325856, -2.14018, 1, 1, 1, 1, 1,
-0.6279875, 0.5818571, -0.9940563, 1, 1, 1, 1, 1,
-0.6224779, 1.973655, 0.1696047, 1, 1, 1, 1, 1,
-0.6223503, 0.9496094, -1.30039, 1, 1, 1, 1, 1,
-0.6219653, 0.4068989, -1.627654, 1, 1, 1, 1, 1,
-0.6212013, -0.5180835, -1.011631, 1, 1, 1, 1, 1,
-0.6188866, 1.676794, 0.5150017, 1, 1, 1, 1, 1,
-0.6179703, 0.5976167, -0.5834033, 1, 1, 1, 1, 1,
-0.6172981, -0.4025745, -3.283901, 1, 1, 1, 1, 1,
-0.6135485, -1.018639, -2.30873, 1, 1, 1, 1, 1,
-0.6135051, -1.015509, -3.396889, 0, 0, 1, 1, 1,
-0.6120905, 0.6044285, -0.9334096, 1, 0, 0, 1, 1,
-0.6120148, 1.569414, -0.09403325, 1, 0, 0, 1, 1,
-0.6114324, 0.3624229, -0.5240587, 1, 0, 0, 1, 1,
-0.6113976, 2.278891, -0.4434605, 1, 0, 0, 1, 1,
-0.6109383, -0.8916365, -2.213362, 1, 0, 0, 1, 1,
-0.6098622, 0.9092464, -1.221304, 0, 0, 0, 1, 1,
-0.6083263, -0.8390668, -1.744612, 0, 0, 0, 1, 1,
-0.6045954, -0.203364, -1.178871, 0, 0, 0, 1, 1,
-0.6003082, -1.454766, -2.138533, 0, 0, 0, 1, 1,
-0.6001841, -1.321485, -3.780465, 0, 0, 0, 1, 1,
-0.5960407, 1.212889, -0.1452659, 0, 0, 0, 1, 1,
-0.591243, -0.7690181, -2.979666, 0, 0, 0, 1, 1,
-0.5909925, 1.634145, 1.284627, 1, 1, 1, 1, 1,
-0.5904674, -1.003289, -2.494979, 1, 1, 1, 1, 1,
-0.5855582, 0.7586049, 0.7121037, 1, 1, 1, 1, 1,
-0.5760331, 0.9712517, -0.372499, 1, 1, 1, 1, 1,
-0.5730372, -0.07287471, -2.057335, 1, 1, 1, 1, 1,
-0.5720218, 3.183079, -0.9383125, 1, 1, 1, 1, 1,
-0.5693203, -0.3797967, -1.336972, 1, 1, 1, 1, 1,
-0.5656487, -0.5524337, -1.029864, 1, 1, 1, 1, 1,
-0.5620551, 0.04960848, -0.9795378, 1, 1, 1, 1, 1,
-0.5612428, -1.477101, -3.778526, 1, 1, 1, 1, 1,
-0.5591552, 0.6568329, -1.742921, 1, 1, 1, 1, 1,
-0.5583045, 0.9942577, -0.1725874, 1, 1, 1, 1, 1,
-0.558075, -0.7193485, -2.928506, 1, 1, 1, 1, 1,
-0.5577379, -0.5570681, -0.8750984, 1, 1, 1, 1, 1,
-0.5566397, -0.3664412, -2.448618, 1, 1, 1, 1, 1,
-0.5559031, -0.5644186, -3.871385, 0, 0, 1, 1, 1,
-0.5522888, -0.2896872, -1.711851, 1, 0, 0, 1, 1,
-0.5515799, -0.1009904, 0.07310877, 1, 0, 0, 1, 1,
-0.5483866, 1.614384, -0.4934159, 1, 0, 0, 1, 1,
-0.5453534, 0.0457528, -1.702546, 1, 0, 0, 1, 1,
-0.5401269, -0.7948947, -2.201266, 1, 0, 0, 1, 1,
-0.5361955, 0.06251372, -2.172496, 0, 0, 0, 1, 1,
-0.5341729, -0.3376105, -2.74294, 0, 0, 0, 1, 1,
-0.533784, -0.02586969, -1.064358, 0, 0, 0, 1, 1,
-0.5322421, 0.6037209, -0.3564446, 0, 0, 0, 1, 1,
-0.5275812, 1.663885, 0.7341599, 0, 0, 0, 1, 1,
-0.5261002, 0.5703787, -0.8373168, 0, 0, 0, 1, 1,
-0.5225422, -0.6734442, -3.419145, 0, 0, 0, 1, 1,
-0.5218894, 0.7272649, 0.359254, 1, 1, 1, 1, 1,
-0.5210001, -0.841954, -1.597025, 1, 1, 1, 1, 1,
-0.5057052, 0.07223081, -0.6936095, 1, 1, 1, 1, 1,
-0.5024352, 1.134889, 0.009579484, 1, 1, 1, 1, 1,
-0.5014057, 1.728269, -0.6987732, 1, 1, 1, 1, 1,
-0.5010661, 1.228006, -0.4363093, 1, 1, 1, 1, 1,
-0.4997906, 0.5055574, -0.007235482, 1, 1, 1, 1, 1,
-0.499505, 1.462897, -0.5171059, 1, 1, 1, 1, 1,
-0.4964266, -0.8517601, -1.789347, 1, 1, 1, 1, 1,
-0.4937047, 0.3032011, -0.883018, 1, 1, 1, 1, 1,
-0.4919994, 0.842689, -0.5247442, 1, 1, 1, 1, 1,
-0.4910854, 0.8405313, -0.3849177, 1, 1, 1, 1, 1,
-0.4909719, 0.0582991, 0.545676, 1, 1, 1, 1, 1,
-0.4824358, 0.7186853, -1.740768, 1, 1, 1, 1, 1,
-0.482276, 0.5774667, 0.757929, 1, 1, 1, 1, 1,
-0.4814795, -0.3929706, -2.603474, 0, 0, 1, 1, 1,
-0.4784824, -0.7187049, -1.479123, 1, 0, 0, 1, 1,
-0.478263, 0.2174904, -2.827767, 1, 0, 0, 1, 1,
-0.4648218, 0.125131, -0.4936278, 1, 0, 0, 1, 1,
-0.4530153, 0.5330594, -0.9524626, 1, 0, 0, 1, 1,
-0.4528804, 1.438059, 1.038038, 1, 0, 0, 1, 1,
-0.4499956, -0.6854774, -2.570378, 0, 0, 0, 1, 1,
-0.4419285, -0.3965572, -1.83726, 0, 0, 0, 1, 1,
-0.4384356, 1.567349, -0.05537713, 0, 0, 0, 1, 1,
-0.4345434, 0.7180062, -0.2801668, 0, 0, 0, 1, 1,
-0.434076, -0.8571479, -2.305098, 0, 0, 0, 1, 1,
-0.4308369, -0.06553439, -0.7916414, 0, 0, 0, 1, 1,
-0.4292116, -1.351641, -3.141204, 0, 0, 0, 1, 1,
-0.4197027, 0.2337518, -0.5856882, 1, 1, 1, 1, 1,
-0.4167042, -0.8457881, -3.722363, 1, 1, 1, 1, 1,
-0.4135329, 0.2951704, -1.462581, 1, 1, 1, 1, 1,
-0.4110335, -0.672226, -3.412604, 1, 1, 1, 1, 1,
-0.4108342, 1.243821, 1.603736, 1, 1, 1, 1, 1,
-0.3853575, -1.884697, -3.533255, 1, 1, 1, 1, 1,
-0.3843623, 1.328185, 0.6032966, 1, 1, 1, 1, 1,
-0.376216, 1.270212, -0.6964753, 1, 1, 1, 1, 1,
-0.3747527, 0.3740053, 0.1480916, 1, 1, 1, 1, 1,
-0.3742583, -0.7531399, -0.6209422, 1, 1, 1, 1, 1,
-0.3734487, -1.087348, -1.501999, 1, 1, 1, 1, 1,
-0.3716847, 0.9591662, -2.484751, 1, 1, 1, 1, 1,
-0.3711212, -0.5562722, -0.4949279, 1, 1, 1, 1, 1,
-0.3657636, 0.01937172, -1.541539, 1, 1, 1, 1, 1,
-0.3646525, 1.902723, 0.2315279, 1, 1, 1, 1, 1,
-0.3642183, 1.697272, 0.8948129, 0, 0, 1, 1, 1,
-0.3612463, 0.8094889, -0.666106, 1, 0, 0, 1, 1,
-0.3569472, -1.10567, -2.332607, 1, 0, 0, 1, 1,
-0.3420363, 0.2254105, -0.6038952, 1, 0, 0, 1, 1,
-0.3407594, -0.7128596, -5.057248, 1, 0, 0, 1, 1,
-0.3363358, 1.500806, -1.8319, 1, 0, 0, 1, 1,
-0.3342133, -0.1023961, -3.146993, 0, 0, 0, 1, 1,
-0.3308193, -0.7956232, -3.164281, 0, 0, 0, 1, 1,
-0.3265779, -0.212638, -3.150142, 0, 0, 0, 1, 1,
-0.3260533, -0.8336041, -4.320652, 0, 0, 0, 1, 1,
-0.3242732, -0.3245824, -0.9565799, 0, 0, 0, 1, 1,
-0.3235189, 1.560794, -0.4401823, 0, 0, 0, 1, 1,
-0.3155012, -0.2153062, -3.294162, 0, 0, 0, 1, 1,
-0.313128, -1.404401, -3.449368, 1, 1, 1, 1, 1,
-0.3112344, 1.167207, -0.2015024, 1, 1, 1, 1, 1,
-0.304418, -1.120766, -0.9892669, 1, 1, 1, 1, 1,
-0.3042535, -0.1211474, -0.1241181, 1, 1, 1, 1, 1,
-0.3022605, -0.07029113, -1.134941, 1, 1, 1, 1, 1,
-0.3016047, -0.3777206, -2.27989, 1, 1, 1, 1, 1,
-0.2967517, 0.7259948, -1.089106, 1, 1, 1, 1, 1,
-0.2966317, -0.4788927, -2.327119, 1, 1, 1, 1, 1,
-0.2916404, -1.673285, -2.94108, 1, 1, 1, 1, 1,
-0.2854213, -1.223418, -5.42885, 1, 1, 1, 1, 1,
-0.2799402, 1.006547, -1.026179, 1, 1, 1, 1, 1,
-0.2798062, 0.0143644, -0.8006708, 1, 1, 1, 1, 1,
-0.2718262, -0.4263109, -2.216793, 1, 1, 1, 1, 1,
-0.2701058, 0.9833186, 0.6086022, 1, 1, 1, 1, 1,
-0.2691035, 1.352196, -1.861688, 1, 1, 1, 1, 1,
-0.2690889, 0.1242179, -0.7594966, 0, 0, 1, 1, 1,
-0.2664062, -0.9015691, -3.087784, 1, 0, 0, 1, 1,
-0.2650392, -0.1471968, -2.494511, 1, 0, 0, 1, 1,
-0.2642297, 0.9894462, 0.8671616, 1, 0, 0, 1, 1,
-0.2636487, -0.6031786, -2.679194, 1, 0, 0, 1, 1,
-0.2630463, -0.4717698, -1.409104, 1, 0, 0, 1, 1,
-0.2629887, -0.4131793, -3.03188, 0, 0, 0, 1, 1,
-0.2623843, -0.6077542, -1.705336, 0, 0, 0, 1, 1,
-0.2610476, 1.964635, -0.2817263, 0, 0, 0, 1, 1,
-0.259786, -0.2911952, -1.924342, 0, 0, 0, 1, 1,
-0.2593418, 1.363578, 0.4758759, 0, 0, 0, 1, 1,
-0.2569848, 0.2082167, -0.06923179, 0, 0, 0, 1, 1,
-0.2533653, 0.1859188, -2.653331, 0, 0, 0, 1, 1,
-0.2481313, -0.5278125, -2.570329, 1, 1, 1, 1, 1,
-0.2471332, 0.3605081, -1.112305, 1, 1, 1, 1, 1,
-0.2410545, -0.1886094, -0.1821344, 1, 1, 1, 1, 1,
-0.2357221, -1.811688, -1.995776, 1, 1, 1, 1, 1,
-0.2356312, -0.09104686, -2.32526, 1, 1, 1, 1, 1,
-0.2338088, 2.022873, -1.360294, 1, 1, 1, 1, 1,
-0.2313292, 0.1788994, -1.507245, 1, 1, 1, 1, 1,
-0.231088, -0.2655132, -3.419163, 1, 1, 1, 1, 1,
-0.227978, 1.447106, -0.7809535, 1, 1, 1, 1, 1,
-0.2188728, 2.024732, 0.5330975, 1, 1, 1, 1, 1,
-0.216309, 1.437867, -1.007403, 1, 1, 1, 1, 1,
-0.2160053, 0.561079, -0.6727967, 1, 1, 1, 1, 1,
-0.2124779, -0.6109244, -1.721436, 1, 1, 1, 1, 1,
-0.2082892, 0.1074656, -1.795926, 1, 1, 1, 1, 1,
-0.2074794, 0.2577607, 0.757731, 1, 1, 1, 1, 1,
-0.2071006, -0.9879609, -3.011822, 0, 0, 1, 1, 1,
-0.2070998, -1.495018, -2.687961, 1, 0, 0, 1, 1,
-0.2042869, 1.833875, -1.230833, 1, 0, 0, 1, 1,
-0.2032605, 0.5456922, 1.450651, 1, 0, 0, 1, 1,
-0.2029574, -0.6334417, -2.908015, 1, 0, 0, 1, 1,
-0.2011515, -0.3857727, -3.80388, 1, 0, 0, 1, 1,
-0.198199, -0.612074, -3.317603, 0, 0, 0, 1, 1,
-0.1964436, 0.3114493, -0.3349544, 0, 0, 0, 1, 1,
-0.1961437, -1.657503, -2.457094, 0, 0, 0, 1, 1,
-0.1903433, -0.0128068, -1.344323, 0, 0, 0, 1, 1,
-0.1894148, -0.1691643, -3.410855, 0, 0, 0, 1, 1,
-0.18934, -0.2760033, -1.596091, 0, 0, 0, 1, 1,
-0.1842957, 0.36809, 0.3063021, 0, 0, 0, 1, 1,
-0.1797786, 0.4887213, 0.05239239, 1, 1, 1, 1, 1,
-0.1787585, -2.474376, -1.642529, 1, 1, 1, 1, 1,
-0.1775143, 0.3566266, -0.4311163, 1, 1, 1, 1, 1,
-0.176542, -1.177088, -3.114751, 1, 1, 1, 1, 1,
-0.1759604, 1.431217, -1.179265, 1, 1, 1, 1, 1,
-0.173603, 0.2316354, 1.201989, 1, 1, 1, 1, 1,
-0.1709469, 1.945349, 0.8647578, 1, 1, 1, 1, 1,
-0.168008, -1.277014, -4.06122, 1, 1, 1, 1, 1,
-0.1656551, 2.151471, -0.1437425, 1, 1, 1, 1, 1,
-0.163758, -0.6133388, -3.587009, 1, 1, 1, 1, 1,
-0.1633268, -0.9409092, -3.626644, 1, 1, 1, 1, 1,
-0.162038, -0.1669369, -3.21228, 1, 1, 1, 1, 1,
-0.1588322, 1.765341, -0.0738295, 1, 1, 1, 1, 1,
-0.1544712, 3.042155, -0.2912868, 1, 1, 1, 1, 1,
-0.1538477, 1.901855, -0.4020049, 1, 1, 1, 1, 1,
-0.1489303, 0.5504723, 1.22281, 0, 0, 1, 1, 1,
-0.1477055, 1.179797, -1.001791, 1, 0, 0, 1, 1,
-0.1436906, 0.1740126, -1.82442, 1, 0, 0, 1, 1,
-0.1301257, -0.2962948, -1.073112, 1, 0, 0, 1, 1,
-0.1255981, -0.4573561, -3.194102, 1, 0, 0, 1, 1,
-0.1232905, -0.4073609, -2.448278, 1, 0, 0, 1, 1,
-0.1191123, 1.741491, -2.037264, 0, 0, 0, 1, 1,
-0.1170136, 1.926968, 1.494283, 0, 0, 0, 1, 1,
-0.1144679, -0.3117224, -1.073578, 0, 0, 0, 1, 1,
-0.11353, -0.5532882, -1.444256, 0, 0, 0, 1, 1,
-0.1106447, -2.241165, -1.373798, 0, 0, 0, 1, 1,
-0.1100456, -1.449046, -4.594439, 0, 0, 0, 1, 1,
-0.1067323, 1.269966, -0.2478587, 0, 0, 0, 1, 1,
-0.1032767, -1.387973, -2.290428, 1, 1, 1, 1, 1,
-0.1030894, 0.09924482, -2.093637, 1, 1, 1, 1, 1,
-0.1008149, 0.3129365, 0.1435622, 1, 1, 1, 1, 1,
-0.09972621, 1.789568, -0.4616598, 1, 1, 1, 1, 1,
-0.09900226, -0.1023875, -1.599788, 1, 1, 1, 1, 1,
-0.09677925, -0.4092913, -4.150544, 1, 1, 1, 1, 1,
-0.09631418, -1.163506, -3.481177, 1, 1, 1, 1, 1,
-0.0918807, -0.6469579, -2.18498, 1, 1, 1, 1, 1,
-0.08908246, -0.1423901, -3.6281, 1, 1, 1, 1, 1,
-0.08716954, -0.5211077, -2.474053, 1, 1, 1, 1, 1,
-0.08659511, 0.179007, 0.1247754, 1, 1, 1, 1, 1,
-0.08603172, -0.6007546, -2.820624, 1, 1, 1, 1, 1,
-0.08471853, 0.9009382, 0.5657858, 1, 1, 1, 1, 1,
-0.08319192, 0.2267104, 0.2825739, 1, 1, 1, 1, 1,
-0.08080076, 0.2848993, 0.6893189, 1, 1, 1, 1, 1,
-0.07894952, 1.189197, -1.783391, 0, 0, 1, 1, 1,
-0.07801439, 0.3403084, 0.0002500811, 1, 0, 0, 1, 1,
-0.07780877, 0.7110679, -1.578593, 1, 0, 0, 1, 1,
-0.07744299, 0.3524863, -0.663838, 1, 0, 0, 1, 1,
-0.07670014, -1.059375, -4.266498, 1, 0, 0, 1, 1,
-0.07204872, -0.3742865, -2.001255, 1, 0, 0, 1, 1,
-0.06902053, 1.085921, -0.4612042, 0, 0, 0, 1, 1,
-0.06654505, -0.2604124, -4.084109, 0, 0, 0, 1, 1,
-0.06626667, -0.3745497, -0.6545507, 0, 0, 0, 1, 1,
-0.06613678, -1.563486, -3.392215, 0, 0, 0, 1, 1,
-0.06406112, 0.6611506, -1.271031, 0, 0, 0, 1, 1,
-0.06087057, -0.2964524, -3.697069, 0, 0, 0, 1, 1,
-0.05465721, -1.208899, -3.783075, 0, 0, 0, 1, 1,
-0.05229428, 0.05950662, -1.848089, 1, 1, 1, 1, 1,
-0.04876339, -1.819507, -2.582909, 1, 1, 1, 1, 1,
-0.04722288, 1.151189, -2.21275, 1, 1, 1, 1, 1,
-0.04600923, 0.5503671, -1.716649, 1, 1, 1, 1, 1,
-0.04577507, 0.1737689, -1.068655, 1, 1, 1, 1, 1,
-0.04195599, 2.19883, 0.4083566, 1, 1, 1, 1, 1,
-0.03719438, 1.247074, -0.2578121, 1, 1, 1, 1, 1,
-0.03638537, 0.8626179, -1.091647, 1, 1, 1, 1, 1,
-0.034968, 0.530376, -1.138662, 1, 1, 1, 1, 1,
-0.03409429, -0.05076988, -4.120913, 1, 1, 1, 1, 1,
-0.03135975, 0.1714278, 2.854563, 1, 1, 1, 1, 1,
-0.03020998, 1.577564, 0.554063, 1, 1, 1, 1, 1,
-0.02725474, 0.08870415, -0.8484827, 1, 1, 1, 1, 1,
-0.02323047, -0.992029, -1.098619, 1, 1, 1, 1, 1,
-0.02181923, 0.6926689, -1.50026, 1, 1, 1, 1, 1,
-0.02026756, -0.5698398, -3.339448, 0, 0, 1, 1, 1,
-0.01853315, -0.8041153, -1.456643, 1, 0, 0, 1, 1,
-0.01720597, -0.3706356, -3.360723, 1, 0, 0, 1, 1,
-0.01097581, 1.018596, -0.5968962, 1, 0, 0, 1, 1,
-0.006192807, -0.06575348, -2.637413, 1, 0, 0, 1, 1,
-0.003248701, -1.242502, -2.746309, 1, 0, 0, 1, 1,
-0.00182522, -0.700049, -3.43115, 0, 0, 0, 1, 1,
0.0001427254, 0.4803765, -2.218757, 0, 0, 0, 1, 1,
0.008753798, 1.243553, -0.6511497, 0, 0, 0, 1, 1,
0.009948547, -0.6920565, 1.784262, 0, 0, 0, 1, 1,
0.01084922, 1.37636, -1.151323, 0, 0, 0, 1, 1,
0.01099379, -0.5731203, 3.929903, 0, 0, 0, 1, 1,
0.01600518, 0.2378357, -0.5149919, 0, 0, 0, 1, 1,
0.02185779, -0.7476591, 3.051259, 1, 1, 1, 1, 1,
0.02290061, -0.03490359, 1.9774, 1, 1, 1, 1, 1,
0.03180483, -0.08079611, 3.540765, 1, 1, 1, 1, 1,
0.03798866, 0.8960449, 0.1994258, 1, 1, 1, 1, 1,
0.04008929, -0.7930944, 5.041386, 1, 1, 1, 1, 1,
0.04197454, 0.4953471, 0.06177332, 1, 1, 1, 1, 1,
0.05181406, 0.7466654, -1.114946, 1, 1, 1, 1, 1,
0.05227816, 0.5208484, -2.344182, 1, 1, 1, 1, 1,
0.05267267, 2.453, 0.7371426, 1, 1, 1, 1, 1,
0.05380729, 0.2564822, -0.5483567, 1, 1, 1, 1, 1,
0.05671634, 0.8026246, -0.0863104, 1, 1, 1, 1, 1,
0.06196822, -0.6514931, 2.887173, 1, 1, 1, 1, 1,
0.06613175, 1.039688, 0.762227, 1, 1, 1, 1, 1,
0.07069957, 1.632002, -0.476055, 1, 1, 1, 1, 1,
0.07072344, -0.955381, 5.052106, 1, 1, 1, 1, 1,
0.07194738, -0.8155544, 1.007872, 0, 0, 1, 1, 1,
0.07607104, -0.3214392, 3.658578, 1, 0, 0, 1, 1,
0.07777821, -0.2079654, 2.888086, 1, 0, 0, 1, 1,
0.07942509, 0.08831248, 0.7101009, 1, 0, 0, 1, 1,
0.08027788, -0.03258153, 3.662806, 1, 0, 0, 1, 1,
0.08501623, -0.2663181, 1.934015, 1, 0, 0, 1, 1,
0.08683188, -0.7069526, 3.685481, 0, 0, 0, 1, 1,
0.08691237, -0.6416316, 1.261253, 0, 0, 0, 1, 1,
0.08866513, -0.6399953, 2.512637, 0, 0, 0, 1, 1,
0.0915069, 2.472502, -0.6782717, 0, 0, 0, 1, 1,
0.09266225, 0.8728263, 0.6160741, 0, 0, 0, 1, 1,
0.09401359, -0.1140766, 2.630276, 0, 0, 0, 1, 1,
0.09693538, -0.8366333, 2.721577, 0, 0, 0, 1, 1,
0.1049975, -0.6928077, 4.481151, 1, 1, 1, 1, 1,
0.1071866, -0.2172684, 2.751033, 1, 1, 1, 1, 1,
0.1140724, -1.500521, 1.571511, 1, 1, 1, 1, 1,
0.1150733, -0.2622715, 3.582239, 1, 1, 1, 1, 1,
0.1162914, 1.176989, 1.423763, 1, 1, 1, 1, 1,
0.1169693, -0.7235306, 1.672321, 1, 1, 1, 1, 1,
0.1177043, 0.5340547, -1.503334, 1, 1, 1, 1, 1,
0.1193112, -1.273495, 2.349734, 1, 1, 1, 1, 1,
0.1201942, -0.4205011, 2.305985, 1, 1, 1, 1, 1,
0.1224114, -1.55449, 2.219509, 1, 1, 1, 1, 1,
0.1226851, -0.02609431, 2.983232, 1, 1, 1, 1, 1,
0.1274188, 0.7687218, 0.9713358, 1, 1, 1, 1, 1,
0.1295379, -0.9966412, 2.313054, 1, 1, 1, 1, 1,
0.1297139, 0.8681923, 0.4604613, 1, 1, 1, 1, 1,
0.1308923, 0.3593938, 0.5068564, 1, 1, 1, 1, 1,
0.1319799, 2.470628, 0.07389731, 0, 0, 1, 1, 1,
0.1334205, 1.715312, 1.748207, 1, 0, 0, 1, 1,
0.135508, -0.1544722, 3.015573, 1, 0, 0, 1, 1,
0.1373295, -0.216269, 2.574812, 1, 0, 0, 1, 1,
0.1384598, 0.05197737, 3.25034, 1, 0, 0, 1, 1,
0.1394408, -0.4771079, 2.796915, 1, 0, 0, 1, 1,
0.1402246, 0.06445277, -1.39647, 0, 0, 0, 1, 1,
0.1405173, -0.2313113, 3.278211, 0, 0, 0, 1, 1,
0.1437227, 0.1884269, 2.475871, 0, 0, 0, 1, 1,
0.1458807, -0.7302494, 2.698213, 0, 0, 0, 1, 1,
0.1498241, -0.1255087, 1.712583, 0, 0, 0, 1, 1,
0.1544862, 0.5468379, 0.6311057, 0, 0, 0, 1, 1,
0.1582676, 0.63095, 0.8620645, 0, 0, 0, 1, 1,
0.1604006, 0.9782506, 2.698522, 1, 1, 1, 1, 1,
0.1666032, -0.8452427, 3.173065, 1, 1, 1, 1, 1,
0.1668481, 1.682202, 2.735385, 1, 1, 1, 1, 1,
0.1689997, -0.6170145, 3.618014, 1, 1, 1, 1, 1,
0.1739095, 0.6255664, 1.149845, 1, 1, 1, 1, 1,
0.1741031, -0.3589307, 3.043078, 1, 1, 1, 1, 1,
0.1753217, 0.1832994, -0.2383716, 1, 1, 1, 1, 1,
0.1810557, -0.2800173, 5.148253, 1, 1, 1, 1, 1,
0.1827806, -0.6667897, 4.316937, 1, 1, 1, 1, 1,
0.1848339, 0.8147154, -0.940559, 1, 1, 1, 1, 1,
0.1850721, 0.3542711, 1.198839, 1, 1, 1, 1, 1,
0.1871337, 0.06643819, 0.730188, 1, 1, 1, 1, 1,
0.1883223, -0.3916432, 2.613011, 1, 1, 1, 1, 1,
0.1906091, 0.2720349, -0.3245099, 1, 1, 1, 1, 1,
0.1920668, -0.1260152, 4.045661, 1, 1, 1, 1, 1,
0.1928831, -0.5154651, 0.8284056, 0, 0, 1, 1, 1,
0.196515, 0.7093596, 0.6529297, 1, 0, 0, 1, 1,
0.1968227, -0.1455478, 2.278008, 1, 0, 0, 1, 1,
0.1995508, -0.4909668, 2.755514, 1, 0, 0, 1, 1,
0.1997226, -1.220254, 1.053774, 1, 0, 0, 1, 1,
0.2008177, 0.9832985, -0.4643415, 1, 0, 0, 1, 1,
0.2069871, 0.7513311, 3.153606, 0, 0, 0, 1, 1,
0.207666, -0.5417552, 2.694957, 0, 0, 0, 1, 1,
0.2088838, -1.464924, 1.746964, 0, 0, 0, 1, 1,
0.2138646, 1.166428, -0.5438562, 0, 0, 0, 1, 1,
0.2156838, -0.4234622, 3.556965, 0, 0, 0, 1, 1,
0.2166033, 0.06757461, 0.8625905, 0, 0, 0, 1, 1,
0.2174114, 1.053603, -0.2829472, 0, 0, 0, 1, 1,
0.2278418, 0.09957003, 0.9755497, 1, 1, 1, 1, 1,
0.230006, -0.102446, 1.818676, 1, 1, 1, 1, 1,
0.2316841, -0.04782362, 1.620086, 1, 1, 1, 1, 1,
0.2354518, -0.5500242, 2.145422, 1, 1, 1, 1, 1,
0.235889, -0.3588268, 6.248337, 1, 1, 1, 1, 1,
0.2406681, 1.727959, 1.358854, 1, 1, 1, 1, 1,
0.2410354, 2.234041, 1.586182, 1, 1, 1, 1, 1,
0.2413704, 0.9015251, 0.2999192, 1, 1, 1, 1, 1,
0.2416398, -0.464177, 0.8542815, 1, 1, 1, 1, 1,
0.2417469, -0.391447, 2.213133, 1, 1, 1, 1, 1,
0.2425522, -1.856325, 3.70015, 1, 1, 1, 1, 1,
0.2437087, -0.3915468, 3.567921, 1, 1, 1, 1, 1,
0.2494597, -0.8566794, 2.412881, 1, 1, 1, 1, 1,
0.2561034, 0.8198029, -0.3720397, 1, 1, 1, 1, 1,
0.2579099, 1.35427, 0.3761902, 1, 1, 1, 1, 1,
0.2582702, -1.026469, 2.752266, 0, 0, 1, 1, 1,
0.2584873, -0.2784149, 0.4726633, 1, 0, 0, 1, 1,
0.2597283, -0.6638927, 3.883062, 1, 0, 0, 1, 1,
0.2607812, -0.5215387, 1.75592, 1, 0, 0, 1, 1,
0.268672, -0.7835213, 3.827825, 1, 0, 0, 1, 1,
0.2795545, 0.09745657, 2.134374, 1, 0, 0, 1, 1,
0.2809448, 0.01997486, -1.070464, 0, 0, 0, 1, 1,
0.2818215, -0.6015114, 2.719011, 0, 0, 0, 1, 1,
0.2868572, 0.4885799, 0.7679078, 0, 0, 0, 1, 1,
0.2980675, -0.134539, 1.884881, 0, 0, 0, 1, 1,
0.2982493, -1.373746, 2.756183, 0, 0, 0, 1, 1,
0.3002052, -0.2472741, 2.526845, 0, 0, 0, 1, 1,
0.3005683, -0.3033299, 2.618519, 0, 0, 0, 1, 1,
0.3023527, -1.716924, 3.163993, 1, 1, 1, 1, 1,
0.3024247, 0.9910282, -0.8811183, 1, 1, 1, 1, 1,
0.3118087, 1.302451, -1.110917, 1, 1, 1, 1, 1,
0.3120489, -0.8215952, 2.915774, 1, 1, 1, 1, 1,
0.3148452, 0.3749157, 3.642853, 1, 1, 1, 1, 1,
0.317263, -0.7460435, 1.407721, 1, 1, 1, 1, 1,
0.3202457, -1.03947, 3.709819, 1, 1, 1, 1, 1,
0.3215604, -0.07634851, 0.1907206, 1, 1, 1, 1, 1,
0.3238503, -0.6472019, 4.352276, 1, 1, 1, 1, 1,
0.3259387, 0.09906694, 0.9646394, 1, 1, 1, 1, 1,
0.326119, -0.6151393, 3.243762, 1, 1, 1, 1, 1,
0.3270228, 2.068088, -1.103502, 1, 1, 1, 1, 1,
0.3273286, 2.131117, -0.3659776, 1, 1, 1, 1, 1,
0.3280407, 0.3074975, 0.3686629, 1, 1, 1, 1, 1,
0.3284687, -0.324779, 3.468826, 1, 1, 1, 1, 1,
0.3293348, -0.4493542, 3.805984, 0, 0, 1, 1, 1,
0.336778, 0.6171956, 1.014279, 1, 0, 0, 1, 1,
0.3373476, -1.260388, 1.823295, 1, 0, 0, 1, 1,
0.3432937, 1.657622, -0.2995623, 1, 0, 0, 1, 1,
0.3472797, 0.6350245, 0.9850179, 1, 0, 0, 1, 1,
0.3473946, -0.6047575, 4.040475, 1, 0, 0, 1, 1,
0.3483572, -0.9665995, 4.032614, 0, 0, 0, 1, 1,
0.3487835, 1.138734, 0.7361422, 0, 0, 0, 1, 1,
0.3489601, 0.321323, -0.1490064, 0, 0, 0, 1, 1,
0.3561838, 0.5740613, -1.504726, 0, 0, 0, 1, 1,
0.356252, 0.07271471, 2.664281, 0, 0, 0, 1, 1,
0.3587746, 0.7766718, 1.62099, 0, 0, 0, 1, 1,
0.3594951, 0.3184947, -1.017457, 0, 0, 0, 1, 1,
0.3603613, -1.575605, 2.566872, 1, 1, 1, 1, 1,
0.3611694, 0.8161254, 0.6852191, 1, 1, 1, 1, 1,
0.3615443, -0.7149639, 3.322443, 1, 1, 1, 1, 1,
0.3674764, -0.6704559, 3.616089, 1, 1, 1, 1, 1,
0.374893, 0.4930469, -0.02654799, 1, 1, 1, 1, 1,
0.3749616, 0.3899112, -0.751576, 1, 1, 1, 1, 1,
0.3758475, 0.3279102, 1.413386, 1, 1, 1, 1, 1,
0.3765602, -1.271842, 2.694649, 1, 1, 1, 1, 1,
0.3773647, 0.1663826, 1.63234, 1, 1, 1, 1, 1,
0.3854117, 1.736888, -0.8324178, 1, 1, 1, 1, 1,
0.385812, -0.9300882, 2.146575, 1, 1, 1, 1, 1,
0.3883092, 0.009593667, 1.852012, 1, 1, 1, 1, 1,
0.3916908, -0.7475822, 3.48272, 1, 1, 1, 1, 1,
0.3925629, -0.02104385, 1.585429, 1, 1, 1, 1, 1,
0.3956271, 1.607441, 0.5442474, 1, 1, 1, 1, 1,
0.3980899, -1.57808, 3.250626, 0, 0, 1, 1, 1,
0.3987385, 0.01679424, 0.3768196, 1, 0, 0, 1, 1,
0.3990024, -0.5662953, 2.235617, 1, 0, 0, 1, 1,
0.4001876, -0.6767966, 3.519858, 1, 0, 0, 1, 1,
0.400605, -0.9366842, 2.888363, 1, 0, 0, 1, 1,
0.4009835, -0.07990202, 1.220285, 1, 0, 0, 1, 1,
0.4064031, -0.8451468, 2.59632, 0, 0, 0, 1, 1,
0.4073516, -0.4776931, 3.457906, 0, 0, 0, 1, 1,
0.4081655, 0.002604509, 0.568022, 0, 0, 0, 1, 1,
0.4109225, 0.7323931, -0.2693622, 0, 0, 0, 1, 1,
0.41235, 0.8736992, -0.7175582, 0, 0, 0, 1, 1,
0.4125295, -1.810871, 2.963505, 0, 0, 0, 1, 1,
0.4325172, -0.3844207, 1.925698, 0, 0, 0, 1, 1,
0.4325276, -2.282772, 2.943256, 1, 1, 1, 1, 1,
0.4335759, -0.3485527, 3.560305, 1, 1, 1, 1, 1,
0.439463, -0.7983462, 4.776237, 1, 1, 1, 1, 1,
0.4426087, 1.384444, 0.911398, 1, 1, 1, 1, 1,
0.45011, 0.1456799, 1.434767, 1, 1, 1, 1, 1,
0.4503717, -1.317029, 4.748526, 1, 1, 1, 1, 1,
0.4503729, -0.5094417, 1.070376, 1, 1, 1, 1, 1,
0.4543344, -0.328945, 2.361213, 1, 1, 1, 1, 1,
0.4584589, 1.466416, -0.1027469, 1, 1, 1, 1, 1,
0.4614105, 2.365297, 0.2371561, 1, 1, 1, 1, 1,
0.4622262, -0.598836, 3.685107, 1, 1, 1, 1, 1,
0.4647838, 1.093768, -0.4705581, 1, 1, 1, 1, 1,
0.4665044, 1.215157, 0.264121, 1, 1, 1, 1, 1,
0.4674053, -1.4131, 3.039985, 1, 1, 1, 1, 1,
0.4727848, 1.300876, 1.166672, 1, 1, 1, 1, 1,
0.4734554, 0.4289227, -1.784049, 0, 0, 1, 1, 1,
0.4787304, -0.2280763, 2.940187, 1, 0, 0, 1, 1,
0.4834534, 0.3635239, 0.5317711, 1, 0, 0, 1, 1,
0.48509, -0.2560834, -0.9816071, 1, 0, 0, 1, 1,
0.4858061, -0.05849944, 2.314668, 1, 0, 0, 1, 1,
0.486611, -0.2570582, 3.573479, 1, 0, 0, 1, 1,
0.4884149, 0.8525984, -0.8096563, 0, 0, 0, 1, 1,
0.4896391, 0.9058214, 1.673069, 0, 0, 0, 1, 1,
0.4921589, 0.1322884, 1.562137, 0, 0, 0, 1, 1,
0.4945627, -1.674693, 3.499089, 0, 0, 0, 1, 1,
0.4982076, -0.8849685, 4.57419, 0, 0, 0, 1, 1,
0.5043674, 1.049353, 0.7807245, 0, 0, 0, 1, 1,
0.5047164, -0.6409487, 1.801314, 0, 0, 0, 1, 1,
0.5093474, 0.1942443, 2.249168, 1, 1, 1, 1, 1,
0.5103537, -0.4975145, 3.611816, 1, 1, 1, 1, 1,
0.5109794, -0.6840298, 2.091733, 1, 1, 1, 1, 1,
0.5113807, 1.364284, 1.724411, 1, 1, 1, 1, 1,
0.5132379, -0.2969709, 2.378331, 1, 1, 1, 1, 1,
0.5137012, -0.2134612, 0.3677075, 1, 1, 1, 1, 1,
0.518837, -1.765807, 1.933812, 1, 1, 1, 1, 1,
0.5241652, 0.9698615, -0.9845614, 1, 1, 1, 1, 1,
0.5245605, -1.093001, 1.281973, 1, 1, 1, 1, 1,
0.5257427, -0.6521226, 3.695456, 1, 1, 1, 1, 1,
0.5283315, -0.7205961, 1.263207, 1, 1, 1, 1, 1,
0.5286232, 0.5318699, 0.4562126, 1, 1, 1, 1, 1,
0.5343612, 0.4918795, 1.020223, 1, 1, 1, 1, 1,
0.5343879, -0.203062, 1.80394, 1, 1, 1, 1, 1,
0.5361257, 0.5137327, 3.06136, 1, 1, 1, 1, 1,
0.5406467, -1.783699, 4.453176, 0, 0, 1, 1, 1,
0.5467904, 0.3509223, 2.036738, 1, 0, 0, 1, 1,
0.5615759, 1.484124, 2.210799, 1, 0, 0, 1, 1,
0.5627447, 0.6901109, 1.401489, 1, 0, 0, 1, 1,
0.5632706, -0.1144431, 1.958901, 1, 0, 0, 1, 1,
0.5648974, 0.9803007, -0.2114271, 1, 0, 0, 1, 1,
0.5658868, -0.9955913, 2.336517, 0, 0, 0, 1, 1,
0.5681977, 0.5739464, 0.2846254, 0, 0, 0, 1, 1,
0.569899, 0.622981, -0.6779851, 0, 0, 0, 1, 1,
0.5733035, 0.1987526, 0.9067373, 0, 0, 0, 1, 1,
0.5767001, -1.14463, 1.01041, 0, 0, 0, 1, 1,
0.5772018, -0.8733318, 4.472481, 0, 0, 0, 1, 1,
0.5801724, 1.66176, 0.8829907, 0, 0, 0, 1, 1,
0.5808678, 0.1818225, 2.639369, 1, 1, 1, 1, 1,
0.5821442, -1.092105, 2.399053, 1, 1, 1, 1, 1,
0.5821539, 0.05554387, 1.7292, 1, 1, 1, 1, 1,
0.5834806, -0.7818524, 3.160853, 1, 1, 1, 1, 1,
0.5934598, 0.1313047, 2.343357, 1, 1, 1, 1, 1,
0.5965573, -0.5400063, 1.662492, 1, 1, 1, 1, 1,
0.5968829, 0.5345863, 1.294131, 1, 1, 1, 1, 1,
0.5980597, 0.6156569, 1.539681, 1, 1, 1, 1, 1,
0.5981219, 0.08232931, 1.383883, 1, 1, 1, 1, 1,
0.6028063, -0.8560732, 3.498104, 1, 1, 1, 1, 1,
0.6065505, -0.1156037, 1.592164, 1, 1, 1, 1, 1,
0.6138341, -1.056067, 2.264196, 1, 1, 1, 1, 1,
0.6185371, 1.044624, 2.041209, 1, 1, 1, 1, 1,
0.6255049, -1.86063, 2.847113, 1, 1, 1, 1, 1,
0.6267515, 0.9605373, -0.3856856, 1, 1, 1, 1, 1,
0.6272024, -0.872878, 2.381296, 0, 0, 1, 1, 1,
0.6329702, 0.07088282, 1.757816, 1, 0, 0, 1, 1,
0.6334302, -1.244626, 2.166273, 1, 0, 0, 1, 1,
0.6344321, 0.8517351, -0.371253, 1, 0, 0, 1, 1,
0.6345595, -0.9475587, 3.061289, 1, 0, 0, 1, 1,
0.6458906, 0.5122685, 1.287151, 1, 0, 0, 1, 1,
0.6558794, -1.295991, 2.581815, 0, 0, 0, 1, 1,
0.6562917, -0.5009744, 2.35773, 0, 0, 0, 1, 1,
0.660398, -0.7957616, 4.330518, 0, 0, 0, 1, 1,
0.6626406, 1.095172, 0.7581604, 0, 0, 0, 1, 1,
0.6655372, 1.353835, -0.2280972, 0, 0, 0, 1, 1,
0.6661474, -0.1099211, 1.721666, 0, 0, 0, 1, 1,
0.6758454, 0.2290518, 0.343687, 0, 0, 0, 1, 1,
0.6796612, -1.446009, 3.460671, 1, 1, 1, 1, 1,
0.6818867, -1.771547, 1.016807, 1, 1, 1, 1, 1,
0.6821195, 0.4274168, 0.6882997, 1, 1, 1, 1, 1,
0.6835882, 0.7355047, -0.2896384, 1, 1, 1, 1, 1,
0.6876379, -2.074311, 2.564799, 1, 1, 1, 1, 1,
0.6928686, -1.239985, 1.084099, 1, 1, 1, 1, 1,
0.6949983, 0.2231928, 1.783105, 1, 1, 1, 1, 1,
0.6960075, 1.439567, 0.01334931, 1, 1, 1, 1, 1,
0.6966799, -1.216631, 3.144987, 1, 1, 1, 1, 1,
0.6995725, -1.26335, 0.7976238, 1, 1, 1, 1, 1,
0.7005489, -0.9503678, 3.519409, 1, 1, 1, 1, 1,
0.7018836, -0.1147092, 1.755355, 1, 1, 1, 1, 1,
0.7054971, 0.4834507, 1.118189, 1, 1, 1, 1, 1,
0.7065008, 0.7262421, 0.8048078, 1, 1, 1, 1, 1,
0.7083064, -0.06708393, 1.240337, 1, 1, 1, 1, 1,
0.7098233, 0.09970484, 2.975687, 0, 0, 1, 1, 1,
0.7107001, 0.07278109, 1.418676, 1, 0, 0, 1, 1,
0.7123014, 0.3286588, -0.4892829, 1, 0, 0, 1, 1,
0.7128711, 0.5288747, 3.547461, 1, 0, 0, 1, 1,
0.7145717, -1.008179, 3.307074, 1, 0, 0, 1, 1,
0.7175224, -0.1330722, 0.04292539, 1, 0, 0, 1, 1,
0.7232351, 0.4213329, 1.164676, 0, 0, 0, 1, 1,
0.7285256, 0.3578356, 1.407674, 0, 0, 0, 1, 1,
0.7313001, 1.515835, 0.9239156, 0, 0, 0, 1, 1,
0.7314773, 0.2147085, 3.246959, 0, 0, 0, 1, 1,
0.7315049, -0.5310581, 2.19848, 0, 0, 0, 1, 1,
0.7376976, -0.2489563, 1.767311, 0, 0, 0, 1, 1,
0.7377003, 0.5140869, 0.6478822, 0, 0, 0, 1, 1,
0.7417451, -0.23011, 1.483295, 1, 1, 1, 1, 1,
0.7442164, 0.3098118, -0.0579396, 1, 1, 1, 1, 1,
0.7561493, -0.4165649, 2.584403, 1, 1, 1, 1, 1,
0.760783, -1.328239, 2.647964, 1, 1, 1, 1, 1,
0.7642387, -1.774079, 3.399737, 1, 1, 1, 1, 1,
0.7670823, 0.7900103, 1.099507, 1, 1, 1, 1, 1,
0.7794073, 0.1898095, 0.2254658, 1, 1, 1, 1, 1,
0.7810664, -0.1658196, 1.980844, 1, 1, 1, 1, 1,
0.7833608, -0.9455004, 1.989265, 1, 1, 1, 1, 1,
0.7834042, -0.3721428, 0.4032208, 1, 1, 1, 1, 1,
0.7857862, -0.6240301, 3.47539, 1, 1, 1, 1, 1,
0.7926306, -0.1545441, 1.734667, 1, 1, 1, 1, 1,
0.7987205, 0.1338279, 2.128587, 1, 1, 1, 1, 1,
0.805127, -0.02365369, 2.872137, 1, 1, 1, 1, 1,
0.8092909, -0.760296, 4.021261, 1, 1, 1, 1, 1,
0.8150455, 0.7456297, 1.069286, 0, 0, 1, 1, 1,
0.8159374, 1.036057, 2.440224, 1, 0, 0, 1, 1,
0.8263524, 1.176564, -1.066141, 1, 0, 0, 1, 1,
0.8263749, 1.526922, -0.5408951, 1, 0, 0, 1, 1,
0.8282107, -0.5769494, 2.257146, 1, 0, 0, 1, 1,
0.8391007, -0.3345886, 2.184076, 1, 0, 0, 1, 1,
0.8392658, -0.3305466, 0.499767, 0, 0, 0, 1, 1,
0.8407818, 2.808944, 0.169489, 0, 0, 0, 1, 1,
0.8493422, 0.2556285, 1.820596, 0, 0, 0, 1, 1,
0.8511602, -1.379772, 2.719728, 0, 0, 0, 1, 1,
0.8530064, -0.6060683, -0.3592074, 0, 0, 0, 1, 1,
0.8561574, 1.182867, 1.391849, 0, 0, 0, 1, 1,
0.8577083, -0.3187354, 2.012372, 0, 0, 0, 1, 1,
0.8642317, -0.2835411, 2.522636, 1, 1, 1, 1, 1,
0.8669989, 0.3066348, 1.795921, 1, 1, 1, 1, 1,
0.8674955, -0.7438792, 0.9334053, 1, 1, 1, 1, 1,
0.8712748, 0.6973608, 1.119348, 1, 1, 1, 1, 1,
0.8784117, 0.2772762, 1.759567, 1, 1, 1, 1, 1,
0.8800561, -0.5683912, 3.886781, 1, 1, 1, 1, 1,
0.8826731, -0.1314433, 2.672503, 1, 1, 1, 1, 1,
0.8833224, -1.188949, 3.81311, 1, 1, 1, 1, 1,
0.8850971, -0.5013211, 2.112326, 1, 1, 1, 1, 1,
0.8885779, -0.1229174, -0.2134723, 1, 1, 1, 1, 1,
0.8892444, 1.066987, 1.513577, 1, 1, 1, 1, 1,
0.8912849, 1.464981, 2.935231, 1, 1, 1, 1, 1,
0.8936945, 2.103405, 1.816841, 1, 1, 1, 1, 1,
0.8998708, 0.5131581, 0.3515629, 1, 1, 1, 1, 1,
0.9001296, -2.382647, 2.795377, 1, 1, 1, 1, 1,
0.9061131, -1.859771, 2.247938, 0, 0, 1, 1, 1,
0.9063071, -0.9038489, 4.477914, 1, 0, 0, 1, 1,
0.9110705, 0.768123, -0.1862285, 1, 0, 0, 1, 1,
0.9136284, -0.8952791, 1.778473, 1, 0, 0, 1, 1,
0.915606, -0.3255109, 1.570286, 1, 0, 0, 1, 1,
0.9156307, 1.785157, 1.192878, 1, 0, 0, 1, 1,
0.9159339, 0.5056218, 0.9439458, 0, 0, 0, 1, 1,
0.9337248, 1.384386, 2.291777, 0, 0, 0, 1, 1,
0.9478492, -1.482872, 1.308543, 0, 0, 0, 1, 1,
0.9483045, -1.852467, 2.898802, 0, 0, 0, 1, 1,
0.9497897, 0.08676196, 0.8944554, 0, 0, 0, 1, 1,
0.9534831, 0.006360951, -0.04208248, 0, 0, 0, 1, 1,
0.9633246, -0.3429496, -0.1488552, 0, 0, 0, 1, 1,
0.96572, 1.141713, 0.9408165, 1, 1, 1, 1, 1,
0.9667437, -1.102208, 3.587052, 1, 1, 1, 1, 1,
0.9722855, 0.7395992, 1.61539, 1, 1, 1, 1, 1,
0.9807771, -1.158132, 3.311731, 1, 1, 1, 1, 1,
0.9878269, -2.436425, 2.478112, 1, 1, 1, 1, 1,
0.9887506, 2.086505, 0.3915114, 1, 1, 1, 1, 1,
0.9905109, -0.5563203, 1.633616, 1, 1, 1, 1, 1,
0.995613, 0.5990662, 2.365699, 1, 1, 1, 1, 1,
0.9976511, 0.3065528, -0.7676824, 1, 1, 1, 1, 1,
1.001333, 0.8662498, 1.386094, 1, 1, 1, 1, 1,
1.001681, 0.1897214, 0.2347358, 1, 1, 1, 1, 1,
1.012206, -1.62631, 3.006079, 1, 1, 1, 1, 1,
1.01461, -0.0749674, 1.201395, 1, 1, 1, 1, 1,
1.01513, 1.066748, 1.611344, 1, 1, 1, 1, 1,
1.024817, 0.7624851, 1.723031, 1, 1, 1, 1, 1,
1.025036, 1.441834, 0.3234245, 0, 0, 1, 1, 1,
1.025853, 1.191924, -1.09212, 1, 0, 0, 1, 1,
1.032136, 0.3228747, 0.3662362, 1, 0, 0, 1, 1,
1.038748, 0.1314267, 1.730408, 1, 0, 0, 1, 1,
1.04473, 1.654166, -0.3262718, 1, 0, 0, 1, 1,
1.048402, -0.2642081, 2.901851, 1, 0, 0, 1, 1,
1.051228, -1.843296, 1.000948, 0, 0, 0, 1, 1,
1.056909, -0.6262076, 2.586912, 0, 0, 0, 1, 1,
1.060805, -0.8201912, 2.156984, 0, 0, 0, 1, 1,
1.06114, -0.7812725, 2.977953, 0, 0, 0, 1, 1,
1.061972, 1.841991, 1.324511, 0, 0, 0, 1, 1,
1.062283, 0.1867081, 0.5414451, 0, 0, 0, 1, 1,
1.062605, -2.4143, 4.326581, 0, 0, 0, 1, 1,
1.066008, 1.348498, 0.752928, 1, 1, 1, 1, 1,
1.07049, -1.66143, 3.150211, 1, 1, 1, 1, 1,
1.071971, -0.6237223, 2.799645, 1, 1, 1, 1, 1,
1.079049, 0.5817562, 0.8822212, 1, 1, 1, 1, 1,
1.081199, -0.65401, 3.855408, 1, 1, 1, 1, 1,
1.087494, -0.3952862, 1.613544, 1, 1, 1, 1, 1,
1.089699, 0.2600387, 2.391099, 1, 1, 1, 1, 1,
1.092621, -2.353031, 2.476829, 1, 1, 1, 1, 1,
1.092875, 0.7874583, 0.330229, 1, 1, 1, 1, 1,
1.096341, 1.985936, -1.101641, 1, 1, 1, 1, 1,
1.098389, 0.0527052, 2.707058, 1, 1, 1, 1, 1,
1.103542, 1.394197, 1.754963, 1, 1, 1, 1, 1,
1.105597, -0.6498215, 4.79556, 1, 1, 1, 1, 1,
1.107403, -0.5256768, 2.820818, 1, 1, 1, 1, 1,
1.118466, 1.12382, -0.3118013, 1, 1, 1, 1, 1,
1.121712, -0.150669, 0.9933886, 0, 0, 1, 1, 1,
1.121918, -0.8825392, 2.821081, 1, 0, 0, 1, 1,
1.126232, -0.7460595, 1.918932, 1, 0, 0, 1, 1,
1.13077, -1.572069, 2.620209, 1, 0, 0, 1, 1,
1.14054, -0.5028229, 2.298249, 1, 0, 0, 1, 1,
1.140681, -0.4436283, 2.673349, 1, 0, 0, 1, 1,
1.141262, -2.737224, 1.495709, 0, 0, 0, 1, 1,
1.150537, 1.65271, -0.01682226, 0, 0, 0, 1, 1,
1.165695, 2.430816, 0.2510762, 0, 0, 0, 1, 1,
1.173002, -0.9527603, 3.340279, 0, 0, 0, 1, 1,
1.17401, 0.6639496, 1.914492, 0, 0, 0, 1, 1,
1.179956, 0.6799073, 1.555791, 0, 0, 0, 1, 1,
1.183535, 0.3239153, 2.309113, 0, 0, 0, 1, 1,
1.192365, -1.251137, 3.391575, 1, 1, 1, 1, 1,
1.196099, 0.2998601, 0.5807443, 1, 1, 1, 1, 1,
1.202427, -0.4085761, 1.435158, 1, 1, 1, 1, 1,
1.207173, 1.424703, 0.1117646, 1, 1, 1, 1, 1,
1.213651, -0.9962192, 0.7177455, 1, 1, 1, 1, 1,
1.217865, -0.3917113, 0.8249004, 1, 1, 1, 1, 1,
1.219194, -0.07458856, 1.17757, 1, 1, 1, 1, 1,
1.223032, 0.5089144, 1.167786, 1, 1, 1, 1, 1,
1.24451, 1.29633, 0.003195997, 1, 1, 1, 1, 1,
1.260288, 2.197306, 0.1385066, 1, 1, 1, 1, 1,
1.265586, -0.4782801, 2.156077, 1, 1, 1, 1, 1,
1.265919, 0.5298625, 1.480085, 1, 1, 1, 1, 1,
1.269164, 0.2651258, 2.465169, 1, 1, 1, 1, 1,
1.274777, -1.384119, 2.040138, 1, 1, 1, 1, 1,
1.282945, -0.053535, 1.981663, 1, 1, 1, 1, 1,
1.285703, -0.4313579, 2.931757, 0, 0, 1, 1, 1,
1.286562, 0.4517352, 2.015871, 1, 0, 0, 1, 1,
1.297323, 0.5145157, -0.2315882, 1, 0, 0, 1, 1,
1.305818, 0.8079431, 1.282159, 1, 0, 0, 1, 1,
1.312249, 1.121192, -0.2857686, 1, 0, 0, 1, 1,
1.320879, 0.2070294, 2.655911, 1, 0, 0, 1, 1,
1.323438, -0.4165575, -0.05703039, 0, 0, 0, 1, 1,
1.334369, 1.029156, 2.839146, 0, 0, 0, 1, 1,
1.339914, 0.4452819, -1.245239, 0, 0, 0, 1, 1,
1.342011, -0.7854249, 2.264012, 0, 0, 0, 1, 1,
1.344283, -2.12317, 1.867057, 0, 0, 0, 1, 1,
1.356091, 0.7776283, 2.571738, 0, 0, 0, 1, 1,
1.365071, 2.023929, -0.4382676, 0, 0, 0, 1, 1,
1.365123, -0.5782082, 2.430046, 1, 1, 1, 1, 1,
1.370933, 0.5872965, 0.862767, 1, 1, 1, 1, 1,
1.371641, -1.402737, 3.517746, 1, 1, 1, 1, 1,
1.386633, 0.9171196, 1.452378, 1, 1, 1, 1, 1,
1.387251, -0.3740199, 1.687355, 1, 1, 1, 1, 1,
1.402632, 1.305478, 0.3823334, 1, 1, 1, 1, 1,
1.402768, 1.491931, -0.07605936, 1, 1, 1, 1, 1,
1.413303, 0.758194, 1.284169, 1, 1, 1, 1, 1,
1.429207, -0.8769517, 1.818249, 1, 1, 1, 1, 1,
1.437415, -0.6431733, 2.411512, 1, 1, 1, 1, 1,
1.442613, 2.667188, 0.9305401, 1, 1, 1, 1, 1,
1.447156, 0.6091583, 0.1160793, 1, 1, 1, 1, 1,
1.449411, -0.6229588, 2.874873, 1, 1, 1, 1, 1,
1.464649, 0.3497216, 1.541081, 1, 1, 1, 1, 1,
1.467118, 0.8096934, 0.9938365, 1, 1, 1, 1, 1,
1.471275, 0.876695, 1.996211, 0, 0, 1, 1, 1,
1.476768, 2.034136, 0.2547295, 1, 0, 0, 1, 1,
1.47952, -0.8906616, 1.100113, 1, 0, 0, 1, 1,
1.480499, -2.211631, 3.257334, 1, 0, 0, 1, 1,
1.484551, 0.5795668, 1.069548, 1, 0, 0, 1, 1,
1.486996, 0.4230824, 2.44161, 1, 0, 0, 1, 1,
1.487779, -0.01331329, 4.537591, 0, 0, 0, 1, 1,
1.499732, -0.6785777, 2.35851, 0, 0, 0, 1, 1,
1.51035, 2.183972, -0.5404832, 0, 0, 0, 1, 1,
1.513148, 0.1857693, 0.1236626, 0, 0, 0, 1, 1,
1.519466, 0.05653752, 2.964895, 0, 0, 0, 1, 1,
1.538523, -1.016922, 2.081971, 0, 0, 0, 1, 1,
1.539367, -0.05251621, 1.57119, 0, 0, 0, 1, 1,
1.539887, 0.203074, 1.577089, 1, 1, 1, 1, 1,
1.543034, -1.422186, 2.026349, 1, 1, 1, 1, 1,
1.5435, 2.055534, 0.02924161, 1, 1, 1, 1, 1,
1.555087, -1.376296, 1.921831, 1, 1, 1, 1, 1,
1.561892, -0.2399217, 3.09733, 1, 1, 1, 1, 1,
1.566396, -1.474612, 0.8820156, 1, 1, 1, 1, 1,
1.575259, 0.8035857, 2.108231, 1, 1, 1, 1, 1,
1.596272, 0.3827883, 0.5869414, 1, 1, 1, 1, 1,
1.616348, -0.02377222, 2.933323, 1, 1, 1, 1, 1,
1.618419, 0.9426494, 0.9970813, 1, 1, 1, 1, 1,
1.623612, -0.4312502, 1.117595, 1, 1, 1, 1, 1,
1.629579, -1.768157, 4.730719, 1, 1, 1, 1, 1,
1.629957, -0.279707, 2.041826, 1, 1, 1, 1, 1,
1.638743, -0.3167924, 1.593502, 1, 1, 1, 1, 1,
1.649525, -0.3134241, 0.8743421, 1, 1, 1, 1, 1,
1.661342, 1.050167, 2.248284, 0, 0, 1, 1, 1,
1.668896, -0.9689801, 2.123378, 1, 0, 0, 1, 1,
1.677527, -0.4654871, -0.08746728, 1, 0, 0, 1, 1,
1.67966, -1.104783, 1.806551, 1, 0, 0, 1, 1,
1.696253, -0.0985551, 2.071115, 1, 0, 0, 1, 1,
1.715366, -1.01066, 2.207752, 1, 0, 0, 1, 1,
1.717731, 0.7846648, 0.8085262, 0, 0, 0, 1, 1,
1.73777, -0.726046, 1.316793, 0, 0, 0, 1, 1,
1.754041, -0.4656833, 1.329663, 0, 0, 0, 1, 1,
1.764285, -0.3912089, 1.81511, 0, 0, 0, 1, 1,
1.801979, 1.784523, 0.2218817, 0, 0, 0, 1, 1,
1.807306, -0.2567196, 3.062454, 0, 0, 0, 1, 1,
1.820569, 1.176631, 1.679116, 0, 0, 0, 1, 1,
1.86894, -1.183622, 2.808957, 1, 1, 1, 1, 1,
1.872779, 0.3322626, 0.4437245, 1, 1, 1, 1, 1,
1.873864, 1.22564, 1.578372, 1, 1, 1, 1, 1,
1.878318, 1.620807, -3.099624, 1, 1, 1, 1, 1,
1.881634, 0.6218089, 1.174817, 1, 1, 1, 1, 1,
1.88803, -1.115975, 2.625152, 1, 1, 1, 1, 1,
1.913501, 1.080891, 0.4739436, 1, 1, 1, 1, 1,
1.918859, -0.2464767, 1.267941, 1, 1, 1, 1, 1,
1.929778, -1.568391, 2.736176, 1, 1, 1, 1, 1,
1.96584, -1.911487, 2.00632, 1, 1, 1, 1, 1,
1.972404, 0.09264153, 3.578815, 1, 1, 1, 1, 1,
1.975893, -1.177069, 0.7577559, 1, 1, 1, 1, 1,
1.980706, -0.09561434, 1.180927, 1, 1, 1, 1, 1,
2.015112, -1.832822, 2.651298, 1, 1, 1, 1, 1,
2.044877, -0.8194243, 2.739372, 1, 1, 1, 1, 1,
2.044966, -0.3955027, 0.9178979, 0, 0, 1, 1, 1,
2.060223, -0.7521671, 0.9487013, 1, 0, 0, 1, 1,
2.108082, 0.05726865, 0.6482621, 1, 0, 0, 1, 1,
2.118605, 0.1778832, 1.469054, 1, 0, 0, 1, 1,
2.152211, 0.5906839, 0.7943865, 1, 0, 0, 1, 1,
2.154393, -1.425771, 1.679791, 1, 0, 0, 1, 1,
2.171348, 0.07145876, 3.195666, 0, 0, 0, 1, 1,
2.191759, 1.729398, -0.5594104, 0, 0, 0, 1, 1,
2.191772, -0.515806, 1.872007, 0, 0, 0, 1, 1,
2.20773, 0.6618814, 3.17468, 0, 0, 0, 1, 1,
2.246149, -1.876685, 2.836646, 0, 0, 0, 1, 1,
2.385626, -1.930454, 2.509399, 0, 0, 0, 1, 1,
2.420165, -0.2197872, 1.037179, 0, 0, 0, 1, 1,
2.465936, -0.0356129, 3.389103, 1, 1, 1, 1, 1,
2.505419, 1.218972, 0.1754634, 1, 1, 1, 1, 1,
2.619763, 0.8623509, 1.669986, 1, 1, 1, 1, 1,
2.695318, 0.988872, -0.6580793, 1, 1, 1, 1, 1,
2.741719, -1.199446, 1.993029, 1, 1, 1, 1, 1,
2.745706, -0.6320319, 2.645918, 1, 1, 1, 1, 1,
2.972663, -1.655222, 3.292978, 1, 1, 1, 1, 1
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
var radius = 9.999819;
var distance = 35.12394;
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
mvMatrix.translate( 0.5209415, -0.2229275, -0.4097433 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.12394);
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
