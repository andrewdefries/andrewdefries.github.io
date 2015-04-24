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
-3.478082, -1.276118, -2.356236, 1, 0, 0, 1,
-3.418225, -2.388512, -1.619972, 1, 0.007843138, 0, 1,
-2.975639, -0.341901, -2.086592, 1, 0.01176471, 0, 1,
-2.691258, -0.8092014, -2.764893, 1, 0.01960784, 0, 1,
-2.591025, -1.131581, -4.409632, 1, 0.02352941, 0, 1,
-2.588897, -2.009585, -3.015025, 1, 0.03137255, 0, 1,
-2.568538, 0.9514099, 0.7179803, 1, 0.03529412, 0, 1,
-2.550157, -0.6649979, -1.725741, 1, 0.04313726, 0, 1,
-2.402411, -0.03988723, -0.9084185, 1, 0.04705882, 0, 1,
-2.30659, -0.2886539, -1.395961, 1, 0.05490196, 0, 1,
-2.2944, 0.6072692, -1.47326, 1, 0.05882353, 0, 1,
-2.256626, 0.9484729, -1.330527, 1, 0.06666667, 0, 1,
-2.226902, -0.3371976, -3.140895, 1, 0.07058824, 0, 1,
-2.181703, 0.2869751, -2.551517, 1, 0.07843138, 0, 1,
-2.126556, 0.5742264, -2.161116, 1, 0.08235294, 0, 1,
-2.110588, 0.4905484, -0.4764134, 1, 0.09019608, 0, 1,
-2.110343, 0.02223084, -1.993347, 1, 0.09411765, 0, 1,
-2.06254, 0.5066819, 0.8339189, 1, 0.1019608, 0, 1,
-2.004257, -0.07102948, -3.961968, 1, 0.1098039, 0, 1,
-2.001645, -1.234112, -1.98731, 1, 0.1137255, 0, 1,
-2.001116, -0.5832328, -2.227813, 1, 0.1215686, 0, 1,
-1.975536, 0.2853062, -2.528392, 1, 0.1254902, 0, 1,
-1.961995, -1.047177, -1.247623, 1, 0.1333333, 0, 1,
-1.959688, 0.6115602, -2.087363, 1, 0.1372549, 0, 1,
-1.957457, -1.122748, -2.934675, 1, 0.145098, 0, 1,
-1.926857, 0.3824539, -2.092765, 1, 0.1490196, 0, 1,
-1.862582, 0.1753255, -2.492569, 1, 0.1568628, 0, 1,
-1.845413, -0.1534622, -3.276097, 1, 0.1607843, 0, 1,
-1.834725, -0.9454563, -0.9225522, 1, 0.1686275, 0, 1,
-1.831937, -0.6218665, -1.715936, 1, 0.172549, 0, 1,
-1.831462, 1.287558, -1.014151, 1, 0.1803922, 0, 1,
-1.817658, 1.364146, -0.7572244, 1, 0.1843137, 0, 1,
-1.806567, 0.9447462, -1.422981, 1, 0.1921569, 0, 1,
-1.805515, 2.285382, -1.570897, 1, 0.1960784, 0, 1,
-1.803228, -0.8199427, -1.990703, 1, 0.2039216, 0, 1,
-1.798079, -0.5357137, -3.013714, 1, 0.2117647, 0, 1,
-1.790527, 0.6308605, -1.132982, 1, 0.2156863, 0, 1,
-1.790171, -0.3939241, -2.323091, 1, 0.2235294, 0, 1,
-1.781695, 0.5643659, 0.8859148, 1, 0.227451, 0, 1,
-1.749125, 1.408057, 0.6530604, 1, 0.2352941, 0, 1,
-1.734416, -0.7709185, -1.660703, 1, 0.2392157, 0, 1,
-1.727648, 0.456975, -1.207078, 1, 0.2470588, 0, 1,
-1.696503, 0.5325022, -0.8059565, 1, 0.2509804, 0, 1,
-1.693404, 1.766934, -1.316382, 1, 0.2588235, 0, 1,
-1.687467, 0.4831393, -0.8561476, 1, 0.2627451, 0, 1,
-1.67867, -0.4635872, -1.742407, 1, 0.2705882, 0, 1,
-1.671773, -0.3805965, -3.575772, 1, 0.2745098, 0, 1,
-1.661699, -0.222228, -2.664685, 1, 0.282353, 0, 1,
-1.652336, 0.8471513, 0.3321952, 1, 0.2862745, 0, 1,
-1.646818, -1.148374, -1.240344, 1, 0.2941177, 0, 1,
-1.645702, -0.1392129, -2.273846, 1, 0.3019608, 0, 1,
-1.641069, 0.1022693, -2.484682, 1, 0.3058824, 0, 1,
-1.635421, -0.2648575, -0.2717659, 1, 0.3137255, 0, 1,
-1.585392, -0.9429973, -3.334361, 1, 0.3176471, 0, 1,
-1.571208, -0.486618, -2.156816, 1, 0.3254902, 0, 1,
-1.564642, 0.4287175, -1.543709, 1, 0.3294118, 0, 1,
-1.560804, -0.6923774, -3.161686, 1, 0.3372549, 0, 1,
-1.558315, 0.3504579, -1.242493, 1, 0.3411765, 0, 1,
-1.557743, -0.2276313, 1.205312, 1, 0.3490196, 0, 1,
-1.547739, -0.4156467, -1.723387, 1, 0.3529412, 0, 1,
-1.535127, 0.8961203, -1.927045, 1, 0.3607843, 0, 1,
-1.519225, 0.04303838, -2.631761, 1, 0.3647059, 0, 1,
-1.518478, -1.362448, -3.668406, 1, 0.372549, 0, 1,
-1.515192, 1.336365, 0.4060591, 1, 0.3764706, 0, 1,
-1.502231, -0.2265293, -2.277441, 1, 0.3843137, 0, 1,
-1.498504, -1.120825, -1.394345, 1, 0.3882353, 0, 1,
-1.49384, -1.609784, -2.069502, 1, 0.3960784, 0, 1,
-1.488519, -0.7527087, -1.002913, 1, 0.4039216, 0, 1,
-1.487839, 0.02167997, -3.155088, 1, 0.4078431, 0, 1,
-1.486691, 0.5169364, 0.8210971, 1, 0.4156863, 0, 1,
-1.471859, 0.1459224, -1.843878, 1, 0.4196078, 0, 1,
-1.462732, 0.6311527, -0.6922138, 1, 0.427451, 0, 1,
-1.454601, -1.321565, -1.802993, 1, 0.4313726, 0, 1,
-1.453301, -0.453508, -2.180693, 1, 0.4392157, 0, 1,
-1.451463, -0.7956221, -1.786776, 1, 0.4431373, 0, 1,
-1.446788, -0.9925316, -1.819771, 1, 0.4509804, 0, 1,
-1.441874, 0.5571433, -0.7020411, 1, 0.454902, 0, 1,
-1.427768, -0.3122808, 0.5464157, 1, 0.4627451, 0, 1,
-1.413066, -0.6388018, -2.757966, 1, 0.4666667, 0, 1,
-1.406349, -0.1537242, -0.9243523, 1, 0.4745098, 0, 1,
-1.403245, 0.4044829, -1.912239, 1, 0.4784314, 0, 1,
-1.397575, -0.04498203, -2.250927, 1, 0.4862745, 0, 1,
-1.392812, -0.9907799, -3.457445, 1, 0.4901961, 0, 1,
-1.383478, 1.459973, 0.7103373, 1, 0.4980392, 0, 1,
-1.37567, 0.6282916, -2.987771, 1, 0.5058824, 0, 1,
-1.374026, 1.344739, -1.30534, 1, 0.509804, 0, 1,
-1.357721, 1.029388, -2.212525, 1, 0.5176471, 0, 1,
-1.35031, -0.1800491, -2.090159, 1, 0.5215687, 0, 1,
-1.346322, -0.3663742, -1.259325, 1, 0.5294118, 0, 1,
-1.338644, -0.2179958, -0.2898527, 1, 0.5333334, 0, 1,
-1.336869, -0.2142511, -1.486696, 1, 0.5411765, 0, 1,
-1.329287, 0.315584, -0.6798905, 1, 0.5450981, 0, 1,
-1.327167, 1.369897, -0.5975406, 1, 0.5529412, 0, 1,
-1.32439, -0.1506599, -2.463376, 1, 0.5568628, 0, 1,
-1.324015, -0.1688673, -1.111136, 1, 0.5647059, 0, 1,
-1.320346, 1.110825, -1.340104, 1, 0.5686275, 0, 1,
-1.313677, 0.2365295, -2.289969, 1, 0.5764706, 0, 1,
-1.304675, -0.9559624, -1.742103, 1, 0.5803922, 0, 1,
-1.302811, -0.2409066, -3.043005, 1, 0.5882353, 0, 1,
-1.291491, -0.2389753, -3.909367, 1, 0.5921569, 0, 1,
-1.290128, 0.1186656, -2.748053, 1, 0.6, 0, 1,
-1.28511, 1.458174, 0.6602556, 1, 0.6078432, 0, 1,
-1.281398, -0.7801425, -2.330143, 1, 0.6117647, 0, 1,
-1.279358, -0.3336677, -0.7231773, 1, 0.6196079, 0, 1,
-1.279218, -0.2201302, -3.156755, 1, 0.6235294, 0, 1,
-1.275883, -0.1839673, -0.7896357, 1, 0.6313726, 0, 1,
-1.274246, -0.542919, -1.485825, 1, 0.6352941, 0, 1,
-1.27207, 0.00974343, -1.904936, 1, 0.6431373, 0, 1,
-1.268924, -1.519361, -2.306073, 1, 0.6470588, 0, 1,
-1.263804, 0.01618672, -1.946205, 1, 0.654902, 0, 1,
-1.250633, -0.2770686, -0.5879833, 1, 0.6588235, 0, 1,
-1.247664, -0.2029186, -2.124568, 1, 0.6666667, 0, 1,
-1.246122, 0.05428074, -0.910679, 1, 0.6705883, 0, 1,
-1.242486, 0.8000948, 1.105579, 1, 0.6784314, 0, 1,
-1.235444, -1.094006, -3.537012, 1, 0.682353, 0, 1,
-1.234473, 0.3423804, -1.110708, 1, 0.6901961, 0, 1,
-1.225171, -0.5388057, -4.000885, 1, 0.6941177, 0, 1,
-1.224253, 1.01152, 0.4158253, 1, 0.7019608, 0, 1,
-1.220871, 1.18336, -1.582726, 1, 0.7098039, 0, 1,
-1.220772, 0.1385492, -1.975454, 1, 0.7137255, 0, 1,
-1.218698, -0.9108239, -2.63239, 1, 0.7215686, 0, 1,
-1.215734, 0.3036721, 0.08226716, 1, 0.7254902, 0, 1,
-1.211604, 1.265546, 0.5771379, 1, 0.7333333, 0, 1,
-1.205786, -0.05446764, -1.497536, 1, 0.7372549, 0, 1,
-1.204566, -0.4707738, -2.209377, 1, 0.7450981, 0, 1,
-1.203032, 0.1368426, -2.085175, 1, 0.7490196, 0, 1,
-1.196928, -3.071172, -1.910643, 1, 0.7568628, 0, 1,
-1.193635, 0.1345804, -1.002373, 1, 0.7607843, 0, 1,
-1.191527, 2.127931, 1.122914, 1, 0.7686275, 0, 1,
-1.17441, -1.155885, -2.372128, 1, 0.772549, 0, 1,
-1.172423, -0.1866574, -1.562055, 1, 0.7803922, 0, 1,
-1.172404, -0.2500465, -2.49294, 1, 0.7843137, 0, 1,
-1.161494, -0.5992807, -3.712466, 1, 0.7921569, 0, 1,
-1.160395, -1.474795, -2.946983, 1, 0.7960784, 0, 1,
-1.153923, 0.3845025, -1.993461, 1, 0.8039216, 0, 1,
-1.149646, -0.2608401, 0.1836491, 1, 0.8117647, 0, 1,
-1.134592, -0.9512168, -1.902657, 1, 0.8156863, 0, 1,
-1.129114, 1.196704, -0.1567439, 1, 0.8235294, 0, 1,
-1.125788, 0.9742282, -1.109823, 1, 0.827451, 0, 1,
-1.123152, 0.1882734, -2.714686, 1, 0.8352941, 0, 1,
-1.111623, 0.8101253, -1.842383, 1, 0.8392157, 0, 1,
-1.109802, -0.2449522, -2.80741, 1, 0.8470588, 0, 1,
-1.107769, -0.5228894, -1.514812, 1, 0.8509804, 0, 1,
-1.101744, 0.8562752, 1.418223, 1, 0.8588235, 0, 1,
-1.100492, -0.7091865, -2.86299, 1, 0.8627451, 0, 1,
-1.076995, 0.09225216, -2.2406, 1, 0.8705882, 0, 1,
-1.060747, 0.7094733, 2.458865, 1, 0.8745098, 0, 1,
-1.060647, 0.5230947, -0.702538, 1, 0.8823529, 0, 1,
-1.057933, -1.211664, -3.837547, 1, 0.8862745, 0, 1,
-1.050817, 0.4306627, 0.6488803, 1, 0.8941177, 0, 1,
-1.049648, 0.9980744, 1.623943, 1, 0.8980392, 0, 1,
-1.046144, 2.300663, -0.3837433, 1, 0.9058824, 0, 1,
-1.045216, 1.324217, 0.6238917, 1, 0.9137255, 0, 1,
-1.042396, -0.6310006, -4.372962, 1, 0.9176471, 0, 1,
-1.041375, 0.3435797, -0.8456311, 1, 0.9254902, 0, 1,
-1.039551, -1.354365, -0.4944267, 1, 0.9294118, 0, 1,
-1.038209, 0.3932062, -0.9573473, 1, 0.9372549, 0, 1,
-1.032093, -0.1403664, -2.906467, 1, 0.9411765, 0, 1,
-1.029751, -1.024531, -1.367388, 1, 0.9490196, 0, 1,
-1.026806, -0.02628587, 0.1542684, 1, 0.9529412, 0, 1,
-1.02229, 0.6963789, 1.650805, 1, 0.9607843, 0, 1,
-1.008228, 0.5609692, -2.070538, 1, 0.9647059, 0, 1,
-0.9975293, 0.501332, -2.923129, 1, 0.972549, 0, 1,
-0.9801571, -0.1251611, -2.406351, 1, 0.9764706, 0, 1,
-0.9729303, -2.031617, -2.591995, 1, 0.9843137, 0, 1,
-0.9671459, -0.3681645, -3.074756, 1, 0.9882353, 0, 1,
-0.9638124, 0.2995399, -0.6646246, 1, 0.9960784, 0, 1,
-0.9591539, -1.567176, -5.130793, 0.9960784, 1, 0, 1,
-0.9560639, 0.7607449, -0.6762419, 0.9921569, 1, 0, 1,
-0.9560013, 0.365567, 0.2718082, 0.9843137, 1, 0, 1,
-0.9430535, -2.171938, -2.388878, 0.9803922, 1, 0, 1,
-0.9384868, -1.393373, -1.971159, 0.972549, 1, 0, 1,
-0.9379605, -0.7309468, -2.911396, 0.9686275, 1, 0, 1,
-0.9333175, -1.816194, -2.269117, 0.9607843, 1, 0, 1,
-0.9329986, 1.077851, -0.8981696, 0.9568627, 1, 0, 1,
-0.9308278, -0.3716384, -2.394256, 0.9490196, 1, 0, 1,
-0.9282577, -0.8158504, -2.480081, 0.945098, 1, 0, 1,
-0.9223831, -0.06199814, -3.236613, 0.9372549, 1, 0, 1,
-0.918607, -1.030334, -0.4036337, 0.9333333, 1, 0, 1,
-0.917927, 0.2596117, -1.200699, 0.9254902, 1, 0, 1,
-0.9104887, -1.145039, -2.066275, 0.9215686, 1, 0, 1,
-0.9055838, 1.562791, 0.04177279, 0.9137255, 1, 0, 1,
-0.8991902, -0.1190539, 0.003651219, 0.9098039, 1, 0, 1,
-0.8990614, -0.6487072, -3.283392, 0.9019608, 1, 0, 1,
-0.8966219, 0.7758954, -1.039136, 0.8941177, 1, 0, 1,
-0.8953725, 0.4464998, -1.523627, 0.8901961, 1, 0, 1,
-0.8901543, -1.002824, -1.850568, 0.8823529, 1, 0, 1,
-0.8867484, -0.1444701, -1.76994, 0.8784314, 1, 0, 1,
-0.8857682, -0.488627, -3.289082, 0.8705882, 1, 0, 1,
-0.8848388, -0.831641, -3.079031, 0.8666667, 1, 0, 1,
-0.8834442, -1.164037, -4.285943, 0.8588235, 1, 0, 1,
-0.8749815, 0.7167909, -2.401744, 0.854902, 1, 0, 1,
-0.8738636, -0.9740856, -0.6452799, 0.8470588, 1, 0, 1,
-0.8718811, -0.8395656, -2.093758, 0.8431373, 1, 0, 1,
-0.8650376, 1.369637, -1.513924, 0.8352941, 1, 0, 1,
-0.8616495, 0.8472841, -1.83746, 0.8313726, 1, 0, 1,
-0.859163, 0.8773157, -1.335281, 0.8235294, 1, 0, 1,
-0.8454812, -2.775819, -3.430872, 0.8196079, 1, 0, 1,
-0.8410469, -0.2968433, -1.212719, 0.8117647, 1, 0, 1,
-0.8388627, -0.5988567, -1.9321, 0.8078431, 1, 0, 1,
-0.8368352, -0.477825, -1.461022, 0.8, 1, 0, 1,
-0.8367527, -0.1036201, -0.5788936, 0.7921569, 1, 0, 1,
-0.8348973, 0.639097, -2.390023, 0.7882353, 1, 0, 1,
-0.8281647, 0.08407459, 0.06886479, 0.7803922, 1, 0, 1,
-0.8253857, 1.166911, 1.405783, 0.7764706, 1, 0, 1,
-0.8220861, 0.7791237, 1.600981, 0.7686275, 1, 0, 1,
-0.8217195, -1.168645, -2.418621, 0.7647059, 1, 0, 1,
-0.8190711, 0.05187224, -1.403934, 0.7568628, 1, 0, 1,
-0.8178577, 1.75913, 0.3937787, 0.7529412, 1, 0, 1,
-0.8121833, 0.1695433, -1.788922, 0.7450981, 1, 0, 1,
-0.8064423, -0.7101985, -2.647773, 0.7411765, 1, 0, 1,
-0.8050807, -1.066236, -4.651197, 0.7333333, 1, 0, 1,
-0.8049471, -0.09818026, -1.494085, 0.7294118, 1, 0, 1,
-0.8014922, 0.62143, -0.206368, 0.7215686, 1, 0, 1,
-0.8003532, 1.027321, -0.7229642, 0.7176471, 1, 0, 1,
-0.800249, -2.933588, -2.66457, 0.7098039, 1, 0, 1,
-0.79455, -1.109626, -3.197476, 0.7058824, 1, 0, 1,
-0.7931988, 0.02872714, -1.573775, 0.6980392, 1, 0, 1,
-0.7900587, 0.002452862, -2.457087, 0.6901961, 1, 0, 1,
-0.7883003, 0.7952152, 0.5657712, 0.6862745, 1, 0, 1,
-0.7877622, 0.3137252, -2.409173, 0.6784314, 1, 0, 1,
-0.7858718, 0.1369405, -0.561735, 0.6745098, 1, 0, 1,
-0.781548, -1.586257, -2.981011, 0.6666667, 1, 0, 1,
-0.7746308, -1.482286, -4.376403, 0.6627451, 1, 0, 1,
-0.7712038, 0.9667598, -2.097786, 0.654902, 1, 0, 1,
-0.7702324, 0.6075547, -0.4511546, 0.6509804, 1, 0, 1,
-0.766625, -0.8905312, -1.609362, 0.6431373, 1, 0, 1,
-0.7592673, -2.336965, -3.415321, 0.6392157, 1, 0, 1,
-0.757524, 1.289567, -2.166143, 0.6313726, 1, 0, 1,
-0.7475181, -0.3225358, -3.448635, 0.627451, 1, 0, 1,
-0.7444758, 0.2864694, -1.495537, 0.6196079, 1, 0, 1,
-0.7444041, -1.38866, -2.18756, 0.6156863, 1, 0, 1,
-0.7372512, 0.0499734, -0.6639579, 0.6078432, 1, 0, 1,
-0.7365621, 0.1522659, 0.1151334, 0.6039216, 1, 0, 1,
-0.7357702, 1.573212, -0.4335585, 0.5960785, 1, 0, 1,
-0.7348253, 0.7135824, -1.736127, 0.5882353, 1, 0, 1,
-0.7338293, 1.064544, 0.05416289, 0.5843138, 1, 0, 1,
-0.7221653, 0.2885332, -1.385989, 0.5764706, 1, 0, 1,
-0.7154231, -0.6450664, -1.683352, 0.572549, 1, 0, 1,
-0.708445, -0.3866913, -3.096549, 0.5647059, 1, 0, 1,
-0.7039282, 0.4627937, -1.265254, 0.5607843, 1, 0, 1,
-0.7015541, 0.2510601, -2.196058, 0.5529412, 1, 0, 1,
-0.6994034, -0.1189168, -1.573579, 0.5490196, 1, 0, 1,
-0.6964874, -2.168421, -1.830926, 0.5411765, 1, 0, 1,
-0.6944335, 1.387584, -0.7458187, 0.5372549, 1, 0, 1,
-0.693967, -1.404438, -1.045015, 0.5294118, 1, 0, 1,
-0.6938452, 1.509829, -0.4218282, 0.5254902, 1, 0, 1,
-0.6926487, -0.03973146, -2.29521, 0.5176471, 1, 0, 1,
-0.691376, -1.31244, -3.031693, 0.5137255, 1, 0, 1,
-0.6857299, 0.3361469, -0.3906529, 0.5058824, 1, 0, 1,
-0.6846599, -0.1104954, -2.051703, 0.5019608, 1, 0, 1,
-0.6800324, 0.1627251, -2.269963, 0.4941176, 1, 0, 1,
-0.6790177, 1.590904, 0.283914, 0.4862745, 1, 0, 1,
-0.6772686, 0.9470508, -1.918882, 0.4823529, 1, 0, 1,
-0.6717029, -0.6701105, -2.824163, 0.4745098, 1, 0, 1,
-0.6687871, 0.6572139, -0.4330718, 0.4705882, 1, 0, 1,
-0.6674224, -0.7284273, -2.080956, 0.4627451, 1, 0, 1,
-0.6645206, 0.3515032, -1.012908, 0.4588235, 1, 0, 1,
-0.6634325, 0.4115482, -1.987637, 0.4509804, 1, 0, 1,
-0.6559353, -1.046955, -2.196192, 0.4470588, 1, 0, 1,
-0.6555876, 0.2410764, -2.846971, 0.4392157, 1, 0, 1,
-0.653412, -0.4997542, -2.72006, 0.4352941, 1, 0, 1,
-0.650629, 0.09382067, -2.102878, 0.427451, 1, 0, 1,
-0.64338, 0.2887877, -0.5855381, 0.4235294, 1, 0, 1,
-0.6431816, -1.518599, -4.08399, 0.4156863, 1, 0, 1,
-0.636694, 1.278502, -1.146041, 0.4117647, 1, 0, 1,
-0.6355909, 0.393924, -2.170115, 0.4039216, 1, 0, 1,
-0.6288251, 0.09214745, 0.2920869, 0.3960784, 1, 0, 1,
-0.6244509, 0.6903136, 0.9319801, 0.3921569, 1, 0, 1,
-0.6186429, -1.193276, -2.659435, 0.3843137, 1, 0, 1,
-0.6176592, 0.5178636, -1.020296, 0.3803922, 1, 0, 1,
-0.6109306, 0.3043205, -0.3957667, 0.372549, 1, 0, 1,
-0.6090681, 0.2951659, 0.3012246, 0.3686275, 1, 0, 1,
-0.607553, -1.125157, -3.712664, 0.3607843, 1, 0, 1,
-0.6022322, -0.03799993, 0.6152099, 0.3568628, 1, 0, 1,
-0.6018549, 1.206823, -0.5817379, 0.3490196, 1, 0, 1,
-0.5968178, -0.8655635, -2.310412, 0.345098, 1, 0, 1,
-0.5967196, 0.1981681, -1.148231, 0.3372549, 1, 0, 1,
-0.5914124, -1.43845, -2.045727, 0.3333333, 1, 0, 1,
-0.5865379, -1.753709, -2.644842, 0.3254902, 1, 0, 1,
-0.5844812, -0.7864891, -2.422448, 0.3215686, 1, 0, 1,
-0.5805954, -0.4123867, -4.3079, 0.3137255, 1, 0, 1,
-0.5787324, -1.122445, -2.426392, 0.3098039, 1, 0, 1,
-0.5781468, -0.4883799, -1.246802, 0.3019608, 1, 0, 1,
-0.5752497, 0.7239426, -0.174032, 0.2941177, 1, 0, 1,
-0.5750475, 0.654977, -0.1954419, 0.2901961, 1, 0, 1,
-0.57068, -0.8109173, -1.717215, 0.282353, 1, 0, 1,
-0.5700702, 1.987675, -0.4084448, 0.2784314, 1, 0, 1,
-0.5652364, 0.8647839, -1.45802, 0.2705882, 1, 0, 1,
-0.5639355, -0.343429, -1.029679, 0.2666667, 1, 0, 1,
-0.5617465, 1.579857, -0.5739182, 0.2588235, 1, 0, 1,
-0.5602762, -0.09999169, -1.88021, 0.254902, 1, 0, 1,
-0.5595992, 1.111046, 0.1047466, 0.2470588, 1, 0, 1,
-0.557801, -2.820642, -3.400538, 0.2431373, 1, 0, 1,
-0.5566373, 0.7020409, 1.321165, 0.2352941, 1, 0, 1,
-0.5557209, 0.3955782, -0.4006316, 0.2313726, 1, 0, 1,
-0.554154, 0.9056, -0.697266, 0.2235294, 1, 0, 1,
-0.5510566, -1.362033, -1.449262, 0.2196078, 1, 0, 1,
-0.5499327, -0.2318334, -1.797137, 0.2117647, 1, 0, 1,
-0.5480257, 2.176796, 0.128095, 0.2078431, 1, 0, 1,
-0.5417132, -1.474696, -2.528824, 0.2, 1, 0, 1,
-0.5415074, -1.003133, -1.067419, 0.1921569, 1, 0, 1,
-0.5361456, 0.8901937, -0.8204664, 0.1882353, 1, 0, 1,
-0.5298651, -1.617856, -3.040913, 0.1803922, 1, 0, 1,
-0.5271379, 0.2162351, -1.449323, 0.1764706, 1, 0, 1,
-0.5204784, 0.3270388, -0.2130422, 0.1686275, 1, 0, 1,
-0.5161392, -1.414194, -3.689432, 0.1647059, 1, 0, 1,
-0.5155167, -0.3072552, -1.672783, 0.1568628, 1, 0, 1,
-0.5152572, 1.329512, -0.9495118, 0.1529412, 1, 0, 1,
-0.5140294, -0.7776028, -3.946885, 0.145098, 1, 0, 1,
-0.5128863, 0.2283825, -0.09420969, 0.1411765, 1, 0, 1,
-0.5117567, -0.477489, -1.799708, 0.1333333, 1, 0, 1,
-0.5100631, -1.050409, -3.658639, 0.1294118, 1, 0, 1,
-0.5096859, -1.102691, -3.227185, 0.1215686, 1, 0, 1,
-0.4974602, 0.9163773, -3.012891, 0.1176471, 1, 0, 1,
-0.490468, 0.5708945, -1.850221, 0.1098039, 1, 0, 1,
-0.4900454, 0.02902282, -1.860831, 0.1058824, 1, 0, 1,
-0.4894052, 0.9575008, -2.115123, 0.09803922, 1, 0, 1,
-0.4884426, 1.315064, -0.5974991, 0.09019608, 1, 0, 1,
-0.4852889, -0.2506562, -1.449288, 0.08627451, 1, 0, 1,
-0.4828104, 0.2731414, -1.213455, 0.07843138, 1, 0, 1,
-0.4780436, 0.2015263, -0.9670855, 0.07450981, 1, 0, 1,
-0.4769159, 0.7465467, 0.2955402, 0.06666667, 1, 0, 1,
-0.4726011, -0.3618184, -3.093736, 0.0627451, 1, 0, 1,
-0.4699995, 0.5738544, 0.08203693, 0.05490196, 1, 0, 1,
-0.4697773, -1.42825, -2.040674, 0.05098039, 1, 0, 1,
-0.4684365, -1.362407, -2.205095, 0.04313726, 1, 0, 1,
-0.4650795, 0.3487237, -2.679677, 0.03921569, 1, 0, 1,
-0.4641097, -2.171487, -2.046338, 0.03137255, 1, 0, 1,
-0.4483271, 0.9938753, 0.05797376, 0.02745098, 1, 0, 1,
-0.4411621, 0.620509, -1.159282, 0.01960784, 1, 0, 1,
-0.4403327, 0.4841497, -1.453088, 0.01568628, 1, 0, 1,
-0.4226789, 1.087656, -0.3763404, 0.007843138, 1, 0, 1,
-0.4186177, -0.7806093, -3.631319, 0.003921569, 1, 0, 1,
-0.417229, 0.7738926, -0.56773, 0, 1, 0.003921569, 1,
-0.4165157, -1.60565, -3.829949, 0, 1, 0.01176471, 1,
-0.4157174, 1.716257, -0.2306008, 0, 1, 0.01568628, 1,
-0.4121725, -1.707539, -2.278581, 0, 1, 0.02352941, 1,
-0.4120862, -0.7135313, -1.128968, 0, 1, 0.02745098, 1,
-0.4104697, 1.821413, 0.02580487, 0, 1, 0.03529412, 1,
-0.4091662, 0.3308944, 0.5725881, 0, 1, 0.03921569, 1,
-0.4074939, -0.8912871, -3.204864, 0, 1, 0.04705882, 1,
-0.406761, -0.379544, -2.358404, 0, 1, 0.05098039, 1,
-0.4064906, 0.3915672, -0.6189512, 0, 1, 0.05882353, 1,
-0.4027599, 0.1497694, -1.030487, 0, 1, 0.0627451, 1,
-0.4002736, 1.435716, -1.631323, 0, 1, 0.07058824, 1,
-0.3961096, -0.381609, -1.704031, 0, 1, 0.07450981, 1,
-0.3927778, -0.8112083, -2.27365, 0, 1, 0.08235294, 1,
-0.3916588, -1.89008, -3.989176, 0, 1, 0.08627451, 1,
-0.3909358, -0.6264046, -2.6837, 0, 1, 0.09411765, 1,
-0.3825752, 1.110838, -0.4384708, 0, 1, 0.1019608, 1,
-0.380911, 0.5213176, -1.059354, 0, 1, 0.1058824, 1,
-0.3791242, 0.1840978, -1.543328, 0, 1, 0.1137255, 1,
-0.3783509, -0.2723312, -2.13136, 0, 1, 0.1176471, 1,
-0.3743167, 0.9474588, -0.07226239, 0, 1, 0.1254902, 1,
-0.3640647, 2.987672, 0.1534656, 0, 1, 0.1294118, 1,
-0.3635962, -0.08980604, -2.815886, 0, 1, 0.1372549, 1,
-0.3628398, 0.1337965, -0.4712313, 0, 1, 0.1411765, 1,
-0.3626799, 2.494505, 0.6871471, 0, 1, 0.1490196, 1,
-0.3606952, -1.10808, -4.517451, 0, 1, 0.1529412, 1,
-0.3599901, -0.6510713, -3.430378, 0, 1, 0.1607843, 1,
-0.3597406, 0.1368612, -0.8933207, 0, 1, 0.1647059, 1,
-0.3588873, -0.8460806, -1.801066, 0, 1, 0.172549, 1,
-0.3570649, 1.401708, -1.083587, 0, 1, 0.1764706, 1,
-0.3503007, 0.4188059, 0.3581791, 0, 1, 0.1843137, 1,
-0.3450422, 0.3704745, -0.3165326, 0, 1, 0.1882353, 1,
-0.3448343, 0.5915875, -0.9069226, 0, 1, 0.1960784, 1,
-0.3426124, -1.518141, -2.008487, 0, 1, 0.2039216, 1,
-0.3421755, -0.3018076, -1.13168, 0, 1, 0.2078431, 1,
-0.3332709, 1.159474, -0.4856345, 0, 1, 0.2156863, 1,
-0.3280778, -0.5960174, -3.247995, 0, 1, 0.2196078, 1,
-0.3272173, 0.5221098, -0.8370083, 0, 1, 0.227451, 1,
-0.3258408, 0.2468691, -3.286504, 0, 1, 0.2313726, 1,
-0.3232315, 1.684039, -0.1458208, 0, 1, 0.2392157, 1,
-0.3201596, 1.114021, -0.5418355, 0, 1, 0.2431373, 1,
-0.3200319, 0.1415657, -0.9364647, 0, 1, 0.2509804, 1,
-0.3187835, -0.6631907, -3.323751, 0, 1, 0.254902, 1,
-0.3144445, -2.209705, -1.428153, 0, 1, 0.2627451, 1,
-0.3141555, -0.6073584, -1.336292, 0, 1, 0.2666667, 1,
-0.3084122, -0.8892361, -2.67699, 0, 1, 0.2745098, 1,
-0.3077772, 2.473129, -0.5197718, 0, 1, 0.2784314, 1,
-0.3055577, -0.4331062, -3.529581, 0, 1, 0.2862745, 1,
-0.3035609, 1.174972, -0.5826412, 0, 1, 0.2901961, 1,
-0.3006358, -0.02549557, -1.383198, 0, 1, 0.2980392, 1,
-0.3003934, -1.752115, -2.791084, 0, 1, 0.3058824, 1,
-0.2999518, 0.7549233, -0.4806658, 0, 1, 0.3098039, 1,
-0.2975993, 1.87191, -0.1155656, 0, 1, 0.3176471, 1,
-0.2967322, 1.06531, 0.1862678, 0, 1, 0.3215686, 1,
-0.2959936, -0.0899931, -2.355574, 0, 1, 0.3294118, 1,
-0.2958552, -0.7511557, -4.493279, 0, 1, 0.3333333, 1,
-0.2954533, -0.07599427, 0.3867008, 0, 1, 0.3411765, 1,
-0.2932586, -0.4570452, -3.640843, 0, 1, 0.345098, 1,
-0.2893475, 0.5293121, -1.125422, 0, 1, 0.3529412, 1,
-0.2804921, -1.146777, -2.52108, 0, 1, 0.3568628, 1,
-0.2799087, 0.417924, 0.9711896, 0, 1, 0.3647059, 1,
-0.2787646, -1.812809, -3.741768, 0, 1, 0.3686275, 1,
-0.2756104, 0.8357306, -0.7834266, 0, 1, 0.3764706, 1,
-0.2750693, -0.1546654, -2.085756, 0, 1, 0.3803922, 1,
-0.2739691, -0.2190074, -1.33104, 0, 1, 0.3882353, 1,
-0.2735499, -0.05765785, -3.52287, 0, 1, 0.3921569, 1,
-0.2708441, 0.1359098, -2.845949, 0, 1, 0.4, 1,
-0.2652838, 0.04579227, -1.432039, 0, 1, 0.4078431, 1,
-0.2628441, -0.7877777, -3.785949, 0, 1, 0.4117647, 1,
-0.262797, 1.446608, 1.010199, 0, 1, 0.4196078, 1,
-0.2611767, -1.144046, -3.204412, 0, 1, 0.4235294, 1,
-0.2578369, 1.600853, -0.02625193, 0, 1, 0.4313726, 1,
-0.2555637, 1.551338, -1.756444, 0, 1, 0.4352941, 1,
-0.2530683, -0.8937856, -3.093458, 0, 1, 0.4431373, 1,
-0.2511431, 1.292102, 0.4031057, 0, 1, 0.4470588, 1,
-0.2506497, 0.7433875, -2.10242, 0, 1, 0.454902, 1,
-0.2487047, -2.320169, -3.376092, 0, 1, 0.4588235, 1,
-0.24789, -0.6577342, -2.886713, 0, 1, 0.4666667, 1,
-0.2477029, 0.4085892, 0.05794461, 0, 1, 0.4705882, 1,
-0.2436792, -0.3654224, -2.02688, 0, 1, 0.4784314, 1,
-0.2412419, -0.5893264, -1.475737, 0, 1, 0.4823529, 1,
-0.240552, -0.5294084, -1.248942, 0, 1, 0.4901961, 1,
-0.2397263, -0.2366977, -0.2813093, 0, 1, 0.4941176, 1,
-0.2395577, -0.08819098, -0.3070498, 0, 1, 0.5019608, 1,
-0.2374243, 0.9252579, -1.46698, 0, 1, 0.509804, 1,
-0.2363663, 0.2426357, 0.7597582, 0, 1, 0.5137255, 1,
-0.23451, 0.4529853, 0.06095272, 0, 1, 0.5215687, 1,
-0.2306855, -0.09130449, -2.311227, 0, 1, 0.5254902, 1,
-0.228566, -1.07819, -3.833632, 0, 1, 0.5333334, 1,
-0.2285554, 0.4973924, 0.2822147, 0, 1, 0.5372549, 1,
-0.2273871, 0.3253119, 0.2318802, 0, 1, 0.5450981, 1,
-0.2270324, 0.4439931, -1.607042, 0, 1, 0.5490196, 1,
-0.2226606, -1.090226, -2.771415, 0, 1, 0.5568628, 1,
-0.2193883, 0.7138726, -0.1227498, 0, 1, 0.5607843, 1,
-0.2187224, 0.8002827, -0.8816017, 0, 1, 0.5686275, 1,
-0.2156173, 0.2895955, -1.812724, 0, 1, 0.572549, 1,
-0.2154124, -0.4204597, -3.784275, 0, 1, 0.5803922, 1,
-0.2123757, 0.8498352, 0.2520307, 0, 1, 0.5843138, 1,
-0.2077571, -0.522132, -1.653026, 0, 1, 0.5921569, 1,
-0.2068385, -0.1853751, -1.40326, 0, 1, 0.5960785, 1,
-0.2026807, 0.3570718, -1.286899, 0, 1, 0.6039216, 1,
-0.2013061, 0.9807416, -0.01893563, 0, 1, 0.6117647, 1,
-0.194848, 1.036111, 0.4171897, 0, 1, 0.6156863, 1,
-0.1936865, 0.6927686, 2.061686, 0, 1, 0.6235294, 1,
-0.1879174, 0.2749163, 0.623921, 0, 1, 0.627451, 1,
-0.1812415, -0.09862756, -0.4320207, 0, 1, 0.6352941, 1,
-0.1701946, -1.08787, -2.653253, 0, 1, 0.6392157, 1,
-0.1700083, -0.2849784, -2.756891, 0, 1, 0.6470588, 1,
-0.1669924, 0.8102847, -1.256789, 0, 1, 0.6509804, 1,
-0.1665338, -0.2440776, -2.078108, 0, 1, 0.6588235, 1,
-0.1662965, -0.8446232, -2.651897, 0, 1, 0.6627451, 1,
-0.1568739, -1.228814, -1.87321, 0, 1, 0.6705883, 1,
-0.1549604, -0.9760877, -3.659944, 0, 1, 0.6745098, 1,
-0.1542203, -0.9841136, -2.62838, 0, 1, 0.682353, 1,
-0.1448482, 0.05812673, -1.841332, 0, 1, 0.6862745, 1,
-0.1445986, 0.0428358, -1.889002, 0, 1, 0.6941177, 1,
-0.1408993, -0.6906395, -2.722418, 0, 1, 0.7019608, 1,
-0.1402019, -0.1683821, -3.019356, 0, 1, 0.7058824, 1,
-0.1362289, -1.031812, -2.601278, 0, 1, 0.7137255, 1,
-0.1345254, -0.2273848, -3.851658, 0, 1, 0.7176471, 1,
-0.130503, 1.195012, -0.5876697, 0, 1, 0.7254902, 1,
-0.1304267, 0.7747246, 1.408619, 0, 1, 0.7294118, 1,
-0.1279768, -0.1092188, -1.610078, 0, 1, 0.7372549, 1,
-0.1253146, 0.8757134, 0.06507913, 0, 1, 0.7411765, 1,
-0.124693, 3.037552, -0.8174975, 0, 1, 0.7490196, 1,
-0.1232394, -1.282141, -2.621618, 0, 1, 0.7529412, 1,
-0.1215614, -0.3405438, -2.310371, 0, 1, 0.7607843, 1,
-0.118549, 1.029927, -2.226806, 0, 1, 0.7647059, 1,
-0.118326, -0.08790899, -3.817326, 0, 1, 0.772549, 1,
-0.1167426, -2.383307, -4.067512, 0, 1, 0.7764706, 1,
-0.1157395, -0.9160941, -0.7961254, 0, 1, 0.7843137, 1,
-0.1156011, 0.29801, -0.06504437, 0, 1, 0.7882353, 1,
-0.1133837, -2.649834, -3.032958, 0, 1, 0.7960784, 1,
-0.1128682, 1.095876, 2.204994, 0, 1, 0.8039216, 1,
-0.1118707, 1.392464, -1.09469, 0, 1, 0.8078431, 1,
-0.1112105, 0.03745589, -1.029947, 0, 1, 0.8156863, 1,
-0.1110026, 0.9897199, -1.263134, 0, 1, 0.8196079, 1,
-0.1029843, 0.5643442, 0.165112, 0, 1, 0.827451, 1,
-0.09961463, -0.9101322, -1.914285, 0, 1, 0.8313726, 1,
-0.09811815, 0.0749044, -0.02663983, 0, 1, 0.8392157, 1,
-0.09666084, 1.007763, 0.1499899, 0, 1, 0.8431373, 1,
-0.09194787, -0.8917428, -3.301927, 0, 1, 0.8509804, 1,
-0.08988257, -2.275792, -2.752255, 0, 1, 0.854902, 1,
-0.08900236, -0.5744996, -2.005326, 0, 1, 0.8627451, 1,
-0.08869177, 0.2044606, -0.7458832, 0, 1, 0.8666667, 1,
-0.08610111, 2.355716, 1.523822, 0, 1, 0.8745098, 1,
-0.08452918, -1.423089, -2.714529, 0, 1, 0.8784314, 1,
-0.08184066, 0.7704567, -0.5549504, 0, 1, 0.8862745, 1,
-0.08036487, -0.4343207, -3.289907, 0, 1, 0.8901961, 1,
-0.07554723, -1.045143, -3.553761, 0, 1, 0.8980392, 1,
-0.06318306, 1.439333, -0.05781064, 0, 1, 0.9058824, 1,
-0.06203958, -0.6659712, -2.589266, 0, 1, 0.9098039, 1,
-0.06108412, -1.406088, -3.156508, 0, 1, 0.9176471, 1,
-0.06066553, -0.9209317, -1.661222, 0, 1, 0.9215686, 1,
-0.05885163, 0.9691575, 1.286234, 0, 1, 0.9294118, 1,
-0.05786998, 0.4154679, 0.1421498, 0, 1, 0.9333333, 1,
-0.05254359, -2.051194, -3.095271, 0, 1, 0.9411765, 1,
-0.05025171, -0.0964345, -2.816489, 0, 1, 0.945098, 1,
-0.04952126, 0.7266876, -0.05867062, 0, 1, 0.9529412, 1,
-0.04870439, 0.3439042, 0.2793698, 0, 1, 0.9568627, 1,
-0.04678379, -0.008810106, -2.118433, 0, 1, 0.9647059, 1,
-0.04652597, -0.2421684, -3.421126, 0, 1, 0.9686275, 1,
-0.0450861, 0.7223403, -0.1456897, 0, 1, 0.9764706, 1,
-0.04034615, -1.269158, -2.527388, 0, 1, 0.9803922, 1,
-0.03550772, 0.01197263, 0.773767, 0, 1, 0.9882353, 1,
-0.03468938, -2.631242, -3.45149, 0, 1, 0.9921569, 1,
-0.02924789, -2.183139, -4.331405, 0, 1, 1, 1,
-0.02823911, 3.883689, 0.8366246, 0, 0.9921569, 1, 1,
-0.02180587, 1.610216, 1.02526, 0, 0.9882353, 1, 1,
-0.02106083, -0.5270471, -3.107241, 0, 0.9803922, 1, 1,
-0.01891576, 1.097994, 0.7967262, 0, 0.9764706, 1, 1,
-0.01736384, -1.237827, -3.923154, 0, 0.9686275, 1, 1,
-0.01559998, 0.09843054, -0.1169624, 0, 0.9647059, 1, 1,
-0.01460026, -1.495202, -5.012861, 0, 0.9568627, 1, 1,
-0.00344094, -0.4211644, 0.03809542, 0, 0.9529412, 1, 1,
-0.00196969, 0.6842114, -1.251586, 0, 0.945098, 1, 1,
0.001405458, 0.4911956, 0.6533861, 0, 0.9411765, 1, 1,
0.003324846, -0.2607128, 1.199286, 0, 0.9333333, 1, 1,
0.006147306, -1.586475, 3.072555, 0, 0.9294118, 1, 1,
0.007520832, 0.7378809, -1.356885, 0, 0.9215686, 1, 1,
0.008599422, -0.7647179, 5.252485, 0, 0.9176471, 1, 1,
0.00995914, -0.02416794, 2.137765, 0, 0.9098039, 1, 1,
0.01127746, -0.5541919, 2.482268, 0, 0.9058824, 1, 1,
0.01419714, -1.04943, 3.710323, 0, 0.8980392, 1, 1,
0.01491665, 0.4522808, 0.2116663, 0, 0.8901961, 1, 1,
0.02104126, 0.0667626, 3.199409, 0, 0.8862745, 1, 1,
0.02185793, -0.5965761, 1.177123, 0, 0.8784314, 1, 1,
0.02280293, 0.4037518, 0.6770843, 0, 0.8745098, 1, 1,
0.02385455, 0.3162085, -0.02185933, 0, 0.8666667, 1, 1,
0.02442016, 0.2061584, -1.338089, 0, 0.8627451, 1, 1,
0.02468748, 1.108323, -0.1438237, 0, 0.854902, 1, 1,
0.02494041, -0.9089134, 2.639812, 0, 0.8509804, 1, 1,
0.02836999, 0.1145791, 1.523543, 0, 0.8431373, 1, 1,
0.02973581, 1.182594, 0.1890765, 0, 0.8392157, 1, 1,
0.033951, 0.6742692, 0.9824339, 0, 0.8313726, 1, 1,
0.03781704, -1.060699, 4.296967, 0, 0.827451, 1, 1,
0.03914592, -0.2373353, 2.059662, 0, 0.8196079, 1, 1,
0.04087898, 0.1097413, -0.560771, 0, 0.8156863, 1, 1,
0.04384203, 0.1717487, 0.2597785, 0, 0.8078431, 1, 1,
0.04402137, 0.436642, 1.281604, 0, 0.8039216, 1, 1,
0.04506393, 1.602911, -0.2512952, 0, 0.7960784, 1, 1,
0.05245623, 0.6068926, -2.607625, 0, 0.7882353, 1, 1,
0.05370354, -1.118833, 3.208994, 0, 0.7843137, 1, 1,
0.06283084, 0.3986644, 0.181966, 0, 0.7764706, 1, 1,
0.06326748, 1.149984, 0.1615758, 0, 0.772549, 1, 1,
0.06720628, -0.3546251, 2.329803, 0, 0.7647059, 1, 1,
0.07066672, 1.684042, 1.012589, 0, 0.7607843, 1, 1,
0.0712455, -0.02765204, 2.2499, 0, 0.7529412, 1, 1,
0.07406527, -1.993754, 3.447551, 0, 0.7490196, 1, 1,
0.07453754, -0.4021686, 3.298415, 0, 0.7411765, 1, 1,
0.07573453, 0.7309903, 0.5176717, 0, 0.7372549, 1, 1,
0.07669138, 0.5523273, -0.5556285, 0, 0.7294118, 1, 1,
0.07992022, 0.7044133, 0.1585721, 0, 0.7254902, 1, 1,
0.08158671, 0.9771054, 0.5202294, 0, 0.7176471, 1, 1,
0.08786577, -0.130077, 1.752971, 0, 0.7137255, 1, 1,
0.09007213, -0.85891, 2.648741, 0, 0.7058824, 1, 1,
0.09161939, 0.6269971, -0.1766268, 0, 0.6980392, 1, 1,
0.09485181, 1.95745, -1.078061, 0, 0.6941177, 1, 1,
0.1019861, -0.2337458, 2.717667, 0, 0.6862745, 1, 1,
0.1064552, -1.674621, 3.278325, 0, 0.682353, 1, 1,
0.1072101, 0.1053284, 1.773338, 0, 0.6745098, 1, 1,
0.1091728, 1.284711, 0.9069352, 0, 0.6705883, 1, 1,
0.1092953, -0.729497, 2.617685, 0, 0.6627451, 1, 1,
0.1104778, -0.4269337, 3.602212, 0, 0.6588235, 1, 1,
0.1114611, 0.02480998, -0.6912819, 0, 0.6509804, 1, 1,
0.1218703, 1.086651, -0.3180942, 0, 0.6470588, 1, 1,
0.125682, -0.9798499, 2.981201, 0, 0.6392157, 1, 1,
0.1266213, 0.4271525, 0.5756391, 0, 0.6352941, 1, 1,
0.1300251, 0.4061899, 0.7559521, 0, 0.627451, 1, 1,
0.1339067, 1.282706, 0.3448132, 0, 0.6235294, 1, 1,
0.1368193, 1.185771, -1.423083, 0, 0.6156863, 1, 1,
0.1414746, 0.6188678, 0.3364488, 0, 0.6117647, 1, 1,
0.145625, -0.3624607, 2.608398, 0, 0.6039216, 1, 1,
0.159684, -1.049515, 1.988928, 0, 0.5960785, 1, 1,
0.1615601, 2.449776, 0.8391033, 0, 0.5921569, 1, 1,
0.1634594, 0.0267914, 1.6998, 0, 0.5843138, 1, 1,
0.1671035, -0.1182759, 2.2307, 0, 0.5803922, 1, 1,
0.1752619, -0.1653093, 0.4665172, 0, 0.572549, 1, 1,
0.176912, -0.4973019, 2.629375, 0, 0.5686275, 1, 1,
0.1779987, -1.280141, 3.046637, 0, 0.5607843, 1, 1,
0.1787519, 0.7331715, -0.4284547, 0, 0.5568628, 1, 1,
0.1799093, 1.244004, -0.5660658, 0, 0.5490196, 1, 1,
0.1814569, -0.2031195, -0.009371816, 0, 0.5450981, 1, 1,
0.1826452, 0.2786777, -0.5698105, 0, 0.5372549, 1, 1,
0.1870949, -1.000027, 0.6619778, 0, 0.5333334, 1, 1,
0.1880666, -0.7940322, 2.465451, 0, 0.5254902, 1, 1,
0.1915685, -1.573334, 2.844294, 0, 0.5215687, 1, 1,
0.1946517, -0.3318704, 2.023411, 0, 0.5137255, 1, 1,
0.2025183, -0.4373998, 1.611176, 0, 0.509804, 1, 1,
0.2042113, -0.4854903, 2.710871, 0, 0.5019608, 1, 1,
0.2053988, -1.289864, 3.502943, 0, 0.4941176, 1, 1,
0.2057551, -0.7697825, 4.043451, 0, 0.4901961, 1, 1,
0.2074153, 0.1003152, 0.5793759, 0, 0.4823529, 1, 1,
0.2087724, -0.8798866, 3.593236, 0, 0.4784314, 1, 1,
0.2098578, -0.1515408, 0.769207, 0, 0.4705882, 1, 1,
0.2104723, 0.6750329, 0.3388278, 0, 0.4666667, 1, 1,
0.2120269, 0.2378231, 0.03338488, 0, 0.4588235, 1, 1,
0.2166532, -1.093923, 3.048282, 0, 0.454902, 1, 1,
0.2226317, 0.8766426, 0.9276832, 0, 0.4470588, 1, 1,
0.2249363, -0.2203126, 2.039344, 0, 0.4431373, 1, 1,
0.2288018, 0.6083949, -0.2446244, 0, 0.4352941, 1, 1,
0.2310435, -0.3209264, 4.005511, 0, 0.4313726, 1, 1,
0.2339401, -0.6760675, 2.586457, 0, 0.4235294, 1, 1,
0.2364552, 0.3404204, -0.1050341, 0, 0.4196078, 1, 1,
0.2378672, -0.6648628, 2.710963, 0, 0.4117647, 1, 1,
0.2389019, -1.460209, 3.001557, 0, 0.4078431, 1, 1,
0.2444416, -1.378316, 3.658596, 0, 0.4, 1, 1,
0.2445511, -2.21847, 3.50446, 0, 0.3921569, 1, 1,
0.245554, 0.8322207, -0.06721773, 0, 0.3882353, 1, 1,
0.2458282, -0.9006495, 3.617944, 0, 0.3803922, 1, 1,
0.2460939, -0.2800184, 2.807979, 0, 0.3764706, 1, 1,
0.2462715, 0.5211576, 0.2695585, 0, 0.3686275, 1, 1,
0.2465355, 0.6401702, 0.8157926, 0, 0.3647059, 1, 1,
0.2466145, 0.6633731, 0.2553909, 0, 0.3568628, 1, 1,
0.2516773, 0.8979164, -0.1542743, 0, 0.3529412, 1, 1,
0.2561597, 0.2875754, -0.1697218, 0, 0.345098, 1, 1,
0.2584395, -0.0761205, 3.676526, 0, 0.3411765, 1, 1,
0.2590125, 0.7051694, 0.7289516, 0, 0.3333333, 1, 1,
0.2597717, 0.5351053, 0.6634871, 0, 0.3294118, 1, 1,
0.2601249, 0.4984367, 1.164573, 0, 0.3215686, 1, 1,
0.2604245, -0.05606334, 2.181921, 0, 0.3176471, 1, 1,
0.2633161, 0.2911454, 1.610677, 0, 0.3098039, 1, 1,
0.269738, 0.0580657, 0.5764774, 0, 0.3058824, 1, 1,
0.2723566, -0.2203436, 2.619729, 0, 0.2980392, 1, 1,
0.2936637, 0.324996, 0.2266275, 0, 0.2901961, 1, 1,
0.2940612, 0.9839091, -0.8134206, 0, 0.2862745, 1, 1,
0.2950967, -0.3096129, 1.215252, 0, 0.2784314, 1, 1,
0.295433, 1.430807, 0.2152125, 0, 0.2745098, 1, 1,
0.2964197, -0.2322167, 2.315591, 0, 0.2666667, 1, 1,
0.3014925, 0.1616748, 1.774851, 0, 0.2627451, 1, 1,
0.3025251, 0.3459837, -0.04086526, 0, 0.254902, 1, 1,
0.3028755, -0.5940235, 2.438262, 0, 0.2509804, 1, 1,
0.3077062, 1.00177, 0.2985997, 0, 0.2431373, 1, 1,
0.3079494, 1.145915, -1.424194, 0, 0.2392157, 1, 1,
0.3108816, 1.309581, -0.3657052, 0, 0.2313726, 1, 1,
0.3144958, 0.3681189, 1.580003, 0, 0.227451, 1, 1,
0.3161049, 0.09450137, -0.08770336, 0, 0.2196078, 1, 1,
0.3209176, 0.5779965, -0.007162944, 0, 0.2156863, 1, 1,
0.3238643, 0.5638068, -0.3151879, 0, 0.2078431, 1, 1,
0.331384, 0.3405201, 0.408198, 0, 0.2039216, 1, 1,
0.3338802, 1.463022, 0.09235561, 0, 0.1960784, 1, 1,
0.3398226, 0.7560007, 0.1066722, 0, 0.1882353, 1, 1,
0.3402753, 1.318462, -1.191062, 0, 0.1843137, 1, 1,
0.3438379, 0.1469706, 0.4690165, 0, 0.1764706, 1, 1,
0.3440457, 1.836037, 2.371183, 0, 0.172549, 1, 1,
0.3443661, 0.5002277, 0.2183071, 0, 0.1647059, 1, 1,
0.35644, 0.7696757, -0.5032852, 0, 0.1607843, 1, 1,
0.3616329, -1.734039, 4.084539, 0, 0.1529412, 1, 1,
0.3620486, -0.4286657, 3.47649, 0, 0.1490196, 1, 1,
0.3685367, -0.325888, 2.215094, 0, 0.1411765, 1, 1,
0.3721093, 2.412625, -2.184242, 0, 0.1372549, 1, 1,
0.3752284, -1.214849, 2.23889, 0, 0.1294118, 1, 1,
0.3800547, 0.1214424, 0.5330665, 0, 0.1254902, 1, 1,
0.3812225, -0.5413177, 2.74394, 0, 0.1176471, 1, 1,
0.3816715, -0.37876, 4.059579, 0, 0.1137255, 1, 1,
0.3823569, -1.542071, 2.805641, 0, 0.1058824, 1, 1,
0.3840041, -0.4349406, 3.550615, 0, 0.09803922, 1, 1,
0.3842531, 0.2042699, 0.8670963, 0, 0.09411765, 1, 1,
0.384986, 0.1058002, 1.572008, 0, 0.08627451, 1, 1,
0.385179, -0.5717635, 1.221153, 0, 0.08235294, 1, 1,
0.3861036, -0.8073142, 1.867618, 0, 0.07450981, 1, 1,
0.3863651, -1.333326, 3.198476, 0, 0.07058824, 1, 1,
0.3902991, -0.07510816, 0.2800701, 0, 0.0627451, 1, 1,
0.3932006, 0.9467555, -1.327347, 0, 0.05882353, 1, 1,
0.3962997, 0.6801001, 1.158734, 0, 0.05098039, 1, 1,
0.3978841, -1.196779, 3.308791, 0, 0.04705882, 1, 1,
0.4016767, 0.4578567, 1.054582, 0, 0.03921569, 1, 1,
0.4043957, -0.09552684, 1.4493, 0, 0.03529412, 1, 1,
0.4088255, -0.005700972, 2.614118, 0, 0.02745098, 1, 1,
0.4112497, -1.205814, 2.337897, 0, 0.02352941, 1, 1,
0.4115011, -1.070173, 2.977956, 0, 0.01568628, 1, 1,
0.4121531, -0.0707498, 1.789799, 0, 0.01176471, 1, 1,
0.4122778, -0.9968224, 3.346374, 0, 0.003921569, 1, 1,
0.4197245, 0.04639911, 1.005738, 0.003921569, 0, 1, 1,
0.4200304, 0.8009099, -0.1543651, 0.007843138, 0, 1, 1,
0.4248984, -1.596387, 2.771259, 0.01568628, 0, 1, 1,
0.4260829, -0.3971939, 3.158267, 0.01960784, 0, 1, 1,
0.4320719, 0.5836287, 1.660595, 0.02745098, 0, 1, 1,
0.4336578, -1.529367, 2.342096, 0.03137255, 0, 1, 1,
0.4355012, 1.987736, 0.1334504, 0.03921569, 0, 1, 1,
0.4401026, -1.322582, 3.697354, 0.04313726, 0, 1, 1,
0.4404699, 0.4899317, 1.253179, 0.05098039, 0, 1, 1,
0.4409047, -0.871991, 1.493224, 0.05490196, 0, 1, 1,
0.4431416, 1.158202, -0.4081426, 0.0627451, 0, 1, 1,
0.4451975, 0.2428825, 0.4403525, 0.06666667, 0, 1, 1,
0.4496456, -0.4642448, 3.006112, 0.07450981, 0, 1, 1,
0.4518551, -0.7086437, 1.308689, 0.07843138, 0, 1, 1,
0.45708, 0.355667, 1.310005, 0.08627451, 0, 1, 1,
0.4654377, 0.8604957, 0.9892117, 0.09019608, 0, 1, 1,
0.4695834, -0.6899335, 1.659335, 0.09803922, 0, 1, 1,
0.4707624, 0.5595657, 1.311043, 0.1058824, 0, 1, 1,
0.4809746, 0.4085811, 2.155158, 0.1098039, 0, 1, 1,
0.4812172, -0.04023292, 1.318699, 0.1176471, 0, 1, 1,
0.4814256, -0.5551035, 2.16495, 0.1215686, 0, 1, 1,
0.4824465, -0.7482302, 1.45522, 0.1294118, 0, 1, 1,
0.4825246, 0.9530749, 0.8654478, 0.1333333, 0, 1, 1,
0.4885818, -0.4637645, 3.266219, 0.1411765, 0, 1, 1,
0.4896966, 0.9366351, 0.191397, 0.145098, 0, 1, 1,
0.4927571, 1.636489, -1.11776, 0.1529412, 0, 1, 1,
0.4951554, -1.347046, 3.094223, 0.1568628, 0, 1, 1,
0.4970913, 1.030423, -0.08677457, 0.1647059, 0, 1, 1,
0.5000558, 0.6133523, 0.396509, 0.1686275, 0, 1, 1,
0.5001665, -0.3494818, 3.547769, 0.1764706, 0, 1, 1,
0.5004904, -0.5734559, 2.931512, 0.1803922, 0, 1, 1,
0.5047399, 2.568455, -0.795948, 0.1882353, 0, 1, 1,
0.5053448, 0.8926543, 1.743369, 0.1921569, 0, 1, 1,
0.507366, -2.504442, 3.321959, 0.2, 0, 1, 1,
0.509461, 0.1167489, 0.7297595, 0.2078431, 0, 1, 1,
0.5109685, 0.2222632, 2.106783, 0.2117647, 0, 1, 1,
0.5123239, 1.474216, 0.5256405, 0.2196078, 0, 1, 1,
0.5133128, -0.8373423, 2.784034, 0.2235294, 0, 1, 1,
0.5154339, -0.1165323, 1.235709, 0.2313726, 0, 1, 1,
0.5163921, -1.88313, 3.617168, 0.2352941, 0, 1, 1,
0.5174447, -0.5853739, 3.373353, 0.2431373, 0, 1, 1,
0.5196987, 1.415589, 0.4372791, 0.2470588, 0, 1, 1,
0.5223591, -1.084398, 1.749915, 0.254902, 0, 1, 1,
0.5246469, 0.5912822, 1.023803, 0.2588235, 0, 1, 1,
0.5272564, -1.247256, 1.953271, 0.2666667, 0, 1, 1,
0.5313233, 0.6437073, 2.406282, 0.2705882, 0, 1, 1,
0.5318178, -0.1053747, 2.041873, 0.2784314, 0, 1, 1,
0.5373372, 0.1373444, 0.1753277, 0.282353, 0, 1, 1,
0.5390741, 0.1162205, 1.18324, 0.2901961, 0, 1, 1,
0.5405245, 1.663828, -0.4494787, 0.2941177, 0, 1, 1,
0.5414325, 1.358035, 0.9988397, 0.3019608, 0, 1, 1,
0.5443627, -2.297263, 1.551272, 0.3098039, 0, 1, 1,
0.5470946, 1.404061, 0.8301827, 0.3137255, 0, 1, 1,
0.5510441, 0.6300496, 1.797423, 0.3215686, 0, 1, 1,
0.553814, 0.6204552, -0.5470958, 0.3254902, 0, 1, 1,
0.5544218, -0.1758492, 1.666838, 0.3333333, 0, 1, 1,
0.5586437, -0.7098573, 4.346449, 0.3372549, 0, 1, 1,
0.5596283, -0.5225565, 2.511869, 0.345098, 0, 1, 1,
0.5664266, 0.2772163, -0.4718331, 0.3490196, 0, 1, 1,
0.5755278, 1.056043, -1.560647, 0.3568628, 0, 1, 1,
0.5785099, -0.1936047, 1.391217, 0.3607843, 0, 1, 1,
0.5792558, 0.2093004, 1.875595, 0.3686275, 0, 1, 1,
0.5802309, -0.2606345, 2.677995, 0.372549, 0, 1, 1,
0.5813047, 0.794534, 1.81712, 0.3803922, 0, 1, 1,
0.5849878, 0.6055179, 1.062953, 0.3843137, 0, 1, 1,
0.5855227, 1.052714, -0.6609902, 0.3921569, 0, 1, 1,
0.5891646, 0.2658134, 1.111135, 0.3960784, 0, 1, 1,
0.5936204, -1.466896, 2.990996, 0.4039216, 0, 1, 1,
0.6015038, -0.5179336, 2.52369, 0.4117647, 0, 1, 1,
0.6016616, 0.2286987, 1.947692, 0.4156863, 0, 1, 1,
0.6108731, 0.6260155, 1.279284, 0.4235294, 0, 1, 1,
0.6127837, 1.398929, -0.06118957, 0.427451, 0, 1, 1,
0.6225253, -0.5371163, 3.338085, 0.4352941, 0, 1, 1,
0.6227575, 1.584991, 1.462565, 0.4392157, 0, 1, 1,
0.6256334, 0.8390124, 0.7756358, 0.4470588, 0, 1, 1,
0.6259291, 1.13946, 2.129713, 0.4509804, 0, 1, 1,
0.626883, 0.6048722, 1.663152, 0.4588235, 0, 1, 1,
0.6308109, -0.2840193, 0.4802486, 0.4627451, 0, 1, 1,
0.6308873, 1.718443, 1.621074, 0.4705882, 0, 1, 1,
0.6318101, -0.3878708, 1.433119, 0.4745098, 0, 1, 1,
0.6319837, 0.03583109, 0.1150812, 0.4823529, 0, 1, 1,
0.6348609, 0.520416, 0.09386477, 0.4862745, 0, 1, 1,
0.64061, -0.714456, 2.228629, 0.4941176, 0, 1, 1,
0.6420069, 0.7808002, 0.7142531, 0.5019608, 0, 1, 1,
0.6432562, -1.306365, 5.237287, 0.5058824, 0, 1, 1,
0.6453279, 0.5822589, 1.036301, 0.5137255, 0, 1, 1,
0.646996, -0.5284751, 2.300423, 0.5176471, 0, 1, 1,
0.6546162, -1.263872, 1.950813, 0.5254902, 0, 1, 1,
0.6584151, -0.7026926, 1.774878, 0.5294118, 0, 1, 1,
0.6679793, 0.5371726, 0.06606938, 0.5372549, 0, 1, 1,
0.669173, 0.616672, 0.7268325, 0.5411765, 0, 1, 1,
0.6702268, -0.7957659, 1.81207, 0.5490196, 0, 1, 1,
0.680158, -1.037965, 3.241719, 0.5529412, 0, 1, 1,
0.6833005, -0.9314653, 1.574293, 0.5607843, 0, 1, 1,
0.6852666, 0.08322224, 0.8522259, 0.5647059, 0, 1, 1,
0.6864691, -0.6313078, 4.233818, 0.572549, 0, 1, 1,
0.6875275, -0.4546651, 0.8421344, 0.5764706, 0, 1, 1,
0.6894338, 0.9027694, -0.2913521, 0.5843138, 0, 1, 1,
0.6907855, 0.1041175, 1.576368, 0.5882353, 0, 1, 1,
0.6917776, -0.172003, 2.312433, 0.5960785, 0, 1, 1,
0.6956462, -0.3360159, 3.279095, 0.6039216, 0, 1, 1,
0.6987353, -1.129309, 1.638521, 0.6078432, 0, 1, 1,
0.7089706, -1.112483, 2.873383, 0.6156863, 0, 1, 1,
0.7098768, 1.534846, -0.272577, 0.6196079, 0, 1, 1,
0.7114748, 1.483433, -0.2976746, 0.627451, 0, 1, 1,
0.7197796, 1.870391, 1.744477, 0.6313726, 0, 1, 1,
0.7199408, -0.9004438, 2.720764, 0.6392157, 0, 1, 1,
0.7208647, 0.5336152, 1.719476, 0.6431373, 0, 1, 1,
0.7226463, -1.073747, 4.208387, 0.6509804, 0, 1, 1,
0.7261823, -0.4614623, 3.058426, 0.654902, 0, 1, 1,
0.7272801, -1.046131, 3.315843, 0.6627451, 0, 1, 1,
0.7291099, -0.6087025, 2.976185, 0.6666667, 0, 1, 1,
0.7339133, 0.9660511, 0.8322127, 0.6745098, 0, 1, 1,
0.7346625, 0.3706496, 1.513601, 0.6784314, 0, 1, 1,
0.7362303, -0.5094627, 2.364345, 0.6862745, 0, 1, 1,
0.7378235, 0.6414393, 0.1493086, 0.6901961, 0, 1, 1,
0.7384575, 0.5961454, 0.323736, 0.6980392, 0, 1, 1,
0.741183, 0.404105, 1.155501, 0.7058824, 0, 1, 1,
0.7458319, -0.2129718, 1.739004, 0.7098039, 0, 1, 1,
0.7462817, -0.404531, 1.360447, 0.7176471, 0, 1, 1,
0.7486392, -0.6769366, 2.64503, 0.7215686, 0, 1, 1,
0.7501636, 0.7505795, 0.4069244, 0.7294118, 0, 1, 1,
0.7511267, -0.2276731, 1.216008, 0.7333333, 0, 1, 1,
0.7595441, -0.3348662, 0.9543985, 0.7411765, 0, 1, 1,
0.7607121, -1.783967, 2.216814, 0.7450981, 0, 1, 1,
0.7713845, 2.940537, 0.04789644, 0.7529412, 0, 1, 1,
0.7729391, 2.085422, 0.498039, 0.7568628, 0, 1, 1,
0.7741159, 0.1943422, 2.590471, 0.7647059, 0, 1, 1,
0.7779821, 0.6335487, 2.788479, 0.7686275, 0, 1, 1,
0.7833651, 0.8840004, 2.65774, 0.7764706, 0, 1, 1,
0.7835368, 0.09240685, 1.628668, 0.7803922, 0, 1, 1,
0.7868062, -0.661788, 0.3639326, 0.7882353, 0, 1, 1,
0.795252, -2.167176, 4.105567, 0.7921569, 0, 1, 1,
0.7970636, 0.7520478, 1.390941, 0.8, 0, 1, 1,
0.7971693, 0.531454, 1.146271, 0.8078431, 0, 1, 1,
0.7977471, -1.850264, 3.228654, 0.8117647, 0, 1, 1,
0.7982227, 1.287397, 1.938851, 0.8196079, 0, 1, 1,
0.803188, -0.07800095, 1.073456, 0.8235294, 0, 1, 1,
0.8070736, 0.4978339, 2.270761, 0.8313726, 0, 1, 1,
0.813183, 1.103754, 0.6242169, 0.8352941, 0, 1, 1,
0.8149562, 1.185569, 2.939798, 0.8431373, 0, 1, 1,
0.8254233, 0.6548744, 1.47125, 0.8470588, 0, 1, 1,
0.8304055, 0.05398579, 1.455702, 0.854902, 0, 1, 1,
0.8332835, 0.2415616, 2.410481, 0.8588235, 0, 1, 1,
0.8422367, -0.4798604, 0.3328728, 0.8666667, 0, 1, 1,
0.844887, -0.1798045, 0.720011, 0.8705882, 0, 1, 1,
0.851967, 0.2865848, 2.057196, 0.8784314, 0, 1, 1,
0.8670576, 0.7458014, 1.072453, 0.8823529, 0, 1, 1,
0.8693913, -2.514881, 3.371397, 0.8901961, 0, 1, 1,
0.8699876, -0.4627735, 1.103627, 0.8941177, 0, 1, 1,
0.8709424, -0.02742176, 2.117225, 0.9019608, 0, 1, 1,
0.8730187, 0.6012892, 1.816483, 0.9098039, 0, 1, 1,
0.8746144, 1.330998, -0.8549787, 0.9137255, 0, 1, 1,
0.8750899, 1.115973, 0.8019568, 0.9215686, 0, 1, 1,
0.8754429, 0.3003794, 0.8842522, 0.9254902, 0, 1, 1,
0.8809642, 0.487746, 2.517189, 0.9333333, 0, 1, 1,
0.8813179, 1.554885, 0.02878272, 0.9372549, 0, 1, 1,
0.8827366, 0.02326569, -1.140925, 0.945098, 0, 1, 1,
0.8841105, 0.1450601, -0.006968894, 0.9490196, 0, 1, 1,
0.8862641, -0.6881738, 2.636003, 0.9568627, 0, 1, 1,
0.8897372, 0.7597306, 0.5623487, 0.9607843, 0, 1, 1,
0.8902113, 0.08167238, 0.3064108, 0.9686275, 0, 1, 1,
0.8956905, -0.2560439, 2.889845, 0.972549, 0, 1, 1,
0.897427, 0.1485253, 1.566744, 0.9803922, 0, 1, 1,
0.897862, -0.9421493, 2.990095, 0.9843137, 0, 1, 1,
0.8991095, 1.167539, 1.340809, 0.9921569, 0, 1, 1,
0.9115295, 0.8982916, 2.021642, 0.9960784, 0, 1, 1,
0.9199255, -0.03523465, 3.763224, 1, 0, 0.9960784, 1,
0.9208846, 0.3183197, -0.4395362, 1, 0, 0.9882353, 1,
0.9247711, 1.19412, 0.4436486, 1, 0, 0.9843137, 1,
0.9249745, -0.8909352, 1.201051, 1, 0, 0.9764706, 1,
0.9263011, 0.3557239, 2.630143, 1, 0, 0.972549, 1,
0.9348717, -0.3520584, 1.611681, 1, 0, 0.9647059, 1,
0.9407181, 1.392516, -1.237573, 1, 0, 0.9607843, 1,
0.9478993, 2.221564, 2.214638, 1, 0, 0.9529412, 1,
0.9642045, 2.459373, 1.114023, 1, 0, 0.9490196, 1,
0.9644614, 1.32386, -1.546881, 1, 0, 0.9411765, 1,
0.9679009, -1.102158, 2.193122, 1, 0, 0.9372549, 1,
0.9688026, 0.6734993, 0.9520591, 1, 0, 0.9294118, 1,
0.9716701, 1.580389, -0.1566024, 1, 0, 0.9254902, 1,
0.9717045, 0.7261447, 0.8483436, 1, 0, 0.9176471, 1,
0.9761853, 0.07872142, 1.596329, 1, 0, 0.9137255, 1,
0.9818716, 0.5555432, 0.8470728, 1, 0, 0.9058824, 1,
0.982484, 1.313731, 1.208717, 1, 0, 0.9019608, 1,
0.9842584, -0.2741828, 3.190814, 1, 0, 0.8941177, 1,
0.9943829, -0.08833664, 0.4220888, 1, 0, 0.8862745, 1,
0.9979024, 1.865558, 0.8485031, 1, 0, 0.8823529, 1,
1.003803, 0.6487799, 2.161241, 1, 0, 0.8745098, 1,
1.004628, -0.08684643, 1.386575, 1, 0, 0.8705882, 1,
1.005748, -0.4499711, 2.609999, 1, 0, 0.8627451, 1,
1.008542, 0.4258732, -0.006532032, 1, 0, 0.8588235, 1,
1.022433, -1.905764, 1.140466, 1, 0, 0.8509804, 1,
1.025207, 0.01769375, 1.588901, 1, 0, 0.8470588, 1,
1.025409, 0.6876498, 2.300257, 1, 0, 0.8392157, 1,
1.034045, 0.8157773, -1.49733, 1, 0, 0.8352941, 1,
1.038197, 0.2042848, 1.411694, 1, 0, 0.827451, 1,
1.043179, 0.3514589, -0.8763733, 1, 0, 0.8235294, 1,
1.047963, -0.7682772, 2.640552, 1, 0, 0.8156863, 1,
1.054734, 0.1155583, 0.5055478, 1, 0, 0.8117647, 1,
1.083925, 0.8672669, 1.238781, 1, 0, 0.8039216, 1,
1.092986, 2.311106, 0.4606092, 1, 0, 0.7960784, 1,
1.097306, 0.1665301, 1.041197, 1, 0, 0.7921569, 1,
1.099747, 2.282818, 0.6065449, 1, 0, 0.7843137, 1,
1.104285, 0.1407437, 2.035201, 1, 0, 0.7803922, 1,
1.104385, 0.1556398, 2.012876, 1, 0, 0.772549, 1,
1.109854, -0.4552501, 1.772989, 1, 0, 0.7686275, 1,
1.110964, 1.386165, 1.07191, 1, 0, 0.7607843, 1,
1.114796, -0.2830558, 0.955485, 1, 0, 0.7568628, 1,
1.117389, 0.5656578, -1.444486, 1, 0, 0.7490196, 1,
1.11864, -0.4551898, 2.80105, 1, 0, 0.7450981, 1,
1.119456, 1.453019, 0.5013141, 1, 0, 0.7372549, 1,
1.119553, 0.3116321, 0.1299175, 1, 0, 0.7333333, 1,
1.126201, -1.000172, 3.811155, 1, 0, 0.7254902, 1,
1.133261, 1.662557, 0.1529466, 1, 0, 0.7215686, 1,
1.13928, -1.172662, 2.596785, 1, 0, 0.7137255, 1,
1.142336, 1.184641, 0.6097309, 1, 0, 0.7098039, 1,
1.147811, -0.9725291, 3.111411, 1, 0, 0.7019608, 1,
1.149116, -0.720824, 2.88766, 1, 0, 0.6941177, 1,
1.151789, -1.203763, 3.013242, 1, 0, 0.6901961, 1,
1.152584, -0.4202356, 3.064723, 1, 0, 0.682353, 1,
1.153671, 2.447953, 1.259897, 1, 0, 0.6784314, 1,
1.176677, 1.579183, 0.6958143, 1, 0, 0.6705883, 1,
1.178199, 0.2397059, 1.084235, 1, 0, 0.6666667, 1,
1.185672, -1.087059, 2.407578, 1, 0, 0.6588235, 1,
1.189814, -1.926772, 2.538234, 1, 0, 0.654902, 1,
1.209338, 1.166409, -0.08568448, 1, 0, 0.6470588, 1,
1.21195, -1.541337, 2.809735, 1, 0, 0.6431373, 1,
1.216181, -0.6911827, 4.051866, 1, 0, 0.6352941, 1,
1.234343, -0.229877, 2.56544, 1, 0, 0.6313726, 1,
1.247641, 0.1885247, 2.791475, 1, 0, 0.6235294, 1,
1.250441, -2.077072, 4.295385, 1, 0, 0.6196079, 1,
1.254765, -1.502878, 2.701529, 1, 0, 0.6117647, 1,
1.255757, -1.247784, 3.309181, 1, 0, 0.6078432, 1,
1.255795, -0.1858623, 1.377675, 1, 0, 0.6, 1,
1.259586, -1.142464, 1.719073, 1, 0, 0.5921569, 1,
1.265645, 0.279491, 2.197119, 1, 0, 0.5882353, 1,
1.271251, 2.716081, 0.7064757, 1, 0, 0.5803922, 1,
1.279405, 1.025849, -0.1079174, 1, 0, 0.5764706, 1,
1.280481, -0.2219613, 2.181374, 1, 0, 0.5686275, 1,
1.290773, -0.7935148, -0.05794515, 1, 0, 0.5647059, 1,
1.295749, -0.1154565, 0.2677418, 1, 0, 0.5568628, 1,
1.296663, 2.483656, 2.347705, 1, 0, 0.5529412, 1,
1.299954, -0.05398967, 0.6686995, 1, 0, 0.5450981, 1,
1.317322, 0.3143011, 1.759179, 1, 0, 0.5411765, 1,
1.330028, 2.176809, 0.7695785, 1, 0, 0.5333334, 1,
1.334097, 1.235677, 1.245059, 1, 0, 0.5294118, 1,
1.342055, 0.2954221, 1.172, 1, 0, 0.5215687, 1,
1.350342, -0.2066453, 1.350905, 1, 0, 0.5176471, 1,
1.35915, 0.5061754, 1.613956, 1, 0, 0.509804, 1,
1.359601, 0.4434, -0.1121851, 1, 0, 0.5058824, 1,
1.3619, 0.0728303, 3.545668, 1, 0, 0.4980392, 1,
1.363094, 2.082565, 0.8433814, 1, 0, 0.4901961, 1,
1.363637, 0.3598421, 2.002119, 1, 0, 0.4862745, 1,
1.373088, -2.276036, 2.1214, 1, 0, 0.4784314, 1,
1.377869, 1.467616, 1.749904, 1, 0, 0.4745098, 1,
1.399396, 0.02138998, 2.240453, 1, 0, 0.4666667, 1,
1.40022, -0.06313234, 0.3786373, 1, 0, 0.4627451, 1,
1.414157, -1.660344, 2.200181, 1, 0, 0.454902, 1,
1.446565, -1.186951, 2.979177, 1, 0, 0.4509804, 1,
1.447297, 0.07518671, 0.6081339, 1, 0, 0.4431373, 1,
1.452022, 0.3457558, 0.9419129, 1, 0, 0.4392157, 1,
1.457307, 0.00265637, 1.430141, 1, 0, 0.4313726, 1,
1.462302, 1.465722, 0.8697694, 1, 0, 0.427451, 1,
1.463658, 0.8984029, -1.304774, 1, 0, 0.4196078, 1,
1.467823, 0.4538096, 2.31341, 1, 0, 0.4156863, 1,
1.469141, 0.5319371, 2.822984, 1, 0, 0.4078431, 1,
1.471676, -0.7750754, 1.59085, 1, 0, 0.4039216, 1,
1.476319, -0.725925, 2.493978, 1, 0, 0.3960784, 1,
1.485731, 0.8321785, -0.02222876, 1, 0, 0.3882353, 1,
1.486334, -0.9429845, 1.189735, 1, 0, 0.3843137, 1,
1.49247, 1.446363, 2.307189, 1, 0, 0.3764706, 1,
1.495646, 1.187393, 2.290628, 1, 0, 0.372549, 1,
1.500531, 0.5128369, -0.4379691, 1, 0, 0.3647059, 1,
1.506544, 0.3320176, 1.125945, 1, 0, 0.3607843, 1,
1.549681, -1.872944, 4.751286, 1, 0, 0.3529412, 1,
1.559157, 0.9929838, 1.254979, 1, 0, 0.3490196, 1,
1.562693, -1.307958, 2.425893, 1, 0, 0.3411765, 1,
1.57889, 0.7467742, 2.566416, 1, 0, 0.3372549, 1,
1.586091, 0.9840646, 0.3263213, 1, 0, 0.3294118, 1,
1.588585, -0.4708883, 2.380561, 1, 0, 0.3254902, 1,
1.596228, 0.3639806, 1.202147, 1, 0, 0.3176471, 1,
1.599123, 1.054697, 1.956617, 1, 0, 0.3137255, 1,
1.600274, -0.2604635, 2.086689, 1, 0, 0.3058824, 1,
1.613344, 1.036335, 2.224007, 1, 0, 0.2980392, 1,
1.619949, -0.1483362, 1.882237, 1, 0, 0.2941177, 1,
1.626645, -0.4960917, 2.742812, 1, 0, 0.2862745, 1,
1.639932, -0.148115, -0.6849954, 1, 0, 0.282353, 1,
1.645438, 1.923762, 0.4876541, 1, 0, 0.2745098, 1,
1.647249, 0.761122, -0.048302, 1, 0, 0.2705882, 1,
1.657161, -0.3520989, 1.078615, 1, 0, 0.2627451, 1,
1.663249, 1.61587, 1.374999, 1, 0, 0.2588235, 1,
1.670771, -1.348835, 1.741167, 1, 0, 0.2509804, 1,
1.67827, -1.442291, 1.643697, 1, 0, 0.2470588, 1,
1.678284, -0.3750015, 2.114058, 1, 0, 0.2392157, 1,
1.680633, 0.02987719, 2.266049, 1, 0, 0.2352941, 1,
1.682117, -0.4001536, 2.546687, 1, 0, 0.227451, 1,
1.683894, -0.1619532, 2.873672, 1, 0, 0.2235294, 1,
1.685647, -1.622731, 5.502724, 1, 0, 0.2156863, 1,
1.687042, -1.02121, 0.653828, 1, 0, 0.2117647, 1,
1.688136, 0.5074115, 0.5557917, 1, 0, 0.2039216, 1,
1.736034, -0.747014, 2.133874, 1, 0, 0.1960784, 1,
1.743648, 0.7566745, 0.9181152, 1, 0, 0.1921569, 1,
1.771078, 0.2752886, 0.1483824, 1, 0, 0.1843137, 1,
1.793863, -0.26036, 0.4066524, 1, 0, 0.1803922, 1,
1.816155, -0.178816, 3.023275, 1, 0, 0.172549, 1,
1.865672, -0.3044278, 1.490642, 1, 0, 0.1686275, 1,
1.874143, 0.2072477, 3.491003, 1, 0, 0.1607843, 1,
1.877928, -0.3300335, 1.94906, 1, 0, 0.1568628, 1,
1.889566, -0.2831428, 0.9858024, 1, 0, 0.1490196, 1,
1.892547, 1.269956, -0.2468249, 1, 0, 0.145098, 1,
1.934915, -0.4391851, 1.584051, 1, 0, 0.1372549, 1,
1.936281, 1.365465, -0.9509791, 1, 0, 0.1333333, 1,
1.939687, 1.589859, 0.92879, 1, 0, 0.1254902, 1,
1.947268, 0.3031962, 0.1387366, 1, 0, 0.1215686, 1,
1.981516, 0.6364314, 0.5500637, 1, 0, 0.1137255, 1,
2.005755, -1.442835, 3.881847, 1, 0, 0.1098039, 1,
2.016304, 0.6325921, 1.276932, 1, 0, 0.1019608, 1,
2.019995, 0.3645723, 0.944158, 1, 0, 0.09411765, 1,
2.104713, 0.8734349, -0.2057648, 1, 0, 0.09019608, 1,
2.164708, 0.829386, 2.531046, 1, 0, 0.08235294, 1,
2.340549, 0.9607305, 1.563748, 1, 0, 0.07843138, 1,
2.366028, 1.089227, 2.068542, 1, 0, 0.07058824, 1,
2.373502, -1.130909, 0.9961428, 1, 0, 0.06666667, 1,
2.621682, 1.586044, 2.177674, 1, 0, 0.05882353, 1,
2.635433, -1.24068, 1.039548, 1, 0, 0.05490196, 1,
2.742242, 0.4498253, -0.6716522, 1, 0, 0.04705882, 1,
2.75165, -0.7969186, 0.7917524, 1, 0, 0.04313726, 1,
2.995009, -0.3444801, 2.582348, 1, 0, 0.03529412, 1,
3.009017, -1.399102, 1.56504, 1, 0, 0.03137255, 1,
3.12263, -0.8275321, 1.004971, 1, 0, 0.02352941, 1,
3.127861, 0.3997386, -0.2727704, 1, 0, 0.01960784, 1,
3.25843, 1.19283, 0.6925266, 1, 0, 0.01176471, 1,
3.645895, -0.763245, 2.627172, 1, 0, 0.007843138, 1
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
0.08390653, -4.250021, -6.933174, 0, -0.5, 0.5, 0.5,
0.08390653, -4.250021, -6.933174, 1, -0.5, 0.5, 0.5,
0.08390653, -4.250021, -6.933174, 1, 1.5, 0.5, 0.5,
0.08390653, -4.250021, -6.933174, 0, 1.5, 0.5, 0.5
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
-4.685596, 0.4062586, -6.933174, 0, -0.5, 0.5, 0.5,
-4.685596, 0.4062586, -6.933174, 1, -0.5, 0.5, 0.5,
-4.685596, 0.4062586, -6.933174, 1, 1.5, 0.5, 0.5,
-4.685596, 0.4062586, -6.933174, 0, 1.5, 0.5, 0.5
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
-4.685596, -4.250021, 0.1859658, 0, -0.5, 0.5, 0.5,
-4.685596, -4.250021, 0.1859658, 1, -0.5, 0.5, 0.5,
-4.685596, -4.250021, 0.1859658, 1, 1.5, 0.5, 0.5,
-4.685596, -4.250021, 0.1859658, 0, 1.5, 0.5, 0.5
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
-2, -3.175494, -5.290296,
2, -3.175494, -5.290296,
-2, -3.175494, -5.290296,
-2, -3.354582, -5.564108,
0, -3.175494, -5.290296,
0, -3.354582, -5.564108,
2, -3.175494, -5.290296,
2, -3.354582, -5.564108
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
-2, -3.712757, -6.111734, 0, -0.5, 0.5, 0.5,
-2, -3.712757, -6.111734, 1, -0.5, 0.5, 0.5,
-2, -3.712757, -6.111734, 1, 1.5, 0.5, 0.5,
-2, -3.712757, -6.111734, 0, 1.5, 0.5, 0.5,
0, -3.712757, -6.111734, 0, -0.5, 0.5, 0.5,
0, -3.712757, -6.111734, 1, -0.5, 0.5, 0.5,
0, -3.712757, -6.111734, 1, 1.5, 0.5, 0.5,
0, -3.712757, -6.111734, 0, 1.5, 0.5, 0.5,
2, -3.712757, -6.111734, 0, -0.5, 0.5, 0.5,
2, -3.712757, -6.111734, 1, -0.5, 0.5, 0.5,
2, -3.712757, -6.111734, 1, 1.5, 0.5, 0.5,
2, -3.712757, -6.111734, 0, 1.5, 0.5, 0.5
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
-3.584942, -3, -5.290296,
-3.584942, 3, -5.290296,
-3.584942, -3, -5.290296,
-3.768384, -3, -5.564108,
-3.584942, -2, -5.290296,
-3.768384, -2, -5.564108,
-3.584942, -1, -5.290296,
-3.768384, -1, -5.564108,
-3.584942, 0, -5.290296,
-3.768384, 0, -5.564108,
-3.584942, 1, -5.290296,
-3.768384, 1, -5.564108,
-3.584942, 2, -5.290296,
-3.768384, 2, -5.564108,
-3.584942, 3, -5.290296,
-3.768384, 3, -5.564108
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
-4.135269, -3, -6.111734, 0, -0.5, 0.5, 0.5,
-4.135269, -3, -6.111734, 1, -0.5, 0.5, 0.5,
-4.135269, -3, -6.111734, 1, 1.5, 0.5, 0.5,
-4.135269, -3, -6.111734, 0, 1.5, 0.5, 0.5,
-4.135269, -2, -6.111734, 0, -0.5, 0.5, 0.5,
-4.135269, -2, -6.111734, 1, -0.5, 0.5, 0.5,
-4.135269, -2, -6.111734, 1, 1.5, 0.5, 0.5,
-4.135269, -2, -6.111734, 0, 1.5, 0.5, 0.5,
-4.135269, -1, -6.111734, 0, -0.5, 0.5, 0.5,
-4.135269, -1, -6.111734, 1, -0.5, 0.5, 0.5,
-4.135269, -1, -6.111734, 1, 1.5, 0.5, 0.5,
-4.135269, -1, -6.111734, 0, 1.5, 0.5, 0.5,
-4.135269, 0, -6.111734, 0, -0.5, 0.5, 0.5,
-4.135269, 0, -6.111734, 1, -0.5, 0.5, 0.5,
-4.135269, 0, -6.111734, 1, 1.5, 0.5, 0.5,
-4.135269, 0, -6.111734, 0, 1.5, 0.5, 0.5,
-4.135269, 1, -6.111734, 0, -0.5, 0.5, 0.5,
-4.135269, 1, -6.111734, 1, -0.5, 0.5, 0.5,
-4.135269, 1, -6.111734, 1, 1.5, 0.5, 0.5,
-4.135269, 1, -6.111734, 0, 1.5, 0.5, 0.5,
-4.135269, 2, -6.111734, 0, -0.5, 0.5, 0.5,
-4.135269, 2, -6.111734, 1, -0.5, 0.5, 0.5,
-4.135269, 2, -6.111734, 1, 1.5, 0.5, 0.5,
-4.135269, 2, -6.111734, 0, 1.5, 0.5, 0.5,
-4.135269, 3, -6.111734, 0, -0.5, 0.5, 0.5,
-4.135269, 3, -6.111734, 1, -0.5, 0.5, 0.5,
-4.135269, 3, -6.111734, 1, 1.5, 0.5, 0.5,
-4.135269, 3, -6.111734, 0, 1.5, 0.5, 0.5
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
-3.584942, -3.175494, -4,
-3.584942, -3.175494, 4,
-3.584942, -3.175494, -4,
-3.768384, -3.354582, -4,
-3.584942, -3.175494, -2,
-3.768384, -3.354582, -2,
-3.584942, -3.175494, 0,
-3.768384, -3.354582, 0,
-3.584942, -3.175494, 2,
-3.768384, -3.354582, 2,
-3.584942, -3.175494, 4,
-3.768384, -3.354582, 4
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
-4.135269, -3.712757, -4, 0, -0.5, 0.5, 0.5,
-4.135269, -3.712757, -4, 1, -0.5, 0.5, 0.5,
-4.135269, -3.712757, -4, 1, 1.5, 0.5, 0.5,
-4.135269, -3.712757, -4, 0, 1.5, 0.5, 0.5,
-4.135269, -3.712757, -2, 0, -0.5, 0.5, 0.5,
-4.135269, -3.712757, -2, 1, -0.5, 0.5, 0.5,
-4.135269, -3.712757, -2, 1, 1.5, 0.5, 0.5,
-4.135269, -3.712757, -2, 0, 1.5, 0.5, 0.5,
-4.135269, -3.712757, 0, 0, -0.5, 0.5, 0.5,
-4.135269, -3.712757, 0, 1, -0.5, 0.5, 0.5,
-4.135269, -3.712757, 0, 1, 1.5, 0.5, 0.5,
-4.135269, -3.712757, 0, 0, 1.5, 0.5, 0.5,
-4.135269, -3.712757, 2, 0, -0.5, 0.5, 0.5,
-4.135269, -3.712757, 2, 1, -0.5, 0.5, 0.5,
-4.135269, -3.712757, 2, 1, 1.5, 0.5, 0.5,
-4.135269, -3.712757, 2, 0, 1.5, 0.5, 0.5,
-4.135269, -3.712757, 4, 0, -0.5, 0.5, 0.5,
-4.135269, -3.712757, 4, 1, -0.5, 0.5, 0.5,
-4.135269, -3.712757, 4, 1, 1.5, 0.5, 0.5,
-4.135269, -3.712757, 4, 0, 1.5, 0.5, 0.5
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
-3.584942, -3.175494, -5.290296,
-3.584942, 3.988012, -5.290296,
-3.584942, -3.175494, 5.662227,
-3.584942, 3.988012, 5.662227,
-3.584942, -3.175494, -5.290296,
-3.584942, -3.175494, 5.662227,
-3.584942, 3.988012, -5.290296,
-3.584942, 3.988012, 5.662227,
-3.584942, -3.175494, -5.290296,
3.752755, -3.175494, -5.290296,
-3.584942, -3.175494, 5.662227,
3.752755, -3.175494, 5.662227,
-3.584942, 3.988012, -5.290296,
3.752755, 3.988012, -5.290296,
-3.584942, 3.988012, 5.662227,
3.752755, 3.988012, 5.662227,
3.752755, -3.175494, -5.290296,
3.752755, 3.988012, -5.290296,
3.752755, -3.175494, 5.662227,
3.752755, 3.988012, 5.662227,
3.752755, -3.175494, -5.290296,
3.752755, -3.175494, 5.662227,
3.752755, 3.988012, -5.290296,
3.752755, 3.988012, 5.662227
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
var radius = 8.011762;
var distance = 35.64523;
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
mvMatrix.translate( -0.08390653, -0.4062586, -0.1859658 );
mvMatrix.scale( 1.180544, 1.209251, 0.7909113 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.64523);
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
imidazole_carboxamid<-read.table("imidazole_carboxamid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-imidazole_carboxamid$V2
```

```
## Error in eval(expr, envir, enclos): object 'imidazole_carboxamid' not found
```

```r
y<-imidazole_carboxamid$V3
```

```
## Error in eval(expr, envir, enclos): object 'imidazole_carboxamid' not found
```

```r
z<-imidazole_carboxamid$V4
```

```
## Error in eval(expr, envir, enclos): object 'imidazole_carboxamid' not found
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
-3.478082, -1.276118, -2.356236, 0, 0, 1, 1, 1,
-3.418225, -2.388512, -1.619972, 1, 0, 0, 1, 1,
-2.975639, -0.341901, -2.086592, 1, 0, 0, 1, 1,
-2.691258, -0.8092014, -2.764893, 1, 0, 0, 1, 1,
-2.591025, -1.131581, -4.409632, 1, 0, 0, 1, 1,
-2.588897, -2.009585, -3.015025, 1, 0, 0, 1, 1,
-2.568538, 0.9514099, 0.7179803, 0, 0, 0, 1, 1,
-2.550157, -0.6649979, -1.725741, 0, 0, 0, 1, 1,
-2.402411, -0.03988723, -0.9084185, 0, 0, 0, 1, 1,
-2.30659, -0.2886539, -1.395961, 0, 0, 0, 1, 1,
-2.2944, 0.6072692, -1.47326, 0, 0, 0, 1, 1,
-2.256626, 0.9484729, -1.330527, 0, 0, 0, 1, 1,
-2.226902, -0.3371976, -3.140895, 0, 0, 0, 1, 1,
-2.181703, 0.2869751, -2.551517, 1, 1, 1, 1, 1,
-2.126556, 0.5742264, -2.161116, 1, 1, 1, 1, 1,
-2.110588, 0.4905484, -0.4764134, 1, 1, 1, 1, 1,
-2.110343, 0.02223084, -1.993347, 1, 1, 1, 1, 1,
-2.06254, 0.5066819, 0.8339189, 1, 1, 1, 1, 1,
-2.004257, -0.07102948, -3.961968, 1, 1, 1, 1, 1,
-2.001645, -1.234112, -1.98731, 1, 1, 1, 1, 1,
-2.001116, -0.5832328, -2.227813, 1, 1, 1, 1, 1,
-1.975536, 0.2853062, -2.528392, 1, 1, 1, 1, 1,
-1.961995, -1.047177, -1.247623, 1, 1, 1, 1, 1,
-1.959688, 0.6115602, -2.087363, 1, 1, 1, 1, 1,
-1.957457, -1.122748, -2.934675, 1, 1, 1, 1, 1,
-1.926857, 0.3824539, -2.092765, 1, 1, 1, 1, 1,
-1.862582, 0.1753255, -2.492569, 1, 1, 1, 1, 1,
-1.845413, -0.1534622, -3.276097, 1, 1, 1, 1, 1,
-1.834725, -0.9454563, -0.9225522, 0, 0, 1, 1, 1,
-1.831937, -0.6218665, -1.715936, 1, 0, 0, 1, 1,
-1.831462, 1.287558, -1.014151, 1, 0, 0, 1, 1,
-1.817658, 1.364146, -0.7572244, 1, 0, 0, 1, 1,
-1.806567, 0.9447462, -1.422981, 1, 0, 0, 1, 1,
-1.805515, 2.285382, -1.570897, 1, 0, 0, 1, 1,
-1.803228, -0.8199427, -1.990703, 0, 0, 0, 1, 1,
-1.798079, -0.5357137, -3.013714, 0, 0, 0, 1, 1,
-1.790527, 0.6308605, -1.132982, 0, 0, 0, 1, 1,
-1.790171, -0.3939241, -2.323091, 0, 0, 0, 1, 1,
-1.781695, 0.5643659, 0.8859148, 0, 0, 0, 1, 1,
-1.749125, 1.408057, 0.6530604, 0, 0, 0, 1, 1,
-1.734416, -0.7709185, -1.660703, 0, 0, 0, 1, 1,
-1.727648, 0.456975, -1.207078, 1, 1, 1, 1, 1,
-1.696503, 0.5325022, -0.8059565, 1, 1, 1, 1, 1,
-1.693404, 1.766934, -1.316382, 1, 1, 1, 1, 1,
-1.687467, 0.4831393, -0.8561476, 1, 1, 1, 1, 1,
-1.67867, -0.4635872, -1.742407, 1, 1, 1, 1, 1,
-1.671773, -0.3805965, -3.575772, 1, 1, 1, 1, 1,
-1.661699, -0.222228, -2.664685, 1, 1, 1, 1, 1,
-1.652336, 0.8471513, 0.3321952, 1, 1, 1, 1, 1,
-1.646818, -1.148374, -1.240344, 1, 1, 1, 1, 1,
-1.645702, -0.1392129, -2.273846, 1, 1, 1, 1, 1,
-1.641069, 0.1022693, -2.484682, 1, 1, 1, 1, 1,
-1.635421, -0.2648575, -0.2717659, 1, 1, 1, 1, 1,
-1.585392, -0.9429973, -3.334361, 1, 1, 1, 1, 1,
-1.571208, -0.486618, -2.156816, 1, 1, 1, 1, 1,
-1.564642, 0.4287175, -1.543709, 1, 1, 1, 1, 1,
-1.560804, -0.6923774, -3.161686, 0, 0, 1, 1, 1,
-1.558315, 0.3504579, -1.242493, 1, 0, 0, 1, 1,
-1.557743, -0.2276313, 1.205312, 1, 0, 0, 1, 1,
-1.547739, -0.4156467, -1.723387, 1, 0, 0, 1, 1,
-1.535127, 0.8961203, -1.927045, 1, 0, 0, 1, 1,
-1.519225, 0.04303838, -2.631761, 1, 0, 0, 1, 1,
-1.518478, -1.362448, -3.668406, 0, 0, 0, 1, 1,
-1.515192, 1.336365, 0.4060591, 0, 0, 0, 1, 1,
-1.502231, -0.2265293, -2.277441, 0, 0, 0, 1, 1,
-1.498504, -1.120825, -1.394345, 0, 0, 0, 1, 1,
-1.49384, -1.609784, -2.069502, 0, 0, 0, 1, 1,
-1.488519, -0.7527087, -1.002913, 0, 0, 0, 1, 1,
-1.487839, 0.02167997, -3.155088, 0, 0, 0, 1, 1,
-1.486691, 0.5169364, 0.8210971, 1, 1, 1, 1, 1,
-1.471859, 0.1459224, -1.843878, 1, 1, 1, 1, 1,
-1.462732, 0.6311527, -0.6922138, 1, 1, 1, 1, 1,
-1.454601, -1.321565, -1.802993, 1, 1, 1, 1, 1,
-1.453301, -0.453508, -2.180693, 1, 1, 1, 1, 1,
-1.451463, -0.7956221, -1.786776, 1, 1, 1, 1, 1,
-1.446788, -0.9925316, -1.819771, 1, 1, 1, 1, 1,
-1.441874, 0.5571433, -0.7020411, 1, 1, 1, 1, 1,
-1.427768, -0.3122808, 0.5464157, 1, 1, 1, 1, 1,
-1.413066, -0.6388018, -2.757966, 1, 1, 1, 1, 1,
-1.406349, -0.1537242, -0.9243523, 1, 1, 1, 1, 1,
-1.403245, 0.4044829, -1.912239, 1, 1, 1, 1, 1,
-1.397575, -0.04498203, -2.250927, 1, 1, 1, 1, 1,
-1.392812, -0.9907799, -3.457445, 1, 1, 1, 1, 1,
-1.383478, 1.459973, 0.7103373, 1, 1, 1, 1, 1,
-1.37567, 0.6282916, -2.987771, 0, 0, 1, 1, 1,
-1.374026, 1.344739, -1.30534, 1, 0, 0, 1, 1,
-1.357721, 1.029388, -2.212525, 1, 0, 0, 1, 1,
-1.35031, -0.1800491, -2.090159, 1, 0, 0, 1, 1,
-1.346322, -0.3663742, -1.259325, 1, 0, 0, 1, 1,
-1.338644, -0.2179958, -0.2898527, 1, 0, 0, 1, 1,
-1.336869, -0.2142511, -1.486696, 0, 0, 0, 1, 1,
-1.329287, 0.315584, -0.6798905, 0, 0, 0, 1, 1,
-1.327167, 1.369897, -0.5975406, 0, 0, 0, 1, 1,
-1.32439, -0.1506599, -2.463376, 0, 0, 0, 1, 1,
-1.324015, -0.1688673, -1.111136, 0, 0, 0, 1, 1,
-1.320346, 1.110825, -1.340104, 0, 0, 0, 1, 1,
-1.313677, 0.2365295, -2.289969, 0, 0, 0, 1, 1,
-1.304675, -0.9559624, -1.742103, 1, 1, 1, 1, 1,
-1.302811, -0.2409066, -3.043005, 1, 1, 1, 1, 1,
-1.291491, -0.2389753, -3.909367, 1, 1, 1, 1, 1,
-1.290128, 0.1186656, -2.748053, 1, 1, 1, 1, 1,
-1.28511, 1.458174, 0.6602556, 1, 1, 1, 1, 1,
-1.281398, -0.7801425, -2.330143, 1, 1, 1, 1, 1,
-1.279358, -0.3336677, -0.7231773, 1, 1, 1, 1, 1,
-1.279218, -0.2201302, -3.156755, 1, 1, 1, 1, 1,
-1.275883, -0.1839673, -0.7896357, 1, 1, 1, 1, 1,
-1.274246, -0.542919, -1.485825, 1, 1, 1, 1, 1,
-1.27207, 0.00974343, -1.904936, 1, 1, 1, 1, 1,
-1.268924, -1.519361, -2.306073, 1, 1, 1, 1, 1,
-1.263804, 0.01618672, -1.946205, 1, 1, 1, 1, 1,
-1.250633, -0.2770686, -0.5879833, 1, 1, 1, 1, 1,
-1.247664, -0.2029186, -2.124568, 1, 1, 1, 1, 1,
-1.246122, 0.05428074, -0.910679, 0, 0, 1, 1, 1,
-1.242486, 0.8000948, 1.105579, 1, 0, 0, 1, 1,
-1.235444, -1.094006, -3.537012, 1, 0, 0, 1, 1,
-1.234473, 0.3423804, -1.110708, 1, 0, 0, 1, 1,
-1.225171, -0.5388057, -4.000885, 1, 0, 0, 1, 1,
-1.224253, 1.01152, 0.4158253, 1, 0, 0, 1, 1,
-1.220871, 1.18336, -1.582726, 0, 0, 0, 1, 1,
-1.220772, 0.1385492, -1.975454, 0, 0, 0, 1, 1,
-1.218698, -0.9108239, -2.63239, 0, 0, 0, 1, 1,
-1.215734, 0.3036721, 0.08226716, 0, 0, 0, 1, 1,
-1.211604, 1.265546, 0.5771379, 0, 0, 0, 1, 1,
-1.205786, -0.05446764, -1.497536, 0, 0, 0, 1, 1,
-1.204566, -0.4707738, -2.209377, 0, 0, 0, 1, 1,
-1.203032, 0.1368426, -2.085175, 1, 1, 1, 1, 1,
-1.196928, -3.071172, -1.910643, 1, 1, 1, 1, 1,
-1.193635, 0.1345804, -1.002373, 1, 1, 1, 1, 1,
-1.191527, 2.127931, 1.122914, 1, 1, 1, 1, 1,
-1.17441, -1.155885, -2.372128, 1, 1, 1, 1, 1,
-1.172423, -0.1866574, -1.562055, 1, 1, 1, 1, 1,
-1.172404, -0.2500465, -2.49294, 1, 1, 1, 1, 1,
-1.161494, -0.5992807, -3.712466, 1, 1, 1, 1, 1,
-1.160395, -1.474795, -2.946983, 1, 1, 1, 1, 1,
-1.153923, 0.3845025, -1.993461, 1, 1, 1, 1, 1,
-1.149646, -0.2608401, 0.1836491, 1, 1, 1, 1, 1,
-1.134592, -0.9512168, -1.902657, 1, 1, 1, 1, 1,
-1.129114, 1.196704, -0.1567439, 1, 1, 1, 1, 1,
-1.125788, 0.9742282, -1.109823, 1, 1, 1, 1, 1,
-1.123152, 0.1882734, -2.714686, 1, 1, 1, 1, 1,
-1.111623, 0.8101253, -1.842383, 0, 0, 1, 1, 1,
-1.109802, -0.2449522, -2.80741, 1, 0, 0, 1, 1,
-1.107769, -0.5228894, -1.514812, 1, 0, 0, 1, 1,
-1.101744, 0.8562752, 1.418223, 1, 0, 0, 1, 1,
-1.100492, -0.7091865, -2.86299, 1, 0, 0, 1, 1,
-1.076995, 0.09225216, -2.2406, 1, 0, 0, 1, 1,
-1.060747, 0.7094733, 2.458865, 0, 0, 0, 1, 1,
-1.060647, 0.5230947, -0.702538, 0, 0, 0, 1, 1,
-1.057933, -1.211664, -3.837547, 0, 0, 0, 1, 1,
-1.050817, 0.4306627, 0.6488803, 0, 0, 0, 1, 1,
-1.049648, 0.9980744, 1.623943, 0, 0, 0, 1, 1,
-1.046144, 2.300663, -0.3837433, 0, 0, 0, 1, 1,
-1.045216, 1.324217, 0.6238917, 0, 0, 0, 1, 1,
-1.042396, -0.6310006, -4.372962, 1, 1, 1, 1, 1,
-1.041375, 0.3435797, -0.8456311, 1, 1, 1, 1, 1,
-1.039551, -1.354365, -0.4944267, 1, 1, 1, 1, 1,
-1.038209, 0.3932062, -0.9573473, 1, 1, 1, 1, 1,
-1.032093, -0.1403664, -2.906467, 1, 1, 1, 1, 1,
-1.029751, -1.024531, -1.367388, 1, 1, 1, 1, 1,
-1.026806, -0.02628587, 0.1542684, 1, 1, 1, 1, 1,
-1.02229, 0.6963789, 1.650805, 1, 1, 1, 1, 1,
-1.008228, 0.5609692, -2.070538, 1, 1, 1, 1, 1,
-0.9975293, 0.501332, -2.923129, 1, 1, 1, 1, 1,
-0.9801571, -0.1251611, -2.406351, 1, 1, 1, 1, 1,
-0.9729303, -2.031617, -2.591995, 1, 1, 1, 1, 1,
-0.9671459, -0.3681645, -3.074756, 1, 1, 1, 1, 1,
-0.9638124, 0.2995399, -0.6646246, 1, 1, 1, 1, 1,
-0.9591539, -1.567176, -5.130793, 1, 1, 1, 1, 1,
-0.9560639, 0.7607449, -0.6762419, 0, 0, 1, 1, 1,
-0.9560013, 0.365567, 0.2718082, 1, 0, 0, 1, 1,
-0.9430535, -2.171938, -2.388878, 1, 0, 0, 1, 1,
-0.9384868, -1.393373, -1.971159, 1, 0, 0, 1, 1,
-0.9379605, -0.7309468, -2.911396, 1, 0, 0, 1, 1,
-0.9333175, -1.816194, -2.269117, 1, 0, 0, 1, 1,
-0.9329986, 1.077851, -0.8981696, 0, 0, 0, 1, 1,
-0.9308278, -0.3716384, -2.394256, 0, 0, 0, 1, 1,
-0.9282577, -0.8158504, -2.480081, 0, 0, 0, 1, 1,
-0.9223831, -0.06199814, -3.236613, 0, 0, 0, 1, 1,
-0.918607, -1.030334, -0.4036337, 0, 0, 0, 1, 1,
-0.917927, 0.2596117, -1.200699, 0, 0, 0, 1, 1,
-0.9104887, -1.145039, -2.066275, 0, 0, 0, 1, 1,
-0.9055838, 1.562791, 0.04177279, 1, 1, 1, 1, 1,
-0.8991902, -0.1190539, 0.003651219, 1, 1, 1, 1, 1,
-0.8990614, -0.6487072, -3.283392, 1, 1, 1, 1, 1,
-0.8966219, 0.7758954, -1.039136, 1, 1, 1, 1, 1,
-0.8953725, 0.4464998, -1.523627, 1, 1, 1, 1, 1,
-0.8901543, -1.002824, -1.850568, 1, 1, 1, 1, 1,
-0.8867484, -0.1444701, -1.76994, 1, 1, 1, 1, 1,
-0.8857682, -0.488627, -3.289082, 1, 1, 1, 1, 1,
-0.8848388, -0.831641, -3.079031, 1, 1, 1, 1, 1,
-0.8834442, -1.164037, -4.285943, 1, 1, 1, 1, 1,
-0.8749815, 0.7167909, -2.401744, 1, 1, 1, 1, 1,
-0.8738636, -0.9740856, -0.6452799, 1, 1, 1, 1, 1,
-0.8718811, -0.8395656, -2.093758, 1, 1, 1, 1, 1,
-0.8650376, 1.369637, -1.513924, 1, 1, 1, 1, 1,
-0.8616495, 0.8472841, -1.83746, 1, 1, 1, 1, 1,
-0.859163, 0.8773157, -1.335281, 0, 0, 1, 1, 1,
-0.8454812, -2.775819, -3.430872, 1, 0, 0, 1, 1,
-0.8410469, -0.2968433, -1.212719, 1, 0, 0, 1, 1,
-0.8388627, -0.5988567, -1.9321, 1, 0, 0, 1, 1,
-0.8368352, -0.477825, -1.461022, 1, 0, 0, 1, 1,
-0.8367527, -0.1036201, -0.5788936, 1, 0, 0, 1, 1,
-0.8348973, 0.639097, -2.390023, 0, 0, 0, 1, 1,
-0.8281647, 0.08407459, 0.06886479, 0, 0, 0, 1, 1,
-0.8253857, 1.166911, 1.405783, 0, 0, 0, 1, 1,
-0.8220861, 0.7791237, 1.600981, 0, 0, 0, 1, 1,
-0.8217195, -1.168645, -2.418621, 0, 0, 0, 1, 1,
-0.8190711, 0.05187224, -1.403934, 0, 0, 0, 1, 1,
-0.8178577, 1.75913, 0.3937787, 0, 0, 0, 1, 1,
-0.8121833, 0.1695433, -1.788922, 1, 1, 1, 1, 1,
-0.8064423, -0.7101985, -2.647773, 1, 1, 1, 1, 1,
-0.8050807, -1.066236, -4.651197, 1, 1, 1, 1, 1,
-0.8049471, -0.09818026, -1.494085, 1, 1, 1, 1, 1,
-0.8014922, 0.62143, -0.206368, 1, 1, 1, 1, 1,
-0.8003532, 1.027321, -0.7229642, 1, 1, 1, 1, 1,
-0.800249, -2.933588, -2.66457, 1, 1, 1, 1, 1,
-0.79455, -1.109626, -3.197476, 1, 1, 1, 1, 1,
-0.7931988, 0.02872714, -1.573775, 1, 1, 1, 1, 1,
-0.7900587, 0.002452862, -2.457087, 1, 1, 1, 1, 1,
-0.7883003, 0.7952152, 0.5657712, 1, 1, 1, 1, 1,
-0.7877622, 0.3137252, -2.409173, 1, 1, 1, 1, 1,
-0.7858718, 0.1369405, -0.561735, 1, 1, 1, 1, 1,
-0.781548, -1.586257, -2.981011, 1, 1, 1, 1, 1,
-0.7746308, -1.482286, -4.376403, 1, 1, 1, 1, 1,
-0.7712038, 0.9667598, -2.097786, 0, 0, 1, 1, 1,
-0.7702324, 0.6075547, -0.4511546, 1, 0, 0, 1, 1,
-0.766625, -0.8905312, -1.609362, 1, 0, 0, 1, 1,
-0.7592673, -2.336965, -3.415321, 1, 0, 0, 1, 1,
-0.757524, 1.289567, -2.166143, 1, 0, 0, 1, 1,
-0.7475181, -0.3225358, -3.448635, 1, 0, 0, 1, 1,
-0.7444758, 0.2864694, -1.495537, 0, 0, 0, 1, 1,
-0.7444041, -1.38866, -2.18756, 0, 0, 0, 1, 1,
-0.7372512, 0.0499734, -0.6639579, 0, 0, 0, 1, 1,
-0.7365621, 0.1522659, 0.1151334, 0, 0, 0, 1, 1,
-0.7357702, 1.573212, -0.4335585, 0, 0, 0, 1, 1,
-0.7348253, 0.7135824, -1.736127, 0, 0, 0, 1, 1,
-0.7338293, 1.064544, 0.05416289, 0, 0, 0, 1, 1,
-0.7221653, 0.2885332, -1.385989, 1, 1, 1, 1, 1,
-0.7154231, -0.6450664, -1.683352, 1, 1, 1, 1, 1,
-0.708445, -0.3866913, -3.096549, 1, 1, 1, 1, 1,
-0.7039282, 0.4627937, -1.265254, 1, 1, 1, 1, 1,
-0.7015541, 0.2510601, -2.196058, 1, 1, 1, 1, 1,
-0.6994034, -0.1189168, -1.573579, 1, 1, 1, 1, 1,
-0.6964874, -2.168421, -1.830926, 1, 1, 1, 1, 1,
-0.6944335, 1.387584, -0.7458187, 1, 1, 1, 1, 1,
-0.693967, -1.404438, -1.045015, 1, 1, 1, 1, 1,
-0.6938452, 1.509829, -0.4218282, 1, 1, 1, 1, 1,
-0.6926487, -0.03973146, -2.29521, 1, 1, 1, 1, 1,
-0.691376, -1.31244, -3.031693, 1, 1, 1, 1, 1,
-0.6857299, 0.3361469, -0.3906529, 1, 1, 1, 1, 1,
-0.6846599, -0.1104954, -2.051703, 1, 1, 1, 1, 1,
-0.6800324, 0.1627251, -2.269963, 1, 1, 1, 1, 1,
-0.6790177, 1.590904, 0.283914, 0, 0, 1, 1, 1,
-0.6772686, 0.9470508, -1.918882, 1, 0, 0, 1, 1,
-0.6717029, -0.6701105, -2.824163, 1, 0, 0, 1, 1,
-0.6687871, 0.6572139, -0.4330718, 1, 0, 0, 1, 1,
-0.6674224, -0.7284273, -2.080956, 1, 0, 0, 1, 1,
-0.6645206, 0.3515032, -1.012908, 1, 0, 0, 1, 1,
-0.6634325, 0.4115482, -1.987637, 0, 0, 0, 1, 1,
-0.6559353, -1.046955, -2.196192, 0, 0, 0, 1, 1,
-0.6555876, 0.2410764, -2.846971, 0, 0, 0, 1, 1,
-0.653412, -0.4997542, -2.72006, 0, 0, 0, 1, 1,
-0.650629, 0.09382067, -2.102878, 0, 0, 0, 1, 1,
-0.64338, 0.2887877, -0.5855381, 0, 0, 0, 1, 1,
-0.6431816, -1.518599, -4.08399, 0, 0, 0, 1, 1,
-0.636694, 1.278502, -1.146041, 1, 1, 1, 1, 1,
-0.6355909, 0.393924, -2.170115, 1, 1, 1, 1, 1,
-0.6288251, 0.09214745, 0.2920869, 1, 1, 1, 1, 1,
-0.6244509, 0.6903136, 0.9319801, 1, 1, 1, 1, 1,
-0.6186429, -1.193276, -2.659435, 1, 1, 1, 1, 1,
-0.6176592, 0.5178636, -1.020296, 1, 1, 1, 1, 1,
-0.6109306, 0.3043205, -0.3957667, 1, 1, 1, 1, 1,
-0.6090681, 0.2951659, 0.3012246, 1, 1, 1, 1, 1,
-0.607553, -1.125157, -3.712664, 1, 1, 1, 1, 1,
-0.6022322, -0.03799993, 0.6152099, 1, 1, 1, 1, 1,
-0.6018549, 1.206823, -0.5817379, 1, 1, 1, 1, 1,
-0.5968178, -0.8655635, -2.310412, 1, 1, 1, 1, 1,
-0.5967196, 0.1981681, -1.148231, 1, 1, 1, 1, 1,
-0.5914124, -1.43845, -2.045727, 1, 1, 1, 1, 1,
-0.5865379, -1.753709, -2.644842, 1, 1, 1, 1, 1,
-0.5844812, -0.7864891, -2.422448, 0, 0, 1, 1, 1,
-0.5805954, -0.4123867, -4.3079, 1, 0, 0, 1, 1,
-0.5787324, -1.122445, -2.426392, 1, 0, 0, 1, 1,
-0.5781468, -0.4883799, -1.246802, 1, 0, 0, 1, 1,
-0.5752497, 0.7239426, -0.174032, 1, 0, 0, 1, 1,
-0.5750475, 0.654977, -0.1954419, 1, 0, 0, 1, 1,
-0.57068, -0.8109173, -1.717215, 0, 0, 0, 1, 1,
-0.5700702, 1.987675, -0.4084448, 0, 0, 0, 1, 1,
-0.5652364, 0.8647839, -1.45802, 0, 0, 0, 1, 1,
-0.5639355, -0.343429, -1.029679, 0, 0, 0, 1, 1,
-0.5617465, 1.579857, -0.5739182, 0, 0, 0, 1, 1,
-0.5602762, -0.09999169, -1.88021, 0, 0, 0, 1, 1,
-0.5595992, 1.111046, 0.1047466, 0, 0, 0, 1, 1,
-0.557801, -2.820642, -3.400538, 1, 1, 1, 1, 1,
-0.5566373, 0.7020409, 1.321165, 1, 1, 1, 1, 1,
-0.5557209, 0.3955782, -0.4006316, 1, 1, 1, 1, 1,
-0.554154, 0.9056, -0.697266, 1, 1, 1, 1, 1,
-0.5510566, -1.362033, -1.449262, 1, 1, 1, 1, 1,
-0.5499327, -0.2318334, -1.797137, 1, 1, 1, 1, 1,
-0.5480257, 2.176796, 0.128095, 1, 1, 1, 1, 1,
-0.5417132, -1.474696, -2.528824, 1, 1, 1, 1, 1,
-0.5415074, -1.003133, -1.067419, 1, 1, 1, 1, 1,
-0.5361456, 0.8901937, -0.8204664, 1, 1, 1, 1, 1,
-0.5298651, -1.617856, -3.040913, 1, 1, 1, 1, 1,
-0.5271379, 0.2162351, -1.449323, 1, 1, 1, 1, 1,
-0.5204784, 0.3270388, -0.2130422, 1, 1, 1, 1, 1,
-0.5161392, -1.414194, -3.689432, 1, 1, 1, 1, 1,
-0.5155167, -0.3072552, -1.672783, 1, 1, 1, 1, 1,
-0.5152572, 1.329512, -0.9495118, 0, 0, 1, 1, 1,
-0.5140294, -0.7776028, -3.946885, 1, 0, 0, 1, 1,
-0.5128863, 0.2283825, -0.09420969, 1, 0, 0, 1, 1,
-0.5117567, -0.477489, -1.799708, 1, 0, 0, 1, 1,
-0.5100631, -1.050409, -3.658639, 1, 0, 0, 1, 1,
-0.5096859, -1.102691, -3.227185, 1, 0, 0, 1, 1,
-0.4974602, 0.9163773, -3.012891, 0, 0, 0, 1, 1,
-0.490468, 0.5708945, -1.850221, 0, 0, 0, 1, 1,
-0.4900454, 0.02902282, -1.860831, 0, 0, 0, 1, 1,
-0.4894052, 0.9575008, -2.115123, 0, 0, 0, 1, 1,
-0.4884426, 1.315064, -0.5974991, 0, 0, 0, 1, 1,
-0.4852889, -0.2506562, -1.449288, 0, 0, 0, 1, 1,
-0.4828104, 0.2731414, -1.213455, 0, 0, 0, 1, 1,
-0.4780436, 0.2015263, -0.9670855, 1, 1, 1, 1, 1,
-0.4769159, 0.7465467, 0.2955402, 1, 1, 1, 1, 1,
-0.4726011, -0.3618184, -3.093736, 1, 1, 1, 1, 1,
-0.4699995, 0.5738544, 0.08203693, 1, 1, 1, 1, 1,
-0.4697773, -1.42825, -2.040674, 1, 1, 1, 1, 1,
-0.4684365, -1.362407, -2.205095, 1, 1, 1, 1, 1,
-0.4650795, 0.3487237, -2.679677, 1, 1, 1, 1, 1,
-0.4641097, -2.171487, -2.046338, 1, 1, 1, 1, 1,
-0.4483271, 0.9938753, 0.05797376, 1, 1, 1, 1, 1,
-0.4411621, 0.620509, -1.159282, 1, 1, 1, 1, 1,
-0.4403327, 0.4841497, -1.453088, 1, 1, 1, 1, 1,
-0.4226789, 1.087656, -0.3763404, 1, 1, 1, 1, 1,
-0.4186177, -0.7806093, -3.631319, 1, 1, 1, 1, 1,
-0.417229, 0.7738926, -0.56773, 1, 1, 1, 1, 1,
-0.4165157, -1.60565, -3.829949, 1, 1, 1, 1, 1,
-0.4157174, 1.716257, -0.2306008, 0, 0, 1, 1, 1,
-0.4121725, -1.707539, -2.278581, 1, 0, 0, 1, 1,
-0.4120862, -0.7135313, -1.128968, 1, 0, 0, 1, 1,
-0.4104697, 1.821413, 0.02580487, 1, 0, 0, 1, 1,
-0.4091662, 0.3308944, 0.5725881, 1, 0, 0, 1, 1,
-0.4074939, -0.8912871, -3.204864, 1, 0, 0, 1, 1,
-0.406761, -0.379544, -2.358404, 0, 0, 0, 1, 1,
-0.4064906, 0.3915672, -0.6189512, 0, 0, 0, 1, 1,
-0.4027599, 0.1497694, -1.030487, 0, 0, 0, 1, 1,
-0.4002736, 1.435716, -1.631323, 0, 0, 0, 1, 1,
-0.3961096, -0.381609, -1.704031, 0, 0, 0, 1, 1,
-0.3927778, -0.8112083, -2.27365, 0, 0, 0, 1, 1,
-0.3916588, -1.89008, -3.989176, 0, 0, 0, 1, 1,
-0.3909358, -0.6264046, -2.6837, 1, 1, 1, 1, 1,
-0.3825752, 1.110838, -0.4384708, 1, 1, 1, 1, 1,
-0.380911, 0.5213176, -1.059354, 1, 1, 1, 1, 1,
-0.3791242, 0.1840978, -1.543328, 1, 1, 1, 1, 1,
-0.3783509, -0.2723312, -2.13136, 1, 1, 1, 1, 1,
-0.3743167, 0.9474588, -0.07226239, 1, 1, 1, 1, 1,
-0.3640647, 2.987672, 0.1534656, 1, 1, 1, 1, 1,
-0.3635962, -0.08980604, -2.815886, 1, 1, 1, 1, 1,
-0.3628398, 0.1337965, -0.4712313, 1, 1, 1, 1, 1,
-0.3626799, 2.494505, 0.6871471, 1, 1, 1, 1, 1,
-0.3606952, -1.10808, -4.517451, 1, 1, 1, 1, 1,
-0.3599901, -0.6510713, -3.430378, 1, 1, 1, 1, 1,
-0.3597406, 0.1368612, -0.8933207, 1, 1, 1, 1, 1,
-0.3588873, -0.8460806, -1.801066, 1, 1, 1, 1, 1,
-0.3570649, 1.401708, -1.083587, 1, 1, 1, 1, 1,
-0.3503007, 0.4188059, 0.3581791, 0, 0, 1, 1, 1,
-0.3450422, 0.3704745, -0.3165326, 1, 0, 0, 1, 1,
-0.3448343, 0.5915875, -0.9069226, 1, 0, 0, 1, 1,
-0.3426124, -1.518141, -2.008487, 1, 0, 0, 1, 1,
-0.3421755, -0.3018076, -1.13168, 1, 0, 0, 1, 1,
-0.3332709, 1.159474, -0.4856345, 1, 0, 0, 1, 1,
-0.3280778, -0.5960174, -3.247995, 0, 0, 0, 1, 1,
-0.3272173, 0.5221098, -0.8370083, 0, 0, 0, 1, 1,
-0.3258408, 0.2468691, -3.286504, 0, 0, 0, 1, 1,
-0.3232315, 1.684039, -0.1458208, 0, 0, 0, 1, 1,
-0.3201596, 1.114021, -0.5418355, 0, 0, 0, 1, 1,
-0.3200319, 0.1415657, -0.9364647, 0, 0, 0, 1, 1,
-0.3187835, -0.6631907, -3.323751, 0, 0, 0, 1, 1,
-0.3144445, -2.209705, -1.428153, 1, 1, 1, 1, 1,
-0.3141555, -0.6073584, -1.336292, 1, 1, 1, 1, 1,
-0.3084122, -0.8892361, -2.67699, 1, 1, 1, 1, 1,
-0.3077772, 2.473129, -0.5197718, 1, 1, 1, 1, 1,
-0.3055577, -0.4331062, -3.529581, 1, 1, 1, 1, 1,
-0.3035609, 1.174972, -0.5826412, 1, 1, 1, 1, 1,
-0.3006358, -0.02549557, -1.383198, 1, 1, 1, 1, 1,
-0.3003934, -1.752115, -2.791084, 1, 1, 1, 1, 1,
-0.2999518, 0.7549233, -0.4806658, 1, 1, 1, 1, 1,
-0.2975993, 1.87191, -0.1155656, 1, 1, 1, 1, 1,
-0.2967322, 1.06531, 0.1862678, 1, 1, 1, 1, 1,
-0.2959936, -0.0899931, -2.355574, 1, 1, 1, 1, 1,
-0.2958552, -0.7511557, -4.493279, 1, 1, 1, 1, 1,
-0.2954533, -0.07599427, 0.3867008, 1, 1, 1, 1, 1,
-0.2932586, -0.4570452, -3.640843, 1, 1, 1, 1, 1,
-0.2893475, 0.5293121, -1.125422, 0, 0, 1, 1, 1,
-0.2804921, -1.146777, -2.52108, 1, 0, 0, 1, 1,
-0.2799087, 0.417924, 0.9711896, 1, 0, 0, 1, 1,
-0.2787646, -1.812809, -3.741768, 1, 0, 0, 1, 1,
-0.2756104, 0.8357306, -0.7834266, 1, 0, 0, 1, 1,
-0.2750693, -0.1546654, -2.085756, 1, 0, 0, 1, 1,
-0.2739691, -0.2190074, -1.33104, 0, 0, 0, 1, 1,
-0.2735499, -0.05765785, -3.52287, 0, 0, 0, 1, 1,
-0.2708441, 0.1359098, -2.845949, 0, 0, 0, 1, 1,
-0.2652838, 0.04579227, -1.432039, 0, 0, 0, 1, 1,
-0.2628441, -0.7877777, -3.785949, 0, 0, 0, 1, 1,
-0.262797, 1.446608, 1.010199, 0, 0, 0, 1, 1,
-0.2611767, -1.144046, -3.204412, 0, 0, 0, 1, 1,
-0.2578369, 1.600853, -0.02625193, 1, 1, 1, 1, 1,
-0.2555637, 1.551338, -1.756444, 1, 1, 1, 1, 1,
-0.2530683, -0.8937856, -3.093458, 1, 1, 1, 1, 1,
-0.2511431, 1.292102, 0.4031057, 1, 1, 1, 1, 1,
-0.2506497, 0.7433875, -2.10242, 1, 1, 1, 1, 1,
-0.2487047, -2.320169, -3.376092, 1, 1, 1, 1, 1,
-0.24789, -0.6577342, -2.886713, 1, 1, 1, 1, 1,
-0.2477029, 0.4085892, 0.05794461, 1, 1, 1, 1, 1,
-0.2436792, -0.3654224, -2.02688, 1, 1, 1, 1, 1,
-0.2412419, -0.5893264, -1.475737, 1, 1, 1, 1, 1,
-0.240552, -0.5294084, -1.248942, 1, 1, 1, 1, 1,
-0.2397263, -0.2366977, -0.2813093, 1, 1, 1, 1, 1,
-0.2395577, -0.08819098, -0.3070498, 1, 1, 1, 1, 1,
-0.2374243, 0.9252579, -1.46698, 1, 1, 1, 1, 1,
-0.2363663, 0.2426357, 0.7597582, 1, 1, 1, 1, 1,
-0.23451, 0.4529853, 0.06095272, 0, 0, 1, 1, 1,
-0.2306855, -0.09130449, -2.311227, 1, 0, 0, 1, 1,
-0.228566, -1.07819, -3.833632, 1, 0, 0, 1, 1,
-0.2285554, 0.4973924, 0.2822147, 1, 0, 0, 1, 1,
-0.2273871, 0.3253119, 0.2318802, 1, 0, 0, 1, 1,
-0.2270324, 0.4439931, -1.607042, 1, 0, 0, 1, 1,
-0.2226606, -1.090226, -2.771415, 0, 0, 0, 1, 1,
-0.2193883, 0.7138726, -0.1227498, 0, 0, 0, 1, 1,
-0.2187224, 0.8002827, -0.8816017, 0, 0, 0, 1, 1,
-0.2156173, 0.2895955, -1.812724, 0, 0, 0, 1, 1,
-0.2154124, -0.4204597, -3.784275, 0, 0, 0, 1, 1,
-0.2123757, 0.8498352, 0.2520307, 0, 0, 0, 1, 1,
-0.2077571, -0.522132, -1.653026, 0, 0, 0, 1, 1,
-0.2068385, -0.1853751, -1.40326, 1, 1, 1, 1, 1,
-0.2026807, 0.3570718, -1.286899, 1, 1, 1, 1, 1,
-0.2013061, 0.9807416, -0.01893563, 1, 1, 1, 1, 1,
-0.194848, 1.036111, 0.4171897, 1, 1, 1, 1, 1,
-0.1936865, 0.6927686, 2.061686, 1, 1, 1, 1, 1,
-0.1879174, 0.2749163, 0.623921, 1, 1, 1, 1, 1,
-0.1812415, -0.09862756, -0.4320207, 1, 1, 1, 1, 1,
-0.1701946, -1.08787, -2.653253, 1, 1, 1, 1, 1,
-0.1700083, -0.2849784, -2.756891, 1, 1, 1, 1, 1,
-0.1669924, 0.8102847, -1.256789, 1, 1, 1, 1, 1,
-0.1665338, -0.2440776, -2.078108, 1, 1, 1, 1, 1,
-0.1662965, -0.8446232, -2.651897, 1, 1, 1, 1, 1,
-0.1568739, -1.228814, -1.87321, 1, 1, 1, 1, 1,
-0.1549604, -0.9760877, -3.659944, 1, 1, 1, 1, 1,
-0.1542203, -0.9841136, -2.62838, 1, 1, 1, 1, 1,
-0.1448482, 0.05812673, -1.841332, 0, 0, 1, 1, 1,
-0.1445986, 0.0428358, -1.889002, 1, 0, 0, 1, 1,
-0.1408993, -0.6906395, -2.722418, 1, 0, 0, 1, 1,
-0.1402019, -0.1683821, -3.019356, 1, 0, 0, 1, 1,
-0.1362289, -1.031812, -2.601278, 1, 0, 0, 1, 1,
-0.1345254, -0.2273848, -3.851658, 1, 0, 0, 1, 1,
-0.130503, 1.195012, -0.5876697, 0, 0, 0, 1, 1,
-0.1304267, 0.7747246, 1.408619, 0, 0, 0, 1, 1,
-0.1279768, -0.1092188, -1.610078, 0, 0, 0, 1, 1,
-0.1253146, 0.8757134, 0.06507913, 0, 0, 0, 1, 1,
-0.124693, 3.037552, -0.8174975, 0, 0, 0, 1, 1,
-0.1232394, -1.282141, -2.621618, 0, 0, 0, 1, 1,
-0.1215614, -0.3405438, -2.310371, 0, 0, 0, 1, 1,
-0.118549, 1.029927, -2.226806, 1, 1, 1, 1, 1,
-0.118326, -0.08790899, -3.817326, 1, 1, 1, 1, 1,
-0.1167426, -2.383307, -4.067512, 1, 1, 1, 1, 1,
-0.1157395, -0.9160941, -0.7961254, 1, 1, 1, 1, 1,
-0.1156011, 0.29801, -0.06504437, 1, 1, 1, 1, 1,
-0.1133837, -2.649834, -3.032958, 1, 1, 1, 1, 1,
-0.1128682, 1.095876, 2.204994, 1, 1, 1, 1, 1,
-0.1118707, 1.392464, -1.09469, 1, 1, 1, 1, 1,
-0.1112105, 0.03745589, -1.029947, 1, 1, 1, 1, 1,
-0.1110026, 0.9897199, -1.263134, 1, 1, 1, 1, 1,
-0.1029843, 0.5643442, 0.165112, 1, 1, 1, 1, 1,
-0.09961463, -0.9101322, -1.914285, 1, 1, 1, 1, 1,
-0.09811815, 0.0749044, -0.02663983, 1, 1, 1, 1, 1,
-0.09666084, 1.007763, 0.1499899, 1, 1, 1, 1, 1,
-0.09194787, -0.8917428, -3.301927, 1, 1, 1, 1, 1,
-0.08988257, -2.275792, -2.752255, 0, 0, 1, 1, 1,
-0.08900236, -0.5744996, -2.005326, 1, 0, 0, 1, 1,
-0.08869177, 0.2044606, -0.7458832, 1, 0, 0, 1, 1,
-0.08610111, 2.355716, 1.523822, 1, 0, 0, 1, 1,
-0.08452918, -1.423089, -2.714529, 1, 0, 0, 1, 1,
-0.08184066, 0.7704567, -0.5549504, 1, 0, 0, 1, 1,
-0.08036487, -0.4343207, -3.289907, 0, 0, 0, 1, 1,
-0.07554723, -1.045143, -3.553761, 0, 0, 0, 1, 1,
-0.06318306, 1.439333, -0.05781064, 0, 0, 0, 1, 1,
-0.06203958, -0.6659712, -2.589266, 0, 0, 0, 1, 1,
-0.06108412, -1.406088, -3.156508, 0, 0, 0, 1, 1,
-0.06066553, -0.9209317, -1.661222, 0, 0, 0, 1, 1,
-0.05885163, 0.9691575, 1.286234, 0, 0, 0, 1, 1,
-0.05786998, 0.4154679, 0.1421498, 1, 1, 1, 1, 1,
-0.05254359, -2.051194, -3.095271, 1, 1, 1, 1, 1,
-0.05025171, -0.0964345, -2.816489, 1, 1, 1, 1, 1,
-0.04952126, 0.7266876, -0.05867062, 1, 1, 1, 1, 1,
-0.04870439, 0.3439042, 0.2793698, 1, 1, 1, 1, 1,
-0.04678379, -0.008810106, -2.118433, 1, 1, 1, 1, 1,
-0.04652597, -0.2421684, -3.421126, 1, 1, 1, 1, 1,
-0.0450861, 0.7223403, -0.1456897, 1, 1, 1, 1, 1,
-0.04034615, -1.269158, -2.527388, 1, 1, 1, 1, 1,
-0.03550772, 0.01197263, 0.773767, 1, 1, 1, 1, 1,
-0.03468938, -2.631242, -3.45149, 1, 1, 1, 1, 1,
-0.02924789, -2.183139, -4.331405, 1, 1, 1, 1, 1,
-0.02823911, 3.883689, 0.8366246, 1, 1, 1, 1, 1,
-0.02180587, 1.610216, 1.02526, 1, 1, 1, 1, 1,
-0.02106083, -0.5270471, -3.107241, 1, 1, 1, 1, 1,
-0.01891576, 1.097994, 0.7967262, 0, 0, 1, 1, 1,
-0.01736384, -1.237827, -3.923154, 1, 0, 0, 1, 1,
-0.01559998, 0.09843054, -0.1169624, 1, 0, 0, 1, 1,
-0.01460026, -1.495202, -5.012861, 1, 0, 0, 1, 1,
-0.00344094, -0.4211644, 0.03809542, 1, 0, 0, 1, 1,
-0.00196969, 0.6842114, -1.251586, 1, 0, 0, 1, 1,
0.001405458, 0.4911956, 0.6533861, 0, 0, 0, 1, 1,
0.003324846, -0.2607128, 1.199286, 0, 0, 0, 1, 1,
0.006147306, -1.586475, 3.072555, 0, 0, 0, 1, 1,
0.007520832, 0.7378809, -1.356885, 0, 0, 0, 1, 1,
0.008599422, -0.7647179, 5.252485, 0, 0, 0, 1, 1,
0.00995914, -0.02416794, 2.137765, 0, 0, 0, 1, 1,
0.01127746, -0.5541919, 2.482268, 0, 0, 0, 1, 1,
0.01419714, -1.04943, 3.710323, 1, 1, 1, 1, 1,
0.01491665, 0.4522808, 0.2116663, 1, 1, 1, 1, 1,
0.02104126, 0.0667626, 3.199409, 1, 1, 1, 1, 1,
0.02185793, -0.5965761, 1.177123, 1, 1, 1, 1, 1,
0.02280293, 0.4037518, 0.6770843, 1, 1, 1, 1, 1,
0.02385455, 0.3162085, -0.02185933, 1, 1, 1, 1, 1,
0.02442016, 0.2061584, -1.338089, 1, 1, 1, 1, 1,
0.02468748, 1.108323, -0.1438237, 1, 1, 1, 1, 1,
0.02494041, -0.9089134, 2.639812, 1, 1, 1, 1, 1,
0.02836999, 0.1145791, 1.523543, 1, 1, 1, 1, 1,
0.02973581, 1.182594, 0.1890765, 1, 1, 1, 1, 1,
0.033951, 0.6742692, 0.9824339, 1, 1, 1, 1, 1,
0.03781704, -1.060699, 4.296967, 1, 1, 1, 1, 1,
0.03914592, -0.2373353, 2.059662, 1, 1, 1, 1, 1,
0.04087898, 0.1097413, -0.560771, 1, 1, 1, 1, 1,
0.04384203, 0.1717487, 0.2597785, 0, 0, 1, 1, 1,
0.04402137, 0.436642, 1.281604, 1, 0, 0, 1, 1,
0.04506393, 1.602911, -0.2512952, 1, 0, 0, 1, 1,
0.05245623, 0.6068926, -2.607625, 1, 0, 0, 1, 1,
0.05370354, -1.118833, 3.208994, 1, 0, 0, 1, 1,
0.06283084, 0.3986644, 0.181966, 1, 0, 0, 1, 1,
0.06326748, 1.149984, 0.1615758, 0, 0, 0, 1, 1,
0.06720628, -0.3546251, 2.329803, 0, 0, 0, 1, 1,
0.07066672, 1.684042, 1.012589, 0, 0, 0, 1, 1,
0.0712455, -0.02765204, 2.2499, 0, 0, 0, 1, 1,
0.07406527, -1.993754, 3.447551, 0, 0, 0, 1, 1,
0.07453754, -0.4021686, 3.298415, 0, 0, 0, 1, 1,
0.07573453, 0.7309903, 0.5176717, 0, 0, 0, 1, 1,
0.07669138, 0.5523273, -0.5556285, 1, 1, 1, 1, 1,
0.07992022, 0.7044133, 0.1585721, 1, 1, 1, 1, 1,
0.08158671, 0.9771054, 0.5202294, 1, 1, 1, 1, 1,
0.08786577, -0.130077, 1.752971, 1, 1, 1, 1, 1,
0.09007213, -0.85891, 2.648741, 1, 1, 1, 1, 1,
0.09161939, 0.6269971, -0.1766268, 1, 1, 1, 1, 1,
0.09485181, 1.95745, -1.078061, 1, 1, 1, 1, 1,
0.1019861, -0.2337458, 2.717667, 1, 1, 1, 1, 1,
0.1064552, -1.674621, 3.278325, 1, 1, 1, 1, 1,
0.1072101, 0.1053284, 1.773338, 1, 1, 1, 1, 1,
0.1091728, 1.284711, 0.9069352, 1, 1, 1, 1, 1,
0.1092953, -0.729497, 2.617685, 1, 1, 1, 1, 1,
0.1104778, -0.4269337, 3.602212, 1, 1, 1, 1, 1,
0.1114611, 0.02480998, -0.6912819, 1, 1, 1, 1, 1,
0.1218703, 1.086651, -0.3180942, 1, 1, 1, 1, 1,
0.125682, -0.9798499, 2.981201, 0, 0, 1, 1, 1,
0.1266213, 0.4271525, 0.5756391, 1, 0, 0, 1, 1,
0.1300251, 0.4061899, 0.7559521, 1, 0, 0, 1, 1,
0.1339067, 1.282706, 0.3448132, 1, 0, 0, 1, 1,
0.1368193, 1.185771, -1.423083, 1, 0, 0, 1, 1,
0.1414746, 0.6188678, 0.3364488, 1, 0, 0, 1, 1,
0.145625, -0.3624607, 2.608398, 0, 0, 0, 1, 1,
0.159684, -1.049515, 1.988928, 0, 0, 0, 1, 1,
0.1615601, 2.449776, 0.8391033, 0, 0, 0, 1, 1,
0.1634594, 0.0267914, 1.6998, 0, 0, 0, 1, 1,
0.1671035, -0.1182759, 2.2307, 0, 0, 0, 1, 1,
0.1752619, -0.1653093, 0.4665172, 0, 0, 0, 1, 1,
0.176912, -0.4973019, 2.629375, 0, 0, 0, 1, 1,
0.1779987, -1.280141, 3.046637, 1, 1, 1, 1, 1,
0.1787519, 0.7331715, -0.4284547, 1, 1, 1, 1, 1,
0.1799093, 1.244004, -0.5660658, 1, 1, 1, 1, 1,
0.1814569, -0.2031195, -0.009371816, 1, 1, 1, 1, 1,
0.1826452, 0.2786777, -0.5698105, 1, 1, 1, 1, 1,
0.1870949, -1.000027, 0.6619778, 1, 1, 1, 1, 1,
0.1880666, -0.7940322, 2.465451, 1, 1, 1, 1, 1,
0.1915685, -1.573334, 2.844294, 1, 1, 1, 1, 1,
0.1946517, -0.3318704, 2.023411, 1, 1, 1, 1, 1,
0.2025183, -0.4373998, 1.611176, 1, 1, 1, 1, 1,
0.2042113, -0.4854903, 2.710871, 1, 1, 1, 1, 1,
0.2053988, -1.289864, 3.502943, 1, 1, 1, 1, 1,
0.2057551, -0.7697825, 4.043451, 1, 1, 1, 1, 1,
0.2074153, 0.1003152, 0.5793759, 1, 1, 1, 1, 1,
0.2087724, -0.8798866, 3.593236, 1, 1, 1, 1, 1,
0.2098578, -0.1515408, 0.769207, 0, 0, 1, 1, 1,
0.2104723, 0.6750329, 0.3388278, 1, 0, 0, 1, 1,
0.2120269, 0.2378231, 0.03338488, 1, 0, 0, 1, 1,
0.2166532, -1.093923, 3.048282, 1, 0, 0, 1, 1,
0.2226317, 0.8766426, 0.9276832, 1, 0, 0, 1, 1,
0.2249363, -0.2203126, 2.039344, 1, 0, 0, 1, 1,
0.2288018, 0.6083949, -0.2446244, 0, 0, 0, 1, 1,
0.2310435, -0.3209264, 4.005511, 0, 0, 0, 1, 1,
0.2339401, -0.6760675, 2.586457, 0, 0, 0, 1, 1,
0.2364552, 0.3404204, -0.1050341, 0, 0, 0, 1, 1,
0.2378672, -0.6648628, 2.710963, 0, 0, 0, 1, 1,
0.2389019, -1.460209, 3.001557, 0, 0, 0, 1, 1,
0.2444416, -1.378316, 3.658596, 0, 0, 0, 1, 1,
0.2445511, -2.21847, 3.50446, 1, 1, 1, 1, 1,
0.245554, 0.8322207, -0.06721773, 1, 1, 1, 1, 1,
0.2458282, -0.9006495, 3.617944, 1, 1, 1, 1, 1,
0.2460939, -0.2800184, 2.807979, 1, 1, 1, 1, 1,
0.2462715, 0.5211576, 0.2695585, 1, 1, 1, 1, 1,
0.2465355, 0.6401702, 0.8157926, 1, 1, 1, 1, 1,
0.2466145, 0.6633731, 0.2553909, 1, 1, 1, 1, 1,
0.2516773, 0.8979164, -0.1542743, 1, 1, 1, 1, 1,
0.2561597, 0.2875754, -0.1697218, 1, 1, 1, 1, 1,
0.2584395, -0.0761205, 3.676526, 1, 1, 1, 1, 1,
0.2590125, 0.7051694, 0.7289516, 1, 1, 1, 1, 1,
0.2597717, 0.5351053, 0.6634871, 1, 1, 1, 1, 1,
0.2601249, 0.4984367, 1.164573, 1, 1, 1, 1, 1,
0.2604245, -0.05606334, 2.181921, 1, 1, 1, 1, 1,
0.2633161, 0.2911454, 1.610677, 1, 1, 1, 1, 1,
0.269738, 0.0580657, 0.5764774, 0, 0, 1, 1, 1,
0.2723566, -0.2203436, 2.619729, 1, 0, 0, 1, 1,
0.2936637, 0.324996, 0.2266275, 1, 0, 0, 1, 1,
0.2940612, 0.9839091, -0.8134206, 1, 0, 0, 1, 1,
0.2950967, -0.3096129, 1.215252, 1, 0, 0, 1, 1,
0.295433, 1.430807, 0.2152125, 1, 0, 0, 1, 1,
0.2964197, -0.2322167, 2.315591, 0, 0, 0, 1, 1,
0.3014925, 0.1616748, 1.774851, 0, 0, 0, 1, 1,
0.3025251, 0.3459837, -0.04086526, 0, 0, 0, 1, 1,
0.3028755, -0.5940235, 2.438262, 0, 0, 0, 1, 1,
0.3077062, 1.00177, 0.2985997, 0, 0, 0, 1, 1,
0.3079494, 1.145915, -1.424194, 0, 0, 0, 1, 1,
0.3108816, 1.309581, -0.3657052, 0, 0, 0, 1, 1,
0.3144958, 0.3681189, 1.580003, 1, 1, 1, 1, 1,
0.3161049, 0.09450137, -0.08770336, 1, 1, 1, 1, 1,
0.3209176, 0.5779965, -0.007162944, 1, 1, 1, 1, 1,
0.3238643, 0.5638068, -0.3151879, 1, 1, 1, 1, 1,
0.331384, 0.3405201, 0.408198, 1, 1, 1, 1, 1,
0.3338802, 1.463022, 0.09235561, 1, 1, 1, 1, 1,
0.3398226, 0.7560007, 0.1066722, 1, 1, 1, 1, 1,
0.3402753, 1.318462, -1.191062, 1, 1, 1, 1, 1,
0.3438379, 0.1469706, 0.4690165, 1, 1, 1, 1, 1,
0.3440457, 1.836037, 2.371183, 1, 1, 1, 1, 1,
0.3443661, 0.5002277, 0.2183071, 1, 1, 1, 1, 1,
0.35644, 0.7696757, -0.5032852, 1, 1, 1, 1, 1,
0.3616329, -1.734039, 4.084539, 1, 1, 1, 1, 1,
0.3620486, -0.4286657, 3.47649, 1, 1, 1, 1, 1,
0.3685367, -0.325888, 2.215094, 1, 1, 1, 1, 1,
0.3721093, 2.412625, -2.184242, 0, 0, 1, 1, 1,
0.3752284, -1.214849, 2.23889, 1, 0, 0, 1, 1,
0.3800547, 0.1214424, 0.5330665, 1, 0, 0, 1, 1,
0.3812225, -0.5413177, 2.74394, 1, 0, 0, 1, 1,
0.3816715, -0.37876, 4.059579, 1, 0, 0, 1, 1,
0.3823569, -1.542071, 2.805641, 1, 0, 0, 1, 1,
0.3840041, -0.4349406, 3.550615, 0, 0, 0, 1, 1,
0.3842531, 0.2042699, 0.8670963, 0, 0, 0, 1, 1,
0.384986, 0.1058002, 1.572008, 0, 0, 0, 1, 1,
0.385179, -0.5717635, 1.221153, 0, 0, 0, 1, 1,
0.3861036, -0.8073142, 1.867618, 0, 0, 0, 1, 1,
0.3863651, -1.333326, 3.198476, 0, 0, 0, 1, 1,
0.3902991, -0.07510816, 0.2800701, 0, 0, 0, 1, 1,
0.3932006, 0.9467555, -1.327347, 1, 1, 1, 1, 1,
0.3962997, 0.6801001, 1.158734, 1, 1, 1, 1, 1,
0.3978841, -1.196779, 3.308791, 1, 1, 1, 1, 1,
0.4016767, 0.4578567, 1.054582, 1, 1, 1, 1, 1,
0.4043957, -0.09552684, 1.4493, 1, 1, 1, 1, 1,
0.4088255, -0.005700972, 2.614118, 1, 1, 1, 1, 1,
0.4112497, -1.205814, 2.337897, 1, 1, 1, 1, 1,
0.4115011, -1.070173, 2.977956, 1, 1, 1, 1, 1,
0.4121531, -0.0707498, 1.789799, 1, 1, 1, 1, 1,
0.4122778, -0.9968224, 3.346374, 1, 1, 1, 1, 1,
0.4197245, 0.04639911, 1.005738, 1, 1, 1, 1, 1,
0.4200304, 0.8009099, -0.1543651, 1, 1, 1, 1, 1,
0.4248984, -1.596387, 2.771259, 1, 1, 1, 1, 1,
0.4260829, -0.3971939, 3.158267, 1, 1, 1, 1, 1,
0.4320719, 0.5836287, 1.660595, 1, 1, 1, 1, 1,
0.4336578, -1.529367, 2.342096, 0, 0, 1, 1, 1,
0.4355012, 1.987736, 0.1334504, 1, 0, 0, 1, 1,
0.4401026, -1.322582, 3.697354, 1, 0, 0, 1, 1,
0.4404699, 0.4899317, 1.253179, 1, 0, 0, 1, 1,
0.4409047, -0.871991, 1.493224, 1, 0, 0, 1, 1,
0.4431416, 1.158202, -0.4081426, 1, 0, 0, 1, 1,
0.4451975, 0.2428825, 0.4403525, 0, 0, 0, 1, 1,
0.4496456, -0.4642448, 3.006112, 0, 0, 0, 1, 1,
0.4518551, -0.7086437, 1.308689, 0, 0, 0, 1, 1,
0.45708, 0.355667, 1.310005, 0, 0, 0, 1, 1,
0.4654377, 0.8604957, 0.9892117, 0, 0, 0, 1, 1,
0.4695834, -0.6899335, 1.659335, 0, 0, 0, 1, 1,
0.4707624, 0.5595657, 1.311043, 0, 0, 0, 1, 1,
0.4809746, 0.4085811, 2.155158, 1, 1, 1, 1, 1,
0.4812172, -0.04023292, 1.318699, 1, 1, 1, 1, 1,
0.4814256, -0.5551035, 2.16495, 1, 1, 1, 1, 1,
0.4824465, -0.7482302, 1.45522, 1, 1, 1, 1, 1,
0.4825246, 0.9530749, 0.8654478, 1, 1, 1, 1, 1,
0.4885818, -0.4637645, 3.266219, 1, 1, 1, 1, 1,
0.4896966, 0.9366351, 0.191397, 1, 1, 1, 1, 1,
0.4927571, 1.636489, -1.11776, 1, 1, 1, 1, 1,
0.4951554, -1.347046, 3.094223, 1, 1, 1, 1, 1,
0.4970913, 1.030423, -0.08677457, 1, 1, 1, 1, 1,
0.5000558, 0.6133523, 0.396509, 1, 1, 1, 1, 1,
0.5001665, -0.3494818, 3.547769, 1, 1, 1, 1, 1,
0.5004904, -0.5734559, 2.931512, 1, 1, 1, 1, 1,
0.5047399, 2.568455, -0.795948, 1, 1, 1, 1, 1,
0.5053448, 0.8926543, 1.743369, 1, 1, 1, 1, 1,
0.507366, -2.504442, 3.321959, 0, 0, 1, 1, 1,
0.509461, 0.1167489, 0.7297595, 1, 0, 0, 1, 1,
0.5109685, 0.2222632, 2.106783, 1, 0, 0, 1, 1,
0.5123239, 1.474216, 0.5256405, 1, 0, 0, 1, 1,
0.5133128, -0.8373423, 2.784034, 1, 0, 0, 1, 1,
0.5154339, -0.1165323, 1.235709, 1, 0, 0, 1, 1,
0.5163921, -1.88313, 3.617168, 0, 0, 0, 1, 1,
0.5174447, -0.5853739, 3.373353, 0, 0, 0, 1, 1,
0.5196987, 1.415589, 0.4372791, 0, 0, 0, 1, 1,
0.5223591, -1.084398, 1.749915, 0, 0, 0, 1, 1,
0.5246469, 0.5912822, 1.023803, 0, 0, 0, 1, 1,
0.5272564, -1.247256, 1.953271, 0, 0, 0, 1, 1,
0.5313233, 0.6437073, 2.406282, 0, 0, 0, 1, 1,
0.5318178, -0.1053747, 2.041873, 1, 1, 1, 1, 1,
0.5373372, 0.1373444, 0.1753277, 1, 1, 1, 1, 1,
0.5390741, 0.1162205, 1.18324, 1, 1, 1, 1, 1,
0.5405245, 1.663828, -0.4494787, 1, 1, 1, 1, 1,
0.5414325, 1.358035, 0.9988397, 1, 1, 1, 1, 1,
0.5443627, -2.297263, 1.551272, 1, 1, 1, 1, 1,
0.5470946, 1.404061, 0.8301827, 1, 1, 1, 1, 1,
0.5510441, 0.6300496, 1.797423, 1, 1, 1, 1, 1,
0.553814, 0.6204552, -0.5470958, 1, 1, 1, 1, 1,
0.5544218, -0.1758492, 1.666838, 1, 1, 1, 1, 1,
0.5586437, -0.7098573, 4.346449, 1, 1, 1, 1, 1,
0.5596283, -0.5225565, 2.511869, 1, 1, 1, 1, 1,
0.5664266, 0.2772163, -0.4718331, 1, 1, 1, 1, 1,
0.5755278, 1.056043, -1.560647, 1, 1, 1, 1, 1,
0.5785099, -0.1936047, 1.391217, 1, 1, 1, 1, 1,
0.5792558, 0.2093004, 1.875595, 0, 0, 1, 1, 1,
0.5802309, -0.2606345, 2.677995, 1, 0, 0, 1, 1,
0.5813047, 0.794534, 1.81712, 1, 0, 0, 1, 1,
0.5849878, 0.6055179, 1.062953, 1, 0, 0, 1, 1,
0.5855227, 1.052714, -0.6609902, 1, 0, 0, 1, 1,
0.5891646, 0.2658134, 1.111135, 1, 0, 0, 1, 1,
0.5936204, -1.466896, 2.990996, 0, 0, 0, 1, 1,
0.6015038, -0.5179336, 2.52369, 0, 0, 0, 1, 1,
0.6016616, 0.2286987, 1.947692, 0, 0, 0, 1, 1,
0.6108731, 0.6260155, 1.279284, 0, 0, 0, 1, 1,
0.6127837, 1.398929, -0.06118957, 0, 0, 0, 1, 1,
0.6225253, -0.5371163, 3.338085, 0, 0, 0, 1, 1,
0.6227575, 1.584991, 1.462565, 0, 0, 0, 1, 1,
0.6256334, 0.8390124, 0.7756358, 1, 1, 1, 1, 1,
0.6259291, 1.13946, 2.129713, 1, 1, 1, 1, 1,
0.626883, 0.6048722, 1.663152, 1, 1, 1, 1, 1,
0.6308109, -0.2840193, 0.4802486, 1, 1, 1, 1, 1,
0.6308873, 1.718443, 1.621074, 1, 1, 1, 1, 1,
0.6318101, -0.3878708, 1.433119, 1, 1, 1, 1, 1,
0.6319837, 0.03583109, 0.1150812, 1, 1, 1, 1, 1,
0.6348609, 0.520416, 0.09386477, 1, 1, 1, 1, 1,
0.64061, -0.714456, 2.228629, 1, 1, 1, 1, 1,
0.6420069, 0.7808002, 0.7142531, 1, 1, 1, 1, 1,
0.6432562, -1.306365, 5.237287, 1, 1, 1, 1, 1,
0.6453279, 0.5822589, 1.036301, 1, 1, 1, 1, 1,
0.646996, -0.5284751, 2.300423, 1, 1, 1, 1, 1,
0.6546162, -1.263872, 1.950813, 1, 1, 1, 1, 1,
0.6584151, -0.7026926, 1.774878, 1, 1, 1, 1, 1,
0.6679793, 0.5371726, 0.06606938, 0, 0, 1, 1, 1,
0.669173, 0.616672, 0.7268325, 1, 0, 0, 1, 1,
0.6702268, -0.7957659, 1.81207, 1, 0, 0, 1, 1,
0.680158, -1.037965, 3.241719, 1, 0, 0, 1, 1,
0.6833005, -0.9314653, 1.574293, 1, 0, 0, 1, 1,
0.6852666, 0.08322224, 0.8522259, 1, 0, 0, 1, 1,
0.6864691, -0.6313078, 4.233818, 0, 0, 0, 1, 1,
0.6875275, -0.4546651, 0.8421344, 0, 0, 0, 1, 1,
0.6894338, 0.9027694, -0.2913521, 0, 0, 0, 1, 1,
0.6907855, 0.1041175, 1.576368, 0, 0, 0, 1, 1,
0.6917776, -0.172003, 2.312433, 0, 0, 0, 1, 1,
0.6956462, -0.3360159, 3.279095, 0, 0, 0, 1, 1,
0.6987353, -1.129309, 1.638521, 0, 0, 0, 1, 1,
0.7089706, -1.112483, 2.873383, 1, 1, 1, 1, 1,
0.7098768, 1.534846, -0.272577, 1, 1, 1, 1, 1,
0.7114748, 1.483433, -0.2976746, 1, 1, 1, 1, 1,
0.7197796, 1.870391, 1.744477, 1, 1, 1, 1, 1,
0.7199408, -0.9004438, 2.720764, 1, 1, 1, 1, 1,
0.7208647, 0.5336152, 1.719476, 1, 1, 1, 1, 1,
0.7226463, -1.073747, 4.208387, 1, 1, 1, 1, 1,
0.7261823, -0.4614623, 3.058426, 1, 1, 1, 1, 1,
0.7272801, -1.046131, 3.315843, 1, 1, 1, 1, 1,
0.7291099, -0.6087025, 2.976185, 1, 1, 1, 1, 1,
0.7339133, 0.9660511, 0.8322127, 1, 1, 1, 1, 1,
0.7346625, 0.3706496, 1.513601, 1, 1, 1, 1, 1,
0.7362303, -0.5094627, 2.364345, 1, 1, 1, 1, 1,
0.7378235, 0.6414393, 0.1493086, 1, 1, 1, 1, 1,
0.7384575, 0.5961454, 0.323736, 1, 1, 1, 1, 1,
0.741183, 0.404105, 1.155501, 0, 0, 1, 1, 1,
0.7458319, -0.2129718, 1.739004, 1, 0, 0, 1, 1,
0.7462817, -0.404531, 1.360447, 1, 0, 0, 1, 1,
0.7486392, -0.6769366, 2.64503, 1, 0, 0, 1, 1,
0.7501636, 0.7505795, 0.4069244, 1, 0, 0, 1, 1,
0.7511267, -0.2276731, 1.216008, 1, 0, 0, 1, 1,
0.7595441, -0.3348662, 0.9543985, 0, 0, 0, 1, 1,
0.7607121, -1.783967, 2.216814, 0, 0, 0, 1, 1,
0.7713845, 2.940537, 0.04789644, 0, 0, 0, 1, 1,
0.7729391, 2.085422, 0.498039, 0, 0, 0, 1, 1,
0.7741159, 0.1943422, 2.590471, 0, 0, 0, 1, 1,
0.7779821, 0.6335487, 2.788479, 0, 0, 0, 1, 1,
0.7833651, 0.8840004, 2.65774, 0, 0, 0, 1, 1,
0.7835368, 0.09240685, 1.628668, 1, 1, 1, 1, 1,
0.7868062, -0.661788, 0.3639326, 1, 1, 1, 1, 1,
0.795252, -2.167176, 4.105567, 1, 1, 1, 1, 1,
0.7970636, 0.7520478, 1.390941, 1, 1, 1, 1, 1,
0.7971693, 0.531454, 1.146271, 1, 1, 1, 1, 1,
0.7977471, -1.850264, 3.228654, 1, 1, 1, 1, 1,
0.7982227, 1.287397, 1.938851, 1, 1, 1, 1, 1,
0.803188, -0.07800095, 1.073456, 1, 1, 1, 1, 1,
0.8070736, 0.4978339, 2.270761, 1, 1, 1, 1, 1,
0.813183, 1.103754, 0.6242169, 1, 1, 1, 1, 1,
0.8149562, 1.185569, 2.939798, 1, 1, 1, 1, 1,
0.8254233, 0.6548744, 1.47125, 1, 1, 1, 1, 1,
0.8304055, 0.05398579, 1.455702, 1, 1, 1, 1, 1,
0.8332835, 0.2415616, 2.410481, 1, 1, 1, 1, 1,
0.8422367, -0.4798604, 0.3328728, 1, 1, 1, 1, 1,
0.844887, -0.1798045, 0.720011, 0, 0, 1, 1, 1,
0.851967, 0.2865848, 2.057196, 1, 0, 0, 1, 1,
0.8670576, 0.7458014, 1.072453, 1, 0, 0, 1, 1,
0.8693913, -2.514881, 3.371397, 1, 0, 0, 1, 1,
0.8699876, -0.4627735, 1.103627, 1, 0, 0, 1, 1,
0.8709424, -0.02742176, 2.117225, 1, 0, 0, 1, 1,
0.8730187, 0.6012892, 1.816483, 0, 0, 0, 1, 1,
0.8746144, 1.330998, -0.8549787, 0, 0, 0, 1, 1,
0.8750899, 1.115973, 0.8019568, 0, 0, 0, 1, 1,
0.8754429, 0.3003794, 0.8842522, 0, 0, 0, 1, 1,
0.8809642, 0.487746, 2.517189, 0, 0, 0, 1, 1,
0.8813179, 1.554885, 0.02878272, 0, 0, 0, 1, 1,
0.8827366, 0.02326569, -1.140925, 0, 0, 0, 1, 1,
0.8841105, 0.1450601, -0.006968894, 1, 1, 1, 1, 1,
0.8862641, -0.6881738, 2.636003, 1, 1, 1, 1, 1,
0.8897372, 0.7597306, 0.5623487, 1, 1, 1, 1, 1,
0.8902113, 0.08167238, 0.3064108, 1, 1, 1, 1, 1,
0.8956905, -0.2560439, 2.889845, 1, 1, 1, 1, 1,
0.897427, 0.1485253, 1.566744, 1, 1, 1, 1, 1,
0.897862, -0.9421493, 2.990095, 1, 1, 1, 1, 1,
0.8991095, 1.167539, 1.340809, 1, 1, 1, 1, 1,
0.9115295, 0.8982916, 2.021642, 1, 1, 1, 1, 1,
0.9199255, -0.03523465, 3.763224, 1, 1, 1, 1, 1,
0.9208846, 0.3183197, -0.4395362, 1, 1, 1, 1, 1,
0.9247711, 1.19412, 0.4436486, 1, 1, 1, 1, 1,
0.9249745, -0.8909352, 1.201051, 1, 1, 1, 1, 1,
0.9263011, 0.3557239, 2.630143, 1, 1, 1, 1, 1,
0.9348717, -0.3520584, 1.611681, 1, 1, 1, 1, 1,
0.9407181, 1.392516, -1.237573, 0, 0, 1, 1, 1,
0.9478993, 2.221564, 2.214638, 1, 0, 0, 1, 1,
0.9642045, 2.459373, 1.114023, 1, 0, 0, 1, 1,
0.9644614, 1.32386, -1.546881, 1, 0, 0, 1, 1,
0.9679009, -1.102158, 2.193122, 1, 0, 0, 1, 1,
0.9688026, 0.6734993, 0.9520591, 1, 0, 0, 1, 1,
0.9716701, 1.580389, -0.1566024, 0, 0, 0, 1, 1,
0.9717045, 0.7261447, 0.8483436, 0, 0, 0, 1, 1,
0.9761853, 0.07872142, 1.596329, 0, 0, 0, 1, 1,
0.9818716, 0.5555432, 0.8470728, 0, 0, 0, 1, 1,
0.982484, 1.313731, 1.208717, 0, 0, 0, 1, 1,
0.9842584, -0.2741828, 3.190814, 0, 0, 0, 1, 1,
0.9943829, -0.08833664, 0.4220888, 0, 0, 0, 1, 1,
0.9979024, 1.865558, 0.8485031, 1, 1, 1, 1, 1,
1.003803, 0.6487799, 2.161241, 1, 1, 1, 1, 1,
1.004628, -0.08684643, 1.386575, 1, 1, 1, 1, 1,
1.005748, -0.4499711, 2.609999, 1, 1, 1, 1, 1,
1.008542, 0.4258732, -0.006532032, 1, 1, 1, 1, 1,
1.022433, -1.905764, 1.140466, 1, 1, 1, 1, 1,
1.025207, 0.01769375, 1.588901, 1, 1, 1, 1, 1,
1.025409, 0.6876498, 2.300257, 1, 1, 1, 1, 1,
1.034045, 0.8157773, -1.49733, 1, 1, 1, 1, 1,
1.038197, 0.2042848, 1.411694, 1, 1, 1, 1, 1,
1.043179, 0.3514589, -0.8763733, 1, 1, 1, 1, 1,
1.047963, -0.7682772, 2.640552, 1, 1, 1, 1, 1,
1.054734, 0.1155583, 0.5055478, 1, 1, 1, 1, 1,
1.083925, 0.8672669, 1.238781, 1, 1, 1, 1, 1,
1.092986, 2.311106, 0.4606092, 1, 1, 1, 1, 1,
1.097306, 0.1665301, 1.041197, 0, 0, 1, 1, 1,
1.099747, 2.282818, 0.6065449, 1, 0, 0, 1, 1,
1.104285, 0.1407437, 2.035201, 1, 0, 0, 1, 1,
1.104385, 0.1556398, 2.012876, 1, 0, 0, 1, 1,
1.109854, -0.4552501, 1.772989, 1, 0, 0, 1, 1,
1.110964, 1.386165, 1.07191, 1, 0, 0, 1, 1,
1.114796, -0.2830558, 0.955485, 0, 0, 0, 1, 1,
1.117389, 0.5656578, -1.444486, 0, 0, 0, 1, 1,
1.11864, -0.4551898, 2.80105, 0, 0, 0, 1, 1,
1.119456, 1.453019, 0.5013141, 0, 0, 0, 1, 1,
1.119553, 0.3116321, 0.1299175, 0, 0, 0, 1, 1,
1.126201, -1.000172, 3.811155, 0, 0, 0, 1, 1,
1.133261, 1.662557, 0.1529466, 0, 0, 0, 1, 1,
1.13928, -1.172662, 2.596785, 1, 1, 1, 1, 1,
1.142336, 1.184641, 0.6097309, 1, 1, 1, 1, 1,
1.147811, -0.9725291, 3.111411, 1, 1, 1, 1, 1,
1.149116, -0.720824, 2.88766, 1, 1, 1, 1, 1,
1.151789, -1.203763, 3.013242, 1, 1, 1, 1, 1,
1.152584, -0.4202356, 3.064723, 1, 1, 1, 1, 1,
1.153671, 2.447953, 1.259897, 1, 1, 1, 1, 1,
1.176677, 1.579183, 0.6958143, 1, 1, 1, 1, 1,
1.178199, 0.2397059, 1.084235, 1, 1, 1, 1, 1,
1.185672, -1.087059, 2.407578, 1, 1, 1, 1, 1,
1.189814, -1.926772, 2.538234, 1, 1, 1, 1, 1,
1.209338, 1.166409, -0.08568448, 1, 1, 1, 1, 1,
1.21195, -1.541337, 2.809735, 1, 1, 1, 1, 1,
1.216181, -0.6911827, 4.051866, 1, 1, 1, 1, 1,
1.234343, -0.229877, 2.56544, 1, 1, 1, 1, 1,
1.247641, 0.1885247, 2.791475, 0, 0, 1, 1, 1,
1.250441, -2.077072, 4.295385, 1, 0, 0, 1, 1,
1.254765, -1.502878, 2.701529, 1, 0, 0, 1, 1,
1.255757, -1.247784, 3.309181, 1, 0, 0, 1, 1,
1.255795, -0.1858623, 1.377675, 1, 0, 0, 1, 1,
1.259586, -1.142464, 1.719073, 1, 0, 0, 1, 1,
1.265645, 0.279491, 2.197119, 0, 0, 0, 1, 1,
1.271251, 2.716081, 0.7064757, 0, 0, 0, 1, 1,
1.279405, 1.025849, -0.1079174, 0, 0, 0, 1, 1,
1.280481, -0.2219613, 2.181374, 0, 0, 0, 1, 1,
1.290773, -0.7935148, -0.05794515, 0, 0, 0, 1, 1,
1.295749, -0.1154565, 0.2677418, 0, 0, 0, 1, 1,
1.296663, 2.483656, 2.347705, 0, 0, 0, 1, 1,
1.299954, -0.05398967, 0.6686995, 1, 1, 1, 1, 1,
1.317322, 0.3143011, 1.759179, 1, 1, 1, 1, 1,
1.330028, 2.176809, 0.7695785, 1, 1, 1, 1, 1,
1.334097, 1.235677, 1.245059, 1, 1, 1, 1, 1,
1.342055, 0.2954221, 1.172, 1, 1, 1, 1, 1,
1.350342, -0.2066453, 1.350905, 1, 1, 1, 1, 1,
1.35915, 0.5061754, 1.613956, 1, 1, 1, 1, 1,
1.359601, 0.4434, -0.1121851, 1, 1, 1, 1, 1,
1.3619, 0.0728303, 3.545668, 1, 1, 1, 1, 1,
1.363094, 2.082565, 0.8433814, 1, 1, 1, 1, 1,
1.363637, 0.3598421, 2.002119, 1, 1, 1, 1, 1,
1.373088, -2.276036, 2.1214, 1, 1, 1, 1, 1,
1.377869, 1.467616, 1.749904, 1, 1, 1, 1, 1,
1.399396, 0.02138998, 2.240453, 1, 1, 1, 1, 1,
1.40022, -0.06313234, 0.3786373, 1, 1, 1, 1, 1,
1.414157, -1.660344, 2.200181, 0, 0, 1, 1, 1,
1.446565, -1.186951, 2.979177, 1, 0, 0, 1, 1,
1.447297, 0.07518671, 0.6081339, 1, 0, 0, 1, 1,
1.452022, 0.3457558, 0.9419129, 1, 0, 0, 1, 1,
1.457307, 0.00265637, 1.430141, 1, 0, 0, 1, 1,
1.462302, 1.465722, 0.8697694, 1, 0, 0, 1, 1,
1.463658, 0.8984029, -1.304774, 0, 0, 0, 1, 1,
1.467823, 0.4538096, 2.31341, 0, 0, 0, 1, 1,
1.469141, 0.5319371, 2.822984, 0, 0, 0, 1, 1,
1.471676, -0.7750754, 1.59085, 0, 0, 0, 1, 1,
1.476319, -0.725925, 2.493978, 0, 0, 0, 1, 1,
1.485731, 0.8321785, -0.02222876, 0, 0, 0, 1, 1,
1.486334, -0.9429845, 1.189735, 0, 0, 0, 1, 1,
1.49247, 1.446363, 2.307189, 1, 1, 1, 1, 1,
1.495646, 1.187393, 2.290628, 1, 1, 1, 1, 1,
1.500531, 0.5128369, -0.4379691, 1, 1, 1, 1, 1,
1.506544, 0.3320176, 1.125945, 1, 1, 1, 1, 1,
1.549681, -1.872944, 4.751286, 1, 1, 1, 1, 1,
1.559157, 0.9929838, 1.254979, 1, 1, 1, 1, 1,
1.562693, -1.307958, 2.425893, 1, 1, 1, 1, 1,
1.57889, 0.7467742, 2.566416, 1, 1, 1, 1, 1,
1.586091, 0.9840646, 0.3263213, 1, 1, 1, 1, 1,
1.588585, -0.4708883, 2.380561, 1, 1, 1, 1, 1,
1.596228, 0.3639806, 1.202147, 1, 1, 1, 1, 1,
1.599123, 1.054697, 1.956617, 1, 1, 1, 1, 1,
1.600274, -0.2604635, 2.086689, 1, 1, 1, 1, 1,
1.613344, 1.036335, 2.224007, 1, 1, 1, 1, 1,
1.619949, -0.1483362, 1.882237, 1, 1, 1, 1, 1,
1.626645, -0.4960917, 2.742812, 0, 0, 1, 1, 1,
1.639932, -0.148115, -0.6849954, 1, 0, 0, 1, 1,
1.645438, 1.923762, 0.4876541, 1, 0, 0, 1, 1,
1.647249, 0.761122, -0.048302, 1, 0, 0, 1, 1,
1.657161, -0.3520989, 1.078615, 1, 0, 0, 1, 1,
1.663249, 1.61587, 1.374999, 1, 0, 0, 1, 1,
1.670771, -1.348835, 1.741167, 0, 0, 0, 1, 1,
1.67827, -1.442291, 1.643697, 0, 0, 0, 1, 1,
1.678284, -0.3750015, 2.114058, 0, 0, 0, 1, 1,
1.680633, 0.02987719, 2.266049, 0, 0, 0, 1, 1,
1.682117, -0.4001536, 2.546687, 0, 0, 0, 1, 1,
1.683894, -0.1619532, 2.873672, 0, 0, 0, 1, 1,
1.685647, -1.622731, 5.502724, 0, 0, 0, 1, 1,
1.687042, -1.02121, 0.653828, 1, 1, 1, 1, 1,
1.688136, 0.5074115, 0.5557917, 1, 1, 1, 1, 1,
1.736034, -0.747014, 2.133874, 1, 1, 1, 1, 1,
1.743648, 0.7566745, 0.9181152, 1, 1, 1, 1, 1,
1.771078, 0.2752886, 0.1483824, 1, 1, 1, 1, 1,
1.793863, -0.26036, 0.4066524, 1, 1, 1, 1, 1,
1.816155, -0.178816, 3.023275, 1, 1, 1, 1, 1,
1.865672, -0.3044278, 1.490642, 1, 1, 1, 1, 1,
1.874143, 0.2072477, 3.491003, 1, 1, 1, 1, 1,
1.877928, -0.3300335, 1.94906, 1, 1, 1, 1, 1,
1.889566, -0.2831428, 0.9858024, 1, 1, 1, 1, 1,
1.892547, 1.269956, -0.2468249, 1, 1, 1, 1, 1,
1.934915, -0.4391851, 1.584051, 1, 1, 1, 1, 1,
1.936281, 1.365465, -0.9509791, 1, 1, 1, 1, 1,
1.939687, 1.589859, 0.92879, 1, 1, 1, 1, 1,
1.947268, 0.3031962, 0.1387366, 0, 0, 1, 1, 1,
1.981516, 0.6364314, 0.5500637, 1, 0, 0, 1, 1,
2.005755, -1.442835, 3.881847, 1, 0, 0, 1, 1,
2.016304, 0.6325921, 1.276932, 1, 0, 0, 1, 1,
2.019995, 0.3645723, 0.944158, 1, 0, 0, 1, 1,
2.104713, 0.8734349, -0.2057648, 1, 0, 0, 1, 1,
2.164708, 0.829386, 2.531046, 0, 0, 0, 1, 1,
2.340549, 0.9607305, 1.563748, 0, 0, 0, 1, 1,
2.366028, 1.089227, 2.068542, 0, 0, 0, 1, 1,
2.373502, -1.130909, 0.9961428, 0, 0, 0, 1, 1,
2.621682, 1.586044, 2.177674, 0, 0, 0, 1, 1,
2.635433, -1.24068, 1.039548, 0, 0, 0, 1, 1,
2.742242, 0.4498253, -0.6716522, 0, 0, 0, 1, 1,
2.75165, -0.7969186, 0.7917524, 1, 1, 1, 1, 1,
2.995009, -0.3444801, 2.582348, 1, 1, 1, 1, 1,
3.009017, -1.399102, 1.56504, 1, 1, 1, 1, 1,
3.12263, -0.8275321, 1.004971, 1, 1, 1, 1, 1,
3.127861, 0.3997386, -0.2727704, 1, 1, 1, 1, 1,
3.25843, 1.19283, 0.6925266, 1, 1, 1, 1, 1,
3.645895, -0.763245, 2.627172, 1, 1, 1, 1, 1
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
var radius = 9.885357;
var distance = 34.72189;
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
mvMatrix.translate( -0.08390665, -0.4062586, -0.1859658 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.72189);
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