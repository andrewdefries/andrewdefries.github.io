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
-2.838668, 0.8014103, -1.299811, 1, 0, 0, 1,
-2.808755, 1.414776, -0.7790459, 1, 0.007843138, 0, 1,
-2.649995, 0.3850164, -2.574121, 1, 0.01176471, 0, 1,
-2.524428, 2.021941, -0.5085933, 1, 0.01960784, 0, 1,
-2.48127, -0.8404474, -1.445147, 1, 0.02352941, 0, 1,
-2.451284, -0.4769811, -0.1031721, 1, 0.03137255, 0, 1,
-2.44641, 0.6341776, -1.591626, 1, 0.03529412, 0, 1,
-2.435767, 0.6607557, -1.34481, 1, 0.04313726, 0, 1,
-2.390716, 0.7587364, -1.184773, 1, 0.04705882, 0, 1,
-2.386045, -0.4103881, -1.707487, 1, 0.05490196, 0, 1,
-2.326911, 1.032969, -3.473802, 1, 0.05882353, 0, 1,
-2.295218, 0.1810322, -2.486309, 1, 0.06666667, 0, 1,
-2.270444, 1.2436, -1.084784, 1, 0.07058824, 0, 1,
-2.239439, -0.4966943, -0.2671716, 1, 0.07843138, 0, 1,
-2.238029, -0.7072637, -3.056294, 1, 0.08235294, 0, 1,
-2.213725, -0.01603159, -1.397046, 1, 0.09019608, 0, 1,
-2.18842, -1.057001, -2.488717, 1, 0.09411765, 0, 1,
-2.153141, -1.118304, -1.889491, 1, 0.1019608, 0, 1,
-2.150152, -1.153551, -0.7329495, 1, 0.1098039, 0, 1,
-2.129156, -1.177197, -3.641078, 1, 0.1137255, 0, 1,
-2.092812, -0.09198506, -1.706317, 1, 0.1215686, 0, 1,
-2.086422, -0.7650447, -1.714177, 1, 0.1254902, 0, 1,
-2.08479, -1.535053, -1.742146, 1, 0.1333333, 0, 1,
-2.084443, -0.9787017, -3.966509, 1, 0.1372549, 0, 1,
-2.036129, -1.253055, -2.556785, 1, 0.145098, 0, 1,
-2.009091, -1.579458, -1.163151, 1, 0.1490196, 0, 1,
-1.999653, 0.01106839, -1.031446, 1, 0.1568628, 0, 1,
-1.986257, 1.016392, -1.985277, 1, 0.1607843, 0, 1,
-1.979964, 0.1634357, -1.103882, 1, 0.1686275, 0, 1,
-1.950997, -1.157032, -2.771329, 1, 0.172549, 0, 1,
-1.944699, -0.5176234, -1.772603, 1, 0.1803922, 0, 1,
-1.91019, -1.395728, -1.725042, 1, 0.1843137, 0, 1,
-1.885917, 0.7409393, -0.1687741, 1, 0.1921569, 0, 1,
-1.872705, 1.019896, -1.440996, 1, 0.1960784, 0, 1,
-1.858689, -1.554679, -2.285639, 1, 0.2039216, 0, 1,
-1.853388, -2.329117, -1.890431, 1, 0.2117647, 0, 1,
-1.844694, -1.174739, -0.6455428, 1, 0.2156863, 0, 1,
-1.838935, -0.5071855, -1.88901, 1, 0.2235294, 0, 1,
-1.838564, -1.14657, -2.62999, 1, 0.227451, 0, 1,
-1.784784, 0.2128016, -1.843512, 1, 0.2352941, 0, 1,
-1.753548, 0.5882892, -2.072109, 1, 0.2392157, 0, 1,
-1.728203, 1.159101, -1.253592, 1, 0.2470588, 0, 1,
-1.697649, -2.245679, -2.864121, 1, 0.2509804, 0, 1,
-1.682952, -0.2699049, -1.379295, 1, 0.2588235, 0, 1,
-1.648394, -0.129538, -1.941201, 1, 0.2627451, 0, 1,
-1.638782, 0.4030702, -1.987513, 1, 0.2705882, 0, 1,
-1.636727, 3.621183, -0.9783708, 1, 0.2745098, 0, 1,
-1.632273, -0.1422895, -3.03492, 1, 0.282353, 0, 1,
-1.626793, -0.391394, -2.583514, 1, 0.2862745, 0, 1,
-1.62466, 2.190325, -0.1801513, 1, 0.2941177, 0, 1,
-1.606301, 0.4977176, -0.5566328, 1, 0.3019608, 0, 1,
-1.605662, -1.333355, -0.998805, 1, 0.3058824, 0, 1,
-1.59697, 1.846308, -0.6551327, 1, 0.3137255, 0, 1,
-1.594949, 1.175285, -4.034078, 1, 0.3176471, 0, 1,
-1.524322, 1.05993, -1.34967, 1, 0.3254902, 0, 1,
-1.515907, -1.117817, -1.989727, 1, 0.3294118, 0, 1,
-1.515111, -0.8752012, -3.268771, 1, 0.3372549, 0, 1,
-1.503034, 0.1198202, -1.072392, 1, 0.3411765, 0, 1,
-1.499558, -0.1236709, -0.9189588, 1, 0.3490196, 0, 1,
-1.494806, -0.5621731, -4.368597, 1, 0.3529412, 0, 1,
-1.494518, -0.9974399, -1.729097, 1, 0.3607843, 0, 1,
-1.478211, 0.3606263, -3.007737, 1, 0.3647059, 0, 1,
-1.476862, 0.6542987, -2.81494, 1, 0.372549, 0, 1,
-1.462817, 0.4970807, -0.1647728, 1, 0.3764706, 0, 1,
-1.460707, -1.785796, -3.358969, 1, 0.3843137, 0, 1,
-1.4593, 0.6417497, -2.10009, 1, 0.3882353, 0, 1,
-1.450064, -2.310358, -4.941489, 1, 0.3960784, 0, 1,
-1.448631, 0.1336764, -0.8063842, 1, 0.4039216, 0, 1,
-1.444226, -0.9204015, -1.323658, 1, 0.4078431, 0, 1,
-1.44132, 0.9369465, 0.3365424, 1, 0.4156863, 0, 1,
-1.43846, -1.137787, -1.593014, 1, 0.4196078, 0, 1,
-1.431282, -0.4900733, -1.327476, 1, 0.427451, 0, 1,
-1.429023, -1.8436, -3.394957, 1, 0.4313726, 0, 1,
-1.421815, -1.401484, -3.289041, 1, 0.4392157, 0, 1,
-1.411892, -1.676061, -3.846917, 1, 0.4431373, 0, 1,
-1.410655, 0.7310074, -1.959216, 1, 0.4509804, 0, 1,
-1.40371, -0.4285983, -1.675192, 1, 0.454902, 0, 1,
-1.394183, 0.6755634, -0.9826727, 1, 0.4627451, 0, 1,
-1.37704, -0.8606744, -2.763816, 1, 0.4666667, 0, 1,
-1.367162, 0.3147528, -0.7419475, 1, 0.4745098, 0, 1,
-1.367059, -0.1662777, -2.768164, 1, 0.4784314, 0, 1,
-1.35293, -1.449153, -3.002681, 1, 0.4862745, 0, 1,
-1.35052, -0.9203811, -2.877481, 1, 0.4901961, 0, 1,
-1.332141, 0.9490273, -0.3389938, 1, 0.4980392, 0, 1,
-1.323653, -2.049591, -2.300246, 1, 0.5058824, 0, 1,
-1.318169, 1.074417, 0.0841539, 1, 0.509804, 0, 1,
-1.305951, 0.173554, -1.057765, 1, 0.5176471, 0, 1,
-1.305632, 0.3124613, -1.598923, 1, 0.5215687, 0, 1,
-1.300153, -0.5659163, 0.6397557, 1, 0.5294118, 0, 1,
-1.295608, 0.6022462, -1.294499, 1, 0.5333334, 0, 1,
-1.285965, -0.7465518, -2.809367, 1, 0.5411765, 0, 1,
-1.280054, -0.4850689, -1.11487, 1, 0.5450981, 0, 1,
-1.270979, -0.9714912, -1.542087, 1, 0.5529412, 0, 1,
-1.267222, 0.2332308, 0.3583886, 1, 0.5568628, 0, 1,
-1.262789, -0.1279857, -2.2143, 1, 0.5647059, 0, 1,
-1.257451, -0.1577544, -1.392771, 1, 0.5686275, 0, 1,
-1.256953, 1.04616, -0.1223863, 1, 0.5764706, 0, 1,
-1.246955, -0.3821926, -1.90743, 1, 0.5803922, 0, 1,
-1.23901, 0.3670292, -1.720953, 1, 0.5882353, 0, 1,
-1.235823, 1.681506, -0.7882881, 1, 0.5921569, 0, 1,
-1.223723, 0.375683, -1.535276, 1, 0.6, 0, 1,
-1.220901, -1.402346, -1.526597, 1, 0.6078432, 0, 1,
-1.2184, -0.3994898, -0.5971036, 1, 0.6117647, 0, 1,
-1.217757, 0.3578816, -0.05760721, 1, 0.6196079, 0, 1,
-1.206174, -2.140882, -2.241298, 1, 0.6235294, 0, 1,
-1.20334, -0.4278567, -1.981407, 1, 0.6313726, 0, 1,
-1.198755, -1.706967, -4.198479, 1, 0.6352941, 0, 1,
-1.194334, 0.7131776, -2.295336, 1, 0.6431373, 0, 1,
-1.178896, 0.3118987, -2.273587, 1, 0.6470588, 0, 1,
-1.174914, -0.122152, -1.476915, 1, 0.654902, 0, 1,
-1.174885, 0.5928934, -1.101216, 1, 0.6588235, 0, 1,
-1.172626, -0.6620738, -2.140062, 1, 0.6666667, 0, 1,
-1.170255, 0.5235103, -0.1537698, 1, 0.6705883, 0, 1,
-1.16649, -0.2826677, -3.696843, 1, 0.6784314, 0, 1,
-1.165831, 0.2246977, -1.421482, 1, 0.682353, 0, 1,
-1.160284, 0.3730467, -1.14644, 1, 0.6901961, 0, 1,
-1.15932, 0.3890062, -2.0291, 1, 0.6941177, 0, 1,
-1.156325, 0.9289437, -1.055141, 1, 0.7019608, 0, 1,
-1.152167, 0.5690176, -1.986033, 1, 0.7098039, 0, 1,
-1.144569, 0.3985414, -3.272115, 1, 0.7137255, 0, 1,
-1.141475, -0.4173073, -2.761622, 1, 0.7215686, 0, 1,
-1.134305, 0.4341611, -2.127611, 1, 0.7254902, 0, 1,
-1.130108, 1.263841, -0.5978208, 1, 0.7333333, 0, 1,
-1.122361, -1.032795, -2.613456, 1, 0.7372549, 0, 1,
-1.121414, 0.01708155, -0.5272839, 1, 0.7450981, 0, 1,
-1.113229, 0.3846702, -0.1144466, 1, 0.7490196, 0, 1,
-1.105004, -0.2560186, -2.429613, 1, 0.7568628, 0, 1,
-1.097582, -0.8984673, -3.76162, 1, 0.7607843, 0, 1,
-1.09256, 0.4577581, -2.674549, 1, 0.7686275, 0, 1,
-1.088468, -1.731659, -4.12122, 1, 0.772549, 0, 1,
-1.074847, 0.1623326, -1.386411, 1, 0.7803922, 0, 1,
-1.072263, 0.6931112, -2.426124, 1, 0.7843137, 0, 1,
-1.053185, 2.199627, 0.154548, 1, 0.7921569, 0, 1,
-1.05279, 1.430901, 0.09606809, 1, 0.7960784, 0, 1,
-1.049861, -0.5712393, -0.9926243, 1, 0.8039216, 0, 1,
-1.045921, 0.349824, -1.119972, 1, 0.8117647, 0, 1,
-1.042934, 0.6667195, -1.569045, 1, 0.8156863, 0, 1,
-1.036943, -1.745546, -4.019683, 1, 0.8235294, 0, 1,
-1.036378, -0.1029786, -2.701611, 1, 0.827451, 0, 1,
-1.035244, 1.559342, -1.873774, 1, 0.8352941, 0, 1,
-1.033199, -1.55413, -2.219443, 1, 0.8392157, 0, 1,
-1.03283, 2.859851, 0.6415148, 1, 0.8470588, 0, 1,
-1.032803, 0.5387006, -2.349873, 1, 0.8509804, 0, 1,
-1.028053, -0.08633097, -1.469352, 1, 0.8588235, 0, 1,
-1.021781, -0.231879, -0.5334016, 1, 0.8627451, 0, 1,
-1.020827, 0.774948, -0.3752348, 1, 0.8705882, 0, 1,
-1.015437, 0.812068, -0.2716726, 1, 0.8745098, 0, 1,
-1.008946, -0.1988018, -0.7000747, 1, 0.8823529, 0, 1,
-0.997726, -0.2491739, -1.545392, 1, 0.8862745, 0, 1,
-0.9970641, 1.352203, -0.01678387, 1, 0.8941177, 0, 1,
-0.9868559, 0.1970295, -1.138666, 1, 0.8980392, 0, 1,
-0.9842975, 1.017308, -0.8659657, 1, 0.9058824, 0, 1,
-0.9814573, 1.746398, -0.5644506, 1, 0.9137255, 0, 1,
-0.9791282, 0.4457023, 0.7219192, 1, 0.9176471, 0, 1,
-0.9774879, -2.265243, -2.931603, 1, 0.9254902, 0, 1,
-0.9766322, 0.5242454, -2.340873, 1, 0.9294118, 0, 1,
-0.9764538, -0.7787753, -3.563583, 1, 0.9372549, 0, 1,
-0.9762467, 0.4112568, -3.758395, 1, 0.9411765, 0, 1,
-0.975734, -0.7349973, -2.723224, 1, 0.9490196, 0, 1,
-0.9730203, 0.03750656, -4.040052, 1, 0.9529412, 0, 1,
-0.9709578, -2.10535, -1.696736, 1, 0.9607843, 0, 1,
-0.9683673, 1.110988, -1.220212, 1, 0.9647059, 0, 1,
-0.9636085, -0.7912276, -2.425259, 1, 0.972549, 0, 1,
-0.95964, 1.00587, 0.9381567, 1, 0.9764706, 0, 1,
-0.9594802, -0.2858317, -2.02141, 1, 0.9843137, 0, 1,
-0.9587863, 0.1390282, -0.6893682, 1, 0.9882353, 0, 1,
-0.9561598, 0.01901693, -1.51254, 1, 0.9960784, 0, 1,
-0.9547238, -1.162526, -1.895109, 0.9960784, 1, 0, 1,
-0.9518496, -1.138001, -2.889864, 0.9921569, 1, 0, 1,
-0.9504451, -0.2778651, -2.624436, 0.9843137, 1, 0, 1,
-0.9474147, -2.218407, -0.6085429, 0.9803922, 1, 0, 1,
-0.9460877, 1.010783, -2.192265, 0.972549, 1, 0, 1,
-0.9428612, -1.960339, -3.100565, 0.9686275, 1, 0, 1,
-0.9277554, 0.5321613, -0.5705466, 0.9607843, 1, 0, 1,
-0.9252813, -0.460252, -3.625515, 0.9568627, 1, 0, 1,
-0.9196223, -0.3851132, -3.304066, 0.9490196, 1, 0, 1,
-0.9181588, -0.09085155, -2.337012, 0.945098, 1, 0, 1,
-0.9099646, 0.221701, -0.005084798, 0.9372549, 1, 0, 1,
-0.9016722, 0.9304538, -0.3443485, 0.9333333, 1, 0, 1,
-0.8926441, -0.6985564, -2.183235, 0.9254902, 1, 0, 1,
-0.8908836, 0.2149951, -0.2475647, 0.9215686, 1, 0, 1,
-0.8889758, -0.3273923, -0.4729333, 0.9137255, 1, 0, 1,
-0.8861025, -1.215384, -2.205311, 0.9098039, 1, 0, 1,
-0.8824592, -1.316282, -2.451482, 0.9019608, 1, 0, 1,
-0.8821905, 1.294552, -1.443186, 0.8941177, 1, 0, 1,
-0.8773363, -0.5878192, -2.85378, 0.8901961, 1, 0, 1,
-0.8748546, 0.3596586, -1.644764, 0.8823529, 1, 0, 1,
-0.8716051, 0.08443814, -0.7009255, 0.8784314, 1, 0, 1,
-0.8668543, 1.858629, -0.1674114, 0.8705882, 1, 0, 1,
-0.8648512, -0.5306793, -0.7544661, 0.8666667, 1, 0, 1,
-0.8617532, 0.5159377, -0.3204142, 0.8588235, 1, 0, 1,
-0.8609653, -0.2450092, 0.3084629, 0.854902, 1, 0, 1,
-0.858488, 2.018526, 0.08974285, 0.8470588, 1, 0, 1,
-0.8567465, 1.097807, -2.137472, 0.8431373, 1, 0, 1,
-0.8485858, -0.8405219, -1.72399, 0.8352941, 1, 0, 1,
-0.8382214, 0.6207264, -1.012415, 0.8313726, 1, 0, 1,
-0.8361617, -1.887492, -3.432732, 0.8235294, 1, 0, 1,
-0.8297101, 0.1702091, -0.4720218, 0.8196079, 1, 0, 1,
-0.8284774, -0.6399375, -3.107301, 0.8117647, 1, 0, 1,
-0.8283391, -0.6631405, -1.782329, 0.8078431, 1, 0, 1,
-0.8246935, -0.02710586, -1.736495, 0.8, 1, 0, 1,
-0.8222228, -0.9783121, -3.43637, 0.7921569, 1, 0, 1,
-0.8174561, 0.3500731, 0.8039, 0.7882353, 1, 0, 1,
-0.8121546, 0.5838515, -0.6549565, 0.7803922, 1, 0, 1,
-0.8085099, -0.150221, -1.286473, 0.7764706, 1, 0, 1,
-0.8073381, 0.7623749, -1.606375, 0.7686275, 1, 0, 1,
-0.7982317, -1.660843, -1.631507, 0.7647059, 1, 0, 1,
-0.794302, -0.5842811, -3.67113, 0.7568628, 1, 0, 1,
-0.7922483, 1.437712, -1.721876, 0.7529412, 1, 0, 1,
-0.78785, -1.82755, -3.525018, 0.7450981, 1, 0, 1,
-0.7806862, 0.9027532, -1.46021, 0.7411765, 1, 0, 1,
-0.7778784, 0.1030549, -0.9244268, 0.7333333, 1, 0, 1,
-0.7722154, 0.0007148328, -1.542453, 0.7294118, 1, 0, 1,
-0.7720169, -2.314591, -1.316639, 0.7215686, 1, 0, 1,
-0.7711834, 1.356882, -0.4276772, 0.7176471, 1, 0, 1,
-0.7615296, 0.9828405, -1.063416, 0.7098039, 1, 0, 1,
-0.7574646, -1.650894, -3.858043, 0.7058824, 1, 0, 1,
-0.7562343, 1.316532, -1.320876, 0.6980392, 1, 0, 1,
-0.7552121, 0.7129945, -1.708689, 0.6901961, 1, 0, 1,
-0.7544965, 0.2205908, -2.778432, 0.6862745, 1, 0, 1,
-0.7463945, -0.1539007, -0.4946106, 0.6784314, 1, 0, 1,
-0.739657, -0.7977719, -2.94708, 0.6745098, 1, 0, 1,
-0.7328874, 0.6676855, -2.193591, 0.6666667, 1, 0, 1,
-0.7304834, 1.641194, -1.016041, 0.6627451, 1, 0, 1,
-0.7290539, 0.7524893, -0.3366891, 0.654902, 1, 0, 1,
-0.7148261, -0.6624094, -3.020551, 0.6509804, 1, 0, 1,
-0.708892, 0.6923512, 1.009993, 0.6431373, 1, 0, 1,
-0.7026041, -0.1674149, -2.473347, 0.6392157, 1, 0, 1,
-0.7010604, -1.249701, -2.135129, 0.6313726, 1, 0, 1,
-0.6981936, -0.1472359, -1.53184, 0.627451, 1, 0, 1,
-0.6941652, 0.8713866, 0.3276123, 0.6196079, 1, 0, 1,
-0.6939214, -0.3180101, 0.3943967, 0.6156863, 1, 0, 1,
-0.6873067, -0.6551361, -3.286824, 0.6078432, 1, 0, 1,
-0.687207, -0.4987413, -2.566538, 0.6039216, 1, 0, 1,
-0.6871632, -1.526892, -2.38021, 0.5960785, 1, 0, 1,
-0.6869748, -0.5116862, -0.5748149, 0.5882353, 1, 0, 1,
-0.6740465, 0.3862467, -2.900869, 0.5843138, 1, 0, 1,
-0.673889, -0.7393323, -2.067128, 0.5764706, 1, 0, 1,
-0.6738691, 2.043448, -1.461435, 0.572549, 1, 0, 1,
-0.6692145, -0.8469416, -1.804478, 0.5647059, 1, 0, 1,
-0.6674976, -0.1697102, -1.98218, 0.5607843, 1, 0, 1,
-0.6656293, 0.2364237, 0.4798881, 0.5529412, 1, 0, 1,
-0.6639606, -0.4943401, -4.300752, 0.5490196, 1, 0, 1,
-0.6598383, 0.1997065, -0.6066054, 0.5411765, 1, 0, 1,
-0.6554205, 1.572952, -0.7871205, 0.5372549, 1, 0, 1,
-0.6539567, -0.9667057, -3.644505, 0.5294118, 1, 0, 1,
-0.6527174, 0.1624206, -4.288508, 0.5254902, 1, 0, 1,
-0.6509923, 1.365936, -1.357892, 0.5176471, 1, 0, 1,
-0.6505247, 0.355855, -2.114043, 0.5137255, 1, 0, 1,
-0.6402677, -0.4365362, -4.381814, 0.5058824, 1, 0, 1,
-0.6372982, -0.4626254, -0.9334717, 0.5019608, 1, 0, 1,
-0.635632, 1.152897, -0.1285183, 0.4941176, 1, 0, 1,
-0.634825, -1.055272, -3.329564, 0.4862745, 1, 0, 1,
-0.6301812, -0.9484606, -2.997088, 0.4823529, 1, 0, 1,
-0.6287187, 0.4902638, -0.5076142, 0.4745098, 1, 0, 1,
-0.62253, -0.5365943, -0.3472839, 0.4705882, 1, 0, 1,
-0.6221257, 1.046645, -0.207617, 0.4627451, 1, 0, 1,
-0.6218898, 1.566987, -1.16518, 0.4588235, 1, 0, 1,
-0.6217238, 0.75293, -1.204507, 0.4509804, 1, 0, 1,
-0.6092293, 0.5517955, -1.749413, 0.4470588, 1, 0, 1,
-0.6043373, 0.2755033, -0.9241842, 0.4392157, 1, 0, 1,
-0.5993824, -0.5844943, -3.364999, 0.4352941, 1, 0, 1,
-0.5992239, -1.09824, -2.666023, 0.427451, 1, 0, 1,
-0.5858904, 2.157907, 1.0611, 0.4235294, 1, 0, 1,
-0.5854549, 2.124497, -1.836921, 0.4156863, 1, 0, 1,
-0.5819249, -0.5537743, -2.40079, 0.4117647, 1, 0, 1,
-0.574976, 2.07968, -0.6756256, 0.4039216, 1, 0, 1,
-0.5741958, 1.237319, 0.212218, 0.3960784, 1, 0, 1,
-0.5718482, 0.5295557, -0.3913614, 0.3921569, 1, 0, 1,
-0.5655489, 1.65714, -0.1200842, 0.3843137, 1, 0, 1,
-0.56038, -0.673071, -2.086165, 0.3803922, 1, 0, 1,
-0.5587899, 1.451734, -1.920808, 0.372549, 1, 0, 1,
-0.5576298, -0.1549502, -2.19177, 0.3686275, 1, 0, 1,
-0.5572182, -0.3213472, -1.069617, 0.3607843, 1, 0, 1,
-0.556383, 0.086362, -0.9565999, 0.3568628, 1, 0, 1,
-0.5545567, -1.817731, -2.199045, 0.3490196, 1, 0, 1,
-0.5505042, -0.1142249, -2.427842, 0.345098, 1, 0, 1,
-0.5477262, -0.8637359, -2.802758, 0.3372549, 1, 0, 1,
-0.5391117, 1.614385, -1.307521, 0.3333333, 1, 0, 1,
-0.5385494, 0.08378961, -2.948367, 0.3254902, 1, 0, 1,
-0.5318045, 2.013443, -2.426638, 0.3215686, 1, 0, 1,
-0.5306113, 0.5097987, -2.363006, 0.3137255, 1, 0, 1,
-0.5275677, -0.6775842, -2.025275, 0.3098039, 1, 0, 1,
-0.5266441, 0.6019937, -2.375182, 0.3019608, 1, 0, 1,
-0.5261763, -1.329403, -2.404665, 0.2941177, 1, 0, 1,
-0.5214185, 0.1287628, -2.574755, 0.2901961, 1, 0, 1,
-0.5199682, 1.55018, -0.106222, 0.282353, 1, 0, 1,
-0.5189366, -0.1161479, -0.896229, 0.2784314, 1, 0, 1,
-0.5151293, -0.9403319, -1.879911, 0.2705882, 1, 0, 1,
-0.5091671, -0.3232251, -0.8580265, 0.2666667, 1, 0, 1,
-0.5061366, -1.474918, -3.61026, 0.2588235, 1, 0, 1,
-0.5045868, -0.7880698, -2.048983, 0.254902, 1, 0, 1,
-0.5027847, 1.838108, 2.092646, 0.2470588, 1, 0, 1,
-0.4928124, -0.939968, -4.333112, 0.2431373, 1, 0, 1,
-0.4900914, 1.995767, 0.3078644, 0.2352941, 1, 0, 1,
-0.4899976, -0.5487226, -2.555841, 0.2313726, 1, 0, 1,
-0.4864536, 1.112049, -1.387212, 0.2235294, 1, 0, 1,
-0.481918, 0.6335036, 0.1268791, 0.2196078, 1, 0, 1,
-0.4806132, 2.374066, -0.03221112, 0.2117647, 1, 0, 1,
-0.4729077, 1.161417, -0.2040153, 0.2078431, 1, 0, 1,
-0.4714054, 0.3102267, -1.185684, 0.2, 1, 0, 1,
-0.4710607, 0.1598887, -1.231936, 0.1921569, 1, 0, 1,
-0.4695718, -1.140863, -3.771464, 0.1882353, 1, 0, 1,
-0.4679908, 0.4018272, 0.4439025, 0.1803922, 1, 0, 1,
-0.467473, -0.5621989, -3.228131, 0.1764706, 1, 0, 1,
-0.4627248, 0.5746127, -1.133151, 0.1686275, 1, 0, 1,
-0.4577614, -0.03599041, -2.569954, 0.1647059, 1, 0, 1,
-0.456268, -1.694229, -0.9150184, 0.1568628, 1, 0, 1,
-0.4545391, -0.2522134, -0.7402071, 0.1529412, 1, 0, 1,
-0.4536655, 1.286407, -1.615186, 0.145098, 1, 0, 1,
-0.4508063, 0.4391692, -0.6087642, 0.1411765, 1, 0, 1,
-0.4460279, 1.470735, -0.5498567, 0.1333333, 1, 0, 1,
-0.4439776, 0.142457, -3.272453, 0.1294118, 1, 0, 1,
-0.438701, 1.916392, -0.9518904, 0.1215686, 1, 0, 1,
-0.4386103, 0.5311638, -2.434331, 0.1176471, 1, 0, 1,
-0.4360636, 0.8125219, -0.8858156, 0.1098039, 1, 0, 1,
-0.4340219, 0.04456631, -1.602393, 0.1058824, 1, 0, 1,
-0.4326299, 0.4435036, 0.627434, 0.09803922, 1, 0, 1,
-0.4320744, 0.9568183, -1.334445, 0.09019608, 1, 0, 1,
-0.4257623, -0.9477602, -2.271753, 0.08627451, 1, 0, 1,
-0.4236596, -0.9958294, -2.235566, 0.07843138, 1, 0, 1,
-0.4221011, 0.4432496, 1.055215, 0.07450981, 1, 0, 1,
-0.4147887, -2.156078, -4.979575, 0.06666667, 1, 0, 1,
-0.4100691, 0.5955775, -0.6721357, 0.0627451, 1, 0, 1,
-0.4077627, -0.7754585, -2.648329, 0.05490196, 1, 0, 1,
-0.4058355, -0.7151225, -3.586245, 0.05098039, 1, 0, 1,
-0.3949177, 1.925688, -0.6780565, 0.04313726, 1, 0, 1,
-0.3929626, -0.9050062, -4.056627, 0.03921569, 1, 0, 1,
-0.3893388, 0.3234203, -0.6595492, 0.03137255, 1, 0, 1,
-0.3872266, 0.3166614, -1.391566, 0.02745098, 1, 0, 1,
-0.3856893, -1.199636, -3.196329, 0.01960784, 1, 0, 1,
-0.3812041, 0.09787036, -0.7905892, 0.01568628, 1, 0, 1,
-0.3787814, 0.2945975, 1.319709, 0.007843138, 1, 0, 1,
-0.3690284, -0.5931219, -2.573658, 0.003921569, 1, 0, 1,
-0.3678101, 0.5969515, -1.092394, 0, 1, 0.003921569, 1,
-0.3651738, 1.105502, 0.4220819, 0, 1, 0.01176471, 1,
-0.3638322, 0.3447753, -1.772685, 0, 1, 0.01568628, 1,
-0.3573898, 2.588654, 1.08272, 0, 1, 0.02352941, 1,
-0.3565083, 0.01845207, -1.162983, 0, 1, 0.02745098, 1,
-0.3564026, 0.5917665, -0.2182186, 0, 1, 0.03529412, 1,
-0.3544965, 1.391121, -1.354815, 0, 1, 0.03921569, 1,
-0.3530351, 0.1638714, 0.7463677, 0, 1, 0.04705882, 1,
-0.3529702, 0.5457365, -0.6387542, 0, 1, 0.05098039, 1,
-0.3528124, 0.2697009, 0.7974226, 0, 1, 0.05882353, 1,
-0.3514101, 0.6465051, -1.078078, 0, 1, 0.0627451, 1,
-0.3426747, 0.2024285, -2.045937, 0, 1, 0.07058824, 1,
-0.3420257, 1.625347, -1.157789, 0, 1, 0.07450981, 1,
-0.3411048, -0.9377856, -2.105019, 0, 1, 0.08235294, 1,
-0.3403896, 0.0315363, -1.660224, 0, 1, 0.08627451, 1,
-0.3390494, -0.5551515, -2.154707, 0, 1, 0.09411765, 1,
-0.3382495, -0.6852212, -2.242671, 0, 1, 0.1019608, 1,
-0.3372076, -0.2857538, -2.351182, 0, 1, 0.1058824, 1,
-0.3360948, -0.003017341, -1.062363, 0, 1, 0.1137255, 1,
-0.3286743, 2.785056, -0.6333833, 0, 1, 0.1176471, 1,
-0.3260179, 0.2934467, -0.2158752, 0, 1, 0.1254902, 1,
-0.3254721, 1.602294, -0.5050917, 0, 1, 0.1294118, 1,
-0.3253649, 0.2887023, -1.017765, 0, 1, 0.1372549, 1,
-0.321981, 0.5534064, -1.662395, 0, 1, 0.1411765, 1,
-0.3151472, -0.4820977, -2.27152, 0, 1, 0.1490196, 1,
-0.3144019, -0.30503, -3.752429, 0, 1, 0.1529412, 1,
-0.3106243, 0.05062366, -0.9243531, 0, 1, 0.1607843, 1,
-0.308619, -1.866794, -3.158542, 0, 1, 0.1647059, 1,
-0.3069774, 0.6444246, -0.4960223, 0, 1, 0.172549, 1,
-0.3001098, -1.137971, -4.088503, 0, 1, 0.1764706, 1,
-0.2993645, -0.9300901, -3.474068, 0, 1, 0.1843137, 1,
-0.2880871, 0.7678841, -0.546314, 0, 1, 0.1882353, 1,
-0.2852695, 0.5564085, -2.654459, 0, 1, 0.1960784, 1,
-0.2774117, 0.3742444, -1.90766, 0, 1, 0.2039216, 1,
-0.271438, -1.007208, -2.870674, 0, 1, 0.2078431, 1,
-0.2711071, -0.09963396, -3.302088, 0, 1, 0.2156863, 1,
-0.2699321, -2.366122, -2.961583, 0, 1, 0.2196078, 1,
-0.2697076, -0.1216162, -4.725354, 0, 1, 0.227451, 1,
-0.2686067, 0.320839, -0.585795, 0, 1, 0.2313726, 1,
-0.2677774, -0.5197688, -2.563116, 0, 1, 0.2392157, 1,
-0.256229, 0.1610636, -2.364185, 0, 1, 0.2431373, 1,
-0.2507385, -1.236233, -2.523862, 0, 1, 0.2509804, 1,
-0.2482774, -1.202416, -0.7297106, 0, 1, 0.254902, 1,
-0.2451709, -1.0824, -1.573183, 0, 1, 0.2627451, 1,
-0.2451257, 2.094658, -0.4479672, 0, 1, 0.2666667, 1,
-0.2446509, -1.42599, -1.905724, 0, 1, 0.2745098, 1,
-0.2433686, -1.077735, -1.011833, 0, 1, 0.2784314, 1,
-0.2417765, 0.01345795, -1.335426, 0, 1, 0.2862745, 1,
-0.2393158, 0.2770428, -1.526677, 0, 1, 0.2901961, 1,
-0.2386118, -0.2636769, -3.284409, 0, 1, 0.2980392, 1,
-0.2286906, -0.3979858, -1.63807, 0, 1, 0.3058824, 1,
-0.2271478, -1.505229, -3.26033, 0, 1, 0.3098039, 1,
-0.22278, -1.467396, -3.039298, 0, 1, 0.3176471, 1,
-0.2211764, 0.484915, -0.6405513, 0, 1, 0.3215686, 1,
-0.2194316, -1.02656, -1.946539, 0, 1, 0.3294118, 1,
-0.2169863, -0.08334254, -1.137025, 0, 1, 0.3333333, 1,
-0.2154298, -0.08771388, -2.682634, 0, 1, 0.3411765, 1,
-0.208343, 0.2418902, -1.757738, 0, 1, 0.345098, 1,
-0.2073927, 0.743077, -1.952702, 0, 1, 0.3529412, 1,
-0.2052304, 3.276743, 0.9177254, 0, 1, 0.3568628, 1,
-0.2020896, -0.1956356, -1.609116, 0, 1, 0.3647059, 1,
-0.1957347, 0.7453687, -1.54863, 0, 1, 0.3686275, 1,
-0.1931374, 0.466929, -0.4703363, 0, 1, 0.3764706, 1,
-0.1917894, -1.488004, -2.156573, 0, 1, 0.3803922, 1,
-0.1913541, -0.5784456, -1.443272, 0, 1, 0.3882353, 1,
-0.1911346, 0.5786942, -0.3271942, 0, 1, 0.3921569, 1,
-0.1909458, 0.08087052, -0.6801389, 0, 1, 0.4, 1,
-0.190452, 0.5644034, -0.08566727, 0, 1, 0.4078431, 1,
-0.1889209, 0.04109538, -1.643003, 0, 1, 0.4117647, 1,
-0.1868486, -0.8085931, -2.832972, 0, 1, 0.4196078, 1,
-0.1866381, -0.1706855, -3.494226, 0, 1, 0.4235294, 1,
-0.183377, -0.1784782, -2.810139, 0, 1, 0.4313726, 1,
-0.1796122, 0.4296053, 2.410731, 0, 1, 0.4352941, 1,
-0.1732189, -0.2249612, -2.61759, 0, 1, 0.4431373, 1,
-0.1721079, -0.5736576, -4.1401, 0, 1, 0.4470588, 1,
-0.1701031, 1.539914, -0.4405912, 0, 1, 0.454902, 1,
-0.1669296, 0.5289273, 0.2271141, 0, 1, 0.4588235, 1,
-0.1617075, 1.157877, -0.3236381, 0, 1, 0.4666667, 1,
-0.1560209, -0.5205542, -3.18155, 0, 1, 0.4705882, 1,
-0.154772, -1.402741, -4.497964, 0, 1, 0.4784314, 1,
-0.1526651, 0.2968054, -1.955244, 0, 1, 0.4823529, 1,
-0.1524681, 0.5353063, -0.3290652, 0, 1, 0.4901961, 1,
-0.1517995, -1.708378, -3.595064, 0, 1, 0.4941176, 1,
-0.1492993, -0.276523, -3.603532, 0, 1, 0.5019608, 1,
-0.1492877, -0.1096495, -3.183285, 0, 1, 0.509804, 1,
-0.1487024, -0.2464025, -3.455543, 0, 1, 0.5137255, 1,
-0.1448516, 0.139819, 1.428278, 0, 1, 0.5215687, 1,
-0.1419602, -1.018757, -4.86906, 0, 1, 0.5254902, 1,
-0.1328387, 0.3772808, -1.040719, 0, 1, 0.5333334, 1,
-0.1279354, 0.2517361, -0.4844542, 0, 1, 0.5372549, 1,
-0.1276997, 0.5564553, -0.9956107, 0, 1, 0.5450981, 1,
-0.118632, -0.4809655, -2.96468, 0, 1, 0.5490196, 1,
-0.1159128, 0.3453241, -1.277487, 0, 1, 0.5568628, 1,
-0.1139032, 0.1201083, -0.6360064, 0, 1, 0.5607843, 1,
-0.1123072, 0.4564642, -0.9595248, 0, 1, 0.5686275, 1,
-0.112244, -0.1992391, -1.939509, 0, 1, 0.572549, 1,
-0.1119015, 1.835627, -0.6648778, 0, 1, 0.5803922, 1,
-0.1104039, 0.7314893, 1.231204, 0, 1, 0.5843138, 1,
-0.1097342, -0.7064986, -1.972417, 0, 1, 0.5921569, 1,
-0.1080617, -0.1796142, -2.717507, 0, 1, 0.5960785, 1,
-0.1077183, 0.1920073, -0.15633, 0, 1, 0.6039216, 1,
-0.1026103, -0.262879, -3.338051, 0, 1, 0.6117647, 1,
-0.09748405, 1.265234, -0.3127978, 0, 1, 0.6156863, 1,
-0.09597677, 0.7698237, -0.9646035, 0, 1, 0.6235294, 1,
-0.0939599, -0.1700665, -2.623405, 0, 1, 0.627451, 1,
-0.09152859, -0.3188597, -1.377675, 0, 1, 0.6352941, 1,
-0.08910786, 1.32225, -0.4351805, 0, 1, 0.6392157, 1,
-0.08907792, -0.7965059, -2.265442, 0, 1, 0.6470588, 1,
-0.08898961, 1.263194, -1.361263, 0, 1, 0.6509804, 1,
-0.08845868, 0.376593, -1.366789, 0, 1, 0.6588235, 1,
-0.08743313, 0.6034467, 0.8265533, 0, 1, 0.6627451, 1,
-0.08414164, 0.1475228, -2.45314, 0, 1, 0.6705883, 1,
-0.08297315, -0.2636269, -1.763728, 0, 1, 0.6745098, 1,
-0.08293231, 0.8991436, 1.489192, 0, 1, 0.682353, 1,
-0.08285975, -0.6309924, -2.647781, 0, 1, 0.6862745, 1,
-0.08032462, -0.4458759, -2.961285, 0, 1, 0.6941177, 1,
-0.07793925, 0.5456339, 0.3110627, 0, 1, 0.7019608, 1,
-0.07772563, -0.234449, -2.457954, 0, 1, 0.7058824, 1,
-0.07713872, -1.02127, -3.854223, 0, 1, 0.7137255, 1,
-0.07667264, -0.623502, -1.439227, 0, 1, 0.7176471, 1,
-0.07350793, 1.008436, -0.9198173, 0, 1, 0.7254902, 1,
-0.07129607, 0.5951079, -0.5905862, 0, 1, 0.7294118, 1,
-0.07047251, -1.349333, -2.119244, 0, 1, 0.7372549, 1,
-0.06911488, 1.151855, 0.4244166, 0, 1, 0.7411765, 1,
-0.06693387, -0.6941953, -1.453453, 0, 1, 0.7490196, 1,
-0.06587726, -2.000864, -3.236369, 0, 1, 0.7529412, 1,
-0.06586618, 0.6006844, -2.007313, 0, 1, 0.7607843, 1,
-0.06577907, -1.098365, -3.55243, 0, 1, 0.7647059, 1,
-0.06512532, 0.8823621, -0.7887515, 0, 1, 0.772549, 1,
-0.06410817, 0.7714933, 0.5849339, 0, 1, 0.7764706, 1,
-0.06179514, 2.144346, -0.6598851, 0, 1, 0.7843137, 1,
-0.06146481, 0.07012083, -1.906594, 0, 1, 0.7882353, 1,
-0.05970088, 0.8343225, 0.01449773, 0, 1, 0.7960784, 1,
-0.05266607, 1.289147, 0.5467666, 0, 1, 0.8039216, 1,
-0.05103594, -0.5967548, -3.141674, 0, 1, 0.8078431, 1,
-0.04807411, 2.08475, -0.9288269, 0, 1, 0.8156863, 1,
-0.04242387, 0.2302032, 0.5303044, 0, 1, 0.8196079, 1,
-0.03616939, 1.307692, -1.041816, 0, 1, 0.827451, 1,
-0.03558363, 1.458942, -0.2194705, 0, 1, 0.8313726, 1,
-0.03310187, -0.1822383, -2.812427, 0, 1, 0.8392157, 1,
-0.03155202, -0.599232, -3.671882, 0, 1, 0.8431373, 1,
-0.03065763, 0.3733951, -1.354023, 0, 1, 0.8509804, 1,
-0.02570729, -0.1562886, -2.900571, 0, 1, 0.854902, 1,
-0.02220965, -1.799649, -3.480663, 0, 1, 0.8627451, 1,
-0.02164611, 0.454846, -0.3256308, 0, 1, 0.8666667, 1,
-0.01960381, 0.2145286, 0.3682113, 0, 1, 0.8745098, 1,
-0.01538616, 0.3771016, 0.1041366, 0, 1, 0.8784314, 1,
-0.01494244, 1.127887, 0.1978816, 0, 1, 0.8862745, 1,
-0.01360075, -0.4565416, -4.051745, 0, 1, 0.8901961, 1,
-0.01224705, 0.07212688, -0.2722941, 0, 1, 0.8980392, 1,
-0.0115226, -1.960629, -3.32295, 0, 1, 0.9058824, 1,
-0.01107626, -0.1438014, -1.358506, 0, 1, 0.9098039, 1,
-0.01030915, -1.413044, -5.68609, 0, 1, 0.9176471, 1,
-0.008817215, -1.680228, -4.400462, 0, 1, 0.9215686, 1,
-0.008620001, 0.6689664, -0.6523046, 0, 1, 0.9294118, 1,
-0.007834228, -0.06349085, -2.914508, 0, 1, 0.9333333, 1,
-0.003985029, -0.3768231, -4.144464, 0, 1, 0.9411765, 1,
-0.003017254, 0.5718171, 2.473794, 0, 1, 0.945098, 1,
-0.00260754, -0.3051291, -2.678532, 0, 1, 0.9529412, 1,
-0.001639007, 0.5738721, -0.5951402, 0, 1, 0.9568627, 1,
0.0001664052, 0.2739373, 1.32755, 0, 1, 0.9647059, 1,
0.001759791, -1.308824, 4.320472, 0, 1, 0.9686275, 1,
0.003157568, -0.4092052, 3.611432, 0, 1, 0.9764706, 1,
0.003796469, 1.277607, 0.9313059, 0, 1, 0.9803922, 1,
0.00392715, 0.329152, -0.2745207, 0, 1, 0.9882353, 1,
0.01300001, -2.019428, 1.734371, 0, 1, 0.9921569, 1,
0.0145771, -2.268888, 1.64902, 0, 1, 1, 1,
0.01573785, -0.3300129, 3.874279, 0, 0.9921569, 1, 1,
0.01811762, -1.888351, 2.745691, 0, 0.9882353, 1, 1,
0.01987482, -1.662997, 2.3513, 0, 0.9803922, 1, 1,
0.02074675, 0.3788865, 0.006935371, 0, 0.9764706, 1, 1,
0.02100627, -0.06903443, 3.606176, 0, 0.9686275, 1, 1,
0.02443332, 0.4259046, 0.5613171, 0, 0.9647059, 1, 1,
0.02752033, 0.222316, -0.2670977, 0, 0.9568627, 1, 1,
0.03724124, -0.1413501, 1.853164, 0, 0.9529412, 1, 1,
0.03790287, -0.536829, 2.644565, 0, 0.945098, 1, 1,
0.03999485, 1.733501, -1.258454, 0, 0.9411765, 1, 1,
0.04361198, 1.572458, -0.8265061, 0, 0.9333333, 1, 1,
0.04425139, 0.7433648, 0.6854085, 0, 0.9294118, 1, 1,
0.04552281, 0.8876826, 0.2648554, 0, 0.9215686, 1, 1,
0.06085604, -1.672175, 4.741065, 0, 0.9176471, 1, 1,
0.06117108, -0.2800193, 3.867038, 0, 0.9098039, 1, 1,
0.06225287, 0.1792987, -1.192259, 0, 0.9058824, 1, 1,
0.06489388, -0.8250822, 3.039697, 0, 0.8980392, 1, 1,
0.06622284, -0.8206965, 1.826864, 0, 0.8901961, 1, 1,
0.06681556, 0.6679966, 0.38054, 0, 0.8862745, 1, 1,
0.06704018, -1.2464, 2.321281, 0, 0.8784314, 1, 1,
0.0686003, 0.06741578, 1.513694, 0, 0.8745098, 1, 1,
0.06890627, -1.487234, 3.389518, 0, 0.8666667, 1, 1,
0.07107995, 0.2803399, -0.855127, 0, 0.8627451, 1, 1,
0.07352422, 0.2827166, 0.4959362, 0, 0.854902, 1, 1,
0.07764514, 0.6195789, 0.4751116, 0, 0.8509804, 1, 1,
0.08211875, -1.290117, 2.770089, 0, 0.8431373, 1, 1,
0.0827915, 0.5551383, 1.189056, 0, 0.8392157, 1, 1,
0.08782388, -0.05240647, 3.178461, 0, 0.8313726, 1, 1,
0.08876987, -0.6210286, 3.156274, 0, 0.827451, 1, 1,
0.08975665, -2.231507, 2.365489, 0, 0.8196079, 1, 1,
0.09368604, 0.6862645, 2.00387, 0, 0.8156863, 1, 1,
0.0979766, -0.3618791, 0.3353272, 0, 0.8078431, 1, 1,
0.09929362, 1.310819, 0.5942026, 0, 0.8039216, 1, 1,
0.09944674, -0.09266705, 1.098948, 0, 0.7960784, 1, 1,
0.102147, -0.2490982, 1.729412, 0, 0.7882353, 1, 1,
0.1030496, 0.4846429, 0.2167311, 0, 0.7843137, 1, 1,
0.1064425, 1.694742, 0.7763061, 0, 0.7764706, 1, 1,
0.1083274, -1.33752, 1.282056, 0, 0.772549, 1, 1,
0.1105278, -1.67109, 2.123846, 0, 0.7647059, 1, 1,
0.1141916, -0.7597416, 2.961837, 0, 0.7607843, 1, 1,
0.1142634, 0.2666767, -0.1082927, 0, 0.7529412, 1, 1,
0.116211, -1.378715, 4.191401, 0, 0.7490196, 1, 1,
0.1168056, 0.9150888, -0.8572683, 0, 0.7411765, 1, 1,
0.1284175, 0.5601524, -1.507901, 0, 0.7372549, 1, 1,
0.1294753, -0.1202916, 3.689815, 0, 0.7294118, 1, 1,
0.1313915, 0.3110983, 0.6457687, 0, 0.7254902, 1, 1,
0.1331965, 0.7276612, 0.8832266, 0, 0.7176471, 1, 1,
0.1356502, 0.4389683, 0.6379684, 0, 0.7137255, 1, 1,
0.1363406, -1.597189, 1.487697, 0, 0.7058824, 1, 1,
0.1383324, -0.7594765, 3.848356, 0, 0.6980392, 1, 1,
0.1398563, -0.9300065, 4.417109, 0, 0.6941177, 1, 1,
0.1427708, -1.564949, 3.15174, 0, 0.6862745, 1, 1,
0.1461003, 0.7060158, 1.360387, 0, 0.682353, 1, 1,
0.1510597, -0.7620891, 1.148088, 0, 0.6745098, 1, 1,
0.1517395, -0.8387008, 2.52314, 0, 0.6705883, 1, 1,
0.155185, -0.362851, 2.366133, 0, 0.6627451, 1, 1,
0.1578028, 0.2513785, 0.7448196, 0, 0.6588235, 1, 1,
0.1634173, 0.6667036, 0.4063083, 0, 0.6509804, 1, 1,
0.1651672, -1.178782, 4.794597, 0, 0.6470588, 1, 1,
0.1774508, 0.4754006, -0.06879372, 0, 0.6392157, 1, 1,
0.1777747, 0.9918531, 0.103364, 0, 0.6352941, 1, 1,
0.1803215, 0.6592594, 0.7542369, 0, 0.627451, 1, 1,
0.1814307, 0.141751, 0.08726416, 0, 0.6235294, 1, 1,
0.1887946, -0.4061885, 2.391968, 0, 0.6156863, 1, 1,
0.1902418, -0.9595686, 3.387426, 0, 0.6117647, 1, 1,
0.1914746, -1.624197, 2.672767, 0, 0.6039216, 1, 1,
0.193377, -1.398506, 3.072358, 0, 0.5960785, 1, 1,
0.1941876, -0.3183843, 4.018203, 0, 0.5921569, 1, 1,
0.1975204, 0.05883377, 2.907392, 0, 0.5843138, 1, 1,
0.1977491, 0.4269753, 1.180725, 0, 0.5803922, 1, 1,
0.2017266, 0.3494453, 1.147675, 0, 0.572549, 1, 1,
0.2078136, -0.1273237, 1.067459, 0, 0.5686275, 1, 1,
0.2080611, 0.3283127, -0.2584712, 0, 0.5607843, 1, 1,
0.2125204, -0.4338291, 3.265373, 0, 0.5568628, 1, 1,
0.2169242, 1.105894, -1.241292, 0, 0.5490196, 1, 1,
0.2169606, 1.114434, 1.209632, 0, 0.5450981, 1, 1,
0.2181429, -0.9216523, 4.311318, 0, 0.5372549, 1, 1,
0.2188349, 0.03151551, 1.729311, 0, 0.5333334, 1, 1,
0.2216241, 0.1114294, 0.9152957, 0, 0.5254902, 1, 1,
0.2231839, 0.1716819, 3.748305, 0, 0.5215687, 1, 1,
0.2264413, -0.4755289, 2.459659, 0, 0.5137255, 1, 1,
0.2298196, 0.7459769, 1.317945, 0, 0.509804, 1, 1,
0.2304069, -1.315781, 2.353931, 0, 0.5019608, 1, 1,
0.2328463, -0.9131924, 3.284528, 0, 0.4941176, 1, 1,
0.2345039, -0.1743539, 2.186185, 0, 0.4901961, 1, 1,
0.2370607, 1.04437, -0.5154662, 0, 0.4823529, 1, 1,
0.2386233, 0.6513242, 0.01386295, 0, 0.4784314, 1, 1,
0.2461049, -1.01371, 2.333872, 0, 0.4705882, 1, 1,
0.2496239, -0.2278101, 2.407246, 0, 0.4666667, 1, 1,
0.2536053, 1.123266, -0.1113209, 0, 0.4588235, 1, 1,
0.2550407, 0.2369941, 1.411965, 0, 0.454902, 1, 1,
0.2667476, -1.406593, 3.463703, 0, 0.4470588, 1, 1,
0.2681392, 0.1641248, -0.1994183, 0, 0.4431373, 1, 1,
0.2708261, 1.373679, -0.7292818, 0, 0.4352941, 1, 1,
0.273794, 2.526624, 0.8124881, 0, 0.4313726, 1, 1,
0.2759409, 0.4715101, 1.459139, 0, 0.4235294, 1, 1,
0.2764727, 0.3394765, 0.9474556, 0, 0.4196078, 1, 1,
0.277487, 0.04071092, 0.9812427, 0, 0.4117647, 1, 1,
0.2777066, 0.7865729, -0.8497717, 0, 0.4078431, 1, 1,
0.2804988, -0.05116795, 0.7767089, 0, 0.4, 1, 1,
0.2820454, 0.3456087, 0.691753, 0, 0.3921569, 1, 1,
0.2904591, -0.6826377, 3.859984, 0, 0.3882353, 1, 1,
0.2907614, -0.1477069, 3.093692, 0, 0.3803922, 1, 1,
0.296021, 0.5976062, 0.3351313, 0, 0.3764706, 1, 1,
0.2978062, 0.3702145, 0.1382129, 0, 0.3686275, 1, 1,
0.3066148, -2.071675, 2.31183, 0, 0.3647059, 1, 1,
0.3068379, -0.5795084, 4.182786, 0, 0.3568628, 1, 1,
0.3079372, 1.419492, -1.189634, 0, 0.3529412, 1, 1,
0.3080201, -0.08762869, 2.980888, 0, 0.345098, 1, 1,
0.3094925, -0.4016028, 3.213535, 0, 0.3411765, 1, 1,
0.3121199, 1.432407, -0.2554435, 0, 0.3333333, 1, 1,
0.3136049, 0.8509404, 0.8357643, 0, 0.3294118, 1, 1,
0.3154222, 0.05924315, 0.4281159, 0, 0.3215686, 1, 1,
0.31888, 0.7263302, -0.4615403, 0, 0.3176471, 1, 1,
0.3191835, -1.257547, 4.130328, 0, 0.3098039, 1, 1,
0.3201916, -0.316655, 2.393577, 0, 0.3058824, 1, 1,
0.3281865, -0.4989172, 3.176579, 0, 0.2980392, 1, 1,
0.3320167, -0.0089519, -0.3031055, 0, 0.2901961, 1, 1,
0.3323212, -1.034396, 3.071131, 0, 0.2862745, 1, 1,
0.3327134, -0.7876666, 2.26988, 0, 0.2784314, 1, 1,
0.3342773, -2.563745, 4.35971, 0, 0.2745098, 1, 1,
0.3343956, -1.783906, 4.09452, 0, 0.2666667, 1, 1,
0.3370401, 0.377943, 2.645994, 0, 0.2627451, 1, 1,
0.3397522, 0.8023118, 1.355152, 0, 0.254902, 1, 1,
0.3475815, 0.2695223, 1.232755, 0, 0.2509804, 1, 1,
0.3478552, 0.8131346, -1.276842, 0, 0.2431373, 1, 1,
0.3480958, -0.2771688, 1.787878, 0, 0.2392157, 1, 1,
0.3489999, 0.1133413, 0.3227607, 0, 0.2313726, 1, 1,
0.3495773, 1.950546, -0.05691987, 0, 0.227451, 1, 1,
0.3541456, 0.1997441, 1.229397, 0, 0.2196078, 1, 1,
0.3559874, -0.2358647, 3.286698, 0, 0.2156863, 1, 1,
0.3582008, 1.514526, -2.268988, 0, 0.2078431, 1, 1,
0.3598197, -0.2905179, 3.226761, 0, 0.2039216, 1, 1,
0.3603652, -0.1334696, 1.787462, 0, 0.1960784, 1, 1,
0.3609673, -0.8171133, 5.438628, 0, 0.1882353, 1, 1,
0.361849, -0.1323829, 2.754267, 0, 0.1843137, 1, 1,
0.3641949, 0.5534005, 0.1662606, 0, 0.1764706, 1, 1,
0.3646055, 1.379179, -0.5164945, 0, 0.172549, 1, 1,
0.3664374, -1.192518, 3.968251, 0, 0.1647059, 1, 1,
0.3790539, -0.1396238, 0.6569474, 0, 0.1607843, 1, 1,
0.3846898, -1.985746, 1.408512, 0, 0.1529412, 1, 1,
0.3895731, 0.4230904, 0.2284137, 0, 0.1490196, 1, 1,
0.3899409, 0.3951749, 0.7592744, 0, 0.1411765, 1, 1,
0.3911971, -1.558419, 4.562967, 0, 0.1372549, 1, 1,
0.3952048, -0.4963781, 2.090386, 0, 0.1294118, 1, 1,
0.3953531, 0.905609, 1.218935, 0, 0.1254902, 1, 1,
0.4012775, -1.471874, 3.296032, 0, 0.1176471, 1, 1,
0.4039545, -0.6190114, 2.458758, 0, 0.1137255, 1, 1,
0.4050283, 0.4203245, 1.591813, 0, 0.1058824, 1, 1,
0.4060424, -1.638623, 2.238252, 0, 0.09803922, 1, 1,
0.4083122, 0.1664562, 2.950107, 0, 0.09411765, 1, 1,
0.4087428, -1.090915, 2.151536, 0, 0.08627451, 1, 1,
0.4103451, 0.1692333, 0.7680651, 0, 0.08235294, 1, 1,
0.4162984, -1.453964, 2.54592, 0, 0.07450981, 1, 1,
0.4189863, -0.2910184, 1.511173, 0, 0.07058824, 1, 1,
0.4245283, -0.04405253, 1.305972, 0, 0.0627451, 1, 1,
0.4279879, -1.520174, 2.986023, 0, 0.05882353, 1, 1,
0.433301, -0.7910915, 2.569821, 0, 0.05098039, 1, 1,
0.4347569, 2.821245, 0.02071963, 0, 0.04705882, 1, 1,
0.4386232, -0.8206293, 1.810803, 0, 0.03921569, 1, 1,
0.4424204, -3.074267, 2.286349, 0, 0.03529412, 1, 1,
0.4432288, -0.3713955, 2.756142, 0, 0.02745098, 1, 1,
0.4479388, 0.9104293, 0.9329544, 0, 0.02352941, 1, 1,
0.4488395, 0.9388676, -0.9832639, 0, 0.01568628, 1, 1,
0.4531795, -0.4433391, 3.326869, 0, 0.01176471, 1, 1,
0.4564181, -0.4897891, 2.426837, 0, 0.003921569, 1, 1,
0.4590154, -0.9131389, 2.544592, 0.003921569, 0, 1, 1,
0.4693946, 0.1647626, 1.358568, 0.007843138, 0, 1, 1,
0.4699061, 2.148946, 0.3680459, 0.01568628, 0, 1, 1,
0.4718686, 0.2075492, 1.707404, 0.01960784, 0, 1, 1,
0.4728592, 1.204781, -1.078157, 0.02745098, 0, 1, 1,
0.4729311, -1.310375, 2.45516, 0.03137255, 0, 1, 1,
0.4730068, 0.5792084, 1.143355, 0.03921569, 0, 1, 1,
0.4738902, 0.5108439, 3.771549, 0.04313726, 0, 1, 1,
0.4774192, 0.6049173, -0.1358907, 0.05098039, 0, 1, 1,
0.4804216, 1.887095, 0.1783282, 0.05490196, 0, 1, 1,
0.4808355, -0.2016361, 0.8051498, 0.0627451, 0, 1, 1,
0.4869116, -0.6455393, 1.783993, 0.06666667, 0, 1, 1,
0.487094, 2.236311, 0.6567006, 0.07450981, 0, 1, 1,
0.4871095, 0.9066544, -1.048732, 0.07843138, 0, 1, 1,
0.4880344, 0.4617219, -0.6312022, 0.08627451, 0, 1, 1,
0.4883286, -0.03811261, 0.4246235, 0.09019608, 0, 1, 1,
0.4894254, -0.0215863, 2.14099, 0.09803922, 0, 1, 1,
0.5016974, 0.1864284, 2.972363, 0.1058824, 0, 1, 1,
0.502658, 0.3709675, 1.040481, 0.1098039, 0, 1, 1,
0.5038686, 0.5923597, 0.05107684, 0.1176471, 0, 1, 1,
0.5045525, 0.6650473, 0.3986784, 0.1215686, 0, 1, 1,
0.5050362, -1.387788, 1.591758, 0.1294118, 0, 1, 1,
0.5063248, -0.1756374, 1.994924, 0.1333333, 0, 1, 1,
0.5090814, 0.5548988, 1.225765, 0.1411765, 0, 1, 1,
0.5211612, 0.8791708, -0.3569811, 0.145098, 0, 1, 1,
0.5276797, 2.609004, 0.1632904, 0.1529412, 0, 1, 1,
0.5285925, -0.7346342, 2.656067, 0.1568628, 0, 1, 1,
0.5351349, 0.06820685, 2.896228, 0.1647059, 0, 1, 1,
0.5380774, 1.355145, 0.1699238, 0.1686275, 0, 1, 1,
0.5389783, -0.5527215, 2.200612, 0.1764706, 0, 1, 1,
0.5419725, 0.5422333, 0.9539585, 0.1803922, 0, 1, 1,
0.5431097, 0.5029328, 0.943633, 0.1882353, 0, 1, 1,
0.5461769, 1.209307, -0.2136798, 0.1921569, 0, 1, 1,
0.5474555, -0.2848625, 1.958014, 0.2, 0, 1, 1,
0.5507929, -1.641775, 2.646408, 0.2078431, 0, 1, 1,
0.551432, 0.0381084, 0.4316371, 0.2117647, 0, 1, 1,
0.5525829, 0.9003888, 0.4389029, 0.2196078, 0, 1, 1,
0.5539028, 1.427541, 0.9340478, 0.2235294, 0, 1, 1,
0.5547531, 0.4257757, 1.546195, 0.2313726, 0, 1, 1,
0.5557441, -0.1441348, 2.370549, 0.2352941, 0, 1, 1,
0.5574983, -0.3263643, 2.925147, 0.2431373, 0, 1, 1,
0.5678359, -1.305389, 1.904297, 0.2470588, 0, 1, 1,
0.569401, 0.1695781, -0.3061384, 0.254902, 0, 1, 1,
0.572941, -0.1354074, 2.405481, 0.2588235, 0, 1, 1,
0.5775256, 0.4164425, 0.985016, 0.2666667, 0, 1, 1,
0.5783752, 0.3711793, 1.842795, 0.2705882, 0, 1, 1,
0.5816618, -0.3845565, 2.934274, 0.2784314, 0, 1, 1,
0.5845925, 2.156005, -0.2614256, 0.282353, 0, 1, 1,
0.5864162, -0.7422748, 1.1652, 0.2901961, 0, 1, 1,
0.5882728, 0.237635, -1.076099, 0.2941177, 0, 1, 1,
0.5906506, 0.1924674, -0.9945123, 0.3019608, 0, 1, 1,
0.5924921, 0.5211172, 1.240029, 0.3098039, 0, 1, 1,
0.5939489, 0.9537365, -0.3447868, 0.3137255, 0, 1, 1,
0.5956818, 1.070902, 1.20134, 0.3215686, 0, 1, 1,
0.5966893, 0.7737993, 1.02459, 0.3254902, 0, 1, 1,
0.5982848, -0.3514052, 1.635932, 0.3333333, 0, 1, 1,
0.5984098, -0.6560893, 1.172293, 0.3372549, 0, 1, 1,
0.6005783, -0.9753049, 1.609447, 0.345098, 0, 1, 1,
0.6016678, -1.025928, 1.427084, 0.3490196, 0, 1, 1,
0.6023819, 0.04874164, 0.03420777, 0.3568628, 0, 1, 1,
0.6030953, 0.6772121, -1.249994, 0.3607843, 0, 1, 1,
0.6112867, 0.8361508, -0.2077346, 0.3686275, 0, 1, 1,
0.6201187, -1.060053, 2.530066, 0.372549, 0, 1, 1,
0.6238872, 0.9963575, 0.7411115, 0.3803922, 0, 1, 1,
0.6268767, -1.243404, 3.983745, 0.3843137, 0, 1, 1,
0.6319005, -0.381959, 1.511946, 0.3921569, 0, 1, 1,
0.6324378, 0.4942111, 0.401605, 0.3960784, 0, 1, 1,
0.6372041, 0.7293646, 0.2663981, 0.4039216, 0, 1, 1,
0.6398323, 0.5694416, 1.18412, 0.4117647, 0, 1, 1,
0.6413546, 0.09096903, 1.03852, 0.4156863, 0, 1, 1,
0.6417897, -1.72883, 1.275021, 0.4235294, 0, 1, 1,
0.6473687, -0.1417499, 1.577635, 0.427451, 0, 1, 1,
0.6501706, 1.610737, 0.9496047, 0.4352941, 0, 1, 1,
0.6509707, 0.4570608, 0.9151721, 0.4392157, 0, 1, 1,
0.6527325, -0.5971349, 3.783995, 0.4470588, 0, 1, 1,
0.6531477, 0.7035735, 0.06005105, 0.4509804, 0, 1, 1,
0.6560144, -0.2317408, 0.9418779, 0.4588235, 0, 1, 1,
0.663742, -1.009985, 0.3188441, 0.4627451, 0, 1, 1,
0.6638857, 1.135123, -1.065594, 0.4705882, 0, 1, 1,
0.6680279, -0.02272909, 0.929571, 0.4745098, 0, 1, 1,
0.6717134, 0.7265465, 1.298266, 0.4823529, 0, 1, 1,
0.6753386, 0.6623532, 0.8920239, 0.4862745, 0, 1, 1,
0.6791922, 0.2678239, 0.8085872, 0.4941176, 0, 1, 1,
0.6847838, 0.1064052, 1.613764, 0.5019608, 0, 1, 1,
0.6856577, -1.489849, 2.352046, 0.5058824, 0, 1, 1,
0.6875508, -0.1752078, 2.684217, 0.5137255, 0, 1, 1,
0.6911526, 1.270501, -0.9247357, 0.5176471, 0, 1, 1,
0.6960301, 1.633341, 1.316388, 0.5254902, 0, 1, 1,
0.6968781, -1.172702, 2.753972, 0.5294118, 0, 1, 1,
0.6982893, -0.08336672, 1.088324, 0.5372549, 0, 1, 1,
0.7023115, -1.774672, 3.533743, 0.5411765, 0, 1, 1,
0.7069962, -1.410767, 3.516022, 0.5490196, 0, 1, 1,
0.7075365, -1.28578, 3.16511, 0.5529412, 0, 1, 1,
0.716433, 0.637248, 1.253939, 0.5607843, 0, 1, 1,
0.7165063, 0.5062146, 2.128429, 0.5647059, 0, 1, 1,
0.7181883, -0.6408668, 2.688184, 0.572549, 0, 1, 1,
0.720359, 2.032971, 1.587254, 0.5764706, 0, 1, 1,
0.7208838, -0.6827292, 1.452827, 0.5843138, 0, 1, 1,
0.7215526, -0.3743229, 1.948761, 0.5882353, 0, 1, 1,
0.7239394, -0.6264021, 2.732328, 0.5960785, 0, 1, 1,
0.7262204, 1.479166, 1.333803, 0.6039216, 0, 1, 1,
0.7321661, 0.2375563, 0.7022108, 0.6078432, 0, 1, 1,
0.7326061, 1.462428, 0.5130935, 0.6156863, 0, 1, 1,
0.7441712, 0.7543536, 0.4469134, 0.6196079, 0, 1, 1,
0.7451763, -1.805636, 1.385753, 0.627451, 0, 1, 1,
0.7501948, -0.824868, 1.381715, 0.6313726, 0, 1, 1,
0.7535321, -1.314362, 1.78984, 0.6392157, 0, 1, 1,
0.7553709, -0.7254058, 2.086562, 0.6431373, 0, 1, 1,
0.7640968, -0.7684779, 3.051962, 0.6509804, 0, 1, 1,
0.7689192, 0.5788133, 1.383356, 0.654902, 0, 1, 1,
0.7786953, 0.03782229, 2.051228, 0.6627451, 0, 1, 1,
0.7844853, 0.5953178, 0.4947515, 0.6666667, 0, 1, 1,
0.7908833, -0.302875, 0.8502052, 0.6745098, 0, 1, 1,
0.7932716, -0.9029592, 3.248186, 0.6784314, 0, 1, 1,
0.7943214, -1.414984, 0.3519374, 0.6862745, 0, 1, 1,
0.7981556, -1.189862, 1.866634, 0.6901961, 0, 1, 1,
0.8002665, 0.02942372, 0.6929165, 0.6980392, 0, 1, 1,
0.8030313, 0.5036939, 1.744356, 0.7058824, 0, 1, 1,
0.8052324, 0.02888788, 2.573513, 0.7098039, 0, 1, 1,
0.8120718, 0.4467029, 1.26828, 0.7176471, 0, 1, 1,
0.8169526, -2.654048, 3.914829, 0.7215686, 0, 1, 1,
0.8177519, 0.4232306, 1.392097, 0.7294118, 0, 1, 1,
0.8182759, -1.583003, 2.06502, 0.7333333, 0, 1, 1,
0.8189069, -0.2859015, 2.110561, 0.7411765, 0, 1, 1,
0.8223211, 0.2015504, 1.892963, 0.7450981, 0, 1, 1,
0.824072, -0.0163666, 1.277366, 0.7529412, 0, 1, 1,
0.8263501, -0.2560069, 1.405328, 0.7568628, 0, 1, 1,
0.8352485, -0.4686846, 3.081579, 0.7647059, 0, 1, 1,
0.8354957, 0.8408698, 3.330884, 0.7686275, 0, 1, 1,
0.8383908, -0.1313443, 1.695304, 0.7764706, 0, 1, 1,
0.8384283, -0.1600174, 0.0238377, 0.7803922, 0, 1, 1,
0.8430277, 1.473676, -0.3005587, 0.7882353, 0, 1, 1,
0.845769, 0.3221365, 1.168574, 0.7921569, 0, 1, 1,
0.8458557, -1.300648, 2.019212, 0.8, 0, 1, 1,
0.8465222, -1.350353, 3.377469, 0.8078431, 0, 1, 1,
0.8478917, -0.904897, 1.283455, 0.8117647, 0, 1, 1,
0.8505118, -0.7166269, 2.945367, 0.8196079, 0, 1, 1,
0.8527563, 0.8770425, 1.025655, 0.8235294, 0, 1, 1,
0.8582538, 1.914026, 0.2965377, 0.8313726, 0, 1, 1,
0.859453, -1.374703, 1.474295, 0.8352941, 0, 1, 1,
0.8605859, -0.0245769, 1.123419, 0.8431373, 0, 1, 1,
0.8741112, -2.660961, 2.139699, 0.8470588, 0, 1, 1,
0.8791828, 0.5090486, 1.891043, 0.854902, 0, 1, 1,
0.8803302, -0.4708209, 0.5759943, 0.8588235, 0, 1, 1,
0.8838684, 0.8309703, 1.640216, 0.8666667, 0, 1, 1,
0.885737, 0.1082102, 1.438852, 0.8705882, 0, 1, 1,
0.8882354, 0.7660146, 1.001695, 0.8784314, 0, 1, 1,
0.8921236, -2.166753, 0.6192012, 0.8823529, 0, 1, 1,
0.8934466, 0.1326613, 1.770429, 0.8901961, 0, 1, 1,
0.894738, 0.7950193, 0.6009693, 0.8941177, 0, 1, 1,
0.8982955, -0.7218058, 0.7918389, 0.9019608, 0, 1, 1,
0.9003062, 1.75221, 1.866076, 0.9098039, 0, 1, 1,
0.9018667, -0.6331162, 1.943636, 0.9137255, 0, 1, 1,
0.9019859, 1.362299, 2.125707, 0.9215686, 0, 1, 1,
0.9093969, 0.7759824, 1.18709, 0.9254902, 0, 1, 1,
0.9110153, -1.852846, 2.496441, 0.9333333, 0, 1, 1,
0.9158486, 0.4689009, 0.4646668, 0.9372549, 0, 1, 1,
0.924249, -1.32463, 2.606185, 0.945098, 0, 1, 1,
0.9273837, -0.277702, 3.252613, 0.9490196, 0, 1, 1,
0.9301503, 0.4112393, 1.796756, 0.9568627, 0, 1, 1,
0.9302376, 1.194335, 0.8937046, 0.9607843, 0, 1, 1,
0.9353716, 0.4778781, 1.767957, 0.9686275, 0, 1, 1,
0.9384443, -0.1999144, 1.65264, 0.972549, 0, 1, 1,
0.9387191, -0.2487662, 2.57707, 0.9803922, 0, 1, 1,
0.9462265, -0.8121447, 2.244304, 0.9843137, 0, 1, 1,
0.9519756, -1.336516, 1.611822, 0.9921569, 0, 1, 1,
0.9595698, 0.7247663, 0.07344002, 0.9960784, 0, 1, 1,
0.9605328, -0.4263761, 2.731146, 1, 0, 0.9960784, 1,
0.9680193, 0.373562, 1.032723, 1, 0, 0.9882353, 1,
0.9709303, -1.060175, 0.115745, 1, 0, 0.9843137, 1,
0.9726576, -1.026374, 3.879529, 1, 0, 0.9764706, 1,
0.9788963, 0.2565211, 2.02413, 1, 0, 0.972549, 1,
0.9887841, -1.138268, 2.486303, 1, 0, 0.9647059, 1,
0.9918793, -0.3690481, 1.39804, 1, 0, 0.9607843, 1,
0.9981501, 0.2823004, -1.281723, 1, 0, 0.9529412, 1,
0.9989285, 0.02830384, 1.351885, 1, 0, 0.9490196, 1,
1.00728, 1.068316, -0.2755396, 1, 0, 0.9411765, 1,
1.010159, 0.2627047, 0.5851777, 1, 0, 0.9372549, 1,
1.016082, -0.6834084, 2.843435, 1, 0, 0.9294118, 1,
1.019043, -1.003608, 3.6359, 1, 0, 0.9254902, 1,
1.02197, -0.008910743, 1.34765, 1, 0, 0.9176471, 1,
1.024113, 1.485039, 1.809005, 1, 0, 0.9137255, 1,
1.024805, -0.7224741, 1.892529, 1, 0, 0.9058824, 1,
1.030937, -1.544012, 4.48082, 1, 0, 0.9019608, 1,
1.031041, -0.5661498, 2.111568, 1, 0, 0.8941177, 1,
1.035742, 0.238503, 1.704893, 1, 0, 0.8862745, 1,
1.039192, 0.9865242, -0.1932391, 1, 0, 0.8823529, 1,
1.040512, -1.577891, 3.583157, 1, 0, 0.8745098, 1,
1.043045, -1.87183, 3.279509, 1, 0, 0.8705882, 1,
1.043379, -1.329326, 0.4080355, 1, 0, 0.8627451, 1,
1.046006, 0.8443284, 0.06158158, 1, 0, 0.8588235, 1,
1.05343, -0.2526379, 2.536896, 1, 0, 0.8509804, 1,
1.061495, 0.1758296, 1.158916, 1, 0, 0.8470588, 1,
1.068401, -0.007473341, 0.2205591, 1, 0, 0.8392157, 1,
1.069259, 0.942896, 1.084566, 1, 0, 0.8352941, 1,
1.073349, 1.501729, 1.478235, 1, 0, 0.827451, 1,
1.08479, 1.127511, 0.2902839, 1, 0, 0.8235294, 1,
1.089574, 1.652104, 2.344998, 1, 0, 0.8156863, 1,
1.090133, -1.854324, 2.036544, 1, 0, 0.8117647, 1,
1.09108, -0.6584449, 1.789469, 1, 0, 0.8039216, 1,
1.092618, 1.045964, -0.4984594, 1, 0, 0.7960784, 1,
1.095228, 0.9293616, 2.116337, 1, 0, 0.7921569, 1,
1.095646, 2.231062, 1.011854, 1, 0, 0.7843137, 1,
1.100716, 1.256383, -0.1719285, 1, 0, 0.7803922, 1,
1.10654, 2.522925, 1.724959, 1, 0, 0.772549, 1,
1.107736, -1.257848, 1.800008, 1, 0, 0.7686275, 1,
1.113644, 0.8629885, -2.0328, 1, 0, 0.7607843, 1,
1.115549, 0.4979425, 2.530435, 1, 0, 0.7568628, 1,
1.126798, 1.246534, 1.670513, 1, 0, 0.7490196, 1,
1.135381, -0.6564155, 1.606405, 1, 0, 0.7450981, 1,
1.139584, -0.1579442, 3.975853, 1, 0, 0.7372549, 1,
1.148085, -0.3538527, 0.9357553, 1, 0, 0.7333333, 1,
1.159402, 1.679629, 1.140302, 1, 0, 0.7254902, 1,
1.160211, 1.550971, 0.3106323, 1, 0, 0.7215686, 1,
1.163721, -2.738878, 4.104495, 1, 0, 0.7137255, 1,
1.163803, -1.698016, 1.322473, 1, 0, 0.7098039, 1,
1.169886, 0.5471454, 0.6451196, 1, 0, 0.7019608, 1,
1.172188, 0.897847, 0.7708614, 1, 0, 0.6941177, 1,
1.173024, -1.198251, 1.827216, 1, 0, 0.6901961, 1,
1.177402, 0.9662675, 0.4313511, 1, 0, 0.682353, 1,
1.180669, 1.081716, 1.261078, 1, 0, 0.6784314, 1,
1.184446, -0.208476, 3.256269, 1, 0, 0.6705883, 1,
1.189492, 0.2878291, 2.95004, 1, 0, 0.6666667, 1,
1.191886, -0.4772208, 2.208299, 1, 0, 0.6588235, 1,
1.192749, 0.5139269, 0.8424428, 1, 0, 0.654902, 1,
1.19316, -0.7418977, 1.108698, 1, 0, 0.6470588, 1,
1.195384, 0.5940214, 0.444966, 1, 0, 0.6431373, 1,
1.208765, 0.1006454, 0.5837731, 1, 0, 0.6352941, 1,
1.215914, 0.06950366, 1.628112, 1, 0, 0.6313726, 1,
1.218367, 0.6747618, 3.259519, 1, 0, 0.6235294, 1,
1.218923, -1.124021, 1.963464, 1, 0, 0.6196079, 1,
1.226777, -1.522243, 3.337151, 1, 0, 0.6117647, 1,
1.234443, 0.06326961, 1.946112, 1, 0, 0.6078432, 1,
1.240837, -0.3904583, 2.490483, 1, 0, 0.6, 1,
1.246729, 0.2519089, 0.7244781, 1, 0, 0.5921569, 1,
1.248897, 1.767494, 0.9140789, 1, 0, 0.5882353, 1,
1.271757, 0.1542802, 3.59498, 1, 0, 0.5803922, 1,
1.276733, -0.2582143, 1.825856, 1, 0, 0.5764706, 1,
1.276794, -0.4266236, 1.566675, 1, 0, 0.5686275, 1,
1.28488, -1.589329, 2.740593, 1, 0, 0.5647059, 1,
1.287832, 1.291142, 1.274822, 1, 0, 0.5568628, 1,
1.289891, -0.2942728, 2.087516, 1, 0, 0.5529412, 1,
1.289996, 0.3348193, 3.27062, 1, 0, 0.5450981, 1,
1.290198, -0.5682318, 1.484747, 1, 0, 0.5411765, 1,
1.291862, -2.671896, 1.128518, 1, 0, 0.5333334, 1,
1.300182, -0.5995094, 0.143803, 1, 0, 0.5294118, 1,
1.322352, -0.04737064, 1.147127, 1, 0, 0.5215687, 1,
1.326754, -1.342901, 2.121394, 1, 0, 0.5176471, 1,
1.332045, 0.1553699, 0.9069252, 1, 0, 0.509804, 1,
1.340028, -0.9133359, 2.324861, 1, 0, 0.5058824, 1,
1.341354, 0.3503774, 0.6014496, 1, 0, 0.4980392, 1,
1.359399, 0.2010705, 2.064323, 1, 0, 0.4901961, 1,
1.366826, 0.1102052, 2.320489, 1, 0, 0.4862745, 1,
1.368276, -1.148307, 1.781958, 1, 0, 0.4784314, 1,
1.371405, -0.2949313, 3.313067, 1, 0, 0.4745098, 1,
1.372517, -1.410828, 3.382099, 1, 0, 0.4666667, 1,
1.37844, -0.9202336, 2.090454, 1, 0, 0.4627451, 1,
1.39757, -0.3529384, 1.720264, 1, 0, 0.454902, 1,
1.404169, 0.3300736, 2.458385, 1, 0, 0.4509804, 1,
1.410503, 1.23763, 2.014594, 1, 0, 0.4431373, 1,
1.419621, 0.7649758, 1.526307, 1, 0, 0.4392157, 1,
1.420999, 1.581335, 0.0730459, 1, 0, 0.4313726, 1,
1.426439, 0.5312992, 1.891775, 1, 0, 0.427451, 1,
1.458885, -0.9819294, 2.357801, 1, 0, 0.4196078, 1,
1.460892, 0.3284964, 0.6809719, 1, 0, 0.4156863, 1,
1.467341, -0.7799205, 2.485487, 1, 0, 0.4078431, 1,
1.486364, -0.3303365, 1.670395, 1, 0, 0.4039216, 1,
1.490043, 0.6330526, 0.08176091, 1, 0, 0.3960784, 1,
1.493895, 0.001980737, 0.5103215, 1, 0, 0.3882353, 1,
1.494986, -1.83849, 1.517249, 1, 0, 0.3843137, 1,
1.525332, -2.042738, 2.685809, 1, 0, 0.3764706, 1,
1.528868, 1.192133, 2.389994, 1, 0, 0.372549, 1,
1.535353, 0.07957738, 1.463074, 1, 0, 0.3647059, 1,
1.537057, -1.074532, 2.731232, 1, 0, 0.3607843, 1,
1.537848, 0.1729493, 1.732156, 1, 0, 0.3529412, 1,
1.539641, -1.499706, 3.059423, 1, 0, 0.3490196, 1,
1.541395, 1.053272, 0.5564646, 1, 0, 0.3411765, 1,
1.546662, 1.261154, 1.157327, 1, 0, 0.3372549, 1,
1.560744, -0.4988133, 0.7295219, 1, 0, 0.3294118, 1,
1.568617, 0.8028381, 0.4018113, 1, 0, 0.3254902, 1,
1.58195, 0.6133697, -0.3660696, 1, 0, 0.3176471, 1,
1.583891, -0.3374995, 1.931332, 1, 0, 0.3137255, 1,
1.607112, -0.5896274, 4.283956, 1, 0, 0.3058824, 1,
1.612856, 0.647507, 2.915539, 1, 0, 0.2980392, 1,
1.618974, 0.2916211, 1.701586, 1, 0, 0.2941177, 1,
1.635995, -0.6452265, -0.04193582, 1, 0, 0.2862745, 1,
1.646305, 1.885351, 2.698255, 1, 0, 0.282353, 1,
1.669877, -0.1167121, 1.493855, 1, 0, 0.2745098, 1,
1.684848, -1.997363, 2.162543, 1, 0, 0.2705882, 1,
1.685635, -0.8654944, 2.753454, 1, 0, 0.2627451, 1,
1.722874, -2.0367, 0.8297417, 1, 0, 0.2588235, 1,
1.725041, -2.124327, 2.252468, 1, 0, 0.2509804, 1,
1.736434, 0.9431829, 1.907158, 1, 0, 0.2470588, 1,
1.736835, 1.588454, 1.243042, 1, 0, 0.2392157, 1,
1.757132, 0.5663458, 2.279409, 1, 0, 0.2352941, 1,
1.764562, 1.848585, -1.259619, 1, 0, 0.227451, 1,
1.770157, -0.624212, 2.97149, 1, 0, 0.2235294, 1,
1.782681, -0.983862, 1.342544, 1, 0, 0.2156863, 1,
1.807659, 1.680955, 1.321304, 1, 0, 0.2117647, 1,
1.826928, 0.2939754, 1.439806, 1, 0, 0.2039216, 1,
1.840145, -0.3807445, 0.6862855, 1, 0, 0.1960784, 1,
1.852682, 1.467811, 2.545517, 1, 0, 0.1921569, 1,
1.855216, 2.387687, 2.290005, 1, 0, 0.1843137, 1,
1.900953, -0.5045996, 2.146125, 1, 0, 0.1803922, 1,
1.924129, -0.6536974, 2.516904, 1, 0, 0.172549, 1,
1.947113, 0.7716608, -0.1410624, 1, 0, 0.1686275, 1,
1.956806, -0.4462986, 2.564372, 1, 0, 0.1607843, 1,
1.961874, -0.2982451, 0.5968076, 1, 0, 0.1568628, 1,
1.970038, 0.3985596, 0.9334092, 1, 0, 0.1490196, 1,
1.97221, 0.9961756, 2.288075, 1, 0, 0.145098, 1,
1.979394, -0.5653074, 1.359072, 1, 0, 0.1372549, 1,
2.010982, 0.3105786, 1.089422, 1, 0, 0.1333333, 1,
2.011186, -0.02967898, 0.6535847, 1, 0, 0.1254902, 1,
2.05636, -0.7759434, 2.732009, 1, 0, 0.1215686, 1,
2.071279, -0.6950259, 1.647529, 1, 0, 0.1137255, 1,
2.098866, 0.6220478, 0.2919741, 1, 0, 0.1098039, 1,
2.107581, -0.3275246, 2.353486, 1, 0, 0.1019608, 1,
2.10874, 0.8864948, 2.74671, 1, 0, 0.09411765, 1,
2.148343, -1.546053, 2.347172, 1, 0, 0.09019608, 1,
2.155786, 0.07157443, -0.5685172, 1, 0, 0.08235294, 1,
2.182225, 0.05167421, 0.3499675, 1, 0, 0.07843138, 1,
2.234807, 1.253388, 0.9745202, 1, 0, 0.07058824, 1,
2.240821, -0.4565682, 1.414735, 1, 0, 0.06666667, 1,
2.257116, -0.8571721, 1.726046, 1, 0, 0.05882353, 1,
2.282996, -1.058819, 0.9563964, 1, 0, 0.05490196, 1,
2.412353, -0.2151069, 0.7072721, 1, 0, 0.04705882, 1,
2.425965, -1.045556, 3.481202, 1, 0, 0.04313726, 1,
2.469741, -0.4550776, 3.186783, 1, 0, 0.03529412, 1,
2.532321, 0.5071737, 1.499311, 1, 0, 0.03137255, 1,
2.715907, 1.437871, 1.771673, 1, 0, 0.02352941, 1,
2.762384, -1.345797, 0.4264267, 1, 0, 0.01960784, 1,
2.845973, -0.5740412, 2.318853, 1, 0, 0.01176471, 1,
3.451597, 1.368771, -0.6696081, 1, 0, 0.007843138, 1
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
0.3064647, -4.209146, -7.57173, 0, -0.5, 0.5, 0.5,
0.3064647, -4.209146, -7.57173, 1, -0.5, 0.5, 0.5,
0.3064647, -4.209146, -7.57173, 1, 1.5, 0.5, 0.5,
0.3064647, -4.209146, -7.57173, 0, 1.5, 0.5, 0.5
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
-3.904868, 0.2734581, -7.57173, 0, -0.5, 0.5, 0.5,
-3.904868, 0.2734581, -7.57173, 1, -0.5, 0.5, 0.5,
-3.904868, 0.2734581, -7.57173, 1, 1.5, 0.5, 0.5,
-3.904868, 0.2734581, -7.57173, 0, 1.5, 0.5, 0.5
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
-3.904868, -4.209146, -0.1237309, 0, -0.5, 0.5, 0.5,
-3.904868, -4.209146, -0.1237309, 1, -0.5, 0.5, 0.5,
-3.904868, -4.209146, -0.1237309, 1, 1.5, 0.5, 0.5,
-3.904868, -4.209146, -0.1237309, 0, 1.5, 0.5, 0.5
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
-2, -3.174698, -5.852961,
3, -3.174698, -5.852961,
-2, -3.174698, -5.852961,
-2, -3.347106, -6.139422,
-1, -3.174698, -5.852961,
-1, -3.347106, -6.139422,
0, -3.174698, -5.852961,
0, -3.347106, -6.139422,
1, -3.174698, -5.852961,
1, -3.347106, -6.139422,
2, -3.174698, -5.852961,
2, -3.347106, -6.139422,
3, -3.174698, -5.852961,
3, -3.347106, -6.139422
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
-2, -3.691922, -6.712345, 0, -0.5, 0.5, 0.5,
-2, -3.691922, -6.712345, 1, -0.5, 0.5, 0.5,
-2, -3.691922, -6.712345, 1, 1.5, 0.5, 0.5,
-2, -3.691922, -6.712345, 0, 1.5, 0.5, 0.5,
-1, -3.691922, -6.712345, 0, -0.5, 0.5, 0.5,
-1, -3.691922, -6.712345, 1, -0.5, 0.5, 0.5,
-1, -3.691922, -6.712345, 1, 1.5, 0.5, 0.5,
-1, -3.691922, -6.712345, 0, 1.5, 0.5, 0.5,
0, -3.691922, -6.712345, 0, -0.5, 0.5, 0.5,
0, -3.691922, -6.712345, 1, -0.5, 0.5, 0.5,
0, -3.691922, -6.712345, 1, 1.5, 0.5, 0.5,
0, -3.691922, -6.712345, 0, 1.5, 0.5, 0.5,
1, -3.691922, -6.712345, 0, -0.5, 0.5, 0.5,
1, -3.691922, -6.712345, 1, -0.5, 0.5, 0.5,
1, -3.691922, -6.712345, 1, 1.5, 0.5, 0.5,
1, -3.691922, -6.712345, 0, 1.5, 0.5, 0.5,
2, -3.691922, -6.712345, 0, -0.5, 0.5, 0.5,
2, -3.691922, -6.712345, 1, -0.5, 0.5, 0.5,
2, -3.691922, -6.712345, 1, 1.5, 0.5, 0.5,
2, -3.691922, -6.712345, 0, 1.5, 0.5, 0.5,
3, -3.691922, -6.712345, 0, -0.5, 0.5, 0.5,
3, -3.691922, -6.712345, 1, -0.5, 0.5, 0.5,
3, -3.691922, -6.712345, 1, 1.5, 0.5, 0.5,
3, -3.691922, -6.712345, 0, 1.5, 0.5, 0.5
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
-2.933022, -3, -5.852961,
-2.933022, 3, -5.852961,
-2.933022, -3, -5.852961,
-3.094996, -3, -6.139422,
-2.933022, -2, -5.852961,
-3.094996, -2, -6.139422,
-2.933022, -1, -5.852961,
-3.094996, -1, -6.139422,
-2.933022, 0, -5.852961,
-3.094996, 0, -6.139422,
-2.933022, 1, -5.852961,
-3.094996, 1, -6.139422,
-2.933022, 2, -5.852961,
-3.094996, 2, -6.139422,
-2.933022, 3, -5.852961,
-3.094996, 3, -6.139422
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
-3.418945, -3, -6.712345, 0, -0.5, 0.5, 0.5,
-3.418945, -3, -6.712345, 1, -0.5, 0.5, 0.5,
-3.418945, -3, -6.712345, 1, 1.5, 0.5, 0.5,
-3.418945, -3, -6.712345, 0, 1.5, 0.5, 0.5,
-3.418945, -2, -6.712345, 0, -0.5, 0.5, 0.5,
-3.418945, -2, -6.712345, 1, -0.5, 0.5, 0.5,
-3.418945, -2, -6.712345, 1, 1.5, 0.5, 0.5,
-3.418945, -2, -6.712345, 0, 1.5, 0.5, 0.5,
-3.418945, -1, -6.712345, 0, -0.5, 0.5, 0.5,
-3.418945, -1, -6.712345, 1, -0.5, 0.5, 0.5,
-3.418945, -1, -6.712345, 1, 1.5, 0.5, 0.5,
-3.418945, -1, -6.712345, 0, 1.5, 0.5, 0.5,
-3.418945, 0, -6.712345, 0, -0.5, 0.5, 0.5,
-3.418945, 0, -6.712345, 1, -0.5, 0.5, 0.5,
-3.418945, 0, -6.712345, 1, 1.5, 0.5, 0.5,
-3.418945, 0, -6.712345, 0, 1.5, 0.5, 0.5,
-3.418945, 1, -6.712345, 0, -0.5, 0.5, 0.5,
-3.418945, 1, -6.712345, 1, -0.5, 0.5, 0.5,
-3.418945, 1, -6.712345, 1, 1.5, 0.5, 0.5,
-3.418945, 1, -6.712345, 0, 1.5, 0.5, 0.5,
-3.418945, 2, -6.712345, 0, -0.5, 0.5, 0.5,
-3.418945, 2, -6.712345, 1, -0.5, 0.5, 0.5,
-3.418945, 2, -6.712345, 1, 1.5, 0.5, 0.5,
-3.418945, 2, -6.712345, 0, 1.5, 0.5, 0.5,
-3.418945, 3, -6.712345, 0, -0.5, 0.5, 0.5,
-3.418945, 3, -6.712345, 1, -0.5, 0.5, 0.5,
-3.418945, 3, -6.712345, 1, 1.5, 0.5, 0.5,
-3.418945, 3, -6.712345, 0, 1.5, 0.5, 0.5
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
-2.933022, -3.174698, -4,
-2.933022, -3.174698, 4,
-2.933022, -3.174698, -4,
-3.094996, -3.347106, -4,
-2.933022, -3.174698, -2,
-3.094996, -3.347106, -2,
-2.933022, -3.174698, 0,
-3.094996, -3.347106, 0,
-2.933022, -3.174698, 2,
-3.094996, -3.347106, 2,
-2.933022, -3.174698, 4,
-3.094996, -3.347106, 4
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
-3.418945, -3.691922, -4, 0, -0.5, 0.5, 0.5,
-3.418945, -3.691922, -4, 1, -0.5, 0.5, 0.5,
-3.418945, -3.691922, -4, 1, 1.5, 0.5, 0.5,
-3.418945, -3.691922, -4, 0, 1.5, 0.5, 0.5,
-3.418945, -3.691922, -2, 0, -0.5, 0.5, 0.5,
-3.418945, -3.691922, -2, 1, -0.5, 0.5, 0.5,
-3.418945, -3.691922, -2, 1, 1.5, 0.5, 0.5,
-3.418945, -3.691922, -2, 0, 1.5, 0.5, 0.5,
-3.418945, -3.691922, 0, 0, -0.5, 0.5, 0.5,
-3.418945, -3.691922, 0, 1, -0.5, 0.5, 0.5,
-3.418945, -3.691922, 0, 1, 1.5, 0.5, 0.5,
-3.418945, -3.691922, 0, 0, 1.5, 0.5, 0.5,
-3.418945, -3.691922, 2, 0, -0.5, 0.5, 0.5,
-3.418945, -3.691922, 2, 1, -0.5, 0.5, 0.5,
-3.418945, -3.691922, 2, 1, 1.5, 0.5, 0.5,
-3.418945, -3.691922, 2, 0, 1.5, 0.5, 0.5,
-3.418945, -3.691922, 4, 0, -0.5, 0.5, 0.5,
-3.418945, -3.691922, 4, 1, -0.5, 0.5, 0.5,
-3.418945, -3.691922, 4, 1, 1.5, 0.5, 0.5,
-3.418945, -3.691922, 4, 0, 1.5, 0.5, 0.5
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
-2.933022, -3.174698, -5.852961,
-2.933022, 3.721615, -5.852961,
-2.933022, -3.174698, 5.605499,
-2.933022, 3.721615, 5.605499,
-2.933022, -3.174698, -5.852961,
-2.933022, -3.174698, 5.605499,
-2.933022, 3.721615, -5.852961,
-2.933022, 3.721615, 5.605499,
-2.933022, -3.174698, -5.852961,
3.545951, -3.174698, -5.852961,
-2.933022, -3.174698, 5.605499,
3.545951, -3.174698, 5.605499,
-2.933022, 3.721615, -5.852961,
3.545951, 3.721615, -5.852961,
-2.933022, 3.721615, 5.605499,
3.545951, 3.721615, 5.605499,
3.545951, -3.174698, -5.852961,
3.545951, 3.721615, -5.852961,
3.545951, -3.174698, 5.605499,
3.545951, 3.721615, 5.605499,
3.545951, -3.174698, -5.852961,
3.545951, -3.174698, 5.605499,
3.545951, 3.721615, -5.852961,
3.545951, 3.721615, 5.605499
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
var radius = 7.935184;
var distance = 35.30453;
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
mvMatrix.translate( -0.3064647, -0.2734581, 0.1237309 );
mvMatrix.scale( 1.324234, 1.244096, 0.7487634 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.30453);
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
nitrothal-isopropyl<-read.table("nitrothal-isopropyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-nitrothal-isopropyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'nitrothal' not found
```

```r
y<-nitrothal-isopropyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'nitrothal' not found
```

```r
z<-nitrothal-isopropyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'nitrothal' not found
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
-2.838668, 0.8014103, -1.299811, 0, 0, 1, 1, 1,
-2.808755, 1.414776, -0.7790459, 1, 0, 0, 1, 1,
-2.649995, 0.3850164, -2.574121, 1, 0, 0, 1, 1,
-2.524428, 2.021941, -0.5085933, 1, 0, 0, 1, 1,
-2.48127, -0.8404474, -1.445147, 1, 0, 0, 1, 1,
-2.451284, -0.4769811, -0.1031721, 1, 0, 0, 1, 1,
-2.44641, 0.6341776, -1.591626, 0, 0, 0, 1, 1,
-2.435767, 0.6607557, -1.34481, 0, 0, 0, 1, 1,
-2.390716, 0.7587364, -1.184773, 0, 0, 0, 1, 1,
-2.386045, -0.4103881, -1.707487, 0, 0, 0, 1, 1,
-2.326911, 1.032969, -3.473802, 0, 0, 0, 1, 1,
-2.295218, 0.1810322, -2.486309, 0, 0, 0, 1, 1,
-2.270444, 1.2436, -1.084784, 0, 0, 0, 1, 1,
-2.239439, -0.4966943, -0.2671716, 1, 1, 1, 1, 1,
-2.238029, -0.7072637, -3.056294, 1, 1, 1, 1, 1,
-2.213725, -0.01603159, -1.397046, 1, 1, 1, 1, 1,
-2.18842, -1.057001, -2.488717, 1, 1, 1, 1, 1,
-2.153141, -1.118304, -1.889491, 1, 1, 1, 1, 1,
-2.150152, -1.153551, -0.7329495, 1, 1, 1, 1, 1,
-2.129156, -1.177197, -3.641078, 1, 1, 1, 1, 1,
-2.092812, -0.09198506, -1.706317, 1, 1, 1, 1, 1,
-2.086422, -0.7650447, -1.714177, 1, 1, 1, 1, 1,
-2.08479, -1.535053, -1.742146, 1, 1, 1, 1, 1,
-2.084443, -0.9787017, -3.966509, 1, 1, 1, 1, 1,
-2.036129, -1.253055, -2.556785, 1, 1, 1, 1, 1,
-2.009091, -1.579458, -1.163151, 1, 1, 1, 1, 1,
-1.999653, 0.01106839, -1.031446, 1, 1, 1, 1, 1,
-1.986257, 1.016392, -1.985277, 1, 1, 1, 1, 1,
-1.979964, 0.1634357, -1.103882, 0, 0, 1, 1, 1,
-1.950997, -1.157032, -2.771329, 1, 0, 0, 1, 1,
-1.944699, -0.5176234, -1.772603, 1, 0, 0, 1, 1,
-1.91019, -1.395728, -1.725042, 1, 0, 0, 1, 1,
-1.885917, 0.7409393, -0.1687741, 1, 0, 0, 1, 1,
-1.872705, 1.019896, -1.440996, 1, 0, 0, 1, 1,
-1.858689, -1.554679, -2.285639, 0, 0, 0, 1, 1,
-1.853388, -2.329117, -1.890431, 0, 0, 0, 1, 1,
-1.844694, -1.174739, -0.6455428, 0, 0, 0, 1, 1,
-1.838935, -0.5071855, -1.88901, 0, 0, 0, 1, 1,
-1.838564, -1.14657, -2.62999, 0, 0, 0, 1, 1,
-1.784784, 0.2128016, -1.843512, 0, 0, 0, 1, 1,
-1.753548, 0.5882892, -2.072109, 0, 0, 0, 1, 1,
-1.728203, 1.159101, -1.253592, 1, 1, 1, 1, 1,
-1.697649, -2.245679, -2.864121, 1, 1, 1, 1, 1,
-1.682952, -0.2699049, -1.379295, 1, 1, 1, 1, 1,
-1.648394, -0.129538, -1.941201, 1, 1, 1, 1, 1,
-1.638782, 0.4030702, -1.987513, 1, 1, 1, 1, 1,
-1.636727, 3.621183, -0.9783708, 1, 1, 1, 1, 1,
-1.632273, -0.1422895, -3.03492, 1, 1, 1, 1, 1,
-1.626793, -0.391394, -2.583514, 1, 1, 1, 1, 1,
-1.62466, 2.190325, -0.1801513, 1, 1, 1, 1, 1,
-1.606301, 0.4977176, -0.5566328, 1, 1, 1, 1, 1,
-1.605662, -1.333355, -0.998805, 1, 1, 1, 1, 1,
-1.59697, 1.846308, -0.6551327, 1, 1, 1, 1, 1,
-1.594949, 1.175285, -4.034078, 1, 1, 1, 1, 1,
-1.524322, 1.05993, -1.34967, 1, 1, 1, 1, 1,
-1.515907, -1.117817, -1.989727, 1, 1, 1, 1, 1,
-1.515111, -0.8752012, -3.268771, 0, 0, 1, 1, 1,
-1.503034, 0.1198202, -1.072392, 1, 0, 0, 1, 1,
-1.499558, -0.1236709, -0.9189588, 1, 0, 0, 1, 1,
-1.494806, -0.5621731, -4.368597, 1, 0, 0, 1, 1,
-1.494518, -0.9974399, -1.729097, 1, 0, 0, 1, 1,
-1.478211, 0.3606263, -3.007737, 1, 0, 0, 1, 1,
-1.476862, 0.6542987, -2.81494, 0, 0, 0, 1, 1,
-1.462817, 0.4970807, -0.1647728, 0, 0, 0, 1, 1,
-1.460707, -1.785796, -3.358969, 0, 0, 0, 1, 1,
-1.4593, 0.6417497, -2.10009, 0, 0, 0, 1, 1,
-1.450064, -2.310358, -4.941489, 0, 0, 0, 1, 1,
-1.448631, 0.1336764, -0.8063842, 0, 0, 0, 1, 1,
-1.444226, -0.9204015, -1.323658, 0, 0, 0, 1, 1,
-1.44132, 0.9369465, 0.3365424, 1, 1, 1, 1, 1,
-1.43846, -1.137787, -1.593014, 1, 1, 1, 1, 1,
-1.431282, -0.4900733, -1.327476, 1, 1, 1, 1, 1,
-1.429023, -1.8436, -3.394957, 1, 1, 1, 1, 1,
-1.421815, -1.401484, -3.289041, 1, 1, 1, 1, 1,
-1.411892, -1.676061, -3.846917, 1, 1, 1, 1, 1,
-1.410655, 0.7310074, -1.959216, 1, 1, 1, 1, 1,
-1.40371, -0.4285983, -1.675192, 1, 1, 1, 1, 1,
-1.394183, 0.6755634, -0.9826727, 1, 1, 1, 1, 1,
-1.37704, -0.8606744, -2.763816, 1, 1, 1, 1, 1,
-1.367162, 0.3147528, -0.7419475, 1, 1, 1, 1, 1,
-1.367059, -0.1662777, -2.768164, 1, 1, 1, 1, 1,
-1.35293, -1.449153, -3.002681, 1, 1, 1, 1, 1,
-1.35052, -0.9203811, -2.877481, 1, 1, 1, 1, 1,
-1.332141, 0.9490273, -0.3389938, 1, 1, 1, 1, 1,
-1.323653, -2.049591, -2.300246, 0, 0, 1, 1, 1,
-1.318169, 1.074417, 0.0841539, 1, 0, 0, 1, 1,
-1.305951, 0.173554, -1.057765, 1, 0, 0, 1, 1,
-1.305632, 0.3124613, -1.598923, 1, 0, 0, 1, 1,
-1.300153, -0.5659163, 0.6397557, 1, 0, 0, 1, 1,
-1.295608, 0.6022462, -1.294499, 1, 0, 0, 1, 1,
-1.285965, -0.7465518, -2.809367, 0, 0, 0, 1, 1,
-1.280054, -0.4850689, -1.11487, 0, 0, 0, 1, 1,
-1.270979, -0.9714912, -1.542087, 0, 0, 0, 1, 1,
-1.267222, 0.2332308, 0.3583886, 0, 0, 0, 1, 1,
-1.262789, -0.1279857, -2.2143, 0, 0, 0, 1, 1,
-1.257451, -0.1577544, -1.392771, 0, 0, 0, 1, 1,
-1.256953, 1.04616, -0.1223863, 0, 0, 0, 1, 1,
-1.246955, -0.3821926, -1.90743, 1, 1, 1, 1, 1,
-1.23901, 0.3670292, -1.720953, 1, 1, 1, 1, 1,
-1.235823, 1.681506, -0.7882881, 1, 1, 1, 1, 1,
-1.223723, 0.375683, -1.535276, 1, 1, 1, 1, 1,
-1.220901, -1.402346, -1.526597, 1, 1, 1, 1, 1,
-1.2184, -0.3994898, -0.5971036, 1, 1, 1, 1, 1,
-1.217757, 0.3578816, -0.05760721, 1, 1, 1, 1, 1,
-1.206174, -2.140882, -2.241298, 1, 1, 1, 1, 1,
-1.20334, -0.4278567, -1.981407, 1, 1, 1, 1, 1,
-1.198755, -1.706967, -4.198479, 1, 1, 1, 1, 1,
-1.194334, 0.7131776, -2.295336, 1, 1, 1, 1, 1,
-1.178896, 0.3118987, -2.273587, 1, 1, 1, 1, 1,
-1.174914, -0.122152, -1.476915, 1, 1, 1, 1, 1,
-1.174885, 0.5928934, -1.101216, 1, 1, 1, 1, 1,
-1.172626, -0.6620738, -2.140062, 1, 1, 1, 1, 1,
-1.170255, 0.5235103, -0.1537698, 0, 0, 1, 1, 1,
-1.16649, -0.2826677, -3.696843, 1, 0, 0, 1, 1,
-1.165831, 0.2246977, -1.421482, 1, 0, 0, 1, 1,
-1.160284, 0.3730467, -1.14644, 1, 0, 0, 1, 1,
-1.15932, 0.3890062, -2.0291, 1, 0, 0, 1, 1,
-1.156325, 0.9289437, -1.055141, 1, 0, 0, 1, 1,
-1.152167, 0.5690176, -1.986033, 0, 0, 0, 1, 1,
-1.144569, 0.3985414, -3.272115, 0, 0, 0, 1, 1,
-1.141475, -0.4173073, -2.761622, 0, 0, 0, 1, 1,
-1.134305, 0.4341611, -2.127611, 0, 0, 0, 1, 1,
-1.130108, 1.263841, -0.5978208, 0, 0, 0, 1, 1,
-1.122361, -1.032795, -2.613456, 0, 0, 0, 1, 1,
-1.121414, 0.01708155, -0.5272839, 0, 0, 0, 1, 1,
-1.113229, 0.3846702, -0.1144466, 1, 1, 1, 1, 1,
-1.105004, -0.2560186, -2.429613, 1, 1, 1, 1, 1,
-1.097582, -0.8984673, -3.76162, 1, 1, 1, 1, 1,
-1.09256, 0.4577581, -2.674549, 1, 1, 1, 1, 1,
-1.088468, -1.731659, -4.12122, 1, 1, 1, 1, 1,
-1.074847, 0.1623326, -1.386411, 1, 1, 1, 1, 1,
-1.072263, 0.6931112, -2.426124, 1, 1, 1, 1, 1,
-1.053185, 2.199627, 0.154548, 1, 1, 1, 1, 1,
-1.05279, 1.430901, 0.09606809, 1, 1, 1, 1, 1,
-1.049861, -0.5712393, -0.9926243, 1, 1, 1, 1, 1,
-1.045921, 0.349824, -1.119972, 1, 1, 1, 1, 1,
-1.042934, 0.6667195, -1.569045, 1, 1, 1, 1, 1,
-1.036943, -1.745546, -4.019683, 1, 1, 1, 1, 1,
-1.036378, -0.1029786, -2.701611, 1, 1, 1, 1, 1,
-1.035244, 1.559342, -1.873774, 1, 1, 1, 1, 1,
-1.033199, -1.55413, -2.219443, 0, 0, 1, 1, 1,
-1.03283, 2.859851, 0.6415148, 1, 0, 0, 1, 1,
-1.032803, 0.5387006, -2.349873, 1, 0, 0, 1, 1,
-1.028053, -0.08633097, -1.469352, 1, 0, 0, 1, 1,
-1.021781, -0.231879, -0.5334016, 1, 0, 0, 1, 1,
-1.020827, 0.774948, -0.3752348, 1, 0, 0, 1, 1,
-1.015437, 0.812068, -0.2716726, 0, 0, 0, 1, 1,
-1.008946, -0.1988018, -0.7000747, 0, 0, 0, 1, 1,
-0.997726, -0.2491739, -1.545392, 0, 0, 0, 1, 1,
-0.9970641, 1.352203, -0.01678387, 0, 0, 0, 1, 1,
-0.9868559, 0.1970295, -1.138666, 0, 0, 0, 1, 1,
-0.9842975, 1.017308, -0.8659657, 0, 0, 0, 1, 1,
-0.9814573, 1.746398, -0.5644506, 0, 0, 0, 1, 1,
-0.9791282, 0.4457023, 0.7219192, 1, 1, 1, 1, 1,
-0.9774879, -2.265243, -2.931603, 1, 1, 1, 1, 1,
-0.9766322, 0.5242454, -2.340873, 1, 1, 1, 1, 1,
-0.9764538, -0.7787753, -3.563583, 1, 1, 1, 1, 1,
-0.9762467, 0.4112568, -3.758395, 1, 1, 1, 1, 1,
-0.975734, -0.7349973, -2.723224, 1, 1, 1, 1, 1,
-0.9730203, 0.03750656, -4.040052, 1, 1, 1, 1, 1,
-0.9709578, -2.10535, -1.696736, 1, 1, 1, 1, 1,
-0.9683673, 1.110988, -1.220212, 1, 1, 1, 1, 1,
-0.9636085, -0.7912276, -2.425259, 1, 1, 1, 1, 1,
-0.95964, 1.00587, 0.9381567, 1, 1, 1, 1, 1,
-0.9594802, -0.2858317, -2.02141, 1, 1, 1, 1, 1,
-0.9587863, 0.1390282, -0.6893682, 1, 1, 1, 1, 1,
-0.9561598, 0.01901693, -1.51254, 1, 1, 1, 1, 1,
-0.9547238, -1.162526, -1.895109, 1, 1, 1, 1, 1,
-0.9518496, -1.138001, -2.889864, 0, 0, 1, 1, 1,
-0.9504451, -0.2778651, -2.624436, 1, 0, 0, 1, 1,
-0.9474147, -2.218407, -0.6085429, 1, 0, 0, 1, 1,
-0.9460877, 1.010783, -2.192265, 1, 0, 0, 1, 1,
-0.9428612, -1.960339, -3.100565, 1, 0, 0, 1, 1,
-0.9277554, 0.5321613, -0.5705466, 1, 0, 0, 1, 1,
-0.9252813, -0.460252, -3.625515, 0, 0, 0, 1, 1,
-0.9196223, -0.3851132, -3.304066, 0, 0, 0, 1, 1,
-0.9181588, -0.09085155, -2.337012, 0, 0, 0, 1, 1,
-0.9099646, 0.221701, -0.005084798, 0, 0, 0, 1, 1,
-0.9016722, 0.9304538, -0.3443485, 0, 0, 0, 1, 1,
-0.8926441, -0.6985564, -2.183235, 0, 0, 0, 1, 1,
-0.8908836, 0.2149951, -0.2475647, 0, 0, 0, 1, 1,
-0.8889758, -0.3273923, -0.4729333, 1, 1, 1, 1, 1,
-0.8861025, -1.215384, -2.205311, 1, 1, 1, 1, 1,
-0.8824592, -1.316282, -2.451482, 1, 1, 1, 1, 1,
-0.8821905, 1.294552, -1.443186, 1, 1, 1, 1, 1,
-0.8773363, -0.5878192, -2.85378, 1, 1, 1, 1, 1,
-0.8748546, 0.3596586, -1.644764, 1, 1, 1, 1, 1,
-0.8716051, 0.08443814, -0.7009255, 1, 1, 1, 1, 1,
-0.8668543, 1.858629, -0.1674114, 1, 1, 1, 1, 1,
-0.8648512, -0.5306793, -0.7544661, 1, 1, 1, 1, 1,
-0.8617532, 0.5159377, -0.3204142, 1, 1, 1, 1, 1,
-0.8609653, -0.2450092, 0.3084629, 1, 1, 1, 1, 1,
-0.858488, 2.018526, 0.08974285, 1, 1, 1, 1, 1,
-0.8567465, 1.097807, -2.137472, 1, 1, 1, 1, 1,
-0.8485858, -0.8405219, -1.72399, 1, 1, 1, 1, 1,
-0.8382214, 0.6207264, -1.012415, 1, 1, 1, 1, 1,
-0.8361617, -1.887492, -3.432732, 0, 0, 1, 1, 1,
-0.8297101, 0.1702091, -0.4720218, 1, 0, 0, 1, 1,
-0.8284774, -0.6399375, -3.107301, 1, 0, 0, 1, 1,
-0.8283391, -0.6631405, -1.782329, 1, 0, 0, 1, 1,
-0.8246935, -0.02710586, -1.736495, 1, 0, 0, 1, 1,
-0.8222228, -0.9783121, -3.43637, 1, 0, 0, 1, 1,
-0.8174561, 0.3500731, 0.8039, 0, 0, 0, 1, 1,
-0.8121546, 0.5838515, -0.6549565, 0, 0, 0, 1, 1,
-0.8085099, -0.150221, -1.286473, 0, 0, 0, 1, 1,
-0.8073381, 0.7623749, -1.606375, 0, 0, 0, 1, 1,
-0.7982317, -1.660843, -1.631507, 0, 0, 0, 1, 1,
-0.794302, -0.5842811, -3.67113, 0, 0, 0, 1, 1,
-0.7922483, 1.437712, -1.721876, 0, 0, 0, 1, 1,
-0.78785, -1.82755, -3.525018, 1, 1, 1, 1, 1,
-0.7806862, 0.9027532, -1.46021, 1, 1, 1, 1, 1,
-0.7778784, 0.1030549, -0.9244268, 1, 1, 1, 1, 1,
-0.7722154, 0.0007148328, -1.542453, 1, 1, 1, 1, 1,
-0.7720169, -2.314591, -1.316639, 1, 1, 1, 1, 1,
-0.7711834, 1.356882, -0.4276772, 1, 1, 1, 1, 1,
-0.7615296, 0.9828405, -1.063416, 1, 1, 1, 1, 1,
-0.7574646, -1.650894, -3.858043, 1, 1, 1, 1, 1,
-0.7562343, 1.316532, -1.320876, 1, 1, 1, 1, 1,
-0.7552121, 0.7129945, -1.708689, 1, 1, 1, 1, 1,
-0.7544965, 0.2205908, -2.778432, 1, 1, 1, 1, 1,
-0.7463945, -0.1539007, -0.4946106, 1, 1, 1, 1, 1,
-0.739657, -0.7977719, -2.94708, 1, 1, 1, 1, 1,
-0.7328874, 0.6676855, -2.193591, 1, 1, 1, 1, 1,
-0.7304834, 1.641194, -1.016041, 1, 1, 1, 1, 1,
-0.7290539, 0.7524893, -0.3366891, 0, 0, 1, 1, 1,
-0.7148261, -0.6624094, -3.020551, 1, 0, 0, 1, 1,
-0.708892, 0.6923512, 1.009993, 1, 0, 0, 1, 1,
-0.7026041, -0.1674149, -2.473347, 1, 0, 0, 1, 1,
-0.7010604, -1.249701, -2.135129, 1, 0, 0, 1, 1,
-0.6981936, -0.1472359, -1.53184, 1, 0, 0, 1, 1,
-0.6941652, 0.8713866, 0.3276123, 0, 0, 0, 1, 1,
-0.6939214, -0.3180101, 0.3943967, 0, 0, 0, 1, 1,
-0.6873067, -0.6551361, -3.286824, 0, 0, 0, 1, 1,
-0.687207, -0.4987413, -2.566538, 0, 0, 0, 1, 1,
-0.6871632, -1.526892, -2.38021, 0, 0, 0, 1, 1,
-0.6869748, -0.5116862, -0.5748149, 0, 0, 0, 1, 1,
-0.6740465, 0.3862467, -2.900869, 0, 0, 0, 1, 1,
-0.673889, -0.7393323, -2.067128, 1, 1, 1, 1, 1,
-0.6738691, 2.043448, -1.461435, 1, 1, 1, 1, 1,
-0.6692145, -0.8469416, -1.804478, 1, 1, 1, 1, 1,
-0.6674976, -0.1697102, -1.98218, 1, 1, 1, 1, 1,
-0.6656293, 0.2364237, 0.4798881, 1, 1, 1, 1, 1,
-0.6639606, -0.4943401, -4.300752, 1, 1, 1, 1, 1,
-0.6598383, 0.1997065, -0.6066054, 1, 1, 1, 1, 1,
-0.6554205, 1.572952, -0.7871205, 1, 1, 1, 1, 1,
-0.6539567, -0.9667057, -3.644505, 1, 1, 1, 1, 1,
-0.6527174, 0.1624206, -4.288508, 1, 1, 1, 1, 1,
-0.6509923, 1.365936, -1.357892, 1, 1, 1, 1, 1,
-0.6505247, 0.355855, -2.114043, 1, 1, 1, 1, 1,
-0.6402677, -0.4365362, -4.381814, 1, 1, 1, 1, 1,
-0.6372982, -0.4626254, -0.9334717, 1, 1, 1, 1, 1,
-0.635632, 1.152897, -0.1285183, 1, 1, 1, 1, 1,
-0.634825, -1.055272, -3.329564, 0, 0, 1, 1, 1,
-0.6301812, -0.9484606, -2.997088, 1, 0, 0, 1, 1,
-0.6287187, 0.4902638, -0.5076142, 1, 0, 0, 1, 1,
-0.62253, -0.5365943, -0.3472839, 1, 0, 0, 1, 1,
-0.6221257, 1.046645, -0.207617, 1, 0, 0, 1, 1,
-0.6218898, 1.566987, -1.16518, 1, 0, 0, 1, 1,
-0.6217238, 0.75293, -1.204507, 0, 0, 0, 1, 1,
-0.6092293, 0.5517955, -1.749413, 0, 0, 0, 1, 1,
-0.6043373, 0.2755033, -0.9241842, 0, 0, 0, 1, 1,
-0.5993824, -0.5844943, -3.364999, 0, 0, 0, 1, 1,
-0.5992239, -1.09824, -2.666023, 0, 0, 0, 1, 1,
-0.5858904, 2.157907, 1.0611, 0, 0, 0, 1, 1,
-0.5854549, 2.124497, -1.836921, 0, 0, 0, 1, 1,
-0.5819249, -0.5537743, -2.40079, 1, 1, 1, 1, 1,
-0.574976, 2.07968, -0.6756256, 1, 1, 1, 1, 1,
-0.5741958, 1.237319, 0.212218, 1, 1, 1, 1, 1,
-0.5718482, 0.5295557, -0.3913614, 1, 1, 1, 1, 1,
-0.5655489, 1.65714, -0.1200842, 1, 1, 1, 1, 1,
-0.56038, -0.673071, -2.086165, 1, 1, 1, 1, 1,
-0.5587899, 1.451734, -1.920808, 1, 1, 1, 1, 1,
-0.5576298, -0.1549502, -2.19177, 1, 1, 1, 1, 1,
-0.5572182, -0.3213472, -1.069617, 1, 1, 1, 1, 1,
-0.556383, 0.086362, -0.9565999, 1, 1, 1, 1, 1,
-0.5545567, -1.817731, -2.199045, 1, 1, 1, 1, 1,
-0.5505042, -0.1142249, -2.427842, 1, 1, 1, 1, 1,
-0.5477262, -0.8637359, -2.802758, 1, 1, 1, 1, 1,
-0.5391117, 1.614385, -1.307521, 1, 1, 1, 1, 1,
-0.5385494, 0.08378961, -2.948367, 1, 1, 1, 1, 1,
-0.5318045, 2.013443, -2.426638, 0, 0, 1, 1, 1,
-0.5306113, 0.5097987, -2.363006, 1, 0, 0, 1, 1,
-0.5275677, -0.6775842, -2.025275, 1, 0, 0, 1, 1,
-0.5266441, 0.6019937, -2.375182, 1, 0, 0, 1, 1,
-0.5261763, -1.329403, -2.404665, 1, 0, 0, 1, 1,
-0.5214185, 0.1287628, -2.574755, 1, 0, 0, 1, 1,
-0.5199682, 1.55018, -0.106222, 0, 0, 0, 1, 1,
-0.5189366, -0.1161479, -0.896229, 0, 0, 0, 1, 1,
-0.5151293, -0.9403319, -1.879911, 0, 0, 0, 1, 1,
-0.5091671, -0.3232251, -0.8580265, 0, 0, 0, 1, 1,
-0.5061366, -1.474918, -3.61026, 0, 0, 0, 1, 1,
-0.5045868, -0.7880698, -2.048983, 0, 0, 0, 1, 1,
-0.5027847, 1.838108, 2.092646, 0, 0, 0, 1, 1,
-0.4928124, -0.939968, -4.333112, 1, 1, 1, 1, 1,
-0.4900914, 1.995767, 0.3078644, 1, 1, 1, 1, 1,
-0.4899976, -0.5487226, -2.555841, 1, 1, 1, 1, 1,
-0.4864536, 1.112049, -1.387212, 1, 1, 1, 1, 1,
-0.481918, 0.6335036, 0.1268791, 1, 1, 1, 1, 1,
-0.4806132, 2.374066, -0.03221112, 1, 1, 1, 1, 1,
-0.4729077, 1.161417, -0.2040153, 1, 1, 1, 1, 1,
-0.4714054, 0.3102267, -1.185684, 1, 1, 1, 1, 1,
-0.4710607, 0.1598887, -1.231936, 1, 1, 1, 1, 1,
-0.4695718, -1.140863, -3.771464, 1, 1, 1, 1, 1,
-0.4679908, 0.4018272, 0.4439025, 1, 1, 1, 1, 1,
-0.467473, -0.5621989, -3.228131, 1, 1, 1, 1, 1,
-0.4627248, 0.5746127, -1.133151, 1, 1, 1, 1, 1,
-0.4577614, -0.03599041, -2.569954, 1, 1, 1, 1, 1,
-0.456268, -1.694229, -0.9150184, 1, 1, 1, 1, 1,
-0.4545391, -0.2522134, -0.7402071, 0, 0, 1, 1, 1,
-0.4536655, 1.286407, -1.615186, 1, 0, 0, 1, 1,
-0.4508063, 0.4391692, -0.6087642, 1, 0, 0, 1, 1,
-0.4460279, 1.470735, -0.5498567, 1, 0, 0, 1, 1,
-0.4439776, 0.142457, -3.272453, 1, 0, 0, 1, 1,
-0.438701, 1.916392, -0.9518904, 1, 0, 0, 1, 1,
-0.4386103, 0.5311638, -2.434331, 0, 0, 0, 1, 1,
-0.4360636, 0.8125219, -0.8858156, 0, 0, 0, 1, 1,
-0.4340219, 0.04456631, -1.602393, 0, 0, 0, 1, 1,
-0.4326299, 0.4435036, 0.627434, 0, 0, 0, 1, 1,
-0.4320744, 0.9568183, -1.334445, 0, 0, 0, 1, 1,
-0.4257623, -0.9477602, -2.271753, 0, 0, 0, 1, 1,
-0.4236596, -0.9958294, -2.235566, 0, 0, 0, 1, 1,
-0.4221011, 0.4432496, 1.055215, 1, 1, 1, 1, 1,
-0.4147887, -2.156078, -4.979575, 1, 1, 1, 1, 1,
-0.4100691, 0.5955775, -0.6721357, 1, 1, 1, 1, 1,
-0.4077627, -0.7754585, -2.648329, 1, 1, 1, 1, 1,
-0.4058355, -0.7151225, -3.586245, 1, 1, 1, 1, 1,
-0.3949177, 1.925688, -0.6780565, 1, 1, 1, 1, 1,
-0.3929626, -0.9050062, -4.056627, 1, 1, 1, 1, 1,
-0.3893388, 0.3234203, -0.6595492, 1, 1, 1, 1, 1,
-0.3872266, 0.3166614, -1.391566, 1, 1, 1, 1, 1,
-0.3856893, -1.199636, -3.196329, 1, 1, 1, 1, 1,
-0.3812041, 0.09787036, -0.7905892, 1, 1, 1, 1, 1,
-0.3787814, 0.2945975, 1.319709, 1, 1, 1, 1, 1,
-0.3690284, -0.5931219, -2.573658, 1, 1, 1, 1, 1,
-0.3678101, 0.5969515, -1.092394, 1, 1, 1, 1, 1,
-0.3651738, 1.105502, 0.4220819, 1, 1, 1, 1, 1,
-0.3638322, 0.3447753, -1.772685, 0, 0, 1, 1, 1,
-0.3573898, 2.588654, 1.08272, 1, 0, 0, 1, 1,
-0.3565083, 0.01845207, -1.162983, 1, 0, 0, 1, 1,
-0.3564026, 0.5917665, -0.2182186, 1, 0, 0, 1, 1,
-0.3544965, 1.391121, -1.354815, 1, 0, 0, 1, 1,
-0.3530351, 0.1638714, 0.7463677, 1, 0, 0, 1, 1,
-0.3529702, 0.5457365, -0.6387542, 0, 0, 0, 1, 1,
-0.3528124, 0.2697009, 0.7974226, 0, 0, 0, 1, 1,
-0.3514101, 0.6465051, -1.078078, 0, 0, 0, 1, 1,
-0.3426747, 0.2024285, -2.045937, 0, 0, 0, 1, 1,
-0.3420257, 1.625347, -1.157789, 0, 0, 0, 1, 1,
-0.3411048, -0.9377856, -2.105019, 0, 0, 0, 1, 1,
-0.3403896, 0.0315363, -1.660224, 0, 0, 0, 1, 1,
-0.3390494, -0.5551515, -2.154707, 1, 1, 1, 1, 1,
-0.3382495, -0.6852212, -2.242671, 1, 1, 1, 1, 1,
-0.3372076, -0.2857538, -2.351182, 1, 1, 1, 1, 1,
-0.3360948, -0.003017341, -1.062363, 1, 1, 1, 1, 1,
-0.3286743, 2.785056, -0.6333833, 1, 1, 1, 1, 1,
-0.3260179, 0.2934467, -0.2158752, 1, 1, 1, 1, 1,
-0.3254721, 1.602294, -0.5050917, 1, 1, 1, 1, 1,
-0.3253649, 0.2887023, -1.017765, 1, 1, 1, 1, 1,
-0.321981, 0.5534064, -1.662395, 1, 1, 1, 1, 1,
-0.3151472, -0.4820977, -2.27152, 1, 1, 1, 1, 1,
-0.3144019, -0.30503, -3.752429, 1, 1, 1, 1, 1,
-0.3106243, 0.05062366, -0.9243531, 1, 1, 1, 1, 1,
-0.308619, -1.866794, -3.158542, 1, 1, 1, 1, 1,
-0.3069774, 0.6444246, -0.4960223, 1, 1, 1, 1, 1,
-0.3001098, -1.137971, -4.088503, 1, 1, 1, 1, 1,
-0.2993645, -0.9300901, -3.474068, 0, 0, 1, 1, 1,
-0.2880871, 0.7678841, -0.546314, 1, 0, 0, 1, 1,
-0.2852695, 0.5564085, -2.654459, 1, 0, 0, 1, 1,
-0.2774117, 0.3742444, -1.90766, 1, 0, 0, 1, 1,
-0.271438, -1.007208, -2.870674, 1, 0, 0, 1, 1,
-0.2711071, -0.09963396, -3.302088, 1, 0, 0, 1, 1,
-0.2699321, -2.366122, -2.961583, 0, 0, 0, 1, 1,
-0.2697076, -0.1216162, -4.725354, 0, 0, 0, 1, 1,
-0.2686067, 0.320839, -0.585795, 0, 0, 0, 1, 1,
-0.2677774, -0.5197688, -2.563116, 0, 0, 0, 1, 1,
-0.256229, 0.1610636, -2.364185, 0, 0, 0, 1, 1,
-0.2507385, -1.236233, -2.523862, 0, 0, 0, 1, 1,
-0.2482774, -1.202416, -0.7297106, 0, 0, 0, 1, 1,
-0.2451709, -1.0824, -1.573183, 1, 1, 1, 1, 1,
-0.2451257, 2.094658, -0.4479672, 1, 1, 1, 1, 1,
-0.2446509, -1.42599, -1.905724, 1, 1, 1, 1, 1,
-0.2433686, -1.077735, -1.011833, 1, 1, 1, 1, 1,
-0.2417765, 0.01345795, -1.335426, 1, 1, 1, 1, 1,
-0.2393158, 0.2770428, -1.526677, 1, 1, 1, 1, 1,
-0.2386118, -0.2636769, -3.284409, 1, 1, 1, 1, 1,
-0.2286906, -0.3979858, -1.63807, 1, 1, 1, 1, 1,
-0.2271478, -1.505229, -3.26033, 1, 1, 1, 1, 1,
-0.22278, -1.467396, -3.039298, 1, 1, 1, 1, 1,
-0.2211764, 0.484915, -0.6405513, 1, 1, 1, 1, 1,
-0.2194316, -1.02656, -1.946539, 1, 1, 1, 1, 1,
-0.2169863, -0.08334254, -1.137025, 1, 1, 1, 1, 1,
-0.2154298, -0.08771388, -2.682634, 1, 1, 1, 1, 1,
-0.208343, 0.2418902, -1.757738, 1, 1, 1, 1, 1,
-0.2073927, 0.743077, -1.952702, 0, 0, 1, 1, 1,
-0.2052304, 3.276743, 0.9177254, 1, 0, 0, 1, 1,
-0.2020896, -0.1956356, -1.609116, 1, 0, 0, 1, 1,
-0.1957347, 0.7453687, -1.54863, 1, 0, 0, 1, 1,
-0.1931374, 0.466929, -0.4703363, 1, 0, 0, 1, 1,
-0.1917894, -1.488004, -2.156573, 1, 0, 0, 1, 1,
-0.1913541, -0.5784456, -1.443272, 0, 0, 0, 1, 1,
-0.1911346, 0.5786942, -0.3271942, 0, 0, 0, 1, 1,
-0.1909458, 0.08087052, -0.6801389, 0, 0, 0, 1, 1,
-0.190452, 0.5644034, -0.08566727, 0, 0, 0, 1, 1,
-0.1889209, 0.04109538, -1.643003, 0, 0, 0, 1, 1,
-0.1868486, -0.8085931, -2.832972, 0, 0, 0, 1, 1,
-0.1866381, -0.1706855, -3.494226, 0, 0, 0, 1, 1,
-0.183377, -0.1784782, -2.810139, 1, 1, 1, 1, 1,
-0.1796122, 0.4296053, 2.410731, 1, 1, 1, 1, 1,
-0.1732189, -0.2249612, -2.61759, 1, 1, 1, 1, 1,
-0.1721079, -0.5736576, -4.1401, 1, 1, 1, 1, 1,
-0.1701031, 1.539914, -0.4405912, 1, 1, 1, 1, 1,
-0.1669296, 0.5289273, 0.2271141, 1, 1, 1, 1, 1,
-0.1617075, 1.157877, -0.3236381, 1, 1, 1, 1, 1,
-0.1560209, -0.5205542, -3.18155, 1, 1, 1, 1, 1,
-0.154772, -1.402741, -4.497964, 1, 1, 1, 1, 1,
-0.1526651, 0.2968054, -1.955244, 1, 1, 1, 1, 1,
-0.1524681, 0.5353063, -0.3290652, 1, 1, 1, 1, 1,
-0.1517995, -1.708378, -3.595064, 1, 1, 1, 1, 1,
-0.1492993, -0.276523, -3.603532, 1, 1, 1, 1, 1,
-0.1492877, -0.1096495, -3.183285, 1, 1, 1, 1, 1,
-0.1487024, -0.2464025, -3.455543, 1, 1, 1, 1, 1,
-0.1448516, 0.139819, 1.428278, 0, 0, 1, 1, 1,
-0.1419602, -1.018757, -4.86906, 1, 0, 0, 1, 1,
-0.1328387, 0.3772808, -1.040719, 1, 0, 0, 1, 1,
-0.1279354, 0.2517361, -0.4844542, 1, 0, 0, 1, 1,
-0.1276997, 0.5564553, -0.9956107, 1, 0, 0, 1, 1,
-0.118632, -0.4809655, -2.96468, 1, 0, 0, 1, 1,
-0.1159128, 0.3453241, -1.277487, 0, 0, 0, 1, 1,
-0.1139032, 0.1201083, -0.6360064, 0, 0, 0, 1, 1,
-0.1123072, 0.4564642, -0.9595248, 0, 0, 0, 1, 1,
-0.112244, -0.1992391, -1.939509, 0, 0, 0, 1, 1,
-0.1119015, 1.835627, -0.6648778, 0, 0, 0, 1, 1,
-0.1104039, 0.7314893, 1.231204, 0, 0, 0, 1, 1,
-0.1097342, -0.7064986, -1.972417, 0, 0, 0, 1, 1,
-0.1080617, -0.1796142, -2.717507, 1, 1, 1, 1, 1,
-0.1077183, 0.1920073, -0.15633, 1, 1, 1, 1, 1,
-0.1026103, -0.262879, -3.338051, 1, 1, 1, 1, 1,
-0.09748405, 1.265234, -0.3127978, 1, 1, 1, 1, 1,
-0.09597677, 0.7698237, -0.9646035, 1, 1, 1, 1, 1,
-0.0939599, -0.1700665, -2.623405, 1, 1, 1, 1, 1,
-0.09152859, -0.3188597, -1.377675, 1, 1, 1, 1, 1,
-0.08910786, 1.32225, -0.4351805, 1, 1, 1, 1, 1,
-0.08907792, -0.7965059, -2.265442, 1, 1, 1, 1, 1,
-0.08898961, 1.263194, -1.361263, 1, 1, 1, 1, 1,
-0.08845868, 0.376593, -1.366789, 1, 1, 1, 1, 1,
-0.08743313, 0.6034467, 0.8265533, 1, 1, 1, 1, 1,
-0.08414164, 0.1475228, -2.45314, 1, 1, 1, 1, 1,
-0.08297315, -0.2636269, -1.763728, 1, 1, 1, 1, 1,
-0.08293231, 0.8991436, 1.489192, 1, 1, 1, 1, 1,
-0.08285975, -0.6309924, -2.647781, 0, 0, 1, 1, 1,
-0.08032462, -0.4458759, -2.961285, 1, 0, 0, 1, 1,
-0.07793925, 0.5456339, 0.3110627, 1, 0, 0, 1, 1,
-0.07772563, -0.234449, -2.457954, 1, 0, 0, 1, 1,
-0.07713872, -1.02127, -3.854223, 1, 0, 0, 1, 1,
-0.07667264, -0.623502, -1.439227, 1, 0, 0, 1, 1,
-0.07350793, 1.008436, -0.9198173, 0, 0, 0, 1, 1,
-0.07129607, 0.5951079, -0.5905862, 0, 0, 0, 1, 1,
-0.07047251, -1.349333, -2.119244, 0, 0, 0, 1, 1,
-0.06911488, 1.151855, 0.4244166, 0, 0, 0, 1, 1,
-0.06693387, -0.6941953, -1.453453, 0, 0, 0, 1, 1,
-0.06587726, -2.000864, -3.236369, 0, 0, 0, 1, 1,
-0.06586618, 0.6006844, -2.007313, 0, 0, 0, 1, 1,
-0.06577907, -1.098365, -3.55243, 1, 1, 1, 1, 1,
-0.06512532, 0.8823621, -0.7887515, 1, 1, 1, 1, 1,
-0.06410817, 0.7714933, 0.5849339, 1, 1, 1, 1, 1,
-0.06179514, 2.144346, -0.6598851, 1, 1, 1, 1, 1,
-0.06146481, 0.07012083, -1.906594, 1, 1, 1, 1, 1,
-0.05970088, 0.8343225, 0.01449773, 1, 1, 1, 1, 1,
-0.05266607, 1.289147, 0.5467666, 1, 1, 1, 1, 1,
-0.05103594, -0.5967548, -3.141674, 1, 1, 1, 1, 1,
-0.04807411, 2.08475, -0.9288269, 1, 1, 1, 1, 1,
-0.04242387, 0.2302032, 0.5303044, 1, 1, 1, 1, 1,
-0.03616939, 1.307692, -1.041816, 1, 1, 1, 1, 1,
-0.03558363, 1.458942, -0.2194705, 1, 1, 1, 1, 1,
-0.03310187, -0.1822383, -2.812427, 1, 1, 1, 1, 1,
-0.03155202, -0.599232, -3.671882, 1, 1, 1, 1, 1,
-0.03065763, 0.3733951, -1.354023, 1, 1, 1, 1, 1,
-0.02570729, -0.1562886, -2.900571, 0, 0, 1, 1, 1,
-0.02220965, -1.799649, -3.480663, 1, 0, 0, 1, 1,
-0.02164611, 0.454846, -0.3256308, 1, 0, 0, 1, 1,
-0.01960381, 0.2145286, 0.3682113, 1, 0, 0, 1, 1,
-0.01538616, 0.3771016, 0.1041366, 1, 0, 0, 1, 1,
-0.01494244, 1.127887, 0.1978816, 1, 0, 0, 1, 1,
-0.01360075, -0.4565416, -4.051745, 0, 0, 0, 1, 1,
-0.01224705, 0.07212688, -0.2722941, 0, 0, 0, 1, 1,
-0.0115226, -1.960629, -3.32295, 0, 0, 0, 1, 1,
-0.01107626, -0.1438014, -1.358506, 0, 0, 0, 1, 1,
-0.01030915, -1.413044, -5.68609, 0, 0, 0, 1, 1,
-0.008817215, -1.680228, -4.400462, 0, 0, 0, 1, 1,
-0.008620001, 0.6689664, -0.6523046, 0, 0, 0, 1, 1,
-0.007834228, -0.06349085, -2.914508, 1, 1, 1, 1, 1,
-0.003985029, -0.3768231, -4.144464, 1, 1, 1, 1, 1,
-0.003017254, 0.5718171, 2.473794, 1, 1, 1, 1, 1,
-0.00260754, -0.3051291, -2.678532, 1, 1, 1, 1, 1,
-0.001639007, 0.5738721, -0.5951402, 1, 1, 1, 1, 1,
0.0001664052, 0.2739373, 1.32755, 1, 1, 1, 1, 1,
0.001759791, -1.308824, 4.320472, 1, 1, 1, 1, 1,
0.003157568, -0.4092052, 3.611432, 1, 1, 1, 1, 1,
0.003796469, 1.277607, 0.9313059, 1, 1, 1, 1, 1,
0.00392715, 0.329152, -0.2745207, 1, 1, 1, 1, 1,
0.01300001, -2.019428, 1.734371, 1, 1, 1, 1, 1,
0.0145771, -2.268888, 1.64902, 1, 1, 1, 1, 1,
0.01573785, -0.3300129, 3.874279, 1, 1, 1, 1, 1,
0.01811762, -1.888351, 2.745691, 1, 1, 1, 1, 1,
0.01987482, -1.662997, 2.3513, 1, 1, 1, 1, 1,
0.02074675, 0.3788865, 0.006935371, 0, 0, 1, 1, 1,
0.02100627, -0.06903443, 3.606176, 1, 0, 0, 1, 1,
0.02443332, 0.4259046, 0.5613171, 1, 0, 0, 1, 1,
0.02752033, 0.222316, -0.2670977, 1, 0, 0, 1, 1,
0.03724124, -0.1413501, 1.853164, 1, 0, 0, 1, 1,
0.03790287, -0.536829, 2.644565, 1, 0, 0, 1, 1,
0.03999485, 1.733501, -1.258454, 0, 0, 0, 1, 1,
0.04361198, 1.572458, -0.8265061, 0, 0, 0, 1, 1,
0.04425139, 0.7433648, 0.6854085, 0, 0, 0, 1, 1,
0.04552281, 0.8876826, 0.2648554, 0, 0, 0, 1, 1,
0.06085604, -1.672175, 4.741065, 0, 0, 0, 1, 1,
0.06117108, -0.2800193, 3.867038, 0, 0, 0, 1, 1,
0.06225287, 0.1792987, -1.192259, 0, 0, 0, 1, 1,
0.06489388, -0.8250822, 3.039697, 1, 1, 1, 1, 1,
0.06622284, -0.8206965, 1.826864, 1, 1, 1, 1, 1,
0.06681556, 0.6679966, 0.38054, 1, 1, 1, 1, 1,
0.06704018, -1.2464, 2.321281, 1, 1, 1, 1, 1,
0.0686003, 0.06741578, 1.513694, 1, 1, 1, 1, 1,
0.06890627, -1.487234, 3.389518, 1, 1, 1, 1, 1,
0.07107995, 0.2803399, -0.855127, 1, 1, 1, 1, 1,
0.07352422, 0.2827166, 0.4959362, 1, 1, 1, 1, 1,
0.07764514, 0.6195789, 0.4751116, 1, 1, 1, 1, 1,
0.08211875, -1.290117, 2.770089, 1, 1, 1, 1, 1,
0.0827915, 0.5551383, 1.189056, 1, 1, 1, 1, 1,
0.08782388, -0.05240647, 3.178461, 1, 1, 1, 1, 1,
0.08876987, -0.6210286, 3.156274, 1, 1, 1, 1, 1,
0.08975665, -2.231507, 2.365489, 1, 1, 1, 1, 1,
0.09368604, 0.6862645, 2.00387, 1, 1, 1, 1, 1,
0.0979766, -0.3618791, 0.3353272, 0, 0, 1, 1, 1,
0.09929362, 1.310819, 0.5942026, 1, 0, 0, 1, 1,
0.09944674, -0.09266705, 1.098948, 1, 0, 0, 1, 1,
0.102147, -0.2490982, 1.729412, 1, 0, 0, 1, 1,
0.1030496, 0.4846429, 0.2167311, 1, 0, 0, 1, 1,
0.1064425, 1.694742, 0.7763061, 1, 0, 0, 1, 1,
0.1083274, -1.33752, 1.282056, 0, 0, 0, 1, 1,
0.1105278, -1.67109, 2.123846, 0, 0, 0, 1, 1,
0.1141916, -0.7597416, 2.961837, 0, 0, 0, 1, 1,
0.1142634, 0.2666767, -0.1082927, 0, 0, 0, 1, 1,
0.116211, -1.378715, 4.191401, 0, 0, 0, 1, 1,
0.1168056, 0.9150888, -0.8572683, 0, 0, 0, 1, 1,
0.1284175, 0.5601524, -1.507901, 0, 0, 0, 1, 1,
0.1294753, -0.1202916, 3.689815, 1, 1, 1, 1, 1,
0.1313915, 0.3110983, 0.6457687, 1, 1, 1, 1, 1,
0.1331965, 0.7276612, 0.8832266, 1, 1, 1, 1, 1,
0.1356502, 0.4389683, 0.6379684, 1, 1, 1, 1, 1,
0.1363406, -1.597189, 1.487697, 1, 1, 1, 1, 1,
0.1383324, -0.7594765, 3.848356, 1, 1, 1, 1, 1,
0.1398563, -0.9300065, 4.417109, 1, 1, 1, 1, 1,
0.1427708, -1.564949, 3.15174, 1, 1, 1, 1, 1,
0.1461003, 0.7060158, 1.360387, 1, 1, 1, 1, 1,
0.1510597, -0.7620891, 1.148088, 1, 1, 1, 1, 1,
0.1517395, -0.8387008, 2.52314, 1, 1, 1, 1, 1,
0.155185, -0.362851, 2.366133, 1, 1, 1, 1, 1,
0.1578028, 0.2513785, 0.7448196, 1, 1, 1, 1, 1,
0.1634173, 0.6667036, 0.4063083, 1, 1, 1, 1, 1,
0.1651672, -1.178782, 4.794597, 1, 1, 1, 1, 1,
0.1774508, 0.4754006, -0.06879372, 0, 0, 1, 1, 1,
0.1777747, 0.9918531, 0.103364, 1, 0, 0, 1, 1,
0.1803215, 0.6592594, 0.7542369, 1, 0, 0, 1, 1,
0.1814307, 0.141751, 0.08726416, 1, 0, 0, 1, 1,
0.1887946, -0.4061885, 2.391968, 1, 0, 0, 1, 1,
0.1902418, -0.9595686, 3.387426, 1, 0, 0, 1, 1,
0.1914746, -1.624197, 2.672767, 0, 0, 0, 1, 1,
0.193377, -1.398506, 3.072358, 0, 0, 0, 1, 1,
0.1941876, -0.3183843, 4.018203, 0, 0, 0, 1, 1,
0.1975204, 0.05883377, 2.907392, 0, 0, 0, 1, 1,
0.1977491, 0.4269753, 1.180725, 0, 0, 0, 1, 1,
0.2017266, 0.3494453, 1.147675, 0, 0, 0, 1, 1,
0.2078136, -0.1273237, 1.067459, 0, 0, 0, 1, 1,
0.2080611, 0.3283127, -0.2584712, 1, 1, 1, 1, 1,
0.2125204, -0.4338291, 3.265373, 1, 1, 1, 1, 1,
0.2169242, 1.105894, -1.241292, 1, 1, 1, 1, 1,
0.2169606, 1.114434, 1.209632, 1, 1, 1, 1, 1,
0.2181429, -0.9216523, 4.311318, 1, 1, 1, 1, 1,
0.2188349, 0.03151551, 1.729311, 1, 1, 1, 1, 1,
0.2216241, 0.1114294, 0.9152957, 1, 1, 1, 1, 1,
0.2231839, 0.1716819, 3.748305, 1, 1, 1, 1, 1,
0.2264413, -0.4755289, 2.459659, 1, 1, 1, 1, 1,
0.2298196, 0.7459769, 1.317945, 1, 1, 1, 1, 1,
0.2304069, -1.315781, 2.353931, 1, 1, 1, 1, 1,
0.2328463, -0.9131924, 3.284528, 1, 1, 1, 1, 1,
0.2345039, -0.1743539, 2.186185, 1, 1, 1, 1, 1,
0.2370607, 1.04437, -0.5154662, 1, 1, 1, 1, 1,
0.2386233, 0.6513242, 0.01386295, 1, 1, 1, 1, 1,
0.2461049, -1.01371, 2.333872, 0, 0, 1, 1, 1,
0.2496239, -0.2278101, 2.407246, 1, 0, 0, 1, 1,
0.2536053, 1.123266, -0.1113209, 1, 0, 0, 1, 1,
0.2550407, 0.2369941, 1.411965, 1, 0, 0, 1, 1,
0.2667476, -1.406593, 3.463703, 1, 0, 0, 1, 1,
0.2681392, 0.1641248, -0.1994183, 1, 0, 0, 1, 1,
0.2708261, 1.373679, -0.7292818, 0, 0, 0, 1, 1,
0.273794, 2.526624, 0.8124881, 0, 0, 0, 1, 1,
0.2759409, 0.4715101, 1.459139, 0, 0, 0, 1, 1,
0.2764727, 0.3394765, 0.9474556, 0, 0, 0, 1, 1,
0.277487, 0.04071092, 0.9812427, 0, 0, 0, 1, 1,
0.2777066, 0.7865729, -0.8497717, 0, 0, 0, 1, 1,
0.2804988, -0.05116795, 0.7767089, 0, 0, 0, 1, 1,
0.2820454, 0.3456087, 0.691753, 1, 1, 1, 1, 1,
0.2904591, -0.6826377, 3.859984, 1, 1, 1, 1, 1,
0.2907614, -0.1477069, 3.093692, 1, 1, 1, 1, 1,
0.296021, 0.5976062, 0.3351313, 1, 1, 1, 1, 1,
0.2978062, 0.3702145, 0.1382129, 1, 1, 1, 1, 1,
0.3066148, -2.071675, 2.31183, 1, 1, 1, 1, 1,
0.3068379, -0.5795084, 4.182786, 1, 1, 1, 1, 1,
0.3079372, 1.419492, -1.189634, 1, 1, 1, 1, 1,
0.3080201, -0.08762869, 2.980888, 1, 1, 1, 1, 1,
0.3094925, -0.4016028, 3.213535, 1, 1, 1, 1, 1,
0.3121199, 1.432407, -0.2554435, 1, 1, 1, 1, 1,
0.3136049, 0.8509404, 0.8357643, 1, 1, 1, 1, 1,
0.3154222, 0.05924315, 0.4281159, 1, 1, 1, 1, 1,
0.31888, 0.7263302, -0.4615403, 1, 1, 1, 1, 1,
0.3191835, -1.257547, 4.130328, 1, 1, 1, 1, 1,
0.3201916, -0.316655, 2.393577, 0, 0, 1, 1, 1,
0.3281865, -0.4989172, 3.176579, 1, 0, 0, 1, 1,
0.3320167, -0.0089519, -0.3031055, 1, 0, 0, 1, 1,
0.3323212, -1.034396, 3.071131, 1, 0, 0, 1, 1,
0.3327134, -0.7876666, 2.26988, 1, 0, 0, 1, 1,
0.3342773, -2.563745, 4.35971, 1, 0, 0, 1, 1,
0.3343956, -1.783906, 4.09452, 0, 0, 0, 1, 1,
0.3370401, 0.377943, 2.645994, 0, 0, 0, 1, 1,
0.3397522, 0.8023118, 1.355152, 0, 0, 0, 1, 1,
0.3475815, 0.2695223, 1.232755, 0, 0, 0, 1, 1,
0.3478552, 0.8131346, -1.276842, 0, 0, 0, 1, 1,
0.3480958, -0.2771688, 1.787878, 0, 0, 0, 1, 1,
0.3489999, 0.1133413, 0.3227607, 0, 0, 0, 1, 1,
0.3495773, 1.950546, -0.05691987, 1, 1, 1, 1, 1,
0.3541456, 0.1997441, 1.229397, 1, 1, 1, 1, 1,
0.3559874, -0.2358647, 3.286698, 1, 1, 1, 1, 1,
0.3582008, 1.514526, -2.268988, 1, 1, 1, 1, 1,
0.3598197, -0.2905179, 3.226761, 1, 1, 1, 1, 1,
0.3603652, -0.1334696, 1.787462, 1, 1, 1, 1, 1,
0.3609673, -0.8171133, 5.438628, 1, 1, 1, 1, 1,
0.361849, -0.1323829, 2.754267, 1, 1, 1, 1, 1,
0.3641949, 0.5534005, 0.1662606, 1, 1, 1, 1, 1,
0.3646055, 1.379179, -0.5164945, 1, 1, 1, 1, 1,
0.3664374, -1.192518, 3.968251, 1, 1, 1, 1, 1,
0.3790539, -0.1396238, 0.6569474, 1, 1, 1, 1, 1,
0.3846898, -1.985746, 1.408512, 1, 1, 1, 1, 1,
0.3895731, 0.4230904, 0.2284137, 1, 1, 1, 1, 1,
0.3899409, 0.3951749, 0.7592744, 1, 1, 1, 1, 1,
0.3911971, -1.558419, 4.562967, 0, 0, 1, 1, 1,
0.3952048, -0.4963781, 2.090386, 1, 0, 0, 1, 1,
0.3953531, 0.905609, 1.218935, 1, 0, 0, 1, 1,
0.4012775, -1.471874, 3.296032, 1, 0, 0, 1, 1,
0.4039545, -0.6190114, 2.458758, 1, 0, 0, 1, 1,
0.4050283, 0.4203245, 1.591813, 1, 0, 0, 1, 1,
0.4060424, -1.638623, 2.238252, 0, 0, 0, 1, 1,
0.4083122, 0.1664562, 2.950107, 0, 0, 0, 1, 1,
0.4087428, -1.090915, 2.151536, 0, 0, 0, 1, 1,
0.4103451, 0.1692333, 0.7680651, 0, 0, 0, 1, 1,
0.4162984, -1.453964, 2.54592, 0, 0, 0, 1, 1,
0.4189863, -0.2910184, 1.511173, 0, 0, 0, 1, 1,
0.4245283, -0.04405253, 1.305972, 0, 0, 0, 1, 1,
0.4279879, -1.520174, 2.986023, 1, 1, 1, 1, 1,
0.433301, -0.7910915, 2.569821, 1, 1, 1, 1, 1,
0.4347569, 2.821245, 0.02071963, 1, 1, 1, 1, 1,
0.4386232, -0.8206293, 1.810803, 1, 1, 1, 1, 1,
0.4424204, -3.074267, 2.286349, 1, 1, 1, 1, 1,
0.4432288, -0.3713955, 2.756142, 1, 1, 1, 1, 1,
0.4479388, 0.9104293, 0.9329544, 1, 1, 1, 1, 1,
0.4488395, 0.9388676, -0.9832639, 1, 1, 1, 1, 1,
0.4531795, -0.4433391, 3.326869, 1, 1, 1, 1, 1,
0.4564181, -0.4897891, 2.426837, 1, 1, 1, 1, 1,
0.4590154, -0.9131389, 2.544592, 1, 1, 1, 1, 1,
0.4693946, 0.1647626, 1.358568, 1, 1, 1, 1, 1,
0.4699061, 2.148946, 0.3680459, 1, 1, 1, 1, 1,
0.4718686, 0.2075492, 1.707404, 1, 1, 1, 1, 1,
0.4728592, 1.204781, -1.078157, 1, 1, 1, 1, 1,
0.4729311, -1.310375, 2.45516, 0, 0, 1, 1, 1,
0.4730068, 0.5792084, 1.143355, 1, 0, 0, 1, 1,
0.4738902, 0.5108439, 3.771549, 1, 0, 0, 1, 1,
0.4774192, 0.6049173, -0.1358907, 1, 0, 0, 1, 1,
0.4804216, 1.887095, 0.1783282, 1, 0, 0, 1, 1,
0.4808355, -0.2016361, 0.8051498, 1, 0, 0, 1, 1,
0.4869116, -0.6455393, 1.783993, 0, 0, 0, 1, 1,
0.487094, 2.236311, 0.6567006, 0, 0, 0, 1, 1,
0.4871095, 0.9066544, -1.048732, 0, 0, 0, 1, 1,
0.4880344, 0.4617219, -0.6312022, 0, 0, 0, 1, 1,
0.4883286, -0.03811261, 0.4246235, 0, 0, 0, 1, 1,
0.4894254, -0.0215863, 2.14099, 0, 0, 0, 1, 1,
0.5016974, 0.1864284, 2.972363, 0, 0, 0, 1, 1,
0.502658, 0.3709675, 1.040481, 1, 1, 1, 1, 1,
0.5038686, 0.5923597, 0.05107684, 1, 1, 1, 1, 1,
0.5045525, 0.6650473, 0.3986784, 1, 1, 1, 1, 1,
0.5050362, -1.387788, 1.591758, 1, 1, 1, 1, 1,
0.5063248, -0.1756374, 1.994924, 1, 1, 1, 1, 1,
0.5090814, 0.5548988, 1.225765, 1, 1, 1, 1, 1,
0.5211612, 0.8791708, -0.3569811, 1, 1, 1, 1, 1,
0.5276797, 2.609004, 0.1632904, 1, 1, 1, 1, 1,
0.5285925, -0.7346342, 2.656067, 1, 1, 1, 1, 1,
0.5351349, 0.06820685, 2.896228, 1, 1, 1, 1, 1,
0.5380774, 1.355145, 0.1699238, 1, 1, 1, 1, 1,
0.5389783, -0.5527215, 2.200612, 1, 1, 1, 1, 1,
0.5419725, 0.5422333, 0.9539585, 1, 1, 1, 1, 1,
0.5431097, 0.5029328, 0.943633, 1, 1, 1, 1, 1,
0.5461769, 1.209307, -0.2136798, 1, 1, 1, 1, 1,
0.5474555, -0.2848625, 1.958014, 0, 0, 1, 1, 1,
0.5507929, -1.641775, 2.646408, 1, 0, 0, 1, 1,
0.551432, 0.0381084, 0.4316371, 1, 0, 0, 1, 1,
0.5525829, 0.9003888, 0.4389029, 1, 0, 0, 1, 1,
0.5539028, 1.427541, 0.9340478, 1, 0, 0, 1, 1,
0.5547531, 0.4257757, 1.546195, 1, 0, 0, 1, 1,
0.5557441, -0.1441348, 2.370549, 0, 0, 0, 1, 1,
0.5574983, -0.3263643, 2.925147, 0, 0, 0, 1, 1,
0.5678359, -1.305389, 1.904297, 0, 0, 0, 1, 1,
0.569401, 0.1695781, -0.3061384, 0, 0, 0, 1, 1,
0.572941, -0.1354074, 2.405481, 0, 0, 0, 1, 1,
0.5775256, 0.4164425, 0.985016, 0, 0, 0, 1, 1,
0.5783752, 0.3711793, 1.842795, 0, 0, 0, 1, 1,
0.5816618, -0.3845565, 2.934274, 1, 1, 1, 1, 1,
0.5845925, 2.156005, -0.2614256, 1, 1, 1, 1, 1,
0.5864162, -0.7422748, 1.1652, 1, 1, 1, 1, 1,
0.5882728, 0.237635, -1.076099, 1, 1, 1, 1, 1,
0.5906506, 0.1924674, -0.9945123, 1, 1, 1, 1, 1,
0.5924921, 0.5211172, 1.240029, 1, 1, 1, 1, 1,
0.5939489, 0.9537365, -0.3447868, 1, 1, 1, 1, 1,
0.5956818, 1.070902, 1.20134, 1, 1, 1, 1, 1,
0.5966893, 0.7737993, 1.02459, 1, 1, 1, 1, 1,
0.5982848, -0.3514052, 1.635932, 1, 1, 1, 1, 1,
0.5984098, -0.6560893, 1.172293, 1, 1, 1, 1, 1,
0.6005783, -0.9753049, 1.609447, 1, 1, 1, 1, 1,
0.6016678, -1.025928, 1.427084, 1, 1, 1, 1, 1,
0.6023819, 0.04874164, 0.03420777, 1, 1, 1, 1, 1,
0.6030953, 0.6772121, -1.249994, 1, 1, 1, 1, 1,
0.6112867, 0.8361508, -0.2077346, 0, 0, 1, 1, 1,
0.6201187, -1.060053, 2.530066, 1, 0, 0, 1, 1,
0.6238872, 0.9963575, 0.7411115, 1, 0, 0, 1, 1,
0.6268767, -1.243404, 3.983745, 1, 0, 0, 1, 1,
0.6319005, -0.381959, 1.511946, 1, 0, 0, 1, 1,
0.6324378, 0.4942111, 0.401605, 1, 0, 0, 1, 1,
0.6372041, 0.7293646, 0.2663981, 0, 0, 0, 1, 1,
0.6398323, 0.5694416, 1.18412, 0, 0, 0, 1, 1,
0.6413546, 0.09096903, 1.03852, 0, 0, 0, 1, 1,
0.6417897, -1.72883, 1.275021, 0, 0, 0, 1, 1,
0.6473687, -0.1417499, 1.577635, 0, 0, 0, 1, 1,
0.6501706, 1.610737, 0.9496047, 0, 0, 0, 1, 1,
0.6509707, 0.4570608, 0.9151721, 0, 0, 0, 1, 1,
0.6527325, -0.5971349, 3.783995, 1, 1, 1, 1, 1,
0.6531477, 0.7035735, 0.06005105, 1, 1, 1, 1, 1,
0.6560144, -0.2317408, 0.9418779, 1, 1, 1, 1, 1,
0.663742, -1.009985, 0.3188441, 1, 1, 1, 1, 1,
0.6638857, 1.135123, -1.065594, 1, 1, 1, 1, 1,
0.6680279, -0.02272909, 0.929571, 1, 1, 1, 1, 1,
0.6717134, 0.7265465, 1.298266, 1, 1, 1, 1, 1,
0.6753386, 0.6623532, 0.8920239, 1, 1, 1, 1, 1,
0.6791922, 0.2678239, 0.8085872, 1, 1, 1, 1, 1,
0.6847838, 0.1064052, 1.613764, 1, 1, 1, 1, 1,
0.6856577, -1.489849, 2.352046, 1, 1, 1, 1, 1,
0.6875508, -0.1752078, 2.684217, 1, 1, 1, 1, 1,
0.6911526, 1.270501, -0.9247357, 1, 1, 1, 1, 1,
0.6960301, 1.633341, 1.316388, 1, 1, 1, 1, 1,
0.6968781, -1.172702, 2.753972, 1, 1, 1, 1, 1,
0.6982893, -0.08336672, 1.088324, 0, 0, 1, 1, 1,
0.7023115, -1.774672, 3.533743, 1, 0, 0, 1, 1,
0.7069962, -1.410767, 3.516022, 1, 0, 0, 1, 1,
0.7075365, -1.28578, 3.16511, 1, 0, 0, 1, 1,
0.716433, 0.637248, 1.253939, 1, 0, 0, 1, 1,
0.7165063, 0.5062146, 2.128429, 1, 0, 0, 1, 1,
0.7181883, -0.6408668, 2.688184, 0, 0, 0, 1, 1,
0.720359, 2.032971, 1.587254, 0, 0, 0, 1, 1,
0.7208838, -0.6827292, 1.452827, 0, 0, 0, 1, 1,
0.7215526, -0.3743229, 1.948761, 0, 0, 0, 1, 1,
0.7239394, -0.6264021, 2.732328, 0, 0, 0, 1, 1,
0.7262204, 1.479166, 1.333803, 0, 0, 0, 1, 1,
0.7321661, 0.2375563, 0.7022108, 0, 0, 0, 1, 1,
0.7326061, 1.462428, 0.5130935, 1, 1, 1, 1, 1,
0.7441712, 0.7543536, 0.4469134, 1, 1, 1, 1, 1,
0.7451763, -1.805636, 1.385753, 1, 1, 1, 1, 1,
0.7501948, -0.824868, 1.381715, 1, 1, 1, 1, 1,
0.7535321, -1.314362, 1.78984, 1, 1, 1, 1, 1,
0.7553709, -0.7254058, 2.086562, 1, 1, 1, 1, 1,
0.7640968, -0.7684779, 3.051962, 1, 1, 1, 1, 1,
0.7689192, 0.5788133, 1.383356, 1, 1, 1, 1, 1,
0.7786953, 0.03782229, 2.051228, 1, 1, 1, 1, 1,
0.7844853, 0.5953178, 0.4947515, 1, 1, 1, 1, 1,
0.7908833, -0.302875, 0.8502052, 1, 1, 1, 1, 1,
0.7932716, -0.9029592, 3.248186, 1, 1, 1, 1, 1,
0.7943214, -1.414984, 0.3519374, 1, 1, 1, 1, 1,
0.7981556, -1.189862, 1.866634, 1, 1, 1, 1, 1,
0.8002665, 0.02942372, 0.6929165, 1, 1, 1, 1, 1,
0.8030313, 0.5036939, 1.744356, 0, 0, 1, 1, 1,
0.8052324, 0.02888788, 2.573513, 1, 0, 0, 1, 1,
0.8120718, 0.4467029, 1.26828, 1, 0, 0, 1, 1,
0.8169526, -2.654048, 3.914829, 1, 0, 0, 1, 1,
0.8177519, 0.4232306, 1.392097, 1, 0, 0, 1, 1,
0.8182759, -1.583003, 2.06502, 1, 0, 0, 1, 1,
0.8189069, -0.2859015, 2.110561, 0, 0, 0, 1, 1,
0.8223211, 0.2015504, 1.892963, 0, 0, 0, 1, 1,
0.824072, -0.0163666, 1.277366, 0, 0, 0, 1, 1,
0.8263501, -0.2560069, 1.405328, 0, 0, 0, 1, 1,
0.8352485, -0.4686846, 3.081579, 0, 0, 0, 1, 1,
0.8354957, 0.8408698, 3.330884, 0, 0, 0, 1, 1,
0.8383908, -0.1313443, 1.695304, 0, 0, 0, 1, 1,
0.8384283, -0.1600174, 0.0238377, 1, 1, 1, 1, 1,
0.8430277, 1.473676, -0.3005587, 1, 1, 1, 1, 1,
0.845769, 0.3221365, 1.168574, 1, 1, 1, 1, 1,
0.8458557, -1.300648, 2.019212, 1, 1, 1, 1, 1,
0.8465222, -1.350353, 3.377469, 1, 1, 1, 1, 1,
0.8478917, -0.904897, 1.283455, 1, 1, 1, 1, 1,
0.8505118, -0.7166269, 2.945367, 1, 1, 1, 1, 1,
0.8527563, 0.8770425, 1.025655, 1, 1, 1, 1, 1,
0.8582538, 1.914026, 0.2965377, 1, 1, 1, 1, 1,
0.859453, -1.374703, 1.474295, 1, 1, 1, 1, 1,
0.8605859, -0.0245769, 1.123419, 1, 1, 1, 1, 1,
0.8741112, -2.660961, 2.139699, 1, 1, 1, 1, 1,
0.8791828, 0.5090486, 1.891043, 1, 1, 1, 1, 1,
0.8803302, -0.4708209, 0.5759943, 1, 1, 1, 1, 1,
0.8838684, 0.8309703, 1.640216, 1, 1, 1, 1, 1,
0.885737, 0.1082102, 1.438852, 0, 0, 1, 1, 1,
0.8882354, 0.7660146, 1.001695, 1, 0, 0, 1, 1,
0.8921236, -2.166753, 0.6192012, 1, 0, 0, 1, 1,
0.8934466, 0.1326613, 1.770429, 1, 0, 0, 1, 1,
0.894738, 0.7950193, 0.6009693, 1, 0, 0, 1, 1,
0.8982955, -0.7218058, 0.7918389, 1, 0, 0, 1, 1,
0.9003062, 1.75221, 1.866076, 0, 0, 0, 1, 1,
0.9018667, -0.6331162, 1.943636, 0, 0, 0, 1, 1,
0.9019859, 1.362299, 2.125707, 0, 0, 0, 1, 1,
0.9093969, 0.7759824, 1.18709, 0, 0, 0, 1, 1,
0.9110153, -1.852846, 2.496441, 0, 0, 0, 1, 1,
0.9158486, 0.4689009, 0.4646668, 0, 0, 0, 1, 1,
0.924249, -1.32463, 2.606185, 0, 0, 0, 1, 1,
0.9273837, -0.277702, 3.252613, 1, 1, 1, 1, 1,
0.9301503, 0.4112393, 1.796756, 1, 1, 1, 1, 1,
0.9302376, 1.194335, 0.8937046, 1, 1, 1, 1, 1,
0.9353716, 0.4778781, 1.767957, 1, 1, 1, 1, 1,
0.9384443, -0.1999144, 1.65264, 1, 1, 1, 1, 1,
0.9387191, -0.2487662, 2.57707, 1, 1, 1, 1, 1,
0.9462265, -0.8121447, 2.244304, 1, 1, 1, 1, 1,
0.9519756, -1.336516, 1.611822, 1, 1, 1, 1, 1,
0.9595698, 0.7247663, 0.07344002, 1, 1, 1, 1, 1,
0.9605328, -0.4263761, 2.731146, 1, 1, 1, 1, 1,
0.9680193, 0.373562, 1.032723, 1, 1, 1, 1, 1,
0.9709303, -1.060175, 0.115745, 1, 1, 1, 1, 1,
0.9726576, -1.026374, 3.879529, 1, 1, 1, 1, 1,
0.9788963, 0.2565211, 2.02413, 1, 1, 1, 1, 1,
0.9887841, -1.138268, 2.486303, 1, 1, 1, 1, 1,
0.9918793, -0.3690481, 1.39804, 0, 0, 1, 1, 1,
0.9981501, 0.2823004, -1.281723, 1, 0, 0, 1, 1,
0.9989285, 0.02830384, 1.351885, 1, 0, 0, 1, 1,
1.00728, 1.068316, -0.2755396, 1, 0, 0, 1, 1,
1.010159, 0.2627047, 0.5851777, 1, 0, 0, 1, 1,
1.016082, -0.6834084, 2.843435, 1, 0, 0, 1, 1,
1.019043, -1.003608, 3.6359, 0, 0, 0, 1, 1,
1.02197, -0.008910743, 1.34765, 0, 0, 0, 1, 1,
1.024113, 1.485039, 1.809005, 0, 0, 0, 1, 1,
1.024805, -0.7224741, 1.892529, 0, 0, 0, 1, 1,
1.030937, -1.544012, 4.48082, 0, 0, 0, 1, 1,
1.031041, -0.5661498, 2.111568, 0, 0, 0, 1, 1,
1.035742, 0.238503, 1.704893, 0, 0, 0, 1, 1,
1.039192, 0.9865242, -0.1932391, 1, 1, 1, 1, 1,
1.040512, -1.577891, 3.583157, 1, 1, 1, 1, 1,
1.043045, -1.87183, 3.279509, 1, 1, 1, 1, 1,
1.043379, -1.329326, 0.4080355, 1, 1, 1, 1, 1,
1.046006, 0.8443284, 0.06158158, 1, 1, 1, 1, 1,
1.05343, -0.2526379, 2.536896, 1, 1, 1, 1, 1,
1.061495, 0.1758296, 1.158916, 1, 1, 1, 1, 1,
1.068401, -0.007473341, 0.2205591, 1, 1, 1, 1, 1,
1.069259, 0.942896, 1.084566, 1, 1, 1, 1, 1,
1.073349, 1.501729, 1.478235, 1, 1, 1, 1, 1,
1.08479, 1.127511, 0.2902839, 1, 1, 1, 1, 1,
1.089574, 1.652104, 2.344998, 1, 1, 1, 1, 1,
1.090133, -1.854324, 2.036544, 1, 1, 1, 1, 1,
1.09108, -0.6584449, 1.789469, 1, 1, 1, 1, 1,
1.092618, 1.045964, -0.4984594, 1, 1, 1, 1, 1,
1.095228, 0.9293616, 2.116337, 0, 0, 1, 1, 1,
1.095646, 2.231062, 1.011854, 1, 0, 0, 1, 1,
1.100716, 1.256383, -0.1719285, 1, 0, 0, 1, 1,
1.10654, 2.522925, 1.724959, 1, 0, 0, 1, 1,
1.107736, -1.257848, 1.800008, 1, 0, 0, 1, 1,
1.113644, 0.8629885, -2.0328, 1, 0, 0, 1, 1,
1.115549, 0.4979425, 2.530435, 0, 0, 0, 1, 1,
1.126798, 1.246534, 1.670513, 0, 0, 0, 1, 1,
1.135381, -0.6564155, 1.606405, 0, 0, 0, 1, 1,
1.139584, -0.1579442, 3.975853, 0, 0, 0, 1, 1,
1.148085, -0.3538527, 0.9357553, 0, 0, 0, 1, 1,
1.159402, 1.679629, 1.140302, 0, 0, 0, 1, 1,
1.160211, 1.550971, 0.3106323, 0, 0, 0, 1, 1,
1.163721, -2.738878, 4.104495, 1, 1, 1, 1, 1,
1.163803, -1.698016, 1.322473, 1, 1, 1, 1, 1,
1.169886, 0.5471454, 0.6451196, 1, 1, 1, 1, 1,
1.172188, 0.897847, 0.7708614, 1, 1, 1, 1, 1,
1.173024, -1.198251, 1.827216, 1, 1, 1, 1, 1,
1.177402, 0.9662675, 0.4313511, 1, 1, 1, 1, 1,
1.180669, 1.081716, 1.261078, 1, 1, 1, 1, 1,
1.184446, -0.208476, 3.256269, 1, 1, 1, 1, 1,
1.189492, 0.2878291, 2.95004, 1, 1, 1, 1, 1,
1.191886, -0.4772208, 2.208299, 1, 1, 1, 1, 1,
1.192749, 0.5139269, 0.8424428, 1, 1, 1, 1, 1,
1.19316, -0.7418977, 1.108698, 1, 1, 1, 1, 1,
1.195384, 0.5940214, 0.444966, 1, 1, 1, 1, 1,
1.208765, 0.1006454, 0.5837731, 1, 1, 1, 1, 1,
1.215914, 0.06950366, 1.628112, 1, 1, 1, 1, 1,
1.218367, 0.6747618, 3.259519, 0, 0, 1, 1, 1,
1.218923, -1.124021, 1.963464, 1, 0, 0, 1, 1,
1.226777, -1.522243, 3.337151, 1, 0, 0, 1, 1,
1.234443, 0.06326961, 1.946112, 1, 0, 0, 1, 1,
1.240837, -0.3904583, 2.490483, 1, 0, 0, 1, 1,
1.246729, 0.2519089, 0.7244781, 1, 0, 0, 1, 1,
1.248897, 1.767494, 0.9140789, 0, 0, 0, 1, 1,
1.271757, 0.1542802, 3.59498, 0, 0, 0, 1, 1,
1.276733, -0.2582143, 1.825856, 0, 0, 0, 1, 1,
1.276794, -0.4266236, 1.566675, 0, 0, 0, 1, 1,
1.28488, -1.589329, 2.740593, 0, 0, 0, 1, 1,
1.287832, 1.291142, 1.274822, 0, 0, 0, 1, 1,
1.289891, -0.2942728, 2.087516, 0, 0, 0, 1, 1,
1.289996, 0.3348193, 3.27062, 1, 1, 1, 1, 1,
1.290198, -0.5682318, 1.484747, 1, 1, 1, 1, 1,
1.291862, -2.671896, 1.128518, 1, 1, 1, 1, 1,
1.300182, -0.5995094, 0.143803, 1, 1, 1, 1, 1,
1.322352, -0.04737064, 1.147127, 1, 1, 1, 1, 1,
1.326754, -1.342901, 2.121394, 1, 1, 1, 1, 1,
1.332045, 0.1553699, 0.9069252, 1, 1, 1, 1, 1,
1.340028, -0.9133359, 2.324861, 1, 1, 1, 1, 1,
1.341354, 0.3503774, 0.6014496, 1, 1, 1, 1, 1,
1.359399, 0.2010705, 2.064323, 1, 1, 1, 1, 1,
1.366826, 0.1102052, 2.320489, 1, 1, 1, 1, 1,
1.368276, -1.148307, 1.781958, 1, 1, 1, 1, 1,
1.371405, -0.2949313, 3.313067, 1, 1, 1, 1, 1,
1.372517, -1.410828, 3.382099, 1, 1, 1, 1, 1,
1.37844, -0.9202336, 2.090454, 1, 1, 1, 1, 1,
1.39757, -0.3529384, 1.720264, 0, 0, 1, 1, 1,
1.404169, 0.3300736, 2.458385, 1, 0, 0, 1, 1,
1.410503, 1.23763, 2.014594, 1, 0, 0, 1, 1,
1.419621, 0.7649758, 1.526307, 1, 0, 0, 1, 1,
1.420999, 1.581335, 0.0730459, 1, 0, 0, 1, 1,
1.426439, 0.5312992, 1.891775, 1, 0, 0, 1, 1,
1.458885, -0.9819294, 2.357801, 0, 0, 0, 1, 1,
1.460892, 0.3284964, 0.6809719, 0, 0, 0, 1, 1,
1.467341, -0.7799205, 2.485487, 0, 0, 0, 1, 1,
1.486364, -0.3303365, 1.670395, 0, 0, 0, 1, 1,
1.490043, 0.6330526, 0.08176091, 0, 0, 0, 1, 1,
1.493895, 0.001980737, 0.5103215, 0, 0, 0, 1, 1,
1.494986, -1.83849, 1.517249, 0, 0, 0, 1, 1,
1.525332, -2.042738, 2.685809, 1, 1, 1, 1, 1,
1.528868, 1.192133, 2.389994, 1, 1, 1, 1, 1,
1.535353, 0.07957738, 1.463074, 1, 1, 1, 1, 1,
1.537057, -1.074532, 2.731232, 1, 1, 1, 1, 1,
1.537848, 0.1729493, 1.732156, 1, 1, 1, 1, 1,
1.539641, -1.499706, 3.059423, 1, 1, 1, 1, 1,
1.541395, 1.053272, 0.5564646, 1, 1, 1, 1, 1,
1.546662, 1.261154, 1.157327, 1, 1, 1, 1, 1,
1.560744, -0.4988133, 0.7295219, 1, 1, 1, 1, 1,
1.568617, 0.8028381, 0.4018113, 1, 1, 1, 1, 1,
1.58195, 0.6133697, -0.3660696, 1, 1, 1, 1, 1,
1.583891, -0.3374995, 1.931332, 1, 1, 1, 1, 1,
1.607112, -0.5896274, 4.283956, 1, 1, 1, 1, 1,
1.612856, 0.647507, 2.915539, 1, 1, 1, 1, 1,
1.618974, 0.2916211, 1.701586, 1, 1, 1, 1, 1,
1.635995, -0.6452265, -0.04193582, 0, 0, 1, 1, 1,
1.646305, 1.885351, 2.698255, 1, 0, 0, 1, 1,
1.669877, -0.1167121, 1.493855, 1, 0, 0, 1, 1,
1.684848, -1.997363, 2.162543, 1, 0, 0, 1, 1,
1.685635, -0.8654944, 2.753454, 1, 0, 0, 1, 1,
1.722874, -2.0367, 0.8297417, 1, 0, 0, 1, 1,
1.725041, -2.124327, 2.252468, 0, 0, 0, 1, 1,
1.736434, 0.9431829, 1.907158, 0, 0, 0, 1, 1,
1.736835, 1.588454, 1.243042, 0, 0, 0, 1, 1,
1.757132, 0.5663458, 2.279409, 0, 0, 0, 1, 1,
1.764562, 1.848585, -1.259619, 0, 0, 0, 1, 1,
1.770157, -0.624212, 2.97149, 0, 0, 0, 1, 1,
1.782681, -0.983862, 1.342544, 0, 0, 0, 1, 1,
1.807659, 1.680955, 1.321304, 1, 1, 1, 1, 1,
1.826928, 0.2939754, 1.439806, 1, 1, 1, 1, 1,
1.840145, -0.3807445, 0.6862855, 1, 1, 1, 1, 1,
1.852682, 1.467811, 2.545517, 1, 1, 1, 1, 1,
1.855216, 2.387687, 2.290005, 1, 1, 1, 1, 1,
1.900953, -0.5045996, 2.146125, 1, 1, 1, 1, 1,
1.924129, -0.6536974, 2.516904, 1, 1, 1, 1, 1,
1.947113, 0.7716608, -0.1410624, 1, 1, 1, 1, 1,
1.956806, -0.4462986, 2.564372, 1, 1, 1, 1, 1,
1.961874, -0.2982451, 0.5968076, 1, 1, 1, 1, 1,
1.970038, 0.3985596, 0.9334092, 1, 1, 1, 1, 1,
1.97221, 0.9961756, 2.288075, 1, 1, 1, 1, 1,
1.979394, -0.5653074, 1.359072, 1, 1, 1, 1, 1,
2.010982, 0.3105786, 1.089422, 1, 1, 1, 1, 1,
2.011186, -0.02967898, 0.6535847, 1, 1, 1, 1, 1,
2.05636, -0.7759434, 2.732009, 0, 0, 1, 1, 1,
2.071279, -0.6950259, 1.647529, 1, 0, 0, 1, 1,
2.098866, 0.6220478, 0.2919741, 1, 0, 0, 1, 1,
2.107581, -0.3275246, 2.353486, 1, 0, 0, 1, 1,
2.10874, 0.8864948, 2.74671, 1, 0, 0, 1, 1,
2.148343, -1.546053, 2.347172, 1, 0, 0, 1, 1,
2.155786, 0.07157443, -0.5685172, 0, 0, 0, 1, 1,
2.182225, 0.05167421, 0.3499675, 0, 0, 0, 1, 1,
2.234807, 1.253388, 0.9745202, 0, 0, 0, 1, 1,
2.240821, -0.4565682, 1.414735, 0, 0, 0, 1, 1,
2.257116, -0.8571721, 1.726046, 0, 0, 0, 1, 1,
2.282996, -1.058819, 0.9563964, 0, 0, 0, 1, 1,
2.412353, -0.2151069, 0.7072721, 0, 0, 0, 1, 1,
2.425965, -1.045556, 3.481202, 1, 1, 1, 1, 1,
2.469741, -0.4550776, 3.186783, 1, 1, 1, 1, 1,
2.532321, 0.5071737, 1.499311, 1, 1, 1, 1, 1,
2.715907, 1.437871, 1.771673, 1, 1, 1, 1, 1,
2.762384, -1.345797, 0.4264267, 1, 1, 1, 1, 1,
2.845973, -0.5740412, 2.318853, 1, 1, 1, 1, 1,
3.451597, 1.368771, -0.6696081, 1, 1, 1, 1, 1
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
var radius = 9.786254;
var distance = 34.3738;
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
mvMatrix.translate( -0.3064647, -0.2734582, 0.1237309 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.3738);
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