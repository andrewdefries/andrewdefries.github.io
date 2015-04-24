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
-3.361886, -0.6636166, -1.044262, 1, 0, 0, 1,
-2.560174, 1.302772, -0.3078857, 1, 0.007843138, 0, 1,
-2.54938, -0.6170841, -2.228921, 1, 0.01176471, 0, 1,
-2.546257, 1.391833, -1.435862, 1, 0.01960784, 0, 1,
-2.513593, 0.5968372, -2.503101, 1, 0.02352941, 0, 1,
-2.399775, -0.7341234, -2.842154, 1, 0.03137255, 0, 1,
-2.326265, 1.999829, -0.58966, 1, 0.03529412, 0, 1,
-2.194304, -0.04338913, -1.846506, 1, 0.04313726, 0, 1,
-2.152747, 0.04736664, -1.133197, 1, 0.04705882, 0, 1,
-2.126651, -1.329634, 0.3295818, 1, 0.05490196, 0, 1,
-2.073528, 0.5773513, -2.067111, 1, 0.05882353, 0, 1,
-2.072865, 0.5795822, -2.652234, 1, 0.06666667, 0, 1,
-2.071667, -3.566128, -0.6723347, 1, 0.07058824, 0, 1,
-2.044146, 0.9860752, -2.2361, 1, 0.07843138, 0, 1,
-2.042832, 1.094071, -0.5245634, 1, 0.08235294, 0, 1,
-1.99722, 0.05828845, -0.7450643, 1, 0.09019608, 0, 1,
-1.955785, -1.795938, -3.5758, 1, 0.09411765, 0, 1,
-1.951326, 0.3708646, -1.897743, 1, 0.1019608, 0, 1,
-1.949093, -0.2538297, -2.215001, 1, 0.1098039, 0, 1,
-1.928164, 0.593686, -2.21777, 1, 0.1137255, 0, 1,
-1.913722, 0.9837841, -2.327235, 1, 0.1215686, 0, 1,
-1.901659, 1.125284, 2.408365, 1, 0.1254902, 0, 1,
-1.891041, -0.720811, -1.670145, 1, 0.1333333, 0, 1,
-1.885684, 1.205784, -1.632126, 1, 0.1372549, 0, 1,
-1.877845, -2.394898, -1.294484, 1, 0.145098, 0, 1,
-1.87627, -0.2627616, -0.1841944, 1, 0.1490196, 0, 1,
-1.841361, 1.053377, 0.243617, 1, 0.1568628, 0, 1,
-1.837144, -0.3395165, -2.081912, 1, 0.1607843, 0, 1,
-1.817861, 0.3232397, -1.945256, 1, 0.1686275, 0, 1,
-1.803492, -1.041639, -2.411535, 1, 0.172549, 0, 1,
-1.803157, -0.3425322, -2.241466, 1, 0.1803922, 0, 1,
-1.801587, -0.03127741, -2.203257, 1, 0.1843137, 0, 1,
-1.751133, 1.075765, -0.2144764, 1, 0.1921569, 0, 1,
-1.744624, -0.8412673, -2.982657, 1, 0.1960784, 0, 1,
-1.736667, 0.6042518, 0.2515408, 1, 0.2039216, 0, 1,
-1.731411, -0.01827604, -1.007153, 1, 0.2117647, 0, 1,
-1.718978, 0.8120981, -0.9231324, 1, 0.2156863, 0, 1,
-1.71108, 0.422019, -1.784608, 1, 0.2235294, 0, 1,
-1.705246, -0.2479203, -2.461505, 1, 0.227451, 0, 1,
-1.70218, 0.4948368, -1.15246, 1, 0.2352941, 0, 1,
-1.697667, 1.501155, 0.3900671, 1, 0.2392157, 0, 1,
-1.691968, 0.6095527, -0.6141341, 1, 0.2470588, 0, 1,
-1.679332, -0.7515677, -1.469586, 1, 0.2509804, 0, 1,
-1.664078, 0.8946378, -1.038279, 1, 0.2588235, 0, 1,
-1.653698, -1.441808, -1.701088, 1, 0.2627451, 0, 1,
-1.651618, -1.447357, -2.784187, 1, 0.2705882, 0, 1,
-1.643837, -0.219274, -1.945765, 1, 0.2745098, 0, 1,
-1.641865, -0.7328309, -1.625261, 1, 0.282353, 0, 1,
-1.636197, 0.3955581, -0.5285987, 1, 0.2862745, 0, 1,
-1.626452, -0.4916476, -2.769271, 1, 0.2941177, 0, 1,
-1.609894, 0.9319951, -0.8800725, 1, 0.3019608, 0, 1,
-1.609218, 1.153395, -0.1940015, 1, 0.3058824, 0, 1,
-1.608264, -0.2670957, -2.325646, 1, 0.3137255, 0, 1,
-1.599085, 0.06497921, -1.287471, 1, 0.3176471, 0, 1,
-1.59567, -2.990895, -2.531387, 1, 0.3254902, 0, 1,
-1.584267, 0.9361797, -0.7150344, 1, 0.3294118, 0, 1,
-1.581821, 0.9375313, -1.711754, 1, 0.3372549, 0, 1,
-1.557366, 1.583231, 0.5470696, 1, 0.3411765, 0, 1,
-1.534907, 0.09171592, 0.431438, 1, 0.3490196, 0, 1,
-1.518829, 1.053996, -2.762754, 1, 0.3529412, 0, 1,
-1.505251, 1.032275, -3.016228, 1, 0.3607843, 0, 1,
-1.501727, -1.349859, -2.678102, 1, 0.3647059, 0, 1,
-1.499609, 1.974873, 0.7022792, 1, 0.372549, 0, 1,
-1.499042, 0.05535838, -1.687729, 1, 0.3764706, 0, 1,
-1.490594, -0.09961913, -1.023711, 1, 0.3843137, 0, 1,
-1.487633, -0.2391337, -3.25697, 1, 0.3882353, 0, 1,
-1.484965, 1.67616, -1.438496, 1, 0.3960784, 0, 1,
-1.480122, -0.7891663, -2.766159, 1, 0.4039216, 0, 1,
-1.467736, 0.3218244, -3.098125, 1, 0.4078431, 0, 1,
-1.461566, 1.875075, -0.1929141, 1, 0.4156863, 0, 1,
-1.450228, -0.3252853, -3.017966, 1, 0.4196078, 0, 1,
-1.429009, 0.3770683, -2.940471, 1, 0.427451, 0, 1,
-1.41984, -1.117338, -1.023529, 1, 0.4313726, 0, 1,
-1.413631, -0.3490083, -1.806304, 1, 0.4392157, 0, 1,
-1.406041, -0.319124, -1.191355, 1, 0.4431373, 0, 1,
-1.40269, 0.5718085, -1.921872, 1, 0.4509804, 0, 1,
-1.40168, -0.7027023, -1.341434, 1, 0.454902, 0, 1,
-1.386574, 1.750746, -0.952223, 1, 0.4627451, 0, 1,
-1.382915, -0.3017197, -1.114656, 1, 0.4666667, 0, 1,
-1.378418, -1.004912, -3.284297, 1, 0.4745098, 0, 1,
-1.374825, 0.09084933, -0.9167521, 1, 0.4784314, 0, 1,
-1.374361, -1.999261, -1.531808, 1, 0.4862745, 0, 1,
-1.370055, -0.006773626, -1.197095, 1, 0.4901961, 0, 1,
-1.356375, -1.363389, -2.528063, 1, 0.4980392, 0, 1,
-1.35539, 0.006489127, -1.89012, 1, 0.5058824, 0, 1,
-1.343403, 0.3947618, -0.7970861, 1, 0.509804, 0, 1,
-1.341713, -0.1341494, -1.486039, 1, 0.5176471, 0, 1,
-1.337972, -0.147678, -2.701551, 1, 0.5215687, 0, 1,
-1.335218, 0.909097, -1.284108, 1, 0.5294118, 0, 1,
-1.328497, -0.2156405, -2.65141, 1, 0.5333334, 0, 1,
-1.317153, 2.039525, 0.7378396, 1, 0.5411765, 0, 1,
-1.31518, -1.402936, -1.766533, 1, 0.5450981, 0, 1,
-1.313311, 0.2284246, -0.9864611, 1, 0.5529412, 0, 1,
-1.311558, -1.972445, -3.886231, 1, 0.5568628, 0, 1,
-1.309471, -1.262227, -1.932333, 1, 0.5647059, 0, 1,
-1.279123, -0.458551, -0.05743491, 1, 0.5686275, 0, 1,
-1.272482, 0.3368331, -0.1264987, 1, 0.5764706, 0, 1,
-1.27093, -0.3248934, -0.5218841, 1, 0.5803922, 0, 1,
-1.268222, -1.095239, -3.716445, 1, 0.5882353, 0, 1,
-1.260918, 0.4916182, -1.439268, 1, 0.5921569, 0, 1,
-1.258544, 0.369022, -0.5044305, 1, 0.6, 0, 1,
-1.245836, 1.401321, -1.214128, 1, 0.6078432, 0, 1,
-1.245495, -0.3188818, -2.729903, 1, 0.6117647, 0, 1,
-1.24448, -0.1274334, -1.78141, 1, 0.6196079, 0, 1,
-1.240931, -0.6091529, -2.741739, 1, 0.6235294, 0, 1,
-1.239992, -0.6526373, -1.89432, 1, 0.6313726, 0, 1,
-1.235712, 1.046334, -0.09405097, 1, 0.6352941, 0, 1,
-1.235547, 0.8330572, -0.4229575, 1, 0.6431373, 0, 1,
-1.227977, 0.5713481, -1.769388, 1, 0.6470588, 0, 1,
-1.22256, 0.6673411, -1.157835, 1, 0.654902, 0, 1,
-1.219595, 0.001564492, -1.899791, 1, 0.6588235, 0, 1,
-1.218882, -1.436947, -2.830638, 1, 0.6666667, 0, 1,
-1.217018, 0.5435672, -2.331079, 1, 0.6705883, 0, 1,
-1.213333, 0.01051535, -1.286246, 1, 0.6784314, 0, 1,
-1.199172, -0.1601158, -1.427262, 1, 0.682353, 0, 1,
-1.184524, -1.363008, -2.758586, 1, 0.6901961, 0, 1,
-1.183328, -0.6334302, -1.938311, 1, 0.6941177, 0, 1,
-1.178678, 0.3859343, -0.05377221, 1, 0.7019608, 0, 1,
-1.17294, -2.755197, -1.050261, 1, 0.7098039, 0, 1,
-1.165482, -0.7603469, -1.557326, 1, 0.7137255, 0, 1,
-1.164671, 0.4393008, -2.321811, 1, 0.7215686, 0, 1,
-1.158658, 0.2926102, -0.172953, 1, 0.7254902, 0, 1,
-1.15685, -1.118224, -1.157822, 1, 0.7333333, 0, 1,
-1.15197, 0.3545857, -1.135504, 1, 0.7372549, 0, 1,
-1.150496, 0.6199984, -0.4845224, 1, 0.7450981, 0, 1,
-1.142657, -0.9236885, -2.802666, 1, 0.7490196, 0, 1,
-1.142358, -0.7336658, -0.9074848, 1, 0.7568628, 0, 1,
-1.131337, 0.8327146, -2.925025, 1, 0.7607843, 0, 1,
-1.126846, -0.5635719, -1.693241, 1, 0.7686275, 0, 1,
-1.113642, -2.021738, -3.395321, 1, 0.772549, 0, 1,
-1.105564, -0.7783989, -2.180344, 1, 0.7803922, 0, 1,
-1.103791, -0.597411, -2.147198, 1, 0.7843137, 0, 1,
-1.102132, -0.4077158, -2.859492, 1, 0.7921569, 0, 1,
-1.100402, -0.07037089, -1.550563, 1, 0.7960784, 0, 1,
-1.095082, -0.9899805, -2.055911, 1, 0.8039216, 0, 1,
-1.094963, 0.1181421, -2.142451, 1, 0.8117647, 0, 1,
-1.093215, -1.88553, -2.897527, 1, 0.8156863, 0, 1,
-1.082641, -0.6549207, -1.776735, 1, 0.8235294, 0, 1,
-1.076994, 0.6432586, -0.4450697, 1, 0.827451, 0, 1,
-1.066323, -0.3678291, -1.053625, 1, 0.8352941, 0, 1,
-1.065605, -1.241352, -3.051704, 1, 0.8392157, 0, 1,
-1.062521, 0.2610461, -1.314373, 1, 0.8470588, 0, 1,
-1.050428, 0.3561107, -2.648843, 1, 0.8509804, 0, 1,
-1.044631, 0.509599, -1.350421, 1, 0.8588235, 0, 1,
-1.044133, -0.7816036, -2.433766, 1, 0.8627451, 0, 1,
-1.041575, -0.1484572, -2.199296, 1, 0.8705882, 0, 1,
-1.035738, -0.1940282, -2.786685, 1, 0.8745098, 0, 1,
-1.03021, -0.5587322, -2.323034, 1, 0.8823529, 0, 1,
-1.018163, -0.1936705, -0.33693, 1, 0.8862745, 0, 1,
-1.017418, -0.4539565, -0.7646692, 1, 0.8941177, 0, 1,
-1.016299, 0.6800953, -2.456882, 1, 0.8980392, 0, 1,
-1.005141, -1.082494, -3.067581, 1, 0.9058824, 0, 1,
-1.004026, -0.007114214, -0.8021564, 1, 0.9137255, 0, 1,
-1.001147, -0.1198831, -1.943338, 1, 0.9176471, 0, 1,
-0.9953018, -0.3894157, -0.5225024, 1, 0.9254902, 0, 1,
-0.990865, -0.5666471, -1.613424, 1, 0.9294118, 0, 1,
-0.985787, -0.03182302, -1.232322, 1, 0.9372549, 0, 1,
-0.9852499, 0.2490462, -0.584892, 1, 0.9411765, 0, 1,
-0.9830231, -1.045589, -3.89746, 1, 0.9490196, 0, 1,
-0.9818771, -2.085666, -3.940745, 1, 0.9529412, 0, 1,
-0.9789548, 1.526036, -1.063889, 1, 0.9607843, 0, 1,
-0.9722545, 0.7969552, -1.85395, 1, 0.9647059, 0, 1,
-0.9680474, 0.6937585, -1.080841, 1, 0.972549, 0, 1,
-0.9619747, -0.4661906, -4.180595, 1, 0.9764706, 0, 1,
-0.9505252, -0.07483692, -2.065042, 1, 0.9843137, 0, 1,
-0.9479435, -1.276913, -3.148098, 1, 0.9882353, 0, 1,
-0.9420007, -1.796039, -1.724324, 1, 0.9960784, 0, 1,
-0.9342307, -0.03194263, 0.1111287, 0.9960784, 1, 0, 1,
-0.9336572, -1.168506, -2.346047, 0.9921569, 1, 0, 1,
-0.9304669, -0.372255, -2.438671, 0.9843137, 1, 0, 1,
-0.9263979, 1.627103, 0.1838052, 0.9803922, 1, 0, 1,
-0.9224392, -0.787505, -1.939263, 0.972549, 1, 0, 1,
-0.919703, 2.100655, -0.6138715, 0.9686275, 1, 0, 1,
-0.9178449, -0.8178447, -3.174279, 0.9607843, 1, 0, 1,
-0.9177191, -1.975645, -2.934494, 0.9568627, 1, 0, 1,
-0.9169937, -0.6558688, -2.841678, 0.9490196, 1, 0, 1,
-0.9152411, 0.3451732, -1.379417, 0.945098, 1, 0, 1,
-0.9135579, -0.5543668, -2.027689, 0.9372549, 1, 0, 1,
-0.9135291, 0.6021847, 0.583868, 0.9333333, 1, 0, 1,
-0.9027467, -0.4605105, -3.404705, 0.9254902, 1, 0, 1,
-0.8892303, -0.883152, -2.724784, 0.9215686, 1, 0, 1,
-0.8875978, 0.988806, -1.628447, 0.9137255, 1, 0, 1,
-0.8840742, -0.2461217, -2.110126, 0.9098039, 1, 0, 1,
-0.8791986, -1.817873, -1.093782, 0.9019608, 1, 0, 1,
-0.8788996, -0.8134275, -3.135477, 0.8941177, 1, 0, 1,
-0.8774214, -0.6446081, -2.920974, 0.8901961, 1, 0, 1,
-0.8634167, -0.2619937, -2.667685, 0.8823529, 1, 0, 1,
-0.8633383, 0.00128509, -2.178761, 0.8784314, 1, 0, 1,
-0.8620993, 0.8476883, 0.6855073, 0.8705882, 1, 0, 1,
-0.8564814, 0.588165, -0.4015305, 0.8666667, 1, 0, 1,
-0.8486789, -0.8466595, -1.19912, 0.8588235, 1, 0, 1,
-0.8423815, -1.832007, -3.53558, 0.854902, 1, 0, 1,
-0.8396179, -0.473993, -2.901744, 0.8470588, 1, 0, 1,
-0.8390664, 0.4675759, 0.3566513, 0.8431373, 1, 0, 1,
-0.8291896, 0.02541438, -2.120893, 0.8352941, 1, 0, 1,
-0.8285666, -0.7973424, -2.130063, 0.8313726, 1, 0, 1,
-0.8276207, 1.615213, -1.733627, 0.8235294, 1, 0, 1,
-0.8265952, 0.1491959, -1.209359, 0.8196079, 1, 0, 1,
-0.8236573, -1.152556, -3.386988, 0.8117647, 1, 0, 1,
-0.823546, 0.3233781, -0.4240357, 0.8078431, 1, 0, 1,
-0.821236, -0.8828259, -1.873579, 0.8, 1, 0, 1,
-0.8080702, 0.8347606, -0.4896535, 0.7921569, 1, 0, 1,
-0.8048025, -0.5995928, -4.171957, 0.7882353, 1, 0, 1,
-0.803651, 0.3742232, 0.310665, 0.7803922, 1, 0, 1,
-0.8001458, -0.05239096, -1.39041, 0.7764706, 1, 0, 1,
-0.7994415, 1.4609, -0.2695187, 0.7686275, 1, 0, 1,
-0.79742, -0.2084719, -1.090158, 0.7647059, 1, 0, 1,
-0.7849734, -0.8018252, -3.162521, 0.7568628, 1, 0, 1,
-0.774482, -1.051987, -1.199906, 0.7529412, 1, 0, 1,
-0.7734966, -0.02453936, -1.241598, 0.7450981, 1, 0, 1,
-0.7732167, -0.4348156, -3.395585, 0.7411765, 1, 0, 1,
-0.7625847, 0.4603994, -0.7877753, 0.7333333, 1, 0, 1,
-0.7591119, 1.173372, 0.1981373, 0.7294118, 1, 0, 1,
-0.7577742, 0.4419172, -0.876074, 0.7215686, 1, 0, 1,
-0.7484309, 0.8714033, 0.2093513, 0.7176471, 1, 0, 1,
-0.7455768, -0.6780024, -1.652592, 0.7098039, 1, 0, 1,
-0.745521, 0.7865834, -1.857329, 0.7058824, 1, 0, 1,
-0.7411071, -0.5247416, -2.229593, 0.6980392, 1, 0, 1,
-0.7408028, 0.2454336, -1.577666, 0.6901961, 1, 0, 1,
-0.7404658, -0.761723, -1.883257, 0.6862745, 1, 0, 1,
-0.7403395, 2.056421, -1.030586, 0.6784314, 1, 0, 1,
-0.7294127, 0.8114731, 0.5230933, 0.6745098, 1, 0, 1,
-0.7279032, -1.480121, -2.395834, 0.6666667, 1, 0, 1,
-0.7277709, 0.05887305, 0.0004534322, 0.6627451, 1, 0, 1,
-0.7230464, 0.5562729, -1.140815, 0.654902, 1, 0, 1,
-0.7163315, 1.13959, -0.04879154, 0.6509804, 1, 0, 1,
-0.7147623, 0.01148276, -0.4735137, 0.6431373, 1, 0, 1,
-0.7043515, 1.235269, -1.721019, 0.6392157, 1, 0, 1,
-0.6875843, -0.2511375, -3.374341, 0.6313726, 1, 0, 1,
-0.6873012, 1.843218, -0.09424648, 0.627451, 1, 0, 1,
-0.6807677, -0.6123789, -3.288385, 0.6196079, 1, 0, 1,
-0.6779342, -0.2201442, 0.00709455, 0.6156863, 1, 0, 1,
-0.6682147, 0.9023857, -0.1207285, 0.6078432, 1, 0, 1,
-0.6677376, 0.7075976, -0.9112109, 0.6039216, 1, 0, 1,
-0.6667551, 1.050524, -1.63592, 0.5960785, 1, 0, 1,
-0.6656463, 1.446803, -0.1322662, 0.5882353, 1, 0, 1,
-0.6626585, -1.857454, -1.829575, 0.5843138, 1, 0, 1,
-0.6604713, 0.1973, 0.9307724, 0.5764706, 1, 0, 1,
-0.65863, -0.1236369, -2.679752, 0.572549, 1, 0, 1,
-0.6507442, -0.5539275, -3.449949, 0.5647059, 1, 0, 1,
-0.6472185, 1.621802, -1.306496, 0.5607843, 1, 0, 1,
-0.6465248, 0.3178538, -1.587313, 0.5529412, 1, 0, 1,
-0.6450745, -0.7741166, -1.309269, 0.5490196, 1, 0, 1,
-0.6430774, -0.07997854, -1.36396, 0.5411765, 1, 0, 1,
-0.6410823, 0.6071268, -1.253284, 0.5372549, 1, 0, 1,
-0.6379053, 1.819653, -0.1016847, 0.5294118, 1, 0, 1,
-0.6355405, 0.5093856, -2.692971, 0.5254902, 1, 0, 1,
-0.6341087, 1.064986, 0.7103765, 0.5176471, 1, 0, 1,
-0.6334312, -0.7971891, -2.215173, 0.5137255, 1, 0, 1,
-0.6286292, 1.507449, -1.299395, 0.5058824, 1, 0, 1,
-0.6275669, 0.8799018, 0.3393462, 0.5019608, 1, 0, 1,
-0.6240103, -0.9135574, -1.882069, 0.4941176, 1, 0, 1,
-0.6238314, -0.2983608, -1.165827, 0.4862745, 1, 0, 1,
-0.6206722, 2.11053, -0.5821899, 0.4823529, 1, 0, 1,
-0.617771, 0.5974991, -0.869838, 0.4745098, 1, 0, 1,
-0.6158912, -1.656448, -3.271036, 0.4705882, 1, 0, 1,
-0.6128448, 0.6031242, -1.778526, 0.4627451, 1, 0, 1,
-0.6099414, -0.4873362, -2.538995, 0.4588235, 1, 0, 1,
-0.6092561, 0.09763857, -2.286954, 0.4509804, 1, 0, 1,
-0.6083335, -0.6764529, -2.366632, 0.4470588, 1, 0, 1,
-0.6069379, 1.956351, 0.2990012, 0.4392157, 1, 0, 1,
-0.6045957, -1.975891, -2.587597, 0.4352941, 1, 0, 1,
-0.5885108, 0.7433506, -1.039507, 0.427451, 1, 0, 1,
-0.5865087, -0.8840778, -3.031962, 0.4235294, 1, 0, 1,
-0.5783364, 0.1862556, -1.693597, 0.4156863, 1, 0, 1,
-0.5752351, -1.512766, -4.277168, 0.4117647, 1, 0, 1,
-0.5708367, -0.245923, -1.229755, 0.4039216, 1, 0, 1,
-0.567551, -0.8417475, -2.955185, 0.3960784, 1, 0, 1,
-0.5553963, -0.3777283, -3.262125, 0.3921569, 1, 0, 1,
-0.5492238, 0.3198278, -0.4921947, 0.3843137, 1, 0, 1,
-0.5484682, -0.4054433, -2.008824, 0.3803922, 1, 0, 1,
-0.5479521, -0.7156658, -1.895479, 0.372549, 1, 0, 1,
-0.5477258, 0.6916673, -2.139712, 0.3686275, 1, 0, 1,
-0.5392913, -1.116535, -0.9895551, 0.3607843, 1, 0, 1,
-0.5332149, 0.4093054, -1.598751, 0.3568628, 1, 0, 1,
-0.5332036, 1.169303, 0.8553128, 0.3490196, 1, 0, 1,
-0.5307904, 1.870196, 0.5460895, 0.345098, 1, 0, 1,
-0.5307468, 2.347025, 0.03905274, 0.3372549, 1, 0, 1,
-0.526109, 1.493066, -0.2079684, 0.3333333, 1, 0, 1,
-0.525712, 0.281045, -3.329746, 0.3254902, 1, 0, 1,
-0.524811, -0.3370387, -1.568698, 0.3215686, 1, 0, 1,
-0.5245156, -0.06555811, -1.121957, 0.3137255, 1, 0, 1,
-0.517736, -0.006561109, -0.4374455, 0.3098039, 1, 0, 1,
-0.5146608, -1.170017, -0.6719708, 0.3019608, 1, 0, 1,
-0.5120855, 0.4120491, -1.931509, 0.2941177, 1, 0, 1,
-0.510009, 1.316691, -0.09817739, 0.2901961, 1, 0, 1,
-0.5089455, 1.297855, -0.7000303, 0.282353, 1, 0, 1,
-0.5056356, 1.330679, -1.630733, 0.2784314, 1, 0, 1,
-0.5051463, 0.5599983, -1.520351, 0.2705882, 1, 0, 1,
-0.5027807, 0.9188174, -0.7928681, 0.2666667, 1, 0, 1,
-0.5011864, -0.4152967, -2.248967, 0.2588235, 1, 0, 1,
-0.5009522, 0.4287932, -1.848888, 0.254902, 1, 0, 1,
-0.5000358, -1.174002, -1.703631, 0.2470588, 1, 0, 1,
-0.4968111, -1.455606, 0.1276806, 0.2431373, 1, 0, 1,
-0.4933983, -0.8833574, -3.939446, 0.2352941, 1, 0, 1,
-0.4925089, 0.8238577, -1.18363, 0.2313726, 1, 0, 1,
-0.4847007, -0.1916811, -3.20127, 0.2235294, 1, 0, 1,
-0.4828148, -0.3297871, -0.797568, 0.2196078, 1, 0, 1,
-0.4788219, 0.2269823, -2.227413, 0.2117647, 1, 0, 1,
-0.4777741, -1.661919, -1.252176, 0.2078431, 1, 0, 1,
-0.475974, -1.166614, -5.231448, 0.2, 1, 0, 1,
-0.4707452, 0.2353652, 0.7771764, 0.1921569, 1, 0, 1,
-0.4703957, 1.844655, -1.202788, 0.1882353, 1, 0, 1,
-0.4688435, -0.6407648, -0.8857691, 0.1803922, 1, 0, 1,
-0.4651483, -0.7963733, -2.374601, 0.1764706, 1, 0, 1,
-0.4638953, -0.03755894, -2.025779, 0.1686275, 1, 0, 1,
-0.4610774, -1.303439, -0.5878992, 0.1647059, 1, 0, 1,
-0.4581173, 1.41109, -0.1492102, 0.1568628, 1, 0, 1,
-0.4567463, -0.7152823, -1.10646, 0.1529412, 1, 0, 1,
-0.4547273, -0.5608519, -2.161634, 0.145098, 1, 0, 1,
-0.4505586, -0.6805578, -2.792251, 0.1411765, 1, 0, 1,
-0.4464355, -1.007005, -4.612765, 0.1333333, 1, 0, 1,
-0.445374, -0.2450417, -2.345261, 0.1294118, 1, 0, 1,
-0.444929, 0.0614555, -1.293025, 0.1215686, 1, 0, 1,
-0.4397688, 1.661509, 1.095443, 0.1176471, 1, 0, 1,
-0.4390604, 0.5642601, 0.6502208, 0.1098039, 1, 0, 1,
-0.434665, -2.346955, -3.939887, 0.1058824, 1, 0, 1,
-0.4345647, 0.01005584, -0.8274055, 0.09803922, 1, 0, 1,
-0.4253335, 0.5187914, -2.532626, 0.09019608, 1, 0, 1,
-0.4208027, 1.2065, -2.885199, 0.08627451, 1, 0, 1,
-0.4191714, 0.90493, -0.5545512, 0.07843138, 1, 0, 1,
-0.4163765, 0.2554008, -0.7452981, 0.07450981, 1, 0, 1,
-0.4163497, -0.766314, -1.655054, 0.06666667, 1, 0, 1,
-0.4146675, -1.444778, -3.215295, 0.0627451, 1, 0, 1,
-0.4119179, -0.73062, -3.517933, 0.05490196, 1, 0, 1,
-0.4103769, -0.05803679, -2.300346, 0.05098039, 1, 0, 1,
-0.4102462, 0.6764271, 0.2131516, 0.04313726, 1, 0, 1,
-0.4091214, 1.68447, -0.9954044, 0.03921569, 1, 0, 1,
-0.4090603, -1.080318, -3.011579, 0.03137255, 1, 0, 1,
-0.4061929, -0.440085, -1.869307, 0.02745098, 1, 0, 1,
-0.4053557, -1.206147, -2.279248, 0.01960784, 1, 0, 1,
-0.4051163, 0.3152122, 0.3336638, 0.01568628, 1, 0, 1,
-0.4036685, 0.8736686, -0.06688624, 0.007843138, 1, 0, 1,
-0.4024388, 0.239726, -1.454386, 0.003921569, 1, 0, 1,
-0.398741, 1.047393, 0.02976608, 0, 1, 0.003921569, 1,
-0.3972629, 2.257443, -0.6938565, 0, 1, 0.01176471, 1,
-0.3939103, 0.3995435, -2.136426, 0, 1, 0.01568628, 1,
-0.3895935, 0.5330579, 0.4615811, 0, 1, 0.02352941, 1,
-0.3889891, -0.4638792, -3.712039, 0, 1, 0.02745098, 1,
-0.3879537, -0.8886196, -3.112221, 0, 1, 0.03529412, 1,
-0.3869528, 0.7356073, -0.1969097, 0, 1, 0.03921569, 1,
-0.3860817, -0.7143881, -1.633648, 0, 1, 0.04705882, 1,
-0.3857675, -0.7961444, -2.863807, 0, 1, 0.05098039, 1,
-0.3849918, 0.2434155, -0.5631038, 0, 1, 0.05882353, 1,
-0.3772039, -0.1791682, -4.668849, 0, 1, 0.0627451, 1,
-0.3762, -1.603144, -2.504922, 0, 1, 0.07058824, 1,
-0.3719201, 0.08569185, -2.493109, 0, 1, 0.07450981, 1,
-0.3700134, 0.3040223, -1.457311, 0, 1, 0.08235294, 1,
-0.366363, -1.343451, -3.358505, 0, 1, 0.08627451, 1,
-0.3584654, -0.2309579, -1.912887, 0, 1, 0.09411765, 1,
-0.357996, -0.2228604, -0.5210944, 0, 1, 0.1019608, 1,
-0.3570747, -0.6569169, -2.266822, 0, 1, 0.1058824, 1,
-0.3567624, 1.862705, 0.07320439, 0, 1, 0.1137255, 1,
-0.3504131, -0.2047095, -0.18989, 0, 1, 0.1176471, 1,
-0.3500092, 0.5293061, -0.4328032, 0, 1, 0.1254902, 1,
-0.3454479, 0.0457233, -3.027575, 0, 1, 0.1294118, 1,
-0.3385324, -0.6580285, -3.697799, 0, 1, 0.1372549, 1,
-0.3383795, 0.2399828, 1.005618, 0, 1, 0.1411765, 1,
-0.3346142, -0.332389, -2.617563, 0, 1, 0.1490196, 1,
-0.331857, 0.1208506, -0.5582886, 0, 1, 0.1529412, 1,
-0.3296098, -0.8556957, -1.76215, 0, 1, 0.1607843, 1,
-0.3291019, -0.9836768, -0.9143251, 0, 1, 0.1647059, 1,
-0.3269394, 1.371273, -0.8112545, 0, 1, 0.172549, 1,
-0.326269, 1.992721, -1.328899, 0, 1, 0.1764706, 1,
-0.3246131, 1.273921, -0.3295293, 0, 1, 0.1843137, 1,
-0.3235785, 1.410912, -0.4404116, 0, 1, 0.1882353, 1,
-0.3224044, 0.5089635, -0.506478, 0, 1, 0.1960784, 1,
-0.3214805, -1.18201, -3.237955, 0, 1, 0.2039216, 1,
-0.3204605, 1.601851, 1.188239, 0, 1, 0.2078431, 1,
-0.3173699, 0.6127548, -1.187593, 0, 1, 0.2156863, 1,
-0.3152907, -1.135908, -4.048155, 0, 1, 0.2196078, 1,
-0.3139389, 1.292025, 0.4269079, 0, 1, 0.227451, 1,
-0.3100812, -1.670292, -3.282945, 0, 1, 0.2313726, 1,
-0.3089188, 0.8174865, -1.008789, 0, 1, 0.2392157, 1,
-0.2999746, -0.5331876, -1.765548, 0, 1, 0.2431373, 1,
-0.2991144, 0.4473496, -2.303309, 0, 1, 0.2509804, 1,
-0.2949053, -0.3160766, -2.533033, 0, 1, 0.254902, 1,
-0.2901613, 0.4578598, -0.0940363, 0, 1, 0.2627451, 1,
-0.2897135, -0.3975686, -3.115192, 0, 1, 0.2666667, 1,
-0.2893831, -1.409295, -4.707749, 0, 1, 0.2745098, 1,
-0.2876894, -0.4188061, -4.219007, 0, 1, 0.2784314, 1,
-0.2868787, -0.1706816, -2.321246, 0, 1, 0.2862745, 1,
-0.280568, -1.030989, -2.090047, 0, 1, 0.2901961, 1,
-0.2776588, -0.2185304, -2.226857, 0, 1, 0.2980392, 1,
-0.2761762, 1.333197, 0.001048144, 0, 1, 0.3058824, 1,
-0.2707756, 2.181292, -0.6378667, 0, 1, 0.3098039, 1,
-0.2668475, 1.913624, -0.2797774, 0, 1, 0.3176471, 1,
-0.2653663, 0.8239676, -0.02953259, 0, 1, 0.3215686, 1,
-0.2612219, -1.071934, -3.098269, 0, 1, 0.3294118, 1,
-0.260284, -0.2212858, -3.341529, 0, 1, 0.3333333, 1,
-0.2573322, -0.8455377, -1.063399, 0, 1, 0.3411765, 1,
-0.2569087, 0.8068121, -0.1302361, 0, 1, 0.345098, 1,
-0.2529162, 1.83037, 0.7900443, 0, 1, 0.3529412, 1,
-0.2473998, 0.5173337, -0.4810439, 0, 1, 0.3568628, 1,
-0.246994, -1.822914, -3.179801, 0, 1, 0.3647059, 1,
-0.2451401, 0.830636, -1.410629, 0, 1, 0.3686275, 1,
-0.2412983, -0.08037531, -3.030028, 0, 1, 0.3764706, 1,
-0.2399012, 2.192913, 0.8429422, 0, 1, 0.3803922, 1,
-0.2351265, -0.395662, -1.164662, 0, 1, 0.3882353, 1,
-0.2344725, 1.715103, 0.3185123, 0, 1, 0.3921569, 1,
-0.2335668, 0.1084912, -1.559174, 0, 1, 0.4, 1,
-0.2316789, 0.8076471, 1.659778, 0, 1, 0.4078431, 1,
-0.2287177, 1.677865, -0.292257, 0, 1, 0.4117647, 1,
-0.2208398, -0.9113098, -5.470894, 0, 1, 0.4196078, 1,
-0.214773, 0.2095215, -3.038666, 0, 1, 0.4235294, 1,
-0.2144271, -1.621295, -1.464892, 0, 1, 0.4313726, 1,
-0.2131835, -1.413347, -4.565993, 0, 1, 0.4352941, 1,
-0.210969, 1.42869, -1.39399, 0, 1, 0.4431373, 1,
-0.209172, -0.3835134, -2.828317, 0, 1, 0.4470588, 1,
-0.2084483, 0.3608086, -1.692083, 0, 1, 0.454902, 1,
-0.2073873, 1.174517, 0.354665, 0, 1, 0.4588235, 1,
-0.2051198, 2.683536, -0.5455844, 0, 1, 0.4666667, 1,
-0.2010926, -0.0252794, -1.599932, 0, 1, 0.4705882, 1,
-0.2000924, -0.3885525, -3.106727, 0, 1, 0.4784314, 1,
-0.1999647, -0.9094145, -2.501074, 0, 1, 0.4823529, 1,
-0.1991774, -0.4293625, -1.853789, 0, 1, 0.4901961, 1,
-0.1983808, 0.7209558, 0.2804754, 0, 1, 0.4941176, 1,
-0.1971918, 1.003204, -1.153491, 0, 1, 0.5019608, 1,
-0.1953581, -0.1635102, -2.346174, 0, 1, 0.509804, 1,
-0.1936575, -0.5291553, -4.778104, 0, 1, 0.5137255, 1,
-0.1936128, 0.2864123, -1.138539, 0, 1, 0.5215687, 1,
-0.1919684, 0.2243253, -1.108582, 0, 1, 0.5254902, 1,
-0.1912618, -0.3890421, -1.801445, 0, 1, 0.5333334, 1,
-0.1900769, 0.2633925, 2.142896, 0, 1, 0.5372549, 1,
-0.1888444, -0.6538905, -3.277565, 0, 1, 0.5450981, 1,
-0.185901, -0.3404779, -2.221254, 0, 1, 0.5490196, 1,
-0.183573, -0.2338874, -2.829025, 0, 1, 0.5568628, 1,
-0.1815296, 2.010365, 0.9544525, 0, 1, 0.5607843, 1,
-0.1797099, 1.599199, 0.7413728, 0, 1, 0.5686275, 1,
-0.175915, -0.0840863, -1.496155, 0, 1, 0.572549, 1,
-0.1676427, -1.035273, -4.015087, 0, 1, 0.5803922, 1,
-0.1670002, 1.310196, 0.01103347, 0, 1, 0.5843138, 1,
-0.1667676, 1.282679, 0.9588645, 0, 1, 0.5921569, 1,
-0.1662765, -0.9217914, -2.84199, 0, 1, 0.5960785, 1,
-0.1603484, 0.9587207, -0.5275406, 0, 1, 0.6039216, 1,
-0.1601441, -0.7748291, -2.823766, 0, 1, 0.6117647, 1,
-0.1591536, 1.851341, -2.378621, 0, 1, 0.6156863, 1,
-0.1572514, -0.9129585, -1.445193, 0, 1, 0.6235294, 1,
-0.1564498, -0.1202804, -2.600641, 0, 1, 0.627451, 1,
-0.1518641, -0.6535406, -4.297628, 0, 1, 0.6352941, 1,
-0.149423, 1.339821, -0.4850208, 0, 1, 0.6392157, 1,
-0.1473977, -1.361818, -3.881044, 0, 1, 0.6470588, 1,
-0.1468558, -0.4277664, -3.061271, 0, 1, 0.6509804, 1,
-0.1442709, 1.781151, 0.02702353, 0, 1, 0.6588235, 1,
-0.1436891, -0.8196461, -3.530989, 0, 1, 0.6627451, 1,
-0.1427497, 2.312868, -1.340991, 0, 1, 0.6705883, 1,
-0.1402916, -0.8065854, -2.038429, 0, 1, 0.6745098, 1,
-0.1383354, 0.881924, -1.275842, 0, 1, 0.682353, 1,
-0.1376802, 0.03801828, -0.04771709, 0, 1, 0.6862745, 1,
-0.1373047, -0.7722762, -1.526586, 0, 1, 0.6941177, 1,
-0.136082, 0.4013751, 0.455471, 0, 1, 0.7019608, 1,
-0.1338088, -1.26623, -2.055755, 0, 1, 0.7058824, 1,
-0.1316235, 1.459499, 1.256315, 0, 1, 0.7137255, 1,
-0.1272187, -1.498843, -3.276767, 0, 1, 0.7176471, 1,
-0.1271213, 0.5778944, 0.4553042, 0, 1, 0.7254902, 1,
-0.1263762, -0.2859971, -2.060153, 0, 1, 0.7294118, 1,
-0.1248068, 1.880035, 0.4383559, 0, 1, 0.7372549, 1,
-0.1242824, 1.293145, 0.08984557, 0, 1, 0.7411765, 1,
-0.1242757, -1.282503, -3.37926, 0, 1, 0.7490196, 1,
-0.1214499, 0.3616955, 1.648752, 0, 1, 0.7529412, 1,
-0.1205644, 1.130888, -0.005042125, 0, 1, 0.7607843, 1,
-0.1182107, 0.6037847, -0.3155994, 0, 1, 0.7647059, 1,
-0.113733, 1.634884, 0.2215792, 0, 1, 0.772549, 1,
-0.1115507, 0.8245612, 1.026512, 0, 1, 0.7764706, 1,
-0.1089095, 0.05089734, -3.260673, 0, 1, 0.7843137, 1,
-0.1073233, -1.456259, -3.014266, 0, 1, 0.7882353, 1,
-0.1067509, -1.603742, -2.370323, 0, 1, 0.7960784, 1,
-0.1067415, -1.023187, -4.182204, 0, 1, 0.8039216, 1,
-0.1057951, 2.275106, -0.8515365, 0, 1, 0.8078431, 1,
-0.1057748, -1.488583, -4.151646, 0, 1, 0.8156863, 1,
-0.1048688, 0.1037549, -0.9189273, 0, 1, 0.8196079, 1,
-0.1031854, 1.023518, -1.442675, 0, 1, 0.827451, 1,
-0.1028658, 0.1584651, -0.7325402, 0, 1, 0.8313726, 1,
-0.1018895, -2.762142, -4.155172, 0, 1, 0.8392157, 1,
-0.09775329, 0.5528548, -1.815702, 0, 1, 0.8431373, 1,
-0.09718268, 0.1675919, 0.2817117, 0, 1, 0.8509804, 1,
-0.09200314, 0.6166332, -0.4511109, 0, 1, 0.854902, 1,
-0.09120761, -1.641472, -2.888727, 0, 1, 0.8627451, 1,
-0.08771936, 0.1777025, -1.242344, 0, 1, 0.8666667, 1,
-0.08685952, -1.205258, -3.288566, 0, 1, 0.8745098, 1,
-0.08637675, -0.1804372, -4.378892, 0, 1, 0.8784314, 1,
-0.07942206, -0.6725233, -1.94631, 0, 1, 0.8862745, 1,
-0.07564085, 0.2254534, 0.6047578, 0, 1, 0.8901961, 1,
-0.0743833, 0.2315852, -0.3550733, 0, 1, 0.8980392, 1,
-0.07372326, -0.02351273, -3.075375, 0, 1, 0.9058824, 1,
-0.07132827, 0.08937936, -1.925262, 0, 1, 0.9098039, 1,
-0.06850372, 0.1945424, -1.452115, 0, 1, 0.9176471, 1,
-0.06569906, -1.461918, -2.901573, 0, 1, 0.9215686, 1,
-0.06353651, 0.4477545, -0.1384252, 0, 1, 0.9294118, 1,
-0.06281978, -0.1907789, -4.643438, 0, 1, 0.9333333, 1,
-0.06004281, 0.1164635, -2.878394, 0, 1, 0.9411765, 1,
-0.05617571, 0.1782435, -0.8289643, 0, 1, 0.945098, 1,
-0.05413507, 0.1357129, -0.6343281, 0, 1, 0.9529412, 1,
-0.05310626, -0.2368093, -4.135902, 0, 1, 0.9568627, 1,
-0.05177551, 0.5569866, 1.550696, 0, 1, 0.9647059, 1,
-0.04975066, -0.541523, -2.174873, 0, 1, 0.9686275, 1,
-0.04740047, -0.2071483, -2.198041, 0, 1, 0.9764706, 1,
-0.04632864, 0.1750623, 0.509313, 0, 1, 0.9803922, 1,
-0.04377086, -0.3698491, -2.600123, 0, 1, 0.9882353, 1,
-0.04157556, -0.09841508, -2.631285, 0, 1, 0.9921569, 1,
-0.04109339, 0.09315129, -1.412308, 0, 1, 1, 1,
-0.04018867, 0.3016189, 0.3781038, 0, 0.9921569, 1, 1,
-0.04000637, -1.332905, -2.298655, 0, 0.9882353, 1, 1,
-0.03178227, -0.5697104, -3.122272, 0, 0.9803922, 1, 1,
-0.03149726, -0.1536912, -4.525323, 0, 0.9764706, 1, 1,
-0.03099534, 0.02238191, -0.1481654, 0, 0.9686275, 1, 1,
-0.02719083, -0.1680035, -1.173329, 0, 0.9647059, 1, 1,
-0.0218515, -1.733712, -4.033484, 0, 0.9568627, 1, 1,
-0.02124646, 1.189596, 0.5151368, 0, 0.9529412, 1, 1,
-0.01872941, -1.346924, -3.0174, 0, 0.945098, 1, 1,
-0.01867474, -0.06968606, -3.112789, 0, 0.9411765, 1, 1,
-0.01853762, -1.031221, -4.527188, 0, 0.9333333, 1, 1,
-0.01252681, -0.02472219, -0.8442314, 0, 0.9294118, 1, 1,
-0.01210092, -0.7121492, -5.214661, 0, 0.9215686, 1, 1,
-0.01181619, -1.426725, -2.33236, 0, 0.9176471, 1, 1,
-0.0111691, 1.483393, -0.08463069, 0, 0.9098039, 1, 1,
-0.01090812, -2.192998, -1.452772, 0, 0.9058824, 1, 1,
-0.01007718, -0.4496216, -3.230611, 0, 0.8980392, 1, 1,
-0.007809872, 2.225089, 0.1053135, 0, 0.8901961, 1, 1,
-0.005770687, -1.970605, -2.487885, 0, 0.8862745, 1, 1,
-0.003754845, -0.1999683, -3.77798, 0, 0.8784314, 1, 1,
0.0004560806, -0.8192459, 2.053611, 0, 0.8745098, 1, 1,
0.006192576, -0.5778968, 3.415493, 0, 0.8666667, 1, 1,
0.008216122, 0.8384929, -0.3085289, 0, 0.8627451, 1, 1,
0.01440614, -0.489772, 3.700844, 0, 0.854902, 1, 1,
0.01927796, 0.5553889, -0.01089298, 0, 0.8509804, 1, 1,
0.01974175, -0.9543918, 3.883477, 0, 0.8431373, 1, 1,
0.0235467, 1.734189, 1.492031, 0, 0.8392157, 1, 1,
0.02357333, 0.01979672, 0.8397549, 0, 0.8313726, 1, 1,
0.02496947, 0.5847234, 0.4624806, 0, 0.827451, 1, 1,
0.02601026, -1.319821, 4.550198, 0, 0.8196079, 1, 1,
0.02759406, -1.666223, 2.522071, 0, 0.8156863, 1, 1,
0.02929891, 0.8505137, 0.1377509, 0, 0.8078431, 1, 1,
0.03292523, -0.1708946, 2.167619, 0, 0.8039216, 1, 1,
0.03796099, -0.6033551, 4.08186, 0, 0.7960784, 1, 1,
0.0386121, -0.6397462, 4.054483, 0, 0.7882353, 1, 1,
0.03955691, -0.5611122, 1.915061, 0, 0.7843137, 1, 1,
0.03991342, 0.6056307, 0.2766411, 0, 0.7764706, 1, 1,
0.04503407, -0.06589351, 1.594294, 0, 0.772549, 1, 1,
0.04572696, -0.2910343, 1.855311, 0, 0.7647059, 1, 1,
0.05152446, 0.6051899, -0.2775663, 0, 0.7607843, 1, 1,
0.06094569, 0.06241905, 0.2540892, 0, 0.7529412, 1, 1,
0.06829175, 1.276529, -0.6572338, 0, 0.7490196, 1, 1,
0.07007626, 0.4266999, 0.8507237, 0, 0.7411765, 1, 1,
0.0707771, -0.1744048, 3.164101, 0, 0.7372549, 1, 1,
0.07246278, -0.281453, 1.877058, 0, 0.7294118, 1, 1,
0.07383159, -1.067515, 3.306499, 0, 0.7254902, 1, 1,
0.07515803, -0.9986507, 2.547197, 0, 0.7176471, 1, 1,
0.07867095, -1.463575, 2.56495, 0, 0.7137255, 1, 1,
0.08318486, -1.943816, 0.8003566, 0, 0.7058824, 1, 1,
0.09097228, -0.06231355, 2.441696, 0, 0.6980392, 1, 1,
0.0950714, 0.720898, 0.1384005, 0, 0.6941177, 1, 1,
0.09636708, -1.018047, 3.155403, 0, 0.6862745, 1, 1,
0.1080559, -0.01411316, 2.249511, 0, 0.682353, 1, 1,
0.1081837, -0.02286936, 0.8648072, 0, 0.6745098, 1, 1,
0.1142672, -1.277498, 2.311375, 0, 0.6705883, 1, 1,
0.116073, -0.6406828, 4.043825, 0, 0.6627451, 1, 1,
0.1182545, -0.3588589, 1.89717, 0, 0.6588235, 1, 1,
0.1184084, -1.834718, 3.231636, 0, 0.6509804, 1, 1,
0.1211347, -0.01196999, -1.199403, 0, 0.6470588, 1, 1,
0.1298018, -0.9358119, 3.204117, 0, 0.6392157, 1, 1,
0.1305243, 0.8439806, -1.030101, 0, 0.6352941, 1, 1,
0.1316243, 1.062822, -0.9838796, 0, 0.627451, 1, 1,
0.1351607, -0.05032953, 2.039773, 0, 0.6235294, 1, 1,
0.1418816, 0.2132559, -0.3929219, 0, 0.6156863, 1, 1,
0.1430365, -0.3783028, 2.207978, 0, 0.6117647, 1, 1,
0.1450642, 0.3783787, 0.5861485, 0, 0.6039216, 1, 1,
0.1458842, 0.744551, -1.281167, 0, 0.5960785, 1, 1,
0.147324, 0.5341144, -1.161769, 0, 0.5921569, 1, 1,
0.151641, 0.5683815, -0.1960365, 0, 0.5843138, 1, 1,
0.1540114, 1.286809, -0.2545457, 0, 0.5803922, 1, 1,
0.1563919, -0.1441695, 2.132621, 0, 0.572549, 1, 1,
0.1588323, -0.7023618, 2.643765, 0, 0.5686275, 1, 1,
0.1611463, 0.3942347, -0.8445681, 0, 0.5607843, 1, 1,
0.1626368, 1.166646, 0.9764714, 0, 0.5568628, 1, 1,
0.1644466, -0.5639914, -0.3127007, 0, 0.5490196, 1, 1,
0.1657167, -1.713418, 4.253857, 0, 0.5450981, 1, 1,
0.17031, -1.313302, 4.572363, 0, 0.5372549, 1, 1,
0.1727841, 0.6971892, -1.387232, 0, 0.5333334, 1, 1,
0.1729847, -1.060183, 2.91936, 0, 0.5254902, 1, 1,
0.1741257, -0.2237305, 2.571805, 0, 0.5215687, 1, 1,
0.1752231, 2.568321, 0.07381409, 0, 0.5137255, 1, 1,
0.1773374, 1.40616, 0.6051625, 0, 0.509804, 1, 1,
0.1773989, -0.3835238, 2.401691, 0, 0.5019608, 1, 1,
0.1810167, 0.1277142, -1.054686, 0, 0.4941176, 1, 1,
0.1832203, 0.3093765, 0.1181648, 0, 0.4901961, 1, 1,
0.1843573, -0.1863429, 1.609126, 0, 0.4823529, 1, 1,
0.185156, 0.8292925, -0.02266192, 0, 0.4784314, 1, 1,
0.1859019, 0.6027683, 2.348709, 0, 0.4705882, 1, 1,
0.191292, 0.0861599, -0.2598477, 0, 0.4666667, 1, 1,
0.1940989, 0.3889956, -0.1827492, 0, 0.4588235, 1, 1,
0.1954988, 0.6793861, 1.635445, 0, 0.454902, 1, 1,
0.1981439, -0.008816449, 2.476236, 0, 0.4470588, 1, 1,
0.204768, 0.7032287, 0.1113035, 0, 0.4431373, 1, 1,
0.2049178, -0.1804041, 0.9507682, 0, 0.4352941, 1, 1,
0.207764, -0.3284741, 1.70701, 0, 0.4313726, 1, 1,
0.2081181, 0.6594159, 1.714508, 0, 0.4235294, 1, 1,
0.2143872, 0.6875217, 0.4431801, 0, 0.4196078, 1, 1,
0.2146095, -0.8274394, 1.662743, 0, 0.4117647, 1, 1,
0.2232361, -1.342465, 3.351458, 0, 0.4078431, 1, 1,
0.2234599, 2.011863, 1.851262, 0, 0.4, 1, 1,
0.228166, 0.08088578, 1.489065, 0, 0.3921569, 1, 1,
0.2307139, -0.123174, 2.259263, 0, 0.3882353, 1, 1,
0.2443434, -0.1835359, 1.93242, 0, 0.3803922, 1, 1,
0.250461, 0.1175101, 1.791734, 0, 0.3764706, 1, 1,
0.2562808, -1.703555, 3.493787, 0, 0.3686275, 1, 1,
0.2602659, -0.2047967, 0.3459528, 0, 0.3647059, 1, 1,
0.2605484, 0.8058063, 0.4723963, 0, 0.3568628, 1, 1,
0.2642276, -1.112786, 4.897926, 0, 0.3529412, 1, 1,
0.2672058, -1.852576, 3.560894, 0, 0.345098, 1, 1,
0.2708101, 0.8616592, 1.847245, 0, 0.3411765, 1, 1,
0.2793526, 1.079058, 1.431599, 0, 0.3333333, 1, 1,
0.2822894, 1.203163, 0.7625158, 0, 0.3294118, 1, 1,
0.2823262, 0.4487363, -0.1995079, 0, 0.3215686, 1, 1,
0.2948114, 1.044682, 0.7715364, 0, 0.3176471, 1, 1,
0.2957365, -1.526127, 3.927273, 0, 0.3098039, 1, 1,
0.2970933, -0.9728014, 0.1604029, 0, 0.3058824, 1, 1,
0.2978351, -3.347501, 2.702551, 0, 0.2980392, 1, 1,
0.2987829, 0.3515656, 0.1712157, 0, 0.2901961, 1, 1,
0.3007364, -0.7739695, 2.832793, 0, 0.2862745, 1, 1,
0.3055516, 0.8490399, -0.9266146, 0, 0.2784314, 1, 1,
0.3063694, -0.01758523, 2.409244, 0, 0.2745098, 1, 1,
0.3064199, 0.2639036, 1.546862, 0, 0.2666667, 1, 1,
0.3105723, -1.506895, 1.541226, 0, 0.2627451, 1, 1,
0.3129945, 0.6853415, 1.060987, 0, 0.254902, 1, 1,
0.3317986, -1.167284, 3.715859, 0, 0.2509804, 1, 1,
0.3322738, -0.4114274, 4.169872, 0, 0.2431373, 1, 1,
0.333013, -1.335225, 3.3112, 0, 0.2392157, 1, 1,
0.3340188, 1.03699, 1.705416, 0, 0.2313726, 1, 1,
0.3389924, -1.67006, 2.001455, 0, 0.227451, 1, 1,
0.3416919, -0.4003153, 0.6182901, 0, 0.2196078, 1, 1,
0.3418491, 0.3236857, 1.417444, 0, 0.2156863, 1, 1,
0.345231, 1.126953, -0.602897, 0, 0.2078431, 1, 1,
0.3478047, 0.4601589, 1.655877, 0, 0.2039216, 1, 1,
0.3479718, 0.0004602796, 1.742542, 0, 0.1960784, 1, 1,
0.3526942, -0.06602504, 1.148547, 0, 0.1882353, 1, 1,
0.3533081, 0.6942945, 0.6146576, 0, 0.1843137, 1, 1,
0.3583529, -0.951421, 2.005375, 0, 0.1764706, 1, 1,
0.3590827, 0.9006809, 2.222753, 0, 0.172549, 1, 1,
0.3595622, -0.191813, 2.239218, 0, 0.1647059, 1, 1,
0.3643248, 0.1635934, -0.1380289, 0, 0.1607843, 1, 1,
0.3663248, 0.3609045, 1.627533, 0, 0.1529412, 1, 1,
0.3688678, 0.4568036, 0.6584196, 0, 0.1490196, 1, 1,
0.3694045, -1.442075, 2.071906, 0, 0.1411765, 1, 1,
0.3750012, 1.12072, -0.02686901, 0, 0.1372549, 1, 1,
0.3771468, 0.7317519, 0.457966, 0, 0.1294118, 1, 1,
0.3799214, -0.4310769, 3.026001, 0, 0.1254902, 1, 1,
0.3810108, -0.37749, 3.026341, 0, 0.1176471, 1, 1,
0.3877475, -0.6645678, 2.695145, 0, 0.1137255, 1, 1,
0.3900014, -1.927617, 2.13353, 0, 0.1058824, 1, 1,
0.3906895, -0.2394152, 2.211523, 0, 0.09803922, 1, 1,
0.3946264, 0.5647107, 0.5380275, 0, 0.09411765, 1, 1,
0.3949168, -0.4013693, 3.02962, 0, 0.08627451, 1, 1,
0.3974814, -0.3760336, 2.721579, 0, 0.08235294, 1, 1,
0.3975857, 0.9312391, 0.8852629, 0, 0.07450981, 1, 1,
0.3997239, 1.833224, 0.2694869, 0, 0.07058824, 1, 1,
0.4001203, 1.039735, 1.035035, 0, 0.0627451, 1, 1,
0.4056152, 0.2824275, 2.854222, 0, 0.05882353, 1, 1,
0.4056878, -0.1905553, 0.3215318, 0, 0.05098039, 1, 1,
0.411059, -0.6614071, 2.141815, 0, 0.04705882, 1, 1,
0.4198695, 0.241625, 1.571455, 0, 0.03921569, 1, 1,
0.4210922, -0.1183149, 3.481013, 0, 0.03529412, 1, 1,
0.4295996, 0.5584694, 0.3909991, 0, 0.02745098, 1, 1,
0.4344079, 1.198866, 0.6106579, 0, 0.02352941, 1, 1,
0.4365886, 1.342494, 0.9099876, 0, 0.01568628, 1, 1,
0.4374598, 0.326886, 0.9982421, 0, 0.01176471, 1, 1,
0.4410844, -0.5698406, 2.938198, 0, 0.003921569, 1, 1,
0.4436804, 1.336899, 0.4637703, 0.003921569, 0, 1, 1,
0.445801, -1.473188, 2.04156, 0.007843138, 0, 1, 1,
0.4478941, 0.9493421, 0.1903741, 0.01568628, 0, 1, 1,
0.4516068, 0.1618934, 0.3144427, 0.01960784, 0, 1, 1,
0.4524866, 0.4451802, -1.171337, 0.02745098, 0, 1, 1,
0.4539465, -0.3080497, 3.365424, 0.03137255, 0, 1, 1,
0.4539908, -1.466659, 3.375754, 0.03921569, 0, 1, 1,
0.4541714, -0.4418973, 3.144, 0.04313726, 0, 1, 1,
0.4600096, -0.1584233, 1.269847, 0.05098039, 0, 1, 1,
0.4697802, 0.1971679, -0.7200894, 0.05490196, 0, 1, 1,
0.4734977, 0.4337323, -0.02527763, 0.0627451, 0, 1, 1,
0.4791039, 0.2119674, 0.7235274, 0.06666667, 0, 1, 1,
0.4845285, 1.204135, -1.136615, 0.07450981, 0, 1, 1,
0.484821, 1.726349, -0.3420866, 0.07843138, 0, 1, 1,
0.4853867, -0.5522385, 3.162866, 0.08627451, 0, 1, 1,
0.4862029, -0.07268891, 3.027717, 0.09019608, 0, 1, 1,
0.4868776, -1.164562, 2.879296, 0.09803922, 0, 1, 1,
0.4899797, -0.6542865, 2.489575, 0.1058824, 0, 1, 1,
0.4913153, 0.7808063, -0.547691, 0.1098039, 0, 1, 1,
0.4914174, -0.8740099, 2.487263, 0.1176471, 0, 1, 1,
0.4920194, 0.7086054, 0.2807391, 0.1215686, 0, 1, 1,
0.4949451, -2.37984, 2.494649, 0.1294118, 0, 1, 1,
0.4963484, -0.5793407, 0.6571978, 0.1333333, 0, 1, 1,
0.5062025, 0.1890493, 2.552085, 0.1411765, 0, 1, 1,
0.5075974, 0.8530911, -0.7442639, 0.145098, 0, 1, 1,
0.5086036, -1.486571, 3.25026, 0.1529412, 0, 1, 1,
0.5096458, -2.121229, 3.082529, 0.1568628, 0, 1, 1,
0.5132733, -1.018089, 3.472525, 0.1647059, 0, 1, 1,
0.5196705, 0.008522838, -0.7904317, 0.1686275, 0, 1, 1,
0.5261659, 0.3820881, 1.951591, 0.1764706, 0, 1, 1,
0.5291329, -0.05644395, 4.027836, 0.1803922, 0, 1, 1,
0.531378, 0.1501513, 0.552513, 0.1882353, 0, 1, 1,
0.5338808, 0.5235946, -0.6257457, 0.1921569, 0, 1, 1,
0.5384085, -0.6652349, 1.894359, 0.2, 0, 1, 1,
0.5385006, 0.8527519, 1.118346, 0.2078431, 0, 1, 1,
0.5430058, 0.2180563, 2.414366, 0.2117647, 0, 1, 1,
0.5456682, -1.889941, 3.22654, 0.2196078, 0, 1, 1,
0.5538533, 0.2412928, 2.884194, 0.2235294, 0, 1, 1,
0.5545169, -1.56115, 1.73239, 0.2313726, 0, 1, 1,
0.5582954, 2.512672, 0.8365138, 0.2352941, 0, 1, 1,
0.5667055, -0.514869, 3.183295, 0.2431373, 0, 1, 1,
0.5675322, -0.7133877, 3.008862, 0.2470588, 0, 1, 1,
0.5719408, -0.7364709, 3.265694, 0.254902, 0, 1, 1,
0.5738965, 1.195232, 0.4049021, 0.2588235, 0, 1, 1,
0.577589, 0.6092485, 0.8858774, 0.2666667, 0, 1, 1,
0.5795195, 2.823807, 0.3969309, 0.2705882, 0, 1, 1,
0.5831698, -0.02592286, 1.503723, 0.2784314, 0, 1, 1,
0.5878189, 0.2187551, 1.224098, 0.282353, 0, 1, 1,
0.5887402, 1.30401, -0.2917508, 0.2901961, 0, 1, 1,
0.5917198, 0.4563843, -0.1486752, 0.2941177, 0, 1, 1,
0.5954041, -0.6137078, 2.199993, 0.3019608, 0, 1, 1,
0.6008171, -0.1881141, 0.7102486, 0.3098039, 0, 1, 1,
0.6051, 0.2592508, 1.991919, 0.3137255, 0, 1, 1,
0.6052751, -0.5743313, 2.5452, 0.3215686, 0, 1, 1,
0.615368, -0.08167401, 2.665112, 0.3254902, 0, 1, 1,
0.6163366, -0.1736208, 1.70468, 0.3333333, 0, 1, 1,
0.6213845, 1.609023, 0.740794, 0.3372549, 0, 1, 1,
0.6243941, -0.6387002, 1.937119, 0.345098, 0, 1, 1,
0.6257744, -0.3933217, 3.416108, 0.3490196, 0, 1, 1,
0.629041, 0.435189, 0.1694314, 0.3568628, 0, 1, 1,
0.636844, 1.785668, -0.1841985, 0.3607843, 0, 1, 1,
0.6409417, 0.4947932, 0.2314591, 0.3686275, 0, 1, 1,
0.6483036, -0.5526401, 2.558869, 0.372549, 0, 1, 1,
0.659064, 0.2521559, -0.06257914, 0.3803922, 0, 1, 1,
0.6606222, -1.647528, 3.380765, 0.3843137, 0, 1, 1,
0.6616135, -0.2040668, 1.857248, 0.3921569, 0, 1, 1,
0.6621632, -0.2067141, 2.194503, 0.3960784, 0, 1, 1,
0.6687706, 0.2173157, 1.386355, 0.4039216, 0, 1, 1,
0.671438, 0.8608494, 0.4457018, 0.4117647, 0, 1, 1,
0.6725762, -0.5072778, 2.886329, 0.4156863, 0, 1, 1,
0.6773554, 1.112223, 1.498891, 0.4235294, 0, 1, 1,
0.6848477, -0.01652571, 2.313809, 0.427451, 0, 1, 1,
0.6867333, 0.3630369, 0.2548936, 0.4352941, 0, 1, 1,
0.6876411, -0.09863497, 1.875321, 0.4392157, 0, 1, 1,
0.6889138, 1.199401, -0.5564425, 0.4470588, 0, 1, 1,
0.6995174, -1.421836, 1.10425, 0.4509804, 0, 1, 1,
0.7001374, -0.06401579, 1.061223, 0.4588235, 0, 1, 1,
0.7027113, 0.120674, 1.382725, 0.4627451, 0, 1, 1,
0.7036572, -1.607221, 3.491409, 0.4705882, 0, 1, 1,
0.7046341, -1.92031, 2.956537, 0.4745098, 0, 1, 1,
0.7071382, -0.5851125, 2.334473, 0.4823529, 0, 1, 1,
0.7143158, -0.2024649, 1.414312, 0.4862745, 0, 1, 1,
0.7144136, -0.2579198, 2.522247, 0.4941176, 0, 1, 1,
0.7194439, 0.05879249, 2.310926, 0.5019608, 0, 1, 1,
0.7212792, -0.2462396, 1.595041, 0.5058824, 0, 1, 1,
0.7219943, -0.9899885, 3.50056, 0.5137255, 0, 1, 1,
0.7222466, 0.1923468, 1.533741, 0.5176471, 0, 1, 1,
0.7244347, 0.7363138, -0.4881048, 0.5254902, 0, 1, 1,
0.7247738, 0.1568098, 1.519362, 0.5294118, 0, 1, 1,
0.7256787, 0.4226565, 1.289937, 0.5372549, 0, 1, 1,
0.7272841, 0.6518669, 0.003917989, 0.5411765, 0, 1, 1,
0.728596, 0.4325544, 1.426026, 0.5490196, 0, 1, 1,
0.7320907, -0.8433506, 1.622575, 0.5529412, 0, 1, 1,
0.7332017, 1.219205, 0.4387579, 0.5607843, 0, 1, 1,
0.7338393, -1.466462, 3.100779, 0.5647059, 0, 1, 1,
0.7342236, -0.4559433, 3.263577, 0.572549, 0, 1, 1,
0.7368683, -0.5562107, 2.553164, 0.5764706, 0, 1, 1,
0.7387447, 1.405046, 2.349494, 0.5843138, 0, 1, 1,
0.7395659, -1.762725, 3.169444, 0.5882353, 0, 1, 1,
0.7431032, -0.0248506, 2.121485, 0.5960785, 0, 1, 1,
0.7511889, -0.4198912, 2.246892, 0.6039216, 0, 1, 1,
0.7516503, -0.3803036, 2.256476, 0.6078432, 0, 1, 1,
0.756582, 1.373272, -0.6869627, 0.6156863, 0, 1, 1,
0.7611951, -0.1732544, 0.9419901, 0.6196079, 0, 1, 1,
0.763473, 0.2483557, 1.20959, 0.627451, 0, 1, 1,
0.7683685, 0.1345965, 1.748491, 0.6313726, 0, 1, 1,
0.7728652, -0.5999084, 2.118599, 0.6392157, 0, 1, 1,
0.7738783, -0.02522666, 0.9526914, 0.6431373, 0, 1, 1,
0.7757055, -0.5521182, 1.610646, 0.6509804, 0, 1, 1,
0.777489, 0.31635, 0.394524, 0.654902, 0, 1, 1,
0.7800162, -2.528049, 3.071985, 0.6627451, 0, 1, 1,
0.7811794, 0.5985162, 1.575525, 0.6666667, 0, 1, 1,
0.7820174, -1.492241, 2.84662, 0.6745098, 0, 1, 1,
0.7853367, 0.7657818, 0.8527546, 0.6784314, 0, 1, 1,
0.7905181, 0.2827238, 0.9834068, 0.6862745, 0, 1, 1,
0.7978333, 0.620608, 0.7357383, 0.6901961, 0, 1, 1,
0.7980263, 0.6337833, 2.157137, 0.6980392, 0, 1, 1,
0.798712, 1.642571, 0.9049133, 0.7058824, 0, 1, 1,
0.8004268, 0.1437983, 1.903919, 0.7098039, 0, 1, 1,
0.8036453, 0.3925178, 2.106589, 0.7176471, 0, 1, 1,
0.8053524, 0.9831748, -1.173962, 0.7215686, 0, 1, 1,
0.8061389, 0.8510635, 0.4523354, 0.7294118, 0, 1, 1,
0.8126471, -2.236586, 3.217179, 0.7333333, 0, 1, 1,
0.813256, 0.5010071, 0.8723511, 0.7411765, 0, 1, 1,
0.8214223, 0.6132461, -0.8759563, 0.7450981, 0, 1, 1,
0.8215352, 1.367338, -0.1023817, 0.7529412, 0, 1, 1,
0.8249742, -2.072086, 3.771495, 0.7568628, 0, 1, 1,
0.8274243, -0.1656911, -0.5467471, 0.7647059, 0, 1, 1,
0.8279531, -0.1290714, 1.103304, 0.7686275, 0, 1, 1,
0.8306591, -0.1111478, 1.737516, 0.7764706, 0, 1, 1,
0.8309502, 0.9223039, 0.7211363, 0.7803922, 0, 1, 1,
0.8335942, 0.8922195, 0.3731871, 0.7882353, 0, 1, 1,
0.8437253, -0.1359715, 1.718255, 0.7921569, 0, 1, 1,
0.8441327, -0.2840837, 1.97829, 0.8, 0, 1, 1,
0.84742, 0.8031393, 0.007940782, 0.8078431, 0, 1, 1,
0.8513135, 0.4689104, -0.1214354, 0.8117647, 0, 1, 1,
0.8651071, 0.3219802, 1.141359, 0.8196079, 0, 1, 1,
0.8679443, -0.2763008, 1.71968, 0.8235294, 0, 1, 1,
0.8680978, -0.5171046, 2.192806, 0.8313726, 0, 1, 1,
0.8681093, -0.262901, 1.250054, 0.8352941, 0, 1, 1,
0.8681833, -0.7212597, 2.991533, 0.8431373, 0, 1, 1,
0.8760401, -0.7472295, 2.479389, 0.8470588, 0, 1, 1,
0.8813049, 0.09792966, 0.3921503, 0.854902, 0, 1, 1,
0.8848463, 1.093801, 2.774814, 0.8588235, 0, 1, 1,
0.8886502, 0.1608921, -0.5653989, 0.8666667, 0, 1, 1,
0.8908788, -0.4682086, 2.567873, 0.8705882, 0, 1, 1,
0.893584, 0.3964335, -0.1023673, 0.8784314, 0, 1, 1,
0.8990123, 0.7707348, 2.066407, 0.8823529, 0, 1, 1,
0.9012387, 0.2093281, 2.285232, 0.8901961, 0, 1, 1,
0.9019213, 1.575586, 1.980649, 0.8941177, 0, 1, 1,
0.9098057, -0.3793286, 1.877409, 0.9019608, 0, 1, 1,
0.9141151, 0.1265046, 0.936862, 0.9098039, 0, 1, 1,
0.9147174, -1.187979, 1.481704, 0.9137255, 0, 1, 1,
0.9193636, -0.4520955, 2.557814, 0.9215686, 0, 1, 1,
0.9199981, 0.9310687, -0.1507822, 0.9254902, 0, 1, 1,
0.9234977, 0.9372848, 1.936421, 0.9333333, 0, 1, 1,
0.924153, 0.4061814, 2.781807, 0.9372549, 0, 1, 1,
0.9245148, 0.8672172, 1.955433, 0.945098, 0, 1, 1,
0.9309919, 1.043923, -1.922695, 0.9490196, 0, 1, 1,
0.9327157, -0.9433102, 1.831715, 0.9568627, 0, 1, 1,
0.9335676, 0.1242973, 3.873225, 0.9607843, 0, 1, 1,
0.9367455, -0.7347367, 1.040482, 0.9686275, 0, 1, 1,
0.9464114, -0.3745637, 0.8062202, 0.972549, 0, 1, 1,
0.9478558, 1.056525, 1.677955, 0.9803922, 0, 1, 1,
0.9512643, -1.065557, -0.2454388, 0.9843137, 0, 1, 1,
0.9540204, -2.075733, 4.379444, 0.9921569, 0, 1, 1,
0.963663, 1.506596, 2.727127, 0.9960784, 0, 1, 1,
0.963808, 0.7021945, 1.325729, 1, 0, 0.9960784, 1,
0.9679536, -0.02541426, 0.4234633, 1, 0, 0.9882353, 1,
0.9693662, -0.1147114, 2.914129, 1, 0, 0.9843137, 1,
0.9784371, -0.6744213, 2.151707, 1, 0, 0.9764706, 1,
0.983565, 0.2833196, -0.5933892, 1, 0, 0.972549, 1,
0.9845845, 0.324876, -0.3560123, 1, 0, 0.9647059, 1,
0.992559, -1.052717, 3.837599, 1, 0, 0.9607843, 1,
0.9931881, -0.2261737, 2.385734, 1, 0, 0.9529412, 1,
1.001325, -0.6014789, 0.3665831, 1, 0, 0.9490196, 1,
1.006805, 0.1560826, 1.683651, 1, 0, 0.9411765, 1,
1.011192, 0.09006774, 2.143387, 1, 0, 0.9372549, 1,
1.016537, -0.7842112, 1.697416, 1, 0, 0.9294118, 1,
1.017089, -0.3300809, 1.519583, 1, 0, 0.9254902, 1,
1.023362, -0.8659724, 1.889171, 1, 0, 0.9176471, 1,
1.033568, 0.3681963, -0.8460804, 1, 0, 0.9137255, 1,
1.038154, 0.6623585, 1.483124, 1, 0, 0.9058824, 1,
1.044531, 1.183036, -0.9588013, 1, 0, 0.9019608, 1,
1.044956, 0.8514949, 0.8011848, 1, 0, 0.8941177, 1,
1.053228, -0.4851113, 2.054462, 1, 0, 0.8862745, 1,
1.071398, -1.170571, 1.543489, 1, 0, 0.8823529, 1,
1.072168, 0.1743624, 2.196236, 1, 0, 0.8745098, 1,
1.073862, 0.3438887, 3.096098, 1, 0, 0.8705882, 1,
1.075612, -2.424491, 1.605943, 1, 0, 0.8627451, 1,
1.077068, 0.185543, 2.344337, 1, 0, 0.8588235, 1,
1.077389, -1.083549, 3.370152, 1, 0, 0.8509804, 1,
1.077653, -1.711253, 3.3223, 1, 0, 0.8470588, 1,
1.081324, 1.573595, 1.830968, 1, 0, 0.8392157, 1,
1.086673, 0.5218908, 2.427461, 1, 0, 0.8352941, 1,
1.087583, 1.205901, -0.2955748, 1, 0, 0.827451, 1,
1.094219, 0.8211721, -0.05583306, 1, 0, 0.8235294, 1,
1.097311, 1.404172, 0.601165, 1, 0, 0.8156863, 1,
1.104388, 0.2328269, 2.983695, 1, 0, 0.8117647, 1,
1.109852, 1.246612, 1.445604, 1, 0, 0.8039216, 1,
1.113175, -0.9673319, 2.541768, 1, 0, 0.7960784, 1,
1.115323, -0.9646187, -0.0236381, 1, 0, 0.7921569, 1,
1.125746, -0.4025238, 1.846336, 1, 0, 0.7843137, 1,
1.129641, -0.2985555, 2.618087, 1, 0, 0.7803922, 1,
1.133399, -0.7073423, 1.341019, 1, 0, 0.772549, 1,
1.139166, -1.013981, 2.541454, 1, 0, 0.7686275, 1,
1.142752, -0.07648627, 2.953032, 1, 0, 0.7607843, 1,
1.143128, -0.06593663, 0.2887209, 1, 0, 0.7568628, 1,
1.14397, -1.460791, 0.06525245, 1, 0, 0.7490196, 1,
1.146001, -0.586427, 2.527798, 1, 0, 0.7450981, 1,
1.149184, -0.1401309, 0.7270859, 1, 0, 0.7372549, 1,
1.158519, 1.489723, 1.140725, 1, 0, 0.7333333, 1,
1.159219, 0.5728514, 0.9905006, 1, 0, 0.7254902, 1,
1.160954, -0.6183408, 1.009946, 1, 0, 0.7215686, 1,
1.165226, 0.2776994, 0.4596429, 1, 0, 0.7137255, 1,
1.167044, 2.093224, 0.7788692, 1, 0, 0.7098039, 1,
1.168084, -0.1064736, 1.145648, 1, 0, 0.7019608, 1,
1.170785, 0.3514955, 0.9271878, 1, 0, 0.6941177, 1,
1.176044, -2.098983, 1.545296, 1, 0, 0.6901961, 1,
1.179198, 1.501253, 1.026489, 1, 0, 0.682353, 1,
1.183667, -1.572248, 2.766101, 1, 0, 0.6784314, 1,
1.189555, -0.6174259, 1.135401, 1, 0, 0.6705883, 1,
1.192354, -0.6273807, 1.753651, 1, 0, 0.6666667, 1,
1.194586, 0.552344, 0.4277702, 1, 0, 0.6588235, 1,
1.207543, 0.004624556, 1.852976, 1, 0, 0.654902, 1,
1.208477, -0.4924808, 1.109528, 1, 0, 0.6470588, 1,
1.219691, -2.074706, 2.854537, 1, 0, 0.6431373, 1,
1.227882, 0.2618324, 1.132495, 1, 0, 0.6352941, 1,
1.238328, 0.8893244, 1.155247, 1, 0, 0.6313726, 1,
1.246457, -1.744289, 1.809415, 1, 0, 0.6235294, 1,
1.249949, 2.042415, 0.3356587, 1, 0, 0.6196079, 1,
1.250586, -1.404423, 3.893527, 1, 0, 0.6117647, 1,
1.254652, -0.6955616, 1.097989, 1, 0, 0.6078432, 1,
1.261417, 0.269507, 1.116711, 1, 0, 0.6, 1,
1.267456, -0.1020736, 1.425285, 1, 0, 0.5921569, 1,
1.270357, -0.5870073, 2.544121, 1, 0, 0.5882353, 1,
1.276861, -1.472651, 2.537181, 1, 0, 0.5803922, 1,
1.281138, 0.7513176, 1.936539, 1, 0, 0.5764706, 1,
1.283298, 0.7284719, -0.2225551, 1, 0, 0.5686275, 1,
1.286461, 1.438499, 1.017506, 1, 0, 0.5647059, 1,
1.296933, -0.7720115, 2.2962, 1, 0, 0.5568628, 1,
1.303416, -0.2183286, 1.41546, 1, 0, 0.5529412, 1,
1.307451, 0.07827372, 0.9187714, 1, 0, 0.5450981, 1,
1.312776, -1.050957, 1.832038, 1, 0, 0.5411765, 1,
1.316362, 0.07780097, 1.497006, 1, 0, 0.5333334, 1,
1.316955, -1.486477, 2.85975, 1, 0, 0.5294118, 1,
1.317314, 1.430176, 1.151863, 1, 0, 0.5215687, 1,
1.324486, 0.7028941, -1.500272, 1, 0, 0.5176471, 1,
1.32971, 1.20656, 1.148074, 1, 0, 0.509804, 1,
1.332633, -0.04500287, 0.004042197, 1, 0, 0.5058824, 1,
1.333156, -0.377791, 2.435097, 1, 0, 0.4980392, 1,
1.334544, 0.4219407, 0.6868339, 1, 0, 0.4901961, 1,
1.365267, -0.1055353, 1.44709, 1, 0, 0.4862745, 1,
1.367787, -0.6516907, 4.168822, 1, 0, 0.4784314, 1,
1.390302, 0.6226841, 0.2929015, 1, 0, 0.4745098, 1,
1.392867, -0.6656265, 3.606836, 1, 0, 0.4666667, 1,
1.40305, 0.2255062, 0.3074085, 1, 0, 0.4627451, 1,
1.40827, 1.145189, 1.66443, 1, 0, 0.454902, 1,
1.408332, -1.267802, 3.852823, 1, 0, 0.4509804, 1,
1.410274, 1.273607, 0.4447792, 1, 0, 0.4431373, 1,
1.415298, 0.7681579, 2.484341, 1, 0, 0.4392157, 1,
1.42205, 0.6595167, 2.96098, 1, 0, 0.4313726, 1,
1.439888, 2.831518, -0.3006071, 1, 0, 0.427451, 1,
1.445648, -2.141738, 1.858187, 1, 0, 0.4196078, 1,
1.445712, 0.4489406, 2.422045, 1, 0, 0.4156863, 1,
1.44761, 1.578958, -0.08453041, 1, 0, 0.4078431, 1,
1.448661, 0.285596, 0.8976749, 1, 0, 0.4039216, 1,
1.460757, -0.3960711, 3.260692, 1, 0, 0.3960784, 1,
1.463163, 0.1826377, 2.716095, 1, 0, 0.3882353, 1,
1.463644, -0.6004494, 0.9091461, 1, 0, 0.3843137, 1,
1.473107, -0.1990773, 1.136882, 1, 0, 0.3764706, 1,
1.479713, -0.008179149, 0.3370549, 1, 0, 0.372549, 1,
1.484799, -0.06975929, 2.708013, 1, 0, 0.3647059, 1,
1.490284, -0.118485, 2.134254, 1, 0, 0.3607843, 1,
1.501987, -1.408383, 2.195922, 1, 0, 0.3529412, 1,
1.502802, -1.373446, 2.961553, 1, 0, 0.3490196, 1,
1.506276, 0.4576229, 1.462197, 1, 0, 0.3411765, 1,
1.511999, -1.004088, 0.5375428, 1, 0, 0.3372549, 1,
1.521886, -0.2025018, 2.896648, 1, 0, 0.3294118, 1,
1.527504, 0.510357, 0.3465919, 1, 0, 0.3254902, 1,
1.543816, -0.06162458, 2.481584, 1, 0, 0.3176471, 1,
1.548759, -0.008007623, 2.693369, 1, 0, 0.3137255, 1,
1.553273, 0.374604, 1.471218, 1, 0, 0.3058824, 1,
1.575836, 1.202877, 1.366681, 1, 0, 0.2980392, 1,
1.58636, 0.1202128, 1.601231, 1, 0, 0.2941177, 1,
1.600332, -0.8458578, 3.188891, 1, 0, 0.2862745, 1,
1.606122, -0.9317509, 3.528728, 1, 0, 0.282353, 1,
1.606917, -0.3202941, 2.702087, 1, 0, 0.2745098, 1,
1.607028, -0.1161634, 2.420699, 1, 0, 0.2705882, 1,
1.60933, -0.4699033, 2.146172, 1, 0, 0.2627451, 1,
1.621182, 1.315688, -0.459682, 1, 0, 0.2588235, 1,
1.621645, 0.2969305, -0.1630514, 1, 0, 0.2509804, 1,
1.63504, 0.5578537, 1.671834, 1, 0, 0.2470588, 1,
1.645066, 1.462042, -0.6642157, 1, 0, 0.2392157, 1,
1.65391, 0.05768582, 2.367446, 1, 0, 0.2352941, 1,
1.67753, 0.01759269, 0.6872087, 1, 0, 0.227451, 1,
1.710527, 0.3042482, 2.083588, 1, 0, 0.2235294, 1,
1.741733, -0.2817121, 3.578328, 1, 0, 0.2156863, 1,
1.744172, -1.97479, 3.000223, 1, 0, 0.2117647, 1,
1.746653, -0.8722253, 0.3947143, 1, 0, 0.2039216, 1,
1.748695, 0.2915642, 1.78397, 1, 0, 0.1960784, 1,
1.788416, -1.513706, 2.018353, 1, 0, 0.1921569, 1,
1.797023, -0.9218471, -1.076313, 1, 0, 0.1843137, 1,
1.809757, -0.4095756, 2.935581, 1, 0, 0.1803922, 1,
1.813451, -0.2816893, 3.40846, 1, 0, 0.172549, 1,
1.818542, -0.2343592, 1.792189, 1, 0, 0.1686275, 1,
1.82122, -1.436239, 4.097097, 1, 0, 0.1607843, 1,
1.823015, 0.1992923, 1.206424, 1, 0, 0.1568628, 1,
1.871134, -1.196557, 2.949362, 1, 0, 0.1490196, 1,
1.903983, 0.4703499, 1.133168, 1, 0, 0.145098, 1,
1.90939, -0.2756951, 1.496975, 1, 0, 0.1372549, 1,
1.917501, -0.3059483, 2.498162, 1, 0, 0.1333333, 1,
1.927945, 0.5364075, 2.194388, 1, 0, 0.1254902, 1,
2.058028, -0.499923, 2.718353, 1, 0, 0.1215686, 1,
2.082482, 1.676915, 1.52211, 1, 0, 0.1137255, 1,
2.114471, 0.7704065, 1.235478, 1, 0, 0.1098039, 1,
2.14383, 1.335465, 0.3274448, 1, 0, 0.1019608, 1,
2.175052, 0.132501, 1.145765, 1, 0, 0.09411765, 1,
2.187778, -0.8134889, 2.472011, 1, 0, 0.09019608, 1,
2.212597, 0.87441, 2.837782, 1, 0, 0.08235294, 1,
2.223261, 0.5482695, 2.132601, 1, 0, 0.07843138, 1,
2.234167, -0.4285578, 1.898302, 1, 0, 0.07058824, 1,
2.285235, -1.349942, 1.876495, 1, 0, 0.06666667, 1,
2.317965, 0.9431094, 2.364696, 1, 0, 0.05882353, 1,
2.368603, 0.2784567, -0.1445645, 1, 0, 0.05490196, 1,
2.420078, -0.6222116, 1.937538, 1, 0, 0.04705882, 1,
2.45773, -1.485866, 3.444789, 1, 0, 0.04313726, 1,
2.589346, 0.5609816, 0.629764, 1, 0, 0.03529412, 1,
2.658083, -1.259677, 1.949219, 1, 0, 0.03137255, 1,
2.683771, -0.09620631, 1.033931, 1, 0, 0.02352941, 1,
2.805818, -1.307998, 2.789875, 1, 0, 0.01960784, 1,
2.957476, 0.4437616, 1.732573, 1, 0, 0.01176471, 1,
3.13133, -1.223758, 2.060199, 1, 0, 0.007843138, 1
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
-0.1152781, -4.650529, -7.228409, 0, -0.5, 0.5, 0.5,
-0.1152781, -4.650529, -7.228409, 1, -0.5, 0.5, 0.5,
-0.1152781, -4.650529, -7.228409, 1, 1.5, 0.5, 0.5,
-0.1152781, -4.650529, -7.228409, 0, 1.5, 0.5, 0.5
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
-4.462486, -0.3673049, -7.228409, 0, -0.5, 0.5, 0.5,
-4.462486, -0.3673049, -7.228409, 1, -0.5, 0.5, 0.5,
-4.462486, -0.3673049, -7.228409, 1, 1.5, 0.5, 0.5,
-4.462486, -0.3673049, -7.228409, 0, 1.5, 0.5, 0.5
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
-4.462486, -4.650529, -0.286484, 0, -0.5, 0.5, 0.5,
-4.462486, -4.650529, -0.286484, 1, -0.5, 0.5, 0.5,
-4.462486, -4.650529, -0.286484, 1, 1.5, 0.5, 0.5,
-4.462486, -4.650529, -0.286484, 0, 1.5, 0.5, 0.5
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
-3, -3.662093, -5.626427,
3, -3.662093, -5.626427,
-3, -3.662093, -5.626427,
-3, -3.826832, -5.893424,
-2, -3.662093, -5.626427,
-2, -3.826832, -5.893424,
-1, -3.662093, -5.626427,
-1, -3.826832, -5.893424,
0, -3.662093, -5.626427,
0, -3.826832, -5.893424,
1, -3.662093, -5.626427,
1, -3.826832, -5.893424,
2, -3.662093, -5.626427,
2, -3.826832, -5.893424,
3, -3.662093, -5.626427,
3, -3.826832, -5.893424
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
-3, -4.156311, -6.427418, 0, -0.5, 0.5, 0.5,
-3, -4.156311, -6.427418, 1, -0.5, 0.5, 0.5,
-3, -4.156311, -6.427418, 1, 1.5, 0.5, 0.5,
-3, -4.156311, -6.427418, 0, 1.5, 0.5, 0.5,
-2, -4.156311, -6.427418, 0, -0.5, 0.5, 0.5,
-2, -4.156311, -6.427418, 1, -0.5, 0.5, 0.5,
-2, -4.156311, -6.427418, 1, 1.5, 0.5, 0.5,
-2, -4.156311, -6.427418, 0, 1.5, 0.5, 0.5,
-1, -4.156311, -6.427418, 0, -0.5, 0.5, 0.5,
-1, -4.156311, -6.427418, 1, -0.5, 0.5, 0.5,
-1, -4.156311, -6.427418, 1, 1.5, 0.5, 0.5,
-1, -4.156311, -6.427418, 0, 1.5, 0.5, 0.5,
0, -4.156311, -6.427418, 0, -0.5, 0.5, 0.5,
0, -4.156311, -6.427418, 1, -0.5, 0.5, 0.5,
0, -4.156311, -6.427418, 1, 1.5, 0.5, 0.5,
0, -4.156311, -6.427418, 0, 1.5, 0.5, 0.5,
1, -4.156311, -6.427418, 0, -0.5, 0.5, 0.5,
1, -4.156311, -6.427418, 1, -0.5, 0.5, 0.5,
1, -4.156311, -6.427418, 1, 1.5, 0.5, 0.5,
1, -4.156311, -6.427418, 0, 1.5, 0.5, 0.5,
2, -4.156311, -6.427418, 0, -0.5, 0.5, 0.5,
2, -4.156311, -6.427418, 1, -0.5, 0.5, 0.5,
2, -4.156311, -6.427418, 1, 1.5, 0.5, 0.5,
2, -4.156311, -6.427418, 0, 1.5, 0.5, 0.5,
3, -4.156311, -6.427418, 0, -0.5, 0.5, 0.5,
3, -4.156311, -6.427418, 1, -0.5, 0.5, 0.5,
3, -4.156311, -6.427418, 1, 1.5, 0.5, 0.5,
3, -4.156311, -6.427418, 0, 1.5, 0.5, 0.5
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
-3.459284, -3, -5.626427,
-3.459284, 2, -5.626427,
-3.459284, -3, -5.626427,
-3.626484, -3, -5.893424,
-3.459284, -2, -5.626427,
-3.626484, -2, -5.893424,
-3.459284, -1, -5.626427,
-3.626484, -1, -5.893424,
-3.459284, 0, -5.626427,
-3.626484, 0, -5.893424,
-3.459284, 1, -5.626427,
-3.626484, 1, -5.893424,
-3.459284, 2, -5.626427,
-3.626484, 2, -5.893424
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
-3.960885, -3, -6.427418, 0, -0.5, 0.5, 0.5,
-3.960885, -3, -6.427418, 1, -0.5, 0.5, 0.5,
-3.960885, -3, -6.427418, 1, 1.5, 0.5, 0.5,
-3.960885, -3, -6.427418, 0, 1.5, 0.5, 0.5,
-3.960885, -2, -6.427418, 0, -0.5, 0.5, 0.5,
-3.960885, -2, -6.427418, 1, -0.5, 0.5, 0.5,
-3.960885, -2, -6.427418, 1, 1.5, 0.5, 0.5,
-3.960885, -2, -6.427418, 0, 1.5, 0.5, 0.5,
-3.960885, -1, -6.427418, 0, -0.5, 0.5, 0.5,
-3.960885, -1, -6.427418, 1, -0.5, 0.5, 0.5,
-3.960885, -1, -6.427418, 1, 1.5, 0.5, 0.5,
-3.960885, -1, -6.427418, 0, 1.5, 0.5, 0.5,
-3.960885, 0, -6.427418, 0, -0.5, 0.5, 0.5,
-3.960885, 0, -6.427418, 1, -0.5, 0.5, 0.5,
-3.960885, 0, -6.427418, 1, 1.5, 0.5, 0.5,
-3.960885, 0, -6.427418, 0, 1.5, 0.5, 0.5,
-3.960885, 1, -6.427418, 0, -0.5, 0.5, 0.5,
-3.960885, 1, -6.427418, 1, -0.5, 0.5, 0.5,
-3.960885, 1, -6.427418, 1, 1.5, 0.5, 0.5,
-3.960885, 1, -6.427418, 0, 1.5, 0.5, 0.5,
-3.960885, 2, -6.427418, 0, -0.5, 0.5, 0.5,
-3.960885, 2, -6.427418, 1, -0.5, 0.5, 0.5,
-3.960885, 2, -6.427418, 1, 1.5, 0.5, 0.5,
-3.960885, 2, -6.427418, 0, 1.5, 0.5, 0.5
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
-3.459284, -3.662093, -4,
-3.459284, -3.662093, 4,
-3.459284, -3.662093, -4,
-3.626484, -3.826832, -4,
-3.459284, -3.662093, -2,
-3.626484, -3.826832, -2,
-3.459284, -3.662093, 0,
-3.626484, -3.826832, 0,
-3.459284, -3.662093, 2,
-3.626484, -3.826832, 2,
-3.459284, -3.662093, 4,
-3.626484, -3.826832, 4
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
-3.960885, -4.156311, -4, 0, -0.5, 0.5, 0.5,
-3.960885, -4.156311, -4, 1, -0.5, 0.5, 0.5,
-3.960885, -4.156311, -4, 1, 1.5, 0.5, 0.5,
-3.960885, -4.156311, -4, 0, 1.5, 0.5, 0.5,
-3.960885, -4.156311, -2, 0, -0.5, 0.5, 0.5,
-3.960885, -4.156311, -2, 1, -0.5, 0.5, 0.5,
-3.960885, -4.156311, -2, 1, 1.5, 0.5, 0.5,
-3.960885, -4.156311, -2, 0, 1.5, 0.5, 0.5,
-3.960885, -4.156311, 0, 0, -0.5, 0.5, 0.5,
-3.960885, -4.156311, 0, 1, -0.5, 0.5, 0.5,
-3.960885, -4.156311, 0, 1, 1.5, 0.5, 0.5,
-3.960885, -4.156311, 0, 0, 1.5, 0.5, 0.5,
-3.960885, -4.156311, 2, 0, -0.5, 0.5, 0.5,
-3.960885, -4.156311, 2, 1, -0.5, 0.5, 0.5,
-3.960885, -4.156311, 2, 1, 1.5, 0.5, 0.5,
-3.960885, -4.156311, 2, 0, 1.5, 0.5, 0.5,
-3.960885, -4.156311, 4, 0, -0.5, 0.5, 0.5,
-3.960885, -4.156311, 4, 1, -0.5, 0.5, 0.5,
-3.960885, -4.156311, 4, 1, 1.5, 0.5, 0.5,
-3.960885, -4.156311, 4, 0, 1.5, 0.5, 0.5
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
-3.459284, -3.662093, -5.626427,
-3.459284, 2.927483, -5.626427,
-3.459284, -3.662093, 5.053459,
-3.459284, 2.927483, 5.053459,
-3.459284, -3.662093, -5.626427,
-3.459284, -3.662093, 5.053459,
-3.459284, 2.927483, -5.626427,
-3.459284, 2.927483, 5.053459,
-3.459284, -3.662093, -5.626427,
3.228728, -3.662093, -5.626427,
-3.459284, -3.662093, 5.053459,
3.228728, -3.662093, 5.053459,
-3.459284, 2.927483, -5.626427,
3.228728, 2.927483, -5.626427,
-3.459284, 2.927483, 5.053459,
3.228728, 2.927483, 5.053459,
3.228728, -3.662093, -5.626427,
3.228728, 2.927483, -5.626427,
3.228728, -3.662093, 5.053459,
3.228728, 2.927483, 5.053459,
3.228728, -3.662093, -5.626427,
3.228728, -3.662093, 5.053459,
3.228728, 2.927483, -5.626427,
3.228728, 2.927483, 5.053459
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
var radius = 7.593271;
var distance = 33.78332;
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
mvMatrix.translate( 0.1152781, 0.3673049, 0.286484 );
mvMatrix.scale( 1.227569, 1.245906, 0.7687342 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.78332);
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

