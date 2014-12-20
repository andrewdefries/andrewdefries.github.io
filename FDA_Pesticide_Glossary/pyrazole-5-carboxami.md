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
-3.378306, -0.2814673, -0.9709389, 1, 0, 0, 1,
-2.901356, 1.007772, -1.04156, 1, 0.007843138, 0, 1,
-2.82732, -1.717182, -0.6591268, 1, 0.01176471, 0, 1,
-2.82564, 0.9019865, -0.4716537, 1, 0.01960784, 0, 1,
-2.536206, -0.05594685, -0.6485447, 1, 0.02352941, 0, 1,
-2.515756, 1.04135, 0.1185611, 1, 0.03137255, 0, 1,
-2.427517, -1.362105, -2.188982, 1, 0.03529412, 0, 1,
-2.289229, 2.363687, -3.022925, 1, 0.04313726, 0, 1,
-2.288463, 0.9510556, -2.343016, 1, 0.04705882, 0, 1,
-2.269904, 0.4995903, -0.04983446, 1, 0.05490196, 0, 1,
-2.269327, 1.315086, -2.004683, 1, 0.05882353, 0, 1,
-2.256479, 1.180117, -1.394553, 1, 0.06666667, 0, 1,
-2.246487, 0.3219712, -0.04108039, 1, 0.07058824, 0, 1,
-2.206526, 1.367723, -2.826788, 1, 0.07843138, 0, 1,
-2.193977, 1.889576, 0.240966, 1, 0.08235294, 0, 1,
-2.178663, 0.4435421, -0.01539499, 1, 0.09019608, 0, 1,
-2.176901, -0.231554, -0.6384728, 1, 0.09411765, 0, 1,
-2.130224, 0.4886664, -1.246907, 1, 0.1019608, 0, 1,
-2.111027, -0.288734, -3.389536, 1, 0.1098039, 0, 1,
-2.08835, -0.2425381, -3.159923, 1, 0.1137255, 0, 1,
-2.07346, 1.034648, -1.582183, 1, 0.1215686, 0, 1,
-2.027828, 0.003196992, -2.238985, 1, 0.1254902, 0, 1,
-1.99625, 0.07422972, -1.371813, 1, 0.1333333, 0, 1,
-1.957502, 0.6399403, -0.1648353, 1, 0.1372549, 0, 1,
-1.955949, 0.8274812, -1.519352, 1, 0.145098, 0, 1,
-1.951094, 0.1340128, -0.6904877, 1, 0.1490196, 0, 1,
-1.921007, 0.1427356, -1.435632, 1, 0.1568628, 0, 1,
-1.899358, -0.328427, -1.57528, 1, 0.1607843, 0, 1,
-1.898636, 1.362646, -2.471212, 1, 0.1686275, 0, 1,
-1.896611, 1.735669, -0.3625306, 1, 0.172549, 0, 1,
-1.886954, -0.742247, -1.050872, 1, 0.1803922, 0, 1,
-1.870816, 0.002754076, 0.06990114, 1, 0.1843137, 0, 1,
-1.804675, 1.396336, 0.2841844, 1, 0.1921569, 0, 1,
-1.787808, -1.726446, -1.779406, 1, 0.1960784, 0, 1,
-1.787209, -2.329147, -2.557914, 1, 0.2039216, 0, 1,
-1.740129, 0.9847661, -1.857718, 1, 0.2117647, 0, 1,
-1.738789, -1.391659, -1.279426, 1, 0.2156863, 0, 1,
-1.720878, -0.0162544, -2.339618, 1, 0.2235294, 0, 1,
-1.706752, 0.2355405, -1.967603, 1, 0.227451, 0, 1,
-1.689491, -1.408958, -4.646428, 1, 0.2352941, 0, 1,
-1.686284, -0.03247799, -2.997258, 1, 0.2392157, 0, 1,
-1.647892, 1.083291, -2.009665, 1, 0.2470588, 0, 1,
-1.637368, 0.618956, -0.6838325, 1, 0.2509804, 0, 1,
-1.596108, -0.1859025, -0.9539549, 1, 0.2588235, 0, 1,
-1.559943, 0.4530977, -1.760288, 1, 0.2627451, 0, 1,
-1.559548, -0.1690717, -2.518962, 1, 0.2705882, 0, 1,
-1.556455, -1.035263, -1.4719, 1, 0.2745098, 0, 1,
-1.555556, -0.5993664, -2.014334, 1, 0.282353, 0, 1,
-1.550399, -1.371294, -2.66912, 1, 0.2862745, 0, 1,
-1.54787, -0.0344351, -0.2362198, 1, 0.2941177, 0, 1,
-1.534237, -0.2874608, -2.155363, 1, 0.3019608, 0, 1,
-1.520389, 0.6683998, -1.277511, 1, 0.3058824, 0, 1,
-1.515566, 0.08489226, -2.339196, 1, 0.3137255, 0, 1,
-1.513666, -1.948462, -2.444545, 1, 0.3176471, 0, 1,
-1.505584, -1.764992, -2.616432, 1, 0.3254902, 0, 1,
-1.474335, 0.5371306, -1.400301, 1, 0.3294118, 0, 1,
-1.474279, 0.9009145, -2.612823, 1, 0.3372549, 0, 1,
-1.4676, -0.4481118, -2.886022, 1, 0.3411765, 0, 1,
-1.46415, 0.2399283, -2.065098, 1, 0.3490196, 0, 1,
-1.461868, 0.648453, -2.896894, 1, 0.3529412, 0, 1,
-1.45612, 1.069659, -1.705148, 1, 0.3607843, 0, 1,
-1.451346, 0.3272674, -1.605011, 1, 0.3647059, 0, 1,
-1.451208, 0.5296888, -2.06808, 1, 0.372549, 0, 1,
-1.428646, -0.9889229, -2.314934, 1, 0.3764706, 0, 1,
-1.426057, -1.428349, -2.010644, 1, 0.3843137, 0, 1,
-1.414264, -1.02405, 0.3004164, 1, 0.3882353, 0, 1,
-1.412443, 1.178474, 0.02366138, 1, 0.3960784, 0, 1,
-1.405474, 0.5801327, -2.71417, 1, 0.4039216, 0, 1,
-1.385336, 0.3464416, -0.8587957, 1, 0.4078431, 0, 1,
-1.375667, -0.4388331, -1.211575, 1, 0.4156863, 0, 1,
-1.374761, -1.482864, -2.775188, 1, 0.4196078, 0, 1,
-1.370518, 0.3790736, 1.345651, 1, 0.427451, 0, 1,
-1.34949, 0.04468525, 0.225498, 1, 0.4313726, 0, 1,
-1.344525, 0.3083157, -2.034376, 1, 0.4392157, 0, 1,
-1.332868, -0.08717817, -2.161554, 1, 0.4431373, 0, 1,
-1.328346, 2.166725, -0.2068728, 1, 0.4509804, 0, 1,
-1.32448, 0.1133742, -1.699943, 1, 0.454902, 0, 1,
-1.321515, -0.8206052, -5.222122, 1, 0.4627451, 0, 1,
-1.319052, 0.01111545, -1.418484, 1, 0.4666667, 0, 1,
-1.308863, 0.8376514, -2.119409, 1, 0.4745098, 0, 1,
-1.307604, 0.08450523, -2.898265, 1, 0.4784314, 0, 1,
-1.304786, 0.9343708, 0.1295701, 1, 0.4862745, 0, 1,
-1.299238, 0.7925948, -2.08433, 1, 0.4901961, 0, 1,
-1.293411, -1.425655, -2.434002, 1, 0.4980392, 0, 1,
-1.280475, -0.5333495, -1.103856, 1, 0.5058824, 0, 1,
-1.278365, 1.47379, -1.861236, 1, 0.509804, 0, 1,
-1.269886, 0.9332321, -0.4318888, 1, 0.5176471, 0, 1,
-1.262907, 0.3768209, -1.054832, 1, 0.5215687, 0, 1,
-1.259644, -1.272963, -2.104128, 1, 0.5294118, 0, 1,
-1.256613, -0.3791941, -2.375464, 1, 0.5333334, 0, 1,
-1.256115, 0.4083335, -1.26798, 1, 0.5411765, 0, 1,
-1.255414, 0.2430576, -1.501876, 1, 0.5450981, 0, 1,
-1.249826, 0.08945868, -0.824349, 1, 0.5529412, 0, 1,
-1.249404, 1.047938, -1.14232, 1, 0.5568628, 0, 1,
-1.244641, -0.5374297, -2.38896, 1, 0.5647059, 0, 1,
-1.242917, -0.8601345, -2.213923, 1, 0.5686275, 0, 1,
-1.239331, -0.7997572, -2.715366, 1, 0.5764706, 0, 1,
-1.233964, 0.9400584, -0.1743861, 1, 0.5803922, 0, 1,
-1.225202, 0.07778356, -2.067448, 1, 0.5882353, 0, 1,
-1.225123, 1.507679, -0.5595158, 1, 0.5921569, 0, 1,
-1.218043, 1.3751, -0.6846368, 1, 0.6, 0, 1,
-1.217359, 0.06379598, -2.090965, 1, 0.6078432, 0, 1,
-1.207861, -1.999654, -1.009665, 1, 0.6117647, 0, 1,
-1.205981, 1.590464, -0.8654685, 1, 0.6196079, 0, 1,
-1.204606, 1.096305, -0.1786684, 1, 0.6235294, 0, 1,
-1.203968, -0.6064935, -1.818873, 1, 0.6313726, 0, 1,
-1.202237, -0.9304722, -2.259161, 1, 0.6352941, 0, 1,
-1.202072, 0.2905817, -0.6735038, 1, 0.6431373, 0, 1,
-1.197846, 1.596441, -2.186767, 1, 0.6470588, 0, 1,
-1.183266, -0.07773396, -0.3774817, 1, 0.654902, 0, 1,
-1.180018, -0.008684619, -0.5083944, 1, 0.6588235, 0, 1,
-1.179465, 0.8522832, -1.285409, 1, 0.6666667, 0, 1,
-1.164166, -0.5320446, -1.527825, 1, 0.6705883, 0, 1,
-1.157342, 1.134125, -1.609321, 1, 0.6784314, 0, 1,
-1.142387, 0.1454866, -0.1989627, 1, 0.682353, 0, 1,
-1.131965, 1.059669, -0.7344277, 1, 0.6901961, 0, 1,
-1.129594, 0.07928744, -2.156343, 1, 0.6941177, 0, 1,
-1.127287, -1.160626, -2.461435, 1, 0.7019608, 0, 1,
-1.12431, -0.7843481, -3.547915, 1, 0.7098039, 0, 1,
-1.124126, -1.320647, -2.199349, 1, 0.7137255, 0, 1,
-1.118519, -0.6963324, -2.827929, 1, 0.7215686, 0, 1,
-1.117223, -0.6826208, -3.567671, 1, 0.7254902, 0, 1,
-1.106651, -0.4287704, 0.9137018, 1, 0.7333333, 0, 1,
-1.104204, -0.2978114, -2.273231, 1, 0.7372549, 0, 1,
-1.099802, 0.01050532, -1.65917, 1, 0.7450981, 0, 1,
-1.098353, 1.878933, -2.287724, 1, 0.7490196, 0, 1,
-1.090147, 0.3234535, -1.145299, 1, 0.7568628, 0, 1,
-1.085126, -1.703717, -2.437595, 1, 0.7607843, 0, 1,
-1.083087, 1.546462, -1.473486, 1, 0.7686275, 0, 1,
-1.072244, -0.5013863, -1.613925, 1, 0.772549, 0, 1,
-1.069134, 0.1846342, -3.020422, 1, 0.7803922, 0, 1,
-1.061272, 2.293405, -0.7659044, 1, 0.7843137, 0, 1,
-1.052861, -1.683054, -2.050498, 1, 0.7921569, 0, 1,
-1.042528, 1.214996, -1.263424, 1, 0.7960784, 0, 1,
-1.029478, 0.4908029, -3.804324, 1, 0.8039216, 0, 1,
-1.026593, 1.507155, 0.3170449, 1, 0.8117647, 0, 1,
-1.02543, -1.943944, -3.6523, 1, 0.8156863, 0, 1,
-1.019394, 0.7721611, -2.223284, 1, 0.8235294, 0, 1,
-1.018782, 0.4468093, -0.7348753, 1, 0.827451, 0, 1,
-1.013049, -2.326952, -3.450908, 1, 0.8352941, 0, 1,
-1.004829, 0.3215831, -0.601782, 1, 0.8392157, 0, 1,
-1.001372, 0.8387889, -1.070284, 1, 0.8470588, 0, 1,
-0.9992918, 0.4261823, -1.039447, 1, 0.8509804, 0, 1,
-0.9918718, -0.5164661, -2.097927, 1, 0.8588235, 0, 1,
-0.9915773, 0.04864395, -2.191426, 1, 0.8627451, 0, 1,
-0.9857779, 0.6262466, -0.5493184, 1, 0.8705882, 0, 1,
-0.9816456, 0.648036, -1.456003, 1, 0.8745098, 0, 1,
-0.9791566, 0.584127, -1.106237, 1, 0.8823529, 0, 1,
-0.9682932, 0.5428826, -1.738175, 1, 0.8862745, 0, 1,
-0.9681204, -0.4931859, 0.2872709, 1, 0.8941177, 0, 1,
-0.9676453, 0.1056233, -1.435755, 1, 0.8980392, 0, 1,
-0.9667158, -1.052413, -0.1133268, 1, 0.9058824, 0, 1,
-0.9641058, -0.5254244, -2.538353, 1, 0.9137255, 0, 1,
-0.9605646, -0.1931976, -2.31389, 1, 0.9176471, 0, 1,
-0.9596097, -1.393585, -2.216621, 1, 0.9254902, 0, 1,
-0.9549001, 0.9567218, -1.368128, 1, 0.9294118, 0, 1,
-0.9490445, 0.03030346, -1.944774, 1, 0.9372549, 0, 1,
-0.9326633, 0.649146, -2.029402, 1, 0.9411765, 0, 1,
-0.930511, 0.07965117, -0.1672395, 1, 0.9490196, 0, 1,
-0.9300304, 0.6311628, -3.056737, 1, 0.9529412, 0, 1,
-0.92537, -0.3366038, -2.055535, 1, 0.9607843, 0, 1,
-0.9242122, 0.6930738, -0.6790779, 1, 0.9647059, 0, 1,
-0.9229524, -0.28266, -2.067016, 1, 0.972549, 0, 1,
-0.9220487, 0.6938356, 0.5327268, 1, 0.9764706, 0, 1,
-0.9169879, 1.08047, 1.149455, 1, 0.9843137, 0, 1,
-0.9081357, -0.6759872, -2.466427, 1, 0.9882353, 0, 1,
-0.9033256, 0.3933442, -0.7332256, 1, 0.9960784, 0, 1,
-0.8980806, -1.496511, -3.34199, 0.9960784, 1, 0, 1,
-0.8977936, -2.606243, -1.120473, 0.9921569, 1, 0, 1,
-0.8935508, 0.5193575, -2.058183, 0.9843137, 1, 0, 1,
-0.889762, -1.087747, -4.277844, 0.9803922, 1, 0, 1,
-0.8772166, -1.088617, -3.057224, 0.972549, 1, 0, 1,
-0.8771086, 1.011404, -0.5576404, 0.9686275, 1, 0, 1,
-0.8755922, -0.2979693, -0.567504, 0.9607843, 1, 0, 1,
-0.8745295, 0.3834424, 0.29796, 0.9568627, 1, 0, 1,
-0.8740296, -0.8103923, -1.200402, 0.9490196, 1, 0, 1,
-0.8731703, -1.310686, -3.294258, 0.945098, 1, 0, 1,
-0.8700129, -1.631158, -1.149021, 0.9372549, 1, 0, 1,
-0.8690896, 2.000787, -2.189382, 0.9333333, 1, 0, 1,
-0.8660944, 1.122584, -0.9499228, 0.9254902, 1, 0, 1,
-0.864879, -0.4074599, 0.4470707, 0.9215686, 1, 0, 1,
-0.8559836, -1.184072, -2.476137, 0.9137255, 1, 0, 1,
-0.8536199, 0.1094981, -3.666517, 0.9098039, 1, 0, 1,
-0.8505642, 0.4963957, -0.9485912, 0.9019608, 1, 0, 1,
-0.8493996, 0.5747508, -1.737063, 0.8941177, 1, 0, 1,
-0.8478019, 0.2667205, -0.3967471, 0.8901961, 1, 0, 1,
-0.8458824, -0.2630645, -2.47775, 0.8823529, 1, 0, 1,
-0.8442985, -0.1603407, -2.227411, 0.8784314, 1, 0, 1,
-0.842956, -1.140205, -3.013133, 0.8705882, 1, 0, 1,
-0.8429478, 0.7440826, -0.9540366, 0.8666667, 1, 0, 1,
-0.8411056, 2.280174, -1.861607, 0.8588235, 1, 0, 1,
-0.8399157, 1.548495, -0.7155403, 0.854902, 1, 0, 1,
-0.8394683, -1.201322, -2.795776, 0.8470588, 1, 0, 1,
-0.8365149, -0.1398038, -1.732844, 0.8431373, 1, 0, 1,
-0.8363174, -0.1649855, -2.729959, 0.8352941, 1, 0, 1,
-0.8360593, 0.3248938, -1.910285, 0.8313726, 1, 0, 1,
-0.8356067, -1.150803, -1.148418, 0.8235294, 1, 0, 1,
-0.8253607, -0.649161, -1.619672, 0.8196079, 1, 0, 1,
-0.8207437, -0.09383579, -2.786362, 0.8117647, 1, 0, 1,
-0.8193647, -1.202212, -3.070281, 0.8078431, 1, 0, 1,
-0.8157119, 0.4813243, -0.9420548, 0.8, 1, 0, 1,
-0.815396, -1.162431, -2.196897, 0.7921569, 1, 0, 1,
-0.8150219, 0.2945472, -1.368903, 0.7882353, 1, 0, 1,
-0.812849, 0.1143965, -0.1180696, 0.7803922, 1, 0, 1,
-0.8125643, 0.05914304, -1.29862, 0.7764706, 1, 0, 1,
-0.8077531, -0.2698873, -2.416723, 0.7686275, 1, 0, 1,
-0.8041153, 0.6233988, -1.732531, 0.7647059, 1, 0, 1,
-0.8029824, -0.3770069, -1.229682, 0.7568628, 1, 0, 1,
-0.8009083, 1.33142, -1.938448, 0.7529412, 1, 0, 1,
-0.7937415, -0.7497396, -3.345837, 0.7450981, 1, 0, 1,
-0.7925901, 1.044351, -1.167284, 0.7411765, 1, 0, 1,
-0.7860789, -0.3409759, -1.905283, 0.7333333, 1, 0, 1,
-0.7798863, 0.01071297, -2.185829, 0.7294118, 1, 0, 1,
-0.7783848, 0.7723826, -0.6599358, 0.7215686, 1, 0, 1,
-0.7755516, -2.885292, -3.20682, 0.7176471, 1, 0, 1,
-0.7737163, 0.4385789, -2.211086, 0.7098039, 1, 0, 1,
-0.7726661, 0.4609098, -0.2124606, 0.7058824, 1, 0, 1,
-0.772305, 2.189515, -1.852302, 0.6980392, 1, 0, 1,
-0.7691325, -0.9521828, -2.428371, 0.6901961, 1, 0, 1,
-0.7632858, -1.710734, -3.85189, 0.6862745, 1, 0, 1,
-0.7590241, 1.689154, 0.7178319, 0.6784314, 1, 0, 1,
-0.758172, 0.2300019, -0.6566632, 0.6745098, 1, 0, 1,
-0.7556427, 1.581329, 0.9283676, 0.6666667, 1, 0, 1,
-0.7545331, 2.172764, -0.5393575, 0.6627451, 1, 0, 1,
-0.7519541, 1.723519, -1.366752, 0.654902, 1, 0, 1,
-0.7496988, -1.34586, -2.228642, 0.6509804, 1, 0, 1,
-0.7458788, 1.025061, -1.242695, 0.6431373, 1, 0, 1,
-0.7366822, 0.2380889, -2.87079, 0.6392157, 1, 0, 1,
-0.7268005, 0.8365765, -1.806584, 0.6313726, 1, 0, 1,
-0.725015, -0.8609806, -2.695964, 0.627451, 1, 0, 1,
-0.7152423, -1.208445, -2.150326, 0.6196079, 1, 0, 1,
-0.7059309, -0.4606011, -2.160237, 0.6156863, 1, 0, 1,
-0.7019163, 0.01626782, -2.721676, 0.6078432, 1, 0, 1,
-0.6999131, 0.8473383, -0.2390953, 0.6039216, 1, 0, 1,
-0.6984208, -1.07103, -1.052674, 0.5960785, 1, 0, 1,
-0.6961322, 0.3429812, -0.01023086, 0.5882353, 1, 0, 1,
-0.6954706, 0.7290546, -1.503921, 0.5843138, 1, 0, 1,
-0.693032, -2.488007, -1.049327, 0.5764706, 1, 0, 1,
-0.6916217, 0.6963142, -0.7327643, 0.572549, 1, 0, 1,
-0.6903654, -1.036996, -0.9610308, 0.5647059, 1, 0, 1,
-0.6900716, -0.2395928, -2.037287, 0.5607843, 1, 0, 1,
-0.6861643, -1.108287, -1.66192, 0.5529412, 1, 0, 1,
-0.6846488, 0.3758724, -1.355536, 0.5490196, 1, 0, 1,
-0.6811447, 0.07203732, -3.882416, 0.5411765, 1, 0, 1,
-0.674342, 0.3929589, -1.157266, 0.5372549, 1, 0, 1,
-0.6736075, 0.337718, -1.826485, 0.5294118, 1, 0, 1,
-0.672349, 0.8983045, -1.513789, 0.5254902, 1, 0, 1,
-0.6722333, -0.5850643, -1.539021, 0.5176471, 1, 0, 1,
-0.6720927, -1.293914, -3.078667, 0.5137255, 1, 0, 1,
-0.671315, -0.00101746, -2.510008, 0.5058824, 1, 0, 1,
-0.6672992, 0.4897709, -1.790298, 0.5019608, 1, 0, 1,
-0.6657208, 0.09821571, -3.077032, 0.4941176, 1, 0, 1,
-0.6611989, -0.6789025, -1.583435, 0.4862745, 1, 0, 1,
-0.6508921, 0.3444394, -1.919006, 0.4823529, 1, 0, 1,
-0.6456019, -0.04029921, -1.783106, 0.4745098, 1, 0, 1,
-0.6432446, -0.1698142, -1.783584, 0.4705882, 1, 0, 1,
-0.6422443, -0.1116657, -1.76514, 0.4627451, 1, 0, 1,
-0.6421105, 0.6065041, -0.6621735, 0.4588235, 1, 0, 1,
-0.636647, 0.8088313, -0.02567358, 0.4509804, 1, 0, 1,
-0.6355938, -0.8764368, -2.714228, 0.4470588, 1, 0, 1,
-0.6351929, 0.9015206, -0.600055, 0.4392157, 1, 0, 1,
-0.63087, 0.9275577, 0.2630526, 0.4352941, 1, 0, 1,
-0.62928, -0.03561755, -1.650968, 0.427451, 1, 0, 1,
-0.6260128, 0.4625259, -1.871465, 0.4235294, 1, 0, 1,
-0.624616, -2.264658, -5.035749, 0.4156863, 1, 0, 1,
-0.6225829, 0.3589755, -1.593113, 0.4117647, 1, 0, 1,
-0.6197109, -1.839213, -2.43704, 0.4039216, 1, 0, 1,
-0.6164724, 0.9865428, -0.6391986, 0.3960784, 1, 0, 1,
-0.6153821, -0.440162, -2.061407, 0.3921569, 1, 0, 1,
-0.6034535, 0.5530142, -1.681297, 0.3843137, 1, 0, 1,
-0.5965705, 0.7290024, -1.442593, 0.3803922, 1, 0, 1,
-0.5947739, 1.279009, 1.001048, 0.372549, 1, 0, 1,
-0.5941878, -1.275061, -2.802056, 0.3686275, 1, 0, 1,
-0.593309, 0.9957945, 0.4887659, 0.3607843, 1, 0, 1,
-0.5885153, -0.2208928, -1.083259, 0.3568628, 1, 0, 1,
-0.5862821, 0.7024429, -2.110287, 0.3490196, 1, 0, 1,
-0.5850139, 2.143978, -1.746699, 0.345098, 1, 0, 1,
-0.5807222, -0.1241071, -3.584305, 0.3372549, 1, 0, 1,
-0.5806556, 0.3718649, 0.6191587, 0.3333333, 1, 0, 1,
-0.5785736, -0.01749999, -0.4020499, 0.3254902, 1, 0, 1,
-0.5758197, 0.7112425, -1.219121, 0.3215686, 1, 0, 1,
-0.5750732, 0.4245634, 0.602413, 0.3137255, 1, 0, 1,
-0.5744328, -0.5401943, -2.522039, 0.3098039, 1, 0, 1,
-0.5734552, 0.2458761, -1.104293, 0.3019608, 1, 0, 1,
-0.5722352, 0.1928245, -2.350003, 0.2941177, 1, 0, 1,
-0.5681452, -1.656842, -0.3138376, 0.2901961, 1, 0, 1,
-0.5659359, -0.7554942, -2.971234, 0.282353, 1, 0, 1,
-0.563381, -0.2842519, -3.301728, 0.2784314, 1, 0, 1,
-0.5633618, 0.8490555, 1.762182, 0.2705882, 1, 0, 1,
-0.5623813, 0.7358439, -0.6985021, 0.2666667, 1, 0, 1,
-0.5561707, 1.438672, 0.3293591, 0.2588235, 1, 0, 1,
-0.5558732, -0.7602424, -2.705497, 0.254902, 1, 0, 1,
-0.5557292, 0.2950615, -1.32167, 0.2470588, 1, 0, 1,
-0.5554479, 0.05281417, -2.023137, 0.2431373, 1, 0, 1,
-0.5551514, -1.08622, -1.243266, 0.2352941, 1, 0, 1,
-0.5524104, -1.17297, -2.320364, 0.2313726, 1, 0, 1,
-0.5519486, -0.5386447, -1.283187, 0.2235294, 1, 0, 1,
-0.5403682, 1.235401, -0.5420042, 0.2196078, 1, 0, 1,
-0.5388451, 0.5308489, -0.3889704, 0.2117647, 1, 0, 1,
-0.5387591, 0.02501866, -3.014089, 0.2078431, 1, 0, 1,
-0.5352814, 0.2240755, 1.26351, 0.2, 1, 0, 1,
-0.532838, -0.08002186, -1.976919, 0.1921569, 1, 0, 1,
-0.5326576, -1.138852, -1.133143, 0.1882353, 1, 0, 1,
-0.5290641, 0.5879508, 0.1151113, 0.1803922, 1, 0, 1,
-0.5283834, 1.550941, 0.4339495, 0.1764706, 1, 0, 1,
-0.5199515, 0.9977763, -0.1801624, 0.1686275, 1, 0, 1,
-0.5164257, 1.637769, -0.7899364, 0.1647059, 1, 0, 1,
-0.5154949, 0.588267, -1.713537, 0.1568628, 1, 0, 1,
-0.5110117, 0.4077674, -1.904734, 0.1529412, 1, 0, 1,
-0.508739, -0.6939771, -2.058593, 0.145098, 1, 0, 1,
-0.5030529, -0.1659765, -2.021949, 0.1411765, 1, 0, 1,
-0.502054, -1.170945, -2.803286, 0.1333333, 1, 0, 1,
-0.4974823, -0.09413765, -1.980191, 0.1294118, 1, 0, 1,
-0.4961731, 0.2349662, -2.306864, 0.1215686, 1, 0, 1,
-0.4942614, -0.7013606, -0.8576987, 0.1176471, 1, 0, 1,
-0.4868118, -2.457889, -0.009599601, 0.1098039, 1, 0, 1,
-0.4853609, 0.3298646, -3.367308, 0.1058824, 1, 0, 1,
-0.4832439, 0.102756, -2.433393, 0.09803922, 1, 0, 1,
-0.4768225, 1.155859, 3.649689, 0.09019608, 1, 0, 1,
-0.4731324, 0.4870061, -1.594375, 0.08627451, 1, 0, 1,
-0.4717376, 0.07232243, -1.387071, 0.07843138, 1, 0, 1,
-0.4702003, -0.2158024, -1.61444, 0.07450981, 1, 0, 1,
-0.4677985, -0.8828547, -2.684191, 0.06666667, 1, 0, 1,
-0.4649805, 0.833933, 0.9877483, 0.0627451, 1, 0, 1,
-0.4637533, 0.6795327, -1.488462, 0.05490196, 1, 0, 1,
-0.4633756, 1.59485, -1.86993, 0.05098039, 1, 0, 1,
-0.4629888, 0.5825169, -1.586955, 0.04313726, 1, 0, 1,
-0.4625267, 0.05787512, -1.34172, 0.03921569, 1, 0, 1,
-0.4609561, -0.2497456, -2.431797, 0.03137255, 1, 0, 1,
-0.4554013, -0.577562, -0.9299656, 0.02745098, 1, 0, 1,
-0.454009, 0.1810968, 0.6021783, 0.01960784, 1, 0, 1,
-0.4517117, -2.736648, -1.31158, 0.01568628, 1, 0, 1,
-0.4505619, 1.190032, -1.068446, 0.007843138, 1, 0, 1,
-0.4482895, -0.8615592, -3.033686, 0.003921569, 1, 0, 1,
-0.4473965, 0.3236396, -1.172219, 0, 1, 0.003921569, 1,
-0.4458209, 0.5463137, -1.005381, 0, 1, 0.01176471, 1,
-0.4457569, 0.4145257, -0.2271954, 0, 1, 0.01568628, 1,
-0.444467, 0.2807759, -0.3655589, 0, 1, 0.02352941, 1,
-0.4405231, -0.6334258, -3.189925, 0, 1, 0.02745098, 1,
-0.4394833, 0.5666198, -1.654496, 0, 1, 0.03529412, 1,
-0.4368583, -0.9081314, -2.83005, 0, 1, 0.03921569, 1,
-0.4348647, -0.2767299, -0.1495783, 0, 1, 0.04705882, 1,
-0.4304453, -1.110825, -2.914157, 0, 1, 0.05098039, 1,
-0.4297226, 0.3067523, -1.313874, 0, 1, 0.05882353, 1,
-0.4278478, 0.9921197, -1.121306, 0, 1, 0.0627451, 1,
-0.4260934, 0.4161768, -2.356172, 0, 1, 0.07058824, 1,
-0.4256173, 0.880575, 0.251596, 0, 1, 0.07450981, 1,
-0.4225239, -0.4530661, -1.997513, 0, 1, 0.08235294, 1,
-0.4222289, -1.676675, -2.783036, 0, 1, 0.08627451, 1,
-0.4219366, 0.2929146, 0.2829337, 0, 1, 0.09411765, 1,
-0.421531, 0.318533, -1.276108, 0, 1, 0.1019608, 1,
-0.4202174, -1.506275, -5.510232, 0, 1, 0.1058824, 1,
-0.419964, -0.2759602, -1.531066, 0, 1, 0.1137255, 1,
-0.4174948, -0.2550928, -2.162919, 0, 1, 0.1176471, 1,
-0.4157623, -0.7334557, -3.178711, 0, 1, 0.1254902, 1,
-0.412641, -0.2860307, -1.748618, 0, 1, 0.1294118, 1,
-0.4081261, -1.372978, -1.354018, 0, 1, 0.1372549, 1,
-0.4073724, 0.9876149, -0.2207753, 0, 1, 0.1411765, 1,
-0.4036236, -0.1882777, -0.5514389, 0, 1, 0.1490196, 1,
-0.3972991, -0.85873, -2.452749, 0, 1, 0.1529412, 1,
-0.3927396, -0.2413891, -2.407809, 0, 1, 0.1607843, 1,
-0.3926157, 0.8401851, 0.559532, 0, 1, 0.1647059, 1,
-0.3921974, 0.9622796, 0.3014139, 0, 1, 0.172549, 1,
-0.3820838, -1.674648, -2.101782, 0, 1, 0.1764706, 1,
-0.3819381, -1.086934, -3.720432, 0, 1, 0.1843137, 1,
-0.3793862, 0.6906393, -2.42633, 0, 1, 0.1882353, 1,
-0.3684151, 1.13567, 0.3156705, 0, 1, 0.1960784, 1,
-0.3650462, 0.8632343, -0.03270555, 0, 1, 0.2039216, 1,
-0.3564308, -0.08831165, -2.644471, 0, 1, 0.2078431, 1,
-0.3519523, 1.0506, -1.284378, 0, 1, 0.2156863, 1,
-0.3509725, 1.310986, 0.4964778, 0, 1, 0.2196078, 1,
-0.3485419, 0.627634, -1.123085, 0, 1, 0.227451, 1,
-0.3471563, -0.5537387, -2.98645, 0, 1, 0.2313726, 1,
-0.345418, 1.388176, -1.48201, 0, 1, 0.2392157, 1,
-0.3449669, -1.120191, -3.699841, 0, 1, 0.2431373, 1,
-0.3444549, 0.2218006, -0.6078964, 0, 1, 0.2509804, 1,
-0.3424367, 0.6343441, -0.9331903, 0, 1, 0.254902, 1,
-0.3415803, -1.418019, -2.420701, 0, 1, 0.2627451, 1,
-0.3407382, 1.644392, 0.6229208, 0, 1, 0.2666667, 1,
-0.3401247, 0.3094327, -0.3597201, 0, 1, 0.2745098, 1,
-0.3393084, -0.6627647, -1.596068, 0, 1, 0.2784314, 1,
-0.3390006, 0.3662488, -0.873919, 0, 1, 0.2862745, 1,
-0.3383803, -2.452194, -1.626464, 0, 1, 0.2901961, 1,
-0.3363891, -0.5526408, -2.142208, 0, 1, 0.2980392, 1,
-0.3359483, 2.80977, -1.4013, 0, 1, 0.3058824, 1,
-0.3358777, 1.060944, -0.2621209, 0, 1, 0.3098039, 1,
-0.3326113, 0.6332018, -0.07449439, 0, 1, 0.3176471, 1,
-0.3302614, 0.5302526, 0.3237548, 0, 1, 0.3215686, 1,
-0.329338, -0.1576893, -0.9195293, 0, 1, 0.3294118, 1,
-0.3241729, -0.06943832, -2.853583, 0, 1, 0.3333333, 1,
-0.3230307, -0.3762895, -0.7174218, 0, 1, 0.3411765, 1,
-0.3213217, -0.4381548, -1.310606, 0, 1, 0.345098, 1,
-0.3196361, -0.3469625, -3.221149, 0, 1, 0.3529412, 1,
-0.317391, -0.3565436, -1.722683, 0, 1, 0.3568628, 1,
-0.3123688, -0.895099, -2.20762, 0, 1, 0.3647059, 1,
-0.3110348, 1.044081, 0.3436004, 0, 1, 0.3686275, 1,
-0.307757, -1.529664, -3.752252, 0, 1, 0.3764706, 1,
-0.3027042, -0.7678229, -3.626954, 0, 1, 0.3803922, 1,
-0.300581, 0.1536734, -0.6593187, 0, 1, 0.3882353, 1,
-0.2969621, -0.3697392, -3.93236, 0, 1, 0.3921569, 1,
-0.2925684, 0.2522205, -2.046337, 0, 1, 0.4, 1,
-0.2905555, 0.2726771, -0.0751534, 0, 1, 0.4078431, 1,
-0.2886688, -1.907551, -2.7405, 0, 1, 0.4117647, 1,
-0.2876667, -1.096634, -1.426499, 0, 1, 0.4196078, 1,
-0.2845716, -0.08418486, -1.114705, 0, 1, 0.4235294, 1,
-0.2829468, 1.815103, 1.373681, 0, 1, 0.4313726, 1,
-0.2827656, -0.03441558, -1.722204, 0, 1, 0.4352941, 1,
-0.2769577, 0.6996942, 0.188249, 0, 1, 0.4431373, 1,
-0.2756671, -0.9026688, -4.215251, 0, 1, 0.4470588, 1,
-0.2707059, 0.1346346, -0.3842208, 0, 1, 0.454902, 1,
-0.2706584, 0.8682193, 1.481748, 0, 1, 0.4588235, 1,
-0.2686599, 1.037414, 1.354283, 0, 1, 0.4666667, 1,
-0.2659905, -0.4587489, -1.882011, 0, 1, 0.4705882, 1,
-0.2656286, 0.3062077, 0.9272823, 0, 1, 0.4784314, 1,
-0.26404, 1.381508, 2.561912, 0, 1, 0.4823529, 1,
-0.2639757, 0.6602445, -0.7262909, 0, 1, 0.4901961, 1,
-0.2627188, -0.4400948, -2.733298, 0, 1, 0.4941176, 1,
-0.2608705, -0.1494215, -1.775187, 0, 1, 0.5019608, 1,
-0.2586446, -0.6534864, -3.220685, 0, 1, 0.509804, 1,
-0.2584281, 0.07469091, -1.313392, 0, 1, 0.5137255, 1,
-0.2579156, 0.3161984, -0.6000485, 0, 1, 0.5215687, 1,
-0.2565461, 0.5365664, -0.7623962, 0, 1, 0.5254902, 1,
-0.2523564, 0.6712203, -1.979261, 0, 1, 0.5333334, 1,
-0.2519008, 0.01640366, -1.895206, 0, 1, 0.5372549, 1,
-0.2482201, -1.782428, -3.845936, 0, 1, 0.5450981, 1,
-0.2479861, 0.01792261, -1.827067, 0, 1, 0.5490196, 1,
-0.2282953, -0.1801842, -2.186133, 0, 1, 0.5568628, 1,
-0.2277894, 1.036326, 1.943075, 0, 1, 0.5607843, 1,
-0.2214852, -1.137986, -4.197444, 0, 1, 0.5686275, 1,
-0.2207953, 0.2843773, -1.034861, 0, 1, 0.572549, 1,
-0.220049, 1.700746, 1.080411, 0, 1, 0.5803922, 1,
-0.2195058, -0.1907582, -2.061909, 0, 1, 0.5843138, 1,
-0.2185642, 2.223159, -0.6230375, 0, 1, 0.5921569, 1,
-0.2129903, 0.0812318, -0.3170411, 0, 1, 0.5960785, 1,
-0.2124693, -0.1551092, -2.101655, 0, 1, 0.6039216, 1,
-0.2114569, -0.4447066, -2.364154, 0, 1, 0.6117647, 1,
-0.2105809, -0.08934091, -1.717101, 0, 1, 0.6156863, 1,
-0.208367, 0.390234, -1.07984, 0, 1, 0.6235294, 1,
-0.2062207, 1.655701, -0.0967578, 0, 1, 0.627451, 1,
-0.2061164, -0.1720561, -0.8403742, 0, 1, 0.6352941, 1,
-0.2055549, -1.725515, -5.465265, 0, 1, 0.6392157, 1,
-0.2029671, 2.309021, -0.9228197, 0, 1, 0.6470588, 1,
-0.2016414, -0.2569653, -3.500827, 0, 1, 0.6509804, 1,
-0.1987264, -0.3272019, -2.733251, 0, 1, 0.6588235, 1,
-0.1960579, -0.7709673, -3.038159, 0, 1, 0.6627451, 1,
-0.1950942, 0.08416361, -1.297361, 0, 1, 0.6705883, 1,
-0.1920071, 1.781265, 0.7394089, 0, 1, 0.6745098, 1,
-0.18975, -0.6834456, -2.188224, 0, 1, 0.682353, 1,
-0.1890893, -0.4617861, -3.020852, 0, 1, 0.6862745, 1,
-0.1855781, 3.34425, -0.2237466, 0, 1, 0.6941177, 1,
-0.1851764, -0.06847056, -3.177039, 0, 1, 0.7019608, 1,
-0.1837771, -2.328363, -1.803177, 0, 1, 0.7058824, 1,
-0.1821798, -0.2555455, -1.916813, 0, 1, 0.7137255, 1,
-0.1793646, 0.7494395, -2.498423, 0, 1, 0.7176471, 1,
-0.1731303, 0.569884, 0.7341688, 0, 1, 0.7254902, 1,
-0.1731009, -0.4591984, -1.598965, 0, 1, 0.7294118, 1,
-0.1682586, -0.933899, -2.536985, 0, 1, 0.7372549, 1,
-0.1672619, 0.4228905, -0.6330118, 0, 1, 0.7411765, 1,
-0.1601768, -0.2669853, -0.9502473, 0, 1, 0.7490196, 1,
-0.1580334, 1.355102, -0.4986633, 0, 1, 0.7529412, 1,
-0.157058, 0.1517422, -0.9262565, 0, 1, 0.7607843, 1,
-0.156845, 0.6778004, 0.4523167, 0, 1, 0.7647059, 1,
-0.1565321, -1.508444, -2.986971, 0, 1, 0.772549, 1,
-0.1546853, 1.221315, -0.6844759, 0, 1, 0.7764706, 1,
-0.1532715, -0.6925553, -1.771361, 0, 1, 0.7843137, 1,
-0.1523656, 2.361868, -1.148541, 0, 1, 0.7882353, 1,
-0.1491307, -1.337511, -2.14452, 0, 1, 0.7960784, 1,
-0.1435603, -1.770346, -1.883785, 0, 1, 0.8039216, 1,
-0.1387177, -0.03670883, -1.833142, 0, 1, 0.8078431, 1,
-0.1372191, 0.6281523, 1.381005, 0, 1, 0.8156863, 1,
-0.1350684, 0.8696828, 0.1241531, 0, 1, 0.8196079, 1,
-0.1311302, 0.2880015, -2.900573, 0, 1, 0.827451, 1,
-0.1287106, 0.6297247, 1.164611, 0, 1, 0.8313726, 1,
-0.127465, -1.701722, -2.444525, 0, 1, 0.8392157, 1,
-0.1249539, 0.3354134, -1.447087, 0, 1, 0.8431373, 1,
-0.1219345, 2.328695, 0.2361154, 0, 1, 0.8509804, 1,
-0.1216795, 1.424956, -0.3402677, 0, 1, 0.854902, 1,
-0.1173214, -0.4455796, -1.279194, 0, 1, 0.8627451, 1,
-0.1139293, -0.8384804, -2.832554, 0, 1, 0.8666667, 1,
-0.11267, 1.782738, -1.141701, 0, 1, 0.8745098, 1,
-0.1087547, 0.1935013, -1.675528, 0, 1, 0.8784314, 1,
-0.1064018, -1.873466, -2.66734, 0, 1, 0.8862745, 1,
-0.1036331, 0.3955856, -0.4957478, 0, 1, 0.8901961, 1,
-0.10341, 0.5548142, -0.7346743, 0, 1, 0.8980392, 1,
-0.1009881, -0.4136942, -2.535172, 0, 1, 0.9058824, 1,
-0.100927, 0.2941091, 2.088531, 0, 1, 0.9098039, 1,
-0.1006433, -0.2958261, -2.569203, 0, 1, 0.9176471, 1,
-0.09736292, -0.3826323, -3.414428, 0, 1, 0.9215686, 1,
-0.0972928, 0.2387698, -1.574773, 0, 1, 0.9294118, 1,
-0.08971294, -0.4363385, -5.850685, 0, 1, 0.9333333, 1,
-0.08896568, 0.5550642, -1.100775, 0, 1, 0.9411765, 1,
-0.0798902, 0.5633185, -1.095614, 0, 1, 0.945098, 1,
-0.07898618, -2.199105, -3.037395, 0, 1, 0.9529412, 1,
-0.07358077, -1.656825, -3.178139, 0, 1, 0.9568627, 1,
-0.07162438, -0.1462267, -3.051705, 0, 1, 0.9647059, 1,
-0.07096184, -0.1948118, -4.234858, 0, 1, 0.9686275, 1,
-0.06747778, 0.9212984, 0.1876014, 0, 1, 0.9764706, 1,
-0.06675112, -0.1999742, -4.091346, 0, 1, 0.9803922, 1,
-0.0661929, -0.06968208, -1.591251, 0, 1, 0.9882353, 1,
-0.06295338, 1.45891, 0.3194685, 0, 1, 0.9921569, 1,
-0.05730617, 1.019362, 0.3084073, 0, 1, 1, 1,
-0.05195256, -0.4323181, -3.263102, 0, 0.9921569, 1, 1,
-0.04821756, 1.650583, 0.300299, 0, 0.9882353, 1, 1,
-0.04772865, -0.5679031, -2.687745, 0, 0.9803922, 1, 1,
-0.04594916, -0.7860704, -3.989716, 0, 0.9764706, 1, 1,
-0.04494943, 1.07874, -0.4734181, 0, 0.9686275, 1, 1,
-0.04434212, -1.139995, -3.293192, 0, 0.9647059, 1, 1,
-0.04377311, -1.134597, -3.623019, 0, 0.9568627, 1, 1,
-0.04330526, 2.140426, -0.6685959, 0, 0.9529412, 1, 1,
-0.04212013, -0.04430656, -3.677996, 0, 0.945098, 1, 1,
-0.04150138, 1.186128, -1.132667, 0, 0.9411765, 1, 1,
-0.03986441, -0.4491409, -4.824902, 0, 0.9333333, 1, 1,
-0.03823308, 1.547468, 2.4182, 0, 0.9294118, 1, 1,
-0.03775657, -0.8049962, -3.981246, 0, 0.9215686, 1, 1,
-0.03460456, 0.4648472, -0.8223957, 0, 0.9176471, 1, 1,
-0.02985172, -1.021262, -4.072925, 0, 0.9098039, 1, 1,
-0.02978906, 0.5451362, 0.3618805, 0, 0.9058824, 1, 1,
-0.02924333, 0.8656399, 0.2725333, 0, 0.8980392, 1, 1,
-0.02267001, 0.09079894, 0.1633442, 0, 0.8901961, 1, 1,
-0.01943899, -0.5372637, -1.813548, 0, 0.8862745, 1, 1,
-0.01796277, 0.002076977, -0.4108109, 0, 0.8784314, 1, 1,
-0.01726003, -0.02770579, -2.067292, 0, 0.8745098, 1, 1,
-0.01555386, 0.8701576, -0.641495, 0, 0.8666667, 1, 1,
-0.01485724, -2.092891, -4.333292, 0, 0.8627451, 1, 1,
-0.01325793, 1.13139, -1.473765, 0, 0.854902, 1, 1,
-0.01310646, -0.7513128, -3.488225, 0, 0.8509804, 1, 1,
-0.004666999, 0.5098768, 0.3917494, 0, 0.8431373, 1, 1,
0.0006868692, 0.6582736, 1.903133, 0, 0.8392157, 1, 1,
0.002539676, 0.8180174, -0.3857713, 0, 0.8313726, 1, 1,
0.005063169, 0.03685539, 0.7464315, 0, 0.827451, 1, 1,
0.006928521, -1.107332, 1.462958, 0, 0.8196079, 1, 1,
0.007427722, 1.367785, 1.321579, 0, 0.8156863, 1, 1,
0.01250586, 0.2342845, 0.6209993, 0, 0.8078431, 1, 1,
0.01271133, -0.1362856, 3.869961, 0, 0.8039216, 1, 1,
0.0132056, -0.8480708, 4.348266, 0, 0.7960784, 1, 1,
0.01601958, -0.9059337, 4.294146, 0, 0.7882353, 1, 1,
0.01739343, 0.514438, 1.215822, 0, 0.7843137, 1, 1,
0.01977875, 0.7526627, 0.4674761, 0, 0.7764706, 1, 1,
0.02062758, 0.006594219, 1.441624, 0, 0.772549, 1, 1,
0.02154079, 1.833104, 1.154244, 0, 0.7647059, 1, 1,
0.02620875, 1.594388, 0.7417784, 0, 0.7607843, 1, 1,
0.02726149, 1.932583, 0.8596374, 0, 0.7529412, 1, 1,
0.03043249, 0.8511683, -0.1986786, 0, 0.7490196, 1, 1,
0.03148926, -1.367887, 2.051738, 0, 0.7411765, 1, 1,
0.04989125, 0.186831, -0.6363876, 0, 0.7372549, 1, 1,
0.05220133, 0.7290276, 0.8769727, 0, 0.7294118, 1, 1,
0.05562712, -0.6367303, 2.18122, 0, 0.7254902, 1, 1,
0.05757347, 0.4048345, 0.7009121, 0, 0.7176471, 1, 1,
0.05839998, 0.1652456, -2.542812, 0, 0.7137255, 1, 1,
0.05957585, -1.529513, 3.501674, 0, 0.7058824, 1, 1,
0.06045643, -0.4141288, 2.737422, 0, 0.6980392, 1, 1,
0.06596572, -0.4848554, 4.057085, 0, 0.6941177, 1, 1,
0.06887528, 0.5556279, 0.8894892, 0, 0.6862745, 1, 1,
0.06942537, -0.01558338, 2.254952, 0, 0.682353, 1, 1,
0.07029851, 0.8295895, 0.2319598, 0, 0.6745098, 1, 1,
0.0712127, -0.02330578, 1.014689, 0, 0.6705883, 1, 1,
0.07206087, 0.4547027, 0.6677042, 0, 0.6627451, 1, 1,
0.07874069, -0.1807584, 2.625758, 0, 0.6588235, 1, 1,
0.08204045, 0.1614779, 0.674435, 0, 0.6509804, 1, 1,
0.08300181, -0.4124424, 3.565441, 0, 0.6470588, 1, 1,
0.08879071, -0.9109281, 2.666152, 0, 0.6392157, 1, 1,
0.08881998, -2.124253, 4.391085, 0, 0.6352941, 1, 1,
0.09653798, 1.213855, -1.531293, 0, 0.627451, 1, 1,
0.09832974, -0.2158596, 2.323693, 0, 0.6235294, 1, 1,
0.09875388, -0.05756474, 1.594175, 0, 0.6156863, 1, 1,
0.09957839, 0.2786475, -0.6829274, 0, 0.6117647, 1, 1,
0.09983734, -0.2641391, 1.677084, 0, 0.6039216, 1, 1,
0.1032582, 1.129479, -1.614692, 0, 0.5960785, 1, 1,
0.1035691, 0.9270835, 0.2743736, 0, 0.5921569, 1, 1,
0.1050762, 0.1022968, 1.853962, 0, 0.5843138, 1, 1,
0.1073789, 0.5852965, -0.2693306, 0, 0.5803922, 1, 1,
0.108282, 0.3399506, 1.266262, 0, 0.572549, 1, 1,
0.1132909, 0.4101496, -0.2706533, 0, 0.5686275, 1, 1,
0.1143895, 1.3322, -0.3587729, 0, 0.5607843, 1, 1,
0.1205908, -0.5160212, 1.920901, 0, 0.5568628, 1, 1,
0.1205979, -1.182086, 3.061272, 0, 0.5490196, 1, 1,
0.1209426, -0.01474723, 1.783235, 0, 0.5450981, 1, 1,
0.1211826, -0.7624869, 1.150008, 0, 0.5372549, 1, 1,
0.1243469, 1.520364, -0.7085736, 0, 0.5333334, 1, 1,
0.1247734, 1.670307, -0.4599043, 0, 0.5254902, 1, 1,
0.126281, -0.6335146, 2.739434, 0, 0.5215687, 1, 1,
0.1291288, 0.2415397, 0.4113634, 0, 0.5137255, 1, 1,
0.1294718, -0.2452098, 2.64741, 0, 0.509804, 1, 1,
0.1296705, 0.4645422, 0.7960967, 0, 0.5019608, 1, 1,
0.1324118, -0.08649762, 1.589951, 0, 0.4941176, 1, 1,
0.1368489, 0.5908676, 1.016351, 0, 0.4901961, 1, 1,
0.1386523, -1.036777, 4.225976, 0, 0.4823529, 1, 1,
0.141968, 0.1687056, -0.7904371, 0, 0.4784314, 1, 1,
0.1422008, -0.4652993, 3.835942, 0, 0.4705882, 1, 1,
0.1429465, 2.045867, -0.6830265, 0, 0.4666667, 1, 1,
0.1446044, 0.8198082, 1.317207, 0, 0.4588235, 1, 1,
0.1460123, 0.762229, -0.1464032, 0, 0.454902, 1, 1,
0.1514669, 0.0396766, 1.388865, 0, 0.4470588, 1, 1,
0.1526707, 1.216131, -1.095612, 0, 0.4431373, 1, 1,
0.159993, 0.3565821, 0.8369997, 0, 0.4352941, 1, 1,
0.160157, 2.497111, -2.504596, 0, 0.4313726, 1, 1,
0.1619393, -0.3321528, 2.583858, 0, 0.4235294, 1, 1,
0.1733026, 0.7146203, 1.710166, 0, 0.4196078, 1, 1,
0.1733293, -0.1317688, 2.047853, 0, 0.4117647, 1, 1,
0.1762719, -2.069795, 1.632082, 0, 0.4078431, 1, 1,
0.1770739, 0.07470731, 1.557262, 0, 0.4, 1, 1,
0.1781771, -0.5425453, 3.284763, 0, 0.3921569, 1, 1,
0.178501, -0.3706454, 4.798591, 0, 0.3882353, 1, 1,
0.1822404, -0.6556889, 1.349713, 0, 0.3803922, 1, 1,
0.1844807, 1.112072, 0.6847677, 0, 0.3764706, 1, 1,
0.1860461, -0.7567087, 1.888047, 0, 0.3686275, 1, 1,
0.1906328, 0.02743249, 0.8526996, 0, 0.3647059, 1, 1,
0.1952663, 0.3468544, 1.293308, 0, 0.3568628, 1, 1,
0.1959725, -0.06598096, 1.480685, 0, 0.3529412, 1, 1,
0.1968168, -3.839569, 1.795519, 0, 0.345098, 1, 1,
0.198068, 1.186086, -1.237403, 0, 0.3411765, 1, 1,
0.2022194, 0.04274674, 1.661046, 0, 0.3333333, 1, 1,
0.2029273, -0.600256, 2.564209, 0, 0.3294118, 1, 1,
0.2031186, 1.874553, 0.5643905, 0, 0.3215686, 1, 1,
0.2060329, -1.126225, 0.8254568, 0, 0.3176471, 1, 1,
0.2071957, -0.3324188, 1.122133, 0, 0.3098039, 1, 1,
0.2120141, 0.7861375, -0.1504493, 0, 0.3058824, 1, 1,
0.2130452, 0.7056222, 0.8283437, 0, 0.2980392, 1, 1,
0.2162307, 0.8686843, 1.980566, 0, 0.2901961, 1, 1,
0.2199279, -0.5932299, 1.991209, 0, 0.2862745, 1, 1,
0.2282794, -0.5092054, 3.917957, 0, 0.2784314, 1, 1,
0.2298543, -0.5084743, 2.108484, 0, 0.2745098, 1, 1,
0.2305498, -1.450061, 3.840806, 0, 0.2666667, 1, 1,
0.2312704, -1.632402, 3.869676, 0, 0.2627451, 1, 1,
0.2398023, -1.404611, 2.499697, 0, 0.254902, 1, 1,
0.2439411, -1.120354, 3.536456, 0, 0.2509804, 1, 1,
0.2533554, -0.9172869, 4.13095, 0, 0.2431373, 1, 1,
0.2564973, 0.7885155, 0.4490863, 0, 0.2392157, 1, 1,
0.2574261, -0.4348241, 3.430098, 0, 0.2313726, 1, 1,
0.2578607, -0.743548, 3.773671, 0, 0.227451, 1, 1,
0.2582638, 0.3652259, 0.9613206, 0, 0.2196078, 1, 1,
0.2603422, 0.02618227, 0.006843117, 0, 0.2156863, 1, 1,
0.2623049, -0.1628038, 3.846824, 0, 0.2078431, 1, 1,
0.2628849, -0.8023263, 1.196071, 0, 0.2039216, 1, 1,
0.2666584, 0.5007187, -1.076056, 0, 0.1960784, 1, 1,
0.2746321, -0.2726795, 2.793366, 0, 0.1882353, 1, 1,
0.2766047, 0.3211593, 1.134177, 0, 0.1843137, 1, 1,
0.2807739, 0.2598119, 1.978853, 0, 0.1764706, 1, 1,
0.2901443, 1.023964, 0.5232914, 0, 0.172549, 1, 1,
0.2912527, -1.013655, 2.458743, 0, 0.1647059, 1, 1,
0.2942367, -0.7878453, 2.165488, 0, 0.1607843, 1, 1,
0.2990785, -0.9559535, 3.319605, 0, 0.1529412, 1, 1,
0.2991045, 0.1417875, 0.1437876, 0, 0.1490196, 1, 1,
0.2993038, 0.2974287, 0.02964902, 0, 0.1411765, 1, 1,
0.300381, -0.5721835, 3.750695, 0, 0.1372549, 1, 1,
0.3039656, 0.3161114, 2.113787, 0, 0.1294118, 1, 1,
0.3053094, 0.2139156, 1.309193, 0, 0.1254902, 1, 1,
0.305693, 0.2629225, -1.091816, 0, 0.1176471, 1, 1,
0.3065438, -0.003979946, 1.600662, 0, 0.1137255, 1, 1,
0.3070558, -1.341298, 1.729434, 0, 0.1058824, 1, 1,
0.3141077, -1.416753, 2.641215, 0, 0.09803922, 1, 1,
0.3149452, -0.3602583, 1.742928, 0, 0.09411765, 1, 1,
0.3214039, -2.102844, 0.4204316, 0, 0.08627451, 1, 1,
0.3217425, -0.5472578, 4.367501, 0, 0.08235294, 1, 1,
0.3238488, 0.04658208, -0.3517298, 0, 0.07450981, 1, 1,
0.3251032, -0.4588562, 1.848553, 0, 0.07058824, 1, 1,
0.3256078, 0.7697584, 0.4266429, 0, 0.0627451, 1, 1,
0.3325014, -1.613593, 4.051425, 0, 0.05882353, 1, 1,
0.3325689, 1.181672, 0.006872965, 0, 0.05098039, 1, 1,
0.338338, -0.1647211, 4.114696, 0, 0.04705882, 1, 1,
0.3401257, 1.942924, 0.07976349, 0, 0.03921569, 1, 1,
0.3401692, 0.7799428, 0.5928515, 0, 0.03529412, 1, 1,
0.3401755, -0.364126, 2.720187, 0, 0.02745098, 1, 1,
0.3430178, -0.4170847, 2.802633, 0, 0.02352941, 1, 1,
0.3479408, -0.3250575, 2.473015, 0, 0.01568628, 1, 1,
0.3548348, 0.9568792, 0.3001564, 0, 0.01176471, 1, 1,
0.3551373, -0.06493804, 2.803312, 0, 0.003921569, 1, 1,
0.3591798, 1.066287, 0.2983266, 0.003921569, 0, 1, 1,
0.3625698, 1.854647, 0.4685721, 0.007843138, 0, 1, 1,
0.3655355, 0.1215894, 1.147505, 0.01568628, 0, 1, 1,
0.3659794, 0.1880494, -0.7119198, 0.01960784, 0, 1, 1,
0.3659975, 0.3586876, 1.36609, 0.02745098, 0, 1, 1,
0.366197, -0.4954863, 2.01668, 0.03137255, 0, 1, 1,
0.3718163, 2.268788, -0.5462499, 0.03921569, 0, 1, 1,
0.3725592, 0.8739472, 0.6309457, 0.04313726, 0, 1, 1,
0.377946, 0.5102721, 1.822074, 0.05098039, 0, 1, 1,
0.3797249, 0.5233318, 1.093705, 0.05490196, 0, 1, 1,
0.3799886, -0.3194841, 4.00879, 0.0627451, 0, 1, 1,
0.3867255, 0.9072487, 1.177065, 0.06666667, 0, 1, 1,
0.3977327, 0.6647483, 1.15343, 0.07450981, 0, 1, 1,
0.3979441, -0.23997, 2.848452, 0.07843138, 0, 1, 1,
0.4022883, -0.5248742, 2.51562, 0.08627451, 0, 1, 1,
0.403603, -0.278877, 3.440596, 0.09019608, 0, 1, 1,
0.4167351, -0.1419321, 1.490768, 0.09803922, 0, 1, 1,
0.4170764, 0.3242991, -0.679328, 0.1058824, 0, 1, 1,
0.4232575, -0.788233, 1.883593, 0.1098039, 0, 1, 1,
0.4274548, -1.246045, 2.776941, 0.1176471, 0, 1, 1,
0.4277195, -0.2122089, 2.340225, 0.1215686, 0, 1, 1,
0.430075, -1.504047, 2.804877, 0.1294118, 0, 1, 1,
0.4313437, -0.2150983, 4.022075, 0.1333333, 0, 1, 1,
0.4349059, 0.3043387, 0.3662704, 0.1411765, 0, 1, 1,
0.4375269, -0.7685023, 3.344551, 0.145098, 0, 1, 1,
0.4391916, -0.4040041, 1.343586, 0.1529412, 0, 1, 1,
0.4467882, 0.9662467, -0.610342, 0.1568628, 0, 1, 1,
0.447015, -1.156845, 0.9652118, 0.1647059, 0, 1, 1,
0.4564142, -0.3844045, 2.749855, 0.1686275, 0, 1, 1,
0.4630056, -0.3297959, 0.7207037, 0.1764706, 0, 1, 1,
0.4637287, 0.3578046, 0.7574349, 0.1803922, 0, 1, 1,
0.4742971, -0.05793764, 1.40209, 0.1882353, 0, 1, 1,
0.4743239, 1.907241, -0.9811329, 0.1921569, 0, 1, 1,
0.4749957, 0.7545672, 1.542817, 0.2, 0, 1, 1,
0.4756128, 0.8535357, -0.07763279, 0.2078431, 0, 1, 1,
0.483525, -1.497835, 1.315582, 0.2117647, 0, 1, 1,
0.4842763, -1.043414, 3.164814, 0.2196078, 0, 1, 1,
0.4846058, -1.982512, 3.160808, 0.2235294, 0, 1, 1,
0.4857982, -2.091233, 4.22793, 0.2313726, 0, 1, 1,
0.489557, -0.6234061, 2.431582, 0.2352941, 0, 1, 1,
0.4961218, -0.7928339, 3.078576, 0.2431373, 0, 1, 1,
0.4979343, 2.065758, -0.5323589, 0.2470588, 0, 1, 1,
0.5006737, 0.6010211, 0.1769237, 0.254902, 0, 1, 1,
0.5013635, 1.776334, 1.260086, 0.2588235, 0, 1, 1,
0.5042559, -0.5100271, 1.968349, 0.2666667, 0, 1, 1,
0.5074731, -0.1834492, 2.075814, 0.2705882, 0, 1, 1,
0.5109597, -0.2901806, 1.602591, 0.2784314, 0, 1, 1,
0.5139248, 2.604466, 2.347024, 0.282353, 0, 1, 1,
0.5281157, -0.1767866, 2.182819, 0.2901961, 0, 1, 1,
0.5319269, 1.054975, 0.7329587, 0.2941177, 0, 1, 1,
0.5363939, 0.07755352, 1.72654, 0.3019608, 0, 1, 1,
0.5375506, 0.1879452, 2.765522, 0.3098039, 0, 1, 1,
0.5382203, 0.120028, 0.4033136, 0.3137255, 0, 1, 1,
0.5458199, 0.1660021, 0.1366369, 0.3215686, 0, 1, 1,
0.54787, 0.0375297, 1.131387, 0.3254902, 0, 1, 1,
0.5486585, 0.159632, 0.8248662, 0.3333333, 0, 1, 1,
0.55259, 0.8283224, -1.306769, 0.3372549, 0, 1, 1,
0.5540287, -0.08188695, 3.467226, 0.345098, 0, 1, 1,
0.5571837, -0.8768072, 4.165667, 0.3490196, 0, 1, 1,
0.5592866, 0.08458122, 1.676688, 0.3568628, 0, 1, 1,
0.5694521, -0.8726823, 3.210869, 0.3607843, 0, 1, 1,
0.5695866, 0.8684878, 0.3431484, 0.3686275, 0, 1, 1,
0.5718722, -0.5098401, 2.41571, 0.372549, 0, 1, 1,
0.5748685, -0.9039439, 1.633351, 0.3803922, 0, 1, 1,
0.576002, 0.2265168, 0.3871242, 0.3843137, 0, 1, 1,
0.5765008, -0.2706613, 1.273984, 0.3921569, 0, 1, 1,
0.5766876, -0.01057956, 1.960591, 0.3960784, 0, 1, 1,
0.5782416, -0.9497337, 4.562992, 0.4039216, 0, 1, 1,
0.578564, 0.08317133, 2.332596, 0.4117647, 0, 1, 1,
0.5821616, 0.8847436, 1.234597, 0.4156863, 0, 1, 1,
0.5828237, -0.3544778, 2.442906, 0.4235294, 0, 1, 1,
0.5896258, 1.366145, 1.7868, 0.427451, 0, 1, 1,
0.5985197, 0.1251628, 3.817272, 0.4352941, 0, 1, 1,
0.6118022, -0.1882686, 2.406558, 0.4392157, 0, 1, 1,
0.613534, 0.7146181, -0.2699426, 0.4470588, 0, 1, 1,
0.6150086, 0.01807278, 2.549424, 0.4509804, 0, 1, 1,
0.6162044, 1.34597, -0.07999433, 0.4588235, 0, 1, 1,
0.6184919, -0.3445934, 2.158854, 0.4627451, 0, 1, 1,
0.6251869, -0.4727448, 3.218535, 0.4705882, 0, 1, 1,
0.6274989, -0.07943153, 1.623322, 0.4745098, 0, 1, 1,
0.6305605, 0.4173901, 0.5337994, 0.4823529, 0, 1, 1,
0.6315771, 0.6299042, 2.027764, 0.4862745, 0, 1, 1,
0.6317908, 0.923152, -0.1803384, 0.4941176, 0, 1, 1,
0.6370764, 0.5547612, -0.1465328, 0.5019608, 0, 1, 1,
0.6430723, -0.4532672, -0.1966257, 0.5058824, 0, 1, 1,
0.6461138, 1.531513, 0.5309506, 0.5137255, 0, 1, 1,
0.6492264, -0.540875, 1.209353, 0.5176471, 0, 1, 1,
0.6576754, 0.08398776, 1.253451, 0.5254902, 0, 1, 1,
0.6612039, 0.2581746, 0.9235028, 0.5294118, 0, 1, 1,
0.6628733, -0.6134667, 1.557924, 0.5372549, 0, 1, 1,
0.6681712, -0.3039689, 1.763866, 0.5411765, 0, 1, 1,
0.6817725, 0.4249319, 1.860976, 0.5490196, 0, 1, 1,
0.6832666, 1.820196, -0.750268, 0.5529412, 0, 1, 1,
0.6842798, 0.2425917, 1.221178, 0.5607843, 0, 1, 1,
0.6891686, -0.155672, 1.513463, 0.5647059, 0, 1, 1,
0.6944911, 1.331501, 1.292468, 0.572549, 0, 1, 1,
0.694942, -1.127404, 3.223008, 0.5764706, 0, 1, 1,
0.7006207, 0.5259558, 1.325456, 0.5843138, 0, 1, 1,
0.7091231, 1.250147, 2.745324, 0.5882353, 0, 1, 1,
0.710408, -0.5927772, 0.01283569, 0.5960785, 0, 1, 1,
0.7143481, -0.006547639, -0.4959119, 0.6039216, 0, 1, 1,
0.7172286, -1.246676, 1.836017, 0.6078432, 0, 1, 1,
0.7191243, 1.893128, 1.69673, 0.6156863, 0, 1, 1,
0.7212922, 1.242576, -0.06448191, 0.6196079, 0, 1, 1,
0.7253064, -0.1407647, 2.596049, 0.627451, 0, 1, 1,
0.7322381, -0.8048984, 2.229506, 0.6313726, 0, 1, 1,
0.7375947, 1.043597, 0.2114891, 0.6392157, 0, 1, 1,
0.7457806, 0.7163473, 0.9101111, 0.6431373, 0, 1, 1,
0.7470485, -0.5096592, 3.147635, 0.6509804, 0, 1, 1,
0.7501181, 0.6671948, 0.9926282, 0.654902, 0, 1, 1,
0.7504053, -1.792516, 2.058163, 0.6627451, 0, 1, 1,
0.7536619, 2.375928, 0.553964, 0.6666667, 0, 1, 1,
0.7548851, 0.6562, -0.5740228, 0.6745098, 0, 1, 1,
0.757646, -1.017781, 1.389606, 0.6784314, 0, 1, 1,
0.7577742, 2.398037, -0.01392241, 0.6862745, 0, 1, 1,
0.7626262, 0.6881162, 1.588757, 0.6901961, 0, 1, 1,
0.7717978, -0.0166103, -0.07992739, 0.6980392, 0, 1, 1,
0.7720855, -0.4054931, 1.865645, 0.7058824, 0, 1, 1,
0.7723183, -0.912043, 2.121653, 0.7098039, 0, 1, 1,
0.7740493, -0.08573721, 0.5646305, 0.7176471, 0, 1, 1,
0.781186, 1.382687, 0.9416766, 0.7215686, 0, 1, 1,
0.7825812, -1.833768, 2.632143, 0.7294118, 0, 1, 1,
0.7845183, 1.407126, 0.7979721, 0.7333333, 0, 1, 1,
0.7908748, -1.371217, 0.5649837, 0.7411765, 0, 1, 1,
0.8004862, 0.887363, 0.04458378, 0.7450981, 0, 1, 1,
0.8051288, -0.110717, 1.932003, 0.7529412, 0, 1, 1,
0.8118367, 0.6750513, 2.062552, 0.7568628, 0, 1, 1,
0.8137243, 0.4102021, -0.7731829, 0.7647059, 0, 1, 1,
0.823827, 1.386034, 1.175929, 0.7686275, 0, 1, 1,
0.8242161, -1.882984, 2.611134, 0.7764706, 0, 1, 1,
0.8242708, 0.4971295, 0.1610506, 0.7803922, 0, 1, 1,
0.8246182, -0.1682003, 2.151255, 0.7882353, 0, 1, 1,
0.8269194, -0.6746259, 3.309963, 0.7921569, 0, 1, 1,
0.831965, -0.4873959, 2.790115, 0.8, 0, 1, 1,
0.8327941, -0.4433002, 1.296984, 0.8078431, 0, 1, 1,
0.835727, -0.7460052, 1.650185, 0.8117647, 0, 1, 1,
0.8361405, -1.27388, 1.503527, 0.8196079, 0, 1, 1,
0.8388437, 0.9917786, 1.720438, 0.8235294, 0, 1, 1,
0.8391429, 1.181475, 0.9248208, 0.8313726, 0, 1, 1,
0.8398311, 0.3055867, 1.073103, 0.8352941, 0, 1, 1,
0.8411604, -0.8376655, 2.821962, 0.8431373, 0, 1, 1,
0.8436503, 0.8958602, 2.428221, 0.8470588, 0, 1, 1,
0.8458322, -1.053705, 1.700453, 0.854902, 0, 1, 1,
0.8465599, -0.4368037, 1.695707, 0.8588235, 0, 1, 1,
0.848016, -0.3558795, 3.78497, 0.8666667, 0, 1, 1,
0.8523738, 0.6503752, 0.2319018, 0.8705882, 0, 1, 1,
0.85522, -0.7531022, 1.222561, 0.8784314, 0, 1, 1,
0.8558368, -0.7365565, 2.379704, 0.8823529, 0, 1, 1,
0.8584853, -1.822758, 1.773355, 0.8901961, 0, 1, 1,
0.8600317, -0.1099808, 3.334047, 0.8941177, 0, 1, 1,
0.8664436, 0.2604728, 0.5511577, 0.9019608, 0, 1, 1,
0.8692001, 0.2970112, 1.101149, 0.9098039, 0, 1, 1,
0.8744047, 1.740355, 1.938494, 0.9137255, 0, 1, 1,
0.8808852, 0.5827297, 0.2857054, 0.9215686, 0, 1, 1,
0.8818338, 0.8621148, 0.2750901, 0.9254902, 0, 1, 1,
0.8828878, 0.1865978, 2.172275, 0.9333333, 0, 1, 1,
0.8832635, 0.2956014, 0.360864, 0.9372549, 0, 1, 1,
0.8838573, 0.1794563, -0.6478121, 0.945098, 0, 1, 1,
0.8878546, 1.940511, -1.390171, 0.9490196, 0, 1, 1,
0.8894632, 1.427145, 0.7163097, 0.9568627, 0, 1, 1,
0.8899474, -0.3652647, 3.347412, 0.9607843, 0, 1, 1,
0.8915619, -0.5444037, 1.587393, 0.9686275, 0, 1, 1,
0.8931226, -0.03998403, 0.8960465, 0.972549, 0, 1, 1,
0.8964608, 0.1533722, 0.6667269, 0.9803922, 0, 1, 1,
0.8990297, -1.305982, 2.739338, 0.9843137, 0, 1, 1,
0.8994482, -0.2518474, 0.1761564, 0.9921569, 0, 1, 1,
0.9138799, 0.5692091, 1.446484, 0.9960784, 0, 1, 1,
0.9169095, -1.106473, 0.3567266, 1, 0, 0.9960784, 1,
0.9190834, 1.2428, 0.5472084, 1, 0, 0.9882353, 1,
0.9202914, -0.712499, 3.217002, 1, 0, 0.9843137, 1,
0.9228907, 0.222769, 0.9937468, 1, 0, 0.9764706, 1,
0.9238772, 0.6707022, 1.599466, 1, 0, 0.972549, 1,
0.9307602, 0.04849713, 0.3591534, 1, 0, 0.9647059, 1,
0.938354, -0.6384996, 3.729355, 1, 0, 0.9607843, 1,
0.942547, 0.2958444, 2.668309, 1, 0, 0.9529412, 1,
0.9466575, 0.3713228, 1.682146, 1, 0, 0.9490196, 1,
0.9493394, -0.6832716, 2.661276, 1, 0, 0.9411765, 1,
0.9511927, 0.1259593, 1.716996, 1, 0, 0.9372549, 1,
0.9512854, 0.2157084, 0.8532388, 1, 0, 0.9294118, 1,
0.9569606, -1.83968, 1.708523, 1, 0, 0.9254902, 1,
0.9595755, -0.804774, 3.073629, 1, 0, 0.9176471, 1,
0.9608973, 0.0404779, 1.647218, 1, 0, 0.9137255, 1,
0.9644819, -0.7038855, 2.710146, 1, 0, 0.9058824, 1,
0.9658124, 0.2652611, 0.4322491, 1, 0, 0.9019608, 1,
0.9759539, 2.111913, 0.6910804, 1, 0, 0.8941177, 1,
0.977053, -1.633312, 3.778973, 1, 0, 0.8862745, 1,
0.9845307, 0.6165932, 0.4817258, 1, 0, 0.8823529, 1,
0.9889635, 1.264108, 0.4236017, 1, 0, 0.8745098, 1,
0.9900853, 0.7191737, 1.232613, 1, 0, 0.8705882, 1,
0.9960329, -0.8750527, 4.160062, 1, 0, 0.8627451, 1,
0.9973204, -0.5363588, -0.07773978, 1, 0, 0.8588235, 1,
1.000201, 0.8763847, 1.191414, 1, 0, 0.8509804, 1,
1.007544, 0.1484244, 1.008137, 1, 0, 0.8470588, 1,
1.011665, -0.711294, 3.73727, 1, 0, 0.8392157, 1,
1.014127, -0.7801784, 1.894325, 1, 0, 0.8352941, 1,
1.02113, 0.7794468, 0.5744732, 1, 0, 0.827451, 1,
1.023842, -0.5738974, 2.347113, 1, 0, 0.8235294, 1,
1.029168, 1.809678, 0.9600821, 1, 0, 0.8156863, 1,
1.036309, -0.1579871, 2.245557, 1, 0, 0.8117647, 1,
1.042763, -0.1715694, 2.16103, 1, 0, 0.8039216, 1,
1.045596, -0.7871074, 0.6777411, 1, 0, 0.7960784, 1,
1.04593, 0.9149209, 1.20412, 1, 0, 0.7921569, 1,
1.061072, -1.120117, 2.463038, 1, 0, 0.7843137, 1,
1.062271, 0.977742, 0.2658925, 1, 0, 0.7803922, 1,
1.064481, 0.1664344, 2.253036, 1, 0, 0.772549, 1,
1.064602, 0.7599934, 1.821358, 1, 0, 0.7686275, 1,
1.069612, -0.4698742, 3.453008, 1, 0, 0.7607843, 1,
1.085971, 0.3210081, 1.443299, 1, 0, 0.7568628, 1,
1.089305, 0.5529623, 0.4895214, 1, 0, 0.7490196, 1,
1.092706, -0.806851, 1.99477, 1, 0, 0.7450981, 1,
1.102214, -0.3477979, 1.855989, 1, 0, 0.7372549, 1,
1.104247, -1.20604, 1.420887, 1, 0, 0.7333333, 1,
1.106644, -0.8644062, 0.588388, 1, 0, 0.7254902, 1,
1.108981, 0.4884488, 1.792332, 1, 0, 0.7215686, 1,
1.111227, -0.4677746, 2.339303, 1, 0, 0.7137255, 1,
1.115954, 0.3550708, 1.028375, 1, 0, 0.7098039, 1,
1.116328, -0.4518932, 0.9658928, 1, 0, 0.7019608, 1,
1.119495, -0.08826566, 0.1797738, 1, 0, 0.6941177, 1,
1.12179, -0.05298156, 2.005452, 1, 0, 0.6901961, 1,
1.122796, -1.785478, 2.276956, 1, 0, 0.682353, 1,
1.124183, 1.296348, 1.316879, 1, 0, 0.6784314, 1,
1.1245, -0.5226978, 2.591485, 1, 0, 0.6705883, 1,
1.13237, -1.169764, 1.759716, 1, 0, 0.6666667, 1,
1.133574, 1.263793, 0.391507, 1, 0, 0.6588235, 1,
1.135729, 0.1606797, 1.3066, 1, 0, 0.654902, 1,
1.136058, 0.7949623, 1.896359, 1, 0, 0.6470588, 1,
1.143402, 0.6179307, 1.154435, 1, 0, 0.6431373, 1,
1.146118, 1.38238, 0.5439403, 1, 0, 0.6352941, 1,
1.151833, 0.2781788, 0.7971923, 1, 0, 0.6313726, 1,
1.151998, -0.5118625, 2.908544, 1, 0, 0.6235294, 1,
1.157288, -0.9883106, 1.335395, 1, 0, 0.6196079, 1,
1.158043, -0.7543443, 1.949445, 1, 0, 0.6117647, 1,
1.165536, 0.7047018, 0.6871838, 1, 0, 0.6078432, 1,
1.176227, 0.02087487, 1.059011, 1, 0, 0.6, 1,
1.176335, 1.093485, 0.4040481, 1, 0, 0.5921569, 1,
1.178593, -0.2099671, 3.822081, 1, 0, 0.5882353, 1,
1.178891, -1.216722, 1.005367, 1, 0, 0.5803922, 1,
1.18277, 1.423999, 0.2605786, 1, 0, 0.5764706, 1,
1.197538, -0.9346802, 1.92551, 1, 0, 0.5686275, 1,
1.201487, -0.1369336, 2.767082, 1, 0, 0.5647059, 1,
1.205011, -0.3914812, 0.09868112, 1, 0, 0.5568628, 1,
1.205439, 0.1994703, 1.695753, 1, 0, 0.5529412, 1,
1.213138, -1.35466, 0.9942786, 1, 0, 0.5450981, 1,
1.214051, -0.3222114, 2.713, 1, 0, 0.5411765, 1,
1.21599, -0.6465148, 1.055962, 1, 0, 0.5333334, 1,
1.223619, 0.5106106, 2.115609, 1, 0, 0.5294118, 1,
1.227897, -0.5789862, 2.223041, 1, 0, 0.5215687, 1,
1.230844, -0.2202492, 1.495607, 1, 0, 0.5176471, 1,
1.233193, 0.9933958, 1.680546, 1, 0, 0.509804, 1,
1.236453, 0.943637, 0.05782841, 1, 0, 0.5058824, 1,
1.24525, -1.418138, 1.916552, 1, 0, 0.4980392, 1,
1.252237, -0.8619563, 1.849034, 1, 0, 0.4901961, 1,
1.257083, -0.03491071, 2.713403, 1, 0, 0.4862745, 1,
1.270565, -1.02084, 2.906571, 1, 0, 0.4784314, 1,
1.276628, -0.6859593, 3.17692, 1, 0, 0.4745098, 1,
1.289799, 0.6491662, -0.2800186, 1, 0, 0.4666667, 1,
1.295887, 1.152553, -0.283318, 1, 0, 0.4627451, 1,
1.30796, -0.725781, 1.320469, 1, 0, 0.454902, 1,
1.308844, 1.114101, 0.05343291, 1, 0, 0.4509804, 1,
1.319109, -1.002749, 2.323601, 1, 0, 0.4431373, 1,
1.321652, 0.3001547, 2.563566, 1, 0, 0.4392157, 1,
1.326228, -1.363709, 2.667738, 1, 0, 0.4313726, 1,
1.34532, -0.4145399, 1.607314, 1, 0, 0.427451, 1,
1.380983, 1.620124, 1.057485, 1, 0, 0.4196078, 1,
1.381188, -0.5186037, 2.606372, 1, 0, 0.4156863, 1,
1.383298, -3.113179, 3.385673, 1, 0, 0.4078431, 1,
1.403291, 1.644095, 1.315369, 1, 0, 0.4039216, 1,
1.406159, -0.4919776, 1.629094, 1, 0, 0.3960784, 1,
1.410751, -0.0527763, 1.748405, 1, 0, 0.3882353, 1,
1.412949, 1.213488, -0.6319658, 1, 0, 0.3843137, 1,
1.418394, -1.367947, 3.385415, 1, 0, 0.3764706, 1,
1.424584, 2.278259, -0.3534728, 1, 0, 0.372549, 1,
1.42594, 0.5810593, 2.103948, 1, 0, 0.3647059, 1,
1.429712, 0.8895455, 0.9456249, 1, 0, 0.3607843, 1,
1.454101, -1.191512, 2.662738, 1, 0, 0.3529412, 1,
1.455119, 0.05049399, 1.286109, 1, 0, 0.3490196, 1,
1.463277, 0.2391381, 3.010768, 1, 0, 0.3411765, 1,
1.465502, 1.058525, 0.5562736, 1, 0, 0.3372549, 1,
1.470697, 0.6885654, 0.306702, 1, 0, 0.3294118, 1,
1.48634, -2.039537, 1.094798, 1, 0, 0.3254902, 1,
1.507457, 1.306532, -1.222706, 1, 0, 0.3176471, 1,
1.514795, -0.1702151, 1.989609, 1, 0, 0.3137255, 1,
1.520292, -0.04050912, 2.116005, 1, 0, 0.3058824, 1,
1.52341, -0.7747754, 2.017512, 1, 0, 0.2980392, 1,
1.527723, -0.1579363, 1.732002, 1, 0, 0.2941177, 1,
1.535661, 1.210965, -0.0832925, 1, 0, 0.2862745, 1,
1.537557, -0.7608572, 1.356879, 1, 0, 0.282353, 1,
1.5649, -0.2687548, 0.05456017, 1, 0, 0.2745098, 1,
1.574036, 1.846756, 1.101802, 1, 0, 0.2705882, 1,
1.575162, 1.318825, 0.3149208, 1, 0, 0.2627451, 1,
1.593565, -1.5403, 3.252986, 1, 0, 0.2588235, 1,
1.598275, -0.0491375, 2.286268, 1, 0, 0.2509804, 1,
1.599049, 0.5550599, 1.653875, 1, 0, 0.2470588, 1,
1.599815, 0.1294839, 0.2431225, 1, 0, 0.2392157, 1,
1.616353, 0.456362, 0.7547283, 1, 0, 0.2352941, 1,
1.630295, -0.4238915, 0.4752219, 1, 0, 0.227451, 1,
1.632083, -0.5716884, 2.363883, 1, 0, 0.2235294, 1,
1.636681, 2.032575, 0.1322748, 1, 0, 0.2156863, 1,
1.658278, -1.050332, 0.9950871, 1, 0, 0.2117647, 1,
1.679494, 2.004278, 0.4170071, 1, 0, 0.2039216, 1,
1.682539, 1.388645, 0.4309228, 1, 0, 0.1960784, 1,
1.699671, 0.1543, -0.3477786, 1, 0, 0.1921569, 1,
1.709771, -0.4452363, 1.681116, 1, 0, 0.1843137, 1,
1.711902, -0.2527498, 3.768698, 1, 0, 0.1803922, 1,
1.728737, 1.49546, 2.838856, 1, 0, 0.172549, 1,
1.740711, -0.01465984, 2.718106, 1, 0, 0.1686275, 1,
1.754551, 0.7103038, 1.835353, 1, 0, 0.1607843, 1,
1.800093, 0.4359391, 2.360441, 1, 0, 0.1568628, 1,
1.828048, 0.8730537, 1.860739, 1, 0, 0.1490196, 1,
1.835438, 1.804295, 0.8783146, 1, 0, 0.145098, 1,
1.860909, 0.2627086, 0.1275338, 1, 0, 0.1372549, 1,
1.890606, 0.3039074, 0.9894705, 1, 0, 0.1333333, 1,
1.89198, -0.5150818, 3.361482, 1, 0, 0.1254902, 1,
1.894384, -0.4126753, 2.245488, 1, 0, 0.1215686, 1,
1.902594, -0.1844215, -0.4708809, 1, 0, 0.1137255, 1,
1.90878, -0.3623296, 3.169438, 1, 0, 0.1098039, 1,
1.970952, -0.1410007, 1.434973, 1, 0, 0.1019608, 1,
2.023544, 0.6840801, 1.118409, 1, 0, 0.09411765, 1,
2.08251, 0.3508317, 2.41266, 1, 0, 0.09019608, 1,
2.09987, -1.034984, 1.77747, 1, 0, 0.08235294, 1,
2.102359, -0.7752368, 1.020586, 1, 0, 0.07843138, 1,
2.1371, 1.265161, 0.5568277, 1, 0, 0.07058824, 1,
2.183482, 0.5365825, 2.649447, 1, 0, 0.06666667, 1,
2.195437, -1.456565, 1.130791, 1, 0, 0.05882353, 1,
2.217054, 1.040303, -0.1185844, 1, 0, 0.05490196, 1,
2.230057, -0.7211943, 2.540294, 1, 0, 0.04705882, 1,
2.233748, 3.293591, -0.7530752, 1, 0, 0.04313726, 1,
2.286144, 1.252855, 2.217487, 1, 0, 0.03529412, 1,
2.324598, 0.3146027, 2.062875, 1, 0, 0.03137255, 1,
2.547904, -1.209697, 3.240495, 1, 0, 0.02352941, 1,
2.685335, 0.7807921, 2.026312, 1, 0, 0.01960784, 1,
2.842483, 0.9394183, 1.809898, 1, 0, 0.01176471, 1,
3.663762, -0.1098597, 0.7587692, 1, 0, 0.007843138, 1
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
0.1427282, -5.057226, -7.655737, 0, -0.5, 0.5, 0.5,
0.1427282, -5.057226, -7.655737, 1, -0.5, 0.5, 0.5,
0.1427282, -5.057226, -7.655737, 1, 1.5, 0.5, 0.5,
0.1427282, -5.057226, -7.655737, 0, 1.5, 0.5, 0.5
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
-4.571936, -0.2476592, -7.655737, 0, -0.5, 0.5, 0.5,
-4.571936, -0.2476592, -7.655737, 1, -0.5, 0.5, 0.5,
-4.571936, -0.2476592, -7.655737, 1, 1.5, 0.5, 0.5,
-4.571936, -0.2476592, -7.655737, 0, 1.5, 0.5, 0.5
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
-4.571936, -5.057226, -0.526047, 0, -0.5, 0.5, 0.5,
-4.571936, -5.057226, -0.526047, 1, -0.5, 0.5, 0.5,
-4.571936, -5.057226, -0.526047, 1, 1.5, 0.5, 0.5,
-4.571936, -5.057226, -0.526047, 0, 1.5, 0.5, 0.5
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
-2, -3.947326, -6.010424,
2, -3.947326, -6.010424,
-2, -3.947326, -6.010424,
-2, -4.132309, -6.284643,
0, -3.947326, -6.010424,
0, -4.132309, -6.284643,
2, -3.947326, -6.010424,
2, -4.132309, -6.284643
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
-2, -4.502276, -6.83308, 0, -0.5, 0.5, 0.5,
-2, -4.502276, -6.83308, 1, -0.5, 0.5, 0.5,
-2, -4.502276, -6.83308, 1, 1.5, 0.5, 0.5,
-2, -4.502276, -6.83308, 0, 1.5, 0.5, 0.5,
0, -4.502276, -6.83308, 0, -0.5, 0.5, 0.5,
0, -4.502276, -6.83308, 1, -0.5, 0.5, 0.5,
0, -4.502276, -6.83308, 1, 1.5, 0.5, 0.5,
0, -4.502276, -6.83308, 0, 1.5, 0.5, 0.5,
2, -4.502276, -6.83308, 0, -0.5, 0.5, 0.5,
2, -4.502276, -6.83308, 1, -0.5, 0.5, 0.5,
2, -4.502276, -6.83308, 1, 1.5, 0.5, 0.5,
2, -4.502276, -6.83308, 0, 1.5, 0.5, 0.5
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
-3.483937, -2, -6.010424,
-3.483937, 2, -6.010424,
-3.483937, -2, -6.010424,
-3.66527, -2, -6.284643,
-3.483937, 0, -6.010424,
-3.66527, 0, -6.284643,
-3.483937, 2, -6.010424,
-3.66527, 2, -6.284643
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
-4.027936, -2, -6.83308, 0, -0.5, 0.5, 0.5,
-4.027936, -2, -6.83308, 1, -0.5, 0.5, 0.5,
-4.027936, -2, -6.83308, 1, 1.5, 0.5, 0.5,
-4.027936, -2, -6.83308, 0, 1.5, 0.5, 0.5,
-4.027936, 0, -6.83308, 0, -0.5, 0.5, 0.5,
-4.027936, 0, -6.83308, 1, -0.5, 0.5, 0.5,
-4.027936, 0, -6.83308, 1, 1.5, 0.5, 0.5,
-4.027936, 0, -6.83308, 0, 1.5, 0.5, 0.5,
-4.027936, 2, -6.83308, 0, -0.5, 0.5, 0.5,
-4.027936, 2, -6.83308, 1, -0.5, 0.5, 0.5,
-4.027936, 2, -6.83308, 1, 1.5, 0.5, 0.5,
-4.027936, 2, -6.83308, 0, 1.5, 0.5, 0.5
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
-3.483937, -3.947326, -4,
-3.483937, -3.947326, 4,
-3.483937, -3.947326, -4,
-3.66527, -4.132309, -4,
-3.483937, -3.947326, -2,
-3.66527, -4.132309, -2,
-3.483937, -3.947326, 0,
-3.66527, -4.132309, 0,
-3.483937, -3.947326, 2,
-3.66527, -4.132309, 2,
-3.483937, -3.947326, 4,
-3.66527, -4.132309, 4
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
-4.027936, -4.502276, -4, 0, -0.5, 0.5, 0.5,
-4.027936, -4.502276, -4, 1, -0.5, 0.5, 0.5,
-4.027936, -4.502276, -4, 1, 1.5, 0.5, 0.5,
-4.027936, -4.502276, -4, 0, 1.5, 0.5, 0.5,
-4.027936, -4.502276, -2, 0, -0.5, 0.5, 0.5,
-4.027936, -4.502276, -2, 1, -0.5, 0.5, 0.5,
-4.027936, -4.502276, -2, 1, 1.5, 0.5, 0.5,
-4.027936, -4.502276, -2, 0, 1.5, 0.5, 0.5,
-4.027936, -4.502276, 0, 0, -0.5, 0.5, 0.5,
-4.027936, -4.502276, 0, 1, -0.5, 0.5, 0.5,
-4.027936, -4.502276, 0, 1, 1.5, 0.5, 0.5,
-4.027936, -4.502276, 0, 0, 1.5, 0.5, 0.5,
-4.027936, -4.502276, 2, 0, -0.5, 0.5, 0.5,
-4.027936, -4.502276, 2, 1, -0.5, 0.5, 0.5,
-4.027936, -4.502276, 2, 1, 1.5, 0.5, 0.5,
-4.027936, -4.502276, 2, 0, 1.5, 0.5, 0.5,
-4.027936, -4.502276, 4, 0, -0.5, 0.5, 0.5,
-4.027936, -4.502276, 4, 1, -0.5, 0.5, 0.5,
-4.027936, -4.502276, 4, 1, 1.5, 0.5, 0.5,
-4.027936, -4.502276, 4, 0, 1.5, 0.5, 0.5
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
-3.483937, -3.947326, -6.010424,
-3.483937, 3.452008, -6.010424,
-3.483937, -3.947326, 4.95833,
-3.483937, 3.452008, 4.95833,
-3.483937, -3.947326, -6.010424,
-3.483937, -3.947326, 4.95833,
-3.483937, 3.452008, -6.010424,
-3.483937, 3.452008, 4.95833,
-3.483937, -3.947326, -6.010424,
3.769393, -3.947326, -6.010424,
-3.483937, -3.947326, 4.95833,
3.769393, -3.947326, 4.95833,
-3.483937, 3.452008, -6.010424,
3.769393, 3.452008, -6.010424,
-3.483937, 3.452008, 4.95833,
3.769393, 3.452008, 4.95833,
3.769393, -3.947326, -6.010424,
3.769393, 3.452008, -6.010424,
3.769393, -3.947326, 4.95833,
3.769393, 3.452008, 4.95833,
3.769393, -3.947326, -6.010424,
3.769393, -3.947326, 4.95833,
3.769393, 3.452008, -6.010424,
3.769393, 3.452008, 4.95833
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
var radius = 8.057172;
var distance = 35.84727;
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
mvMatrix.translate( -0.1427282, 0.2476592, 0.526047 );
mvMatrix.scale( 1.201045, 1.177346, 0.7942172 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.84727);
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
pyrazole-5-carboxami<-read.table("pyrazole-5-carboxami.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyrazole-5-carboxami$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyrazole' not found
```

```r
y<-pyrazole-5-carboxami$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyrazole' not found
```

```r
z<-pyrazole-5-carboxami$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyrazole' not found
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
-3.378306, -0.2814673, -0.9709389, 0, 0, 1, 1, 1,
-2.901356, 1.007772, -1.04156, 1, 0, 0, 1, 1,
-2.82732, -1.717182, -0.6591268, 1, 0, 0, 1, 1,
-2.82564, 0.9019865, -0.4716537, 1, 0, 0, 1, 1,
-2.536206, -0.05594685, -0.6485447, 1, 0, 0, 1, 1,
-2.515756, 1.04135, 0.1185611, 1, 0, 0, 1, 1,
-2.427517, -1.362105, -2.188982, 0, 0, 0, 1, 1,
-2.289229, 2.363687, -3.022925, 0, 0, 0, 1, 1,
-2.288463, 0.9510556, -2.343016, 0, 0, 0, 1, 1,
-2.269904, 0.4995903, -0.04983446, 0, 0, 0, 1, 1,
-2.269327, 1.315086, -2.004683, 0, 0, 0, 1, 1,
-2.256479, 1.180117, -1.394553, 0, 0, 0, 1, 1,
-2.246487, 0.3219712, -0.04108039, 0, 0, 0, 1, 1,
-2.206526, 1.367723, -2.826788, 1, 1, 1, 1, 1,
-2.193977, 1.889576, 0.240966, 1, 1, 1, 1, 1,
-2.178663, 0.4435421, -0.01539499, 1, 1, 1, 1, 1,
-2.176901, -0.231554, -0.6384728, 1, 1, 1, 1, 1,
-2.130224, 0.4886664, -1.246907, 1, 1, 1, 1, 1,
-2.111027, -0.288734, -3.389536, 1, 1, 1, 1, 1,
-2.08835, -0.2425381, -3.159923, 1, 1, 1, 1, 1,
-2.07346, 1.034648, -1.582183, 1, 1, 1, 1, 1,
-2.027828, 0.003196992, -2.238985, 1, 1, 1, 1, 1,
-1.99625, 0.07422972, -1.371813, 1, 1, 1, 1, 1,
-1.957502, 0.6399403, -0.1648353, 1, 1, 1, 1, 1,
-1.955949, 0.8274812, -1.519352, 1, 1, 1, 1, 1,
-1.951094, 0.1340128, -0.6904877, 1, 1, 1, 1, 1,
-1.921007, 0.1427356, -1.435632, 1, 1, 1, 1, 1,
-1.899358, -0.328427, -1.57528, 1, 1, 1, 1, 1,
-1.898636, 1.362646, -2.471212, 0, 0, 1, 1, 1,
-1.896611, 1.735669, -0.3625306, 1, 0, 0, 1, 1,
-1.886954, -0.742247, -1.050872, 1, 0, 0, 1, 1,
-1.870816, 0.002754076, 0.06990114, 1, 0, 0, 1, 1,
-1.804675, 1.396336, 0.2841844, 1, 0, 0, 1, 1,
-1.787808, -1.726446, -1.779406, 1, 0, 0, 1, 1,
-1.787209, -2.329147, -2.557914, 0, 0, 0, 1, 1,
-1.740129, 0.9847661, -1.857718, 0, 0, 0, 1, 1,
-1.738789, -1.391659, -1.279426, 0, 0, 0, 1, 1,
-1.720878, -0.0162544, -2.339618, 0, 0, 0, 1, 1,
-1.706752, 0.2355405, -1.967603, 0, 0, 0, 1, 1,
-1.689491, -1.408958, -4.646428, 0, 0, 0, 1, 1,
-1.686284, -0.03247799, -2.997258, 0, 0, 0, 1, 1,
-1.647892, 1.083291, -2.009665, 1, 1, 1, 1, 1,
-1.637368, 0.618956, -0.6838325, 1, 1, 1, 1, 1,
-1.596108, -0.1859025, -0.9539549, 1, 1, 1, 1, 1,
-1.559943, 0.4530977, -1.760288, 1, 1, 1, 1, 1,
-1.559548, -0.1690717, -2.518962, 1, 1, 1, 1, 1,
-1.556455, -1.035263, -1.4719, 1, 1, 1, 1, 1,
-1.555556, -0.5993664, -2.014334, 1, 1, 1, 1, 1,
-1.550399, -1.371294, -2.66912, 1, 1, 1, 1, 1,
-1.54787, -0.0344351, -0.2362198, 1, 1, 1, 1, 1,
-1.534237, -0.2874608, -2.155363, 1, 1, 1, 1, 1,
-1.520389, 0.6683998, -1.277511, 1, 1, 1, 1, 1,
-1.515566, 0.08489226, -2.339196, 1, 1, 1, 1, 1,
-1.513666, -1.948462, -2.444545, 1, 1, 1, 1, 1,
-1.505584, -1.764992, -2.616432, 1, 1, 1, 1, 1,
-1.474335, 0.5371306, -1.400301, 1, 1, 1, 1, 1,
-1.474279, 0.9009145, -2.612823, 0, 0, 1, 1, 1,
-1.4676, -0.4481118, -2.886022, 1, 0, 0, 1, 1,
-1.46415, 0.2399283, -2.065098, 1, 0, 0, 1, 1,
-1.461868, 0.648453, -2.896894, 1, 0, 0, 1, 1,
-1.45612, 1.069659, -1.705148, 1, 0, 0, 1, 1,
-1.451346, 0.3272674, -1.605011, 1, 0, 0, 1, 1,
-1.451208, 0.5296888, -2.06808, 0, 0, 0, 1, 1,
-1.428646, -0.9889229, -2.314934, 0, 0, 0, 1, 1,
-1.426057, -1.428349, -2.010644, 0, 0, 0, 1, 1,
-1.414264, -1.02405, 0.3004164, 0, 0, 0, 1, 1,
-1.412443, 1.178474, 0.02366138, 0, 0, 0, 1, 1,
-1.405474, 0.5801327, -2.71417, 0, 0, 0, 1, 1,
-1.385336, 0.3464416, -0.8587957, 0, 0, 0, 1, 1,
-1.375667, -0.4388331, -1.211575, 1, 1, 1, 1, 1,
-1.374761, -1.482864, -2.775188, 1, 1, 1, 1, 1,
-1.370518, 0.3790736, 1.345651, 1, 1, 1, 1, 1,
-1.34949, 0.04468525, 0.225498, 1, 1, 1, 1, 1,
-1.344525, 0.3083157, -2.034376, 1, 1, 1, 1, 1,
-1.332868, -0.08717817, -2.161554, 1, 1, 1, 1, 1,
-1.328346, 2.166725, -0.2068728, 1, 1, 1, 1, 1,
-1.32448, 0.1133742, -1.699943, 1, 1, 1, 1, 1,
-1.321515, -0.8206052, -5.222122, 1, 1, 1, 1, 1,
-1.319052, 0.01111545, -1.418484, 1, 1, 1, 1, 1,
-1.308863, 0.8376514, -2.119409, 1, 1, 1, 1, 1,
-1.307604, 0.08450523, -2.898265, 1, 1, 1, 1, 1,
-1.304786, 0.9343708, 0.1295701, 1, 1, 1, 1, 1,
-1.299238, 0.7925948, -2.08433, 1, 1, 1, 1, 1,
-1.293411, -1.425655, -2.434002, 1, 1, 1, 1, 1,
-1.280475, -0.5333495, -1.103856, 0, 0, 1, 1, 1,
-1.278365, 1.47379, -1.861236, 1, 0, 0, 1, 1,
-1.269886, 0.9332321, -0.4318888, 1, 0, 0, 1, 1,
-1.262907, 0.3768209, -1.054832, 1, 0, 0, 1, 1,
-1.259644, -1.272963, -2.104128, 1, 0, 0, 1, 1,
-1.256613, -0.3791941, -2.375464, 1, 0, 0, 1, 1,
-1.256115, 0.4083335, -1.26798, 0, 0, 0, 1, 1,
-1.255414, 0.2430576, -1.501876, 0, 0, 0, 1, 1,
-1.249826, 0.08945868, -0.824349, 0, 0, 0, 1, 1,
-1.249404, 1.047938, -1.14232, 0, 0, 0, 1, 1,
-1.244641, -0.5374297, -2.38896, 0, 0, 0, 1, 1,
-1.242917, -0.8601345, -2.213923, 0, 0, 0, 1, 1,
-1.239331, -0.7997572, -2.715366, 0, 0, 0, 1, 1,
-1.233964, 0.9400584, -0.1743861, 1, 1, 1, 1, 1,
-1.225202, 0.07778356, -2.067448, 1, 1, 1, 1, 1,
-1.225123, 1.507679, -0.5595158, 1, 1, 1, 1, 1,
-1.218043, 1.3751, -0.6846368, 1, 1, 1, 1, 1,
-1.217359, 0.06379598, -2.090965, 1, 1, 1, 1, 1,
-1.207861, -1.999654, -1.009665, 1, 1, 1, 1, 1,
-1.205981, 1.590464, -0.8654685, 1, 1, 1, 1, 1,
-1.204606, 1.096305, -0.1786684, 1, 1, 1, 1, 1,
-1.203968, -0.6064935, -1.818873, 1, 1, 1, 1, 1,
-1.202237, -0.9304722, -2.259161, 1, 1, 1, 1, 1,
-1.202072, 0.2905817, -0.6735038, 1, 1, 1, 1, 1,
-1.197846, 1.596441, -2.186767, 1, 1, 1, 1, 1,
-1.183266, -0.07773396, -0.3774817, 1, 1, 1, 1, 1,
-1.180018, -0.008684619, -0.5083944, 1, 1, 1, 1, 1,
-1.179465, 0.8522832, -1.285409, 1, 1, 1, 1, 1,
-1.164166, -0.5320446, -1.527825, 0, 0, 1, 1, 1,
-1.157342, 1.134125, -1.609321, 1, 0, 0, 1, 1,
-1.142387, 0.1454866, -0.1989627, 1, 0, 0, 1, 1,
-1.131965, 1.059669, -0.7344277, 1, 0, 0, 1, 1,
-1.129594, 0.07928744, -2.156343, 1, 0, 0, 1, 1,
-1.127287, -1.160626, -2.461435, 1, 0, 0, 1, 1,
-1.12431, -0.7843481, -3.547915, 0, 0, 0, 1, 1,
-1.124126, -1.320647, -2.199349, 0, 0, 0, 1, 1,
-1.118519, -0.6963324, -2.827929, 0, 0, 0, 1, 1,
-1.117223, -0.6826208, -3.567671, 0, 0, 0, 1, 1,
-1.106651, -0.4287704, 0.9137018, 0, 0, 0, 1, 1,
-1.104204, -0.2978114, -2.273231, 0, 0, 0, 1, 1,
-1.099802, 0.01050532, -1.65917, 0, 0, 0, 1, 1,
-1.098353, 1.878933, -2.287724, 1, 1, 1, 1, 1,
-1.090147, 0.3234535, -1.145299, 1, 1, 1, 1, 1,
-1.085126, -1.703717, -2.437595, 1, 1, 1, 1, 1,
-1.083087, 1.546462, -1.473486, 1, 1, 1, 1, 1,
-1.072244, -0.5013863, -1.613925, 1, 1, 1, 1, 1,
-1.069134, 0.1846342, -3.020422, 1, 1, 1, 1, 1,
-1.061272, 2.293405, -0.7659044, 1, 1, 1, 1, 1,
-1.052861, -1.683054, -2.050498, 1, 1, 1, 1, 1,
-1.042528, 1.214996, -1.263424, 1, 1, 1, 1, 1,
-1.029478, 0.4908029, -3.804324, 1, 1, 1, 1, 1,
-1.026593, 1.507155, 0.3170449, 1, 1, 1, 1, 1,
-1.02543, -1.943944, -3.6523, 1, 1, 1, 1, 1,
-1.019394, 0.7721611, -2.223284, 1, 1, 1, 1, 1,
-1.018782, 0.4468093, -0.7348753, 1, 1, 1, 1, 1,
-1.013049, -2.326952, -3.450908, 1, 1, 1, 1, 1,
-1.004829, 0.3215831, -0.601782, 0, 0, 1, 1, 1,
-1.001372, 0.8387889, -1.070284, 1, 0, 0, 1, 1,
-0.9992918, 0.4261823, -1.039447, 1, 0, 0, 1, 1,
-0.9918718, -0.5164661, -2.097927, 1, 0, 0, 1, 1,
-0.9915773, 0.04864395, -2.191426, 1, 0, 0, 1, 1,
-0.9857779, 0.6262466, -0.5493184, 1, 0, 0, 1, 1,
-0.9816456, 0.648036, -1.456003, 0, 0, 0, 1, 1,
-0.9791566, 0.584127, -1.106237, 0, 0, 0, 1, 1,
-0.9682932, 0.5428826, -1.738175, 0, 0, 0, 1, 1,
-0.9681204, -0.4931859, 0.2872709, 0, 0, 0, 1, 1,
-0.9676453, 0.1056233, -1.435755, 0, 0, 0, 1, 1,
-0.9667158, -1.052413, -0.1133268, 0, 0, 0, 1, 1,
-0.9641058, -0.5254244, -2.538353, 0, 0, 0, 1, 1,
-0.9605646, -0.1931976, -2.31389, 1, 1, 1, 1, 1,
-0.9596097, -1.393585, -2.216621, 1, 1, 1, 1, 1,
-0.9549001, 0.9567218, -1.368128, 1, 1, 1, 1, 1,
-0.9490445, 0.03030346, -1.944774, 1, 1, 1, 1, 1,
-0.9326633, 0.649146, -2.029402, 1, 1, 1, 1, 1,
-0.930511, 0.07965117, -0.1672395, 1, 1, 1, 1, 1,
-0.9300304, 0.6311628, -3.056737, 1, 1, 1, 1, 1,
-0.92537, -0.3366038, -2.055535, 1, 1, 1, 1, 1,
-0.9242122, 0.6930738, -0.6790779, 1, 1, 1, 1, 1,
-0.9229524, -0.28266, -2.067016, 1, 1, 1, 1, 1,
-0.9220487, 0.6938356, 0.5327268, 1, 1, 1, 1, 1,
-0.9169879, 1.08047, 1.149455, 1, 1, 1, 1, 1,
-0.9081357, -0.6759872, -2.466427, 1, 1, 1, 1, 1,
-0.9033256, 0.3933442, -0.7332256, 1, 1, 1, 1, 1,
-0.8980806, -1.496511, -3.34199, 1, 1, 1, 1, 1,
-0.8977936, -2.606243, -1.120473, 0, 0, 1, 1, 1,
-0.8935508, 0.5193575, -2.058183, 1, 0, 0, 1, 1,
-0.889762, -1.087747, -4.277844, 1, 0, 0, 1, 1,
-0.8772166, -1.088617, -3.057224, 1, 0, 0, 1, 1,
-0.8771086, 1.011404, -0.5576404, 1, 0, 0, 1, 1,
-0.8755922, -0.2979693, -0.567504, 1, 0, 0, 1, 1,
-0.8745295, 0.3834424, 0.29796, 0, 0, 0, 1, 1,
-0.8740296, -0.8103923, -1.200402, 0, 0, 0, 1, 1,
-0.8731703, -1.310686, -3.294258, 0, 0, 0, 1, 1,
-0.8700129, -1.631158, -1.149021, 0, 0, 0, 1, 1,
-0.8690896, 2.000787, -2.189382, 0, 0, 0, 1, 1,
-0.8660944, 1.122584, -0.9499228, 0, 0, 0, 1, 1,
-0.864879, -0.4074599, 0.4470707, 0, 0, 0, 1, 1,
-0.8559836, -1.184072, -2.476137, 1, 1, 1, 1, 1,
-0.8536199, 0.1094981, -3.666517, 1, 1, 1, 1, 1,
-0.8505642, 0.4963957, -0.9485912, 1, 1, 1, 1, 1,
-0.8493996, 0.5747508, -1.737063, 1, 1, 1, 1, 1,
-0.8478019, 0.2667205, -0.3967471, 1, 1, 1, 1, 1,
-0.8458824, -0.2630645, -2.47775, 1, 1, 1, 1, 1,
-0.8442985, -0.1603407, -2.227411, 1, 1, 1, 1, 1,
-0.842956, -1.140205, -3.013133, 1, 1, 1, 1, 1,
-0.8429478, 0.7440826, -0.9540366, 1, 1, 1, 1, 1,
-0.8411056, 2.280174, -1.861607, 1, 1, 1, 1, 1,
-0.8399157, 1.548495, -0.7155403, 1, 1, 1, 1, 1,
-0.8394683, -1.201322, -2.795776, 1, 1, 1, 1, 1,
-0.8365149, -0.1398038, -1.732844, 1, 1, 1, 1, 1,
-0.8363174, -0.1649855, -2.729959, 1, 1, 1, 1, 1,
-0.8360593, 0.3248938, -1.910285, 1, 1, 1, 1, 1,
-0.8356067, -1.150803, -1.148418, 0, 0, 1, 1, 1,
-0.8253607, -0.649161, -1.619672, 1, 0, 0, 1, 1,
-0.8207437, -0.09383579, -2.786362, 1, 0, 0, 1, 1,
-0.8193647, -1.202212, -3.070281, 1, 0, 0, 1, 1,
-0.8157119, 0.4813243, -0.9420548, 1, 0, 0, 1, 1,
-0.815396, -1.162431, -2.196897, 1, 0, 0, 1, 1,
-0.8150219, 0.2945472, -1.368903, 0, 0, 0, 1, 1,
-0.812849, 0.1143965, -0.1180696, 0, 0, 0, 1, 1,
-0.8125643, 0.05914304, -1.29862, 0, 0, 0, 1, 1,
-0.8077531, -0.2698873, -2.416723, 0, 0, 0, 1, 1,
-0.8041153, 0.6233988, -1.732531, 0, 0, 0, 1, 1,
-0.8029824, -0.3770069, -1.229682, 0, 0, 0, 1, 1,
-0.8009083, 1.33142, -1.938448, 0, 0, 0, 1, 1,
-0.7937415, -0.7497396, -3.345837, 1, 1, 1, 1, 1,
-0.7925901, 1.044351, -1.167284, 1, 1, 1, 1, 1,
-0.7860789, -0.3409759, -1.905283, 1, 1, 1, 1, 1,
-0.7798863, 0.01071297, -2.185829, 1, 1, 1, 1, 1,
-0.7783848, 0.7723826, -0.6599358, 1, 1, 1, 1, 1,
-0.7755516, -2.885292, -3.20682, 1, 1, 1, 1, 1,
-0.7737163, 0.4385789, -2.211086, 1, 1, 1, 1, 1,
-0.7726661, 0.4609098, -0.2124606, 1, 1, 1, 1, 1,
-0.772305, 2.189515, -1.852302, 1, 1, 1, 1, 1,
-0.7691325, -0.9521828, -2.428371, 1, 1, 1, 1, 1,
-0.7632858, -1.710734, -3.85189, 1, 1, 1, 1, 1,
-0.7590241, 1.689154, 0.7178319, 1, 1, 1, 1, 1,
-0.758172, 0.2300019, -0.6566632, 1, 1, 1, 1, 1,
-0.7556427, 1.581329, 0.9283676, 1, 1, 1, 1, 1,
-0.7545331, 2.172764, -0.5393575, 1, 1, 1, 1, 1,
-0.7519541, 1.723519, -1.366752, 0, 0, 1, 1, 1,
-0.7496988, -1.34586, -2.228642, 1, 0, 0, 1, 1,
-0.7458788, 1.025061, -1.242695, 1, 0, 0, 1, 1,
-0.7366822, 0.2380889, -2.87079, 1, 0, 0, 1, 1,
-0.7268005, 0.8365765, -1.806584, 1, 0, 0, 1, 1,
-0.725015, -0.8609806, -2.695964, 1, 0, 0, 1, 1,
-0.7152423, -1.208445, -2.150326, 0, 0, 0, 1, 1,
-0.7059309, -0.4606011, -2.160237, 0, 0, 0, 1, 1,
-0.7019163, 0.01626782, -2.721676, 0, 0, 0, 1, 1,
-0.6999131, 0.8473383, -0.2390953, 0, 0, 0, 1, 1,
-0.6984208, -1.07103, -1.052674, 0, 0, 0, 1, 1,
-0.6961322, 0.3429812, -0.01023086, 0, 0, 0, 1, 1,
-0.6954706, 0.7290546, -1.503921, 0, 0, 0, 1, 1,
-0.693032, -2.488007, -1.049327, 1, 1, 1, 1, 1,
-0.6916217, 0.6963142, -0.7327643, 1, 1, 1, 1, 1,
-0.6903654, -1.036996, -0.9610308, 1, 1, 1, 1, 1,
-0.6900716, -0.2395928, -2.037287, 1, 1, 1, 1, 1,
-0.6861643, -1.108287, -1.66192, 1, 1, 1, 1, 1,
-0.6846488, 0.3758724, -1.355536, 1, 1, 1, 1, 1,
-0.6811447, 0.07203732, -3.882416, 1, 1, 1, 1, 1,
-0.674342, 0.3929589, -1.157266, 1, 1, 1, 1, 1,
-0.6736075, 0.337718, -1.826485, 1, 1, 1, 1, 1,
-0.672349, 0.8983045, -1.513789, 1, 1, 1, 1, 1,
-0.6722333, -0.5850643, -1.539021, 1, 1, 1, 1, 1,
-0.6720927, -1.293914, -3.078667, 1, 1, 1, 1, 1,
-0.671315, -0.00101746, -2.510008, 1, 1, 1, 1, 1,
-0.6672992, 0.4897709, -1.790298, 1, 1, 1, 1, 1,
-0.6657208, 0.09821571, -3.077032, 1, 1, 1, 1, 1,
-0.6611989, -0.6789025, -1.583435, 0, 0, 1, 1, 1,
-0.6508921, 0.3444394, -1.919006, 1, 0, 0, 1, 1,
-0.6456019, -0.04029921, -1.783106, 1, 0, 0, 1, 1,
-0.6432446, -0.1698142, -1.783584, 1, 0, 0, 1, 1,
-0.6422443, -0.1116657, -1.76514, 1, 0, 0, 1, 1,
-0.6421105, 0.6065041, -0.6621735, 1, 0, 0, 1, 1,
-0.636647, 0.8088313, -0.02567358, 0, 0, 0, 1, 1,
-0.6355938, -0.8764368, -2.714228, 0, 0, 0, 1, 1,
-0.6351929, 0.9015206, -0.600055, 0, 0, 0, 1, 1,
-0.63087, 0.9275577, 0.2630526, 0, 0, 0, 1, 1,
-0.62928, -0.03561755, -1.650968, 0, 0, 0, 1, 1,
-0.6260128, 0.4625259, -1.871465, 0, 0, 0, 1, 1,
-0.624616, -2.264658, -5.035749, 0, 0, 0, 1, 1,
-0.6225829, 0.3589755, -1.593113, 1, 1, 1, 1, 1,
-0.6197109, -1.839213, -2.43704, 1, 1, 1, 1, 1,
-0.6164724, 0.9865428, -0.6391986, 1, 1, 1, 1, 1,
-0.6153821, -0.440162, -2.061407, 1, 1, 1, 1, 1,
-0.6034535, 0.5530142, -1.681297, 1, 1, 1, 1, 1,
-0.5965705, 0.7290024, -1.442593, 1, 1, 1, 1, 1,
-0.5947739, 1.279009, 1.001048, 1, 1, 1, 1, 1,
-0.5941878, -1.275061, -2.802056, 1, 1, 1, 1, 1,
-0.593309, 0.9957945, 0.4887659, 1, 1, 1, 1, 1,
-0.5885153, -0.2208928, -1.083259, 1, 1, 1, 1, 1,
-0.5862821, 0.7024429, -2.110287, 1, 1, 1, 1, 1,
-0.5850139, 2.143978, -1.746699, 1, 1, 1, 1, 1,
-0.5807222, -0.1241071, -3.584305, 1, 1, 1, 1, 1,
-0.5806556, 0.3718649, 0.6191587, 1, 1, 1, 1, 1,
-0.5785736, -0.01749999, -0.4020499, 1, 1, 1, 1, 1,
-0.5758197, 0.7112425, -1.219121, 0, 0, 1, 1, 1,
-0.5750732, 0.4245634, 0.602413, 1, 0, 0, 1, 1,
-0.5744328, -0.5401943, -2.522039, 1, 0, 0, 1, 1,
-0.5734552, 0.2458761, -1.104293, 1, 0, 0, 1, 1,
-0.5722352, 0.1928245, -2.350003, 1, 0, 0, 1, 1,
-0.5681452, -1.656842, -0.3138376, 1, 0, 0, 1, 1,
-0.5659359, -0.7554942, -2.971234, 0, 0, 0, 1, 1,
-0.563381, -0.2842519, -3.301728, 0, 0, 0, 1, 1,
-0.5633618, 0.8490555, 1.762182, 0, 0, 0, 1, 1,
-0.5623813, 0.7358439, -0.6985021, 0, 0, 0, 1, 1,
-0.5561707, 1.438672, 0.3293591, 0, 0, 0, 1, 1,
-0.5558732, -0.7602424, -2.705497, 0, 0, 0, 1, 1,
-0.5557292, 0.2950615, -1.32167, 0, 0, 0, 1, 1,
-0.5554479, 0.05281417, -2.023137, 1, 1, 1, 1, 1,
-0.5551514, -1.08622, -1.243266, 1, 1, 1, 1, 1,
-0.5524104, -1.17297, -2.320364, 1, 1, 1, 1, 1,
-0.5519486, -0.5386447, -1.283187, 1, 1, 1, 1, 1,
-0.5403682, 1.235401, -0.5420042, 1, 1, 1, 1, 1,
-0.5388451, 0.5308489, -0.3889704, 1, 1, 1, 1, 1,
-0.5387591, 0.02501866, -3.014089, 1, 1, 1, 1, 1,
-0.5352814, 0.2240755, 1.26351, 1, 1, 1, 1, 1,
-0.532838, -0.08002186, -1.976919, 1, 1, 1, 1, 1,
-0.5326576, -1.138852, -1.133143, 1, 1, 1, 1, 1,
-0.5290641, 0.5879508, 0.1151113, 1, 1, 1, 1, 1,
-0.5283834, 1.550941, 0.4339495, 1, 1, 1, 1, 1,
-0.5199515, 0.9977763, -0.1801624, 1, 1, 1, 1, 1,
-0.5164257, 1.637769, -0.7899364, 1, 1, 1, 1, 1,
-0.5154949, 0.588267, -1.713537, 1, 1, 1, 1, 1,
-0.5110117, 0.4077674, -1.904734, 0, 0, 1, 1, 1,
-0.508739, -0.6939771, -2.058593, 1, 0, 0, 1, 1,
-0.5030529, -0.1659765, -2.021949, 1, 0, 0, 1, 1,
-0.502054, -1.170945, -2.803286, 1, 0, 0, 1, 1,
-0.4974823, -0.09413765, -1.980191, 1, 0, 0, 1, 1,
-0.4961731, 0.2349662, -2.306864, 1, 0, 0, 1, 1,
-0.4942614, -0.7013606, -0.8576987, 0, 0, 0, 1, 1,
-0.4868118, -2.457889, -0.009599601, 0, 0, 0, 1, 1,
-0.4853609, 0.3298646, -3.367308, 0, 0, 0, 1, 1,
-0.4832439, 0.102756, -2.433393, 0, 0, 0, 1, 1,
-0.4768225, 1.155859, 3.649689, 0, 0, 0, 1, 1,
-0.4731324, 0.4870061, -1.594375, 0, 0, 0, 1, 1,
-0.4717376, 0.07232243, -1.387071, 0, 0, 0, 1, 1,
-0.4702003, -0.2158024, -1.61444, 1, 1, 1, 1, 1,
-0.4677985, -0.8828547, -2.684191, 1, 1, 1, 1, 1,
-0.4649805, 0.833933, 0.9877483, 1, 1, 1, 1, 1,
-0.4637533, 0.6795327, -1.488462, 1, 1, 1, 1, 1,
-0.4633756, 1.59485, -1.86993, 1, 1, 1, 1, 1,
-0.4629888, 0.5825169, -1.586955, 1, 1, 1, 1, 1,
-0.4625267, 0.05787512, -1.34172, 1, 1, 1, 1, 1,
-0.4609561, -0.2497456, -2.431797, 1, 1, 1, 1, 1,
-0.4554013, -0.577562, -0.9299656, 1, 1, 1, 1, 1,
-0.454009, 0.1810968, 0.6021783, 1, 1, 1, 1, 1,
-0.4517117, -2.736648, -1.31158, 1, 1, 1, 1, 1,
-0.4505619, 1.190032, -1.068446, 1, 1, 1, 1, 1,
-0.4482895, -0.8615592, -3.033686, 1, 1, 1, 1, 1,
-0.4473965, 0.3236396, -1.172219, 1, 1, 1, 1, 1,
-0.4458209, 0.5463137, -1.005381, 1, 1, 1, 1, 1,
-0.4457569, 0.4145257, -0.2271954, 0, 0, 1, 1, 1,
-0.444467, 0.2807759, -0.3655589, 1, 0, 0, 1, 1,
-0.4405231, -0.6334258, -3.189925, 1, 0, 0, 1, 1,
-0.4394833, 0.5666198, -1.654496, 1, 0, 0, 1, 1,
-0.4368583, -0.9081314, -2.83005, 1, 0, 0, 1, 1,
-0.4348647, -0.2767299, -0.1495783, 1, 0, 0, 1, 1,
-0.4304453, -1.110825, -2.914157, 0, 0, 0, 1, 1,
-0.4297226, 0.3067523, -1.313874, 0, 0, 0, 1, 1,
-0.4278478, 0.9921197, -1.121306, 0, 0, 0, 1, 1,
-0.4260934, 0.4161768, -2.356172, 0, 0, 0, 1, 1,
-0.4256173, 0.880575, 0.251596, 0, 0, 0, 1, 1,
-0.4225239, -0.4530661, -1.997513, 0, 0, 0, 1, 1,
-0.4222289, -1.676675, -2.783036, 0, 0, 0, 1, 1,
-0.4219366, 0.2929146, 0.2829337, 1, 1, 1, 1, 1,
-0.421531, 0.318533, -1.276108, 1, 1, 1, 1, 1,
-0.4202174, -1.506275, -5.510232, 1, 1, 1, 1, 1,
-0.419964, -0.2759602, -1.531066, 1, 1, 1, 1, 1,
-0.4174948, -0.2550928, -2.162919, 1, 1, 1, 1, 1,
-0.4157623, -0.7334557, -3.178711, 1, 1, 1, 1, 1,
-0.412641, -0.2860307, -1.748618, 1, 1, 1, 1, 1,
-0.4081261, -1.372978, -1.354018, 1, 1, 1, 1, 1,
-0.4073724, 0.9876149, -0.2207753, 1, 1, 1, 1, 1,
-0.4036236, -0.1882777, -0.5514389, 1, 1, 1, 1, 1,
-0.3972991, -0.85873, -2.452749, 1, 1, 1, 1, 1,
-0.3927396, -0.2413891, -2.407809, 1, 1, 1, 1, 1,
-0.3926157, 0.8401851, 0.559532, 1, 1, 1, 1, 1,
-0.3921974, 0.9622796, 0.3014139, 1, 1, 1, 1, 1,
-0.3820838, -1.674648, -2.101782, 1, 1, 1, 1, 1,
-0.3819381, -1.086934, -3.720432, 0, 0, 1, 1, 1,
-0.3793862, 0.6906393, -2.42633, 1, 0, 0, 1, 1,
-0.3684151, 1.13567, 0.3156705, 1, 0, 0, 1, 1,
-0.3650462, 0.8632343, -0.03270555, 1, 0, 0, 1, 1,
-0.3564308, -0.08831165, -2.644471, 1, 0, 0, 1, 1,
-0.3519523, 1.0506, -1.284378, 1, 0, 0, 1, 1,
-0.3509725, 1.310986, 0.4964778, 0, 0, 0, 1, 1,
-0.3485419, 0.627634, -1.123085, 0, 0, 0, 1, 1,
-0.3471563, -0.5537387, -2.98645, 0, 0, 0, 1, 1,
-0.345418, 1.388176, -1.48201, 0, 0, 0, 1, 1,
-0.3449669, -1.120191, -3.699841, 0, 0, 0, 1, 1,
-0.3444549, 0.2218006, -0.6078964, 0, 0, 0, 1, 1,
-0.3424367, 0.6343441, -0.9331903, 0, 0, 0, 1, 1,
-0.3415803, -1.418019, -2.420701, 1, 1, 1, 1, 1,
-0.3407382, 1.644392, 0.6229208, 1, 1, 1, 1, 1,
-0.3401247, 0.3094327, -0.3597201, 1, 1, 1, 1, 1,
-0.3393084, -0.6627647, -1.596068, 1, 1, 1, 1, 1,
-0.3390006, 0.3662488, -0.873919, 1, 1, 1, 1, 1,
-0.3383803, -2.452194, -1.626464, 1, 1, 1, 1, 1,
-0.3363891, -0.5526408, -2.142208, 1, 1, 1, 1, 1,
-0.3359483, 2.80977, -1.4013, 1, 1, 1, 1, 1,
-0.3358777, 1.060944, -0.2621209, 1, 1, 1, 1, 1,
-0.3326113, 0.6332018, -0.07449439, 1, 1, 1, 1, 1,
-0.3302614, 0.5302526, 0.3237548, 1, 1, 1, 1, 1,
-0.329338, -0.1576893, -0.9195293, 1, 1, 1, 1, 1,
-0.3241729, -0.06943832, -2.853583, 1, 1, 1, 1, 1,
-0.3230307, -0.3762895, -0.7174218, 1, 1, 1, 1, 1,
-0.3213217, -0.4381548, -1.310606, 1, 1, 1, 1, 1,
-0.3196361, -0.3469625, -3.221149, 0, 0, 1, 1, 1,
-0.317391, -0.3565436, -1.722683, 1, 0, 0, 1, 1,
-0.3123688, -0.895099, -2.20762, 1, 0, 0, 1, 1,
-0.3110348, 1.044081, 0.3436004, 1, 0, 0, 1, 1,
-0.307757, -1.529664, -3.752252, 1, 0, 0, 1, 1,
-0.3027042, -0.7678229, -3.626954, 1, 0, 0, 1, 1,
-0.300581, 0.1536734, -0.6593187, 0, 0, 0, 1, 1,
-0.2969621, -0.3697392, -3.93236, 0, 0, 0, 1, 1,
-0.2925684, 0.2522205, -2.046337, 0, 0, 0, 1, 1,
-0.2905555, 0.2726771, -0.0751534, 0, 0, 0, 1, 1,
-0.2886688, -1.907551, -2.7405, 0, 0, 0, 1, 1,
-0.2876667, -1.096634, -1.426499, 0, 0, 0, 1, 1,
-0.2845716, -0.08418486, -1.114705, 0, 0, 0, 1, 1,
-0.2829468, 1.815103, 1.373681, 1, 1, 1, 1, 1,
-0.2827656, -0.03441558, -1.722204, 1, 1, 1, 1, 1,
-0.2769577, 0.6996942, 0.188249, 1, 1, 1, 1, 1,
-0.2756671, -0.9026688, -4.215251, 1, 1, 1, 1, 1,
-0.2707059, 0.1346346, -0.3842208, 1, 1, 1, 1, 1,
-0.2706584, 0.8682193, 1.481748, 1, 1, 1, 1, 1,
-0.2686599, 1.037414, 1.354283, 1, 1, 1, 1, 1,
-0.2659905, -0.4587489, -1.882011, 1, 1, 1, 1, 1,
-0.2656286, 0.3062077, 0.9272823, 1, 1, 1, 1, 1,
-0.26404, 1.381508, 2.561912, 1, 1, 1, 1, 1,
-0.2639757, 0.6602445, -0.7262909, 1, 1, 1, 1, 1,
-0.2627188, -0.4400948, -2.733298, 1, 1, 1, 1, 1,
-0.2608705, -0.1494215, -1.775187, 1, 1, 1, 1, 1,
-0.2586446, -0.6534864, -3.220685, 1, 1, 1, 1, 1,
-0.2584281, 0.07469091, -1.313392, 1, 1, 1, 1, 1,
-0.2579156, 0.3161984, -0.6000485, 0, 0, 1, 1, 1,
-0.2565461, 0.5365664, -0.7623962, 1, 0, 0, 1, 1,
-0.2523564, 0.6712203, -1.979261, 1, 0, 0, 1, 1,
-0.2519008, 0.01640366, -1.895206, 1, 0, 0, 1, 1,
-0.2482201, -1.782428, -3.845936, 1, 0, 0, 1, 1,
-0.2479861, 0.01792261, -1.827067, 1, 0, 0, 1, 1,
-0.2282953, -0.1801842, -2.186133, 0, 0, 0, 1, 1,
-0.2277894, 1.036326, 1.943075, 0, 0, 0, 1, 1,
-0.2214852, -1.137986, -4.197444, 0, 0, 0, 1, 1,
-0.2207953, 0.2843773, -1.034861, 0, 0, 0, 1, 1,
-0.220049, 1.700746, 1.080411, 0, 0, 0, 1, 1,
-0.2195058, -0.1907582, -2.061909, 0, 0, 0, 1, 1,
-0.2185642, 2.223159, -0.6230375, 0, 0, 0, 1, 1,
-0.2129903, 0.0812318, -0.3170411, 1, 1, 1, 1, 1,
-0.2124693, -0.1551092, -2.101655, 1, 1, 1, 1, 1,
-0.2114569, -0.4447066, -2.364154, 1, 1, 1, 1, 1,
-0.2105809, -0.08934091, -1.717101, 1, 1, 1, 1, 1,
-0.208367, 0.390234, -1.07984, 1, 1, 1, 1, 1,
-0.2062207, 1.655701, -0.0967578, 1, 1, 1, 1, 1,
-0.2061164, -0.1720561, -0.8403742, 1, 1, 1, 1, 1,
-0.2055549, -1.725515, -5.465265, 1, 1, 1, 1, 1,
-0.2029671, 2.309021, -0.9228197, 1, 1, 1, 1, 1,
-0.2016414, -0.2569653, -3.500827, 1, 1, 1, 1, 1,
-0.1987264, -0.3272019, -2.733251, 1, 1, 1, 1, 1,
-0.1960579, -0.7709673, -3.038159, 1, 1, 1, 1, 1,
-0.1950942, 0.08416361, -1.297361, 1, 1, 1, 1, 1,
-0.1920071, 1.781265, 0.7394089, 1, 1, 1, 1, 1,
-0.18975, -0.6834456, -2.188224, 1, 1, 1, 1, 1,
-0.1890893, -0.4617861, -3.020852, 0, 0, 1, 1, 1,
-0.1855781, 3.34425, -0.2237466, 1, 0, 0, 1, 1,
-0.1851764, -0.06847056, -3.177039, 1, 0, 0, 1, 1,
-0.1837771, -2.328363, -1.803177, 1, 0, 0, 1, 1,
-0.1821798, -0.2555455, -1.916813, 1, 0, 0, 1, 1,
-0.1793646, 0.7494395, -2.498423, 1, 0, 0, 1, 1,
-0.1731303, 0.569884, 0.7341688, 0, 0, 0, 1, 1,
-0.1731009, -0.4591984, -1.598965, 0, 0, 0, 1, 1,
-0.1682586, -0.933899, -2.536985, 0, 0, 0, 1, 1,
-0.1672619, 0.4228905, -0.6330118, 0, 0, 0, 1, 1,
-0.1601768, -0.2669853, -0.9502473, 0, 0, 0, 1, 1,
-0.1580334, 1.355102, -0.4986633, 0, 0, 0, 1, 1,
-0.157058, 0.1517422, -0.9262565, 0, 0, 0, 1, 1,
-0.156845, 0.6778004, 0.4523167, 1, 1, 1, 1, 1,
-0.1565321, -1.508444, -2.986971, 1, 1, 1, 1, 1,
-0.1546853, 1.221315, -0.6844759, 1, 1, 1, 1, 1,
-0.1532715, -0.6925553, -1.771361, 1, 1, 1, 1, 1,
-0.1523656, 2.361868, -1.148541, 1, 1, 1, 1, 1,
-0.1491307, -1.337511, -2.14452, 1, 1, 1, 1, 1,
-0.1435603, -1.770346, -1.883785, 1, 1, 1, 1, 1,
-0.1387177, -0.03670883, -1.833142, 1, 1, 1, 1, 1,
-0.1372191, 0.6281523, 1.381005, 1, 1, 1, 1, 1,
-0.1350684, 0.8696828, 0.1241531, 1, 1, 1, 1, 1,
-0.1311302, 0.2880015, -2.900573, 1, 1, 1, 1, 1,
-0.1287106, 0.6297247, 1.164611, 1, 1, 1, 1, 1,
-0.127465, -1.701722, -2.444525, 1, 1, 1, 1, 1,
-0.1249539, 0.3354134, -1.447087, 1, 1, 1, 1, 1,
-0.1219345, 2.328695, 0.2361154, 1, 1, 1, 1, 1,
-0.1216795, 1.424956, -0.3402677, 0, 0, 1, 1, 1,
-0.1173214, -0.4455796, -1.279194, 1, 0, 0, 1, 1,
-0.1139293, -0.8384804, -2.832554, 1, 0, 0, 1, 1,
-0.11267, 1.782738, -1.141701, 1, 0, 0, 1, 1,
-0.1087547, 0.1935013, -1.675528, 1, 0, 0, 1, 1,
-0.1064018, -1.873466, -2.66734, 1, 0, 0, 1, 1,
-0.1036331, 0.3955856, -0.4957478, 0, 0, 0, 1, 1,
-0.10341, 0.5548142, -0.7346743, 0, 0, 0, 1, 1,
-0.1009881, -0.4136942, -2.535172, 0, 0, 0, 1, 1,
-0.100927, 0.2941091, 2.088531, 0, 0, 0, 1, 1,
-0.1006433, -0.2958261, -2.569203, 0, 0, 0, 1, 1,
-0.09736292, -0.3826323, -3.414428, 0, 0, 0, 1, 1,
-0.0972928, 0.2387698, -1.574773, 0, 0, 0, 1, 1,
-0.08971294, -0.4363385, -5.850685, 1, 1, 1, 1, 1,
-0.08896568, 0.5550642, -1.100775, 1, 1, 1, 1, 1,
-0.0798902, 0.5633185, -1.095614, 1, 1, 1, 1, 1,
-0.07898618, -2.199105, -3.037395, 1, 1, 1, 1, 1,
-0.07358077, -1.656825, -3.178139, 1, 1, 1, 1, 1,
-0.07162438, -0.1462267, -3.051705, 1, 1, 1, 1, 1,
-0.07096184, -0.1948118, -4.234858, 1, 1, 1, 1, 1,
-0.06747778, 0.9212984, 0.1876014, 1, 1, 1, 1, 1,
-0.06675112, -0.1999742, -4.091346, 1, 1, 1, 1, 1,
-0.0661929, -0.06968208, -1.591251, 1, 1, 1, 1, 1,
-0.06295338, 1.45891, 0.3194685, 1, 1, 1, 1, 1,
-0.05730617, 1.019362, 0.3084073, 1, 1, 1, 1, 1,
-0.05195256, -0.4323181, -3.263102, 1, 1, 1, 1, 1,
-0.04821756, 1.650583, 0.300299, 1, 1, 1, 1, 1,
-0.04772865, -0.5679031, -2.687745, 1, 1, 1, 1, 1,
-0.04594916, -0.7860704, -3.989716, 0, 0, 1, 1, 1,
-0.04494943, 1.07874, -0.4734181, 1, 0, 0, 1, 1,
-0.04434212, -1.139995, -3.293192, 1, 0, 0, 1, 1,
-0.04377311, -1.134597, -3.623019, 1, 0, 0, 1, 1,
-0.04330526, 2.140426, -0.6685959, 1, 0, 0, 1, 1,
-0.04212013, -0.04430656, -3.677996, 1, 0, 0, 1, 1,
-0.04150138, 1.186128, -1.132667, 0, 0, 0, 1, 1,
-0.03986441, -0.4491409, -4.824902, 0, 0, 0, 1, 1,
-0.03823308, 1.547468, 2.4182, 0, 0, 0, 1, 1,
-0.03775657, -0.8049962, -3.981246, 0, 0, 0, 1, 1,
-0.03460456, 0.4648472, -0.8223957, 0, 0, 0, 1, 1,
-0.02985172, -1.021262, -4.072925, 0, 0, 0, 1, 1,
-0.02978906, 0.5451362, 0.3618805, 0, 0, 0, 1, 1,
-0.02924333, 0.8656399, 0.2725333, 1, 1, 1, 1, 1,
-0.02267001, 0.09079894, 0.1633442, 1, 1, 1, 1, 1,
-0.01943899, -0.5372637, -1.813548, 1, 1, 1, 1, 1,
-0.01796277, 0.002076977, -0.4108109, 1, 1, 1, 1, 1,
-0.01726003, -0.02770579, -2.067292, 1, 1, 1, 1, 1,
-0.01555386, 0.8701576, -0.641495, 1, 1, 1, 1, 1,
-0.01485724, -2.092891, -4.333292, 1, 1, 1, 1, 1,
-0.01325793, 1.13139, -1.473765, 1, 1, 1, 1, 1,
-0.01310646, -0.7513128, -3.488225, 1, 1, 1, 1, 1,
-0.004666999, 0.5098768, 0.3917494, 1, 1, 1, 1, 1,
0.0006868692, 0.6582736, 1.903133, 1, 1, 1, 1, 1,
0.002539676, 0.8180174, -0.3857713, 1, 1, 1, 1, 1,
0.005063169, 0.03685539, 0.7464315, 1, 1, 1, 1, 1,
0.006928521, -1.107332, 1.462958, 1, 1, 1, 1, 1,
0.007427722, 1.367785, 1.321579, 1, 1, 1, 1, 1,
0.01250586, 0.2342845, 0.6209993, 0, 0, 1, 1, 1,
0.01271133, -0.1362856, 3.869961, 1, 0, 0, 1, 1,
0.0132056, -0.8480708, 4.348266, 1, 0, 0, 1, 1,
0.01601958, -0.9059337, 4.294146, 1, 0, 0, 1, 1,
0.01739343, 0.514438, 1.215822, 1, 0, 0, 1, 1,
0.01977875, 0.7526627, 0.4674761, 1, 0, 0, 1, 1,
0.02062758, 0.006594219, 1.441624, 0, 0, 0, 1, 1,
0.02154079, 1.833104, 1.154244, 0, 0, 0, 1, 1,
0.02620875, 1.594388, 0.7417784, 0, 0, 0, 1, 1,
0.02726149, 1.932583, 0.8596374, 0, 0, 0, 1, 1,
0.03043249, 0.8511683, -0.1986786, 0, 0, 0, 1, 1,
0.03148926, -1.367887, 2.051738, 0, 0, 0, 1, 1,
0.04989125, 0.186831, -0.6363876, 0, 0, 0, 1, 1,
0.05220133, 0.7290276, 0.8769727, 1, 1, 1, 1, 1,
0.05562712, -0.6367303, 2.18122, 1, 1, 1, 1, 1,
0.05757347, 0.4048345, 0.7009121, 1, 1, 1, 1, 1,
0.05839998, 0.1652456, -2.542812, 1, 1, 1, 1, 1,
0.05957585, -1.529513, 3.501674, 1, 1, 1, 1, 1,
0.06045643, -0.4141288, 2.737422, 1, 1, 1, 1, 1,
0.06596572, -0.4848554, 4.057085, 1, 1, 1, 1, 1,
0.06887528, 0.5556279, 0.8894892, 1, 1, 1, 1, 1,
0.06942537, -0.01558338, 2.254952, 1, 1, 1, 1, 1,
0.07029851, 0.8295895, 0.2319598, 1, 1, 1, 1, 1,
0.0712127, -0.02330578, 1.014689, 1, 1, 1, 1, 1,
0.07206087, 0.4547027, 0.6677042, 1, 1, 1, 1, 1,
0.07874069, -0.1807584, 2.625758, 1, 1, 1, 1, 1,
0.08204045, 0.1614779, 0.674435, 1, 1, 1, 1, 1,
0.08300181, -0.4124424, 3.565441, 1, 1, 1, 1, 1,
0.08879071, -0.9109281, 2.666152, 0, 0, 1, 1, 1,
0.08881998, -2.124253, 4.391085, 1, 0, 0, 1, 1,
0.09653798, 1.213855, -1.531293, 1, 0, 0, 1, 1,
0.09832974, -0.2158596, 2.323693, 1, 0, 0, 1, 1,
0.09875388, -0.05756474, 1.594175, 1, 0, 0, 1, 1,
0.09957839, 0.2786475, -0.6829274, 1, 0, 0, 1, 1,
0.09983734, -0.2641391, 1.677084, 0, 0, 0, 1, 1,
0.1032582, 1.129479, -1.614692, 0, 0, 0, 1, 1,
0.1035691, 0.9270835, 0.2743736, 0, 0, 0, 1, 1,
0.1050762, 0.1022968, 1.853962, 0, 0, 0, 1, 1,
0.1073789, 0.5852965, -0.2693306, 0, 0, 0, 1, 1,
0.108282, 0.3399506, 1.266262, 0, 0, 0, 1, 1,
0.1132909, 0.4101496, -0.2706533, 0, 0, 0, 1, 1,
0.1143895, 1.3322, -0.3587729, 1, 1, 1, 1, 1,
0.1205908, -0.5160212, 1.920901, 1, 1, 1, 1, 1,
0.1205979, -1.182086, 3.061272, 1, 1, 1, 1, 1,
0.1209426, -0.01474723, 1.783235, 1, 1, 1, 1, 1,
0.1211826, -0.7624869, 1.150008, 1, 1, 1, 1, 1,
0.1243469, 1.520364, -0.7085736, 1, 1, 1, 1, 1,
0.1247734, 1.670307, -0.4599043, 1, 1, 1, 1, 1,
0.126281, -0.6335146, 2.739434, 1, 1, 1, 1, 1,
0.1291288, 0.2415397, 0.4113634, 1, 1, 1, 1, 1,
0.1294718, -0.2452098, 2.64741, 1, 1, 1, 1, 1,
0.1296705, 0.4645422, 0.7960967, 1, 1, 1, 1, 1,
0.1324118, -0.08649762, 1.589951, 1, 1, 1, 1, 1,
0.1368489, 0.5908676, 1.016351, 1, 1, 1, 1, 1,
0.1386523, -1.036777, 4.225976, 1, 1, 1, 1, 1,
0.141968, 0.1687056, -0.7904371, 1, 1, 1, 1, 1,
0.1422008, -0.4652993, 3.835942, 0, 0, 1, 1, 1,
0.1429465, 2.045867, -0.6830265, 1, 0, 0, 1, 1,
0.1446044, 0.8198082, 1.317207, 1, 0, 0, 1, 1,
0.1460123, 0.762229, -0.1464032, 1, 0, 0, 1, 1,
0.1514669, 0.0396766, 1.388865, 1, 0, 0, 1, 1,
0.1526707, 1.216131, -1.095612, 1, 0, 0, 1, 1,
0.159993, 0.3565821, 0.8369997, 0, 0, 0, 1, 1,
0.160157, 2.497111, -2.504596, 0, 0, 0, 1, 1,
0.1619393, -0.3321528, 2.583858, 0, 0, 0, 1, 1,
0.1733026, 0.7146203, 1.710166, 0, 0, 0, 1, 1,
0.1733293, -0.1317688, 2.047853, 0, 0, 0, 1, 1,
0.1762719, -2.069795, 1.632082, 0, 0, 0, 1, 1,
0.1770739, 0.07470731, 1.557262, 0, 0, 0, 1, 1,
0.1781771, -0.5425453, 3.284763, 1, 1, 1, 1, 1,
0.178501, -0.3706454, 4.798591, 1, 1, 1, 1, 1,
0.1822404, -0.6556889, 1.349713, 1, 1, 1, 1, 1,
0.1844807, 1.112072, 0.6847677, 1, 1, 1, 1, 1,
0.1860461, -0.7567087, 1.888047, 1, 1, 1, 1, 1,
0.1906328, 0.02743249, 0.8526996, 1, 1, 1, 1, 1,
0.1952663, 0.3468544, 1.293308, 1, 1, 1, 1, 1,
0.1959725, -0.06598096, 1.480685, 1, 1, 1, 1, 1,
0.1968168, -3.839569, 1.795519, 1, 1, 1, 1, 1,
0.198068, 1.186086, -1.237403, 1, 1, 1, 1, 1,
0.2022194, 0.04274674, 1.661046, 1, 1, 1, 1, 1,
0.2029273, -0.600256, 2.564209, 1, 1, 1, 1, 1,
0.2031186, 1.874553, 0.5643905, 1, 1, 1, 1, 1,
0.2060329, -1.126225, 0.8254568, 1, 1, 1, 1, 1,
0.2071957, -0.3324188, 1.122133, 1, 1, 1, 1, 1,
0.2120141, 0.7861375, -0.1504493, 0, 0, 1, 1, 1,
0.2130452, 0.7056222, 0.8283437, 1, 0, 0, 1, 1,
0.2162307, 0.8686843, 1.980566, 1, 0, 0, 1, 1,
0.2199279, -0.5932299, 1.991209, 1, 0, 0, 1, 1,
0.2282794, -0.5092054, 3.917957, 1, 0, 0, 1, 1,
0.2298543, -0.5084743, 2.108484, 1, 0, 0, 1, 1,
0.2305498, -1.450061, 3.840806, 0, 0, 0, 1, 1,
0.2312704, -1.632402, 3.869676, 0, 0, 0, 1, 1,
0.2398023, -1.404611, 2.499697, 0, 0, 0, 1, 1,
0.2439411, -1.120354, 3.536456, 0, 0, 0, 1, 1,
0.2533554, -0.9172869, 4.13095, 0, 0, 0, 1, 1,
0.2564973, 0.7885155, 0.4490863, 0, 0, 0, 1, 1,
0.2574261, -0.4348241, 3.430098, 0, 0, 0, 1, 1,
0.2578607, -0.743548, 3.773671, 1, 1, 1, 1, 1,
0.2582638, 0.3652259, 0.9613206, 1, 1, 1, 1, 1,
0.2603422, 0.02618227, 0.006843117, 1, 1, 1, 1, 1,
0.2623049, -0.1628038, 3.846824, 1, 1, 1, 1, 1,
0.2628849, -0.8023263, 1.196071, 1, 1, 1, 1, 1,
0.2666584, 0.5007187, -1.076056, 1, 1, 1, 1, 1,
0.2746321, -0.2726795, 2.793366, 1, 1, 1, 1, 1,
0.2766047, 0.3211593, 1.134177, 1, 1, 1, 1, 1,
0.2807739, 0.2598119, 1.978853, 1, 1, 1, 1, 1,
0.2901443, 1.023964, 0.5232914, 1, 1, 1, 1, 1,
0.2912527, -1.013655, 2.458743, 1, 1, 1, 1, 1,
0.2942367, -0.7878453, 2.165488, 1, 1, 1, 1, 1,
0.2990785, -0.9559535, 3.319605, 1, 1, 1, 1, 1,
0.2991045, 0.1417875, 0.1437876, 1, 1, 1, 1, 1,
0.2993038, 0.2974287, 0.02964902, 1, 1, 1, 1, 1,
0.300381, -0.5721835, 3.750695, 0, 0, 1, 1, 1,
0.3039656, 0.3161114, 2.113787, 1, 0, 0, 1, 1,
0.3053094, 0.2139156, 1.309193, 1, 0, 0, 1, 1,
0.305693, 0.2629225, -1.091816, 1, 0, 0, 1, 1,
0.3065438, -0.003979946, 1.600662, 1, 0, 0, 1, 1,
0.3070558, -1.341298, 1.729434, 1, 0, 0, 1, 1,
0.3141077, -1.416753, 2.641215, 0, 0, 0, 1, 1,
0.3149452, -0.3602583, 1.742928, 0, 0, 0, 1, 1,
0.3214039, -2.102844, 0.4204316, 0, 0, 0, 1, 1,
0.3217425, -0.5472578, 4.367501, 0, 0, 0, 1, 1,
0.3238488, 0.04658208, -0.3517298, 0, 0, 0, 1, 1,
0.3251032, -0.4588562, 1.848553, 0, 0, 0, 1, 1,
0.3256078, 0.7697584, 0.4266429, 0, 0, 0, 1, 1,
0.3325014, -1.613593, 4.051425, 1, 1, 1, 1, 1,
0.3325689, 1.181672, 0.006872965, 1, 1, 1, 1, 1,
0.338338, -0.1647211, 4.114696, 1, 1, 1, 1, 1,
0.3401257, 1.942924, 0.07976349, 1, 1, 1, 1, 1,
0.3401692, 0.7799428, 0.5928515, 1, 1, 1, 1, 1,
0.3401755, -0.364126, 2.720187, 1, 1, 1, 1, 1,
0.3430178, -0.4170847, 2.802633, 1, 1, 1, 1, 1,
0.3479408, -0.3250575, 2.473015, 1, 1, 1, 1, 1,
0.3548348, 0.9568792, 0.3001564, 1, 1, 1, 1, 1,
0.3551373, -0.06493804, 2.803312, 1, 1, 1, 1, 1,
0.3591798, 1.066287, 0.2983266, 1, 1, 1, 1, 1,
0.3625698, 1.854647, 0.4685721, 1, 1, 1, 1, 1,
0.3655355, 0.1215894, 1.147505, 1, 1, 1, 1, 1,
0.3659794, 0.1880494, -0.7119198, 1, 1, 1, 1, 1,
0.3659975, 0.3586876, 1.36609, 1, 1, 1, 1, 1,
0.366197, -0.4954863, 2.01668, 0, 0, 1, 1, 1,
0.3718163, 2.268788, -0.5462499, 1, 0, 0, 1, 1,
0.3725592, 0.8739472, 0.6309457, 1, 0, 0, 1, 1,
0.377946, 0.5102721, 1.822074, 1, 0, 0, 1, 1,
0.3797249, 0.5233318, 1.093705, 1, 0, 0, 1, 1,
0.3799886, -0.3194841, 4.00879, 1, 0, 0, 1, 1,
0.3867255, 0.9072487, 1.177065, 0, 0, 0, 1, 1,
0.3977327, 0.6647483, 1.15343, 0, 0, 0, 1, 1,
0.3979441, -0.23997, 2.848452, 0, 0, 0, 1, 1,
0.4022883, -0.5248742, 2.51562, 0, 0, 0, 1, 1,
0.403603, -0.278877, 3.440596, 0, 0, 0, 1, 1,
0.4167351, -0.1419321, 1.490768, 0, 0, 0, 1, 1,
0.4170764, 0.3242991, -0.679328, 0, 0, 0, 1, 1,
0.4232575, -0.788233, 1.883593, 1, 1, 1, 1, 1,
0.4274548, -1.246045, 2.776941, 1, 1, 1, 1, 1,
0.4277195, -0.2122089, 2.340225, 1, 1, 1, 1, 1,
0.430075, -1.504047, 2.804877, 1, 1, 1, 1, 1,
0.4313437, -0.2150983, 4.022075, 1, 1, 1, 1, 1,
0.4349059, 0.3043387, 0.3662704, 1, 1, 1, 1, 1,
0.4375269, -0.7685023, 3.344551, 1, 1, 1, 1, 1,
0.4391916, -0.4040041, 1.343586, 1, 1, 1, 1, 1,
0.4467882, 0.9662467, -0.610342, 1, 1, 1, 1, 1,
0.447015, -1.156845, 0.9652118, 1, 1, 1, 1, 1,
0.4564142, -0.3844045, 2.749855, 1, 1, 1, 1, 1,
0.4630056, -0.3297959, 0.7207037, 1, 1, 1, 1, 1,
0.4637287, 0.3578046, 0.7574349, 1, 1, 1, 1, 1,
0.4742971, -0.05793764, 1.40209, 1, 1, 1, 1, 1,
0.4743239, 1.907241, -0.9811329, 1, 1, 1, 1, 1,
0.4749957, 0.7545672, 1.542817, 0, 0, 1, 1, 1,
0.4756128, 0.8535357, -0.07763279, 1, 0, 0, 1, 1,
0.483525, -1.497835, 1.315582, 1, 0, 0, 1, 1,
0.4842763, -1.043414, 3.164814, 1, 0, 0, 1, 1,
0.4846058, -1.982512, 3.160808, 1, 0, 0, 1, 1,
0.4857982, -2.091233, 4.22793, 1, 0, 0, 1, 1,
0.489557, -0.6234061, 2.431582, 0, 0, 0, 1, 1,
0.4961218, -0.7928339, 3.078576, 0, 0, 0, 1, 1,
0.4979343, 2.065758, -0.5323589, 0, 0, 0, 1, 1,
0.5006737, 0.6010211, 0.1769237, 0, 0, 0, 1, 1,
0.5013635, 1.776334, 1.260086, 0, 0, 0, 1, 1,
0.5042559, -0.5100271, 1.968349, 0, 0, 0, 1, 1,
0.5074731, -0.1834492, 2.075814, 0, 0, 0, 1, 1,
0.5109597, -0.2901806, 1.602591, 1, 1, 1, 1, 1,
0.5139248, 2.604466, 2.347024, 1, 1, 1, 1, 1,
0.5281157, -0.1767866, 2.182819, 1, 1, 1, 1, 1,
0.5319269, 1.054975, 0.7329587, 1, 1, 1, 1, 1,
0.5363939, 0.07755352, 1.72654, 1, 1, 1, 1, 1,
0.5375506, 0.1879452, 2.765522, 1, 1, 1, 1, 1,
0.5382203, 0.120028, 0.4033136, 1, 1, 1, 1, 1,
0.5458199, 0.1660021, 0.1366369, 1, 1, 1, 1, 1,
0.54787, 0.0375297, 1.131387, 1, 1, 1, 1, 1,
0.5486585, 0.159632, 0.8248662, 1, 1, 1, 1, 1,
0.55259, 0.8283224, -1.306769, 1, 1, 1, 1, 1,
0.5540287, -0.08188695, 3.467226, 1, 1, 1, 1, 1,
0.5571837, -0.8768072, 4.165667, 1, 1, 1, 1, 1,
0.5592866, 0.08458122, 1.676688, 1, 1, 1, 1, 1,
0.5694521, -0.8726823, 3.210869, 1, 1, 1, 1, 1,
0.5695866, 0.8684878, 0.3431484, 0, 0, 1, 1, 1,
0.5718722, -0.5098401, 2.41571, 1, 0, 0, 1, 1,
0.5748685, -0.9039439, 1.633351, 1, 0, 0, 1, 1,
0.576002, 0.2265168, 0.3871242, 1, 0, 0, 1, 1,
0.5765008, -0.2706613, 1.273984, 1, 0, 0, 1, 1,
0.5766876, -0.01057956, 1.960591, 1, 0, 0, 1, 1,
0.5782416, -0.9497337, 4.562992, 0, 0, 0, 1, 1,
0.578564, 0.08317133, 2.332596, 0, 0, 0, 1, 1,
0.5821616, 0.8847436, 1.234597, 0, 0, 0, 1, 1,
0.5828237, -0.3544778, 2.442906, 0, 0, 0, 1, 1,
0.5896258, 1.366145, 1.7868, 0, 0, 0, 1, 1,
0.5985197, 0.1251628, 3.817272, 0, 0, 0, 1, 1,
0.6118022, -0.1882686, 2.406558, 0, 0, 0, 1, 1,
0.613534, 0.7146181, -0.2699426, 1, 1, 1, 1, 1,
0.6150086, 0.01807278, 2.549424, 1, 1, 1, 1, 1,
0.6162044, 1.34597, -0.07999433, 1, 1, 1, 1, 1,
0.6184919, -0.3445934, 2.158854, 1, 1, 1, 1, 1,
0.6251869, -0.4727448, 3.218535, 1, 1, 1, 1, 1,
0.6274989, -0.07943153, 1.623322, 1, 1, 1, 1, 1,
0.6305605, 0.4173901, 0.5337994, 1, 1, 1, 1, 1,
0.6315771, 0.6299042, 2.027764, 1, 1, 1, 1, 1,
0.6317908, 0.923152, -0.1803384, 1, 1, 1, 1, 1,
0.6370764, 0.5547612, -0.1465328, 1, 1, 1, 1, 1,
0.6430723, -0.4532672, -0.1966257, 1, 1, 1, 1, 1,
0.6461138, 1.531513, 0.5309506, 1, 1, 1, 1, 1,
0.6492264, -0.540875, 1.209353, 1, 1, 1, 1, 1,
0.6576754, 0.08398776, 1.253451, 1, 1, 1, 1, 1,
0.6612039, 0.2581746, 0.9235028, 1, 1, 1, 1, 1,
0.6628733, -0.6134667, 1.557924, 0, 0, 1, 1, 1,
0.6681712, -0.3039689, 1.763866, 1, 0, 0, 1, 1,
0.6817725, 0.4249319, 1.860976, 1, 0, 0, 1, 1,
0.6832666, 1.820196, -0.750268, 1, 0, 0, 1, 1,
0.6842798, 0.2425917, 1.221178, 1, 0, 0, 1, 1,
0.6891686, -0.155672, 1.513463, 1, 0, 0, 1, 1,
0.6944911, 1.331501, 1.292468, 0, 0, 0, 1, 1,
0.694942, -1.127404, 3.223008, 0, 0, 0, 1, 1,
0.7006207, 0.5259558, 1.325456, 0, 0, 0, 1, 1,
0.7091231, 1.250147, 2.745324, 0, 0, 0, 1, 1,
0.710408, -0.5927772, 0.01283569, 0, 0, 0, 1, 1,
0.7143481, -0.006547639, -0.4959119, 0, 0, 0, 1, 1,
0.7172286, -1.246676, 1.836017, 0, 0, 0, 1, 1,
0.7191243, 1.893128, 1.69673, 1, 1, 1, 1, 1,
0.7212922, 1.242576, -0.06448191, 1, 1, 1, 1, 1,
0.7253064, -0.1407647, 2.596049, 1, 1, 1, 1, 1,
0.7322381, -0.8048984, 2.229506, 1, 1, 1, 1, 1,
0.7375947, 1.043597, 0.2114891, 1, 1, 1, 1, 1,
0.7457806, 0.7163473, 0.9101111, 1, 1, 1, 1, 1,
0.7470485, -0.5096592, 3.147635, 1, 1, 1, 1, 1,
0.7501181, 0.6671948, 0.9926282, 1, 1, 1, 1, 1,
0.7504053, -1.792516, 2.058163, 1, 1, 1, 1, 1,
0.7536619, 2.375928, 0.553964, 1, 1, 1, 1, 1,
0.7548851, 0.6562, -0.5740228, 1, 1, 1, 1, 1,
0.757646, -1.017781, 1.389606, 1, 1, 1, 1, 1,
0.7577742, 2.398037, -0.01392241, 1, 1, 1, 1, 1,
0.7626262, 0.6881162, 1.588757, 1, 1, 1, 1, 1,
0.7717978, -0.0166103, -0.07992739, 1, 1, 1, 1, 1,
0.7720855, -0.4054931, 1.865645, 0, 0, 1, 1, 1,
0.7723183, -0.912043, 2.121653, 1, 0, 0, 1, 1,
0.7740493, -0.08573721, 0.5646305, 1, 0, 0, 1, 1,
0.781186, 1.382687, 0.9416766, 1, 0, 0, 1, 1,
0.7825812, -1.833768, 2.632143, 1, 0, 0, 1, 1,
0.7845183, 1.407126, 0.7979721, 1, 0, 0, 1, 1,
0.7908748, -1.371217, 0.5649837, 0, 0, 0, 1, 1,
0.8004862, 0.887363, 0.04458378, 0, 0, 0, 1, 1,
0.8051288, -0.110717, 1.932003, 0, 0, 0, 1, 1,
0.8118367, 0.6750513, 2.062552, 0, 0, 0, 1, 1,
0.8137243, 0.4102021, -0.7731829, 0, 0, 0, 1, 1,
0.823827, 1.386034, 1.175929, 0, 0, 0, 1, 1,
0.8242161, -1.882984, 2.611134, 0, 0, 0, 1, 1,
0.8242708, 0.4971295, 0.1610506, 1, 1, 1, 1, 1,
0.8246182, -0.1682003, 2.151255, 1, 1, 1, 1, 1,
0.8269194, -0.6746259, 3.309963, 1, 1, 1, 1, 1,
0.831965, -0.4873959, 2.790115, 1, 1, 1, 1, 1,
0.8327941, -0.4433002, 1.296984, 1, 1, 1, 1, 1,
0.835727, -0.7460052, 1.650185, 1, 1, 1, 1, 1,
0.8361405, -1.27388, 1.503527, 1, 1, 1, 1, 1,
0.8388437, 0.9917786, 1.720438, 1, 1, 1, 1, 1,
0.8391429, 1.181475, 0.9248208, 1, 1, 1, 1, 1,
0.8398311, 0.3055867, 1.073103, 1, 1, 1, 1, 1,
0.8411604, -0.8376655, 2.821962, 1, 1, 1, 1, 1,
0.8436503, 0.8958602, 2.428221, 1, 1, 1, 1, 1,
0.8458322, -1.053705, 1.700453, 1, 1, 1, 1, 1,
0.8465599, -0.4368037, 1.695707, 1, 1, 1, 1, 1,
0.848016, -0.3558795, 3.78497, 1, 1, 1, 1, 1,
0.8523738, 0.6503752, 0.2319018, 0, 0, 1, 1, 1,
0.85522, -0.7531022, 1.222561, 1, 0, 0, 1, 1,
0.8558368, -0.7365565, 2.379704, 1, 0, 0, 1, 1,
0.8584853, -1.822758, 1.773355, 1, 0, 0, 1, 1,
0.8600317, -0.1099808, 3.334047, 1, 0, 0, 1, 1,
0.8664436, 0.2604728, 0.5511577, 1, 0, 0, 1, 1,
0.8692001, 0.2970112, 1.101149, 0, 0, 0, 1, 1,
0.8744047, 1.740355, 1.938494, 0, 0, 0, 1, 1,
0.8808852, 0.5827297, 0.2857054, 0, 0, 0, 1, 1,
0.8818338, 0.8621148, 0.2750901, 0, 0, 0, 1, 1,
0.8828878, 0.1865978, 2.172275, 0, 0, 0, 1, 1,
0.8832635, 0.2956014, 0.360864, 0, 0, 0, 1, 1,
0.8838573, 0.1794563, -0.6478121, 0, 0, 0, 1, 1,
0.8878546, 1.940511, -1.390171, 1, 1, 1, 1, 1,
0.8894632, 1.427145, 0.7163097, 1, 1, 1, 1, 1,
0.8899474, -0.3652647, 3.347412, 1, 1, 1, 1, 1,
0.8915619, -0.5444037, 1.587393, 1, 1, 1, 1, 1,
0.8931226, -0.03998403, 0.8960465, 1, 1, 1, 1, 1,
0.8964608, 0.1533722, 0.6667269, 1, 1, 1, 1, 1,
0.8990297, -1.305982, 2.739338, 1, 1, 1, 1, 1,
0.8994482, -0.2518474, 0.1761564, 1, 1, 1, 1, 1,
0.9138799, 0.5692091, 1.446484, 1, 1, 1, 1, 1,
0.9169095, -1.106473, 0.3567266, 1, 1, 1, 1, 1,
0.9190834, 1.2428, 0.5472084, 1, 1, 1, 1, 1,
0.9202914, -0.712499, 3.217002, 1, 1, 1, 1, 1,
0.9228907, 0.222769, 0.9937468, 1, 1, 1, 1, 1,
0.9238772, 0.6707022, 1.599466, 1, 1, 1, 1, 1,
0.9307602, 0.04849713, 0.3591534, 1, 1, 1, 1, 1,
0.938354, -0.6384996, 3.729355, 0, 0, 1, 1, 1,
0.942547, 0.2958444, 2.668309, 1, 0, 0, 1, 1,
0.9466575, 0.3713228, 1.682146, 1, 0, 0, 1, 1,
0.9493394, -0.6832716, 2.661276, 1, 0, 0, 1, 1,
0.9511927, 0.1259593, 1.716996, 1, 0, 0, 1, 1,
0.9512854, 0.2157084, 0.8532388, 1, 0, 0, 1, 1,
0.9569606, -1.83968, 1.708523, 0, 0, 0, 1, 1,
0.9595755, -0.804774, 3.073629, 0, 0, 0, 1, 1,
0.9608973, 0.0404779, 1.647218, 0, 0, 0, 1, 1,
0.9644819, -0.7038855, 2.710146, 0, 0, 0, 1, 1,
0.9658124, 0.2652611, 0.4322491, 0, 0, 0, 1, 1,
0.9759539, 2.111913, 0.6910804, 0, 0, 0, 1, 1,
0.977053, -1.633312, 3.778973, 0, 0, 0, 1, 1,
0.9845307, 0.6165932, 0.4817258, 1, 1, 1, 1, 1,
0.9889635, 1.264108, 0.4236017, 1, 1, 1, 1, 1,
0.9900853, 0.7191737, 1.232613, 1, 1, 1, 1, 1,
0.9960329, -0.8750527, 4.160062, 1, 1, 1, 1, 1,
0.9973204, -0.5363588, -0.07773978, 1, 1, 1, 1, 1,
1.000201, 0.8763847, 1.191414, 1, 1, 1, 1, 1,
1.007544, 0.1484244, 1.008137, 1, 1, 1, 1, 1,
1.011665, -0.711294, 3.73727, 1, 1, 1, 1, 1,
1.014127, -0.7801784, 1.894325, 1, 1, 1, 1, 1,
1.02113, 0.7794468, 0.5744732, 1, 1, 1, 1, 1,
1.023842, -0.5738974, 2.347113, 1, 1, 1, 1, 1,
1.029168, 1.809678, 0.9600821, 1, 1, 1, 1, 1,
1.036309, -0.1579871, 2.245557, 1, 1, 1, 1, 1,
1.042763, -0.1715694, 2.16103, 1, 1, 1, 1, 1,
1.045596, -0.7871074, 0.6777411, 1, 1, 1, 1, 1,
1.04593, 0.9149209, 1.20412, 0, 0, 1, 1, 1,
1.061072, -1.120117, 2.463038, 1, 0, 0, 1, 1,
1.062271, 0.977742, 0.2658925, 1, 0, 0, 1, 1,
1.064481, 0.1664344, 2.253036, 1, 0, 0, 1, 1,
1.064602, 0.7599934, 1.821358, 1, 0, 0, 1, 1,
1.069612, -0.4698742, 3.453008, 1, 0, 0, 1, 1,
1.085971, 0.3210081, 1.443299, 0, 0, 0, 1, 1,
1.089305, 0.5529623, 0.4895214, 0, 0, 0, 1, 1,
1.092706, -0.806851, 1.99477, 0, 0, 0, 1, 1,
1.102214, -0.3477979, 1.855989, 0, 0, 0, 1, 1,
1.104247, -1.20604, 1.420887, 0, 0, 0, 1, 1,
1.106644, -0.8644062, 0.588388, 0, 0, 0, 1, 1,
1.108981, 0.4884488, 1.792332, 0, 0, 0, 1, 1,
1.111227, -0.4677746, 2.339303, 1, 1, 1, 1, 1,
1.115954, 0.3550708, 1.028375, 1, 1, 1, 1, 1,
1.116328, -0.4518932, 0.9658928, 1, 1, 1, 1, 1,
1.119495, -0.08826566, 0.1797738, 1, 1, 1, 1, 1,
1.12179, -0.05298156, 2.005452, 1, 1, 1, 1, 1,
1.122796, -1.785478, 2.276956, 1, 1, 1, 1, 1,
1.124183, 1.296348, 1.316879, 1, 1, 1, 1, 1,
1.1245, -0.5226978, 2.591485, 1, 1, 1, 1, 1,
1.13237, -1.169764, 1.759716, 1, 1, 1, 1, 1,
1.133574, 1.263793, 0.391507, 1, 1, 1, 1, 1,
1.135729, 0.1606797, 1.3066, 1, 1, 1, 1, 1,
1.136058, 0.7949623, 1.896359, 1, 1, 1, 1, 1,
1.143402, 0.6179307, 1.154435, 1, 1, 1, 1, 1,
1.146118, 1.38238, 0.5439403, 1, 1, 1, 1, 1,
1.151833, 0.2781788, 0.7971923, 1, 1, 1, 1, 1,
1.151998, -0.5118625, 2.908544, 0, 0, 1, 1, 1,
1.157288, -0.9883106, 1.335395, 1, 0, 0, 1, 1,
1.158043, -0.7543443, 1.949445, 1, 0, 0, 1, 1,
1.165536, 0.7047018, 0.6871838, 1, 0, 0, 1, 1,
1.176227, 0.02087487, 1.059011, 1, 0, 0, 1, 1,
1.176335, 1.093485, 0.4040481, 1, 0, 0, 1, 1,
1.178593, -0.2099671, 3.822081, 0, 0, 0, 1, 1,
1.178891, -1.216722, 1.005367, 0, 0, 0, 1, 1,
1.18277, 1.423999, 0.2605786, 0, 0, 0, 1, 1,
1.197538, -0.9346802, 1.92551, 0, 0, 0, 1, 1,
1.201487, -0.1369336, 2.767082, 0, 0, 0, 1, 1,
1.205011, -0.3914812, 0.09868112, 0, 0, 0, 1, 1,
1.205439, 0.1994703, 1.695753, 0, 0, 0, 1, 1,
1.213138, -1.35466, 0.9942786, 1, 1, 1, 1, 1,
1.214051, -0.3222114, 2.713, 1, 1, 1, 1, 1,
1.21599, -0.6465148, 1.055962, 1, 1, 1, 1, 1,
1.223619, 0.5106106, 2.115609, 1, 1, 1, 1, 1,
1.227897, -0.5789862, 2.223041, 1, 1, 1, 1, 1,
1.230844, -0.2202492, 1.495607, 1, 1, 1, 1, 1,
1.233193, 0.9933958, 1.680546, 1, 1, 1, 1, 1,
1.236453, 0.943637, 0.05782841, 1, 1, 1, 1, 1,
1.24525, -1.418138, 1.916552, 1, 1, 1, 1, 1,
1.252237, -0.8619563, 1.849034, 1, 1, 1, 1, 1,
1.257083, -0.03491071, 2.713403, 1, 1, 1, 1, 1,
1.270565, -1.02084, 2.906571, 1, 1, 1, 1, 1,
1.276628, -0.6859593, 3.17692, 1, 1, 1, 1, 1,
1.289799, 0.6491662, -0.2800186, 1, 1, 1, 1, 1,
1.295887, 1.152553, -0.283318, 1, 1, 1, 1, 1,
1.30796, -0.725781, 1.320469, 0, 0, 1, 1, 1,
1.308844, 1.114101, 0.05343291, 1, 0, 0, 1, 1,
1.319109, -1.002749, 2.323601, 1, 0, 0, 1, 1,
1.321652, 0.3001547, 2.563566, 1, 0, 0, 1, 1,
1.326228, -1.363709, 2.667738, 1, 0, 0, 1, 1,
1.34532, -0.4145399, 1.607314, 1, 0, 0, 1, 1,
1.380983, 1.620124, 1.057485, 0, 0, 0, 1, 1,
1.381188, -0.5186037, 2.606372, 0, 0, 0, 1, 1,
1.383298, -3.113179, 3.385673, 0, 0, 0, 1, 1,
1.403291, 1.644095, 1.315369, 0, 0, 0, 1, 1,
1.406159, -0.4919776, 1.629094, 0, 0, 0, 1, 1,
1.410751, -0.0527763, 1.748405, 0, 0, 0, 1, 1,
1.412949, 1.213488, -0.6319658, 0, 0, 0, 1, 1,
1.418394, -1.367947, 3.385415, 1, 1, 1, 1, 1,
1.424584, 2.278259, -0.3534728, 1, 1, 1, 1, 1,
1.42594, 0.5810593, 2.103948, 1, 1, 1, 1, 1,
1.429712, 0.8895455, 0.9456249, 1, 1, 1, 1, 1,
1.454101, -1.191512, 2.662738, 1, 1, 1, 1, 1,
1.455119, 0.05049399, 1.286109, 1, 1, 1, 1, 1,
1.463277, 0.2391381, 3.010768, 1, 1, 1, 1, 1,
1.465502, 1.058525, 0.5562736, 1, 1, 1, 1, 1,
1.470697, 0.6885654, 0.306702, 1, 1, 1, 1, 1,
1.48634, -2.039537, 1.094798, 1, 1, 1, 1, 1,
1.507457, 1.306532, -1.222706, 1, 1, 1, 1, 1,
1.514795, -0.1702151, 1.989609, 1, 1, 1, 1, 1,
1.520292, -0.04050912, 2.116005, 1, 1, 1, 1, 1,
1.52341, -0.7747754, 2.017512, 1, 1, 1, 1, 1,
1.527723, -0.1579363, 1.732002, 1, 1, 1, 1, 1,
1.535661, 1.210965, -0.0832925, 0, 0, 1, 1, 1,
1.537557, -0.7608572, 1.356879, 1, 0, 0, 1, 1,
1.5649, -0.2687548, 0.05456017, 1, 0, 0, 1, 1,
1.574036, 1.846756, 1.101802, 1, 0, 0, 1, 1,
1.575162, 1.318825, 0.3149208, 1, 0, 0, 1, 1,
1.593565, -1.5403, 3.252986, 1, 0, 0, 1, 1,
1.598275, -0.0491375, 2.286268, 0, 0, 0, 1, 1,
1.599049, 0.5550599, 1.653875, 0, 0, 0, 1, 1,
1.599815, 0.1294839, 0.2431225, 0, 0, 0, 1, 1,
1.616353, 0.456362, 0.7547283, 0, 0, 0, 1, 1,
1.630295, -0.4238915, 0.4752219, 0, 0, 0, 1, 1,
1.632083, -0.5716884, 2.363883, 0, 0, 0, 1, 1,
1.636681, 2.032575, 0.1322748, 0, 0, 0, 1, 1,
1.658278, -1.050332, 0.9950871, 1, 1, 1, 1, 1,
1.679494, 2.004278, 0.4170071, 1, 1, 1, 1, 1,
1.682539, 1.388645, 0.4309228, 1, 1, 1, 1, 1,
1.699671, 0.1543, -0.3477786, 1, 1, 1, 1, 1,
1.709771, -0.4452363, 1.681116, 1, 1, 1, 1, 1,
1.711902, -0.2527498, 3.768698, 1, 1, 1, 1, 1,
1.728737, 1.49546, 2.838856, 1, 1, 1, 1, 1,
1.740711, -0.01465984, 2.718106, 1, 1, 1, 1, 1,
1.754551, 0.7103038, 1.835353, 1, 1, 1, 1, 1,
1.800093, 0.4359391, 2.360441, 1, 1, 1, 1, 1,
1.828048, 0.8730537, 1.860739, 1, 1, 1, 1, 1,
1.835438, 1.804295, 0.8783146, 1, 1, 1, 1, 1,
1.860909, 0.2627086, 0.1275338, 1, 1, 1, 1, 1,
1.890606, 0.3039074, 0.9894705, 1, 1, 1, 1, 1,
1.89198, -0.5150818, 3.361482, 1, 1, 1, 1, 1,
1.894384, -0.4126753, 2.245488, 0, 0, 1, 1, 1,
1.902594, -0.1844215, -0.4708809, 1, 0, 0, 1, 1,
1.90878, -0.3623296, 3.169438, 1, 0, 0, 1, 1,
1.970952, -0.1410007, 1.434973, 1, 0, 0, 1, 1,
2.023544, 0.6840801, 1.118409, 1, 0, 0, 1, 1,
2.08251, 0.3508317, 2.41266, 1, 0, 0, 1, 1,
2.09987, -1.034984, 1.77747, 0, 0, 0, 1, 1,
2.102359, -0.7752368, 1.020586, 0, 0, 0, 1, 1,
2.1371, 1.265161, 0.5568277, 0, 0, 0, 1, 1,
2.183482, 0.5365825, 2.649447, 0, 0, 0, 1, 1,
2.195437, -1.456565, 1.130791, 0, 0, 0, 1, 1,
2.217054, 1.040303, -0.1185844, 0, 0, 0, 1, 1,
2.230057, -0.7211943, 2.540294, 0, 0, 0, 1, 1,
2.233748, 3.293591, -0.7530752, 1, 1, 1, 1, 1,
2.286144, 1.252855, 2.217487, 1, 1, 1, 1, 1,
2.324598, 0.3146027, 2.062875, 1, 1, 1, 1, 1,
2.547904, -1.209697, 3.240495, 1, 1, 1, 1, 1,
2.685335, 0.7807921, 2.026312, 1, 1, 1, 1, 1,
2.842483, 0.9394183, 1.809898, 1, 1, 1, 1, 1,
3.663762, -0.1098597, 0.7587692, 1, 1, 1, 1, 1
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
var radius = 9.932118;
var distance = 34.88615;
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
mvMatrix.translate( -0.1427283, 0.2476592, 0.526047 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.88615);
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
