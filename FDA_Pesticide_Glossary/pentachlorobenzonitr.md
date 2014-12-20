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
-2.812891, 0.4270852, -2.959028, 1, 0, 0, 1,
-2.805571, 0.4847756, -1.070288, 1, 0.007843138, 0, 1,
-2.72613, 0.05032433, -2.614346, 1, 0.01176471, 0, 1,
-2.697915, -1.785349, -1.573853, 1, 0.01960784, 0, 1,
-2.632287, -0.9802364, -3.077118, 1, 0.02352941, 0, 1,
-2.447178, -0.9460427, -0.9403881, 1, 0.03137255, 0, 1,
-2.336228, 0.3251744, -1.969096, 1, 0.03529412, 0, 1,
-2.240575, -0.44992, -1.289001, 1, 0.04313726, 0, 1,
-2.229162, 1.68198, -1.889955, 1, 0.04705882, 0, 1,
-2.217133, 1.603644, 0.03347808, 1, 0.05490196, 0, 1,
-2.197472, -1.47365, -2.735667, 1, 0.05882353, 0, 1,
-2.121665, -2.1921, -0.7171459, 1, 0.06666667, 0, 1,
-2.108585, -1.463716, -1.544637, 1, 0.07058824, 0, 1,
-2.107769, 0.3961847, -1.540076, 1, 0.07843138, 0, 1,
-2.067958, -0.2519339, 0.1219886, 1, 0.08235294, 0, 1,
-2.042939, -0.2918727, -0.8524203, 1, 0.09019608, 0, 1,
-2.025156, 0.2682245, -1.336096, 1, 0.09411765, 0, 1,
-2.02445, -0.7174385, -2.486453, 1, 0.1019608, 0, 1,
-1.986926, 0.2507237, -1.84054, 1, 0.1098039, 0, 1,
-1.907825, -1.515396, -2.075263, 1, 0.1137255, 0, 1,
-1.904422, 1.198132, 1.155064, 1, 0.1215686, 0, 1,
-1.891302, 1.354825, -0.3623535, 1, 0.1254902, 0, 1,
-1.889558, 0.4907186, -0.7368045, 1, 0.1333333, 0, 1,
-1.885526, 0.8580059, -1.632106, 1, 0.1372549, 0, 1,
-1.862695, 0.1644683, -3.039494, 1, 0.145098, 0, 1,
-1.856364, 0.3604444, -0.9828327, 1, 0.1490196, 0, 1,
-1.834898, -2.164674, -5.336265, 1, 0.1568628, 0, 1,
-1.833304, 0.2202438, -1.189819, 1, 0.1607843, 0, 1,
-1.826466, -0.9992595, -0.4377706, 1, 0.1686275, 0, 1,
-1.809934, 0.7918794, -1.222413, 1, 0.172549, 0, 1,
-1.793421, -0.3925222, -3.422871, 1, 0.1803922, 0, 1,
-1.792049, -0.7409838, -0.04033175, 1, 0.1843137, 0, 1,
-1.788342, 0.870626, -0.07566784, 1, 0.1921569, 0, 1,
-1.760515, 1.144954, -0.7210978, 1, 0.1960784, 0, 1,
-1.75613, -0.5228504, -2.885241, 1, 0.2039216, 0, 1,
-1.741594, -0.3205423, -0.9840388, 1, 0.2117647, 0, 1,
-1.71, 0.09786738, 0.7700474, 1, 0.2156863, 0, 1,
-1.703881, 1.755221, -0.8284665, 1, 0.2235294, 0, 1,
-1.685614, 0.2609922, -1.747931, 1, 0.227451, 0, 1,
-1.680592, 1.248363, -0.707615, 1, 0.2352941, 0, 1,
-1.670831, -0.1351432, -0.3773291, 1, 0.2392157, 0, 1,
-1.667364, 1.450679, -1.909448, 1, 0.2470588, 0, 1,
-1.662604, -0.7350401, -2.157882, 1, 0.2509804, 0, 1,
-1.653571, -0.7650486, -2.187051, 1, 0.2588235, 0, 1,
-1.652831, 0.9201047, -0.8248175, 1, 0.2627451, 0, 1,
-1.606279, 1.914386, -1.157369, 1, 0.2705882, 0, 1,
-1.574599, -0.589732, -1.184737, 1, 0.2745098, 0, 1,
-1.568511, -0.7836756, -3.504983, 1, 0.282353, 0, 1,
-1.551984, -0.8162866, -1.132831, 1, 0.2862745, 0, 1,
-1.541578, -0.7647927, -0.896283, 1, 0.2941177, 0, 1,
-1.531025, 1.223457, 1.347204, 1, 0.3019608, 0, 1,
-1.527948, 0.4995987, -1.175374, 1, 0.3058824, 0, 1,
-1.52514, -1.336103, -2.182041, 1, 0.3137255, 0, 1,
-1.522424, -0.896055, -4.34618, 1, 0.3176471, 0, 1,
-1.505185, -0.7019274, -2.223664, 1, 0.3254902, 0, 1,
-1.48693, 1.216008, -0.2967336, 1, 0.3294118, 0, 1,
-1.470841, 0.1129884, -1.190197, 1, 0.3372549, 0, 1,
-1.468453, 0.02923369, -2.280612, 1, 0.3411765, 0, 1,
-1.464095, 0.7133016, -0.7025726, 1, 0.3490196, 0, 1,
-1.455216, 0.1689023, -1.94716, 1, 0.3529412, 0, 1,
-1.45511, -0.3160413, -1.844649, 1, 0.3607843, 0, 1,
-1.432474, -0.3792019, -4.189832, 1, 0.3647059, 0, 1,
-1.423573, 0.9531582, 0.2406541, 1, 0.372549, 0, 1,
-1.414083, -0.6075329, -2.908195, 1, 0.3764706, 0, 1,
-1.413029, -0.9225319, -3.409179, 1, 0.3843137, 0, 1,
-1.401167, 0.0941321, -1.172038, 1, 0.3882353, 0, 1,
-1.393162, -0.4912199, -1.080918, 1, 0.3960784, 0, 1,
-1.390321, 0.6945614, -0.612681, 1, 0.4039216, 0, 1,
-1.383115, -0.7225624, -2.859021, 1, 0.4078431, 0, 1,
-1.372313, -0.2017966, -2.166671, 1, 0.4156863, 0, 1,
-1.35308, -0.5997527, -2.605685, 1, 0.4196078, 0, 1,
-1.35092, 0.4140778, -1.0732, 1, 0.427451, 0, 1,
-1.324837, -0.7529991, -1.977658, 1, 0.4313726, 0, 1,
-1.320668, 1.585799, -2.549963, 1, 0.4392157, 0, 1,
-1.312399, 0.6961048, -0.4963644, 1, 0.4431373, 0, 1,
-1.308294, -1.500557, -2.609347, 1, 0.4509804, 0, 1,
-1.308048, 0.7638947, -0.1515597, 1, 0.454902, 0, 1,
-1.306889, -2.349545, -3.115747, 1, 0.4627451, 0, 1,
-1.304865, 1.172017, -1.684543, 1, 0.4666667, 0, 1,
-1.301481, -0.3372214, -1.488523, 1, 0.4745098, 0, 1,
-1.300866, -0.460151, -0.9694712, 1, 0.4784314, 0, 1,
-1.299686, 2.674321, -0.5131484, 1, 0.4862745, 0, 1,
-1.297084, -1.357281, -2.90848, 1, 0.4901961, 0, 1,
-1.293758, 1.638462, -0.6991114, 1, 0.4980392, 0, 1,
-1.292059, 0.6009215, -1.547285, 1, 0.5058824, 0, 1,
-1.27746, 0.7906681, -0.5103244, 1, 0.509804, 0, 1,
-1.27684, 0.385723, 0.5282699, 1, 0.5176471, 0, 1,
-1.274843, 0.7270524, -1.112347, 1, 0.5215687, 0, 1,
-1.265602, -1.787313, -2.332042, 1, 0.5294118, 0, 1,
-1.264648, -0.3803104, -2.493646, 1, 0.5333334, 0, 1,
-1.26188, -0.4915955, -1.661302, 1, 0.5411765, 0, 1,
-1.23903, -0.8970276, -1.873851, 1, 0.5450981, 0, 1,
-1.235361, 0.1575426, -1.484355, 1, 0.5529412, 0, 1,
-1.22473, 0.726967, 0.03067113, 1, 0.5568628, 0, 1,
-1.223463, -1.248237, -3.345626, 1, 0.5647059, 0, 1,
-1.211042, 0.122271, -0.1814624, 1, 0.5686275, 0, 1,
-1.210881, 0.7681597, -1.047587, 1, 0.5764706, 0, 1,
-1.20858, 0.1772102, -2.198627, 1, 0.5803922, 0, 1,
-1.207723, 0.03025584, -2.725095, 1, 0.5882353, 0, 1,
-1.206633, -0.9015521, -1.55506, 1, 0.5921569, 0, 1,
-1.200761, 0.01898438, -2.930129, 1, 0.6, 0, 1,
-1.198879, -0.6370244, -0.3093974, 1, 0.6078432, 0, 1,
-1.195081, 0.468891, 0.08604533, 1, 0.6117647, 0, 1,
-1.186119, 0.2024048, -1.740349, 1, 0.6196079, 0, 1,
-1.173139, -0.7532924, -3.086442, 1, 0.6235294, 0, 1,
-1.158193, 0.3806919, -2.579491, 1, 0.6313726, 0, 1,
-1.147247, -0.5133883, -2.043633, 1, 0.6352941, 0, 1,
-1.13775, -0.6141714, -1.249831, 1, 0.6431373, 0, 1,
-1.130201, -0.08219447, -0.171672, 1, 0.6470588, 0, 1,
-1.124538, 0.4335112, -0.9968522, 1, 0.654902, 0, 1,
-1.123538, 1.039956, -0.7283053, 1, 0.6588235, 0, 1,
-1.123333, 0.6259033, 0.5221308, 1, 0.6666667, 0, 1,
-1.12319, 0.6842762, -0.2824287, 1, 0.6705883, 0, 1,
-1.116102, 0.5060331, -0.564651, 1, 0.6784314, 0, 1,
-1.114974, 0.8258602, -0.01061504, 1, 0.682353, 0, 1,
-1.114461, -1.599489, -2.657708, 1, 0.6901961, 0, 1,
-1.10487, 0.6620409, -1.209469, 1, 0.6941177, 0, 1,
-1.102673, -0.9540554, -2.623329, 1, 0.7019608, 0, 1,
-1.096726, -0.1771762, -0.1583545, 1, 0.7098039, 0, 1,
-1.095977, -0.2712496, -1.613234, 1, 0.7137255, 0, 1,
-1.092652, -1.885197, -2.925039, 1, 0.7215686, 0, 1,
-1.092049, -0.3908266, -1.8848, 1, 0.7254902, 0, 1,
-1.057096, 1.571702, -1.552842, 1, 0.7333333, 0, 1,
-1.054953, -0.260159, -1.59864, 1, 0.7372549, 0, 1,
-1.054165, 2.06918, -0.4942802, 1, 0.7450981, 0, 1,
-1.053463, 0.2924016, -1.552246, 1, 0.7490196, 0, 1,
-1.047537, 0.293966, 0.01189943, 1, 0.7568628, 0, 1,
-1.037942, -0.3137092, -0.8539035, 1, 0.7607843, 0, 1,
-1.036856, -1.648877, -3.436604, 1, 0.7686275, 0, 1,
-1.034204, 2.43919, -0.6007119, 1, 0.772549, 0, 1,
-1.028156, -2.472268, -3.381291, 1, 0.7803922, 0, 1,
-1.025282, 1.371609, -1.268665, 1, 0.7843137, 0, 1,
-1.024389, 0.1838026, -2.635461, 1, 0.7921569, 0, 1,
-1.023258, 1.412975, -0.825232, 1, 0.7960784, 0, 1,
-1.022502, 0.1235963, -1.414593, 1, 0.8039216, 0, 1,
-1.017458, -0.2488077, -2.030747, 1, 0.8117647, 0, 1,
-1.017073, -0.2744175, -2.272524, 1, 0.8156863, 0, 1,
-1.014616, 1.074223, -1.975301, 1, 0.8235294, 0, 1,
-1.009068, -0.2512504, -0.4559795, 1, 0.827451, 0, 1,
-0.9871799, 0.0731005, -2.991635, 1, 0.8352941, 0, 1,
-0.9841686, -0.7803379, -2.603223, 1, 0.8392157, 0, 1,
-0.9839892, -0.03534167, -0.6476359, 1, 0.8470588, 0, 1,
-0.9821759, -0.1297529, -1.192788, 1, 0.8509804, 0, 1,
-0.9805906, 0.09261, -3.302903, 1, 0.8588235, 0, 1,
-0.9797573, -1.109496, -3.759886, 1, 0.8627451, 0, 1,
-0.9738126, 0.6470014, -1.387854, 1, 0.8705882, 0, 1,
-0.9725435, -1.090122, -2.282862, 1, 0.8745098, 0, 1,
-0.9684205, -0.3450641, -1.662654, 1, 0.8823529, 0, 1,
-0.9651632, 1.296568, 0.1737127, 1, 0.8862745, 0, 1,
-0.9624569, 0.4329063, -2.36119, 1, 0.8941177, 0, 1,
-0.9619047, -0.3540572, -1.468774, 1, 0.8980392, 0, 1,
-0.9607555, -2.066999, -3.450733, 1, 0.9058824, 0, 1,
-0.9592223, 1.125391, -0.765057, 1, 0.9137255, 0, 1,
-0.9550695, -0.2878603, -1.508753, 1, 0.9176471, 0, 1,
-0.9530756, -0.5630242, -1.580265, 1, 0.9254902, 0, 1,
-0.9476501, 0.2898491, -0.1636925, 1, 0.9294118, 0, 1,
-0.9402607, 1.3534, -0.6494195, 1, 0.9372549, 0, 1,
-0.9400352, 0.0008904604, -3.070022, 1, 0.9411765, 0, 1,
-0.9318986, -1.451196, -2.992838, 1, 0.9490196, 0, 1,
-0.931259, 0.2993315, -1.090902, 1, 0.9529412, 0, 1,
-0.9264999, 1.389786, -0.4534645, 1, 0.9607843, 0, 1,
-0.9237517, 0.845104, -0.3551616, 1, 0.9647059, 0, 1,
-0.9173384, -0.9156479, -1.250904, 1, 0.972549, 0, 1,
-0.9127902, -1.406095, -3.118644, 1, 0.9764706, 0, 1,
-0.9126981, -0.5319906, -1.75217, 1, 0.9843137, 0, 1,
-0.9086547, 0.1751837, -1.13294, 1, 0.9882353, 0, 1,
-0.9073336, 0.1650158, -1.880044, 1, 0.9960784, 0, 1,
-0.9071043, 0.05301313, -2.444743, 0.9960784, 1, 0, 1,
-0.9002388, 0.273219, -1.464044, 0.9921569, 1, 0, 1,
-0.8965068, 0.1195441, 0.08066265, 0.9843137, 1, 0, 1,
-0.892682, -0.03900888, -2.21628, 0.9803922, 1, 0, 1,
-0.892462, -0.6979122, -0.9669487, 0.972549, 1, 0, 1,
-0.8918132, 0.5671576, 0.2819002, 0.9686275, 1, 0, 1,
-0.8904063, -1.118125, -3.936244, 0.9607843, 1, 0, 1,
-0.8883957, 1.262128, 0.5219722, 0.9568627, 1, 0, 1,
-0.8754455, -0.05073997, -1.338025, 0.9490196, 1, 0, 1,
-0.8737567, -0.8055381, -3.418039, 0.945098, 1, 0, 1,
-0.868508, -0.2976684, -0.2888427, 0.9372549, 1, 0, 1,
-0.8677058, 0.3227519, -1.394568, 0.9333333, 1, 0, 1,
-0.8642011, -1.790603, -1.935243, 0.9254902, 1, 0, 1,
-0.8553804, -0.2275527, -1.70281, 0.9215686, 1, 0, 1,
-0.8538992, 0.5560065, -1.9087, 0.9137255, 1, 0, 1,
-0.8490025, 0.5021252, -0.3374578, 0.9098039, 1, 0, 1,
-0.8470625, -1.085416, -4.838441, 0.9019608, 1, 0, 1,
-0.8463898, -0.5819906, -1.889176, 0.8941177, 1, 0, 1,
-0.8413814, 0.08187896, -1.048107, 0.8901961, 1, 0, 1,
-0.8394917, 0.4379647, -0.2164193, 0.8823529, 1, 0, 1,
-0.8349589, 0.17031, -3.186752, 0.8784314, 1, 0, 1,
-0.8329898, 0.6013852, -1.855196, 0.8705882, 1, 0, 1,
-0.8309643, -0.9781929, -2.478177, 0.8666667, 1, 0, 1,
-0.8295446, 1.00355, 0.4128287, 0.8588235, 1, 0, 1,
-0.8275133, 1.506702, -0.3209782, 0.854902, 1, 0, 1,
-0.8213375, 0.1048565, -0.3908884, 0.8470588, 1, 0, 1,
-0.8159686, -1.218809, -1.36183, 0.8431373, 1, 0, 1,
-0.8149501, 2.20266, -0.04693113, 0.8352941, 1, 0, 1,
-0.8116297, -0.04735847, 0.4783837, 0.8313726, 1, 0, 1,
-0.8080753, -0.5911106, -1.834268, 0.8235294, 1, 0, 1,
-0.805393, -0.3801619, -1.571381, 0.8196079, 1, 0, 1,
-0.7991641, -0.7803029, -2.149716, 0.8117647, 1, 0, 1,
-0.7980389, -0.2064341, -3.932492, 0.8078431, 1, 0, 1,
-0.7974312, 0.4793362, -0.5490407, 0.8, 1, 0, 1,
-0.7967808, 0.8131794, 0.6035191, 0.7921569, 1, 0, 1,
-0.7939071, 0.492203, -0.2724017, 0.7882353, 1, 0, 1,
-0.7929953, 1.570992, -1.344762, 0.7803922, 1, 0, 1,
-0.7866928, 0.2189813, -1.038213, 0.7764706, 1, 0, 1,
-0.7836835, 0.7081525, -1.426871, 0.7686275, 1, 0, 1,
-0.7796324, -0.384796, -1.444229, 0.7647059, 1, 0, 1,
-0.7740331, 0.6912471, -0.5838976, 0.7568628, 1, 0, 1,
-0.7728111, 1.489, -1.111441, 0.7529412, 1, 0, 1,
-0.7655978, -1.056524, -1.597178, 0.7450981, 1, 0, 1,
-0.7609197, -0.1799071, -1.86185, 0.7411765, 1, 0, 1,
-0.7595589, -0.6019893, -1.120349, 0.7333333, 1, 0, 1,
-0.7554833, -0.8587372, -1.426401, 0.7294118, 1, 0, 1,
-0.7521559, 0.4332311, -0.6053585, 0.7215686, 1, 0, 1,
-0.7477471, 0.9638993, -0.7180742, 0.7176471, 1, 0, 1,
-0.7360254, -1.041748, -2.117485, 0.7098039, 1, 0, 1,
-0.7300074, -1.044008, -3.55879, 0.7058824, 1, 0, 1,
-0.7297167, -0.1561318, -2.656903, 0.6980392, 1, 0, 1,
-0.7263355, -1.436924, -2.298897, 0.6901961, 1, 0, 1,
-0.718945, -0.7821496, -4.460492, 0.6862745, 1, 0, 1,
-0.7175205, -2.300266, -1.932135, 0.6784314, 1, 0, 1,
-0.7116603, -0.4214387, -2.112475, 0.6745098, 1, 0, 1,
-0.7089221, 0.4733436, -1.81214, 0.6666667, 1, 0, 1,
-0.7076877, -0.02905335, -1.898373, 0.6627451, 1, 0, 1,
-0.7064676, -0.470318, -2.098856, 0.654902, 1, 0, 1,
-0.7019492, 0.1928911, -1.626441, 0.6509804, 1, 0, 1,
-0.6977299, -1.180786, -2.274832, 0.6431373, 1, 0, 1,
-0.688682, -1.219378, -2.412165, 0.6392157, 1, 0, 1,
-0.6871974, 0.04035844, -2.111584, 0.6313726, 1, 0, 1,
-0.6840011, 0.09918452, -2.796154, 0.627451, 1, 0, 1,
-0.68211, 0.7298723, -0.8737138, 0.6196079, 1, 0, 1,
-0.6777588, 0.7577066, -0.5484224, 0.6156863, 1, 0, 1,
-0.677652, 0.9170042, 0.960681, 0.6078432, 1, 0, 1,
-0.6751143, -0.5160909, -3.501407, 0.6039216, 1, 0, 1,
-0.6741547, -0.1970669, -2.912846, 0.5960785, 1, 0, 1,
-0.670866, 0.7005756, -0.2245025, 0.5882353, 1, 0, 1,
-0.6697093, 0.8946084, -0.6914891, 0.5843138, 1, 0, 1,
-0.6622149, -0.2939404, -2.668509, 0.5764706, 1, 0, 1,
-0.6620479, 0.1680276, 0.1858049, 0.572549, 1, 0, 1,
-0.66132, -1.00957, -2.589198, 0.5647059, 1, 0, 1,
-0.6608577, 1.525081, -0.002564484, 0.5607843, 1, 0, 1,
-0.6590238, -1.040241, -2.038664, 0.5529412, 1, 0, 1,
-0.6578668, 0.3711563, -0.8048353, 0.5490196, 1, 0, 1,
-0.654394, -1.712576, -3.129758, 0.5411765, 1, 0, 1,
-0.6538351, -1.904479, -2.80773, 0.5372549, 1, 0, 1,
-0.653716, 1.452515, -1.637883, 0.5294118, 1, 0, 1,
-0.6510179, -2.181379, -3.841136, 0.5254902, 1, 0, 1,
-0.6420547, 0.6103307, 0.01212304, 0.5176471, 1, 0, 1,
-0.6380996, 1.055593, -2.064418, 0.5137255, 1, 0, 1,
-0.6380402, -2.361578, -2.535204, 0.5058824, 1, 0, 1,
-0.6376927, 0.03595104, -1.914003, 0.5019608, 1, 0, 1,
-0.6361988, -0.3527062, -2.468795, 0.4941176, 1, 0, 1,
-0.634764, 1.072953, -1.637221, 0.4862745, 1, 0, 1,
-0.6286481, -0.2398258, -2.401465, 0.4823529, 1, 0, 1,
-0.6269296, 0.3969412, -1.623857, 0.4745098, 1, 0, 1,
-0.6219552, 0.5294845, -1.253177, 0.4705882, 1, 0, 1,
-0.614452, 0.2445139, -2.025214, 0.4627451, 1, 0, 1,
-0.609842, -0.8149465, -1.180891, 0.4588235, 1, 0, 1,
-0.6066945, 1.106841, -0.3057185, 0.4509804, 1, 0, 1,
-0.6064776, -0.2253504, -3.52655, 0.4470588, 1, 0, 1,
-0.601599, 2.977203, -1.626498, 0.4392157, 1, 0, 1,
-0.5995942, -0.3399389, -1.67327, 0.4352941, 1, 0, 1,
-0.5988483, -0.3446853, -0.72828, 0.427451, 1, 0, 1,
-0.5979412, -0.2054837, -0.9482486, 0.4235294, 1, 0, 1,
-0.59366, 1.141538, -0.7076938, 0.4156863, 1, 0, 1,
-0.5817637, -0.7665999, -2.770344, 0.4117647, 1, 0, 1,
-0.5744991, 1.394914, -2.404633, 0.4039216, 1, 0, 1,
-0.5743955, -0.6234415, -1.529105, 0.3960784, 1, 0, 1,
-0.5742015, -0.6936964, -1.998714, 0.3921569, 1, 0, 1,
-0.5736778, 0.6797853, 0.1594717, 0.3843137, 1, 0, 1,
-0.5699149, -1.005054, -2.578046, 0.3803922, 1, 0, 1,
-0.5617608, -1.423029, -2.814853, 0.372549, 1, 0, 1,
-0.5616618, 1.534179, 0.2019136, 0.3686275, 1, 0, 1,
-0.553984, 0.4235907, 0.8336349, 0.3607843, 1, 0, 1,
-0.5496491, -0.6285777, -2.556625, 0.3568628, 1, 0, 1,
-0.5463071, -0.009454873, -3.178909, 0.3490196, 1, 0, 1,
-0.5427626, 0.1906929, -1.945785, 0.345098, 1, 0, 1,
-0.5413229, -0.767212, -1.68118, 0.3372549, 1, 0, 1,
-0.5409988, -0.02717395, -1.02814, 0.3333333, 1, 0, 1,
-0.5314362, -0.5696716, -0.2207733, 0.3254902, 1, 0, 1,
-0.5305421, 0.3306789, -1.527878, 0.3215686, 1, 0, 1,
-0.5286404, -1.341697, -2.202034, 0.3137255, 1, 0, 1,
-0.5206735, 0.5524696, -1.023962, 0.3098039, 1, 0, 1,
-0.5128375, -0.4301959, -2.659934, 0.3019608, 1, 0, 1,
-0.5090359, -0.4805461, -2.14306, 0.2941177, 1, 0, 1,
-0.5014106, 0.01332457, -0.4326413, 0.2901961, 1, 0, 1,
-0.4997838, -0.6471103, -3.664561, 0.282353, 1, 0, 1,
-0.4966508, -0.8010024, -1.996293, 0.2784314, 1, 0, 1,
-0.495031, -0.4553395, -2.200651, 0.2705882, 1, 0, 1,
-0.4928783, -0.1526396, -1.34922, 0.2666667, 1, 0, 1,
-0.4897711, 0.2103687, -1.616911, 0.2588235, 1, 0, 1,
-0.4863998, 0.3628823, -0.4212218, 0.254902, 1, 0, 1,
-0.4854098, 0.6704476, -1.332246, 0.2470588, 1, 0, 1,
-0.4842617, -0.6546659, -1.769983, 0.2431373, 1, 0, 1,
-0.4785528, -0.5530157, -0.6834527, 0.2352941, 1, 0, 1,
-0.4785449, -0.07189871, -1.285667, 0.2313726, 1, 0, 1,
-0.4767345, -1.785478, -4.811294, 0.2235294, 1, 0, 1,
-0.4754822, -0.6466594, -4.175952, 0.2196078, 1, 0, 1,
-0.4721993, 0.02848333, -0.9640787, 0.2117647, 1, 0, 1,
-0.4623333, -0.01954039, -2.008976, 0.2078431, 1, 0, 1,
-0.4592687, -0.4341291, -1.450704, 0.2, 1, 0, 1,
-0.4588876, 0.1526035, -2.147865, 0.1921569, 1, 0, 1,
-0.456609, 0.03367789, -1.774212, 0.1882353, 1, 0, 1,
-0.4526031, -1.596913, -2.316493, 0.1803922, 1, 0, 1,
-0.4525495, -0.003016755, -1.276727, 0.1764706, 1, 0, 1,
-0.4506795, -1.269657, -2.916989, 0.1686275, 1, 0, 1,
-0.450278, -0.2139385, -1.977334, 0.1647059, 1, 0, 1,
-0.4474499, -0.809633, -2.792525, 0.1568628, 1, 0, 1,
-0.4465187, 0.7062947, 0.700952, 0.1529412, 1, 0, 1,
-0.4418713, 1.425952, -0.3245564, 0.145098, 1, 0, 1,
-0.4410275, 0.6752297, 0.2718239, 0.1411765, 1, 0, 1,
-0.4389822, -1.87594, -3.11668, 0.1333333, 1, 0, 1,
-0.4368402, -0.2289155, -3.704484, 0.1294118, 1, 0, 1,
-0.4318278, -0.6933557, -1.533948, 0.1215686, 1, 0, 1,
-0.431509, -0.1228224, -1.021418, 0.1176471, 1, 0, 1,
-0.4312596, -0.9819878, -2.077742, 0.1098039, 1, 0, 1,
-0.4295683, 0.2132012, 0.6715289, 0.1058824, 1, 0, 1,
-0.4282172, -0.1982046, -3.340975, 0.09803922, 1, 0, 1,
-0.4278777, -0.2094574, 0.2785088, 0.09019608, 1, 0, 1,
-0.4269219, -0.05056762, -2.627487, 0.08627451, 1, 0, 1,
-0.4252099, 1.326293, -0.1323286, 0.07843138, 1, 0, 1,
-0.4164529, 0.4450106, -0.7767822, 0.07450981, 1, 0, 1,
-0.4159512, -0.7237117, -3.708426, 0.06666667, 1, 0, 1,
-0.4154185, 1.766885, -0.8855567, 0.0627451, 1, 0, 1,
-0.412046, 0.6856017, -1.907256, 0.05490196, 1, 0, 1,
-0.4118752, 1.466907, -1.971576, 0.05098039, 1, 0, 1,
-0.4113066, 1.139253, 1.351592, 0.04313726, 1, 0, 1,
-0.4042865, 0.8376208, 0.07405199, 0.03921569, 1, 0, 1,
-0.4009629, -0.7138733, -2.917579, 0.03137255, 1, 0, 1,
-0.4007487, -0.1233028, -3.675323, 0.02745098, 1, 0, 1,
-0.3981015, -0.3692674, -3.500458, 0.01960784, 1, 0, 1,
-0.3979791, 0.6915026, -1.183857, 0.01568628, 1, 0, 1,
-0.3964211, -1.241391, -3.588596, 0.007843138, 1, 0, 1,
-0.3952985, -0.1251795, -0.7421954, 0.003921569, 1, 0, 1,
-0.3899743, 0.8532341, -0.5652169, 0, 1, 0.003921569, 1,
-0.3852575, 1.678489, -0.1292019, 0, 1, 0.01176471, 1,
-0.3827318, 0.940124, 0.03340692, 0, 1, 0.01568628, 1,
-0.381829, 0.7722352, -1.242486, 0, 1, 0.02352941, 1,
-0.3768392, -0.3843668, -2.398638, 0, 1, 0.02745098, 1,
-0.3749693, 1.50013, 1.032754, 0, 1, 0.03529412, 1,
-0.3737305, 0.4135838, -0.2171428, 0, 1, 0.03921569, 1,
-0.3721034, -0.1152872, -1.057834, 0, 1, 0.04705882, 1,
-0.3699194, 2.373041, 1.400571, 0, 1, 0.05098039, 1,
-0.3690307, 0.05088098, -1.250203, 0, 1, 0.05882353, 1,
-0.3641791, 0.1148007, -1.251285, 0, 1, 0.0627451, 1,
-0.3598579, -0.02653683, -2.545493, 0, 1, 0.07058824, 1,
-0.3578452, 0.5347631, 0.1366917, 0, 1, 0.07450981, 1,
-0.3545795, -1.176519, -2.062126, 0, 1, 0.08235294, 1,
-0.3513235, 2.39404, 1.426995, 0, 1, 0.08627451, 1,
-0.3509395, -0.09476463, -2.313625, 0, 1, 0.09411765, 1,
-0.3506525, 0.46944, 2.032821, 0, 1, 0.1019608, 1,
-0.3500198, 0.80205, -1.07953, 0, 1, 0.1058824, 1,
-0.347982, 1.478917, 0.1983506, 0, 1, 0.1137255, 1,
-0.3429512, -0.3632216, -2.426317, 0, 1, 0.1176471, 1,
-0.3405201, 1.473032, -0.7949719, 0, 1, 0.1254902, 1,
-0.3387076, -1.368677, -0.5746301, 0, 1, 0.1294118, 1,
-0.3369231, 0.8657538, -0.55741, 0, 1, 0.1372549, 1,
-0.3369175, 0.405674, -0.8790182, 0, 1, 0.1411765, 1,
-0.3361705, -0.4883018, -0.7555942, 0, 1, 0.1490196, 1,
-0.3337088, -0.818119, -2.618164, 0, 1, 0.1529412, 1,
-0.3298783, -0.6488838, -3.785524, 0, 1, 0.1607843, 1,
-0.3246867, 0.9752163, -0.2440793, 0, 1, 0.1647059, 1,
-0.3152463, 0.5287793, -2.106286, 0, 1, 0.172549, 1,
-0.3126926, 1.639805, 0.329485, 0, 1, 0.1764706, 1,
-0.3100879, 0.6850439, -0.6444319, 0, 1, 0.1843137, 1,
-0.3071374, 0.3221989, -0.6166344, 0, 1, 0.1882353, 1,
-0.3061988, -0.1094312, -1.524211, 0, 1, 0.1960784, 1,
-0.3038832, -0.5374977, -4.612809, 0, 1, 0.2039216, 1,
-0.3036389, 0.5650715, 0.01440648, 0, 1, 0.2078431, 1,
-0.3025078, -0.3822845, -1.96196, 0, 1, 0.2156863, 1,
-0.2994924, 0.789926, -0.3046082, 0, 1, 0.2196078, 1,
-0.2976085, -1.310639, -3.464598, 0, 1, 0.227451, 1,
-0.2975767, 0.2108061, -0.415664, 0, 1, 0.2313726, 1,
-0.2952922, 1.061958, 0.5166262, 0, 1, 0.2392157, 1,
-0.2948641, 0.5680799, 0.4707269, 0, 1, 0.2431373, 1,
-0.2947676, -0.6425797, -2.945677, 0, 1, 0.2509804, 1,
-0.2944939, -0.2238595, -1.469918, 0, 1, 0.254902, 1,
-0.2928281, -0.508374, -3.782836, 0, 1, 0.2627451, 1,
-0.2920213, 0.16032, -1.024312, 0, 1, 0.2666667, 1,
-0.2902767, -0.6140733, -2.306143, 0, 1, 0.2745098, 1,
-0.2888456, 0.04520384, -3.262304, 0, 1, 0.2784314, 1,
-0.2877755, 0.8394019, -1.597109, 0, 1, 0.2862745, 1,
-0.2872981, -1.720102, -2.921583, 0, 1, 0.2901961, 1,
-0.2869301, -0.08633023, -2.286675, 0, 1, 0.2980392, 1,
-0.2826398, -0.517701, -3.837805, 0, 1, 0.3058824, 1,
-0.2778949, -0.8236357, -2.908821, 0, 1, 0.3098039, 1,
-0.2746256, -0.8251609, -2.569209, 0, 1, 0.3176471, 1,
-0.274029, -0.0004864405, 0.1674062, 0, 1, 0.3215686, 1,
-0.2734216, -1.023218, -5.145362, 0, 1, 0.3294118, 1,
-0.2701128, -0.07734371, -1.87971, 0, 1, 0.3333333, 1,
-0.2640982, -0.1774365, -2.085677, 0, 1, 0.3411765, 1,
-0.2620136, 0.5096979, -0.8490183, 0, 1, 0.345098, 1,
-0.2594172, -0.6433043, -2.786798, 0, 1, 0.3529412, 1,
-0.2581716, -1.105152, -2.287073, 0, 1, 0.3568628, 1,
-0.2573338, 0.00593796, -0.6835153, 0, 1, 0.3647059, 1,
-0.2559976, -1.098642, -2.133146, 0, 1, 0.3686275, 1,
-0.2558922, -1.165586, -3.726216, 0, 1, 0.3764706, 1,
-0.2553432, 1.13906, 0.7685763, 0, 1, 0.3803922, 1,
-0.2520317, 1.364823, 1.170417, 0, 1, 0.3882353, 1,
-0.2508991, -1.122876, -3.742831, 0, 1, 0.3921569, 1,
-0.2504835, -0.4150975, -2.6952, 0, 1, 0.4, 1,
-0.2497397, 0.6599181, 1.484659, 0, 1, 0.4078431, 1,
-0.2441088, -0.6067724, -3.899773, 0, 1, 0.4117647, 1,
-0.2430433, 1.55014, 0.2767711, 0, 1, 0.4196078, 1,
-0.240681, 0.3185294, -0.4998922, 0, 1, 0.4235294, 1,
-0.2400351, -0.364353, -2.057458, 0, 1, 0.4313726, 1,
-0.2392482, 0.6917788, -0.710795, 0, 1, 0.4352941, 1,
-0.2383727, -0.4363719, -2.662514, 0, 1, 0.4431373, 1,
-0.2382445, -1.341137, -1.483899, 0, 1, 0.4470588, 1,
-0.2158075, -0.9723428, -2.082176, 0, 1, 0.454902, 1,
-0.2146295, 0.247883, -0.538765, 0, 1, 0.4588235, 1,
-0.2109964, 1.029925, 2.258295, 0, 1, 0.4666667, 1,
-0.2060888, -0.8079033, -3.446144, 0, 1, 0.4705882, 1,
-0.204653, -0.6552232, -1.48768, 0, 1, 0.4784314, 1,
-0.2016303, -1.707964, -2.828229, 0, 1, 0.4823529, 1,
-0.2012412, -1.973767, -1.380562, 0, 1, 0.4901961, 1,
-0.1990235, 0.6991964, -1.917099, 0, 1, 0.4941176, 1,
-0.198604, -0.4980389, -1.711375, 0, 1, 0.5019608, 1,
-0.1951413, 0.4980256, 0.9995111, 0, 1, 0.509804, 1,
-0.1929374, 1.279788, -1.53997, 0, 1, 0.5137255, 1,
-0.1927117, 0.1878182, -1.415353, 0, 1, 0.5215687, 1,
-0.1911431, 0.2726308, -0.5497328, 0, 1, 0.5254902, 1,
-0.1868672, -1.351298, -2.178337, 0, 1, 0.5333334, 1,
-0.1801123, -1.021305, -3.519517, 0, 1, 0.5372549, 1,
-0.1773311, 1.244068, -2.841725, 0, 1, 0.5450981, 1,
-0.1751244, 0.7229392, 0.03956013, 0, 1, 0.5490196, 1,
-0.1724546, 1.146899, 0.7855147, 0, 1, 0.5568628, 1,
-0.1722709, 0.9450994, -0.9547163, 0, 1, 0.5607843, 1,
-0.169998, -0.4617119, -4.893866, 0, 1, 0.5686275, 1,
-0.1685987, 1.099175, -0.2366913, 0, 1, 0.572549, 1,
-0.1679112, 2.062946, 0.05887693, 0, 1, 0.5803922, 1,
-0.1638173, 0.2236678, -1.32532, 0, 1, 0.5843138, 1,
-0.1577542, 1.802404, 0.08419785, 0, 1, 0.5921569, 1,
-0.1567235, 0.3022494, -0.1603792, 0, 1, 0.5960785, 1,
-0.1564024, 0.8417191, 1.583884, 0, 1, 0.6039216, 1,
-0.1549276, 1.431334, 0.807398, 0, 1, 0.6117647, 1,
-0.1546231, -0.3509351, -2.646377, 0, 1, 0.6156863, 1,
-0.1543674, 0.1324758, 1.204528, 0, 1, 0.6235294, 1,
-0.152993, -0.411826, -3.343349, 0, 1, 0.627451, 1,
-0.1513844, -0.1215847, -3.231138, 0, 1, 0.6352941, 1,
-0.1502701, -0.07007276, -1.754324, 0, 1, 0.6392157, 1,
-0.1459856, 0.8549451, 0.8137068, 0, 1, 0.6470588, 1,
-0.1401675, 0.2294473, 0.7095981, 0, 1, 0.6509804, 1,
-0.1401284, 0.6253155, -0.2740458, 0, 1, 0.6588235, 1,
-0.1343319, 0.04933907, -2.868171, 0, 1, 0.6627451, 1,
-0.1289771, 0.6957754, 1.849096, 0, 1, 0.6705883, 1,
-0.1276195, -1.020616, -1.599115, 0, 1, 0.6745098, 1,
-0.1233501, -0.2154552, -2.794104, 0, 1, 0.682353, 1,
-0.119294, -2.099571, -3.189101, 0, 1, 0.6862745, 1,
-0.1176293, -0.6706992, -4.240564, 0, 1, 0.6941177, 1,
-0.1158915, -0.512719, -3.545246, 0, 1, 0.7019608, 1,
-0.1153258, -1.153431, -2.323317, 0, 1, 0.7058824, 1,
-0.1131078, -0.6705918, -2.484595, 0, 1, 0.7137255, 1,
-0.1117247, -1.216021, -1.830332, 0, 1, 0.7176471, 1,
-0.1111313, 2.024375, 0.674624, 0, 1, 0.7254902, 1,
-0.1098211, -0.4468034, -4.639948, 0, 1, 0.7294118, 1,
-0.1094787, 0.1873796, -0.02288308, 0, 1, 0.7372549, 1,
-0.1030989, 1.207766, 0.3391986, 0, 1, 0.7411765, 1,
-0.1028936, 0.9322283, -0.04118489, 0, 1, 0.7490196, 1,
-0.1006915, -1.450754, -1.903506, 0, 1, 0.7529412, 1,
-0.09930152, 0.5978228, -0.7946416, 0, 1, 0.7607843, 1,
-0.09889267, -0.7269818, -3.672084, 0, 1, 0.7647059, 1,
-0.09512842, -0.4322297, -2.7418, 0, 1, 0.772549, 1,
-0.09359388, -0.8939812, -3.676183, 0, 1, 0.7764706, 1,
-0.09277368, 1.135258, 0.6513749, 0, 1, 0.7843137, 1,
-0.08534633, -2.080536, -3.165674, 0, 1, 0.7882353, 1,
-0.08508919, -0.3326548, -3.558532, 0, 1, 0.7960784, 1,
-0.08328129, 0.6749889, -0.7574319, 0, 1, 0.8039216, 1,
-0.08052281, -1.264618, -2.469936, 0, 1, 0.8078431, 1,
-0.07793977, -1.822955, -2.247603, 0, 1, 0.8156863, 1,
-0.07562062, 0.7703247, 1.095161, 0, 1, 0.8196079, 1,
-0.07462725, 0.5751268, -0.1332492, 0, 1, 0.827451, 1,
-0.07057774, -1.268297, -3.009224, 0, 1, 0.8313726, 1,
-0.06883579, 2.316489, -1.258829, 0, 1, 0.8392157, 1,
-0.06747556, 1.359157, 1.115781, 0, 1, 0.8431373, 1,
-0.06198911, 0.791633, -1.607861, 0, 1, 0.8509804, 1,
-0.06080311, 0.8106255, 0.7647883, 0, 1, 0.854902, 1,
-0.05803565, -0.7359018, -2.980664, 0, 1, 0.8627451, 1,
-0.05457112, 0.8206626, -0.6631382, 0, 1, 0.8666667, 1,
-0.05365591, 1.177056, -0.1066573, 0, 1, 0.8745098, 1,
-0.04845958, -0.5797859, -4.379141, 0, 1, 0.8784314, 1,
-0.04802496, 0.03648477, -0.5629089, 0, 1, 0.8862745, 1,
-0.04690382, -1.848028, -3.098178, 0, 1, 0.8901961, 1,
-0.04252132, -0.8240838, -1.203766, 0, 1, 0.8980392, 1,
-0.04152645, -0.1802726, -2.605786, 0, 1, 0.9058824, 1,
-0.04132427, -0.2689384, -3.96938, 0, 1, 0.9098039, 1,
-0.03296574, 0.08424525, -0.7657006, 0, 1, 0.9176471, 1,
-0.03194237, -0.5462349, -5.099718, 0, 1, 0.9215686, 1,
-0.02893949, 0.221604, -1.875104, 0, 1, 0.9294118, 1,
-0.02807598, 0.6985997, -0.4155337, 0, 1, 0.9333333, 1,
-0.02774862, -0.580276, -3.735579, 0, 1, 0.9411765, 1,
-0.02721221, -2.504155, -3.549348, 0, 1, 0.945098, 1,
-0.0263592, -0.3747496, -3.178351, 0, 1, 0.9529412, 1,
-0.02380227, -0.7722894, -4.216827, 0, 1, 0.9568627, 1,
-0.01931285, 0.4769138, 1.379446, 0, 1, 0.9647059, 1,
-0.01331465, 0.2644366, -0.3493121, 0, 1, 0.9686275, 1,
-0.009720732, 0.04907594, -0.02821434, 0, 1, 0.9764706, 1,
-0.007407646, -1.387312, -3.697464, 0, 1, 0.9803922, 1,
-0.005824272, -1.780208, -3.07999, 0, 1, 0.9882353, 1,
-0.005184092, 0.2217673, -0.4017621, 0, 1, 0.9921569, 1,
-0.004795727, 0.1393615, -0.8723298, 0, 1, 1, 1,
-0.003758517, -0.202251, -1.243877, 0, 0.9921569, 1, 1,
-0.002482885, -1.332713, -1.247832, 0, 0.9882353, 1, 1,
0.002608226, 1.447849, 1.352619, 0, 0.9803922, 1, 1,
0.00379759, -1.497871, 3.55851, 0, 0.9764706, 1, 1,
0.003929402, 0.3800908, 0.5025956, 0, 0.9686275, 1, 1,
0.004572002, -0.1904114, 3.838757, 0, 0.9647059, 1, 1,
0.004995753, 2.084556, 0.8797266, 0, 0.9568627, 1, 1,
0.005035548, 0.1279141, -0.9728084, 0, 0.9529412, 1, 1,
0.005889601, 0.4557487, -1.203251, 0, 0.945098, 1, 1,
0.01406426, 0.467616, 1.881828, 0, 0.9411765, 1, 1,
0.02447072, -0.3059311, 2.913529, 0, 0.9333333, 1, 1,
0.02452824, -0.9185535, 3.736389, 0, 0.9294118, 1, 1,
0.02567234, 1.236148, -0.7985072, 0, 0.9215686, 1, 1,
0.03009013, 1.873676, 1.23805, 0, 0.9176471, 1, 1,
0.03295617, -0.4561396, 1.578387, 0, 0.9098039, 1, 1,
0.03373024, 1.791645, 1.798272, 0, 0.9058824, 1, 1,
0.03537686, -0.5488535, 0.7420928, 0, 0.8980392, 1, 1,
0.03592777, -1.454525, 2.47939, 0, 0.8901961, 1, 1,
0.03871473, 1.437703, 0.4204215, 0, 0.8862745, 1, 1,
0.04700673, 1.060592, 0.2489438, 0, 0.8784314, 1, 1,
0.05002672, -0.2964524, 1.772306, 0, 0.8745098, 1, 1,
0.0508183, 0.8188456, 1.086089, 0, 0.8666667, 1, 1,
0.05189929, 0.3094156, -0.6735554, 0, 0.8627451, 1, 1,
0.05225156, -0.5191111, 2.741455, 0, 0.854902, 1, 1,
0.05508744, -0.5878646, 3.273736, 0, 0.8509804, 1, 1,
0.05646913, -0.5346929, 2.244714, 0, 0.8431373, 1, 1,
0.05814571, -1.225425, 2.269463, 0, 0.8392157, 1, 1,
0.06102478, 0.8108528, -0.4996368, 0, 0.8313726, 1, 1,
0.0643654, 0.7604983, -0.1484933, 0, 0.827451, 1, 1,
0.06493501, 1.656329, -1.797224, 0, 0.8196079, 1, 1,
0.07355898, 1.970166, 0.5527589, 0, 0.8156863, 1, 1,
0.07957456, -0.1400761, 2.183198, 0, 0.8078431, 1, 1,
0.07992069, -1.380467, 4.180489, 0, 0.8039216, 1, 1,
0.08350101, -0.7646745, 2.892003, 0, 0.7960784, 1, 1,
0.08352051, 0.3325254, 0.4439611, 0, 0.7882353, 1, 1,
0.08476863, 0.06502488, 0.1159601, 0, 0.7843137, 1, 1,
0.08603779, -1.006317, 3.145822, 0, 0.7764706, 1, 1,
0.08738436, 0.04594315, 1.364893, 0, 0.772549, 1, 1,
0.08855214, -0.6746073, 1.553962, 0, 0.7647059, 1, 1,
0.0917495, 0.9167964, 0.6881154, 0, 0.7607843, 1, 1,
0.09243725, 1.069481, -1.946148, 0, 0.7529412, 1, 1,
0.09345, -2.039546, 3.230589, 0, 0.7490196, 1, 1,
0.1056139, -0.1880734, 1.404915, 0, 0.7411765, 1, 1,
0.1080883, 1.557559, -1.31182, 0, 0.7372549, 1, 1,
0.1092428, 0.4903029, -0.2726106, 0, 0.7294118, 1, 1,
0.1176274, -1.11948, 3.930017, 0, 0.7254902, 1, 1,
0.1178754, 0.8931866, -0.7968658, 0, 0.7176471, 1, 1,
0.1182639, -1.077291, 2.351775, 0, 0.7137255, 1, 1,
0.121069, -0.8729571, 3.597687, 0, 0.7058824, 1, 1,
0.1210799, 0.1558402, 1.077563, 0, 0.6980392, 1, 1,
0.1223905, 0.8004568, -0.367555, 0, 0.6941177, 1, 1,
0.1226101, 0.4395181, 1.118294, 0, 0.6862745, 1, 1,
0.1309289, 0.8544564, 0.3242817, 0, 0.682353, 1, 1,
0.1334475, -0.7947441, 3.755252, 0, 0.6745098, 1, 1,
0.1344502, 0.4358324, 0.9663059, 0, 0.6705883, 1, 1,
0.1362354, -0.6788532, 3.40244, 0, 0.6627451, 1, 1,
0.1405024, -2.609802, 3.42158, 0, 0.6588235, 1, 1,
0.1451808, -0.6645809, 0.4614713, 0, 0.6509804, 1, 1,
0.1546493, 0.2289168, 0.03534966, 0, 0.6470588, 1, 1,
0.1567838, 0.8180349, -1.019004, 0, 0.6392157, 1, 1,
0.1577206, 0.04273485, 1.911824, 0, 0.6352941, 1, 1,
0.1577245, -0.3733412, 4.759573, 0, 0.627451, 1, 1,
0.1620591, -0.564887, 4.009186, 0, 0.6235294, 1, 1,
0.1627856, -0.8707194, 2.88418, 0, 0.6156863, 1, 1,
0.1658747, -0.1941121, 1.611102, 0, 0.6117647, 1, 1,
0.166231, -0.4198157, 3.263098, 0, 0.6039216, 1, 1,
0.1727706, -0.5556118, 2.80181, 0, 0.5960785, 1, 1,
0.177829, -0.05663455, 1.646679, 0, 0.5921569, 1, 1,
0.1809583, 0.7917029, -0.1443906, 0, 0.5843138, 1, 1,
0.1828836, -0.2491002, 1.752702, 0, 0.5803922, 1, 1,
0.1861731, 0.3046504, 1.30935, 0, 0.572549, 1, 1,
0.1881626, 0.331075, 2.208897, 0, 0.5686275, 1, 1,
0.1906222, -0.1861748, 3.6183, 0, 0.5607843, 1, 1,
0.1908288, 0.2689474, -0.2838639, 0, 0.5568628, 1, 1,
0.1959265, -0.7750979, 2.480252, 0, 0.5490196, 1, 1,
0.1971946, 1.393968, 1.251404, 0, 0.5450981, 1, 1,
0.2010897, 1.735854, -1.81996, 0, 0.5372549, 1, 1,
0.2144621, 0.923952, -0.7628674, 0, 0.5333334, 1, 1,
0.2170422, 0.03076253, 0.93572, 0, 0.5254902, 1, 1,
0.2185993, 0.4617126, -1.308341, 0, 0.5215687, 1, 1,
0.2190672, 0.05386578, 1.690464, 0, 0.5137255, 1, 1,
0.2214645, 0.6765485, 1.193213, 0, 0.509804, 1, 1,
0.2239653, 1.18737, -0.4546595, 0, 0.5019608, 1, 1,
0.2271104, 1.541886, -0.6693547, 0, 0.4941176, 1, 1,
0.2317456, -1.602039, 1.800778, 0, 0.4901961, 1, 1,
0.233457, 1.725635, -1.977975, 0, 0.4823529, 1, 1,
0.2350567, 2.534524, 0.2763255, 0, 0.4784314, 1, 1,
0.2366699, -0.8320482, 4.493095, 0, 0.4705882, 1, 1,
0.2379742, 1.128063, 0.8361471, 0, 0.4666667, 1, 1,
0.2389673, -1.244943, 2.962153, 0, 0.4588235, 1, 1,
0.2391143, -0.7779424, 0.9414745, 0, 0.454902, 1, 1,
0.2392, 1.063189, -0.2112888, 0, 0.4470588, 1, 1,
0.2423881, -0.02509257, 0.7573566, 0, 0.4431373, 1, 1,
0.2451769, 0.820752, 0.8310382, 0, 0.4352941, 1, 1,
0.246415, 0.2695424, 1.406111, 0, 0.4313726, 1, 1,
0.2509795, 0.2425829, -0.7389699, 0, 0.4235294, 1, 1,
0.2572424, -0.01601762, 1.78471, 0, 0.4196078, 1, 1,
0.2618257, -3.065262, 1.659865, 0, 0.4117647, 1, 1,
0.2634727, -1.994613, 3.344603, 0, 0.4078431, 1, 1,
0.2638227, -0.01299646, 0.3695414, 0, 0.4, 1, 1,
0.2644767, 0.1162428, -0.691074, 0, 0.3921569, 1, 1,
0.2661637, 1.090215, 1.296851, 0, 0.3882353, 1, 1,
0.2686142, 0.04420564, 2.643208, 0, 0.3803922, 1, 1,
0.2695793, 2.336228, 0.8299921, 0, 0.3764706, 1, 1,
0.2701494, -0.5188001, 1.721626, 0, 0.3686275, 1, 1,
0.272231, -0.2760175, 2.152889, 0, 0.3647059, 1, 1,
0.2732597, -0.609042, 1.314672, 0, 0.3568628, 1, 1,
0.2741217, 0.9914931, 0.5867823, 0, 0.3529412, 1, 1,
0.276032, -1.142406, 3.803296, 0, 0.345098, 1, 1,
0.2792211, 0.5709289, 0.5085959, 0, 0.3411765, 1, 1,
0.2808656, -0.3820173, 5.206182, 0, 0.3333333, 1, 1,
0.281739, 0.32706, 0.3589358, 0, 0.3294118, 1, 1,
0.2830008, -0.9714406, 3.513359, 0, 0.3215686, 1, 1,
0.2866335, 0.7730394, 0.4925406, 0, 0.3176471, 1, 1,
0.291371, 0.2323845, -0.005420787, 0, 0.3098039, 1, 1,
0.29469, 0.889172, -1.101841, 0, 0.3058824, 1, 1,
0.2974865, -0.6003501, 1.876791, 0, 0.2980392, 1, 1,
0.3033265, 3.112112, 0.2747652, 0, 0.2901961, 1, 1,
0.3098494, 1.278287, -0.1516406, 0, 0.2862745, 1, 1,
0.3114043, -0.4264493, 4.343707, 0, 0.2784314, 1, 1,
0.3156864, 1.190181, 0.02276175, 0, 0.2745098, 1, 1,
0.3256166, 0.3874739, 1.295218, 0, 0.2666667, 1, 1,
0.3357081, -0.3285014, 0.98662, 0, 0.2627451, 1, 1,
0.3362924, 1.138183, 0.06736125, 0, 0.254902, 1, 1,
0.339516, 0.3667701, 1.972929, 0, 0.2509804, 1, 1,
0.3496332, -0.6186885, 2.345082, 0, 0.2431373, 1, 1,
0.3501309, -0.771093, 3.206398, 0, 0.2392157, 1, 1,
0.3506252, 1.466095, -0.1474335, 0, 0.2313726, 1, 1,
0.3510341, -0.7853164, 4.774132, 0, 0.227451, 1, 1,
0.355439, 1.83544, 0.1929759, 0, 0.2196078, 1, 1,
0.3555881, -1.342537, 3.679729, 0, 0.2156863, 1, 1,
0.3570914, 2.120178, 1.569931, 0, 0.2078431, 1, 1,
0.3674983, -0.4140112, 3.158661, 0, 0.2039216, 1, 1,
0.3678649, 0.02853372, 0.5848229, 0, 0.1960784, 1, 1,
0.3701017, -1.951065, 2.819693, 0, 0.1882353, 1, 1,
0.3701974, -0.4767482, 3.359043, 0, 0.1843137, 1, 1,
0.3704734, -0.1471624, 2.308938, 0, 0.1764706, 1, 1,
0.3728082, -2.033661, 1.99785, 0, 0.172549, 1, 1,
0.3738362, 0.7879263, -0.8814657, 0, 0.1647059, 1, 1,
0.3747691, -2.140309, 2.347655, 0, 0.1607843, 1, 1,
0.3750024, 1.155281, 0.0877272, 0, 0.1529412, 1, 1,
0.3765132, 0.3690645, 2.680959, 0, 0.1490196, 1, 1,
0.3771877, 0.3999819, -0.09151258, 0, 0.1411765, 1, 1,
0.3792144, 1.002798, 0.6470746, 0, 0.1372549, 1, 1,
0.3800992, 1.961535, 1.153633, 0, 0.1294118, 1, 1,
0.3809159, -0.6308447, 4.338779, 0, 0.1254902, 1, 1,
0.3858788, 1.018555, -0.361394, 0, 0.1176471, 1, 1,
0.3864366, -2.60485, 4.810219, 0, 0.1137255, 1, 1,
0.3920154, 0.9237861, -0.09665561, 0, 0.1058824, 1, 1,
0.3926151, -1.182921, 3.029794, 0, 0.09803922, 1, 1,
0.3936349, -0.1844533, 1.265888, 0, 0.09411765, 1, 1,
0.3938681, -0.9550624, 3.255631, 0, 0.08627451, 1, 1,
0.4032752, 0.828329, 0.7580271, 0, 0.08235294, 1, 1,
0.405806, 0.2079739, -0.5272191, 0, 0.07450981, 1, 1,
0.407091, -0.6834818, 2.775477, 0, 0.07058824, 1, 1,
0.4109673, -0.4376806, 1.453391, 0, 0.0627451, 1, 1,
0.4135884, -1.739886, 3.681782, 0, 0.05882353, 1, 1,
0.416291, -0.3933954, 2.591271, 0, 0.05098039, 1, 1,
0.4188724, -0.07101061, 1.576788, 0, 0.04705882, 1, 1,
0.4223854, -0.2914663, 1.823702, 0, 0.03921569, 1, 1,
0.422615, 1.372965, -1.024871, 0, 0.03529412, 1, 1,
0.4259284, 0.2659197, 0.3282183, 0, 0.02745098, 1, 1,
0.4349138, 0.6529908, 0.2728458, 0, 0.02352941, 1, 1,
0.4361528, 1.515798, 2.526231, 0, 0.01568628, 1, 1,
0.4363098, 0.4975832, 0.4859284, 0, 0.01176471, 1, 1,
0.4389288, -1.284844, 0.6384708, 0, 0.003921569, 1, 1,
0.4390039, -1.292628, 3.307808, 0.003921569, 0, 1, 1,
0.4427424, 0.1579482, 2.003483, 0.007843138, 0, 1, 1,
0.4470972, 0.038847, 2.724031, 0.01568628, 0, 1, 1,
0.4509494, 1.800362, -0.08834278, 0.01960784, 0, 1, 1,
0.4518296, -0.4615562, 3.061256, 0.02745098, 0, 1, 1,
0.4533632, -0.1263589, 2.895408, 0.03137255, 0, 1, 1,
0.4580188, -0.3065858, 3.901042, 0.03921569, 0, 1, 1,
0.4580452, -1.03632, 1.93644, 0.04313726, 0, 1, 1,
0.4643299, 0.744702, -1.243756, 0.05098039, 0, 1, 1,
0.4643711, 0.09460077, 0.1961992, 0.05490196, 0, 1, 1,
0.4660097, 1.196026, -0.2356131, 0.0627451, 0, 1, 1,
0.4712879, 1.544208, 1.760138, 0.06666667, 0, 1, 1,
0.4745334, -1.051749, 3.122728, 0.07450981, 0, 1, 1,
0.4761505, -0.3792832, 2.842214, 0.07843138, 0, 1, 1,
0.4761812, 1.83481, -0.4845514, 0.08627451, 0, 1, 1,
0.4767923, 0.04995061, 1.602107, 0.09019608, 0, 1, 1,
0.4808369, 0.7727558, -0.238144, 0.09803922, 0, 1, 1,
0.4864943, 0.0233312, 2.761206, 0.1058824, 0, 1, 1,
0.4945327, 0.5799713, 0.4702748, 0.1098039, 0, 1, 1,
0.4951691, 1.285119, 0.3113824, 0.1176471, 0, 1, 1,
0.4954679, 0.5806726, 1.437306, 0.1215686, 0, 1, 1,
0.4972887, -0.8035707, 3.36118, 0.1294118, 0, 1, 1,
0.4998854, 0.2190427, 1.555462, 0.1333333, 0, 1, 1,
0.5019337, 0.8288459, -0.3416259, 0.1411765, 0, 1, 1,
0.5046831, -0.7404935, 3.424113, 0.145098, 0, 1, 1,
0.5087532, -0.4197321, 1.276071, 0.1529412, 0, 1, 1,
0.5089626, 1.165955, -2.153574, 0.1568628, 0, 1, 1,
0.5121433, 1.85318, 1.61915, 0.1647059, 0, 1, 1,
0.5138803, 0.03621076, 0.9836032, 0.1686275, 0, 1, 1,
0.5154766, -0.08004414, 1.722248, 0.1764706, 0, 1, 1,
0.5191493, 0.5777363, 1.428214, 0.1803922, 0, 1, 1,
0.5240621, -0.2548442, 2.265799, 0.1882353, 0, 1, 1,
0.5270792, -0.1702584, 1.909954, 0.1921569, 0, 1, 1,
0.5277734, 0.03486208, -0.9729157, 0.2, 0, 1, 1,
0.528545, 0.8082956, 1.113252, 0.2078431, 0, 1, 1,
0.5354618, 0.8656719, -0.4056058, 0.2117647, 0, 1, 1,
0.5405714, 0.7018397, 1.052692, 0.2196078, 0, 1, 1,
0.543887, -0.3941017, 3.52086, 0.2235294, 0, 1, 1,
0.5454363, -0.9306757, 4.282075, 0.2313726, 0, 1, 1,
0.5509121, 1.891837, 0.9075115, 0.2352941, 0, 1, 1,
0.5591567, 0.8851109, -1.861989, 0.2431373, 0, 1, 1,
0.5612382, -0.9755357, 2.434764, 0.2470588, 0, 1, 1,
0.5624962, -0.1521027, 0.7284929, 0.254902, 0, 1, 1,
0.572042, -1.138904, 0.9938954, 0.2588235, 0, 1, 1,
0.5770732, -0.01979785, 3.666412, 0.2666667, 0, 1, 1,
0.5817184, 0.08995144, 1.745521, 0.2705882, 0, 1, 1,
0.5868087, 0.6365452, 0.8409725, 0.2784314, 0, 1, 1,
0.5870444, -1.58577, 2.485241, 0.282353, 0, 1, 1,
0.5885696, 1.455636, -0.5751761, 0.2901961, 0, 1, 1,
0.5892467, -0.2157772, 1.124914, 0.2941177, 0, 1, 1,
0.5935063, -0.755865, 1.811338, 0.3019608, 0, 1, 1,
0.593823, 0.3664003, 1.988367, 0.3098039, 0, 1, 1,
0.5967258, 0.2212262, 2.495182, 0.3137255, 0, 1, 1,
0.5987865, -1.510083, 2.462889, 0.3215686, 0, 1, 1,
0.607261, -1.822605, 2.79384, 0.3254902, 0, 1, 1,
0.6075491, 1.52709, 0.4706548, 0.3333333, 0, 1, 1,
0.6078523, -1.889537, 3.369472, 0.3372549, 0, 1, 1,
0.6101893, -0.5525524, 2.879129, 0.345098, 0, 1, 1,
0.6122876, -3.41807, 3.721615, 0.3490196, 0, 1, 1,
0.6163846, 0.03754957, 0.8308833, 0.3568628, 0, 1, 1,
0.6175047, -1.033933, 2.295449, 0.3607843, 0, 1, 1,
0.6298056, -0.8517856, 1.431544, 0.3686275, 0, 1, 1,
0.6300905, 1.949971, 0.9670143, 0.372549, 0, 1, 1,
0.6334326, 0.1381403, 1.848521, 0.3803922, 0, 1, 1,
0.635285, 1.240239, 0.5418585, 0.3843137, 0, 1, 1,
0.6372671, 0.5811766, 0.7803739, 0.3921569, 0, 1, 1,
0.6424702, 0.3049227, 2.50033, 0.3960784, 0, 1, 1,
0.6447725, 0.6305889, 0.2040694, 0.4039216, 0, 1, 1,
0.6502901, 0.1818036, 1.351887, 0.4117647, 0, 1, 1,
0.6553781, -0.1230968, 2.743271, 0.4156863, 0, 1, 1,
0.66043, -0.305558, 2.201608, 0.4235294, 0, 1, 1,
0.660921, 0.013082, 0.6622282, 0.427451, 0, 1, 1,
0.6616894, -1.508743, 3.211692, 0.4352941, 0, 1, 1,
0.6628232, -0.2206939, 0.9052395, 0.4392157, 0, 1, 1,
0.6630992, -0.6191257, 0.9952865, 0.4470588, 0, 1, 1,
0.6636998, -1.793433, 3.450353, 0.4509804, 0, 1, 1,
0.6707264, 2.070604, -1.201395, 0.4588235, 0, 1, 1,
0.6709551, -0.341393, 2.564281, 0.4627451, 0, 1, 1,
0.6716995, 1.317645, 2.667377, 0.4705882, 0, 1, 1,
0.6762328, -0.1552303, 2.035674, 0.4745098, 0, 1, 1,
0.6827326, 1.331826, -2.296804, 0.4823529, 0, 1, 1,
0.6873263, -1.528892, 3.339931, 0.4862745, 0, 1, 1,
0.6874568, 0.333531, 0.009586317, 0.4941176, 0, 1, 1,
0.6879923, -0.7999588, 3.443491, 0.5019608, 0, 1, 1,
0.6903286, -0.2462071, 0.8644683, 0.5058824, 0, 1, 1,
0.6919387, 0.1431325, 3.010032, 0.5137255, 0, 1, 1,
0.6969137, 1.141315, 0.4351848, 0.5176471, 0, 1, 1,
0.6973635, -3.102704, 2.724128, 0.5254902, 0, 1, 1,
0.700919, -1.547282, 2.285737, 0.5294118, 0, 1, 1,
0.7077078, -0.7499486, 1.165387, 0.5372549, 0, 1, 1,
0.7155746, 0.09174498, 0.572568, 0.5411765, 0, 1, 1,
0.7207708, 1.483398, 1.959292, 0.5490196, 0, 1, 1,
0.7211576, 1.212492, 0.8074718, 0.5529412, 0, 1, 1,
0.7219697, 0.3341452, 2.110158, 0.5607843, 0, 1, 1,
0.7223902, -1.352825, 4.395159, 0.5647059, 0, 1, 1,
0.7243734, -1.489481, 3.694687, 0.572549, 0, 1, 1,
0.7287083, 0.5216475, 2.614106, 0.5764706, 0, 1, 1,
0.7293083, -0.5402883, 2.295745, 0.5843138, 0, 1, 1,
0.7317673, -1.642429, 3.516922, 0.5882353, 0, 1, 1,
0.7339857, 0.1411485, 0.8796819, 0.5960785, 0, 1, 1,
0.7375236, 0.7226274, -0.4984939, 0.6039216, 0, 1, 1,
0.7421576, -0.9266089, 2.129501, 0.6078432, 0, 1, 1,
0.7430222, 1.860172, -0.3070456, 0.6156863, 0, 1, 1,
0.74552, -0.1477464, 2.432967, 0.6196079, 0, 1, 1,
0.7460539, -0.002926788, 0.8465542, 0.627451, 0, 1, 1,
0.7493777, 0.4983474, 1.133411, 0.6313726, 0, 1, 1,
0.7516759, -0.8421658, 4.253646, 0.6392157, 0, 1, 1,
0.762392, -0.01506111, 2.360338, 0.6431373, 0, 1, 1,
0.7648754, 0.07733612, 0.7324522, 0.6509804, 0, 1, 1,
0.7660724, -0.9999928, 2.499031, 0.654902, 0, 1, 1,
0.7722291, -0.3169378, 3.211442, 0.6627451, 0, 1, 1,
0.7739727, 1.609753, -1.500989, 0.6666667, 0, 1, 1,
0.777399, -0.1375956, 2.392903, 0.6745098, 0, 1, 1,
0.7786512, -0.5765257, 1.239908, 0.6784314, 0, 1, 1,
0.7866853, -0.2696585, 2.293501, 0.6862745, 0, 1, 1,
0.788841, 1.052433, 0.990153, 0.6901961, 0, 1, 1,
0.791108, -1.736092, 3.596254, 0.6980392, 0, 1, 1,
0.7971937, 1.676022, -0.4048456, 0.7058824, 0, 1, 1,
0.8004161, -0.2613819, 3.096797, 0.7098039, 0, 1, 1,
0.8041802, 0.1700483, 1.065545, 0.7176471, 0, 1, 1,
0.8160065, 0.4812697, 0.1526098, 0.7215686, 0, 1, 1,
0.8230246, -0.6411902, 2.598912, 0.7294118, 0, 1, 1,
0.8248111, 1.588129, -0.7094591, 0.7333333, 0, 1, 1,
0.8267856, -1.53989, 1.823436, 0.7411765, 0, 1, 1,
0.8280581, -0.5335456, 1.991485, 0.7450981, 0, 1, 1,
0.8356366, -0.7132573, 2.126139, 0.7529412, 0, 1, 1,
0.8375116, 0.3552195, 0.3944871, 0.7568628, 0, 1, 1,
0.8378986, 0.01148961, 1.451378, 0.7647059, 0, 1, 1,
0.8380867, 1.221581, 0.5538292, 0.7686275, 0, 1, 1,
0.8395987, -0.3829447, 4.032403, 0.7764706, 0, 1, 1,
0.8439963, -0.3706313, 2.932077, 0.7803922, 0, 1, 1,
0.8446096, -1.067921, 1.648323, 0.7882353, 0, 1, 1,
0.845312, -1.424378, 1.551354, 0.7921569, 0, 1, 1,
0.8465635, 0.680259, 2.530207, 0.8, 0, 1, 1,
0.8478162, -3.883092, 2.290262, 0.8078431, 0, 1, 1,
0.8503489, -0.731496, 0.7784143, 0.8117647, 0, 1, 1,
0.8520761, 0.7479441, 1.09877, 0.8196079, 0, 1, 1,
0.8625057, 0.006903287, 1.162416, 0.8235294, 0, 1, 1,
0.8686964, 0.03577539, 1.720063, 0.8313726, 0, 1, 1,
0.8781123, 1.884978, -1.592178, 0.8352941, 0, 1, 1,
0.8795541, -0.7758945, 2.699579, 0.8431373, 0, 1, 1,
0.8807261, 0.9614162, 0.3362245, 0.8470588, 0, 1, 1,
0.8807511, -0.8396003, 2.245893, 0.854902, 0, 1, 1,
0.8856168, 0.9603435, 2.60873, 0.8588235, 0, 1, 1,
0.889789, 1.912645, -0.0576112, 0.8666667, 0, 1, 1,
0.8918384, -0.8643671, 1.810158, 0.8705882, 0, 1, 1,
0.8930467, -1.073357, 1.89391, 0.8784314, 0, 1, 1,
0.8991323, 1.975047, 1.629646, 0.8823529, 0, 1, 1,
0.9018477, 0.05080113, 1.666819, 0.8901961, 0, 1, 1,
0.9100401, 0.2154263, 2.548826, 0.8941177, 0, 1, 1,
0.9117343, 0.3129249, 1.115141, 0.9019608, 0, 1, 1,
0.9130582, -1.037139, 3.679236, 0.9098039, 0, 1, 1,
0.9138709, 1.069573, 0.9077689, 0.9137255, 0, 1, 1,
0.9176658, 0.8350594, -1.015536, 0.9215686, 0, 1, 1,
0.9256452, 0.1821963, 0.5496492, 0.9254902, 0, 1, 1,
0.9287513, -1.347943, 2.499484, 0.9333333, 0, 1, 1,
0.9337393, -1.017643, 1.516277, 0.9372549, 0, 1, 1,
0.934311, 1.407411, -0.871618, 0.945098, 0, 1, 1,
0.9392982, -1.37972, 2.473935, 0.9490196, 0, 1, 1,
0.9451833, -0.2102709, 2.1636, 0.9568627, 0, 1, 1,
0.9482033, -1.778992, 5.470383, 0.9607843, 0, 1, 1,
0.9493982, -1.257185, 1.417225, 0.9686275, 0, 1, 1,
0.9545031, -0.9320843, 1.951344, 0.972549, 0, 1, 1,
0.9558912, 0.1700539, 1.140126, 0.9803922, 0, 1, 1,
0.9580779, -0.2738101, 0.8751846, 0.9843137, 0, 1, 1,
0.9598172, 0.8476467, 1.817674, 0.9921569, 0, 1, 1,
0.9601353, -1.122805, 3.866966, 0.9960784, 0, 1, 1,
0.9635831, -2.22603, 3.009676, 1, 0, 0.9960784, 1,
0.9655374, 0.7312302, 1.841937, 1, 0, 0.9882353, 1,
0.9691328, -0.6942187, 0.4753442, 1, 0, 0.9843137, 1,
0.9709984, 1.550972, -1.278815, 1, 0, 0.9764706, 1,
0.9731198, 0.4128683, 1.930376, 1, 0, 0.972549, 1,
0.9744223, 0.5114771, -0.5315719, 1, 0, 0.9647059, 1,
0.9774769, 1.756965, 2.966336, 1, 0, 0.9607843, 1,
0.9792734, 2.195745, 0.5998515, 1, 0, 0.9529412, 1,
0.9797704, -0.1071928, 3.373895, 1, 0, 0.9490196, 1,
0.9800286, -0.8914199, 1.991138, 1, 0, 0.9411765, 1,
0.9819422, 0.3367369, 2.93111, 1, 0, 0.9372549, 1,
0.9925067, 0.04777195, 0.6437895, 1, 0, 0.9294118, 1,
0.9931054, -1.324965, 1.790056, 1, 0, 0.9254902, 1,
1.003433, 0.1104917, -0.2383168, 1, 0, 0.9176471, 1,
1.008694, 0.320434, 1.218709, 1, 0, 0.9137255, 1,
1.009649, -0.7286248, 0.6587773, 1, 0, 0.9058824, 1,
1.013885, -1.500345, 2.378388, 1, 0, 0.9019608, 1,
1.015227, 0.9819354, 1.663889, 1, 0, 0.8941177, 1,
1.015575, 0.9825971, 0.8380592, 1, 0, 0.8862745, 1,
1.019059, -0.2576987, 2.24734, 1, 0, 0.8823529, 1,
1.028753, -0.4820156, 2.422238, 1, 0, 0.8745098, 1,
1.037987, -0.2391098, 2.692364, 1, 0, 0.8705882, 1,
1.045609, -2.210227, 3.782806, 1, 0, 0.8627451, 1,
1.045889, 1.200142, 0.1809024, 1, 0, 0.8588235, 1,
1.052573, 0.9308974, 1.796022, 1, 0, 0.8509804, 1,
1.053331, 0.3009696, 2.510847, 1, 0, 0.8470588, 1,
1.053426, -0.7744415, -0.6013208, 1, 0, 0.8392157, 1,
1.054026, -0.1163932, 3.449822, 1, 0, 0.8352941, 1,
1.059826, 0.6565107, 1.408992, 1, 0, 0.827451, 1,
1.060628, 0.30833, 2.60683, 1, 0, 0.8235294, 1,
1.0617, -0.7451907, 2.179765, 1, 0, 0.8156863, 1,
1.063548, -0.0005747577, 1.490527, 1, 0, 0.8117647, 1,
1.071789, -0.2033576, 2.79135, 1, 0, 0.8039216, 1,
1.075481, 0.7880236, 1.917848, 1, 0, 0.7960784, 1,
1.077706, -0.64325, 0.1754315, 1, 0, 0.7921569, 1,
1.080181, 0.1280729, 3.058644, 1, 0, 0.7843137, 1,
1.106238, 1.129517, 1.725908, 1, 0, 0.7803922, 1,
1.11501, -1.077237, 2.041508, 1, 0, 0.772549, 1,
1.118952, -1.158621, 3.304664, 1, 0, 0.7686275, 1,
1.121547, -0.9331719, 1.962122, 1, 0, 0.7607843, 1,
1.123426, 0.7970969, 0.4381065, 1, 0, 0.7568628, 1,
1.131199, 1.394089, -0.4014304, 1, 0, 0.7490196, 1,
1.13272, -0.3408746, 1.438025, 1, 0, 0.7450981, 1,
1.13275, -1.046235, 2.722295, 1, 0, 0.7372549, 1,
1.137283, -0.1213126, 1.813496, 1, 0, 0.7333333, 1,
1.144425, -0.3383183, 2.023278, 1, 0, 0.7254902, 1,
1.154405, -1.696105, 2.408094, 1, 0, 0.7215686, 1,
1.167084, -1.777061, 3.161354, 1, 0, 0.7137255, 1,
1.169554, -1.150691, 0.4495851, 1, 0, 0.7098039, 1,
1.171242, 0.8462712, 1.681493, 1, 0, 0.7019608, 1,
1.171272, -0.5491666, 1.156951, 1, 0, 0.6941177, 1,
1.17392, 0.2086494, 1.064658, 1, 0, 0.6901961, 1,
1.175456, 0.4418685, 0.1286552, 1, 0, 0.682353, 1,
1.17621, -0.8879448, 1.385047, 1, 0, 0.6784314, 1,
1.182645, 0.4408181, 0.9399627, 1, 0, 0.6705883, 1,
1.186627, -0.1488158, 1.081476, 1, 0, 0.6666667, 1,
1.193634, -1.182945, 3.178116, 1, 0, 0.6588235, 1,
1.202396, 0.6300984, -0.8576591, 1, 0, 0.654902, 1,
1.202896, -1.69256, 2.04463, 1, 0, 0.6470588, 1,
1.207695, -0.7190813, 0.4879038, 1, 0, 0.6431373, 1,
1.213728, 0.914881, 2.150636, 1, 0, 0.6352941, 1,
1.225299, 0.8437546, 2.508527, 1, 0, 0.6313726, 1,
1.233534, -0.6275641, 2.75511, 1, 0, 0.6235294, 1,
1.242986, 0.07939469, 1.649058, 1, 0, 0.6196079, 1,
1.248517, 1.066284, 1.027303, 1, 0, 0.6117647, 1,
1.262731, 0.1184931, 2.127953, 1, 0, 0.6078432, 1,
1.263594, 0.786949, 2.177142, 1, 0, 0.6, 1,
1.264007, -0.1668316, 0.6156952, 1, 0, 0.5921569, 1,
1.277382, 0.5105772, 3.536805, 1, 0, 0.5882353, 1,
1.281689, -0.2760054, 3.197656, 1, 0, 0.5803922, 1,
1.282313, -0.5079612, 4.632198, 1, 0, 0.5764706, 1,
1.306538, 1.22217, -0.0129827, 1, 0, 0.5686275, 1,
1.315504, -1.42261, 1.785148, 1, 0, 0.5647059, 1,
1.321341, -1.129738, 2.187352, 1, 0, 0.5568628, 1,
1.332224, 1.753486, -1.468863, 1, 0, 0.5529412, 1,
1.33347, 0.8515343, 0.6731156, 1, 0, 0.5450981, 1,
1.333501, 0.2211473, 1.509347, 1, 0, 0.5411765, 1,
1.342653, 0.3143231, 0.009504408, 1, 0, 0.5333334, 1,
1.344046, 1.63226, 1.028394, 1, 0, 0.5294118, 1,
1.345698, -1.614542, 1.529728, 1, 0, 0.5215687, 1,
1.362716, 0.247919, 1.018161, 1, 0, 0.5176471, 1,
1.368407, 0.3458998, 1.502682, 1, 0, 0.509804, 1,
1.374663, 0.02035351, 3.28865, 1, 0, 0.5058824, 1,
1.387295, 0.4265425, 1.333751, 1, 0, 0.4980392, 1,
1.387595, 1.068284, 0.4523481, 1, 0, 0.4901961, 1,
1.394101, 0.03174816, 1.731721, 1, 0, 0.4862745, 1,
1.40249, 0.09718229, 0.4622616, 1, 0, 0.4784314, 1,
1.405285, -0.7696393, 1.744367, 1, 0, 0.4745098, 1,
1.40843, -0.7604927, 3.001537, 1, 0, 0.4666667, 1,
1.412614, 0.36621, 2.947356, 1, 0, 0.4627451, 1,
1.417284, 1.222373, 1.444187, 1, 0, 0.454902, 1,
1.455981, -1.077341, 2.716299, 1, 0, 0.4509804, 1,
1.461134, -1.138325, 1.366117, 1, 0, 0.4431373, 1,
1.463218, 0.5588306, 0.5658789, 1, 0, 0.4392157, 1,
1.47085, 0.6596909, 1.331526, 1, 0, 0.4313726, 1,
1.4732, 1.209811, 0.8673702, 1, 0, 0.427451, 1,
1.475165, 1.076843, 0.8812428, 1, 0, 0.4196078, 1,
1.48792, 0.6490146, 3.08086, 1, 0, 0.4156863, 1,
1.491256, 0.5242217, 3.226621, 1, 0, 0.4078431, 1,
1.497191, -0.1696464, 0.8655428, 1, 0, 0.4039216, 1,
1.500001, -1.053472, 2.052224, 1, 0, 0.3960784, 1,
1.502153, 0.1591155, 0.5348396, 1, 0, 0.3882353, 1,
1.50465, -0.4229002, 1.773365, 1, 0, 0.3843137, 1,
1.510539, 1.703261, 2.86681, 1, 0, 0.3764706, 1,
1.518431, 0.9087818, 0.6922632, 1, 0, 0.372549, 1,
1.524399, -0.9122043, 2.116095, 1, 0, 0.3647059, 1,
1.525218, -0.3048038, 1.793175, 1, 0, 0.3607843, 1,
1.536763, 1.509254, 1.889716, 1, 0, 0.3529412, 1,
1.555647, -0.2812666, 1.612525, 1, 0, 0.3490196, 1,
1.560019, 1.230592, 1.199996, 1, 0, 0.3411765, 1,
1.566955, -0.03153533, 2.29927, 1, 0, 0.3372549, 1,
1.570057, -0.8316804, 1.384531, 1, 0, 0.3294118, 1,
1.570206, 0.4658572, 2.18468, 1, 0, 0.3254902, 1,
1.576638, 0.2825435, 2.208668, 1, 0, 0.3176471, 1,
1.590625, 0.00762701, 1.859696, 1, 0, 0.3137255, 1,
1.593874, 2.16974, 1.124148, 1, 0, 0.3058824, 1,
1.598261, -2.615226, 2.390986, 1, 0, 0.2980392, 1,
1.606082, -0.4304515, 1.937313, 1, 0, 0.2941177, 1,
1.64914, -0.5422434, 2.201578, 1, 0, 0.2862745, 1,
1.656332, -0.3482911, 0.7342899, 1, 0, 0.282353, 1,
1.656338, 0.6286965, -0.4130525, 1, 0, 0.2745098, 1,
1.657247, 0.418652, 0.1672314, 1, 0, 0.2705882, 1,
1.662653, -0.458953, 2.56473, 1, 0, 0.2627451, 1,
1.666841, -1.09055, 2.789067, 1, 0, 0.2588235, 1,
1.668306, -0.3398717, 2.982921, 1, 0, 0.2509804, 1,
1.671691, -1.481328, 0.8409606, 1, 0, 0.2470588, 1,
1.713238, -0.762886, 2.31262, 1, 0, 0.2392157, 1,
1.740897, 2.452168, 1.3219, 1, 0, 0.2352941, 1,
1.748876, -0.7136425, 3.641111, 1, 0, 0.227451, 1,
1.765946, -0.57218, 1.177711, 1, 0, 0.2235294, 1,
1.778661, 2.420195, 0.9352227, 1, 0, 0.2156863, 1,
1.813411, -1.593528, 2.725725, 1, 0, 0.2117647, 1,
1.81687, -0.008341427, 1.101054, 1, 0, 0.2039216, 1,
1.849815, 1.848856, 0.2326744, 1, 0, 0.1960784, 1,
1.892455, 1.087898, 0.7939724, 1, 0, 0.1921569, 1,
1.922947, -0.6279379, 1.547854, 1, 0, 0.1843137, 1,
1.953145, -0.771666, 1.815149, 1, 0, 0.1803922, 1,
2.003471, -0.4999042, 0.2995146, 1, 0, 0.172549, 1,
2.005506, -0.6408539, 2.220264, 1, 0, 0.1686275, 1,
2.049219, -0.6994218, 0.6632373, 1, 0, 0.1607843, 1,
2.050307, -0.07029209, 2.163871, 1, 0, 0.1568628, 1,
2.080199, 0.2868076, 1.58695, 1, 0, 0.1490196, 1,
2.105609, 0.6235614, -0.3112617, 1, 0, 0.145098, 1,
2.126971, 1.298402, 2.430759, 1, 0, 0.1372549, 1,
2.132175, 1.274919, 1.403167, 1, 0, 0.1333333, 1,
2.148896, -0.7607419, 1.12069, 1, 0, 0.1254902, 1,
2.155885, -0.5282402, 2.724045, 1, 0, 0.1215686, 1,
2.189786, 3.136035, 0.1625499, 1, 0, 0.1137255, 1,
2.19577, -0.4862646, 1.590914, 1, 0, 0.1098039, 1,
2.266261, -0.8256117, 1.843115, 1, 0, 0.1019608, 1,
2.266931, 0.7779495, 0.04494146, 1, 0, 0.09411765, 1,
2.289923, 0.3805565, 1.231509, 1, 0, 0.09019608, 1,
2.304387, -0.8923387, 2.074471, 1, 0, 0.08235294, 1,
2.30586, 0.1900656, 1.92321, 1, 0, 0.07843138, 1,
2.328618, 0.5894962, 0.5847355, 1, 0, 0.07058824, 1,
2.374889, 1.157685, 1.666602, 1, 0, 0.06666667, 1,
2.443683, -1.519539, 0.7965004, 1, 0, 0.05882353, 1,
2.464884, -0.5877871, 0.902858, 1, 0, 0.05490196, 1,
2.57548, 1.450393, 0.5487778, 1, 0, 0.04705882, 1,
2.582505, 0.02462257, 1.993374, 1, 0, 0.04313726, 1,
2.621474, 1.223578, 2.186463, 1, 0, 0.03529412, 1,
2.930208, -0.2761418, 2.175248, 1, 0, 0.03137255, 1,
2.951523, 0.2614671, 1.293985, 1, 0, 0.02352941, 1,
2.963424, -1.24043, 1.983384, 1, 0, 0.01960784, 1,
3.287953, 0.6708305, 2.24422, 1, 0, 0.01176471, 1,
3.314021, 1.149217, 0.6645728, 1, 0, 0.007843138, 1
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
0.2505646, -5.072834, -7.167992, 0, -0.5, 0.5, 0.5,
0.2505646, -5.072834, -7.167992, 1, -0.5, 0.5, 0.5,
0.2505646, -5.072834, -7.167992, 1, 1.5, 0.5, 0.5,
0.2505646, -5.072834, -7.167992, 0, 1.5, 0.5, 0.5
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
-3.851403, -0.3735287, -7.167992, 0, -0.5, 0.5, 0.5,
-3.851403, -0.3735287, -7.167992, 1, -0.5, 0.5, 0.5,
-3.851403, -0.3735287, -7.167992, 1, 1.5, 0.5, 0.5,
-3.851403, -0.3735287, -7.167992, 0, 1.5, 0.5, 0.5
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
-3.851403, -5.072834, 0.06705928, 0, -0.5, 0.5, 0.5,
-3.851403, -5.072834, 0.06705928, 1, -0.5, 0.5, 0.5,
-3.851403, -5.072834, 0.06705928, 1, 1.5, 0.5, 0.5,
-3.851403, -5.072834, 0.06705928, 0, 1.5, 0.5, 0.5
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
-2, -3.988379, -5.498364,
3, -3.988379, -5.498364,
-2, -3.988379, -5.498364,
-2, -4.169122, -5.776636,
-1, -3.988379, -5.498364,
-1, -4.169122, -5.776636,
0, -3.988379, -5.498364,
0, -4.169122, -5.776636,
1, -3.988379, -5.498364,
1, -4.169122, -5.776636,
2, -3.988379, -5.498364,
2, -4.169122, -5.776636,
3, -3.988379, -5.498364,
3, -4.169122, -5.776636
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
-2, -4.530607, -6.333178, 0, -0.5, 0.5, 0.5,
-2, -4.530607, -6.333178, 1, -0.5, 0.5, 0.5,
-2, -4.530607, -6.333178, 1, 1.5, 0.5, 0.5,
-2, -4.530607, -6.333178, 0, 1.5, 0.5, 0.5,
-1, -4.530607, -6.333178, 0, -0.5, 0.5, 0.5,
-1, -4.530607, -6.333178, 1, -0.5, 0.5, 0.5,
-1, -4.530607, -6.333178, 1, 1.5, 0.5, 0.5,
-1, -4.530607, -6.333178, 0, 1.5, 0.5, 0.5,
0, -4.530607, -6.333178, 0, -0.5, 0.5, 0.5,
0, -4.530607, -6.333178, 1, -0.5, 0.5, 0.5,
0, -4.530607, -6.333178, 1, 1.5, 0.5, 0.5,
0, -4.530607, -6.333178, 0, 1.5, 0.5, 0.5,
1, -4.530607, -6.333178, 0, -0.5, 0.5, 0.5,
1, -4.530607, -6.333178, 1, -0.5, 0.5, 0.5,
1, -4.530607, -6.333178, 1, 1.5, 0.5, 0.5,
1, -4.530607, -6.333178, 0, 1.5, 0.5, 0.5,
2, -4.530607, -6.333178, 0, -0.5, 0.5, 0.5,
2, -4.530607, -6.333178, 1, -0.5, 0.5, 0.5,
2, -4.530607, -6.333178, 1, 1.5, 0.5, 0.5,
2, -4.530607, -6.333178, 0, 1.5, 0.5, 0.5,
3, -4.530607, -6.333178, 0, -0.5, 0.5, 0.5,
3, -4.530607, -6.333178, 1, -0.5, 0.5, 0.5,
3, -4.530607, -6.333178, 1, 1.5, 0.5, 0.5,
3, -4.530607, -6.333178, 0, 1.5, 0.5, 0.5
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
-2.904795, -2, -5.498364,
-2.904795, 2, -5.498364,
-2.904795, -2, -5.498364,
-3.062563, -2, -5.776636,
-2.904795, 0, -5.498364,
-3.062563, 0, -5.776636,
-2.904795, 2, -5.498364,
-3.062563, 2, -5.776636
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
-3.378099, -2, -6.333178, 0, -0.5, 0.5, 0.5,
-3.378099, -2, -6.333178, 1, -0.5, 0.5, 0.5,
-3.378099, -2, -6.333178, 1, 1.5, 0.5, 0.5,
-3.378099, -2, -6.333178, 0, 1.5, 0.5, 0.5,
-3.378099, 0, -6.333178, 0, -0.5, 0.5, 0.5,
-3.378099, 0, -6.333178, 1, -0.5, 0.5, 0.5,
-3.378099, 0, -6.333178, 1, 1.5, 0.5, 0.5,
-3.378099, 0, -6.333178, 0, 1.5, 0.5, 0.5,
-3.378099, 2, -6.333178, 0, -0.5, 0.5, 0.5,
-3.378099, 2, -6.333178, 1, -0.5, 0.5, 0.5,
-3.378099, 2, -6.333178, 1, 1.5, 0.5, 0.5,
-3.378099, 2, -6.333178, 0, 1.5, 0.5, 0.5
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
-2.904795, -3.988379, -4,
-2.904795, -3.988379, 4,
-2.904795, -3.988379, -4,
-3.062563, -4.169122, -4,
-2.904795, -3.988379, -2,
-3.062563, -4.169122, -2,
-2.904795, -3.988379, 0,
-3.062563, -4.169122, 0,
-2.904795, -3.988379, 2,
-3.062563, -4.169122, 2,
-2.904795, -3.988379, 4,
-3.062563, -4.169122, 4
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
-3.378099, -4.530607, -4, 0, -0.5, 0.5, 0.5,
-3.378099, -4.530607, -4, 1, -0.5, 0.5, 0.5,
-3.378099, -4.530607, -4, 1, 1.5, 0.5, 0.5,
-3.378099, -4.530607, -4, 0, 1.5, 0.5, 0.5,
-3.378099, -4.530607, -2, 0, -0.5, 0.5, 0.5,
-3.378099, -4.530607, -2, 1, -0.5, 0.5, 0.5,
-3.378099, -4.530607, -2, 1, 1.5, 0.5, 0.5,
-3.378099, -4.530607, -2, 0, 1.5, 0.5, 0.5,
-3.378099, -4.530607, 0, 0, -0.5, 0.5, 0.5,
-3.378099, -4.530607, 0, 1, -0.5, 0.5, 0.5,
-3.378099, -4.530607, 0, 1, 1.5, 0.5, 0.5,
-3.378099, -4.530607, 0, 0, 1.5, 0.5, 0.5,
-3.378099, -4.530607, 2, 0, -0.5, 0.5, 0.5,
-3.378099, -4.530607, 2, 1, -0.5, 0.5, 0.5,
-3.378099, -4.530607, 2, 1, 1.5, 0.5, 0.5,
-3.378099, -4.530607, 2, 0, 1.5, 0.5, 0.5,
-3.378099, -4.530607, 4, 0, -0.5, 0.5, 0.5,
-3.378099, -4.530607, 4, 1, -0.5, 0.5, 0.5,
-3.378099, -4.530607, 4, 1, 1.5, 0.5, 0.5,
-3.378099, -4.530607, 4, 0, 1.5, 0.5, 0.5
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
-2.904795, -3.988379, -5.498364,
-2.904795, 3.241322, -5.498364,
-2.904795, -3.988379, 5.632483,
-2.904795, 3.241322, 5.632483,
-2.904795, -3.988379, -5.498364,
-2.904795, -3.988379, 5.632483,
-2.904795, 3.241322, -5.498364,
-2.904795, 3.241322, 5.632483,
-2.904795, -3.988379, -5.498364,
3.405924, -3.988379, -5.498364,
-2.904795, -3.988379, 5.632483,
3.405924, -3.988379, 5.632483,
-2.904795, 3.241322, -5.498364,
3.405924, 3.241322, -5.498364,
-2.904795, 3.241322, 5.632483,
3.405924, 3.241322, 5.632483,
3.405924, -3.988379, -5.498364,
3.405924, 3.241322, -5.498364,
3.405924, -3.988379, 5.632483,
3.405924, 3.241322, 5.632483,
3.405924, -3.988379, -5.498364,
3.405924, -3.988379, 5.632483,
3.405924, 3.241322, -5.498364,
3.405924, 3.241322, 5.632483
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
var radius = 7.847689;
var distance = 34.91526;
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
mvMatrix.translate( -0.2505646, 0.3735287, -0.06705928 );
mvMatrix.scale( 1.34455, 1.173641, 0.7623028 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.91526);
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
pentachlorobenzonitr<-read.table("pentachlorobenzonitr.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pentachlorobenzonitr$V2
```

```
## Error in eval(expr, envir, enclos): object 'pentachlorobenzonitr' not found
```

```r
y<-pentachlorobenzonitr$V3
```

```
## Error in eval(expr, envir, enclos): object 'pentachlorobenzonitr' not found
```

```r
z<-pentachlorobenzonitr$V4
```

```
## Error in eval(expr, envir, enclos): object 'pentachlorobenzonitr' not found
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
-2.812891, 0.4270852, -2.959028, 0, 0, 1, 1, 1,
-2.805571, 0.4847756, -1.070288, 1, 0, 0, 1, 1,
-2.72613, 0.05032433, -2.614346, 1, 0, 0, 1, 1,
-2.697915, -1.785349, -1.573853, 1, 0, 0, 1, 1,
-2.632287, -0.9802364, -3.077118, 1, 0, 0, 1, 1,
-2.447178, -0.9460427, -0.9403881, 1, 0, 0, 1, 1,
-2.336228, 0.3251744, -1.969096, 0, 0, 0, 1, 1,
-2.240575, -0.44992, -1.289001, 0, 0, 0, 1, 1,
-2.229162, 1.68198, -1.889955, 0, 0, 0, 1, 1,
-2.217133, 1.603644, 0.03347808, 0, 0, 0, 1, 1,
-2.197472, -1.47365, -2.735667, 0, 0, 0, 1, 1,
-2.121665, -2.1921, -0.7171459, 0, 0, 0, 1, 1,
-2.108585, -1.463716, -1.544637, 0, 0, 0, 1, 1,
-2.107769, 0.3961847, -1.540076, 1, 1, 1, 1, 1,
-2.067958, -0.2519339, 0.1219886, 1, 1, 1, 1, 1,
-2.042939, -0.2918727, -0.8524203, 1, 1, 1, 1, 1,
-2.025156, 0.2682245, -1.336096, 1, 1, 1, 1, 1,
-2.02445, -0.7174385, -2.486453, 1, 1, 1, 1, 1,
-1.986926, 0.2507237, -1.84054, 1, 1, 1, 1, 1,
-1.907825, -1.515396, -2.075263, 1, 1, 1, 1, 1,
-1.904422, 1.198132, 1.155064, 1, 1, 1, 1, 1,
-1.891302, 1.354825, -0.3623535, 1, 1, 1, 1, 1,
-1.889558, 0.4907186, -0.7368045, 1, 1, 1, 1, 1,
-1.885526, 0.8580059, -1.632106, 1, 1, 1, 1, 1,
-1.862695, 0.1644683, -3.039494, 1, 1, 1, 1, 1,
-1.856364, 0.3604444, -0.9828327, 1, 1, 1, 1, 1,
-1.834898, -2.164674, -5.336265, 1, 1, 1, 1, 1,
-1.833304, 0.2202438, -1.189819, 1, 1, 1, 1, 1,
-1.826466, -0.9992595, -0.4377706, 0, 0, 1, 1, 1,
-1.809934, 0.7918794, -1.222413, 1, 0, 0, 1, 1,
-1.793421, -0.3925222, -3.422871, 1, 0, 0, 1, 1,
-1.792049, -0.7409838, -0.04033175, 1, 0, 0, 1, 1,
-1.788342, 0.870626, -0.07566784, 1, 0, 0, 1, 1,
-1.760515, 1.144954, -0.7210978, 1, 0, 0, 1, 1,
-1.75613, -0.5228504, -2.885241, 0, 0, 0, 1, 1,
-1.741594, -0.3205423, -0.9840388, 0, 0, 0, 1, 1,
-1.71, 0.09786738, 0.7700474, 0, 0, 0, 1, 1,
-1.703881, 1.755221, -0.8284665, 0, 0, 0, 1, 1,
-1.685614, 0.2609922, -1.747931, 0, 0, 0, 1, 1,
-1.680592, 1.248363, -0.707615, 0, 0, 0, 1, 1,
-1.670831, -0.1351432, -0.3773291, 0, 0, 0, 1, 1,
-1.667364, 1.450679, -1.909448, 1, 1, 1, 1, 1,
-1.662604, -0.7350401, -2.157882, 1, 1, 1, 1, 1,
-1.653571, -0.7650486, -2.187051, 1, 1, 1, 1, 1,
-1.652831, 0.9201047, -0.8248175, 1, 1, 1, 1, 1,
-1.606279, 1.914386, -1.157369, 1, 1, 1, 1, 1,
-1.574599, -0.589732, -1.184737, 1, 1, 1, 1, 1,
-1.568511, -0.7836756, -3.504983, 1, 1, 1, 1, 1,
-1.551984, -0.8162866, -1.132831, 1, 1, 1, 1, 1,
-1.541578, -0.7647927, -0.896283, 1, 1, 1, 1, 1,
-1.531025, 1.223457, 1.347204, 1, 1, 1, 1, 1,
-1.527948, 0.4995987, -1.175374, 1, 1, 1, 1, 1,
-1.52514, -1.336103, -2.182041, 1, 1, 1, 1, 1,
-1.522424, -0.896055, -4.34618, 1, 1, 1, 1, 1,
-1.505185, -0.7019274, -2.223664, 1, 1, 1, 1, 1,
-1.48693, 1.216008, -0.2967336, 1, 1, 1, 1, 1,
-1.470841, 0.1129884, -1.190197, 0, 0, 1, 1, 1,
-1.468453, 0.02923369, -2.280612, 1, 0, 0, 1, 1,
-1.464095, 0.7133016, -0.7025726, 1, 0, 0, 1, 1,
-1.455216, 0.1689023, -1.94716, 1, 0, 0, 1, 1,
-1.45511, -0.3160413, -1.844649, 1, 0, 0, 1, 1,
-1.432474, -0.3792019, -4.189832, 1, 0, 0, 1, 1,
-1.423573, 0.9531582, 0.2406541, 0, 0, 0, 1, 1,
-1.414083, -0.6075329, -2.908195, 0, 0, 0, 1, 1,
-1.413029, -0.9225319, -3.409179, 0, 0, 0, 1, 1,
-1.401167, 0.0941321, -1.172038, 0, 0, 0, 1, 1,
-1.393162, -0.4912199, -1.080918, 0, 0, 0, 1, 1,
-1.390321, 0.6945614, -0.612681, 0, 0, 0, 1, 1,
-1.383115, -0.7225624, -2.859021, 0, 0, 0, 1, 1,
-1.372313, -0.2017966, -2.166671, 1, 1, 1, 1, 1,
-1.35308, -0.5997527, -2.605685, 1, 1, 1, 1, 1,
-1.35092, 0.4140778, -1.0732, 1, 1, 1, 1, 1,
-1.324837, -0.7529991, -1.977658, 1, 1, 1, 1, 1,
-1.320668, 1.585799, -2.549963, 1, 1, 1, 1, 1,
-1.312399, 0.6961048, -0.4963644, 1, 1, 1, 1, 1,
-1.308294, -1.500557, -2.609347, 1, 1, 1, 1, 1,
-1.308048, 0.7638947, -0.1515597, 1, 1, 1, 1, 1,
-1.306889, -2.349545, -3.115747, 1, 1, 1, 1, 1,
-1.304865, 1.172017, -1.684543, 1, 1, 1, 1, 1,
-1.301481, -0.3372214, -1.488523, 1, 1, 1, 1, 1,
-1.300866, -0.460151, -0.9694712, 1, 1, 1, 1, 1,
-1.299686, 2.674321, -0.5131484, 1, 1, 1, 1, 1,
-1.297084, -1.357281, -2.90848, 1, 1, 1, 1, 1,
-1.293758, 1.638462, -0.6991114, 1, 1, 1, 1, 1,
-1.292059, 0.6009215, -1.547285, 0, 0, 1, 1, 1,
-1.27746, 0.7906681, -0.5103244, 1, 0, 0, 1, 1,
-1.27684, 0.385723, 0.5282699, 1, 0, 0, 1, 1,
-1.274843, 0.7270524, -1.112347, 1, 0, 0, 1, 1,
-1.265602, -1.787313, -2.332042, 1, 0, 0, 1, 1,
-1.264648, -0.3803104, -2.493646, 1, 0, 0, 1, 1,
-1.26188, -0.4915955, -1.661302, 0, 0, 0, 1, 1,
-1.23903, -0.8970276, -1.873851, 0, 0, 0, 1, 1,
-1.235361, 0.1575426, -1.484355, 0, 0, 0, 1, 1,
-1.22473, 0.726967, 0.03067113, 0, 0, 0, 1, 1,
-1.223463, -1.248237, -3.345626, 0, 0, 0, 1, 1,
-1.211042, 0.122271, -0.1814624, 0, 0, 0, 1, 1,
-1.210881, 0.7681597, -1.047587, 0, 0, 0, 1, 1,
-1.20858, 0.1772102, -2.198627, 1, 1, 1, 1, 1,
-1.207723, 0.03025584, -2.725095, 1, 1, 1, 1, 1,
-1.206633, -0.9015521, -1.55506, 1, 1, 1, 1, 1,
-1.200761, 0.01898438, -2.930129, 1, 1, 1, 1, 1,
-1.198879, -0.6370244, -0.3093974, 1, 1, 1, 1, 1,
-1.195081, 0.468891, 0.08604533, 1, 1, 1, 1, 1,
-1.186119, 0.2024048, -1.740349, 1, 1, 1, 1, 1,
-1.173139, -0.7532924, -3.086442, 1, 1, 1, 1, 1,
-1.158193, 0.3806919, -2.579491, 1, 1, 1, 1, 1,
-1.147247, -0.5133883, -2.043633, 1, 1, 1, 1, 1,
-1.13775, -0.6141714, -1.249831, 1, 1, 1, 1, 1,
-1.130201, -0.08219447, -0.171672, 1, 1, 1, 1, 1,
-1.124538, 0.4335112, -0.9968522, 1, 1, 1, 1, 1,
-1.123538, 1.039956, -0.7283053, 1, 1, 1, 1, 1,
-1.123333, 0.6259033, 0.5221308, 1, 1, 1, 1, 1,
-1.12319, 0.6842762, -0.2824287, 0, 0, 1, 1, 1,
-1.116102, 0.5060331, -0.564651, 1, 0, 0, 1, 1,
-1.114974, 0.8258602, -0.01061504, 1, 0, 0, 1, 1,
-1.114461, -1.599489, -2.657708, 1, 0, 0, 1, 1,
-1.10487, 0.6620409, -1.209469, 1, 0, 0, 1, 1,
-1.102673, -0.9540554, -2.623329, 1, 0, 0, 1, 1,
-1.096726, -0.1771762, -0.1583545, 0, 0, 0, 1, 1,
-1.095977, -0.2712496, -1.613234, 0, 0, 0, 1, 1,
-1.092652, -1.885197, -2.925039, 0, 0, 0, 1, 1,
-1.092049, -0.3908266, -1.8848, 0, 0, 0, 1, 1,
-1.057096, 1.571702, -1.552842, 0, 0, 0, 1, 1,
-1.054953, -0.260159, -1.59864, 0, 0, 0, 1, 1,
-1.054165, 2.06918, -0.4942802, 0, 0, 0, 1, 1,
-1.053463, 0.2924016, -1.552246, 1, 1, 1, 1, 1,
-1.047537, 0.293966, 0.01189943, 1, 1, 1, 1, 1,
-1.037942, -0.3137092, -0.8539035, 1, 1, 1, 1, 1,
-1.036856, -1.648877, -3.436604, 1, 1, 1, 1, 1,
-1.034204, 2.43919, -0.6007119, 1, 1, 1, 1, 1,
-1.028156, -2.472268, -3.381291, 1, 1, 1, 1, 1,
-1.025282, 1.371609, -1.268665, 1, 1, 1, 1, 1,
-1.024389, 0.1838026, -2.635461, 1, 1, 1, 1, 1,
-1.023258, 1.412975, -0.825232, 1, 1, 1, 1, 1,
-1.022502, 0.1235963, -1.414593, 1, 1, 1, 1, 1,
-1.017458, -0.2488077, -2.030747, 1, 1, 1, 1, 1,
-1.017073, -0.2744175, -2.272524, 1, 1, 1, 1, 1,
-1.014616, 1.074223, -1.975301, 1, 1, 1, 1, 1,
-1.009068, -0.2512504, -0.4559795, 1, 1, 1, 1, 1,
-0.9871799, 0.0731005, -2.991635, 1, 1, 1, 1, 1,
-0.9841686, -0.7803379, -2.603223, 0, 0, 1, 1, 1,
-0.9839892, -0.03534167, -0.6476359, 1, 0, 0, 1, 1,
-0.9821759, -0.1297529, -1.192788, 1, 0, 0, 1, 1,
-0.9805906, 0.09261, -3.302903, 1, 0, 0, 1, 1,
-0.9797573, -1.109496, -3.759886, 1, 0, 0, 1, 1,
-0.9738126, 0.6470014, -1.387854, 1, 0, 0, 1, 1,
-0.9725435, -1.090122, -2.282862, 0, 0, 0, 1, 1,
-0.9684205, -0.3450641, -1.662654, 0, 0, 0, 1, 1,
-0.9651632, 1.296568, 0.1737127, 0, 0, 0, 1, 1,
-0.9624569, 0.4329063, -2.36119, 0, 0, 0, 1, 1,
-0.9619047, -0.3540572, -1.468774, 0, 0, 0, 1, 1,
-0.9607555, -2.066999, -3.450733, 0, 0, 0, 1, 1,
-0.9592223, 1.125391, -0.765057, 0, 0, 0, 1, 1,
-0.9550695, -0.2878603, -1.508753, 1, 1, 1, 1, 1,
-0.9530756, -0.5630242, -1.580265, 1, 1, 1, 1, 1,
-0.9476501, 0.2898491, -0.1636925, 1, 1, 1, 1, 1,
-0.9402607, 1.3534, -0.6494195, 1, 1, 1, 1, 1,
-0.9400352, 0.0008904604, -3.070022, 1, 1, 1, 1, 1,
-0.9318986, -1.451196, -2.992838, 1, 1, 1, 1, 1,
-0.931259, 0.2993315, -1.090902, 1, 1, 1, 1, 1,
-0.9264999, 1.389786, -0.4534645, 1, 1, 1, 1, 1,
-0.9237517, 0.845104, -0.3551616, 1, 1, 1, 1, 1,
-0.9173384, -0.9156479, -1.250904, 1, 1, 1, 1, 1,
-0.9127902, -1.406095, -3.118644, 1, 1, 1, 1, 1,
-0.9126981, -0.5319906, -1.75217, 1, 1, 1, 1, 1,
-0.9086547, 0.1751837, -1.13294, 1, 1, 1, 1, 1,
-0.9073336, 0.1650158, -1.880044, 1, 1, 1, 1, 1,
-0.9071043, 0.05301313, -2.444743, 1, 1, 1, 1, 1,
-0.9002388, 0.273219, -1.464044, 0, 0, 1, 1, 1,
-0.8965068, 0.1195441, 0.08066265, 1, 0, 0, 1, 1,
-0.892682, -0.03900888, -2.21628, 1, 0, 0, 1, 1,
-0.892462, -0.6979122, -0.9669487, 1, 0, 0, 1, 1,
-0.8918132, 0.5671576, 0.2819002, 1, 0, 0, 1, 1,
-0.8904063, -1.118125, -3.936244, 1, 0, 0, 1, 1,
-0.8883957, 1.262128, 0.5219722, 0, 0, 0, 1, 1,
-0.8754455, -0.05073997, -1.338025, 0, 0, 0, 1, 1,
-0.8737567, -0.8055381, -3.418039, 0, 0, 0, 1, 1,
-0.868508, -0.2976684, -0.2888427, 0, 0, 0, 1, 1,
-0.8677058, 0.3227519, -1.394568, 0, 0, 0, 1, 1,
-0.8642011, -1.790603, -1.935243, 0, 0, 0, 1, 1,
-0.8553804, -0.2275527, -1.70281, 0, 0, 0, 1, 1,
-0.8538992, 0.5560065, -1.9087, 1, 1, 1, 1, 1,
-0.8490025, 0.5021252, -0.3374578, 1, 1, 1, 1, 1,
-0.8470625, -1.085416, -4.838441, 1, 1, 1, 1, 1,
-0.8463898, -0.5819906, -1.889176, 1, 1, 1, 1, 1,
-0.8413814, 0.08187896, -1.048107, 1, 1, 1, 1, 1,
-0.8394917, 0.4379647, -0.2164193, 1, 1, 1, 1, 1,
-0.8349589, 0.17031, -3.186752, 1, 1, 1, 1, 1,
-0.8329898, 0.6013852, -1.855196, 1, 1, 1, 1, 1,
-0.8309643, -0.9781929, -2.478177, 1, 1, 1, 1, 1,
-0.8295446, 1.00355, 0.4128287, 1, 1, 1, 1, 1,
-0.8275133, 1.506702, -0.3209782, 1, 1, 1, 1, 1,
-0.8213375, 0.1048565, -0.3908884, 1, 1, 1, 1, 1,
-0.8159686, -1.218809, -1.36183, 1, 1, 1, 1, 1,
-0.8149501, 2.20266, -0.04693113, 1, 1, 1, 1, 1,
-0.8116297, -0.04735847, 0.4783837, 1, 1, 1, 1, 1,
-0.8080753, -0.5911106, -1.834268, 0, 0, 1, 1, 1,
-0.805393, -0.3801619, -1.571381, 1, 0, 0, 1, 1,
-0.7991641, -0.7803029, -2.149716, 1, 0, 0, 1, 1,
-0.7980389, -0.2064341, -3.932492, 1, 0, 0, 1, 1,
-0.7974312, 0.4793362, -0.5490407, 1, 0, 0, 1, 1,
-0.7967808, 0.8131794, 0.6035191, 1, 0, 0, 1, 1,
-0.7939071, 0.492203, -0.2724017, 0, 0, 0, 1, 1,
-0.7929953, 1.570992, -1.344762, 0, 0, 0, 1, 1,
-0.7866928, 0.2189813, -1.038213, 0, 0, 0, 1, 1,
-0.7836835, 0.7081525, -1.426871, 0, 0, 0, 1, 1,
-0.7796324, -0.384796, -1.444229, 0, 0, 0, 1, 1,
-0.7740331, 0.6912471, -0.5838976, 0, 0, 0, 1, 1,
-0.7728111, 1.489, -1.111441, 0, 0, 0, 1, 1,
-0.7655978, -1.056524, -1.597178, 1, 1, 1, 1, 1,
-0.7609197, -0.1799071, -1.86185, 1, 1, 1, 1, 1,
-0.7595589, -0.6019893, -1.120349, 1, 1, 1, 1, 1,
-0.7554833, -0.8587372, -1.426401, 1, 1, 1, 1, 1,
-0.7521559, 0.4332311, -0.6053585, 1, 1, 1, 1, 1,
-0.7477471, 0.9638993, -0.7180742, 1, 1, 1, 1, 1,
-0.7360254, -1.041748, -2.117485, 1, 1, 1, 1, 1,
-0.7300074, -1.044008, -3.55879, 1, 1, 1, 1, 1,
-0.7297167, -0.1561318, -2.656903, 1, 1, 1, 1, 1,
-0.7263355, -1.436924, -2.298897, 1, 1, 1, 1, 1,
-0.718945, -0.7821496, -4.460492, 1, 1, 1, 1, 1,
-0.7175205, -2.300266, -1.932135, 1, 1, 1, 1, 1,
-0.7116603, -0.4214387, -2.112475, 1, 1, 1, 1, 1,
-0.7089221, 0.4733436, -1.81214, 1, 1, 1, 1, 1,
-0.7076877, -0.02905335, -1.898373, 1, 1, 1, 1, 1,
-0.7064676, -0.470318, -2.098856, 0, 0, 1, 1, 1,
-0.7019492, 0.1928911, -1.626441, 1, 0, 0, 1, 1,
-0.6977299, -1.180786, -2.274832, 1, 0, 0, 1, 1,
-0.688682, -1.219378, -2.412165, 1, 0, 0, 1, 1,
-0.6871974, 0.04035844, -2.111584, 1, 0, 0, 1, 1,
-0.6840011, 0.09918452, -2.796154, 1, 0, 0, 1, 1,
-0.68211, 0.7298723, -0.8737138, 0, 0, 0, 1, 1,
-0.6777588, 0.7577066, -0.5484224, 0, 0, 0, 1, 1,
-0.677652, 0.9170042, 0.960681, 0, 0, 0, 1, 1,
-0.6751143, -0.5160909, -3.501407, 0, 0, 0, 1, 1,
-0.6741547, -0.1970669, -2.912846, 0, 0, 0, 1, 1,
-0.670866, 0.7005756, -0.2245025, 0, 0, 0, 1, 1,
-0.6697093, 0.8946084, -0.6914891, 0, 0, 0, 1, 1,
-0.6622149, -0.2939404, -2.668509, 1, 1, 1, 1, 1,
-0.6620479, 0.1680276, 0.1858049, 1, 1, 1, 1, 1,
-0.66132, -1.00957, -2.589198, 1, 1, 1, 1, 1,
-0.6608577, 1.525081, -0.002564484, 1, 1, 1, 1, 1,
-0.6590238, -1.040241, -2.038664, 1, 1, 1, 1, 1,
-0.6578668, 0.3711563, -0.8048353, 1, 1, 1, 1, 1,
-0.654394, -1.712576, -3.129758, 1, 1, 1, 1, 1,
-0.6538351, -1.904479, -2.80773, 1, 1, 1, 1, 1,
-0.653716, 1.452515, -1.637883, 1, 1, 1, 1, 1,
-0.6510179, -2.181379, -3.841136, 1, 1, 1, 1, 1,
-0.6420547, 0.6103307, 0.01212304, 1, 1, 1, 1, 1,
-0.6380996, 1.055593, -2.064418, 1, 1, 1, 1, 1,
-0.6380402, -2.361578, -2.535204, 1, 1, 1, 1, 1,
-0.6376927, 0.03595104, -1.914003, 1, 1, 1, 1, 1,
-0.6361988, -0.3527062, -2.468795, 1, 1, 1, 1, 1,
-0.634764, 1.072953, -1.637221, 0, 0, 1, 1, 1,
-0.6286481, -0.2398258, -2.401465, 1, 0, 0, 1, 1,
-0.6269296, 0.3969412, -1.623857, 1, 0, 0, 1, 1,
-0.6219552, 0.5294845, -1.253177, 1, 0, 0, 1, 1,
-0.614452, 0.2445139, -2.025214, 1, 0, 0, 1, 1,
-0.609842, -0.8149465, -1.180891, 1, 0, 0, 1, 1,
-0.6066945, 1.106841, -0.3057185, 0, 0, 0, 1, 1,
-0.6064776, -0.2253504, -3.52655, 0, 0, 0, 1, 1,
-0.601599, 2.977203, -1.626498, 0, 0, 0, 1, 1,
-0.5995942, -0.3399389, -1.67327, 0, 0, 0, 1, 1,
-0.5988483, -0.3446853, -0.72828, 0, 0, 0, 1, 1,
-0.5979412, -0.2054837, -0.9482486, 0, 0, 0, 1, 1,
-0.59366, 1.141538, -0.7076938, 0, 0, 0, 1, 1,
-0.5817637, -0.7665999, -2.770344, 1, 1, 1, 1, 1,
-0.5744991, 1.394914, -2.404633, 1, 1, 1, 1, 1,
-0.5743955, -0.6234415, -1.529105, 1, 1, 1, 1, 1,
-0.5742015, -0.6936964, -1.998714, 1, 1, 1, 1, 1,
-0.5736778, 0.6797853, 0.1594717, 1, 1, 1, 1, 1,
-0.5699149, -1.005054, -2.578046, 1, 1, 1, 1, 1,
-0.5617608, -1.423029, -2.814853, 1, 1, 1, 1, 1,
-0.5616618, 1.534179, 0.2019136, 1, 1, 1, 1, 1,
-0.553984, 0.4235907, 0.8336349, 1, 1, 1, 1, 1,
-0.5496491, -0.6285777, -2.556625, 1, 1, 1, 1, 1,
-0.5463071, -0.009454873, -3.178909, 1, 1, 1, 1, 1,
-0.5427626, 0.1906929, -1.945785, 1, 1, 1, 1, 1,
-0.5413229, -0.767212, -1.68118, 1, 1, 1, 1, 1,
-0.5409988, -0.02717395, -1.02814, 1, 1, 1, 1, 1,
-0.5314362, -0.5696716, -0.2207733, 1, 1, 1, 1, 1,
-0.5305421, 0.3306789, -1.527878, 0, 0, 1, 1, 1,
-0.5286404, -1.341697, -2.202034, 1, 0, 0, 1, 1,
-0.5206735, 0.5524696, -1.023962, 1, 0, 0, 1, 1,
-0.5128375, -0.4301959, -2.659934, 1, 0, 0, 1, 1,
-0.5090359, -0.4805461, -2.14306, 1, 0, 0, 1, 1,
-0.5014106, 0.01332457, -0.4326413, 1, 0, 0, 1, 1,
-0.4997838, -0.6471103, -3.664561, 0, 0, 0, 1, 1,
-0.4966508, -0.8010024, -1.996293, 0, 0, 0, 1, 1,
-0.495031, -0.4553395, -2.200651, 0, 0, 0, 1, 1,
-0.4928783, -0.1526396, -1.34922, 0, 0, 0, 1, 1,
-0.4897711, 0.2103687, -1.616911, 0, 0, 0, 1, 1,
-0.4863998, 0.3628823, -0.4212218, 0, 0, 0, 1, 1,
-0.4854098, 0.6704476, -1.332246, 0, 0, 0, 1, 1,
-0.4842617, -0.6546659, -1.769983, 1, 1, 1, 1, 1,
-0.4785528, -0.5530157, -0.6834527, 1, 1, 1, 1, 1,
-0.4785449, -0.07189871, -1.285667, 1, 1, 1, 1, 1,
-0.4767345, -1.785478, -4.811294, 1, 1, 1, 1, 1,
-0.4754822, -0.6466594, -4.175952, 1, 1, 1, 1, 1,
-0.4721993, 0.02848333, -0.9640787, 1, 1, 1, 1, 1,
-0.4623333, -0.01954039, -2.008976, 1, 1, 1, 1, 1,
-0.4592687, -0.4341291, -1.450704, 1, 1, 1, 1, 1,
-0.4588876, 0.1526035, -2.147865, 1, 1, 1, 1, 1,
-0.456609, 0.03367789, -1.774212, 1, 1, 1, 1, 1,
-0.4526031, -1.596913, -2.316493, 1, 1, 1, 1, 1,
-0.4525495, -0.003016755, -1.276727, 1, 1, 1, 1, 1,
-0.4506795, -1.269657, -2.916989, 1, 1, 1, 1, 1,
-0.450278, -0.2139385, -1.977334, 1, 1, 1, 1, 1,
-0.4474499, -0.809633, -2.792525, 1, 1, 1, 1, 1,
-0.4465187, 0.7062947, 0.700952, 0, 0, 1, 1, 1,
-0.4418713, 1.425952, -0.3245564, 1, 0, 0, 1, 1,
-0.4410275, 0.6752297, 0.2718239, 1, 0, 0, 1, 1,
-0.4389822, -1.87594, -3.11668, 1, 0, 0, 1, 1,
-0.4368402, -0.2289155, -3.704484, 1, 0, 0, 1, 1,
-0.4318278, -0.6933557, -1.533948, 1, 0, 0, 1, 1,
-0.431509, -0.1228224, -1.021418, 0, 0, 0, 1, 1,
-0.4312596, -0.9819878, -2.077742, 0, 0, 0, 1, 1,
-0.4295683, 0.2132012, 0.6715289, 0, 0, 0, 1, 1,
-0.4282172, -0.1982046, -3.340975, 0, 0, 0, 1, 1,
-0.4278777, -0.2094574, 0.2785088, 0, 0, 0, 1, 1,
-0.4269219, -0.05056762, -2.627487, 0, 0, 0, 1, 1,
-0.4252099, 1.326293, -0.1323286, 0, 0, 0, 1, 1,
-0.4164529, 0.4450106, -0.7767822, 1, 1, 1, 1, 1,
-0.4159512, -0.7237117, -3.708426, 1, 1, 1, 1, 1,
-0.4154185, 1.766885, -0.8855567, 1, 1, 1, 1, 1,
-0.412046, 0.6856017, -1.907256, 1, 1, 1, 1, 1,
-0.4118752, 1.466907, -1.971576, 1, 1, 1, 1, 1,
-0.4113066, 1.139253, 1.351592, 1, 1, 1, 1, 1,
-0.4042865, 0.8376208, 0.07405199, 1, 1, 1, 1, 1,
-0.4009629, -0.7138733, -2.917579, 1, 1, 1, 1, 1,
-0.4007487, -0.1233028, -3.675323, 1, 1, 1, 1, 1,
-0.3981015, -0.3692674, -3.500458, 1, 1, 1, 1, 1,
-0.3979791, 0.6915026, -1.183857, 1, 1, 1, 1, 1,
-0.3964211, -1.241391, -3.588596, 1, 1, 1, 1, 1,
-0.3952985, -0.1251795, -0.7421954, 1, 1, 1, 1, 1,
-0.3899743, 0.8532341, -0.5652169, 1, 1, 1, 1, 1,
-0.3852575, 1.678489, -0.1292019, 1, 1, 1, 1, 1,
-0.3827318, 0.940124, 0.03340692, 0, 0, 1, 1, 1,
-0.381829, 0.7722352, -1.242486, 1, 0, 0, 1, 1,
-0.3768392, -0.3843668, -2.398638, 1, 0, 0, 1, 1,
-0.3749693, 1.50013, 1.032754, 1, 0, 0, 1, 1,
-0.3737305, 0.4135838, -0.2171428, 1, 0, 0, 1, 1,
-0.3721034, -0.1152872, -1.057834, 1, 0, 0, 1, 1,
-0.3699194, 2.373041, 1.400571, 0, 0, 0, 1, 1,
-0.3690307, 0.05088098, -1.250203, 0, 0, 0, 1, 1,
-0.3641791, 0.1148007, -1.251285, 0, 0, 0, 1, 1,
-0.3598579, -0.02653683, -2.545493, 0, 0, 0, 1, 1,
-0.3578452, 0.5347631, 0.1366917, 0, 0, 0, 1, 1,
-0.3545795, -1.176519, -2.062126, 0, 0, 0, 1, 1,
-0.3513235, 2.39404, 1.426995, 0, 0, 0, 1, 1,
-0.3509395, -0.09476463, -2.313625, 1, 1, 1, 1, 1,
-0.3506525, 0.46944, 2.032821, 1, 1, 1, 1, 1,
-0.3500198, 0.80205, -1.07953, 1, 1, 1, 1, 1,
-0.347982, 1.478917, 0.1983506, 1, 1, 1, 1, 1,
-0.3429512, -0.3632216, -2.426317, 1, 1, 1, 1, 1,
-0.3405201, 1.473032, -0.7949719, 1, 1, 1, 1, 1,
-0.3387076, -1.368677, -0.5746301, 1, 1, 1, 1, 1,
-0.3369231, 0.8657538, -0.55741, 1, 1, 1, 1, 1,
-0.3369175, 0.405674, -0.8790182, 1, 1, 1, 1, 1,
-0.3361705, -0.4883018, -0.7555942, 1, 1, 1, 1, 1,
-0.3337088, -0.818119, -2.618164, 1, 1, 1, 1, 1,
-0.3298783, -0.6488838, -3.785524, 1, 1, 1, 1, 1,
-0.3246867, 0.9752163, -0.2440793, 1, 1, 1, 1, 1,
-0.3152463, 0.5287793, -2.106286, 1, 1, 1, 1, 1,
-0.3126926, 1.639805, 0.329485, 1, 1, 1, 1, 1,
-0.3100879, 0.6850439, -0.6444319, 0, 0, 1, 1, 1,
-0.3071374, 0.3221989, -0.6166344, 1, 0, 0, 1, 1,
-0.3061988, -0.1094312, -1.524211, 1, 0, 0, 1, 1,
-0.3038832, -0.5374977, -4.612809, 1, 0, 0, 1, 1,
-0.3036389, 0.5650715, 0.01440648, 1, 0, 0, 1, 1,
-0.3025078, -0.3822845, -1.96196, 1, 0, 0, 1, 1,
-0.2994924, 0.789926, -0.3046082, 0, 0, 0, 1, 1,
-0.2976085, -1.310639, -3.464598, 0, 0, 0, 1, 1,
-0.2975767, 0.2108061, -0.415664, 0, 0, 0, 1, 1,
-0.2952922, 1.061958, 0.5166262, 0, 0, 0, 1, 1,
-0.2948641, 0.5680799, 0.4707269, 0, 0, 0, 1, 1,
-0.2947676, -0.6425797, -2.945677, 0, 0, 0, 1, 1,
-0.2944939, -0.2238595, -1.469918, 0, 0, 0, 1, 1,
-0.2928281, -0.508374, -3.782836, 1, 1, 1, 1, 1,
-0.2920213, 0.16032, -1.024312, 1, 1, 1, 1, 1,
-0.2902767, -0.6140733, -2.306143, 1, 1, 1, 1, 1,
-0.2888456, 0.04520384, -3.262304, 1, 1, 1, 1, 1,
-0.2877755, 0.8394019, -1.597109, 1, 1, 1, 1, 1,
-0.2872981, -1.720102, -2.921583, 1, 1, 1, 1, 1,
-0.2869301, -0.08633023, -2.286675, 1, 1, 1, 1, 1,
-0.2826398, -0.517701, -3.837805, 1, 1, 1, 1, 1,
-0.2778949, -0.8236357, -2.908821, 1, 1, 1, 1, 1,
-0.2746256, -0.8251609, -2.569209, 1, 1, 1, 1, 1,
-0.274029, -0.0004864405, 0.1674062, 1, 1, 1, 1, 1,
-0.2734216, -1.023218, -5.145362, 1, 1, 1, 1, 1,
-0.2701128, -0.07734371, -1.87971, 1, 1, 1, 1, 1,
-0.2640982, -0.1774365, -2.085677, 1, 1, 1, 1, 1,
-0.2620136, 0.5096979, -0.8490183, 1, 1, 1, 1, 1,
-0.2594172, -0.6433043, -2.786798, 0, 0, 1, 1, 1,
-0.2581716, -1.105152, -2.287073, 1, 0, 0, 1, 1,
-0.2573338, 0.00593796, -0.6835153, 1, 0, 0, 1, 1,
-0.2559976, -1.098642, -2.133146, 1, 0, 0, 1, 1,
-0.2558922, -1.165586, -3.726216, 1, 0, 0, 1, 1,
-0.2553432, 1.13906, 0.7685763, 1, 0, 0, 1, 1,
-0.2520317, 1.364823, 1.170417, 0, 0, 0, 1, 1,
-0.2508991, -1.122876, -3.742831, 0, 0, 0, 1, 1,
-0.2504835, -0.4150975, -2.6952, 0, 0, 0, 1, 1,
-0.2497397, 0.6599181, 1.484659, 0, 0, 0, 1, 1,
-0.2441088, -0.6067724, -3.899773, 0, 0, 0, 1, 1,
-0.2430433, 1.55014, 0.2767711, 0, 0, 0, 1, 1,
-0.240681, 0.3185294, -0.4998922, 0, 0, 0, 1, 1,
-0.2400351, -0.364353, -2.057458, 1, 1, 1, 1, 1,
-0.2392482, 0.6917788, -0.710795, 1, 1, 1, 1, 1,
-0.2383727, -0.4363719, -2.662514, 1, 1, 1, 1, 1,
-0.2382445, -1.341137, -1.483899, 1, 1, 1, 1, 1,
-0.2158075, -0.9723428, -2.082176, 1, 1, 1, 1, 1,
-0.2146295, 0.247883, -0.538765, 1, 1, 1, 1, 1,
-0.2109964, 1.029925, 2.258295, 1, 1, 1, 1, 1,
-0.2060888, -0.8079033, -3.446144, 1, 1, 1, 1, 1,
-0.204653, -0.6552232, -1.48768, 1, 1, 1, 1, 1,
-0.2016303, -1.707964, -2.828229, 1, 1, 1, 1, 1,
-0.2012412, -1.973767, -1.380562, 1, 1, 1, 1, 1,
-0.1990235, 0.6991964, -1.917099, 1, 1, 1, 1, 1,
-0.198604, -0.4980389, -1.711375, 1, 1, 1, 1, 1,
-0.1951413, 0.4980256, 0.9995111, 1, 1, 1, 1, 1,
-0.1929374, 1.279788, -1.53997, 1, 1, 1, 1, 1,
-0.1927117, 0.1878182, -1.415353, 0, 0, 1, 1, 1,
-0.1911431, 0.2726308, -0.5497328, 1, 0, 0, 1, 1,
-0.1868672, -1.351298, -2.178337, 1, 0, 0, 1, 1,
-0.1801123, -1.021305, -3.519517, 1, 0, 0, 1, 1,
-0.1773311, 1.244068, -2.841725, 1, 0, 0, 1, 1,
-0.1751244, 0.7229392, 0.03956013, 1, 0, 0, 1, 1,
-0.1724546, 1.146899, 0.7855147, 0, 0, 0, 1, 1,
-0.1722709, 0.9450994, -0.9547163, 0, 0, 0, 1, 1,
-0.169998, -0.4617119, -4.893866, 0, 0, 0, 1, 1,
-0.1685987, 1.099175, -0.2366913, 0, 0, 0, 1, 1,
-0.1679112, 2.062946, 0.05887693, 0, 0, 0, 1, 1,
-0.1638173, 0.2236678, -1.32532, 0, 0, 0, 1, 1,
-0.1577542, 1.802404, 0.08419785, 0, 0, 0, 1, 1,
-0.1567235, 0.3022494, -0.1603792, 1, 1, 1, 1, 1,
-0.1564024, 0.8417191, 1.583884, 1, 1, 1, 1, 1,
-0.1549276, 1.431334, 0.807398, 1, 1, 1, 1, 1,
-0.1546231, -0.3509351, -2.646377, 1, 1, 1, 1, 1,
-0.1543674, 0.1324758, 1.204528, 1, 1, 1, 1, 1,
-0.152993, -0.411826, -3.343349, 1, 1, 1, 1, 1,
-0.1513844, -0.1215847, -3.231138, 1, 1, 1, 1, 1,
-0.1502701, -0.07007276, -1.754324, 1, 1, 1, 1, 1,
-0.1459856, 0.8549451, 0.8137068, 1, 1, 1, 1, 1,
-0.1401675, 0.2294473, 0.7095981, 1, 1, 1, 1, 1,
-0.1401284, 0.6253155, -0.2740458, 1, 1, 1, 1, 1,
-0.1343319, 0.04933907, -2.868171, 1, 1, 1, 1, 1,
-0.1289771, 0.6957754, 1.849096, 1, 1, 1, 1, 1,
-0.1276195, -1.020616, -1.599115, 1, 1, 1, 1, 1,
-0.1233501, -0.2154552, -2.794104, 1, 1, 1, 1, 1,
-0.119294, -2.099571, -3.189101, 0, 0, 1, 1, 1,
-0.1176293, -0.6706992, -4.240564, 1, 0, 0, 1, 1,
-0.1158915, -0.512719, -3.545246, 1, 0, 0, 1, 1,
-0.1153258, -1.153431, -2.323317, 1, 0, 0, 1, 1,
-0.1131078, -0.6705918, -2.484595, 1, 0, 0, 1, 1,
-0.1117247, -1.216021, -1.830332, 1, 0, 0, 1, 1,
-0.1111313, 2.024375, 0.674624, 0, 0, 0, 1, 1,
-0.1098211, -0.4468034, -4.639948, 0, 0, 0, 1, 1,
-0.1094787, 0.1873796, -0.02288308, 0, 0, 0, 1, 1,
-0.1030989, 1.207766, 0.3391986, 0, 0, 0, 1, 1,
-0.1028936, 0.9322283, -0.04118489, 0, 0, 0, 1, 1,
-0.1006915, -1.450754, -1.903506, 0, 0, 0, 1, 1,
-0.09930152, 0.5978228, -0.7946416, 0, 0, 0, 1, 1,
-0.09889267, -0.7269818, -3.672084, 1, 1, 1, 1, 1,
-0.09512842, -0.4322297, -2.7418, 1, 1, 1, 1, 1,
-0.09359388, -0.8939812, -3.676183, 1, 1, 1, 1, 1,
-0.09277368, 1.135258, 0.6513749, 1, 1, 1, 1, 1,
-0.08534633, -2.080536, -3.165674, 1, 1, 1, 1, 1,
-0.08508919, -0.3326548, -3.558532, 1, 1, 1, 1, 1,
-0.08328129, 0.6749889, -0.7574319, 1, 1, 1, 1, 1,
-0.08052281, -1.264618, -2.469936, 1, 1, 1, 1, 1,
-0.07793977, -1.822955, -2.247603, 1, 1, 1, 1, 1,
-0.07562062, 0.7703247, 1.095161, 1, 1, 1, 1, 1,
-0.07462725, 0.5751268, -0.1332492, 1, 1, 1, 1, 1,
-0.07057774, -1.268297, -3.009224, 1, 1, 1, 1, 1,
-0.06883579, 2.316489, -1.258829, 1, 1, 1, 1, 1,
-0.06747556, 1.359157, 1.115781, 1, 1, 1, 1, 1,
-0.06198911, 0.791633, -1.607861, 1, 1, 1, 1, 1,
-0.06080311, 0.8106255, 0.7647883, 0, 0, 1, 1, 1,
-0.05803565, -0.7359018, -2.980664, 1, 0, 0, 1, 1,
-0.05457112, 0.8206626, -0.6631382, 1, 0, 0, 1, 1,
-0.05365591, 1.177056, -0.1066573, 1, 0, 0, 1, 1,
-0.04845958, -0.5797859, -4.379141, 1, 0, 0, 1, 1,
-0.04802496, 0.03648477, -0.5629089, 1, 0, 0, 1, 1,
-0.04690382, -1.848028, -3.098178, 0, 0, 0, 1, 1,
-0.04252132, -0.8240838, -1.203766, 0, 0, 0, 1, 1,
-0.04152645, -0.1802726, -2.605786, 0, 0, 0, 1, 1,
-0.04132427, -0.2689384, -3.96938, 0, 0, 0, 1, 1,
-0.03296574, 0.08424525, -0.7657006, 0, 0, 0, 1, 1,
-0.03194237, -0.5462349, -5.099718, 0, 0, 0, 1, 1,
-0.02893949, 0.221604, -1.875104, 0, 0, 0, 1, 1,
-0.02807598, 0.6985997, -0.4155337, 1, 1, 1, 1, 1,
-0.02774862, -0.580276, -3.735579, 1, 1, 1, 1, 1,
-0.02721221, -2.504155, -3.549348, 1, 1, 1, 1, 1,
-0.0263592, -0.3747496, -3.178351, 1, 1, 1, 1, 1,
-0.02380227, -0.7722894, -4.216827, 1, 1, 1, 1, 1,
-0.01931285, 0.4769138, 1.379446, 1, 1, 1, 1, 1,
-0.01331465, 0.2644366, -0.3493121, 1, 1, 1, 1, 1,
-0.009720732, 0.04907594, -0.02821434, 1, 1, 1, 1, 1,
-0.007407646, -1.387312, -3.697464, 1, 1, 1, 1, 1,
-0.005824272, -1.780208, -3.07999, 1, 1, 1, 1, 1,
-0.005184092, 0.2217673, -0.4017621, 1, 1, 1, 1, 1,
-0.004795727, 0.1393615, -0.8723298, 1, 1, 1, 1, 1,
-0.003758517, -0.202251, -1.243877, 1, 1, 1, 1, 1,
-0.002482885, -1.332713, -1.247832, 1, 1, 1, 1, 1,
0.002608226, 1.447849, 1.352619, 1, 1, 1, 1, 1,
0.00379759, -1.497871, 3.55851, 0, 0, 1, 1, 1,
0.003929402, 0.3800908, 0.5025956, 1, 0, 0, 1, 1,
0.004572002, -0.1904114, 3.838757, 1, 0, 0, 1, 1,
0.004995753, 2.084556, 0.8797266, 1, 0, 0, 1, 1,
0.005035548, 0.1279141, -0.9728084, 1, 0, 0, 1, 1,
0.005889601, 0.4557487, -1.203251, 1, 0, 0, 1, 1,
0.01406426, 0.467616, 1.881828, 0, 0, 0, 1, 1,
0.02447072, -0.3059311, 2.913529, 0, 0, 0, 1, 1,
0.02452824, -0.9185535, 3.736389, 0, 0, 0, 1, 1,
0.02567234, 1.236148, -0.7985072, 0, 0, 0, 1, 1,
0.03009013, 1.873676, 1.23805, 0, 0, 0, 1, 1,
0.03295617, -0.4561396, 1.578387, 0, 0, 0, 1, 1,
0.03373024, 1.791645, 1.798272, 0, 0, 0, 1, 1,
0.03537686, -0.5488535, 0.7420928, 1, 1, 1, 1, 1,
0.03592777, -1.454525, 2.47939, 1, 1, 1, 1, 1,
0.03871473, 1.437703, 0.4204215, 1, 1, 1, 1, 1,
0.04700673, 1.060592, 0.2489438, 1, 1, 1, 1, 1,
0.05002672, -0.2964524, 1.772306, 1, 1, 1, 1, 1,
0.0508183, 0.8188456, 1.086089, 1, 1, 1, 1, 1,
0.05189929, 0.3094156, -0.6735554, 1, 1, 1, 1, 1,
0.05225156, -0.5191111, 2.741455, 1, 1, 1, 1, 1,
0.05508744, -0.5878646, 3.273736, 1, 1, 1, 1, 1,
0.05646913, -0.5346929, 2.244714, 1, 1, 1, 1, 1,
0.05814571, -1.225425, 2.269463, 1, 1, 1, 1, 1,
0.06102478, 0.8108528, -0.4996368, 1, 1, 1, 1, 1,
0.0643654, 0.7604983, -0.1484933, 1, 1, 1, 1, 1,
0.06493501, 1.656329, -1.797224, 1, 1, 1, 1, 1,
0.07355898, 1.970166, 0.5527589, 1, 1, 1, 1, 1,
0.07957456, -0.1400761, 2.183198, 0, 0, 1, 1, 1,
0.07992069, -1.380467, 4.180489, 1, 0, 0, 1, 1,
0.08350101, -0.7646745, 2.892003, 1, 0, 0, 1, 1,
0.08352051, 0.3325254, 0.4439611, 1, 0, 0, 1, 1,
0.08476863, 0.06502488, 0.1159601, 1, 0, 0, 1, 1,
0.08603779, -1.006317, 3.145822, 1, 0, 0, 1, 1,
0.08738436, 0.04594315, 1.364893, 0, 0, 0, 1, 1,
0.08855214, -0.6746073, 1.553962, 0, 0, 0, 1, 1,
0.0917495, 0.9167964, 0.6881154, 0, 0, 0, 1, 1,
0.09243725, 1.069481, -1.946148, 0, 0, 0, 1, 1,
0.09345, -2.039546, 3.230589, 0, 0, 0, 1, 1,
0.1056139, -0.1880734, 1.404915, 0, 0, 0, 1, 1,
0.1080883, 1.557559, -1.31182, 0, 0, 0, 1, 1,
0.1092428, 0.4903029, -0.2726106, 1, 1, 1, 1, 1,
0.1176274, -1.11948, 3.930017, 1, 1, 1, 1, 1,
0.1178754, 0.8931866, -0.7968658, 1, 1, 1, 1, 1,
0.1182639, -1.077291, 2.351775, 1, 1, 1, 1, 1,
0.121069, -0.8729571, 3.597687, 1, 1, 1, 1, 1,
0.1210799, 0.1558402, 1.077563, 1, 1, 1, 1, 1,
0.1223905, 0.8004568, -0.367555, 1, 1, 1, 1, 1,
0.1226101, 0.4395181, 1.118294, 1, 1, 1, 1, 1,
0.1309289, 0.8544564, 0.3242817, 1, 1, 1, 1, 1,
0.1334475, -0.7947441, 3.755252, 1, 1, 1, 1, 1,
0.1344502, 0.4358324, 0.9663059, 1, 1, 1, 1, 1,
0.1362354, -0.6788532, 3.40244, 1, 1, 1, 1, 1,
0.1405024, -2.609802, 3.42158, 1, 1, 1, 1, 1,
0.1451808, -0.6645809, 0.4614713, 1, 1, 1, 1, 1,
0.1546493, 0.2289168, 0.03534966, 1, 1, 1, 1, 1,
0.1567838, 0.8180349, -1.019004, 0, 0, 1, 1, 1,
0.1577206, 0.04273485, 1.911824, 1, 0, 0, 1, 1,
0.1577245, -0.3733412, 4.759573, 1, 0, 0, 1, 1,
0.1620591, -0.564887, 4.009186, 1, 0, 0, 1, 1,
0.1627856, -0.8707194, 2.88418, 1, 0, 0, 1, 1,
0.1658747, -0.1941121, 1.611102, 1, 0, 0, 1, 1,
0.166231, -0.4198157, 3.263098, 0, 0, 0, 1, 1,
0.1727706, -0.5556118, 2.80181, 0, 0, 0, 1, 1,
0.177829, -0.05663455, 1.646679, 0, 0, 0, 1, 1,
0.1809583, 0.7917029, -0.1443906, 0, 0, 0, 1, 1,
0.1828836, -0.2491002, 1.752702, 0, 0, 0, 1, 1,
0.1861731, 0.3046504, 1.30935, 0, 0, 0, 1, 1,
0.1881626, 0.331075, 2.208897, 0, 0, 0, 1, 1,
0.1906222, -0.1861748, 3.6183, 1, 1, 1, 1, 1,
0.1908288, 0.2689474, -0.2838639, 1, 1, 1, 1, 1,
0.1959265, -0.7750979, 2.480252, 1, 1, 1, 1, 1,
0.1971946, 1.393968, 1.251404, 1, 1, 1, 1, 1,
0.2010897, 1.735854, -1.81996, 1, 1, 1, 1, 1,
0.2144621, 0.923952, -0.7628674, 1, 1, 1, 1, 1,
0.2170422, 0.03076253, 0.93572, 1, 1, 1, 1, 1,
0.2185993, 0.4617126, -1.308341, 1, 1, 1, 1, 1,
0.2190672, 0.05386578, 1.690464, 1, 1, 1, 1, 1,
0.2214645, 0.6765485, 1.193213, 1, 1, 1, 1, 1,
0.2239653, 1.18737, -0.4546595, 1, 1, 1, 1, 1,
0.2271104, 1.541886, -0.6693547, 1, 1, 1, 1, 1,
0.2317456, -1.602039, 1.800778, 1, 1, 1, 1, 1,
0.233457, 1.725635, -1.977975, 1, 1, 1, 1, 1,
0.2350567, 2.534524, 0.2763255, 1, 1, 1, 1, 1,
0.2366699, -0.8320482, 4.493095, 0, 0, 1, 1, 1,
0.2379742, 1.128063, 0.8361471, 1, 0, 0, 1, 1,
0.2389673, -1.244943, 2.962153, 1, 0, 0, 1, 1,
0.2391143, -0.7779424, 0.9414745, 1, 0, 0, 1, 1,
0.2392, 1.063189, -0.2112888, 1, 0, 0, 1, 1,
0.2423881, -0.02509257, 0.7573566, 1, 0, 0, 1, 1,
0.2451769, 0.820752, 0.8310382, 0, 0, 0, 1, 1,
0.246415, 0.2695424, 1.406111, 0, 0, 0, 1, 1,
0.2509795, 0.2425829, -0.7389699, 0, 0, 0, 1, 1,
0.2572424, -0.01601762, 1.78471, 0, 0, 0, 1, 1,
0.2618257, -3.065262, 1.659865, 0, 0, 0, 1, 1,
0.2634727, -1.994613, 3.344603, 0, 0, 0, 1, 1,
0.2638227, -0.01299646, 0.3695414, 0, 0, 0, 1, 1,
0.2644767, 0.1162428, -0.691074, 1, 1, 1, 1, 1,
0.2661637, 1.090215, 1.296851, 1, 1, 1, 1, 1,
0.2686142, 0.04420564, 2.643208, 1, 1, 1, 1, 1,
0.2695793, 2.336228, 0.8299921, 1, 1, 1, 1, 1,
0.2701494, -0.5188001, 1.721626, 1, 1, 1, 1, 1,
0.272231, -0.2760175, 2.152889, 1, 1, 1, 1, 1,
0.2732597, -0.609042, 1.314672, 1, 1, 1, 1, 1,
0.2741217, 0.9914931, 0.5867823, 1, 1, 1, 1, 1,
0.276032, -1.142406, 3.803296, 1, 1, 1, 1, 1,
0.2792211, 0.5709289, 0.5085959, 1, 1, 1, 1, 1,
0.2808656, -0.3820173, 5.206182, 1, 1, 1, 1, 1,
0.281739, 0.32706, 0.3589358, 1, 1, 1, 1, 1,
0.2830008, -0.9714406, 3.513359, 1, 1, 1, 1, 1,
0.2866335, 0.7730394, 0.4925406, 1, 1, 1, 1, 1,
0.291371, 0.2323845, -0.005420787, 1, 1, 1, 1, 1,
0.29469, 0.889172, -1.101841, 0, 0, 1, 1, 1,
0.2974865, -0.6003501, 1.876791, 1, 0, 0, 1, 1,
0.3033265, 3.112112, 0.2747652, 1, 0, 0, 1, 1,
0.3098494, 1.278287, -0.1516406, 1, 0, 0, 1, 1,
0.3114043, -0.4264493, 4.343707, 1, 0, 0, 1, 1,
0.3156864, 1.190181, 0.02276175, 1, 0, 0, 1, 1,
0.3256166, 0.3874739, 1.295218, 0, 0, 0, 1, 1,
0.3357081, -0.3285014, 0.98662, 0, 0, 0, 1, 1,
0.3362924, 1.138183, 0.06736125, 0, 0, 0, 1, 1,
0.339516, 0.3667701, 1.972929, 0, 0, 0, 1, 1,
0.3496332, -0.6186885, 2.345082, 0, 0, 0, 1, 1,
0.3501309, -0.771093, 3.206398, 0, 0, 0, 1, 1,
0.3506252, 1.466095, -0.1474335, 0, 0, 0, 1, 1,
0.3510341, -0.7853164, 4.774132, 1, 1, 1, 1, 1,
0.355439, 1.83544, 0.1929759, 1, 1, 1, 1, 1,
0.3555881, -1.342537, 3.679729, 1, 1, 1, 1, 1,
0.3570914, 2.120178, 1.569931, 1, 1, 1, 1, 1,
0.3674983, -0.4140112, 3.158661, 1, 1, 1, 1, 1,
0.3678649, 0.02853372, 0.5848229, 1, 1, 1, 1, 1,
0.3701017, -1.951065, 2.819693, 1, 1, 1, 1, 1,
0.3701974, -0.4767482, 3.359043, 1, 1, 1, 1, 1,
0.3704734, -0.1471624, 2.308938, 1, 1, 1, 1, 1,
0.3728082, -2.033661, 1.99785, 1, 1, 1, 1, 1,
0.3738362, 0.7879263, -0.8814657, 1, 1, 1, 1, 1,
0.3747691, -2.140309, 2.347655, 1, 1, 1, 1, 1,
0.3750024, 1.155281, 0.0877272, 1, 1, 1, 1, 1,
0.3765132, 0.3690645, 2.680959, 1, 1, 1, 1, 1,
0.3771877, 0.3999819, -0.09151258, 1, 1, 1, 1, 1,
0.3792144, 1.002798, 0.6470746, 0, 0, 1, 1, 1,
0.3800992, 1.961535, 1.153633, 1, 0, 0, 1, 1,
0.3809159, -0.6308447, 4.338779, 1, 0, 0, 1, 1,
0.3858788, 1.018555, -0.361394, 1, 0, 0, 1, 1,
0.3864366, -2.60485, 4.810219, 1, 0, 0, 1, 1,
0.3920154, 0.9237861, -0.09665561, 1, 0, 0, 1, 1,
0.3926151, -1.182921, 3.029794, 0, 0, 0, 1, 1,
0.3936349, -0.1844533, 1.265888, 0, 0, 0, 1, 1,
0.3938681, -0.9550624, 3.255631, 0, 0, 0, 1, 1,
0.4032752, 0.828329, 0.7580271, 0, 0, 0, 1, 1,
0.405806, 0.2079739, -0.5272191, 0, 0, 0, 1, 1,
0.407091, -0.6834818, 2.775477, 0, 0, 0, 1, 1,
0.4109673, -0.4376806, 1.453391, 0, 0, 0, 1, 1,
0.4135884, -1.739886, 3.681782, 1, 1, 1, 1, 1,
0.416291, -0.3933954, 2.591271, 1, 1, 1, 1, 1,
0.4188724, -0.07101061, 1.576788, 1, 1, 1, 1, 1,
0.4223854, -0.2914663, 1.823702, 1, 1, 1, 1, 1,
0.422615, 1.372965, -1.024871, 1, 1, 1, 1, 1,
0.4259284, 0.2659197, 0.3282183, 1, 1, 1, 1, 1,
0.4349138, 0.6529908, 0.2728458, 1, 1, 1, 1, 1,
0.4361528, 1.515798, 2.526231, 1, 1, 1, 1, 1,
0.4363098, 0.4975832, 0.4859284, 1, 1, 1, 1, 1,
0.4389288, -1.284844, 0.6384708, 1, 1, 1, 1, 1,
0.4390039, -1.292628, 3.307808, 1, 1, 1, 1, 1,
0.4427424, 0.1579482, 2.003483, 1, 1, 1, 1, 1,
0.4470972, 0.038847, 2.724031, 1, 1, 1, 1, 1,
0.4509494, 1.800362, -0.08834278, 1, 1, 1, 1, 1,
0.4518296, -0.4615562, 3.061256, 1, 1, 1, 1, 1,
0.4533632, -0.1263589, 2.895408, 0, 0, 1, 1, 1,
0.4580188, -0.3065858, 3.901042, 1, 0, 0, 1, 1,
0.4580452, -1.03632, 1.93644, 1, 0, 0, 1, 1,
0.4643299, 0.744702, -1.243756, 1, 0, 0, 1, 1,
0.4643711, 0.09460077, 0.1961992, 1, 0, 0, 1, 1,
0.4660097, 1.196026, -0.2356131, 1, 0, 0, 1, 1,
0.4712879, 1.544208, 1.760138, 0, 0, 0, 1, 1,
0.4745334, -1.051749, 3.122728, 0, 0, 0, 1, 1,
0.4761505, -0.3792832, 2.842214, 0, 0, 0, 1, 1,
0.4761812, 1.83481, -0.4845514, 0, 0, 0, 1, 1,
0.4767923, 0.04995061, 1.602107, 0, 0, 0, 1, 1,
0.4808369, 0.7727558, -0.238144, 0, 0, 0, 1, 1,
0.4864943, 0.0233312, 2.761206, 0, 0, 0, 1, 1,
0.4945327, 0.5799713, 0.4702748, 1, 1, 1, 1, 1,
0.4951691, 1.285119, 0.3113824, 1, 1, 1, 1, 1,
0.4954679, 0.5806726, 1.437306, 1, 1, 1, 1, 1,
0.4972887, -0.8035707, 3.36118, 1, 1, 1, 1, 1,
0.4998854, 0.2190427, 1.555462, 1, 1, 1, 1, 1,
0.5019337, 0.8288459, -0.3416259, 1, 1, 1, 1, 1,
0.5046831, -0.7404935, 3.424113, 1, 1, 1, 1, 1,
0.5087532, -0.4197321, 1.276071, 1, 1, 1, 1, 1,
0.5089626, 1.165955, -2.153574, 1, 1, 1, 1, 1,
0.5121433, 1.85318, 1.61915, 1, 1, 1, 1, 1,
0.5138803, 0.03621076, 0.9836032, 1, 1, 1, 1, 1,
0.5154766, -0.08004414, 1.722248, 1, 1, 1, 1, 1,
0.5191493, 0.5777363, 1.428214, 1, 1, 1, 1, 1,
0.5240621, -0.2548442, 2.265799, 1, 1, 1, 1, 1,
0.5270792, -0.1702584, 1.909954, 1, 1, 1, 1, 1,
0.5277734, 0.03486208, -0.9729157, 0, 0, 1, 1, 1,
0.528545, 0.8082956, 1.113252, 1, 0, 0, 1, 1,
0.5354618, 0.8656719, -0.4056058, 1, 0, 0, 1, 1,
0.5405714, 0.7018397, 1.052692, 1, 0, 0, 1, 1,
0.543887, -0.3941017, 3.52086, 1, 0, 0, 1, 1,
0.5454363, -0.9306757, 4.282075, 1, 0, 0, 1, 1,
0.5509121, 1.891837, 0.9075115, 0, 0, 0, 1, 1,
0.5591567, 0.8851109, -1.861989, 0, 0, 0, 1, 1,
0.5612382, -0.9755357, 2.434764, 0, 0, 0, 1, 1,
0.5624962, -0.1521027, 0.7284929, 0, 0, 0, 1, 1,
0.572042, -1.138904, 0.9938954, 0, 0, 0, 1, 1,
0.5770732, -0.01979785, 3.666412, 0, 0, 0, 1, 1,
0.5817184, 0.08995144, 1.745521, 0, 0, 0, 1, 1,
0.5868087, 0.6365452, 0.8409725, 1, 1, 1, 1, 1,
0.5870444, -1.58577, 2.485241, 1, 1, 1, 1, 1,
0.5885696, 1.455636, -0.5751761, 1, 1, 1, 1, 1,
0.5892467, -0.2157772, 1.124914, 1, 1, 1, 1, 1,
0.5935063, -0.755865, 1.811338, 1, 1, 1, 1, 1,
0.593823, 0.3664003, 1.988367, 1, 1, 1, 1, 1,
0.5967258, 0.2212262, 2.495182, 1, 1, 1, 1, 1,
0.5987865, -1.510083, 2.462889, 1, 1, 1, 1, 1,
0.607261, -1.822605, 2.79384, 1, 1, 1, 1, 1,
0.6075491, 1.52709, 0.4706548, 1, 1, 1, 1, 1,
0.6078523, -1.889537, 3.369472, 1, 1, 1, 1, 1,
0.6101893, -0.5525524, 2.879129, 1, 1, 1, 1, 1,
0.6122876, -3.41807, 3.721615, 1, 1, 1, 1, 1,
0.6163846, 0.03754957, 0.8308833, 1, 1, 1, 1, 1,
0.6175047, -1.033933, 2.295449, 1, 1, 1, 1, 1,
0.6298056, -0.8517856, 1.431544, 0, 0, 1, 1, 1,
0.6300905, 1.949971, 0.9670143, 1, 0, 0, 1, 1,
0.6334326, 0.1381403, 1.848521, 1, 0, 0, 1, 1,
0.635285, 1.240239, 0.5418585, 1, 0, 0, 1, 1,
0.6372671, 0.5811766, 0.7803739, 1, 0, 0, 1, 1,
0.6424702, 0.3049227, 2.50033, 1, 0, 0, 1, 1,
0.6447725, 0.6305889, 0.2040694, 0, 0, 0, 1, 1,
0.6502901, 0.1818036, 1.351887, 0, 0, 0, 1, 1,
0.6553781, -0.1230968, 2.743271, 0, 0, 0, 1, 1,
0.66043, -0.305558, 2.201608, 0, 0, 0, 1, 1,
0.660921, 0.013082, 0.6622282, 0, 0, 0, 1, 1,
0.6616894, -1.508743, 3.211692, 0, 0, 0, 1, 1,
0.6628232, -0.2206939, 0.9052395, 0, 0, 0, 1, 1,
0.6630992, -0.6191257, 0.9952865, 1, 1, 1, 1, 1,
0.6636998, -1.793433, 3.450353, 1, 1, 1, 1, 1,
0.6707264, 2.070604, -1.201395, 1, 1, 1, 1, 1,
0.6709551, -0.341393, 2.564281, 1, 1, 1, 1, 1,
0.6716995, 1.317645, 2.667377, 1, 1, 1, 1, 1,
0.6762328, -0.1552303, 2.035674, 1, 1, 1, 1, 1,
0.6827326, 1.331826, -2.296804, 1, 1, 1, 1, 1,
0.6873263, -1.528892, 3.339931, 1, 1, 1, 1, 1,
0.6874568, 0.333531, 0.009586317, 1, 1, 1, 1, 1,
0.6879923, -0.7999588, 3.443491, 1, 1, 1, 1, 1,
0.6903286, -0.2462071, 0.8644683, 1, 1, 1, 1, 1,
0.6919387, 0.1431325, 3.010032, 1, 1, 1, 1, 1,
0.6969137, 1.141315, 0.4351848, 1, 1, 1, 1, 1,
0.6973635, -3.102704, 2.724128, 1, 1, 1, 1, 1,
0.700919, -1.547282, 2.285737, 1, 1, 1, 1, 1,
0.7077078, -0.7499486, 1.165387, 0, 0, 1, 1, 1,
0.7155746, 0.09174498, 0.572568, 1, 0, 0, 1, 1,
0.7207708, 1.483398, 1.959292, 1, 0, 0, 1, 1,
0.7211576, 1.212492, 0.8074718, 1, 0, 0, 1, 1,
0.7219697, 0.3341452, 2.110158, 1, 0, 0, 1, 1,
0.7223902, -1.352825, 4.395159, 1, 0, 0, 1, 1,
0.7243734, -1.489481, 3.694687, 0, 0, 0, 1, 1,
0.7287083, 0.5216475, 2.614106, 0, 0, 0, 1, 1,
0.7293083, -0.5402883, 2.295745, 0, 0, 0, 1, 1,
0.7317673, -1.642429, 3.516922, 0, 0, 0, 1, 1,
0.7339857, 0.1411485, 0.8796819, 0, 0, 0, 1, 1,
0.7375236, 0.7226274, -0.4984939, 0, 0, 0, 1, 1,
0.7421576, -0.9266089, 2.129501, 0, 0, 0, 1, 1,
0.7430222, 1.860172, -0.3070456, 1, 1, 1, 1, 1,
0.74552, -0.1477464, 2.432967, 1, 1, 1, 1, 1,
0.7460539, -0.002926788, 0.8465542, 1, 1, 1, 1, 1,
0.7493777, 0.4983474, 1.133411, 1, 1, 1, 1, 1,
0.7516759, -0.8421658, 4.253646, 1, 1, 1, 1, 1,
0.762392, -0.01506111, 2.360338, 1, 1, 1, 1, 1,
0.7648754, 0.07733612, 0.7324522, 1, 1, 1, 1, 1,
0.7660724, -0.9999928, 2.499031, 1, 1, 1, 1, 1,
0.7722291, -0.3169378, 3.211442, 1, 1, 1, 1, 1,
0.7739727, 1.609753, -1.500989, 1, 1, 1, 1, 1,
0.777399, -0.1375956, 2.392903, 1, 1, 1, 1, 1,
0.7786512, -0.5765257, 1.239908, 1, 1, 1, 1, 1,
0.7866853, -0.2696585, 2.293501, 1, 1, 1, 1, 1,
0.788841, 1.052433, 0.990153, 1, 1, 1, 1, 1,
0.791108, -1.736092, 3.596254, 1, 1, 1, 1, 1,
0.7971937, 1.676022, -0.4048456, 0, 0, 1, 1, 1,
0.8004161, -0.2613819, 3.096797, 1, 0, 0, 1, 1,
0.8041802, 0.1700483, 1.065545, 1, 0, 0, 1, 1,
0.8160065, 0.4812697, 0.1526098, 1, 0, 0, 1, 1,
0.8230246, -0.6411902, 2.598912, 1, 0, 0, 1, 1,
0.8248111, 1.588129, -0.7094591, 1, 0, 0, 1, 1,
0.8267856, -1.53989, 1.823436, 0, 0, 0, 1, 1,
0.8280581, -0.5335456, 1.991485, 0, 0, 0, 1, 1,
0.8356366, -0.7132573, 2.126139, 0, 0, 0, 1, 1,
0.8375116, 0.3552195, 0.3944871, 0, 0, 0, 1, 1,
0.8378986, 0.01148961, 1.451378, 0, 0, 0, 1, 1,
0.8380867, 1.221581, 0.5538292, 0, 0, 0, 1, 1,
0.8395987, -0.3829447, 4.032403, 0, 0, 0, 1, 1,
0.8439963, -0.3706313, 2.932077, 1, 1, 1, 1, 1,
0.8446096, -1.067921, 1.648323, 1, 1, 1, 1, 1,
0.845312, -1.424378, 1.551354, 1, 1, 1, 1, 1,
0.8465635, 0.680259, 2.530207, 1, 1, 1, 1, 1,
0.8478162, -3.883092, 2.290262, 1, 1, 1, 1, 1,
0.8503489, -0.731496, 0.7784143, 1, 1, 1, 1, 1,
0.8520761, 0.7479441, 1.09877, 1, 1, 1, 1, 1,
0.8625057, 0.006903287, 1.162416, 1, 1, 1, 1, 1,
0.8686964, 0.03577539, 1.720063, 1, 1, 1, 1, 1,
0.8781123, 1.884978, -1.592178, 1, 1, 1, 1, 1,
0.8795541, -0.7758945, 2.699579, 1, 1, 1, 1, 1,
0.8807261, 0.9614162, 0.3362245, 1, 1, 1, 1, 1,
0.8807511, -0.8396003, 2.245893, 1, 1, 1, 1, 1,
0.8856168, 0.9603435, 2.60873, 1, 1, 1, 1, 1,
0.889789, 1.912645, -0.0576112, 1, 1, 1, 1, 1,
0.8918384, -0.8643671, 1.810158, 0, 0, 1, 1, 1,
0.8930467, -1.073357, 1.89391, 1, 0, 0, 1, 1,
0.8991323, 1.975047, 1.629646, 1, 0, 0, 1, 1,
0.9018477, 0.05080113, 1.666819, 1, 0, 0, 1, 1,
0.9100401, 0.2154263, 2.548826, 1, 0, 0, 1, 1,
0.9117343, 0.3129249, 1.115141, 1, 0, 0, 1, 1,
0.9130582, -1.037139, 3.679236, 0, 0, 0, 1, 1,
0.9138709, 1.069573, 0.9077689, 0, 0, 0, 1, 1,
0.9176658, 0.8350594, -1.015536, 0, 0, 0, 1, 1,
0.9256452, 0.1821963, 0.5496492, 0, 0, 0, 1, 1,
0.9287513, -1.347943, 2.499484, 0, 0, 0, 1, 1,
0.9337393, -1.017643, 1.516277, 0, 0, 0, 1, 1,
0.934311, 1.407411, -0.871618, 0, 0, 0, 1, 1,
0.9392982, -1.37972, 2.473935, 1, 1, 1, 1, 1,
0.9451833, -0.2102709, 2.1636, 1, 1, 1, 1, 1,
0.9482033, -1.778992, 5.470383, 1, 1, 1, 1, 1,
0.9493982, -1.257185, 1.417225, 1, 1, 1, 1, 1,
0.9545031, -0.9320843, 1.951344, 1, 1, 1, 1, 1,
0.9558912, 0.1700539, 1.140126, 1, 1, 1, 1, 1,
0.9580779, -0.2738101, 0.8751846, 1, 1, 1, 1, 1,
0.9598172, 0.8476467, 1.817674, 1, 1, 1, 1, 1,
0.9601353, -1.122805, 3.866966, 1, 1, 1, 1, 1,
0.9635831, -2.22603, 3.009676, 1, 1, 1, 1, 1,
0.9655374, 0.7312302, 1.841937, 1, 1, 1, 1, 1,
0.9691328, -0.6942187, 0.4753442, 1, 1, 1, 1, 1,
0.9709984, 1.550972, -1.278815, 1, 1, 1, 1, 1,
0.9731198, 0.4128683, 1.930376, 1, 1, 1, 1, 1,
0.9744223, 0.5114771, -0.5315719, 1, 1, 1, 1, 1,
0.9774769, 1.756965, 2.966336, 0, 0, 1, 1, 1,
0.9792734, 2.195745, 0.5998515, 1, 0, 0, 1, 1,
0.9797704, -0.1071928, 3.373895, 1, 0, 0, 1, 1,
0.9800286, -0.8914199, 1.991138, 1, 0, 0, 1, 1,
0.9819422, 0.3367369, 2.93111, 1, 0, 0, 1, 1,
0.9925067, 0.04777195, 0.6437895, 1, 0, 0, 1, 1,
0.9931054, -1.324965, 1.790056, 0, 0, 0, 1, 1,
1.003433, 0.1104917, -0.2383168, 0, 0, 0, 1, 1,
1.008694, 0.320434, 1.218709, 0, 0, 0, 1, 1,
1.009649, -0.7286248, 0.6587773, 0, 0, 0, 1, 1,
1.013885, -1.500345, 2.378388, 0, 0, 0, 1, 1,
1.015227, 0.9819354, 1.663889, 0, 0, 0, 1, 1,
1.015575, 0.9825971, 0.8380592, 0, 0, 0, 1, 1,
1.019059, -0.2576987, 2.24734, 1, 1, 1, 1, 1,
1.028753, -0.4820156, 2.422238, 1, 1, 1, 1, 1,
1.037987, -0.2391098, 2.692364, 1, 1, 1, 1, 1,
1.045609, -2.210227, 3.782806, 1, 1, 1, 1, 1,
1.045889, 1.200142, 0.1809024, 1, 1, 1, 1, 1,
1.052573, 0.9308974, 1.796022, 1, 1, 1, 1, 1,
1.053331, 0.3009696, 2.510847, 1, 1, 1, 1, 1,
1.053426, -0.7744415, -0.6013208, 1, 1, 1, 1, 1,
1.054026, -0.1163932, 3.449822, 1, 1, 1, 1, 1,
1.059826, 0.6565107, 1.408992, 1, 1, 1, 1, 1,
1.060628, 0.30833, 2.60683, 1, 1, 1, 1, 1,
1.0617, -0.7451907, 2.179765, 1, 1, 1, 1, 1,
1.063548, -0.0005747577, 1.490527, 1, 1, 1, 1, 1,
1.071789, -0.2033576, 2.79135, 1, 1, 1, 1, 1,
1.075481, 0.7880236, 1.917848, 1, 1, 1, 1, 1,
1.077706, -0.64325, 0.1754315, 0, 0, 1, 1, 1,
1.080181, 0.1280729, 3.058644, 1, 0, 0, 1, 1,
1.106238, 1.129517, 1.725908, 1, 0, 0, 1, 1,
1.11501, -1.077237, 2.041508, 1, 0, 0, 1, 1,
1.118952, -1.158621, 3.304664, 1, 0, 0, 1, 1,
1.121547, -0.9331719, 1.962122, 1, 0, 0, 1, 1,
1.123426, 0.7970969, 0.4381065, 0, 0, 0, 1, 1,
1.131199, 1.394089, -0.4014304, 0, 0, 0, 1, 1,
1.13272, -0.3408746, 1.438025, 0, 0, 0, 1, 1,
1.13275, -1.046235, 2.722295, 0, 0, 0, 1, 1,
1.137283, -0.1213126, 1.813496, 0, 0, 0, 1, 1,
1.144425, -0.3383183, 2.023278, 0, 0, 0, 1, 1,
1.154405, -1.696105, 2.408094, 0, 0, 0, 1, 1,
1.167084, -1.777061, 3.161354, 1, 1, 1, 1, 1,
1.169554, -1.150691, 0.4495851, 1, 1, 1, 1, 1,
1.171242, 0.8462712, 1.681493, 1, 1, 1, 1, 1,
1.171272, -0.5491666, 1.156951, 1, 1, 1, 1, 1,
1.17392, 0.2086494, 1.064658, 1, 1, 1, 1, 1,
1.175456, 0.4418685, 0.1286552, 1, 1, 1, 1, 1,
1.17621, -0.8879448, 1.385047, 1, 1, 1, 1, 1,
1.182645, 0.4408181, 0.9399627, 1, 1, 1, 1, 1,
1.186627, -0.1488158, 1.081476, 1, 1, 1, 1, 1,
1.193634, -1.182945, 3.178116, 1, 1, 1, 1, 1,
1.202396, 0.6300984, -0.8576591, 1, 1, 1, 1, 1,
1.202896, -1.69256, 2.04463, 1, 1, 1, 1, 1,
1.207695, -0.7190813, 0.4879038, 1, 1, 1, 1, 1,
1.213728, 0.914881, 2.150636, 1, 1, 1, 1, 1,
1.225299, 0.8437546, 2.508527, 1, 1, 1, 1, 1,
1.233534, -0.6275641, 2.75511, 0, 0, 1, 1, 1,
1.242986, 0.07939469, 1.649058, 1, 0, 0, 1, 1,
1.248517, 1.066284, 1.027303, 1, 0, 0, 1, 1,
1.262731, 0.1184931, 2.127953, 1, 0, 0, 1, 1,
1.263594, 0.786949, 2.177142, 1, 0, 0, 1, 1,
1.264007, -0.1668316, 0.6156952, 1, 0, 0, 1, 1,
1.277382, 0.5105772, 3.536805, 0, 0, 0, 1, 1,
1.281689, -0.2760054, 3.197656, 0, 0, 0, 1, 1,
1.282313, -0.5079612, 4.632198, 0, 0, 0, 1, 1,
1.306538, 1.22217, -0.0129827, 0, 0, 0, 1, 1,
1.315504, -1.42261, 1.785148, 0, 0, 0, 1, 1,
1.321341, -1.129738, 2.187352, 0, 0, 0, 1, 1,
1.332224, 1.753486, -1.468863, 0, 0, 0, 1, 1,
1.33347, 0.8515343, 0.6731156, 1, 1, 1, 1, 1,
1.333501, 0.2211473, 1.509347, 1, 1, 1, 1, 1,
1.342653, 0.3143231, 0.009504408, 1, 1, 1, 1, 1,
1.344046, 1.63226, 1.028394, 1, 1, 1, 1, 1,
1.345698, -1.614542, 1.529728, 1, 1, 1, 1, 1,
1.362716, 0.247919, 1.018161, 1, 1, 1, 1, 1,
1.368407, 0.3458998, 1.502682, 1, 1, 1, 1, 1,
1.374663, 0.02035351, 3.28865, 1, 1, 1, 1, 1,
1.387295, 0.4265425, 1.333751, 1, 1, 1, 1, 1,
1.387595, 1.068284, 0.4523481, 1, 1, 1, 1, 1,
1.394101, 0.03174816, 1.731721, 1, 1, 1, 1, 1,
1.40249, 0.09718229, 0.4622616, 1, 1, 1, 1, 1,
1.405285, -0.7696393, 1.744367, 1, 1, 1, 1, 1,
1.40843, -0.7604927, 3.001537, 1, 1, 1, 1, 1,
1.412614, 0.36621, 2.947356, 1, 1, 1, 1, 1,
1.417284, 1.222373, 1.444187, 0, 0, 1, 1, 1,
1.455981, -1.077341, 2.716299, 1, 0, 0, 1, 1,
1.461134, -1.138325, 1.366117, 1, 0, 0, 1, 1,
1.463218, 0.5588306, 0.5658789, 1, 0, 0, 1, 1,
1.47085, 0.6596909, 1.331526, 1, 0, 0, 1, 1,
1.4732, 1.209811, 0.8673702, 1, 0, 0, 1, 1,
1.475165, 1.076843, 0.8812428, 0, 0, 0, 1, 1,
1.48792, 0.6490146, 3.08086, 0, 0, 0, 1, 1,
1.491256, 0.5242217, 3.226621, 0, 0, 0, 1, 1,
1.497191, -0.1696464, 0.8655428, 0, 0, 0, 1, 1,
1.500001, -1.053472, 2.052224, 0, 0, 0, 1, 1,
1.502153, 0.1591155, 0.5348396, 0, 0, 0, 1, 1,
1.50465, -0.4229002, 1.773365, 0, 0, 0, 1, 1,
1.510539, 1.703261, 2.86681, 1, 1, 1, 1, 1,
1.518431, 0.9087818, 0.6922632, 1, 1, 1, 1, 1,
1.524399, -0.9122043, 2.116095, 1, 1, 1, 1, 1,
1.525218, -0.3048038, 1.793175, 1, 1, 1, 1, 1,
1.536763, 1.509254, 1.889716, 1, 1, 1, 1, 1,
1.555647, -0.2812666, 1.612525, 1, 1, 1, 1, 1,
1.560019, 1.230592, 1.199996, 1, 1, 1, 1, 1,
1.566955, -0.03153533, 2.29927, 1, 1, 1, 1, 1,
1.570057, -0.8316804, 1.384531, 1, 1, 1, 1, 1,
1.570206, 0.4658572, 2.18468, 1, 1, 1, 1, 1,
1.576638, 0.2825435, 2.208668, 1, 1, 1, 1, 1,
1.590625, 0.00762701, 1.859696, 1, 1, 1, 1, 1,
1.593874, 2.16974, 1.124148, 1, 1, 1, 1, 1,
1.598261, -2.615226, 2.390986, 1, 1, 1, 1, 1,
1.606082, -0.4304515, 1.937313, 1, 1, 1, 1, 1,
1.64914, -0.5422434, 2.201578, 0, 0, 1, 1, 1,
1.656332, -0.3482911, 0.7342899, 1, 0, 0, 1, 1,
1.656338, 0.6286965, -0.4130525, 1, 0, 0, 1, 1,
1.657247, 0.418652, 0.1672314, 1, 0, 0, 1, 1,
1.662653, -0.458953, 2.56473, 1, 0, 0, 1, 1,
1.666841, -1.09055, 2.789067, 1, 0, 0, 1, 1,
1.668306, -0.3398717, 2.982921, 0, 0, 0, 1, 1,
1.671691, -1.481328, 0.8409606, 0, 0, 0, 1, 1,
1.713238, -0.762886, 2.31262, 0, 0, 0, 1, 1,
1.740897, 2.452168, 1.3219, 0, 0, 0, 1, 1,
1.748876, -0.7136425, 3.641111, 0, 0, 0, 1, 1,
1.765946, -0.57218, 1.177711, 0, 0, 0, 1, 1,
1.778661, 2.420195, 0.9352227, 0, 0, 0, 1, 1,
1.813411, -1.593528, 2.725725, 1, 1, 1, 1, 1,
1.81687, -0.008341427, 1.101054, 1, 1, 1, 1, 1,
1.849815, 1.848856, 0.2326744, 1, 1, 1, 1, 1,
1.892455, 1.087898, 0.7939724, 1, 1, 1, 1, 1,
1.922947, -0.6279379, 1.547854, 1, 1, 1, 1, 1,
1.953145, -0.771666, 1.815149, 1, 1, 1, 1, 1,
2.003471, -0.4999042, 0.2995146, 1, 1, 1, 1, 1,
2.005506, -0.6408539, 2.220264, 1, 1, 1, 1, 1,
2.049219, -0.6994218, 0.6632373, 1, 1, 1, 1, 1,
2.050307, -0.07029209, 2.163871, 1, 1, 1, 1, 1,
2.080199, 0.2868076, 1.58695, 1, 1, 1, 1, 1,
2.105609, 0.6235614, -0.3112617, 1, 1, 1, 1, 1,
2.126971, 1.298402, 2.430759, 1, 1, 1, 1, 1,
2.132175, 1.274919, 1.403167, 1, 1, 1, 1, 1,
2.148896, -0.7607419, 1.12069, 1, 1, 1, 1, 1,
2.155885, -0.5282402, 2.724045, 0, 0, 1, 1, 1,
2.189786, 3.136035, 0.1625499, 1, 0, 0, 1, 1,
2.19577, -0.4862646, 1.590914, 1, 0, 0, 1, 1,
2.266261, -0.8256117, 1.843115, 1, 0, 0, 1, 1,
2.266931, 0.7779495, 0.04494146, 1, 0, 0, 1, 1,
2.289923, 0.3805565, 1.231509, 1, 0, 0, 1, 1,
2.304387, -0.8923387, 2.074471, 0, 0, 0, 1, 1,
2.30586, 0.1900656, 1.92321, 0, 0, 0, 1, 1,
2.328618, 0.5894962, 0.5847355, 0, 0, 0, 1, 1,
2.374889, 1.157685, 1.666602, 0, 0, 0, 1, 1,
2.443683, -1.519539, 0.7965004, 0, 0, 0, 1, 1,
2.464884, -0.5877871, 0.902858, 0, 0, 0, 1, 1,
2.57548, 1.450393, 0.5487778, 0, 0, 0, 1, 1,
2.582505, 0.02462257, 1.993374, 1, 1, 1, 1, 1,
2.621474, 1.223578, 2.186463, 1, 1, 1, 1, 1,
2.930208, -0.2761418, 2.175248, 1, 1, 1, 1, 1,
2.951523, 0.2614671, 1.293985, 1, 1, 1, 1, 1,
2.963424, -1.24043, 1.983384, 1, 1, 1, 1, 1,
3.287953, 0.6708305, 2.24422, 1, 1, 1, 1, 1,
3.314021, 1.149217, 0.6645728, 1, 1, 1, 1, 1
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
var radius = 9.705616;
var distance = 34.09057;
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
mvMatrix.translate( -0.2505646, 0.3735285, -0.06705928 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.09057);
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
