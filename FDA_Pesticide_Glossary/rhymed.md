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
-2.990055, 1.301476, 0.1182079, 1, 0, 0, 1,
-2.981347, -0.8252938, -1.535009, 1, 0.007843138, 0, 1,
-2.914231, -0.5713505, -1.745581, 1, 0.01176471, 0, 1,
-2.874089, -0.4099844, -1.785376, 1, 0.01960784, 0, 1,
-2.813486, -1.326492, -2.76579, 1, 0.02352941, 0, 1,
-2.659809, -0.8494852, -2.066514, 1, 0.03137255, 0, 1,
-2.514493, -0.3331712, -1.533037, 1, 0.03529412, 0, 1,
-2.436561, 0.6269524, -3.043447, 1, 0.04313726, 0, 1,
-2.393543, -0.1627588, -2.382429, 1, 0.04705882, 0, 1,
-2.39352, 0.9179444, -1.428596, 1, 0.05490196, 0, 1,
-2.387034, 0.04378925, -3.04877, 1, 0.05882353, 0, 1,
-2.384866, 1.131191, -0.03771663, 1, 0.06666667, 0, 1,
-2.368284, -0.2702765, 1.297755, 1, 0.07058824, 0, 1,
-2.357777, 2.051939, -1.674242, 1, 0.07843138, 0, 1,
-2.328987, 2.113845, -1.008965, 1, 0.08235294, 0, 1,
-2.317521, -0.8151792, -2.248501, 1, 0.09019608, 0, 1,
-2.30244, -0.8237739, -1.728684, 1, 0.09411765, 0, 1,
-2.280439, -1.344419, -1.284292, 1, 0.1019608, 0, 1,
-2.276391, 0.5036024, -1.525917, 1, 0.1098039, 0, 1,
-2.146986, 0.570592, -0.2995833, 1, 0.1137255, 0, 1,
-2.141542, -0.1517755, -0.6045477, 1, 0.1215686, 0, 1,
-2.119895, 0.007478808, -1.61574, 1, 0.1254902, 0, 1,
-2.097879, -1.315149, -2.52827, 1, 0.1333333, 0, 1,
-2.083158, 0.8343556, -1.619844, 1, 0.1372549, 0, 1,
-2.065605, 0.5828995, -0.3418145, 1, 0.145098, 0, 1,
-2.014784, -0.7040936, -1.771075, 1, 0.1490196, 0, 1,
-1.99614, 0.879617, 0.08285142, 1, 0.1568628, 0, 1,
-1.991614, 1.477387, 0.3643777, 1, 0.1607843, 0, 1,
-1.991516, -1.423777, -3.358802, 1, 0.1686275, 0, 1,
-1.967539, -1.363097, -1.952685, 1, 0.172549, 0, 1,
-1.954063, 0.08522737, -2.272731, 1, 0.1803922, 0, 1,
-1.928922, -0.2546633, -1.206008, 1, 0.1843137, 0, 1,
-1.904891, 0.6489131, -0.5826581, 1, 0.1921569, 0, 1,
-1.864861, -0.03751189, -3.435275, 1, 0.1960784, 0, 1,
-1.864472, 0.544534, -1.712457, 1, 0.2039216, 0, 1,
-1.86185, -1.031868, -2.223051, 1, 0.2117647, 0, 1,
-1.859127, -0.2632586, -0.8232526, 1, 0.2156863, 0, 1,
-1.852002, -1.010159, -2.380419, 1, 0.2235294, 0, 1,
-1.851914, 0.4974058, -1.355202, 1, 0.227451, 0, 1,
-1.850765, -0.3451712, -1.371961, 1, 0.2352941, 0, 1,
-1.843367, 0.2461997, 0.3330209, 1, 0.2392157, 0, 1,
-1.810148, 0.1480949, -4.589405, 1, 0.2470588, 0, 1,
-1.789083, -0.7561289, -3.244667, 1, 0.2509804, 0, 1,
-1.771551, -1.393017, -2.56141, 1, 0.2588235, 0, 1,
-1.766048, 0.1556412, -0.9889358, 1, 0.2627451, 0, 1,
-1.749827, -0.03001032, -2.426761, 1, 0.2705882, 0, 1,
-1.746694, -0.4463536, -0.6568978, 1, 0.2745098, 0, 1,
-1.722228, -0.8927215, -1.61949, 1, 0.282353, 0, 1,
-1.719407, -1.578417, -3.206502, 1, 0.2862745, 0, 1,
-1.701654, 0.4789395, 0.2138869, 1, 0.2941177, 0, 1,
-1.686116, 0.06118742, -1.087143, 1, 0.3019608, 0, 1,
-1.685805, -0.6130199, -2.827897, 1, 0.3058824, 0, 1,
-1.683952, 0.2461341, -2.153085, 1, 0.3137255, 0, 1,
-1.677473, -0.9984695, -2.234175, 1, 0.3176471, 0, 1,
-1.66625, 1.324613, -2.134503, 1, 0.3254902, 0, 1,
-1.661721, -0.9176672, -3.183014, 1, 0.3294118, 0, 1,
-1.661181, 0.8037733, -1.932034, 1, 0.3372549, 0, 1,
-1.652637, -1.180033, 0.107239, 1, 0.3411765, 0, 1,
-1.621282, 1.196106, -2.058355, 1, 0.3490196, 0, 1,
-1.620869, 1.900559, -0.6094993, 1, 0.3529412, 0, 1,
-1.619981, 0.5246031, -1.044433, 1, 0.3607843, 0, 1,
-1.58999, -0.347274, -2.086861, 1, 0.3647059, 0, 1,
-1.589703, 1.073109, -2.819975, 1, 0.372549, 0, 1,
-1.577634, -0.6376348, -1.957458, 1, 0.3764706, 0, 1,
-1.57449, -0.5593365, 0.1542325, 1, 0.3843137, 0, 1,
-1.560612, 0.1784117, -2.055879, 1, 0.3882353, 0, 1,
-1.55353, -0.1914503, -2.843606, 1, 0.3960784, 0, 1,
-1.538375, 0.4066498, -0.5965664, 1, 0.4039216, 0, 1,
-1.535618, -3.029999, -2.731094, 1, 0.4078431, 0, 1,
-1.532403, -0.8252935, -2.510917, 1, 0.4156863, 0, 1,
-1.530558, -0.676196, -4.36214, 1, 0.4196078, 0, 1,
-1.518329, 0.1050216, -3.067777, 1, 0.427451, 0, 1,
-1.5081, 0.3551568, 0.5766572, 1, 0.4313726, 0, 1,
-1.502434, -0.2565529, -3.207965, 1, 0.4392157, 0, 1,
-1.482642, 0.4017818, -1.123405, 1, 0.4431373, 0, 1,
-1.469857, 0.7520642, -0.5701439, 1, 0.4509804, 0, 1,
-1.467667, -0.8510906, -2.007741, 1, 0.454902, 0, 1,
-1.465794, 0.2211504, -2.749538, 1, 0.4627451, 0, 1,
-1.458022, -1.688175, -1.779645, 1, 0.4666667, 0, 1,
-1.45371, 0.1664971, -1.574612, 1, 0.4745098, 0, 1,
-1.452085, -1.410189, -2.427593, 1, 0.4784314, 0, 1,
-1.444497, -1.594766, -1.834619, 1, 0.4862745, 0, 1,
-1.43543, 1.093726, -2.009266, 1, 0.4901961, 0, 1,
-1.426474, 0.1818031, -0.9011154, 1, 0.4980392, 0, 1,
-1.424079, 0.3120723, -1.005141, 1, 0.5058824, 0, 1,
-1.423247, 0.7436725, -0.636102, 1, 0.509804, 0, 1,
-1.420063, -0.1354917, -1.555405, 1, 0.5176471, 0, 1,
-1.41219, 1.113935, -1.843148, 1, 0.5215687, 0, 1,
-1.410897, 2.135317, 0.1439969, 1, 0.5294118, 0, 1,
-1.40397, -1.393961, -2.607432, 1, 0.5333334, 0, 1,
-1.39887, 0.4641019, -2.136141, 1, 0.5411765, 0, 1,
-1.392449, -1.491713, 0.05834464, 1, 0.5450981, 0, 1,
-1.39139, -0.2520773, -1.294971, 1, 0.5529412, 0, 1,
-1.390917, -0.1823725, -1.696182, 1, 0.5568628, 0, 1,
-1.387819, 0.4356198, 0.8328583, 1, 0.5647059, 0, 1,
-1.380554, 0.3889244, 0.03249249, 1, 0.5686275, 0, 1,
-1.379841, 0.472928, -1.752375, 1, 0.5764706, 0, 1,
-1.370073, -0.3526267, -2.60861, 1, 0.5803922, 0, 1,
-1.36821, 2.190603, 0.1627659, 1, 0.5882353, 0, 1,
-1.361981, 1.582462, -0.7487727, 1, 0.5921569, 0, 1,
-1.355892, 0.8617383, 0.4849553, 1, 0.6, 0, 1,
-1.355337, -1.27999, -1.761809, 1, 0.6078432, 0, 1,
-1.344085, 0.5048497, 0.1557134, 1, 0.6117647, 0, 1,
-1.34203, -0.641211, -0.7163796, 1, 0.6196079, 0, 1,
-1.338894, 0.2504884, -4.720867, 1, 0.6235294, 0, 1,
-1.335257, -0.4032589, -3.077718, 1, 0.6313726, 0, 1,
-1.328931, -1.129239, -2.88525, 1, 0.6352941, 0, 1,
-1.326764, 1.287397, -1.744938, 1, 0.6431373, 0, 1,
-1.324765, -0.4216857, -1.001829, 1, 0.6470588, 0, 1,
-1.320576, -1.076931, -2.448663, 1, 0.654902, 0, 1,
-1.318565, 0.2776116, -0.3005742, 1, 0.6588235, 0, 1,
-1.315268, -0.4612534, -1.055596, 1, 0.6666667, 0, 1,
-1.314105, 0.4115738, -1.231105, 1, 0.6705883, 0, 1,
-1.306177, -0.2336514, -1.756226, 1, 0.6784314, 0, 1,
-1.297608, 0.8396534, -1.96814, 1, 0.682353, 0, 1,
-1.28315, 2.056922, 0.1831447, 1, 0.6901961, 0, 1,
-1.281539, -0.1737045, -1.315264, 1, 0.6941177, 0, 1,
-1.279238, 0.3376006, -1.655324, 1, 0.7019608, 0, 1,
-1.274993, -0.2440001, -2.911027, 1, 0.7098039, 0, 1,
-1.272812, -0.2935651, -1.240011, 1, 0.7137255, 0, 1,
-1.272568, -1.645268, -2.563552, 1, 0.7215686, 0, 1,
-1.27001, 2.034289, 0.01265569, 1, 0.7254902, 0, 1,
-1.260171, -1.390969, -1.420459, 1, 0.7333333, 0, 1,
-1.258491, 1.528388, -2.272029, 1, 0.7372549, 0, 1,
-1.24859, 1.16192, -0.06684998, 1, 0.7450981, 0, 1,
-1.247775, 0.2605501, -2.763369, 1, 0.7490196, 0, 1,
-1.242367, -0.3804691, -1.866716, 1, 0.7568628, 0, 1,
-1.229009, 1.649325, -1.727414, 1, 0.7607843, 0, 1,
-1.225245, 0.5329099, -1.257733, 1, 0.7686275, 0, 1,
-1.224877, 1.112526, -1.874971, 1, 0.772549, 0, 1,
-1.221471, 0.7418677, 0.3744007, 1, 0.7803922, 0, 1,
-1.217741, 0.2119713, 0.3870364, 1, 0.7843137, 0, 1,
-1.214561, 1.5782, 2.203063, 1, 0.7921569, 0, 1,
-1.210302, 0.393375, -0.5078127, 1, 0.7960784, 0, 1,
-1.205697, -0.6621079, -3.010573, 1, 0.8039216, 0, 1,
-1.202187, -1.046565, -2.950364, 1, 0.8117647, 0, 1,
-1.201848, -0.2310844, -1.062039, 1, 0.8156863, 0, 1,
-1.199985, -0.843262, -4.042056, 1, 0.8235294, 0, 1,
-1.197773, 0.2757494, -3.145677, 1, 0.827451, 0, 1,
-1.195565, 0.6489601, 0.4666549, 1, 0.8352941, 0, 1,
-1.192185, 0.2977748, -2.14009, 1, 0.8392157, 0, 1,
-1.167838, 1.062676, -2.007369, 1, 0.8470588, 0, 1,
-1.166693, -0.467922, -1.681505, 1, 0.8509804, 0, 1,
-1.165322, 1.195011, -3.351643, 1, 0.8588235, 0, 1,
-1.161094, -0.5300408, -2.240437, 1, 0.8627451, 0, 1,
-1.15764, 0.7867515, 0.3859396, 1, 0.8705882, 0, 1,
-1.14446, -1.522245, -2.566827, 1, 0.8745098, 0, 1,
-1.143185, 1.252295, -1.106529, 1, 0.8823529, 0, 1,
-1.137927, -0.3377841, -2.792617, 1, 0.8862745, 0, 1,
-1.134539, -0.6139413, -3.300103, 1, 0.8941177, 0, 1,
-1.13367, 0.3731799, -1.104438, 1, 0.8980392, 0, 1,
-1.132115, 1.205479, -1.104595, 1, 0.9058824, 0, 1,
-1.131018, -1.149847, -2.662528, 1, 0.9137255, 0, 1,
-1.130684, 0.3061847, -2.010083, 1, 0.9176471, 0, 1,
-1.1234, -0.9965117, -3.186174, 1, 0.9254902, 0, 1,
-1.11126, 0.3362644, -0.5782105, 1, 0.9294118, 0, 1,
-1.106491, -1.183828, -2.081578, 1, 0.9372549, 0, 1,
-1.104056, 0.1061888, -0.956197, 1, 0.9411765, 0, 1,
-1.102378, -0.2608196, -1.252823, 1, 0.9490196, 0, 1,
-1.099815, 2.069437, -1.226683, 1, 0.9529412, 0, 1,
-1.098186, -0.3971851, -3.52695, 1, 0.9607843, 0, 1,
-1.091475, -0.4108803, -1.688207, 1, 0.9647059, 0, 1,
-1.088568, -0.9110289, -2.970634, 1, 0.972549, 0, 1,
-1.085787, -1.881713, -1.332792, 1, 0.9764706, 0, 1,
-1.082661, -0.6431485, -1.473873, 1, 0.9843137, 0, 1,
-1.067791, 1.753327, -0.928546, 1, 0.9882353, 0, 1,
-1.063442, -0.1987715, -0.4598545, 1, 0.9960784, 0, 1,
-1.063184, 1.341692, 0.1608532, 0.9960784, 1, 0, 1,
-1.06124, 1.060856, -1.015574, 0.9921569, 1, 0, 1,
-1.058636, 0.3027637, -2.433213, 0.9843137, 1, 0, 1,
-1.054122, -1.948442, -1.674332, 0.9803922, 1, 0, 1,
-1.050626, 0.3442507, -0.5130154, 0.972549, 1, 0, 1,
-1.03827, -0.2814218, -2.364174, 0.9686275, 1, 0, 1,
-1.037493, 2.459301, 0.357875, 0.9607843, 1, 0, 1,
-1.031233, -0.01708564, -0.9835549, 0.9568627, 1, 0, 1,
-1.029539, 0.2328858, 0.4682464, 0.9490196, 1, 0, 1,
-1.02468, 0.08650139, -0.5966171, 0.945098, 1, 0, 1,
-1.020046, 1.321755, 0.4690758, 0.9372549, 1, 0, 1,
-1.01984, 0.4885236, 0.03087628, 0.9333333, 1, 0, 1,
-1.016979, -0.2208024, -1.042804, 0.9254902, 1, 0, 1,
-1.015151, -0.6092519, -1.190784, 0.9215686, 1, 0, 1,
-1.012813, 0.1143049, -3.319885, 0.9137255, 1, 0, 1,
-1.01274, -0.1272183, -1.456934, 0.9098039, 1, 0, 1,
-1.008999, 2.091605, -1.437493, 0.9019608, 1, 0, 1,
-1.007866, -1.037296, -2.197557, 0.8941177, 1, 0, 1,
-1.005806, 0.9809501, -2.151343, 0.8901961, 1, 0, 1,
-1.001372, -0.7235023, -1.764418, 0.8823529, 1, 0, 1,
-0.9980634, -0.3315, -1.184256, 0.8784314, 1, 0, 1,
-0.9938898, 0.7342991, -0.4902412, 0.8705882, 1, 0, 1,
-0.9921036, -0.8929452, -2.194162, 0.8666667, 1, 0, 1,
-0.9670006, -1.129931, -2.20856, 0.8588235, 1, 0, 1,
-0.9506409, -0.7636715, -3.008649, 0.854902, 1, 0, 1,
-0.9478876, -1.706145, -2.480692, 0.8470588, 1, 0, 1,
-0.9383269, -0.05241094, -1.322289, 0.8431373, 1, 0, 1,
-0.9332365, -0.5108989, -2.680678, 0.8352941, 1, 0, 1,
-0.9273526, 0.2531113, -2.110664, 0.8313726, 1, 0, 1,
-0.9266193, -0.04396889, -1.69443, 0.8235294, 1, 0, 1,
-0.9235262, -0.1333774, -3.489655, 0.8196079, 1, 0, 1,
-0.9148285, 1.78531, -0.9576375, 0.8117647, 1, 0, 1,
-0.9133578, 2.417544, -0.1704967, 0.8078431, 1, 0, 1,
-0.9081806, 0.1277248, -1.296647, 0.8, 1, 0, 1,
-0.9014623, 0.9570821, -0.7466107, 0.7921569, 1, 0, 1,
-0.9003494, -2.065332, -3.176545, 0.7882353, 1, 0, 1,
-0.8969339, 0.2163801, -1.752516, 0.7803922, 1, 0, 1,
-0.8949893, 2.697828, -0.5453734, 0.7764706, 1, 0, 1,
-0.8913111, 0.9097016, 0.1590509, 0.7686275, 1, 0, 1,
-0.8905373, -1.322714, -2.904432, 0.7647059, 1, 0, 1,
-0.8848313, -1.645191, -1.591256, 0.7568628, 1, 0, 1,
-0.8830336, -0.1515194, -1.600079, 0.7529412, 1, 0, 1,
-0.8767641, -1.000444, -3.128393, 0.7450981, 1, 0, 1,
-0.8756837, 1.019885, -1.887682, 0.7411765, 1, 0, 1,
-0.8723015, 0.361219, -1.387702, 0.7333333, 1, 0, 1,
-0.8671428, 0.4990581, -0.5039224, 0.7294118, 1, 0, 1,
-0.8658158, -0.2248808, -1.651582, 0.7215686, 1, 0, 1,
-0.8653652, -0.1695477, -1.791069, 0.7176471, 1, 0, 1,
-0.8626402, -0.09401345, -2.5672, 0.7098039, 1, 0, 1,
-0.8607566, 2.326016, 1.316123, 0.7058824, 1, 0, 1,
-0.8585517, 0.1450559, -0.103723, 0.6980392, 1, 0, 1,
-0.8516587, 0.8078678, 0.2844478, 0.6901961, 1, 0, 1,
-0.8472271, -1.0336, -1.942241, 0.6862745, 1, 0, 1,
-0.8409212, 0.09774596, -2.625145, 0.6784314, 1, 0, 1,
-0.834215, -0.08424527, -1.096915, 0.6745098, 1, 0, 1,
-0.8332121, 1.179971, -0.9596627, 0.6666667, 1, 0, 1,
-0.8325931, 1.631396, 0.9986647, 0.6627451, 1, 0, 1,
-0.824572, 1.692209, -0.08866572, 0.654902, 1, 0, 1,
-0.823885, 0.910867, -0.1137432, 0.6509804, 1, 0, 1,
-0.8229641, -0.4976966, -2.433537, 0.6431373, 1, 0, 1,
-0.8154395, -0.674876, -1.329688, 0.6392157, 1, 0, 1,
-0.8130201, -0.5363644, -1.314426, 0.6313726, 1, 0, 1,
-0.8104157, 1.655715, -1.237913, 0.627451, 1, 0, 1,
-0.8101744, 0.7580822, 0.6701359, 0.6196079, 1, 0, 1,
-0.8098075, -1.193809, -3.982328, 0.6156863, 1, 0, 1,
-0.8091939, 0.647818, -0.02111976, 0.6078432, 1, 0, 1,
-0.8088282, -1.134934, -2.588252, 0.6039216, 1, 0, 1,
-0.8006346, -1.288236, -1.594036, 0.5960785, 1, 0, 1,
-0.7998394, -0.5481776, -1.514885, 0.5882353, 1, 0, 1,
-0.7884045, 1.496436, -0.05811235, 0.5843138, 1, 0, 1,
-0.7876106, 0.3934551, -0.8341904, 0.5764706, 1, 0, 1,
-0.778732, -0.4912429, -1.438461, 0.572549, 1, 0, 1,
-0.7785674, 1.238883, -1.787777, 0.5647059, 1, 0, 1,
-0.7737624, 1.045411, -1.58637, 0.5607843, 1, 0, 1,
-0.7717448, 0.2579584, -0.001631735, 0.5529412, 1, 0, 1,
-0.7697192, -0.2482501, -3.594475, 0.5490196, 1, 0, 1,
-0.7646755, -0.06608497, -1.216832, 0.5411765, 1, 0, 1,
-0.7616687, 0.1963129, 0.9252849, 0.5372549, 1, 0, 1,
-0.757468, 0.4043633, -1.114221, 0.5294118, 1, 0, 1,
-0.7525572, 0.7066013, -2.192873, 0.5254902, 1, 0, 1,
-0.7453805, 0.2303147, -0.9026361, 0.5176471, 1, 0, 1,
-0.743928, 0.5660664, -0.885408, 0.5137255, 1, 0, 1,
-0.7428778, 1.364763, -0.1363736, 0.5058824, 1, 0, 1,
-0.7368206, 2.327062, -2.675272, 0.5019608, 1, 0, 1,
-0.7363681, -0.1635377, -0.5286856, 0.4941176, 1, 0, 1,
-0.7352517, -0.6877733, -1.259541, 0.4862745, 1, 0, 1,
-0.7317694, -1.052391, -1.775121, 0.4823529, 1, 0, 1,
-0.7260284, -1.167876, -1.735717, 0.4745098, 1, 0, 1,
-0.718439, -0.4441241, -1.124166, 0.4705882, 1, 0, 1,
-0.717091, 1.429552, 0.4442421, 0.4627451, 1, 0, 1,
-0.7121876, 1.930061, -1.185236, 0.4588235, 1, 0, 1,
-0.709193, -0.9047949, -1.444188, 0.4509804, 1, 0, 1,
-0.7032505, 0.5657874, -0.08343884, 0.4470588, 1, 0, 1,
-0.7021081, 1.509317, -0.1822342, 0.4392157, 1, 0, 1,
-0.7008788, 1.880861, -0.7817758, 0.4352941, 1, 0, 1,
-0.6972644, -0.2315455, -1.76924, 0.427451, 1, 0, 1,
-0.6907125, -0.9178741, -3.456847, 0.4235294, 1, 0, 1,
-0.6901843, -0.8177728, -2.900022, 0.4156863, 1, 0, 1,
-0.6874958, -1.568194, -1.655575, 0.4117647, 1, 0, 1,
-0.6874252, -1.639801, -2.576315, 0.4039216, 1, 0, 1,
-0.686055, 0.3757764, -1.251563, 0.3960784, 1, 0, 1,
-0.6826076, -0.4519843, -2.956304, 0.3921569, 1, 0, 1,
-0.6811889, 0.1700934, -2.513475, 0.3843137, 1, 0, 1,
-0.6794179, 1.551521, 0.6085252, 0.3803922, 1, 0, 1,
-0.6783685, 0.2971231, -0.6836134, 0.372549, 1, 0, 1,
-0.6765468, -3.171654, -3.396512, 0.3686275, 1, 0, 1,
-0.6733433, 2.823623, -1.426814, 0.3607843, 1, 0, 1,
-0.6705052, 2.396006, -0.8451278, 0.3568628, 1, 0, 1,
-0.6582087, 1.927888, -1.255743, 0.3490196, 1, 0, 1,
-0.6579014, -0.913522, -3.612753, 0.345098, 1, 0, 1,
-0.6521235, -1.256347, -1.460797, 0.3372549, 1, 0, 1,
-0.6518307, 0.568845, -1.001714, 0.3333333, 1, 0, 1,
-0.6487989, -1.291112, -0.3066868, 0.3254902, 1, 0, 1,
-0.6426034, 1.109707, -1.148675, 0.3215686, 1, 0, 1,
-0.6424036, 2.426316, -0.0298603, 0.3137255, 1, 0, 1,
-0.6401325, 1.159863, -0.5127002, 0.3098039, 1, 0, 1,
-0.6396864, -0.5649799, -1.840639, 0.3019608, 1, 0, 1,
-0.6384694, 0.3345671, -1.690812, 0.2941177, 1, 0, 1,
-0.6367658, -0.7374706, -2.595078, 0.2901961, 1, 0, 1,
-0.6348291, 0.9025819, -0.7713403, 0.282353, 1, 0, 1,
-0.6331808, -0.5334647, -3.966177, 0.2784314, 1, 0, 1,
-0.633176, -1.587683, -2.115939, 0.2705882, 1, 0, 1,
-0.6317596, 0.6125353, -0.5979205, 0.2666667, 1, 0, 1,
-0.6272906, 0.373769, -1.313706, 0.2588235, 1, 0, 1,
-0.6267845, -0.2794162, -2.918212, 0.254902, 1, 0, 1,
-0.6262787, 0.4114952, -1.391359, 0.2470588, 1, 0, 1,
-0.6215907, -0.03218224, -1.59775, 0.2431373, 1, 0, 1,
-0.6191259, -1.569199, -3.560077, 0.2352941, 1, 0, 1,
-0.6185929, -1.135923, -2.074066, 0.2313726, 1, 0, 1,
-0.6184832, 0.09621406, -0.04155569, 0.2235294, 1, 0, 1,
-0.6184247, -0.4240386, -0.1304694, 0.2196078, 1, 0, 1,
-0.6148397, 1.063934, -0.4841724, 0.2117647, 1, 0, 1,
-0.6108397, 0.02036451, 0.6757036, 0.2078431, 1, 0, 1,
-0.6065037, 0.5985548, -0.2272091, 0.2, 1, 0, 1,
-0.6015179, 2.388264, -2.259138, 0.1921569, 1, 0, 1,
-0.6013741, -0.1978751, -0.02540439, 0.1882353, 1, 0, 1,
-0.5904613, 1.199324, 0.4880611, 0.1803922, 1, 0, 1,
-0.585977, -0.3548577, -1.689196, 0.1764706, 1, 0, 1,
-0.5846651, -1.277313, -1.432309, 0.1686275, 1, 0, 1,
-0.5806154, -0.7902355, -1.74944, 0.1647059, 1, 0, 1,
-0.5802862, -0.2043949, -1.15107, 0.1568628, 1, 0, 1,
-0.5801069, -0.08925736, -2.415322, 0.1529412, 1, 0, 1,
-0.5761616, 0.4247591, 0.4777908, 0.145098, 1, 0, 1,
-0.5693191, -0.765424, -3.092203, 0.1411765, 1, 0, 1,
-0.5688391, -1.031539, -2.999913, 0.1333333, 1, 0, 1,
-0.5674484, -0.1334658, -3.775952, 0.1294118, 1, 0, 1,
-0.5660017, 0.2820427, -1.429288, 0.1215686, 1, 0, 1,
-0.5567153, 0.1649453, -1.505531, 0.1176471, 1, 0, 1,
-0.5559773, -1.091087, -3.263264, 0.1098039, 1, 0, 1,
-0.5540999, 1.114313, -0.01190081, 0.1058824, 1, 0, 1,
-0.5522788, 0.8270695, -1.393555, 0.09803922, 1, 0, 1,
-0.5518378, 1.027409, -2.527434, 0.09019608, 1, 0, 1,
-0.547543, 0.4287739, -3.169803, 0.08627451, 1, 0, 1,
-0.5405211, -0.3871784, -2.636185, 0.07843138, 1, 0, 1,
-0.5388626, -1.284538, -1.907084, 0.07450981, 1, 0, 1,
-0.5375618, -0.5882264, -0.4727626, 0.06666667, 1, 0, 1,
-0.5328057, -0.3555385, -2.519851, 0.0627451, 1, 0, 1,
-0.5288318, -0.07604509, -3.171653, 0.05490196, 1, 0, 1,
-0.5283085, 2.7849, 2.096182, 0.05098039, 1, 0, 1,
-0.5248623, 1.904505, 0.544148, 0.04313726, 1, 0, 1,
-0.5240506, 0.1047335, -1.969071, 0.03921569, 1, 0, 1,
-0.5226729, 1.449192, -0.4532504, 0.03137255, 1, 0, 1,
-0.5140167, 0.8936376, 0.215309, 0.02745098, 1, 0, 1,
-0.4985821, 0.1454963, 0.3556307, 0.01960784, 1, 0, 1,
-0.4979096, 0.3751709, -0.8325487, 0.01568628, 1, 0, 1,
-0.4974584, 1.119959, -0.5991805, 0.007843138, 1, 0, 1,
-0.4974133, 1.229927, -0.4087547, 0.003921569, 1, 0, 1,
-0.4953594, 0.940637, 0.9396622, 0, 1, 0.003921569, 1,
-0.4936165, 0.06417431, -2.441107, 0, 1, 0.01176471, 1,
-0.4921286, 2.106453, -0.7806732, 0, 1, 0.01568628, 1,
-0.4890466, 0.1488075, -0.9746065, 0, 1, 0.02352941, 1,
-0.4827279, 0.1794122, -0.2782034, 0, 1, 0.02745098, 1,
-0.4795907, -0.2458167, -1.458888, 0, 1, 0.03529412, 1,
-0.4760951, 0.1785261, -0.9102611, 0, 1, 0.03921569, 1,
-0.4738418, 0.540599, -0.1550258, 0, 1, 0.04705882, 1,
-0.4698841, -1.164467, -3.026207, 0, 1, 0.05098039, 1,
-0.4678602, 0.3186956, -1.333765, 0, 1, 0.05882353, 1,
-0.4678303, -0.4671219, -2.629054, 0, 1, 0.0627451, 1,
-0.4607947, -1.213849, -2.95813, 0, 1, 0.07058824, 1,
-0.459294, -2.037439, -4.813604, 0, 1, 0.07450981, 1,
-0.4560745, 1.94814, -0.3775331, 0, 1, 0.08235294, 1,
-0.4521782, -0.6861416, -3.719528, 0, 1, 0.08627451, 1,
-0.449528, -1.171062, -3.225222, 0, 1, 0.09411765, 1,
-0.4456324, 0.5484248, -1.267114, 0, 1, 0.1019608, 1,
-0.4454129, 0.8883427, -1.431121, 0, 1, 0.1058824, 1,
-0.4428504, -1.215577, -3.156334, 0, 1, 0.1137255, 1,
-0.4414678, -0.3257687, -4.04397, 0, 1, 0.1176471, 1,
-0.4387772, 0.0168588, -0.6360331, 0, 1, 0.1254902, 1,
-0.4384463, 0.1126681, -1.060765, 0, 1, 0.1294118, 1,
-0.435517, 0.8987971, -0.3691605, 0, 1, 0.1372549, 1,
-0.4314422, -0.4594975, -1.744978, 0, 1, 0.1411765, 1,
-0.4299431, 1.850265, -1.451523, 0, 1, 0.1490196, 1,
-0.4276132, -1.985915, -3.604994, 0, 1, 0.1529412, 1,
-0.4180837, -2.073982, -3.24732, 0, 1, 0.1607843, 1,
-0.4056463, 2.15888, -0.04432144, 0, 1, 0.1647059, 1,
-0.3995416, -1.050938, -2.599792, 0, 1, 0.172549, 1,
-0.3921025, 0.2886944, -1.961812, 0, 1, 0.1764706, 1,
-0.3890325, -2.671074, -3.349117, 0, 1, 0.1843137, 1,
-0.3815146, -0.6371221, -3.51291, 0, 1, 0.1882353, 1,
-0.3800658, -0.1874901, -1.157901, 0, 1, 0.1960784, 1,
-0.37737, 0.008255783, -0.987436, 0, 1, 0.2039216, 1,
-0.3742746, 2.091376, 0.9700423, 0, 1, 0.2078431, 1,
-0.369949, 0.9062409, -0.8876638, 0, 1, 0.2156863, 1,
-0.3640225, 1.251671, 0.002727481, 0, 1, 0.2196078, 1,
-0.3544559, -1.242417, -2.27915, 0, 1, 0.227451, 1,
-0.3538031, 0.7159026, -1.164564, 0, 1, 0.2313726, 1,
-0.3530315, 0.2612486, -0.09223492, 0, 1, 0.2392157, 1,
-0.3519415, 0.4848151, -0.3703423, 0, 1, 0.2431373, 1,
-0.3510024, -0.8739842, -3.165634, 0, 1, 0.2509804, 1,
-0.3509694, -0.2562051, -1.244136, 0, 1, 0.254902, 1,
-0.3482122, 0.1674582, -0.97933, 0, 1, 0.2627451, 1,
-0.347318, -2.249636, -1.187333, 0, 1, 0.2666667, 1,
-0.3404763, 1.180823, -0.0780673, 0, 1, 0.2745098, 1,
-0.3337209, 0.7700365, -0.4779983, 0, 1, 0.2784314, 1,
-0.3284048, -0.4653775, -1.258676, 0, 1, 0.2862745, 1,
-0.3255358, -0.7801045, -1.842941, 0, 1, 0.2901961, 1,
-0.3253414, -0.2017196, -2.230917, 0, 1, 0.2980392, 1,
-0.3216352, -0.08427145, -0.351975, 0, 1, 0.3058824, 1,
-0.3178779, 0.9208703, -0.3640817, 0, 1, 0.3098039, 1,
-0.3076287, 1.969451, 1.475629, 0, 1, 0.3176471, 1,
-0.3075593, 0.5433437, -1.612483, 0, 1, 0.3215686, 1,
-0.3072144, 0.6353287, 0.3679101, 0, 1, 0.3294118, 1,
-0.3030199, 1.111784, 1.349162, 0, 1, 0.3333333, 1,
-0.3020521, 0.3594014, -0.7797949, 0, 1, 0.3411765, 1,
-0.3006531, 0.3396315, -0.337209, 0, 1, 0.345098, 1,
-0.2971381, 1.222504, -0.3177683, 0, 1, 0.3529412, 1,
-0.294948, 0.5859907, -0.2384668, 0, 1, 0.3568628, 1,
-0.294926, 0.2000887, -2.582619, 0, 1, 0.3647059, 1,
-0.2917049, 0.7089994, 1.063625, 0, 1, 0.3686275, 1,
-0.2898381, -0.0561954, -0.9050283, 0, 1, 0.3764706, 1,
-0.2880381, 1.047599, -1.712774, 0, 1, 0.3803922, 1,
-0.283014, 0.8779203, 0.3231749, 0, 1, 0.3882353, 1,
-0.2808228, 0.1608631, -1.463245, 0, 1, 0.3921569, 1,
-0.2777562, -1.289678, -3.316297, 0, 1, 0.4, 1,
-0.276916, -1.091892, -2.28951, 0, 1, 0.4078431, 1,
-0.2727406, 0.7574924, -2.007257, 0, 1, 0.4117647, 1,
-0.2726499, 1.825393, -2.07847, 0, 1, 0.4196078, 1,
-0.2697059, -0.08200578, -1.611429, 0, 1, 0.4235294, 1,
-0.2677356, -2.351014, -4.777093, 0, 1, 0.4313726, 1,
-0.2677016, -0.1898333, -2.819423, 0, 1, 0.4352941, 1,
-0.2633436, -0.7472572, -1.096971, 0, 1, 0.4431373, 1,
-0.2626897, 0.2755828, 0.04790397, 0, 1, 0.4470588, 1,
-0.2615642, 0.5321195, 1.508788, 0, 1, 0.454902, 1,
-0.2581399, 0.09722441, -1.230224, 0, 1, 0.4588235, 1,
-0.2488002, 0.335288, -0.8086268, 0, 1, 0.4666667, 1,
-0.2487807, 0.1060339, -1.799956, 0, 1, 0.4705882, 1,
-0.2482516, 1.113324, 0.654806, 0, 1, 0.4784314, 1,
-0.2416596, 0.6802735, -0.6205404, 0, 1, 0.4823529, 1,
-0.2367644, 0.6152795, 0.1967652, 0, 1, 0.4901961, 1,
-0.2309885, 1.016844, 0.2045386, 0, 1, 0.4941176, 1,
-0.2303978, -0.3508576, -2.048277, 0, 1, 0.5019608, 1,
-0.2279044, 1.28413, 0.2051571, 0, 1, 0.509804, 1,
-0.2134175, 0.1503691, -1.990829, 0, 1, 0.5137255, 1,
-0.2112538, -1.490347, -3.004514, 0, 1, 0.5215687, 1,
-0.2100556, -0.6494256, -3.600292, 0, 1, 0.5254902, 1,
-0.2087814, -0.7004125, -2.786873, 0, 1, 0.5333334, 1,
-0.2085844, 1.077672, -0.4007043, 0, 1, 0.5372549, 1,
-0.2057244, 1.506192, 0.9924534, 0, 1, 0.5450981, 1,
-0.2025055, -0.8221571, -1.487263, 0, 1, 0.5490196, 1,
-0.1996645, -0.9753836, -2.505786, 0, 1, 0.5568628, 1,
-0.1996394, -0.8169627, -1.1063, 0, 1, 0.5607843, 1,
-0.1990671, 0.1965343, 0.558132, 0, 1, 0.5686275, 1,
-0.19824, 0.9737154, 0.4673274, 0, 1, 0.572549, 1,
-0.1974663, -0.2188012, -3.650452, 0, 1, 0.5803922, 1,
-0.196326, 2.802436, 0.8391696, 0, 1, 0.5843138, 1,
-0.1937342, -0.771802, -2.883198, 0, 1, 0.5921569, 1,
-0.1920033, 1.533094, -0.8466311, 0, 1, 0.5960785, 1,
-0.1798933, 0.2487617, -0.4784926, 0, 1, 0.6039216, 1,
-0.1795159, -0.7580573, -2.994499, 0, 1, 0.6117647, 1,
-0.1789846, -1.960892, -3.492622, 0, 1, 0.6156863, 1,
-0.1751953, -0.701055, -1.421305, 0, 1, 0.6235294, 1,
-0.1749482, 0.4364549, -0.05848239, 0, 1, 0.627451, 1,
-0.1725929, 0.1274735, -1.325639, 0, 1, 0.6352941, 1,
-0.1702496, 0.4791955, 0.09648857, 0, 1, 0.6392157, 1,
-0.1698887, 0.6963923, -1.558735, 0, 1, 0.6470588, 1,
-0.1685652, 0.1322796, -0.2583744, 0, 1, 0.6509804, 1,
-0.1634476, -0.7643327, -3.680735, 0, 1, 0.6588235, 1,
-0.1616531, 1.342509, -1.240473, 0, 1, 0.6627451, 1,
-0.160636, -1.559613, -3.94612, 0, 1, 0.6705883, 1,
-0.1591868, -0.7091329, -2.786038, 0, 1, 0.6745098, 1,
-0.1522921, 0.1609775, -0.1219458, 0, 1, 0.682353, 1,
-0.1502595, -1.547584, -1.996797, 0, 1, 0.6862745, 1,
-0.1484129, -0.2242859, -3.705309, 0, 1, 0.6941177, 1,
-0.1468554, 1.005788, 0.6097276, 0, 1, 0.7019608, 1,
-0.1461391, 1.038202, 1.540226, 0, 1, 0.7058824, 1,
-0.1442203, 0.9915612, -1.385133, 0, 1, 0.7137255, 1,
-0.1394614, -0.4139786, -2.581515, 0, 1, 0.7176471, 1,
-0.1359673, 1.671686, -1.34766, 0, 1, 0.7254902, 1,
-0.1337005, -1.15753, -1.836626, 0, 1, 0.7294118, 1,
-0.1326204, 0.3096364, -0.4114066, 0, 1, 0.7372549, 1,
-0.1228044, -2.262796, -3.615227, 0, 1, 0.7411765, 1,
-0.1197937, -1.485589, -2.634218, 0, 1, 0.7490196, 1,
-0.1187512, -0.09628674, -3.209841, 0, 1, 0.7529412, 1,
-0.116505, -0.3989783, -0.5264194, 0, 1, 0.7607843, 1,
-0.1160131, 0.462094, 0.6793181, 0, 1, 0.7647059, 1,
-0.1134578, -0.07239029, -2.406597, 0, 1, 0.772549, 1,
-0.1080061, 0.94121, 0.9240713, 0, 1, 0.7764706, 1,
-0.1047818, -1.796127, -2.345778, 0, 1, 0.7843137, 1,
-0.1024031, -0.3619094, -1.087201, 0, 1, 0.7882353, 1,
-0.1022355, 1.436444, -0.7650759, 0, 1, 0.7960784, 1,
-0.1008402, -1.233382, -3.159372, 0, 1, 0.8039216, 1,
-0.09833034, 0.3903436, 0.132223, 0, 1, 0.8078431, 1,
-0.09411252, 0.1154493, 1.123255, 0, 1, 0.8156863, 1,
-0.09284536, 0.576952, 0.475943, 0, 1, 0.8196079, 1,
-0.09062146, -2.025002, -2.457026, 0, 1, 0.827451, 1,
-0.09047439, 0.491688, 0.3890297, 0, 1, 0.8313726, 1,
-0.08904894, 1.084953, -1.442385, 0, 1, 0.8392157, 1,
-0.08733669, -1.368919, -3.092646, 0, 1, 0.8431373, 1,
-0.08619479, 0.6043835, 0.7850565, 0, 1, 0.8509804, 1,
-0.085561, -0.0770955, -1.138282, 0, 1, 0.854902, 1,
-0.08247037, -0.2263868, -2.791755, 0, 1, 0.8627451, 1,
-0.07792471, -0.8271081, -2.799656, 0, 1, 0.8666667, 1,
-0.07516418, -1.10108, -2.255675, 0, 1, 0.8745098, 1,
-0.07229144, 0.5265725, -2.431279, 0, 1, 0.8784314, 1,
-0.07033906, 0.6665133, -1.050288, 0, 1, 0.8862745, 1,
-0.06939184, 0.5411623, -1.196412, 0, 1, 0.8901961, 1,
-0.0686124, -1.105405, -2.821575, 0, 1, 0.8980392, 1,
-0.05530314, 0.660036, 1.259519, 0, 1, 0.9058824, 1,
-0.04440812, -1.554868, -3.320258, 0, 1, 0.9098039, 1,
-0.04147655, 0.4333657, -0.3658226, 0, 1, 0.9176471, 1,
-0.03401944, 0.7681724, -1.004226, 0, 1, 0.9215686, 1,
-0.03400173, -0.410184, -4.038501, 0, 1, 0.9294118, 1,
-0.03109949, 1.280837, -0.1005488, 0, 1, 0.9333333, 1,
-0.02353233, -1.134064, -1.782498, 0, 1, 0.9411765, 1,
-0.02327998, -0.9388985, -3.667492, 0, 1, 0.945098, 1,
-0.02104326, 0.1208415, -0.6370549, 0, 1, 0.9529412, 1,
-0.01952209, 0.8285634, -0.114369, 0, 1, 0.9568627, 1,
-0.01831732, 1.420446, -0.5031953, 0, 1, 0.9647059, 1,
-0.01773945, -0.4721996, -0.7787452, 0, 1, 0.9686275, 1,
-0.01288483, 1.029899, -0.4544998, 0, 1, 0.9764706, 1,
-0.01274373, 0.4741319, 0.531324, 0, 1, 0.9803922, 1,
-0.00662094, 0.4473149, 0.1202903, 0, 1, 0.9882353, 1,
-0.006045999, -1.56063, -2.789869, 0, 1, 0.9921569, 1,
-0.004268154, 0.9196062, 0.8882143, 0, 1, 1, 1,
-0.002090709, -1.292216, -3.709367, 0, 0.9921569, 1, 1,
0.002151256, -0.9204646, 4.54127, 0, 0.9882353, 1, 1,
0.01243033, 1.085528, 0.1310918, 0, 0.9803922, 1, 1,
0.01520888, -0.2165508, 2.836552, 0, 0.9764706, 1, 1,
0.01667749, -1.144593, 3.168222, 0, 0.9686275, 1, 1,
0.01913136, -1.007395, 4.199666, 0, 0.9647059, 1, 1,
0.02037372, -0.2501453, 1.770582, 0, 0.9568627, 1, 1,
0.02103061, -0.9530137, 3.970146, 0, 0.9529412, 1, 1,
0.02349778, -1.249273, 1.276419, 0, 0.945098, 1, 1,
0.02392027, -0.916549, 2.898439, 0, 0.9411765, 1, 1,
0.02436448, 0.3504903, 1.522043, 0, 0.9333333, 1, 1,
0.02601261, 0.0667524, 0.5728428, 0, 0.9294118, 1, 1,
0.02807293, -1.693506, 2.144203, 0, 0.9215686, 1, 1,
0.02819422, -0.1136645, 2.881019, 0, 0.9176471, 1, 1,
0.03406075, -0.1777311, 5.123689, 0, 0.9098039, 1, 1,
0.03416825, 0.4503095, 0.2487126, 0, 0.9058824, 1, 1,
0.03446267, -0.4351749, 2.570816, 0, 0.8980392, 1, 1,
0.03898061, 0.812948, 0.9115002, 0, 0.8901961, 1, 1,
0.03981715, -0.2530338, 4.185912, 0, 0.8862745, 1, 1,
0.04377528, -1.277227, 1.706802, 0, 0.8784314, 1, 1,
0.04896336, 0.9821765, 1.416557, 0, 0.8745098, 1, 1,
0.05249668, -2.606595, 1.980471, 0, 0.8666667, 1, 1,
0.05541436, -0.9941867, 2.818316, 0, 0.8627451, 1, 1,
0.05616328, 1.135622, -0.4629705, 0, 0.854902, 1, 1,
0.05631933, -0.8948345, 3.295513, 0, 0.8509804, 1, 1,
0.05678776, 0.4116234, 0.265328, 0, 0.8431373, 1, 1,
0.0627302, -0.1755821, 3.215318, 0, 0.8392157, 1, 1,
0.06439826, -1.072268, 2.384815, 0, 0.8313726, 1, 1,
0.06728001, -0.3418041, 2.65919, 0, 0.827451, 1, 1,
0.06922084, 2.027695, -0.8216795, 0, 0.8196079, 1, 1,
0.0696497, 0.5795225, -0.3317967, 0, 0.8156863, 1, 1,
0.07115939, 1.666233, 0.1857343, 0, 0.8078431, 1, 1,
0.07201815, 0.6102199, -0.4974799, 0, 0.8039216, 1, 1,
0.0743212, -0.7999466, 3.804196, 0, 0.7960784, 1, 1,
0.07682601, -1.588797, 2.692034, 0, 0.7882353, 1, 1,
0.07944016, -0.780791, 3.842779, 0, 0.7843137, 1, 1,
0.08139037, -0.3807901, 3.092314, 0, 0.7764706, 1, 1,
0.08463502, -1.194044, 2.335166, 0, 0.772549, 1, 1,
0.08551844, 0.3852829, 0.9766556, 0, 0.7647059, 1, 1,
0.08827002, 0.8307731, 0.7415404, 0, 0.7607843, 1, 1,
0.09675828, -3.095103, 2.724632, 0, 0.7529412, 1, 1,
0.09932891, -1.633304, 3.256109, 0, 0.7490196, 1, 1,
0.09996708, 0.7472261, 0.8982404, 0, 0.7411765, 1, 1,
0.1071232, -0.872413, 3.272986, 0, 0.7372549, 1, 1,
0.1112986, -0.6760048, 2.225983, 0, 0.7294118, 1, 1,
0.1124655, 1.361038, 0.5762398, 0, 0.7254902, 1, 1,
0.1158864, -1.107657, 3.142152, 0, 0.7176471, 1, 1,
0.1213715, -1.706997, 3.508448, 0, 0.7137255, 1, 1,
0.1253734, -0.2108555, 1.988222, 0, 0.7058824, 1, 1,
0.1280714, -1.858332, 2.644284, 0, 0.6980392, 1, 1,
0.1300601, 1.872843, -0.9082119, 0, 0.6941177, 1, 1,
0.1323635, -2.201782, 2.373462, 0, 0.6862745, 1, 1,
0.132756, 0.3207423, -0.3680188, 0, 0.682353, 1, 1,
0.136267, -1.285005, 3.359244, 0, 0.6745098, 1, 1,
0.1369065, 1.30801, -1.052912, 0, 0.6705883, 1, 1,
0.1373598, -0.6333816, 2.197135, 0, 0.6627451, 1, 1,
0.138295, 0.3952813, -0.05768315, 0, 0.6588235, 1, 1,
0.1393853, -0.1359184, 1.876911, 0, 0.6509804, 1, 1,
0.1428988, 1.221398, -0.07926951, 0, 0.6470588, 1, 1,
0.1451917, -1.605165, 4.724738, 0, 0.6392157, 1, 1,
0.1546879, 1.130675, -0.0279543, 0, 0.6352941, 1, 1,
0.1565384, 0.5726619, 0.8202326, 0, 0.627451, 1, 1,
0.1612347, 0.4814334, -0.2506344, 0, 0.6235294, 1, 1,
0.1627505, -0.108382, 2.503813, 0, 0.6156863, 1, 1,
0.166549, 0.2894907, -0.06465319, 0, 0.6117647, 1, 1,
0.1682712, 0.5867497, -0.0145999, 0, 0.6039216, 1, 1,
0.1703438, -0.02834962, 0.05283768, 0, 0.5960785, 1, 1,
0.1723749, 0.4632796, 0.9067972, 0, 0.5921569, 1, 1,
0.1746487, -0.7159006, 3.337111, 0, 0.5843138, 1, 1,
0.1760755, -0.5245197, 2.995012, 0, 0.5803922, 1, 1,
0.1819781, 0.03553802, 1.295539, 0, 0.572549, 1, 1,
0.1872369, 1.765297, -0.07616744, 0, 0.5686275, 1, 1,
0.1874871, -0.1954074, 2.059615, 0, 0.5607843, 1, 1,
0.1885508, 0.5583878, -1.370745, 0, 0.5568628, 1, 1,
0.1907751, -0.5463883, 3.171381, 0, 0.5490196, 1, 1,
0.1995182, 2.119955, 0.05464516, 0, 0.5450981, 1, 1,
0.2028747, 1.040355, -0.4435291, 0, 0.5372549, 1, 1,
0.2061302, -1.591612, 4.002339, 0, 0.5333334, 1, 1,
0.206267, 0.2177967, 1.575351, 0, 0.5254902, 1, 1,
0.2077755, 0.4150203, 0.8569551, 0, 0.5215687, 1, 1,
0.2082058, -1.073238, 1.71685, 0, 0.5137255, 1, 1,
0.21316, 1.420745, 1.878876, 0, 0.509804, 1, 1,
0.2147359, -0.6318553, 2.761216, 0, 0.5019608, 1, 1,
0.2195905, -1.181312, 3.129979, 0, 0.4941176, 1, 1,
0.2201085, -0.4283141, 2.834078, 0, 0.4901961, 1, 1,
0.2268489, -0.5799454, 2.733253, 0, 0.4823529, 1, 1,
0.2270328, 0.6030394, -0.01603908, 0, 0.4784314, 1, 1,
0.2274012, 0.4153267, 0.07846779, 0, 0.4705882, 1, 1,
0.2286134, 0.7729428, 0.401379, 0, 0.4666667, 1, 1,
0.2416191, -1.847393, 2.883659, 0, 0.4588235, 1, 1,
0.2418851, -0.9402231, 2.972788, 0, 0.454902, 1, 1,
0.2460066, -0.830492, 4.069784, 0, 0.4470588, 1, 1,
0.2500907, 0.507799, 1.990044, 0, 0.4431373, 1, 1,
0.2508049, 1.192865, -0.08438408, 0, 0.4352941, 1, 1,
0.2524422, -0.2611387, 1.866448, 0, 0.4313726, 1, 1,
0.2530041, -0.2193722, 1.101365, 0, 0.4235294, 1, 1,
0.2545221, -0.6655154, 1.521744, 0, 0.4196078, 1, 1,
0.2591931, -2.097379, 3.787514, 0, 0.4117647, 1, 1,
0.2622669, 0.86366, 1.364557, 0, 0.4078431, 1, 1,
0.2655107, -0.1849018, -0.4947535, 0, 0.4, 1, 1,
0.2709633, -0.1179727, 2.18945, 0, 0.3921569, 1, 1,
0.2730658, 1.179765, -0.06342261, 0, 0.3882353, 1, 1,
0.274292, -1.259489, 2.238899, 0, 0.3803922, 1, 1,
0.2837981, 1.034792, 1.410676, 0, 0.3764706, 1, 1,
0.2840156, -0.5080441, 3.56477, 0, 0.3686275, 1, 1,
0.284279, 0.715696, -0.7772592, 0, 0.3647059, 1, 1,
0.2849337, 1.613629, -0.960964, 0, 0.3568628, 1, 1,
0.2875105, 0.3622974, -0.3870581, 0, 0.3529412, 1, 1,
0.2898662, 0.2287188, 1.749458, 0, 0.345098, 1, 1,
0.2909141, 0.0857475, 0.7681572, 0, 0.3411765, 1, 1,
0.2920371, 0.458867, 1.077097, 0, 0.3333333, 1, 1,
0.2929853, -0.5975769, 0.5291132, 0, 0.3294118, 1, 1,
0.2974746, 0.9760705, 0.8577921, 0, 0.3215686, 1, 1,
0.2982705, -0.1904628, 2.459493, 0, 0.3176471, 1, 1,
0.3083687, -1.212778, 3.476177, 0, 0.3098039, 1, 1,
0.3138219, -1.704788, 2.775315, 0, 0.3058824, 1, 1,
0.314073, 0.8023802, -1.31955, 0, 0.2980392, 1, 1,
0.314135, 0.8497772, 0.9791728, 0, 0.2901961, 1, 1,
0.3172553, 1.662927, -0.3195804, 0, 0.2862745, 1, 1,
0.3176235, 0.6815082, 0.725668, 0, 0.2784314, 1, 1,
0.3205929, 1.759318, -0.6956779, 0, 0.2745098, 1, 1,
0.3210081, 0.7414891, -0.9446577, 0, 0.2666667, 1, 1,
0.3235703, -0.3067044, 1.70045, 0, 0.2627451, 1, 1,
0.3241272, -0.1224701, -0.2091531, 0, 0.254902, 1, 1,
0.3290994, 0.7031035, 1.099915, 0, 0.2509804, 1, 1,
0.3291654, 1.333277, -0.3934997, 0, 0.2431373, 1, 1,
0.3298531, 0.7858379, 0.9705854, 0, 0.2392157, 1, 1,
0.3304783, -1.826965, 3.761208, 0, 0.2313726, 1, 1,
0.3365465, -0.8114673, 0.9845805, 0, 0.227451, 1, 1,
0.3374408, -1.446398, 4.108009, 0, 0.2196078, 1, 1,
0.3417574, 0.1619979, 0.560884, 0, 0.2156863, 1, 1,
0.3425462, 1.147161, -0.7799595, 0, 0.2078431, 1, 1,
0.3442107, 0.009120512, 1.686612, 0, 0.2039216, 1, 1,
0.3489479, -0.3680037, 2.86946, 0, 0.1960784, 1, 1,
0.3587528, 0.9547793, -1.759799, 0, 0.1882353, 1, 1,
0.3656685, 1.70993, 0.2135357, 0, 0.1843137, 1, 1,
0.3740892, -1.152952, 1.493646, 0, 0.1764706, 1, 1,
0.376756, -0.2548437, 2.805949, 0, 0.172549, 1, 1,
0.3771792, -0.2555299, 2.863029, 0, 0.1647059, 1, 1,
0.3887146, -1.097449, 1.477486, 0, 0.1607843, 1, 1,
0.3950278, 0.8144488, 1.103064, 0, 0.1529412, 1, 1,
0.3967579, 0.8278587, 0.3236998, 0, 0.1490196, 1, 1,
0.3971264, -0.3865348, 5.264279, 0, 0.1411765, 1, 1,
0.3997806, -1.515745, 3.193226, 0, 0.1372549, 1, 1,
0.4018857, 1.244126, 1.50658, 0, 0.1294118, 1, 1,
0.4026472, -0.591022, 4.478655, 0, 0.1254902, 1, 1,
0.4049246, -0.3624025, 2.24933, 0, 0.1176471, 1, 1,
0.4100044, 1.256282, -0.6359129, 0, 0.1137255, 1, 1,
0.4111665, -2.978041, 3.87042, 0, 0.1058824, 1, 1,
0.4144301, -0.1572908, 2.609659, 0, 0.09803922, 1, 1,
0.4178038, 2.104563, 1.729574, 0, 0.09411765, 1, 1,
0.4241339, 0.07861505, 0.3534137, 0, 0.08627451, 1, 1,
0.4282714, -0.02143058, 4.520706, 0, 0.08235294, 1, 1,
0.4347981, -1.483535, 2.571176, 0, 0.07450981, 1, 1,
0.4366296, -0.9245428, 3.747822, 0, 0.07058824, 1, 1,
0.4376726, -0.3093895, 1.256125, 0, 0.0627451, 1, 1,
0.4377457, 1.050234, 2.306508, 0, 0.05882353, 1, 1,
0.4434703, -2.680108, 0.9281821, 0, 0.05098039, 1, 1,
0.4451137, 0.4537843, 0.8127748, 0, 0.04705882, 1, 1,
0.4472597, 0.02177932, 0.7627953, 0, 0.03921569, 1, 1,
0.4493332, -0.7622092, 3.297369, 0, 0.03529412, 1, 1,
0.4538615, -0.3810833, 1.656247, 0, 0.02745098, 1, 1,
0.4588346, -0.8096713, 3.701641, 0, 0.02352941, 1, 1,
0.4596838, 1.078796, 0.02562767, 0, 0.01568628, 1, 1,
0.4683869, 0.6914713, 0.3130689, 0, 0.01176471, 1, 1,
0.4698506, -0.6916143, 4.548879, 0, 0.003921569, 1, 1,
0.471715, 1.234519, 1.003132, 0.003921569, 0, 1, 1,
0.4753013, -0.04595875, 3.737648, 0.007843138, 0, 1, 1,
0.4822024, -0.231017, 1.6744, 0.01568628, 0, 1, 1,
0.4882974, -0.642123, 2.344373, 0.01960784, 0, 1, 1,
0.4906866, 0.5305607, 2.637574, 0.02745098, 0, 1, 1,
0.4916389, 1.039353, 1.804312, 0.03137255, 0, 1, 1,
0.4941539, -0.3386063, 1.777567, 0.03921569, 0, 1, 1,
0.4954661, 1.260747, 0.5064754, 0.04313726, 0, 1, 1,
0.4963484, -1.447474, 2.184283, 0.05098039, 0, 1, 1,
0.497885, -1.546268, 4.214721, 0.05490196, 0, 1, 1,
0.5022041, -0.7889758, 3.107506, 0.0627451, 0, 1, 1,
0.5023702, 0.2464727, 2.670049, 0.06666667, 0, 1, 1,
0.5094143, 0.8607352, 0.589456, 0.07450981, 0, 1, 1,
0.5107213, 1.437826, -0.4553756, 0.07843138, 0, 1, 1,
0.5120698, 0.2731146, 1.963653, 0.08627451, 0, 1, 1,
0.5157653, 0.5614447, 0.6368409, 0.09019608, 0, 1, 1,
0.5180593, 0.6613465, 0.6451482, 0.09803922, 0, 1, 1,
0.5186127, 0.5734599, 1.47552, 0.1058824, 0, 1, 1,
0.5206643, -0.5528041, 2.484236, 0.1098039, 0, 1, 1,
0.5224219, 1.887782, 1.792212, 0.1176471, 0, 1, 1,
0.5237553, 1.885843, -0.02857891, 0.1215686, 0, 1, 1,
0.5254574, 0.4962165, 0.4880615, 0.1294118, 0, 1, 1,
0.5255937, -0.261225, 3.42909, 0.1333333, 0, 1, 1,
0.5279514, 0.1478443, 1.048158, 0.1411765, 0, 1, 1,
0.5288578, -1.737052, 2.768231, 0.145098, 0, 1, 1,
0.5291114, 0.6835169, 0.0130444, 0.1529412, 0, 1, 1,
0.5307114, -1.134037, 1.919126, 0.1568628, 0, 1, 1,
0.5329341, -0.1298479, 1.148607, 0.1647059, 0, 1, 1,
0.5399037, -0.4052338, 1.908692, 0.1686275, 0, 1, 1,
0.544619, 1.567365, 0.01249543, 0.1764706, 0, 1, 1,
0.5487835, -0.3109806, 1.548856, 0.1803922, 0, 1, 1,
0.5620124, 0.6159347, -0.2446557, 0.1882353, 0, 1, 1,
0.567938, 0.2550027, 0.8106083, 0.1921569, 0, 1, 1,
0.5711971, -0.03267568, 1.399973, 0.2, 0, 1, 1,
0.5748731, 0.262383, 0.001470007, 0.2078431, 0, 1, 1,
0.5752396, -0.5583915, 3.406832, 0.2117647, 0, 1, 1,
0.5767466, -0.4825216, 1.034913, 0.2196078, 0, 1, 1,
0.5769966, -1.56376, 3.518393, 0.2235294, 0, 1, 1,
0.5771592, 0.9758937, -0.3548074, 0.2313726, 0, 1, 1,
0.5804942, -1.205233, 4.59169, 0.2352941, 0, 1, 1,
0.583387, 0.5510108, -0.1831896, 0.2431373, 0, 1, 1,
0.5848747, 0.006238027, 0.2855048, 0.2470588, 0, 1, 1,
0.5885332, 0.6659973, -0.5341017, 0.254902, 0, 1, 1,
0.5891314, -0.5566159, 2.137233, 0.2588235, 0, 1, 1,
0.5893841, 0.446611, 0.793309, 0.2666667, 0, 1, 1,
0.590175, -2.611943, 2.613445, 0.2705882, 0, 1, 1,
0.591399, -0.04181052, 0.2536349, 0.2784314, 0, 1, 1,
0.5918558, -0.4861868, 3.719626, 0.282353, 0, 1, 1,
0.5999082, -0.9363232, 2.984316, 0.2901961, 0, 1, 1,
0.604214, 0.7542094, 1.023041, 0.2941177, 0, 1, 1,
0.604224, -0.08765811, 2.457823, 0.3019608, 0, 1, 1,
0.6111146, 0.7875047, -0.1131665, 0.3098039, 0, 1, 1,
0.6121748, 0.6298282, 0.3563235, 0.3137255, 0, 1, 1,
0.6130363, 1.101556, 0.1424337, 0.3215686, 0, 1, 1,
0.6169092, -1.893438, 2.644328, 0.3254902, 0, 1, 1,
0.6182094, 1.732092, 0.9568747, 0.3333333, 0, 1, 1,
0.6183322, 0.08406308, 3.163459, 0.3372549, 0, 1, 1,
0.6216463, -1.086682, 2.786503, 0.345098, 0, 1, 1,
0.6245461, -0.5188644, 0.539758, 0.3490196, 0, 1, 1,
0.627754, 1.640018, -0.3106811, 0.3568628, 0, 1, 1,
0.6316199, -1.106525, 3.493345, 0.3607843, 0, 1, 1,
0.6318024, -0.006572989, 0.9404644, 0.3686275, 0, 1, 1,
0.6330693, -0.7420437, 2.143363, 0.372549, 0, 1, 1,
0.6333658, -2.04391, 3.89155, 0.3803922, 0, 1, 1,
0.636531, 1.456029, 1.375083, 0.3843137, 0, 1, 1,
0.6381289, -1.031074, 2.910515, 0.3921569, 0, 1, 1,
0.6392778, -0.002176373, 2.662043, 0.3960784, 0, 1, 1,
0.6410192, 1.010903, 1.465083, 0.4039216, 0, 1, 1,
0.641535, 0.200634, 0.6716644, 0.4117647, 0, 1, 1,
0.6437747, -0.1280552, 2.241609, 0.4156863, 0, 1, 1,
0.6496312, 0.5571066, 2.022714, 0.4235294, 0, 1, 1,
0.6507769, 0.3500151, 1.350084, 0.427451, 0, 1, 1,
0.6594513, 0.7849154, 2.124248, 0.4352941, 0, 1, 1,
0.6624926, -0.7739765, 1.29766, 0.4392157, 0, 1, 1,
0.6637923, -0.05494998, 1.051396, 0.4470588, 0, 1, 1,
0.6647148, -0.4362372, 1.858958, 0.4509804, 0, 1, 1,
0.665876, -1.304262, 3.879859, 0.4588235, 0, 1, 1,
0.6669987, 0.2706749, 2.230872, 0.4627451, 0, 1, 1,
0.6680634, -1.781289, 3.527313, 0.4705882, 0, 1, 1,
0.6681246, 0.1524439, 1.803285, 0.4745098, 0, 1, 1,
0.6753314, -0.9323335, 2.150502, 0.4823529, 0, 1, 1,
0.6764195, 0.6634082, -0.4319379, 0.4862745, 0, 1, 1,
0.6812344, -0.6464956, 3.546062, 0.4941176, 0, 1, 1,
0.6824015, -0.8841541, 2.459392, 0.5019608, 0, 1, 1,
0.6853796, -0.5219252, 1.950065, 0.5058824, 0, 1, 1,
0.6910109, -0.8524638, 2.094918, 0.5137255, 0, 1, 1,
0.6992748, -1.772637, 2.103911, 0.5176471, 0, 1, 1,
0.7023376, -1.63261, 5.445036, 0.5254902, 0, 1, 1,
0.7107044, 1.080741, 0.615795, 0.5294118, 0, 1, 1,
0.7110681, 0.9186606, 1.63571, 0.5372549, 0, 1, 1,
0.7117838, -0.164203, 4.438613, 0.5411765, 0, 1, 1,
0.7153118, -0.6344935, 2.333534, 0.5490196, 0, 1, 1,
0.7157533, -0.5260505, 4.068183, 0.5529412, 0, 1, 1,
0.7162718, -0.01873501, 2.078905, 0.5607843, 0, 1, 1,
0.7183038, 0.8481386, 1.665785, 0.5647059, 0, 1, 1,
0.7297398, -2.017449, 3.61302, 0.572549, 0, 1, 1,
0.7305216, -0.4974967, 3.443858, 0.5764706, 0, 1, 1,
0.7356859, 0.601191, 1.012021, 0.5843138, 0, 1, 1,
0.7360425, -0.824338, 2.069992, 0.5882353, 0, 1, 1,
0.739758, 0.7696244, 1.298563, 0.5960785, 0, 1, 1,
0.7398527, -1.219075, 3.610033, 0.6039216, 0, 1, 1,
0.7420707, 1.756633, 1.289883, 0.6078432, 0, 1, 1,
0.7462894, 1.002139, -0.772481, 0.6156863, 0, 1, 1,
0.7464479, -0.8069409, 1.354254, 0.6196079, 0, 1, 1,
0.7465596, -0.5334769, 2.905909, 0.627451, 0, 1, 1,
0.7466165, 1.09164, 0.9185874, 0.6313726, 0, 1, 1,
0.7471967, 0.04823751, 1.254699, 0.6392157, 0, 1, 1,
0.7487829, 1.913735, -0.9220567, 0.6431373, 0, 1, 1,
0.7550895, -0.4615267, 2.441818, 0.6509804, 0, 1, 1,
0.7582356, -0.2848727, 4.601494, 0.654902, 0, 1, 1,
0.7626235, -1.466488, 3.037284, 0.6627451, 0, 1, 1,
0.7633485, 0.1147099, 1.324414, 0.6666667, 0, 1, 1,
0.7701694, -0.5236567, 2.324096, 0.6745098, 0, 1, 1,
0.7724801, 0.7127613, 1.457661, 0.6784314, 0, 1, 1,
0.7727109, 0.2846751, 1.167461, 0.6862745, 0, 1, 1,
0.7730629, 0.159959, 1.380495, 0.6901961, 0, 1, 1,
0.773499, -0.1052574, 2.957698, 0.6980392, 0, 1, 1,
0.7761258, 1.157076, 1.538969, 0.7058824, 0, 1, 1,
0.7811632, 0.5025609, 0.6880734, 0.7098039, 0, 1, 1,
0.7822309, 0.2565655, 0.9408662, 0.7176471, 0, 1, 1,
0.7839006, 0.9739533, 1.891257, 0.7215686, 0, 1, 1,
0.7907289, 0.4210722, 0.8492309, 0.7294118, 0, 1, 1,
0.7914194, -2.349285, 3.862257, 0.7333333, 0, 1, 1,
0.7958148, -0.7900891, 3.580197, 0.7411765, 0, 1, 1,
0.7974398, -0.1020641, -0.3442151, 0.7450981, 0, 1, 1,
0.7975755, -1.608679, 2.6674, 0.7529412, 0, 1, 1,
0.7981151, -1.322135, 2.382187, 0.7568628, 0, 1, 1,
0.7985219, -0.2168127, 3.333513, 0.7647059, 0, 1, 1,
0.8004056, -0.3295455, 3.237426, 0.7686275, 0, 1, 1,
0.802612, 1.781253, -1.059099, 0.7764706, 0, 1, 1,
0.8138317, 0.1139564, 2.413494, 0.7803922, 0, 1, 1,
0.8167058, -0.7061496, 1.462413, 0.7882353, 0, 1, 1,
0.8235061, 0.7972587, 1.10911, 0.7921569, 0, 1, 1,
0.8240307, 0.4652674, -1.601613, 0.8, 0, 1, 1,
0.8246204, -2.041446, 2.530724, 0.8078431, 0, 1, 1,
0.8389365, -1.163982, 2.517561, 0.8117647, 0, 1, 1,
0.842473, 0.3823045, 1.144638, 0.8196079, 0, 1, 1,
0.8426968, -0.018589, 0.6145653, 0.8235294, 0, 1, 1,
0.8472288, -0.3367674, 0.6663641, 0.8313726, 0, 1, 1,
0.8501673, 0.1470812, 2.099524, 0.8352941, 0, 1, 1,
0.850949, 1.425409, 0.3036992, 0.8431373, 0, 1, 1,
0.8597295, 0.5914348, 1.899901, 0.8470588, 0, 1, 1,
0.8607302, 0.7786663, 1.176013, 0.854902, 0, 1, 1,
0.8623353, 0.09892686, 2.785039, 0.8588235, 0, 1, 1,
0.8624713, -1.432485, 2.217201, 0.8666667, 0, 1, 1,
0.8630713, 0.2676418, 1.742416, 0.8705882, 0, 1, 1,
0.8633933, -0.7575483, 2.266828, 0.8784314, 0, 1, 1,
0.8642305, 1.534674, 0.2095832, 0.8823529, 0, 1, 1,
0.8649268, 2.294747, 0.5246801, 0.8901961, 0, 1, 1,
0.8688187, -0.08551372, 0.9594688, 0.8941177, 0, 1, 1,
0.8721651, -0.6786988, 2.937195, 0.9019608, 0, 1, 1,
0.8774729, -0.3978986, 2.536425, 0.9098039, 0, 1, 1,
0.8819311, 0.8625302, -0.239841, 0.9137255, 0, 1, 1,
0.8835119, 0.2264095, 1.763574, 0.9215686, 0, 1, 1,
0.8840377, -1.36119, 2.343296, 0.9254902, 0, 1, 1,
0.8866486, -3.299665, 2.255313, 0.9333333, 0, 1, 1,
0.8884182, 0.8659236, 0.3914503, 0.9372549, 0, 1, 1,
0.8987373, -0.7981455, 1.465417, 0.945098, 0, 1, 1,
0.902912, 0.9014216, -0.5946597, 0.9490196, 0, 1, 1,
0.9137788, 0.3523335, 0.7723001, 0.9568627, 0, 1, 1,
0.9164227, 0.07416685, 0.3973758, 0.9607843, 0, 1, 1,
0.9195894, 0.7034653, 0.6577902, 0.9686275, 0, 1, 1,
0.9201888, -0.642368, 2.128937, 0.972549, 0, 1, 1,
0.9219178, 0.1557903, 0.3913105, 0.9803922, 0, 1, 1,
0.9224232, -0.1973362, 1.785383, 0.9843137, 0, 1, 1,
0.9229347, -0.2546609, 1.826445, 0.9921569, 0, 1, 1,
0.9316735, 0.3462762, 1.260578, 0.9960784, 0, 1, 1,
0.9458334, -0.2889391, 0.8759034, 1, 0, 0.9960784, 1,
0.9484752, -0.2723565, 2.833878, 1, 0, 0.9882353, 1,
0.9504372, -2.363497, 3.523685, 1, 0, 0.9843137, 1,
0.951188, 1.178392, 0.4410246, 1, 0, 0.9764706, 1,
0.9557144, -1.757129, 2.170451, 1, 0, 0.972549, 1,
0.9583075, -0.65834, 2.140587, 1, 0, 0.9647059, 1,
0.9595685, 0.4396564, 0.8519779, 1, 0, 0.9607843, 1,
0.9599963, 0.3070835, 1.621779, 1, 0, 0.9529412, 1,
0.9665834, -0.7191306, 1.2974, 1, 0, 0.9490196, 1,
0.966949, 1.001278, -0.3600333, 1, 0, 0.9411765, 1,
0.9671791, -0.234643, 0.6947634, 1, 0, 0.9372549, 1,
0.9740455, -0.4554145, 1.882717, 1, 0, 0.9294118, 1,
0.9747005, 0.6801719, 1.314033, 1, 0, 0.9254902, 1,
0.977555, -0.3357106, 1.537459, 1, 0, 0.9176471, 1,
0.9827541, -0.1190365, 3.926796, 1, 0, 0.9137255, 1,
0.9843364, 1.497257, 1.171829, 1, 0, 0.9058824, 1,
0.9857782, 0.9387072, 0.4968511, 1, 0, 0.9019608, 1,
0.9874424, 0.06138348, 1.238748, 1, 0, 0.8941177, 1,
0.989222, 1.549275, 0.2256307, 1, 0, 0.8862745, 1,
0.9954377, -1.342836, 3.195863, 1, 0, 0.8823529, 1,
0.9971251, 0.0184742, 0.5447381, 1, 0, 0.8745098, 1,
0.9975123, 1.159949, 2.007508, 1, 0, 0.8705882, 1,
1.000711, 0.3404323, 1.291503, 1, 0, 0.8627451, 1,
1.005757, 0.2791481, 1.666325, 1, 0, 0.8588235, 1,
1.010168, -0.3098083, 1.967503, 1, 0, 0.8509804, 1,
1.012294, 0.438524, 0.1010732, 1, 0, 0.8470588, 1,
1.015859, -1.288439, 1.566316, 1, 0, 0.8392157, 1,
1.017763, 0.4193906, 0.3913802, 1, 0, 0.8352941, 1,
1.034366, -1.603819, 2.928441, 1, 0, 0.827451, 1,
1.034373, -1.118814, 3.451795, 1, 0, 0.8235294, 1,
1.042331, -1.054912, 3.364442, 1, 0, 0.8156863, 1,
1.048099, 0.0498403, 2.50969, 1, 0, 0.8117647, 1,
1.048768, 0.1907289, 0.319107, 1, 0, 0.8039216, 1,
1.070807, -1.738317, 2.336875, 1, 0, 0.7960784, 1,
1.071984, 0.2056267, 0.8138663, 1, 0, 0.7921569, 1,
1.079243, -0.7759493, 2.598083, 1, 0, 0.7843137, 1,
1.081778, -2.75369, 1.993855, 1, 0, 0.7803922, 1,
1.082697, 0.5768982, 0.8700191, 1, 0, 0.772549, 1,
1.084102, 0.3725653, 0.5751504, 1, 0, 0.7686275, 1,
1.095994, -1.880989, 3.813607, 1, 0, 0.7607843, 1,
1.111603, 0.9978744, 1.276324, 1, 0, 0.7568628, 1,
1.112868, 2.618617, 1.501421, 1, 0, 0.7490196, 1,
1.116906, -0.6870764, 1.893167, 1, 0, 0.7450981, 1,
1.119568, 1.081576, 1.035357, 1, 0, 0.7372549, 1,
1.137891, -1.953033, 2.829136, 1, 0, 0.7333333, 1,
1.139397, -0.2980917, 1.513465, 1, 0, 0.7254902, 1,
1.157628, -0.726539, 2.644305, 1, 0, 0.7215686, 1,
1.160268, 1.100418, 1.164362, 1, 0, 0.7137255, 1,
1.165064, -0.06595097, 1.246537, 1, 0, 0.7098039, 1,
1.165642, 0.8993362, -0.5376644, 1, 0, 0.7019608, 1,
1.166887, -0.1735752, 1.704671, 1, 0, 0.6941177, 1,
1.173708, -1.858768, 4.389361, 1, 0, 0.6901961, 1,
1.178775, 0.2158568, 1.311507, 1, 0, 0.682353, 1,
1.179945, -1.172358, 2.318016, 1, 0, 0.6784314, 1,
1.183082, -2.460471, 1.086575, 1, 0, 0.6705883, 1,
1.192921, -0.8677932, 3.400709, 1, 0, 0.6666667, 1,
1.194021, 0.4281511, 0.7303544, 1, 0, 0.6588235, 1,
1.198379, -0.3183753, 1.888793, 1, 0, 0.654902, 1,
1.20521, -1.188465, 3.023564, 1, 0, 0.6470588, 1,
1.206533, 1.074026, 1.096587, 1, 0, 0.6431373, 1,
1.206743, 1.39244, 1.307741, 1, 0, 0.6352941, 1,
1.208285, -2.419767, 5.327875, 1, 0, 0.6313726, 1,
1.217538, -0.1254041, 1.279243, 1, 0, 0.6235294, 1,
1.217982, -1.156883, 1.971595, 1, 0, 0.6196079, 1,
1.221183, 0.4328156, 0.4331168, 1, 0, 0.6117647, 1,
1.230787, -0.5547817, 3.847931, 1, 0, 0.6078432, 1,
1.232105, 0.5533535, 1.815282, 1, 0, 0.6, 1,
1.233206, -0.5856942, 1.701883, 1, 0, 0.5921569, 1,
1.233308, -2.352561, 2.19009, 1, 0, 0.5882353, 1,
1.235288, -1.468216, 2.128655, 1, 0, 0.5803922, 1,
1.237817, 0.2868037, 2.482849, 1, 0, 0.5764706, 1,
1.242864, -0.3944181, 3.556752, 1, 0, 0.5686275, 1,
1.258436, 0.8923436, 1.59459, 1, 0, 0.5647059, 1,
1.261513, 1.449115, 0.6228904, 1, 0, 0.5568628, 1,
1.279653, -0.4518195, 1.073999, 1, 0, 0.5529412, 1,
1.282028, 1.042083, -0.8322477, 1, 0, 0.5450981, 1,
1.28221, -0.07708482, 1.44765, 1, 0, 0.5411765, 1,
1.283989, 0.8721105, 0.8976955, 1, 0, 0.5333334, 1,
1.298751, 0.6978093, 0.3832642, 1, 0, 0.5294118, 1,
1.29973, 0.1181918, 1.749515, 1, 0, 0.5215687, 1,
1.312873, -0.4420457, 2.199696, 1, 0, 0.5176471, 1,
1.317581, 0.2768248, 0.7994643, 1, 0, 0.509804, 1,
1.319175, -0.3723979, 0.8307298, 1, 0, 0.5058824, 1,
1.322932, -2.554364, 2.416243, 1, 0, 0.4980392, 1,
1.324696, 0.3719774, 1.569265, 1, 0, 0.4901961, 1,
1.329216, 0.9502222, -0.3756791, 1, 0, 0.4862745, 1,
1.329376, 1.38912, 0.5918841, 1, 0, 0.4784314, 1,
1.337919, -0.3191094, 1.513947, 1, 0, 0.4745098, 1,
1.351994, -0.09235357, 2.495423, 1, 0, 0.4666667, 1,
1.369367, -0.9138986, 0.6117716, 1, 0, 0.4627451, 1,
1.370493, 0.1459161, 1.548184, 1, 0, 0.454902, 1,
1.370894, 0.1665165, 1.837455, 1, 0, 0.4509804, 1,
1.370909, -1.510124, 3.837948, 1, 0, 0.4431373, 1,
1.381789, 0.3148077, 2.192619, 1, 0, 0.4392157, 1,
1.387021, -0.06864341, 1.391698, 1, 0, 0.4313726, 1,
1.396072, 0.9668302, 1.155859, 1, 0, 0.427451, 1,
1.409824, 0.1136784, 0.6176596, 1, 0, 0.4196078, 1,
1.414884, -0.5729586, 1.845221, 1, 0, 0.4156863, 1,
1.419404, 1.087749, 2.691731, 1, 0, 0.4078431, 1,
1.423435, 0.4910887, 0.9744928, 1, 0, 0.4039216, 1,
1.427038, -0.1754435, 3.270924, 1, 0, 0.3960784, 1,
1.43007, -0.1418257, 2.723625, 1, 0, 0.3882353, 1,
1.436643, -0.7582049, 1.687227, 1, 0, 0.3843137, 1,
1.441343, 1.390902, 0.681884, 1, 0, 0.3764706, 1,
1.44472, -0.58173, 2.301581, 1, 0, 0.372549, 1,
1.474085, 2.204863, -0.1970551, 1, 0, 0.3647059, 1,
1.478458, -0.3039285, 1.490526, 1, 0, 0.3607843, 1,
1.504532, -0.4686266, 1.844067, 1, 0, 0.3529412, 1,
1.537129, -0.6283441, 0.623835, 1, 0, 0.3490196, 1,
1.545629, 0.4217381, -0.002126435, 1, 0, 0.3411765, 1,
1.551412, -0.457249, 1.349256, 1, 0, 0.3372549, 1,
1.561634, 1.95209, -0.01075591, 1, 0, 0.3294118, 1,
1.565864, -0.542466, 1.794977, 1, 0, 0.3254902, 1,
1.585343, -0.9871084, 2.578971, 1, 0, 0.3176471, 1,
1.587999, -0.7043258, -0.08622366, 1, 0, 0.3137255, 1,
1.595684, 0.2889314, 1.42766, 1, 0, 0.3058824, 1,
1.60389, -0.9358222, 4.594901, 1, 0, 0.2980392, 1,
1.603969, 1.572921, 2.195247, 1, 0, 0.2941177, 1,
1.618621, 0.02044718, 0.1700322, 1, 0, 0.2862745, 1,
1.647086, -2.143775, 1.660608, 1, 0, 0.282353, 1,
1.67289, -1.919643, 4.014754, 1, 0, 0.2745098, 1,
1.674816, 1.925287, 0.9441001, 1, 0, 0.2705882, 1,
1.678134, 1.162303, 1.874351, 1, 0, 0.2627451, 1,
1.678596, -0.2094265, 2.015265, 1, 0, 0.2588235, 1,
1.683982, -1.156646, 2.03354, 1, 0, 0.2509804, 1,
1.696609, -0.5482342, 1.69458, 1, 0, 0.2470588, 1,
1.729951, -1.28546, 2.617085, 1, 0, 0.2392157, 1,
1.73336, -1.174363, 2.261464, 1, 0, 0.2352941, 1,
1.755373, -0.9665338, 2.790411, 1, 0, 0.227451, 1,
1.774808, 0.2765101, 1.847384, 1, 0, 0.2235294, 1,
1.787847, 1.616248, 0.2226801, 1, 0, 0.2156863, 1,
1.788214, -1.729753, 2.252885, 1, 0, 0.2117647, 1,
1.792911, -2.276934, 4.746687, 1, 0, 0.2039216, 1,
1.797835, -0.7478573, 1.898117, 1, 0, 0.1960784, 1,
1.804694, -0.003629401, 0.5878697, 1, 0, 0.1921569, 1,
1.823571, 1.122436, 1.605065, 1, 0, 0.1843137, 1,
1.824974, -0.6863614, 1.685525, 1, 0, 0.1803922, 1,
1.84427, 1.150428, 0.05920143, 1, 0, 0.172549, 1,
1.86338, 1.433932, 1.594483, 1, 0, 0.1686275, 1,
1.90041, 1.200039, 2.551293, 1, 0, 0.1607843, 1,
1.912395, 0.4084707, 1.77657, 1, 0, 0.1568628, 1,
1.922386, 0.1000028, 2.101114, 1, 0, 0.1490196, 1,
1.950592, -0.3095327, 2.653499, 1, 0, 0.145098, 1,
1.971457, -1.171077, 2.114269, 1, 0, 0.1372549, 1,
2.005825, 0.05958986, 1.789819, 1, 0, 0.1333333, 1,
2.047574, -0.1187244, 1.003122, 1, 0, 0.1254902, 1,
2.0512, -0.7851717, 1.00177, 1, 0, 0.1215686, 1,
2.0574, -1.458425, 2.337598, 1, 0, 0.1137255, 1,
2.06915, -1.54466, 3.090127, 1, 0, 0.1098039, 1,
2.07844, 0.7361472, 0.9101675, 1, 0, 0.1019608, 1,
2.095588, 0.2322497, 2.135044, 1, 0, 0.09411765, 1,
2.121828, -0.4725477, 2.071408, 1, 0, 0.09019608, 1,
2.141217, 0.04381167, -0.08401617, 1, 0, 0.08235294, 1,
2.145422, 2.061671, 0.7923591, 1, 0, 0.07843138, 1,
2.151394, 0.1527131, 0.2393543, 1, 0, 0.07058824, 1,
2.211267, 0.2801561, 3.604615, 1, 0, 0.06666667, 1,
2.2203, -0.6843705, 1.392273, 1, 0, 0.05882353, 1,
2.228106, 0.2121559, 1.437405, 1, 0, 0.05490196, 1,
2.229533, 0.6549246, 0.7279488, 1, 0, 0.04705882, 1,
2.421476, -0.2861942, 2.382526, 1, 0, 0.04313726, 1,
2.547579, -0.03497827, 0.6961844, 1, 0, 0.03529412, 1,
2.611434, -0.6215677, 1.446307, 1, 0, 0.03137255, 1,
2.679079, 0.6061386, 2.859462, 1, 0, 0.02352941, 1,
2.743756, 0.7424398, 0.8859971, 1, 0, 0.01960784, 1,
2.752284, 0.5878685, 2.377297, 1, 0, 0.01176471, 1,
3.224252, -0.6110013, 2.67741, 1, 0, 0.007843138, 1
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
0.1170987, -4.337562, -6.552444, 0, -0.5, 0.5, 0.5,
0.1170987, -4.337562, -6.552444, 1, -0.5, 0.5, 0.5,
0.1170987, -4.337562, -6.552444, 1, 1.5, 0.5, 0.5,
0.1170987, -4.337562, -6.552444, 0, 1.5, 0.5, 0.5
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
-4.04338, -0.2380208, -6.552444, 0, -0.5, 0.5, 0.5,
-4.04338, -0.2380208, -6.552444, 1, -0.5, 0.5, 0.5,
-4.04338, -0.2380208, -6.552444, 1, 1.5, 0.5, 0.5,
-4.04338, -0.2380208, -6.552444, 0, 1.5, 0.5, 0.5
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
-4.04338, -4.337562, 0.315716, 0, -0.5, 0.5, 0.5,
-4.04338, -4.337562, 0.315716, 1, -0.5, 0.5, 0.5,
-4.04338, -4.337562, 0.315716, 1, 1.5, 0.5, 0.5,
-4.04338, -4.337562, 0.315716, 0, 1.5, 0.5, 0.5
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
-2, -3.391514, -4.967484,
3, -3.391514, -4.967484,
-2, -3.391514, -4.967484,
-2, -3.549189, -5.231644,
-1, -3.391514, -4.967484,
-1, -3.549189, -5.231644,
0, -3.391514, -4.967484,
0, -3.549189, -5.231644,
1, -3.391514, -4.967484,
1, -3.549189, -5.231644,
2, -3.391514, -4.967484,
2, -3.549189, -5.231644,
3, -3.391514, -4.967484,
3, -3.549189, -5.231644
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
-2, -3.864538, -5.759964, 0, -0.5, 0.5, 0.5,
-2, -3.864538, -5.759964, 1, -0.5, 0.5, 0.5,
-2, -3.864538, -5.759964, 1, 1.5, 0.5, 0.5,
-2, -3.864538, -5.759964, 0, 1.5, 0.5, 0.5,
-1, -3.864538, -5.759964, 0, -0.5, 0.5, 0.5,
-1, -3.864538, -5.759964, 1, -0.5, 0.5, 0.5,
-1, -3.864538, -5.759964, 1, 1.5, 0.5, 0.5,
-1, -3.864538, -5.759964, 0, 1.5, 0.5, 0.5,
0, -3.864538, -5.759964, 0, -0.5, 0.5, 0.5,
0, -3.864538, -5.759964, 1, -0.5, 0.5, 0.5,
0, -3.864538, -5.759964, 1, 1.5, 0.5, 0.5,
0, -3.864538, -5.759964, 0, 1.5, 0.5, 0.5,
1, -3.864538, -5.759964, 0, -0.5, 0.5, 0.5,
1, -3.864538, -5.759964, 1, -0.5, 0.5, 0.5,
1, -3.864538, -5.759964, 1, 1.5, 0.5, 0.5,
1, -3.864538, -5.759964, 0, 1.5, 0.5, 0.5,
2, -3.864538, -5.759964, 0, -0.5, 0.5, 0.5,
2, -3.864538, -5.759964, 1, -0.5, 0.5, 0.5,
2, -3.864538, -5.759964, 1, 1.5, 0.5, 0.5,
2, -3.864538, -5.759964, 0, 1.5, 0.5, 0.5,
3, -3.864538, -5.759964, 0, -0.5, 0.5, 0.5,
3, -3.864538, -5.759964, 1, -0.5, 0.5, 0.5,
3, -3.864538, -5.759964, 1, 1.5, 0.5, 0.5,
3, -3.864538, -5.759964, 0, 1.5, 0.5, 0.5
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
-3.083269, -3, -4.967484,
-3.083269, 2, -4.967484,
-3.083269, -3, -4.967484,
-3.243288, -3, -5.231644,
-3.083269, -2, -4.967484,
-3.243288, -2, -5.231644,
-3.083269, -1, -4.967484,
-3.243288, -1, -5.231644,
-3.083269, 0, -4.967484,
-3.243288, 0, -5.231644,
-3.083269, 1, -4.967484,
-3.243288, 1, -5.231644,
-3.083269, 2, -4.967484,
-3.243288, 2, -5.231644
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
-3.563324, -3, -5.759964, 0, -0.5, 0.5, 0.5,
-3.563324, -3, -5.759964, 1, -0.5, 0.5, 0.5,
-3.563324, -3, -5.759964, 1, 1.5, 0.5, 0.5,
-3.563324, -3, -5.759964, 0, 1.5, 0.5, 0.5,
-3.563324, -2, -5.759964, 0, -0.5, 0.5, 0.5,
-3.563324, -2, -5.759964, 1, -0.5, 0.5, 0.5,
-3.563324, -2, -5.759964, 1, 1.5, 0.5, 0.5,
-3.563324, -2, -5.759964, 0, 1.5, 0.5, 0.5,
-3.563324, -1, -5.759964, 0, -0.5, 0.5, 0.5,
-3.563324, -1, -5.759964, 1, -0.5, 0.5, 0.5,
-3.563324, -1, -5.759964, 1, 1.5, 0.5, 0.5,
-3.563324, -1, -5.759964, 0, 1.5, 0.5, 0.5,
-3.563324, 0, -5.759964, 0, -0.5, 0.5, 0.5,
-3.563324, 0, -5.759964, 1, -0.5, 0.5, 0.5,
-3.563324, 0, -5.759964, 1, 1.5, 0.5, 0.5,
-3.563324, 0, -5.759964, 0, 1.5, 0.5, 0.5,
-3.563324, 1, -5.759964, 0, -0.5, 0.5, 0.5,
-3.563324, 1, -5.759964, 1, -0.5, 0.5, 0.5,
-3.563324, 1, -5.759964, 1, 1.5, 0.5, 0.5,
-3.563324, 1, -5.759964, 0, 1.5, 0.5, 0.5,
-3.563324, 2, -5.759964, 0, -0.5, 0.5, 0.5,
-3.563324, 2, -5.759964, 1, -0.5, 0.5, 0.5,
-3.563324, 2, -5.759964, 1, 1.5, 0.5, 0.5,
-3.563324, 2, -5.759964, 0, 1.5, 0.5, 0.5
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
-3.083269, -3.391514, -4,
-3.083269, -3.391514, 4,
-3.083269, -3.391514, -4,
-3.243288, -3.549189, -4,
-3.083269, -3.391514, -2,
-3.243288, -3.549189, -2,
-3.083269, -3.391514, 0,
-3.243288, -3.549189, 0,
-3.083269, -3.391514, 2,
-3.243288, -3.549189, 2,
-3.083269, -3.391514, 4,
-3.243288, -3.549189, 4
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
-3.563324, -3.864538, -4, 0, -0.5, 0.5, 0.5,
-3.563324, -3.864538, -4, 1, -0.5, 0.5, 0.5,
-3.563324, -3.864538, -4, 1, 1.5, 0.5, 0.5,
-3.563324, -3.864538, -4, 0, 1.5, 0.5, 0.5,
-3.563324, -3.864538, -2, 0, -0.5, 0.5, 0.5,
-3.563324, -3.864538, -2, 1, -0.5, 0.5, 0.5,
-3.563324, -3.864538, -2, 1, 1.5, 0.5, 0.5,
-3.563324, -3.864538, -2, 0, 1.5, 0.5, 0.5,
-3.563324, -3.864538, 0, 0, -0.5, 0.5, 0.5,
-3.563324, -3.864538, 0, 1, -0.5, 0.5, 0.5,
-3.563324, -3.864538, 0, 1, 1.5, 0.5, 0.5,
-3.563324, -3.864538, 0, 0, 1.5, 0.5, 0.5,
-3.563324, -3.864538, 2, 0, -0.5, 0.5, 0.5,
-3.563324, -3.864538, 2, 1, -0.5, 0.5, 0.5,
-3.563324, -3.864538, 2, 1, 1.5, 0.5, 0.5,
-3.563324, -3.864538, 2, 0, 1.5, 0.5, 0.5,
-3.563324, -3.864538, 4, 0, -0.5, 0.5, 0.5,
-3.563324, -3.864538, 4, 1, -0.5, 0.5, 0.5,
-3.563324, -3.864538, 4, 1, 1.5, 0.5, 0.5,
-3.563324, -3.864538, 4, 0, 1.5, 0.5, 0.5
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
-3.083269, -3.391514, -4.967484,
-3.083269, 2.915473, -4.967484,
-3.083269, -3.391514, 5.598916,
-3.083269, 2.915473, 5.598916,
-3.083269, -3.391514, -4.967484,
-3.083269, -3.391514, 5.598916,
-3.083269, 2.915473, -4.967484,
-3.083269, 2.915473, 5.598916,
-3.083269, -3.391514, -4.967484,
3.317466, -3.391514, -4.967484,
-3.083269, -3.391514, 5.598916,
3.317466, -3.391514, 5.598916,
-3.083269, 2.915473, -4.967484,
3.317466, 2.915473, -4.967484,
-3.083269, 2.915473, 5.598916,
3.317466, 2.915473, 5.598916,
3.317466, -3.391514, -4.967484,
3.317466, 2.915473, -4.967484,
3.317466, -3.391514, 5.598916,
3.317466, 2.915473, 5.598916,
3.317466, -3.391514, -4.967484,
3.317466, -3.391514, 5.598916,
3.317466, 2.915473, -4.967484,
3.317466, 2.915473, 5.598916
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
var radius = 7.406684;
var distance = 32.95317;
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
mvMatrix.translate( -0.1170987, 0.2380208, -0.315716 );
mvMatrix.scale( 1.251146, 1.269743, 0.7578979 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.95317);
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
rhymed<-read.table("rhymed.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-rhymed$V2
```

```
## Error in eval(expr, envir, enclos): object 'rhymed' not found
```

```r
y<-rhymed$V3
```

```
## Error in eval(expr, envir, enclos): object 'rhymed' not found
```

```r
z<-rhymed$V4
```

```
## Error in eval(expr, envir, enclos): object 'rhymed' not found
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
-2.990055, 1.301476, 0.1182079, 0, 0, 1, 1, 1,
-2.981347, -0.8252938, -1.535009, 1, 0, 0, 1, 1,
-2.914231, -0.5713505, -1.745581, 1, 0, 0, 1, 1,
-2.874089, -0.4099844, -1.785376, 1, 0, 0, 1, 1,
-2.813486, -1.326492, -2.76579, 1, 0, 0, 1, 1,
-2.659809, -0.8494852, -2.066514, 1, 0, 0, 1, 1,
-2.514493, -0.3331712, -1.533037, 0, 0, 0, 1, 1,
-2.436561, 0.6269524, -3.043447, 0, 0, 0, 1, 1,
-2.393543, -0.1627588, -2.382429, 0, 0, 0, 1, 1,
-2.39352, 0.9179444, -1.428596, 0, 0, 0, 1, 1,
-2.387034, 0.04378925, -3.04877, 0, 0, 0, 1, 1,
-2.384866, 1.131191, -0.03771663, 0, 0, 0, 1, 1,
-2.368284, -0.2702765, 1.297755, 0, 0, 0, 1, 1,
-2.357777, 2.051939, -1.674242, 1, 1, 1, 1, 1,
-2.328987, 2.113845, -1.008965, 1, 1, 1, 1, 1,
-2.317521, -0.8151792, -2.248501, 1, 1, 1, 1, 1,
-2.30244, -0.8237739, -1.728684, 1, 1, 1, 1, 1,
-2.280439, -1.344419, -1.284292, 1, 1, 1, 1, 1,
-2.276391, 0.5036024, -1.525917, 1, 1, 1, 1, 1,
-2.146986, 0.570592, -0.2995833, 1, 1, 1, 1, 1,
-2.141542, -0.1517755, -0.6045477, 1, 1, 1, 1, 1,
-2.119895, 0.007478808, -1.61574, 1, 1, 1, 1, 1,
-2.097879, -1.315149, -2.52827, 1, 1, 1, 1, 1,
-2.083158, 0.8343556, -1.619844, 1, 1, 1, 1, 1,
-2.065605, 0.5828995, -0.3418145, 1, 1, 1, 1, 1,
-2.014784, -0.7040936, -1.771075, 1, 1, 1, 1, 1,
-1.99614, 0.879617, 0.08285142, 1, 1, 1, 1, 1,
-1.991614, 1.477387, 0.3643777, 1, 1, 1, 1, 1,
-1.991516, -1.423777, -3.358802, 0, 0, 1, 1, 1,
-1.967539, -1.363097, -1.952685, 1, 0, 0, 1, 1,
-1.954063, 0.08522737, -2.272731, 1, 0, 0, 1, 1,
-1.928922, -0.2546633, -1.206008, 1, 0, 0, 1, 1,
-1.904891, 0.6489131, -0.5826581, 1, 0, 0, 1, 1,
-1.864861, -0.03751189, -3.435275, 1, 0, 0, 1, 1,
-1.864472, 0.544534, -1.712457, 0, 0, 0, 1, 1,
-1.86185, -1.031868, -2.223051, 0, 0, 0, 1, 1,
-1.859127, -0.2632586, -0.8232526, 0, 0, 0, 1, 1,
-1.852002, -1.010159, -2.380419, 0, 0, 0, 1, 1,
-1.851914, 0.4974058, -1.355202, 0, 0, 0, 1, 1,
-1.850765, -0.3451712, -1.371961, 0, 0, 0, 1, 1,
-1.843367, 0.2461997, 0.3330209, 0, 0, 0, 1, 1,
-1.810148, 0.1480949, -4.589405, 1, 1, 1, 1, 1,
-1.789083, -0.7561289, -3.244667, 1, 1, 1, 1, 1,
-1.771551, -1.393017, -2.56141, 1, 1, 1, 1, 1,
-1.766048, 0.1556412, -0.9889358, 1, 1, 1, 1, 1,
-1.749827, -0.03001032, -2.426761, 1, 1, 1, 1, 1,
-1.746694, -0.4463536, -0.6568978, 1, 1, 1, 1, 1,
-1.722228, -0.8927215, -1.61949, 1, 1, 1, 1, 1,
-1.719407, -1.578417, -3.206502, 1, 1, 1, 1, 1,
-1.701654, 0.4789395, 0.2138869, 1, 1, 1, 1, 1,
-1.686116, 0.06118742, -1.087143, 1, 1, 1, 1, 1,
-1.685805, -0.6130199, -2.827897, 1, 1, 1, 1, 1,
-1.683952, 0.2461341, -2.153085, 1, 1, 1, 1, 1,
-1.677473, -0.9984695, -2.234175, 1, 1, 1, 1, 1,
-1.66625, 1.324613, -2.134503, 1, 1, 1, 1, 1,
-1.661721, -0.9176672, -3.183014, 1, 1, 1, 1, 1,
-1.661181, 0.8037733, -1.932034, 0, 0, 1, 1, 1,
-1.652637, -1.180033, 0.107239, 1, 0, 0, 1, 1,
-1.621282, 1.196106, -2.058355, 1, 0, 0, 1, 1,
-1.620869, 1.900559, -0.6094993, 1, 0, 0, 1, 1,
-1.619981, 0.5246031, -1.044433, 1, 0, 0, 1, 1,
-1.58999, -0.347274, -2.086861, 1, 0, 0, 1, 1,
-1.589703, 1.073109, -2.819975, 0, 0, 0, 1, 1,
-1.577634, -0.6376348, -1.957458, 0, 0, 0, 1, 1,
-1.57449, -0.5593365, 0.1542325, 0, 0, 0, 1, 1,
-1.560612, 0.1784117, -2.055879, 0, 0, 0, 1, 1,
-1.55353, -0.1914503, -2.843606, 0, 0, 0, 1, 1,
-1.538375, 0.4066498, -0.5965664, 0, 0, 0, 1, 1,
-1.535618, -3.029999, -2.731094, 0, 0, 0, 1, 1,
-1.532403, -0.8252935, -2.510917, 1, 1, 1, 1, 1,
-1.530558, -0.676196, -4.36214, 1, 1, 1, 1, 1,
-1.518329, 0.1050216, -3.067777, 1, 1, 1, 1, 1,
-1.5081, 0.3551568, 0.5766572, 1, 1, 1, 1, 1,
-1.502434, -0.2565529, -3.207965, 1, 1, 1, 1, 1,
-1.482642, 0.4017818, -1.123405, 1, 1, 1, 1, 1,
-1.469857, 0.7520642, -0.5701439, 1, 1, 1, 1, 1,
-1.467667, -0.8510906, -2.007741, 1, 1, 1, 1, 1,
-1.465794, 0.2211504, -2.749538, 1, 1, 1, 1, 1,
-1.458022, -1.688175, -1.779645, 1, 1, 1, 1, 1,
-1.45371, 0.1664971, -1.574612, 1, 1, 1, 1, 1,
-1.452085, -1.410189, -2.427593, 1, 1, 1, 1, 1,
-1.444497, -1.594766, -1.834619, 1, 1, 1, 1, 1,
-1.43543, 1.093726, -2.009266, 1, 1, 1, 1, 1,
-1.426474, 0.1818031, -0.9011154, 1, 1, 1, 1, 1,
-1.424079, 0.3120723, -1.005141, 0, 0, 1, 1, 1,
-1.423247, 0.7436725, -0.636102, 1, 0, 0, 1, 1,
-1.420063, -0.1354917, -1.555405, 1, 0, 0, 1, 1,
-1.41219, 1.113935, -1.843148, 1, 0, 0, 1, 1,
-1.410897, 2.135317, 0.1439969, 1, 0, 0, 1, 1,
-1.40397, -1.393961, -2.607432, 1, 0, 0, 1, 1,
-1.39887, 0.4641019, -2.136141, 0, 0, 0, 1, 1,
-1.392449, -1.491713, 0.05834464, 0, 0, 0, 1, 1,
-1.39139, -0.2520773, -1.294971, 0, 0, 0, 1, 1,
-1.390917, -0.1823725, -1.696182, 0, 0, 0, 1, 1,
-1.387819, 0.4356198, 0.8328583, 0, 0, 0, 1, 1,
-1.380554, 0.3889244, 0.03249249, 0, 0, 0, 1, 1,
-1.379841, 0.472928, -1.752375, 0, 0, 0, 1, 1,
-1.370073, -0.3526267, -2.60861, 1, 1, 1, 1, 1,
-1.36821, 2.190603, 0.1627659, 1, 1, 1, 1, 1,
-1.361981, 1.582462, -0.7487727, 1, 1, 1, 1, 1,
-1.355892, 0.8617383, 0.4849553, 1, 1, 1, 1, 1,
-1.355337, -1.27999, -1.761809, 1, 1, 1, 1, 1,
-1.344085, 0.5048497, 0.1557134, 1, 1, 1, 1, 1,
-1.34203, -0.641211, -0.7163796, 1, 1, 1, 1, 1,
-1.338894, 0.2504884, -4.720867, 1, 1, 1, 1, 1,
-1.335257, -0.4032589, -3.077718, 1, 1, 1, 1, 1,
-1.328931, -1.129239, -2.88525, 1, 1, 1, 1, 1,
-1.326764, 1.287397, -1.744938, 1, 1, 1, 1, 1,
-1.324765, -0.4216857, -1.001829, 1, 1, 1, 1, 1,
-1.320576, -1.076931, -2.448663, 1, 1, 1, 1, 1,
-1.318565, 0.2776116, -0.3005742, 1, 1, 1, 1, 1,
-1.315268, -0.4612534, -1.055596, 1, 1, 1, 1, 1,
-1.314105, 0.4115738, -1.231105, 0, 0, 1, 1, 1,
-1.306177, -0.2336514, -1.756226, 1, 0, 0, 1, 1,
-1.297608, 0.8396534, -1.96814, 1, 0, 0, 1, 1,
-1.28315, 2.056922, 0.1831447, 1, 0, 0, 1, 1,
-1.281539, -0.1737045, -1.315264, 1, 0, 0, 1, 1,
-1.279238, 0.3376006, -1.655324, 1, 0, 0, 1, 1,
-1.274993, -0.2440001, -2.911027, 0, 0, 0, 1, 1,
-1.272812, -0.2935651, -1.240011, 0, 0, 0, 1, 1,
-1.272568, -1.645268, -2.563552, 0, 0, 0, 1, 1,
-1.27001, 2.034289, 0.01265569, 0, 0, 0, 1, 1,
-1.260171, -1.390969, -1.420459, 0, 0, 0, 1, 1,
-1.258491, 1.528388, -2.272029, 0, 0, 0, 1, 1,
-1.24859, 1.16192, -0.06684998, 0, 0, 0, 1, 1,
-1.247775, 0.2605501, -2.763369, 1, 1, 1, 1, 1,
-1.242367, -0.3804691, -1.866716, 1, 1, 1, 1, 1,
-1.229009, 1.649325, -1.727414, 1, 1, 1, 1, 1,
-1.225245, 0.5329099, -1.257733, 1, 1, 1, 1, 1,
-1.224877, 1.112526, -1.874971, 1, 1, 1, 1, 1,
-1.221471, 0.7418677, 0.3744007, 1, 1, 1, 1, 1,
-1.217741, 0.2119713, 0.3870364, 1, 1, 1, 1, 1,
-1.214561, 1.5782, 2.203063, 1, 1, 1, 1, 1,
-1.210302, 0.393375, -0.5078127, 1, 1, 1, 1, 1,
-1.205697, -0.6621079, -3.010573, 1, 1, 1, 1, 1,
-1.202187, -1.046565, -2.950364, 1, 1, 1, 1, 1,
-1.201848, -0.2310844, -1.062039, 1, 1, 1, 1, 1,
-1.199985, -0.843262, -4.042056, 1, 1, 1, 1, 1,
-1.197773, 0.2757494, -3.145677, 1, 1, 1, 1, 1,
-1.195565, 0.6489601, 0.4666549, 1, 1, 1, 1, 1,
-1.192185, 0.2977748, -2.14009, 0, 0, 1, 1, 1,
-1.167838, 1.062676, -2.007369, 1, 0, 0, 1, 1,
-1.166693, -0.467922, -1.681505, 1, 0, 0, 1, 1,
-1.165322, 1.195011, -3.351643, 1, 0, 0, 1, 1,
-1.161094, -0.5300408, -2.240437, 1, 0, 0, 1, 1,
-1.15764, 0.7867515, 0.3859396, 1, 0, 0, 1, 1,
-1.14446, -1.522245, -2.566827, 0, 0, 0, 1, 1,
-1.143185, 1.252295, -1.106529, 0, 0, 0, 1, 1,
-1.137927, -0.3377841, -2.792617, 0, 0, 0, 1, 1,
-1.134539, -0.6139413, -3.300103, 0, 0, 0, 1, 1,
-1.13367, 0.3731799, -1.104438, 0, 0, 0, 1, 1,
-1.132115, 1.205479, -1.104595, 0, 0, 0, 1, 1,
-1.131018, -1.149847, -2.662528, 0, 0, 0, 1, 1,
-1.130684, 0.3061847, -2.010083, 1, 1, 1, 1, 1,
-1.1234, -0.9965117, -3.186174, 1, 1, 1, 1, 1,
-1.11126, 0.3362644, -0.5782105, 1, 1, 1, 1, 1,
-1.106491, -1.183828, -2.081578, 1, 1, 1, 1, 1,
-1.104056, 0.1061888, -0.956197, 1, 1, 1, 1, 1,
-1.102378, -0.2608196, -1.252823, 1, 1, 1, 1, 1,
-1.099815, 2.069437, -1.226683, 1, 1, 1, 1, 1,
-1.098186, -0.3971851, -3.52695, 1, 1, 1, 1, 1,
-1.091475, -0.4108803, -1.688207, 1, 1, 1, 1, 1,
-1.088568, -0.9110289, -2.970634, 1, 1, 1, 1, 1,
-1.085787, -1.881713, -1.332792, 1, 1, 1, 1, 1,
-1.082661, -0.6431485, -1.473873, 1, 1, 1, 1, 1,
-1.067791, 1.753327, -0.928546, 1, 1, 1, 1, 1,
-1.063442, -0.1987715, -0.4598545, 1, 1, 1, 1, 1,
-1.063184, 1.341692, 0.1608532, 1, 1, 1, 1, 1,
-1.06124, 1.060856, -1.015574, 0, 0, 1, 1, 1,
-1.058636, 0.3027637, -2.433213, 1, 0, 0, 1, 1,
-1.054122, -1.948442, -1.674332, 1, 0, 0, 1, 1,
-1.050626, 0.3442507, -0.5130154, 1, 0, 0, 1, 1,
-1.03827, -0.2814218, -2.364174, 1, 0, 0, 1, 1,
-1.037493, 2.459301, 0.357875, 1, 0, 0, 1, 1,
-1.031233, -0.01708564, -0.9835549, 0, 0, 0, 1, 1,
-1.029539, 0.2328858, 0.4682464, 0, 0, 0, 1, 1,
-1.02468, 0.08650139, -0.5966171, 0, 0, 0, 1, 1,
-1.020046, 1.321755, 0.4690758, 0, 0, 0, 1, 1,
-1.01984, 0.4885236, 0.03087628, 0, 0, 0, 1, 1,
-1.016979, -0.2208024, -1.042804, 0, 0, 0, 1, 1,
-1.015151, -0.6092519, -1.190784, 0, 0, 0, 1, 1,
-1.012813, 0.1143049, -3.319885, 1, 1, 1, 1, 1,
-1.01274, -0.1272183, -1.456934, 1, 1, 1, 1, 1,
-1.008999, 2.091605, -1.437493, 1, 1, 1, 1, 1,
-1.007866, -1.037296, -2.197557, 1, 1, 1, 1, 1,
-1.005806, 0.9809501, -2.151343, 1, 1, 1, 1, 1,
-1.001372, -0.7235023, -1.764418, 1, 1, 1, 1, 1,
-0.9980634, -0.3315, -1.184256, 1, 1, 1, 1, 1,
-0.9938898, 0.7342991, -0.4902412, 1, 1, 1, 1, 1,
-0.9921036, -0.8929452, -2.194162, 1, 1, 1, 1, 1,
-0.9670006, -1.129931, -2.20856, 1, 1, 1, 1, 1,
-0.9506409, -0.7636715, -3.008649, 1, 1, 1, 1, 1,
-0.9478876, -1.706145, -2.480692, 1, 1, 1, 1, 1,
-0.9383269, -0.05241094, -1.322289, 1, 1, 1, 1, 1,
-0.9332365, -0.5108989, -2.680678, 1, 1, 1, 1, 1,
-0.9273526, 0.2531113, -2.110664, 1, 1, 1, 1, 1,
-0.9266193, -0.04396889, -1.69443, 0, 0, 1, 1, 1,
-0.9235262, -0.1333774, -3.489655, 1, 0, 0, 1, 1,
-0.9148285, 1.78531, -0.9576375, 1, 0, 0, 1, 1,
-0.9133578, 2.417544, -0.1704967, 1, 0, 0, 1, 1,
-0.9081806, 0.1277248, -1.296647, 1, 0, 0, 1, 1,
-0.9014623, 0.9570821, -0.7466107, 1, 0, 0, 1, 1,
-0.9003494, -2.065332, -3.176545, 0, 0, 0, 1, 1,
-0.8969339, 0.2163801, -1.752516, 0, 0, 0, 1, 1,
-0.8949893, 2.697828, -0.5453734, 0, 0, 0, 1, 1,
-0.8913111, 0.9097016, 0.1590509, 0, 0, 0, 1, 1,
-0.8905373, -1.322714, -2.904432, 0, 0, 0, 1, 1,
-0.8848313, -1.645191, -1.591256, 0, 0, 0, 1, 1,
-0.8830336, -0.1515194, -1.600079, 0, 0, 0, 1, 1,
-0.8767641, -1.000444, -3.128393, 1, 1, 1, 1, 1,
-0.8756837, 1.019885, -1.887682, 1, 1, 1, 1, 1,
-0.8723015, 0.361219, -1.387702, 1, 1, 1, 1, 1,
-0.8671428, 0.4990581, -0.5039224, 1, 1, 1, 1, 1,
-0.8658158, -0.2248808, -1.651582, 1, 1, 1, 1, 1,
-0.8653652, -0.1695477, -1.791069, 1, 1, 1, 1, 1,
-0.8626402, -0.09401345, -2.5672, 1, 1, 1, 1, 1,
-0.8607566, 2.326016, 1.316123, 1, 1, 1, 1, 1,
-0.8585517, 0.1450559, -0.103723, 1, 1, 1, 1, 1,
-0.8516587, 0.8078678, 0.2844478, 1, 1, 1, 1, 1,
-0.8472271, -1.0336, -1.942241, 1, 1, 1, 1, 1,
-0.8409212, 0.09774596, -2.625145, 1, 1, 1, 1, 1,
-0.834215, -0.08424527, -1.096915, 1, 1, 1, 1, 1,
-0.8332121, 1.179971, -0.9596627, 1, 1, 1, 1, 1,
-0.8325931, 1.631396, 0.9986647, 1, 1, 1, 1, 1,
-0.824572, 1.692209, -0.08866572, 0, 0, 1, 1, 1,
-0.823885, 0.910867, -0.1137432, 1, 0, 0, 1, 1,
-0.8229641, -0.4976966, -2.433537, 1, 0, 0, 1, 1,
-0.8154395, -0.674876, -1.329688, 1, 0, 0, 1, 1,
-0.8130201, -0.5363644, -1.314426, 1, 0, 0, 1, 1,
-0.8104157, 1.655715, -1.237913, 1, 0, 0, 1, 1,
-0.8101744, 0.7580822, 0.6701359, 0, 0, 0, 1, 1,
-0.8098075, -1.193809, -3.982328, 0, 0, 0, 1, 1,
-0.8091939, 0.647818, -0.02111976, 0, 0, 0, 1, 1,
-0.8088282, -1.134934, -2.588252, 0, 0, 0, 1, 1,
-0.8006346, -1.288236, -1.594036, 0, 0, 0, 1, 1,
-0.7998394, -0.5481776, -1.514885, 0, 0, 0, 1, 1,
-0.7884045, 1.496436, -0.05811235, 0, 0, 0, 1, 1,
-0.7876106, 0.3934551, -0.8341904, 1, 1, 1, 1, 1,
-0.778732, -0.4912429, -1.438461, 1, 1, 1, 1, 1,
-0.7785674, 1.238883, -1.787777, 1, 1, 1, 1, 1,
-0.7737624, 1.045411, -1.58637, 1, 1, 1, 1, 1,
-0.7717448, 0.2579584, -0.001631735, 1, 1, 1, 1, 1,
-0.7697192, -0.2482501, -3.594475, 1, 1, 1, 1, 1,
-0.7646755, -0.06608497, -1.216832, 1, 1, 1, 1, 1,
-0.7616687, 0.1963129, 0.9252849, 1, 1, 1, 1, 1,
-0.757468, 0.4043633, -1.114221, 1, 1, 1, 1, 1,
-0.7525572, 0.7066013, -2.192873, 1, 1, 1, 1, 1,
-0.7453805, 0.2303147, -0.9026361, 1, 1, 1, 1, 1,
-0.743928, 0.5660664, -0.885408, 1, 1, 1, 1, 1,
-0.7428778, 1.364763, -0.1363736, 1, 1, 1, 1, 1,
-0.7368206, 2.327062, -2.675272, 1, 1, 1, 1, 1,
-0.7363681, -0.1635377, -0.5286856, 1, 1, 1, 1, 1,
-0.7352517, -0.6877733, -1.259541, 0, 0, 1, 1, 1,
-0.7317694, -1.052391, -1.775121, 1, 0, 0, 1, 1,
-0.7260284, -1.167876, -1.735717, 1, 0, 0, 1, 1,
-0.718439, -0.4441241, -1.124166, 1, 0, 0, 1, 1,
-0.717091, 1.429552, 0.4442421, 1, 0, 0, 1, 1,
-0.7121876, 1.930061, -1.185236, 1, 0, 0, 1, 1,
-0.709193, -0.9047949, -1.444188, 0, 0, 0, 1, 1,
-0.7032505, 0.5657874, -0.08343884, 0, 0, 0, 1, 1,
-0.7021081, 1.509317, -0.1822342, 0, 0, 0, 1, 1,
-0.7008788, 1.880861, -0.7817758, 0, 0, 0, 1, 1,
-0.6972644, -0.2315455, -1.76924, 0, 0, 0, 1, 1,
-0.6907125, -0.9178741, -3.456847, 0, 0, 0, 1, 1,
-0.6901843, -0.8177728, -2.900022, 0, 0, 0, 1, 1,
-0.6874958, -1.568194, -1.655575, 1, 1, 1, 1, 1,
-0.6874252, -1.639801, -2.576315, 1, 1, 1, 1, 1,
-0.686055, 0.3757764, -1.251563, 1, 1, 1, 1, 1,
-0.6826076, -0.4519843, -2.956304, 1, 1, 1, 1, 1,
-0.6811889, 0.1700934, -2.513475, 1, 1, 1, 1, 1,
-0.6794179, 1.551521, 0.6085252, 1, 1, 1, 1, 1,
-0.6783685, 0.2971231, -0.6836134, 1, 1, 1, 1, 1,
-0.6765468, -3.171654, -3.396512, 1, 1, 1, 1, 1,
-0.6733433, 2.823623, -1.426814, 1, 1, 1, 1, 1,
-0.6705052, 2.396006, -0.8451278, 1, 1, 1, 1, 1,
-0.6582087, 1.927888, -1.255743, 1, 1, 1, 1, 1,
-0.6579014, -0.913522, -3.612753, 1, 1, 1, 1, 1,
-0.6521235, -1.256347, -1.460797, 1, 1, 1, 1, 1,
-0.6518307, 0.568845, -1.001714, 1, 1, 1, 1, 1,
-0.6487989, -1.291112, -0.3066868, 1, 1, 1, 1, 1,
-0.6426034, 1.109707, -1.148675, 0, 0, 1, 1, 1,
-0.6424036, 2.426316, -0.0298603, 1, 0, 0, 1, 1,
-0.6401325, 1.159863, -0.5127002, 1, 0, 0, 1, 1,
-0.6396864, -0.5649799, -1.840639, 1, 0, 0, 1, 1,
-0.6384694, 0.3345671, -1.690812, 1, 0, 0, 1, 1,
-0.6367658, -0.7374706, -2.595078, 1, 0, 0, 1, 1,
-0.6348291, 0.9025819, -0.7713403, 0, 0, 0, 1, 1,
-0.6331808, -0.5334647, -3.966177, 0, 0, 0, 1, 1,
-0.633176, -1.587683, -2.115939, 0, 0, 0, 1, 1,
-0.6317596, 0.6125353, -0.5979205, 0, 0, 0, 1, 1,
-0.6272906, 0.373769, -1.313706, 0, 0, 0, 1, 1,
-0.6267845, -0.2794162, -2.918212, 0, 0, 0, 1, 1,
-0.6262787, 0.4114952, -1.391359, 0, 0, 0, 1, 1,
-0.6215907, -0.03218224, -1.59775, 1, 1, 1, 1, 1,
-0.6191259, -1.569199, -3.560077, 1, 1, 1, 1, 1,
-0.6185929, -1.135923, -2.074066, 1, 1, 1, 1, 1,
-0.6184832, 0.09621406, -0.04155569, 1, 1, 1, 1, 1,
-0.6184247, -0.4240386, -0.1304694, 1, 1, 1, 1, 1,
-0.6148397, 1.063934, -0.4841724, 1, 1, 1, 1, 1,
-0.6108397, 0.02036451, 0.6757036, 1, 1, 1, 1, 1,
-0.6065037, 0.5985548, -0.2272091, 1, 1, 1, 1, 1,
-0.6015179, 2.388264, -2.259138, 1, 1, 1, 1, 1,
-0.6013741, -0.1978751, -0.02540439, 1, 1, 1, 1, 1,
-0.5904613, 1.199324, 0.4880611, 1, 1, 1, 1, 1,
-0.585977, -0.3548577, -1.689196, 1, 1, 1, 1, 1,
-0.5846651, -1.277313, -1.432309, 1, 1, 1, 1, 1,
-0.5806154, -0.7902355, -1.74944, 1, 1, 1, 1, 1,
-0.5802862, -0.2043949, -1.15107, 1, 1, 1, 1, 1,
-0.5801069, -0.08925736, -2.415322, 0, 0, 1, 1, 1,
-0.5761616, 0.4247591, 0.4777908, 1, 0, 0, 1, 1,
-0.5693191, -0.765424, -3.092203, 1, 0, 0, 1, 1,
-0.5688391, -1.031539, -2.999913, 1, 0, 0, 1, 1,
-0.5674484, -0.1334658, -3.775952, 1, 0, 0, 1, 1,
-0.5660017, 0.2820427, -1.429288, 1, 0, 0, 1, 1,
-0.5567153, 0.1649453, -1.505531, 0, 0, 0, 1, 1,
-0.5559773, -1.091087, -3.263264, 0, 0, 0, 1, 1,
-0.5540999, 1.114313, -0.01190081, 0, 0, 0, 1, 1,
-0.5522788, 0.8270695, -1.393555, 0, 0, 0, 1, 1,
-0.5518378, 1.027409, -2.527434, 0, 0, 0, 1, 1,
-0.547543, 0.4287739, -3.169803, 0, 0, 0, 1, 1,
-0.5405211, -0.3871784, -2.636185, 0, 0, 0, 1, 1,
-0.5388626, -1.284538, -1.907084, 1, 1, 1, 1, 1,
-0.5375618, -0.5882264, -0.4727626, 1, 1, 1, 1, 1,
-0.5328057, -0.3555385, -2.519851, 1, 1, 1, 1, 1,
-0.5288318, -0.07604509, -3.171653, 1, 1, 1, 1, 1,
-0.5283085, 2.7849, 2.096182, 1, 1, 1, 1, 1,
-0.5248623, 1.904505, 0.544148, 1, 1, 1, 1, 1,
-0.5240506, 0.1047335, -1.969071, 1, 1, 1, 1, 1,
-0.5226729, 1.449192, -0.4532504, 1, 1, 1, 1, 1,
-0.5140167, 0.8936376, 0.215309, 1, 1, 1, 1, 1,
-0.4985821, 0.1454963, 0.3556307, 1, 1, 1, 1, 1,
-0.4979096, 0.3751709, -0.8325487, 1, 1, 1, 1, 1,
-0.4974584, 1.119959, -0.5991805, 1, 1, 1, 1, 1,
-0.4974133, 1.229927, -0.4087547, 1, 1, 1, 1, 1,
-0.4953594, 0.940637, 0.9396622, 1, 1, 1, 1, 1,
-0.4936165, 0.06417431, -2.441107, 1, 1, 1, 1, 1,
-0.4921286, 2.106453, -0.7806732, 0, 0, 1, 1, 1,
-0.4890466, 0.1488075, -0.9746065, 1, 0, 0, 1, 1,
-0.4827279, 0.1794122, -0.2782034, 1, 0, 0, 1, 1,
-0.4795907, -0.2458167, -1.458888, 1, 0, 0, 1, 1,
-0.4760951, 0.1785261, -0.9102611, 1, 0, 0, 1, 1,
-0.4738418, 0.540599, -0.1550258, 1, 0, 0, 1, 1,
-0.4698841, -1.164467, -3.026207, 0, 0, 0, 1, 1,
-0.4678602, 0.3186956, -1.333765, 0, 0, 0, 1, 1,
-0.4678303, -0.4671219, -2.629054, 0, 0, 0, 1, 1,
-0.4607947, -1.213849, -2.95813, 0, 0, 0, 1, 1,
-0.459294, -2.037439, -4.813604, 0, 0, 0, 1, 1,
-0.4560745, 1.94814, -0.3775331, 0, 0, 0, 1, 1,
-0.4521782, -0.6861416, -3.719528, 0, 0, 0, 1, 1,
-0.449528, -1.171062, -3.225222, 1, 1, 1, 1, 1,
-0.4456324, 0.5484248, -1.267114, 1, 1, 1, 1, 1,
-0.4454129, 0.8883427, -1.431121, 1, 1, 1, 1, 1,
-0.4428504, -1.215577, -3.156334, 1, 1, 1, 1, 1,
-0.4414678, -0.3257687, -4.04397, 1, 1, 1, 1, 1,
-0.4387772, 0.0168588, -0.6360331, 1, 1, 1, 1, 1,
-0.4384463, 0.1126681, -1.060765, 1, 1, 1, 1, 1,
-0.435517, 0.8987971, -0.3691605, 1, 1, 1, 1, 1,
-0.4314422, -0.4594975, -1.744978, 1, 1, 1, 1, 1,
-0.4299431, 1.850265, -1.451523, 1, 1, 1, 1, 1,
-0.4276132, -1.985915, -3.604994, 1, 1, 1, 1, 1,
-0.4180837, -2.073982, -3.24732, 1, 1, 1, 1, 1,
-0.4056463, 2.15888, -0.04432144, 1, 1, 1, 1, 1,
-0.3995416, -1.050938, -2.599792, 1, 1, 1, 1, 1,
-0.3921025, 0.2886944, -1.961812, 1, 1, 1, 1, 1,
-0.3890325, -2.671074, -3.349117, 0, 0, 1, 1, 1,
-0.3815146, -0.6371221, -3.51291, 1, 0, 0, 1, 1,
-0.3800658, -0.1874901, -1.157901, 1, 0, 0, 1, 1,
-0.37737, 0.008255783, -0.987436, 1, 0, 0, 1, 1,
-0.3742746, 2.091376, 0.9700423, 1, 0, 0, 1, 1,
-0.369949, 0.9062409, -0.8876638, 1, 0, 0, 1, 1,
-0.3640225, 1.251671, 0.002727481, 0, 0, 0, 1, 1,
-0.3544559, -1.242417, -2.27915, 0, 0, 0, 1, 1,
-0.3538031, 0.7159026, -1.164564, 0, 0, 0, 1, 1,
-0.3530315, 0.2612486, -0.09223492, 0, 0, 0, 1, 1,
-0.3519415, 0.4848151, -0.3703423, 0, 0, 0, 1, 1,
-0.3510024, -0.8739842, -3.165634, 0, 0, 0, 1, 1,
-0.3509694, -0.2562051, -1.244136, 0, 0, 0, 1, 1,
-0.3482122, 0.1674582, -0.97933, 1, 1, 1, 1, 1,
-0.347318, -2.249636, -1.187333, 1, 1, 1, 1, 1,
-0.3404763, 1.180823, -0.0780673, 1, 1, 1, 1, 1,
-0.3337209, 0.7700365, -0.4779983, 1, 1, 1, 1, 1,
-0.3284048, -0.4653775, -1.258676, 1, 1, 1, 1, 1,
-0.3255358, -0.7801045, -1.842941, 1, 1, 1, 1, 1,
-0.3253414, -0.2017196, -2.230917, 1, 1, 1, 1, 1,
-0.3216352, -0.08427145, -0.351975, 1, 1, 1, 1, 1,
-0.3178779, 0.9208703, -0.3640817, 1, 1, 1, 1, 1,
-0.3076287, 1.969451, 1.475629, 1, 1, 1, 1, 1,
-0.3075593, 0.5433437, -1.612483, 1, 1, 1, 1, 1,
-0.3072144, 0.6353287, 0.3679101, 1, 1, 1, 1, 1,
-0.3030199, 1.111784, 1.349162, 1, 1, 1, 1, 1,
-0.3020521, 0.3594014, -0.7797949, 1, 1, 1, 1, 1,
-0.3006531, 0.3396315, -0.337209, 1, 1, 1, 1, 1,
-0.2971381, 1.222504, -0.3177683, 0, 0, 1, 1, 1,
-0.294948, 0.5859907, -0.2384668, 1, 0, 0, 1, 1,
-0.294926, 0.2000887, -2.582619, 1, 0, 0, 1, 1,
-0.2917049, 0.7089994, 1.063625, 1, 0, 0, 1, 1,
-0.2898381, -0.0561954, -0.9050283, 1, 0, 0, 1, 1,
-0.2880381, 1.047599, -1.712774, 1, 0, 0, 1, 1,
-0.283014, 0.8779203, 0.3231749, 0, 0, 0, 1, 1,
-0.2808228, 0.1608631, -1.463245, 0, 0, 0, 1, 1,
-0.2777562, -1.289678, -3.316297, 0, 0, 0, 1, 1,
-0.276916, -1.091892, -2.28951, 0, 0, 0, 1, 1,
-0.2727406, 0.7574924, -2.007257, 0, 0, 0, 1, 1,
-0.2726499, 1.825393, -2.07847, 0, 0, 0, 1, 1,
-0.2697059, -0.08200578, -1.611429, 0, 0, 0, 1, 1,
-0.2677356, -2.351014, -4.777093, 1, 1, 1, 1, 1,
-0.2677016, -0.1898333, -2.819423, 1, 1, 1, 1, 1,
-0.2633436, -0.7472572, -1.096971, 1, 1, 1, 1, 1,
-0.2626897, 0.2755828, 0.04790397, 1, 1, 1, 1, 1,
-0.2615642, 0.5321195, 1.508788, 1, 1, 1, 1, 1,
-0.2581399, 0.09722441, -1.230224, 1, 1, 1, 1, 1,
-0.2488002, 0.335288, -0.8086268, 1, 1, 1, 1, 1,
-0.2487807, 0.1060339, -1.799956, 1, 1, 1, 1, 1,
-0.2482516, 1.113324, 0.654806, 1, 1, 1, 1, 1,
-0.2416596, 0.6802735, -0.6205404, 1, 1, 1, 1, 1,
-0.2367644, 0.6152795, 0.1967652, 1, 1, 1, 1, 1,
-0.2309885, 1.016844, 0.2045386, 1, 1, 1, 1, 1,
-0.2303978, -0.3508576, -2.048277, 1, 1, 1, 1, 1,
-0.2279044, 1.28413, 0.2051571, 1, 1, 1, 1, 1,
-0.2134175, 0.1503691, -1.990829, 1, 1, 1, 1, 1,
-0.2112538, -1.490347, -3.004514, 0, 0, 1, 1, 1,
-0.2100556, -0.6494256, -3.600292, 1, 0, 0, 1, 1,
-0.2087814, -0.7004125, -2.786873, 1, 0, 0, 1, 1,
-0.2085844, 1.077672, -0.4007043, 1, 0, 0, 1, 1,
-0.2057244, 1.506192, 0.9924534, 1, 0, 0, 1, 1,
-0.2025055, -0.8221571, -1.487263, 1, 0, 0, 1, 1,
-0.1996645, -0.9753836, -2.505786, 0, 0, 0, 1, 1,
-0.1996394, -0.8169627, -1.1063, 0, 0, 0, 1, 1,
-0.1990671, 0.1965343, 0.558132, 0, 0, 0, 1, 1,
-0.19824, 0.9737154, 0.4673274, 0, 0, 0, 1, 1,
-0.1974663, -0.2188012, -3.650452, 0, 0, 0, 1, 1,
-0.196326, 2.802436, 0.8391696, 0, 0, 0, 1, 1,
-0.1937342, -0.771802, -2.883198, 0, 0, 0, 1, 1,
-0.1920033, 1.533094, -0.8466311, 1, 1, 1, 1, 1,
-0.1798933, 0.2487617, -0.4784926, 1, 1, 1, 1, 1,
-0.1795159, -0.7580573, -2.994499, 1, 1, 1, 1, 1,
-0.1789846, -1.960892, -3.492622, 1, 1, 1, 1, 1,
-0.1751953, -0.701055, -1.421305, 1, 1, 1, 1, 1,
-0.1749482, 0.4364549, -0.05848239, 1, 1, 1, 1, 1,
-0.1725929, 0.1274735, -1.325639, 1, 1, 1, 1, 1,
-0.1702496, 0.4791955, 0.09648857, 1, 1, 1, 1, 1,
-0.1698887, 0.6963923, -1.558735, 1, 1, 1, 1, 1,
-0.1685652, 0.1322796, -0.2583744, 1, 1, 1, 1, 1,
-0.1634476, -0.7643327, -3.680735, 1, 1, 1, 1, 1,
-0.1616531, 1.342509, -1.240473, 1, 1, 1, 1, 1,
-0.160636, -1.559613, -3.94612, 1, 1, 1, 1, 1,
-0.1591868, -0.7091329, -2.786038, 1, 1, 1, 1, 1,
-0.1522921, 0.1609775, -0.1219458, 1, 1, 1, 1, 1,
-0.1502595, -1.547584, -1.996797, 0, 0, 1, 1, 1,
-0.1484129, -0.2242859, -3.705309, 1, 0, 0, 1, 1,
-0.1468554, 1.005788, 0.6097276, 1, 0, 0, 1, 1,
-0.1461391, 1.038202, 1.540226, 1, 0, 0, 1, 1,
-0.1442203, 0.9915612, -1.385133, 1, 0, 0, 1, 1,
-0.1394614, -0.4139786, -2.581515, 1, 0, 0, 1, 1,
-0.1359673, 1.671686, -1.34766, 0, 0, 0, 1, 1,
-0.1337005, -1.15753, -1.836626, 0, 0, 0, 1, 1,
-0.1326204, 0.3096364, -0.4114066, 0, 0, 0, 1, 1,
-0.1228044, -2.262796, -3.615227, 0, 0, 0, 1, 1,
-0.1197937, -1.485589, -2.634218, 0, 0, 0, 1, 1,
-0.1187512, -0.09628674, -3.209841, 0, 0, 0, 1, 1,
-0.116505, -0.3989783, -0.5264194, 0, 0, 0, 1, 1,
-0.1160131, 0.462094, 0.6793181, 1, 1, 1, 1, 1,
-0.1134578, -0.07239029, -2.406597, 1, 1, 1, 1, 1,
-0.1080061, 0.94121, 0.9240713, 1, 1, 1, 1, 1,
-0.1047818, -1.796127, -2.345778, 1, 1, 1, 1, 1,
-0.1024031, -0.3619094, -1.087201, 1, 1, 1, 1, 1,
-0.1022355, 1.436444, -0.7650759, 1, 1, 1, 1, 1,
-0.1008402, -1.233382, -3.159372, 1, 1, 1, 1, 1,
-0.09833034, 0.3903436, 0.132223, 1, 1, 1, 1, 1,
-0.09411252, 0.1154493, 1.123255, 1, 1, 1, 1, 1,
-0.09284536, 0.576952, 0.475943, 1, 1, 1, 1, 1,
-0.09062146, -2.025002, -2.457026, 1, 1, 1, 1, 1,
-0.09047439, 0.491688, 0.3890297, 1, 1, 1, 1, 1,
-0.08904894, 1.084953, -1.442385, 1, 1, 1, 1, 1,
-0.08733669, -1.368919, -3.092646, 1, 1, 1, 1, 1,
-0.08619479, 0.6043835, 0.7850565, 1, 1, 1, 1, 1,
-0.085561, -0.0770955, -1.138282, 0, 0, 1, 1, 1,
-0.08247037, -0.2263868, -2.791755, 1, 0, 0, 1, 1,
-0.07792471, -0.8271081, -2.799656, 1, 0, 0, 1, 1,
-0.07516418, -1.10108, -2.255675, 1, 0, 0, 1, 1,
-0.07229144, 0.5265725, -2.431279, 1, 0, 0, 1, 1,
-0.07033906, 0.6665133, -1.050288, 1, 0, 0, 1, 1,
-0.06939184, 0.5411623, -1.196412, 0, 0, 0, 1, 1,
-0.0686124, -1.105405, -2.821575, 0, 0, 0, 1, 1,
-0.05530314, 0.660036, 1.259519, 0, 0, 0, 1, 1,
-0.04440812, -1.554868, -3.320258, 0, 0, 0, 1, 1,
-0.04147655, 0.4333657, -0.3658226, 0, 0, 0, 1, 1,
-0.03401944, 0.7681724, -1.004226, 0, 0, 0, 1, 1,
-0.03400173, -0.410184, -4.038501, 0, 0, 0, 1, 1,
-0.03109949, 1.280837, -0.1005488, 1, 1, 1, 1, 1,
-0.02353233, -1.134064, -1.782498, 1, 1, 1, 1, 1,
-0.02327998, -0.9388985, -3.667492, 1, 1, 1, 1, 1,
-0.02104326, 0.1208415, -0.6370549, 1, 1, 1, 1, 1,
-0.01952209, 0.8285634, -0.114369, 1, 1, 1, 1, 1,
-0.01831732, 1.420446, -0.5031953, 1, 1, 1, 1, 1,
-0.01773945, -0.4721996, -0.7787452, 1, 1, 1, 1, 1,
-0.01288483, 1.029899, -0.4544998, 1, 1, 1, 1, 1,
-0.01274373, 0.4741319, 0.531324, 1, 1, 1, 1, 1,
-0.00662094, 0.4473149, 0.1202903, 1, 1, 1, 1, 1,
-0.006045999, -1.56063, -2.789869, 1, 1, 1, 1, 1,
-0.004268154, 0.9196062, 0.8882143, 1, 1, 1, 1, 1,
-0.002090709, -1.292216, -3.709367, 1, 1, 1, 1, 1,
0.002151256, -0.9204646, 4.54127, 1, 1, 1, 1, 1,
0.01243033, 1.085528, 0.1310918, 1, 1, 1, 1, 1,
0.01520888, -0.2165508, 2.836552, 0, 0, 1, 1, 1,
0.01667749, -1.144593, 3.168222, 1, 0, 0, 1, 1,
0.01913136, -1.007395, 4.199666, 1, 0, 0, 1, 1,
0.02037372, -0.2501453, 1.770582, 1, 0, 0, 1, 1,
0.02103061, -0.9530137, 3.970146, 1, 0, 0, 1, 1,
0.02349778, -1.249273, 1.276419, 1, 0, 0, 1, 1,
0.02392027, -0.916549, 2.898439, 0, 0, 0, 1, 1,
0.02436448, 0.3504903, 1.522043, 0, 0, 0, 1, 1,
0.02601261, 0.0667524, 0.5728428, 0, 0, 0, 1, 1,
0.02807293, -1.693506, 2.144203, 0, 0, 0, 1, 1,
0.02819422, -0.1136645, 2.881019, 0, 0, 0, 1, 1,
0.03406075, -0.1777311, 5.123689, 0, 0, 0, 1, 1,
0.03416825, 0.4503095, 0.2487126, 0, 0, 0, 1, 1,
0.03446267, -0.4351749, 2.570816, 1, 1, 1, 1, 1,
0.03898061, 0.812948, 0.9115002, 1, 1, 1, 1, 1,
0.03981715, -0.2530338, 4.185912, 1, 1, 1, 1, 1,
0.04377528, -1.277227, 1.706802, 1, 1, 1, 1, 1,
0.04896336, 0.9821765, 1.416557, 1, 1, 1, 1, 1,
0.05249668, -2.606595, 1.980471, 1, 1, 1, 1, 1,
0.05541436, -0.9941867, 2.818316, 1, 1, 1, 1, 1,
0.05616328, 1.135622, -0.4629705, 1, 1, 1, 1, 1,
0.05631933, -0.8948345, 3.295513, 1, 1, 1, 1, 1,
0.05678776, 0.4116234, 0.265328, 1, 1, 1, 1, 1,
0.0627302, -0.1755821, 3.215318, 1, 1, 1, 1, 1,
0.06439826, -1.072268, 2.384815, 1, 1, 1, 1, 1,
0.06728001, -0.3418041, 2.65919, 1, 1, 1, 1, 1,
0.06922084, 2.027695, -0.8216795, 1, 1, 1, 1, 1,
0.0696497, 0.5795225, -0.3317967, 1, 1, 1, 1, 1,
0.07115939, 1.666233, 0.1857343, 0, 0, 1, 1, 1,
0.07201815, 0.6102199, -0.4974799, 1, 0, 0, 1, 1,
0.0743212, -0.7999466, 3.804196, 1, 0, 0, 1, 1,
0.07682601, -1.588797, 2.692034, 1, 0, 0, 1, 1,
0.07944016, -0.780791, 3.842779, 1, 0, 0, 1, 1,
0.08139037, -0.3807901, 3.092314, 1, 0, 0, 1, 1,
0.08463502, -1.194044, 2.335166, 0, 0, 0, 1, 1,
0.08551844, 0.3852829, 0.9766556, 0, 0, 0, 1, 1,
0.08827002, 0.8307731, 0.7415404, 0, 0, 0, 1, 1,
0.09675828, -3.095103, 2.724632, 0, 0, 0, 1, 1,
0.09932891, -1.633304, 3.256109, 0, 0, 0, 1, 1,
0.09996708, 0.7472261, 0.8982404, 0, 0, 0, 1, 1,
0.1071232, -0.872413, 3.272986, 0, 0, 0, 1, 1,
0.1112986, -0.6760048, 2.225983, 1, 1, 1, 1, 1,
0.1124655, 1.361038, 0.5762398, 1, 1, 1, 1, 1,
0.1158864, -1.107657, 3.142152, 1, 1, 1, 1, 1,
0.1213715, -1.706997, 3.508448, 1, 1, 1, 1, 1,
0.1253734, -0.2108555, 1.988222, 1, 1, 1, 1, 1,
0.1280714, -1.858332, 2.644284, 1, 1, 1, 1, 1,
0.1300601, 1.872843, -0.9082119, 1, 1, 1, 1, 1,
0.1323635, -2.201782, 2.373462, 1, 1, 1, 1, 1,
0.132756, 0.3207423, -0.3680188, 1, 1, 1, 1, 1,
0.136267, -1.285005, 3.359244, 1, 1, 1, 1, 1,
0.1369065, 1.30801, -1.052912, 1, 1, 1, 1, 1,
0.1373598, -0.6333816, 2.197135, 1, 1, 1, 1, 1,
0.138295, 0.3952813, -0.05768315, 1, 1, 1, 1, 1,
0.1393853, -0.1359184, 1.876911, 1, 1, 1, 1, 1,
0.1428988, 1.221398, -0.07926951, 1, 1, 1, 1, 1,
0.1451917, -1.605165, 4.724738, 0, 0, 1, 1, 1,
0.1546879, 1.130675, -0.0279543, 1, 0, 0, 1, 1,
0.1565384, 0.5726619, 0.8202326, 1, 0, 0, 1, 1,
0.1612347, 0.4814334, -0.2506344, 1, 0, 0, 1, 1,
0.1627505, -0.108382, 2.503813, 1, 0, 0, 1, 1,
0.166549, 0.2894907, -0.06465319, 1, 0, 0, 1, 1,
0.1682712, 0.5867497, -0.0145999, 0, 0, 0, 1, 1,
0.1703438, -0.02834962, 0.05283768, 0, 0, 0, 1, 1,
0.1723749, 0.4632796, 0.9067972, 0, 0, 0, 1, 1,
0.1746487, -0.7159006, 3.337111, 0, 0, 0, 1, 1,
0.1760755, -0.5245197, 2.995012, 0, 0, 0, 1, 1,
0.1819781, 0.03553802, 1.295539, 0, 0, 0, 1, 1,
0.1872369, 1.765297, -0.07616744, 0, 0, 0, 1, 1,
0.1874871, -0.1954074, 2.059615, 1, 1, 1, 1, 1,
0.1885508, 0.5583878, -1.370745, 1, 1, 1, 1, 1,
0.1907751, -0.5463883, 3.171381, 1, 1, 1, 1, 1,
0.1995182, 2.119955, 0.05464516, 1, 1, 1, 1, 1,
0.2028747, 1.040355, -0.4435291, 1, 1, 1, 1, 1,
0.2061302, -1.591612, 4.002339, 1, 1, 1, 1, 1,
0.206267, 0.2177967, 1.575351, 1, 1, 1, 1, 1,
0.2077755, 0.4150203, 0.8569551, 1, 1, 1, 1, 1,
0.2082058, -1.073238, 1.71685, 1, 1, 1, 1, 1,
0.21316, 1.420745, 1.878876, 1, 1, 1, 1, 1,
0.2147359, -0.6318553, 2.761216, 1, 1, 1, 1, 1,
0.2195905, -1.181312, 3.129979, 1, 1, 1, 1, 1,
0.2201085, -0.4283141, 2.834078, 1, 1, 1, 1, 1,
0.2268489, -0.5799454, 2.733253, 1, 1, 1, 1, 1,
0.2270328, 0.6030394, -0.01603908, 1, 1, 1, 1, 1,
0.2274012, 0.4153267, 0.07846779, 0, 0, 1, 1, 1,
0.2286134, 0.7729428, 0.401379, 1, 0, 0, 1, 1,
0.2416191, -1.847393, 2.883659, 1, 0, 0, 1, 1,
0.2418851, -0.9402231, 2.972788, 1, 0, 0, 1, 1,
0.2460066, -0.830492, 4.069784, 1, 0, 0, 1, 1,
0.2500907, 0.507799, 1.990044, 1, 0, 0, 1, 1,
0.2508049, 1.192865, -0.08438408, 0, 0, 0, 1, 1,
0.2524422, -0.2611387, 1.866448, 0, 0, 0, 1, 1,
0.2530041, -0.2193722, 1.101365, 0, 0, 0, 1, 1,
0.2545221, -0.6655154, 1.521744, 0, 0, 0, 1, 1,
0.2591931, -2.097379, 3.787514, 0, 0, 0, 1, 1,
0.2622669, 0.86366, 1.364557, 0, 0, 0, 1, 1,
0.2655107, -0.1849018, -0.4947535, 0, 0, 0, 1, 1,
0.2709633, -0.1179727, 2.18945, 1, 1, 1, 1, 1,
0.2730658, 1.179765, -0.06342261, 1, 1, 1, 1, 1,
0.274292, -1.259489, 2.238899, 1, 1, 1, 1, 1,
0.2837981, 1.034792, 1.410676, 1, 1, 1, 1, 1,
0.2840156, -0.5080441, 3.56477, 1, 1, 1, 1, 1,
0.284279, 0.715696, -0.7772592, 1, 1, 1, 1, 1,
0.2849337, 1.613629, -0.960964, 1, 1, 1, 1, 1,
0.2875105, 0.3622974, -0.3870581, 1, 1, 1, 1, 1,
0.2898662, 0.2287188, 1.749458, 1, 1, 1, 1, 1,
0.2909141, 0.0857475, 0.7681572, 1, 1, 1, 1, 1,
0.2920371, 0.458867, 1.077097, 1, 1, 1, 1, 1,
0.2929853, -0.5975769, 0.5291132, 1, 1, 1, 1, 1,
0.2974746, 0.9760705, 0.8577921, 1, 1, 1, 1, 1,
0.2982705, -0.1904628, 2.459493, 1, 1, 1, 1, 1,
0.3083687, -1.212778, 3.476177, 1, 1, 1, 1, 1,
0.3138219, -1.704788, 2.775315, 0, 0, 1, 1, 1,
0.314073, 0.8023802, -1.31955, 1, 0, 0, 1, 1,
0.314135, 0.8497772, 0.9791728, 1, 0, 0, 1, 1,
0.3172553, 1.662927, -0.3195804, 1, 0, 0, 1, 1,
0.3176235, 0.6815082, 0.725668, 1, 0, 0, 1, 1,
0.3205929, 1.759318, -0.6956779, 1, 0, 0, 1, 1,
0.3210081, 0.7414891, -0.9446577, 0, 0, 0, 1, 1,
0.3235703, -0.3067044, 1.70045, 0, 0, 0, 1, 1,
0.3241272, -0.1224701, -0.2091531, 0, 0, 0, 1, 1,
0.3290994, 0.7031035, 1.099915, 0, 0, 0, 1, 1,
0.3291654, 1.333277, -0.3934997, 0, 0, 0, 1, 1,
0.3298531, 0.7858379, 0.9705854, 0, 0, 0, 1, 1,
0.3304783, -1.826965, 3.761208, 0, 0, 0, 1, 1,
0.3365465, -0.8114673, 0.9845805, 1, 1, 1, 1, 1,
0.3374408, -1.446398, 4.108009, 1, 1, 1, 1, 1,
0.3417574, 0.1619979, 0.560884, 1, 1, 1, 1, 1,
0.3425462, 1.147161, -0.7799595, 1, 1, 1, 1, 1,
0.3442107, 0.009120512, 1.686612, 1, 1, 1, 1, 1,
0.3489479, -0.3680037, 2.86946, 1, 1, 1, 1, 1,
0.3587528, 0.9547793, -1.759799, 1, 1, 1, 1, 1,
0.3656685, 1.70993, 0.2135357, 1, 1, 1, 1, 1,
0.3740892, -1.152952, 1.493646, 1, 1, 1, 1, 1,
0.376756, -0.2548437, 2.805949, 1, 1, 1, 1, 1,
0.3771792, -0.2555299, 2.863029, 1, 1, 1, 1, 1,
0.3887146, -1.097449, 1.477486, 1, 1, 1, 1, 1,
0.3950278, 0.8144488, 1.103064, 1, 1, 1, 1, 1,
0.3967579, 0.8278587, 0.3236998, 1, 1, 1, 1, 1,
0.3971264, -0.3865348, 5.264279, 1, 1, 1, 1, 1,
0.3997806, -1.515745, 3.193226, 0, 0, 1, 1, 1,
0.4018857, 1.244126, 1.50658, 1, 0, 0, 1, 1,
0.4026472, -0.591022, 4.478655, 1, 0, 0, 1, 1,
0.4049246, -0.3624025, 2.24933, 1, 0, 0, 1, 1,
0.4100044, 1.256282, -0.6359129, 1, 0, 0, 1, 1,
0.4111665, -2.978041, 3.87042, 1, 0, 0, 1, 1,
0.4144301, -0.1572908, 2.609659, 0, 0, 0, 1, 1,
0.4178038, 2.104563, 1.729574, 0, 0, 0, 1, 1,
0.4241339, 0.07861505, 0.3534137, 0, 0, 0, 1, 1,
0.4282714, -0.02143058, 4.520706, 0, 0, 0, 1, 1,
0.4347981, -1.483535, 2.571176, 0, 0, 0, 1, 1,
0.4366296, -0.9245428, 3.747822, 0, 0, 0, 1, 1,
0.4376726, -0.3093895, 1.256125, 0, 0, 0, 1, 1,
0.4377457, 1.050234, 2.306508, 1, 1, 1, 1, 1,
0.4434703, -2.680108, 0.9281821, 1, 1, 1, 1, 1,
0.4451137, 0.4537843, 0.8127748, 1, 1, 1, 1, 1,
0.4472597, 0.02177932, 0.7627953, 1, 1, 1, 1, 1,
0.4493332, -0.7622092, 3.297369, 1, 1, 1, 1, 1,
0.4538615, -0.3810833, 1.656247, 1, 1, 1, 1, 1,
0.4588346, -0.8096713, 3.701641, 1, 1, 1, 1, 1,
0.4596838, 1.078796, 0.02562767, 1, 1, 1, 1, 1,
0.4683869, 0.6914713, 0.3130689, 1, 1, 1, 1, 1,
0.4698506, -0.6916143, 4.548879, 1, 1, 1, 1, 1,
0.471715, 1.234519, 1.003132, 1, 1, 1, 1, 1,
0.4753013, -0.04595875, 3.737648, 1, 1, 1, 1, 1,
0.4822024, -0.231017, 1.6744, 1, 1, 1, 1, 1,
0.4882974, -0.642123, 2.344373, 1, 1, 1, 1, 1,
0.4906866, 0.5305607, 2.637574, 1, 1, 1, 1, 1,
0.4916389, 1.039353, 1.804312, 0, 0, 1, 1, 1,
0.4941539, -0.3386063, 1.777567, 1, 0, 0, 1, 1,
0.4954661, 1.260747, 0.5064754, 1, 0, 0, 1, 1,
0.4963484, -1.447474, 2.184283, 1, 0, 0, 1, 1,
0.497885, -1.546268, 4.214721, 1, 0, 0, 1, 1,
0.5022041, -0.7889758, 3.107506, 1, 0, 0, 1, 1,
0.5023702, 0.2464727, 2.670049, 0, 0, 0, 1, 1,
0.5094143, 0.8607352, 0.589456, 0, 0, 0, 1, 1,
0.5107213, 1.437826, -0.4553756, 0, 0, 0, 1, 1,
0.5120698, 0.2731146, 1.963653, 0, 0, 0, 1, 1,
0.5157653, 0.5614447, 0.6368409, 0, 0, 0, 1, 1,
0.5180593, 0.6613465, 0.6451482, 0, 0, 0, 1, 1,
0.5186127, 0.5734599, 1.47552, 0, 0, 0, 1, 1,
0.5206643, -0.5528041, 2.484236, 1, 1, 1, 1, 1,
0.5224219, 1.887782, 1.792212, 1, 1, 1, 1, 1,
0.5237553, 1.885843, -0.02857891, 1, 1, 1, 1, 1,
0.5254574, 0.4962165, 0.4880615, 1, 1, 1, 1, 1,
0.5255937, -0.261225, 3.42909, 1, 1, 1, 1, 1,
0.5279514, 0.1478443, 1.048158, 1, 1, 1, 1, 1,
0.5288578, -1.737052, 2.768231, 1, 1, 1, 1, 1,
0.5291114, 0.6835169, 0.0130444, 1, 1, 1, 1, 1,
0.5307114, -1.134037, 1.919126, 1, 1, 1, 1, 1,
0.5329341, -0.1298479, 1.148607, 1, 1, 1, 1, 1,
0.5399037, -0.4052338, 1.908692, 1, 1, 1, 1, 1,
0.544619, 1.567365, 0.01249543, 1, 1, 1, 1, 1,
0.5487835, -0.3109806, 1.548856, 1, 1, 1, 1, 1,
0.5620124, 0.6159347, -0.2446557, 1, 1, 1, 1, 1,
0.567938, 0.2550027, 0.8106083, 1, 1, 1, 1, 1,
0.5711971, -0.03267568, 1.399973, 0, 0, 1, 1, 1,
0.5748731, 0.262383, 0.001470007, 1, 0, 0, 1, 1,
0.5752396, -0.5583915, 3.406832, 1, 0, 0, 1, 1,
0.5767466, -0.4825216, 1.034913, 1, 0, 0, 1, 1,
0.5769966, -1.56376, 3.518393, 1, 0, 0, 1, 1,
0.5771592, 0.9758937, -0.3548074, 1, 0, 0, 1, 1,
0.5804942, -1.205233, 4.59169, 0, 0, 0, 1, 1,
0.583387, 0.5510108, -0.1831896, 0, 0, 0, 1, 1,
0.5848747, 0.006238027, 0.2855048, 0, 0, 0, 1, 1,
0.5885332, 0.6659973, -0.5341017, 0, 0, 0, 1, 1,
0.5891314, -0.5566159, 2.137233, 0, 0, 0, 1, 1,
0.5893841, 0.446611, 0.793309, 0, 0, 0, 1, 1,
0.590175, -2.611943, 2.613445, 0, 0, 0, 1, 1,
0.591399, -0.04181052, 0.2536349, 1, 1, 1, 1, 1,
0.5918558, -0.4861868, 3.719626, 1, 1, 1, 1, 1,
0.5999082, -0.9363232, 2.984316, 1, 1, 1, 1, 1,
0.604214, 0.7542094, 1.023041, 1, 1, 1, 1, 1,
0.604224, -0.08765811, 2.457823, 1, 1, 1, 1, 1,
0.6111146, 0.7875047, -0.1131665, 1, 1, 1, 1, 1,
0.6121748, 0.6298282, 0.3563235, 1, 1, 1, 1, 1,
0.6130363, 1.101556, 0.1424337, 1, 1, 1, 1, 1,
0.6169092, -1.893438, 2.644328, 1, 1, 1, 1, 1,
0.6182094, 1.732092, 0.9568747, 1, 1, 1, 1, 1,
0.6183322, 0.08406308, 3.163459, 1, 1, 1, 1, 1,
0.6216463, -1.086682, 2.786503, 1, 1, 1, 1, 1,
0.6245461, -0.5188644, 0.539758, 1, 1, 1, 1, 1,
0.627754, 1.640018, -0.3106811, 1, 1, 1, 1, 1,
0.6316199, -1.106525, 3.493345, 1, 1, 1, 1, 1,
0.6318024, -0.006572989, 0.9404644, 0, 0, 1, 1, 1,
0.6330693, -0.7420437, 2.143363, 1, 0, 0, 1, 1,
0.6333658, -2.04391, 3.89155, 1, 0, 0, 1, 1,
0.636531, 1.456029, 1.375083, 1, 0, 0, 1, 1,
0.6381289, -1.031074, 2.910515, 1, 0, 0, 1, 1,
0.6392778, -0.002176373, 2.662043, 1, 0, 0, 1, 1,
0.6410192, 1.010903, 1.465083, 0, 0, 0, 1, 1,
0.641535, 0.200634, 0.6716644, 0, 0, 0, 1, 1,
0.6437747, -0.1280552, 2.241609, 0, 0, 0, 1, 1,
0.6496312, 0.5571066, 2.022714, 0, 0, 0, 1, 1,
0.6507769, 0.3500151, 1.350084, 0, 0, 0, 1, 1,
0.6594513, 0.7849154, 2.124248, 0, 0, 0, 1, 1,
0.6624926, -0.7739765, 1.29766, 0, 0, 0, 1, 1,
0.6637923, -0.05494998, 1.051396, 1, 1, 1, 1, 1,
0.6647148, -0.4362372, 1.858958, 1, 1, 1, 1, 1,
0.665876, -1.304262, 3.879859, 1, 1, 1, 1, 1,
0.6669987, 0.2706749, 2.230872, 1, 1, 1, 1, 1,
0.6680634, -1.781289, 3.527313, 1, 1, 1, 1, 1,
0.6681246, 0.1524439, 1.803285, 1, 1, 1, 1, 1,
0.6753314, -0.9323335, 2.150502, 1, 1, 1, 1, 1,
0.6764195, 0.6634082, -0.4319379, 1, 1, 1, 1, 1,
0.6812344, -0.6464956, 3.546062, 1, 1, 1, 1, 1,
0.6824015, -0.8841541, 2.459392, 1, 1, 1, 1, 1,
0.6853796, -0.5219252, 1.950065, 1, 1, 1, 1, 1,
0.6910109, -0.8524638, 2.094918, 1, 1, 1, 1, 1,
0.6992748, -1.772637, 2.103911, 1, 1, 1, 1, 1,
0.7023376, -1.63261, 5.445036, 1, 1, 1, 1, 1,
0.7107044, 1.080741, 0.615795, 1, 1, 1, 1, 1,
0.7110681, 0.9186606, 1.63571, 0, 0, 1, 1, 1,
0.7117838, -0.164203, 4.438613, 1, 0, 0, 1, 1,
0.7153118, -0.6344935, 2.333534, 1, 0, 0, 1, 1,
0.7157533, -0.5260505, 4.068183, 1, 0, 0, 1, 1,
0.7162718, -0.01873501, 2.078905, 1, 0, 0, 1, 1,
0.7183038, 0.8481386, 1.665785, 1, 0, 0, 1, 1,
0.7297398, -2.017449, 3.61302, 0, 0, 0, 1, 1,
0.7305216, -0.4974967, 3.443858, 0, 0, 0, 1, 1,
0.7356859, 0.601191, 1.012021, 0, 0, 0, 1, 1,
0.7360425, -0.824338, 2.069992, 0, 0, 0, 1, 1,
0.739758, 0.7696244, 1.298563, 0, 0, 0, 1, 1,
0.7398527, -1.219075, 3.610033, 0, 0, 0, 1, 1,
0.7420707, 1.756633, 1.289883, 0, 0, 0, 1, 1,
0.7462894, 1.002139, -0.772481, 1, 1, 1, 1, 1,
0.7464479, -0.8069409, 1.354254, 1, 1, 1, 1, 1,
0.7465596, -0.5334769, 2.905909, 1, 1, 1, 1, 1,
0.7466165, 1.09164, 0.9185874, 1, 1, 1, 1, 1,
0.7471967, 0.04823751, 1.254699, 1, 1, 1, 1, 1,
0.7487829, 1.913735, -0.9220567, 1, 1, 1, 1, 1,
0.7550895, -0.4615267, 2.441818, 1, 1, 1, 1, 1,
0.7582356, -0.2848727, 4.601494, 1, 1, 1, 1, 1,
0.7626235, -1.466488, 3.037284, 1, 1, 1, 1, 1,
0.7633485, 0.1147099, 1.324414, 1, 1, 1, 1, 1,
0.7701694, -0.5236567, 2.324096, 1, 1, 1, 1, 1,
0.7724801, 0.7127613, 1.457661, 1, 1, 1, 1, 1,
0.7727109, 0.2846751, 1.167461, 1, 1, 1, 1, 1,
0.7730629, 0.159959, 1.380495, 1, 1, 1, 1, 1,
0.773499, -0.1052574, 2.957698, 1, 1, 1, 1, 1,
0.7761258, 1.157076, 1.538969, 0, 0, 1, 1, 1,
0.7811632, 0.5025609, 0.6880734, 1, 0, 0, 1, 1,
0.7822309, 0.2565655, 0.9408662, 1, 0, 0, 1, 1,
0.7839006, 0.9739533, 1.891257, 1, 0, 0, 1, 1,
0.7907289, 0.4210722, 0.8492309, 1, 0, 0, 1, 1,
0.7914194, -2.349285, 3.862257, 1, 0, 0, 1, 1,
0.7958148, -0.7900891, 3.580197, 0, 0, 0, 1, 1,
0.7974398, -0.1020641, -0.3442151, 0, 0, 0, 1, 1,
0.7975755, -1.608679, 2.6674, 0, 0, 0, 1, 1,
0.7981151, -1.322135, 2.382187, 0, 0, 0, 1, 1,
0.7985219, -0.2168127, 3.333513, 0, 0, 0, 1, 1,
0.8004056, -0.3295455, 3.237426, 0, 0, 0, 1, 1,
0.802612, 1.781253, -1.059099, 0, 0, 0, 1, 1,
0.8138317, 0.1139564, 2.413494, 1, 1, 1, 1, 1,
0.8167058, -0.7061496, 1.462413, 1, 1, 1, 1, 1,
0.8235061, 0.7972587, 1.10911, 1, 1, 1, 1, 1,
0.8240307, 0.4652674, -1.601613, 1, 1, 1, 1, 1,
0.8246204, -2.041446, 2.530724, 1, 1, 1, 1, 1,
0.8389365, -1.163982, 2.517561, 1, 1, 1, 1, 1,
0.842473, 0.3823045, 1.144638, 1, 1, 1, 1, 1,
0.8426968, -0.018589, 0.6145653, 1, 1, 1, 1, 1,
0.8472288, -0.3367674, 0.6663641, 1, 1, 1, 1, 1,
0.8501673, 0.1470812, 2.099524, 1, 1, 1, 1, 1,
0.850949, 1.425409, 0.3036992, 1, 1, 1, 1, 1,
0.8597295, 0.5914348, 1.899901, 1, 1, 1, 1, 1,
0.8607302, 0.7786663, 1.176013, 1, 1, 1, 1, 1,
0.8623353, 0.09892686, 2.785039, 1, 1, 1, 1, 1,
0.8624713, -1.432485, 2.217201, 1, 1, 1, 1, 1,
0.8630713, 0.2676418, 1.742416, 0, 0, 1, 1, 1,
0.8633933, -0.7575483, 2.266828, 1, 0, 0, 1, 1,
0.8642305, 1.534674, 0.2095832, 1, 0, 0, 1, 1,
0.8649268, 2.294747, 0.5246801, 1, 0, 0, 1, 1,
0.8688187, -0.08551372, 0.9594688, 1, 0, 0, 1, 1,
0.8721651, -0.6786988, 2.937195, 1, 0, 0, 1, 1,
0.8774729, -0.3978986, 2.536425, 0, 0, 0, 1, 1,
0.8819311, 0.8625302, -0.239841, 0, 0, 0, 1, 1,
0.8835119, 0.2264095, 1.763574, 0, 0, 0, 1, 1,
0.8840377, -1.36119, 2.343296, 0, 0, 0, 1, 1,
0.8866486, -3.299665, 2.255313, 0, 0, 0, 1, 1,
0.8884182, 0.8659236, 0.3914503, 0, 0, 0, 1, 1,
0.8987373, -0.7981455, 1.465417, 0, 0, 0, 1, 1,
0.902912, 0.9014216, -0.5946597, 1, 1, 1, 1, 1,
0.9137788, 0.3523335, 0.7723001, 1, 1, 1, 1, 1,
0.9164227, 0.07416685, 0.3973758, 1, 1, 1, 1, 1,
0.9195894, 0.7034653, 0.6577902, 1, 1, 1, 1, 1,
0.9201888, -0.642368, 2.128937, 1, 1, 1, 1, 1,
0.9219178, 0.1557903, 0.3913105, 1, 1, 1, 1, 1,
0.9224232, -0.1973362, 1.785383, 1, 1, 1, 1, 1,
0.9229347, -0.2546609, 1.826445, 1, 1, 1, 1, 1,
0.9316735, 0.3462762, 1.260578, 1, 1, 1, 1, 1,
0.9458334, -0.2889391, 0.8759034, 1, 1, 1, 1, 1,
0.9484752, -0.2723565, 2.833878, 1, 1, 1, 1, 1,
0.9504372, -2.363497, 3.523685, 1, 1, 1, 1, 1,
0.951188, 1.178392, 0.4410246, 1, 1, 1, 1, 1,
0.9557144, -1.757129, 2.170451, 1, 1, 1, 1, 1,
0.9583075, -0.65834, 2.140587, 1, 1, 1, 1, 1,
0.9595685, 0.4396564, 0.8519779, 0, 0, 1, 1, 1,
0.9599963, 0.3070835, 1.621779, 1, 0, 0, 1, 1,
0.9665834, -0.7191306, 1.2974, 1, 0, 0, 1, 1,
0.966949, 1.001278, -0.3600333, 1, 0, 0, 1, 1,
0.9671791, -0.234643, 0.6947634, 1, 0, 0, 1, 1,
0.9740455, -0.4554145, 1.882717, 1, 0, 0, 1, 1,
0.9747005, 0.6801719, 1.314033, 0, 0, 0, 1, 1,
0.977555, -0.3357106, 1.537459, 0, 0, 0, 1, 1,
0.9827541, -0.1190365, 3.926796, 0, 0, 0, 1, 1,
0.9843364, 1.497257, 1.171829, 0, 0, 0, 1, 1,
0.9857782, 0.9387072, 0.4968511, 0, 0, 0, 1, 1,
0.9874424, 0.06138348, 1.238748, 0, 0, 0, 1, 1,
0.989222, 1.549275, 0.2256307, 0, 0, 0, 1, 1,
0.9954377, -1.342836, 3.195863, 1, 1, 1, 1, 1,
0.9971251, 0.0184742, 0.5447381, 1, 1, 1, 1, 1,
0.9975123, 1.159949, 2.007508, 1, 1, 1, 1, 1,
1.000711, 0.3404323, 1.291503, 1, 1, 1, 1, 1,
1.005757, 0.2791481, 1.666325, 1, 1, 1, 1, 1,
1.010168, -0.3098083, 1.967503, 1, 1, 1, 1, 1,
1.012294, 0.438524, 0.1010732, 1, 1, 1, 1, 1,
1.015859, -1.288439, 1.566316, 1, 1, 1, 1, 1,
1.017763, 0.4193906, 0.3913802, 1, 1, 1, 1, 1,
1.034366, -1.603819, 2.928441, 1, 1, 1, 1, 1,
1.034373, -1.118814, 3.451795, 1, 1, 1, 1, 1,
1.042331, -1.054912, 3.364442, 1, 1, 1, 1, 1,
1.048099, 0.0498403, 2.50969, 1, 1, 1, 1, 1,
1.048768, 0.1907289, 0.319107, 1, 1, 1, 1, 1,
1.070807, -1.738317, 2.336875, 1, 1, 1, 1, 1,
1.071984, 0.2056267, 0.8138663, 0, 0, 1, 1, 1,
1.079243, -0.7759493, 2.598083, 1, 0, 0, 1, 1,
1.081778, -2.75369, 1.993855, 1, 0, 0, 1, 1,
1.082697, 0.5768982, 0.8700191, 1, 0, 0, 1, 1,
1.084102, 0.3725653, 0.5751504, 1, 0, 0, 1, 1,
1.095994, -1.880989, 3.813607, 1, 0, 0, 1, 1,
1.111603, 0.9978744, 1.276324, 0, 0, 0, 1, 1,
1.112868, 2.618617, 1.501421, 0, 0, 0, 1, 1,
1.116906, -0.6870764, 1.893167, 0, 0, 0, 1, 1,
1.119568, 1.081576, 1.035357, 0, 0, 0, 1, 1,
1.137891, -1.953033, 2.829136, 0, 0, 0, 1, 1,
1.139397, -0.2980917, 1.513465, 0, 0, 0, 1, 1,
1.157628, -0.726539, 2.644305, 0, 0, 0, 1, 1,
1.160268, 1.100418, 1.164362, 1, 1, 1, 1, 1,
1.165064, -0.06595097, 1.246537, 1, 1, 1, 1, 1,
1.165642, 0.8993362, -0.5376644, 1, 1, 1, 1, 1,
1.166887, -0.1735752, 1.704671, 1, 1, 1, 1, 1,
1.173708, -1.858768, 4.389361, 1, 1, 1, 1, 1,
1.178775, 0.2158568, 1.311507, 1, 1, 1, 1, 1,
1.179945, -1.172358, 2.318016, 1, 1, 1, 1, 1,
1.183082, -2.460471, 1.086575, 1, 1, 1, 1, 1,
1.192921, -0.8677932, 3.400709, 1, 1, 1, 1, 1,
1.194021, 0.4281511, 0.7303544, 1, 1, 1, 1, 1,
1.198379, -0.3183753, 1.888793, 1, 1, 1, 1, 1,
1.20521, -1.188465, 3.023564, 1, 1, 1, 1, 1,
1.206533, 1.074026, 1.096587, 1, 1, 1, 1, 1,
1.206743, 1.39244, 1.307741, 1, 1, 1, 1, 1,
1.208285, -2.419767, 5.327875, 1, 1, 1, 1, 1,
1.217538, -0.1254041, 1.279243, 0, 0, 1, 1, 1,
1.217982, -1.156883, 1.971595, 1, 0, 0, 1, 1,
1.221183, 0.4328156, 0.4331168, 1, 0, 0, 1, 1,
1.230787, -0.5547817, 3.847931, 1, 0, 0, 1, 1,
1.232105, 0.5533535, 1.815282, 1, 0, 0, 1, 1,
1.233206, -0.5856942, 1.701883, 1, 0, 0, 1, 1,
1.233308, -2.352561, 2.19009, 0, 0, 0, 1, 1,
1.235288, -1.468216, 2.128655, 0, 0, 0, 1, 1,
1.237817, 0.2868037, 2.482849, 0, 0, 0, 1, 1,
1.242864, -0.3944181, 3.556752, 0, 0, 0, 1, 1,
1.258436, 0.8923436, 1.59459, 0, 0, 0, 1, 1,
1.261513, 1.449115, 0.6228904, 0, 0, 0, 1, 1,
1.279653, -0.4518195, 1.073999, 0, 0, 0, 1, 1,
1.282028, 1.042083, -0.8322477, 1, 1, 1, 1, 1,
1.28221, -0.07708482, 1.44765, 1, 1, 1, 1, 1,
1.283989, 0.8721105, 0.8976955, 1, 1, 1, 1, 1,
1.298751, 0.6978093, 0.3832642, 1, 1, 1, 1, 1,
1.29973, 0.1181918, 1.749515, 1, 1, 1, 1, 1,
1.312873, -0.4420457, 2.199696, 1, 1, 1, 1, 1,
1.317581, 0.2768248, 0.7994643, 1, 1, 1, 1, 1,
1.319175, -0.3723979, 0.8307298, 1, 1, 1, 1, 1,
1.322932, -2.554364, 2.416243, 1, 1, 1, 1, 1,
1.324696, 0.3719774, 1.569265, 1, 1, 1, 1, 1,
1.329216, 0.9502222, -0.3756791, 1, 1, 1, 1, 1,
1.329376, 1.38912, 0.5918841, 1, 1, 1, 1, 1,
1.337919, -0.3191094, 1.513947, 1, 1, 1, 1, 1,
1.351994, -0.09235357, 2.495423, 1, 1, 1, 1, 1,
1.369367, -0.9138986, 0.6117716, 1, 1, 1, 1, 1,
1.370493, 0.1459161, 1.548184, 0, 0, 1, 1, 1,
1.370894, 0.1665165, 1.837455, 1, 0, 0, 1, 1,
1.370909, -1.510124, 3.837948, 1, 0, 0, 1, 1,
1.381789, 0.3148077, 2.192619, 1, 0, 0, 1, 1,
1.387021, -0.06864341, 1.391698, 1, 0, 0, 1, 1,
1.396072, 0.9668302, 1.155859, 1, 0, 0, 1, 1,
1.409824, 0.1136784, 0.6176596, 0, 0, 0, 1, 1,
1.414884, -0.5729586, 1.845221, 0, 0, 0, 1, 1,
1.419404, 1.087749, 2.691731, 0, 0, 0, 1, 1,
1.423435, 0.4910887, 0.9744928, 0, 0, 0, 1, 1,
1.427038, -0.1754435, 3.270924, 0, 0, 0, 1, 1,
1.43007, -0.1418257, 2.723625, 0, 0, 0, 1, 1,
1.436643, -0.7582049, 1.687227, 0, 0, 0, 1, 1,
1.441343, 1.390902, 0.681884, 1, 1, 1, 1, 1,
1.44472, -0.58173, 2.301581, 1, 1, 1, 1, 1,
1.474085, 2.204863, -0.1970551, 1, 1, 1, 1, 1,
1.478458, -0.3039285, 1.490526, 1, 1, 1, 1, 1,
1.504532, -0.4686266, 1.844067, 1, 1, 1, 1, 1,
1.537129, -0.6283441, 0.623835, 1, 1, 1, 1, 1,
1.545629, 0.4217381, -0.002126435, 1, 1, 1, 1, 1,
1.551412, -0.457249, 1.349256, 1, 1, 1, 1, 1,
1.561634, 1.95209, -0.01075591, 1, 1, 1, 1, 1,
1.565864, -0.542466, 1.794977, 1, 1, 1, 1, 1,
1.585343, -0.9871084, 2.578971, 1, 1, 1, 1, 1,
1.587999, -0.7043258, -0.08622366, 1, 1, 1, 1, 1,
1.595684, 0.2889314, 1.42766, 1, 1, 1, 1, 1,
1.60389, -0.9358222, 4.594901, 1, 1, 1, 1, 1,
1.603969, 1.572921, 2.195247, 1, 1, 1, 1, 1,
1.618621, 0.02044718, 0.1700322, 0, 0, 1, 1, 1,
1.647086, -2.143775, 1.660608, 1, 0, 0, 1, 1,
1.67289, -1.919643, 4.014754, 1, 0, 0, 1, 1,
1.674816, 1.925287, 0.9441001, 1, 0, 0, 1, 1,
1.678134, 1.162303, 1.874351, 1, 0, 0, 1, 1,
1.678596, -0.2094265, 2.015265, 1, 0, 0, 1, 1,
1.683982, -1.156646, 2.03354, 0, 0, 0, 1, 1,
1.696609, -0.5482342, 1.69458, 0, 0, 0, 1, 1,
1.729951, -1.28546, 2.617085, 0, 0, 0, 1, 1,
1.73336, -1.174363, 2.261464, 0, 0, 0, 1, 1,
1.755373, -0.9665338, 2.790411, 0, 0, 0, 1, 1,
1.774808, 0.2765101, 1.847384, 0, 0, 0, 1, 1,
1.787847, 1.616248, 0.2226801, 0, 0, 0, 1, 1,
1.788214, -1.729753, 2.252885, 1, 1, 1, 1, 1,
1.792911, -2.276934, 4.746687, 1, 1, 1, 1, 1,
1.797835, -0.7478573, 1.898117, 1, 1, 1, 1, 1,
1.804694, -0.003629401, 0.5878697, 1, 1, 1, 1, 1,
1.823571, 1.122436, 1.605065, 1, 1, 1, 1, 1,
1.824974, -0.6863614, 1.685525, 1, 1, 1, 1, 1,
1.84427, 1.150428, 0.05920143, 1, 1, 1, 1, 1,
1.86338, 1.433932, 1.594483, 1, 1, 1, 1, 1,
1.90041, 1.200039, 2.551293, 1, 1, 1, 1, 1,
1.912395, 0.4084707, 1.77657, 1, 1, 1, 1, 1,
1.922386, 0.1000028, 2.101114, 1, 1, 1, 1, 1,
1.950592, -0.3095327, 2.653499, 1, 1, 1, 1, 1,
1.971457, -1.171077, 2.114269, 1, 1, 1, 1, 1,
2.005825, 0.05958986, 1.789819, 1, 1, 1, 1, 1,
2.047574, -0.1187244, 1.003122, 1, 1, 1, 1, 1,
2.0512, -0.7851717, 1.00177, 0, 0, 1, 1, 1,
2.0574, -1.458425, 2.337598, 1, 0, 0, 1, 1,
2.06915, -1.54466, 3.090127, 1, 0, 0, 1, 1,
2.07844, 0.7361472, 0.9101675, 1, 0, 0, 1, 1,
2.095588, 0.2322497, 2.135044, 1, 0, 0, 1, 1,
2.121828, -0.4725477, 2.071408, 1, 0, 0, 1, 1,
2.141217, 0.04381167, -0.08401617, 0, 0, 0, 1, 1,
2.145422, 2.061671, 0.7923591, 0, 0, 0, 1, 1,
2.151394, 0.1527131, 0.2393543, 0, 0, 0, 1, 1,
2.211267, 0.2801561, 3.604615, 0, 0, 0, 1, 1,
2.2203, -0.6843705, 1.392273, 0, 0, 0, 1, 1,
2.228106, 0.2121559, 1.437405, 0, 0, 0, 1, 1,
2.229533, 0.6549246, 0.7279488, 0, 0, 0, 1, 1,
2.421476, -0.2861942, 2.382526, 1, 1, 1, 1, 1,
2.547579, -0.03497827, 0.6961844, 1, 1, 1, 1, 1,
2.611434, -0.6215677, 1.446307, 1, 1, 1, 1, 1,
2.679079, 0.6061386, 2.859462, 1, 1, 1, 1, 1,
2.743756, 0.7424398, 0.8859971, 1, 1, 1, 1, 1,
2.752284, 0.5878685, 2.377297, 1, 1, 1, 1, 1,
3.224252, -0.6110013, 2.67741, 1, 1, 1, 1, 1
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
var radius = 9.264471;
var distance = 32.54106;
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
mvMatrix.translate( -0.1170986, 0.2380207, -0.315716 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.54106);
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
