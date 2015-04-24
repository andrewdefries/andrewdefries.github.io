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
-3.237956, 1.165528, -1.439061, 1, 0, 0, 1,
-2.975446, -0.3634349, -1.166328, 1, 0.007843138, 0, 1,
-2.953916, -0.6125717, -2.679327, 1, 0.01176471, 0, 1,
-2.738527, 1.345574, 0.3511293, 1, 0.01960784, 0, 1,
-2.713574, -0.1369111, -3.705631, 1, 0.02352941, 0, 1,
-2.635529, 1.077922, -0.6658453, 1, 0.03137255, 0, 1,
-2.618009, -0.6833292, -1.674709, 1, 0.03529412, 0, 1,
-2.61177, -0.321043, -1.994318, 1, 0.04313726, 0, 1,
-2.540335, -0.1887118, -0.4503464, 1, 0.04705882, 0, 1,
-2.457934, 0.5766899, -1.001798, 1, 0.05490196, 0, 1,
-2.440257, 1.083571, -1.43069, 1, 0.05882353, 0, 1,
-2.416892, -0.4121788, -2.417538, 1, 0.06666667, 0, 1,
-2.39304, 0.4933043, -1.513047, 1, 0.07058824, 0, 1,
-2.39268, 0.07804397, -3.162712, 1, 0.07843138, 0, 1,
-2.303338, 1.736142, -2.410052, 1, 0.08235294, 0, 1,
-2.285205, 0.03321418, -2.635527, 1, 0.09019608, 0, 1,
-2.25261, 0.1664817, -2.635915, 1, 0.09411765, 0, 1,
-2.197069, -0.7080531, -2.829213, 1, 0.1019608, 0, 1,
-2.136937, 1.436501, -1.776956, 1, 0.1098039, 0, 1,
-2.109007, 1.609713, 0.06886046, 1, 0.1137255, 0, 1,
-2.069982, -1.155325, -1.922414, 1, 0.1215686, 0, 1,
-2.009706, 0.3812353, -2.056904, 1, 0.1254902, 0, 1,
-1.996309, 1.117048, 0.1900469, 1, 0.1333333, 0, 1,
-1.986832, -0.1028738, 0.8649755, 1, 0.1372549, 0, 1,
-1.955195, -0.1998514, -0.340357, 1, 0.145098, 0, 1,
-1.922023, 1.11366, -1.259046, 1, 0.1490196, 0, 1,
-1.897453, -0.5169303, -1.819677, 1, 0.1568628, 0, 1,
-1.874666, -2.351874, -2.989593, 1, 0.1607843, 0, 1,
-1.868827, -0.8263977, -1.950168, 1, 0.1686275, 0, 1,
-1.868506, -0.9055446, -0.4512212, 1, 0.172549, 0, 1,
-1.856118, 0.1547278, -2.916225, 1, 0.1803922, 0, 1,
-1.845534, -0.4343252, -0.401794, 1, 0.1843137, 0, 1,
-1.829881, 1.236614, 0.5621383, 1, 0.1921569, 0, 1,
-1.813948, -0.0562763, -2.332467, 1, 0.1960784, 0, 1,
-1.796816, 1.424011, 0.04688246, 1, 0.2039216, 0, 1,
-1.794505, -1.566091, -2.452809, 1, 0.2117647, 0, 1,
-1.776978, 0.8441013, -0.6202337, 1, 0.2156863, 0, 1,
-1.75544, 0.8581702, -0.6944048, 1, 0.2235294, 0, 1,
-1.746226, 1.701281, -0.5699245, 1, 0.227451, 0, 1,
-1.742453, -0.9819589, -1.676739, 1, 0.2352941, 0, 1,
-1.739786, -0.206276, -2.075162, 1, 0.2392157, 0, 1,
-1.734155, 0.1516354, -2.27891, 1, 0.2470588, 0, 1,
-1.733705, -1.701967, -1.389929, 1, 0.2509804, 0, 1,
-1.727593, 1.916083, -1.08023, 1, 0.2588235, 0, 1,
-1.726005, -2.098173, -3.221437, 1, 0.2627451, 0, 1,
-1.714394, -0.554419, -2.449162, 1, 0.2705882, 0, 1,
-1.693032, 0.8741332, -0.05967499, 1, 0.2745098, 0, 1,
-1.656142, -0.8944491, -3.36394, 1, 0.282353, 0, 1,
-1.623454, -0.4888591, 0.3182282, 1, 0.2862745, 0, 1,
-1.622667, 1.104757, -0.6732487, 1, 0.2941177, 0, 1,
-1.622084, 0.0442448, -1.658972, 1, 0.3019608, 0, 1,
-1.619703, -0.204732, -1.311058, 1, 0.3058824, 0, 1,
-1.617737, 1.111922, -2.394689, 1, 0.3137255, 0, 1,
-1.616367, 0.2177541, -1.886315, 1, 0.3176471, 0, 1,
-1.610766, 0.179482, -2.385096, 1, 0.3254902, 0, 1,
-1.60596, 0.780726, -2.554227, 1, 0.3294118, 0, 1,
-1.590974, 1.41839, 0.1536523, 1, 0.3372549, 0, 1,
-1.572606, -0.234695, -2.08827, 1, 0.3411765, 0, 1,
-1.56063, -0.02620829, -2.431154, 1, 0.3490196, 0, 1,
-1.560047, -1.096872, -2.827209, 1, 0.3529412, 0, 1,
-1.543159, -0.02165148, -0.7873777, 1, 0.3607843, 0, 1,
-1.53464, 0.2472541, -2.571205, 1, 0.3647059, 0, 1,
-1.534414, -0.7568713, -1.185295, 1, 0.372549, 0, 1,
-1.533723, 1.218651, -0.1481135, 1, 0.3764706, 0, 1,
-1.532661, 0.4127403, -1.794178, 1, 0.3843137, 0, 1,
-1.496647, -1.065341, -2.929768, 1, 0.3882353, 0, 1,
-1.488326, 1.074311, -1.883888, 1, 0.3960784, 0, 1,
-1.480134, -0.2642919, -3.492679, 1, 0.4039216, 0, 1,
-1.465702, 1.721987, 2.009915, 1, 0.4078431, 0, 1,
-1.464825, -0.362102, -2.551405, 1, 0.4156863, 0, 1,
-1.464549, -0.5697689, -2.510945, 1, 0.4196078, 0, 1,
-1.455379, 0.6414278, -0.04679235, 1, 0.427451, 0, 1,
-1.452927, 0.702236, -0.1993499, 1, 0.4313726, 0, 1,
-1.445109, -0.7455742, -2.213615, 1, 0.4392157, 0, 1,
-1.443419, -1.686371, -1.623467, 1, 0.4431373, 0, 1,
-1.438389, 0.7334929, -1.74769, 1, 0.4509804, 0, 1,
-1.438211, 0.7860846, -1.63517, 1, 0.454902, 0, 1,
-1.430702, 1.310655, -2.084928, 1, 0.4627451, 0, 1,
-1.415183, -0.6292384, -2.197889, 1, 0.4666667, 0, 1,
-1.411629, -1.778766, -1.98853, 1, 0.4745098, 0, 1,
-1.408668, 0.5176522, -1.162738, 1, 0.4784314, 0, 1,
-1.406855, 0.3244921, -1.305262, 1, 0.4862745, 0, 1,
-1.403848, -0.5811107, -1.653313, 1, 0.4901961, 0, 1,
-1.390708, -2.423078, -2.980339, 1, 0.4980392, 0, 1,
-1.387676, -1.159292, -2.869529, 1, 0.5058824, 0, 1,
-1.386961, 0.4113787, -0.4364017, 1, 0.509804, 0, 1,
-1.385733, -0.4336581, -3.472337, 1, 0.5176471, 0, 1,
-1.384308, 0.1320636, -2.331627, 1, 0.5215687, 0, 1,
-1.378739, 0.06596768, -1.916065, 1, 0.5294118, 0, 1,
-1.366929, -0.4185703, -1.690045, 1, 0.5333334, 0, 1,
-1.362445, -0.7549523, -1.785438, 1, 0.5411765, 0, 1,
-1.360813, 0.8416368, -2.235214, 1, 0.5450981, 0, 1,
-1.349748, -0.4119863, -2.634777, 1, 0.5529412, 0, 1,
-1.346137, -0.02611428, -0.7189315, 1, 0.5568628, 0, 1,
-1.343174, 1.242355, 0.4098049, 1, 0.5647059, 0, 1,
-1.338547, 0.8445704, -1.407564, 1, 0.5686275, 0, 1,
-1.328081, -0.6272846, -3.442247, 1, 0.5764706, 0, 1,
-1.323374, -0.03503469, -0.3393503, 1, 0.5803922, 0, 1,
-1.31805, 0.6776875, -3.080362, 1, 0.5882353, 0, 1,
-1.316334, -0.08920579, -4.498813, 1, 0.5921569, 0, 1,
-1.313606, -1.661536, -0.7007513, 1, 0.6, 0, 1,
-1.313275, -1.103709, -3.33015, 1, 0.6078432, 0, 1,
-1.312386, -2.271612, -1.581107, 1, 0.6117647, 0, 1,
-1.288024, -0.5096214, -2.265227, 1, 0.6196079, 0, 1,
-1.275523, 0.03398012, -1.022825, 1, 0.6235294, 0, 1,
-1.274391, -0.7097147, -0.2924847, 1, 0.6313726, 0, 1,
-1.274001, 0.5358986, -1.23683, 1, 0.6352941, 0, 1,
-1.25635, 0.7876992, -1.177439, 1, 0.6431373, 0, 1,
-1.246527, 1.184827, -1.568632, 1, 0.6470588, 0, 1,
-1.244705, 0.7502634, -1.254061, 1, 0.654902, 0, 1,
-1.233559, 0.2285947, -2.174866, 1, 0.6588235, 0, 1,
-1.222842, -1.66838, -3.761799, 1, 0.6666667, 0, 1,
-1.222795, -0.05899844, -1.018086, 1, 0.6705883, 0, 1,
-1.222453, 0.08476066, -0.5203506, 1, 0.6784314, 0, 1,
-1.221293, -0.3827452, -0.14452, 1, 0.682353, 0, 1,
-1.218422, -0.8499507, -3.151562, 1, 0.6901961, 0, 1,
-1.217923, -0.8004735, -2.715075, 1, 0.6941177, 0, 1,
-1.215494, 0.3782087, -1.168887, 1, 0.7019608, 0, 1,
-1.207468, 0.7718487, -0.3290312, 1, 0.7098039, 0, 1,
-1.202277, -0.370433, -2.403122, 1, 0.7137255, 0, 1,
-1.20083, -0.9428325, -1.213494, 1, 0.7215686, 0, 1,
-1.195249, 0.7563915, -2.291615, 1, 0.7254902, 0, 1,
-1.182971, 0.3796323, -1.939013, 1, 0.7333333, 0, 1,
-1.168315, -0.655148, -1.693454, 1, 0.7372549, 0, 1,
-1.162557, 1.224904, -0.6110407, 1, 0.7450981, 0, 1,
-1.162416, 0.7431477, -1.664395, 1, 0.7490196, 0, 1,
-1.157272, 0.3379305, -2.205667, 1, 0.7568628, 0, 1,
-1.156106, -1.003026, -3.022273, 1, 0.7607843, 0, 1,
-1.152115, 0.1432478, -0.2658822, 1, 0.7686275, 0, 1,
-1.147071, -0.8517493, -2.40556, 1, 0.772549, 0, 1,
-1.14303, 0.3683995, -0.2530867, 1, 0.7803922, 0, 1,
-1.140909, 0.4499204, 0.09766319, 1, 0.7843137, 0, 1,
-1.139433, -1.050888, -3.050325, 1, 0.7921569, 0, 1,
-1.137564, 0.2005119, -0.8972761, 1, 0.7960784, 0, 1,
-1.135889, 0.02841076, -1.040574, 1, 0.8039216, 0, 1,
-1.120897, -0.1254372, -4.146407, 1, 0.8117647, 0, 1,
-1.118366, 0.06391919, -1.43969, 1, 0.8156863, 0, 1,
-1.11575, 0.2203864, -1.267693, 1, 0.8235294, 0, 1,
-1.114398, 0.5569761, -0.2870966, 1, 0.827451, 0, 1,
-1.112069, -0.02653206, -1.967987, 1, 0.8352941, 0, 1,
-1.108742, -0.365928, -2.092441, 1, 0.8392157, 0, 1,
-1.106073, -0.579724, -2.941257, 1, 0.8470588, 0, 1,
-1.09671, 1.052778, 0.493318, 1, 0.8509804, 0, 1,
-1.091229, -0.2508582, -1.562505, 1, 0.8588235, 0, 1,
-1.07536, -2.040809, -2.910651, 1, 0.8627451, 0, 1,
-1.073642, -0.6162276, -2.611983, 1, 0.8705882, 0, 1,
-1.073122, 0.07935186, -1.275353, 1, 0.8745098, 0, 1,
-1.047435, 0.8755, -2.124071, 1, 0.8823529, 0, 1,
-1.044129, 0.5470521, -0.4290014, 1, 0.8862745, 0, 1,
-1.036377, -0.5824929, -0.1229338, 1, 0.8941177, 0, 1,
-1.030835, -2.182971, -3.798806, 1, 0.8980392, 0, 1,
-1.03049, -0.2757633, -1.928426, 1, 0.9058824, 0, 1,
-1.006505, 1.276775, 1.246952, 1, 0.9137255, 0, 1,
-1.004509, -0.0006404549, 0.01120666, 1, 0.9176471, 0, 1,
-1.001628, -0.6790849, -3.161203, 1, 0.9254902, 0, 1,
-0.9930885, -0.2003972, -2.408427, 1, 0.9294118, 0, 1,
-0.9905558, -0.7369508, -2.290472, 1, 0.9372549, 0, 1,
-0.9882478, -0.5041006, -2.599672, 1, 0.9411765, 0, 1,
-0.9858531, 1.0303, -1.397065, 1, 0.9490196, 0, 1,
-0.9809625, -0.4072005, -2.230536, 1, 0.9529412, 0, 1,
-0.9792432, 1.373146, 0.6095472, 1, 0.9607843, 0, 1,
-0.9772976, 0.4660333, -2.890407, 1, 0.9647059, 0, 1,
-0.9761394, -1.233033, -2.342633, 1, 0.972549, 0, 1,
-0.975399, 1.293578, -0.05350159, 1, 0.9764706, 0, 1,
-0.9685292, -1.954079, -4.675584, 1, 0.9843137, 0, 1,
-0.9675492, 1.748359, 0.2917615, 1, 0.9882353, 0, 1,
-0.9555293, 0.5175329, -1.012838, 1, 0.9960784, 0, 1,
-0.9489949, -0.322915, -1.444009, 0.9960784, 1, 0, 1,
-0.9483334, -0.4846116, -1.410185, 0.9921569, 1, 0, 1,
-0.9439658, -0.1961055, -2.371605, 0.9843137, 1, 0, 1,
-0.9423962, 0.242789, -1.787251, 0.9803922, 1, 0, 1,
-0.9398028, -0.02205175, -0.8234559, 0.972549, 1, 0, 1,
-0.9395089, -0.8216183, -1.327263, 0.9686275, 1, 0, 1,
-0.9381093, -0.302774, -1.505803, 0.9607843, 1, 0, 1,
-0.9355295, 0.5000708, -1.219051, 0.9568627, 1, 0, 1,
-0.9339405, 0.7086183, -0.8992618, 0.9490196, 1, 0, 1,
-0.9302256, -0.6284773, -1.925139, 0.945098, 1, 0, 1,
-0.9281954, 0.3384539, -0.4808152, 0.9372549, 1, 0, 1,
-0.9236237, -0.03288004, -1.584496, 0.9333333, 1, 0, 1,
-0.9231846, 0.2374854, -2.730671, 0.9254902, 1, 0, 1,
-0.9212646, 0.1470915, -1.143103, 0.9215686, 1, 0, 1,
-0.9202941, 1.059952, 1.061137, 0.9137255, 1, 0, 1,
-0.9086062, 0.2039671, -0.8860148, 0.9098039, 1, 0, 1,
-0.9063843, 1.133797, 0.5733268, 0.9019608, 1, 0, 1,
-0.9031296, -1.953765, -3.157829, 0.8941177, 1, 0, 1,
-0.8987485, 0.3173123, 0.2202026, 0.8901961, 1, 0, 1,
-0.8908506, -1.071953, -3.243693, 0.8823529, 1, 0, 1,
-0.88753, -1.55757, -1.602166, 0.8784314, 1, 0, 1,
-0.8758304, 0.4385439, 0.1225026, 0.8705882, 1, 0, 1,
-0.8746476, -0.2062556, 0.3706983, 0.8666667, 1, 0, 1,
-0.8729391, 0.1830195, -0.4274366, 0.8588235, 1, 0, 1,
-0.8714833, -1.040812, -2.757537, 0.854902, 1, 0, 1,
-0.8650101, 0.07323579, -2.824722, 0.8470588, 1, 0, 1,
-0.8608965, 0.3281041, -1.425046, 0.8431373, 1, 0, 1,
-0.8523704, -1.445172, -1.929311, 0.8352941, 1, 0, 1,
-0.8502747, -0.8549485, -4.200853, 0.8313726, 1, 0, 1,
-0.8452708, -1.542654, -3.22201, 0.8235294, 1, 0, 1,
-0.8441283, -0.2803857, -2.078282, 0.8196079, 1, 0, 1,
-0.8427002, 0.9932289, 0.09795319, 0.8117647, 1, 0, 1,
-0.8390949, 0.02806372, -0.5252011, 0.8078431, 1, 0, 1,
-0.8349157, -0.8723295, -2.551825, 0.8, 1, 0, 1,
-0.8246369, 0.02906279, -0.7686396, 0.7921569, 1, 0, 1,
-0.8242937, -1.884544, -4.008428, 0.7882353, 1, 0, 1,
-0.8213457, -2.134917, -2.654578, 0.7803922, 1, 0, 1,
-0.8201819, 1.030159, -0.7846216, 0.7764706, 1, 0, 1,
-0.8201203, 0.1264873, -2.4788, 0.7686275, 1, 0, 1,
-0.8174189, -0.0006240411, -1.618599, 0.7647059, 1, 0, 1,
-0.8160485, 0.8217227, -0.2412838, 0.7568628, 1, 0, 1,
-0.8149341, 0.1855065, -1.92533, 0.7529412, 1, 0, 1,
-0.81259, 0.5129696, -0.9368936, 0.7450981, 1, 0, 1,
-0.8077735, -0.01089695, -1.82883, 0.7411765, 1, 0, 1,
-0.8075121, 0.5807965, -2.120751, 0.7333333, 1, 0, 1,
-0.7952942, -1.160575, -2.287664, 0.7294118, 1, 0, 1,
-0.791724, 0.1884906, -0.1065744, 0.7215686, 1, 0, 1,
-0.7884238, 0.4294083, -0.819329, 0.7176471, 1, 0, 1,
-0.788245, -0.5258653, -1.929167, 0.7098039, 1, 0, 1,
-0.7854306, -1.133114, -1.804834, 0.7058824, 1, 0, 1,
-0.7831847, 1.042173, -1.615496, 0.6980392, 1, 0, 1,
-0.7828109, -0.316854, -1.545914, 0.6901961, 1, 0, 1,
-0.7772605, 0.5746838, -0.6954817, 0.6862745, 1, 0, 1,
-0.7762879, 1.374595, 0.2248689, 0.6784314, 1, 0, 1,
-0.772708, -0.3068123, -1.797288, 0.6745098, 1, 0, 1,
-0.7717646, 0.05574105, -1.619087, 0.6666667, 1, 0, 1,
-0.7703674, -1.287496, -1.742308, 0.6627451, 1, 0, 1,
-0.7682096, -0.006444588, -1.109511, 0.654902, 1, 0, 1,
-0.7679051, 0.3330745, -2.279457, 0.6509804, 1, 0, 1,
-0.7632504, 0.2437379, -1.492033, 0.6431373, 1, 0, 1,
-0.755966, 0.9525853, 0.1072642, 0.6392157, 1, 0, 1,
-0.7537887, -1.503065, -3.620121, 0.6313726, 1, 0, 1,
-0.7526556, -0.3094069, -3.204482, 0.627451, 1, 0, 1,
-0.7472408, -0.8761818, -3.751332, 0.6196079, 1, 0, 1,
-0.7460015, 1.271398, 0.433312, 0.6156863, 1, 0, 1,
-0.7453449, -1.013966, -2.829477, 0.6078432, 1, 0, 1,
-0.7442567, -0.5390162, -3.676378, 0.6039216, 1, 0, 1,
-0.7419628, -1.229635, -3.006071, 0.5960785, 1, 0, 1,
-0.7388961, -0.6974233, -2.439888, 0.5882353, 1, 0, 1,
-0.7343609, 0.3165587, -0.8562663, 0.5843138, 1, 0, 1,
-0.7250897, 0.07967591, -1.50412, 0.5764706, 1, 0, 1,
-0.724586, 0.2998696, -3.317091, 0.572549, 1, 0, 1,
-0.7225533, -1.025499, -1.842232, 0.5647059, 1, 0, 1,
-0.7024503, -0.13345, -1.361756, 0.5607843, 1, 0, 1,
-0.6989707, 1.293196, -0.8200273, 0.5529412, 1, 0, 1,
-0.6957024, -0.840421, -2.856438, 0.5490196, 1, 0, 1,
-0.6953267, -0.9732194, -3.496998, 0.5411765, 1, 0, 1,
-0.6934636, 0.6407189, -1.918602, 0.5372549, 1, 0, 1,
-0.6898813, 0.7399666, -0.7217938, 0.5294118, 1, 0, 1,
-0.6867696, 0.7004179, -0.06878666, 0.5254902, 1, 0, 1,
-0.6846951, 1.015925, -1.53633, 0.5176471, 1, 0, 1,
-0.6818627, 0.2244472, -0.4575821, 0.5137255, 1, 0, 1,
-0.6807622, 0.3285665, 1.426605, 0.5058824, 1, 0, 1,
-0.6700435, -0.4531731, -1.435012, 0.5019608, 1, 0, 1,
-0.6690233, -0.910621, -2.451052, 0.4941176, 1, 0, 1,
-0.663306, -0.4837516, -3.010967, 0.4862745, 1, 0, 1,
-0.6544908, 0.8857955, -1.190279, 0.4823529, 1, 0, 1,
-0.6533808, 1.507923, -0.4965209, 0.4745098, 1, 0, 1,
-0.652696, 1.246107, -0.7467306, 0.4705882, 1, 0, 1,
-0.6512136, -0.8202627, -4.150724, 0.4627451, 1, 0, 1,
-0.6475045, -0.3044569, -1.655705, 0.4588235, 1, 0, 1,
-0.6470647, -1.137691, -3.450133, 0.4509804, 1, 0, 1,
-0.6300122, 1.378803, -1.304171, 0.4470588, 1, 0, 1,
-0.6253366, -0.9009222, -2.201886, 0.4392157, 1, 0, 1,
-0.6249056, -0.5221725, -1.175386, 0.4352941, 1, 0, 1,
-0.624734, 0.1790151, 0.2661643, 0.427451, 1, 0, 1,
-0.6222286, -0.8425904, -3.473982, 0.4235294, 1, 0, 1,
-0.6198352, -0.4116614, -2.716893, 0.4156863, 1, 0, 1,
-0.6136165, -0.5250542, -4.508453, 0.4117647, 1, 0, 1,
-0.6132618, 0.4995521, -0.8490857, 0.4039216, 1, 0, 1,
-0.6116645, 0.2995039, -0.3938604, 0.3960784, 1, 0, 1,
-0.6109648, 1.425592, 1.853208, 0.3921569, 1, 0, 1,
-0.61053, -0.2961879, -1.190844, 0.3843137, 1, 0, 1,
-0.610469, -1.899289, -1.666085, 0.3803922, 1, 0, 1,
-0.6040782, 0.08135592, -1.936773, 0.372549, 1, 0, 1,
-0.6028032, 0.05398217, -1.553479, 0.3686275, 1, 0, 1,
-0.6012405, 0.08516465, -2.217587, 0.3607843, 1, 0, 1,
-0.596297, -0.3767784, -2.631073, 0.3568628, 1, 0, 1,
-0.5919183, -0.9547638, -4.446347, 0.3490196, 1, 0, 1,
-0.5898963, -0.01818529, -0.9562683, 0.345098, 1, 0, 1,
-0.5897208, -1.741229, -2.021672, 0.3372549, 1, 0, 1,
-0.5889044, 0.8439779, -1.755498, 0.3333333, 1, 0, 1,
-0.5852931, 2.113911, -1.563699, 0.3254902, 1, 0, 1,
-0.584313, -0.189626, -2.472523, 0.3215686, 1, 0, 1,
-0.5840936, 0.1477437, -1.498747, 0.3137255, 1, 0, 1,
-0.5732218, -0.2377165, -2.88496, 0.3098039, 1, 0, 1,
-0.5696439, -2.209995, -6.367213, 0.3019608, 1, 0, 1,
-0.5654865, 0.9044436, 0.07371901, 0.2941177, 1, 0, 1,
-0.5637556, -0.5406959, -2.372644, 0.2901961, 1, 0, 1,
-0.5602041, -0.6149546, -2.728598, 0.282353, 1, 0, 1,
-0.5591826, -0.8468603, -3.162143, 0.2784314, 1, 0, 1,
-0.554088, -1.271857, -1.781959, 0.2705882, 1, 0, 1,
-0.553448, 0.7806887, -2.995651, 0.2666667, 1, 0, 1,
-0.5519718, 0.04891289, -1.440245, 0.2588235, 1, 0, 1,
-0.5515503, 0.5540457, -1.322432, 0.254902, 1, 0, 1,
-0.5496244, 0.511911, -0.9961189, 0.2470588, 1, 0, 1,
-0.5478023, 0.9146548, 0.1843613, 0.2431373, 1, 0, 1,
-0.5426114, -0.5278738, -3.160173, 0.2352941, 1, 0, 1,
-0.5422259, 2.186332, -0.2460965, 0.2313726, 1, 0, 1,
-0.5403048, -0.6408825, -2.399921, 0.2235294, 1, 0, 1,
-0.5278221, 1.773467, -0.3026122, 0.2196078, 1, 0, 1,
-0.5233505, 0.894742, -1.080854, 0.2117647, 1, 0, 1,
-0.5220996, -0.6784169, -0.9252892, 0.2078431, 1, 0, 1,
-0.5185171, -1.231292, -2.043809, 0.2, 1, 0, 1,
-0.5125433, -1.035029, -3.613423, 0.1921569, 1, 0, 1,
-0.5121262, 0.7862438, -1.094043, 0.1882353, 1, 0, 1,
-0.5121027, 0.3251435, -0.8896071, 0.1803922, 1, 0, 1,
-0.5105567, 0.9185072, -1.727976, 0.1764706, 1, 0, 1,
-0.5105371, 1.075696, 0.6236132, 0.1686275, 1, 0, 1,
-0.5101066, -0.07448949, -2.671391, 0.1647059, 1, 0, 1,
-0.5050963, 0.6657764, 0.3214757, 0.1568628, 1, 0, 1,
-0.5050178, -0.3793297, -1.293594, 0.1529412, 1, 0, 1,
-0.5024431, 1.812696, 0.1699612, 0.145098, 1, 0, 1,
-0.4987292, -0.2928055, -1.665083, 0.1411765, 1, 0, 1,
-0.4939988, -1.458583, -3.052774, 0.1333333, 1, 0, 1,
-0.4907095, -0.5804405, -2.426387, 0.1294118, 1, 0, 1,
-0.4888076, 0.3207435, -2.366278, 0.1215686, 1, 0, 1,
-0.4878889, 1.727467, 0.1695997, 0.1176471, 1, 0, 1,
-0.4869513, -0.4391436, -2.151588, 0.1098039, 1, 0, 1,
-0.4840323, -0.7668694, -2.245696, 0.1058824, 1, 0, 1,
-0.4831631, -1.140433, -2.993316, 0.09803922, 1, 0, 1,
-0.4718651, 1.635583, -0.0211019, 0.09019608, 1, 0, 1,
-0.470217, 0.5688295, -0.6006725, 0.08627451, 1, 0, 1,
-0.4665134, 0.7157624, -1.343098, 0.07843138, 1, 0, 1,
-0.46297, 0.8107204, -2.324256, 0.07450981, 1, 0, 1,
-0.4588828, -1.295155, -1.90898, 0.06666667, 1, 0, 1,
-0.4562263, -0.2146266, -0.2330398, 0.0627451, 1, 0, 1,
-0.4527653, -1.597146, -1.72014, 0.05490196, 1, 0, 1,
-0.4508908, 1.051044, -0.4100112, 0.05098039, 1, 0, 1,
-0.4443138, -1.200284, -3.172909, 0.04313726, 1, 0, 1,
-0.4418392, 1.119798, -1.389655, 0.03921569, 1, 0, 1,
-0.4373424, -0.1200625, -2.309506, 0.03137255, 1, 0, 1,
-0.4277881, 0.9883237, -0.07413266, 0.02745098, 1, 0, 1,
-0.424232, 1.408535, -0.8500101, 0.01960784, 1, 0, 1,
-0.4202088, 1.14893, 0.2599362, 0.01568628, 1, 0, 1,
-0.4195349, 2.426584, 0.7474667, 0.007843138, 1, 0, 1,
-0.4147845, -1.829782, -4.376265, 0.003921569, 1, 0, 1,
-0.4132682, 0.1444283, -0.775781, 0, 1, 0.003921569, 1,
-0.4124287, 0.9927453, 0.01169428, 0, 1, 0.01176471, 1,
-0.4121756, 1.018028, -0.23644, 0, 1, 0.01568628, 1,
-0.411964, 0.2076259, -2.100557, 0, 1, 0.02352941, 1,
-0.4114621, -2.047281, -4.077858, 0, 1, 0.02745098, 1,
-0.4105086, 1.002893, 0.5499456, 0, 1, 0.03529412, 1,
-0.4054859, -1.241049, -2.649715, 0, 1, 0.03921569, 1,
-0.4022779, 1.500077, -1.468867, 0, 1, 0.04705882, 1,
-0.4002732, -0.7548955, -3.808541, 0, 1, 0.05098039, 1,
-0.3994954, -1.769325, -4.120819, 0, 1, 0.05882353, 1,
-0.3976825, -1.699773, -2.303196, 0, 1, 0.0627451, 1,
-0.3951309, 0.4620681, -0.1853555, 0, 1, 0.07058824, 1,
-0.3925474, 1.09452, -0.6037737, 0, 1, 0.07450981, 1,
-0.3923998, 0.8876732, -1.615611, 0, 1, 0.08235294, 1,
-0.3918075, -1.330623, -1.422914, 0, 1, 0.08627451, 1,
-0.3918023, -1.311988, -2.760898, 0, 1, 0.09411765, 1,
-0.390553, -2.037578, -0.5550832, 0, 1, 0.1019608, 1,
-0.3890842, -0.4577681, -0.1437888, 0, 1, 0.1058824, 1,
-0.3875798, 0.6620364, -1.763264, 0, 1, 0.1137255, 1,
-0.3853697, 0.6931787, -0.8123908, 0, 1, 0.1176471, 1,
-0.3811269, -0.3177091, -2.48388, 0, 1, 0.1254902, 1,
-0.3807404, -0.4179373, -4.039065, 0, 1, 0.1294118, 1,
-0.3786473, 0.9121071, -2.308617, 0, 1, 0.1372549, 1,
-0.3766211, -0.2349433, -2.944581, 0, 1, 0.1411765, 1,
-0.3712782, -0.02879506, 0.898146, 0, 1, 0.1490196, 1,
-0.3697974, 0.2898248, -1.396855, 0, 1, 0.1529412, 1,
-0.3539239, -0.07912108, -0.8372396, 0, 1, 0.1607843, 1,
-0.3534905, -1.522661, -2.069731, 0, 1, 0.1647059, 1,
-0.3521335, -0.5801286, -2.056428, 0, 1, 0.172549, 1,
-0.3501844, -0.1683968, -2.222448, 0, 1, 0.1764706, 1,
-0.3493657, -0.7887077, -2.540971, 0, 1, 0.1843137, 1,
-0.3474612, -0.6022354, -2.992846, 0, 1, 0.1882353, 1,
-0.3457489, 0.1687988, -0.05449515, 0, 1, 0.1960784, 1,
-0.3424885, -0.5761163, -2.493617, 0, 1, 0.2039216, 1,
-0.3417743, 0.9056055, -0.3369244, 0, 1, 0.2078431, 1,
-0.3312172, -0.2494146, -2.813859, 0, 1, 0.2156863, 1,
-0.329925, 0.7059138, -0.9299453, 0, 1, 0.2196078, 1,
-0.328793, -0.6412035, -2.892128, 0, 1, 0.227451, 1,
-0.3263828, 0.003889636, -0.5388021, 0, 1, 0.2313726, 1,
-0.3230494, -0.05662949, -1.554639, 0, 1, 0.2392157, 1,
-0.3228969, 0.6969356, 0.2095286, 0, 1, 0.2431373, 1,
-0.3228043, -0.0634594, -4.249425, 0, 1, 0.2509804, 1,
-0.3212792, -1.260528, -2.562014, 0, 1, 0.254902, 1,
-0.3188382, -0.7707378, -3.675761, 0, 1, 0.2627451, 1,
-0.3114288, 1.20651, -0.1572316, 0, 1, 0.2666667, 1,
-0.3095519, 0.4860624, -0.1100172, 0, 1, 0.2745098, 1,
-0.3058718, -1.571285, -3.165317, 0, 1, 0.2784314, 1,
-0.3057296, 1.137566, -0.8124464, 0, 1, 0.2862745, 1,
-0.2992387, -0.7660258, -3.468134, 0, 1, 0.2901961, 1,
-0.2975097, -1.157283, -4.01092, 0, 1, 0.2980392, 1,
-0.294444, 1.070399, -1.904613, 0, 1, 0.3058824, 1,
-0.2927866, 0.2355157, -1.201388, 0, 1, 0.3098039, 1,
-0.2919253, -0.550908, -2.657825, 0, 1, 0.3176471, 1,
-0.2898126, -0.9529492, -4.278219, 0, 1, 0.3215686, 1,
-0.2890942, -0.07335707, -2.876088, 0, 1, 0.3294118, 1,
-0.2854374, 0.6126279, -1.065839, 0, 1, 0.3333333, 1,
-0.2828565, -1.666432, -2.832367, 0, 1, 0.3411765, 1,
-0.2826773, -0.1922744, -0.8505419, 0, 1, 0.345098, 1,
-0.2821751, -0.1105883, -2.544993, 0, 1, 0.3529412, 1,
-0.2797016, -0.1970178, -3.111363, 0, 1, 0.3568628, 1,
-0.2734893, 0.3011645, -2.526455, 0, 1, 0.3647059, 1,
-0.2706988, -0.1698161, -1.392722, 0, 1, 0.3686275, 1,
-0.2679055, -0.0968575, 0.1874189, 0, 1, 0.3764706, 1,
-0.2668234, -0.3420611, -3.462702, 0, 1, 0.3803922, 1,
-0.2659316, 0.07297842, -0.1172806, 0, 1, 0.3882353, 1,
-0.2658419, 1.104015, -0.09073573, 0, 1, 0.3921569, 1,
-0.2648807, 0.2057563, 0.1038011, 0, 1, 0.4, 1,
-0.2637776, 0.1238276, -0.5850015, 0, 1, 0.4078431, 1,
-0.2561627, -0.3115981, -2.973769, 0, 1, 0.4117647, 1,
-0.2536474, -0.2040235, -2.179226, 0, 1, 0.4196078, 1,
-0.2534091, 0.1942941, -0.5155755, 0, 1, 0.4235294, 1,
-0.2519526, 0.5900223, 1.248405, 0, 1, 0.4313726, 1,
-0.250254, 0.02749948, -2.558809, 0, 1, 0.4352941, 1,
-0.2419712, 0.6925777, 0.8390667, 0, 1, 0.4431373, 1,
-0.2417067, 0.1765252, -3.011504, 0, 1, 0.4470588, 1,
-0.2417053, -0.1728582, -1.678448, 0, 1, 0.454902, 1,
-0.2389992, -0.04058224, -2.420825, 0, 1, 0.4588235, 1,
-0.238026, -1.385074, -0.9216976, 0, 1, 0.4666667, 1,
-0.234565, -0.4844287, -3.541524, 0, 1, 0.4705882, 1,
-0.2321618, 0.06669607, -1.491832, 0, 1, 0.4784314, 1,
-0.2252203, 1.689896, -0.0340361, 0, 1, 0.4823529, 1,
-0.2237091, 1.457772, -0.4695431, 0, 1, 0.4901961, 1,
-0.2117184, -1.194895, -3.517676, 0, 1, 0.4941176, 1,
-0.2051106, 2.198418, -0.2592723, 0, 1, 0.5019608, 1,
-0.202205, -1.349302, -3.31168, 0, 1, 0.509804, 1,
-0.2019492, -0.809839, -4.55669, 0, 1, 0.5137255, 1,
-0.2003086, -1.008316, -4.127063, 0, 1, 0.5215687, 1,
-0.1970579, -1.689792, -2.362202, 0, 1, 0.5254902, 1,
-0.1890759, -0.01158632, -3.652525, 0, 1, 0.5333334, 1,
-0.1855932, 0.6591408, 0.5970258, 0, 1, 0.5372549, 1,
-0.1840019, -0.5081481, -3.208595, 0, 1, 0.5450981, 1,
-0.1794057, -0.3784992, -1.670184, 0, 1, 0.5490196, 1,
-0.1750482, -0.9547119, -3.170044, 0, 1, 0.5568628, 1,
-0.1746034, 0.6361793, -0.8611091, 0, 1, 0.5607843, 1,
-0.1714835, -0.3964088, -3.296962, 0, 1, 0.5686275, 1,
-0.1708288, -0.9614281, -2.284127, 0, 1, 0.572549, 1,
-0.1604328, -0.9680289, -2.544536, 0, 1, 0.5803922, 1,
-0.1558707, -0.778456, -2.057202, 0, 1, 0.5843138, 1,
-0.1541403, 0.6535403, 1.69075, 0, 1, 0.5921569, 1,
-0.1539314, 0.4338565, 0.4775006, 0, 1, 0.5960785, 1,
-0.1511316, -1.391136, -3.300984, 0, 1, 0.6039216, 1,
-0.1509523, 0.5799368, -0.7158793, 0, 1, 0.6117647, 1,
-0.1490397, -1.309855, -1.92317, 0, 1, 0.6156863, 1,
-0.1461824, 0.7694961, -1.258709, 0, 1, 0.6235294, 1,
-0.1411705, -0.7998793, -2.801596, 0, 1, 0.627451, 1,
-0.1342126, 0.6585677, -1.130327, 0, 1, 0.6352941, 1,
-0.1333572, 0.4923892, 1.08844, 0, 1, 0.6392157, 1,
-0.1292095, -1.602808, -3.4983, 0, 1, 0.6470588, 1,
-0.127773, 0.1360933, -0.09437404, 0, 1, 0.6509804, 1,
-0.1275733, -2.647014, -2.117986, 0, 1, 0.6588235, 1,
-0.1275597, -0.9718389, -2.816095, 0, 1, 0.6627451, 1,
-0.1214551, 0.8012999, -0.6502061, 0, 1, 0.6705883, 1,
-0.1201297, 0.05804651, -1.265008, 0, 1, 0.6745098, 1,
-0.1200443, -0.7898965, -2.629431, 0, 1, 0.682353, 1,
-0.1188525, 0.03482869, -2.559824, 0, 1, 0.6862745, 1,
-0.1176767, -2.222547, -2.633281, 0, 1, 0.6941177, 1,
-0.1168031, 0.1944388, -0.7138581, 0, 1, 0.7019608, 1,
-0.1152702, 0.2673282, -1.149722, 0, 1, 0.7058824, 1,
-0.114692, 0.8983487, -1.524365, 0, 1, 0.7137255, 1,
-0.1112278, -0.3271385, -1.651282, 0, 1, 0.7176471, 1,
-0.1080822, -0.9936759, -3.166556, 0, 1, 0.7254902, 1,
-0.1032979, 1.071022, 0.8025933, 0, 1, 0.7294118, 1,
-0.09858663, 1.485367, 0.05836698, 0, 1, 0.7372549, 1,
-0.09817659, -0.8055449, -0.3801006, 0, 1, 0.7411765, 1,
-0.09799216, 0.2145224, -1.469715, 0, 1, 0.7490196, 1,
-0.09662592, -0.6518639, -3.943848, 0, 1, 0.7529412, 1,
-0.09103562, 1.124594, 0.2551228, 0, 1, 0.7607843, 1,
-0.08993465, 0.07020722, 0.6001802, 0, 1, 0.7647059, 1,
-0.08473581, -0.9118912, -4.544004, 0, 1, 0.772549, 1,
-0.08252902, -0.7664772, -1.090733, 0, 1, 0.7764706, 1,
-0.08178206, 1.052078, 1.104303, 0, 1, 0.7843137, 1,
-0.08149937, -0.7039592, -3.2503, 0, 1, 0.7882353, 1,
-0.08023243, 0.560442, 1.889968, 0, 1, 0.7960784, 1,
-0.07870342, 1.052161, 1.843892, 0, 1, 0.8039216, 1,
-0.07275566, -1.05444, -3.069469, 0, 1, 0.8078431, 1,
-0.0691131, 0.8407134, -0.2377028, 0, 1, 0.8156863, 1,
-0.06257674, -1.167082, -3.734619, 0, 1, 0.8196079, 1,
-0.06074712, 1.175667, -0.9274503, 0, 1, 0.827451, 1,
-0.05890941, -1.300169, -1.954884, 0, 1, 0.8313726, 1,
-0.05779551, 0.6154759, 1.674389, 0, 1, 0.8392157, 1,
-0.05205316, 0.4518447, -1.765293, 0, 1, 0.8431373, 1,
-0.05065304, -0.3578067, -2.780007, 0, 1, 0.8509804, 1,
-0.04778759, -0.7781029, -3.493873, 0, 1, 0.854902, 1,
-0.04510868, 0.08171492, 0.1712131, 0, 1, 0.8627451, 1,
-0.04485124, 1.766459, 0.7134175, 0, 1, 0.8666667, 1,
-0.04463718, -0.8019408, -3.763471, 0, 1, 0.8745098, 1,
-0.04303358, -0.1975891, -3.218848, 0, 1, 0.8784314, 1,
-0.0417668, 1.486406, -1.747746, 0, 1, 0.8862745, 1,
-0.04002386, -0.9984612, -3.936545, 0, 1, 0.8901961, 1,
-0.03177822, 0.7526961, 0.8786922, 0, 1, 0.8980392, 1,
-0.03152606, -1.204036, -3.670095, 0, 1, 0.9058824, 1,
-0.03119978, 0.2775252, 0.1619874, 0, 1, 0.9098039, 1,
-0.02722692, 0.2798428, 0.1642643, 0, 1, 0.9176471, 1,
-0.02557345, -0.1054157, -3.437671, 0, 1, 0.9215686, 1,
-0.02443389, 1.949753, 0.1581297, 0, 1, 0.9294118, 1,
-0.02423462, 0.3563962, -1.21753, 0, 1, 0.9333333, 1,
-0.02377409, 0.6381021, -1.269793, 0, 1, 0.9411765, 1,
-0.0213208, 0.2741249, -0.7259262, 0, 1, 0.945098, 1,
-0.01742886, -1.429591, -3.349868, 0, 1, 0.9529412, 1,
-0.01732513, 0.4990661, -0.9402081, 0, 1, 0.9568627, 1,
-0.01168885, -0.9438527, -0.5275643, 0, 1, 0.9647059, 1,
-0.0114875, 0.3860143, -0.6614602, 0, 1, 0.9686275, 1,
-0.005765982, 0.7246263, -1.874154, 0, 1, 0.9764706, 1,
-0.003914407, 0.9414812, 1.323747, 0, 1, 0.9803922, 1,
-0.003441588, 1.200108, 0.8931109, 0, 1, 0.9882353, 1,
0.00929656, 0.6448607, 0.5748875, 0, 1, 0.9921569, 1,
0.01475614, 0.6715455, -1.899951, 0, 1, 1, 1,
0.01962725, 1.786804, 0.7464656, 0, 0.9921569, 1, 1,
0.01967814, -0.7465249, 3.087027, 0, 0.9882353, 1, 1,
0.02118982, -0.83639, 2.940475, 0, 0.9803922, 1, 1,
0.02158334, 0.4286717, 0.3515894, 0, 0.9764706, 1, 1,
0.02200425, 0.3794475, 0.8634477, 0, 0.9686275, 1, 1,
0.02286303, -0.7876613, 1.418295, 0, 0.9647059, 1, 1,
0.02847544, 1.208887, 1.031208, 0, 0.9568627, 1, 1,
0.02880186, 1.200838, -1.862501, 0, 0.9529412, 1, 1,
0.03307838, 1.34569, 1.52158, 0, 0.945098, 1, 1,
0.03451035, 1.71713, -0.8454422, 0, 0.9411765, 1, 1,
0.03524699, 1.6403, 0.6209162, 0, 0.9333333, 1, 1,
0.03592313, 0.8308574, 0.1745014, 0, 0.9294118, 1, 1,
0.03802787, -0.6030427, 3.367996, 0, 0.9215686, 1, 1,
0.04335508, 0.9720084, 1.816912, 0, 0.9176471, 1, 1,
0.04672246, 0.1280836, -0.4103449, 0, 0.9098039, 1, 1,
0.05361742, -0.5774872, 3.021604, 0, 0.9058824, 1, 1,
0.06282298, -0.8384729, 1.163159, 0, 0.8980392, 1, 1,
0.06820529, -0.4892735, 2.749137, 0, 0.8901961, 1, 1,
0.07074612, 0.07003554, 1.850943, 0, 0.8862745, 1, 1,
0.07218556, -1.003057, 2.63043, 0, 0.8784314, 1, 1,
0.07403095, -0.2062132, 2.365282, 0, 0.8745098, 1, 1,
0.078591, -0.4769116, 3.55441, 0, 0.8666667, 1, 1,
0.08029646, -1.707873, 3.013073, 0, 0.8627451, 1, 1,
0.08256611, -1.054223, 0.7073944, 0, 0.854902, 1, 1,
0.08411036, -0.5221518, 3.463092, 0, 0.8509804, 1, 1,
0.08562247, -0.5938846, 3.372527, 0, 0.8431373, 1, 1,
0.08608819, -0.467387, 2.938376, 0, 0.8392157, 1, 1,
0.08784203, -0.7891489, 3.697828, 0, 0.8313726, 1, 1,
0.08835234, -1.34075, 2.276558, 0, 0.827451, 1, 1,
0.08840626, 0.3720486, 0.04696923, 0, 0.8196079, 1, 1,
0.08852596, -0.9150074, 2.891269, 0, 0.8156863, 1, 1,
0.08915874, 0.5131866, 0.3714224, 0, 0.8078431, 1, 1,
0.08936828, 0.2218102, -0.9562489, 0, 0.8039216, 1, 1,
0.08954918, -0.5817937, 3.969203, 0, 0.7960784, 1, 1,
0.0947555, 0.9442495, -1.543665, 0, 0.7882353, 1, 1,
0.09579267, 0.647828, 0.9283212, 0, 0.7843137, 1, 1,
0.09635356, 0.4719785, 1.243575, 0, 0.7764706, 1, 1,
0.09705599, 0.333691, -0.1261601, 0, 0.772549, 1, 1,
0.1081535, 0.8637113, 0.9949824, 0, 0.7647059, 1, 1,
0.11038, 0.1526363, 1.451058, 0, 0.7607843, 1, 1,
0.1142477, 0.8937004, 0.4342545, 0, 0.7529412, 1, 1,
0.1236964, 0.04054903, 2.897596, 0, 0.7490196, 1, 1,
0.1273105, 0.6506057, 0.05919818, 0, 0.7411765, 1, 1,
0.1288158, -1.017023, 3.331761, 0, 0.7372549, 1, 1,
0.1321409, 0.3733305, -1.028319, 0, 0.7294118, 1, 1,
0.1325249, 3.378981, -1.740849, 0, 0.7254902, 1, 1,
0.1327563, -0.6536145, 2.264976, 0, 0.7176471, 1, 1,
0.1356244, -0.9334707, 3.563677, 0, 0.7137255, 1, 1,
0.1376525, -1.463932, 2.494731, 0, 0.7058824, 1, 1,
0.1401444, -0.3375733, 2.712055, 0, 0.6980392, 1, 1,
0.1446944, -1.967505, 2.612957, 0, 0.6941177, 1, 1,
0.147476, -0.3607299, 3.900651, 0, 0.6862745, 1, 1,
0.1500704, -0.311213, 0.4167183, 0, 0.682353, 1, 1,
0.1540546, 1.287421, 0.5223291, 0, 0.6745098, 1, 1,
0.155384, -0.3004823, 2.746945, 0, 0.6705883, 1, 1,
0.1590171, -1.139396, 4.564392, 0, 0.6627451, 1, 1,
0.1596957, -0.5055373, 1.752587, 0, 0.6588235, 1, 1,
0.1629498, 0.4391768, 0.6587278, 0, 0.6509804, 1, 1,
0.1649152, -1.570877, 3.16555, 0, 0.6470588, 1, 1,
0.1674127, 1.337841, 0.417211, 0, 0.6392157, 1, 1,
0.1686443, -0.6631966, 3.868148, 0, 0.6352941, 1, 1,
0.1689226, -0.09485111, 2.74472, 0, 0.627451, 1, 1,
0.1698988, -1.473862, 3.601064, 0, 0.6235294, 1, 1,
0.1768647, 0.8103582, 0.5533333, 0, 0.6156863, 1, 1,
0.1810703, 0.9969037, 0.4234802, 0, 0.6117647, 1, 1,
0.1818242, 0.816178, 0.5161048, 0, 0.6039216, 1, 1,
0.1820361, 0.1752767, -0.2738551, 0, 0.5960785, 1, 1,
0.1823806, -2.406449, 3.689818, 0, 0.5921569, 1, 1,
0.1848156, -0.7986707, 2.667764, 0, 0.5843138, 1, 1,
0.1888714, -0.5568764, 2.914293, 0, 0.5803922, 1, 1,
0.1915661, -1.641641, 2.901542, 0, 0.572549, 1, 1,
0.1943941, -0.3791137, 3.799795, 0, 0.5686275, 1, 1,
0.196041, 0.4576577, -0.4873306, 0, 0.5607843, 1, 1,
0.2000516, -0.07492725, 1.105623, 0, 0.5568628, 1, 1,
0.2004384, -0.76262, 3.630581, 0, 0.5490196, 1, 1,
0.2015039, -0.5302765, 2.785702, 0, 0.5450981, 1, 1,
0.2052524, 0.2481214, 0.9235268, 0, 0.5372549, 1, 1,
0.2054736, -0.5827509, 1.22025, 0, 0.5333334, 1, 1,
0.2079027, -0.8540973, 2.08381, 0, 0.5254902, 1, 1,
0.2084509, -0.4949314, 3.316274, 0, 0.5215687, 1, 1,
0.212588, 0.4092607, 1.037102, 0, 0.5137255, 1, 1,
0.2138035, 0.1487989, -0.1287717, 0, 0.509804, 1, 1,
0.2144258, 0.06607641, 0.0726918, 0, 0.5019608, 1, 1,
0.2191702, -0.9149197, 2.981112, 0, 0.4941176, 1, 1,
0.2198734, 1.17081, 0.2931507, 0, 0.4901961, 1, 1,
0.2199452, -0.4316176, 3.275612, 0, 0.4823529, 1, 1,
0.2222805, 0.3266889, 1.666306, 0, 0.4784314, 1, 1,
0.2254675, -1.148873, 2.616764, 0, 0.4705882, 1, 1,
0.2259162, 0.3756888, 1.762914, 0, 0.4666667, 1, 1,
0.2272274, -0.4582073, 1.734528, 0, 0.4588235, 1, 1,
0.2286168, 1.865697, 1.086873, 0, 0.454902, 1, 1,
0.2300436, 2.778648, 0.209355, 0, 0.4470588, 1, 1,
0.2319858, -0.1190863, 2.397908, 0, 0.4431373, 1, 1,
0.2321421, -0.4834307, 1.860137, 0, 0.4352941, 1, 1,
0.2359466, 0.4487732, -0.8328897, 0, 0.4313726, 1, 1,
0.2377737, -1.086532, 3.382547, 0, 0.4235294, 1, 1,
0.2434857, 2.328698, -0.9537303, 0, 0.4196078, 1, 1,
0.2495599, -0.5379406, 5.239193, 0, 0.4117647, 1, 1,
0.2554289, -1.594127, 3.079669, 0, 0.4078431, 1, 1,
0.2554595, 0.3537177, -0.8066648, 0, 0.4, 1, 1,
0.260286, -1.780273, 2.589904, 0, 0.3921569, 1, 1,
0.2605771, 0.2557741, 0.7723141, 0, 0.3882353, 1, 1,
0.2639423, 1.803891, 1.925605, 0, 0.3803922, 1, 1,
0.2670809, 0.4524468, 1.810641, 0, 0.3764706, 1, 1,
0.2829589, -0.0646248, 2.428678, 0, 0.3686275, 1, 1,
0.283289, 0.09620611, -0.2229805, 0, 0.3647059, 1, 1,
0.283447, 0.8813808, -0.184937, 0, 0.3568628, 1, 1,
0.2885882, -0.7981318, 1.604215, 0, 0.3529412, 1, 1,
0.2907056, 0.07163505, 0.5114242, 0, 0.345098, 1, 1,
0.2921475, 0.3095429, 0.1807641, 0, 0.3411765, 1, 1,
0.2958926, -0.1940596, 3.09306, 0, 0.3333333, 1, 1,
0.2962674, -1.427307, 3.010289, 0, 0.3294118, 1, 1,
0.3083139, -0.9385665, 1.670118, 0, 0.3215686, 1, 1,
0.3160512, 0.7056603, -0.6284624, 0, 0.3176471, 1, 1,
0.3162767, 0.9155664, 1.223208, 0, 0.3098039, 1, 1,
0.3168615, 2.041951, 0.6652114, 0, 0.3058824, 1, 1,
0.3192495, -0.003966719, 0.7393847, 0, 0.2980392, 1, 1,
0.3229203, 1.043481, -0.4425442, 0, 0.2901961, 1, 1,
0.3251982, -0.223883, 2.693843, 0, 0.2862745, 1, 1,
0.3274513, 0.9148375, 0.8357815, 0, 0.2784314, 1, 1,
0.3303131, -0.3726622, 2.810163, 0, 0.2745098, 1, 1,
0.3336224, 0.6991733, 0.7033518, 0, 0.2666667, 1, 1,
0.3398019, 0.01964387, 2.034674, 0, 0.2627451, 1, 1,
0.3420827, -0.3227889, 4.785808, 0, 0.254902, 1, 1,
0.3424716, -1.901201, 3.586265, 0, 0.2509804, 1, 1,
0.343018, -0.9328368, 4.208273, 0, 0.2431373, 1, 1,
0.3471629, 0.6711161, 1.65178, 0, 0.2392157, 1, 1,
0.3476419, 0.2494097, 1.024675, 0, 0.2313726, 1, 1,
0.3487136, 0.3297691, 0.01675524, 0, 0.227451, 1, 1,
0.3514607, -0.03881198, 1.051452, 0, 0.2196078, 1, 1,
0.3515775, 0.2472574, 1.228234, 0, 0.2156863, 1, 1,
0.3541248, 1.586906, 0.8238131, 0, 0.2078431, 1, 1,
0.3573189, -1.374636, 2.970409, 0, 0.2039216, 1, 1,
0.3574726, -0.6505625, 1.285193, 0, 0.1960784, 1, 1,
0.3585972, 0.635108, 0.165964, 0, 0.1882353, 1, 1,
0.3647545, -0.640199, 3.249884, 0, 0.1843137, 1, 1,
0.3657451, -0.1794224, 0.8389291, 0, 0.1764706, 1, 1,
0.3661228, 1.48711, 1.470603, 0, 0.172549, 1, 1,
0.3663587, 0.04091525, 2.701601, 0, 0.1647059, 1, 1,
0.3682512, 0.2462543, 0.1409221, 0, 0.1607843, 1, 1,
0.3690991, -0.7046602, 2.731771, 0, 0.1529412, 1, 1,
0.3843146, -1.659749, 2.18259, 0, 0.1490196, 1, 1,
0.3874846, -0.5720196, 3.452737, 0, 0.1411765, 1, 1,
0.3909357, -0.9280954, 3.244324, 0, 0.1372549, 1, 1,
0.3918552, -0.6741532, 1.973264, 0, 0.1294118, 1, 1,
0.396156, 0.1376054, -1.30368, 0, 0.1254902, 1, 1,
0.3976046, -0.466941, 1.843115, 0, 0.1176471, 1, 1,
0.4051666, -0.472516, 2.940727, 0, 0.1137255, 1, 1,
0.4080517, 0.9943287, 0.2533469, 0, 0.1058824, 1, 1,
0.4116169, -2.175333, 3.350098, 0, 0.09803922, 1, 1,
0.4124186, -0.8181437, 3.125845, 0, 0.09411765, 1, 1,
0.4125157, -0.6732582, 0.7352101, 0, 0.08627451, 1, 1,
0.4143638, -0.2350855, 3.075513, 0, 0.08235294, 1, 1,
0.4184389, 0.225173, 2.215898, 0, 0.07450981, 1, 1,
0.4207943, -0.1532283, 0.3333711, 0, 0.07058824, 1, 1,
0.4229811, 2.703127, -0.1854079, 0, 0.0627451, 1, 1,
0.4260145, -0.6196229, 1.033309, 0, 0.05882353, 1, 1,
0.4280737, 1.026541, 1.296071, 0, 0.05098039, 1, 1,
0.429492, -0.9448349, 3.770655, 0, 0.04705882, 1, 1,
0.4313343, 1.238064, 0.05749218, 0, 0.03921569, 1, 1,
0.4319695, -0.1475705, 0.167821, 0, 0.03529412, 1, 1,
0.4320993, 0.7762815, -0.8341811, 0, 0.02745098, 1, 1,
0.4395366, -0.02515822, 0.5094081, 0, 0.02352941, 1, 1,
0.4418628, -1.026657, 2.606112, 0, 0.01568628, 1, 1,
0.4425878, -1.585848, 1.752186, 0, 0.01176471, 1, 1,
0.4446167, 1.308894, 1.2339, 0, 0.003921569, 1, 1,
0.4565725, 0.4067518, 1.422535, 0.003921569, 0, 1, 1,
0.4618508, -0.0428809, 1.452942, 0.007843138, 0, 1, 1,
0.4628155, -1.019575, 2.628126, 0.01568628, 0, 1, 1,
0.4633584, 0.08705845, 2.954108, 0.01960784, 0, 1, 1,
0.4642448, -0.5701467, 2.541744, 0.02745098, 0, 1, 1,
0.4647304, -0.9339364, 3.043869, 0.03137255, 0, 1, 1,
0.4671178, -0.6529061, 1.570665, 0.03921569, 0, 1, 1,
0.4691376, 0.4001094, 0.1025478, 0.04313726, 0, 1, 1,
0.4776348, -0.4651192, 2.238604, 0.05098039, 0, 1, 1,
0.4780075, -0.7449691, 3.616379, 0.05490196, 0, 1, 1,
0.4806146, -0.7467248, 2.04751, 0.0627451, 0, 1, 1,
0.4815623, 0.5862772, 1.86006, 0.06666667, 0, 1, 1,
0.4829199, 0.1203271, 0.9386496, 0.07450981, 0, 1, 1,
0.4849512, 0.1014002, 0.9658983, 0.07843138, 0, 1, 1,
0.485724, -0.03213883, 2.510097, 0.08627451, 0, 1, 1,
0.4909691, 0.4206513, 1.36962, 0.09019608, 0, 1, 1,
0.4941866, -2.874973, 4.679821, 0.09803922, 0, 1, 1,
0.4986144, -0.1784003, 2.854413, 0.1058824, 0, 1, 1,
0.4988649, -2.390109, 2.773882, 0.1098039, 0, 1, 1,
0.5045887, 0.2669786, 0.6699533, 0.1176471, 0, 1, 1,
0.5052026, 0.3454846, 1.248568, 0.1215686, 0, 1, 1,
0.5052037, -1.296625, 2.704819, 0.1294118, 0, 1, 1,
0.5063991, -0.8227705, 3.250832, 0.1333333, 0, 1, 1,
0.5111869, -1.015666, 1.703038, 0.1411765, 0, 1, 1,
0.5152174, -0.6077189, 2.446647, 0.145098, 0, 1, 1,
0.5226701, 1.050527, 0.960005, 0.1529412, 0, 1, 1,
0.5241558, -0.7682746, 2.273185, 0.1568628, 0, 1, 1,
0.526756, 0.364524, 2.877073, 0.1647059, 0, 1, 1,
0.5377182, 1.189046, 1.743582, 0.1686275, 0, 1, 1,
0.5388211, 1.266642, 0.6906005, 0.1764706, 0, 1, 1,
0.5411775, 0.3413273, 1.337542, 0.1803922, 0, 1, 1,
0.5447956, -0.0861514, 0.9131145, 0.1882353, 0, 1, 1,
0.5452824, -0.2068841, 1.483865, 0.1921569, 0, 1, 1,
0.5454464, -0.9157187, 3.381985, 0.2, 0, 1, 1,
0.5469655, 0.419015, 1.329837, 0.2078431, 0, 1, 1,
0.5482329, -0.2172982, 2.318254, 0.2117647, 0, 1, 1,
0.553717, 0.5581664, 1.239826, 0.2196078, 0, 1, 1,
0.5562608, -0.0746194, 1.053423, 0.2235294, 0, 1, 1,
0.5563403, -0.1316359, 4.30212, 0.2313726, 0, 1, 1,
0.5585849, 0.2070616, 0.2974471, 0.2352941, 0, 1, 1,
0.5586303, -0.4894513, 3.096797, 0.2431373, 0, 1, 1,
0.5588077, 0.1387816, 1.733007, 0.2470588, 0, 1, 1,
0.5592129, 0.06663192, 0.5867386, 0.254902, 0, 1, 1,
0.5621016, 0.2215653, 1.068761, 0.2588235, 0, 1, 1,
0.5692981, 0.6975304, 0.5933635, 0.2666667, 0, 1, 1,
0.5813768, 0.8383762, 0.06881859, 0.2705882, 0, 1, 1,
0.5830216, 1.796826, 0.0795387, 0.2784314, 0, 1, 1,
0.5840371, 0.1309957, 1.785558, 0.282353, 0, 1, 1,
0.5868844, -0.5553212, 2.374151, 0.2901961, 0, 1, 1,
0.5876377, -0.8568533, 0.5621954, 0.2941177, 0, 1, 1,
0.5950974, 0.4625837, 0.8686804, 0.3019608, 0, 1, 1,
0.5987257, 0.8609881, 0.2526442, 0.3098039, 0, 1, 1,
0.5995609, 0.1968763, 0.7598796, 0.3137255, 0, 1, 1,
0.6052816, -1.577377, 3.127443, 0.3215686, 0, 1, 1,
0.605917, 0.5916942, 0.897117, 0.3254902, 0, 1, 1,
0.6071885, 0.9745002, 0.3112511, 0.3333333, 0, 1, 1,
0.6104938, 0.9808592, 4.280575, 0.3372549, 0, 1, 1,
0.6118965, 1.906859, 1.056065, 0.345098, 0, 1, 1,
0.6123415, -0.1640793, 2.310521, 0.3490196, 0, 1, 1,
0.613391, -0.8233219, 3.498945, 0.3568628, 0, 1, 1,
0.6137294, 0.2655021, 1.329949, 0.3607843, 0, 1, 1,
0.6142572, -0.3951462, 1.378602, 0.3686275, 0, 1, 1,
0.6170011, 0.3408451, 0.04993828, 0.372549, 0, 1, 1,
0.6186811, 0.5796663, 1.850083, 0.3803922, 0, 1, 1,
0.6190264, -1.452506, 2.193821, 0.3843137, 0, 1, 1,
0.6217634, 0.2815813, 0.0008991326, 0.3921569, 0, 1, 1,
0.6235286, -0.1211048, 1.102542, 0.3960784, 0, 1, 1,
0.628503, 1.77205, 0.3323833, 0.4039216, 0, 1, 1,
0.6358458, -2.18753, 4.078625, 0.4117647, 0, 1, 1,
0.6368035, 1.069035, -0.02820265, 0.4156863, 0, 1, 1,
0.6387927, 0.2170149, 0.910863, 0.4235294, 0, 1, 1,
0.642872, -1.136177, 1.600175, 0.427451, 0, 1, 1,
0.645014, 0.1409762, 1.055472, 0.4352941, 0, 1, 1,
0.6465603, 1.038346, -0.07720976, 0.4392157, 0, 1, 1,
0.6501122, 1.31533, -0.192393, 0.4470588, 0, 1, 1,
0.650305, -0.6867627, 2.642984, 0.4509804, 0, 1, 1,
0.6528928, -0.3803903, 2.310607, 0.4588235, 0, 1, 1,
0.657801, 0.0246097, 2.779913, 0.4627451, 0, 1, 1,
0.6584153, 0.5484083, 0.4316851, 0.4705882, 0, 1, 1,
0.6585739, 0.7014261, 0.9776474, 0.4745098, 0, 1, 1,
0.6621307, -0.4256308, 2.245905, 0.4823529, 0, 1, 1,
0.6622123, 0.07638563, 1.167914, 0.4862745, 0, 1, 1,
0.6622517, 0.5933968, 1.005204, 0.4941176, 0, 1, 1,
0.6635066, 1.391835, -0.09685431, 0.5019608, 0, 1, 1,
0.6669506, -0.3623934, 1.1251, 0.5058824, 0, 1, 1,
0.6708099, -0.4787877, 1.681159, 0.5137255, 0, 1, 1,
0.6727572, -0.9059852, 2.642939, 0.5176471, 0, 1, 1,
0.6765188, 1.257687, 0.5322489, 0.5254902, 0, 1, 1,
0.6776571, -1.143865, 3.990741, 0.5294118, 0, 1, 1,
0.6798224, -0.2467113, 1.946691, 0.5372549, 0, 1, 1,
0.693363, 0.3864064, 1.431335, 0.5411765, 0, 1, 1,
0.6935538, 1.808147, -2.300276, 0.5490196, 0, 1, 1,
0.6975669, -0.5385052, 0.5223588, 0.5529412, 0, 1, 1,
0.7043622, 1.043252, -0.07168641, 0.5607843, 0, 1, 1,
0.7081089, -1.432608, 2.752667, 0.5647059, 0, 1, 1,
0.7140799, -0.8229431, 3.030628, 0.572549, 0, 1, 1,
0.7149326, 1.024512, -0.04652298, 0.5764706, 0, 1, 1,
0.7199135, 0.7502339, 1.063461, 0.5843138, 0, 1, 1,
0.7242694, -1.732418, 3.224686, 0.5882353, 0, 1, 1,
0.7256491, -0.6501514, 3.831499, 0.5960785, 0, 1, 1,
0.7266959, 1.234774, 1.537251, 0.6039216, 0, 1, 1,
0.7375745, 0.3569062, 1.091985, 0.6078432, 0, 1, 1,
0.7400615, 2.081295, -0.2061132, 0.6156863, 0, 1, 1,
0.7426614, -0.2830622, 2.268629, 0.6196079, 0, 1, 1,
0.7427905, -0.388328, 1.08201, 0.627451, 0, 1, 1,
0.7436209, -0.3117496, 1.818956, 0.6313726, 0, 1, 1,
0.7455841, -0.4979368, 3.248853, 0.6392157, 0, 1, 1,
0.75612, -0.432794, 2.964215, 0.6431373, 0, 1, 1,
0.7574978, -0.6553482, 1.703234, 0.6509804, 0, 1, 1,
0.7602014, 2.264355, 1.118203, 0.654902, 0, 1, 1,
0.7617232, 0.4512302, 1.164237, 0.6627451, 0, 1, 1,
0.7695541, 0.08480616, -0.1094834, 0.6666667, 0, 1, 1,
0.7701413, -0.6892883, 1.39376, 0.6745098, 0, 1, 1,
0.7706845, 0.3995597, 1.500813, 0.6784314, 0, 1, 1,
0.7748769, -0.8299235, 2.74286, 0.6862745, 0, 1, 1,
0.7765651, -0.9004074, 3.293465, 0.6901961, 0, 1, 1,
0.7928374, -0.5112842, 4.226748, 0.6980392, 0, 1, 1,
0.7957186, -0.9831758, 3.688443, 0.7058824, 0, 1, 1,
0.7977378, 0.6932614, 1.678983, 0.7098039, 0, 1, 1,
0.7979388, 0.549064, 0.7686045, 0.7176471, 0, 1, 1,
0.7996132, 0.2647614, 1.389589, 0.7215686, 0, 1, 1,
0.7999377, -0.03271338, 1.733372, 0.7294118, 0, 1, 1,
0.811636, 0.7314172, 0.8092759, 0.7333333, 0, 1, 1,
0.8254344, -2.007475, 0.7192293, 0.7411765, 0, 1, 1,
0.8327225, -0.7095052, 1.767098, 0.7450981, 0, 1, 1,
0.8369147, 1.707034, 1.501517, 0.7529412, 0, 1, 1,
0.8384898, 0.4567535, 1.38683, 0.7568628, 0, 1, 1,
0.842935, -0.1680442, 2.044161, 0.7647059, 0, 1, 1,
0.843705, 0.8435403, -0.5212623, 0.7686275, 0, 1, 1,
0.8449466, -1.06597, 2.345117, 0.7764706, 0, 1, 1,
0.8478477, -0.1361644, 3.45932, 0.7803922, 0, 1, 1,
0.8517784, -0.573308, 2.099451, 0.7882353, 0, 1, 1,
0.8539831, 2.415367, 0.2167483, 0.7921569, 0, 1, 1,
0.8612626, -0.9063252, 2.649247, 0.8, 0, 1, 1,
0.8621818, 0.7307001, 0.4077948, 0.8078431, 0, 1, 1,
0.8666567, -1.31118, 2.508462, 0.8117647, 0, 1, 1,
0.867814, 2.498926, 1.02065, 0.8196079, 0, 1, 1,
0.8697014, -1.602424, 3.091274, 0.8235294, 0, 1, 1,
0.8697994, 0.02301005, 0.3136311, 0.8313726, 0, 1, 1,
0.8713953, 0.5436739, 0.9189115, 0.8352941, 0, 1, 1,
0.8762816, -1.185432, 1.751741, 0.8431373, 0, 1, 1,
0.8815519, -0.8588781, 2.2077, 0.8470588, 0, 1, 1,
0.8880724, -0.651589, 2.292809, 0.854902, 0, 1, 1,
0.8894543, -1.507802, 3.613403, 0.8588235, 0, 1, 1,
0.8903248, -0.7034988, 2.30719, 0.8666667, 0, 1, 1,
0.8909519, 0.11597, 1.654618, 0.8705882, 0, 1, 1,
0.8912898, 0.03090908, 1.955134, 0.8784314, 0, 1, 1,
0.8951049, -2.501471, 3.16245, 0.8823529, 0, 1, 1,
0.8972626, 1.385575, 0.3514641, 0.8901961, 0, 1, 1,
0.8992605, -0.2111127, 1.675245, 0.8941177, 0, 1, 1,
0.9030427, -1.306665, 3.730688, 0.9019608, 0, 1, 1,
0.9036574, -1.191857, 0.9723461, 0.9098039, 0, 1, 1,
0.9093218, -0.01068313, 3.075758, 0.9137255, 0, 1, 1,
0.9106312, -0.386455, 2.725433, 0.9215686, 0, 1, 1,
0.9123699, 2.383238, 0.9252514, 0.9254902, 0, 1, 1,
0.9133957, -0.5579494, 1.864119, 0.9333333, 0, 1, 1,
0.9226334, 1.267711, 1.191301, 0.9372549, 0, 1, 1,
0.9311755, -1.042538, 2.843542, 0.945098, 0, 1, 1,
0.9380336, -0.4001941, 0.9922492, 0.9490196, 0, 1, 1,
0.9446648, -0.8512728, 2.215708, 0.9568627, 0, 1, 1,
0.9598699, -0.2064067, 1.378232, 0.9607843, 0, 1, 1,
0.9711679, 0.4553246, 1.572055, 0.9686275, 0, 1, 1,
0.9736174, 2.27373, 1.263536, 0.972549, 0, 1, 1,
0.9768329, -1.101166, 2.086223, 0.9803922, 0, 1, 1,
0.9801359, -0.3100913, 5.29774, 0.9843137, 0, 1, 1,
0.9813794, -1.41995, 1.792352, 0.9921569, 0, 1, 1,
0.9885289, -0.6634583, 1.643706, 0.9960784, 0, 1, 1,
0.988797, -0.3731243, 2.553119, 1, 0, 0.9960784, 1,
0.992103, 0.2271129, 2.522316, 1, 0, 0.9882353, 1,
0.9940506, 0.3155574, 2.168669, 1, 0, 0.9843137, 1,
0.9955304, -0.7887657, 0.4083545, 1, 0, 0.9764706, 1,
0.9985645, 1.300377, 0.4772608, 1, 0, 0.972549, 1,
0.9988802, -0.6175514, 2.185354, 1, 0, 0.9647059, 1,
1.005884, -1.02054, 1.616023, 1, 0, 0.9607843, 1,
1.009497, -0.8953605, 2.912864, 1, 0, 0.9529412, 1,
1.011226, -1.668786, 2.311143, 1, 0, 0.9490196, 1,
1.011737, -0.5954406, 2.664598, 1, 0, 0.9411765, 1,
1.013429, 0.6673583, 2.548775, 1, 0, 0.9372549, 1,
1.016115, -1.562018, 1.764759, 1, 0, 0.9294118, 1,
1.016466, 0.3763564, 0.9570442, 1, 0, 0.9254902, 1,
1.021127, -0.1656531, 0.8041143, 1, 0, 0.9176471, 1,
1.022787, 0.5307368, 1.966184, 1, 0, 0.9137255, 1,
1.030635, 0.5604125, -0.110469, 1, 0, 0.9058824, 1,
1.031937, 0.5210769, 0.1872171, 1, 0, 0.9019608, 1,
1.03385, -0.03194367, 1.512957, 1, 0, 0.8941177, 1,
1.0341, -0.7666544, 2.548139, 1, 0, 0.8862745, 1,
1.03723, -1.286973, 2.858278, 1, 0, 0.8823529, 1,
1.046756, 0.2653506, -0.7252579, 1, 0, 0.8745098, 1,
1.048594, -0.009338261, 0.478716, 1, 0, 0.8705882, 1,
1.050774, 0.7970108, -0.3260185, 1, 0, 0.8627451, 1,
1.053293, 0.789887, 1.241321, 1, 0, 0.8588235, 1,
1.066349, -1.931832, 2.470865, 1, 0, 0.8509804, 1,
1.067173, 0.5671501, 1.464394, 1, 0, 0.8470588, 1,
1.067336, 0.3475997, 2.399922, 1, 0, 0.8392157, 1,
1.072739, 0.9128076, 0.3579522, 1, 0, 0.8352941, 1,
1.074154, 0.9569519, 0.02558219, 1, 0, 0.827451, 1,
1.074536, 1.332415, 1.853859, 1, 0, 0.8235294, 1,
1.074755, 0.07768323, 1.955019, 1, 0, 0.8156863, 1,
1.097318, 0.300854, 1.676337, 1, 0, 0.8117647, 1,
1.104053, 0.3897471, 0.9602115, 1, 0, 0.8039216, 1,
1.104227, 0.8932521, 1.061255, 1, 0, 0.7960784, 1,
1.109956, -0.1176465, 3.975677, 1, 0, 0.7921569, 1,
1.111155, 1.231527, -0.6794276, 1, 0, 0.7843137, 1,
1.124882, 0.1374477, 3.212905, 1, 0, 0.7803922, 1,
1.130294, 1.220601, 0.3875618, 1, 0, 0.772549, 1,
1.1328, -0.1377026, 2.341633, 1, 0, 0.7686275, 1,
1.134975, 1.379154, -0.1605539, 1, 0, 0.7607843, 1,
1.135143, -2.060923, 2.684797, 1, 0, 0.7568628, 1,
1.13584, -1.109642, 4.964322, 1, 0, 0.7490196, 1,
1.14017, -0.1139576, 1.998095, 1, 0, 0.7450981, 1,
1.152831, -0.1945289, 2.102351, 1, 0, 0.7372549, 1,
1.153592, 0.7158313, 0.2828285, 1, 0, 0.7333333, 1,
1.154934, -0.1246568, 2.286187, 1, 0, 0.7254902, 1,
1.162229, 0.4633379, -0.350463, 1, 0, 0.7215686, 1,
1.162846, 0.7401592, 1.560798, 1, 0, 0.7137255, 1,
1.166942, -1.645131, 2.57122, 1, 0, 0.7098039, 1,
1.170436, -1.109751, 1.705858, 1, 0, 0.7019608, 1,
1.181755, 0.7152033, -0.3137074, 1, 0, 0.6941177, 1,
1.183147, -2.181376, 1.900154, 1, 0, 0.6901961, 1,
1.203845, 0.3186873, 1.490003, 1, 0, 0.682353, 1,
1.205725, -1.11211, 1.693904, 1, 0, 0.6784314, 1,
1.212765, -0.722626, 1.774203, 1, 0, 0.6705883, 1,
1.215682, -0.3344241, 1.670896, 1, 0, 0.6666667, 1,
1.220915, -1.579128, 2.630001, 1, 0, 0.6588235, 1,
1.225024, 0.1102904, 0.9360321, 1, 0, 0.654902, 1,
1.232217, 0.9507719, 1.9797, 1, 0, 0.6470588, 1,
1.234955, 1.280013, -0.1307203, 1, 0, 0.6431373, 1,
1.243272, -1.266095, 3.272357, 1, 0, 0.6352941, 1,
1.249903, 1.30652, 0.8346588, 1, 0, 0.6313726, 1,
1.25234, -0.1189752, 1.968268, 1, 0, 0.6235294, 1,
1.258408, -0.8857612, 2.66766, 1, 0, 0.6196079, 1,
1.264958, 0.3751428, 0.6288743, 1, 0, 0.6117647, 1,
1.272211, -0.04838447, 2.676783, 1, 0, 0.6078432, 1,
1.276269, -0.9322295, 0.5886445, 1, 0, 0.6, 1,
1.2819, 0.7220391, 0.07099713, 1, 0, 0.5921569, 1,
1.29217, -0.1340711, 1.619595, 1, 0, 0.5882353, 1,
1.296089, -0.8670668, 1.68851, 1, 0, 0.5803922, 1,
1.298439, -0.2265993, 0.676754, 1, 0, 0.5764706, 1,
1.301188, 1.91368, 1.079644, 1, 0, 0.5686275, 1,
1.303897, 0.0883101, 4.19396, 1, 0, 0.5647059, 1,
1.305167, -0.06895491, 2.066562, 1, 0, 0.5568628, 1,
1.308715, -0.2162519, 1.074403, 1, 0, 0.5529412, 1,
1.30902, -1.856111, 3.045552, 1, 0, 0.5450981, 1,
1.313074, -0.3519317, 4.04651, 1, 0, 0.5411765, 1,
1.323465, -0.5820894, 1.874058, 1, 0, 0.5333334, 1,
1.328811, 0.6545192, 1.050782, 1, 0, 0.5294118, 1,
1.339895, -1.368043, 2.714243, 1, 0, 0.5215687, 1,
1.340008, -2.113623, 3.519666, 1, 0, 0.5176471, 1,
1.353828, 0.7042083, 1.10534, 1, 0, 0.509804, 1,
1.355803, 0.5059056, -1.602127, 1, 0, 0.5058824, 1,
1.356019, 1.165242, -0.8200235, 1, 0, 0.4980392, 1,
1.358804, 1.242672, 2.095219, 1, 0, 0.4901961, 1,
1.361832, 0.9809135, 1.315784, 1, 0, 0.4862745, 1,
1.36333, 0.3820322, -0.2293633, 1, 0, 0.4784314, 1,
1.370855, 0.05793651, -1.082858, 1, 0, 0.4745098, 1,
1.376022, 0.1457684, 1.536602, 1, 0, 0.4666667, 1,
1.377272, -1.908515, 2.63854, 1, 0, 0.4627451, 1,
1.377438, 0.2363295, 1.080266, 1, 0, 0.454902, 1,
1.382787, -1.153945, 1.416685, 1, 0, 0.4509804, 1,
1.395969, 0.008613996, 1.987207, 1, 0, 0.4431373, 1,
1.410936, 0.4956745, 1.829424, 1, 0, 0.4392157, 1,
1.411531, -0.1309116, 0.6929592, 1, 0, 0.4313726, 1,
1.420079, 1.173657, -0.01520231, 1, 0, 0.427451, 1,
1.426324, 1.274247, -1.486171, 1, 0, 0.4196078, 1,
1.432491, -0.5358518, 2.884348, 1, 0, 0.4156863, 1,
1.435107, 1.638342, 0.8070037, 1, 0, 0.4078431, 1,
1.435728, -0.197226, 0.5579234, 1, 0, 0.4039216, 1,
1.449255, -0.2660915, 3.438051, 1, 0, 0.3960784, 1,
1.451416, 0.6719279, 0.01828914, 1, 0, 0.3882353, 1,
1.453532, -2.220994, 1.954336, 1, 0, 0.3843137, 1,
1.458719, 0.964229, 0.329714, 1, 0, 0.3764706, 1,
1.468179, 0.8392772, 1.887938, 1, 0, 0.372549, 1,
1.475184, 0.9659625, 1.153368, 1, 0, 0.3647059, 1,
1.479547, -0.7774935, 2.491232, 1, 0, 0.3607843, 1,
1.48006, 0.8821978, 0.4502362, 1, 0, 0.3529412, 1,
1.480736, 0.9157589, 1.730402, 1, 0, 0.3490196, 1,
1.493824, 1.136647, 1.246614, 1, 0, 0.3411765, 1,
1.50008, 2.112642, -0.3932119, 1, 0, 0.3372549, 1,
1.502719, -0.4263147, 2.565778, 1, 0, 0.3294118, 1,
1.503911, 0.1810315, 1.737588, 1, 0, 0.3254902, 1,
1.505075, -1.599824, 2.86093, 1, 0, 0.3176471, 1,
1.545872, -0.01972392, 1.48449, 1, 0, 0.3137255, 1,
1.558488, -1.399963, 3.162075, 1, 0, 0.3058824, 1,
1.558594, 0.6618727, -0.718028, 1, 0, 0.2980392, 1,
1.574396, 0.3157276, 1.030348, 1, 0, 0.2941177, 1,
1.610157, -1.149882, 1.456842, 1, 0, 0.2862745, 1,
1.624363, 0.3322318, 2.723949, 1, 0, 0.282353, 1,
1.655406, -0.7771148, 1.459969, 1, 0, 0.2745098, 1,
1.659043, 0.3617755, 1.672892, 1, 0, 0.2705882, 1,
1.66235, 0.6525152, 2.852884, 1, 0, 0.2627451, 1,
1.676204, 0.9518252, 0.8725216, 1, 0, 0.2588235, 1,
1.692131, -0.2588632, 0.7528917, 1, 0, 0.2509804, 1,
1.697007, -0.4952926, 1.822417, 1, 0, 0.2470588, 1,
1.707002, 0.6328213, 1.282729, 1, 0, 0.2392157, 1,
1.728114, -1.10191, 1.548346, 1, 0, 0.2352941, 1,
1.736135, -1.26774, 1.338511, 1, 0, 0.227451, 1,
1.758553, -0.5120634, 4.838419, 1, 0, 0.2235294, 1,
1.770137, 1.33513, 0.3671273, 1, 0, 0.2156863, 1,
1.781316, -0.9501724, 2.626695, 1, 0, 0.2117647, 1,
1.788782, 2.014055, 1.226087, 1, 0, 0.2039216, 1,
1.792839, -1.000419, 2.756346, 1, 0, 0.1960784, 1,
1.799141, 0.7988006, 2.923393, 1, 0, 0.1921569, 1,
1.815153, 2.025624, -0.438141, 1, 0, 0.1843137, 1,
1.847473, 0.7994599, 1.737746, 1, 0, 0.1803922, 1,
1.886114, 1.65296, 3.195533, 1, 0, 0.172549, 1,
1.895252, 0.761391, 1.043151, 1, 0, 0.1686275, 1,
1.926524, -0.8402007, 2.748485, 1, 0, 0.1607843, 1,
1.93545, 2.164392, 3.294758, 1, 0, 0.1568628, 1,
1.9365, 0.01665096, 0.5473655, 1, 0, 0.1490196, 1,
1.939692, 1.959715, 0.3645529, 1, 0, 0.145098, 1,
1.95694, 2.315349, 0.2545451, 1, 0, 0.1372549, 1,
1.967037, 1.79519, 1.181012, 1, 0, 0.1333333, 1,
2.070159, 1.144543, 1.003683, 1, 0, 0.1254902, 1,
2.099623, 0.3860366, 0.1611873, 1, 0, 0.1215686, 1,
2.148496, -0.7255052, 1.309297, 1, 0, 0.1137255, 1,
2.167809, -0.5913088, 1.472833, 1, 0, 0.1098039, 1,
2.21978, -1.139105, 1.772208, 1, 0, 0.1019608, 1,
2.25667, -0.5115564, 1.662275, 1, 0, 0.09411765, 1,
2.270995, 0.8189248, 2.353808, 1, 0, 0.09019608, 1,
2.294536, -0.7858171, 0.1431949, 1, 0, 0.08235294, 1,
2.366767, 0.06917113, 3.711169, 1, 0, 0.07843138, 1,
2.368883, -0.7547038, 3.131457, 1, 0, 0.07058824, 1,
2.384326, -0.303133, 0.8371199, 1, 0, 0.06666667, 1,
2.438934, -1.372722, 1.53275, 1, 0, 0.05882353, 1,
2.44133, 0.1738864, 1.694258, 1, 0, 0.05490196, 1,
2.463777, 0.684342, 1.418632, 1, 0, 0.04705882, 1,
2.46994, -0.2340661, 1.959331, 1, 0, 0.04313726, 1,
2.627568, 1.128016, 2.981546, 1, 0, 0.03529412, 1,
2.64418, 0.3898821, -0.217142, 1, 0, 0.03137255, 1,
2.665204, -0.04357197, 2.633642, 1, 0, 0.02352941, 1,
2.733416, 1.467226, 1.080892, 1, 0, 0.01960784, 1,
2.912401, 0.7002109, -0.4001395, 1, 0, 0.01176471, 1,
3.073091, -0.7024819, 0.5192807, 1, 0, 0.007843138, 1
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
-0.08243251, -3.935018, -8.344423, 0, -0.5, 0.5, 0.5,
-0.08243251, -3.935018, -8.344423, 1, -0.5, 0.5, 0.5,
-0.08243251, -3.935018, -8.344423, 1, 1.5, 0.5, 0.5,
-0.08243251, -3.935018, -8.344423, 0, 1.5, 0.5, 0.5
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
-4.307678, 0.2520039, -8.344423, 0, -0.5, 0.5, 0.5,
-4.307678, 0.2520039, -8.344423, 1, -0.5, 0.5, 0.5,
-4.307678, 0.2520039, -8.344423, 1, 1.5, 0.5, 0.5,
-4.307678, 0.2520039, -8.344423, 0, 1.5, 0.5, 0.5
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
-4.307678, -3.935018, -0.5347366, 0, -0.5, 0.5, 0.5,
-4.307678, -3.935018, -0.5347366, 1, -0.5, 0.5, 0.5,
-4.307678, -3.935018, -0.5347366, 1, 1.5, 0.5, 0.5,
-4.307678, -3.935018, -0.5347366, 0, 1.5, 0.5, 0.5
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
-3, -2.968782, -6.542188,
3, -2.968782, -6.542188,
-3, -2.968782, -6.542188,
-3, -3.129822, -6.84256,
-2, -2.968782, -6.542188,
-2, -3.129822, -6.84256,
-1, -2.968782, -6.542188,
-1, -3.129822, -6.84256,
0, -2.968782, -6.542188,
0, -3.129822, -6.84256,
1, -2.968782, -6.542188,
1, -3.129822, -6.84256,
2, -2.968782, -6.542188,
2, -3.129822, -6.84256,
3, -2.968782, -6.542188,
3, -3.129822, -6.84256
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
-3, -3.4519, -7.443305, 0, -0.5, 0.5, 0.5,
-3, -3.4519, -7.443305, 1, -0.5, 0.5, 0.5,
-3, -3.4519, -7.443305, 1, 1.5, 0.5, 0.5,
-3, -3.4519, -7.443305, 0, 1.5, 0.5, 0.5,
-2, -3.4519, -7.443305, 0, -0.5, 0.5, 0.5,
-2, -3.4519, -7.443305, 1, -0.5, 0.5, 0.5,
-2, -3.4519, -7.443305, 1, 1.5, 0.5, 0.5,
-2, -3.4519, -7.443305, 0, 1.5, 0.5, 0.5,
-1, -3.4519, -7.443305, 0, -0.5, 0.5, 0.5,
-1, -3.4519, -7.443305, 1, -0.5, 0.5, 0.5,
-1, -3.4519, -7.443305, 1, 1.5, 0.5, 0.5,
-1, -3.4519, -7.443305, 0, 1.5, 0.5, 0.5,
0, -3.4519, -7.443305, 0, -0.5, 0.5, 0.5,
0, -3.4519, -7.443305, 1, -0.5, 0.5, 0.5,
0, -3.4519, -7.443305, 1, 1.5, 0.5, 0.5,
0, -3.4519, -7.443305, 0, 1.5, 0.5, 0.5,
1, -3.4519, -7.443305, 0, -0.5, 0.5, 0.5,
1, -3.4519, -7.443305, 1, -0.5, 0.5, 0.5,
1, -3.4519, -7.443305, 1, 1.5, 0.5, 0.5,
1, -3.4519, -7.443305, 0, 1.5, 0.5, 0.5,
2, -3.4519, -7.443305, 0, -0.5, 0.5, 0.5,
2, -3.4519, -7.443305, 1, -0.5, 0.5, 0.5,
2, -3.4519, -7.443305, 1, 1.5, 0.5, 0.5,
2, -3.4519, -7.443305, 0, 1.5, 0.5, 0.5,
3, -3.4519, -7.443305, 0, -0.5, 0.5, 0.5,
3, -3.4519, -7.443305, 1, -0.5, 0.5, 0.5,
3, -3.4519, -7.443305, 1, 1.5, 0.5, 0.5,
3, -3.4519, -7.443305, 0, 1.5, 0.5, 0.5
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
-3.332622, -2, -6.542188,
-3.332622, 3, -6.542188,
-3.332622, -2, -6.542188,
-3.495131, -2, -6.84256,
-3.332622, -1, -6.542188,
-3.495131, -1, -6.84256,
-3.332622, 0, -6.542188,
-3.495131, 0, -6.84256,
-3.332622, 1, -6.542188,
-3.495131, 1, -6.84256,
-3.332622, 2, -6.542188,
-3.495131, 2, -6.84256,
-3.332622, 3, -6.542188,
-3.495131, 3, -6.84256
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
-3.82015, -2, -7.443305, 0, -0.5, 0.5, 0.5,
-3.82015, -2, -7.443305, 1, -0.5, 0.5, 0.5,
-3.82015, -2, -7.443305, 1, 1.5, 0.5, 0.5,
-3.82015, -2, -7.443305, 0, 1.5, 0.5, 0.5,
-3.82015, -1, -7.443305, 0, -0.5, 0.5, 0.5,
-3.82015, -1, -7.443305, 1, -0.5, 0.5, 0.5,
-3.82015, -1, -7.443305, 1, 1.5, 0.5, 0.5,
-3.82015, -1, -7.443305, 0, 1.5, 0.5, 0.5,
-3.82015, 0, -7.443305, 0, -0.5, 0.5, 0.5,
-3.82015, 0, -7.443305, 1, -0.5, 0.5, 0.5,
-3.82015, 0, -7.443305, 1, 1.5, 0.5, 0.5,
-3.82015, 0, -7.443305, 0, 1.5, 0.5, 0.5,
-3.82015, 1, -7.443305, 0, -0.5, 0.5, 0.5,
-3.82015, 1, -7.443305, 1, -0.5, 0.5, 0.5,
-3.82015, 1, -7.443305, 1, 1.5, 0.5, 0.5,
-3.82015, 1, -7.443305, 0, 1.5, 0.5, 0.5,
-3.82015, 2, -7.443305, 0, -0.5, 0.5, 0.5,
-3.82015, 2, -7.443305, 1, -0.5, 0.5, 0.5,
-3.82015, 2, -7.443305, 1, 1.5, 0.5, 0.5,
-3.82015, 2, -7.443305, 0, 1.5, 0.5, 0.5,
-3.82015, 3, -7.443305, 0, -0.5, 0.5, 0.5,
-3.82015, 3, -7.443305, 1, -0.5, 0.5, 0.5,
-3.82015, 3, -7.443305, 1, 1.5, 0.5, 0.5,
-3.82015, 3, -7.443305, 0, 1.5, 0.5, 0.5
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
-3.332622, -2.968782, -6,
-3.332622, -2.968782, 4,
-3.332622, -2.968782, -6,
-3.495131, -3.129822, -6,
-3.332622, -2.968782, -4,
-3.495131, -3.129822, -4,
-3.332622, -2.968782, -2,
-3.495131, -3.129822, -2,
-3.332622, -2.968782, 0,
-3.495131, -3.129822, 0,
-3.332622, -2.968782, 2,
-3.495131, -3.129822, 2,
-3.332622, -2.968782, 4,
-3.495131, -3.129822, 4
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
-3.82015, -3.4519, -6, 0, -0.5, 0.5, 0.5,
-3.82015, -3.4519, -6, 1, -0.5, 0.5, 0.5,
-3.82015, -3.4519, -6, 1, 1.5, 0.5, 0.5,
-3.82015, -3.4519, -6, 0, 1.5, 0.5, 0.5,
-3.82015, -3.4519, -4, 0, -0.5, 0.5, 0.5,
-3.82015, -3.4519, -4, 1, -0.5, 0.5, 0.5,
-3.82015, -3.4519, -4, 1, 1.5, 0.5, 0.5,
-3.82015, -3.4519, -4, 0, 1.5, 0.5, 0.5,
-3.82015, -3.4519, -2, 0, -0.5, 0.5, 0.5,
-3.82015, -3.4519, -2, 1, -0.5, 0.5, 0.5,
-3.82015, -3.4519, -2, 1, 1.5, 0.5, 0.5,
-3.82015, -3.4519, -2, 0, 1.5, 0.5, 0.5,
-3.82015, -3.4519, 0, 0, -0.5, 0.5, 0.5,
-3.82015, -3.4519, 0, 1, -0.5, 0.5, 0.5,
-3.82015, -3.4519, 0, 1, 1.5, 0.5, 0.5,
-3.82015, -3.4519, 0, 0, 1.5, 0.5, 0.5,
-3.82015, -3.4519, 2, 0, -0.5, 0.5, 0.5,
-3.82015, -3.4519, 2, 1, -0.5, 0.5, 0.5,
-3.82015, -3.4519, 2, 1, 1.5, 0.5, 0.5,
-3.82015, -3.4519, 2, 0, 1.5, 0.5, 0.5,
-3.82015, -3.4519, 4, 0, -0.5, 0.5, 0.5,
-3.82015, -3.4519, 4, 1, -0.5, 0.5, 0.5,
-3.82015, -3.4519, 4, 1, 1.5, 0.5, 0.5,
-3.82015, -3.4519, 4, 0, 1.5, 0.5, 0.5
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
-3.332622, -2.968782, -6.542188,
-3.332622, 3.47279, -6.542188,
-3.332622, -2.968782, 5.472714,
-3.332622, 3.47279, 5.472714,
-3.332622, -2.968782, -6.542188,
-3.332622, -2.968782, 5.472714,
-3.332622, 3.47279, -6.542188,
-3.332622, 3.47279, 5.472714,
-3.332622, -2.968782, -6.542188,
3.167757, -2.968782, -6.542188,
-3.332622, -2.968782, 5.472714,
3.167757, -2.968782, 5.472714,
-3.332622, 3.47279, -6.542188,
3.167757, 3.47279, -6.542188,
-3.332622, 3.47279, 5.472714,
3.167757, 3.47279, 5.472714,
3.167757, -2.968782, -6.542188,
3.167757, 3.47279, -6.542188,
3.167757, -2.968782, 5.472714,
3.167757, 3.47279, 5.472714,
3.167757, -2.968782, -6.542188,
3.167757, -2.968782, 5.472714,
3.167757, 3.47279, -6.542188,
3.167757, 3.47279, 5.472714
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
var radius = 8.064815;
var distance = 35.88128;
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
mvMatrix.translate( 0.08243251, -0.2520039, 0.5347366 );
mvMatrix.scale( 1.341435, 1.353681, 0.7257518 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.88128);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
phosphoramidothioate<-read.table("phosphoramidothioate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-phosphoramidothioate$V2
```

```
## Error in eval(expr, envir, enclos): object 'phosphoramidothioate' not found
```

```r
y<-phosphoramidothioate$V3
```

```
## Error in eval(expr, envir, enclos): object 'phosphoramidothioate' not found
```

```r
z<-phosphoramidothioate$V4
```

```
## Error in eval(expr, envir, enclos): object 'phosphoramidothioate' not found
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
-3.237956, 1.165528, -1.439061, 0, 0, 1, 1, 1,
-2.975446, -0.3634349, -1.166328, 1, 0, 0, 1, 1,
-2.953916, -0.6125717, -2.679327, 1, 0, 0, 1, 1,
-2.738527, 1.345574, 0.3511293, 1, 0, 0, 1, 1,
-2.713574, -0.1369111, -3.705631, 1, 0, 0, 1, 1,
-2.635529, 1.077922, -0.6658453, 1, 0, 0, 1, 1,
-2.618009, -0.6833292, -1.674709, 0, 0, 0, 1, 1,
-2.61177, -0.321043, -1.994318, 0, 0, 0, 1, 1,
-2.540335, -0.1887118, -0.4503464, 0, 0, 0, 1, 1,
-2.457934, 0.5766899, -1.001798, 0, 0, 0, 1, 1,
-2.440257, 1.083571, -1.43069, 0, 0, 0, 1, 1,
-2.416892, -0.4121788, -2.417538, 0, 0, 0, 1, 1,
-2.39304, 0.4933043, -1.513047, 0, 0, 0, 1, 1,
-2.39268, 0.07804397, -3.162712, 1, 1, 1, 1, 1,
-2.303338, 1.736142, -2.410052, 1, 1, 1, 1, 1,
-2.285205, 0.03321418, -2.635527, 1, 1, 1, 1, 1,
-2.25261, 0.1664817, -2.635915, 1, 1, 1, 1, 1,
-2.197069, -0.7080531, -2.829213, 1, 1, 1, 1, 1,
-2.136937, 1.436501, -1.776956, 1, 1, 1, 1, 1,
-2.109007, 1.609713, 0.06886046, 1, 1, 1, 1, 1,
-2.069982, -1.155325, -1.922414, 1, 1, 1, 1, 1,
-2.009706, 0.3812353, -2.056904, 1, 1, 1, 1, 1,
-1.996309, 1.117048, 0.1900469, 1, 1, 1, 1, 1,
-1.986832, -0.1028738, 0.8649755, 1, 1, 1, 1, 1,
-1.955195, -0.1998514, -0.340357, 1, 1, 1, 1, 1,
-1.922023, 1.11366, -1.259046, 1, 1, 1, 1, 1,
-1.897453, -0.5169303, -1.819677, 1, 1, 1, 1, 1,
-1.874666, -2.351874, -2.989593, 1, 1, 1, 1, 1,
-1.868827, -0.8263977, -1.950168, 0, 0, 1, 1, 1,
-1.868506, -0.9055446, -0.4512212, 1, 0, 0, 1, 1,
-1.856118, 0.1547278, -2.916225, 1, 0, 0, 1, 1,
-1.845534, -0.4343252, -0.401794, 1, 0, 0, 1, 1,
-1.829881, 1.236614, 0.5621383, 1, 0, 0, 1, 1,
-1.813948, -0.0562763, -2.332467, 1, 0, 0, 1, 1,
-1.796816, 1.424011, 0.04688246, 0, 0, 0, 1, 1,
-1.794505, -1.566091, -2.452809, 0, 0, 0, 1, 1,
-1.776978, 0.8441013, -0.6202337, 0, 0, 0, 1, 1,
-1.75544, 0.8581702, -0.6944048, 0, 0, 0, 1, 1,
-1.746226, 1.701281, -0.5699245, 0, 0, 0, 1, 1,
-1.742453, -0.9819589, -1.676739, 0, 0, 0, 1, 1,
-1.739786, -0.206276, -2.075162, 0, 0, 0, 1, 1,
-1.734155, 0.1516354, -2.27891, 1, 1, 1, 1, 1,
-1.733705, -1.701967, -1.389929, 1, 1, 1, 1, 1,
-1.727593, 1.916083, -1.08023, 1, 1, 1, 1, 1,
-1.726005, -2.098173, -3.221437, 1, 1, 1, 1, 1,
-1.714394, -0.554419, -2.449162, 1, 1, 1, 1, 1,
-1.693032, 0.8741332, -0.05967499, 1, 1, 1, 1, 1,
-1.656142, -0.8944491, -3.36394, 1, 1, 1, 1, 1,
-1.623454, -0.4888591, 0.3182282, 1, 1, 1, 1, 1,
-1.622667, 1.104757, -0.6732487, 1, 1, 1, 1, 1,
-1.622084, 0.0442448, -1.658972, 1, 1, 1, 1, 1,
-1.619703, -0.204732, -1.311058, 1, 1, 1, 1, 1,
-1.617737, 1.111922, -2.394689, 1, 1, 1, 1, 1,
-1.616367, 0.2177541, -1.886315, 1, 1, 1, 1, 1,
-1.610766, 0.179482, -2.385096, 1, 1, 1, 1, 1,
-1.60596, 0.780726, -2.554227, 1, 1, 1, 1, 1,
-1.590974, 1.41839, 0.1536523, 0, 0, 1, 1, 1,
-1.572606, -0.234695, -2.08827, 1, 0, 0, 1, 1,
-1.56063, -0.02620829, -2.431154, 1, 0, 0, 1, 1,
-1.560047, -1.096872, -2.827209, 1, 0, 0, 1, 1,
-1.543159, -0.02165148, -0.7873777, 1, 0, 0, 1, 1,
-1.53464, 0.2472541, -2.571205, 1, 0, 0, 1, 1,
-1.534414, -0.7568713, -1.185295, 0, 0, 0, 1, 1,
-1.533723, 1.218651, -0.1481135, 0, 0, 0, 1, 1,
-1.532661, 0.4127403, -1.794178, 0, 0, 0, 1, 1,
-1.496647, -1.065341, -2.929768, 0, 0, 0, 1, 1,
-1.488326, 1.074311, -1.883888, 0, 0, 0, 1, 1,
-1.480134, -0.2642919, -3.492679, 0, 0, 0, 1, 1,
-1.465702, 1.721987, 2.009915, 0, 0, 0, 1, 1,
-1.464825, -0.362102, -2.551405, 1, 1, 1, 1, 1,
-1.464549, -0.5697689, -2.510945, 1, 1, 1, 1, 1,
-1.455379, 0.6414278, -0.04679235, 1, 1, 1, 1, 1,
-1.452927, 0.702236, -0.1993499, 1, 1, 1, 1, 1,
-1.445109, -0.7455742, -2.213615, 1, 1, 1, 1, 1,
-1.443419, -1.686371, -1.623467, 1, 1, 1, 1, 1,
-1.438389, 0.7334929, -1.74769, 1, 1, 1, 1, 1,
-1.438211, 0.7860846, -1.63517, 1, 1, 1, 1, 1,
-1.430702, 1.310655, -2.084928, 1, 1, 1, 1, 1,
-1.415183, -0.6292384, -2.197889, 1, 1, 1, 1, 1,
-1.411629, -1.778766, -1.98853, 1, 1, 1, 1, 1,
-1.408668, 0.5176522, -1.162738, 1, 1, 1, 1, 1,
-1.406855, 0.3244921, -1.305262, 1, 1, 1, 1, 1,
-1.403848, -0.5811107, -1.653313, 1, 1, 1, 1, 1,
-1.390708, -2.423078, -2.980339, 1, 1, 1, 1, 1,
-1.387676, -1.159292, -2.869529, 0, 0, 1, 1, 1,
-1.386961, 0.4113787, -0.4364017, 1, 0, 0, 1, 1,
-1.385733, -0.4336581, -3.472337, 1, 0, 0, 1, 1,
-1.384308, 0.1320636, -2.331627, 1, 0, 0, 1, 1,
-1.378739, 0.06596768, -1.916065, 1, 0, 0, 1, 1,
-1.366929, -0.4185703, -1.690045, 1, 0, 0, 1, 1,
-1.362445, -0.7549523, -1.785438, 0, 0, 0, 1, 1,
-1.360813, 0.8416368, -2.235214, 0, 0, 0, 1, 1,
-1.349748, -0.4119863, -2.634777, 0, 0, 0, 1, 1,
-1.346137, -0.02611428, -0.7189315, 0, 0, 0, 1, 1,
-1.343174, 1.242355, 0.4098049, 0, 0, 0, 1, 1,
-1.338547, 0.8445704, -1.407564, 0, 0, 0, 1, 1,
-1.328081, -0.6272846, -3.442247, 0, 0, 0, 1, 1,
-1.323374, -0.03503469, -0.3393503, 1, 1, 1, 1, 1,
-1.31805, 0.6776875, -3.080362, 1, 1, 1, 1, 1,
-1.316334, -0.08920579, -4.498813, 1, 1, 1, 1, 1,
-1.313606, -1.661536, -0.7007513, 1, 1, 1, 1, 1,
-1.313275, -1.103709, -3.33015, 1, 1, 1, 1, 1,
-1.312386, -2.271612, -1.581107, 1, 1, 1, 1, 1,
-1.288024, -0.5096214, -2.265227, 1, 1, 1, 1, 1,
-1.275523, 0.03398012, -1.022825, 1, 1, 1, 1, 1,
-1.274391, -0.7097147, -0.2924847, 1, 1, 1, 1, 1,
-1.274001, 0.5358986, -1.23683, 1, 1, 1, 1, 1,
-1.25635, 0.7876992, -1.177439, 1, 1, 1, 1, 1,
-1.246527, 1.184827, -1.568632, 1, 1, 1, 1, 1,
-1.244705, 0.7502634, -1.254061, 1, 1, 1, 1, 1,
-1.233559, 0.2285947, -2.174866, 1, 1, 1, 1, 1,
-1.222842, -1.66838, -3.761799, 1, 1, 1, 1, 1,
-1.222795, -0.05899844, -1.018086, 0, 0, 1, 1, 1,
-1.222453, 0.08476066, -0.5203506, 1, 0, 0, 1, 1,
-1.221293, -0.3827452, -0.14452, 1, 0, 0, 1, 1,
-1.218422, -0.8499507, -3.151562, 1, 0, 0, 1, 1,
-1.217923, -0.8004735, -2.715075, 1, 0, 0, 1, 1,
-1.215494, 0.3782087, -1.168887, 1, 0, 0, 1, 1,
-1.207468, 0.7718487, -0.3290312, 0, 0, 0, 1, 1,
-1.202277, -0.370433, -2.403122, 0, 0, 0, 1, 1,
-1.20083, -0.9428325, -1.213494, 0, 0, 0, 1, 1,
-1.195249, 0.7563915, -2.291615, 0, 0, 0, 1, 1,
-1.182971, 0.3796323, -1.939013, 0, 0, 0, 1, 1,
-1.168315, -0.655148, -1.693454, 0, 0, 0, 1, 1,
-1.162557, 1.224904, -0.6110407, 0, 0, 0, 1, 1,
-1.162416, 0.7431477, -1.664395, 1, 1, 1, 1, 1,
-1.157272, 0.3379305, -2.205667, 1, 1, 1, 1, 1,
-1.156106, -1.003026, -3.022273, 1, 1, 1, 1, 1,
-1.152115, 0.1432478, -0.2658822, 1, 1, 1, 1, 1,
-1.147071, -0.8517493, -2.40556, 1, 1, 1, 1, 1,
-1.14303, 0.3683995, -0.2530867, 1, 1, 1, 1, 1,
-1.140909, 0.4499204, 0.09766319, 1, 1, 1, 1, 1,
-1.139433, -1.050888, -3.050325, 1, 1, 1, 1, 1,
-1.137564, 0.2005119, -0.8972761, 1, 1, 1, 1, 1,
-1.135889, 0.02841076, -1.040574, 1, 1, 1, 1, 1,
-1.120897, -0.1254372, -4.146407, 1, 1, 1, 1, 1,
-1.118366, 0.06391919, -1.43969, 1, 1, 1, 1, 1,
-1.11575, 0.2203864, -1.267693, 1, 1, 1, 1, 1,
-1.114398, 0.5569761, -0.2870966, 1, 1, 1, 1, 1,
-1.112069, -0.02653206, -1.967987, 1, 1, 1, 1, 1,
-1.108742, -0.365928, -2.092441, 0, 0, 1, 1, 1,
-1.106073, -0.579724, -2.941257, 1, 0, 0, 1, 1,
-1.09671, 1.052778, 0.493318, 1, 0, 0, 1, 1,
-1.091229, -0.2508582, -1.562505, 1, 0, 0, 1, 1,
-1.07536, -2.040809, -2.910651, 1, 0, 0, 1, 1,
-1.073642, -0.6162276, -2.611983, 1, 0, 0, 1, 1,
-1.073122, 0.07935186, -1.275353, 0, 0, 0, 1, 1,
-1.047435, 0.8755, -2.124071, 0, 0, 0, 1, 1,
-1.044129, 0.5470521, -0.4290014, 0, 0, 0, 1, 1,
-1.036377, -0.5824929, -0.1229338, 0, 0, 0, 1, 1,
-1.030835, -2.182971, -3.798806, 0, 0, 0, 1, 1,
-1.03049, -0.2757633, -1.928426, 0, 0, 0, 1, 1,
-1.006505, 1.276775, 1.246952, 0, 0, 0, 1, 1,
-1.004509, -0.0006404549, 0.01120666, 1, 1, 1, 1, 1,
-1.001628, -0.6790849, -3.161203, 1, 1, 1, 1, 1,
-0.9930885, -0.2003972, -2.408427, 1, 1, 1, 1, 1,
-0.9905558, -0.7369508, -2.290472, 1, 1, 1, 1, 1,
-0.9882478, -0.5041006, -2.599672, 1, 1, 1, 1, 1,
-0.9858531, 1.0303, -1.397065, 1, 1, 1, 1, 1,
-0.9809625, -0.4072005, -2.230536, 1, 1, 1, 1, 1,
-0.9792432, 1.373146, 0.6095472, 1, 1, 1, 1, 1,
-0.9772976, 0.4660333, -2.890407, 1, 1, 1, 1, 1,
-0.9761394, -1.233033, -2.342633, 1, 1, 1, 1, 1,
-0.975399, 1.293578, -0.05350159, 1, 1, 1, 1, 1,
-0.9685292, -1.954079, -4.675584, 1, 1, 1, 1, 1,
-0.9675492, 1.748359, 0.2917615, 1, 1, 1, 1, 1,
-0.9555293, 0.5175329, -1.012838, 1, 1, 1, 1, 1,
-0.9489949, -0.322915, -1.444009, 1, 1, 1, 1, 1,
-0.9483334, -0.4846116, -1.410185, 0, 0, 1, 1, 1,
-0.9439658, -0.1961055, -2.371605, 1, 0, 0, 1, 1,
-0.9423962, 0.242789, -1.787251, 1, 0, 0, 1, 1,
-0.9398028, -0.02205175, -0.8234559, 1, 0, 0, 1, 1,
-0.9395089, -0.8216183, -1.327263, 1, 0, 0, 1, 1,
-0.9381093, -0.302774, -1.505803, 1, 0, 0, 1, 1,
-0.9355295, 0.5000708, -1.219051, 0, 0, 0, 1, 1,
-0.9339405, 0.7086183, -0.8992618, 0, 0, 0, 1, 1,
-0.9302256, -0.6284773, -1.925139, 0, 0, 0, 1, 1,
-0.9281954, 0.3384539, -0.4808152, 0, 0, 0, 1, 1,
-0.9236237, -0.03288004, -1.584496, 0, 0, 0, 1, 1,
-0.9231846, 0.2374854, -2.730671, 0, 0, 0, 1, 1,
-0.9212646, 0.1470915, -1.143103, 0, 0, 0, 1, 1,
-0.9202941, 1.059952, 1.061137, 1, 1, 1, 1, 1,
-0.9086062, 0.2039671, -0.8860148, 1, 1, 1, 1, 1,
-0.9063843, 1.133797, 0.5733268, 1, 1, 1, 1, 1,
-0.9031296, -1.953765, -3.157829, 1, 1, 1, 1, 1,
-0.8987485, 0.3173123, 0.2202026, 1, 1, 1, 1, 1,
-0.8908506, -1.071953, -3.243693, 1, 1, 1, 1, 1,
-0.88753, -1.55757, -1.602166, 1, 1, 1, 1, 1,
-0.8758304, 0.4385439, 0.1225026, 1, 1, 1, 1, 1,
-0.8746476, -0.2062556, 0.3706983, 1, 1, 1, 1, 1,
-0.8729391, 0.1830195, -0.4274366, 1, 1, 1, 1, 1,
-0.8714833, -1.040812, -2.757537, 1, 1, 1, 1, 1,
-0.8650101, 0.07323579, -2.824722, 1, 1, 1, 1, 1,
-0.8608965, 0.3281041, -1.425046, 1, 1, 1, 1, 1,
-0.8523704, -1.445172, -1.929311, 1, 1, 1, 1, 1,
-0.8502747, -0.8549485, -4.200853, 1, 1, 1, 1, 1,
-0.8452708, -1.542654, -3.22201, 0, 0, 1, 1, 1,
-0.8441283, -0.2803857, -2.078282, 1, 0, 0, 1, 1,
-0.8427002, 0.9932289, 0.09795319, 1, 0, 0, 1, 1,
-0.8390949, 0.02806372, -0.5252011, 1, 0, 0, 1, 1,
-0.8349157, -0.8723295, -2.551825, 1, 0, 0, 1, 1,
-0.8246369, 0.02906279, -0.7686396, 1, 0, 0, 1, 1,
-0.8242937, -1.884544, -4.008428, 0, 0, 0, 1, 1,
-0.8213457, -2.134917, -2.654578, 0, 0, 0, 1, 1,
-0.8201819, 1.030159, -0.7846216, 0, 0, 0, 1, 1,
-0.8201203, 0.1264873, -2.4788, 0, 0, 0, 1, 1,
-0.8174189, -0.0006240411, -1.618599, 0, 0, 0, 1, 1,
-0.8160485, 0.8217227, -0.2412838, 0, 0, 0, 1, 1,
-0.8149341, 0.1855065, -1.92533, 0, 0, 0, 1, 1,
-0.81259, 0.5129696, -0.9368936, 1, 1, 1, 1, 1,
-0.8077735, -0.01089695, -1.82883, 1, 1, 1, 1, 1,
-0.8075121, 0.5807965, -2.120751, 1, 1, 1, 1, 1,
-0.7952942, -1.160575, -2.287664, 1, 1, 1, 1, 1,
-0.791724, 0.1884906, -0.1065744, 1, 1, 1, 1, 1,
-0.7884238, 0.4294083, -0.819329, 1, 1, 1, 1, 1,
-0.788245, -0.5258653, -1.929167, 1, 1, 1, 1, 1,
-0.7854306, -1.133114, -1.804834, 1, 1, 1, 1, 1,
-0.7831847, 1.042173, -1.615496, 1, 1, 1, 1, 1,
-0.7828109, -0.316854, -1.545914, 1, 1, 1, 1, 1,
-0.7772605, 0.5746838, -0.6954817, 1, 1, 1, 1, 1,
-0.7762879, 1.374595, 0.2248689, 1, 1, 1, 1, 1,
-0.772708, -0.3068123, -1.797288, 1, 1, 1, 1, 1,
-0.7717646, 0.05574105, -1.619087, 1, 1, 1, 1, 1,
-0.7703674, -1.287496, -1.742308, 1, 1, 1, 1, 1,
-0.7682096, -0.006444588, -1.109511, 0, 0, 1, 1, 1,
-0.7679051, 0.3330745, -2.279457, 1, 0, 0, 1, 1,
-0.7632504, 0.2437379, -1.492033, 1, 0, 0, 1, 1,
-0.755966, 0.9525853, 0.1072642, 1, 0, 0, 1, 1,
-0.7537887, -1.503065, -3.620121, 1, 0, 0, 1, 1,
-0.7526556, -0.3094069, -3.204482, 1, 0, 0, 1, 1,
-0.7472408, -0.8761818, -3.751332, 0, 0, 0, 1, 1,
-0.7460015, 1.271398, 0.433312, 0, 0, 0, 1, 1,
-0.7453449, -1.013966, -2.829477, 0, 0, 0, 1, 1,
-0.7442567, -0.5390162, -3.676378, 0, 0, 0, 1, 1,
-0.7419628, -1.229635, -3.006071, 0, 0, 0, 1, 1,
-0.7388961, -0.6974233, -2.439888, 0, 0, 0, 1, 1,
-0.7343609, 0.3165587, -0.8562663, 0, 0, 0, 1, 1,
-0.7250897, 0.07967591, -1.50412, 1, 1, 1, 1, 1,
-0.724586, 0.2998696, -3.317091, 1, 1, 1, 1, 1,
-0.7225533, -1.025499, -1.842232, 1, 1, 1, 1, 1,
-0.7024503, -0.13345, -1.361756, 1, 1, 1, 1, 1,
-0.6989707, 1.293196, -0.8200273, 1, 1, 1, 1, 1,
-0.6957024, -0.840421, -2.856438, 1, 1, 1, 1, 1,
-0.6953267, -0.9732194, -3.496998, 1, 1, 1, 1, 1,
-0.6934636, 0.6407189, -1.918602, 1, 1, 1, 1, 1,
-0.6898813, 0.7399666, -0.7217938, 1, 1, 1, 1, 1,
-0.6867696, 0.7004179, -0.06878666, 1, 1, 1, 1, 1,
-0.6846951, 1.015925, -1.53633, 1, 1, 1, 1, 1,
-0.6818627, 0.2244472, -0.4575821, 1, 1, 1, 1, 1,
-0.6807622, 0.3285665, 1.426605, 1, 1, 1, 1, 1,
-0.6700435, -0.4531731, -1.435012, 1, 1, 1, 1, 1,
-0.6690233, -0.910621, -2.451052, 1, 1, 1, 1, 1,
-0.663306, -0.4837516, -3.010967, 0, 0, 1, 1, 1,
-0.6544908, 0.8857955, -1.190279, 1, 0, 0, 1, 1,
-0.6533808, 1.507923, -0.4965209, 1, 0, 0, 1, 1,
-0.652696, 1.246107, -0.7467306, 1, 0, 0, 1, 1,
-0.6512136, -0.8202627, -4.150724, 1, 0, 0, 1, 1,
-0.6475045, -0.3044569, -1.655705, 1, 0, 0, 1, 1,
-0.6470647, -1.137691, -3.450133, 0, 0, 0, 1, 1,
-0.6300122, 1.378803, -1.304171, 0, 0, 0, 1, 1,
-0.6253366, -0.9009222, -2.201886, 0, 0, 0, 1, 1,
-0.6249056, -0.5221725, -1.175386, 0, 0, 0, 1, 1,
-0.624734, 0.1790151, 0.2661643, 0, 0, 0, 1, 1,
-0.6222286, -0.8425904, -3.473982, 0, 0, 0, 1, 1,
-0.6198352, -0.4116614, -2.716893, 0, 0, 0, 1, 1,
-0.6136165, -0.5250542, -4.508453, 1, 1, 1, 1, 1,
-0.6132618, 0.4995521, -0.8490857, 1, 1, 1, 1, 1,
-0.6116645, 0.2995039, -0.3938604, 1, 1, 1, 1, 1,
-0.6109648, 1.425592, 1.853208, 1, 1, 1, 1, 1,
-0.61053, -0.2961879, -1.190844, 1, 1, 1, 1, 1,
-0.610469, -1.899289, -1.666085, 1, 1, 1, 1, 1,
-0.6040782, 0.08135592, -1.936773, 1, 1, 1, 1, 1,
-0.6028032, 0.05398217, -1.553479, 1, 1, 1, 1, 1,
-0.6012405, 0.08516465, -2.217587, 1, 1, 1, 1, 1,
-0.596297, -0.3767784, -2.631073, 1, 1, 1, 1, 1,
-0.5919183, -0.9547638, -4.446347, 1, 1, 1, 1, 1,
-0.5898963, -0.01818529, -0.9562683, 1, 1, 1, 1, 1,
-0.5897208, -1.741229, -2.021672, 1, 1, 1, 1, 1,
-0.5889044, 0.8439779, -1.755498, 1, 1, 1, 1, 1,
-0.5852931, 2.113911, -1.563699, 1, 1, 1, 1, 1,
-0.584313, -0.189626, -2.472523, 0, 0, 1, 1, 1,
-0.5840936, 0.1477437, -1.498747, 1, 0, 0, 1, 1,
-0.5732218, -0.2377165, -2.88496, 1, 0, 0, 1, 1,
-0.5696439, -2.209995, -6.367213, 1, 0, 0, 1, 1,
-0.5654865, 0.9044436, 0.07371901, 1, 0, 0, 1, 1,
-0.5637556, -0.5406959, -2.372644, 1, 0, 0, 1, 1,
-0.5602041, -0.6149546, -2.728598, 0, 0, 0, 1, 1,
-0.5591826, -0.8468603, -3.162143, 0, 0, 0, 1, 1,
-0.554088, -1.271857, -1.781959, 0, 0, 0, 1, 1,
-0.553448, 0.7806887, -2.995651, 0, 0, 0, 1, 1,
-0.5519718, 0.04891289, -1.440245, 0, 0, 0, 1, 1,
-0.5515503, 0.5540457, -1.322432, 0, 0, 0, 1, 1,
-0.5496244, 0.511911, -0.9961189, 0, 0, 0, 1, 1,
-0.5478023, 0.9146548, 0.1843613, 1, 1, 1, 1, 1,
-0.5426114, -0.5278738, -3.160173, 1, 1, 1, 1, 1,
-0.5422259, 2.186332, -0.2460965, 1, 1, 1, 1, 1,
-0.5403048, -0.6408825, -2.399921, 1, 1, 1, 1, 1,
-0.5278221, 1.773467, -0.3026122, 1, 1, 1, 1, 1,
-0.5233505, 0.894742, -1.080854, 1, 1, 1, 1, 1,
-0.5220996, -0.6784169, -0.9252892, 1, 1, 1, 1, 1,
-0.5185171, -1.231292, -2.043809, 1, 1, 1, 1, 1,
-0.5125433, -1.035029, -3.613423, 1, 1, 1, 1, 1,
-0.5121262, 0.7862438, -1.094043, 1, 1, 1, 1, 1,
-0.5121027, 0.3251435, -0.8896071, 1, 1, 1, 1, 1,
-0.5105567, 0.9185072, -1.727976, 1, 1, 1, 1, 1,
-0.5105371, 1.075696, 0.6236132, 1, 1, 1, 1, 1,
-0.5101066, -0.07448949, -2.671391, 1, 1, 1, 1, 1,
-0.5050963, 0.6657764, 0.3214757, 1, 1, 1, 1, 1,
-0.5050178, -0.3793297, -1.293594, 0, 0, 1, 1, 1,
-0.5024431, 1.812696, 0.1699612, 1, 0, 0, 1, 1,
-0.4987292, -0.2928055, -1.665083, 1, 0, 0, 1, 1,
-0.4939988, -1.458583, -3.052774, 1, 0, 0, 1, 1,
-0.4907095, -0.5804405, -2.426387, 1, 0, 0, 1, 1,
-0.4888076, 0.3207435, -2.366278, 1, 0, 0, 1, 1,
-0.4878889, 1.727467, 0.1695997, 0, 0, 0, 1, 1,
-0.4869513, -0.4391436, -2.151588, 0, 0, 0, 1, 1,
-0.4840323, -0.7668694, -2.245696, 0, 0, 0, 1, 1,
-0.4831631, -1.140433, -2.993316, 0, 0, 0, 1, 1,
-0.4718651, 1.635583, -0.0211019, 0, 0, 0, 1, 1,
-0.470217, 0.5688295, -0.6006725, 0, 0, 0, 1, 1,
-0.4665134, 0.7157624, -1.343098, 0, 0, 0, 1, 1,
-0.46297, 0.8107204, -2.324256, 1, 1, 1, 1, 1,
-0.4588828, -1.295155, -1.90898, 1, 1, 1, 1, 1,
-0.4562263, -0.2146266, -0.2330398, 1, 1, 1, 1, 1,
-0.4527653, -1.597146, -1.72014, 1, 1, 1, 1, 1,
-0.4508908, 1.051044, -0.4100112, 1, 1, 1, 1, 1,
-0.4443138, -1.200284, -3.172909, 1, 1, 1, 1, 1,
-0.4418392, 1.119798, -1.389655, 1, 1, 1, 1, 1,
-0.4373424, -0.1200625, -2.309506, 1, 1, 1, 1, 1,
-0.4277881, 0.9883237, -0.07413266, 1, 1, 1, 1, 1,
-0.424232, 1.408535, -0.8500101, 1, 1, 1, 1, 1,
-0.4202088, 1.14893, 0.2599362, 1, 1, 1, 1, 1,
-0.4195349, 2.426584, 0.7474667, 1, 1, 1, 1, 1,
-0.4147845, -1.829782, -4.376265, 1, 1, 1, 1, 1,
-0.4132682, 0.1444283, -0.775781, 1, 1, 1, 1, 1,
-0.4124287, 0.9927453, 0.01169428, 1, 1, 1, 1, 1,
-0.4121756, 1.018028, -0.23644, 0, 0, 1, 1, 1,
-0.411964, 0.2076259, -2.100557, 1, 0, 0, 1, 1,
-0.4114621, -2.047281, -4.077858, 1, 0, 0, 1, 1,
-0.4105086, 1.002893, 0.5499456, 1, 0, 0, 1, 1,
-0.4054859, -1.241049, -2.649715, 1, 0, 0, 1, 1,
-0.4022779, 1.500077, -1.468867, 1, 0, 0, 1, 1,
-0.4002732, -0.7548955, -3.808541, 0, 0, 0, 1, 1,
-0.3994954, -1.769325, -4.120819, 0, 0, 0, 1, 1,
-0.3976825, -1.699773, -2.303196, 0, 0, 0, 1, 1,
-0.3951309, 0.4620681, -0.1853555, 0, 0, 0, 1, 1,
-0.3925474, 1.09452, -0.6037737, 0, 0, 0, 1, 1,
-0.3923998, 0.8876732, -1.615611, 0, 0, 0, 1, 1,
-0.3918075, -1.330623, -1.422914, 0, 0, 0, 1, 1,
-0.3918023, -1.311988, -2.760898, 1, 1, 1, 1, 1,
-0.390553, -2.037578, -0.5550832, 1, 1, 1, 1, 1,
-0.3890842, -0.4577681, -0.1437888, 1, 1, 1, 1, 1,
-0.3875798, 0.6620364, -1.763264, 1, 1, 1, 1, 1,
-0.3853697, 0.6931787, -0.8123908, 1, 1, 1, 1, 1,
-0.3811269, -0.3177091, -2.48388, 1, 1, 1, 1, 1,
-0.3807404, -0.4179373, -4.039065, 1, 1, 1, 1, 1,
-0.3786473, 0.9121071, -2.308617, 1, 1, 1, 1, 1,
-0.3766211, -0.2349433, -2.944581, 1, 1, 1, 1, 1,
-0.3712782, -0.02879506, 0.898146, 1, 1, 1, 1, 1,
-0.3697974, 0.2898248, -1.396855, 1, 1, 1, 1, 1,
-0.3539239, -0.07912108, -0.8372396, 1, 1, 1, 1, 1,
-0.3534905, -1.522661, -2.069731, 1, 1, 1, 1, 1,
-0.3521335, -0.5801286, -2.056428, 1, 1, 1, 1, 1,
-0.3501844, -0.1683968, -2.222448, 1, 1, 1, 1, 1,
-0.3493657, -0.7887077, -2.540971, 0, 0, 1, 1, 1,
-0.3474612, -0.6022354, -2.992846, 1, 0, 0, 1, 1,
-0.3457489, 0.1687988, -0.05449515, 1, 0, 0, 1, 1,
-0.3424885, -0.5761163, -2.493617, 1, 0, 0, 1, 1,
-0.3417743, 0.9056055, -0.3369244, 1, 0, 0, 1, 1,
-0.3312172, -0.2494146, -2.813859, 1, 0, 0, 1, 1,
-0.329925, 0.7059138, -0.9299453, 0, 0, 0, 1, 1,
-0.328793, -0.6412035, -2.892128, 0, 0, 0, 1, 1,
-0.3263828, 0.003889636, -0.5388021, 0, 0, 0, 1, 1,
-0.3230494, -0.05662949, -1.554639, 0, 0, 0, 1, 1,
-0.3228969, 0.6969356, 0.2095286, 0, 0, 0, 1, 1,
-0.3228043, -0.0634594, -4.249425, 0, 0, 0, 1, 1,
-0.3212792, -1.260528, -2.562014, 0, 0, 0, 1, 1,
-0.3188382, -0.7707378, -3.675761, 1, 1, 1, 1, 1,
-0.3114288, 1.20651, -0.1572316, 1, 1, 1, 1, 1,
-0.3095519, 0.4860624, -0.1100172, 1, 1, 1, 1, 1,
-0.3058718, -1.571285, -3.165317, 1, 1, 1, 1, 1,
-0.3057296, 1.137566, -0.8124464, 1, 1, 1, 1, 1,
-0.2992387, -0.7660258, -3.468134, 1, 1, 1, 1, 1,
-0.2975097, -1.157283, -4.01092, 1, 1, 1, 1, 1,
-0.294444, 1.070399, -1.904613, 1, 1, 1, 1, 1,
-0.2927866, 0.2355157, -1.201388, 1, 1, 1, 1, 1,
-0.2919253, -0.550908, -2.657825, 1, 1, 1, 1, 1,
-0.2898126, -0.9529492, -4.278219, 1, 1, 1, 1, 1,
-0.2890942, -0.07335707, -2.876088, 1, 1, 1, 1, 1,
-0.2854374, 0.6126279, -1.065839, 1, 1, 1, 1, 1,
-0.2828565, -1.666432, -2.832367, 1, 1, 1, 1, 1,
-0.2826773, -0.1922744, -0.8505419, 1, 1, 1, 1, 1,
-0.2821751, -0.1105883, -2.544993, 0, 0, 1, 1, 1,
-0.2797016, -0.1970178, -3.111363, 1, 0, 0, 1, 1,
-0.2734893, 0.3011645, -2.526455, 1, 0, 0, 1, 1,
-0.2706988, -0.1698161, -1.392722, 1, 0, 0, 1, 1,
-0.2679055, -0.0968575, 0.1874189, 1, 0, 0, 1, 1,
-0.2668234, -0.3420611, -3.462702, 1, 0, 0, 1, 1,
-0.2659316, 0.07297842, -0.1172806, 0, 0, 0, 1, 1,
-0.2658419, 1.104015, -0.09073573, 0, 0, 0, 1, 1,
-0.2648807, 0.2057563, 0.1038011, 0, 0, 0, 1, 1,
-0.2637776, 0.1238276, -0.5850015, 0, 0, 0, 1, 1,
-0.2561627, -0.3115981, -2.973769, 0, 0, 0, 1, 1,
-0.2536474, -0.2040235, -2.179226, 0, 0, 0, 1, 1,
-0.2534091, 0.1942941, -0.5155755, 0, 0, 0, 1, 1,
-0.2519526, 0.5900223, 1.248405, 1, 1, 1, 1, 1,
-0.250254, 0.02749948, -2.558809, 1, 1, 1, 1, 1,
-0.2419712, 0.6925777, 0.8390667, 1, 1, 1, 1, 1,
-0.2417067, 0.1765252, -3.011504, 1, 1, 1, 1, 1,
-0.2417053, -0.1728582, -1.678448, 1, 1, 1, 1, 1,
-0.2389992, -0.04058224, -2.420825, 1, 1, 1, 1, 1,
-0.238026, -1.385074, -0.9216976, 1, 1, 1, 1, 1,
-0.234565, -0.4844287, -3.541524, 1, 1, 1, 1, 1,
-0.2321618, 0.06669607, -1.491832, 1, 1, 1, 1, 1,
-0.2252203, 1.689896, -0.0340361, 1, 1, 1, 1, 1,
-0.2237091, 1.457772, -0.4695431, 1, 1, 1, 1, 1,
-0.2117184, -1.194895, -3.517676, 1, 1, 1, 1, 1,
-0.2051106, 2.198418, -0.2592723, 1, 1, 1, 1, 1,
-0.202205, -1.349302, -3.31168, 1, 1, 1, 1, 1,
-0.2019492, -0.809839, -4.55669, 1, 1, 1, 1, 1,
-0.2003086, -1.008316, -4.127063, 0, 0, 1, 1, 1,
-0.1970579, -1.689792, -2.362202, 1, 0, 0, 1, 1,
-0.1890759, -0.01158632, -3.652525, 1, 0, 0, 1, 1,
-0.1855932, 0.6591408, 0.5970258, 1, 0, 0, 1, 1,
-0.1840019, -0.5081481, -3.208595, 1, 0, 0, 1, 1,
-0.1794057, -0.3784992, -1.670184, 1, 0, 0, 1, 1,
-0.1750482, -0.9547119, -3.170044, 0, 0, 0, 1, 1,
-0.1746034, 0.6361793, -0.8611091, 0, 0, 0, 1, 1,
-0.1714835, -0.3964088, -3.296962, 0, 0, 0, 1, 1,
-0.1708288, -0.9614281, -2.284127, 0, 0, 0, 1, 1,
-0.1604328, -0.9680289, -2.544536, 0, 0, 0, 1, 1,
-0.1558707, -0.778456, -2.057202, 0, 0, 0, 1, 1,
-0.1541403, 0.6535403, 1.69075, 0, 0, 0, 1, 1,
-0.1539314, 0.4338565, 0.4775006, 1, 1, 1, 1, 1,
-0.1511316, -1.391136, -3.300984, 1, 1, 1, 1, 1,
-0.1509523, 0.5799368, -0.7158793, 1, 1, 1, 1, 1,
-0.1490397, -1.309855, -1.92317, 1, 1, 1, 1, 1,
-0.1461824, 0.7694961, -1.258709, 1, 1, 1, 1, 1,
-0.1411705, -0.7998793, -2.801596, 1, 1, 1, 1, 1,
-0.1342126, 0.6585677, -1.130327, 1, 1, 1, 1, 1,
-0.1333572, 0.4923892, 1.08844, 1, 1, 1, 1, 1,
-0.1292095, -1.602808, -3.4983, 1, 1, 1, 1, 1,
-0.127773, 0.1360933, -0.09437404, 1, 1, 1, 1, 1,
-0.1275733, -2.647014, -2.117986, 1, 1, 1, 1, 1,
-0.1275597, -0.9718389, -2.816095, 1, 1, 1, 1, 1,
-0.1214551, 0.8012999, -0.6502061, 1, 1, 1, 1, 1,
-0.1201297, 0.05804651, -1.265008, 1, 1, 1, 1, 1,
-0.1200443, -0.7898965, -2.629431, 1, 1, 1, 1, 1,
-0.1188525, 0.03482869, -2.559824, 0, 0, 1, 1, 1,
-0.1176767, -2.222547, -2.633281, 1, 0, 0, 1, 1,
-0.1168031, 0.1944388, -0.7138581, 1, 0, 0, 1, 1,
-0.1152702, 0.2673282, -1.149722, 1, 0, 0, 1, 1,
-0.114692, 0.8983487, -1.524365, 1, 0, 0, 1, 1,
-0.1112278, -0.3271385, -1.651282, 1, 0, 0, 1, 1,
-0.1080822, -0.9936759, -3.166556, 0, 0, 0, 1, 1,
-0.1032979, 1.071022, 0.8025933, 0, 0, 0, 1, 1,
-0.09858663, 1.485367, 0.05836698, 0, 0, 0, 1, 1,
-0.09817659, -0.8055449, -0.3801006, 0, 0, 0, 1, 1,
-0.09799216, 0.2145224, -1.469715, 0, 0, 0, 1, 1,
-0.09662592, -0.6518639, -3.943848, 0, 0, 0, 1, 1,
-0.09103562, 1.124594, 0.2551228, 0, 0, 0, 1, 1,
-0.08993465, 0.07020722, 0.6001802, 1, 1, 1, 1, 1,
-0.08473581, -0.9118912, -4.544004, 1, 1, 1, 1, 1,
-0.08252902, -0.7664772, -1.090733, 1, 1, 1, 1, 1,
-0.08178206, 1.052078, 1.104303, 1, 1, 1, 1, 1,
-0.08149937, -0.7039592, -3.2503, 1, 1, 1, 1, 1,
-0.08023243, 0.560442, 1.889968, 1, 1, 1, 1, 1,
-0.07870342, 1.052161, 1.843892, 1, 1, 1, 1, 1,
-0.07275566, -1.05444, -3.069469, 1, 1, 1, 1, 1,
-0.0691131, 0.8407134, -0.2377028, 1, 1, 1, 1, 1,
-0.06257674, -1.167082, -3.734619, 1, 1, 1, 1, 1,
-0.06074712, 1.175667, -0.9274503, 1, 1, 1, 1, 1,
-0.05890941, -1.300169, -1.954884, 1, 1, 1, 1, 1,
-0.05779551, 0.6154759, 1.674389, 1, 1, 1, 1, 1,
-0.05205316, 0.4518447, -1.765293, 1, 1, 1, 1, 1,
-0.05065304, -0.3578067, -2.780007, 1, 1, 1, 1, 1,
-0.04778759, -0.7781029, -3.493873, 0, 0, 1, 1, 1,
-0.04510868, 0.08171492, 0.1712131, 1, 0, 0, 1, 1,
-0.04485124, 1.766459, 0.7134175, 1, 0, 0, 1, 1,
-0.04463718, -0.8019408, -3.763471, 1, 0, 0, 1, 1,
-0.04303358, -0.1975891, -3.218848, 1, 0, 0, 1, 1,
-0.0417668, 1.486406, -1.747746, 1, 0, 0, 1, 1,
-0.04002386, -0.9984612, -3.936545, 0, 0, 0, 1, 1,
-0.03177822, 0.7526961, 0.8786922, 0, 0, 0, 1, 1,
-0.03152606, -1.204036, -3.670095, 0, 0, 0, 1, 1,
-0.03119978, 0.2775252, 0.1619874, 0, 0, 0, 1, 1,
-0.02722692, 0.2798428, 0.1642643, 0, 0, 0, 1, 1,
-0.02557345, -0.1054157, -3.437671, 0, 0, 0, 1, 1,
-0.02443389, 1.949753, 0.1581297, 0, 0, 0, 1, 1,
-0.02423462, 0.3563962, -1.21753, 1, 1, 1, 1, 1,
-0.02377409, 0.6381021, -1.269793, 1, 1, 1, 1, 1,
-0.0213208, 0.2741249, -0.7259262, 1, 1, 1, 1, 1,
-0.01742886, -1.429591, -3.349868, 1, 1, 1, 1, 1,
-0.01732513, 0.4990661, -0.9402081, 1, 1, 1, 1, 1,
-0.01168885, -0.9438527, -0.5275643, 1, 1, 1, 1, 1,
-0.0114875, 0.3860143, -0.6614602, 1, 1, 1, 1, 1,
-0.005765982, 0.7246263, -1.874154, 1, 1, 1, 1, 1,
-0.003914407, 0.9414812, 1.323747, 1, 1, 1, 1, 1,
-0.003441588, 1.200108, 0.8931109, 1, 1, 1, 1, 1,
0.00929656, 0.6448607, 0.5748875, 1, 1, 1, 1, 1,
0.01475614, 0.6715455, -1.899951, 1, 1, 1, 1, 1,
0.01962725, 1.786804, 0.7464656, 1, 1, 1, 1, 1,
0.01967814, -0.7465249, 3.087027, 1, 1, 1, 1, 1,
0.02118982, -0.83639, 2.940475, 1, 1, 1, 1, 1,
0.02158334, 0.4286717, 0.3515894, 0, 0, 1, 1, 1,
0.02200425, 0.3794475, 0.8634477, 1, 0, 0, 1, 1,
0.02286303, -0.7876613, 1.418295, 1, 0, 0, 1, 1,
0.02847544, 1.208887, 1.031208, 1, 0, 0, 1, 1,
0.02880186, 1.200838, -1.862501, 1, 0, 0, 1, 1,
0.03307838, 1.34569, 1.52158, 1, 0, 0, 1, 1,
0.03451035, 1.71713, -0.8454422, 0, 0, 0, 1, 1,
0.03524699, 1.6403, 0.6209162, 0, 0, 0, 1, 1,
0.03592313, 0.8308574, 0.1745014, 0, 0, 0, 1, 1,
0.03802787, -0.6030427, 3.367996, 0, 0, 0, 1, 1,
0.04335508, 0.9720084, 1.816912, 0, 0, 0, 1, 1,
0.04672246, 0.1280836, -0.4103449, 0, 0, 0, 1, 1,
0.05361742, -0.5774872, 3.021604, 0, 0, 0, 1, 1,
0.06282298, -0.8384729, 1.163159, 1, 1, 1, 1, 1,
0.06820529, -0.4892735, 2.749137, 1, 1, 1, 1, 1,
0.07074612, 0.07003554, 1.850943, 1, 1, 1, 1, 1,
0.07218556, -1.003057, 2.63043, 1, 1, 1, 1, 1,
0.07403095, -0.2062132, 2.365282, 1, 1, 1, 1, 1,
0.078591, -0.4769116, 3.55441, 1, 1, 1, 1, 1,
0.08029646, -1.707873, 3.013073, 1, 1, 1, 1, 1,
0.08256611, -1.054223, 0.7073944, 1, 1, 1, 1, 1,
0.08411036, -0.5221518, 3.463092, 1, 1, 1, 1, 1,
0.08562247, -0.5938846, 3.372527, 1, 1, 1, 1, 1,
0.08608819, -0.467387, 2.938376, 1, 1, 1, 1, 1,
0.08784203, -0.7891489, 3.697828, 1, 1, 1, 1, 1,
0.08835234, -1.34075, 2.276558, 1, 1, 1, 1, 1,
0.08840626, 0.3720486, 0.04696923, 1, 1, 1, 1, 1,
0.08852596, -0.9150074, 2.891269, 1, 1, 1, 1, 1,
0.08915874, 0.5131866, 0.3714224, 0, 0, 1, 1, 1,
0.08936828, 0.2218102, -0.9562489, 1, 0, 0, 1, 1,
0.08954918, -0.5817937, 3.969203, 1, 0, 0, 1, 1,
0.0947555, 0.9442495, -1.543665, 1, 0, 0, 1, 1,
0.09579267, 0.647828, 0.9283212, 1, 0, 0, 1, 1,
0.09635356, 0.4719785, 1.243575, 1, 0, 0, 1, 1,
0.09705599, 0.333691, -0.1261601, 0, 0, 0, 1, 1,
0.1081535, 0.8637113, 0.9949824, 0, 0, 0, 1, 1,
0.11038, 0.1526363, 1.451058, 0, 0, 0, 1, 1,
0.1142477, 0.8937004, 0.4342545, 0, 0, 0, 1, 1,
0.1236964, 0.04054903, 2.897596, 0, 0, 0, 1, 1,
0.1273105, 0.6506057, 0.05919818, 0, 0, 0, 1, 1,
0.1288158, -1.017023, 3.331761, 0, 0, 0, 1, 1,
0.1321409, 0.3733305, -1.028319, 1, 1, 1, 1, 1,
0.1325249, 3.378981, -1.740849, 1, 1, 1, 1, 1,
0.1327563, -0.6536145, 2.264976, 1, 1, 1, 1, 1,
0.1356244, -0.9334707, 3.563677, 1, 1, 1, 1, 1,
0.1376525, -1.463932, 2.494731, 1, 1, 1, 1, 1,
0.1401444, -0.3375733, 2.712055, 1, 1, 1, 1, 1,
0.1446944, -1.967505, 2.612957, 1, 1, 1, 1, 1,
0.147476, -0.3607299, 3.900651, 1, 1, 1, 1, 1,
0.1500704, -0.311213, 0.4167183, 1, 1, 1, 1, 1,
0.1540546, 1.287421, 0.5223291, 1, 1, 1, 1, 1,
0.155384, -0.3004823, 2.746945, 1, 1, 1, 1, 1,
0.1590171, -1.139396, 4.564392, 1, 1, 1, 1, 1,
0.1596957, -0.5055373, 1.752587, 1, 1, 1, 1, 1,
0.1629498, 0.4391768, 0.6587278, 1, 1, 1, 1, 1,
0.1649152, -1.570877, 3.16555, 1, 1, 1, 1, 1,
0.1674127, 1.337841, 0.417211, 0, 0, 1, 1, 1,
0.1686443, -0.6631966, 3.868148, 1, 0, 0, 1, 1,
0.1689226, -0.09485111, 2.74472, 1, 0, 0, 1, 1,
0.1698988, -1.473862, 3.601064, 1, 0, 0, 1, 1,
0.1768647, 0.8103582, 0.5533333, 1, 0, 0, 1, 1,
0.1810703, 0.9969037, 0.4234802, 1, 0, 0, 1, 1,
0.1818242, 0.816178, 0.5161048, 0, 0, 0, 1, 1,
0.1820361, 0.1752767, -0.2738551, 0, 0, 0, 1, 1,
0.1823806, -2.406449, 3.689818, 0, 0, 0, 1, 1,
0.1848156, -0.7986707, 2.667764, 0, 0, 0, 1, 1,
0.1888714, -0.5568764, 2.914293, 0, 0, 0, 1, 1,
0.1915661, -1.641641, 2.901542, 0, 0, 0, 1, 1,
0.1943941, -0.3791137, 3.799795, 0, 0, 0, 1, 1,
0.196041, 0.4576577, -0.4873306, 1, 1, 1, 1, 1,
0.2000516, -0.07492725, 1.105623, 1, 1, 1, 1, 1,
0.2004384, -0.76262, 3.630581, 1, 1, 1, 1, 1,
0.2015039, -0.5302765, 2.785702, 1, 1, 1, 1, 1,
0.2052524, 0.2481214, 0.9235268, 1, 1, 1, 1, 1,
0.2054736, -0.5827509, 1.22025, 1, 1, 1, 1, 1,
0.2079027, -0.8540973, 2.08381, 1, 1, 1, 1, 1,
0.2084509, -0.4949314, 3.316274, 1, 1, 1, 1, 1,
0.212588, 0.4092607, 1.037102, 1, 1, 1, 1, 1,
0.2138035, 0.1487989, -0.1287717, 1, 1, 1, 1, 1,
0.2144258, 0.06607641, 0.0726918, 1, 1, 1, 1, 1,
0.2191702, -0.9149197, 2.981112, 1, 1, 1, 1, 1,
0.2198734, 1.17081, 0.2931507, 1, 1, 1, 1, 1,
0.2199452, -0.4316176, 3.275612, 1, 1, 1, 1, 1,
0.2222805, 0.3266889, 1.666306, 1, 1, 1, 1, 1,
0.2254675, -1.148873, 2.616764, 0, 0, 1, 1, 1,
0.2259162, 0.3756888, 1.762914, 1, 0, 0, 1, 1,
0.2272274, -0.4582073, 1.734528, 1, 0, 0, 1, 1,
0.2286168, 1.865697, 1.086873, 1, 0, 0, 1, 1,
0.2300436, 2.778648, 0.209355, 1, 0, 0, 1, 1,
0.2319858, -0.1190863, 2.397908, 1, 0, 0, 1, 1,
0.2321421, -0.4834307, 1.860137, 0, 0, 0, 1, 1,
0.2359466, 0.4487732, -0.8328897, 0, 0, 0, 1, 1,
0.2377737, -1.086532, 3.382547, 0, 0, 0, 1, 1,
0.2434857, 2.328698, -0.9537303, 0, 0, 0, 1, 1,
0.2495599, -0.5379406, 5.239193, 0, 0, 0, 1, 1,
0.2554289, -1.594127, 3.079669, 0, 0, 0, 1, 1,
0.2554595, 0.3537177, -0.8066648, 0, 0, 0, 1, 1,
0.260286, -1.780273, 2.589904, 1, 1, 1, 1, 1,
0.2605771, 0.2557741, 0.7723141, 1, 1, 1, 1, 1,
0.2639423, 1.803891, 1.925605, 1, 1, 1, 1, 1,
0.2670809, 0.4524468, 1.810641, 1, 1, 1, 1, 1,
0.2829589, -0.0646248, 2.428678, 1, 1, 1, 1, 1,
0.283289, 0.09620611, -0.2229805, 1, 1, 1, 1, 1,
0.283447, 0.8813808, -0.184937, 1, 1, 1, 1, 1,
0.2885882, -0.7981318, 1.604215, 1, 1, 1, 1, 1,
0.2907056, 0.07163505, 0.5114242, 1, 1, 1, 1, 1,
0.2921475, 0.3095429, 0.1807641, 1, 1, 1, 1, 1,
0.2958926, -0.1940596, 3.09306, 1, 1, 1, 1, 1,
0.2962674, -1.427307, 3.010289, 1, 1, 1, 1, 1,
0.3083139, -0.9385665, 1.670118, 1, 1, 1, 1, 1,
0.3160512, 0.7056603, -0.6284624, 1, 1, 1, 1, 1,
0.3162767, 0.9155664, 1.223208, 1, 1, 1, 1, 1,
0.3168615, 2.041951, 0.6652114, 0, 0, 1, 1, 1,
0.3192495, -0.003966719, 0.7393847, 1, 0, 0, 1, 1,
0.3229203, 1.043481, -0.4425442, 1, 0, 0, 1, 1,
0.3251982, -0.223883, 2.693843, 1, 0, 0, 1, 1,
0.3274513, 0.9148375, 0.8357815, 1, 0, 0, 1, 1,
0.3303131, -0.3726622, 2.810163, 1, 0, 0, 1, 1,
0.3336224, 0.6991733, 0.7033518, 0, 0, 0, 1, 1,
0.3398019, 0.01964387, 2.034674, 0, 0, 0, 1, 1,
0.3420827, -0.3227889, 4.785808, 0, 0, 0, 1, 1,
0.3424716, -1.901201, 3.586265, 0, 0, 0, 1, 1,
0.343018, -0.9328368, 4.208273, 0, 0, 0, 1, 1,
0.3471629, 0.6711161, 1.65178, 0, 0, 0, 1, 1,
0.3476419, 0.2494097, 1.024675, 0, 0, 0, 1, 1,
0.3487136, 0.3297691, 0.01675524, 1, 1, 1, 1, 1,
0.3514607, -0.03881198, 1.051452, 1, 1, 1, 1, 1,
0.3515775, 0.2472574, 1.228234, 1, 1, 1, 1, 1,
0.3541248, 1.586906, 0.8238131, 1, 1, 1, 1, 1,
0.3573189, -1.374636, 2.970409, 1, 1, 1, 1, 1,
0.3574726, -0.6505625, 1.285193, 1, 1, 1, 1, 1,
0.3585972, 0.635108, 0.165964, 1, 1, 1, 1, 1,
0.3647545, -0.640199, 3.249884, 1, 1, 1, 1, 1,
0.3657451, -0.1794224, 0.8389291, 1, 1, 1, 1, 1,
0.3661228, 1.48711, 1.470603, 1, 1, 1, 1, 1,
0.3663587, 0.04091525, 2.701601, 1, 1, 1, 1, 1,
0.3682512, 0.2462543, 0.1409221, 1, 1, 1, 1, 1,
0.3690991, -0.7046602, 2.731771, 1, 1, 1, 1, 1,
0.3843146, -1.659749, 2.18259, 1, 1, 1, 1, 1,
0.3874846, -0.5720196, 3.452737, 1, 1, 1, 1, 1,
0.3909357, -0.9280954, 3.244324, 0, 0, 1, 1, 1,
0.3918552, -0.6741532, 1.973264, 1, 0, 0, 1, 1,
0.396156, 0.1376054, -1.30368, 1, 0, 0, 1, 1,
0.3976046, -0.466941, 1.843115, 1, 0, 0, 1, 1,
0.4051666, -0.472516, 2.940727, 1, 0, 0, 1, 1,
0.4080517, 0.9943287, 0.2533469, 1, 0, 0, 1, 1,
0.4116169, -2.175333, 3.350098, 0, 0, 0, 1, 1,
0.4124186, -0.8181437, 3.125845, 0, 0, 0, 1, 1,
0.4125157, -0.6732582, 0.7352101, 0, 0, 0, 1, 1,
0.4143638, -0.2350855, 3.075513, 0, 0, 0, 1, 1,
0.4184389, 0.225173, 2.215898, 0, 0, 0, 1, 1,
0.4207943, -0.1532283, 0.3333711, 0, 0, 0, 1, 1,
0.4229811, 2.703127, -0.1854079, 0, 0, 0, 1, 1,
0.4260145, -0.6196229, 1.033309, 1, 1, 1, 1, 1,
0.4280737, 1.026541, 1.296071, 1, 1, 1, 1, 1,
0.429492, -0.9448349, 3.770655, 1, 1, 1, 1, 1,
0.4313343, 1.238064, 0.05749218, 1, 1, 1, 1, 1,
0.4319695, -0.1475705, 0.167821, 1, 1, 1, 1, 1,
0.4320993, 0.7762815, -0.8341811, 1, 1, 1, 1, 1,
0.4395366, -0.02515822, 0.5094081, 1, 1, 1, 1, 1,
0.4418628, -1.026657, 2.606112, 1, 1, 1, 1, 1,
0.4425878, -1.585848, 1.752186, 1, 1, 1, 1, 1,
0.4446167, 1.308894, 1.2339, 1, 1, 1, 1, 1,
0.4565725, 0.4067518, 1.422535, 1, 1, 1, 1, 1,
0.4618508, -0.0428809, 1.452942, 1, 1, 1, 1, 1,
0.4628155, -1.019575, 2.628126, 1, 1, 1, 1, 1,
0.4633584, 0.08705845, 2.954108, 1, 1, 1, 1, 1,
0.4642448, -0.5701467, 2.541744, 1, 1, 1, 1, 1,
0.4647304, -0.9339364, 3.043869, 0, 0, 1, 1, 1,
0.4671178, -0.6529061, 1.570665, 1, 0, 0, 1, 1,
0.4691376, 0.4001094, 0.1025478, 1, 0, 0, 1, 1,
0.4776348, -0.4651192, 2.238604, 1, 0, 0, 1, 1,
0.4780075, -0.7449691, 3.616379, 1, 0, 0, 1, 1,
0.4806146, -0.7467248, 2.04751, 1, 0, 0, 1, 1,
0.4815623, 0.5862772, 1.86006, 0, 0, 0, 1, 1,
0.4829199, 0.1203271, 0.9386496, 0, 0, 0, 1, 1,
0.4849512, 0.1014002, 0.9658983, 0, 0, 0, 1, 1,
0.485724, -0.03213883, 2.510097, 0, 0, 0, 1, 1,
0.4909691, 0.4206513, 1.36962, 0, 0, 0, 1, 1,
0.4941866, -2.874973, 4.679821, 0, 0, 0, 1, 1,
0.4986144, -0.1784003, 2.854413, 0, 0, 0, 1, 1,
0.4988649, -2.390109, 2.773882, 1, 1, 1, 1, 1,
0.5045887, 0.2669786, 0.6699533, 1, 1, 1, 1, 1,
0.5052026, 0.3454846, 1.248568, 1, 1, 1, 1, 1,
0.5052037, -1.296625, 2.704819, 1, 1, 1, 1, 1,
0.5063991, -0.8227705, 3.250832, 1, 1, 1, 1, 1,
0.5111869, -1.015666, 1.703038, 1, 1, 1, 1, 1,
0.5152174, -0.6077189, 2.446647, 1, 1, 1, 1, 1,
0.5226701, 1.050527, 0.960005, 1, 1, 1, 1, 1,
0.5241558, -0.7682746, 2.273185, 1, 1, 1, 1, 1,
0.526756, 0.364524, 2.877073, 1, 1, 1, 1, 1,
0.5377182, 1.189046, 1.743582, 1, 1, 1, 1, 1,
0.5388211, 1.266642, 0.6906005, 1, 1, 1, 1, 1,
0.5411775, 0.3413273, 1.337542, 1, 1, 1, 1, 1,
0.5447956, -0.0861514, 0.9131145, 1, 1, 1, 1, 1,
0.5452824, -0.2068841, 1.483865, 1, 1, 1, 1, 1,
0.5454464, -0.9157187, 3.381985, 0, 0, 1, 1, 1,
0.5469655, 0.419015, 1.329837, 1, 0, 0, 1, 1,
0.5482329, -0.2172982, 2.318254, 1, 0, 0, 1, 1,
0.553717, 0.5581664, 1.239826, 1, 0, 0, 1, 1,
0.5562608, -0.0746194, 1.053423, 1, 0, 0, 1, 1,
0.5563403, -0.1316359, 4.30212, 1, 0, 0, 1, 1,
0.5585849, 0.2070616, 0.2974471, 0, 0, 0, 1, 1,
0.5586303, -0.4894513, 3.096797, 0, 0, 0, 1, 1,
0.5588077, 0.1387816, 1.733007, 0, 0, 0, 1, 1,
0.5592129, 0.06663192, 0.5867386, 0, 0, 0, 1, 1,
0.5621016, 0.2215653, 1.068761, 0, 0, 0, 1, 1,
0.5692981, 0.6975304, 0.5933635, 0, 0, 0, 1, 1,
0.5813768, 0.8383762, 0.06881859, 0, 0, 0, 1, 1,
0.5830216, 1.796826, 0.0795387, 1, 1, 1, 1, 1,
0.5840371, 0.1309957, 1.785558, 1, 1, 1, 1, 1,
0.5868844, -0.5553212, 2.374151, 1, 1, 1, 1, 1,
0.5876377, -0.8568533, 0.5621954, 1, 1, 1, 1, 1,
0.5950974, 0.4625837, 0.8686804, 1, 1, 1, 1, 1,
0.5987257, 0.8609881, 0.2526442, 1, 1, 1, 1, 1,
0.5995609, 0.1968763, 0.7598796, 1, 1, 1, 1, 1,
0.6052816, -1.577377, 3.127443, 1, 1, 1, 1, 1,
0.605917, 0.5916942, 0.897117, 1, 1, 1, 1, 1,
0.6071885, 0.9745002, 0.3112511, 1, 1, 1, 1, 1,
0.6104938, 0.9808592, 4.280575, 1, 1, 1, 1, 1,
0.6118965, 1.906859, 1.056065, 1, 1, 1, 1, 1,
0.6123415, -0.1640793, 2.310521, 1, 1, 1, 1, 1,
0.613391, -0.8233219, 3.498945, 1, 1, 1, 1, 1,
0.6137294, 0.2655021, 1.329949, 1, 1, 1, 1, 1,
0.6142572, -0.3951462, 1.378602, 0, 0, 1, 1, 1,
0.6170011, 0.3408451, 0.04993828, 1, 0, 0, 1, 1,
0.6186811, 0.5796663, 1.850083, 1, 0, 0, 1, 1,
0.6190264, -1.452506, 2.193821, 1, 0, 0, 1, 1,
0.6217634, 0.2815813, 0.0008991326, 1, 0, 0, 1, 1,
0.6235286, -0.1211048, 1.102542, 1, 0, 0, 1, 1,
0.628503, 1.77205, 0.3323833, 0, 0, 0, 1, 1,
0.6358458, -2.18753, 4.078625, 0, 0, 0, 1, 1,
0.6368035, 1.069035, -0.02820265, 0, 0, 0, 1, 1,
0.6387927, 0.2170149, 0.910863, 0, 0, 0, 1, 1,
0.642872, -1.136177, 1.600175, 0, 0, 0, 1, 1,
0.645014, 0.1409762, 1.055472, 0, 0, 0, 1, 1,
0.6465603, 1.038346, -0.07720976, 0, 0, 0, 1, 1,
0.6501122, 1.31533, -0.192393, 1, 1, 1, 1, 1,
0.650305, -0.6867627, 2.642984, 1, 1, 1, 1, 1,
0.6528928, -0.3803903, 2.310607, 1, 1, 1, 1, 1,
0.657801, 0.0246097, 2.779913, 1, 1, 1, 1, 1,
0.6584153, 0.5484083, 0.4316851, 1, 1, 1, 1, 1,
0.6585739, 0.7014261, 0.9776474, 1, 1, 1, 1, 1,
0.6621307, -0.4256308, 2.245905, 1, 1, 1, 1, 1,
0.6622123, 0.07638563, 1.167914, 1, 1, 1, 1, 1,
0.6622517, 0.5933968, 1.005204, 1, 1, 1, 1, 1,
0.6635066, 1.391835, -0.09685431, 1, 1, 1, 1, 1,
0.6669506, -0.3623934, 1.1251, 1, 1, 1, 1, 1,
0.6708099, -0.4787877, 1.681159, 1, 1, 1, 1, 1,
0.6727572, -0.9059852, 2.642939, 1, 1, 1, 1, 1,
0.6765188, 1.257687, 0.5322489, 1, 1, 1, 1, 1,
0.6776571, -1.143865, 3.990741, 1, 1, 1, 1, 1,
0.6798224, -0.2467113, 1.946691, 0, 0, 1, 1, 1,
0.693363, 0.3864064, 1.431335, 1, 0, 0, 1, 1,
0.6935538, 1.808147, -2.300276, 1, 0, 0, 1, 1,
0.6975669, -0.5385052, 0.5223588, 1, 0, 0, 1, 1,
0.7043622, 1.043252, -0.07168641, 1, 0, 0, 1, 1,
0.7081089, -1.432608, 2.752667, 1, 0, 0, 1, 1,
0.7140799, -0.8229431, 3.030628, 0, 0, 0, 1, 1,
0.7149326, 1.024512, -0.04652298, 0, 0, 0, 1, 1,
0.7199135, 0.7502339, 1.063461, 0, 0, 0, 1, 1,
0.7242694, -1.732418, 3.224686, 0, 0, 0, 1, 1,
0.7256491, -0.6501514, 3.831499, 0, 0, 0, 1, 1,
0.7266959, 1.234774, 1.537251, 0, 0, 0, 1, 1,
0.7375745, 0.3569062, 1.091985, 0, 0, 0, 1, 1,
0.7400615, 2.081295, -0.2061132, 1, 1, 1, 1, 1,
0.7426614, -0.2830622, 2.268629, 1, 1, 1, 1, 1,
0.7427905, -0.388328, 1.08201, 1, 1, 1, 1, 1,
0.7436209, -0.3117496, 1.818956, 1, 1, 1, 1, 1,
0.7455841, -0.4979368, 3.248853, 1, 1, 1, 1, 1,
0.75612, -0.432794, 2.964215, 1, 1, 1, 1, 1,
0.7574978, -0.6553482, 1.703234, 1, 1, 1, 1, 1,
0.7602014, 2.264355, 1.118203, 1, 1, 1, 1, 1,
0.7617232, 0.4512302, 1.164237, 1, 1, 1, 1, 1,
0.7695541, 0.08480616, -0.1094834, 1, 1, 1, 1, 1,
0.7701413, -0.6892883, 1.39376, 1, 1, 1, 1, 1,
0.7706845, 0.3995597, 1.500813, 1, 1, 1, 1, 1,
0.7748769, -0.8299235, 2.74286, 1, 1, 1, 1, 1,
0.7765651, -0.9004074, 3.293465, 1, 1, 1, 1, 1,
0.7928374, -0.5112842, 4.226748, 1, 1, 1, 1, 1,
0.7957186, -0.9831758, 3.688443, 0, 0, 1, 1, 1,
0.7977378, 0.6932614, 1.678983, 1, 0, 0, 1, 1,
0.7979388, 0.549064, 0.7686045, 1, 0, 0, 1, 1,
0.7996132, 0.2647614, 1.389589, 1, 0, 0, 1, 1,
0.7999377, -0.03271338, 1.733372, 1, 0, 0, 1, 1,
0.811636, 0.7314172, 0.8092759, 1, 0, 0, 1, 1,
0.8254344, -2.007475, 0.7192293, 0, 0, 0, 1, 1,
0.8327225, -0.7095052, 1.767098, 0, 0, 0, 1, 1,
0.8369147, 1.707034, 1.501517, 0, 0, 0, 1, 1,
0.8384898, 0.4567535, 1.38683, 0, 0, 0, 1, 1,
0.842935, -0.1680442, 2.044161, 0, 0, 0, 1, 1,
0.843705, 0.8435403, -0.5212623, 0, 0, 0, 1, 1,
0.8449466, -1.06597, 2.345117, 0, 0, 0, 1, 1,
0.8478477, -0.1361644, 3.45932, 1, 1, 1, 1, 1,
0.8517784, -0.573308, 2.099451, 1, 1, 1, 1, 1,
0.8539831, 2.415367, 0.2167483, 1, 1, 1, 1, 1,
0.8612626, -0.9063252, 2.649247, 1, 1, 1, 1, 1,
0.8621818, 0.7307001, 0.4077948, 1, 1, 1, 1, 1,
0.8666567, -1.31118, 2.508462, 1, 1, 1, 1, 1,
0.867814, 2.498926, 1.02065, 1, 1, 1, 1, 1,
0.8697014, -1.602424, 3.091274, 1, 1, 1, 1, 1,
0.8697994, 0.02301005, 0.3136311, 1, 1, 1, 1, 1,
0.8713953, 0.5436739, 0.9189115, 1, 1, 1, 1, 1,
0.8762816, -1.185432, 1.751741, 1, 1, 1, 1, 1,
0.8815519, -0.8588781, 2.2077, 1, 1, 1, 1, 1,
0.8880724, -0.651589, 2.292809, 1, 1, 1, 1, 1,
0.8894543, -1.507802, 3.613403, 1, 1, 1, 1, 1,
0.8903248, -0.7034988, 2.30719, 1, 1, 1, 1, 1,
0.8909519, 0.11597, 1.654618, 0, 0, 1, 1, 1,
0.8912898, 0.03090908, 1.955134, 1, 0, 0, 1, 1,
0.8951049, -2.501471, 3.16245, 1, 0, 0, 1, 1,
0.8972626, 1.385575, 0.3514641, 1, 0, 0, 1, 1,
0.8992605, -0.2111127, 1.675245, 1, 0, 0, 1, 1,
0.9030427, -1.306665, 3.730688, 1, 0, 0, 1, 1,
0.9036574, -1.191857, 0.9723461, 0, 0, 0, 1, 1,
0.9093218, -0.01068313, 3.075758, 0, 0, 0, 1, 1,
0.9106312, -0.386455, 2.725433, 0, 0, 0, 1, 1,
0.9123699, 2.383238, 0.9252514, 0, 0, 0, 1, 1,
0.9133957, -0.5579494, 1.864119, 0, 0, 0, 1, 1,
0.9226334, 1.267711, 1.191301, 0, 0, 0, 1, 1,
0.9311755, -1.042538, 2.843542, 0, 0, 0, 1, 1,
0.9380336, -0.4001941, 0.9922492, 1, 1, 1, 1, 1,
0.9446648, -0.8512728, 2.215708, 1, 1, 1, 1, 1,
0.9598699, -0.2064067, 1.378232, 1, 1, 1, 1, 1,
0.9711679, 0.4553246, 1.572055, 1, 1, 1, 1, 1,
0.9736174, 2.27373, 1.263536, 1, 1, 1, 1, 1,
0.9768329, -1.101166, 2.086223, 1, 1, 1, 1, 1,
0.9801359, -0.3100913, 5.29774, 1, 1, 1, 1, 1,
0.9813794, -1.41995, 1.792352, 1, 1, 1, 1, 1,
0.9885289, -0.6634583, 1.643706, 1, 1, 1, 1, 1,
0.988797, -0.3731243, 2.553119, 1, 1, 1, 1, 1,
0.992103, 0.2271129, 2.522316, 1, 1, 1, 1, 1,
0.9940506, 0.3155574, 2.168669, 1, 1, 1, 1, 1,
0.9955304, -0.7887657, 0.4083545, 1, 1, 1, 1, 1,
0.9985645, 1.300377, 0.4772608, 1, 1, 1, 1, 1,
0.9988802, -0.6175514, 2.185354, 1, 1, 1, 1, 1,
1.005884, -1.02054, 1.616023, 0, 0, 1, 1, 1,
1.009497, -0.8953605, 2.912864, 1, 0, 0, 1, 1,
1.011226, -1.668786, 2.311143, 1, 0, 0, 1, 1,
1.011737, -0.5954406, 2.664598, 1, 0, 0, 1, 1,
1.013429, 0.6673583, 2.548775, 1, 0, 0, 1, 1,
1.016115, -1.562018, 1.764759, 1, 0, 0, 1, 1,
1.016466, 0.3763564, 0.9570442, 0, 0, 0, 1, 1,
1.021127, -0.1656531, 0.8041143, 0, 0, 0, 1, 1,
1.022787, 0.5307368, 1.966184, 0, 0, 0, 1, 1,
1.030635, 0.5604125, -0.110469, 0, 0, 0, 1, 1,
1.031937, 0.5210769, 0.1872171, 0, 0, 0, 1, 1,
1.03385, -0.03194367, 1.512957, 0, 0, 0, 1, 1,
1.0341, -0.7666544, 2.548139, 0, 0, 0, 1, 1,
1.03723, -1.286973, 2.858278, 1, 1, 1, 1, 1,
1.046756, 0.2653506, -0.7252579, 1, 1, 1, 1, 1,
1.048594, -0.009338261, 0.478716, 1, 1, 1, 1, 1,
1.050774, 0.7970108, -0.3260185, 1, 1, 1, 1, 1,
1.053293, 0.789887, 1.241321, 1, 1, 1, 1, 1,
1.066349, -1.931832, 2.470865, 1, 1, 1, 1, 1,
1.067173, 0.5671501, 1.464394, 1, 1, 1, 1, 1,
1.067336, 0.3475997, 2.399922, 1, 1, 1, 1, 1,
1.072739, 0.9128076, 0.3579522, 1, 1, 1, 1, 1,
1.074154, 0.9569519, 0.02558219, 1, 1, 1, 1, 1,
1.074536, 1.332415, 1.853859, 1, 1, 1, 1, 1,
1.074755, 0.07768323, 1.955019, 1, 1, 1, 1, 1,
1.097318, 0.300854, 1.676337, 1, 1, 1, 1, 1,
1.104053, 0.3897471, 0.9602115, 1, 1, 1, 1, 1,
1.104227, 0.8932521, 1.061255, 1, 1, 1, 1, 1,
1.109956, -0.1176465, 3.975677, 0, 0, 1, 1, 1,
1.111155, 1.231527, -0.6794276, 1, 0, 0, 1, 1,
1.124882, 0.1374477, 3.212905, 1, 0, 0, 1, 1,
1.130294, 1.220601, 0.3875618, 1, 0, 0, 1, 1,
1.1328, -0.1377026, 2.341633, 1, 0, 0, 1, 1,
1.134975, 1.379154, -0.1605539, 1, 0, 0, 1, 1,
1.135143, -2.060923, 2.684797, 0, 0, 0, 1, 1,
1.13584, -1.109642, 4.964322, 0, 0, 0, 1, 1,
1.14017, -0.1139576, 1.998095, 0, 0, 0, 1, 1,
1.152831, -0.1945289, 2.102351, 0, 0, 0, 1, 1,
1.153592, 0.7158313, 0.2828285, 0, 0, 0, 1, 1,
1.154934, -0.1246568, 2.286187, 0, 0, 0, 1, 1,
1.162229, 0.4633379, -0.350463, 0, 0, 0, 1, 1,
1.162846, 0.7401592, 1.560798, 1, 1, 1, 1, 1,
1.166942, -1.645131, 2.57122, 1, 1, 1, 1, 1,
1.170436, -1.109751, 1.705858, 1, 1, 1, 1, 1,
1.181755, 0.7152033, -0.3137074, 1, 1, 1, 1, 1,
1.183147, -2.181376, 1.900154, 1, 1, 1, 1, 1,
1.203845, 0.3186873, 1.490003, 1, 1, 1, 1, 1,
1.205725, -1.11211, 1.693904, 1, 1, 1, 1, 1,
1.212765, -0.722626, 1.774203, 1, 1, 1, 1, 1,
1.215682, -0.3344241, 1.670896, 1, 1, 1, 1, 1,
1.220915, -1.579128, 2.630001, 1, 1, 1, 1, 1,
1.225024, 0.1102904, 0.9360321, 1, 1, 1, 1, 1,
1.232217, 0.9507719, 1.9797, 1, 1, 1, 1, 1,
1.234955, 1.280013, -0.1307203, 1, 1, 1, 1, 1,
1.243272, -1.266095, 3.272357, 1, 1, 1, 1, 1,
1.249903, 1.30652, 0.8346588, 1, 1, 1, 1, 1,
1.25234, -0.1189752, 1.968268, 0, 0, 1, 1, 1,
1.258408, -0.8857612, 2.66766, 1, 0, 0, 1, 1,
1.264958, 0.3751428, 0.6288743, 1, 0, 0, 1, 1,
1.272211, -0.04838447, 2.676783, 1, 0, 0, 1, 1,
1.276269, -0.9322295, 0.5886445, 1, 0, 0, 1, 1,
1.2819, 0.7220391, 0.07099713, 1, 0, 0, 1, 1,
1.29217, -0.1340711, 1.619595, 0, 0, 0, 1, 1,
1.296089, -0.8670668, 1.68851, 0, 0, 0, 1, 1,
1.298439, -0.2265993, 0.676754, 0, 0, 0, 1, 1,
1.301188, 1.91368, 1.079644, 0, 0, 0, 1, 1,
1.303897, 0.0883101, 4.19396, 0, 0, 0, 1, 1,
1.305167, -0.06895491, 2.066562, 0, 0, 0, 1, 1,
1.308715, -0.2162519, 1.074403, 0, 0, 0, 1, 1,
1.30902, -1.856111, 3.045552, 1, 1, 1, 1, 1,
1.313074, -0.3519317, 4.04651, 1, 1, 1, 1, 1,
1.323465, -0.5820894, 1.874058, 1, 1, 1, 1, 1,
1.328811, 0.6545192, 1.050782, 1, 1, 1, 1, 1,
1.339895, -1.368043, 2.714243, 1, 1, 1, 1, 1,
1.340008, -2.113623, 3.519666, 1, 1, 1, 1, 1,
1.353828, 0.7042083, 1.10534, 1, 1, 1, 1, 1,
1.355803, 0.5059056, -1.602127, 1, 1, 1, 1, 1,
1.356019, 1.165242, -0.8200235, 1, 1, 1, 1, 1,
1.358804, 1.242672, 2.095219, 1, 1, 1, 1, 1,
1.361832, 0.9809135, 1.315784, 1, 1, 1, 1, 1,
1.36333, 0.3820322, -0.2293633, 1, 1, 1, 1, 1,
1.370855, 0.05793651, -1.082858, 1, 1, 1, 1, 1,
1.376022, 0.1457684, 1.536602, 1, 1, 1, 1, 1,
1.377272, -1.908515, 2.63854, 1, 1, 1, 1, 1,
1.377438, 0.2363295, 1.080266, 0, 0, 1, 1, 1,
1.382787, -1.153945, 1.416685, 1, 0, 0, 1, 1,
1.395969, 0.008613996, 1.987207, 1, 0, 0, 1, 1,
1.410936, 0.4956745, 1.829424, 1, 0, 0, 1, 1,
1.411531, -0.1309116, 0.6929592, 1, 0, 0, 1, 1,
1.420079, 1.173657, -0.01520231, 1, 0, 0, 1, 1,
1.426324, 1.274247, -1.486171, 0, 0, 0, 1, 1,
1.432491, -0.5358518, 2.884348, 0, 0, 0, 1, 1,
1.435107, 1.638342, 0.8070037, 0, 0, 0, 1, 1,
1.435728, -0.197226, 0.5579234, 0, 0, 0, 1, 1,
1.449255, -0.2660915, 3.438051, 0, 0, 0, 1, 1,
1.451416, 0.6719279, 0.01828914, 0, 0, 0, 1, 1,
1.453532, -2.220994, 1.954336, 0, 0, 0, 1, 1,
1.458719, 0.964229, 0.329714, 1, 1, 1, 1, 1,
1.468179, 0.8392772, 1.887938, 1, 1, 1, 1, 1,
1.475184, 0.9659625, 1.153368, 1, 1, 1, 1, 1,
1.479547, -0.7774935, 2.491232, 1, 1, 1, 1, 1,
1.48006, 0.8821978, 0.4502362, 1, 1, 1, 1, 1,
1.480736, 0.9157589, 1.730402, 1, 1, 1, 1, 1,
1.493824, 1.136647, 1.246614, 1, 1, 1, 1, 1,
1.50008, 2.112642, -0.3932119, 1, 1, 1, 1, 1,
1.502719, -0.4263147, 2.565778, 1, 1, 1, 1, 1,
1.503911, 0.1810315, 1.737588, 1, 1, 1, 1, 1,
1.505075, -1.599824, 2.86093, 1, 1, 1, 1, 1,
1.545872, -0.01972392, 1.48449, 1, 1, 1, 1, 1,
1.558488, -1.399963, 3.162075, 1, 1, 1, 1, 1,
1.558594, 0.6618727, -0.718028, 1, 1, 1, 1, 1,
1.574396, 0.3157276, 1.030348, 1, 1, 1, 1, 1,
1.610157, -1.149882, 1.456842, 0, 0, 1, 1, 1,
1.624363, 0.3322318, 2.723949, 1, 0, 0, 1, 1,
1.655406, -0.7771148, 1.459969, 1, 0, 0, 1, 1,
1.659043, 0.3617755, 1.672892, 1, 0, 0, 1, 1,
1.66235, 0.6525152, 2.852884, 1, 0, 0, 1, 1,
1.676204, 0.9518252, 0.8725216, 1, 0, 0, 1, 1,
1.692131, -0.2588632, 0.7528917, 0, 0, 0, 1, 1,
1.697007, -0.4952926, 1.822417, 0, 0, 0, 1, 1,
1.707002, 0.6328213, 1.282729, 0, 0, 0, 1, 1,
1.728114, -1.10191, 1.548346, 0, 0, 0, 1, 1,
1.736135, -1.26774, 1.338511, 0, 0, 0, 1, 1,
1.758553, -0.5120634, 4.838419, 0, 0, 0, 1, 1,
1.770137, 1.33513, 0.3671273, 0, 0, 0, 1, 1,
1.781316, -0.9501724, 2.626695, 1, 1, 1, 1, 1,
1.788782, 2.014055, 1.226087, 1, 1, 1, 1, 1,
1.792839, -1.000419, 2.756346, 1, 1, 1, 1, 1,
1.799141, 0.7988006, 2.923393, 1, 1, 1, 1, 1,
1.815153, 2.025624, -0.438141, 1, 1, 1, 1, 1,
1.847473, 0.7994599, 1.737746, 1, 1, 1, 1, 1,
1.886114, 1.65296, 3.195533, 1, 1, 1, 1, 1,
1.895252, 0.761391, 1.043151, 1, 1, 1, 1, 1,
1.926524, -0.8402007, 2.748485, 1, 1, 1, 1, 1,
1.93545, 2.164392, 3.294758, 1, 1, 1, 1, 1,
1.9365, 0.01665096, 0.5473655, 1, 1, 1, 1, 1,
1.939692, 1.959715, 0.3645529, 1, 1, 1, 1, 1,
1.95694, 2.315349, 0.2545451, 1, 1, 1, 1, 1,
1.967037, 1.79519, 1.181012, 1, 1, 1, 1, 1,
2.070159, 1.144543, 1.003683, 1, 1, 1, 1, 1,
2.099623, 0.3860366, 0.1611873, 0, 0, 1, 1, 1,
2.148496, -0.7255052, 1.309297, 1, 0, 0, 1, 1,
2.167809, -0.5913088, 1.472833, 1, 0, 0, 1, 1,
2.21978, -1.139105, 1.772208, 1, 0, 0, 1, 1,
2.25667, -0.5115564, 1.662275, 1, 0, 0, 1, 1,
2.270995, 0.8189248, 2.353808, 1, 0, 0, 1, 1,
2.294536, -0.7858171, 0.1431949, 0, 0, 0, 1, 1,
2.366767, 0.06917113, 3.711169, 0, 0, 0, 1, 1,
2.368883, -0.7547038, 3.131457, 0, 0, 0, 1, 1,
2.384326, -0.303133, 0.8371199, 0, 0, 0, 1, 1,
2.438934, -1.372722, 1.53275, 0, 0, 0, 1, 1,
2.44133, 0.1738864, 1.694258, 0, 0, 0, 1, 1,
2.463777, 0.684342, 1.418632, 0, 0, 0, 1, 1,
2.46994, -0.2340661, 1.959331, 1, 1, 1, 1, 1,
2.627568, 1.128016, 2.981546, 1, 1, 1, 1, 1,
2.64418, 0.3898821, -0.217142, 1, 1, 1, 1, 1,
2.665204, -0.04357197, 2.633642, 1, 1, 1, 1, 1,
2.733416, 1.467226, 1.080892, 1, 1, 1, 1, 1,
2.912401, 0.7002109, -0.4001395, 1, 1, 1, 1, 1,
3.073091, -0.7024819, 0.5192807, 1, 1, 1, 1, 1
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
var radius = 9.898964;
var distance = 34.76969;
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
mvMatrix.translate( 0.08243275, -0.2520039, 0.5347366 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.76969);
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