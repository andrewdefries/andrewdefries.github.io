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
-3.538329, 0.2207681, -2.898483, 1, 0, 0, 1,
-3.47613, 0.6520178, -2.906467, 1, 0.007843138, 0, 1,
-3.198076, 1.065925, -1.378346, 1, 0.01176471, 0, 1,
-2.699965, -0.1039239, -1.991117, 1, 0.01960784, 0, 1,
-2.622557, -0.05944007, -2.238281, 1, 0.02352941, 0, 1,
-2.404367, 2.168489, -1.053433, 1, 0.03137255, 0, 1,
-2.393841, 0.3383841, 0.2521884, 1, 0.03529412, 0, 1,
-2.293602, -0.3100992, -1.676211, 1, 0.04313726, 0, 1,
-2.278919, -0.418932, -2.826753, 1, 0.04705882, 0, 1,
-2.160238, 0.6792374, -1.227757, 1, 0.05490196, 0, 1,
-2.142383, 1.168814, -0.06772144, 1, 0.05882353, 0, 1,
-2.140987, 0.4990115, -2.468504, 1, 0.06666667, 0, 1,
-2.13713, 0.5108529, -2.312443, 1, 0.07058824, 0, 1,
-2.122015, 0.2863295, 1.06895, 1, 0.07843138, 0, 1,
-2.109006, 2.102204, 0.7327185, 1, 0.08235294, 0, 1,
-2.10729, 0.09472072, -1.164004, 1, 0.09019608, 0, 1,
-2.079931, -0.00870987, -1.487226, 1, 0.09411765, 0, 1,
-2.078424, -1.330414, -0.1687584, 1, 0.1019608, 0, 1,
-2.078213, 0.7908556, -1.288974, 1, 0.1098039, 0, 1,
-2.052308, -0.01765403, -1.429088, 1, 0.1137255, 0, 1,
-2.018697, 0.5178968, -1.049928, 1, 0.1215686, 0, 1,
-1.986288, 0.2980595, -1.198111, 1, 0.1254902, 0, 1,
-1.95881, -0.1692985, -1.061066, 1, 0.1333333, 0, 1,
-1.951362, 1.077562, -0.1709368, 1, 0.1372549, 0, 1,
-1.931393, 0.4614697, -1.381308, 1, 0.145098, 0, 1,
-1.917074, 0.656345, -1.18597, 1, 0.1490196, 0, 1,
-1.901419, 0.6815158, 0.9102688, 1, 0.1568628, 0, 1,
-1.859016, 0.9108887, -2.222413, 1, 0.1607843, 0, 1,
-1.816879, 0.9570826, -2.810112, 1, 0.1686275, 0, 1,
-1.811466, 0.5927063, -1.945405, 1, 0.172549, 0, 1,
-1.810056, 1.349721, 1.4398, 1, 0.1803922, 0, 1,
-1.7874, -1.078547, -3.061142, 1, 0.1843137, 0, 1,
-1.780797, -1.328133, -3.672776, 1, 0.1921569, 0, 1,
-1.774749, 2.531952, 0.8578947, 1, 0.1960784, 0, 1,
-1.772064, -1.655211, -3.089979, 1, 0.2039216, 0, 1,
-1.768759, 0.4778752, -1.541535, 1, 0.2117647, 0, 1,
-1.756689, -0.9072016, -2.020471, 1, 0.2156863, 0, 1,
-1.750875, 0.1417129, -0.9578765, 1, 0.2235294, 0, 1,
-1.750396, 0.09055278, -0.4905671, 1, 0.227451, 0, 1,
-1.750294, 0.1113111, -2.03364, 1, 0.2352941, 0, 1,
-1.727522, 0.3259307, -0.02643102, 1, 0.2392157, 0, 1,
-1.69067, 0.2362371, -2.308484, 1, 0.2470588, 0, 1,
-1.689996, 1.291073, -0.1175102, 1, 0.2509804, 0, 1,
-1.679378, 0.1957737, -0.3353651, 1, 0.2588235, 0, 1,
-1.672241, 0.6482243, -1.866327, 1, 0.2627451, 0, 1,
-1.641588, -0.1898775, -1.986942, 1, 0.2705882, 0, 1,
-1.61019, 1.371214, -1.975887, 1, 0.2745098, 0, 1,
-1.589977, -0.5916547, -0.5262605, 1, 0.282353, 0, 1,
-1.588982, -1.913327, -1.62993, 1, 0.2862745, 0, 1,
-1.588123, -1.109116, -1.655096, 1, 0.2941177, 0, 1,
-1.56533, 1.170642, -2.126372, 1, 0.3019608, 0, 1,
-1.545281, 0.9869308, -2.279912, 1, 0.3058824, 0, 1,
-1.507938, 0.3624099, -2.299759, 1, 0.3137255, 0, 1,
-1.502181, -0.6079997, -1.772662, 1, 0.3176471, 0, 1,
-1.485351, -2.85304, -2.856473, 1, 0.3254902, 0, 1,
-1.481391, 0.5550604, -0.4897059, 1, 0.3294118, 0, 1,
-1.479513, -0.7727203, -2.11706, 1, 0.3372549, 0, 1,
-1.467655, 0.005674922, -1.57868, 1, 0.3411765, 0, 1,
-1.46054, -2.098429, -3.508241, 1, 0.3490196, 0, 1,
-1.458505, 0.4623952, -1.640036, 1, 0.3529412, 0, 1,
-1.445191, 0.2087353, -1.621221, 1, 0.3607843, 0, 1,
-1.439395, -0.4857115, -3.401582, 1, 0.3647059, 0, 1,
-1.437201, -0.2258276, -0.9544645, 1, 0.372549, 0, 1,
-1.432882, -0.3673773, -1.126738, 1, 0.3764706, 0, 1,
-1.416946, -0.696963, -1.083294, 1, 0.3843137, 0, 1,
-1.413877, -0.3220499, -3.666832, 1, 0.3882353, 0, 1,
-1.411656, -1.026361, -2.192461, 1, 0.3960784, 0, 1,
-1.403994, -1.539834, -2.723259, 1, 0.4039216, 0, 1,
-1.401056, 1.783051, -1.418524, 1, 0.4078431, 0, 1,
-1.381174, 2.00768, -0.2350984, 1, 0.4156863, 0, 1,
-1.378946, 0.7197049, -0.3513016, 1, 0.4196078, 0, 1,
-1.378063, -1.585772, -2.629443, 1, 0.427451, 0, 1,
-1.377046, -0.8343841, -2.294152, 1, 0.4313726, 0, 1,
-1.365912, -1.025581, -1.927831, 1, 0.4392157, 0, 1,
-1.365907, 0.2637157, -0.3158833, 1, 0.4431373, 0, 1,
-1.347697, 0.09316467, -1.550739, 1, 0.4509804, 0, 1,
-1.343122, 0.8548213, 0.5348371, 1, 0.454902, 0, 1,
-1.33982, -0.4423769, -2.267625, 1, 0.4627451, 0, 1,
-1.335071, 0.2535297, -1.62475, 1, 0.4666667, 0, 1,
-1.331751, -1.03029, -2.125067, 1, 0.4745098, 0, 1,
-1.323244, -1.628288, -4.106318, 1, 0.4784314, 0, 1,
-1.307266, 1.150096, -1.122999, 1, 0.4862745, 0, 1,
-1.305582, 0.4084238, -1.090705, 1, 0.4901961, 0, 1,
-1.301291, 1.058909, -2.424432, 1, 0.4980392, 0, 1,
-1.297997, 0.7473841, -0.841983, 1, 0.5058824, 0, 1,
-1.296565, -1.724505, -2.458656, 1, 0.509804, 0, 1,
-1.289697, -0.3449337, -3.892128, 1, 0.5176471, 0, 1,
-1.285484, -0.8642589, -2.097221, 1, 0.5215687, 0, 1,
-1.285362, -1.662762, -2.588099, 1, 0.5294118, 0, 1,
-1.282119, -0.9859557, -1.108986, 1, 0.5333334, 0, 1,
-1.279802, -1.772815, -2.650892, 1, 0.5411765, 0, 1,
-1.278858, 0.995317, 0.4439299, 1, 0.5450981, 0, 1,
-1.277949, 0.817561, 0.2867003, 1, 0.5529412, 0, 1,
-1.258879, 0.9209155, -0.96263, 1, 0.5568628, 0, 1,
-1.257362, -0.8239565, -2.546694, 1, 0.5647059, 0, 1,
-1.249873, -0.3189988, -2.31942, 1, 0.5686275, 0, 1,
-1.247727, -0.8996225, -1.978202, 1, 0.5764706, 0, 1,
-1.244162, -0.8704528, -3.493274, 1, 0.5803922, 0, 1,
-1.23782, -1.467695, -1.669043, 1, 0.5882353, 0, 1,
-1.220343, -1.50908, -2.380081, 1, 0.5921569, 0, 1,
-1.218651, -0.9304613, -3.425903, 1, 0.6, 0, 1,
-1.209659, 1.159339, -0.09745068, 1, 0.6078432, 0, 1,
-1.208739, 1.665658, -1.740673, 1, 0.6117647, 0, 1,
-1.193655, -0.1564214, -2.69003, 1, 0.6196079, 0, 1,
-1.189509, 1.406639, 1.089503, 1, 0.6235294, 0, 1,
-1.188695, -0.02786748, -1.484159, 1, 0.6313726, 0, 1,
-1.185535, 0.8616812, -0.05272793, 1, 0.6352941, 0, 1,
-1.184307, -0.3054873, -1.113173, 1, 0.6431373, 0, 1,
-1.178186, -1.124014, -2.521718, 1, 0.6470588, 0, 1,
-1.175049, -0.2404202, -2.886157, 1, 0.654902, 0, 1,
-1.17378, 0.9973856, -1.91531, 1, 0.6588235, 0, 1,
-1.16952, 1.205879, -0.2030743, 1, 0.6666667, 0, 1,
-1.15157, -1.898359, -3.867007, 1, 0.6705883, 0, 1,
-1.151507, -0.774415, -1.506336, 1, 0.6784314, 0, 1,
-1.149627, 0.8914129, -0.629042, 1, 0.682353, 0, 1,
-1.142686, -0.4912195, -2.564874, 1, 0.6901961, 0, 1,
-1.139069, -1.232453, -2.193221, 1, 0.6941177, 0, 1,
-1.138689, 0.6384665, -1.822361, 1, 0.7019608, 0, 1,
-1.13072, 0.1908572, -2.731071, 1, 0.7098039, 0, 1,
-1.129315, -0.6250991, -1.686921, 1, 0.7137255, 0, 1,
-1.125275, 1.521383, -1.597467, 1, 0.7215686, 0, 1,
-1.123837, 0.5714275, -1.078861, 1, 0.7254902, 0, 1,
-1.121934, 0.1762358, -0.6954955, 1, 0.7333333, 0, 1,
-1.101727, -0.09941275, -1.771088, 1, 0.7372549, 0, 1,
-1.095714, -0.4268061, -2.724007, 1, 0.7450981, 0, 1,
-1.092396, -0.6042771, -2.421642, 1, 0.7490196, 0, 1,
-1.088043, -0.7247922, -2.566005, 1, 0.7568628, 0, 1,
-1.083207, 0.3489881, -2.214828, 1, 0.7607843, 0, 1,
-1.080666, 0.07298495, -2.942242, 1, 0.7686275, 0, 1,
-1.078925, 0.3822237, -1.976794, 1, 0.772549, 0, 1,
-1.073456, 0.4412603, -0.09707698, 1, 0.7803922, 0, 1,
-1.064442, 0.1440241, -1.549462, 1, 0.7843137, 0, 1,
-1.06271, -0.8796014, -0.07345252, 1, 0.7921569, 0, 1,
-1.06035, -1.222652, -1.706373, 1, 0.7960784, 0, 1,
-1.059941, 0.1428544, -1.378608, 1, 0.8039216, 0, 1,
-1.055471, -1.17739, -0.5835809, 1, 0.8117647, 0, 1,
-1.053858, 0.1877978, -0.7033549, 1, 0.8156863, 0, 1,
-1.049717, 1.671963, -0.4771563, 1, 0.8235294, 0, 1,
-1.045506, 0.2823359, -2.036857, 1, 0.827451, 0, 1,
-1.044779, 0.6256284, 0.5473544, 1, 0.8352941, 0, 1,
-1.03994, -0.748767, -2.109393, 1, 0.8392157, 0, 1,
-1.037898, -0.04029151, -1.310125, 1, 0.8470588, 0, 1,
-1.034733, 0.6061795, -2.611537, 1, 0.8509804, 0, 1,
-1.022658, -0.634048, -1.42648, 1, 0.8588235, 0, 1,
-1.002078, -1.55279, -1.315767, 1, 0.8627451, 0, 1,
-1.001634, 1.528642, -0.8972664, 1, 0.8705882, 0, 1,
-0.9940557, -0.4745757, -2.594581, 1, 0.8745098, 0, 1,
-0.9901946, -1.496652, -3.97277, 1, 0.8823529, 0, 1,
-0.9761605, -0.8965948, -2.626189, 1, 0.8862745, 0, 1,
-0.9760385, -1.712178, -1.792579, 1, 0.8941177, 0, 1,
-0.9697212, 0.6909011, -1.093098, 1, 0.8980392, 0, 1,
-0.9662758, 0.08473906, -1.914503, 1, 0.9058824, 0, 1,
-0.9643558, -1.009528, -1.451672, 1, 0.9137255, 0, 1,
-0.9595476, -1.756797, -3.623387, 1, 0.9176471, 0, 1,
-0.9582276, -0.1267093, -2.718165, 1, 0.9254902, 0, 1,
-0.9567857, 0.06973156, -3.663146, 1, 0.9294118, 0, 1,
-0.9368858, -0.3023733, 0.142936, 1, 0.9372549, 0, 1,
-0.9334548, -1.148532, -1.065859, 1, 0.9411765, 0, 1,
-0.9321061, 0.5847546, -2.082779, 1, 0.9490196, 0, 1,
-0.932097, 0.5639326, -1.293015, 1, 0.9529412, 0, 1,
-0.9261132, -1.064647, -3.226891, 1, 0.9607843, 0, 1,
-0.9213681, -0.8958148, -5.701808, 1, 0.9647059, 0, 1,
-0.9158764, -0.1642754, -2.407959, 1, 0.972549, 0, 1,
-0.9113119, 0.402377, -0.9567504, 1, 0.9764706, 0, 1,
-0.9079008, 0.1133515, -1.71057, 1, 0.9843137, 0, 1,
-0.9025478, -0.5380041, -3.471833, 1, 0.9882353, 0, 1,
-0.888797, 2.879206, 0.5217485, 1, 0.9960784, 0, 1,
-0.886085, 0.2545201, -1.115772, 0.9960784, 1, 0, 1,
-0.8802611, 0.2539347, -0.7279698, 0.9921569, 1, 0, 1,
-0.8796906, 0.03205908, -1.328835, 0.9843137, 1, 0, 1,
-0.8749287, 0.5762838, -0.5538317, 0.9803922, 1, 0, 1,
-0.8749228, 1.643335, -0.7691135, 0.972549, 1, 0, 1,
-0.8725934, -1.484762, -2.842453, 0.9686275, 1, 0, 1,
-0.8665134, -1.067276, -3.138664, 0.9607843, 1, 0, 1,
-0.8642678, 0.9599065, -0.7023104, 0.9568627, 1, 0, 1,
-0.8597642, 0.7184057, 0.34384, 0.9490196, 1, 0, 1,
-0.8505364, -0.1162762, -1.072106, 0.945098, 1, 0, 1,
-0.8395624, 0.7713253, -0.3667265, 0.9372549, 1, 0, 1,
-0.8356423, 0.7651352, -0.8305732, 0.9333333, 1, 0, 1,
-0.8354517, -1.11616, -2.659141, 0.9254902, 1, 0, 1,
-0.8326862, 0.7513969, -0.9050699, 0.9215686, 1, 0, 1,
-0.8303998, -0.3055297, 0.04449929, 0.9137255, 1, 0, 1,
-0.8285288, -0.5418751, -2.618392, 0.9098039, 1, 0, 1,
-0.8267511, -1.178031, -3.407384, 0.9019608, 1, 0, 1,
-0.822869, 2.062416, -1.040686, 0.8941177, 1, 0, 1,
-0.8227878, -0.1076335, -1.89271, 0.8901961, 1, 0, 1,
-0.8206031, -0.897563, -3.379241, 0.8823529, 1, 0, 1,
-0.8115115, -0.3000368, -2.355833, 0.8784314, 1, 0, 1,
-0.8069702, -0.5720831, -1.953842, 0.8705882, 1, 0, 1,
-0.8056019, -0.465882, -3.486732, 0.8666667, 1, 0, 1,
-0.8024344, -1.347638, -3.146407, 0.8588235, 1, 0, 1,
-0.7923448, 1.743593, 0.9215385, 0.854902, 1, 0, 1,
-0.7867241, 0.1300569, -0.9970446, 0.8470588, 1, 0, 1,
-0.7849009, 1.237061, -1.130158, 0.8431373, 1, 0, 1,
-0.781742, -0.6492314, -1.450619, 0.8352941, 1, 0, 1,
-0.7792073, 0.06541017, -2.551312, 0.8313726, 1, 0, 1,
-0.7767174, -0.3857063, -0.6970013, 0.8235294, 1, 0, 1,
-0.7667855, -0.9392066, -2.43004, 0.8196079, 1, 0, 1,
-0.7656162, 1.610431, 0.1833007, 0.8117647, 1, 0, 1,
-0.7622488, 1.511543, 0.7606965, 0.8078431, 1, 0, 1,
-0.7513947, -0.4684609, -3.232685, 0.8, 1, 0, 1,
-0.7469453, 0.8540602, -1.128267, 0.7921569, 1, 0, 1,
-0.7425808, 1.080059, -1.080807, 0.7882353, 1, 0, 1,
-0.7409588, -0.882136, -0.826486, 0.7803922, 1, 0, 1,
-0.7343811, -0.1739579, -2.682263, 0.7764706, 1, 0, 1,
-0.731526, 0.7243179, -0.821918, 0.7686275, 1, 0, 1,
-0.7296642, 0.5353907, 0.6875502, 0.7647059, 1, 0, 1,
-0.7242779, 1.230696, 0.5947587, 0.7568628, 1, 0, 1,
-0.7152511, -1.329022, -4.053519, 0.7529412, 1, 0, 1,
-0.7149224, 0.8688759, -1.592432, 0.7450981, 1, 0, 1,
-0.7043176, 1.144203, 0.8200502, 0.7411765, 1, 0, 1,
-0.7037948, 0.6012459, -2.291501, 0.7333333, 1, 0, 1,
-0.697214, 0.8562277, -0.03551694, 0.7294118, 1, 0, 1,
-0.6887938, 0.785683, -2.725204, 0.7215686, 1, 0, 1,
-0.6854447, 0.1739052, -1.97785, 0.7176471, 1, 0, 1,
-0.6817681, -0.3090412, -2.755635, 0.7098039, 1, 0, 1,
-0.678306, 3.667847, -1.389896, 0.7058824, 1, 0, 1,
-0.674205, -0.8194184, -3.385938, 0.6980392, 1, 0, 1,
-0.6703251, -1.142329, -1.946457, 0.6901961, 1, 0, 1,
-0.6675636, -0.740025, -3.734699, 0.6862745, 1, 0, 1,
-0.6665142, 1.174193, -1.76536, 0.6784314, 1, 0, 1,
-0.6648077, -1.233701, -0.4345693, 0.6745098, 1, 0, 1,
-0.6605737, -0.991937, -3.370229, 0.6666667, 1, 0, 1,
-0.660403, 1.306384, -1.314553, 0.6627451, 1, 0, 1,
-0.6587672, 1.192628, -1.567963, 0.654902, 1, 0, 1,
-0.6583838, -1.502907, -1.967544, 0.6509804, 1, 0, 1,
-0.657185, 1.192061, -1.119188, 0.6431373, 1, 0, 1,
-0.6570327, 0.6080225, -1.404763, 0.6392157, 1, 0, 1,
-0.6557628, 2.601257, 1.585631, 0.6313726, 1, 0, 1,
-0.6483393, -2.090447, -4.851718, 0.627451, 1, 0, 1,
-0.640841, -0.9560195, -2.374311, 0.6196079, 1, 0, 1,
-0.6399556, 0.6608094, -0.9594021, 0.6156863, 1, 0, 1,
-0.6308557, -1.363118, -3.033226, 0.6078432, 1, 0, 1,
-0.6307245, -0.9934702, -3.213534, 0.6039216, 1, 0, 1,
-0.6288257, 0.7028718, -0.7599854, 0.5960785, 1, 0, 1,
-0.6228188, -0.5479486, -3.385272, 0.5882353, 1, 0, 1,
-0.6197014, 0.6311135, -0.7896549, 0.5843138, 1, 0, 1,
-0.6183379, -1.208959, -2.423944, 0.5764706, 1, 0, 1,
-0.6115759, 1.214931, -0.8521116, 0.572549, 1, 0, 1,
-0.6112223, -0.2904424, -3.000266, 0.5647059, 1, 0, 1,
-0.6078629, -0.2222413, -2.660353, 0.5607843, 1, 0, 1,
-0.6045852, -0.3852633, -2.974901, 0.5529412, 1, 0, 1,
-0.6016284, -0.6968025, -3.404638, 0.5490196, 1, 0, 1,
-0.5994385, 1.211195, -0.6913013, 0.5411765, 1, 0, 1,
-0.5852613, -1.241624, -2.012062, 0.5372549, 1, 0, 1,
-0.5851104, 1.39295, -0.3484724, 0.5294118, 1, 0, 1,
-0.5780768, -0.5649756, -1.550909, 0.5254902, 1, 0, 1,
-0.5727984, 1.669439, -0.3077821, 0.5176471, 1, 0, 1,
-0.5698036, 1.735916, -2.990364, 0.5137255, 1, 0, 1,
-0.5694777, -0.2884294, -3.126318, 0.5058824, 1, 0, 1,
-0.5667875, -1.035296, -3.252458, 0.5019608, 1, 0, 1,
-0.5657523, -0.05709791, -2.18344, 0.4941176, 1, 0, 1,
-0.5655224, -0.9912329, -1.624275, 0.4862745, 1, 0, 1,
-0.5635264, -0.6915462, -3.538191, 0.4823529, 1, 0, 1,
-0.5539229, -0.4637375, -3.200019, 0.4745098, 1, 0, 1,
-0.5514945, -0.8002956, -2.99496, 0.4705882, 1, 0, 1,
-0.5474153, 0.1345889, -2.992593, 0.4627451, 1, 0, 1,
-0.5459167, -0.09850582, -1.215659, 0.4588235, 1, 0, 1,
-0.5447983, -0.4755829, -2.131516, 0.4509804, 1, 0, 1,
-0.5435079, -0.7331749, -1.412462, 0.4470588, 1, 0, 1,
-0.5433439, -1.225619, -3.840653, 0.4392157, 1, 0, 1,
-0.543045, 0.784831, -0.7711065, 0.4352941, 1, 0, 1,
-0.538546, 1.531572, -0.3744628, 0.427451, 1, 0, 1,
-0.5380315, -1.041047, -3.734426, 0.4235294, 1, 0, 1,
-0.5344692, 0.2446438, -0.6500638, 0.4156863, 1, 0, 1,
-0.5327889, -0.7631841, -2.712404, 0.4117647, 1, 0, 1,
-0.5321674, -0.5903049, -1.230068, 0.4039216, 1, 0, 1,
-0.5317832, -0.5893175, -2.43915, 0.3960784, 1, 0, 1,
-0.5293909, -1.249555, -2.737848, 0.3921569, 1, 0, 1,
-0.5278018, 1.171314, -2.763841, 0.3843137, 1, 0, 1,
-0.5264041, 0.4786341, -2.198166, 0.3803922, 1, 0, 1,
-0.5253733, -1.903446, -3.220299, 0.372549, 1, 0, 1,
-0.518502, 0.6647505, -2.003688, 0.3686275, 1, 0, 1,
-0.5141541, 0.3988281, -2.344395, 0.3607843, 1, 0, 1,
-0.5125552, -1.604937, -3.08182, 0.3568628, 1, 0, 1,
-0.5086411, 0.7561339, -0.8284231, 0.3490196, 1, 0, 1,
-0.506232, -0.1173046, -0.2837877, 0.345098, 1, 0, 1,
-0.5051088, -1.231428, -4.109136, 0.3372549, 1, 0, 1,
-0.5029436, 0.03710864, -0.8139496, 0.3333333, 1, 0, 1,
-0.5015388, -0.2952461, -1.703228, 0.3254902, 1, 0, 1,
-0.5015168, -2.178366, -3.722859, 0.3215686, 1, 0, 1,
-0.496915, -1.383473, -1.832315, 0.3137255, 1, 0, 1,
-0.4927038, 0.1719623, -2.178055, 0.3098039, 1, 0, 1,
-0.4879204, -0.5136434, -1.441292, 0.3019608, 1, 0, 1,
-0.4826128, -0.9978843, -3.901538, 0.2941177, 1, 0, 1,
-0.4798485, -0.2341441, -1.552891, 0.2901961, 1, 0, 1,
-0.4785294, -0.2492728, -3.359007, 0.282353, 1, 0, 1,
-0.4780356, 0.9962786, 0.7899941, 0.2784314, 1, 0, 1,
-0.4732901, -0.7663695, -1.913585, 0.2705882, 1, 0, 1,
-0.4702265, 0.4830725, -0.235376, 0.2666667, 1, 0, 1,
-0.4698469, 2.052454, -0.04677373, 0.2588235, 1, 0, 1,
-0.4681725, -1.316627, -2.668284, 0.254902, 1, 0, 1,
-0.4661153, -0.7209064, -5.021881, 0.2470588, 1, 0, 1,
-0.4631874, 1.104648, -0.6074285, 0.2431373, 1, 0, 1,
-0.4564438, 1.411645, 0.3435277, 0.2352941, 1, 0, 1,
-0.4496993, -0.3919967, -3.10239, 0.2313726, 1, 0, 1,
-0.4488101, 0.05083724, -2.498885, 0.2235294, 1, 0, 1,
-0.4485712, 0.8317073, -0.3308961, 0.2196078, 1, 0, 1,
-0.4467188, -2.262154, -3.478503, 0.2117647, 1, 0, 1,
-0.4396775, -0.3809895, -2.623543, 0.2078431, 1, 0, 1,
-0.4378512, -0.8768856, -3.155281, 0.2, 1, 0, 1,
-0.4352384, -0.9338093, -5.26221, 0.1921569, 1, 0, 1,
-0.4309289, 0.3232549, 0.5196958, 0.1882353, 1, 0, 1,
-0.4295564, 0.2792354, 0.1600621, 0.1803922, 1, 0, 1,
-0.428561, -0.08706418, -1.44965, 0.1764706, 1, 0, 1,
-0.4273747, 0.2854415, -0.6333318, 0.1686275, 1, 0, 1,
-0.4213852, -0.07590535, -3.564586, 0.1647059, 1, 0, 1,
-0.4177587, 2.515108, -1.282595, 0.1568628, 1, 0, 1,
-0.414886, 0.2490758, -4.139687, 0.1529412, 1, 0, 1,
-0.4105327, -0.3343555, -2.00729, 0.145098, 1, 0, 1,
-0.4049873, 1.333246, -0.9544248, 0.1411765, 1, 0, 1,
-0.3996953, 1.73655, 1.315185, 0.1333333, 1, 0, 1,
-0.391615, 0.06529614, -1.967947, 0.1294118, 1, 0, 1,
-0.3823271, 0.9690033, -0.3563999, 0.1215686, 1, 0, 1,
-0.3821818, -1.761959, -2.574576, 0.1176471, 1, 0, 1,
-0.3763876, -0.1630565, -2.891553, 0.1098039, 1, 0, 1,
-0.3761726, 0.1659802, -1.727553, 0.1058824, 1, 0, 1,
-0.3720348, 0.2045722, 0.5515974, 0.09803922, 1, 0, 1,
-0.369023, 0.4522129, -2.726543, 0.09019608, 1, 0, 1,
-0.3688496, 0.1059896, -2.472054, 0.08627451, 1, 0, 1,
-0.3679727, 0.4893805, -0.8078464, 0.07843138, 1, 0, 1,
-0.3669455, 1.799326, 0.2456457, 0.07450981, 1, 0, 1,
-0.3645713, -0.8160621, -3.616838, 0.06666667, 1, 0, 1,
-0.362057, 1.519062, -0.1403577, 0.0627451, 1, 0, 1,
-0.3611465, -0.09031897, -1.187699, 0.05490196, 1, 0, 1,
-0.3600801, 0.5362117, -0.8937777, 0.05098039, 1, 0, 1,
-0.3575825, 0.2970611, -1.460186, 0.04313726, 1, 0, 1,
-0.3538723, -0.3925287, -2.337295, 0.03921569, 1, 0, 1,
-0.3504761, 0.1640018, -1.128038, 0.03137255, 1, 0, 1,
-0.3470078, 0.6395105, -1.057029, 0.02745098, 1, 0, 1,
-0.3428443, 0.7518912, -0.3851304, 0.01960784, 1, 0, 1,
-0.3385362, -0.06732013, -1.488744, 0.01568628, 1, 0, 1,
-0.335883, 1.286483, -0.631538, 0.007843138, 1, 0, 1,
-0.3354915, -0.06825575, -3.24492, 0.003921569, 1, 0, 1,
-0.3352942, 0.01776403, -1.886474, 0, 1, 0.003921569, 1,
-0.3304032, 1.061229, 0.437906, 0, 1, 0.01176471, 1,
-0.3302476, -1.048884, -4.469046, 0, 1, 0.01568628, 1,
-0.3264889, 0.436397, 0.5175306, 0, 1, 0.02352941, 1,
-0.3264543, 0.4304002, -0.8355748, 0, 1, 0.02745098, 1,
-0.3226213, 0.794523, -0.05170538, 0, 1, 0.03529412, 1,
-0.3220985, -0.2546183, -3.425808, 0, 1, 0.03921569, 1,
-0.3173085, 1.100342, -0.3594642, 0, 1, 0.04705882, 1,
-0.3022518, -0.457195, -2.035317, 0, 1, 0.05098039, 1,
-0.2955094, 1.036038, -0.2216481, 0, 1, 0.05882353, 1,
-0.2928621, -0.5802241, -3.370232, 0, 1, 0.0627451, 1,
-0.2913794, 0.1812898, -0.01234986, 0, 1, 0.07058824, 1,
-0.2849812, -2.537279, -3.613319, 0, 1, 0.07450981, 1,
-0.2837197, -2.264081, -2.071196, 0, 1, 0.08235294, 1,
-0.2811185, 1.131359, -0.06702416, 0, 1, 0.08627451, 1,
-0.2775343, -0.230984, -1.757557, 0, 1, 0.09411765, 1,
-0.2770469, 0.6009842, -0.7367749, 0, 1, 0.1019608, 1,
-0.2753356, -0.09636591, -0.8321295, 0, 1, 0.1058824, 1,
-0.274714, 0.6686511, -0.6084042, 0, 1, 0.1137255, 1,
-0.2697061, -1.11736, -2.045878, 0, 1, 0.1176471, 1,
-0.2671806, -0.8016533, -2.900142, 0, 1, 0.1254902, 1,
-0.2652792, -0.7490391, -2.157638, 0, 1, 0.1294118, 1,
-0.2651082, -2.511652, -3.822211, 0, 1, 0.1372549, 1,
-0.2638415, 1.256695, -0.731416, 0, 1, 0.1411765, 1,
-0.263326, -1.94226, -2.673289, 0, 1, 0.1490196, 1,
-0.2629882, -1.31219, -3.916687, 0, 1, 0.1529412, 1,
-0.2610518, 0.4076528, -2.360436, 0, 1, 0.1607843, 1,
-0.2600419, 2.21216, -1.461936, 0, 1, 0.1647059, 1,
-0.2573433, -0.4876907, -1.45933, 0, 1, 0.172549, 1,
-0.2550401, -0.04488354, -1.108775, 0, 1, 0.1764706, 1,
-0.2527416, -1.246622, -2.617296, 0, 1, 0.1843137, 1,
-0.2477968, 0.5086839, -0.2654304, 0, 1, 0.1882353, 1,
-0.2446862, -0.6191525, -1.532765, 0, 1, 0.1960784, 1,
-0.2436289, 1.512456, 0.6202179, 0, 1, 0.2039216, 1,
-0.2431344, -0.466465, -1.061355, 0, 1, 0.2078431, 1,
-0.2369615, -1.219911, -3.12521, 0, 1, 0.2156863, 1,
-0.2352922, 1.232054, -0.7051228, 0, 1, 0.2196078, 1,
-0.2350183, -1.340139, -3.53211, 0, 1, 0.227451, 1,
-0.2325961, -0.7115398, -3.164771, 0, 1, 0.2313726, 1,
-0.2309114, 0.6620956, 0.4130837, 0, 1, 0.2392157, 1,
-0.2302827, 0.5774452, -0.5126637, 0, 1, 0.2431373, 1,
-0.2301356, 0.03254068, -1.82343, 0, 1, 0.2509804, 1,
-0.2119344, -0.6349116, -2.641536, 0, 1, 0.254902, 1,
-0.2105518, -0.6658428, -1.66451, 0, 1, 0.2627451, 1,
-0.2100856, 0.5374159, -1.180252, 0, 1, 0.2666667, 1,
-0.2087003, 0.413705, -1.147219, 0, 1, 0.2745098, 1,
-0.2046974, -0.6397069, 0.4654734, 0, 1, 0.2784314, 1,
-0.2043182, -0.7808973, -1.318563, 0, 1, 0.2862745, 1,
-0.2036488, 0.9017511, -0.8582672, 0, 1, 0.2901961, 1,
-0.2030865, 0.8772117, -0.03356249, 0, 1, 0.2980392, 1,
-0.201141, -0.3101116, -2.70133, 0, 1, 0.3058824, 1,
-0.2005298, -0.1028435, -1.710559, 0, 1, 0.3098039, 1,
-0.1997516, 0.8638963, -0.0324052, 0, 1, 0.3176471, 1,
-0.1989224, 0.4907213, 1.260345, 0, 1, 0.3215686, 1,
-0.1978808, 0.3750435, -2.347382, 0, 1, 0.3294118, 1,
-0.1970095, -0.8242177, -4.088751, 0, 1, 0.3333333, 1,
-0.1967797, 0.6470812, -2.270571, 0, 1, 0.3411765, 1,
-0.19596, -2.745899, -2.31878, 0, 1, 0.345098, 1,
-0.1928024, -1.292375, -3.266968, 0, 1, 0.3529412, 1,
-0.1838967, 0.741672, 0.172977, 0, 1, 0.3568628, 1,
-0.1771048, -0.8433159, -1.30768, 0, 1, 0.3647059, 1,
-0.1722299, 0.4811075, 0.2802646, 0, 1, 0.3686275, 1,
-0.1708079, 0.3332295, -1.001283, 0, 1, 0.3764706, 1,
-0.1696904, 1.535047, 0.8358254, 0, 1, 0.3803922, 1,
-0.1646741, -0.8118265, -3.958709, 0, 1, 0.3882353, 1,
-0.1646634, 0.6746144, -1.280368, 0, 1, 0.3921569, 1,
-0.1617687, 0.2779648, -0.7198963, 0, 1, 0.4, 1,
-0.1616971, -0.4666199, -4.710369, 0, 1, 0.4078431, 1,
-0.1602638, 0.2506551, -1.629342, 0, 1, 0.4117647, 1,
-0.1574331, 1.570319, -1.088999, 0, 1, 0.4196078, 1,
-0.1511133, 0.9524666, 0.7946644, 0, 1, 0.4235294, 1,
-0.1483547, -0.8739595, -5.331763, 0, 1, 0.4313726, 1,
-0.1471359, 0.7809849, -0.3735476, 0, 1, 0.4352941, 1,
-0.1456511, -1.0003, -4.297474, 0, 1, 0.4431373, 1,
-0.1436835, 0.8278896, 0.4622353, 0, 1, 0.4470588, 1,
-0.1408821, 0.3677172, 0.8140816, 0, 1, 0.454902, 1,
-0.1373159, 1.214225, 0.3878926, 0, 1, 0.4588235, 1,
-0.1369272, 0.552654, 0.5321768, 0, 1, 0.4666667, 1,
-0.1365066, 1.306749, -0.4059885, 0, 1, 0.4705882, 1,
-0.1350001, 0.3325785, -0.2578085, 0, 1, 0.4784314, 1,
-0.1346364, -0.5090846, -3.003699, 0, 1, 0.4823529, 1,
-0.1317657, -0.912981, -2.748538, 0, 1, 0.4901961, 1,
-0.1303061, -0.1619794, -2.874403, 0, 1, 0.4941176, 1,
-0.1255194, -0.07744184, -0.8948606, 0, 1, 0.5019608, 1,
-0.1212448, 1.328494, 0.8968701, 0, 1, 0.509804, 1,
-0.1196009, -0.9364533, -2.383462, 0, 1, 0.5137255, 1,
-0.1188061, -0.2436688, -1.393458, 0, 1, 0.5215687, 1,
-0.1143469, -1.637196, -3.017782, 0, 1, 0.5254902, 1,
-0.1133583, 0.9543379, 0.7094724, 0, 1, 0.5333334, 1,
-0.1094124, 0.5743024, -0.1278183, 0, 1, 0.5372549, 1,
-0.1028185, 1.373436, -0.2069489, 0, 1, 0.5450981, 1,
-0.1024847, 1.729048, 0.2185289, 0, 1, 0.5490196, 1,
-0.1012944, 0.4600706, 0.8543525, 0, 1, 0.5568628, 1,
-0.1009224, -0.6155571, -4.24668, 0, 1, 0.5607843, 1,
-0.09978934, 0.9143579, 0.8194417, 0, 1, 0.5686275, 1,
-0.09725459, -0.4202463, -3.709219, 0, 1, 0.572549, 1,
-0.09397698, 0.2883033, -0.3282185, 0, 1, 0.5803922, 1,
-0.08632012, -0.4924625, -3.359653, 0, 1, 0.5843138, 1,
-0.0823449, 0.7884215, 0.2189302, 0, 1, 0.5921569, 1,
-0.0800976, 1.157098, 0.9213991, 0, 1, 0.5960785, 1,
-0.07546329, -0.1672131, -3.196733, 0, 1, 0.6039216, 1,
-0.07118522, 0.860287, -1.709316, 0, 1, 0.6117647, 1,
-0.07109823, 0.5029789, -0.8063774, 0, 1, 0.6156863, 1,
-0.06748058, 1.585478, -0.6209282, 0, 1, 0.6235294, 1,
-0.06733964, 0.93649, -1.13057, 0, 1, 0.627451, 1,
-0.06626829, -0.5349261, -1.896683, 0, 1, 0.6352941, 1,
-0.06121434, 1.534488, 0.5418783, 0, 1, 0.6392157, 1,
-0.0607355, 0.4491078, -0.05812426, 0, 1, 0.6470588, 1,
-0.05705204, -0.2115168, -2.349421, 0, 1, 0.6509804, 1,
-0.04498373, -0.452704, -2.018445, 0, 1, 0.6588235, 1,
-0.03977108, 0.6773262, -1.671453, 0, 1, 0.6627451, 1,
-0.03780987, 1.343768, -2.836529, 0, 1, 0.6705883, 1,
-0.03163225, -0.1949413, -2.108042, 0, 1, 0.6745098, 1,
-0.02943394, 0.9713196, 1.153343, 0, 1, 0.682353, 1,
-0.02751449, 1.099811, 0.2423168, 0, 1, 0.6862745, 1,
-0.02433551, -0.7075329, -1.54082, 0, 1, 0.6941177, 1,
-0.02264708, -1.083626, -4.778533, 0, 1, 0.7019608, 1,
-0.01598429, 1.073615, -0.5945356, 0, 1, 0.7058824, 1,
-0.01338739, 0.597195, 1.774516, 0, 1, 0.7137255, 1,
-0.01324124, 0.6034145, -0.6276779, 0, 1, 0.7176471, 1,
-0.01152883, 0.8760248, 0.6454755, 0, 1, 0.7254902, 1,
-0.009496725, -1.236431, -4.136902, 0, 1, 0.7294118, 1,
-0.007940273, -0.1913798, -2.718495, 0, 1, 0.7372549, 1,
-0.006719739, 0.2827639, -0.7375414, 0, 1, 0.7411765, 1,
-0.005751032, -1.082611, -3.468223, 0, 1, 0.7490196, 1,
-0.003132461, -1.598936, -3.516047, 0, 1, 0.7529412, 1,
-0.002447962, 1.490632, 0.4039178, 0, 1, 0.7607843, 1,
-0.001879914, -0.4625178, -1.727852, 0, 1, 0.7647059, 1,
-0.001375025, -0.8933079, -2.667551, 0, 1, 0.772549, 1,
0.0029953, -0.1433526, 3.395621, 0, 1, 0.7764706, 1,
0.003270632, -0.8925725, 2.385914, 0, 1, 0.7843137, 1,
0.003963192, 0.3392694, -1.657692, 0, 1, 0.7882353, 1,
0.004885057, -0.1753412, 3.619608, 0, 1, 0.7960784, 1,
0.00718781, 0.2877104, 0.7848723, 0, 1, 0.8039216, 1,
0.008185292, 0.2482757, -0.4928566, 0, 1, 0.8078431, 1,
0.01560343, -0.01074235, 1.47508, 0, 1, 0.8156863, 1,
0.01580804, 1.133911, -2.424667, 0, 1, 0.8196079, 1,
0.01636419, 1.655847, 1.06876, 0, 1, 0.827451, 1,
0.01792087, 0.1028554, 1.150133, 0, 1, 0.8313726, 1,
0.01882768, 0.4516527, -0.2385836, 0, 1, 0.8392157, 1,
0.01918858, -0.3656103, 3.319242, 0, 1, 0.8431373, 1,
0.02208727, 1.317427, 0.5582389, 0, 1, 0.8509804, 1,
0.02416142, 0.7715592, 1.805697, 0, 1, 0.854902, 1,
0.02632151, 1.433748, 0.6176805, 0, 1, 0.8627451, 1,
0.02740839, -1.103793, 1.573113, 0, 1, 0.8666667, 1,
0.03355945, 0.3696931, 0.7837319, 0, 1, 0.8745098, 1,
0.03611435, 1.258913, -1.143515, 0, 1, 0.8784314, 1,
0.03803019, -0.2261019, 3.560538, 0, 1, 0.8862745, 1,
0.03806493, -0.5903868, 3.59376, 0, 1, 0.8901961, 1,
0.03868871, 1.730712, -0.7170239, 0, 1, 0.8980392, 1,
0.03937967, -0.3991381, 2.470635, 0, 1, 0.9058824, 1,
0.04033837, -0.4021692, 2.672146, 0, 1, 0.9098039, 1,
0.04293719, 0.3775293, 0.4065839, 0, 1, 0.9176471, 1,
0.04331949, 0.5027097, 1.23982, 0, 1, 0.9215686, 1,
0.04388021, -0.5744923, 3.293208, 0, 1, 0.9294118, 1,
0.04589377, -0.7619433, 2.358051, 0, 1, 0.9333333, 1,
0.04782207, 0.7656003, -2.49177, 0, 1, 0.9411765, 1,
0.05026673, -0.9748809, 1.672065, 0, 1, 0.945098, 1,
0.06160164, -0.3034988, 3.183749, 0, 1, 0.9529412, 1,
0.06820242, -0.1908754, 3.034421, 0, 1, 0.9568627, 1,
0.07259256, 0.1922884, -0.3445109, 0, 1, 0.9647059, 1,
0.07395247, -0.2292663, 2.861371, 0, 1, 0.9686275, 1,
0.07721846, -0.9095262, 2.345922, 0, 1, 0.9764706, 1,
0.07801092, 0.5574093, -0.8997106, 0, 1, 0.9803922, 1,
0.07936296, -0.654741, 2.536532, 0, 1, 0.9882353, 1,
0.08239514, -0.01992769, 1.301433, 0, 1, 0.9921569, 1,
0.08608723, -0.200116, 4.328849, 0, 1, 1, 1,
0.09196639, -0.08481429, 2.519633, 0, 0.9921569, 1, 1,
0.09241884, -0.4991889, 3.650061, 0, 0.9882353, 1, 1,
0.09661745, 0.5284162, -0.2645159, 0, 0.9803922, 1, 1,
0.1088821, 0.05758188, 2.502965, 0, 0.9764706, 1, 1,
0.1118725, 0.9563602, 0.8256067, 0, 0.9686275, 1, 1,
0.1126784, -0.4000744, 3.984032, 0, 0.9647059, 1, 1,
0.11778, -1.677797, 1.949005, 0, 0.9568627, 1, 1,
0.1196796, -1.066248, 3.846095, 0, 0.9529412, 1, 1,
0.1209799, 0.1762686, 0.3509219, 0, 0.945098, 1, 1,
0.1214611, 0.476398, 0.3332307, 0, 0.9411765, 1, 1,
0.1253978, -0.3215736, 1.775854, 0, 0.9333333, 1, 1,
0.1268568, -0.5491096, 2.522219, 0, 0.9294118, 1, 1,
0.1284682, -2.234165, 2.983871, 0, 0.9215686, 1, 1,
0.1353497, -1.122189, 2.391895, 0, 0.9176471, 1, 1,
0.1401474, -0.1975774, 1.839584, 0, 0.9098039, 1, 1,
0.1466893, -0.3900824, 2.776205, 0, 0.9058824, 1, 1,
0.1472838, 0.9584562, 1.722344, 0, 0.8980392, 1, 1,
0.1481474, -0.358478, 3.380809, 0, 0.8901961, 1, 1,
0.1487933, -0.5057614, 2.86858, 0, 0.8862745, 1, 1,
0.1539807, 0.4235648, 0.7762791, 0, 0.8784314, 1, 1,
0.1543029, -1.324853, 2.217621, 0, 0.8745098, 1, 1,
0.1557244, 0.6821128, 1.731767, 0, 0.8666667, 1, 1,
0.1593602, -0.3873425, 2.156217, 0, 0.8627451, 1, 1,
0.160281, -2.259978, 3.802798, 0, 0.854902, 1, 1,
0.1655378, -0.918713, 1.106819, 0, 0.8509804, 1, 1,
0.1659181, 0.02422826, 2.645323, 0, 0.8431373, 1, 1,
0.1674193, -1.387527, 3.663654, 0, 0.8392157, 1, 1,
0.1691718, -1.455781, 3.391442, 0, 0.8313726, 1, 1,
0.1706795, 0.4078609, 0.2789542, 0, 0.827451, 1, 1,
0.1708599, 1.218008, 0.3906529, 0, 0.8196079, 1, 1,
0.1763053, 1.798855, 0.6119691, 0, 0.8156863, 1, 1,
0.1797549, 0.7110699, 0.6669799, 0, 0.8078431, 1, 1,
0.1830218, -1.888712, 2.976753, 0, 0.8039216, 1, 1,
0.1887844, 1.162737, -0.958276, 0, 0.7960784, 1, 1,
0.189668, 0.7197062, 0.4095351, 0, 0.7882353, 1, 1,
0.1967553, 0.7821962, 0.6035326, 0, 0.7843137, 1, 1,
0.1972842, -0.02051228, 3.411222, 0, 0.7764706, 1, 1,
0.1973052, -0.9751917, 1.635097, 0, 0.772549, 1, 1,
0.1984434, 1.392465, -1.438567, 0, 0.7647059, 1, 1,
0.1997807, 1.378963, -0.149285, 0, 0.7607843, 1, 1,
0.2007212, -0.4707524, 2.896979, 0, 0.7529412, 1, 1,
0.2015901, -0.08428854, 3.026355, 0, 0.7490196, 1, 1,
0.2019006, 0.7979339, -0.102713, 0, 0.7411765, 1, 1,
0.2023005, -0.1475636, 2.418089, 0, 0.7372549, 1, 1,
0.2024641, 0.5888972, -0.2510105, 0, 0.7294118, 1, 1,
0.2070972, -0.3918185, 3.415907, 0, 0.7254902, 1, 1,
0.2083675, -1.999674, 4.032764, 0, 0.7176471, 1, 1,
0.211058, -2.026628, 3.741844, 0, 0.7137255, 1, 1,
0.2110883, -0.260217, 1.01539, 0, 0.7058824, 1, 1,
0.2121615, -1.248335, 3.298663, 0, 0.6980392, 1, 1,
0.2129778, 1.036895, -0.5530647, 0, 0.6941177, 1, 1,
0.2132717, 0.2385061, -0.3240959, 0, 0.6862745, 1, 1,
0.2137344, -0.1865668, -1.180029, 0, 0.682353, 1, 1,
0.2140215, -0.03395085, 1.507231, 0, 0.6745098, 1, 1,
0.2144281, -0.8358827, 3.243505, 0, 0.6705883, 1, 1,
0.2171666, 1.946893, -0.1504117, 0, 0.6627451, 1, 1,
0.2181422, -0.3973678, 2.183142, 0, 0.6588235, 1, 1,
0.2196359, -1.225368, 3.963981, 0, 0.6509804, 1, 1,
0.2197997, 0.01220459, 2.007036, 0, 0.6470588, 1, 1,
0.2261293, -0.5359947, 3.420765, 0, 0.6392157, 1, 1,
0.2269846, 0.69049, 1.872702, 0, 0.6352941, 1, 1,
0.2290867, 0.2045143, 0.3966462, 0, 0.627451, 1, 1,
0.2309843, 0.4490501, 0.9243307, 0, 0.6235294, 1, 1,
0.232867, 0.01307827, 1.945131, 0, 0.6156863, 1, 1,
0.2397455, 1.129186, 2.43481, 0, 0.6117647, 1, 1,
0.2424729, -1.04012, 1.869478, 0, 0.6039216, 1, 1,
0.2436351, 1.615666, -0.8436186, 0, 0.5960785, 1, 1,
0.2478452, 1.681307, 1.070918, 0, 0.5921569, 1, 1,
0.2583668, 0.940245, -0.3708049, 0, 0.5843138, 1, 1,
0.2611639, 0.1610143, 1.129439, 0, 0.5803922, 1, 1,
0.2627986, 0.5926272, 0.3689291, 0, 0.572549, 1, 1,
0.2661433, -1.241373, 5.140467, 0, 0.5686275, 1, 1,
0.2683361, 0.02316532, 2.263602, 0, 0.5607843, 1, 1,
0.2747958, 0.5926844, 0.6308385, 0, 0.5568628, 1, 1,
0.2780015, 0.4934177, -0.2962208, 0, 0.5490196, 1, 1,
0.2781405, 0.7353904, 1.499153, 0, 0.5450981, 1, 1,
0.2818023, 0.3400516, 0.6906998, 0, 0.5372549, 1, 1,
0.2835113, -0.2867295, 0.8935792, 0, 0.5333334, 1, 1,
0.2835582, 0.1528554, 2.166006, 0, 0.5254902, 1, 1,
0.2847469, -0.2294617, 2.038501, 0, 0.5215687, 1, 1,
0.2867785, -1.834193, 3.421223, 0, 0.5137255, 1, 1,
0.2894011, 1.060027, 0.4860315, 0, 0.509804, 1, 1,
0.2907446, -0.2716699, 1.894336, 0, 0.5019608, 1, 1,
0.2910995, 0.4705787, 1.388286, 0, 0.4941176, 1, 1,
0.2957843, 0.4181609, -1.534978, 0, 0.4901961, 1, 1,
0.300311, -0.4828602, 1.986415, 0, 0.4823529, 1, 1,
0.3019793, -1.650566, 4.413851, 0, 0.4784314, 1, 1,
0.3032204, -0.1289507, 1.219204, 0, 0.4705882, 1, 1,
0.3034064, -0.3698393, 1.550723, 0, 0.4666667, 1, 1,
0.3061298, 1.790032, -0.4612513, 0, 0.4588235, 1, 1,
0.3061817, 0.3299057, 0.6554634, 0, 0.454902, 1, 1,
0.3062342, 0.6784806, 0.8332471, 0, 0.4470588, 1, 1,
0.3089229, 0.2936934, 1.160177, 0, 0.4431373, 1, 1,
0.3104527, 0.8068569, -0.4126271, 0, 0.4352941, 1, 1,
0.3116677, -0.3096237, 2.582482, 0, 0.4313726, 1, 1,
0.3131771, 0.4353068, 3.609746, 0, 0.4235294, 1, 1,
0.3149995, 0.2716821, 1.459629, 0, 0.4196078, 1, 1,
0.3185971, 1.00194, 0.8879879, 0, 0.4117647, 1, 1,
0.3237655, -1.280139, 3.184813, 0, 0.4078431, 1, 1,
0.3300889, 0.206599, 1.069865, 0, 0.4, 1, 1,
0.3303562, 0.02427169, 1.651681, 0, 0.3921569, 1, 1,
0.330713, 1.394256, -0.3052835, 0, 0.3882353, 1, 1,
0.3316313, 0.2577685, 0.3115183, 0, 0.3803922, 1, 1,
0.3319867, 3.292279, 0.4043584, 0, 0.3764706, 1, 1,
0.3323309, 1.179141, -0.8362468, 0, 0.3686275, 1, 1,
0.3388792, 2.342774, -1.821335, 0, 0.3647059, 1, 1,
0.3449969, 0.104419, -0.9106534, 0, 0.3568628, 1, 1,
0.3461042, -1.891084, 2.821247, 0, 0.3529412, 1, 1,
0.3616072, 0.2528649, 0.3983202, 0, 0.345098, 1, 1,
0.3656732, 0.7047451, 1.732753, 0, 0.3411765, 1, 1,
0.37146, -0.502146, 2.860555, 0, 0.3333333, 1, 1,
0.3779856, -1.026039, 3.658922, 0, 0.3294118, 1, 1,
0.3783674, 0.6525958, 1.686829, 0, 0.3215686, 1, 1,
0.3791761, 0.9645984, -0.2323189, 0, 0.3176471, 1, 1,
0.3812091, -1.052135, 2.000259, 0, 0.3098039, 1, 1,
0.3815622, -0.6437542, 2.896858, 0, 0.3058824, 1, 1,
0.3894294, -0.2028302, 2.480441, 0, 0.2980392, 1, 1,
0.3895014, -1.147202, 2.903554, 0, 0.2901961, 1, 1,
0.3908551, -0.9164757, 3.033077, 0, 0.2862745, 1, 1,
0.3910121, 1.424595, -0.4754113, 0, 0.2784314, 1, 1,
0.3911469, -0.8267474, 1.787819, 0, 0.2745098, 1, 1,
0.3939764, -0.6514608, 2.786655, 0, 0.2666667, 1, 1,
0.3941885, 0.2313009, 0.2613028, 0, 0.2627451, 1, 1,
0.3952879, -1.091542, 2.408125, 0, 0.254902, 1, 1,
0.3957039, -0.9554469, 3.334352, 0, 0.2509804, 1, 1,
0.3985872, -0.02163045, 0.2809051, 0, 0.2431373, 1, 1,
0.4032717, 1.238647, 1.121812, 0, 0.2392157, 1, 1,
0.4047059, -2.075099, 4.581364, 0, 0.2313726, 1, 1,
0.4109247, -1.328054, 3.134097, 0, 0.227451, 1, 1,
0.4127106, -0.1727618, 2.20978, 0, 0.2196078, 1, 1,
0.4220137, 1.522431, 1.345353, 0, 0.2156863, 1, 1,
0.4244032, 0.197583, 2.056556, 0, 0.2078431, 1, 1,
0.4269546, 0.6428804, 0.3787681, 0, 0.2039216, 1, 1,
0.4307971, -1.294432, 3.35942, 0, 0.1960784, 1, 1,
0.4331564, -0.4916833, 0.6832553, 0, 0.1882353, 1, 1,
0.4345315, -0.9973775, 3.031396, 0, 0.1843137, 1, 1,
0.435488, -0.3103687, 1.927238, 0, 0.1764706, 1, 1,
0.444764, -0.4588238, 2.67168, 0, 0.172549, 1, 1,
0.4479785, -1.929228, 1.8139, 0, 0.1647059, 1, 1,
0.4518235, 0.4510611, -0.006557237, 0, 0.1607843, 1, 1,
0.4573812, -0.1540734, 2.265641, 0, 0.1529412, 1, 1,
0.4618222, 2.623018, 0.8451919, 0, 0.1490196, 1, 1,
0.4629666, 2.101374, -0.08258405, 0, 0.1411765, 1, 1,
0.4630399, 0.8950431, 0.80997, 0, 0.1372549, 1, 1,
0.4636542, 1.646716, -0.4887405, 0, 0.1294118, 1, 1,
0.4636932, -0.9749743, 2.490686, 0, 0.1254902, 1, 1,
0.4646163, -0.5185012, 3.811292, 0, 0.1176471, 1, 1,
0.4661747, -1.912996, 3.972993, 0, 0.1137255, 1, 1,
0.4666407, -0.05730813, 2.411633, 0, 0.1058824, 1, 1,
0.4697163, 0.1072568, 1.82436, 0, 0.09803922, 1, 1,
0.4737498, -0.3558332, -0.07725424, 0, 0.09411765, 1, 1,
0.4749343, 1.280014, 1.785258, 0, 0.08627451, 1, 1,
0.4751164, -0.9507468, 3.858643, 0, 0.08235294, 1, 1,
0.476405, -0.4041207, 3.102099, 0, 0.07450981, 1, 1,
0.4789825, -0.5429376, 2.256127, 0, 0.07058824, 1, 1,
0.4797567, 0.7372792, 0.9331988, 0, 0.0627451, 1, 1,
0.4797918, -1.496844, 1.910715, 0, 0.05882353, 1, 1,
0.4814766, -2.2758, 4.784963, 0, 0.05098039, 1, 1,
0.4845783, -1.001952, 1.849186, 0, 0.04705882, 1, 1,
0.4893978, -0.7784585, 0.08039012, 0, 0.03921569, 1, 1,
0.4913936, -0.7286634, 3.010772, 0, 0.03529412, 1, 1,
0.493429, -0.6537123, 1.056462, 0, 0.02745098, 1, 1,
0.5016814, -0.2580051, 3.702721, 0, 0.02352941, 1, 1,
0.5039687, -1.132895, 3.102428, 0, 0.01568628, 1, 1,
0.5093661, 0.1635701, 0.6917425, 0, 0.01176471, 1, 1,
0.5105497, 0.03330351, 1.684374, 0, 0.003921569, 1, 1,
0.5128717, 0.6277391, 0.9356101, 0.003921569, 0, 1, 1,
0.5132334, 0.1734079, 3.24246, 0.007843138, 0, 1, 1,
0.5158921, 0.6602671, 1.663859, 0.01568628, 0, 1, 1,
0.5174047, -1.436844, 4.66766, 0.01960784, 0, 1, 1,
0.5196924, -2.056926, 0.9234539, 0.02745098, 0, 1, 1,
0.5213248, 1.111678, 0.9647365, 0.03137255, 0, 1, 1,
0.5226547, 0.4660706, 0.5856163, 0.03921569, 0, 1, 1,
0.5229242, 0.3690472, 0.8170353, 0.04313726, 0, 1, 1,
0.5257095, 0.0002088481, 1.09886, 0.05098039, 0, 1, 1,
0.5282482, 0.5114542, 2.512426, 0.05490196, 0, 1, 1,
0.5323213, 0.7973483, 0.1135907, 0.0627451, 0, 1, 1,
0.5345134, -0.3054398, 1.166591, 0.06666667, 0, 1, 1,
0.5368467, 0.3643818, 0.6271424, 0.07450981, 0, 1, 1,
0.5384851, -0.2634225, 2.504263, 0.07843138, 0, 1, 1,
0.5385987, 0.3238675, -0.6109851, 0.08627451, 0, 1, 1,
0.5389487, -0.5083885, 0.8225322, 0.09019608, 0, 1, 1,
0.539004, -0.1873222, 0.1210098, 0.09803922, 0, 1, 1,
0.5473471, 0.6499412, 0.9467604, 0.1058824, 0, 1, 1,
0.548377, 0.5351481, 1.850406, 0.1098039, 0, 1, 1,
0.5500255, -0.7681271, 3.204489, 0.1176471, 0, 1, 1,
0.5511553, -0.4241862, 2.977963, 0.1215686, 0, 1, 1,
0.5532026, -0.7421919, 2.920172, 0.1294118, 0, 1, 1,
0.5532134, -0.5413703, 4.499549, 0.1333333, 0, 1, 1,
0.55419, -0.0283161, 1.864756, 0.1411765, 0, 1, 1,
0.5556842, -0.2324328, 2.034125, 0.145098, 0, 1, 1,
0.55686, -0.435224, 1.839468, 0.1529412, 0, 1, 1,
0.5586095, 0.1080781, 0.8529513, 0.1568628, 0, 1, 1,
0.5589762, 1.03861, 2.694416, 0.1647059, 0, 1, 1,
0.5606263, -1.460539, 2.785277, 0.1686275, 0, 1, 1,
0.5630484, -0.3789066, -0.4344519, 0.1764706, 0, 1, 1,
0.5650104, -1.146286, 3.378345, 0.1803922, 0, 1, 1,
0.5688302, -0.9595418, 2.405208, 0.1882353, 0, 1, 1,
0.5746396, -0.1126634, 2.83294, 0.1921569, 0, 1, 1,
0.5799985, 0.6708354, 0.4068212, 0.2, 0, 1, 1,
0.5841506, -1.159964, 2.244244, 0.2078431, 0, 1, 1,
0.5871478, 0.6063977, 3.215759, 0.2117647, 0, 1, 1,
0.5970131, -0.8165169, 1.216718, 0.2196078, 0, 1, 1,
0.5974451, -1.27624, 1.476637, 0.2235294, 0, 1, 1,
0.6006631, -2.384195, 3.774543, 0.2313726, 0, 1, 1,
0.6021385, 0.6053636, 3.216134, 0.2352941, 0, 1, 1,
0.6042876, 0.1621517, 2.503943, 0.2431373, 0, 1, 1,
0.6080185, 0.1735888, 1.559502, 0.2470588, 0, 1, 1,
0.6125227, -1.471727, 1.281532, 0.254902, 0, 1, 1,
0.6135356, 0.05602962, 2.594848, 0.2588235, 0, 1, 1,
0.6208186, -1.109637, 3.740852, 0.2666667, 0, 1, 1,
0.6221466, 0.9512021, 1.75964, 0.2705882, 0, 1, 1,
0.6257207, 0.8762034, 0.6915685, 0.2784314, 0, 1, 1,
0.6274074, -1.068066, 3.537698, 0.282353, 0, 1, 1,
0.6285602, -0.5232179, 1.849453, 0.2901961, 0, 1, 1,
0.6321528, -1.143171, 4.432663, 0.2941177, 0, 1, 1,
0.6460552, 0.0634151, 0.572116, 0.3019608, 0, 1, 1,
0.6536136, -0.7619744, 2.293295, 0.3098039, 0, 1, 1,
0.6563138, -1.368005, 2.286425, 0.3137255, 0, 1, 1,
0.6577009, 0.4672465, 2.002019, 0.3215686, 0, 1, 1,
0.6584112, 0.9489275, 0.4900017, 0.3254902, 0, 1, 1,
0.661851, 2.566817, -1.648613, 0.3333333, 0, 1, 1,
0.6635899, 0.3705342, 0.547728, 0.3372549, 0, 1, 1,
0.6666565, -1.909975, 3.99792, 0.345098, 0, 1, 1,
0.6677335, 1.624989, -1.205551, 0.3490196, 0, 1, 1,
0.6684222, -0.9146551, 3.221107, 0.3568628, 0, 1, 1,
0.6731104, 0.3818153, 0.4056119, 0.3607843, 0, 1, 1,
0.6741593, 0.7829972, -1.11231, 0.3686275, 0, 1, 1,
0.6746026, -0.3152124, 2.207605, 0.372549, 0, 1, 1,
0.6748736, -1.459612, 2.901537, 0.3803922, 0, 1, 1,
0.6773626, -0.0919864, 1.221373, 0.3843137, 0, 1, 1,
0.6794237, -0.735794, 1.669066, 0.3921569, 0, 1, 1,
0.6837428, -0.2224801, 1.512538, 0.3960784, 0, 1, 1,
0.6860181, 0.5284836, 0.4506623, 0.4039216, 0, 1, 1,
0.6891925, 0.1226601, 3.454288, 0.4117647, 0, 1, 1,
0.6963211, -0.5512747, 2.797973, 0.4156863, 0, 1, 1,
0.6989083, -2.117578, 2.430319, 0.4235294, 0, 1, 1,
0.7000606, -0.4704723, 3.607278, 0.427451, 0, 1, 1,
0.7004512, -0.08679919, 2.001495, 0.4352941, 0, 1, 1,
0.7006826, 0.506209, -0.9197854, 0.4392157, 0, 1, 1,
0.7043644, 0.3973531, 0.3140336, 0.4470588, 0, 1, 1,
0.7129136, 1.304461, 1.665763, 0.4509804, 0, 1, 1,
0.7220749, 0.08318803, 1.227525, 0.4588235, 0, 1, 1,
0.7266648, 1.376997, 0.5241592, 0.4627451, 0, 1, 1,
0.7286284, -0.3779153, 3.820413, 0.4705882, 0, 1, 1,
0.7304212, -1.748364, 2.744071, 0.4745098, 0, 1, 1,
0.7324089, -0.1921213, 3.007405, 0.4823529, 0, 1, 1,
0.7356925, 0.2706876, 1.851668, 0.4862745, 0, 1, 1,
0.7365669, 1.167195, 1.481093, 0.4941176, 0, 1, 1,
0.739814, 0.06737702, 0.6761763, 0.5019608, 0, 1, 1,
0.7448919, -0.8048303, 0.2348908, 0.5058824, 0, 1, 1,
0.74726, -0.08112902, 3.438417, 0.5137255, 0, 1, 1,
0.753486, -1.23108, 3.504204, 0.5176471, 0, 1, 1,
0.7580898, -1.852147, 2.668005, 0.5254902, 0, 1, 1,
0.7605795, -1.983573, 3.866357, 0.5294118, 0, 1, 1,
0.7608631, -2.007897, 1.787219, 0.5372549, 0, 1, 1,
0.7618933, -0.4035002, 1.532942, 0.5411765, 0, 1, 1,
0.7631592, -2.127105, 2.946043, 0.5490196, 0, 1, 1,
0.7656343, -1.879988, 2.835527, 0.5529412, 0, 1, 1,
0.7677289, 0.3378084, 2.834981, 0.5607843, 0, 1, 1,
0.7707195, -1.081494, 3.896415, 0.5647059, 0, 1, 1,
0.7741864, -0.9080507, 3.014337, 0.572549, 0, 1, 1,
0.7742687, 0.4677369, -0.1189666, 0.5764706, 0, 1, 1,
0.7787703, -0.06777553, 0.9524099, 0.5843138, 0, 1, 1,
0.779154, -0.4407514, 0.6343167, 0.5882353, 0, 1, 1,
0.7792522, -0.009275931, 1.666709, 0.5960785, 0, 1, 1,
0.7810946, 3.303277, 0.3174362, 0.6039216, 0, 1, 1,
0.7814745, 0.9140724, 1.016874, 0.6078432, 0, 1, 1,
0.7880378, 2.113276, -0.1768742, 0.6156863, 0, 1, 1,
0.7938399, -1.117252, 1.796448, 0.6196079, 0, 1, 1,
0.7945768, 1.019886, 1.076077, 0.627451, 0, 1, 1,
0.7949519, -1.623791, 0.50587, 0.6313726, 0, 1, 1,
0.7950237, 0.2800713, 0.7760291, 0.6392157, 0, 1, 1,
0.7957554, 0.06950926, 1.784676, 0.6431373, 0, 1, 1,
0.7997004, -1.199178, 0.4629458, 0.6509804, 0, 1, 1,
0.8007898, 0.981078, 0.08752549, 0.654902, 0, 1, 1,
0.8011132, 0.08464488, -0.2767084, 0.6627451, 0, 1, 1,
0.804992, -0.3925063, 1.729424, 0.6666667, 0, 1, 1,
0.8081675, 0.1896722, 1.785487, 0.6745098, 0, 1, 1,
0.8135433, 0.4891537, 2.375936, 0.6784314, 0, 1, 1,
0.817499, -0.03715462, 1.435663, 0.6862745, 0, 1, 1,
0.8200125, 1.09258, 0.2622171, 0.6901961, 0, 1, 1,
0.8226225, 1.144665, -0.1900235, 0.6980392, 0, 1, 1,
0.8262251, -0.6074806, 4.175164, 0.7058824, 0, 1, 1,
0.8263512, 0.3673292, 0.7742863, 0.7098039, 0, 1, 1,
0.831281, -0.2738286, 0.9162134, 0.7176471, 0, 1, 1,
0.8390337, -1.351882, 4.975531, 0.7215686, 0, 1, 1,
0.8451172, 0.6555173, -0.9321867, 0.7294118, 0, 1, 1,
0.8505847, 0.5071697, 0.5088557, 0.7333333, 0, 1, 1,
0.8509322, -0.79579, 2.581667, 0.7411765, 0, 1, 1,
0.8517758, 0.1953602, 1.94869, 0.7450981, 0, 1, 1,
0.8548408, 0.9037014, -0.9969444, 0.7529412, 0, 1, 1,
0.8643742, 0.9697665, 1.882185, 0.7568628, 0, 1, 1,
0.8672569, 0.3073038, 1.49518, 0.7647059, 0, 1, 1,
0.8741534, 1.696388, 0.5911318, 0.7686275, 0, 1, 1,
0.8826649, 1.920049, 0.5401899, 0.7764706, 0, 1, 1,
0.8870974, 0.5088848, 0.8414737, 0.7803922, 0, 1, 1,
0.8899747, -0.6592034, 1.604553, 0.7882353, 0, 1, 1,
0.8913922, -0.08593008, 2.030264, 0.7921569, 0, 1, 1,
0.8928218, -0.3388065, 4.202107, 0.8, 0, 1, 1,
0.8946724, -0.06219789, 0.212568, 0.8078431, 0, 1, 1,
0.8957571, 1.176062, -0.7704617, 0.8117647, 0, 1, 1,
0.8967559, -0.9348471, 4.132685, 0.8196079, 0, 1, 1,
0.899832, -0.2887921, 0.3436621, 0.8235294, 0, 1, 1,
0.9026659, 0.2563996, 1.832272, 0.8313726, 0, 1, 1,
0.9064886, 0.3597281, 1.469311, 0.8352941, 0, 1, 1,
0.9120398, -1.00598, 2.917394, 0.8431373, 0, 1, 1,
0.9121214, 0.3171732, 1.754274, 0.8470588, 0, 1, 1,
0.9158246, 0.3888651, 0.3301432, 0.854902, 0, 1, 1,
0.916597, -2.039463, 2.701424, 0.8588235, 0, 1, 1,
0.9208034, 0.2710053, 1.516191, 0.8666667, 0, 1, 1,
0.9214732, -1.38434, 1.881428, 0.8705882, 0, 1, 1,
0.9240863, -0.2086505, 0.4356686, 0.8784314, 0, 1, 1,
0.9286041, -1.661996, 1.44471, 0.8823529, 0, 1, 1,
0.9294767, 1.219205, 0.007159166, 0.8901961, 0, 1, 1,
0.9419558, -0.3211796, 1.786653, 0.8941177, 0, 1, 1,
0.9491373, -0.206984, 2.842101, 0.9019608, 0, 1, 1,
0.9573022, 1.144127, 0.1282242, 0.9098039, 0, 1, 1,
0.9580114, -0.3689294, -0.2646964, 0.9137255, 0, 1, 1,
0.9597077, 0.1215563, 2.593075, 0.9215686, 0, 1, 1,
0.962491, -1.58457, 3.009497, 0.9254902, 0, 1, 1,
0.9635392, -0.1241703, 1.735877, 0.9333333, 0, 1, 1,
0.966602, 0.4639696, -0.0570125, 0.9372549, 0, 1, 1,
0.9704905, 0.3822201, 0.7086142, 0.945098, 0, 1, 1,
0.9754041, 1.751622, 0.6389804, 0.9490196, 0, 1, 1,
0.9779702, -0.06145698, 1.329689, 0.9568627, 0, 1, 1,
0.9793561, 0.3381422, 2.326778, 0.9607843, 0, 1, 1,
0.9848578, -1.839564, 2.660648, 0.9686275, 0, 1, 1,
0.988139, -0.531552, 2.991966, 0.972549, 0, 1, 1,
0.9883166, -0.09017687, 1.723869, 0.9803922, 0, 1, 1,
0.9983562, 0.3620467, -0.2295552, 0.9843137, 0, 1, 1,
1.001287, -1.561426, 1.084035, 0.9921569, 0, 1, 1,
1.006002, -1.982404, 4.144763, 0.9960784, 0, 1, 1,
1.024803, -1.055294, 2.812928, 1, 0, 0.9960784, 1,
1.025281, 0.1360961, 0.3881173, 1, 0, 0.9882353, 1,
1.029853, -0.1622497, 0.8456269, 1, 0, 0.9843137, 1,
1.037572, -0.9394054, 1.312583, 1, 0, 0.9764706, 1,
1.039462, 1.461627, -0.7890345, 1, 0, 0.972549, 1,
1.048052, -0.9068403, 2.290396, 1, 0, 0.9647059, 1,
1.052462, 1.742524, 2.416997, 1, 0, 0.9607843, 1,
1.055737, 1.664364, -0.3673759, 1, 0, 0.9529412, 1,
1.063209, -1.390621, 2.609332, 1, 0, 0.9490196, 1,
1.063504, -1.418617, 4.133008, 1, 0, 0.9411765, 1,
1.069117, 0.5218769, 0.854342, 1, 0, 0.9372549, 1,
1.085966, -0.2107736, 2.268607, 1, 0, 0.9294118, 1,
1.090144, 0.1262512, 3.011681, 1, 0, 0.9254902, 1,
1.091762, -0.1863391, 1.619617, 1, 0, 0.9176471, 1,
1.092675, -0.2494589, 1.476102, 1, 0, 0.9137255, 1,
1.096721, -0.9654721, 2.653279, 1, 0, 0.9058824, 1,
1.097943, -0.4212725, 2.507627, 1, 0, 0.9019608, 1,
1.098721, -0.8407528, 4.256972, 1, 0, 0.8941177, 1,
1.102145, 0.9690793, 2.671306, 1, 0, 0.8862745, 1,
1.110305, 2.328662, -0.2641391, 1, 0, 0.8823529, 1,
1.111508, -0.8610435, 1.547495, 1, 0, 0.8745098, 1,
1.117101, -0.7035265, 1.549331, 1, 0, 0.8705882, 1,
1.120342, 1.787293, 0.5251077, 1, 0, 0.8627451, 1,
1.137691, 0.4287742, 0.9239219, 1, 0, 0.8588235, 1,
1.149057, 1.176653, 0.946461, 1, 0, 0.8509804, 1,
1.151751, 0.1121779, 0.1267882, 1, 0, 0.8470588, 1,
1.155344, 1.086323, 1.124161, 1, 0, 0.8392157, 1,
1.156723, 0.7705297, 2.289619, 1, 0, 0.8352941, 1,
1.156772, 0.9089736, -0.05065586, 1, 0, 0.827451, 1,
1.172348, 0.09628828, 2.449232, 1, 0, 0.8235294, 1,
1.178892, 2.001789, 0.6829159, 1, 0, 0.8156863, 1,
1.182297, -1.605777, 4.149462, 1, 0, 0.8117647, 1,
1.187802, -0.7906285, 1.616509, 1, 0, 0.8039216, 1,
1.188748, 0.1516455, -1.592843, 1, 0, 0.7960784, 1,
1.193754, -0.562262, 2.39657, 1, 0, 0.7921569, 1,
1.194672, -0.1182794, 4.083846, 1, 0, 0.7843137, 1,
1.195341, 1.07158, 1.420588, 1, 0, 0.7803922, 1,
1.201436, -0.494174, 1.510416, 1, 0, 0.772549, 1,
1.203782, -0.6780252, 2.644634, 1, 0, 0.7686275, 1,
1.211147, 1.672581, 0.4729218, 1, 0, 0.7607843, 1,
1.215654, -0.3742956, 0.4392937, 1, 0, 0.7568628, 1,
1.222536, 1.234718, 1.881401, 1, 0, 0.7490196, 1,
1.223316, -0.7057917, 1.786584, 1, 0, 0.7450981, 1,
1.22838, 0.2933807, 1.11747, 1, 0, 0.7372549, 1,
1.228613, -0.4839695, 2.355787, 1, 0, 0.7333333, 1,
1.229578, -1.515364, 2.499143, 1, 0, 0.7254902, 1,
1.233441, -0.3517532, 1.195194, 1, 0, 0.7215686, 1,
1.238708, 0.6567386, 0.6741216, 1, 0, 0.7137255, 1,
1.243442, 1.836456, 0.3381999, 1, 0, 0.7098039, 1,
1.247241, -2.171545, 3.549173, 1, 0, 0.7019608, 1,
1.252767, -1.087072, 0.3048309, 1, 0, 0.6941177, 1,
1.253841, 0.2525904, 1.396277, 1, 0, 0.6901961, 1,
1.257981, -0.3863268, 3.696284, 1, 0, 0.682353, 1,
1.268902, 0.03875051, 3.41647, 1, 0, 0.6784314, 1,
1.27343, 0.06250043, 1.203835, 1, 0, 0.6705883, 1,
1.274376, -0.6819816, 1.824194, 1, 0, 0.6666667, 1,
1.274817, 0.4122098, 2.066344, 1, 0, 0.6588235, 1,
1.279262, -0.3618092, 3.584641, 1, 0, 0.654902, 1,
1.281464, 0.6583625, 1.726985, 1, 0, 0.6470588, 1,
1.289803, 1.860357, 1.937962, 1, 0, 0.6431373, 1,
1.307208, 0.2994787, 0.8804041, 1, 0, 0.6352941, 1,
1.308502, 0.8794519, 0.09667854, 1, 0, 0.6313726, 1,
1.3157, 0.6458926, 1.326662, 1, 0, 0.6235294, 1,
1.33065, -3.246397, 3.341792, 1, 0, 0.6196079, 1,
1.341712, -1.071214, 3.628733, 1, 0, 0.6117647, 1,
1.341738, -0.03843791, 0.8306865, 1, 0, 0.6078432, 1,
1.343449, 1.055944, 1.524149, 1, 0, 0.6, 1,
1.351523, 0.6119356, 0.3365544, 1, 0, 0.5921569, 1,
1.355537, -0.8604987, 1.963948, 1, 0, 0.5882353, 1,
1.368435, -0.2555082, 2.957766, 1, 0, 0.5803922, 1,
1.370661, 0.405845, 0.00261659, 1, 0, 0.5764706, 1,
1.37513, 2.106249, 1.29678, 1, 0, 0.5686275, 1,
1.377048, -1.493806, 3.460689, 1, 0, 0.5647059, 1,
1.378579, -0.3771114, 2.923301, 1, 0, 0.5568628, 1,
1.384503, 0.103145, 0.2042201, 1, 0, 0.5529412, 1,
1.390192, 0.1094217, 2.312723, 1, 0, 0.5450981, 1,
1.394199, 0.8249789, -0.09214235, 1, 0, 0.5411765, 1,
1.398639, 0.6307272, 0.7645514, 1, 0, 0.5333334, 1,
1.4113, 0.5785738, 0.9551859, 1, 0, 0.5294118, 1,
1.413043, -0.9129884, 2.130614, 1, 0, 0.5215687, 1,
1.426636, 0.2241142, 1.838581, 1, 0, 0.5176471, 1,
1.429556, -0.1108413, 2.916373, 1, 0, 0.509804, 1,
1.438119, -1.557939, 3.568681, 1, 0, 0.5058824, 1,
1.438535, -1.250039, 3.614478, 1, 0, 0.4980392, 1,
1.439501, 0.1887247, 1.302145, 1, 0, 0.4901961, 1,
1.450793, -0.09012207, 1.5295, 1, 0, 0.4862745, 1,
1.452756, 0.3262421, 1.428952, 1, 0, 0.4784314, 1,
1.459412, -0.06157182, 2.969249, 1, 0, 0.4745098, 1,
1.463962, 0.6658214, -0.7545279, 1, 0, 0.4666667, 1,
1.46397, -0.282809, -0.313863, 1, 0, 0.4627451, 1,
1.472066, 1.119684, 2.210282, 1, 0, 0.454902, 1,
1.479429, 0.5194149, 0.9592535, 1, 0, 0.4509804, 1,
1.480483, 0.3843631, 0.08754944, 1, 0, 0.4431373, 1,
1.483621, 0.6236916, 1.624139, 1, 0, 0.4392157, 1,
1.491199, 1.424466, 2.543979, 1, 0, 0.4313726, 1,
1.494242, 1.459137, -0.1777395, 1, 0, 0.427451, 1,
1.501513, -1.519867, 3.380887, 1, 0, 0.4196078, 1,
1.510685, -0.1507545, 0.1159841, 1, 0, 0.4156863, 1,
1.530053, -0.8903659, -0.4802747, 1, 0, 0.4078431, 1,
1.54242, 0.8206818, 2.317943, 1, 0, 0.4039216, 1,
1.568239, 0.9191568, 1.280835, 1, 0, 0.3960784, 1,
1.571487, -0.1381983, 0.2566769, 1, 0, 0.3882353, 1,
1.588469, -1.323764, 0.8911704, 1, 0, 0.3843137, 1,
1.592678, 0.5532677, 2.871565, 1, 0, 0.3764706, 1,
1.601243, -1.729161, 3.575017, 1, 0, 0.372549, 1,
1.601812, -0.5637542, 0.5254197, 1, 0, 0.3647059, 1,
1.618055, 0.1749876, 1.833299, 1, 0, 0.3607843, 1,
1.620544, -1.504443, 2.442346, 1, 0, 0.3529412, 1,
1.628431, -2.05525, 1.898057, 1, 0, 0.3490196, 1,
1.665084, 1.53097, 0.2060518, 1, 0, 0.3411765, 1,
1.665767, -1.662621, 2.322191, 1, 0, 0.3372549, 1,
1.675304, -0.1581451, 2.892371, 1, 0, 0.3294118, 1,
1.678875, -0.1894152, 2.694121, 1, 0, 0.3254902, 1,
1.685584, -0.1860278, -1.616955, 1, 0, 0.3176471, 1,
1.701107, -1.156901, 2.622417, 1, 0, 0.3137255, 1,
1.705446, -0.991612, 2.744892, 1, 0, 0.3058824, 1,
1.710571, 2.77313, 0.8755081, 1, 0, 0.2980392, 1,
1.718967, -0.2456936, 3.838038, 1, 0, 0.2941177, 1,
1.721204, 0.7037666, 0.8750048, 1, 0, 0.2862745, 1,
1.729187, -3.180181, 2.323489, 1, 0, 0.282353, 1,
1.750612, -0.9741106, 2.61012, 1, 0, 0.2745098, 1,
1.754914, -0.2567176, 1.55728, 1, 0, 0.2705882, 1,
1.761728, 0.3643932, 3.112359, 1, 0, 0.2627451, 1,
1.763844, 0.05714077, 1.409154, 1, 0, 0.2588235, 1,
1.808175, -0.0694375, 0.4562615, 1, 0, 0.2509804, 1,
1.835797, -0.7205623, 1.356558, 1, 0, 0.2470588, 1,
1.836748, -0.8236591, 1.018024, 1, 0, 0.2392157, 1,
1.851785, -1.225271, 2.551779, 1, 0, 0.2352941, 1,
1.887044, -0.8028456, 3.078234, 1, 0, 0.227451, 1,
1.902915, 1.202078, -0.4113326, 1, 0, 0.2235294, 1,
1.914337, 0.2200667, 1.582531, 1, 0, 0.2156863, 1,
1.960987, -1.037928, 2.50195, 1, 0, 0.2117647, 1,
1.968146, 0.7284448, 0.3005705, 1, 0, 0.2039216, 1,
1.973956, -0.7799479, 2.305057, 1, 0, 0.1960784, 1,
1.989501, -0.6359992, 2.231888, 1, 0, 0.1921569, 1,
2.060475, 0.9860747, 2.364884, 1, 0, 0.1843137, 1,
2.068619, 0.6966448, 2.840159, 1, 0, 0.1803922, 1,
2.069128, -0.5540757, 1.102239, 1, 0, 0.172549, 1,
2.085725, 0.1173847, 2.611945, 1, 0, 0.1686275, 1,
2.091718, -1.50257, 3.431337, 1, 0, 0.1607843, 1,
2.138016, 1.321695, 0.01922056, 1, 0, 0.1568628, 1,
2.150968, 1.292613, 1.789017, 1, 0, 0.1490196, 1,
2.173091, -1.169043, 1.772225, 1, 0, 0.145098, 1,
2.205818, -0.1695313, 2.544511, 1, 0, 0.1372549, 1,
2.216255, -1.3673, 1.724646, 1, 0, 0.1333333, 1,
2.217426, 0.8859823, 1.348333, 1, 0, 0.1254902, 1,
2.253282, -0.5460355, 1.585079, 1, 0, 0.1215686, 1,
2.268483, 1.147332, 0.4645177, 1, 0, 0.1137255, 1,
2.31419, -0.1659964, 4.445376, 1, 0, 0.1098039, 1,
2.328025, -0.3682545, 0.5080948, 1, 0, 0.1019608, 1,
2.360744, -0.7286147, 1.423172, 1, 0, 0.09411765, 1,
2.37514, 0.5127192, 1.695412, 1, 0, 0.09019608, 1,
2.391906, 0.690129, 1.032416, 1, 0, 0.08235294, 1,
2.392951, 0.02070296, 0.9792168, 1, 0, 0.07843138, 1,
2.442582, 0.2869107, 1.398075, 1, 0, 0.07058824, 1,
2.444913, -0.8166696, 1.39452, 1, 0, 0.06666667, 1,
2.453179, 1.90964, 0.3197066, 1, 0, 0.05882353, 1,
2.564862, -0.2821538, 0.8205264, 1, 0, 0.05490196, 1,
2.660032, -0.4930218, 1.7968, 1, 0, 0.04705882, 1,
2.734269, -0.4580124, 1.428958, 1, 0, 0.04313726, 1,
2.739372, -0.2306386, 3.188619, 1, 0, 0.03529412, 1,
2.757613, 0.3332557, 1.674062, 1, 0, 0.03137255, 1,
2.794892, 0.6342329, 1.800771, 1, 0, 0.02352941, 1,
2.802556, 0.1753165, 1.383211, 1, 0, 0.01960784, 1,
2.822466, -0.03693451, 0.6778324, 1, 0, 0.01176471, 1,
3.222708, 0.8670909, 2.226338, 1, 0, 0.007843138, 1
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
-0.1578103, -4.418361, -7.539574, 0, -0.5, 0.5, 0.5,
-0.1578103, -4.418361, -7.539574, 1, -0.5, 0.5, 0.5,
-0.1578103, -4.418361, -7.539574, 1, 1.5, 0.5, 0.5,
-0.1578103, -4.418361, -7.539574, 0, 1.5, 0.5, 0.5
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
-4.684324, 0.2107248, -7.539574, 0, -0.5, 0.5, 0.5,
-4.684324, 0.2107248, -7.539574, 1, -0.5, 0.5, 0.5,
-4.684324, 0.2107248, -7.539574, 1, 1.5, 0.5, 0.5,
-4.684324, 0.2107248, -7.539574, 0, 1.5, 0.5, 0.5
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
-4.684324, -4.418361, -0.2806706, 0, -0.5, 0.5, 0.5,
-4.684324, -4.418361, -0.2806706, 1, -0.5, 0.5, 0.5,
-4.684324, -4.418361, -0.2806706, 1, 1.5, 0.5, 0.5,
-4.684324, -4.418361, -0.2806706, 0, 1.5, 0.5, 0.5
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
-3, -3.350111, -5.864442,
3, -3.350111, -5.864442,
-3, -3.350111, -5.864442,
-3, -3.528152, -6.143631,
-2, -3.350111, -5.864442,
-2, -3.528152, -6.143631,
-1, -3.350111, -5.864442,
-1, -3.528152, -6.143631,
0, -3.350111, -5.864442,
0, -3.528152, -6.143631,
1, -3.350111, -5.864442,
1, -3.528152, -6.143631,
2, -3.350111, -5.864442,
2, -3.528152, -6.143631,
3, -3.350111, -5.864442,
3, -3.528152, -6.143631
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
-3, -3.884236, -6.702008, 0, -0.5, 0.5, 0.5,
-3, -3.884236, -6.702008, 1, -0.5, 0.5, 0.5,
-3, -3.884236, -6.702008, 1, 1.5, 0.5, 0.5,
-3, -3.884236, -6.702008, 0, 1.5, 0.5, 0.5,
-2, -3.884236, -6.702008, 0, -0.5, 0.5, 0.5,
-2, -3.884236, -6.702008, 1, -0.5, 0.5, 0.5,
-2, -3.884236, -6.702008, 1, 1.5, 0.5, 0.5,
-2, -3.884236, -6.702008, 0, 1.5, 0.5, 0.5,
-1, -3.884236, -6.702008, 0, -0.5, 0.5, 0.5,
-1, -3.884236, -6.702008, 1, -0.5, 0.5, 0.5,
-1, -3.884236, -6.702008, 1, 1.5, 0.5, 0.5,
-1, -3.884236, -6.702008, 0, 1.5, 0.5, 0.5,
0, -3.884236, -6.702008, 0, -0.5, 0.5, 0.5,
0, -3.884236, -6.702008, 1, -0.5, 0.5, 0.5,
0, -3.884236, -6.702008, 1, 1.5, 0.5, 0.5,
0, -3.884236, -6.702008, 0, 1.5, 0.5, 0.5,
1, -3.884236, -6.702008, 0, -0.5, 0.5, 0.5,
1, -3.884236, -6.702008, 1, -0.5, 0.5, 0.5,
1, -3.884236, -6.702008, 1, 1.5, 0.5, 0.5,
1, -3.884236, -6.702008, 0, 1.5, 0.5, 0.5,
2, -3.884236, -6.702008, 0, -0.5, 0.5, 0.5,
2, -3.884236, -6.702008, 1, -0.5, 0.5, 0.5,
2, -3.884236, -6.702008, 1, 1.5, 0.5, 0.5,
2, -3.884236, -6.702008, 0, 1.5, 0.5, 0.5,
3, -3.884236, -6.702008, 0, -0.5, 0.5, 0.5,
3, -3.884236, -6.702008, 1, -0.5, 0.5, 0.5,
3, -3.884236, -6.702008, 1, 1.5, 0.5, 0.5,
3, -3.884236, -6.702008, 0, 1.5, 0.5, 0.5
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
-3.639744, -3, -5.864442,
-3.639744, 3, -5.864442,
-3.639744, -3, -5.864442,
-3.813841, -3, -6.143631,
-3.639744, -2, -5.864442,
-3.813841, -2, -6.143631,
-3.639744, -1, -5.864442,
-3.813841, -1, -6.143631,
-3.639744, 0, -5.864442,
-3.813841, 0, -6.143631,
-3.639744, 1, -5.864442,
-3.813841, 1, -6.143631,
-3.639744, 2, -5.864442,
-3.813841, 2, -6.143631,
-3.639744, 3, -5.864442,
-3.813841, 3, -6.143631
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
-4.162035, -3, -6.702008, 0, -0.5, 0.5, 0.5,
-4.162035, -3, -6.702008, 1, -0.5, 0.5, 0.5,
-4.162035, -3, -6.702008, 1, 1.5, 0.5, 0.5,
-4.162035, -3, -6.702008, 0, 1.5, 0.5, 0.5,
-4.162035, -2, -6.702008, 0, -0.5, 0.5, 0.5,
-4.162035, -2, -6.702008, 1, -0.5, 0.5, 0.5,
-4.162035, -2, -6.702008, 1, 1.5, 0.5, 0.5,
-4.162035, -2, -6.702008, 0, 1.5, 0.5, 0.5,
-4.162035, -1, -6.702008, 0, -0.5, 0.5, 0.5,
-4.162035, -1, -6.702008, 1, -0.5, 0.5, 0.5,
-4.162035, -1, -6.702008, 1, 1.5, 0.5, 0.5,
-4.162035, -1, -6.702008, 0, 1.5, 0.5, 0.5,
-4.162035, 0, -6.702008, 0, -0.5, 0.5, 0.5,
-4.162035, 0, -6.702008, 1, -0.5, 0.5, 0.5,
-4.162035, 0, -6.702008, 1, 1.5, 0.5, 0.5,
-4.162035, 0, -6.702008, 0, 1.5, 0.5, 0.5,
-4.162035, 1, -6.702008, 0, -0.5, 0.5, 0.5,
-4.162035, 1, -6.702008, 1, -0.5, 0.5, 0.5,
-4.162035, 1, -6.702008, 1, 1.5, 0.5, 0.5,
-4.162035, 1, -6.702008, 0, 1.5, 0.5, 0.5,
-4.162035, 2, -6.702008, 0, -0.5, 0.5, 0.5,
-4.162035, 2, -6.702008, 1, -0.5, 0.5, 0.5,
-4.162035, 2, -6.702008, 1, 1.5, 0.5, 0.5,
-4.162035, 2, -6.702008, 0, 1.5, 0.5, 0.5,
-4.162035, 3, -6.702008, 0, -0.5, 0.5, 0.5,
-4.162035, 3, -6.702008, 1, -0.5, 0.5, 0.5,
-4.162035, 3, -6.702008, 1, 1.5, 0.5, 0.5,
-4.162035, 3, -6.702008, 0, 1.5, 0.5, 0.5
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
-3.639744, -3.350111, -4,
-3.639744, -3.350111, 4,
-3.639744, -3.350111, -4,
-3.813841, -3.528152, -4,
-3.639744, -3.350111, -2,
-3.813841, -3.528152, -2,
-3.639744, -3.350111, 0,
-3.813841, -3.528152, 0,
-3.639744, -3.350111, 2,
-3.813841, -3.528152, 2,
-3.639744, -3.350111, 4,
-3.813841, -3.528152, 4
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
-4.162035, -3.884236, -4, 0, -0.5, 0.5, 0.5,
-4.162035, -3.884236, -4, 1, -0.5, 0.5, 0.5,
-4.162035, -3.884236, -4, 1, 1.5, 0.5, 0.5,
-4.162035, -3.884236, -4, 0, 1.5, 0.5, 0.5,
-4.162035, -3.884236, -2, 0, -0.5, 0.5, 0.5,
-4.162035, -3.884236, -2, 1, -0.5, 0.5, 0.5,
-4.162035, -3.884236, -2, 1, 1.5, 0.5, 0.5,
-4.162035, -3.884236, -2, 0, 1.5, 0.5, 0.5,
-4.162035, -3.884236, 0, 0, -0.5, 0.5, 0.5,
-4.162035, -3.884236, 0, 1, -0.5, 0.5, 0.5,
-4.162035, -3.884236, 0, 1, 1.5, 0.5, 0.5,
-4.162035, -3.884236, 0, 0, 1.5, 0.5, 0.5,
-4.162035, -3.884236, 2, 0, -0.5, 0.5, 0.5,
-4.162035, -3.884236, 2, 1, -0.5, 0.5, 0.5,
-4.162035, -3.884236, 2, 1, 1.5, 0.5, 0.5,
-4.162035, -3.884236, 2, 0, 1.5, 0.5, 0.5,
-4.162035, -3.884236, 4, 0, -0.5, 0.5, 0.5,
-4.162035, -3.884236, 4, 1, -0.5, 0.5, 0.5,
-4.162035, -3.884236, 4, 1, 1.5, 0.5, 0.5,
-4.162035, -3.884236, 4, 0, 1.5, 0.5, 0.5
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
-3.639744, -3.350111, -5.864442,
-3.639744, 3.77156, -5.864442,
-3.639744, -3.350111, 5.303101,
-3.639744, 3.77156, 5.303101,
-3.639744, -3.350111, -5.864442,
-3.639744, -3.350111, 5.303101,
-3.639744, 3.77156, -5.864442,
-3.639744, 3.77156, 5.303101,
-3.639744, -3.350111, -5.864442,
3.324124, -3.350111, -5.864442,
-3.639744, -3.350111, 5.303101,
3.324124, -3.350111, 5.303101,
-3.639744, 3.77156, -5.864442,
3.324124, 3.77156, -5.864442,
-3.639744, 3.77156, 5.303101,
3.324124, 3.77156, 5.303101,
3.324124, -3.350111, -5.864442,
3.324124, 3.77156, -5.864442,
3.324124, -3.350111, 5.303101,
3.324124, 3.77156, 5.303101,
3.324124, -3.350111, -5.864442,
3.324124, -3.350111, 5.303101,
3.324124, 3.77156, -5.864442,
3.324124, 3.77156, 5.303101
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
var radius = 7.990599;
var distance = 35.55108;
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
mvMatrix.translate( 0.1578103, -0.2107248, 0.2806706 );
mvMatrix.scale( 1.240631, 1.213141, 0.7736341 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.55108);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
oxo-1-propenyl_phosp<-read.table("oxo-1-propenyl_phosp.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-oxo-1-propenyl_phosp$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxo' not found
```

```r
y<-oxo-1-propenyl_phosp$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxo' not found
```

```r
z<-oxo-1-propenyl_phosp$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxo' not found
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
-3.538329, 0.2207681, -2.898483, 0, 0, 1, 1, 1,
-3.47613, 0.6520178, -2.906467, 1, 0, 0, 1, 1,
-3.198076, 1.065925, -1.378346, 1, 0, 0, 1, 1,
-2.699965, -0.1039239, -1.991117, 1, 0, 0, 1, 1,
-2.622557, -0.05944007, -2.238281, 1, 0, 0, 1, 1,
-2.404367, 2.168489, -1.053433, 1, 0, 0, 1, 1,
-2.393841, 0.3383841, 0.2521884, 0, 0, 0, 1, 1,
-2.293602, -0.3100992, -1.676211, 0, 0, 0, 1, 1,
-2.278919, -0.418932, -2.826753, 0, 0, 0, 1, 1,
-2.160238, 0.6792374, -1.227757, 0, 0, 0, 1, 1,
-2.142383, 1.168814, -0.06772144, 0, 0, 0, 1, 1,
-2.140987, 0.4990115, -2.468504, 0, 0, 0, 1, 1,
-2.13713, 0.5108529, -2.312443, 0, 0, 0, 1, 1,
-2.122015, 0.2863295, 1.06895, 1, 1, 1, 1, 1,
-2.109006, 2.102204, 0.7327185, 1, 1, 1, 1, 1,
-2.10729, 0.09472072, -1.164004, 1, 1, 1, 1, 1,
-2.079931, -0.00870987, -1.487226, 1, 1, 1, 1, 1,
-2.078424, -1.330414, -0.1687584, 1, 1, 1, 1, 1,
-2.078213, 0.7908556, -1.288974, 1, 1, 1, 1, 1,
-2.052308, -0.01765403, -1.429088, 1, 1, 1, 1, 1,
-2.018697, 0.5178968, -1.049928, 1, 1, 1, 1, 1,
-1.986288, 0.2980595, -1.198111, 1, 1, 1, 1, 1,
-1.95881, -0.1692985, -1.061066, 1, 1, 1, 1, 1,
-1.951362, 1.077562, -0.1709368, 1, 1, 1, 1, 1,
-1.931393, 0.4614697, -1.381308, 1, 1, 1, 1, 1,
-1.917074, 0.656345, -1.18597, 1, 1, 1, 1, 1,
-1.901419, 0.6815158, 0.9102688, 1, 1, 1, 1, 1,
-1.859016, 0.9108887, -2.222413, 1, 1, 1, 1, 1,
-1.816879, 0.9570826, -2.810112, 0, 0, 1, 1, 1,
-1.811466, 0.5927063, -1.945405, 1, 0, 0, 1, 1,
-1.810056, 1.349721, 1.4398, 1, 0, 0, 1, 1,
-1.7874, -1.078547, -3.061142, 1, 0, 0, 1, 1,
-1.780797, -1.328133, -3.672776, 1, 0, 0, 1, 1,
-1.774749, 2.531952, 0.8578947, 1, 0, 0, 1, 1,
-1.772064, -1.655211, -3.089979, 0, 0, 0, 1, 1,
-1.768759, 0.4778752, -1.541535, 0, 0, 0, 1, 1,
-1.756689, -0.9072016, -2.020471, 0, 0, 0, 1, 1,
-1.750875, 0.1417129, -0.9578765, 0, 0, 0, 1, 1,
-1.750396, 0.09055278, -0.4905671, 0, 0, 0, 1, 1,
-1.750294, 0.1113111, -2.03364, 0, 0, 0, 1, 1,
-1.727522, 0.3259307, -0.02643102, 0, 0, 0, 1, 1,
-1.69067, 0.2362371, -2.308484, 1, 1, 1, 1, 1,
-1.689996, 1.291073, -0.1175102, 1, 1, 1, 1, 1,
-1.679378, 0.1957737, -0.3353651, 1, 1, 1, 1, 1,
-1.672241, 0.6482243, -1.866327, 1, 1, 1, 1, 1,
-1.641588, -0.1898775, -1.986942, 1, 1, 1, 1, 1,
-1.61019, 1.371214, -1.975887, 1, 1, 1, 1, 1,
-1.589977, -0.5916547, -0.5262605, 1, 1, 1, 1, 1,
-1.588982, -1.913327, -1.62993, 1, 1, 1, 1, 1,
-1.588123, -1.109116, -1.655096, 1, 1, 1, 1, 1,
-1.56533, 1.170642, -2.126372, 1, 1, 1, 1, 1,
-1.545281, 0.9869308, -2.279912, 1, 1, 1, 1, 1,
-1.507938, 0.3624099, -2.299759, 1, 1, 1, 1, 1,
-1.502181, -0.6079997, -1.772662, 1, 1, 1, 1, 1,
-1.485351, -2.85304, -2.856473, 1, 1, 1, 1, 1,
-1.481391, 0.5550604, -0.4897059, 1, 1, 1, 1, 1,
-1.479513, -0.7727203, -2.11706, 0, 0, 1, 1, 1,
-1.467655, 0.005674922, -1.57868, 1, 0, 0, 1, 1,
-1.46054, -2.098429, -3.508241, 1, 0, 0, 1, 1,
-1.458505, 0.4623952, -1.640036, 1, 0, 0, 1, 1,
-1.445191, 0.2087353, -1.621221, 1, 0, 0, 1, 1,
-1.439395, -0.4857115, -3.401582, 1, 0, 0, 1, 1,
-1.437201, -0.2258276, -0.9544645, 0, 0, 0, 1, 1,
-1.432882, -0.3673773, -1.126738, 0, 0, 0, 1, 1,
-1.416946, -0.696963, -1.083294, 0, 0, 0, 1, 1,
-1.413877, -0.3220499, -3.666832, 0, 0, 0, 1, 1,
-1.411656, -1.026361, -2.192461, 0, 0, 0, 1, 1,
-1.403994, -1.539834, -2.723259, 0, 0, 0, 1, 1,
-1.401056, 1.783051, -1.418524, 0, 0, 0, 1, 1,
-1.381174, 2.00768, -0.2350984, 1, 1, 1, 1, 1,
-1.378946, 0.7197049, -0.3513016, 1, 1, 1, 1, 1,
-1.378063, -1.585772, -2.629443, 1, 1, 1, 1, 1,
-1.377046, -0.8343841, -2.294152, 1, 1, 1, 1, 1,
-1.365912, -1.025581, -1.927831, 1, 1, 1, 1, 1,
-1.365907, 0.2637157, -0.3158833, 1, 1, 1, 1, 1,
-1.347697, 0.09316467, -1.550739, 1, 1, 1, 1, 1,
-1.343122, 0.8548213, 0.5348371, 1, 1, 1, 1, 1,
-1.33982, -0.4423769, -2.267625, 1, 1, 1, 1, 1,
-1.335071, 0.2535297, -1.62475, 1, 1, 1, 1, 1,
-1.331751, -1.03029, -2.125067, 1, 1, 1, 1, 1,
-1.323244, -1.628288, -4.106318, 1, 1, 1, 1, 1,
-1.307266, 1.150096, -1.122999, 1, 1, 1, 1, 1,
-1.305582, 0.4084238, -1.090705, 1, 1, 1, 1, 1,
-1.301291, 1.058909, -2.424432, 1, 1, 1, 1, 1,
-1.297997, 0.7473841, -0.841983, 0, 0, 1, 1, 1,
-1.296565, -1.724505, -2.458656, 1, 0, 0, 1, 1,
-1.289697, -0.3449337, -3.892128, 1, 0, 0, 1, 1,
-1.285484, -0.8642589, -2.097221, 1, 0, 0, 1, 1,
-1.285362, -1.662762, -2.588099, 1, 0, 0, 1, 1,
-1.282119, -0.9859557, -1.108986, 1, 0, 0, 1, 1,
-1.279802, -1.772815, -2.650892, 0, 0, 0, 1, 1,
-1.278858, 0.995317, 0.4439299, 0, 0, 0, 1, 1,
-1.277949, 0.817561, 0.2867003, 0, 0, 0, 1, 1,
-1.258879, 0.9209155, -0.96263, 0, 0, 0, 1, 1,
-1.257362, -0.8239565, -2.546694, 0, 0, 0, 1, 1,
-1.249873, -0.3189988, -2.31942, 0, 0, 0, 1, 1,
-1.247727, -0.8996225, -1.978202, 0, 0, 0, 1, 1,
-1.244162, -0.8704528, -3.493274, 1, 1, 1, 1, 1,
-1.23782, -1.467695, -1.669043, 1, 1, 1, 1, 1,
-1.220343, -1.50908, -2.380081, 1, 1, 1, 1, 1,
-1.218651, -0.9304613, -3.425903, 1, 1, 1, 1, 1,
-1.209659, 1.159339, -0.09745068, 1, 1, 1, 1, 1,
-1.208739, 1.665658, -1.740673, 1, 1, 1, 1, 1,
-1.193655, -0.1564214, -2.69003, 1, 1, 1, 1, 1,
-1.189509, 1.406639, 1.089503, 1, 1, 1, 1, 1,
-1.188695, -0.02786748, -1.484159, 1, 1, 1, 1, 1,
-1.185535, 0.8616812, -0.05272793, 1, 1, 1, 1, 1,
-1.184307, -0.3054873, -1.113173, 1, 1, 1, 1, 1,
-1.178186, -1.124014, -2.521718, 1, 1, 1, 1, 1,
-1.175049, -0.2404202, -2.886157, 1, 1, 1, 1, 1,
-1.17378, 0.9973856, -1.91531, 1, 1, 1, 1, 1,
-1.16952, 1.205879, -0.2030743, 1, 1, 1, 1, 1,
-1.15157, -1.898359, -3.867007, 0, 0, 1, 1, 1,
-1.151507, -0.774415, -1.506336, 1, 0, 0, 1, 1,
-1.149627, 0.8914129, -0.629042, 1, 0, 0, 1, 1,
-1.142686, -0.4912195, -2.564874, 1, 0, 0, 1, 1,
-1.139069, -1.232453, -2.193221, 1, 0, 0, 1, 1,
-1.138689, 0.6384665, -1.822361, 1, 0, 0, 1, 1,
-1.13072, 0.1908572, -2.731071, 0, 0, 0, 1, 1,
-1.129315, -0.6250991, -1.686921, 0, 0, 0, 1, 1,
-1.125275, 1.521383, -1.597467, 0, 0, 0, 1, 1,
-1.123837, 0.5714275, -1.078861, 0, 0, 0, 1, 1,
-1.121934, 0.1762358, -0.6954955, 0, 0, 0, 1, 1,
-1.101727, -0.09941275, -1.771088, 0, 0, 0, 1, 1,
-1.095714, -0.4268061, -2.724007, 0, 0, 0, 1, 1,
-1.092396, -0.6042771, -2.421642, 1, 1, 1, 1, 1,
-1.088043, -0.7247922, -2.566005, 1, 1, 1, 1, 1,
-1.083207, 0.3489881, -2.214828, 1, 1, 1, 1, 1,
-1.080666, 0.07298495, -2.942242, 1, 1, 1, 1, 1,
-1.078925, 0.3822237, -1.976794, 1, 1, 1, 1, 1,
-1.073456, 0.4412603, -0.09707698, 1, 1, 1, 1, 1,
-1.064442, 0.1440241, -1.549462, 1, 1, 1, 1, 1,
-1.06271, -0.8796014, -0.07345252, 1, 1, 1, 1, 1,
-1.06035, -1.222652, -1.706373, 1, 1, 1, 1, 1,
-1.059941, 0.1428544, -1.378608, 1, 1, 1, 1, 1,
-1.055471, -1.17739, -0.5835809, 1, 1, 1, 1, 1,
-1.053858, 0.1877978, -0.7033549, 1, 1, 1, 1, 1,
-1.049717, 1.671963, -0.4771563, 1, 1, 1, 1, 1,
-1.045506, 0.2823359, -2.036857, 1, 1, 1, 1, 1,
-1.044779, 0.6256284, 0.5473544, 1, 1, 1, 1, 1,
-1.03994, -0.748767, -2.109393, 0, 0, 1, 1, 1,
-1.037898, -0.04029151, -1.310125, 1, 0, 0, 1, 1,
-1.034733, 0.6061795, -2.611537, 1, 0, 0, 1, 1,
-1.022658, -0.634048, -1.42648, 1, 0, 0, 1, 1,
-1.002078, -1.55279, -1.315767, 1, 0, 0, 1, 1,
-1.001634, 1.528642, -0.8972664, 1, 0, 0, 1, 1,
-0.9940557, -0.4745757, -2.594581, 0, 0, 0, 1, 1,
-0.9901946, -1.496652, -3.97277, 0, 0, 0, 1, 1,
-0.9761605, -0.8965948, -2.626189, 0, 0, 0, 1, 1,
-0.9760385, -1.712178, -1.792579, 0, 0, 0, 1, 1,
-0.9697212, 0.6909011, -1.093098, 0, 0, 0, 1, 1,
-0.9662758, 0.08473906, -1.914503, 0, 0, 0, 1, 1,
-0.9643558, -1.009528, -1.451672, 0, 0, 0, 1, 1,
-0.9595476, -1.756797, -3.623387, 1, 1, 1, 1, 1,
-0.9582276, -0.1267093, -2.718165, 1, 1, 1, 1, 1,
-0.9567857, 0.06973156, -3.663146, 1, 1, 1, 1, 1,
-0.9368858, -0.3023733, 0.142936, 1, 1, 1, 1, 1,
-0.9334548, -1.148532, -1.065859, 1, 1, 1, 1, 1,
-0.9321061, 0.5847546, -2.082779, 1, 1, 1, 1, 1,
-0.932097, 0.5639326, -1.293015, 1, 1, 1, 1, 1,
-0.9261132, -1.064647, -3.226891, 1, 1, 1, 1, 1,
-0.9213681, -0.8958148, -5.701808, 1, 1, 1, 1, 1,
-0.9158764, -0.1642754, -2.407959, 1, 1, 1, 1, 1,
-0.9113119, 0.402377, -0.9567504, 1, 1, 1, 1, 1,
-0.9079008, 0.1133515, -1.71057, 1, 1, 1, 1, 1,
-0.9025478, -0.5380041, -3.471833, 1, 1, 1, 1, 1,
-0.888797, 2.879206, 0.5217485, 1, 1, 1, 1, 1,
-0.886085, 0.2545201, -1.115772, 1, 1, 1, 1, 1,
-0.8802611, 0.2539347, -0.7279698, 0, 0, 1, 1, 1,
-0.8796906, 0.03205908, -1.328835, 1, 0, 0, 1, 1,
-0.8749287, 0.5762838, -0.5538317, 1, 0, 0, 1, 1,
-0.8749228, 1.643335, -0.7691135, 1, 0, 0, 1, 1,
-0.8725934, -1.484762, -2.842453, 1, 0, 0, 1, 1,
-0.8665134, -1.067276, -3.138664, 1, 0, 0, 1, 1,
-0.8642678, 0.9599065, -0.7023104, 0, 0, 0, 1, 1,
-0.8597642, 0.7184057, 0.34384, 0, 0, 0, 1, 1,
-0.8505364, -0.1162762, -1.072106, 0, 0, 0, 1, 1,
-0.8395624, 0.7713253, -0.3667265, 0, 0, 0, 1, 1,
-0.8356423, 0.7651352, -0.8305732, 0, 0, 0, 1, 1,
-0.8354517, -1.11616, -2.659141, 0, 0, 0, 1, 1,
-0.8326862, 0.7513969, -0.9050699, 0, 0, 0, 1, 1,
-0.8303998, -0.3055297, 0.04449929, 1, 1, 1, 1, 1,
-0.8285288, -0.5418751, -2.618392, 1, 1, 1, 1, 1,
-0.8267511, -1.178031, -3.407384, 1, 1, 1, 1, 1,
-0.822869, 2.062416, -1.040686, 1, 1, 1, 1, 1,
-0.8227878, -0.1076335, -1.89271, 1, 1, 1, 1, 1,
-0.8206031, -0.897563, -3.379241, 1, 1, 1, 1, 1,
-0.8115115, -0.3000368, -2.355833, 1, 1, 1, 1, 1,
-0.8069702, -0.5720831, -1.953842, 1, 1, 1, 1, 1,
-0.8056019, -0.465882, -3.486732, 1, 1, 1, 1, 1,
-0.8024344, -1.347638, -3.146407, 1, 1, 1, 1, 1,
-0.7923448, 1.743593, 0.9215385, 1, 1, 1, 1, 1,
-0.7867241, 0.1300569, -0.9970446, 1, 1, 1, 1, 1,
-0.7849009, 1.237061, -1.130158, 1, 1, 1, 1, 1,
-0.781742, -0.6492314, -1.450619, 1, 1, 1, 1, 1,
-0.7792073, 0.06541017, -2.551312, 1, 1, 1, 1, 1,
-0.7767174, -0.3857063, -0.6970013, 0, 0, 1, 1, 1,
-0.7667855, -0.9392066, -2.43004, 1, 0, 0, 1, 1,
-0.7656162, 1.610431, 0.1833007, 1, 0, 0, 1, 1,
-0.7622488, 1.511543, 0.7606965, 1, 0, 0, 1, 1,
-0.7513947, -0.4684609, -3.232685, 1, 0, 0, 1, 1,
-0.7469453, 0.8540602, -1.128267, 1, 0, 0, 1, 1,
-0.7425808, 1.080059, -1.080807, 0, 0, 0, 1, 1,
-0.7409588, -0.882136, -0.826486, 0, 0, 0, 1, 1,
-0.7343811, -0.1739579, -2.682263, 0, 0, 0, 1, 1,
-0.731526, 0.7243179, -0.821918, 0, 0, 0, 1, 1,
-0.7296642, 0.5353907, 0.6875502, 0, 0, 0, 1, 1,
-0.7242779, 1.230696, 0.5947587, 0, 0, 0, 1, 1,
-0.7152511, -1.329022, -4.053519, 0, 0, 0, 1, 1,
-0.7149224, 0.8688759, -1.592432, 1, 1, 1, 1, 1,
-0.7043176, 1.144203, 0.8200502, 1, 1, 1, 1, 1,
-0.7037948, 0.6012459, -2.291501, 1, 1, 1, 1, 1,
-0.697214, 0.8562277, -0.03551694, 1, 1, 1, 1, 1,
-0.6887938, 0.785683, -2.725204, 1, 1, 1, 1, 1,
-0.6854447, 0.1739052, -1.97785, 1, 1, 1, 1, 1,
-0.6817681, -0.3090412, -2.755635, 1, 1, 1, 1, 1,
-0.678306, 3.667847, -1.389896, 1, 1, 1, 1, 1,
-0.674205, -0.8194184, -3.385938, 1, 1, 1, 1, 1,
-0.6703251, -1.142329, -1.946457, 1, 1, 1, 1, 1,
-0.6675636, -0.740025, -3.734699, 1, 1, 1, 1, 1,
-0.6665142, 1.174193, -1.76536, 1, 1, 1, 1, 1,
-0.6648077, -1.233701, -0.4345693, 1, 1, 1, 1, 1,
-0.6605737, -0.991937, -3.370229, 1, 1, 1, 1, 1,
-0.660403, 1.306384, -1.314553, 1, 1, 1, 1, 1,
-0.6587672, 1.192628, -1.567963, 0, 0, 1, 1, 1,
-0.6583838, -1.502907, -1.967544, 1, 0, 0, 1, 1,
-0.657185, 1.192061, -1.119188, 1, 0, 0, 1, 1,
-0.6570327, 0.6080225, -1.404763, 1, 0, 0, 1, 1,
-0.6557628, 2.601257, 1.585631, 1, 0, 0, 1, 1,
-0.6483393, -2.090447, -4.851718, 1, 0, 0, 1, 1,
-0.640841, -0.9560195, -2.374311, 0, 0, 0, 1, 1,
-0.6399556, 0.6608094, -0.9594021, 0, 0, 0, 1, 1,
-0.6308557, -1.363118, -3.033226, 0, 0, 0, 1, 1,
-0.6307245, -0.9934702, -3.213534, 0, 0, 0, 1, 1,
-0.6288257, 0.7028718, -0.7599854, 0, 0, 0, 1, 1,
-0.6228188, -0.5479486, -3.385272, 0, 0, 0, 1, 1,
-0.6197014, 0.6311135, -0.7896549, 0, 0, 0, 1, 1,
-0.6183379, -1.208959, -2.423944, 1, 1, 1, 1, 1,
-0.6115759, 1.214931, -0.8521116, 1, 1, 1, 1, 1,
-0.6112223, -0.2904424, -3.000266, 1, 1, 1, 1, 1,
-0.6078629, -0.2222413, -2.660353, 1, 1, 1, 1, 1,
-0.6045852, -0.3852633, -2.974901, 1, 1, 1, 1, 1,
-0.6016284, -0.6968025, -3.404638, 1, 1, 1, 1, 1,
-0.5994385, 1.211195, -0.6913013, 1, 1, 1, 1, 1,
-0.5852613, -1.241624, -2.012062, 1, 1, 1, 1, 1,
-0.5851104, 1.39295, -0.3484724, 1, 1, 1, 1, 1,
-0.5780768, -0.5649756, -1.550909, 1, 1, 1, 1, 1,
-0.5727984, 1.669439, -0.3077821, 1, 1, 1, 1, 1,
-0.5698036, 1.735916, -2.990364, 1, 1, 1, 1, 1,
-0.5694777, -0.2884294, -3.126318, 1, 1, 1, 1, 1,
-0.5667875, -1.035296, -3.252458, 1, 1, 1, 1, 1,
-0.5657523, -0.05709791, -2.18344, 1, 1, 1, 1, 1,
-0.5655224, -0.9912329, -1.624275, 0, 0, 1, 1, 1,
-0.5635264, -0.6915462, -3.538191, 1, 0, 0, 1, 1,
-0.5539229, -0.4637375, -3.200019, 1, 0, 0, 1, 1,
-0.5514945, -0.8002956, -2.99496, 1, 0, 0, 1, 1,
-0.5474153, 0.1345889, -2.992593, 1, 0, 0, 1, 1,
-0.5459167, -0.09850582, -1.215659, 1, 0, 0, 1, 1,
-0.5447983, -0.4755829, -2.131516, 0, 0, 0, 1, 1,
-0.5435079, -0.7331749, -1.412462, 0, 0, 0, 1, 1,
-0.5433439, -1.225619, -3.840653, 0, 0, 0, 1, 1,
-0.543045, 0.784831, -0.7711065, 0, 0, 0, 1, 1,
-0.538546, 1.531572, -0.3744628, 0, 0, 0, 1, 1,
-0.5380315, -1.041047, -3.734426, 0, 0, 0, 1, 1,
-0.5344692, 0.2446438, -0.6500638, 0, 0, 0, 1, 1,
-0.5327889, -0.7631841, -2.712404, 1, 1, 1, 1, 1,
-0.5321674, -0.5903049, -1.230068, 1, 1, 1, 1, 1,
-0.5317832, -0.5893175, -2.43915, 1, 1, 1, 1, 1,
-0.5293909, -1.249555, -2.737848, 1, 1, 1, 1, 1,
-0.5278018, 1.171314, -2.763841, 1, 1, 1, 1, 1,
-0.5264041, 0.4786341, -2.198166, 1, 1, 1, 1, 1,
-0.5253733, -1.903446, -3.220299, 1, 1, 1, 1, 1,
-0.518502, 0.6647505, -2.003688, 1, 1, 1, 1, 1,
-0.5141541, 0.3988281, -2.344395, 1, 1, 1, 1, 1,
-0.5125552, -1.604937, -3.08182, 1, 1, 1, 1, 1,
-0.5086411, 0.7561339, -0.8284231, 1, 1, 1, 1, 1,
-0.506232, -0.1173046, -0.2837877, 1, 1, 1, 1, 1,
-0.5051088, -1.231428, -4.109136, 1, 1, 1, 1, 1,
-0.5029436, 0.03710864, -0.8139496, 1, 1, 1, 1, 1,
-0.5015388, -0.2952461, -1.703228, 1, 1, 1, 1, 1,
-0.5015168, -2.178366, -3.722859, 0, 0, 1, 1, 1,
-0.496915, -1.383473, -1.832315, 1, 0, 0, 1, 1,
-0.4927038, 0.1719623, -2.178055, 1, 0, 0, 1, 1,
-0.4879204, -0.5136434, -1.441292, 1, 0, 0, 1, 1,
-0.4826128, -0.9978843, -3.901538, 1, 0, 0, 1, 1,
-0.4798485, -0.2341441, -1.552891, 1, 0, 0, 1, 1,
-0.4785294, -0.2492728, -3.359007, 0, 0, 0, 1, 1,
-0.4780356, 0.9962786, 0.7899941, 0, 0, 0, 1, 1,
-0.4732901, -0.7663695, -1.913585, 0, 0, 0, 1, 1,
-0.4702265, 0.4830725, -0.235376, 0, 0, 0, 1, 1,
-0.4698469, 2.052454, -0.04677373, 0, 0, 0, 1, 1,
-0.4681725, -1.316627, -2.668284, 0, 0, 0, 1, 1,
-0.4661153, -0.7209064, -5.021881, 0, 0, 0, 1, 1,
-0.4631874, 1.104648, -0.6074285, 1, 1, 1, 1, 1,
-0.4564438, 1.411645, 0.3435277, 1, 1, 1, 1, 1,
-0.4496993, -0.3919967, -3.10239, 1, 1, 1, 1, 1,
-0.4488101, 0.05083724, -2.498885, 1, 1, 1, 1, 1,
-0.4485712, 0.8317073, -0.3308961, 1, 1, 1, 1, 1,
-0.4467188, -2.262154, -3.478503, 1, 1, 1, 1, 1,
-0.4396775, -0.3809895, -2.623543, 1, 1, 1, 1, 1,
-0.4378512, -0.8768856, -3.155281, 1, 1, 1, 1, 1,
-0.4352384, -0.9338093, -5.26221, 1, 1, 1, 1, 1,
-0.4309289, 0.3232549, 0.5196958, 1, 1, 1, 1, 1,
-0.4295564, 0.2792354, 0.1600621, 1, 1, 1, 1, 1,
-0.428561, -0.08706418, -1.44965, 1, 1, 1, 1, 1,
-0.4273747, 0.2854415, -0.6333318, 1, 1, 1, 1, 1,
-0.4213852, -0.07590535, -3.564586, 1, 1, 1, 1, 1,
-0.4177587, 2.515108, -1.282595, 1, 1, 1, 1, 1,
-0.414886, 0.2490758, -4.139687, 0, 0, 1, 1, 1,
-0.4105327, -0.3343555, -2.00729, 1, 0, 0, 1, 1,
-0.4049873, 1.333246, -0.9544248, 1, 0, 0, 1, 1,
-0.3996953, 1.73655, 1.315185, 1, 0, 0, 1, 1,
-0.391615, 0.06529614, -1.967947, 1, 0, 0, 1, 1,
-0.3823271, 0.9690033, -0.3563999, 1, 0, 0, 1, 1,
-0.3821818, -1.761959, -2.574576, 0, 0, 0, 1, 1,
-0.3763876, -0.1630565, -2.891553, 0, 0, 0, 1, 1,
-0.3761726, 0.1659802, -1.727553, 0, 0, 0, 1, 1,
-0.3720348, 0.2045722, 0.5515974, 0, 0, 0, 1, 1,
-0.369023, 0.4522129, -2.726543, 0, 0, 0, 1, 1,
-0.3688496, 0.1059896, -2.472054, 0, 0, 0, 1, 1,
-0.3679727, 0.4893805, -0.8078464, 0, 0, 0, 1, 1,
-0.3669455, 1.799326, 0.2456457, 1, 1, 1, 1, 1,
-0.3645713, -0.8160621, -3.616838, 1, 1, 1, 1, 1,
-0.362057, 1.519062, -0.1403577, 1, 1, 1, 1, 1,
-0.3611465, -0.09031897, -1.187699, 1, 1, 1, 1, 1,
-0.3600801, 0.5362117, -0.8937777, 1, 1, 1, 1, 1,
-0.3575825, 0.2970611, -1.460186, 1, 1, 1, 1, 1,
-0.3538723, -0.3925287, -2.337295, 1, 1, 1, 1, 1,
-0.3504761, 0.1640018, -1.128038, 1, 1, 1, 1, 1,
-0.3470078, 0.6395105, -1.057029, 1, 1, 1, 1, 1,
-0.3428443, 0.7518912, -0.3851304, 1, 1, 1, 1, 1,
-0.3385362, -0.06732013, -1.488744, 1, 1, 1, 1, 1,
-0.335883, 1.286483, -0.631538, 1, 1, 1, 1, 1,
-0.3354915, -0.06825575, -3.24492, 1, 1, 1, 1, 1,
-0.3352942, 0.01776403, -1.886474, 1, 1, 1, 1, 1,
-0.3304032, 1.061229, 0.437906, 1, 1, 1, 1, 1,
-0.3302476, -1.048884, -4.469046, 0, 0, 1, 1, 1,
-0.3264889, 0.436397, 0.5175306, 1, 0, 0, 1, 1,
-0.3264543, 0.4304002, -0.8355748, 1, 0, 0, 1, 1,
-0.3226213, 0.794523, -0.05170538, 1, 0, 0, 1, 1,
-0.3220985, -0.2546183, -3.425808, 1, 0, 0, 1, 1,
-0.3173085, 1.100342, -0.3594642, 1, 0, 0, 1, 1,
-0.3022518, -0.457195, -2.035317, 0, 0, 0, 1, 1,
-0.2955094, 1.036038, -0.2216481, 0, 0, 0, 1, 1,
-0.2928621, -0.5802241, -3.370232, 0, 0, 0, 1, 1,
-0.2913794, 0.1812898, -0.01234986, 0, 0, 0, 1, 1,
-0.2849812, -2.537279, -3.613319, 0, 0, 0, 1, 1,
-0.2837197, -2.264081, -2.071196, 0, 0, 0, 1, 1,
-0.2811185, 1.131359, -0.06702416, 0, 0, 0, 1, 1,
-0.2775343, -0.230984, -1.757557, 1, 1, 1, 1, 1,
-0.2770469, 0.6009842, -0.7367749, 1, 1, 1, 1, 1,
-0.2753356, -0.09636591, -0.8321295, 1, 1, 1, 1, 1,
-0.274714, 0.6686511, -0.6084042, 1, 1, 1, 1, 1,
-0.2697061, -1.11736, -2.045878, 1, 1, 1, 1, 1,
-0.2671806, -0.8016533, -2.900142, 1, 1, 1, 1, 1,
-0.2652792, -0.7490391, -2.157638, 1, 1, 1, 1, 1,
-0.2651082, -2.511652, -3.822211, 1, 1, 1, 1, 1,
-0.2638415, 1.256695, -0.731416, 1, 1, 1, 1, 1,
-0.263326, -1.94226, -2.673289, 1, 1, 1, 1, 1,
-0.2629882, -1.31219, -3.916687, 1, 1, 1, 1, 1,
-0.2610518, 0.4076528, -2.360436, 1, 1, 1, 1, 1,
-0.2600419, 2.21216, -1.461936, 1, 1, 1, 1, 1,
-0.2573433, -0.4876907, -1.45933, 1, 1, 1, 1, 1,
-0.2550401, -0.04488354, -1.108775, 1, 1, 1, 1, 1,
-0.2527416, -1.246622, -2.617296, 0, 0, 1, 1, 1,
-0.2477968, 0.5086839, -0.2654304, 1, 0, 0, 1, 1,
-0.2446862, -0.6191525, -1.532765, 1, 0, 0, 1, 1,
-0.2436289, 1.512456, 0.6202179, 1, 0, 0, 1, 1,
-0.2431344, -0.466465, -1.061355, 1, 0, 0, 1, 1,
-0.2369615, -1.219911, -3.12521, 1, 0, 0, 1, 1,
-0.2352922, 1.232054, -0.7051228, 0, 0, 0, 1, 1,
-0.2350183, -1.340139, -3.53211, 0, 0, 0, 1, 1,
-0.2325961, -0.7115398, -3.164771, 0, 0, 0, 1, 1,
-0.2309114, 0.6620956, 0.4130837, 0, 0, 0, 1, 1,
-0.2302827, 0.5774452, -0.5126637, 0, 0, 0, 1, 1,
-0.2301356, 0.03254068, -1.82343, 0, 0, 0, 1, 1,
-0.2119344, -0.6349116, -2.641536, 0, 0, 0, 1, 1,
-0.2105518, -0.6658428, -1.66451, 1, 1, 1, 1, 1,
-0.2100856, 0.5374159, -1.180252, 1, 1, 1, 1, 1,
-0.2087003, 0.413705, -1.147219, 1, 1, 1, 1, 1,
-0.2046974, -0.6397069, 0.4654734, 1, 1, 1, 1, 1,
-0.2043182, -0.7808973, -1.318563, 1, 1, 1, 1, 1,
-0.2036488, 0.9017511, -0.8582672, 1, 1, 1, 1, 1,
-0.2030865, 0.8772117, -0.03356249, 1, 1, 1, 1, 1,
-0.201141, -0.3101116, -2.70133, 1, 1, 1, 1, 1,
-0.2005298, -0.1028435, -1.710559, 1, 1, 1, 1, 1,
-0.1997516, 0.8638963, -0.0324052, 1, 1, 1, 1, 1,
-0.1989224, 0.4907213, 1.260345, 1, 1, 1, 1, 1,
-0.1978808, 0.3750435, -2.347382, 1, 1, 1, 1, 1,
-0.1970095, -0.8242177, -4.088751, 1, 1, 1, 1, 1,
-0.1967797, 0.6470812, -2.270571, 1, 1, 1, 1, 1,
-0.19596, -2.745899, -2.31878, 1, 1, 1, 1, 1,
-0.1928024, -1.292375, -3.266968, 0, 0, 1, 1, 1,
-0.1838967, 0.741672, 0.172977, 1, 0, 0, 1, 1,
-0.1771048, -0.8433159, -1.30768, 1, 0, 0, 1, 1,
-0.1722299, 0.4811075, 0.2802646, 1, 0, 0, 1, 1,
-0.1708079, 0.3332295, -1.001283, 1, 0, 0, 1, 1,
-0.1696904, 1.535047, 0.8358254, 1, 0, 0, 1, 1,
-0.1646741, -0.8118265, -3.958709, 0, 0, 0, 1, 1,
-0.1646634, 0.6746144, -1.280368, 0, 0, 0, 1, 1,
-0.1617687, 0.2779648, -0.7198963, 0, 0, 0, 1, 1,
-0.1616971, -0.4666199, -4.710369, 0, 0, 0, 1, 1,
-0.1602638, 0.2506551, -1.629342, 0, 0, 0, 1, 1,
-0.1574331, 1.570319, -1.088999, 0, 0, 0, 1, 1,
-0.1511133, 0.9524666, 0.7946644, 0, 0, 0, 1, 1,
-0.1483547, -0.8739595, -5.331763, 1, 1, 1, 1, 1,
-0.1471359, 0.7809849, -0.3735476, 1, 1, 1, 1, 1,
-0.1456511, -1.0003, -4.297474, 1, 1, 1, 1, 1,
-0.1436835, 0.8278896, 0.4622353, 1, 1, 1, 1, 1,
-0.1408821, 0.3677172, 0.8140816, 1, 1, 1, 1, 1,
-0.1373159, 1.214225, 0.3878926, 1, 1, 1, 1, 1,
-0.1369272, 0.552654, 0.5321768, 1, 1, 1, 1, 1,
-0.1365066, 1.306749, -0.4059885, 1, 1, 1, 1, 1,
-0.1350001, 0.3325785, -0.2578085, 1, 1, 1, 1, 1,
-0.1346364, -0.5090846, -3.003699, 1, 1, 1, 1, 1,
-0.1317657, -0.912981, -2.748538, 1, 1, 1, 1, 1,
-0.1303061, -0.1619794, -2.874403, 1, 1, 1, 1, 1,
-0.1255194, -0.07744184, -0.8948606, 1, 1, 1, 1, 1,
-0.1212448, 1.328494, 0.8968701, 1, 1, 1, 1, 1,
-0.1196009, -0.9364533, -2.383462, 1, 1, 1, 1, 1,
-0.1188061, -0.2436688, -1.393458, 0, 0, 1, 1, 1,
-0.1143469, -1.637196, -3.017782, 1, 0, 0, 1, 1,
-0.1133583, 0.9543379, 0.7094724, 1, 0, 0, 1, 1,
-0.1094124, 0.5743024, -0.1278183, 1, 0, 0, 1, 1,
-0.1028185, 1.373436, -0.2069489, 1, 0, 0, 1, 1,
-0.1024847, 1.729048, 0.2185289, 1, 0, 0, 1, 1,
-0.1012944, 0.4600706, 0.8543525, 0, 0, 0, 1, 1,
-0.1009224, -0.6155571, -4.24668, 0, 0, 0, 1, 1,
-0.09978934, 0.9143579, 0.8194417, 0, 0, 0, 1, 1,
-0.09725459, -0.4202463, -3.709219, 0, 0, 0, 1, 1,
-0.09397698, 0.2883033, -0.3282185, 0, 0, 0, 1, 1,
-0.08632012, -0.4924625, -3.359653, 0, 0, 0, 1, 1,
-0.0823449, 0.7884215, 0.2189302, 0, 0, 0, 1, 1,
-0.0800976, 1.157098, 0.9213991, 1, 1, 1, 1, 1,
-0.07546329, -0.1672131, -3.196733, 1, 1, 1, 1, 1,
-0.07118522, 0.860287, -1.709316, 1, 1, 1, 1, 1,
-0.07109823, 0.5029789, -0.8063774, 1, 1, 1, 1, 1,
-0.06748058, 1.585478, -0.6209282, 1, 1, 1, 1, 1,
-0.06733964, 0.93649, -1.13057, 1, 1, 1, 1, 1,
-0.06626829, -0.5349261, -1.896683, 1, 1, 1, 1, 1,
-0.06121434, 1.534488, 0.5418783, 1, 1, 1, 1, 1,
-0.0607355, 0.4491078, -0.05812426, 1, 1, 1, 1, 1,
-0.05705204, -0.2115168, -2.349421, 1, 1, 1, 1, 1,
-0.04498373, -0.452704, -2.018445, 1, 1, 1, 1, 1,
-0.03977108, 0.6773262, -1.671453, 1, 1, 1, 1, 1,
-0.03780987, 1.343768, -2.836529, 1, 1, 1, 1, 1,
-0.03163225, -0.1949413, -2.108042, 1, 1, 1, 1, 1,
-0.02943394, 0.9713196, 1.153343, 1, 1, 1, 1, 1,
-0.02751449, 1.099811, 0.2423168, 0, 0, 1, 1, 1,
-0.02433551, -0.7075329, -1.54082, 1, 0, 0, 1, 1,
-0.02264708, -1.083626, -4.778533, 1, 0, 0, 1, 1,
-0.01598429, 1.073615, -0.5945356, 1, 0, 0, 1, 1,
-0.01338739, 0.597195, 1.774516, 1, 0, 0, 1, 1,
-0.01324124, 0.6034145, -0.6276779, 1, 0, 0, 1, 1,
-0.01152883, 0.8760248, 0.6454755, 0, 0, 0, 1, 1,
-0.009496725, -1.236431, -4.136902, 0, 0, 0, 1, 1,
-0.007940273, -0.1913798, -2.718495, 0, 0, 0, 1, 1,
-0.006719739, 0.2827639, -0.7375414, 0, 0, 0, 1, 1,
-0.005751032, -1.082611, -3.468223, 0, 0, 0, 1, 1,
-0.003132461, -1.598936, -3.516047, 0, 0, 0, 1, 1,
-0.002447962, 1.490632, 0.4039178, 0, 0, 0, 1, 1,
-0.001879914, -0.4625178, -1.727852, 1, 1, 1, 1, 1,
-0.001375025, -0.8933079, -2.667551, 1, 1, 1, 1, 1,
0.0029953, -0.1433526, 3.395621, 1, 1, 1, 1, 1,
0.003270632, -0.8925725, 2.385914, 1, 1, 1, 1, 1,
0.003963192, 0.3392694, -1.657692, 1, 1, 1, 1, 1,
0.004885057, -0.1753412, 3.619608, 1, 1, 1, 1, 1,
0.00718781, 0.2877104, 0.7848723, 1, 1, 1, 1, 1,
0.008185292, 0.2482757, -0.4928566, 1, 1, 1, 1, 1,
0.01560343, -0.01074235, 1.47508, 1, 1, 1, 1, 1,
0.01580804, 1.133911, -2.424667, 1, 1, 1, 1, 1,
0.01636419, 1.655847, 1.06876, 1, 1, 1, 1, 1,
0.01792087, 0.1028554, 1.150133, 1, 1, 1, 1, 1,
0.01882768, 0.4516527, -0.2385836, 1, 1, 1, 1, 1,
0.01918858, -0.3656103, 3.319242, 1, 1, 1, 1, 1,
0.02208727, 1.317427, 0.5582389, 1, 1, 1, 1, 1,
0.02416142, 0.7715592, 1.805697, 0, 0, 1, 1, 1,
0.02632151, 1.433748, 0.6176805, 1, 0, 0, 1, 1,
0.02740839, -1.103793, 1.573113, 1, 0, 0, 1, 1,
0.03355945, 0.3696931, 0.7837319, 1, 0, 0, 1, 1,
0.03611435, 1.258913, -1.143515, 1, 0, 0, 1, 1,
0.03803019, -0.2261019, 3.560538, 1, 0, 0, 1, 1,
0.03806493, -0.5903868, 3.59376, 0, 0, 0, 1, 1,
0.03868871, 1.730712, -0.7170239, 0, 0, 0, 1, 1,
0.03937967, -0.3991381, 2.470635, 0, 0, 0, 1, 1,
0.04033837, -0.4021692, 2.672146, 0, 0, 0, 1, 1,
0.04293719, 0.3775293, 0.4065839, 0, 0, 0, 1, 1,
0.04331949, 0.5027097, 1.23982, 0, 0, 0, 1, 1,
0.04388021, -0.5744923, 3.293208, 0, 0, 0, 1, 1,
0.04589377, -0.7619433, 2.358051, 1, 1, 1, 1, 1,
0.04782207, 0.7656003, -2.49177, 1, 1, 1, 1, 1,
0.05026673, -0.9748809, 1.672065, 1, 1, 1, 1, 1,
0.06160164, -0.3034988, 3.183749, 1, 1, 1, 1, 1,
0.06820242, -0.1908754, 3.034421, 1, 1, 1, 1, 1,
0.07259256, 0.1922884, -0.3445109, 1, 1, 1, 1, 1,
0.07395247, -0.2292663, 2.861371, 1, 1, 1, 1, 1,
0.07721846, -0.9095262, 2.345922, 1, 1, 1, 1, 1,
0.07801092, 0.5574093, -0.8997106, 1, 1, 1, 1, 1,
0.07936296, -0.654741, 2.536532, 1, 1, 1, 1, 1,
0.08239514, -0.01992769, 1.301433, 1, 1, 1, 1, 1,
0.08608723, -0.200116, 4.328849, 1, 1, 1, 1, 1,
0.09196639, -0.08481429, 2.519633, 1, 1, 1, 1, 1,
0.09241884, -0.4991889, 3.650061, 1, 1, 1, 1, 1,
0.09661745, 0.5284162, -0.2645159, 1, 1, 1, 1, 1,
0.1088821, 0.05758188, 2.502965, 0, 0, 1, 1, 1,
0.1118725, 0.9563602, 0.8256067, 1, 0, 0, 1, 1,
0.1126784, -0.4000744, 3.984032, 1, 0, 0, 1, 1,
0.11778, -1.677797, 1.949005, 1, 0, 0, 1, 1,
0.1196796, -1.066248, 3.846095, 1, 0, 0, 1, 1,
0.1209799, 0.1762686, 0.3509219, 1, 0, 0, 1, 1,
0.1214611, 0.476398, 0.3332307, 0, 0, 0, 1, 1,
0.1253978, -0.3215736, 1.775854, 0, 0, 0, 1, 1,
0.1268568, -0.5491096, 2.522219, 0, 0, 0, 1, 1,
0.1284682, -2.234165, 2.983871, 0, 0, 0, 1, 1,
0.1353497, -1.122189, 2.391895, 0, 0, 0, 1, 1,
0.1401474, -0.1975774, 1.839584, 0, 0, 0, 1, 1,
0.1466893, -0.3900824, 2.776205, 0, 0, 0, 1, 1,
0.1472838, 0.9584562, 1.722344, 1, 1, 1, 1, 1,
0.1481474, -0.358478, 3.380809, 1, 1, 1, 1, 1,
0.1487933, -0.5057614, 2.86858, 1, 1, 1, 1, 1,
0.1539807, 0.4235648, 0.7762791, 1, 1, 1, 1, 1,
0.1543029, -1.324853, 2.217621, 1, 1, 1, 1, 1,
0.1557244, 0.6821128, 1.731767, 1, 1, 1, 1, 1,
0.1593602, -0.3873425, 2.156217, 1, 1, 1, 1, 1,
0.160281, -2.259978, 3.802798, 1, 1, 1, 1, 1,
0.1655378, -0.918713, 1.106819, 1, 1, 1, 1, 1,
0.1659181, 0.02422826, 2.645323, 1, 1, 1, 1, 1,
0.1674193, -1.387527, 3.663654, 1, 1, 1, 1, 1,
0.1691718, -1.455781, 3.391442, 1, 1, 1, 1, 1,
0.1706795, 0.4078609, 0.2789542, 1, 1, 1, 1, 1,
0.1708599, 1.218008, 0.3906529, 1, 1, 1, 1, 1,
0.1763053, 1.798855, 0.6119691, 1, 1, 1, 1, 1,
0.1797549, 0.7110699, 0.6669799, 0, 0, 1, 1, 1,
0.1830218, -1.888712, 2.976753, 1, 0, 0, 1, 1,
0.1887844, 1.162737, -0.958276, 1, 0, 0, 1, 1,
0.189668, 0.7197062, 0.4095351, 1, 0, 0, 1, 1,
0.1967553, 0.7821962, 0.6035326, 1, 0, 0, 1, 1,
0.1972842, -0.02051228, 3.411222, 1, 0, 0, 1, 1,
0.1973052, -0.9751917, 1.635097, 0, 0, 0, 1, 1,
0.1984434, 1.392465, -1.438567, 0, 0, 0, 1, 1,
0.1997807, 1.378963, -0.149285, 0, 0, 0, 1, 1,
0.2007212, -0.4707524, 2.896979, 0, 0, 0, 1, 1,
0.2015901, -0.08428854, 3.026355, 0, 0, 0, 1, 1,
0.2019006, 0.7979339, -0.102713, 0, 0, 0, 1, 1,
0.2023005, -0.1475636, 2.418089, 0, 0, 0, 1, 1,
0.2024641, 0.5888972, -0.2510105, 1, 1, 1, 1, 1,
0.2070972, -0.3918185, 3.415907, 1, 1, 1, 1, 1,
0.2083675, -1.999674, 4.032764, 1, 1, 1, 1, 1,
0.211058, -2.026628, 3.741844, 1, 1, 1, 1, 1,
0.2110883, -0.260217, 1.01539, 1, 1, 1, 1, 1,
0.2121615, -1.248335, 3.298663, 1, 1, 1, 1, 1,
0.2129778, 1.036895, -0.5530647, 1, 1, 1, 1, 1,
0.2132717, 0.2385061, -0.3240959, 1, 1, 1, 1, 1,
0.2137344, -0.1865668, -1.180029, 1, 1, 1, 1, 1,
0.2140215, -0.03395085, 1.507231, 1, 1, 1, 1, 1,
0.2144281, -0.8358827, 3.243505, 1, 1, 1, 1, 1,
0.2171666, 1.946893, -0.1504117, 1, 1, 1, 1, 1,
0.2181422, -0.3973678, 2.183142, 1, 1, 1, 1, 1,
0.2196359, -1.225368, 3.963981, 1, 1, 1, 1, 1,
0.2197997, 0.01220459, 2.007036, 1, 1, 1, 1, 1,
0.2261293, -0.5359947, 3.420765, 0, 0, 1, 1, 1,
0.2269846, 0.69049, 1.872702, 1, 0, 0, 1, 1,
0.2290867, 0.2045143, 0.3966462, 1, 0, 0, 1, 1,
0.2309843, 0.4490501, 0.9243307, 1, 0, 0, 1, 1,
0.232867, 0.01307827, 1.945131, 1, 0, 0, 1, 1,
0.2397455, 1.129186, 2.43481, 1, 0, 0, 1, 1,
0.2424729, -1.04012, 1.869478, 0, 0, 0, 1, 1,
0.2436351, 1.615666, -0.8436186, 0, 0, 0, 1, 1,
0.2478452, 1.681307, 1.070918, 0, 0, 0, 1, 1,
0.2583668, 0.940245, -0.3708049, 0, 0, 0, 1, 1,
0.2611639, 0.1610143, 1.129439, 0, 0, 0, 1, 1,
0.2627986, 0.5926272, 0.3689291, 0, 0, 0, 1, 1,
0.2661433, -1.241373, 5.140467, 0, 0, 0, 1, 1,
0.2683361, 0.02316532, 2.263602, 1, 1, 1, 1, 1,
0.2747958, 0.5926844, 0.6308385, 1, 1, 1, 1, 1,
0.2780015, 0.4934177, -0.2962208, 1, 1, 1, 1, 1,
0.2781405, 0.7353904, 1.499153, 1, 1, 1, 1, 1,
0.2818023, 0.3400516, 0.6906998, 1, 1, 1, 1, 1,
0.2835113, -0.2867295, 0.8935792, 1, 1, 1, 1, 1,
0.2835582, 0.1528554, 2.166006, 1, 1, 1, 1, 1,
0.2847469, -0.2294617, 2.038501, 1, 1, 1, 1, 1,
0.2867785, -1.834193, 3.421223, 1, 1, 1, 1, 1,
0.2894011, 1.060027, 0.4860315, 1, 1, 1, 1, 1,
0.2907446, -0.2716699, 1.894336, 1, 1, 1, 1, 1,
0.2910995, 0.4705787, 1.388286, 1, 1, 1, 1, 1,
0.2957843, 0.4181609, -1.534978, 1, 1, 1, 1, 1,
0.300311, -0.4828602, 1.986415, 1, 1, 1, 1, 1,
0.3019793, -1.650566, 4.413851, 1, 1, 1, 1, 1,
0.3032204, -0.1289507, 1.219204, 0, 0, 1, 1, 1,
0.3034064, -0.3698393, 1.550723, 1, 0, 0, 1, 1,
0.3061298, 1.790032, -0.4612513, 1, 0, 0, 1, 1,
0.3061817, 0.3299057, 0.6554634, 1, 0, 0, 1, 1,
0.3062342, 0.6784806, 0.8332471, 1, 0, 0, 1, 1,
0.3089229, 0.2936934, 1.160177, 1, 0, 0, 1, 1,
0.3104527, 0.8068569, -0.4126271, 0, 0, 0, 1, 1,
0.3116677, -0.3096237, 2.582482, 0, 0, 0, 1, 1,
0.3131771, 0.4353068, 3.609746, 0, 0, 0, 1, 1,
0.3149995, 0.2716821, 1.459629, 0, 0, 0, 1, 1,
0.3185971, 1.00194, 0.8879879, 0, 0, 0, 1, 1,
0.3237655, -1.280139, 3.184813, 0, 0, 0, 1, 1,
0.3300889, 0.206599, 1.069865, 0, 0, 0, 1, 1,
0.3303562, 0.02427169, 1.651681, 1, 1, 1, 1, 1,
0.330713, 1.394256, -0.3052835, 1, 1, 1, 1, 1,
0.3316313, 0.2577685, 0.3115183, 1, 1, 1, 1, 1,
0.3319867, 3.292279, 0.4043584, 1, 1, 1, 1, 1,
0.3323309, 1.179141, -0.8362468, 1, 1, 1, 1, 1,
0.3388792, 2.342774, -1.821335, 1, 1, 1, 1, 1,
0.3449969, 0.104419, -0.9106534, 1, 1, 1, 1, 1,
0.3461042, -1.891084, 2.821247, 1, 1, 1, 1, 1,
0.3616072, 0.2528649, 0.3983202, 1, 1, 1, 1, 1,
0.3656732, 0.7047451, 1.732753, 1, 1, 1, 1, 1,
0.37146, -0.502146, 2.860555, 1, 1, 1, 1, 1,
0.3779856, -1.026039, 3.658922, 1, 1, 1, 1, 1,
0.3783674, 0.6525958, 1.686829, 1, 1, 1, 1, 1,
0.3791761, 0.9645984, -0.2323189, 1, 1, 1, 1, 1,
0.3812091, -1.052135, 2.000259, 1, 1, 1, 1, 1,
0.3815622, -0.6437542, 2.896858, 0, 0, 1, 1, 1,
0.3894294, -0.2028302, 2.480441, 1, 0, 0, 1, 1,
0.3895014, -1.147202, 2.903554, 1, 0, 0, 1, 1,
0.3908551, -0.9164757, 3.033077, 1, 0, 0, 1, 1,
0.3910121, 1.424595, -0.4754113, 1, 0, 0, 1, 1,
0.3911469, -0.8267474, 1.787819, 1, 0, 0, 1, 1,
0.3939764, -0.6514608, 2.786655, 0, 0, 0, 1, 1,
0.3941885, 0.2313009, 0.2613028, 0, 0, 0, 1, 1,
0.3952879, -1.091542, 2.408125, 0, 0, 0, 1, 1,
0.3957039, -0.9554469, 3.334352, 0, 0, 0, 1, 1,
0.3985872, -0.02163045, 0.2809051, 0, 0, 0, 1, 1,
0.4032717, 1.238647, 1.121812, 0, 0, 0, 1, 1,
0.4047059, -2.075099, 4.581364, 0, 0, 0, 1, 1,
0.4109247, -1.328054, 3.134097, 1, 1, 1, 1, 1,
0.4127106, -0.1727618, 2.20978, 1, 1, 1, 1, 1,
0.4220137, 1.522431, 1.345353, 1, 1, 1, 1, 1,
0.4244032, 0.197583, 2.056556, 1, 1, 1, 1, 1,
0.4269546, 0.6428804, 0.3787681, 1, 1, 1, 1, 1,
0.4307971, -1.294432, 3.35942, 1, 1, 1, 1, 1,
0.4331564, -0.4916833, 0.6832553, 1, 1, 1, 1, 1,
0.4345315, -0.9973775, 3.031396, 1, 1, 1, 1, 1,
0.435488, -0.3103687, 1.927238, 1, 1, 1, 1, 1,
0.444764, -0.4588238, 2.67168, 1, 1, 1, 1, 1,
0.4479785, -1.929228, 1.8139, 1, 1, 1, 1, 1,
0.4518235, 0.4510611, -0.006557237, 1, 1, 1, 1, 1,
0.4573812, -0.1540734, 2.265641, 1, 1, 1, 1, 1,
0.4618222, 2.623018, 0.8451919, 1, 1, 1, 1, 1,
0.4629666, 2.101374, -0.08258405, 1, 1, 1, 1, 1,
0.4630399, 0.8950431, 0.80997, 0, 0, 1, 1, 1,
0.4636542, 1.646716, -0.4887405, 1, 0, 0, 1, 1,
0.4636932, -0.9749743, 2.490686, 1, 0, 0, 1, 1,
0.4646163, -0.5185012, 3.811292, 1, 0, 0, 1, 1,
0.4661747, -1.912996, 3.972993, 1, 0, 0, 1, 1,
0.4666407, -0.05730813, 2.411633, 1, 0, 0, 1, 1,
0.4697163, 0.1072568, 1.82436, 0, 0, 0, 1, 1,
0.4737498, -0.3558332, -0.07725424, 0, 0, 0, 1, 1,
0.4749343, 1.280014, 1.785258, 0, 0, 0, 1, 1,
0.4751164, -0.9507468, 3.858643, 0, 0, 0, 1, 1,
0.476405, -0.4041207, 3.102099, 0, 0, 0, 1, 1,
0.4789825, -0.5429376, 2.256127, 0, 0, 0, 1, 1,
0.4797567, 0.7372792, 0.9331988, 0, 0, 0, 1, 1,
0.4797918, -1.496844, 1.910715, 1, 1, 1, 1, 1,
0.4814766, -2.2758, 4.784963, 1, 1, 1, 1, 1,
0.4845783, -1.001952, 1.849186, 1, 1, 1, 1, 1,
0.4893978, -0.7784585, 0.08039012, 1, 1, 1, 1, 1,
0.4913936, -0.7286634, 3.010772, 1, 1, 1, 1, 1,
0.493429, -0.6537123, 1.056462, 1, 1, 1, 1, 1,
0.5016814, -0.2580051, 3.702721, 1, 1, 1, 1, 1,
0.5039687, -1.132895, 3.102428, 1, 1, 1, 1, 1,
0.5093661, 0.1635701, 0.6917425, 1, 1, 1, 1, 1,
0.5105497, 0.03330351, 1.684374, 1, 1, 1, 1, 1,
0.5128717, 0.6277391, 0.9356101, 1, 1, 1, 1, 1,
0.5132334, 0.1734079, 3.24246, 1, 1, 1, 1, 1,
0.5158921, 0.6602671, 1.663859, 1, 1, 1, 1, 1,
0.5174047, -1.436844, 4.66766, 1, 1, 1, 1, 1,
0.5196924, -2.056926, 0.9234539, 1, 1, 1, 1, 1,
0.5213248, 1.111678, 0.9647365, 0, 0, 1, 1, 1,
0.5226547, 0.4660706, 0.5856163, 1, 0, 0, 1, 1,
0.5229242, 0.3690472, 0.8170353, 1, 0, 0, 1, 1,
0.5257095, 0.0002088481, 1.09886, 1, 0, 0, 1, 1,
0.5282482, 0.5114542, 2.512426, 1, 0, 0, 1, 1,
0.5323213, 0.7973483, 0.1135907, 1, 0, 0, 1, 1,
0.5345134, -0.3054398, 1.166591, 0, 0, 0, 1, 1,
0.5368467, 0.3643818, 0.6271424, 0, 0, 0, 1, 1,
0.5384851, -0.2634225, 2.504263, 0, 0, 0, 1, 1,
0.5385987, 0.3238675, -0.6109851, 0, 0, 0, 1, 1,
0.5389487, -0.5083885, 0.8225322, 0, 0, 0, 1, 1,
0.539004, -0.1873222, 0.1210098, 0, 0, 0, 1, 1,
0.5473471, 0.6499412, 0.9467604, 0, 0, 0, 1, 1,
0.548377, 0.5351481, 1.850406, 1, 1, 1, 1, 1,
0.5500255, -0.7681271, 3.204489, 1, 1, 1, 1, 1,
0.5511553, -0.4241862, 2.977963, 1, 1, 1, 1, 1,
0.5532026, -0.7421919, 2.920172, 1, 1, 1, 1, 1,
0.5532134, -0.5413703, 4.499549, 1, 1, 1, 1, 1,
0.55419, -0.0283161, 1.864756, 1, 1, 1, 1, 1,
0.5556842, -0.2324328, 2.034125, 1, 1, 1, 1, 1,
0.55686, -0.435224, 1.839468, 1, 1, 1, 1, 1,
0.5586095, 0.1080781, 0.8529513, 1, 1, 1, 1, 1,
0.5589762, 1.03861, 2.694416, 1, 1, 1, 1, 1,
0.5606263, -1.460539, 2.785277, 1, 1, 1, 1, 1,
0.5630484, -0.3789066, -0.4344519, 1, 1, 1, 1, 1,
0.5650104, -1.146286, 3.378345, 1, 1, 1, 1, 1,
0.5688302, -0.9595418, 2.405208, 1, 1, 1, 1, 1,
0.5746396, -0.1126634, 2.83294, 1, 1, 1, 1, 1,
0.5799985, 0.6708354, 0.4068212, 0, 0, 1, 1, 1,
0.5841506, -1.159964, 2.244244, 1, 0, 0, 1, 1,
0.5871478, 0.6063977, 3.215759, 1, 0, 0, 1, 1,
0.5970131, -0.8165169, 1.216718, 1, 0, 0, 1, 1,
0.5974451, -1.27624, 1.476637, 1, 0, 0, 1, 1,
0.6006631, -2.384195, 3.774543, 1, 0, 0, 1, 1,
0.6021385, 0.6053636, 3.216134, 0, 0, 0, 1, 1,
0.6042876, 0.1621517, 2.503943, 0, 0, 0, 1, 1,
0.6080185, 0.1735888, 1.559502, 0, 0, 0, 1, 1,
0.6125227, -1.471727, 1.281532, 0, 0, 0, 1, 1,
0.6135356, 0.05602962, 2.594848, 0, 0, 0, 1, 1,
0.6208186, -1.109637, 3.740852, 0, 0, 0, 1, 1,
0.6221466, 0.9512021, 1.75964, 0, 0, 0, 1, 1,
0.6257207, 0.8762034, 0.6915685, 1, 1, 1, 1, 1,
0.6274074, -1.068066, 3.537698, 1, 1, 1, 1, 1,
0.6285602, -0.5232179, 1.849453, 1, 1, 1, 1, 1,
0.6321528, -1.143171, 4.432663, 1, 1, 1, 1, 1,
0.6460552, 0.0634151, 0.572116, 1, 1, 1, 1, 1,
0.6536136, -0.7619744, 2.293295, 1, 1, 1, 1, 1,
0.6563138, -1.368005, 2.286425, 1, 1, 1, 1, 1,
0.6577009, 0.4672465, 2.002019, 1, 1, 1, 1, 1,
0.6584112, 0.9489275, 0.4900017, 1, 1, 1, 1, 1,
0.661851, 2.566817, -1.648613, 1, 1, 1, 1, 1,
0.6635899, 0.3705342, 0.547728, 1, 1, 1, 1, 1,
0.6666565, -1.909975, 3.99792, 1, 1, 1, 1, 1,
0.6677335, 1.624989, -1.205551, 1, 1, 1, 1, 1,
0.6684222, -0.9146551, 3.221107, 1, 1, 1, 1, 1,
0.6731104, 0.3818153, 0.4056119, 1, 1, 1, 1, 1,
0.6741593, 0.7829972, -1.11231, 0, 0, 1, 1, 1,
0.6746026, -0.3152124, 2.207605, 1, 0, 0, 1, 1,
0.6748736, -1.459612, 2.901537, 1, 0, 0, 1, 1,
0.6773626, -0.0919864, 1.221373, 1, 0, 0, 1, 1,
0.6794237, -0.735794, 1.669066, 1, 0, 0, 1, 1,
0.6837428, -0.2224801, 1.512538, 1, 0, 0, 1, 1,
0.6860181, 0.5284836, 0.4506623, 0, 0, 0, 1, 1,
0.6891925, 0.1226601, 3.454288, 0, 0, 0, 1, 1,
0.6963211, -0.5512747, 2.797973, 0, 0, 0, 1, 1,
0.6989083, -2.117578, 2.430319, 0, 0, 0, 1, 1,
0.7000606, -0.4704723, 3.607278, 0, 0, 0, 1, 1,
0.7004512, -0.08679919, 2.001495, 0, 0, 0, 1, 1,
0.7006826, 0.506209, -0.9197854, 0, 0, 0, 1, 1,
0.7043644, 0.3973531, 0.3140336, 1, 1, 1, 1, 1,
0.7129136, 1.304461, 1.665763, 1, 1, 1, 1, 1,
0.7220749, 0.08318803, 1.227525, 1, 1, 1, 1, 1,
0.7266648, 1.376997, 0.5241592, 1, 1, 1, 1, 1,
0.7286284, -0.3779153, 3.820413, 1, 1, 1, 1, 1,
0.7304212, -1.748364, 2.744071, 1, 1, 1, 1, 1,
0.7324089, -0.1921213, 3.007405, 1, 1, 1, 1, 1,
0.7356925, 0.2706876, 1.851668, 1, 1, 1, 1, 1,
0.7365669, 1.167195, 1.481093, 1, 1, 1, 1, 1,
0.739814, 0.06737702, 0.6761763, 1, 1, 1, 1, 1,
0.7448919, -0.8048303, 0.2348908, 1, 1, 1, 1, 1,
0.74726, -0.08112902, 3.438417, 1, 1, 1, 1, 1,
0.753486, -1.23108, 3.504204, 1, 1, 1, 1, 1,
0.7580898, -1.852147, 2.668005, 1, 1, 1, 1, 1,
0.7605795, -1.983573, 3.866357, 1, 1, 1, 1, 1,
0.7608631, -2.007897, 1.787219, 0, 0, 1, 1, 1,
0.7618933, -0.4035002, 1.532942, 1, 0, 0, 1, 1,
0.7631592, -2.127105, 2.946043, 1, 0, 0, 1, 1,
0.7656343, -1.879988, 2.835527, 1, 0, 0, 1, 1,
0.7677289, 0.3378084, 2.834981, 1, 0, 0, 1, 1,
0.7707195, -1.081494, 3.896415, 1, 0, 0, 1, 1,
0.7741864, -0.9080507, 3.014337, 0, 0, 0, 1, 1,
0.7742687, 0.4677369, -0.1189666, 0, 0, 0, 1, 1,
0.7787703, -0.06777553, 0.9524099, 0, 0, 0, 1, 1,
0.779154, -0.4407514, 0.6343167, 0, 0, 0, 1, 1,
0.7792522, -0.009275931, 1.666709, 0, 0, 0, 1, 1,
0.7810946, 3.303277, 0.3174362, 0, 0, 0, 1, 1,
0.7814745, 0.9140724, 1.016874, 0, 0, 0, 1, 1,
0.7880378, 2.113276, -0.1768742, 1, 1, 1, 1, 1,
0.7938399, -1.117252, 1.796448, 1, 1, 1, 1, 1,
0.7945768, 1.019886, 1.076077, 1, 1, 1, 1, 1,
0.7949519, -1.623791, 0.50587, 1, 1, 1, 1, 1,
0.7950237, 0.2800713, 0.7760291, 1, 1, 1, 1, 1,
0.7957554, 0.06950926, 1.784676, 1, 1, 1, 1, 1,
0.7997004, -1.199178, 0.4629458, 1, 1, 1, 1, 1,
0.8007898, 0.981078, 0.08752549, 1, 1, 1, 1, 1,
0.8011132, 0.08464488, -0.2767084, 1, 1, 1, 1, 1,
0.804992, -0.3925063, 1.729424, 1, 1, 1, 1, 1,
0.8081675, 0.1896722, 1.785487, 1, 1, 1, 1, 1,
0.8135433, 0.4891537, 2.375936, 1, 1, 1, 1, 1,
0.817499, -0.03715462, 1.435663, 1, 1, 1, 1, 1,
0.8200125, 1.09258, 0.2622171, 1, 1, 1, 1, 1,
0.8226225, 1.144665, -0.1900235, 1, 1, 1, 1, 1,
0.8262251, -0.6074806, 4.175164, 0, 0, 1, 1, 1,
0.8263512, 0.3673292, 0.7742863, 1, 0, 0, 1, 1,
0.831281, -0.2738286, 0.9162134, 1, 0, 0, 1, 1,
0.8390337, -1.351882, 4.975531, 1, 0, 0, 1, 1,
0.8451172, 0.6555173, -0.9321867, 1, 0, 0, 1, 1,
0.8505847, 0.5071697, 0.5088557, 1, 0, 0, 1, 1,
0.8509322, -0.79579, 2.581667, 0, 0, 0, 1, 1,
0.8517758, 0.1953602, 1.94869, 0, 0, 0, 1, 1,
0.8548408, 0.9037014, -0.9969444, 0, 0, 0, 1, 1,
0.8643742, 0.9697665, 1.882185, 0, 0, 0, 1, 1,
0.8672569, 0.3073038, 1.49518, 0, 0, 0, 1, 1,
0.8741534, 1.696388, 0.5911318, 0, 0, 0, 1, 1,
0.8826649, 1.920049, 0.5401899, 0, 0, 0, 1, 1,
0.8870974, 0.5088848, 0.8414737, 1, 1, 1, 1, 1,
0.8899747, -0.6592034, 1.604553, 1, 1, 1, 1, 1,
0.8913922, -0.08593008, 2.030264, 1, 1, 1, 1, 1,
0.8928218, -0.3388065, 4.202107, 1, 1, 1, 1, 1,
0.8946724, -0.06219789, 0.212568, 1, 1, 1, 1, 1,
0.8957571, 1.176062, -0.7704617, 1, 1, 1, 1, 1,
0.8967559, -0.9348471, 4.132685, 1, 1, 1, 1, 1,
0.899832, -0.2887921, 0.3436621, 1, 1, 1, 1, 1,
0.9026659, 0.2563996, 1.832272, 1, 1, 1, 1, 1,
0.9064886, 0.3597281, 1.469311, 1, 1, 1, 1, 1,
0.9120398, -1.00598, 2.917394, 1, 1, 1, 1, 1,
0.9121214, 0.3171732, 1.754274, 1, 1, 1, 1, 1,
0.9158246, 0.3888651, 0.3301432, 1, 1, 1, 1, 1,
0.916597, -2.039463, 2.701424, 1, 1, 1, 1, 1,
0.9208034, 0.2710053, 1.516191, 1, 1, 1, 1, 1,
0.9214732, -1.38434, 1.881428, 0, 0, 1, 1, 1,
0.9240863, -0.2086505, 0.4356686, 1, 0, 0, 1, 1,
0.9286041, -1.661996, 1.44471, 1, 0, 0, 1, 1,
0.9294767, 1.219205, 0.007159166, 1, 0, 0, 1, 1,
0.9419558, -0.3211796, 1.786653, 1, 0, 0, 1, 1,
0.9491373, -0.206984, 2.842101, 1, 0, 0, 1, 1,
0.9573022, 1.144127, 0.1282242, 0, 0, 0, 1, 1,
0.9580114, -0.3689294, -0.2646964, 0, 0, 0, 1, 1,
0.9597077, 0.1215563, 2.593075, 0, 0, 0, 1, 1,
0.962491, -1.58457, 3.009497, 0, 0, 0, 1, 1,
0.9635392, -0.1241703, 1.735877, 0, 0, 0, 1, 1,
0.966602, 0.4639696, -0.0570125, 0, 0, 0, 1, 1,
0.9704905, 0.3822201, 0.7086142, 0, 0, 0, 1, 1,
0.9754041, 1.751622, 0.6389804, 1, 1, 1, 1, 1,
0.9779702, -0.06145698, 1.329689, 1, 1, 1, 1, 1,
0.9793561, 0.3381422, 2.326778, 1, 1, 1, 1, 1,
0.9848578, -1.839564, 2.660648, 1, 1, 1, 1, 1,
0.988139, -0.531552, 2.991966, 1, 1, 1, 1, 1,
0.9883166, -0.09017687, 1.723869, 1, 1, 1, 1, 1,
0.9983562, 0.3620467, -0.2295552, 1, 1, 1, 1, 1,
1.001287, -1.561426, 1.084035, 1, 1, 1, 1, 1,
1.006002, -1.982404, 4.144763, 1, 1, 1, 1, 1,
1.024803, -1.055294, 2.812928, 1, 1, 1, 1, 1,
1.025281, 0.1360961, 0.3881173, 1, 1, 1, 1, 1,
1.029853, -0.1622497, 0.8456269, 1, 1, 1, 1, 1,
1.037572, -0.9394054, 1.312583, 1, 1, 1, 1, 1,
1.039462, 1.461627, -0.7890345, 1, 1, 1, 1, 1,
1.048052, -0.9068403, 2.290396, 1, 1, 1, 1, 1,
1.052462, 1.742524, 2.416997, 0, 0, 1, 1, 1,
1.055737, 1.664364, -0.3673759, 1, 0, 0, 1, 1,
1.063209, -1.390621, 2.609332, 1, 0, 0, 1, 1,
1.063504, -1.418617, 4.133008, 1, 0, 0, 1, 1,
1.069117, 0.5218769, 0.854342, 1, 0, 0, 1, 1,
1.085966, -0.2107736, 2.268607, 1, 0, 0, 1, 1,
1.090144, 0.1262512, 3.011681, 0, 0, 0, 1, 1,
1.091762, -0.1863391, 1.619617, 0, 0, 0, 1, 1,
1.092675, -0.2494589, 1.476102, 0, 0, 0, 1, 1,
1.096721, -0.9654721, 2.653279, 0, 0, 0, 1, 1,
1.097943, -0.4212725, 2.507627, 0, 0, 0, 1, 1,
1.098721, -0.8407528, 4.256972, 0, 0, 0, 1, 1,
1.102145, 0.9690793, 2.671306, 0, 0, 0, 1, 1,
1.110305, 2.328662, -0.2641391, 1, 1, 1, 1, 1,
1.111508, -0.8610435, 1.547495, 1, 1, 1, 1, 1,
1.117101, -0.7035265, 1.549331, 1, 1, 1, 1, 1,
1.120342, 1.787293, 0.5251077, 1, 1, 1, 1, 1,
1.137691, 0.4287742, 0.9239219, 1, 1, 1, 1, 1,
1.149057, 1.176653, 0.946461, 1, 1, 1, 1, 1,
1.151751, 0.1121779, 0.1267882, 1, 1, 1, 1, 1,
1.155344, 1.086323, 1.124161, 1, 1, 1, 1, 1,
1.156723, 0.7705297, 2.289619, 1, 1, 1, 1, 1,
1.156772, 0.9089736, -0.05065586, 1, 1, 1, 1, 1,
1.172348, 0.09628828, 2.449232, 1, 1, 1, 1, 1,
1.178892, 2.001789, 0.6829159, 1, 1, 1, 1, 1,
1.182297, -1.605777, 4.149462, 1, 1, 1, 1, 1,
1.187802, -0.7906285, 1.616509, 1, 1, 1, 1, 1,
1.188748, 0.1516455, -1.592843, 1, 1, 1, 1, 1,
1.193754, -0.562262, 2.39657, 0, 0, 1, 1, 1,
1.194672, -0.1182794, 4.083846, 1, 0, 0, 1, 1,
1.195341, 1.07158, 1.420588, 1, 0, 0, 1, 1,
1.201436, -0.494174, 1.510416, 1, 0, 0, 1, 1,
1.203782, -0.6780252, 2.644634, 1, 0, 0, 1, 1,
1.211147, 1.672581, 0.4729218, 1, 0, 0, 1, 1,
1.215654, -0.3742956, 0.4392937, 0, 0, 0, 1, 1,
1.222536, 1.234718, 1.881401, 0, 0, 0, 1, 1,
1.223316, -0.7057917, 1.786584, 0, 0, 0, 1, 1,
1.22838, 0.2933807, 1.11747, 0, 0, 0, 1, 1,
1.228613, -0.4839695, 2.355787, 0, 0, 0, 1, 1,
1.229578, -1.515364, 2.499143, 0, 0, 0, 1, 1,
1.233441, -0.3517532, 1.195194, 0, 0, 0, 1, 1,
1.238708, 0.6567386, 0.6741216, 1, 1, 1, 1, 1,
1.243442, 1.836456, 0.3381999, 1, 1, 1, 1, 1,
1.247241, -2.171545, 3.549173, 1, 1, 1, 1, 1,
1.252767, -1.087072, 0.3048309, 1, 1, 1, 1, 1,
1.253841, 0.2525904, 1.396277, 1, 1, 1, 1, 1,
1.257981, -0.3863268, 3.696284, 1, 1, 1, 1, 1,
1.268902, 0.03875051, 3.41647, 1, 1, 1, 1, 1,
1.27343, 0.06250043, 1.203835, 1, 1, 1, 1, 1,
1.274376, -0.6819816, 1.824194, 1, 1, 1, 1, 1,
1.274817, 0.4122098, 2.066344, 1, 1, 1, 1, 1,
1.279262, -0.3618092, 3.584641, 1, 1, 1, 1, 1,
1.281464, 0.6583625, 1.726985, 1, 1, 1, 1, 1,
1.289803, 1.860357, 1.937962, 1, 1, 1, 1, 1,
1.307208, 0.2994787, 0.8804041, 1, 1, 1, 1, 1,
1.308502, 0.8794519, 0.09667854, 1, 1, 1, 1, 1,
1.3157, 0.6458926, 1.326662, 0, 0, 1, 1, 1,
1.33065, -3.246397, 3.341792, 1, 0, 0, 1, 1,
1.341712, -1.071214, 3.628733, 1, 0, 0, 1, 1,
1.341738, -0.03843791, 0.8306865, 1, 0, 0, 1, 1,
1.343449, 1.055944, 1.524149, 1, 0, 0, 1, 1,
1.351523, 0.6119356, 0.3365544, 1, 0, 0, 1, 1,
1.355537, -0.8604987, 1.963948, 0, 0, 0, 1, 1,
1.368435, -0.2555082, 2.957766, 0, 0, 0, 1, 1,
1.370661, 0.405845, 0.00261659, 0, 0, 0, 1, 1,
1.37513, 2.106249, 1.29678, 0, 0, 0, 1, 1,
1.377048, -1.493806, 3.460689, 0, 0, 0, 1, 1,
1.378579, -0.3771114, 2.923301, 0, 0, 0, 1, 1,
1.384503, 0.103145, 0.2042201, 0, 0, 0, 1, 1,
1.390192, 0.1094217, 2.312723, 1, 1, 1, 1, 1,
1.394199, 0.8249789, -0.09214235, 1, 1, 1, 1, 1,
1.398639, 0.6307272, 0.7645514, 1, 1, 1, 1, 1,
1.4113, 0.5785738, 0.9551859, 1, 1, 1, 1, 1,
1.413043, -0.9129884, 2.130614, 1, 1, 1, 1, 1,
1.426636, 0.2241142, 1.838581, 1, 1, 1, 1, 1,
1.429556, -0.1108413, 2.916373, 1, 1, 1, 1, 1,
1.438119, -1.557939, 3.568681, 1, 1, 1, 1, 1,
1.438535, -1.250039, 3.614478, 1, 1, 1, 1, 1,
1.439501, 0.1887247, 1.302145, 1, 1, 1, 1, 1,
1.450793, -0.09012207, 1.5295, 1, 1, 1, 1, 1,
1.452756, 0.3262421, 1.428952, 1, 1, 1, 1, 1,
1.459412, -0.06157182, 2.969249, 1, 1, 1, 1, 1,
1.463962, 0.6658214, -0.7545279, 1, 1, 1, 1, 1,
1.46397, -0.282809, -0.313863, 1, 1, 1, 1, 1,
1.472066, 1.119684, 2.210282, 0, 0, 1, 1, 1,
1.479429, 0.5194149, 0.9592535, 1, 0, 0, 1, 1,
1.480483, 0.3843631, 0.08754944, 1, 0, 0, 1, 1,
1.483621, 0.6236916, 1.624139, 1, 0, 0, 1, 1,
1.491199, 1.424466, 2.543979, 1, 0, 0, 1, 1,
1.494242, 1.459137, -0.1777395, 1, 0, 0, 1, 1,
1.501513, -1.519867, 3.380887, 0, 0, 0, 1, 1,
1.510685, -0.1507545, 0.1159841, 0, 0, 0, 1, 1,
1.530053, -0.8903659, -0.4802747, 0, 0, 0, 1, 1,
1.54242, 0.8206818, 2.317943, 0, 0, 0, 1, 1,
1.568239, 0.9191568, 1.280835, 0, 0, 0, 1, 1,
1.571487, -0.1381983, 0.2566769, 0, 0, 0, 1, 1,
1.588469, -1.323764, 0.8911704, 0, 0, 0, 1, 1,
1.592678, 0.5532677, 2.871565, 1, 1, 1, 1, 1,
1.601243, -1.729161, 3.575017, 1, 1, 1, 1, 1,
1.601812, -0.5637542, 0.5254197, 1, 1, 1, 1, 1,
1.618055, 0.1749876, 1.833299, 1, 1, 1, 1, 1,
1.620544, -1.504443, 2.442346, 1, 1, 1, 1, 1,
1.628431, -2.05525, 1.898057, 1, 1, 1, 1, 1,
1.665084, 1.53097, 0.2060518, 1, 1, 1, 1, 1,
1.665767, -1.662621, 2.322191, 1, 1, 1, 1, 1,
1.675304, -0.1581451, 2.892371, 1, 1, 1, 1, 1,
1.678875, -0.1894152, 2.694121, 1, 1, 1, 1, 1,
1.685584, -0.1860278, -1.616955, 1, 1, 1, 1, 1,
1.701107, -1.156901, 2.622417, 1, 1, 1, 1, 1,
1.705446, -0.991612, 2.744892, 1, 1, 1, 1, 1,
1.710571, 2.77313, 0.8755081, 1, 1, 1, 1, 1,
1.718967, -0.2456936, 3.838038, 1, 1, 1, 1, 1,
1.721204, 0.7037666, 0.8750048, 0, 0, 1, 1, 1,
1.729187, -3.180181, 2.323489, 1, 0, 0, 1, 1,
1.750612, -0.9741106, 2.61012, 1, 0, 0, 1, 1,
1.754914, -0.2567176, 1.55728, 1, 0, 0, 1, 1,
1.761728, 0.3643932, 3.112359, 1, 0, 0, 1, 1,
1.763844, 0.05714077, 1.409154, 1, 0, 0, 1, 1,
1.808175, -0.0694375, 0.4562615, 0, 0, 0, 1, 1,
1.835797, -0.7205623, 1.356558, 0, 0, 0, 1, 1,
1.836748, -0.8236591, 1.018024, 0, 0, 0, 1, 1,
1.851785, -1.225271, 2.551779, 0, 0, 0, 1, 1,
1.887044, -0.8028456, 3.078234, 0, 0, 0, 1, 1,
1.902915, 1.202078, -0.4113326, 0, 0, 0, 1, 1,
1.914337, 0.2200667, 1.582531, 0, 0, 0, 1, 1,
1.960987, -1.037928, 2.50195, 1, 1, 1, 1, 1,
1.968146, 0.7284448, 0.3005705, 1, 1, 1, 1, 1,
1.973956, -0.7799479, 2.305057, 1, 1, 1, 1, 1,
1.989501, -0.6359992, 2.231888, 1, 1, 1, 1, 1,
2.060475, 0.9860747, 2.364884, 1, 1, 1, 1, 1,
2.068619, 0.6966448, 2.840159, 1, 1, 1, 1, 1,
2.069128, -0.5540757, 1.102239, 1, 1, 1, 1, 1,
2.085725, 0.1173847, 2.611945, 1, 1, 1, 1, 1,
2.091718, -1.50257, 3.431337, 1, 1, 1, 1, 1,
2.138016, 1.321695, 0.01922056, 1, 1, 1, 1, 1,
2.150968, 1.292613, 1.789017, 1, 1, 1, 1, 1,
2.173091, -1.169043, 1.772225, 1, 1, 1, 1, 1,
2.205818, -0.1695313, 2.544511, 1, 1, 1, 1, 1,
2.216255, -1.3673, 1.724646, 1, 1, 1, 1, 1,
2.217426, 0.8859823, 1.348333, 1, 1, 1, 1, 1,
2.253282, -0.5460355, 1.585079, 0, 0, 1, 1, 1,
2.268483, 1.147332, 0.4645177, 1, 0, 0, 1, 1,
2.31419, -0.1659964, 4.445376, 1, 0, 0, 1, 1,
2.328025, -0.3682545, 0.5080948, 1, 0, 0, 1, 1,
2.360744, -0.7286147, 1.423172, 1, 0, 0, 1, 1,
2.37514, 0.5127192, 1.695412, 1, 0, 0, 1, 1,
2.391906, 0.690129, 1.032416, 0, 0, 0, 1, 1,
2.392951, 0.02070296, 0.9792168, 0, 0, 0, 1, 1,
2.442582, 0.2869107, 1.398075, 0, 0, 0, 1, 1,
2.444913, -0.8166696, 1.39452, 0, 0, 0, 1, 1,
2.453179, 1.90964, 0.3197066, 0, 0, 0, 1, 1,
2.564862, -0.2821538, 0.8205264, 0, 0, 0, 1, 1,
2.660032, -0.4930218, 1.7968, 0, 0, 0, 1, 1,
2.734269, -0.4580124, 1.428958, 1, 1, 1, 1, 1,
2.739372, -0.2306386, 3.188619, 1, 1, 1, 1, 1,
2.757613, 0.3332557, 1.674062, 1, 1, 1, 1, 1,
2.794892, 0.6342329, 1.800771, 1, 1, 1, 1, 1,
2.802556, 0.1753165, 1.383211, 1, 1, 1, 1, 1,
2.822466, -0.03693451, 0.6778324, 1, 1, 1, 1, 1,
3.222708, 0.8670909, 2.226338, 1, 1, 1, 1, 1
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
var radius = 9.856263;
var distance = 34.6197;
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
mvMatrix.translate( 0.1578104, -0.2107248, 0.2806706 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.6197);
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
