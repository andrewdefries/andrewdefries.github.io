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
-3.637349, 0.08304389, -2.837674, 1, 0, 0, 1,
-3.151132, -0.09570403, -3.521449, 1, 0.007843138, 0, 1,
-2.921593, -1.724869, -0.1364132, 1, 0.01176471, 0, 1,
-2.840348, 1.034661, 1.032407, 1, 0.01960784, 0, 1,
-2.737705, 0.1492545, -3.422641, 1, 0.02352941, 0, 1,
-2.57402, 1.511723, -0.5644795, 1, 0.03137255, 0, 1,
-2.573941, -0.1083137, -1.68511, 1, 0.03529412, 0, 1,
-2.49347, 0.727617, -3.857642, 1, 0.04313726, 0, 1,
-2.473013, -0.90622, -0.9279498, 1, 0.04705882, 0, 1,
-2.416926, 0.6448429, -1.955137, 1, 0.05490196, 0, 1,
-2.384024, 0.2484915, -3.08292, 1, 0.05882353, 0, 1,
-2.321314, 0.7919188, -0.6348475, 1, 0.06666667, 0, 1,
-2.311502, -0.5452741, -3.573154, 1, 0.07058824, 0, 1,
-2.25037, 0.365031, -0.9497406, 1, 0.07843138, 0, 1,
-2.247534, -0.1252614, -0.7467389, 1, 0.08235294, 0, 1,
-2.218907, -0.692671, 0.09743603, 1, 0.09019608, 0, 1,
-2.194334, -1.209028, -2.205032, 1, 0.09411765, 0, 1,
-2.178429, -0.4473884, -0.4328601, 1, 0.1019608, 0, 1,
-2.16434, -1.117256, -2.912285, 1, 0.1098039, 0, 1,
-2.07763, -0.8866798, -2.01608, 1, 0.1137255, 0, 1,
-2.070082, -0.9790591, -2.113306, 1, 0.1215686, 0, 1,
-2.066419, -1.959306, -1.602381, 1, 0.1254902, 0, 1,
-2.023005, 1.063361, -0.5427808, 1, 0.1333333, 0, 1,
-2.0035, -1.120711, -3.394956, 1, 0.1372549, 0, 1,
-1.973721, 1.617803, -0.5746244, 1, 0.145098, 0, 1,
-1.969784, -0.3161616, -0.3621255, 1, 0.1490196, 0, 1,
-1.914672, 0.4511022, -0.5439587, 1, 0.1568628, 0, 1,
-1.91178, 0.8313066, -0.4675941, 1, 0.1607843, 0, 1,
-1.893396, 0.6261922, -1.668314, 1, 0.1686275, 0, 1,
-1.839551, 1.156735, 0.8847695, 1, 0.172549, 0, 1,
-1.837854, 1.015625, -2.370286, 1, 0.1803922, 0, 1,
-1.834329, 0.2050642, -1.598288, 1, 0.1843137, 0, 1,
-1.821125, -1.202432, -3.344469, 1, 0.1921569, 0, 1,
-1.82108, -1.586366, -2.577103, 1, 0.1960784, 0, 1,
-1.820394, -1.197366, -2.232415, 1, 0.2039216, 0, 1,
-1.802978, 0.3066072, -2.752981, 1, 0.2117647, 0, 1,
-1.793509, -0.817217, -0.5672994, 1, 0.2156863, 0, 1,
-1.792982, -0.2218387, -2.022632, 1, 0.2235294, 0, 1,
-1.773324, 0.1990942, -0.1316496, 1, 0.227451, 0, 1,
-1.768927, 1.019738, -1.563984, 1, 0.2352941, 0, 1,
-1.767268, 0.02284837, -1.637806, 1, 0.2392157, 0, 1,
-1.748438, -1.54124, -1.814959, 1, 0.2470588, 0, 1,
-1.747963, 0.1817391, -3.226686, 1, 0.2509804, 0, 1,
-1.742966, -0.6981834, -1.95445, 1, 0.2588235, 0, 1,
-1.692803, 1.54451, 0.399255, 1, 0.2627451, 0, 1,
-1.69148, -0.3886707, -1.730225, 1, 0.2705882, 0, 1,
-1.690611, 1.067755, -0.2848793, 1, 0.2745098, 0, 1,
-1.680365, -1.531129, -3.443091, 1, 0.282353, 0, 1,
-1.680231, -0.3604979, -1.113393, 1, 0.2862745, 0, 1,
-1.677432, 1.731205, -1.264655, 1, 0.2941177, 0, 1,
-1.66881, 0.05700353, -2.926617, 1, 0.3019608, 0, 1,
-1.654885, -0.3708822, -2.157087, 1, 0.3058824, 0, 1,
-1.630481, -1.344406, -2.603095, 1, 0.3137255, 0, 1,
-1.628493, -0.4737315, -3.702246, 1, 0.3176471, 0, 1,
-1.627757, 0.6858373, -1.133322, 1, 0.3254902, 0, 1,
-1.62628, 3.002954, -1.877049, 1, 0.3294118, 0, 1,
-1.600893, 0.8348848, -2.468789, 1, 0.3372549, 0, 1,
-1.597891, -0.7009625, -3.143797, 1, 0.3411765, 0, 1,
-1.594139, -2.756553, -2.679956, 1, 0.3490196, 0, 1,
-1.589787, -0.08630533, -0.5955694, 1, 0.3529412, 0, 1,
-1.589004, -1.846243, -3.105658, 1, 0.3607843, 0, 1,
-1.585382, -1.745517, -0.2196991, 1, 0.3647059, 0, 1,
-1.576826, -1.199229, -1.011138, 1, 0.372549, 0, 1,
-1.573262, -0.04778548, -2.228156, 1, 0.3764706, 0, 1,
-1.562349, 2.114771, 0.3180526, 1, 0.3843137, 0, 1,
-1.54206, -1.086567, -4.199145, 1, 0.3882353, 0, 1,
-1.506385, -0.0173826, -0.4559792, 1, 0.3960784, 0, 1,
-1.504131, -2.199094, -3.688376, 1, 0.4039216, 0, 1,
-1.487359, 0.3581494, -1.148335, 1, 0.4078431, 0, 1,
-1.486678, -0.5059254, -3.220115, 1, 0.4156863, 0, 1,
-1.482749, 0.6605965, -1.072777, 1, 0.4196078, 0, 1,
-1.480314, 1.283315, -2.13609, 1, 0.427451, 0, 1,
-1.467743, 0.1760866, -2.840702, 1, 0.4313726, 0, 1,
-1.461671, -0.6183876, -1.928325, 1, 0.4392157, 0, 1,
-1.443, -0.8001252, -1.190154, 1, 0.4431373, 0, 1,
-1.438498, 0.2510146, -1.957991, 1, 0.4509804, 0, 1,
-1.429599, -0.2071126, -0.905897, 1, 0.454902, 0, 1,
-1.425017, 0.4290982, -0.4252691, 1, 0.4627451, 0, 1,
-1.415407, 0.1486037, 0.5428717, 1, 0.4666667, 0, 1,
-1.394224, -0.1616222, -0.512378, 1, 0.4745098, 0, 1,
-1.392432, -1.088411, -2.720552, 1, 0.4784314, 0, 1,
-1.383586, -0.09934752, -1.132916, 1, 0.4862745, 0, 1,
-1.381664, -0.5628185, -2.992323, 1, 0.4901961, 0, 1,
-1.376896, -1.52537, -1.461859, 1, 0.4980392, 0, 1,
-1.374152, -0.01475468, -2.237049, 1, 0.5058824, 0, 1,
-1.371584, -0.02896384, -0.398327, 1, 0.509804, 0, 1,
-1.366484, 0.6405871, 0.2232819, 1, 0.5176471, 0, 1,
-1.364389, 0.5615426, -0.4292177, 1, 0.5215687, 0, 1,
-1.359096, -0.2351932, 0.762805, 1, 0.5294118, 0, 1,
-1.352275, -1.661679, -4.248972, 1, 0.5333334, 0, 1,
-1.347411, -1.025483, -3.952616, 1, 0.5411765, 0, 1,
-1.342419, -0.1419052, -2.036738, 1, 0.5450981, 0, 1,
-1.34135, 0.06779987, -0.4620977, 1, 0.5529412, 0, 1,
-1.322553, -1.520776, -3.163873, 1, 0.5568628, 0, 1,
-1.321102, 2.04831, 0.4257501, 1, 0.5647059, 0, 1,
-1.314687, 1.033555, 0.4969849, 1, 0.5686275, 0, 1,
-1.304772, 0.609386, 0.02010694, 1, 0.5764706, 0, 1,
-1.298864, -0.9005496, -1.023725, 1, 0.5803922, 0, 1,
-1.298144, 2.005126, -0.1110342, 1, 0.5882353, 0, 1,
-1.289963, -0.4299231, -1.797086, 1, 0.5921569, 0, 1,
-1.287659, -0.3669734, -1.700439, 1, 0.6, 0, 1,
-1.28419, 1.465911, 1.133057, 1, 0.6078432, 0, 1,
-1.27073, -1.053661, -2.946479, 1, 0.6117647, 0, 1,
-1.266297, 0.3036436, -1.958665, 1, 0.6196079, 0, 1,
-1.251666, -1.751528, -3.029518, 1, 0.6235294, 0, 1,
-1.242996, 0.2240992, -1.333985, 1, 0.6313726, 0, 1,
-1.238444, 0.9722152, -1.065966, 1, 0.6352941, 0, 1,
-1.237312, -1.315299, -0.3956889, 1, 0.6431373, 0, 1,
-1.234476, -1.247444, -2.316297, 1, 0.6470588, 0, 1,
-1.22473, -0.9082789, -1.939563, 1, 0.654902, 0, 1,
-1.213589, -1.677683, -4.143506, 1, 0.6588235, 0, 1,
-1.213261, 1.403985, -2.037204, 1, 0.6666667, 0, 1,
-1.212245, 0.1047861, -2.791862, 1, 0.6705883, 0, 1,
-1.208182, -0.03109555, -1.117774, 1, 0.6784314, 0, 1,
-1.198996, -1.088841, -2.218239, 1, 0.682353, 0, 1,
-1.195193, 1.373883, 0.1858601, 1, 0.6901961, 0, 1,
-1.180252, -1.534871, -3.255649, 1, 0.6941177, 0, 1,
-1.170857, -0.9767976, -2.506831, 1, 0.7019608, 0, 1,
-1.166819, -0.9377508, -2.879055, 1, 0.7098039, 0, 1,
-1.158959, -1.153872, -2.436075, 1, 0.7137255, 0, 1,
-1.154275, -2.3338, -2.776444, 1, 0.7215686, 0, 1,
-1.151635, 0.07512126, -3.578482, 1, 0.7254902, 0, 1,
-1.148982, 0.4709692, -1.710861, 1, 0.7333333, 0, 1,
-1.147334, 0.4686238, -0.8387136, 1, 0.7372549, 0, 1,
-1.134418, 1.081391, 0.5353202, 1, 0.7450981, 0, 1,
-1.133258, -0.7202429, -4.702231, 1, 0.7490196, 0, 1,
-1.129217, 0.1354981, -3.777281, 1, 0.7568628, 0, 1,
-1.123631, 0.6468663, 0.09427594, 1, 0.7607843, 0, 1,
-1.108835, 0.6172276, 0.1083951, 1, 0.7686275, 0, 1,
-1.101812, -0.7243105, -1.60839, 1, 0.772549, 0, 1,
-1.100323, 1.07675, -0.1714758, 1, 0.7803922, 0, 1,
-1.09923, 0.5038756, -1.627465, 1, 0.7843137, 0, 1,
-1.08051, -0.8366592, -2.348877, 1, 0.7921569, 0, 1,
-1.078244, 0.2330785, 0.4600936, 1, 0.7960784, 0, 1,
-1.070187, 0.5858894, 0.03287754, 1, 0.8039216, 0, 1,
-1.069618, 1.321881, -1.665734, 1, 0.8117647, 0, 1,
-1.067684, -1.314382, -3.292095, 1, 0.8156863, 0, 1,
-1.065967, -1.271443, -2.890561, 1, 0.8235294, 0, 1,
-1.063137, 0.6198001, 0.03802278, 1, 0.827451, 0, 1,
-1.050279, -0.688868, -1.920684, 1, 0.8352941, 0, 1,
-1.042821, 0.3848019, -2.186227, 1, 0.8392157, 0, 1,
-1.035171, 0.6875818, -0.9062092, 1, 0.8470588, 0, 1,
-1.034302, -1.338359, -1.493952, 1, 0.8509804, 0, 1,
-1.031483, 0.1358794, -1.459376, 1, 0.8588235, 0, 1,
-1.022799, -0.3729765, -1.977608, 1, 0.8627451, 0, 1,
-1.016143, -1.765008, -2.61047, 1, 0.8705882, 0, 1,
-1.01373, 0.9891109, 0.4043462, 1, 0.8745098, 0, 1,
-1.003492, 2.370512, -1.145618, 1, 0.8823529, 0, 1,
-0.9914154, -0.0533117, -3.645216, 1, 0.8862745, 0, 1,
-0.9914041, -1.51642, -2.162477, 1, 0.8941177, 0, 1,
-0.9881938, 1.211078, -1.324938, 1, 0.8980392, 0, 1,
-0.9828828, -0.8521779, -0.8567278, 1, 0.9058824, 0, 1,
-0.9822424, -0.3555088, -1.647626, 1, 0.9137255, 0, 1,
-0.9772384, 0.5146459, 0.003946526, 1, 0.9176471, 0, 1,
-0.967147, 0.8188326, -0.4364921, 1, 0.9254902, 0, 1,
-0.9606491, 0.2412412, -2.466959, 1, 0.9294118, 0, 1,
-0.9602451, -2.478805, -3.575867, 1, 0.9372549, 0, 1,
-0.9586059, 0.3898532, -0.8322154, 1, 0.9411765, 0, 1,
-0.9567837, -0.9669185, -2.831926, 1, 0.9490196, 0, 1,
-0.9553488, -0.6141481, -1.887767, 1, 0.9529412, 0, 1,
-0.9521182, 1.405694, -0.0008072353, 1, 0.9607843, 0, 1,
-0.9505199, 0.156308, -1.313658, 1, 0.9647059, 0, 1,
-0.9464025, 1.133104, -1.085601, 1, 0.972549, 0, 1,
-0.9427852, -1.323522, -1.938866, 1, 0.9764706, 0, 1,
-0.9372777, -0.3292924, -2.827377, 1, 0.9843137, 0, 1,
-0.9357216, 0.3704732, -0.590054, 1, 0.9882353, 0, 1,
-0.9303132, -0.830141, -1.25006, 1, 0.9960784, 0, 1,
-0.927517, 0.4832138, -2.31857, 0.9960784, 1, 0, 1,
-0.9216297, -1.007389, -4.14696, 0.9921569, 1, 0, 1,
-0.9178823, -1.171409, -1.989541, 0.9843137, 1, 0, 1,
-0.9158763, -0.5547186, -0.4646603, 0.9803922, 1, 0, 1,
-0.9107517, -0.6377066, -1.456693, 0.972549, 1, 0, 1,
-0.9101853, 1.349279, -0.5213597, 0.9686275, 1, 0, 1,
-0.9080381, 1.729062, -0.4413963, 0.9607843, 1, 0, 1,
-0.905338, 0.1260267, -1.142445, 0.9568627, 1, 0, 1,
-0.9039865, -0.2068018, -1.105515, 0.9490196, 1, 0, 1,
-0.9028682, -0.2654414, -2.244526, 0.945098, 1, 0, 1,
-0.8999103, 0.03691507, -0.8314224, 0.9372549, 1, 0, 1,
-0.8955253, -2.137448, -2.38894, 0.9333333, 1, 0, 1,
-0.8939741, 0.3713096, 0.1292896, 0.9254902, 1, 0, 1,
-0.8844547, 1.712348, -1.656127, 0.9215686, 1, 0, 1,
-0.878543, -0.7908419, -1.354624, 0.9137255, 1, 0, 1,
-0.8734674, 0.717896, 0.3716855, 0.9098039, 1, 0, 1,
-0.8715091, -1.256773, -1.70916, 0.9019608, 1, 0, 1,
-0.8697996, 0.3204404, -2.251026, 0.8941177, 1, 0, 1,
-0.8654537, -0.09161253, 0.2098121, 0.8901961, 1, 0, 1,
-0.8654318, 1.386472, -2.439924, 0.8823529, 1, 0, 1,
-0.8634018, -0.04210906, -0.4023841, 0.8784314, 1, 0, 1,
-0.8570951, 0.6016874, -1.924257, 0.8705882, 1, 0, 1,
-0.8524368, -0.4253114, -2.797361, 0.8666667, 1, 0, 1,
-0.8491125, -0.1677942, -1.614077, 0.8588235, 1, 0, 1,
-0.8467354, 0.1846327, -1.154763, 0.854902, 1, 0, 1,
-0.8405524, -0.5736722, -2.080858, 0.8470588, 1, 0, 1,
-0.8391997, -0.3559694, -2.803869, 0.8431373, 1, 0, 1,
-0.83694, -0.5224442, -1.340577, 0.8352941, 1, 0, 1,
-0.832175, -1.70208, -2.711188, 0.8313726, 1, 0, 1,
-0.8177471, -0.851956, -2.827933, 0.8235294, 1, 0, 1,
-0.8140101, 1.339517, -0.1607937, 0.8196079, 1, 0, 1,
-0.8107469, -2.215904, -1.470752, 0.8117647, 1, 0, 1,
-0.8084268, 0.4407123, -0.17207, 0.8078431, 1, 0, 1,
-0.8071092, -1.694838, -3.447098, 0.8, 1, 0, 1,
-0.7975224, 1.318671, -0.683993, 0.7921569, 1, 0, 1,
-0.7927426, -0.9712896, -2.633268, 0.7882353, 1, 0, 1,
-0.7829466, -0.6772431, -3.487318, 0.7803922, 1, 0, 1,
-0.7780768, -0.5282632, -2.145912, 0.7764706, 1, 0, 1,
-0.775831, -0.4813276, -1.566545, 0.7686275, 1, 0, 1,
-0.7713454, 0.03239691, -1.272619, 0.7647059, 1, 0, 1,
-0.7709133, 0.4486769, 0.03642752, 0.7568628, 1, 0, 1,
-0.7618532, -0.9938379, -6.055866, 0.7529412, 1, 0, 1,
-0.7578749, 0.5993496, -2.046201, 0.7450981, 1, 0, 1,
-0.7575927, -0.9644237, -3.689477, 0.7411765, 1, 0, 1,
-0.7569225, 0.8990024, -0.5963374, 0.7333333, 1, 0, 1,
-0.7532125, -1.381761, -2.914338, 0.7294118, 1, 0, 1,
-0.750845, 0.06143331, -1.176705, 0.7215686, 1, 0, 1,
-0.7448608, -0.6462575, -1.588422, 0.7176471, 1, 0, 1,
-0.7447734, 0.3066783, -0.1991815, 0.7098039, 1, 0, 1,
-0.7405228, -1.738637, -1.03735, 0.7058824, 1, 0, 1,
-0.7395002, 1.080917, -0.8608225, 0.6980392, 1, 0, 1,
-0.7356344, -0.65487, -0.5740649, 0.6901961, 1, 0, 1,
-0.7299222, 0.9139404, -1.746882, 0.6862745, 1, 0, 1,
-0.7289364, 1.15392, 0.1421662, 0.6784314, 1, 0, 1,
-0.7246521, 0.8933537, 0.4665733, 0.6745098, 1, 0, 1,
-0.7219408, 0.809999, 0.8433411, 0.6666667, 1, 0, 1,
-0.7204925, 1.199891, 0.9401401, 0.6627451, 1, 0, 1,
-0.7182556, 1.005734, -1.87373, 0.654902, 1, 0, 1,
-0.7173882, 0.4087534, 0.2535633, 0.6509804, 1, 0, 1,
-0.7065021, -0.9690758, -2.46599, 0.6431373, 1, 0, 1,
-0.7060233, -0.03463385, -1.603908, 0.6392157, 1, 0, 1,
-0.6989009, -0.08722317, -3.103909, 0.6313726, 1, 0, 1,
-0.6972474, -1.200229, -2.125996, 0.627451, 1, 0, 1,
-0.6917791, -0.6244702, -2.296567, 0.6196079, 1, 0, 1,
-0.6907918, 0.1714071, -1.478233, 0.6156863, 1, 0, 1,
-0.6874396, -0.5689804, -2.928827, 0.6078432, 1, 0, 1,
-0.6849208, 1.032028, 0.01170415, 0.6039216, 1, 0, 1,
-0.6813827, 1.040324, 0.6972823, 0.5960785, 1, 0, 1,
-0.6781755, 0.644918, -0.3463933, 0.5882353, 1, 0, 1,
-0.6757913, 0.2311066, -1.899715, 0.5843138, 1, 0, 1,
-0.6718234, -0.1842413, -2.750669, 0.5764706, 1, 0, 1,
-0.6668443, 2.862391, -0.6988982, 0.572549, 1, 0, 1,
-0.6605496, -0.6806725, -1.67161, 0.5647059, 1, 0, 1,
-0.6596221, 0.08075122, -1.866405, 0.5607843, 1, 0, 1,
-0.6586229, 0.2882032, -1.390868, 0.5529412, 1, 0, 1,
-0.6575533, 0.4620069, -0.7798609, 0.5490196, 1, 0, 1,
-0.6574963, 1.550141, 0.6090339, 0.5411765, 1, 0, 1,
-0.6560606, 0.2641464, -0.6809511, 0.5372549, 1, 0, 1,
-0.6500778, 1.071772, -1.789569, 0.5294118, 1, 0, 1,
-0.6472077, -0.07590818, -1.646195, 0.5254902, 1, 0, 1,
-0.6442083, -0.0528565, -1.482752, 0.5176471, 1, 0, 1,
-0.6376147, -1.292943, -2.138348, 0.5137255, 1, 0, 1,
-0.6364359, -0.3836197, -2.101832, 0.5058824, 1, 0, 1,
-0.6266555, -0.3383431, -0.991732, 0.5019608, 1, 0, 1,
-0.6250117, -0.8196074, -1.053789, 0.4941176, 1, 0, 1,
-0.6214209, -0.4904718, -0.3711788, 0.4862745, 1, 0, 1,
-0.6150219, -0.8948218, -2.087734, 0.4823529, 1, 0, 1,
-0.6087383, 0.2312879, -1.781339, 0.4745098, 1, 0, 1,
-0.6080351, -0.4373348, -2.998649, 0.4705882, 1, 0, 1,
-0.6068473, -0.1705538, -2.295796, 0.4627451, 1, 0, 1,
-0.6022196, 0.01172093, -1.536919, 0.4588235, 1, 0, 1,
-0.5952122, -0.7705244, -3.874789, 0.4509804, 1, 0, 1,
-0.588378, -1.329542, -3.187579, 0.4470588, 1, 0, 1,
-0.5878363, 1.240127, -0.9974488, 0.4392157, 1, 0, 1,
-0.5775712, -2.972898, -1.913342, 0.4352941, 1, 0, 1,
-0.5750796, 1.814004, -0.2950695, 0.427451, 1, 0, 1,
-0.5720021, -0.02900291, -2.769406, 0.4235294, 1, 0, 1,
-0.5711581, 0.9556271, -1.409537, 0.4156863, 1, 0, 1,
-0.570107, -2.261243, -1.404778, 0.4117647, 1, 0, 1,
-0.5668243, 1.038351, -0.5260898, 0.4039216, 1, 0, 1,
-0.5648952, -0.5253759, -0.2359622, 0.3960784, 1, 0, 1,
-0.5636368, -0.03449562, -0.937649, 0.3921569, 1, 0, 1,
-0.5566611, -0.6517235, -3.044703, 0.3843137, 1, 0, 1,
-0.5536348, 0.5738321, 0.8385878, 0.3803922, 1, 0, 1,
-0.5529882, -0.3705895, -0.6216043, 0.372549, 1, 0, 1,
-0.5503356, 0.2944869, -0.4299529, 0.3686275, 1, 0, 1,
-0.549705, 0.4181838, -0.1667301, 0.3607843, 1, 0, 1,
-0.5483918, -0.5856469, -5.143698, 0.3568628, 1, 0, 1,
-0.5481246, 0.5985831, -0.2257127, 0.3490196, 1, 0, 1,
-0.5382202, 0.2686505, 0.4462498, 0.345098, 1, 0, 1,
-0.5358461, -1.941315, -1.762853, 0.3372549, 1, 0, 1,
-0.5327303, 0.3699894, -0.2030792, 0.3333333, 1, 0, 1,
-0.5225072, -0.7841313, -3.346191, 0.3254902, 1, 0, 1,
-0.5204383, -1.50019, -1.97265, 0.3215686, 1, 0, 1,
-0.5200565, 0.215143, -0.4317605, 0.3137255, 1, 0, 1,
-0.5170798, -1.098269, -4.257015, 0.3098039, 1, 0, 1,
-0.512185, 0.7807438, -1.874516, 0.3019608, 1, 0, 1,
-0.5110518, 1.600739, -0.4378694, 0.2941177, 1, 0, 1,
-0.5091888, 0.7572335, 0.5388831, 0.2901961, 1, 0, 1,
-0.4987173, -1.392641, -3.163354, 0.282353, 1, 0, 1,
-0.4963879, 0.8299052, -1.373562, 0.2784314, 1, 0, 1,
-0.4958887, 0.4747163, 1.15331, 0.2705882, 1, 0, 1,
-0.4950247, -0.9701664, -5.345129, 0.2666667, 1, 0, 1,
-0.4912832, 0.3973272, 0.1823217, 0.2588235, 1, 0, 1,
-0.4908663, 0.2924172, -3.36771, 0.254902, 1, 0, 1,
-0.4900941, -1.116971, -3.384314, 0.2470588, 1, 0, 1,
-0.4827251, -1.227355, -2.565001, 0.2431373, 1, 0, 1,
-0.4816065, -0.4962757, -1.651326, 0.2352941, 1, 0, 1,
-0.4812316, -0.9094075, -3.286355, 0.2313726, 1, 0, 1,
-0.4774826, -1.108611, -1.48274, 0.2235294, 1, 0, 1,
-0.4716019, -1.373222, -4.526436, 0.2196078, 1, 0, 1,
-0.470617, -0.4090875, -2.214521, 0.2117647, 1, 0, 1,
-0.4657512, -0.3030725, -3.456475, 0.2078431, 1, 0, 1,
-0.4652661, 0.3439192, -0.2470513, 0.2, 1, 0, 1,
-0.4651999, 0.1789322, -0.8653434, 0.1921569, 1, 0, 1,
-0.4629995, 2.579194, -0.8986132, 0.1882353, 1, 0, 1,
-0.4624163, -0.004926222, -1.8976, 0.1803922, 1, 0, 1,
-0.4608796, -0.00144532, -1.888432, 0.1764706, 1, 0, 1,
-0.4569889, -2.460205, -2.940427, 0.1686275, 1, 0, 1,
-0.4560687, -0.5663885, -2.564817, 0.1647059, 1, 0, 1,
-0.4547944, -0.3379838, -3.122706, 0.1568628, 1, 0, 1,
-0.451725, -1.19967, -1.848369, 0.1529412, 1, 0, 1,
-0.4513257, -0.7045811, -4.079796, 0.145098, 1, 0, 1,
-0.4414231, 0.09510354, -2.333447, 0.1411765, 1, 0, 1,
-0.4411681, 2.284634, 1.116077, 0.1333333, 1, 0, 1,
-0.438755, -0.6159042, -3.553252, 0.1294118, 1, 0, 1,
-0.4377539, 0.8908036, 0.1664016, 0.1215686, 1, 0, 1,
-0.4275101, -0.2260431, -2.653212, 0.1176471, 1, 0, 1,
-0.4273183, 1.517568, -2.535871, 0.1098039, 1, 0, 1,
-0.4209089, 0.7047622, -2.076576, 0.1058824, 1, 0, 1,
-0.4205134, 0.008287968, -2.348092, 0.09803922, 1, 0, 1,
-0.4189721, 0.07948034, -1.913388, 0.09019608, 1, 0, 1,
-0.4142947, -1.353757, -3.367409, 0.08627451, 1, 0, 1,
-0.4142264, 0.3316537, -2.24512, 0.07843138, 1, 0, 1,
-0.4127862, -0.3687021, -2.221368, 0.07450981, 1, 0, 1,
-0.4102247, -0.3362034, -2.967749, 0.06666667, 1, 0, 1,
-0.4079552, -0.6722754, -3.111055, 0.0627451, 1, 0, 1,
-0.4075731, -2.158113, -2.827358, 0.05490196, 1, 0, 1,
-0.3996212, 1.430037, -1.062006, 0.05098039, 1, 0, 1,
-0.3902791, 0.2872134, -0.3803099, 0.04313726, 1, 0, 1,
-0.388816, 0.7402402, -1.296171, 0.03921569, 1, 0, 1,
-0.3841737, 1.59542, 0.7780771, 0.03137255, 1, 0, 1,
-0.3812125, 1.220929, -0.6617417, 0.02745098, 1, 0, 1,
-0.3805473, 0.6764923, -2.094128, 0.01960784, 1, 0, 1,
-0.3795376, 0.665251, -0.03095409, 0.01568628, 1, 0, 1,
-0.373976, 0.6488989, -0.654887, 0.007843138, 1, 0, 1,
-0.373761, -0.4225764, -2.352569, 0.003921569, 1, 0, 1,
-0.3701668, -2.40145, -3.464374, 0, 1, 0.003921569, 1,
-0.3606461, -0.5930742, -4.394736, 0, 1, 0.01176471, 1,
-0.3592478, -0.1554251, 0.3640354, 0, 1, 0.01568628, 1,
-0.3581361, -1.380281, -0.7535172, 0, 1, 0.02352941, 1,
-0.3581159, 0.9403005, -0.5656332, 0, 1, 0.02745098, 1,
-0.3524877, -0.6114891, -3.936157, 0, 1, 0.03529412, 1,
-0.3480016, -0.4727177, -2.484815, 0, 1, 0.03921569, 1,
-0.3449089, -0.8345708, -2.018874, 0, 1, 0.04705882, 1,
-0.3421138, 1.166219, -0.8334522, 0, 1, 0.05098039, 1,
-0.3337054, -2.099924, -4.711093, 0, 1, 0.05882353, 1,
-0.3332968, -1.121752, -1.30565, 0, 1, 0.0627451, 1,
-0.3310736, -1.030042, -2.442086, 0, 1, 0.07058824, 1,
-0.3310339, -0.4284331, -2.601121, 0, 1, 0.07450981, 1,
-0.3276013, -0.05700402, -2.514157, 0, 1, 0.08235294, 1,
-0.3272068, 0.1836603, -0.601684, 0, 1, 0.08627451, 1,
-0.3218296, -0.8985671, -2.898917, 0, 1, 0.09411765, 1,
-0.3123666, 0.157413, -2.425086, 0, 1, 0.1019608, 1,
-0.3110666, 0.5757159, 0.7119687, 0, 1, 0.1058824, 1,
-0.3033388, -0.5309842, -3.084506, 0, 1, 0.1137255, 1,
-0.2972585, 0.6484926, -1.875284, 0, 1, 0.1176471, 1,
-0.2942551, 1.649349, 1.175444, 0, 1, 0.1254902, 1,
-0.2911031, -0.27105, -3.729379, 0, 1, 0.1294118, 1,
-0.2904165, 0.6372756, 0.9066342, 0, 1, 0.1372549, 1,
-0.2898881, -0.2013672, -3.325176, 0, 1, 0.1411765, 1,
-0.2893515, -2.13795, -1.883047, 0, 1, 0.1490196, 1,
-0.2889506, 0.1673224, -0.4985617, 0, 1, 0.1529412, 1,
-0.2885993, -1.027851, -3.795354, 0, 1, 0.1607843, 1,
-0.2873897, -0.8629221, -3.259732, 0, 1, 0.1647059, 1,
-0.2849717, -1.650524, -3.07645, 0, 1, 0.172549, 1,
-0.2834931, 0.610522, -0.7316592, 0, 1, 0.1764706, 1,
-0.2828759, 1.57458, -0.4323639, 0, 1, 0.1843137, 1,
-0.2821083, 0.3523916, -0.1804565, 0, 1, 0.1882353, 1,
-0.2797014, 0.8787146, -0.4693214, 0, 1, 0.1960784, 1,
-0.2774596, 0.8165634, -0.9635085, 0, 1, 0.2039216, 1,
-0.2760459, 1.32969, -1.59565, 0, 1, 0.2078431, 1,
-0.2753853, 0.1931317, 1.31275, 0, 1, 0.2156863, 1,
-0.2726008, 0.5951862, -0.6768126, 0, 1, 0.2196078, 1,
-0.271031, 0.3419227, -0.4259627, 0, 1, 0.227451, 1,
-0.269993, 1.317001, -0.03574522, 0, 1, 0.2313726, 1,
-0.2641663, -0.6935979, -2.277308, 0, 1, 0.2392157, 1,
-0.2629637, 1.064407, 0.3796284, 0, 1, 0.2431373, 1,
-0.2569039, 0.234451, -2.729962, 0, 1, 0.2509804, 1,
-0.2568749, 0.6130403, -0.08621364, 0, 1, 0.254902, 1,
-0.2557693, -1.591749, -2.935685, 0, 1, 0.2627451, 1,
-0.2557504, 0.03498873, -1.813653, 0, 1, 0.2666667, 1,
-0.252317, -0.9825675, -4.212962, 0, 1, 0.2745098, 1,
-0.2503543, 1.655205, -0.3603787, 0, 1, 0.2784314, 1,
-0.2494347, 0.3650787, -0.823455, 0, 1, 0.2862745, 1,
-0.2478878, -0.209602, -2.89192, 0, 1, 0.2901961, 1,
-0.2459652, 0.8056518, 1.859607, 0, 1, 0.2980392, 1,
-0.2442242, 1.745263, 1.33078, 0, 1, 0.3058824, 1,
-0.238577, 0.859682, 0.6559178, 0, 1, 0.3098039, 1,
-0.2312254, -0.2688038, -3.223993, 0, 1, 0.3176471, 1,
-0.2277946, 0.8532449, -1.317563, 0, 1, 0.3215686, 1,
-0.2245828, 0.9419412, -1.260131, 0, 1, 0.3294118, 1,
-0.2235582, 1.206114, -0.374683, 0, 1, 0.3333333, 1,
-0.2221837, 0.6928651, -0.7026474, 0, 1, 0.3411765, 1,
-0.2208969, 1.524646, 0.9590354, 0, 1, 0.345098, 1,
-0.214665, -1.075942, -2.965431, 0, 1, 0.3529412, 1,
-0.2124416, 0.3552997, -0.6056194, 0, 1, 0.3568628, 1,
-0.2116688, 0.1430615, -1.204524, 0, 1, 0.3647059, 1,
-0.2105977, -0.3628102, -3.329159, 0, 1, 0.3686275, 1,
-0.2098443, 1.019238, -1.258888, 0, 1, 0.3764706, 1,
-0.2097253, 1.356991, -1.188486, 0, 1, 0.3803922, 1,
-0.2045023, 1.16746, -1.249725, 0, 1, 0.3882353, 1,
-0.2016349, 0.9071742, 0.320102, 0, 1, 0.3921569, 1,
-0.1960014, -0.7579558, -2.361258, 0, 1, 0.4, 1,
-0.1932745, -1.880848, -2.437491, 0, 1, 0.4078431, 1,
-0.191448, -0.4209683, -1.382425, 0, 1, 0.4117647, 1,
-0.1912518, 1.886015, -1.557916, 0, 1, 0.4196078, 1,
-0.1880775, -1.634308, -2.33268, 0, 1, 0.4235294, 1,
-0.1769666, 1.612823, 0.04302479, 0, 1, 0.4313726, 1,
-0.1738321, 1.79189, 0.1581252, 0, 1, 0.4352941, 1,
-0.1704438, 1.158178, 1.27916, 0, 1, 0.4431373, 1,
-0.1704077, -0.2570571, -4.982838, 0, 1, 0.4470588, 1,
-0.1674327, -1.774526, -3.070448, 0, 1, 0.454902, 1,
-0.1638953, -1.090383, -2.952482, 0, 1, 0.4588235, 1,
-0.1606054, 1.662403, -1.104532, 0, 1, 0.4666667, 1,
-0.1605574, -1.09417, -1.196162, 0, 1, 0.4705882, 1,
-0.1561871, 0.05705692, -0.3273753, 0, 1, 0.4784314, 1,
-0.1524519, -1.173011, -3.533457, 0, 1, 0.4823529, 1,
-0.1502168, -0.1512725, -1.6346, 0, 1, 0.4901961, 1,
-0.1489289, 0.7271267, 0.8337778, 0, 1, 0.4941176, 1,
-0.1488504, -2.171883, -1.933815, 0, 1, 0.5019608, 1,
-0.1444592, -0.5084567, -1.885754, 0, 1, 0.509804, 1,
-0.1443724, -1.37762, -3.885565, 0, 1, 0.5137255, 1,
-0.1434458, 0.8167482, -1.069116, 0, 1, 0.5215687, 1,
-0.1418521, 1.287879, -1.074404, 0, 1, 0.5254902, 1,
-0.1384428, 0.2823153, -1.130013, 0, 1, 0.5333334, 1,
-0.1376789, 0.8012307, -0.9994498, 0, 1, 0.5372549, 1,
-0.137123, -0.7368903, -3.053386, 0, 1, 0.5450981, 1,
-0.1366019, 0.2606552, -0.2516882, 0, 1, 0.5490196, 1,
-0.1349016, -0.3992955, -3.041963, 0, 1, 0.5568628, 1,
-0.1346592, 0.2276348, -0.4811656, 0, 1, 0.5607843, 1,
-0.1276655, -2.308507, -4.839036, 0, 1, 0.5686275, 1,
-0.1271261, -0.7338293, -4.217431, 0, 1, 0.572549, 1,
-0.1246505, -1.049712, -3.525309, 0, 1, 0.5803922, 1,
-0.1245286, -1.047034, -3.342201, 0, 1, 0.5843138, 1,
-0.1227257, 0.1685374, 0.4468315, 0, 1, 0.5921569, 1,
-0.115541, 1.634733, -1.81445, 0, 1, 0.5960785, 1,
-0.1151727, -1.362725, -3.773307, 0, 1, 0.6039216, 1,
-0.1129652, -1.160706, -3.325452, 0, 1, 0.6117647, 1,
-0.1118743, -0.5581638, -3.715309, 0, 1, 0.6156863, 1,
-0.1069835, 0.809411, -0.8915308, 0, 1, 0.6235294, 1,
-0.1033016, -0.062244, -2.680939, 0, 1, 0.627451, 1,
-0.1025667, -1.295358, -2.556747, 0, 1, 0.6352941, 1,
-0.09940074, 0.6276678, -0.7641779, 0, 1, 0.6392157, 1,
-0.09923051, 1.154128, -1.423756, 0, 1, 0.6470588, 1,
-0.09814295, 0.7881332, -0.4736251, 0, 1, 0.6509804, 1,
-0.09730977, 1.457419, 0.5176045, 0, 1, 0.6588235, 1,
-0.09568568, 0.2308774, -0.8422444, 0, 1, 0.6627451, 1,
-0.09147566, 1.031967, 0.8315262, 0, 1, 0.6705883, 1,
-0.09078223, -0.29863, -2.501975, 0, 1, 0.6745098, 1,
-0.09071828, -0.1630737, -1.848762, 0, 1, 0.682353, 1,
-0.09035833, -1.22438, -3.471787, 0, 1, 0.6862745, 1,
-0.08802374, -0.388029, -1.302311, 0, 1, 0.6941177, 1,
-0.08624171, -0.5087612, -3.883564, 0, 1, 0.7019608, 1,
-0.08365752, 1.441077, 1.25848, 0, 1, 0.7058824, 1,
-0.07893947, 0.6905006, 0.9876524, 0, 1, 0.7137255, 1,
-0.07820752, 0.9560647, 0.7826382, 0, 1, 0.7176471, 1,
-0.07779521, -1.126305, -2.65113, 0, 1, 0.7254902, 1,
-0.07660745, -0.5561064, -1.308206, 0, 1, 0.7294118, 1,
-0.07653093, 1.187027, 0.2788519, 0, 1, 0.7372549, 1,
-0.07617041, -2.011677, -4.212778, 0, 1, 0.7411765, 1,
-0.07255527, 0.2163672, -0.7897593, 0, 1, 0.7490196, 1,
-0.07185078, 1.448095, 0.8760218, 0, 1, 0.7529412, 1,
-0.07130631, -1.636026, -2.075679, 0, 1, 0.7607843, 1,
-0.06731632, 1.235254, 1.569443, 0, 1, 0.7647059, 1,
-0.06683853, 2.060096, 2.000149, 0, 1, 0.772549, 1,
-0.06291786, 0.03998075, 0.8559638, 0, 1, 0.7764706, 1,
-0.06085298, -0.361719, -2.157431, 0, 1, 0.7843137, 1,
-0.05633657, -0.5005869, -3.328385, 0, 1, 0.7882353, 1,
-0.05331249, -2.115916, -3.277939, 0, 1, 0.7960784, 1,
-0.05304578, 1.053329, 0.642271, 0, 1, 0.8039216, 1,
-0.05118326, -0.7675481, -3.867985, 0, 1, 0.8078431, 1,
-0.05095837, -0.9391567, -2.551104, 0, 1, 0.8156863, 1,
-0.04670009, -0.730364, -2.864384, 0, 1, 0.8196079, 1,
-0.04624588, 1.579936, 2.256657, 0, 1, 0.827451, 1,
-0.04513501, 0.8787363, 1.861077, 0, 1, 0.8313726, 1,
-0.04417372, -0.3206871, -1.104165, 0, 1, 0.8392157, 1,
-0.03910755, 1.190452, -0.5085486, 0, 1, 0.8431373, 1,
-0.03798668, 0.4398302, -0.7489662, 0, 1, 0.8509804, 1,
-0.03391614, -0.3828912, -0.7609474, 0, 1, 0.854902, 1,
-0.03325281, -0.4532385, -4.164187, 0, 1, 0.8627451, 1,
-0.03263714, 0.4312343, 0.3268771, 0, 1, 0.8666667, 1,
-0.02940641, 1.116153, -1.425812, 0, 1, 0.8745098, 1,
-0.02743054, -0.8445973, -1.435464, 0, 1, 0.8784314, 1,
-0.02550236, 0.1076182, 0.2422706, 0, 1, 0.8862745, 1,
-0.02478915, 0.6260324, 0.1353477, 0, 1, 0.8901961, 1,
-0.02444595, -1.11977, -3.134992, 0, 1, 0.8980392, 1,
-0.02418379, 0.20212, 0.8607585, 0, 1, 0.9058824, 1,
-0.02130306, -1.396478, -2.836161, 0, 1, 0.9098039, 1,
-0.01972686, 0.5519898, -0.02209274, 0, 1, 0.9176471, 1,
-0.01652425, 0.053469, -0.81201, 0, 1, 0.9215686, 1,
-0.01625332, -1.566996, -2.359524, 0, 1, 0.9294118, 1,
-0.01292514, -0.09045108, -3.013399, 0, 1, 0.9333333, 1,
-0.01187258, -0.3317702, -4.279097, 0, 1, 0.9411765, 1,
-0.01178317, -1.997549, -3.108655, 0, 1, 0.945098, 1,
-0.006081689, 0.6956542, 1.645333, 0, 1, 0.9529412, 1,
-0.001984902, 2.187519, -0.2454702, 0, 1, 0.9568627, 1,
-0.001931831, 0.3018914, 1.949924, 0, 1, 0.9647059, 1,
0.002605787, -2.675163, 3.138906, 0, 1, 0.9686275, 1,
0.003609044, -0.1076015, 5.160194, 0, 1, 0.9764706, 1,
0.004938236, 0.1842065, 0.4815323, 0, 1, 0.9803922, 1,
0.00956072, 0.8580613, 1.045429, 0, 1, 0.9882353, 1,
0.02029007, -0.5386601, 4.256982, 0, 1, 0.9921569, 1,
0.02144933, -0.846291, 5.057265, 0, 1, 1, 1,
0.02587938, -0.6034487, 4.645271, 0, 0.9921569, 1, 1,
0.02617507, -0.8021286, 3.100187, 0, 0.9882353, 1, 1,
0.02825339, 0.3103327, 0.3233853, 0, 0.9803922, 1, 1,
0.03033607, -0.1071277, 2.722965, 0, 0.9764706, 1, 1,
0.0330489, -0.06343253, 2.392708, 0, 0.9686275, 1, 1,
0.033149, -1.278782, 3.459196, 0, 0.9647059, 1, 1,
0.03568694, -0.0818517, 2.971503, 0, 0.9568627, 1, 1,
0.03590984, 0.6723142, -1.232698, 0, 0.9529412, 1, 1,
0.03772606, 1.156941, -0.755493, 0, 0.945098, 1, 1,
0.03925349, -1.843378, 3.615362, 0, 0.9411765, 1, 1,
0.03960878, -0.3460995, 2.977097, 0, 0.9333333, 1, 1,
0.05101829, 0.3386298, 0.1153615, 0, 0.9294118, 1, 1,
0.05316406, -0.1678475, 3.918076, 0, 0.9215686, 1, 1,
0.05528229, 0.3919942, -0.4664103, 0, 0.9176471, 1, 1,
0.05669305, 1.851223, 1.054757, 0, 0.9098039, 1, 1,
0.05927847, 1.109462, 0.2213518, 0, 0.9058824, 1, 1,
0.06028094, 0.2965467, -0.6293225, 0, 0.8980392, 1, 1,
0.06040064, -0.8772936, 3.550142, 0, 0.8901961, 1, 1,
0.06156375, -0.2686507, 1.58175, 0, 0.8862745, 1, 1,
0.06967424, 0.7707102, -0.7269502, 0, 0.8784314, 1, 1,
0.07035486, -1.477349, 3.154672, 0, 0.8745098, 1, 1,
0.07550794, 0.6935133, -1.831894, 0, 0.8666667, 1, 1,
0.07606017, -1.607231, 2.949557, 0, 0.8627451, 1, 1,
0.08028845, -1.253284, 6.073151, 0, 0.854902, 1, 1,
0.0825402, 0.491086, 0.4966373, 0, 0.8509804, 1, 1,
0.08333702, 0.7832646, 1.585305, 0, 0.8431373, 1, 1,
0.0866705, 0.5570484, 2.513352, 0, 0.8392157, 1, 1,
0.09104206, -0.6965436, 3.70067, 0, 0.8313726, 1, 1,
0.09235148, -0.5917087, 2.561889, 0, 0.827451, 1, 1,
0.09307715, -0.06093983, 3.473525, 0, 0.8196079, 1, 1,
0.09442516, 0.9550624, -0.07375661, 0, 0.8156863, 1, 1,
0.0951587, -0.2881515, 1.612389, 0, 0.8078431, 1, 1,
0.1023627, -0.2138427, 1.917936, 0, 0.8039216, 1, 1,
0.1025976, -0.1244271, 4.231973, 0, 0.7960784, 1, 1,
0.1037167, 0.7175551, 0.6237671, 0, 0.7882353, 1, 1,
0.1039607, 1.52174, 0.7931042, 0, 0.7843137, 1, 1,
0.1051105, -0.2339611, 1.819421, 0, 0.7764706, 1, 1,
0.1082301, -0.3015369, 2.832352, 0, 0.772549, 1, 1,
0.109411, 0.03586914, 1.870857, 0, 0.7647059, 1, 1,
0.1095901, 0.2240977, 1.845679, 0, 0.7607843, 1, 1,
0.1209951, 0.6849065, -0.1484209, 0, 0.7529412, 1, 1,
0.1237264, 0.9257109, 1.3412, 0, 0.7490196, 1, 1,
0.1261057, 0.1142526, -0.6087438, 0, 0.7411765, 1, 1,
0.130661, 0.392466, 0.2065617, 0, 0.7372549, 1, 1,
0.1318541, 0.2498547, 0.6353737, 0, 0.7294118, 1, 1,
0.1346673, -0.2961016, 2.355865, 0, 0.7254902, 1, 1,
0.1380758, -1.248193, 2.067376, 0, 0.7176471, 1, 1,
0.1391928, -0.04484557, 0.5700088, 0, 0.7137255, 1, 1,
0.1392083, 0.6786925, 0.05442108, 0, 0.7058824, 1, 1,
0.1394498, -1.473012, 2.530167, 0, 0.6980392, 1, 1,
0.1464196, -0.1544673, 1.379386, 0, 0.6941177, 1, 1,
0.1495676, -0.5731047, 2.213069, 0, 0.6862745, 1, 1,
0.1536663, -0.9151635, 2.842524, 0, 0.682353, 1, 1,
0.1549808, -1.562514, 1.241653, 0, 0.6745098, 1, 1,
0.1563633, -1.90768, 3.451449, 0, 0.6705883, 1, 1,
0.1564514, -1.028513, 3.564348, 0, 0.6627451, 1, 1,
0.1648165, 0.3769548, 1.486975, 0, 0.6588235, 1, 1,
0.1655752, 0.8971585, -0.2196577, 0, 0.6509804, 1, 1,
0.1759469, -0.7084791, 2.581481, 0, 0.6470588, 1, 1,
0.1792596, 0.1008581, 0.7668225, 0, 0.6392157, 1, 1,
0.1793163, 1.726167, -0.5724742, 0, 0.6352941, 1, 1,
0.1793583, -1.738524, 2.423592, 0, 0.627451, 1, 1,
0.1806918, 0.3354025, 1.714234, 0, 0.6235294, 1, 1,
0.1817928, 0.1807455, 0.2048125, 0, 0.6156863, 1, 1,
0.1840867, 0.2148486, -0.5387865, 0, 0.6117647, 1, 1,
0.1948791, -0.4661718, 2.465531, 0, 0.6039216, 1, 1,
0.2078154, -1.510098, 3.092898, 0, 0.5960785, 1, 1,
0.2154015, 0.1661618, 1.868968, 0, 0.5921569, 1, 1,
0.2164329, 0.4346295, -0.008849628, 0, 0.5843138, 1, 1,
0.2225726, -1.887784, 1.407966, 0, 0.5803922, 1, 1,
0.223763, -0.1190131, 2.320521, 0, 0.572549, 1, 1,
0.2242349, -0.1228845, 2.496427, 0, 0.5686275, 1, 1,
0.2262491, -1.917126, 3.232868, 0, 0.5607843, 1, 1,
0.2318397, 0.1726062, 0.9158179, 0, 0.5568628, 1, 1,
0.2346626, -0.6622974, 1.585336, 0, 0.5490196, 1, 1,
0.2368425, -0.2584747, 2.204865, 0, 0.5450981, 1, 1,
0.2384079, -1.201035, 1.610089, 0, 0.5372549, 1, 1,
0.2385164, 1.347354, 1.251174, 0, 0.5333334, 1, 1,
0.2391728, -2.74251, 4.133089, 0, 0.5254902, 1, 1,
0.2409681, -1.357041, 3.73746, 0, 0.5215687, 1, 1,
0.2447299, -1.257505, 2.337096, 0, 0.5137255, 1, 1,
0.2499421, -0.2472864, 0.8685342, 0, 0.509804, 1, 1,
0.2508142, -1.164918, 3.427348, 0, 0.5019608, 1, 1,
0.2509052, -0.7403913, 1.440674, 0, 0.4941176, 1, 1,
0.2542503, 1.122906, -0.9326951, 0, 0.4901961, 1, 1,
0.2556216, 1.598085, 0.1843107, 0, 0.4823529, 1, 1,
0.2579501, -1.526782, 2.960599, 0, 0.4784314, 1, 1,
0.2623456, 0.1327724, 1.65996, 0, 0.4705882, 1, 1,
0.2623614, -1.350005, 2.365538, 0, 0.4666667, 1, 1,
0.2645435, 0.4618309, 0.4753238, 0, 0.4588235, 1, 1,
0.2658103, -2.280391, 1.492341, 0, 0.454902, 1, 1,
0.2664535, -0.6094065, 2.934278, 0, 0.4470588, 1, 1,
0.2667842, 0.7735222, 1.039916, 0, 0.4431373, 1, 1,
0.2723412, 1.271573, -0.6365845, 0, 0.4352941, 1, 1,
0.2759671, 1.177297, 0.6862853, 0, 0.4313726, 1, 1,
0.2767697, 0.6874853, -0.3450321, 0, 0.4235294, 1, 1,
0.278199, -0.002171201, 2.909959, 0, 0.4196078, 1, 1,
0.2793996, -0.1581086, 3.597443, 0, 0.4117647, 1, 1,
0.2809055, 0.7335857, 0.2016197, 0, 0.4078431, 1, 1,
0.2895884, 2.279968, -1.661026, 0, 0.4, 1, 1,
0.291313, 2.020777, -0.6653425, 0, 0.3921569, 1, 1,
0.2926853, 1.041285, -0.5490908, 0, 0.3882353, 1, 1,
0.2927275, -0.3486435, 1.989433, 0, 0.3803922, 1, 1,
0.2968059, 2.221455, 1.201865, 0, 0.3764706, 1, 1,
0.2977555, 0.5621384, 0.767749, 0, 0.3686275, 1, 1,
0.299631, 0.04602895, 1.980261, 0, 0.3647059, 1, 1,
0.3024132, 0.2747372, 0.5366616, 0, 0.3568628, 1, 1,
0.307919, 1.986383, -0.8356864, 0, 0.3529412, 1, 1,
0.3160193, 1.866087, -0.990272, 0, 0.345098, 1, 1,
0.3179288, -0.918548, 4.252471, 0, 0.3411765, 1, 1,
0.3208434, -0.1295055, 1.681621, 0, 0.3333333, 1, 1,
0.321105, 0.3665212, 1.467895, 0, 0.3294118, 1, 1,
0.3264439, -0.06578199, 2.39851, 0, 0.3215686, 1, 1,
0.3310739, 1.207342, -0.6488361, 0, 0.3176471, 1, 1,
0.3321464, -0.3230244, 1.449972, 0, 0.3098039, 1, 1,
0.3368025, 0.3327065, 0.9088472, 0, 0.3058824, 1, 1,
0.3399419, -0.5439811, 4.380283, 0, 0.2980392, 1, 1,
0.3404058, -1.192979, 1.734346, 0, 0.2901961, 1, 1,
0.3407015, 0.4140367, 0.2425589, 0, 0.2862745, 1, 1,
0.3418957, 1.091552, 0.8087915, 0, 0.2784314, 1, 1,
0.3420484, 1.10389, 0.458184, 0, 0.2745098, 1, 1,
0.3503062, -1.119918, 2.439541, 0, 0.2666667, 1, 1,
0.3513173, -0.6838797, 3.359164, 0, 0.2627451, 1, 1,
0.3537678, -0.2507191, 1.799733, 0, 0.254902, 1, 1,
0.3590319, 1.542224, 0.6991144, 0, 0.2509804, 1, 1,
0.3608395, -0.2131129, 2.444151, 0, 0.2431373, 1, 1,
0.3624729, -0.5924779, 2.262498, 0, 0.2392157, 1, 1,
0.3634866, -0.827544, 0.8709813, 0, 0.2313726, 1, 1,
0.3662822, -0.4842272, 2.436737, 0, 0.227451, 1, 1,
0.3666459, -0.2676212, 2.539092, 0, 0.2196078, 1, 1,
0.3682678, 1.309071, 0.273245, 0, 0.2156863, 1, 1,
0.3716056, -0.9987162, 1.608418, 0, 0.2078431, 1, 1,
0.3727275, 0.7974933, 0.4196587, 0, 0.2039216, 1, 1,
0.3767296, 0.4059976, 2.05792, 0, 0.1960784, 1, 1,
0.379772, -0.0233625, 0.1539996, 0, 0.1882353, 1, 1,
0.3848026, 1.016862, -1.282133, 0, 0.1843137, 1, 1,
0.3854007, -0.1734233, 1.085038, 0, 0.1764706, 1, 1,
0.3877516, 0.3441143, -0.3383588, 0, 0.172549, 1, 1,
0.3923098, -0.06739884, 1.046435, 0, 0.1647059, 1, 1,
0.3940978, -1.379505, 2.316434, 0, 0.1607843, 1, 1,
0.3993738, -1.136535, 2.139516, 0, 0.1529412, 1, 1,
0.4001327, 0.06524915, 0.6304635, 0, 0.1490196, 1, 1,
0.4044117, 0.0760389, 2.440395, 0, 0.1411765, 1, 1,
0.4131431, -0.03902526, 1.114761, 0, 0.1372549, 1, 1,
0.4136831, -0.3399248, 1.049335, 0, 0.1294118, 1, 1,
0.4178171, -0.502313, 4.248877, 0, 0.1254902, 1, 1,
0.4188383, 0.0316351, 3.351621, 0, 0.1176471, 1, 1,
0.4199323, -0.646004, 0.08761918, 0, 0.1137255, 1, 1,
0.4236675, 0.01463467, 1.693438, 0, 0.1058824, 1, 1,
0.4238952, -0.9023752, -0.4207125, 0, 0.09803922, 1, 1,
0.424861, 0.3017558, 0.9165913, 0, 0.09411765, 1, 1,
0.4250806, -0.9828618, 2.996152, 0, 0.08627451, 1, 1,
0.4301636, -0.3705108, 1.92801, 0, 0.08235294, 1, 1,
0.430423, 0.4179679, 2.646944, 0, 0.07450981, 1, 1,
0.4383689, -0.5028791, 2.086427, 0, 0.07058824, 1, 1,
0.4383716, -0.7659456, 3.551685, 0, 0.0627451, 1, 1,
0.4416268, 0.5469595, -0.3412392, 0, 0.05882353, 1, 1,
0.4524159, 0.05551436, 0.7351767, 0, 0.05098039, 1, 1,
0.4531324, 0.8553715, 0.1896137, 0, 0.04705882, 1, 1,
0.4533152, 2.527813, 0.7843158, 0, 0.03921569, 1, 1,
0.456068, 0.3746749, 1.873061, 0, 0.03529412, 1, 1,
0.4619353, -0.525002, 2.155362, 0, 0.02745098, 1, 1,
0.4629147, 0.4447789, 0.9208034, 0, 0.02352941, 1, 1,
0.4654911, 0.3244374, 1.341518, 0, 0.01568628, 1, 1,
0.4660308, -0.09827244, 0.4434845, 0, 0.01176471, 1, 1,
0.4675356, -0.7769628, 4.447896, 0, 0.003921569, 1, 1,
0.467605, -0.5376576, 3.651161, 0.003921569, 0, 1, 1,
0.4716054, 0.6686915, 0.3919961, 0.007843138, 0, 1, 1,
0.4748431, -0.6961478, 1.769497, 0.01568628, 0, 1, 1,
0.475715, 0.4229084, -0.419772, 0.01960784, 0, 1, 1,
0.4761896, -0.3025222, 0.1705882, 0.02745098, 0, 1, 1,
0.4786337, -0.6568997, 3.765456, 0.03137255, 0, 1, 1,
0.4846656, 1.178416, -0.5256643, 0.03921569, 0, 1, 1,
0.485858, 0.8462254, 1.09964, 0.04313726, 0, 1, 1,
0.4888628, -0.993572, 2.608879, 0.05098039, 0, 1, 1,
0.489513, -0.3578256, 0.09829514, 0.05490196, 0, 1, 1,
0.4903574, 1.890303, 0.6231498, 0.0627451, 0, 1, 1,
0.4931785, 0.9597521, 1.03842, 0.06666667, 0, 1, 1,
0.4960229, -0.6479941, 1.750269, 0.07450981, 0, 1, 1,
0.4964591, -0.4015113, 2.639855, 0.07843138, 0, 1, 1,
0.4999447, -0.6403296, 0.953059, 0.08627451, 0, 1, 1,
0.5041329, -0.7311586, 2.906307, 0.09019608, 0, 1, 1,
0.504945, -1.175099, 4.824795, 0.09803922, 0, 1, 1,
0.5081817, 0.1014644, 0.6804199, 0.1058824, 0, 1, 1,
0.5094851, -0.5154833, 2.235049, 0.1098039, 0, 1, 1,
0.5213873, -0.9544294, 2.956591, 0.1176471, 0, 1, 1,
0.5239236, -1.306552, 2.380567, 0.1215686, 0, 1, 1,
0.5248096, -2.560473, 2.510832, 0.1294118, 0, 1, 1,
0.5263035, 0.1179009, 2.097626, 0.1333333, 0, 1, 1,
0.5303932, 1.788385, -0.3257769, 0.1411765, 0, 1, 1,
0.5332029, -0.02041626, 2.119755, 0.145098, 0, 1, 1,
0.5335115, 0.3444135, 0.2164885, 0.1529412, 0, 1, 1,
0.5411665, 0.4546524, 2.161676, 0.1568628, 0, 1, 1,
0.5452992, -1.478689, 3.433949, 0.1647059, 0, 1, 1,
0.5483931, -0.3114461, 2.174158, 0.1686275, 0, 1, 1,
0.5512923, 0.4434579, 1.776213, 0.1764706, 0, 1, 1,
0.5525167, 0.9904901, -0.04509635, 0.1803922, 0, 1, 1,
0.5545079, -1.076461, 1.791077, 0.1882353, 0, 1, 1,
0.5575017, 0.5292158, 0.009962859, 0.1921569, 0, 1, 1,
0.5767685, -0.5142981, 2.499388, 0.2, 0, 1, 1,
0.578154, -0.4238626, 2.970549, 0.2078431, 0, 1, 1,
0.580773, -2.040094, 4.366377, 0.2117647, 0, 1, 1,
0.582482, -0.7241227, 0.5747229, 0.2196078, 0, 1, 1,
0.582827, -0.6781113, 2.315681, 0.2235294, 0, 1, 1,
0.5863301, 0.2849875, 2.008154, 0.2313726, 0, 1, 1,
0.5956225, 1.556759, 1.189289, 0.2352941, 0, 1, 1,
0.6031572, -1.150948, 1.055571, 0.2431373, 0, 1, 1,
0.6169806, 0.4322283, 2.478234, 0.2470588, 0, 1, 1,
0.6219077, -0.1552452, 1.301865, 0.254902, 0, 1, 1,
0.6404666, 0.8257521, 1.503608, 0.2588235, 0, 1, 1,
0.6409898, -0.1204274, 0.7158722, 0.2666667, 0, 1, 1,
0.6431507, 0.4526476, 2.127811, 0.2705882, 0, 1, 1,
0.6435314, -1.198073, 1.640409, 0.2784314, 0, 1, 1,
0.643698, 0.3252078, 1.010677, 0.282353, 0, 1, 1,
0.6480016, -1.888436, 4.472472, 0.2901961, 0, 1, 1,
0.6499066, 1.191789, -0.6496785, 0.2941177, 0, 1, 1,
0.6574102, 0.7770117, 1.241211, 0.3019608, 0, 1, 1,
0.664152, -1.887169, 3.213444, 0.3098039, 0, 1, 1,
0.6644658, -0.4288194, 1.82136, 0.3137255, 0, 1, 1,
0.6703582, 0.6769433, 0.4692754, 0.3215686, 0, 1, 1,
0.6775256, -1.164126, 2.82573, 0.3254902, 0, 1, 1,
0.682686, -1.496435, 0.9830177, 0.3333333, 0, 1, 1,
0.6852214, -0.4731846, 1.917863, 0.3372549, 0, 1, 1,
0.6853286, 0.4855194, 1.610357, 0.345098, 0, 1, 1,
0.6854681, -0.7419512, 4.265712, 0.3490196, 0, 1, 1,
0.6860546, 0.5614573, 1.80396, 0.3568628, 0, 1, 1,
0.6893097, 0.8209305, 0.01498582, 0.3607843, 0, 1, 1,
0.6904455, 0.3171133, 1.223081, 0.3686275, 0, 1, 1,
0.6971299, 0.7369042, 0.8388904, 0.372549, 0, 1, 1,
0.6986853, -0.4916199, 2.599685, 0.3803922, 0, 1, 1,
0.6992198, -0.2331206, 1.23152, 0.3843137, 0, 1, 1,
0.7011725, 0.1777002, -0.1360309, 0.3921569, 0, 1, 1,
0.7059041, -1.341625, 2.127616, 0.3960784, 0, 1, 1,
0.7065316, 1.598926, 1.597321, 0.4039216, 0, 1, 1,
0.7100465, -0.02354854, 1.714456, 0.4117647, 0, 1, 1,
0.7137896, -2.315411, 0.4511615, 0.4156863, 0, 1, 1,
0.7154149, 2.227614, 1.859957, 0.4235294, 0, 1, 1,
0.7292174, 1.771224, 0.895062, 0.427451, 0, 1, 1,
0.7340606, -1.225359, 1.712184, 0.4352941, 0, 1, 1,
0.734224, -1.822509, 1.870059, 0.4392157, 0, 1, 1,
0.7342389, 0.4361371, 0.209598, 0.4470588, 0, 1, 1,
0.7394992, -0.3696019, 2.093913, 0.4509804, 0, 1, 1,
0.7459204, 1.814927, 0.2860531, 0.4588235, 0, 1, 1,
0.7466382, 0.06424412, 0.719725, 0.4627451, 0, 1, 1,
0.7499954, -1.114276, 3.506126, 0.4705882, 0, 1, 1,
0.7527205, -0.3521648, 0.8145891, 0.4745098, 0, 1, 1,
0.7534626, -2.036517, 1.637912, 0.4823529, 0, 1, 1,
0.7551395, 1.307126, 0.1135689, 0.4862745, 0, 1, 1,
0.7552751, -2.571926, 2.191641, 0.4941176, 0, 1, 1,
0.7583317, -0.4223382, 4.074562, 0.5019608, 0, 1, 1,
0.7611617, -1.220138, 2.507674, 0.5058824, 0, 1, 1,
0.7636837, -0.8384116, 2.229271, 0.5137255, 0, 1, 1,
0.7644937, 0.2905758, 1.892816, 0.5176471, 0, 1, 1,
0.7654351, 0.7522901, 1.8031, 0.5254902, 0, 1, 1,
0.7664566, -0.7196153, 1.882023, 0.5294118, 0, 1, 1,
0.7779796, -1.06861, 2.418864, 0.5372549, 0, 1, 1,
0.7802557, 0.650035, 0.9650687, 0.5411765, 0, 1, 1,
0.7804177, -1.980398, 2.366729, 0.5490196, 0, 1, 1,
0.7823308, 0.5176986, 1.431818, 0.5529412, 0, 1, 1,
0.7839894, 1.063692, -0.5505179, 0.5607843, 0, 1, 1,
0.7857403, 0.3052694, 2.617411, 0.5647059, 0, 1, 1,
0.7877656, 0.02374005, 1.220447, 0.572549, 0, 1, 1,
0.7901316, -1.389413, 2.268755, 0.5764706, 0, 1, 1,
0.7910239, 0.3580197, 0.2543128, 0.5843138, 0, 1, 1,
0.7961965, -0.4150321, 1.293412, 0.5882353, 0, 1, 1,
0.8007277, 1.343858, 1.834872, 0.5960785, 0, 1, 1,
0.8058224, -1.669857, 3.841149, 0.6039216, 0, 1, 1,
0.8064324, 1.59219, 0.4669327, 0.6078432, 0, 1, 1,
0.8066691, 0.4779169, 1.596499, 0.6156863, 0, 1, 1,
0.8144319, 0.1271837, 2.459294, 0.6196079, 0, 1, 1,
0.8211155, 1.414429, 1.253991, 0.627451, 0, 1, 1,
0.8224009, 0.04897067, 0.4134723, 0.6313726, 0, 1, 1,
0.8300058, 0.5407818, 1.678905, 0.6392157, 0, 1, 1,
0.8312937, 0.2712818, 0.6814216, 0.6431373, 0, 1, 1,
0.8376603, -0.9632578, 0.4988927, 0.6509804, 0, 1, 1,
0.8459147, 1.105299, 0.1986067, 0.654902, 0, 1, 1,
0.8481718, 1.42695, 0.1867847, 0.6627451, 0, 1, 1,
0.8492064, 1.338405, 1.631539, 0.6666667, 0, 1, 1,
0.8521301, -0.4008603, 2.381444, 0.6745098, 0, 1, 1,
0.855233, -0.1528889, 2.833657, 0.6784314, 0, 1, 1,
0.860581, -1.00651, 1.956125, 0.6862745, 0, 1, 1,
0.8618703, 1.948428, -0.428321, 0.6901961, 0, 1, 1,
0.863075, -0.0259584, 0.3942678, 0.6980392, 0, 1, 1,
0.8631035, 0.4054766, 1.331488, 0.7058824, 0, 1, 1,
0.8651391, 0.5936235, 2.351809, 0.7098039, 0, 1, 1,
0.8658854, -0.01806824, 1.247847, 0.7176471, 0, 1, 1,
0.8734958, 1.128048, -0.48953, 0.7215686, 0, 1, 1,
0.8753417, 0.3512558, 0.6892923, 0.7294118, 0, 1, 1,
0.8768985, -0.268163, 0.7411634, 0.7333333, 0, 1, 1,
0.8776377, -1.334423, 2.332304, 0.7411765, 0, 1, 1,
0.8795801, 0.0843601, 1.537903, 0.7450981, 0, 1, 1,
0.8800533, 0.4745513, 0.9945594, 0.7529412, 0, 1, 1,
0.8801017, -0.2213006, 0.6310565, 0.7568628, 0, 1, 1,
0.8836511, -0.8668778, 2.594646, 0.7647059, 0, 1, 1,
0.8880203, 0.6039761, -0.9541653, 0.7686275, 0, 1, 1,
0.8928444, -0.6540811, 1.184987, 0.7764706, 0, 1, 1,
0.895903, 1.088147, 2.304333, 0.7803922, 0, 1, 1,
0.900757, 1.746812, 0.4823375, 0.7882353, 0, 1, 1,
0.9012536, 0.4141455, 1.619079, 0.7921569, 0, 1, 1,
0.9041281, 0.3259651, -0.244838, 0.8, 0, 1, 1,
0.9058939, -0.1585814, 0.8350239, 0.8078431, 0, 1, 1,
0.9083636, 0.8441869, 0.9121823, 0.8117647, 0, 1, 1,
0.9094495, -0.1119836, 2.494039, 0.8196079, 0, 1, 1,
0.9101707, 0.4595476, 1.659648, 0.8235294, 0, 1, 1,
0.9120659, 0.5946767, -0.1473947, 0.8313726, 0, 1, 1,
0.9200178, -0.7823943, 1.738479, 0.8352941, 0, 1, 1,
0.9204415, -0.8726304, 2.159093, 0.8431373, 0, 1, 1,
0.9213674, -1.247558, 3.373059, 0.8470588, 0, 1, 1,
0.9260708, -0.2763667, 1.154392, 0.854902, 0, 1, 1,
0.9332968, -0.4727252, 1.427124, 0.8588235, 0, 1, 1,
0.938274, -0.3513179, 2.596164, 0.8666667, 0, 1, 1,
0.9449595, -0.5258664, 2.577828, 0.8705882, 0, 1, 1,
0.9516589, -0.5215783, 2.952426, 0.8784314, 0, 1, 1,
0.9528994, -0.8152811, 1.385904, 0.8823529, 0, 1, 1,
0.9529238, -0.1604877, 2.887366, 0.8901961, 0, 1, 1,
0.9532327, -1.053053, 4.021454, 0.8941177, 0, 1, 1,
0.9638395, -1.693931, 3.151559, 0.9019608, 0, 1, 1,
0.9646092, 1.667052, -0.006860273, 0.9098039, 0, 1, 1,
0.9659376, -1.077525, 2.114438, 0.9137255, 0, 1, 1,
0.9667937, -2.196838, 2.3085, 0.9215686, 0, 1, 1,
0.9680169, -0.9421141, 2.291721, 0.9254902, 0, 1, 1,
0.970729, -0.7436375, 3.413508, 0.9333333, 0, 1, 1,
0.9816439, 0.6739293, 1.391616, 0.9372549, 0, 1, 1,
0.9857391, 1.396725, 1.191773, 0.945098, 0, 1, 1,
0.9877806, -0.41684, 2.708098, 0.9490196, 0, 1, 1,
0.9905903, -2.019657, 3.376257, 0.9568627, 0, 1, 1,
0.991664, 0.5058306, 0.6839807, 0.9607843, 0, 1, 1,
0.9945956, 0.5367984, 1.120539, 0.9686275, 0, 1, 1,
0.9958649, 0.766493, 2.040792, 0.972549, 0, 1, 1,
1.000292, -0.1658762, 3.029985, 0.9803922, 0, 1, 1,
1.006194, 0.284842, 0.746249, 0.9843137, 0, 1, 1,
1.010869, 0.6202781, 0.06933276, 0.9921569, 0, 1, 1,
1.012461, 0.8970246, 2.487997, 0.9960784, 0, 1, 1,
1.014486, -1.53601, 1.424266, 1, 0, 0.9960784, 1,
1.019816, 0.2037823, 2.4179, 1, 0, 0.9882353, 1,
1.036005, -1.039307, 2.99721, 1, 0, 0.9843137, 1,
1.036947, 1.353218, 2.5951, 1, 0, 0.9764706, 1,
1.037216, -0.1826002, 1.049563, 1, 0, 0.972549, 1,
1.038515, -1.084427, 0.6027585, 1, 0, 0.9647059, 1,
1.038754, -1.285493, 2.711773, 1, 0, 0.9607843, 1,
1.040795, -0.4761565, 0.8220875, 1, 0, 0.9529412, 1,
1.046076, 0.3383863, 2.377113, 1, 0, 0.9490196, 1,
1.05957, -0.4513702, 1.827717, 1, 0, 0.9411765, 1,
1.066875, -1.995565, 0.7440501, 1, 0, 0.9372549, 1,
1.067456, 0.2103549, 1.809129, 1, 0, 0.9294118, 1,
1.069739, -0.5642628, 2.275329, 1, 0, 0.9254902, 1,
1.070766, -0.2232303, 3.353594, 1, 0, 0.9176471, 1,
1.073055, 0.4880258, 2.397591, 1, 0, 0.9137255, 1,
1.075716, 0.3465229, -0.2360958, 1, 0, 0.9058824, 1,
1.07983, 0.2605004, 0.7051207, 1, 0, 0.9019608, 1,
1.080355, -0.01566751, 0.2940747, 1, 0, 0.8941177, 1,
1.086994, 1.505137, 0.6014561, 1, 0, 0.8862745, 1,
1.099299, 0.8399121, 1.580601, 1, 0, 0.8823529, 1,
1.109758, -0.5313522, 2.264327, 1, 0, 0.8745098, 1,
1.112443, -0.5545961, 2.935921, 1, 0, 0.8705882, 1,
1.117482, -0.1859972, 3.379552, 1, 0, 0.8627451, 1,
1.117871, 1.269217, 1.270293, 1, 0, 0.8588235, 1,
1.122762, -0.4501749, 1.845603, 1, 0, 0.8509804, 1,
1.130053, 0.7584559, 1.077731, 1, 0, 0.8470588, 1,
1.132202, -0.2045425, 2.945189, 1, 0, 0.8392157, 1,
1.136868, -1.474148, 3.02096, 1, 0, 0.8352941, 1,
1.137806, -0.5527457, 1.313417, 1, 0, 0.827451, 1,
1.137955, -0.5158845, 2.641535, 1, 0, 0.8235294, 1,
1.14513, -0.2397221, 3.575724, 1, 0, 0.8156863, 1,
1.145907, -2.124141, 3.955283, 1, 0, 0.8117647, 1,
1.156644, 1.161834, 2.28723, 1, 0, 0.8039216, 1,
1.160817, -0.9972836, 2.780606, 1, 0, 0.7960784, 1,
1.161063, -0.468854, 3.063667, 1, 0, 0.7921569, 1,
1.173348, 1.1419, 0.9552438, 1, 0, 0.7843137, 1,
1.173642, -0.3049972, 2.313317, 1, 0, 0.7803922, 1,
1.176711, 0.5784296, 1.222736, 1, 0, 0.772549, 1,
1.179094, -0.06901984, 0.04397431, 1, 0, 0.7686275, 1,
1.183137, -1.077678, 1.781045, 1, 0, 0.7607843, 1,
1.187591, -1.040267, 3.151171, 1, 0, 0.7568628, 1,
1.190004, -1.537447, 1.308185, 1, 0, 0.7490196, 1,
1.191237, -1.368031, 0.6100365, 1, 0, 0.7450981, 1,
1.195622, 0.5833184, 1.613385, 1, 0, 0.7372549, 1,
1.201006, -0.4256911, 2.755126, 1, 0, 0.7333333, 1,
1.20554, -0.5935081, 1.305613, 1, 0, 0.7254902, 1,
1.21647, -0.02427069, -0.2469635, 1, 0, 0.7215686, 1,
1.222289, -2.110542, 1.927282, 1, 0, 0.7137255, 1,
1.227568, 0.7755859, 0.06815655, 1, 0, 0.7098039, 1,
1.229374, 0.2938798, 1.542266, 1, 0, 0.7019608, 1,
1.234318, -0.01411448, 2.239112, 1, 0, 0.6941177, 1,
1.234359, -1.318588, 0.4457042, 1, 0, 0.6901961, 1,
1.234851, 0.6575372, 2.012836, 1, 0, 0.682353, 1,
1.235955, 0.7581681, -0.5859709, 1, 0, 0.6784314, 1,
1.236378, 0.7056947, 1.46662, 1, 0, 0.6705883, 1,
1.242568, 0.6257052, 2.624178, 1, 0, 0.6666667, 1,
1.256595, -1.273074, 2.546416, 1, 0, 0.6588235, 1,
1.257879, 0.6383794, 1.970394, 1, 0, 0.654902, 1,
1.259225, -0.5499434, 2.792112, 1, 0, 0.6470588, 1,
1.261255, -1.751847, 3.712897, 1, 0, 0.6431373, 1,
1.26357, 0.2924248, 0.4251248, 1, 0, 0.6352941, 1,
1.26753, -1.645362, 3.251381, 1, 0, 0.6313726, 1,
1.273708, -0.9783214, 2.588641, 1, 0, 0.6235294, 1,
1.277543, 0.05050366, 3.495646, 1, 0, 0.6196079, 1,
1.280309, -0.8490984, 3.815915, 1, 0, 0.6117647, 1,
1.282674, 0.564025, 0.2342734, 1, 0, 0.6078432, 1,
1.28308, 0.1617509, 0.7996941, 1, 0, 0.6, 1,
1.289234, 1.07899, 1.344939, 1, 0, 0.5921569, 1,
1.296128, -1.170585, 1.853534, 1, 0, 0.5882353, 1,
1.299968, 1.513767, 1.02668, 1, 0, 0.5803922, 1,
1.301701, -0.2698612, 1.440873, 1, 0, 0.5764706, 1,
1.304014, -1.838409, 2.786999, 1, 0, 0.5686275, 1,
1.305714, -0.3170912, 1.548401, 1, 0, 0.5647059, 1,
1.325172, 0.5560994, 1.969624, 1, 0, 0.5568628, 1,
1.329132, -1.254546, 1.274343, 1, 0, 0.5529412, 1,
1.338938, -0.567685, 1.381417, 1, 0, 0.5450981, 1,
1.340748, -0.5666147, 1.030875, 1, 0, 0.5411765, 1,
1.342005, 0.6055332, 0.9798772, 1, 0, 0.5333334, 1,
1.344828, 1.654879, 1.320484, 1, 0, 0.5294118, 1,
1.351193, -1.136072e-05, 2.68864, 1, 0, 0.5215687, 1,
1.35851, 0.05395232, 1.836097, 1, 0, 0.5176471, 1,
1.367472, 0.6576394, 0.9401817, 1, 0, 0.509804, 1,
1.376854, -0.9033957, 2.725183, 1, 0, 0.5058824, 1,
1.397024, -0.2152901, 2.101224, 1, 0, 0.4980392, 1,
1.400264, 0.6439455, -0.529555, 1, 0, 0.4901961, 1,
1.407426, 0.3458168, 1.295942, 1, 0, 0.4862745, 1,
1.421729, 1.118853, 0.8276576, 1, 0, 0.4784314, 1,
1.443768, -1.056313, 2.427812, 1, 0, 0.4745098, 1,
1.444199, -1.070313, 2.983986, 1, 0, 0.4666667, 1,
1.452858, 0.6771114, 2.557813, 1, 0, 0.4627451, 1,
1.463828, -0.2582935, 2.38982, 1, 0, 0.454902, 1,
1.468132, 0.5792276, 2.59248, 1, 0, 0.4509804, 1,
1.475176, -0.04225953, -0.934572, 1, 0, 0.4431373, 1,
1.480236, 0.4384443, 2.402725, 1, 0, 0.4392157, 1,
1.481362, -0.8409419, 1.920994, 1, 0, 0.4313726, 1,
1.48329, 1.849446, -0.4982289, 1, 0, 0.427451, 1,
1.488409, -1.164239, 3.159936, 1, 0, 0.4196078, 1,
1.488778, -0.7731871, 1.216138, 1, 0, 0.4156863, 1,
1.495291, 1.077569, 0.3562138, 1, 0, 0.4078431, 1,
1.505625, 0.7462163, -0.7633888, 1, 0, 0.4039216, 1,
1.511093, 1.478509, 0.1661714, 1, 0, 0.3960784, 1,
1.520979, 0.1915059, 1.138977, 1, 0, 0.3882353, 1,
1.523954, 1.27767, 1.769853, 1, 0, 0.3843137, 1,
1.525217, 0.5933437, 4.491126, 1, 0, 0.3764706, 1,
1.52651, -0.2139675, 1.572579, 1, 0, 0.372549, 1,
1.545, -1.564202, 2.111845, 1, 0, 0.3647059, 1,
1.546947, 1.38201, 1.414777, 1, 0, 0.3607843, 1,
1.547274, -0.8390594, 2.162514, 1, 0, 0.3529412, 1,
1.558516, -0.6696765, 1.259756, 1, 0, 0.3490196, 1,
1.565872, 1.37262, 1.654874, 1, 0, 0.3411765, 1,
1.569095, 0.2934833, 1.102746, 1, 0, 0.3372549, 1,
1.590082, -0.1054934, 3.437076, 1, 0, 0.3294118, 1,
1.59663, 0.2709779, 3.219597, 1, 0, 0.3254902, 1,
1.617683, 0.4940239, 1.790835, 1, 0, 0.3176471, 1,
1.621583, -0.5182002, 1.949583, 1, 0, 0.3137255, 1,
1.62667, 1.21123, 3.049092, 1, 0, 0.3058824, 1,
1.632676, 0.3056838, 0.948103, 1, 0, 0.2980392, 1,
1.656227, 1.915583, -1.097532, 1, 0, 0.2941177, 1,
1.659828, -0.5829018, 1.432852, 1, 0, 0.2862745, 1,
1.673666, 0.03139125, 1.246528, 1, 0, 0.282353, 1,
1.682599, 0.3788279, 2.083924, 1, 0, 0.2745098, 1,
1.689963, -0.05099952, 1.350894, 1, 0, 0.2705882, 1,
1.693795, -2.144994, 2.334349, 1, 0, 0.2627451, 1,
1.715353, 2.568922, -0.04995489, 1, 0, 0.2588235, 1,
1.732087, -0.2294761, 2.447669, 1, 0, 0.2509804, 1,
1.736458, -1.358403, 2.806302, 1, 0, 0.2470588, 1,
1.73657, -0.08675911, 0.6289801, 1, 0, 0.2392157, 1,
1.742799, -1.829084, 1.368647, 1, 0, 0.2352941, 1,
1.747573, 0.2547482, 0.1047041, 1, 0, 0.227451, 1,
1.756717, 0.9058748, -0.1975867, 1, 0, 0.2235294, 1,
1.774678, 0.5465581, 1.239035, 1, 0, 0.2156863, 1,
1.777847, -1.602975, 0.9414828, 1, 0, 0.2117647, 1,
1.806419, 0.3121571, 1.263879, 1, 0, 0.2039216, 1,
1.808834, -2.574097, 4.123013, 1, 0, 0.1960784, 1,
1.846042, 1.131047, 0.08790686, 1, 0, 0.1921569, 1,
1.852234, -1.243726, 3.556088, 1, 0, 0.1843137, 1,
1.878028, -0.4176904, 2.523328, 1, 0, 0.1803922, 1,
1.879274, 0.7103722, 1.762644, 1, 0, 0.172549, 1,
1.880489, 1.510491, 1.114621, 1, 0, 0.1686275, 1,
1.904248, -0.7784981, 2.661256, 1, 0, 0.1607843, 1,
1.909575, 1.424268, 0.6608058, 1, 0, 0.1568628, 1,
1.970391, 1.67694, 0.3845338, 1, 0, 0.1490196, 1,
2.011043, 0.8104233, 0.5860966, 1, 0, 0.145098, 1,
2.011855, -0.6570743, 2.658985, 1, 0, 0.1372549, 1,
2.021562, -1.520093, 1.542892, 1, 0, 0.1333333, 1,
2.060444, 0.5036287, 0.8584482, 1, 0, 0.1254902, 1,
2.062522, 0.4126035, 2.091681, 1, 0, 0.1215686, 1,
2.09357, 0.6009744, 3.420993, 1, 0, 0.1137255, 1,
2.100339, -0.1680107, 1.636976, 1, 0, 0.1098039, 1,
2.106029, -1.321598, 2.627068, 1, 0, 0.1019608, 1,
2.126978, 0.4316637, 0.3781783, 1, 0, 0.09411765, 1,
2.155209, -0.5217801, 1.476736, 1, 0, 0.09019608, 1,
2.189258, 1.494232, -0.2354673, 1, 0, 0.08235294, 1,
2.273098, -0.2400223, 1.593906, 1, 0, 0.07843138, 1,
2.286067, 1.221336, 0.3287795, 1, 0, 0.07058824, 1,
2.358812, -0.01869714, 1.815747, 1, 0, 0.06666667, 1,
2.371301, 0.01436795, 1.885846, 1, 0, 0.05882353, 1,
2.44282, 0.925003, 1.13641, 1, 0, 0.05490196, 1,
2.479246, -0.1263513, 1.328908, 1, 0, 0.04705882, 1,
2.539804, 0.05856187, 2.137844, 1, 0, 0.04313726, 1,
2.545139, -0.3958104, 1.509615, 1, 0, 0.03529412, 1,
2.574289, 0.854395, 1.5157, 1, 0, 0.03137255, 1,
2.793561, -0.8149124, 2.365002, 1, 0, 0.02352941, 1,
3.252962, 0.6692145, 1.733641, 1, 0, 0.01960784, 1,
3.411127, 0.5098082, 2.560485, 1, 0, 0.01176471, 1,
3.703982, -2.539762, 2.099701, 1, 0, 0.007843138, 1
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
0.03331637, -3.985805, -8.111734, 0, -0.5, 0.5, 0.5,
0.03331637, -3.985805, -8.111734, 1, -0.5, 0.5, 0.5,
0.03331637, -3.985805, -8.111734, 1, 1.5, 0.5, 0.5,
0.03331637, -3.985805, -8.111734, 0, 1.5, 0.5, 0.5
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
-4.881705, 0.015028, -8.111734, 0, -0.5, 0.5, 0.5,
-4.881705, 0.015028, -8.111734, 1, -0.5, 0.5, 0.5,
-4.881705, 0.015028, -8.111734, 1, 1.5, 0.5, 0.5,
-4.881705, 0.015028, -8.111734, 0, 1.5, 0.5, 0.5
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
-4.881705, -3.985805, 0.008642435, 0, -0.5, 0.5, 0.5,
-4.881705, -3.985805, 0.008642435, 1, -0.5, 0.5, 0.5,
-4.881705, -3.985805, 0.008642435, 1, 1.5, 0.5, 0.5,
-4.881705, -3.985805, 0.008642435, 0, 1.5, 0.5, 0.5
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
-2, -3.062536, -6.237802,
2, -3.062536, -6.237802,
-2, -3.062536, -6.237802,
-2, -3.216414, -6.550124,
0, -3.062536, -6.237802,
0, -3.216414, -6.550124,
2, -3.062536, -6.237802,
2, -3.216414, -6.550124
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
-2, -3.524171, -7.174768, 0, -0.5, 0.5, 0.5,
-2, -3.524171, -7.174768, 1, -0.5, 0.5, 0.5,
-2, -3.524171, -7.174768, 1, 1.5, 0.5, 0.5,
-2, -3.524171, -7.174768, 0, 1.5, 0.5, 0.5,
0, -3.524171, -7.174768, 0, -0.5, 0.5, 0.5,
0, -3.524171, -7.174768, 1, -0.5, 0.5, 0.5,
0, -3.524171, -7.174768, 1, 1.5, 0.5, 0.5,
0, -3.524171, -7.174768, 0, 1.5, 0.5, 0.5,
2, -3.524171, -7.174768, 0, -0.5, 0.5, 0.5,
2, -3.524171, -7.174768, 1, -0.5, 0.5, 0.5,
2, -3.524171, -7.174768, 1, 1.5, 0.5, 0.5,
2, -3.524171, -7.174768, 0, 1.5, 0.5, 0.5
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
-3.747469, -2, -6.237802,
-3.747469, 3, -6.237802,
-3.747469, -2, -6.237802,
-3.936508, -2, -6.550124,
-3.747469, -1, -6.237802,
-3.936508, -1, -6.550124,
-3.747469, 0, -6.237802,
-3.936508, 0, -6.550124,
-3.747469, 1, -6.237802,
-3.936508, 1, -6.550124,
-3.747469, 2, -6.237802,
-3.936508, 2, -6.550124,
-3.747469, 3, -6.237802,
-3.936508, 3, -6.550124
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
-4.314587, -2, -7.174768, 0, -0.5, 0.5, 0.5,
-4.314587, -2, -7.174768, 1, -0.5, 0.5, 0.5,
-4.314587, -2, -7.174768, 1, 1.5, 0.5, 0.5,
-4.314587, -2, -7.174768, 0, 1.5, 0.5, 0.5,
-4.314587, -1, -7.174768, 0, -0.5, 0.5, 0.5,
-4.314587, -1, -7.174768, 1, -0.5, 0.5, 0.5,
-4.314587, -1, -7.174768, 1, 1.5, 0.5, 0.5,
-4.314587, -1, -7.174768, 0, 1.5, 0.5, 0.5,
-4.314587, 0, -7.174768, 0, -0.5, 0.5, 0.5,
-4.314587, 0, -7.174768, 1, -0.5, 0.5, 0.5,
-4.314587, 0, -7.174768, 1, 1.5, 0.5, 0.5,
-4.314587, 0, -7.174768, 0, 1.5, 0.5, 0.5,
-4.314587, 1, -7.174768, 0, -0.5, 0.5, 0.5,
-4.314587, 1, -7.174768, 1, -0.5, 0.5, 0.5,
-4.314587, 1, -7.174768, 1, 1.5, 0.5, 0.5,
-4.314587, 1, -7.174768, 0, 1.5, 0.5, 0.5,
-4.314587, 2, -7.174768, 0, -0.5, 0.5, 0.5,
-4.314587, 2, -7.174768, 1, -0.5, 0.5, 0.5,
-4.314587, 2, -7.174768, 1, 1.5, 0.5, 0.5,
-4.314587, 2, -7.174768, 0, 1.5, 0.5, 0.5,
-4.314587, 3, -7.174768, 0, -0.5, 0.5, 0.5,
-4.314587, 3, -7.174768, 1, -0.5, 0.5, 0.5,
-4.314587, 3, -7.174768, 1, 1.5, 0.5, 0.5,
-4.314587, 3, -7.174768, 0, 1.5, 0.5, 0.5
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
-3.747469, -3.062536, -6,
-3.747469, -3.062536, 6,
-3.747469, -3.062536, -6,
-3.936508, -3.216414, -6,
-3.747469, -3.062536, -4,
-3.936508, -3.216414, -4,
-3.747469, -3.062536, -2,
-3.936508, -3.216414, -2,
-3.747469, -3.062536, 0,
-3.936508, -3.216414, 0,
-3.747469, -3.062536, 2,
-3.936508, -3.216414, 2,
-3.747469, -3.062536, 4,
-3.936508, -3.216414, 4,
-3.747469, -3.062536, 6,
-3.936508, -3.216414, 6
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
"4",
"6"
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
-4.314587, -3.524171, -6, 0, -0.5, 0.5, 0.5,
-4.314587, -3.524171, -6, 1, -0.5, 0.5, 0.5,
-4.314587, -3.524171, -6, 1, 1.5, 0.5, 0.5,
-4.314587, -3.524171, -6, 0, 1.5, 0.5, 0.5,
-4.314587, -3.524171, -4, 0, -0.5, 0.5, 0.5,
-4.314587, -3.524171, -4, 1, -0.5, 0.5, 0.5,
-4.314587, -3.524171, -4, 1, 1.5, 0.5, 0.5,
-4.314587, -3.524171, -4, 0, 1.5, 0.5, 0.5,
-4.314587, -3.524171, -2, 0, -0.5, 0.5, 0.5,
-4.314587, -3.524171, -2, 1, -0.5, 0.5, 0.5,
-4.314587, -3.524171, -2, 1, 1.5, 0.5, 0.5,
-4.314587, -3.524171, -2, 0, 1.5, 0.5, 0.5,
-4.314587, -3.524171, 0, 0, -0.5, 0.5, 0.5,
-4.314587, -3.524171, 0, 1, -0.5, 0.5, 0.5,
-4.314587, -3.524171, 0, 1, 1.5, 0.5, 0.5,
-4.314587, -3.524171, 0, 0, 1.5, 0.5, 0.5,
-4.314587, -3.524171, 2, 0, -0.5, 0.5, 0.5,
-4.314587, -3.524171, 2, 1, -0.5, 0.5, 0.5,
-4.314587, -3.524171, 2, 1, 1.5, 0.5, 0.5,
-4.314587, -3.524171, 2, 0, 1.5, 0.5, 0.5,
-4.314587, -3.524171, 4, 0, -0.5, 0.5, 0.5,
-4.314587, -3.524171, 4, 1, -0.5, 0.5, 0.5,
-4.314587, -3.524171, 4, 1, 1.5, 0.5, 0.5,
-4.314587, -3.524171, 4, 0, 1.5, 0.5, 0.5,
-4.314587, -3.524171, 6, 0, -0.5, 0.5, 0.5,
-4.314587, -3.524171, 6, 1, -0.5, 0.5, 0.5,
-4.314587, -3.524171, 6, 1, 1.5, 0.5, 0.5,
-4.314587, -3.524171, 6, 0, 1.5, 0.5, 0.5
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
-3.747469, -3.062536, -6.237802,
-3.747469, 3.092592, -6.237802,
-3.747469, -3.062536, 6.255086,
-3.747469, 3.092592, 6.255086,
-3.747469, -3.062536, -6.237802,
-3.747469, -3.062536, 6.255086,
-3.747469, 3.092592, -6.237802,
-3.747469, 3.092592, 6.255086,
-3.747469, -3.062536, -6.237802,
3.814102, -3.062536, -6.237802,
-3.747469, -3.062536, 6.255086,
3.814102, -3.062536, 6.255086,
-3.747469, 3.092592, -6.237802,
3.814102, 3.092592, -6.237802,
-3.747469, 3.092592, 6.255086,
3.814102, 3.092592, 6.255086,
3.814102, -3.062536, -6.237802,
3.814102, 3.092592, -6.237802,
3.814102, -3.062536, 6.255086,
3.814102, 3.092592, 6.255086,
3.814102, -3.062536, -6.237802,
3.814102, -3.062536, 6.255086,
3.814102, 3.092592, -6.237802,
3.814102, 3.092592, 6.255086
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
var radius = 8.462122;
var distance = 37.64893;
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
mvMatrix.translate( -0.03331637, -0.015028, -0.008642435 );
mvMatrix.scale( 1.209988, 1.48647, 0.7323697 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.64893);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
probenazole<-read.table("probenazole.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-probenazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'probenazole' not found
```

```r
y<-probenazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'probenazole' not found
```

```r
z<-probenazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'probenazole' not found
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
-3.637349, 0.08304389, -2.837674, 0, 0, 1, 1, 1,
-3.151132, -0.09570403, -3.521449, 1, 0, 0, 1, 1,
-2.921593, -1.724869, -0.1364132, 1, 0, 0, 1, 1,
-2.840348, 1.034661, 1.032407, 1, 0, 0, 1, 1,
-2.737705, 0.1492545, -3.422641, 1, 0, 0, 1, 1,
-2.57402, 1.511723, -0.5644795, 1, 0, 0, 1, 1,
-2.573941, -0.1083137, -1.68511, 0, 0, 0, 1, 1,
-2.49347, 0.727617, -3.857642, 0, 0, 0, 1, 1,
-2.473013, -0.90622, -0.9279498, 0, 0, 0, 1, 1,
-2.416926, 0.6448429, -1.955137, 0, 0, 0, 1, 1,
-2.384024, 0.2484915, -3.08292, 0, 0, 0, 1, 1,
-2.321314, 0.7919188, -0.6348475, 0, 0, 0, 1, 1,
-2.311502, -0.5452741, -3.573154, 0, 0, 0, 1, 1,
-2.25037, 0.365031, -0.9497406, 1, 1, 1, 1, 1,
-2.247534, -0.1252614, -0.7467389, 1, 1, 1, 1, 1,
-2.218907, -0.692671, 0.09743603, 1, 1, 1, 1, 1,
-2.194334, -1.209028, -2.205032, 1, 1, 1, 1, 1,
-2.178429, -0.4473884, -0.4328601, 1, 1, 1, 1, 1,
-2.16434, -1.117256, -2.912285, 1, 1, 1, 1, 1,
-2.07763, -0.8866798, -2.01608, 1, 1, 1, 1, 1,
-2.070082, -0.9790591, -2.113306, 1, 1, 1, 1, 1,
-2.066419, -1.959306, -1.602381, 1, 1, 1, 1, 1,
-2.023005, 1.063361, -0.5427808, 1, 1, 1, 1, 1,
-2.0035, -1.120711, -3.394956, 1, 1, 1, 1, 1,
-1.973721, 1.617803, -0.5746244, 1, 1, 1, 1, 1,
-1.969784, -0.3161616, -0.3621255, 1, 1, 1, 1, 1,
-1.914672, 0.4511022, -0.5439587, 1, 1, 1, 1, 1,
-1.91178, 0.8313066, -0.4675941, 1, 1, 1, 1, 1,
-1.893396, 0.6261922, -1.668314, 0, 0, 1, 1, 1,
-1.839551, 1.156735, 0.8847695, 1, 0, 0, 1, 1,
-1.837854, 1.015625, -2.370286, 1, 0, 0, 1, 1,
-1.834329, 0.2050642, -1.598288, 1, 0, 0, 1, 1,
-1.821125, -1.202432, -3.344469, 1, 0, 0, 1, 1,
-1.82108, -1.586366, -2.577103, 1, 0, 0, 1, 1,
-1.820394, -1.197366, -2.232415, 0, 0, 0, 1, 1,
-1.802978, 0.3066072, -2.752981, 0, 0, 0, 1, 1,
-1.793509, -0.817217, -0.5672994, 0, 0, 0, 1, 1,
-1.792982, -0.2218387, -2.022632, 0, 0, 0, 1, 1,
-1.773324, 0.1990942, -0.1316496, 0, 0, 0, 1, 1,
-1.768927, 1.019738, -1.563984, 0, 0, 0, 1, 1,
-1.767268, 0.02284837, -1.637806, 0, 0, 0, 1, 1,
-1.748438, -1.54124, -1.814959, 1, 1, 1, 1, 1,
-1.747963, 0.1817391, -3.226686, 1, 1, 1, 1, 1,
-1.742966, -0.6981834, -1.95445, 1, 1, 1, 1, 1,
-1.692803, 1.54451, 0.399255, 1, 1, 1, 1, 1,
-1.69148, -0.3886707, -1.730225, 1, 1, 1, 1, 1,
-1.690611, 1.067755, -0.2848793, 1, 1, 1, 1, 1,
-1.680365, -1.531129, -3.443091, 1, 1, 1, 1, 1,
-1.680231, -0.3604979, -1.113393, 1, 1, 1, 1, 1,
-1.677432, 1.731205, -1.264655, 1, 1, 1, 1, 1,
-1.66881, 0.05700353, -2.926617, 1, 1, 1, 1, 1,
-1.654885, -0.3708822, -2.157087, 1, 1, 1, 1, 1,
-1.630481, -1.344406, -2.603095, 1, 1, 1, 1, 1,
-1.628493, -0.4737315, -3.702246, 1, 1, 1, 1, 1,
-1.627757, 0.6858373, -1.133322, 1, 1, 1, 1, 1,
-1.62628, 3.002954, -1.877049, 1, 1, 1, 1, 1,
-1.600893, 0.8348848, -2.468789, 0, 0, 1, 1, 1,
-1.597891, -0.7009625, -3.143797, 1, 0, 0, 1, 1,
-1.594139, -2.756553, -2.679956, 1, 0, 0, 1, 1,
-1.589787, -0.08630533, -0.5955694, 1, 0, 0, 1, 1,
-1.589004, -1.846243, -3.105658, 1, 0, 0, 1, 1,
-1.585382, -1.745517, -0.2196991, 1, 0, 0, 1, 1,
-1.576826, -1.199229, -1.011138, 0, 0, 0, 1, 1,
-1.573262, -0.04778548, -2.228156, 0, 0, 0, 1, 1,
-1.562349, 2.114771, 0.3180526, 0, 0, 0, 1, 1,
-1.54206, -1.086567, -4.199145, 0, 0, 0, 1, 1,
-1.506385, -0.0173826, -0.4559792, 0, 0, 0, 1, 1,
-1.504131, -2.199094, -3.688376, 0, 0, 0, 1, 1,
-1.487359, 0.3581494, -1.148335, 0, 0, 0, 1, 1,
-1.486678, -0.5059254, -3.220115, 1, 1, 1, 1, 1,
-1.482749, 0.6605965, -1.072777, 1, 1, 1, 1, 1,
-1.480314, 1.283315, -2.13609, 1, 1, 1, 1, 1,
-1.467743, 0.1760866, -2.840702, 1, 1, 1, 1, 1,
-1.461671, -0.6183876, -1.928325, 1, 1, 1, 1, 1,
-1.443, -0.8001252, -1.190154, 1, 1, 1, 1, 1,
-1.438498, 0.2510146, -1.957991, 1, 1, 1, 1, 1,
-1.429599, -0.2071126, -0.905897, 1, 1, 1, 1, 1,
-1.425017, 0.4290982, -0.4252691, 1, 1, 1, 1, 1,
-1.415407, 0.1486037, 0.5428717, 1, 1, 1, 1, 1,
-1.394224, -0.1616222, -0.512378, 1, 1, 1, 1, 1,
-1.392432, -1.088411, -2.720552, 1, 1, 1, 1, 1,
-1.383586, -0.09934752, -1.132916, 1, 1, 1, 1, 1,
-1.381664, -0.5628185, -2.992323, 1, 1, 1, 1, 1,
-1.376896, -1.52537, -1.461859, 1, 1, 1, 1, 1,
-1.374152, -0.01475468, -2.237049, 0, 0, 1, 1, 1,
-1.371584, -0.02896384, -0.398327, 1, 0, 0, 1, 1,
-1.366484, 0.6405871, 0.2232819, 1, 0, 0, 1, 1,
-1.364389, 0.5615426, -0.4292177, 1, 0, 0, 1, 1,
-1.359096, -0.2351932, 0.762805, 1, 0, 0, 1, 1,
-1.352275, -1.661679, -4.248972, 1, 0, 0, 1, 1,
-1.347411, -1.025483, -3.952616, 0, 0, 0, 1, 1,
-1.342419, -0.1419052, -2.036738, 0, 0, 0, 1, 1,
-1.34135, 0.06779987, -0.4620977, 0, 0, 0, 1, 1,
-1.322553, -1.520776, -3.163873, 0, 0, 0, 1, 1,
-1.321102, 2.04831, 0.4257501, 0, 0, 0, 1, 1,
-1.314687, 1.033555, 0.4969849, 0, 0, 0, 1, 1,
-1.304772, 0.609386, 0.02010694, 0, 0, 0, 1, 1,
-1.298864, -0.9005496, -1.023725, 1, 1, 1, 1, 1,
-1.298144, 2.005126, -0.1110342, 1, 1, 1, 1, 1,
-1.289963, -0.4299231, -1.797086, 1, 1, 1, 1, 1,
-1.287659, -0.3669734, -1.700439, 1, 1, 1, 1, 1,
-1.28419, 1.465911, 1.133057, 1, 1, 1, 1, 1,
-1.27073, -1.053661, -2.946479, 1, 1, 1, 1, 1,
-1.266297, 0.3036436, -1.958665, 1, 1, 1, 1, 1,
-1.251666, -1.751528, -3.029518, 1, 1, 1, 1, 1,
-1.242996, 0.2240992, -1.333985, 1, 1, 1, 1, 1,
-1.238444, 0.9722152, -1.065966, 1, 1, 1, 1, 1,
-1.237312, -1.315299, -0.3956889, 1, 1, 1, 1, 1,
-1.234476, -1.247444, -2.316297, 1, 1, 1, 1, 1,
-1.22473, -0.9082789, -1.939563, 1, 1, 1, 1, 1,
-1.213589, -1.677683, -4.143506, 1, 1, 1, 1, 1,
-1.213261, 1.403985, -2.037204, 1, 1, 1, 1, 1,
-1.212245, 0.1047861, -2.791862, 0, 0, 1, 1, 1,
-1.208182, -0.03109555, -1.117774, 1, 0, 0, 1, 1,
-1.198996, -1.088841, -2.218239, 1, 0, 0, 1, 1,
-1.195193, 1.373883, 0.1858601, 1, 0, 0, 1, 1,
-1.180252, -1.534871, -3.255649, 1, 0, 0, 1, 1,
-1.170857, -0.9767976, -2.506831, 1, 0, 0, 1, 1,
-1.166819, -0.9377508, -2.879055, 0, 0, 0, 1, 1,
-1.158959, -1.153872, -2.436075, 0, 0, 0, 1, 1,
-1.154275, -2.3338, -2.776444, 0, 0, 0, 1, 1,
-1.151635, 0.07512126, -3.578482, 0, 0, 0, 1, 1,
-1.148982, 0.4709692, -1.710861, 0, 0, 0, 1, 1,
-1.147334, 0.4686238, -0.8387136, 0, 0, 0, 1, 1,
-1.134418, 1.081391, 0.5353202, 0, 0, 0, 1, 1,
-1.133258, -0.7202429, -4.702231, 1, 1, 1, 1, 1,
-1.129217, 0.1354981, -3.777281, 1, 1, 1, 1, 1,
-1.123631, 0.6468663, 0.09427594, 1, 1, 1, 1, 1,
-1.108835, 0.6172276, 0.1083951, 1, 1, 1, 1, 1,
-1.101812, -0.7243105, -1.60839, 1, 1, 1, 1, 1,
-1.100323, 1.07675, -0.1714758, 1, 1, 1, 1, 1,
-1.09923, 0.5038756, -1.627465, 1, 1, 1, 1, 1,
-1.08051, -0.8366592, -2.348877, 1, 1, 1, 1, 1,
-1.078244, 0.2330785, 0.4600936, 1, 1, 1, 1, 1,
-1.070187, 0.5858894, 0.03287754, 1, 1, 1, 1, 1,
-1.069618, 1.321881, -1.665734, 1, 1, 1, 1, 1,
-1.067684, -1.314382, -3.292095, 1, 1, 1, 1, 1,
-1.065967, -1.271443, -2.890561, 1, 1, 1, 1, 1,
-1.063137, 0.6198001, 0.03802278, 1, 1, 1, 1, 1,
-1.050279, -0.688868, -1.920684, 1, 1, 1, 1, 1,
-1.042821, 0.3848019, -2.186227, 0, 0, 1, 1, 1,
-1.035171, 0.6875818, -0.9062092, 1, 0, 0, 1, 1,
-1.034302, -1.338359, -1.493952, 1, 0, 0, 1, 1,
-1.031483, 0.1358794, -1.459376, 1, 0, 0, 1, 1,
-1.022799, -0.3729765, -1.977608, 1, 0, 0, 1, 1,
-1.016143, -1.765008, -2.61047, 1, 0, 0, 1, 1,
-1.01373, 0.9891109, 0.4043462, 0, 0, 0, 1, 1,
-1.003492, 2.370512, -1.145618, 0, 0, 0, 1, 1,
-0.9914154, -0.0533117, -3.645216, 0, 0, 0, 1, 1,
-0.9914041, -1.51642, -2.162477, 0, 0, 0, 1, 1,
-0.9881938, 1.211078, -1.324938, 0, 0, 0, 1, 1,
-0.9828828, -0.8521779, -0.8567278, 0, 0, 0, 1, 1,
-0.9822424, -0.3555088, -1.647626, 0, 0, 0, 1, 1,
-0.9772384, 0.5146459, 0.003946526, 1, 1, 1, 1, 1,
-0.967147, 0.8188326, -0.4364921, 1, 1, 1, 1, 1,
-0.9606491, 0.2412412, -2.466959, 1, 1, 1, 1, 1,
-0.9602451, -2.478805, -3.575867, 1, 1, 1, 1, 1,
-0.9586059, 0.3898532, -0.8322154, 1, 1, 1, 1, 1,
-0.9567837, -0.9669185, -2.831926, 1, 1, 1, 1, 1,
-0.9553488, -0.6141481, -1.887767, 1, 1, 1, 1, 1,
-0.9521182, 1.405694, -0.0008072353, 1, 1, 1, 1, 1,
-0.9505199, 0.156308, -1.313658, 1, 1, 1, 1, 1,
-0.9464025, 1.133104, -1.085601, 1, 1, 1, 1, 1,
-0.9427852, -1.323522, -1.938866, 1, 1, 1, 1, 1,
-0.9372777, -0.3292924, -2.827377, 1, 1, 1, 1, 1,
-0.9357216, 0.3704732, -0.590054, 1, 1, 1, 1, 1,
-0.9303132, -0.830141, -1.25006, 1, 1, 1, 1, 1,
-0.927517, 0.4832138, -2.31857, 1, 1, 1, 1, 1,
-0.9216297, -1.007389, -4.14696, 0, 0, 1, 1, 1,
-0.9178823, -1.171409, -1.989541, 1, 0, 0, 1, 1,
-0.9158763, -0.5547186, -0.4646603, 1, 0, 0, 1, 1,
-0.9107517, -0.6377066, -1.456693, 1, 0, 0, 1, 1,
-0.9101853, 1.349279, -0.5213597, 1, 0, 0, 1, 1,
-0.9080381, 1.729062, -0.4413963, 1, 0, 0, 1, 1,
-0.905338, 0.1260267, -1.142445, 0, 0, 0, 1, 1,
-0.9039865, -0.2068018, -1.105515, 0, 0, 0, 1, 1,
-0.9028682, -0.2654414, -2.244526, 0, 0, 0, 1, 1,
-0.8999103, 0.03691507, -0.8314224, 0, 0, 0, 1, 1,
-0.8955253, -2.137448, -2.38894, 0, 0, 0, 1, 1,
-0.8939741, 0.3713096, 0.1292896, 0, 0, 0, 1, 1,
-0.8844547, 1.712348, -1.656127, 0, 0, 0, 1, 1,
-0.878543, -0.7908419, -1.354624, 1, 1, 1, 1, 1,
-0.8734674, 0.717896, 0.3716855, 1, 1, 1, 1, 1,
-0.8715091, -1.256773, -1.70916, 1, 1, 1, 1, 1,
-0.8697996, 0.3204404, -2.251026, 1, 1, 1, 1, 1,
-0.8654537, -0.09161253, 0.2098121, 1, 1, 1, 1, 1,
-0.8654318, 1.386472, -2.439924, 1, 1, 1, 1, 1,
-0.8634018, -0.04210906, -0.4023841, 1, 1, 1, 1, 1,
-0.8570951, 0.6016874, -1.924257, 1, 1, 1, 1, 1,
-0.8524368, -0.4253114, -2.797361, 1, 1, 1, 1, 1,
-0.8491125, -0.1677942, -1.614077, 1, 1, 1, 1, 1,
-0.8467354, 0.1846327, -1.154763, 1, 1, 1, 1, 1,
-0.8405524, -0.5736722, -2.080858, 1, 1, 1, 1, 1,
-0.8391997, -0.3559694, -2.803869, 1, 1, 1, 1, 1,
-0.83694, -0.5224442, -1.340577, 1, 1, 1, 1, 1,
-0.832175, -1.70208, -2.711188, 1, 1, 1, 1, 1,
-0.8177471, -0.851956, -2.827933, 0, 0, 1, 1, 1,
-0.8140101, 1.339517, -0.1607937, 1, 0, 0, 1, 1,
-0.8107469, -2.215904, -1.470752, 1, 0, 0, 1, 1,
-0.8084268, 0.4407123, -0.17207, 1, 0, 0, 1, 1,
-0.8071092, -1.694838, -3.447098, 1, 0, 0, 1, 1,
-0.7975224, 1.318671, -0.683993, 1, 0, 0, 1, 1,
-0.7927426, -0.9712896, -2.633268, 0, 0, 0, 1, 1,
-0.7829466, -0.6772431, -3.487318, 0, 0, 0, 1, 1,
-0.7780768, -0.5282632, -2.145912, 0, 0, 0, 1, 1,
-0.775831, -0.4813276, -1.566545, 0, 0, 0, 1, 1,
-0.7713454, 0.03239691, -1.272619, 0, 0, 0, 1, 1,
-0.7709133, 0.4486769, 0.03642752, 0, 0, 0, 1, 1,
-0.7618532, -0.9938379, -6.055866, 0, 0, 0, 1, 1,
-0.7578749, 0.5993496, -2.046201, 1, 1, 1, 1, 1,
-0.7575927, -0.9644237, -3.689477, 1, 1, 1, 1, 1,
-0.7569225, 0.8990024, -0.5963374, 1, 1, 1, 1, 1,
-0.7532125, -1.381761, -2.914338, 1, 1, 1, 1, 1,
-0.750845, 0.06143331, -1.176705, 1, 1, 1, 1, 1,
-0.7448608, -0.6462575, -1.588422, 1, 1, 1, 1, 1,
-0.7447734, 0.3066783, -0.1991815, 1, 1, 1, 1, 1,
-0.7405228, -1.738637, -1.03735, 1, 1, 1, 1, 1,
-0.7395002, 1.080917, -0.8608225, 1, 1, 1, 1, 1,
-0.7356344, -0.65487, -0.5740649, 1, 1, 1, 1, 1,
-0.7299222, 0.9139404, -1.746882, 1, 1, 1, 1, 1,
-0.7289364, 1.15392, 0.1421662, 1, 1, 1, 1, 1,
-0.7246521, 0.8933537, 0.4665733, 1, 1, 1, 1, 1,
-0.7219408, 0.809999, 0.8433411, 1, 1, 1, 1, 1,
-0.7204925, 1.199891, 0.9401401, 1, 1, 1, 1, 1,
-0.7182556, 1.005734, -1.87373, 0, 0, 1, 1, 1,
-0.7173882, 0.4087534, 0.2535633, 1, 0, 0, 1, 1,
-0.7065021, -0.9690758, -2.46599, 1, 0, 0, 1, 1,
-0.7060233, -0.03463385, -1.603908, 1, 0, 0, 1, 1,
-0.6989009, -0.08722317, -3.103909, 1, 0, 0, 1, 1,
-0.6972474, -1.200229, -2.125996, 1, 0, 0, 1, 1,
-0.6917791, -0.6244702, -2.296567, 0, 0, 0, 1, 1,
-0.6907918, 0.1714071, -1.478233, 0, 0, 0, 1, 1,
-0.6874396, -0.5689804, -2.928827, 0, 0, 0, 1, 1,
-0.6849208, 1.032028, 0.01170415, 0, 0, 0, 1, 1,
-0.6813827, 1.040324, 0.6972823, 0, 0, 0, 1, 1,
-0.6781755, 0.644918, -0.3463933, 0, 0, 0, 1, 1,
-0.6757913, 0.2311066, -1.899715, 0, 0, 0, 1, 1,
-0.6718234, -0.1842413, -2.750669, 1, 1, 1, 1, 1,
-0.6668443, 2.862391, -0.6988982, 1, 1, 1, 1, 1,
-0.6605496, -0.6806725, -1.67161, 1, 1, 1, 1, 1,
-0.6596221, 0.08075122, -1.866405, 1, 1, 1, 1, 1,
-0.6586229, 0.2882032, -1.390868, 1, 1, 1, 1, 1,
-0.6575533, 0.4620069, -0.7798609, 1, 1, 1, 1, 1,
-0.6574963, 1.550141, 0.6090339, 1, 1, 1, 1, 1,
-0.6560606, 0.2641464, -0.6809511, 1, 1, 1, 1, 1,
-0.6500778, 1.071772, -1.789569, 1, 1, 1, 1, 1,
-0.6472077, -0.07590818, -1.646195, 1, 1, 1, 1, 1,
-0.6442083, -0.0528565, -1.482752, 1, 1, 1, 1, 1,
-0.6376147, -1.292943, -2.138348, 1, 1, 1, 1, 1,
-0.6364359, -0.3836197, -2.101832, 1, 1, 1, 1, 1,
-0.6266555, -0.3383431, -0.991732, 1, 1, 1, 1, 1,
-0.6250117, -0.8196074, -1.053789, 1, 1, 1, 1, 1,
-0.6214209, -0.4904718, -0.3711788, 0, 0, 1, 1, 1,
-0.6150219, -0.8948218, -2.087734, 1, 0, 0, 1, 1,
-0.6087383, 0.2312879, -1.781339, 1, 0, 0, 1, 1,
-0.6080351, -0.4373348, -2.998649, 1, 0, 0, 1, 1,
-0.6068473, -0.1705538, -2.295796, 1, 0, 0, 1, 1,
-0.6022196, 0.01172093, -1.536919, 1, 0, 0, 1, 1,
-0.5952122, -0.7705244, -3.874789, 0, 0, 0, 1, 1,
-0.588378, -1.329542, -3.187579, 0, 0, 0, 1, 1,
-0.5878363, 1.240127, -0.9974488, 0, 0, 0, 1, 1,
-0.5775712, -2.972898, -1.913342, 0, 0, 0, 1, 1,
-0.5750796, 1.814004, -0.2950695, 0, 0, 0, 1, 1,
-0.5720021, -0.02900291, -2.769406, 0, 0, 0, 1, 1,
-0.5711581, 0.9556271, -1.409537, 0, 0, 0, 1, 1,
-0.570107, -2.261243, -1.404778, 1, 1, 1, 1, 1,
-0.5668243, 1.038351, -0.5260898, 1, 1, 1, 1, 1,
-0.5648952, -0.5253759, -0.2359622, 1, 1, 1, 1, 1,
-0.5636368, -0.03449562, -0.937649, 1, 1, 1, 1, 1,
-0.5566611, -0.6517235, -3.044703, 1, 1, 1, 1, 1,
-0.5536348, 0.5738321, 0.8385878, 1, 1, 1, 1, 1,
-0.5529882, -0.3705895, -0.6216043, 1, 1, 1, 1, 1,
-0.5503356, 0.2944869, -0.4299529, 1, 1, 1, 1, 1,
-0.549705, 0.4181838, -0.1667301, 1, 1, 1, 1, 1,
-0.5483918, -0.5856469, -5.143698, 1, 1, 1, 1, 1,
-0.5481246, 0.5985831, -0.2257127, 1, 1, 1, 1, 1,
-0.5382202, 0.2686505, 0.4462498, 1, 1, 1, 1, 1,
-0.5358461, -1.941315, -1.762853, 1, 1, 1, 1, 1,
-0.5327303, 0.3699894, -0.2030792, 1, 1, 1, 1, 1,
-0.5225072, -0.7841313, -3.346191, 1, 1, 1, 1, 1,
-0.5204383, -1.50019, -1.97265, 0, 0, 1, 1, 1,
-0.5200565, 0.215143, -0.4317605, 1, 0, 0, 1, 1,
-0.5170798, -1.098269, -4.257015, 1, 0, 0, 1, 1,
-0.512185, 0.7807438, -1.874516, 1, 0, 0, 1, 1,
-0.5110518, 1.600739, -0.4378694, 1, 0, 0, 1, 1,
-0.5091888, 0.7572335, 0.5388831, 1, 0, 0, 1, 1,
-0.4987173, -1.392641, -3.163354, 0, 0, 0, 1, 1,
-0.4963879, 0.8299052, -1.373562, 0, 0, 0, 1, 1,
-0.4958887, 0.4747163, 1.15331, 0, 0, 0, 1, 1,
-0.4950247, -0.9701664, -5.345129, 0, 0, 0, 1, 1,
-0.4912832, 0.3973272, 0.1823217, 0, 0, 0, 1, 1,
-0.4908663, 0.2924172, -3.36771, 0, 0, 0, 1, 1,
-0.4900941, -1.116971, -3.384314, 0, 0, 0, 1, 1,
-0.4827251, -1.227355, -2.565001, 1, 1, 1, 1, 1,
-0.4816065, -0.4962757, -1.651326, 1, 1, 1, 1, 1,
-0.4812316, -0.9094075, -3.286355, 1, 1, 1, 1, 1,
-0.4774826, -1.108611, -1.48274, 1, 1, 1, 1, 1,
-0.4716019, -1.373222, -4.526436, 1, 1, 1, 1, 1,
-0.470617, -0.4090875, -2.214521, 1, 1, 1, 1, 1,
-0.4657512, -0.3030725, -3.456475, 1, 1, 1, 1, 1,
-0.4652661, 0.3439192, -0.2470513, 1, 1, 1, 1, 1,
-0.4651999, 0.1789322, -0.8653434, 1, 1, 1, 1, 1,
-0.4629995, 2.579194, -0.8986132, 1, 1, 1, 1, 1,
-0.4624163, -0.004926222, -1.8976, 1, 1, 1, 1, 1,
-0.4608796, -0.00144532, -1.888432, 1, 1, 1, 1, 1,
-0.4569889, -2.460205, -2.940427, 1, 1, 1, 1, 1,
-0.4560687, -0.5663885, -2.564817, 1, 1, 1, 1, 1,
-0.4547944, -0.3379838, -3.122706, 1, 1, 1, 1, 1,
-0.451725, -1.19967, -1.848369, 0, 0, 1, 1, 1,
-0.4513257, -0.7045811, -4.079796, 1, 0, 0, 1, 1,
-0.4414231, 0.09510354, -2.333447, 1, 0, 0, 1, 1,
-0.4411681, 2.284634, 1.116077, 1, 0, 0, 1, 1,
-0.438755, -0.6159042, -3.553252, 1, 0, 0, 1, 1,
-0.4377539, 0.8908036, 0.1664016, 1, 0, 0, 1, 1,
-0.4275101, -0.2260431, -2.653212, 0, 0, 0, 1, 1,
-0.4273183, 1.517568, -2.535871, 0, 0, 0, 1, 1,
-0.4209089, 0.7047622, -2.076576, 0, 0, 0, 1, 1,
-0.4205134, 0.008287968, -2.348092, 0, 0, 0, 1, 1,
-0.4189721, 0.07948034, -1.913388, 0, 0, 0, 1, 1,
-0.4142947, -1.353757, -3.367409, 0, 0, 0, 1, 1,
-0.4142264, 0.3316537, -2.24512, 0, 0, 0, 1, 1,
-0.4127862, -0.3687021, -2.221368, 1, 1, 1, 1, 1,
-0.4102247, -0.3362034, -2.967749, 1, 1, 1, 1, 1,
-0.4079552, -0.6722754, -3.111055, 1, 1, 1, 1, 1,
-0.4075731, -2.158113, -2.827358, 1, 1, 1, 1, 1,
-0.3996212, 1.430037, -1.062006, 1, 1, 1, 1, 1,
-0.3902791, 0.2872134, -0.3803099, 1, 1, 1, 1, 1,
-0.388816, 0.7402402, -1.296171, 1, 1, 1, 1, 1,
-0.3841737, 1.59542, 0.7780771, 1, 1, 1, 1, 1,
-0.3812125, 1.220929, -0.6617417, 1, 1, 1, 1, 1,
-0.3805473, 0.6764923, -2.094128, 1, 1, 1, 1, 1,
-0.3795376, 0.665251, -0.03095409, 1, 1, 1, 1, 1,
-0.373976, 0.6488989, -0.654887, 1, 1, 1, 1, 1,
-0.373761, -0.4225764, -2.352569, 1, 1, 1, 1, 1,
-0.3701668, -2.40145, -3.464374, 1, 1, 1, 1, 1,
-0.3606461, -0.5930742, -4.394736, 1, 1, 1, 1, 1,
-0.3592478, -0.1554251, 0.3640354, 0, 0, 1, 1, 1,
-0.3581361, -1.380281, -0.7535172, 1, 0, 0, 1, 1,
-0.3581159, 0.9403005, -0.5656332, 1, 0, 0, 1, 1,
-0.3524877, -0.6114891, -3.936157, 1, 0, 0, 1, 1,
-0.3480016, -0.4727177, -2.484815, 1, 0, 0, 1, 1,
-0.3449089, -0.8345708, -2.018874, 1, 0, 0, 1, 1,
-0.3421138, 1.166219, -0.8334522, 0, 0, 0, 1, 1,
-0.3337054, -2.099924, -4.711093, 0, 0, 0, 1, 1,
-0.3332968, -1.121752, -1.30565, 0, 0, 0, 1, 1,
-0.3310736, -1.030042, -2.442086, 0, 0, 0, 1, 1,
-0.3310339, -0.4284331, -2.601121, 0, 0, 0, 1, 1,
-0.3276013, -0.05700402, -2.514157, 0, 0, 0, 1, 1,
-0.3272068, 0.1836603, -0.601684, 0, 0, 0, 1, 1,
-0.3218296, -0.8985671, -2.898917, 1, 1, 1, 1, 1,
-0.3123666, 0.157413, -2.425086, 1, 1, 1, 1, 1,
-0.3110666, 0.5757159, 0.7119687, 1, 1, 1, 1, 1,
-0.3033388, -0.5309842, -3.084506, 1, 1, 1, 1, 1,
-0.2972585, 0.6484926, -1.875284, 1, 1, 1, 1, 1,
-0.2942551, 1.649349, 1.175444, 1, 1, 1, 1, 1,
-0.2911031, -0.27105, -3.729379, 1, 1, 1, 1, 1,
-0.2904165, 0.6372756, 0.9066342, 1, 1, 1, 1, 1,
-0.2898881, -0.2013672, -3.325176, 1, 1, 1, 1, 1,
-0.2893515, -2.13795, -1.883047, 1, 1, 1, 1, 1,
-0.2889506, 0.1673224, -0.4985617, 1, 1, 1, 1, 1,
-0.2885993, -1.027851, -3.795354, 1, 1, 1, 1, 1,
-0.2873897, -0.8629221, -3.259732, 1, 1, 1, 1, 1,
-0.2849717, -1.650524, -3.07645, 1, 1, 1, 1, 1,
-0.2834931, 0.610522, -0.7316592, 1, 1, 1, 1, 1,
-0.2828759, 1.57458, -0.4323639, 0, 0, 1, 1, 1,
-0.2821083, 0.3523916, -0.1804565, 1, 0, 0, 1, 1,
-0.2797014, 0.8787146, -0.4693214, 1, 0, 0, 1, 1,
-0.2774596, 0.8165634, -0.9635085, 1, 0, 0, 1, 1,
-0.2760459, 1.32969, -1.59565, 1, 0, 0, 1, 1,
-0.2753853, 0.1931317, 1.31275, 1, 0, 0, 1, 1,
-0.2726008, 0.5951862, -0.6768126, 0, 0, 0, 1, 1,
-0.271031, 0.3419227, -0.4259627, 0, 0, 0, 1, 1,
-0.269993, 1.317001, -0.03574522, 0, 0, 0, 1, 1,
-0.2641663, -0.6935979, -2.277308, 0, 0, 0, 1, 1,
-0.2629637, 1.064407, 0.3796284, 0, 0, 0, 1, 1,
-0.2569039, 0.234451, -2.729962, 0, 0, 0, 1, 1,
-0.2568749, 0.6130403, -0.08621364, 0, 0, 0, 1, 1,
-0.2557693, -1.591749, -2.935685, 1, 1, 1, 1, 1,
-0.2557504, 0.03498873, -1.813653, 1, 1, 1, 1, 1,
-0.252317, -0.9825675, -4.212962, 1, 1, 1, 1, 1,
-0.2503543, 1.655205, -0.3603787, 1, 1, 1, 1, 1,
-0.2494347, 0.3650787, -0.823455, 1, 1, 1, 1, 1,
-0.2478878, -0.209602, -2.89192, 1, 1, 1, 1, 1,
-0.2459652, 0.8056518, 1.859607, 1, 1, 1, 1, 1,
-0.2442242, 1.745263, 1.33078, 1, 1, 1, 1, 1,
-0.238577, 0.859682, 0.6559178, 1, 1, 1, 1, 1,
-0.2312254, -0.2688038, -3.223993, 1, 1, 1, 1, 1,
-0.2277946, 0.8532449, -1.317563, 1, 1, 1, 1, 1,
-0.2245828, 0.9419412, -1.260131, 1, 1, 1, 1, 1,
-0.2235582, 1.206114, -0.374683, 1, 1, 1, 1, 1,
-0.2221837, 0.6928651, -0.7026474, 1, 1, 1, 1, 1,
-0.2208969, 1.524646, 0.9590354, 1, 1, 1, 1, 1,
-0.214665, -1.075942, -2.965431, 0, 0, 1, 1, 1,
-0.2124416, 0.3552997, -0.6056194, 1, 0, 0, 1, 1,
-0.2116688, 0.1430615, -1.204524, 1, 0, 0, 1, 1,
-0.2105977, -0.3628102, -3.329159, 1, 0, 0, 1, 1,
-0.2098443, 1.019238, -1.258888, 1, 0, 0, 1, 1,
-0.2097253, 1.356991, -1.188486, 1, 0, 0, 1, 1,
-0.2045023, 1.16746, -1.249725, 0, 0, 0, 1, 1,
-0.2016349, 0.9071742, 0.320102, 0, 0, 0, 1, 1,
-0.1960014, -0.7579558, -2.361258, 0, 0, 0, 1, 1,
-0.1932745, -1.880848, -2.437491, 0, 0, 0, 1, 1,
-0.191448, -0.4209683, -1.382425, 0, 0, 0, 1, 1,
-0.1912518, 1.886015, -1.557916, 0, 0, 0, 1, 1,
-0.1880775, -1.634308, -2.33268, 0, 0, 0, 1, 1,
-0.1769666, 1.612823, 0.04302479, 1, 1, 1, 1, 1,
-0.1738321, 1.79189, 0.1581252, 1, 1, 1, 1, 1,
-0.1704438, 1.158178, 1.27916, 1, 1, 1, 1, 1,
-0.1704077, -0.2570571, -4.982838, 1, 1, 1, 1, 1,
-0.1674327, -1.774526, -3.070448, 1, 1, 1, 1, 1,
-0.1638953, -1.090383, -2.952482, 1, 1, 1, 1, 1,
-0.1606054, 1.662403, -1.104532, 1, 1, 1, 1, 1,
-0.1605574, -1.09417, -1.196162, 1, 1, 1, 1, 1,
-0.1561871, 0.05705692, -0.3273753, 1, 1, 1, 1, 1,
-0.1524519, -1.173011, -3.533457, 1, 1, 1, 1, 1,
-0.1502168, -0.1512725, -1.6346, 1, 1, 1, 1, 1,
-0.1489289, 0.7271267, 0.8337778, 1, 1, 1, 1, 1,
-0.1488504, -2.171883, -1.933815, 1, 1, 1, 1, 1,
-0.1444592, -0.5084567, -1.885754, 1, 1, 1, 1, 1,
-0.1443724, -1.37762, -3.885565, 1, 1, 1, 1, 1,
-0.1434458, 0.8167482, -1.069116, 0, 0, 1, 1, 1,
-0.1418521, 1.287879, -1.074404, 1, 0, 0, 1, 1,
-0.1384428, 0.2823153, -1.130013, 1, 0, 0, 1, 1,
-0.1376789, 0.8012307, -0.9994498, 1, 0, 0, 1, 1,
-0.137123, -0.7368903, -3.053386, 1, 0, 0, 1, 1,
-0.1366019, 0.2606552, -0.2516882, 1, 0, 0, 1, 1,
-0.1349016, -0.3992955, -3.041963, 0, 0, 0, 1, 1,
-0.1346592, 0.2276348, -0.4811656, 0, 0, 0, 1, 1,
-0.1276655, -2.308507, -4.839036, 0, 0, 0, 1, 1,
-0.1271261, -0.7338293, -4.217431, 0, 0, 0, 1, 1,
-0.1246505, -1.049712, -3.525309, 0, 0, 0, 1, 1,
-0.1245286, -1.047034, -3.342201, 0, 0, 0, 1, 1,
-0.1227257, 0.1685374, 0.4468315, 0, 0, 0, 1, 1,
-0.115541, 1.634733, -1.81445, 1, 1, 1, 1, 1,
-0.1151727, -1.362725, -3.773307, 1, 1, 1, 1, 1,
-0.1129652, -1.160706, -3.325452, 1, 1, 1, 1, 1,
-0.1118743, -0.5581638, -3.715309, 1, 1, 1, 1, 1,
-0.1069835, 0.809411, -0.8915308, 1, 1, 1, 1, 1,
-0.1033016, -0.062244, -2.680939, 1, 1, 1, 1, 1,
-0.1025667, -1.295358, -2.556747, 1, 1, 1, 1, 1,
-0.09940074, 0.6276678, -0.7641779, 1, 1, 1, 1, 1,
-0.09923051, 1.154128, -1.423756, 1, 1, 1, 1, 1,
-0.09814295, 0.7881332, -0.4736251, 1, 1, 1, 1, 1,
-0.09730977, 1.457419, 0.5176045, 1, 1, 1, 1, 1,
-0.09568568, 0.2308774, -0.8422444, 1, 1, 1, 1, 1,
-0.09147566, 1.031967, 0.8315262, 1, 1, 1, 1, 1,
-0.09078223, -0.29863, -2.501975, 1, 1, 1, 1, 1,
-0.09071828, -0.1630737, -1.848762, 1, 1, 1, 1, 1,
-0.09035833, -1.22438, -3.471787, 0, 0, 1, 1, 1,
-0.08802374, -0.388029, -1.302311, 1, 0, 0, 1, 1,
-0.08624171, -0.5087612, -3.883564, 1, 0, 0, 1, 1,
-0.08365752, 1.441077, 1.25848, 1, 0, 0, 1, 1,
-0.07893947, 0.6905006, 0.9876524, 1, 0, 0, 1, 1,
-0.07820752, 0.9560647, 0.7826382, 1, 0, 0, 1, 1,
-0.07779521, -1.126305, -2.65113, 0, 0, 0, 1, 1,
-0.07660745, -0.5561064, -1.308206, 0, 0, 0, 1, 1,
-0.07653093, 1.187027, 0.2788519, 0, 0, 0, 1, 1,
-0.07617041, -2.011677, -4.212778, 0, 0, 0, 1, 1,
-0.07255527, 0.2163672, -0.7897593, 0, 0, 0, 1, 1,
-0.07185078, 1.448095, 0.8760218, 0, 0, 0, 1, 1,
-0.07130631, -1.636026, -2.075679, 0, 0, 0, 1, 1,
-0.06731632, 1.235254, 1.569443, 1, 1, 1, 1, 1,
-0.06683853, 2.060096, 2.000149, 1, 1, 1, 1, 1,
-0.06291786, 0.03998075, 0.8559638, 1, 1, 1, 1, 1,
-0.06085298, -0.361719, -2.157431, 1, 1, 1, 1, 1,
-0.05633657, -0.5005869, -3.328385, 1, 1, 1, 1, 1,
-0.05331249, -2.115916, -3.277939, 1, 1, 1, 1, 1,
-0.05304578, 1.053329, 0.642271, 1, 1, 1, 1, 1,
-0.05118326, -0.7675481, -3.867985, 1, 1, 1, 1, 1,
-0.05095837, -0.9391567, -2.551104, 1, 1, 1, 1, 1,
-0.04670009, -0.730364, -2.864384, 1, 1, 1, 1, 1,
-0.04624588, 1.579936, 2.256657, 1, 1, 1, 1, 1,
-0.04513501, 0.8787363, 1.861077, 1, 1, 1, 1, 1,
-0.04417372, -0.3206871, -1.104165, 1, 1, 1, 1, 1,
-0.03910755, 1.190452, -0.5085486, 1, 1, 1, 1, 1,
-0.03798668, 0.4398302, -0.7489662, 1, 1, 1, 1, 1,
-0.03391614, -0.3828912, -0.7609474, 0, 0, 1, 1, 1,
-0.03325281, -0.4532385, -4.164187, 1, 0, 0, 1, 1,
-0.03263714, 0.4312343, 0.3268771, 1, 0, 0, 1, 1,
-0.02940641, 1.116153, -1.425812, 1, 0, 0, 1, 1,
-0.02743054, -0.8445973, -1.435464, 1, 0, 0, 1, 1,
-0.02550236, 0.1076182, 0.2422706, 1, 0, 0, 1, 1,
-0.02478915, 0.6260324, 0.1353477, 0, 0, 0, 1, 1,
-0.02444595, -1.11977, -3.134992, 0, 0, 0, 1, 1,
-0.02418379, 0.20212, 0.8607585, 0, 0, 0, 1, 1,
-0.02130306, -1.396478, -2.836161, 0, 0, 0, 1, 1,
-0.01972686, 0.5519898, -0.02209274, 0, 0, 0, 1, 1,
-0.01652425, 0.053469, -0.81201, 0, 0, 0, 1, 1,
-0.01625332, -1.566996, -2.359524, 0, 0, 0, 1, 1,
-0.01292514, -0.09045108, -3.013399, 1, 1, 1, 1, 1,
-0.01187258, -0.3317702, -4.279097, 1, 1, 1, 1, 1,
-0.01178317, -1.997549, -3.108655, 1, 1, 1, 1, 1,
-0.006081689, 0.6956542, 1.645333, 1, 1, 1, 1, 1,
-0.001984902, 2.187519, -0.2454702, 1, 1, 1, 1, 1,
-0.001931831, 0.3018914, 1.949924, 1, 1, 1, 1, 1,
0.002605787, -2.675163, 3.138906, 1, 1, 1, 1, 1,
0.003609044, -0.1076015, 5.160194, 1, 1, 1, 1, 1,
0.004938236, 0.1842065, 0.4815323, 1, 1, 1, 1, 1,
0.00956072, 0.8580613, 1.045429, 1, 1, 1, 1, 1,
0.02029007, -0.5386601, 4.256982, 1, 1, 1, 1, 1,
0.02144933, -0.846291, 5.057265, 1, 1, 1, 1, 1,
0.02587938, -0.6034487, 4.645271, 1, 1, 1, 1, 1,
0.02617507, -0.8021286, 3.100187, 1, 1, 1, 1, 1,
0.02825339, 0.3103327, 0.3233853, 1, 1, 1, 1, 1,
0.03033607, -0.1071277, 2.722965, 0, 0, 1, 1, 1,
0.0330489, -0.06343253, 2.392708, 1, 0, 0, 1, 1,
0.033149, -1.278782, 3.459196, 1, 0, 0, 1, 1,
0.03568694, -0.0818517, 2.971503, 1, 0, 0, 1, 1,
0.03590984, 0.6723142, -1.232698, 1, 0, 0, 1, 1,
0.03772606, 1.156941, -0.755493, 1, 0, 0, 1, 1,
0.03925349, -1.843378, 3.615362, 0, 0, 0, 1, 1,
0.03960878, -0.3460995, 2.977097, 0, 0, 0, 1, 1,
0.05101829, 0.3386298, 0.1153615, 0, 0, 0, 1, 1,
0.05316406, -0.1678475, 3.918076, 0, 0, 0, 1, 1,
0.05528229, 0.3919942, -0.4664103, 0, 0, 0, 1, 1,
0.05669305, 1.851223, 1.054757, 0, 0, 0, 1, 1,
0.05927847, 1.109462, 0.2213518, 0, 0, 0, 1, 1,
0.06028094, 0.2965467, -0.6293225, 1, 1, 1, 1, 1,
0.06040064, -0.8772936, 3.550142, 1, 1, 1, 1, 1,
0.06156375, -0.2686507, 1.58175, 1, 1, 1, 1, 1,
0.06967424, 0.7707102, -0.7269502, 1, 1, 1, 1, 1,
0.07035486, -1.477349, 3.154672, 1, 1, 1, 1, 1,
0.07550794, 0.6935133, -1.831894, 1, 1, 1, 1, 1,
0.07606017, -1.607231, 2.949557, 1, 1, 1, 1, 1,
0.08028845, -1.253284, 6.073151, 1, 1, 1, 1, 1,
0.0825402, 0.491086, 0.4966373, 1, 1, 1, 1, 1,
0.08333702, 0.7832646, 1.585305, 1, 1, 1, 1, 1,
0.0866705, 0.5570484, 2.513352, 1, 1, 1, 1, 1,
0.09104206, -0.6965436, 3.70067, 1, 1, 1, 1, 1,
0.09235148, -0.5917087, 2.561889, 1, 1, 1, 1, 1,
0.09307715, -0.06093983, 3.473525, 1, 1, 1, 1, 1,
0.09442516, 0.9550624, -0.07375661, 1, 1, 1, 1, 1,
0.0951587, -0.2881515, 1.612389, 0, 0, 1, 1, 1,
0.1023627, -0.2138427, 1.917936, 1, 0, 0, 1, 1,
0.1025976, -0.1244271, 4.231973, 1, 0, 0, 1, 1,
0.1037167, 0.7175551, 0.6237671, 1, 0, 0, 1, 1,
0.1039607, 1.52174, 0.7931042, 1, 0, 0, 1, 1,
0.1051105, -0.2339611, 1.819421, 1, 0, 0, 1, 1,
0.1082301, -0.3015369, 2.832352, 0, 0, 0, 1, 1,
0.109411, 0.03586914, 1.870857, 0, 0, 0, 1, 1,
0.1095901, 0.2240977, 1.845679, 0, 0, 0, 1, 1,
0.1209951, 0.6849065, -0.1484209, 0, 0, 0, 1, 1,
0.1237264, 0.9257109, 1.3412, 0, 0, 0, 1, 1,
0.1261057, 0.1142526, -0.6087438, 0, 0, 0, 1, 1,
0.130661, 0.392466, 0.2065617, 0, 0, 0, 1, 1,
0.1318541, 0.2498547, 0.6353737, 1, 1, 1, 1, 1,
0.1346673, -0.2961016, 2.355865, 1, 1, 1, 1, 1,
0.1380758, -1.248193, 2.067376, 1, 1, 1, 1, 1,
0.1391928, -0.04484557, 0.5700088, 1, 1, 1, 1, 1,
0.1392083, 0.6786925, 0.05442108, 1, 1, 1, 1, 1,
0.1394498, -1.473012, 2.530167, 1, 1, 1, 1, 1,
0.1464196, -0.1544673, 1.379386, 1, 1, 1, 1, 1,
0.1495676, -0.5731047, 2.213069, 1, 1, 1, 1, 1,
0.1536663, -0.9151635, 2.842524, 1, 1, 1, 1, 1,
0.1549808, -1.562514, 1.241653, 1, 1, 1, 1, 1,
0.1563633, -1.90768, 3.451449, 1, 1, 1, 1, 1,
0.1564514, -1.028513, 3.564348, 1, 1, 1, 1, 1,
0.1648165, 0.3769548, 1.486975, 1, 1, 1, 1, 1,
0.1655752, 0.8971585, -0.2196577, 1, 1, 1, 1, 1,
0.1759469, -0.7084791, 2.581481, 1, 1, 1, 1, 1,
0.1792596, 0.1008581, 0.7668225, 0, 0, 1, 1, 1,
0.1793163, 1.726167, -0.5724742, 1, 0, 0, 1, 1,
0.1793583, -1.738524, 2.423592, 1, 0, 0, 1, 1,
0.1806918, 0.3354025, 1.714234, 1, 0, 0, 1, 1,
0.1817928, 0.1807455, 0.2048125, 1, 0, 0, 1, 1,
0.1840867, 0.2148486, -0.5387865, 1, 0, 0, 1, 1,
0.1948791, -0.4661718, 2.465531, 0, 0, 0, 1, 1,
0.2078154, -1.510098, 3.092898, 0, 0, 0, 1, 1,
0.2154015, 0.1661618, 1.868968, 0, 0, 0, 1, 1,
0.2164329, 0.4346295, -0.008849628, 0, 0, 0, 1, 1,
0.2225726, -1.887784, 1.407966, 0, 0, 0, 1, 1,
0.223763, -0.1190131, 2.320521, 0, 0, 0, 1, 1,
0.2242349, -0.1228845, 2.496427, 0, 0, 0, 1, 1,
0.2262491, -1.917126, 3.232868, 1, 1, 1, 1, 1,
0.2318397, 0.1726062, 0.9158179, 1, 1, 1, 1, 1,
0.2346626, -0.6622974, 1.585336, 1, 1, 1, 1, 1,
0.2368425, -0.2584747, 2.204865, 1, 1, 1, 1, 1,
0.2384079, -1.201035, 1.610089, 1, 1, 1, 1, 1,
0.2385164, 1.347354, 1.251174, 1, 1, 1, 1, 1,
0.2391728, -2.74251, 4.133089, 1, 1, 1, 1, 1,
0.2409681, -1.357041, 3.73746, 1, 1, 1, 1, 1,
0.2447299, -1.257505, 2.337096, 1, 1, 1, 1, 1,
0.2499421, -0.2472864, 0.8685342, 1, 1, 1, 1, 1,
0.2508142, -1.164918, 3.427348, 1, 1, 1, 1, 1,
0.2509052, -0.7403913, 1.440674, 1, 1, 1, 1, 1,
0.2542503, 1.122906, -0.9326951, 1, 1, 1, 1, 1,
0.2556216, 1.598085, 0.1843107, 1, 1, 1, 1, 1,
0.2579501, -1.526782, 2.960599, 1, 1, 1, 1, 1,
0.2623456, 0.1327724, 1.65996, 0, 0, 1, 1, 1,
0.2623614, -1.350005, 2.365538, 1, 0, 0, 1, 1,
0.2645435, 0.4618309, 0.4753238, 1, 0, 0, 1, 1,
0.2658103, -2.280391, 1.492341, 1, 0, 0, 1, 1,
0.2664535, -0.6094065, 2.934278, 1, 0, 0, 1, 1,
0.2667842, 0.7735222, 1.039916, 1, 0, 0, 1, 1,
0.2723412, 1.271573, -0.6365845, 0, 0, 0, 1, 1,
0.2759671, 1.177297, 0.6862853, 0, 0, 0, 1, 1,
0.2767697, 0.6874853, -0.3450321, 0, 0, 0, 1, 1,
0.278199, -0.002171201, 2.909959, 0, 0, 0, 1, 1,
0.2793996, -0.1581086, 3.597443, 0, 0, 0, 1, 1,
0.2809055, 0.7335857, 0.2016197, 0, 0, 0, 1, 1,
0.2895884, 2.279968, -1.661026, 0, 0, 0, 1, 1,
0.291313, 2.020777, -0.6653425, 1, 1, 1, 1, 1,
0.2926853, 1.041285, -0.5490908, 1, 1, 1, 1, 1,
0.2927275, -0.3486435, 1.989433, 1, 1, 1, 1, 1,
0.2968059, 2.221455, 1.201865, 1, 1, 1, 1, 1,
0.2977555, 0.5621384, 0.767749, 1, 1, 1, 1, 1,
0.299631, 0.04602895, 1.980261, 1, 1, 1, 1, 1,
0.3024132, 0.2747372, 0.5366616, 1, 1, 1, 1, 1,
0.307919, 1.986383, -0.8356864, 1, 1, 1, 1, 1,
0.3160193, 1.866087, -0.990272, 1, 1, 1, 1, 1,
0.3179288, -0.918548, 4.252471, 1, 1, 1, 1, 1,
0.3208434, -0.1295055, 1.681621, 1, 1, 1, 1, 1,
0.321105, 0.3665212, 1.467895, 1, 1, 1, 1, 1,
0.3264439, -0.06578199, 2.39851, 1, 1, 1, 1, 1,
0.3310739, 1.207342, -0.6488361, 1, 1, 1, 1, 1,
0.3321464, -0.3230244, 1.449972, 1, 1, 1, 1, 1,
0.3368025, 0.3327065, 0.9088472, 0, 0, 1, 1, 1,
0.3399419, -0.5439811, 4.380283, 1, 0, 0, 1, 1,
0.3404058, -1.192979, 1.734346, 1, 0, 0, 1, 1,
0.3407015, 0.4140367, 0.2425589, 1, 0, 0, 1, 1,
0.3418957, 1.091552, 0.8087915, 1, 0, 0, 1, 1,
0.3420484, 1.10389, 0.458184, 1, 0, 0, 1, 1,
0.3503062, -1.119918, 2.439541, 0, 0, 0, 1, 1,
0.3513173, -0.6838797, 3.359164, 0, 0, 0, 1, 1,
0.3537678, -0.2507191, 1.799733, 0, 0, 0, 1, 1,
0.3590319, 1.542224, 0.6991144, 0, 0, 0, 1, 1,
0.3608395, -0.2131129, 2.444151, 0, 0, 0, 1, 1,
0.3624729, -0.5924779, 2.262498, 0, 0, 0, 1, 1,
0.3634866, -0.827544, 0.8709813, 0, 0, 0, 1, 1,
0.3662822, -0.4842272, 2.436737, 1, 1, 1, 1, 1,
0.3666459, -0.2676212, 2.539092, 1, 1, 1, 1, 1,
0.3682678, 1.309071, 0.273245, 1, 1, 1, 1, 1,
0.3716056, -0.9987162, 1.608418, 1, 1, 1, 1, 1,
0.3727275, 0.7974933, 0.4196587, 1, 1, 1, 1, 1,
0.3767296, 0.4059976, 2.05792, 1, 1, 1, 1, 1,
0.379772, -0.0233625, 0.1539996, 1, 1, 1, 1, 1,
0.3848026, 1.016862, -1.282133, 1, 1, 1, 1, 1,
0.3854007, -0.1734233, 1.085038, 1, 1, 1, 1, 1,
0.3877516, 0.3441143, -0.3383588, 1, 1, 1, 1, 1,
0.3923098, -0.06739884, 1.046435, 1, 1, 1, 1, 1,
0.3940978, -1.379505, 2.316434, 1, 1, 1, 1, 1,
0.3993738, -1.136535, 2.139516, 1, 1, 1, 1, 1,
0.4001327, 0.06524915, 0.6304635, 1, 1, 1, 1, 1,
0.4044117, 0.0760389, 2.440395, 1, 1, 1, 1, 1,
0.4131431, -0.03902526, 1.114761, 0, 0, 1, 1, 1,
0.4136831, -0.3399248, 1.049335, 1, 0, 0, 1, 1,
0.4178171, -0.502313, 4.248877, 1, 0, 0, 1, 1,
0.4188383, 0.0316351, 3.351621, 1, 0, 0, 1, 1,
0.4199323, -0.646004, 0.08761918, 1, 0, 0, 1, 1,
0.4236675, 0.01463467, 1.693438, 1, 0, 0, 1, 1,
0.4238952, -0.9023752, -0.4207125, 0, 0, 0, 1, 1,
0.424861, 0.3017558, 0.9165913, 0, 0, 0, 1, 1,
0.4250806, -0.9828618, 2.996152, 0, 0, 0, 1, 1,
0.4301636, -0.3705108, 1.92801, 0, 0, 0, 1, 1,
0.430423, 0.4179679, 2.646944, 0, 0, 0, 1, 1,
0.4383689, -0.5028791, 2.086427, 0, 0, 0, 1, 1,
0.4383716, -0.7659456, 3.551685, 0, 0, 0, 1, 1,
0.4416268, 0.5469595, -0.3412392, 1, 1, 1, 1, 1,
0.4524159, 0.05551436, 0.7351767, 1, 1, 1, 1, 1,
0.4531324, 0.8553715, 0.1896137, 1, 1, 1, 1, 1,
0.4533152, 2.527813, 0.7843158, 1, 1, 1, 1, 1,
0.456068, 0.3746749, 1.873061, 1, 1, 1, 1, 1,
0.4619353, -0.525002, 2.155362, 1, 1, 1, 1, 1,
0.4629147, 0.4447789, 0.9208034, 1, 1, 1, 1, 1,
0.4654911, 0.3244374, 1.341518, 1, 1, 1, 1, 1,
0.4660308, -0.09827244, 0.4434845, 1, 1, 1, 1, 1,
0.4675356, -0.7769628, 4.447896, 1, 1, 1, 1, 1,
0.467605, -0.5376576, 3.651161, 1, 1, 1, 1, 1,
0.4716054, 0.6686915, 0.3919961, 1, 1, 1, 1, 1,
0.4748431, -0.6961478, 1.769497, 1, 1, 1, 1, 1,
0.475715, 0.4229084, -0.419772, 1, 1, 1, 1, 1,
0.4761896, -0.3025222, 0.1705882, 1, 1, 1, 1, 1,
0.4786337, -0.6568997, 3.765456, 0, 0, 1, 1, 1,
0.4846656, 1.178416, -0.5256643, 1, 0, 0, 1, 1,
0.485858, 0.8462254, 1.09964, 1, 0, 0, 1, 1,
0.4888628, -0.993572, 2.608879, 1, 0, 0, 1, 1,
0.489513, -0.3578256, 0.09829514, 1, 0, 0, 1, 1,
0.4903574, 1.890303, 0.6231498, 1, 0, 0, 1, 1,
0.4931785, 0.9597521, 1.03842, 0, 0, 0, 1, 1,
0.4960229, -0.6479941, 1.750269, 0, 0, 0, 1, 1,
0.4964591, -0.4015113, 2.639855, 0, 0, 0, 1, 1,
0.4999447, -0.6403296, 0.953059, 0, 0, 0, 1, 1,
0.5041329, -0.7311586, 2.906307, 0, 0, 0, 1, 1,
0.504945, -1.175099, 4.824795, 0, 0, 0, 1, 1,
0.5081817, 0.1014644, 0.6804199, 0, 0, 0, 1, 1,
0.5094851, -0.5154833, 2.235049, 1, 1, 1, 1, 1,
0.5213873, -0.9544294, 2.956591, 1, 1, 1, 1, 1,
0.5239236, -1.306552, 2.380567, 1, 1, 1, 1, 1,
0.5248096, -2.560473, 2.510832, 1, 1, 1, 1, 1,
0.5263035, 0.1179009, 2.097626, 1, 1, 1, 1, 1,
0.5303932, 1.788385, -0.3257769, 1, 1, 1, 1, 1,
0.5332029, -0.02041626, 2.119755, 1, 1, 1, 1, 1,
0.5335115, 0.3444135, 0.2164885, 1, 1, 1, 1, 1,
0.5411665, 0.4546524, 2.161676, 1, 1, 1, 1, 1,
0.5452992, -1.478689, 3.433949, 1, 1, 1, 1, 1,
0.5483931, -0.3114461, 2.174158, 1, 1, 1, 1, 1,
0.5512923, 0.4434579, 1.776213, 1, 1, 1, 1, 1,
0.5525167, 0.9904901, -0.04509635, 1, 1, 1, 1, 1,
0.5545079, -1.076461, 1.791077, 1, 1, 1, 1, 1,
0.5575017, 0.5292158, 0.009962859, 1, 1, 1, 1, 1,
0.5767685, -0.5142981, 2.499388, 0, 0, 1, 1, 1,
0.578154, -0.4238626, 2.970549, 1, 0, 0, 1, 1,
0.580773, -2.040094, 4.366377, 1, 0, 0, 1, 1,
0.582482, -0.7241227, 0.5747229, 1, 0, 0, 1, 1,
0.582827, -0.6781113, 2.315681, 1, 0, 0, 1, 1,
0.5863301, 0.2849875, 2.008154, 1, 0, 0, 1, 1,
0.5956225, 1.556759, 1.189289, 0, 0, 0, 1, 1,
0.6031572, -1.150948, 1.055571, 0, 0, 0, 1, 1,
0.6169806, 0.4322283, 2.478234, 0, 0, 0, 1, 1,
0.6219077, -0.1552452, 1.301865, 0, 0, 0, 1, 1,
0.6404666, 0.8257521, 1.503608, 0, 0, 0, 1, 1,
0.6409898, -0.1204274, 0.7158722, 0, 0, 0, 1, 1,
0.6431507, 0.4526476, 2.127811, 0, 0, 0, 1, 1,
0.6435314, -1.198073, 1.640409, 1, 1, 1, 1, 1,
0.643698, 0.3252078, 1.010677, 1, 1, 1, 1, 1,
0.6480016, -1.888436, 4.472472, 1, 1, 1, 1, 1,
0.6499066, 1.191789, -0.6496785, 1, 1, 1, 1, 1,
0.6574102, 0.7770117, 1.241211, 1, 1, 1, 1, 1,
0.664152, -1.887169, 3.213444, 1, 1, 1, 1, 1,
0.6644658, -0.4288194, 1.82136, 1, 1, 1, 1, 1,
0.6703582, 0.6769433, 0.4692754, 1, 1, 1, 1, 1,
0.6775256, -1.164126, 2.82573, 1, 1, 1, 1, 1,
0.682686, -1.496435, 0.9830177, 1, 1, 1, 1, 1,
0.6852214, -0.4731846, 1.917863, 1, 1, 1, 1, 1,
0.6853286, 0.4855194, 1.610357, 1, 1, 1, 1, 1,
0.6854681, -0.7419512, 4.265712, 1, 1, 1, 1, 1,
0.6860546, 0.5614573, 1.80396, 1, 1, 1, 1, 1,
0.6893097, 0.8209305, 0.01498582, 1, 1, 1, 1, 1,
0.6904455, 0.3171133, 1.223081, 0, 0, 1, 1, 1,
0.6971299, 0.7369042, 0.8388904, 1, 0, 0, 1, 1,
0.6986853, -0.4916199, 2.599685, 1, 0, 0, 1, 1,
0.6992198, -0.2331206, 1.23152, 1, 0, 0, 1, 1,
0.7011725, 0.1777002, -0.1360309, 1, 0, 0, 1, 1,
0.7059041, -1.341625, 2.127616, 1, 0, 0, 1, 1,
0.7065316, 1.598926, 1.597321, 0, 0, 0, 1, 1,
0.7100465, -0.02354854, 1.714456, 0, 0, 0, 1, 1,
0.7137896, -2.315411, 0.4511615, 0, 0, 0, 1, 1,
0.7154149, 2.227614, 1.859957, 0, 0, 0, 1, 1,
0.7292174, 1.771224, 0.895062, 0, 0, 0, 1, 1,
0.7340606, -1.225359, 1.712184, 0, 0, 0, 1, 1,
0.734224, -1.822509, 1.870059, 0, 0, 0, 1, 1,
0.7342389, 0.4361371, 0.209598, 1, 1, 1, 1, 1,
0.7394992, -0.3696019, 2.093913, 1, 1, 1, 1, 1,
0.7459204, 1.814927, 0.2860531, 1, 1, 1, 1, 1,
0.7466382, 0.06424412, 0.719725, 1, 1, 1, 1, 1,
0.7499954, -1.114276, 3.506126, 1, 1, 1, 1, 1,
0.7527205, -0.3521648, 0.8145891, 1, 1, 1, 1, 1,
0.7534626, -2.036517, 1.637912, 1, 1, 1, 1, 1,
0.7551395, 1.307126, 0.1135689, 1, 1, 1, 1, 1,
0.7552751, -2.571926, 2.191641, 1, 1, 1, 1, 1,
0.7583317, -0.4223382, 4.074562, 1, 1, 1, 1, 1,
0.7611617, -1.220138, 2.507674, 1, 1, 1, 1, 1,
0.7636837, -0.8384116, 2.229271, 1, 1, 1, 1, 1,
0.7644937, 0.2905758, 1.892816, 1, 1, 1, 1, 1,
0.7654351, 0.7522901, 1.8031, 1, 1, 1, 1, 1,
0.7664566, -0.7196153, 1.882023, 1, 1, 1, 1, 1,
0.7779796, -1.06861, 2.418864, 0, 0, 1, 1, 1,
0.7802557, 0.650035, 0.9650687, 1, 0, 0, 1, 1,
0.7804177, -1.980398, 2.366729, 1, 0, 0, 1, 1,
0.7823308, 0.5176986, 1.431818, 1, 0, 0, 1, 1,
0.7839894, 1.063692, -0.5505179, 1, 0, 0, 1, 1,
0.7857403, 0.3052694, 2.617411, 1, 0, 0, 1, 1,
0.7877656, 0.02374005, 1.220447, 0, 0, 0, 1, 1,
0.7901316, -1.389413, 2.268755, 0, 0, 0, 1, 1,
0.7910239, 0.3580197, 0.2543128, 0, 0, 0, 1, 1,
0.7961965, -0.4150321, 1.293412, 0, 0, 0, 1, 1,
0.8007277, 1.343858, 1.834872, 0, 0, 0, 1, 1,
0.8058224, -1.669857, 3.841149, 0, 0, 0, 1, 1,
0.8064324, 1.59219, 0.4669327, 0, 0, 0, 1, 1,
0.8066691, 0.4779169, 1.596499, 1, 1, 1, 1, 1,
0.8144319, 0.1271837, 2.459294, 1, 1, 1, 1, 1,
0.8211155, 1.414429, 1.253991, 1, 1, 1, 1, 1,
0.8224009, 0.04897067, 0.4134723, 1, 1, 1, 1, 1,
0.8300058, 0.5407818, 1.678905, 1, 1, 1, 1, 1,
0.8312937, 0.2712818, 0.6814216, 1, 1, 1, 1, 1,
0.8376603, -0.9632578, 0.4988927, 1, 1, 1, 1, 1,
0.8459147, 1.105299, 0.1986067, 1, 1, 1, 1, 1,
0.8481718, 1.42695, 0.1867847, 1, 1, 1, 1, 1,
0.8492064, 1.338405, 1.631539, 1, 1, 1, 1, 1,
0.8521301, -0.4008603, 2.381444, 1, 1, 1, 1, 1,
0.855233, -0.1528889, 2.833657, 1, 1, 1, 1, 1,
0.860581, -1.00651, 1.956125, 1, 1, 1, 1, 1,
0.8618703, 1.948428, -0.428321, 1, 1, 1, 1, 1,
0.863075, -0.0259584, 0.3942678, 1, 1, 1, 1, 1,
0.8631035, 0.4054766, 1.331488, 0, 0, 1, 1, 1,
0.8651391, 0.5936235, 2.351809, 1, 0, 0, 1, 1,
0.8658854, -0.01806824, 1.247847, 1, 0, 0, 1, 1,
0.8734958, 1.128048, -0.48953, 1, 0, 0, 1, 1,
0.8753417, 0.3512558, 0.6892923, 1, 0, 0, 1, 1,
0.8768985, -0.268163, 0.7411634, 1, 0, 0, 1, 1,
0.8776377, -1.334423, 2.332304, 0, 0, 0, 1, 1,
0.8795801, 0.0843601, 1.537903, 0, 0, 0, 1, 1,
0.8800533, 0.4745513, 0.9945594, 0, 0, 0, 1, 1,
0.8801017, -0.2213006, 0.6310565, 0, 0, 0, 1, 1,
0.8836511, -0.8668778, 2.594646, 0, 0, 0, 1, 1,
0.8880203, 0.6039761, -0.9541653, 0, 0, 0, 1, 1,
0.8928444, -0.6540811, 1.184987, 0, 0, 0, 1, 1,
0.895903, 1.088147, 2.304333, 1, 1, 1, 1, 1,
0.900757, 1.746812, 0.4823375, 1, 1, 1, 1, 1,
0.9012536, 0.4141455, 1.619079, 1, 1, 1, 1, 1,
0.9041281, 0.3259651, -0.244838, 1, 1, 1, 1, 1,
0.9058939, -0.1585814, 0.8350239, 1, 1, 1, 1, 1,
0.9083636, 0.8441869, 0.9121823, 1, 1, 1, 1, 1,
0.9094495, -0.1119836, 2.494039, 1, 1, 1, 1, 1,
0.9101707, 0.4595476, 1.659648, 1, 1, 1, 1, 1,
0.9120659, 0.5946767, -0.1473947, 1, 1, 1, 1, 1,
0.9200178, -0.7823943, 1.738479, 1, 1, 1, 1, 1,
0.9204415, -0.8726304, 2.159093, 1, 1, 1, 1, 1,
0.9213674, -1.247558, 3.373059, 1, 1, 1, 1, 1,
0.9260708, -0.2763667, 1.154392, 1, 1, 1, 1, 1,
0.9332968, -0.4727252, 1.427124, 1, 1, 1, 1, 1,
0.938274, -0.3513179, 2.596164, 1, 1, 1, 1, 1,
0.9449595, -0.5258664, 2.577828, 0, 0, 1, 1, 1,
0.9516589, -0.5215783, 2.952426, 1, 0, 0, 1, 1,
0.9528994, -0.8152811, 1.385904, 1, 0, 0, 1, 1,
0.9529238, -0.1604877, 2.887366, 1, 0, 0, 1, 1,
0.9532327, -1.053053, 4.021454, 1, 0, 0, 1, 1,
0.9638395, -1.693931, 3.151559, 1, 0, 0, 1, 1,
0.9646092, 1.667052, -0.006860273, 0, 0, 0, 1, 1,
0.9659376, -1.077525, 2.114438, 0, 0, 0, 1, 1,
0.9667937, -2.196838, 2.3085, 0, 0, 0, 1, 1,
0.9680169, -0.9421141, 2.291721, 0, 0, 0, 1, 1,
0.970729, -0.7436375, 3.413508, 0, 0, 0, 1, 1,
0.9816439, 0.6739293, 1.391616, 0, 0, 0, 1, 1,
0.9857391, 1.396725, 1.191773, 0, 0, 0, 1, 1,
0.9877806, -0.41684, 2.708098, 1, 1, 1, 1, 1,
0.9905903, -2.019657, 3.376257, 1, 1, 1, 1, 1,
0.991664, 0.5058306, 0.6839807, 1, 1, 1, 1, 1,
0.9945956, 0.5367984, 1.120539, 1, 1, 1, 1, 1,
0.9958649, 0.766493, 2.040792, 1, 1, 1, 1, 1,
1.000292, -0.1658762, 3.029985, 1, 1, 1, 1, 1,
1.006194, 0.284842, 0.746249, 1, 1, 1, 1, 1,
1.010869, 0.6202781, 0.06933276, 1, 1, 1, 1, 1,
1.012461, 0.8970246, 2.487997, 1, 1, 1, 1, 1,
1.014486, -1.53601, 1.424266, 1, 1, 1, 1, 1,
1.019816, 0.2037823, 2.4179, 1, 1, 1, 1, 1,
1.036005, -1.039307, 2.99721, 1, 1, 1, 1, 1,
1.036947, 1.353218, 2.5951, 1, 1, 1, 1, 1,
1.037216, -0.1826002, 1.049563, 1, 1, 1, 1, 1,
1.038515, -1.084427, 0.6027585, 1, 1, 1, 1, 1,
1.038754, -1.285493, 2.711773, 0, 0, 1, 1, 1,
1.040795, -0.4761565, 0.8220875, 1, 0, 0, 1, 1,
1.046076, 0.3383863, 2.377113, 1, 0, 0, 1, 1,
1.05957, -0.4513702, 1.827717, 1, 0, 0, 1, 1,
1.066875, -1.995565, 0.7440501, 1, 0, 0, 1, 1,
1.067456, 0.2103549, 1.809129, 1, 0, 0, 1, 1,
1.069739, -0.5642628, 2.275329, 0, 0, 0, 1, 1,
1.070766, -0.2232303, 3.353594, 0, 0, 0, 1, 1,
1.073055, 0.4880258, 2.397591, 0, 0, 0, 1, 1,
1.075716, 0.3465229, -0.2360958, 0, 0, 0, 1, 1,
1.07983, 0.2605004, 0.7051207, 0, 0, 0, 1, 1,
1.080355, -0.01566751, 0.2940747, 0, 0, 0, 1, 1,
1.086994, 1.505137, 0.6014561, 0, 0, 0, 1, 1,
1.099299, 0.8399121, 1.580601, 1, 1, 1, 1, 1,
1.109758, -0.5313522, 2.264327, 1, 1, 1, 1, 1,
1.112443, -0.5545961, 2.935921, 1, 1, 1, 1, 1,
1.117482, -0.1859972, 3.379552, 1, 1, 1, 1, 1,
1.117871, 1.269217, 1.270293, 1, 1, 1, 1, 1,
1.122762, -0.4501749, 1.845603, 1, 1, 1, 1, 1,
1.130053, 0.7584559, 1.077731, 1, 1, 1, 1, 1,
1.132202, -0.2045425, 2.945189, 1, 1, 1, 1, 1,
1.136868, -1.474148, 3.02096, 1, 1, 1, 1, 1,
1.137806, -0.5527457, 1.313417, 1, 1, 1, 1, 1,
1.137955, -0.5158845, 2.641535, 1, 1, 1, 1, 1,
1.14513, -0.2397221, 3.575724, 1, 1, 1, 1, 1,
1.145907, -2.124141, 3.955283, 1, 1, 1, 1, 1,
1.156644, 1.161834, 2.28723, 1, 1, 1, 1, 1,
1.160817, -0.9972836, 2.780606, 1, 1, 1, 1, 1,
1.161063, -0.468854, 3.063667, 0, 0, 1, 1, 1,
1.173348, 1.1419, 0.9552438, 1, 0, 0, 1, 1,
1.173642, -0.3049972, 2.313317, 1, 0, 0, 1, 1,
1.176711, 0.5784296, 1.222736, 1, 0, 0, 1, 1,
1.179094, -0.06901984, 0.04397431, 1, 0, 0, 1, 1,
1.183137, -1.077678, 1.781045, 1, 0, 0, 1, 1,
1.187591, -1.040267, 3.151171, 0, 0, 0, 1, 1,
1.190004, -1.537447, 1.308185, 0, 0, 0, 1, 1,
1.191237, -1.368031, 0.6100365, 0, 0, 0, 1, 1,
1.195622, 0.5833184, 1.613385, 0, 0, 0, 1, 1,
1.201006, -0.4256911, 2.755126, 0, 0, 0, 1, 1,
1.20554, -0.5935081, 1.305613, 0, 0, 0, 1, 1,
1.21647, -0.02427069, -0.2469635, 0, 0, 0, 1, 1,
1.222289, -2.110542, 1.927282, 1, 1, 1, 1, 1,
1.227568, 0.7755859, 0.06815655, 1, 1, 1, 1, 1,
1.229374, 0.2938798, 1.542266, 1, 1, 1, 1, 1,
1.234318, -0.01411448, 2.239112, 1, 1, 1, 1, 1,
1.234359, -1.318588, 0.4457042, 1, 1, 1, 1, 1,
1.234851, 0.6575372, 2.012836, 1, 1, 1, 1, 1,
1.235955, 0.7581681, -0.5859709, 1, 1, 1, 1, 1,
1.236378, 0.7056947, 1.46662, 1, 1, 1, 1, 1,
1.242568, 0.6257052, 2.624178, 1, 1, 1, 1, 1,
1.256595, -1.273074, 2.546416, 1, 1, 1, 1, 1,
1.257879, 0.6383794, 1.970394, 1, 1, 1, 1, 1,
1.259225, -0.5499434, 2.792112, 1, 1, 1, 1, 1,
1.261255, -1.751847, 3.712897, 1, 1, 1, 1, 1,
1.26357, 0.2924248, 0.4251248, 1, 1, 1, 1, 1,
1.26753, -1.645362, 3.251381, 1, 1, 1, 1, 1,
1.273708, -0.9783214, 2.588641, 0, 0, 1, 1, 1,
1.277543, 0.05050366, 3.495646, 1, 0, 0, 1, 1,
1.280309, -0.8490984, 3.815915, 1, 0, 0, 1, 1,
1.282674, 0.564025, 0.2342734, 1, 0, 0, 1, 1,
1.28308, 0.1617509, 0.7996941, 1, 0, 0, 1, 1,
1.289234, 1.07899, 1.344939, 1, 0, 0, 1, 1,
1.296128, -1.170585, 1.853534, 0, 0, 0, 1, 1,
1.299968, 1.513767, 1.02668, 0, 0, 0, 1, 1,
1.301701, -0.2698612, 1.440873, 0, 0, 0, 1, 1,
1.304014, -1.838409, 2.786999, 0, 0, 0, 1, 1,
1.305714, -0.3170912, 1.548401, 0, 0, 0, 1, 1,
1.325172, 0.5560994, 1.969624, 0, 0, 0, 1, 1,
1.329132, -1.254546, 1.274343, 0, 0, 0, 1, 1,
1.338938, -0.567685, 1.381417, 1, 1, 1, 1, 1,
1.340748, -0.5666147, 1.030875, 1, 1, 1, 1, 1,
1.342005, 0.6055332, 0.9798772, 1, 1, 1, 1, 1,
1.344828, 1.654879, 1.320484, 1, 1, 1, 1, 1,
1.351193, -1.136072e-05, 2.68864, 1, 1, 1, 1, 1,
1.35851, 0.05395232, 1.836097, 1, 1, 1, 1, 1,
1.367472, 0.6576394, 0.9401817, 1, 1, 1, 1, 1,
1.376854, -0.9033957, 2.725183, 1, 1, 1, 1, 1,
1.397024, -0.2152901, 2.101224, 1, 1, 1, 1, 1,
1.400264, 0.6439455, -0.529555, 1, 1, 1, 1, 1,
1.407426, 0.3458168, 1.295942, 1, 1, 1, 1, 1,
1.421729, 1.118853, 0.8276576, 1, 1, 1, 1, 1,
1.443768, -1.056313, 2.427812, 1, 1, 1, 1, 1,
1.444199, -1.070313, 2.983986, 1, 1, 1, 1, 1,
1.452858, 0.6771114, 2.557813, 1, 1, 1, 1, 1,
1.463828, -0.2582935, 2.38982, 0, 0, 1, 1, 1,
1.468132, 0.5792276, 2.59248, 1, 0, 0, 1, 1,
1.475176, -0.04225953, -0.934572, 1, 0, 0, 1, 1,
1.480236, 0.4384443, 2.402725, 1, 0, 0, 1, 1,
1.481362, -0.8409419, 1.920994, 1, 0, 0, 1, 1,
1.48329, 1.849446, -0.4982289, 1, 0, 0, 1, 1,
1.488409, -1.164239, 3.159936, 0, 0, 0, 1, 1,
1.488778, -0.7731871, 1.216138, 0, 0, 0, 1, 1,
1.495291, 1.077569, 0.3562138, 0, 0, 0, 1, 1,
1.505625, 0.7462163, -0.7633888, 0, 0, 0, 1, 1,
1.511093, 1.478509, 0.1661714, 0, 0, 0, 1, 1,
1.520979, 0.1915059, 1.138977, 0, 0, 0, 1, 1,
1.523954, 1.27767, 1.769853, 0, 0, 0, 1, 1,
1.525217, 0.5933437, 4.491126, 1, 1, 1, 1, 1,
1.52651, -0.2139675, 1.572579, 1, 1, 1, 1, 1,
1.545, -1.564202, 2.111845, 1, 1, 1, 1, 1,
1.546947, 1.38201, 1.414777, 1, 1, 1, 1, 1,
1.547274, -0.8390594, 2.162514, 1, 1, 1, 1, 1,
1.558516, -0.6696765, 1.259756, 1, 1, 1, 1, 1,
1.565872, 1.37262, 1.654874, 1, 1, 1, 1, 1,
1.569095, 0.2934833, 1.102746, 1, 1, 1, 1, 1,
1.590082, -0.1054934, 3.437076, 1, 1, 1, 1, 1,
1.59663, 0.2709779, 3.219597, 1, 1, 1, 1, 1,
1.617683, 0.4940239, 1.790835, 1, 1, 1, 1, 1,
1.621583, -0.5182002, 1.949583, 1, 1, 1, 1, 1,
1.62667, 1.21123, 3.049092, 1, 1, 1, 1, 1,
1.632676, 0.3056838, 0.948103, 1, 1, 1, 1, 1,
1.656227, 1.915583, -1.097532, 1, 1, 1, 1, 1,
1.659828, -0.5829018, 1.432852, 0, 0, 1, 1, 1,
1.673666, 0.03139125, 1.246528, 1, 0, 0, 1, 1,
1.682599, 0.3788279, 2.083924, 1, 0, 0, 1, 1,
1.689963, -0.05099952, 1.350894, 1, 0, 0, 1, 1,
1.693795, -2.144994, 2.334349, 1, 0, 0, 1, 1,
1.715353, 2.568922, -0.04995489, 1, 0, 0, 1, 1,
1.732087, -0.2294761, 2.447669, 0, 0, 0, 1, 1,
1.736458, -1.358403, 2.806302, 0, 0, 0, 1, 1,
1.73657, -0.08675911, 0.6289801, 0, 0, 0, 1, 1,
1.742799, -1.829084, 1.368647, 0, 0, 0, 1, 1,
1.747573, 0.2547482, 0.1047041, 0, 0, 0, 1, 1,
1.756717, 0.9058748, -0.1975867, 0, 0, 0, 1, 1,
1.774678, 0.5465581, 1.239035, 0, 0, 0, 1, 1,
1.777847, -1.602975, 0.9414828, 1, 1, 1, 1, 1,
1.806419, 0.3121571, 1.263879, 1, 1, 1, 1, 1,
1.808834, -2.574097, 4.123013, 1, 1, 1, 1, 1,
1.846042, 1.131047, 0.08790686, 1, 1, 1, 1, 1,
1.852234, -1.243726, 3.556088, 1, 1, 1, 1, 1,
1.878028, -0.4176904, 2.523328, 1, 1, 1, 1, 1,
1.879274, 0.7103722, 1.762644, 1, 1, 1, 1, 1,
1.880489, 1.510491, 1.114621, 1, 1, 1, 1, 1,
1.904248, -0.7784981, 2.661256, 1, 1, 1, 1, 1,
1.909575, 1.424268, 0.6608058, 1, 1, 1, 1, 1,
1.970391, 1.67694, 0.3845338, 1, 1, 1, 1, 1,
2.011043, 0.8104233, 0.5860966, 1, 1, 1, 1, 1,
2.011855, -0.6570743, 2.658985, 1, 1, 1, 1, 1,
2.021562, -1.520093, 1.542892, 1, 1, 1, 1, 1,
2.060444, 0.5036287, 0.8584482, 1, 1, 1, 1, 1,
2.062522, 0.4126035, 2.091681, 0, 0, 1, 1, 1,
2.09357, 0.6009744, 3.420993, 1, 0, 0, 1, 1,
2.100339, -0.1680107, 1.636976, 1, 0, 0, 1, 1,
2.106029, -1.321598, 2.627068, 1, 0, 0, 1, 1,
2.126978, 0.4316637, 0.3781783, 1, 0, 0, 1, 1,
2.155209, -0.5217801, 1.476736, 1, 0, 0, 1, 1,
2.189258, 1.494232, -0.2354673, 0, 0, 0, 1, 1,
2.273098, -0.2400223, 1.593906, 0, 0, 0, 1, 1,
2.286067, 1.221336, 0.3287795, 0, 0, 0, 1, 1,
2.358812, -0.01869714, 1.815747, 0, 0, 0, 1, 1,
2.371301, 0.01436795, 1.885846, 0, 0, 0, 1, 1,
2.44282, 0.925003, 1.13641, 0, 0, 0, 1, 1,
2.479246, -0.1263513, 1.328908, 0, 0, 0, 1, 1,
2.539804, 0.05856187, 2.137844, 1, 1, 1, 1, 1,
2.545139, -0.3958104, 1.509615, 1, 1, 1, 1, 1,
2.574289, 0.854395, 1.5157, 1, 1, 1, 1, 1,
2.793561, -0.8149124, 2.365002, 1, 1, 1, 1, 1,
3.252962, 0.6692145, 1.733641, 1, 1, 1, 1, 1,
3.411127, 0.5098082, 2.560485, 1, 1, 1, 1, 1,
3.703982, -2.539762, 2.099701, 1, 1, 1, 1, 1
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
var radius = 10.29696;
var distance = 36.16764;
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
mvMatrix.translate( -0.03331637, -0.01502812, -0.008642435 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.16764);
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