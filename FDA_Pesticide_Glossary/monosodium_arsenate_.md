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
-3.082669, -0.8085266, -3.9853, 1, 0, 0, 1,
-2.729664, 0.8451189, -1.173805, 1, 0.007843138, 0, 1,
-2.695138, -0.1095666, -2.091784, 1, 0.01176471, 0, 1,
-2.682048, -2.502125, -1.676384, 1, 0.01960784, 0, 1,
-2.675813, 1.226581, -1.275778, 1, 0.02352941, 0, 1,
-2.675232, 1.453197, 0.4392199, 1, 0.03137255, 0, 1,
-2.631194, 0.1341701, -1.768816, 1, 0.03529412, 0, 1,
-2.620582, -0.7876078, -1.418064, 1, 0.04313726, 0, 1,
-2.576824, -1.571567, -0.9293401, 1, 0.04705882, 0, 1,
-2.494332, -0.8731074, -1.638523, 1, 0.05490196, 0, 1,
-2.442722, -1.30054, -3.302683, 1, 0.05882353, 0, 1,
-2.429666, 0.5294632, -1.353554, 1, 0.06666667, 0, 1,
-2.373927, -0.8817023, -2.045424, 1, 0.07058824, 0, 1,
-2.345415, 2.886205, -0.88334, 1, 0.07843138, 0, 1,
-2.339437, 1.814837, -1.530188, 1, 0.08235294, 0, 1,
-2.269476, 1.295123, -0.1915105, 1, 0.09019608, 0, 1,
-2.242274, 0.5847065, -0.4549562, 1, 0.09411765, 0, 1,
-2.241539, -0.1321272, -1.418971, 1, 0.1019608, 0, 1,
-2.214387, 0.321842, -0.6605958, 1, 0.1098039, 0, 1,
-2.208245, 0.9509245, 0.07261205, 1, 0.1137255, 0, 1,
-2.202735, 0.9178675, -1.918728, 1, 0.1215686, 0, 1,
-2.180956, 0.5127633, -0.7552176, 1, 0.1254902, 0, 1,
-2.175062, -0.7276422, -2.385237, 1, 0.1333333, 0, 1,
-2.151065, 0.3702606, -0.07899946, 1, 0.1372549, 0, 1,
-2.146655, -0.4737307, -3.481116, 1, 0.145098, 0, 1,
-2.135858, -0.7819666, -1.886109, 1, 0.1490196, 0, 1,
-2.1192, -1.885321, -4.358325, 1, 0.1568628, 0, 1,
-2.110311, 1.897529, -0.3873788, 1, 0.1607843, 0, 1,
-2.073579, 1.866604, -0.9074492, 1, 0.1686275, 0, 1,
-2.070606, -1.207553, -1.777026, 1, 0.172549, 0, 1,
-2.063536, -0.2165503, -3.917164, 1, 0.1803922, 0, 1,
-2.060081, -0.03842451, -1.771377, 1, 0.1843137, 0, 1,
-2.054489, 0.7568235, -1.043483, 1, 0.1921569, 0, 1,
-2.052512, 0.9436945, -2.393927, 1, 0.1960784, 0, 1,
-2.014681, -1.297994, -2.201018, 1, 0.2039216, 0, 1,
-2.00202, -1.304289, -3.507126, 1, 0.2117647, 0, 1,
-1.975365, -1.08129, -1.617169, 1, 0.2156863, 0, 1,
-1.91621, -0.7071973, -1.068801, 1, 0.2235294, 0, 1,
-1.904485, 0.08273163, -1.967503, 1, 0.227451, 0, 1,
-1.902109, 0.6249256, -2.528879, 1, 0.2352941, 0, 1,
-1.877129, -1.054398, -3.41361, 1, 0.2392157, 0, 1,
-1.870104, 1.308266, -1.066349, 1, 0.2470588, 0, 1,
-1.856838, -1.601749, -2.166269, 1, 0.2509804, 0, 1,
-1.850366, 0.8464156, -0.5301114, 1, 0.2588235, 0, 1,
-1.845645, -0.6103567, -2.497423, 1, 0.2627451, 0, 1,
-1.835842, 0.134287, -0.8945416, 1, 0.2705882, 0, 1,
-1.814365, 0.5636403, -1.671323, 1, 0.2745098, 0, 1,
-1.80984, 0.005162789, -0.3347954, 1, 0.282353, 0, 1,
-1.806515, -1.212672, -2.985086, 1, 0.2862745, 0, 1,
-1.804819, -0.4606848, -3.030897, 1, 0.2941177, 0, 1,
-1.76223, -0.674603, -0.5202936, 1, 0.3019608, 0, 1,
-1.759395, 0.2235966, -3.103523, 1, 0.3058824, 0, 1,
-1.745898, 0.07449006, -1.430745, 1, 0.3137255, 0, 1,
-1.74165, -0.8967465, -3.529198, 1, 0.3176471, 0, 1,
-1.737694, 0.7466521, -0.4988363, 1, 0.3254902, 0, 1,
-1.7291, -1.443866, -2.646642, 1, 0.3294118, 0, 1,
-1.717546, 0.5500182, -0.5993767, 1, 0.3372549, 0, 1,
-1.716823, -1.934179, -1.496531, 1, 0.3411765, 0, 1,
-1.716282, -0.7408199, -2.614729, 1, 0.3490196, 0, 1,
-1.709707, 1.765901, -0.6778778, 1, 0.3529412, 0, 1,
-1.7082, -0.3454214, -1.281248, 1, 0.3607843, 0, 1,
-1.689202, 1.123263, -1.162166, 1, 0.3647059, 0, 1,
-1.667312, 0.1053495, -2.211288, 1, 0.372549, 0, 1,
-1.665825, -0.1024394, -0.1969531, 1, 0.3764706, 0, 1,
-1.648642, -0.642311, -1.697735, 1, 0.3843137, 0, 1,
-1.641342, -1.378648, -2.955609, 1, 0.3882353, 0, 1,
-1.633168, -0.18135, -0.763236, 1, 0.3960784, 0, 1,
-1.617425, 0.6603277, -1.038686, 1, 0.4039216, 0, 1,
-1.614776, 0.2118646, -1.419181, 1, 0.4078431, 0, 1,
-1.609, -0.05377287, -1.636732, 1, 0.4156863, 0, 1,
-1.606253, 0.5019662, 0.4570347, 1, 0.4196078, 0, 1,
-1.597269, -0.4709526, -1.57871, 1, 0.427451, 0, 1,
-1.593252, -1.03416, -0.3159282, 1, 0.4313726, 0, 1,
-1.579398, 1.122293, -1.255336, 1, 0.4392157, 0, 1,
-1.568121, -0.1014575, -1.105648, 1, 0.4431373, 0, 1,
-1.560177, 0.5825112, -0.8607488, 1, 0.4509804, 0, 1,
-1.554569, 3.313991, 0.6880923, 1, 0.454902, 0, 1,
-1.551645, -0.7075573, -1.553543, 1, 0.4627451, 0, 1,
-1.550917, 1.506984, 0.7693187, 1, 0.4666667, 0, 1,
-1.536558, 1.616218, -0.8181659, 1, 0.4745098, 0, 1,
-1.533208, -0.2000057, -1.060701, 1, 0.4784314, 0, 1,
-1.51731, -2.038545, -1.616339, 1, 0.4862745, 0, 1,
-1.510079, 0.1993672, -2.390535, 1, 0.4901961, 0, 1,
-1.506282, 0.7450567, -1.681154, 1, 0.4980392, 0, 1,
-1.503299, -0.3642296, -2.373423, 1, 0.5058824, 0, 1,
-1.490478, -1.735577, -2.782866, 1, 0.509804, 0, 1,
-1.487678, -1.783063, -2.458368, 1, 0.5176471, 0, 1,
-1.478496, -0.5662635, -1.575818, 1, 0.5215687, 0, 1,
-1.478427, 0.1171206, -1.966721, 1, 0.5294118, 0, 1,
-1.473454, 0.07618626, -1.474365, 1, 0.5333334, 0, 1,
-1.469501, 0.1703058, -1.806667, 1, 0.5411765, 0, 1,
-1.467496, -1.269357, -0.404063, 1, 0.5450981, 0, 1,
-1.441651, -0.4913098, -2.31087, 1, 0.5529412, 0, 1,
-1.433645, 1.845086, 0.431458, 1, 0.5568628, 0, 1,
-1.41456, 0.4463025, 0.06533615, 1, 0.5647059, 0, 1,
-1.404514, 1.636799, -0.7648845, 1, 0.5686275, 0, 1,
-1.388299, -1.099036, -3.066444, 1, 0.5764706, 0, 1,
-1.375137, -0.4131879, -2.185309, 1, 0.5803922, 0, 1,
-1.362984, 0.9832249, -2.338314, 1, 0.5882353, 0, 1,
-1.357589, -0.8192235, -2.642102, 1, 0.5921569, 0, 1,
-1.354039, 0.153609, 0.2575099, 1, 0.6, 0, 1,
-1.35371, 0.7992651, -1.064025, 1, 0.6078432, 0, 1,
-1.347371, 1.226801, -1.58227, 1, 0.6117647, 0, 1,
-1.336369, 0.292624, -2.222682, 1, 0.6196079, 0, 1,
-1.333883, -1.713139, -1.512671, 1, 0.6235294, 0, 1,
-1.3324, -0.6027369, -2.679211, 1, 0.6313726, 0, 1,
-1.331348, 0.5429711, -2.567314, 1, 0.6352941, 0, 1,
-1.328223, 0.1487566, -1.990299, 1, 0.6431373, 0, 1,
-1.320346, 0.8003487, -0.2463644, 1, 0.6470588, 0, 1,
-1.311886, -0.6930987, -0.3685489, 1, 0.654902, 0, 1,
-1.303698, -0.04816596, -1.352401, 1, 0.6588235, 0, 1,
-1.294957, -0.2945048, -2.682439, 1, 0.6666667, 0, 1,
-1.283756, 0.5383742, -3.366693, 1, 0.6705883, 0, 1,
-1.273656, 0.378292, -1.486415, 1, 0.6784314, 0, 1,
-1.266932, -0.7651263, -1.289532, 1, 0.682353, 0, 1,
-1.257711, 0.1257289, -1.490524, 1, 0.6901961, 0, 1,
-1.249468, -0.364586, -0.8460861, 1, 0.6941177, 0, 1,
-1.237459, 0.3468634, -1.330682, 1, 0.7019608, 0, 1,
-1.231827, 0.4807621, -1.414176, 1, 0.7098039, 0, 1,
-1.221958, -1.694337, -2.025608, 1, 0.7137255, 0, 1,
-1.214526, -0.1594705, -0.4376412, 1, 0.7215686, 0, 1,
-1.209793, 0.2687954, -2.82807, 1, 0.7254902, 0, 1,
-1.199267, -0.42412, -2.186328, 1, 0.7333333, 0, 1,
-1.189196, 0.2434863, 0.812215, 1, 0.7372549, 0, 1,
-1.18839, -1.495449, -2.673867, 1, 0.7450981, 0, 1,
-1.186659, 0.32189, -0.3205834, 1, 0.7490196, 0, 1,
-1.178438, -1.541379, -1.39724, 1, 0.7568628, 0, 1,
-1.176552, 1.1594, -0.5725572, 1, 0.7607843, 0, 1,
-1.157873, 0.3021033, -2.203928, 1, 0.7686275, 0, 1,
-1.152782, -0.77385, -3.55906, 1, 0.772549, 0, 1,
-1.151171, 0.8865191, -1.24934, 1, 0.7803922, 0, 1,
-1.142692, -0.05760372, -1.540006, 1, 0.7843137, 0, 1,
-1.129033, 0.1078957, -1.793246, 1, 0.7921569, 0, 1,
-1.12785, -1.036024, -1.261633, 1, 0.7960784, 0, 1,
-1.126179, -1.282269, -1.34973, 1, 0.8039216, 0, 1,
-1.124844, -0.2741693, -1.08747, 1, 0.8117647, 0, 1,
-1.121772, -1.128793, -2.734003, 1, 0.8156863, 0, 1,
-1.121714, 1.476727, 0.5486404, 1, 0.8235294, 0, 1,
-1.114843, -0.9588034, -2.264123, 1, 0.827451, 0, 1,
-1.114329, -0.4878556, -0.8618822, 1, 0.8352941, 0, 1,
-1.112986, 0.8519703, -1.780885, 1, 0.8392157, 0, 1,
-1.109303, 2.673848, -1.039136, 1, 0.8470588, 0, 1,
-1.108171, -0.820902, -1.17698, 1, 0.8509804, 0, 1,
-1.104496, 1.316692, -0.9176596, 1, 0.8588235, 0, 1,
-1.092892, 0.4405183, -0.4198251, 1, 0.8627451, 0, 1,
-1.090772, 0.8463709, -0.8746944, 1, 0.8705882, 0, 1,
-1.077967, -0.6250631, -3.280647, 1, 0.8745098, 0, 1,
-1.076391, -1.772347, -3.225295, 1, 0.8823529, 0, 1,
-1.07366, 0.5723211, -0.6392395, 1, 0.8862745, 0, 1,
-1.073297, -1.258698, -2.347621, 1, 0.8941177, 0, 1,
-1.071253, -0.678699, -3.00966, 1, 0.8980392, 0, 1,
-1.070417, 0.06542178, -3.19643, 1, 0.9058824, 0, 1,
-1.064727, 0.359644, -0.252798, 1, 0.9137255, 0, 1,
-1.044877, 1.435437, -0.2623232, 1, 0.9176471, 0, 1,
-1.043063, 0.2136084, -0.7714541, 1, 0.9254902, 0, 1,
-1.038612, -1.883966, -3.003669, 1, 0.9294118, 0, 1,
-1.036399, -0.7895787, -3.082038, 1, 0.9372549, 0, 1,
-1.036318, 0.8821272, -1.297425, 1, 0.9411765, 0, 1,
-1.032226, 1.262319, -0.1826946, 1, 0.9490196, 0, 1,
-1.030646, -0.9601395, 0.05151882, 1, 0.9529412, 0, 1,
-1.027039, -0.136446, -1.46644, 1, 0.9607843, 0, 1,
-1.023508, 1.41298, -0.6139339, 1, 0.9647059, 0, 1,
-1.023327, 1.18653, -1.521424, 1, 0.972549, 0, 1,
-1.018478, -0.467465, -1.397472, 1, 0.9764706, 0, 1,
-1.018219, 0.7834804, -0.6566948, 1, 0.9843137, 0, 1,
-1.017965, -0.8809188, -2.240648, 1, 0.9882353, 0, 1,
-1.015187, -1.088154, -3.023307, 1, 0.9960784, 0, 1,
-1.012805, 0.4506653, -1.233256, 0.9960784, 1, 0, 1,
-1.006971, -0.5596235, -1.399129, 0.9921569, 1, 0, 1,
-1.002556, -0.5923065, -1.724049, 0.9843137, 1, 0, 1,
-1.00206, -0.4468564, 0.2607298, 0.9803922, 1, 0, 1,
-0.9907206, 0.7345899, 0.08397137, 0.972549, 1, 0, 1,
-0.9898881, 0.611303, -1.330075, 0.9686275, 1, 0, 1,
-0.9829706, 0.2793735, -0.1191557, 0.9607843, 1, 0, 1,
-0.9820582, 0.3483304, -0.620818, 0.9568627, 1, 0, 1,
-0.97938, -1.380275, -4.523248, 0.9490196, 1, 0, 1,
-0.9742095, 0.6463211, -0.02931439, 0.945098, 1, 0, 1,
-0.9698132, 0.3678144, -2.27423, 0.9372549, 1, 0, 1,
-0.9677616, -0.7120935, -2.4338, 0.9333333, 1, 0, 1,
-0.967074, 1.148926, -0.4073655, 0.9254902, 1, 0, 1,
-0.9616728, -0.1919453, -2.276992, 0.9215686, 1, 0, 1,
-0.9610074, -1.752438, -2.578971, 0.9137255, 1, 0, 1,
-0.9609062, -0.530977, -3.206016, 0.9098039, 1, 0, 1,
-0.9528268, 0.1196848, -0.9893771, 0.9019608, 1, 0, 1,
-0.9482324, -2.079052, -1.303448, 0.8941177, 1, 0, 1,
-0.9391366, -0.2343345, -3.499569, 0.8901961, 1, 0, 1,
-0.9379548, 1.095679, -1.867165, 0.8823529, 1, 0, 1,
-0.9321061, 0.5353627, -1.424043, 0.8784314, 1, 0, 1,
-0.929193, -1.555577, -2.234862, 0.8705882, 1, 0, 1,
-0.9267331, -1.459106, -1.421767, 0.8666667, 1, 0, 1,
-0.9267114, 0.3924748, -0.4719039, 0.8588235, 1, 0, 1,
-0.9223587, -0.160287, -4.328919, 0.854902, 1, 0, 1,
-0.9177331, -0.2266152, -2.556538, 0.8470588, 1, 0, 1,
-0.9086842, -0.1236931, -2.582173, 0.8431373, 1, 0, 1,
-0.9083858, 1.22498, -0.6886529, 0.8352941, 1, 0, 1,
-0.9072016, -0.213022, -3.533114, 0.8313726, 1, 0, 1,
-0.9061508, 1.154911, 0.06520924, 0.8235294, 1, 0, 1,
-0.9049907, 0.477079, -3.225883, 0.8196079, 1, 0, 1,
-0.8997959, -0.60001, -0.3982519, 0.8117647, 1, 0, 1,
-0.8982655, -1.784833, -2.377699, 0.8078431, 1, 0, 1,
-0.8949697, -0.6902505, -0.9633001, 0.8, 1, 0, 1,
-0.893591, -0.7353468, -0.4295583, 0.7921569, 1, 0, 1,
-0.8933623, 0.5425285, -1.315213, 0.7882353, 1, 0, 1,
-0.8926901, 0.6854653, -1.214496, 0.7803922, 1, 0, 1,
-0.8922132, -0.8807126, -1.358196, 0.7764706, 1, 0, 1,
-0.8899486, 0.4442778, 0.7552471, 0.7686275, 1, 0, 1,
-0.8792598, 0.5160189, -0.50015, 0.7647059, 1, 0, 1,
-0.8788421, 1.476003, 0.06831395, 0.7568628, 1, 0, 1,
-0.8730456, -1.364349, -2.594328, 0.7529412, 1, 0, 1,
-0.8689915, -0.86685, -1.973608, 0.7450981, 1, 0, 1,
-0.8688527, 0.8618811, -0.9723465, 0.7411765, 1, 0, 1,
-0.8609665, -0.03191248, -1.36284, 0.7333333, 1, 0, 1,
-0.8587244, -0.748092, -0.5792751, 0.7294118, 1, 0, 1,
-0.8545972, -0.5811528, -3.19414, 0.7215686, 1, 0, 1,
-0.8531723, -1.386274, -3.625503, 0.7176471, 1, 0, 1,
-0.8519993, -0.2757751, -1.345855, 0.7098039, 1, 0, 1,
-0.8497969, -0.7846816, -2.827745, 0.7058824, 1, 0, 1,
-0.8467561, 0.7197586, -0.02093521, 0.6980392, 1, 0, 1,
-0.8404493, 1.715547, -0.4085483, 0.6901961, 1, 0, 1,
-0.837853, -0.07615503, -2.419607, 0.6862745, 1, 0, 1,
-0.8343568, 0.1045895, -0.5508173, 0.6784314, 1, 0, 1,
-0.8294443, 0.06969921, 1.099946, 0.6745098, 1, 0, 1,
-0.8250128, 0.08780649, -3.132409, 0.6666667, 1, 0, 1,
-0.820658, -2.290575, -0.9905692, 0.6627451, 1, 0, 1,
-0.8201596, -2.208319, -3.972667, 0.654902, 1, 0, 1,
-0.816197, -0.1801654, -1.124654, 0.6509804, 1, 0, 1,
-0.8150975, 1.314684, 0.5098709, 0.6431373, 1, 0, 1,
-0.8126957, 1.240058, 0.7193205, 0.6392157, 1, 0, 1,
-0.8112677, 1.108835, -0.8227777, 0.6313726, 1, 0, 1,
-0.8105045, -0.2752978, -1.449543, 0.627451, 1, 0, 1,
-0.8101248, -1.389414, -3.847298, 0.6196079, 1, 0, 1,
-0.8090177, 1.125321, -1.854643, 0.6156863, 1, 0, 1,
-0.8044291, -0.3986382, -2.349702, 0.6078432, 1, 0, 1,
-0.8034758, 0.9399487, -2.562197, 0.6039216, 1, 0, 1,
-0.8032242, -1.10352, -3.496169, 0.5960785, 1, 0, 1,
-0.7997911, 0.8897658, -1.702358, 0.5882353, 1, 0, 1,
-0.7972045, 1.16881, -1.204374, 0.5843138, 1, 0, 1,
-0.7955539, -0.5161402, -1.999604, 0.5764706, 1, 0, 1,
-0.7830362, 0.3164139, -1.948239, 0.572549, 1, 0, 1,
-0.7825369, 0.1970691, -1.052193, 0.5647059, 1, 0, 1,
-0.7661423, -1.981617, -3.594514, 0.5607843, 1, 0, 1,
-0.764414, 1.412429, -0.4876917, 0.5529412, 1, 0, 1,
-0.7639536, -0.7052006, -2.523096, 0.5490196, 1, 0, 1,
-0.7573304, 0.5321285, -1.212521, 0.5411765, 1, 0, 1,
-0.7570097, 0.5212814, -0.2235958, 0.5372549, 1, 0, 1,
-0.7555346, -1.793161, -0.9441197, 0.5294118, 1, 0, 1,
-0.7514049, -0.5389842, -2.20182, 0.5254902, 1, 0, 1,
-0.7457209, 1.852647, -0.9753361, 0.5176471, 1, 0, 1,
-0.744852, -2.197762, -2.373836, 0.5137255, 1, 0, 1,
-0.7448421, 0.7925487, -0.2929112, 0.5058824, 1, 0, 1,
-0.7439247, 0.7465827, -1.086792, 0.5019608, 1, 0, 1,
-0.7437881, -1.103751, -3.351203, 0.4941176, 1, 0, 1,
-0.7415512, 0.2789939, -2.27709, 0.4862745, 1, 0, 1,
-0.7400581, 0.8059223, -0.399763, 0.4823529, 1, 0, 1,
-0.7397349, -1.771427, -2.259295, 0.4745098, 1, 0, 1,
-0.7321277, -0.7747997, -3.902343, 0.4705882, 1, 0, 1,
-0.7286599, 1.53283, -3.022836, 0.4627451, 1, 0, 1,
-0.7249274, -0.9249986, -2.908804, 0.4588235, 1, 0, 1,
-0.7231479, 0.6620297, -1.167947, 0.4509804, 1, 0, 1,
-0.7119455, -0.8207986, -3.342084, 0.4470588, 1, 0, 1,
-0.7092438, 0.1086453, 0.3473143, 0.4392157, 1, 0, 1,
-0.707716, 0.9352471, -1.520661, 0.4352941, 1, 0, 1,
-0.7020549, 0.8667195, -0.9343307, 0.427451, 1, 0, 1,
-0.7003863, 1.324541, -2.433654, 0.4235294, 1, 0, 1,
-0.6996424, 1.162619, -1.772404, 0.4156863, 1, 0, 1,
-0.6982397, 0.6335416, -0.6480051, 0.4117647, 1, 0, 1,
-0.6930844, 0.2134911, -2.093558, 0.4039216, 1, 0, 1,
-0.689494, 0.5459568, -0.6676406, 0.3960784, 1, 0, 1,
-0.6881537, -0.9168724, -1.038047, 0.3921569, 1, 0, 1,
-0.6879435, 1.342432, 0.4515685, 0.3843137, 1, 0, 1,
-0.6869022, -0.7715764, -1.737293, 0.3803922, 1, 0, 1,
-0.6861571, 0.5198932, -1.513659, 0.372549, 1, 0, 1,
-0.6842552, -0.615959, -3.59927, 0.3686275, 1, 0, 1,
-0.6836143, 0.2298993, -0.9944137, 0.3607843, 1, 0, 1,
-0.6831466, 0.9661948, 0.7780611, 0.3568628, 1, 0, 1,
-0.6824448, 1.152233, -0.6766317, 0.3490196, 1, 0, 1,
-0.6804564, 0.4379973, 0.7672818, 0.345098, 1, 0, 1,
-0.6795285, -0.3993952, -0.9664187, 0.3372549, 1, 0, 1,
-0.6778893, 0.2985656, -0.6566027, 0.3333333, 1, 0, 1,
-0.6755932, 0.5938711, 0.4525828, 0.3254902, 1, 0, 1,
-0.6747655, -0.5184973, -2.475268, 0.3215686, 1, 0, 1,
-0.6735612, 0.2054275, -1.327016, 0.3137255, 1, 0, 1,
-0.6677877, -1.275508, -2.928954, 0.3098039, 1, 0, 1,
-0.6663806, 0.04263708, -2.086605, 0.3019608, 1, 0, 1,
-0.6633685, -1.037638, -3.977779, 0.2941177, 1, 0, 1,
-0.6630566, -0.2019043, -1.038998, 0.2901961, 1, 0, 1,
-0.6611367, 0.4677573, -2.057846, 0.282353, 1, 0, 1,
-0.6523736, -0.7577336, -2.332592, 0.2784314, 1, 0, 1,
-0.6511939, -1.400251, -1.789521, 0.2705882, 1, 0, 1,
-0.6482332, -0.41043, -2.123816, 0.2666667, 1, 0, 1,
-0.6458225, -2.274868, -3.165481, 0.2588235, 1, 0, 1,
-0.6436644, 0.54224, -2.901995, 0.254902, 1, 0, 1,
-0.6368704, 0.6161845, -0.1316844, 0.2470588, 1, 0, 1,
-0.635949, 0.3949504, -1.484469, 0.2431373, 1, 0, 1,
-0.627984, 0.1680335, -3.024074, 0.2352941, 1, 0, 1,
-0.6203871, -0.1054909, -1.409173, 0.2313726, 1, 0, 1,
-0.6163096, 0.7886963, -3.650872, 0.2235294, 1, 0, 1,
-0.6156845, 0.5972558, -0.4586832, 0.2196078, 1, 0, 1,
-0.6143864, -0.9397286, -2.189826, 0.2117647, 1, 0, 1,
-0.6091006, -1.446599, -3.838998, 0.2078431, 1, 0, 1,
-0.6087415, 1.056547, -0.08668455, 0.2, 1, 0, 1,
-0.6036865, 0.5836335, -1.800228, 0.1921569, 1, 0, 1,
-0.602365, 0.1305836, -2.0006, 0.1882353, 1, 0, 1,
-0.5981025, 0.5242749, -0.2505546, 0.1803922, 1, 0, 1,
-0.5921814, 0.05077193, -2.564411, 0.1764706, 1, 0, 1,
-0.5893231, 0.8629039, 0.3609511, 0.1686275, 1, 0, 1,
-0.5889606, 0.1561014, -0.6342225, 0.1647059, 1, 0, 1,
-0.5879105, 0.5071653, -1.1521, 0.1568628, 1, 0, 1,
-0.5836582, -0.6261199, -1.748179, 0.1529412, 1, 0, 1,
-0.5803513, 0.3681637, -2.388645, 0.145098, 1, 0, 1,
-0.5802863, -0.9948035, -2.668072, 0.1411765, 1, 0, 1,
-0.5786707, -1.10546, -3.078072, 0.1333333, 1, 0, 1,
-0.5760073, 0.681222, -0.2075914, 0.1294118, 1, 0, 1,
-0.575697, 0.682606, -0.5894411, 0.1215686, 1, 0, 1,
-0.5755623, 1.292615, -1.814321, 0.1176471, 1, 0, 1,
-0.5742635, -1.129561, -2.195812, 0.1098039, 1, 0, 1,
-0.5736827, -0.9155875, -4.43754, 0.1058824, 1, 0, 1,
-0.573588, 0.4027762, -1.10735, 0.09803922, 1, 0, 1,
-0.5711541, -0.09675846, -1.980704, 0.09019608, 1, 0, 1,
-0.5683427, -1.629626, -2.59186, 0.08627451, 1, 0, 1,
-0.5600469, -0.5145426, -0.5115371, 0.07843138, 1, 0, 1,
-0.5495028, -0.03794454, -0.7380638, 0.07450981, 1, 0, 1,
-0.5469803, 0.7354769, -0.03813607, 0.06666667, 1, 0, 1,
-0.5440853, 0.9597936, -1.068488, 0.0627451, 1, 0, 1,
-0.5392531, -0.3741382, -3.0801, 0.05490196, 1, 0, 1,
-0.5386931, 0.2729431, -0.8517011, 0.05098039, 1, 0, 1,
-0.5385817, 0.2706492, -0.6682548, 0.04313726, 1, 0, 1,
-0.5361924, -0.853147, -3.854525, 0.03921569, 1, 0, 1,
-0.5299711, 0.0355208, -0.1656479, 0.03137255, 1, 0, 1,
-0.5286188, 0.36647, -2.385848, 0.02745098, 1, 0, 1,
-0.5267811, -0.107892, -1.334951, 0.01960784, 1, 0, 1,
-0.5249274, 1.220544, 0.9860254, 0.01568628, 1, 0, 1,
-0.520946, -0.2978788, -2.348662, 0.007843138, 1, 0, 1,
-0.5109923, -0.6594447, -3.970887, 0.003921569, 1, 0, 1,
-0.5089524, -0.7325447, -0.8326733, 0, 1, 0.003921569, 1,
-0.5084293, 1.056319, -0.0308758, 0, 1, 0.01176471, 1,
-0.5017294, -0.8691522, -2.410235, 0, 1, 0.01568628, 1,
-0.4994496, 1.183582, 0.4234048, 0, 1, 0.02352941, 1,
-0.4988826, 1.118801, 0.4319204, 0, 1, 0.02745098, 1,
-0.4961345, -0.1098337, -2.556726, 0, 1, 0.03529412, 1,
-0.4948516, -0.5887824, -2.338052, 0, 1, 0.03921569, 1,
-0.4862438, -0.2736118, -3.103372, 0, 1, 0.04705882, 1,
-0.4825379, 0.1504098, -1.19354, 0, 1, 0.05098039, 1,
-0.4811885, -0.04932546, -1.798258, 0, 1, 0.05882353, 1,
-0.4771885, 1.387285, -2.08126, 0, 1, 0.0627451, 1,
-0.4756196, -0.05469714, -1.122315, 0, 1, 0.07058824, 1,
-0.4749361, -1.20215, -3.198904, 0, 1, 0.07450981, 1,
-0.4659173, 0.813298, -0.3534259, 0, 1, 0.08235294, 1,
-0.4521898, -0.118978, -2.336445, 0, 1, 0.08627451, 1,
-0.4499255, -0.4593597, -0.7064803, 0, 1, 0.09411765, 1,
-0.4498964, -1.233342, -1.805339, 0, 1, 0.1019608, 1,
-0.4442838, 1.111561, -0.6582329, 0, 1, 0.1058824, 1,
-0.4438154, 1.471933, -0.1815872, 0, 1, 0.1137255, 1,
-0.4423384, 0.3370829, -2.431211, 0, 1, 0.1176471, 1,
-0.4402769, -0.4080566, -2.095529, 0, 1, 0.1254902, 1,
-0.4380164, -0.8205018, -2.523165, 0, 1, 0.1294118, 1,
-0.4373278, -0.6249588, -2.1438, 0, 1, 0.1372549, 1,
-0.4312122, -1.93987, -0.8743214, 0, 1, 0.1411765, 1,
-0.429802, -0.6625987, -3.138228, 0, 1, 0.1490196, 1,
-0.4237033, 1.301386, -0.1424328, 0, 1, 0.1529412, 1,
-0.4211027, -0.379511, -2.733406, 0, 1, 0.1607843, 1,
-0.4202433, -0.2869092, -3.13416, 0, 1, 0.1647059, 1,
-0.4197181, -1.412247, -1.868204, 0, 1, 0.172549, 1,
-0.4191302, 1.705327, -1.329178, 0, 1, 0.1764706, 1,
-0.4181974, 1.163434, 0.372096, 0, 1, 0.1843137, 1,
-0.418177, 1.049443, 0.2316024, 0, 1, 0.1882353, 1,
-0.4175059, 0.4129463, -0.8610396, 0, 1, 0.1960784, 1,
-0.4138309, 1.571496, -1.252257, 0, 1, 0.2039216, 1,
-0.4124072, -0.1699749, 0.3309686, 0, 1, 0.2078431, 1,
-0.4074928, -0.3423288, -3.108272, 0, 1, 0.2156863, 1,
-0.4054273, 1.773939, 0.4535529, 0, 1, 0.2196078, 1,
-0.4013569, -0.9418122, -0.4271815, 0, 1, 0.227451, 1,
-0.4006597, 0.4303418, 0.33892, 0, 1, 0.2313726, 1,
-0.4003657, -0.4427062, -2.571717, 0, 1, 0.2392157, 1,
-0.4002032, 0.7148796, -2.568113, 0, 1, 0.2431373, 1,
-0.3968382, -0.3755204, -2.05207, 0, 1, 0.2509804, 1,
-0.3936209, -1.257395, -2.47478, 0, 1, 0.254902, 1,
-0.3903762, 0.4101038, 0.2687162, 0, 1, 0.2627451, 1,
-0.3888634, 0.3989752, -0.9245193, 0, 1, 0.2666667, 1,
-0.3859865, 0.438063, -0.7869996, 0, 1, 0.2745098, 1,
-0.3840968, -0.7293824, -1.741072, 0, 1, 0.2784314, 1,
-0.382984, 0.09441796, -3.628959, 0, 1, 0.2862745, 1,
-0.3817512, 0.005609953, -0.8904584, 0, 1, 0.2901961, 1,
-0.380671, -0.4906475, -2.950215, 0, 1, 0.2980392, 1,
-0.3801842, 0.13553, -1.968904, 0, 1, 0.3058824, 1,
-0.3801699, 1.536005, -0.753612, 0, 1, 0.3098039, 1,
-0.3792172, 0.5156147, -2.140752, 0, 1, 0.3176471, 1,
-0.3784866, -0.5119904, -1.640175, 0, 1, 0.3215686, 1,
-0.3781826, 0.817628, 0.3297888, 0, 1, 0.3294118, 1,
-0.3758667, -0.1951267, -1.838385, 0, 1, 0.3333333, 1,
-0.3723985, -0.7331006, -0.1839802, 0, 1, 0.3411765, 1,
-0.37, 0.5044959, -0.6601164, 0, 1, 0.345098, 1,
-0.3694337, -0.6372625, -2.636273, 0, 1, 0.3529412, 1,
-0.3667704, -1.660563, -3.575722, 0, 1, 0.3568628, 1,
-0.3656684, -0.5818428, -3.181901, 0, 1, 0.3647059, 1,
-0.3625573, 0.06558456, -0.04461621, 0, 1, 0.3686275, 1,
-0.3625458, -0.9368696, -3.895623, 0, 1, 0.3764706, 1,
-0.3587286, 0.01665187, -1.2201, 0, 1, 0.3803922, 1,
-0.3580953, 1.257471, -2.344557, 0, 1, 0.3882353, 1,
-0.3560803, 1.363424, -2.296414, 0, 1, 0.3921569, 1,
-0.3506438, 1.011979, -0.09839002, 0, 1, 0.4, 1,
-0.3464974, -0.9481124, -2.22622, 0, 1, 0.4078431, 1,
-0.3379139, -0.182172, -1.221271, 0, 1, 0.4117647, 1,
-0.3359506, 0.4249548, -1.189917, 0, 1, 0.4196078, 1,
-0.3344544, -0.2515074, -3.366442, 0, 1, 0.4235294, 1,
-0.3334524, -0.3709146, -2.763515, 0, 1, 0.4313726, 1,
-0.3288009, 0.3906465, -0.3500049, 0, 1, 0.4352941, 1,
-0.3249708, -1.555494, -2.265893, 0, 1, 0.4431373, 1,
-0.3219095, 0.3536579, -0.6691841, 0, 1, 0.4470588, 1,
-0.3195245, -0.007736639, -0.4345874, 0, 1, 0.454902, 1,
-0.3187125, 0.3220529, -0.5694656, 0, 1, 0.4588235, 1,
-0.3149785, 0.3452889, -1.423636, 0, 1, 0.4666667, 1,
-0.3144952, -1.239667, -1.947808, 0, 1, 0.4705882, 1,
-0.3133439, -0.3794012, -2.06553, 0, 1, 0.4784314, 1,
-0.3117278, 0.08140706, -0.1863992, 0, 1, 0.4823529, 1,
-0.306314, -0.9815516, -2.525006, 0, 1, 0.4901961, 1,
-0.3000341, 0.2565404, -1.674767, 0, 1, 0.4941176, 1,
-0.2996158, 0.6823052, -1.395755, 0, 1, 0.5019608, 1,
-0.2956858, 1.629223, -0.5545261, 0, 1, 0.509804, 1,
-0.2911891, -1.13953, -1.544311, 0, 1, 0.5137255, 1,
-0.2904132, -0.6144966, -3.961942, 0, 1, 0.5215687, 1,
-0.2893233, -0.4707134, -2.801974, 0, 1, 0.5254902, 1,
-0.2873709, -0.665354, -3.803244, 0, 1, 0.5333334, 1,
-0.2872596, -0.6632649, -2.807947, 0, 1, 0.5372549, 1,
-0.287147, 1.306618, -0.4503778, 0, 1, 0.5450981, 1,
-0.2855184, -0.7262117, -2.200672, 0, 1, 0.5490196, 1,
-0.2843629, -1.316947, -4.182954, 0, 1, 0.5568628, 1,
-0.2788264, 2.137649, -0.9939998, 0, 1, 0.5607843, 1,
-0.2766945, 0.1728258, 0.6644445, 0, 1, 0.5686275, 1,
-0.2745775, -1.473842, -3.528162, 0, 1, 0.572549, 1,
-0.2711086, -0.2870199, -1.920116, 0, 1, 0.5803922, 1,
-0.2675314, 0.8478335, 1.204747, 0, 1, 0.5843138, 1,
-0.2573694, 0.7270929, -0.5223145, 0, 1, 0.5921569, 1,
-0.2562871, -0.332672, -3.530542, 0, 1, 0.5960785, 1,
-0.2486426, 0.003501674, -1.472407, 0, 1, 0.6039216, 1,
-0.2399977, -1.839322, -2.997794, 0, 1, 0.6117647, 1,
-0.2287032, -1.237753, -3.036087, 0, 1, 0.6156863, 1,
-0.2227828, -0.4524712, -2.884583, 0, 1, 0.6235294, 1,
-0.216464, -0.4879929, -2.294878, 0, 1, 0.627451, 1,
-0.209591, -0.3897499, -2.974342, 0, 1, 0.6352941, 1,
-0.207399, 0.3419447, -0.8645032, 0, 1, 0.6392157, 1,
-0.2028833, 0.2367983, -2.07502, 0, 1, 0.6470588, 1,
-0.202564, -2.111042, -3.551772, 0, 1, 0.6509804, 1,
-0.2009351, 1.001788, -0.3342993, 0, 1, 0.6588235, 1,
-0.1989312, -0.1727411, -2.8035, 0, 1, 0.6627451, 1,
-0.1982107, -1.787566, -4.614907, 0, 1, 0.6705883, 1,
-0.1968862, -1.879229, -4.136585, 0, 1, 0.6745098, 1,
-0.1942421, 1.168882, -0.2447356, 0, 1, 0.682353, 1,
-0.1925065, -0.8743884, -3.233045, 0, 1, 0.6862745, 1,
-0.1922625, 1.373742, 0.007873571, 0, 1, 0.6941177, 1,
-0.1878961, -0.8542387, -1.097229, 0, 1, 0.7019608, 1,
-0.1870511, -0.8692683, -3.343388, 0, 1, 0.7058824, 1,
-0.1857293, 0.7369086, -0.1162101, 0, 1, 0.7137255, 1,
-0.1854907, -0.9143747, -1.96229, 0, 1, 0.7176471, 1,
-0.1833995, 0.328049, -0.9584363, 0, 1, 0.7254902, 1,
-0.1805901, -0.5251743, -1.924691, 0, 1, 0.7294118, 1,
-0.1774351, -0.439787, -3.48653, 0, 1, 0.7372549, 1,
-0.1752606, 0.2069377, -0.6285361, 0, 1, 0.7411765, 1,
-0.1720897, 0.9435526, -0.779102, 0, 1, 0.7490196, 1,
-0.1701383, 1.019118, 0.5532195, 0, 1, 0.7529412, 1,
-0.1581226, 0.9134091, 0.6609902, 0, 1, 0.7607843, 1,
-0.157727, 1.200705, -0.4616927, 0, 1, 0.7647059, 1,
-0.1566242, -1.175018, -2.037544, 0, 1, 0.772549, 1,
-0.1455319, 0.4122461, -0.1131005, 0, 1, 0.7764706, 1,
-0.141599, -0.4858941, -3.473903, 0, 1, 0.7843137, 1,
-0.1411813, 1.51702, -0.7288269, 0, 1, 0.7882353, 1,
-0.1389466, 0.1525931, -1.13845, 0, 1, 0.7960784, 1,
-0.1387777, 0.5097098, 0.1189484, 0, 1, 0.8039216, 1,
-0.1370893, -0.6194867, -4.512436, 0, 1, 0.8078431, 1,
-0.1345932, -0.3251676, -2.092318, 0, 1, 0.8156863, 1,
-0.1243668, 0.5609309, 0.6244354, 0, 1, 0.8196079, 1,
-0.1193101, 0.3102425, -0.8835341, 0, 1, 0.827451, 1,
-0.1185954, -0.4067164, -5.051515, 0, 1, 0.8313726, 1,
-0.1158126, -1.621008, -1.072047, 0, 1, 0.8392157, 1,
-0.1140884, 0.2020492, -1.344106, 0, 1, 0.8431373, 1,
-0.1080242, -1.850879, -4.686302, 0, 1, 0.8509804, 1,
-0.105224, -0.05911129, -1.718096, 0, 1, 0.854902, 1,
-0.1037911, 1.888766, 0.7364327, 0, 1, 0.8627451, 1,
-0.1031982, -1.076627, -2.490812, 0, 1, 0.8666667, 1,
-0.1029017, -2.858824, -3.317493, 0, 1, 0.8745098, 1,
-0.09809189, 1.025473, -0.7762032, 0, 1, 0.8784314, 1,
-0.09536003, 1.113735, 1.463414, 0, 1, 0.8862745, 1,
-0.09274003, 1.871496, 0.07291704, 0, 1, 0.8901961, 1,
-0.08585433, 0.4115708, -0.4981202, 0, 1, 0.8980392, 1,
-0.08128566, -0.08187379, -1.294853, 0, 1, 0.9058824, 1,
-0.08096898, 0.9813297, 0.07617216, 0, 1, 0.9098039, 1,
-0.08002634, 0.08304697, -0.1759806, 0, 1, 0.9176471, 1,
-0.07609344, 0.7418826, 0.7520103, 0, 1, 0.9215686, 1,
-0.07212388, -1.107027, -2.520234, 0, 1, 0.9294118, 1,
-0.07107189, -0.06350241, -2.806129, 0, 1, 0.9333333, 1,
-0.06854221, -2.441312, -2.675602, 0, 1, 0.9411765, 1,
-0.06332289, 1.764333, -0.5888922, 0, 1, 0.945098, 1,
-0.06240806, -0.8493063, -1.07036, 0, 1, 0.9529412, 1,
-0.05739979, -1.521671, -2.442946, 0, 1, 0.9568627, 1,
-0.05279625, 0.8122643, 0.08671069, 0, 1, 0.9647059, 1,
-0.05194341, 0.8912495, 0.6280894, 0, 1, 0.9686275, 1,
-0.05185155, -1.056209, -2.963153, 0, 1, 0.9764706, 1,
-0.04953728, 0.5324952, 0.3274986, 0, 1, 0.9803922, 1,
-0.04885038, -0.7162995, -1.04339, 0, 1, 0.9882353, 1,
-0.04807076, -1.274701, -2.585485, 0, 1, 0.9921569, 1,
-0.04716846, -0.6814989, -4.404181, 0, 1, 1, 1,
-0.04669487, -0.2668127, -3.84094, 0, 0.9921569, 1, 1,
-0.04538292, 0.7564604, -0.2761382, 0, 0.9882353, 1, 1,
-0.04463922, -0.6744066, -4.740923, 0, 0.9803922, 1, 1,
-0.0425884, 0.2848056, 0.2518732, 0, 0.9764706, 1, 1,
-0.0419475, 0.3035095, 0.6738824, 0, 0.9686275, 1, 1,
-0.03853263, 0.5700139, 0.3113828, 0, 0.9647059, 1, 1,
-0.03810508, -0.9109077, -3.57013, 0, 0.9568627, 1, 1,
-0.03762153, 1.269181, -0.5824558, 0, 0.9529412, 1, 1,
-0.02723441, 0.8801277, 1.681049, 0, 0.945098, 1, 1,
-0.02579023, -0.7735845, -2.241635, 0, 0.9411765, 1, 1,
-0.02323362, -0.1669082, -2.578167, 0, 0.9333333, 1, 1,
-0.01340783, -1.000265, -3.482263, 0, 0.9294118, 1, 1,
-0.01122741, -1.56503, -4.449273, 0, 0.9215686, 1, 1,
-0.007311079, 1.772685, -0.9923107, 0, 0.9176471, 1, 1,
-0.007190946, -1.863545, -3.527406, 0, 0.9098039, 1, 1,
-0.00378083, 0.03723555, 0.01436973, 0, 0.9058824, 1, 1,
-0.00331207, -0.636381, -2.267075, 0, 0.8980392, 1, 1,
-0.002716409, 0.01150506, 0.6056502, 0, 0.8901961, 1, 1,
-0.001542596, 0.409905, 0.4740228, 0, 0.8862745, 1, 1,
0.004372366, 0.8338643, -0.4156968, 0, 0.8784314, 1, 1,
0.005214394, 0.9704341, 1.349744, 0, 0.8745098, 1, 1,
0.01160044, -0.3436243, 3.722978, 0, 0.8666667, 1, 1,
0.01325248, 0.4946843, 0.3096312, 0, 0.8627451, 1, 1,
0.01453803, 0.1184328, 0.01167859, 0, 0.854902, 1, 1,
0.01928849, 1.80598, -0.6419961, 0, 0.8509804, 1, 1,
0.02183584, -0.2626089, 4.054228, 0, 0.8431373, 1, 1,
0.02194826, -0.5659177, 2.621066, 0, 0.8392157, 1, 1,
0.02217533, 1.041146, -1.742992, 0, 0.8313726, 1, 1,
0.02272811, -2.055244, 2.362592, 0, 0.827451, 1, 1,
0.02642813, -0.07473838, 1.11758, 0, 0.8196079, 1, 1,
0.03116094, 1.320468, 0.6229875, 0, 0.8156863, 1, 1,
0.03517199, 0.7237467, 0.250545, 0, 0.8078431, 1, 1,
0.03559061, -0.6753839, 2.482059, 0, 0.8039216, 1, 1,
0.03638078, -0.6781646, 2.533059, 0, 0.7960784, 1, 1,
0.04010373, -0.3783115, 4.044164, 0, 0.7882353, 1, 1,
0.0469971, -0.1206016, 2.392693, 0, 0.7843137, 1, 1,
0.04859972, 0.4650267, 1.289771, 0, 0.7764706, 1, 1,
0.04937445, 0.9492819, -1.419789, 0, 0.772549, 1, 1,
0.04939786, -0.9404315, 4.54241, 0, 0.7647059, 1, 1,
0.04997913, -1.147292, 3.111156, 0, 0.7607843, 1, 1,
0.05111023, 0.1954198, -1.783213, 0, 0.7529412, 1, 1,
0.05324305, 0.7937864, 0.9145094, 0, 0.7490196, 1, 1,
0.05534495, -1.059532, 3.12111, 0, 0.7411765, 1, 1,
0.06420241, -0.5155132, 1.936108, 0, 0.7372549, 1, 1,
0.06463267, 0.4453421, 0.7744915, 0, 0.7294118, 1, 1,
0.06547131, 0.5257575, 0.1731147, 0, 0.7254902, 1, 1,
0.07056788, 0.4401717, 2.074473, 0, 0.7176471, 1, 1,
0.07116581, -1.682381, 1.952405, 0, 0.7137255, 1, 1,
0.07180471, 0.768504, 0.7828016, 0, 0.7058824, 1, 1,
0.07519143, 0.4112379, 1.718326, 0, 0.6980392, 1, 1,
0.07676934, 0.2080609, -0.6666697, 0, 0.6941177, 1, 1,
0.07928611, 0.264543, 1.404256, 0, 0.6862745, 1, 1,
0.08052255, 0.2682641, -2.284765, 0, 0.682353, 1, 1,
0.08274593, -0.5216544, 2.667126, 0, 0.6745098, 1, 1,
0.08527871, -0.3211191, 4.767397, 0, 0.6705883, 1, 1,
0.08745944, 0.9186132, -0.2468838, 0, 0.6627451, 1, 1,
0.08748521, 0.371774, -1.311821, 0, 0.6588235, 1, 1,
0.08787917, -0.0898641, 1.850051, 0, 0.6509804, 1, 1,
0.0900882, -1.1201, 4.060298, 0, 0.6470588, 1, 1,
0.0966989, 1.370955, -0.7961818, 0, 0.6392157, 1, 1,
0.1044755, 1.505128, 1.659958, 0, 0.6352941, 1, 1,
0.1062392, 1.551177, -1.379391, 0, 0.627451, 1, 1,
0.1082865, -0.5873491, 2.265821, 0, 0.6235294, 1, 1,
0.1113955, 0.374376, 1.574481, 0, 0.6156863, 1, 1,
0.1133841, -0.4963211, 1.489037, 0, 0.6117647, 1, 1,
0.1137144, 0.9228272, 0.5735824, 0, 0.6039216, 1, 1,
0.120058, -0.3916115, 2.819897, 0, 0.5960785, 1, 1,
0.120122, -0.2787528, 2.05392, 0, 0.5921569, 1, 1,
0.1216099, -0.3220108, 0.2653618, 0, 0.5843138, 1, 1,
0.1218304, -0.06990045, 2.869138, 0, 0.5803922, 1, 1,
0.1222973, -0.214055, 1.022325, 0, 0.572549, 1, 1,
0.1246803, 0.9304056, 0.806181, 0, 0.5686275, 1, 1,
0.1247759, -1.651473, 5.334805, 0, 0.5607843, 1, 1,
0.1265282, 0.3536587, 2.068167, 0, 0.5568628, 1, 1,
0.1267493, -1.308061, 3.298417, 0, 0.5490196, 1, 1,
0.1297209, -0.5523471, 2.98614, 0, 0.5450981, 1, 1,
0.1298661, 1.189275, -0.439024, 0, 0.5372549, 1, 1,
0.1315413, 0.2733535, 2.031198, 0, 0.5333334, 1, 1,
0.1318702, -1.530179, 2.533323, 0, 0.5254902, 1, 1,
0.1340787, -1.257779, 1.812106, 0, 0.5215687, 1, 1,
0.1344396, -1.68589, 2.701105, 0, 0.5137255, 1, 1,
0.1442375, -1.851495, 2.378371, 0, 0.509804, 1, 1,
0.1442658, -0.5524839, 3.435883, 0, 0.5019608, 1, 1,
0.1468266, -1.096809, 0.6980531, 0, 0.4941176, 1, 1,
0.1469242, -0.3121352, 2.487573, 0, 0.4901961, 1, 1,
0.1518738, 1.027625, -0.9203078, 0, 0.4823529, 1, 1,
0.1566199, 1.291481, -0.3853712, 0, 0.4784314, 1, 1,
0.1576085, -1.960286, 0.8963634, 0, 0.4705882, 1, 1,
0.1615509, 2.032289, 0.7293568, 0, 0.4666667, 1, 1,
0.1637896, 1.542131, -0.6420453, 0, 0.4588235, 1, 1,
0.1677552, -1.609271, 3.680029, 0, 0.454902, 1, 1,
0.1698391, -0.886439, 2.843961, 0, 0.4470588, 1, 1,
0.1734108, 0.8048614, -1.040728, 0, 0.4431373, 1, 1,
0.1751498, -0.6592737, 1.905149, 0, 0.4352941, 1, 1,
0.1786428, -0.5857331, 3.956707, 0, 0.4313726, 1, 1,
0.1788458, 0.8310516, 0.1292614, 0, 0.4235294, 1, 1,
0.1790519, -0.6871302, 3.623319, 0, 0.4196078, 1, 1,
0.1793947, 0.490723, -0.5314551, 0, 0.4117647, 1, 1,
0.1912217, -0.3755621, 3.696479, 0, 0.4078431, 1, 1,
0.191248, -0.4317736, 2.310768, 0, 0.4, 1, 1,
0.1945533, 1.219281, -0.451274, 0, 0.3921569, 1, 1,
0.1951837, -0.06318556, 0.0257961, 0, 0.3882353, 1, 1,
0.1977923, 0.2415174, 1.071135, 0, 0.3803922, 1, 1,
0.1985513, -1.688318, 2.689349, 0, 0.3764706, 1, 1,
0.1986274, 0.04403935, 0.02463409, 0, 0.3686275, 1, 1,
0.2013359, 0.8091366, 0.1806417, 0, 0.3647059, 1, 1,
0.2013701, -1.222703, 3.163696, 0, 0.3568628, 1, 1,
0.202711, 1.46493, -0.4410723, 0, 0.3529412, 1, 1,
0.2056191, 0.4328499, 1.837974, 0, 0.345098, 1, 1,
0.2060158, 0.1200143, 0.7488193, 0, 0.3411765, 1, 1,
0.2161674, -0.2900885, 2.289283, 0, 0.3333333, 1, 1,
0.2225175, 1.246221, 0.9702949, 0, 0.3294118, 1, 1,
0.2273081, 0.1880684, 1.016776, 0, 0.3215686, 1, 1,
0.2273418, -1.152523, 3.181066, 0, 0.3176471, 1, 1,
0.2275393, -0.7470238, 3.551912, 0, 0.3098039, 1, 1,
0.2317367, 1.078591, 1.038077, 0, 0.3058824, 1, 1,
0.2328091, -0.4175305, 2.573864, 0, 0.2980392, 1, 1,
0.2340107, -0.51178, 2.176953, 0, 0.2901961, 1, 1,
0.2367642, 0.7911233, 0.812959, 0, 0.2862745, 1, 1,
0.240071, 0.897782, -0.3983189, 0, 0.2784314, 1, 1,
0.2439162, -1.145982, 1.854758, 0, 0.2745098, 1, 1,
0.2456466, -1.04058, 3.189754, 0, 0.2666667, 1, 1,
0.2462252, 0.5251531, 1.248608, 0, 0.2627451, 1, 1,
0.2466022, 0.3530987, -0.6004186, 0, 0.254902, 1, 1,
0.2470459, 0.9811521, 1.682167, 0, 0.2509804, 1, 1,
0.2475472, -0.0897451, 2.872375, 0, 0.2431373, 1, 1,
0.2493536, -1.093045, 0.5135395, 0, 0.2392157, 1, 1,
0.2508349, -0.3551941, -0.6145228, 0, 0.2313726, 1, 1,
0.2531041, 0.2393243, 0.8124528, 0, 0.227451, 1, 1,
0.2619916, -0.959178, 3.274438, 0, 0.2196078, 1, 1,
0.2642676, 1.507013, -0.5759509, 0, 0.2156863, 1, 1,
0.264268, -1.108862, 3.070119, 0, 0.2078431, 1, 1,
0.265206, 0.04075314, 1.278328, 0, 0.2039216, 1, 1,
0.2734685, -2.399752, 2.408358, 0, 0.1960784, 1, 1,
0.27449, -0.2947349, 2.34115, 0, 0.1882353, 1, 1,
0.27629, -1.100079, 1.717096, 0, 0.1843137, 1, 1,
0.2810198, 1.671489, -0.1868819, 0, 0.1764706, 1, 1,
0.2866704, -0.274875, 0.6318492, 0, 0.172549, 1, 1,
0.2935804, -0.4583608, 3.190412, 0, 0.1647059, 1, 1,
0.2949231, 1.506203, 2.048381, 0, 0.1607843, 1, 1,
0.298222, -0.009054056, 3.226083, 0, 0.1529412, 1, 1,
0.2985569, 0.4835573, 0.6246589, 0, 0.1490196, 1, 1,
0.3028925, -0.3506483, 1.389281, 0, 0.1411765, 1, 1,
0.3050269, 0.2474574, 1.480238, 0, 0.1372549, 1, 1,
0.3101549, -0.4767398, 2.952938, 0, 0.1294118, 1, 1,
0.3144792, 0.5739674, -0.7626677, 0, 0.1254902, 1, 1,
0.3146877, 0.9993417, 1.233611, 0, 0.1176471, 1, 1,
0.3208291, -0.6339572, 3.690165, 0, 0.1137255, 1, 1,
0.3209588, -1.655883, 3.454062, 0, 0.1058824, 1, 1,
0.3253207, 0.5821567, -0.07020424, 0, 0.09803922, 1, 1,
0.3343987, 0.3072692, 1.38049, 0, 0.09411765, 1, 1,
0.3374465, -1.437584, 2.845087, 0, 0.08627451, 1, 1,
0.3402144, 0.3720775, 1.945906, 0, 0.08235294, 1, 1,
0.3541097, -0.1376659, 0.4872027, 0, 0.07450981, 1, 1,
0.3587846, 0.1117057, 0.6240495, 0, 0.07058824, 1, 1,
0.3595597, 0.9796319, 1.192362, 0, 0.0627451, 1, 1,
0.3643237, 0.1291461, 1.817284, 0, 0.05882353, 1, 1,
0.3668589, -0.9318744, 3.459716, 0, 0.05098039, 1, 1,
0.3684495, -0.6710566, 1.239617, 0, 0.04705882, 1, 1,
0.3729363, 0.5844321, 1.892525, 0, 0.03921569, 1, 1,
0.373925, -0.8572257, 2.706443, 0, 0.03529412, 1, 1,
0.375682, 0.571182, 0.9082251, 0, 0.02745098, 1, 1,
0.3768675, -1.08413, 2.280029, 0, 0.02352941, 1, 1,
0.3770656, -1.117298, 2.67524, 0, 0.01568628, 1, 1,
0.3813228, 0.5034148, -0.2337308, 0, 0.01176471, 1, 1,
0.3819698, -0.1584596, 1.41358, 0, 0.003921569, 1, 1,
0.3957704, 0.5848097, 0.3299024, 0.003921569, 0, 1, 1,
0.3960787, -0.4039289, 2.599785, 0.007843138, 0, 1, 1,
0.3984725, 0.1160198, 2.721698, 0.01568628, 0, 1, 1,
0.4047626, -0.7577164, 2.660792, 0.01960784, 0, 1, 1,
0.4058835, 2.264063, 0.4882906, 0.02745098, 0, 1, 1,
0.4093053, -0.04338641, 1.957621, 0.03137255, 0, 1, 1,
0.4230298, -0.6257617, 4.193042, 0.03921569, 0, 1, 1,
0.4253991, -1.211482, 2.37044, 0.04313726, 0, 1, 1,
0.4262663, 1.633033, 0.4167266, 0.05098039, 0, 1, 1,
0.4273284, 0.5377482, 0.1431749, 0.05490196, 0, 1, 1,
0.4303187, -0.4409881, 2.554713, 0.0627451, 0, 1, 1,
0.430747, 0.8585922, -0.5000596, 0.06666667, 0, 1, 1,
0.4324647, -1.142599, 2.28819, 0.07450981, 0, 1, 1,
0.4379364, -0.5034102, 2.799726, 0.07843138, 0, 1, 1,
0.4409246, -0.5741186, 2.47791, 0.08627451, 0, 1, 1,
0.446754, -0.658056, 2.71456, 0.09019608, 0, 1, 1,
0.4490555, 1.302858, -0.6221521, 0.09803922, 0, 1, 1,
0.4500649, 0.7714629, 0.4962376, 0.1058824, 0, 1, 1,
0.4513982, -1.92109, 3.888896, 0.1098039, 0, 1, 1,
0.4555625, 0.3694801, 1.592635, 0.1176471, 0, 1, 1,
0.4556528, 1.559263, 0.06392734, 0.1215686, 0, 1, 1,
0.4592902, 1.448641, -1.468316, 0.1294118, 0, 1, 1,
0.4602611, -0.04897086, 3.038109, 0.1333333, 0, 1, 1,
0.4608739, 2.141655, -0.9975884, 0.1411765, 0, 1, 1,
0.4644385, -0.970322, 2.96953, 0.145098, 0, 1, 1,
0.4701731, -0.7288445, 3.951892, 0.1529412, 0, 1, 1,
0.4770882, 0.1101627, 1.021608, 0.1568628, 0, 1, 1,
0.4890867, -0.9207248, 4.138542, 0.1647059, 0, 1, 1,
0.492244, -0.9791347, 1.006091, 0.1686275, 0, 1, 1,
0.4928203, 0.1200253, 2.198693, 0.1764706, 0, 1, 1,
0.4963908, -0.2817006, 2.522661, 0.1803922, 0, 1, 1,
0.4972585, 0.09048147, 1.284533, 0.1882353, 0, 1, 1,
0.499628, 0.4854804, 1.335763, 0.1921569, 0, 1, 1,
0.5035878, -1.53196, 2.281537, 0.2, 0, 1, 1,
0.5036031, 0.4733047, -0.4046907, 0.2078431, 0, 1, 1,
0.5037049, 0.6912901, 0.2085398, 0.2117647, 0, 1, 1,
0.5039893, -1.828055, 1.986858, 0.2196078, 0, 1, 1,
0.5044287, -0.3003027, 1.988842, 0.2235294, 0, 1, 1,
0.5046828, -1.083818, 3.052789, 0.2313726, 0, 1, 1,
0.5059399, -0.3542184, 1.36756, 0.2352941, 0, 1, 1,
0.5115167, 0.3748132, 0.3036315, 0.2431373, 0, 1, 1,
0.5138339, 1.027222, 0.6186557, 0.2470588, 0, 1, 1,
0.5189479, -0.9501848, 2.663256, 0.254902, 0, 1, 1,
0.5215328, -0.7972671, 0.9928503, 0.2588235, 0, 1, 1,
0.5258563, 0.7282483, -0.5159658, 0.2666667, 0, 1, 1,
0.5260583, 0.9774933, -0.2142906, 0.2705882, 0, 1, 1,
0.5338895, 0.658585, 1.246828, 0.2784314, 0, 1, 1,
0.538893, 0.1281446, 0.5015745, 0.282353, 0, 1, 1,
0.5402561, -1.407854, 3.459345, 0.2901961, 0, 1, 1,
0.5444767, -0.6647443, 1.985621, 0.2941177, 0, 1, 1,
0.5494293, 0.1360692, 1.234421, 0.3019608, 0, 1, 1,
0.5498764, 0.09075298, 1.561597, 0.3098039, 0, 1, 1,
0.5508592, 1.361063, -0.8052707, 0.3137255, 0, 1, 1,
0.5516884, 0.3294571, -0.49778, 0.3215686, 0, 1, 1,
0.552776, -0.7527446, 2.515339, 0.3254902, 0, 1, 1,
0.5527925, 0.1055382, 0.1737456, 0.3333333, 0, 1, 1,
0.5595146, 1.005266, 0.7612765, 0.3372549, 0, 1, 1,
0.5600269, -0.4177236, 0.8256247, 0.345098, 0, 1, 1,
0.5602951, 0.8164241, 0.9098369, 0.3490196, 0, 1, 1,
0.5605666, -0.6103557, 2.356143, 0.3568628, 0, 1, 1,
0.5610864, 0.3425852, -1.224194, 0.3607843, 0, 1, 1,
0.5618232, -0.1804959, 0.5268566, 0.3686275, 0, 1, 1,
0.5673362, -0.8602101, 4.511739, 0.372549, 0, 1, 1,
0.5692528, -0.5892801, 1.794211, 0.3803922, 0, 1, 1,
0.572489, -0.3282535, 2.889853, 0.3843137, 0, 1, 1,
0.5803805, 0.8867311, -0.5227293, 0.3921569, 0, 1, 1,
0.5880098, 1.461897, -0.2066622, 0.3960784, 0, 1, 1,
0.5908928, 2.462158, 1.302727, 0.4039216, 0, 1, 1,
0.5911313, 1.493725, -1.569347, 0.4117647, 0, 1, 1,
0.592429, 0.3549905, 3.661728, 0.4156863, 0, 1, 1,
0.5989072, -0.6054005, 3.449183, 0.4235294, 0, 1, 1,
0.5990764, -0.7402602, 4.017024, 0.427451, 0, 1, 1,
0.6029203, 1.555932, 0.5483189, 0.4352941, 0, 1, 1,
0.6031544, -0.3555149, 1.878606, 0.4392157, 0, 1, 1,
0.6123953, 0.6527092, -0.9478227, 0.4470588, 0, 1, 1,
0.6132101, -0.8766943, 2.801646, 0.4509804, 0, 1, 1,
0.6156332, 0.7068621, 1.397731, 0.4588235, 0, 1, 1,
0.6164641, 0.7125046, 0.0839294, 0.4627451, 0, 1, 1,
0.6198903, 2.458074, 0.6032572, 0.4705882, 0, 1, 1,
0.6294121, -0.1162659, -0.06284309, 0.4745098, 0, 1, 1,
0.6307295, -1.153105, 4.403625, 0.4823529, 0, 1, 1,
0.630777, 0.5232926, 2.148767, 0.4862745, 0, 1, 1,
0.6316864, -1.284821, 3.941056, 0.4941176, 0, 1, 1,
0.6328653, -1.500219, 4.184029, 0.5019608, 0, 1, 1,
0.6353782, -1.80015, 1.700636, 0.5058824, 0, 1, 1,
0.6386886, -1.091576, 2.857786, 0.5137255, 0, 1, 1,
0.641059, -0.06933177, 0.756855, 0.5176471, 0, 1, 1,
0.64298, -1.021637, 2.117625, 0.5254902, 0, 1, 1,
0.6432821, -2.622719, 3.138409, 0.5294118, 0, 1, 1,
0.6460107, -0.9605802, 2.874361, 0.5372549, 0, 1, 1,
0.6467342, 1.910601, 0.1286219, 0.5411765, 0, 1, 1,
0.6561024, 0.4834215, 0.8814157, 0.5490196, 0, 1, 1,
0.6647102, 1.461488, 0.8464482, 0.5529412, 0, 1, 1,
0.667511, 1.912439, 0.3738401, 0.5607843, 0, 1, 1,
0.6697509, -0.9408501, 1.859408, 0.5647059, 0, 1, 1,
0.670242, 0.3049372, -0.2129157, 0.572549, 0, 1, 1,
0.6759662, 0.1491243, 2.393009, 0.5764706, 0, 1, 1,
0.6783446, -1.208512, 2.619148, 0.5843138, 0, 1, 1,
0.6808782, -2.47782, 2.237076, 0.5882353, 0, 1, 1,
0.6845767, -1.856971, 3.193283, 0.5960785, 0, 1, 1,
0.6868563, 0.2413116, 1.062425, 0.6039216, 0, 1, 1,
0.6886144, 0.1617005, 0.9193795, 0.6078432, 0, 1, 1,
0.6923046, 0.6730274, 0.0002588333, 0.6156863, 0, 1, 1,
0.701462, -0.9864942, 2.2581, 0.6196079, 0, 1, 1,
0.7075884, 0.6754237, 0.07178573, 0.627451, 0, 1, 1,
0.7093366, -1.029521, 0.7077789, 0.6313726, 0, 1, 1,
0.7105431, 0.3461076, 0.3740591, 0.6392157, 0, 1, 1,
0.716615, 0.5672589, 1.478199, 0.6431373, 0, 1, 1,
0.7173105, -0.5188047, 1.836568, 0.6509804, 0, 1, 1,
0.7194706, 0.348393, -0.7042512, 0.654902, 0, 1, 1,
0.7248969, -1.207983, 4.181705, 0.6627451, 0, 1, 1,
0.7257198, -0.5301007, 1.754452, 0.6666667, 0, 1, 1,
0.7307639, -1.148728, 1.853976, 0.6745098, 0, 1, 1,
0.7388797, 0.4355108, 0.805685, 0.6784314, 0, 1, 1,
0.7401137, -0.4488092, 2.436568, 0.6862745, 0, 1, 1,
0.7423739, -1.776273, 2.7295, 0.6901961, 0, 1, 1,
0.7426484, 0.1857327, 1.079334, 0.6980392, 0, 1, 1,
0.7446682, -1.036756, 1.667794, 0.7058824, 0, 1, 1,
0.7481471, -0.5027763, 2.159683, 0.7098039, 0, 1, 1,
0.7535813, -0.2807615, 2.294505, 0.7176471, 0, 1, 1,
0.7579895, -1.461258, 3.973102, 0.7215686, 0, 1, 1,
0.7602977, 0.7161155, 0.1058199, 0.7294118, 0, 1, 1,
0.7717103, 0.6519353, 0.8951002, 0.7333333, 0, 1, 1,
0.7726108, 0.2706616, 2.144349, 0.7411765, 0, 1, 1,
0.773411, 0.09446202, 0.2534158, 0.7450981, 0, 1, 1,
0.7745247, 0.5251718, -0.09161296, 0.7529412, 0, 1, 1,
0.7829366, -0.7994283, 2.231837, 0.7568628, 0, 1, 1,
0.78325, 0.1303688, 0.8189526, 0.7647059, 0, 1, 1,
0.7898217, -0.1428663, 1.795951, 0.7686275, 0, 1, 1,
0.7989904, 1.364543, 1.128149, 0.7764706, 0, 1, 1,
0.8012123, -0.3297395, 1.749521, 0.7803922, 0, 1, 1,
0.8021669, -0.05713372, 0.3479827, 0.7882353, 0, 1, 1,
0.8023648, -1.546016, 0.7463539, 0.7921569, 0, 1, 1,
0.8051724, -0.1796641, 1.273227, 0.8, 0, 1, 1,
0.8054731, -1.61729, 3.134522, 0.8078431, 0, 1, 1,
0.8066639, -0.7355645, 2.494842, 0.8117647, 0, 1, 1,
0.8076616, 1.027411, -0.04313708, 0.8196079, 0, 1, 1,
0.8080216, -0.4894232, 2.394094, 0.8235294, 0, 1, 1,
0.8185683, -2.105347, 1.908922, 0.8313726, 0, 1, 1,
0.8203163, -0.6246126, 2.758536, 0.8352941, 0, 1, 1,
0.8271255, -2.015728, 1.143045, 0.8431373, 0, 1, 1,
0.8287362, -1.055387, 1.973939, 0.8470588, 0, 1, 1,
0.8288515, 0.3129744, 2.7431, 0.854902, 0, 1, 1,
0.8303648, -0.3622985, 1.957906, 0.8588235, 0, 1, 1,
0.8332172, -0.6484269, 4.297869, 0.8666667, 0, 1, 1,
0.83432, -1.004587, 2.669606, 0.8705882, 0, 1, 1,
0.8358668, -0.401982, 2.982552, 0.8784314, 0, 1, 1,
0.8367553, -1.819248, 3.506431, 0.8823529, 0, 1, 1,
0.8392833, 0.7814735, 2.73798, 0.8901961, 0, 1, 1,
0.8554808, 0.551788, 1.205958, 0.8941177, 0, 1, 1,
0.8567774, -0.3061731, 1.232833, 0.9019608, 0, 1, 1,
0.8614539, 0.1578563, 2.15977, 0.9098039, 0, 1, 1,
0.8618878, -1.163729, 3.516934, 0.9137255, 0, 1, 1,
0.8623657, -0.05607463, 1.700423, 0.9215686, 0, 1, 1,
0.8650465, 0.4197403, 1.355729, 0.9254902, 0, 1, 1,
0.8654752, 1.002226, 1.217684, 0.9333333, 0, 1, 1,
0.8708736, -0.7327923, 2.34048, 0.9372549, 0, 1, 1,
0.8714745, 0.4197518, 1.117763, 0.945098, 0, 1, 1,
0.8732499, -0.7085676, 4.403915, 0.9490196, 0, 1, 1,
0.8791821, -2.447352, 2.081745, 0.9568627, 0, 1, 1,
0.882497, -0.4719155, 2.699236, 0.9607843, 0, 1, 1,
0.8844166, 0.5279925, 1.809066, 0.9686275, 0, 1, 1,
0.8896835, -0.9961764, 1.99255, 0.972549, 0, 1, 1,
0.9099942, -0.5950022, 2.383851, 0.9803922, 0, 1, 1,
0.9130598, 1.407004, -1.182875, 0.9843137, 0, 1, 1,
0.9149484, 1.153563, -0.5683093, 0.9921569, 0, 1, 1,
0.9172755, 0.7341532, 0.7297702, 0.9960784, 0, 1, 1,
0.9199595, -0.2319781, 1.211838, 1, 0, 0.9960784, 1,
0.9217219, 0.8517311, -0.6894412, 1, 0, 0.9882353, 1,
0.92189, -2.392336, 3.938127, 1, 0, 0.9843137, 1,
0.9220013, -0.4790167, 0.4770539, 1, 0, 0.9764706, 1,
0.9236369, -0.4089614, 3.005581, 1, 0, 0.972549, 1,
0.9240176, -0.9563138, 3.47594, 1, 0, 0.9647059, 1,
0.9300013, 0.3288219, 1.762966, 1, 0, 0.9607843, 1,
0.931391, -0.4946312, 1.412735, 1, 0, 0.9529412, 1,
0.9334716, -0.1032181, 1.915523, 1, 0, 0.9490196, 1,
0.9378101, -0.8991907, 1.663876, 1, 0, 0.9411765, 1,
0.9385618, 1.351176, -0.1030569, 1, 0, 0.9372549, 1,
0.9424178, -0.1917737, 1.492108, 1, 0, 0.9294118, 1,
0.9428259, -1.310041, 2.642094, 1, 0, 0.9254902, 1,
0.9436284, 0.3649986, 1.882126, 1, 0, 0.9176471, 1,
0.9513174, 1.563824, -1.026593, 1, 0, 0.9137255, 1,
0.9546323, -0.1058113, 2.41376, 1, 0, 0.9058824, 1,
0.9588709, 0.3478231, 0.9532332, 1, 0, 0.9019608, 1,
0.9638691, -0.7432082, 2.289887, 1, 0, 0.8941177, 1,
0.9686333, -0.6214399, 3.531367, 1, 0, 0.8862745, 1,
0.9717939, -1.050248, 1.962986, 1, 0, 0.8823529, 1,
0.9766319, 0.180542, 0.1208957, 1, 0, 0.8745098, 1,
0.9777054, -0.6034532, 2.880369, 1, 0, 0.8705882, 1,
0.9783092, -0.8833034, 2.620056, 1, 0, 0.8627451, 1,
0.9860267, 1.186542, 1.580826, 1, 0, 0.8588235, 1,
1.008325, 1.163513, -0.755327, 1, 0, 0.8509804, 1,
1.009772, 1.077464, -0.5977089, 1, 0, 0.8470588, 1,
1.023348, 0.2088216, 1.661762, 1, 0, 0.8392157, 1,
1.023841, 0.3059619, 0.27689, 1, 0, 0.8352941, 1,
1.036047, 0.6731527, 0.08482215, 1, 0, 0.827451, 1,
1.040376, -0.1416894, 2.278676, 1, 0, 0.8235294, 1,
1.04185, -0.3023744, 0.7069099, 1, 0, 0.8156863, 1,
1.042437, 0.3610065, 1.456978, 1, 0, 0.8117647, 1,
1.045443, -0.1605745, 2.492857, 1, 0, 0.8039216, 1,
1.04955, 1.274177, -0.7321367, 1, 0, 0.7960784, 1,
1.052126, 0.614195, 0.613255, 1, 0, 0.7921569, 1,
1.056122, -0.06580535, 0.9737488, 1, 0, 0.7843137, 1,
1.062645, 1.745489, 0.8400143, 1, 0, 0.7803922, 1,
1.064233, 0.7511678, 0.8783719, 1, 0, 0.772549, 1,
1.066049, -1.345785, 1.153883, 1, 0, 0.7686275, 1,
1.071324, 0.1221594, 1.835041, 1, 0, 0.7607843, 1,
1.076676, 1.584492, 0.6665992, 1, 0, 0.7568628, 1,
1.077633, 0.4600453, -0.2209071, 1, 0, 0.7490196, 1,
1.084889, 1.003663, 1.358185, 1, 0, 0.7450981, 1,
1.085181, 0.2501187, 0.7689841, 1, 0, 0.7372549, 1,
1.087788, -0.6122094, 1.706628, 1, 0, 0.7333333, 1,
1.089526, -2.556542, 2.582085, 1, 0, 0.7254902, 1,
1.090022, -2.066559, 3.769372, 1, 0, 0.7215686, 1,
1.09569, 0.6391191, 2.924354, 1, 0, 0.7137255, 1,
1.099027, 1.262747, 1.594822, 1, 0, 0.7098039, 1,
1.100937, 1.554089, 0.1029794, 1, 0, 0.7019608, 1,
1.101651, 0.7530935, 0.9186935, 1, 0, 0.6941177, 1,
1.115594, -1.751173, 3.369491, 1, 0, 0.6901961, 1,
1.116463, -1.325308, 2.09934, 1, 0, 0.682353, 1,
1.1225, 0.436158, 0.9142479, 1, 0, 0.6784314, 1,
1.123973, 0.948956, 2.459322, 1, 0, 0.6705883, 1,
1.125422, 0.5238953, 0.3627747, 1, 0, 0.6666667, 1,
1.140339, 0.8894882, 2.552696, 1, 0, 0.6588235, 1,
1.145191, -0.8501353, 3.101207, 1, 0, 0.654902, 1,
1.145197, 0.2416218, 0.9672858, 1, 0, 0.6470588, 1,
1.148426, -1.133832, 3.056936, 1, 0, 0.6431373, 1,
1.157311, -0.1691443, 2.423854, 1, 0, 0.6352941, 1,
1.164523, 0.421425, 0.1446456, 1, 0, 0.6313726, 1,
1.164955, -2.438705, 2.57334, 1, 0, 0.6235294, 1,
1.171078, 1.470841, 0.9657356, 1, 0, 0.6196079, 1,
1.173558, -1.058871, 3.344691, 1, 0, 0.6117647, 1,
1.174771, 0.5189921, 2.85484, 1, 0, 0.6078432, 1,
1.176745, -0.6403305, 2.522689, 1, 0, 0.6, 1,
1.186113, 1.27743, 0.7348243, 1, 0, 0.5921569, 1,
1.187798, -0.02306788, 3.615509, 1, 0, 0.5882353, 1,
1.188486, 0.7670546, 2.243237, 1, 0, 0.5803922, 1,
1.191792, -0.03718292, 2.426325, 1, 0, 0.5764706, 1,
1.195, 0.1474097, 1.456383, 1, 0, 0.5686275, 1,
1.198707, 0.7203277, 0.2490563, 1, 0, 0.5647059, 1,
1.198884, 1.629891, 0.5707545, 1, 0, 0.5568628, 1,
1.199162, 0.6998836, 1.531123, 1, 0, 0.5529412, 1,
1.216985, -1.890943, 1.341997, 1, 0, 0.5450981, 1,
1.249054, -1.745972, 1.76757, 1, 0, 0.5411765, 1,
1.249259, 1.223989, 0.341308, 1, 0, 0.5333334, 1,
1.251132, 0.6138477, 1.192092, 1, 0, 0.5294118, 1,
1.278372, 0.5816351, 0.8343298, 1, 0, 0.5215687, 1,
1.302834, -1.202967, 1.462596, 1, 0, 0.5176471, 1,
1.326297, 0.6180488, 0.9907777, 1, 0, 0.509804, 1,
1.327927, -0.9612209, 0.9087933, 1, 0, 0.5058824, 1,
1.329898, -0.1486834, 3.423209, 1, 0, 0.4980392, 1,
1.331906, -0.7450351, 2.928715, 1, 0, 0.4901961, 1,
1.333762, 0.4265538, -0.01074161, 1, 0, 0.4862745, 1,
1.340097, 1.120944, 0.3728044, 1, 0, 0.4784314, 1,
1.385319, -1.010959, 1.286105, 1, 0, 0.4745098, 1,
1.386341, 1.146427, 2.495139, 1, 0, 0.4666667, 1,
1.393024, -0.6812153, 2.943958, 1, 0, 0.4627451, 1,
1.399464, 0.09898777, 0.8655465, 1, 0, 0.454902, 1,
1.422024, 1.441058, -0.08301086, 1, 0, 0.4509804, 1,
1.422509, -0.4453599, 1.298872, 1, 0, 0.4431373, 1,
1.423651, 0.08854173, 1.498181, 1, 0, 0.4392157, 1,
1.42751, -1.131216, 3.036378, 1, 0, 0.4313726, 1,
1.437294, -0.05463883, 2.645748, 1, 0, 0.427451, 1,
1.452556, -1.267803, 2.119431, 1, 0, 0.4196078, 1,
1.454312, -2.371607, 3.081264, 1, 0, 0.4156863, 1,
1.469989, 1.690301, 0.1996306, 1, 0, 0.4078431, 1,
1.471515, 0.08341055, 1.992985, 1, 0, 0.4039216, 1,
1.481352, 0.2019585, 2.755148, 1, 0, 0.3960784, 1,
1.493755, -0.3809951, 1.645534, 1, 0, 0.3882353, 1,
1.500159, -0.1341877, 1.139786, 1, 0, 0.3843137, 1,
1.503394, -0.8872938, 2.071504, 1, 0, 0.3764706, 1,
1.528805, 0.4039518, 1.045095, 1, 0, 0.372549, 1,
1.532233, -1.454978, 0.07655573, 1, 0, 0.3647059, 1,
1.544545, 1.527717, 1.364502, 1, 0, 0.3607843, 1,
1.549533, 0.2573006, 0.6832997, 1, 0, 0.3529412, 1,
1.551255, 1.603803, -0.1708231, 1, 0, 0.3490196, 1,
1.561464, -1.252324, 4.005199, 1, 0, 0.3411765, 1,
1.565411, -0.4850138, 2.027738, 1, 0, 0.3372549, 1,
1.568007, -1.709268, 1.153689, 1, 0, 0.3294118, 1,
1.59173, 0.7080063, 1.274889, 1, 0, 0.3254902, 1,
1.591849, 1.483131, 1.428789, 1, 0, 0.3176471, 1,
1.597598, 0.1852905, 2.697544, 1, 0, 0.3137255, 1,
1.605975, -0.5544338, 3.633438, 1, 0, 0.3058824, 1,
1.630864, -1.366141, 1.345475, 1, 0, 0.2980392, 1,
1.632166, 1.77986, 0.1181178, 1, 0, 0.2941177, 1,
1.638601, -1.695593, 0.5716798, 1, 0, 0.2862745, 1,
1.640436, -0.7705028, 3.954118, 1, 0, 0.282353, 1,
1.645737, -2.295, 1.471653, 1, 0, 0.2745098, 1,
1.648364, 0.9630892, 3.168142, 1, 0, 0.2705882, 1,
1.650885, 0.8491644, 1.48788, 1, 0, 0.2627451, 1,
1.66729, 0.5835937, 2.079546, 1, 0, 0.2588235, 1,
1.678922, -0.05883502, 1.986974, 1, 0, 0.2509804, 1,
1.685363, -0.743535, 1.703398, 1, 0, 0.2470588, 1,
1.713568, -0.5743251, 1.90796, 1, 0, 0.2392157, 1,
1.732171, -1.616609, 1.87781, 1, 0, 0.2352941, 1,
1.737828, -0.1816557, 0.1160698, 1, 0, 0.227451, 1,
1.740388, -0.03723315, 0.2152114, 1, 0, 0.2235294, 1,
1.743817, -0.01972573, 2.057616, 1, 0, 0.2156863, 1,
1.759057, -0.5272011, 0.9046142, 1, 0, 0.2117647, 1,
1.803359, -0.4305242, 2.361135, 1, 0, 0.2039216, 1,
1.850412, 1.809048, 2.053808, 1, 0, 0.1960784, 1,
1.857437, -1.289224, 2.042808, 1, 0, 0.1921569, 1,
1.888041, 0.485135, 1.989435, 1, 0, 0.1843137, 1,
1.889934, 1.470605, 1.011994, 1, 0, 0.1803922, 1,
1.911617, 0.007041496, 1.29046, 1, 0, 0.172549, 1,
1.924165, -0.9944915, 1.992872, 1, 0, 0.1686275, 1,
1.95123, -0.7754116, 2.375298, 1, 0, 0.1607843, 1,
2.024998, -1.022117, 3.48336, 1, 0, 0.1568628, 1,
2.029621, -0.2113807, 0.9448593, 1, 0, 0.1490196, 1,
2.037721, 1.299688, 0.5225717, 1, 0, 0.145098, 1,
2.041792, 0.6835942, 1.078509, 1, 0, 0.1372549, 1,
2.07364, -0.06952547, 3.121718, 1, 0, 0.1333333, 1,
2.105481, -0.6772306, 1.125681, 1, 0, 0.1254902, 1,
2.18192, -0.4912494, 1.680693, 1, 0, 0.1215686, 1,
2.19864, 0.9321676, 1.982299, 1, 0, 0.1137255, 1,
2.201717, 0.3319778, 1.067839, 1, 0, 0.1098039, 1,
2.204765, -1.596617, 2.184395, 1, 0, 0.1019608, 1,
2.220672, -0.5160353, 1.736422, 1, 0, 0.09411765, 1,
2.228547, -0.6626186, 1.370876, 1, 0, 0.09019608, 1,
2.255847, 0.3903165, -0.9874352, 1, 0, 0.08235294, 1,
2.28766, 0.1894579, 1.147184, 1, 0, 0.07843138, 1,
2.293255, -0.7196361, 3.18035, 1, 0, 0.07058824, 1,
2.298594, -0.750485, 1.423634, 1, 0, 0.06666667, 1,
2.358621, 0.2772645, 0.7111122, 1, 0, 0.05882353, 1,
2.40891, 2.029924, 2.245183, 1, 0, 0.05490196, 1,
2.488331, 1.820512, 1.531393, 1, 0, 0.04705882, 1,
2.52886, -0.6720909, 1.427034, 1, 0, 0.04313726, 1,
2.676823, -1.267808, 2.516339, 1, 0, 0.03529412, 1,
2.678144, 1.39401, -0.0400211, 1, 0, 0.03137255, 1,
2.726653, 0.9484692, 2.241596, 1, 0, 0.02352941, 1,
2.854716, -0.1637508, 2.54002, 1, 0, 0.01960784, 1,
2.90203, -0.3110561, 3.233965, 1, 0, 0.01176471, 1,
3.368345, -0.5299512, 0.1826137, 1, 0, 0.007843138, 1
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
0.1428384, -3.905116, -6.811996, 0, -0.5, 0.5, 0.5,
0.1428384, -3.905116, -6.811996, 1, -0.5, 0.5, 0.5,
0.1428384, -3.905116, -6.811996, 1, 1.5, 0.5, 0.5,
0.1428384, -3.905116, -6.811996, 0, 1.5, 0.5, 0.5
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
-4.176116, 0.2275834, -6.811996, 0, -0.5, 0.5, 0.5,
-4.176116, 0.2275834, -6.811996, 1, -0.5, 0.5, 0.5,
-4.176116, 0.2275834, -6.811996, 1, 1.5, 0.5, 0.5,
-4.176116, 0.2275834, -6.811996, 0, 1.5, 0.5, 0.5
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
-4.176116, -3.905116, 0.141645, 0, -0.5, 0.5, 0.5,
-4.176116, -3.905116, 0.141645, 1, -0.5, 0.5, 0.5,
-4.176116, -3.905116, 0.141645, 1, 1.5, 0.5, 0.5,
-4.176116, -3.905116, 0.141645, 0, 1.5, 0.5, 0.5
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
-3, -2.951416, -5.207309,
3, -2.951416, -5.207309,
-3, -2.951416, -5.207309,
-3, -3.110366, -5.474757,
-2, -2.951416, -5.207309,
-2, -3.110366, -5.474757,
-1, -2.951416, -5.207309,
-1, -3.110366, -5.474757,
0, -2.951416, -5.207309,
0, -3.110366, -5.474757,
1, -2.951416, -5.207309,
1, -3.110366, -5.474757,
2, -2.951416, -5.207309,
2, -3.110366, -5.474757,
3, -2.951416, -5.207309,
3, -3.110366, -5.474757
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
-3, -3.428266, -6.009653, 0, -0.5, 0.5, 0.5,
-3, -3.428266, -6.009653, 1, -0.5, 0.5, 0.5,
-3, -3.428266, -6.009653, 1, 1.5, 0.5, 0.5,
-3, -3.428266, -6.009653, 0, 1.5, 0.5, 0.5,
-2, -3.428266, -6.009653, 0, -0.5, 0.5, 0.5,
-2, -3.428266, -6.009653, 1, -0.5, 0.5, 0.5,
-2, -3.428266, -6.009653, 1, 1.5, 0.5, 0.5,
-2, -3.428266, -6.009653, 0, 1.5, 0.5, 0.5,
-1, -3.428266, -6.009653, 0, -0.5, 0.5, 0.5,
-1, -3.428266, -6.009653, 1, -0.5, 0.5, 0.5,
-1, -3.428266, -6.009653, 1, 1.5, 0.5, 0.5,
-1, -3.428266, -6.009653, 0, 1.5, 0.5, 0.5,
0, -3.428266, -6.009653, 0, -0.5, 0.5, 0.5,
0, -3.428266, -6.009653, 1, -0.5, 0.5, 0.5,
0, -3.428266, -6.009653, 1, 1.5, 0.5, 0.5,
0, -3.428266, -6.009653, 0, 1.5, 0.5, 0.5,
1, -3.428266, -6.009653, 0, -0.5, 0.5, 0.5,
1, -3.428266, -6.009653, 1, -0.5, 0.5, 0.5,
1, -3.428266, -6.009653, 1, 1.5, 0.5, 0.5,
1, -3.428266, -6.009653, 0, 1.5, 0.5, 0.5,
2, -3.428266, -6.009653, 0, -0.5, 0.5, 0.5,
2, -3.428266, -6.009653, 1, -0.5, 0.5, 0.5,
2, -3.428266, -6.009653, 1, 1.5, 0.5, 0.5,
2, -3.428266, -6.009653, 0, 1.5, 0.5, 0.5,
3, -3.428266, -6.009653, 0, -0.5, 0.5, 0.5,
3, -3.428266, -6.009653, 1, -0.5, 0.5, 0.5,
3, -3.428266, -6.009653, 1, 1.5, 0.5, 0.5,
3, -3.428266, -6.009653, 0, 1.5, 0.5, 0.5
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
-3.179434, -2, -5.207309,
-3.179434, 3, -5.207309,
-3.179434, -2, -5.207309,
-3.345548, -2, -5.474757,
-3.179434, -1, -5.207309,
-3.345548, -1, -5.474757,
-3.179434, 0, -5.207309,
-3.345548, 0, -5.474757,
-3.179434, 1, -5.207309,
-3.345548, 1, -5.474757,
-3.179434, 2, -5.207309,
-3.345548, 2, -5.474757,
-3.179434, 3, -5.207309,
-3.345548, 3, -5.474757
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
-3.677775, -2, -6.009653, 0, -0.5, 0.5, 0.5,
-3.677775, -2, -6.009653, 1, -0.5, 0.5, 0.5,
-3.677775, -2, -6.009653, 1, 1.5, 0.5, 0.5,
-3.677775, -2, -6.009653, 0, 1.5, 0.5, 0.5,
-3.677775, -1, -6.009653, 0, -0.5, 0.5, 0.5,
-3.677775, -1, -6.009653, 1, -0.5, 0.5, 0.5,
-3.677775, -1, -6.009653, 1, 1.5, 0.5, 0.5,
-3.677775, -1, -6.009653, 0, 1.5, 0.5, 0.5,
-3.677775, 0, -6.009653, 0, -0.5, 0.5, 0.5,
-3.677775, 0, -6.009653, 1, -0.5, 0.5, 0.5,
-3.677775, 0, -6.009653, 1, 1.5, 0.5, 0.5,
-3.677775, 0, -6.009653, 0, 1.5, 0.5, 0.5,
-3.677775, 1, -6.009653, 0, -0.5, 0.5, 0.5,
-3.677775, 1, -6.009653, 1, -0.5, 0.5, 0.5,
-3.677775, 1, -6.009653, 1, 1.5, 0.5, 0.5,
-3.677775, 1, -6.009653, 0, 1.5, 0.5, 0.5,
-3.677775, 2, -6.009653, 0, -0.5, 0.5, 0.5,
-3.677775, 2, -6.009653, 1, -0.5, 0.5, 0.5,
-3.677775, 2, -6.009653, 1, 1.5, 0.5, 0.5,
-3.677775, 2, -6.009653, 0, 1.5, 0.5, 0.5,
-3.677775, 3, -6.009653, 0, -0.5, 0.5, 0.5,
-3.677775, 3, -6.009653, 1, -0.5, 0.5, 0.5,
-3.677775, 3, -6.009653, 1, 1.5, 0.5, 0.5,
-3.677775, 3, -6.009653, 0, 1.5, 0.5, 0.5
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
-3.179434, -2.951416, -4,
-3.179434, -2.951416, 4,
-3.179434, -2.951416, -4,
-3.345548, -3.110366, -4,
-3.179434, -2.951416, -2,
-3.345548, -3.110366, -2,
-3.179434, -2.951416, 0,
-3.345548, -3.110366, 0,
-3.179434, -2.951416, 2,
-3.345548, -3.110366, 2,
-3.179434, -2.951416, 4,
-3.345548, -3.110366, 4
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
-3.677775, -3.428266, -4, 0, -0.5, 0.5, 0.5,
-3.677775, -3.428266, -4, 1, -0.5, 0.5, 0.5,
-3.677775, -3.428266, -4, 1, 1.5, 0.5, 0.5,
-3.677775, -3.428266, -4, 0, 1.5, 0.5, 0.5,
-3.677775, -3.428266, -2, 0, -0.5, 0.5, 0.5,
-3.677775, -3.428266, -2, 1, -0.5, 0.5, 0.5,
-3.677775, -3.428266, -2, 1, 1.5, 0.5, 0.5,
-3.677775, -3.428266, -2, 0, 1.5, 0.5, 0.5,
-3.677775, -3.428266, 0, 0, -0.5, 0.5, 0.5,
-3.677775, -3.428266, 0, 1, -0.5, 0.5, 0.5,
-3.677775, -3.428266, 0, 1, 1.5, 0.5, 0.5,
-3.677775, -3.428266, 0, 0, 1.5, 0.5, 0.5,
-3.677775, -3.428266, 2, 0, -0.5, 0.5, 0.5,
-3.677775, -3.428266, 2, 1, -0.5, 0.5, 0.5,
-3.677775, -3.428266, 2, 1, 1.5, 0.5, 0.5,
-3.677775, -3.428266, 2, 0, 1.5, 0.5, 0.5,
-3.677775, -3.428266, 4, 0, -0.5, 0.5, 0.5,
-3.677775, -3.428266, 4, 1, -0.5, 0.5, 0.5,
-3.677775, -3.428266, 4, 1, 1.5, 0.5, 0.5,
-3.677775, -3.428266, 4, 0, 1.5, 0.5, 0.5
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
-3.179434, -2.951416, -5.207309,
-3.179434, 3.406583, -5.207309,
-3.179434, -2.951416, 5.490599,
-3.179434, 3.406583, 5.490599,
-3.179434, -2.951416, -5.207309,
-3.179434, -2.951416, 5.490599,
-3.179434, 3.406583, -5.207309,
-3.179434, 3.406583, 5.490599,
-3.179434, -2.951416, -5.207309,
3.465111, -2.951416, -5.207309,
-3.179434, -2.951416, 5.490599,
3.465111, -2.951416, 5.490599,
-3.179434, 3.406583, -5.207309,
3.465111, 3.406583, -5.207309,
-3.179434, 3.406583, 5.490599,
3.465111, 3.406583, 5.490599,
3.465111, -2.951416, -5.207309,
3.465111, 3.406583, -5.207309,
3.465111, -2.951416, 5.490599,
3.465111, 3.406583, 5.490599,
3.465111, -2.951416, -5.207309,
3.465111, -2.951416, 5.490599,
3.465111, 3.406583, -5.207309,
3.465111, 3.406583, 5.490599
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
var radius = 7.53309;
var distance = 33.51557;
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
mvMatrix.translate( -0.1428384, -0.2275834, -0.141645 );
mvMatrix.scale( 1.225806, 1.281052, 0.7613567 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.51557);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
monosodium_arsenate_<-read.table("monosodium_arsenate_.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-monosodium_arsenate_$V2
```

```
## Error in eval(expr, envir, enclos): object 'monosodium_arsenate_' not found
```

```r
y<-monosodium_arsenate_$V3
```

```
## Error in eval(expr, envir, enclos): object 'monosodium_arsenate_' not found
```

```r
z<-monosodium_arsenate_$V4
```

```
## Error in eval(expr, envir, enclos): object 'monosodium_arsenate_' not found
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
-3.082669, -0.8085266, -3.9853, 0, 0, 1, 1, 1,
-2.729664, 0.8451189, -1.173805, 1, 0, 0, 1, 1,
-2.695138, -0.1095666, -2.091784, 1, 0, 0, 1, 1,
-2.682048, -2.502125, -1.676384, 1, 0, 0, 1, 1,
-2.675813, 1.226581, -1.275778, 1, 0, 0, 1, 1,
-2.675232, 1.453197, 0.4392199, 1, 0, 0, 1, 1,
-2.631194, 0.1341701, -1.768816, 0, 0, 0, 1, 1,
-2.620582, -0.7876078, -1.418064, 0, 0, 0, 1, 1,
-2.576824, -1.571567, -0.9293401, 0, 0, 0, 1, 1,
-2.494332, -0.8731074, -1.638523, 0, 0, 0, 1, 1,
-2.442722, -1.30054, -3.302683, 0, 0, 0, 1, 1,
-2.429666, 0.5294632, -1.353554, 0, 0, 0, 1, 1,
-2.373927, -0.8817023, -2.045424, 0, 0, 0, 1, 1,
-2.345415, 2.886205, -0.88334, 1, 1, 1, 1, 1,
-2.339437, 1.814837, -1.530188, 1, 1, 1, 1, 1,
-2.269476, 1.295123, -0.1915105, 1, 1, 1, 1, 1,
-2.242274, 0.5847065, -0.4549562, 1, 1, 1, 1, 1,
-2.241539, -0.1321272, -1.418971, 1, 1, 1, 1, 1,
-2.214387, 0.321842, -0.6605958, 1, 1, 1, 1, 1,
-2.208245, 0.9509245, 0.07261205, 1, 1, 1, 1, 1,
-2.202735, 0.9178675, -1.918728, 1, 1, 1, 1, 1,
-2.180956, 0.5127633, -0.7552176, 1, 1, 1, 1, 1,
-2.175062, -0.7276422, -2.385237, 1, 1, 1, 1, 1,
-2.151065, 0.3702606, -0.07899946, 1, 1, 1, 1, 1,
-2.146655, -0.4737307, -3.481116, 1, 1, 1, 1, 1,
-2.135858, -0.7819666, -1.886109, 1, 1, 1, 1, 1,
-2.1192, -1.885321, -4.358325, 1, 1, 1, 1, 1,
-2.110311, 1.897529, -0.3873788, 1, 1, 1, 1, 1,
-2.073579, 1.866604, -0.9074492, 0, 0, 1, 1, 1,
-2.070606, -1.207553, -1.777026, 1, 0, 0, 1, 1,
-2.063536, -0.2165503, -3.917164, 1, 0, 0, 1, 1,
-2.060081, -0.03842451, -1.771377, 1, 0, 0, 1, 1,
-2.054489, 0.7568235, -1.043483, 1, 0, 0, 1, 1,
-2.052512, 0.9436945, -2.393927, 1, 0, 0, 1, 1,
-2.014681, -1.297994, -2.201018, 0, 0, 0, 1, 1,
-2.00202, -1.304289, -3.507126, 0, 0, 0, 1, 1,
-1.975365, -1.08129, -1.617169, 0, 0, 0, 1, 1,
-1.91621, -0.7071973, -1.068801, 0, 0, 0, 1, 1,
-1.904485, 0.08273163, -1.967503, 0, 0, 0, 1, 1,
-1.902109, 0.6249256, -2.528879, 0, 0, 0, 1, 1,
-1.877129, -1.054398, -3.41361, 0, 0, 0, 1, 1,
-1.870104, 1.308266, -1.066349, 1, 1, 1, 1, 1,
-1.856838, -1.601749, -2.166269, 1, 1, 1, 1, 1,
-1.850366, 0.8464156, -0.5301114, 1, 1, 1, 1, 1,
-1.845645, -0.6103567, -2.497423, 1, 1, 1, 1, 1,
-1.835842, 0.134287, -0.8945416, 1, 1, 1, 1, 1,
-1.814365, 0.5636403, -1.671323, 1, 1, 1, 1, 1,
-1.80984, 0.005162789, -0.3347954, 1, 1, 1, 1, 1,
-1.806515, -1.212672, -2.985086, 1, 1, 1, 1, 1,
-1.804819, -0.4606848, -3.030897, 1, 1, 1, 1, 1,
-1.76223, -0.674603, -0.5202936, 1, 1, 1, 1, 1,
-1.759395, 0.2235966, -3.103523, 1, 1, 1, 1, 1,
-1.745898, 0.07449006, -1.430745, 1, 1, 1, 1, 1,
-1.74165, -0.8967465, -3.529198, 1, 1, 1, 1, 1,
-1.737694, 0.7466521, -0.4988363, 1, 1, 1, 1, 1,
-1.7291, -1.443866, -2.646642, 1, 1, 1, 1, 1,
-1.717546, 0.5500182, -0.5993767, 0, 0, 1, 1, 1,
-1.716823, -1.934179, -1.496531, 1, 0, 0, 1, 1,
-1.716282, -0.7408199, -2.614729, 1, 0, 0, 1, 1,
-1.709707, 1.765901, -0.6778778, 1, 0, 0, 1, 1,
-1.7082, -0.3454214, -1.281248, 1, 0, 0, 1, 1,
-1.689202, 1.123263, -1.162166, 1, 0, 0, 1, 1,
-1.667312, 0.1053495, -2.211288, 0, 0, 0, 1, 1,
-1.665825, -0.1024394, -0.1969531, 0, 0, 0, 1, 1,
-1.648642, -0.642311, -1.697735, 0, 0, 0, 1, 1,
-1.641342, -1.378648, -2.955609, 0, 0, 0, 1, 1,
-1.633168, -0.18135, -0.763236, 0, 0, 0, 1, 1,
-1.617425, 0.6603277, -1.038686, 0, 0, 0, 1, 1,
-1.614776, 0.2118646, -1.419181, 0, 0, 0, 1, 1,
-1.609, -0.05377287, -1.636732, 1, 1, 1, 1, 1,
-1.606253, 0.5019662, 0.4570347, 1, 1, 1, 1, 1,
-1.597269, -0.4709526, -1.57871, 1, 1, 1, 1, 1,
-1.593252, -1.03416, -0.3159282, 1, 1, 1, 1, 1,
-1.579398, 1.122293, -1.255336, 1, 1, 1, 1, 1,
-1.568121, -0.1014575, -1.105648, 1, 1, 1, 1, 1,
-1.560177, 0.5825112, -0.8607488, 1, 1, 1, 1, 1,
-1.554569, 3.313991, 0.6880923, 1, 1, 1, 1, 1,
-1.551645, -0.7075573, -1.553543, 1, 1, 1, 1, 1,
-1.550917, 1.506984, 0.7693187, 1, 1, 1, 1, 1,
-1.536558, 1.616218, -0.8181659, 1, 1, 1, 1, 1,
-1.533208, -0.2000057, -1.060701, 1, 1, 1, 1, 1,
-1.51731, -2.038545, -1.616339, 1, 1, 1, 1, 1,
-1.510079, 0.1993672, -2.390535, 1, 1, 1, 1, 1,
-1.506282, 0.7450567, -1.681154, 1, 1, 1, 1, 1,
-1.503299, -0.3642296, -2.373423, 0, 0, 1, 1, 1,
-1.490478, -1.735577, -2.782866, 1, 0, 0, 1, 1,
-1.487678, -1.783063, -2.458368, 1, 0, 0, 1, 1,
-1.478496, -0.5662635, -1.575818, 1, 0, 0, 1, 1,
-1.478427, 0.1171206, -1.966721, 1, 0, 0, 1, 1,
-1.473454, 0.07618626, -1.474365, 1, 0, 0, 1, 1,
-1.469501, 0.1703058, -1.806667, 0, 0, 0, 1, 1,
-1.467496, -1.269357, -0.404063, 0, 0, 0, 1, 1,
-1.441651, -0.4913098, -2.31087, 0, 0, 0, 1, 1,
-1.433645, 1.845086, 0.431458, 0, 0, 0, 1, 1,
-1.41456, 0.4463025, 0.06533615, 0, 0, 0, 1, 1,
-1.404514, 1.636799, -0.7648845, 0, 0, 0, 1, 1,
-1.388299, -1.099036, -3.066444, 0, 0, 0, 1, 1,
-1.375137, -0.4131879, -2.185309, 1, 1, 1, 1, 1,
-1.362984, 0.9832249, -2.338314, 1, 1, 1, 1, 1,
-1.357589, -0.8192235, -2.642102, 1, 1, 1, 1, 1,
-1.354039, 0.153609, 0.2575099, 1, 1, 1, 1, 1,
-1.35371, 0.7992651, -1.064025, 1, 1, 1, 1, 1,
-1.347371, 1.226801, -1.58227, 1, 1, 1, 1, 1,
-1.336369, 0.292624, -2.222682, 1, 1, 1, 1, 1,
-1.333883, -1.713139, -1.512671, 1, 1, 1, 1, 1,
-1.3324, -0.6027369, -2.679211, 1, 1, 1, 1, 1,
-1.331348, 0.5429711, -2.567314, 1, 1, 1, 1, 1,
-1.328223, 0.1487566, -1.990299, 1, 1, 1, 1, 1,
-1.320346, 0.8003487, -0.2463644, 1, 1, 1, 1, 1,
-1.311886, -0.6930987, -0.3685489, 1, 1, 1, 1, 1,
-1.303698, -0.04816596, -1.352401, 1, 1, 1, 1, 1,
-1.294957, -0.2945048, -2.682439, 1, 1, 1, 1, 1,
-1.283756, 0.5383742, -3.366693, 0, 0, 1, 1, 1,
-1.273656, 0.378292, -1.486415, 1, 0, 0, 1, 1,
-1.266932, -0.7651263, -1.289532, 1, 0, 0, 1, 1,
-1.257711, 0.1257289, -1.490524, 1, 0, 0, 1, 1,
-1.249468, -0.364586, -0.8460861, 1, 0, 0, 1, 1,
-1.237459, 0.3468634, -1.330682, 1, 0, 0, 1, 1,
-1.231827, 0.4807621, -1.414176, 0, 0, 0, 1, 1,
-1.221958, -1.694337, -2.025608, 0, 0, 0, 1, 1,
-1.214526, -0.1594705, -0.4376412, 0, 0, 0, 1, 1,
-1.209793, 0.2687954, -2.82807, 0, 0, 0, 1, 1,
-1.199267, -0.42412, -2.186328, 0, 0, 0, 1, 1,
-1.189196, 0.2434863, 0.812215, 0, 0, 0, 1, 1,
-1.18839, -1.495449, -2.673867, 0, 0, 0, 1, 1,
-1.186659, 0.32189, -0.3205834, 1, 1, 1, 1, 1,
-1.178438, -1.541379, -1.39724, 1, 1, 1, 1, 1,
-1.176552, 1.1594, -0.5725572, 1, 1, 1, 1, 1,
-1.157873, 0.3021033, -2.203928, 1, 1, 1, 1, 1,
-1.152782, -0.77385, -3.55906, 1, 1, 1, 1, 1,
-1.151171, 0.8865191, -1.24934, 1, 1, 1, 1, 1,
-1.142692, -0.05760372, -1.540006, 1, 1, 1, 1, 1,
-1.129033, 0.1078957, -1.793246, 1, 1, 1, 1, 1,
-1.12785, -1.036024, -1.261633, 1, 1, 1, 1, 1,
-1.126179, -1.282269, -1.34973, 1, 1, 1, 1, 1,
-1.124844, -0.2741693, -1.08747, 1, 1, 1, 1, 1,
-1.121772, -1.128793, -2.734003, 1, 1, 1, 1, 1,
-1.121714, 1.476727, 0.5486404, 1, 1, 1, 1, 1,
-1.114843, -0.9588034, -2.264123, 1, 1, 1, 1, 1,
-1.114329, -0.4878556, -0.8618822, 1, 1, 1, 1, 1,
-1.112986, 0.8519703, -1.780885, 0, 0, 1, 1, 1,
-1.109303, 2.673848, -1.039136, 1, 0, 0, 1, 1,
-1.108171, -0.820902, -1.17698, 1, 0, 0, 1, 1,
-1.104496, 1.316692, -0.9176596, 1, 0, 0, 1, 1,
-1.092892, 0.4405183, -0.4198251, 1, 0, 0, 1, 1,
-1.090772, 0.8463709, -0.8746944, 1, 0, 0, 1, 1,
-1.077967, -0.6250631, -3.280647, 0, 0, 0, 1, 1,
-1.076391, -1.772347, -3.225295, 0, 0, 0, 1, 1,
-1.07366, 0.5723211, -0.6392395, 0, 0, 0, 1, 1,
-1.073297, -1.258698, -2.347621, 0, 0, 0, 1, 1,
-1.071253, -0.678699, -3.00966, 0, 0, 0, 1, 1,
-1.070417, 0.06542178, -3.19643, 0, 0, 0, 1, 1,
-1.064727, 0.359644, -0.252798, 0, 0, 0, 1, 1,
-1.044877, 1.435437, -0.2623232, 1, 1, 1, 1, 1,
-1.043063, 0.2136084, -0.7714541, 1, 1, 1, 1, 1,
-1.038612, -1.883966, -3.003669, 1, 1, 1, 1, 1,
-1.036399, -0.7895787, -3.082038, 1, 1, 1, 1, 1,
-1.036318, 0.8821272, -1.297425, 1, 1, 1, 1, 1,
-1.032226, 1.262319, -0.1826946, 1, 1, 1, 1, 1,
-1.030646, -0.9601395, 0.05151882, 1, 1, 1, 1, 1,
-1.027039, -0.136446, -1.46644, 1, 1, 1, 1, 1,
-1.023508, 1.41298, -0.6139339, 1, 1, 1, 1, 1,
-1.023327, 1.18653, -1.521424, 1, 1, 1, 1, 1,
-1.018478, -0.467465, -1.397472, 1, 1, 1, 1, 1,
-1.018219, 0.7834804, -0.6566948, 1, 1, 1, 1, 1,
-1.017965, -0.8809188, -2.240648, 1, 1, 1, 1, 1,
-1.015187, -1.088154, -3.023307, 1, 1, 1, 1, 1,
-1.012805, 0.4506653, -1.233256, 1, 1, 1, 1, 1,
-1.006971, -0.5596235, -1.399129, 0, 0, 1, 1, 1,
-1.002556, -0.5923065, -1.724049, 1, 0, 0, 1, 1,
-1.00206, -0.4468564, 0.2607298, 1, 0, 0, 1, 1,
-0.9907206, 0.7345899, 0.08397137, 1, 0, 0, 1, 1,
-0.9898881, 0.611303, -1.330075, 1, 0, 0, 1, 1,
-0.9829706, 0.2793735, -0.1191557, 1, 0, 0, 1, 1,
-0.9820582, 0.3483304, -0.620818, 0, 0, 0, 1, 1,
-0.97938, -1.380275, -4.523248, 0, 0, 0, 1, 1,
-0.9742095, 0.6463211, -0.02931439, 0, 0, 0, 1, 1,
-0.9698132, 0.3678144, -2.27423, 0, 0, 0, 1, 1,
-0.9677616, -0.7120935, -2.4338, 0, 0, 0, 1, 1,
-0.967074, 1.148926, -0.4073655, 0, 0, 0, 1, 1,
-0.9616728, -0.1919453, -2.276992, 0, 0, 0, 1, 1,
-0.9610074, -1.752438, -2.578971, 1, 1, 1, 1, 1,
-0.9609062, -0.530977, -3.206016, 1, 1, 1, 1, 1,
-0.9528268, 0.1196848, -0.9893771, 1, 1, 1, 1, 1,
-0.9482324, -2.079052, -1.303448, 1, 1, 1, 1, 1,
-0.9391366, -0.2343345, -3.499569, 1, 1, 1, 1, 1,
-0.9379548, 1.095679, -1.867165, 1, 1, 1, 1, 1,
-0.9321061, 0.5353627, -1.424043, 1, 1, 1, 1, 1,
-0.929193, -1.555577, -2.234862, 1, 1, 1, 1, 1,
-0.9267331, -1.459106, -1.421767, 1, 1, 1, 1, 1,
-0.9267114, 0.3924748, -0.4719039, 1, 1, 1, 1, 1,
-0.9223587, -0.160287, -4.328919, 1, 1, 1, 1, 1,
-0.9177331, -0.2266152, -2.556538, 1, 1, 1, 1, 1,
-0.9086842, -0.1236931, -2.582173, 1, 1, 1, 1, 1,
-0.9083858, 1.22498, -0.6886529, 1, 1, 1, 1, 1,
-0.9072016, -0.213022, -3.533114, 1, 1, 1, 1, 1,
-0.9061508, 1.154911, 0.06520924, 0, 0, 1, 1, 1,
-0.9049907, 0.477079, -3.225883, 1, 0, 0, 1, 1,
-0.8997959, -0.60001, -0.3982519, 1, 0, 0, 1, 1,
-0.8982655, -1.784833, -2.377699, 1, 0, 0, 1, 1,
-0.8949697, -0.6902505, -0.9633001, 1, 0, 0, 1, 1,
-0.893591, -0.7353468, -0.4295583, 1, 0, 0, 1, 1,
-0.8933623, 0.5425285, -1.315213, 0, 0, 0, 1, 1,
-0.8926901, 0.6854653, -1.214496, 0, 0, 0, 1, 1,
-0.8922132, -0.8807126, -1.358196, 0, 0, 0, 1, 1,
-0.8899486, 0.4442778, 0.7552471, 0, 0, 0, 1, 1,
-0.8792598, 0.5160189, -0.50015, 0, 0, 0, 1, 1,
-0.8788421, 1.476003, 0.06831395, 0, 0, 0, 1, 1,
-0.8730456, -1.364349, -2.594328, 0, 0, 0, 1, 1,
-0.8689915, -0.86685, -1.973608, 1, 1, 1, 1, 1,
-0.8688527, 0.8618811, -0.9723465, 1, 1, 1, 1, 1,
-0.8609665, -0.03191248, -1.36284, 1, 1, 1, 1, 1,
-0.8587244, -0.748092, -0.5792751, 1, 1, 1, 1, 1,
-0.8545972, -0.5811528, -3.19414, 1, 1, 1, 1, 1,
-0.8531723, -1.386274, -3.625503, 1, 1, 1, 1, 1,
-0.8519993, -0.2757751, -1.345855, 1, 1, 1, 1, 1,
-0.8497969, -0.7846816, -2.827745, 1, 1, 1, 1, 1,
-0.8467561, 0.7197586, -0.02093521, 1, 1, 1, 1, 1,
-0.8404493, 1.715547, -0.4085483, 1, 1, 1, 1, 1,
-0.837853, -0.07615503, -2.419607, 1, 1, 1, 1, 1,
-0.8343568, 0.1045895, -0.5508173, 1, 1, 1, 1, 1,
-0.8294443, 0.06969921, 1.099946, 1, 1, 1, 1, 1,
-0.8250128, 0.08780649, -3.132409, 1, 1, 1, 1, 1,
-0.820658, -2.290575, -0.9905692, 1, 1, 1, 1, 1,
-0.8201596, -2.208319, -3.972667, 0, 0, 1, 1, 1,
-0.816197, -0.1801654, -1.124654, 1, 0, 0, 1, 1,
-0.8150975, 1.314684, 0.5098709, 1, 0, 0, 1, 1,
-0.8126957, 1.240058, 0.7193205, 1, 0, 0, 1, 1,
-0.8112677, 1.108835, -0.8227777, 1, 0, 0, 1, 1,
-0.8105045, -0.2752978, -1.449543, 1, 0, 0, 1, 1,
-0.8101248, -1.389414, -3.847298, 0, 0, 0, 1, 1,
-0.8090177, 1.125321, -1.854643, 0, 0, 0, 1, 1,
-0.8044291, -0.3986382, -2.349702, 0, 0, 0, 1, 1,
-0.8034758, 0.9399487, -2.562197, 0, 0, 0, 1, 1,
-0.8032242, -1.10352, -3.496169, 0, 0, 0, 1, 1,
-0.7997911, 0.8897658, -1.702358, 0, 0, 0, 1, 1,
-0.7972045, 1.16881, -1.204374, 0, 0, 0, 1, 1,
-0.7955539, -0.5161402, -1.999604, 1, 1, 1, 1, 1,
-0.7830362, 0.3164139, -1.948239, 1, 1, 1, 1, 1,
-0.7825369, 0.1970691, -1.052193, 1, 1, 1, 1, 1,
-0.7661423, -1.981617, -3.594514, 1, 1, 1, 1, 1,
-0.764414, 1.412429, -0.4876917, 1, 1, 1, 1, 1,
-0.7639536, -0.7052006, -2.523096, 1, 1, 1, 1, 1,
-0.7573304, 0.5321285, -1.212521, 1, 1, 1, 1, 1,
-0.7570097, 0.5212814, -0.2235958, 1, 1, 1, 1, 1,
-0.7555346, -1.793161, -0.9441197, 1, 1, 1, 1, 1,
-0.7514049, -0.5389842, -2.20182, 1, 1, 1, 1, 1,
-0.7457209, 1.852647, -0.9753361, 1, 1, 1, 1, 1,
-0.744852, -2.197762, -2.373836, 1, 1, 1, 1, 1,
-0.7448421, 0.7925487, -0.2929112, 1, 1, 1, 1, 1,
-0.7439247, 0.7465827, -1.086792, 1, 1, 1, 1, 1,
-0.7437881, -1.103751, -3.351203, 1, 1, 1, 1, 1,
-0.7415512, 0.2789939, -2.27709, 0, 0, 1, 1, 1,
-0.7400581, 0.8059223, -0.399763, 1, 0, 0, 1, 1,
-0.7397349, -1.771427, -2.259295, 1, 0, 0, 1, 1,
-0.7321277, -0.7747997, -3.902343, 1, 0, 0, 1, 1,
-0.7286599, 1.53283, -3.022836, 1, 0, 0, 1, 1,
-0.7249274, -0.9249986, -2.908804, 1, 0, 0, 1, 1,
-0.7231479, 0.6620297, -1.167947, 0, 0, 0, 1, 1,
-0.7119455, -0.8207986, -3.342084, 0, 0, 0, 1, 1,
-0.7092438, 0.1086453, 0.3473143, 0, 0, 0, 1, 1,
-0.707716, 0.9352471, -1.520661, 0, 0, 0, 1, 1,
-0.7020549, 0.8667195, -0.9343307, 0, 0, 0, 1, 1,
-0.7003863, 1.324541, -2.433654, 0, 0, 0, 1, 1,
-0.6996424, 1.162619, -1.772404, 0, 0, 0, 1, 1,
-0.6982397, 0.6335416, -0.6480051, 1, 1, 1, 1, 1,
-0.6930844, 0.2134911, -2.093558, 1, 1, 1, 1, 1,
-0.689494, 0.5459568, -0.6676406, 1, 1, 1, 1, 1,
-0.6881537, -0.9168724, -1.038047, 1, 1, 1, 1, 1,
-0.6879435, 1.342432, 0.4515685, 1, 1, 1, 1, 1,
-0.6869022, -0.7715764, -1.737293, 1, 1, 1, 1, 1,
-0.6861571, 0.5198932, -1.513659, 1, 1, 1, 1, 1,
-0.6842552, -0.615959, -3.59927, 1, 1, 1, 1, 1,
-0.6836143, 0.2298993, -0.9944137, 1, 1, 1, 1, 1,
-0.6831466, 0.9661948, 0.7780611, 1, 1, 1, 1, 1,
-0.6824448, 1.152233, -0.6766317, 1, 1, 1, 1, 1,
-0.6804564, 0.4379973, 0.7672818, 1, 1, 1, 1, 1,
-0.6795285, -0.3993952, -0.9664187, 1, 1, 1, 1, 1,
-0.6778893, 0.2985656, -0.6566027, 1, 1, 1, 1, 1,
-0.6755932, 0.5938711, 0.4525828, 1, 1, 1, 1, 1,
-0.6747655, -0.5184973, -2.475268, 0, 0, 1, 1, 1,
-0.6735612, 0.2054275, -1.327016, 1, 0, 0, 1, 1,
-0.6677877, -1.275508, -2.928954, 1, 0, 0, 1, 1,
-0.6663806, 0.04263708, -2.086605, 1, 0, 0, 1, 1,
-0.6633685, -1.037638, -3.977779, 1, 0, 0, 1, 1,
-0.6630566, -0.2019043, -1.038998, 1, 0, 0, 1, 1,
-0.6611367, 0.4677573, -2.057846, 0, 0, 0, 1, 1,
-0.6523736, -0.7577336, -2.332592, 0, 0, 0, 1, 1,
-0.6511939, -1.400251, -1.789521, 0, 0, 0, 1, 1,
-0.6482332, -0.41043, -2.123816, 0, 0, 0, 1, 1,
-0.6458225, -2.274868, -3.165481, 0, 0, 0, 1, 1,
-0.6436644, 0.54224, -2.901995, 0, 0, 0, 1, 1,
-0.6368704, 0.6161845, -0.1316844, 0, 0, 0, 1, 1,
-0.635949, 0.3949504, -1.484469, 1, 1, 1, 1, 1,
-0.627984, 0.1680335, -3.024074, 1, 1, 1, 1, 1,
-0.6203871, -0.1054909, -1.409173, 1, 1, 1, 1, 1,
-0.6163096, 0.7886963, -3.650872, 1, 1, 1, 1, 1,
-0.6156845, 0.5972558, -0.4586832, 1, 1, 1, 1, 1,
-0.6143864, -0.9397286, -2.189826, 1, 1, 1, 1, 1,
-0.6091006, -1.446599, -3.838998, 1, 1, 1, 1, 1,
-0.6087415, 1.056547, -0.08668455, 1, 1, 1, 1, 1,
-0.6036865, 0.5836335, -1.800228, 1, 1, 1, 1, 1,
-0.602365, 0.1305836, -2.0006, 1, 1, 1, 1, 1,
-0.5981025, 0.5242749, -0.2505546, 1, 1, 1, 1, 1,
-0.5921814, 0.05077193, -2.564411, 1, 1, 1, 1, 1,
-0.5893231, 0.8629039, 0.3609511, 1, 1, 1, 1, 1,
-0.5889606, 0.1561014, -0.6342225, 1, 1, 1, 1, 1,
-0.5879105, 0.5071653, -1.1521, 1, 1, 1, 1, 1,
-0.5836582, -0.6261199, -1.748179, 0, 0, 1, 1, 1,
-0.5803513, 0.3681637, -2.388645, 1, 0, 0, 1, 1,
-0.5802863, -0.9948035, -2.668072, 1, 0, 0, 1, 1,
-0.5786707, -1.10546, -3.078072, 1, 0, 0, 1, 1,
-0.5760073, 0.681222, -0.2075914, 1, 0, 0, 1, 1,
-0.575697, 0.682606, -0.5894411, 1, 0, 0, 1, 1,
-0.5755623, 1.292615, -1.814321, 0, 0, 0, 1, 1,
-0.5742635, -1.129561, -2.195812, 0, 0, 0, 1, 1,
-0.5736827, -0.9155875, -4.43754, 0, 0, 0, 1, 1,
-0.573588, 0.4027762, -1.10735, 0, 0, 0, 1, 1,
-0.5711541, -0.09675846, -1.980704, 0, 0, 0, 1, 1,
-0.5683427, -1.629626, -2.59186, 0, 0, 0, 1, 1,
-0.5600469, -0.5145426, -0.5115371, 0, 0, 0, 1, 1,
-0.5495028, -0.03794454, -0.7380638, 1, 1, 1, 1, 1,
-0.5469803, 0.7354769, -0.03813607, 1, 1, 1, 1, 1,
-0.5440853, 0.9597936, -1.068488, 1, 1, 1, 1, 1,
-0.5392531, -0.3741382, -3.0801, 1, 1, 1, 1, 1,
-0.5386931, 0.2729431, -0.8517011, 1, 1, 1, 1, 1,
-0.5385817, 0.2706492, -0.6682548, 1, 1, 1, 1, 1,
-0.5361924, -0.853147, -3.854525, 1, 1, 1, 1, 1,
-0.5299711, 0.0355208, -0.1656479, 1, 1, 1, 1, 1,
-0.5286188, 0.36647, -2.385848, 1, 1, 1, 1, 1,
-0.5267811, -0.107892, -1.334951, 1, 1, 1, 1, 1,
-0.5249274, 1.220544, 0.9860254, 1, 1, 1, 1, 1,
-0.520946, -0.2978788, -2.348662, 1, 1, 1, 1, 1,
-0.5109923, -0.6594447, -3.970887, 1, 1, 1, 1, 1,
-0.5089524, -0.7325447, -0.8326733, 1, 1, 1, 1, 1,
-0.5084293, 1.056319, -0.0308758, 1, 1, 1, 1, 1,
-0.5017294, -0.8691522, -2.410235, 0, 0, 1, 1, 1,
-0.4994496, 1.183582, 0.4234048, 1, 0, 0, 1, 1,
-0.4988826, 1.118801, 0.4319204, 1, 0, 0, 1, 1,
-0.4961345, -0.1098337, -2.556726, 1, 0, 0, 1, 1,
-0.4948516, -0.5887824, -2.338052, 1, 0, 0, 1, 1,
-0.4862438, -0.2736118, -3.103372, 1, 0, 0, 1, 1,
-0.4825379, 0.1504098, -1.19354, 0, 0, 0, 1, 1,
-0.4811885, -0.04932546, -1.798258, 0, 0, 0, 1, 1,
-0.4771885, 1.387285, -2.08126, 0, 0, 0, 1, 1,
-0.4756196, -0.05469714, -1.122315, 0, 0, 0, 1, 1,
-0.4749361, -1.20215, -3.198904, 0, 0, 0, 1, 1,
-0.4659173, 0.813298, -0.3534259, 0, 0, 0, 1, 1,
-0.4521898, -0.118978, -2.336445, 0, 0, 0, 1, 1,
-0.4499255, -0.4593597, -0.7064803, 1, 1, 1, 1, 1,
-0.4498964, -1.233342, -1.805339, 1, 1, 1, 1, 1,
-0.4442838, 1.111561, -0.6582329, 1, 1, 1, 1, 1,
-0.4438154, 1.471933, -0.1815872, 1, 1, 1, 1, 1,
-0.4423384, 0.3370829, -2.431211, 1, 1, 1, 1, 1,
-0.4402769, -0.4080566, -2.095529, 1, 1, 1, 1, 1,
-0.4380164, -0.8205018, -2.523165, 1, 1, 1, 1, 1,
-0.4373278, -0.6249588, -2.1438, 1, 1, 1, 1, 1,
-0.4312122, -1.93987, -0.8743214, 1, 1, 1, 1, 1,
-0.429802, -0.6625987, -3.138228, 1, 1, 1, 1, 1,
-0.4237033, 1.301386, -0.1424328, 1, 1, 1, 1, 1,
-0.4211027, -0.379511, -2.733406, 1, 1, 1, 1, 1,
-0.4202433, -0.2869092, -3.13416, 1, 1, 1, 1, 1,
-0.4197181, -1.412247, -1.868204, 1, 1, 1, 1, 1,
-0.4191302, 1.705327, -1.329178, 1, 1, 1, 1, 1,
-0.4181974, 1.163434, 0.372096, 0, 0, 1, 1, 1,
-0.418177, 1.049443, 0.2316024, 1, 0, 0, 1, 1,
-0.4175059, 0.4129463, -0.8610396, 1, 0, 0, 1, 1,
-0.4138309, 1.571496, -1.252257, 1, 0, 0, 1, 1,
-0.4124072, -0.1699749, 0.3309686, 1, 0, 0, 1, 1,
-0.4074928, -0.3423288, -3.108272, 1, 0, 0, 1, 1,
-0.4054273, 1.773939, 0.4535529, 0, 0, 0, 1, 1,
-0.4013569, -0.9418122, -0.4271815, 0, 0, 0, 1, 1,
-0.4006597, 0.4303418, 0.33892, 0, 0, 0, 1, 1,
-0.4003657, -0.4427062, -2.571717, 0, 0, 0, 1, 1,
-0.4002032, 0.7148796, -2.568113, 0, 0, 0, 1, 1,
-0.3968382, -0.3755204, -2.05207, 0, 0, 0, 1, 1,
-0.3936209, -1.257395, -2.47478, 0, 0, 0, 1, 1,
-0.3903762, 0.4101038, 0.2687162, 1, 1, 1, 1, 1,
-0.3888634, 0.3989752, -0.9245193, 1, 1, 1, 1, 1,
-0.3859865, 0.438063, -0.7869996, 1, 1, 1, 1, 1,
-0.3840968, -0.7293824, -1.741072, 1, 1, 1, 1, 1,
-0.382984, 0.09441796, -3.628959, 1, 1, 1, 1, 1,
-0.3817512, 0.005609953, -0.8904584, 1, 1, 1, 1, 1,
-0.380671, -0.4906475, -2.950215, 1, 1, 1, 1, 1,
-0.3801842, 0.13553, -1.968904, 1, 1, 1, 1, 1,
-0.3801699, 1.536005, -0.753612, 1, 1, 1, 1, 1,
-0.3792172, 0.5156147, -2.140752, 1, 1, 1, 1, 1,
-0.3784866, -0.5119904, -1.640175, 1, 1, 1, 1, 1,
-0.3781826, 0.817628, 0.3297888, 1, 1, 1, 1, 1,
-0.3758667, -0.1951267, -1.838385, 1, 1, 1, 1, 1,
-0.3723985, -0.7331006, -0.1839802, 1, 1, 1, 1, 1,
-0.37, 0.5044959, -0.6601164, 1, 1, 1, 1, 1,
-0.3694337, -0.6372625, -2.636273, 0, 0, 1, 1, 1,
-0.3667704, -1.660563, -3.575722, 1, 0, 0, 1, 1,
-0.3656684, -0.5818428, -3.181901, 1, 0, 0, 1, 1,
-0.3625573, 0.06558456, -0.04461621, 1, 0, 0, 1, 1,
-0.3625458, -0.9368696, -3.895623, 1, 0, 0, 1, 1,
-0.3587286, 0.01665187, -1.2201, 1, 0, 0, 1, 1,
-0.3580953, 1.257471, -2.344557, 0, 0, 0, 1, 1,
-0.3560803, 1.363424, -2.296414, 0, 0, 0, 1, 1,
-0.3506438, 1.011979, -0.09839002, 0, 0, 0, 1, 1,
-0.3464974, -0.9481124, -2.22622, 0, 0, 0, 1, 1,
-0.3379139, -0.182172, -1.221271, 0, 0, 0, 1, 1,
-0.3359506, 0.4249548, -1.189917, 0, 0, 0, 1, 1,
-0.3344544, -0.2515074, -3.366442, 0, 0, 0, 1, 1,
-0.3334524, -0.3709146, -2.763515, 1, 1, 1, 1, 1,
-0.3288009, 0.3906465, -0.3500049, 1, 1, 1, 1, 1,
-0.3249708, -1.555494, -2.265893, 1, 1, 1, 1, 1,
-0.3219095, 0.3536579, -0.6691841, 1, 1, 1, 1, 1,
-0.3195245, -0.007736639, -0.4345874, 1, 1, 1, 1, 1,
-0.3187125, 0.3220529, -0.5694656, 1, 1, 1, 1, 1,
-0.3149785, 0.3452889, -1.423636, 1, 1, 1, 1, 1,
-0.3144952, -1.239667, -1.947808, 1, 1, 1, 1, 1,
-0.3133439, -0.3794012, -2.06553, 1, 1, 1, 1, 1,
-0.3117278, 0.08140706, -0.1863992, 1, 1, 1, 1, 1,
-0.306314, -0.9815516, -2.525006, 1, 1, 1, 1, 1,
-0.3000341, 0.2565404, -1.674767, 1, 1, 1, 1, 1,
-0.2996158, 0.6823052, -1.395755, 1, 1, 1, 1, 1,
-0.2956858, 1.629223, -0.5545261, 1, 1, 1, 1, 1,
-0.2911891, -1.13953, -1.544311, 1, 1, 1, 1, 1,
-0.2904132, -0.6144966, -3.961942, 0, 0, 1, 1, 1,
-0.2893233, -0.4707134, -2.801974, 1, 0, 0, 1, 1,
-0.2873709, -0.665354, -3.803244, 1, 0, 0, 1, 1,
-0.2872596, -0.6632649, -2.807947, 1, 0, 0, 1, 1,
-0.287147, 1.306618, -0.4503778, 1, 0, 0, 1, 1,
-0.2855184, -0.7262117, -2.200672, 1, 0, 0, 1, 1,
-0.2843629, -1.316947, -4.182954, 0, 0, 0, 1, 1,
-0.2788264, 2.137649, -0.9939998, 0, 0, 0, 1, 1,
-0.2766945, 0.1728258, 0.6644445, 0, 0, 0, 1, 1,
-0.2745775, -1.473842, -3.528162, 0, 0, 0, 1, 1,
-0.2711086, -0.2870199, -1.920116, 0, 0, 0, 1, 1,
-0.2675314, 0.8478335, 1.204747, 0, 0, 0, 1, 1,
-0.2573694, 0.7270929, -0.5223145, 0, 0, 0, 1, 1,
-0.2562871, -0.332672, -3.530542, 1, 1, 1, 1, 1,
-0.2486426, 0.003501674, -1.472407, 1, 1, 1, 1, 1,
-0.2399977, -1.839322, -2.997794, 1, 1, 1, 1, 1,
-0.2287032, -1.237753, -3.036087, 1, 1, 1, 1, 1,
-0.2227828, -0.4524712, -2.884583, 1, 1, 1, 1, 1,
-0.216464, -0.4879929, -2.294878, 1, 1, 1, 1, 1,
-0.209591, -0.3897499, -2.974342, 1, 1, 1, 1, 1,
-0.207399, 0.3419447, -0.8645032, 1, 1, 1, 1, 1,
-0.2028833, 0.2367983, -2.07502, 1, 1, 1, 1, 1,
-0.202564, -2.111042, -3.551772, 1, 1, 1, 1, 1,
-0.2009351, 1.001788, -0.3342993, 1, 1, 1, 1, 1,
-0.1989312, -0.1727411, -2.8035, 1, 1, 1, 1, 1,
-0.1982107, -1.787566, -4.614907, 1, 1, 1, 1, 1,
-0.1968862, -1.879229, -4.136585, 1, 1, 1, 1, 1,
-0.1942421, 1.168882, -0.2447356, 1, 1, 1, 1, 1,
-0.1925065, -0.8743884, -3.233045, 0, 0, 1, 1, 1,
-0.1922625, 1.373742, 0.007873571, 1, 0, 0, 1, 1,
-0.1878961, -0.8542387, -1.097229, 1, 0, 0, 1, 1,
-0.1870511, -0.8692683, -3.343388, 1, 0, 0, 1, 1,
-0.1857293, 0.7369086, -0.1162101, 1, 0, 0, 1, 1,
-0.1854907, -0.9143747, -1.96229, 1, 0, 0, 1, 1,
-0.1833995, 0.328049, -0.9584363, 0, 0, 0, 1, 1,
-0.1805901, -0.5251743, -1.924691, 0, 0, 0, 1, 1,
-0.1774351, -0.439787, -3.48653, 0, 0, 0, 1, 1,
-0.1752606, 0.2069377, -0.6285361, 0, 0, 0, 1, 1,
-0.1720897, 0.9435526, -0.779102, 0, 0, 0, 1, 1,
-0.1701383, 1.019118, 0.5532195, 0, 0, 0, 1, 1,
-0.1581226, 0.9134091, 0.6609902, 0, 0, 0, 1, 1,
-0.157727, 1.200705, -0.4616927, 1, 1, 1, 1, 1,
-0.1566242, -1.175018, -2.037544, 1, 1, 1, 1, 1,
-0.1455319, 0.4122461, -0.1131005, 1, 1, 1, 1, 1,
-0.141599, -0.4858941, -3.473903, 1, 1, 1, 1, 1,
-0.1411813, 1.51702, -0.7288269, 1, 1, 1, 1, 1,
-0.1389466, 0.1525931, -1.13845, 1, 1, 1, 1, 1,
-0.1387777, 0.5097098, 0.1189484, 1, 1, 1, 1, 1,
-0.1370893, -0.6194867, -4.512436, 1, 1, 1, 1, 1,
-0.1345932, -0.3251676, -2.092318, 1, 1, 1, 1, 1,
-0.1243668, 0.5609309, 0.6244354, 1, 1, 1, 1, 1,
-0.1193101, 0.3102425, -0.8835341, 1, 1, 1, 1, 1,
-0.1185954, -0.4067164, -5.051515, 1, 1, 1, 1, 1,
-0.1158126, -1.621008, -1.072047, 1, 1, 1, 1, 1,
-0.1140884, 0.2020492, -1.344106, 1, 1, 1, 1, 1,
-0.1080242, -1.850879, -4.686302, 1, 1, 1, 1, 1,
-0.105224, -0.05911129, -1.718096, 0, 0, 1, 1, 1,
-0.1037911, 1.888766, 0.7364327, 1, 0, 0, 1, 1,
-0.1031982, -1.076627, -2.490812, 1, 0, 0, 1, 1,
-0.1029017, -2.858824, -3.317493, 1, 0, 0, 1, 1,
-0.09809189, 1.025473, -0.7762032, 1, 0, 0, 1, 1,
-0.09536003, 1.113735, 1.463414, 1, 0, 0, 1, 1,
-0.09274003, 1.871496, 0.07291704, 0, 0, 0, 1, 1,
-0.08585433, 0.4115708, -0.4981202, 0, 0, 0, 1, 1,
-0.08128566, -0.08187379, -1.294853, 0, 0, 0, 1, 1,
-0.08096898, 0.9813297, 0.07617216, 0, 0, 0, 1, 1,
-0.08002634, 0.08304697, -0.1759806, 0, 0, 0, 1, 1,
-0.07609344, 0.7418826, 0.7520103, 0, 0, 0, 1, 1,
-0.07212388, -1.107027, -2.520234, 0, 0, 0, 1, 1,
-0.07107189, -0.06350241, -2.806129, 1, 1, 1, 1, 1,
-0.06854221, -2.441312, -2.675602, 1, 1, 1, 1, 1,
-0.06332289, 1.764333, -0.5888922, 1, 1, 1, 1, 1,
-0.06240806, -0.8493063, -1.07036, 1, 1, 1, 1, 1,
-0.05739979, -1.521671, -2.442946, 1, 1, 1, 1, 1,
-0.05279625, 0.8122643, 0.08671069, 1, 1, 1, 1, 1,
-0.05194341, 0.8912495, 0.6280894, 1, 1, 1, 1, 1,
-0.05185155, -1.056209, -2.963153, 1, 1, 1, 1, 1,
-0.04953728, 0.5324952, 0.3274986, 1, 1, 1, 1, 1,
-0.04885038, -0.7162995, -1.04339, 1, 1, 1, 1, 1,
-0.04807076, -1.274701, -2.585485, 1, 1, 1, 1, 1,
-0.04716846, -0.6814989, -4.404181, 1, 1, 1, 1, 1,
-0.04669487, -0.2668127, -3.84094, 1, 1, 1, 1, 1,
-0.04538292, 0.7564604, -0.2761382, 1, 1, 1, 1, 1,
-0.04463922, -0.6744066, -4.740923, 1, 1, 1, 1, 1,
-0.0425884, 0.2848056, 0.2518732, 0, 0, 1, 1, 1,
-0.0419475, 0.3035095, 0.6738824, 1, 0, 0, 1, 1,
-0.03853263, 0.5700139, 0.3113828, 1, 0, 0, 1, 1,
-0.03810508, -0.9109077, -3.57013, 1, 0, 0, 1, 1,
-0.03762153, 1.269181, -0.5824558, 1, 0, 0, 1, 1,
-0.02723441, 0.8801277, 1.681049, 1, 0, 0, 1, 1,
-0.02579023, -0.7735845, -2.241635, 0, 0, 0, 1, 1,
-0.02323362, -0.1669082, -2.578167, 0, 0, 0, 1, 1,
-0.01340783, -1.000265, -3.482263, 0, 0, 0, 1, 1,
-0.01122741, -1.56503, -4.449273, 0, 0, 0, 1, 1,
-0.007311079, 1.772685, -0.9923107, 0, 0, 0, 1, 1,
-0.007190946, -1.863545, -3.527406, 0, 0, 0, 1, 1,
-0.00378083, 0.03723555, 0.01436973, 0, 0, 0, 1, 1,
-0.00331207, -0.636381, -2.267075, 1, 1, 1, 1, 1,
-0.002716409, 0.01150506, 0.6056502, 1, 1, 1, 1, 1,
-0.001542596, 0.409905, 0.4740228, 1, 1, 1, 1, 1,
0.004372366, 0.8338643, -0.4156968, 1, 1, 1, 1, 1,
0.005214394, 0.9704341, 1.349744, 1, 1, 1, 1, 1,
0.01160044, -0.3436243, 3.722978, 1, 1, 1, 1, 1,
0.01325248, 0.4946843, 0.3096312, 1, 1, 1, 1, 1,
0.01453803, 0.1184328, 0.01167859, 1, 1, 1, 1, 1,
0.01928849, 1.80598, -0.6419961, 1, 1, 1, 1, 1,
0.02183584, -0.2626089, 4.054228, 1, 1, 1, 1, 1,
0.02194826, -0.5659177, 2.621066, 1, 1, 1, 1, 1,
0.02217533, 1.041146, -1.742992, 1, 1, 1, 1, 1,
0.02272811, -2.055244, 2.362592, 1, 1, 1, 1, 1,
0.02642813, -0.07473838, 1.11758, 1, 1, 1, 1, 1,
0.03116094, 1.320468, 0.6229875, 1, 1, 1, 1, 1,
0.03517199, 0.7237467, 0.250545, 0, 0, 1, 1, 1,
0.03559061, -0.6753839, 2.482059, 1, 0, 0, 1, 1,
0.03638078, -0.6781646, 2.533059, 1, 0, 0, 1, 1,
0.04010373, -0.3783115, 4.044164, 1, 0, 0, 1, 1,
0.0469971, -0.1206016, 2.392693, 1, 0, 0, 1, 1,
0.04859972, 0.4650267, 1.289771, 1, 0, 0, 1, 1,
0.04937445, 0.9492819, -1.419789, 0, 0, 0, 1, 1,
0.04939786, -0.9404315, 4.54241, 0, 0, 0, 1, 1,
0.04997913, -1.147292, 3.111156, 0, 0, 0, 1, 1,
0.05111023, 0.1954198, -1.783213, 0, 0, 0, 1, 1,
0.05324305, 0.7937864, 0.9145094, 0, 0, 0, 1, 1,
0.05534495, -1.059532, 3.12111, 0, 0, 0, 1, 1,
0.06420241, -0.5155132, 1.936108, 0, 0, 0, 1, 1,
0.06463267, 0.4453421, 0.7744915, 1, 1, 1, 1, 1,
0.06547131, 0.5257575, 0.1731147, 1, 1, 1, 1, 1,
0.07056788, 0.4401717, 2.074473, 1, 1, 1, 1, 1,
0.07116581, -1.682381, 1.952405, 1, 1, 1, 1, 1,
0.07180471, 0.768504, 0.7828016, 1, 1, 1, 1, 1,
0.07519143, 0.4112379, 1.718326, 1, 1, 1, 1, 1,
0.07676934, 0.2080609, -0.6666697, 1, 1, 1, 1, 1,
0.07928611, 0.264543, 1.404256, 1, 1, 1, 1, 1,
0.08052255, 0.2682641, -2.284765, 1, 1, 1, 1, 1,
0.08274593, -0.5216544, 2.667126, 1, 1, 1, 1, 1,
0.08527871, -0.3211191, 4.767397, 1, 1, 1, 1, 1,
0.08745944, 0.9186132, -0.2468838, 1, 1, 1, 1, 1,
0.08748521, 0.371774, -1.311821, 1, 1, 1, 1, 1,
0.08787917, -0.0898641, 1.850051, 1, 1, 1, 1, 1,
0.0900882, -1.1201, 4.060298, 1, 1, 1, 1, 1,
0.0966989, 1.370955, -0.7961818, 0, 0, 1, 1, 1,
0.1044755, 1.505128, 1.659958, 1, 0, 0, 1, 1,
0.1062392, 1.551177, -1.379391, 1, 0, 0, 1, 1,
0.1082865, -0.5873491, 2.265821, 1, 0, 0, 1, 1,
0.1113955, 0.374376, 1.574481, 1, 0, 0, 1, 1,
0.1133841, -0.4963211, 1.489037, 1, 0, 0, 1, 1,
0.1137144, 0.9228272, 0.5735824, 0, 0, 0, 1, 1,
0.120058, -0.3916115, 2.819897, 0, 0, 0, 1, 1,
0.120122, -0.2787528, 2.05392, 0, 0, 0, 1, 1,
0.1216099, -0.3220108, 0.2653618, 0, 0, 0, 1, 1,
0.1218304, -0.06990045, 2.869138, 0, 0, 0, 1, 1,
0.1222973, -0.214055, 1.022325, 0, 0, 0, 1, 1,
0.1246803, 0.9304056, 0.806181, 0, 0, 0, 1, 1,
0.1247759, -1.651473, 5.334805, 1, 1, 1, 1, 1,
0.1265282, 0.3536587, 2.068167, 1, 1, 1, 1, 1,
0.1267493, -1.308061, 3.298417, 1, 1, 1, 1, 1,
0.1297209, -0.5523471, 2.98614, 1, 1, 1, 1, 1,
0.1298661, 1.189275, -0.439024, 1, 1, 1, 1, 1,
0.1315413, 0.2733535, 2.031198, 1, 1, 1, 1, 1,
0.1318702, -1.530179, 2.533323, 1, 1, 1, 1, 1,
0.1340787, -1.257779, 1.812106, 1, 1, 1, 1, 1,
0.1344396, -1.68589, 2.701105, 1, 1, 1, 1, 1,
0.1442375, -1.851495, 2.378371, 1, 1, 1, 1, 1,
0.1442658, -0.5524839, 3.435883, 1, 1, 1, 1, 1,
0.1468266, -1.096809, 0.6980531, 1, 1, 1, 1, 1,
0.1469242, -0.3121352, 2.487573, 1, 1, 1, 1, 1,
0.1518738, 1.027625, -0.9203078, 1, 1, 1, 1, 1,
0.1566199, 1.291481, -0.3853712, 1, 1, 1, 1, 1,
0.1576085, -1.960286, 0.8963634, 0, 0, 1, 1, 1,
0.1615509, 2.032289, 0.7293568, 1, 0, 0, 1, 1,
0.1637896, 1.542131, -0.6420453, 1, 0, 0, 1, 1,
0.1677552, -1.609271, 3.680029, 1, 0, 0, 1, 1,
0.1698391, -0.886439, 2.843961, 1, 0, 0, 1, 1,
0.1734108, 0.8048614, -1.040728, 1, 0, 0, 1, 1,
0.1751498, -0.6592737, 1.905149, 0, 0, 0, 1, 1,
0.1786428, -0.5857331, 3.956707, 0, 0, 0, 1, 1,
0.1788458, 0.8310516, 0.1292614, 0, 0, 0, 1, 1,
0.1790519, -0.6871302, 3.623319, 0, 0, 0, 1, 1,
0.1793947, 0.490723, -0.5314551, 0, 0, 0, 1, 1,
0.1912217, -0.3755621, 3.696479, 0, 0, 0, 1, 1,
0.191248, -0.4317736, 2.310768, 0, 0, 0, 1, 1,
0.1945533, 1.219281, -0.451274, 1, 1, 1, 1, 1,
0.1951837, -0.06318556, 0.0257961, 1, 1, 1, 1, 1,
0.1977923, 0.2415174, 1.071135, 1, 1, 1, 1, 1,
0.1985513, -1.688318, 2.689349, 1, 1, 1, 1, 1,
0.1986274, 0.04403935, 0.02463409, 1, 1, 1, 1, 1,
0.2013359, 0.8091366, 0.1806417, 1, 1, 1, 1, 1,
0.2013701, -1.222703, 3.163696, 1, 1, 1, 1, 1,
0.202711, 1.46493, -0.4410723, 1, 1, 1, 1, 1,
0.2056191, 0.4328499, 1.837974, 1, 1, 1, 1, 1,
0.2060158, 0.1200143, 0.7488193, 1, 1, 1, 1, 1,
0.2161674, -0.2900885, 2.289283, 1, 1, 1, 1, 1,
0.2225175, 1.246221, 0.9702949, 1, 1, 1, 1, 1,
0.2273081, 0.1880684, 1.016776, 1, 1, 1, 1, 1,
0.2273418, -1.152523, 3.181066, 1, 1, 1, 1, 1,
0.2275393, -0.7470238, 3.551912, 1, 1, 1, 1, 1,
0.2317367, 1.078591, 1.038077, 0, 0, 1, 1, 1,
0.2328091, -0.4175305, 2.573864, 1, 0, 0, 1, 1,
0.2340107, -0.51178, 2.176953, 1, 0, 0, 1, 1,
0.2367642, 0.7911233, 0.812959, 1, 0, 0, 1, 1,
0.240071, 0.897782, -0.3983189, 1, 0, 0, 1, 1,
0.2439162, -1.145982, 1.854758, 1, 0, 0, 1, 1,
0.2456466, -1.04058, 3.189754, 0, 0, 0, 1, 1,
0.2462252, 0.5251531, 1.248608, 0, 0, 0, 1, 1,
0.2466022, 0.3530987, -0.6004186, 0, 0, 0, 1, 1,
0.2470459, 0.9811521, 1.682167, 0, 0, 0, 1, 1,
0.2475472, -0.0897451, 2.872375, 0, 0, 0, 1, 1,
0.2493536, -1.093045, 0.5135395, 0, 0, 0, 1, 1,
0.2508349, -0.3551941, -0.6145228, 0, 0, 0, 1, 1,
0.2531041, 0.2393243, 0.8124528, 1, 1, 1, 1, 1,
0.2619916, -0.959178, 3.274438, 1, 1, 1, 1, 1,
0.2642676, 1.507013, -0.5759509, 1, 1, 1, 1, 1,
0.264268, -1.108862, 3.070119, 1, 1, 1, 1, 1,
0.265206, 0.04075314, 1.278328, 1, 1, 1, 1, 1,
0.2734685, -2.399752, 2.408358, 1, 1, 1, 1, 1,
0.27449, -0.2947349, 2.34115, 1, 1, 1, 1, 1,
0.27629, -1.100079, 1.717096, 1, 1, 1, 1, 1,
0.2810198, 1.671489, -0.1868819, 1, 1, 1, 1, 1,
0.2866704, -0.274875, 0.6318492, 1, 1, 1, 1, 1,
0.2935804, -0.4583608, 3.190412, 1, 1, 1, 1, 1,
0.2949231, 1.506203, 2.048381, 1, 1, 1, 1, 1,
0.298222, -0.009054056, 3.226083, 1, 1, 1, 1, 1,
0.2985569, 0.4835573, 0.6246589, 1, 1, 1, 1, 1,
0.3028925, -0.3506483, 1.389281, 1, 1, 1, 1, 1,
0.3050269, 0.2474574, 1.480238, 0, 0, 1, 1, 1,
0.3101549, -0.4767398, 2.952938, 1, 0, 0, 1, 1,
0.3144792, 0.5739674, -0.7626677, 1, 0, 0, 1, 1,
0.3146877, 0.9993417, 1.233611, 1, 0, 0, 1, 1,
0.3208291, -0.6339572, 3.690165, 1, 0, 0, 1, 1,
0.3209588, -1.655883, 3.454062, 1, 0, 0, 1, 1,
0.3253207, 0.5821567, -0.07020424, 0, 0, 0, 1, 1,
0.3343987, 0.3072692, 1.38049, 0, 0, 0, 1, 1,
0.3374465, -1.437584, 2.845087, 0, 0, 0, 1, 1,
0.3402144, 0.3720775, 1.945906, 0, 0, 0, 1, 1,
0.3541097, -0.1376659, 0.4872027, 0, 0, 0, 1, 1,
0.3587846, 0.1117057, 0.6240495, 0, 0, 0, 1, 1,
0.3595597, 0.9796319, 1.192362, 0, 0, 0, 1, 1,
0.3643237, 0.1291461, 1.817284, 1, 1, 1, 1, 1,
0.3668589, -0.9318744, 3.459716, 1, 1, 1, 1, 1,
0.3684495, -0.6710566, 1.239617, 1, 1, 1, 1, 1,
0.3729363, 0.5844321, 1.892525, 1, 1, 1, 1, 1,
0.373925, -0.8572257, 2.706443, 1, 1, 1, 1, 1,
0.375682, 0.571182, 0.9082251, 1, 1, 1, 1, 1,
0.3768675, -1.08413, 2.280029, 1, 1, 1, 1, 1,
0.3770656, -1.117298, 2.67524, 1, 1, 1, 1, 1,
0.3813228, 0.5034148, -0.2337308, 1, 1, 1, 1, 1,
0.3819698, -0.1584596, 1.41358, 1, 1, 1, 1, 1,
0.3957704, 0.5848097, 0.3299024, 1, 1, 1, 1, 1,
0.3960787, -0.4039289, 2.599785, 1, 1, 1, 1, 1,
0.3984725, 0.1160198, 2.721698, 1, 1, 1, 1, 1,
0.4047626, -0.7577164, 2.660792, 1, 1, 1, 1, 1,
0.4058835, 2.264063, 0.4882906, 1, 1, 1, 1, 1,
0.4093053, -0.04338641, 1.957621, 0, 0, 1, 1, 1,
0.4230298, -0.6257617, 4.193042, 1, 0, 0, 1, 1,
0.4253991, -1.211482, 2.37044, 1, 0, 0, 1, 1,
0.4262663, 1.633033, 0.4167266, 1, 0, 0, 1, 1,
0.4273284, 0.5377482, 0.1431749, 1, 0, 0, 1, 1,
0.4303187, -0.4409881, 2.554713, 1, 0, 0, 1, 1,
0.430747, 0.8585922, -0.5000596, 0, 0, 0, 1, 1,
0.4324647, -1.142599, 2.28819, 0, 0, 0, 1, 1,
0.4379364, -0.5034102, 2.799726, 0, 0, 0, 1, 1,
0.4409246, -0.5741186, 2.47791, 0, 0, 0, 1, 1,
0.446754, -0.658056, 2.71456, 0, 0, 0, 1, 1,
0.4490555, 1.302858, -0.6221521, 0, 0, 0, 1, 1,
0.4500649, 0.7714629, 0.4962376, 0, 0, 0, 1, 1,
0.4513982, -1.92109, 3.888896, 1, 1, 1, 1, 1,
0.4555625, 0.3694801, 1.592635, 1, 1, 1, 1, 1,
0.4556528, 1.559263, 0.06392734, 1, 1, 1, 1, 1,
0.4592902, 1.448641, -1.468316, 1, 1, 1, 1, 1,
0.4602611, -0.04897086, 3.038109, 1, 1, 1, 1, 1,
0.4608739, 2.141655, -0.9975884, 1, 1, 1, 1, 1,
0.4644385, -0.970322, 2.96953, 1, 1, 1, 1, 1,
0.4701731, -0.7288445, 3.951892, 1, 1, 1, 1, 1,
0.4770882, 0.1101627, 1.021608, 1, 1, 1, 1, 1,
0.4890867, -0.9207248, 4.138542, 1, 1, 1, 1, 1,
0.492244, -0.9791347, 1.006091, 1, 1, 1, 1, 1,
0.4928203, 0.1200253, 2.198693, 1, 1, 1, 1, 1,
0.4963908, -0.2817006, 2.522661, 1, 1, 1, 1, 1,
0.4972585, 0.09048147, 1.284533, 1, 1, 1, 1, 1,
0.499628, 0.4854804, 1.335763, 1, 1, 1, 1, 1,
0.5035878, -1.53196, 2.281537, 0, 0, 1, 1, 1,
0.5036031, 0.4733047, -0.4046907, 1, 0, 0, 1, 1,
0.5037049, 0.6912901, 0.2085398, 1, 0, 0, 1, 1,
0.5039893, -1.828055, 1.986858, 1, 0, 0, 1, 1,
0.5044287, -0.3003027, 1.988842, 1, 0, 0, 1, 1,
0.5046828, -1.083818, 3.052789, 1, 0, 0, 1, 1,
0.5059399, -0.3542184, 1.36756, 0, 0, 0, 1, 1,
0.5115167, 0.3748132, 0.3036315, 0, 0, 0, 1, 1,
0.5138339, 1.027222, 0.6186557, 0, 0, 0, 1, 1,
0.5189479, -0.9501848, 2.663256, 0, 0, 0, 1, 1,
0.5215328, -0.7972671, 0.9928503, 0, 0, 0, 1, 1,
0.5258563, 0.7282483, -0.5159658, 0, 0, 0, 1, 1,
0.5260583, 0.9774933, -0.2142906, 0, 0, 0, 1, 1,
0.5338895, 0.658585, 1.246828, 1, 1, 1, 1, 1,
0.538893, 0.1281446, 0.5015745, 1, 1, 1, 1, 1,
0.5402561, -1.407854, 3.459345, 1, 1, 1, 1, 1,
0.5444767, -0.6647443, 1.985621, 1, 1, 1, 1, 1,
0.5494293, 0.1360692, 1.234421, 1, 1, 1, 1, 1,
0.5498764, 0.09075298, 1.561597, 1, 1, 1, 1, 1,
0.5508592, 1.361063, -0.8052707, 1, 1, 1, 1, 1,
0.5516884, 0.3294571, -0.49778, 1, 1, 1, 1, 1,
0.552776, -0.7527446, 2.515339, 1, 1, 1, 1, 1,
0.5527925, 0.1055382, 0.1737456, 1, 1, 1, 1, 1,
0.5595146, 1.005266, 0.7612765, 1, 1, 1, 1, 1,
0.5600269, -0.4177236, 0.8256247, 1, 1, 1, 1, 1,
0.5602951, 0.8164241, 0.9098369, 1, 1, 1, 1, 1,
0.5605666, -0.6103557, 2.356143, 1, 1, 1, 1, 1,
0.5610864, 0.3425852, -1.224194, 1, 1, 1, 1, 1,
0.5618232, -0.1804959, 0.5268566, 0, 0, 1, 1, 1,
0.5673362, -0.8602101, 4.511739, 1, 0, 0, 1, 1,
0.5692528, -0.5892801, 1.794211, 1, 0, 0, 1, 1,
0.572489, -0.3282535, 2.889853, 1, 0, 0, 1, 1,
0.5803805, 0.8867311, -0.5227293, 1, 0, 0, 1, 1,
0.5880098, 1.461897, -0.2066622, 1, 0, 0, 1, 1,
0.5908928, 2.462158, 1.302727, 0, 0, 0, 1, 1,
0.5911313, 1.493725, -1.569347, 0, 0, 0, 1, 1,
0.592429, 0.3549905, 3.661728, 0, 0, 0, 1, 1,
0.5989072, -0.6054005, 3.449183, 0, 0, 0, 1, 1,
0.5990764, -0.7402602, 4.017024, 0, 0, 0, 1, 1,
0.6029203, 1.555932, 0.5483189, 0, 0, 0, 1, 1,
0.6031544, -0.3555149, 1.878606, 0, 0, 0, 1, 1,
0.6123953, 0.6527092, -0.9478227, 1, 1, 1, 1, 1,
0.6132101, -0.8766943, 2.801646, 1, 1, 1, 1, 1,
0.6156332, 0.7068621, 1.397731, 1, 1, 1, 1, 1,
0.6164641, 0.7125046, 0.0839294, 1, 1, 1, 1, 1,
0.6198903, 2.458074, 0.6032572, 1, 1, 1, 1, 1,
0.6294121, -0.1162659, -0.06284309, 1, 1, 1, 1, 1,
0.6307295, -1.153105, 4.403625, 1, 1, 1, 1, 1,
0.630777, 0.5232926, 2.148767, 1, 1, 1, 1, 1,
0.6316864, -1.284821, 3.941056, 1, 1, 1, 1, 1,
0.6328653, -1.500219, 4.184029, 1, 1, 1, 1, 1,
0.6353782, -1.80015, 1.700636, 1, 1, 1, 1, 1,
0.6386886, -1.091576, 2.857786, 1, 1, 1, 1, 1,
0.641059, -0.06933177, 0.756855, 1, 1, 1, 1, 1,
0.64298, -1.021637, 2.117625, 1, 1, 1, 1, 1,
0.6432821, -2.622719, 3.138409, 1, 1, 1, 1, 1,
0.6460107, -0.9605802, 2.874361, 0, 0, 1, 1, 1,
0.6467342, 1.910601, 0.1286219, 1, 0, 0, 1, 1,
0.6561024, 0.4834215, 0.8814157, 1, 0, 0, 1, 1,
0.6647102, 1.461488, 0.8464482, 1, 0, 0, 1, 1,
0.667511, 1.912439, 0.3738401, 1, 0, 0, 1, 1,
0.6697509, -0.9408501, 1.859408, 1, 0, 0, 1, 1,
0.670242, 0.3049372, -0.2129157, 0, 0, 0, 1, 1,
0.6759662, 0.1491243, 2.393009, 0, 0, 0, 1, 1,
0.6783446, -1.208512, 2.619148, 0, 0, 0, 1, 1,
0.6808782, -2.47782, 2.237076, 0, 0, 0, 1, 1,
0.6845767, -1.856971, 3.193283, 0, 0, 0, 1, 1,
0.6868563, 0.2413116, 1.062425, 0, 0, 0, 1, 1,
0.6886144, 0.1617005, 0.9193795, 0, 0, 0, 1, 1,
0.6923046, 0.6730274, 0.0002588333, 1, 1, 1, 1, 1,
0.701462, -0.9864942, 2.2581, 1, 1, 1, 1, 1,
0.7075884, 0.6754237, 0.07178573, 1, 1, 1, 1, 1,
0.7093366, -1.029521, 0.7077789, 1, 1, 1, 1, 1,
0.7105431, 0.3461076, 0.3740591, 1, 1, 1, 1, 1,
0.716615, 0.5672589, 1.478199, 1, 1, 1, 1, 1,
0.7173105, -0.5188047, 1.836568, 1, 1, 1, 1, 1,
0.7194706, 0.348393, -0.7042512, 1, 1, 1, 1, 1,
0.7248969, -1.207983, 4.181705, 1, 1, 1, 1, 1,
0.7257198, -0.5301007, 1.754452, 1, 1, 1, 1, 1,
0.7307639, -1.148728, 1.853976, 1, 1, 1, 1, 1,
0.7388797, 0.4355108, 0.805685, 1, 1, 1, 1, 1,
0.7401137, -0.4488092, 2.436568, 1, 1, 1, 1, 1,
0.7423739, -1.776273, 2.7295, 1, 1, 1, 1, 1,
0.7426484, 0.1857327, 1.079334, 1, 1, 1, 1, 1,
0.7446682, -1.036756, 1.667794, 0, 0, 1, 1, 1,
0.7481471, -0.5027763, 2.159683, 1, 0, 0, 1, 1,
0.7535813, -0.2807615, 2.294505, 1, 0, 0, 1, 1,
0.7579895, -1.461258, 3.973102, 1, 0, 0, 1, 1,
0.7602977, 0.7161155, 0.1058199, 1, 0, 0, 1, 1,
0.7717103, 0.6519353, 0.8951002, 1, 0, 0, 1, 1,
0.7726108, 0.2706616, 2.144349, 0, 0, 0, 1, 1,
0.773411, 0.09446202, 0.2534158, 0, 0, 0, 1, 1,
0.7745247, 0.5251718, -0.09161296, 0, 0, 0, 1, 1,
0.7829366, -0.7994283, 2.231837, 0, 0, 0, 1, 1,
0.78325, 0.1303688, 0.8189526, 0, 0, 0, 1, 1,
0.7898217, -0.1428663, 1.795951, 0, 0, 0, 1, 1,
0.7989904, 1.364543, 1.128149, 0, 0, 0, 1, 1,
0.8012123, -0.3297395, 1.749521, 1, 1, 1, 1, 1,
0.8021669, -0.05713372, 0.3479827, 1, 1, 1, 1, 1,
0.8023648, -1.546016, 0.7463539, 1, 1, 1, 1, 1,
0.8051724, -0.1796641, 1.273227, 1, 1, 1, 1, 1,
0.8054731, -1.61729, 3.134522, 1, 1, 1, 1, 1,
0.8066639, -0.7355645, 2.494842, 1, 1, 1, 1, 1,
0.8076616, 1.027411, -0.04313708, 1, 1, 1, 1, 1,
0.8080216, -0.4894232, 2.394094, 1, 1, 1, 1, 1,
0.8185683, -2.105347, 1.908922, 1, 1, 1, 1, 1,
0.8203163, -0.6246126, 2.758536, 1, 1, 1, 1, 1,
0.8271255, -2.015728, 1.143045, 1, 1, 1, 1, 1,
0.8287362, -1.055387, 1.973939, 1, 1, 1, 1, 1,
0.8288515, 0.3129744, 2.7431, 1, 1, 1, 1, 1,
0.8303648, -0.3622985, 1.957906, 1, 1, 1, 1, 1,
0.8332172, -0.6484269, 4.297869, 1, 1, 1, 1, 1,
0.83432, -1.004587, 2.669606, 0, 0, 1, 1, 1,
0.8358668, -0.401982, 2.982552, 1, 0, 0, 1, 1,
0.8367553, -1.819248, 3.506431, 1, 0, 0, 1, 1,
0.8392833, 0.7814735, 2.73798, 1, 0, 0, 1, 1,
0.8554808, 0.551788, 1.205958, 1, 0, 0, 1, 1,
0.8567774, -0.3061731, 1.232833, 1, 0, 0, 1, 1,
0.8614539, 0.1578563, 2.15977, 0, 0, 0, 1, 1,
0.8618878, -1.163729, 3.516934, 0, 0, 0, 1, 1,
0.8623657, -0.05607463, 1.700423, 0, 0, 0, 1, 1,
0.8650465, 0.4197403, 1.355729, 0, 0, 0, 1, 1,
0.8654752, 1.002226, 1.217684, 0, 0, 0, 1, 1,
0.8708736, -0.7327923, 2.34048, 0, 0, 0, 1, 1,
0.8714745, 0.4197518, 1.117763, 0, 0, 0, 1, 1,
0.8732499, -0.7085676, 4.403915, 1, 1, 1, 1, 1,
0.8791821, -2.447352, 2.081745, 1, 1, 1, 1, 1,
0.882497, -0.4719155, 2.699236, 1, 1, 1, 1, 1,
0.8844166, 0.5279925, 1.809066, 1, 1, 1, 1, 1,
0.8896835, -0.9961764, 1.99255, 1, 1, 1, 1, 1,
0.9099942, -0.5950022, 2.383851, 1, 1, 1, 1, 1,
0.9130598, 1.407004, -1.182875, 1, 1, 1, 1, 1,
0.9149484, 1.153563, -0.5683093, 1, 1, 1, 1, 1,
0.9172755, 0.7341532, 0.7297702, 1, 1, 1, 1, 1,
0.9199595, -0.2319781, 1.211838, 1, 1, 1, 1, 1,
0.9217219, 0.8517311, -0.6894412, 1, 1, 1, 1, 1,
0.92189, -2.392336, 3.938127, 1, 1, 1, 1, 1,
0.9220013, -0.4790167, 0.4770539, 1, 1, 1, 1, 1,
0.9236369, -0.4089614, 3.005581, 1, 1, 1, 1, 1,
0.9240176, -0.9563138, 3.47594, 1, 1, 1, 1, 1,
0.9300013, 0.3288219, 1.762966, 0, 0, 1, 1, 1,
0.931391, -0.4946312, 1.412735, 1, 0, 0, 1, 1,
0.9334716, -0.1032181, 1.915523, 1, 0, 0, 1, 1,
0.9378101, -0.8991907, 1.663876, 1, 0, 0, 1, 1,
0.9385618, 1.351176, -0.1030569, 1, 0, 0, 1, 1,
0.9424178, -0.1917737, 1.492108, 1, 0, 0, 1, 1,
0.9428259, -1.310041, 2.642094, 0, 0, 0, 1, 1,
0.9436284, 0.3649986, 1.882126, 0, 0, 0, 1, 1,
0.9513174, 1.563824, -1.026593, 0, 0, 0, 1, 1,
0.9546323, -0.1058113, 2.41376, 0, 0, 0, 1, 1,
0.9588709, 0.3478231, 0.9532332, 0, 0, 0, 1, 1,
0.9638691, -0.7432082, 2.289887, 0, 0, 0, 1, 1,
0.9686333, -0.6214399, 3.531367, 0, 0, 0, 1, 1,
0.9717939, -1.050248, 1.962986, 1, 1, 1, 1, 1,
0.9766319, 0.180542, 0.1208957, 1, 1, 1, 1, 1,
0.9777054, -0.6034532, 2.880369, 1, 1, 1, 1, 1,
0.9783092, -0.8833034, 2.620056, 1, 1, 1, 1, 1,
0.9860267, 1.186542, 1.580826, 1, 1, 1, 1, 1,
1.008325, 1.163513, -0.755327, 1, 1, 1, 1, 1,
1.009772, 1.077464, -0.5977089, 1, 1, 1, 1, 1,
1.023348, 0.2088216, 1.661762, 1, 1, 1, 1, 1,
1.023841, 0.3059619, 0.27689, 1, 1, 1, 1, 1,
1.036047, 0.6731527, 0.08482215, 1, 1, 1, 1, 1,
1.040376, -0.1416894, 2.278676, 1, 1, 1, 1, 1,
1.04185, -0.3023744, 0.7069099, 1, 1, 1, 1, 1,
1.042437, 0.3610065, 1.456978, 1, 1, 1, 1, 1,
1.045443, -0.1605745, 2.492857, 1, 1, 1, 1, 1,
1.04955, 1.274177, -0.7321367, 1, 1, 1, 1, 1,
1.052126, 0.614195, 0.613255, 0, 0, 1, 1, 1,
1.056122, -0.06580535, 0.9737488, 1, 0, 0, 1, 1,
1.062645, 1.745489, 0.8400143, 1, 0, 0, 1, 1,
1.064233, 0.7511678, 0.8783719, 1, 0, 0, 1, 1,
1.066049, -1.345785, 1.153883, 1, 0, 0, 1, 1,
1.071324, 0.1221594, 1.835041, 1, 0, 0, 1, 1,
1.076676, 1.584492, 0.6665992, 0, 0, 0, 1, 1,
1.077633, 0.4600453, -0.2209071, 0, 0, 0, 1, 1,
1.084889, 1.003663, 1.358185, 0, 0, 0, 1, 1,
1.085181, 0.2501187, 0.7689841, 0, 0, 0, 1, 1,
1.087788, -0.6122094, 1.706628, 0, 0, 0, 1, 1,
1.089526, -2.556542, 2.582085, 0, 0, 0, 1, 1,
1.090022, -2.066559, 3.769372, 0, 0, 0, 1, 1,
1.09569, 0.6391191, 2.924354, 1, 1, 1, 1, 1,
1.099027, 1.262747, 1.594822, 1, 1, 1, 1, 1,
1.100937, 1.554089, 0.1029794, 1, 1, 1, 1, 1,
1.101651, 0.7530935, 0.9186935, 1, 1, 1, 1, 1,
1.115594, -1.751173, 3.369491, 1, 1, 1, 1, 1,
1.116463, -1.325308, 2.09934, 1, 1, 1, 1, 1,
1.1225, 0.436158, 0.9142479, 1, 1, 1, 1, 1,
1.123973, 0.948956, 2.459322, 1, 1, 1, 1, 1,
1.125422, 0.5238953, 0.3627747, 1, 1, 1, 1, 1,
1.140339, 0.8894882, 2.552696, 1, 1, 1, 1, 1,
1.145191, -0.8501353, 3.101207, 1, 1, 1, 1, 1,
1.145197, 0.2416218, 0.9672858, 1, 1, 1, 1, 1,
1.148426, -1.133832, 3.056936, 1, 1, 1, 1, 1,
1.157311, -0.1691443, 2.423854, 1, 1, 1, 1, 1,
1.164523, 0.421425, 0.1446456, 1, 1, 1, 1, 1,
1.164955, -2.438705, 2.57334, 0, 0, 1, 1, 1,
1.171078, 1.470841, 0.9657356, 1, 0, 0, 1, 1,
1.173558, -1.058871, 3.344691, 1, 0, 0, 1, 1,
1.174771, 0.5189921, 2.85484, 1, 0, 0, 1, 1,
1.176745, -0.6403305, 2.522689, 1, 0, 0, 1, 1,
1.186113, 1.27743, 0.7348243, 1, 0, 0, 1, 1,
1.187798, -0.02306788, 3.615509, 0, 0, 0, 1, 1,
1.188486, 0.7670546, 2.243237, 0, 0, 0, 1, 1,
1.191792, -0.03718292, 2.426325, 0, 0, 0, 1, 1,
1.195, 0.1474097, 1.456383, 0, 0, 0, 1, 1,
1.198707, 0.7203277, 0.2490563, 0, 0, 0, 1, 1,
1.198884, 1.629891, 0.5707545, 0, 0, 0, 1, 1,
1.199162, 0.6998836, 1.531123, 0, 0, 0, 1, 1,
1.216985, -1.890943, 1.341997, 1, 1, 1, 1, 1,
1.249054, -1.745972, 1.76757, 1, 1, 1, 1, 1,
1.249259, 1.223989, 0.341308, 1, 1, 1, 1, 1,
1.251132, 0.6138477, 1.192092, 1, 1, 1, 1, 1,
1.278372, 0.5816351, 0.8343298, 1, 1, 1, 1, 1,
1.302834, -1.202967, 1.462596, 1, 1, 1, 1, 1,
1.326297, 0.6180488, 0.9907777, 1, 1, 1, 1, 1,
1.327927, -0.9612209, 0.9087933, 1, 1, 1, 1, 1,
1.329898, -0.1486834, 3.423209, 1, 1, 1, 1, 1,
1.331906, -0.7450351, 2.928715, 1, 1, 1, 1, 1,
1.333762, 0.4265538, -0.01074161, 1, 1, 1, 1, 1,
1.340097, 1.120944, 0.3728044, 1, 1, 1, 1, 1,
1.385319, -1.010959, 1.286105, 1, 1, 1, 1, 1,
1.386341, 1.146427, 2.495139, 1, 1, 1, 1, 1,
1.393024, -0.6812153, 2.943958, 1, 1, 1, 1, 1,
1.399464, 0.09898777, 0.8655465, 0, 0, 1, 1, 1,
1.422024, 1.441058, -0.08301086, 1, 0, 0, 1, 1,
1.422509, -0.4453599, 1.298872, 1, 0, 0, 1, 1,
1.423651, 0.08854173, 1.498181, 1, 0, 0, 1, 1,
1.42751, -1.131216, 3.036378, 1, 0, 0, 1, 1,
1.437294, -0.05463883, 2.645748, 1, 0, 0, 1, 1,
1.452556, -1.267803, 2.119431, 0, 0, 0, 1, 1,
1.454312, -2.371607, 3.081264, 0, 0, 0, 1, 1,
1.469989, 1.690301, 0.1996306, 0, 0, 0, 1, 1,
1.471515, 0.08341055, 1.992985, 0, 0, 0, 1, 1,
1.481352, 0.2019585, 2.755148, 0, 0, 0, 1, 1,
1.493755, -0.3809951, 1.645534, 0, 0, 0, 1, 1,
1.500159, -0.1341877, 1.139786, 0, 0, 0, 1, 1,
1.503394, -0.8872938, 2.071504, 1, 1, 1, 1, 1,
1.528805, 0.4039518, 1.045095, 1, 1, 1, 1, 1,
1.532233, -1.454978, 0.07655573, 1, 1, 1, 1, 1,
1.544545, 1.527717, 1.364502, 1, 1, 1, 1, 1,
1.549533, 0.2573006, 0.6832997, 1, 1, 1, 1, 1,
1.551255, 1.603803, -0.1708231, 1, 1, 1, 1, 1,
1.561464, -1.252324, 4.005199, 1, 1, 1, 1, 1,
1.565411, -0.4850138, 2.027738, 1, 1, 1, 1, 1,
1.568007, -1.709268, 1.153689, 1, 1, 1, 1, 1,
1.59173, 0.7080063, 1.274889, 1, 1, 1, 1, 1,
1.591849, 1.483131, 1.428789, 1, 1, 1, 1, 1,
1.597598, 0.1852905, 2.697544, 1, 1, 1, 1, 1,
1.605975, -0.5544338, 3.633438, 1, 1, 1, 1, 1,
1.630864, -1.366141, 1.345475, 1, 1, 1, 1, 1,
1.632166, 1.77986, 0.1181178, 1, 1, 1, 1, 1,
1.638601, -1.695593, 0.5716798, 0, 0, 1, 1, 1,
1.640436, -0.7705028, 3.954118, 1, 0, 0, 1, 1,
1.645737, -2.295, 1.471653, 1, 0, 0, 1, 1,
1.648364, 0.9630892, 3.168142, 1, 0, 0, 1, 1,
1.650885, 0.8491644, 1.48788, 1, 0, 0, 1, 1,
1.66729, 0.5835937, 2.079546, 1, 0, 0, 1, 1,
1.678922, -0.05883502, 1.986974, 0, 0, 0, 1, 1,
1.685363, -0.743535, 1.703398, 0, 0, 0, 1, 1,
1.713568, -0.5743251, 1.90796, 0, 0, 0, 1, 1,
1.732171, -1.616609, 1.87781, 0, 0, 0, 1, 1,
1.737828, -0.1816557, 0.1160698, 0, 0, 0, 1, 1,
1.740388, -0.03723315, 0.2152114, 0, 0, 0, 1, 1,
1.743817, -0.01972573, 2.057616, 0, 0, 0, 1, 1,
1.759057, -0.5272011, 0.9046142, 1, 1, 1, 1, 1,
1.803359, -0.4305242, 2.361135, 1, 1, 1, 1, 1,
1.850412, 1.809048, 2.053808, 1, 1, 1, 1, 1,
1.857437, -1.289224, 2.042808, 1, 1, 1, 1, 1,
1.888041, 0.485135, 1.989435, 1, 1, 1, 1, 1,
1.889934, 1.470605, 1.011994, 1, 1, 1, 1, 1,
1.911617, 0.007041496, 1.29046, 1, 1, 1, 1, 1,
1.924165, -0.9944915, 1.992872, 1, 1, 1, 1, 1,
1.95123, -0.7754116, 2.375298, 1, 1, 1, 1, 1,
2.024998, -1.022117, 3.48336, 1, 1, 1, 1, 1,
2.029621, -0.2113807, 0.9448593, 1, 1, 1, 1, 1,
2.037721, 1.299688, 0.5225717, 1, 1, 1, 1, 1,
2.041792, 0.6835942, 1.078509, 1, 1, 1, 1, 1,
2.07364, -0.06952547, 3.121718, 1, 1, 1, 1, 1,
2.105481, -0.6772306, 1.125681, 1, 1, 1, 1, 1,
2.18192, -0.4912494, 1.680693, 0, 0, 1, 1, 1,
2.19864, 0.9321676, 1.982299, 1, 0, 0, 1, 1,
2.201717, 0.3319778, 1.067839, 1, 0, 0, 1, 1,
2.204765, -1.596617, 2.184395, 1, 0, 0, 1, 1,
2.220672, -0.5160353, 1.736422, 1, 0, 0, 1, 1,
2.228547, -0.6626186, 1.370876, 1, 0, 0, 1, 1,
2.255847, 0.3903165, -0.9874352, 0, 0, 0, 1, 1,
2.28766, 0.1894579, 1.147184, 0, 0, 0, 1, 1,
2.293255, -0.7196361, 3.18035, 0, 0, 0, 1, 1,
2.298594, -0.750485, 1.423634, 0, 0, 0, 1, 1,
2.358621, 0.2772645, 0.7111122, 0, 0, 0, 1, 1,
2.40891, 2.029924, 2.245183, 0, 0, 0, 1, 1,
2.488331, 1.820512, 1.531393, 0, 0, 0, 1, 1,
2.52886, -0.6720909, 1.427034, 1, 1, 1, 1, 1,
2.676823, -1.267808, 2.516339, 1, 1, 1, 1, 1,
2.678144, 1.39401, -0.0400211, 1, 1, 1, 1, 1,
2.726653, 0.9484692, 2.241596, 1, 1, 1, 1, 1,
2.854716, -0.1637508, 2.54002, 1, 1, 1, 1, 1,
2.90203, -0.3110561, 3.233965, 1, 1, 1, 1, 1,
3.368345, -0.5299512, 0.1826137, 1, 1, 1, 1, 1
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
var radius = 9.392535;
var distance = 32.99088;
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
mvMatrix.translate( -0.1428382, -0.2275833, -0.141645 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.99088);
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
