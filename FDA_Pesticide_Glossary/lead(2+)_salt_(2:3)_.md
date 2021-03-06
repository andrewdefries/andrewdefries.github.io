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
-3.003777, -0.8728712, -0.8632247, 1, 0, 0, 1,
-2.767773, 0.2426223, -1.336077, 1, 0.007843138, 0, 1,
-2.729931, 0.1711006, 1.02666, 1, 0.01176471, 0, 1,
-2.657607, -0.8051574, -1.499936, 1, 0.01960784, 0, 1,
-2.603771, 0.1557136, -1.039921, 1, 0.02352941, 0, 1,
-2.582865, -0.2807263, -0.8271143, 1, 0.03137255, 0, 1,
-2.445966, -0.6297309, -1.744137, 1, 0.03529412, 0, 1,
-2.358312, 1.190843, -1.209324, 1, 0.04313726, 0, 1,
-2.356999, -0.445973, -2.383236, 1, 0.04705882, 0, 1,
-2.321593, -0.3473774, -3.771733, 1, 0.05490196, 0, 1,
-2.307074, 0.9226399, -1.861369, 1, 0.05882353, 0, 1,
-2.229246, 0.4900405, -2.179272, 1, 0.06666667, 0, 1,
-2.223849, 2.013016, 0.8334991, 1, 0.07058824, 0, 1,
-2.186266, 0.06381307, -2.31566, 1, 0.07843138, 0, 1,
-2.185335, -1.394324, -2.504713, 1, 0.08235294, 0, 1,
-2.154235, -1.309563, -1.816728, 1, 0.09019608, 0, 1,
-2.119307, -1.220181, -2.163259, 1, 0.09411765, 0, 1,
-2.098146, -0.9995263, -1.993633, 1, 0.1019608, 0, 1,
-2.088774, 0.9478804, -1.748201, 1, 0.1098039, 0, 1,
-2.043915, 0.9150764, -1.574864, 1, 0.1137255, 0, 1,
-1.988743, 1.625013, -0.4053966, 1, 0.1215686, 0, 1,
-1.987631, 0.4791536, -3.22095, 1, 0.1254902, 0, 1,
-1.961918, 2.422245, -0.4430648, 1, 0.1333333, 0, 1,
-1.960113, 0.2008068, -1.916198, 1, 0.1372549, 0, 1,
-1.930883, 0.115572, -0.7117023, 1, 0.145098, 0, 1,
-1.930689, 0.2080065, -1.993699, 1, 0.1490196, 0, 1,
-1.929239, 0.3685577, -1.240256, 1, 0.1568628, 0, 1,
-1.889983, 1.871904, -0.02978906, 1, 0.1607843, 0, 1,
-1.882212, 0.5920777, -1.971832, 1, 0.1686275, 0, 1,
-1.865607, 0.7986297, -0.08418082, 1, 0.172549, 0, 1,
-1.837385, -0.1454156, -1.980566, 1, 0.1803922, 0, 1,
-1.832297, 1.309542, -1.452352, 1, 0.1843137, 0, 1,
-1.829884, 0.3437887, -1.172202, 1, 0.1921569, 0, 1,
-1.816945, 1.309473, -0.9118952, 1, 0.1960784, 0, 1,
-1.792772, 0.4764462, -1.414003, 1, 0.2039216, 0, 1,
-1.792314, 0.13932, -1.737883, 1, 0.2117647, 0, 1,
-1.774289, -1.704958, -2.512678, 1, 0.2156863, 0, 1,
-1.749523, 1.793993, 1.395997, 1, 0.2235294, 0, 1,
-1.745857, 0.8681216, -0.670662, 1, 0.227451, 0, 1,
-1.740908, 0.01722925, -1.618225, 1, 0.2352941, 0, 1,
-1.738741, -1.67163, -2.539611, 1, 0.2392157, 0, 1,
-1.691769, 0.1665804, -0.9902209, 1, 0.2470588, 0, 1,
-1.687766, -1.792691, -1.774053, 1, 0.2509804, 0, 1,
-1.681425, 0.260518, -0.7865538, 1, 0.2588235, 0, 1,
-1.677486, -0.219459, -0.6367821, 1, 0.2627451, 0, 1,
-1.674024, -0.06925365, -1.88507, 1, 0.2705882, 0, 1,
-1.673026, -1.841002, -1.877102, 1, 0.2745098, 0, 1,
-1.662114, -0.129058, -1.010979, 1, 0.282353, 0, 1,
-1.651237, -1.261685, -2.437981, 1, 0.2862745, 0, 1,
-1.631224, 0.7921526, -1.95394, 1, 0.2941177, 0, 1,
-1.624062, 0.9273514, -0.7509765, 1, 0.3019608, 0, 1,
-1.619695, -0.3017991, -3.117334, 1, 0.3058824, 0, 1,
-1.591823, -0.8620621, -1.293592, 1, 0.3137255, 0, 1,
-1.589995, -1.706311, -4.677429, 1, 0.3176471, 0, 1,
-1.586158, -0.9272824, -1.105371, 1, 0.3254902, 0, 1,
-1.577513, -0.3225593, -2.253978, 1, 0.3294118, 0, 1,
-1.574482, -0.3398145, -2.028157, 1, 0.3372549, 0, 1,
-1.573174, 1.207523, -0.9871299, 1, 0.3411765, 0, 1,
-1.550033, 0.8195244, -1.040485, 1, 0.3490196, 0, 1,
-1.549896, -0.1314665, -2.818438, 1, 0.3529412, 0, 1,
-1.538298, -0.7584509, -1.379431, 1, 0.3607843, 0, 1,
-1.525946, 1.164337, -2.648498, 1, 0.3647059, 0, 1,
-1.508239, -0.2674069, -2.261019, 1, 0.372549, 0, 1,
-1.501072, -0.01234705, -3.206543, 1, 0.3764706, 0, 1,
-1.484993, -0.5680252, -2.400307, 1, 0.3843137, 0, 1,
-1.478885, 1.117632, -0.3358263, 1, 0.3882353, 0, 1,
-1.47091, 0.4568465, -1.189487, 1, 0.3960784, 0, 1,
-1.465774, 0.07332706, -1.497845, 1, 0.4039216, 0, 1,
-1.463515, -1.433174, -2.040072, 1, 0.4078431, 0, 1,
-1.460558, 1.223615, 0.3401756, 1, 0.4156863, 0, 1,
-1.459865, -0.1694096, -2.604529, 1, 0.4196078, 0, 1,
-1.458867, -2.341897, -3.841206, 1, 0.427451, 0, 1,
-1.441576, 0.6096499, 0.9659722, 1, 0.4313726, 0, 1,
-1.42462, -0.9129409, -2.387497, 1, 0.4392157, 0, 1,
-1.4124, 0.3613462, -1.837303, 1, 0.4431373, 0, 1,
-1.405927, 0.3689547, -0.9794802, 1, 0.4509804, 0, 1,
-1.395755, -0.3085016, -1.035042, 1, 0.454902, 0, 1,
-1.389992, 0.8114306, -0.979356, 1, 0.4627451, 0, 1,
-1.381689, -2.517645, -2.871183, 1, 0.4666667, 0, 1,
-1.3806, 0.1689782, -0.8870261, 1, 0.4745098, 0, 1,
-1.374661, 0.9058792, -1.483479, 1, 0.4784314, 0, 1,
-1.372751, 0.3210268, -0.4633856, 1, 0.4862745, 0, 1,
-1.361805, 0.1540921, -1.772222, 1, 0.4901961, 0, 1,
-1.355604, -0.9598079, -3.003585, 1, 0.4980392, 0, 1,
-1.346664, 0.8674442, -1.265965, 1, 0.5058824, 0, 1,
-1.341838, -0.6339477, -2.669648, 1, 0.509804, 0, 1,
-1.332831, 1.555649, -0.5281939, 1, 0.5176471, 0, 1,
-1.331344, 0.3297953, -1.682604, 1, 0.5215687, 0, 1,
-1.317108, -0.1539539, -1.090489, 1, 0.5294118, 0, 1,
-1.3145, -0.4120243, -0.6305696, 1, 0.5333334, 0, 1,
-1.313914, -1.016139, -2.988683, 1, 0.5411765, 0, 1,
-1.31062, -1.163287, 0.3915409, 1, 0.5450981, 0, 1,
-1.309176, 0.5086744, -2.535217, 1, 0.5529412, 0, 1,
-1.308232, -0.1953321, -0.7181115, 1, 0.5568628, 0, 1,
-1.30786, 0.4821364, -3.08643, 1, 0.5647059, 0, 1,
-1.306691, -1.01225, -1.050247, 1, 0.5686275, 0, 1,
-1.303887, 0.9877247, -1.593279, 1, 0.5764706, 0, 1,
-1.301708, -0.3956542, -1.363138, 1, 0.5803922, 0, 1,
-1.29679, 1.382963, -1.237286, 1, 0.5882353, 0, 1,
-1.291079, 0.1011377, -0.24046, 1, 0.5921569, 0, 1,
-1.290525, -0.1453173, -1.869993, 1, 0.6, 0, 1,
-1.287481, 0.06578321, -1.354907, 1, 0.6078432, 0, 1,
-1.285792, 1.045449, -1.23871, 1, 0.6117647, 0, 1,
-1.284348, 0.4730811, -0.7422167, 1, 0.6196079, 0, 1,
-1.27966, 0.7068951, -0.6696765, 1, 0.6235294, 0, 1,
-1.269251, -1.577158, -2.527793, 1, 0.6313726, 0, 1,
-1.261773, 0.3306647, -2.985084, 1, 0.6352941, 0, 1,
-1.255016, 0.1245287, -2.820421, 1, 0.6431373, 0, 1,
-1.254535, -0.1450615, -1.253452, 1, 0.6470588, 0, 1,
-1.252656, -1.184455, -1.378083, 1, 0.654902, 0, 1,
-1.250379, 0.5954084, -1.293205, 1, 0.6588235, 0, 1,
-1.250332, -0.3128293, -0.9364439, 1, 0.6666667, 0, 1,
-1.24896, -1.187604, -3.273645, 1, 0.6705883, 0, 1,
-1.245356, 0.8200035, -0.6578993, 1, 0.6784314, 0, 1,
-1.244937, -0.579636, -0.498731, 1, 0.682353, 0, 1,
-1.22285, -0.3907049, -2.917099, 1, 0.6901961, 0, 1,
-1.218436, 0.3488219, -1.131998, 1, 0.6941177, 0, 1,
-1.216949, -0.5119181, -1.268607, 1, 0.7019608, 0, 1,
-1.214686, 0.06040779, -3.337492, 1, 0.7098039, 0, 1,
-1.207022, 0.5558943, 0.5895757, 1, 0.7137255, 0, 1,
-1.199604, 0.2079214, -0.9515683, 1, 0.7215686, 0, 1,
-1.194784, -0.8167525, -1.17574, 1, 0.7254902, 0, 1,
-1.186463, -0.5940073, -2.181953, 1, 0.7333333, 0, 1,
-1.182057, 0.4156447, 0.7844048, 1, 0.7372549, 0, 1,
-1.163441, 0.8476507, -0.5364497, 1, 0.7450981, 0, 1,
-1.161341, -0.5626222, -1.815905, 1, 0.7490196, 0, 1,
-1.157738, -2.853151, -4.667222, 1, 0.7568628, 0, 1,
-1.156521, 1.332938, -1.870671, 1, 0.7607843, 0, 1,
-1.156253, 0.5120382, -1.826959, 1, 0.7686275, 0, 1,
-1.154024, -0.6445805, -2.435633, 1, 0.772549, 0, 1,
-1.146035, -1.480598, -1.27808, 1, 0.7803922, 0, 1,
-1.142225, -1.520826, -2.971372, 1, 0.7843137, 0, 1,
-1.136109, -0.01928544, -1.550681, 1, 0.7921569, 0, 1,
-1.120177, 0.7121199, 1.440585, 1, 0.7960784, 0, 1,
-1.11292, -0.9006393, -2.140218, 1, 0.8039216, 0, 1,
-1.111021, -0.7379257, -2.934527, 1, 0.8117647, 0, 1,
-1.110223, 0.2765825, -1.711332, 1, 0.8156863, 0, 1,
-1.108662, -0.2115204, -1.695279, 1, 0.8235294, 0, 1,
-1.097891, 0.3190046, -0.9947262, 1, 0.827451, 0, 1,
-1.086722, -1.215481, -2.672254, 1, 0.8352941, 0, 1,
-1.082162, -0.7216464, -3.380143, 1, 0.8392157, 0, 1,
-1.079383, 0.7943386, -1.581053, 1, 0.8470588, 0, 1,
-1.074748, -1.257693, -2.203408, 1, 0.8509804, 0, 1,
-1.071859, 0.2828186, -1.806949, 1, 0.8588235, 0, 1,
-1.070035, 1.721753, -0.06190677, 1, 0.8627451, 0, 1,
-1.065069, 0.1746895, -0.6884333, 1, 0.8705882, 0, 1,
-1.064934, 1.374299, -1.572776, 1, 0.8745098, 0, 1,
-1.058589, -1.402846, -1.606759, 1, 0.8823529, 0, 1,
-1.054814, -0.172227, -0.9729056, 1, 0.8862745, 0, 1,
-1.051576, -0.2261311, -1.760454, 1, 0.8941177, 0, 1,
-1.051317, 0.6261719, -2.630682, 1, 0.8980392, 0, 1,
-1.048323, 2.031164, -0.3962565, 1, 0.9058824, 0, 1,
-1.038664, 0.1151286, -2.927863, 1, 0.9137255, 0, 1,
-1.034217, -1.230885, -0.5847695, 1, 0.9176471, 0, 1,
-1.033194, -1.134985, -3.165573, 1, 0.9254902, 0, 1,
-1.027582, -1.156766, -1.965435, 1, 0.9294118, 0, 1,
-1.020905, -0.7156326, -2.018839, 1, 0.9372549, 0, 1,
-1.001797, -1.015222, -1.432616, 1, 0.9411765, 0, 1,
-1.001639, 0.1115893, -2.87175, 1, 0.9490196, 0, 1,
-0.9976235, -0.7522056, -2.225718, 1, 0.9529412, 0, 1,
-0.9968248, 0.2318803, -1.233914, 1, 0.9607843, 0, 1,
-0.9965397, -1.017012, -2.109484, 1, 0.9647059, 0, 1,
-0.9915351, -0.9820118, -2.518521, 1, 0.972549, 0, 1,
-0.9906167, -1.949891, -2.597348, 1, 0.9764706, 0, 1,
-0.9848499, -1.205988, -2.377215, 1, 0.9843137, 0, 1,
-0.9847438, 0.7156796, -0.1500331, 1, 0.9882353, 0, 1,
-0.9772702, -1.623166, -2.05156, 1, 0.9960784, 0, 1,
-0.9703365, -1.878474, -1.179363, 0.9960784, 1, 0, 1,
-0.9683977, -1.148249, -0.7296677, 0.9921569, 1, 0, 1,
-0.9660113, 0.5043684, 0.1351794, 0.9843137, 1, 0, 1,
-0.9615433, -0.6834907, -1.64088, 0.9803922, 1, 0, 1,
-0.9609159, -0.2970308, -1.524212, 0.972549, 1, 0, 1,
-0.9586879, 1.646625, -0.9403542, 0.9686275, 1, 0, 1,
-0.958165, 2.22109, -1.093606, 0.9607843, 1, 0, 1,
-0.9484168, -0.577401, -1.741549, 0.9568627, 1, 0, 1,
-0.9391704, 0.602555, -1.525281, 0.9490196, 1, 0, 1,
-0.9371893, -0.9371457, -3.081304, 0.945098, 1, 0, 1,
-0.9336289, -1.149122, -1.625517, 0.9372549, 1, 0, 1,
-0.9324155, 1.064897, -1.868089, 0.9333333, 1, 0, 1,
-0.9291254, 0.3692917, -3.800868, 0.9254902, 1, 0, 1,
-0.9225419, -0.3681516, -1.229303, 0.9215686, 1, 0, 1,
-0.9211425, -1.114355, -4.026607, 0.9137255, 1, 0, 1,
-0.9199339, -0.8007566, -2.783005, 0.9098039, 1, 0, 1,
-0.9177462, 1.617556, 1.490027, 0.9019608, 1, 0, 1,
-0.9143612, -0.4158573, -2.764001, 0.8941177, 1, 0, 1,
-0.9090361, -0.1336206, -1.170461, 0.8901961, 1, 0, 1,
-0.9049042, -0.2227366, -2.326632, 0.8823529, 1, 0, 1,
-0.8943967, -0.2814174, -1.121965, 0.8784314, 1, 0, 1,
-0.8914956, 0.676683, -2.273366, 0.8705882, 1, 0, 1,
-0.8862574, -0.3304764, -2.299492, 0.8666667, 1, 0, 1,
-0.8848718, 0.4806484, -1.184013, 0.8588235, 1, 0, 1,
-0.8835167, -1.542019, -2.420666, 0.854902, 1, 0, 1,
-0.8779796, 0.5446205, -1.195882, 0.8470588, 1, 0, 1,
-0.8765919, 0.2453936, -2.369673, 0.8431373, 1, 0, 1,
-0.8763239, -0.7620385, -3.28189, 0.8352941, 1, 0, 1,
-0.8755248, 1.060451, 1.302538, 0.8313726, 1, 0, 1,
-0.873095, -0.4547071, -1.994734, 0.8235294, 1, 0, 1,
-0.8626732, -0.7532953, -1.146412, 0.8196079, 1, 0, 1,
-0.8575564, -0.3870784, -3.487543, 0.8117647, 1, 0, 1,
-0.8508012, -0.965782, -0.6731895, 0.8078431, 1, 0, 1,
-0.8502706, 3.064111, -1.171245, 0.8, 1, 0, 1,
-0.8488575, 1.865741, -0.6356033, 0.7921569, 1, 0, 1,
-0.8477412, 0.1010889, -1.002776, 0.7882353, 1, 0, 1,
-0.8468227, 1.580455, 0.3142449, 0.7803922, 1, 0, 1,
-0.8465608, 0.2038726, -1.886873, 0.7764706, 1, 0, 1,
-0.8457294, -0.7719232, -1.338565, 0.7686275, 1, 0, 1,
-0.8352861, 0.4256617, -0.7467012, 0.7647059, 1, 0, 1,
-0.8345074, -0.5052722, -3.335656, 0.7568628, 1, 0, 1,
-0.8320904, -0.6879779, -3.367087, 0.7529412, 1, 0, 1,
-0.8294885, -0.1330447, -2.142391, 0.7450981, 1, 0, 1,
-0.828131, 0.7873105, -0.2522464, 0.7411765, 1, 0, 1,
-0.8255149, 0.4012609, -1.851062, 0.7333333, 1, 0, 1,
-0.8254516, -1.468093, -3.033844, 0.7294118, 1, 0, 1,
-0.8240668, 0.7844355, -0.5178269, 0.7215686, 1, 0, 1,
-0.8193423, 0.02383095, -0.6330543, 0.7176471, 1, 0, 1,
-0.8189465, 0.7540932, -0.5011918, 0.7098039, 1, 0, 1,
-0.8181725, 0.8863772, -1.065898, 0.7058824, 1, 0, 1,
-0.811321, -0.5200571, -1.611089, 0.6980392, 1, 0, 1,
-0.8077986, 1.000741, -1.228355, 0.6901961, 1, 0, 1,
-0.8011196, 0.3625176, 0.7633173, 0.6862745, 1, 0, 1,
-0.7993161, 1.868578, 1.295929, 0.6784314, 1, 0, 1,
-0.7981945, 0.1977383, -0.7798702, 0.6745098, 1, 0, 1,
-0.7869926, 0.2115028, 0.01434381, 0.6666667, 1, 0, 1,
-0.7861412, 1.814866, -2.460167, 0.6627451, 1, 0, 1,
-0.7840985, 0.1503241, -1.237768, 0.654902, 1, 0, 1,
-0.7771903, -0.6440384, -1.679106, 0.6509804, 1, 0, 1,
-0.7740135, -0.01160711, -2.19644, 0.6431373, 1, 0, 1,
-0.7736835, 0.6153418, -1.039117, 0.6392157, 1, 0, 1,
-0.7586543, -0.8815597, -1.649854, 0.6313726, 1, 0, 1,
-0.75536, 1.609439, 0.3657337, 0.627451, 1, 0, 1,
-0.7548802, -1.94756, -3.855848, 0.6196079, 1, 0, 1,
-0.7534715, -0.07550115, -2.025341, 0.6156863, 1, 0, 1,
-0.7450853, -0.39774, -2.023551, 0.6078432, 1, 0, 1,
-0.7444486, -1.04348, -4.529874, 0.6039216, 1, 0, 1,
-0.7443281, 0.4996085, -0.9929921, 0.5960785, 1, 0, 1,
-0.7415961, -1.453715, -3.16321, 0.5882353, 1, 0, 1,
-0.7384298, -1.205107, -3.523735, 0.5843138, 1, 0, 1,
-0.7345757, 0.3786851, 0.1338616, 0.5764706, 1, 0, 1,
-0.7344691, 2.026552, -2.829525, 0.572549, 1, 0, 1,
-0.7333781, -1.264924, -2.607623, 0.5647059, 1, 0, 1,
-0.7306547, 0.4785075, -1.404392, 0.5607843, 1, 0, 1,
-0.7305235, -0.01396377, -1.11838, 0.5529412, 1, 0, 1,
-0.7213098, 1.274396, 1.398382, 0.5490196, 1, 0, 1,
-0.7206587, 0.5004731, -2.992239, 0.5411765, 1, 0, 1,
-0.719955, -0.8550502, -2.632629, 0.5372549, 1, 0, 1,
-0.7175347, 0.4352635, -0.2794431, 0.5294118, 1, 0, 1,
-0.7172297, -0.2993412, -1.60302, 0.5254902, 1, 0, 1,
-0.7141237, -0.1611469, -2.752762, 0.5176471, 1, 0, 1,
-0.7140288, -0.6866786, -0.469973, 0.5137255, 1, 0, 1,
-0.7128271, -0.5692026, -2.97999, 0.5058824, 1, 0, 1,
-0.7088806, 2.023762, -0.6775738, 0.5019608, 1, 0, 1,
-0.7080108, 0.6805815, -0.5924298, 0.4941176, 1, 0, 1,
-0.7072766, 1.212005, 0.3220178, 0.4862745, 1, 0, 1,
-0.7013228, 0.6428416, -0.08761404, 0.4823529, 1, 0, 1,
-0.698486, 2.658648, -1.494684, 0.4745098, 1, 0, 1,
-0.6969352, 0.6877598, -1.00147, 0.4705882, 1, 0, 1,
-0.6857853, 0.3836605, -0.0968572, 0.4627451, 1, 0, 1,
-0.6813354, -1.298504, -2.538768, 0.4588235, 1, 0, 1,
-0.6810205, -0.1986621, -1.713856, 0.4509804, 1, 0, 1,
-0.6738468, 0.146816, -2.150222, 0.4470588, 1, 0, 1,
-0.6729826, 0.8733135, -0.6856703, 0.4392157, 1, 0, 1,
-0.6683835, -0.5193482, -0.8478159, 0.4352941, 1, 0, 1,
-0.6672051, 1.771459, -1.931993, 0.427451, 1, 0, 1,
-0.6592686, -0.7715209, -0.8942181, 0.4235294, 1, 0, 1,
-0.6591712, 0.5090503, -0.487433, 0.4156863, 1, 0, 1,
-0.6580977, 0.5692797, -0.4840795, 0.4117647, 1, 0, 1,
-0.6435932, -0.1790186, -2.160108, 0.4039216, 1, 0, 1,
-0.6388914, 0.4505285, 0.3242615, 0.3960784, 1, 0, 1,
-0.6368886, -1.40887, -2.42422, 0.3921569, 1, 0, 1,
-0.6279441, -0.7795761, -2.258979, 0.3843137, 1, 0, 1,
-0.6278885, 0.2540321, 0.7660187, 0.3803922, 1, 0, 1,
-0.627113, -2.505697, -1.399826, 0.372549, 1, 0, 1,
-0.6215562, 0.08639689, 0.9615955, 0.3686275, 1, 0, 1,
-0.619409, -0.09192299, -2.148943, 0.3607843, 1, 0, 1,
-0.6117221, -0.7133233, -3.385854, 0.3568628, 1, 0, 1,
-0.5991746, 0.3324654, -1.221749, 0.3490196, 1, 0, 1,
-0.5972918, 1.039577, 0.3772556, 0.345098, 1, 0, 1,
-0.595855, -0.7872637, -0.980289, 0.3372549, 1, 0, 1,
-0.5934035, -1.252473, -3.265948, 0.3333333, 1, 0, 1,
-0.5906206, 1.004039, 1.068988, 0.3254902, 1, 0, 1,
-0.5887378, -0.06359893, -1.609619, 0.3215686, 1, 0, 1,
-0.5874327, -1.107314, -3.685866, 0.3137255, 1, 0, 1,
-0.5840395, 1.604888, -0.608756, 0.3098039, 1, 0, 1,
-0.58336, 0.04203076, -1.895773, 0.3019608, 1, 0, 1,
-0.5816687, -0.8708054, -1.890815, 0.2941177, 1, 0, 1,
-0.5803996, 0.7521507, 1.206541, 0.2901961, 1, 0, 1,
-0.5792099, -0.144763, -2.124475, 0.282353, 1, 0, 1,
-0.5789971, -0.4998749, -2.259678, 0.2784314, 1, 0, 1,
-0.5773055, -1.253519, -3.50519, 0.2705882, 1, 0, 1,
-0.5765199, 1.528147, -1.008589, 0.2666667, 1, 0, 1,
-0.5761055, -0.3495779, -0.7032371, 0.2588235, 1, 0, 1,
-0.5737765, -0.5334612, -1.453248, 0.254902, 1, 0, 1,
-0.5737219, -1.585403, -3.414616, 0.2470588, 1, 0, 1,
-0.5713015, -1.651102, -3.712084, 0.2431373, 1, 0, 1,
-0.5658044, -2.293136, -1.438889, 0.2352941, 1, 0, 1,
-0.5641629, -1.608461, -3.433218, 0.2313726, 1, 0, 1,
-0.558266, 0.09534895, -2.378615, 0.2235294, 1, 0, 1,
-0.5578105, 0.1856671, -1.67531, 0.2196078, 1, 0, 1,
-0.5566437, 0.8167359, -0.8499068, 0.2117647, 1, 0, 1,
-0.5546095, 0.8097857, -0.3148216, 0.2078431, 1, 0, 1,
-0.5538983, 0.2691614, -1.362538, 0.2, 1, 0, 1,
-0.551287, -0.4954634, -2.798447, 0.1921569, 1, 0, 1,
-0.5461156, -0.000527654, -1.657824, 0.1882353, 1, 0, 1,
-0.5452705, -0.4737918, -2.510528, 0.1803922, 1, 0, 1,
-0.5441604, 1.015535, -0.6890486, 0.1764706, 1, 0, 1,
-0.5419678, -2.818527, -1.618474, 0.1686275, 1, 0, 1,
-0.5395319, 0.9303712, -2.340215, 0.1647059, 1, 0, 1,
-0.538245, 1.153191, 1.233488, 0.1568628, 1, 0, 1,
-0.5364924, 1.08057, -0.6108366, 0.1529412, 1, 0, 1,
-0.5278141, -1.638612, -4.002341, 0.145098, 1, 0, 1,
-0.5252904, 0.918995, 0.06848065, 0.1411765, 1, 0, 1,
-0.5242005, -0.6032453, -1.159056, 0.1333333, 1, 0, 1,
-0.5240759, -1.932504, -3.313054, 0.1294118, 1, 0, 1,
-0.522673, -0.3424072, -4.112673, 0.1215686, 1, 0, 1,
-0.5219603, 0.09792447, -0.4509537, 0.1176471, 1, 0, 1,
-0.5214236, 0.6576906, -0.3324044, 0.1098039, 1, 0, 1,
-0.5209124, -0.972197, -5.093923, 0.1058824, 1, 0, 1,
-0.5175999, -0.6254691, -1.166054, 0.09803922, 1, 0, 1,
-0.5162004, -0.1750153, -1.954644, 0.09019608, 1, 0, 1,
-0.5146009, 0.4465692, -2.807189, 0.08627451, 1, 0, 1,
-0.5118348, -0.6810635, -2.839717, 0.07843138, 1, 0, 1,
-0.5091355, -1.739545, -3.583284, 0.07450981, 1, 0, 1,
-0.499401, -0.08149728, -1.258341, 0.06666667, 1, 0, 1,
-0.4913986, 0.4651417, -2.057672, 0.0627451, 1, 0, 1,
-0.4897783, -0.07925805, -2.298127, 0.05490196, 1, 0, 1,
-0.4888346, 1.027646, 0.4927247, 0.05098039, 1, 0, 1,
-0.4815388, 0.6035426, -2.244099, 0.04313726, 1, 0, 1,
-0.4814462, 0.1787352, -0.4183311, 0.03921569, 1, 0, 1,
-0.4742814, -1.054304, -3.527005, 0.03137255, 1, 0, 1,
-0.4674349, -0.832112, -0.683228, 0.02745098, 1, 0, 1,
-0.464674, -1.345933, -3.946142, 0.01960784, 1, 0, 1,
-0.4643233, -0.3159899, -0.364014, 0.01568628, 1, 0, 1,
-0.463176, 0.07188496, -0.8072699, 0.007843138, 1, 0, 1,
-0.4614899, 0.037598, -1.748602, 0.003921569, 1, 0, 1,
-0.4564235, -1.149318, -4.510424, 0, 1, 0.003921569, 1,
-0.4557375, -0.7616458, -3.274244, 0, 1, 0.01176471, 1,
-0.4531404, -2.280541, -4.074474, 0, 1, 0.01568628, 1,
-0.4510747, -1.103048, -1.326197, 0, 1, 0.02352941, 1,
-0.44527, -0.607292, -3.347564, 0, 1, 0.02745098, 1,
-0.4419599, 1.162245, -0.5211262, 0, 1, 0.03529412, 1,
-0.4409628, -0.03610159, -2.06443, 0, 1, 0.03921569, 1,
-0.4407116, 0.4144374, 0.1155787, 0, 1, 0.04705882, 1,
-0.4406999, -0.5781283, -2.844508, 0, 1, 0.05098039, 1,
-0.4406289, 0.3959671, 0.3440908, 0, 1, 0.05882353, 1,
-0.4395602, -0.2125953, -2.262905, 0, 1, 0.0627451, 1,
-0.437687, -1.238041, -1.348297, 0, 1, 0.07058824, 1,
-0.4329306, 0.2162701, 0.4100369, 0, 1, 0.07450981, 1,
-0.4207945, -0.356548, -3.451432, 0, 1, 0.08235294, 1,
-0.4138457, 0.2334467, -1.414064, 0, 1, 0.08627451, 1,
-0.4135871, -0.1302389, -2.637348, 0, 1, 0.09411765, 1,
-0.4130781, -0.2590735, -1.402826, 0, 1, 0.1019608, 1,
-0.4129039, -0.694537, -3.339876, 0, 1, 0.1058824, 1,
-0.4100288, 0.9864255, -2.401891, 0, 1, 0.1137255, 1,
-0.4019135, -0.5819611, -3.493036, 0, 1, 0.1176471, 1,
-0.3994445, 0.109691, -1.520051, 0, 1, 0.1254902, 1,
-0.3966365, -1.691508, -1.36406, 0, 1, 0.1294118, 1,
-0.3954083, -0.3787, -1.983974, 0, 1, 0.1372549, 1,
-0.3918391, 0.9795684, -0.8310471, 0, 1, 0.1411765, 1,
-0.3914742, -0.2398049, -2.537091, 0, 1, 0.1490196, 1,
-0.3912623, 0.3428519, -2.002113, 0, 1, 0.1529412, 1,
-0.3899985, 0.3199528, -1.495968, 0, 1, 0.1607843, 1,
-0.3827714, -0.08718935, -1.875129, 0, 1, 0.1647059, 1,
-0.3793438, 0.5221229, -1.573019, 0, 1, 0.172549, 1,
-0.3790396, -1.020975, -2.678143, 0, 1, 0.1764706, 1,
-0.3735408, 1.055299, 1.032722, 0, 1, 0.1843137, 1,
-0.3725567, 1.284073, 0.7684295, 0, 1, 0.1882353, 1,
-0.3688235, 2.073229, -1.046003, 0, 1, 0.1960784, 1,
-0.3679751, -1.113842, -3.103657, 0, 1, 0.2039216, 1,
-0.3644218, -0.5346258, -4.650695, 0, 1, 0.2078431, 1,
-0.3633512, 0.3865937, -1.257403, 0, 1, 0.2156863, 1,
-0.3632848, -0.4333786, -2.149787, 0, 1, 0.2196078, 1,
-0.363267, 0.4105017, -0.1609988, 0, 1, 0.227451, 1,
-0.3603966, 0.07231858, -2.351701, 0, 1, 0.2313726, 1,
-0.3588522, 0.1080542, -0.8612915, 0, 1, 0.2392157, 1,
-0.3567945, 0.7646253, -2.194996, 0, 1, 0.2431373, 1,
-0.3536955, -1.610449, -2.466217, 0, 1, 0.2509804, 1,
-0.3455318, 1.349626, -2.866166, 0, 1, 0.254902, 1,
-0.3436212, -0.6419552, -3.127993, 0, 1, 0.2627451, 1,
-0.3416584, 0.4139512, -0.3668893, 0, 1, 0.2666667, 1,
-0.3376213, 1.228089, -0.1213708, 0, 1, 0.2745098, 1,
-0.3300496, -0.3198478, -1.537395, 0, 1, 0.2784314, 1,
-0.32985, 1.903979, -1.147826, 0, 1, 0.2862745, 1,
-0.3279117, 0.1795091, -1.116624, 0, 1, 0.2901961, 1,
-0.3270946, 0.351684, -1.129818, 0, 1, 0.2980392, 1,
-0.3245262, 0.4255811, -0.7790241, 0, 1, 0.3058824, 1,
-0.3209886, -1.038209, -4.628579, 0, 1, 0.3098039, 1,
-0.3203692, -1.746711, -4.001441, 0, 1, 0.3176471, 1,
-0.3190532, 2.382976, 0.05804862, 0, 1, 0.3215686, 1,
-0.319043, 0.03565199, -2.767317, 0, 1, 0.3294118, 1,
-0.318617, 1.094418, -1.434827, 0, 1, 0.3333333, 1,
-0.3124443, 2.256984, 0.7180009, 0, 1, 0.3411765, 1,
-0.3081497, 0.9154629, 0.4078337, 0, 1, 0.345098, 1,
-0.3070975, -1.517798, -3.490839, 0, 1, 0.3529412, 1,
-0.3055241, -0.5000908, -4.431982, 0, 1, 0.3568628, 1,
-0.3035412, -0.282981, -2.603069, 0, 1, 0.3647059, 1,
-0.3022365, 2.757956, -0.6653351, 0, 1, 0.3686275, 1,
-0.3007361, 1.646278, -0.1047963, 0, 1, 0.3764706, 1,
-0.2998828, -1.303488, -4.792689, 0, 1, 0.3803922, 1,
-0.2953266, 1.887828, -0.2782835, 0, 1, 0.3882353, 1,
-0.2935545, 2.052746, 1.518103, 0, 1, 0.3921569, 1,
-0.2878932, 1.054215, -0.9277284, 0, 1, 0.4, 1,
-0.285987, 1.902542, -0.4459981, 0, 1, 0.4078431, 1,
-0.279816, -0.4914666, -1.561195, 0, 1, 0.4117647, 1,
-0.2775257, 0.390611, -0.8440862, 0, 1, 0.4196078, 1,
-0.2722399, 1.004694, -0.6395512, 0, 1, 0.4235294, 1,
-0.2640847, -1.596349, -2.477069, 0, 1, 0.4313726, 1,
-0.2612814, -1.611809, -4.141197, 0, 1, 0.4352941, 1,
-0.2609739, -0.1932658, -0.3107175, 0, 1, 0.4431373, 1,
-0.2587619, -0.2186731, -1.552848, 0, 1, 0.4470588, 1,
-0.2585672, 0.3028113, -0.228551, 0, 1, 0.454902, 1,
-0.2584271, -0.358843, -3.934698, 0, 1, 0.4588235, 1,
-0.2562921, 1.502438, -0.7063428, 0, 1, 0.4666667, 1,
-0.2560612, 0.3158855, -1.936661, 0, 1, 0.4705882, 1,
-0.2557957, -0.391941, -3.184396, 0, 1, 0.4784314, 1,
-0.2546032, -0.1287844, -2.720105, 0, 1, 0.4823529, 1,
-0.2501125, 1.518187, 0.2450412, 0, 1, 0.4901961, 1,
-0.2480173, -0.2200367, -1.985449, 0, 1, 0.4941176, 1,
-0.2479907, 1.301499, -0.6064797, 0, 1, 0.5019608, 1,
-0.2451491, -0.4834104, -1.539162, 0, 1, 0.509804, 1,
-0.244719, -0.1936259, -1.479439, 0, 1, 0.5137255, 1,
-0.2375106, -0.6236758, -0.2928403, 0, 1, 0.5215687, 1,
-0.2374778, -0.7693563, -3.886918, 0, 1, 0.5254902, 1,
-0.2343803, 1.093115, -0.6749843, 0, 1, 0.5333334, 1,
-0.231627, -0.5931991, -1.840856, 0, 1, 0.5372549, 1,
-0.2300411, -0.5378503, -2.540838, 0, 1, 0.5450981, 1,
-0.2295094, 1.541873, 0.6813499, 0, 1, 0.5490196, 1,
-0.2285798, 0.4344524, -1.436895, 0, 1, 0.5568628, 1,
-0.2272086, 0.4854171, -0.7578006, 0, 1, 0.5607843, 1,
-0.2243892, 1.297224, 0.9380006, 0, 1, 0.5686275, 1,
-0.2200671, 0.6009763, -0.2479222, 0, 1, 0.572549, 1,
-0.2197291, -1.776879, -4.175651, 0, 1, 0.5803922, 1,
-0.2195017, 0.5205858, 1.306507, 0, 1, 0.5843138, 1,
-0.2146942, -0.7146555, -2.030027, 0, 1, 0.5921569, 1,
-0.2141349, -0.2901391, -3.26089, 0, 1, 0.5960785, 1,
-0.211015, -1.02707, -3.041437, 0, 1, 0.6039216, 1,
-0.2099715, 2.972049, 0.9985167, 0, 1, 0.6117647, 1,
-0.2094548, -0.293877, -1.692866, 0, 1, 0.6156863, 1,
-0.1998843, 0.8076284, 2.312397, 0, 1, 0.6235294, 1,
-0.1919395, -1.177489, -3.969869, 0, 1, 0.627451, 1,
-0.1912156, 0.2974429, -1.577161, 0, 1, 0.6352941, 1,
-0.1890199, 1.077929, 0.2565116, 0, 1, 0.6392157, 1,
-0.1888154, -1.135021, -3.409699, 0, 1, 0.6470588, 1,
-0.1865194, -0.2661039, -3.768106, 0, 1, 0.6509804, 1,
-0.1853217, 0.3641708, -2.855134, 0, 1, 0.6588235, 1,
-0.1839921, 0.4315895, -0.5422115, 0, 1, 0.6627451, 1,
-0.1835907, -0.03701447, -0.124353, 0, 1, 0.6705883, 1,
-0.1734693, 0.1618033, -1.441664, 0, 1, 0.6745098, 1,
-0.1688713, 1.931451, -1.889865, 0, 1, 0.682353, 1,
-0.166456, 1.118732, 0.2777344, 0, 1, 0.6862745, 1,
-0.1646864, -1.127483, -3.064843, 0, 1, 0.6941177, 1,
-0.1606693, 0.08347976, -0.3539793, 0, 1, 0.7019608, 1,
-0.1600729, 2.352986, 0.3388952, 0, 1, 0.7058824, 1,
-0.1555576, 0.4870711, -2.834301, 0, 1, 0.7137255, 1,
-0.155057, -0.5176163, -4.279351, 0, 1, 0.7176471, 1,
-0.1521221, -0.2575645, -2.056269, 0, 1, 0.7254902, 1,
-0.1486897, -1.516281, -1.480074, 0, 1, 0.7294118, 1,
-0.1466864, 0.5256029, -1.191199, 0, 1, 0.7372549, 1,
-0.1461779, 1.044456, 0.2614367, 0, 1, 0.7411765, 1,
-0.1410014, -0.5044389, -2.316148, 0, 1, 0.7490196, 1,
-0.1381409, -1.653491, -2.728803, 0, 1, 0.7529412, 1,
-0.1380206, -1.335479, -4.06935, 0, 1, 0.7607843, 1,
-0.136571, -0.4497876, -2.857304, 0, 1, 0.7647059, 1,
-0.1320751, 0.888962, 0.501058, 0, 1, 0.772549, 1,
-0.1318743, 1.445998, -2.881892, 0, 1, 0.7764706, 1,
-0.1202208, 1.005678, 0.297403, 0, 1, 0.7843137, 1,
-0.1198505, 0.8275384, 0.4297772, 0, 1, 0.7882353, 1,
-0.1184954, -1.040307, -2.898174, 0, 1, 0.7960784, 1,
-0.1138845, -0.4494449, -3.324286, 0, 1, 0.8039216, 1,
-0.1133832, -0.1940371, -2.889941, 0, 1, 0.8078431, 1,
-0.1121719, -0.1229326, -0.5487863, 0, 1, 0.8156863, 1,
-0.1121629, -1.425842, -3.102245, 0, 1, 0.8196079, 1,
-0.1082906, 0.2485119, 0.4924218, 0, 1, 0.827451, 1,
-0.1008865, -0.8766391, -3.340676, 0, 1, 0.8313726, 1,
-0.09778581, 1.590833, -2.109724, 0, 1, 0.8392157, 1,
-0.08843418, 1.068067, -0.4894808, 0, 1, 0.8431373, 1,
-0.08754211, 0.7089292, 1.30938, 0, 1, 0.8509804, 1,
-0.08728456, -0.6739889, -3.518952, 0, 1, 0.854902, 1,
-0.08680632, 1.098891, 1.330255, 0, 1, 0.8627451, 1,
-0.08592227, 1.314551, 1.519413, 0, 1, 0.8666667, 1,
-0.08338065, 0.5039148, 0.6652213, 0, 1, 0.8745098, 1,
-0.08251274, 1.003468, 0.3512095, 0, 1, 0.8784314, 1,
-0.08169071, -1.051542, -3.129481, 0, 1, 0.8862745, 1,
-0.07881199, -0.8739001, -2.402612, 0, 1, 0.8901961, 1,
-0.07843061, 0.4934572, -0.8902652, 0, 1, 0.8980392, 1,
-0.07641336, -0.7403693, -4.357577, 0, 1, 0.9058824, 1,
-0.07462718, 0.2404897, 0.3081173, 0, 1, 0.9098039, 1,
-0.07314126, 0.4886675, -1.562566, 0, 1, 0.9176471, 1,
-0.07279404, -2.519227, -3.32978, 0, 1, 0.9215686, 1,
-0.07228104, 0.1535627, -0.9520015, 0, 1, 0.9294118, 1,
-0.07045738, -1.10405, -3.668375, 0, 1, 0.9333333, 1,
-0.06900311, 0.7116941, -2.509559, 0, 1, 0.9411765, 1,
-0.06775575, 0.4373259, 1.03593, 0, 1, 0.945098, 1,
-0.06705292, -0.03641246, -3.367145, 0, 1, 0.9529412, 1,
-0.06651757, -0.2176656, -3.030497, 0, 1, 0.9568627, 1,
-0.05960523, 0.2098221, 1.363365, 0, 1, 0.9647059, 1,
-0.05860564, -2.235784, -2.910075, 0, 1, 0.9686275, 1,
-0.05786523, -1.143428, -1.929941, 0, 1, 0.9764706, 1,
-0.05318473, -0.8649381, -4.312218, 0, 1, 0.9803922, 1,
-0.0499132, -1.581158, -4.901416, 0, 1, 0.9882353, 1,
-0.04951076, -0.6723391, -3.230215, 0, 1, 0.9921569, 1,
-0.04702234, -1.572497, -2.762009, 0, 1, 1, 1,
-0.04551537, 0.9490681, -0.1041697, 0, 0.9921569, 1, 1,
-0.04182848, 0.5518034, 0.06678373, 0, 0.9882353, 1, 1,
-0.0358679, 0.7661735, -0.1082502, 0, 0.9803922, 1, 1,
-0.03488265, -0.6607305, -3.688036, 0, 0.9764706, 1, 1,
-0.03364464, 0.6333437, 0.1222517, 0, 0.9686275, 1, 1,
-0.03159115, -0.4928908, -2.58585, 0, 0.9647059, 1, 1,
-0.02931013, 1.083774, 1.224563, 0, 0.9568627, 1, 1,
-0.02866991, 0.2661419, 0.8120796, 0, 0.9529412, 1, 1,
-0.02776007, 1.879531, -0.188268, 0, 0.945098, 1, 1,
-0.0232144, 1.292643, -0.701664, 0, 0.9411765, 1, 1,
-0.02136497, -1.316183, -2.316876, 0, 0.9333333, 1, 1,
-0.02086904, 0.3873145, -0.6894766, 0, 0.9294118, 1, 1,
-0.0195132, 0.7643405, 0.2806158, 0, 0.9215686, 1, 1,
-0.01882267, -0.1221226, -2.952375, 0, 0.9176471, 1, 1,
-0.01681229, 0.704805, -0.6038492, 0, 0.9098039, 1, 1,
-0.01580487, -0.803185, -2.57009, 0, 0.9058824, 1, 1,
-0.01254011, -0.6077984, -3.854737, 0, 0.8980392, 1, 1,
-0.009154074, 0.3416759, -0.2405128, 0, 0.8901961, 1, 1,
-0.004407997, -0.1462706, -1.834531, 0, 0.8862745, 1, 1,
-0.003299367, 1.215568, -0.9165228, 0, 0.8784314, 1, 1,
-0.003009299, 0.8101279, 0.5276586, 0, 0.8745098, 1, 1,
-0.00119773, 1.516135, 0.8273321, 0, 0.8666667, 1, 1,
-0.0005136995, -0.620833, -3.912852, 0, 0.8627451, 1, 1,
0.001553188, 1.122213, -0.986505, 0, 0.854902, 1, 1,
0.007514064, -0.4632457, 4.546564, 0, 0.8509804, 1, 1,
0.0111485, 0.2705126, 0.2286891, 0, 0.8431373, 1, 1,
0.0174313, -0.3300308, 2.799308, 0, 0.8392157, 1, 1,
0.02088174, 0.4885638, 0.2418417, 0, 0.8313726, 1, 1,
0.0306608, -0.7949565, 3.490513, 0, 0.827451, 1, 1,
0.03085209, -0.5903673, 2.891967, 0, 0.8196079, 1, 1,
0.03751586, 0.2841792, -0.2072266, 0, 0.8156863, 1, 1,
0.04277254, 1.311341, -0.7734933, 0, 0.8078431, 1, 1,
0.04377981, -1.063128, 1.610402, 0, 0.8039216, 1, 1,
0.04474594, 1.303953, 1.027258, 0, 0.7960784, 1, 1,
0.05067187, 0.2242028, -0.7959614, 0, 0.7882353, 1, 1,
0.05108498, -0.0344518, 2.410462, 0, 0.7843137, 1, 1,
0.05290977, 0.3213432, 0.5451138, 0, 0.7764706, 1, 1,
0.05399338, 1.382337, -1.114616, 0, 0.772549, 1, 1,
0.05464203, -0.6930615, 3.397892, 0, 0.7647059, 1, 1,
0.05886204, 0.1952635, -0.8174686, 0, 0.7607843, 1, 1,
0.06629932, -0.7805037, 1.166736, 0, 0.7529412, 1, 1,
0.06946918, -0.1958334, 2.295305, 0, 0.7490196, 1, 1,
0.06967733, 1.948317, -0.0005568856, 0, 0.7411765, 1, 1,
0.06983498, 0.828264, 0.5067347, 0, 0.7372549, 1, 1,
0.07174609, 0.7726843, -0.6837232, 0, 0.7294118, 1, 1,
0.07569002, -1.239484, 2.046471, 0, 0.7254902, 1, 1,
0.07793765, -1.897824, 2.27372, 0, 0.7176471, 1, 1,
0.08018432, 0.1188061, -2.119501, 0, 0.7137255, 1, 1,
0.08197801, -0.3718662, 3.84994, 0, 0.7058824, 1, 1,
0.08349013, -0.02754694, 0.5300676, 0, 0.6980392, 1, 1,
0.08549508, 1.955073, -1.042066, 0, 0.6941177, 1, 1,
0.08581036, -0.3703604, 3.623703, 0, 0.6862745, 1, 1,
0.08711603, -0.4502746, 3.077998, 0, 0.682353, 1, 1,
0.0885208, -0.6308299, 2.879745, 0, 0.6745098, 1, 1,
0.0956104, -1.151723, 4.710675, 0, 0.6705883, 1, 1,
0.09590625, 2.03439, -0.07166936, 0, 0.6627451, 1, 1,
0.1004521, -0.3952567, 1.696154, 0, 0.6588235, 1, 1,
0.100679, 2.023169, -2.531705, 0, 0.6509804, 1, 1,
0.1185166, -1.48321, 3.217883, 0, 0.6470588, 1, 1,
0.1216838, 1.433945, -0.04733627, 0, 0.6392157, 1, 1,
0.1259731, 1.619832, -1.202025, 0, 0.6352941, 1, 1,
0.1278765, -0.9249262, 2.019217, 0, 0.627451, 1, 1,
0.131173, -0.7943299, 4.980659, 0, 0.6235294, 1, 1,
0.1312581, 0.5114771, 0.9040548, 0, 0.6156863, 1, 1,
0.1329216, 0.1657657, 1.917732, 0, 0.6117647, 1, 1,
0.1356659, -0.3543291, 3.064826, 0, 0.6039216, 1, 1,
0.1383728, -0.3112479, 4.041503, 0, 0.5960785, 1, 1,
0.1407039, 0.921699, -0.370308, 0, 0.5921569, 1, 1,
0.1462381, 0.5346062, 0.2710421, 0, 0.5843138, 1, 1,
0.1502058, -1.318825, 2.921609, 0, 0.5803922, 1, 1,
0.1510037, 1.728805, -2.827204, 0, 0.572549, 1, 1,
0.1515697, -1.749566, 2.748449, 0, 0.5686275, 1, 1,
0.1530828, 0.4321035, 1.00016, 0, 0.5607843, 1, 1,
0.1575285, 0.339893, 0.1945942, 0, 0.5568628, 1, 1,
0.1578454, -0.5478604, 2.102252, 0, 0.5490196, 1, 1,
0.1681128, -1.269597, 3.984293, 0, 0.5450981, 1, 1,
0.1702087, -0.05944737, 1.561316, 0, 0.5372549, 1, 1,
0.1759245, 0.5755028, -1.053473, 0, 0.5333334, 1, 1,
0.1778341, -1.493085, 3.557786, 0, 0.5254902, 1, 1,
0.178375, 0.3822413, 0.9898108, 0, 0.5215687, 1, 1,
0.1812654, -0.5771426, 2.656656, 0, 0.5137255, 1, 1,
0.1824868, -1.062999, 2.798256, 0, 0.509804, 1, 1,
0.1836629, 0.3995771, -0.3096695, 0, 0.5019608, 1, 1,
0.187773, -0.1435716, 1.902167, 0, 0.4941176, 1, 1,
0.1903665, -0.4490357, 2.397466, 0, 0.4901961, 1, 1,
0.1979636, 0.8426911, -0.0002342809, 0, 0.4823529, 1, 1,
0.200085, -0.8856307, 1.715584, 0, 0.4784314, 1, 1,
0.2006024, 0.07623293, 1.774895, 0, 0.4705882, 1, 1,
0.2087362, 1.329011, -0.8468819, 0, 0.4666667, 1, 1,
0.2155605, -0.2823333, 3.371288, 0, 0.4588235, 1, 1,
0.215713, -0.008294328, 2.564557, 0, 0.454902, 1, 1,
0.2168224, -3.631784, 3.193054, 0, 0.4470588, 1, 1,
0.218473, 0.1844229, 1.737578, 0, 0.4431373, 1, 1,
0.224402, -0.6055784, 3.713801, 0, 0.4352941, 1, 1,
0.227163, -0.5751446, 2.58918, 0, 0.4313726, 1, 1,
0.2288334, 1.453574, -0.4116729, 0, 0.4235294, 1, 1,
0.2305689, 0.3606788, 2.15669, 0, 0.4196078, 1, 1,
0.2328513, -0.9054144, 4.129336, 0, 0.4117647, 1, 1,
0.2332738, -0.7109203, 4.13274, 0, 0.4078431, 1, 1,
0.2361287, 0.2769527, 1.488377, 0, 0.4, 1, 1,
0.240615, 0.3606148, 0.2607453, 0, 0.3921569, 1, 1,
0.2416917, -0.4052639, 1.593014, 0, 0.3882353, 1, 1,
0.2434009, 1.486901, -1.063363, 0, 0.3803922, 1, 1,
0.2462212, 1.499343, 0.8829751, 0, 0.3764706, 1, 1,
0.2591005, 0.3183528, 0.459862, 0, 0.3686275, 1, 1,
0.2609091, 0.6301036, -1.288518, 0, 0.3647059, 1, 1,
0.2637445, 0.6217175, 0.5986369, 0, 0.3568628, 1, 1,
0.2668614, 0.7615389, 1.34754, 0, 0.3529412, 1, 1,
0.2683877, -2.017943, 2.46696, 0, 0.345098, 1, 1,
0.2717852, -1.53495, 4.995894, 0, 0.3411765, 1, 1,
0.2761188, -0.7741494, 2.254121, 0, 0.3333333, 1, 1,
0.2839837, 0.1909583, 0.7303032, 0, 0.3294118, 1, 1,
0.2847047, -0.454028, 3.352041, 0, 0.3215686, 1, 1,
0.2879515, -0.7559505, 3.104868, 0, 0.3176471, 1, 1,
0.2906599, 1.017378, -0.04057915, 0, 0.3098039, 1, 1,
0.2909478, 0.2986622, 3.05427, 0, 0.3058824, 1, 1,
0.2915806, -1.151206, 2.653187, 0, 0.2980392, 1, 1,
0.2918488, -0.1193949, 1.642243, 0, 0.2901961, 1, 1,
0.2950984, -0.5446496, 1.905516, 0, 0.2862745, 1, 1,
0.2952646, 1.443301, -0.8396154, 0, 0.2784314, 1, 1,
0.2980372, -0.2465673, 2.758562, 0, 0.2745098, 1, 1,
0.3068419, -1.197417, 4.819676, 0, 0.2666667, 1, 1,
0.3103669, -0.02600545, 1.397753, 0, 0.2627451, 1, 1,
0.3138648, 0.5275595, -0.9780107, 0, 0.254902, 1, 1,
0.3202591, 1.387968, -1.24902, 0, 0.2509804, 1, 1,
0.3255849, -0.5670432, 2.91171, 0, 0.2431373, 1, 1,
0.3270344, -0.5868594, 3.470204, 0, 0.2392157, 1, 1,
0.3284713, -0.5669219, 1.132635, 0, 0.2313726, 1, 1,
0.3286072, 0.1795803, 2.159187, 0, 0.227451, 1, 1,
0.3294488, -0.02147007, 2.335129, 0, 0.2196078, 1, 1,
0.3318266, 0.1175637, 1.169889, 0, 0.2156863, 1, 1,
0.3379751, 1.908501, 0.4069302, 0, 0.2078431, 1, 1,
0.3385507, -0.497391, 1.706775, 0, 0.2039216, 1, 1,
0.3388596, 1.150675, 1.692066, 0, 0.1960784, 1, 1,
0.3401024, 0.3913578, 0.7550545, 0, 0.1882353, 1, 1,
0.340417, 1.642639, -1.176392, 0, 0.1843137, 1, 1,
0.3420157, 0.4242548, 1.206927, 0, 0.1764706, 1, 1,
0.3421741, -1.306466, 4.802833, 0, 0.172549, 1, 1,
0.3473402, 0.2774243, -0.2537948, 0, 0.1647059, 1, 1,
0.3497973, 0.4793558, 1.429742, 0, 0.1607843, 1, 1,
0.3514652, 0.5802119, 2.349734, 0, 0.1529412, 1, 1,
0.3523493, -0.8438744, 2.355445, 0, 0.1490196, 1, 1,
0.3578257, -0.8645085, 3.440818, 0, 0.1411765, 1, 1,
0.3581005, 1.113922, 1.430593, 0, 0.1372549, 1, 1,
0.3631736, 0.3905674, 0.9959679, 0, 0.1294118, 1, 1,
0.366003, 1.567925, 2.223542, 0, 0.1254902, 1, 1,
0.3670559, 0.8854659, -0.4526554, 0, 0.1176471, 1, 1,
0.3743158, 0.4291342, 1.785098, 0, 0.1137255, 1, 1,
0.3747511, -1.017526, 2.781213, 0, 0.1058824, 1, 1,
0.3790829, -0.05592054, 1.078444, 0, 0.09803922, 1, 1,
0.3843739, 0.09125452, 0.1931228, 0, 0.09411765, 1, 1,
0.3906655, 0.1716909, 0.3616049, 0, 0.08627451, 1, 1,
0.3965919, 0.203481, 0.9242414, 0, 0.08235294, 1, 1,
0.3988644, -0.1734063, 1.890207, 0, 0.07450981, 1, 1,
0.4006158, 0.8458531, 1.21663, 0, 0.07058824, 1, 1,
0.4037461, -0.2006387, 2.107725, 0, 0.0627451, 1, 1,
0.4098116, 0.57484, 0.8041825, 0, 0.05882353, 1, 1,
0.4138975, 0.8589464, 1.856784, 0, 0.05098039, 1, 1,
0.413982, 0.07708146, 0.4476801, 0, 0.04705882, 1, 1,
0.4158638, -0.5038793, 3.64021, 0, 0.03921569, 1, 1,
0.4173126, -0.08356985, 0.7312682, 0, 0.03529412, 1, 1,
0.4179386, -1.207976, 2.689949, 0, 0.02745098, 1, 1,
0.4182039, 0.3684029, 0.5118087, 0, 0.02352941, 1, 1,
0.4192168, -0.3737632, 2.385525, 0, 0.01568628, 1, 1,
0.4201689, 2.737843, 0.2582778, 0, 0.01176471, 1, 1,
0.4232737, 0.2410247, 2.620283, 0, 0.003921569, 1, 1,
0.4234658, 1.744635, -0.227288, 0.003921569, 0, 1, 1,
0.4241779, -0.9019874, 2.029948, 0.007843138, 0, 1, 1,
0.4247666, 1.986203, 1.012427, 0.01568628, 0, 1, 1,
0.4285333, -0.7591984, 1.717738, 0.01960784, 0, 1, 1,
0.4294582, -0.4647882, 1.691664, 0.02745098, 0, 1, 1,
0.4311074, -1.287278, 1.180687, 0.03137255, 0, 1, 1,
0.4312326, -0.364899, 1.907302, 0.03921569, 0, 1, 1,
0.4324157, -0.2458261, 1.420426, 0.04313726, 0, 1, 1,
0.4337087, -0.9416875, 3.226312, 0.05098039, 0, 1, 1,
0.4364688, -0.1537712, 2.493725, 0.05490196, 0, 1, 1,
0.4366328, -0.2659003, 2.937273, 0.0627451, 0, 1, 1,
0.4409939, -0.1872112, 2.47163, 0.06666667, 0, 1, 1,
0.4469655, 1.677159, 1.185276, 0.07450981, 0, 1, 1,
0.4505832, 0.2445685, 2.511463, 0.07843138, 0, 1, 1,
0.4517292, 0.8038268, 1.262182, 0.08627451, 0, 1, 1,
0.4551772, -0.9592567, 3.152785, 0.09019608, 0, 1, 1,
0.4655787, -0.8428977, 1.943981, 0.09803922, 0, 1, 1,
0.4669536, -2.04628, 3.89508, 0.1058824, 0, 1, 1,
0.4709994, -0.2356546, 3.17883, 0.1098039, 0, 1, 1,
0.4730603, -1.144433, 2.653377, 0.1176471, 0, 1, 1,
0.4755412, -0.462454, 1.584362, 0.1215686, 0, 1, 1,
0.4819755, -0.3176802, 1.251774, 0.1294118, 0, 1, 1,
0.4826886, 1.543238, 1.043955, 0.1333333, 0, 1, 1,
0.4835182, -0.2359047, 2.640099, 0.1411765, 0, 1, 1,
0.4846838, -0.6914526, 3.598504, 0.145098, 0, 1, 1,
0.4849123, 0.2384474, 1.139218, 0.1529412, 0, 1, 1,
0.4865307, -0.2154662, 2.115425, 0.1568628, 0, 1, 1,
0.4879254, 2.045598, 1.9763, 0.1647059, 0, 1, 1,
0.4888206, 0.5478682, 2.34173, 0.1686275, 0, 1, 1,
0.4892632, 0.9340658, 1.659531, 0.1764706, 0, 1, 1,
0.4893456, -1.295482, 0.9978064, 0.1803922, 0, 1, 1,
0.4924112, 0.1631469, 2.974605, 0.1882353, 0, 1, 1,
0.4944647, 1.701528, -0.04869581, 0.1921569, 0, 1, 1,
0.5021669, -0.2794489, 1.659757, 0.2, 0, 1, 1,
0.5029359, -0.06904579, 1.983308, 0.2078431, 0, 1, 1,
0.5035338, 0.3777885, 1.065837, 0.2117647, 0, 1, 1,
0.5069025, -0.2109593, 1.045235, 0.2196078, 0, 1, 1,
0.5073279, -0.6537545, 3.873739, 0.2235294, 0, 1, 1,
0.5119649, -0.4147682, 3.168054, 0.2313726, 0, 1, 1,
0.5136381, -1.334303, 4.472644, 0.2352941, 0, 1, 1,
0.5168834, 0.717674, 0.975456, 0.2431373, 0, 1, 1,
0.5191618, 2.310131, -0.1940472, 0.2470588, 0, 1, 1,
0.5196952, -0.6502261, 1.722177, 0.254902, 0, 1, 1,
0.5204937, -1.171439, 4.427133, 0.2588235, 0, 1, 1,
0.5219209, 0.4287378, 3.061381, 0.2666667, 0, 1, 1,
0.5220273, -0.7828055, 3.279914, 0.2705882, 0, 1, 1,
0.5221252, 1.62243, 0.7910056, 0.2784314, 0, 1, 1,
0.5234115, 1.526029, -0.08486502, 0.282353, 0, 1, 1,
0.5239493, 0.6817206, 1.927662, 0.2901961, 0, 1, 1,
0.5240299, 2.450835, -0.2342483, 0.2941177, 0, 1, 1,
0.5313748, 0.4840016, 0.7963691, 0.3019608, 0, 1, 1,
0.5328544, -0.7058707, 0.5638416, 0.3098039, 0, 1, 1,
0.5343611, -0.7817301, 2.711878, 0.3137255, 0, 1, 1,
0.5368627, -0.4957185, 3.427174, 0.3215686, 0, 1, 1,
0.5387274, 0.3270633, -0.7170367, 0.3254902, 0, 1, 1,
0.5406451, -1.041868, 1.715555, 0.3333333, 0, 1, 1,
0.544395, 0.7248334, 1.181752, 0.3372549, 0, 1, 1,
0.5472862, 1.087434, 1.78548, 0.345098, 0, 1, 1,
0.5477727, -0.3435611, 1.911316, 0.3490196, 0, 1, 1,
0.5516508, 1.171886, 1.945969, 0.3568628, 0, 1, 1,
0.5546893, 1.232819, -0.2708375, 0.3607843, 0, 1, 1,
0.555405, -0.6739928, 1.293916, 0.3686275, 0, 1, 1,
0.5590233, 0.4477926, 1.876147, 0.372549, 0, 1, 1,
0.5596524, -0.8622598, 1.856478, 0.3803922, 0, 1, 1,
0.5597789, -1.240611, 1.588362, 0.3843137, 0, 1, 1,
0.560054, 0.4378513, 1.13412, 0.3921569, 0, 1, 1,
0.5616695, -0.7551789, 4.839748, 0.3960784, 0, 1, 1,
0.562626, -0.9656923, 3.565303, 0.4039216, 0, 1, 1,
0.5629009, -1.126605, 2.55218, 0.4117647, 0, 1, 1,
0.5704742, -2.62942, 2.851237, 0.4156863, 0, 1, 1,
0.5780774, 0.5242596, 0.1798425, 0.4235294, 0, 1, 1,
0.5784447, -0.9397191, 2.405823, 0.427451, 0, 1, 1,
0.583455, 1.575471, 0.9454671, 0.4352941, 0, 1, 1,
0.5914282, 0.0947917, 2.593547, 0.4392157, 0, 1, 1,
0.6002923, 0.5408196, -0.14192, 0.4470588, 0, 1, 1,
0.6005681, 0.6588336, -0.08304118, 0.4509804, 0, 1, 1,
0.6049423, -1.753509, 3.031906, 0.4588235, 0, 1, 1,
0.6078132, 0.626676, 2.379892, 0.4627451, 0, 1, 1,
0.6103662, -0.6703389, 1.359592, 0.4705882, 0, 1, 1,
0.6242648, 0.1234893, 2.485761, 0.4745098, 0, 1, 1,
0.629753, 0.4527355, 0.4784907, 0.4823529, 0, 1, 1,
0.6327103, 1.161238, 0.7230963, 0.4862745, 0, 1, 1,
0.6345586, 0.3889578, 1.388905, 0.4941176, 0, 1, 1,
0.636259, 1.189684, -0.4520542, 0.5019608, 0, 1, 1,
0.6429816, 0.4430132, 1.058846, 0.5058824, 0, 1, 1,
0.6455879, 0.2428437, 1.938512, 0.5137255, 0, 1, 1,
0.6515779, -1.650973, 3.874748, 0.5176471, 0, 1, 1,
0.6519203, 2.707086, 2.403853, 0.5254902, 0, 1, 1,
0.6519818, 0.3392907, 1.061741, 0.5294118, 0, 1, 1,
0.6651232, -0.1341372, 1.498967, 0.5372549, 0, 1, 1,
0.6657574, 0.2536127, 0.02458191, 0.5411765, 0, 1, 1,
0.6685285, 1.717469, -0.7268187, 0.5490196, 0, 1, 1,
0.673122, -0.8624495, 3.571524, 0.5529412, 0, 1, 1,
0.6763625, 0.1296963, 1.179942, 0.5607843, 0, 1, 1,
0.6766689, 0.04861757, 3.301001, 0.5647059, 0, 1, 1,
0.6767496, -0.07449078, 2.087768, 0.572549, 0, 1, 1,
0.67682, 0.4440256, 1.624142, 0.5764706, 0, 1, 1,
0.6880953, 0.5890163, 2.097075, 0.5843138, 0, 1, 1,
0.6898476, -1.705217, 3.110978, 0.5882353, 0, 1, 1,
0.6899715, 1.572251, 0.1994701, 0.5960785, 0, 1, 1,
0.6911081, -1.542586, 3.44132, 0.6039216, 0, 1, 1,
0.6982084, 0.2243878, 2.180413, 0.6078432, 0, 1, 1,
0.6992678, -0.9704996, 1.318835, 0.6156863, 0, 1, 1,
0.7053629, 0.3101947, 1.363373, 0.6196079, 0, 1, 1,
0.7081745, -0.3584104, 3.087454, 0.627451, 0, 1, 1,
0.7086487, 0.3330947, 1.549754, 0.6313726, 0, 1, 1,
0.7089764, 0.3458463, 1.582346, 0.6392157, 0, 1, 1,
0.7140325, -0.3125204, 1.621574, 0.6431373, 0, 1, 1,
0.7448248, 0.3694399, 2.81688, 0.6509804, 0, 1, 1,
0.7449228, 0.2718506, 1.276175, 0.654902, 0, 1, 1,
0.7473093, -0.3278346, 1.83413, 0.6627451, 0, 1, 1,
0.7532876, -0.6415594, 2.678206, 0.6666667, 0, 1, 1,
0.7559337, -0.3893727, 0.8895527, 0.6745098, 0, 1, 1,
0.7568555, -0.5704659, 3.216879, 0.6784314, 0, 1, 1,
0.7599176, -0.6688398, 2.710726, 0.6862745, 0, 1, 1,
0.7638503, -0.6253754, 1.987608, 0.6901961, 0, 1, 1,
0.7643086, -0.4251735, 1.224031, 0.6980392, 0, 1, 1,
0.7646922, -0.1275575, 1.916425, 0.7058824, 0, 1, 1,
0.7704272, 0.5075147, 2.274375, 0.7098039, 0, 1, 1,
0.7718039, -0.00271512, 1.546996, 0.7176471, 0, 1, 1,
0.7729751, 1.739823, 0.7249965, 0.7215686, 0, 1, 1,
0.7762929, 1.137673, 1.065769, 0.7294118, 0, 1, 1,
0.7821015, -0.127459, 1.927174, 0.7333333, 0, 1, 1,
0.7835354, 1.312371, 0.8708769, 0.7411765, 0, 1, 1,
0.784321, 0.07421126, 1.667061, 0.7450981, 0, 1, 1,
0.7845818, -0.218731, 1.556121, 0.7529412, 0, 1, 1,
0.7961141, 0.2531323, 1.971063, 0.7568628, 0, 1, 1,
0.7967844, -0.04336446, 1.127468, 0.7647059, 0, 1, 1,
0.7975004, 1.723817, 0.3967121, 0.7686275, 0, 1, 1,
0.8019106, 0.4243864, 1.974418, 0.7764706, 0, 1, 1,
0.8104328, -0.1477517, 2.275763, 0.7803922, 0, 1, 1,
0.8110324, 0.4320763, 1.306782, 0.7882353, 0, 1, 1,
0.8141807, -0.5507129, 2.028871, 0.7921569, 0, 1, 1,
0.81443, -0.2967763, 2.334728, 0.8, 0, 1, 1,
0.8152195, -0.9149774, 2.16594, 0.8078431, 0, 1, 1,
0.8307768, -1.260938, 3.02547, 0.8117647, 0, 1, 1,
0.8330612, -0.4715614, 1.596626, 0.8196079, 0, 1, 1,
0.8372692, 0.3170975, -0.7069801, 0.8235294, 0, 1, 1,
0.8420734, -0.9776059, 2.614488, 0.8313726, 0, 1, 1,
0.8458212, 0.851254, 0.4806439, 0.8352941, 0, 1, 1,
0.8507248, -0.3101161, 1.458037, 0.8431373, 0, 1, 1,
0.8508247, 0.4649309, 0.450565, 0.8470588, 0, 1, 1,
0.8508291, 0.8965527, -0.03395425, 0.854902, 0, 1, 1,
0.8593314, -0.4324666, 1.593182, 0.8588235, 0, 1, 1,
0.8647225, -0.4690752, 3.133952, 0.8666667, 0, 1, 1,
0.8688414, -0.7046157, 2.511022, 0.8705882, 0, 1, 1,
0.8701747, 1.728103, 1.265395, 0.8784314, 0, 1, 1,
0.8737548, -1.367063, 2.576494, 0.8823529, 0, 1, 1,
0.8740165, 0.1620041, 1.415895, 0.8901961, 0, 1, 1,
0.8752103, -0.2621315, 2.265482, 0.8941177, 0, 1, 1,
0.8783329, 1.915212, 0.3625489, 0.9019608, 0, 1, 1,
0.8791187, 1.184122, 1.140746, 0.9098039, 0, 1, 1,
0.8914652, 0.2505485, 1.127945, 0.9137255, 0, 1, 1,
0.8934327, 1.950208, -1.093119, 0.9215686, 0, 1, 1,
0.8975305, 0.583526, 1.115054, 0.9254902, 0, 1, 1,
0.9102466, -0.1657218, 2.516915, 0.9333333, 0, 1, 1,
0.9107192, 0.3877072, 0.8952401, 0.9372549, 0, 1, 1,
0.9135265, 0.8480821, 1.198455, 0.945098, 0, 1, 1,
0.9187702, 1.683583, -0.3510174, 0.9490196, 0, 1, 1,
0.924343, -0.8167688, 2.223962, 0.9568627, 0, 1, 1,
0.9246323, -1.656255, 0.7355446, 0.9607843, 0, 1, 1,
0.9291788, -0.1880066, 1.689254, 0.9686275, 0, 1, 1,
0.9349838, 0.01734046, 0.6011293, 0.972549, 0, 1, 1,
0.9354654, -0.8665749, -0.3795655, 0.9803922, 0, 1, 1,
0.9361684, 1.110672, 1.875981, 0.9843137, 0, 1, 1,
0.9397405, -0.604068, 3.092068, 0.9921569, 0, 1, 1,
0.9405958, 0.6844407, -0.04003407, 0.9960784, 0, 1, 1,
0.9414955, -1.074342, 2.647516, 1, 0, 0.9960784, 1,
0.9418196, 0.02315249, -0.04588436, 1, 0, 0.9882353, 1,
0.9482019, 0.3246334, 1.364586, 1, 0, 0.9843137, 1,
0.9512886, -0.3891791, 1.776935, 1, 0, 0.9764706, 1,
0.9537847, 1.031243, -0.5507737, 1, 0, 0.972549, 1,
0.9542224, -1.733649, 3.531136, 1, 0, 0.9647059, 1,
0.9586056, -1.975501, 3.036364, 1, 0, 0.9607843, 1,
0.9589925, 1.302635, -0.7674682, 1, 0, 0.9529412, 1,
0.961818, -1.322313, 2.729456, 1, 0, 0.9490196, 1,
0.9625355, -0.873623, 3.151235, 1, 0, 0.9411765, 1,
0.9673141, -1.447584, 2.362321, 1, 0, 0.9372549, 1,
0.9682768, 0.3994457, -0.1457074, 1, 0, 0.9294118, 1,
0.9690232, -0.182669, 1.937004, 1, 0, 0.9254902, 1,
0.975895, -1.250438, 1.735789, 1, 0, 0.9176471, 1,
0.9772667, 0.6337778, 0.3318394, 1, 0, 0.9137255, 1,
0.9802726, -0.1228442, 0.8809786, 1, 0, 0.9058824, 1,
0.9896712, 1.477761, -2.053375, 1, 0, 0.9019608, 1,
0.9904726, 0.9360117, 0.7746671, 1, 0, 0.8941177, 1,
0.9992017, 0.3898332, 2.202768, 1, 0, 0.8862745, 1,
1.000204, 0.7317319, 0.2655557, 1, 0, 0.8823529, 1,
1.001661, -1.088369, 2.005373, 1, 0, 0.8745098, 1,
1.001713, -0.3622921, 1.961049, 1, 0, 0.8705882, 1,
1.002223, -0.3627779, 2.371687, 1, 0, 0.8627451, 1,
1.004497, -0.736495, 2.167861, 1, 0, 0.8588235, 1,
1.004914, 0.01841796, 1.209934, 1, 0, 0.8509804, 1,
1.00516, 0.0513249, 1.286055, 1, 0, 0.8470588, 1,
1.017817, 0.4143763, 1.026084, 1, 0, 0.8392157, 1,
1.022724, -1.980533, 0.6379392, 1, 0, 0.8352941, 1,
1.031714, 1.478039, -0.7499653, 1, 0, 0.827451, 1,
1.032853, 0.1264748, 1.865669, 1, 0, 0.8235294, 1,
1.034738, -1.425766, 4.091235, 1, 0, 0.8156863, 1,
1.038619, 1.557309, -0.08104847, 1, 0, 0.8117647, 1,
1.045327, 0.8382516, 2.244363, 1, 0, 0.8039216, 1,
1.055825, -0.01159536, 0.6822459, 1, 0, 0.7960784, 1,
1.06004, 0.7212221, 2.16798, 1, 0, 0.7921569, 1,
1.069806, 0.03989772, 2.206777, 1, 0, 0.7843137, 1,
1.080975, 3.071873, -0.3303452, 1, 0, 0.7803922, 1,
1.084031, -1.844347, 2.682164, 1, 0, 0.772549, 1,
1.089955, 0.550598, 1.126925, 1, 0, 0.7686275, 1,
1.090301, -1.138634, 2.954222, 1, 0, 0.7607843, 1,
1.092529, -0.7982287, 2.907355, 1, 0, 0.7568628, 1,
1.115138, 0.451777, 0.6078483, 1, 0, 0.7490196, 1,
1.115312, 2.241722, 0.8406107, 1, 0, 0.7450981, 1,
1.116351, 0.7620218, 1.212257, 1, 0, 0.7372549, 1,
1.116474, 0.6581948, -0.5926109, 1, 0, 0.7333333, 1,
1.116976, -1.779914, 3.463249, 1, 0, 0.7254902, 1,
1.128736, 0.01282214, 1.549477, 1, 0, 0.7215686, 1,
1.12921, 1.038506, 1.350949, 1, 0, 0.7137255, 1,
1.131743, 0.5325388, 1.183013, 1, 0, 0.7098039, 1,
1.136089, -0.2193363, 1.113176, 1, 0, 0.7019608, 1,
1.147748, 0.01144414, 0.8460214, 1, 0, 0.6941177, 1,
1.156678, 0.3895264, 0.1472595, 1, 0, 0.6901961, 1,
1.157327, 0.1936269, 2.241805, 1, 0, 0.682353, 1,
1.160649, -0.4259759, 2.756101, 1, 0, 0.6784314, 1,
1.165397, 2.051475, 0.661357, 1, 0, 0.6705883, 1,
1.173779, -0.6597312, 3.631048, 1, 0, 0.6666667, 1,
1.182283, -1.760978, 1.959431, 1, 0, 0.6588235, 1,
1.185449, 1.43048, 1.273811, 1, 0, 0.654902, 1,
1.202049, 2.424458, 0.5551237, 1, 0, 0.6470588, 1,
1.207214, -0.4895141, 1.736898, 1, 0, 0.6431373, 1,
1.214056, -0.1813574, 3.414745, 1, 0, 0.6352941, 1,
1.22931, 0.8181197, 0.7376431, 1, 0, 0.6313726, 1,
1.230883, 0.9769477, 0.9824175, 1, 0, 0.6235294, 1,
1.238584, 0.4074315, 0.4377555, 1, 0, 0.6196079, 1,
1.242653, 0.04158961, 1.973295, 1, 0, 0.6117647, 1,
1.248233, 1.004648, 0.1965743, 1, 0, 0.6078432, 1,
1.249692, -0.9398149, 0.8979436, 1, 0, 0.6, 1,
1.255692, 0.314613, 1.202517, 1, 0, 0.5921569, 1,
1.26184, -0.592117, 2.396471, 1, 0, 0.5882353, 1,
1.275066, -0.7492803, 2.114968, 1, 0, 0.5803922, 1,
1.290386, -0.3586687, 3.150756, 1, 0, 0.5764706, 1,
1.29584, 0.9691364, 1.823947, 1, 0, 0.5686275, 1,
1.296542, -1.362392, 3.106058, 1, 0, 0.5647059, 1,
1.302945, -0.819093, 3.499185, 1, 0, 0.5568628, 1,
1.305843, 0.9106746, 0.6134066, 1, 0, 0.5529412, 1,
1.306888, -0.682062, 1.848947, 1, 0, 0.5450981, 1,
1.313199, 2.077115, 0.4043046, 1, 0, 0.5411765, 1,
1.314374, 0.1451661, 1.298499, 1, 0, 0.5333334, 1,
1.319535, -1.384851, 1.941563, 1, 0, 0.5294118, 1,
1.327407, -0.07209173, 0.3858153, 1, 0, 0.5215687, 1,
1.332358, -0.210937, 1.135509, 1, 0, 0.5176471, 1,
1.339592, 1.348241, -1.96532, 1, 0, 0.509804, 1,
1.342491, 0.08426868, 1.79379, 1, 0, 0.5058824, 1,
1.343936, -0.729043, 0.6261418, 1, 0, 0.4980392, 1,
1.344905, 1.061045, 0.2143033, 1, 0, 0.4901961, 1,
1.349131, 1.319766, 2.889012, 1, 0, 0.4862745, 1,
1.378599, 0.04494578, 1.121082, 1, 0, 0.4784314, 1,
1.382455, 0.3797851, 0.2390616, 1, 0, 0.4745098, 1,
1.407554, -1.539938, 1.144719, 1, 0, 0.4666667, 1,
1.416886, 0.1650721, 2.849704, 1, 0, 0.4627451, 1,
1.422932, 1.494859, 2.066852, 1, 0, 0.454902, 1,
1.432133, -0.9938879, 2.466953, 1, 0, 0.4509804, 1,
1.437367, -1.581473, 3.103772, 1, 0, 0.4431373, 1,
1.441497, -1.03725, 1.553834, 1, 0, 0.4392157, 1,
1.443878, 0.4311848, 1.494607, 1, 0, 0.4313726, 1,
1.473471, 0.0222702, 2.595998, 1, 0, 0.427451, 1,
1.482284, -0.1708292, 3.054379, 1, 0, 0.4196078, 1,
1.488349, -0.8270888, 3.667653, 1, 0, 0.4156863, 1,
1.490815, 0.07852229, 2.349085, 1, 0, 0.4078431, 1,
1.498044, -0.8439452, 2.892332, 1, 0, 0.4039216, 1,
1.507045, 0.201516, 0.400429, 1, 0, 0.3960784, 1,
1.511052, 0.177403, 0.4971023, 1, 0, 0.3882353, 1,
1.541464, -2.144499, 2.337622, 1, 0, 0.3843137, 1,
1.555236, 0.5882285, 0.8251771, 1, 0, 0.3764706, 1,
1.559497, 0.5119339, 0.2460504, 1, 0, 0.372549, 1,
1.56826, -2.111182, 2.973415, 1, 0, 0.3647059, 1,
1.594482, -1.565934, 3.448002, 1, 0, 0.3607843, 1,
1.603996, 0.2894243, 1.181784, 1, 0, 0.3529412, 1,
1.614625, -0.2567822, 1.84673, 1, 0, 0.3490196, 1,
1.62339, 0.2903514, 0.4287274, 1, 0, 0.3411765, 1,
1.628133, 0.1089631, 0.2569837, 1, 0, 0.3372549, 1,
1.629571, -0.7191771, 1.924703, 1, 0, 0.3294118, 1,
1.634866, -2.274934, 1.528339, 1, 0, 0.3254902, 1,
1.637382, 0.05856054, 2.104179, 1, 0, 0.3176471, 1,
1.637896, -0.2070703, 2.800943, 1, 0, 0.3137255, 1,
1.642422, 0.4627033, 1.004486, 1, 0, 0.3058824, 1,
1.643594, 1.184656, 1.321912, 1, 0, 0.2980392, 1,
1.658449, 0.9776331, -2.010363, 1, 0, 0.2941177, 1,
1.669101, 0.2256753, 1.114423, 1, 0, 0.2862745, 1,
1.675341, -0.9544266, 2.498163, 1, 0, 0.282353, 1,
1.679361, -0.2342689, 2.375154, 1, 0, 0.2745098, 1,
1.680013, -2.372811, 0.7037739, 1, 0, 0.2705882, 1,
1.685005, -0.6151389, 2.535192, 1, 0, 0.2627451, 1,
1.688862, 0.1852019, 0.8934262, 1, 0, 0.2588235, 1,
1.701043, -0.8479779, 2.085495, 1, 0, 0.2509804, 1,
1.733713, -0.8386793, 2.712035, 1, 0, 0.2470588, 1,
1.737785, -0.3731368, 3.392614, 1, 0, 0.2392157, 1,
1.737936, -0.6895863, 1.054431, 1, 0, 0.2352941, 1,
1.750206, -1.078492, 1.242285, 1, 0, 0.227451, 1,
1.763826, 0.8845674, 0.596442, 1, 0, 0.2235294, 1,
1.806753, -0.7517992, 1.918038, 1, 0, 0.2156863, 1,
1.809107, 1.80493, 1.568852, 1, 0, 0.2117647, 1,
1.809223, -0.3035686, 1.462164, 1, 0, 0.2039216, 1,
1.830141, -1.824935, 2.650141, 1, 0, 0.1960784, 1,
1.831142, -0.8688955, 2.601459, 1, 0, 0.1921569, 1,
1.8347, -1.593107, 2.327662, 1, 0, 0.1843137, 1,
1.891432, -2.158907, 3.076294, 1, 0, 0.1803922, 1,
1.902485, -1.066944, 1.8319, 1, 0, 0.172549, 1,
1.929875, -0.1763013, -0.009920017, 1, 0, 0.1686275, 1,
1.935511, -0.4440231, 0.9556636, 1, 0, 0.1607843, 1,
1.952632, 1.765571, -0.1976638, 1, 0, 0.1568628, 1,
1.958828, -1.018185, 1.266616, 1, 0, 0.1490196, 1,
1.962318, 0.04362072, 1.901662, 1, 0, 0.145098, 1,
1.978253, -0.9612174, 3.452049, 1, 0, 0.1372549, 1,
2.004076, -0.7613986, 1.402298, 1, 0, 0.1333333, 1,
2.029037, -0.596804, 1.873052, 1, 0, 0.1254902, 1,
2.030523, 0.7849983, 2.10905, 1, 0, 0.1215686, 1,
2.060556, -0.2631105, 0.9411206, 1, 0, 0.1137255, 1,
2.070158, 1.696606, 1.513628, 1, 0, 0.1098039, 1,
2.080441, 0.1586423, 0.7256995, 1, 0, 0.1019608, 1,
2.096538, -0.6405333, 2.519471, 1, 0, 0.09411765, 1,
2.123742, -0.2981281, 0.384401, 1, 0, 0.09019608, 1,
2.135067, -1.15856, 2.764759, 1, 0, 0.08235294, 1,
2.179244, -0.9060213, 1.023786, 1, 0, 0.07843138, 1,
2.191614, 0.1711351, 0.1589418, 1, 0, 0.07058824, 1,
2.196292, -0.339481, 2.030273, 1, 0, 0.06666667, 1,
2.256107, -0.08562793, 2.23615, 1, 0, 0.05882353, 1,
2.27154, -0.2684461, 2.691986, 1, 0, 0.05490196, 1,
2.276362, 1.017798, 2.537261, 1, 0, 0.04705882, 1,
2.355651, -0.3602813, 2.908845, 1, 0, 0.04313726, 1,
2.412834, -1.767011, 2.247324, 1, 0, 0.03529412, 1,
2.45816, -1.379211, 2.166876, 1, 0, 0.03137255, 1,
2.47189, -0.05266801, 2.772147, 1, 0, 0.02352941, 1,
2.702586, -0.732343, 0.9956514, 1, 0, 0.01960784, 1,
2.725769, -1.43583, 0.6122673, 1, 0, 0.01176471, 1,
3.071202, -1.432777, 3.19323, 1, 0, 0.007843138, 1
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
0.03371263, -4.768054, -6.804147, 0, -0.5, 0.5, 0.5,
0.03371263, -4.768054, -6.804147, 1, -0.5, 0.5, 0.5,
0.03371263, -4.768054, -6.804147, 1, 1.5, 0.5, 0.5,
0.03371263, -4.768054, -6.804147, 0, 1.5, 0.5, 0.5
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
-4.033486, -0.2799559, -6.804147, 0, -0.5, 0.5, 0.5,
-4.033486, -0.2799559, -6.804147, 1, -0.5, 0.5, 0.5,
-4.033486, -0.2799559, -6.804147, 1, 1.5, 0.5, 0.5,
-4.033486, -0.2799559, -6.804147, 0, 1.5, 0.5, 0.5
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
-4.033486, -4.768054, -0.04901409, 0, -0.5, 0.5, 0.5,
-4.033486, -4.768054, -0.04901409, 1, -0.5, 0.5, 0.5,
-4.033486, -4.768054, -0.04901409, 1, 1.5, 0.5, 0.5,
-4.033486, -4.768054, -0.04901409, 0, 1.5, 0.5, 0.5
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
-3, -3.732339, -5.24527,
3, -3.732339, -5.24527,
-3, -3.732339, -5.24527,
-3, -3.904958, -5.505083,
-2, -3.732339, -5.24527,
-2, -3.904958, -5.505083,
-1, -3.732339, -5.24527,
-1, -3.904958, -5.505083,
0, -3.732339, -5.24527,
0, -3.904958, -5.505083,
1, -3.732339, -5.24527,
1, -3.904958, -5.505083,
2, -3.732339, -5.24527,
2, -3.904958, -5.505083,
3, -3.732339, -5.24527,
3, -3.904958, -5.505083
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
-3, -4.250197, -6.024708, 0, -0.5, 0.5, 0.5,
-3, -4.250197, -6.024708, 1, -0.5, 0.5, 0.5,
-3, -4.250197, -6.024708, 1, 1.5, 0.5, 0.5,
-3, -4.250197, -6.024708, 0, 1.5, 0.5, 0.5,
-2, -4.250197, -6.024708, 0, -0.5, 0.5, 0.5,
-2, -4.250197, -6.024708, 1, -0.5, 0.5, 0.5,
-2, -4.250197, -6.024708, 1, 1.5, 0.5, 0.5,
-2, -4.250197, -6.024708, 0, 1.5, 0.5, 0.5,
-1, -4.250197, -6.024708, 0, -0.5, 0.5, 0.5,
-1, -4.250197, -6.024708, 1, -0.5, 0.5, 0.5,
-1, -4.250197, -6.024708, 1, 1.5, 0.5, 0.5,
-1, -4.250197, -6.024708, 0, 1.5, 0.5, 0.5,
0, -4.250197, -6.024708, 0, -0.5, 0.5, 0.5,
0, -4.250197, -6.024708, 1, -0.5, 0.5, 0.5,
0, -4.250197, -6.024708, 1, 1.5, 0.5, 0.5,
0, -4.250197, -6.024708, 0, 1.5, 0.5, 0.5,
1, -4.250197, -6.024708, 0, -0.5, 0.5, 0.5,
1, -4.250197, -6.024708, 1, -0.5, 0.5, 0.5,
1, -4.250197, -6.024708, 1, 1.5, 0.5, 0.5,
1, -4.250197, -6.024708, 0, 1.5, 0.5, 0.5,
2, -4.250197, -6.024708, 0, -0.5, 0.5, 0.5,
2, -4.250197, -6.024708, 1, -0.5, 0.5, 0.5,
2, -4.250197, -6.024708, 1, 1.5, 0.5, 0.5,
2, -4.250197, -6.024708, 0, 1.5, 0.5, 0.5,
3, -4.250197, -6.024708, 0, -0.5, 0.5, 0.5,
3, -4.250197, -6.024708, 1, -0.5, 0.5, 0.5,
3, -4.250197, -6.024708, 1, 1.5, 0.5, 0.5,
3, -4.250197, -6.024708, 0, 1.5, 0.5, 0.5
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
-3.094902, -3, -5.24527,
-3.094902, 3, -5.24527,
-3.094902, -3, -5.24527,
-3.251333, -3, -5.505083,
-3.094902, -2, -5.24527,
-3.251333, -2, -5.505083,
-3.094902, -1, -5.24527,
-3.251333, -1, -5.505083,
-3.094902, 0, -5.24527,
-3.251333, 0, -5.505083,
-3.094902, 1, -5.24527,
-3.251333, 1, -5.505083,
-3.094902, 2, -5.24527,
-3.251333, 2, -5.505083,
-3.094902, 3, -5.24527,
-3.251333, 3, -5.505083
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
-3.564194, -3, -6.024708, 0, -0.5, 0.5, 0.5,
-3.564194, -3, -6.024708, 1, -0.5, 0.5, 0.5,
-3.564194, -3, -6.024708, 1, 1.5, 0.5, 0.5,
-3.564194, -3, -6.024708, 0, 1.5, 0.5, 0.5,
-3.564194, -2, -6.024708, 0, -0.5, 0.5, 0.5,
-3.564194, -2, -6.024708, 1, -0.5, 0.5, 0.5,
-3.564194, -2, -6.024708, 1, 1.5, 0.5, 0.5,
-3.564194, -2, -6.024708, 0, 1.5, 0.5, 0.5,
-3.564194, -1, -6.024708, 0, -0.5, 0.5, 0.5,
-3.564194, -1, -6.024708, 1, -0.5, 0.5, 0.5,
-3.564194, -1, -6.024708, 1, 1.5, 0.5, 0.5,
-3.564194, -1, -6.024708, 0, 1.5, 0.5, 0.5,
-3.564194, 0, -6.024708, 0, -0.5, 0.5, 0.5,
-3.564194, 0, -6.024708, 1, -0.5, 0.5, 0.5,
-3.564194, 0, -6.024708, 1, 1.5, 0.5, 0.5,
-3.564194, 0, -6.024708, 0, 1.5, 0.5, 0.5,
-3.564194, 1, -6.024708, 0, -0.5, 0.5, 0.5,
-3.564194, 1, -6.024708, 1, -0.5, 0.5, 0.5,
-3.564194, 1, -6.024708, 1, 1.5, 0.5, 0.5,
-3.564194, 1, -6.024708, 0, 1.5, 0.5, 0.5,
-3.564194, 2, -6.024708, 0, -0.5, 0.5, 0.5,
-3.564194, 2, -6.024708, 1, -0.5, 0.5, 0.5,
-3.564194, 2, -6.024708, 1, 1.5, 0.5, 0.5,
-3.564194, 2, -6.024708, 0, 1.5, 0.5, 0.5,
-3.564194, 3, -6.024708, 0, -0.5, 0.5, 0.5,
-3.564194, 3, -6.024708, 1, -0.5, 0.5, 0.5,
-3.564194, 3, -6.024708, 1, 1.5, 0.5, 0.5,
-3.564194, 3, -6.024708, 0, 1.5, 0.5, 0.5
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
-3.094902, -3.732339, -4,
-3.094902, -3.732339, 4,
-3.094902, -3.732339, -4,
-3.251333, -3.904958, -4,
-3.094902, -3.732339, -2,
-3.251333, -3.904958, -2,
-3.094902, -3.732339, 0,
-3.251333, -3.904958, 0,
-3.094902, -3.732339, 2,
-3.251333, -3.904958, 2,
-3.094902, -3.732339, 4,
-3.251333, -3.904958, 4
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
-3.564194, -4.250197, -4, 0, -0.5, 0.5, 0.5,
-3.564194, -4.250197, -4, 1, -0.5, 0.5, 0.5,
-3.564194, -4.250197, -4, 1, 1.5, 0.5, 0.5,
-3.564194, -4.250197, -4, 0, 1.5, 0.5, 0.5,
-3.564194, -4.250197, -2, 0, -0.5, 0.5, 0.5,
-3.564194, -4.250197, -2, 1, -0.5, 0.5, 0.5,
-3.564194, -4.250197, -2, 1, 1.5, 0.5, 0.5,
-3.564194, -4.250197, -2, 0, 1.5, 0.5, 0.5,
-3.564194, -4.250197, 0, 0, -0.5, 0.5, 0.5,
-3.564194, -4.250197, 0, 1, -0.5, 0.5, 0.5,
-3.564194, -4.250197, 0, 1, 1.5, 0.5, 0.5,
-3.564194, -4.250197, 0, 0, 1.5, 0.5, 0.5,
-3.564194, -4.250197, 2, 0, -0.5, 0.5, 0.5,
-3.564194, -4.250197, 2, 1, -0.5, 0.5, 0.5,
-3.564194, -4.250197, 2, 1, 1.5, 0.5, 0.5,
-3.564194, -4.250197, 2, 0, 1.5, 0.5, 0.5,
-3.564194, -4.250197, 4, 0, -0.5, 0.5, 0.5,
-3.564194, -4.250197, 4, 1, -0.5, 0.5, 0.5,
-3.564194, -4.250197, 4, 1, 1.5, 0.5, 0.5,
-3.564194, -4.250197, 4, 0, 1.5, 0.5, 0.5
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
-3.094902, -3.732339, -5.24527,
-3.094902, 3.172428, -5.24527,
-3.094902, -3.732339, 5.147242,
-3.094902, 3.172428, 5.147242,
-3.094902, -3.732339, -5.24527,
-3.094902, -3.732339, 5.147242,
-3.094902, 3.172428, -5.24527,
-3.094902, 3.172428, 5.147242,
-3.094902, -3.732339, -5.24527,
3.162327, -3.732339, -5.24527,
-3.094902, -3.732339, 5.147242,
3.162327, -3.732339, 5.147242,
-3.094902, 3.172428, -5.24527,
3.162327, 3.172428, -5.24527,
-3.094902, 3.172428, 5.147242,
3.162327, 3.172428, 5.147242,
3.162327, -3.732339, -5.24527,
3.162327, 3.172428, -5.24527,
3.162327, -3.732339, 5.147242,
3.162327, 3.172428, 5.147242,
3.162327, -3.732339, -5.24527,
3.162327, -3.732339, 5.147242,
3.162327, 3.172428, -5.24527,
3.162327, 3.172428, 5.147242
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
var radius = 7.45344;
var distance = 33.16119;
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
mvMatrix.translate( -0.03371263, 0.2799559, 0.04901409 );
mvMatrix.scale( 1.287919, 1.167136, 0.7754434 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.16119);
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


