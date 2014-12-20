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
-3.771577, -0.1680586, -1.371991, 1, 0, 0, 1,
-2.618757, -0.1937394, -1.604553, 1, 0.007843138, 0, 1,
-2.56092, 0.1299953, -3.535548, 1, 0.01176471, 0, 1,
-2.547336, -0.5459606, -4.238379, 1, 0.01960784, 0, 1,
-2.533245, 0.05388888, 0.9287072, 1, 0.02352941, 0, 1,
-2.448169, 0.2491147, -0.1552736, 1, 0.03137255, 0, 1,
-2.429627, 0.6882222, -1.225086, 1, 0.03529412, 0, 1,
-2.42796, 0.1827914, -1.333522, 1, 0.04313726, 0, 1,
-2.426172, -1.234102, -1.13066, 1, 0.04705882, 0, 1,
-2.349694, 1.495577, -0.9596817, 1, 0.05490196, 0, 1,
-2.28721, -0.4250736, -2.173043, 1, 0.05882353, 0, 1,
-2.276643, -1.130901, -1.962705, 1, 0.06666667, 0, 1,
-2.20294, 1.006866, -1.553232, 1, 0.07058824, 0, 1,
-2.202631, -0.04410058, -0.7397932, 1, 0.07843138, 0, 1,
-2.19019, -0.349587, -2.253456, 1, 0.08235294, 0, 1,
-2.1628, 0.9556501, -1.675771, 1, 0.09019608, 0, 1,
-2.148188, 1.631417, -0.3170515, 1, 0.09411765, 0, 1,
-2.145023, -0.5471116, -2.037686, 1, 0.1019608, 0, 1,
-2.127215, -0.7548366, -2.313898, 1, 0.1098039, 0, 1,
-2.08961, -0.2894147, -2.448765, 1, 0.1137255, 0, 1,
-2.065907, 1.547869, -0.4502728, 1, 0.1215686, 0, 1,
-2.047658, -1.426778, -3.322627, 1, 0.1254902, 0, 1,
-2.028821, 0.1361748, -4.295678, 1, 0.1333333, 0, 1,
-2.011044, 0.4702218, -1.187149, 1, 0.1372549, 0, 1,
-1.996848, -0.4258447, -1.917271, 1, 0.145098, 0, 1,
-1.987919, -1.028978, -1.313035, 1, 0.1490196, 0, 1,
-1.978231, -0.7882379, -2.994582, 1, 0.1568628, 0, 1,
-1.972779, -0.3123812, -1.404633, 1, 0.1607843, 0, 1,
-1.970811, 0.8233975, -2.532112, 1, 0.1686275, 0, 1,
-1.906401, 1.991042, -0.4109256, 1, 0.172549, 0, 1,
-1.891803, 1.773655, -2.326296, 1, 0.1803922, 0, 1,
-1.891477, 0.6028249, -1.455527, 1, 0.1843137, 0, 1,
-1.871658, 0.4757909, -2.405164, 1, 0.1921569, 0, 1,
-1.802092, -0.7798849, -2.640903, 1, 0.1960784, 0, 1,
-1.795484, -0.2543065, -1.241218, 1, 0.2039216, 0, 1,
-1.79005, -0.8500704, -2.873045, 1, 0.2117647, 0, 1,
-1.788677, 2.04177, -1.952816, 1, 0.2156863, 0, 1,
-1.774462, -0.8496782, -3.406594, 1, 0.2235294, 0, 1,
-1.76299, 0.2801801, -2.485015, 1, 0.227451, 0, 1,
-1.741592, -1.318222, -1.898637, 1, 0.2352941, 0, 1,
-1.738989, -0.9785904, -0.9821483, 1, 0.2392157, 0, 1,
-1.736046, -0.7255375, -1.549045, 1, 0.2470588, 0, 1,
-1.731722, 1.476436, -1.606209, 1, 0.2509804, 0, 1,
-1.725259, -0.2848395, -2.168821, 1, 0.2588235, 0, 1,
-1.712963, 1.205714, -1.842975, 1, 0.2627451, 0, 1,
-1.71129, 2.024229, -2.923579, 1, 0.2705882, 0, 1,
-1.703142, 0.952542, -1.746247, 1, 0.2745098, 0, 1,
-1.69281, 0.07033405, -1.214479, 1, 0.282353, 0, 1,
-1.68367, -2.039006, -3.846847, 1, 0.2862745, 0, 1,
-1.679063, -1.175949, -2.59423, 1, 0.2941177, 0, 1,
-1.674762, -0.7500649, -1.803583, 1, 0.3019608, 0, 1,
-1.669543, 1.627918, -0.1578016, 1, 0.3058824, 0, 1,
-1.659839, 0.7705783, -0.8918096, 1, 0.3137255, 0, 1,
-1.655247, 2.053779, -1.877797, 1, 0.3176471, 0, 1,
-1.65377, -1.010073, -3.245249, 1, 0.3254902, 0, 1,
-1.645487, 0.0337417, -1.442843, 1, 0.3294118, 0, 1,
-1.634878, 0.7984347, 0.2118979, 1, 0.3372549, 0, 1,
-1.61289, -0.4144759, -0.8980005, 1, 0.3411765, 0, 1,
-1.600068, -0.7029296, -1.628938, 1, 0.3490196, 0, 1,
-1.598477, -0.5165955, -1.721823, 1, 0.3529412, 0, 1,
-1.59586, -1.452241, -1.192661, 1, 0.3607843, 0, 1,
-1.590545, 0.3822977, -2.295727, 1, 0.3647059, 0, 1,
-1.590225, -0.8981137, -2.202892, 1, 0.372549, 0, 1,
-1.586713, 0.6912436, -0.7441788, 1, 0.3764706, 0, 1,
-1.580226, -1.551836, -3.153864, 1, 0.3843137, 0, 1,
-1.575831, 0.448548, -3.712415, 1, 0.3882353, 0, 1,
-1.575781, -2.562217, -2.031501, 1, 0.3960784, 0, 1,
-1.5626, 0.3905408, -0.8404053, 1, 0.4039216, 0, 1,
-1.550159, 0.369667, 0.483344, 1, 0.4078431, 0, 1,
-1.533171, -0.6660311, -1.8442, 1, 0.4156863, 0, 1,
-1.513147, 0.6747431, -0.02949687, 1, 0.4196078, 0, 1,
-1.50296, 1.158607, -1.036499, 1, 0.427451, 0, 1,
-1.498101, 1.441329, -0.2170728, 1, 0.4313726, 0, 1,
-1.494228, -0.2764945, -1.91883, 1, 0.4392157, 0, 1,
-1.493639, -0.211908, -1.844446, 1, 0.4431373, 0, 1,
-1.492239, -0.7869778, -1.754422, 1, 0.4509804, 0, 1,
-1.477694, -0.4101721, -2.708668, 1, 0.454902, 0, 1,
-1.474088, -2.088508, -1.2143, 1, 0.4627451, 0, 1,
-1.465034, -1.79586, -2.979176, 1, 0.4666667, 0, 1,
-1.457228, 1.616373, -0.6013054, 1, 0.4745098, 0, 1,
-1.455603, 0.04818652, -2.075737, 1, 0.4784314, 0, 1,
-1.454243, -0.7797348, -3.215523, 1, 0.4862745, 0, 1,
-1.451327, -0.3944183, -3.275806, 1, 0.4901961, 0, 1,
-1.444186, -0.006799025, -1.181033, 1, 0.4980392, 0, 1,
-1.44278, -0.06383552, 0.4317242, 1, 0.5058824, 0, 1,
-1.433589, 0.8986785, -0.8380986, 1, 0.509804, 0, 1,
-1.432683, -1.337207, -2.099364, 1, 0.5176471, 0, 1,
-1.43229, -0.1271113, -1.772755, 1, 0.5215687, 0, 1,
-1.43218, 1.052485, -2.603713, 1, 0.5294118, 0, 1,
-1.424672, 0.8105639, 0.7334769, 1, 0.5333334, 0, 1,
-1.41515, -1.44884, -1.703096, 1, 0.5411765, 0, 1,
-1.412549, -0.1783121, 0.4763448, 1, 0.5450981, 0, 1,
-1.406129, 1.051943, 0.6886008, 1, 0.5529412, 0, 1,
-1.384871, 1.536115, -1.296389, 1, 0.5568628, 0, 1,
-1.378096, -1.307424, -2.064554, 1, 0.5647059, 0, 1,
-1.377158, -0.2222456, -0.9626405, 1, 0.5686275, 0, 1,
-1.376307, 1.256263, 0.1754778, 1, 0.5764706, 0, 1,
-1.368666, 0.3817542, -1.321401, 1, 0.5803922, 0, 1,
-1.363363, 1.711033, -2.228304, 1, 0.5882353, 0, 1,
-1.361406, -0.3924578, -1.85574, 1, 0.5921569, 0, 1,
-1.358673, -0.5800967, -3.193516, 1, 0.6, 0, 1,
-1.343642, 0.3941028, -1.756904, 1, 0.6078432, 0, 1,
-1.342317, 0.4394072, -1.503893, 1, 0.6117647, 0, 1,
-1.342174, 0.8973246, 0.1883085, 1, 0.6196079, 0, 1,
-1.34025, -0.09444766, 0.02674417, 1, 0.6235294, 0, 1,
-1.338079, 1.193233, -0.5573692, 1, 0.6313726, 0, 1,
-1.330164, -0.6357872, -3.390513, 1, 0.6352941, 0, 1,
-1.325233, -1.964831, -1.916703, 1, 0.6431373, 0, 1,
-1.308742, 0.285565, -1.373964, 1, 0.6470588, 0, 1,
-1.306802, -2.055744, -3.698074, 1, 0.654902, 0, 1,
-1.299147, -1.866878, -3.23315, 1, 0.6588235, 0, 1,
-1.293633, 0.7120694, -1.618305, 1, 0.6666667, 0, 1,
-1.289448, -0.4699932, -0.4417236, 1, 0.6705883, 0, 1,
-1.28844, 0.4202853, -2.105123, 1, 0.6784314, 0, 1,
-1.287764, 0.497471, -2.080661, 1, 0.682353, 0, 1,
-1.284143, -0.2955559, -3.43439, 1, 0.6901961, 0, 1,
-1.281953, 2.094934, -1.376428, 1, 0.6941177, 0, 1,
-1.278154, 0.05032171, -2.756856, 1, 0.7019608, 0, 1,
-1.274571, 0.358205, -0.6251912, 1, 0.7098039, 0, 1,
-1.268805, -0.289435, -1.012364, 1, 0.7137255, 0, 1,
-1.250475, -0.2005322, -2.13817, 1, 0.7215686, 0, 1,
-1.248567, -1.135848, -2.821868, 1, 0.7254902, 0, 1,
-1.237771, -0.7403667, -2.680439, 1, 0.7333333, 0, 1,
-1.232013, -1.14274, -3.644131, 1, 0.7372549, 0, 1,
-1.224684, 0.5759025, -0.7118642, 1, 0.7450981, 0, 1,
-1.209418, 1.64431, -1.47577, 1, 0.7490196, 0, 1,
-1.204898, 0.9522492, -1.656205, 1, 0.7568628, 0, 1,
-1.201023, 1.399023, 0.4234569, 1, 0.7607843, 0, 1,
-1.192473, 0.01214606, -0.8333653, 1, 0.7686275, 0, 1,
-1.184847, -0.5366114, -3.674426, 1, 0.772549, 0, 1,
-1.179922, -0.2541409, -2.37249, 1, 0.7803922, 0, 1,
-1.178923, 1.353252, -0.8320418, 1, 0.7843137, 0, 1,
-1.176029, 0.4681513, -0.09244207, 1, 0.7921569, 0, 1,
-1.171494, 1.503739, -1.895598, 1, 0.7960784, 0, 1,
-1.16617, -0.3928716, -2.959983, 1, 0.8039216, 0, 1,
-1.164913, -0.2095539, -0.8219434, 1, 0.8117647, 0, 1,
-1.155003, 0.3991047, -0.6772399, 1, 0.8156863, 0, 1,
-1.154976, -0.773515, -2.089078, 1, 0.8235294, 0, 1,
-1.153969, 0.9828765, -0.8709387, 1, 0.827451, 0, 1,
-1.153398, 0.1555674, -2.122257, 1, 0.8352941, 0, 1,
-1.151211, 0.1804675, -1.267872, 1, 0.8392157, 0, 1,
-1.148696, -1.096768, -1.733345, 1, 0.8470588, 0, 1,
-1.148677, -0.3721001, -1.696925, 1, 0.8509804, 0, 1,
-1.139425, -0.3409463, -1.822193, 1, 0.8588235, 0, 1,
-1.132139, 1.479368, 0.01106984, 1, 0.8627451, 0, 1,
-1.131884, 1.565683, -1.624548, 1, 0.8705882, 0, 1,
-1.128363, -0.7654258, -1.181847, 1, 0.8745098, 0, 1,
-1.12696, -0.1604875, -0.9776062, 1, 0.8823529, 0, 1,
-1.122491, 0.012936, -1.241871, 1, 0.8862745, 0, 1,
-1.114419, -0.5038733, -3.15987, 1, 0.8941177, 0, 1,
-1.104591, -1.47269, -1.983394, 1, 0.8980392, 0, 1,
-1.080909, 0.5395989, -2.363629, 1, 0.9058824, 0, 1,
-1.075981, -0.9994598, -1.691373, 1, 0.9137255, 0, 1,
-1.074586, -0.6481054, -1.278355, 1, 0.9176471, 0, 1,
-1.072151, -0.1554456, -1.380753, 1, 0.9254902, 0, 1,
-1.065836, 0.2760103, -2.710768, 1, 0.9294118, 0, 1,
-1.063452, -1.087958, -0.337283, 1, 0.9372549, 0, 1,
-1.054709, 0.1876673, -2.143404, 1, 0.9411765, 0, 1,
-1.054398, 0.7040126, -1.476625, 1, 0.9490196, 0, 1,
-1.05251, -0.6945285, -0.5704048, 1, 0.9529412, 0, 1,
-1.052163, -0.8886974, -2.029825, 1, 0.9607843, 0, 1,
-1.051893, 1.213501, -0.4168611, 1, 0.9647059, 0, 1,
-1.039645, -0.618099, -2.43127, 1, 0.972549, 0, 1,
-1.037139, -0.9945837, -1.460225, 1, 0.9764706, 0, 1,
-1.0236, -0.02011701, -2.132631, 1, 0.9843137, 0, 1,
-1.011731, -0.1213717, -3.112663, 1, 0.9882353, 0, 1,
-1.010619, -0.3981701, -2.031405, 1, 0.9960784, 0, 1,
-0.9982302, 1.293091, -1.424176, 0.9960784, 1, 0, 1,
-0.998136, -0.02952724, -3.068592, 0.9921569, 1, 0, 1,
-0.9957181, 1.233039, -1.039991, 0.9843137, 1, 0, 1,
-0.9913461, -1.22564, -3.594066, 0.9803922, 1, 0, 1,
-0.9872835, -1.790886, -0.007175354, 0.972549, 1, 0, 1,
-0.9750037, 0.4372286, -0.7992008, 0.9686275, 1, 0, 1,
-0.9736611, 1.206118, -2.544654, 0.9607843, 1, 0, 1,
-0.9720682, 0.7080426, -0.3359002, 0.9568627, 1, 0, 1,
-0.9313622, -0.3540625, -3.411579, 0.9490196, 1, 0, 1,
-0.9165769, -0.6553556, -2.341703, 0.945098, 1, 0, 1,
-0.9154011, -0.5578597, -2.06308, 0.9372549, 1, 0, 1,
-0.9135147, -0.1695211, -2.123854, 0.9333333, 1, 0, 1,
-0.9114141, 0.2704015, -1.441339, 0.9254902, 1, 0, 1,
-0.9111081, 0.8298993, -0.7436824, 0.9215686, 1, 0, 1,
-0.9106513, -0.2229028, -0.8601438, 0.9137255, 1, 0, 1,
-0.9015323, 2.029083, 0.3871365, 0.9098039, 1, 0, 1,
-0.896418, 1.554585, 0.3016886, 0.9019608, 1, 0, 1,
-0.8924842, 0.4262349, -0.7991687, 0.8941177, 1, 0, 1,
-0.8913625, -1.619748, -3.432489, 0.8901961, 1, 0, 1,
-0.8896568, -0.4200132, -1.769654, 0.8823529, 1, 0, 1,
-0.8895084, -0.4642169, -2.095335, 0.8784314, 1, 0, 1,
-0.8861035, -0.3920807, -0.9720254, 0.8705882, 1, 0, 1,
-0.8854782, 0.02699543, -1.443331, 0.8666667, 1, 0, 1,
-0.8788902, -0.09808115, -1.195336, 0.8588235, 1, 0, 1,
-0.8781161, 1.230233, -1.720479, 0.854902, 1, 0, 1,
-0.878018, 1.115571, 0.2204297, 0.8470588, 1, 0, 1,
-0.8772014, 2.53215, 0.3173412, 0.8431373, 1, 0, 1,
-0.8760791, -0.402119, -2.79178, 0.8352941, 1, 0, 1,
-0.8718648, -1.016709, -3.499532, 0.8313726, 1, 0, 1,
-0.8710973, -1.099211, -3.808505, 0.8235294, 1, 0, 1,
-0.8586407, 1.337599, 0.4797936, 0.8196079, 1, 0, 1,
-0.8482867, 0.7839579, -2.2988, 0.8117647, 1, 0, 1,
-0.8467237, -0.1571181, -1.40388, 0.8078431, 1, 0, 1,
-0.8463227, 1.920251, -0.4498488, 0.8, 1, 0, 1,
-0.845662, -0.2699071, -2.306827, 0.7921569, 1, 0, 1,
-0.8428009, 0.1391845, -1.711361, 0.7882353, 1, 0, 1,
-0.841491, 0.484595, -1.60123, 0.7803922, 1, 0, 1,
-0.8406922, -0.2583006, -1.383706, 0.7764706, 1, 0, 1,
-0.8391848, -0.2881268, -2.480311, 0.7686275, 1, 0, 1,
-0.838511, -0.1284415, -1.658097, 0.7647059, 1, 0, 1,
-0.8379447, 1.37601, 1.180234, 0.7568628, 1, 0, 1,
-0.8336572, -1.588852, -3.740966, 0.7529412, 1, 0, 1,
-0.8310285, 0.04026363, -1.185783, 0.7450981, 1, 0, 1,
-0.8283877, -2.213344, -2.101353, 0.7411765, 1, 0, 1,
-0.8273709, -3.147668, -3.016032, 0.7333333, 1, 0, 1,
-0.8243128, -0.0899536, -1.625626, 0.7294118, 1, 0, 1,
-0.8241525, 1.494598, -2.589129, 0.7215686, 1, 0, 1,
-0.8218353, -1.062919, -2.653548, 0.7176471, 1, 0, 1,
-0.812411, -0.4494147, -1.273648, 0.7098039, 1, 0, 1,
-0.8068051, 1.230537, -0.4981613, 0.7058824, 1, 0, 1,
-0.8061267, 0.3591421, -0.7305565, 0.6980392, 1, 0, 1,
-0.8016914, 0.376249, -1.923241, 0.6901961, 1, 0, 1,
-0.8009005, -0.8365666, -0.8000057, 0.6862745, 1, 0, 1,
-0.7996771, 0.651989, 1.109756, 0.6784314, 1, 0, 1,
-0.7991445, -0.1762228, -3.839549, 0.6745098, 1, 0, 1,
-0.7963176, 0.4130311, -1.04868, 0.6666667, 1, 0, 1,
-0.796125, -1.005308, -2.339502, 0.6627451, 1, 0, 1,
-0.7955239, -0.974902, -4.003521, 0.654902, 1, 0, 1,
-0.7949752, -0.7028134, -2.248783, 0.6509804, 1, 0, 1,
-0.7895654, -0.2046663, 0.04732518, 0.6431373, 1, 0, 1,
-0.789399, 0.6831266, -1.930884, 0.6392157, 1, 0, 1,
-0.7840362, 0.6067575, -1.070482, 0.6313726, 1, 0, 1,
-0.7815986, 1.591528, -0.9095871, 0.627451, 1, 0, 1,
-0.7770925, -1.030261, -4.091499, 0.6196079, 1, 0, 1,
-0.7761494, -0.5854169, -1.613848, 0.6156863, 1, 0, 1,
-0.775629, -0.3406538, -3.512837, 0.6078432, 1, 0, 1,
-0.7687112, -0.9476811, -0.5247146, 0.6039216, 1, 0, 1,
-0.7657475, 0.7948351, -0.7672547, 0.5960785, 1, 0, 1,
-0.7554966, 0.3620403, -1.377419, 0.5882353, 1, 0, 1,
-0.7357058, 1.54447, 0.6948015, 0.5843138, 1, 0, 1,
-0.7324417, 1.901601, 0.3448847, 0.5764706, 1, 0, 1,
-0.724387, -0.1349442, -0.9022608, 0.572549, 1, 0, 1,
-0.7210802, 0.9615219, -0.9090564, 0.5647059, 1, 0, 1,
-0.7154047, 0.8999937, -0.9026359, 0.5607843, 1, 0, 1,
-0.7115208, -0.9169618, -2.6314, 0.5529412, 1, 0, 1,
-0.7104697, 0.2584808, -2.471631, 0.5490196, 1, 0, 1,
-0.7099791, -1.618805, -2.626515, 0.5411765, 1, 0, 1,
-0.7040485, -3.001806, -4.443385, 0.5372549, 1, 0, 1,
-0.7031674, -0.06383359, -0.08152451, 0.5294118, 1, 0, 1,
-0.6968029, 0.1404101, 0.2419886, 0.5254902, 1, 0, 1,
-0.6958168, -1.548719, -3.855314, 0.5176471, 1, 0, 1,
-0.695536, 1.931095, 0.2573099, 0.5137255, 1, 0, 1,
-0.6951728, -1.44407, -2.556398, 0.5058824, 1, 0, 1,
-0.6906332, -0.7681139, -1.882836, 0.5019608, 1, 0, 1,
-0.6897001, -0.4947996, -2.133616, 0.4941176, 1, 0, 1,
-0.684601, 0.558072, -1.392264, 0.4862745, 1, 0, 1,
-0.6838023, 0.6332766, -1.028764, 0.4823529, 1, 0, 1,
-0.6832573, 1.040933, -0.3427048, 0.4745098, 1, 0, 1,
-0.6761282, -1.018831, -2.425956, 0.4705882, 1, 0, 1,
-0.674983, 0.2921371, -3.740716, 0.4627451, 1, 0, 1,
-0.672884, -0.9653903, -1.249552, 0.4588235, 1, 0, 1,
-0.6671447, 0.2019497, -0.1794184, 0.4509804, 1, 0, 1,
-0.6635487, 0.3134315, -0.5178812, 0.4470588, 1, 0, 1,
-0.6607717, -0.1704905, -2.708283, 0.4392157, 1, 0, 1,
-0.6536966, -0.5919601, -2.97136, 0.4352941, 1, 0, 1,
-0.6529856, 0.5817707, 0.1818911, 0.427451, 1, 0, 1,
-0.6486379, -1.158246, -1.009364, 0.4235294, 1, 0, 1,
-0.6435962, -0.3506048, -2.376971, 0.4156863, 1, 0, 1,
-0.640655, 0.09305322, -2.682294, 0.4117647, 1, 0, 1,
-0.6379637, 0.6097381, -0.8223817, 0.4039216, 1, 0, 1,
-0.6324958, 0.2105831, -1.135107, 0.3960784, 1, 0, 1,
-0.6317773, 0.3304823, -1.501001, 0.3921569, 1, 0, 1,
-0.6257761, 0.5408403, -1.914183, 0.3843137, 1, 0, 1,
-0.6237029, 0.3852611, -1.660728, 0.3803922, 1, 0, 1,
-0.6161571, -0.5328662, -1.878085, 0.372549, 1, 0, 1,
-0.6161528, -0.5636361, -2.344972, 0.3686275, 1, 0, 1,
-0.6160011, -0.2544129, -1.202916, 0.3607843, 1, 0, 1,
-0.6148008, 1.018554, -0.4448426, 0.3568628, 1, 0, 1,
-0.6142446, 0.1814241, -0.8216706, 0.3490196, 1, 0, 1,
-0.6061619, 0.5733112, -0.5912399, 0.345098, 1, 0, 1,
-0.6036075, 0.2261599, -1.222905, 0.3372549, 1, 0, 1,
-0.6023746, 0.2211486, -1.979414, 0.3333333, 1, 0, 1,
-0.5960186, -1.265898, -2.148828, 0.3254902, 1, 0, 1,
-0.5914771, -0.9741368, -3.633397, 0.3215686, 1, 0, 1,
-0.5889349, 1.944754, 1.126383, 0.3137255, 1, 0, 1,
-0.5858263, 0.06588808, 0.01239274, 0.3098039, 1, 0, 1,
-0.5848849, -1.037633, -3.493299, 0.3019608, 1, 0, 1,
-0.5800859, -0.8387204, -3.416174, 0.2941177, 1, 0, 1,
-0.5799244, -1.177946, -2.092362, 0.2901961, 1, 0, 1,
-0.5788697, 0.4296908, -0.3715549, 0.282353, 1, 0, 1,
-0.578457, -1.493715, -3.552485, 0.2784314, 1, 0, 1,
-0.5671673, 0.1457145, -1.729528, 0.2705882, 1, 0, 1,
-0.5657148, 0.2218686, -1.410877, 0.2666667, 1, 0, 1,
-0.5617863, -0.7069972, -1.444222, 0.2588235, 1, 0, 1,
-0.5613053, -0.1057333, -1.204652, 0.254902, 1, 0, 1,
-0.5602982, -0.5197263, -0.879758, 0.2470588, 1, 0, 1,
-0.5581518, -0.08609397, -1.57322, 0.2431373, 1, 0, 1,
-0.5537394, 0.3025578, -0.04039363, 0.2352941, 1, 0, 1,
-0.5480179, -0.7534753, -1.425352, 0.2313726, 1, 0, 1,
-0.547489, 0.1021636, -1.632733, 0.2235294, 1, 0, 1,
-0.5426418, 0.1952399, -1.044638, 0.2196078, 1, 0, 1,
-0.541026, -1.919721, -3.029647, 0.2117647, 1, 0, 1,
-0.5400195, 0.3864619, -1.666971, 0.2078431, 1, 0, 1,
-0.5391085, -0.02050026, -2.884417, 0.2, 1, 0, 1,
-0.5293059, 0.3993084, 0.1522523, 0.1921569, 1, 0, 1,
-0.5237372, -1.84628, -2.788569, 0.1882353, 1, 0, 1,
-0.5229604, -0.48518, -2.538802, 0.1803922, 1, 0, 1,
-0.5213957, -1.419371, -3.063468, 0.1764706, 1, 0, 1,
-0.5132612, -0.414884, -2.407541, 0.1686275, 1, 0, 1,
-0.506205, -1.148126, -2.874725, 0.1647059, 1, 0, 1,
-0.5037526, -1.153748, -2.105212, 0.1568628, 1, 0, 1,
-0.4995653, -0.01405306, -0.6404963, 0.1529412, 1, 0, 1,
-0.4974698, 0.307114, -1.473164, 0.145098, 1, 0, 1,
-0.496159, 0.01661845, -1.627964, 0.1411765, 1, 0, 1,
-0.487128, 1.963258, -0.5973716, 0.1333333, 1, 0, 1,
-0.4826843, -0.1318508, -0.3079793, 0.1294118, 1, 0, 1,
-0.4795967, 1.228543, -0.2047622, 0.1215686, 1, 0, 1,
-0.4785347, -0.7095429, -3.07057, 0.1176471, 1, 0, 1,
-0.4726118, 0.1464078, -1.463189, 0.1098039, 1, 0, 1,
-0.4720456, 0.1696714, -1.240479, 0.1058824, 1, 0, 1,
-0.4712667, 0.03052131, -2.056691, 0.09803922, 1, 0, 1,
-0.470372, 0.2863773, 1.657377, 0.09019608, 1, 0, 1,
-0.4694771, -0.1528212, -4.204401, 0.08627451, 1, 0, 1,
-0.4671596, -1.187478, -3.00198, 0.07843138, 1, 0, 1,
-0.465194, -1.367826, -5.156281, 0.07450981, 1, 0, 1,
-0.4635112, 0.2244904, -0.6215891, 0.06666667, 1, 0, 1,
-0.4613859, 0.4692239, -2.143404, 0.0627451, 1, 0, 1,
-0.453044, 0.005461539, -3.391097, 0.05490196, 1, 0, 1,
-0.4526916, -0.1691456, -2.068521, 0.05098039, 1, 0, 1,
-0.4518837, 0.002062988, -1.088677, 0.04313726, 1, 0, 1,
-0.4502573, 2.946706, -0.002308128, 0.03921569, 1, 0, 1,
-0.4437984, 0.9090095, -1.246655, 0.03137255, 1, 0, 1,
-0.4431909, 0.08598661, 0.1855032, 0.02745098, 1, 0, 1,
-0.4408514, 0.8794159, 1.671543, 0.01960784, 1, 0, 1,
-0.4375221, -0.3946966, -1.317882, 0.01568628, 1, 0, 1,
-0.4370103, 0.9942816, -0.3718712, 0.007843138, 1, 0, 1,
-0.4351625, 0.1080974, -1.287542, 0.003921569, 1, 0, 1,
-0.4344876, 0.2011189, -1.950709, 0, 1, 0.003921569, 1,
-0.4342501, -1.03625, -2.544781, 0, 1, 0.01176471, 1,
-0.4322921, 0.6231596, -0.152355, 0, 1, 0.01568628, 1,
-0.4319426, -0.3023815, -3.795505, 0, 1, 0.02352941, 1,
-0.4281349, 0.3504561, -0.9082017, 0, 1, 0.02745098, 1,
-0.427726, 1.116457, -0.9733484, 0, 1, 0.03529412, 1,
-0.4233111, -0.3507721, -1.460003, 0, 1, 0.03921569, 1,
-0.4219077, -0.5156805, -3.337928, 0, 1, 0.04705882, 1,
-0.421027, -1.20813, -3.134875, 0, 1, 0.05098039, 1,
-0.4170127, -0.5911151, -3.250486, 0, 1, 0.05882353, 1,
-0.412943, -0.6739101, -1.226649, 0, 1, 0.0627451, 1,
-0.4128441, 1.534512, -0.5868034, 0, 1, 0.07058824, 1,
-0.4013841, 0.9772937, -0.08515217, 0, 1, 0.07450981, 1,
-0.3996627, 1.451717, -0.1374753, 0, 1, 0.08235294, 1,
-0.3980915, -0.3614601, -2.222981, 0, 1, 0.08627451, 1,
-0.396065, 2.218511, 0.6056518, 0, 1, 0.09411765, 1,
-0.3942572, -1.058218, -4.308939, 0, 1, 0.1019608, 1,
-0.391383, -0.7033225, -2.407181, 0, 1, 0.1058824, 1,
-0.3892488, -2.146005, -3.767216, 0, 1, 0.1137255, 1,
-0.3889434, 2.14188, -0.999043, 0, 1, 0.1176471, 1,
-0.3858057, 0.4387569, -0.3069254, 0, 1, 0.1254902, 1,
-0.3854031, 0.4890833, -1.276389, 0, 1, 0.1294118, 1,
-0.3845516, 2.342233, -0.03796067, 0, 1, 0.1372549, 1,
-0.3787222, -0.4083945, -1.805827, 0, 1, 0.1411765, 1,
-0.3784064, 0.6139677, -0.4480276, 0, 1, 0.1490196, 1,
-0.3778594, -1.037806, -3.390646, 0, 1, 0.1529412, 1,
-0.372886, 0.8142834, 0.4684856, 0, 1, 0.1607843, 1,
-0.3704971, 0.1136596, -0.8956921, 0, 1, 0.1647059, 1,
-0.3679335, 0.645904, -1.571619, 0, 1, 0.172549, 1,
-0.3673013, -0.553339, -3.618379, 0, 1, 0.1764706, 1,
-0.3566685, 1.052286, -2.400807, 0, 1, 0.1843137, 1,
-0.3500849, -0.7411832, -1.696944, 0, 1, 0.1882353, 1,
-0.3482378, 2.111808, 0.352957, 0, 1, 0.1960784, 1,
-0.3479196, -0.9409454, -2.220763, 0, 1, 0.2039216, 1,
-0.3434571, -0.6110257, -2.61724, 0, 1, 0.2078431, 1,
-0.3427179, 0.09613135, -0.1269179, 0, 1, 0.2156863, 1,
-0.3385151, 0.9848306, 1.63117, 0, 1, 0.2196078, 1,
-0.3356226, -0.9256757, -2.241391, 0, 1, 0.227451, 1,
-0.3346638, -0.4852559, -2.588899, 0, 1, 0.2313726, 1,
-0.3301175, -0.6491615, -3.23075, 0, 1, 0.2392157, 1,
-0.3299136, 0.9178568, 0.5856672, 0, 1, 0.2431373, 1,
-0.3299021, -0.8337891, -3.062145, 0, 1, 0.2509804, 1,
-0.3274529, -0.3352496, -2.696553, 0, 1, 0.254902, 1,
-0.3157823, -1.967837, -2.672598, 0, 1, 0.2627451, 1,
-0.314804, -1.343809, -3.699046, 0, 1, 0.2666667, 1,
-0.3144148, -1.455266, -1.963268, 0, 1, 0.2745098, 1,
-0.3097675, 0.2341312, -0.8887368, 0, 1, 0.2784314, 1,
-0.3074927, 1.804314, -1.136917, 0, 1, 0.2862745, 1,
-0.3068786, 1.300293, 0.15412, 0, 1, 0.2901961, 1,
-0.3013369, -0.5188916, -1.759466, 0, 1, 0.2980392, 1,
-0.298656, 0.3965874, -1.282899, 0, 1, 0.3058824, 1,
-0.2985567, -0.3877836, -2.621953, 0, 1, 0.3098039, 1,
-0.2957846, 0.8009772, 1.034271, 0, 1, 0.3176471, 1,
-0.2882693, 0.09870051, -0.6360312, 0, 1, 0.3215686, 1,
-0.2851838, -0.6695347, -4.163202, 0, 1, 0.3294118, 1,
-0.2828165, 1.010838, 0.9974889, 0, 1, 0.3333333, 1,
-0.2806607, 0.5807458, -1.921818, 0, 1, 0.3411765, 1,
-0.2799016, -0.9216835, -2.288361, 0, 1, 0.345098, 1,
-0.2730126, 0.8772883, 0.3293511, 0, 1, 0.3529412, 1,
-0.2692188, 2.25062, 1.196991, 0, 1, 0.3568628, 1,
-0.2652243, -1.214021, -2.189718, 0, 1, 0.3647059, 1,
-0.2611023, 0.7969227, 0.02837898, 0, 1, 0.3686275, 1,
-0.2595528, -0.04804307, -1.724542, 0, 1, 0.3764706, 1,
-0.251981, 0.1857519, -1.252582, 0, 1, 0.3803922, 1,
-0.2517909, 1.944861, 0.1403206, 0, 1, 0.3882353, 1,
-0.2497114, -1.419474, -1.329019, 0, 1, 0.3921569, 1,
-0.2496756, 0.103801, -0.9650975, 0, 1, 0.4, 1,
-0.2473412, 0.005916368, -0.9068447, 0, 1, 0.4078431, 1,
-0.2429709, -1.673664, -2.727647, 0, 1, 0.4117647, 1,
-0.2400739, -0.7658283, -2.369926, 0, 1, 0.4196078, 1,
-0.2391408, -1.03683, -2.981945, 0, 1, 0.4235294, 1,
-0.2371238, -0.1794735, -2.26076, 0, 1, 0.4313726, 1,
-0.2301781, -0.668244, -3.948895, 0, 1, 0.4352941, 1,
-0.2290929, 2.452606, -0.2795356, 0, 1, 0.4431373, 1,
-0.2275454, 0.8175138, -0.592312, 0, 1, 0.4470588, 1,
-0.2251537, -0.2629268, -3.748435, 0, 1, 0.454902, 1,
-0.2199971, 0.4574852, -0.7825744, 0, 1, 0.4588235, 1,
-0.2182793, -0.6771635, -2.801739, 0, 1, 0.4666667, 1,
-0.216068, -0.4150864, -3.019835, 0, 1, 0.4705882, 1,
-0.2149477, -0.2589899, -3.083956, 0, 1, 0.4784314, 1,
-0.2148545, 0.3889238, 0.4914111, 0, 1, 0.4823529, 1,
-0.2140909, -0.01801996, -2.625096, 0, 1, 0.4901961, 1,
-0.2105519, -0.294557, -2.363236, 0, 1, 0.4941176, 1,
-0.2051904, -0.8588615, -3.481937, 0, 1, 0.5019608, 1,
-0.2051422, -1.022316, -2.145828, 0, 1, 0.509804, 1,
-0.2044225, 0.7812669, 0.7414683, 0, 1, 0.5137255, 1,
-0.201263, 0.008977408, -0.6134922, 0, 1, 0.5215687, 1,
-0.2003719, -0.3558786, -3.34894, 0, 1, 0.5254902, 1,
-0.2000609, 0.1894927, -1.857608, 0, 1, 0.5333334, 1,
-0.1991227, 0.6909622, 0.6887234, 0, 1, 0.5372549, 1,
-0.1989407, 0.6875554, -1.093785, 0, 1, 0.5450981, 1,
-0.1968715, -1.847293, -3.895597, 0, 1, 0.5490196, 1,
-0.19602, 0.1900541, -0.151155, 0, 1, 0.5568628, 1,
-0.18958, 1.369756, 0.2278701, 0, 1, 0.5607843, 1,
-0.187789, 2.264391, -0.9181785, 0, 1, 0.5686275, 1,
-0.187079, 2.120895, 0.3157474, 0, 1, 0.572549, 1,
-0.1870696, -1.006278, -2.935745, 0, 1, 0.5803922, 1,
-0.1832281, -0.5348285, -2.616007, 0, 1, 0.5843138, 1,
-0.1820571, 0.4305353, 0.631578, 0, 1, 0.5921569, 1,
-0.181927, 2.570894, 2.209509, 0, 1, 0.5960785, 1,
-0.1809929, -1.13416, -4.928177, 0, 1, 0.6039216, 1,
-0.1804206, -0.1924561, -1.51191, 0, 1, 0.6117647, 1,
-0.1738313, -0.8726619, -5.616408, 0, 1, 0.6156863, 1,
-0.1707183, 0.4233472, -1.432487, 0, 1, 0.6235294, 1,
-0.1696112, 1.54138, 0.1880895, 0, 1, 0.627451, 1,
-0.1680048, 0.02364702, -1.179025, 0, 1, 0.6352941, 1,
-0.1667653, 0.1715725, 0.134379, 0, 1, 0.6392157, 1,
-0.1664438, -0.3214344, -1.70584, 0, 1, 0.6470588, 1,
-0.163282, -0.5110061, -2.002533, 0, 1, 0.6509804, 1,
-0.1622079, 0.3959342, 0.001130445, 0, 1, 0.6588235, 1,
-0.1616624, -0.3022878, -2.939491, 0, 1, 0.6627451, 1,
-0.1607408, 0.7740558, 0.03751235, 0, 1, 0.6705883, 1,
-0.1579866, 1.156339, 0.580097, 0, 1, 0.6745098, 1,
-0.1578202, 0.9481388, -0.1802612, 0, 1, 0.682353, 1,
-0.152642, -1.124689, -4.400532, 0, 1, 0.6862745, 1,
-0.1522333, -1.996584, -3.281085, 0, 1, 0.6941177, 1,
-0.1521688, -0.3983396, -2.775686, 0, 1, 0.7019608, 1,
-0.1520115, -1.070055, -3.065448, 0, 1, 0.7058824, 1,
-0.1514215, 0.2757598, -1.036615, 0, 1, 0.7137255, 1,
-0.1465876, 0.698669, 0.4644089, 0, 1, 0.7176471, 1,
-0.1465639, -0.06374469, -2.248595, 0, 1, 0.7254902, 1,
-0.1422906, 0.08756468, -1.681369, 0, 1, 0.7294118, 1,
-0.1390755, -0.2107479, -3.383139, 0, 1, 0.7372549, 1,
-0.134296, -0.2187131, -1.327861, 0, 1, 0.7411765, 1,
-0.1341346, 0.666918, 1.162978, 0, 1, 0.7490196, 1,
-0.1319655, -0.4545466, -2.525684, 0, 1, 0.7529412, 1,
-0.1298375, 0.04832242, -0.6066641, 0, 1, 0.7607843, 1,
-0.1289972, 1.006942, -0.5834998, 0, 1, 0.7647059, 1,
-0.1277814, -0.9613526, -3.109092, 0, 1, 0.772549, 1,
-0.1267512, 0.5535387, 0.6853407, 0, 1, 0.7764706, 1,
-0.1267078, -1.209764, -3.233799, 0, 1, 0.7843137, 1,
-0.1237558, -0.03904004, -1.911926, 0, 1, 0.7882353, 1,
-0.1204138, 1.508748, 1.185695, 0, 1, 0.7960784, 1,
-0.1201245, -0.4234325, -3.738139, 0, 1, 0.8039216, 1,
-0.1187787, 1.420885, -1.58517, 0, 1, 0.8078431, 1,
-0.1129084, -0.436121, -1.829467, 0, 1, 0.8156863, 1,
-0.1098743, 0.2248077, -1.10092, 0, 1, 0.8196079, 1,
-0.109454, 0.11622, -0.142309, 0, 1, 0.827451, 1,
-0.107586, 0.7502047, -1.344247, 0, 1, 0.8313726, 1,
-0.1055339, 0.1366683, 1.298973, 0, 1, 0.8392157, 1,
-0.1053453, -1.288177, -4.099588, 0, 1, 0.8431373, 1,
-0.1040638, -0.5400268, -4.330633, 0, 1, 0.8509804, 1,
-0.1034747, -0.31387, -2.389796, 0, 1, 0.854902, 1,
-0.1031481, -1.087795, -2.206158, 0, 1, 0.8627451, 1,
-0.09813063, 1.254053, -0.6577461, 0, 1, 0.8666667, 1,
-0.09785578, 0.652815, -0.3646994, 0, 1, 0.8745098, 1,
-0.09523299, 1.153701, -0.2263795, 0, 1, 0.8784314, 1,
-0.09448178, 0.8329978, 0.2921923, 0, 1, 0.8862745, 1,
-0.09058824, 1.498437, -0.6092848, 0, 1, 0.8901961, 1,
-0.08987103, -1.083052, -2.998411, 0, 1, 0.8980392, 1,
-0.08441176, -0.5923499, -2.982261, 0, 1, 0.9058824, 1,
-0.07927589, -1.112942, -2.448694, 0, 1, 0.9098039, 1,
-0.07521739, 0.7465814, 0.02778149, 0, 1, 0.9176471, 1,
-0.0732832, 1.758623, -0.5297598, 0, 1, 0.9215686, 1,
-0.07261144, -0.02220685, -2.959517, 0, 1, 0.9294118, 1,
-0.06951664, -0.7432585, -2.071885, 0, 1, 0.9333333, 1,
-0.0684765, 0.03977993, -0.4055569, 0, 1, 0.9411765, 1,
-0.06819595, 0.1592251, 0.5115543, 0, 1, 0.945098, 1,
-0.06629542, 0.4692988, 0.07065882, 0, 1, 0.9529412, 1,
-0.06576746, 0.7676341, -0.3776374, 0, 1, 0.9568627, 1,
-0.06304445, 1.733122, -0.4370025, 0, 1, 0.9647059, 1,
-0.04970526, -0.8438029, -4.327542, 0, 1, 0.9686275, 1,
-0.0471761, -1.091846, -3.600801, 0, 1, 0.9764706, 1,
-0.04419656, 1.036955, -1.203344, 0, 1, 0.9803922, 1,
-0.04037641, -0.1302842, -2.761278, 0, 1, 0.9882353, 1,
-0.03937519, 1.62374, -0.05883332, 0, 1, 0.9921569, 1,
-0.03836424, 0.6039798, -1.610714, 0, 1, 1, 1,
-0.03717509, 1.140043, -0.9802529, 0, 0.9921569, 1, 1,
-0.03648083, 0.765484, 0.6744598, 0, 0.9882353, 1, 1,
-0.03499997, -1.405738, -4.145135, 0, 0.9803922, 1, 1,
-0.03492942, 0.1465682, 0.1294184, 0, 0.9764706, 1, 1,
-0.03492805, 0.43547, 0.5937344, 0, 0.9686275, 1, 1,
-0.03396899, 0.5808137, -0.7159072, 0, 0.9647059, 1, 1,
-0.03253878, -0.3375764, -5.397867, 0, 0.9568627, 1, 1,
-0.03103779, -0.7576072, -4.719261, 0, 0.9529412, 1, 1,
-0.02930344, -0.3370681, -2.15521, 0, 0.945098, 1, 1,
-0.02467041, 1.110267, 1.990268, 0, 0.9411765, 1, 1,
-0.01864255, -0.3982185, -2.746158, 0, 0.9333333, 1, 1,
-0.01646764, 1.706051, -0.771239, 0, 0.9294118, 1, 1,
-0.01527336, 0.9665095, -1.730202, 0, 0.9215686, 1, 1,
-0.01291187, -0.4135712, -4.421584, 0, 0.9176471, 1, 1,
-0.005995497, 0.03235525, -0.5148782, 0, 0.9098039, 1, 1,
-0.004408977, -1.503416, -5.179451, 0, 0.9058824, 1, 1,
-0.001047332, -0.6495601, -4.027998, 0, 0.8980392, 1, 1,
0.004922277, 0.09935519, -0.8430901, 0, 0.8901961, 1, 1,
0.01798492, -0.36796, 2.762996, 0, 0.8862745, 1, 1,
0.02282783, -0.5628052, 4.323835, 0, 0.8784314, 1, 1,
0.02574546, 0.3110861, 2.032798, 0, 0.8745098, 1, 1,
0.03072416, -0.6182137, 2.280518, 0, 0.8666667, 1, 1,
0.0335234, -2.555326, 3.406526, 0, 0.8627451, 1, 1,
0.03635829, 0.6038699, 0.8545629, 0, 0.854902, 1, 1,
0.03752767, 0.2048246, -1.010668, 0, 0.8509804, 1, 1,
0.04323173, -0.7652236, 3.691554, 0, 0.8431373, 1, 1,
0.04366761, -0.5191125, 2.280887, 0, 0.8392157, 1, 1,
0.04473906, 2.055043, -0.1423487, 0, 0.8313726, 1, 1,
0.04982432, 0.8159671, 0.7399557, 0, 0.827451, 1, 1,
0.05003105, 0.4337134, -2.528703, 0, 0.8196079, 1, 1,
0.0501387, -0.4288939, 3.146976, 0, 0.8156863, 1, 1,
0.05058121, 2.590474, 2.363799, 0, 0.8078431, 1, 1,
0.0561693, -0.9620326, 3.777117, 0, 0.8039216, 1, 1,
0.06175987, 1.19328, -0.7236257, 0, 0.7960784, 1, 1,
0.06518137, -1.825922, 3.601707, 0, 0.7882353, 1, 1,
0.0660356, 0.09703311, 1.383694, 0, 0.7843137, 1, 1,
0.067368, 1.046452, -1.450309, 0, 0.7764706, 1, 1,
0.06995367, 0.5354438, 0.309976, 0, 0.772549, 1, 1,
0.07220087, 0.05131691, -0.53779, 0, 0.7647059, 1, 1,
0.07495163, 0.6810475, 1.425945, 0, 0.7607843, 1, 1,
0.0755251, 0.06462599, -0.1641434, 0, 0.7529412, 1, 1,
0.07620353, -0.348935, 2.422377, 0, 0.7490196, 1, 1,
0.07650611, -1.536671, 2.101261, 0, 0.7411765, 1, 1,
0.0772282, -0.2642511, 3.579366, 0, 0.7372549, 1, 1,
0.08211036, 0.5483602, -0.2873538, 0, 0.7294118, 1, 1,
0.08448099, 1.35361, -0.5417057, 0, 0.7254902, 1, 1,
0.08493578, -0.8543085, 2.303635, 0, 0.7176471, 1, 1,
0.08511028, -0.1652489, 3.331482, 0, 0.7137255, 1, 1,
0.09106893, 0.7927251, 0.0860878, 0, 0.7058824, 1, 1,
0.09264005, 0.3587823, 0.1808515, 0, 0.6980392, 1, 1,
0.0932766, -1.811623, 3.089558, 0, 0.6941177, 1, 1,
0.09328035, -1.197655, 3.237579, 0, 0.6862745, 1, 1,
0.09425806, -0.1573808, 3.57388, 0, 0.682353, 1, 1,
0.09792735, -1.234843, 2.751071, 0, 0.6745098, 1, 1,
0.1000122, 0.1870074, 1.67316, 0, 0.6705883, 1, 1,
0.1010999, -0.6631815, 3.568084, 0, 0.6627451, 1, 1,
0.1035915, -0.8905477, 2.57794, 0, 0.6588235, 1, 1,
0.1048652, -1.5548, 4.16075, 0, 0.6509804, 1, 1,
0.1057472, 0.2697892, 0.5853457, 0, 0.6470588, 1, 1,
0.1110739, -1.422085, 4.526733, 0, 0.6392157, 1, 1,
0.1146364, 1.088713, -1.781737, 0, 0.6352941, 1, 1,
0.1206394, -2.174506, 3.177521, 0, 0.627451, 1, 1,
0.1207808, -0.02653644, 0.7443398, 0, 0.6235294, 1, 1,
0.1366349, 1.668225, 1.201294, 0, 0.6156863, 1, 1,
0.1402762, 0.1593247, -0.7352712, 0, 0.6117647, 1, 1,
0.1446525, 0.09770764, 1.33398, 0, 0.6039216, 1, 1,
0.1446695, 0.2100403, -0.9037064, 0, 0.5960785, 1, 1,
0.1505053, -1.25247, 2.769266, 0, 0.5921569, 1, 1,
0.1544767, 0.166021, 1.526128, 0, 0.5843138, 1, 1,
0.1597077, 0.6028621, 1.198523, 0, 0.5803922, 1, 1,
0.1613095, -2.706338, 3.246974, 0, 0.572549, 1, 1,
0.1622811, 0.4847821, 0.4758959, 0, 0.5686275, 1, 1,
0.1627571, -0.6164685, 2.993097, 0, 0.5607843, 1, 1,
0.1636244, -1.351297, 4.01508, 0, 0.5568628, 1, 1,
0.1744666, 0.9173539, -0.4607147, 0, 0.5490196, 1, 1,
0.1761771, -1.169993, 2.917576, 0, 0.5450981, 1, 1,
0.1781896, -0.002606092, 0.3209693, 0, 0.5372549, 1, 1,
0.178816, 0.4554218, 2.081916, 0, 0.5333334, 1, 1,
0.1799831, -0.5225342, 2.711371, 0, 0.5254902, 1, 1,
0.1827482, 0.998267, -0.4088947, 0, 0.5215687, 1, 1,
0.188799, 0.2344664, 0.7233192, 0, 0.5137255, 1, 1,
0.1919493, 1.020328, -0.4730048, 0, 0.509804, 1, 1,
0.1920416, 0.0625038, 0.2160542, 0, 0.5019608, 1, 1,
0.1932053, 0.2391953, -0.7535122, 0, 0.4941176, 1, 1,
0.1934713, 0.7560548, -0.6983546, 0, 0.4901961, 1, 1,
0.1943721, 0.3169482, -0.3777474, 0, 0.4823529, 1, 1,
0.1961693, 0.04324627, 1.125302, 0, 0.4784314, 1, 1,
0.1989342, -0.2466234, 2.455058, 0, 0.4705882, 1, 1,
0.1997962, 3.187625, 0.5533438, 0, 0.4666667, 1, 1,
0.2020577, -0.01065997, -0.328591, 0, 0.4588235, 1, 1,
0.2038718, -1.876169, 1.480061, 0, 0.454902, 1, 1,
0.2044849, -0.4940141, 1.786894, 0, 0.4470588, 1, 1,
0.2065338, 0.3577026, 0.9026456, 0, 0.4431373, 1, 1,
0.2070827, -0.6956366, 3.043445, 0, 0.4352941, 1, 1,
0.2089633, -0.0873356, 0.4359756, 0, 0.4313726, 1, 1,
0.2114059, -0.928991, 1.567776, 0, 0.4235294, 1, 1,
0.212513, -0.3966001, -0.5980712, 0, 0.4196078, 1, 1,
0.2129549, 0.2883878, -0.044868, 0, 0.4117647, 1, 1,
0.2196157, -0.1972006, 1.868956, 0, 0.4078431, 1, 1,
0.2210979, -0.9497271, 4.047795, 0, 0.4, 1, 1,
0.2215468, -2.07092, 3.050423, 0, 0.3921569, 1, 1,
0.2329013, 0.3525454, 1.285832, 0, 0.3882353, 1, 1,
0.2333893, 0.3031254, 0.1950612, 0, 0.3803922, 1, 1,
0.2350194, 0.424782, -1.591032, 0, 0.3764706, 1, 1,
0.2386342, 0.7868036, 0.759151, 0, 0.3686275, 1, 1,
0.2459329, -0.847828, 2.477657, 0, 0.3647059, 1, 1,
0.2477034, 1.582732, -0.6538906, 0, 0.3568628, 1, 1,
0.2485342, 0.03920813, -0.5091369, 0, 0.3529412, 1, 1,
0.2498295, 1.228208, 0.4026957, 0, 0.345098, 1, 1,
0.2505776, -0.007838815, 2.408046, 0, 0.3411765, 1, 1,
0.2511029, 2.157899, -0.2197813, 0, 0.3333333, 1, 1,
0.2511673, -0.7002435, 2.446862, 0, 0.3294118, 1, 1,
0.251283, -0.8833592, 3.380216, 0, 0.3215686, 1, 1,
0.2516737, 1.281096, -1.355107, 0, 0.3176471, 1, 1,
0.2521333, 0.822651, -0.2487503, 0, 0.3098039, 1, 1,
0.2525098, -0.7133355, 2.59002, 0, 0.3058824, 1, 1,
0.2539726, -0.3944045, -0.5300261, 0, 0.2980392, 1, 1,
0.2540915, 1.583085, 0.1766425, 0, 0.2901961, 1, 1,
0.2613912, 1.244886, 1.406052, 0, 0.2862745, 1, 1,
0.261463, -0.7128004, 2.144395, 0, 0.2784314, 1, 1,
0.2618304, 0.04858163, 0.8391762, 0, 0.2745098, 1, 1,
0.2655508, 1.689671, -1.02814, 0, 0.2666667, 1, 1,
0.267216, 0.1504366, 1.351363, 0, 0.2627451, 1, 1,
0.2708068, -0.3984223, 2.468275, 0, 0.254902, 1, 1,
0.2708258, -1.610375, 4.354908, 0, 0.2509804, 1, 1,
0.2721049, -0.9205721, 1.86997, 0, 0.2431373, 1, 1,
0.2736754, -1.049076, 4.478678, 0, 0.2392157, 1, 1,
0.2807783, -0.323751, 3.279877, 0, 0.2313726, 1, 1,
0.2841603, -0.003160893, 0.9579223, 0, 0.227451, 1, 1,
0.2861478, 0.8242318, -0.06341552, 0, 0.2196078, 1, 1,
0.286496, 0.4665993, 0.4139962, 0, 0.2156863, 1, 1,
0.2890055, 1.19669, 0.6054889, 0, 0.2078431, 1, 1,
0.2951971, -1.150786, 2.533457, 0, 0.2039216, 1, 1,
0.2961314, -0.4596767, 0.03348382, 0, 0.1960784, 1, 1,
0.3017718, 0.03181602, -0.1423108, 0, 0.1882353, 1, 1,
0.305872, -0.7504189, 2.386937, 0, 0.1843137, 1, 1,
0.3097045, -1.445991, 3.505599, 0, 0.1764706, 1, 1,
0.3098436, 0.7349554, -0.5847313, 0, 0.172549, 1, 1,
0.3120618, 0.1806161, 1.477566, 0, 0.1647059, 1, 1,
0.3221751, -0.1330018, 1.764874, 0, 0.1607843, 1, 1,
0.3223639, -1.441192, 4.178585, 0, 0.1529412, 1, 1,
0.3224257, -1.356393, 1.589075, 0, 0.1490196, 1, 1,
0.3282725, -0.8162028, 2.284029, 0, 0.1411765, 1, 1,
0.331791, -0.1145794, -0.2297774, 0, 0.1372549, 1, 1,
0.3359119, 0.5105741, 1.969097, 0, 0.1294118, 1, 1,
0.3375514, -0.5598093, 1.219924, 0, 0.1254902, 1, 1,
0.3376807, 0.153103, 2.582299, 0, 0.1176471, 1, 1,
0.3435781, 0.5102628, -0.622296, 0, 0.1137255, 1, 1,
0.3505917, -0.7672449, 2.364817, 0, 0.1058824, 1, 1,
0.3517161, -0.236447, 1.927958, 0, 0.09803922, 1, 1,
0.3578489, -0.4323288, 0.77959, 0, 0.09411765, 1, 1,
0.3605959, -0.5533714, 4.071546, 0, 0.08627451, 1, 1,
0.3614977, 0.4588156, 1.165017, 0, 0.08235294, 1, 1,
0.3641592, 0.876312, -0.7627472, 0, 0.07450981, 1, 1,
0.3647769, -0.2230226, 3.09512, 0, 0.07058824, 1, 1,
0.3682072, -0.3015115, -0.06590868, 0, 0.0627451, 1, 1,
0.3806186, 0.5674701, -0.6626709, 0, 0.05882353, 1, 1,
0.3915876, -0.6444818, 1.648806, 0, 0.05098039, 1, 1,
0.3934072, -0.0404829, 1.410228, 0, 0.04705882, 1, 1,
0.4030224, -0.3871459, 1.272531, 0, 0.03921569, 1, 1,
0.4080754, -0.3302268, 1.371145, 0, 0.03529412, 1, 1,
0.4086184, -0.267414, 1.631656, 0, 0.02745098, 1, 1,
0.4172901, -1.565472, 3.187043, 0, 0.02352941, 1, 1,
0.4194772, -1.282613, 3.946417, 0, 0.01568628, 1, 1,
0.4232385, 0.1346265, -0.1944958, 0, 0.01176471, 1, 1,
0.4303315, 0.3195206, 1.983051, 0, 0.003921569, 1, 1,
0.4427517, -0.9406036, 2.981132, 0.003921569, 0, 1, 1,
0.4507395, 1.527403, -0.942266, 0.007843138, 0, 1, 1,
0.4513417, -0.6575893, 2.848987, 0.01568628, 0, 1, 1,
0.4558924, -1.03023, 2.052837, 0.01960784, 0, 1, 1,
0.4615112, 0.9836865, 0.301182, 0.02745098, 0, 1, 1,
0.4649211, 1.990267, 0.6614456, 0.03137255, 0, 1, 1,
0.4673168, 0.7894257, 1.025969, 0.03921569, 0, 1, 1,
0.4685782, -0.02594381, 0.09191737, 0.04313726, 0, 1, 1,
0.4698914, -0.6326201, 1.805962, 0.05098039, 0, 1, 1,
0.4704695, -1.401141, 1.87319, 0.05490196, 0, 1, 1,
0.4728133, -0.6001042, 3.006484, 0.0627451, 0, 1, 1,
0.473622, 0.5222743, 0.4269755, 0.06666667, 0, 1, 1,
0.4744659, 0.3663063, 2.181734, 0.07450981, 0, 1, 1,
0.4746885, 0.8004086, 2.944842, 0.07843138, 0, 1, 1,
0.4747537, -0.0215985, 0.5656809, 0.08627451, 0, 1, 1,
0.4749576, -0.1853236, 2.282681, 0.09019608, 0, 1, 1,
0.4791081, 0.1354883, 0.07994483, 0.09803922, 0, 1, 1,
0.480588, 0.321053, -0.4753658, 0.1058824, 0, 1, 1,
0.4849114, 1.509482, -0.052314, 0.1098039, 0, 1, 1,
0.4873739, -0.8197173, 1.848669, 0.1176471, 0, 1, 1,
0.4874855, -1.529604, 3.431632, 0.1215686, 0, 1, 1,
0.487707, -0.7261921, 2.102369, 0.1294118, 0, 1, 1,
0.4882444, 1.029191, 0.3767107, 0.1333333, 0, 1, 1,
0.4896763, -1.621314, 2.577155, 0.1411765, 0, 1, 1,
0.4899259, -0.05845183, 1.160195, 0.145098, 0, 1, 1,
0.4920045, -0.281668, 2.535212, 0.1529412, 0, 1, 1,
0.4939035, -1.766914, 2.618464, 0.1568628, 0, 1, 1,
0.4953601, -1.364234, 3.763496, 0.1647059, 0, 1, 1,
0.500008, 0.2365817, 1.671836, 0.1686275, 0, 1, 1,
0.5006198, -0.5180611, 1.263123, 0.1764706, 0, 1, 1,
0.5012505, -1.035108, 2.860356, 0.1803922, 0, 1, 1,
0.5013419, -0.4671229, 3.448756, 0.1882353, 0, 1, 1,
0.5076205, -1.307918, 4.193938, 0.1921569, 0, 1, 1,
0.5111815, -0.8050256, 3.891189, 0.2, 0, 1, 1,
0.5112012, -1.188025, 2.27508, 0.2078431, 0, 1, 1,
0.5142406, 0.5326292, 0.3698761, 0.2117647, 0, 1, 1,
0.519528, 0.1920103, 2.98261, 0.2196078, 0, 1, 1,
0.5209244, 0.626228, 0.611016, 0.2235294, 0, 1, 1,
0.526886, 0.5069946, 1.674246, 0.2313726, 0, 1, 1,
0.5272914, -0.9327151, 0.8894331, 0.2352941, 0, 1, 1,
0.5305803, 0.1845662, 1.082752, 0.2431373, 0, 1, 1,
0.5317432, 0.5647079, 1.868584, 0.2470588, 0, 1, 1,
0.5320469, -0.4001766, 1.527614, 0.254902, 0, 1, 1,
0.5322708, -0.6817531, 4.077579, 0.2588235, 0, 1, 1,
0.5376042, -0.6976333, 2.850141, 0.2666667, 0, 1, 1,
0.5403227, 1.180102, 0.7835763, 0.2705882, 0, 1, 1,
0.5436652, -0.9181134, 0.4800718, 0.2784314, 0, 1, 1,
0.5542949, -0.09621514, 0.4735039, 0.282353, 0, 1, 1,
0.5558461, 0.1711559, 2.193953, 0.2901961, 0, 1, 1,
0.55643, 0.132191, 0.3496053, 0.2941177, 0, 1, 1,
0.5590765, -0.3240117, 2.293673, 0.3019608, 0, 1, 1,
0.5614604, -1.740638, 2.70512, 0.3098039, 0, 1, 1,
0.5646417, 0.5205451, 2.335179, 0.3137255, 0, 1, 1,
0.5650356, 0.6603929, 0.6274587, 0.3215686, 0, 1, 1,
0.5689883, -0.6123116, 3.076355, 0.3254902, 0, 1, 1,
0.57161, -0.765016, 4.540285, 0.3333333, 0, 1, 1,
0.5736675, 0.5856902, 1.188041, 0.3372549, 0, 1, 1,
0.5754267, -0.3815009, 1.036561, 0.345098, 0, 1, 1,
0.5760687, 0.3711504, 2.879759, 0.3490196, 0, 1, 1,
0.5794474, 0.06145742, 1.663395, 0.3568628, 0, 1, 1,
0.5851612, 2.001561, 0.8932567, 0.3607843, 0, 1, 1,
0.5891414, 0.6428205, -1.900028, 0.3686275, 0, 1, 1,
0.5894817, 0.8283725, 0.5898276, 0.372549, 0, 1, 1,
0.5904322, 0.2909381, 1.840169, 0.3803922, 0, 1, 1,
0.5931199, 0.4039057, 1.071394, 0.3843137, 0, 1, 1,
0.5933614, -0.5449924, 2.260305, 0.3921569, 0, 1, 1,
0.5942948, 0.3022451, 0.2041769, 0.3960784, 0, 1, 1,
0.6003708, 0.7815531, 2.545755, 0.4039216, 0, 1, 1,
0.6026935, 0.9598439, 0.8651637, 0.4117647, 0, 1, 1,
0.6033689, -1.099868, 1.765967, 0.4156863, 0, 1, 1,
0.6042585, -0.06337792, 2.648587, 0.4235294, 0, 1, 1,
0.608805, -0.4315838, 3.415236, 0.427451, 0, 1, 1,
0.6120836, 1.583951, 1.104541, 0.4352941, 0, 1, 1,
0.6121594, 0.3282689, 0.4709505, 0.4392157, 0, 1, 1,
0.6204402, 0.8051924, 0.6363791, 0.4470588, 0, 1, 1,
0.6220582, -0.4767379, 2.518441, 0.4509804, 0, 1, 1,
0.6235324, 0.5212706, 1.104307, 0.4588235, 0, 1, 1,
0.6286459, -0.9310101, 3.245823, 0.4627451, 0, 1, 1,
0.6313376, -1.135081, 4.146619, 0.4705882, 0, 1, 1,
0.6314897, -0.6637253, 4.319484, 0.4745098, 0, 1, 1,
0.6335286, 1.928232, 1.552085, 0.4823529, 0, 1, 1,
0.6337259, 0.5308948, 0.3166102, 0.4862745, 0, 1, 1,
0.6365618, -0.07500151, 1.138176, 0.4941176, 0, 1, 1,
0.6371002, -0.002770262, 1.054899, 0.5019608, 0, 1, 1,
0.6452653, -0.2901349, 2.587985, 0.5058824, 0, 1, 1,
0.6532724, -1.303962, 4.493504, 0.5137255, 0, 1, 1,
0.6553928, 0.9428618, 0.324787, 0.5176471, 0, 1, 1,
0.6559809, 0.8406621, 0.3650401, 0.5254902, 0, 1, 1,
0.6563255, -0.005380092, 0.188334, 0.5294118, 0, 1, 1,
0.657011, -0.5997462, 2.557184, 0.5372549, 0, 1, 1,
0.6650063, -0.4179937, 1.869382, 0.5411765, 0, 1, 1,
0.6667974, 1.18562, 0.1194438, 0.5490196, 0, 1, 1,
0.6685424, -1.144729, 3.599453, 0.5529412, 0, 1, 1,
0.6697076, -0.4890804, 2.962674, 0.5607843, 0, 1, 1,
0.6735089, -2.725491, 3.398823, 0.5647059, 0, 1, 1,
0.6758398, 0.6014366, 0.3781046, 0.572549, 0, 1, 1,
0.6771622, -1.94688, 2.543366, 0.5764706, 0, 1, 1,
0.6814852, -0.7290198, 3.569399, 0.5843138, 0, 1, 1,
0.6828265, -0.1238012, 1.267336, 0.5882353, 0, 1, 1,
0.6847124, -0.3440613, 1.538872, 0.5960785, 0, 1, 1,
0.6884043, -1.163944, 1.762955, 0.6039216, 0, 1, 1,
0.6919847, -0.005161504, 2.893779, 0.6078432, 0, 1, 1,
0.6952578, -0.5285551, 3.099846, 0.6156863, 0, 1, 1,
0.7020913, 0.1736402, 2.011147, 0.6196079, 0, 1, 1,
0.7072564, 0.4696423, 1.334332, 0.627451, 0, 1, 1,
0.7077742, -0.3495548, 2.036672, 0.6313726, 0, 1, 1,
0.71205, -0.8387111, 1.76992, 0.6392157, 0, 1, 1,
0.7244063, -0.09709313, 2.381087, 0.6431373, 0, 1, 1,
0.7245384, -0.6164041, 2.465653, 0.6509804, 0, 1, 1,
0.7253376, -0.4706186, 1.569746, 0.654902, 0, 1, 1,
0.72973, 0.0408412, 2.580605, 0.6627451, 0, 1, 1,
0.7382768, -0.7156777, 2.327809, 0.6666667, 0, 1, 1,
0.74217, 1.913941, 0.6174121, 0.6745098, 0, 1, 1,
0.7488086, -0.2497367, 1.307919, 0.6784314, 0, 1, 1,
0.7498125, 0.8955166, 1.72587, 0.6862745, 0, 1, 1,
0.751486, -1.693498, 3.425937, 0.6901961, 0, 1, 1,
0.7550825, 1.518448, -0.5090437, 0.6980392, 0, 1, 1,
0.7578794, -0.7103143, 1.542337, 0.7058824, 0, 1, 1,
0.7593895, -0.1848023, 0.9139482, 0.7098039, 0, 1, 1,
0.7651454, -1.467565, 2.987079, 0.7176471, 0, 1, 1,
0.7736787, -1.420457, 2.500261, 0.7215686, 0, 1, 1,
0.7800384, 0.1822511, 0.8955704, 0.7294118, 0, 1, 1,
0.7866204, 1.933574, 1.379904, 0.7333333, 0, 1, 1,
0.7912479, 0.5450388, 0.6014457, 0.7411765, 0, 1, 1,
0.7976742, 0.4792578, 0.527898, 0.7450981, 0, 1, 1,
0.8008178, 0.2873114, 2.186504, 0.7529412, 0, 1, 1,
0.8008709, 0.3772911, 2.31086, 0.7568628, 0, 1, 1,
0.8017598, 1.236338, 1.817176, 0.7647059, 0, 1, 1,
0.8027647, 1.454913, 0.5594282, 0.7686275, 0, 1, 1,
0.8039262, -0.02395836, 2.46659, 0.7764706, 0, 1, 1,
0.8041912, 1.093024, -1.319974, 0.7803922, 0, 1, 1,
0.804683, 1.041425, 1.174513, 0.7882353, 0, 1, 1,
0.8098412, -0.01315402, 1.979091, 0.7921569, 0, 1, 1,
0.813447, -1.19783, 3.489606, 0.8, 0, 1, 1,
0.8172346, -1.693289, 5.915836, 0.8078431, 0, 1, 1,
0.8173615, -0.9703773, 1.148549, 0.8117647, 0, 1, 1,
0.8216401, -0.7879608, 2.540885, 0.8196079, 0, 1, 1,
0.8216875, 0.06095482, 2.653466, 0.8235294, 0, 1, 1,
0.8219326, 1.106637, -0.3317181, 0.8313726, 0, 1, 1,
0.8286494, -0.2528546, 2.848592, 0.8352941, 0, 1, 1,
0.8297051, 0.6087984, 1.190101, 0.8431373, 0, 1, 1,
0.8509089, 0.6799707, 0.6401551, 0.8470588, 0, 1, 1,
0.8514622, 1.46987, -0.5430483, 0.854902, 0, 1, 1,
0.8532364, 1.746851, 0.3785077, 0.8588235, 0, 1, 1,
0.8587894, -0.8374199, 3.957521, 0.8666667, 0, 1, 1,
0.8633347, -0.5912522, 1.515553, 0.8705882, 0, 1, 1,
0.8661563, 0.7532602, 1.514868, 0.8784314, 0, 1, 1,
0.8807873, -0.2105599, 1.970974, 0.8823529, 0, 1, 1,
0.8905848, -0.0524971, 3.286026, 0.8901961, 0, 1, 1,
0.8933597, 0.6396673, -1.048664, 0.8941177, 0, 1, 1,
0.8975338, 0.6061178, 1.194946, 0.9019608, 0, 1, 1,
0.8993331, -0.2244676, 2.140926, 0.9098039, 0, 1, 1,
0.9010906, -1.529649, 1.441979, 0.9137255, 0, 1, 1,
0.9019269, -0.6054208, 0.8828374, 0.9215686, 0, 1, 1,
0.906093, -0.8515109, 3.458089, 0.9254902, 0, 1, 1,
0.90946, -0.886911, 2.977195, 0.9333333, 0, 1, 1,
0.9190394, -0.4074239, 3.287593, 0.9372549, 0, 1, 1,
0.9192594, -1.417675, 2.37742, 0.945098, 0, 1, 1,
0.9203078, -0.43742, 1.146587, 0.9490196, 0, 1, 1,
0.9268647, -1.561576, 3.238302, 0.9568627, 0, 1, 1,
0.9292129, -0.11648, 2.292904, 0.9607843, 0, 1, 1,
0.9346938, -1.184137, 2.714472, 0.9686275, 0, 1, 1,
0.9381718, -0.6279672, 3.721863, 0.972549, 0, 1, 1,
0.9393399, 0.4808761, 1.512268, 0.9803922, 0, 1, 1,
0.9506887, -1.21205, 4.721559, 0.9843137, 0, 1, 1,
0.9522062, 1.720404, 0.4730766, 0.9921569, 0, 1, 1,
0.9527591, -0.4784954, 1.80596, 0.9960784, 0, 1, 1,
0.9529133, -0.7320348, 2.416233, 1, 0, 0.9960784, 1,
0.9532523, -1.471096, 4.645103, 1, 0, 0.9882353, 1,
0.9557533, -0.6701638, 2.797043, 1, 0, 0.9843137, 1,
0.9592373, -1.208281, 3.77121, 1, 0, 0.9764706, 1,
0.9599506, -0.2231102, 1.721884, 1, 0, 0.972549, 1,
0.9628472, -0.9358492, 3.904728, 1, 0, 0.9647059, 1,
0.9661806, 0.9777244, 0.2916906, 1, 0, 0.9607843, 1,
0.9757536, 0.6188034, 1.719633, 1, 0, 0.9529412, 1,
0.9817717, -1.365325, 3.480648, 1, 0, 0.9490196, 1,
0.9827926, 1.341098, 0.5592682, 1, 0, 0.9411765, 1,
0.9914565, 1.308396, 0.4085549, 1, 0, 0.9372549, 1,
0.9922861, 0.7186614, -0.7423461, 1, 0, 0.9294118, 1,
1.009869, -1.465902, 3.378379, 1, 0, 0.9254902, 1,
1.012444, -0.8632936, 2.163734, 1, 0, 0.9176471, 1,
1.012782, -1.110889, 2.138915, 1, 0, 0.9137255, 1,
1.014806, 0.8594739, 1.760992, 1, 0, 0.9058824, 1,
1.015078, -1.520116, 4.211176, 1, 0, 0.9019608, 1,
1.016135, -0.304528, 2.570097, 1, 0, 0.8941177, 1,
1.017911, 0.03266396, 0.8368674, 1, 0, 0.8862745, 1,
1.01795, 0.004354282, 2.367943, 1, 0, 0.8823529, 1,
1.021275, -0.6017653, 2.691308, 1, 0, 0.8745098, 1,
1.035314, 0.7132017, 0.5351742, 1, 0, 0.8705882, 1,
1.046809, -1.625181, 2.484733, 1, 0, 0.8627451, 1,
1.047244, 0.6382723, 0.6894625, 1, 0, 0.8588235, 1,
1.052213, 1.203682, 0.136537, 1, 0, 0.8509804, 1,
1.054889, -0.8049231, 2.504824, 1, 0, 0.8470588, 1,
1.064106, 0.2398511, -0.1825476, 1, 0, 0.8392157, 1,
1.067289, 0.8070539, 0.3579581, 1, 0, 0.8352941, 1,
1.071068, 0.1019437, 2.415661, 1, 0, 0.827451, 1,
1.071975, -2.459485, 2.038851, 1, 0, 0.8235294, 1,
1.074044, 0.1777502, 0.9801649, 1, 0, 0.8156863, 1,
1.074591, 0.9085749, 1.064191, 1, 0, 0.8117647, 1,
1.077986, -0.2956473, 1.82581, 1, 0, 0.8039216, 1,
1.080739, 1.753187, 0.5238268, 1, 0, 0.7960784, 1,
1.085281, -1.699153, 2.236714, 1, 0, 0.7921569, 1,
1.085536, -0.7216164, 1.941385, 1, 0, 0.7843137, 1,
1.090241, 0.7298493, 0.5887377, 1, 0, 0.7803922, 1,
1.091835, -1.160247, 2.725894, 1, 0, 0.772549, 1,
1.100515, -1.83542, 1.208041, 1, 0, 0.7686275, 1,
1.120718, 0.9412118, 1.468656, 1, 0, 0.7607843, 1,
1.123994, -0.2314926, 0.330432, 1, 0, 0.7568628, 1,
1.125224, 0.3938304, 1.762548, 1, 0, 0.7490196, 1,
1.134528, -1.721891, 2.101961, 1, 0, 0.7450981, 1,
1.136679, -0.08025501, 0.8588893, 1, 0, 0.7372549, 1,
1.146765, 1.316843, 0.5434646, 1, 0, 0.7333333, 1,
1.149179, -0.09383107, 2.296829, 1, 0, 0.7254902, 1,
1.159044, 0.66364, 0.5725447, 1, 0, 0.7215686, 1,
1.164322, 1.543921, -0.09753675, 1, 0, 0.7137255, 1,
1.164645, 0.9441202, 0.7020409, 1, 0, 0.7098039, 1,
1.167782, -1.016133, 3.13784, 1, 0, 0.7019608, 1,
1.169974, 0.6171929, 1.612708, 1, 0, 0.6941177, 1,
1.170601, 0.4759742, 0.3752535, 1, 0, 0.6901961, 1,
1.179492, -1.651905, 2.743075, 1, 0, 0.682353, 1,
1.180387, -0.5369411, 2.406604, 1, 0, 0.6784314, 1,
1.184857, -0.6134771, 2.642416, 1, 0, 0.6705883, 1,
1.185173, 2.680544, 0.4292798, 1, 0, 0.6666667, 1,
1.186443, -0.4319266, 3.702427, 1, 0, 0.6588235, 1,
1.192473, 0.9670619, -0.7364885, 1, 0, 0.654902, 1,
1.197582, 0.9499284, -0.8912883, 1, 0, 0.6470588, 1,
1.199537, 0.2395838, 1.984927, 1, 0, 0.6431373, 1,
1.20121, -1.60381, 1.306315, 1, 0, 0.6352941, 1,
1.205962, -0.1666925, 0.5058649, 1, 0, 0.6313726, 1,
1.206042, 0.694362, 2.006374, 1, 0, 0.6235294, 1,
1.223343, -1.407802, 1.744011, 1, 0, 0.6196079, 1,
1.234128, 0.9441875, -0.3380719, 1, 0, 0.6117647, 1,
1.234972, 0.1149978, 1.995466, 1, 0, 0.6078432, 1,
1.243612, 0.06522288, 2.884207, 1, 0, 0.6, 1,
1.243717, -0.2457538, 2.614579, 1, 0, 0.5921569, 1,
1.246957, 0.0006329207, 0.6860743, 1, 0, 0.5882353, 1,
1.24742, 1.061117, 1.09463, 1, 0, 0.5803922, 1,
1.250297, -0.701497, 1.860361, 1, 0, 0.5764706, 1,
1.252107, -1.77466, 3.271825, 1, 0, 0.5686275, 1,
1.254252, 0.2942236, 2.790567, 1, 0, 0.5647059, 1,
1.262228, -1.38695, 2.393667, 1, 0, 0.5568628, 1,
1.270603, 1.1326, 0.1390458, 1, 0, 0.5529412, 1,
1.272952, 0.3186526, 1.417609, 1, 0, 0.5450981, 1,
1.284523, 0.4655214, 1.754915, 1, 0, 0.5411765, 1,
1.309251, -0.9575028, 2.938895, 1, 0, 0.5333334, 1,
1.341973, -1.734285, 1.970951, 1, 0, 0.5294118, 1,
1.343352, -2.142726, 0.8769832, 1, 0, 0.5215687, 1,
1.347093, 1.370302, -0.6507906, 1, 0, 0.5176471, 1,
1.351727, 0.7492719, 0.8137871, 1, 0, 0.509804, 1,
1.364764, -0.5725069, 1.967517, 1, 0, 0.5058824, 1,
1.367369, -1.694673, 3.311939, 1, 0, 0.4980392, 1,
1.372177, -1.117677, 3.301523, 1, 0, 0.4901961, 1,
1.376761, 1.955345, -0.1883439, 1, 0, 0.4862745, 1,
1.381041, -0.4939438, 1.477306, 1, 0, 0.4784314, 1,
1.392679, 0.7744642, 2.646212, 1, 0, 0.4745098, 1,
1.403183, -1.559062, 2.682511, 1, 0, 0.4666667, 1,
1.403665, 1.062534, 1.299072, 1, 0, 0.4627451, 1,
1.419244, 1.263092, 0.8489155, 1, 0, 0.454902, 1,
1.423056, -1.466392, 2.693429, 1, 0, 0.4509804, 1,
1.429185, 0.4132824, 1.337567, 1, 0, 0.4431373, 1,
1.459574, -1.70526, 1.493274, 1, 0, 0.4392157, 1,
1.478511, -0.6672604, 3.549756, 1, 0, 0.4313726, 1,
1.490522, 1.382435, 0.6971388, 1, 0, 0.427451, 1,
1.499132, -0.7352433, 0.4504259, 1, 0, 0.4196078, 1,
1.500819, 2.369879, -1.093825, 1, 0, 0.4156863, 1,
1.506982, 0.07903086, 3.404932, 1, 0, 0.4078431, 1,
1.512144, -0.2637966, 1.29891, 1, 0, 0.4039216, 1,
1.51743, 0.4152635, 1.393059, 1, 0, 0.3960784, 1,
1.532668, 0.04567337, 0.6793284, 1, 0, 0.3882353, 1,
1.558259, 0.5361284, -0.6236919, 1, 0, 0.3843137, 1,
1.56408, 1.290642, 1.537107, 1, 0, 0.3764706, 1,
1.570849, 0.9027838, 2.727289, 1, 0, 0.372549, 1,
1.572036, 0.7666692, 2.503344, 1, 0, 0.3647059, 1,
1.577703, -0.4737814, 2.909002, 1, 0, 0.3607843, 1,
1.580043, 0.5233997, 0.2904695, 1, 0, 0.3529412, 1,
1.582719, -0.8996908, 2.514466, 1, 0, 0.3490196, 1,
1.583005, 0.3142715, 0.3496759, 1, 0, 0.3411765, 1,
1.587627, 0.2021107, 1.445858, 1, 0, 0.3372549, 1,
1.590784, 0.9881672, 3.293394, 1, 0, 0.3294118, 1,
1.614828, 0.2773463, 0.797214, 1, 0, 0.3254902, 1,
1.616156, 0.1949696, 1.322381, 1, 0, 0.3176471, 1,
1.634178, -1.654783, 3.318946, 1, 0, 0.3137255, 1,
1.639612, -0.9860632, 3.260516, 1, 0, 0.3058824, 1,
1.644558, 0.7292367, 0.4405468, 1, 0, 0.2980392, 1,
1.645705, -1.643776, 2.591182, 1, 0, 0.2941177, 1,
1.651513, 0.2636621, 1.499989, 1, 0, 0.2862745, 1,
1.655186, 0.4391225, 1.010833, 1, 0, 0.282353, 1,
1.67325, -0.6374511, 3.264621, 1, 0, 0.2745098, 1,
1.677923, 0.4129069, 2.353803, 1, 0, 0.2705882, 1,
1.683827, -0.6362479, 3.006465, 1, 0, 0.2627451, 1,
1.69473, 1.492957, 1.794028, 1, 0, 0.2588235, 1,
1.698235, 2.606934, 0.3388517, 1, 0, 0.2509804, 1,
1.704137, 1.343173, -0.01006266, 1, 0, 0.2470588, 1,
1.715722, 0.6950651, 0.2060463, 1, 0, 0.2392157, 1,
1.72945, 1.075193, 0.8139832, 1, 0, 0.2352941, 1,
1.72953, 1.870087, -0.4892729, 1, 0, 0.227451, 1,
1.734717, -0.2766721, 3.421227, 1, 0, 0.2235294, 1,
1.743167, -0.1942466, 1.675381, 1, 0, 0.2156863, 1,
1.754052, -2.370915, 3.139418, 1, 0, 0.2117647, 1,
1.761903, 0.3907255, 1.269961, 1, 0, 0.2039216, 1,
1.775439, -1.059758, 3.319946, 1, 0, 0.1960784, 1,
1.775512, 0.2979605, -0.0258578, 1, 0, 0.1921569, 1,
1.779275, -0.2369213, 2.042994, 1, 0, 0.1843137, 1,
1.780734, -0.7177618, 2.617209, 1, 0, 0.1803922, 1,
1.784799, 0.1134342, 1.590201, 1, 0, 0.172549, 1,
1.792688, 1.422207, 1.42863, 1, 0, 0.1686275, 1,
1.805906, 0.2230829, 1.503952, 1, 0, 0.1607843, 1,
1.807399, 0.3752563, 2.221394, 1, 0, 0.1568628, 1,
1.826503, -0.5561464, 2.680571, 1, 0, 0.1490196, 1,
1.829776, 0.1720716, 1.812911, 1, 0, 0.145098, 1,
1.830871, -0.210342, 2.183769, 1, 0, 0.1372549, 1,
1.851426, -0.5820758, 2.179648, 1, 0, 0.1333333, 1,
1.863542, 1.114, 4.114608, 1, 0, 0.1254902, 1,
1.906069, -0.2803743, 2.398279, 1, 0, 0.1215686, 1,
1.932673, -0.6386169, 2.293352, 1, 0, 0.1137255, 1,
1.934614, 1.565022, 0.4569547, 1, 0, 0.1098039, 1,
1.952337, 0.5658096, 3.354574, 1, 0, 0.1019608, 1,
1.967631, -1.257259, 1.18819, 1, 0, 0.09411765, 1,
1.977163, -1.053595, 4.021821, 1, 0, 0.09019608, 1,
2.070884, -1.427125, 2.627931, 1, 0, 0.08235294, 1,
2.13015, -1.338075, 1.102167, 1, 0, 0.07843138, 1,
2.134249, 0.2480717, 2.504923, 1, 0, 0.07058824, 1,
2.136166, 1.263047, -1.005286, 1, 0, 0.06666667, 1,
2.17428, 0.7634947, 0.9942862, 1, 0, 0.05882353, 1,
2.219984, -0.8498194, 2.842105, 1, 0, 0.05490196, 1,
2.339481, 1.292574, 1.203555, 1, 0, 0.04705882, 1,
2.366099, 0.1107084, 2.660379, 1, 0, 0.04313726, 1,
2.459534, -1.817501, 2.702026, 1, 0, 0.03529412, 1,
2.467988, -0.8891482, 1.026223, 1, 0, 0.03137255, 1,
2.961361, -1.753507, 1.58851, 1, 0, 0.02352941, 1,
2.96632, 1.450847, 1.324256, 1, 0, 0.01960784, 1,
3.074918, -0.1543227, 2.785282, 1, 0, 0.01176471, 1,
3.264162, -1.141809, 0.6292508, 1, 0, 0.007843138, 1
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
-0.2537078, -4.2215, -7.571123, 0, -0.5, 0.5, 0.5,
-0.2537078, -4.2215, -7.571123, 1, -0.5, 0.5, 0.5,
-0.2537078, -4.2215, -7.571123, 1, 1.5, 0.5, 0.5,
-0.2537078, -4.2215, -7.571123, 0, 1.5, 0.5, 0.5
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
-4.964135, 0.01997828, -7.571123, 0, -0.5, 0.5, 0.5,
-4.964135, 0.01997828, -7.571123, 1, -0.5, 0.5, 0.5,
-4.964135, 0.01997828, -7.571123, 1, 1.5, 0.5, 0.5,
-4.964135, 0.01997828, -7.571123, 0, 1.5, 0.5, 0.5
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
-4.964135, -4.2215, 0.149714, 0, -0.5, 0.5, 0.5,
-4.964135, -4.2215, 0.149714, 1, -0.5, 0.5, 0.5,
-4.964135, -4.2215, 0.149714, 1, 1.5, 0.5, 0.5,
-4.964135, -4.2215, 0.149714, 0, 1.5, 0.5, 0.5
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
-2, -3.242697, -5.789392,
2, -3.242697, -5.789392,
-2, -3.242697, -5.789392,
-2, -3.405831, -6.086347,
0, -3.242697, -5.789392,
0, -3.405831, -6.086347,
2, -3.242697, -5.789392,
2, -3.405831, -6.086347
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
-2, -3.732099, -6.680257, 0, -0.5, 0.5, 0.5,
-2, -3.732099, -6.680257, 1, -0.5, 0.5, 0.5,
-2, -3.732099, -6.680257, 1, 1.5, 0.5, 0.5,
-2, -3.732099, -6.680257, 0, 1.5, 0.5, 0.5,
0, -3.732099, -6.680257, 0, -0.5, 0.5, 0.5,
0, -3.732099, -6.680257, 1, -0.5, 0.5, 0.5,
0, -3.732099, -6.680257, 1, 1.5, 0.5, 0.5,
0, -3.732099, -6.680257, 0, 1.5, 0.5, 0.5,
2, -3.732099, -6.680257, 0, -0.5, 0.5, 0.5,
2, -3.732099, -6.680257, 1, -0.5, 0.5, 0.5,
2, -3.732099, -6.680257, 1, 1.5, 0.5, 0.5,
2, -3.732099, -6.680257, 0, 1.5, 0.5, 0.5
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
-3.877113, -3, -5.789392,
-3.877113, 3, -5.789392,
-3.877113, -3, -5.789392,
-4.058284, -3, -6.086347,
-3.877113, -2, -5.789392,
-4.058284, -2, -6.086347,
-3.877113, -1, -5.789392,
-4.058284, -1, -6.086347,
-3.877113, 0, -5.789392,
-4.058284, 0, -6.086347,
-3.877113, 1, -5.789392,
-4.058284, 1, -6.086347,
-3.877113, 2, -5.789392,
-4.058284, 2, -6.086347,
-3.877113, 3, -5.789392,
-4.058284, 3, -6.086347
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
-4.420624, -3, -6.680257, 0, -0.5, 0.5, 0.5,
-4.420624, -3, -6.680257, 1, -0.5, 0.5, 0.5,
-4.420624, -3, -6.680257, 1, 1.5, 0.5, 0.5,
-4.420624, -3, -6.680257, 0, 1.5, 0.5, 0.5,
-4.420624, -2, -6.680257, 0, -0.5, 0.5, 0.5,
-4.420624, -2, -6.680257, 1, -0.5, 0.5, 0.5,
-4.420624, -2, -6.680257, 1, 1.5, 0.5, 0.5,
-4.420624, -2, -6.680257, 0, 1.5, 0.5, 0.5,
-4.420624, -1, -6.680257, 0, -0.5, 0.5, 0.5,
-4.420624, -1, -6.680257, 1, -0.5, 0.5, 0.5,
-4.420624, -1, -6.680257, 1, 1.5, 0.5, 0.5,
-4.420624, -1, -6.680257, 0, 1.5, 0.5, 0.5,
-4.420624, 0, -6.680257, 0, -0.5, 0.5, 0.5,
-4.420624, 0, -6.680257, 1, -0.5, 0.5, 0.5,
-4.420624, 0, -6.680257, 1, 1.5, 0.5, 0.5,
-4.420624, 0, -6.680257, 0, 1.5, 0.5, 0.5,
-4.420624, 1, -6.680257, 0, -0.5, 0.5, 0.5,
-4.420624, 1, -6.680257, 1, -0.5, 0.5, 0.5,
-4.420624, 1, -6.680257, 1, 1.5, 0.5, 0.5,
-4.420624, 1, -6.680257, 0, 1.5, 0.5, 0.5,
-4.420624, 2, -6.680257, 0, -0.5, 0.5, 0.5,
-4.420624, 2, -6.680257, 1, -0.5, 0.5, 0.5,
-4.420624, 2, -6.680257, 1, 1.5, 0.5, 0.5,
-4.420624, 2, -6.680257, 0, 1.5, 0.5, 0.5,
-4.420624, 3, -6.680257, 0, -0.5, 0.5, 0.5,
-4.420624, 3, -6.680257, 1, -0.5, 0.5, 0.5,
-4.420624, 3, -6.680257, 1, 1.5, 0.5, 0.5,
-4.420624, 3, -6.680257, 0, 1.5, 0.5, 0.5
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
-3.877113, -3.242697, -4,
-3.877113, -3.242697, 4,
-3.877113, -3.242697, -4,
-4.058284, -3.405831, -4,
-3.877113, -3.242697, -2,
-4.058284, -3.405831, -2,
-3.877113, -3.242697, 0,
-4.058284, -3.405831, 0,
-3.877113, -3.242697, 2,
-4.058284, -3.405831, 2,
-3.877113, -3.242697, 4,
-4.058284, -3.405831, 4
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
-4.420624, -3.732099, -4, 0, -0.5, 0.5, 0.5,
-4.420624, -3.732099, -4, 1, -0.5, 0.5, 0.5,
-4.420624, -3.732099, -4, 1, 1.5, 0.5, 0.5,
-4.420624, -3.732099, -4, 0, 1.5, 0.5, 0.5,
-4.420624, -3.732099, -2, 0, -0.5, 0.5, 0.5,
-4.420624, -3.732099, -2, 1, -0.5, 0.5, 0.5,
-4.420624, -3.732099, -2, 1, 1.5, 0.5, 0.5,
-4.420624, -3.732099, -2, 0, 1.5, 0.5, 0.5,
-4.420624, -3.732099, 0, 0, -0.5, 0.5, 0.5,
-4.420624, -3.732099, 0, 1, -0.5, 0.5, 0.5,
-4.420624, -3.732099, 0, 1, 1.5, 0.5, 0.5,
-4.420624, -3.732099, 0, 0, 1.5, 0.5, 0.5,
-4.420624, -3.732099, 2, 0, -0.5, 0.5, 0.5,
-4.420624, -3.732099, 2, 1, -0.5, 0.5, 0.5,
-4.420624, -3.732099, 2, 1, 1.5, 0.5, 0.5,
-4.420624, -3.732099, 2, 0, 1.5, 0.5, 0.5,
-4.420624, -3.732099, 4, 0, -0.5, 0.5, 0.5,
-4.420624, -3.732099, 4, 1, -0.5, 0.5, 0.5,
-4.420624, -3.732099, 4, 1, 1.5, 0.5, 0.5,
-4.420624, -3.732099, 4, 0, 1.5, 0.5, 0.5
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
-3.877113, -3.242697, -5.789392,
-3.877113, 3.282654, -5.789392,
-3.877113, -3.242697, 6.08882,
-3.877113, 3.282654, 6.08882,
-3.877113, -3.242697, -5.789392,
-3.877113, -3.242697, 6.08882,
-3.877113, 3.282654, -5.789392,
-3.877113, 3.282654, 6.08882,
-3.877113, -3.242697, -5.789392,
3.369698, -3.242697, -5.789392,
-3.877113, -3.242697, 6.08882,
3.369698, -3.242697, 6.08882,
-3.877113, 3.282654, -5.789392,
3.369698, 3.282654, -5.789392,
-3.877113, 3.282654, 6.08882,
3.369698, 3.282654, 6.08882,
3.369698, -3.242697, -5.789392,
3.369698, 3.282654, -5.789392,
3.369698, -3.242697, 6.08882,
3.369698, 3.282654, 6.08882,
3.369698, -3.242697, -5.789392,
3.369698, -3.242697, 6.08882,
3.369698, 3.282654, -5.789392,
3.369698, 3.282654, 6.08882
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
var radius = 8.206439;
var distance = 36.51137;
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
mvMatrix.translate( 0.2537078, -0.01997828, -0.149714 );
mvMatrix.scale( 1.224395, 1.359768, 0.7469949 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.51137);
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
methylcarbamate_2-et<-read.table("methylcarbamate_2-et.xyz", skip=1)
```

```
## Error in methylcarbamate_2 - et <- read.table("methylcarbamate_2-et.xyz", : object 'methylcarbamate_2' not found
```

```r
x<-methylcarbamate_2-et$V2
```

```
## Error in eval(expr, envir, enclos): object 'methylcarbamate_2' not found
```

```r
y<-methylcarbamate_2-et$V3
```

```
## Error in eval(expr, envir, enclos): object 'methylcarbamate_2' not found
```

```r
z<-methylcarbamate_2-et$V4
```

```
## Error in eval(expr, envir, enclos): object 'methylcarbamate_2' not found
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
-3.771577, -0.1680586, -1.371991, 0, 0, 1, 1, 1,
-2.618757, -0.1937394, -1.604553, 1, 0, 0, 1, 1,
-2.56092, 0.1299953, -3.535548, 1, 0, 0, 1, 1,
-2.547336, -0.5459606, -4.238379, 1, 0, 0, 1, 1,
-2.533245, 0.05388888, 0.9287072, 1, 0, 0, 1, 1,
-2.448169, 0.2491147, -0.1552736, 1, 0, 0, 1, 1,
-2.429627, 0.6882222, -1.225086, 0, 0, 0, 1, 1,
-2.42796, 0.1827914, -1.333522, 0, 0, 0, 1, 1,
-2.426172, -1.234102, -1.13066, 0, 0, 0, 1, 1,
-2.349694, 1.495577, -0.9596817, 0, 0, 0, 1, 1,
-2.28721, -0.4250736, -2.173043, 0, 0, 0, 1, 1,
-2.276643, -1.130901, -1.962705, 0, 0, 0, 1, 1,
-2.20294, 1.006866, -1.553232, 0, 0, 0, 1, 1,
-2.202631, -0.04410058, -0.7397932, 1, 1, 1, 1, 1,
-2.19019, -0.349587, -2.253456, 1, 1, 1, 1, 1,
-2.1628, 0.9556501, -1.675771, 1, 1, 1, 1, 1,
-2.148188, 1.631417, -0.3170515, 1, 1, 1, 1, 1,
-2.145023, -0.5471116, -2.037686, 1, 1, 1, 1, 1,
-2.127215, -0.7548366, -2.313898, 1, 1, 1, 1, 1,
-2.08961, -0.2894147, -2.448765, 1, 1, 1, 1, 1,
-2.065907, 1.547869, -0.4502728, 1, 1, 1, 1, 1,
-2.047658, -1.426778, -3.322627, 1, 1, 1, 1, 1,
-2.028821, 0.1361748, -4.295678, 1, 1, 1, 1, 1,
-2.011044, 0.4702218, -1.187149, 1, 1, 1, 1, 1,
-1.996848, -0.4258447, -1.917271, 1, 1, 1, 1, 1,
-1.987919, -1.028978, -1.313035, 1, 1, 1, 1, 1,
-1.978231, -0.7882379, -2.994582, 1, 1, 1, 1, 1,
-1.972779, -0.3123812, -1.404633, 1, 1, 1, 1, 1,
-1.970811, 0.8233975, -2.532112, 0, 0, 1, 1, 1,
-1.906401, 1.991042, -0.4109256, 1, 0, 0, 1, 1,
-1.891803, 1.773655, -2.326296, 1, 0, 0, 1, 1,
-1.891477, 0.6028249, -1.455527, 1, 0, 0, 1, 1,
-1.871658, 0.4757909, -2.405164, 1, 0, 0, 1, 1,
-1.802092, -0.7798849, -2.640903, 1, 0, 0, 1, 1,
-1.795484, -0.2543065, -1.241218, 0, 0, 0, 1, 1,
-1.79005, -0.8500704, -2.873045, 0, 0, 0, 1, 1,
-1.788677, 2.04177, -1.952816, 0, 0, 0, 1, 1,
-1.774462, -0.8496782, -3.406594, 0, 0, 0, 1, 1,
-1.76299, 0.2801801, -2.485015, 0, 0, 0, 1, 1,
-1.741592, -1.318222, -1.898637, 0, 0, 0, 1, 1,
-1.738989, -0.9785904, -0.9821483, 0, 0, 0, 1, 1,
-1.736046, -0.7255375, -1.549045, 1, 1, 1, 1, 1,
-1.731722, 1.476436, -1.606209, 1, 1, 1, 1, 1,
-1.725259, -0.2848395, -2.168821, 1, 1, 1, 1, 1,
-1.712963, 1.205714, -1.842975, 1, 1, 1, 1, 1,
-1.71129, 2.024229, -2.923579, 1, 1, 1, 1, 1,
-1.703142, 0.952542, -1.746247, 1, 1, 1, 1, 1,
-1.69281, 0.07033405, -1.214479, 1, 1, 1, 1, 1,
-1.68367, -2.039006, -3.846847, 1, 1, 1, 1, 1,
-1.679063, -1.175949, -2.59423, 1, 1, 1, 1, 1,
-1.674762, -0.7500649, -1.803583, 1, 1, 1, 1, 1,
-1.669543, 1.627918, -0.1578016, 1, 1, 1, 1, 1,
-1.659839, 0.7705783, -0.8918096, 1, 1, 1, 1, 1,
-1.655247, 2.053779, -1.877797, 1, 1, 1, 1, 1,
-1.65377, -1.010073, -3.245249, 1, 1, 1, 1, 1,
-1.645487, 0.0337417, -1.442843, 1, 1, 1, 1, 1,
-1.634878, 0.7984347, 0.2118979, 0, 0, 1, 1, 1,
-1.61289, -0.4144759, -0.8980005, 1, 0, 0, 1, 1,
-1.600068, -0.7029296, -1.628938, 1, 0, 0, 1, 1,
-1.598477, -0.5165955, -1.721823, 1, 0, 0, 1, 1,
-1.59586, -1.452241, -1.192661, 1, 0, 0, 1, 1,
-1.590545, 0.3822977, -2.295727, 1, 0, 0, 1, 1,
-1.590225, -0.8981137, -2.202892, 0, 0, 0, 1, 1,
-1.586713, 0.6912436, -0.7441788, 0, 0, 0, 1, 1,
-1.580226, -1.551836, -3.153864, 0, 0, 0, 1, 1,
-1.575831, 0.448548, -3.712415, 0, 0, 0, 1, 1,
-1.575781, -2.562217, -2.031501, 0, 0, 0, 1, 1,
-1.5626, 0.3905408, -0.8404053, 0, 0, 0, 1, 1,
-1.550159, 0.369667, 0.483344, 0, 0, 0, 1, 1,
-1.533171, -0.6660311, -1.8442, 1, 1, 1, 1, 1,
-1.513147, 0.6747431, -0.02949687, 1, 1, 1, 1, 1,
-1.50296, 1.158607, -1.036499, 1, 1, 1, 1, 1,
-1.498101, 1.441329, -0.2170728, 1, 1, 1, 1, 1,
-1.494228, -0.2764945, -1.91883, 1, 1, 1, 1, 1,
-1.493639, -0.211908, -1.844446, 1, 1, 1, 1, 1,
-1.492239, -0.7869778, -1.754422, 1, 1, 1, 1, 1,
-1.477694, -0.4101721, -2.708668, 1, 1, 1, 1, 1,
-1.474088, -2.088508, -1.2143, 1, 1, 1, 1, 1,
-1.465034, -1.79586, -2.979176, 1, 1, 1, 1, 1,
-1.457228, 1.616373, -0.6013054, 1, 1, 1, 1, 1,
-1.455603, 0.04818652, -2.075737, 1, 1, 1, 1, 1,
-1.454243, -0.7797348, -3.215523, 1, 1, 1, 1, 1,
-1.451327, -0.3944183, -3.275806, 1, 1, 1, 1, 1,
-1.444186, -0.006799025, -1.181033, 1, 1, 1, 1, 1,
-1.44278, -0.06383552, 0.4317242, 0, 0, 1, 1, 1,
-1.433589, 0.8986785, -0.8380986, 1, 0, 0, 1, 1,
-1.432683, -1.337207, -2.099364, 1, 0, 0, 1, 1,
-1.43229, -0.1271113, -1.772755, 1, 0, 0, 1, 1,
-1.43218, 1.052485, -2.603713, 1, 0, 0, 1, 1,
-1.424672, 0.8105639, 0.7334769, 1, 0, 0, 1, 1,
-1.41515, -1.44884, -1.703096, 0, 0, 0, 1, 1,
-1.412549, -0.1783121, 0.4763448, 0, 0, 0, 1, 1,
-1.406129, 1.051943, 0.6886008, 0, 0, 0, 1, 1,
-1.384871, 1.536115, -1.296389, 0, 0, 0, 1, 1,
-1.378096, -1.307424, -2.064554, 0, 0, 0, 1, 1,
-1.377158, -0.2222456, -0.9626405, 0, 0, 0, 1, 1,
-1.376307, 1.256263, 0.1754778, 0, 0, 0, 1, 1,
-1.368666, 0.3817542, -1.321401, 1, 1, 1, 1, 1,
-1.363363, 1.711033, -2.228304, 1, 1, 1, 1, 1,
-1.361406, -0.3924578, -1.85574, 1, 1, 1, 1, 1,
-1.358673, -0.5800967, -3.193516, 1, 1, 1, 1, 1,
-1.343642, 0.3941028, -1.756904, 1, 1, 1, 1, 1,
-1.342317, 0.4394072, -1.503893, 1, 1, 1, 1, 1,
-1.342174, 0.8973246, 0.1883085, 1, 1, 1, 1, 1,
-1.34025, -0.09444766, 0.02674417, 1, 1, 1, 1, 1,
-1.338079, 1.193233, -0.5573692, 1, 1, 1, 1, 1,
-1.330164, -0.6357872, -3.390513, 1, 1, 1, 1, 1,
-1.325233, -1.964831, -1.916703, 1, 1, 1, 1, 1,
-1.308742, 0.285565, -1.373964, 1, 1, 1, 1, 1,
-1.306802, -2.055744, -3.698074, 1, 1, 1, 1, 1,
-1.299147, -1.866878, -3.23315, 1, 1, 1, 1, 1,
-1.293633, 0.7120694, -1.618305, 1, 1, 1, 1, 1,
-1.289448, -0.4699932, -0.4417236, 0, 0, 1, 1, 1,
-1.28844, 0.4202853, -2.105123, 1, 0, 0, 1, 1,
-1.287764, 0.497471, -2.080661, 1, 0, 0, 1, 1,
-1.284143, -0.2955559, -3.43439, 1, 0, 0, 1, 1,
-1.281953, 2.094934, -1.376428, 1, 0, 0, 1, 1,
-1.278154, 0.05032171, -2.756856, 1, 0, 0, 1, 1,
-1.274571, 0.358205, -0.6251912, 0, 0, 0, 1, 1,
-1.268805, -0.289435, -1.012364, 0, 0, 0, 1, 1,
-1.250475, -0.2005322, -2.13817, 0, 0, 0, 1, 1,
-1.248567, -1.135848, -2.821868, 0, 0, 0, 1, 1,
-1.237771, -0.7403667, -2.680439, 0, 0, 0, 1, 1,
-1.232013, -1.14274, -3.644131, 0, 0, 0, 1, 1,
-1.224684, 0.5759025, -0.7118642, 0, 0, 0, 1, 1,
-1.209418, 1.64431, -1.47577, 1, 1, 1, 1, 1,
-1.204898, 0.9522492, -1.656205, 1, 1, 1, 1, 1,
-1.201023, 1.399023, 0.4234569, 1, 1, 1, 1, 1,
-1.192473, 0.01214606, -0.8333653, 1, 1, 1, 1, 1,
-1.184847, -0.5366114, -3.674426, 1, 1, 1, 1, 1,
-1.179922, -0.2541409, -2.37249, 1, 1, 1, 1, 1,
-1.178923, 1.353252, -0.8320418, 1, 1, 1, 1, 1,
-1.176029, 0.4681513, -0.09244207, 1, 1, 1, 1, 1,
-1.171494, 1.503739, -1.895598, 1, 1, 1, 1, 1,
-1.16617, -0.3928716, -2.959983, 1, 1, 1, 1, 1,
-1.164913, -0.2095539, -0.8219434, 1, 1, 1, 1, 1,
-1.155003, 0.3991047, -0.6772399, 1, 1, 1, 1, 1,
-1.154976, -0.773515, -2.089078, 1, 1, 1, 1, 1,
-1.153969, 0.9828765, -0.8709387, 1, 1, 1, 1, 1,
-1.153398, 0.1555674, -2.122257, 1, 1, 1, 1, 1,
-1.151211, 0.1804675, -1.267872, 0, 0, 1, 1, 1,
-1.148696, -1.096768, -1.733345, 1, 0, 0, 1, 1,
-1.148677, -0.3721001, -1.696925, 1, 0, 0, 1, 1,
-1.139425, -0.3409463, -1.822193, 1, 0, 0, 1, 1,
-1.132139, 1.479368, 0.01106984, 1, 0, 0, 1, 1,
-1.131884, 1.565683, -1.624548, 1, 0, 0, 1, 1,
-1.128363, -0.7654258, -1.181847, 0, 0, 0, 1, 1,
-1.12696, -0.1604875, -0.9776062, 0, 0, 0, 1, 1,
-1.122491, 0.012936, -1.241871, 0, 0, 0, 1, 1,
-1.114419, -0.5038733, -3.15987, 0, 0, 0, 1, 1,
-1.104591, -1.47269, -1.983394, 0, 0, 0, 1, 1,
-1.080909, 0.5395989, -2.363629, 0, 0, 0, 1, 1,
-1.075981, -0.9994598, -1.691373, 0, 0, 0, 1, 1,
-1.074586, -0.6481054, -1.278355, 1, 1, 1, 1, 1,
-1.072151, -0.1554456, -1.380753, 1, 1, 1, 1, 1,
-1.065836, 0.2760103, -2.710768, 1, 1, 1, 1, 1,
-1.063452, -1.087958, -0.337283, 1, 1, 1, 1, 1,
-1.054709, 0.1876673, -2.143404, 1, 1, 1, 1, 1,
-1.054398, 0.7040126, -1.476625, 1, 1, 1, 1, 1,
-1.05251, -0.6945285, -0.5704048, 1, 1, 1, 1, 1,
-1.052163, -0.8886974, -2.029825, 1, 1, 1, 1, 1,
-1.051893, 1.213501, -0.4168611, 1, 1, 1, 1, 1,
-1.039645, -0.618099, -2.43127, 1, 1, 1, 1, 1,
-1.037139, -0.9945837, -1.460225, 1, 1, 1, 1, 1,
-1.0236, -0.02011701, -2.132631, 1, 1, 1, 1, 1,
-1.011731, -0.1213717, -3.112663, 1, 1, 1, 1, 1,
-1.010619, -0.3981701, -2.031405, 1, 1, 1, 1, 1,
-0.9982302, 1.293091, -1.424176, 1, 1, 1, 1, 1,
-0.998136, -0.02952724, -3.068592, 0, 0, 1, 1, 1,
-0.9957181, 1.233039, -1.039991, 1, 0, 0, 1, 1,
-0.9913461, -1.22564, -3.594066, 1, 0, 0, 1, 1,
-0.9872835, -1.790886, -0.007175354, 1, 0, 0, 1, 1,
-0.9750037, 0.4372286, -0.7992008, 1, 0, 0, 1, 1,
-0.9736611, 1.206118, -2.544654, 1, 0, 0, 1, 1,
-0.9720682, 0.7080426, -0.3359002, 0, 0, 0, 1, 1,
-0.9313622, -0.3540625, -3.411579, 0, 0, 0, 1, 1,
-0.9165769, -0.6553556, -2.341703, 0, 0, 0, 1, 1,
-0.9154011, -0.5578597, -2.06308, 0, 0, 0, 1, 1,
-0.9135147, -0.1695211, -2.123854, 0, 0, 0, 1, 1,
-0.9114141, 0.2704015, -1.441339, 0, 0, 0, 1, 1,
-0.9111081, 0.8298993, -0.7436824, 0, 0, 0, 1, 1,
-0.9106513, -0.2229028, -0.8601438, 1, 1, 1, 1, 1,
-0.9015323, 2.029083, 0.3871365, 1, 1, 1, 1, 1,
-0.896418, 1.554585, 0.3016886, 1, 1, 1, 1, 1,
-0.8924842, 0.4262349, -0.7991687, 1, 1, 1, 1, 1,
-0.8913625, -1.619748, -3.432489, 1, 1, 1, 1, 1,
-0.8896568, -0.4200132, -1.769654, 1, 1, 1, 1, 1,
-0.8895084, -0.4642169, -2.095335, 1, 1, 1, 1, 1,
-0.8861035, -0.3920807, -0.9720254, 1, 1, 1, 1, 1,
-0.8854782, 0.02699543, -1.443331, 1, 1, 1, 1, 1,
-0.8788902, -0.09808115, -1.195336, 1, 1, 1, 1, 1,
-0.8781161, 1.230233, -1.720479, 1, 1, 1, 1, 1,
-0.878018, 1.115571, 0.2204297, 1, 1, 1, 1, 1,
-0.8772014, 2.53215, 0.3173412, 1, 1, 1, 1, 1,
-0.8760791, -0.402119, -2.79178, 1, 1, 1, 1, 1,
-0.8718648, -1.016709, -3.499532, 1, 1, 1, 1, 1,
-0.8710973, -1.099211, -3.808505, 0, 0, 1, 1, 1,
-0.8586407, 1.337599, 0.4797936, 1, 0, 0, 1, 1,
-0.8482867, 0.7839579, -2.2988, 1, 0, 0, 1, 1,
-0.8467237, -0.1571181, -1.40388, 1, 0, 0, 1, 1,
-0.8463227, 1.920251, -0.4498488, 1, 0, 0, 1, 1,
-0.845662, -0.2699071, -2.306827, 1, 0, 0, 1, 1,
-0.8428009, 0.1391845, -1.711361, 0, 0, 0, 1, 1,
-0.841491, 0.484595, -1.60123, 0, 0, 0, 1, 1,
-0.8406922, -0.2583006, -1.383706, 0, 0, 0, 1, 1,
-0.8391848, -0.2881268, -2.480311, 0, 0, 0, 1, 1,
-0.838511, -0.1284415, -1.658097, 0, 0, 0, 1, 1,
-0.8379447, 1.37601, 1.180234, 0, 0, 0, 1, 1,
-0.8336572, -1.588852, -3.740966, 0, 0, 0, 1, 1,
-0.8310285, 0.04026363, -1.185783, 1, 1, 1, 1, 1,
-0.8283877, -2.213344, -2.101353, 1, 1, 1, 1, 1,
-0.8273709, -3.147668, -3.016032, 1, 1, 1, 1, 1,
-0.8243128, -0.0899536, -1.625626, 1, 1, 1, 1, 1,
-0.8241525, 1.494598, -2.589129, 1, 1, 1, 1, 1,
-0.8218353, -1.062919, -2.653548, 1, 1, 1, 1, 1,
-0.812411, -0.4494147, -1.273648, 1, 1, 1, 1, 1,
-0.8068051, 1.230537, -0.4981613, 1, 1, 1, 1, 1,
-0.8061267, 0.3591421, -0.7305565, 1, 1, 1, 1, 1,
-0.8016914, 0.376249, -1.923241, 1, 1, 1, 1, 1,
-0.8009005, -0.8365666, -0.8000057, 1, 1, 1, 1, 1,
-0.7996771, 0.651989, 1.109756, 1, 1, 1, 1, 1,
-0.7991445, -0.1762228, -3.839549, 1, 1, 1, 1, 1,
-0.7963176, 0.4130311, -1.04868, 1, 1, 1, 1, 1,
-0.796125, -1.005308, -2.339502, 1, 1, 1, 1, 1,
-0.7955239, -0.974902, -4.003521, 0, 0, 1, 1, 1,
-0.7949752, -0.7028134, -2.248783, 1, 0, 0, 1, 1,
-0.7895654, -0.2046663, 0.04732518, 1, 0, 0, 1, 1,
-0.789399, 0.6831266, -1.930884, 1, 0, 0, 1, 1,
-0.7840362, 0.6067575, -1.070482, 1, 0, 0, 1, 1,
-0.7815986, 1.591528, -0.9095871, 1, 0, 0, 1, 1,
-0.7770925, -1.030261, -4.091499, 0, 0, 0, 1, 1,
-0.7761494, -0.5854169, -1.613848, 0, 0, 0, 1, 1,
-0.775629, -0.3406538, -3.512837, 0, 0, 0, 1, 1,
-0.7687112, -0.9476811, -0.5247146, 0, 0, 0, 1, 1,
-0.7657475, 0.7948351, -0.7672547, 0, 0, 0, 1, 1,
-0.7554966, 0.3620403, -1.377419, 0, 0, 0, 1, 1,
-0.7357058, 1.54447, 0.6948015, 0, 0, 0, 1, 1,
-0.7324417, 1.901601, 0.3448847, 1, 1, 1, 1, 1,
-0.724387, -0.1349442, -0.9022608, 1, 1, 1, 1, 1,
-0.7210802, 0.9615219, -0.9090564, 1, 1, 1, 1, 1,
-0.7154047, 0.8999937, -0.9026359, 1, 1, 1, 1, 1,
-0.7115208, -0.9169618, -2.6314, 1, 1, 1, 1, 1,
-0.7104697, 0.2584808, -2.471631, 1, 1, 1, 1, 1,
-0.7099791, -1.618805, -2.626515, 1, 1, 1, 1, 1,
-0.7040485, -3.001806, -4.443385, 1, 1, 1, 1, 1,
-0.7031674, -0.06383359, -0.08152451, 1, 1, 1, 1, 1,
-0.6968029, 0.1404101, 0.2419886, 1, 1, 1, 1, 1,
-0.6958168, -1.548719, -3.855314, 1, 1, 1, 1, 1,
-0.695536, 1.931095, 0.2573099, 1, 1, 1, 1, 1,
-0.6951728, -1.44407, -2.556398, 1, 1, 1, 1, 1,
-0.6906332, -0.7681139, -1.882836, 1, 1, 1, 1, 1,
-0.6897001, -0.4947996, -2.133616, 1, 1, 1, 1, 1,
-0.684601, 0.558072, -1.392264, 0, 0, 1, 1, 1,
-0.6838023, 0.6332766, -1.028764, 1, 0, 0, 1, 1,
-0.6832573, 1.040933, -0.3427048, 1, 0, 0, 1, 1,
-0.6761282, -1.018831, -2.425956, 1, 0, 0, 1, 1,
-0.674983, 0.2921371, -3.740716, 1, 0, 0, 1, 1,
-0.672884, -0.9653903, -1.249552, 1, 0, 0, 1, 1,
-0.6671447, 0.2019497, -0.1794184, 0, 0, 0, 1, 1,
-0.6635487, 0.3134315, -0.5178812, 0, 0, 0, 1, 1,
-0.6607717, -0.1704905, -2.708283, 0, 0, 0, 1, 1,
-0.6536966, -0.5919601, -2.97136, 0, 0, 0, 1, 1,
-0.6529856, 0.5817707, 0.1818911, 0, 0, 0, 1, 1,
-0.6486379, -1.158246, -1.009364, 0, 0, 0, 1, 1,
-0.6435962, -0.3506048, -2.376971, 0, 0, 0, 1, 1,
-0.640655, 0.09305322, -2.682294, 1, 1, 1, 1, 1,
-0.6379637, 0.6097381, -0.8223817, 1, 1, 1, 1, 1,
-0.6324958, 0.2105831, -1.135107, 1, 1, 1, 1, 1,
-0.6317773, 0.3304823, -1.501001, 1, 1, 1, 1, 1,
-0.6257761, 0.5408403, -1.914183, 1, 1, 1, 1, 1,
-0.6237029, 0.3852611, -1.660728, 1, 1, 1, 1, 1,
-0.6161571, -0.5328662, -1.878085, 1, 1, 1, 1, 1,
-0.6161528, -0.5636361, -2.344972, 1, 1, 1, 1, 1,
-0.6160011, -0.2544129, -1.202916, 1, 1, 1, 1, 1,
-0.6148008, 1.018554, -0.4448426, 1, 1, 1, 1, 1,
-0.6142446, 0.1814241, -0.8216706, 1, 1, 1, 1, 1,
-0.6061619, 0.5733112, -0.5912399, 1, 1, 1, 1, 1,
-0.6036075, 0.2261599, -1.222905, 1, 1, 1, 1, 1,
-0.6023746, 0.2211486, -1.979414, 1, 1, 1, 1, 1,
-0.5960186, -1.265898, -2.148828, 1, 1, 1, 1, 1,
-0.5914771, -0.9741368, -3.633397, 0, 0, 1, 1, 1,
-0.5889349, 1.944754, 1.126383, 1, 0, 0, 1, 1,
-0.5858263, 0.06588808, 0.01239274, 1, 0, 0, 1, 1,
-0.5848849, -1.037633, -3.493299, 1, 0, 0, 1, 1,
-0.5800859, -0.8387204, -3.416174, 1, 0, 0, 1, 1,
-0.5799244, -1.177946, -2.092362, 1, 0, 0, 1, 1,
-0.5788697, 0.4296908, -0.3715549, 0, 0, 0, 1, 1,
-0.578457, -1.493715, -3.552485, 0, 0, 0, 1, 1,
-0.5671673, 0.1457145, -1.729528, 0, 0, 0, 1, 1,
-0.5657148, 0.2218686, -1.410877, 0, 0, 0, 1, 1,
-0.5617863, -0.7069972, -1.444222, 0, 0, 0, 1, 1,
-0.5613053, -0.1057333, -1.204652, 0, 0, 0, 1, 1,
-0.5602982, -0.5197263, -0.879758, 0, 0, 0, 1, 1,
-0.5581518, -0.08609397, -1.57322, 1, 1, 1, 1, 1,
-0.5537394, 0.3025578, -0.04039363, 1, 1, 1, 1, 1,
-0.5480179, -0.7534753, -1.425352, 1, 1, 1, 1, 1,
-0.547489, 0.1021636, -1.632733, 1, 1, 1, 1, 1,
-0.5426418, 0.1952399, -1.044638, 1, 1, 1, 1, 1,
-0.541026, -1.919721, -3.029647, 1, 1, 1, 1, 1,
-0.5400195, 0.3864619, -1.666971, 1, 1, 1, 1, 1,
-0.5391085, -0.02050026, -2.884417, 1, 1, 1, 1, 1,
-0.5293059, 0.3993084, 0.1522523, 1, 1, 1, 1, 1,
-0.5237372, -1.84628, -2.788569, 1, 1, 1, 1, 1,
-0.5229604, -0.48518, -2.538802, 1, 1, 1, 1, 1,
-0.5213957, -1.419371, -3.063468, 1, 1, 1, 1, 1,
-0.5132612, -0.414884, -2.407541, 1, 1, 1, 1, 1,
-0.506205, -1.148126, -2.874725, 1, 1, 1, 1, 1,
-0.5037526, -1.153748, -2.105212, 1, 1, 1, 1, 1,
-0.4995653, -0.01405306, -0.6404963, 0, 0, 1, 1, 1,
-0.4974698, 0.307114, -1.473164, 1, 0, 0, 1, 1,
-0.496159, 0.01661845, -1.627964, 1, 0, 0, 1, 1,
-0.487128, 1.963258, -0.5973716, 1, 0, 0, 1, 1,
-0.4826843, -0.1318508, -0.3079793, 1, 0, 0, 1, 1,
-0.4795967, 1.228543, -0.2047622, 1, 0, 0, 1, 1,
-0.4785347, -0.7095429, -3.07057, 0, 0, 0, 1, 1,
-0.4726118, 0.1464078, -1.463189, 0, 0, 0, 1, 1,
-0.4720456, 0.1696714, -1.240479, 0, 0, 0, 1, 1,
-0.4712667, 0.03052131, -2.056691, 0, 0, 0, 1, 1,
-0.470372, 0.2863773, 1.657377, 0, 0, 0, 1, 1,
-0.4694771, -0.1528212, -4.204401, 0, 0, 0, 1, 1,
-0.4671596, -1.187478, -3.00198, 0, 0, 0, 1, 1,
-0.465194, -1.367826, -5.156281, 1, 1, 1, 1, 1,
-0.4635112, 0.2244904, -0.6215891, 1, 1, 1, 1, 1,
-0.4613859, 0.4692239, -2.143404, 1, 1, 1, 1, 1,
-0.453044, 0.005461539, -3.391097, 1, 1, 1, 1, 1,
-0.4526916, -0.1691456, -2.068521, 1, 1, 1, 1, 1,
-0.4518837, 0.002062988, -1.088677, 1, 1, 1, 1, 1,
-0.4502573, 2.946706, -0.002308128, 1, 1, 1, 1, 1,
-0.4437984, 0.9090095, -1.246655, 1, 1, 1, 1, 1,
-0.4431909, 0.08598661, 0.1855032, 1, 1, 1, 1, 1,
-0.4408514, 0.8794159, 1.671543, 1, 1, 1, 1, 1,
-0.4375221, -0.3946966, -1.317882, 1, 1, 1, 1, 1,
-0.4370103, 0.9942816, -0.3718712, 1, 1, 1, 1, 1,
-0.4351625, 0.1080974, -1.287542, 1, 1, 1, 1, 1,
-0.4344876, 0.2011189, -1.950709, 1, 1, 1, 1, 1,
-0.4342501, -1.03625, -2.544781, 1, 1, 1, 1, 1,
-0.4322921, 0.6231596, -0.152355, 0, 0, 1, 1, 1,
-0.4319426, -0.3023815, -3.795505, 1, 0, 0, 1, 1,
-0.4281349, 0.3504561, -0.9082017, 1, 0, 0, 1, 1,
-0.427726, 1.116457, -0.9733484, 1, 0, 0, 1, 1,
-0.4233111, -0.3507721, -1.460003, 1, 0, 0, 1, 1,
-0.4219077, -0.5156805, -3.337928, 1, 0, 0, 1, 1,
-0.421027, -1.20813, -3.134875, 0, 0, 0, 1, 1,
-0.4170127, -0.5911151, -3.250486, 0, 0, 0, 1, 1,
-0.412943, -0.6739101, -1.226649, 0, 0, 0, 1, 1,
-0.4128441, 1.534512, -0.5868034, 0, 0, 0, 1, 1,
-0.4013841, 0.9772937, -0.08515217, 0, 0, 0, 1, 1,
-0.3996627, 1.451717, -0.1374753, 0, 0, 0, 1, 1,
-0.3980915, -0.3614601, -2.222981, 0, 0, 0, 1, 1,
-0.396065, 2.218511, 0.6056518, 1, 1, 1, 1, 1,
-0.3942572, -1.058218, -4.308939, 1, 1, 1, 1, 1,
-0.391383, -0.7033225, -2.407181, 1, 1, 1, 1, 1,
-0.3892488, -2.146005, -3.767216, 1, 1, 1, 1, 1,
-0.3889434, 2.14188, -0.999043, 1, 1, 1, 1, 1,
-0.3858057, 0.4387569, -0.3069254, 1, 1, 1, 1, 1,
-0.3854031, 0.4890833, -1.276389, 1, 1, 1, 1, 1,
-0.3845516, 2.342233, -0.03796067, 1, 1, 1, 1, 1,
-0.3787222, -0.4083945, -1.805827, 1, 1, 1, 1, 1,
-0.3784064, 0.6139677, -0.4480276, 1, 1, 1, 1, 1,
-0.3778594, -1.037806, -3.390646, 1, 1, 1, 1, 1,
-0.372886, 0.8142834, 0.4684856, 1, 1, 1, 1, 1,
-0.3704971, 0.1136596, -0.8956921, 1, 1, 1, 1, 1,
-0.3679335, 0.645904, -1.571619, 1, 1, 1, 1, 1,
-0.3673013, -0.553339, -3.618379, 1, 1, 1, 1, 1,
-0.3566685, 1.052286, -2.400807, 0, 0, 1, 1, 1,
-0.3500849, -0.7411832, -1.696944, 1, 0, 0, 1, 1,
-0.3482378, 2.111808, 0.352957, 1, 0, 0, 1, 1,
-0.3479196, -0.9409454, -2.220763, 1, 0, 0, 1, 1,
-0.3434571, -0.6110257, -2.61724, 1, 0, 0, 1, 1,
-0.3427179, 0.09613135, -0.1269179, 1, 0, 0, 1, 1,
-0.3385151, 0.9848306, 1.63117, 0, 0, 0, 1, 1,
-0.3356226, -0.9256757, -2.241391, 0, 0, 0, 1, 1,
-0.3346638, -0.4852559, -2.588899, 0, 0, 0, 1, 1,
-0.3301175, -0.6491615, -3.23075, 0, 0, 0, 1, 1,
-0.3299136, 0.9178568, 0.5856672, 0, 0, 0, 1, 1,
-0.3299021, -0.8337891, -3.062145, 0, 0, 0, 1, 1,
-0.3274529, -0.3352496, -2.696553, 0, 0, 0, 1, 1,
-0.3157823, -1.967837, -2.672598, 1, 1, 1, 1, 1,
-0.314804, -1.343809, -3.699046, 1, 1, 1, 1, 1,
-0.3144148, -1.455266, -1.963268, 1, 1, 1, 1, 1,
-0.3097675, 0.2341312, -0.8887368, 1, 1, 1, 1, 1,
-0.3074927, 1.804314, -1.136917, 1, 1, 1, 1, 1,
-0.3068786, 1.300293, 0.15412, 1, 1, 1, 1, 1,
-0.3013369, -0.5188916, -1.759466, 1, 1, 1, 1, 1,
-0.298656, 0.3965874, -1.282899, 1, 1, 1, 1, 1,
-0.2985567, -0.3877836, -2.621953, 1, 1, 1, 1, 1,
-0.2957846, 0.8009772, 1.034271, 1, 1, 1, 1, 1,
-0.2882693, 0.09870051, -0.6360312, 1, 1, 1, 1, 1,
-0.2851838, -0.6695347, -4.163202, 1, 1, 1, 1, 1,
-0.2828165, 1.010838, 0.9974889, 1, 1, 1, 1, 1,
-0.2806607, 0.5807458, -1.921818, 1, 1, 1, 1, 1,
-0.2799016, -0.9216835, -2.288361, 1, 1, 1, 1, 1,
-0.2730126, 0.8772883, 0.3293511, 0, 0, 1, 1, 1,
-0.2692188, 2.25062, 1.196991, 1, 0, 0, 1, 1,
-0.2652243, -1.214021, -2.189718, 1, 0, 0, 1, 1,
-0.2611023, 0.7969227, 0.02837898, 1, 0, 0, 1, 1,
-0.2595528, -0.04804307, -1.724542, 1, 0, 0, 1, 1,
-0.251981, 0.1857519, -1.252582, 1, 0, 0, 1, 1,
-0.2517909, 1.944861, 0.1403206, 0, 0, 0, 1, 1,
-0.2497114, -1.419474, -1.329019, 0, 0, 0, 1, 1,
-0.2496756, 0.103801, -0.9650975, 0, 0, 0, 1, 1,
-0.2473412, 0.005916368, -0.9068447, 0, 0, 0, 1, 1,
-0.2429709, -1.673664, -2.727647, 0, 0, 0, 1, 1,
-0.2400739, -0.7658283, -2.369926, 0, 0, 0, 1, 1,
-0.2391408, -1.03683, -2.981945, 0, 0, 0, 1, 1,
-0.2371238, -0.1794735, -2.26076, 1, 1, 1, 1, 1,
-0.2301781, -0.668244, -3.948895, 1, 1, 1, 1, 1,
-0.2290929, 2.452606, -0.2795356, 1, 1, 1, 1, 1,
-0.2275454, 0.8175138, -0.592312, 1, 1, 1, 1, 1,
-0.2251537, -0.2629268, -3.748435, 1, 1, 1, 1, 1,
-0.2199971, 0.4574852, -0.7825744, 1, 1, 1, 1, 1,
-0.2182793, -0.6771635, -2.801739, 1, 1, 1, 1, 1,
-0.216068, -0.4150864, -3.019835, 1, 1, 1, 1, 1,
-0.2149477, -0.2589899, -3.083956, 1, 1, 1, 1, 1,
-0.2148545, 0.3889238, 0.4914111, 1, 1, 1, 1, 1,
-0.2140909, -0.01801996, -2.625096, 1, 1, 1, 1, 1,
-0.2105519, -0.294557, -2.363236, 1, 1, 1, 1, 1,
-0.2051904, -0.8588615, -3.481937, 1, 1, 1, 1, 1,
-0.2051422, -1.022316, -2.145828, 1, 1, 1, 1, 1,
-0.2044225, 0.7812669, 0.7414683, 1, 1, 1, 1, 1,
-0.201263, 0.008977408, -0.6134922, 0, 0, 1, 1, 1,
-0.2003719, -0.3558786, -3.34894, 1, 0, 0, 1, 1,
-0.2000609, 0.1894927, -1.857608, 1, 0, 0, 1, 1,
-0.1991227, 0.6909622, 0.6887234, 1, 0, 0, 1, 1,
-0.1989407, 0.6875554, -1.093785, 1, 0, 0, 1, 1,
-0.1968715, -1.847293, -3.895597, 1, 0, 0, 1, 1,
-0.19602, 0.1900541, -0.151155, 0, 0, 0, 1, 1,
-0.18958, 1.369756, 0.2278701, 0, 0, 0, 1, 1,
-0.187789, 2.264391, -0.9181785, 0, 0, 0, 1, 1,
-0.187079, 2.120895, 0.3157474, 0, 0, 0, 1, 1,
-0.1870696, -1.006278, -2.935745, 0, 0, 0, 1, 1,
-0.1832281, -0.5348285, -2.616007, 0, 0, 0, 1, 1,
-0.1820571, 0.4305353, 0.631578, 0, 0, 0, 1, 1,
-0.181927, 2.570894, 2.209509, 1, 1, 1, 1, 1,
-0.1809929, -1.13416, -4.928177, 1, 1, 1, 1, 1,
-0.1804206, -0.1924561, -1.51191, 1, 1, 1, 1, 1,
-0.1738313, -0.8726619, -5.616408, 1, 1, 1, 1, 1,
-0.1707183, 0.4233472, -1.432487, 1, 1, 1, 1, 1,
-0.1696112, 1.54138, 0.1880895, 1, 1, 1, 1, 1,
-0.1680048, 0.02364702, -1.179025, 1, 1, 1, 1, 1,
-0.1667653, 0.1715725, 0.134379, 1, 1, 1, 1, 1,
-0.1664438, -0.3214344, -1.70584, 1, 1, 1, 1, 1,
-0.163282, -0.5110061, -2.002533, 1, 1, 1, 1, 1,
-0.1622079, 0.3959342, 0.001130445, 1, 1, 1, 1, 1,
-0.1616624, -0.3022878, -2.939491, 1, 1, 1, 1, 1,
-0.1607408, 0.7740558, 0.03751235, 1, 1, 1, 1, 1,
-0.1579866, 1.156339, 0.580097, 1, 1, 1, 1, 1,
-0.1578202, 0.9481388, -0.1802612, 1, 1, 1, 1, 1,
-0.152642, -1.124689, -4.400532, 0, 0, 1, 1, 1,
-0.1522333, -1.996584, -3.281085, 1, 0, 0, 1, 1,
-0.1521688, -0.3983396, -2.775686, 1, 0, 0, 1, 1,
-0.1520115, -1.070055, -3.065448, 1, 0, 0, 1, 1,
-0.1514215, 0.2757598, -1.036615, 1, 0, 0, 1, 1,
-0.1465876, 0.698669, 0.4644089, 1, 0, 0, 1, 1,
-0.1465639, -0.06374469, -2.248595, 0, 0, 0, 1, 1,
-0.1422906, 0.08756468, -1.681369, 0, 0, 0, 1, 1,
-0.1390755, -0.2107479, -3.383139, 0, 0, 0, 1, 1,
-0.134296, -0.2187131, -1.327861, 0, 0, 0, 1, 1,
-0.1341346, 0.666918, 1.162978, 0, 0, 0, 1, 1,
-0.1319655, -0.4545466, -2.525684, 0, 0, 0, 1, 1,
-0.1298375, 0.04832242, -0.6066641, 0, 0, 0, 1, 1,
-0.1289972, 1.006942, -0.5834998, 1, 1, 1, 1, 1,
-0.1277814, -0.9613526, -3.109092, 1, 1, 1, 1, 1,
-0.1267512, 0.5535387, 0.6853407, 1, 1, 1, 1, 1,
-0.1267078, -1.209764, -3.233799, 1, 1, 1, 1, 1,
-0.1237558, -0.03904004, -1.911926, 1, 1, 1, 1, 1,
-0.1204138, 1.508748, 1.185695, 1, 1, 1, 1, 1,
-0.1201245, -0.4234325, -3.738139, 1, 1, 1, 1, 1,
-0.1187787, 1.420885, -1.58517, 1, 1, 1, 1, 1,
-0.1129084, -0.436121, -1.829467, 1, 1, 1, 1, 1,
-0.1098743, 0.2248077, -1.10092, 1, 1, 1, 1, 1,
-0.109454, 0.11622, -0.142309, 1, 1, 1, 1, 1,
-0.107586, 0.7502047, -1.344247, 1, 1, 1, 1, 1,
-0.1055339, 0.1366683, 1.298973, 1, 1, 1, 1, 1,
-0.1053453, -1.288177, -4.099588, 1, 1, 1, 1, 1,
-0.1040638, -0.5400268, -4.330633, 1, 1, 1, 1, 1,
-0.1034747, -0.31387, -2.389796, 0, 0, 1, 1, 1,
-0.1031481, -1.087795, -2.206158, 1, 0, 0, 1, 1,
-0.09813063, 1.254053, -0.6577461, 1, 0, 0, 1, 1,
-0.09785578, 0.652815, -0.3646994, 1, 0, 0, 1, 1,
-0.09523299, 1.153701, -0.2263795, 1, 0, 0, 1, 1,
-0.09448178, 0.8329978, 0.2921923, 1, 0, 0, 1, 1,
-0.09058824, 1.498437, -0.6092848, 0, 0, 0, 1, 1,
-0.08987103, -1.083052, -2.998411, 0, 0, 0, 1, 1,
-0.08441176, -0.5923499, -2.982261, 0, 0, 0, 1, 1,
-0.07927589, -1.112942, -2.448694, 0, 0, 0, 1, 1,
-0.07521739, 0.7465814, 0.02778149, 0, 0, 0, 1, 1,
-0.0732832, 1.758623, -0.5297598, 0, 0, 0, 1, 1,
-0.07261144, -0.02220685, -2.959517, 0, 0, 0, 1, 1,
-0.06951664, -0.7432585, -2.071885, 1, 1, 1, 1, 1,
-0.0684765, 0.03977993, -0.4055569, 1, 1, 1, 1, 1,
-0.06819595, 0.1592251, 0.5115543, 1, 1, 1, 1, 1,
-0.06629542, 0.4692988, 0.07065882, 1, 1, 1, 1, 1,
-0.06576746, 0.7676341, -0.3776374, 1, 1, 1, 1, 1,
-0.06304445, 1.733122, -0.4370025, 1, 1, 1, 1, 1,
-0.04970526, -0.8438029, -4.327542, 1, 1, 1, 1, 1,
-0.0471761, -1.091846, -3.600801, 1, 1, 1, 1, 1,
-0.04419656, 1.036955, -1.203344, 1, 1, 1, 1, 1,
-0.04037641, -0.1302842, -2.761278, 1, 1, 1, 1, 1,
-0.03937519, 1.62374, -0.05883332, 1, 1, 1, 1, 1,
-0.03836424, 0.6039798, -1.610714, 1, 1, 1, 1, 1,
-0.03717509, 1.140043, -0.9802529, 1, 1, 1, 1, 1,
-0.03648083, 0.765484, 0.6744598, 1, 1, 1, 1, 1,
-0.03499997, -1.405738, -4.145135, 1, 1, 1, 1, 1,
-0.03492942, 0.1465682, 0.1294184, 0, 0, 1, 1, 1,
-0.03492805, 0.43547, 0.5937344, 1, 0, 0, 1, 1,
-0.03396899, 0.5808137, -0.7159072, 1, 0, 0, 1, 1,
-0.03253878, -0.3375764, -5.397867, 1, 0, 0, 1, 1,
-0.03103779, -0.7576072, -4.719261, 1, 0, 0, 1, 1,
-0.02930344, -0.3370681, -2.15521, 1, 0, 0, 1, 1,
-0.02467041, 1.110267, 1.990268, 0, 0, 0, 1, 1,
-0.01864255, -0.3982185, -2.746158, 0, 0, 0, 1, 1,
-0.01646764, 1.706051, -0.771239, 0, 0, 0, 1, 1,
-0.01527336, 0.9665095, -1.730202, 0, 0, 0, 1, 1,
-0.01291187, -0.4135712, -4.421584, 0, 0, 0, 1, 1,
-0.005995497, 0.03235525, -0.5148782, 0, 0, 0, 1, 1,
-0.004408977, -1.503416, -5.179451, 0, 0, 0, 1, 1,
-0.001047332, -0.6495601, -4.027998, 1, 1, 1, 1, 1,
0.004922277, 0.09935519, -0.8430901, 1, 1, 1, 1, 1,
0.01798492, -0.36796, 2.762996, 1, 1, 1, 1, 1,
0.02282783, -0.5628052, 4.323835, 1, 1, 1, 1, 1,
0.02574546, 0.3110861, 2.032798, 1, 1, 1, 1, 1,
0.03072416, -0.6182137, 2.280518, 1, 1, 1, 1, 1,
0.0335234, -2.555326, 3.406526, 1, 1, 1, 1, 1,
0.03635829, 0.6038699, 0.8545629, 1, 1, 1, 1, 1,
0.03752767, 0.2048246, -1.010668, 1, 1, 1, 1, 1,
0.04323173, -0.7652236, 3.691554, 1, 1, 1, 1, 1,
0.04366761, -0.5191125, 2.280887, 1, 1, 1, 1, 1,
0.04473906, 2.055043, -0.1423487, 1, 1, 1, 1, 1,
0.04982432, 0.8159671, 0.7399557, 1, 1, 1, 1, 1,
0.05003105, 0.4337134, -2.528703, 1, 1, 1, 1, 1,
0.0501387, -0.4288939, 3.146976, 1, 1, 1, 1, 1,
0.05058121, 2.590474, 2.363799, 0, 0, 1, 1, 1,
0.0561693, -0.9620326, 3.777117, 1, 0, 0, 1, 1,
0.06175987, 1.19328, -0.7236257, 1, 0, 0, 1, 1,
0.06518137, -1.825922, 3.601707, 1, 0, 0, 1, 1,
0.0660356, 0.09703311, 1.383694, 1, 0, 0, 1, 1,
0.067368, 1.046452, -1.450309, 1, 0, 0, 1, 1,
0.06995367, 0.5354438, 0.309976, 0, 0, 0, 1, 1,
0.07220087, 0.05131691, -0.53779, 0, 0, 0, 1, 1,
0.07495163, 0.6810475, 1.425945, 0, 0, 0, 1, 1,
0.0755251, 0.06462599, -0.1641434, 0, 0, 0, 1, 1,
0.07620353, -0.348935, 2.422377, 0, 0, 0, 1, 1,
0.07650611, -1.536671, 2.101261, 0, 0, 0, 1, 1,
0.0772282, -0.2642511, 3.579366, 0, 0, 0, 1, 1,
0.08211036, 0.5483602, -0.2873538, 1, 1, 1, 1, 1,
0.08448099, 1.35361, -0.5417057, 1, 1, 1, 1, 1,
0.08493578, -0.8543085, 2.303635, 1, 1, 1, 1, 1,
0.08511028, -0.1652489, 3.331482, 1, 1, 1, 1, 1,
0.09106893, 0.7927251, 0.0860878, 1, 1, 1, 1, 1,
0.09264005, 0.3587823, 0.1808515, 1, 1, 1, 1, 1,
0.0932766, -1.811623, 3.089558, 1, 1, 1, 1, 1,
0.09328035, -1.197655, 3.237579, 1, 1, 1, 1, 1,
0.09425806, -0.1573808, 3.57388, 1, 1, 1, 1, 1,
0.09792735, -1.234843, 2.751071, 1, 1, 1, 1, 1,
0.1000122, 0.1870074, 1.67316, 1, 1, 1, 1, 1,
0.1010999, -0.6631815, 3.568084, 1, 1, 1, 1, 1,
0.1035915, -0.8905477, 2.57794, 1, 1, 1, 1, 1,
0.1048652, -1.5548, 4.16075, 1, 1, 1, 1, 1,
0.1057472, 0.2697892, 0.5853457, 1, 1, 1, 1, 1,
0.1110739, -1.422085, 4.526733, 0, 0, 1, 1, 1,
0.1146364, 1.088713, -1.781737, 1, 0, 0, 1, 1,
0.1206394, -2.174506, 3.177521, 1, 0, 0, 1, 1,
0.1207808, -0.02653644, 0.7443398, 1, 0, 0, 1, 1,
0.1366349, 1.668225, 1.201294, 1, 0, 0, 1, 1,
0.1402762, 0.1593247, -0.7352712, 1, 0, 0, 1, 1,
0.1446525, 0.09770764, 1.33398, 0, 0, 0, 1, 1,
0.1446695, 0.2100403, -0.9037064, 0, 0, 0, 1, 1,
0.1505053, -1.25247, 2.769266, 0, 0, 0, 1, 1,
0.1544767, 0.166021, 1.526128, 0, 0, 0, 1, 1,
0.1597077, 0.6028621, 1.198523, 0, 0, 0, 1, 1,
0.1613095, -2.706338, 3.246974, 0, 0, 0, 1, 1,
0.1622811, 0.4847821, 0.4758959, 0, 0, 0, 1, 1,
0.1627571, -0.6164685, 2.993097, 1, 1, 1, 1, 1,
0.1636244, -1.351297, 4.01508, 1, 1, 1, 1, 1,
0.1744666, 0.9173539, -0.4607147, 1, 1, 1, 1, 1,
0.1761771, -1.169993, 2.917576, 1, 1, 1, 1, 1,
0.1781896, -0.002606092, 0.3209693, 1, 1, 1, 1, 1,
0.178816, 0.4554218, 2.081916, 1, 1, 1, 1, 1,
0.1799831, -0.5225342, 2.711371, 1, 1, 1, 1, 1,
0.1827482, 0.998267, -0.4088947, 1, 1, 1, 1, 1,
0.188799, 0.2344664, 0.7233192, 1, 1, 1, 1, 1,
0.1919493, 1.020328, -0.4730048, 1, 1, 1, 1, 1,
0.1920416, 0.0625038, 0.2160542, 1, 1, 1, 1, 1,
0.1932053, 0.2391953, -0.7535122, 1, 1, 1, 1, 1,
0.1934713, 0.7560548, -0.6983546, 1, 1, 1, 1, 1,
0.1943721, 0.3169482, -0.3777474, 1, 1, 1, 1, 1,
0.1961693, 0.04324627, 1.125302, 1, 1, 1, 1, 1,
0.1989342, -0.2466234, 2.455058, 0, 0, 1, 1, 1,
0.1997962, 3.187625, 0.5533438, 1, 0, 0, 1, 1,
0.2020577, -0.01065997, -0.328591, 1, 0, 0, 1, 1,
0.2038718, -1.876169, 1.480061, 1, 0, 0, 1, 1,
0.2044849, -0.4940141, 1.786894, 1, 0, 0, 1, 1,
0.2065338, 0.3577026, 0.9026456, 1, 0, 0, 1, 1,
0.2070827, -0.6956366, 3.043445, 0, 0, 0, 1, 1,
0.2089633, -0.0873356, 0.4359756, 0, 0, 0, 1, 1,
0.2114059, -0.928991, 1.567776, 0, 0, 0, 1, 1,
0.212513, -0.3966001, -0.5980712, 0, 0, 0, 1, 1,
0.2129549, 0.2883878, -0.044868, 0, 0, 0, 1, 1,
0.2196157, -0.1972006, 1.868956, 0, 0, 0, 1, 1,
0.2210979, -0.9497271, 4.047795, 0, 0, 0, 1, 1,
0.2215468, -2.07092, 3.050423, 1, 1, 1, 1, 1,
0.2329013, 0.3525454, 1.285832, 1, 1, 1, 1, 1,
0.2333893, 0.3031254, 0.1950612, 1, 1, 1, 1, 1,
0.2350194, 0.424782, -1.591032, 1, 1, 1, 1, 1,
0.2386342, 0.7868036, 0.759151, 1, 1, 1, 1, 1,
0.2459329, -0.847828, 2.477657, 1, 1, 1, 1, 1,
0.2477034, 1.582732, -0.6538906, 1, 1, 1, 1, 1,
0.2485342, 0.03920813, -0.5091369, 1, 1, 1, 1, 1,
0.2498295, 1.228208, 0.4026957, 1, 1, 1, 1, 1,
0.2505776, -0.007838815, 2.408046, 1, 1, 1, 1, 1,
0.2511029, 2.157899, -0.2197813, 1, 1, 1, 1, 1,
0.2511673, -0.7002435, 2.446862, 1, 1, 1, 1, 1,
0.251283, -0.8833592, 3.380216, 1, 1, 1, 1, 1,
0.2516737, 1.281096, -1.355107, 1, 1, 1, 1, 1,
0.2521333, 0.822651, -0.2487503, 1, 1, 1, 1, 1,
0.2525098, -0.7133355, 2.59002, 0, 0, 1, 1, 1,
0.2539726, -0.3944045, -0.5300261, 1, 0, 0, 1, 1,
0.2540915, 1.583085, 0.1766425, 1, 0, 0, 1, 1,
0.2613912, 1.244886, 1.406052, 1, 0, 0, 1, 1,
0.261463, -0.7128004, 2.144395, 1, 0, 0, 1, 1,
0.2618304, 0.04858163, 0.8391762, 1, 0, 0, 1, 1,
0.2655508, 1.689671, -1.02814, 0, 0, 0, 1, 1,
0.267216, 0.1504366, 1.351363, 0, 0, 0, 1, 1,
0.2708068, -0.3984223, 2.468275, 0, 0, 0, 1, 1,
0.2708258, -1.610375, 4.354908, 0, 0, 0, 1, 1,
0.2721049, -0.9205721, 1.86997, 0, 0, 0, 1, 1,
0.2736754, -1.049076, 4.478678, 0, 0, 0, 1, 1,
0.2807783, -0.323751, 3.279877, 0, 0, 0, 1, 1,
0.2841603, -0.003160893, 0.9579223, 1, 1, 1, 1, 1,
0.2861478, 0.8242318, -0.06341552, 1, 1, 1, 1, 1,
0.286496, 0.4665993, 0.4139962, 1, 1, 1, 1, 1,
0.2890055, 1.19669, 0.6054889, 1, 1, 1, 1, 1,
0.2951971, -1.150786, 2.533457, 1, 1, 1, 1, 1,
0.2961314, -0.4596767, 0.03348382, 1, 1, 1, 1, 1,
0.3017718, 0.03181602, -0.1423108, 1, 1, 1, 1, 1,
0.305872, -0.7504189, 2.386937, 1, 1, 1, 1, 1,
0.3097045, -1.445991, 3.505599, 1, 1, 1, 1, 1,
0.3098436, 0.7349554, -0.5847313, 1, 1, 1, 1, 1,
0.3120618, 0.1806161, 1.477566, 1, 1, 1, 1, 1,
0.3221751, -0.1330018, 1.764874, 1, 1, 1, 1, 1,
0.3223639, -1.441192, 4.178585, 1, 1, 1, 1, 1,
0.3224257, -1.356393, 1.589075, 1, 1, 1, 1, 1,
0.3282725, -0.8162028, 2.284029, 1, 1, 1, 1, 1,
0.331791, -0.1145794, -0.2297774, 0, 0, 1, 1, 1,
0.3359119, 0.5105741, 1.969097, 1, 0, 0, 1, 1,
0.3375514, -0.5598093, 1.219924, 1, 0, 0, 1, 1,
0.3376807, 0.153103, 2.582299, 1, 0, 0, 1, 1,
0.3435781, 0.5102628, -0.622296, 1, 0, 0, 1, 1,
0.3505917, -0.7672449, 2.364817, 1, 0, 0, 1, 1,
0.3517161, -0.236447, 1.927958, 0, 0, 0, 1, 1,
0.3578489, -0.4323288, 0.77959, 0, 0, 0, 1, 1,
0.3605959, -0.5533714, 4.071546, 0, 0, 0, 1, 1,
0.3614977, 0.4588156, 1.165017, 0, 0, 0, 1, 1,
0.3641592, 0.876312, -0.7627472, 0, 0, 0, 1, 1,
0.3647769, -0.2230226, 3.09512, 0, 0, 0, 1, 1,
0.3682072, -0.3015115, -0.06590868, 0, 0, 0, 1, 1,
0.3806186, 0.5674701, -0.6626709, 1, 1, 1, 1, 1,
0.3915876, -0.6444818, 1.648806, 1, 1, 1, 1, 1,
0.3934072, -0.0404829, 1.410228, 1, 1, 1, 1, 1,
0.4030224, -0.3871459, 1.272531, 1, 1, 1, 1, 1,
0.4080754, -0.3302268, 1.371145, 1, 1, 1, 1, 1,
0.4086184, -0.267414, 1.631656, 1, 1, 1, 1, 1,
0.4172901, -1.565472, 3.187043, 1, 1, 1, 1, 1,
0.4194772, -1.282613, 3.946417, 1, 1, 1, 1, 1,
0.4232385, 0.1346265, -0.1944958, 1, 1, 1, 1, 1,
0.4303315, 0.3195206, 1.983051, 1, 1, 1, 1, 1,
0.4427517, -0.9406036, 2.981132, 1, 1, 1, 1, 1,
0.4507395, 1.527403, -0.942266, 1, 1, 1, 1, 1,
0.4513417, -0.6575893, 2.848987, 1, 1, 1, 1, 1,
0.4558924, -1.03023, 2.052837, 1, 1, 1, 1, 1,
0.4615112, 0.9836865, 0.301182, 1, 1, 1, 1, 1,
0.4649211, 1.990267, 0.6614456, 0, 0, 1, 1, 1,
0.4673168, 0.7894257, 1.025969, 1, 0, 0, 1, 1,
0.4685782, -0.02594381, 0.09191737, 1, 0, 0, 1, 1,
0.4698914, -0.6326201, 1.805962, 1, 0, 0, 1, 1,
0.4704695, -1.401141, 1.87319, 1, 0, 0, 1, 1,
0.4728133, -0.6001042, 3.006484, 1, 0, 0, 1, 1,
0.473622, 0.5222743, 0.4269755, 0, 0, 0, 1, 1,
0.4744659, 0.3663063, 2.181734, 0, 0, 0, 1, 1,
0.4746885, 0.8004086, 2.944842, 0, 0, 0, 1, 1,
0.4747537, -0.0215985, 0.5656809, 0, 0, 0, 1, 1,
0.4749576, -0.1853236, 2.282681, 0, 0, 0, 1, 1,
0.4791081, 0.1354883, 0.07994483, 0, 0, 0, 1, 1,
0.480588, 0.321053, -0.4753658, 0, 0, 0, 1, 1,
0.4849114, 1.509482, -0.052314, 1, 1, 1, 1, 1,
0.4873739, -0.8197173, 1.848669, 1, 1, 1, 1, 1,
0.4874855, -1.529604, 3.431632, 1, 1, 1, 1, 1,
0.487707, -0.7261921, 2.102369, 1, 1, 1, 1, 1,
0.4882444, 1.029191, 0.3767107, 1, 1, 1, 1, 1,
0.4896763, -1.621314, 2.577155, 1, 1, 1, 1, 1,
0.4899259, -0.05845183, 1.160195, 1, 1, 1, 1, 1,
0.4920045, -0.281668, 2.535212, 1, 1, 1, 1, 1,
0.4939035, -1.766914, 2.618464, 1, 1, 1, 1, 1,
0.4953601, -1.364234, 3.763496, 1, 1, 1, 1, 1,
0.500008, 0.2365817, 1.671836, 1, 1, 1, 1, 1,
0.5006198, -0.5180611, 1.263123, 1, 1, 1, 1, 1,
0.5012505, -1.035108, 2.860356, 1, 1, 1, 1, 1,
0.5013419, -0.4671229, 3.448756, 1, 1, 1, 1, 1,
0.5076205, -1.307918, 4.193938, 1, 1, 1, 1, 1,
0.5111815, -0.8050256, 3.891189, 0, 0, 1, 1, 1,
0.5112012, -1.188025, 2.27508, 1, 0, 0, 1, 1,
0.5142406, 0.5326292, 0.3698761, 1, 0, 0, 1, 1,
0.519528, 0.1920103, 2.98261, 1, 0, 0, 1, 1,
0.5209244, 0.626228, 0.611016, 1, 0, 0, 1, 1,
0.526886, 0.5069946, 1.674246, 1, 0, 0, 1, 1,
0.5272914, -0.9327151, 0.8894331, 0, 0, 0, 1, 1,
0.5305803, 0.1845662, 1.082752, 0, 0, 0, 1, 1,
0.5317432, 0.5647079, 1.868584, 0, 0, 0, 1, 1,
0.5320469, -0.4001766, 1.527614, 0, 0, 0, 1, 1,
0.5322708, -0.6817531, 4.077579, 0, 0, 0, 1, 1,
0.5376042, -0.6976333, 2.850141, 0, 0, 0, 1, 1,
0.5403227, 1.180102, 0.7835763, 0, 0, 0, 1, 1,
0.5436652, -0.9181134, 0.4800718, 1, 1, 1, 1, 1,
0.5542949, -0.09621514, 0.4735039, 1, 1, 1, 1, 1,
0.5558461, 0.1711559, 2.193953, 1, 1, 1, 1, 1,
0.55643, 0.132191, 0.3496053, 1, 1, 1, 1, 1,
0.5590765, -0.3240117, 2.293673, 1, 1, 1, 1, 1,
0.5614604, -1.740638, 2.70512, 1, 1, 1, 1, 1,
0.5646417, 0.5205451, 2.335179, 1, 1, 1, 1, 1,
0.5650356, 0.6603929, 0.6274587, 1, 1, 1, 1, 1,
0.5689883, -0.6123116, 3.076355, 1, 1, 1, 1, 1,
0.57161, -0.765016, 4.540285, 1, 1, 1, 1, 1,
0.5736675, 0.5856902, 1.188041, 1, 1, 1, 1, 1,
0.5754267, -0.3815009, 1.036561, 1, 1, 1, 1, 1,
0.5760687, 0.3711504, 2.879759, 1, 1, 1, 1, 1,
0.5794474, 0.06145742, 1.663395, 1, 1, 1, 1, 1,
0.5851612, 2.001561, 0.8932567, 1, 1, 1, 1, 1,
0.5891414, 0.6428205, -1.900028, 0, 0, 1, 1, 1,
0.5894817, 0.8283725, 0.5898276, 1, 0, 0, 1, 1,
0.5904322, 0.2909381, 1.840169, 1, 0, 0, 1, 1,
0.5931199, 0.4039057, 1.071394, 1, 0, 0, 1, 1,
0.5933614, -0.5449924, 2.260305, 1, 0, 0, 1, 1,
0.5942948, 0.3022451, 0.2041769, 1, 0, 0, 1, 1,
0.6003708, 0.7815531, 2.545755, 0, 0, 0, 1, 1,
0.6026935, 0.9598439, 0.8651637, 0, 0, 0, 1, 1,
0.6033689, -1.099868, 1.765967, 0, 0, 0, 1, 1,
0.6042585, -0.06337792, 2.648587, 0, 0, 0, 1, 1,
0.608805, -0.4315838, 3.415236, 0, 0, 0, 1, 1,
0.6120836, 1.583951, 1.104541, 0, 0, 0, 1, 1,
0.6121594, 0.3282689, 0.4709505, 0, 0, 0, 1, 1,
0.6204402, 0.8051924, 0.6363791, 1, 1, 1, 1, 1,
0.6220582, -0.4767379, 2.518441, 1, 1, 1, 1, 1,
0.6235324, 0.5212706, 1.104307, 1, 1, 1, 1, 1,
0.6286459, -0.9310101, 3.245823, 1, 1, 1, 1, 1,
0.6313376, -1.135081, 4.146619, 1, 1, 1, 1, 1,
0.6314897, -0.6637253, 4.319484, 1, 1, 1, 1, 1,
0.6335286, 1.928232, 1.552085, 1, 1, 1, 1, 1,
0.6337259, 0.5308948, 0.3166102, 1, 1, 1, 1, 1,
0.6365618, -0.07500151, 1.138176, 1, 1, 1, 1, 1,
0.6371002, -0.002770262, 1.054899, 1, 1, 1, 1, 1,
0.6452653, -0.2901349, 2.587985, 1, 1, 1, 1, 1,
0.6532724, -1.303962, 4.493504, 1, 1, 1, 1, 1,
0.6553928, 0.9428618, 0.324787, 1, 1, 1, 1, 1,
0.6559809, 0.8406621, 0.3650401, 1, 1, 1, 1, 1,
0.6563255, -0.005380092, 0.188334, 1, 1, 1, 1, 1,
0.657011, -0.5997462, 2.557184, 0, 0, 1, 1, 1,
0.6650063, -0.4179937, 1.869382, 1, 0, 0, 1, 1,
0.6667974, 1.18562, 0.1194438, 1, 0, 0, 1, 1,
0.6685424, -1.144729, 3.599453, 1, 0, 0, 1, 1,
0.6697076, -0.4890804, 2.962674, 1, 0, 0, 1, 1,
0.6735089, -2.725491, 3.398823, 1, 0, 0, 1, 1,
0.6758398, 0.6014366, 0.3781046, 0, 0, 0, 1, 1,
0.6771622, -1.94688, 2.543366, 0, 0, 0, 1, 1,
0.6814852, -0.7290198, 3.569399, 0, 0, 0, 1, 1,
0.6828265, -0.1238012, 1.267336, 0, 0, 0, 1, 1,
0.6847124, -0.3440613, 1.538872, 0, 0, 0, 1, 1,
0.6884043, -1.163944, 1.762955, 0, 0, 0, 1, 1,
0.6919847, -0.005161504, 2.893779, 0, 0, 0, 1, 1,
0.6952578, -0.5285551, 3.099846, 1, 1, 1, 1, 1,
0.7020913, 0.1736402, 2.011147, 1, 1, 1, 1, 1,
0.7072564, 0.4696423, 1.334332, 1, 1, 1, 1, 1,
0.7077742, -0.3495548, 2.036672, 1, 1, 1, 1, 1,
0.71205, -0.8387111, 1.76992, 1, 1, 1, 1, 1,
0.7244063, -0.09709313, 2.381087, 1, 1, 1, 1, 1,
0.7245384, -0.6164041, 2.465653, 1, 1, 1, 1, 1,
0.7253376, -0.4706186, 1.569746, 1, 1, 1, 1, 1,
0.72973, 0.0408412, 2.580605, 1, 1, 1, 1, 1,
0.7382768, -0.7156777, 2.327809, 1, 1, 1, 1, 1,
0.74217, 1.913941, 0.6174121, 1, 1, 1, 1, 1,
0.7488086, -0.2497367, 1.307919, 1, 1, 1, 1, 1,
0.7498125, 0.8955166, 1.72587, 1, 1, 1, 1, 1,
0.751486, -1.693498, 3.425937, 1, 1, 1, 1, 1,
0.7550825, 1.518448, -0.5090437, 1, 1, 1, 1, 1,
0.7578794, -0.7103143, 1.542337, 0, 0, 1, 1, 1,
0.7593895, -0.1848023, 0.9139482, 1, 0, 0, 1, 1,
0.7651454, -1.467565, 2.987079, 1, 0, 0, 1, 1,
0.7736787, -1.420457, 2.500261, 1, 0, 0, 1, 1,
0.7800384, 0.1822511, 0.8955704, 1, 0, 0, 1, 1,
0.7866204, 1.933574, 1.379904, 1, 0, 0, 1, 1,
0.7912479, 0.5450388, 0.6014457, 0, 0, 0, 1, 1,
0.7976742, 0.4792578, 0.527898, 0, 0, 0, 1, 1,
0.8008178, 0.2873114, 2.186504, 0, 0, 0, 1, 1,
0.8008709, 0.3772911, 2.31086, 0, 0, 0, 1, 1,
0.8017598, 1.236338, 1.817176, 0, 0, 0, 1, 1,
0.8027647, 1.454913, 0.5594282, 0, 0, 0, 1, 1,
0.8039262, -0.02395836, 2.46659, 0, 0, 0, 1, 1,
0.8041912, 1.093024, -1.319974, 1, 1, 1, 1, 1,
0.804683, 1.041425, 1.174513, 1, 1, 1, 1, 1,
0.8098412, -0.01315402, 1.979091, 1, 1, 1, 1, 1,
0.813447, -1.19783, 3.489606, 1, 1, 1, 1, 1,
0.8172346, -1.693289, 5.915836, 1, 1, 1, 1, 1,
0.8173615, -0.9703773, 1.148549, 1, 1, 1, 1, 1,
0.8216401, -0.7879608, 2.540885, 1, 1, 1, 1, 1,
0.8216875, 0.06095482, 2.653466, 1, 1, 1, 1, 1,
0.8219326, 1.106637, -0.3317181, 1, 1, 1, 1, 1,
0.8286494, -0.2528546, 2.848592, 1, 1, 1, 1, 1,
0.8297051, 0.6087984, 1.190101, 1, 1, 1, 1, 1,
0.8509089, 0.6799707, 0.6401551, 1, 1, 1, 1, 1,
0.8514622, 1.46987, -0.5430483, 1, 1, 1, 1, 1,
0.8532364, 1.746851, 0.3785077, 1, 1, 1, 1, 1,
0.8587894, -0.8374199, 3.957521, 1, 1, 1, 1, 1,
0.8633347, -0.5912522, 1.515553, 0, 0, 1, 1, 1,
0.8661563, 0.7532602, 1.514868, 1, 0, 0, 1, 1,
0.8807873, -0.2105599, 1.970974, 1, 0, 0, 1, 1,
0.8905848, -0.0524971, 3.286026, 1, 0, 0, 1, 1,
0.8933597, 0.6396673, -1.048664, 1, 0, 0, 1, 1,
0.8975338, 0.6061178, 1.194946, 1, 0, 0, 1, 1,
0.8993331, -0.2244676, 2.140926, 0, 0, 0, 1, 1,
0.9010906, -1.529649, 1.441979, 0, 0, 0, 1, 1,
0.9019269, -0.6054208, 0.8828374, 0, 0, 0, 1, 1,
0.906093, -0.8515109, 3.458089, 0, 0, 0, 1, 1,
0.90946, -0.886911, 2.977195, 0, 0, 0, 1, 1,
0.9190394, -0.4074239, 3.287593, 0, 0, 0, 1, 1,
0.9192594, -1.417675, 2.37742, 0, 0, 0, 1, 1,
0.9203078, -0.43742, 1.146587, 1, 1, 1, 1, 1,
0.9268647, -1.561576, 3.238302, 1, 1, 1, 1, 1,
0.9292129, -0.11648, 2.292904, 1, 1, 1, 1, 1,
0.9346938, -1.184137, 2.714472, 1, 1, 1, 1, 1,
0.9381718, -0.6279672, 3.721863, 1, 1, 1, 1, 1,
0.9393399, 0.4808761, 1.512268, 1, 1, 1, 1, 1,
0.9506887, -1.21205, 4.721559, 1, 1, 1, 1, 1,
0.9522062, 1.720404, 0.4730766, 1, 1, 1, 1, 1,
0.9527591, -0.4784954, 1.80596, 1, 1, 1, 1, 1,
0.9529133, -0.7320348, 2.416233, 1, 1, 1, 1, 1,
0.9532523, -1.471096, 4.645103, 1, 1, 1, 1, 1,
0.9557533, -0.6701638, 2.797043, 1, 1, 1, 1, 1,
0.9592373, -1.208281, 3.77121, 1, 1, 1, 1, 1,
0.9599506, -0.2231102, 1.721884, 1, 1, 1, 1, 1,
0.9628472, -0.9358492, 3.904728, 1, 1, 1, 1, 1,
0.9661806, 0.9777244, 0.2916906, 0, 0, 1, 1, 1,
0.9757536, 0.6188034, 1.719633, 1, 0, 0, 1, 1,
0.9817717, -1.365325, 3.480648, 1, 0, 0, 1, 1,
0.9827926, 1.341098, 0.5592682, 1, 0, 0, 1, 1,
0.9914565, 1.308396, 0.4085549, 1, 0, 0, 1, 1,
0.9922861, 0.7186614, -0.7423461, 1, 0, 0, 1, 1,
1.009869, -1.465902, 3.378379, 0, 0, 0, 1, 1,
1.012444, -0.8632936, 2.163734, 0, 0, 0, 1, 1,
1.012782, -1.110889, 2.138915, 0, 0, 0, 1, 1,
1.014806, 0.8594739, 1.760992, 0, 0, 0, 1, 1,
1.015078, -1.520116, 4.211176, 0, 0, 0, 1, 1,
1.016135, -0.304528, 2.570097, 0, 0, 0, 1, 1,
1.017911, 0.03266396, 0.8368674, 0, 0, 0, 1, 1,
1.01795, 0.004354282, 2.367943, 1, 1, 1, 1, 1,
1.021275, -0.6017653, 2.691308, 1, 1, 1, 1, 1,
1.035314, 0.7132017, 0.5351742, 1, 1, 1, 1, 1,
1.046809, -1.625181, 2.484733, 1, 1, 1, 1, 1,
1.047244, 0.6382723, 0.6894625, 1, 1, 1, 1, 1,
1.052213, 1.203682, 0.136537, 1, 1, 1, 1, 1,
1.054889, -0.8049231, 2.504824, 1, 1, 1, 1, 1,
1.064106, 0.2398511, -0.1825476, 1, 1, 1, 1, 1,
1.067289, 0.8070539, 0.3579581, 1, 1, 1, 1, 1,
1.071068, 0.1019437, 2.415661, 1, 1, 1, 1, 1,
1.071975, -2.459485, 2.038851, 1, 1, 1, 1, 1,
1.074044, 0.1777502, 0.9801649, 1, 1, 1, 1, 1,
1.074591, 0.9085749, 1.064191, 1, 1, 1, 1, 1,
1.077986, -0.2956473, 1.82581, 1, 1, 1, 1, 1,
1.080739, 1.753187, 0.5238268, 1, 1, 1, 1, 1,
1.085281, -1.699153, 2.236714, 0, 0, 1, 1, 1,
1.085536, -0.7216164, 1.941385, 1, 0, 0, 1, 1,
1.090241, 0.7298493, 0.5887377, 1, 0, 0, 1, 1,
1.091835, -1.160247, 2.725894, 1, 0, 0, 1, 1,
1.100515, -1.83542, 1.208041, 1, 0, 0, 1, 1,
1.120718, 0.9412118, 1.468656, 1, 0, 0, 1, 1,
1.123994, -0.2314926, 0.330432, 0, 0, 0, 1, 1,
1.125224, 0.3938304, 1.762548, 0, 0, 0, 1, 1,
1.134528, -1.721891, 2.101961, 0, 0, 0, 1, 1,
1.136679, -0.08025501, 0.8588893, 0, 0, 0, 1, 1,
1.146765, 1.316843, 0.5434646, 0, 0, 0, 1, 1,
1.149179, -0.09383107, 2.296829, 0, 0, 0, 1, 1,
1.159044, 0.66364, 0.5725447, 0, 0, 0, 1, 1,
1.164322, 1.543921, -0.09753675, 1, 1, 1, 1, 1,
1.164645, 0.9441202, 0.7020409, 1, 1, 1, 1, 1,
1.167782, -1.016133, 3.13784, 1, 1, 1, 1, 1,
1.169974, 0.6171929, 1.612708, 1, 1, 1, 1, 1,
1.170601, 0.4759742, 0.3752535, 1, 1, 1, 1, 1,
1.179492, -1.651905, 2.743075, 1, 1, 1, 1, 1,
1.180387, -0.5369411, 2.406604, 1, 1, 1, 1, 1,
1.184857, -0.6134771, 2.642416, 1, 1, 1, 1, 1,
1.185173, 2.680544, 0.4292798, 1, 1, 1, 1, 1,
1.186443, -0.4319266, 3.702427, 1, 1, 1, 1, 1,
1.192473, 0.9670619, -0.7364885, 1, 1, 1, 1, 1,
1.197582, 0.9499284, -0.8912883, 1, 1, 1, 1, 1,
1.199537, 0.2395838, 1.984927, 1, 1, 1, 1, 1,
1.20121, -1.60381, 1.306315, 1, 1, 1, 1, 1,
1.205962, -0.1666925, 0.5058649, 1, 1, 1, 1, 1,
1.206042, 0.694362, 2.006374, 0, 0, 1, 1, 1,
1.223343, -1.407802, 1.744011, 1, 0, 0, 1, 1,
1.234128, 0.9441875, -0.3380719, 1, 0, 0, 1, 1,
1.234972, 0.1149978, 1.995466, 1, 0, 0, 1, 1,
1.243612, 0.06522288, 2.884207, 1, 0, 0, 1, 1,
1.243717, -0.2457538, 2.614579, 1, 0, 0, 1, 1,
1.246957, 0.0006329207, 0.6860743, 0, 0, 0, 1, 1,
1.24742, 1.061117, 1.09463, 0, 0, 0, 1, 1,
1.250297, -0.701497, 1.860361, 0, 0, 0, 1, 1,
1.252107, -1.77466, 3.271825, 0, 0, 0, 1, 1,
1.254252, 0.2942236, 2.790567, 0, 0, 0, 1, 1,
1.262228, -1.38695, 2.393667, 0, 0, 0, 1, 1,
1.270603, 1.1326, 0.1390458, 0, 0, 0, 1, 1,
1.272952, 0.3186526, 1.417609, 1, 1, 1, 1, 1,
1.284523, 0.4655214, 1.754915, 1, 1, 1, 1, 1,
1.309251, -0.9575028, 2.938895, 1, 1, 1, 1, 1,
1.341973, -1.734285, 1.970951, 1, 1, 1, 1, 1,
1.343352, -2.142726, 0.8769832, 1, 1, 1, 1, 1,
1.347093, 1.370302, -0.6507906, 1, 1, 1, 1, 1,
1.351727, 0.7492719, 0.8137871, 1, 1, 1, 1, 1,
1.364764, -0.5725069, 1.967517, 1, 1, 1, 1, 1,
1.367369, -1.694673, 3.311939, 1, 1, 1, 1, 1,
1.372177, -1.117677, 3.301523, 1, 1, 1, 1, 1,
1.376761, 1.955345, -0.1883439, 1, 1, 1, 1, 1,
1.381041, -0.4939438, 1.477306, 1, 1, 1, 1, 1,
1.392679, 0.7744642, 2.646212, 1, 1, 1, 1, 1,
1.403183, -1.559062, 2.682511, 1, 1, 1, 1, 1,
1.403665, 1.062534, 1.299072, 1, 1, 1, 1, 1,
1.419244, 1.263092, 0.8489155, 0, 0, 1, 1, 1,
1.423056, -1.466392, 2.693429, 1, 0, 0, 1, 1,
1.429185, 0.4132824, 1.337567, 1, 0, 0, 1, 1,
1.459574, -1.70526, 1.493274, 1, 0, 0, 1, 1,
1.478511, -0.6672604, 3.549756, 1, 0, 0, 1, 1,
1.490522, 1.382435, 0.6971388, 1, 0, 0, 1, 1,
1.499132, -0.7352433, 0.4504259, 0, 0, 0, 1, 1,
1.500819, 2.369879, -1.093825, 0, 0, 0, 1, 1,
1.506982, 0.07903086, 3.404932, 0, 0, 0, 1, 1,
1.512144, -0.2637966, 1.29891, 0, 0, 0, 1, 1,
1.51743, 0.4152635, 1.393059, 0, 0, 0, 1, 1,
1.532668, 0.04567337, 0.6793284, 0, 0, 0, 1, 1,
1.558259, 0.5361284, -0.6236919, 0, 0, 0, 1, 1,
1.56408, 1.290642, 1.537107, 1, 1, 1, 1, 1,
1.570849, 0.9027838, 2.727289, 1, 1, 1, 1, 1,
1.572036, 0.7666692, 2.503344, 1, 1, 1, 1, 1,
1.577703, -0.4737814, 2.909002, 1, 1, 1, 1, 1,
1.580043, 0.5233997, 0.2904695, 1, 1, 1, 1, 1,
1.582719, -0.8996908, 2.514466, 1, 1, 1, 1, 1,
1.583005, 0.3142715, 0.3496759, 1, 1, 1, 1, 1,
1.587627, 0.2021107, 1.445858, 1, 1, 1, 1, 1,
1.590784, 0.9881672, 3.293394, 1, 1, 1, 1, 1,
1.614828, 0.2773463, 0.797214, 1, 1, 1, 1, 1,
1.616156, 0.1949696, 1.322381, 1, 1, 1, 1, 1,
1.634178, -1.654783, 3.318946, 1, 1, 1, 1, 1,
1.639612, -0.9860632, 3.260516, 1, 1, 1, 1, 1,
1.644558, 0.7292367, 0.4405468, 1, 1, 1, 1, 1,
1.645705, -1.643776, 2.591182, 1, 1, 1, 1, 1,
1.651513, 0.2636621, 1.499989, 0, 0, 1, 1, 1,
1.655186, 0.4391225, 1.010833, 1, 0, 0, 1, 1,
1.67325, -0.6374511, 3.264621, 1, 0, 0, 1, 1,
1.677923, 0.4129069, 2.353803, 1, 0, 0, 1, 1,
1.683827, -0.6362479, 3.006465, 1, 0, 0, 1, 1,
1.69473, 1.492957, 1.794028, 1, 0, 0, 1, 1,
1.698235, 2.606934, 0.3388517, 0, 0, 0, 1, 1,
1.704137, 1.343173, -0.01006266, 0, 0, 0, 1, 1,
1.715722, 0.6950651, 0.2060463, 0, 0, 0, 1, 1,
1.72945, 1.075193, 0.8139832, 0, 0, 0, 1, 1,
1.72953, 1.870087, -0.4892729, 0, 0, 0, 1, 1,
1.734717, -0.2766721, 3.421227, 0, 0, 0, 1, 1,
1.743167, -0.1942466, 1.675381, 0, 0, 0, 1, 1,
1.754052, -2.370915, 3.139418, 1, 1, 1, 1, 1,
1.761903, 0.3907255, 1.269961, 1, 1, 1, 1, 1,
1.775439, -1.059758, 3.319946, 1, 1, 1, 1, 1,
1.775512, 0.2979605, -0.0258578, 1, 1, 1, 1, 1,
1.779275, -0.2369213, 2.042994, 1, 1, 1, 1, 1,
1.780734, -0.7177618, 2.617209, 1, 1, 1, 1, 1,
1.784799, 0.1134342, 1.590201, 1, 1, 1, 1, 1,
1.792688, 1.422207, 1.42863, 1, 1, 1, 1, 1,
1.805906, 0.2230829, 1.503952, 1, 1, 1, 1, 1,
1.807399, 0.3752563, 2.221394, 1, 1, 1, 1, 1,
1.826503, -0.5561464, 2.680571, 1, 1, 1, 1, 1,
1.829776, 0.1720716, 1.812911, 1, 1, 1, 1, 1,
1.830871, -0.210342, 2.183769, 1, 1, 1, 1, 1,
1.851426, -0.5820758, 2.179648, 1, 1, 1, 1, 1,
1.863542, 1.114, 4.114608, 1, 1, 1, 1, 1,
1.906069, -0.2803743, 2.398279, 0, 0, 1, 1, 1,
1.932673, -0.6386169, 2.293352, 1, 0, 0, 1, 1,
1.934614, 1.565022, 0.4569547, 1, 0, 0, 1, 1,
1.952337, 0.5658096, 3.354574, 1, 0, 0, 1, 1,
1.967631, -1.257259, 1.18819, 1, 0, 0, 1, 1,
1.977163, -1.053595, 4.021821, 1, 0, 0, 1, 1,
2.070884, -1.427125, 2.627931, 0, 0, 0, 1, 1,
2.13015, -1.338075, 1.102167, 0, 0, 0, 1, 1,
2.134249, 0.2480717, 2.504923, 0, 0, 0, 1, 1,
2.136166, 1.263047, -1.005286, 0, 0, 0, 1, 1,
2.17428, 0.7634947, 0.9942862, 0, 0, 0, 1, 1,
2.219984, -0.8498194, 2.842105, 0, 0, 0, 1, 1,
2.339481, 1.292574, 1.203555, 0, 0, 0, 1, 1,
2.366099, 0.1107084, 2.660379, 1, 1, 1, 1, 1,
2.459534, -1.817501, 2.702026, 1, 1, 1, 1, 1,
2.467988, -0.8891482, 1.026223, 1, 1, 1, 1, 1,
2.961361, -1.753507, 1.58851, 1, 1, 1, 1, 1,
2.96632, 1.450847, 1.324256, 1, 1, 1, 1, 1,
3.074918, -0.1543227, 2.785282, 1, 1, 1, 1, 1,
3.264162, -1.141809, 0.6292508, 1, 1, 1, 1, 1
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
var radius = 10.05528;
var distance = 35.31874;
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
mvMatrix.translate( 0.2537076, -0.01997852, -0.149714 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.31874);
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
