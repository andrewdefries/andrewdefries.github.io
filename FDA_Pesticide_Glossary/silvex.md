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
-3.736419, -1.407264, -2.44883, 1, 0, 0, 1,
-3.212529, 1.435747, -0.4916362, 1, 0.007843138, 0, 1,
-2.760137, 1.610278, -0.9064743, 1, 0.01176471, 0, 1,
-2.729751, 0.3623139, -1.809106, 1, 0.01960784, 0, 1,
-2.574526, 0.3499859, -3.347489, 1, 0.02352941, 0, 1,
-2.511943, -1.042418, -2.578218, 1, 0.03137255, 0, 1,
-2.500857, 1.466107, -0.9671191, 1, 0.03529412, 0, 1,
-2.441508, -1.255732, -2.05973, 1, 0.04313726, 0, 1,
-2.436059, 1.75247, -1.372303, 1, 0.04705882, 0, 1,
-2.418007, 1.466003, -1.600479, 1, 0.05490196, 0, 1,
-2.341313, -1.139261, -3.304085, 1, 0.05882353, 0, 1,
-2.324318, 0.7803667, 0.2154755, 1, 0.06666667, 0, 1,
-2.320448, 0.9003152, -2.234091, 1, 0.07058824, 0, 1,
-2.292455, -1.710627, -2.182781, 1, 0.07843138, 0, 1,
-2.256375, 0.5777548, -2.14737, 1, 0.08235294, 0, 1,
-2.232271, -0.000495138, -2.723601, 1, 0.09019608, 0, 1,
-2.209585, -1.859991, -2.576905, 1, 0.09411765, 0, 1,
-2.194309, 1.49497, 1.113055, 1, 0.1019608, 0, 1,
-2.191554, 0.3651761, -1.554178, 1, 0.1098039, 0, 1,
-2.171844, 0.3084665, -1.620344, 1, 0.1137255, 0, 1,
-2.149026, -0.5931273, -1.851848, 1, 0.1215686, 0, 1,
-2.136509, -0.7258368, 0.8367279, 1, 0.1254902, 0, 1,
-2.121416, 0.6015813, -0.8713033, 1, 0.1333333, 0, 1,
-2.10556, 1.613062, -1.554483, 1, 0.1372549, 0, 1,
-2.08353, 0.4855109, -0.8890061, 1, 0.145098, 0, 1,
-2.072727, -1.045277, -0.5605221, 1, 0.1490196, 0, 1,
-2.042097, -1.347124, -2.658679, 1, 0.1568628, 0, 1,
-2.031573, 0.9929302, -1.788872, 1, 0.1607843, 0, 1,
-2.001521, -0.5941189, -0.8074835, 1, 0.1686275, 0, 1,
-1.993675, -0.05866155, -2.256649, 1, 0.172549, 0, 1,
-1.969473, 0.1565178, -1.224575, 1, 0.1803922, 0, 1,
-1.954693, 0.4581534, -0.7142892, 1, 0.1843137, 0, 1,
-1.903617, 0.8356155, -1.838317, 1, 0.1921569, 0, 1,
-1.883536, -0.4967106, -3.369205, 1, 0.1960784, 0, 1,
-1.865033, 0.3395295, -2.196733, 1, 0.2039216, 0, 1,
-1.853841, -0.6766357, -1.44788, 1, 0.2117647, 0, 1,
-1.834394, 0.707261, -1.95635, 1, 0.2156863, 0, 1,
-1.831348, 0.7276564, -1.731405, 1, 0.2235294, 0, 1,
-1.830575, 0.3091229, -3.419914, 1, 0.227451, 0, 1,
-1.822428, -1.869499, -2.594543, 1, 0.2352941, 0, 1,
-1.812426, 0.00809797, -0.3726924, 1, 0.2392157, 0, 1,
-1.806394, -0.4703003, -1.536644, 1, 0.2470588, 0, 1,
-1.785809, -0.2802297, -1.797801, 1, 0.2509804, 0, 1,
-1.767418, 0.06845952, -1.570379, 1, 0.2588235, 0, 1,
-1.754533, 0.5183797, -2.01721, 1, 0.2627451, 0, 1,
-1.731915, 0.3421213, -0.7790343, 1, 0.2705882, 0, 1,
-1.725873, 0.3818999, -2.611044, 1, 0.2745098, 0, 1,
-1.722122, -1.174423, -2.947031, 1, 0.282353, 0, 1,
-1.720536, 1.297798, -1.62927, 1, 0.2862745, 0, 1,
-1.719903, 0.4436831, -0.8051451, 1, 0.2941177, 0, 1,
-1.687121, -2.319654, -2.076801, 1, 0.3019608, 0, 1,
-1.682624, 0.2548387, 0.2063899, 1, 0.3058824, 0, 1,
-1.67787, -0.4294204, -1.295756, 1, 0.3137255, 0, 1,
-1.673789, -0.04107637, -1.840279, 1, 0.3176471, 0, 1,
-1.668442, -0.1448809, -1.905514, 1, 0.3254902, 0, 1,
-1.665054, 0.3261547, -1.113192, 1, 0.3294118, 0, 1,
-1.660848, 0.02951133, -2.749661, 1, 0.3372549, 0, 1,
-1.640392, -1.34653, -3.881946, 1, 0.3411765, 0, 1,
-1.63071, -0.3253399, -2.698088, 1, 0.3490196, 0, 1,
-1.6227, -0.9243137, -0.6635097, 1, 0.3529412, 0, 1,
-1.6058, -0.3530824, -2.408313, 1, 0.3607843, 0, 1,
-1.591813, 1.174913, -0.08027331, 1, 0.3647059, 0, 1,
-1.5853, 0.5374702, -0.1775825, 1, 0.372549, 0, 1,
-1.58065, -1.287257, -2.619694, 1, 0.3764706, 0, 1,
-1.574227, 0.2547491, -0.09354459, 1, 0.3843137, 0, 1,
-1.556946, 0.4669577, 0.4578353, 1, 0.3882353, 0, 1,
-1.53426, -0.1910727, -1.284773, 1, 0.3960784, 0, 1,
-1.520311, -1.070077, -2.211828, 1, 0.4039216, 0, 1,
-1.512335, 1.085863, -2.497357, 1, 0.4078431, 0, 1,
-1.495231, 0.3020704, -1.416922, 1, 0.4156863, 0, 1,
-1.494593, -2.387568, -1.906552, 1, 0.4196078, 0, 1,
-1.477055, -1.244614, -2.783579, 1, 0.427451, 0, 1,
-1.470079, 1.219639, 0.0236583, 1, 0.4313726, 0, 1,
-1.460924, -0.6565765, -0.2789317, 1, 0.4392157, 0, 1,
-1.458529, -0.1732356, -0.4214947, 1, 0.4431373, 0, 1,
-1.43877, 1.197605, -1.833519, 1, 0.4509804, 0, 1,
-1.426508, 0.08843927, -0.3927444, 1, 0.454902, 0, 1,
-1.402892, 0.3960935, -0.8805585, 1, 0.4627451, 0, 1,
-1.398767, 0.7558917, -0.4946937, 1, 0.4666667, 0, 1,
-1.39387, 0.5845644, -0.9048526, 1, 0.4745098, 0, 1,
-1.387267, 1.675521, -1.20936, 1, 0.4784314, 0, 1,
-1.382823, 2.277867, -1.438482, 1, 0.4862745, 0, 1,
-1.377617, -0.9090526, -3.138324, 1, 0.4901961, 0, 1,
-1.376595, 0.6066566, -2.739049, 1, 0.4980392, 0, 1,
-1.373058, -0.9451197, -2.959531, 1, 0.5058824, 0, 1,
-1.372997, 1.305184, -0.7561865, 1, 0.509804, 0, 1,
-1.370942, -0.8890029, -1.774967, 1, 0.5176471, 0, 1,
-1.366245, -1.417329, -2.402011, 1, 0.5215687, 0, 1,
-1.363826, -0.4403066, -1.728485, 1, 0.5294118, 0, 1,
-1.354868, 0.8092931, -0.8191749, 1, 0.5333334, 0, 1,
-1.352147, -1.114336, -2.570512, 1, 0.5411765, 0, 1,
-1.344166, 1.266536, -0.3829711, 1, 0.5450981, 0, 1,
-1.342441, -1.415356, -2.331251, 1, 0.5529412, 0, 1,
-1.338611, -0.1734271, -2.699697, 1, 0.5568628, 0, 1,
-1.337179, -1.403362, -1.381696, 1, 0.5647059, 0, 1,
-1.332025, 0.8242206, -2.771592, 1, 0.5686275, 0, 1,
-1.309297, 0.05622105, 0.0674476, 1, 0.5764706, 0, 1,
-1.302472, 1.591292, -0.1985869, 1, 0.5803922, 0, 1,
-1.286577, -0.4832277, -3.222768, 1, 0.5882353, 0, 1,
-1.2855, -0.9477178, -1.120382, 1, 0.5921569, 0, 1,
-1.276617, -0.1667372, -1.99686, 1, 0.6, 0, 1,
-1.269959, -1.746513, -3.498764, 1, 0.6078432, 0, 1,
-1.2641, 0.7640499, -2.823462, 1, 0.6117647, 0, 1,
-1.263021, -0.1796914, -3.043748, 1, 0.6196079, 0, 1,
-1.258588, 1.183921, -2.83212, 1, 0.6235294, 0, 1,
-1.249672, 0.7575872, -0.1466283, 1, 0.6313726, 0, 1,
-1.24948, -1.104882, -2.921136, 1, 0.6352941, 0, 1,
-1.248005, -0.5479981, -2.024474, 1, 0.6431373, 0, 1,
-1.237838, -1.953323, -3.989806, 1, 0.6470588, 0, 1,
-1.230956, 0.6554918, -1.645856, 1, 0.654902, 0, 1,
-1.225297, 1.584027, -0.7246702, 1, 0.6588235, 0, 1,
-1.220906, -0.3174517, -2.06431, 1, 0.6666667, 0, 1,
-1.217273, -1.721314, -1.947421, 1, 0.6705883, 0, 1,
-1.191121, -0.2876336, -2.288618, 1, 0.6784314, 0, 1,
-1.18243, 0.3298261, -1.934995, 1, 0.682353, 0, 1,
-1.164047, 1.547954, 0.02540369, 1, 0.6901961, 0, 1,
-1.152213, 0.08871472, -1.3014, 1, 0.6941177, 0, 1,
-1.137921, -0.9571276, -1.811666, 1, 0.7019608, 0, 1,
-1.137318, 1.189194, -0.8541946, 1, 0.7098039, 0, 1,
-1.136476, -0.8704555, -1.969173, 1, 0.7137255, 0, 1,
-1.134204, 0.5573394, -0.2614706, 1, 0.7215686, 0, 1,
-1.132532, -0.4291817, -1.990829, 1, 0.7254902, 0, 1,
-1.131814, -0.9580444, -1.725042, 1, 0.7333333, 0, 1,
-1.121915, -2.178652, -2.953083, 1, 0.7372549, 0, 1,
-1.119021, 1.450637, -1.786008, 1, 0.7450981, 0, 1,
-1.116762, -0.944071, -3.242846, 1, 0.7490196, 0, 1,
-1.114134, -0.3785409, 0.7039089, 1, 0.7568628, 0, 1,
-1.111119, 0.9450243, -1.482323, 1, 0.7607843, 0, 1,
-1.106134, 0.2725663, -1.980237, 1, 0.7686275, 0, 1,
-1.09789, 0.1942897, -1.620883, 1, 0.772549, 0, 1,
-1.097397, 0.6707402, -0.9573448, 1, 0.7803922, 0, 1,
-1.093601, 0.004439796, -1.808113, 1, 0.7843137, 0, 1,
-1.092607, -1.011719, -3.398325, 1, 0.7921569, 0, 1,
-1.092146, 0.7150568, -1.775832, 1, 0.7960784, 0, 1,
-1.085364, -0.4768252, -1.535068, 1, 0.8039216, 0, 1,
-1.081901, -0.04184187, -1.270043, 1, 0.8117647, 0, 1,
-1.079972, -1.121701, -0.5932301, 1, 0.8156863, 0, 1,
-1.064311, 0.8081195, -0.4451257, 1, 0.8235294, 0, 1,
-1.051147, 1.665234, -0.3798012, 1, 0.827451, 0, 1,
-1.048167, -1.640641, -3.383521, 1, 0.8352941, 0, 1,
-1.034286, 0.1042898, -2.891567, 1, 0.8392157, 0, 1,
-1.034117, -0.2462616, -2.919319, 1, 0.8470588, 0, 1,
-1.030309, -0.07018014, -2.203416, 1, 0.8509804, 0, 1,
-1.028387, -1.406144, -3.699466, 1, 0.8588235, 0, 1,
-1.028205, 1.007836, 0.5450484, 1, 0.8627451, 0, 1,
-1.025305, -0.524622, -1.224796, 1, 0.8705882, 0, 1,
-1.022286, -0.3093235, 0.393806, 1, 0.8745098, 0, 1,
-1.02166, 0.5504388, -2.548512, 1, 0.8823529, 0, 1,
-1.015629, 2.215612, 0.1124356, 1, 0.8862745, 0, 1,
-1.015401, -0.2323152, -2.425271, 1, 0.8941177, 0, 1,
-1.014756, -0.1276073, -1.47884, 1, 0.8980392, 0, 1,
-1.014744, -0.7607726, -2.373694, 1, 0.9058824, 0, 1,
-1.005331, 0.02650206, -1.901123, 1, 0.9137255, 0, 1,
-0.9995734, 0.2415535, -2.658315, 1, 0.9176471, 0, 1,
-0.9922645, 0.4298912, -0.7702577, 1, 0.9254902, 0, 1,
-0.9869919, 0.698545, -0.4237349, 1, 0.9294118, 0, 1,
-0.9853243, 0.4884982, -0.6971405, 1, 0.9372549, 0, 1,
-0.9845024, 0.5879608, -1.26166, 1, 0.9411765, 0, 1,
-0.9838884, 1.218176, 0.2753114, 1, 0.9490196, 0, 1,
-0.9768916, -0.881198, -1.505305, 1, 0.9529412, 0, 1,
-0.9752597, 1.80982, -0.003506422, 1, 0.9607843, 0, 1,
-0.9751616, 0.285574, 0.4146599, 1, 0.9647059, 0, 1,
-0.9696664, 0.2446598, -1.983278, 1, 0.972549, 0, 1,
-0.9666651, -1.408412, -1.367135, 1, 0.9764706, 0, 1,
-0.9595491, -1.158039, -4.537742, 1, 0.9843137, 0, 1,
-0.9580488, -1.863518, -3.048052, 1, 0.9882353, 0, 1,
-0.9529949, 0.8962992, -2.841197, 1, 0.9960784, 0, 1,
-0.9528764, -0.8270832, -2.405802, 0.9960784, 1, 0, 1,
-0.9518481, -0.8325437, -1.486223, 0.9921569, 1, 0, 1,
-0.9425484, -0.9680504, -3.413597, 0.9843137, 1, 0, 1,
-0.9417077, 0.2034163, -1.971192, 0.9803922, 1, 0, 1,
-0.9409847, -0.7020156, -1.945674, 0.972549, 1, 0, 1,
-0.9309385, 1.079996, 0.870647, 0.9686275, 1, 0, 1,
-0.9241513, -1.472257, -3.26386, 0.9607843, 1, 0, 1,
-0.920124, 0.8975894, -2.623807, 0.9568627, 1, 0, 1,
-0.9159544, 0.2737283, -1.2515, 0.9490196, 1, 0, 1,
-0.9150245, 1.290441, -0.7228359, 0.945098, 1, 0, 1,
-0.908597, 0.3025025, -1.90308, 0.9372549, 1, 0, 1,
-0.907813, 0.3773353, -2.053397, 0.9333333, 1, 0, 1,
-0.9063106, 0.4056464, -1.415722, 0.9254902, 1, 0, 1,
-0.8985466, 0.6808973, -0.3133477, 0.9215686, 1, 0, 1,
-0.8961407, -0.4943356, -1.90711, 0.9137255, 1, 0, 1,
-0.8888915, 1.334191, -0.8931174, 0.9098039, 1, 0, 1,
-0.8816357, 1.00512, -1.187876, 0.9019608, 1, 0, 1,
-0.8746548, 0.4551787, -1.101758, 0.8941177, 1, 0, 1,
-0.873512, -0.01558513, -3.106713, 0.8901961, 1, 0, 1,
-0.8705187, 0.2391995, -1.31281, 0.8823529, 1, 0, 1,
-0.8651651, -0.1965423, -2.378925, 0.8784314, 1, 0, 1,
-0.8617277, -0.2622186, -2.565531, 0.8705882, 1, 0, 1,
-0.860157, 1.440148, 0.3071373, 0.8666667, 1, 0, 1,
-0.8583103, -1.585303, -2.969589, 0.8588235, 1, 0, 1,
-0.8537726, -0.6723444, -0.492337, 0.854902, 1, 0, 1,
-0.8536983, -2.822383, -2.859801, 0.8470588, 1, 0, 1,
-0.8478667, -0.7481012, -2.507998, 0.8431373, 1, 0, 1,
-0.8456612, 1.543182, 1.040592, 0.8352941, 1, 0, 1,
-0.8417085, 0.2936233, -0.2747555, 0.8313726, 1, 0, 1,
-0.840773, -0.08101899, -1.797957, 0.8235294, 1, 0, 1,
-0.8372665, -2.084255, -2.446728, 0.8196079, 1, 0, 1,
-0.8232757, 1.258077, -1.80316, 0.8117647, 1, 0, 1,
-0.8224083, 1.317748, -0.8307353, 0.8078431, 1, 0, 1,
-0.8182218, -0.6135781, -1.910313, 0.8, 1, 0, 1,
-0.8116763, -0.06283361, -0.6371892, 0.7921569, 1, 0, 1,
-0.8098677, -1.310079, -1.246295, 0.7882353, 1, 0, 1,
-0.8026565, 1.278996, -0.8890136, 0.7803922, 1, 0, 1,
-0.8002234, -0.1260075, -1.221873, 0.7764706, 1, 0, 1,
-0.7978598, -0.4164208, 0.3793728, 0.7686275, 1, 0, 1,
-0.7931868, 0.1744014, -0.4759387, 0.7647059, 1, 0, 1,
-0.7883622, 0.6180801, 0.9787095, 0.7568628, 1, 0, 1,
-0.7875318, 0.584087, -1.136927, 0.7529412, 1, 0, 1,
-0.7852135, -0.5158882, -4.241291, 0.7450981, 1, 0, 1,
-0.7852076, -1.417551, -2.650961, 0.7411765, 1, 0, 1,
-0.7841377, 1.138331, -0.9501616, 0.7333333, 1, 0, 1,
-0.7836745, -0.2321143, -1.513255, 0.7294118, 1, 0, 1,
-0.7800807, 0.621336, 0.480919, 0.7215686, 1, 0, 1,
-0.7800344, -0.351339, -2.014451, 0.7176471, 1, 0, 1,
-0.7797996, 1.163306, -0.4478623, 0.7098039, 1, 0, 1,
-0.777227, 1.725965, -1.56894, 0.7058824, 1, 0, 1,
-0.7768918, -1.02229, -3.331085, 0.6980392, 1, 0, 1,
-0.7725579, 1.454909, -0.07126867, 0.6901961, 1, 0, 1,
-0.7688459, -0.3299906, -2.252401, 0.6862745, 1, 0, 1,
-0.7684882, 0.1552209, -2.184636, 0.6784314, 1, 0, 1,
-0.7677097, -0.9541658, -2.20066, 0.6745098, 1, 0, 1,
-0.7665669, 1.287332, 0.1182374, 0.6666667, 1, 0, 1,
-0.7656586, -1.254548, -4.488943, 0.6627451, 1, 0, 1,
-0.7605898, -0.3632431, -1.862103, 0.654902, 1, 0, 1,
-0.7603412, 0.1201813, -0.1614867, 0.6509804, 1, 0, 1,
-0.7573413, -0.6645935, -1.850294, 0.6431373, 1, 0, 1,
-0.7529291, -0.6946267, -3.185789, 0.6392157, 1, 0, 1,
-0.7500488, -0.7719304, -0.2960186, 0.6313726, 1, 0, 1,
-0.7493788, 0.5238727, -1.721401, 0.627451, 1, 0, 1,
-0.747681, -1.308088, -3.752716, 0.6196079, 1, 0, 1,
-0.7470679, 1.702563, -0.1009365, 0.6156863, 1, 0, 1,
-0.7469419, 0.3015445, -1.239418, 0.6078432, 1, 0, 1,
-0.7393801, 0.7239435, -2.085518, 0.6039216, 1, 0, 1,
-0.7393469, -0.1545162, -1.403048, 0.5960785, 1, 0, 1,
-0.7364649, -0.4050453, -2.467483, 0.5882353, 1, 0, 1,
-0.7333249, -1.322284, -1.996575, 0.5843138, 1, 0, 1,
-0.7302201, 0.7918512, -0.809239, 0.5764706, 1, 0, 1,
-0.7259312, 1.991346, -1.210342, 0.572549, 1, 0, 1,
-0.7115672, 0.8760344, 0.2269986, 0.5647059, 1, 0, 1,
-0.7052161, -1.203365, -4.29111, 0.5607843, 1, 0, 1,
-0.704951, 0.5338617, -0.125732, 0.5529412, 1, 0, 1,
-0.7027899, 0.3616142, -1.486299, 0.5490196, 1, 0, 1,
-0.7026688, 0.8638195, 0.5545845, 0.5411765, 1, 0, 1,
-0.6960763, -1.073026, -3.656027, 0.5372549, 1, 0, 1,
-0.6760259, 1.486648, -0.7789943, 0.5294118, 1, 0, 1,
-0.6738954, 1.059452, -0.4396378, 0.5254902, 1, 0, 1,
-0.673505, 1.945216, -0.05948195, 0.5176471, 1, 0, 1,
-0.6696543, -0.4715479, -2.641832, 0.5137255, 1, 0, 1,
-0.6691683, -0.06384058, -0.8055672, 0.5058824, 1, 0, 1,
-0.6681167, 0.4363342, -1.285791, 0.5019608, 1, 0, 1,
-0.6658376, 2.613125, 1.16967, 0.4941176, 1, 0, 1,
-0.6651943, 1.18558, -1.978193, 0.4862745, 1, 0, 1,
-0.6633809, -0.976514, -2.236975, 0.4823529, 1, 0, 1,
-0.6630129, -0.3993204, -2.577658, 0.4745098, 1, 0, 1,
-0.6622157, 0.7723945, -1.053544, 0.4705882, 1, 0, 1,
-0.6583706, -1.442728, -2.771133, 0.4627451, 1, 0, 1,
-0.6533613, 1.883513, -1.142072, 0.4588235, 1, 0, 1,
-0.6532632, -0.06727534, -0.9231508, 0.4509804, 1, 0, 1,
-0.6473497, -1.5926, -3.132436, 0.4470588, 1, 0, 1,
-0.6446084, 0.05108281, -1.03861, 0.4392157, 1, 0, 1,
-0.6348594, 0.3700229, 0.09005097, 0.4352941, 1, 0, 1,
-0.6343886, -1.642276, -2.474027, 0.427451, 1, 0, 1,
-0.6296955, 1.726636, 0.8183066, 0.4235294, 1, 0, 1,
-0.6286625, 0.1727, -0.6090892, 0.4156863, 1, 0, 1,
-0.6281292, 0.1540639, -1.459481, 0.4117647, 1, 0, 1,
-0.6210662, 0.9083402, -1.398346, 0.4039216, 1, 0, 1,
-0.6135326, -1.641845, -2.341504, 0.3960784, 1, 0, 1,
-0.6127018, -1.658033, -2.395594, 0.3921569, 1, 0, 1,
-0.6094794, 0.3522172, -2.245703, 0.3843137, 1, 0, 1,
-0.6086789, 1.847172, 0.1828142, 0.3803922, 1, 0, 1,
-0.6078867, 0.6464645, -0.8850675, 0.372549, 1, 0, 1,
-0.6026861, 0.5818359, -2.959759, 0.3686275, 1, 0, 1,
-0.6026514, 1.477391, -0.2972871, 0.3607843, 1, 0, 1,
-0.6002321, 0.3411466, -1.235363, 0.3568628, 1, 0, 1,
-0.5987642, 0.03434033, 0.0387664, 0.3490196, 1, 0, 1,
-0.5899687, 0.4883686, -0.1421572, 0.345098, 1, 0, 1,
-0.5864406, 1.01238, -0.6416274, 0.3372549, 1, 0, 1,
-0.5749736, 0.6126442, -1.530543, 0.3333333, 1, 0, 1,
-0.5699479, -1.30827, -3.317169, 0.3254902, 1, 0, 1,
-0.5659667, 0.5048851, -0.8546923, 0.3215686, 1, 0, 1,
-0.5647712, 0.2816857, -0.3588671, 0.3137255, 1, 0, 1,
-0.5626263, -0.04254228, -3.070756, 0.3098039, 1, 0, 1,
-0.5611812, -1.738213, -2.259084, 0.3019608, 1, 0, 1,
-0.5597583, -0.8712996, -2.398778, 0.2941177, 1, 0, 1,
-0.5568799, -2.109885, -2.582671, 0.2901961, 1, 0, 1,
-0.5515262, -0.8237115, -3.763736, 0.282353, 1, 0, 1,
-0.5510452, 0.2860464, -2.153872, 0.2784314, 1, 0, 1,
-0.5495194, 0.6907514, -1.060582, 0.2705882, 1, 0, 1,
-0.5425004, -0.3660092, -1.998826, 0.2666667, 1, 0, 1,
-0.5405226, 1.282357, 0.5215896, 0.2588235, 1, 0, 1,
-0.5355533, -1.887848, -3.186014, 0.254902, 1, 0, 1,
-0.5332057, 1.062354, -1.501315, 0.2470588, 1, 0, 1,
-0.5322514, -0.2298582, -2.069688, 0.2431373, 1, 0, 1,
-0.5290417, 0.5621718, -1.406415, 0.2352941, 1, 0, 1,
-0.5236401, 0.4665579, -0.4821679, 0.2313726, 1, 0, 1,
-0.5236351, 0.5571588, -0.9230839, 0.2235294, 1, 0, 1,
-0.5198454, -0.3748969, -2.354825, 0.2196078, 1, 0, 1,
-0.5184776, -1.152903, -1.145414, 0.2117647, 1, 0, 1,
-0.5171621, -0.4155062, -3.117962, 0.2078431, 1, 0, 1,
-0.5109654, 0.302941, -2.212128, 0.2, 1, 0, 1,
-0.5103695, -0.6580372, 0.3250393, 0.1921569, 1, 0, 1,
-0.5103638, 0.2851885, 0.07297113, 0.1882353, 1, 0, 1,
-0.5099007, 0.9783945, -0.8169516, 0.1803922, 1, 0, 1,
-0.5075775, -0.1088896, -2.264703, 0.1764706, 1, 0, 1,
-0.5069061, -0.4335884, -0.2086454, 0.1686275, 1, 0, 1,
-0.5068842, -1.919719, -0.4807327, 0.1647059, 1, 0, 1,
-0.504033, 0.8777551, -2.13183, 0.1568628, 1, 0, 1,
-0.5028669, -0.531076, -3.935358, 0.1529412, 1, 0, 1,
-0.4977656, 0.8216535, -1.813669, 0.145098, 1, 0, 1,
-0.4946016, 0.545029, -1.69766, 0.1411765, 1, 0, 1,
-0.4934145, 0.3514786, -0.1513612, 0.1333333, 1, 0, 1,
-0.4919533, -0.4031109, -1.580168, 0.1294118, 1, 0, 1,
-0.4849942, -0.955929, -2.25859, 0.1215686, 1, 0, 1,
-0.4773692, -1.704786, -3.357329, 0.1176471, 1, 0, 1,
-0.4770583, 0.03762598, -1.196613, 0.1098039, 1, 0, 1,
-0.4767746, 0.6807789, -0.9872025, 0.1058824, 1, 0, 1,
-0.4766634, -0.4062952, -2.093394, 0.09803922, 1, 0, 1,
-0.4676338, -0.05005435, -1.604735, 0.09019608, 1, 0, 1,
-0.4632637, 0.6443475, -0.6803629, 0.08627451, 1, 0, 1,
-0.4613698, -0.1008673, -1.368054, 0.07843138, 1, 0, 1,
-0.4585239, 1.776179, 1.050218, 0.07450981, 1, 0, 1,
-0.455718, -1.870823, -1.834791, 0.06666667, 1, 0, 1,
-0.4530616, 1.334623, -1.420524, 0.0627451, 1, 0, 1,
-0.4520611, -0.06880297, -1.034824, 0.05490196, 1, 0, 1,
-0.4519414, 2.196036, 0.7399179, 0.05098039, 1, 0, 1,
-0.451383, 0.4537316, 0.3391127, 0.04313726, 1, 0, 1,
-0.4505955, -0.2088213, -1.515508, 0.03921569, 1, 0, 1,
-0.4491133, -1.375006, -2.265245, 0.03137255, 1, 0, 1,
-0.4487116, -0.4225969, -3.413022, 0.02745098, 1, 0, 1,
-0.4432212, -0.7977594, -3.471937, 0.01960784, 1, 0, 1,
-0.4428755, -0.1011988, -0.98607, 0.01568628, 1, 0, 1,
-0.4378991, 1.372017, -1.756236, 0.007843138, 1, 0, 1,
-0.4335233, -0.1487984, -3.539154, 0.003921569, 1, 0, 1,
-0.4279703, 1.757608, -0.6091815, 0, 1, 0.003921569, 1,
-0.4261106, -0.2974408, -1.210727, 0, 1, 0.01176471, 1,
-0.4254401, -0.03892729, -1.712221, 0, 1, 0.01568628, 1,
-0.4214318, -1.270564, -0.4738696, 0, 1, 0.02352941, 1,
-0.4209752, -0.3100889, -1.360875, 0, 1, 0.02745098, 1,
-0.4184939, 0.2231427, 0.2174472, 0, 1, 0.03529412, 1,
-0.4150262, 0.3744832, 1.576185, 0, 1, 0.03921569, 1,
-0.4127329, 0.04166272, -3.234895, 0, 1, 0.04705882, 1,
-0.4122841, 1.02021, -1.477311, 0, 1, 0.05098039, 1,
-0.4078212, 0.01879334, -1.192003, 0, 1, 0.05882353, 1,
-0.4066732, -0.2017553, -0.8796467, 0, 1, 0.0627451, 1,
-0.4057297, 0.8105601, 1.569961, 0, 1, 0.07058824, 1,
-0.4029354, 0.4778298, 0.2759086, 0, 1, 0.07450981, 1,
-0.401351, -0.1714076, -2.478822, 0, 1, 0.08235294, 1,
-0.3947695, -1.359507, -2.574234, 0, 1, 0.08627451, 1,
-0.3937775, -0.5377858, -1.512277, 0, 1, 0.09411765, 1,
-0.3935756, 0.3297748, -0.2715703, 0, 1, 0.1019608, 1,
-0.3913386, -0.5879278, -3.255441, 0, 1, 0.1058824, 1,
-0.387716, 0.3535232, -2.65614, 0, 1, 0.1137255, 1,
-0.3868229, 0.5602006, 0.5139744, 0, 1, 0.1176471, 1,
-0.3842291, -1.067587, -2.663386, 0, 1, 0.1254902, 1,
-0.3810498, 1.897203, -0.9938115, 0, 1, 0.1294118, 1,
-0.3802127, 1.158721, -0.7543041, 0, 1, 0.1372549, 1,
-0.3769597, 1.175804, -0.6331725, 0, 1, 0.1411765, 1,
-0.3719136, -1.326547, -3.026383, 0, 1, 0.1490196, 1,
-0.3699714, 1.625902, 0.1625714, 0, 1, 0.1529412, 1,
-0.3699328, 0.2847351, -2.050345, 0, 1, 0.1607843, 1,
-0.3671401, 0.08298237, -0.1062045, 0, 1, 0.1647059, 1,
-0.3670162, -0.8894664, -2.93738, 0, 1, 0.172549, 1,
-0.3658717, -0.2753938, -4.099155, 0, 1, 0.1764706, 1,
-0.3658502, -0.5706305, -3.306534, 0, 1, 0.1843137, 1,
-0.36585, -0.13108, -3.65278, 0, 1, 0.1882353, 1,
-0.3654292, 1.081728, -1.105943, 0, 1, 0.1960784, 1,
-0.359191, 0.5911506, -1.551249, 0, 1, 0.2039216, 1,
-0.3516622, -1.013895, -3.332102, 0, 1, 0.2078431, 1,
-0.3494116, -0.1962934, -0.9649258, 0, 1, 0.2156863, 1,
-0.3409253, -0.8411412, -2.699671, 0, 1, 0.2196078, 1,
-0.3356731, 1.031874, 0.002600691, 0, 1, 0.227451, 1,
-0.330823, -0.1018753, -1.859004, 0, 1, 0.2313726, 1,
-0.3302271, -0.6322586, -2.462242, 0, 1, 0.2392157, 1,
-0.3261844, 0.2020232, -0.06364878, 0, 1, 0.2431373, 1,
-0.3260151, -1.771922, -2.914859, 0, 1, 0.2509804, 1,
-0.320132, -1.394124, -3.555694, 0, 1, 0.254902, 1,
-0.3199966, -1.145716, -2.775347, 0, 1, 0.2627451, 1,
-0.3176844, -0.6773124, -4.44617, 0, 1, 0.2666667, 1,
-0.3150387, 0.6976788, -0.1609177, 0, 1, 0.2745098, 1,
-0.312115, -0.6282102, -1.902437, 0, 1, 0.2784314, 1,
-0.3056095, -0.2616965, -0.4030771, 0, 1, 0.2862745, 1,
-0.3033495, -0.2616256, -1.539998, 0, 1, 0.2901961, 1,
-0.2905349, -0.1855352, -2.963859, 0, 1, 0.2980392, 1,
-0.290292, 1.208586, -1.182965, 0, 1, 0.3058824, 1,
-0.2899153, 1.793259, -0.09731688, 0, 1, 0.3098039, 1,
-0.2871721, 1.11532, 1.095152, 0, 1, 0.3176471, 1,
-0.284722, 0.5104758, 0.5975661, 0, 1, 0.3215686, 1,
-0.2836365, -1.605028, -1.892789, 0, 1, 0.3294118, 1,
-0.2834523, -1.408646, -2.855511, 0, 1, 0.3333333, 1,
-0.2816089, 1.399799, -0.6472135, 0, 1, 0.3411765, 1,
-0.2811568, -0.2055876, -1.926841, 0, 1, 0.345098, 1,
-0.2808963, 1.205083, -1.890895, 0, 1, 0.3529412, 1,
-0.2807726, 1.460873, -1.408404, 0, 1, 0.3568628, 1,
-0.2770078, 0.3769649, -0.3791421, 0, 1, 0.3647059, 1,
-0.2632549, -0.5598319, -3.886215, 0, 1, 0.3686275, 1,
-0.2630968, 1.288887, 1.214307, 0, 1, 0.3764706, 1,
-0.261689, -0.7603745, -4.270735, 0, 1, 0.3803922, 1,
-0.2612468, -0.1077843, -2.150733, 0, 1, 0.3882353, 1,
-0.2603266, -2.098272, -3.740789, 0, 1, 0.3921569, 1,
-0.2587488, -1.691451, -3.026011, 0, 1, 0.4, 1,
-0.2583135, 1.343361, -1.661664, 0, 1, 0.4078431, 1,
-0.256488, 0.3747797, -0.8886606, 0, 1, 0.4117647, 1,
-0.2495099, 0.0618311, -1.52603, 0, 1, 0.4196078, 1,
-0.2492321, -0.1334541, -3.699955, 0, 1, 0.4235294, 1,
-0.2488815, 0.4631903, -0.9840519, 0, 1, 0.4313726, 1,
-0.2472006, -2.643826, -3.598121, 0, 1, 0.4352941, 1,
-0.2469561, 1.231754, 0.0376408, 0, 1, 0.4431373, 1,
-0.2456992, 1.595749, -0.8138363, 0, 1, 0.4470588, 1,
-0.2408704, -0.1502748, -3.799802, 0, 1, 0.454902, 1,
-0.2390859, 0.647776, -1.092929, 0, 1, 0.4588235, 1,
-0.2326393, 1.227395, -0.6312528, 0, 1, 0.4666667, 1,
-0.2323199, -0.8799236, -1.512506, 0, 1, 0.4705882, 1,
-0.2307706, -0.1717845, -2.896032, 0, 1, 0.4784314, 1,
-0.228906, -0.5075877, -1.891092, 0, 1, 0.4823529, 1,
-0.2286861, 0.4559659, -1.395971, 0, 1, 0.4901961, 1,
-0.2280951, -1.415193, -3.092293, 0, 1, 0.4941176, 1,
-0.2272266, 0.2216948, -0.8980343, 0, 1, 0.5019608, 1,
-0.2264353, -0.9493086, -3.300773, 0, 1, 0.509804, 1,
-0.2255095, 0.2139706, -1.655249, 0, 1, 0.5137255, 1,
-0.2252924, 0.7217549, 0.0733171, 0, 1, 0.5215687, 1,
-0.2228202, -0.5593697, -0.8442308, 0, 1, 0.5254902, 1,
-0.2140569, -0.9229356, -4.21237, 0, 1, 0.5333334, 1,
-0.2117157, -0.9958382, -2.389051, 0, 1, 0.5372549, 1,
-0.2104964, 0.528186, -1.434866, 0, 1, 0.5450981, 1,
-0.2071045, -0.08675232, -1.541325, 0, 1, 0.5490196, 1,
-0.2034208, 1.078405, -1.264242, 0, 1, 0.5568628, 1,
-0.2033247, 0.4559895, -0.6941138, 0, 1, 0.5607843, 1,
-0.1951994, 0.4765702, -0.6528474, 0, 1, 0.5686275, 1,
-0.1942699, -0.6331356, -3.41615, 0, 1, 0.572549, 1,
-0.1937527, -0.0110761, -0.0832447, 0, 1, 0.5803922, 1,
-0.1867658, 0.4915284, -0.618068, 0, 1, 0.5843138, 1,
-0.1864061, -0.8459836, -1.854346, 0, 1, 0.5921569, 1,
-0.1851368, -0.9631743, -2.294978, 0, 1, 0.5960785, 1,
-0.180461, -2.621439, -3.509662, 0, 1, 0.6039216, 1,
-0.1769623, -0.3819374, -3.848317, 0, 1, 0.6117647, 1,
-0.1763723, 0.8224043, 0.3690112, 0, 1, 0.6156863, 1,
-0.1754548, 0.5954891, 0.4423612, 0, 1, 0.6235294, 1,
-0.1716101, 0.2983746, -1.402966, 0, 1, 0.627451, 1,
-0.170016, 1.168245, 0.05035802, 0, 1, 0.6352941, 1,
-0.1664672, -2.055955, -4.833963, 0, 1, 0.6392157, 1,
-0.1636059, -1.290155, -3.553969, 0, 1, 0.6470588, 1,
-0.1621502, -0.3812685, -4.899415, 0, 1, 0.6509804, 1,
-0.1621062, 0.3224392, 0.2433581, 0, 1, 0.6588235, 1,
-0.1611179, -0.1863138, -2.786323, 0, 1, 0.6627451, 1,
-0.1602258, 0.2933066, 0.6953612, 0, 1, 0.6705883, 1,
-0.1587278, -0.3622482, -4.024422, 0, 1, 0.6745098, 1,
-0.1567635, -1.921224, -3.02772, 0, 1, 0.682353, 1,
-0.1548338, -0.6416642, -2.769377, 0, 1, 0.6862745, 1,
-0.150898, -0.8605486, -2.069397, 0, 1, 0.6941177, 1,
-0.1506376, 2.711131, 1.436409, 0, 1, 0.7019608, 1,
-0.1506364, 0.9355311, -0.8330455, 0, 1, 0.7058824, 1,
-0.1496513, 2.054287, 1.225111, 0, 1, 0.7137255, 1,
-0.149367, 0.005341395, -3.305556, 0, 1, 0.7176471, 1,
-0.145177, -2.064826, -3.096356, 0, 1, 0.7254902, 1,
-0.1436841, -0.1055958, -0.9499996, 0, 1, 0.7294118, 1,
-0.1417852, 1.459736, 1.021663, 0, 1, 0.7372549, 1,
-0.141128, -0.8471296, -3.569131, 0, 1, 0.7411765, 1,
-0.1356669, 0.8556694, 0.4213116, 0, 1, 0.7490196, 1,
-0.1307253, 0.5937459, 1.133929, 0, 1, 0.7529412, 1,
-0.1183747, 0.9289014, -0.1133961, 0, 1, 0.7607843, 1,
-0.1170913, 1.236917, -1.653198, 0, 1, 0.7647059, 1,
-0.1051065, -0.5325424, -1.926771, 0, 1, 0.772549, 1,
-0.1042544, -2.246202, -1.810628, 0, 1, 0.7764706, 1,
-0.1013555, 2.335098, -0.08776952, 0, 1, 0.7843137, 1,
-0.1006904, -0.376013, -5.369556, 0, 1, 0.7882353, 1,
-0.09888218, -0.4128571, -3.482158, 0, 1, 0.7960784, 1,
-0.09421464, 2.12225, 0.8758572, 0, 1, 0.8039216, 1,
-0.09386137, 1.112041, -1.010303, 0, 1, 0.8078431, 1,
-0.09368165, -0.2892625, -2.026991, 0, 1, 0.8156863, 1,
-0.09010546, -0.09342121, -2.187183, 0, 1, 0.8196079, 1,
-0.08859952, 1.154153, -0.4144427, 0, 1, 0.827451, 1,
-0.08820935, -0.5841104, -5.009026, 0, 1, 0.8313726, 1,
-0.0863406, 0.229886, -2.310291, 0, 1, 0.8392157, 1,
-0.08365761, -0.6424413, -3.773854, 0, 1, 0.8431373, 1,
-0.08182578, 0.8553004, 0.2315549, 0, 1, 0.8509804, 1,
-0.08153931, -1.875431, -4.69593, 0, 1, 0.854902, 1,
-0.06977008, -0.6111116, -2.730194, 0, 1, 0.8627451, 1,
-0.06604838, 0.1704571, 0.370297, 0, 1, 0.8666667, 1,
-0.06355201, 2.602385, -0.5367978, 0, 1, 0.8745098, 1,
-0.0632702, 0.3667426, 1.969612, 0, 1, 0.8784314, 1,
-0.06203662, 1.533204, 0.8869085, 0, 1, 0.8862745, 1,
-0.06171994, 0.2951223, -2.27101, 0, 1, 0.8901961, 1,
-0.06091412, 0.6936936, -1.117685, 0, 1, 0.8980392, 1,
-0.05537394, 1.188739, -0.9985838, 0, 1, 0.9058824, 1,
-0.05154853, -0.05309047, -2.804065, 0, 1, 0.9098039, 1,
-0.04949524, -0.6286302, -2.440833, 0, 1, 0.9176471, 1,
-0.0493315, 0.3178482, 0.4781244, 0, 1, 0.9215686, 1,
-0.04718752, 0.1016438, -1.078684, 0, 1, 0.9294118, 1,
-0.04524508, 0.4733034, 0.1352271, 0, 1, 0.9333333, 1,
-0.04151043, -1.832862, -3.423888, 0, 1, 0.9411765, 1,
-0.04149286, 0.07897288, -2.877894, 0, 1, 0.945098, 1,
-0.04043152, 0.1492649, -0.6431592, 0, 1, 0.9529412, 1,
-0.03444982, 1.776191, 0.8624477, 0, 1, 0.9568627, 1,
-0.03395442, -0.09053496, -3.070346, 0, 1, 0.9647059, 1,
-0.02213394, -0.6542799, -1.755551, 0, 1, 0.9686275, 1,
-0.01952243, 0.02376058, 0.09572156, 0, 1, 0.9764706, 1,
-0.01933845, 0.3844349, 1.668681, 0, 1, 0.9803922, 1,
-0.01688746, -1.136011, -3.664614, 0, 1, 0.9882353, 1,
-0.0165468, -1.46837, -2.055467, 0, 1, 0.9921569, 1,
-0.01512996, -1.08015, -3.700041, 0, 1, 1, 1,
-0.006789833, -1.181296, -3.485829, 0, 0.9921569, 1, 1,
-0.005726987, 0.6347792, -0.4040626, 0, 0.9882353, 1, 1,
0.007587725, 1.786868, -0.642041, 0, 0.9803922, 1, 1,
0.01018492, -1.263126, 3.183063, 0, 0.9764706, 1, 1,
0.01100023, 0.5315319, -1.424452, 0, 0.9686275, 1, 1,
0.01185367, 1.397491, -1.066808, 0, 0.9647059, 1, 1,
0.01446144, 0.2115638, -0.5031863, 0, 0.9568627, 1, 1,
0.02298028, 1.521846, 1.779387, 0, 0.9529412, 1, 1,
0.0230492, -0.1687238, 1.39169, 0, 0.945098, 1, 1,
0.023698, 0.7880146, 1.08615, 0, 0.9411765, 1, 1,
0.02634444, 0.1048473, -0.6279884, 0, 0.9333333, 1, 1,
0.03028425, -0.1156957, 2.508753, 0, 0.9294118, 1, 1,
0.03255799, -0.7721165, 4.228002, 0, 0.9215686, 1, 1,
0.03423749, 1.310406, 0.04237279, 0, 0.9176471, 1, 1,
0.03791547, -0.4344389, 4.228952, 0, 0.9098039, 1, 1,
0.04275712, -0.156541, 2.121123, 0, 0.9058824, 1, 1,
0.04406915, -0.9617327, 1.939895, 0, 0.8980392, 1, 1,
0.04430452, -1.107583, 1.986424, 0, 0.8901961, 1, 1,
0.0447657, 0.5782956, -1.216049, 0, 0.8862745, 1, 1,
0.05171523, -0.6601092, 4.19032, 0, 0.8784314, 1, 1,
0.05904901, 0.8139272, -0.3453086, 0, 0.8745098, 1, 1,
0.06101019, 0.9097728, 1.634778, 0, 0.8666667, 1, 1,
0.06410004, 0.6558642, 0.3845212, 0, 0.8627451, 1, 1,
0.06505924, -1.419257, 2.273908, 0, 0.854902, 1, 1,
0.06550834, 1.774623, -1.621777, 0, 0.8509804, 1, 1,
0.06568451, 1.509893, 0.6293933, 0, 0.8431373, 1, 1,
0.06620523, -0.5385131, 2.170575, 0, 0.8392157, 1, 1,
0.06739096, 0.4262602, 3.339065, 0, 0.8313726, 1, 1,
0.07134453, 0.7725126, -1.532312, 0, 0.827451, 1, 1,
0.07352547, 0.09429989, 0.7329008, 0, 0.8196079, 1, 1,
0.07865643, 0.215866, 1.163994, 0, 0.8156863, 1, 1,
0.07944372, 0.21098, 0.006562328, 0, 0.8078431, 1, 1,
0.07945489, 2.840997, 1.134109, 0, 0.8039216, 1, 1,
0.07955916, 0.08894207, 1.300485, 0, 0.7960784, 1, 1,
0.08124877, 1.623739, 0.4858654, 0, 0.7882353, 1, 1,
0.08866399, 0.1361929, 2.126626, 0, 0.7843137, 1, 1,
0.0921361, -0.4850791, 4.543541, 0, 0.7764706, 1, 1,
0.09278177, 1.642742, -1.069005, 0, 0.772549, 1, 1,
0.09282281, -0.4030938, 3.775804, 0, 0.7647059, 1, 1,
0.09477792, -0.4179952, 2.976027, 0, 0.7607843, 1, 1,
0.09601233, -0.3085966, 2.428368, 0, 0.7529412, 1, 1,
0.09845479, 0.3511222, 0.1310996, 0, 0.7490196, 1, 1,
0.1020618, -0.9527445, 2.654169, 0, 0.7411765, 1, 1,
0.1025982, 0.5883887, -0.6032083, 0, 0.7372549, 1, 1,
0.1067252, -0.5421445, 3.959056, 0, 0.7294118, 1, 1,
0.1081963, 1.118218, -0.9295648, 0, 0.7254902, 1, 1,
0.108971, -0.1673509, 1.520978, 0, 0.7176471, 1, 1,
0.1099981, -1.831038, 3.153501, 0, 0.7137255, 1, 1,
0.1102188, 0.8190596, -1.461345, 0, 0.7058824, 1, 1,
0.1179856, -1.081186, -0.2312156, 0, 0.6980392, 1, 1,
0.1215866, 1.178612, -0.9594663, 0, 0.6941177, 1, 1,
0.1238862, -1.402192, 3.11563, 0, 0.6862745, 1, 1,
0.1239981, -0.7975165, 2.942244, 0, 0.682353, 1, 1,
0.1267539, -0.7190877, 2.4003, 0, 0.6745098, 1, 1,
0.1280923, 1.117601, 0.8546059, 0, 0.6705883, 1, 1,
0.1300637, 0.22057, 1.544385, 0, 0.6627451, 1, 1,
0.1332549, -0.2034367, 2.255466, 0, 0.6588235, 1, 1,
0.1341093, -0.003083163, 1.195794, 0, 0.6509804, 1, 1,
0.1341172, 0.1480941, 0.8224664, 0, 0.6470588, 1, 1,
0.1342405, 1.101675, 1.481616, 0, 0.6392157, 1, 1,
0.1406185, 1.013424, 0.4812685, 0, 0.6352941, 1, 1,
0.1408447, -0.2687893, 1.617598, 0, 0.627451, 1, 1,
0.1411446, 0.6083531, 0.1690311, 0, 0.6235294, 1, 1,
0.1446963, 0.4863843, -0.6057206, 0, 0.6156863, 1, 1,
0.1447086, 2.468071, -0.5809494, 0, 0.6117647, 1, 1,
0.1490244, -1.638692, 3.445268, 0, 0.6039216, 1, 1,
0.1514644, 0.2661233, -0.3369643, 0, 0.5960785, 1, 1,
0.153565, 0.3515807, -0.03205751, 0, 0.5921569, 1, 1,
0.1551534, 0.3056852, 1.356798, 0, 0.5843138, 1, 1,
0.1553265, 0.9161249, 0.6696511, 0, 0.5803922, 1, 1,
0.1596775, 0.6275401, 0.2780562, 0, 0.572549, 1, 1,
0.1606356, -0.7428225, 2.35101, 0, 0.5686275, 1, 1,
0.1629116, -0.8626888, 2.073633, 0, 0.5607843, 1, 1,
0.163185, -0.255032, 3.571383, 0, 0.5568628, 1, 1,
0.168993, -1.502965, 3.462574, 0, 0.5490196, 1, 1,
0.1696569, -0.465634, 3.75321, 0, 0.5450981, 1, 1,
0.1713329, -0.08040456, 2.034456, 0, 0.5372549, 1, 1,
0.1716852, 1.031922, 0.8301048, 0, 0.5333334, 1, 1,
0.1725674, -0.2530802, 3.546145, 0, 0.5254902, 1, 1,
0.1775278, -1.197856, 2.644894, 0, 0.5215687, 1, 1,
0.1781276, -1.235054, 4.10643, 0, 0.5137255, 1, 1,
0.1860259, -1.263415, 2.814292, 0, 0.509804, 1, 1,
0.1877249, 0.04898988, 1.494736, 0, 0.5019608, 1, 1,
0.1898936, 1.35088, 1.44825, 0, 0.4941176, 1, 1,
0.1902526, 0.1311641, 1.656343, 0, 0.4901961, 1, 1,
0.1922474, 0.2909412, 1.672477, 0, 0.4823529, 1, 1,
0.1939346, -0.2803848, 3.816788, 0, 0.4784314, 1, 1,
0.1942619, 0.5595812, -0.6114955, 0, 0.4705882, 1, 1,
0.1996924, 0.4940616, 1.867782, 0, 0.4666667, 1, 1,
0.2013782, -1.057436, 3.65711, 0, 0.4588235, 1, 1,
0.2043166, -0.4638158, 2.497061, 0, 0.454902, 1, 1,
0.2082061, -0.7291244, 0.9786623, 0, 0.4470588, 1, 1,
0.2090014, -0.09071452, 2.27645, 0, 0.4431373, 1, 1,
0.2099668, 0.9362031, -0.3638795, 0, 0.4352941, 1, 1,
0.2115189, -0.8651048, 2.179855, 0, 0.4313726, 1, 1,
0.214422, 0.8405657, 0.288472, 0, 0.4235294, 1, 1,
0.220358, 2.757341, 1.119807, 0, 0.4196078, 1, 1,
0.2246578, -0.4917916, 2.009183, 0, 0.4117647, 1, 1,
0.2268817, 0.6084368, 2.538314, 0, 0.4078431, 1, 1,
0.227232, 0.6037597, 1.81365, 0, 0.4, 1, 1,
0.2286737, 0.5169913, 2.118242, 0, 0.3921569, 1, 1,
0.2358446, 0.6343278, 0.5091293, 0, 0.3882353, 1, 1,
0.2378743, 2.097657, 0.6251668, 0, 0.3803922, 1, 1,
0.2404547, 0.7449363, -0.1914837, 0, 0.3764706, 1, 1,
0.2426233, -0.7597737, 2.057504, 0, 0.3686275, 1, 1,
0.2484645, 1.016579, -1.667995, 0, 0.3647059, 1, 1,
0.2500453, -2.202325, 3.355343, 0, 0.3568628, 1, 1,
0.2515164, -1.057813, 3.344178, 0, 0.3529412, 1, 1,
0.2537377, 1.198055, 0.3333497, 0, 0.345098, 1, 1,
0.254761, 1.885899, 2.002037, 0, 0.3411765, 1, 1,
0.255342, -0.5420525, 1.469831, 0, 0.3333333, 1, 1,
0.257584, 0.002672444, 0.6088887, 0, 0.3294118, 1, 1,
0.2641017, 0.02057019, -0.5937663, 0, 0.3215686, 1, 1,
0.2675438, -0.4528261, 3.768442, 0, 0.3176471, 1, 1,
0.2722401, -0.2071654, 0.4156172, 0, 0.3098039, 1, 1,
0.2743285, 1.169006, -0.7189507, 0, 0.3058824, 1, 1,
0.2793385, 0.8943713, 2.154259, 0, 0.2980392, 1, 1,
0.2824014, 0.1555624, 1.425851, 0, 0.2901961, 1, 1,
0.2830363, 1.516335, -1.208493, 0, 0.2862745, 1, 1,
0.2836899, 0.193547, 0.8664669, 0, 0.2784314, 1, 1,
0.2863815, 0.6282517, 0.292772, 0, 0.2745098, 1, 1,
0.2896504, -1.100615, 3.080617, 0, 0.2666667, 1, 1,
0.2963575, -2.360597, 3.878783, 0, 0.2627451, 1, 1,
0.2984983, -0.2729135, 2.405561, 0, 0.254902, 1, 1,
0.300859, -0.2934225, 2.206462, 0, 0.2509804, 1, 1,
0.3013897, -1.059977, 4.017199, 0, 0.2431373, 1, 1,
0.3016573, 1.467736, 0.9897459, 0, 0.2392157, 1, 1,
0.3142633, 0.395302, -0.1311673, 0, 0.2313726, 1, 1,
0.3163086, 1.007221, 0.5951944, 0, 0.227451, 1, 1,
0.3218673, -0.8853251, 3.272917, 0, 0.2196078, 1, 1,
0.3251258, -0.07873827, 1.927015, 0, 0.2156863, 1, 1,
0.3301775, 0.4141433, -0.3922873, 0, 0.2078431, 1, 1,
0.3316579, -0.2552729, 2.614177, 0, 0.2039216, 1, 1,
0.3343028, 0.7815756, 0.3165378, 0, 0.1960784, 1, 1,
0.3349043, 0.5313388, -0.3549868, 0, 0.1882353, 1, 1,
0.3399786, 0.5574341, 0.3327705, 0, 0.1843137, 1, 1,
0.340462, 0.4323696, 0.3048137, 0, 0.1764706, 1, 1,
0.3411143, 0.7049227, 0.8773777, 0, 0.172549, 1, 1,
0.3460625, -0.2781406, 3.292004, 0, 0.1647059, 1, 1,
0.3475301, -1.596778, 0.8805056, 0, 0.1607843, 1, 1,
0.3536666, 1.309355, -0.4443929, 0, 0.1529412, 1, 1,
0.3592947, -1.315053, 2.095255, 0, 0.1490196, 1, 1,
0.3642497, 0.6894827, 0.6048489, 0, 0.1411765, 1, 1,
0.3681134, 0.2467667, 0.8475869, 0, 0.1372549, 1, 1,
0.3717208, 0.1695064, 2.359571, 0, 0.1294118, 1, 1,
0.372054, -0.2041539, 1.022063, 0, 0.1254902, 1, 1,
0.3788201, -0.08464772, 1.945799, 0, 0.1176471, 1, 1,
0.3809315, 0.2343584, 0.7897879, 0, 0.1137255, 1, 1,
0.3811559, -1.712723, 2.550663, 0, 0.1058824, 1, 1,
0.3894717, -1.400493, 3.653445, 0, 0.09803922, 1, 1,
0.3906351, 0.7943194, 1.205764, 0, 0.09411765, 1, 1,
0.3907582, 1.56227, 1.767337, 0, 0.08627451, 1, 1,
0.3941253, 0.8807986, 1.338596, 0, 0.08235294, 1, 1,
0.3950206, -1.362182, 2.97472, 0, 0.07450981, 1, 1,
0.3963131, -1.399176, 3.746625, 0, 0.07058824, 1, 1,
0.4001865, 2.112914, 0.01739607, 0, 0.0627451, 1, 1,
0.4018562, -0.2266543, 2.753647, 0, 0.05882353, 1, 1,
0.4091155, -1.555418, 3.677099, 0, 0.05098039, 1, 1,
0.4096598, -0.04182037, 0.9131568, 0, 0.04705882, 1, 1,
0.4098005, 0.7570485, 0.8979982, 0, 0.03921569, 1, 1,
0.4116945, 0.5074983, 0.5705292, 0, 0.03529412, 1, 1,
0.4138492, -0.8641582, 3.26474, 0, 0.02745098, 1, 1,
0.4161533, 0.6552483, 1.110176, 0, 0.02352941, 1, 1,
0.4165633, -2.130838, 4.105991, 0, 0.01568628, 1, 1,
0.4199629, 0.6591569, 0.609624, 0, 0.01176471, 1, 1,
0.4308929, -0.05438306, 0.3878666, 0, 0.003921569, 1, 1,
0.4318149, -0.5766553, 4.402343, 0.003921569, 0, 1, 1,
0.4375156, 0.3036954, -0.03234684, 0.007843138, 0, 1, 1,
0.4406456, -0.8469695, 2.126134, 0.01568628, 0, 1, 1,
0.442093, -0.07872728, 0.7679676, 0.01960784, 0, 1, 1,
0.4459484, 1.493028, 0.0411649, 0.02745098, 0, 1, 1,
0.4547283, 1.046959, 1.776557, 0.03137255, 0, 1, 1,
0.4555929, 0.1819377, 2.215611, 0.03921569, 0, 1, 1,
0.4630375, -0.4272772, 2.209823, 0.04313726, 0, 1, 1,
0.4669758, -0.8640404, 2.373629, 0.05098039, 0, 1, 1,
0.4677759, 0.8041166, -0.1974138, 0.05490196, 0, 1, 1,
0.4707031, 0.4609824, 1.333777, 0.0627451, 0, 1, 1,
0.475994, 1.06108, 0.3268852, 0.06666667, 0, 1, 1,
0.4775684, -1.124888, 4.400053, 0.07450981, 0, 1, 1,
0.481189, 0.1599494, 1.963081, 0.07843138, 0, 1, 1,
0.4828259, 0.9274049, 0.222589, 0.08627451, 0, 1, 1,
0.4840029, -0.8795852, 3.211604, 0.09019608, 0, 1, 1,
0.4840034, 0.1841928, 2.083644, 0.09803922, 0, 1, 1,
0.4843618, -0.1167829, 1.965662, 0.1058824, 0, 1, 1,
0.4902526, 0.9779549, -0.4351572, 0.1098039, 0, 1, 1,
0.4941723, -0.2944414, 1.73038, 0.1176471, 0, 1, 1,
0.4975719, 0.3664639, 1.232414, 0.1215686, 0, 1, 1,
0.507578, -0.8631339, 2.846928, 0.1294118, 0, 1, 1,
0.5075997, -0.6701243, 3.741574, 0.1333333, 0, 1, 1,
0.511588, 0.6553901, 1.509718, 0.1411765, 0, 1, 1,
0.5144975, 0.09315203, 0.9308335, 0.145098, 0, 1, 1,
0.5180111, 0.2846975, 1.265227, 0.1529412, 0, 1, 1,
0.520336, 1.165514, -0.3395989, 0.1568628, 0, 1, 1,
0.524434, -0.07325713, 2.219046, 0.1647059, 0, 1, 1,
0.5289235, 1.601488, 1.77439, 0.1686275, 0, 1, 1,
0.5291213, 0.812273, 0.7977543, 0.1764706, 0, 1, 1,
0.5352326, -1.461814, 3.275155, 0.1803922, 0, 1, 1,
0.5352954, 2.29518, 0.6168845, 0.1882353, 0, 1, 1,
0.5353993, 2.375795, 0.1218384, 0.1921569, 0, 1, 1,
0.5357207, -2.192861, 2.168083, 0.2, 0, 1, 1,
0.537509, -0.6648741, 4.040154, 0.2078431, 0, 1, 1,
0.5517466, -0.09776028, 2.811878, 0.2117647, 0, 1, 1,
0.553166, 0.730541, -0.0628801, 0.2196078, 0, 1, 1,
0.5539747, -0.5895511, 1.336929, 0.2235294, 0, 1, 1,
0.5594102, 0.01873893, -0.3600465, 0.2313726, 0, 1, 1,
0.565243, -0.330009, 2.819366, 0.2352941, 0, 1, 1,
0.5655035, -0.2437474, 2.961046, 0.2431373, 0, 1, 1,
0.5683857, 0.3625324, -0.08843763, 0.2470588, 0, 1, 1,
0.5798193, 0.9142997, 1.286842, 0.254902, 0, 1, 1,
0.5822747, -0.1573411, 2.40932, 0.2588235, 0, 1, 1,
0.582446, 0.9542412, 1.921272, 0.2666667, 0, 1, 1,
0.5848832, -0.9919901, 1.900573, 0.2705882, 0, 1, 1,
0.5867547, -0.5957857, 3.0478, 0.2784314, 0, 1, 1,
0.5876234, -0.3487194, 1.176258, 0.282353, 0, 1, 1,
0.5902989, -0.01486567, 1.111679, 0.2901961, 0, 1, 1,
0.5908561, 1.660619, 0.6412088, 0.2941177, 0, 1, 1,
0.5923331, -0.8153986, 2.429494, 0.3019608, 0, 1, 1,
0.5966885, 0.4157804, 1.328101, 0.3098039, 0, 1, 1,
0.6079122, 1.097122, 1.293107, 0.3137255, 0, 1, 1,
0.6158819, -0.9142366, 3.707222, 0.3215686, 0, 1, 1,
0.6293498, -0.07936029, 0.816677, 0.3254902, 0, 1, 1,
0.6303075, 0.2308756, 0.815909, 0.3333333, 0, 1, 1,
0.6403778, 0.5601531, 0.3299399, 0.3372549, 0, 1, 1,
0.6496385, -1.439005, 3.622852, 0.345098, 0, 1, 1,
0.6506842, 1.085652, 2.258025, 0.3490196, 0, 1, 1,
0.6520782, 0.564517, 1.502099, 0.3568628, 0, 1, 1,
0.6545506, 1.836388, -0.5391511, 0.3607843, 0, 1, 1,
0.6552286, -0.4863979, 2.981538, 0.3686275, 0, 1, 1,
0.6691849, -1.291169, 2.629318, 0.372549, 0, 1, 1,
0.6747742, -0.110353, 2.475254, 0.3803922, 0, 1, 1,
0.6755275, 0.03946074, -0.8754033, 0.3843137, 0, 1, 1,
0.6771765, -0.3695064, 3.032512, 0.3921569, 0, 1, 1,
0.6786454, 0.4482689, 0.9324186, 0.3960784, 0, 1, 1,
0.6892133, 0.5424153, 0.4279466, 0.4039216, 0, 1, 1,
0.6910973, 1.03002, 0.6262143, 0.4117647, 0, 1, 1,
0.7007406, -0.4358768, 1.395014, 0.4156863, 0, 1, 1,
0.7027109, -0.01213244, 0.8479609, 0.4235294, 0, 1, 1,
0.7037011, -0.3477568, 0.7799727, 0.427451, 0, 1, 1,
0.7053171, -1.445416, 3.805415, 0.4352941, 0, 1, 1,
0.7108331, 0.7949401, 1.349777, 0.4392157, 0, 1, 1,
0.7140569, 1.241901, 1.27497, 0.4470588, 0, 1, 1,
0.7164686, 0.1698363, 0.3796625, 0.4509804, 0, 1, 1,
0.7180951, 0.04195422, 1.429178, 0.4588235, 0, 1, 1,
0.7199036, -0.5789573, 2.626528, 0.4627451, 0, 1, 1,
0.7215295, 0.343021, 0.5482678, 0.4705882, 0, 1, 1,
0.7240621, -0.3145029, 2.268582, 0.4745098, 0, 1, 1,
0.7248986, 1.121141, 1.002913, 0.4823529, 0, 1, 1,
0.7254732, -2.261284, 2.423377, 0.4862745, 0, 1, 1,
0.7269259, 0.7790148, 0.9412426, 0.4941176, 0, 1, 1,
0.7284846, 1.696715, 1.624091, 0.5019608, 0, 1, 1,
0.7296025, 0.3020224, 1.8549, 0.5058824, 0, 1, 1,
0.7301465, 0.5694799, 0.9729642, 0.5137255, 0, 1, 1,
0.7326451, 0.7485411, 1.780992, 0.5176471, 0, 1, 1,
0.7390683, -1.12008, 2.635913, 0.5254902, 0, 1, 1,
0.7403407, 0.760742, 1.169654, 0.5294118, 0, 1, 1,
0.741671, -2.285378, 2.510313, 0.5372549, 0, 1, 1,
0.7460239, -0.1286113, 0.2350969, 0.5411765, 0, 1, 1,
0.7528572, 0.1142978, 0.8632183, 0.5490196, 0, 1, 1,
0.7543231, 0.9179319, 0.8851333, 0.5529412, 0, 1, 1,
0.7558451, -0.2169076, 1.342439, 0.5607843, 0, 1, 1,
0.7575143, 0.4399911, 0.9580845, 0.5647059, 0, 1, 1,
0.7587416, 1.034006, 0.2539567, 0.572549, 0, 1, 1,
0.7678612, 0.2113982, -0.5852491, 0.5764706, 0, 1, 1,
0.7719764, -0.6286069, 2.301922, 0.5843138, 0, 1, 1,
0.7735412, 0.04974689, 0.5700285, 0.5882353, 0, 1, 1,
0.7741921, -0.3554022, 2.306992, 0.5960785, 0, 1, 1,
0.7826104, 0.8335497, 1.673132, 0.6039216, 0, 1, 1,
0.789414, -1.294887, 3.882221, 0.6078432, 0, 1, 1,
0.793053, -1.271868, 3.070323, 0.6156863, 0, 1, 1,
0.7931625, -1.833069, 3.086551, 0.6196079, 0, 1, 1,
0.8004749, -0.5012877, 3.147998, 0.627451, 0, 1, 1,
0.8041204, 0.9106655, 0.664299, 0.6313726, 0, 1, 1,
0.8062726, 0.9882102, 0.198655, 0.6392157, 0, 1, 1,
0.8072784, 0.7989131, 0.7024041, 0.6431373, 0, 1, 1,
0.8093315, -1.466099, 0.1108569, 0.6509804, 0, 1, 1,
0.8102126, -0.4095201, 2.463836, 0.654902, 0, 1, 1,
0.8231575, -0.8019301, 2.519986, 0.6627451, 0, 1, 1,
0.8261504, 1.930637, 0.7422376, 0.6666667, 0, 1, 1,
0.8277802, 0.9526054, -0.6140377, 0.6745098, 0, 1, 1,
0.829783, -0.480604, 2.875185, 0.6784314, 0, 1, 1,
0.8312107, 1.275846, 1.794683, 0.6862745, 0, 1, 1,
0.8319181, 0.09841238, 1.939192, 0.6901961, 0, 1, 1,
0.8334714, -0.9431976, 1.46787, 0.6980392, 0, 1, 1,
0.8345596, -0.6709492, 4.232817, 0.7058824, 0, 1, 1,
0.8359898, -0.9388514, 2.566745, 0.7098039, 0, 1, 1,
0.8374171, -0.4301859, 0.9757197, 0.7176471, 0, 1, 1,
0.8381558, -0.3881288, 1.51187, 0.7215686, 0, 1, 1,
0.8386456, 0.1897532, 0.7328823, 0.7294118, 0, 1, 1,
0.8470098, 0.03856253, -0.6435029, 0.7333333, 0, 1, 1,
0.849716, 0.3143823, 1.313713, 0.7411765, 0, 1, 1,
0.8518794, -2.22938, 1.174689, 0.7450981, 0, 1, 1,
0.8546209, 0.6019224, 2.115878, 0.7529412, 0, 1, 1,
0.8622921, -0.1675401, 2.385751, 0.7568628, 0, 1, 1,
0.8652776, -2.155967, 1.789659, 0.7647059, 0, 1, 1,
0.8695344, -1.438122, 5.246722, 0.7686275, 0, 1, 1,
0.8729387, -0.04816374, 1.622842, 0.7764706, 0, 1, 1,
0.8826532, -0.3085068, 0.8450398, 0.7803922, 0, 1, 1,
0.8832369, -0.2785222, 1.234523, 0.7882353, 0, 1, 1,
0.8834308, -0.3452604, 2.028671, 0.7921569, 0, 1, 1,
0.8857139, -0.0847579, 1.248275, 0.8, 0, 1, 1,
0.8863127, 0.8280748, 1.242586, 0.8078431, 0, 1, 1,
0.8871623, 1.321705, 0.2010317, 0.8117647, 0, 1, 1,
0.8876708, -1.21619, 2.285683, 0.8196079, 0, 1, 1,
0.8917193, -1.337274, 1.598651, 0.8235294, 0, 1, 1,
0.895943, -1.813982, 3.182166, 0.8313726, 0, 1, 1,
0.900419, 0.9154384, 2.466051, 0.8352941, 0, 1, 1,
0.9068495, -2.359672, 3.315817, 0.8431373, 0, 1, 1,
0.920581, 0.1361682, 1.715065, 0.8470588, 0, 1, 1,
0.9217516, -0.6714801, 4.694879, 0.854902, 0, 1, 1,
0.9224834, -0.4022202, 1.391117, 0.8588235, 0, 1, 1,
0.9266466, 1.150761, 1.231279, 0.8666667, 0, 1, 1,
0.9299711, 0.4371956, 2.053512, 0.8705882, 0, 1, 1,
0.9324253, -1.123445, 1.950769, 0.8784314, 0, 1, 1,
0.9349187, -0.03995952, 1.28146, 0.8823529, 0, 1, 1,
0.9378759, 1.619931, -0.2690924, 0.8901961, 0, 1, 1,
0.9395922, -0.0469125, 1.25405, 0.8941177, 0, 1, 1,
0.9429907, 0.3096939, 2.113252, 0.9019608, 0, 1, 1,
0.9451672, -0.3331033, 4.033296, 0.9098039, 0, 1, 1,
0.9499674, 0.07126041, 1.808043, 0.9137255, 0, 1, 1,
0.9503807, -0.1778036, 0.4753085, 0.9215686, 0, 1, 1,
0.9512619, 0.5657679, 1.69325, 0.9254902, 0, 1, 1,
0.9513497, 0.7934535, 1.692815, 0.9333333, 0, 1, 1,
0.9565231, 0.7455981, 1.399826, 0.9372549, 0, 1, 1,
0.9571935, -0.2296686, 2.013828, 0.945098, 0, 1, 1,
0.9593951, 1.838867, 0.3385369, 0.9490196, 0, 1, 1,
0.9595634, 0.643666, 0.2272777, 0.9568627, 0, 1, 1,
0.9651918, 0.3543247, 2.028509, 0.9607843, 0, 1, 1,
0.9702904, 1.397305, 0.3862525, 0.9686275, 0, 1, 1,
0.9748629, -1.763184, 2.630194, 0.972549, 0, 1, 1,
0.9814849, -0.748936, 1.976727, 0.9803922, 0, 1, 1,
0.9883572, -0.8028135, 2.30219, 0.9843137, 0, 1, 1,
0.9901637, 0.4994149, 2.05522, 0.9921569, 0, 1, 1,
0.9905751, 0.4741327, 2.296874, 0.9960784, 0, 1, 1,
0.9945762, -0.6392334, 4.052308, 1, 0, 0.9960784, 1,
1.003164, 0.8591022, 0.6841679, 1, 0, 0.9882353, 1,
1.003865, 0.5070821, 1.277659, 1, 0, 0.9843137, 1,
1.015428, 1.266149, 1.355901, 1, 0, 0.9764706, 1,
1.022872, 0.8714254, 1.747334, 1, 0, 0.972549, 1,
1.031375, -0.7466589, 2.215321, 1, 0, 0.9647059, 1,
1.033413, 0.4463117, 1.994827, 1, 0, 0.9607843, 1,
1.038072, -0.7647171, 3.966672, 1, 0, 0.9529412, 1,
1.045042, 0.409626, 0.758324, 1, 0, 0.9490196, 1,
1.045328, 1.520118, -0.1960236, 1, 0, 0.9411765, 1,
1.045752, 0.0335826, 2.316599, 1, 0, 0.9372549, 1,
1.06375, -0.2846327, 3.019661, 1, 0, 0.9294118, 1,
1.074672, -0.3622567, 1.86655, 1, 0, 0.9254902, 1,
1.091902, -1.550843, 1.443626, 1, 0, 0.9176471, 1,
1.100769, 0.6490556, 1.64657, 1, 0, 0.9137255, 1,
1.101997, -1.321069, 2.804809, 1, 0, 0.9058824, 1,
1.102015, 1.776297, 1.389131, 1, 0, 0.9019608, 1,
1.104444, -0.4841939, 3.057854, 1, 0, 0.8941177, 1,
1.106277, -1.04485, 2.8097, 1, 0, 0.8862745, 1,
1.107141, -0.1447985, 3.236047, 1, 0, 0.8823529, 1,
1.112082, -0.8667341, 1.723562, 1, 0, 0.8745098, 1,
1.11291, -0.5103648, 0.7790747, 1, 0, 0.8705882, 1,
1.114425, 1.318836, -0.8304566, 1, 0, 0.8627451, 1,
1.114882, 0.7644179, 1.175454, 1, 0, 0.8588235, 1,
1.120458, -1.689627, 1.183749, 1, 0, 0.8509804, 1,
1.12157, -0.9748388, 2.307467, 1, 0, 0.8470588, 1,
1.125928, 0.2653958, 1.945957, 1, 0, 0.8392157, 1,
1.131605, -0.9547689, 2.034532, 1, 0, 0.8352941, 1,
1.133408, 1.391639, 1.807438, 1, 0, 0.827451, 1,
1.134197, 1.113427, 1.749818, 1, 0, 0.8235294, 1,
1.138243, -0.1165788, 0.3266655, 1, 0, 0.8156863, 1,
1.138513, 0.05037418, 1.003174, 1, 0, 0.8117647, 1,
1.13921, -0.8662009, 2.010907, 1, 0, 0.8039216, 1,
1.146236, -0.01669616, 1.492809, 1, 0, 0.7960784, 1,
1.153705, 0.7546468, 2.708101, 1, 0, 0.7921569, 1,
1.155007, -0.8517171, 1.973568, 1, 0, 0.7843137, 1,
1.15642, -0.427027, 2.660491, 1, 0, 0.7803922, 1,
1.15862, -0.8562927, 1.557143, 1, 0, 0.772549, 1,
1.16324, -0.05426084, 2.677606, 1, 0, 0.7686275, 1,
1.165492, -0.5335906, 2.540533, 1, 0, 0.7607843, 1,
1.16572, 2.387569, -1.025555, 1, 0, 0.7568628, 1,
1.167262, 0.6047351, 1.933839, 1, 0, 0.7490196, 1,
1.176293, 0.6261435, -1.397366, 1, 0, 0.7450981, 1,
1.177716, 1.550853, 1.756327, 1, 0, 0.7372549, 1,
1.189984, 0.8866047, 2.466481, 1, 0, 0.7333333, 1,
1.190935, -0.4320169, 3.344714, 1, 0, 0.7254902, 1,
1.196958, 0.7229849, 0.6052731, 1, 0, 0.7215686, 1,
1.198551, -0.7766954, 1.13507, 1, 0, 0.7137255, 1,
1.203008, 0.1633534, 1.446975, 1, 0, 0.7098039, 1,
1.203194, 2.435597, -0.520202, 1, 0, 0.7019608, 1,
1.203683, -0.1312898, 3.515793, 1, 0, 0.6941177, 1,
1.215631, -0.5462689, 3.32161, 1, 0, 0.6901961, 1,
1.220004, 1.168454, -0.04420336, 1, 0, 0.682353, 1,
1.221918, -0.4529054, 2.327817, 1, 0, 0.6784314, 1,
1.232505, -0.3024175, 0.5525351, 1, 0, 0.6705883, 1,
1.250499, 0.1277456, 1.200333, 1, 0, 0.6666667, 1,
1.256922, 0.8574286, -0.2852982, 1, 0, 0.6588235, 1,
1.256937, 0.7814047, 1.210717, 1, 0, 0.654902, 1,
1.259369, -0.2739159, 1.173036, 1, 0, 0.6470588, 1,
1.266616, 1.216682, 2.492047, 1, 0, 0.6431373, 1,
1.278552, -1.27764, 3.024548, 1, 0, 0.6352941, 1,
1.278559, -0.9019245, 2.584987, 1, 0, 0.6313726, 1,
1.28169, -2.200399, 1.859701, 1, 0, 0.6235294, 1,
1.285741, 0.6485189, 1.070107, 1, 0, 0.6196079, 1,
1.287136, -0.4603537, 1.931802, 1, 0, 0.6117647, 1,
1.298126, -0.00219714, 2.826101, 1, 0, 0.6078432, 1,
1.311136, -0.09071259, 1.966565, 1, 0, 0.6, 1,
1.314484, -0.9932578, 2.679854, 1, 0, 0.5921569, 1,
1.318715, -0.2104949, -0.1015956, 1, 0, 0.5882353, 1,
1.322686, 0.8464449, 0.4546873, 1, 0, 0.5803922, 1,
1.328264, -0.6168125, 1.438884, 1, 0, 0.5764706, 1,
1.331919, -1.942606, 2.351079, 1, 0, 0.5686275, 1,
1.343656, 0.4006683, 2.405188, 1, 0, 0.5647059, 1,
1.346588, -1.56963, 1.981701, 1, 0, 0.5568628, 1,
1.348426, -0.3901098, 3.623685, 1, 0, 0.5529412, 1,
1.356612, -0.853835, 1.950522, 1, 0, 0.5450981, 1,
1.35967, -0.7254855, 1.320359, 1, 0, 0.5411765, 1,
1.368178, 0.03653992, 2.523722, 1, 0, 0.5333334, 1,
1.375968, -0.2277676, 1.356714, 1, 0, 0.5294118, 1,
1.376039, -0.6287566, 2.225729, 1, 0, 0.5215687, 1,
1.382759, -0.455951, 2.336931, 1, 0, 0.5176471, 1,
1.391081, 0.8264659, 1.233072, 1, 0, 0.509804, 1,
1.391599, 0.1927083, 2.433106, 1, 0, 0.5058824, 1,
1.399606, 1.101507, 1.085641, 1, 0, 0.4980392, 1,
1.400815, 0.3911839, 1.482874, 1, 0, 0.4901961, 1,
1.401525, 0.238955, 0.397469, 1, 0, 0.4862745, 1,
1.402893, 0.4760629, 0.07079676, 1, 0, 0.4784314, 1,
1.40839, 1.009591, 1.13528, 1, 0, 0.4745098, 1,
1.41865, 0.2471863, 0.02563955, 1, 0, 0.4666667, 1,
1.421614, -0.7481532, 1.187866, 1, 0, 0.4627451, 1,
1.454376, -0.6750223, 2.402068, 1, 0, 0.454902, 1,
1.466259, 0.1650602, 1.168801, 1, 0, 0.4509804, 1,
1.482551, -0.09462204, 2.587047, 1, 0, 0.4431373, 1,
1.483978, 0.6434531, 1.924915, 1, 0, 0.4392157, 1,
1.49016, -1.47702, 2.639642, 1, 0, 0.4313726, 1,
1.494002, 0.7808539, 1.654868, 1, 0, 0.427451, 1,
1.498205, 1.581644, 1.426109, 1, 0, 0.4196078, 1,
1.503417, -0.3469712, 2.074255, 1, 0, 0.4156863, 1,
1.507633, 0.4327933, 2.672332, 1, 0, 0.4078431, 1,
1.508875, 0.5951134, 2.744759, 1, 0, 0.4039216, 1,
1.50971, 0.286428, 0.1670401, 1, 0, 0.3960784, 1,
1.512499, 1.255207, -0.9926723, 1, 0, 0.3882353, 1,
1.543119, -1.222299, 3.392364, 1, 0, 0.3843137, 1,
1.543411, 1.227911, -0.1833558, 1, 0, 0.3764706, 1,
1.551148, 1.180793, -0.3567712, 1, 0, 0.372549, 1,
1.563223, -0.5691726, 3.079591, 1, 0, 0.3647059, 1,
1.573923, 0.5444999, 1.078787, 1, 0, 0.3607843, 1,
1.580025, -1.670381, 3.213887, 1, 0, 0.3529412, 1,
1.587563, 1.51243, 1.605156, 1, 0, 0.3490196, 1,
1.59365, 0.9115995, 0.9549817, 1, 0, 0.3411765, 1,
1.596421, -1.24072, 1.963064, 1, 0, 0.3372549, 1,
1.596801, 0.2410678, 0.07716923, 1, 0, 0.3294118, 1,
1.60635, 0.4712918, 1.701726, 1, 0, 0.3254902, 1,
1.610308, 0.4813433, 1.324667, 1, 0, 0.3176471, 1,
1.6108, 0.8954418, 2.504881, 1, 0, 0.3137255, 1,
1.617551, -1.768136, 2.690376, 1, 0, 0.3058824, 1,
1.619281, -0.4461393, 1.569241, 1, 0, 0.2980392, 1,
1.622202, -0.6959527, 1.415134, 1, 0, 0.2941177, 1,
1.651331, 0.6870185, 0.9787822, 1, 0, 0.2862745, 1,
1.65919, -0.828333, 2.338424, 1, 0, 0.282353, 1,
1.68392, 0.6818091, 1.893205, 1, 0, 0.2745098, 1,
1.684412, -1.898599, 3.184497, 1, 0, 0.2705882, 1,
1.692513, 0.3892371, -0.4902269, 1, 0, 0.2627451, 1,
1.698895, 0.7301612, 0.3913332, 1, 0, 0.2588235, 1,
1.702043, 1.280003, 1.817573, 1, 0, 0.2509804, 1,
1.724855, 0.08260806, 1.70164, 1, 0, 0.2470588, 1,
1.730796, 0.9054295, 1.349912, 1, 0, 0.2392157, 1,
1.743399, 2.154102, -0.4553291, 1, 0, 0.2352941, 1,
1.769101, -0.03100709, 0.2383659, 1, 0, 0.227451, 1,
1.782605, 0.03343838, 2.314254, 1, 0, 0.2235294, 1,
1.809742, 1.511424, 1.940418, 1, 0, 0.2156863, 1,
1.810551, 0.4292877, -0.6373839, 1, 0, 0.2117647, 1,
1.810869, 1.071581, 1.751597, 1, 0, 0.2039216, 1,
1.812491, 1.703871, -0.7853189, 1, 0, 0.1960784, 1,
1.813756, 1.074119, -0.9952133, 1, 0, 0.1921569, 1,
1.821504, -0.5174215, 0.4907773, 1, 0, 0.1843137, 1,
1.832302, -0.5021641, 1.188211, 1, 0, 0.1803922, 1,
1.842146, 2.467942, 0.5964043, 1, 0, 0.172549, 1,
1.850255, -0.0587282, 0.0875826, 1, 0, 0.1686275, 1,
1.850965, -1.087183, 3.589409, 1, 0, 0.1607843, 1,
1.873267, -1.354415, 3.227348, 1, 0, 0.1568628, 1,
1.876168, 1.183937, 1.969954, 1, 0, 0.1490196, 1,
1.886249, 0.9369785, 1.581041, 1, 0, 0.145098, 1,
1.906701, 1.086964, 0.8461961, 1, 0, 0.1372549, 1,
1.908069, -0.4314774, 2.316678, 1, 0, 0.1333333, 1,
1.90975, -0.8918761, 3.114243, 1, 0, 0.1254902, 1,
1.93225, -1.246776, 2.064665, 1, 0, 0.1215686, 1,
1.953211, 0.6385199, -0.6689358, 1, 0, 0.1137255, 1,
1.958162, -0.7452518, 3.407153, 1, 0, 0.1098039, 1,
1.986826, 1.574836, 1.797599, 1, 0, 0.1019608, 1,
2.064454, 1.020097, 0.7523071, 1, 0, 0.09411765, 1,
2.103782, 1.831317, 2.893655, 1, 0, 0.09019608, 1,
2.107161, -2.153254, 1.411914, 1, 0, 0.08235294, 1,
2.130203, 0.9291395, 1.134975, 1, 0, 0.07843138, 1,
2.23421, -0.197363, 0.3091423, 1, 0, 0.07058824, 1,
2.334926, 0.1382274, 0.6844832, 1, 0, 0.06666667, 1,
2.377817, 1.622029, 1.712877, 1, 0, 0.05882353, 1,
2.469054, 0.687979, 2.713786, 1, 0, 0.05490196, 1,
2.488424, 0.3238947, 1.081745, 1, 0, 0.04705882, 1,
2.648695, -0.9814899, 2.693201, 1, 0, 0.04313726, 1,
2.783785, 0.2853155, 1.892234, 1, 0, 0.03529412, 1,
2.939129, 0.3117532, 2.285884, 1, 0, 0.03137255, 1,
3.029593, -0.7543077, 3.51017, 1, 0, 0.02352941, 1,
3.044727, 0.8694456, 1.125676, 1, 0, 0.01960784, 1,
3.169094, 0.8578369, 2.820988, 1, 0, 0.01176471, 1,
3.246546, -0.08581213, 1.261776, 1, 0, 0.007843138, 1
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
-0.2449366, -3.782326, -7.169015, 0, -0.5, 0.5, 0.5,
-0.2449366, -3.782326, -7.169015, 1, -0.5, 0.5, 0.5,
-0.2449366, -3.782326, -7.169015, 1, 1.5, 0.5, 0.5,
-0.2449366, -3.782326, -7.169015, 0, 1.5, 0.5, 0.5
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
-4.920032, 0.009307027, -7.169015, 0, -0.5, 0.5, 0.5,
-4.920032, 0.009307027, -7.169015, 1, -0.5, 0.5, 0.5,
-4.920032, 0.009307027, -7.169015, 1, 1.5, 0.5, 0.5,
-4.920032, 0.009307027, -7.169015, 0, 1.5, 0.5, 0.5
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
-4.920032, -3.782326, -0.06141686, 0, -0.5, 0.5, 0.5,
-4.920032, -3.782326, -0.06141686, 1, -0.5, 0.5, 0.5,
-4.920032, -3.782326, -0.06141686, 1, 1.5, 0.5, 0.5,
-4.920032, -3.782326, -0.06141686, 0, 1.5, 0.5, 0.5
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
-3, -2.907334, -5.5288,
3, -2.907334, -5.5288,
-3, -2.907334, -5.5288,
-3, -3.053166, -5.802169,
-2, -2.907334, -5.5288,
-2, -3.053166, -5.802169,
-1, -2.907334, -5.5288,
-1, -3.053166, -5.802169,
0, -2.907334, -5.5288,
0, -3.053166, -5.802169,
1, -2.907334, -5.5288,
1, -3.053166, -5.802169,
2, -2.907334, -5.5288,
2, -3.053166, -5.802169,
3, -2.907334, -5.5288,
3, -3.053166, -5.802169
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
-3, -3.34483, -6.348907, 0, -0.5, 0.5, 0.5,
-3, -3.34483, -6.348907, 1, -0.5, 0.5, 0.5,
-3, -3.34483, -6.348907, 1, 1.5, 0.5, 0.5,
-3, -3.34483, -6.348907, 0, 1.5, 0.5, 0.5,
-2, -3.34483, -6.348907, 0, -0.5, 0.5, 0.5,
-2, -3.34483, -6.348907, 1, -0.5, 0.5, 0.5,
-2, -3.34483, -6.348907, 1, 1.5, 0.5, 0.5,
-2, -3.34483, -6.348907, 0, 1.5, 0.5, 0.5,
-1, -3.34483, -6.348907, 0, -0.5, 0.5, 0.5,
-1, -3.34483, -6.348907, 1, -0.5, 0.5, 0.5,
-1, -3.34483, -6.348907, 1, 1.5, 0.5, 0.5,
-1, -3.34483, -6.348907, 0, 1.5, 0.5, 0.5,
0, -3.34483, -6.348907, 0, -0.5, 0.5, 0.5,
0, -3.34483, -6.348907, 1, -0.5, 0.5, 0.5,
0, -3.34483, -6.348907, 1, 1.5, 0.5, 0.5,
0, -3.34483, -6.348907, 0, 1.5, 0.5, 0.5,
1, -3.34483, -6.348907, 0, -0.5, 0.5, 0.5,
1, -3.34483, -6.348907, 1, -0.5, 0.5, 0.5,
1, -3.34483, -6.348907, 1, 1.5, 0.5, 0.5,
1, -3.34483, -6.348907, 0, 1.5, 0.5, 0.5,
2, -3.34483, -6.348907, 0, -0.5, 0.5, 0.5,
2, -3.34483, -6.348907, 1, -0.5, 0.5, 0.5,
2, -3.34483, -6.348907, 1, 1.5, 0.5, 0.5,
2, -3.34483, -6.348907, 0, 1.5, 0.5, 0.5,
3, -3.34483, -6.348907, 0, -0.5, 0.5, 0.5,
3, -3.34483, -6.348907, 1, -0.5, 0.5, 0.5,
3, -3.34483, -6.348907, 1, 1.5, 0.5, 0.5,
3, -3.34483, -6.348907, 0, 1.5, 0.5, 0.5
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
-3.841164, -2, -5.5288,
-3.841164, 2, -5.5288,
-3.841164, -2, -5.5288,
-4.020975, -2, -5.802169,
-3.841164, -1, -5.5288,
-4.020975, -1, -5.802169,
-3.841164, 0, -5.5288,
-4.020975, 0, -5.802169,
-3.841164, 1, -5.5288,
-4.020975, 1, -5.802169,
-3.841164, 2, -5.5288,
-4.020975, 2, -5.802169
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
-4.380598, -2, -6.348907, 0, -0.5, 0.5, 0.5,
-4.380598, -2, -6.348907, 1, -0.5, 0.5, 0.5,
-4.380598, -2, -6.348907, 1, 1.5, 0.5, 0.5,
-4.380598, -2, -6.348907, 0, 1.5, 0.5, 0.5,
-4.380598, -1, -6.348907, 0, -0.5, 0.5, 0.5,
-4.380598, -1, -6.348907, 1, -0.5, 0.5, 0.5,
-4.380598, -1, -6.348907, 1, 1.5, 0.5, 0.5,
-4.380598, -1, -6.348907, 0, 1.5, 0.5, 0.5,
-4.380598, 0, -6.348907, 0, -0.5, 0.5, 0.5,
-4.380598, 0, -6.348907, 1, -0.5, 0.5, 0.5,
-4.380598, 0, -6.348907, 1, 1.5, 0.5, 0.5,
-4.380598, 0, -6.348907, 0, 1.5, 0.5, 0.5,
-4.380598, 1, -6.348907, 0, -0.5, 0.5, 0.5,
-4.380598, 1, -6.348907, 1, -0.5, 0.5, 0.5,
-4.380598, 1, -6.348907, 1, 1.5, 0.5, 0.5,
-4.380598, 1, -6.348907, 0, 1.5, 0.5, 0.5,
-4.380598, 2, -6.348907, 0, -0.5, 0.5, 0.5,
-4.380598, 2, -6.348907, 1, -0.5, 0.5, 0.5,
-4.380598, 2, -6.348907, 1, 1.5, 0.5, 0.5,
-4.380598, 2, -6.348907, 0, 1.5, 0.5, 0.5
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
-3.841164, -2.907334, -4,
-3.841164, -2.907334, 4,
-3.841164, -2.907334, -4,
-4.020975, -3.053166, -4,
-3.841164, -2.907334, -2,
-4.020975, -3.053166, -2,
-3.841164, -2.907334, 0,
-4.020975, -3.053166, 0,
-3.841164, -2.907334, 2,
-4.020975, -3.053166, 2,
-3.841164, -2.907334, 4,
-4.020975, -3.053166, 4
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
-4.380598, -3.34483, -4, 0, -0.5, 0.5, 0.5,
-4.380598, -3.34483, -4, 1, -0.5, 0.5, 0.5,
-4.380598, -3.34483, -4, 1, 1.5, 0.5, 0.5,
-4.380598, -3.34483, -4, 0, 1.5, 0.5, 0.5,
-4.380598, -3.34483, -2, 0, -0.5, 0.5, 0.5,
-4.380598, -3.34483, -2, 1, -0.5, 0.5, 0.5,
-4.380598, -3.34483, -2, 1, 1.5, 0.5, 0.5,
-4.380598, -3.34483, -2, 0, 1.5, 0.5, 0.5,
-4.380598, -3.34483, 0, 0, -0.5, 0.5, 0.5,
-4.380598, -3.34483, 0, 1, -0.5, 0.5, 0.5,
-4.380598, -3.34483, 0, 1, 1.5, 0.5, 0.5,
-4.380598, -3.34483, 0, 0, 1.5, 0.5, 0.5,
-4.380598, -3.34483, 2, 0, -0.5, 0.5, 0.5,
-4.380598, -3.34483, 2, 1, -0.5, 0.5, 0.5,
-4.380598, -3.34483, 2, 1, 1.5, 0.5, 0.5,
-4.380598, -3.34483, 2, 0, 1.5, 0.5, 0.5,
-4.380598, -3.34483, 4, 0, -0.5, 0.5, 0.5,
-4.380598, -3.34483, 4, 1, -0.5, 0.5, 0.5,
-4.380598, -3.34483, 4, 1, 1.5, 0.5, 0.5,
-4.380598, -3.34483, 4, 0, 1.5, 0.5, 0.5
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
-3.841164, -2.907334, -5.5288,
-3.841164, 2.925948, -5.5288,
-3.841164, -2.907334, 5.405966,
-3.841164, 2.925948, 5.405966,
-3.841164, -2.907334, -5.5288,
-3.841164, -2.907334, 5.405966,
-3.841164, 2.925948, -5.5288,
-3.841164, 2.925948, 5.405966,
-3.841164, -2.907334, -5.5288,
3.351291, -2.907334, -5.5288,
-3.841164, -2.907334, 5.405966,
3.351291, -2.907334, 5.405966,
-3.841164, 2.925948, -5.5288,
3.351291, 2.925948, -5.5288,
-3.841164, 2.925948, 5.405966,
3.351291, 2.925948, 5.405966,
3.351291, -2.907334, -5.5288,
3.351291, 2.925948, -5.5288,
3.351291, -2.907334, 5.405966,
3.351291, 2.925948, 5.405966,
3.351291, -2.907334, -5.5288,
3.351291, -2.907334, 5.405966,
3.351291, 2.925948, -5.5288,
3.351291, 2.925948, 5.405966
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
var radius = 7.651547;
var distance = 34.04259;
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
mvMatrix.translate( 0.2449366, -0.009307027, 0.06141686 );
mvMatrix.scale( 1.150234, 1.418242, 0.7565778 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.04259);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
silvex<-read.table("silvex.xyz")
```

```
## Error in read.table("silvex.xyz"): no lines available in input
```

```r
x<-silvex$V2
```

```
## Error in eval(expr, envir, enclos): object 'silvex' not found
```

```r
y<-silvex$V3
```

```
## Error in eval(expr, envir, enclos): object 'silvex' not found
```

```r
z<-silvex$V4
```

```
## Error in eval(expr, envir, enclos): object 'silvex' not found
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
-3.736419, -1.407264, -2.44883, 0, 0, 1, 1, 1,
-3.212529, 1.435747, -0.4916362, 1, 0, 0, 1, 1,
-2.760137, 1.610278, -0.9064743, 1, 0, 0, 1, 1,
-2.729751, 0.3623139, -1.809106, 1, 0, 0, 1, 1,
-2.574526, 0.3499859, -3.347489, 1, 0, 0, 1, 1,
-2.511943, -1.042418, -2.578218, 1, 0, 0, 1, 1,
-2.500857, 1.466107, -0.9671191, 0, 0, 0, 1, 1,
-2.441508, -1.255732, -2.05973, 0, 0, 0, 1, 1,
-2.436059, 1.75247, -1.372303, 0, 0, 0, 1, 1,
-2.418007, 1.466003, -1.600479, 0, 0, 0, 1, 1,
-2.341313, -1.139261, -3.304085, 0, 0, 0, 1, 1,
-2.324318, 0.7803667, 0.2154755, 0, 0, 0, 1, 1,
-2.320448, 0.9003152, -2.234091, 0, 0, 0, 1, 1,
-2.292455, -1.710627, -2.182781, 1, 1, 1, 1, 1,
-2.256375, 0.5777548, -2.14737, 1, 1, 1, 1, 1,
-2.232271, -0.000495138, -2.723601, 1, 1, 1, 1, 1,
-2.209585, -1.859991, -2.576905, 1, 1, 1, 1, 1,
-2.194309, 1.49497, 1.113055, 1, 1, 1, 1, 1,
-2.191554, 0.3651761, -1.554178, 1, 1, 1, 1, 1,
-2.171844, 0.3084665, -1.620344, 1, 1, 1, 1, 1,
-2.149026, -0.5931273, -1.851848, 1, 1, 1, 1, 1,
-2.136509, -0.7258368, 0.8367279, 1, 1, 1, 1, 1,
-2.121416, 0.6015813, -0.8713033, 1, 1, 1, 1, 1,
-2.10556, 1.613062, -1.554483, 1, 1, 1, 1, 1,
-2.08353, 0.4855109, -0.8890061, 1, 1, 1, 1, 1,
-2.072727, -1.045277, -0.5605221, 1, 1, 1, 1, 1,
-2.042097, -1.347124, -2.658679, 1, 1, 1, 1, 1,
-2.031573, 0.9929302, -1.788872, 1, 1, 1, 1, 1,
-2.001521, -0.5941189, -0.8074835, 0, 0, 1, 1, 1,
-1.993675, -0.05866155, -2.256649, 1, 0, 0, 1, 1,
-1.969473, 0.1565178, -1.224575, 1, 0, 0, 1, 1,
-1.954693, 0.4581534, -0.7142892, 1, 0, 0, 1, 1,
-1.903617, 0.8356155, -1.838317, 1, 0, 0, 1, 1,
-1.883536, -0.4967106, -3.369205, 1, 0, 0, 1, 1,
-1.865033, 0.3395295, -2.196733, 0, 0, 0, 1, 1,
-1.853841, -0.6766357, -1.44788, 0, 0, 0, 1, 1,
-1.834394, 0.707261, -1.95635, 0, 0, 0, 1, 1,
-1.831348, 0.7276564, -1.731405, 0, 0, 0, 1, 1,
-1.830575, 0.3091229, -3.419914, 0, 0, 0, 1, 1,
-1.822428, -1.869499, -2.594543, 0, 0, 0, 1, 1,
-1.812426, 0.00809797, -0.3726924, 0, 0, 0, 1, 1,
-1.806394, -0.4703003, -1.536644, 1, 1, 1, 1, 1,
-1.785809, -0.2802297, -1.797801, 1, 1, 1, 1, 1,
-1.767418, 0.06845952, -1.570379, 1, 1, 1, 1, 1,
-1.754533, 0.5183797, -2.01721, 1, 1, 1, 1, 1,
-1.731915, 0.3421213, -0.7790343, 1, 1, 1, 1, 1,
-1.725873, 0.3818999, -2.611044, 1, 1, 1, 1, 1,
-1.722122, -1.174423, -2.947031, 1, 1, 1, 1, 1,
-1.720536, 1.297798, -1.62927, 1, 1, 1, 1, 1,
-1.719903, 0.4436831, -0.8051451, 1, 1, 1, 1, 1,
-1.687121, -2.319654, -2.076801, 1, 1, 1, 1, 1,
-1.682624, 0.2548387, 0.2063899, 1, 1, 1, 1, 1,
-1.67787, -0.4294204, -1.295756, 1, 1, 1, 1, 1,
-1.673789, -0.04107637, -1.840279, 1, 1, 1, 1, 1,
-1.668442, -0.1448809, -1.905514, 1, 1, 1, 1, 1,
-1.665054, 0.3261547, -1.113192, 1, 1, 1, 1, 1,
-1.660848, 0.02951133, -2.749661, 0, 0, 1, 1, 1,
-1.640392, -1.34653, -3.881946, 1, 0, 0, 1, 1,
-1.63071, -0.3253399, -2.698088, 1, 0, 0, 1, 1,
-1.6227, -0.9243137, -0.6635097, 1, 0, 0, 1, 1,
-1.6058, -0.3530824, -2.408313, 1, 0, 0, 1, 1,
-1.591813, 1.174913, -0.08027331, 1, 0, 0, 1, 1,
-1.5853, 0.5374702, -0.1775825, 0, 0, 0, 1, 1,
-1.58065, -1.287257, -2.619694, 0, 0, 0, 1, 1,
-1.574227, 0.2547491, -0.09354459, 0, 0, 0, 1, 1,
-1.556946, 0.4669577, 0.4578353, 0, 0, 0, 1, 1,
-1.53426, -0.1910727, -1.284773, 0, 0, 0, 1, 1,
-1.520311, -1.070077, -2.211828, 0, 0, 0, 1, 1,
-1.512335, 1.085863, -2.497357, 0, 0, 0, 1, 1,
-1.495231, 0.3020704, -1.416922, 1, 1, 1, 1, 1,
-1.494593, -2.387568, -1.906552, 1, 1, 1, 1, 1,
-1.477055, -1.244614, -2.783579, 1, 1, 1, 1, 1,
-1.470079, 1.219639, 0.0236583, 1, 1, 1, 1, 1,
-1.460924, -0.6565765, -0.2789317, 1, 1, 1, 1, 1,
-1.458529, -0.1732356, -0.4214947, 1, 1, 1, 1, 1,
-1.43877, 1.197605, -1.833519, 1, 1, 1, 1, 1,
-1.426508, 0.08843927, -0.3927444, 1, 1, 1, 1, 1,
-1.402892, 0.3960935, -0.8805585, 1, 1, 1, 1, 1,
-1.398767, 0.7558917, -0.4946937, 1, 1, 1, 1, 1,
-1.39387, 0.5845644, -0.9048526, 1, 1, 1, 1, 1,
-1.387267, 1.675521, -1.20936, 1, 1, 1, 1, 1,
-1.382823, 2.277867, -1.438482, 1, 1, 1, 1, 1,
-1.377617, -0.9090526, -3.138324, 1, 1, 1, 1, 1,
-1.376595, 0.6066566, -2.739049, 1, 1, 1, 1, 1,
-1.373058, -0.9451197, -2.959531, 0, 0, 1, 1, 1,
-1.372997, 1.305184, -0.7561865, 1, 0, 0, 1, 1,
-1.370942, -0.8890029, -1.774967, 1, 0, 0, 1, 1,
-1.366245, -1.417329, -2.402011, 1, 0, 0, 1, 1,
-1.363826, -0.4403066, -1.728485, 1, 0, 0, 1, 1,
-1.354868, 0.8092931, -0.8191749, 1, 0, 0, 1, 1,
-1.352147, -1.114336, -2.570512, 0, 0, 0, 1, 1,
-1.344166, 1.266536, -0.3829711, 0, 0, 0, 1, 1,
-1.342441, -1.415356, -2.331251, 0, 0, 0, 1, 1,
-1.338611, -0.1734271, -2.699697, 0, 0, 0, 1, 1,
-1.337179, -1.403362, -1.381696, 0, 0, 0, 1, 1,
-1.332025, 0.8242206, -2.771592, 0, 0, 0, 1, 1,
-1.309297, 0.05622105, 0.0674476, 0, 0, 0, 1, 1,
-1.302472, 1.591292, -0.1985869, 1, 1, 1, 1, 1,
-1.286577, -0.4832277, -3.222768, 1, 1, 1, 1, 1,
-1.2855, -0.9477178, -1.120382, 1, 1, 1, 1, 1,
-1.276617, -0.1667372, -1.99686, 1, 1, 1, 1, 1,
-1.269959, -1.746513, -3.498764, 1, 1, 1, 1, 1,
-1.2641, 0.7640499, -2.823462, 1, 1, 1, 1, 1,
-1.263021, -0.1796914, -3.043748, 1, 1, 1, 1, 1,
-1.258588, 1.183921, -2.83212, 1, 1, 1, 1, 1,
-1.249672, 0.7575872, -0.1466283, 1, 1, 1, 1, 1,
-1.24948, -1.104882, -2.921136, 1, 1, 1, 1, 1,
-1.248005, -0.5479981, -2.024474, 1, 1, 1, 1, 1,
-1.237838, -1.953323, -3.989806, 1, 1, 1, 1, 1,
-1.230956, 0.6554918, -1.645856, 1, 1, 1, 1, 1,
-1.225297, 1.584027, -0.7246702, 1, 1, 1, 1, 1,
-1.220906, -0.3174517, -2.06431, 1, 1, 1, 1, 1,
-1.217273, -1.721314, -1.947421, 0, 0, 1, 1, 1,
-1.191121, -0.2876336, -2.288618, 1, 0, 0, 1, 1,
-1.18243, 0.3298261, -1.934995, 1, 0, 0, 1, 1,
-1.164047, 1.547954, 0.02540369, 1, 0, 0, 1, 1,
-1.152213, 0.08871472, -1.3014, 1, 0, 0, 1, 1,
-1.137921, -0.9571276, -1.811666, 1, 0, 0, 1, 1,
-1.137318, 1.189194, -0.8541946, 0, 0, 0, 1, 1,
-1.136476, -0.8704555, -1.969173, 0, 0, 0, 1, 1,
-1.134204, 0.5573394, -0.2614706, 0, 0, 0, 1, 1,
-1.132532, -0.4291817, -1.990829, 0, 0, 0, 1, 1,
-1.131814, -0.9580444, -1.725042, 0, 0, 0, 1, 1,
-1.121915, -2.178652, -2.953083, 0, 0, 0, 1, 1,
-1.119021, 1.450637, -1.786008, 0, 0, 0, 1, 1,
-1.116762, -0.944071, -3.242846, 1, 1, 1, 1, 1,
-1.114134, -0.3785409, 0.7039089, 1, 1, 1, 1, 1,
-1.111119, 0.9450243, -1.482323, 1, 1, 1, 1, 1,
-1.106134, 0.2725663, -1.980237, 1, 1, 1, 1, 1,
-1.09789, 0.1942897, -1.620883, 1, 1, 1, 1, 1,
-1.097397, 0.6707402, -0.9573448, 1, 1, 1, 1, 1,
-1.093601, 0.004439796, -1.808113, 1, 1, 1, 1, 1,
-1.092607, -1.011719, -3.398325, 1, 1, 1, 1, 1,
-1.092146, 0.7150568, -1.775832, 1, 1, 1, 1, 1,
-1.085364, -0.4768252, -1.535068, 1, 1, 1, 1, 1,
-1.081901, -0.04184187, -1.270043, 1, 1, 1, 1, 1,
-1.079972, -1.121701, -0.5932301, 1, 1, 1, 1, 1,
-1.064311, 0.8081195, -0.4451257, 1, 1, 1, 1, 1,
-1.051147, 1.665234, -0.3798012, 1, 1, 1, 1, 1,
-1.048167, -1.640641, -3.383521, 1, 1, 1, 1, 1,
-1.034286, 0.1042898, -2.891567, 0, 0, 1, 1, 1,
-1.034117, -0.2462616, -2.919319, 1, 0, 0, 1, 1,
-1.030309, -0.07018014, -2.203416, 1, 0, 0, 1, 1,
-1.028387, -1.406144, -3.699466, 1, 0, 0, 1, 1,
-1.028205, 1.007836, 0.5450484, 1, 0, 0, 1, 1,
-1.025305, -0.524622, -1.224796, 1, 0, 0, 1, 1,
-1.022286, -0.3093235, 0.393806, 0, 0, 0, 1, 1,
-1.02166, 0.5504388, -2.548512, 0, 0, 0, 1, 1,
-1.015629, 2.215612, 0.1124356, 0, 0, 0, 1, 1,
-1.015401, -0.2323152, -2.425271, 0, 0, 0, 1, 1,
-1.014756, -0.1276073, -1.47884, 0, 0, 0, 1, 1,
-1.014744, -0.7607726, -2.373694, 0, 0, 0, 1, 1,
-1.005331, 0.02650206, -1.901123, 0, 0, 0, 1, 1,
-0.9995734, 0.2415535, -2.658315, 1, 1, 1, 1, 1,
-0.9922645, 0.4298912, -0.7702577, 1, 1, 1, 1, 1,
-0.9869919, 0.698545, -0.4237349, 1, 1, 1, 1, 1,
-0.9853243, 0.4884982, -0.6971405, 1, 1, 1, 1, 1,
-0.9845024, 0.5879608, -1.26166, 1, 1, 1, 1, 1,
-0.9838884, 1.218176, 0.2753114, 1, 1, 1, 1, 1,
-0.9768916, -0.881198, -1.505305, 1, 1, 1, 1, 1,
-0.9752597, 1.80982, -0.003506422, 1, 1, 1, 1, 1,
-0.9751616, 0.285574, 0.4146599, 1, 1, 1, 1, 1,
-0.9696664, 0.2446598, -1.983278, 1, 1, 1, 1, 1,
-0.9666651, -1.408412, -1.367135, 1, 1, 1, 1, 1,
-0.9595491, -1.158039, -4.537742, 1, 1, 1, 1, 1,
-0.9580488, -1.863518, -3.048052, 1, 1, 1, 1, 1,
-0.9529949, 0.8962992, -2.841197, 1, 1, 1, 1, 1,
-0.9528764, -0.8270832, -2.405802, 1, 1, 1, 1, 1,
-0.9518481, -0.8325437, -1.486223, 0, 0, 1, 1, 1,
-0.9425484, -0.9680504, -3.413597, 1, 0, 0, 1, 1,
-0.9417077, 0.2034163, -1.971192, 1, 0, 0, 1, 1,
-0.9409847, -0.7020156, -1.945674, 1, 0, 0, 1, 1,
-0.9309385, 1.079996, 0.870647, 1, 0, 0, 1, 1,
-0.9241513, -1.472257, -3.26386, 1, 0, 0, 1, 1,
-0.920124, 0.8975894, -2.623807, 0, 0, 0, 1, 1,
-0.9159544, 0.2737283, -1.2515, 0, 0, 0, 1, 1,
-0.9150245, 1.290441, -0.7228359, 0, 0, 0, 1, 1,
-0.908597, 0.3025025, -1.90308, 0, 0, 0, 1, 1,
-0.907813, 0.3773353, -2.053397, 0, 0, 0, 1, 1,
-0.9063106, 0.4056464, -1.415722, 0, 0, 0, 1, 1,
-0.8985466, 0.6808973, -0.3133477, 0, 0, 0, 1, 1,
-0.8961407, -0.4943356, -1.90711, 1, 1, 1, 1, 1,
-0.8888915, 1.334191, -0.8931174, 1, 1, 1, 1, 1,
-0.8816357, 1.00512, -1.187876, 1, 1, 1, 1, 1,
-0.8746548, 0.4551787, -1.101758, 1, 1, 1, 1, 1,
-0.873512, -0.01558513, -3.106713, 1, 1, 1, 1, 1,
-0.8705187, 0.2391995, -1.31281, 1, 1, 1, 1, 1,
-0.8651651, -0.1965423, -2.378925, 1, 1, 1, 1, 1,
-0.8617277, -0.2622186, -2.565531, 1, 1, 1, 1, 1,
-0.860157, 1.440148, 0.3071373, 1, 1, 1, 1, 1,
-0.8583103, -1.585303, -2.969589, 1, 1, 1, 1, 1,
-0.8537726, -0.6723444, -0.492337, 1, 1, 1, 1, 1,
-0.8536983, -2.822383, -2.859801, 1, 1, 1, 1, 1,
-0.8478667, -0.7481012, -2.507998, 1, 1, 1, 1, 1,
-0.8456612, 1.543182, 1.040592, 1, 1, 1, 1, 1,
-0.8417085, 0.2936233, -0.2747555, 1, 1, 1, 1, 1,
-0.840773, -0.08101899, -1.797957, 0, 0, 1, 1, 1,
-0.8372665, -2.084255, -2.446728, 1, 0, 0, 1, 1,
-0.8232757, 1.258077, -1.80316, 1, 0, 0, 1, 1,
-0.8224083, 1.317748, -0.8307353, 1, 0, 0, 1, 1,
-0.8182218, -0.6135781, -1.910313, 1, 0, 0, 1, 1,
-0.8116763, -0.06283361, -0.6371892, 1, 0, 0, 1, 1,
-0.8098677, -1.310079, -1.246295, 0, 0, 0, 1, 1,
-0.8026565, 1.278996, -0.8890136, 0, 0, 0, 1, 1,
-0.8002234, -0.1260075, -1.221873, 0, 0, 0, 1, 1,
-0.7978598, -0.4164208, 0.3793728, 0, 0, 0, 1, 1,
-0.7931868, 0.1744014, -0.4759387, 0, 0, 0, 1, 1,
-0.7883622, 0.6180801, 0.9787095, 0, 0, 0, 1, 1,
-0.7875318, 0.584087, -1.136927, 0, 0, 0, 1, 1,
-0.7852135, -0.5158882, -4.241291, 1, 1, 1, 1, 1,
-0.7852076, -1.417551, -2.650961, 1, 1, 1, 1, 1,
-0.7841377, 1.138331, -0.9501616, 1, 1, 1, 1, 1,
-0.7836745, -0.2321143, -1.513255, 1, 1, 1, 1, 1,
-0.7800807, 0.621336, 0.480919, 1, 1, 1, 1, 1,
-0.7800344, -0.351339, -2.014451, 1, 1, 1, 1, 1,
-0.7797996, 1.163306, -0.4478623, 1, 1, 1, 1, 1,
-0.777227, 1.725965, -1.56894, 1, 1, 1, 1, 1,
-0.7768918, -1.02229, -3.331085, 1, 1, 1, 1, 1,
-0.7725579, 1.454909, -0.07126867, 1, 1, 1, 1, 1,
-0.7688459, -0.3299906, -2.252401, 1, 1, 1, 1, 1,
-0.7684882, 0.1552209, -2.184636, 1, 1, 1, 1, 1,
-0.7677097, -0.9541658, -2.20066, 1, 1, 1, 1, 1,
-0.7665669, 1.287332, 0.1182374, 1, 1, 1, 1, 1,
-0.7656586, -1.254548, -4.488943, 1, 1, 1, 1, 1,
-0.7605898, -0.3632431, -1.862103, 0, 0, 1, 1, 1,
-0.7603412, 0.1201813, -0.1614867, 1, 0, 0, 1, 1,
-0.7573413, -0.6645935, -1.850294, 1, 0, 0, 1, 1,
-0.7529291, -0.6946267, -3.185789, 1, 0, 0, 1, 1,
-0.7500488, -0.7719304, -0.2960186, 1, 0, 0, 1, 1,
-0.7493788, 0.5238727, -1.721401, 1, 0, 0, 1, 1,
-0.747681, -1.308088, -3.752716, 0, 0, 0, 1, 1,
-0.7470679, 1.702563, -0.1009365, 0, 0, 0, 1, 1,
-0.7469419, 0.3015445, -1.239418, 0, 0, 0, 1, 1,
-0.7393801, 0.7239435, -2.085518, 0, 0, 0, 1, 1,
-0.7393469, -0.1545162, -1.403048, 0, 0, 0, 1, 1,
-0.7364649, -0.4050453, -2.467483, 0, 0, 0, 1, 1,
-0.7333249, -1.322284, -1.996575, 0, 0, 0, 1, 1,
-0.7302201, 0.7918512, -0.809239, 1, 1, 1, 1, 1,
-0.7259312, 1.991346, -1.210342, 1, 1, 1, 1, 1,
-0.7115672, 0.8760344, 0.2269986, 1, 1, 1, 1, 1,
-0.7052161, -1.203365, -4.29111, 1, 1, 1, 1, 1,
-0.704951, 0.5338617, -0.125732, 1, 1, 1, 1, 1,
-0.7027899, 0.3616142, -1.486299, 1, 1, 1, 1, 1,
-0.7026688, 0.8638195, 0.5545845, 1, 1, 1, 1, 1,
-0.6960763, -1.073026, -3.656027, 1, 1, 1, 1, 1,
-0.6760259, 1.486648, -0.7789943, 1, 1, 1, 1, 1,
-0.6738954, 1.059452, -0.4396378, 1, 1, 1, 1, 1,
-0.673505, 1.945216, -0.05948195, 1, 1, 1, 1, 1,
-0.6696543, -0.4715479, -2.641832, 1, 1, 1, 1, 1,
-0.6691683, -0.06384058, -0.8055672, 1, 1, 1, 1, 1,
-0.6681167, 0.4363342, -1.285791, 1, 1, 1, 1, 1,
-0.6658376, 2.613125, 1.16967, 1, 1, 1, 1, 1,
-0.6651943, 1.18558, -1.978193, 0, 0, 1, 1, 1,
-0.6633809, -0.976514, -2.236975, 1, 0, 0, 1, 1,
-0.6630129, -0.3993204, -2.577658, 1, 0, 0, 1, 1,
-0.6622157, 0.7723945, -1.053544, 1, 0, 0, 1, 1,
-0.6583706, -1.442728, -2.771133, 1, 0, 0, 1, 1,
-0.6533613, 1.883513, -1.142072, 1, 0, 0, 1, 1,
-0.6532632, -0.06727534, -0.9231508, 0, 0, 0, 1, 1,
-0.6473497, -1.5926, -3.132436, 0, 0, 0, 1, 1,
-0.6446084, 0.05108281, -1.03861, 0, 0, 0, 1, 1,
-0.6348594, 0.3700229, 0.09005097, 0, 0, 0, 1, 1,
-0.6343886, -1.642276, -2.474027, 0, 0, 0, 1, 1,
-0.6296955, 1.726636, 0.8183066, 0, 0, 0, 1, 1,
-0.6286625, 0.1727, -0.6090892, 0, 0, 0, 1, 1,
-0.6281292, 0.1540639, -1.459481, 1, 1, 1, 1, 1,
-0.6210662, 0.9083402, -1.398346, 1, 1, 1, 1, 1,
-0.6135326, -1.641845, -2.341504, 1, 1, 1, 1, 1,
-0.6127018, -1.658033, -2.395594, 1, 1, 1, 1, 1,
-0.6094794, 0.3522172, -2.245703, 1, 1, 1, 1, 1,
-0.6086789, 1.847172, 0.1828142, 1, 1, 1, 1, 1,
-0.6078867, 0.6464645, -0.8850675, 1, 1, 1, 1, 1,
-0.6026861, 0.5818359, -2.959759, 1, 1, 1, 1, 1,
-0.6026514, 1.477391, -0.2972871, 1, 1, 1, 1, 1,
-0.6002321, 0.3411466, -1.235363, 1, 1, 1, 1, 1,
-0.5987642, 0.03434033, 0.0387664, 1, 1, 1, 1, 1,
-0.5899687, 0.4883686, -0.1421572, 1, 1, 1, 1, 1,
-0.5864406, 1.01238, -0.6416274, 1, 1, 1, 1, 1,
-0.5749736, 0.6126442, -1.530543, 1, 1, 1, 1, 1,
-0.5699479, -1.30827, -3.317169, 1, 1, 1, 1, 1,
-0.5659667, 0.5048851, -0.8546923, 0, 0, 1, 1, 1,
-0.5647712, 0.2816857, -0.3588671, 1, 0, 0, 1, 1,
-0.5626263, -0.04254228, -3.070756, 1, 0, 0, 1, 1,
-0.5611812, -1.738213, -2.259084, 1, 0, 0, 1, 1,
-0.5597583, -0.8712996, -2.398778, 1, 0, 0, 1, 1,
-0.5568799, -2.109885, -2.582671, 1, 0, 0, 1, 1,
-0.5515262, -0.8237115, -3.763736, 0, 0, 0, 1, 1,
-0.5510452, 0.2860464, -2.153872, 0, 0, 0, 1, 1,
-0.5495194, 0.6907514, -1.060582, 0, 0, 0, 1, 1,
-0.5425004, -0.3660092, -1.998826, 0, 0, 0, 1, 1,
-0.5405226, 1.282357, 0.5215896, 0, 0, 0, 1, 1,
-0.5355533, -1.887848, -3.186014, 0, 0, 0, 1, 1,
-0.5332057, 1.062354, -1.501315, 0, 0, 0, 1, 1,
-0.5322514, -0.2298582, -2.069688, 1, 1, 1, 1, 1,
-0.5290417, 0.5621718, -1.406415, 1, 1, 1, 1, 1,
-0.5236401, 0.4665579, -0.4821679, 1, 1, 1, 1, 1,
-0.5236351, 0.5571588, -0.9230839, 1, 1, 1, 1, 1,
-0.5198454, -0.3748969, -2.354825, 1, 1, 1, 1, 1,
-0.5184776, -1.152903, -1.145414, 1, 1, 1, 1, 1,
-0.5171621, -0.4155062, -3.117962, 1, 1, 1, 1, 1,
-0.5109654, 0.302941, -2.212128, 1, 1, 1, 1, 1,
-0.5103695, -0.6580372, 0.3250393, 1, 1, 1, 1, 1,
-0.5103638, 0.2851885, 0.07297113, 1, 1, 1, 1, 1,
-0.5099007, 0.9783945, -0.8169516, 1, 1, 1, 1, 1,
-0.5075775, -0.1088896, -2.264703, 1, 1, 1, 1, 1,
-0.5069061, -0.4335884, -0.2086454, 1, 1, 1, 1, 1,
-0.5068842, -1.919719, -0.4807327, 1, 1, 1, 1, 1,
-0.504033, 0.8777551, -2.13183, 1, 1, 1, 1, 1,
-0.5028669, -0.531076, -3.935358, 0, 0, 1, 1, 1,
-0.4977656, 0.8216535, -1.813669, 1, 0, 0, 1, 1,
-0.4946016, 0.545029, -1.69766, 1, 0, 0, 1, 1,
-0.4934145, 0.3514786, -0.1513612, 1, 0, 0, 1, 1,
-0.4919533, -0.4031109, -1.580168, 1, 0, 0, 1, 1,
-0.4849942, -0.955929, -2.25859, 1, 0, 0, 1, 1,
-0.4773692, -1.704786, -3.357329, 0, 0, 0, 1, 1,
-0.4770583, 0.03762598, -1.196613, 0, 0, 0, 1, 1,
-0.4767746, 0.6807789, -0.9872025, 0, 0, 0, 1, 1,
-0.4766634, -0.4062952, -2.093394, 0, 0, 0, 1, 1,
-0.4676338, -0.05005435, -1.604735, 0, 0, 0, 1, 1,
-0.4632637, 0.6443475, -0.6803629, 0, 0, 0, 1, 1,
-0.4613698, -0.1008673, -1.368054, 0, 0, 0, 1, 1,
-0.4585239, 1.776179, 1.050218, 1, 1, 1, 1, 1,
-0.455718, -1.870823, -1.834791, 1, 1, 1, 1, 1,
-0.4530616, 1.334623, -1.420524, 1, 1, 1, 1, 1,
-0.4520611, -0.06880297, -1.034824, 1, 1, 1, 1, 1,
-0.4519414, 2.196036, 0.7399179, 1, 1, 1, 1, 1,
-0.451383, 0.4537316, 0.3391127, 1, 1, 1, 1, 1,
-0.4505955, -0.2088213, -1.515508, 1, 1, 1, 1, 1,
-0.4491133, -1.375006, -2.265245, 1, 1, 1, 1, 1,
-0.4487116, -0.4225969, -3.413022, 1, 1, 1, 1, 1,
-0.4432212, -0.7977594, -3.471937, 1, 1, 1, 1, 1,
-0.4428755, -0.1011988, -0.98607, 1, 1, 1, 1, 1,
-0.4378991, 1.372017, -1.756236, 1, 1, 1, 1, 1,
-0.4335233, -0.1487984, -3.539154, 1, 1, 1, 1, 1,
-0.4279703, 1.757608, -0.6091815, 1, 1, 1, 1, 1,
-0.4261106, -0.2974408, -1.210727, 1, 1, 1, 1, 1,
-0.4254401, -0.03892729, -1.712221, 0, 0, 1, 1, 1,
-0.4214318, -1.270564, -0.4738696, 1, 0, 0, 1, 1,
-0.4209752, -0.3100889, -1.360875, 1, 0, 0, 1, 1,
-0.4184939, 0.2231427, 0.2174472, 1, 0, 0, 1, 1,
-0.4150262, 0.3744832, 1.576185, 1, 0, 0, 1, 1,
-0.4127329, 0.04166272, -3.234895, 1, 0, 0, 1, 1,
-0.4122841, 1.02021, -1.477311, 0, 0, 0, 1, 1,
-0.4078212, 0.01879334, -1.192003, 0, 0, 0, 1, 1,
-0.4066732, -0.2017553, -0.8796467, 0, 0, 0, 1, 1,
-0.4057297, 0.8105601, 1.569961, 0, 0, 0, 1, 1,
-0.4029354, 0.4778298, 0.2759086, 0, 0, 0, 1, 1,
-0.401351, -0.1714076, -2.478822, 0, 0, 0, 1, 1,
-0.3947695, -1.359507, -2.574234, 0, 0, 0, 1, 1,
-0.3937775, -0.5377858, -1.512277, 1, 1, 1, 1, 1,
-0.3935756, 0.3297748, -0.2715703, 1, 1, 1, 1, 1,
-0.3913386, -0.5879278, -3.255441, 1, 1, 1, 1, 1,
-0.387716, 0.3535232, -2.65614, 1, 1, 1, 1, 1,
-0.3868229, 0.5602006, 0.5139744, 1, 1, 1, 1, 1,
-0.3842291, -1.067587, -2.663386, 1, 1, 1, 1, 1,
-0.3810498, 1.897203, -0.9938115, 1, 1, 1, 1, 1,
-0.3802127, 1.158721, -0.7543041, 1, 1, 1, 1, 1,
-0.3769597, 1.175804, -0.6331725, 1, 1, 1, 1, 1,
-0.3719136, -1.326547, -3.026383, 1, 1, 1, 1, 1,
-0.3699714, 1.625902, 0.1625714, 1, 1, 1, 1, 1,
-0.3699328, 0.2847351, -2.050345, 1, 1, 1, 1, 1,
-0.3671401, 0.08298237, -0.1062045, 1, 1, 1, 1, 1,
-0.3670162, -0.8894664, -2.93738, 1, 1, 1, 1, 1,
-0.3658717, -0.2753938, -4.099155, 1, 1, 1, 1, 1,
-0.3658502, -0.5706305, -3.306534, 0, 0, 1, 1, 1,
-0.36585, -0.13108, -3.65278, 1, 0, 0, 1, 1,
-0.3654292, 1.081728, -1.105943, 1, 0, 0, 1, 1,
-0.359191, 0.5911506, -1.551249, 1, 0, 0, 1, 1,
-0.3516622, -1.013895, -3.332102, 1, 0, 0, 1, 1,
-0.3494116, -0.1962934, -0.9649258, 1, 0, 0, 1, 1,
-0.3409253, -0.8411412, -2.699671, 0, 0, 0, 1, 1,
-0.3356731, 1.031874, 0.002600691, 0, 0, 0, 1, 1,
-0.330823, -0.1018753, -1.859004, 0, 0, 0, 1, 1,
-0.3302271, -0.6322586, -2.462242, 0, 0, 0, 1, 1,
-0.3261844, 0.2020232, -0.06364878, 0, 0, 0, 1, 1,
-0.3260151, -1.771922, -2.914859, 0, 0, 0, 1, 1,
-0.320132, -1.394124, -3.555694, 0, 0, 0, 1, 1,
-0.3199966, -1.145716, -2.775347, 1, 1, 1, 1, 1,
-0.3176844, -0.6773124, -4.44617, 1, 1, 1, 1, 1,
-0.3150387, 0.6976788, -0.1609177, 1, 1, 1, 1, 1,
-0.312115, -0.6282102, -1.902437, 1, 1, 1, 1, 1,
-0.3056095, -0.2616965, -0.4030771, 1, 1, 1, 1, 1,
-0.3033495, -0.2616256, -1.539998, 1, 1, 1, 1, 1,
-0.2905349, -0.1855352, -2.963859, 1, 1, 1, 1, 1,
-0.290292, 1.208586, -1.182965, 1, 1, 1, 1, 1,
-0.2899153, 1.793259, -0.09731688, 1, 1, 1, 1, 1,
-0.2871721, 1.11532, 1.095152, 1, 1, 1, 1, 1,
-0.284722, 0.5104758, 0.5975661, 1, 1, 1, 1, 1,
-0.2836365, -1.605028, -1.892789, 1, 1, 1, 1, 1,
-0.2834523, -1.408646, -2.855511, 1, 1, 1, 1, 1,
-0.2816089, 1.399799, -0.6472135, 1, 1, 1, 1, 1,
-0.2811568, -0.2055876, -1.926841, 1, 1, 1, 1, 1,
-0.2808963, 1.205083, -1.890895, 0, 0, 1, 1, 1,
-0.2807726, 1.460873, -1.408404, 1, 0, 0, 1, 1,
-0.2770078, 0.3769649, -0.3791421, 1, 0, 0, 1, 1,
-0.2632549, -0.5598319, -3.886215, 1, 0, 0, 1, 1,
-0.2630968, 1.288887, 1.214307, 1, 0, 0, 1, 1,
-0.261689, -0.7603745, -4.270735, 1, 0, 0, 1, 1,
-0.2612468, -0.1077843, -2.150733, 0, 0, 0, 1, 1,
-0.2603266, -2.098272, -3.740789, 0, 0, 0, 1, 1,
-0.2587488, -1.691451, -3.026011, 0, 0, 0, 1, 1,
-0.2583135, 1.343361, -1.661664, 0, 0, 0, 1, 1,
-0.256488, 0.3747797, -0.8886606, 0, 0, 0, 1, 1,
-0.2495099, 0.0618311, -1.52603, 0, 0, 0, 1, 1,
-0.2492321, -0.1334541, -3.699955, 0, 0, 0, 1, 1,
-0.2488815, 0.4631903, -0.9840519, 1, 1, 1, 1, 1,
-0.2472006, -2.643826, -3.598121, 1, 1, 1, 1, 1,
-0.2469561, 1.231754, 0.0376408, 1, 1, 1, 1, 1,
-0.2456992, 1.595749, -0.8138363, 1, 1, 1, 1, 1,
-0.2408704, -0.1502748, -3.799802, 1, 1, 1, 1, 1,
-0.2390859, 0.647776, -1.092929, 1, 1, 1, 1, 1,
-0.2326393, 1.227395, -0.6312528, 1, 1, 1, 1, 1,
-0.2323199, -0.8799236, -1.512506, 1, 1, 1, 1, 1,
-0.2307706, -0.1717845, -2.896032, 1, 1, 1, 1, 1,
-0.228906, -0.5075877, -1.891092, 1, 1, 1, 1, 1,
-0.2286861, 0.4559659, -1.395971, 1, 1, 1, 1, 1,
-0.2280951, -1.415193, -3.092293, 1, 1, 1, 1, 1,
-0.2272266, 0.2216948, -0.8980343, 1, 1, 1, 1, 1,
-0.2264353, -0.9493086, -3.300773, 1, 1, 1, 1, 1,
-0.2255095, 0.2139706, -1.655249, 1, 1, 1, 1, 1,
-0.2252924, 0.7217549, 0.0733171, 0, 0, 1, 1, 1,
-0.2228202, -0.5593697, -0.8442308, 1, 0, 0, 1, 1,
-0.2140569, -0.9229356, -4.21237, 1, 0, 0, 1, 1,
-0.2117157, -0.9958382, -2.389051, 1, 0, 0, 1, 1,
-0.2104964, 0.528186, -1.434866, 1, 0, 0, 1, 1,
-0.2071045, -0.08675232, -1.541325, 1, 0, 0, 1, 1,
-0.2034208, 1.078405, -1.264242, 0, 0, 0, 1, 1,
-0.2033247, 0.4559895, -0.6941138, 0, 0, 0, 1, 1,
-0.1951994, 0.4765702, -0.6528474, 0, 0, 0, 1, 1,
-0.1942699, -0.6331356, -3.41615, 0, 0, 0, 1, 1,
-0.1937527, -0.0110761, -0.0832447, 0, 0, 0, 1, 1,
-0.1867658, 0.4915284, -0.618068, 0, 0, 0, 1, 1,
-0.1864061, -0.8459836, -1.854346, 0, 0, 0, 1, 1,
-0.1851368, -0.9631743, -2.294978, 1, 1, 1, 1, 1,
-0.180461, -2.621439, -3.509662, 1, 1, 1, 1, 1,
-0.1769623, -0.3819374, -3.848317, 1, 1, 1, 1, 1,
-0.1763723, 0.8224043, 0.3690112, 1, 1, 1, 1, 1,
-0.1754548, 0.5954891, 0.4423612, 1, 1, 1, 1, 1,
-0.1716101, 0.2983746, -1.402966, 1, 1, 1, 1, 1,
-0.170016, 1.168245, 0.05035802, 1, 1, 1, 1, 1,
-0.1664672, -2.055955, -4.833963, 1, 1, 1, 1, 1,
-0.1636059, -1.290155, -3.553969, 1, 1, 1, 1, 1,
-0.1621502, -0.3812685, -4.899415, 1, 1, 1, 1, 1,
-0.1621062, 0.3224392, 0.2433581, 1, 1, 1, 1, 1,
-0.1611179, -0.1863138, -2.786323, 1, 1, 1, 1, 1,
-0.1602258, 0.2933066, 0.6953612, 1, 1, 1, 1, 1,
-0.1587278, -0.3622482, -4.024422, 1, 1, 1, 1, 1,
-0.1567635, -1.921224, -3.02772, 1, 1, 1, 1, 1,
-0.1548338, -0.6416642, -2.769377, 0, 0, 1, 1, 1,
-0.150898, -0.8605486, -2.069397, 1, 0, 0, 1, 1,
-0.1506376, 2.711131, 1.436409, 1, 0, 0, 1, 1,
-0.1506364, 0.9355311, -0.8330455, 1, 0, 0, 1, 1,
-0.1496513, 2.054287, 1.225111, 1, 0, 0, 1, 1,
-0.149367, 0.005341395, -3.305556, 1, 0, 0, 1, 1,
-0.145177, -2.064826, -3.096356, 0, 0, 0, 1, 1,
-0.1436841, -0.1055958, -0.9499996, 0, 0, 0, 1, 1,
-0.1417852, 1.459736, 1.021663, 0, 0, 0, 1, 1,
-0.141128, -0.8471296, -3.569131, 0, 0, 0, 1, 1,
-0.1356669, 0.8556694, 0.4213116, 0, 0, 0, 1, 1,
-0.1307253, 0.5937459, 1.133929, 0, 0, 0, 1, 1,
-0.1183747, 0.9289014, -0.1133961, 0, 0, 0, 1, 1,
-0.1170913, 1.236917, -1.653198, 1, 1, 1, 1, 1,
-0.1051065, -0.5325424, -1.926771, 1, 1, 1, 1, 1,
-0.1042544, -2.246202, -1.810628, 1, 1, 1, 1, 1,
-0.1013555, 2.335098, -0.08776952, 1, 1, 1, 1, 1,
-0.1006904, -0.376013, -5.369556, 1, 1, 1, 1, 1,
-0.09888218, -0.4128571, -3.482158, 1, 1, 1, 1, 1,
-0.09421464, 2.12225, 0.8758572, 1, 1, 1, 1, 1,
-0.09386137, 1.112041, -1.010303, 1, 1, 1, 1, 1,
-0.09368165, -0.2892625, -2.026991, 1, 1, 1, 1, 1,
-0.09010546, -0.09342121, -2.187183, 1, 1, 1, 1, 1,
-0.08859952, 1.154153, -0.4144427, 1, 1, 1, 1, 1,
-0.08820935, -0.5841104, -5.009026, 1, 1, 1, 1, 1,
-0.0863406, 0.229886, -2.310291, 1, 1, 1, 1, 1,
-0.08365761, -0.6424413, -3.773854, 1, 1, 1, 1, 1,
-0.08182578, 0.8553004, 0.2315549, 1, 1, 1, 1, 1,
-0.08153931, -1.875431, -4.69593, 0, 0, 1, 1, 1,
-0.06977008, -0.6111116, -2.730194, 1, 0, 0, 1, 1,
-0.06604838, 0.1704571, 0.370297, 1, 0, 0, 1, 1,
-0.06355201, 2.602385, -0.5367978, 1, 0, 0, 1, 1,
-0.0632702, 0.3667426, 1.969612, 1, 0, 0, 1, 1,
-0.06203662, 1.533204, 0.8869085, 1, 0, 0, 1, 1,
-0.06171994, 0.2951223, -2.27101, 0, 0, 0, 1, 1,
-0.06091412, 0.6936936, -1.117685, 0, 0, 0, 1, 1,
-0.05537394, 1.188739, -0.9985838, 0, 0, 0, 1, 1,
-0.05154853, -0.05309047, -2.804065, 0, 0, 0, 1, 1,
-0.04949524, -0.6286302, -2.440833, 0, 0, 0, 1, 1,
-0.0493315, 0.3178482, 0.4781244, 0, 0, 0, 1, 1,
-0.04718752, 0.1016438, -1.078684, 0, 0, 0, 1, 1,
-0.04524508, 0.4733034, 0.1352271, 1, 1, 1, 1, 1,
-0.04151043, -1.832862, -3.423888, 1, 1, 1, 1, 1,
-0.04149286, 0.07897288, -2.877894, 1, 1, 1, 1, 1,
-0.04043152, 0.1492649, -0.6431592, 1, 1, 1, 1, 1,
-0.03444982, 1.776191, 0.8624477, 1, 1, 1, 1, 1,
-0.03395442, -0.09053496, -3.070346, 1, 1, 1, 1, 1,
-0.02213394, -0.6542799, -1.755551, 1, 1, 1, 1, 1,
-0.01952243, 0.02376058, 0.09572156, 1, 1, 1, 1, 1,
-0.01933845, 0.3844349, 1.668681, 1, 1, 1, 1, 1,
-0.01688746, -1.136011, -3.664614, 1, 1, 1, 1, 1,
-0.0165468, -1.46837, -2.055467, 1, 1, 1, 1, 1,
-0.01512996, -1.08015, -3.700041, 1, 1, 1, 1, 1,
-0.006789833, -1.181296, -3.485829, 1, 1, 1, 1, 1,
-0.005726987, 0.6347792, -0.4040626, 1, 1, 1, 1, 1,
0.007587725, 1.786868, -0.642041, 1, 1, 1, 1, 1,
0.01018492, -1.263126, 3.183063, 0, 0, 1, 1, 1,
0.01100023, 0.5315319, -1.424452, 1, 0, 0, 1, 1,
0.01185367, 1.397491, -1.066808, 1, 0, 0, 1, 1,
0.01446144, 0.2115638, -0.5031863, 1, 0, 0, 1, 1,
0.02298028, 1.521846, 1.779387, 1, 0, 0, 1, 1,
0.0230492, -0.1687238, 1.39169, 1, 0, 0, 1, 1,
0.023698, 0.7880146, 1.08615, 0, 0, 0, 1, 1,
0.02634444, 0.1048473, -0.6279884, 0, 0, 0, 1, 1,
0.03028425, -0.1156957, 2.508753, 0, 0, 0, 1, 1,
0.03255799, -0.7721165, 4.228002, 0, 0, 0, 1, 1,
0.03423749, 1.310406, 0.04237279, 0, 0, 0, 1, 1,
0.03791547, -0.4344389, 4.228952, 0, 0, 0, 1, 1,
0.04275712, -0.156541, 2.121123, 0, 0, 0, 1, 1,
0.04406915, -0.9617327, 1.939895, 1, 1, 1, 1, 1,
0.04430452, -1.107583, 1.986424, 1, 1, 1, 1, 1,
0.0447657, 0.5782956, -1.216049, 1, 1, 1, 1, 1,
0.05171523, -0.6601092, 4.19032, 1, 1, 1, 1, 1,
0.05904901, 0.8139272, -0.3453086, 1, 1, 1, 1, 1,
0.06101019, 0.9097728, 1.634778, 1, 1, 1, 1, 1,
0.06410004, 0.6558642, 0.3845212, 1, 1, 1, 1, 1,
0.06505924, -1.419257, 2.273908, 1, 1, 1, 1, 1,
0.06550834, 1.774623, -1.621777, 1, 1, 1, 1, 1,
0.06568451, 1.509893, 0.6293933, 1, 1, 1, 1, 1,
0.06620523, -0.5385131, 2.170575, 1, 1, 1, 1, 1,
0.06739096, 0.4262602, 3.339065, 1, 1, 1, 1, 1,
0.07134453, 0.7725126, -1.532312, 1, 1, 1, 1, 1,
0.07352547, 0.09429989, 0.7329008, 1, 1, 1, 1, 1,
0.07865643, 0.215866, 1.163994, 1, 1, 1, 1, 1,
0.07944372, 0.21098, 0.006562328, 0, 0, 1, 1, 1,
0.07945489, 2.840997, 1.134109, 1, 0, 0, 1, 1,
0.07955916, 0.08894207, 1.300485, 1, 0, 0, 1, 1,
0.08124877, 1.623739, 0.4858654, 1, 0, 0, 1, 1,
0.08866399, 0.1361929, 2.126626, 1, 0, 0, 1, 1,
0.0921361, -0.4850791, 4.543541, 1, 0, 0, 1, 1,
0.09278177, 1.642742, -1.069005, 0, 0, 0, 1, 1,
0.09282281, -0.4030938, 3.775804, 0, 0, 0, 1, 1,
0.09477792, -0.4179952, 2.976027, 0, 0, 0, 1, 1,
0.09601233, -0.3085966, 2.428368, 0, 0, 0, 1, 1,
0.09845479, 0.3511222, 0.1310996, 0, 0, 0, 1, 1,
0.1020618, -0.9527445, 2.654169, 0, 0, 0, 1, 1,
0.1025982, 0.5883887, -0.6032083, 0, 0, 0, 1, 1,
0.1067252, -0.5421445, 3.959056, 1, 1, 1, 1, 1,
0.1081963, 1.118218, -0.9295648, 1, 1, 1, 1, 1,
0.108971, -0.1673509, 1.520978, 1, 1, 1, 1, 1,
0.1099981, -1.831038, 3.153501, 1, 1, 1, 1, 1,
0.1102188, 0.8190596, -1.461345, 1, 1, 1, 1, 1,
0.1179856, -1.081186, -0.2312156, 1, 1, 1, 1, 1,
0.1215866, 1.178612, -0.9594663, 1, 1, 1, 1, 1,
0.1238862, -1.402192, 3.11563, 1, 1, 1, 1, 1,
0.1239981, -0.7975165, 2.942244, 1, 1, 1, 1, 1,
0.1267539, -0.7190877, 2.4003, 1, 1, 1, 1, 1,
0.1280923, 1.117601, 0.8546059, 1, 1, 1, 1, 1,
0.1300637, 0.22057, 1.544385, 1, 1, 1, 1, 1,
0.1332549, -0.2034367, 2.255466, 1, 1, 1, 1, 1,
0.1341093, -0.003083163, 1.195794, 1, 1, 1, 1, 1,
0.1341172, 0.1480941, 0.8224664, 1, 1, 1, 1, 1,
0.1342405, 1.101675, 1.481616, 0, 0, 1, 1, 1,
0.1406185, 1.013424, 0.4812685, 1, 0, 0, 1, 1,
0.1408447, -0.2687893, 1.617598, 1, 0, 0, 1, 1,
0.1411446, 0.6083531, 0.1690311, 1, 0, 0, 1, 1,
0.1446963, 0.4863843, -0.6057206, 1, 0, 0, 1, 1,
0.1447086, 2.468071, -0.5809494, 1, 0, 0, 1, 1,
0.1490244, -1.638692, 3.445268, 0, 0, 0, 1, 1,
0.1514644, 0.2661233, -0.3369643, 0, 0, 0, 1, 1,
0.153565, 0.3515807, -0.03205751, 0, 0, 0, 1, 1,
0.1551534, 0.3056852, 1.356798, 0, 0, 0, 1, 1,
0.1553265, 0.9161249, 0.6696511, 0, 0, 0, 1, 1,
0.1596775, 0.6275401, 0.2780562, 0, 0, 0, 1, 1,
0.1606356, -0.7428225, 2.35101, 0, 0, 0, 1, 1,
0.1629116, -0.8626888, 2.073633, 1, 1, 1, 1, 1,
0.163185, -0.255032, 3.571383, 1, 1, 1, 1, 1,
0.168993, -1.502965, 3.462574, 1, 1, 1, 1, 1,
0.1696569, -0.465634, 3.75321, 1, 1, 1, 1, 1,
0.1713329, -0.08040456, 2.034456, 1, 1, 1, 1, 1,
0.1716852, 1.031922, 0.8301048, 1, 1, 1, 1, 1,
0.1725674, -0.2530802, 3.546145, 1, 1, 1, 1, 1,
0.1775278, -1.197856, 2.644894, 1, 1, 1, 1, 1,
0.1781276, -1.235054, 4.10643, 1, 1, 1, 1, 1,
0.1860259, -1.263415, 2.814292, 1, 1, 1, 1, 1,
0.1877249, 0.04898988, 1.494736, 1, 1, 1, 1, 1,
0.1898936, 1.35088, 1.44825, 1, 1, 1, 1, 1,
0.1902526, 0.1311641, 1.656343, 1, 1, 1, 1, 1,
0.1922474, 0.2909412, 1.672477, 1, 1, 1, 1, 1,
0.1939346, -0.2803848, 3.816788, 1, 1, 1, 1, 1,
0.1942619, 0.5595812, -0.6114955, 0, 0, 1, 1, 1,
0.1996924, 0.4940616, 1.867782, 1, 0, 0, 1, 1,
0.2013782, -1.057436, 3.65711, 1, 0, 0, 1, 1,
0.2043166, -0.4638158, 2.497061, 1, 0, 0, 1, 1,
0.2082061, -0.7291244, 0.9786623, 1, 0, 0, 1, 1,
0.2090014, -0.09071452, 2.27645, 1, 0, 0, 1, 1,
0.2099668, 0.9362031, -0.3638795, 0, 0, 0, 1, 1,
0.2115189, -0.8651048, 2.179855, 0, 0, 0, 1, 1,
0.214422, 0.8405657, 0.288472, 0, 0, 0, 1, 1,
0.220358, 2.757341, 1.119807, 0, 0, 0, 1, 1,
0.2246578, -0.4917916, 2.009183, 0, 0, 0, 1, 1,
0.2268817, 0.6084368, 2.538314, 0, 0, 0, 1, 1,
0.227232, 0.6037597, 1.81365, 0, 0, 0, 1, 1,
0.2286737, 0.5169913, 2.118242, 1, 1, 1, 1, 1,
0.2358446, 0.6343278, 0.5091293, 1, 1, 1, 1, 1,
0.2378743, 2.097657, 0.6251668, 1, 1, 1, 1, 1,
0.2404547, 0.7449363, -0.1914837, 1, 1, 1, 1, 1,
0.2426233, -0.7597737, 2.057504, 1, 1, 1, 1, 1,
0.2484645, 1.016579, -1.667995, 1, 1, 1, 1, 1,
0.2500453, -2.202325, 3.355343, 1, 1, 1, 1, 1,
0.2515164, -1.057813, 3.344178, 1, 1, 1, 1, 1,
0.2537377, 1.198055, 0.3333497, 1, 1, 1, 1, 1,
0.254761, 1.885899, 2.002037, 1, 1, 1, 1, 1,
0.255342, -0.5420525, 1.469831, 1, 1, 1, 1, 1,
0.257584, 0.002672444, 0.6088887, 1, 1, 1, 1, 1,
0.2641017, 0.02057019, -0.5937663, 1, 1, 1, 1, 1,
0.2675438, -0.4528261, 3.768442, 1, 1, 1, 1, 1,
0.2722401, -0.2071654, 0.4156172, 1, 1, 1, 1, 1,
0.2743285, 1.169006, -0.7189507, 0, 0, 1, 1, 1,
0.2793385, 0.8943713, 2.154259, 1, 0, 0, 1, 1,
0.2824014, 0.1555624, 1.425851, 1, 0, 0, 1, 1,
0.2830363, 1.516335, -1.208493, 1, 0, 0, 1, 1,
0.2836899, 0.193547, 0.8664669, 1, 0, 0, 1, 1,
0.2863815, 0.6282517, 0.292772, 1, 0, 0, 1, 1,
0.2896504, -1.100615, 3.080617, 0, 0, 0, 1, 1,
0.2963575, -2.360597, 3.878783, 0, 0, 0, 1, 1,
0.2984983, -0.2729135, 2.405561, 0, 0, 0, 1, 1,
0.300859, -0.2934225, 2.206462, 0, 0, 0, 1, 1,
0.3013897, -1.059977, 4.017199, 0, 0, 0, 1, 1,
0.3016573, 1.467736, 0.9897459, 0, 0, 0, 1, 1,
0.3142633, 0.395302, -0.1311673, 0, 0, 0, 1, 1,
0.3163086, 1.007221, 0.5951944, 1, 1, 1, 1, 1,
0.3218673, -0.8853251, 3.272917, 1, 1, 1, 1, 1,
0.3251258, -0.07873827, 1.927015, 1, 1, 1, 1, 1,
0.3301775, 0.4141433, -0.3922873, 1, 1, 1, 1, 1,
0.3316579, -0.2552729, 2.614177, 1, 1, 1, 1, 1,
0.3343028, 0.7815756, 0.3165378, 1, 1, 1, 1, 1,
0.3349043, 0.5313388, -0.3549868, 1, 1, 1, 1, 1,
0.3399786, 0.5574341, 0.3327705, 1, 1, 1, 1, 1,
0.340462, 0.4323696, 0.3048137, 1, 1, 1, 1, 1,
0.3411143, 0.7049227, 0.8773777, 1, 1, 1, 1, 1,
0.3460625, -0.2781406, 3.292004, 1, 1, 1, 1, 1,
0.3475301, -1.596778, 0.8805056, 1, 1, 1, 1, 1,
0.3536666, 1.309355, -0.4443929, 1, 1, 1, 1, 1,
0.3592947, -1.315053, 2.095255, 1, 1, 1, 1, 1,
0.3642497, 0.6894827, 0.6048489, 1, 1, 1, 1, 1,
0.3681134, 0.2467667, 0.8475869, 0, 0, 1, 1, 1,
0.3717208, 0.1695064, 2.359571, 1, 0, 0, 1, 1,
0.372054, -0.2041539, 1.022063, 1, 0, 0, 1, 1,
0.3788201, -0.08464772, 1.945799, 1, 0, 0, 1, 1,
0.3809315, 0.2343584, 0.7897879, 1, 0, 0, 1, 1,
0.3811559, -1.712723, 2.550663, 1, 0, 0, 1, 1,
0.3894717, -1.400493, 3.653445, 0, 0, 0, 1, 1,
0.3906351, 0.7943194, 1.205764, 0, 0, 0, 1, 1,
0.3907582, 1.56227, 1.767337, 0, 0, 0, 1, 1,
0.3941253, 0.8807986, 1.338596, 0, 0, 0, 1, 1,
0.3950206, -1.362182, 2.97472, 0, 0, 0, 1, 1,
0.3963131, -1.399176, 3.746625, 0, 0, 0, 1, 1,
0.4001865, 2.112914, 0.01739607, 0, 0, 0, 1, 1,
0.4018562, -0.2266543, 2.753647, 1, 1, 1, 1, 1,
0.4091155, -1.555418, 3.677099, 1, 1, 1, 1, 1,
0.4096598, -0.04182037, 0.9131568, 1, 1, 1, 1, 1,
0.4098005, 0.7570485, 0.8979982, 1, 1, 1, 1, 1,
0.4116945, 0.5074983, 0.5705292, 1, 1, 1, 1, 1,
0.4138492, -0.8641582, 3.26474, 1, 1, 1, 1, 1,
0.4161533, 0.6552483, 1.110176, 1, 1, 1, 1, 1,
0.4165633, -2.130838, 4.105991, 1, 1, 1, 1, 1,
0.4199629, 0.6591569, 0.609624, 1, 1, 1, 1, 1,
0.4308929, -0.05438306, 0.3878666, 1, 1, 1, 1, 1,
0.4318149, -0.5766553, 4.402343, 1, 1, 1, 1, 1,
0.4375156, 0.3036954, -0.03234684, 1, 1, 1, 1, 1,
0.4406456, -0.8469695, 2.126134, 1, 1, 1, 1, 1,
0.442093, -0.07872728, 0.7679676, 1, 1, 1, 1, 1,
0.4459484, 1.493028, 0.0411649, 1, 1, 1, 1, 1,
0.4547283, 1.046959, 1.776557, 0, 0, 1, 1, 1,
0.4555929, 0.1819377, 2.215611, 1, 0, 0, 1, 1,
0.4630375, -0.4272772, 2.209823, 1, 0, 0, 1, 1,
0.4669758, -0.8640404, 2.373629, 1, 0, 0, 1, 1,
0.4677759, 0.8041166, -0.1974138, 1, 0, 0, 1, 1,
0.4707031, 0.4609824, 1.333777, 1, 0, 0, 1, 1,
0.475994, 1.06108, 0.3268852, 0, 0, 0, 1, 1,
0.4775684, -1.124888, 4.400053, 0, 0, 0, 1, 1,
0.481189, 0.1599494, 1.963081, 0, 0, 0, 1, 1,
0.4828259, 0.9274049, 0.222589, 0, 0, 0, 1, 1,
0.4840029, -0.8795852, 3.211604, 0, 0, 0, 1, 1,
0.4840034, 0.1841928, 2.083644, 0, 0, 0, 1, 1,
0.4843618, -0.1167829, 1.965662, 0, 0, 0, 1, 1,
0.4902526, 0.9779549, -0.4351572, 1, 1, 1, 1, 1,
0.4941723, -0.2944414, 1.73038, 1, 1, 1, 1, 1,
0.4975719, 0.3664639, 1.232414, 1, 1, 1, 1, 1,
0.507578, -0.8631339, 2.846928, 1, 1, 1, 1, 1,
0.5075997, -0.6701243, 3.741574, 1, 1, 1, 1, 1,
0.511588, 0.6553901, 1.509718, 1, 1, 1, 1, 1,
0.5144975, 0.09315203, 0.9308335, 1, 1, 1, 1, 1,
0.5180111, 0.2846975, 1.265227, 1, 1, 1, 1, 1,
0.520336, 1.165514, -0.3395989, 1, 1, 1, 1, 1,
0.524434, -0.07325713, 2.219046, 1, 1, 1, 1, 1,
0.5289235, 1.601488, 1.77439, 1, 1, 1, 1, 1,
0.5291213, 0.812273, 0.7977543, 1, 1, 1, 1, 1,
0.5352326, -1.461814, 3.275155, 1, 1, 1, 1, 1,
0.5352954, 2.29518, 0.6168845, 1, 1, 1, 1, 1,
0.5353993, 2.375795, 0.1218384, 1, 1, 1, 1, 1,
0.5357207, -2.192861, 2.168083, 0, 0, 1, 1, 1,
0.537509, -0.6648741, 4.040154, 1, 0, 0, 1, 1,
0.5517466, -0.09776028, 2.811878, 1, 0, 0, 1, 1,
0.553166, 0.730541, -0.0628801, 1, 0, 0, 1, 1,
0.5539747, -0.5895511, 1.336929, 1, 0, 0, 1, 1,
0.5594102, 0.01873893, -0.3600465, 1, 0, 0, 1, 1,
0.565243, -0.330009, 2.819366, 0, 0, 0, 1, 1,
0.5655035, -0.2437474, 2.961046, 0, 0, 0, 1, 1,
0.5683857, 0.3625324, -0.08843763, 0, 0, 0, 1, 1,
0.5798193, 0.9142997, 1.286842, 0, 0, 0, 1, 1,
0.5822747, -0.1573411, 2.40932, 0, 0, 0, 1, 1,
0.582446, 0.9542412, 1.921272, 0, 0, 0, 1, 1,
0.5848832, -0.9919901, 1.900573, 0, 0, 0, 1, 1,
0.5867547, -0.5957857, 3.0478, 1, 1, 1, 1, 1,
0.5876234, -0.3487194, 1.176258, 1, 1, 1, 1, 1,
0.5902989, -0.01486567, 1.111679, 1, 1, 1, 1, 1,
0.5908561, 1.660619, 0.6412088, 1, 1, 1, 1, 1,
0.5923331, -0.8153986, 2.429494, 1, 1, 1, 1, 1,
0.5966885, 0.4157804, 1.328101, 1, 1, 1, 1, 1,
0.6079122, 1.097122, 1.293107, 1, 1, 1, 1, 1,
0.6158819, -0.9142366, 3.707222, 1, 1, 1, 1, 1,
0.6293498, -0.07936029, 0.816677, 1, 1, 1, 1, 1,
0.6303075, 0.2308756, 0.815909, 1, 1, 1, 1, 1,
0.6403778, 0.5601531, 0.3299399, 1, 1, 1, 1, 1,
0.6496385, -1.439005, 3.622852, 1, 1, 1, 1, 1,
0.6506842, 1.085652, 2.258025, 1, 1, 1, 1, 1,
0.6520782, 0.564517, 1.502099, 1, 1, 1, 1, 1,
0.6545506, 1.836388, -0.5391511, 1, 1, 1, 1, 1,
0.6552286, -0.4863979, 2.981538, 0, 0, 1, 1, 1,
0.6691849, -1.291169, 2.629318, 1, 0, 0, 1, 1,
0.6747742, -0.110353, 2.475254, 1, 0, 0, 1, 1,
0.6755275, 0.03946074, -0.8754033, 1, 0, 0, 1, 1,
0.6771765, -0.3695064, 3.032512, 1, 0, 0, 1, 1,
0.6786454, 0.4482689, 0.9324186, 1, 0, 0, 1, 1,
0.6892133, 0.5424153, 0.4279466, 0, 0, 0, 1, 1,
0.6910973, 1.03002, 0.6262143, 0, 0, 0, 1, 1,
0.7007406, -0.4358768, 1.395014, 0, 0, 0, 1, 1,
0.7027109, -0.01213244, 0.8479609, 0, 0, 0, 1, 1,
0.7037011, -0.3477568, 0.7799727, 0, 0, 0, 1, 1,
0.7053171, -1.445416, 3.805415, 0, 0, 0, 1, 1,
0.7108331, 0.7949401, 1.349777, 0, 0, 0, 1, 1,
0.7140569, 1.241901, 1.27497, 1, 1, 1, 1, 1,
0.7164686, 0.1698363, 0.3796625, 1, 1, 1, 1, 1,
0.7180951, 0.04195422, 1.429178, 1, 1, 1, 1, 1,
0.7199036, -0.5789573, 2.626528, 1, 1, 1, 1, 1,
0.7215295, 0.343021, 0.5482678, 1, 1, 1, 1, 1,
0.7240621, -0.3145029, 2.268582, 1, 1, 1, 1, 1,
0.7248986, 1.121141, 1.002913, 1, 1, 1, 1, 1,
0.7254732, -2.261284, 2.423377, 1, 1, 1, 1, 1,
0.7269259, 0.7790148, 0.9412426, 1, 1, 1, 1, 1,
0.7284846, 1.696715, 1.624091, 1, 1, 1, 1, 1,
0.7296025, 0.3020224, 1.8549, 1, 1, 1, 1, 1,
0.7301465, 0.5694799, 0.9729642, 1, 1, 1, 1, 1,
0.7326451, 0.7485411, 1.780992, 1, 1, 1, 1, 1,
0.7390683, -1.12008, 2.635913, 1, 1, 1, 1, 1,
0.7403407, 0.760742, 1.169654, 1, 1, 1, 1, 1,
0.741671, -2.285378, 2.510313, 0, 0, 1, 1, 1,
0.7460239, -0.1286113, 0.2350969, 1, 0, 0, 1, 1,
0.7528572, 0.1142978, 0.8632183, 1, 0, 0, 1, 1,
0.7543231, 0.9179319, 0.8851333, 1, 0, 0, 1, 1,
0.7558451, -0.2169076, 1.342439, 1, 0, 0, 1, 1,
0.7575143, 0.4399911, 0.9580845, 1, 0, 0, 1, 1,
0.7587416, 1.034006, 0.2539567, 0, 0, 0, 1, 1,
0.7678612, 0.2113982, -0.5852491, 0, 0, 0, 1, 1,
0.7719764, -0.6286069, 2.301922, 0, 0, 0, 1, 1,
0.7735412, 0.04974689, 0.5700285, 0, 0, 0, 1, 1,
0.7741921, -0.3554022, 2.306992, 0, 0, 0, 1, 1,
0.7826104, 0.8335497, 1.673132, 0, 0, 0, 1, 1,
0.789414, -1.294887, 3.882221, 0, 0, 0, 1, 1,
0.793053, -1.271868, 3.070323, 1, 1, 1, 1, 1,
0.7931625, -1.833069, 3.086551, 1, 1, 1, 1, 1,
0.8004749, -0.5012877, 3.147998, 1, 1, 1, 1, 1,
0.8041204, 0.9106655, 0.664299, 1, 1, 1, 1, 1,
0.8062726, 0.9882102, 0.198655, 1, 1, 1, 1, 1,
0.8072784, 0.7989131, 0.7024041, 1, 1, 1, 1, 1,
0.8093315, -1.466099, 0.1108569, 1, 1, 1, 1, 1,
0.8102126, -0.4095201, 2.463836, 1, 1, 1, 1, 1,
0.8231575, -0.8019301, 2.519986, 1, 1, 1, 1, 1,
0.8261504, 1.930637, 0.7422376, 1, 1, 1, 1, 1,
0.8277802, 0.9526054, -0.6140377, 1, 1, 1, 1, 1,
0.829783, -0.480604, 2.875185, 1, 1, 1, 1, 1,
0.8312107, 1.275846, 1.794683, 1, 1, 1, 1, 1,
0.8319181, 0.09841238, 1.939192, 1, 1, 1, 1, 1,
0.8334714, -0.9431976, 1.46787, 1, 1, 1, 1, 1,
0.8345596, -0.6709492, 4.232817, 0, 0, 1, 1, 1,
0.8359898, -0.9388514, 2.566745, 1, 0, 0, 1, 1,
0.8374171, -0.4301859, 0.9757197, 1, 0, 0, 1, 1,
0.8381558, -0.3881288, 1.51187, 1, 0, 0, 1, 1,
0.8386456, 0.1897532, 0.7328823, 1, 0, 0, 1, 1,
0.8470098, 0.03856253, -0.6435029, 1, 0, 0, 1, 1,
0.849716, 0.3143823, 1.313713, 0, 0, 0, 1, 1,
0.8518794, -2.22938, 1.174689, 0, 0, 0, 1, 1,
0.8546209, 0.6019224, 2.115878, 0, 0, 0, 1, 1,
0.8622921, -0.1675401, 2.385751, 0, 0, 0, 1, 1,
0.8652776, -2.155967, 1.789659, 0, 0, 0, 1, 1,
0.8695344, -1.438122, 5.246722, 0, 0, 0, 1, 1,
0.8729387, -0.04816374, 1.622842, 0, 0, 0, 1, 1,
0.8826532, -0.3085068, 0.8450398, 1, 1, 1, 1, 1,
0.8832369, -0.2785222, 1.234523, 1, 1, 1, 1, 1,
0.8834308, -0.3452604, 2.028671, 1, 1, 1, 1, 1,
0.8857139, -0.0847579, 1.248275, 1, 1, 1, 1, 1,
0.8863127, 0.8280748, 1.242586, 1, 1, 1, 1, 1,
0.8871623, 1.321705, 0.2010317, 1, 1, 1, 1, 1,
0.8876708, -1.21619, 2.285683, 1, 1, 1, 1, 1,
0.8917193, -1.337274, 1.598651, 1, 1, 1, 1, 1,
0.895943, -1.813982, 3.182166, 1, 1, 1, 1, 1,
0.900419, 0.9154384, 2.466051, 1, 1, 1, 1, 1,
0.9068495, -2.359672, 3.315817, 1, 1, 1, 1, 1,
0.920581, 0.1361682, 1.715065, 1, 1, 1, 1, 1,
0.9217516, -0.6714801, 4.694879, 1, 1, 1, 1, 1,
0.9224834, -0.4022202, 1.391117, 1, 1, 1, 1, 1,
0.9266466, 1.150761, 1.231279, 1, 1, 1, 1, 1,
0.9299711, 0.4371956, 2.053512, 0, 0, 1, 1, 1,
0.9324253, -1.123445, 1.950769, 1, 0, 0, 1, 1,
0.9349187, -0.03995952, 1.28146, 1, 0, 0, 1, 1,
0.9378759, 1.619931, -0.2690924, 1, 0, 0, 1, 1,
0.9395922, -0.0469125, 1.25405, 1, 0, 0, 1, 1,
0.9429907, 0.3096939, 2.113252, 1, 0, 0, 1, 1,
0.9451672, -0.3331033, 4.033296, 0, 0, 0, 1, 1,
0.9499674, 0.07126041, 1.808043, 0, 0, 0, 1, 1,
0.9503807, -0.1778036, 0.4753085, 0, 0, 0, 1, 1,
0.9512619, 0.5657679, 1.69325, 0, 0, 0, 1, 1,
0.9513497, 0.7934535, 1.692815, 0, 0, 0, 1, 1,
0.9565231, 0.7455981, 1.399826, 0, 0, 0, 1, 1,
0.9571935, -0.2296686, 2.013828, 0, 0, 0, 1, 1,
0.9593951, 1.838867, 0.3385369, 1, 1, 1, 1, 1,
0.9595634, 0.643666, 0.2272777, 1, 1, 1, 1, 1,
0.9651918, 0.3543247, 2.028509, 1, 1, 1, 1, 1,
0.9702904, 1.397305, 0.3862525, 1, 1, 1, 1, 1,
0.9748629, -1.763184, 2.630194, 1, 1, 1, 1, 1,
0.9814849, -0.748936, 1.976727, 1, 1, 1, 1, 1,
0.9883572, -0.8028135, 2.30219, 1, 1, 1, 1, 1,
0.9901637, 0.4994149, 2.05522, 1, 1, 1, 1, 1,
0.9905751, 0.4741327, 2.296874, 1, 1, 1, 1, 1,
0.9945762, -0.6392334, 4.052308, 1, 1, 1, 1, 1,
1.003164, 0.8591022, 0.6841679, 1, 1, 1, 1, 1,
1.003865, 0.5070821, 1.277659, 1, 1, 1, 1, 1,
1.015428, 1.266149, 1.355901, 1, 1, 1, 1, 1,
1.022872, 0.8714254, 1.747334, 1, 1, 1, 1, 1,
1.031375, -0.7466589, 2.215321, 1, 1, 1, 1, 1,
1.033413, 0.4463117, 1.994827, 0, 0, 1, 1, 1,
1.038072, -0.7647171, 3.966672, 1, 0, 0, 1, 1,
1.045042, 0.409626, 0.758324, 1, 0, 0, 1, 1,
1.045328, 1.520118, -0.1960236, 1, 0, 0, 1, 1,
1.045752, 0.0335826, 2.316599, 1, 0, 0, 1, 1,
1.06375, -0.2846327, 3.019661, 1, 0, 0, 1, 1,
1.074672, -0.3622567, 1.86655, 0, 0, 0, 1, 1,
1.091902, -1.550843, 1.443626, 0, 0, 0, 1, 1,
1.100769, 0.6490556, 1.64657, 0, 0, 0, 1, 1,
1.101997, -1.321069, 2.804809, 0, 0, 0, 1, 1,
1.102015, 1.776297, 1.389131, 0, 0, 0, 1, 1,
1.104444, -0.4841939, 3.057854, 0, 0, 0, 1, 1,
1.106277, -1.04485, 2.8097, 0, 0, 0, 1, 1,
1.107141, -0.1447985, 3.236047, 1, 1, 1, 1, 1,
1.112082, -0.8667341, 1.723562, 1, 1, 1, 1, 1,
1.11291, -0.5103648, 0.7790747, 1, 1, 1, 1, 1,
1.114425, 1.318836, -0.8304566, 1, 1, 1, 1, 1,
1.114882, 0.7644179, 1.175454, 1, 1, 1, 1, 1,
1.120458, -1.689627, 1.183749, 1, 1, 1, 1, 1,
1.12157, -0.9748388, 2.307467, 1, 1, 1, 1, 1,
1.125928, 0.2653958, 1.945957, 1, 1, 1, 1, 1,
1.131605, -0.9547689, 2.034532, 1, 1, 1, 1, 1,
1.133408, 1.391639, 1.807438, 1, 1, 1, 1, 1,
1.134197, 1.113427, 1.749818, 1, 1, 1, 1, 1,
1.138243, -0.1165788, 0.3266655, 1, 1, 1, 1, 1,
1.138513, 0.05037418, 1.003174, 1, 1, 1, 1, 1,
1.13921, -0.8662009, 2.010907, 1, 1, 1, 1, 1,
1.146236, -0.01669616, 1.492809, 1, 1, 1, 1, 1,
1.153705, 0.7546468, 2.708101, 0, 0, 1, 1, 1,
1.155007, -0.8517171, 1.973568, 1, 0, 0, 1, 1,
1.15642, -0.427027, 2.660491, 1, 0, 0, 1, 1,
1.15862, -0.8562927, 1.557143, 1, 0, 0, 1, 1,
1.16324, -0.05426084, 2.677606, 1, 0, 0, 1, 1,
1.165492, -0.5335906, 2.540533, 1, 0, 0, 1, 1,
1.16572, 2.387569, -1.025555, 0, 0, 0, 1, 1,
1.167262, 0.6047351, 1.933839, 0, 0, 0, 1, 1,
1.176293, 0.6261435, -1.397366, 0, 0, 0, 1, 1,
1.177716, 1.550853, 1.756327, 0, 0, 0, 1, 1,
1.189984, 0.8866047, 2.466481, 0, 0, 0, 1, 1,
1.190935, -0.4320169, 3.344714, 0, 0, 0, 1, 1,
1.196958, 0.7229849, 0.6052731, 0, 0, 0, 1, 1,
1.198551, -0.7766954, 1.13507, 1, 1, 1, 1, 1,
1.203008, 0.1633534, 1.446975, 1, 1, 1, 1, 1,
1.203194, 2.435597, -0.520202, 1, 1, 1, 1, 1,
1.203683, -0.1312898, 3.515793, 1, 1, 1, 1, 1,
1.215631, -0.5462689, 3.32161, 1, 1, 1, 1, 1,
1.220004, 1.168454, -0.04420336, 1, 1, 1, 1, 1,
1.221918, -0.4529054, 2.327817, 1, 1, 1, 1, 1,
1.232505, -0.3024175, 0.5525351, 1, 1, 1, 1, 1,
1.250499, 0.1277456, 1.200333, 1, 1, 1, 1, 1,
1.256922, 0.8574286, -0.2852982, 1, 1, 1, 1, 1,
1.256937, 0.7814047, 1.210717, 1, 1, 1, 1, 1,
1.259369, -0.2739159, 1.173036, 1, 1, 1, 1, 1,
1.266616, 1.216682, 2.492047, 1, 1, 1, 1, 1,
1.278552, -1.27764, 3.024548, 1, 1, 1, 1, 1,
1.278559, -0.9019245, 2.584987, 1, 1, 1, 1, 1,
1.28169, -2.200399, 1.859701, 0, 0, 1, 1, 1,
1.285741, 0.6485189, 1.070107, 1, 0, 0, 1, 1,
1.287136, -0.4603537, 1.931802, 1, 0, 0, 1, 1,
1.298126, -0.00219714, 2.826101, 1, 0, 0, 1, 1,
1.311136, -0.09071259, 1.966565, 1, 0, 0, 1, 1,
1.314484, -0.9932578, 2.679854, 1, 0, 0, 1, 1,
1.318715, -0.2104949, -0.1015956, 0, 0, 0, 1, 1,
1.322686, 0.8464449, 0.4546873, 0, 0, 0, 1, 1,
1.328264, -0.6168125, 1.438884, 0, 0, 0, 1, 1,
1.331919, -1.942606, 2.351079, 0, 0, 0, 1, 1,
1.343656, 0.4006683, 2.405188, 0, 0, 0, 1, 1,
1.346588, -1.56963, 1.981701, 0, 0, 0, 1, 1,
1.348426, -0.3901098, 3.623685, 0, 0, 0, 1, 1,
1.356612, -0.853835, 1.950522, 1, 1, 1, 1, 1,
1.35967, -0.7254855, 1.320359, 1, 1, 1, 1, 1,
1.368178, 0.03653992, 2.523722, 1, 1, 1, 1, 1,
1.375968, -0.2277676, 1.356714, 1, 1, 1, 1, 1,
1.376039, -0.6287566, 2.225729, 1, 1, 1, 1, 1,
1.382759, -0.455951, 2.336931, 1, 1, 1, 1, 1,
1.391081, 0.8264659, 1.233072, 1, 1, 1, 1, 1,
1.391599, 0.1927083, 2.433106, 1, 1, 1, 1, 1,
1.399606, 1.101507, 1.085641, 1, 1, 1, 1, 1,
1.400815, 0.3911839, 1.482874, 1, 1, 1, 1, 1,
1.401525, 0.238955, 0.397469, 1, 1, 1, 1, 1,
1.402893, 0.4760629, 0.07079676, 1, 1, 1, 1, 1,
1.40839, 1.009591, 1.13528, 1, 1, 1, 1, 1,
1.41865, 0.2471863, 0.02563955, 1, 1, 1, 1, 1,
1.421614, -0.7481532, 1.187866, 1, 1, 1, 1, 1,
1.454376, -0.6750223, 2.402068, 0, 0, 1, 1, 1,
1.466259, 0.1650602, 1.168801, 1, 0, 0, 1, 1,
1.482551, -0.09462204, 2.587047, 1, 0, 0, 1, 1,
1.483978, 0.6434531, 1.924915, 1, 0, 0, 1, 1,
1.49016, -1.47702, 2.639642, 1, 0, 0, 1, 1,
1.494002, 0.7808539, 1.654868, 1, 0, 0, 1, 1,
1.498205, 1.581644, 1.426109, 0, 0, 0, 1, 1,
1.503417, -0.3469712, 2.074255, 0, 0, 0, 1, 1,
1.507633, 0.4327933, 2.672332, 0, 0, 0, 1, 1,
1.508875, 0.5951134, 2.744759, 0, 0, 0, 1, 1,
1.50971, 0.286428, 0.1670401, 0, 0, 0, 1, 1,
1.512499, 1.255207, -0.9926723, 0, 0, 0, 1, 1,
1.543119, -1.222299, 3.392364, 0, 0, 0, 1, 1,
1.543411, 1.227911, -0.1833558, 1, 1, 1, 1, 1,
1.551148, 1.180793, -0.3567712, 1, 1, 1, 1, 1,
1.563223, -0.5691726, 3.079591, 1, 1, 1, 1, 1,
1.573923, 0.5444999, 1.078787, 1, 1, 1, 1, 1,
1.580025, -1.670381, 3.213887, 1, 1, 1, 1, 1,
1.587563, 1.51243, 1.605156, 1, 1, 1, 1, 1,
1.59365, 0.9115995, 0.9549817, 1, 1, 1, 1, 1,
1.596421, -1.24072, 1.963064, 1, 1, 1, 1, 1,
1.596801, 0.2410678, 0.07716923, 1, 1, 1, 1, 1,
1.60635, 0.4712918, 1.701726, 1, 1, 1, 1, 1,
1.610308, 0.4813433, 1.324667, 1, 1, 1, 1, 1,
1.6108, 0.8954418, 2.504881, 1, 1, 1, 1, 1,
1.617551, -1.768136, 2.690376, 1, 1, 1, 1, 1,
1.619281, -0.4461393, 1.569241, 1, 1, 1, 1, 1,
1.622202, -0.6959527, 1.415134, 1, 1, 1, 1, 1,
1.651331, 0.6870185, 0.9787822, 0, 0, 1, 1, 1,
1.65919, -0.828333, 2.338424, 1, 0, 0, 1, 1,
1.68392, 0.6818091, 1.893205, 1, 0, 0, 1, 1,
1.684412, -1.898599, 3.184497, 1, 0, 0, 1, 1,
1.692513, 0.3892371, -0.4902269, 1, 0, 0, 1, 1,
1.698895, 0.7301612, 0.3913332, 1, 0, 0, 1, 1,
1.702043, 1.280003, 1.817573, 0, 0, 0, 1, 1,
1.724855, 0.08260806, 1.70164, 0, 0, 0, 1, 1,
1.730796, 0.9054295, 1.349912, 0, 0, 0, 1, 1,
1.743399, 2.154102, -0.4553291, 0, 0, 0, 1, 1,
1.769101, -0.03100709, 0.2383659, 0, 0, 0, 1, 1,
1.782605, 0.03343838, 2.314254, 0, 0, 0, 1, 1,
1.809742, 1.511424, 1.940418, 0, 0, 0, 1, 1,
1.810551, 0.4292877, -0.6373839, 1, 1, 1, 1, 1,
1.810869, 1.071581, 1.751597, 1, 1, 1, 1, 1,
1.812491, 1.703871, -0.7853189, 1, 1, 1, 1, 1,
1.813756, 1.074119, -0.9952133, 1, 1, 1, 1, 1,
1.821504, -0.5174215, 0.4907773, 1, 1, 1, 1, 1,
1.832302, -0.5021641, 1.188211, 1, 1, 1, 1, 1,
1.842146, 2.467942, 0.5964043, 1, 1, 1, 1, 1,
1.850255, -0.0587282, 0.0875826, 1, 1, 1, 1, 1,
1.850965, -1.087183, 3.589409, 1, 1, 1, 1, 1,
1.873267, -1.354415, 3.227348, 1, 1, 1, 1, 1,
1.876168, 1.183937, 1.969954, 1, 1, 1, 1, 1,
1.886249, 0.9369785, 1.581041, 1, 1, 1, 1, 1,
1.906701, 1.086964, 0.8461961, 1, 1, 1, 1, 1,
1.908069, -0.4314774, 2.316678, 1, 1, 1, 1, 1,
1.90975, -0.8918761, 3.114243, 1, 1, 1, 1, 1,
1.93225, -1.246776, 2.064665, 0, 0, 1, 1, 1,
1.953211, 0.6385199, -0.6689358, 1, 0, 0, 1, 1,
1.958162, -0.7452518, 3.407153, 1, 0, 0, 1, 1,
1.986826, 1.574836, 1.797599, 1, 0, 0, 1, 1,
2.064454, 1.020097, 0.7523071, 1, 0, 0, 1, 1,
2.103782, 1.831317, 2.893655, 1, 0, 0, 1, 1,
2.107161, -2.153254, 1.411914, 0, 0, 0, 1, 1,
2.130203, 0.9291395, 1.134975, 0, 0, 0, 1, 1,
2.23421, -0.197363, 0.3091423, 0, 0, 0, 1, 1,
2.334926, 0.1382274, 0.6844832, 0, 0, 0, 1, 1,
2.377817, 1.622029, 1.712877, 0, 0, 0, 1, 1,
2.469054, 0.687979, 2.713786, 0, 0, 0, 1, 1,
2.488424, 0.3238947, 1.081745, 0, 0, 0, 1, 1,
2.648695, -0.9814899, 2.693201, 1, 1, 1, 1, 1,
2.783785, 0.2853155, 1.892234, 1, 1, 1, 1, 1,
2.939129, 0.3117532, 2.285884, 1, 1, 1, 1, 1,
3.029593, -0.7543077, 3.51017, 1, 1, 1, 1, 1,
3.044727, 0.8694456, 1.125676, 1, 1, 1, 1, 1,
3.169094, 0.8578369, 2.820988, 1, 1, 1, 1, 1,
3.246546, -0.08581213, 1.261776, 1, 1, 1, 1, 1
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
var radius = 9.503891;
var distance = 33.38202;
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
mvMatrix.translate( 0.2449367, -0.009307027, 0.06141686 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.38202);
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
