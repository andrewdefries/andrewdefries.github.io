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
-2.829821, 0.6382744, -1.202591, 1, 0, 0, 1,
-2.818208, 0.8837757, 0.4629992, 1, 0.007843138, 0, 1,
-2.679893, 0.2110783, -0.6353149, 1, 0.01176471, 0, 1,
-2.440041, 1.365797, -1.911862, 1, 0.01960784, 0, 1,
-2.366471, 0.1698366, -3.625425, 1, 0.02352941, 0, 1,
-2.317272, -0.05010806, -1.955194, 1, 0.03137255, 0, 1,
-2.267245, 0.3072043, -2.5513, 1, 0.03529412, 0, 1,
-2.225067, -0.9715316, -3.423648, 1, 0.04313726, 0, 1,
-2.223645, 0.4311199, -1.032481, 1, 0.04705882, 0, 1,
-2.199707, 0.07355457, -1.545907, 1, 0.05490196, 0, 1,
-2.192193, 0.2266268, -0.3964576, 1, 0.05882353, 0, 1,
-2.159297, 0.2368936, -2.539201, 1, 0.06666667, 0, 1,
-2.147132, 0.4533559, -1.305337, 1, 0.07058824, 0, 1,
-2.111998, -0.7702963, -1.804171, 1, 0.07843138, 0, 1,
-2.091024, 3.658486, -1.561208, 1, 0.08235294, 0, 1,
-2.018153, -0.6058844, -2.030544, 1, 0.09019608, 0, 1,
-1.999214, 0.9516619, -0.7911181, 1, 0.09411765, 0, 1,
-1.989014, -0.01274117, -1.204229, 1, 0.1019608, 0, 1,
-1.973402, -2.013342, -1.721556, 1, 0.1098039, 0, 1,
-1.972809, -0.4516844, -4.368511, 1, 0.1137255, 0, 1,
-1.961721, -0.5028769, -3.024406, 1, 0.1215686, 0, 1,
-1.943961, 1.17798, -0.4831968, 1, 0.1254902, 0, 1,
-1.941391, 0.522993, -2.782218, 1, 0.1333333, 0, 1,
-1.930667, 1.78027, -1.078901, 1, 0.1372549, 0, 1,
-1.896512, 0.1521961, -1.411247, 1, 0.145098, 0, 1,
-1.868746, 0.5127559, -1.079193, 1, 0.1490196, 0, 1,
-1.86663, 0.7340297, -1.500942, 1, 0.1568628, 0, 1,
-1.826614, 0.1426467, -1.176982, 1, 0.1607843, 0, 1,
-1.823022, 1.552717, -2.400202, 1, 0.1686275, 0, 1,
-1.797869, 1.059213, -2.385431, 1, 0.172549, 0, 1,
-1.790684, -0.7605737, -4.066784, 1, 0.1803922, 0, 1,
-1.787911, -1.246915, -2.605572, 1, 0.1843137, 0, 1,
-1.783938, -1.139713, -3.091292, 1, 0.1921569, 0, 1,
-1.781955, 0.3354039, -1.502085, 1, 0.1960784, 0, 1,
-1.768143, 0.8862376, -1.011347, 1, 0.2039216, 0, 1,
-1.753347, 1.634486, -0.3780712, 1, 0.2117647, 0, 1,
-1.747438, 1.020734, -1.795415, 1, 0.2156863, 0, 1,
-1.746117, 1.756422, -1.316698, 1, 0.2235294, 0, 1,
-1.712388, 0.6612239, -2.87437, 1, 0.227451, 0, 1,
-1.706573, 0.6395847, 0.885675, 1, 0.2352941, 0, 1,
-1.678196, -0.6926214, -1.345525, 1, 0.2392157, 0, 1,
-1.677078, -0.08241333, -0.8035102, 1, 0.2470588, 0, 1,
-1.670926, -2.110513, -2.232064, 1, 0.2509804, 0, 1,
-1.662167, -0.4693279, -2.673414, 1, 0.2588235, 0, 1,
-1.660061, -0.3747463, -2.358561, 1, 0.2627451, 0, 1,
-1.658528, 0.2170988, -1.845764, 1, 0.2705882, 0, 1,
-1.653535, 0.5236678, -0.04716771, 1, 0.2745098, 0, 1,
-1.646538, 1.696503, 0.4283487, 1, 0.282353, 0, 1,
-1.63624, -0.7652143, -0.6416394, 1, 0.2862745, 0, 1,
-1.631921, 1.656773, -1.846196, 1, 0.2941177, 0, 1,
-1.627226, 0.9634494, -1.6399, 1, 0.3019608, 0, 1,
-1.619824, -0.2541482, -2.845167, 1, 0.3058824, 0, 1,
-1.618673, -0.3268349, -3.417577, 1, 0.3137255, 0, 1,
-1.617536, -0.004279125, -1.665852, 1, 0.3176471, 0, 1,
-1.610687, -0.215511, -1.477926, 1, 0.3254902, 0, 1,
-1.602805, -0.7209675, -1.41834, 1, 0.3294118, 0, 1,
-1.58908, -0.6557333, -2.148208, 1, 0.3372549, 0, 1,
-1.582632, 0.2191795, -1.857283, 1, 0.3411765, 0, 1,
-1.580256, -0.159799, -1.230948, 1, 0.3490196, 0, 1,
-1.579658, 0.6604989, 0.1846446, 1, 0.3529412, 0, 1,
-1.578277, 0.5461816, 0.008036095, 1, 0.3607843, 0, 1,
-1.573414, 0.5018122, -2.273896, 1, 0.3647059, 0, 1,
-1.542133, -0.5717061, -1.000116, 1, 0.372549, 0, 1,
-1.540922, 2.128537, 0.6064795, 1, 0.3764706, 0, 1,
-1.537354, -1.760363, -2.111373, 1, 0.3843137, 0, 1,
-1.530868, -0.8016024, -1.371664, 1, 0.3882353, 0, 1,
-1.529847, -0.5351934, -1.473772, 1, 0.3960784, 0, 1,
-1.519543, -0.1319811, -1.665125, 1, 0.4039216, 0, 1,
-1.514858, -0.7158579, -2.735005, 1, 0.4078431, 0, 1,
-1.494008, -0.7995878, -2.256245, 1, 0.4156863, 0, 1,
-1.489879, 0.1342593, -1.457397, 1, 0.4196078, 0, 1,
-1.476522, -0.8450813, -3.295624, 1, 0.427451, 0, 1,
-1.469462, -1.73316, -4.247824, 1, 0.4313726, 0, 1,
-1.467641, 0.9413389, 0.1326102, 1, 0.4392157, 0, 1,
-1.465936, -0.2853608, -1.718214, 1, 0.4431373, 0, 1,
-1.465214, 0.7035984, 0.447364, 1, 0.4509804, 0, 1,
-1.461512, -2.576111, -4.162339, 1, 0.454902, 0, 1,
-1.46096, -0.662581, -0.9694251, 1, 0.4627451, 0, 1,
-1.44933, 0.6717027, -0.04879982, 1, 0.4666667, 0, 1,
-1.446736, 0.8211372, -1.877828, 1, 0.4745098, 0, 1,
-1.446121, 0.5138861, 0.1197661, 1, 0.4784314, 0, 1,
-1.426656, 0.7427972, -1.621292, 1, 0.4862745, 0, 1,
-1.425614, 0.8426849, -1.599597, 1, 0.4901961, 0, 1,
-1.424911, 0.6331556, -0.5450855, 1, 0.4980392, 0, 1,
-1.408222, -0.614882, -1.21485, 1, 0.5058824, 0, 1,
-1.403258, 0.8484103, -1.687849, 1, 0.509804, 0, 1,
-1.395091, -0.1528004, -1.844682, 1, 0.5176471, 0, 1,
-1.369908, 1.342767, -0.8333853, 1, 0.5215687, 0, 1,
-1.360067, -0.6956535, -2.938547, 1, 0.5294118, 0, 1,
-1.349952, 1.004303, -0.5666861, 1, 0.5333334, 0, 1,
-1.348002, 0.05592911, -0.477583, 1, 0.5411765, 0, 1,
-1.341961, 2.00118, -0.4557077, 1, 0.5450981, 0, 1,
-1.34161, -2.009914, -1.895216, 1, 0.5529412, 0, 1,
-1.330022, -1.591735, -4.777414, 1, 0.5568628, 0, 1,
-1.329639, -0.8366991, -1.750145, 1, 0.5647059, 0, 1,
-1.325055, -1.558487, -1.391229, 1, 0.5686275, 0, 1,
-1.321011, -0.0849541, -1.569157, 1, 0.5764706, 0, 1,
-1.319291, -1.199767, -3.573804, 1, 0.5803922, 0, 1,
-1.315419, 0.3880989, -1.677978, 1, 0.5882353, 0, 1,
-1.312645, -0.5509416, -1.877596, 1, 0.5921569, 0, 1,
-1.310916, 0.8815361, -2.032316, 1, 0.6, 0, 1,
-1.305577, -0.4721151, -1.188081, 1, 0.6078432, 0, 1,
-1.294021, -0.4931276, -1.626383, 1, 0.6117647, 0, 1,
-1.29384, -0.1243789, 0.2772144, 1, 0.6196079, 0, 1,
-1.285093, 0.1457545, -1.696187, 1, 0.6235294, 0, 1,
-1.280847, -1.009557, -1.516315, 1, 0.6313726, 0, 1,
-1.277884, 2.244825, 0.1453078, 1, 0.6352941, 0, 1,
-1.27734, 0.2922628, -1.394593, 1, 0.6431373, 0, 1,
-1.268499, -0.5754605, -1.274697, 1, 0.6470588, 0, 1,
-1.266388, -0.2470546, -1.709975, 1, 0.654902, 0, 1,
-1.255126, 0.3085986, -2.611859, 1, 0.6588235, 0, 1,
-1.252312, -0.3009555, -2.393298, 1, 0.6666667, 0, 1,
-1.251066, -1.625724, -5.005644, 1, 0.6705883, 0, 1,
-1.238134, 1.016698, -0.4979835, 1, 0.6784314, 0, 1,
-1.230852, 0.7747186, -1.867437, 1, 0.682353, 0, 1,
-1.229625, 1.37255, -2.069987, 1, 0.6901961, 0, 1,
-1.227809, -0.2885286, -1.160458, 1, 0.6941177, 0, 1,
-1.221951, -2.347625, -3.242549, 1, 0.7019608, 0, 1,
-1.212847, 1.218692, -1.628426, 1, 0.7098039, 0, 1,
-1.210364, 2.075464, -0.7828532, 1, 0.7137255, 0, 1,
-1.192222, -1.601705, -4.620327, 1, 0.7215686, 0, 1,
-1.190892, 0.6852289, -2.116565, 1, 0.7254902, 0, 1,
-1.186201, -1.475927, -3.472451, 1, 0.7333333, 0, 1,
-1.183852, -0.2915157, -0.9703462, 1, 0.7372549, 0, 1,
-1.18296, 0.427513, 0.600961, 1, 0.7450981, 0, 1,
-1.16666, 0.1160476, 0.02872759, 1, 0.7490196, 0, 1,
-1.156012, 2.401708, -0.3504167, 1, 0.7568628, 0, 1,
-1.147246, 1.383625, 0.5528604, 1, 0.7607843, 0, 1,
-1.13736, 0.5616239, -0.6635748, 1, 0.7686275, 0, 1,
-1.136541, -1.463269, -1.991999, 1, 0.772549, 0, 1,
-1.1348, -1.869438, -2.94618, 1, 0.7803922, 0, 1,
-1.132172, -2.527513, -4.905131, 1, 0.7843137, 0, 1,
-1.1276, -0.4393258, -0.8377085, 1, 0.7921569, 0, 1,
-1.119778, -0.6717805, -3.568135, 1, 0.7960784, 0, 1,
-1.118711, -0.1413665, -1.738793, 1, 0.8039216, 0, 1,
-1.11824, -0.5961115, -0.1807545, 1, 0.8117647, 0, 1,
-1.11799, -1.4964, -2.176538, 1, 0.8156863, 0, 1,
-1.109876, -0.3088924, -2.085952, 1, 0.8235294, 0, 1,
-1.10817, -1.077518, -3.964861, 1, 0.827451, 0, 1,
-1.104659, -2.548493, -2.590757, 1, 0.8352941, 0, 1,
-1.100991, -1.982653, -2.75397, 1, 0.8392157, 0, 1,
-1.092897, -1.809743, -2.379803, 1, 0.8470588, 0, 1,
-1.092213, 0.3129435, -1.168657, 1, 0.8509804, 0, 1,
-1.088841, 0.9807547, -0.4256021, 1, 0.8588235, 0, 1,
-1.083364, -0.9209637, -3.667779, 1, 0.8627451, 0, 1,
-1.082199, -0.4211842, 0.3489116, 1, 0.8705882, 0, 1,
-1.081888, 0.7776899, -1.318935, 1, 0.8745098, 0, 1,
-1.081647, -0.06187991, -2.140211, 1, 0.8823529, 0, 1,
-1.074808, 1.10827, -0.9324265, 1, 0.8862745, 0, 1,
-1.073747, 0.0388125, -0.4878736, 1, 0.8941177, 0, 1,
-1.073201, 1.473877, -0.9674464, 1, 0.8980392, 0, 1,
-1.063268, 0.5194293, -0.3877614, 1, 0.9058824, 0, 1,
-1.061016, 1.055175, -2.067054, 1, 0.9137255, 0, 1,
-1.059545, -0.5338574, -3.762011, 1, 0.9176471, 0, 1,
-1.058553, 1.802411, -0.7917213, 1, 0.9254902, 0, 1,
-1.053244, 0.205026, 0.03302628, 1, 0.9294118, 0, 1,
-1.045629, 0.9397327, 0.05629933, 1, 0.9372549, 0, 1,
-1.045543, -0.6411802, -2.389647, 1, 0.9411765, 0, 1,
-1.044373, -0.296791, -1.443107, 1, 0.9490196, 0, 1,
-1.030554, 1.634611, -0.5147734, 1, 0.9529412, 0, 1,
-1.027221, 0.4549834, -0.9342391, 1, 0.9607843, 0, 1,
-1.022176, -0.7787721, -2.922331, 1, 0.9647059, 0, 1,
-1.021569, 0.6507625, 1.364904, 1, 0.972549, 0, 1,
-1.003388, 0.4920099, -0.7372787, 1, 0.9764706, 0, 1,
-1.000176, -0.2692865, -2.598326, 1, 0.9843137, 0, 1,
-0.997813, -0.8792991, -3.020319, 1, 0.9882353, 0, 1,
-0.9922208, 1.276304, -0.3813984, 1, 0.9960784, 0, 1,
-0.9879901, -0.7704452, -1.804034, 0.9960784, 1, 0, 1,
-0.9850361, -1.766175, -2.016909, 0.9921569, 1, 0, 1,
-0.9766957, -0.412117, -3.974968, 0.9843137, 1, 0, 1,
-0.9693781, 0.1703537, 0.2724161, 0.9803922, 1, 0, 1,
-0.9600053, 0.6182853, -1.060263, 0.972549, 1, 0, 1,
-0.9518335, -1.246104, -2.958713, 0.9686275, 1, 0, 1,
-0.9489456, -0.9519314, -2.564145, 0.9607843, 1, 0, 1,
-0.9477193, -0.7499403, -0.2947471, 0.9568627, 1, 0, 1,
-0.9475367, -0.3154307, -2.948522, 0.9490196, 1, 0, 1,
-0.9371414, 1.269427, -0.1913486, 0.945098, 1, 0, 1,
-0.9360017, 0.6993443, -0.09084841, 0.9372549, 1, 0, 1,
-0.9351347, -0.9377037, -3.012408, 0.9333333, 1, 0, 1,
-0.9325013, 0.4236533, 0.3238961, 0.9254902, 1, 0, 1,
-0.9300962, -0.01419428, -0.6890951, 0.9215686, 1, 0, 1,
-0.9276543, 1.05893, -1.412188, 0.9137255, 1, 0, 1,
-0.9226234, 1.0805, -3.20823, 0.9098039, 1, 0, 1,
-0.9216067, -1.094453, -1.306594, 0.9019608, 1, 0, 1,
-0.9187819, -0.319508, -2.937974, 0.8941177, 1, 0, 1,
-0.9091921, 0.8707956, -1.565339, 0.8901961, 1, 0, 1,
-0.9085885, 1.200834, 0.7151207, 0.8823529, 1, 0, 1,
-0.9026379, 0.8950504, -0.8612663, 0.8784314, 1, 0, 1,
-0.8977128, 0.9074855, -0.4107972, 0.8705882, 1, 0, 1,
-0.8919533, -0.7288303, -1.932485, 0.8666667, 1, 0, 1,
-0.8916297, -0.2553967, -0.2998525, 0.8588235, 1, 0, 1,
-0.8910341, -2.326371, -1.379723, 0.854902, 1, 0, 1,
-0.8884227, 0.6526136, -1.842047, 0.8470588, 1, 0, 1,
-0.8844973, -0.5195505, -2.64752, 0.8431373, 1, 0, 1,
-0.8799626, 0.7342502, 0.3202038, 0.8352941, 1, 0, 1,
-0.8755623, 0.5518094, -0.8147436, 0.8313726, 1, 0, 1,
-0.873886, 0.7951882, -1.48254, 0.8235294, 1, 0, 1,
-0.8668507, 1.356848, -1.504515, 0.8196079, 1, 0, 1,
-0.8639936, 0.2543904, 0.2601924, 0.8117647, 1, 0, 1,
-0.8621256, 1.050264, -1.949211, 0.8078431, 1, 0, 1,
-0.8578163, 1.703831, -0.6598585, 0.8, 1, 0, 1,
-0.857149, 0.8450198, -1.670431, 0.7921569, 1, 0, 1,
-0.853443, 0.4740468, -2.364166, 0.7882353, 1, 0, 1,
-0.8469502, 0.8707966, -1.515926, 0.7803922, 1, 0, 1,
-0.8461763, 0.5552278, -0.9541318, 0.7764706, 1, 0, 1,
-0.8430014, 0.3572322, -0.2653228, 0.7686275, 1, 0, 1,
-0.8308156, 1.452981, -2.472025, 0.7647059, 1, 0, 1,
-0.8220962, 1.029097, -0.3794059, 0.7568628, 1, 0, 1,
-0.8195179, -1.198764, -2.627023, 0.7529412, 1, 0, 1,
-0.8182876, 0.5255534, -1.241456, 0.7450981, 1, 0, 1,
-0.8164243, -1.130945, -2.595153, 0.7411765, 1, 0, 1,
-0.8160099, 0.2303876, -2.444013, 0.7333333, 1, 0, 1,
-0.8076036, -2.76414, -3.20758, 0.7294118, 1, 0, 1,
-0.8061858, -0.4331656, 0.1968165, 0.7215686, 1, 0, 1,
-0.8054317, -0.198815, -2.469751, 0.7176471, 1, 0, 1,
-0.7994269, 0.08555205, -1.519262, 0.7098039, 1, 0, 1,
-0.7987209, -0.3907005, -3.021816, 0.7058824, 1, 0, 1,
-0.7978484, -0.1190345, -3.075711, 0.6980392, 1, 0, 1,
-0.7976974, 0.7736521, -0.4698285, 0.6901961, 1, 0, 1,
-0.7950144, 0.9680503, -1.647205, 0.6862745, 1, 0, 1,
-0.7931303, -0.03321031, -0.6226302, 0.6784314, 1, 0, 1,
-0.7912193, -1.20612, -1.826083, 0.6745098, 1, 0, 1,
-0.7900784, 0.1845554, -1.313929, 0.6666667, 1, 0, 1,
-0.789866, 0.2860727, -0.8502531, 0.6627451, 1, 0, 1,
-0.7886223, 0.5451968, -1.396816, 0.654902, 1, 0, 1,
-0.7873588, -1.09238, -1.283954, 0.6509804, 1, 0, 1,
-0.787353, -1.487105, -3.401331, 0.6431373, 1, 0, 1,
-0.7852268, 0.4262344, -0.08599028, 0.6392157, 1, 0, 1,
-0.7851185, 0.007143158, -1.952649, 0.6313726, 1, 0, 1,
-0.7784202, 0.4253153, -1.734427, 0.627451, 1, 0, 1,
-0.7782778, 0.5270623, -1.043819, 0.6196079, 1, 0, 1,
-0.7710885, 2.320466, -0.1744178, 0.6156863, 1, 0, 1,
-0.7665025, -0.2553191, -0.7379718, 0.6078432, 1, 0, 1,
-0.7645643, -1.19388, -2.998989, 0.6039216, 1, 0, 1,
-0.7617756, -1.255273, -2.355141, 0.5960785, 1, 0, 1,
-0.7605929, 0.194477, -0.5724456, 0.5882353, 1, 0, 1,
-0.7592263, -0.3444405, -2.176256, 0.5843138, 1, 0, 1,
-0.7479051, 1.730433, -0.9247131, 0.5764706, 1, 0, 1,
-0.7447898, -2.250556, -1.17279, 0.572549, 1, 0, 1,
-0.7402018, -2.085178, -3.155028, 0.5647059, 1, 0, 1,
-0.736782, -0.3026243, -1.952746, 0.5607843, 1, 0, 1,
-0.7332571, -0.07796856, -0.6953362, 0.5529412, 1, 0, 1,
-0.7294916, -0.07763551, -2.306189, 0.5490196, 1, 0, 1,
-0.7256518, -0.6317577, -1.073875, 0.5411765, 1, 0, 1,
-0.7240223, 0.4165255, -2.578366, 0.5372549, 1, 0, 1,
-0.7205923, 0.3858735, 0.297083, 0.5294118, 1, 0, 1,
-0.7193677, 0.7070332, -1.554338, 0.5254902, 1, 0, 1,
-0.7123731, 0.1617806, -0.0826043, 0.5176471, 1, 0, 1,
-0.7102425, -1.297937, -2.434294, 0.5137255, 1, 0, 1,
-0.7082434, -1.454573, -2.176178, 0.5058824, 1, 0, 1,
-0.7080999, -0.1010298, -0.8302177, 0.5019608, 1, 0, 1,
-0.7078553, -0.4669054, -2.786102, 0.4941176, 1, 0, 1,
-0.70568, 1.188762, -0.678486, 0.4862745, 1, 0, 1,
-0.7047228, 0.7260858, 0.1156156, 0.4823529, 1, 0, 1,
-0.7042088, 1.263145, -0.4170389, 0.4745098, 1, 0, 1,
-0.6983371, 3.213399, -1.407033, 0.4705882, 1, 0, 1,
-0.6969428, -1.098205, -3.709187, 0.4627451, 1, 0, 1,
-0.6839442, 0.3854626, -1.084709, 0.4588235, 1, 0, 1,
-0.6794459, 1.6331, -1.846389, 0.4509804, 1, 0, 1,
-0.678993, 0.3701828, -1.28403, 0.4470588, 1, 0, 1,
-0.6756471, 1.423802, 0.6471593, 0.4392157, 1, 0, 1,
-0.6727707, -0.16539, -1.07697, 0.4352941, 1, 0, 1,
-0.666168, 0.4468776, 0.7756215, 0.427451, 1, 0, 1,
-0.6603488, 0.6832196, -0.3299142, 0.4235294, 1, 0, 1,
-0.6582384, 0.7797434, 0.2169106, 0.4156863, 1, 0, 1,
-0.6582264, 0.669931, -0.8912467, 0.4117647, 1, 0, 1,
-0.6580697, -0.1877172, -2.858135, 0.4039216, 1, 0, 1,
-0.6561133, 0.9797292, 0.1804766, 0.3960784, 1, 0, 1,
-0.6542253, 1.437034, -0.1974507, 0.3921569, 1, 0, 1,
-0.6532062, -0.1336714, -1.257224, 0.3843137, 1, 0, 1,
-0.6523498, -0.01159289, -2.121602, 0.3803922, 1, 0, 1,
-0.6509145, 1.325432, -0.7732238, 0.372549, 1, 0, 1,
-0.6503036, -1.962382, -1.933952, 0.3686275, 1, 0, 1,
-0.6467952, -0.609812, -2.086255, 0.3607843, 1, 0, 1,
-0.6409305, 0.6718231, -1.559507, 0.3568628, 1, 0, 1,
-0.6403224, 0.8195517, -0.7120844, 0.3490196, 1, 0, 1,
-0.6367455, -0.01844092, -1.61351, 0.345098, 1, 0, 1,
-0.6280023, -0.1939053, -1.103943, 0.3372549, 1, 0, 1,
-0.6276272, 0.3662946, -0.1825768, 0.3333333, 1, 0, 1,
-0.6255831, -1.125717, -3.036682, 0.3254902, 1, 0, 1,
-0.6186258, -1.513223, -4.658195, 0.3215686, 1, 0, 1,
-0.6172787, 0.4494808, -2.53229, 0.3137255, 1, 0, 1,
-0.6134936, -0.5382711, -2.025366, 0.3098039, 1, 0, 1,
-0.6062799, -0.413073, -3.64018, 0.3019608, 1, 0, 1,
-0.605353, 1.097933, -1.755988, 0.2941177, 1, 0, 1,
-0.6051614, -0.6305413, -3.127991, 0.2901961, 1, 0, 1,
-0.6050532, 2.252857, 0.01666437, 0.282353, 1, 0, 1,
-0.6013058, 0.4150833, -0.4854325, 0.2784314, 1, 0, 1,
-0.5914189, 1.067542, 0.8485676, 0.2705882, 1, 0, 1,
-0.5912983, -1.786188, -3.428961, 0.2666667, 1, 0, 1,
-0.5894673, -0.9233659, -4.138331, 0.2588235, 1, 0, 1,
-0.5823418, -0.6628, -2.72104, 0.254902, 1, 0, 1,
-0.5789468, -0.5325007, -2.764405, 0.2470588, 1, 0, 1,
-0.5782638, -0.2406979, -0.2834713, 0.2431373, 1, 0, 1,
-0.5778053, 0.9869921, -0.04857004, 0.2352941, 1, 0, 1,
-0.5762798, 1.669661, -0.7910723, 0.2313726, 1, 0, 1,
-0.5731503, -0.8275626, -0.8805402, 0.2235294, 1, 0, 1,
-0.5718383, 1.017482, -3.521207, 0.2196078, 1, 0, 1,
-0.5683917, -0.3044973, -0.8529966, 0.2117647, 1, 0, 1,
-0.5638989, -0.2775922, -2.535879, 0.2078431, 1, 0, 1,
-0.5629659, 0.5900655, -2.718812, 0.2, 1, 0, 1,
-0.5622355, 1.336479, 0.2343087, 0.1921569, 1, 0, 1,
-0.5581154, 0.2323374, -1.074376, 0.1882353, 1, 0, 1,
-0.5565051, 0.3918129, -1.776637, 0.1803922, 1, 0, 1,
-0.5503874, 0.3482229, -1.086035, 0.1764706, 1, 0, 1,
-0.5492994, 1.921508, 0.2625873, 0.1686275, 1, 0, 1,
-0.5472304, -0.06561793, -2.498045, 0.1647059, 1, 0, 1,
-0.5472065, 1.169126, 0.2144543, 0.1568628, 1, 0, 1,
-0.5441868, -1.179224, -3.043073, 0.1529412, 1, 0, 1,
-0.5438117, 1.20544, 0.5411217, 0.145098, 1, 0, 1,
-0.5432045, 0.5280673, 0.8396417, 0.1411765, 1, 0, 1,
-0.5401866, 0.04457863, -1.106705, 0.1333333, 1, 0, 1,
-0.5316073, -0.1186757, -4.073827, 0.1294118, 1, 0, 1,
-0.5206447, -0.3545396, -2.674335, 0.1215686, 1, 0, 1,
-0.5173427, -0.3489571, -1.898264, 0.1176471, 1, 0, 1,
-0.5140291, -1.539418, -3.487402, 0.1098039, 1, 0, 1,
-0.506337, 0.2080894, -1.560255, 0.1058824, 1, 0, 1,
-0.5062808, 0.6951056, -2.337033, 0.09803922, 1, 0, 1,
-0.5028568, -0.9277883, -1.736183, 0.09019608, 1, 0, 1,
-0.5017875, 0.7212738, -0.01825041, 0.08627451, 1, 0, 1,
-0.5016398, -0.5124065, -3.230328, 0.07843138, 1, 0, 1,
-0.5007446, 0.5235117, -0.1583328, 0.07450981, 1, 0, 1,
-0.4944275, 0.9919286, -0.8143641, 0.06666667, 1, 0, 1,
-0.4938367, -0.2121359, 1.05284, 0.0627451, 1, 0, 1,
-0.484787, 1.637428, 0.930688, 0.05490196, 1, 0, 1,
-0.4823985, -1.889146, -2.060802, 0.05098039, 1, 0, 1,
-0.4791311, 0.8590887, 0.01106229, 0.04313726, 1, 0, 1,
-0.4767017, 0.9062774, -1.105389, 0.03921569, 1, 0, 1,
-0.4720876, -0.8487853, -3.118042, 0.03137255, 1, 0, 1,
-0.4705852, -0.1706342, -1.05406, 0.02745098, 1, 0, 1,
-0.4703853, 1.31053, 0.7467611, 0.01960784, 1, 0, 1,
-0.4693049, -1.695237, -3.42574, 0.01568628, 1, 0, 1,
-0.4684535, 0.5038339, -1.416016, 0.007843138, 1, 0, 1,
-0.4672106, -0.2100372, -1.974227, 0.003921569, 1, 0, 1,
-0.4654115, 0.2111587, 0.03061297, 0, 1, 0.003921569, 1,
-0.4649157, -1.540073, -1.48796, 0, 1, 0.01176471, 1,
-0.4617501, 0.140946, -2.115221, 0, 1, 0.01568628, 1,
-0.4571198, 0.5793704, -1.204459, 0, 1, 0.02352941, 1,
-0.456495, 0.7278573, 0.247308, 0, 1, 0.02745098, 1,
-0.4561188, 0.05051769, -2.112193, 0, 1, 0.03529412, 1,
-0.4524918, -1.489874, -3.282635, 0, 1, 0.03921569, 1,
-0.451106, 0.1693847, -0.722894, 0, 1, 0.04705882, 1,
-0.4494826, -0.07549916, -0.2181713, 0, 1, 0.05098039, 1,
-0.4489466, -1.252163, -2.879797, 0, 1, 0.05882353, 1,
-0.4487751, 0.4365656, -0.4535787, 0, 1, 0.0627451, 1,
-0.4487747, 0.4752784, -2.325349, 0, 1, 0.07058824, 1,
-0.4487297, -0.9236093, -2.10452, 0, 1, 0.07450981, 1,
-0.4486293, -0.5675411, -1.237454, 0, 1, 0.08235294, 1,
-0.4484221, 0.6971024, -1.171037, 0, 1, 0.08627451, 1,
-0.4386739, -0.7277113, -0.735038, 0, 1, 0.09411765, 1,
-0.4374082, -0.4959849, -3.00616, 0, 1, 0.1019608, 1,
-0.4322388, 1.31237, 1.738394, 0, 1, 0.1058824, 1,
-0.4319084, -0.4465051, -3.524167, 0, 1, 0.1137255, 1,
-0.427936, 0.1222309, -3.021335, 0, 1, 0.1176471, 1,
-0.4265981, -0.5878943, -1.77326, 0, 1, 0.1254902, 1,
-0.423843, 0.4691638, -1.404191, 0, 1, 0.1294118, 1,
-0.4225244, -0.8869856, -0.9321062, 0, 1, 0.1372549, 1,
-0.4198518, 1.41096, -0.2039313, 0, 1, 0.1411765, 1,
-0.4177696, -2.841522, -4.669577, 0, 1, 0.1490196, 1,
-0.4170956, -0.7019826, -2.186008, 0, 1, 0.1529412, 1,
-0.4169304, -1.849424, -2.620072, 0, 1, 0.1607843, 1,
-0.4083975, -0.01537427, 0.9303652, 0, 1, 0.1647059, 1,
-0.4048185, -0.2520062, -1.455755, 0, 1, 0.172549, 1,
-0.4040924, 0.5707052, 0.1410072, 0, 1, 0.1764706, 1,
-0.3998749, -0.0974458, -1.825588, 0, 1, 0.1843137, 1,
-0.3973931, -1.040267, -2.649448, 0, 1, 0.1882353, 1,
-0.3948616, -0.02180346, -2.078855, 0, 1, 0.1960784, 1,
-0.3942893, 0.1652006, -3.170649, 0, 1, 0.2039216, 1,
-0.3935289, 2.1354, 1.015997, 0, 1, 0.2078431, 1,
-0.3904764, -1.235505, -2.771721, 0, 1, 0.2156863, 1,
-0.388235, 0.5837455, -1.773377, 0, 1, 0.2196078, 1,
-0.3877542, -0.9080444, -3.104321, 0, 1, 0.227451, 1,
-0.3861972, 0.01674381, -2.333981, 0, 1, 0.2313726, 1,
-0.3856032, 1.47758, 0.3424576, 0, 1, 0.2392157, 1,
-0.384542, 0.8639464, 0.02154878, 0, 1, 0.2431373, 1,
-0.3834022, -0.200655, -2.351295, 0, 1, 0.2509804, 1,
-0.3833655, 0.5763552, 0.8892004, 0, 1, 0.254902, 1,
-0.3816812, 1.846813, 0.8668514, 0, 1, 0.2627451, 1,
-0.3814481, 0.408401, -2.758693, 0, 1, 0.2666667, 1,
-0.3795626, -0.4203955, -1.167079, 0, 1, 0.2745098, 1,
-0.3773931, -0.2376183, -3.877745, 0, 1, 0.2784314, 1,
-0.3747096, 0.9999607, 0.09929949, 0, 1, 0.2862745, 1,
-0.3742097, -0.1942967, -0.6851172, 0, 1, 0.2901961, 1,
-0.3704542, 0.1283751, -1.247762, 0, 1, 0.2980392, 1,
-0.3662321, 1.532824, -0.7726331, 0, 1, 0.3058824, 1,
-0.3649431, -1.083427, -1.040607, 0, 1, 0.3098039, 1,
-0.3646637, -0.09411062, -1.615798, 0, 1, 0.3176471, 1,
-0.36116, -1.823644, -2.870868, 0, 1, 0.3215686, 1,
-0.3594663, -0.352327, -1.220612, 0, 1, 0.3294118, 1,
-0.3578467, 2.339439, -0.908986, 0, 1, 0.3333333, 1,
-0.3572094, -0.879473, -1.512259, 0, 1, 0.3411765, 1,
-0.3518209, 1.180748, -1.536418, 0, 1, 0.345098, 1,
-0.3477638, -0.01056855, -0.7322858, 0, 1, 0.3529412, 1,
-0.3464723, 0.9666167, 0.009596369, 0, 1, 0.3568628, 1,
-0.3419442, -1.28116, -0.212447, 0, 1, 0.3647059, 1,
-0.3364255, 0.7263467, -1.242499, 0, 1, 0.3686275, 1,
-0.3359112, -0.8058996, -2.618335, 0, 1, 0.3764706, 1,
-0.3359018, -0.2354671, -2.600443, 0, 1, 0.3803922, 1,
-0.3358944, 0.6435353, 1.525681, 0, 1, 0.3882353, 1,
-0.3356088, 0.5119314, -0.4870807, 0, 1, 0.3921569, 1,
-0.3354634, 0.9908457, 0.6686264, 0, 1, 0.4, 1,
-0.3347684, -0.9473918, -2.891171, 0, 1, 0.4078431, 1,
-0.3330329, -1.072026, -3.352314, 0, 1, 0.4117647, 1,
-0.3318217, 0.7212915, -0.02200888, 0, 1, 0.4196078, 1,
-0.3308086, -0.4100955, -4.166907, 0, 1, 0.4235294, 1,
-0.330358, -0.7623855, -3.096801, 0, 1, 0.4313726, 1,
-0.3281409, -0.5548055, -2.745914, 0, 1, 0.4352941, 1,
-0.31536, -0.1745287, -1.972594, 0, 1, 0.4431373, 1,
-0.3140061, -0.6117203, -2.63502, 0, 1, 0.4470588, 1,
-0.3137688, 0.3571776, 1.271565, 0, 1, 0.454902, 1,
-0.3113308, 0.7909178, -1.567086, 0, 1, 0.4588235, 1,
-0.3034443, 0.6679071, -0.1224249, 0, 1, 0.4666667, 1,
-0.2942764, -1.362073, -4.5242, 0, 1, 0.4705882, 1,
-0.2899429, -0.367649, -3.232666, 0, 1, 0.4784314, 1,
-0.2892316, 0.6295523, -0.1673388, 0, 1, 0.4823529, 1,
-0.288749, 0.003969668, -1.267275, 0, 1, 0.4901961, 1,
-0.2880458, -0.3127778, -2.259809, 0, 1, 0.4941176, 1,
-0.2877815, 0.09208579, -1.179315, 0, 1, 0.5019608, 1,
-0.2873083, 0.4289611, -0.8128629, 0, 1, 0.509804, 1,
-0.2797416, -0.520721, -3.786999, 0, 1, 0.5137255, 1,
-0.2795465, 1.267459, -2.178199, 0, 1, 0.5215687, 1,
-0.271429, -1.613409, -3.493349, 0, 1, 0.5254902, 1,
-0.2704325, -0.9152053, -2.605724, 0, 1, 0.5333334, 1,
-0.2689777, 0.9235637, -0.3030941, 0, 1, 0.5372549, 1,
-0.2631527, -0.6021965, -3.305351, 0, 1, 0.5450981, 1,
-0.2550268, 0.9664606, 0.3886088, 0, 1, 0.5490196, 1,
-0.254383, 0.8038082, 0.4432997, 0, 1, 0.5568628, 1,
-0.249428, 0.4565704, -0.2861643, 0, 1, 0.5607843, 1,
-0.2476411, 0.04070647, -0.4391468, 0, 1, 0.5686275, 1,
-0.241721, 0.269892, -0.2712052, 0, 1, 0.572549, 1,
-0.2415612, 0.9191605, -0.9075124, 0, 1, 0.5803922, 1,
-0.2319891, 1.197871, 0.1097907, 0, 1, 0.5843138, 1,
-0.2293883, 1.791378, 0.4881771, 0, 1, 0.5921569, 1,
-0.2287578, 0.4075153, -1.26398, 0, 1, 0.5960785, 1,
-0.2272369, 0.8204367, -0.8050244, 0, 1, 0.6039216, 1,
-0.2265273, -0.1761941, -1.805925, 0, 1, 0.6117647, 1,
-0.2150752, 0.6573934, 0.08092721, 0, 1, 0.6156863, 1,
-0.2001726, 1.080658, 1.087911, 0, 1, 0.6235294, 1,
-0.1997436, -0.2073186, -2.306635, 0, 1, 0.627451, 1,
-0.1961208, 1.201108, -0.8277588, 0, 1, 0.6352941, 1,
-0.1951871, 1.030501, -0.8293505, 0, 1, 0.6392157, 1,
-0.1946104, -0.06010624, -0.8321742, 0, 1, 0.6470588, 1,
-0.1922992, -0.4803756, -2.997639, 0, 1, 0.6509804, 1,
-0.1908068, -0.2124341, -2.601556, 0, 1, 0.6588235, 1,
-0.1895409, -0.9540797, -3.664679, 0, 1, 0.6627451, 1,
-0.1895289, 0.6329959, -0.1243041, 0, 1, 0.6705883, 1,
-0.189316, -0.003622226, -0.8211924, 0, 1, 0.6745098, 1,
-0.1880341, -0.4487552, -0.3118626, 0, 1, 0.682353, 1,
-0.1878485, 0.724775, -0.2271056, 0, 1, 0.6862745, 1,
-0.1876057, -0.3992779, -1.862221, 0, 1, 0.6941177, 1,
-0.1848048, -1.158224, -2.544882, 0, 1, 0.7019608, 1,
-0.1845678, 2.285351, -0.5935473, 0, 1, 0.7058824, 1,
-0.1804711, 0.1983033, 0.3087187, 0, 1, 0.7137255, 1,
-0.1795754, 1.068944, 1.661311, 0, 1, 0.7176471, 1,
-0.1793922, -0.2852454, -1.807184, 0, 1, 0.7254902, 1,
-0.1784593, -1.008339, -2.615198, 0, 1, 0.7294118, 1,
-0.1775103, -0.003181587, -1.10342, 0, 1, 0.7372549, 1,
-0.1655629, 0.9989544, -0.1483983, 0, 1, 0.7411765, 1,
-0.1637934, 0.4789185, 1.513123, 0, 1, 0.7490196, 1,
-0.1631532, -0.3095056, -3.219588, 0, 1, 0.7529412, 1,
-0.1629136, 0.0239481, -0.7105404, 0, 1, 0.7607843, 1,
-0.162003, 0.5822459, 1.471069, 0, 1, 0.7647059, 1,
-0.1529922, -0.6424958, -2.992595, 0, 1, 0.772549, 1,
-0.150298, -0.3381389, -2.004819, 0, 1, 0.7764706, 1,
-0.1469357, -0.2840949, -4.52493, 0, 1, 0.7843137, 1,
-0.1434854, 0.5038568, -2.161216, 0, 1, 0.7882353, 1,
-0.141825, 0.08857156, -1.443999, 0, 1, 0.7960784, 1,
-0.1385048, -0.4578036, -0.4981773, 0, 1, 0.8039216, 1,
-0.1366971, -0.3428898, -4.364379, 0, 1, 0.8078431, 1,
-0.1358187, -0.4154467, -2.648465, 0, 1, 0.8156863, 1,
-0.1287696, 0.2422221, 1.340625, 0, 1, 0.8196079, 1,
-0.1285526, -2.199112, -2.77484, 0, 1, 0.827451, 1,
-0.1284664, 2.48535, -0.5636461, 0, 1, 0.8313726, 1,
-0.1200774, 0.5113106, -1.449491, 0, 1, 0.8392157, 1,
-0.1136621, -0.07058133, -2.221835, 0, 1, 0.8431373, 1,
-0.1128943, -0.9610899, -1.786306, 0, 1, 0.8509804, 1,
-0.1095533, -2.044059, -3.887077, 0, 1, 0.854902, 1,
-0.1076594, -0.07166483, -3.385522, 0, 1, 0.8627451, 1,
-0.1068663, 0.03521566, -2.160511, 0, 1, 0.8666667, 1,
-0.1064335, 1.13809, 0.6622434, 0, 1, 0.8745098, 1,
-0.1056184, -1.903808, -3.067639, 0, 1, 0.8784314, 1,
-0.102164, 1.08571, 1.757432, 0, 1, 0.8862745, 1,
-0.1020992, 0.750572, -0.9704306, 0, 1, 0.8901961, 1,
-0.09722397, 0.7308203, -0.9197719, 0, 1, 0.8980392, 1,
-0.09592944, -0.3393186, -3.304016, 0, 1, 0.9058824, 1,
-0.09050141, -1.598384, -2.30694, 0, 1, 0.9098039, 1,
-0.08785323, 0.6339586, 1.248793, 0, 1, 0.9176471, 1,
-0.08185754, 0.9877842, -0.1336863, 0, 1, 0.9215686, 1,
-0.07743042, -0.3222676, -1.452109, 0, 1, 0.9294118, 1,
-0.07577769, 1.086825, -0.07573012, 0, 1, 0.9333333, 1,
-0.06098286, -1.687446, -2.609097, 0, 1, 0.9411765, 1,
-0.05256615, 1.22848, 0.6012505, 0, 1, 0.945098, 1,
-0.05198972, 1.089126, -0.8018884, 0, 1, 0.9529412, 1,
-0.0497569, -0.1801802, -2.676094, 0, 1, 0.9568627, 1,
-0.04806967, 0.854798, -0.7873198, 0, 1, 0.9647059, 1,
-0.04466226, 1.934982, -0.05127713, 0, 1, 0.9686275, 1,
-0.04399014, 0.2381637, 0.8508961, 0, 1, 0.9764706, 1,
-0.03502078, -0.1885956, -1.492405, 0, 1, 0.9803922, 1,
-0.03230476, 0.3193822, 0.3242701, 0, 1, 0.9882353, 1,
-0.02642004, -1.037571, -3.456634, 0, 1, 0.9921569, 1,
-0.02102338, -0.8606011, -4.450066, 0, 1, 1, 1,
-0.01966781, -0.3757246, -3.234323, 0, 0.9921569, 1, 1,
-0.01853961, 0.336217, 0.3807186, 0, 0.9882353, 1, 1,
-0.01732356, -0.7395514, -4.876993, 0, 0.9803922, 1, 1,
-0.01013218, -0.07976539, -2.429213, 0, 0.9764706, 1, 1,
-0.009371139, 0.748602, -0.2515916, 0, 0.9686275, 1, 1,
-0.007709507, -1.104636, -2.236383, 0, 0.9647059, 1, 1,
-0.007125694, -1.194948, -3.849447, 0, 0.9568627, 1, 1,
-0.006403387, -0.7564803, -3.857366, 0, 0.9529412, 1, 1,
-0.005719444, 0.4269629, 1.001859, 0, 0.945098, 1, 1,
-0.003137295, -1.778847, -3.21127, 0, 0.9411765, 1, 1,
-0.001135266, 0.7141913, -1.346989, 0, 0.9333333, 1, 1,
0.001206438, -1.332586, 1.661803, 0, 0.9294118, 1, 1,
0.001338035, 1.829323, 0.1494989, 0, 0.9215686, 1, 1,
0.001792139, 0.2276132, -1.484225, 0, 0.9176471, 1, 1,
0.004525829, -0.254202, 3.484507, 0, 0.9098039, 1, 1,
0.006124887, -1.025793, 5.092552, 0, 0.9058824, 1, 1,
0.007286962, -0.3044659, 2.932491, 0, 0.8980392, 1, 1,
0.009487953, -0.7054274, 3.780287, 0, 0.8901961, 1, 1,
0.01047589, -0.006244529, 1.242734, 0, 0.8862745, 1, 1,
0.01170659, -1.312311, 4.942576, 0, 0.8784314, 1, 1,
0.01266421, -0.4482918, 2.958119, 0, 0.8745098, 1, 1,
0.01404236, 0.3275059, -0.8449293, 0, 0.8666667, 1, 1,
0.01769686, -1.154102, 4.453375, 0, 0.8627451, 1, 1,
0.02880418, -1.161879, 2.922004, 0, 0.854902, 1, 1,
0.02941204, -0.06861763, 1.919323, 0, 0.8509804, 1, 1,
0.03028683, 0.1358038, 1.020245, 0, 0.8431373, 1, 1,
0.03185489, -0.7463017, 2.869401, 0, 0.8392157, 1, 1,
0.03673024, 1.475984, -1.967162, 0, 0.8313726, 1, 1,
0.03982102, 1.369937, 0.8283343, 0, 0.827451, 1, 1,
0.04067735, 0.6460327, -0.04234483, 0, 0.8196079, 1, 1,
0.043472, 0.5159289, -0.4641798, 0, 0.8156863, 1, 1,
0.04770742, -1.641568, 4.533201, 0, 0.8078431, 1, 1,
0.04942276, -1.094061, 3.696239, 0, 0.8039216, 1, 1,
0.05350235, -0.1165686, 4.300244, 0, 0.7960784, 1, 1,
0.05492492, -0.2604728, 2.223698, 0, 0.7882353, 1, 1,
0.05664635, -0.9950531, 2.320866, 0, 0.7843137, 1, 1,
0.05717735, 0.6696425, -0.2098363, 0, 0.7764706, 1, 1,
0.05882384, 1.797906, 0.4785674, 0, 0.772549, 1, 1,
0.06029986, 1.960435, -0.2650037, 0, 0.7647059, 1, 1,
0.06358076, 0.5386398, -0.6562117, 0, 0.7607843, 1, 1,
0.07273374, -0.7912623, 1.943975, 0, 0.7529412, 1, 1,
0.07295879, -0.6310886, 3.066034, 0, 0.7490196, 1, 1,
0.07318953, 2.504495, -0.811286, 0, 0.7411765, 1, 1,
0.07346911, 0.7238666, -0.8862758, 0, 0.7372549, 1, 1,
0.0738581, 0.01524689, 0.7394583, 0, 0.7294118, 1, 1,
0.07715417, 0.5329089, 0.3905901, 0, 0.7254902, 1, 1,
0.08817202, 0.08648699, 0.5300087, 0, 0.7176471, 1, 1,
0.09336728, -0.5024267, 4.454293, 0, 0.7137255, 1, 1,
0.09805847, 0.9051665, 2.051085, 0, 0.7058824, 1, 1,
0.1015712, 1.408915, -0.5383712, 0, 0.6980392, 1, 1,
0.1027917, -0.5357894, 2.617578, 0, 0.6941177, 1, 1,
0.1031931, -1.210517, 2.968862, 0, 0.6862745, 1, 1,
0.1041576, -1.449105, 4.75468, 0, 0.682353, 1, 1,
0.1061675, 1.456824, -0.005611567, 0, 0.6745098, 1, 1,
0.1118274, -1.558217, 3.629393, 0, 0.6705883, 1, 1,
0.1127757, 0.2235712, 1.22446, 0, 0.6627451, 1, 1,
0.1150606, -0.8667454, 2.358257, 0, 0.6588235, 1, 1,
0.11774, 0.05124745, 0.37844, 0, 0.6509804, 1, 1,
0.1178999, -0.4907542, 4.145514, 0, 0.6470588, 1, 1,
0.1202682, 2.238065, -0.8379503, 0, 0.6392157, 1, 1,
0.1215185, 0.7304415, -1.064056, 0, 0.6352941, 1, 1,
0.1379042, 0.4474931, -0.5189297, 0, 0.627451, 1, 1,
0.1398806, -0.8946894, 4.237941, 0, 0.6235294, 1, 1,
0.1412139, 0.2165897, 0.5834591, 0, 0.6156863, 1, 1,
0.1466721, -1.183168, 2.714968, 0, 0.6117647, 1, 1,
0.1472753, -0.36788, 2.779739, 0, 0.6039216, 1, 1,
0.1481047, 1.503593, -0.05761933, 0, 0.5960785, 1, 1,
0.1533507, -1.290358, 4.053699, 0, 0.5921569, 1, 1,
0.156877, 1.283214, -0.3605357, 0, 0.5843138, 1, 1,
0.1582136, 0.2658534, 1.901587, 0, 0.5803922, 1, 1,
0.1642676, 0.02858531, 1.506994, 0, 0.572549, 1, 1,
0.1646343, -1.245715, 3.470902, 0, 0.5686275, 1, 1,
0.1671448, -0.2250944, 2.964961, 0, 0.5607843, 1, 1,
0.1686436, -0.4422748, 3.155457, 0, 0.5568628, 1, 1,
0.16935, 0.4049724, -0.43544, 0, 0.5490196, 1, 1,
0.1701049, -1.539927, 1.849111, 0, 0.5450981, 1, 1,
0.1747403, -0.7154345, 1.329201, 0, 0.5372549, 1, 1,
0.177206, -0.6067119, 3.303581, 0, 0.5333334, 1, 1,
0.1787786, 0.3111377, 2.007035, 0, 0.5254902, 1, 1,
0.1883637, 1.015484, 0.628328, 0, 0.5215687, 1, 1,
0.1900115, 0.8068872, -0.2024353, 0, 0.5137255, 1, 1,
0.1915962, 0.2288254, 1.229766, 0, 0.509804, 1, 1,
0.1921204, 1.196718, 1.947005, 0, 0.5019608, 1, 1,
0.1923634, 0.8876144, 1.248586, 0, 0.4941176, 1, 1,
0.1982561, -1.258771, 3.940874, 0, 0.4901961, 1, 1,
0.1990923, 0.2999685, 1.453998, 0, 0.4823529, 1, 1,
0.1993901, -0.518742, 3.247702, 0, 0.4784314, 1, 1,
0.2001147, 0.2172521, 2.341403, 0, 0.4705882, 1, 1,
0.2027985, -0.4029364, 3.222087, 0, 0.4666667, 1, 1,
0.2034718, -0.4509183, 3.860083, 0, 0.4588235, 1, 1,
0.2059772, 3.33562, 0.3103549, 0, 0.454902, 1, 1,
0.2117448, -0.6377112, 2.535755, 0, 0.4470588, 1, 1,
0.2149834, 0.09652507, 0.1303017, 0, 0.4431373, 1, 1,
0.2195338, 2.323803, -0.1264145, 0, 0.4352941, 1, 1,
0.2204327, 1.322455, 0.7749017, 0, 0.4313726, 1, 1,
0.2225616, -0.2535315, 1.323537, 0, 0.4235294, 1, 1,
0.2290088, 0.6098352, -0.4101495, 0, 0.4196078, 1, 1,
0.2297217, 0.09216397, 0.06954173, 0, 0.4117647, 1, 1,
0.2350861, -0.3234712, 2.239391, 0, 0.4078431, 1, 1,
0.2357217, 0.3691536, 2.021138, 0, 0.4, 1, 1,
0.2432013, -0.2508346, 1.11902, 0, 0.3921569, 1, 1,
0.2436697, 0.9018662, -0.4711912, 0, 0.3882353, 1, 1,
0.2479659, 1.029027, 1.370144, 0, 0.3803922, 1, 1,
0.2540237, -0.4239092, 3.241582, 0, 0.3764706, 1, 1,
0.2552025, -1.235782, 4.859129, 0, 0.3686275, 1, 1,
0.2577132, -0.2043648, 4.620956, 0, 0.3647059, 1, 1,
0.2613839, 0.6387171, 0.4093355, 0, 0.3568628, 1, 1,
0.264114, -0.0663024, 2.077025, 0, 0.3529412, 1, 1,
0.2749408, -0.1237273, 1.652137, 0, 0.345098, 1, 1,
0.278862, -0.3545432, 2.606277, 0, 0.3411765, 1, 1,
0.2838181, -0.8449691, 1.015408, 0, 0.3333333, 1, 1,
0.2898228, 1.119194, 2.552065, 0, 0.3294118, 1, 1,
0.2928941, -0.3537291, 1.945798, 0, 0.3215686, 1, 1,
0.2962087, -0.2939932, 1.640136, 0, 0.3176471, 1, 1,
0.3004449, -0.3332371, 1.77275, 0, 0.3098039, 1, 1,
0.3048442, -1.594529, 2.727817, 0, 0.3058824, 1, 1,
0.3073364, 0.2889062, -0.1612872, 0, 0.2980392, 1, 1,
0.316103, -1.519415, 3.344315, 0, 0.2901961, 1, 1,
0.3162947, -1.486345, 4.276829, 0, 0.2862745, 1, 1,
0.3171768, -2.399521, 0.7963206, 0, 0.2784314, 1, 1,
0.3182543, -0.02103228, 1.552402, 0, 0.2745098, 1, 1,
0.3225341, -0.5190336, 0.9306689, 0, 0.2666667, 1, 1,
0.3271008, -0.3390669, 3.464735, 0, 0.2627451, 1, 1,
0.3284412, 0.2106461, 0.6279975, 0, 0.254902, 1, 1,
0.3299299, -1.473309, 2.822888, 0, 0.2509804, 1, 1,
0.3319595, -1.958203, 2.991398, 0, 0.2431373, 1, 1,
0.3325804, -0.1944609, 2.136595, 0, 0.2392157, 1, 1,
0.3326111, 0.6458308, 1.996994, 0, 0.2313726, 1, 1,
0.3352144, 0.4200119, 0.3746622, 0, 0.227451, 1, 1,
0.3384162, 0.8844517, 1.057877, 0, 0.2196078, 1, 1,
0.3402126, -1.236907, 3.601351, 0, 0.2156863, 1, 1,
0.340988, 0.6559873, -0.0329669, 0, 0.2078431, 1, 1,
0.3462735, -0.5073957, 1.520697, 0, 0.2039216, 1, 1,
0.351519, -0.5770672, 1.3338, 0, 0.1960784, 1, 1,
0.3515902, -0.9394166, 1.180937, 0, 0.1882353, 1, 1,
0.351612, -0.2112517, 1.315719, 0, 0.1843137, 1, 1,
0.3525261, 0.7562283, -0.6182202, 0, 0.1764706, 1, 1,
0.3564452, -0.3103152, 3.142905, 0, 0.172549, 1, 1,
0.3568453, -2.348998, 3.510374, 0, 0.1647059, 1, 1,
0.3576346, 0.2823286, -0.3475971, 0, 0.1607843, 1, 1,
0.3660496, 0.8187368, -0.2800968, 0, 0.1529412, 1, 1,
0.3676634, 0.459344, 1.160068, 0, 0.1490196, 1, 1,
0.3791047, 0.8001806, 0.2121031, 0, 0.1411765, 1, 1,
0.3836304, 0.7684502, 2.137429, 0, 0.1372549, 1, 1,
0.3909932, -0.4830353, 3.626975, 0, 0.1294118, 1, 1,
0.391363, -0.05414848, 1.908746, 0, 0.1254902, 1, 1,
0.3934085, 0.1812012, 1.351304, 0, 0.1176471, 1, 1,
0.3972875, -0.2201751, 1.884447, 0, 0.1137255, 1, 1,
0.3978383, 0.4627124, 2.628277, 0, 0.1058824, 1, 1,
0.3980215, -1.639816, 2.363804, 0, 0.09803922, 1, 1,
0.4016329, -0.03898631, 1.189619, 0, 0.09411765, 1, 1,
0.4056295, -2.369118, 2.028322, 0, 0.08627451, 1, 1,
0.4059358, -1.850257, 3.265644, 0, 0.08235294, 1, 1,
0.4160752, 0.619336, 1.040562, 0, 0.07450981, 1, 1,
0.4172112, -1.033543, 1.799721, 0, 0.07058824, 1, 1,
0.4176045, -0.07794453, 2.375025, 0, 0.0627451, 1, 1,
0.4219667, -0.8580055, 1.831329, 0, 0.05882353, 1, 1,
0.4338482, 0.2868969, 0.03519342, 0, 0.05098039, 1, 1,
0.4369328, 0.4773202, 1.04113, 0, 0.04705882, 1, 1,
0.437795, -0.7001956, 3.246336, 0, 0.03921569, 1, 1,
0.4391714, 0.4461586, -0.8958479, 0, 0.03529412, 1, 1,
0.4417685, 1.759878, 0.9494695, 0, 0.02745098, 1, 1,
0.4422868, -0.05707899, 1.370534, 0, 0.02352941, 1, 1,
0.4429601, -0.06752425, 1.16694, 0, 0.01568628, 1, 1,
0.4435046, 1.76878, -1.254346, 0, 0.01176471, 1, 1,
0.4455495, 0.03380588, 1.440797, 0, 0.003921569, 1, 1,
0.4532877, -0.1448473, 1.3364, 0.003921569, 0, 1, 1,
0.4550927, 1.487765, 0.7011007, 0.007843138, 0, 1, 1,
0.4551554, -0.9998336, 2.980034, 0.01568628, 0, 1, 1,
0.456864, 0.6341328, 2.226222, 0.01960784, 0, 1, 1,
0.4591249, -0.2235737, 1.946211, 0.02745098, 0, 1, 1,
0.4593146, 0.8955854, 0.4293369, 0.03137255, 0, 1, 1,
0.4632455, 0.1581226, 1.659867, 0.03921569, 0, 1, 1,
0.4660665, 0.3942118, 1.09951, 0.04313726, 0, 1, 1,
0.469907, 1.057337, 1.345152, 0.05098039, 0, 1, 1,
0.4877602, 0.702455, 1.558943, 0.05490196, 0, 1, 1,
0.4885624, -0.1130737, 2.164681, 0.0627451, 0, 1, 1,
0.4966776, -1.170655, 2.374223, 0.06666667, 0, 1, 1,
0.4992081, -0.3676345, 2.868281, 0.07450981, 0, 1, 1,
0.4993303, -1.249919, 2.921125, 0.07843138, 0, 1, 1,
0.5001791, -1.005711, 2.998267, 0.08627451, 0, 1, 1,
0.500654, 0.6789762, 0.6362962, 0.09019608, 0, 1, 1,
0.5006745, 1.124161, -0.04764801, 0.09803922, 0, 1, 1,
0.5016624, -0.3695874, 2.71412, 0.1058824, 0, 1, 1,
0.5064242, 0.6752344, 3.219141, 0.1098039, 0, 1, 1,
0.5075463, 1.379027, -0.04362183, 0.1176471, 0, 1, 1,
0.5092821, 1.181105, -0.4064474, 0.1215686, 0, 1, 1,
0.5130611, -0.1898191, 1.616397, 0.1294118, 0, 1, 1,
0.516718, -1.567044, 2.085255, 0.1333333, 0, 1, 1,
0.5168918, -0.5025079, 3.015206, 0.1411765, 0, 1, 1,
0.5198829, 0.04042336, -1.70032, 0.145098, 0, 1, 1,
0.5200891, -0.459724, 2.953955, 0.1529412, 0, 1, 1,
0.5267497, -0.04265153, 2.732445, 0.1568628, 0, 1, 1,
0.5274688, 0.5338281, 1.186736, 0.1647059, 0, 1, 1,
0.5329256, -0.9231949, 3.069593, 0.1686275, 0, 1, 1,
0.5336632, -2.082684, 2.529459, 0.1764706, 0, 1, 1,
0.5370241, -0.4924865, 1.635137, 0.1803922, 0, 1, 1,
0.5465894, -0.754776, 2.912064, 0.1882353, 0, 1, 1,
0.5500429, -0.4719491, 2.535241, 0.1921569, 0, 1, 1,
0.5514503, -0.4842537, 1.696166, 0.2, 0, 1, 1,
0.5519308, -0.2173774, 1.689064, 0.2078431, 0, 1, 1,
0.5526366, -1.592489, 4.561681, 0.2117647, 0, 1, 1,
0.5582883, 0.9642621, 2.125717, 0.2196078, 0, 1, 1,
0.5586377, -0.6233329, 1.608423, 0.2235294, 0, 1, 1,
0.5649375, -1.27688, 4.053415, 0.2313726, 0, 1, 1,
0.5697767, 0.1917784, 1.794671, 0.2352941, 0, 1, 1,
0.5805321, -0.2250926, 2.167015, 0.2431373, 0, 1, 1,
0.5814446, 1.686202, 0.372506, 0.2470588, 0, 1, 1,
0.5845761, 0.4996105, -0.4310083, 0.254902, 0, 1, 1,
0.5874866, -2.51131, 2.950567, 0.2588235, 0, 1, 1,
0.5943154, 1.346242, 0.1004664, 0.2666667, 0, 1, 1,
0.5966842, 1.160221, 1.050527, 0.2705882, 0, 1, 1,
0.5970123, -0.1400945, 2.383359, 0.2784314, 0, 1, 1,
0.6015996, 0.04924413, 0.5823143, 0.282353, 0, 1, 1,
0.6039109, -0.7069248, 1.465699, 0.2901961, 0, 1, 1,
0.6052402, 0.5501965, -0.3242188, 0.2941177, 0, 1, 1,
0.6058902, -0.9157192, 1.784599, 0.3019608, 0, 1, 1,
0.6095622, -2.013539, 3.465679, 0.3098039, 0, 1, 1,
0.6117458, -0.4580322, 2.199428, 0.3137255, 0, 1, 1,
0.6264129, 1.006374, 1.496116, 0.3215686, 0, 1, 1,
0.6289262, -1.327671, 2.129678, 0.3254902, 0, 1, 1,
0.6299139, -2.691439, 3.894434, 0.3333333, 0, 1, 1,
0.6302402, -1.147398, 2.81049, 0.3372549, 0, 1, 1,
0.6327553, -0.841852, 3.031126, 0.345098, 0, 1, 1,
0.6336647, 0.9366328, 0.5026695, 0.3490196, 0, 1, 1,
0.6397973, 0.03688647, 1.735534, 0.3568628, 0, 1, 1,
0.6426017, 0.9719609, 0.9640967, 0.3607843, 0, 1, 1,
0.6442649, -0.9469286, 1.857435, 0.3686275, 0, 1, 1,
0.6482682, -0.1235141, 1.881413, 0.372549, 0, 1, 1,
0.6549056, 2.46545, -0.5705482, 0.3803922, 0, 1, 1,
0.6563053, -0.2961363, 1.894334, 0.3843137, 0, 1, 1,
0.6573658, -1.170888, 1.643004, 0.3921569, 0, 1, 1,
0.6574035, 0.5602647, 0.3703496, 0.3960784, 0, 1, 1,
0.6622878, 0.09581316, 2.330776, 0.4039216, 0, 1, 1,
0.6628033, -0.433335, 2.779043, 0.4117647, 0, 1, 1,
0.6633344, -0.8262703, 3.105305, 0.4156863, 0, 1, 1,
0.6658925, -0.4927624, 2.6611, 0.4235294, 0, 1, 1,
0.6664093, -0.8311605, 2.658513, 0.427451, 0, 1, 1,
0.6756736, -0.5515535, -1.337858, 0.4352941, 0, 1, 1,
0.6809134, -0.006218182, 2.724166, 0.4392157, 0, 1, 1,
0.6837382, 1.009443, 0.7153358, 0.4470588, 0, 1, 1,
0.6870509, -0.9283404, 4.346393, 0.4509804, 0, 1, 1,
0.6896582, 0.3216757, 1.017455, 0.4588235, 0, 1, 1,
0.6983774, 0.1545136, 2.120633, 0.4627451, 0, 1, 1,
0.7048483, -0.8396233, 4.85136, 0.4705882, 0, 1, 1,
0.70491, 0.5972638, -0.07888709, 0.4745098, 0, 1, 1,
0.7091643, 0.008039196, 1.980527, 0.4823529, 0, 1, 1,
0.7109792, -1.56244, 4.340103, 0.4862745, 0, 1, 1,
0.710995, 0.3018852, 1.790528, 0.4941176, 0, 1, 1,
0.7125401, 0.3707737, 1.745227, 0.5019608, 0, 1, 1,
0.7159986, -1.542202, 1.435359, 0.5058824, 0, 1, 1,
0.7220382, -0.9525595, 1.631122, 0.5137255, 0, 1, 1,
0.7270797, -1.610657, 2.903818, 0.5176471, 0, 1, 1,
0.7294167, 0.06978128, 3.130349, 0.5254902, 0, 1, 1,
0.7306291, -1.50581, 3.102671, 0.5294118, 0, 1, 1,
0.7325013, 1.422309, 1.072006, 0.5372549, 0, 1, 1,
0.7352774, 0.1222866, 3.411461, 0.5411765, 0, 1, 1,
0.7368413, 1.450198, 0.7191548, 0.5490196, 0, 1, 1,
0.7461565, 0.9616199, 1.363573, 0.5529412, 0, 1, 1,
0.7492368, -0.1975101, 2.199567, 0.5607843, 0, 1, 1,
0.7503333, 0.215996, 0.1428753, 0.5647059, 0, 1, 1,
0.7518474, 0.6938684, 1.750727, 0.572549, 0, 1, 1,
0.7550618, 0.4655, 1.391383, 0.5764706, 0, 1, 1,
0.7566643, -0.09311685, 1.532058, 0.5843138, 0, 1, 1,
0.7628371, 0.7809891, 0.9599033, 0.5882353, 0, 1, 1,
0.7645683, 0.0356806, 2.133251, 0.5960785, 0, 1, 1,
0.7661656, -0.4177467, 1.718483, 0.6039216, 0, 1, 1,
0.766283, -0.160193, 2.89267, 0.6078432, 0, 1, 1,
0.7668276, 0.6102176, 1.48868, 0.6156863, 0, 1, 1,
0.7707788, 0.3694068, 1.192591, 0.6196079, 0, 1, 1,
0.7765888, -1.612353, 1.499968, 0.627451, 0, 1, 1,
0.7838693, -0.5847335, 3.600052, 0.6313726, 0, 1, 1,
0.7842482, -0.6394871, 1.361669, 0.6392157, 0, 1, 1,
0.7860274, -0.5299983, 3.061338, 0.6431373, 0, 1, 1,
0.7866595, -0.04989284, 3.217233, 0.6509804, 0, 1, 1,
0.7868748, -0.2130066, 1.356665, 0.654902, 0, 1, 1,
0.7903832, 0.3450215, 1.04079, 0.6627451, 0, 1, 1,
0.7937588, -1.11852, 3.023827, 0.6666667, 0, 1, 1,
0.7939745, -0.3420258, 3.789226, 0.6745098, 0, 1, 1,
0.8049734, 1.328186, 0.2493884, 0.6784314, 0, 1, 1,
0.8081247, 0.1025543, 1.901317, 0.6862745, 0, 1, 1,
0.8084511, -0.7328767, 2.122288, 0.6901961, 0, 1, 1,
0.8085359, -1.665861, 3.065978, 0.6980392, 0, 1, 1,
0.8101367, 0.2766089, 0.5585063, 0.7058824, 0, 1, 1,
0.8101426, -0.2086324, 0.450691, 0.7098039, 0, 1, 1,
0.8116471, 0.3740811, 2.879794, 0.7176471, 0, 1, 1,
0.8259035, -2.246967, 3.77701, 0.7215686, 0, 1, 1,
0.8335118, 0.9165875, 2.218038, 0.7294118, 0, 1, 1,
0.8350177, 1.460408, 1.577267, 0.7333333, 0, 1, 1,
0.83693, 0.8170691, 0.6020597, 0.7411765, 0, 1, 1,
0.8391023, 1.073785, -0.4704929, 0.7450981, 0, 1, 1,
0.8401413, -0.3430929, -0.3425497, 0.7529412, 0, 1, 1,
0.8408984, 0.1683271, 1.583882, 0.7568628, 0, 1, 1,
0.8444213, -0.7078741, 2.902393, 0.7647059, 0, 1, 1,
0.8451725, 0.6052368, 0.7097241, 0.7686275, 0, 1, 1,
0.8479963, 1.903449, 0.2807164, 0.7764706, 0, 1, 1,
0.8496779, 1.826352, 0.1551753, 0.7803922, 0, 1, 1,
0.8514075, 1.357427, 1.540725, 0.7882353, 0, 1, 1,
0.859793, -0.2843065, 2.180684, 0.7921569, 0, 1, 1,
0.8659074, -0.5124634, 2.61482, 0.8, 0, 1, 1,
0.8668326, 0.3341285, 1.613136, 0.8078431, 0, 1, 1,
0.8696715, 0.5649859, 2.849417, 0.8117647, 0, 1, 1,
0.8764334, 0.3199151, 1.356668, 0.8196079, 0, 1, 1,
0.8776339, 0.1172544, 1.737615, 0.8235294, 0, 1, 1,
0.878143, 0.7375388, 1.700516, 0.8313726, 0, 1, 1,
0.8824106, -1.567128, 3.60803, 0.8352941, 0, 1, 1,
0.8832968, -0.9154868, 1.022998, 0.8431373, 0, 1, 1,
0.8840159, -0.1230478, 1.799133, 0.8470588, 0, 1, 1,
0.8879462, 0.4104857, 1.602367, 0.854902, 0, 1, 1,
0.8918638, -0.4608554, 1.146601, 0.8588235, 0, 1, 1,
0.8929549, 0.3790169, 0.1246737, 0.8666667, 0, 1, 1,
0.895681, -0.7861847, 5.156404, 0.8705882, 0, 1, 1,
0.9052955, -0.04828257, 0.8718209, 0.8784314, 0, 1, 1,
0.906039, 1.609297, 0.09439979, 0.8823529, 0, 1, 1,
0.9104263, -2.099202, 2.342179, 0.8901961, 0, 1, 1,
0.9112895, 0.5639592, -0.4962996, 0.8941177, 0, 1, 1,
0.9113042, -0.3636478, 2.696674, 0.9019608, 0, 1, 1,
0.9139444, -1.374372, 2.005985, 0.9098039, 0, 1, 1,
0.9176424, -1.350804, 4.083182, 0.9137255, 0, 1, 1,
0.9210401, -1.121006, 2.354732, 0.9215686, 0, 1, 1,
0.9366821, -1.02682, 1.720817, 0.9254902, 0, 1, 1,
0.9382683, 0.5293356, 1.153641, 0.9333333, 0, 1, 1,
0.9391289, -0.07468723, 2.234402, 0.9372549, 0, 1, 1,
0.9420746, 0.9212942, -0.827986, 0.945098, 0, 1, 1,
0.9514042, 0.2061048, 2.557701, 0.9490196, 0, 1, 1,
0.9541918, 0.9677744, 2.154491, 0.9568627, 0, 1, 1,
0.9550309, -0.5504814, 3.218752, 0.9607843, 0, 1, 1,
0.9586583, 1.221615, -0.929418, 0.9686275, 0, 1, 1,
0.9602266, 0.01776484, 3.253497, 0.972549, 0, 1, 1,
0.9602363, 0.9372258, 2.413766, 0.9803922, 0, 1, 1,
0.9660779, -1.609128, 1.84224, 0.9843137, 0, 1, 1,
0.9684646, -1.466805, 2.462326, 0.9921569, 0, 1, 1,
0.9772905, -0.8043352, 3.043772, 0.9960784, 0, 1, 1,
0.9778112, 0.8975362, 0.9710815, 1, 0, 0.9960784, 1,
0.9855769, 1.380813, -0.08803318, 1, 0, 0.9882353, 1,
0.9879599, -0.3709947, 2.207391, 1, 0, 0.9843137, 1,
0.9880577, -0.8028921, 2.259461, 1, 0, 0.9764706, 1,
0.989856, -1.314208, 0.2944758, 1, 0, 0.972549, 1,
0.9943119, 0.683846, 0.5108692, 1, 0, 0.9647059, 1,
0.9946721, 1.250149, 1.332399, 1, 0, 0.9607843, 1,
1.00062, -0.07523348, -0.4655595, 1, 0, 0.9529412, 1,
1.000892, -0.7030666, 0.182163, 1, 0, 0.9490196, 1,
1.001372, -0.7277766, 2.860896, 1, 0, 0.9411765, 1,
1.002515, -0.4488904, 1.557099, 1, 0, 0.9372549, 1,
1.004467, -0.2667463, 1.974573, 1, 0, 0.9294118, 1,
1.004843, 0.9296933, 0.2267088, 1, 0, 0.9254902, 1,
1.027328, -0.8494952, 2.965901, 1, 0, 0.9176471, 1,
1.029466, 0.407901, 2.174833, 1, 0, 0.9137255, 1,
1.029625, 0.8124948, 1.634113, 1, 0, 0.9058824, 1,
1.032212, 1.933511, 2.012283, 1, 0, 0.9019608, 1,
1.033478, 0.8050789, 1.318556, 1, 0, 0.8941177, 1,
1.034935, 2.183064, 0.9601803, 1, 0, 0.8862745, 1,
1.043633, -0.09828911, 2.912077, 1, 0, 0.8823529, 1,
1.044133, 0.4088556, 2.014531, 1, 0, 0.8745098, 1,
1.046924, -1.094603, 1.717336, 1, 0, 0.8705882, 1,
1.047169, -0.9620838, 3.084391, 1, 0, 0.8627451, 1,
1.047644, -0.05688916, -0.6284452, 1, 0, 0.8588235, 1,
1.050034, 1.056032, 0.01569146, 1, 0, 0.8509804, 1,
1.055627, 0.5934047, 0.6599148, 1, 0, 0.8470588, 1,
1.060345, 0.07459811, 2.227318, 1, 0, 0.8392157, 1,
1.066999, -0.3703376, 3.685718, 1, 0, 0.8352941, 1,
1.073255, 0.2072208, 3.092524, 1, 0, 0.827451, 1,
1.074033, -0.1597546, 1.843415, 1, 0, 0.8235294, 1,
1.074628, -0.9509705, 2.175674, 1, 0, 0.8156863, 1,
1.075381, -1.080137, 4.107713, 1, 0, 0.8117647, 1,
1.083532, 0.2380325, 1.83015, 1, 0, 0.8039216, 1,
1.085219, 2.31755, 1.031621, 1, 0, 0.7960784, 1,
1.085271, 1.424155, 0.6177515, 1, 0, 0.7921569, 1,
1.091524, -0.02224653, 1.567854, 1, 0, 0.7843137, 1,
1.093056, 1.834078, 1.165876, 1, 0, 0.7803922, 1,
1.096806, -2.411993, 3.92615, 1, 0, 0.772549, 1,
1.098783, -1.4042, 2.460864, 1, 0, 0.7686275, 1,
1.107574, -0.2946373, 0.5161989, 1, 0, 0.7607843, 1,
1.125186, 0.3814093, 0.5412092, 1, 0, 0.7568628, 1,
1.127354, -0.854041, 3.202703, 1, 0, 0.7490196, 1,
1.130299, -0.9507143, 3.670513, 1, 0, 0.7450981, 1,
1.132733, -0.8080668, 1.139183, 1, 0, 0.7372549, 1,
1.133775, -0.268678, 2.580076, 1, 0, 0.7333333, 1,
1.133956, 0.7864407, 1.905378, 1, 0, 0.7254902, 1,
1.140411, 0.4672392, 0.855414, 1, 0, 0.7215686, 1,
1.141539, 2.732004, 0.1174088, 1, 0, 0.7137255, 1,
1.144762, 1.857248, 0.12275, 1, 0, 0.7098039, 1,
1.146791, -0.2497652, 1.533401, 1, 0, 0.7019608, 1,
1.147571, -1.183427, 3.64121, 1, 0, 0.6941177, 1,
1.158273, 1.032184, 3.268566, 1, 0, 0.6901961, 1,
1.160693, 2.520424, 0.06962689, 1, 0, 0.682353, 1,
1.171727, 1.459146, 0.1967274, 1, 0, 0.6784314, 1,
1.182694, 3.476386, -0.2880699, 1, 0, 0.6705883, 1,
1.184412, 0.8647981, 2.502755, 1, 0, 0.6666667, 1,
1.196318, 0.8585892, 1.244447, 1, 0, 0.6588235, 1,
1.19695, -1.62331, 1.153039, 1, 0, 0.654902, 1,
1.197857, 1.211418, 2.351728, 1, 0, 0.6470588, 1,
1.198486, -1.949356, 2.560661, 1, 0, 0.6431373, 1,
1.200314, -0.02063674, 2.171583, 1, 0, 0.6352941, 1,
1.203492, -0.9189709, 4.502849, 1, 0, 0.6313726, 1,
1.205709, 0.3941983, 1.227854, 1, 0, 0.6235294, 1,
1.206071, -1.341285, 1.197678, 1, 0, 0.6196079, 1,
1.208285, 0.7534888, 1.672886, 1, 0, 0.6117647, 1,
1.209018, -0.108691, -0.3676611, 1, 0, 0.6078432, 1,
1.212629, 0.7753644, -0.134065, 1, 0, 0.6, 1,
1.221413, -1.059255, 2.050845, 1, 0, 0.5921569, 1,
1.227638, -0.9974299, 3.471474, 1, 0, 0.5882353, 1,
1.230762, -0.002940201, 2.855958, 1, 0, 0.5803922, 1,
1.237313, 1.112801, 0.9785511, 1, 0, 0.5764706, 1,
1.246967, 2.462102, 1.526959, 1, 0, 0.5686275, 1,
1.257413, 0.5344181, -0.007367564, 1, 0, 0.5647059, 1,
1.264659, 0.4358098, 2.685148, 1, 0, 0.5568628, 1,
1.271531, -0.4148712, 2.268209, 1, 0, 0.5529412, 1,
1.278205, 0.2645416, 2.003271, 1, 0, 0.5450981, 1,
1.278242, 1.761624, -0.4398283, 1, 0, 0.5411765, 1,
1.289892, -0.9527265, 3.0378, 1, 0, 0.5333334, 1,
1.300673, 0.140642, 0.6555071, 1, 0, 0.5294118, 1,
1.301566, -0.58738, 0.7618546, 1, 0, 0.5215687, 1,
1.315559, -1.248184, 2.52588, 1, 0, 0.5176471, 1,
1.316968, -1.222139, 2.50304, 1, 0, 0.509804, 1,
1.33143, 0.9442542, 1.725343, 1, 0, 0.5058824, 1,
1.339879, -2.058147, 2.27299, 1, 0, 0.4980392, 1,
1.345166, -0.6031153, 2.82386, 1, 0, 0.4901961, 1,
1.36078, 0.2466254, 1.628064, 1, 0, 0.4862745, 1,
1.370661, 0.6293748, 1.755749, 1, 0, 0.4784314, 1,
1.375358, -0.7665297, 1.45994, 1, 0, 0.4745098, 1,
1.381659, 1.074409, 1.037298, 1, 0, 0.4666667, 1,
1.38211, -0.7642272, 2.417179, 1, 0, 0.4627451, 1,
1.383681, 0.4446683, 3.00739, 1, 0, 0.454902, 1,
1.384623, 0.3494074, 0.4636606, 1, 0, 0.4509804, 1,
1.386196, -0.2728356, 2.846022, 1, 0, 0.4431373, 1,
1.393471, -0.6221531, 0.3243567, 1, 0, 0.4392157, 1,
1.39479, 0.3415408, 0.8823767, 1, 0, 0.4313726, 1,
1.397282, 0.3797601, 3.52462, 1, 0, 0.427451, 1,
1.407528, -1.114064, 2.678574, 1, 0, 0.4196078, 1,
1.409308, 1.198443, -0.1205243, 1, 0, 0.4156863, 1,
1.429911, 0.907423, 1.449778, 1, 0, 0.4078431, 1,
1.432106, 0.4072054, 0.6512242, 1, 0, 0.4039216, 1,
1.440611, 0.5635847, -0.43257, 1, 0, 0.3960784, 1,
1.449693, -0.515974, 1.040838, 1, 0, 0.3882353, 1,
1.461194, 0.759954, 0.3936543, 1, 0, 0.3843137, 1,
1.479505, 0.4881975, 1.156047, 1, 0, 0.3764706, 1,
1.490029, -0.1841463, 0.3268584, 1, 0, 0.372549, 1,
1.491808, -0.951543, 3.205078, 1, 0, 0.3647059, 1,
1.492842, -0.34039, 0.6586486, 1, 0, 0.3607843, 1,
1.502856, 0.6356727, -1.035959, 1, 0, 0.3529412, 1,
1.529668, -0.1952555, 0.5881022, 1, 0, 0.3490196, 1,
1.531471, 2.356084, -1.540422, 1, 0, 0.3411765, 1,
1.536087, 0.4114913, 2.967444, 1, 0, 0.3372549, 1,
1.537984, -1.307482, 1.707441, 1, 0, 0.3294118, 1,
1.539365, 0.9014902, 2.13634, 1, 0, 0.3254902, 1,
1.540528, -0.164248, 0.003166816, 1, 0, 0.3176471, 1,
1.54319, -0.4130589, 1.54347, 1, 0, 0.3137255, 1,
1.546522, 0.9400898, 1.43016, 1, 0, 0.3058824, 1,
1.57615, -0.6434199, 3.49152, 1, 0, 0.2980392, 1,
1.580097, 0.4606075, 2.37048, 1, 0, 0.2941177, 1,
1.584242, 0.7572238, -0.01134071, 1, 0, 0.2862745, 1,
1.598158, 0.3478655, 2.706231, 1, 0, 0.282353, 1,
1.60868, 0.1279237, 0.7034895, 1, 0, 0.2745098, 1,
1.609058, 1.300481, -0.6279082, 1, 0, 0.2705882, 1,
1.624065, 1.269729, 1.91592, 1, 0, 0.2627451, 1,
1.654462, 0.3091999, 0.6028165, 1, 0, 0.2588235, 1,
1.675028, -0.4767698, 0.351429, 1, 0, 0.2509804, 1,
1.675581, 0.1553414, 1.35815, 1, 0, 0.2470588, 1,
1.678866, 0.3998062, 1.639916, 1, 0, 0.2392157, 1,
1.680965, -0.9878015, 4.469513, 1, 0, 0.2352941, 1,
1.692039, 1.145752, 0.6962637, 1, 0, 0.227451, 1,
1.700132, -0.9643473, 3.80181, 1, 0, 0.2235294, 1,
1.74986, 1.748006, 0.6326796, 1, 0, 0.2156863, 1,
1.802166, 0.002522733, 0.3588931, 1, 0, 0.2117647, 1,
1.808625, -0.9578702, 2.385077, 1, 0, 0.2039216, 1,
1.811655, -0.3419048, 1.850205, 1, 0, 0.1960784, 1,
1.812605, 0.2481074, 1.077127, 1, 0, 0.1921569, 1,
1.972458, -0.3507513, 1.326321, 1, 0, 0.1843137, 1,
1.972987, -0.08189964, 0.1815118, 1, 0, 0.1803922, 1,
2.00047, 0.2712689, 2.179448, 1, 0, 0.172549, 1,
2.048198, -0.2966024, 1.138929, 1, 0, 0.1686275, 1,
2.063949, -0.09981954, 0.01369084, 1, 0, 0.1607843, 1,
2.066001, 0.2980534, 0.8765429, 1, 0, 0.1568628, 1,
2.084433, -0.06561003, 2.339955, 1, 0, 0.1490196, 1,
2.086862, -1.683339, 2.526842, 1, 0, 0.145098, 1,
2.149111, 0.3785548, 3.262771, 1, 0, 0.1372549, 1,
2.158469, -0.5276034, 3.285264, 1, 0, 0.1333333, 1,
2.158584, 1.118402, 1.009264, 1, 0, 0.1254902, 1,
2.190244, 0.1969116, 2.316199, 1, 0, 0.1215686, 1,
2.224677, -0.23198, 1.03166, 1, 0, 0.1137255, 1,
2.254772, 1.452113, 0.6387234, 1, 0, 0.1098039, 1,
2.309831, -0.5386206, 1.110796, 1, 0, 0.1019608, 1,
2.312761, -2.44963, 2.807865, 1, 0, 0.09411765, 1,
2.438383, -1.662181, 3.701823, 1, 0, 0.09019608, 1,
2.443899, -0.5992697, 1.936908, 1, 0, 0.08235294, 1,
2.463434, 0.4519816, 2.441513, 1, 0, 0.07843138, 1,
2.496787, 0.4278898, 1.792899, 1, 0, 0.07058824, 1,
2.52531, -0.6259652, 1.088364, 1, 0, 0.06666667, 1,
2.56217, -0.6384568, 2.851966, 1, 0, 0.05882353, 1,
2.610639, -0.6028827, 3.466645, 1, 0, 0.05490196, 1,
2.792926, -1.387195, 2.067497, 1, 0, 0.04705882, 1,
2.81541, 0.9877732, -0.1014041, 1, 0, 0.04313726, 1,
2.837371, 1.550147, 1.286924, 1, 0, 0.03529412, 1,
2.874002, 0.3526442, 3.08168, 1, 0, 0.03137255, 1,
2.881054, -0.1295829, 1.243061, 1, 0, 0.02352941, 1,
2.979217, -1.632994, 2.415194, 1, 0, 0.01960784, 1,
3.00954, -1.013673, 1.562947, 1, 0, 0.01176471, 1,
3.311455, -0.3366208, 0.4332282, 1, 0, 0.007843138, 1
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
0.2408172, -3.943274, -6.728111, 0, -0.5, 0.5, 0.5,
0.2408172, -3.943274, -6.728111, 1, -0.5, 0.5, 0.5,
0.2408172, -3.943274, -6.728111, 1, 1.5, 0.5, 0.5,
0.2408172, -3.943274, -6.728111, 0, 1.5, 0.5, 0.5
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
-3.870767, 0.4084817, -6.728111, 0, -0.5, 0.5, 0.5,
-3.870767, 0.4084817, -6.728111, 1, -0.5, 0.5, 0.5,
-3.870767, 0.4084817, -6.728111, 1, 1.5, 0.5, 0.5,
-3.870767, 0.4084817, -6.728111, 0, 1.5, 0.5, 0.5
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
-3.870767, -3.943274, 0.07538009, 0, -0.5, 0.5, 0.5,
-3.870767, -3.943274, 0.07538009, 1, -0.5, 0.5, 0.5,
-3.870767, -3.943274, 0.07538009, 1, 1.5, 0.5, 0.5,
-3.870767, -3.943274, 0.07538009, 0, 1.5, 0.5, 0.5
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
-2, -2.939022, -5.158074,
3, -2.939022, -5.158074,
-2, -2.939022, -5.158074,
-2, -3.106398, -5.419747,
-1, -2.939022, -5.158074,
-1, -3.106398, -5.419747,
0, -2.939022, -5.158074,
0, -3.106398, -5.419747,
1, -2.939022, -5.158074,
1, -3.106398, -5.419747,
2, -2.939022, -5.158074,
2, -3.106398, -5.419747,
3, -2.939022, -5.158074,
3, -3.106398, -5.419747
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
-2, -3.441148, -5.943093, 0, -0.5, 0.5, 0.5,
-2, -3.441148, -5.943093, 1, -0.5, 0.5, 0.5,
-2, -3.441148, -5.943093, 1, 1.5, 0.5, 0.5,
-2, -3.441148, -5.943093, 0, 1.5, 0.5, 0.5,
-1, -3.441148, -5.943093, 0, -0.5, 0.5, 0.5,
-1, -3.441148, -5.943093, 1, -0.5, 0.5, 0.5,
-1, -3.441148, -5.943093, 1, 1.5, 0.5, 0.5,
-1, -3.441148, -5.943093, 0, 1.5, 0.5, 0.5,
0, -3.441148, -5.943093, 0, -0.5, 0.5, 0.5,
0, -3.441148, -5.943093, 1, -0.5, 0.5, 0.5,
0, -3.441148, -5.943093, 1, 1.5, 0.5, 0.5,
0, -3.441148, -5.943093, 0, 1.5, 0.5, 0.5,
1, -3.441148, -5.943093, 0, -0.5, 0.5, 0.5,
1, -3.441148, -5.943093, 1, -0.5, 0.5, 0.5,
1, -3.441148, -5.943093, 1, 1.5, 0.5, 0.5,
1, -3.441148, -5.943093, 0, 1.5, 0.5, 0.5,
2, -3.441148, -5.943093, 0, -0.5, 0.5, 0.5,
2, -3.441148, -5.943093, 1, -0.5, 0.5, 0.5,
2, -3.441148, -5.943093, 1, 1.5, 0.5, 0.5,
2, -3.441148, -5.943093, 0, 1.5, 0.5, 0.5,
3, -3.441148, -5.943093, 0, -0.5, 0.5, 0.5,
3, -3.441148, -5.943093, 1, -0.5, 0.5, 0.5,
3, -3.441148, -5.943093, 1, 1.5, 0.5, 0.5,
3, -3.441148, -5.943093, 0, 1.5, 0.5, 0.5
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
-2.92194, -2, -5.158074,
-2.92194, 3, -5.158074,
-2.92194, -2, -5.158074,
-3.080078, -2, -5.419747,
-2.92194, -1, -5.158074,
-3.080078, -1, -5.419747,
-2.92194, 0, -5.158074,
-3.080078, 0, -5.419747,
-2.92194, 1, -5.158074,
-3.080078, 1, -5.419747,
-2.92194, 2, -5.158074,
-3.080078, 2, -5.419747,
-2.92194, 3, -5.158074,
-3.080078, 3, -5.419747
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
-3.396353, -2, -5.943093, 0, -0.5, 0.5, 0.5,
-3.396353, -2, -5.943093, 1, -0.5, 0.5, 0.5,
-3.396353, -2, -5.943093, 1, 1.5, 0.5, 0.5,
-3.396353, -2, -5.943093, 0, 1.5, 0.5, 0.5,
-3.396353, -1, -5.943093, 0, -0.5, 0.5, 0.5,
-3.396353, -1, -5.943093, 1, -0.5, 0.5, 0.5,
-3.396353, -1, -5.943093, 1, 1.5, 0.5, 0.5,
-3.396353, -1, -5.943093, 0, 1.5, 0.5, 0.5,
-3.396353, 0, -5.943093, 0, -0.5, 0.5, 0.5,
-3.396353, 0, -5.943093, 1, -0.5, 0.5, 0.5,
-3.396353, 0, -5.943093, 1, 1.5, 0.5, 0.5,
-3.396353, 0, -5.943093, 0, 1.5, 0.5, 0.5,
-3.396353, 1, -5.943093, 0, -0.5, 0.5, 0.5,
-3.396353, 1, -5.943093, 1, -0.5, 0.5, 0.5,
-3.396353, 1, -5.943093, 1, 1.5, 0.5, 0.5,
-3.396353, 1, -5.943093, 0, 1.5, 0.5, 0.5,
-3.396353, 2, -5.943093, 0, -0.5, 0.5, 0.5,
-3.396353, 2, -5.943093, 1, -0.5, 0.5, 0.5,
-3.396353, 2, -5.943093, 1, 1.5, 0.5, 0.5,
-3.396353, 2, -5.943093, 0, 1.5, 0.5, 0.5,
-3.396353, 3, -5.943093, 0, -0.5, 0.5, 0.5,
-3.396353, 3, -5.943093, 1, -0.5, 0.5, 0.5,
-3.396353, 3, -5.943093, 1, 1.5, 0.5, 0.5,
-3.396353, 3, -5.943093, 0, 1.5, 0.5, 0.5
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
-2.92194, -2.939022, -4,
-2.92194, -2.939022, 4,
-2.92194, -2.939022, -4,
-3.080078, -3.106398, -4,
-2.92194, -2.939022, -2,
-3.080078, -3.106398, -2,
-2.92194, -2.939022, 0,
-3.080078, -3.106398, 0,
-2.92194, -2.939022, 2,
-3.080078, -3.106398, 2,
-2.92194, -2.939022, 4,
-3.080078, -3.106398, 4
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
-3.396353, -3.441148, -4, 0, -0.5, 0.5, 0.5,
-3.396353, -3.441148, -4, 1, -0.5, 0.5, 0.5,
-3.396353, -3.441148, -4, 1, 1.5, 0.5, 0.5,
-3.396353, -3.441148, -4, 0, 1.5, 0.5, 0.5,
-3.396353, -3.441148, -2, 0, -0.5, 0.5, 0.5,
-3.396353, -3.441148, -2, 1, -0.5, 0.5, 0.5,
-3.396353, -3.441148, -2, 1, 1.5, 0.5, 0.5,
-3.396353, -3.441148, -2, 0, 1.5, 0.5, 0.5,
-3.396353, -3.441148, 0, 0, -0.5, 0.5, 0.5,
-3.396353, -3.441148, 0, 1, -0.5, 0.5, 0.5,
-3.396353, -3.441148, 0, 1, 1.5, 0.5, 0.5,
-3.396353, -3.441148, 0, 0, 1.5, 0.5, 0.5,
-3.396353, -3.441148, 2, 0, -0.5, 0.5, 0.5,
-3.396353, -3.441148, 2, 1, -0.5, 0.5, 0.5,
-3.396353, -3.441148, 2, 1, 1.5, 0.5, 0.5,
-3.396353, -3.441148, 2, 0, 1.5, 0.5, 0.5,
-3.396353, -3.441148, 4, 0, -0.5, 0.5, 0.5,
-3.396353, -3.441148, 4, 1, -0.5, 0.5, 0.5,
-3.396353, -3.441148, 4, 1, 1.5, 0.5, 0.5,
-3.396353, -3.441148, 4, 0, 1.5, 0.5, 0.5
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
-2.92194, -2.939022, -5.158074,
-2.92194, 3.755986, -5.158074,
-2.92194, -2.939022, 5.308835,
-2.92194, 3.755986, 5.308835,
-2.92194, -2.939022, -5.158074,
-2.92194, -2.939022, 5.308835,
-2.92194, 3.755986, -5.158074,
-2.92194, 3.755986, 5.308835,
-2.92194, -2.939022, -5.158074,
3.403574, -2.939022, -5.158074,
-2.92194, -2.939022, 5.308835,
3.403574, -2.939022, 5.308835,
-2.92194, 3.755986, -5.158074,
3.403574, 3.755986, -5.158074,
-2.92194, 3.755986, 5.308835,
3.403574, 3.755986, 5.308835,
3.403574, -2.939022, -5.158074,
3.403574, 3.755986, -5.158074,
3.403574, -2.939022, 5.308835,
3.403574, 3.755986, 5.308835,
3.403574, -2.939022, -5.158074,
3.403574, -2.939022, 5.308835,
3.403574, 3.755986, -5.158074,
3.403574, 3.755986, 5.308835
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
var radius = 7.444989;
var distance = 33.1236;
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
mvMatrix.translate( -0.2408172, -0.4084817, -0.07538009 );
mvMatrix.scale( 1.272571, 1.202339, 0.7690587 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.1236);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
mepanipyrim<-read.table("mepanipyrim.xyz")
```

```
## Error in read.table("mepanipyrim.xyz"): no lines available in input
```

```r
x<-mepanipyrim$V2
```

```
## Error in eval(expr, envir, enclos): object 'mepanipyrim' not found
```

```r
y<-mepanipyrim$V3
```

```
## Error in eval(expr, envir, enclos): object 'mepanipyrim' not found
```

```r
z<-mepanipyrim$V4
```

```
## Error in eval(expr, envir, enclos): object 'mepanipyrim' not found
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
-2.829821, 0.6382744, -1.202591, 0, 0, 1, 1, 1,
-2.818208, 0.8837757, 0.4629992, 1, 0, 0, 1, 1,
-2.679893, 0.2110783, -0.6353149, 1, 0, 0, 1, 1,
-2.440041, 1.365797, -1.911862, 1, 0, 0, 1, 1,
-2.366471, 0.1698366, -3.625425, 1, 0, 0, 1, 1,
-2.317272, -0.05010806, -1.955194, 1, 0, 0, 1, 1,
-2.267245, 0.3072043, -2.5513, 0, 0, 0, 1, 1,
-2.225067, -0.9715316, -3.423648, 0, 0, 0, 1, 1,
-2.223645, 0.4311199, -1.032481, 0, 0, 0, 1, 1,
-2.199707, 0.07355457, -1.545907, 0, 0, 0, 1, 1,
-2.192193, 0.2266268, -0.3964576, 0, 0, 0, 1, 1,
-2.159297, 0.2368936, -2.539201, 0, 0, 0, 1, 1,
-2.147132, 0.4533559, -1.305337, 0, 0, 0, 1, 1,
-2.111998, -0.7702963, -1.804171, 1, 1, 1, 1, 1,
-2.091024, 3.658486, -1.561208, 1, 1, 1, 1, 1,
-2.018153, -0.6058844, -2.030544, 1, 1, 1, 1, 1,
-1.999214, 0.9516619, -0.7911181, 1, 1, 1, 1, 1,
-1.989014, -0.01274117, -1.204229, 1, 1, 1, 1, 1,
-1.973402, -2.013342, -1.721556, 1, 1, 1, 1, 1,
-1.972809, -0.4516844, -4.368511, 1, 1, 1, 1, 1,
-1.961721, -0.5028769, -3.024406, 1, 1, 1, 1, 1,
-1.943961, 1.17798, -0.4831968, 1, 1, 1, 1, 1,
-1.941391, 0.522993, -2.782218, 1, 1, 1, 1, 1,
-1.930667, 1.78027, -1.078901, 1, 1, 1, 1, 1,
-1.896512, 0.1521961, -1.411247, 1, 1, 1, 1, 1,
-1.868746, 0.5127559, -1.079193, 1, 1, 1, 1, 1,
-1.86663, 0.7340297, -1.500942, 1, 1, 1, 1, 1,
-1.826614, 0.1426467, -1.176982, 1, 1, 1, 1, 1,
-1.823022, 1.552717, -2.400202, 0, 0, 1, 1, 1,
-1.797869, 1.059213, -2.385431, 1, 0, 0, 1, 1,
-1.790684, -0.7605737, -4.066784, 1, 0, 0, 1, 1,
-1.787911, -1.246915, -2.605572, 1, 0, 0, 1, 1,
-1.783938, -1.139713, -3.091292, 1, 0, 0, 1, 1,
-1.781955, 0.3354039, -1.502085, 1, 0, 0, 1, 1,
-1.768143, 0.8862376, -1.011347, 0, 0, 0, 1, 1,
-1.753347, 1.634486, -0.3780712, 0, 0, 0, 1, 1,
-1.747438, 1.020734, -1.795415, 0, 0, 0, 1, 1,
-1.746117, 1.756422, -1.316698, 0, 0, 0, 1, 1,
-1.712388, 0.6612239, -2.87437, 0, 0, 0, 1, 1,
-1.706573, 0.6395847, 0.885675, 0, 0, 0, 1, 1,
-1.678196, -0.6926214, -1.345525, 0, 0, 0, 1, 1,
-1.677078, -0.08241333, -0.8035102, 1, 1, 1, 1, 1,
-1.670926, -2.110513, -2.232064, 1, 1, 1, 1, 1,
-1.662167, -0.4693279, -2.673414, 1, 1, 1, 1, 1,
-1.660061, -0.3747463, -2.358561, 1, 1, 1, 1, 1,
-1.658528, 0.2170988, -1.845764, 1, 1, 1, 1, 1,
-1.653535, 0.5236678, -0.04716771, 1, 1, 1, 1, 1,
-1.646538, 1.696503, 0.4283487, 1, 1, 1, 1, 1,
-1.63624, -0.7652143, -0.6416394, 1, 1, 1, 1, 1,
-1.631921, 1.656773, -1.846196, 1, 1, 1, 1, 1,
-1.627226, 0.9634494, -1.6399, 1, 1, 1, 1, 1,
-1.619824, -0.2541482, -2.845167, 1, 1, 1, 1, 1,
-1.618673, -0.3268349, -3.417577, 1, 1, 1, 1, 1,
-1.617536, -0.004279125, -1.665852, 1, 1, 1, 1, 1,
-1.610687, -0.215511, -1.477926, 1, 1, 1, 1, 1,
-1.602805, -0.7209675, -1.41834, 1, 1, 1, 1, 1,
-1.58908, -0.6557333, -2.148208, 0, 0, 1, 1, 1,
-1.582632, 0.2191795, -1.857283, 1, 0, 0, 1, 1,
-1.580256, -0.159799, -1.230948, 1, 0, 0, 1, 1,
-1.579658, 0.6604989, 0.1846446, 1, 0, 0, 1, 1,
-1.578277, 0.5461816, 0.008036095, 1, 0, 0, 1, 1,
-1.573414, 0.5018122, -2.273896, 1, 0, 0, 1, 1,
-1.542133, -0.5717061, -1.000116, 0, 0, 0, 1, 1,
-1.540922, 2.128537, 0.6064795, 0, 0, 0, 1, 1,
-1.537354, -1.760363, -2.111373, 0, 0, 0, 1, 1,
-1.530868, -0.8016024, -1.371664, 0, 0, 0, 1, 1,
-1.529847, -0.5351934, -1.473772, 0, 0, 0, 1, 1,
-1.519543, -0.1319811, -1.665125, 0, 0, 0, 1, 1,
-1.514858, -0.7158579, -2.735005, 0, 0, 0, 1, 1,
-1.494008, -0.7995878, -2.256245, 1, 1, 1, 1, 1,
-1.489879, 0.1342593, -1.457397, 1, 1, 1, 1, 1,
-1.476522, -0.8450813, -3.295624, 1, 1, 1, 1, 1,
-1.469462, -1.73316, -4.247824, 1, 1, 1, 1, 1,
-1.467641, 0.9413389, 0.1326102, 1, 1, 1, 1, 1,
-1.465936, -0.2853608, -1.718214, 1, 1, 1, 1, 1,
-1.465214, 0.7035984, 0.447364, 1, 1, 1, 1, 1,
-1.461512, -2.576111, -4.162339, 1, 1, 1, 1, 1,
-1.46096, -0.662581, -0.9694251, 1, 1, 1, 1, 1,
-1.44933, 0.6717027, -0.04879982, 1, 1, 1, 1, 1,
-1.446736, 0.8211372, -1.877828, 1, 1, 1, 1, 1,
-1.446121, 0.5138861, 0.1197661, 1, 1, 1, 1, 1,
-1.426656, 0.7427972, -1.621292, 1, 1, 1, 1, 1,
-1.425614, 0.8426849, -1.599597, 1, 1, 1, 1, 1,
-1.424911, 0.6331556, -0.5450855, 1, 1, 1, 1, 1,
-1.408222, -0.614882, -1.21485, 0, 0, 1, 1, 1,
-1.403258, 0.8484103, -1.687849, 1, 0, 0, 1, 1,
-1.395091, -0.1528004, -1.844682, 1, 0, 0, 1, 1,
-1.369908, 1.342767, -0.8333853, 1, 0, 0, 1, 1,
-1.360067, -0.6956535, -2.938547, 1, 0, 0, 1, 1,
-1.349952, 1.004303, -0.5666861, 1, 0, 0, 1, 1,
-1.348002, 0.05592911, -0.477583, 0, 0, 0, 1, 1,
-1.341961, 2.00118, -0.4557077, 0, 0, 0, 1, 1,
-1.34161, -2.009914, -1.895216, 0, 0, 0, 1, 1,
-1.330022, -1.591735, -4.777414, 0, 0, 0, 1, 1,
-1.329639, -0.8366991, -1.750145, 0, 0, 0, 1, 1,
-1.325055, -1.558487, -1.391229, 0, 0, 0, 1, 1,
-1.321011, -0.0849541, -1.569157, 0, 0, 0, 1, 1,
-1.319291, -1.199767, -3.573804, 1, 1, 1, 1, 1,
-1.315419, 0.3880989, -1.677978, 1, 1, 1, 1, 1,
-1.312645, -0.5509416, -1.877596, 1, 1, 1, 1, 1,
-1.310916, 0.8815361, -2.032316, 1, 1, 1, 1, 1,
-1.305577, -0.4721151, -1.188081, 1, 1, 1, 1, 1,
-1.294021, -0.4931276, -1.626383, 1, 1, 1, 1, 1,
-1.29384, -0.1243789, 0.2772144, 1, 1, 1, 1, 1,
-1.285093, 0.1457545, -1.696187, 1, 1, 1, 1, 1,
-1.280847, -1.009557, -1.516315, 1, 1, 1, 1, 1,
-1.277884, 2.244825, 0.1453078, 1, 1, 1, 1, 1,
-1.27734, 0.2922628, -1.394593, 1, 1, 1, 1, 1,
-1.268499, -0.5754605, -1.274697, 1, 1, 1, 1, 1,
-1.266388, -0.2470546, -1.709975, 1, 1, 1, 1, 1,
-1.255126, 0.3085986, -2.611859, 1, 1, 1, 1, 1,
-1.252312, -0.3009555, -2.393298, 1, 1, 1, 1, 1,
-1.251066, -1.625724, -5.005644, 0, 0, 1, 1, 1,
-1.238134, 1.016698, -0.4979835, 1, 0, 0, 1, 1,
-1.230852, 0.7747186, -1.867437, 1, 0, 0, 1, 1,
-1.229625, 1.37255, -2.069987, 1, 0, 0, 1, 1,
-1.227809, -0.2885286, -1.160458, 1, 0, 0, 1, 1,
-1.221951, -2.347625, -3.242549, 1, 0, 0, 1, 1,
-1.212847, 1.218692, -1.628426, 0, 0, 0, 1, 1,
-1.210364, 2.075464, -0.7828532, 0, 0, 0, 1, 1,
-1.192222, -1.601705, -4.620327, 0, 0, 0, 1, 1,
-1.190892, 0.6852289, -2.116565, 0, 0, 0, 1, 1,
-1.186201, -1.475927, -3.472451, 0, 0, 0, 1, 1,
-1.183852, -0.2915157, -0.9703462, 0, 0, 0, 1, 1,
-1.18296, 0.427513, 0.600961, 0, 0, 0, 1, 1,
-1.16666, 0.1160476, 0.02872759, 1, 1, 1, 1, 1,
-1.156012, 2.401708, -0.3504167, 1, 1, 1, 1, 1,
-1.147246, 1.383625, 0.5528604, 1, 1, 1, 1, 1,
-1.13736, 0.5616239, -0.6635748, 1, 1, 1, 1, 1,
-1.136541, -1.463269, -1.991999, 1, 1, 1, 1, 1,
-1.1348, -1.869438, -2.94618, 1, 1, 1, 1, 1,
-1.132172, -2.527513, -4.905131, 1, 1, 1, 1, 1,
-1.1276, -0.4393258, -0.8377085, 1, 1, 1, 1, 1,
-1.119778, -0.6717805, -3.568135, 1, 1, 1, 1, 1,
-1.118711, -0.1413665, -1.738793, 1, 1, 1, 1, 1,
-1.11824, -0.5961115, -0.1807545, 1, 1, 1, 1, 1,
-1.11799, -1.4964, -2.176538, 1, 1, 1, 1, 1,
-1.109876, -0.3088924, -2.085952, 1, 1, 1, 1, 1,
-1.10817, -1.077518, -3.964861, 1, 1, 1, 1, 1,
-1.104659, -2.548493, -2.590757, 1, 1, 1, 1, 1,
-1.100991, -1.982653, -2.75397, 0, 0, 1, 1, 1,
-1.092897, -1.809743, -2.379803, 1, 0, 0, 1, 1,
-1.092213, 0.3129435, -1.168657, 1, 0, 0, 1, 1,
-1.088841, 0.9807547, -0.4256021, 1, 0, 0, 1, 1,
-1.083364, -0.9209637, -3.667779, 1, 0, 0, 1, 1,
-1.082199, -0.4211842, 0.3489116, 1, 0, 0, 1, 1,
-1.081888, 0.7776899, -1.318935, 0, 0, 0, 1, 1,
-1.081647, -0.06187991, -2.140211, 0, 0, 0, 1, 1,
-1.074808, 1.10827, -0.9324265, 0, 0, 0, 1, 1,
-1.073747, 0.0388125, -0.4878736, 0, 0, 0, 1, 1,
-1.073201, 1.473877, -0.9674464, 0, 0, 0, 1, 1,
-1.063268, 0.5194293, -0.3877614, 0, 0, 0, 1, 1,
-1.061016, 1.055175, -2.067054, 0, 0, 0, 1, 1,
-1.059545, -0.5338574, -3.762011, 1, 1, 1, 1, 1,
-1.058553, 1.802411, -0.7917213, 1, 1, 1, 1, 1,
-1.053244, 0.205026, 0.03302628, 1, 1, 1, 1, 1,
-1.045629, 0.9397327, 0.05629933, 1, 1, 1, 1, 1,
-1.045543, -0.6411802, -2.389647, 1, 1, 1, 1, 1,
-1.044373, -0.296791, -1.443107, 1, 1, 1, 1, 1,
-1.030554, 1.634611, -0.5147734, 1, 1, 1, 1, 1,
-1.027221, 0.4549834, -0.9342391, 1, 1, 1, 1, 1,
-1.022176, -0.7787721, -2.922331, 1, 1, 1, 1, 1,
-1.021569, 0.6507625, 1.364904, 1, 1, 1, 1, 1,
-1.003388, 0.4920099, -0.7372787, 1, 1, 1, 1, 1,
-1.000176, -0.2692865, -2.598326, 1, 1, 1, 1, 1,
-0.997813, -0.8792991, -3.020319, 1, 1, 1, 1, 1,
-0.9922208, 1.276304, -0.3813984, 1, 1, 1, 1, 1,
-0.9879901, -0.7704452, -1.804034, 1, 1, 1, 1, 1,
-0.9850361, -1.766175, -2.016909, 0, 0, 1, 1, 1,
-0.9766957, -0.412117, -3.974968, 1, 0, 0, 1, 1,
-0.9693781, 0.1703537, 0.2724161, 1, 0, 0, 1, 1,
-0.9600053, 0.6182853, -1.060263, 1, 0, 0, 1, 1,
-0.9518335, -1.246104, -2.958713, 1, 0, 0, 1, 1,
-0.9489456, -0.9519314, -2.564145, 1, 0, 0, 1, 1,
-0.9477193, -0.7499403, -0.2947471, 0, 0, 0, 1, 1,
-0.9475367, -0.3154307, -2.948522, 0, 0, 0, 1, 1,
-0.9371414, 1.269427, -0.1913486, 0, 0, 0, 1, 1,
-0.9360017, 0.6993443, -0.09084841, 0, 0, 0, 1, 1,
-0.9351347, -0.9377037, -3.012408, 0, 0, 0, 1, 1,
-0.9325013, 0.4236533, 0.3238961, 0, 0, 0, 1, 1,
-0.9300962, -0.01419428, -0.6890951, 0, 0, 0, 1, 1,
-0.9276543, 1.05893, -1.412188, 1, 1, 1, 1, 1,
-0.9226234, 1.0805, -3.20823, 1, 1, 1, 1, 1,
-0.9216067, -1.094453, -1.306594, 1, 1, 1, 1, 1,
-0.9187819, -0.319508, -2.937974, 1, 1, 1, 1, 1,
-0.9091921, 0.8707956, -1.565339, 1, 1, 1, 1, 1,
-0.9085885, 1.200834, 0.7151207, 1, 1, 1, 1, 1,
-0.9026379, 0.8950504, -0.8612663, 1, 1, 1, 1, 1,
-0.8977128, 0.9074855, -0.4107972, 1, 1, 1, 1, 1,
-0.8919533, -0.7288303, -1.932485, 1, 1, 1, 1, 1,
-0.8916297, -0.2553967, -0.2998525, 1, 1, 1, 1, 1,
-0.8910341, -2.326371, -1.379723, 1, 1, 1, 1, 1,
-0.8884227, 0.6526136, -1.842047, 1, 1, 1, 1, 1,
-0.8844973, -0.5195505, -2.64752, 1, 1, 1, 1, 1,
-0.8799626, 0.7342502, 0.3202038, 1, 1, 1, 1, 1,
-0.8755623, 0.5518094, -0.8147436, 1, 1, 1, 1, 1,
-0.873886, 0.7951882, -1.48254, 0, 0, 1, 1, 1,
-0.8668507, 1.356848, -1.504515, 1, 0, 0, 1, 1,
-0.8639936, 0.2543904, 0.2601924, 1, 0, 0, 1, 1,
-0.8621256, 1.050264, -1.949211, 1, 0, 0, 1, 1,
-0.8578163, 1.703831, -0.6598585, 1, 0, 0, 1, 1,
-0.857149, 0.8450198, -1.670431, 1, 0, 0, 1, 1,
-0.853443, 0.4740468, -2.364166, 0, 0, 0, 1, 1,
-0.8469502, 0.8707966, -1.515926, 0, 0, 0, 1, 1,
-0.8461763, 0.5552278, -0.9541318, 0, 0, 0, 1, 1,
-0.8430014, 0.3572322, -0.2653228, 0, 0, 0, 1, 1,
-0.8308156, 1.452981, -2.472025, 0, 0, 0, 1, 1,
-0.8220962, 1.029097, -0.3794059, 0, 0, 0, 1, 1,
-0.8195179, -1.198764, -2.627023, 0, 0, 0, 1, 1,
-0.8182876, 0.5255534, -1.241456, 1, 1, 1, 1, 1,
-0.8164243, -1.130945, -2.595153, 1, 1, 1, 1, 1,
-0.8160099, 0.2303876, -2.444013, 1, 1, 1, 1, 1,
-0.8076036, -2.76414, -3.20758, 1, 1, 1, 1, 1,
-0.8061858, -0.4331656, 0.1968165, 1, 1, 1, 1, 1,
-0.8054317, -0.198815, -2.469751, 1, 1, 1, 1, 1,
-0.7994269, 0.08555205, -1.519262, 1, 1, 1, 1, 1,
-0.7987209, -0.3907005, -3.021816, 1, 1, 1, 1, 1,
-0.7978484, -0.1190345, -3.075711, 1, 1, 1, 1, 1,
-0.7976974, 0.7736521, -0.4698285, 1, 1, 1, 1, 1,
-0.7950144, 0.9680503, -1.647205, 1, 1, 1, 1, 1,
-0.7931303, -0.03321031, -0.6226302, 1, 1, 1, 1, 1,
-0.7912193, -1.20612, -1.826083, 1, 1, 1, 1, 1,
-0.7900784, 0.1845554, -1.313929, 1, 1, 1, 1, 1,
-0.789866, 0.2860727, -0.8502531, 1, 1, 1, 1, 1,
-0.7886223, 0.5451968, -1.396816, 0, 0, 1, 1, 1,
-0.7873588, -1.09238, -1.283954, 1, 0, 0, 1, 1,
-0.787353, -1.487105, -3.401331, 1, 0, 0, 1, 1,
-0.7852268, 0.4262344, -0.08599028, 1, 0, 0, 1, 1,
-0.7851185, 0.007143158, -1.952649, 1, 0, 0, 1, 1,
-0.7784202, 0.4253153, -1.734427, 1, 0, 0, 1, 1,
-0.7782778, 0.5270623, -1.043819, 0, 0, 0, 1, 1,
-0.7710885, 2.320466, -0.1744178, 0, 0, 0, 1, 1,
-0.7665025, -0.2553191, -0.7379718, 0, 0, 0, 1, 1,
-0.7645643, -1.19388, -2.998989, 0, 0, 0, 1, 1,
-0.7617756, -1.255273, -2.355141, 0, 0, 0, 1, 1,
-0.7605929, 0.194477, -0.5724456, 0, 0, 0, 1, 1,
-0.7592263, -0.3444405, -2.176256, 0, 0, 0, 1, 1,
-0.7479051, 1.730433, -0.9247131, 1, 1, 1, 1, 1,
-0.7447898, -2.250556, -1.17279, 1, 1, 1, 1, 1,
-0.7402018, -2.085178, -3.155028, 1, 1, 1, 1, 1,
-0.736782, -0.3026243, -1.952746, 1, 1, 1, 1, 1,
-0.7332571, -0.07796856, -0.6953362, 1, 1, 1, 1, 1,
-0.7294916, -0.07763551, -2.306189, 1, 1, 1, 1, 1,
-0.7256518, -0.6317577, -1.073875, 1, 1, 1, 1, 1,
-0.7240223, 0.4165255, -2.578366, 1, 1, 1, 1, 1,
-0.7205923, 0.3858735, 0.297083, 1, 1, 1, 1, 1,
-0.7193677, 0.7070332, -1.554338, 1, 1, 1, 1, 1,
-0.7123731, 0.1617806, -0.0826043, 1, 1, 1, 1, 1,
-0.7102425, -1.297937, -2.434294, 1, 1, 1, 1, 1,
-0.7082434, -1.454573, -2.176178, 1, 1, 1, 1, 1,
-0.7080999, -0.1010298, -0.8302177, 1, 1, 1, 1, 1,
-0.7078553, -0.4669054, -2.786102, 1, 1, 1, 1, 1,
-0.70568, 1.188762, -0.678486, 0, 0, 1, 1, 1,
-0.7047228, 0.7260858, 0.1156156, 1, 0, 0, 1, 1,
-0.7042088, 1.263145, -0.4170389, 1, 0, 0, 1, 1,
-0.6983371, 3.213399, -1.407033, 1, 0, 0, 1, 1,
-0.6969428, -1.098205, -3.709187, 1, 0, 0, 1, 1,
-0.6839442, 0.3854626, -1.084709, 1, 0, 0, 1, 1,
-0.6794459, 1.6331, -1.846389, 0, 0, 0, 1, 1,
-0.678993, 0.3701828, -1.28403, 0, 0, 0, 1, 1,
-0.6756471, 1.423802, 0.6471593, 0, 0, 0, 1, 1,
-0.6727707, -0.16539, -1.07697, 0, 0, 0, 1, 1,
-0.666168, 0.4468776, 0.7756215, 0, 0, 0, 1, 1,
-0.6603488, 0.6832196, -0.3299142, 0, 0, 0, 1, 1,
-0.6582384, 0.7797434, 0.2169106, 0, 0, 0, 1, 1,
-0.6582264, 0.669931, -0.8912467, 1, 1, 1, 1, 1,
-0.6580697, -0.1877172, -2.858135, 1, 1, 1, 1, 1,
-0.6561133, 0.9797292, 0.1804766, 1, 1, 1, 1, 1,
-0.6542253, 1.437034, -0.1974507, 1, 1, 1, 1, 1,
-0.6532062, -0.1336714, -1.257224, 1, 1, 1, 1, 1,
-0.6523498, -0.01159289, -2.121602, 1, 1, 1, 1, 1,
-0.6509145, 1.325432, -0.7732238, 1, 1, 1, 1, 1,
-0.6503036, -1.962382, -1.933952, 1, 1, 1, 1, 1,
-0.6467952, -0.609812, -2.086255, 1, 1, 1, 1, 1,
-0.6409305, 0.6718231, -1.559507, 1, 1, 1, 1, 1,
-0.6403224, 0.8195517, -0.7120844, 1, 1, 1, 1, 1,
-0.6367455, -0.01844092, -1.61351, 1, 1, 1, 1, 1,
-0.6280023, -0.1939053, -1.103943, 1, 1, 1, 1, 1,
-0.6276272, 0.3662946, -0.1825768, 1, 1, 1, 1, 1,
-0.6255831, -1.125717, -3.036682, 1, 1, 1, 1, 1,
-0.6186258, -1.513223, -4.658195, 0, 0, 1, 1, 1,
-0.6172787, 0.4494808, -2.53229, 1, 0, 0, 1, 1,
-0.6134936, -0.5382711, -2.025366, 1, 0, 0, 1, 1,
-0.6062799, -0.413073, -3.64018, 1, 0, 0, 1, 1,
-0.605353, 1.097933, -1.755988, 1, 0, 0, 1, 1,
-0.6051614, -0.6305413, -3.127991, 1, 0, 0, 1, 1,
-0.6050532, 2.252857, 0.01666437, 0, 0, 0, 1, 1,
-0.6013058, 0.4150833, -0.4854325, 0, 0, 0, 1, 1,
-0.5914189, 1.067542, 0.8485676, 0, 0, 0, 1, 1,
-0.5912983, -1.786188, -3.428961, 0, 0, 0, 1, 1,
-0.5894673, -0.9233659, -4.138331, 0, 0, 0, 1, 1,
-0.5823418, -0.6628, -2.72104, 0, 0, 0, 1, 1,
-0.5789468, -0.5325007, -2.764405, 0, 0, 0, 1, 1,
-0.5782638, -0.2406979, -0.2834713, 1, 1, 1, 1, 1,
-0.5778053, 0.9869921, -0.04857004, 1, 1, 1, 1, 1,
-0.5762798, 1.669661, -0.7910723, 1, 1, 1, 1, 1,
-0.5731503, -0.8275626, -0.8805402, 1, 1, 1, 1, 1,
-0.5718383, 1.017482, -3.521207, 1, 1, 1, 1, 1,
-0.5683917, -0.3044973, -0.8529966, 1, 1, 1, 1, 1,
-0.5638989, -0.2775922, -2.535879, 1, 1, 1, 1, 1,
-0.5629659, 0.5900655, -2.718812, 1, 1, 1, 1, 1,
-0.5622355, 1.336479, 0.2343087, 1, 1, 1, 1, 1,
-0.5581154, 0.2323374, -1.074376, 1, 1, 1, 1, 1,
-0.5565051, 0.3918129, -1.776637, 1, 1, 1, 1, 1,
-0.5503874, 0.3482229, -1.086035, 1, 1, 1, 1, 1,
-0.5492994, 1.921508, 0.2625873, 1, 1, 1, 1, 1,
-0.5472304, -0.06561793, -2.498045, 1, 1, 1, 1, 1,
-0.5472065, 1.169126, 0.2144543, 1, 1, 1, 1, 1,
-0.5441868, -1.179224, -3.043073, 0, 0, 1, 1, 1,
-0.5438117, 1.20544, 0.5411217, 1, 0, 0, 1, 1,
-0.5432045, 0.5280673, 0.8396417, 1, 0, 0, 1, 1,
-0.5401866, 0.04457863, -1.106705, 1, 0, 0, 1, 1,
-0.5316073, -0.1186757, -4.073827, 1, 0, 0, 1, 1,
-0.5206447, -0.3545396, -2.674335, 1, 0, 0, 1, 1,
-0.5173427, -0.3489571, -1.898264, 0, 0, 0, 1, 1,
-0.5140291, -1.539418, -3.487402, 0, 0, 0, 1, 1,
-0.506337, 0.2080894, -1.560255, 0, 0, 0, 1, 1,
-0.5062808, 0.6951056, -2.337033, 0, 0, 0, 1, 1,
-0.5028568, -0.9277883, -1.736183, 0, 0, 0, 1, 1,
-0.5017875, 0.7212738, -0.01825041, 0, 0, 0, 1, 1,
-0.5016398, -0.5124065, -3.230328, 0, 0, 0, 1, 1,
-0.5007446, 0.5235117, -0.1583328, 1, 1, 1, 1, 1,
-0.4944275, 0.9919286, -0.8143641, 1, 1, 1, 1, 1,
-0.4938367, -0.2121359, 1.05284, 1, 1, 1, 1, 1,
-0.484787, 1.637428, 0.930688, 1, 1, 1, 1, 1,
-0.4823985, -1.889146, -2.060802, 1, 1, 1, 1, 1,
-0.4791311, 0.8590887, 0.01106229, 1, 1, 1, 1, 1,
-0.4767017, 0.9062774, -1.105389, 1, 1, 1, 1, 1,
-0.4720876, -0.8487853, -3.118042, 1, 1, 1, 1, 1,
-0.4705852, -0.1706342, -1.05406, 1, 1, 1, 1, 1,
-0.4703853, 1.31053, 0.7467611, 1, 1, 1, 1, 1,
-0.4693049, -1.695237, -3.42574, 1, 1, 1, 1, 1,
-0.4684535, 0.5038339, -1.416016, 1, 1, 1, 1, 1,
-0.4672106, -0.2100372, -1.974227, 1, 1, 1, 1, 1,
-0.4654115, 0.2111587, 0.03061297, 1, 1, 1, 1, 1,
-0.4649157, -1.540073, -1.48796, 1, 1, 1, 1, 1,
-0.4617501, 0.140946, -2.115221, 0, 0, 1, 1, 1,
-0.4571198, 0.5793704, -1.204459, 1, 0, 0, 1, 1,
-0.456495, 0.7278573, 0.247308, 1, 0, 0, 1, 1,
-0.4561188, 0.05051769, -2.112193, 1, 0, 0, 1, 1,
-0.4524918, -1.489874, -3.282635, 1, 0, 0, 1, 1,
-0.451106, 0.1693847, -0.722894, 1, 0, 0, 1, 1,
-0.4494826, -0.07549916, -0.2181713, 0, 0, 0, 1, 1,
-0.4489466, -1.252163, -2.879797, 0, 0, 0, 1, 1,
-0.4487751, 0.4365656, -0.4535787, 0, 0, 0, 1, 1,
-0.4487747, 0.4752784, -2.325349, 0, 0, 0, 1, 1,
-0.4487297, -0.9236093, -2.10452, 0, 0, 0, 1, 1,
-0.4486293, -0.5675411, -1.237454, 0, 0, 0, 1, 1,
-0.4484221, 0.6971024, -1.171037, 0, 0, 0, 1, 1,
-0.4386739, -0.7277113, -0.735038, 1, 1, 1, 1, 1,
-0.4374082, -0.4959849, -3.00616, 1, 1, 1, 1, 1,
-0.4322388, 1.31237, 1.738394, 1, 1, 1, 1, 1,
-0.4319084, -0.4465051, -3.524167, 1, 1, 1, 1, 1,
-0.427936, 0.1222309, -3.021335, 1, 1, 1, 1, 1,
-0.4265981, -0.5878943, -1.77326, 1, 1, 1, 1, 1,
-0.423843, 0.4691638, -1.404191, 1, 1, 1, 1, 1,
-0.4225244, -0.8869856, -0.9321062, 1, 1, 1, 1, 1,
-0.4198518, 1.41096, -0.2039313, 1, 1, 1, 1, 1,
-0.4177696, -2.841522, -4.669577, 1, 1, 1, 1, 1,
-0.4170956, -0.7019826, -2.186008, 1, 1, 1, 1, 1,
-0.4169304, -1.849424, -2.620072, 1, 1, 1, 1, 1,
-0.4083975, -0.01537427, 0.9303652, 1, 1, 1, 1, 1,
-0.4048185, -0.2520062, -1.455755, 1, 1, 1, 1, 1,
-0.4040924, 0.5707052, 0.1410072, 1, 1, 1, 1, 1,
-0.3998749, -0.0974458, -1.825588, 0, 0, 1, 1, 1,
-0.3973931, -1.040267, -2.649448, 1, 0, 0, 1, 1,
-0.3948616, -0.02180346, -2.078855, 1, 0, 0, 1, 1,
-0.3942893, 0.1652006, -3.170649, 1, 0, 0, 1, 1,
-0.3935289, 2.1354, 1.015997, 1, 0, 0, 1, 1,
-0.3904764, -1.235505, -2.771721, 1, 0, 0, 1, 1,
-0.388235, 0.5837455, -1.773377, 0, 0, 0, 1, 1,
-0.3877542, -0.9080444, -3.104321, 0, 0, 0, 1, 1,
-0.3861972, 0.01674381, -2.333981, 0, 0, 0, 1, 1,
-0.3856032, 1.47758, 0.3424576, 0, 0, 0, 1, 1,
-0.384542, 0.8639464, 0.02154878, 0, 0, 0, 1, 1,
-0.3834022, -0.200655, -2.351295, 0, 0, 0, 1, 1,
-0.3833655, 0.5763552, 0.8892004, 0, 0, 0, 1, 1,
-0.3816812, 1.846813, 0.8668514, 1, 1, 1, 1, 1,
-0.3814481, 0.408401, -2.758693, 1, 1, 1, 1, 1,
-0.3795626, -0.4203955, -1.167079, 1, 1, 1, 1, 1,
-0.3773931, -0.2376183, -3.877745, 1, 1, 1, 1, 1,
-0.3747096, 0.9999607, 0.09929949, 1, 1, 1, 1, 1,
-0.3742097, -0.1942967, -0.6851172, 1, 1, 1, 1, 1,
-0.3704542, 0.1283751, -1.247762, 1, 1, 1, 1, 1,
-0.3662321, 1.532824, -0.7726331, 1, 1, 1, 1, 1,
-0.3649431, -1.083427, -1.040607, 1, 1, 1, 1, 1,
-0.3646637, -0.09411062, -1.615798, 1, 1, 1, 1, 1,
-0.36116, -1.823644, -2.870868, 1, 1, 1, 1, 1,
-0.3594663, -0.352327, -1.220612, 1, 1, 1, 1, 1,
-0.3578467, 2.339439, -0.908986, 1, 1, 1, 1, 1,
-0.3572094, -0.879473, -1.512259, 1, 1, 1, 1, 1,
-0.3518209, 1.180748, -1.536418, 1, 1, 1, 1, 1,
-0.3477638, -0.01056855, -0.7322858, 0, 0, 1, 1, 1,
-0.3464723, 0.9666167, 0.009596369, 1, 0, 0, 1, 1,
-0.3419442, -1.28116, -0.212447, 1, 0, 0, 1, 1,
-0.3364255, 0.7263467, -1.242499, 1, 0, 0, 1, 1,
-0.3359112, -0.8058996, -2.618335, 1, 0, 0, 1, 1,
-0.3359018, -0.2354671, -2.600443, 1, 0, 0, 1, 1,
-0.3358944, 0.6435353, 1.525681, 0, 0, 0, 1, 1,
-0.3356088, 0.5119314, -0.4870807, 0, 0, 0, 1, 1,
-0.3354634, 0.9908457, 0.6686264, 0, 0, 0, 1, 1,
-0.3347684, -0.9473918, -2.891171, 0, 0, 0, 1, 1,
-0.3330329, -1.072026, -3.352314, 0, 0, 0, 1, 1,
-0.3318217, 0.7212915, -0.02200888, 0, 0, 0, 1, 1,
-0.3308086, -0.4100955, -4.166907, 0, 0, 0, 1, 1,
-0.330358, -0.7623855, -3.096801, 1, 1, 1, 1, 1,
-0.3281409, -0.5548055, -2.745914, 1, 1, 1, 1, 1,
-0.31536, -0.1745287, -1.972594, 1, 1, 1, 1, 1,
-0.3140061, -0.6117203, -2.63502, 1, 1, 1, 1, 1,
-0.3137688, 0.3571776, 1.271565, 1, 1, 1, 1, 1,
-0.3113308, 0.7909178, -1.567086, 1, 1, 1, 1, 1,
-0.3034443, 0.6679071, -0.1224249, 1, 1, 1, 1, 1,
-0.2942764, -1.362073, -4.5242, 1, 1, 1, 1, 1,
-0.2899429, -0.367649, -3.232666, 1, 1, 1, 1, 1,
-0.2892316, 0.6295523, -0.1673388, 1, 1, 1, 1, 1,
-0.288749, 0.003969668, -1.267275, 1, 1, 1, 1, 1,
-0.2880458, -0.3127778, -2.259809, 1, 1, 1, 1, 1,
-0.2877815, 0.09208579, -1.179315, 1, 1, 1, 1, 1,
-0.2873083, 0.4289611, -0.8128629, 1, 1, 1, 1, 1,
-0.2797416, -0.520721, -3.786999, 1, 1, 1, 1, 1,
-0.2795465, 1.267459, -2.178199, 0, 0, 1, 1, 1,
-0.271429, -1.613409, -3.493349, 1, 0, 0, 1, 1,
-0.2704325, -0.9152053, -2.605724, 1, 0, 0, 1, 1,
-0.2689777, 0.9235637, -0.3030941, 1, 0, 0, 1, 1,
-0.2631527, -0.6021965, -3.305351, 1, 0, 0, 1, 1,
-0.2550268, 0.9664606, 0.3886088, 1, 0, 0, 1, 1,
-0.254383, 0.8038082, 0.4432997, 0, 0, 0, 1, 1,
-0.249428, 0.4565704, -0.2861643, 0, 0, 0, 1, 1,
-0.2476411, 0.04070647, -0.4391468, 0, 0, 0, 1, 1,
-0.241721, 0.269892, -0.2712052, 0, 0, 0, 1, 1,
-0.2415612, 0.9191605, -0.9075124, 0, 0, 0, 1, 1,
-0.2319891, 1.197871, 0.1097907, 0, 0, 0, 1, 1,
-0.2293883, 1.791378, 0.4881771, 0, 0, 0, 1, 1,
-0.2287578, 0.4075153, -1.26398, 1, 1, 1, 1, 1,
-0.2272369, 0.8204367, -0.8050244, 1, 1, 1, 1, 1,
-0.2265273, -0.1761941, -1.805925, 1, 1, 1, 1, 1,
-0.2150752, 0.6573934, 0.08092721, 1, 1, 1, 1, 1,
-0.2001726, 1.080658, 1.087911, 1, 1, 1, 1, 1,
-0.1997436, -0.2073186, -2.306635, 1, 1, 1, 1, 1,
-0.1961208, 1.201108, -0.8277588, 1, 1, 1, 1, 1,
-0.1951871, 1.030501, -0.8293505, 1, 1, 1, 1, 1,
-0.1946104, -0.06010624, -0.8321742, 1, 1, 1, 1, 1,
-0.1922992, -0.4803756, -2.997639, 1, 1, 1, 1, 1,
-0.1908068, -0.2124341, -2.601556, 1, 1, 1, 1, 1,
-0.1895409, -0.9540797, -3.664679, 1, 1, 1, 1, 1,
-0.1895289, 0.6329959, -0.1243041, 1, 1, 1, 1, 1,
-0.189316, -0.003622226, -0.8211924, 1, 1, 1, 1, 1,
-0.1880341, -0.4487552, -0.3118626, 1, 1, 1, 1, 1,
-0.1878485, 0.724775, -0.2271056, 0, 0, 1, 1, 1,
-0.1876057, -0.3992779, -1.862221, 1, 0, 0, 1, 1,
-0.1848048, -1.158224, -2.544882, 1, 0, 0, 1, 1,
-0.1845678, 2.285351, -0.5935473, 1, 0, 0, 1, 1,
-0.1804711, 0.1983033, 0.3087187, 1, 0, 0, 1, 1,
-0.1795754, 1.068944, 1.661311, 1, 0, 0, 1, 1,
-0.1793922, -0.2852454, -1.807184, 0, 0, 0, 1, 1,
-0.1784593, -1.008339, -2.615198, 0, 0, 0, 1, 1,
-0.1775103, -0.003181587, -1.10342, 0, 0, 0, 1, 1,
-0.1655629, 0.9989544, -0.1483983, 0, 0, 0, 1, 1,
-0.1637934, 0.4789185, 1.513123, 0, 0, 0, 1, 1,
-0.1631532, -0.3095056, -3.219588, 0, 0, 0, 1, 1,
-0.1629136, 0.0239481, -0.7105404, 0, 0, 0, 1, 1,
-0.162003, 0.5822459, 1.471069, 1, 1, 1, 1, 1,
-0.1529922, -0.6424958, -2.992595, 1, 1, 1, 1, 1,
-0.150298, -0.3381389, -2.004819, 1, 1, 1, 1, 1,
-0.1469357, -0.2840949, -4.52493, 1, 1, 1, 1, 1,
-0.1434854, 0.5038568, -2.161216, 1, 1, 1, 1, 1,
-0.141825, 0.08857156, -1.443999, 1, 1, 1, 1, 1,
-0.1385048, -0.4578036, -0.4981773, 1, 1, 1, 1, 1,
-0.1366971, -0.3428898, -4.364379, 1, 1, 1, 1, 1,
-0.1358187, -0.4154467, -2.648465, 1, 1, 1, 1, 1,
-0.1287696, 0.2422221, 1.340625, 1, 1, 1, 1, 1,
-0.1285526, -2.199112, -2.77484, 1, 1, 1, 1, 1,
-0.1284664, 2.48535, -0.5636461, 1, 1, 1, 1, 1,
-0.1200774, 0.5113106, -1.449491, 1, 1, 1, 1, 1,
-0.1136621, -0.07058133, -2.221835, 1, 1, 1, 1, 1,
-0.1128943, -0.9610899, -1.786306, 1, 1, 1, 1, 1,
-0.1095533, -2.044059, -3.887077, 0, 0, 1, 1, 1,
-0.1076594, -0.07166483, -3.385522, 1, 0, 0, 1, 1,
-0.1068663, 0.03521566, -2.160511, 1, 0, 0, 1, 1,
-0.1064335, 1.13809, 0.6622434, 1, 0, 0, 1, 1,
-0.1056184, -1.903808, -3.067639, 1, 0, 0, 1, 1,
-0.102164, 1.08571, 1.757432, 1, 0, 0, 1, 1,
-0.1020992, 0.750572, -0.9704306, 0, 0, 0, 1, 1,
-0.09722397, 0.7308203, -0.9197719, 0, 0, 0, 1, 1,
-0.09592944, -0.3393186, -3.304016, 0, 0, 0, 1, 1,
-0.09050141, -1.598384, -2.30694, 0, 0, 0, 1, 1,
-0.08785323, 0.6339586, 1.248793, 0, 0, 0, 1, 1,
-0.08185754, 0.9877842, -0.1336863, 0, 0, 0, 1, 1,
-0.07743042, -0.3222676, -1.452109, 0, 0, 0, 1, 1,
-0.07577769, 1.086825, -0.07573012, 1, 1, 1, 1, 1,
-0.06098286, -1.687446, -2.609097, 1, 1, 1, 1, 1,
-0.05256615, 1.22848, 0.6012505, 1, 1, 1, 1, 1,
-0.05198972, 1.089126, -0.8018884, 1, 1, 1, 1, 1,
-0.0497569, -0.1801802, -2.676094, 1, 1, 1, 1, 1,
-0.04806967, 0.854798, -0.7873198, 1, 1, 1, 1, 1,
-0.04466226, 1.934982, -0.05127713, 1, 1, 1, 1, 1,
-0.04399014, 0.2381637, 0.8508961, 1, 1, 1, 1, 1,
-0.03502078, -0.1885956, -1.492405, 1, 1, 1, 1, 1,
-0.03230476, 0.3193822, 0.3242701, 1, 1, 1, 1, 1,
-0.02642004, -1.037571, -3.456634, 1, 1, 1, 1, 1,
-0.02102338, -0.8606011, -4.450066, 1, 1, 1, 1, 1,
-0.01966781, -0.3757246, -3.234323, 1, 1, 1, 1, 1,
-0.01853961, 0.336217, 0.3807186, 1, 1, 1, 1, 1,
-0.01732356, -0.7395514, -4.876993, 1, 1, 1, 1, 1,
-0.01013218, -0.07976539, -2.429213, 0, 0, 1, 1, 1,
-0.009371139, 0.748602, -0.2515916, 1, 0, 0, 1, 1,
-0.007709507, -1.104636, -2.236383, 1, 0, 0, 1, 1,
-0.007125694, -1.194948, -3.849447, 1, 0, 0, 1, 1,
-0.006403387, -0.7564803, -3.857366, 1, 0, 0, 1, 1,
-0.005719444, 0.4269629, 1.001859, 1, 0, 0, 1, 1,
-0.003137295, -1.778847, -3.21127, 0, 0, 0, 1, 1,
-0.001135266, 0.7141913, -1.346989, 0, 0, 0, 1, 1,
0.001206438, -1.332586, 1.661803, 0, 0, 0, 1, 1,
0.001338035, 1.829323, 0.1494989, 0, 0, 0, 1, 1,
0.001792139, 0.2276132, -1.484225, 0, 0, 0, 1, 1,
0.004525829, -0.254202, 3.484507, 0, 0, 0, 1, 1,
0.006124887, -1.025793, 5.092552, 0, 0, 0, 1, 1,
0.007286962, -0.3044659, 2.932491, 1, 1, 1, 1, 1,
0.009487953, -0.7054274, 3.780287, 1, 1, 1, 1, 1,
0.01047589, -0.006244529, 1.242734, 1, 1, 1, 1, 1,
0.01170659, -1.312311, 4.942576, 1, 1, 1, 1, 1,
0.01266421, -0.4482918, 2.958119, 1, 1, 1, 1, 1,
0.01404236, 0.3275059, -0.8449293, 1, 1, 1, 1, 1,
0.01769686, -1.154102, 4.453375, 1, 1, 1, 1, 1,
0.02880418, -1.161879, 2.922004, 1, 1, 1, 1, 1,
0.02941204, -0.06861763, 1.919323, 1, 1, 1, 1, 1,
0.03028683, 0.1358038, 1.020245, 1, 1, 1, 1, 1,
0.03185489, -0.7463017, 2.869401, 1, 1, 1, 1, 1,
0.03673024, 1.475984, -1.967162, 1, 1, 1, 1, 1,
0.03982102, 1.369937, 0.8283343, 1, 1, 1, 1, 1,
0.04067735, 0.6460327, -0.04234483, 1, 1, 1, 1, 1,
0.043472, 0.5159289, -0.4641798, 1, 1, 1, 1, 1,
0.04770742, -1.641568, 4.533201, 0, 0, 1, 1, 1,
0.04942276, -1.094061, 3.696239, 1, 0, 0, 1, 1,
0.05350235, -0.1165686, 4.300244, 1, 0, 0, 1, 1,
0.05492492, -0.2604728, 2.223698, 1, 0, 0, 1, 1,
0.05664635, -0.9950531, 2.320866, 1, 0, 0, 1, 1,
0.05717735, 0.6696425, -0.2098363, 1, 0, 0, 1, 1,
0.05882384, 1.797906, 0.4785674, 0, 0, 0, 1, 1,
0.06029986, 1.960435, -0.2650037, 0, 0, 0, 1, 1,
0.06358076, 0.5386398, -0.6562117, 0, 0, 0, 1, 1,
0.07273374, -0.7912623, 1.943975, 0, 0, 0, 1, 1,
0.07295879, -0.6310886, 3.066034, 0, 0, 0, 1, 1,
0.07318953, 2.504495, -0.811286, 0, 0, 0, 1, 1,
0.07346911, 0.7238666, -0.8862758, 0, 0, 0, 1, 1,
0.0738581, 0.01524689, 0.7394583, 1, 1, 1, 1, 1,
0.07715417, 0.5329089, 0.3905901, 1, 1, 1, 1, 1,
0.08817202, 0.08648699, 0.5300087, 1, 1, 1, 1, 1,
0.09336728, -0.5024267, 4.454293, 1, 1, 1, 1, 1,
0.09805847, 0.9051665, 2.051085, 1, 1, 1, 1, 1,
0.1015712, 1.408915, -0.5383712, 1, 1, 1, 1, 1,
0.1027917, -0.5357894, 2.617578, 1, 1, 1, 1, 1,
0.1031931, -1.210517, 2.968862, 1, 1, 1, 1, 1,
0.1041576, -1.449105, 4.75468, 1, 1, 1, 1, 1,
0.1061675, 1.456824, -0.005611567, 1, 1, 1, 1, 1,
0.1118274, -1.558217, 3.629393, 1, 1, 1, 1, 1,
0.1127757, 0.2235712, 1.22446, 1, 1, 1, 1, 1,
0.1150606, -0.8667454, 2.358257, 1, 1, 1, 1, 1,
0.11774, 0.05124745, 0.37844, 1, 1, 1, 1, 1,
0.1178999, -0.4907542, 4.145514, 1, 1, 1, 1, 1,
0.1202682, 2.238065, -0.8379503, 0, 0, 1, 1, 1,
0.1215185, 0.7304415, -1.064056, 1, 0, 0, 1, 1,
0.1379042, 0.4474931, -0.5189297, 1, 0, 0, 1, 1,
0.1398806, -0.8946894, 4.237941, 1, 0, 0, 1, 1,
0.1412139, 0.2165897, 0.5834591, 1, 0, 0, 1, 1,
0.1466721, -1.183168, 2.714968, 1, 0, 0, 1, 1,
0.1472753, -0.36788, 2.779739, 0, 0, 0, 1, 1,
0.1481047, 1.503593, -0.05761933, 0, 0, 0, 1, 1,
0.1533507, -1.290358, 4.053699, 0, 0, 0, 1, 1,
0.156877, 1.283214, -0.3605357, 0, 0, 0, 1, 1,
0.1582136, 0.2658534, 1.901587, 0, 0, 0, 1, 1,
0.1642676, 0.02858531, 1.506994, 0, 0, 0, 1, 1,
0.1646343, -1.245715, 3.470902, 0, 0, 0, 1, 1,
0.1671448, -0.2250944, 2.964961, 1, 1, 1, 1, 1,
0.1686436, -0.4422748, 3.155457, 1, 1, 1, 1, 1,
0.16935, 0.4049724, -0.43544, 1, 1, 1, 1, 1,
0.1701049, -1.539927, 1.849111, 1, 1, 1, 1, 1,
0.1747403, -0.7154345, 1.329201, 1, 1, 1, 1, 1,
0.177206, -0.6067119, 3.303581, 1, 1, 1, 1, 1,
0.1787786, 0.3111377, 2.007035, 1, 1, 1, 1, 1,
0.1883637, 1.015484, 0.628328, 1, 1, 1, 1, 1,
0.1900115, 0.8068872, -0.2024353, 1, 1, 1, 1, 1,
0.1915962, 0.2288254, 1.229766, 1, 1, 1, 1, 1,
0.1921204, 1.196718, 1.947005, 1, 1, 1, 1, 1,
0.1923634, 0.8876144, 1.248586, 1, 1, 1, 1, 1,
0.1982561, -1.258771, 3.940874, 1, 1, 1, 1, 1,
0.1990923, 0.2999685, 1.453998, 1, 1, 1, 1, 1,
0.1993901, -0.518742, 3.247702, 1, 1, 1, 1, 1,
0.2001147, 0.2172521, 2.341403, 0, 0, 1, 1, 1,
0.2027985, -0.4029364, 3.222087, 1, 0, 0, 1, 1,
0.2034718, -0.4509183, 3.860083, 1, 0, 0, 1, 1,
0.2059772, 3.33562, 0.3103549, 1, 0, 0, 1, 1,
0.2117448, -0.6377112, 2.535755, 1, 0, 0, 1, 1,
0.2149834, 0.09652507, 0.1303017, 1, 0, 0, 1, 1,
0.2195338, 2.323803, -0.1264145, 0, 0, 0, 1, 1,
0.2204327, 1.322455, 0.7749017, 0, 0, 0, 1, 1,
0.2225616, -0.2535315, 1.323537, 0, 0, 0, 1, 1,
0.2290088, 0.6098352, -0.4101495, 0, 0, 0, 1, 1,
0.2297217, 0.09216397, 0.06954173, 0, 0, 0, 1, 1,
0.2350861, -0.3234712, 2.239391, 0, 0, 0, 1, 1,
0.2357217, 0.3691536, 2.021138, 0, 0, 0, 1, 1,
0.2432013, -0.2508346, 1.11902, 1, 1, 1, 1, 1,
0.2436697, 0.9018662, -0.4711912, 1, 1, 1, 1, 1,
0.2479659, 1.029027, 1.370144, 1, 1, 1, 1, 1,
0.2540237, -0.4239092, 3.241582, 1, 1, 1, 1, 1,
0.2552025, -1.235782, 4.859129, 1, 1, 1, 1, 1,
0.2577132, -0.2043648, 4.620956, 1, 1, 1, 1, 1,
0.2613839, 0.6387171, 0.4093355, 1, 1, 1, 1, 1,
0.264114, -0.0663024, 2.077025, 1, 1, 1, 1, 1,
0.2749408, -0.1237273, 1.652137, 1, 1, 1, 1, 1,
0.278862, -0.3545432, 2.606277, 1, 1, 1, 1, 1,
0.2838181, -0.8449691, 1.015408, 1, 1, 1, 1, 1,
0.2898228, 1.119194, 2.552065, 1, 1, 1, 1, 1,
0.2928941, -0.3537291, 1.945798, 1, 1, 1, 1, 1,
0.2962087, -0.2939932, 1.640136, 1, 1, 1, 1, 1,
0.3004449, -0.3332371, 1.77275, 1, 1, 1, 1, 1,
0.3048442, -1.594529, 2.727817, 0, 0, 1, 1, 1,
0.3073364, 0.2889062, -0.1612872, 1, 0, 0, 1, 1,
0.316103, -1.519415, 3.344315, 1, 0, 0, 1, 1,
0.3162947, -1.486345, 4.276829, 1, 0, 0, 1, 1,
0.3171768, -2.399521, 0.7963206, 1, 0, 0, 1, 1,
0.3182543, -0.02103228, 1.552402, 1, 0, 0, 1, 1,
0.3225341, -0.5190336, 0.9306689, 0, 0, 0, 1, 1,
0.3271008, -0.3390669, 3.464735, 0, 0, 0, 1, 1,
0.3284412, 0.2106461, 0.6279975, 0, 0, 0, 1, 1,
0.3299299, -1.473309, 2.822888, 0, 0, 0, 1, 1,
0.3319595, -1.958203, 2.991398, 0, 0, 0, 1, 1,
0.3325804, -0.1944609, 2.136595, 0, 0, 0, 1, 1,
0.3326111, 0.6458308, 1.996994, 0, 0, 0, 1, 1,
0.3352144, 0.4200119, 0.3746622, 1, 1, 1, 1, 1,
0.3384162, 0.8844517, 1.057877, 1, 1, 1, 1, 1,
0.3402126, -1.236907, 3.601351, 1, 1, 1, 1, 1,
0.340988, 0.6559873, -0.0329669, 1, 1, 1, 1, 1,
0.3462735, -0.5073957, 1.520697, 1, 1, 1, 1, 1,
0.351519, -0.5770672, 1.3338, 1, 1, 1, 1, 1,
0.3515902, -0.9394166, 1.180937, 1, 1, 1, 1, 1,
0.351612, -0.2112517, 1.315719, 1, 1, 1, 1, 1,
0.3525261, 0.7562283, -0.6182202, 1, 1, 1, 1, 1,
0.3564452, -0.3103152, 3.142905, 1, 1, 1, 1, 1,
0.3568453, -2.348998, 3.510374, 1, 1, 1, 1, 1,
0.3576346, 0.2823286, -0.3475971, 1, 1, 1, 1, 1,
0.3660496, 0.8187368, -0.2800968, 1, 1, 1, 1, 1,
0.3676634, 0.459344, 1.160068, 1, 1, 1, 1, 1,
0.3791047, 0.8001806, 0.2121031, 1, 1, 1, 1, 1,
0.3836304, 0.7684502, 2.137429, 0, 0, 1, 1, 1,
0.3909932, -0.4830353, 3.626975, 1, 0, 0, 1, 1,
0.391363, -0.05414848, 1.908746, 1, 0, 0, 1, 1,
0.3934085, 0.1812012, 1.351304, 1, 0, 0, 1, 1,
0.3972875, -0.2201751, 1.884447, 1, 0, 0, 1, 1,
0.3978383, 0.4627124, 2.628277, 1, 0, 0, 1, 1,
0.3980215, -1.639816, 2.363804, 0, 0, 0, 1, 1,
0.4016329, -0.03898631, 1.189619, 0, 0, 0, 1, 1,
0.4056295, -2.369118, 2.028322, 0, 0, 0, 1, 1,
0.4059358, -1.850257, 3.265644, 0, 0, 0, 1, 1,
0.4160752, 0.619336, 1.040562, 0, 0, 0, 1, 1,
0.4172112, -1.033543, 1.799721, 0, 0, 0, 1, 1,
0.4176045, -0.07794453, 2.375025, 0, 0, 0, 1, 1,
0.4219667, -0.8580055, 1.831329, 1, 1, 1, 1, 1,
0.4338482, 0.2868969, 0.03519342, 1, 1, 1, 1, 1,
0.4369328, 0.4773202, 1.04113, 1, 1, 1, 1, 1,
0.437795, -0.7001956, 3.246336, 1, 1, 1, 1, 1,
0.4391714, 0.4461586, -0.8958479, 1, 1, 1, 1, 1,
0.4417685, 1.759878, 0.9494695, 1, 1, 1, 1, 1,
0.4422868, -0.05707899, 1.370534, 1, 1, 1, 1, 1,
0.4429601, -0.06752425, 1.16694, 1, 1, 1, 1, 1,
0.4435046, 1.76878, -1.254346, 1, 1, 1, 1, 1,
0.4455495, 0.03380588, 1.440797, 1, 1, 1, 1, 1,
0.4532877, -0.1448473, 1.3364, 1, 1, 1, 1, 1,
0.4550927, 1.487765, 0.7011007, 1, 1, 1, 1, 1,
0.4551554, -0.9998336, 2.980034, 1, 1, 1, 1, 1,
0.456864, 0.6341328, 2.226222, 1, 1, 1, 1, 1,
0.4591249, -0.2235737, 1.946211, 1, 1, 1, 1, 1,
0.4593146, 0.8955854, 0.4293369, 0, 0, 1, 1, 1,
0.4632455, 0.1581226, 1.659867, 1, 0, 0, 1, 1,
0.4660665, 0.3942118, 1.09951, 1, 0, 0, 1, 1,
0.469907, 1.057337, 1.345152, 1, 0, 0, 1, 1,
0.4877602, 0.702455, 1.558943, 1, 0, 0, 1, 1,
0.4885624, -0.1130737, 2.164681, 1, 0, 0, 1, 1,
0.4966776, -1.170655, 2.374223, 0, 0, 0, 1, 1,
0.4992081, -0.3676345, 2.868281, 0, 0, 0, 1, 1,
0.4993303, -1.249919, 2.921125, 0, 0, 0, 1, 1,
0.5001791, -1.005711, 2.998267, 0, 0, 0, 1, 1,
0.500654, 0.6789762, 0.6362962, 0, 0, 0, 1, 1,
0.5006745, 1.124161, -0.04764801, 0, 0, 0, 1, 1,
0.5016624, -0.3695874, 2.71412, 0, 0, 0, 1, 1,
0.5064242, 0.6752344, 3.219141, 1, 1, 1, 1, 1,
0.5075463, 1.379027, -0.04362183, 1, 1, 1, 1, 1,
0.5092821, 1.181105, -0.4064474, 1, 1, 1, 1, 1,
0.5130611, -0.1898191, 1.616397, 1, 1, 1, 1, 1,
0.516718, -1.567044, 2.085255, 1, 1, 1, 1, 1,
0.5168918, -0.5025079, 3.015206, 1, 1, 1, 1, 1,
0.5198829, 0.04042336, -1.70032, 1, 1, 1, 1, 1,
0.5200891, -0.459724, 2.953955, 1, 1, 1, 1, 1,
0.5267497, -0.04265153, 2.732445, 1, 1, 1, 1, 1,
0.5274688, 0.5338281, 1.186736, 1, 1, 1, 1, 1,
0.5329256, -0.9231949, 3.069593, 1, 1, 1, 1, 1,
0.5336632, -2.082684, 2.529459, 1, 1, 1, 1, 1,
0.5370241, -0.4924865, 1.635137, 1, 1, 1, 1, 1,
0.5465894, -0.754776, 2.912064, 1, 1, 1, 1, 1,
0.5500429, -0.4719491, 2.535241, 1, 1, 1, 1, 1,
0.5514503, -0.4842537, 1.696166, 0, 0, 1, 1, 1,
0.5519308, -0.2173774, 1.689064, 1, 0, 0, 1, 1,
0.5526366, -1.592489, 4.561681, 1, 0, 0, 1, 1,
0.5582883, 0.9642621, 2.125717, 1, 0, 0, 1, 1,
0.5586377, -0.6233329, 1.608423, 1, 0, 0, 1, 1,
0.5649375, -1.27688, 4.053415, 1, 0, 0, 1, 1,
0.5697767, 0.1917784, 1.794671, 0, 0, 0, 1, 1,
0.5805321, -0.2250926, 2.167015, 0, 0, 0, 1, 1,
0.5814446, 1.686202, 0.372506, 0, 0, 0, 1, 1,
0.5845761, 0.4996105, -0.4310083, 0, 0, 0, 1, 1,
0.5874866, -2.51131, 2.950567, 0, 0, 0, 1, 1,
0.5943154, 1.346242, 0.1004664, 0, 0, 0, 1, 1,
0.5966842, 1.160221, 1.050527, 0, 0, 0, 1, 1,
0.5970123, -0.1400945, 2.383359, 1, 1, 1, 1, 1,
0.6015996, 0.04924413, 0.5823143, 1, 1, 1, 1, 1,
0.6039109, -0.7069248, 1.465699, 1, 1, 1, 1, 1,
0.6052402, 0.5501965, -0.3242188, 1, 1, 1, 1, 1,
0.6058902, -0.9157192, 1.784599, 1, 1, 1, 1, 1,
0.6095622, -2.013539, 3.465679, 1, 1, 1, 1, 1,
0.6117458, -0.4580322, 2.199428, 1, 1, 1, 1, 1,
0.6264129, 1.006374, 1.496116, 1, 1, 1, 1, 1,
0.6289262, -1.327671, 2.129678, 1, 1, 1, 1, 1,
0.6299139, -2.691439, 3.894434, 1, 1, 1, 1, 1,
0.6302402, -1.147398, 2.81049, 1, 1, 1, 1, 1,
0.6327553, -0.841852, 3.031126, 1, 1, 1, 1, 1,
0.6336647, 0.9366328, 0.5026695, 1, 1, 1, 1, 1,
0.6397973, 0.03688647, 1.735534, 1, 1, 1, 1, 1,
0.6426017, 0.9719609, 0.9640967, 1, 1, 1, 1, 1,
0.6442649, -0.9469286, 1.857435, 0, 0, 1, 1, 1,
0.6482682, -0.1235141, 1.881413, 1, 0, 0, 1, 1,
0.6549056, 2.46545, -0.5705482, 1, 0, 0, 1, 1,
0.6563053, -0.2961363, 1.894334, 1, 0, 0, 1, 1,
0.6573658, -1.170888, 1.643004, 1, 0, 0, 1, 1,
0.6574035, 0.5602647, 0.3703496, 1, 0, 0, 1, 1,
0.6622878, 0.09581316, 2.330776, 0, 0, 0, 1, 1,
0.6628033, -0.433335, 2.779043, 0, 0, 0, 1, 1,
0.6633344, -0.8262703, 3.105305, 0, 0, 0, 1, 1,
0.6658925, -0.4927624, 2.6611, 0, 0, 0, 1, 1,
0.6664093, -0.8311605, 2.658513, 0, 0, 0, 1, 1,
0.6756736, -0.5515535, -1.337858, 0, 0, 0, 1, 1,
0.6809134, -0.006218182, 2.724166, 0, 0, 0, 1, 1,
0.6837382, 1.009443, 0.7153358, 1, 1, 1, 1, 1,
0.6870509, -0.9283404, 4.346393, 1, 1, 1, 1, 1,
0.6896582, 0.3216757, 1.017455, 1, 1, 1, 1, 1,
0.6983774, 0.1545136, 2.120633, 1, 1, 1, 1, 1,
0.7048483, -0.8396233, 4.85136, 1, 1, 1, 1, 1,
0.70491, 0.5972638, -0.07888709, 1, 1, 1, 1, 1,
0.7091643, 0.008039196, 1.980527, 1, 1, 1, 1, 1,
0.7109792, -1.56244, 4.340103, 1, 1, 1, 1, 1,
0.710995, 0.3018852, 1.790528, 1, 1, 1, 1, 1,
0.7125401, 0.3707737, 1.745227, 1, 1, 1, 1, 1,
0.7159986, -1.542202, 1.435359, 1, 1, 1, 1, 1,
0.7220382, -0.9525595, 1.631122, 1, 1, 1, 1, 1,
0.7270797, -1.610657, 2.903818, 1, 1, 1, 1, 1,
0.7294167, 0.06978128, 3.130349, 1, 1, 1, 1, 1,
0.7306291, -1.50581, 3.102671, 1, 1, 1, 1, 1,
0.7325013, 1.422309, 1.072006, 0, 0, 1, 1, 1,
0.7352774, 0.1222866, 3.411461, 1, 0, 0, 1, 1,
0.7368413, 1.450198, 0.7191548, 1, 0, 0, 1, 1,
0.7461565, 0.9616199, 1.363573, 1, 0, 0, 1, 1,
0.7492368, -0.1975101, 2.199567, 1, 0, 0, 1, 1,
0.7503333, 0.215996, 0.1428753, 1, 0, 0, 1, 1,
0.7518474, 0.6938684, 1.750727, 0, 0, 0, 1, 1,
0.7550618, 0.4655, 1.391383, 0, 0, 0, 1, 1,
0.7566643, -0.09311685, 1.532058, 0, 0, 0, 1, 1,
0.7628371, 0.7809891, 0.9599033, 0, 0, 0, 1, 1,
0.7645683, 0.0356806, 2.133251, 0, 0, 0, 1, 1,
0.7661656, -0.4177467, 1.718483, 0, 0, 0, 1, 1,
0.766283, -0.160193, 2.89267, 0, 0, 0, 1, 1,
0.7668276, 0.6102176, 1.48868, 1, 1, 1, 1, 1,
0.7707788, 0.3694068, 1.192591, 1, 1, 1, 1, 1,
0.7765888, -1.612353, 1.499968, 1, 1, 1, 1, 1,
0.7838693, -0.5847335, 3.600052, 1, 1, 1, 1, 1,
0.7842482, -0.6394871, 1.361669, 1, 1, 1, 1, 1,
0.7860274, -0.5299983, 3.061338, 1, 1, 1, 1, 1,
0.7866595, -0.04989284, 3.217233, 1, 1, 1, 1, 1,
0.7868748, -0.2130066, 1.356665, 1, 1, 1, 1, 1,
0.7903832, 0.3450215, 1.04079, 1, 1, 1, 1, 1,
0.7937588, -1.11852, 3.023827, 1, 1, 1, 1, 1,
0.7939745, -0.3420258, 3.789226, 1, 1, 1, 1, 1,
0.8049734, 1.328186, 0.2493884, 1, 1, 1, 1, 1,
0.8081247, 0.1025543, 1.901317, 1, 1, 1, 1, 1,
0.8084511, -0.7328767, 2.122288, 1, 1, 1, 1, 1,
0.8085359, -1.665861, 3.065978, 1, 1, 1, 1, 1,
0.8101367, 0.2766089, 0.5585063, 0, 0, 1, 1, 1,
0.8101426, -0.2086324, 0.450691, 1, 0, 0, 1, 1,
0.8116471, 0.3740811, 2.879794, 1, 0, 0, 1, 1,
0.8259035, -2.246967, 3.77701, 1, 0, 0, 1, 1,
0.8335118, 0.9165875, 2.218038, 1, 0, 0, 1, 1,
0.8350177, 1.460408, 1.577267, 1, 0, 0, 1, 1,
0.83693, 0.8170691, 0.6020597, 0, 0, 0, 1, 1,
0.8391023, 1.073785, -0.4704929, 0, 0, 0, 1, 1,
0.8401413, -0.3430929, -0.3425497, 0, 0, 0, 1, 1,
0.8408984, 0.1683271, 1.583882, 0, 0, 0, 1, 1,
0.8444213, -0.7078741, 2.902393, 0, 0, 0, 1, 1,
0.8451725, 0.6052368, 0.7097241, 0, 0, 0, 1, 1,
0.8479963, 1.903449, 0.2807164, 0, 0, 0, 1, 1,
0.8496779, 1.826352, 0.1551753, 1, 1, 1, 1, 1,
0.8514075, 1.357427, 1.540725, 1, 1, 1, 1, 1,
0.859793, -0.2843065, 2.180684, 1, 1, 1, 1, 1,
0.8659074, -0.5124634, 2.61482, 1, 1, 1, 1, 1,
0.8668326, 0.3341285, 1.613136, 1, 1, 1, 1, 1,
0.8696715, 0.5649859, 2.849417, 1, 1, 1, 1, 1,
0.8764334, 0.3199151, 1.356668, 1, 1, 1, 1, 1,
0.8776339, 0.1172544, 1.737615, 1, 1, 1, 1, 1,
0.878143, 0.7375388, 1.700516, 1, 1, 1, 1, 1,
0.8824106, -1.567128, 3.60803, 1, 1, 1, 1, 1,
0.8832968, -0.9154868, 1.022998, 1, 1, 1, 1, 1,
0.8840159, -0.1230478, 1.799133, 1, 1, 1, 1, 1,
0.8879462, 0.4104857, 1.602367, 1, 1, 1, 1, 1,
0.8918638, -0.4608554, 1.146601, 1, 1, 1, 1, 1,
0.8929549, 0.3790169, 0.1246737, 1, 1, 1, 1, 1,
0.895681, -0.7861847, 5.156404, 0, 0, 1, 1, 1,
0.9052955, -0.04828257, 0.8718209, 1, 0, 0, 1, 1,
0.906039, 1.609297, 0.09439979, 1, 0, 0, 1, 1,
0.9104263, -2.099202, 2.342179, 1, 0, 0, 1, 1,
0.9112895, 0.5639592, -0.4962996, 1, 0, 0, 1, 1,
0.9113042, -0.3636478, 2.696674, 1, 0, 0, 1, 1,
0.9139444, -1.374372, 2.005985, 0, 0, 0, 1, 1,
0.9176424, -1.350804, 4.083182, 0, 0, 0, 1, 1,
0.9210401, -1.121006, 2.354732, 0, 0, 0, 1, 1,
0.9366821, -1.02682, 1.720817, 0, 0, 0, 1, 1,
0.9382683, 0.5293356, 1.153641, 0, 0, 0, 1, 1,
0.9391289, -0.07468723, 2.234402, 0, 0, 0, 1, 1,
0.9420746, 0.9212942, -0.827986, 0, 0, 0, 1, 1,
0.9514042, 0.2061048, 2.557701, 1, 1, 1, 1, 1,
0.9541918, 0.9677744, 2.154491, 1, 1, 1, 1, 1,
0.9550309, -0.5504814, 3.218752, 1, 1, 1, 1, 1,
0.9586583, 1.221615, -0.929418, 1, 1, 1, 1, 1,
0.9602266, 0.01776484, 3.253497, 1, 1, 1, 1, 1,
0.9602363, 0.9372258, 2.413766, 1, 1, 1, 1, 1,
0.9660779, -1.609128, 1.84224, 1, 1, 1, 1, 1,
0.9684646, -1.466805, 2.462326, 1, 1, 1, 1, 1,
0.9772905, -0.8043352, 3.043772, 1, 1, 1, 1, 1,
0.9778112, 0.8975362, 0.9710815, 1, 1, 1, 1, 1,
0.9855769, 1.380813, -0.08803318, 1, 1, 1, 1, 1,
0.9879599, -0.3709947, 2.207391, 1, 1, 1, 1, 1,
0.9880577, -0.8028921, 2.259461, 1, 1, 1, 1, 1,
0.989856, -1.314208, 0.2944758, 1, 1, 1, 1, 1,
0.9943119, 0.683846, 0.5108692, 1, 1, 1, 1, 1,
0.9946721, 1.250149, 1.332399, 0, 0, 1, 1, 1,
1.00062, -0.07523348, -0.4655595, 1, 0, 0, 1, 1,
1.000892, -0.7030666, 0.182163, 1, 0, 0, 1, 1,
1.001372, -0.7277766, 2.860896, 1, 0, 0, 1, 1,
1.002515, -0.4488904, 1.557099, 1, 0, 0, 1, 1,
1.004467, -0.2667463, 1.974573, 1, 0, 0, 1, 1,
1.004843, 0.9296933, 0.2267088, 0, 0, 0, 1, 1,
1.027328, -0.8494952, 2.965901, 0, 0, 0, 1, 1,
1.029466, 0.407901, 2.174833, 0, 0, 0, 1, 1,
1.029625, 0.8124948, 1.634113, 0, 0, 0, 1, 1,
1.032212, 1.933511, 2.012283, 0, 0, 0, 1, 1,
1.033478, 0.8050789, 1.318556, 0, 0, 0, 1, 1,
1.034935, 2.183064, 0.9601803, 0, 0, 0, 1, 1,
1.043633, -0.09828911, 2.912077, 1, 1, 1, 1, 1,
1.044133, 0.4088556, 2.014531, 1, 1, 1, 1, 1,
1.046924, -1.094603, 1.717336, 1, 1, 1, 1, 1,
1.047169, -0.9620838, 3.084391, 1, 1, 1, 1, 1,
1.047644, -0.05688916, -0.6284452, 1, 1, 1, 1, 1,
1.050034, 1.056032, 0.01569146, 1, 1, 1, 1, 1,
1.055627, 0.5934047, 0.6599148, 1, 1, 1, 1, 1,
1.060345, 0.07459811, 2.227318, 1, 1, 1, 1, 1,
1.066999, -0.3703376, 3.685718, 1, 1, 1, 1, 1,
1.073255, 0.2072208, 3.092524, 1, 1, 1, 1, 1,
1.074033, -0.1597546, 1.843415, 1, 1, 1, 1, 1,
1.074628, -0.9509705, 2.175674, 1, 1, 1, 1, 1,
1.075381, -1.080137, 4.107713, 1, 1, 1, 1, 1,
1.083532, 0.2380325, 1.83015, 1, 1, 1, 1, 1,
1.085219, 2.31755, 1.031621, 1, 1, 1, 1, 1,
1.085271, 1.424155, 0.6177515, 0, 0, 1, 1, 1,
1.091524, -0.02224653, 1.567854, 1, 0, 0, 1, 1,
1.093056, 1.834078, 1.165876, 1, 0, 0, 1, 1,
1.096806, -2.411993, 3.92615, 1, 0, 0, 1, 1,
1.098783, -1.4042, 2.460864, 1, 0, 0, 1, 1,
1.107574, -0.2946373, 0.5161989, 1, 0, 0, 1, 1,
1.125186, 0.3814093, 0.5412092, 0, 0, 0, 1, 1,
1.127354, -0.854041, 3.202703, 0, 0, 0, 1, 1,
1.130299, -0.9507143, 3.670513, 0, 0, 0, 1, 1,
1.132733, -0.8080668, 1.139183, 0, 0, 0, 1, 1,
1.133775, -0.268678, 2.580076, 0, 0, 0, 1, 1,
1.133956, 0.7864407, 1.905378, 0, 0, 0, 1, 1,
1.140411, 0.4672392, 0.855414, 0, 0, 0, 1, 1,
1.141539, 2.732004, 0.1174088, 1, 1, 1, 1, 1,
1.144762, 1.857248, 0.12275, 1, 1, 1, 1, 1,
1.146791, -0.2497652, 1.533401, 1, 1, 1, 1, 1,
1.147571, -1.183427, 3.64121, 1, 1, 1, 1, 1,
1.158273, 1.032184, 3.268566, 1, 1, 1, 1, 1,
1.160693, 2.520424, 0.06962689, 1, 1, 1, 1, 1,
1.171727, 1.459146, 0.1967274, 1, 1, 1, 1, 1,
1.182694, 3.476386, -0.2880699, 1, 1, 1, 1, 1,
1.184412, 0.8647981, 2.502755, 1, 1, 1, 1, 1,
1.196318, 0.8585892, 1.244447, 1, 1, 1, 1, 1,
1.19695, -1.62331, 1.153039, 1, 1, 1, 1, 1,
1.197857, 1.211418, 2.351728, 1, 1, 1, 1, 1,
1.198486, -1.949356, 2.560661, 1, 1, 1, 1, 1,
1.200314, -0.02063674, 2.171583, 1, 1, 1, 1, 1,
1.203492, -0.9189709, 4.502849, 1, 1, 1, 1, 1,
1.205709, 0.3941983, 1.227854, 0, 0, 1, 1, 1,
1.206071, -1.341285, 1.197678, 1, 0, 0, 1, 1,
1.208285, 0.7534888, 1.672886, 1, 0, 0, 1, 1,
1.209018, -0.108691, -0.3676611, 1, 0, 0, 1, 1,
1.212629, 0.7753644, -0.134065, 1, 0, 0, 1, 1,
1.221413, -1.059255, 2.050845, 1, 0, 0, 1, 1,
1.227638, -0.9974299, 3.471474, 0, 0, 0, 1, 1,
1.230762, -0.002940201, 2.855958, 0, 0, 0, 1, 1,
1.237313, 1.112801, 0.9785511, 0, 0, 0, 1, 1,
1.246967, 2.462102, 1.526959, 0, 0, 0, 1, 1,
1.257413, 0.5344181, -0.007367564, 0, 0, 0, 1, 1,
1.264659, 0.4358098, 2.685148, 0, 0, 0, 1, 1,
1.271531, -0.4148712, 2.268209, 0, 0, 0, 1, 1,
1.278205, 0.2645416, 2.003271, 1, 1, 1, 1, 1,
1.278242, 1.761624, -0.4398283, 1, 1, 1, 1, 1,
1.289892, -0.9527265, 3.0378, 1, 1, 1, 1, 1,
1.300673, 0.140642, 0.6555071, 1, 1, 1, 1, 1,
1.301566, -0.58738, 0.7618546, 1, 1, 1, 1, 1,
1.315559, -1.248184, 2.52588, 1, 1, 1, 1, 1,
1.316968, -1.222139, 2.50304, 1, 1, 1, 1, 1,
1.33143, 0.9442542, 1.725343, 1, 1, 1, 1, 1,
1.339879, -2.058147, 2.27299, 1, 1, 1, 1, 1,
1.345166, -0.6031153, 2.82386, 1, 1, 1, 1, 1,
1.36078, 0.2466254, 1.628064, 1, 1, 1, 1, 1,
1.370661, 0.6293748, 1.755749, 1, 1, 1, 1, 1,
1.375358, -0.7665297, 1.45994, 1, 1, 1, 1, 1,
1.381659, 1.074409, 1.037298, 1, 1, 1, 1, 1,
1.38211, -0.7642272, 2.417179, 1, 1, 1, 1, 1,
1.383681, 0.4446683, 3.00739, 0, 0, 1, 1, 1,
1.384623, 0.3494074, 0.4636606, 1, 0, 0, 1, 1,
1.386196, -0.2728356, 2.846022, 1, 0, 0, 1, 1,
1.393471, -0.6221531, 0.3243567, 1, 0, 0, 1, 1,
1.39479, 0.3415408, 0.8823767, 1, 0, 0, 1, 1,
1.397282, 0.3797601, 3.52462, 1, 0, 0, 1, 1,
1.407528, -1.114064, 2.678574, 0, 0, 0, 1, 1,
1.409308, 1.198443, -0.1205243, 0, 0, 0, 1, 1,
1.429911, 0.907423, 1.449778, 0, 0, 0, 1, 1,
1.432106, 0.4072054, 0.6512242, 0, 0, 0, 1, 1,
1.440611, 0.5635847, -0.43257, 0, 0, 0, 1, 1,
1.449693, -0.515974, 1.040838, 0, 0, 0, 1, 1,
1.461194, 0.759954, 0.3936543, 0, 0, 0, 1, 1,
1.479505, 0.4881975, 1.156047, 1, 1, 1, 1, 1,
1.490029, -0.1841463, 0.3268584, 1, 1, 1, 1, 1,
1.491808, -0.951543, 3.205078, 1, 1, 1, 1, 1,
1.492842, -0.34039, 0.6586486, 1, 1, 1, 1, 1,
1.502856, 0.6356727, -1.035959, 1, 1, 1, 1, 1,
1.529668, -0.1952555, 0.5881022, 1, 1, 1, 1, 1,
1.531471, 2.356084, -1.540422, 1, 1, 1, 1, 1,
1.536087, 0.4114913, 2.967444, 1, 1, 1, 1, 1,
1.537984, -1.307482, 1.707441, 1, 1, 1, 1, 1,
1.539365, 0.9014902, 2.13634, 1, 1, 1, 1, 1,
1.540528, -0.164248, 0.003166816, 1, 1, 1, 1, 1,
1.54319, -0.4130589, 1.54347, 1, 1, 1, 1, 1,
1.546522, 0.9400898, 1.43016, 1, 1, 1, 1, 1,
1.57615, -0.6434199, 3.49152, 1, 1, 1, 1, 1,
1.580097, 0.4606075, 2.37048, 1, 1, 1, 1, 1,
1.584242, 0.7572238, -0.01134071, 0, 0, 1, 1, 1,
1.598158, 0.3478655, 2.706231, 1, 0, 0, 1, 1,
1.60868, 0.1279237, 0.7034895, 1, 0, 0, 1, 1,
1.609058, 1.300481, -0.6279082, 1, 0, 0, 1, 1,
1.624065, 1.269729, 1.91592, 1, 0, 0, 1, 1,
1.654462, 0.3091999, 0.6028165, 1, 0, 0, 1, 1,
1.675028, -0.4767698, 0.351429, 0, 0, 0, 1, 1,
1.675581, 0.1553414, 1.35815, 0, 0, 0, 1, 1,
1.678866, 0.3998062, 1.639916, 0, 0, 0, 1, 1,
1.680965, -0.9878015, 4.469513, 0, 0, 0, 1, 1,
1.692039, 1.145752, 0.6962637, 0, 0, 0, 1, 1,
1.700132, -0.9643473, 3.80181, 0, 0, 0, 1, 1,
1.74986, 1.748006, 0.6326796, 0, 0, 0, 1, 1,
1.802166, 0.002522733, 0.3588931, 1, 1, 1, 1, 1,
1.808625, -0.9578702, 2.385077, 1, 1, 1, 1, 1,
1.811655, -0.3419048, 1.850205, 1, 1, 1, 1, 1,
1.812605, 0.2481074, 1.077127, 1, 1, 1, 1, 1,
1.972458, -0.3507513, 1.326321, 1, 1, 1, 1, 1,
1.972987, -0.08189964, 0.1815118, 1, 1, 1, 1, 1,
2.00047, 0.2712689, 2.179448, 1, 1, 1, 1, 1,
2.048198, -0.2966024, 1.138929, 1, 1, 1, 1, 1,
2.063949, -0.09981954, 0.01369084, 1, 1, 1, 1, 1,
2.066001, 0.2980534, 0.8765429, 1, 1, 1, 1, 1,
2.084433, -0.06561003, 2.339955, 1, 1, 1, 1, 1,
2.086862, -1.683339, 2.526842, 1, 1, 1, 1, 1,
2.149111, 0.3785548, 3.262771, 1, 1, 1, 1, 1,
2.158469, -0.5276034, 3.285264, 1, 1, 1, 1, 1,
2.158584, 1.118402, 1.009264, 1, 1, 1, 1, 1,
2.190244, 0.1969116, 2.316199, 0, 0, 1, 1, 1,
2.224677, -0.23198, 1.03166, 1, 0, 0, 1, 1,
2.254772, 1.452113, 0.6387234, 1, 0, 0, 1, 1,
2.309831, -0.5386206, 1.110796, 1, 0, 0, 1, 1,
2.312761, -2.44963, 2.807865, 1, 0, 0, 1, 1,
2.438383, -1.662181, 3.701823, 1, 0, 0, 1, 1,
2.443899, -0.5992697, 1.936908, 0, 0, 0, 1, 1,
2.463434, 0.4519816, 2.441513, 0, 0, 0, 1, 1,
2.496787, 0.4278898, 1.792899, 0, 0, 0, 1, 1,
2.52531, -0.6259652, 1.088364, 0, 0, 0, 1, 1,
2.56217, -0.6384568, 2.851966, 0, 0, 0, 1, 1,
2.610639, -0.6028827, 3.466645, 0, 0, 0, 1, 1,
2.792926, -1.387195, 2.067497, 0, 0, 0, 1, 1,
2.81541, 0.9877732, -0.1014041, 1, 1, 1, 1, 1,
2.837371, 1.550147, 1.286924, 1, 1, 1, 1, 1,
2.874002, 0.3526442, 3.08168, 1, 1, 1, 1, 1,
2.881054, -0.1295829, 1.243061, 1, 1, 1, 1, 1,
2.979217, -1.632994, 2.415194, 1, 1, 1, 1, 1,
3.00954, -1.013673, 1.562947, 1, 1, 1, 1, 1,
3.311455, -0.3366208, 0.4332282, 1, 1, 1, 1, 1
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
var radius = 9.308592;
var distance = 32.69603;
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
mvMatrix.translate( -0.2408171, -0.4084816, -0.07538009 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.69603);
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
