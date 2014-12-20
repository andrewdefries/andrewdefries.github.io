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
-3.112082, 0.008360971, -0.7605471, 1, 0, 0, 1,
-3.004017, 1.213577, -0.9186357, 1, 0.007843138, 0, 1,
-2.979054, 0.01454606, 0.719436, 1, 0.01176471, 0, 1,
-2.811774, -0.5513934, -1.691096, 1, 0.01960784, 0, 1,
-2.760491, 0.02567768, 0.04960835, 1, 0.02352941, 0, 1,
-2.744516, 0.2189559, -1.179735, 1, 0.03137255, 0, 1,
-2.565726, -0.174912, -1.42857, 1, 0.03529412, 0, 1,
-2.526988, 0.7053893, -1.087082, 1, 0.04313726, 0, 1,
-2.464783, 0.4768567, -2.350019, 1, 0.04705882, 0, 1,
-2.443006, -0.3614088, 1.259804, 1, 0.05490196, 0, 1,
-2.420723, -1.298934, -4.062346, 1, 0.05882353, 0, 1,
-2.410554, -1.259344, -3.476413, 1, 0.06666667, 0, 1,
-2.295691, -0.9180473, -3.943705, 1, 0.07058824, 0, 1,
-2.258606, 0.1657372, -2.467502, 1, 0.07843138, 0, 1,
-2.152916, 0.6864815, -2.198927, 1, 0.08235294, 0, 1,
-2.120799, -1.834351, -0.7052901, 1, 0.09019608, 0, 1,
-2.08934, -0.4804733, -0.3781435, 1, 0.09411765, 0, 1,
-2.086138, -0.7755143, -2.819253, 1, 0.1019608, 0, 1,
-2.054639, -1.270463, -2.174783, 1, 0.1098039, 0, 1,
-2.023147, -1.365806, -1.445938, 1, 0.1137255, 0, 1,
-2.010342, -0.5529122, -2.151482, 1, 0.1215686, 0, 1,
-1.995467, 0.1478847, -2.236077, 1, 0.1254902, 0, 1,
-1.967394, -1.244796, -0.9809521, 1, 0.1333333, 0, 1,
-1.963662, 1.571796, -2.390218, 1, 0.1372549, 0, 1,
-1.961455, -0.1224915, -0.9829939, 1, 0.145098, 0, 1,
-1.916808, -1.156737, -1.16472, 1, 0.1490196, 0, 1,
-1.906918, -0.358725, -1.991865, 1, 0.1568628, 0, 1,
-1.906874, 0.06251158, -0.5482596, 1, 0.1607843, 0, 1,
-1.899273, 0.8133476, -2.97873, 1, 0.1686275, 0, 1,
-1.886708, 0.5701194, -2.699053, 1, 0.172549, 0, 1,
-1.880898, -0.6285, -1.579797, 1, 0.1803922, 0, 1,
-1.87834, 1.043646, -1.542036, 1, 0.1843137, 0, 1,
-1.875486, -0.7832238, -1.672048, 1, 0.1921569, 0, 1,
-1.867508, 1.095869, -1.081301, 1, 0.1960784, 0, 1,
-1.866984, 0.5777618, -0.2550474, 1, 0.2039216, 0, 1,
-1.859185, 0.6971887, -2.096026, 1, 0.2117647, 0, 1,
-1.847123, 0.4070848, -1.052569, 1, 0.2156863, 0, 1,
-1.840073, -0.4969578, -1.247837, 1, 0.2235294, 0, 1,
-1.835985, -0.7769022, -2.944381, 1, 0.227451, 0, 1,
-1.814197, -0.01729728, -2.850286, 1, 0.2352941, 0, 1,
-1.807244, -0.7557176, -1.20393, 1, 0.2392157, 0, 1,
-1.796472, -2.357697, -0.1050581, 1, 0.2470588, 0, 1,
-1.791464, -0.2659924, -0.6792545, 1, 0.2509804, 0, 1,
-1.787098, -1.131715, -2.019608, 1, 0.2588235, 0, 1,
-1.775779, -1.333005, -1.949048, 1, 0.2627451, 0, 1,
-1.747202, 0.2507994, -2.175151, 1, 0.2705882, 0, 1,
-1.726422, 0.4189852, -1.547181, 1, 0.2745098, 0, 1,
-1.722419, 0.5288786, -2.095997, 1, 0.282353, 0, 1,
-1.695303, -1.147579, -2.405059, 1, 0.2862745, 0, 1,
-1.693942, -0.3114955, -2.566639, 1, 0.2941177, 0, 1,
-1.691206, 2.944104, -1.554244, 1, 0.3019608, 0, 1,
-1.675739, -1.603834, -2.507682, 1, 0.3058824, 0, 1,
-1.670431, 0.5474551, -1.417967, 1, 0.3137255, 0, 1,
-1.670336, -0.2523081, -1.622455, 1, 0.3176471, 0, 1,
-1.664132, 0.2606365, 0.2328467, 1, 0.3254902, 0, 1,
-1.663328, 0.3204667, -4.173378, 1, 0.3294118, 0, 1,
-1.660407, 1.481449, -0.4071603, 1, 0.3372549, 0, 1,
-1.654308, 0.7380888, -1.555816, 1, 0.3411765, 0, 1,
-1.648617, 1.093214, -0.8561216, 1, 0.3490196, 0, 1,
-1.643608, 0.6520944, -0.6218218, 1, 0.3529412, 0, 1,
-1.636433, 2.007851, 0.2042619, 1, 0.3607843, 0, 1,
-1.61767, -0.6862631, -3.007152, 1, 0.3647059, 0, 1,
-1.616752, 0.6283128, -0.4846623, 1, 0.372549, 0, 1,
-1.611288, 0.03521794, -3.373219, 1, 0.3764706, 0, 1,
-1.60909, 1.623521, 0.5788885, 1, 0.3843137, 0, 1,
-1.59982, -0.9039417, -2.927521, 1, 0.3882353, 0, 1,
-1.59969, -0.01038519, -1.069697, 1, 0.3960784, 0, 1,
-1.594198, -0.09552915, -0.4932075, 1, 0.4039216, 0, 1,
-1.584711, -0.7703453, -2.92879, 1, 0.4078431, 0, 1,
-1.575602, -0.6780127, -2.190719, 1, 0.4156863, 0, 1,
-1.574432, 1.990498, -1.706685, 1, 0.4196078, 0, 1,
-1.560796, -0.7763058, -2.893112, 1, 0.427451, 0, 1,
-1.55455, -0.1786944, -2.76712, 1, 0.4313726, 0, 1,
-1.548479, 0.5162349, -0.4800157, 1, 0.4392157, 0, 1,
-1.543865, 0.2994133, -0.4464083, 1, 0.4431373, 0, 1,
-1.538132, 0.7545088, -0.9694016, 1, 0.4509804, 0, 1,
-1.536942, -0.9520342, -2.667272, 1, 0.454902, 0, 1,
-1.533803, 2.351336, -0.8929591, 1, 0.4627451, 0, 1,
-1.532369, 0.4695246, -1.613177, 1, 0.4666667, 0, 1,
-1.530674, -0.001572471, -2.109031, 1, 0.4745098, 0, 1,
-1.52636, 0.3230453, -2.988501, 1, 0.4784314, 0, 1,
-1.492362, 0.9619359, -0.4286434, 1, 0.4862745, 0, 1,
-1.490772, 0.01337558, -2.085832, 1, 0.4901961, 0, 1,
-1.484375, -0.2998313, -1.90715, 1, 0.4980392, 0, 1,
-1.483927, 0.8650415, -1.68036, 1, 0.5058824, 0, 1,
-1.477496, -0.2554587, -0.6034621, 1, 0.509804, 0, 1,
-1.467188, 1.521136, 0.6482388, 1, 0.5176471, 0, 1,
-1.465145, -0.5258728, -1.962017, 1, 0.5215687, 0, 1,
-1.461654, -0.2115831, -0.8141832, 1, 0.5294118, 0, 1,
-1.458834, 1.203221, -1.049622, 1, 0.5333334, 0, 1,
-1.45558, -0.3736098, -2.794931, 1, 0.5411765, 0, 1,
-1.452953, -0.3627276, -2.258923, 1, 0.5450981, 0, 1,
-1.445235, -0.4717055, -3.263696, 1, 0.5529412, 0, 1,
-1.438739, -1.156344, -2.158445, 1, 0.5568628, 0, 1,
-1.435015, -0.1922876, -1.770046, 1, 0.5647059, 0, 1,
-1.430901, -1.109545, -3.182041, 1, 0.5686275, 0, 1,
-1.423558, 1.174876, -0.5192889, 1, 0.5764706, 0, 1,
-1.412476, 0.7717869, -2.220964, 1, 0.5803922, 0, 1,
-1.409534, 1.164306, -0.8366392, 1, 0.5882353, 0, 1,
-1.408163, 1.920258, -1.098952, 1, 0.5921569, 0, 1,
-1.406018, -1.836326, -1.394173, 1, 0.6, 0, 1,
-1.404613, 1.107734, 0.196713, 1, 0.6078432, 0, 1,
-1.39942, 0.5400857, -1.883459, 1, 0.6117647, 0, 1,
-1.389525, 1.175773, -3.312985, 1, 0.6196079, 0, 1,
-1.379095, -0.3757966, -0.4879507, 1, 0.6235294, 0, 1,
-1.370077, -0.7902162, -0.05486211, 1, 0.6313726, 0, 1,
-1.365914, -0.5792125, -1.844798, 1, 0.6352941, 0, 1,
-1.363521, -0.3026714, -2.35096, 1, 0.6431373, 0, 1,
-1.352461, -1.05871, -2.476783, 1, 0.6470588, 0, 1,
-1.348433, -1.013896, -3.427987, 1, 0.654902, 0, 1,
-1.348192, 1.118228, -0.8362673, 1, 0.6588235, 0, 1,
-1.34358, -1.399301, -1.986068, 1, 0.6666667, 0, 1,
-1.340821, 0.05290175, 0.0722862, 1, 0.6705883, 0, 1,
-1.336873, -0.628847, -2.656013, 1, 0.6784314, 0, 1,
-1.327233, -0.1588252, -1.711913, 1, 0.682353, 0, 1,
-1.319279, 1.849088, -0.8798224, 1, 0.6901961, 0, 1,
-1.312383, 1.014278, -2.036418, 1, 0.6941177, 0, 1,
-1.310532, -1.3965, -3.229901, 1, 0.7019608, 0, 1,
-1.288306, 0.1570168, -2.249455, 1, 0.7098039, 0, 1,
-1.28092, -0.6011686, -2.533592, 1, 0.7137255, 0, 1,
-1.280063, 1.774939, -2.277922, 1, 0.7215686, 0, 1,
-1.279693, -0.06326174, -2.099952, 1, 0.7254902, 0, 1,
-1.274625, -0.4893634, -1.020866, 1, 0.7333333, 0, 1,
-1.273209, 0.5506654, -0.9022343, 1, 0.7372549, 0, 1,
-1.269182, -1.190086, -0.9156448, 1, 0.7450981, 0, 1,
-1.265168, 2.639456, 0.8866696, 1, 0.7490196, 0, 1,
-1.263832, -0.5205277, -3.487, 1, 0.7568628, 0, 1,
-1.260094, -2.089543, -3.624351, 1, 0.7607843, 0, 1,
-1.257026, 1.260534, -2.598777, 1, 0.7686275, 0, 1,
-1.251647, -0.2423543, -3.401582, 1, 0.772549, 0, 1,
-1.249908, 0.3483484, -1.328907, 1, 0.7803922, 0, 1,
-1.246949, 1.630071, -0.3027425, 1, 0.7843137, 0, 1,
-1.232274, -1.332326, -1.397713, 1, 0.7921569, 0, 1,
-1.224589, 0.4767135, 0.6157486, 1, 0.7960784, 0, 1,
-1.221432, -1.385919, -3.251678, 1, 0.8039216, 0, 1,
-1.214716, 1.783585, 0.04598254, 1, 0.8117647, 0, 1,
-1.203117, 0.1892918, -1.289741, 1, 0.8156863, 0, 1,
-1.200268, -1.625654, -3.616859, 1, 0.8235294, 0, 1,
-1.18903, 0.1372335, -0.535148, 1, 0.827451, 0, 1,
-1.174056, 0.67929, -2.064416, 1, 0.8352941, 0, 1,
-1.171762, -1.045743, -1.551551, 1, 0.8392157, 0, 1,
-1.166981, -1.090834, -0.7088944, 1, 0.8470588, 0, 1,
-1.165363, -0.8186761, -2.378327, 1, 0.8509804, 0, 1,
-1.157473, -0.263767, -2.438214, 1, 0.8588235, 0, 1,
-1.154033, 0.7523541, 0.2240633, 1, 0.8627451, 0, 1,
-1.147384, 1.409308, -0.797142, 1, 0.8705882, 0, 1,
-1.145013, 0.3041456, -1.095536, 1, 0.8745098, 0, 1,
-1.133445, 0.3373855, -0.7508151, 1, 0.8823529, 0, 1,
-1.133327, -1.087823, -1.943836, 1, 0.8862745, 0, 1,
-1.131038, 0.1879954, -2.396017, 1, 0.8941177, 0, 1,
-1.129261, 0.272554, -0.66001, 1, 0.8980392, 0, 1,
-1.127263, -0.2967257, -2.504248, 1, 0.9058824, 0, 1,
-1.120748, 0.5475233, -1.121994, 1, 0.9137255, 0, 1,
-1.118818, -0.51978, -0.90632, 1, 0.9176471, 0, 1,
-1.08763, -1.27219, -4.810346, 1, 0.9254902, 0, 1,
-1.085617, -0.5799249, -2.325895, 1, 0.9294118, 0, 1,
-1.07577, 0.4906065, -1.900822, 1, 0.9372549, 0, 1,
-1.075148, 1.442021, -0.2441079, 1, 0.9411765, 0, 1,
-1.069497, 1.170596, 0.9857469, 1, 0.9490196, 0, 1,
-1.068948, 0.4420421, 0.1040769, 1, 0.9529412, 0, 1,
-1.065835, -0.1546516, -1.902412, 1, 0.9607843, 0, 1,
-1.059109, -0.66482, -0.9001386, 1, 0.9647059, 0, 1,
-1.050436, 0.1696295, -2.151824, 1, 0.972549, 0, 1,
-1.049834, 0.7006505, 0.148067, 1, 0.9764706, 0, 1,
-1.04422, -0.3651671, -1.943369, 1, 0.9843137, 0, 1,
-1.040765, 0.03635304, -1.741529, 1, 0.9882353, 0, 1,
-1.030453, 1.378916, -0.912728, 1, 0.9960784, 0, 1,
-1.027124, -1.320545, -2.560858, 0.9960784, 1, 0, 1,
-1.010758, -0.9296607, -3.063118, 0.9921569, 1, 0, 1,
-1.009848, -0.140146, -1.334649, 0.9843137, 1, 0, 1,
-1.006887, 0.494163, -0.07226193, 0.9803922, 1, 0, 1,
-0.9995824, 1.837938, 0.3074212, 0.972549, 1, 0, 1,
-0.9951205, 0.313104, -1.862367, 0.9686275, 1, 0, 1,
-0.995053, 0.3666708, -1.534002, 0.9607843, 1, 0, 1,
-0.9862446, 0.6705554, -0.1865749, 0.9568627, 1, 0, 1,
-0.9848162, 0.5715802, -1.694681, 0.9490196, 1, 0, 1,
-0.9807269, 2.321156, -0.8807629, 0.945098, 1, 0, 1,
-0.9757019, 1.323111, -0.5201185, 0.9372549, 1, 0, 1,
-0.9656655, 0.04695067, -1.201161, 0.9333333, 1, 0, 1,
-0.9656137, -0.06455445, 0.6834727, 0.9254902, 1, 0, 1,
-0.9652859, -0.09475025, -1.273259, 0.9215686, 1, 0, 1,
-0.9641803, 1.035773, -0.7510876, 0.9137255, 1, 0, 1,
-0.9518011, -1.042397, -3.125808, 0.9098039, 1, 0, 1,
-0.9464445, -1.158377, -3.462845, 0.9019608, 1, 0, 1,
-0.9415144, 0.06591068, -1.860653, 0.8941177, 1, 0, 1,
-0.9410288, -0.3253527, -1.685699, 0.8901961, 1, 0, 1,
-0.9388704, -1.047238, -1.550125, 0.8823529, 1, 0, 1,
-0.9369966, -0.9341326, -1.512253, 0.8784314, 1, 0, 1,
-0.9322374, 0.01802079, -2.025303, 0.8705882, 1, 0, 1,
-0.9312338, -0.7951567, -2.356142, 0.8666667, 1, 0, 1,
-0.9294547, 1.410209, 0.232284, 0.8588235, 1, 0, 1,
-0.9254146, -0.1226799, -1.327361, 0.854902, 1, 0, 1,
-0.9223452, 0.337723, -1.566221, 0.8470588, 1, 0, 1,
-0.915856, 1.097222, -0.643166, 0.8431373, 1, 0, 1,
-0.9059275, -0.1110076, -1.349147, 0.8352941, 1, 0, 1,
-0.8996705, 2.388766, -0.8645381, 0.8313726, 1, 0, 1,
-0.8960871, 0.5672703, 1.017412, 0.8235294, 1, 0, 1,
-0.8960332, -0.7516292, -4.232442, 0.8196079, 1, 0, 1,
-0.8905699, -0.6078298, -2.418079, 0.8117647, 1, 0, 1,
-0.8891839, 0.20669, 0.6869637, 0.8078431, 1, 0, 1,
-0.8875948, -0.8072863, -2.695258, 0.8, 1, 0, 1,
-0.8815205, 1.566243, 0.5654396, 0.7921569, 1, 0, 1,
-0.8741581, 0.1614971, -0.3755006, 0.7882353, 1, 0, 1,
-0.8740759, 1.755069, -2.049041, 0.7803922, 1, 0, 1,
-0.8713981, 0.00191203, -1.079414, 0.7764706, 1, 0, 1,
-0.8630521, -0.7850506, -1.944307, 0.7686275, 1, 0, 1,
-0.8618674, -0.7382343, -3.352477, 0.7647059, 1, 0, 1,
-0.8612471, -1.852529, -3.841798, 0.7568628, 1, 0, 1,
-0.861041, -0.7631878, -1.354944, 0.7529412, 1, 0, 1,
-0.8586314, -0.3446358, -0.4956696, 0.7450981, 1, 0, 1,
-0.8584062, -0.1356247, 0.2889966, 0.7411765, 1, 0, 1,
-0.8539031, -0.4458857, -0.7834817, 0.7333333, 1, 0, 1,
-0.8485213, 0.185482, -2.704782, 0.7294118, 1, 0, 1,
-0.8453308, -1.253161, -2.374402, 0.7215686, 1, 0, 1,
-0.8430371, 0.03885067, -2.965212, 0.7176471, 1, 0, 1,
-0.842921, -0.6122648, -0.7332198, 0.7098039, 1, 0, 1,
-0.8429095, -1.981667, -3.37388, 0.7058824, 1, 0, 1,
-0.8410128, 0.5566559, -1.669531, 0.6980392, 1, 0, 1,
-0.8404004, -0.1879863, -1.876154, 0.6901961, 1, 0, 1,
-0.8357338, -2.394877, -3.922731, 0.6862745, 1, 0, 1,
-0.8343447, 0.6255494, -0.598538, 0.6784314, 1, 0, 1,
-0.8250295, -0.9630369, -2.782857, 0.6745098, 1, 0, 1,
-0.8166706, -0.3024979, -3.322717, 0.6666667, 1, 0, 1,
-0.8109995, 2.751024, 0.407239, 0.6627451, 1, 0, 1,
-0.8093672, 1.179678, -2.748593, 0.654902, 1, 0, 1,
-0.8088889, 0.840841, -1.691443, 0.6509804, 1, 0, 1,
-0.8041415, -1.013212, -1.556953, 0.6431373, 1, 0, 1,
-0.7913938, 0.7259611, -1.744337, 0.6392157, 1, 0, 1,
-0.7907302, 1.414726, -2.469196, 0.6313726, 1, 0, 1,
-0.7901546, 1.088516, -0.933813, 0.627451, 1, 0, 1,
-0.7873723, -0.736757, -2.576232, 0.6196079, 1, 0, 1,
-0.7850555, -0.919915, -1.766169, 0.6156863, 1, 0, 1,
-0.7755862, 0.8764322, 0.1860272, 0.6078432, 1, 0, 1,
-0.7743927, 0.5543955, -1.579368, 0.6039216, 1, 0, 1,
-0.7738658, -0.7107142, -0.7560524, 0.5960785, 1, 0, 1,
-0.7732335, 0.1799659, -2.078336, 0.5882353, 1, 0, 1,
-0.7719371, -1.111373, -2.342839, 0.5843138, 1, 0, 1,
-0.767785, 0.8240668, -1.555525, 0.5764706, 1, 0, 1,
-0.7635021, 0.6997938, -1.486527, 0.572549, 1, 0, 1,
-0.7621213, 0.5624536, -1.674704, 0.5647059, 1, 0, 1,
-0.7617118, 0.9923864, -0.4433894, 0.5607843, 1, 0, 1,
-0.7595012, -0.3179128, -1.048102, 0.5529412, 1, 0, 1,
-0.7554503, -0.6301875, -2.750027, 0.5490196, 1, 0, 1,
-0.7536468, 0.3627067, -2.528917, 0.5411765, 1, 0, 1,
-0.7527466, 0.4673165, -1.521011, 0.5372549, 1, 0, 1,
-0.7524791, 0.1677762, -0.6249843, 0.5294118, 1, 0, 1,
-0.7476797, -1.425101, -0.5597495, 0.5254902, 1, 0, 1,
-0.7472717, -0.895654, -1.326083, 0.5176471, 1, 0, 1,
-0.7422289, 0.8581167, -0.0603896, 0.5137255, 1, 0, 1,
-0.741134, -1.159602, -2.352865, 0.5058824, 1, 0, 1,
-0.7410542, 0.3387906, -0.1798169, 0.5019608, 1, 0, 1,
-0.7314833, 0.8562469, -0.2575944, 0.4941176, 1, 0, 1,
-0.72446, 0.5359775, -0.7774106, 0.4862745, 1, 0, 1,
-0.7223345, 0.1049211, 0.5279516, 0.4823529, 1, 0, 1,
-0.7215049, 0.4920155, -0.4245236, 0.4745098, 1, 0, 1,
-0.720962, -0.6130546, -0.9955178, 0.4705882, 1, 0, 1,
-0.7171841, 0.08143325, -1.383592, 0.4627451, 1, 0, 1,
-0.7162657, 1.541841, 0.3749315, 0.4588235, 1, 0, 1,
-0.7153084, -0.5602459, -1.022994, 0.4509804, 1, 0, 1,
-0.7143465, -0.5828686, -3.764973, 0.4470588, 1, 0, 1,
-0.7143292, 0.4101645, -0.552115, 0.4392157, 1, 0, 1,
-0.7118356, 2.716534, -1.142285, 0.4352941, 1, 0, 1,
-0.7092885, -0.05806428, -0.6755967, 0.427451, 1, 0, 1,
-0.7060474, 1.641937, 0.5281554, 0.4235294, 1, 0, 1,
-0.7053065, 0.420324, -2.069246, 0.4156863, 1, 0, 1,
-0.7015165, 0.1166475, -0.9570344, 0.4117647, 1, 0, 1,
-0.6954707, 0.9592227, -1.631896, 0.4039216, 1, 0, 1,
-0.6868494, 2.004522, -0.2099954, 0.3960784, 1, 0, 1,
-0.6719642, -0.3438389, -2.317229, 0.3921569, 1, 0, 1,
-0.6683192, -1.898782, -3.178817, 0.3843137, 1, 0, 1,
-0.6667862, -1.066086, -2.891181, 0.3803922, 1, 0, 1,
-0.6631827, 1.423616, -0.4718069, 0.372549, 1, 0, 1,
-0.6618276, -0.3213594, -0.2500608, 0.3686275, 1, 0, 1,
-0.660423, -0.007921753, -2.252833, 0.3607843, 1, 0, 1,
-0.6503043, 0.0548621, -2.733411, 0.3568628, 1, 0, 1,
-0.6474042, 0.5214137, -0.276915, 0.3490196, 1, 0, 1,
-0.6473156, 0.0096204, -2.513332, 0.345098, 1, 0, 1,
-0.6455823, 0.2105685, -2.801205, 0.3372549, 1, 0, 1,
-0.645253, -1.096535, -1.691106, 0.3333333, 1, 0, 1,
-0.6440311, -0.03190377, -1.430344, 0.3254902, 1, 0, 1,
-0.6422796, 0.4901081, -0.7516587, 0.3215686, 1, 0, 1,
-0.6418328, 1.12689, 0.3023798, 0.3137255, 1, 0, 1,
-0.6418298, -0.2482423, -2.858483, 0.3098039, 1, 0, 1,
-0.6403472, 0.8292028, -1.260195, 0.3019608, 1, 0, 1,
-0.6362006, -0.2408502, -1.865703, 0.2941177, 1, 0, 1,
-0.6309947, -0.8088324, -2.212914, 0.2901961, 1, 0, 1,
-0.6232305, -0.001071252, -1.375613, 0.282353, 1, 0, 1,
-0.6137468, 0.477025, -2.102786, 0.2784314, 1, 0, 1,
-0.6133377, -0.2699318, -2.164482, 0.2705882, 1, 0, 1,
-0.6119112, 0.8921394, -0.2350799, 0.2666667, 1, 0, 1,
-0.6057315, 1.612097, 0.8412836, 0.2588235, 1, 0, 1,
-0.605083, 0.3011061, -0.07105005, 0.254902, 1, 0, 1,
-0.5995297, -0.5471479, -3.445091, 0.2470588, 1, 0, 1,
-0.5987287, -1.801661, -3.037948, 0.2431373, 1, 0, 1,
-0.5965288, -0.7634676, -3.151629, 0.2352941, 1, 0, 1,
-0.59646, -1.33691, -2.809069, 0.2313726, 1, 0, 1,
-0.5947984, 0.6865206, -2.812803, 0.2235294, 1, 0, 1,
-0.5892459, -0.7333872, -1.993784, 0.2196078, 1, 0, 1,
-0.5877513, -0.7915303, -2.1302, 0.2117647, 1, 0, 1,
-0.5875851, 1.261081, 0.6837009, 0.2078431, 1, 0, 1,
-0.5867819, -2.113327, -2.265734, 0.2, 1, 0, 1,
-0.578647, 0.7959075, 0.5493073, 0.1921569, 1, 0, 1,
-0.5731542, 1.926651, -0.6810837, 0.1882353, 1, 0, 1,
-0.5683945, -1.863899, -3.210246, 0.1803922, 1, 0, 1,
-0.5682366, 1.051319, 0.6687295, 0.1764706, 1, 0, 1,
-0.5665234, 0.8932695, 0.6639223, 0.1686275, 1, 0, 1,
-0.5646132, -0.8048686, -2.64707, 0.1647059, 1, 0, 1,
-0.5615358, 0.2744891, -1.539207, 0.1568628, 1, 0, 1,
-0.5598164, 0.5844194, -1.982514, 0.1529412, 1, 0, 1,
-0.553122, 0.7304365, -0.5783954, 0.145098, 1, 0, 1,
-0.5530136, 0.04283502, -2.659283, 0.1411765, 1, 0, 1,
-0.5516763, -0.9280699, -4.861027, 0.1333333, 1, 0, 1,
-0.5488734, 1.347685, -0.09283176, 0.1294118, 1, 0, 1,
-0.5438997, -0.06748112, -3.340284, 0.1215686, 1, 0, 1,
-0.5404897, 1.612047, 0.7863344, 0.1176471, 1, 0, 1,
-0.5385121, 0.6128622, -1.248579, 0.1098039, 1, 0, 1,
-0.5381294, -0.8177418, -2.258383, 0.1058824, 1, 0, 1,
-0.535024, -0.5068271, -2.328365, 0.09803922, 1, 0, 1,
-0.5350152, -1.871227, -3.259084, 0.09019608, 1, 0, 1,
-0.534501, 0.3910663, -1.585239, 0.08627451, 1, 0, 1,
-0.5338012, -0.08354955, -0.077032, 0.07843138, 1, 0, 1,
-0.528405, -0.2782803, -1.978351, 0.07450981, 1, 0, 1,
-0.5260612, 1.308378, 0.4476719, 0.06666667, 1, 0, 1,
-0.5251582, -1.928471, -3.181681, 0.0627451, 1, 0, 1,
-0.5171484, 0.3419417, -1.188457, 0.05490196, 1, 0, 1,
-0.5164245, 1.355954, -0.3257651, 0.05098039, 1, 0, 1,
-0.5131896, -1.383647, -2.652749, 0.04313726, 1, 0, 1,
-0.5127305, 1.405329, -2.420706, 0.03921569, 1, 0, 1,
-0.5104682, 0.5864235, -2.933911, 0.03137255, 1, 0, 1,
-0.5102104, -0.7881087, -2.85194, 0.02745098, 1, 0, 1,
-0.5094123, 1.52413, -1.083122, 0.01960784, 1, 0, 1,
-0.5086988, 0.6398819, 0.1698428, 0.01568628, 1, 0, 1,
-0.5074041, 0.4282859, -1.472124, 0.007843138, 1, 0, 1,
-0.5027107, 0.2046634, -2.624433, 0.003921569, 1, 0, 1,
-0.4997141, 0.3776985, -0.01800194, 0, 1, 0.003921569, 1,
-0.4995158, -0.8336287, -1.647226, 0, 1, 0.01176471, 1,
-0.4957531, -1.488364, -2.326547, 0, 1, 0.01568628, 1,
-0.4955451, -0.2816669, -1.612806, 0, 1, 0.02352941, 1,
-0.4927656, -1.450677, -1.711158, 0, 1, 0.02745098, 1,
-0.4879647, -0.5632253, -2.965621, 0, 1, 0.03529412, 1,
-0.4834879, 0.9007475, -0.7379882, 0, 1, 0.03921569, 1,
-0.4800864, -1.165198, -1.86774, 0, 1, 0.04705882, 1,
-0.4792853, 0.6572102, -0.7679253, 0, 1, 0.05098039, 1,
-0.4712624, 0.3843816, -1.740962, 0, 1, 0.05882353, 1,
-0.4655036, 1.494732, -1.13892, 0, 1, 0.0627451, 1,
-0.4635239, -0.8665786, -2.650805, 0, 1, 0.07058824, 1,
-0.4632693, -1.684986, -1.044367, 0, 1, 0.07450981, 1,
-0.4620387, 0.6101441, -0.4305124, 0, 1, 0.08235294, 1,
-0.4570178, 0.4955155, -0.3205343, 0, 1, 0.08627451, 1,
-0.4539143, 0.5945122, -0.8636317, 0, 1, 0.09411765, 1,
-0.4521488, 0.5943415, 0.1274247, 0, 1, 0.1019608, 1,
-0.4513865, 0.04748552, -1.689855, 0, 1, 0.1058824, 1,
-0.4494121, -0.7073066, -2.695969, 0, 1, 0.1137255, 1,
-0.4488589, -1.16484, -2.4056, 0, 1, 0.1176471, 1,
-0.4486921, -1.489406, -4.245044, 0, 1, 0.1254902, 1,
-0.4473804, 1.035649, -0.5561543, 0, 1, 0.1294118, 1,
-0.4434125, 0.05212419, -2.402956, 0, 1, 0.1372549, 1,
-0.4408707, 0.03594872, -2.96991, 0, 1, 0.1411765, 1,
-0.4380777, 0.1233559, -0.141507, 0, 1, 0.1490196, 1,
-0.4350941, -1.265803, -4.679089, 0, 1, 0.1529412, 1,
-0.4340462, -0.6559421, -2.192705, 0, 1, 0.1607843, 1,
-0.4317821, -1.27401, -3.99549, 0, 1, 0.1647059, 1,
-0.4257669, 0.5682821, -1.973452, 0, 1, 0.172549, 1,
-0.4247593, -0.06125363, -2.20258, 0, 1, 0.1764706, 1,
-0.4187913, 0.3837861, 0.1598725, 0, 1, 0.1843137, 1,
-0.4182427, 1.296156, 1.778201, 0, 1, 0.1882353, 1,
-0.4165939, 0.8008958, 0.5356698, 0, 1, 0.1960784, 1,
-0.4066156, -0.2561243, -3.07427, 0, 1, 0.2039216, 1,
-0.4025291, 1.373692, 0.9915487, 0, 1, 0.2078431, 1,
-0.393605, 0.03682319, -0.896492, 0, 1, 0.2156863, 1,
-0.3929842, -0.3449099, -0.8837201, 0, 1, 0.2196078, 1,
-0.3915884, -0.3226148, -2.868888, 0, 1, 0.227451, 1,
-0.388232, -0.9201002, -2.809743, 0, 1, 0.2313726, 1,
-0.3849474, -0.6792292, -2.358679, 0, 1, 0.2392157, 1,
-0.3807512, -0.219141, -2.403754, 0, 1, 0.2431373, 1,
-0.3712735, 0.3177962, -1.175905, 0, 1, 0.2509804, 1,
-0.3693375, 1.621238, 1.299893, 0, 1, 0.254902, 1,
-0.3664133, -2.059498, -3.475094, 0, 1, 0.2627451, 1,
-0.3658791, -0.1459049, -1.614963, 0, 1, 0.2666667, 1,
-0.3646245, 0.7549914, -0.4999889, 0, 1, 0.2745098, 1,
-0.3637708, 1.9781, -0.702315, 0, 1, 0.2784314, 1,
-0.3595144, 0.3585651, -1.015663, 0, 1, 0.2862745, 1,
-0.3572142, 0.3058901, -0.3588857, 0, 1, 0.2901961, 1,
-0.3560242, 0.08927482, -0.8401136, 0, 1, 0.2980392, 1,
-0.3548083, -0.1112561, -1.193478, 0, 1, 0.3058824, 1,
-0.3547256, -1.699843, -4.874607, 0, 1, 0.3098039, 1,
-0.3523158, 0.2580403, 0.1650161, 0, 1, 0.3176471, 1,
-0.3487223, 1.368134, -2.085104, 0, 1, 0.3215686, 1,
-0.3460439, 0.3461738, -0.5095779, 0, 1, 0.3294118, 1,
-0.3445644, -0.1096598, -2.573766, 0, 1, 0.3333333, 1,
-0.3387555, -2.557849, -4.305645, 0, 1, 0.3411765, 1,
-0.3386076, -1.020324, -2.799976, 0, 1, 0.345098, 1,
-0.3379384, 0.7337635, -1.539159, 0, 1, 0.3529412, 1,
-0.333569, 0.8975013, -0.5416204, 0, 1, 0.3568628, 1,
-0.3319713, -1.002399, -2.113141, 0, 1, 0.3647059, 1,
-0.3254777, -0.1701358, -1.02918, 0, 1, 0.3686275, 1,
-0.3244586, 1.228084, 1.04814, 0, 1, 0.3764706, 1,
-0.3232028, 0.01664509, -1.1685, 0, 1, 0.3803922, 1,
-0.3182629, 0.6575342, 0.1280979, 0, 1, 0.3882353, 1,
-0.3172525, -0.8816515, -2.926764, 0, 1, 0.3921569, 1,
-0.3169074, -0.8735543, -1.600634, 0, 1, 0.4, 1,
-0.3127208, -0.2693479, -1.575211, 0, 1, 0.4078431, 1,
-0.3069121, -0.1673449, -1.155463, 0, 1, 0.4117647, 1,
-0.306604, 0.5723036, 1.633663, 0, 1, 0.4196078, 1,
-0.3024297, 0.391571, 0.198748, 0, 1, 0.4235294, 1,
-0.3023928, 0.06457061, -2.437231, 0, 1, 0.4313726, 1,
-0.3021757, 0.4444228, -1.622833, 0, 1, 0.4352941, 1,
-0.3016557, -0.7928196, -1.364722, 0, 1, 0.4431373, 1,
-0.2959172, 1.224303, -0.2364263, 0, 1, 0.4470588, 1,
-0.2932805, 0.3027142, -0.1279292, 0, 1, 0.454902, 1,
-0.2888394, -0.5916339, -3.56146, 0, 1, 0.4588235, 1,
-0.2860145, 0.7024071, 0.5992539, 0, 1, 0.4666667, 1,
-0.2823224, -0.4281024, -3.296663, 0, 1, 0.4705882, 1,
-0.2784116, 0.4217891, 0.2422605, 0, 1, 0.4784314, 1,
-0.277921, -0.237426, -2.596286, 0, 1, 0.4823529, 1,
-0.2761835, 2.491191, 0.6789088, 0, 1, 0.4901961, 1,
-0.2672682, -0.6521353, -3.621958, 0, 1, 0.4941176, 1,
-0.2624935, -1.026015, -0.6890752, 0, 1, 0.5019608, 1,
-0.2619429, -0.3788785, -0.9740077, 0, 1, 0.509804, 1,
-0.2616672, 1.046717, -0.03260393, 0, 1, 0.5137255, 1,
-0.2599474, -0.1666466, -0.4511115, 0, 1, 0.5215687, 1,
-0.2581561, 0.331086, -3.61448, 0, 1, 0.5254902, 1,
-0.2524866, 1.297581, 0.6156732, 0, 1, 0.5333334, 1,
-0.2507787, -0.9915237, -1.395241, 0, 1, 0.5372549, 1,
-0.2501048, -0.1540535, -2.168221, 0, 1, 0.5450981, 1,
-0.244146, 0.9055825, -0.7787876, 0, 1, 0.5490196, 1,
-0.24383, -0.4531833, -2.544596, 0, 1, 0.5568628, 1,
-0.2417447, 0.105005, -1.55336, 0, 1, 0.5607843, 1,
-0.2357776, -0.6579582, -3.012182, 0, 1, 0.5686275, 1,
-0.2348498, -0.1906732, -3.052356, 0, 1, 0.572549, 1,
-0.2310384, -0.2532175, -3.56187, 0, 1, 0.5803922, 1,
-0.2305933, 0.1612823, -0.1477021, 0, 1, 0.5843138, 1,
-0.2263062, -1.191349, -2.488805, 0, 1, 0.5921569, 1,
-0.2243367, 1.024103, -0.7199893, 0, 1, 0.5960785, 1,
-0.2203217, -0.06610767, -1.490662, 0, 1, 0.6039216, 1,
-0.2196312, 0.9135897, 0.2032518, 0, 1, 0.6117647, 1,
-0.2152522, -0.6786951, -0.7110353, 0, 1, 0.6156863, 1,
-0.2141578, -0.4582697, -2.785226, 0, 1, 0.6235294, 1,
-0.2113897, 0.4985362, 0.3968259, 0, 1, 0.627451, 1,
-0.2061021, -0.1989711, -3.852163, 0, 1, 0.6352941, 1,
-0.205945, 1.279014, 1.166229, 0, 1, 0.6392157, 1,
-0.2051976, 0.7737743, -0.1294914, 0, 1, 0.6470588, 1,
-0.2043029, 0.5891648, -0.264763, 0, 1, 0.6509804, 1,
-0.2015543, 0.3366804, -1.792388, 0, 1, 0.6588235, 1,
-0.2009344, 1.036293, -2.117428, 0, 1, 0.6627451, 1,
-0.1972026, -0.4776132, -2.779985, 0, 1, 0.6705883, 1,
-0.1950181, -0.04145642, -0.2488547, 0, 1, 0.6745098, 1,
-0.1939658, 0.9754599, 0.07413761, 0, 1, 0.682353, 1,
-0.1907977, -0.6987199, -1.448964, 0, 1, 0.6862745, 1,
-0.1889499, 0.3213598, -1.458881, 0, 1, 0.6941177, 1,
-0.1822379, 1.070863, -0.6246053, 0, 1, 0.7019608, 1,
-0.1821783, -0.1630452, -2.565184, 0, 1, 0.7058824, 1,
-0.1814275, 0.03189321, -0.2344008, 0, 1, 0.7137255, 1,
-0.1799882, -1.171272, -3.522472, 0, 1, 0.7176471, 1,
-0.1781601, -1.046578, -3.142603, 0, 1, 0.7254902, 1,
-0.1754486, 0.6102995, 0.7261319, 0, 1, 0.7294118, 1,
-0.1738366, 0.4949272, 1.106925, 0, 1, 0.7372549, 1,
-0.1731154, 0.1006862, -0.9358696, 0, 1, 0.7411765, 1,
-0.1719761, -1.572466, -2.505191, 0, 1, 0.7490196, 1,
-0.1700254, -0.8683029, -2.614434, 0, 1, 0.7529412, 1,
-0.1643746, 0.1417879, 1.185292, 0, 1, 0.7607843, 1,
-0.1566079, 1.197109, -0.9115148, 0, 1, 0.7647059, 1,
-0.1562722, -0.6222161, -3.325649, 0, 1, 0.772549, 1,
-0.1555439, -0.2169055, -2.337969, 0, 1, 0.7764706, 1,
-0.1550464, 0.2420546, 0.7762813, 0, 1, 0.7843137, 1,
-0.1545842, -1.1947, -2.12593, 0, 1, 0.7882353, 1,
-0.1510941, -1.112882, -2.726185, 0, 1, 0.7960784, 1,
-0.151023, -1.550323, -1.678848, 0, 1, 0.8039216, 1,
-0.149522, -0.2383626, -3.403891, 0, 1, 0.8078431, 1,
-0.1483662, -1.139284, -2.905485, 0, 1, 0.8156863, 1,
-0.1480146, 0.01318067, -0.7981561, 0, 1, 0.8196079, 1,
-0.1459685, -0.9554198, -2.389673, 0, 1, 0.827451, 1,
-0.1440188, -0.402504, -3.034988, 0, 1, 0.8313726, 1,
-0.1437802, 0.309142, -1.517823, 0, 1, 0.8392157, 1,
-0.1422899, 0.2503693, -1.514159, 0, 1, 0.8431373, 1,
-0.1375218, -0.1432492, -3.240026, 0, 1, 0.8509804, 1,
-0.1371057, 0.2213593, -1.401774, 0, 1, 0.854902, 1,
-0.1361982, -0.1772084, -2.415678, 0, 1, 0.8627451, 1,
-0.129428, 1.450243, 0.4724389, 0, 1, 0.8666667, 1,
-0.1277664, -1.525722, -2.60493, 0, 1, 0.8745098, 1,
-0.1251865, 0.2635944, 0.06334282, 0, 1, 0.8784314, 1,
-0.1236519, 1.199043, -0.4783899, 0, 1, 0.8862745, 1,
-0.1152542, -0.05956146, -2.572078, 0, 1, 0.8901961, 1,
-0.1141615, -0.2481111, -3.374288, 0, 1, 0.8980392, 1,
-0.1124079, 0.8373406, -0.9961432, 0, 1, 0.9058824, 1,
-0.1122592, -0.6307256, -2.143414, 0, 1, 0.9098039, 1,
-0.111615, 0.9467616, -0.5391323, 0, 1, 0.9176471, 1,
-0.1101313, -0.3627056, -4.966202, 0, 1, 0.9215686, 1,
-0.1087737, 0.008308688, -2.535403, 0, 1, 0.9294118, 1,
-0.1055332, 0.7220623, -0.1548071, 0, 1, 0.9333333, 1,
-0.1039768, 2.276048, -0.575883, 0, 1, 0.9411765, 1,
-0.09984041, -1.475236, -2.945832, 0, 1, 0.945098, 1,
-0.09228893, 1.498779, -0.5594916, 0, 1, 0.9529412, 1,
-0.09148679, 0.3713772, 1.168498, 0, 1, 0.9568627, 1,
-0.09015775, -0.3163075, -1.53733, 0, 1, 0.9647059, 1,
-0.07664401, -1.076618, -3.129922, 0, 1, 0.9686275, 1,
-0.07614851, 0.4289053, 0.2679027, 0, 1, 0.9764706, 1,
-0.07585099, -0.5563922, -4.801448, 0, 1, 0.9803922, 1,
-0.06991726, 0.2878525, 0.7539233, 0, 1, 0.9882353, 1,
-0.0683302, -0.1643326, -4.02035, 0, 1, 0.9921569, 1,
-0.06376024, 0.5011494, 0.0114736, 0, 1, 1, 1,
-0.06337767, 0.4023773, -1.076921, 0, 0.9921569, 1, 1,
-0.062085, 0.4052499, 0.02262122, 0, 0.9882353, 1, 1,
-0.0607426, -0.9953985, -3.232111, 0, 0.9803922, 1, 1,
-0.05889612, 0.868116, 0.3265058, 0, 0.9764706, 1, 1,
-0.05772834, 0.6575462, 0.9529802, 0, 0.9686275, 1, 1,
-0.05283808, 1.691513, 0.1591222, 0, 0.9647059, 1, 1,
-0.05235328, 0.8730904, 1.323046, 0, 0.9568627, 1, 1,
-0.04694851, -2.246592, -3.132834, 0, 0.9529412, 1, 1,
-0.04649195, 0.698734, -0.8428791, 0, 0.945098, 1, 1,
-0.04502424, -1.531687, -0.7655535, 0, 0.9411765, 1, 1,
-0.04386007, -0.9426953, -3.0123, 0, 0.9333333, 1, 1,
-0.0437342, 1.742555, 0.6256596, 0, 0.9294118, 1, 1,
-0.04346693, -0.7369487, -2.657583, 0, 0.9215686, 1, 1,
-0.04300806, -0.2478292, -1.935506, 0, 0.9176471, 1, 1,
-0.03243867, 0.6598802, 0.7228673, 0, 0.9098039, 1, 1,
-0.03091038, 1.67293, -0.8519586, 0, 0.9058824, 1, 1,
-0.02807971, -0.4088082, -2.370626, 0, 0.8980392, 1, 1,
-0.02785718, -0.8456944, -3.128864, 0, 0.8901961, 1, 1,
-0.02784836, 0.3198299, 0.8617906, 0, 0.8862745, 1, 1,
-0.02472753, 0.07378305, 0.1812594, 0, 0.8784314, 1, 1,
-0.02270244, 0.5914773, 1.303993, 0, 0.8745098, 1, 1,
-0.02213889, -0.7304607, -3.878419, 0, 0.8666667, 1, 1,
-0.02102022, 0.1716875, -0.6358264, 0, 0.8627451, 1, 1,
-0.01726905, -1.601945, -3.561713, 0, 0.854902, 1, 1,
-0.01197784, -2.615716, -2.436165, 0, 0.8509804, 1, 1,
-0.01137872, -0.4094246, -2.679565, 0, 0.8431373, 1, 1,
-0.008436895, -1.656343, -3.450797, 0, 0.8392157, 1, 1,
-0.002382165, -0.2372888, -3.793104, 0, 0.8313726, 1, 1,
-0.001817159, 0.304839, -0.1453774, 0, 0.827451, 1, 1,
0.002347259, -0.3213864, 2.954049, 0, 0.8196079, 1, 1,
0.005319985, 0.8162961, 1.854898, 0, 0.8156863, 1, 1,
0.006874106, -1.367002, 5.490641, 0, 0.8078431, 1, 1,
0.009013484, -0.1908074, 3.885995, 0, 0.8039216, 1, 1,
0.009212594, -1.372664, 4.288272, 0, 0.7960784, 1, 1,
0.009682671, 0.129227, -0.8293657, 0, 0.7882353, 1, 1,
0.01065169, -2.202016, 4.941259, 0, 0.7843137, 1, 1,
0.01943004, -0.2697566, 1.288683, 0, 0.7764706, 1, 1,
0.02091999, -0.4118566, 1.792873, 0, 0.772549, 1, 1,
0.02108831, -0.2891872, 3.258669, 0, 0.7647059, 1, 1,
0.02134313, 0.1539766, -0.9761856, 0, 0.7607843, 1, 1,
0.029839, 0.0670354, -0.7092395, 0, 0.7529412, 1, 1,
0.03217965, 0.4549282, 0.5838631, 0, 0.7490196, 1, 1,
0.0323537, 1.347404, -0.01253202, 0, 0.7411765, 1, 1,
0.03271078, 0.5028082, -0.1623935, 0, 0.7372549, 1, 1,
0.03370348, 1.76801, 0.7490757, 0, 0.7294118, 1, 1,
0.03477521, 0.3814918, -2.397847, 0, 0.7254902, 1, 1,
0.03523549, 1.968218, -1.133311, 0, 0.7176471, 1, 1,
0.03678, -0.3154784, 2.26083, 0, 0.7137255, 1, 1,
0.03777865, 0.5949599, 0.5649084, 0, 0.7058824, 1, 1,
0.04167029, 0.2192985, -0.807287, 0, 0.6980392, 1, 1,
0.04330837, 0.6358004, 0.3629872, 0, 0.6941177, 1, 1,
0.04985281, 1.607161, -1.674856, 0, 0.6862745, 1, 1,
0.0511045, -0.6043731, 2.380349, 0, 0.682353, 1, 1,
0.05695782, 3.111066, 0.8339326, 0, 0.6745098, 1, 1,
0.06874076, 0.1386865, -1.473073, 0, 0.6705883, 1, 1,
0.07428239, 0.5206519, 0.6011802, 0, 0.6627451, 1, 1,
0.07963243, -0.3955769, 3.913285, 0, 0.6588235, 1, 1,
0.08081396, -0.3195278, 2.54186, 0, 0.6509804, 1, 1,
0.08283877, 0.1977795, -0.7650197, 0, 0.6470588, 1, 1,
0.08395181, -0.8321061, 1.707897, 0, 0.6392157, 1, 1,
0.08678283, 0.1931985, 1.618008, 0, 0.6352941, 1, 1,
0.0899647, -0.3408453, 3.883769, 0, 0.627451, 1, 1,
0.0919029, -0.6230475, 3.748457, 0, 0.6235294, 1, 1,
0.09218256, -0.1242715, 1.349015, 0, 0.6156863, 1, 1,
0.09705918, 1.132781, -1.474061, 0, 0.6117647, 1, 1,
0.09762572, 0.4406127, 0.3151819, 0, 0.6039216, 1, 1,
0.09951939, 0.6740351, -0.2467033, 0, 0.5960785, 1, 1,
0.09959078, 0.339749, -0.8535461, 0, 0.5921569, 1, 1,
0.1008186, -0.1299208, 3.359233, 0, 0.5843138, 1, 1,
0.1015038, -0.1129615, 3.135515, 0, 0.5803922, 1, 1,
0.1077154, 0.1088905, -1.072118, 0, 0.572549, 1, 1,
0.107945, 0.1736048, -0.7674992, 0, 0.5686275, 1, 1,
0.1080866, 1.78401, -1.795449, 0, 0.5607843, 1, 1,
0.1097764, -0.1674034, 3.677912, 0, 0.5568628, 1, 1,
0.1151341, 0.1582062, -0.464724, 0, 0.5490196, 1, 1,
0.1169837, 1.259306, -2.029397, 0, 0.5450981, 1, 1,
0.1262984, -0.308308, 4.315046, 0, 0.5372549, 1, 1,
0.1322499, 0.6408063, 0.09777524, 0, 0.5333334, 1, 1,
0.1327337, 0.9853998, 0.834568, 0, 0.5254902, 1, 1,
0.1335724, -1.281195, 2.053153, 0, 0.5215687, 1, 1,
0.1350585, 0.5699534, 1.534806, 0, 0.5137255, 1, 1,
0.1387635, 1.768681, -1.499448, 0, 0.509804, 1, 1,
0.1426603, 1.01254, 0.7998428, 0, 0.5019608, 1, 1,
0.1437021, 0.04674821, 0.8383914, 0, 0.4941176, 1, 1,
0.1460182, -0.2882921, 1.53586, 0, 0.4901961, 1, 1,
0.147382, 0.1583121, 1.324097, 0, 0.4823529, 1, 1,
0.1481059, -0.7934855, 2.062292, 0, 0.4784314, 1, 1,
0.1494291, -0.4223599, 2.847573, 0, 0.4705882, 1, 1,
0.1533752, 0.6528739, -0.6756554, 0, 0.4666667, 1, 1,
0.1546803, 0.09903269, 0.4576218, 0, 0.4588235, 1, 1,
0.1584872, 0.2639359, 0.3428913, 0, 0.454902, 1, 1,
0.1628248, -1.327361, 3.713306, 0, 0.4470588, 1, 1,
0.1668777, 1.322945, -0.4878241, 0, 0.4431373, 1, 1,
0.1680548, -0.1838324, 5.737357, 0, 0.4352941, 1, 1,
0.1690944, 0.9955681, 0.2402866, 0, 0.4313726, 1, 1,
0.1730795, 0.09675371, 1.067915, 0, 0.4235294, 1, 1,
0.1736134, -0.1097769, 1.098412, 0, 0.4196078, 1, 1,
0.1751307, -0.6565539, 1.167836, 0, 0.4117647, 1, 1,
0.177613, -0.8296249, 2.851285, 0, 0.4078431, 1, 1,
0.1807662, -0.0588907, 2.370251, 0, 0.4, 1, 1,
0.1853281, -0.1592773, 0.937548, 0, 0.3921569, 1, 1,
0.1857146, -0.5188245, 1.849283, 0, 0.3882353, 1, 1,
0.1873678, 0.2143848, -0.008907802, 0, 0.3803922, 1, 1,
0.1904076, -1.096337, 4.727394, 0, 0.3764706, 1, 1,
0.1920094, 0.007368971, 0.5391344, 0, 0.3686275, 1, 1,
0.195851, -1.362759, 3.883547, 0, 0.3647059, 1, 1,
0.2000737, 1.468749, 0.4500428, 0, 0.3568628, 1, 1,
0.2013854, 2.502523, 1.133833, 0, 0.3529412, 1, 1,
0.2020337, 1.012683, -0.1229214, 0, 0.345098, 1, 1,
0.2023692, 1.182422, 1.212365, 0, 0.3411765, 1, 1,
0.2027451, -1.237274, 1.678332, 0, 0.3333333, 1, 1,
0.2193779, -0.532199, 1.157569, 0, 0.3294118, 1, 1,
0.2193973, 1.080338, 0.1933371, 0, 0.3215686, 1, 1,
0.2227454, 0.04627529, 0.4356032, 0, 0.3176471, 1, 1,
0.2275334, -0.6658723, 3.495738, 0, 0.3098039, 1, 1,
0.2304541, -0.3719482, 2.48597, 0, 0.3058824, 1, 1,
0.2341119, -1.12724, 2.792742, 0, 0.2980392, 1, 1,
0.2359216, -0.06894013, 0.4449735, 0, 0.2901961, 1, 1,
0.240088, -0.9577375, 2.332746, 0, 0.2862745, 1, 1,
0.2417927, 1.404736, 1.29211, 0, 0.2784314, 1, 1,
0.2458703, -0.6865981, 2.944336, 0, 0.2745098, 1, 1,
0.2567286, 1.364892, 0.6179106, 0, 0.2666667, 1, 1,
0.2614583, -0.04287289, 1.519733, 0, 0.2627451, 1, 1,
0.2653109, -0.6420094, 1.835416, 0, 0.254902, 1, 1,
0.2659457, -1.240747, 1.314175, 0, 0.2509804, 1, 1,
0.2745844, 1.491811, -0.3330249, 0, 0.2431373, 1, 1,
0.2815118, 2.524069, 0.6395022, 0, 0.2392157, 1, 1,
0.2824826, 0.8805967, 0.8462213, 0, 0.2313726, 1, 1,
0.2871423, 1.32106, 0.4816538, 0, 0.227451, 1, 1,
0.28932, 0.5166751, -0.1480978, 0, 0.2196078, 1, 1,
0.2896319, 1.264604, 0.5041315, 0, 0.2156863, 1, 1,
0.2897518, -0.04618929, 0.9875332, 0, 0.2078431, 1, 1,
0.2901126, 0.9339094, 1.60828, 0, 0.2039216, 1, 1,
0.2921546, 0.2876054, 4.969728, 0, 0.1960784, 1, 1,
0.2954693, -0.1408269, 3.072325, 0, 0.1882353, 1, 1,
0.2983284, -0.1785511, 2.098498, 0, 0.1843137, 1, 1,
0.3002721, 0.6196128, 1.9291, 0, 0.1764706, 1, 1,
0.3082941, 0.4076777, -0.5169188, 0, 0.172549, 1, 1,
0.3096156, 1.496107, 1.615523, 0, 0.1647059, 1, 1,
0.3143432, 0.07841152, 0.1734533, 0, 0.1607843, 1, 1,
0.3150474, -0.05989907, 1.583069, 0, 0.1529412, 1, 1,
0.3162456, 2.139902, 1.139367, 0, 0.1490196, 1, 1,
0.3229415, 0.3009917, 0.08257078, 0, 0.1411765, 1, 1,
0.3237246, -0.09624775, 0.6511129, 0, 0.1372549, 1, 1,
0.3257115, -0.6111638, 1.750873, 0, 0.1294118, 1, 1,
0.3263142, 1.784299, -0.5001404, 0, 0.1254902, 1, 1,
0.3272156, 0.2993381, 0.6064091, 0, 0.1176471, 1, 1,
0.3300802, -1.288758, 2.256264, 0, 0.1137255, 1, 1,
0.3301892, 1.005691, 0.2942597, 0, 0.1058824, 1, 1,
0.3367554, 0.2499752, 1.960714, 0, 0.09803922, 1, 1,
0.3400367, 0.9577208, 1.015596, 0, 0.09411765, 1, 1,
0.3402013, 1.324749, -0.7194869, 0, 0.08627451, 1, 1,
0.3503564, -0.4526959, 3.763622, 0, 0.08235294, 1, 1,
0.3509668, 1.122143, 0.3343757, 0, 0.07450981, 1, 1,
0.3571066, 1.157524, -0.4591248, 0, 0.07058824, 1, 1,
0.358667, 1.031445, -0.2459385, 0, 0.0627451, 1, 1,
0.3611571, -0.09865443, 2.869742, 0, 0.05882353, 1, 1,
0.3628869, 0.8132734, -1.409099, 0, 0.05098039, 1, 1,
0.3638212, -1.248581, 4.090549, 0, 0.04705882, 1, 1,
0.3639408, -0.2159453, 1.242129, 0, 0.03921569, 1, 1,
0.3644139, 0.6691623, 0.6959251, 0, 0.03529412, 1, 1,
0.3662039, 1.456117, 1.700648, 0, 0.02745098, 1, 1,
0.3702445, 0.02104112, 1.250173, 0, 0.02352941, 1, 1,
0.370957, 1.217498, 1.653975, 0, 0.01568628, 1, 1,
0.3756939, -0.4770144, 2.758157, 0, 0.01176471, 1, 1,
0.380796, -0.8764923, 2.017763, 0, 0.003921569, 1, 1,
0.3813754, -1.011767, 3.213726, 0.003921569, 0, 1, 1,
0.3818165, 0.02088064, 1.856369, 0.007843138, 0, 1, 1,
0.3835861, 1.56638, 1.031772, 0.01568628, 0, 1, 1,
0.3893582, 1.268121, -1.34534, 0.01960784, 0, 1, 1,
0.3909874, -0.7286555, 1.395919, 0.02745098, 0, 1, 1,
0.3944832, 1.630956, 1.953806, 0.03137255, 0, 1, 1,
0.3959554, 0.3332895, -1.404877, 0.03921569, 0, 1, 1,
0.397096, -0.5900141, 1.005315, 0.04313726, 0, 1, 1,
0.3981337, 1.143022, -0.5124913, 0.05098039, 0, 1, 1,
0.4008869, 0.6867724, 0.7652335, 0.05490196, 0, 1, 1,
0.4031387, 0.1823944, -0.6231241, 0.0627451, 0, 1, 1,
0.4059307, -0.253296, 0.5597299, 0.06666667, 0, 1, 1,
0.406984, -0.06089932, 1.724123, 0.07450981, 0, 1, 1,
0.4083574, -0.1366981, 1.694802, 0.07843138, 0, 1, 1,
0.4097677, 0.7671715, -0.03116464, 0.08627451, 0, 1, 1,
0.4104149, -1.109915, 1.44783, 0.09019608, 0, 1, 1,
0.4133783, 1.242988, 0.6764404, 0.09803922, 0, 1, 1,
0.4152621, -1.097112, 3.161155, 0.1058824, 0, 1, 1,
0.4172492, 1.274739, -0.5846722, 0.1098039, 0, 1, 1,
0.4291379, -0.2492646, -0.243985, 0.1176471, 0, 1, 1,
0.4402417, -1.37505, 1.459898, 0.1215686, 0, 1, 1,
0.4429044, 1.585877, 1.205962, 0.1294118, 0, 1, 1,
0.4458314, -2.150726, 1.615642, 0.1333333, 0, 1, 1,
0.4463385, 0.0916279, 1.89789, 0.1411765, 0, 1, 1,
0.4469097, 0.908807, -0.5132812, 0.145098, 0, 1, 1,
0.4493315, -0.9520673, 2.710253, 0.1529412, 0, 1, 1,
0.4529197, -0.6758281, 1.680443, 0.1568628, 0, 1, 1,
0.4532552, -1.129847, 3.454283, 0.1647059, 0, 1, 1,
0.4558308, 1.030626, 1.278294, 0.1686275, 0, 1, 1,
0.4582358, -0.1568257, -0.189823, 0.1764706, 0, 1, 1,
0.4595526, 1.139442, -0.2918923, 0.1803922, 0, 1, 1,
0.4633205, -1.4072, 2.5662, 0.1882353, 0, 1, 1,
0.4708852, 0.4929626, 0.2254858, 0.1921569, 0, 1, 1,
0.4727575, -0.2701208, 1.578365, 0.2, 0, 1, 1,
0.4834017, -0.1300035, 2.193633, 0.2078431, 0, 1, 1,
0.4847893, 1.663807, 0.6008645, 0.2117647, 0, 1, 1,
0.4858964, 0.7932498, 0.7941031, 0.2196078, 0, 1, 1,
0.4876575, -0.900572, 2.638687, 0.2235294, 0, 1, 1,
0.4898307, -0.8936483, 2.118663, 0.2313726, 0, 1, 1,
0.4899868, -1.28017, 3.35835, 0.2352941, 0, 1, 1,
0.497164, 0.6068335, 1.764683, 0.2431373, 0, 1, 1,
0.4995466, -1.186952, 2.869818, 0.2470588, 0, 1, 1,
0.5005255, -1.426895, 3.094094, 0.254902, 0, 1, 1,
0.5018451, 0.1246239, 1.295174, 0.2588235, 0, 1, 1,
0.5107997, -0.8032268, 1.277873, 0.2666667, 0, 1, 1,
0.5136686, 1.000207, -2.070224, 0.2705882, 0, 1, 1,
0.5140911, -1.418033, 4.21921, 0.2784314, 0, 1, 1,
0.5150608, -1.742377, 1.465686, 0.282353, 0, 1, 1,
0.5161381, -0.9120588, 1.996263, 0.2901961, 0, 1, 1,
0.5180017, -1.065848, 1.796728, 0.2941177, 0, 1, 1,
0.5196316, -0.1895835, 1.436609, 0.3019608, 0, 1, 1,
0.5218229, 1.33842, 0.5052156, 0.3098039, 0, 1, 1,
0.5258864, 0.2002704, 1.695935, 0.3137255, 0, 1, 1,
0.5317175, -1.271911, 3.278411, 0.3215686, 0, 1, 1,
0.5346145, 0.08027091, -0.5124224, 0.3254902, 0, 1, 1,
0.534797, 0.5792816, -0.3483892, 0.3333333, 0, 1, 1,
0.5399131, 0.4635582, 2.176484, 0.3372549, 0, 1, 1,
0.5399674, 0.05295154, -0.4979241, 0.345098, 0, 1, 1,
0.5433699, 0.5820639, 1.13424, 0.3490196, 0, 1, 1,
0.5434543, 0.1213946, 1.244736, 0.3568628, 0, 1, 1,
0.54554, 1.432473, -2.579989, 0.3607843, 0, 1, 1,
0.5466961, 1.880392, 0.4106537, 0.3686275, 0, 1, 1,
0.5479331, 0.885382, -0.01601005, 0.372549, 0, 1, 1,
0.549682, -1.380992, 3.130731, 0.3803922, 0, 1, 1,
0.5511448, -0.1444116, 1.933466, 0.3843137, 0, 1, 1,
0.559774, -0.3148628, 0.550139, 0.3921569, 0, 1, 1,
0.5607592, 0.1411661, 0.3795511, 0.3960784, 0, 1, 1,
0.5615653, 0.6958483, 0.8715159, 0.4039216, 0, 1, 1,
0.5622095, 2.186368, -0.565055, 0.4117647, 0, 1, 1,
0.5661047, -0.9428159, 0.8160693, 0.4156863, 0, 1, 1,
0.5695461, 0.5725925, 0.2328432, 0.4235294, 0, 1, 1,
0.5726766, 0.9337389, 2.251369, 0.427451, 0, 1, 1,
0.5777432, 1.893411, 0.9130408, 0.4352941, 0, 1, 1,
0.5780492, -0.6340901, 2.260133, 0.4392157, 0, 1, 1,
0.5820782, 0.9816719, 0.8623503, 0.4470588, 0, 1, 1,
0.5840668, 0.1192695, 1.52254, 0.4509804, 0, 1, 1,
0.5853466, -0.5729513, 4.0595, 0.4588235, 0, 1, 1,
0.5883688, -0.1647378, 1.79881, 0.4627451, 0, 1, 1,
0.5918381, 2.316213, -0.4258025, 0.4705882, 0, 1, 1,
0.6030393, -0.1734794, 1.180686, 0.4745098, 0, 1, 1,
0.6074761, 0.1523271, 1.992683, 0.4823529, 0, 1, 1,
0.6104312, 0.4746819, 1.522387, 0.4862745, 0, 1, 1,
0.615869, -0.4780449, 2.267757, 0.4941176, 0, 1, 1,
0.617976, 0.3199077, -0.3156209, 0.5019608, 0, 1, 1,
0.6233453, 1.136658, -0.8881984, 0.5058824, 0, 1, 1,
0.625164, 0.2561467, 2.396931, 0.5137255, 0, 1, 1,
0.6262447, -0.830476, 3.652067, 0.5176471, 0, 1, 1,
0.6268345, 0.02542758, 1.888708, 0.5254902, 0, 1, 1,
0.6274461, 0.4711967, -0.2431146, 0.5294118, 0, 1, 1,
0.6289772, 1.001904, 0.2811747, 0.5372549, 0, 1, 1,
0.6306843, 1.648608, -0.1972613, 0.5411765, 0, 1, 1,
0.6312252, -0.7847314, 1.196213, 0.5490196, 0, 1, 1,
0.6368794, 1.299529, -0.6458534, 0.5529412, 0, 1, 1,
0.6370893, -0.503686, 1.584155, 0.5607843, 0, 1, 1,
0.6504695, -0.8642381, 2.665163, 0.5647059, 0, 1, 1,
0.6609104, -1.174322, 3.931424, 0.572549, 0, 1, 1,
0.6634879, 1.997131, 2.050223, 0.5764706, 0, 1, 1,
0.6643887, -1.109737, 1.839506, 0.5843138, 0, 1, 1,
0.6677629, 0.09031034, 3.203454, 0.5882353, 0, 1, 1,
0.6695232, -1.61922, 4.054386, 0.5960785, 0, 1, 1,
0.6695383, -0.9712351, 1.799123, 0.6039216, 0, 1, 1,
0.6699959, 0.3906673, 1.422829, 0.6078432, 0, 1, 1,
0.7049477, 2.400267, 0.8854102, 0.6156863, 0, 1, 1,
0.7063541, 1.474343, 2.123033, 0.6196079, 0, 1, 1,
0.708142, 0.3900661, 1.437768, 0.627451, 0, 1, 1,
0.7120179, -0.1675414, 2.879765, 0.6313726, 0, 1, 1,
0.7130524, -0.1090457, 1.800561, 0.6392157, 0, 1, 1,
0.7144417, -0.1704424, 0.2392359, 0.6431373, 0, 1, 1,
0.7175441, 0.6772318, 1.081242, 0.6509804, 0, 1, 1,
0.7270955, 0.6406412, 0.9921564, 0.654902, 0, 1, 1,
0.7386642, 0.01316947, 3.144981, 0.6627451, 0, 1, 1,
0.7413469, 0.1945358, 1.8043, 0.6666667, 0, 1, 1,
0.7422299, -0.9516829, 1.411346, 0.6745098, 0, 1, 1,
0.7446957, -0.3054797, 0.8156113, 0.6784314, 0, 1, 1,
0.7534516, -1.502249, 1.845103, 0.6862745, 0, 1, 1,
0.7542441, -0.2128254, 0.7112215, 0.6901961, 0, 1, 1,
0.7563869, 1.602811, 0.4430251, 0.6980392, 0, 1, 1,
0.7615114, -0.05224288, 2.395835, 0.7058824, 0, 1, 1,
0.7617503, -0.04990339, 1.927575, 0.7098039, 0, 1, 1,
0.7685617, 0.009258892, 1.820524, 0.7176471, 0, 1, 1,
0.7686986, 1.08138, 0.306257, 0.7215686, 0, 1, 1,
0.7689728, 1.827359, 0.6096012, 0.7294118, 0, 1, 1,
0.7709853, 0.5305332, 1.380978, 0.7333333, 0, 1, 1,
0.7762687, -0.3419899, 1.145144, 0.7411765, 0, 1, 1,
0.776306, 0.3108823, 1.48994, 0.7450981, 0, 1, 1,
0.7779111, 1.421905, 1.143314, 0.7529412, 0, 1, 1,
0.7788566, 1.144148, 1.704555, 0.7568628, 0, 1, 1,
0.7808685, -0.6280411, 2.773774, 0.7647059, 0, 1, 1,
0.7869435, -0.0888665, -1.13535, 0.7686275, 0, 1, 1,
0.7874553, 1.012705, -0.8349405, 0.7764706, 0, 1, 1,
0.7988771, 1.083131, -0.3376589, 0.7803922, 0, 1, 1,
0.8008673, 0.7273344, 0.1099994, 0.7882353, 0, 1, 1,
0.8101841, 1.082847, 3.161447, 0.7921569, 0, 1, 1,
0.8143536, 0.1998196, 1.556405, 0.8, 0, 1, 1,
0.8169957, -0.06049611, 3.192883, 0.8078431, 0, 1, 1,
0.819249, -2.137756, 3.51645, 0.8117647, 0, 1, 1,
0.8242014, -0.7647762, 2.001631, 0.8196079, 0, 1, 1,
0.8265665, -1.140252, 2.039323, 0.8235294, 0, 1, 1,
0.8273017, 1.515044, -0.3602773, 0.8313726, 0, 1, 1,
0.8283875, 0.581112, 0.9631378, 0.8352941, 0, 1, 1,
0.8311993, 0.5980133, -0.7544804, 0.8431373, 0, 1, 1,
0.8312101, 0.7287998, -0.2901522, 0.8470588, 0, 1, 1,
0.8330179, 0.9797674, 1.556727, 0.854902, 0, 1, 1,
0.8353201, 1.830238, 0.7712572, 0.8588235, 0, 1, 1,
0.8435507, 1.692969, 2.467161, 0.8666667, 0, 1, 1,
0.8436531, 0.1848706, 0.7840608, 0.8705882, 0, 1, 1,
0.8490821, -0.5992863, 2.895405, 0.8784314, 0, 1, 1,
0.850779, -0.9867669, 0.87254, 0.8823529, 0, 1, 1,
0.8565239, 0.2594534, 1.729195, 0.8901961, 0, 1, 1,
0.8571203, -0.1962427, 1.199092, 0.8941177, 0, 1, 1,
0.8588247, -1.3542, 1.380802, 0.9019608, 0, 1, 1,
0.8649054, 0.81115, 0.3934467, 0.9098039, 0, 1, 1,
0.8654028, -0.6230904, 1.773714, 0.9137255, 0, 1, 1,
0.8667759, 0.6324368, 0.4663257, 0.9215686, 0, 1, 1,
0.8717336, 0.4350396, 2.907553, 0.9254902, 0, 1, 1,
0.8722863, 0.219146, 2.09159, 0.9333333, 0, 1, 1,
0.8769187, 1.27796, 0.5229391, 0.9372549, 0, 1, 1,
0.8791615, -0.32505, 2.680689, 0.945098, 0, 1, 1,
0.883752, -0.3716071, 1.96887, 0.9490196, 0, 1, 1,
0.8856171, -0.8531092, 2.760412, 0.9568627, 0, 1, 1,
0.8876305, -0.6524278, 1.190523, 0.9607843, 0, 1, 1,
0.8903267, -1.320911, 2.804203, 0.9686275, 0, 1, 1,
0.8906353, -0.7376395, 3.407334, 0.972549, 0, 1, 1,
0.8971145, 0.1981327, 0.8896176, 0.9803922, 0, 1, 1,
0.8982435, -0.3365905, 1.261164, 0.9843137, 0, 1, 1,
0.9034916, 0.09892938, 2.254658, 0.9921569, 0, 1, 1,
0.9049746, -0.8532504, 0.7218786, 0.9960784, 0, 1, 1,
0.9066198, -0.744193, 2.546431, 1, 0, 0.9960784, 1,
0.9068733, 0.1292287, 2.135394, 1, 0, 0.9882353, 1,
0.9168965, -0.6630094, 2.096004, 1, 0, 0.9843137, 1,
0.9169942, 0.441948, 2.338723, 1, 0, 0.9764706, 1,
0.9204672, -1.841506, 2.865026, 1, 0, 0.972549, 1,
0.9260257, 0.7525026, -0.7702543, 1, 0, 0.9647059, 1,
0.9396625, -0.1090363, 1.575999, 1, 0, 0.9607843, 1,
0.9411691, -1.72969, 2.250669, 1, 0, 0.9529412, 1,
0.9455451, -0.356132, 1.717215, 1, 0, 0.9490196, 1,
0.9494439, 1.188033, 0.5221612, 1, 0, 0.9411765, 1,
0.9517769, -0.5949911, 1.978284, 1, 0, 0.9372549, 1,
0.9536432, -0.1979786, 0.9843148, 1, 0, 0.9294118, 1,
0.9552513, -1.319889, 1.699561, 1, 0, 0.9254902, 1,
0.9560025, -0.5862645, 2.629519, 1, 0, 0.9176471, 1,
0.9622376, 1.035372, 2.435622, 1, 0, 0.9137255, 1,
0.9648898, 0.5542545, 1.382888, 1, 0, 0.9058824, 1,
0.9682402, 0.6964929, 0.7614085, 1, 0, 0.9019608, 1,
0.9721604, -1.226655, 1.384503, 1, 0, 0.8941177, 1,
0.9745836, 0.8093801, 2.386105, 1, 0, 0.8862745, 1,
0.9879452, 0.1158246, 3.289891, 1, 0, 0.8823529, 1,
0.9970062, -0.3989064, 3.806435, 1, 0, 0.8745098, 1,
0.9970578, -0.6402789, 2.047045, 1, 0, 0.8705882, 1,
1.010658, 0.4855431, 1.048572, 1, 0, 0.8627451, 1,
1.018532, 0.6881852, -0.3653573, 1, 0, 0.8588235, 1,
1.026029, 0.4842948, -1.309097, 1, 0, 0.8509804, 1,
1.035737, -1.696794, 4.897599, 1, 0, 0.8470588, 1,
1.038107, -0.4010453, 2.291606, 1, 0, 0.8392157, 1,
1.040128, 0.542517, 0.6387892, 1, 0, 0.8352941, 1,
1.043351, 1.675681, 0.6360335, 1, 0, 0.827451, 1,
1.064913, -0.5462109, 3.651848, 1, 0, 0.8235294, 1,
1.070732, -0.1265492, 0.8750323, 1, 0, 0.8156863, 1,
1.073221, -0.09732122, 0.3313028, 1, 0, 0.8117647, 1,
1.075485, -0.9020324, 1.577979, 1, 0, 0.8039216, 1,
1.079366, 1.458074, -1.045292, 1, 0, 0.7960784, 1,
1.086631, -0.01565949, 1.205506, 1, 0, 0.7921569, 1,
1.099375, 0.3316683, 1.506996, 1, 0, 0.7843137, 1,
1.101768, 0.7046291, 0.02737097, 1, 0, 0.7803922, 1,
1.114779, -0.3212295, 2.695635, 1, 0, 0.772549, 1,
1.115842, -1.079239, 2.03973, 1, 0, 0.7686275, 1,
1.116766, -0.1660908, 1.405251, 1, 0, 0.7607843, 1,
1.116886, -2.508302, 3.74766, 1, 0, 0.7568628, 1,
1.119256, 0.7328511, 2.138299, 1, 0, 0.7490196, 1,
1.131959, -0.03987685, 2.603858, 1, 0, 0.7450981, 1,
1.133188, 0.7409939, 1.049964, 1, 0, 0.7372549, 1,
1.149821, 0.9235592, -0.3356697, 1, 0, 0.7333333, 1,
1.152211, 0.9368882, 2.467565, 1, 0, 0.7254902, 1,
1.154747, 0.1795448, 0.007558818, 1, 0, 0.7215686, 1,
1.160821, -0.6244682, 2.257979, 1, 0, 0.7137255, 1,
1.180625, -0.4166193, 1.16926, 1, 0, 0.7098039, 1,
1.181508, -0.7941521, 3.12294, 1, 0, 0.7019608, 1,
1.188817, -0.1027167, 1.144964, 1, 0, 0.6941177, 1,
1.190912, -0.2329625, 0.9100913, 1, 0, 0.6901961, 1,
1.201017, 1.5824, 0.6787661, 1, 0, 0.682353, 1,
1.202214, -0.02417533, 1.663462, 1, 0, 0.6784314, 1,
1.208552, -0.930427, 1.594573, 1, 0, 0.6705883, 1,
1.225305, -0.9972173, 2.50755, 1, 0, 0.6666667, 1,
1.241468, 0.03763524, 1.781901, 1, 0, 0.6588235, 1,
1.244171, -0.4270685, 1.92004, 1, 0, 0.654902, 1,
1.245838, -1.104449, 2.14524, 1, 0, 0.6470588, 1,
1.259622, 1.479654, 0.667407, 1, 0, 0.6431373, 1,
1.263587, 0.06235565, 2.655442, 1, 0, 0.6352941, 1,
1.268081, 1.331408, 0.5451728, 1, 0, 0.6313726, 1,
1.275475, -0.4312794, 1.658184, 1, 0, 0.6235294, 1,
1.290447, -0.5410375, 0.9190686, 1, 0, 0.6196079, 1,
1.291876, -1.752964, 2.145858, 1, 0, 0.6117647, 1,
1.299691, -0.7398804, 1.954599, 1, 0, 0.6078432, 1,
1.30294, 1.498806, -0.1022621, 1, 0, 0.6, 1,
1.304929, 1.07915, 3.045642, 1, 0, 0.5921569, 1,
1.30968, 0.6629024, -0.7648152, 1, 0, 0.5882353, 1,
1.319123, 0.1533756, 1.970155, 1, 0, 0.5803922, 1,
1.322901, 1.101084, 1.609505, 1, 0, 0.5764706, 1,
1.34299, -1.604312, 1.721164, 1, 0, 0.5686275, 1,
1.359121, -1.258143, 3.051112, 1, 0, 0.5647059, 1,
1.371668, -0.4432248, 3.253726, 1, 0, 0.5568628, 1,
1.372101, -1.765334, 2.621143, 1, 0, 0.5529412, 1,
1.38088, 1.590448, 1.058978, 1, 0, 0.5450981, 1,
1.386542, 0.5210245, 2.980984, 1, 0, 0.5411765, 1,
1.404923, 0.7178746, 1.964733, 1, 0, 0.5333334, 1,
1.409564, 0.4454683, 1.743407, 1, 0, 0.5294118, 1,
1.412061, 1.184119, -0.1076207, 1, 0, 0.5215687, 1,
1.415857, 0.7477329, 0.2424042, 1, 0, 0.5176471, 1,
1.418982, -0.09469014, 1.191811, 1, 0, 0.509804, 1,
1.424835, 0.7541947, 0.9428094, 1, 0, 0.5058824, 1,
1.430664, 0.07223624, 2.058183, 1, 0, 0.4980392, 1,
1.43275, 1.706412, 0.6194305, 1, 0, 0.4901961, 1,
1.438147, -1.596443, 3.622043, 1, 0, 0.4862745, 1,
1.445296, -0.6662812, 2.31522, 1, 0, 0.4784314, 1,
1.447196, -0.2711628, 2.91146, 1, 0, 0.4745098, 1,
1.448315, -0.473157, 2.049396, 1, 0, 0.4666667, 1,
1.450541, 0.3346376, 0.8944039, 1, 0, 0.4627451, 1,
1.453566, -0.4037016, 2.674727, 1, 0, 0.454902, 1,
1.455671, 0.9937667, 1.43023, 1, 0, 0.4509804, 1,
1.456285, -0.3617279, 0.4952676, 1, 0, 0.4431373, 1,
1.462806, 0.2308319, 1.536153, 1, 0, 0.4392157, 1,
1.489774, 1.269956, 0.08933334, 1, 0, 0.4313726, 1,
1.496863, 1.205427, 0.4793056, 1, 0, 0.427451, 1,
1.528267, 0.4093046, 1.58025, 1, 0, 0.4196078, 1,
1.535383, -0.9856144, 1.98471, 1, 0, 0.4156863, 1,
1.546267, -0.4850256, 2.592718, 1, 0, 0.4078431, 1,
1.555133, 1.091047, 1.172261, 1, 0, 0.4039216, 1,
1.559139, 0.120405, 1.991958, 1, 0, 0.3960784, 1,
1.563641, -1.931985, 3.09511, 1, 0, 0.3882353, 1,
1.57721, 1.351717, 0.4512567, 1, 0, 0.3843137, 1,
1.581233, -0.0599585, -0.2227925, 1, 0, 0.3764706, 1,
1.590558, -0.03677526, 0.5831745, 1, 0, 0.372549, 1,
1.618652, 0.7563408, 1.318472, 1, 0, 0.3647059, 1,
1.623554, 0.4454607, 0.5387987, 1, 0, 0.3607843, 1,
1.62494, 0.5331724, 1.552122, 1, 0, 0.3529412, 1,
1.639266, -0.7063313, 2.466871, 1, 0, 0.3490196, 1,
1.642851, 0.3651336, -0.007602036, 1, 0, 0.3411765, 1,
1.655565, -0.006653902, 1.274636, 1, 0, 0.3372549, 1,
1.672356, 0.4269019, 1.986089, 1, 0, 0.3294118, 1,
1.716139, 0.6043418, 2.032579, 1, 0, 0.3254902, 1,
1.717731, -0.1285411, 1.487892, 1, 0, 0.3176471, 1,
1.743914, 0.1585341, -0.2897384, 1, 0, 0.3137255, 1,
1.745907, 0.929083, -0.5225492, 1, 0, 0.3058824, 1,
1.767592, 0.4195699, -0.003174406, 1, 0, 0.2980392, 1,
1.773793, -1.34239, 0.9890643, 1, 0, 0.2941177, 1,
1.788371, -1.139807, 1.276958, 1, 0, 0.2862745, 1,
1.801738, -0.4155836, 2.85425, 1, 0, 0.282353, 1,
1.811238, -0.2125407, 1.175138, 1, 0, 0.2745098, 1,
1.828991, -0.9332607, 3.587064, 1, 0, 0.2705882, 1,
1.841512, -1.375909, 1.189787, 1, 0, 0.2627451, 1,
1.878689, -1.223612, 1.857146, 1, 0, 0.2588235, 1,
1.885702, -0.525952, 2.284655, 1, 0, 0.2509804, 1,
1.888217, 2.034416, -0.3859652, 1, 0, 0.2470588, 1,
1.889463, -0.1418136, 2.61788, 1, 0, 0.2392157, 1,
1.898022, 0.8770409, 1.116959, 1, 0, 0.2352941, 1,
1.906903, -0.5562672, 2.345429, 1, 0, 0.227451, 1,
1.909233, -0.1134182, 1.532578, 1, 0, 0.2235294, 1,
1.925335, 1.008447, 0.07926535, 1, 0, 0.2156863, 1,
1.942437, 1.029178, 1.032812, 1, 0, 0.2117647, 1,
1.971844, 1.025752, 1.370229, 1, 0, 0.2039216, 1,
1.973299, -1.424357, 2.24485, 1, 0, 0.1960784, 1,
1.981062, -1.517287, 0.6602066, 1, 0, 0.1921569, 1,
1.990063, 0.9483328, 2.324507, 1, 0, 0.1843137, 1,
2.000062, -1.046461, 2.227836, 1, 0, 0.1803922, 1,
2.011458, 0.6286912, 0.8378647, 1, 0, 0.172549, 1,
2.014378, 0.356135, 1.194904, 1, 0, 0.1686275, 1,
2.016104, 1.014576, 2.333173, 1, 0, 0.1607843, 1,
2.020726, 1.030237, 2.237824, 1, 0, 0.1568628, 1,
2.038924, -0.910942, 1.214597, 1, 0, 0.1490196, 1,
2.046589, -1.6308, 1.859167, 1, 0, 0.145098, 1,
2.049409, 0.6820458, 2.297733, 1, 0, 0.1372549, 1,
2.100991, -0.1704027, 2.854575, 1, 0, 0.1333333, 1,
2.101615, -0.9757859, 0.5593256, 1, 0, 0.1254902, 1,
2.154211, -0.5832266, 0.8966847, 1, 0, 0.1215686, 1,
2.186861, -0.6444343, 1.459864, 1, 0, 0.1137255, 1,
2.19488, -1.226919, 2.819679, 1, 0, 0.1098039, 1,
2.202931, -0.2789415, 1.228592, 1, 0, 0.1019608, 1,
2.236377, -0.04047918, 0.8757513, 1, 0, 0.09411765, 1,
2.344193, 0.1110512, 0.1704603, 1, 0, 0.09019608, 1,
2.349194, -0.469243, 2.429842, 1, 0, 0.08235294, 1,
2.359027, -0.8489566, 2.197474, 1, 0, 0.07843138, 1,
2.365639, 0.7380027, 1.486202, 1, 0, 0.07058824, 1,
2.365663, 1.297157, 1.229894, 1, 0, 0.06666667, 1,
2.383936, -0.2873278, 3.195226, 1, 0, 0.05882353, 1,
2.415703, -0.2586083, 0.8194502, 1, 0, 0.05490196, 1,
2.426715, 0.2821791, 1.057843, 1, 0, 0.04705882, 1,
2.516473, 0.4458963, 1.547053, 1, 0, 0.04313726, 1,
2.561203, 1.181262, 1.724341, 1, 0, 0.03529412, 1,
2.595302, 0.8446937, 1.435742, 1, 0, 0.03137255, 1,
2.684288, -0.241816, 0.5210955, 1, 0, 0.02352941, 1,
2.874626, -0.9477235, 2.742608, 1, 0, 0.01960784, 1,
2.881752, -0.4966205, 2.392739, 1, 0, 0.01176471, 1,
2.913793, -0.5837377, 0.7569397, 1, 0, 0.007843138, 1
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
-0.09914482, -3.586406, -6.780455, 0, -0.5, 0.5, 0.5,
-0.09914482, -3.586406, -6.780455, 1, -0.5, 0.5, 0.5,
-0.09914482, -3.586406, -6.780455, 1, 1.5, 0.5, 0.5,
-0.09914482, -3.586406, -6.780455, 0, 1.5, 0.5, 0.5
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
-4.133468, 0.2476749, -6.780455, 0, -0.5, 0.5, 0.5,
-4.133468, 0.2476749, -6.780455, 1, -0.5, 0.5, 0.5,
-4.133468, 0.2476749, -6.780455, 1, 1.5, 0.5, 0.5,
-4.133468, 0.2476749, -6.780455, 0, 1.5, 0.5, 0.5
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
-4.133468, -3.586406, 0.3855774, 0, -0.5, 0.5, 0.5,
-4.133468, -3.586406, 0.3855774, 1, -0.5, 0.5, 0.5,
-4.133468, -3.586406, 0.3855774, 1, 1.5, 0.5, 0.5,
-4.133468, -3.586406, 0.3855774, 0, 1.5, 0.5, 0.5
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
-3, -2.701618, -5.126755,
2, -2.701618, -5.126755,
-3, -2.701618, -5.126755,
-3, -2.849083, -5.402372,
-2, -2.701618, -5.126755,
-2, -2.849083, -5.402372,
-1, -2.701618, -5.126755,
-1, -2.849083, -5.402372,
0, -2.701618, -5.126755,
0, -2.849083, -5.402372,
1, -2.701618, -5.126755,
1, -2.849083, -5.402372,
2, -2.701618, -5.126755,
2, -2.849083, -5.402372
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
-3, -3.144012, -5.953605, 0, -0.5, 0.5, 0.5,
-3, -3.144012, -5.953605, 1, -0.5, 0.5, 0.5,
-3, -3.144012, -5.953605, 1, 1.5, 0.5, 0.5,
-3, -3.144012, -5.953605, 0, 1.5, 0.5, 0.5,
-2, -3.144012, -5.953605, 0, -0.5, 0.5, 0.5,
-2, -3.144012, -5.953605, 1, -0.5, 0.5, 0.5,
-2, -3.144012, -5.953605, 1, 1.5, 0.5, 0.5,
-2, -3.144012, -5.953605, 0, 1.5, 0.5, 0.5,
-1, -3.144012, -5.953605, 0, -0.5, 0.5, 0.5,
-1, -3.144012, -5.953605, 1, -0.5, 0.5, 0.5,
-1, -3.144012, -5.953605, 1, 1.5, 0.5, 0.5,
-1, -3.144012, -5.953605, 0, 1.5, 0.5, 0.5,
0, -3.144012, -5.953605, 0, -0.5, 0.5, 0.5,
0, -3.144012, -5.953605, 1, -0.5, 0.5, 0.5,
0, -3.144012, -5.953605, 1, 1.5, 0.5, 0.5,
0, -3.144012, -5.953605, 0, 1.5, 0.5, 0.5,
1, -3.144012, -5.953605, 0, -0.5, 0.5, 0.5,
1, -3.144012, -5.953605, 1, -0.5, 0.5, 0.5,
1, -3.144012, -5.953605, 1, 1.5, 0.5, 0.5,
1, -3.144012, -5.953605, 0, 1.5, 0.5, 0.5,
2, -3.144012, -5.953605, 0, -0.5, 0.5, 0.5,
2, -3.144012, -5.953605, 1, -0.5, 0.5, 0.5,
2, -3.144012, -5.953605, 1, 1.5, 0.5, 0.5,
2, -3.144012, -5.953605, 0, 1.5, 0.5, 0.5
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
-3.202471, -2, -5.126755,
-3.202471, 3, -5.126755,
-3.202471, -2, -5.126755,
-3.357637, -2, -5.402372,
-3.202471, -1, -5.126755,
-3.357637, -1, -5.402372,
-3.202471, 0, -5.126755,
-3.357637, 0, -5.402372,
-3.202471, 1, -5.126755,
-3.357637, 1, -5.402372,
-3.202471, 2, -5.126755,
-3.357637, 2, -5.402372,
-3.202471, 3, -5.126755,
-3.357637, 3, -5.402372
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
-3.667969, -2, -5.953605, 0, -0.5, 0.5, 0.5,
-3.667969, -2, -5.953605, 1, -0.5, 0.5, 0.5,
-3.667969, -2, -5.953605, 1, 1.5, 0.5, 0.5,
-3.667969, -2, -5.953605, 0, 1.5, 0.5, 0.5,
-3.667969, -1, -5.953605, 0, -0.5, 0.5, 0.5,
-3.667969, -1, -5.953605, 1, -0.5, 0.5, 0.5,
-3.667969, -1, -5.953605, 1, 1.5, 0.5, 0.5,
-3.667969, -1, -5.953605, 0, 1.5, 0.5, 0.5,
-3.667969, 0, -5.953605, 0, -0.5, 0.5, 0.5,
-3.667969, 0, -5.953605, 1, -0.5, 0.5, 0.5,
-3.667969, 0, -5.953605, 1, 1.5, 0.5, 0.5,
-3.667969, 0, -5.953605, 0, 1.5, 0.5, 0.5,
-3.667969, 1, -5.953605, 0, -0.5, 0.5, 0.5,
-3.667969, 1, -5.953605, 1, -0.5, 0.5, 0.5,
-3.667969, 1, -5.953605, 1, 1.5, 0.5, 0.5,
-3.667969, 1, -5.953605, 0, 1.5, 0.5, 0.5,
-3.667969, 2, -5.953605, 0, -0.5, 0.5, 0.5,
-3.667969, 2, -5.953605, 1, -0.5, 0.5, 0.5,
-3.667969, 2, -5.953605, 1, 1.5, 0.5, 0.5,
-3.667969, 2, -5.953605, 0, 1.5, 0.5, 0.5,
-3.667969, 3, -5.953605, 0, -0.5, 0.5, 0.5,
-3.667969, 3, -5.953605, 1, -0.5, 0.5, 0.5,
-3.667969, 3, -5.953605, 1, 1.5, 0.5, 0.5,
-3.667969, 3, -5.953605, 0, 1.5, 0.5, 0.5
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
-3.202471, -2.701618, -4,
-3.202471, -2.701618, 4,
-3.202471, -2.701618, -4,
-3.357637, -2.849083, -4,
-3.202471, -2.701618, -2,
-3.357637, -2.849083, -2,
-3.202471, -2.701618, 0,
-3.357637, -2.849083, 0,
-3.202471, -2.701618, 2,
-3.357637, -2.849083, 2,
-3.202471, -2.701618, 4,
-3.357637, -2.849083, 4
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
-3.667969, -3.144012, -4, 0, -0.5, 0.5, 0.5,
-3.667969, -3.144012, -4, 1, -0.5, 0.5, 0.5,
-3.667969, -3.144012, -4, 1, 1.5, 0.5, 0.5,
-3.667969, -3.144012, -4, 0, 1.5, 0.5, 0.5,
-3.667969, -3.144012, -2, 0, -0.5, 0.5, 0.5,
-3.667969, -3.144012, -2, 1, -0.5, 0.5, 0.5,
-3.667969, -3.144012, -2, 1, 1.5, 0.5, 0.5,
-3.667969, -3.144012, -2, 0, 1.5, 0.5, 0.5,
-3.667969, -3.144012, 0, 0, -0.5, 0.5, 0.5,
-3.667969, -3.144012, 0, 1, -0.5, 0.5, 0.5,
-3.667969, -3.144012, 0, 1, 1.5, 0.5, 0.5,
-3.667969, -3.144012, 0, 0, 1.5, 0.5, 0.5,
-3.667969, -3.144012, 2, 0, -0.5, 0.5, 0.5,
-3.667969, -3.144012, 2, 1, -0.5, 0.5, 0.5,
-3.667969, -3.144012, 2, 1, 1.5, 0.5, 0.5,
-3.667969, -3.144012, 2, 0, 1.5, 0.5, 0.5,
-3.667969, -3.144012, 4, 0, -0.5, 0.5, 0.5,
-3.667969, -3.144012, 4, 1, -0.5, 0.5, 0.5,
-3.667969, -3.144012, 4, 1, 1.5, 0.5, 0.5,
-3.667969, -3.144012, 4, 0, 1.5, 0.5, 0.5
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
-3.202471, -2.701618, -5.126755,
-3.202471, 3.196968, -5.126755,
-3.202471, -2.701618, 5.89791,
-3.202471, 3.196968, 5.89791,
-3.202471, -2.701618, -5.126755,
-3.202471, -2.701618, 5.89791,
-3.202471, 3.196968, -5.126755,
-3.202471, 3.196968, 5.89791,
-3.202471, -2.701618, -5.126755,
3.004181, -2.701618, -5.126755,
-3.202471, -2.701618, 5.89791,
3.004181, -2.701618, 5.89791,
-3.202471, 3.196968, -5.126755,
3.004181, 3.196968, -5.126755,
-3.202471, 3.196968, 5.89791,
3.004181, 3.196968, 5.89791,
3.004181, -2.701618, -5.126755,
3.004181, 3.196968, -5.126755,
3.004181, -2.701618, 5.89791,
3.004181, 3.196968, 5.89791,
3.004181, -2.701618, -5.126755,
3.004181, -2.701618, 5.89791,
3.004181, 3.196968, -5.126755,
3.004181, 3.196968, 5.89791
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
var radius = 7.453938;
var distance = 33.16341;
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
mvMatrix.translate( 0.09914482, -0.2476749, -0.3855774 );
mvMatrix.scale( 1.298501, 1.366318, 0.7310285 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.16341);
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
propargyl_bromide_pr<-read.table("propargyl_bromide_pr.xyz")
```

```
## Error in read.table("propargyl_bromide_pr.xyz"): no lines available in input
```

```r
x<-propargyl_bromide_pr$V2
```

```
## Error in eval(expr, envir, enclos): object 'propargyl_bromide_pr' not found
```

```r
y<-propargyl_bromide_pr$V3
```

```
## Error in eval(expr, envir, enclos): object 'propargyl_bromide_pr' not found
```

```r
z<-propargyl_bromide_pr$V4
```

```
## Error in eval(expr, envir, enclos): object 'propargyl_bromide_pr' not found
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
-3.112082, 0.008360971, -0.7605471, 0, 0, 1, 1, 1,
-3.004017, 1.213577, -0.9186357, 1, 0, 0, 1, 1,
-2.979054, 0.01454606, 0.719436, 1, 0, 0, 1, 1,
-2.811774, -0.5513934, -1.691096, 1, 0, 0, 1, 1,
-2.760491, 0.02567768, 0.04960835, 1, 0, 0, 1, 1,
-2.744516, 0.2189559, -1.179735, 1, 0, 0, 1, 1,
-2.565726, -0.174912, -1.42857, 0, 0, 0, 1, 1,
-2.526988, 0.7053893, -1.087082, 0, 0, 0, 1, 1,
-2.464783, 0.4768567, -2.350019, 0, 0, 0, 1, 1,
-2.443006, -0.3614088, 1.259804, 0, 0, 0, 1, 1,
-2.420723, -1.298934, -4.062346, 0, 0, 0, 1, 1,
-2.410554, -1.259344, -3.476413, 0, 0, 0, 1, 1,
-2.295691, -0.9180473, -3.943705, 0, 0, 0, 1, 1,
-2.258606, 0.1657372, -2.467502, 1, 1, 1, 1, 1,
-2.152916, 0.6864815, -2.198927, 1, 1, 1, 1, 1,
-2.120799, -1.834351, -0.7052901, 1, 1, 1, 1, 1,
-2.08934, -0.4804733, -0.3781435, 1, 1, 1, 1, 1,
-2.086138, -0.7755143, -2.819253, 1, 1, 1, 1, 1,
-2.054639, -1.270463, -2.174783, 1, 1, 1, 1, 1,
-2.023147, -1.365806, -1.445938, 1, 1, 1, 1, 1,
-2.010342, -0.5529122, -2.151482, 1, 1, 1, 1, 1,
-1.995467, 0.1478847, -2.236077, 1, 1, 1, 1, 1,
-1.967394, -1.244796, -0.9809521, 1, 1, 1, 1, 1,
-1.963662, 1.571796, -2.390218, 1, 1, 1, 1, 1,
-1.961455, -0.1224915, -0.9829939, 1, 1, 1, 1, 1,
-1.916808, -1.156737, -1.16472, 1, 1, 1, 1, 1,
-1.906918, -0.358725, -1.991865, 1, 1, 1, 1, 1,
-1.906874, 0.06251158, -0.5482596, 1, 1, 1, 1, 1,
-1.899273, 0.8133476, -2.97873, 0, 0, 1, 1, 1,
-1.886708, 0.5701194, -2.699053, 1, 0, 0, 1, 1,
-1.880898, -0.6285, -1.579797, 1, 0, 0, 1, 1,
-1.87834, 1.043646, -1.542036, 1, 0, 0, 1, 1,
-1.875486, -0.7832238, -1.672048, 1, 0, 0, 1, 1,
-1.867508, 1.095869, -1.081301, 1, 0, 0, 1, 1,
-1.866984, 0.5777618, -0.2550474, 0, 0, 0, 1, 1,
-1.859185, 0.6971887, -2.096026, 0, 0, 0, 1, 1,
-1.847123, 0.4070848, -1.052569, 0, 0, 0, 1, 1,
-1.840073, -0.4969578, -1.247837, 0, 0, 0, 1, 1,
-1.835985, -0.7769022, -2.944381, 0, 0, 0, 1, 1,
-1.814197, -0.01729728, -2.850286, 0, 0, 0, 1, 1,
-1.807244, -0.7557176, -1.20393, 0, 0, 0, 1, 1,
-1.796472, -2.357697, -0.1050581, 1, 1, 1, 1, 1,
-1.791464, -0.2659924, -0.6792545, 1, 1, 1, 1, 1,
-1.787098, -1.131715, -2.019608, 1, 1, 1, 1, 1,
-1.775779, -1.333005, -1.949048, 1, 1, 1, 1, 1,
-1.747202, 0.2507994, -2.175151, 1, 1, 1, 1, 1,
-1.726422, 0.4189852, -1.547181, 1, 1, 1, 1, 1,
-1.722419, 0.5288786, -2.095997, 1, 1, 1, 1, 1,
-1.695303, -1.147579, -2.405059, 1, 1, 1, 1, 1,
-1.693942, -0.3114955, -2.566639, 1, 1, 1, 1, 1,
-1.691206, 2.944104, -1.554244, 1, 1, 1, 1, 1,
-1.675739, -1.603834, -2.507682, 1, 1, 1, 1, 1,
-1.670431, 0.5474551, -1.417967, 1, 1, 1, 1, 1,
-1.670336, -0.2523081, -1.622455, 1, 1, 1, 1, 1,
-1.664132, 0.2606365, 0.2328467, 1, 1, 1, 1, 1,
-1.663328, 0.3204667, -4.173378, 1, 1, 1, 1, 1,
-1.660407, 1.481449, -0.4071603, 0, 0, 1, 1, 1,
-1.654308, 0.7380888, -1.555816, 1, 0, 0, 1, 1,
-1.648617, 1.093214, -0.8561216, 1, 0, 0, 1, 1,
-1.643608, 0.6520944, -0.6218218, 1, 0, 0, 1, 1,
-1.636433, 2.007851, 0.2042619, 1, 0, 0, 1, 1,
-1.61767, -0.6862631, -3.007152, 1, 0, 0, 1, 1,
-1.616752, 0.6283128, -0.4846623, 0, 0, 0, 1, 1,
-1.611288, 0.03521794, -3.373219, 0, 0, 0, 1, 1,
-1.60909, 1.623521, 0.5788885, 0, 0, 0, 1, 1,
-1.59982, -0.9039417, -2.927521, 0, 0, 0, 1, 1,
-1.59969, -0.01038519, -1.069697, 0, 0, 0, 1, 1,
-1.594198, -0.09552915, -0.4932075, 0, 0, 0, 1, 1,
-1.584711, -0.7703453, -2.92879, 0, 0, 0, 1, 1,
-1.575602, -0.6780127, -2.190719, 1, 1, 1, 1, 1,
-1.574432, 1.990498, -1.706685, 1, 1, 1, 1, 1,
-1.560796, -0.7763058, -2.893112, 1, 1, 1, 1, 1,
-1.55455, -0.1786944, -2.76712, 1, 1, 1, 1, 1,
-1.548479, 0.5162349, -0.4800157, 1, 1, 1, 1, 1,
-1.543865, 0.2994133, -0.4464083, 1, 1, 1, 1, 1,
-1.538132, 0.7545088, -0.9694016, 1, 1, 1, 1, 1,
-1.536942, -0.9520342, -2.667272, 1, 1, 1, 1, 1,
-1.533803, 2.351336, -0.8929591, 1, 1, 1, 1, 1,
-1.532369, 0.4695246, -1.613177, 1, 1, 1, 1, 1,
-1.530674, -0.001572471, -2.109031, 1, 1, 1, 1, 1,
-1.52636, 0.3230453, -2.988501, 1, 1, 1, 1, 1,
-1.492362, 0.9619359, -0.4286434, 1, 1, 1, 1, 1,
-1.490772, 0.01337558, -2.085832, 1, 1, 1, 1, 1,
-1.484375, -0.2998313, -1.90715, 1, 1, 1, 1, 1,
-1.483927, 0.8650415, -1.68036, 0, 0, 1, 1, 1,
-1.477496, -0.2554587, -0.6034621, 1, 0, 0, 1, 1,
-1.467188, 1.521136, 0.6482388, 1, 0, 0, 1, 1,
-1.465145, -0.5258728, -1.962017, 1, 0, 0, 1, 1,
-1.461654, -0.2115831, -0.8141832, 1, 0, 0, 1, 1,
-1.458834, 1.203221, -1.049622, 1, 0, 0, 1, 1,
-1.45558, -0.3736098, -2.794931, 0, 0, 0, 1, 1,
-1.452953, -0.3627276, -2.258923, 0, 0, 0, 1, 1,
-1.445235, -0.4717055, -3.263696, 0, 0, 0, 1, 1,
-1.438739, -1.156344, -2.158445, 0, 0, 0, 1, 1,
-1.435015, -0.1922876, -1.770046, 0, 0, 0, 1, 1,
-1.430901, -1.109545, -3.182041, 0, 0, 0, 1, 1,
-1.423558, 1.174876, -0.5192889, 0, 0, 0, 1, 1,
-1.412476, 0.7717869, -2.220964, 1, 1, 1, 1, 1,
-1.409534, 1.164306, -0.8366392, 1, 1, 1, 1, 1,
-1.408163, 1.920258, -1.098952, 1, 1, 1, 1, 1,
-1.406018, -1.836326, -1.394173, 1, 1, 1, 1, 1,
-1.404613, 1.107734, 0.196713, 1, 1, 1, 1, 1,
-1.39942, 0.5400857, -1.883459, 1, 1, 1, 1, 1,
-1.389525, 1.175773, -3.312985, 1, 1, 1, 1, 1,
-1.379095, -0.3757966, -0.4879507, 1, 1, 1, 1, 1,
-1.370077, -0.7902162, -0.05486211, 1, 1, 1, 1, 1,
-1.365914, -0.5792125, -1.844798, 1, 1, 1, 1, 1,
-1.363521, -0.3026714, -2.35096, 1, 1, 1, 1, 1,
-1.352461, -1.05871, -2.476783, 1, 1, 1, 1, 1,
-1.348433, -1.013896, -3.427987, 1, 1, 1, 1, 1,
-1.348192, 1.118228, -0.8362673, 1, 1, 1, 1, 1,
-1.34358, -1.399301, -1.986068, 1, 1, 1, 1, 1,
-1.340821, 0.05290175, 0.0722862, 0, 0, 1, 1, 1,
-1.336873, -0.628847, -2.656013, 1, 0, 0, 1, 1,
-1.327233, -0.1588252, -1.711913, 1, 0, 0, 1, 1,
-1.319279, 1.849088, -0.8798224, 1, 0, 0, 1, 1,
-1.312383, 1.014278, -2.036418, 1, 0, 0, 1, 1,
-1.310532, -1.3965, -3.229901, 1, 0, 0, 1, 1,
-1.288306, 0.1570168, -2.249455, 0, 0, 0, 1, 1,
-1.28092, -0.6011686, -2.533592, 0, 0, 0, 1, 1,
-1.280063, 1.774939, -2.277922, 0, 0, 0, 1, 1,
-1.279693, -0.06326174, -2.099952, 0, 0, 0, 1, 1,
-1.274625, -0.4893634, -1.020866, 0, 0, 0, 1, 1,
-1.273209, 0.5506654, -0.9022343, 0, 0, 0, 1, 1,
-1.269182, -1.190086, -0.9156448, 0, 0, 0, 1, 1,
-1.265168, 2.639456, 0.8866696, 1, 1, 1, 1, 1,
-1.263832, -0.5205277, -3.487, 1, 1, 1, 1, 1,
-1.260094, -2.089543, -3.624351, 1, 1, 1, 1, 1,
-1.257026, 1.260534, -2.598777, 1, 1, 1, 1, 1,
-1.251647, -0.2423543, -3.401582, 1, 1, 1, 1, 1,
-1.249908, 0.3483484, -1.328907, 1, 1, 1, 1, 1,
-1.246949, 1.630071, -0.3027425, 1, 1, 1, 1, 1,
-1.232274, -1.332326, -1.397713, 1, 1, 1, 1, 1,
-1.224589, 0.4767135, 0.6157486, 1, 1, 1, 1, 1,
-1.221432, -1.385919, -3.251678, 1, 1, 1, 1, 1,
-1.214716, 1.783585, 0.04598254, 1, 1, 1, 1, 1,
-1.203117, 0.1892918, -1.289741, 1, 1, 1, 1, 1,
-1.200268, -1.625654, -3.616859, 1, 1, 1, 1, 1,
-1.18903, 0.1372335, -0.535148, 1, 1, 1, 1, 1,
-1.174056, 0.67929, -2.064416, 1, 1, 1, 1, 1,
-1.171762, -1.045743, -1.551551, 0, 0, 1, 1, 1,
-1.166981, -1.090834, -0.7088944, 1, 0, 0, 1, 1,
-1.165363, -0.8186761, -2.378327, 1, 0, 0, 1, 1,
-1.157473, -0.263767, -2.438214, 1, 0, 0, 1, 1,
-1.154033, 0.7523541, 0.2240633, 1, 0, 0, 1, 1,
-1.147384, 1.409308, -0.797142, 1, 0, 0, 1, 1,
-1.145013, 0.3041456, -1.095536, 0, 0, 0, 1, 1,
-1.133445, 0.3373855, -0.7508151, 0, 0, 0, 1, 1,
-1.133327, -1.087823, -1.943836, 0, 0, 0, 1, 1,
-1.131038, 0.1879954, -2.396017, 0, 0, 0, 1, 1,
-1.129261, 0.272554, -0.66001, 0, 0, 0, 1, 1,
-1.127263, -0.2967257, -2.504248, 0, 0, 0, 1, 1,
-1.120748, 0.5475233, -1.121994, 0, 0, 0, 1, 1,
-1.118818, -0.51978, -0.90632, 1, 1, 1, 1, 1,
-1.08763, -1.27219, -4.810346, 1, 1, 1, 1, 1,
-1.085617, -0.5799249, -2.325895, 1, 1, 1, 1, 1,
-1.07577, 0.4906065, -1.900822, 1, 1, 1, 1, 1,
-1.075148, 1.442021, -0.2441079, 1, 1, 1, 1, 1,
-1.069497, 1.170596, 0.9857469, 1, 1, 1, 1, 1,
-1.068948, 0.4420421, 0.1040769, 1, 1, 1, 1, 1,
-1.065835, -0.1546516, -1.902412, 1, 1, 1, 1, 1,
-1.059109, -0.66482, -0.9001386, 1, 1, 1, 1, 1,
-1.050436, 0.1696295, -2.151824, 1, 1, 1, 1, 1,
-1.049834, 0.7006505, 0.148067, 1, 1, 1, 1, 1,
-1.04422, -0.3651671, -1.943369, 1, 1, 1, 1, 1,
-1.040765, 0.03635304, -1.741529, 1, 1, 1, 1, 1,
-1.030453, 1.378916, -0.912728, 1, 1, 1, 1, 1,
-1.027124, -1.320545, -2.560858, 1, 1, 1, 1, 1,
-1.010758, -0.9296607, -3.063118, 0, 0, 1, 1, 1,
-1.009848, -0.140146, -1.334649, 1, 0, 0, 1, 1,
-1.006887, 0.494163, -0.07226193, 1, 0, 0, 1, 1,
-0.9995824, 1.837938, 0.3074212, 1, 0, 0, 1, 1,
-0.9951205, 0.313104, -1.862367, 1, 0, 0, 1, 1,
-0.995053, 0.3666708, -1.534002, 1, 0, 0, 1, 1,
-0.9862446, 0.6705554, -0.1865749, 0, 0, 0, 1, 1,
-0.9848162, 0.5715802, -1.694681, 0, 0, 0, 1, 1,
-0.9807269, 2.321156, -0.8807629, 0, 0, 0, 1, 1,
-0.9757019, 1.323111, -0.5201185, 0, 0, 0, 1, 1,
-0.9656655, 0.04695067, -1.201161, 0, 0, 0, 1, 1,
-0.9656137, -0.06455445, 0.6834727, 0, 0, 0, 1, 1,
-0.9652859, -0.09475025, -1.273259, 0, 0, 0, 1, 1,
-0.9641803, 1.035773, -0.7510876, 1, 1, 1, 1, 1,
-0.9518011, -1.042397, -3.125808, 1, 1, 1, 1, 1,
-0.9464445, -1.158377, -3.462845, 1, 1, 1, 1, 1,
-0.9415144, 0.06591068, -1.860653, 1, 1, 1, 1, 1,
-0.9410288, -0.3253527, -1.685699, 1, 1, 1, 1, 1,
-0.9388704, -1.047238, -1.550125, 1, 1, 1, 1, 1,
-0.9369966, -0.9341326, -1.512253, 1, 1, 1, 1, 1,
-0.9322374, 0.01802079, -2.025303, 1, 1, 1, 1, 1,
-0.9312338, -0.7951567, -2.356142, 1, 1, 1, 1, 1,
-0.9294547, 1.410209, 0.232284, 1, 1, 1, 1, 1,
-0.9254146, -0.1226799, -1.327361, 1, 1, 1, 1, 1,
-0.9223452, 0.337723, -1.566221, 1, 1, 1, 1, 1,
-0.915856, 1.097222, -0.643166, 1, 1, 1, 1, 1,
-0.9059275, -0.1110076, -1.349147, 1, 1, 1, 1, 1,
-0.8996705, 2.388766, -0.8645381, 1, 1, 1, 1, 1,
-0.8960871, 0.5672703, 1.017412, 0, 0, 1, 1, 1,
-0.8960332, -0.7516292, -4.232442, 1, 0, 0, 1, 1,
-0.8905699, -0.6078298, -2.418079, 1, 0, 0, 1, 1,
-0.8891839, 0.20669, 0.6869637, 1, 0, 0, 1, 1,
-0.8875948, -0.8072863, -2.695258, 1, 0, 0, 1, 1,
-0.8815205, 1.566243, 0.5654396, 1, 0, 0, 1, 1,
-0.8741581, 0.1614971, -0.3755006, 0, 0, 0, 1, 1,
-0.8740759, 1.755069, -2.049041, 0, 0, 0, 1, 1,
-0.8713981, 0.00191203, -1.079414, 0, 0, 0, 1, 1,
-0.8630521, -0.7850506, -1.944307, 0, 0, 0, 1, 1,
-0.8618674, -0.7382343, -3.352477, 0, 0, 0, 1, 1,
-0.8612471, -1.852529, -3.841798, 0, 0, 0, 1, 1,
-0.861041, -0.7631878, -1.354944, 0, 0, 0, 1, 1,
-0.8586314, -0.3446358, -0.4956696, 1, 1, 1, 1, 1,
-0.8584062, -0.1356247, 0.2889966, 1, 1, 1, 1, 1,
-0.8539031, -0.4458857, -0.7834817, 1, 1, 1, 1, 1,
-0.8485213, 0.185482, -2.704782, 1, 1, 1, 1, 1,
-0.8453308, -1.253161, -2.374402, 1, 1, 1, 1, 1,
-0.8430371, 0.03885067, -2.965212, 1, 1, 1, 1, 1,
-0.842921, -0.6122648, -0.7332198, 1, 1, 1, 1, 1,
-0.8429095, -1.981667, -3.37388, 1, 1, 1, 1, 1,
-0.8410128, 0.5566559, -1.669531, 1, 1, 1, 1, 1,
-0.8404004, -0.1879863, -1.876154, 1, 1, 1, 1, 1,
-0.8357338, -2.394877, -3.922731, 1, 1, 1, 1, 1,
-0.8343447, 0.6255494, -0.598538, 1, 1, 1, 1, 1,
-0.8250295, -0.9630369, -2.782857, 1, 1, 1, 1, 1,
-0.8166706, -0.3024979, -3.322717, 1, 1, 1, 1, 1,
-0.8109995, 2.751024, 0.407239, 1, 1, 1, 1, 1,
-0.8093672, 1.179678, -2.748593, 0, 0, 1, 1, 1,
-0.8088889, 0.840841, -1.691443, 1, 0, 0, 1, 1,
-0.8041415, -1.013212, -1.556953, 1, 0, 0, 1, 1,
-0.7913938, 0.7259611, -1.744337, 1, 0, 0, 1, 1,
-0.7907302, 1.414726, -2.469196, 1, 0, 0, 1, 1,
-0.7901546, 1.088516, -0.933813, 1, 0, 0, 1, 1,
-0.7873723, -0.736757, -2.576232, 0, 0, 0, 1, 1,
-0.7850555, -0.919915, -1.766169, 0, 0, 0, 1, 1,
-0.7755862, 0.8764322, 0.1860272, 0, 0, 0, 1, 1,
-0.7743927, 0.5543955, -1.579368, 0, 0, 0, 1, 1,
-0.7738658, -0.7107142, -0.7560524, 0, 0, 0, 1, 1,
-0.7732335, 0.1799659, -2.078336, 0, 0, 0, 1, 1,
-0.7719371, -1.111373, -2.342839, 0, 0, 0, 1, 1,
-0.767785, 0.8240668, -1.555525, 1, 1, 1, 1, 1,
-0.7635021, 0.6997938, -1.486527, 1, 1, 1, 1, 1,
-0.7621213, 0.5624536, -1.674704, 1, 1, 1, 1, 1,
-0.7617118, 0.9923864, -0.4433894, 1, 1, 1, 1, 1,
-0.7595012, -0.3179128, -1.048102, 1, 1, 1, 1, 1,
-0.7554503, -0.6301875, -2.750027, 1, 1, 1, 1, 1,
-0.7536468, 0.3627067, -2.528917, 1, 1, 1, 1, 1,
-0.7527466, 0.4673165, -1.521011, 1, 1, 1, 1, 1,
-0.7524791, 0.1677762, -0.6249843, 1, 1, 1, 1, 1,
-0.7476797, -1.425101, -0.5597495, 1, 1, 1, 1, 1,
-0.7472717, -0.895654, -1.326083, 1, 1, 1, 1, 1,
-0.7422289, 0.8581167, -0.0603896, 1, 1, 1, 1, 1,
-0.741134, -1.159602, -2.352865, 1, 1, 1, 1, 1,
-0.7410542, 0.3387906, -0.1798169, 1, 1, 1, 1, 1,
-0.7314833, 0.8562469, -0.2575944, 1, 1, 1, 1, 1,
-0.72446, 0.5359775, -0.7774106, 0, 0, 1, 1, 1,
-0.7223345, 0.1049211, 0.5279516, 1, 0, 0, 1, 1,
-0.7215049, 0.4920155, -0.4245236, 1, 0, 0, 1, 1,
-0.720962, -0.6130546, -0.9955178, 1, 0, 0, 1, 1,
-0.7171841, 0.08143325, -1.383592, 1, 0, 0, 1, 1,
-0.7162657, 1.541841, 0.3749315, 1, 0, 0, 1, 1,
-0.7153084, -0.5602459, -1.022994, 0, 0, 0, 1, 1,
-0.7143465, -0.5828686, -3.764973, 0, 0, 0, 1, 1,
-0.7143292, 0.4101645, -0.552115, 0, 0, 0, 1, 1,
-0.7118356, 2.716534, -1.142285, 0, 0, 0, 1, 1,
-0.7092885, -0.05806428, -0.6755967, 0, 0, 0, 1, 1,
-0.7060474, 1.641937, 0.5281554, 0, 0, 0, 1, 1,
-0.7053065, 0.420324, -2.069246, 0, 0, 0, 1, 1,
-0.7015165, 0.1166475, -0.9570344, 1, 1, 1, 1, 1,
-0.6954707, 0.9592227, -1.631896, 1, 1, 1, 1, 1,
-0.6868494, 2.004522, -0.2099954, 1, 1, 1, 1, 1,
-0.6719642, -0.3438389, -2.317229, 1, 1, 1, 1, 1,
-0.6683192, -1.898782, -3.178817, 1, 1, 1, 1, 1,
-0.6667862, -1.066086, -2.891181, 1, 1, 1, 1, 1,
-0.6631827, 1.423616, -0.4718069, 1, 1, 1, 1, 1,
-0.6618276, -0.3213594, -0.2500608, 1, 1, 1, 1, 1,
-0.660423, -0.007921753, -2.252833, 1, 1, 1, 1, 1,
-0.6503043, 0.0548621, -2.733411, 1, 1, 1, 1, 1,
-0.6474042, 0.5214137, -0.276915, 1, 1, 1, 1, 1,
-0.6473156, 0.0096204, -2.513332, 1, 1, 1, 1, 1,
-0.6455823, 0.2105685, -2.801205, 1, 1, 1, 1, 1,
-0.645253, -1.096535, -1.691106, 1, 1, 1, 1, 1,
-0.6440311, -0.03190377, -1.430344, 1, 1, 1, 1, 1,
-0.6422796, 0.4901081, -0.7516587, 0, 0, 1, 1, 1,
-0.6418328, 1.12689, 0.3023798, 1, 0, 0, 1, 1,
-0.6418298, -0.2482423, -2.858483, 1, 0, 0, 1, 1,
-0.6403472, 0.8292028, -1.260195, 1, 0, 0, 1, 1,
-0.6362006, -0.2408502, -1.865703, 1, 0, 0, 1, 1,
-0.6309947, -0.8088324, -2.212914, 1, 0, 0, 1, 1,
-0.6232305, -0.001071252, -1.375613, 0, 0, 0, 1, 1,
-0.6137468, 0.477025, -2.102786, 0, 0, 0, 1, 1,
-0.6133377, -0.2699318, -2.164482, 0, 0, 0, 1, 1,
-0.6119112, 0.8921394, -0.2350799, 0, 0, 0, 1, 1,
-0.6057315, 1.612097, 0.8412836, 0, 0, 0, 1, 1,
-0.605083, 0.3011061, -0.07105005, 0, 0, 0, 1, 1,
-0.5995297, -0.5471479, -3.445091, 0, 0, 0, 1, 1,
-0.5987287, -1.801661, -3.037948, 1, 1, 1, 1, 1,
-0.5965288, -0.7634676, -3.151629, 1, 1, 1, 1, 1,
-0.59646, -1.33691, -2.809069, 1, 1, 1, 1, 1,
-0.5947984, 0.6865206, -2.812803, 1, 1, 1, 1, 1,
-0.5892459, -0.7333872, -1.993784, 1, 1, 1, 1, 1,
-0.5877513, -0.7915303, -2.1302, 1, 1, 1, 1, 1,
-0.5875851, 1.261081, 0.6837009, 1, 1, 1, 1, 1,
-0.5867819, -2.113327, -2.265734, 1, 1, 1, 1, 1,
-0.578647, 0.7959075, 0.5493073, 1, 1, 1, 1, 1,
-0.5731542, 1.926651, -0.6810837, 1, 1, 1, 1, 1,
-0.5683945, -1.863899, -3.210246, 1, 1, 1, 1, 1,
-0.5682366, 1.051319, 0.6687295, 1, 1, 1, 1, 1,
-0.5665234, 0.8932695, 0.6639223, 1, 1, 1, 1, 1,
-0.5646132, -0.8048686, -2.64707, 1, 1, 1, 1, 1,
-0.5615358, 0.2744891, -1.539207, 1, 1, 1, 1, 1,
-0.5598164, 0.5844194, -1.982514, 0, 0, 1, 1, 1,
-0.553122, 0.7304365, -0.5783954, 1, 0, 0, 1, 1,
-0.5530136, 0.04283502, -2.659283, 1, 0, 0, 1, 1,
-0.5516763, -0.9280699, -4.861027, 1, 0, 0, 1, 1,
-0.5488734, 1.347685, -0.09283176, 1, 0, 0, 1, 1,
-0.5438997, -0.06748112, -3.340284, 1, 0, 0, 1, 1,
-0.5404897, 1.612047, 0.7863344, 0, 0, 0, 1, 1,
-0.5385121, 0.6128622, -1.248579, 0, 0, 0, 1, 1,
-0.5381294, -0.8177418, -2.258383, 0, 0, 0, 1, 1,
-0.535024, -0.5068271, -2.328365, 0, 0, 0, 1, 1,
-0.5350152, -1.871227, -3.259084, 0, 0, 0, 1, 1,
-0.534501, 0.3910663, -1.585239, 0, 0, 0, 1, 1,
-0.5338012, -0.08354955, -0.077032, 0, 0, 0, 1, 1,
-0.528405, -0.2782803, -1.978351, 1, 1, 1, 1, 1,
-0.5260612, 1.308378, 0.4476719, 1, 1, 1, 1, 1,
-0.5251582, -1.928471, -3.181681, 1, 1, 1, 1, 1,
-0.5171484, 0.3419417, -1.188457, 1, 1, 1, 1, 1,
-0.5164245, 1.355954, -0.3257651, 1, 1, 1, 1, 1,
-0.5131896, -1.383647, -2.652749, 1, 1, 1, 1, 1,
-0.5127305, 1.405329, -2.420706, 1, 1, 1, 1, 1,
-0.5104682, 0.5864235, -2.933911, 1, 1, 1, 1, 1,
-0.5102104, -0.7881087, -2.85194, 1, 1, 1, 1, 1,
-0.5094123, 1.52413, -1.083122, 1, 1, 1, 1, 1,
-0.5086988, 0.6398819, 0.1698428, 1, 1, 1, 1, 1,
-0.5074041, 0.4282859, -1.472124, 1, 1, 1, 1, 1,
-0.5027107, 0.2046634, -2.624433, 1, 1, 1, 1, 1,
-0.4997141, 0.3776985, -0.01800194, 1, 1, 1, 1, 1,
-0.4995158, -0.8336287, -1.647226, 1, 1, 1, 1, 1,
-0.4957531, -1.488364, -2.326547, 0, 0, 1, 1, 1,
-0.4955451, -0.2816669, -1.612806, 1, 0, 0, 1, 1,
-0.4927656, -1.450677, -1.711158, 1, 0, 0, 1, 1,
-0.4879647, -0.5632253, -2.965621, 1, 0, 0, 1, 1,
-0.4834879, 0.9007475, -0.7379882, 1, 0, 0, 1, 1,
-0.4800864, -1.165198, -1.86774, 1, 0, 0, 1, 1,
-0.4792853, 0.6572102, -0.7679253, 0, 0, 0, 1, 1,
-0.4712624, 0.3843816, -1.740962, 0, 0, 0, 1, 1,
-0.4655036, 1.494732, -1.13892, 0, 0, 0, 1, 1,
-0.4635239, -0.8665786, -2.650805, 0, 0, 0, 1, 1,
-0.4632693, -1.684986, -1.044367, 0, 0, 0, 1, 1,
-0.4620387, 0.6101441, -0.4305124, 0, 0, 0, 1, 1,
-0.4570178, 0.4955155, -0.3205343, 0, 0, 0, 1, 1,
-0.4539143, 0.5945122, -0.8636317, 1, 1, 1, 1, 1,
-0.4521488, 0.5943415, 0.1274247, 1, 1, 1, 1, 1,
-0.4513865, 0.04748552, -1.689855, 1, 1, 1, 1, 1,
-0.4494121, -0.7073066, -2.695969, 1, 1, 1, 1, 1,
-0.4488589, -1.16484, -2.4056, 1, 1, 1, 1, 1,
-0.4486921, -1.489406, -4.245044, 1, 1, 1, 1, 1,
-0.4473804, 1.035649, -0.5561543, 1, 1, 1, 1, 1,
-0.4434125, 0.05212419, -2.402956, 1, 1, 1, 1, 1,
-0.4408707, 0.03594872, -2.96991, 1, 1, 1, 1, 1,
-0.4380777, 0.1233559, -0.141507, 1, 1, 1, 1, 1,
-0.4350941, -1.265803, -4.679089, 1, 1, 1, 1, 1,
-0.4340462, -0.6559421, -2.192705, 1, 1, 1, 1, 1,
-0.4317821, -1.27401, -3.99549, 1, 1, 1, 1, 1,
-0.4257669, 0.5682821, -1.973452, 1, 1, 1, 1, 1,
-0.4247593, -0.06125363, -2.20258, 1, 1, 1, 1, 1,
-0.4187913, 0.3837861, 0.1598725, 0, 0, 1, 1, 1,
-0.4182427, 1.296156, 1.778201, 1, 0, 0, 1, 1,
-0.4165939, 0.8008958, 0.5356698, 1, 0, 0, 1, 1,
-0.4066156, -0.2561243, -3.07427, 1, 0, 0, 1, 1,
-0.4025291, 1.373692, 0.9915487, 1, 0, 0, 1, 1,
-0.393605, 0.03682319, -0.896492, 1, 0, 0, 1, 1,
-0.3929842, -0.3449099, -0.8837201, 0, 0, 0, 1, 1,
-0.3915884, -0.3226148, -2.868888, 0, 0, 0, 1, 1,
-0.388232, -0.9201002, -2.809743, 0, 0, 0, 1, 1,
-0.3849474, -0.6792292, -2.358679, 0, 0, 0, 1, 1,
-0.3807512, -0.219141, -2.403754, 0, 0, 0, 1, 1,
-0.3712735, 0.3177962, -1.175905, 0, 0, 0, 1, 1,
-0.3693375, 1.621238, 1.299893, 0, 0, 0, 1, 1,
-0.3664133, -2.059498, -3.475094, 1, 1, 1, 1, 1,
-0.3658791, -0.1459049, -1.614963, 1, 1, 1, 1, 1,
-0.3646245, 0.7549914, -0.4999889, 1, 1, 1, 1, 1,
-0.3637708, 1.9781, -0.702315, 1, 1, 1, 1, 1,
-0.3595144, 0.3585651, -1.015663, 1, 1, 1, 1, 1,
-0.3572142, 0.3058901, -0.3588857, 1, 1, 1, 1, 1,
-0.3560242, 0.08927482, -0.8401136, 1, 1, 1, 1, 1,
-0.3548083, -0.1112561, -1.193478, 1, 1, 1, 1, 1,
-0.3547256, -1.699843, -4.874607, 1, 1, 1, 1, 1,
-0.3523158, 0.2580403, 0.1650161, 1, 1, 1, 1, 1,
-0.3487223, 1.368134, -2.085104, 1, 1, 1, 1, 1,
-0.3460439, 0.3461738, -0.5095779, 1, 1, 1, 1, 1,
-0.3445644, -0.1096598, -2.573766, 1, 1, 1, 1, 1,
-0.3387555, -2.557849, -4.305645, 1, 1, 1, 1, 1,
-0.3386076, -1.020324, -2.799976, 1, 1, 1, 1, 1,
-0.3379384, 0.7337635, -1.539159, 0, 0, 1, 1, 1,
-0.333569, 0.8975013, -0.5416204, 1, 0, 0, 1, 1,
-0.3319713, -1.002399, -2.113141, 1, 0, 0, 1, 1,
-0.3254777, -0.1701358, -1.02918, 1, 0, 0, 1, 1,
-0.3244586, 1.228084, 1.04814, 1, 0, 0, 1, 1,
-0.3232028, 0.01664509, -1.1685, 1, 0, 0, 1, 1,
-0.3182629, 0.6575342, 0.1280979, 0, 0, 0, 1, 1,
-0.3172525, -0.8816515, -2.926764, 0, 0, 0, 1, 1,
-0.3169074, -0.8735543, -1.600634, 0, 0, 0, 1, 1,
-0.3127208, -0.2693479, -1.575211, 0, 0, 0, 1, 1,
-0.3069121, -0.1673449, -1.155463, 0, 0, 0, 1, 1,
-0.306604, 0.5723036, 1.633663, 0, 0, 0, 1, 1,
-0.3024297, 0.391571, 0.198748, 0, 0, 0, 1, 1,
-0.3023928, 0.06457061, -2.437231, 1, 1, 1, 1, 1,
-0.3021757, 0.4444228, -1.622833, 1, 1, 1, 1, 1,
-0.3016557, -0.7928196, -1.364722, 1, 1, 1, 1, 1,
-0.2959172, 1.224303, -0.2364263, 1, 1, 1, 1, 1,
-0.2932805, 0.3027142, -0.1279292, 1, 1, 1, 1, 1,
-0.2888394, -0.5916339, -3.56146, 1, 1, 1, 1, 1,
-0.2860145, 0.7024071, 0.5992539, 1, 1, 1, 1, 1,
-0.2823224, -0.4281024, -3.296663, 1, 1, 1, 1, 1,
-0.2784116, 0.4217891, 0.2422605, 1, 1, 1, 1, 1,
-0.277921, -0.237426, -2.596286, 1, 1, 1, 1, 1,
-0.2761835, 2.491191, 0.6789088, 1, 1, 1, 1, 1,
-0.2672682, -0.6521353, -3.621958, 1, 1, 1, 1, 1,
-0.2624935, -1.026015, -0.6890752, 1, 1, 1, 1, 1,
-0.2619429, -0.3788785, -0.9740077, 1, 1, 1, 1, 1,
-0.2616672, 1.046717, -0.03260393, 1, 1, 1, 1, 1,
-0.2599474, -0.1666466, -0.4511115, 0, 0, 1, 1, 1,
-0.2581561, 0.331086, -3.61448, 1, 0, 0, 1, 1,
-0.2524866, 1.297581, 0.6156732, 1, 0, 0, 1, 1,
-0.2507787, -0.9915237, -1.395241, 1, 0, 0, 1, 1,
-0.2501048, -0.1540535, -2.168221, 1, 0, 0, 1, 1,
-0.244146, 0.9055825, -0.7787876, 1, 0, 0, 1, 1,
-0.24383, -0.4531833, -2.544596, 0, 0, 0, 1, 1,
-0.2417447, 0.105005, -1.55336, 0, 0, 0, 1, 1,
-0.2357776, -0.6579582, -3.012182, 0, 0, 0, 1, 1,
-0.2348498, -0.1906732, -3.052356, 0, 0, 0, 1, 1,
-0.2310384, -0.2532175, -3.56187, 0, 0, 0, 1, 1,
-0.2305933, 0.1612823, -0.1477021, 0, 0, 0, 1, 1,
-0.2263062, -1.191349, -2.488805, 0, 0, 0, 1, 1,
-0.2243367, 1.024103, -0.7199893, 1, 1, 1, 1, 1,
-0.2203217, -0.06610767, -1.490662, 1, 1, 1, 1, 1,
-0.2196312, 0.9135897, 0.2032518, 1, 1, 1, 1, 1,
-0.2152522, -0.6786951, -0.7110353, 1, 1, 1, 1, 1,
-0.2141578, -0.4582697, -2.785226, 1, 1, 1, 1, 1,
-0.2113897, 0.4985362, 0.3968259, 1, 1, 1, 1, 1,
-0.2061021, -0.1989711, -3.852163, 1, 1, 1, 1, 1,
-0.205945, 1.279014, 1.166229, 1, 1, 1, 1, 1,
-0.2051976, 0.7737743, -0.1294914, 1, 1, 1, 1, 1,
-0.2043029, 0.5891648, -0.264763, 1, 1, 1, 1, 1,
-0.2015543, 0.3366804, -1.792388, 1, 1, 1, 1, 1,
-0.2009344, 1.036293, -2.117428, 1, 1, 1, 1, 1,
-0.1972026, -0.4776132, -2.779985, 1, 1, 1, 1, 1,
-0.1950181, -0.04145642, -0.2488547, 1, 1, 1, 1, 1,
-0.1939658, 0.9754599, 0.07413761, 1, 1, 1, 1, 1,
-0.1907977, -0.6987199, -1.448964, 0, 0, 1, 1, 1,
-0.1889499, 0.3213598, -1.458881, 1, 0, 0, 1, 1,
-0.1822379, 1.070863, -0.6246053, 1, 0, 0, 1, 1,
-0.1821783, -0.1630452, -2.565184, 1, 0, 0, 1, 1,
-0.1814275, 0.03189321, -0.2344008, 1, 0, 0, 1, 1,
-0.1799882, -1.171272, -3.522472, 1, 0, 0, 1, 1,
-0.1781601, -1.046578, -3.142603, 0, 0, 0, 1, 1,
-0.1754486, 0.6102995, 0.7261319, 0, 0, 0, 1, 1,
-0.1738366, 0.4949272, 1.106925, 0, 0, 0, 1, 1,
-0.1731154, 0.1006862, -0.9358696, 0, 0, 0, 1, 1,
-0.1719761, -1.572466, -2.505191, 0, 0, 0, 1, 1,
-0.1700254, -0.8683029, -2.614434, 0, 0, 0, 1, 1,
-0.1643746, 0.1417879, 1.185292, 0, 0, 0, 1, 1,
-0.1566079, 1.197109, -0.9115148, 1, 1, 1, 1, 1,
-0.1562722, -0.6222161, -3.325649, 1, 1, 1, 1, 1,
-0.1555439, -0.2169055, -2.337969, 1, 1, 1, 1, 1,
-0.1550464, 0.2420546, 0.7762813, 1, 1, 1, 1, 1,
-0.1545842, -1.1947, -2.12593, 1, 1, 1, 1, 1,
-0.1510941, -1.112882, -2.726185, 1, 1, 1, 1, 1,
-0.151023, -1.550323, -1.678848, 1, 1, 1, 1, 1,
-0.149522, -0.2383626, -3.403891, 1, 1, 1, 1, 1,
-0.1483662, -1.139284, -2.905485, 1, 1, 1, 1, 1,
-0.1480146, 0.01318067, -0.7981561, 1, 1, 1, 1, 1,
-0.1459685, -0.9554198, -2.389673, 1, 1, 1, 1, 1,
-0.1440188, -0.402504, -3.034988, 1, 1, 1, 1, 1,
-0.1437802, 0.309142, -1.517823, 1, 1, 1, 1, 1,
-0.1422899, 0.2503693, -1.514159, 1, 1, 1, 1, 1,
-0.1375218, -0.1432492, -3.240026, 1, 1, 1, 1, 1,
-0.1371057, 0.2213593, -1.401774, 0, 0, 1, 1, 1,
-0.1361982, -0.1772084, -2.415678, 1, 0, 0, 1, 1,
-0.129428, 1.450243, 0.4724389, 1, 0, 0, 1, 1,
-0.1277664, -1.525722, -2.60493, 1, 0, 0, 1, 1,
-0.1251865, 0.2635944, 0.06334282, 1, 0, 0, 1, 1,
-0.1236519, 1.199043, -0.4783899, 1, 0, 0, 1, 1,
-0.1152542, -0.05956146, -2.572078, 0, 0, 0, 1, 1,
-0.1141615, -0.2481111, -3.374288, 0, 0, 0, 1, 1,
-0.1124079, 0.8373406, -0.9961432, 0, 0, 0, 1, 1,
-0.1122592, -0.6307256, -2.143414, 0, 0, 0, 1, 1,
-0.111615, 0.9467616, -0.5391323, 0, 0, 0, 1, 1,
-0.1101313, -0.3627056, -4.966202, 0, 0, 0, 1, 1,
-0.1087737, 0.008308688, -2.535403, 0, 0, 0, 1, 1,
-0.1055332, 0.7220623, -0.1548071, 1, 1, 1, 1, 1,
-0.1039768, 2.276048, -0.575883, 1, 1, 1, 1, 1,
-0.09984041, -1.475236, -2.945832, 1, 1, 1, 1, 1,
-0.09228893, 1.498779, -0.5594916, 1, 1, 1, 1, 1,
-0.09148679, 0.3713772, 1.168498, 1, 1, 1, 1, 1,
-0.09015775, -0.3163075, -1.53733, 1, 1, 1, 1, 1,
-0.07664401, -1.076618, -3.129922, 1, 1, 1, 1, 1,
-0.07614851, 0.4289053, 0.2679027, 1, 1, 1, 1, 1,
-0.07585099, -0.5563922, -4.801448, 1, 1, 1, 1, 1,
-0.06991726, 0.2878525, 0.7539233, 1, 1, 1, 1, 1,
-0.0683302, -0.1643326, -4.02035, 1, 1, 1, 1, 1,
-0.06376024, 0.5011494, 0.0114736, 1, 1, 1, 1, 1,
-0.06337767, 0.4023773, -1.076921, 1, 1, 1, 1, 1,
-0.062085, 0.4052499, 0.02262122, 1, 1, 1, 1, 1,
-0.0607426, -0.9953985, -3.232111, 1, 1, 1, 1, 1,
-0.05889612, 0.868116, 0.3265058, 0, 0, 1, 1, 1,
-0.05772834, 0.6575462, 0.9529802, 1, 0, 0, 1, 1,
-0.05283808, 1.691513, 0.1591222, 1, 0, 0, 1, 1,
-0.05235328, 0.8730904, 1.323046, 1, 0, 0, 1, 1,
-0.04694851, -2.246592, -3.132834, 1, 0, 0, 1, 1,
-0.04649195, 0.698734, -0.8428791, 1, 0, 0, 1, 1,
-0.04502424, -1.531687, -0.7655535, 0, 0, 0, 1, 1,
-0.04386007, -0.9426953, -3.0123, 0, 0, 0, 1, 1,
-0.0437342, 1.742555, 0.6256596, 0, 0, 0, 1, 1,
-0.04346693, -0.7369487, -2.657583, 0, 0, 0, 1, 1,
-0.04300806, -0.2478292, -1.935506, 0, 0, 0, 1, 1,
-0.03243867, 0.6598802, 0.7228673, 0, 0, 0, 1, 1,
-0.03091038, 1.67293, -0.8519586, 0, 0, 0, 1, 1,
-0.02807971, -0.4088082, -2.370626, 1, 1, 1, 1, 1,
-0.02785718, -0.8456944, -3.128864, 1, 1, 1, 1, 1,
-0.02784836, 0.3198299, 0.8617906, 1, 1, 1, 1, 1,
-0.02472753, 0.07378305, 0.1812594, 1, 1, 1, 1, 1,
-0.02270244, 0.5914773, 1.303993, 1, 1, 1, 1, 1,
-0.02213889, -0.7304607, -3.878419, 1, 1, 1, 1, 1,
-0.02102022, 0.1716875, -0.6358264, 1, 1, 1, 1, 1,
-0.01726905, -1.601945, -3.561713, 1, 1, 1, 1, 1,
-0.01197784, -2.615716, -2.436165, 1, 1, 1, 1, 1,
-0.01137872, -0.4094246, -2.679565, 1, 1, 1, 1, 1,
-0.008436895, -1.656343, -3.450797, 1, 1, 1, 1, 1,
-0.002382165, -0.2372888, -3.793104, 1, 1, 1, 1, 1,
-0.001817159, 0.304839, -0.1453774, 1, 1, 1, 1, 1,
0.002347259, -0.3213864, 2.954049, 1, 1, 1, 1, 1,
0.005319985, 0.8162961, 1.854898, 1, 1, 1, 1, 1,
0.006874106, -1.367002, 5.490641, 0, 0, 1, 1, 1,
0.009013484, -0.1908074, 3.885995, 1, 0, 0, 1, 1,
0.009212594, -1.372664, 4.288272, 1, 0, 0, 1, 1,
0.009682671, 0.129227, -0.8293657, 1, 0, 0, 1, 1,
0.01065169, -2.202016, 4.941259, 1, 0, 0, 1, 1,
0.01943004, -0.2697566, 1.288683, 1, 0, 0, 1, 1,
0.02091999, -0.4118566, 1.792873, 0, 0, 0, 1, 1,
0.02108831, -0.2891872, 3.258669, 0, 0, 0, 1, 1,
0.02134313, 0.1539766, -0.9761856, 0, 0, 0, 1, 1,
0.029839, 0.0670354, -0.7092395, 0, 0, 0, 1, 1,
0.03217965, 0.4549282, 0.5838631, 0, 0, 0, 1, 1,
0.0323537, 1.347404, -0.01253202, 0, 0, 0, 1, 1,
0.03271078, 0.5028082, -0.1623935, 0, 0, 0, 1, 1,
0.03370348, 1.76801, 0.7490757, 1, 1, 1, 1, 1,
0.03477521, 0.3814918, -2.397847, 1, 1, 1, 1, 1,
0.03523549, 1.968218, -1.133311, 1, 1, 1, 1, 1,
0.03678, -0.3154784, 2.26083, 1, 1, 1, 1, 1,
0.03777865, 0.5949599, 0.5649084, 1, 1, 1, 1, 1,
0.04167029, 0.2192985, -0.807287, 1, 1, 1, 1, 1,
0.04330837, 0.6358004, 0.3629872, 1, 1, 1, 1, 1,
0.04985281, 1.607161, -1.674856, 1, 1, 1, 1, 1,
0.0511045, -0.6043731, 2.380349, 1, 1, 1, 1, 1,
0.05695782, 3.111066, 0.8339326, 1, 1, 1, 1, 1,
0.06874076, 0.1386865, -1.473073, 1, 1, 1, 1, 1,
0.07428239, 0.5206519, 0.6011802, 1, 1, 1, 1, 1,
0.07963243, -0.3955769, 3.913285, 1, 1, 1, 1, 1,
0.08081396, -0.3195278, 2.54186, 1, 1, 1, 1, 1,
0.08283877, 0.1977795, -0.7650197, 1, 1, 1, 1, 1,
0.08395181, -0.8321061, 1.707897, 0, 0, 1, 1, 1,
0.08678283, 0.1931985, 1.618008, 1, 0, 0, 1, 1,
0.0899647, -0.3408453, 3.883769, 1, 0, 0, 1, 1,
0.0919029, -0.6230475, 3.748457, 1, 0, 0, 1, 1,
0.09218256, -0.1242715, 1.349015, 1, 0, 0, 1, 1,
0.09705918, 1.132781, -1.474061, 1, 0, 0, 1, 1,
0.09762572, 0.4406127, 0.3151819, 0, 0, 0, 1, 1,
0.09951939, 0.6740351, -0.2467033, 0, 0, 0, 1, 1,
0.09959078, 0.339749, -0.8535461, 0, 0, 0, 1, 1,
0.1008186, -0.1299208, 3.359233, 0, 0, 0, 1, 1,
0.1015038, -0.1129615, 3.135515, 0, 0, 0, 1, 1,
0.1077154, 0.1088905, -1.072118, 0, 0, 0, 1, 1,
0.107945, 0.1736048, -0.7674992, 0, 0, 0, 1, 1,
0.1080866, 1.78401, -1.795449, 1, 1, 1, 1, 1,
0.1097764, -0.1674034, 3.677912, 1, 1, 1, 1, 1,
0.1151341, 0.1582062, -0.464724, 1, 1, 1, 1, 1,
0.1169837, 1.259306, -2.029397, 1, 1, 1, 1, 1,
0.1262984, -0.308308, 4.315046, 1, 1, 1, 1, 1,
0.1322499, 0.6408063, 0.09777524, 1, 1, 1, 1, 1,
0.1327337, 0.9853998, 0.834568, 1, 1, 1, 1, 1,
0.1335724, -1.281195, 2.053153, 1, 1, 1, 1, 1,
0.1350585, 0.5699534, 1.534806, 1, 1, 1, 1, 1,
0.1387635, 1.768681, -1.499448, 1, 1, 1, 1, 1,
0.1426603, 1.01254, 0.7998428, 1, 1, 1, 1, 1,
0.1437021, 0.04674821, 0.8383914, 1, 1, 1, 1, 1,
0.1460182, -0.2882921, 1.53586, 1, 1, 1, 1, 1,
0.147382, 0.1583121, 1.324097, 1, 1, 1, 1, 1,
0.1481059, -0.7934855, 2.062292, 1, 1, 1, 1, 1,
0.1494291, -0.4223599, 2.847573, 0, 0, 1, 1, 1,
0.1533752, 0.6528739, -0.6756554, 1, 0, 0, 1, 1,
0.1546803, 0.09903269, 0.4576218, 1, 0, 0, 1, 1,
0.1584872, 0.2639359, 0.3428913, 1, 0, 0, 1, 1,
0.1628248, -1.327361, 3.713306, 1, 0, 0, 1, 1,
0.1668777, 1.322945, -0.4878241, 1, 0, 0, 1, 1,
0.1680548, -0.1838324, 5.737357, 0, 0, 0, 1, 1,
0.1690944, 0.9955681, 0.2402866, 0, 0, 0, 1, 1,
0.1730795, 0.09675371, 1.067915, 0, 0, 0, 1, 1,
0.1736134, -0.1097769, 1.098412, 0, 0, 0, 1, 1,
0.1751307, -0.6565539, 1.167836, 0, 0, 0, 1, 1,
0.177613, -0.8296249, 2.851285, 0, 0, 0, 1, 1,
0.1807662, -0.0588907, 2.370251, 0, 0, 0, 1, 1,
0.1853281, -0.1592773, 0.937548, 1, 1, 1, 1, 1,
0.1857146, -0.5188245, 1.849283, 1, 1, 1, 1, 1,
0.1873678, 0.2143848, -0.008907802, 1, 1, 1, 1, 1,
0.1904076, -1.096337, 4.727394, 1, 1, 1, 1, 1,
0.1920094, 0.007368971, 0.5391344, 1, 1, 1, 1, 1,
0.195851, -1.362759, 3.883547, 1, 1, 1, 1, 1,
0.2000737, 1.468749, 0.4500428, 1, 1, 1, 1, 1,
0.2013854, 2.502523, 1.133833, 1, 1, 1, 1, 1,
0.2020337, 1.012683, -0.1229214, 1, 1, 1, 1, 1,
0.2023692, 1.182422, 1.212365, 1, 1, 1, 1, 1,
0.2027451, -1.237274, 1.678332, 1, 1, 1, 1, 1,
0.2193779, -0.532199, 1.157569, 1, 1, 1, 1, 1,
0.2193973, 1.080338, 0.1933371, 1, 1, 1, 1, 1,
0.2227454, 0.04627529, 0.4356032, 1, 1, 1, 1, 1,
0.2275334, -0.6658723, 3.495738, 1, 1, 1, 1, 1,
0.2304541, -0.3719482, 2.48597, 0, 0, 1, 1, 1,
0.2341119, -1.12724, 2.792742, 1, 0, 0, 1, 1,
0.2359216, -0.06894013, 0.4449735, 1, 0, 0, 1, 1,
0.240088, -0.9577375, 2.332746, 1, 0, 0, 1, 1,
0.2417927, 1.404736, 1.29211, 1, 0, 0, 1, 1,
0.2458703, -0.6865981, 2.944336, 1, 0, 0, 1, 1,
0.2567286, 1.364892, 0.6179106, 0, 0, 0, 1, 1,
0.2614583, -0.04287289, 1.519733, 0, 0, 0, 1, 1,
0.2653109, -0.6420094, 1.835416, 0, 0, 0, 1, 1,
0.2659457, -1.240747, 1.314175, 0, 0, 0, 1, 1,
0.2745844, 1.491811, -0.3330249, 0, 0, 0, 1, 1,
0.2815118, 2.524069, 0.6395022, 0, 0, 0, 1, 1,
0.2824826, 0.8805967, 0.8462213, 0, 0, 0, 1, 1,
0.2871423, 1.32106, 0.4816538, 1, 1, 1, 1, 1,
0.28932, 0.5166751, -0.1480978, 1, 1, 1, 1, 1,
0.2896319, 1.264604, 0.5041315, 1, 1, 1, 1, 1,
0.2897518, -0.04618929, 0.9875332, 1, 1, 1, 1, 1,
0.2901126, 0.9339094, 1.60828, 1, 1, 1, 1, 1,
0.2921546, 0.2876054, 4.969728, 1, 1, 1, 1, 1,
0.2954693, -0.1408269, 3.072325, 1, 1, 1, 1, 1,
0.2983284, -0.1785511, 2.098498, 1, 1, 1, 1, 1,
0.3002721, 0.6196128, 1.9291, 1, 1, 1, 1, 1,
0.3082941, 0.4076777, -0.5169188, 1, 1, 1, 1, 1,
0.3096156, 1.496107, 1.615523, 1, 1, 1, 1, 1,
0.3143432, 0.07841152, 0.1734533, 1, 1, 1, 1, 1,
0.3150474, -0.05989907, 1.583069, 1, 1, 1, 1, 1,
0.3162456, 2.139902, 1.139367, 1, 1, 1, 1, 1,
0.3229415, 0.3009917, 0.08257078, 1, 1, 1, 1, 1,
0.3237246, -0.09624775, 0.6511129, 0, 0, 1, 1, 1,
0.3257115, -0.6111638, 1.750873, 1, 0, 0, 1, 1,
0.3263142, 1.784299, -0.5001404, 1, 0, 0, 1, 1,
0.3272156, 0.2993381, 0.6064091, 1, 0, 0, 1, 1,
0.3300802, -1.288758, 2.256264, 1, 0, 0, 1, 1,
0.3301892, 1.005691, 0.2942597, 1, 0, 0, 1, 1,
0.3367554, 0.2499752, 1.960714, 0, 0, 0, 1, 1,
0.3400367, 0.9577208, 1.015596, 0, 0, 0, 1, 1,
0.3402013, 1.324749, -0.7194869, 0, 0, 0, 1, 1,
0.3503564, -0.4526959, 3.763622, 0, 0, 0, 1, 1,
0.3509668, 1.122143, 0.3343757, 0, 0, 0, 1, 1,
0.3571066, 1.157524, -0.4591248, 0, 0, 0, 1, 1,
0.358667, 1.031445, -0.2459385, 0, 0, 0, 1, 1,
0.3611571, -0.09865443, 2.869742, 1, 1, 1, 1, 1,
0.3628869, 0.8132734, -1.409099, 1, 1, 1, 1, 1,
0.3638212, -1.248581, 4.090549, 1, 1, 1, 1, 1,
0.3639408, -0.2159453, 1.242129, 1, 1, 1, 1, 1,
0.3644139, 0.6691623, 0.6959251, 1, 1, 1, 1, 1,
0.3662039, 1.456117, 1.700648, 1, 1, 1, 1, 1,
0.3702445, 0.02104112, 1.250173, 1, 1, 1, 1, 1,
0.370957, 1.217498, 1.653975, 1, 1, 1, 1, 1,
0.3756939, -0.4770144, 2.758157, 1, 1, 1, 1, 1,
0.380796, -0.8764923, 2.017763, 1, 1, 1, 1, 1,
0.3813754, -1.011767, 3.213726, 1, 1, 1, 1, 1,
0.3818165, 0.02088064, 1.856369, 1, 1, 1, 1, 1,
0.3835861, 1.56638, 1.031772, 1, 1, 1, 1, 1,
0.3893582, 1.268121, -1.34534, 1, 1, 1, 1, 1,
0.3909874, -0.7286555, 1.395919, 1, 1, 1, 1, 1,
0.3944832, 1.630956, 1.953806, 0, 0, 1, 1, 1,
0.3959554, 0.3332895, -1.404877, 1, 0, 0, 1, 1,
0.397096, -0.5900141, 1.005315, 1, 0, 0, 1, 1,
0.3981337, 1.143022, -0.5124913, 1, 0, 0, 1, 1,
0.4008869, 0.6867724, 0.7652335, 1, 0, 0, 1, 1,
0.4031387, 0.1823944, -0.6231241, 1, 0, 0, 1, 1,
0.4059307, -0.253296, 0.5597299, 0, 0, 0, 1, 1,
0.406984, -0.06089932, 1.724123, 0, 0, 0, 1, 1,
0.4083574, -0.1366981, 1.694802, 0, 0, 0, 1, 1,
0.4097677, 0.7671715, -0.03116464, 0, 0, 0, 1, 1,
0.4104149, -1.109915, 1.44783, 0, 0, 0, 1, 1,
0.4133783, 1.242988, 0.6764404, 0, 0, 0, 1, 1,
0.4152621, -1.097112, 3.161155, 0, 0, 0, 1, 1,
0.4172492, 1.274739, -0.5846722, 1, 1, 1, 1, 1,
0.4291379, -0.2492646, -0.243985, 1, 1, 1, 1, 1,
0.4402417, -1.37505, 1.459898, 1, 1, 1, 1, 1,
0.4429044, 1.585877, 1.205962, 1, 1, 1, 1, 1,
0.4458314, -2.150726, 1.615642, 1, 1, 1, 1, 1,
0.4463385, 0.0916279, 1.89789, 1, 1, 1, 1, 1,
0.4469097, 0.908807, -0.5132812, 1, 1, 1, 1, 1,
0.4493315, -0.9520673, 2.710253, 1, 1, 1, 1, 1,
0.4529197, -0.6758281, 1.680443, 1, 1, 1, 1, 1,
0.4532552, -1.129847, 3.454283, 1, 1, 1, 1, 1,
0.4558308, 1.030626, 1.278294, 1, 1, 1, 1, 1,
0.4582358, -0.1568257, -0.189823, 1, 1, 1, 1, 1,
0.4595526, 1.139442, -0.2918923, 1, 1, 1, 1, 1,
0.4633205, -1.4072, 2.5662, 1, 1, 1, 1, 1,
0.4708852, 0.4929626, 0.2254858, 1, 1, 1, 1, 1,
0.4727575, -0.2701208, 1.578365, 0, 0, 1, 1, 1,
0.4834017, -0.1300035, 2.193633, 1, 0, 0, 1, 1,
0.4847893, 1.663807, 0.6008645, 1, 0, 0, 1, 1,
0.4858964, 0.7932498, 0.7941031, 1, 0, 0, 1, 1,
0.4876575, -0.900572, 2.638687, 1, 0, 0, 1, 1,
0.4898307, -0.8936483, 2.118663, 1, 0, 0, 1, 1,
0.4899868, -1.28017, 3.35835, 0, 0, 0, 1, 1,
0.497164, 0.6068335, 1.764683, 0, 0, 0, 1, 1,
0.4995466, -1.186952, 2.869818, 0, 0, 0, 1, 1,
0.5005255, -1.426895, 3.094094, 0, 0, 0, 1, 1,
0.5018451, 0.1246239, 1.295174, 0, 0, 0, 1, 1,
0.5107997, -0.8032268, 1.277873, 0, 0, 0, 1, 1,
0.5136686, 1.000207, -2.070224, 0, 0, 0, 1, 1,
0.5140911, -1.418033, 4.21921, 1, 1, 1, 1, 1,
0.5150608, -1.742377, 1.465686, 1, 1, 1, 1, 1,
0.5161381, -0.9120588, 1.996263, 1, 1, 1, 1, 1,
0.5180017, -1.065848, 1.796728, 1, 1, 1, 1, 1,
0.5196316, -0.1895835, 1.436609, 1, 1, 1, 1, 1,
0.5218229, 1.33842, 0.5052156, 1, 1, 1, 1, 1,
0.5258864, 0.2002704, 1.695935, 1, 1, 1, 1, 1,
0.5317175, -1.271911, 3.278411, 1, 1, 1, 1, 1,
0.5346145, 0.08027091, -0.5124224, 1, 1, 1, 1, 1,
0.534797, 0.5792816, -0.3483892, 1, 1, 1, 1, 1,
0.5399131, 0.4635582, 2.176484, 1, 1, 1, 1, 1,
0.5399674, 0.05295154, -0.4979241, 1, 1, 1, 1, 1,
0.5433699, 0.5820639, 1.13424, 1, 1, 1, 1, 1,
0.5434543, 0.1213946, 1.244736, 1, 1, 1, 1, 1,
0.54554, 1.432473, -2.579989, 1, 1, 1, 1, 1,
0.5466961, 1.880392, 0.4106537, 0, 0, 1, 1, 1,
0.5479331, 0.885382, -0.01601005, 1, 0, 0, 1, 1,
0.549682, -1.380992, 3.130731, 1, 0, 0, 1, 1,
0.5511448, -0.1444116, 1.933466, 1, 0, 0, 1, 1,
0.559774, -0.3148628, 0.550139, 1, 0, 0, 1, 1,
0.5607592, 0.1411661, 0.3795511, 1, 0, 0, 1, 1,
0.5615653, 0.6958483, 0.8715159, 0, 0, 0, 1, 1,
0.5622095, 2.186368, -0.565055, 0, 0, 0, 1, 1,
0.5661047, -0.9428159, 0.8160693, 0, 0, 0, 1, 1,
0.5695461, 0.5725925, 0.2328432, 0, 0, 0, 1, 1,
0.5726766, 0.9337389, 2.251369, 0, 0, 0, 1, 1,
0.5777432, 1.893411, 0.9130408, 0, 0, 0, 1, 1,
0.5780492, -0.6340901, 2.260133, 0, 0, 0, 1, 1,
0.5820782, 0.9816719, 0.8623503, 1, 1, 1, 1, 1,
0.5840668, 0.1192695, 1.52254, 1, 1, 1, 1, 1,
0.5853466, -0.5729513, 4.0595, 1, 1, 1, 1, 1,
0.5883688, -0.1647378, 1.79881, 1, 1, 1, 1, 1,
0.5918381, 2.316213, -0.4258025, 1, 1, 1, 1, 1,
0.6030393, -0.1734794, 1.180686, 1, 1, 1, 1, 1,
0.6074761, 0.1523271, 1.992683, 1, 1, 1, 1, 1,
0.6104312, 0.4746819, 1.522387, 1, 1, 1, 1, 1,
0.615869, -0.4780449, 2.267757, 1, 1, 1, 1, 1,
0.617976, 0.3199077, -0.3156209, 1, 1, 1, 1, 1,
0.6233453, 1.136658, -0.8881984, 1, 1, 1, 1, 1,
0.625164, 0.2561467, 2.396931, 1, 1, 1, 1, 1,
0.6262447, -0.830476, 3.652067, 1, 1, 1, 1, 1,
0.6268345, 0.02542758, 1.888708, 1, 1, 1, 1, 1,
0.6274461, 0.4711967, -0.2431146, 1, 1, 1, 1, 1,
0.6289772, 1.001904, 0.2811747, 0, 0, 1, 1, 1,
0.6306843, 1.648608, -0.1972613, 1, 0, 0, 1, 1,
0.6312252, -0.7847314, 1.196213, 1, 0, 0, 1, 1,
0.6368794, 1.299529, -0.6458534, 1, 0, 0, 1, 1,
0.6370893, -0.503686, 1.584155, 1, 0, 0, 1, 1,
0.6504695, -0.8642381, 2.665163, 1, 0, 0, 1, 1,
0.6609104, -1.174322, 3.931424, 0, 0, 0, 1, 1,
0.6634879, 1.997131, 2.050223, 0, 0, 0, 1, 1,
0.6643887, -1.109737, 1.839506, 0, 0, 0, 1, 1,
0.6677629, 0.09031034, 3.203454, 0, 0, 0, 1, 1,
0.6695232, -1.61922, 4.054386, 0, 0, 0, 1, 1,
0.6695383, -0.9712351, 1.799123, 0, 0, 0, 1, 1,
0.6699959, 0.3906673, 1.422829, 0, 0, 0, 1, 1,
0.7049477, 2.400267, 0.8854102, 1, 1, 1, 1, 1,
0.7063541, 1.474343, 2.123033, 1, 1, 1, 1, 1,
0.708142, 0.3900661, 1.437768, 1, 1, 1, 1, 1,
0.7120179, -0.1675414, 2.879765, 1, 1, 1, 1, 1,
0.7130524, -0.1090457, 1.800561, 1, 1, 1, 1, 1,
0.7144417, -0.1704424, 0.2392359, 1, 1, 1, 1, 1,
0.7175441, 0.6772318, 1.081242, 1, 1, 1, 1, 1,
0.7270955, 0.6406412, 0.9921564, 1, 1, 1, 1, 1,
0.7386642, 0.01316947, 3.144981, 1, 1, 1, 1, 1,
0.7413469, 0.1945358, 1.8043, 1, 1, 1, 1, 1,
0.7422299, -0.9516829, 1.411346, 1, 1, 1, 1, 1,
0.7446957, -0.3054797, 0.8156113, 1, 1, 1, 1, 1,
0.7534516, -1.502249, 1.845103, 1, 1, 1, 1, 1,
0.7542441, -0.2128254, 0.7112215, 1, 1, 1, 1, 1,
0.7563869, 1.602811, 0.4430251, 1, 1, 1, 1, 1,
0.7615114, -0.05224288, 2.395835, 0, 0, 1, 1, 1,
0.7617503, -0.04990339, 1.927575, 1, 0, 0, 1, 1,
0.7685617, 0.009258892, 1.820524, 1, 0, 0, 1, 1,
0.7686986, 1.08138, 0.306257, 1, 0, 0, 1, 1,
0.7689728, 1.827359, 0.6096012, 1, 0, 0, 1, 1,
0.7709853, 0.5305332, 1.380978, 1, 0, 0, 1, 1,
0.7762687, -0.3419899, 1.145144, 0, 0, 0, 1, 1,
0.776306, 0.3108823, 1.48994, 0, 0, 0, 1, 1,
0.7779111, 1.421905, 1.143314, 0, 0, 0, 1, 1,
0.7788566, 1.144148, 1.704555, 0, 0, 0, 1, 1,
0.7808685, -0.6280411, 2.773774, 0, 0, 0, 1, 1,
0.7869435, -0.0888665, -1.13535, 0, 0, 0, 1, 1,
0.7874553, 1.012705, -0.8349405, 0, 0, 0, 1, 1,
0.7988771, 1.083131, -0.3376589, 1, 1, 1, 1, 1,
0.8008673, 0.7273344, 0.1099994, 1, 1, 1, 1, 1,
0.8101841, 1.082847, 3.161447, 1, 1, 1, 1, 1,
0.8143536, 0.1998196, 1.556405, 1, 1, 1, 1, 1,
0.8169957, -0.06049611, 3.192883, 1, 1, 1, 1, 1,
0.819249, -2.137756, 3.51645, 1, 1, 1, 1, 1,
0.8242014, -0.7647762, 2.001631, 1, 1, 1, 1, 1,
0.8265665, -1.140252, 2.039323, 1, 1, 1, 1, 1,
0.8273017, 1.515044, -0.3602773, 1, 1, 1, 1, 1,
0.8283875, 0.581112, 0.9631378, 1, 1, 1, 1, 1,
0.8311993, 0.5980133, -0.7544804, 1, 1, 1, 1, 1,
0.8312101, 0.7287998, -0.2901522, 1, 1, 1, 1, 1,
0.8330179, 0.9797674, 1.556727, 1, 1, 1, 1, 1,
0.8353201, 1.830238, 0.7712572, 1, 1, 1, 1, 1,
0.8435507, 1.692969, 2.467161, 1, 1, 1, 1, 1,
0.8436531, 0.1848706, 0.7840608, 0, 0, 1, 1, 1,
0.8490821, -0.5992863, 2.895405, 1, 0, 0, 1, 1,
0.850779, -0.9867669, 0.87254, 1, 0, 0, 1, 1,
0.8565239, 0.2594534, 1.729195, 1, 0, 0, 1, 1,
0.8571203, -0.1962427, 1.199092, 1, 0, 0, 1, 1,
0.8588247, -1.3542, 1.380802, 1, 0, 0, 1, 1,
0.8649054, 0.81115, 0.3934467, 0, 0, 0, 1, 1,
0.8654028, -0.6230904, 1.773714, 0, 0, 0, 1, 1,
0.8667759, 0.6324368, 0.4663257, 0, 0, 0, 1, 1,
0.8717336, 0.4350396, 2.907553, 0, 0, 0, 1, 1,
0.8722863, 0.219146, 2.09159, 0, 0, 0, 1, 1,
0.8769187, 1.27796, 0.5229391, 0, 0, 0, 1, 1,
0.8791615, -0.32505, 2.680689, 0, 0, 0, 1, 1,
0.883752, -0.3716071, 1.96887, 1, 1, 1, 1, 1,
0.8856171, -0.8531092, 2.760412, 1, 1, 1, 1, 1,
0.8876305, -0.6524278, 1.190523, 1, 1, 1, 1, 1,
0.8903267, -1.320911, 2.804203, 1, 1, 1, 1, 1,
0.8906353, -0.7376395, 3.407334, 1, 1, 1, 1, 1,
0.8971145, 0.1981327, 0.8896176, 1, 1, 1, 1, 1,
0.8982435, -0.3365905, 1.261164, 1, 1, 1, 1, 1,
0.9034916, 0.09892938, 2.254658, 1, 1, 1, 1, 1,
0.9049746, -0.8532504, 0.7218786, 1, 1, 1, 1, 1,
0.9066198, -0.744193, 2.546431, 1, 1, 1, 1, 1,
0.9068733, 0.1292287, 2.135394, 1, 1, 1, 1, 1,
0.9168965, -0.6630094, 2.096004, 1, 1, 1, 1, 1,
0.9169942, 0.441948, 2.338723, 1, 1, 1, 1, 1,
0.9204672, -1.841506, 2.865026, 1, 1, 1, 1, 1,
0.9260257, 0.7525026, -0.7702543, 1, 1, 1, 1, 1,
0.9396625, -0.1090363, 1.575999, 0, 0, 1, 1, 1,
0.9411691, -1.72969, 2.250669, 1, 0, 0, 1, 1,
0.9455451, -0.356132, 1.717215, 1, 0, 0, 1, 1,
0.9494439, 1.188033, 0.5221612, 1, 0, 0, 1, 1,
0.9517769, -0.5949911, 1.978284, 1, 0, 0, 1, 1,
0.9536432, -0.1979786, 0.9843148, 1, 0, 0, 1, 1,
0.9552513, -1.319889, 1.699561, 0, 0, 0, 1, 1,
0.9560025, -0.5862645, 2.629519, 0, 0, 0, 1, 1,
0.9622376, 1.035372, 2.435622, 0, 0, 0, 1, 1,
0.9648898, 0.5542545, 1.382888, 0, 0, 0, 1, 1,
0.9682402, 0.6964929, 0.7614085, 0, 0, 0, 1, 1,
0.9721604, -1.226655, 1.384503, 0, 0, 0, 1, 1,
0.9745836, 0.8093801, 2.386105, 0, 0, 0, 1, 1,
0.9879452, 0.1158246, 3.289891, 1, 1, 1, 1, 1,
0.9970062, -0.3989064, 3.806435, 1, 1, 1, 1, 1,
0.9970578, -0.6402789, 2.047045, 1, 1, 1, 1, 1,
1.010658, 0.4855431, 1.048572, 1, 1, 1, 1, 1,
1.018532, 0.6881852, -0.3653573, 1, 1, 1, 1, 1,
1.026029, 0.4842948, -1.309097, 1, 1, 1, 1, 1,
1.035737, -1.696794, 4.897599, 1, 1, 1, 1, 1,
1.038107, -0.4010453, 2.291606, 1, 1, 1, 1, 1,
1.040128, 0.542517, 0.6387892, 1, 1, 1, 1, 1,
1.043351, 1.675681, 0.6360335, 1, 1, 1, 1, 1,
1.064913, -0.5462109, 3.651848, 1, 1, 1, 1, 1,
1.070732, -0.1265492, 0.8750323, 1, 1, 1, 1, 1,
1.073221, -0.09732122, 0.3313028, 1, 1, 1, 1, 1,
1.075485, -0.9020324, 1.577979, 1, 1, 1, 1, 1,
1.079366, 1.458074, -1.045292, 1, 1, 1, 1, 1,
1.086631, -0.01565949, 1.205506, 0, 0, 1, 1, 1,
1.099375, 0.3316683, 1.506996, 1, 0, 0, 1, 1,
1.101768, 0.7046291, 0.02737097, 1, 0, 0, 1, 1,
1.114779, -0.3212295, 2.695635, 1, 0, 0, 1, 1,
1.115842, -1.079239, 2.03973, 1, 0, 0, 1, 1,
1.116766, -0.1660908, 1.405251, 1, 0, 0, 1, 1,
1.116886, -2.508302, 3.74766, 0, 0, 0, 1, 1,
1.119256, 0.7328511, 2.138299, 0, 0, 0, 1, 1,
1.131959, -0.03987685, 2.603858, 0, 0, 0, 1, 1,
1.133188, 0.7409939, 1.049964, 0, 0, 0, 1, 1,
1.149821, 0.9235592, -0.3356697, 0, 0, 0, 1, 1,
1.152211, 0.9368882, 2.467565, 0, 0, 0, 1, 1,
1.154747, 0.1795448, 0.007558818, 0, 0, 0, 1, 1,
1.160821, -0.6244682, 2.257979, 1, 1, 1, 1, 1,
1.180625, -0.4166193, 1.16926, 1, 1, 1, 1, 1,
1.181508, -0.7941521, 3.12294, 1, 1, 1, 1, 1,
1.188817, -0.1027167, 1.144964, 1, 1, 1, 1, 1,
1.190912, -0.2329625, 0.9100913, 1, 1, 1, 1, 1,
1.201017, 1.5824, 0.6787661, 1, 1, 1, 1, 1,
1.202214, -0.02417533, 1.663462, 1, 1, 1, 1, 1,
1.208552, -0.930427, 1.594573, 1, 1, 1, 1, 1,
1.225305, -0.9972173, 2.50755, 1, 1, 1, 1, 1,
1.241468, 0.03763524, 1.781901, 1, 1, 1, 1, 1,
1.244171, -0.4270685, 1.92004, 1, 1, 1, 1, 1,
1.245838, -1.104449, 2.14524, 1, 1, 1, 1, 1,
1.259622, 1.479654, 0.667407, 1, 1, 1, 1, 1,
1.263587, 0.06235565, 2.655442, 1, 1, 1, 1, 1,
1.268081, 1.331408, 0.5451728, 1, 1, 1, 1, 1,
1.275475, -0.4312794, 1.658184, 0, 0, 1, 1, 1,
1.290447, -0.5410375, 0.9190686, 1, 0, 0, 1, 1,
1.291876, -1.752964, 2.145858, 1, 0, 0, 1, 1,
1.299691, -0.7398804, 1.954599, 1, 0, 0, 1, 1,
1.30294, 1.498806, -0.1022621, 1, 0, 0, 1, 1,
1.304929, 1.07915, 3.045642, 1, 0, 0, 1, 1,
1.30968, 0.6629024, -0.7648152, 0, 0, 0, 1, 1,
1.319123, 0.1533756, 1.970155, 0, 0, 0, 1, 1,
1.322901, 1.101084, 1.609505, 0, 0, 0, 1, 1,
1.34299, -1.604312, 1.721164, 0, 0, 0, 1, 1,
1.359121, -1.258143, 3.051112, 0, 0, 0, 1, 1,
1.371668, -0.4432248, 3.253726, 0, 0, 0, 1, 1,
1.372101, -1.765334, 2.621143, 0, 0, 0, 1, 1,
1.38088, 1.590448, 1.058978, 1, 1, 1, 1, 1,
1.386542, 0.5210245, 2.980984, 1, 1, 1, 1, 1,
1.404923, 0.7178746, 1.964733, 1, 1, 1, 1, 1,
1.409564, 0.4454683, 1.743407, 1, 1, 1, 1, 1,
1.412061, 1.184119, -0.1076207, 1, 1, 1, 1, 1,
1.415857, 0.7477329, 0.2424042, 1, 1, 1, 1, 1,
1.418982, -0.09469014, 1.191811, 1, 1, 1, 1, 1,
1.424835, 0.7541947, 0.9428094, 1, 1, 1, 1, 1,
1.430664, 0.07223624, 2.058183, 1, 1, 1, 1, 1,
1.43275, 1.706412, 0.6194305, 1, 1, 1, 1, 1,
1.438147, -1.596443, 3.622043, 1, 1, 1, 1, 1,
1.445296, -0.6662812, 2.31522, 1, 1, 1, 1, 1,
1.447196, -0.2711628, 2.91146, 1, 1, 1, 1, 1,
1.448315, -0.473157, 2.049396, 1, 1, 1, 1, 1,
1.450541, 0.3346376, 0.8944039, 1, 1, 1, 1, 1,
1.453566, -0.4037016, 2.674727, 0, 0, 1, 1, 1,
1.455671, 0.9937667, 1.43023, 1, 0, 0, 1, 1,
1.456285, -0.3617279, 0.4952676, 1, 0, 0, 1, 1,
1.462806, 0.2308319, 1.536153, 1, 0, 0, 1, 1,
1.489774, 1.269956, 0.08933334, 1, 0, 0, 1, 1,
1.496863, 1.205427, 0.4793056, 1, 0, 0, 1, 1,
1.528267, 0.4093046, 1.58025, 0, 0, 0, 1, 1,
1.535383, -0.9856144, 1.98471, 0, 0, 0, 1, 1,
1.546267, -0.4850256, 2.592718, 0, 0, 0, 1, 1,
1.555133, 1.091047, 1.172261, 0, 0, 0, 1, 1,
1.559139, 0.120405, 1.991958, 0, 0, 0, 1, 1,
1.563641, -1.931985, 3.09511, 0, 0, 0, 1, 1,
1.57721, 1.351717, 0.4512567, 0, 0, 0, 1, 1,
1.581233, -0.0599585, -0.2227925, 1, 1, 1, 1, 1,
1.590558, -0.03677526, 0.5831745, 1, 1, 1, 1, 1,
1.618652, 0.7563408, 1.318472, 1, 1, 1, 1, 1,
1.623554, 0.4454607, 0.5387987, 1, 1, 1, 1, 1,
1.62494, 0.5331724, 1.552122, 1, 1, 1, 1, 1,
1.639266, -0.7063313, 2.466871, 1, 1, 1, 1, 1,
1.642851, 0.3651336, -0.007602036, 1, 1, 1, 1, 1,
1.655565, -0.006653902, 1.274636, 1, 1, 1, 1, 1,
1.672356, 0.4269019, 1.986089, 1, 1, 1, 1, 1,
1.716139, 0.6043418, 2.032579, 1, 1, 1, 1, 1,
1.717731, -0.1285411, 1.487892, 1, 1, 1, 1, 1,
1.743914, 0.1585341, -0.2897384, 1, 1, 1, 1, 1,
1.745907, 0.929083, -0.5225492, 1, 1, 1, 1, 1,
1.767592, 0.4195699, -0.003174406, 1, 1, 1, 1, 1,
1.773793, -1.34239, 0.9890643, 1, 1, 1, 1, 1,
1.788371, -1.139807, 1.276958, 0, 0, 1, 1, 1,
1.801738, -0.4155836, 2.85425, 1, 0, 0, 1, 1,
1.811238, -0.2125407, 1.175138, 1, 0, 0, 1, 1,
1.828991, -0.9332607, 3.587064, 1, 0, 0, 1, 1,
1.841512, -1.375909, 1.189787, 1, 0, 0, 1, 1,
1.878689, -1.223612, 1.857146, 1, 0, 0, 1, 1,
1.885702, -0.525952, 2.284655, 0, 0, 0, 1, 1,
1.888217, 2.034416, -0.3859652, 0, 0, 0, 1, 1,
1.889463, -0.1418136, 2.61788, 0, 0, 0, 1, 1,
1.898022, 0.8770409, 1.116959, 0, 0, 0, 1, 1,
1.906903, -0.5562672, 2.345429, 0, 0, 0, 1, 1,
1.909233, -0.1134182, 1.532578, 0, 0, 0, 1, 1,
1.925335, 1.008447, 0.07926535, 0, 0, 0, 1, 1,
1.942437, 1.029178, 1.032812, 1, 1, 1, 1, 1,
1.971844, 1.025752, 1.370229, 1, 1, 1, 1, 1,
1.973299, -1.424357, 2.24485, 1, 1, 1, 1, 1,
1.981062, -1.517287, 0.6602066, 1, 1, 1, 1, 1,
1.990063, 0.9483328, 2.324507, 1, 1, 1, 1, 1,
2.000062, -1.046461, 2.227836, 1, 1, 1, 1, 1,
2.011458, 0.6286912, 0.8378647, 1, 1, 1, 1, 1,
2.014378, 0.356135, 1.194904, 1, 1, 1, 1, 1,
2.016104, 1.014576, 2.333173, 1, 1, 1, 1, 1,
2.020726, 1.030237, 2.237824, 1, 1, 1, 1, 1,
2.038924, -0.910942, 1.214597, 1, 1, 1, 1, 1,
2.046589, -1.6308, 1.859167, 1, 1, 1, 1, 1,
2.049409, 0.6820458, 2.297733, 1, 1, 1, 1, 1,
2.100991, -0.1704027, 2.854575, 1, 1, 1, 1, 1,
2.101615, -0.9757859, 0.5593256, 1, 1, 1, 1, 1,
2.154211, -0.5832266, 0.8966847, 0, 0, 1, 1, 1,
2.186861, -0.6444343, 1.459864, 1, 0, 0, 1, 1,
2.19488, -1.226919, 2.819679, 1, 0, 0, 1, 1,
2.202931, -0.2789415, 1.228592, 1, 0, 0, 1, 1,
2.236377, -0.04047918, 0.8757513, 1, 0, 0, 1, 1,
2.344193, 0.1110512, 0.1704603, 1, 0, 0, 1, 1,
2.349194, -0.469243, 2.429842, 0, 0, 0, 1, 1,
2.359027, -0.8489566, 2.197474, 0, 0, 0, 1, 1,
2.365639, 0.7380027, 1.486202, 0, 0, 0, 1, 1,
2.365663, 1.297157, 1.229894, 0, 0, 0, 1, 1,
2.383936, -0.2873278, 3.195226, 0, 0, 0, 1, 1,
2.415703, -0.2586083, 0.8194502, 0, 0, 0, 1, 1,
2.426715, 0.2821791, 1.057843, 0, 0, 0, 1, 1,
2.516473, 0.4458963, 1.547053, 1, 1, 1, 1, 1,
2.561203, 1.181262, 1.724341, 1, 1, 1, 1, 1,
2.595302, 0.8446937, 1.435742, 1, 1, 1, 1, 1,
2.684288, -0.241816, 0.5210955, 1, 1, 1, 1, 1,
2.874626, -0.9477235, 2.742608, 1, 1, 1, 1, 1,
2.881752, -0.4966205, 2.392739, 1, 1, 1, 1, 1,
2.913793, -0.5837377, 0.7569397, 1, 1, 1, 1, 1
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
var radius = 9.293181;
var distance = 32.6419;
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
mvMatrix.translate( 0.09914482, -0.2476749, -0.3855774 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.6419);
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
