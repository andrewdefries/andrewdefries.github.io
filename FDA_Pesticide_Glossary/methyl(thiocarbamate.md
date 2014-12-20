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
-3.138237, -1.264436, -2.313548, 1, 0, 0, 1,
-3.09951, -0.3505415, 0.5566478, 1, 0.007843138, 0, 1,
-3.075036, 1.510487, -0.7886767, 1, 0.01176471, 0, 1,
-2.780722, -1.161037, -1.775998, 1, 0.01960784, 0, 1,
-2.747824, 0.8420442, -2.01257, 1, 0.02352941, 0, 1,
-2.648105, -1.299269, -1.858431, 1, 0.03137255, 0, 1,
-2.439011, 0.08045507, -2.335388, 1, 0.03529412, 0, 1,
-2.409369, 0.487817, -1.433314, 1, 0.04313726, 0, 1,
-2.323825, -0.3530712, -0.9122942, 1, 0.04705882, 0, 1,
-2.273467, 0.08113655, -1.580983, 1, 0.05490196, 0, 1,
-2.265552, -0.6981759, -0.7870742, 1, 0.05882353, 0, 1,
-2.244519, 0.6001498, -1.134433, 1, 0.06666667, 0, 1,
-2.229072, -1.308105, -3.204782, 1, 0.07058824, 0, 1,
-2.194835, -0.03204877, -1.553053, 1, 0.07843138, 0, 1,
-2.188535, 0.9921363, -1.553181, 1, 0.08235294, 0, 1,
-2.185939, -0.3310696, -2.118454, 1, 0.09019608, 0, 1,
-2.176511, -0.2073718, -0.9798471, 1, 0.09411765, 0, 1,
-2.150815, -1.191603, -2.222258, 1, 0.1019608, 0, 1,
-2.135614, 1.300248, -1.251956, 1, 0.1098039, 0, 1,
-2.127789, 0.8695756, -1.385333, 1, 0.1137255, 0, 1,
-2.126159, 0.4204096, -0.4731345, 1, 0.1215686, 0, 1,
-2.079908, 0.1930043, -1.713647, 1, 0.1254902, 0, 1,
-2.072249, 0.9489563, -0.4257278, 1, 0.1333333, 0, 1,
-2.067403, 1.352223, -1.701545, 1, 0.1372549, 0, 1,
-2.066121, 0.3643261, -1.369866, 1, 0.145098, 0, 1,
-2.055724, 0.3231911, 0.03713428, 1, 0.1490196, 0, 1,
-2.038496, 0.676407, -2.572648, 1, 0.1568628, 0, 1,
-2.01114, -0.766114, -2.70771, 1, 0.1607843, 0, 1,
-1.97408, 0.05843396, -2.367813, 1, 0.1686275, 0, 1,
-1.968066, -1.858417, -0.5887001, 1, 0.172549, 0, 1,
-1.960218, 1.081004, -0.4502403, 1, 0.1803922, 0, 1,
-1.95898, 0.2925635, -2.391361, 1, 0.1843137, 0, 1,
-1.917974, -0.7028522, -1.329825, 1, 0.1921569, 0, 1,
-1.909071, 1.372429, -0.8737261, 1, 0.1960784, 0, 1,
-1.907377, 1.153897, -2.076851, 1, 0.2039216, 0, 1,
-1.881839, 1.843878, -1.375383, 1, 0.2117647, 0, 1,
-1.880556, -0.07919253, -0.9792989, 1, 0.2156863, 0, 1,
-1.873279, -0.6782603, -1.883965, 1, 0.2235294, 0, 1,
-1.860184, 2.552016, -0.2148457, 1, 0.227451, 0, 1,
-1.850451, -2.147798, -3.067718, 1, 0.2352941, 0, 1,
-1.840087, -1.073389, -3.097509, 1, 0.2392157, 0, 1,
-1.826208, -0.02799182, -2.22525, 1, 0.2470588, 0, 1,
-1.788808, 0.6839949, -0.06978962, 1, 0.2509804, 0, 1,
-1.774604, -1.093149, -2.540121, 1, 0.2588235, 0, 1,
-1.76932, -1.219128, -1.263565, 1, 0.2627451, 0, 1,
-1.762379, 0.9281461, 0.04195478, 1, 0.2705882, 0, 1,
-1.756191, 0.1732464, -1.341247, 1, 0.2745098, 0, 1,
-1.746077, -0.244576, -2.344107, 1, 0.282353, 0, 1,
-1.7444, 0.3493873, -3.498185, 1, 0.2862745, 0, 1,
-1.726367, -0.3020759, -1.878166, 1, 0.2941177, 0, 1,
-1.726062, -0.567503, -0.5098833, 1, 0.3019608, 0, 1,
-1.713224, 1.147483, -0.9804041, 1, 0.3058824, 0, 1,
-1.701834, -1.563969, -2.534966, 1, 0.3137255, 0, 1,
-1.69787, -0.3633863, -2.105379, 1, 0.3176471, 0, 1,
-1.688493, 0.8923547, -0.2326658, 1, 0.3254902, 0, 1,
-1.679844, -0.6738153, -1.513084, 1, 0.3294118, 0, 1,
-1.678461, -1.378599, -2.486581, 1, 0.3372549, 0, 1,
-1.678351, -1.482342, -2.777221, 1, 0.3411765, 0, 1,
-1.665829, -1.249112, -3.126188, 1, 0.3490196, 0, 1,
-1.665509, -0.9651593, -3.718021, 1, 0.3529412, 0, 1,
-1.64874, -1.928221, -3.880912, 1, 0.3607843, 0, 1,
-1.648633, -0.1678255, -1.803336, 1, 0.3647059, 0, 1,
-1.64563, 0.02498511, -0.8416346, 1, 0.372549, 0, 1,
-1.637207, 1.186798, -1.549731, 1, 0.3764706, 0, 1,
-1.621363, 1.273447, 1.446362, 1, 0.3843137, 0, 1,
-1.615387, -2.593896, -2.193748, 1, 0.3882353, 0, 1,
-1.592807, -1.306599, -3.270225, 1, 0.3960784, 0, 1,
-1.588196, 1.161088, -0.1471972, 1, 0.4039216, 0, 1,
-1.558948, -0.5864801, -2.077506, 1, 0.4078431, 0, 1,
-1.551608, -0.9146934, -3.056671, 1, 0.4156863, 0, 1,
-1.54563, 1.347161, 0.001524336, 1, 0.4196078, 0, 1,
-1.544277, 0.7629591, -1.831934, 1, 0.427451, 0, 1,
-1.542058, -0.8955562, -1.787157, 1, 0.4313726, 0, 1,
-1.540672, -2.423261, -1.509537, 1, 0.4392157, 0, 1,
-1.512846, -1.022731, -0.9305291, 1, 0.4431373, 0, 1,
-1.497191, 1.0619, -0.2289707, 1, 0.4509804, 0, 1,
-1.478231, 0.5287002, 0.07632139, 1, 0.454902, 0, 1,
-1.473191, 0.4682377, -1.446328, 1, 0.4627451, 0, 1,
-1.469117, -0.1669474, -1.637405, 1, 0.4666667, 0, 1,
-1.462277, -0.9059055, -3.141877, 1, 0.4745098, 0, 1,
-1.455992, -0.08518752, -1.075528, 1, 0.4784314, 0, 1,
-1.439722, 0.03719768, 0.556142, 1, 0.4862745, 0, 1,
-1.436593, 1.463398, -0.006955712, 1, 0.4901961, 0, 1,
-1.428519, -1.009692, -3.334363, 1, 0.4980392, 0, 1,
-1.425814, -1.515373, -2.258977, 1, 0.5058824, 0, 1,
-1.423462, 0.5559056, -0.9649878, 1, 0.509804, 0, 1,
-1.421572, 0.6245226, -2.189493, 1, 0.5176471, 0, 1,
-1.420923, -0.06036568, -1.656909, 1, 0.5215687, 0, 1,
-1.407699, -2.044678, -1.304343, 1, 0.5294118, 0, 1,
-1.376772, -0.1451909, -2.871536, 1, 0.5333334, 0, 1,
-1.375922, -0.6198942, -1.11292, 1, 0.5411765, 0, 1,
-1.366748, 2.084917, -0.7786429, 1, 0.5450981, 0, 1,
-1.355111, 0.5349496, -0.7179796, 1, 0.5529412, 0, 1,
-1.351124, 0.520994, -2.241094, 1, 0.5568628, 0, 1,
-1.337951, -1.018526, -1.590159, 1, 0.5647059, 0, 1,
-1.335183, 1.069979, -1.394297, 1, 0.5686275, 0, 1,
-1.330949, 0.1627149, -1.263396, 1, 0.5764706, 0, 1,
-1.32466, -0.8512617, -2.041641, 1, 0.5803922, 0, 1,
-1.312919, -0.8161849, -1.794253, 1, 0.5882353, 0, 1,
-1.310446, -1.663858, -1.158326, 1, 0.5921569, 0, 1,
-1.308749, 0.8032776, -1.094468, 1, 0.6, 0, 1,
-1.304131, 1.470117, -1.762596, 1, 0.6078432, 0, 1,
-1.299124, 0.3977676, -2.551354, 1, 0.6117647, 0, 1,
-1.286667, -0.1017611, -2.459244, 1, 0.6196079, 0, 1,
-1.285999, 1.136937, -0.8846369, 1, 0.6235294, 0, 1,
-1.276656, 0.4048133, -0.5468174, 1, 0.6313726, 0, 1,
-1.269765, 0.3399257, -1.80179, 1, 0.6352941, 0, 1,
-1.267583, 2.527434, -1.662379, 1, 0.6431373, 0, 1,
-1.264432, 0.415908, -1.424696, 1, 0.6470588, 0, 1,
-1.260087, -0.8598721, -2.209287, 1, 0.654902, 0, 1,
-1.256581, -1.719612, -2.650785, 1, 0.6588235, 0, 1,
-1.254617, -2.262387, -2.742027, 1, 0.6666667, 0, 1,
-1.251444, -1.874474, -2.456623, 1, 0.6705883, 0, 1,
-1.25106, 1.386028, -1.223895, 1, 0.6784314, 0, 1,
-1.243375, 0.2759177, -0.3427837, 1, 0.682353, 0, 1,
-1.242995, 0.5669991, -0.4981926, 1, 0.6901961, 0, 1,
-1.240712, -0.06710085, -0.136154, 1, 0.6941177, 0, 1,
-1.237927, 0.4613886, -1.745495, 1, 0.7019608, 0, 1,
-1.23484, -1.967289, -2.461927, 1, 0.7098039, 0, 1,
-1.22791, 0.4073422, -0.05625429, 1, 0.7137255, 0, 1,
-1.222979, 0.8782761, -2.034428, 1, 0.7215686, 0, 1,
-1.219211, -0.601735, -0.2284728, 1, 0.7254902, 0, 1,
-1.214812, 0.683524, -1.634033, 1, 0.7333333, 0, 1,
-1.213205, 0.714858, 0.828966, 1, 0.7372549, 0, 1,
-1.204206, -0.6830187, -2.549475, 1, 0.7450981, 0, 1,
-1.201726, 1.470497, 1.610425, 1, 0.7490196, 0, 1,
-1.18604, 0.5458586, -0.900071, 1, 0.7568628, 0, 1,
-1.177919, 0.05581122, -1.005989, 1, 0.7607843, 0, 1,
-1.165806, 0.597691, -3.743766, 1, 0.7686275, 0, 1,
-1.165568, 0.6746919, -1.077561, 1, 0.772549, 0, 1,
-1.164618, -0.8963771, -0.6903324, 1, 0.7803922, 0, 1,
-1.159497, -0.5553455, -1.952124, 1, 0.7843137, 0, 1,
-1.15378, -1.606058, -2.571764, 1, 0.7921569, 0, 1,
-1.15159, 2.309427, -0.8124799, 1, 0.7960784, 0, 1,
-1.145157, -0.5490658, -1.232179, 1, 0.8039216, 0, 1,
-1.140946, -1.22704, -1.953935, 1, 0.8117647, 0, 1,
-1.139517, 0.5759332, -0.08885689, 1, 0.8156863, 0, 1,
-1.134514, 1.175017, -1.851081, 1, 0.8235294, 0, 1,
-1.133682, -0.7035723, -1.877249, 1, 0.827451, 0, 1,
-1.12459, 0.6935572, -0.042238, 1, 0.8352941, 0, 1,
-1.113105, 0.5529977, -2.367771, 1, 0.8392157, 0, 1,
-1.110635, 0.3705813, -1.619909, 1, 0.8470588, 0, 1,
-1.110143, 1.81305, -2.288244, 1, 0.8509804, 0, 1,
-1.105261, -1.516762, -2.712039, 1, 0.8588235, 0, 1,
-1.104802, -1.973201, -1.63378, 1, 0.8627451, 0, 1,
-1.103427, -1.314002, -2.441381, 1, 0.8705882, 0, 1,
-1.100231, -0.131352, -1.300606, 1, 0.8745098, 0, 1,
-1.09029, 0.494346, -1.065866, 1, 0.8823529, 0, 1,
-1.087244, -0.1837922, -1.038982, 1, 0.8862745, 0, 1,
-1.087203, -2.412553, -2.451185, 1, 0.8941177, 0, 1,
-1.086848, 0.8063139, 1.4678, 1, 0.8980392, 0, 1,
-1.084751, -0.07670374, -1.252703, 1, 0.9058824, 0, 1,
-1.08344, -2.519462, -2.303072, 1, 0.9137255, 0, 1,
-1.083173, -1.343594, -1.205727, 1, 0.9176471, 0, 1,
-1.078949, 1.690192, -0.190096, 1, 0.9254902, 0, 1,
-1.068451, -1.184852, -0.2397985, 1, 0.9294118, 0, 1,
-1.065174, 0.8537712, -0.2962871, 1, 0.9372549, 0, 1,
-1.060963, -1.264671, -3.036602, 1, 0.9411765, 0, 1,
-1.059755, -0.6792132, -1.708698, 1, 0.9490196, 0, 1,
-1.054588, 0.8116861, -0.7416244, 1, 0.9529412, 0, 1,
-1.04641, 0.4914277, 0.1801706, 1, 0.9607843, 0, 1,
-1.042399, 0.6304669, 0.892759, 1, 0.9647059, 0, 1,
-1.039765, 0.2929153, -0.9881184, 1, 0.972549, 0, 1,
-1.038232, -1.486758, -1.085775, 1, 0.9764706, 0, 1,
-1.037624, 1.397062, 0.7380959, 1, 0.9843137, 0, 1,
-1.037469, 0.1616079, -0.5301526, 1, 0.9882353, 0, 1,
-1.034652, 0.7086456, 1.203419, 1, 0.9960784, 0, 1,
-1.031866, 0.9778047, -1.39149, 0.9960784, 1, 0, 1,
-1.029587, -0.3253863, -2.258475, 0.9921569, 1, 0, 1,
-1.029503, 0.2887169, 0.1510193, 0.9843137, 1, 0, 1,
-1.024876, 1.361388, 1.100673, 0.9803922, 1, 0, 1,
-1.011506, -0.5961552, -2.220887, 0.972549, 1, 0, 1,
-1.009286, -0.1776338, -3.294322, 0.9686275, 1, 0, 1,
-1.00836, 0.004567877, -0.2897407, 0.9607843, 1, 0, 1,
-1.00645, 0.4601927, -0.6928154, 0.9568627, 1, 0, 1,
-0.9910417, 0.5865414, -0.3594715, 0.9490196, 1, 0, 1,
-0.9901912, 0.7058394, -1.155851, 0.945098, 1, 0, 1,
-0.988359, 0.2192708, -3.350056, 0.9372549, 1, 0, 1,
-0.9859296, 1.372998, -1.875504, 0.9333333, 1, 0, 1,
-0.9817679, -0.8166891, -2.560976, 0.9254902, 1, 0, 1,
-0.9801102, 0.294352, -0.9789799, 0.9215686, 1, 0, 1,
-0.9792502, -1.925559, -3.665362, 0.9137255, 1, 0, 1,
-0.9786248, 1.601941, -0.1852144, 0.9098039, 1, 0, 1,
-0.9757159, -0.3482374, -3.035854, 0.9019608, 1, 0, 1,
-0.9699711, -0.1709603, -0.4650701, 0.8941177, 1, 0, 1,
-0.9685778, 1.935443, -1.328608, 0.8901961, 1, 0, 1,
-0.9666349, -0.08052038, -1.904281, 0.8823529, 1, 0, 1,
-0.9505874, -0.235304, -1.804207, 0.8784314, 1, 0, 1,
-0.9467434, 1.827223, 0.2143795, 0.8705882, 1, 0, 1,
-0.9412128, 0.3087786, -1.594762, 0.8666667, 1, 0, 1,
-0.9382045, 0.7870882, -2.158708, 0.8588235, 1, 0, 1,
-0.9169448, -1.276951, -2.000716, 0.854902, 1, 0, 1,
-0.9155864, -1.783952, -4.033204, 0.8470588, 1, 0, 1,
-0.9136705, 0.303862, -1.213252, 0.8431373, 1, 0, 1,
-0.9100789, 0.3253514, -1.357662, 0.8352941, 1, 0, 1,
-0.908538, -0.3754054, -2.723439, 0.8313726, 1, 0, 1,
-0.9083515, -1.438079, -2.210826, 0.8235294, 1, 0, 1,
-0.906306, 2.243936, 0.1994597, 0.8196079, 1, 0, 1,
-0.900257, 0.3279222, -1.259428, 0.8117647, 1, 0, 1,
-0.8980711, -0.9502276, -3.745562, 0.8078431, 1, 0, 1,
-0.8947448, -0.6585593, -0.8673704, 0.8, 1, 0, 1,
-0.8906168, 0.6406713, 0.3564925, 0.7921569, 1, 0, 1,
-0.8834266, 0.9542196, -0.5090511, 0.7882353, 1, 0, 1,
-0.8828544, 0.5250398, -1.705246, 0.7803922, 1, 0, 1,
-0.881085, -0.3463772, -2.277236, 0.7764706, 1, 0, 1,
-0.879439, 0.001733938, -1.386263, 0.7686275, 1, 0, 1,
-0.8725317, 1.50114, -2.313617, 0.7647059, 1, 0, 1,
-0.8694676, -2.103442, -2.019512, 0.7568628, 1, 0, 1,
-0.8691021, 0.8072042, -1.332716, 0.7529412, 1, 0, 1,
-0.8689603, 0.9425033, -0.2171223, 0.7450981, 1, 0, 1,
-0.8685405, 0.6137481, -1.762807, 0.7411765, 1, 0, 1,
-0.8678077, -0.6045833, -1.289211, 0.7333333, 1, 0, 1,
-0.8629768, -0.2140562, -2.122393, 0.7294118, 1, 0, 1,
-0.8616567, 0.9260913, -1.050269, 0.7215686, 1, 0, 1,
-0.860906, 1.288532, -1.567733, 0.7176471, 1, 0, 1,
-0.856223, 0.6645774, -0.1208309, 0.7098039, 1, 0, 1,
-0.8539482, -0.1679056, -0.9462953, 0.7058824, 1, 0, 1,
-0.8447762, 0.8825557, -0.9392953, 0.6980392, 1, 0, 1,
-0.840642, -1.204763, -2.657735, 0.6901961, 1, 0, 1,
-0.8367845, 0.4209107, -1.362968, 0.6862745, 1, 0, 1,
-0.8330611, 0.3913186, -1.426911, 0.6784314, 1, 0, 1,
-0.8287492, 1.01538, 0.7889074, 0.6745098, 1, 0, 1,
-0.8222564, -0.6997967, -2.834725, 0.6666667, 1, 0, 1,
-0.8204139, 0.05385277, -0.2488185, 0.6627451, 1, 0, 1,
-0.81964, -0.2160927, -2.090211, 0.654902, 1, 0, 1,
-0.8161266, -0.1565018, -0.1432337, 0.6509804, 1, 0, 1,
-0.8158818, 2.075673, -0.5890522, 0.6431373, 1, 0, 1,
-0.8131819, -1.222253, -3.383935, 0.6392157, 1, 0, 1,
-0.8117296, -0.6462418, -0.8194657, 0.6313726, 1, 0, 1,
-0.8071781, -0.5868214, -1.557754, 0.627451, 1, 0, 1,
-0.8063754, -1.59759, -1.194962, 0.6196079, 1, 0, 1,
-0.8007145, 0.427686, -1.81963, 0.6156863, 1, 0, 1,
-0.7993227, 0.325718, 1.104267, 0.6078432, 1, 0, 1,
-0.7965346, -0.7946273, -2.761759, 0.6039216, 1, 0, 1,
-0.7921807, 0.5594471, -1.380081, 0.5960785, 1, 0, 1,
-0.7902431, 0.5927343, -0.7105495, 0.5882353, 1, 0, 1,
-0.785328, 0.3273497, -2.56124, 0.5843138, 1, 0, 1,
-0.7712073, 2.104618, -0.09381584, 0.5764706, 1, 0, 1,
-0.7687852, -0.1315214, -0.925331, 0.572549, 1, 0, 1,
-0.7680961, 2.962231, -0.02687494, 0.5647059, 1, 0, 1,
-0.7679281, -1.158158, -1.758153, 0.5607843, 1, 0, 1,
-0.7629064, -0.3576751, -3.036858, 0.5529412, 1, 0, 1,
-0.758396, 1.189733, 1.811096, 0.5490196, 1, 0, 1,
-0.754685, -0.5489787, -0.8533124, 0.5411765, 1, 0, 1,
-0.7518439, -0.3854107, -2.437362, 0.5372549, 1, 0, 1,
-0.7443579, -0.5105418, -1.682824, 0.5294118, 1, 0, 1,
-0.730413, 1.306614, 0.1141908, 0.5254902, 1, 0, 1,
-0.7300371, 0.3683451, -0.2944764, 0.5176471, 1, 0, 1,
-0.7298598, -0.8119493, -1.678595, 0.5137255, 1, 0, 1,
-0.7261142, 0.8570403, -1.217538, 0.5058824, 1, 0, 1,
-0.7257239, -0.6408025, -2.234236, 0.5019608, 1, 0, 1,
-0.7218121, -2.444062, -2.196421, 0.4941176, 1, 0, 1,
-0.7195691, -0.4506917, -2.680746, 0.4862745, 1, 0, 1,
-0.7168558, -1.452586, -4.378608, 0.4823529, 1, 0, 1,
-0.7107341, 0.01587179, -1.848823, 0.4745098, 1, 0, 1,
-0.7081673, -0.2603979, -2.96737, 0.4705882, 1, 0, 1,
-0.7065073, -0.210923, -2.068712, 0.4627451, 1, 0, 1,
-0.7052442, -0.2598969, -1.814998, 0.4588235, 1, 0, 1,
-0.6980276, 0.2899048, -2.472291, 0.4509804, 1, 0, 1,
-0.6963383, 1.326601, 0.3815242, 0.4470588, 1, 0, 1,
-0.6958491, 0.3057385, -0.3911083, 0.4392157, 1, 0, 1,
-0.6948467, -1.234199, -1.639156, 0.4352941, 1, 0, 1,
-0.6917158, 0.09225794, -2.894837, 0.427451, 1, 0, 1,
-0.6821755, 1.03996, -1.442387, 0.4235294, 1, 0, 1,
-0.681327, -0.5326753, -1.798129, 0.4156863, 1, 0, 1,
-0.6773794, -0.4283346, -2.583118, 0.4117647, 1, 0, 1,
-0.6757836, 0.1965217, -0.9722337, 0.4039216, 1, 0, 1,
-0.6686904, 0.9688022, -0.5280342, 0.3960784, 1, 0, 1,
-0.6675395, 0.8381858, -1.3971, 0.3921569, 1, 0, 1,
-0.6671287, -2.712718, -2.850105, 0.3843137, 1, 0, 1,
-0.6579102, -0.4759632, -1.570721, 0.3803922, 1, 0, 1,
-0.6548759, 0.1441663, -1.101765, 0.372549, 1, 0, 1,
-0.6539073, 0.1704321, -2.228672, 0.3686275, 1, 0, 1,
-0.6472202, -0.6558754, -1.726005, 0.3607843, 1, 0, 1,
-0.646646, -1.26523, -2.524261, 0.3568628, 1, 0, 1,
-0.6426584, 1.557037, 0.8273176, 0.3490196, 1, 0, 1,
-0.6381554, 1.858473, 0.4670431, 0.345098, 1, 0, 1,
-0.6376611, -0.9216539, -1.581125, 0.3372549, 1, 0, 1,
-0.6341122, 0.8233984, 0.2362842, 0.3333333, 1, 0, 1,
-0.6330173, -0.8580387, -3.617711, 0.3254902, 1, 0, 1,
-0.6307573, 1.154996, 0.6725867, 0.3215686, 1, 0, 1,
-0.6298763, -0.1446949, -1.303882, 0.3137255, 1, 0, 1,
-0.6257011, 0.4796448, -2.066589, 0.3098039, 1, 0, 1,
-0.624724, 0.4976932, -2.07664, 0.3019608, 1, 0, 1,
-0.6218654, 1.221037, -0.5222917, 0.2941177, 1, 0, 1,
-0.6216359, -0.06282848, -1.768922, 0.2901961, 1, 0, 1,
-0.6214326, 2.038299, -0.07797308, 0.282353, 1, 0, 1,
-0.6197041, 0.7179355, -1.913667, 0.2784314, 1, 0, 1,
-0.6135557, 1.882889, -0.5331238, 0.2705882, 1, 0, 1,
-0.6132729, -0.1578126, -1.731141, 0.2666667, 1, 0, 1,
-0.6131619, -1.190238, -3.564456, 0.2588235, 1, 0, 1,
-0.6111027, 1.169584, -0.3316147, 0.254902, 1, 0, 1,
-0.6050856, 0.1534083, -0.7722436, 0.2470588, 1, 0, 1,
-0.6020866, 0.7353176, -0.1521762, 0.2431373, 1, 0, 1,
-0.5999796, 0.105886, -1.836241, 0.2352941, 1, 0, 1,
-0.5967064, -0.07205609, -2.014198, 0.2313726, 1, 0, 1,
-0.5942692, -0.2121735, 0.02965962, 0.2235294, 1, 0, 1,
-0.5941149, 1.100635, 0.3199821, 0.2196078, 1, 0, 1,
-0.5920811, -1.348875, -3.231211, 0.2117647, 1, 0, 1,
-0.5873282, 2.019083, -0.322904, 0.2078431, 1, 0, 1,
-0.5766054, -0.9678177, -3.154228, 0.2, 1, 0, 1,
-0.5764888, 0.1477503, -1.397918, 0.1921569, 1, 0, 1,
-0.5764028, 1.29411, -0.6398034, 0.1882353, 1, 0, 1,
-0.5720007, 0.02167499, -1.682688, 0.1803922, 1, 0, 1,
-0.5716503, 0.5731725, -0.4623134, 0.1764706, 1, 0, 1,
-0.5702078, -1.008108, -1.349637, 0.1686275, 1, 0, 1,
-0.5659102, -0.3928823, -2.405916, 0.1647059, 1, 0, 1,
-0.5655581, 0.2184653, 0.6037692, 0.1568628, 1, 0, 1,
-0.5644457, 0.7830411, 1.940136, 0.1529412, 1, 0, 1,
-0.5595297, -2.306961, -4.934767, 0.145098, 1, 0, 1,
-0.5544028, -0.850017, -3.729522, 0.1411765, 1, 0, 1,
-0.5532229, -0.004862729, -0.1428247, 0.1333333, 1, 0, 1,
-0.5447744, -0.5155478, -3.423209, 0.1294118, 1, 0, 1,
-0.5445091, 0.3204145, -0.9487661, 0.1215686, 1, 0, 1,
-0.5444047, 0.1421448, -1.075431, 0.1176471, 1, 0, 1,
-0.5400499, 1.055819, -1.331952, 0.1098039, 1, 0, 1,
-0.5390313, 0.8144106, 0.7742898, 0.1058824, 1, 0, 1,
-0.5371547, -0.711895, -4.259091, 0.09803922, 1, 0, 1,
-0.5348277, 3.454836, 0.3087338, 0.09019608, 1, 0, 1,
-0.5291457, 0.4234745, -0.8445796, 0.08627451, 1, 0, 1,
-0.5276584, 0.6114429, -0.4722986, 0.07843138, 1, 0, 1,
-0.5219312, 0.8234587, 0.5396418, 0.07450981, 1, 0, 1,
-0.5209931, 0.06232991, -2.582607, 0.06666667, 1, 0, 1,
-0.5209427, 0.1840505, -2.214134, 0.0627451, 1, 0, 1,
-0.5191314, 0.1851045, 1.068892, 0.05490196, 1, 0, 1,
-0.5187809, -0.06129853, -3.901911, 0.05098039, 1, 0, 1,
-0.5133175, -0.4280521, -0.8825999, 0.04313726, 1, 0, 1,
-0.502746, 1.276897, -1.280354, 0.03921569, 1, 0, 1,
-0.5027138, 1.236426, 1.551384, 0.03137255, 1, 0, 1,
-0.5001293, 2.8214, 0.1944484, 0.02745098, 1, 0, 1,
-0.4974945, -0.5668738, -2.6038, 0.01960784, 1, 0, 1,
-0.4917697, 0.8019489, 0.4270056, 0.01568628, 1, 0, 1,
-0.4907848, 0.3034015, -1.599299, 0.007843138, 1, 0, 1,
-0.4900698, -0.1402614, -1.401012, 0.003921569, 1, 0, 1,
-0.4888386, -0.5711781, -1.047966, 0, 1, 0.003921569, 1,
-0.473685, -0.05400896, -2.574802, 0, 1, 0.01176471, 1,
-0.4729443, -0.1409272, -2.051441, 0, 1, 0.01568628, 1,
-0.4618438, -1.080076, -4.197043, 0, 1, 0.02352941, 1,
-0.4601091, 1.404422, -0.1644918, 0, 1, 0.02745098, 1,
-0.4552049, -1.076489, -4.284119, 0, 1, 0.03529412, 1,
-0.4455498, -0.0774398, -1.340409, 0, 1, 0.03921569, 1,
-0.4432469, -0.5348424, -1.739703, 0, 1, 0.04705882, 1,
-0.4413019, -0.6751788, -3.095937, 0, 1, 0.05098039, 1,
-0.4388286, 0.3141278, -0.6374393, 0, 1, 0.05882353, 1,
-0.4374163, -0.05166342, -0.193764, 0, 1, 0.0627451, 1,
-0.4363776, 0.4731307, -1.855094, 0, 1, 0.07058824, 1,
-0.4363042, -0.7936219, -1.431403, 0, 1, 0.07450981, 1,
-0.4313584, 0.5718263, -0.3755845, 0, 1, 0.08235294, 1,
-0.4289291, 0.3789222, -4.238349, 0, 1, 0.08627451, 1,
-0.4243511, -1.047294, -3.864258, 0, 1, 0.09411765, 1,
-0.4203335, 0.03917295, 1.164666, 0, 1, 0.1019608, 1,
-0.4199285, 0.2254463, -3.590958, 0, 1, 0.1058824, 1,
-0.4188665, 1.355525, -1.763654, 0, 1, 0.1137255, 1,
-0.4176378, -0.6226004, -3.862592, 0, 1, 0.1176471, 1,
-0.4169047, -1.466135, -3.848118, 0, 1, 0.1254902, 1,
-0.4012774, -1.190533, -2.360204, 0, 1, 0.1294118, 1,
-0.4001262, 0.8419172, -0.2596199, 0, 1, 0.1372549, 1,
-0.3920304, -0.06328948, -0.9252046, 0, 1, 0.1411765, 1,
-0.3848601, 0.2095307, -3.05444, 0, 1, 0.1490196, 1,
-0.3803975, -1.560192, -2.946206, 0, 1, 0.1529412, 1,
-0.379246, -0.9661791, -3.289576, 0, 1, 0.1607843, 1,
-0.3760752, 1.774911, 1.081999, 0, 1, 0.1647059, 1,
-0.3752085, 1.539597, 0.2654476, 0, 1, 0.172549, 1,
-0.3731709, -0.4711116, -3.402731, 0, 1, 0.1764706, 1,
-0.3703883, -0.01870808, -1.162001, 0, 1, 0.1843137, 1,
-0.361719, 1.305653, -1.031484, 0, 1, 0.1882353, 1,
-0.3585578, 0.6427764, -1.13171, 0, 1, 0.1960784, 1,
-0.3562536, -0.06103391, -2.253575, 0, 1, 0.2039216, 1,
-0.3519533, 0.190622, -0.9778243, 0, 1, 0.2078431, 1,
-0.3512144, 0.03783868, -2.703781, 0, 1, 0.2156863, 1,
-0.3509462, 2.628972, -1.476255, 0, 1, 0.2196078, 1,
-0.3496996, 0.6331155, -0.3059408, 0, 1, 0.227451, 1,
-0.3440653, -0.9997569, -3.479384, 0, 1, 0.2313726, 1,
-0.3421637, 0.3886341, -0.6871571, 0, 1, 0.2392157, 1,
-0.3387144, -0.2859655, -4.136786, 0, 1, 0.2431373, 1,
-0.338644, 0.721431, -1.601495, 0, 1, 0.2509804, 1,
-0.3349375, -0.1125372, -0.7462302, 0, 1, 0.254902, 1,
-0.3329588, 0.1614802, -1.87895, 0, 1, 0.2627451, 1,
-0.3322247, -0.2877699, -2.714627, 0, 1, 0.2666667, 1,
-0.3290588, 1.229648, -1.667705, 0, 1, 0.2745098, 1,
-0.3270732, -0.4358075, -0.7845943, 0, 1, 0.2784314, 1,
-0.3210636, 0.6616824, -2.579669, 0, 1, 0.2862745, 1,
-0.3179218, 0.3418553, -0.04248305, 0, 1, 0.2901961, 1,
-0.3172837, 0.09790385, -0.4560874, 0, 1, 0.2980392, 1,
-0.3166471, 0.04437767, -2.018433, 0, 1, 0.3058824, 1,
-0.3159764, -0.3185328, 0.2527282, 0, 1, 0.3098039, 1,
-0.315884, -0.112164, -0.338043, 0, 1, 0.3176471, 1,
-0.3119901, 0.2920406, 0.1935876, 0, 1, 0.3215686, 1,
-0.3107458, 0.5158986, -1.542577, 0, 1, 0.3294118, 1,
-0.305811, 0.879838, -0.6044975, 0, 1, 0.3333333, 1,
-0.3052909, 1.456485, 2.796967, 0, 1, 0.3411765, 1,
-0.3022174, 1.158769, -1.059817, 0, 1, 0.345098, 1,
-0.2967118, 1.460454, -0.9012539, 0, 1, 0.3529412, 1,
-0.2945721, -1.855365, -3.293391, 0, 1, 0.3568628, 1,
-0.2929108, -0.2440817, -2.120586, 0, 1, 0.3647059, 1,
-0.2928514, 0.7393435, 0.05834513, 0, 1, 0.3686275, 1,
-0.292618, 0.954312, -1.348998, 0, 1, 0.3764706, 1,
-0.2919932, -0.7839521, -0.8207645, 0, 1, 0.3803922, 1,
-0.288018, -0.4395142, -2.586098, 0, 1, 0.3882353, 1,
-0.2849545, 1.406723, 0.7381214, 0, 1, 0.3921569, 1,
-0.2803746, 0.1414254, -2.469175, 0, 1, 0.4, 1,
-0.2781907, -0.5661951, -2.037243, 0, 1, 0.4078431, 1,
-0.2749519, -0.9858663, -0.9072302, 0, 1, 0.4117647, 1,
-0.2744202, -0.8410497, -1.874594, 0, 1, 0.4196078, 1,
-0.2719166, -0.6867585, -4.14671, 0, 1, 0.4235294, 1,
-0.2713979, -0.08686836, -2.256216, 0, 1, 0.4313726, 1,
-0.2687504, 1.103275, 1.201111, 0, 1, 0.4352941, 1,
-0.2680834, -0.1514709, -1.474647, 0, 1, 0.4431373, 1,
-0.2673539, -0.7725713, -2.700433, 0, 1, 0.4470588, 1,
-0.2662487, -1.366997, -4.649092, 0, 1, 0.454902, 1,
-0.263465, 0.1851793, 0.6327925, 0, 1, 0.4588235, 1,
-0.2537809, 0.06479982, -1.549945, 0, 1, 0.4666667, 1,
-0.2531314, -1.939678, -2.264413, 0, 1, 0.4705882, 1,
-0.2531306, 0.7778806, -1.35348, 0, 1, 0.4784314, 1,
-0.2463942, -1.411115, -3.050052, 0, 1, 0.4823529, 1,
-0.2431747, -0.2065845, -1.690694, 0, 1, 0.4901961, 1,
-0.2421069, -0.4708236, -2.064877, 0, 1, 0.4941176, 1,
-0.2349988, -0.1891349, -2.744153, 0, 1, 0.5019608, 1,
-0.2330167, -2.203003, -3.308244, 0, 1, 0.509804, 1,
-0.2329541, -1.185171, -3.26438, 0, 1, 0.5137255, 1,
-0.2285425, 0.1000294, -1.372743, 0, 1, 0.5215687, 1,
-0.2280666, 0.4115671, -1.471078, 0, 1, 0.5254902, 1,
-0.2207567, 1.416713, -1.277132, 0, 1, 0.5333334, 1,
-0.2174266, 1.07452, 1.145955, 0, 1, 0.5372549, 1,
-0.2168226, -1.126322, -1.976826, 0, 1, 0.5450981, 1,
-0.1996325, 1.317758, 0.2385773, 0, 1, 0.5490196, 1,
-0.1992923, -0.5284628, -3.662503, 0, 1, 0.5568628, 1,
-0.1920808, 0.1453073, -0.1809641, 0, 1, 0.5607843, 1,
-0.1876048, 0.7684929, -0.04120892, 0, 1, 0.5686275, 1,
-0.1822755, 0.6181908, -0.3638946, 0, 1, 0.572549, 1,
-0.1808766, -0.602097, -2.935244, 0, 1, 0.5803922, 1,
-0.1794955, 0.1545644, -0.3935451, 0, 1, 0.5843138, 1,
-0.1784915, -0.3797106, -2.665308, 0, 1, 0.5921569, 1,
-0.1774147, 0.6721234, 0.0832518, 0, 1, 0.5960785, 1,
-0.1719455, 1.348855, -0.5054058, 0, 1, 0.6039216, 1,
-0.1708163, 0.2126372, 0.7254463, 0, 1, 0.6117647, 1,
-0.1701066, -0.3122889, -3.644284, 0, 1, 0.6156863, 1,
-0.1681552, 0.8267934, -0.4255554, 0, 1, 0.6235294, 1,
-0.1631725, -0.0716391, -0.283608, 0, 1, 0.627451, 1,
-0.1579019, -1.225877, -3.010416, 0, 1, 0.6352941, 1,
-0.1577828, 0.1261003, -0.7131216, 0, 1, 0.6392157, 1,
-0.1553127, 0.02849909, -1.978421, 0, 1, 0.6470588, 1,
-0.1535705, 0.2124909, -0.1759996, 0, 1, 0.6509804, 1,
-0.1514423, 0.3835562, -0.2531867, 0, 1, 0.6588235, 1,
-0.1508578, -0.1843605, -0.8526461, 0, 1, 0.6627451, 1,
-0.1439038, -1.499848, -3.440732, 0, 1, 0.6705883, 1,
-0.141886, -1.048589, -3.693074, 0, 1, 0.6745098, 1,
-0.1391331, 0.2040906, -0.1462099, 0, 1, 0.682353, 1,
-0.1390287, 0.7477871, 0.1670822, 0, 1, 0.6862745, 1,
-0.1386234, -0.4165514, -2.720348, 0, 1, 0.6941177, 1,
-0.135694, -1.547183, -2.43263, 0, 1, 0.7019608, 1,
-0.1347643, 0.5991817, -0.7052538, 0, 1, 0.7058824, 1,
-0.1333523, 0.5507098, -0.05944209, 0, 1, 0.7137255, 1,
-0.1319337, -0.9684699, -6.162271, 0, 1, 0.7176471, 1,
-0.129328, 0.7326036, 1.038528, 0, 1, 0.7254902, 1,
-0.1288983, -0.5505669, -3.442559, 0, 1, 0.7294118, 1,
-0.1160253, 0.3174935, -0.7362804, 0, 1, 0.7372549, 1,
-0.1108572, -1.809155, -3.991795, 0, 1, 0.7411765, 1,
-0.110578, -1.286977, -5.035656, 0, 1, 0.7490196, 1,
-0.1059405, 0.07230554, -0.1176739, 0, 1, 0.7529412, 1,
-0.1054862, 0.1250754, -1.143556, 0, 1, 0.7607843, 1,
-0.1050483, 0.01761854, -2.211884, 0, 1, 0.7647059, 1,
-0.1027101, -1.931951, -3.901978, 0, 1, 0.772549, 1,
-0.1020263, -0.7373857, -5.141629, 0, 1, 0.7764706, 1,
-0.09979578, -1.08141, -5.019368, 0, 1, 0.7843137, 1,
-0.0978096, 0.9739265, -0.2535031, 0, 1, 0.7882353, 1,
-0.09481007, -0.2700077, -2.758492, 0, 1, 0.7960784, 1,
-0.09394771, 0.7174515, 0.8749801, 0, 1, 0.8039216, 1,
-0.08963952, -1.30007, -2.939628, 0, 1, 0.8078431, 1,
-0.08812087, -0.1617766, -1.650915, 0, 1, 0.8156863, 1,
-0.08776328, 0.3096375, 0.7179523, 0, 1, 0.8196079, 1,
-0.08723611, 0.349325, -1.462132, 0, 1, 0.827451, 1,
-0.08705536, 0.4315532, -0.005618525, 0, 1, 0.8313726, 1,
-0.07870568, -0.9197249, -4.910256, 0, 1, 0.8392157, 1,
-0.07728457, 0.7941419, 0.8615624, 0, 1, 0.8431373, 1,
-0.07503919, -0.03137573, -1.590677, 0, 1, 0.8509804, 1,
-0.07258789, 0.7392843, 0.4773288, 0, 1, 0.854902, 1,
-0.07119076, 0.7207912, -2.216378, 0, 1, 0.8627451, 1,
-0.06965715, 1.09001, 0.4334739, 0, 1, 0.8666667, 1,
-0.06841201, 0.4163017, -0.9904467, 0, 1, 0.8745098, 1,
-0.0667033, -0.4407905, -4.291661, 0, 1, 0.8784314, 1,
-0.06655981, -0.45287, -3.586074, 0, 1, 0.8862745, 1,
-0.05772711, 1.49625, -0.2367768, 0, 1, 0.8901961, 1,
-0.05767111, 0.3969906, 0.1065529, 0, 1, 0.8980392, 1,
-0.05678957, -0.157628, -3.674789, 0, 1, 0.9058824, 1,
-0.05122962, 0.002889645, -3.738891, 0, 1, 0.9098039, 1,
-0.04834621, -0.6494074, -2.25869, 0, 1, 0.9176471, 1,
-0.04719383, -0.6091537, -3.423442, 0, 1, 0.9215686, 1,
-0.0463535, -0.52142, -2.5507, 0, 1, 0.9294118, 1,
-0.03068043, -0.1550724, -4.114352, 0, 1, 0.9333333, 1,
-0.02916765, -0.0005017633, -3.460593, 0, 1, 0.9411765, 1,
-0.02894289, -0.1917289, -2.127186, 0, 1, 0.945098, 1,
-0.02796294, -0.05329781, -1.08974, 0, 1, 0.9529412, 1,
-0.02763405, 0.3859623, 0.2590038, 0, 1, 0.9568627, 1,
-0.02104666, 1.651684, -0.06663738, 0, 1, 0.9647059, 1,
-0.01754373, -0.4451324, -2.922431, 0, 1, 0.9686275, 1,
-0.01686678, 0.1985102, -0.1444535, 0, 1, 0.9764706, 1,
-0.01465645, 0.02131699, 0.9166887, 0, 1, 0.9803922, 1,
-0.01422465, -0.2958525, -0.1523517, 0, 1, 0.9882353, 1,
-0.01092207, -0.9313694, -3.220237, 0, 1, 0.9921569, 1,
-0.009273496, -0.4222243, -3.028198, 0, 1, 1, 1,
-0.008474293, -1.650575, -3.630217, 0, 0.9921569, 1, 1,
-0.008216364, -1.107581, -2.343681, 0, 0.9882353, 1, 1,
-0.006881585, -0.945887, -3.474773, 0, 0.9803922, 1, 1,
-0.003136868, 0.8887287, -1.880597, 0, 0.9764706, 1, 1,
-0.0001589858, 0.6628928, 0.2952616, 0, 0.9686275, 1, 1,
0.0004687442, 1.252603, -0.9756262, 0, 0.9647059, 1, 1,
0.003393529, 0.7970226, 1.331687, 0, 0.9568627, 1, 1,
0.01798497, 0.5768651, 0.6484796, 0, 0.9529412, 1, 1,
0.02232986, 0.3587144, -0.1369658, 0, 0.945098, 1, 1,
0.02803575, -0.1218042, 2.734922, 0, 0.9411765, 1, 1,
0.02878244, -0.8315123, 3.218694, 0, 0.9333333, 1, 1,
0.0292246, 1.074942, -0.1304781, 0, 0.9294118, 1, 1,
0.0300907, 0.08377416, 0.3287475, 0, 0.9215686, 1, 1,
0.03398491, 0.4830731, -1.204875, 0, 0.9176471, 1, 1,
0.03448899, -0.5195637, 2.518115, 0, 0.9098039, 1, 1,
0.03708927, -0.2328396, 2.808806, 0, 0.9058824, 1, 1,
0.0372711, 0.281769, -0.6846066, 0, 0.8980392, 1, 1,
0.03968716, 0.0262199, 1.691032, 0, 0.8901961, 1, 1,
0.04278354, -0.8955878, 2.495577, 0, 0.8862745, 1, 1,
0.04288762, -0.1210403, 3.019913, 0, 0.8784314, 1, 1,
0.04609799, 1.102687, -0.2034557, 0, 0.8745098, 1, 1,
0.04818732, -1.139158, 3.235515, 0, 0.8666667, 1, 1,
0.04983702, -0.3580652, 1.750568, 0, 0.8627451, 1, 1,
0.05169613, -0.7480748, 3.19312, 0, 0.854902, 1, 1,
0.0525578, -0.5939413, 1.885974, 0, 0.8509804, 1, 1,
0.05306814, 1.534587, 0.6672434, 0, 0.8431373, 1, 1,
0.05402346, -0.2065219, 3.761055, 0, 0.8392157, 1, 1,
0.0577619, -0.4477116, 2.649798, 0, 0.8313726, 1, 1,
0.0592122, 0.04733215, 0.9441562, 0, 0.827451, 1, 1,
0.06261656, 0.4962595, -0.5582072, 0, 0.8196079, 1, 1,
0.06370298, -1.166365, 4.741762, 0, 0.8156863, 1, 1,
0.06438871, 1.267105, 0.03463821, 0, 0.8078431, 1, 1,
0.06795508, 0.9079407, 0.8562672, 0, 0.8039216, 1, 1,
0.06873745, 0.5728006, 0.05168212, 0, 0.7960784, 1, 1,
0.07429318, 0.689274, -0.5975924, 0, 0.7882353, 1, 1,
0.08103462, 0.7768703, -0.4062065, 0, 0.7843137, 1, 1,
0.08340763, 0.6689056, -1.805896, 0, 0.7764706, 1, 1,
0.08442431, -0.05051078, 3.057126, 0, 0.772549, 1, 1,
0.09383377, 0.3221835, 0.3623439, 0, 0.7647059, 1, 1,
0.09393016, 0.04926245, 0.03112118, 0, 0.7607843, 1, 1,
0.09517585, 0.1492065, -0.1270027, 0, 0.7529412, 1, 1,
0.09691192, -1.086473, 3.079337, 0, 0.7490196, 1, 1,
0.09803346, -0.09565538, 2.639154, 0, 0.7411765, 1, 1,
0.09971036, -0.3186866, 3.883395, 0, 0.7372549, 1, 1,
0.09977982, -0.3925692, 2.670234, 0, 0.7294118, 1, 1,
0.1028184, 0.9936051, 0.1943436, 0, 0.7254902, 1, 1,
0.1059168, -0.1318203, 2.623049, 0, 0.7176471, 1, 1,
0.110662, 1.317061, -0.6364092, 0, 0.7137255, 1, 1,
0.112549, 0.1782675, -2.075986, 0, 0.7058824, 1, 1,
0.1149745, -0.1410216, 3.575261, 0, 0.6980392, 1, 1,
0.1179132, 0.1158895, -1.162736, 0, 0.6941177, 1, 1,
0.118471, -0.7011294, 3.510725, 0, 0.6862745, 1, 1,
0.1196037, 0.2867001, -0.3259599, 0, 0.682353, 1, 1,
0.1203331, -1.349352, 3.392653, 0, 0.6745098, 1, 1,
0.1246338, 1.223898, -1.055472, 0, 0.6705883, 1, 1,
0.1287632, 0.6448703, -0.8027318, 0, 0.6627451, 1, 1,
0.1311205, -1.624353, 4.594853, 0, 0.6588235, 1, 1,
0.1312328, -1.400622, 2.429714, 0, 0.6509804, 1, 1,
0.131876, -0.6175613, 2.909336, 0, 0.6470588, 1, 1,
0.1328734, 0.9990973, -0.2883984, 0, 0.6392157, 1, 1,
0.133633, -0.8766766, 4.283693, 0, 0.6352941, 1, 1,
0.1347158, 0.6798545, 0.7268927, 0, 0.627451, 1, 1,
0.1366795, 0.9208884, -1.012683, 0, 0.6235294, 1, 1,
0.1414239, -0.05982307, 0.6567879, 0, 0.6156863, 1, 1,
0.1430169, -0.00426827, 1.380421, 0, 0.6117647, 1, 1,
0.1435278, 0.3934486, 0.8981431, 0, 0.6039216, 1, 1,
0.1485972, -0.6322931, 4.077398, 0, 0.5960785, 1, 1,
0.1531551, -0.1988286, 2.816835, 0, 0.5921569, 1, 1,
0.1551439, 0.2018768, -0.03432206, 0, 0.5843138, 1, 1,
0.15635, 0.7361065, 1.126455, 0, 0.5803922, 1, 1,
0.1590523, -1.513937, 2.210787, 0, 0.572549, 1, 1,
0.1609103, -1.882371, 3.609634, 0, 0.5686275, 1, 1,
0.1618911, -0.6761204, 3.930261, 0, 0.5607843, 1, 1,
0.1629165, -0.5562952, 4.671074, 0, 0.5568628, 1, 1,
0.1632904, -0.2847397, 2.85263, 0, 0.5490196, 1, 1,
0.1696617, -2.220887, 2.019823, 0, 0.5450981, 1, 1,
0.1702771, 2.208555, 0.4342699, 0, 0.5372549, 1, 1,
0.1724949, -0.8845804, 1.697649, 0, 0.5333334, 1, 1,
0.1762496, 2.176496, -0.7209353, 0, 0.5254902, 1, 1,
0.177435, 0.2802, 0.2452504, 0, 0.5215687, 1, 1,
0.1790503, -0.6333555, 2.359925, 0, 0.5137255, 1, 1,
0.1796601, 0.2454108, 0.178467, 0, 0.509804, 1, 1,
0.1813441, 1.910022, 2.048055, 0, 0.5019608, 1, 1,
0.1838187, -0.8081325, 3.805186, 0, 0.4941176, 1, 1,
0.1966357, 0.8227251, -0.2635422, 0, 0.4901961, 1, 1,
0.2015281, 1.736549, 1.678445, 0, 0.4823529, 1, 1,
0.2026742, 1.055655, -0.1407593, 0, 0.4784314, 1, 1,
0.20667, 0.7489864, 0.1722035, 0, 0.4705882, 1, 1,
0.2098656, 1.210641, 0.9445882, 0, 0.4666667, 1, 1,
0.2098708, -1.111993, 2.184856, 0, 0.4588235, 1, 1,
0.2122234, 0.8132479, 1.06891, 0, 0.454902, 1, 1,
0.2145117, -1.928549, 4.185156, 0, 0.4470588, 1, 1,
0.216498, -0.7512308, 2.655487, 0, 0.4431373, 1, 1,
0.2181436, -2.311842, 2.907308, 0, 0.4352941, 1, 1,
0.2215742, -0.1723048, 2.913947, 0, 0.4313726, 1, 1,
0.224059, 1.304486, -0.2058479, 0, 0.4235294, 1, 1,
0.2250377, -1.789667, 4.608728, 0, 0.4196078, 1, 1,
0.2270038, 0.653828, 0.8163958, 0, 0.4117647, 1, 1,
0.2283472, 1.882764, 0.5108214, 0, 0.4078431, 1, 1,
0.2306931, -0.933046, 2.594809, 0, 0.4, 1, 1,
0.2324034, 0.1509816, 1.790089, 0, 0.3921569, 1, 1,
0.2351345, -1.989156, 5.066494, 0, 0.3882353, 1, 1,
0.2358427, -0.1130354, 2.494836, 0, 0.3803922, 1, 1,
0.2374064, 0.06561416, 1.964107, 0, 0.3764706, 1, 1,
0.2391236, -1.002063, 2.667304, 0, 0.3686275, 1, 1,
0.2394887, 1.486665, -0.4896624, 0, 0.3647059, 1, 1,
0.2418413, 2.167986, 0.5314943, 0, 0.3568628, 1, 1,
0.2424405, -0.4225434, 1.921325, 0, 0.3529412, 1, 1,
0.2431353, -0.1300791, 1.067129, 0, 0.345098, 1, 1,
0.2443393, -0.03899815, 1.603122, 0, 0.3411765, 1, 1,
0.2449139, 0.02764335, 2.167702, 0, 0.3333333, 1, 1,
0.2490371, 2.674129, -1.269758, 0, 0.3294118, 1, 1,
0.2493266, 1.519186, 0.4757195, 0, 0.3215686, 1, 1,
0.2508714, -1.164908, 1.121745, 0, 0.3176471, 1, 1,
0.2512948, 0.3103442, 1.288989, 0, 0.3098039, 1, 1,
0.2616255, -0.9947042, 1.529036, 0, 0.3058824, 1, 1,
0.2622923, -1.197637, 3.457172, 0, 0.2980392, 1, 1,
0.2663681, 1.786467, 1.479195, 0, 0.2901961, 1, 1,
0.2667345, 0.3983434, 1.680063, 0, 0.2862745, 1, 1,
0.2667416, -0.3653297, 2.816229, 0, 0.2784314, 1, 1,
0.2676966, -0.3947725, 3.63291, 0, 0.2745098, 1, 1,
0.2709201, 0.5551057, 1.101351, 0, 0.2666667, 1, 1,
0.271496, -0.3389132, 2.197808, 0, 0.2627451, 1, 1,
0.2773031, -0.8989137, 1.756135, 0, 0.254902, 1, 1,
0.2775342, -0.381842, 2.278708, 0, 0.2509804, 1, 1,
0.2776139, 1.78613, 1.077245, 0, 0.2431373, 1, 1,
0.2835107, -1.327136, 4.488262, 0, 0.2392157, 1, 1,
0.2849155, 0.2022571, 3.856284, 0, 0.2313726, 1, 1,
0.2871014, -0.05287096, 2.322359, 0, 0.227451, 1, 1,
0.2877423, -0.4046004, 2.055705, 0, 0.2196078, 1, 1,
0.2922534, 1.604531, 0.5012879, 0, 0.2156863, 1, 1,
0.3038025, -0.2888956, 2.127182, 0, 0.2078431, 1, 1,
0.3065509, -0.3846254, 2.263856, 0, 0.2039216, 1, 1,
0.3086701, -1.407303, 3.245521, 0, 0.1960784, 1, 1,
0.3097324, 0.0585237, 1.532276, 0, 0.1882353, 1, 1,
0.3134589, -0.2035729, 2.336354, 0, 0.1843137, 1, 1,
0.317359, 0.05323572, 1.299825, 0, 0.1764706, 1, 1,
0.3253059, 0.9908395, -0.3422205, 0, 0.172549, 1, 1,
0.329547, -0.6362026, 3.502685, 0, 0.1647059, 1, 1,
0.3401645, -0.7150862, 1.066942, 0, 0.1607843, 1, 1,
0.3404323, -1.664612, 1.971584, 0, 0.1529412, 1, 1,
0.3458439, 0.3675814, 2.144027, 0, 0.1490196, 1, 1,
0.3534658, -0.1252725, 2.164508, 0, 0.1411765, 1, 1,
0.3556544, -1.84205, 2.916287, 0, 0.1372549, 1, 1,
0.3562661, 0.1270578, 1.109508, 0, 0.1294118, 1, 1,
0.3592225, -0.6492197, 2.784908, 0, 0.1254902, 1, 1,
0.3619575, -0.5094133, 1.143696, 0, 0.1176471, 1, 1,
0.3676162, -0.533935, 0.326597, 0, 0.1137255, 1, 1,
0.3696396, -0.7341397, 2.054363, 0, 0.1058824, 1, 1,
0.3724346, 0.4414682, 1.032625, 0, 0.09803922, 1, 1,
0.3778859, 1.261788, -0.2693554, 0, 0.09411765, 1, 1,
0.3793716, -0.9518859, 2.888421, 0, 0.08627451, 1, 1,
0.3827252, 0.4046928, 0.2346008, 0, 0.08235294, 1, 1,
0.3832867, -0.4251724, 2.993016, 0, 0.07450981, 1, 1,
0.3838983, 0.6251545, 2.809117, 0, 0.07058824, 1, 1,
0.3846709, -0.7729606, 1.394244, 0, 0.0627451, 1, 1,
0.3858234, -0.8535561, 3.89624, 0, 0.05882353, 1, 1,
0.3874199, -1.84045, 3.381248, 0, 0.05098039, 1, 1,
0.3936224, -2.02935, 3.856411, 0, 0.04705882, 1, 1,
0.3968438, -0.3657912, 3.827229, 0, 0.03921569, 1, 1,
0.3968443, 0.4662158, -0.06615497, 0, 0.03529412, 1, 1,
0.3972187, -0.3877743, 2.471882, 0, 0.02745098, 1, 1,
0.4021392, -0.5437331, 3.140666, 0, 0.02352941, 1, 1,
0.4028227, 0.9156258, 0.8807434, 0, 0.01568628, 1, 1,
0.4053247, 2.011415, 0.07974437, 0, 0.01176471, 1, 1,
0.4067277, 0.7678611, 1.046003, 0, 0.003921569, 1, 1,
0.4105202, -0.4258387, 1.705041, 0.003921569, 0, 1, 1,
0.4123962, -0.6433154, 1.324776, 0.007843138, 0, 1, 1,
0.4124582, 1.445038, 0.1427521, 0.01568628, 0, 1, 1,
0.4182378, 1.534864, -1.028798, 0.01960784, 0, 1, 1,
0.420188, -0.08307237, 3.287546, 0.02745098, 0, 1, 1,
0.4212505, 0.5709571, 0.1481517, 0.03137255, 0, 1, 1,
0.429656, 0.8948563, 0.7220486, 0.03921569, 0, 1, 1,
0.4315601, -1.04421, 2.902397, 0.04313726, 0, 1, 1,
0.4359604, -1.388997, 3.334582, 0.05098039, 0, 1, 1,
0.4361975, 1.002854, -2.196552, 0.05490196, 0, 1, 1,
0.4461486, 0.62285, 2.005674, 0.0627451, 0, 1, 1,
0.4477527, 0.7457102, 1.68268, 0.06666667, 0, 1, 1,
0.4533476, -1.019639, 1.628974, 0.07450981, 0, 1, 1,
0.4544523, -0.5608053, 3.581348, 0.07843138, 0, 1, 1,
0.45889, -0.8078396, 1.79327, 0.08627451, 0, 1, 1,
0.4598433, 2.141679, 1.467949, 0.09019608, 0, 1, 1,
0.4632138, 0.05225058, 1.554399, 0.09803922, 0, 1, 1,
0.4634322, -1.476398, 4.133985, 0.1058824, 0, 1, 1,
0.4673398, -0.1102567, 3.121392, 0.1098039, 0, 1, 1,
0.4706562, -0.7578579, 3.590663, 0.1176471, 0, 1, 1,
0.4730618, 0.6075419, 0.6145876, 0.1215686, 0, 1, 1,
0.4860581, -0.1640519, 0.4891164, 0.1294118, 0, 1, 1,
0.4861619, -0.4028724, 1.039706, 0.1333333, 0, 1, 1,
0.4867134, 0.1375367, 2.445843, 0.1411765, 0, 1, 1,
0.4869524, -1.27306, 1.643692, 0.145098, 0, 1, 1,
0.4870613, 0.1685263, 0.7787518, 0.1529412, 0, 1, 1,
0.4881056, 0.5234659, 0.7885818, 0.1568628, 0, 1, 1,
0.4882178, -0.5788542, 2.85349, 0.1647059, 0, 1, 1,
0.490039, -0.6679415, 3.173117, 0.1686275, 0, 1, 1,
0.4908844, -0.3416674, 2.598046, 0.1764706, 0, 1, 1,
0.4910805, 0.8681963, -0.1636362, 0.1803922, 0, 1, 1,
0.4944762, -1.530728, 2.618141, 0.1882353, 0, 1, 1,
0.4988875, 0.2400457, -0.05145685, 0.1921569, 0, 1, 1,
0.5011533, -1.476168, 2.432863, 0.2, 0, 1, 1,
0.501223, -1.307939, 3.489096, 0.2078431, 0, 1, 1,
0.501692, -0.4423564, 2.120422, 0.2117647, 0, 1, 1,
0.5032789, 0.3223523, 1.185447, 0.2196078, 0, 1, 1,
0.503337, 0.8955734, 0.9822374, 0.2235294, 0, 1, 1,
0.503769, 0.1490708, 0.2715513, 0.2313726, 0, 1, 1,
0.5088102, 2.417654, -0.50665, 0.2352941, 0, 1, 1,
0.5096874, -1.583744, 2.703541, 0.2431373, 0, 1, 1,
0.5111064, 0.1718692, 0.07575537, 0.2470588, 0, 1, 1,
0.5136079, -0.7489523, 2.741715, 0.254902, 0, 1, 1,
0.5165201, -0.06595854, 1.007963, 0.2588235, 0, 1, 1,
0.5179251, 1.575374, -0.4883406, 0.2666667, 0, 1, 1,
0.520175, -1.266158, 2.119277, 0.2705882, 0, 1, 1,
0.5212229, -1.16783, 2.207329, 0.2784314, 0, 1, 1,
0.5217197, 0.9086756, -1.624187, 0.282353, 0, 1, 1,
0.5252657, 0.6565918, 0.7399677, 0.2901961, 0, 1, 1,
0.5290196, -1.307486, 2.061543, 0.2941177, 0, 1, 1,
0.5433345, -0.6278275, 2.324129, 0.3019608, 0, 1, 1,
0.5459836, -1.790775, 3.444308, 0.3098039, 0, 1, 1,
0.5469365, 0.7532116, -0.8885621, 0.3137255, 0, 1, 1,
0.5497859, 0.5251772, -1.795946, 0.3215686, 0, 1, 1,
0.5543192, 2.274096, -0.9325193, 0.3254902, 0, 1, 1,
0.5560972, 1.94035, 0.620777, 0.3333333, 0, 1, 1,
0.5581412, -1.446851, 3.603302, 0.3372549, 0, 1, 1,
0.5610141, -0.3769688, 3.474963, 0.345098, 0, 1, 1,
0.5722916, 0.2764094, 0.9543175, 0.3490196, 0, 1, 1,
0.5753405, -0.8827745, 1.397275, 0.3568628, 0, 1, 1,
0.5755734, 0.09033096, 0.3604146, 0.3607843, 0, 1, 1,
0.5764052, -0.4853363, 2.874701, 0.3686275, 0, 1, 1,
0.5829983, -0.7269288, 2.282749, 0.372549, 0, 1, 1,
0.5861441, -0.8652943, 2.598293, 0.3803922, 0, 1, 1,
0.586554, 0.08048095, 1.517309, 0.3843137, 0, 1, 1,
0.5873486, 1.762434, 1.513319, 0.3921569, 0, 1, 1,
0.5881581, -1.485677, 4.663815, 0.3960784, 0, 1, 1,
0.6096784, -1.842046, 2.015881, 0.4039216, 0, 1, 1,
0.6113274, 0.5813196, 1.404444, 0.4117647, 0, 1, 1,
0.6141382, 1.888109, 0.7543136, 0.4156863, 0, 1, 1,
0.6224909, -0.1128568, 1.6469, 0.4235294, 0, 1, 1,
0.6231969, 1.282621, 0.4411677, 0.427451, 0, 1, 1,
0.62662, -0.002445158, -0.9019035, 0.4352941, 0, 1, 1,
0.6266258, 2.953739, -0.4967333, 0.4392157, 0, 1, 1,
0.6307816, 1.310647, -0.3581753, 0.4470588, 0, 1, 1,
0.6328962, 0.8374506, 1.598522, 0.4509804, 0, 1, 1,
0.6399242, -0.3913143, 2.298977, 0.4588235, 0, 1, 1,
0.6411005, -1.690485, 2.584623, 0.4627451, 0, 1, 1,
0.641943, -0.4501814, 1.728087, 0.4705882, 0, 1, 1,
0.6427074, 0.2840906, 2.516323, 0.4745098, 0, 1, 1,
0.6438466, 0.3179373, 0.1853315, 0.4823529, 0, 1, 1,
0.6455207, -1.053137, 2.574114, 0.4862745, 0, 1, 1,
0.6514884, 0.7397067, 2.026284, 0.4941176, 0, 1, 1,
0.6591783, 1.359496, 1.950774, 0.5019608, 0, 1, 1,
0.6644219, -0.141063, 0.7635254, 0.5058824, 0, 1, 1,
0.6656281, 0.4714637, -0.3177267, 0.5137255, 0, 1, 1,
0.6669413, 1.159192, 0.415934, 0.5176471, 0, 1, 1,
0.6700548, 0.1942139, 1.881192, 0.5254902, 0, 1, 1,
0.6748443, 0.3396457, 1.931247, 0.5294118, 0, 1, 1,
0.6765333, 0.1456769, 2.487969, 0.5372549, 0, 1, 1,
0.677511, -0.4139949, 1.869413, 0.5411765, 0, 1, 1,
0.6810622, 1.893974, 1.085998, 0.5490196, 0, 1, 1,
0.681999, 0.05148161, 0.7235166, 0.5529412, 0, 1, 1,
0.6822028, -0.2766438, 1.155352, 0.5607843, 0, 1, 1,
0.6838036, 1.447086, 0.08102398, 0.5647059, 0, 1, 1,
0.6896948, -0.3175625, 1.823054, 0.572549, 0, 1, 1,
0.6903581, 0.9343466, 0.2009349, 0.5764706, 0, 1, 1,
0.6926343, -0.7795154, 2.048917, 0.5843138, 0, 1, 1,
0.6945606, -1.401502, 2.703737, 0.5882353, 0, 1, 1,
0.6983113, -0.4173872, 1.944494, 0.5960785, 0, 1, 1,
0.7025201, 1.110313, 1.559713, 0.6039216, 0, 1, 1,
0.7059559, -0.7431296, 4.084962, 0.6078432, 0, 1, 1,
0.707539, 0.9662933, 1.446676, 0.6156863, 0, 1, 1,
0.7080721, 0.01634681, 1.70905, 0.6196079, 0, 1, 1,
0.7093685, 0.5163391, 0.1911895, 0.627451, 0, 1, 1,
0.7171646, -0.5641472, 1.683717, 0.6313726, 0, 1, 1,
0.7212586, -0.4589879, 1.290332, 0.6392157, 0, 1, 1,
0.7253603, 1.974441, 0.2097984, 0.6431373, 0, 1, 1,
0.7254434, -1.168855, 2.916285, 0.6509804, 0, 1, 1,
0.7298826, 1.305614, -1.254422, 0.654902, 0, 1, 1,
0.7300401, -3.138279, 4.004023, 0.6627451, 0, 1, 1,
0.7333442, 0.3584182, -0.8770574, 0.6666667, 0, 1, 1,
0.7387418, -0.5326226, 1.516514, 0.6745098, 0, 1, 1,
0.7430722, -0.4147415, 2.300694, 0.6784314, 0, 1, 1,
0.7440935, -1.252376, 3.496655, 0.6862745, 0, 1, 1,
0.7568245, 0.9423856, -0.6061457, 0.6901961, 0, 1, 1,
0.7575701, -0.6568537, 2.505066, 0.6980392, 0, 1, 1,
0.7671794, 1.345537, 1.804399, 0.7058824, 0, 1, 1,
0.7684818, 0.5848163, 1.649891, 0.7098039, 0, 1, 1,
0.7687572, 0.5655355, 1.023337, 0.7176471, 0, 1, 1,
0.7689456, -0.8846821, 1.237043, 0.7215686, 0, 1, 1,
0.7721698, 0.2331567, 1.317316, 0.7294118, 0, 1, 1,
0.7745173, 0.645462, 0.9878244, 0.7333333, 0, 1, 1,
0.7782491, -0.01362926, 2.23475, 0.7411765, 0, 1, 1,
0.7823457, 0.06727357, 0.8270613, 0.7450981, 0, 1, 1,
0.7854428, 1.262405, 1.803791, 0.7529412, 0, 1, 1,
0.7887626, -2.098591, 2.912153, 0.7568628, 0, 1, 1,
0.7929599, -0.617233, 2.6477, 0.7647059, 0, 1, 1,
0.7957324, 0.1487038, 1.149592, 0.7686275, 0, 1, 1,
0.796813, 0.9739182, 1.841714, 0.7764706, 0, 1, 1,
0.8037966, 0.9127598, -0.1175132, 0.7803922, 0, 1, 1,
0.804808, -0.8223895, 3.755428, 0.7882353, 0, 1, 1,
0.8116942, 0.7300638, -0.1046471, 0.7921569, 0, 1, 1,
0.8119608, 0.02729981, 1.22402, 0.8, 0, 1, 1,
0.8194818, 1.071451, 1.015343, 0.8078431, 0, 1, 1,
0.8212479, -2.207302, 2.182181, 0.8117647, 0, 1, 1,
0.8228412, -0.958236, 3.669229, 0.8196079, 0, 1, 1,
0.8235687, 0.2665369, 0.8413809, 0.8235294, 0, 1, 1,
0.8429145, 0.5869887, 1.207348, 0.8313726, 0, 1, 1,
0.8487046, -0.01246905, 1.01185, 0.8352941, 0, 1, 1,
0.8540804, -0.6280422, 0.9486007, 0.8431373, 0, 1, 1,
0.8542236, 0.1564011, 0.3721003, 0.8470588, 0, 1, 1,
0.8576558, 1.084168, 1.015143, 0.854902, 0, 1, 1,
0.8607003, -0.7484496, 3.073374, 0.8588235, 0, 1, 1,
0.8634261, -0.8223599, 2.615479, 0.8666667, 0, 1, 1,
0.8648492, 0.2091399, -0.5086695, 0.8705882, 0, 1, 1,
0.8709028, 0.09711623, 0.7221542, 0.8784314, 0, 1, 1,
0.882569, -1.084066, 3.497957, 0.8823529, 0, 1, 1,
0.88758, 0.008903365, 2.132434, 0.8901961, 0, 1, 1,
0.8948973, 0.8804731, 1.478315, 0.8941177, 0, 1, 1,
0.8997353, 0.6591425, 1.774289, 0.9019608, 0, 1, 1,
0.9012505, 0.7473152, 0.2379797, 0.9098039, 0, 1, 1,
0.9034945, 0.8893983, 1.391232, 0.9137255, 0, 1, 1,
0.9063758, 0.8475887, 0.5085128, 0.9215686, 0, 1, 1,
0.9077035, 0.4669233, 0.2162204, 0.9254902, 0, 1, 1,
0.9080127, -0.2791851, 0.9177769, 0.9333333, 0, 1, 1,
0.9130515, 0.8670022, 0.2023053, 0.9372549, 0, 1, 1,
0.9199696, -0.1788762, 2.87744, 0.945098, 0, 1, 1,
0.923982, -0.02321075, 1.092086, 0.9490196, 0, 1, 1,
0.9258429, 0.3597962, 1.962763, 0.9568627, 0, 1, 1,
0.927905, -1.558189, 2.308256, 0.9607843, 0, 1, 1,
0.9285077, -1.068394, 1.74103, 0.9686275, 0, 1, 1,
0.9287528, 0.0891547, 0.3068123, 0.972549, 0, 1, 1,
0.9310484, 0.005944297, 2.579732, 0.9803922, 0, 1, 1,
0.9318922, -0.3797598, 1.365189, 0.9843137, 0, 1, 1,
0.9418728, -0.4905663, 0.6001751, 0.9921569, 0, 1, 1,
0.9484633, 1.007843, 0.8497419, 0.9960784, 0, 1, 1,
0.9503701, 1.075581, 0.5864325, 1, 0, 0.9960784, 1,
0.9514958, 1.151434, 1.576527, 1, 0, 0.9882353, 1,
0.9562335, 0.4960113, -1.114174, 1, 0, 0.9843137, 1,
0.9579667, -1.175419, 3.510007, 1, 0, 0.9764706, 1,
0.9601407, -0.536901, 0.1748364, 1, 0, 0.972549, 1,
0.9631611, 0.1432634, 0.5353195, 1, 0, 0.9647059, 1,
0.9651606, 0.5615295, 2.304628, 1, 0, 0.9607843, 1,
0.9672325, -1.132825, 4.088658, 1, 0, 0.9529412, 1,
0.9713685, 0.8766698, -0.6462181, 1, 0, 0.9490196, 1,
0.9715283, -1.102986, 3.539176, 1, 0, 0.9411765, 1,
0.9760615, 1.678305, 1.504417, 1, 0, 0.9372549, 1,
0.9789213, 1.210592, 0.4568745, 1, 0, 0.9294118, 1,
0.9803427, 0.6390167, 0.8592626, 1, 0, 0.9254902, 1,
0.9832661, 0.1138036, 1.069211, 1, 0, 0.9176471, 1,
0.9836168, 1.200784, 0.677192, 1, 0, 0.9137255, 1,
0.9899706, -0.4767935, 2.351749, 1, 0, 0.9058824, 1,
0.9938425, -0.7255519, -0.7029121, 1, 0, 0.9019608, 1,
1.008564, 0.6197659, 0.7035468, 1, 0, 0.8941177, 1,
1.015791, -0.7008338, 1.893425, 1, 0, 0.8862745, 1,
1.017072, -0.03091566, 0.3040154, 1, 0, 0.8823529, 1,
1.030466, -0.07612966, 1.02007, 1, 0, 0.8745098, 1,
1.034302, -0.7384006, 2.043627, 1, 0, 0.8705882, 1,
1.034968, -0.6717295, 3.660198, 1, 0, 0.8627451, 1,
1.037958, 0.2045584, 1.914352, 1, 0, 0.8588235, 1,
1.045771, -0.5567408, 2.555163, 1, 0, 0.8509804, 1,
1.047513, 0.8675297, 0.9197349, 1, 0, 0.8470588, 1,
1.048899, 1.27933, -0.4126726, 1, 0, 0.8392157, 1,
1.054737, 1.355228, 0.9834283, 1, 0, 0.8352941, 1,
1.055454, -1.083898, 2.98616, 1, 0, 0.827451, 1,
1.061431, -0.2989697, 2.82862, 1, 0, 0.8235294, 1,
1.062584, 0.9645143, 0.1554338, 1, 0, 0.8156863, 1,
1.064239, 0.02592544, 2.66085, 1, 0, 0.8117647, 1,
1.066263, -0.09790687, 1.45653, 1, 0, 0.8039216, 1,
1.069924, -0.1024195, 0.5565234, 1, 0, 0.7960784, 1,
1.069946, 0.6939279, 2.7492, 1, 0, 0.7921569, 1,
1.074656, -1.078631, 1.696417, 1, 0, 0.7843137, 1,
1.082276, 0.1835216, -0.2583503, 1, 0, 0.7803922, 1,
1.082453, 0.7571993, 0.6412416, 1, 0, 0.772549, 1,
1.087386, 0.9710099, 1.092883, 1, 0, 0.7686275, 1,
1.088741, -0.7284991, 3.14171, 1, 0, 0.7607843, 1,
1.09624, 0.8936078, -0.4903681, 1, 0, 0.7568628, 1,
1.096301, -0.6980163, 2.269253, 1, 0, 0.7490196, 1,
1.106391, 0.7314047, -0.1045191, 1, 0, 0.7450981, 1,
1.107141, -0.8731135, -0.2866122, 1, 0, 0.7372549, 1,
1.108653, 1.184001, 0.5002949, 1, 0, 0.7333333, 1,
1.136318, -2.800542, 4.252127, 1, 0, 0.7254902, 1,
1.137882, 1.743617, 1.634672, 1, 0, 0.7215686, 1,
1.140452, -0.6867762, 1.633471, 1, 0, 0.7137255, 1,
1.142733, -0.8144904, 1.445919, 1, 0, 0.7098039, 1,
1.144384, 0.3521572, 1.862196, 1, 0, 0.7019608, 1,
1.146873, 0.5333344, 1.913744, 1, 0, 0.6941177, 1,
1.146982, 0.2676052, 0.8528916, 1, 0, 0.6901961, 1,
1.150784, 2.151028, 1.224038, 1, 0, 0.682353, 1,
1.152571, -1.676673, 2.691647, 1, 0, 0.6784314, 1,
1.157164, 0.1112893, 2.083817, 1, 0, 0.6705883, 1,
1.16629, -0.09191085, 0.9219176, 1, 0, 0.6666667, 1,
1.167246, 0.607955, 0.6015583, 1, 0, 0.6588235, 1,
1.168225, -0.3585359, 3.198468, 1, 0, 0.654902, 1,
1.17149, -0.4867309, 2.969697, 1, 0, 0.6470588, 1,
1.175812, 0.2909046, 1.438145, 1, 0, 0.6431373, 1,
1.176898, 0.9511681, 1.391532, 1, 0, 0.6352941, 1,
1.192362, -1.19724, 3.26178, 1, 0, 0.6313726, 1,
1.212963, 0.1323192, -0.2257118, 1, 0, 0.6235294, 1,
1.235122, 0.0428573, 0.7860402, 1, 0, 0.6196079, 1,
1.238613, -2.169869, 2.546303, 1, 0, 0.6117647, 1,
1.252994, 2.590544, -0.3997792, 1, 0, 0.6078432, 1,
1.254572, -0.7386684, 0.9804188, 1, 0, 0.6, 1,
1.259183, -0.8750854, 1.92419, 1, 0, 0.5921569, 1,
1.2615, 0.2382797, 2.246755, 1, 0, 0.5882353, 1,
1.263177, -0.4657988, 1.484144, 1, 0, 0.5803922, 1,
1.271854, 0.686533, 0.5678149, 1, 0, 0.5764706, 1,
1.279053, 0.7497653, 0.7285901, 1, 0, 0.5686275, 1,
1.283737, 0.8781217, -0.5238867, 1, 0, 0.5647059, 1,
1.292204, 0.6473542, 1.849117, 1, 0, 0.5568628, 1,
1.292621, 0.4901224, 0.4323432, 1, 0, 0.5529412, 1,
1.30266, -0.1625945, 0.796115, 1, 0, 0.5450981, 1,
1.304138, 0.2701731, 1.678075, 1, 0, 0.5411765, 1,
1.306833, 0.2256068, 1.445566, 1, 0, 0.5333334, 1,
1.314685, -1.75414, 0.875968, 1, 0, 0.5294118, 1,
1.325678, -1.221256, 2.613618, 1, 0, 0.5215687, 1,
1.326746, -0.1233481, 2.15387, 1, 0, 0.5176471, 1,
1.331169, -3.761535, 2.959618, 1, 0, 0.509804, 1,
1.332859, -0.1513447, 0.4801378, 1, 0, 0.5058824, 1,
1.33604, 0.5940361, 2.060525, 1, 0, 0.4980392, 1,
1.357075, -0.08475436, 1.878016, 1, 0, 0.4901961, 1,
1.35952, -1.318519, 2.36203, 1, 0, 0.4862745, 1,
1.369249, -1.327475, 3.83142, 1, 0, 0.4784314, 1,
1.371978, -0.4617258, -0.2417224, 1, 0, 0.4745098, 1,
1.379533, -0.5063007, 1.876724, 1, 0, 0.4666667, 1,
1.381401, 0.2011586, 4.619151, 1, 0, 0.4627451, 1,
1.38321, -0.8272136, 2.983907, 1, 0, 0.454902, 1,
1.396194, -0.1913749, 1.51177, 1, 0, 0.4509804, 1,
1.399521, 1.280343, -1.360134, 1, 0, 0.4431373, 1,
1.415529, -0.2615106, 2.458647, 1, 0, 0.4392157, 1,
1.422135, 0.4062031, 4.138221, 1, 0, 0.4313726, 1,
1.425521, -0.2937096, 1.746965, 1, 0, 0.427451, 1,
1.446449, -1.24007, 0.7461641, 1, 0, 0.4196078, 1,
1.447052, -0.3900009, 1.019564, 1, 0, 0.4156863, 1,
1.447258, 0.2202952, 1.897129, 1, 0, 0.4078431, 1,
1.461961, 1.264747, -0.8774398, 1, 0, 0.4039216, 1,
1.467855, -1.900359, 2.775309, 1, 0, 0.3960784, 1,
1.474341, -0.7660174, 2.148329, 1, 0, 0.3882353, 1,
1.480125, 0.2293346, 1.917246, 1, 0, 0.3843137, 1,
1.482041, 0.1731416, 1.900021, 1, 0, 0.3764706, 1,
1.483808, -0.8182456, 2.310691, 1, 0, 0.372549, 1,
1.493863, -0.1537272, 0.6766889, 1, 0, 0.3647059, 1,
1.496525, -1.614325, 5.296143, 1, 0, 0.3607843, 1,
1.507004, -1.832189, 1.923742, 1, 0, 0.3529412, 1,
1.509206, -0.6540256, 1.02062, 1, 0, 0.3490196, 1,
1.521349, -0.9792839, -0.5222033, 1, 0, 0.3411765, 1,
1.534876, 1.032784, 1.65975, 1, 0, 0.3372549, 1,
1.539268, -0.7080935, 2.077236, 1, 0, 0.3294118, 1,
1.543914, 0.9349743, 1.067542, 1, 0, 0.3254902, 1,
1.558377, -1.186976, 3.123193, 1, 0, 0.3176471, 1,
1.564995, 2.140606, 2.553822, 1, 0, 0.3137255, 1,
1.567487, -0.4630892, 2.253885, 1, 0, 0.3058824, 1,
1.573663, -0.4548094, 1.566219, 1, 0, 0.2980392, 1,
1.582891, -1.423867, 1.944566, 1, 0, 0.2941177, 1,
1.597628, 0.1082256, 1.17613, 1, 0, 0.2862745, 1,
1.600312, 2.071091, 0.2049457, 1, 0, 0.282353, 1,
1.600829, 1.214581, 1.548118, 1, 0, 0.2745098, 1,
1.613211, -0.4757626, 3.160767, 1, 0, 0.2705882, 1,
1.61592, -0.6500202, 1.82234, 1, 0, 0.2627451, 1,
1.626929, -0.3040691, 1.810822, 1, 0, 0.2588235, 1,
1.643895, 0.2755647, 0.2774484, 1, 0, 0.2509804, 1,
1.65666, 0.259272, 1.685006, 1, 0, 0.2470588, 1,
1.658743, -1.352633, 1.801377, 1, 0, 0.2392157, 1,
1.668308, -0.1823051, 1.242687, 1, 0, 0.2352941, 1,
1.675596, -0.3479858, 2.338237, 1, 0, 0.227451, 1,
1.709194, -0.3174767, 1.551042, 1, 0, 0.2235294, 1,
1.718904, -1.029093, 1.581329, 1, 0, 0.2156863, 1,
1.735898, 0.1884729, 1.95436, 1, 0, 0.2117647, 1,
1.741682, -1.036956, 2.296987, 1, 0, 0.2039216, 1,
1.748317, -0.05858478, 2.607687, 1, 0, 0.1960784, 1,
1.754886, -0.6428667, 2.008932, 1, 0, 0.1921569, 1,
1.782215, -2.348335, 2.365423, 1, 0, 0.1843137, 1,
1.831731, -0.22989, 2.052979, 1, 0, 0.1803922, 1,
1.841988, -0.4136955, 1.225633, 1, 0, 0.172549, 1,
1.844157, 1.12744, -0.7627892, 1, 0, 0.1686275, 1,
1.874849, 1.489217, 0.9988967, 1, 0, 0.1607843, 1,
1.878379, -1.043366, 1.22005, 1, 0, 0.1568628, 1,
1.892822, -0.1565995, 1.416942, 1, 0, 0.1490196, 1,
1.899302, -0.1124982, 1.178542, 1, 0, 0.145098, 1,
1.935902, 0.2927657, 0.1512838, 1, 0, 0.1372549, 1,
1.996548, -2.689424, 2.724114, 1, 0, 0.1333333, 1,
2.037389, 0.05718929, 3.66636, 1, 0, 0.1254902, 1,
2.038121, -0.263503, 1.582108, 1, 0, 0.1215686, 1,
2.045972, -2.120278, 1.36385, 1, 0, 0.1137255, 1,
2.06202, -0.3067366, 0.6814929, 1, 0, 0.1098039, 1,
2.069312, -1.961778, 0.3230003, 1, 0, 0.1019608, 1,
2.160939, 0.907254, 1.791363, 1, 0, 0.09411765, 1,
2.18316, -2.003613, 0.2573768, 1, 0, 0.09019608, 1,
2.188709, -0.5394735, 1.460593, 1, 0, 0.08235294, 1,
2.208413, -0.7280648, 1.796078, 1, 0, 0.07843138, 1,
2.29366, 2.988426, -0.4409522, 1, 0, 0.07058824, 1,
2.297929, -0.5635878, 1.314475, 1, 0, 0.06666667, 1,
2.311906, 0.5953601, 1.602247, 1, 0, 0.05882353, 1,
2.315474, -0.9882163, 1.977307, 1, 0, 0.05490196, 1,
2.370367, 0.422334, 1.2621, 1, 0, 0.04705882, 1,
2.502349, 1.265546, -0.3321426, 1, 0, 0.04313726, 1,
2.520452, 1.226924, -0.5916116, 1, 0, 0.03529412, 1,
2.543969, 1.825262, -0.83849, 1, 0, 0.03137255, 1,
2.565043, -0.1953599, 0.7692423, 1, 0, 0.02352941, 1,
2.721692, -0.3704047, 0.7894158, 1, 0, 0.01960784, 1,
3.034655, 0.5445768, 0.7149336, 1, 0, 0.01176471, 1,
3.173853, -1.027904, 2.120091, 1, 0, 0.007843138, 1
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
0.01780784, -4.98471, -8.104472, 0, -0.5, 0.5, 0.5,
0.01780784, -4.98471, -8.104472, 1, -0.5, 0.5, 0.5,
0.01780784, -4.98471, -8.104472, 1, 1.5, 0.5, 0.5,
0.01780784, -4.98471, -8.104472, 0, 1.5, 0.5, 0.5
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
-4.208136, -0.1533495, -8.104472, 0, -0.5, 0.5, 0.5,
-4.208136, -0.1533495, -8.104472, 1, -0.5, 0.5, 0.5,
-4.208136, -0.1533495, -8.104472, 1, 1.5, 0.5, 0.5,
-4.208136, -0.1533495, -8.104472, 0, 1.5, 0.5, 0.5
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
-4.208136, -4.98471, -0.433064, 0, -0.5, 0.5, 0.5,
-4.208136, -4.98471, -0.433064, 1, -0.5, 0.5, 0.5,
-4.208136, -4.98471, -0.433064, 1, 1.5, 0.5, 0.5,
-4.208136, -4.98471, -0.433064, 0, 1.5, 0.5, 0.5
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
-3, -3.869781, -6.334147,
3, -3.869781, -6.334147,
-3, -3.869781, -6.334147,
-3, -4.055602, -6.629201,
-2, -3.869781, -6.334147,
-2, -4.055602, -6.629201,
-1, -3.869781, -6.334147,
-1, -4.055602, -6.629201,
0, -3.869781, -6.334147,
0, -4.055602, -6.629201,
1, -3.869781, -6.334147,
1, -4.055602, -6.629201,
2, -3.869781, -6.334147,
2, -4.055602, -6.629201,
3, -3.869781, -6.334147,
3, -4.055602, -6.629201
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
-3, -4.427245, -7.21931, 0, -0.5, 0.5, 0.5,
-3, -4.427245, -7.21931, 1, -0.5, 0.5, 0.5,
-3, -4.427245, -7.21931, 1, 1.5, 0.5, 0.5,
-3, -4.427245, -7.21931, 0, 1.5, 0.5, 0.5,
-2, -4.427245, -7.21931, 0, -0.5, 0.5, 0.5,
-2, -4.427245, -7.21931, 1, -0.5, 0.5, 0.5,
-2, -4.427245, -7.21931, 1, 1.5, 0.5, 0.5,
-2, -4.427245, -7.21931, 0, 1.5, 0.5, 0.5,
-1, -4.427245, -7.21931, 0, -0.5, 0.5, 0.5,
-1, -4.427245, -7.21931, 1, -0.5, 0.5, 0.5,
-1, -4.427245, -7.21931, 1, 1.5, 0.5, 0.5,
-1, -4.427245, -7.21931, 0, 1.5, 0.5, 0.5,
0, -4.427245, -7.21931, 0, -0.5, 0.5, 0.5,
0, -4.427245, -7.21931, 1, -0.5, 0.5, 0.5,
0, -4.427245, -7.21931, 1, 1.5, 0.5, 0.5,
0, -4.427245, -7.21931, 0, 1.5, 0.5, 0.5,
1, -4.427245, -7.21931, 0, -0.5, 0.5, 0.5,
1, -4.427245, -7.21931, 1, -0.5, 0.5, 0.5,
1, -4.427245, -7.21931, 1, 1.5, 0.5, 0.5,
1, -4.427245, -7.21931, 0, 1.5, 0.5, 0.5,
2, -4.427245, -7.21931, 0, -0.5, 0.5, 0.5,
2, -4.427245, -7.21931, 1, -0.5, 0.5, 0.5,
2, -4.427245, -7.21931, 1, 1.5, 0.5, 0.5,
2, -4.427245, -7.21931, 0, 1.5, 0.5, 0.5,
3, -4.427245, -7.21931, 0, -0.5, 0.5, 0.5,
3, -4.427245, -7.21931, 1, -0.5, 0.5, 0.5,
3, -4.427245, -7.21931, 1, 1.5, 0.5, 0.5,
3, -4.427245, -7.21931, 0, 1.5, 0.5, 0.5
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
-3.232918, -2, -6.334147,
-3.232918, 2, -6.334147,
-3.232918, -2, -6.334147,
-3.395455, -2, -6.629201,
-3.232918, 0, -6.334147,
-3.395455, 0, -6.629201,
-3.232918, 2, -6.334147,
-3.395455, 2, -6.629201
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
"0",
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
-3.720527, -2, -7.21931, 0, -0.5, 0.5, 0.5,
-3.720527, -2, -7.21931, 1, -0.5, 0.5, 0.5,
-3.720527, -2, -7.21931, 1, 1.5, 0.5, 0.5,
-3.720527, -2, -7.21931, 0, 1.5, 0.5, 0.5,
-3.720527, 0, -7.21931, 0, -0.5, 0.5, 0.5,
-3.720527, 0, -7.21931, 1, -0.5, 0.5, 0.5,
-3.720527, 0, -7.21931, 1, 1.5, 0.5, 0.5,
-3.720527, 0, -7.21931, 0, 1.5, 0.5, 0.5,
-3.720527, 2, -7.21931, 0, -0.5, 0.5, 0.5,
-3.720527, 2, -7.21931, 1, -0.5, 0.5, 0.5,
-3.720527, 2, -7.21931, 1, 1.5, 0.5, 0.5,
-3.720527, 2, -7.21931, 0, 1.5, 0.5, 0.5
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
-3.232918, -3.869781, -6,
-3.232918, -3.869781, 4,
-3.232918, -3.869781, -6,
-3.395455, -4.055602, -6,
-3.232918, -3.869781, -4,
-3.395455, -4.055602, -4,
-3.232918, -3.869781, -2,
-3.395455, -4.055602, -2,
-3.232918, -3.869781, 0,
-3.395455, -4.055602, 0,
-3.232918, -3.869781, 2,
-3.395455, -4.055602, 2,
-3.232918, -3.869781, 4,
-3.395455, -4.055602, 4
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
-3.720527, -4.427245, -6, 0, -0.5, 0.5, 0.5,
-3.720527, -4.427245, -6, 1, -0.5, 0.5, 0.5,
-3.720527, -4.427245, -6, 1, 1.5, 0.5, 0.5,
-3.720527, -4.427245, -6, 0, 1.5, 0.5, 0.5,
-3.720527, -4.427245, -4, 0, -0.5, 0.5, 0.5,
-3.720527, -4.427245, -4, 1, -0.5, 0.5, 0.5,
-3.720527, -4.427245, -4, 1, 1.5, 0.5, 0.5,
-3.720527, -4.427245, -4, 0, 1.5, 0.5, 0.5,
-3.720527, -4.427245, -2, 0, -0.5, 0.5, 0.5,
-3.720527, -4.427245, -2, 1, -0.5, 0.5, 0.5,
-3.720527, -4.427245, -2, 1, 1.5, 0.5, 0.5,
-3.720527, -4.427245, -2, 0, 1.5, 0.5, 0.5,
-3.720527, -4.427245, 0, 0, -0.5, 0.5, 0.5,
-3.720527, -4.427245, 0, 1, -0.5, 0.5, 0.5,
-3.720527, -4.427245, 0, 1, 1.5, 0.5, 0.5,
-3.720527, -4.427245, 0, 0, 1.5, 0.5, 0.5,
-3.720527, -4.427245, 2, 0, -0.5, 0.5, 0.5,
-3.720527, -4.427245, 2, 1, -0.5, 0.5, 0.5,
-3.720527, -4.427245, 2, 1, 1.5, 0.5, 0.5,
-3.720527, -4.427245, 2, 0, 1.5, 0.5, 0.5,
-3.720527, -4.427245, 4, 0, -0.5, 0.5, 0.5,
-3.720527, -4.427245, 4, 1, -0.5, 0.5, 0.5,
-3.720527, -4.427245, 4, 1, 1.5, 0.5, 0.5,
-3.720527, -4.427245, 4, 0, 1.5, 0.5, 0.5
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
-3.232918, -3.869781, -6.334147,
-3.232918, 3.563082, -6.334147,
-3.232918, -3.869781, 5.468019,
-3.232918, 3.563082, 5.468019,
-3.232918, -3.869781, -6.334147,
-3.232918, -3.869781, 5.468019,
-3.232918, 3.563082, -6.334147,
-3.232918, 3.563082, 5.468019,
-3.232918, -3.869781, -6.334147,
3.268534, -3.869781, -6.334147,
-3.232918, -3.869781, 5.468019,
3.268534, -3.869781, 5.468019,
-3.232918, 3.563082, -6.334147,
3.268534, 3.563082, -6.334147,
-3.232918, 3.563082, 5.468019,
3.268534, 3.563082, 5.468019,
3.268534, -3.869781, -6.334147,
3.268534, 3.563082, -6.334147,
3.268534, -3.869781, 5.468019,
3.268534, 3.563082, 5.468019,
3.268534, -3.869781, -6.334147,
3.268534, -3.869781, 5.468019,
3.268534, 3.563082, -6.334147,
3.268534, 3.563082, 5.468019
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
var radius = 8.217186;
var distance = 36.55919;
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
mvMatrix.translate( -0.01780784, 0.1533495, 0.433064 );
mvMatrix.scale( 1.366554, 1.195311, 0.7527925 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.55919);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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


