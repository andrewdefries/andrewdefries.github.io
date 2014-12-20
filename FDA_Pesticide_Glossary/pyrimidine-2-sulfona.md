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
-2.759445, -1.297287, -2.169767, 1, 0, 0, 1,
-2.743449, 0.4511484, -1.273752, 1, 0.007843138, 0, 1,
-2.707215, -0.0003986278, -1.485179, 1, 0.01176471, 0, 1,
-2.653344, -1.347904, -3.418394, 1, 0.01960784, 0, 1,
-2.596264, 0.9761801, -2.002949, 1, 0.02352941, 0, 1,
-2.557678, 0.7474353, -0.0855332, 1, 0.03137255, 0, 1,
-2.543948, -0.8708753, -3.613594, 1, 0.03529412, 0, 1,
-2.516931, 1.108536, 0.4461175, 1, 0.04313726, 0, 1,
-2.486464, -0.0881008, -0.5142435, 1, 0.04705882, 0, 1,
-2.426891, -1.783508, -2.101739, 1, 0.05490196, 0, 1,
-2.412233, -0.0385931, -1.011349, 1, 0.05882353, 0, 1,
-2.370553, -0.7901392, -2.884887, 1, 0.06666667, 0, 1,
-2.35863, -1.150734, -1.414451, 1, 0.07058824, 0, 1,
-2.258207, -1.466272, -2.003597, 1, 0.07843138, 0, 1,
-2.252484, -0.1247212, -0.9081849, 1, 0.08235294, 0, 1,
-2.246545, -0.2971706, -2.550364, 1, 0.09019608, 0, 1,
-2.238907, -2.116004, -2.172014, 1, 0.09411765, 0, 1,
-2.226964, -0.3935511, -1.481348, 1, 0.1019608, 0, 1,
-2.216295, -0.6138631, -3.370766, 1, 0.1098039, 0, 1,
-2.208716, 0.3724806, -2.045988, 1, 0.1137255, 0, 1,
-2.147407, -1.585125, -2.589333, 1, 0.1215686, 0, 1,
-2.146102, -0.754102, 0.4582495, 1, 0.1254902, 0, 1,
-2.132227, -0.06574962, -1.438306, 1, 0.1333333, 0, 1,
-2.129712, -0.6141995, -1.807964, 1, 0.1372549, 0, 1,
-2.119773, 0.1794486, -1.30707, 1, 0.145098, 0, 1,
-2.101867, -1.512738, -1.05632, 1, 0.1490196, 0, 1,
-2.092101, 1.997205, 0.7009267, 1, 0.1568628, 0, 1,
-2.083794, -1.539445, -1.608002, 1, 0.1607843, 0, 1,
-2.039685, 0.04529228, -0.5910673, 1, 0.1686275, 0, 1,
-2.039651, 0.5114935, -1.29595, 1, 0.172549, 0, 1,
-2.028244, -0.2080434, -0.6370842, 1, 0.1803922, 0, 1,
-2.015729, 1.07196, -2.801513, 1, 0.1843137, 0, 1,
-2.013211, -1.291654, -2.792747, 1, 0.1921569, 0, 1,
-2.008466, -0.6797624, -2.033147, 1, 0.1960784, 0, 1,
-1.983161, -0.6977808, -0.4524648, 1, 0.2039216, 0, 1,
-1.966869, 0.9714754, 2.135523, 1, 0.2117647, 0, 1,
-1.965629, -1.641952, -3.847908, 1, 0.2156863, 0, 1,
-1.943784, -0.2297922, -3.5587, 1, 0.2235294, 0, 1,
-1.938259, -0.5147247, 0.5311256, 1, 0.227451, 0, 1,
-1.920357, -0.8048382, -2.122339, 1, 0.2352941, 0, 1,
-1.915105, -1.122526, -1.799602, 1, 0.2392157, 0, 1,
-1.909017, 1.460061, 1.222646, 1, 0.2470588, 0, 1,
-1.883826, -0.4533275, -1.815089, 1, 0.2509804, 0, 1,
-1.88075, 0.2818206, -1.633726, 1, 0.2588235, 0, 1,
-1.864576, -0.3330046, -3.119885, 1, 0.2627451, 0, 1,
-1.857738, -2.001549, -1.743746, 1, 0.2705882, 0, 1,
-1.856785, -1.251732, -3.034139, 1, 0.2745098, 0, 1,
-1.852122, -0.2087382, -0.6330509, 1, 0.282353, 0, 1,
-1.823588, 1.055451, -0.2378718, 1, 0.2862745, 0, 1,
-1.801845, -0.3612759, -2.649356, 1, 0.2941177, 0, 1,
-1.791676, 1.36245, -0.217482, 1, 0.3019608, 0, 1,
-1.785504, 0.3564649, -0.6613283, 1, 0.3058824, 0, 1,
-1.771742, 0.5570171, -1.046305, 1, 0.3137255, 0, 1,
-1.767426, -0.634162, -1.904002, 1, 0.3176471, 0, 1,
-1.753639, -1.51468, -1.597856, 1, 0.3254902, 0, 1,
-1.74918, 0.2453151, -0.484182, 1, 0.3294118, 0, 1,
-1.734453, -1.375851, -1.798413, 1, 0.3372549, 0, 1,
-1.724722, 0.757989, -0.1979161, 1, 0.3411765, 0, 1,
-1.722734, 0.3300395, -1.163425, 1, 0.3490196, 0, 1,
-1.71717, 0.4913423, -1.633453, 1, 0.3529412, 0, 1,
-1.690996, 0.8727136, -1.635811, 1, 0.3607843, 0, 1,
-1.68765, -0.5706932, -3.475495, 1, 0.3647059, 0, 1,
-1.654002, -0.7490755, -1.07401, 1, 0.372549, 0, 1,
-1.645937, 0.6364897, 0.2066412, 1, 0.3764706, 0, 1,
-1.640898, -1.107751, -1.768514, 1, 0.3843137, 0, 1,
-1.578535, 0.03972954, -1.432469, 1, 0.3882353, 0, 1,
-1.571602, 0.7154871, -1.170292, 1, 0.3960784, 0, 1,
-1.561933, 0.01138288, -2.011481, 1, 0.4039216, 0, 1,
-1.560234, 0.442842, -0.8960143, 1, 0.4078431, 0, 1,
-1.553664, 0.5362167, -0.460103, 1, 0.4156863, 0, 1,
-1.54489, 1.250815, -0.1051493, 1, 0.4196078, 0, 1,
-1.544716, -0.3400635, -2.452161, 1, 0.427451, 0, 1,
-1.535451, -0.08676822, -1.400865, 1, 0.4313726, 0, 1,
-1.522773, 0.07464239, -0.2088278, 1, 0.4392157, 0, 1,
-1.505627, -0.004737612, -2.082972, 1, 0.4431373, 0, 1,
-1.483602, 0.3685028, -0.4121071, 1, 0.4509804, 0, 1,
-1.481247, -1.603172, -3.320126, 1, 0.454902, 0, 1,
-1.469416, 0.9910642, 0.8089947, 1, 0.4627451, 0, 1,
-1.465415, -1.323756, -2.491305, 1, 0.4666667, 0, 1,
-1.461254, -0.3775046, -0.8576127, 1, 0.4745098, 0, 1,
-1.457989, 0.07316828, -2.777352, 1, 0.4784314, 0, 1,
-1.432764, 0.6187841, -2.344475, 1, 0.4862745, 0, 1,
-1.429313, 0.6863555, -1.322619, 1, 0.4901961, 0, 1,
-1.424571, 1.197256, -2.619673, 1, 0.4980392, 0, 1,
-1.420603, -0.7085265, -3.170891, 1, 0.5058824, 0, 1,
-1.40936, 0.7464006, -2.577427, 1, 0.509804, 0, 1,
-1.400763, -2.731413, -2.33531, 1, 0.5176471, 0, 1,
-1.398906, -0.7371865, -1.308887, 1, 0.5215687, 0, 1,
-1.395495, 1.584567, -0.7085048, 1, 0.5294118, 0, 1,
-1.384228, 0.8860725, -0.01771799, 1, 0.5333334, 0, 1,
-1.380205, -0.7256275, -1.350851, 1, 0.5411765, 0, 1,
-1.372855, 0.3941587, -0.07726626, 1, 0.5450981, 0, 1,
-1.366195, -0.02492832, -1.243398, 1, 0.5529412, 0, 1,
-1.361654, -1.1556, -1.614685, 1, 0.5568628, 0, 1,
-1.358372, 1.028724, -0.221453, 1, 0.5647059, 0, 1,
-1.354781, -0.1571911, -3.651234, 1, 0.5686275, 0, 1,
-1.346277, 0.4447765, 0.6536243, 1, 0.5764706, 0, 1,
-1.343806, 0.6947591, -1.564174, 1, 0.5803922, 0, 1,
-1.343168, -0.8399042, -2.107555, 1, 0.5882353, 0, 1,
-1.342329, -1.215177, -2.69214, 1, 0.5921569, 0, 1,
-1.327174, -0.498786, -0.2577442, 1, 0.6, 0, 1,
-1.321817, -0.07165398, -1.395959, 1, 0.6078432, 0, 1,
-1.321245, 0.6554205, -1.687283, 1, 0.6117647, 0, 1,
-1.314595, -1.467018, -4.053824, 1, 0.6196079, 0, 1,
-1.307725, 1.962224, -2.014176, 1, 0.6235294, 0, 1,
-1.305226, 1.345221, -2.684364, 1, 0.6313726, 0, 1,
-1.301443, -0.7969658, -1.953293, 1, 0.6352941, 0, 1,
-1.300334, 0.9072901, -0.242774, 1, 0.6431373, 0, 1,
-1.298041, -0.820334, -2.729284, 1, 0.6470588, 0, 1,
-1.297432, 1.398769, -1.949972, 1, 0.654902, 0, 1,
-1.296961, -0.109004, -0.6316966, 1, 0.6588235, 0, 1,
-1.293953, 0.1769575, -1.924898, 1, 0.6666667, 0, 1,
-1.291344, -0.7390891, -0.8484557, 1, 0.6705883, 0, 1,
-1.286933, -0.02703543, -2.027228, 1, 0.6784314, 0, 1,
-1.284844, 0.1281549, -0.4965416, 1, 0.682353, 0, 1,
-1.272337, 0.01931512, -2.903239, 1, 0.6901961, 0, 1,
-1.270371, -0.3181079, 0.08465669, 1, 0.6941177, 0, 1,
-1.258851, 0.02510797, -1.179943, 1, 0.7019608, 0, 1,
-1.248003, -1.39839, -2.96376, 1, 0.7098039, 0, 1,
-1.247556, 0.4213577, -0.9660816, 1, 0.7137255, 0, 1,
-1.240204, 0.5969778, -0.7076128, 1, 0.7215686, 0, 1,
-1.22348, 0.3423463, -1.045406, 1, 0.7254902, 0, 1,
-1.210321, 0.07958224, -2.191622, 1, 0.7333333, 0, 1,
-1.194775, 1.099844, -0.1630133, 1, 0.7372549, 0, 1,
-1.193709, -0.511807, -3.211923, 1, 0.7450981, 0, 1,
-1.176035, 1.124428, -2.09064, 1, 0.7490196, 0, 1,
-1.173444, -0.960669, -2.728223, 1, 0.7568628, 0, 1,
-1.171401, 0.2502689, -0.1029275, 1, 0.7607843, 0, 1,
-1.170076, 0.05179132, -2.414561, 1, 0.7686275, 0, 1,
-1.16956, -2.145144, -2.092329, 1, 0.772549, 0, 1,
-1.168789, 0.3660837, -0.7676207, 1, 0.7803922, 0, 1,
-1.163792, 0.9464543, 2.139282, 1, 0.7843137, 0, 1,
-1.162776, -0.9686824, -1.061315, 1, 0.7921569, 0, 1,
-1.156959, 0.6445487, 0.8588526, 1, 0.7960784, 0, 1,
-1.148536, -0.4778311, -1.793851, 1, 0.8039216, 0, 1,
-1.145894, -1.883302, -0.7765955, 1, 0.8117647, 0, 1,
-1.127285, -0.6340055, -2.096667, 1, 0.8156863, 0, 1,
-1.124475, -1.051782, -2.125558, 1, 0.8235294, 0, 1,
-1.123481, -1.084086, -3.658022, 1, 0.827451, 0, 1,
-1.111746, 1.552223, -1.016487, 1, 0.8352941, 0, 1,
-1.105758, -0.7284544, -1.147721, 1, 0.8392157, 0, 1,
-1.101462, -0.05081904, -1.052288, 1, 0.8470588, 0, 1,
-1.096298, 1.816266, -0.8862952, 1, 0.8509804, 0, 1,
-1.093927, -0.2908611, -1.311361, 1, 0.8588235, 0, 1,
-1.091842, -0.5942472, -1.358365, 1, 0.8627451, 0, 1,
-1.088042, 0.2773604, -2.538216, 1, 0.8705882, 0, 1,
-1.079569, -2.445203, -3.530495, 1, 0.8745098, 0, 1,
-1.070976, -0.04816823, -3.292625, 1, 0.8823529, 0, 1,
-1.066632, -0.5971401, -1.377219, 1, 0.8862745, 0, 1,
-1.057336, -1.08481, -1.941302, 1, 0.8941177, 0, 1,
-1.056703, 0.6567138, -0.5798175, 1, 0.8980392, 0, 1,
-1.047685, 1.037735, -0.8046314, 1, 0.9058824, 0, 1,
-1.046615, -0.6387413, -1.035374, 1, 0.9137255, 0, 1,
-1.041696, -0.5762768, -2.592353, 1, 0.9176471, 0, 1,
-1.036083, 0.2654792, 0.07151706, 1, 0.9254902, 0, 1,
-1.034371, -0.6637585, -0.8000697, 1, 0.9294118, 0, 1,
-1.034138, -0.207922, -1.755856, 1, 0.9372549, 0, 1,
-1.031689, -0.08495735, -2.489055, 1, 0.9411765, 0, 1,
-1.031049, 1.994969, -0.6473356, 1, 0.9490196, 0, 1,
-1.030705, -0.2807797, -2.104702, 1, 0.9529412, 0, 1,
-1.027142, -0.4291362, -3.657043, 1, 0.9607843, 0, 1,
-1.026689, 1.1016, -0.8508603, 1, 0.9647059, 0, 1,
-1.02367, -0.6019335, -2.191117, 1, 0.972549, 0, 1,
-1.019349, -1.059806, -2.123729, 1, 0.9764706, 0, 1,
-1.011663, 2.83325, -0.4819059, 1, 0.9843137, 0, 1,
-1.011049, 0.5024384, -0.1680583, 1, 0.9882353, 0, 1,
-1.007389, -0.06470408, -2.005231, 1, 0.9960784, 0, 1,
-1.004626, -1.155118, -2.426106, 0.9960784, 1, 0, 1,
-1.002481, 0.8511469, -1.042453, 0.9921569, 1, 0, 1,
-0.9965726, -0.8896446, -4.520519, 0.9843137, 1, 0, 1,
-0.992917, -2.425865, -3.738325, 0.9803922, 1, 0, 1,
-0.9855185, 0.2465156, -3.419714, 0.972549, 1, 0, 1,
-0.9843157, -0.640235, -2.042682, 0.9686275, 1, 0, 1,
-0.9839164, -1.306295, -2.716391, 0.9607843, 1, 0, 1,
-0.9823676, -0.1394025, -2.498503, 0.9568627, 1, 0, 1,
-0.9789677, -0.1873741, -0.1616368, 0.9490196, 1, 0, 1,
-0.9653835, -0.3894665, -3.051804, 0.945098, 1, 0, 1,
-0.963642, 0.7287387, -0.3768057, 0.9372549, 1, 0, 1,
-0.9633935, 1.624045, -0.2843799, 0.9333333, 1, 0, 1,
-0.9545921, 0.2482631, -2.73368, 0.9254902, 1, 0, 1,
-0.9533252, -0.443092, -1.126513, 0.9215686, 1, 0, 1,
-0.9523398, -1.458538, -3.047599, 0.9137255, 1, 0, 1,
-0.9482769, 0.5271879, -0.6385848, 0.9098039, 1, 0, 1,
-0.9479616, -0.3525844, -2.912097, 0.9019608, 1, 0, 1,
-0.9432944, 1.028813, -1.789608, 0.8941177, 1, 0, 1,
-0.9238483, -0.05534579, -1.10076, 0.8901961, 1, 0, 1,
-0.9237735, -0.6523998, -2.102558, 0.8823529, 1, 0, 1,
-0.9211952, -0.6519018, -1.947603, 0.8784314, 1, 0, 1,
-0.9135581, 0.7214372, -0.4647302, 0.8705882, 1, 0, 1,
-0.9122183, -0.915158, -2.19328, 0.8666667, 1, 0, 1,
-0.9111871, 1.88443, -0.9328439, 0.8588235, 1, 0, 1,
-0.905939, -0.5447787, -1.547056, 0.854902, 1, 0, 1,
-0.9046295, 1.128764, -1.915307, 0.8470588, 1, 0, 1,
-0.9044559, 0.05556719, -0.5961512, 0.8431373, 1, 0, 1,
-0.8996933, 1.538512, -0.7580584, 0.8352941, 1, 0, 1,
-0.899442, 0.6495692, -1.122268, 0.8313726, 1, 0, 1,
-0.8973937, 0.2335236, -0.3014971, 0.8235294, 1, 0, 1,
-0.8967582, -0.4560378, -0.6749433, 0.8196079, 1, 0, 1,
-0.8965014, 1.49289, 0.2341169, 0.8117647, 1, 0, 1,
-0.8956927, 1.671225, 0.5229567, 0.8078431, 1, 0, 1,
-0.8920828, -0.4712977, -1.398679, 0.8, 1, 0, 1,
-0.8914374, -0.7680256, -2.087383, 0.7921569, 1, 0, 1,
-0.8906672, -1.993017, -3.202595, 0.7882353, 1, 0, 1,
-0.8802754, -1.111143, -3.184737, 0.7803922, 1, 0, 1,
-0.8798333, 1.631148, 0.1702553, 0.7764706, 1, 0, 1,
-0.8785545, 1.557555, 0.35803, 0.7686275, 1, 0, 1,
-0.8756062, 1.878519, -2.245395, 0.7647059, 1, 0, 1,
-0.8573305, -0.224935, -1.338435, 0.7568628, 1, 0, 1,
-0.852111, -0.7425481, -4.295518, 0.7529412, 1, 0, 1,
-0.8491554, -0.1278368, -2.304207, 0.7450981, 1, 0, 1,
-0.8416009, 1.537099, -2.38459, 0.7411765, 1, 0, 1,
-0.8362503, 1.196572, -0.190796, 0.7333333, 1, 0, 1,
-0.8239287, 0.2420293, 1.173767, 0.7294118, 1, 0, 1,
-0.8197288, -1.839511, -2.912396, 0.7215686, 1, 0, 1,
-0.8193329, -0.1082711, -1.976452, 0.7176471, 1, 0, 1,
-0.8180372, 0.3176991, -1.503794, 0.7098039, 1, 0, 1,
-0.8145843, -1.068774, -2.400256, 0.7058824, 1, 0, 1,
-0.8123268, -1.507796, -2.311359, 0.6980392, 1, 0, 1,
-0.8116989, 0.4897207, -1.345193, 0.6901961, 1, 0, 1,
-0.8071879, -2.020073, -2.71697, 0.6862745, 1, 0, 1,
-0.8053527, 0.2220331, -2.005865, 0.6784314, 1, 0, 1,
-0.7971984, 1.695796, 0.013114, 0.6745098, 1, 0, 1,
-0.7959735, -0.5118734, -2.309659, 0.6666667, 1, 0, 1,
-0.7949349, -0.3592665, -0.9248155, 0.6627451, 1, 0, 1,
-0.7889714, -1.889652, -3.601165, 0.654902, 1, 0, 1,
-0.7703363, -0.8936962, -1.776967, 0.6509804, 1, 0, 1,
-0.768423, -0.898869, -3.048544, 0.6431373, 1, 0, 1,
-0.7678623, -0.500311, -2.657423, 0.6392157, 1, 0, 1,
-0.7675031, 0.6039966, -0.569623, 0.6313726, 1, 0, 1,
-0.7542347, -0.6822371, -3.761326, 0.627451, 1, 0, 1,
-0.7541087, 0.7269056, 0.5387051, 0.6196079, 1, 0, 1,
-0.7530615, 0.8603734, -0.5267954, 0.6156863, 1, 0, 1,
-0.7519382, 0.05509564, -0.3608576, 0.6078432, 1, 0, 1,
-0.7491441, 0.8166631, -1.001569, 0.6039216, 1, 0, 1,
-0.7477207, 0.1874523, -0.7280158, 0.5960785, 1, 0, 1,
-0.7469651, 0.6057057, -0.06415316, 0.5882353, 1, 0, 1,
-0.7439095, 0.9524621, -1.372334, 0.5843138, 1, 0, 1,
-0.743614, -0.8109033, -0.6756509, 0.5764706, 1, 0, 1,
-0.7430072, -1.196483, -2.671996, 0.572549, 1, 0, 1,
-0.7413211, -0.5154245, -1.845123, 0.5647059, 1, 0, 1,
-0.7355576, 0.3748838, -1.272504, 0.5607843, 1, 0, 1,
-0.7348066, -1.074034, -2.300626, 0.5529412, 1, 0, 1,
-0.7337675, 0.1968089, -0.2113014, 0.5490196, 1, 0, 1,
-0.7322822, 0.009728381, -3.167547, 0.5411765, 1, 0, 1,
-0.7278602, -1.144055, -3.277502, 0.5372549, 1, 0, 1,
-0.7254099, 0.9599822, -1.04847, 0.5294118, 1, 0, 1,
-0.7242851, -2.273724, -3.695092, 0.5254902, 1, 0, 1,
-0.7236397, -0.3468421, -1.647604, 0.5176471, 1, 0, 1,
-0.7194694, -0.6168864, -1.717211, 0.5137255, 1, 0, 1,
-0.7152316, 0.8593174, -1.95311, 0.5058824, 1, 0, 1,
-0.7151948, -0.4899104, -3.539592, 0.5019608, 1, 0, 1,
-0.7151061, 0.03232355, -1.479802, 0.4941176, 1, 0, 1,
-0.7136159, -1.547777, -1.55062, 0.4862745, 1, 0, 1,
-0.7111151, -0.2811635, 0.1433186, 0.4823529, 1, 0, 1,
-0.7095297, 0.4843139, -2.484796, 0.4745098, 1, 0, 1,
-0.7063012, -0.2319257, -2.91753, 0.4705882, 1, 0, 1,
-0.7019172, -1.666208, -3.357213, 0.4627451, 1, 0, 1,
-0.7015609, -0.4644459, -2.602732, 0.4588235, 1, 0, 1,
-0.7001829, 0.4357898, 1.567643, 0.4509804, 1, 0, 1,
-0.6982204, 0.8286172, -1.375436, 0.4470588, 1, 0, 1,
-0.6949856, 0.1632511, 1.302363, 0.4392157, 1, 0, 1,
-0.6884181, -0.239417, -2.830712, 0.4352941, 1, 0, 1,
-0.6832888, -0.2963434, -2.368535, 0.427451, 1, 0, 1,
-0.6814005, 0.2556891, -2.085894, 0.4235294, 1, 0, 1,
-0.6805444, 0.2847188, -2.294324, 0.4156863, 1, 0, 1,
-0.6801101, 0.02675382, -3.261101, 0.4117647, 1, 0, 1,
-0.6777394, -0.4814675, -2.910278, 0.4039216, 1, 0, 1,
-0.6737046, -0.1298023, -1.105732, 0.3960784, 1, 0, 1,
-0.6652613, 0.06330854, -1.528828, 0.3921569, 1, 0, 1,
-0.6646351, 0.1932219, -0.7248782, 0.3843137, 1, 0, 1,
-0.6612844, 0.7180641, -0.3704693, 0.3803922, 1, 0, 1,
-0.6538635, 0.2430513, -0.2521969, 0.372549, 1, 0, 1,
-0.6518039, -1.142772, -3.319663, 0.3686275, 1, 0, 1,
-0.6337214, 0.9801859, -0.3607997, 0.3607843, 1, 0, 1,
-0.63148, 0.4794614, -1.4721, 0.3568628, 1, 0, 1,
-0.6312463, 0.5004658, -1.715365, 0.3490196, 1, 0, 1,
-0.6310034, -0.3154937, -1.156851, 0.345098, 1, 0, 1,
-0.6307679, -0.5225436, -2.659015, 0.3372549, 1, 0, 1,
-0.6218095, -0.04333158, -0.8500103, 0.3333333, 1, 0, 1,
-0.6143208, 0.2206083, -1.726427, 0.3254902, 1, 0, 1,
-0.611299, 0.9913815, 0.3010753, 0.3215686, 1, 0, 1,
-0.6044587, -0.2267402, -3.253545, 0.3137255, 1, 0, 1,
-0.6037496, 0.7871456, -1.349328, 0.3098039, 1, 0, 1,
-0.6031885, 0.07896525, -1.194571, 0.3019608, 1, 0, 1,
-0.6006305, 0.2105131, -0.9913009, 0.2941177, 1, 0, 1,
-0.5998788, 2.707254, 0.05547722, 0.2901961, 1, 0, 1,
-0.5995668, 0.08958124, -0.6292832, 0.282353, 1, 0, 1,
-0.5978971, -1.68914, -3.429876, 0.2784314, 1, 0, 1,
-0.5978724, 1.190241, -2.502722, 0.2705882, 1, 0, 1,
-0.5918026, 0.3620399, -1.504753, 0.2666667, 1, 0, 1,
-0.5913527, 1.929431, 0.4467945, 0.2588235, 1, 0, 1,
-0.5904224, 0.2889727, -1.657827, 0.254902, 1, 0, 1,
-0.5892521, 1.96021, -0.1166709, 0.2470588, 1, 0, 1,
-0.5835486, 0.8722168, -0.1804818, 0.2431373, 1, 0, 1,
-0.5818768, -0.06634048, -0.7863044, 0.2352941, 1, 0, 1,
-0.5759714, -0.6977639, -3.631867, 0.2313726, 1, 0, 1,
-0.5754896, -0.7038641, -3.133201, 0.2235294, 1, 0, 1,
-0.5751683, 0.4526353, -1.495833, 0.2196078, 1, 0, 1,
-0.5746275, -0.7923068, -0.8160898, 0.2117647, 1, 0, 1,
-0.5730294, 1.04961, -2.309875, 0.2078431, 1, 0, 1,
-0.572803, 0.375238, -0.4790432, 0.2, 1, 0, 1,
-0.5718151, 1.758541, 0.08245064, 0.1921569, 1, 0, 1,
-0.5707781, 1.522806, -0.2699104, 0.1882353, 1, 0, 1,
-0.5677812, 2.014531, 1.392365, 0.1803922, 1, 0, 1,
-0.5657034, 0.5816887, -1.445594, 0.1764706, 1, 0, 1,
-0.5647106, -1.01045, -4.847926, 0.1686275, 1, 0, 1,
-0.5629334, -1.428348, -2.77576, 0.1647059, 1, 0, 1,
-0.559228, -0.05301546, -1.447552, 0.1568628, 1, 0, 1,
-0.5522505, 0.4773191, -0.7656193, 0.1529412, 1, 0, 1,
-0.5443596, -0.7311592, -3.208403, 0.145098, 1, 0, 1,
-0.5436209, 0.6939491, -1.529958, 0.1411765, 1, 0, 1,
-0.5338738, -0.02160996, -2.712741, 0.1333333, 1, 0, 1,
-0.5235218, -0.8456038, -2.187047, 0.1294118, 1, 0, 1,
-0.5220283, 0.005959864, -3.541054, 0.1215686, 1, 0, 1,
-0.5213452, -0.7818388, -1.596553, 0.1176471, 1, 0, 1,
-0.5191388, 1.78734, 1.472854, 0.1098039, 1, 0, 1,
-0.5124621, 2.500987, -0.02214052, 0.1058824, 1, 0, 1,
-0.509313, -1.335961, -2.633648, 0.09803922, 1, 0, 1,
-0.5068983, -0.581099, -1.464835, 0.09019608, 1, 0, 1,
-0.5033143, 0.3121116, -0.7236814, 0.08627451, 1, 0, 1,
-0.5018353, -1.844363, -2.62374, 0.07843138, 1, 0, 1,
-0.4988056, 0.04517981, -0.8065753, 0.07450981, 1, 0, 1,
-0.4981938, -0.6663496, -3.267659, 0.06666667, 1, 0, 1,
-0.4938917, -0.7509841, -3.080428, 0.0627451, 1, 0, 1,
-0.485851, 0.2836089, -1.326584, 0.05490196, 1, 0, 1,
-0.4821242, -0.06825073, -1.528922, 0.05098039, 1, 0, 1,
-0.4810799, 0.8630002, -1.999409, 0.04313726, 1, 0, 1,
-0.4800453, 0.3583204, -1.477925, 0.03921569, 1, 0, 1,
-0.4797558, -1.174844, -1.826275, 0.03137255, 1, 0, 1,
-0.4770228, 0.1742558, -1.949098, 0.02745098, 1, 0, 1,
-0.4698708, -0.5030603, -2.330619, 0.01960784, 1, 0, 1,
-0.4680326, -1.485067, -3.761699, 0.01568628, 1, 0, 1,
-0.4664691, -0.04652236, -2.68324, 0.007843138, 1, 0, 1,
-0.4622258, 0.7055044, -1.123303, 0.003921569, 1, 0, 1,
-0.4592595, -0.7905424, -2.177536, 0, 1, 0.003921569, 1,
-0.4535843, 0.6645464, -1.759785, 0, 1, 0.01176471, 1,
-0.4527287, 0.645542, 0.1275349, 0, 1, 0.01568628, 1,
-0.4466368, 0.5554123, -1.248167, 0, 1, 0.02352941, 1,
-0.4428364, 0.8321719, -0.2804693, 0, 1, 0.02745098, 1,
-0.4409403, 0.8678886, -1.063008, 0, 1, 0.03529412, 1,
-0.4404264, 0.0332496, -1.869656, 0, 1, 0.03921569, 1,
-0.4384815, -1.926463, -0.4211574, 0, 1, 0.04705882, 1,
-0.436989, -0.4736072, -4.001661, 0, 1, 0.05098039, 1,
-0.4352803, -0.5528681, -3.432672, 0, 1, 0.05882353, 1,
-0.4338975, -0.2530894, -1.524602, 0, 1, 0.0627451, 1,
-0.4335895, -0.3342195, -1.712911, 0, 1, 0.07058824, 1,
-0.4324754, -0.9144827, -0.9634559, 0, 1, 0.07450981, 1,
-0.4298804, -1.112048, -3.188395, 0, 1, 0.08235294, 1,
-0.4215572, -0.1548048, -2.784276, 0, 1, 0.08627451, 1,
-0.4200136, 0.2032807, -0.3971238, 0, 1, 0.09411765, 1,
-0.4197378, 1.250194, -0.9227859, 0, 1, 0.1019608, 1,
-0.4164242, 1.001079, -1.196061, 0, 1, 0.1058824, 1,
-0.4146386, -0.1288647, -2.36821, 0, 1, 0.1137255, 1,
-0.4142955, -0.003964621, -1.416061, 0, 1, 0.1176471, 1,
-0.4137444, 0.5275624, -1.77363, 0, 1, 0.1254902, 1,
-0.4029099, 1.015612, 0.5725417, 0, 1, 0.1294118, 1,
-0.4016488, -0.2926806, -2.417604, 0, 1, 0.1372549, 1,
-0.4012646, 0.6547996, -1.048198, 0, 1, 0.1411765, 1,
-0.3997185, 1.500104, -0.6960936, 0, 1, 0.1490196, 1,
-0.3988273, 0.1137511, -1.963606, 0, 1, 0.1529412, 1,
-0.387635, -1.609003, -2.918683, 0, 1, 0.1607843, 1,
-0.3873951, 0.66856, -1.83236, 0, 1, 0.1647059, 1,
-0.3871259, 0.2682683, -0.3757471, 0, 1, 0.172549, 1,
-0.3864748, 0.4438884, -0.9895911, 0, 1, 0.1764706, 1,
-0.3857795, 0.744245, -0.5399051, 0, 1, 0.1843137, 1,
-0.3805106, -1.133332, -4.062635, 0, 1, 0.1882353, 1,
-0.3799438, -0.7427931, -3.029073, 0, 1, 0.1960784, 1,
-0.3794629, 0.6984889, -0.2271406, 0, 1, 0.2039216, 1,
-0.3765335, -2.437391, -3.838183, 0, 1, 0.2078431, 1,
-0.3760499, 1.1348, -2.470657, 0, 1, 0.2156863, 1,
-0.3729644, 1.538184, -0.8493645, 0, 1, 0.2196078, 1,
-0.3613234, 0.940991, -0.4179112, 0, 1, 0.227451, 1,
-0.3524587, -0.1535786, -1.767942, 0, 1, 0.2313726, 1,
-0.3498633, 1.65202, 0.07070122, 0, 1, 0.2392157, 1,
-0.3492864, 0.1831904, -0.5543963, 0, 1, 0.2431373, 1,
-0.3488518, 0.1975186, 0.07271847, 0, 1, 0.2509804, 1,
-0.3476795, 0.9660659, -2.290757, 0, 1, 0.254902, 1,
-0.3468708, -0.8411995, -1.204471, 0, 1, 0.2627451, 1,
-0.3455082, 0.6617965, -1.590032, 0, 1, 0.2666667, 1,
-0.345472, 0.2870537, 1.535053, 0, 1, 0.2745098, 1,
-0.3433285, 1.406619, -0.5321984, 0, 1, 0.2784314, 1,
-0.3428788, 1.094376, -0.3543042, 0, 1, 0.2862745, 1,
-0.3388356, -1.981318, -2.266533, 0, 1, 0.2901961, 1,
-0.3382143, 0.8015058, -1.534185, 0, 1, 0.2980392, 1,
-0.3344503, -1.680012, -1.139931, 0, 1, 0.3058824, 1,
-0.3273787, -0.5347391, -3.123733, 0, 1, 0.3098039, 1,
-0.3272074, -0.4589853, -2.702627, 0, 1, 0.3176471, 1,
-0.3258701, 1.256239, -0.5783664, 0, 1, 0.3215686, 1,
-0.3226002, 0.3366301, -1.674183, 0, 1, 0.3294118, 1,
-0.3144337, -0.5342362, -2.45473, 0, 1, 0.3333333, 1,
-0.3040353, 0.3630946, -0.3549614, 0, 1, 0.3411765, 1,
-0.2985213, 1.418952, 0.3587749, 0, 1, 0.345098, 1,
-0.2981669, 0.07047508, -0.7881932, 0, 1, 0.3529412, 1,
-0.2955951, 0.2229831, -1.428628, 0, 1, 0.3568628, 1,
-0.2946643, 0.9786832, -1.143522, 0, 1, 0.3647059, 1,
-0.2927065, -0.8833918, -1.351065, 0, 1, 0.3686275, 1,
-0.2926763, 0.6031357, 0.4346178, 0, 1, 0.3764706, 1,
-0.291068, -0.1884674, -2.411774, 0, 1, 0.3803922, 1,
-0.2899653, 1.137386, 1.172841, 0, 1, 0.3882353, 1,
-0.2839191, -1.060745, -1.916771, 0, 1, 0.3921569, 1,
-0.2831836, 0.8192338, -0.5393322, 0, 1, 0.4, 1,
-0.2828241, -0.6796273, -2.420206, 0, 1, 0.4078431, 1,
-0.2826897, 0.4771157, 0.143995, 0, 1, 0.4117647, 1,
-0.2810127, -0.3488588, -3.104669, 0, 1, 0.4196078, 1,
-0.2771983, -0.54498, -1.641672, 0, 1, 0.4235294, 1,
-0.2740705, 0.0956251, -1.323654, 0, 1, 0.4313726, 1,
-0.2612763, -1.507348, -3.336345, 0, 1, 0.4352941, 1,
-0.2579053, -0.2940537, -2.146794, 0, 1, 0.4431373, 1,
-0.2569253, -0.6516695, -3.369573, 0, 1, 0.4470588, 1,
-0.2521617, 0.2864248, -0.795985, 0, 1, 0.454902, 1,
-0.2385172, -0.5304907, -3.894329, 0, 1, 0.4588235, 1,
-0.2357848, -0.4435476, -4.496649, 0, 1, 0.4666667, 1,
-0.2346544, -1.297664, -2.42008, 0, 1, 0.4705882, 1,
-0.2264332, 0.1678848, -0.2109035, 0, 1, 0.4784314, 1,
-0.224586, 1.181163, -0.1094181, 0, 1, 0.4823529, 1,
-0.223204, -0.8417397, -2.314891, 0, 1, 0.4901961, 1,
-0.2226848, -1.010658, -4.239573, 0, 1, 0.4941176, 1,
-0.2149387, 0.6516708, -0.7336901, 0, 1, 0.5019608, 1,
-0.2135618, -1.074771, -3.824156, 0, 1, 0.509804, 1,
-0.213364, -0.8056015, -3.406548, 0, 1, 0.5137255, 1,
-0.2128548, -2.182547, -4.176443, 0, 1, 0.5215687, 1,
-0.2126218, -0.104769, -0.9983807, 0, 1, 0.5254902, 1,
-0.2116662, -1.229505, -2.863557, 0, 1, 0.5333334, 1,
-0.2089456, 0.212224, 0.1449537, 0, 1, 0.5372549, 1,
-0.200672, -0.4641083, -2.640904, 0, 1, 0.5450981, 1,
-0.1971373, -0.3137756, -3.174723, 0, 1, 0.5490196, 1,
-0.1952787, -1.376084, -2.690087, 0, 1, 0.5568628, 1,
-0.1946613, -0.7724245, -1.286374, 0, 1, 0.5607843, 1,
-0.191757, 1.31613, 0.06495158, 0, 1, 0.5686275, 1,
-0.1897312, 0.2750582, -0.6672104, 0, 1, 0.572549, 1,
-0.1861289, -0.5763354, -1.024216, 0, 1, 0.5803922, 1,
-0.1850884, 2.525672, -2.048119, 0, 1, 0.5843138, 1,
-0.1842254, -0.4498668, -1.92209, 0, 1, 0.5921569, 1,
-0.1790913, -1.309392, -0.9752457, 0, 1, 0.5960785, 1,
-0.1783987, 1.00452, 1.892126, 0, 1, 0.6039216, 1,
-0.176656, -0.3609755, -1.79318, 0, 1, 0.6117647, 1,
-0.175802, -0.002302632, -1.153267, 0, 1, 0.6156863, 1,
-0.1744288, 1.185625, 0.426341, 0, 1, 0.6235294, 1,
-0.1706564, 0.9251057, -0.5875097, 0, 1, 0.627451, 1,
-0.1686973, 0.7999378, -0.4946853, 0, 1, 0.6352941, 1,
-0.1644871, 0.9740619, -1.08714, 0, 1, 0.6392157, 1,
-0.1621516, 0.9741167, 0.5823227, 0, 1, 0.6470588, 1,
-0.1620509, -1.193591, -4.025414, 0, 1, 0.6509804, 1,
-0.1584445, -0.3455912, -3.818913, 0, 1, 0.6588235, 1,
-0.1578075, -0.2891349, -1.678931, 0, 1, 0.6627451, 1,
-0.1522821, -0.09637754, -1.701812, 0, 1, 0.6705883, 1,
-0.1493307, -0.575533, -4.367091, 0, 1, 0.6745098, 1,
-0.1478283, 0.4883364, -0.06843765, 0, 1, 0.682353, 1,
-0.14415, -0.1877542, -2.291208, 0, 1, 0.6862745, 1,
-0.1441014, 3.186282, -0.874594, 0, 1, 0.6941177, 1,
-0.1402813, 1.533893, 0.7355382, 0, 1, 0.7019608, 1,
-0.1387997, 1.013843, 0.3638868, 0, 1, 0.7058824, 1,
-0.1373892, 0.2186206, 1.522668, 0, 1, 0.7137255, 1,
-0.1354972, -0.4359966, -2.541222, 0, 1, 0.7176471, 1,
-0.1313941, -0.9748849, -1.733793, 0, 1, 0.7254902, 1,
-0.1296237, -1.017162, -0.8588424, 0, 1, 0.7294118, 1,
-0.128585, 0.8699051, -1.233363, 0, 1, 0.7372549, 1,
-0.124834, 1.180197, -0.6827023, 0, 1, 0.7411765, 1,
-0.1201361, 0.2713098, 0.2281769, 0, 1, 0.7490196, 1,
-0.1131233, -0.2053698, -4.206577, 0, 1, 0.7529412, 1,
-0.1085154, -0.5338733, -2.026036, 0, 1, 0.7607843, 1,
-0.106643, 1.127432, -0.2384271, 0, 1, 0.7647059, 1,
-0.105243, -1.111962, -3.552917, 0, 1, 0.772549, 1,
-0.1050026, -1.907654, -2.460633, 0, 1, 0.7764706, 1,
-0.09556808, -0.6357906, -3.903456, 0, 1, 0.7843137, 1,
-0.09427997, -0.2872968, -3.450371, 0, 1, 0.7882353, 1,
-0.09384853, -1.533006, -5.101809, 0, 1, 0.7960784, 1,
-0.09373067, 0.9334389, -0.6655509, 0, 1, 0.8039216, 1,
-0.08892903, 0.8327885, -0.5762865, 0, 1, 0.8078431, 1,
-0.0886613, 1.006353, -1.569386, 0, 1, 0.8156863, 1,
-0.08706212, 0.9460214, -0.324874, 0, 1, 0.8196079, 1,
-0.08479013, 0.1537821, 0.4114511, 0, 1, 0.827451, 1,
-0.08477362, 0.9370527, -0.6935152, 0, 1, 0.8313726, 1,
-0.08088907, -0.5538488, -3.937694, 0, 1, 0.8392157, 1,
-0.07771151, -0.1608289, -2.254416, 0, 1, 0.8431373, 1,
-0.07439702, -0.4908201, -2.661171, 0, 1, 0.8509804, 1,
-0.07417157, 1.350579, 0.8412536, 0, 1, 0.854902, 1,
-0.07026554, -0.1980555, -2.224133, 0, 1, 0.8627451, 1,
-0.06968466, -0.2619486, -4.762194, 0, 1, 0.8666667, 1,
-0.06439979, -1.566547, -4.133236, 0, 1, 0.8745098, 1,
-0.05968139, 1.2498, 1.725742, 0, 1, 0.8784314, 1,
-0.05805217, -0.9335412, -2.585631, 0, 1, 0.8862745, 1,
-0.05664919, -0.03628725, -1.431422, 0, 1, 0.8901961, 1,
-0.05603999, -0.6942989, -2.893948, 0, 1, 0.8980392, 1,
-0.05436305, -0.5888623, -2.229966, 0, 1, 0.9058824, 1,
-0.05027773, 1.003763, -0.9206026, 0, 1, 0.9098039, 1,
-0.04853048, 0.8679097, -0.08888485, 0, 1, 0.9176471, 1,
-0.04581032, 0.155895, -0.113618, 0, 1, 0.9215686, 1,
-0.04436159, -0.8902948, -1.737765, 0, 1, 0.9294118, 1,
-0.04045098, 1.42037, 0.554604, 0, 1, 0.9333333, 1,
-0.03896351, 0.03016976, -1.68136, 0, 1, 0.9411765, 1,
-0.03743652, -0.2804839, -1.363282, 0, 1, 0.945098, 1,
-0.0304955, -0.5114335, -2.455296, 0, 1, 0.9529412, 1,
-0.03040637, 0.3595715, -1.452501, 0, 1, 0.9568627, 1,
-0.03032132, -0.8905039, -3.445736, 0, 1, 0.9647059, 1,
-0.02428624, -0.5505841, -3.742621, 0, 1, 0.9686275, 1,
-0.01585928, 0.8126345, -0.2781827, 0, 1, 0.9764706, 1,
-0.0131441, 0.2818761, 1.894931, 0, 1, 0.9803922, 1,
-0.01212441, -0.8482101, -2.238704, 0, 1, 0.9882353, 1,
-0.01037575, 1.148317, -0.6256028, 0, 1, 0.9921569, 1,
-0.008623025, -0.6754423, -2.803373, 0, 1, 1, 1,
-0.007273616, -0.9758805, -3.341312, 0, 0.9921569, 1, 1,
-0.005376413, 0.8878281, 0.4918426, 0, 0.9882353, 1, 1,
0.0001548334, 1.08527, -0.1400041, 0, 0.9803922, 1, 1,
0.0004639, 0.8203509, -0.3702283, 0, 0.9764706, 1, 1,
0.02411997, 0.8858494, 1.198704, 0, 0.9686275, 1, 1,
0.02589565, -0.78703, 3.563025, 0, 0.9647059, 1, 1,
0.0305529, -0.3115633, 2.695297, 0, 0.9568627, 1, 1,
0.03199938, 0.05737982, 0.8534573, 0, 0.9529412, 1, 1,
0.03289146, 0.5345211, -0.9825639, 0, 0.945098, 1, 1,
0.03424366, 0.4536763, 0.8018454, 0, 0.9411765, 1, 1,
0.03809426, 1.797808, 0.5362192, 0, 0.9333333, 1, 1,
0.03981323, -0.6293399, 2.442444, 0, 0.9294118, 1, 1,
0.04017946, 1.186875, 0.3365936, 0, 0.9215686, 1, 1,
0.04101135, -0.2337146, 3.659632, 0, 0.9176471, 1, 1,
0.04157005, 0.3868473, 0.06358206, 0, 0.9098039, 1, 1,
0.04375965, -0.5376376, 2.839384, 0, 0.9058824, 1, 1,
0.04545619, -1.334623, 4.240758, 0, 0.8980392, 1, 1,
0.04736763, 0.02641056, 0.2581612, 0, 0.8901961, 1, 1,
0.04818947, -1.333404, 3.4467, 0, 0.8862745, 1, 1,
0.05120015, 1.055936, 1.760951, 0, 0.8784314, 1, 1,
0.05143787, -1.534671, 3.298356, 0, 0.8745098, 1, 1,
0.0571325, -0.8696522, 3.188099, 0, 0.8666667, 1, 1,
0.05761231, -0.4658071, 3.358382, 0, 0.8627451, 1, 1,
0.05780661, 0.02324154, 0.557206, 0, 0.854902, 1, 1,
0.05978205, 0.591121, -0.2232987, 0, 0.8509804, 1, 1,
0.0615306, 2.415993, -1.464653, 0, 0.8431373, 1, 1,
0.0636963, 0.1797444, 2.194874, 0, 0.8392157, 1, 1,
0.06474578, -0.3616074, 0.3975331, 0, 0.8313726, 1, 1,
0.06760114, 2.49605, -0.2956504, 0, 0.827451, 1, 1,
0.07947164, -0.02872744, 0.9571322, 0, 0.8196079, 1, 1,
0.08231239, -1.054684, 2.529151, 0, 0.8156863, 1, 1,
0.08245692, -0.5222299, 2.434464, 0, 0.8078431, 1, 1,
0.08476974, -0.2296984, 2.853311, 0, 0.8039216, 1, 1,
0.08730917, -1.915491, 2.723452, 0, 0.7960784, 1, 1,
0.08873951, 0.6029115, 1.083046, 0, 0.7882353, 1, 1,
0.08931331, -0.4343741, 4.617098, 0, 0.7843137, 1, 1,
0.09015303, 1.83808, -0.09303144, 0, 0.7764706, 1, 1,
0.09038477, 0.02223625, 1.61575, 0, 0.772549, 1, 1,
0.09041482, 0.0407147, -0.2041497, 0, 0.7647059, 1, 1,
0.09055142, 0.3248814, 1.256935, 0, 0.7607843, 1, 1,
0.09115973, 0.6894954, 0.3476564, 0, 0.7529412, 1, 1,
0.09278924, -2.002042, 4.843455, 0, 0.7490196, 1, 1,
0.09328929, 1.221014, 1.787479, 0, 0.7411765, 1, 1,
0.09406456, -0.5582961, 2.015759, 0, 0.7372549, 1, 1,
0.09823626, -1.296411, 3.647258, 0, 0.7294118, 1, 1,
0.1009059, 0.5985391, 1.881036, 0, 0.7254902, 1, 1,
0.1013342, -0.1225503, 2.476918, 0, 0.7176471, 1, 1,
0.1027995, 0.6665676, -0.03622577, 0, 0.7137255, 1, 1,
0.1110091, -1.088533, 2.50566, 0, 0.7058824, 1, 1,
0.1130365, 0.4684063, 2.052102, 0, 0.6980392, 1, 1,
0.1200477, 1.007612, -1.578282, 0, 0.6941177, 1, 1,
0.1330251, -0.9478613, 3.878088, 0, 0.6862745, 1, 1,
0.1349313, -0.8902519, 4.99033, 0, 0.682353, 1, 1,
0.1349717, 0.5459498, 1.172242, 0, 0.6745098, 1, 1,
0.1373751, -1.569929, 2.379053, 0, 0.6705883, 1, 1,
0.1389272, -0.6206433, 4.806243, 0, 0.6627451, 1, 1,
0.1492282, -0.7324522, 2.568972, 0, 0.6588235, 1, 1,
0.1518129, 0.824407, -0.1605448, 0, 0.6509804, 1, 1,
0.1527938, -0.2697907, 3.55307, 0, 0.6470588, 1, 1,
0.1547813, 0.899124, 1.056392, 0, 0.6392157, 1, 1,
0.1551303, 0.1555797, 2.202096, 0, 0.6352941, 1, 1,
0.1554729, -0.1983266, 3.009578, 0, 0.627451, 1, 1,
0.1589015, -0.7373974, 3.874968, 0, 0.6235294, 1, 1,
0.1595731, 0.7368125, -1.604735, 0, 0.6156863, 1, 1,
0.1598943, -1.568401, 1.157596, 0, 0.6117647, 1, 1,
0.1608743, -0.9179438, 2.920758, 0, 0.6039216, 1, 1,
0.1624007, -0.03949843, 1.602695, 0, 0.5960785, 1, 1,
0.1624339, -0.1603442, 3.021294, 0, 0.5921569, 1, 1,
0.1641483, 0.5675878, -1.187878, 0, 0.5843138, 1, 1,
0.1651998, -1.376339, 2.170956, 0, 0.5803922, 1, 1,
0.1699488, -0.1624106, 2.025221, 0, 0.572549, 1, 1,
0.1821342, -0.7247256, 3.135077, 0, 0.5686275, 1, 1,
0.182871, -0.6828227, 3.497131, 0, 0.5607843, 1, 1,
0.1858915, 0.9319364, -1.067838, 0, 0.5568628, 1, 1,
0.1933597, 0.01563653, 2.982806, 0, 0.5490196, 1, 1,
0.1972933, -1.489136, 4.978495, 0, 0.5450981, 1, 1,
0.2058981, -0.6935807, 3.682552, 0, 0.5372549, 1, 1,
0.2124979, 1.102911, -0.9361908, 0, 0.5333334, 1, 1,
0.215142, -0.1435093, 3.372736, 0, 0.5254902, 1, 1,
0.2185469, 1.04421, 0.07481588, 0, 0.5215687, 1, 1,
0.2205323, 0.1055764, -0.5797147, 0, 0.5137255, 1, 1,
0.2231735, -0.3868292, 3.873935, 0, 0.509804, 1, 1,
0.2234773, 1.744767, 0.6009661, 0, 0.5019608, 1, 1,
0.224495, -0.6123777, 1.879332, 0, 0.4941176, 1, 1,
0.226636, 0.2127212, 0.3873765, 0, 0.4901961, 1, 1,
0.2293833, 0.6829566, 0.5085214, 0, 0.4823529, 1, 1,
0.2297815, 0.8675781, -0.2706645, 0, 0.4784314, 1, 1,
0.2413666, -0.7373695, 2.063075, 0, 0.4705882, 1, 1,
0.2424902, -0.009597013, 1.251892, 0, 0.4666667, 1, 1,
0.2425466, -1.14781, 3.810871, 0, 0.4588235, 1, 1,
0.2454205, -0.4129083, 1.02456, 0, 0.454902, 1, 1,
0.2499468, 0.7250751, -1.435418, 0, 0.4470588, 1, 1,
0.2580365, 0.6340326, 0.1406837, 0, 0.4431373, 1, 1,
0.2580793, -0.4374518, 2.787969, 0, 0.4352941, 1, 1,
0.2591459, -0.1951091, 2.286525, 0, 0.4313726, 1, 1,
0.2597483, -0.744715, 5.105863, 0, 0.4235294, 1, 1,
0.260419, 1.121562, -0.6752567, 0, 0.4196078, 1, 1,
0.2605084, 1.157508, 0.3180361, 0, 0.4117647, 1, 1,
0.2616866, -0.4067322, 0.9942724, 0, 0.4078431, 1, 1,
0.2626048, 1.424505, 0.5024516, 0, 0.4, 1, 1,
0.2637894, 0.5837834, 1.912548, 0, 0.3921569, 1, 1,
0.2676967, -1.335658, 1.733078, 0, 0.3882353, 1, 1,
0.2710553, -1.152488, 4.229514, 0, 0.3803922, 1, 1,
0.2740316, 0.8702249, 0.1137795, 0, 0.3764706, 1, 1,
0.2787111, -0.3045319, 5.396595, 0, 0.3686275, 1, 1,
0.2818441, 0.9030433, -1.523855, 0, 0.3647059, 1, 1,
0.2821933, 1.177917, 0.5910657, 0, 0.3568628, 1, 1,
0.2823814, -1.061185, 3.691328, 0, 0.3529412, 1, 1,
0.288626, -1.530482, 1.57217, 0, 0.345098, 1, 1,
0.2938473, 0.6147286, 2.741968, 0, 0.3411765, 1, 1,
0.2938489, -0.02785907, 1.923657, 0, 0.3333333, 1, 1,
0.2980669, -1.196792, 4.295286, 0, 0.3294118, 1, 1,
0.3000851, 0.3092837, 0.6246279, 0, 0.3215686, 1, 1,
0.3098145, 1.043388, -1.187541, 0, 0.3176471, 1, 1,
0.3134336, -0.2677622, 2.378932, 0, 0.3098039, 1, 1,
0.3176625, 1.156214, -2.061605, 0, 0.3058824, 1, 1,
0.3208706, -0.267303, 2.853232, 0, 0.2980392, 1, 1,
0.3222003, 0.5583996, 1.946213, 0, 0.2901961, 1, 1,
0.3236257, 0.2537677, 0.9881501, 0, 0.2862745, 1, 1,
0.3262014, 0.923399, 0.4080032, 0, 0.2784314, 1, 1,
0.3266838, -0.6275986, 3.519934, 0, 0.2745098, 1, 1,
0.3280289, -0.4291832, 2.827051, 0, 0.2666667, 1, 1,
0.3314786, -0.6703037, 1.171123, 0, 0.2627451, 1, 1,
0.3330325, 0.430793, 0.7177602, 0, 0.254902, 1, 1,
0.3334016, -1.520756, 3.124118, 0, 0.2509804, 1, 1,
0.3338203, -0.4345888, 3.14732, 0, 0.2431373, 1, 1,
0.3347459, 0.4269023, 0.2052835, 0, 0.2392157, 1, 1,
0.3348634, -0.2493575, 2.114091, 0, 0.2313726, 1, 1,
0.3371267, -1.084266, 3.570472, 0, 0.227451, 1, 1,
0.338737, -1.295735, 3.606079, 0, 0.2196078, 1, 1,
0.3419854, 0.2370838, -1.397229, 0, 0.2156863, 1, 1,
0.3429402, 1.077779, 0.5723496, 0, 0.2078431, 1, 1,
0.3534007, -0.5419449, 1.629388, 0, 0.2039216, 1, 1,
0.3542362, -0.4656167, 3.584515, 0, 0.1960784, 1, 1,
0.3593099, -0.3546427, 2.82112, 0, 0.1882353, 1, 1,
0.3609747, 0.8798614, 1.102683, 0, 0.1843137, 1, 1,
0.3616937, 1.06226, 1.085238, 0, 0.1764706, 1, 1,
0.3635665, 0.2120426, 0.02985703, 0, 0.172549, 1, 1,
0.3656212, -0.3151635, 3.196434, 0, 0.1647059, 1, 1,
0.3687451, 0.2819104, 1.51591, 0, 0.1607843, 1, 1,
0.3744549, -0.00112579, 0.3257348, 0, 0.1529412, 1, 1,
0.3769124, 1.45556, -1.446747, 0, 0.1490196, 1, 1,
0.3772959, -1.816134, 3.239108, 0, 0.1411765, 1, 1,
0.3815831, 0.3694798, 0.2383606, 0, 0.1372549, 1, 1,
0.3825316, 0.06227389, 1.281225, 0, 0.1294118, 1, 1,
0.3877319, 0.6848258, 0.8064814, 0, 0.1254902, 1, 1,
0.3931352, -0.04751313, 0.9829159, 0, 0.1176471, 1, 1,
0.3976429, -1.418418, 3.652334, 0, 0.1137255, 1, 1,
0.3980203, -0.6530803, 4.079638, 0, 0.1058824, 1, 1,
0.3983328, -0.6948667, 3.465719, 0, 0.09803922, 1, 1,
0.4007463, -0.2894155, 0.9530999, 0, 0.09411765, 1, 1,
0.4034842, -0.8721425, 2.347203, 0, 0.08627451, 1, 1,
0.4123415, -0.1543505, 2.619195, 0, 0.08235294, 1, 1,
0.4244931, -0.2726753, 0.6925833, 0, 0.07450981, 1, 1,
0.4255567, -0.7734165, 2.924556, 0, 0.07058824, 1, 1,
0.4256062, -1.726027, 2.989036, 0, 0.0627451, 1, 1,
0.42962, 1.196407, 1.258556, 0, 0.05882353, 1, 1,
0.4301433, 0.4941985, 1.388291, 0, 0.05098039, 1, 1,
0.440163, 0.8989766, 1.010875, 0, 0.04705882, 1, 1,
0.4413072, -0.6366752, 2.911487, 0, 0.03921569, 1, 1,
0.4424688, 0.6196036, 0.5272083, 0, 0.03529412, 1, 1,
0.4427205, -0.1788274, 2.048439, 0, 0.02745098, 1, 1,
0.4428698, -0.5183731, 2.725511, 0, 0.02352941, 1, 1,
0.4494825, 2.029104, -0.06101089, 0, 0.01568628, 1, 1,
0.4522703, -0.4469261, 2.256447, 0, 0.01176471, 1, 1,
0.4530372, 1.599781, 1.115109, 0, 0.003921569, 1, 1,
0.4645388, 0.593183, -0.1155642, 0.003921569, 0, 1, 1,
0.4646853, 0.2136853, 0.3212236, 0.007843138, 0, 1, 1,
0.4677227, 0.8917173, 2.387613, 0.01568628, 0, 1, 1,
0.4701555, -0.3988481, 2.679717, 0.01960784, 0, 1, 1,
0.4718022, -1.430334, 3.570354, 0.02745098, 0, 1, 1,
0.4720219, -0.2309922, 1.13313, 0.03137255, 0, 1, 1,
0.4762784, 0.1407488, 0.7704182, 0.03921569, 0, 1, 1,
0.4764681, -0.9294756, 1.882955, 0.04313726, 0, 1, 1,
0.4772742, -2.260215, 2.574689, 0.05098039, 0, 1, 1,
0.4900097, -0.3642474, 3.442264, 0.05490196, 0, 1, 1,
0.4905727, 2.020361, 0.8504744, 0.0627451, 0, 1, 1,
0.4939449, 0.0385581, -0.1992223, 0.06666667, 0, 1, 1,
0.4940497, -0.7347077, 1.537471, 0.07450981, 0, 1, 1,
0.4982172, -1.48915, 3.423653, 0.07843138, 0, 1, 1,
0.4993268, 0.03632994, 0.8303074, 0.08627451, 0, 1, 1,
0.502117, 0.4184722, 0.4181838, 0.09019608, 0, 1, 1,
0.5034893, -0.5318736, -0.1478263, 0.09803922, 0, 1, 1,
0.5050696, -0.1050524, 2.874095, 0.1058824, 0, 1, 1,
0.5065042, 0.2438638, 1.998293, 0.1098039, 0, 1, 1,
0.5158172, 0.8946436, -0.4155396, 0.1176471, 0, 1, 1,
0.5186133, -0.9909979, 1.378622, 0.1215686, 0, 1, 1,
0.5210263, -1.159807, 3.357556, 0.1294118, 0, 1, 1,
0.5217032, -0.9402201, 2.194933, 0.1333333, 0, 1, 1,
0.5267946, 0.1528831, 1.551857, 0.1411765, 0, 1, 1,
0.5307269, 0.5139692, 2.368056, 0.145098, 0, 1, 1,
0.5312604, 0.574362, 1.793398, 0.1529412, 0, 1, 1,
0.532429, -0.2131121, 0.5442804, 0.1568628, 0, 1, 1,
0.5400901, -1.73729, 3.373036, 0.1647059, 0, 1, 1,
0.5514674, 0.9359779, 1.342663, 0.1686275, 0, 1, 1,
0.5544965, 0.7311921, 1.146516, 0.1764706, 0, 1, 1,
0.5567954, -0.8334197, 4.957524, 0.1803922, 0, 1, 1,
0.5592746, -1.602725, 2.511721, 0.1882353, 0, 1, 1,
0.5616614, 0.8238092, -0.1022016, 0.1921569, 0, 1, 1,
0.5646958, 0.4841154, 2.280749, 0.2, 0, 1, 1,
0.5688583, -0.2726867, 1.612179, 0.2078431, 0, 1, 1,
0.5754781, 0.126069, 0.9000589, 0.2117647, 0, 1, 1,
0.5801497, 0.0889404, 0.5629771, 0.2196078, 0, 1, 1,
0.5804651, 0.3696493, 1.484214, 0.2235294, 0, 1, 1,
0.5839244, 0.328178, -0.2990039, 0.2313726, 0, 1, 1,
0.584501, -1.936601, 5.47259, 0.2352941, 0, 1, 1,
0.5854415, -0.1089351, 2.329482, 0.2431373, 0, 1, 1,
0.5870194, -0.1493031, 0.8790908, 0.2470588, 0, 1, 1,
0.5880111, -1.171242, 2.654594, 0.254902, 0, 1, 1,
0.5893625, 0.2197834, 0.7781433, 0.2588235, 0, 1, 1,
0.5930809, 1.019148, -0.03780243, 0.2666667, 0, 1, 1,
0.5933102, -1.369853, 3.610316, 0.2705882, 0, 1, 1,
0.594996, 1.097371, 1.733889, 0.2784314, 0, 1, 1,
0.6048985, 0.4711525, 1.427255, 0.282353, 0, 1, 1,
0.6054104, 1.94353, 1.082898, 0.2901961, 0, 1, 1,
0.6057183, -0.5101389, 4.574182, 0.2941177, 0, 1, 1,
0.6078101, -1.003086, 2.617233, 0.3019608, 0, 1, 1,
0.6163765, 1.819017, 0.7451633, 0.3098039, 0, 1, 1,
0.6185753, -0.1916413, 2.0686, 0.3137255, 0, 1, 1,
0.6193451, 0.2265845, 0.6162428, 0.3215686, 0, 1, 1,
0.6200723, 1.393563, 0.3596576, 0.3254902, 0, 1, 1,
0.6212261, 0.6242549, 1.009217, 0.3333333, 0, 1, 1,
0.6338981, 1.135716, 0.2839743, 0.3372549, 0, 1, 1,
0.6352666, -1.331368, 3.463473, 0.345098, 0, 1, 1,
0.6367763, -0.7775351, 3.019974, 0.3490196, 0, 1, 1,
0.6392742, -1.337155, 3.241054, 0.3568628, 0, 1, 1,
0.6413624, -1.868308, 3.238367, 0.3607843, 0, 1, 1,
0.6452504, 1.293013, -0.5628902, 0.3686275, 0, 1, 1,
0.6454903, -0.6944158, 1.580383, 0.372549, 0, 1, 1,
0.6517384, -0.4869451, 2.385811, 0.3803922, 0, 1, 1,
0.6520934, 0.05443793, 0.6382192, 0.3843137, 0, 1, 1,
0.6551693, -0.950802, 0.2156383, 0.3921569, 0, 1, 1,
0.6563504, 1.052828, 1.380346, 0.3960784, 0, 1, 1,
0.6699104, -1.92399, 2.922851, 0.4039216, 0, 1, 1,
0.6716782, 0.1825409, 1.201838, 0.4117647, 0, 1, 1,
0.6767345, -1.312851, 1.535404, 0.4156863, 0, 1, 1,
0.6771331, 0.4119992, 0.9763009, 0.4235294, 0, 1, 1,
0.679071, 0.1103149, 3.0322, 0.427451, 0, 1, 1,
0.679547, -0.6454859, 2.490952, 0.4352941, 0, 1, 1,
0.6851467, 1.225084, 1.24554, 0.4392157, 0, 1, 1,
0.6877772, -0.5610475, 2.028699, 0.4470588, 0, 1, 1,
0.6909242, -0.1757138, 2.899584, 0.4509804, 0, 1, 1,
0.6929078, -2.349527, 2.100271, 0.4588235, 0, 1, 1,
0.6933966, 1.13673, 1.977721, 0.4627451, 0, 1, 1,
0.693909, 0.1350595, 3.003221, 0.4705882, 0, 1, 1,
0.6962818, 0.2291872, 3.339191, 0.4745098, 0, 1, 1,
0.6985682, -0.4467097, 1.419796, 0.4823529, 0, 1, 1,
0.701354, 0.57687, 2.021901, 0.4862745, 0, 1, 1,
0.7104951, -1.338001, 3.305168, 0.4941176, 0, 1, 1,
0.7107475, 1.370091, -0.1153288, 0.5019608, 0, 1, 1,
0.7182656, -0.7678949, 2.328188, 0.5058824, 0, 1, 1,
0.720385, -0.7100865, 2.449988, 0.5137255, 0, 1, 1,
0.720506, 1.007557, -0.4185953, 0.5176471, 0, 1, 1,
0.7220316, 0.07649433, 0.3572081, 0.5254902, 0, 1, 1,
0.724238, 1.095782, 0.7140195, 0.5294118, 0, 1, 1,
0.7249243, -1.243059, 1.368887, 0.5372549, 0, 1, 1,
0.7251813, 0.5310668, -0.2316141, 0.5411765, 0, 1, 1,
0.7259905, -0.3873304, 1.584697, 0.5490196, 0, 1, 1,
0.7267698, 1.086046, -1.728163, 0.5529412, 0, 1, 1,
0.7273635, -1.653947, 0.6337727, 0.5607843, 0, 1, 1,
0.7279829, 0.4221531, 0.8732265, 0.5647059, 0, 1, 1,
0.7351985, -0.1263888, 1.470588, 0.572549, 0, 1, 1,
0.7361284, -0.3658521, 2.066501, 0.5764706, 0, 1, 1,
0.7439995, -0.3477629, 4.905093, 0.5843138, 0, 1, 1,
0.7450772, 0.2230765, 1.401227, 0.5882353, 0, 1, 1,
0.7498275, 0.2398164, 2.140267, 0.5960785, 0, 1, 1,
0.7511262, 1.005604, 0.4386916, 0.6039216, 0, 1, 1,
0.7555764, -1.186304, 2.008254, 0.6078432, 0, 1, 1,
0.7576703, -1.267674, 3.065469, 0.6156863, 0, 1, 1,
0.7577876, -0.8091685, 1.673131, 0.6196079, 0, 1, 1,
0.7582588, -0.3792325, 2.557153, 0.627451, 0, 1, 1,
0.765808, -0.5984796, 2.301922, 0.6313726, 0, 1, 1,
0.7660934, -0.1497283, 2.992646, 0.6392157, 0, 1, 1,
0.7705451, -0.54364, 1.417525, 0.6431373, 0, 1, 1,
0.7743468, 0.5959316, 0.5377977, 0.6509804, 0, 1, 1,
0.7744262, -0.5271318, 3.755766, 0.654902, 0, 1, 1,
0.7767228, -1.680129, 3.231333, 0.6627451, 0, 1, 1,
0.7779639, 0.1343398, 3.581959, 0.6666667, 0, 1, 1,
0.7783734, 1.150657, 1.532344, 0.6745098, 0, 1, 1,
0.7804857, 0.7600902, 0.2006641, 0.6784314, 0, 1, 1,
0.7808859, -0.04574765, 0.564038, 0.6862745, 0, 1, 1,
0.7945697, 1.220772, 0.188027, 0.6901961, 0, 1, 1,
0.8024623, 0.5529501, 2.353032, 0.6980392, 0, 1, 1,
0.8056565, -0.5034108, 1.074201, 0.7058824, 0, 1, 1,
0.8062586, -1.700092, 2.872287, 0.7098039, 0, 1, 1,
0.8161342, -0.04022442, 0.9046959, 0.7176471, 0, 1, 1,
0.8170763, -0.891444, 4.400708, 0.7215686, 0, 1, 1,
0.8184595, 0.3901386, 2.557583, 0.7294118, 0, 1, 1,
0.8186351, -0.7043945, 2.317937, 0.7333333, 0, 1, 1,
0.8273824, 0.149266, 1.935516, 0.7411765, 0, 1, 1,
0.8339816, 0.7986026, 0.1867664, 0.7450981, 0, 1, 1,
0.834121, 0.2065422, -0.5670657, 0.7529412, 0, 1, 1,
0.8349496, -0.4632575, 0.9735372, 0.7568628, 0, 1, 1,
0.8368254, 1.2925, -0.5597295, 0.7647059, 0, 1, 1,
0.8369913, -0.04079933, 1.750081, 0.7686275, 0, 1, 1,
0.8374305, -0.06689882, -0.4141954, 0.7764706, 0, 1, 1,
0.8402966, -1.023602, 2.483267, 0.7803922, 0, 1, 1,
0.8564224, -1.278052, 1.700735, 0.7882353, 0, 1, 1,
0.8591181, 0.4639785, 1.742487, 0.7921569, 0, 1, 1,
0.870256, -1.145041, 2.817036, 0.8, 0, 1, 1,
0.8725111, -0.9524131, 2.322487, 0.8078431, 0, 1, 1,
0.8727431, -0.01681932, 1.929066, 0.8117647, 0, 1, 1,
0.8798504, -0.2681474, 0.6589141, 0.8196079, 0, 1, 1,
0.8851628, -0.3514315, 2.536864, 0.8235294, 0, 1, 1,
0.8857113, 0.4168634, 0.3662966, 0.8313726, 0, 1, 1,
0.887249, 0.3242477, 2.271775, 0.8352941, 0, 1, 1,
0.8889531, -0.06826949, 1.46267, 0.8431373, 0, 1, 1,
0.8891628, -2.542253, 3.481414, 0.8470588, 0, 1, 1,
0.9092966, -1.584198, 3.334831, 0.854902, 0, 1, 1,
0.9109302, 0.5935097, 0.5253423, 0.8588235, 0, 1, 1,
0.9148179, 0.5709423, 1.201616, 0.8666667, 0, 1, 1,
0.9155632, 2.584703, 0.8352277, 0.8705882, 0, 1, 1,
0.9280866, 0.9270193, 0.2809626, 0.8784314, 0, 1, 1,
0.9287569, -0.4399978, 3.296461, 0.8823529, 0, 1, 1,
0.9387199, 1.296351, -0.1340079, 0.8901961, 0, 1, 1,
0.9409241, -0.240327, 2.538491, 0.8941177, 0, 1, 1,
0.9422502, 0.404125, 1.905675, 0.9019608, 0, 1, 1,
0.9575231, 0.4233509, 0.002169904, 0.9098039, 0, 1, 1,
0.9583069, -1.539862, 1.962817, 0.9137255, 0, 1, 1,
0.9587789, -0.7482888, 1.684905, 0.9215686, 0, 1, 1,
0.9678319, 0.8441097, 2.79243, 0.9254902, 0, 1, 1,
0.9690623, 1.396195, 1.839507, 0.9333333, 0, 1, 1,
0.976595, 0.07874446, 0.4268293, 0.9372549, 0, 1, 1,
0.9774693, 1.481191, -0.5463614, 0.945098, 0, 1, 1,
0.9784902, 0.3759002, 3.536619, 0.9490196, 0, 1, 1,
0.9850157, -1.015614, 2.454197, 0.9568627, 0, 1, 1,
0.9868191, -0.4991945, 2.910859, 0.9607843, 0, 1, 1,
0.9960617, -0.3018372, 0.7277383, 0.9686275, 0, 1, 1,
1.003617, 2.426884, 0.1028237, 0.972549, 0, 1, 1,
1.004663, 0.3721482, -0.5177189, 0.9803922, 0, 1, 1,
1.006646, 1.500177, 2.288921, 0.9843137, 0, 1, 1,
1.017593, -0.8525565, 1.459323, 0.9921569, 0, 1, 1,
1.025513, 1.388103, 2.975365, 0.9960784, 0, 1, 1,
1.028006, 0.8958003, 0.2373878, 1, 0, 0.9960784, 1,
1.031077, -1.750067, 3.768661, 1, 0, 0.9882353, 1,
1.038774, -0.9088282, 2.159854, 1, 0, 0.9843137, 1,
1.041031, 2.61505, -0.3695842, 1, 0, 0.9764706, 1,
1.044368, -0.5760565, 0.9105387, 1, 0, 0.972549, 1,
1.04618, 0.06228735, 3.593618, 1, 0, 0.9647059, 1,
1.0483, 0.1073575, 2.140227, 1, 0, 0.9607843, 1,
1.062531, 0.8832286, 0.5561872, 1, 0, 0.9529412, 1,
1.065699, 0.5248176, 1.034099, 1, 0, 0.9490196, 1,
1.074196, -1.287882, 2.379058, 1, 0, 0.9411765, 1,
1.075328, 0.7938509, 0.2687138, 1, 0, 0.9372549, 1,
1.087625, -0.7865165, 1.771633, 1, 0, 0.9294118, 1,
1.103755, 0.2107542, 0.6658394, 1, 0, 0.9254902, 1,
1.107128, -0.1019947, -1.919947, 1, 0, 0.9176471, 1,
1.1084, -2.105871, 3.620931, 1, 0, 0.9137255, 1,
1.108747, 0.2809455, -1.531176, 1, 0, 0.9058824, 1,
1.108861, 0.1486966, 1.974551, 1, 0, 0.9019608, 1,
1.115291, 0.1024681, 1.434859, 1, 0, 0.8941177, 1,
1.127842, 0.5348212, 0.6203707, 1, 0, 0.8862745, 1,
1.128932, -0.3430316, -0.4319236, 1, 0, 0.8823529, 1,
1.142382, 0.2329342, 1.137194, 1, 0, 0.8745098, 1,
1.142987, 0.1750302, 1.547148, 1, 0, 0.8705882, 1,
1.144799, 0.2996589, 0.888599, 1, 0, 0.8627451, 1,
1.148103, 0.7279662, 1.066551, 1, 0, 0.8588235, 1,
1.156426, 0.4681728, 1.62511, 1, 0, 0.8509804, 1,
1.16087, -0.2092813, 0.960247, 1, 0, 0.8470588, 1,
1.162718, 0.7982482, -0.6918262, 1, 0, 0.8392157, 1,
1.171343, -1.446288, 2.029581, 1, 0, 0.8352941, 1,
1.172832, 0.2233679, 1.313806, 1, 0, 0.827451, 1,
1.18132, 0.3874532, 1.242467, 1, 0, 0.8235294, 1,
1.194294, 0.5103203, 1.260806, 1, 0, 0.8156863, 1,
1.204725, -1.311962, 2.064992, 1, 0, 0.8117647, 1,
1.209248, -1.065211, 1.516725, 1, 0, 0.8039216, 1,
1.210807, 0.3826525, 1.348583, 1, 0, 0.7960784, 1,
1.215943, -0.9293758, 1.972064, 1, 0, 0.7921569, 1,
1.22189, 1.933819, 2.73655, 1, 0, 0.7843137, 1,
1.224502, -0.6472042, 1.393883, 1, 0, 0.7803922, 1,
1.22753, -0.9170249, 1.224141, 1, 0, 0.772549, 1,
1.228596, 1.148983, 1.337813, 1, 0, 0.7686275, 1,
1.237426, 0.291947, -0.01127533, 1, 0, 0.7607843, 1,
1.244835, 0.9072044, 0.2831858, 1, 0, 0.7568628, 1,
1.247597, -0.01319258, 2.067976, 1, 0, 0.7490196, 1,
1.24922, 0.1629795, 1.040954, 1, 0, 0.7450981, 1,
1.250869, -1.120733, -0.09891997, 1, 0, 0.7372549, 1,
1.255431, 0.05880699, 2.293444, 1, 0, 0.7333333, 1,
1.256669, 1.371175, 1.661661, 1, 0, 0.7254902, 1,
1.262983, -1.142783, 3.599067, 1, 0, 0.7215686, 1,
1.266554, 1.673273, 0.7170419, 1, 0, 0.7137255, 1,
1.271514, 0.2949824, 3.342173, 1, 0, 0.7098039, 1,
1.276767, 0.7613621, -2.415255, 1, 0, 0.7019608, 1,
1.282151, -0.2852854, 4.25061, 1, 0, 0.6941177, 1,
1.284786, -0.7441312, 2.771266, 1, 0, 0.6901961, 1,
1.285656, 0.4045585, 1.961019, 1, 0, 0.682353, 1,
1.287928, -0.1805582, 2.556965, 1, 0, 0.6784314, 1,
1.288317, 1.101269, 1.345195, 1, 0, 0.6705883, 1,
1.305738, 0.1711237, 0.07214715, 1, 0, 0.6666667, 1,
1.306812, -0.8170763, 3.223888, 1, 0, 0.6588235, 1,
1.308576, 0.2196642, 2.613856, 1, 0, 0.654902, 1,
1.317021, 0.9932965, 2.37032, 1, 0, 0.6470588, 1,
1.317896, 0.1718559, 0.7579941, 1, 0, 0.6431373, 1,
1.325847, 0.9076681, 0.5778651, 1, 0, 0.6352941, 1,
1.328345, -1.093491, 1.983405, 1, 0, 0.6313726, 1,
1.335655, 0.6293187, 0.8657155, 1, 0, 0.6235294, 1,
1.33737, -0.1596913, 4.822073, 1, 0, 0.6196079, 1,
1.340652, -1.250844, 2.092149, 1, 0, 0.6117647, 1,
1.342071, 1.165984, 0.1181578, 1, 0, 0.6078432, 1,
1.34815, 0.5577347, 1.355768, 1, 0, 0.6, 1,
1.361109, -0.9246496, 2.846493, 1, 0, 0.5921569, 1,
1.361373, 0.2519337, 2.102281, 1, 0, 0.5882353, 1,
1.363651, -0.46653, 2.923669, 1, 0, 0.5803922, 1,
1.364162, 0.7149231, 0.02597165, 1, 0, 0.5764706, 1,
1.376485, 0.07747155, -0.6319348, 1, 0, 0.5686275, 1,
1.38102, 0.555064, 1.212911, 1, 0, 0.5647059, 1,
1.392274, -1.183392, 1.732802, 1, 0, 0.5568628, 1,
1.410315, 0.5777313, 1.50475, 1, 0, 0.5529412, 1,
1.412949, -1.431955, 3.708017, 1, 0, 0.5450981, 1,
1.423856, 1.412556, 1.485161, 1, 0, 0.5411765, 1,
1.425458, 0.1093928, 2.249071, 1, 0, 0.5333334, 1,
1.435775, 0.3108262, 0.5680478, 1, 0, 0.5294118, 1,
1.450515, -0.9597667, 3.179704, 1, 0, 0.5215687, 1,
1.466777, 0.7191259, 0.9506073, 1, 0, 0.5176471, 1,
1.469697, 0.1102463, 2.166451, 1, 0, 0.509804, 1,
1.475147, 0.6365985, 0.09712031, 1, 0, 0.5058824, 1,
1.476432, 0.941123, 0.6598591, 1, 0, 0.4980392, 1,
1.477147, 0.01543758, 2.357548, 1, 0, 0.4901961, 1,
1.479033, -1.525083, 2.605639, 1, 0, 0.4862745, 1,
1.494943, -0.1074921, 1.527412, 1, 0, 0.4784314, 1,
1.499054, 1.697698, -0.05466149, 1, 0, 0.4745098, 1,
1.501878, 0.06744645, 2.573629, 1, 0, 0.4666667, 1,
1.50723, 0.5629765, 1.90259, 1, 0, 0.4627451, 1,
1.515465, -1.627467, 4.413811, 1, 0, 0.454902, 1,
1.529023, 1.561064, 1.933705, 1, 0, 0.4509804, 1,
1.550541, 0.2978596, 0.4959689, 1, 0, 0.4431373, 1,
1.555289, 0.8157606, -0.6496268, 1, 0, 0.4392157, 1,
1.556267, 1.616266, 0.6489694, 1, 0, 0.4313726, 1,
1.556421, 0.8402519, 0.7203381, 1, 0, 0.427451, 1,
1.559986, 0.6016189, 1.075882, 1, 0, 0.4196078, 1,
1.567256, -0.7023658, 0.873026, 1, 0, 0.4156863, 1,
1.5741, 1.285208, 1.228328, 1, 0, 0.4078431, 1,
1.57687, -0.6650458, 2.859708, 1, 0, 0.4039216, 1,
1.592825, 0.8840425, -0.265161, 1, 0, 0.3960784, 1,
1.601589, -1.253131, 3.287836, 1, 0, 0.3882353, 1,
1.61006, -0.0007196327, 2.870607, 1, 0, 0.3843137, 1,
1.635983, 0.2464493, 3.367927, 1, 0, 0.3764706, 1,
1.650669, 1.384304, 1.914365, 1, 0, 0.372549, 1,
1.661992, -0.2249215, 1.571519, 1, 0, 0.3647059, 1,
1.68407, 0.6761318, 0.6883418, 1, 0, 0.3607843, 1,
1.68621, -0.5288833, 1.428729, 1, 0, 0.3529412, 1,
1.690878, -0.6378466, 1.044205, 1, 0, 0.3490196, 1,
1.695526, -0.356545, 1.511799, 1, 0, 0.3411765, 1,
1.703356, 0.301044, 0.8139234, 1, 0, 0.3372549, 1,
1.713542, -0.5763235, 2.490247, 1, 0, 0.3294118, 1,
1.713873, 1.698741, 0.5676357, 1, 0, 0.3254902, 1,
1.716711, 1.522334, 1.127399, 1, 0, 0.3176471, 1,
1.730816, 1.650919, 1.220147, 1, 0, 0.3137255, 1,
1.756056, -0.2183776, 1.729028, 1, 0, 0.3058824, 1,
1.756092, 0.9852206, 2.183713, 1, 0, 0.2980392, 1,
1.757239, -0.2785428, 1.841905, 1, 0, 0.2941177, 1,
1.78194, 1.298543, 1.222229, 1, 0, 0.2862745, 1,
1.80497, 0.5160447, 1.656807, 1, 0, 0.282353, 1,
1.815472, -0.7313224, 2.37351, 1, 0, 0.2745098, 1,
1.817279, 0.3341218, 1.53194, 1, 0, 0.2705882, 1,
1.831767, -0.7864612, 0.7204098, 1, 0, 0.2627451, 1,
1.834279, 0.9595489, -0.30233, 1, 0, 0.2588235, 1,
1.834942, -0.0312934, 2.9105, 1, 0, 0.2509804, 1,
1.840938, 0.8575612, 0.2635227, 1, 0, 0.2470588, 1,
1.855187, 0.4714956, 0.5411822, 1, 0, 0.2392157, 1,
1.864725, 0.68624, 1.492684, 1, 0, 0.2352941, 1,
1.871022, -1.008968, 3.651839, 1, 0, 0.227451, 1,
1.887503, 0.7775807, 1.4317, 1, 0, 0.2235294, 1,
1.905821, -0.6116923, 1.437208, 1, 0, 0.2156863, 1,
1.917545, 0.0234507, 1.533159, 1, 0, 0.2117647, 1,
1.922029, -0.8420859, 3.101275, 1, 0, 0.2039216, 1,
1.928469, -0.2205075, 2.611328, 1, 0, 0.1960784, 1,
1.92878, 0.9073497, 2.334229, 1, 0, 0.1921569, 1,
1.939024, 0.7541835, 2.019292, 1, 0, 0.1843137, 1,
1.946633, 0.1644408, 3.468377, 1, 0, 0.1803922, 1,
1.955137, -0.4817281, 1.95408, 1, 0, 0.172549, 1,
1.957636, -1.124811, 3.492722, 1, 0, 0.1686275, 1,
1.958352, 0.608243, 2.317535, 1, 0, 0.1607843, 1,
1.967588, -0.6446075, 2.35165, 1, 0, 0.1568628, 1,
1.996212, -0.2807089, 1.408085, 1, 0, 0.1490196, 1,
2.028014, -0.6492409, 1.925704, 1, 0, 0.145098, 1,
2.042768, -1.041003, 1.976974, 1, 0, 0.1372549, 1,
2.051931, -1.760068, 2.768025, 1, 0, 0.1333333, 1,
2.111141, 0.5382867, 1.355987, 1, 0, 0.1254902, 1,
2.114184, 0.6777464, 1.212153, 1, 0, 0.1215686, 1,
2.12582, -0.8680827, 1.246339, 1, 0, 0.1137255, 1,
2.134171, 1.120049, 1.265107, 1, 0, 0.1098039, 1,
2.213429, 1.787704, 1.765546, 1, 0, 0.1019608, 1,
2.285017, 2.130199, 0.9867161, 1, 0, 0.09411765, 1,
2.287932, 0.8820063, 1.77587, 1, 0, 0.09019608, 1,
2.350192, -0.07099835, -0.1029796, 1, 0, 0.08235294, 1,
2.351043, -0.9771798, -0.6959256, 1, 0, 0.07843138, 1,
2.385801, -0.6659109, 4.114527, 1, 0, 0.07058824, 1,
2.501139, -0.8625475, 1.16721, 1, 0, 0.06666667, 1,
2.509887, 1.797901, 0.1982605, 1, 0, 0.05882353, 1,
2.628288, -0.1731208, 1.362031, 1, 0, 0.05490196, 1,
2.651139, 0.3901513, 1.953151, 1, 0, 0.04705882, 1,
2.710875, -0.01391355, 0.5055527, 1, 0, 0.04313726, 1,
2.712208, -1.106749, 2.603721, 1, 0, 0.03529412, 1,
2.741625, -0.258387, 1.504504, 1, 0, 0.03137255, 1,
2.916211, -0.1317059, -0.8924674, 1, 0, 0.02352941, 1,
2.95927, -0.02008719, 2.513496, 1, 0, 0.01960784, 1,
3.143651, 0.2083156, 1.287182, 1, 0, 0.01176471, 1,
3.573027, -0.791927, 0.7847229, 1, 0, 0.007843138, 1
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
0.4067909, -3.734463, -6.89417, 0, -0.5, 0.5, 0.5,
0.4067909, -3.734463, -6.89417, 1, -0.5, 0.5, 0.5,
0.4067909, -3.734463, -6.89417, 1, 1.5, 0.5, 0.5,
0.4067909, -3.734463, -6.89417, 0, 1.5, 0.5, 0.5
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
-3.832799, 0.2274342, -6.89417, 0, -0.5, 0.5, 0.5,
-3.832799, 0.2274342, -6.89417, 1, -0.5, 0.5, 0.5,
-3.832799, 0.2274342, -6.89417, 1, 1.5, 0.5, 0.5,
-3.832799, 0.2274342, -6.89417, 0, 1.5, 0.5, 0.5
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
-3.832799, -3.734463, 0.1853907, 0, -0.5, 0.5, 0.5,
-3.832799, -3.734463, 0.1853907, 1, -0.5, 0.5, 0.5,
-3.832799, -3.734463, 0.1853907, 1, 1.5, 0.5, 0.5,
-3.832799, -3.734463, 0.1853907, 0, 1.5, 0.5, 0.5
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
-2, -2.820179, -5.260425,
3, -2.820179, -5.260425,
-2, -2.820179, -5.260425,
-2, -2.972559, -5.532716,
-1, -2.820179, -5.260425,
-1, -2.972559, -5.532716,
0, -2.820179, -5.260425,
0, -2.972559, -5.532716,
1, -2.820179, -5.260425,
1, -2.972559, -5.532716,
2, -2.820179, -5.260425,
2, -2.972559, -5.532716,
3, -2.820179, -5.260425,
3, -2.972559, -5.532716
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
-2, -3.277321, -6.077297, 0, -0.5, 0.5, 0.5,
-2, -3.277321, -6.077297, 1, -0.5, 0.5, 0.5,
-2, -3.277321, -6.077297, 1, 1.5, 0.5, 0.5,
-2, -3.277321, -6.077297, 0, 1.5, 0.5, 0.5,
-1, -3.277321, -6.077297, 0, -0.5, 0.5, 0.5,
-1, -3.277321, -6.077297, 1, -0.5, 0.5, 0.5,
-1, -3.277321, -6.077297, 1, 1.5, 0.5, 0.5,
-1, -3.277321, -6.077297, 0, 1.5, 0.5, 0.5,
0, -3.277321, -6.077297, 0, -0.5, 0.5, 0.5,
0, -3.277321, -6.077297, 1, -0.5, 0.5, 0.5,
0, -3.277321, -6.077297, 1, 1.5, 0.5, 0.5,
0, -3.277321, -6.077297, 0, 1.5, 0.5, 0.5,
1, -3.277321, -6.077297, 0, -0.5, 0.5, 0.5,
1, -3.277321, -6.077297, 1, -0.5, 0.5, 0.5,
1, -3.277321, -6.077297, 1, 1.5, 0.5, 0.5,
1, -3.277321, -6.077297, 0, 1.5, 0.5, 0.5,
2, -3.277321, -6.077297, 0, -0.5, 0.5, 0.5,
2, -3.277321, -6.077297, 1, -0.5, 0.5, 0.5,
2, -3.277321, -6.077297, 1, 1.5, 0.5, 0.5,
2, -3.277321, -6.077297, 0, 1.5, 0.5, 0.5,
3, -3.277321, -6.077297, 0, -0.5, 0.5, 0.5,
3, -3.277321, -6.077297, 1, -0.5, 0.5, 0.5,
3, -3.277321, -6.077297, 1, 1.5, 0.5, 0.5,
3, -3.277321, -6.077297, 0, 1.5, 0.5, 0.5
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
-2.854432, -2, -5.260425,
-2.854432, 3, -5.260425,
-2.854432, -2, -5.260425,
-3.017493, -2, -5.532716,
-2.854432, -1, -5.260425,
-3.017493, -1, -5.532716,
-2.854432, 0, -5.260425,
-3.017493, 0, -5.532716,
-2.854432, 1, -5.260425,
-3.017493, 1, -5.532716,
-2.854432, 2, -5.260425,
-3.017493, 2, -5.532716,
-2.854432, 3, -5.260425,
-3.017493, 3, -5.532716
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
-3.343616, -2, -6.077297, 0, -0.5, 0.5, 0.5,
-3.343616, -2, -6.077297, 1, -0.5, 0.5, 0.5,
-3.343616, -2, -6.077297, 1, 1.5, 0.5, 0.5,
-3.343616, -2, -6.077297, 0, 1.5, 0.5, 0.5,
-3.343616, -1, -6.077297, 0, -0.5, 0.5, 0.5,
-3.343616, -1, -6.077297, 1, -0.5, 0.5, 0.5,
-3.343616, -1, -6.077297, 1, 1.5, 0.5, 0.5,
-3.343616, -1, -6.077297, 0, 1.5, 0.5, 0.5,
-3.343616, 0, -6.077297, 0, -0.5, 0.5, 0.5,
-3.343616, 0, -6.077297, 1, -0.5, 0.5, 0.5,
-3.343616, 0, -6.077297, 1, 1.5, 0.5, 0.5,
-3.343616, 0, -6.077297, 0, 1.5, 0.5, 0.5,
-3.343616, 1, -6.077297, 0, -0.5, 0.5, 0.5,
-3.343616, 1, -6.077297, 1, -0.5, 0.5, 0.5,
-3.343616, 1, -6.077297, 1, 1.5, 0.5, 0.5,
-3.343616, 1, -6.077297, 0, 1.5, 0.5, 0.5,
-3.343616, 2, -6.077297, 0, -0.5, 0.5, 0.5,
-3.343616, 2, -6.077297, 1, -0.5, 0.5, 0.5,
-3.343616, 2, -6.077297, 1, 1.5, 0.5, 0.5,
-3.343616, 2, -6.077297, 0, 1.5, 0.5, 0.5,
-3.343616, 3, -6.077297, 0, -0.5, 0.5, 0.5,
-3.343616, 3, -6.077297, 1, -0.5, 0.5, 0.5,
-3.343616, 3, -6.077297, 1, 1.5, 0.5, 0.5,
-3.343616, 3, -6.077297, 0, 1.5, 0.5, 0.5
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
-2.854432, -2.820179, -4,
-2.854432, -2.820179, 4,
-2.854432, -2.820179, -4,
-3.017493, -2.972559, -4,
-2.854432, -2.820179, -2,
-3.017493, -2.972559, -2,
-2.854432, -2.820179, 0,
-3.017493, -2.972559, 0,
-2.854432, -2.820179, 2,
-3.017493, -2.972559, 2,
-2.854432, -2.820179, 4,
-3.017493, -2.972559, 4
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
-3.343616, -3.277321, -4, 0, -0.5, 0.5, 0.5,
-3.343616, -3.277321, -4, 1, -0.5, 0.5, 0.5,
-3.343616, -3.277321, -4, 1, 1.5, 0.5, 0.5,
-3.343616, -3.277321, -4, 0, 1.5, 0.5, 0.5,
-3.343616, -3.277321, -2, 0, -0.5, 0.5, 0.5,
-3.343616, -3.277321, -2, 1, -0.5, 0.5, 0.5,
-3.343616, -3.277321, -2, 1, 1.5, 0.5, 0.5,
-3.343616, -3.277321, -2, 0, 1.5, 0.5, 0.5,
-3.343616, -3.277321, 0, 0, -0.5, 0.5, 0.5,
-3.343616, -3.277321, 0, 1, -0.5, 0.5, 0.5,
-3.343616, -3.277321, 0, 1, 1.5, 0.5, 0.5,
-3.343616, -3.277321, 0, 0, 1.5, 0.5, 0.5,
-3.343616, -3.277321, 2, 0, -0.5, 0.5, 0.5,
-3.343616, -3.277321, 2, 1, -0.5, 0.5, 0.5,
-3.343616, -3.277321, 2, 1, 1.5, 0.5, 0.5,
-3.343616, -3.277321, 2, 0, 1.5, 0.5, 0.5,
-3.343616, -3.277321, 4, 0, -0.5, 0.5, 0.5,
-3.343616, -3.277321, 4, 1, -0.5, 0.5, 0.5,
-3.343616, -3.277321, 4, 1, 1.5, 0.5, 0.5,
-3.343616, -3.277321, 4, 0, 1.5, 0.5, 0.5
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
-2.854432, -2.820179, -5.260425,
-2.854432, 3.275047, -5.260425,
-2.854432, -2.820179, 5.631207,
-2.854432, 3.275047, 5.631207,
-2.854432, -2.820179, -5.260425,
-2.854432, -2.820179, 5.631207,
-2.854432, 3.275047, -5.260425,
-2.854432, 3.275047, 5.631207,
-2.854432, -2.820179, -5.260425,
3.668014, -2.820179, -5.260425,
-2.854432, -2.820179, 5.631207,
3.668014, -2.820179, 5.631207,
-2.854432, 3.275047, -5.260425,
3.668014, 3.275047, -5.260425,
-2.854432, 3.275047, 5.631207,
3.668014, 3.275047, 5.631207,
3.668014, -2.820179, -5.260425,
3.668014, 3.275047, -5.260425,
3.668014, -2.820179, 5.631207,
3.668014, 3.275047, 5.631207,
3.668014, -2.820179, -5.260425,
3.668014, -2.820179, 5.631207,
3.668014, 3.275047, -5.260425,
3.668014, 3.275047, 5.631207
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
var radius = 7.519874;
var distance = 33.45677;
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
mvMatrix.translate( -0.4067909, -0.2274342, -0.1853907 );
mvMatrix.scale( 1.246562, 1.333935, 0.746503 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.45677);
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
pyrimidine-2-sulfona<-read.table("pyrimidine-2-sulfona.xyz")
```

```
## Error in read.table("pyrimidine-2-sulfona.xyz"): no lines available in input
```

```r
x<-pyrimidine-2-sulfona$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyrimidine' not found
```

```r
y<-pyrimidine-2-sulfona$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyrimidine' not found
```

```r
z<-pyrimidine-2-sulfona$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyrimidine' not found
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
-2.759445, -1.297287, -2.169767, 0, 0, 1, 1, 1,
-2.743449, 0.4511484, -1.273752, 1, 0, 0, 1, 1,
-2.707215, -0.0003986278, -1.485179, 1, 0, 0, 1, 1,
-2.653344, -1.347904, -3.418394, 1, 0, 0, 1, 1,
-2.596264, 0.9761801, -2.002949, 1, 0, 0, 1, 1,
-2.557678, 0.7474353, -0.0855332, 1, 0, 0, 1, 1,
-2.543948, -0.8708753, -3.613594, 0, 0, 0, 1, 1,
-2.516931, 1.108536, 0.4461175, 0, 0, 0, 1, 1,
-2.486464, -0.0881008, -0.5142435, 0, 0, 0, 1, 1,
-2.426891, -1.783508, -2.101739, 0, 0, 0, 1, 1,
-2.412233, -0.0385931, -1.011349, 0, 0, 0, 1, 1,
-2.370553, -0.7901392, -2.884887, 0, 0, 0, 1, 1,
-2.35863, -1.150734, -1.414451, 0, 0, 0, 1, 1,
-2.258207, -1.466272, -2.003597, 1, 1, 1, 1, 1,
-2.252484, -0.1247212, -0.9081849, 1, 1, 1, 1, 1,
-2.246545, -0.2971706, -2.550364, 1, 1, 1, 1, 1,
-2.238907, -2.116004, -2.172014, 1, 1, 1, 1, 1,
-2.226964, -0.3935511, -1.481348, 1, 1, 1, 1, 1,
-2.216295, -0.6138631, -3.370766, 1, 1, 1, 1, 1,
-2.208716, 0.3724806, -2.045988, 1, 1, 1, 1, 1,
-2.147407, -1.585125, -2.589333, 1, 1, 1, 1, 1,
-2.146102, -0.754102, 0.4582495, 1, 1, 1, 1, 1,
-2.132227, -0.06574962, -1.438306, 1, 1, 1, 1, 1,
-2.129712, -0.6141995, -1.807964, 1, 1, 1, 1, 1,
-2.119773, 0.1794486, -1.30707, 1, 1, 1, 1, 1,
-2.101867, -1.512738, -1.05632, 1, 1, 1, 1, 1,
-2.092101, 1.997205, 0.7009267, 1, 1, 1, 1, 1,
-2.083794, -1.539445, -1.608002, 1, 1, 1, 1, 1,
-2.039685, 0.04529228, -0.5910673, 0, 0, 1, 1, 1,
-2.039651, 0.5114935, -1.29595, 1, 0, 0, 1, 1,
-2.028244, -0.2080434, -0.6370842, 1, 0, 0, 1, 1,
-2.015729, 1.07196, -2.801513, 1, 0, 0, 1, 1,
-2.013211, -1.291654, -2.792747, 1, 0, 0, 1, 1,
-2.008466, -0.6797624, -2.033147, 1, 0, 0, 1, 1,
-1.983161, -0.6977808, -0.4524648, 0, 0, 0, 1, 1,
-1.966869, 0.9714754, 2.135523, 0, 0, 0, 1, 1,
-1.965629, -1.641952, -3.847908, 0, 0, 0, 1, 1,
-1.943784, -0.2297922, -3.5587, 0, 0, 0, 1, 1,
-1.938259, -0.5147247, 0.5311256, 0, 0, 0, 1, 1,
-1.920357, -0.8048382, -2.122339, 0, 0, 0, 1, 1,
-1.915105, -1.122526, -1.799602, 0, 0, 0, 1, 1,
-1.909017, 1.460061, 1.222646, 1, 1, 1, 1, 1,
-1.883826, -0.4533275, -1.815089, 1, 1, 1, 1, 1,
-1.88075, 0.2818206, -1.633726, 1, 1, 1, 1, 1,
-1.864576, -0.3330046, -3.119885, 1, 1, 1, 1, 1,
-1.857738, -2.001549, -1.743746, 1, 1, 1, 1, 1,
-1.856785, -1.251732, -3.034139, 1, 1, 1, 1, 1,
-1.852122, -0.2087382, -0.6330509, 1, 1, 1, 1, 1,
-1.823588, 1.055451, -0.2378718, 1, 1, 1, 1, 1,
-1.801845, -0.3612759, -2.649356, 1, 1, 1, 1, 1,
-1.791676, 1.36245, -0.217482, 1, 1, 1, 1, 1,
-1.785504, 0.3564649, -0.6613283, 1, 1, 1, 1, 1,
-1.771742, 0.5570171, -1.046305, 1, 1, 1, 1, 1,
-1.767426, -0.634162, -1.904002, 1, 1, 1, 1, 1,
-1.753639, -1.51468, -1.597856, 1, 1, 1, 1, 1,
-1.74918, 0.2453151, -0.484182, 1, 1, 1, 1, 1,
-1.734453, -1.375851, -1.798413, 0, 0, 1, 1, 1,
-1.724722, 0.757989, -0.1979161, 1, 0, 0, 1, 1,
-1.722734, 0.3300395, -1.163425, 1, 0, 0, 1, 1,
-1.71717, 0.4913423, -1.633453, 1, 0, 0, 1, 1,
-1.690996, 0.8727136, -1.635811, 1, 0, 0, 1, 1,
-1.68765, -0.5706932, -3.475495, 1, 0, 0, 1, 1,
-1.654002, -0.7490755, -1.07401, 0, 0, 0, 1, 1,
-1.645937, 0.6364897, 0.2066412, 0, 0, 0, 1, 1,
-1.640898, -1.107751, -1.768514, 0, 0, 0, 1, 1,
-1.578535, 0.03972954, -1.432469, 0, 0, 0, 1, 1,
-1.571602, 0.7154871, -1.170292, 0, 0, 0, 1, 1,
-1.561933, 0.01138288, -2.011481, 0, 0, 0, 1, 1,
-1.560234, 0.442842, -0.8960143, 0, 0, 0, 1, 1,
-1.553664, 0.5362167, -0.460103, 1, 1, 1, 1, 1,
-1.54489, 1.250815, -0.1051493, 1, 1, 1, 1, 1,
-1.544716, -0.3400635, -2.452161, 1, 1, 1, 1, 1,
-1.535451, -0.08676822, -1.400865, 1, 1, 1, 1, 1,
-1.522773, 0.07464239, -0.2088278, 1, 1, 1, 1, 1,
-1.505627, -0.004737612, -2.082972, 1, 1, 1, 1, 1,
-1.483602, 0.3685028, -0.4121071, 1, 1, 1, 1, 1,
-1.481247, -1.603172, -3.320126, 1, 1, 1, 1, 1,
-1.469416, 0.9910642, 0.8089947, 1, 1, 1, 1, 1,
-1.465415, -1.323756, -2.491305, 1, 1, 1, 1, 1,
-1.461254, -0.3775046, -0.8576127, 1, 1, 1, 1, 1,
-1.457989, 0.07316828, -2.777352, 1, 1, 1, 1, 1,
-1.432764, 0.6187841, -2.344475, 1, 1, 1, 1, 1,
-1.429313, 0.6863555, -1.322619, 1, 1, 1, 1, 1,
-1.424571, 1.197256, -2.619673, 1, 1, 1, 1, 1,
-1.420603, -0.7085265, -3.170891, 0, 0, 1, 1, 1,
-1.40936, 0.7464006, -2.577427, 1, 0, 0, 1, 1,
-1.400763, -2.731413, -2.33531, 1, 0, 0, 1, 1,
-1.398906, -0.7371865, -1.308887, 1, 0, 0, 1, 1,
-1.395495, 1.584567, -0.7085048, 1, 0, 0, 1, 1,
-1.384228, 0.8860725, -0.01771799, 1, 0, 0, 1, 1,
-1.380205, -0.7256275, -1.350851, 0, 0, 0, 1, 1,
-1.372855, 0.3941587, -0.07726626, 0, 0, 0, 1, 1,
-1.366195, -0.02492832, -1.243398, 0, 0, 0, 1, 1,
-1.361654, -1.1556, -1.614685, 0, 0, 0, 1, 1,
-1.358372, 1.028724, -0.221453, 0, 0, 0, 1, 1,
-1.354781, -0.1571911, -3.651234, 0, 0, 0, 1, 1,
-1.346277, 0.4447765, 0.6536243, 0, 0, 0, 1, 1,
-1.343806, 0.6947591, -1.564174, 1, 1, 1, 1, 1,
-1.343168, -0.8399042, -2.107555, 1, 1, 1, 1, 1,
-1.342329, -1.215177, -2.69214, 1, 1, 1, 1, 1,
-1.327174, -0.498786, -0.2577442, 1, 1, 1, 1, 1,
-1.321817, -0.07165398, -1.395959, 1, 1, 1, 1, 1,
-1.321245, 0.6554205, -1.687283, 1, 1, 1, 1, 1,
-1.314595, -1.467018, -4.053824, 1, 1, 1, 1, 1,
-1.307725, 1.962224, -2.014176, 1, 1, 1, 1, 1,
-1.305226, 1.345221, -2.684364, 1, 1, 1, 1, 1,
-1.301443, -0.7969658, -1.953293, 1, 1, 1, 1, 1,
-1.300334, 0.9072901, -0.242774, 1, 1, 1, 1, 1,
-1.298041, -0.820334, -2.729284, 1, 1, 1, 1, 1,
-1.297432, 1.398769, -1.949972, 1, 1, 1, 1, 1,
-1.296961, -0.109004, -0.6316966, 1, 1, 1, 1, 1,
-1.293953, 0.1769575, -1.924898, 1, 1, 1, 1, 1,
-1.291344, -0.7390891, -0.8484557, 0, 0, 1, 1, 1,
-1.286933, -0.02703543, -2.027228, 1, 0, 0, 1, 1,
-1.284844, 0.1281549, -0.4965416, 1, 0, 0, 1, 1,
-1.272337, 0.01931512, -2.903239, 1, 0, 0, 1, 1,
-1.270371, -0.3181079, 0.08465669, 1, 0, 0, 1, 1,
-1.258851, 0.02510797, -1.179943, 1, 0, 0, 1, 1,
-1.248003, -1.39839, -2.96376, 0, 0, 0, 1, 1,
-1.247556, 0.4213577, -0.9660816, 0, 0, 0, 1, 1,
-1.240204, 0.5969778, -0.7076128, 0, 0, 0, 1, 1,
-1.22348, 0.3423463, -1.045406, 0, 0, 0, 1, 1,
-1.210321, 0.07958224, -2.191622, 0, 0, 0, 1, 1,
-1.194775, 1.099844, -0.1630133, 0, 0, 0, 1, 1,
-1.193709, -0.511807, -3.211923, 0, 0, 0, 1, 1,
-1.176035, 1.124428, -2.09064, 1, 1, 1, 1, 1,
-1.173444, -0.960669, -2.728223, 1, 1, 1, 1, 1,
-1.171401, 0.2502689, -0.1029275, 1, 1, 1, 1, 1,
-1.170076, 0.05179132, -2.414561, 1, 1, 1, 1, 1,
-1.16956, -2.145144, -2.092329, 1, 1, 1, 1, 1,
-1.168789, 0.3660837, -0.7676207, 1, 1, 1, 1, 1,
-1.163792, 0.9464543, 2.139282, 1, 1, 1, 1, 1,
-1.162776, -0.9686824, -1.061315, 1, 1, 1, 1, 1,
-1.156959, 0.6445487, 0.8588526, 1, 1, 1, 1, 1,
-1.148536, -0.4778311, -1.793851, 1, 1, 1, 1, 1,
-1.145894, -1.883302, -0.7765955, 1, 1, 1, 1, 1,
-1.127285, -0.6340055, -2.096667, 1, 1, 1, 1, 1,
-1.124475, -1.051782, -2.125558, 1, 1, 1, 1, 1,
-1.123481, -1.084086, -3.658022, 1, 1, 1, 1, 1,
-1.111746, 1.552223, -1.016487, 1, 1, 1, 1, 1,
-1.105758, -0.7284544, -1.147721, 0, 0, 1, 1, 1,
-1.101462, -0.05081904, -1.052288, 1, 0, 0, 1, 1,
-1.096298, 1.816266, -0.8862952, 1, 0, 0, 1, 1,
-1.093927, -0.2908611, -1.311361, 1, 0, 0, 1, 1,
-1.091842, -0.5942472, -1.358365, 1, 0, 0, 1, 1,
-1.088042, 0.2773604, -2.538216, 1, 0, 0, 1, 1,
-1.079569, -2.445203, -3.530495, 0, 0, 0, 1, 1,
-1.070976, -0.04816823, -3.292625, 0, 0, 0, 1, 1,
-1.066632, -0.5971401, -1.377219, 0, 0, 0, 1, 1,
-1.057336, -1.08481, -1.941302, 0, 0, 0, 1, 1,
-1.056703, 0.6567138, -0.5798175, 0, 0, 0, 1, 1,
-1.047685, 1.037735, -0.8046314, 0, 0, 0, 1, 1,
-1.046615, -0.6387413, -1.035374, 0, 0, 0, 1, 1,
-1.041696, -0.5762768, -2.592353, 1, 1, 1, 1, 1,
-1.036083, 0.2654792, 0.07151706, 1, 1, 1, 1, 1,
-1.034371, -0.6637585, -0.8000697, 1, 1, 1, 1, 1,
-1.034138, -0.207922, -1.755856, 1, 1, 1, 1, 1,
-1.031689, -0.08495735, -2.489055, 1, 1, 1, 1, 1,
-1.031049, 1.994969, -0.6473356, 1, 1, 1, 1, 1,
-1.030705, -0.2807797, -2.104702, 1, 1, 1, 1, 1,
-1.027142, -0.4291362, -3.657043, 1, 1, 1, 1, 1,
-1.026689, 1.1016, -0.8508603, 1, 1, 1, 1, 1,
-1.02367, -0.6019335, -2.191117, 1, 1, 1, 1, 1,
-1.019349, -1.059806, -2.123729, 1, 1, 1, 1, 1,
-1.011663, 2.83325, -0.4819059, 1, 1, 1, 1, 1,
-1.011049, 0.5024384, -0.1680583, 1, 1, 1, 1, 1,
-1.007389, -0.06470408, -2.005231, 1, 1, 1, 1, 1,
-1.004626, -1.155118, -2.426106, 1, 1, 1, 1, 1,
-1.002481, 0.8511469, -1.042453, 0, 0, 1, 1, 1,
-0.9965726, -0.8896446, -4.520519, 1, 0, 0, 1, 1,
-0.992917, -2.425865, -3.738325, 1, 0, 0, 1, 1,
-0.9855185, 0.2465156, -3.419714, 1, 0, 0, 1, 1,
-0.9843157, -0.640235, -2.042682, 1, 0, 0, 1, 1,
-0.9839164, -1.306295, -2.716391, 1, 0, 0, 1, 1,
-0.9823676, -0.1394025, -2.498503, 0, 0, 0, 1, 1,
-0.9789677, -0.1873741, -0.1616368, 0, 0, 0, 1, 1,
-0.9653835, -0.3894665, -3.051804, 0, 0, 0, 1, 1,
-0.963642, 0.7287387, -0.3768057, 0, 0, 0, 1, 1,
-0.9633935, 1.624045, -0.2843799, 0, 0, 0, 1, 1,
-0.9545921, 0.2482631, -2.73368, 0, 0, 0, 1, 1,
-0.9533252, -0.443092, -1.126513, 0, 0, 0, 1, 1,
-0.9523398, -1.458538, -3.047599, 1, 1, 1, 1, 1,
-0.9482769, 0.5271879, -0.6385848, 1, 1, 1, 1, 1,
-0.9479616, -0.3525844, -2.912097, 1, 1, 1, 1, 1,
-0.9432944, 1.028813, -1.789608, 1, 1, 1, 1, 1,
-0.9238483, -0.05534579, -1.10076, 1, 1, 1, 1, 1,
-0.9237735, -0.6523998, -2.102558, 1, 1, 1, 1, 1,
-0.9211952, -0.6519018, -1.947603, 1, 1, 1, 1, 1,
-0.9135581, 0.7214372, -0.4647302, 1, 1, 1, 1, 1,
-0.9122183, -0.915158, -2.19328, 1, 1, 1, 1, 1,
-0.9111871, 1.88443, -0.9328439, 1, 1, 1, 1, 1,
-0.905939, -0.5447787, -1.547056, 1, 1, 1, 1, 1,
-0.9046295, 1.128764, -1.915307, 1, 1, 1, 1, 1,
-0.9044559, 0.05556719, -0.5961512, 1, 1, 1, 1, 1,
-0.8996933, 1.538512, -0.7580584, 1, 1, 1, 1, 1,
-0.899442, 0.6495692, -1.122268, 1, 1, 1, 1, 1,
-0.8973937, 0.2335236, -0.3014971, 0, 0, 1, 1, 1,
-0.8967582, -0.4560378, -0.6749433, 1, 0, 0, 1, 1,
-0.8965014, 1.49289, 0.2341169, 1, 0, 0, 1, 1,
-0.8956927, 1.671225, 0.5229567, 1, 0, 0, 1, 1,
-0.8920828, -0.4712977, -1.398679, 1, 0, 0, 1, 1,
-0.8914374, -0.7680256, -2.087383, 1, 0, 0, 1, 1,
-0.8906672, -1.993017, -3.202595, 0, 0, 0, 1, 1,
-0.8802754, -1.111143, -3.184737, 0, 0, 0, 1, 1,
-0.8798333, 1.631148, 0.1702553, 0, 0, 0, 1, 1,
-0.8785545, 1.557555, 0.35803, 0, 0, 0, 1, 1,
-0.8756062, 1.878519, -2.245395, 0, 0, 0, 1, 1,
-0.8573305, -0.224935, -1.338435, 0, 0, 0, 1, 1,
-0.852111, -0.7425481, -4.295518, 0, 0, 0, 1, 1,
-0.8491554, -0.1278368, -2.304207, 1, 1, 1, 1, 1,
-0.8416009, 1.537099, -2.38459, 1, 1, 1, 1, 1,
-0.8362503, 1.196572, -0.190796, 1, 1, 1, 1, 1,
-0.8239287, 0.2420293, 1.173767, 1, 1, 1, 1, 1,
-0.8197288, -1.839511, -2.912396, 1, 1, 1, 1, 1,
-0.8193329, -0.1082711, -1.976452, 1, 1, 1, 1, 1,
-0.8180372, 0.3176991, -1.503794, 1, 1, 1, 1, 1,
-0.8145843, -1.068774, -2.400256, 1, 1, 1, 1, 1,
-0.8123268, -1.507796, -2.311359, 1, 1, 1, 1, 1,
-0.8116989, 0.4897207, -1.345193, 1, 1, 1, 1, 1,
-0.8071879, -2.020073, -2.71697, 1, 1, 1, 1, 1,
-0.8053527, 0.2220331, -2.005865, 1, 1, 1, 1, 1,
-0.7971984, 1.695796, 0.013114, 1, 1, 1, 1, 1,
-0.7959735, -0.5118734, -2.309659, 1, 1, 1, 1, 1,
-0.7949349, -0.3592665, -0.9248155, 1, 1, 1, 1, 1,
-0.7889714, -1.889652, -3.601165, 0, 0, 1, 1, 1,
-0.7703363, -0.8936962, -1.776967, 1, 0, 0, 1, 1,
-0.768423, -0.898869, -3.048544, 1, 0, 0, 1, 1,
-0.7678623, -0.500311, -2.657423, 1, 0, 0, 1, 1,
-0.7675031, 0.6039966, -0.569623, 1, 0, 0, 1, 1,
-0.7542347, -0.6822371, -3.761326, 1, 0, 0, 1, 1,
-0.7541087, 0.7269056, 0.5387051, 0, 0, 0, 1, 1,
-0.7530615, 0.8603734, -0.5267954, 0, 0, 0, 1, 1,
-0.7519382, 0.05509564, -0.3608576, 0, 0, 0, 1, 1,
-0.7491441, 0.8166631, -1.001569, 0, 0, 0, 1, 1,
-0.7477207, 0.1874523, -0.7280158, 0, 0, 0, 1, 1,
-0.7469651, 0.6057057, -0.06415316, 0, 0, 0, 1, 1,
-0.7439095, 0.9524621, -1.372334, 0, 0, 0, 1, 1,
-0.743614, -0.8109033, -0.6756509, 1, 1, 1, 1, 1,
-0.7430072, -1.196483, -2.671996, 1, 1, 1, 1, 1,
-0.7413211, -0.5154245, -1.845123, 1, 1, 1, 1, 1,
-0.7355576, 0.3748838, -1.272504, 1, 1, 1, 1, 1,
-0.7348066, -1.074034, -2.300626, 1, 1, 1, 1, 1,
-0.7337675, 0.1968089, -0.2113014, 1, 1, 1, 1, 1,
-0.7322822, 0.009728381, -3.167547, 1, 1, 1, 1, 1,
-0.7278602, -1.144055, -3.277502, 1, 1, 1, 1, 1,
-0.7254099, 0.9599822, -1.04847, 1, 1, 1, 1, 1,
-0.7242851, -2.273724, -3.695092, 1, 1, 1, 1, 1,
-0.7236397, -0.3468421, -1.647604, 1, 1, 1, 1, 1,
-0.7194694, -0.6168864, -1.717211, 1, 1, 1, 1, 1,
-0.7152316, 0.8593174, -1.95311, 1, 1, 1, 1, 1,
-0.7151948, -0.4899104, -3.539592, 1, 1, 1, 1, 1,
-0.7151061, 0.03232355, -1.479802, 1, 1, 1, 1, 1,
-0.7136159, -1.547777, -1.55062, 0, 0, 1, 1, 1,
-0.7111151, -0.2811635, 0.1433186, 1, 0, 0, 1, 1,
-0.7095297, 0.4843139, -2.484796, 1, 0, 0, 1, 1,
-0.7063012, -0.2319257, -2.91753, 1, 0, 0, 1, 1,
-0.7019172, -1.666208, -3.357213, 1, 0, 0, 1, 1,
-0.7015609, -0.4644459, -2.602732, 1, 0, 0, 1, 1,
-0.7001829, 0.4357898, 1.567643, 0, 0, 0, 1, 1,
-0.6982204, 0.8286172, -1.375436, 0, 0, 0, 1, 1,
-0.6949856, 0.1632511, 1.302363, 0, 0, 0, 1, 1,
-0.6884181, -0.239417, -2.830712, 0, 0, 0, 1, 1,
-0.6832888, -0.2963434, -2.368535, 0, 0, 0, 1, 1,
-0.6814005, 0.2556891, -2.085894, 0, 0, 0, 1, 1,
-0.6805444, 0.2847188, -2.294324, 0, 0, 0, 1, 1,
-0.6801101, 0.02675382, -3.261101, 1, 1, 1, 1, 1,
-0.6777394, -0.4814675, -2.910278, 1, 1, 1, 1, 1,
-0.6737046, -0.1298023, -1.105732, 1, 1, 1, 1, 1,
-0.6652613, 0.06330854, -1.528828, 1, 1, 1, 1, 1,
-0.6646351, 0.1932219, -0.7248782, 1, 1, 1, 1, 1,
-0.6612844, 0.7180641, -0.3704693, 1, 1, 1, 1, 1,
-0.6538635, 0.2430513, -0.2521969, 1, 1, 1, 1, 1,
-0.6518039, -1.142772, -3.319663, 1, 1, 1, 1, 1,
-0.6337214, 0.9801859, -0.3607997, 1, 1, 1, 1, 1,
-0.63148, 0.4794614, -1.4721, 1, 1, 1, 1, 1,
-0.6312463, 0.5004658, -1.715365, 1, 1, 1, 1, 1,
-0.6310034, -0.3154937, -1.156851, 1, 1, 1, 1, 1,
-0.6307679, -0.5225436, -2.659015, 1, 1, 1, 1, 1,
-0.6218095, -0.04333158, -0.8500103, 1, 1, 1, 1, 1,
-0.6143208, 0.2206083, -1.726427, 1, 1, 1, 1, 1,
-0.611299, 0.9913815, 0.3010753, 0, 0, 1, 1, 1,
-0.6044587, -0.2267402, -3.253545, 1, 0, 0, 1, 1,
-0.6037496, 0.7871456, -1.349328, 1, 0, 0, 1, 1,
-0.6031885, 0.07896525, -1.194571, 1, 0, 0, 1, 1,
-0.6006305, 0.2105131, -0.9913009, 1, 0, 0, 1, 1,
-0.5998788, 2.707254, 0.05547722, 1, 0, 0, 1, 1,
-0.5995668, 0.08958124, -0.6292832, 0, 0, 0, 1, 1,
-0.5978971, -1.68914, -3.429876, 0, 0, 0, 1, 1,
-0.5978724, 1.190241, -2.502722, 0, 0, 0, 1, 1,
-0.5918026, 0.3620399, -1.504753, 0, 0, 0, 1, 1,
-0.5913527, 1.929431, 0.4467945, 0, 0, 0, 1, 1,
-0.5904224, 0.2889727, -1.657827, 0, 0, 0, 1, 1,
-0.5892521, 1.96021, -0.1166709, 0, 0, 0, 1, 1,
-0.5835486, 0.8722168, -0.1804818, 1, 1, 1, 1, 1,
-0.5818768, -0.06634048, -0.7863044, 1, 1, 1, 1, 1,
-0.5759714, -0.6977639, -3.631867, 1, 1, 1, 1, 1,
-0.5754896, -0.7038641, -3.133201, 1, 1, 1, 1, 1,
-0.5751683, 0.4526353, -1.495833, 1, 1, 1, 1, 1,
-0.5746275, -0.7923068, -0.8160898, 1, 1, 1, 1, 1,
-0.5730294, 1.04961, -2.309875, 1, 1, 1, 1, 1,
-0.572803, 0.375238, -0.4790432, 1, 1, 1, 1, 1,
-0.5718151, 1.758541, 0.08245064, 1, 1, 1, 1, 1,
-0.5707781, 1.522806, -0.2699104, 1, 1, 1, 1, 1,
-0.5677812, 2.014531, 1.392365, 1, 1, 1, 1, 1,
-0.5657034, 0.5816887, -1.445594, 1, 1, 1, 1, 1,
-0.5647106, -1.01045, -4.847926, 1, 1, 1, 1, 1,
-0.5629334, -1.428348, -2.77576, 1, 1, 1, 1, 1,
-0.559228, -0.05301546, -1.447552, 1, 1, 1, 1, 1,
-0.5522505, 0.4773191, -0.7656193, 0, 0, 1, 1, 1,
-0.5443596, -0.7311592, -3.208403, 1, 0, 0, 1, 1,
-0.5436209, 0.6939491, -1.529958, 1, 0, 0, 1, 1,
-0.5338738, -0.02160996, -2.712741, 1, 0, 0, 1, 1,
-0.5235218, -0.8456038, -2.187047, 1, 0, 0, 1, 1,
-0.5220283, 0.005959864, -3.541054, 1, 0, 0, 1, 1,
-0.5213452, -0.7818388, -1.596553, 0, 0, 0, 1, 1,
-0.5191388, 1.78734, 1.472854, 0, 0, 0, 1, 1,
-0.5124621, 2.500987, -0.02214052, 0, 0, 0, 1, 1,
-0.509313, -1.335961, -2.633648, 0, 0, 0, 1, 1,
-0.5068983, -0.581099, -1.464835, 0, 0, 0, 1, 1,
-0.5033143, 0.3121116, -0.7236814, 0, 0, 0, 1, 1,
-0.5018353, -1.844363, -2.62374, 0, 0, 0, 1, 1,
-0.4988056, 0.04517981, -0.8065753, 1, 1, 1, 1, 1,
-0.4981938, -0.6663496, -3.267659, 1, 1, 1, 1, 1,
-0.4938917, -0.7509841, -3.080428, 1, 1, 1, 1, 1,
-0.485851, 0.2836089, -1.326584, 1, 1, 1, 1, 1,
-0.4821242, -0.06825073, -1.528922, 1, 1, 1, 1, 1,
-0.4810799, 0.8630002, -1.999409, 1, 1, 1, 1, 1,
-0.4800453, 0.3583204, -1.477925, 1, 1, 1, 1, 1,
-0.4797558, -1.174844, -1.826275, 1, 1, 1, 1, 1,
-0.4770228, 0.1742558, -1.949098, 1, 1, 1, 1, 1,
-0.4698708, -0.5030603, -2.330619, 1, 1, 1, 1, 1,
-0.4680326, -1.485067, -3.761699, 1, 1, 1, 1, 1,
-0.4664691, -0.04652236, -2.68324, 1, 1, 1, 1, 1,
-0.4622258, 0.7055044, -1.123303, 1, 1, 1, 1, 1,
-0.4592595, -0.7905424, -2.177536, 1, 1, 1, 1, 1,
-0.4535843, 0.6645464, -1.759785, 1, 1, 1, 1, 1,
-0.4527287, 0.645542, 0.1275349, 0, 0, 1, 1, 1,
-0.4466368, 0.5554123, -1.248167, 1, 0, 0, 1, 1,
-0.4428364, 0.8321719, -0.2804693, 1, 0, 0, 1, 1,
-0.4409403, 0.8678886, -1.063008, 1, 0, 0, 1, 1,
-0.4404264, 0.0332496, -1.869656, 1, 0, 0, 1, 1,
-0.4384815, -1.926463, -0.4211574, 1, 0, 0, 1, 1,
-0.436989, -0.4736072, -4.001661, 0, 0, 0, 1, 1,
-0.4352803, -0.5528681, -3.432672, 0, 0, 0, 1, 1,
-0.4338975, -0.2530894, -1.524602, 0, 0, 0, 1, 1,
-0.4335895, -0.3342195, -1.712911, 0, 0, 0, 1, 1,
-0.4324754, -0.9144827, -0.9634559, 0, 0, 0, 1, 1,
-0.4298804, -1.112048, -3.188395, 0, 0, 0, 1, 1,
-0.4215572, -0.1548048, -2.784276, 0, 0, 0, 1, 1,
-0.4200136, 0.2032807, -0.3971238, 1, 1, 1, 1, 1,
-0.4197378, 1.250194, -0.9227859, 1, 1, 1, 1, 1,
-0.4164242, 1.001079, -1.196061, 1, 1, 1, 1, 1,
-0.4146386, -0.1288647, -2.36821, 1, 1, 1, 1, 1,
-0.4142955, -0.003964621, -1.416061, 1, 1, 1, 1, 1,
-0.4137444, 0.5275624, -1.77363, 1, 1, 1, 1, 1,
-0.4029099, 1.015612, 0.5725417, 1, 1, 1, 1, 1,
-0.4016488, -0.2926806, -2.417604, 1, 1, 1, 1, 1,
-0.4012646, 0.6547996, -1.048198, 1, 1, 1, 1, 1,
-0.3997185, 1.500104, -0.6960936, 1, 1, 1, 1, 1,
-0.3988273, 0.1137511, -1.963606, 1, 1, 1, 1, 1,
-0.387635, -1.609003, -2.918683, 1, 1, 1, 1, 1,
-0.3873951, 0.66856, -1.83236, 1, 1, 1, 1, 1,
-0.3871259, 0.2682683, -0.3757471, 1, 1, 1, 1, 1,
-0.3864748, 0.4438884, -0.9895911, 1, 1, 1, 1, 1,
-0.3857795, 0.744245, -0.5399051, 0, 0, 1, 1, 1,
-0.3805106, -1.133332, -4.062635, 1, 0, 0, 1, 1,
-0.3799438, -0.7427931, -3.029073, 1, 0, 0, 1, 1,
-0.3794629, 0.6984889, -0.2271406, 1, 0, 0, 1, 1,
-0.3765335, -2.437391, -3.838183, 1, 0, 0, 1, 1,
-0.3760499, 1.1348, -2.470657, 1, 0, 0, 1, 1,
-0.3729644, 1.538184, -0.8493645, 0, 0, 0, 1, 1,
-0.3613234, 0.940991, -0.4179112, 0, 0, 0, 1, 1,
-0.3524587, -0.1535786, -1.767942, 0, 0, 0, 1, 1,
-0.3498633, 1.65202, 0.07070122, 0, 0, 0, 1, 1,
-0.3492864, 0.1831904, -0.5543963, 0, 0, 0, 1, 1,
-0.3488518, 0.1975186, 0.07271847, 0, 0, 0, 1, 1,
-0.3476795, 0.9660659, -2.290757, 0, 0, 0, 1, 1,
-0.3468708, -0.8411995, -1.204471, 1, 1, 1, 1, 1,
-0.3455082, 0.6617965, -1.590032, 1, 1, 1, 1, 1,
-0.345472, 0.2870537, 1.535053, 1, 1, 1, 1, 1,
-0.3433285, 1.406619, -0.5321984, 1, 1, 1, 1, 1,
-0.3428788, 1.094376, -0.3543042, 1, 1, 1, 1, 1,
-0.3388356, -1.981318, -2.266533, 1, 1, 1, 1, 1,
-0.3382143, 0.8015058, -1.534185, 1, 1, 1, 1, 1,
-0.3344503, -1.680012, -1.139931, 1, 1, 1, 1, 1,
-0.3273787, -0.5347391, -3.123733, 1, 1, 1, 1, 1,
-0.3272074, -0.4589853, -2.702627, 1, 1, 1, 1, 1,
-0.3258701, 1.256239, -0.5783664, 1, 1, 1, 1, 1,
-0.3226002, 0.3366301, -1.674183, 1, 1, 1, 1, 1,
-0.3144337, -0.5342362, -2.45473, 1, 1, 1, 1, 1,
-0.3040353, 0.3630946, -0.3549614, 1, 1, 1, 1, 1,
-0.2985213, 1.418952, 0.3587749, 1, 1, 1, 1, 1,
-0.2981669, 0.07047508, -0.7881932, 0, 0, 1, 1, 1,
-0.2955951, 0.2229831, -1.428628, 1, 0, 0, 1, 1,
-0.2946643, 0.9786832, -1.143522, 1, 0, 0, 1, 1,
-0.2927065, -0.8833918, -1.351065, 1, 0, 0, 1, 1,
-0.2926763, 0.6031357, 0.4346178, 1, 0, 0, 1, 1,
-0.291068, -0.1884674, -2.411774, 1, 0, 0, 1, 1,
-0.2899653, 1.137386, 1.172841, 0, 0, 0, 1, 1,
-0.2839191, -1.060745, -1.916771, 0, 0, 0, 1, 1,
-0.2831836, 0.8192338, -0.5393322, 0, 0, 0, 1, 1,
-0.2828241, -0.6796273, -2.420206, 0, 0, 0, 1, 1,
-0.2826897, 0.4771157, 0.143995, 0, 0, 0, 1, 1,
-0.2810127, -0.3488588, -3.104669, 0, 0, 0, 1, 1,
-0.2771983, -0.54498, -1.641672, 0, 0, 0, 1, 1,
-0.2740705, 0.0956251, -1.323654, 1, 1, 1, 1, 1,
-0.2612763, -1.507348, -3.336345, 1, 1, 1, 1, 1,
-0.2579053, -0.2940537, -2.146794, 1, 1, 1, 1, 1,
-0.2569253, -0.6516695, -3.369573, 1, 1, 1, 1, 1,
-0.2521617, 0.2864248, -0.795985, 1, 1, 1, 1, 1,
-0.2385172, -0.5304907, -3.894329, 1, 1, 1, 1, 1,
-0.2357848, -0.4435476, -4.496649, 1, 1, 1, 1, 1,
-0.2346544, -1.297664, -2.42008, 1, 1, 1, 1, 1,
-0.2264332, 0.1678848, -0.2109035, 1, 1, 1, 1, 1,
-0.224586, 1.181163, -0.1094181, 1, 1, 1, 1, 1,
-0.223204, -0.8417397, -2.314891, 1, 1, 1, 1, 1,
-0.2226848, -1.010658, -4.239573, 1, 1, 1, 1, 1,
-0.2149387, 0.6516708, -0.7336901, 1, 1, 1, 1, 1,
-0.2135618, -1.074771, -3.824156, 1, 1, 1, 1, 1,
-0.213364, -0.8056015, -3.406548, 1, 1, 1, 1, 1,
-0.2128548, -2.182547, -4.176443, 0, 0, 1, 1, 1,
-0.2126218, -0.104769, -0.9983807, 1, 0, 0, 1, 1,
-0.2116662, -1.229505, -2.863557, 1, 0, 0, 1, 1,
-0.2089456, 0.212224, 0.1449537, 1, 0, 0, 1, 1,
-0.200672, -0.4641083, -2.640904, 1, 0, 0, 1, 1,
-0.1971373, -0.3137756, -3.174723, 1, 0, 0, 1, 1,
-0.1952787, -1.376084, -2.690087, 0, 0, 0, 1, 1,
-0.1946613, -0.7724245, -1.286374, 0, 0, 0, 1, 1,
-0.191757, 1.31613, 0.06495158, 0, 0, 0, 1, 1,
-0.1897312, 0.2750582, -0.6672104, 0, 0, 0, 1, 1,
-0.1861289, -0.5763354, -1.024216, 0, 0, 0, 1, 1,
-0.1850884, 2.525672, -2.048119, 0, 0, 0, 1, 1,
-0.1842254, -0.4498668, -1.92209, 0, 0, 0, 1, 1,
-0.1790913, -1.309392, -0.9752457, 1, 1, 1, 1, 1,
-0.1783987, 1.00452, 1.892126, 1, 1, 1, 1, 1,
-0.176656, -0.3609755, -1.79318, 1, 1, 1, 1, 1,
-0.175802, -0.002302632, -1.153267, 1, 1, 1, 1, 1,
-0.1744288, 1.185625, 0.426341, 1, 1, 1, 1, 1,
-0.1706564, 0.9251057, -0.5875097, 1, 1, 1, 1, 1,
-0.1686973, 0.7999378, -0.4946853, 1, 1, 1, 1, 1,
-0.1644871, 0.9740619, -1.08714, 1, 1, 1, 1, 1,
-0.1621516, 0.9741167, 0.5823227, 1, 1, 1, 1, 1,
-0.1620509, -1.193591, -4.025414, 1, 1, 1, 1, 1,
-0.1584445, -0.3455912, -3.818913, 1, 1, 1, 1, 1,
-0.1578075, -0.2891349, -1.678931, 1, 1, 1, 1, 1,
-0.1522821, -0.09637754, -1.701812, 1, 1, 1, 1, 1,
-0.1493307, -0.575533, -4.367091, 1, 1, 1, 1, 1,
-0.1478283, 0.4883364, -0.06843765, 1, 1, 1, 1, 1,
-0.14415, -0.1877542, -2.291208, 0, 0, 1, 1, 1,
-0.1441014, 3.186282, -0.874594, 1, 0, 0, 1, 1,
-0.1402813, 1.533893, 0.7355382, 1, 0, 0, 1, 1,
-0.1387997, 1.013843, 0.3638868, 1, 0, 0, 1, 1,
-0.1373892, 0.2186206, 1.522668, 1, 0, 0, 1, 1,
-0.1354972, -0.4359966, -2.541222, 1, 0, 0, 1, 1,
-0.1313941, -0.9748849, -1.733793, 0, 0, 0, 1, 1,
-0.1296237, -1.017162, -0.8588424, 0, 0, 0, 1, 1,
-0.128585, 0.8699051, -1.233363, 0, 0, 0, 1, 1,
-0.124834, 1.180197, -0.6827023, 0, 0, 0, 1, 1,
-0.1201361, 0.2713098, 0.2281769, 0, 0, 0, 1, 1,
-0.1131233, -0.2053698, -4.206577, 0, 0, 0, 1, 1,
-0.1085154, -0.5338733, -2.026036, 0, 0, 0, 1, 1,
-0.106643, 1.127432, -0.2384271, 1, 1, 1, 1, 1,
-0.105243, -1.111962, -3.552917, 1, 1, 1, 1, 1,
-0.1050026, -1.907654, -2.460633, 1, 1, 1, 1, 1,
-0.09556808, -0.6357906, -3.903456, 1, 1, 1, 1, 1,
-0.09427997, -0.2872968, -3.450371, 1, 1, 1, 1, 1,
-0.09384853, -1.533006, -5.101809, 1, 1, 1, 1, 1,
-0.09373067, 0.9334389, -0.6655509, 1, 1, 1, 1, 1,
-0.08892903, 0.8327885, -0.5762865, 1, 1, 1, 1, 1,
-0.0886613, 1.006353, -1.569386, 1, 1, 1, 1, 1,
-0.08706212, 0.9460214, -0.324874, 1, 1, 1, 1, 1,
-0.08479013, 0.1537821, 0.4114511, 1, 1, 1, 1, 1,
-0.08477362, 0.9370527, -0.6935152, 1, 1, 1, 1, 1,
-0.08088907, -0.5538488, -3.937694, 1, 1, 1, 1, 1,
-0.07771151, -0.1608289, -2.254416, 1, 1, 1, 1, 1,
-0.07439702, -0.4908201, -2.661171, 1, 1, 1, 1, 1,
-0.07417157, 1.350579, 0.8412536, 0, 0, 1, 1, 1,
-0.07026554, -0.1980555, -2.224133, 1, 0, 0, 1, 1,
-0.06968466, -0.2619486, -4.762194, 1, 0, 0, 1, 1,
-0.06439979, -1.566547, -4.133236, 1, 0, 0, 1, 1,
-0.05968139, 1.2498, 1.725742, 1, 0, 0, 1, 1,
-0.05805217, -0.9335412, -2.585631, 1, 0, 0, 1, 1,
-0.05664919, -0.03628725, -1.431422, 0, 0, 0, 1, 1,
-0.05603999, -0.6942989, -2.893948, 0, 0, 0, 1, 1,
-0.05436305, -0.5888623, -2.229966, 0, 0, 0, 1, 1,
-0.05027773, 1.003763, -0.9206026, 0, 0, 0, 1, 1,
-0.04853048, 0.8679097, -0.08888485, 0, 0, 0, 1, 1,
-0.04581032, 0.155895, -0.113618, 0, 0, 0, 1, 1,
-0.04436159, -0.8902948, -1.737765, 0, 0, 0, 1, 1,
-0.04045098, 1.42037, 0.554604, 1, 1, 1, 1, 1,
-0.03896351, 0.03016976, -1.68136, 1, 1, 1, 1, 1,
-0.03743652, -0.2804839, -1.363282, 1, 1, 1, 1, 1,
-0.0304955, -0.5114335, -2.455296, 1, 1, 1, 1, 1,
-0.03040637, 0.3595715, -1.452501, 1, 1, 1, 1, 1,
-0.03032132, -0.8905039, -3.445736, 1, 1, 1, 1, 1,
-0.02428624, -0.5505841, -3.742621, 1, 1, 1, 1, 1,
-0.01585928, 0.8126345, -0.2781827, 1, 1, 1, 1, 1,
-0.0131441, 0.2818761, 1.894931, 1, 1, 1, 1, 1,
-0.01212441, -0.8482101, -2.238704, 1, 1, 1, 1, 1,
-0.01037575, 1.148317, -0.6256028, 1, 1, 1, 1, 1,
-0.008623025, -0.6754423, -2.803373, 1, 1, 1, 1, 1,
-0.007273616, -0.9758805, -3.341312, 1, 1, 1, 1, 1,
-0.005376413, 0.8878281, 0.4918426, 1, 1, 1, 1, 1,
0.0001548334, 1.08527, -0.1400041, 1, 1, 1, 1, 1,
0.0004639, 0.8203509, -0.3702283, 0, 0, 1, 1, 1,
0.02411997, 0.8858494, 1.198704, 1, 0, 0, 1, 1,
0.02589565, -0.78703, 3.563025, 1, 0, 0, 1, 1,
0.0305529, -0.3115633, 2.695297, 1, 0, 0, 1, 1,
0.03199938, 0.05737982, 0.8534573, 1, 0, 0, 1, 1,
0.03289146, 0.5345211, -0.9825639, 1, 0, 0, 1, 1,
0.03424366, 0.4536763, 0.8018454, 0, 0, 0, 1, 1,
0.03809426, 1.797808, 0.5362192, 0, 0, 0, 1, 1,
0.03981323, -0.6293399, 2.442444, 0, 0, 0, 1, 1,
0.04017946, 1.186875, 0.3365936, 0, 0, 0, 1, 1,
0.04101135, -0.2337146, 3.659632, 0, 0, 0, 1, 1,
0.04157005, 0.3868473, 0.06358206, 0, 0, 0, 1, 1,
0.04375965, -0.5376376, 2.839384, 0, 0, 0, 1, 1,
0.04545619, -1.334623, 4.240758, 1, 1, 1, 1, 1,
0.04736763, 0.02641056, 0.2581612, 1, 1, 1, 1, 1,
0.04818947, -1.333404, 3.4467, 1, 1, 1, 1, 1,
0.05120015, 1.055936, 1.760951, 1, 1, 1, 1, 1,
0.05143787, -1.534671, 3.298356, 1, 1, 1, 1, 1,
0.0571325, -0.8696522, 3.188099, 1, 1, 1, 1, 1,
0.05761231, -0.4658071, 3.358382, 1, 1, 1, 1, 1,
0.05780661, 0.02324154, 0.557206, 1, 1, 1, 1, 1,
0.05978205, 0.591121, -0.2232987, 1, 1, 1, 1, 1,
0.0615306, 2.415993, -1.464653, 1, 1, 1, 1, 1,
0.0636963, 0.1797444, 2.194874, 1, 1, 1, 1, 1,
0.06474578, -0.3616074, 0.3975331, 1, 1, 1, 1, 1,
0.06760114, 2.49605, -0.2956504, 1, 1, 1, 1, 1,
0.07947164, -0.02872744, 0.9571322, 1, 1, 1, 1, 1,
0.08231239, -1.054684, 2.529151, 1, 1, 1, 1, 1,
0.08245692, -0.5222299, 2.434464, 0, 0, 1, 1, 1,
0.08476974, -0.2296984, 2.853311, 1, 0, 0, 1, 1,
0.08730917, -1.915491, 2.723452, 1, 0, 0, 1, 1,
0.08873951, 0.6029115, 1.083046, 1, 0, 0, 1, 1,
0.08931331, -0.4343741, 4.617098, 1, 0, 0, 1, 1,
0.09015303, 1.83808, -0.09303144, 1, 0, 0, 1, 1,
0.09038477, 0.02223625, 1.61575, 0, 0, 0, 1, 1,
0.09041482, 0.0407147, -0.2041497, 0, 0, 0, 1, 1,
0.09055142, 0.3248814, 1.256935, 0, 0, 0, 1, 1,
0.09115973, 0.6894954, 0.3476564, 0, 0, 0, 1, 1,
0.09278924, -2.002042, 4.843455, 0, 0, 0, 1, 1,
0.09328929, 1.221014, 1.787479, 0, 0, 0, 1, 1,
0.09406456, -0.5582961, 2.015759, 0, 0, 0, 1, 1,
0.09823626, -1.296411, 3.647258, 1, 1, 1, 1, 1,
0.1009059, 0.5985391, 1.881036, 1, 1, 1, 1, 1,
0.1013342, -0.1225503, 2.476918, 1, 1, 1, 1, 1,
0.1027995, 0.6665676, -0.03622577, 1, 1, 1, 1, 1,
0.1110091, -1.088533, 2.50566, 1, 1, 1, 1, 1,
0.1130365, 0.4684063, 2.052102, 1, 1, 1, 1, 1,
0.1200477, 1.007612, -1.578282, 1, 1, 1, 1, 1,
0.1330251, -0.9478613, 3.878088, 1, 1, 1, 1, 1,
0.1349313, -0.8902519, 4.99033, 1, 1, 1, 1, 1,
0.1349717, 0.5459498, 1.172242, 1, 1, 1, 1, 1,
0.1373751, -1.569929, 2.379053, 1, 1, 1, 1, 1,
0.1389272, -0.6206433, 4.806243, 1, 1, 1, 1, 1,
0.1492282, -0.7324522, 2.568972, 1, 1, 1, 1, 1,
0.1518129, 0.824407, -0.1605448, 1, 1, 1, 1, 1,
0.1527938, -0.2697907, 3.55307, 1, 1, 1, 1, 1,
0.1547813, 0.899124, 1.056392, 0, 0, 1, 1, 1,
0.1551303, 0.1555797, 2.202096, 1, 0, 0, 1, 1,
0.1554729, -0.1983266, 3.009578, 1, 0, 0, 1, 1,
0.1589015, -0.7373974, 3.874968, 1, 0, 0, 1, 1,
0.1595731, 0.7368125, -1.604735, 1, 0, 0, 1, 1,
0.1598943, -1.568401, 1.157596, 1, 0, 0, 1, 1,
0.1608743, -0.9179438, 2.920758, 0, 0, 0, 1, 1,
0.1624007, -0.03949843, 1.602695, 0, 0, 0, 1, 1,
0.1624339, -0.1603442, 3.021294, 0, 0, 0, 1, 1,
0.1641483, 0.5675878, -1.187878, 0, 0, 0, 1, 1,
0.1651998, -1.376339, 2.170956, 0, 0, 0, 1, 1,
0.1699488, -0.1624106, 2.025221, 0, 0, 0, 1, 1,
0.1821342, -0.7247256, 3.135077, 0, 0, 0, 1, 1,
0.182871, -0.6828227, 3.497131, 1, 1, 1, 1, 1,
0.1858915, 0.9319364, -1.067838, 1, 1, 1, 1, 1,
0.1933597, 0.01563653, 2.982806, 1, 1, 1, 1, 1,
0.1972933, -1.489136, 4.978495, 1, 1, 1, 1, 1,
0.2058981, -0.6935807, 3.682552, 1, 1, 1, 1, 1,
0.2124979, 1.102911, -0.9361908, 1, 1, 1, 1, 1,
0.215142, -0.1435093, 3.372736, 1, 1, 1, 1, 1,
0.2185469, 1.04421, 0.07481588, 1, 1, 1, 1, 1,
0.2205323, 0.1055764, -0.5797147, 1, 1, 1, 1, 1,
0.2231735, -0.3868292, 3.873935, 1, 1, 1, 1, 1,
0.2234773, 1.744767, 0.6009661, 1, 1, 1, 1, 1,
0.224495, -0.6123777, 1.879332, 1, 1, 1, 1, 1,
0.226636, 0.2127212, 0.3873765, 1, 1, 1, 1, 1,
0.2293833, 0.6829566, 0.5085214, 1, 1, 1, 1, 1,
0.2297815, 0.8675781, -0.2706645, 1, 1, 1, 1, 1,
0.2413666, -0.7373695, 2.063075, 0, 0, 1, 1, 1,
0.2424902, -0.009597013, 1.251892, 1, 0, 0, 1, 1,
0.2425466, -1.14781, 3.810871, 1, 0, 0, 1, 1,
0.2454205, -0.4129083, 1.02456, 1, 0, 0, 1, 1,
0.2499468, 0.7250751, -1.435418, 1, 0, 0, 1, 1,
0.2580365, 0.6340326, 0.1406837, 1, 0, 0, 1, 1,
0.2580793, -0.4374518, 2.787969, 0, 0, 0, 1, 1,
0.2591459, -0.1951091, 2.286525, 0, 0, 0, 1, 1,
0.2597483, -0.744715, 5.105863, 0, 0, 0, 1, 1,
0.260419, 1.121562, -0.6752567, 0, 0, 0, 1, 1,
0.2605084, 1.157508, 0.3180361, 0, 0, 0, 1, 1,
0.2616866, -0.4067322, 0.9942724, 0, 0, 0, 1, 1,
0.2626048, 1.424505, 0.5024516, 0, 0, 0, 1, 1,
0.2637894, 0.5837834, 1.912548, 1, 1, 1, 1, 1,
0.2676967, -1.335658, 1.733078, 1, 1, 1, 1, 1,
0.2710553, -1.152488, 4.229514, 1, 1, 1, 1, 1,
0.2740316, 0.8702249, 0.1137795, 1, 1, 1, 1, 1,
0.2787111, -0.3045319, 5.396595, 1, 1, 1, 1, 1,
0.2818441, 0.9030433, -1.523855, 1, 1, 1, 1, 1,
0.2821933, 1.177917, 0.5910657, 1, 1, 1, 1, 1,
0.2823814, -1.061185, 3.691328, 1, 1, 1, 1, 1,
0.288626, -1.530482, 1.57217, 1, 1, 1, 1, 1,
0.2938473, 0.6147286, 2.741968, 1, 1, 1, 1, 1,
0.2938489, -0.02785907, 1.923657, 1, 1, 1, 1, 1,
0.2980669, -1.196792, 4.295286, 1, 1, 1, 1, 1,
0.3000851, 0.3092837, 0.6246279, 1, 1, 1, 1, 1,
0.3098145, 1.043388, -1.187541, 1, 1, 1, 1, 1,
0.3134336, -0.2677622, 2.378932, 1, 1, 1, 1, 1,
0.3176625, 1.156214, -2.061605, 0, 0, 1, 1, 1,
0.3208706, -0.267303, 2.853232, 1, 0, 0, 1, 1,
0.3222003, 0.5583996, 1.946213, 1, 0, 0, 1, 1,
0.3236257, 0.2537677, 0.9881501, 1, 0, 0, 1, 1,
0.3262014, 0.923399, 0.4080032, 1, 0, 0, 1, 1,
0.3266838, -0.6275986, 3.519934, 1, 0, 0, 1, 1,
0.3280289, -0.4291832, 2.827051, 0, 0, 0, 1, 1,
0.3314786, -0.6703037, 1.171123, 0, 0, 0, 1, 1,
0.3330325, 0.430793, 0.7177602, 0, 0, 0, 1, 1,
0.3334016, -1.520756, 3.124118, 0, 0, 0, 1, 1,
0.3338203, -0.4345888, 3.14732, 0, 0, 0, 1, 1,
0.3347459, 0.4269023, 0.2052835, 0, 0, 0, 1, 1,
0.3348634, -0.2493575, 2.114091, 0, 0, 0, 1, 1,
0.3371267, -1.084266, 3.570472, 1, 1, 1, 1, 1,
0.338737, -1.295735, 3.606079, 1, 1, 1, 1, 1,
0.3419854, 0.2370838, -1.397229, 1, 1, 1, 1, 1,
0.3429402, 1.077779, 0.5723496, 1, 1, 1, 1, 1,
0.3534007, -0.5419449, 1.629388, 1, 1, 1, 1, 1,
0.3542362, -0.4656167, 3.584515, 1, 1, 1, 1, 1,
0.3593099, -0.3546427, 2.82112, 1, 1, 1, 1, 1,
0.3609747, 0.8798614, 1.102683, 1, 1, 1, 1, 1,
0.3616937, 1.06226, 1.085238, 1, 1, 1, 1, 1,
0.3635665, 0.2120426, 0.02985703, 1, 1, 1, 1, 1,
0.3656212, -0.3151635, 3.196434, 1, 1, 1, 1, 1,
0.3687451, 0.2819104, 1.51591, 1, 1, 1, 1, 1,
0.3744549, -0.00112579, 0.3257348, 1, 1, 1, 1, 1,
0.3769124, 1.45556, -1.446747, 1, 1, 1, 1, 1,
0.3772959, -1.816134, 3.239108, 1, 1, 1, 1, 1,
0.3815831, 0.3694798, 0.2383606, 0, 0, 1, 1, 1,
0.3825316, 0.06227389, 1.281225, 1, 0, 0, 1, 1,
0.3877319, 0.6848258, 0.8064814, 1, 0, 0, 1, 1,
0.3931352, -0.04751313, 0.9829159, 1, 0, 0, 1, 1,
0.3976429, -1.418418, 3.652334, 1, 0, 0, 1, 1,
0.3980203, -0.6530803, 4.079638, 1, 0, 0, 1, 1,
0.3983328, -0.6948667, 3.465719, 0, 0, 0, 1, 1,
0.4007463, -0.2894155, 0.9530999, 0, 0, 0, 1, 1,
0.4034842, -0.8721425, 2.347203, 0, 0, 0, 1, 1,
0.4123415, -0.1543505, 2.619195, 0, 0, 0, 1, 1,
0.4244931, -0.2726753, 0.6925833, 0, 0, 0, 1, 1,
0.4255567, -0.7734165, 2.924556, 0, 0, 0, 1, 1,
0.4256062, -1.726027, 2.989036, 0, 0, 0, 1, 1,
0.42962, 1.196407, 1.258556, 1, 1, 1, 1, 1,
0.4301433, 0.4941985, 1.388291, 1, 1, 1, 1, 1,
0.440163, 0.8989766, 1.010875, 1, 1, 1, 1, 1,
0.4413072, -0.6366752, 2.911487, 1, 1, 1, 1, 1,
0.4424688, 0.6196036, 0.5272083, 1, 1, 1, 1, 1,
0.4427205, -0.1788274, 2.048439, 1, 1, 1, 1, 1,
0.4428698, -0.5183731, 2.725511, 1, 1, 1, 1, 1,
0.4494825, 2.029104, -0.06101089, 1, 1, 1, 1, 1,
0.4522703, -0.4469261, 2.256447, 1, 1, 1, 1, 1,
0.4530372, 1.599781, 1.115109, 1, 1, 1, 1, 1,
0.4645388, 0.593183, -0.1155642, 1, 1, 1, 1, 1,
0.4646853, 0.2136853, 0.3212236, 1, 1, 1, 1, 1,
0.4677227, 0.8917173, 2.387613, 1, 1, 1, 1, 1,
0.4701555, -0.3988481, 2.679717, 1, 1, 1, 1, 1,
0.4718022, -1.430334, 3.570354, 1, 1, 1, 1, 1,
0.4720219, -0.2309922, 1.13313, 0, 0, 1, 1, 1,
0.4762784, 0.1407488, 0.7704182, 1, 0, 0, 1, 1,
0.4764681, -0.9294756, 1.882955, 1, 0, 0, 1, 1,
0.4772742, -2.260215, 2.574689, 1, 0, 0, 1, 1,
0.4900097, -0.3642474, 3.442264, 1, 0, 0, 1, 1,
0.4905727, 2.020361, 0.8504744, 1, 0, 0, 1, 1,
0.4939449, 0.0385581, -0.1992223, 0, 0, 0, 1, 1,
0.4940497, -0.7347077, 1.537471, 0, 0, 0, 1, 1,
0.4982172, -1.48915, 3.423653, 0, 0, 0, 1, 1,
0.4993268, 0.03632994, 0.8303074, 0, 0, 0, 1, 1,
0.502117, 0.4184722, 0.4181838, 0, 0, 0, 1, 1,
0.5034893, -0.5318736, -0.1478263, 0, 0, 0, 1, 1,
0.5050696, -0.1050524, 2.874095, 0, 0, 0, 1, 1,
0.5065042, 0.2438638, 1.998293, 1, 1, 1, 1, 1,
0.5158172, 0.8946436, -0.4155396, 1, 1, 1, 1, 1,
0.5186133, -0.9909979, 1.378622, 1, 1, 1, 1, 1,
0.5210263, -1.159807, 3.357556, 1, 1, 1, 1, 1,
0.5217032, -0.9402201, 2.194933, 1, 1, 1, 1, 1,
0.5267946, 0.1528831, 1.551857, 1, 1, 1, 1, 1,
0.5307269, 0.5139692, 2.368056, 1, 1, 1, 1, 1,
0.5312604, 0.574362, 1.793398, 1, 1, 1, 1, 1,
0.532429, -0.2131121, 0.5442804, 1, 1, 1, 1, 1,
0.5400901, -1.73729, 3.373036, 1, 1, 1, 1, 1,
0.5514674, 0.9359779, 1.342663, 1, 1, 1, 1, 1,
0.5544965, 0.7311921, 1.146516, 1, 1, 1, 1, 1,
0.5567954, -0.8334197, 4.957524, 1, 1, 1, 1, 1,
0.5592746, -1.602725, 2.511721, 1, 1, 1, 1, 1,
0.5616614, 0.8238092, -0.1022016, 1, 1, 1, 1, 1,
0.5646958, 0.4841154, 2.280749, 0, 0, 1, 1, 1,
0.5688583, -0.2726867, 1.612179, 1, 0, 0, 1, 1,
0.5754781, 0.126069, 0.9000589, 1, 0, 0, 1, 1,
0.5801497, 0.0889404, 0.5629771, 1, 0, 0, 1, 1,
0.5804651, 0.3696493, 1.484214, 1, 0, 0, 1, 1,
0.5839244, 0.328178, -0.2990039, 1, 0, 0, 1, 1,
0.584501, -1.936601, 5.47259, 0, 0, 0, 1, 1,
0.5854415, -0.1089351, 2.329482, 0, 0, 0, 1, 1,
0.5870194, -0.1493031, 0.8790908, 0, 0, 0, 1, 1,
0.5880111, -1.171242, 2.654594, 0, 0, 0, 1, 1,
0.5893625, 0.2197834, 0.7781433, 0, 0, 0, 1, 1,
0.5930809, 1.019148, -0.03780243, 0, 0, 0, 1, 1,
0.5933102, -1.369853, 3.610316, 0, 0, 0, 1, 1,
0.594996, 1.097371, 1.733889, 1, 1, 1, 1, 1,
0.6048985, 0.4711525, 1.427255, 1, 1, 1, 1, 1,
0.6054104, 1.94353, 1.082898, 1, 1, 1, 1, 1,
0.6057183, -0.5101389, 4.574182, 1, 1, 1, 1, 1,
0.6078101, -1.003086, 2.617233, 1, 1, 1, 1, 1,
0.6163765, 1.819017, 0.7451633, 1, 1, 1, 1, 1,
0.6185753, -0.1916413, 2.0686, 1, 1, 1, 1, 1,
0.6193451, 0.2265845, 0.6162428, 1, 1, 1, 1, 1,
0.6200723, 1.393563, 0.3596576, 1, 1, 1, 1, 1,
0.6212261, 0.6242549, 1.009217, 1, 1, 1, 1, 1,
0.6338981, 1.135716, 0.2839743, 1, 1, 1, 1, 1,
0.6352666, -1.331368, 3.463473, 1, 1, 1, 1, 1,
0.6367763, -0.7775351, 3.019974, 1, 1, 1, 1, 1,
0.6392742, -1.337155, 3.241054, 1, 1, 1, 1, 1,
0.6413624, -1.868308, 3.238367, 1, 1, 1, 1, 1,
0.6452504, 1.293013, -0.5628902, 0, 0, 1, 1, 1,
0.6454903, -0.6944158, 1.580383, 1, 0, 0, 1, 1,
0.6517384, -0.4869451, 2.385811, 1, 0, 0, 1, 1,
0.6520934, 0.05443793, 0.6382192, 1, 0, 0, 1, 1,
0.6551693, -0.950802, 0.2156383, 1, 0, 0, 1, 1,
0.6563504, 1.052828, 1.380346, 1, 0, 0, 1, 1,
0.6699104, -1.92399, 2.922851, 0, 0, 0, 1, 1,
0.6716782, 0.1825409, 1.201838, 0, 0, 0, 1, 1,
0.6767345, -1.312851, 1.535404, 0, 0, 0, 1, 1,
0.6771331, 0.4119992, 0.9763009, 0, 0, 0, 1, 1,
0.679071, 0.1103149, 3.0322, 0, 0, 0, 1, 1,
0.679547, -0.6454859, 2.490952, 0, 0, 0, 1, 1,
0.6851467, 1.225084, 1.24554, 0, 0, 0, 1, 1,
0.6877772, -0.5610475, 2.028699, 1, 1, 1, 1, 1,
0.6909242, -0.1757138, 2.899584, 1, 1, 1, 1, 1,
0.6929078, -2.349527, 2.100271, 1, 1, 1, 1, 1,
0.6933966, 1.13673, 1.977721, 1, 1, 1, 1, 1,
0.693909, 0.1350595, 3.003221, 1, 1, 1, 1, 1,
0.6962818, 0.2291872, 3.339191, 1, 1, 1, 1, 1,
0.6985682, -0.4467097, 1.419796, 1, 1, 1, 1, 1,
0.701354, 0.57687, 2.021901, 1, 1, 1, 1, 1,
0.7104951, -1.338001, 3.305168, 1, 1, 1, 1, 1,
0.7107475, 1.370091, -0.1153288, 1, 1, 1, 1, 1,
0.7182656, -0.7678949, 2.328188, 1, 1, 1, 1, 1,
0.720385, -0.7100865, 2.449988, 1, 1, 1, 1, 1,
0.720506, 1.007557, -0.4185953, 1, 1, 1, 1, 1,
0.7220316, 0.07649433, 0.3572081, 1, 1, 1, 1, 1,
0.724238, 1.095782, 0.7140195, 1, 1, 1, 1, 1,
0.7249243, -1.243059, 1.368887, 0, 0, 1, 1, 1,
0.7251813, 0.5310668, -0.2316141, 1, 0, 0, 1, 1,
0.7259905, -0.3873304, 1.584697, 1, 0, 0, 1, 1,
0.7267698, 1.086046, -1.728163, 1, 0, 0, 1, 1,
0.7273635, -1.653947, 0.6337727, 1, 0, 0, 1, 1,
0.7279829, 0.4221531, 0.8732265, 1, 0, 0, 1, 1,
0.7351985, -0.1263888, 1.470588, 0, 0, 0, 1, 1,
0.7361284, -0.3658521, 2.066501, 0, 0, 0, 1, 1,
0.7439995, -0.3477629, 4.905093, 0, 0, 0, 1, 1,
0.7450772, 0.2230765, 1.401227, 0, 0, 0, 1, 1,
0.7498275, 0.2398164, 2.140267, 0, 0, 0, 1, 1,
0.7511262, 1.005604, 0.4386916, 0, 0, 0, 1, 1,
0.7555764, -1.186304, 2.008254, 0, 0, 0, 1, 1,
0.7576703, -1.267674, 3.065469, 1, 1, 1, 1, 1,
0.7577876, -0.8091685, 1.673131, 1, 1, 1, 1, 1,
0.7582588, -0.3792325, 2.557153, 1, 1, 1, 1, 1,
0.765808, -0.5984796, 2.301922, 1, 1, 1, 1, 1,
0.7660934, -0.1497283, 2.992646, 1, 1, 1, 1, 1,
0.7705451, -0.54364, 1.417525, 1, 1, 1, 1, 1,
0.7743468, 0.5959316, 0.5377977, 1, 1, 1, 1, 1,
0.7744262, -0.5271318, 3.755766, 1, 1, 1, 1, 1,
0.7767228, -1.680129, 3.231333, 1, 1, 1, 1, 1,
0.7779639, 0.1343398, 3.581959, 1, 1, 1, 1, 1,
0.7783734, 1.150657, 1.532344, 1, 1, 1, 1, 1,
0.7804857, 0.7600902, 0.2006641, 1, 1, 1, 1, 1,
0.7808859, -0.04574765, 0.564038, 1, 1, 1, 1, 1,
0.7945697, 1.220772, 0.188027, 1, 1, 1, 1, 1,
0.8024623, 0.5529501, 2.353032, 1, 1, 1, 1, 1,
0.8056565, -0.5034108, 1.074201, 0, 0, 1, 1, 1,
0.8062586, -1.700092, 2.872287, 1, 0, 0, 1, 1,
0.8161342, -0.04022442, 0.9046959, 1, 0, 0, 1, 1,
0.8170763, -0.891444, 4.400708, 1, 0, 0, 1, 1,
0.8184595, 0.3901386, 2.557583, 1, 0, 0, 1, 1,
0.8186351, -0.7043945, 2.317937, 1, 0, 0, 1, 1,
0.8273824, 0.149266, 1.935516, 0, 0, 0, 1, 1,
0.8339816, 0.7986026, 0.1867664, 0, 0, 0, 1, 1,
0.834121, 0.2065422, -0.5670657, 0, 0, 0, 1, 1,
0.8349496, -0.4632575, 0.9735372, 0, 0, 0, 1, 1,
0.8368254, 1.2925, -0.5597295, 0, 0, 0, 1, 1,
0.8369913, -0.04079933, 1.750081, 0, 0, 0, 1, 1,
0.8374305, -0.06689882, -0.4141954, 0, 0, 0, 1, 1,
0.8402966, -1.023602, 2.483267, 1, 1, 1, 1, 1,
0.8564224, -1.278052, 1.700735, 1, 1, 1, 1, 1,
0.8591181, 0.4639785, 1.742487, 1, 1, 1, 1, 1,
0.870256, -1.145041, 2.817036, 1, 1, 1, 1, 1,
0.8725111, -0.9524131, 2.322487, 1, 1, 1, 1, 1,
0.8727431, -0.01681932, 1.929066, 1, 1, 1, 1, 1,
0.8798504, -0.2681474, 0.6589141, 1, 1, 1, 1, 1,
0.8851628, -0.3514315, 2.536864, 1, 1, 1, 1, 1,
0.8857113, 0.4168634, 0.3662966, 1, 1, 1, 1, 1,
0.887249, 0.3242477, 2.271775, 1, 1, 1, 1, 1,
0.8889531, -0.06826949, 1.46267, 1, 1, 1, 1, 1,
0.8891628, -2.542253, 3.481414, 1, 1, 1, 1, 1,
0.9092966, -1.584198, 3.334831, 1, 1, 1, 1, 1,
0.9109302, 0.5935097, 0.5253423, 1, 1, 1, 1, 1,
0.9148179, 0.5709423, 1.201616, 1, 1, 1, 1, 1,
0.9155632, 2.584703, 0.8352277, 0, 0, 1, 1, 1,
0.9280866, 0.9270193, 0.2809626, 1, 0, 0, 1, 1,
0.9287569, -0.4399978, 3.296461, 1, 0, 0, 1, 1,
0.9387199, 1.296351, -0.1340079, 1, 0, 0, 1, 1,
0.9409241, -0.240327, 2.538491, 1, 0, 0, 1, 1,
0.9422502, 0.404125, 1.905675, 1, 0, 0, 1, 1,
0.9575231, 0.4233509, 0.002169904, 0, 0, 0, 1, 1,
0.9583069, -1.539862, 1.962817, 0, 0, 0, 1, 1,
0.9587789, -0.7482888, 1.684905, 0, 0, 0, 1, 1,
0.9678319, 0.8441097, 2.79243, 0, 0, 0, 1, 1,
0.9690623, 1.396195, 1.839507, 0, 0, 0, 1, 1,
0.976595, 0.07874446, 0.4268293, 0, 0, 0, 1, 1,
0.9774693, 1.481191, -0.5463614, 0, 0, 0, 1, 1,
0.9784902, 0.3759002, 3.536619, 1, 1, 1, 1, 1,
0.9850157, -1.015614, 2.454197, 1, 1, 1, 1, 1,
0.9868191, -0.4991945, 2.910859, 1, 1, 1, 1, 1,
0.9960617, -0.3018372, 0.7277383, 1, 1, 1, 1, 1,
1.003617, 2.426884, 0.1028237, 1, 1, 1, 1, 1,
1.004663, 0.3721482, -0.5177189, 1, 1, 1, 1, 1,
1.006646, 1.500177, 2.288921, 1, 1, 1, 1, 1,
1.017593, -0.8525565, 1.459323, 1, 1, 1, 1, 1,
1.025513, 1.388103, 2.975365, 1, 1, 1, 1, 1,
1.028006, 0.8958003, 0.2373878, 1, 1, 1, 1, 1,
1.031077, -1.750067, 3.768661, 1, 1, 1, 1, 1,
1.038774, -0.9088282, 2.159854, 1, 1, 1, 1, 1,
1.041031, 2.61505, -0.3695842, 1, 1, 1, 1, 1,
1.044368, -0.5760565, 0.9105387, 1, 1, 1, 1, 1,
1.04618, 0.06228735, 3.593618, 1, 1, 1, 1, 1,
1.0483, 0.1073575, 2.140227, 0, 0, 1, 1, 1,
1.062531, 0.8832286, 0.5561872, 1, 0, 0, 1, 1,
1.065699, 0.5248176, 1.034099, 1, 0, 0, 1, 1,
1.074196, -1.287882, 2.379058, 1, 0, 0, 1, 1,
1.075328, 0.7938509, 0.2687138, 1, 0, 0, 1, 1,
1.087625, -0.7865165, 1.771633, 1, 0, 0, 1, 1,
1.103755, 0.2107542, 0.6658394, 0, 0, 0, 1, 1,
1.107128, -0.1019947, -1.919947, 0, 0, 0, 1, 1,
1.1084, -2.105871, 3.620931, 0, 0, 0, 1, 1,
1.108747, 0.2809455, -1.531176, 0, 0, 0, 1, 1,
1.108861, 0.1486966, 1.974551, 0, 0, 0, 1, 1,
1.115291, 0.1024681, 1.434859, 0, 0, 0, 1, 1,
1.127842, 0.5348212, 0.6203707, 0, 0, 0, 1, 1,
1.128932, -0.3430316, -0.4319236, 1, 1, 1, 1, 1,
1.142382, 0.2329342, 1.137194, 1, 1, 1, 1, 1,
1.142987, 0.1750302, 1.547148, 1, 1, 1, 1, 1,
1.144799, 0.2996589, 0.888599, 1, 1, 1, 1, 1,
1.148103, 0.7279662, 1.066551, 1, 1, 1, 1, 1,
1.156426, 0.4681728, 1.62511, 1, 1, 1, 1, 1,
1.16087, -0.2092813, 0.960247, 1, 1, 1, 1, 1,
1.162718, 0.7982482, -0.6918262, 1, 1, 1, 1, 1,
1.171343, -1.446288, 2.029581, 1, 1, 1, 1, 1,
1.172832, 0.2233679, 1.313806, 1, 1, 1, 1, 1,
1.18132, 0.3874532, 1.242467, 1, 1, 1, 1, 1,
1.194294, 0.5103203, 1.260806, 1, 1, 1, 1, 1,
1.204725, -1.311962, 2.064992, 1, 1, 1, 1, 1,
1.209248, -1.065211, 1.516725, 1, 1, 1, 1, 1,
1.210807, 0.3826525, 1.348583, 1, 1, 1, 1, 1,
1.215943, -0.9293758, 1.972064, 0, 0, 1, 1, 1,
1.22189, 1.933819, 2.73655, 1, 0, 0, 1, 1,
1.224502, -0.6472042, 1.393883, 1, 0, 0, 1, 1,
1.22753, -0.9170249, 1.224141, 1, 0, 0, 1, 1,
1.228596, 1.148983, 1.337813, 1, 0, 0, 1, 1,
1.237426, 0.291947, -0.01127533, 1, 0, 0, 1, 1,
1.244835, 0.9072044, 0.2831858, 0, 0, 0, 1, 1,
1.247597, -0.01319258, 2.067976, 0, 0, 0, 1, 1,
1.24922, 0.1629795, 1.040954, 0, 0, 0, 1, 1,
1.250869, -1.120733, -0.09891997, 0, 0, 0, 1, 1,
1.255431, 0.05880699, 2.293444, 0, 0, 0, 1, 1,
1.256669, 1.371175, 1.661661, 0, 0, 0, 1, 1,
1.262983, -1.142783, 3.599067, 0, 0, 0, 1, 1,
1.266554, 1.673273, 0.7170419, 1, 1, 1, 1, 1,
1.271514, 0.2949824, 3.342173, 1, 1, 1, 1, 1,
1.276767, 0.7613621, -2.415255, 1, 1, 1, 1, 1,
1.282151, -0.2852854, 4.25061, 1, 1, 1, 1, 1,
1.284786, -0.7441312, 2.771266, 1, 1, 1, 1, 1,
1.285656, 0.4045585, 1.961019, 1, 1, 1, 1, 1,
1.287928, -0.1805582, 2.556965, 1, 1, 1, 1, 1,
1.288317, 1.101269, 1.345195, 1, 1, 1, 1, 1,
1.305738, 0.1711237, 0.07214715, 1, 1, 1, 1, 1,
1.306812, -0.8170763, 3.223888, 1, 1, 1, 1, 1,
1.308576, 0.2196642, 2.613856, 1, 1, 1, 1, 1,
1.317021, 0.9932965, 2.37032, 1, 1, 1, 1, 1,
1.317896, 0.1718559, 0.7579941, 1, 1, 1, 1, 1,
1.325847, 0.9076681, 0.5778651, 1, 1, 1, 1, 1,
1.328345, -1.093491, 1.983405, 1, 1, 1, 1, 1,
1.335655, 0.6293187, 0.8657155, 0, 0, 1, 1, 1,
1.33737, -0.1596913, 4.822073, 1, 0, 0, 1, 1,
1.340652, -1.250844, 2.092149, 1, 0, 0, 1, 1,
1.342071, 1.165984, 0.1181578, 1, 0, 0, 1, 1,
1.34815, 0.5577347, 1.355768, 1, 0, 0, 1, 1,
1.361109, -0.9246496, 2.846493, 1, 0, 0, 1, 1,
1.361373, 0.2519337, 2.102281, 0, 0, 0, 1, 1,
1.363651, -0.46653, 2.923669, 0, 0, 0, 1, 1,
1.364162, 0.7149231, 0.02597165, 0, 0, 0, 1, 1,
1.376485, 0.07747155, -0.6319348, 0, 0, 0, 1, 1,
1.38102, 0.555064, 1.212911, 0, 0, 0, 1, 1,
1.392274, -1.183392, 1.732802, 0, 0, 0, 1, 1,
1.410315, 0.5777313, 1.50475, 0, 0, 0, 1, 1,
1.412949, -1.431955, 3.708017, 1, 1, 1, 1, 1,
1.423856, 1.412556, 1.485161, 1, 1, 1, 1, 1,
1.425458, 0.1093928, 2.249071, 1, 1, 1, 1, 1,
1.435775, 0.3108262, 0.5680478, 1, 1, 1, 1, 1,
1.450515, -0.9597667, 3.179704, 1, 1, 1, 1, 1,
1.466777, 0.7191259, 0.9506073, 1, 1, 1, 1, 1,
1.469697, 0.1102463, 2.166451, 1, 1, 1, 1, 1,
1.475147, 0.6365985, 0.09712031, 1, 1, 1, 1, 1,
1.476432, 0.941123, 0.6598591, 1, 1, 1, 1, 1,
1.477147, 0.01543758, 2.357548, 1, 1, 1, 1, 1,
1.479033, -1.525083, 2.605639, 1, 1, 1, 1, 1,
1.494943, -0.1074921, 1.527412, 1, 1, 1, 1, 1,
1.499054, 1.697698, -0.05466149, 1, 1, 1, 1, 1,
1.501878, 0.06744645, 2.573629, 1, 1, 1, 1, 1,
1.50723, 0.5629765, 1.90259, 1, 1, 1, 1, 1,
1.515465, -1.627467, 4.413811, 0, 0, 1, 1, 1,
1.529023, 1.561064, 1.933705, 1, 0, 0, 1, 1,
1.550541, 0.2978596, 0.4959689, 1, 0, 0, 1, 1,
1.555289, 0.8157606, -0.6496268, 1, 0, 0, 1, 1,
1.556267, 1.616266, 0.6489694, 1, 0, 0, 1, 1,
1.556421, 0.8402519, 0.7203381, 1, 0, 0, 1, 1,
1.559986, 0.6016189, 1.075882, 0, 0, 0, 1, 1,
1.567256, -0.7023658, 0.873026, 0, 0, 0, 1, 1,
1.5741, 1.285208, 1.228328, 0, 0, 0, 1, 1,
1.57687, -0.6650458, 2.859708, 0, 0, 0, 1, 1,
1.592825, 0.8840425, -0.265161, 0, 0, 0, 1, 1,
1.601589, -1.253131, 3.287836, 0, 0, 0, 1, 1,
1.61006, -0.0007196327, 2.870607, 0, 0, 0, 1, 1,
1.635983, 0.2464493, 3.367927, 1, 1, 1, 1, 1,
1.650669, 1.384304, 1.914365, 1, 1, 1, 1, 1,
1.661992, -0.2249215, 1.571519, 1, 1, 1, 1, 1,
1.68407, 0.6761318, 0.6883418, 1, 1, 1, 1, 1,
1.68621, -0.5288833, 1.428729, 1, 1, 1, 1, 1,
1.690878, -0.6378466, 1.044205, 1, 1, 1, 1, 1,
1.695526, -0.356545, 1.511799, 1, 1, 1, 1, 1,
1.703356, 0.301044, 0.8139234, 1, 1, 1, 1, 1,
1.713542, -0.5763235, 2.490247, 1, 1, 1, 1, 1,
1.713873, 1.698741, 0.5676357, 1, 1, 1, 1, 1,
1.716711, 1.522334, 1.127399, 1, 1, 1, 1, 1,
1.730816, 1.650919, 1.220147, 1, 1, 1, 1, 1,
1.756056, -0.2183776, 1.729028, 1, 1, 1, 1, 1,
1.756092, 0.9852206, 2.183713, 1, 1, 1, 1, 1,
1.757239, -0.2785428, 1.841905, 1, 1, 1, 1, 1,
1.78194, 1.298543, 1.222229, 0, 0, 1, 1, 1,
1.80497, 0.5160447, 1.656807, 1, 0, 0, 1, 1,
1.815472, -0.7313224, 2.37351, 1, 0, 0, 1, 1,
1.817279, 0.3341218, 1.53194, 1, 0, 0, 1, 1,
1.831767, -0.7864612, 0.7204098, 1, 0, 0, 1, 1,
1.834279, 0.9595489, -0.30233, 1, 0, 0, 1, 1,
1.834942, -0.0312934, 2.9105, 0, 0, 0, 1, 1,
1.840938, 0.8575612, 0.2635227, 0, 0, 0, 1, 1,
1.855187, 0.4714956, 0.5411822, 0, 0, 0, 1, 1,
1.864725, 0.68624, 1.492684, 0, 0, 0, 1, 1,
1.871022, -1.008968, 3.651839, 0, 0, 0, 1, 1,
1.887503, 0.7775807, 1.4317, 0, 0, 0, 1, 1,
1.905821, -0.6116923, 1.437208, 0, 0, 0, 1, 1,
1.917545, 0.0234507, 1.533159, 1, 1, 1, 1, 1,
1.922029, -0.8420859, 3.101275, 1, 1, 1, 1, 1,
1.928469, -0.2205075, 2.611328, 1, 1, 1, 1, 1,
1.92878, 0.9073497, 2.334229, 1, 1, 1, 1, 1,
1.939024, 0.7541835, 2.019292, 1, 1, 1, 1, 1,
1.946633, 0.1644408, 3.468377, 1, 1, 1, 1, 1,
1.955137, -0.4817281, 1.95408, 1, 1, 1, 1, 1,
1.957636, -1.124811, 3.492722, 1, 1, 1, 1, 1,
1.958352, 0.608243, 2.317535, 1, 1, 1, 1, 1,
1.967588, -0.6446075, 2.35165, 1, 1, 1, 1, 1,
1.996212, -0.2807089, 1.408085, 1, 1, 1, 1, 1,
2.028014, -0.6492409, 1.925704, 1, 1, 1, 1, 1,
2.042768, -1.041003, 1.976974, 1, 1, 1, 1, 1,
2.051931, -1.760068, 2.768025, 1, 1, 1, 1, 1,
2.111141, 0.5382867, 1.355987, 1, 1, 1, 1, 1,
2.114184, 0.6777464, 1.212153, 0, 0, 1, 1, 1,
2.12582, -0.8680827, 1.246339, 1, 0, 0, 1, 1,
2.134171, 1.120049, 1.265107, 1, 0, 0, 1, 1,
2.213429, 1.787704, 1.765546, 1, 0, 0, 1, 1,
2.285017, 2.130199, 0.9867161, 1, 0, 0, 1, 1,
2.287932, 0.8820063, 1.77587, 1, 0, 0, 1, 1,
2.350192, -0.07099835, -0.1029796, 0, 0, 0, 1, 1,
2.351043, -0.9771798, -0.6959256, 0, 0, 0, 1, 1,
2.385801, -0.6659109, 4.114527, 0, 0, 0, 1, 1,
2.501139, -0.8625475, 1.16721, 0, 0, 0, 1, 1,
2.509887, 1.797901, 0.1982605, 0, 0, 0, 1, 1,
2.628288, -0.1731208, 1.362031, 0, 0, 0, 1, 1,
2.651139, 0.3901513, 1.953151, 0, 0, 0, 1, 1,
2.710875, -0.01391355, 0.5055527, 1, 1, 1, 1, 1,
2.712208, -1.106749, 2.603721, 1, 1, 1, 1, 1,
2.741625, -0.258387, 1.504504, 1, 1, 1, 1, 1,
2.916211, -0.1317059, -0.8924674, 1, 1, 1, 1, 1,
2.95927, -0.02008719, 2.513496, 1, 1, 1, 1, 1,
3.143651, 0.2083156, 1.287182, 1, 1, 1, 1, 1,
3.573027, -0.791927, 0.7847229, 1, 1, 1, 1, 1
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
var radius = 9.369965;
var distance = 32.91161;
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
mvMatrix.translate( -0.4067909, -0.2274342, -0.1853907 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.91161);
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
