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
-3.189698, -0.5853332, -2.292228, 1, 0, 0, 1,
-2.826083, -0.117017, 0.3584999, 1, 0.007843138, 0, 1,
-2.726718, -0.3052697, -2.213318, 1, 0.01176471, 0, 1,
-2.710765, 0.3220805, -2.878956, 1, 0.01960784, 0, 1,
-2.675775, 0.7446545, -0.5405585, 1, 0.02352941, 0, 1,
-2.650648, 0.7016335, -1.269829, 1, 0.03137255, 0, 1,
-2.57606, -1.08052, -2.427319, 1, 0.03529412, 0, 1,
-2.55686, -0.410341, -3.209892, 1, 0.04313726, 0, 1,
-2.555885, -1.078864, -2.880339, 1, 0.04705882, 0, 1,
-2.388435, -0.4943904, -1.484604, 1, 0.05490196, 0, 1,
-2.376618, 0.627986, -1.091646, 1, 0.05882353, 0, 1,
-2.32207, 0.8586712, 0.5712482, 1, 0.06666667, 0, 1,
-2.313572, -1.619451, 0.02470199, 1, 0.07058824, 0, 1,
-2.309937, 0.8388671, -1.932212, 1, 0.07843138, 0, 1,
-2.301778, -0.346711, -1.674486, 1, 0.08235294, 0, 1,
-2.289734, 0.0756028, -0.9329867, 1, 0.09019608, 0, 1,
-2.270406, -0.6343017, -1.702308, 1, 0.09411765, 0, 1,
-2.264736, 0.5456857, -2.249174, 1, 0.1019608, 0, 1,
-2.242785, 1.358728, -1.134227, 1, 0.1098039, 0, 1,
-2.178979, -1.517558, -1.064378, 1, 0.1137255, 0, 1,
-2.148581, 0.618936, -3.234321, 1, 0.1215686, 0, 1,
-2.130188, 0.1766971, -2.489877, 1, 0.1254902, 0, 1,
-2.090464, 0.9543937, 0.2298059, 1, 0.1333333, 0, 1,
-2.073184, -1.045593, -1.855059, 1, 0.1372549, 0, 1,
-2.061998, -1.245594, -2.781858, 1, 0.145098, 0, 1,
-2.043761, 0.1454927, -1.897102, 1, 0.1490196, 0, 1,
-2.037233, 0.3328208, -2.528753, 1, 0.1568628, 0, 1,
-2.018563, -2.253724, -3.977761, 1, 0.1607843, 0, 1,
-2.002318, 0.3155521, -2.254379, 1, 0.1686275, 0, 1,
-1.953602, 0.4123352, -1.328637, 1, 0.172549, 0, 1,
-1.944823, -0.6104302, -1.270297, 1, 0.1803922, 0, 1,
-1.934008, -0.7571859, -0.5023316, 1, 0.1843137, 0, 1,
-1.928037, 1.543867, 0.4516771, 1, 0.1921569, 0, 1,
-1.912067, -0.6264384, -1.146472, 1, 0.1960784, 0, 1,
-1.910776, 0.08775873, -0.577033, 1, 0.2039216, 0, 1,
-1.909023, -1.09433, -1.117823, 1, 0.2117647, 0, 1,
-1.903018, 0.3956874, -2.684027, 1, 0.2156863, 0, 1,
-1.893715, -0.6524535, -1.618289, 1, 0.2235294, 0, 1,
-1.870799, -0.7872425, -2.411698, 1, 0.227451, 0, 1,
-1.852958, 1.552375, 1.031163, 1, 0.2352941, 0, 1,
-1.844765, 0.617967, -1.381916, 1, 0.2392157, 0, 1,
-1.820424, 0.4890402, -2.005659, 1, 0.2470588, 0, 1,
-1.817888, 0.6408857, -1.760692, 1, 0.2509804, 0, 1,
-1.792417, -0.1949541, -2.541835, 1, 0.2588235, 0, 1,
-1.770684, -0.09555087, -2.326026, 1, 0.2627451, 0, 1,
-1.757053, 0.5007352, -2.311022, 1, 0.2705882, 0, 1,
-1.754842, -0.08739508, -0.3397051, 1, 0.2745098, 0, 1,
-1.741204, 1.444793, 0.6448475, 1, 0.282353, 0, 1,
-1.727792, -0.5290883, -3.465736, 1, 0.2862745, 0, 1,
-1.725207, -0.1899414, -1.919541, 1, 0.2941177, 0, 1,
-1.717577, 1.080281, -1.625465, 1, 0.3019608, 0, 1,
-1.712502, -1.184798, -1.903184, 1, 0.3058824, 0, 1,
-1.668272, -0.5507576, -3.455056, 1, 0.3137255, 0, 1,
-1.666527, 1.877491, -0.8772253, 1, 0.3176471, 0, 1,
-1.656382, -0.5666323, -3.538329, 1, 0.3254902, 0, 1,
-1.640342, -0.09197515, -2.026872, 1, 0.3294118, 0, 1,
-1.623434, -1.496583, -2.96186, 1, 0.3372549, 0, 1,
-1.616081, -0.09536966, -3.121587, 1, 0.3411765, 0, 1,
-1.603929, 0.7581981, -2.399586, 1, 0.3490196, 0, 1,
-1.594288, 0.6483157, -1.109235, 1, 0.3529412, 0, 1,
-1.587688, 1.267281, -2.463081, 1, 0.3607843, 0, 1,
-1.572755, -0.3878663, -1.559022, 1, 0.3647059, 0, 1,
-1.563068, -0.4511667, -1.795888, 1, 0.372549, 0, 1,
-1.553559, 0.196287, -1.405455, 1, 0.3764706, 0, 1,
-1.545142, 1.342432, -0.0624469, 1, 0.3843137, 0, 1,
-1.543971, 0.1860509, -2.075047, 1, 0.3882353, 0, 1,
-1.503249, 0.1964077, -0.8645725, 1, 0.3960784, 0, 1,
-1.498328, -1.988593, -2.570484, 1, 0.4039216, 0, 1,
-1.476027, 0.1022211, -1.495304, 1, 0.4078431, 0, 1,
-1.474094, -0.5798876, -2.18044, 1, 0.4156863, 0, 1,
-1.472541, 0.3628188, -0.3681564, 1, 0.4196078, 0, 1,
-1.468311, -0.1332153, 2.011788, 1, 0.427451, 0, 1,
-1.457701, -0.1173211, 0.2196756, 1, 0.4313726, 0, 1,
-1.444893, 0.2061997, -3.246992, 1, 0.4392157, 0, 1,
-1.435331, 1.274151, -0.9601735, 1, 0.4431373, 0, 1,
-1.422434, 0.86362, -1.909159, 1, 0.4509804, 0, 1,
-1.407896, 0.9481487, -2.297601, 1, 0.454902, 0, 1,
-1.395823, -0.4887199, -2.446981, 1, 0.4627451, 0, 1,
-1.395526, 1.073334, -2.792687, 1, 0.4666667, 0, 1,
-1.393398, 1.094307, -1.232568, 1, 0.4745098, 0, 1,
-1.389955, -1.068141, -4.145674, 1, 0.4784314, 0, 1,
-1.388505, 0.8587429, 1.319165, 1, 0.4862745, 0, 1,
-1.385118, 0.6666976, -1.035187, 1, 0.4901961, 0, 1,
-1.378201, -2.299386, -0.8163388, 1, 0.4980392, 0, 1,
-1.372853, 0.9395804, -2.264158, 1, 0.5058824, 0, 1,
-1.372623, -0.8703333, -0.9187961, 1, 0.509804, 0, 1,
-1.351196, -0.4083371, -2.473094, 1, 0.5176471, 0, 1,
-1.335726, 1.447282, 0.7925678, 1, 0.5215687, 0, 1,
-1.333155, -0.2418415, -0.3595819, 1, 0.5294118, 0, 1,
-1.329988, 1.19558, -1.518613, 1, 0.5333334, 0, 1,
-1.320772, 0.3436642, -0.1081029, 1, 0.5411765, 0, 1,
-1.317351, -0.4432796, -1.649436, 1, 0.5450981, 0, 1,
-1.313736, 0.6367497, -0.4611836, 1, 0.5529412, 0, 1,
-1.311099, 0.2682071, -0.5634866, 1, 0.5568628, 0, 1,
-1.30142, 0.7416481, -1.454328, 1, 0.5647059, 0, 1,
-1.300306, 0.9105201, -0.1368873, 1, 0.5686275, 0, 1,
-1.296861, -0.7688243, -2.842449, 1, 0.5764706, 0, 1,
-1.291155, -2.523265, -2.775021, 1, 0.5803922, 0, 1,
-1.288574, -0.05657686, -0.5279263, 1, 0.5882353, 0, 1,
-1.28751, -0.4559602, -2.16415, 1, 0.5921569, 0, 1,
-1.283956, -0.7906604, -1.543357, 1, 0.6, 0, 1,
-1.279402, -0.7708896, -1.432725, 1, 0.6078432, 0, 1,
-1.275847, 0.5797988, -1.960211, 1, 0.6117647, 0, 1,
-1.272744, 0.04569664, -1.046289, 1, 0.6196079, 0, 1,
-1.271164, 0.6858516, -1.543344, 1, 0.6235294, 0, 1,
-1.270557, -1.271837, -1.396218, 1, 0.6313726, 0, 1,
-1.268164, 0.5567434, 0.5697985, 1, 0.6352941, 0, 1,
-1.260294, -0.6113979, -2.67175, 1, 0.6431373, 0, 1,
-1.254406, -2.400548, -2.278593, 1, 0.6470588, 0, 1,
-1.239662, 0.6799948, -1.37972, 1, 0.654902, 0, 1,
-1.238055, 1.213098, -1.40251, 1, 0.6588235, 0, 1,
-1.237129, -0.8001188, -2.18043, 1, 0.6666667, 0, 1,
-1.227781, -0.8354667, -2.900784, 1, 0.6705883, 0, 1,
-1.21942, 1.827557, -1.371721, 1, 0.6784314, 0, 1,
-1.210511, 0.6415201, -0.5057422, 1, 0.682353, 0, 1,
-1.210007, 0.7890102, -0.9892251, 1, 0.6901961, 0, 1,
-1.210004, 0.03377388, 0.7126015, 1, 0.6941177, 0, 1,
-1.208849, -0.9839624, -0.6642654, 1, 0.7019608, 0, 1,
-1.207709, -0.718935, -2.606342, 1, 0.7098039, 0, 1,
-1.190398, 0.3531903, -0.3742332, 1, 0.7137255, 0, 1,
-1.189144, 0.4599254, -2.810512, 1, 0.7215686, 0, 1,
-1.172256, 1.528024, 1.558915, 1, 0.7254902, 0, 1,
-1.168018, -0.6915008, -2.349521, 1, 0.7333333, 0, 1,
-1.166511, -0.2837778, -1.647888, 1, 0.7372549, 0, 1,
-1.15735, 0.167399, -1.330581, 1, 0.7450981, 0, 1,
-1.146142, -0.1563667, -1.643384, 1, 0.7490196, 0, 1,
-1.145486, -0.8757235, -1.598573, 1, 0.7568628, 0, 1,
-1.141098, 0.4598732, -1.773239, 1, 0.7607843, 0, 1,
-1.13301, -1.102102, -1.242101, 1, 0.7686275, 0, 1,
-1.124521, -1.441612, -3.763342, 1, 0.772549, 0, 1,
-1.116402, 0.2598713, -1.147643, 1, 0.7803922, 0, 1,
-1.115391, 1.893618, -1.701576, 1, 0.7843137, 0, 1,
-1.104998, -0.2346011, -2.354557, 1, 0.7921569, 0, 1,
-1.080218, 0.7627839, -2.260293, 1, 0.7960784, 0, 1,
-1.073281, 0.9272382, -0.1971209, 1, 0.8039216, 0, 1,
-1.06974, -0.9100349, -2.654449, 1, 0.8117647, 0, 1,
-1.065961, 1.106411, -1.889635, 1, 0.8156863, 0, 1,
-1.062558, 1.282237, -0.09844621, 1, 0.8235294, 0, 1,
-1.061095, -1.216108, -2.741338, 1, 0.827451, 0, 1,
-1.057716, 0.2142124, -1.132729, 1, 0.8352941, 0, 1,
-1.048755, -0.8250072, -2.98993, 1, 0.8392157, 0, 1,
-1.045987, 0.0862413, -0.6699952, 1, 0.8470588, 0, 1,
-1.043575, 0.5399929, -1.366107, 1, 0.8509804, 0, 1,
-1.033527, -0.6057317, -4.183651, 1, 0.8588235, 0, 1,
-1.027181, 0.7014055, -1.244986, 1, 0.8627451, 0, 1,
-1.022875, -1.143988, -2.522603, 1, 0.8705882, 0, 1,
-1.018945, 0.1592968, -1.643753, 1, 0.8745098, 0, 1,
-1.009215, -2.101717, -1.830994, 1, 0.8823529, 0, 1,
-1.005641, -0.483702, -2.94962, 1, 0.8862745, 0, 1,
-1.005392, -1.74905, -1.913857, 1, 0.8941177, 0, 1,
-1.001145, 1.515352, -0.7573957, 1, 0.8980392, 0, 1,
-0.9937143, 0.3972892, -0.7609647, 1, 0.9058824, 0, 1,
-0.9931293, 0.6310047, -0.5142685, 1, 0.9137255, 0, 1,
-0.9884242, 0.408578, 0.6692027, 1, 0.9176471, 0, 1,
-0.9866272, -0.2538473, -0.7832971, 1, 0.9254902, 0, 1,
-0.9824171, 0.5427572, -1.830923, 1, 0.9294118, 0, 1,
-0.9758528, 1.545999, -0.3114944, 1, 0.9372549, 0, 1,
-0.9703187, -0.437575, -3.204509, 1, 0.9411765, 0, 1,
-0.9678764, 0.3914648, -1.439151, 1, 0.9490196, 0, 1,
-0.9657341, -1.083784, -1.898088, 1, 0.9529412, 0, 1,
-0.9651653, -0.5466873, -2.157884, 1, 0.9607843, 0, 1,
-0.9555587, 0.8139668, -1.668274, 1, 0.9647059, 0, 1,
-0.9529994, -1.699148, -1.458656, 1, 0.972549, 0, 1,
-0.9519665, -2.747336, -1.811028, 1, 0.9764706, 0, 1,
-0.9481313, -1.740865, -2.387615, 1, 0.9843137, 0, 1,
-0.9466197, -0.7649469, -2.141566, 1, 0.9882353, 0, 1,
-0.9444878, -1.308629, -2.135636, 1, 0.9960784, 0, 1,
-0.9419871, -0.2013374, -0.5768354, 0.9960784, 1, 0, 1,
-0.9415531, -0.6157426, -0.959367, 0.9921569, 1, 0, 1,
-0.935897, -1.148634, -3.272032, 0.9843137, 1, 0, 1,
-0.9353316, 1.510991, -1.05909, 0.9803922, 1, 0, 1,
-0.9303041, -0.3037562, -3.064425, 0.972549, 1, 0, 1,
-0.9281219, -0.6998565, -2.795077, 0.9686275, 1, 0, 1,
-0.9251155, 0.3380952, -1.930608, 0.9607843, 1, 0, 1,
-0.9167833, -0.7743534, -2.186229, 0.9568627, 1, 0, 1,
-0.9074652, 0.07801192, -2.333823, 0.9490196, 1, 0, 1,
-0.9071819, -0.9664858, -2.381859, 0.945098, 1, 0, 1,
-0.9069337, -0.05959733, -2.046634, 0.9372549, 1, 0, 1,
-0.9050556, 0.7197115, -2.309955, 0.9333333, 1, 0, 1,
-0.9003345, 0.8017122, -1.716089, 0.9254902, 1, 0, 1,
-0.899829, 0.004025226, -3.241638, 0.9215686, 1, 0, 1,
-0.8932053, 0.3073267, -2.672066, 0.9137255, 1, 0, 1,
-0.8926798, 0.01245295, -2.869619, 0.9098039, 1, 0, 1,
-0.8918141, 0.6809654, -0.9760323, 0.9019608, 1, 0, 1,
-0.8898494, -0.1785019, -3.062203, 0.8941177, 1, 0, 1,
-0.8889827, 0.2849834, 0.04810011, 0.8901961, 1, 0, 1,
-0.8880929, -0.4369751, -1.821207, 0.8823529, 1, 0, 1,
-0.886058, -1.920588, -1.804274, 0.8784314, 1, 0, 1,
-0.8859358, -2.78113, -3.242772, 0.8705882, 1, 0, 1,
-0.8851952, -0.5925049, -2.074102, 0.8666667, 1, 0, 1,
-0.8832648, 0.8012086, 0.2596192, 0.8588235, 1, 0, 1,
-0.88169, 0.9896602, -0.5846561, 0.854902, 1, 0, 1,
-0.8814815, 0.3770672, -0.5331774, 0.8470588, 1, 0, 1,
-0.873101, 0.4685237, 0.3449579, 0.8431373, 1, 0, 1,
-0.8662122, -0.08838797, -1.721099, 0.8352941, 1, 0, 1,
-0.8657767, 0.0802879, -2.866009, 0.8313726, 1, 0, 1,
-0.8618941, -0.6313096, -2.015433, 0.8235294, 1, 0, 1,
-0.8615758, -0.8167642, -1.557926, 0.8196079, 1, 0, 1,
-0.8575673, -0.3159838, -2.270437, 0.8117647, 1, 0, 1,
-0.8571548, -0.7091818, -2.407623, 0.8078431, 1, 0, 1,
-0.8486842, 0.5030888, -0.8047125, 0.8, 1, 0, 1,
-0.8466512, -0.1887146, -1.168895, 0.7921569, 1, 0, 1,
-0.8442767, -1.726001, -1.697199, 0.7882353, 1, 0, 1,
-0.8431118, 0.3141303, -1.310783, 0.7803922, 1, 0, 1,
-0.8418362, 1.964412, -0.3436124, 0.7764706, 1, 0, 1,
-0.8403714, 0.972487, -0.7698979, 0.7686275, 1, 0, 1,
-0.8356268, -0.8795674, -1.594082, 0.7647059, 1, 0, 1,
-0.8329551, 2.782223, -0.7391742, 0.7568628, 1, 0, 1,
-0.831035, 0.1804623, -0.6350905, 0.7529412, 1, 0, 1,
-0.8258064, 1.306432, -1.238079, 0.7450981, 1, 0, 1,
-0.8241823, -1.68518, -2.793478, 0.7411765, 1, 0, 1,
-0.8203114, -1.154131, -0.7801018, 0.7333333, 1, 0, 1,
-0.8089895, 0.9200728, -1.067341, 0.7294118, 1, 0, 1,
-0.8063062, -0.678142, -2.6326, 0.7215686, 1, 0, 1,
-0.8039321, -0.1684518, -3.224737, 0.7176471, 1, 0, 1,
-0.7997233, -0.6179076, -3.819827, 0.7098039, 1, 0, 1,
-0.7978048, 0.3822984, -0.9306096, 0.7058824, 1, 0, 1,
-0.796612, 0.849881, -0.2617007, 0.6980392, 1, 0, 1,
-0.7963649, -1.60514, -3.452748, 0.6901961, 1, 0, 1,
-0.7946737, 0.01505626, -2.381692, 0.6862745, 1, 0, 1,
-0.7925734, -0.5912427, -3.124199, 0.6784314, 1, 0, 1,
-0.7924243, 0.009155601, -1.875263, 0.6745098, 1, 0, 1,
-0.7843472, 0.2328575, -2.8884, 0.6666667, 1, 0, 1,
-0.7822718, -0.07777923, 1.287285, 0.6627451, 1, 0, 1,
-0.7790602, 0.6166431, -0.0838287, 0.654902, 1, 0, 1,
-0.7773834, -0.5126618, -0.9891527, 0.6509804, 1, 0, 1,
-0.7733587, -0.437636, -2.657162, 0.6431373, 1, 0, 1,
-0.7729188, 0.4408759, -1.088021, 0.6392157, 1, 0, 1,
-0.7694644, 0.1686395, -3.21655, 0.6313726, 1, 0, 1,
-0.7679343, 0.2839609, -0.5580776, 0.627451, 1, 0, 1,
-0.7672784, -0.6499034, -2.604116, 0.6196079, 1, 0, 1,
-0.7661349, 0.6403091, -1.182171, 0.6156863, 1, 0, 1,
-0.7606395, -0.03135945, -1.496455, 0.6078432, 1, 0, 1,
-0.7579828, -1.783175, -3.06726, 0.6039216, 1, 0, 1,
-0.7544004, -0.8176774, -2.634844, 0.5960785, 1, 0, 1,
-0.7528448, -0.1321913, -2.799908, 0.5882353, 1, 0, 1,
-0.7523075, -1.474297, -3.161843, 0.5843138, 1, 0, 1,
-0.7521336, -0.3356405, -2.843671, 0.5764706, 1, 0, 1,
-0.748947, -2.117431, -1.986144, 0.572549, 1, 0, 1,
-0.7447848, -0.6565117, -2.780124, 0.5647059, 1, 0, 1,
-0.7437594, 0.2341207, -1.5033, 0.5607843, 1, 0, 1,
-0.7401857, 0.323233, -0.248539, 0.5529412, 1, 0, 1,
-0.7380415, 1.755348, -0.2156899, 0.5490196, 1, 0, 1,
-0.7372561, 0.1566584, -0.8765184, 0.5411765, 1, 0, 1,
-0.7363297, 0.1992946, -2.802774, 0.5372549, 1, 0, 1,
-0.735931, 0.5144501, -2.522702, 0.5294118, 1, 0, 1,
-0.735325, 1.611514, -1.560835, 0.5254902, 1, 0, 1,
-0.7255822, 0.8098757, -1.038415, 0.5176471, 1, 0, 1,
-0.7221296, 0.2177346, 0.3823049, 0.5137255, 1, 0, 1,
-0.7207789, -0.4455538, -4.038494, 0.5058824, 1, 0, 1,
-0.7196953, -0.3411686, -2.321222, 0.5019608, 1, 0, 1,
-0.7166077, -0.677303, -3.032237, 0.4941176, 1, 0, 1,
-0.7089831, 1.186326, -1.965008, 0.4862745, 1, 0, 1,
-0.7055793, -1.889043, -3.477431, 0.4823529, 1, 0, 1,
-0.7011431, 0.6621295, 0.07657301, 0.4745098, 1, 0, 1,
-0.6974229, -0.6477354, -4.096736, 0.4705882, 1, 0, 1,
-0.6951536, 0.7735977, 0.6515142, 0.4627451, 1, 0, 1,
-0.6947842, -0.7383041, -1.538238, 0.4588235, 1, 0, 1,
-0.6891204, 0.03346804, -0.9576112, 0.4509804, 1, 0, 1,
-0.6864188, -0.3453092, -0.693998, 0.4470588, 1, 0, 1,
-0.683643, 0.4720028, -5.136084, 0.4392157, 1, 0, 1,
-0.6825326, -0.9105151, -1.088845, 0.4352941, 1, 0, 1,
-0.6816614, 0.8518819, -0.2946708, 0.427451, 1, 0, 1,
-0.6789151, -0.6539955, -0.6643298, 0.4235294, 1, 0, 1,
-0.6786181, 1.277228, -0.4014381, 0.4156863, 1, 0, 1,
-0.6773096, 1.038528, 1.812959, 0.4117647, 1, 0, 1,
-0.6756337, 0.08858957, -0.8874736, 0.4039216, 1, 0, 1,
-0.663741, 0.05233184, -2.492987, 0.3960784, 1, 0, 1,
-0.6636329, 0.4335179, -0.8606157, 0.3921569, 1, 0, 1,
-0.657676, -0.1914346, 0.1080389, 0.3843137, 1, 0, 1,
-0.6554654, 2.107253, 0.347523, 0.3803922, 1, 0, 1,
-0.6504807, -0.3296549, -1.987726, 0.372549, 1, 0, 1,
-0.6425267, -0.4374625, 0.009697374, 0.3686275, 1, 0, 1,
-0.6392521, -0.06281582, 0.5767874, 0.3607843, 1, 0, 1,
-0.6384353, -1.082422, -1.06318, 0.3568628, 1, 0, 1,
-0.6244736, -0.4447181, -0.6412383, 0.3490196, 1, 0, 1,
-0.6213096, 0.2940914, -0.96557, 0.345098, 1, 0, 1,
-0.6180047, 0.7250909, -1.622847, 0.3372549, 1, 0, 1,
-0.6175851, 1.581982, 0.9965141, 0.3333333, 1, 0, 1,
-0.6091293, -0.6307325, -4.925449, 0.3254902, 1, 0, 1,
-0.603065, 2.388999, -1.221794, 0.3215686, 1, 0, 1,
-0.6025293, 0.2976144, -0.3486221, 0.3137255, 1, 0, 1,
-0.5983136, 2.378054, 1.113392, 0.3098039, 1, 0, 1,
-0.5954875, -0.6426496, -3.555761, 0.3019608, 1, 0, 1,
-0.5829972, -1.962838, -3.697022, 0.2941177, 1, 0, 1,
-0.5828364, -1.873763, -3.216535, 0.2901961, 1, 0, 1,
-0.582562, 0.8132707, -0.468171, 0.282353, 1, 0, 1,
-0.5816936, -0.4853793, -2.65786, 0.2784314, 1, 0, 1,
-0.5804761, 0.5660999, -0.8658224, 0.2705882, 1, 0, 1,
-0.5698567, -1.035903, -3.064574, 0.2666667, 1, 0, 1,
-0.5692831, 1.127067, -0.753578, 0.2588235, 1, 0, 1,
-0.5686769, -0.05118921, -1.079048, 0.254902, 1, 0, 1,
-0.5676005, -0.5990379, 0.5332119, 0.2470588, 1, 0, 1,
-0.5655784, 0.1407564, -1.221301, 0.2431373, 1, 0, 1,
-0.5622568, -0.2433626, -2.891466, 0.2352941, 1, 0, 1,
-0.5552378, 0.1202904, -0.5906507, 0.2313726, 1, 0, 1,
-0.553471, 0.9089304, -0.1864552, 0.2235294, 1, 0, 1,
-0.54895, -0.08353326, -1.03415, 0.2196078, 1, 0, 1,
-0.5450331, -0.186902, -2.395354, 0.2117647, 1, 0, 1,
-0.5440004, 0.2223698, -0.05089409, 0.2078431, 1, 0, 1,
-0.539927, 0.2246381, -3.141206, 0.2, 1, 0, 1,
-0.5398551, -0.1344549, -0.6643154, 0.1921569, 1, 0, 1,
-0.5391656, 0.2618405, -1.350568, 0.1882353, 1, 0, 1,
-0.5379773, 1.150732, 0.3013594, 0.1803922, 1, 0, 1,
-0.5372941, -0.731866, -2.278133, 0.1764706, 1, 0, 1,
-0.5354556, 1.863492, -0.8445449, 0.1686275, 1, 0, 1,
-0.5351329, -0.02605331, 0.1935804, 0.1647059, 1, 0, 1,
-0.5298402, -0.1210037, -1.59661, 0.1568628, 1, 0, 1,
-0.528078, 1.270611, -0.6688939, 0.1529412, 1, 0, 1,
-0.5269637, 0.6801161, 0.5666224, 0.145098, 1, 0, 1,
-0.5266348, -0.005474037, -3.010406, 0.1411765, 1, 0, 1,
-0.5251356, -0.9459001, -2.94371, 0.1333333, 1, 0, 1,
-0.523253, 1.750499, -1.010123, 0.1294118, 1, 0, 1,
-0.5191419, -0.9090522, -0.8511347, 0.1215686, 1, 0, 1,
-0.518883, 0.5829315, 0.6376597, 0.1176471, 1, 0, 1,
-0.518846, 0.9199468, 0.1934789, 0.1098039, 1, 0, 1,
-0.5159159, -1.54325, -4.134488, 0.1058824, 1, 0, 1,
-0.5149661, -0.04048188, -1.189218, 0.09803922, 1, 0, 1,
-0.5043294, 0.01615693, 0.03873129, 0.09019608, 1, 0, 1,
-0.50172, 1.385847, -0.6127629, 0.08627451, 1, 0, 1,
-0.5005642, 0.9876794, 2.187897, 0.07843138, 1, 0, 1,
-0.5005251, -1.704645, -2.913682, 0.07450981, 1, 0, 1,
-0.4975383, -0.476306, -2.216985, 0.06666667, 1, 0, 1,
-0.4886842, 1.207836, -0.6578571, 0.0627451, 1, 0, 1,
-0.4882345, 0.5871363, -0.2468302, 0.05490196, 1, 0, 1,
-0.4861704, 1.796373, -0.657455, 0.05098039, 1, 0, 1,
-0.4826149, 0.4158953, -1.012869, 0.04313726, 1, 0, 1,
-0.4823777, 0.4103674, 0.415406, 0.03921569, 1, 0, 1,
-0.4823212, 0.00835633, -0.6291426, 0.03137255, 1, 0, 1,
-0.479382, 0.1154839, -0.03906529, 0.02745098, 1, 0, 1,
-0.4770389, 0.2994683, 0.1062569, 0.01960784, 1, 0, 1,
-0.4702105, -0.980831, -4.781186, 0.01568628, 1, 0, 1,
-0.4693319, -1.392135, -2.667459, 0.007843138, 1, 0, 1,
-0.4693286, 1.014181, -1.316814, 0.003921569, 1, 0, 1,
-0.4657953, 1.364318, 0.9152418, 0, 1, 0.003921569, 1,
-0.4592689, 1.01235, -0.4854054, 0, 1, 0.01176471, 1,
-0.4582999, 1.56013, 0.8860096, 0, 1, 0.01568628, 1,
-0.4558239, 0.04989993, -2.47729, 0, 1, 0.02352941, 1,
-0.4534272, -0.4037144, -2.063684, 0, 1, 0.02745098, 1,
-0.4516068, 0.8973367, -0.8811791, 0, 1, 0.03529412, 1,
-0.4408847, -0.4532666, -0.01273867, 0, 1, 0.03921569, 1,
-0.4381856, 1.06603, -0.866972, 0, 1, 0.04705882, 1,
-0.4368715, 1.475758, -1.27281, 0, 1, 0.05098039, 1,
-0.4363525, -0.7429014, -3.662987, 0, 1, 0.05882353, 1,
-0.4342771, -1.834637, -3.234936, 0, 1, 0.0627451, 1,
-0.4320638, 0.2668262, -0.6593647, 0, 1, 0.07058824, 1,
-0.4223099, 1.05664, -2.084799, 0, 1, 0.07450981, 1,
-0.4169575, 1.051793, -0.3977885, 0, 1, 0.08235294, 1,
-0.4163861, -0.3106871, -1.643892, 0, 1, 0.08627451, 1,
-0.4157661, 0.9849889, 0.3655541, 0, 1, 0.09411765, 1,
-0.4151188, 0.8118766, -1.940678, 0, 1, 0.1019608, 1,
-0.4143522, -1.777608, -2.590968, 0, 1, 0.1058824, 1,
-0.4118285, 0.1862247, -2.365456, 0, 1, 0.1137255, 1,
-0.4115971, 0.6646214, -1.517324, 0, 1, 0.1176471, 1,
-0.4112337, -1.207948, -1.097771, 0, 1, 0.1254902, 1,
-0.405943, -0.3885492, -1.65245, 0, 1, 0.1294118, 1,
-0.4004977, 0.4719169, 0.1504951, 0, 1, 0.1372549, 1,
-0.4001688, -0.05210187, -1.241173, 0, 1, 0.1411765, 1,
-0.3976353, -1.039387, -3.750875, 0, 1, 0.1490196, 1,
-0.3948908, 1.06199, -0.2546445, 0, 1, 0.1529412, 1,
-0.3906429, 0.7913262, -1.511535, 0, 1, 0.1607843, 1,
-0.3885136, 1.281878, 2.166928, 0, 1, 0.1647059, 1,
-0.3811589, 0.8068932, -0.2504701, 0, 1, 0.172549, 1,
-0.3807005, 0.6340379, -1.244565, 0, 1, 0.1764706, 1,
-0.3797126, -0.08504274, -3.569463, 0, 1, 0.1843137, 1,
-0.3793894, -0.1386371, -3.178807, 0, 1, 0.1882353, 1,
-0.3774434, 0.6237586, 0.8132892, 0, 1, 0.1960784, 1,
-0.3758469, 0.7850627, -1.955389, 0, 1, 0.2039216, 1,
-0.375801, 0.8138205, 1.318093, 0, 1, 0.2078431, 1,
-0.369502, -0.4550481, -3.197725, 0, 1, 0.2156863, 1,
-0.364826, -1.846231, -2.117653, 0, 1, 0.2196078, 1,
-0.3647865, -2.350974, -4.330227, 0, 1, 0.227451, 1,
-0.3633823, 0.6031867, -1.252653, 0, 1, 0.2313726, 1,
-0.3530856, -1.580886, -2.993073, 0, 1, 0.2392157, 1,
-0.3496984, 2.172474, -3.565339, 0, 1, 0.2431373, 1,
-0.3452429, 0.6862641, -3.006261, 0, 1, 0.2509804, 1,
-0.3448772, 0.5700451, -1.124513, 0, 1, 0.254902, 1,
-0.3423888, 0.09369228, -1.333075, 0, 1, 0.2627451, 1,
-0.3406903, -0.7486683, -4.315285, 0, 1, 0.2666667, 1,
-0.339378, -0.02759071, -0.2782964, 0, 1, 0.2745098, 1,
-0.3332738, -0.1691801, -1.936823, 0, 1, 0.2784314, 1,
-0.3319304, 0.779989, 0.1962926, 0, 1, 0.2862745, 1,
-0.3310089, -0.3115359, 0.4788292, 0, 1, 0.2901961, 1,
-0.330501, -2.37247, -3.751885, 0, 1, 0.2980392, 1,
-0.3285293, 1.178334, 1.12879, 0, 1, 0.3058824, 1,
-0.3285169, -0.4755725, -3.283096, 0, 1, 0.3098039, 1,
-0.3285161, -1.128204, -1.71215, 0, 1, 0.3176471, 1,
-0.3267793, 0.3202119, -0.6313273, 0, 1, 0.3215686, 1,
-0.3262835, -1.398842, -2.213631, 0, 1, 0.3294118, 1,
-0.3172669, -0.5735208, -2.414197, 0, 1, 0.3333333, 1,
-0.3094331, 0.7536413, -1.447695, 0, 1, 0.3411765, 1,
-0.3064822, 0.8805511, 0.1854262, 0, 1, 0.345098, 1,
-0.3052236, -0.241921, -2.162027, 0, 1, 0.3529412, 1,
-0.3051589, -0.4042853, -2.77484, 0, 1, 0.3568628, 1,
-0.304857, 1.009892, -1.752029, 0, 1, 0.3647059, 1,
-0.303732, -0.9551888, -1.632773, 0, 1, 0.3686275, 1,
-0.3036282, 0.1150363, -1.417421, 0, 1, 0.3764706, 1,
-0.3022567, -0.9175078, -1.94045, 0, 1, 0.3803922, 1,
-0.2884993, 0.3460791, -1.338373, 0, 1, 0.3882353, 1,
-0.2881278, 0.6956346, -0.3773868, 0, 1, 0.3921569, 1,
-0.2852785, -1.052514, -3.025725, 0, 1, 0.4, 1,
-0.2841538, 0.2892516, 1.41281, 0, 1, 0.4078431, 1,
-0.2824194, -0.7775913, -3.204597, 0, 1, 0.4117647, 1,
-0.2801158, 0.6463868, -1.633638, 0, 1, 0.4196078, 1,
-0.2800653, -1.139664, -1.722018, 0, 1, 0.4235294, 1,
-0.2753034, -0.9298317, -1.813911, 0, 1, 0.4313726, 1,
-0.2644513, -1.853257, -1.330054, 0, 1, 0.4352941, 1,
-0.2614581, -0.6268216, -2.443456, 0, 1, 0.4431373, 1,
-0.2595961, -0.431825, -2.39794, 0, 1, 0.4470588, 1,
-0.2588174, -1.036362, -2.578166, 0, 1, 0.454902, 1,
-0.2568685, 1.099972, 1.126515, 0, 1, 0.4588235, 1,
-0.2541015, -0.563507, -3.075747, 0, 1, 0.4666667, 1,
-0.2539845, 1.243214, -0.08574668, 0, 1, 0.4705882, 1,
-0.2529109, -0.06229888, -1.127063, 0, 1, 0.4784314, 1,
-0.2518331, 0.1030245, -1.78465, 0, 1, 0.4823529, 1,
-0.2495534, 0.428449, 0.5955512, 0, 1, 0.4901961, 1,
-0.2494689, 0.1740896, 0.06384908, 0, 1, 0.4941176, 1,
-0.2484258, -0.8829664, -3.302664, 0, 1, 0.5019608, 1,
-0.2467842, -0.2372737, -3.507755, 0, 1, 0.509804, 1,
-0.2460482, -0.935011, -3.256357, 0, 1, 0.5137255, 1,
-0.2438729, -1.105796, -3.216396, 0, 1, 0.5215687, 1,
-0.2403848, -1.301486, -3.272624, 0, 1, 0.5254902, 1,
-0.2398444, 1.164375, 0.3969901, 0, 1, 0.5333334, 1,
-0.2393046, -1.496784, -1.848541, 0, 1, 0.5372549, 1,
-0.2384135, -0.4944352, -2.460466, 0, 1, 0.5450981, 1,
-0.2383162, -1.457737, -2.443573, 0, 1, 0.5490196, 1,
-0.2360502, -1.125318, -3.324012, 0, 1, 0.5568628, 1,
-0.2346702, 0.111977, 0.6501109, 0, 1, 0.5607843, 1,
-0.2343958, 0.5267753, -0.9371411, 0, 1, 0.5686275, 1,
-0.2340455, -1.527572, -3.706875, 0, 1, 0.572549, 1,
-0.2328173, 0.8391746, 0.174651, 0, 1, 0.5803922, 1,
-0.2325236, 1.832807, 0.06816512, 0, 1, 0.5843138, 1,
-0.2301763, -0.1473149, -2.794549, 0, 1, 0.5921569, 1,
-0.2252441, 1.469821, -1.578998, 0, 1, 0.5960785, 1,
-0.2230672, -0.5116564, -2.307157, 0, 1, 0.6039216, 1,
-0.2223544, 0.5472353, -1.320822, 0, 1, 0.6117647, 1,
-0.2187425, 0.2455279, -0.237118, 0, 1, 0.6156863, 1,
-0.2158632, 0.0657458, -1.329966, 0, 1, 0.6235294, 1,
-0.2129553, 0.2573658, 0.2398166, 0, 1, 0.627451, 1,
-0.2099356, 0.3691309, -2.197007, 0, 1, 0.6352941, 1,
-0.2048585, -0.2144205, -1.982402, 0, 1, 0.6392157, 1,
-0.2028584, 0.2305451, 0.6320482, 0, 1, 0.6470588, 1,
-0.1971234, 0.4059914, -0.3175493, 0, 1, 0.6509804, 1,
-0.1955627, -0.8425426, -1.454768, 0, 1, 0.6588235, 1,
-0.1952147, 0.648431, -0.9283922, 0, 1, 0.6627451, 1,
-0.1934804, -0.4070582, -3.095142, 0, 1, 0.6705883, 1,
-0.1916355, 0.7933071, -0.4461527, 0, 1, 0.6745098, 1,
-0.1897925, 0.4193168, -1.493336, 0, 1, 0.682353, 1,
-0.1855449, -1.804214, -5.644576, 0, 1, 0.6862745, 1,
-0.1811662, -0.4404053, -1.48094, 0, 1, 0.6941177, 1,
-0.1799667, -1.552583, -3.335304, 0, 1, 0.7019608, 1,
-0.1792645, -0.5272465, -2.727145, 0, 1, 0.7058824, 1,
-0.179074, -1.549617, -2.929492, 0, 1, 0.7137255, 1,
-0.1787292, -0.0378306, -1.672994, 0, 1, 0.7176471, 1,
-0.1780172, -0.8276377, -4.050598, 0, 1, 0.7254902, 1,
-0.1766623, -0.009809678, -1.403869, 0, 1, 0.7294118, 1,
-0.175426, -0.4491527, -4.429461, 0, 1, 0.7372549, 1,
-0.175129, -2.060796, -2.801244, 0, 1, 0.7411765, 1,
-0.1687736, -0.6749876, -4.779438, 0, 1, 0.7490196, 1,
-0.1661623, -0.06129627, -0.5463803, 0, 1, 0.7529412, 1,
-0.165349, -1.013568, -2.457772, 0, 1, 0.7607843, 1,
-0.1649762, 1.784087, -0.4399008, 0, 1, 0.7647059, 1,
-0.1638048, -0.6762086, -2.97561, 0, 1, 0.772549, 1,
-0.1626396, -0.1493354, -2.436183, 0, 1, 0.7764706, 1,
-0.1619383, -0.216784, -2.316426, 0, 1, 0.7843137, 1,
-0.1612552, -0.895205, -2.996323, 0, 1, 0.7882353, 1,
-0.1602314, -0.4440316, -3.212391, 0, 1, 0.7960784, 1,
-0.1570791, 1.442035, -0.07262474, 0, 1, 0.8039216, 1,
-0.1547267, -0.5521391, -2.869905, 0, 1, 0.8078431, 1,
-0.1515422, -0.3602311, -3.11559, 0, 1, 0.8156863, 1,
-0.1443314, 0.3759705, 0.6241627, 0, 1, 0.8196079, 1,
-0.1441836, 0.07677515, -2.232162, 0, 1, 0.827451, 1,
-0.142931, -0.6946055, -1.999942, 0, 1, 0.8313726, 1,
-0.1419096, 0.05004616, -1.954119, 0, 1, 0.8392157, 1,
-0.1353433, -0.602536, -2.31627, 0, 1, 0.8431373, 1,
-0.1337881, -0.1636272, -4.487352, 0, 1, 0.8509804, 1,
-0.1322271, -0.163811, -3.921061, 0, 1, 0.854902, 1,
-0.1308479, 1.156241, -1.152328, 0, 1, 0.8627451, 1,
-0.1286643, -1.911072, -2.578012, 0, 1, 0.8666667, 1,
-0.128504, 0.5219623, -1.355861, 0, 1, 0.8745098, 1,
-0.1280329, -1.49959, -1.592634, 0, 1, 0.8784314, 1,
-0.1262363, -0.8491271, -3.648015, 0, 1, 0.8862745, 1,
-0.1211442, -0.4800339, -3.045936, 0, 1, 0.8901961, 1,
-0.1172135, 0.2016172, -1.287079, 0, 1, 0.8980392, 1,
-0.1156195, -0.8345813, -4.09529, 0, 1, 0.9058824, 1,
-0.1141223, 0.8566353, 0.07781998, 0, 1, 0.9098039, 1,
-0.1125245, 1.571986, -2.275827, 0, 1, 0.9176471, 1,
-0.1114568, -0.02398103, -1.035353, 0, 1, 0.9215686, 1,
-0.108646, -0.304829, -2.499668, 0, 1, 0.9294118, 1,
-0.1020857, -0.1577815, -2.785156, 0, 1, 0.9333333, 1,
-0.09363255, -0.4110619, -1.809064, 0, 1, 0.9411765, 1,
-0.08911599, -1.07384, -3.083543, 0, 1, 0.945098, 1,
-0.08319139, 0.5821376, -0.2066629, 0, 1, 0.9529412, 1,
-0.082003, 0.5819788, 1.854942, 0, 1, 0.9568627, 1,
-0.07769754, 1.696948, 0.0813174, 0, 1, 0.9647059, 1,
-0.07683036, 0.6253884, -0.3160497, 0, 1, 0.9686275, 1,
-0.06957601, -2.026934, -2.848485, 0, 1, 0.9764706, 1,
-0.06644969, 0.7730583, -1.046802, 0, 1, 0.9803922, 1,
-0.06280781, 0.3408869, 0.3623759, 0, 1, 0.9882353, 1,
-0.06219179, 0.08712409, -0.6501781, 0, 1, 0.9921569, 1,
-0.06161387, -0.3521617, -2.99174, 0, 1, 1, 1,
-0.06077351, -0.5902931, -4.980887, 0, 0.9921569, 1, 1,
-0.05799765, 0.891806, 1.004548, 0, 0.9882353, 1, 1,
-0.05684873, -1.161989, -4.242427, 0, 0.9803922, 1, 1,
-0.05428298, 0.1873911, 0.8281578, 0, 0.9764706, 1, 1,
-0.05425394, 0.7226189, -1.032723, 0, 0.9686275, 1, 1,
-0.05018579, -0.6442004, -2.344648, 0, 0.9647059, 1, 1,
-0.04508839, 2.019954, -0.1274409, 0, 0.9568627, 1, 1,
-0.04188632, -2.070662, -3.195172, 0, 0.9529412, 1, 1,
-0.04126692, 0.1947595, 0.578171, 0, 0.945098, 1, 1,
-0.03964767, 1.200541, -1.190532, 0, 0.9411765, 1, 1,
-0.03761943, 0.5053812, -1.588868, 0, 0.9333333, 1, 1,
-0.03516267, 1.730041, -2.115225, 0, 0.9294118, 1, 1,
-0.0314894, 0.7872863, 1.043824, 0, 0.9215686, 1, 1,
-0.02747807, 1.1558, -1.275136, 0, 0.9176471, 1, 1,
-0.02691737, 0.372251, -0.7926893, 0, 0.9098039, 1, 1,
-0.02491819, -0.9290365, -4.175187, 0, 0.9058824, 1, 1,
-0.02331233, 0.1646491, -0.4048897, 0, 0.8980392, 1, 1,
-0.02075343, -1.117607, -3.965235, 0, 0.8901961, 1, 1,
-0.02067764, 1.115493, -0.9482856, 0, 0.8862745, 1, 1,
-0.01556268, 0.9819553, -0.2985546, 0, 0.8784314, 1, 1,
-0.01531239, 1.251617, 0.7255933, 0, 0.8745098, 1, 1,
-0.007756867, -1.253959, -2.62327, 0, 0.8666667, 1, 1,
0.0001031751, -0.9148535, 2.838217, 0, 0.8627451, 1, 1,
0.0004234803, 0.3601672, -0.4960763, 0, 0.854902, 1, 1,
0.001575443, 0.4555037, -0.5900563, 0, 0.8509804, 1, 1,
0.007762298, -0.02795477, 1.510827, 0, 0.8431373, 1, 1,
0.01471829, -0.6320038, 2.109487, 0, 0.8392157, 1, 1,
0.01735336, -1.127918, 2.264458, 0, 0.8313726, 1, 1,
0.02009857, -0.1793925, 3.294565, 0, 0.827451, 1, 1,
0.02253315, -1.673761, 3.122806, 0, 0.8196079, 1, 1,
0.02350829, 1.359114, -1.337978, 0, 0.8156863, 1, 1,
0.02419518, -0.1579902, 1.557321, 0, 0.8078431, 1, 1,
0.0250623, 0.7138553, 0.6974858, 0, 0.8039216, 1, 1,
0.02980383, 0.7976386, 2.702951, 0, 0.7960784, 1, 1,
0.03373979, -0.6562942, 2.50609, 0, 0.7882353, 1, 1,
0.03918841, 1.569509, -0.3778471, 0, 0.7843137, 1, 1,
0.04142841, -0.312658, 3.303901, 0, 0.7764706, 1, 1,
0.04243343, 1.149173, 0.5579937, 0, 0.772549, 1, 1,
0.04487351, 2.701775, 0.7303998, 0, 0.7647059, 1, 1,
0.04578114, -0.5313096, 3.297294, 0, 0.7607843, 1, 1,
0.04634594, 0.1304925, 2.470711, 0, 0.7529412, 1, 1,
0.04688186, -1.171407, 2.760443, 0, 0.7490196, 1, 1,
0.05376987, 0.1870732, -0.2403729, 0, 0.7411765, 1, 1,
0.05933886, 0.1183116, -0.1151429, 0, 0.7372549, 1, 1,
0.06039789, -0.4814403, 4.692742, 0, 0.7294118, 1, 1,
0.06167578, 0.122144, 0.2587833, 0, 0.7254902, 1, 1,
0.0626054, -0.7221672, 4.259788, 0, 0.7176471, 1, 1,
0.06343932, -0.6541693, 2.995742, 0, 0.7137255, 1, 1,
0.06737304, 0.6666343, -1.061131, 0, 0.7058824, 1, 1,
0.06878875, -1.669322, 2.452786, 0, 0.6980392, 1, 1,
0.06881242, 0.0004341504, 1.383566, 0, 0.6941177, 1, 1,
0.07073369, 0.4017649, -0.9271415, 0, 0.6862745, 1, 1,
0.07356204, 1.041404, -1.105596, 0, 0.682353, 1, 1,
0.08209942, -0.7171602, 0.6964538, 0, 0.6745098, 1, 1,
0.08966509, 0.02366422, 1.623139, 0, 0.6705883, 1, 1,
0.09142753, -1.270201, 0.7729312, 0, 0.6627451, 1, 1,
0.09699819, -0.3604037, 3.469801, 0, 0.6588235, 1, 1,
0.09985671, 0.6020374, -1.710672, 0, 0.6509804, 1, 1,
0.1014555, -0.3220697, 3.76976, 0, 0.6470588, 1, 1,
0.1034813, -1.138415, 3.429961, 0, 0.6392157, 1, 1,
0.1078752, -1.421113, 2.851272, 0, 0.6352941, 1, 1,
0.1137544, 0.477405, 0.1759288, 0, 0.627451, 1, 1,
0.1141557, 1.460672, -1.816971, 0, 0.6235294, 1, 1,
0.1145546, 0.4379327, 0.4926326, 0, 0.6156863, 1, 1,
0.1147854, -1.086516, 2.043978, 0, 0.6117647, 1, 1,
0.1216732, -0.729359, 3.216118, 0, 0.6039216, 1, 1,
0.1223437, -0.4130503, 2.762482, 0, 0.5960785, 1, 1,
0.1235016, -0.509248, 0.2678714, 0, 0.5921569, 1, 1,
0.1241832, -0.480861, 0.8668219, 0, 0.5843138, 1, 1,
0.1266753, 0.4051897, -0.3844518, 0, 0.5803922, 1, 1,
0.127425, 0.7212106, 0.4430996, 0, 0.572549, 1, 1,
0.1283421, 0.4462282, 0.9113759, 0, 0.5686275, 1, 1,
0.1305464, 0.6041145, -0.01347133, 0, 0.5607843, 1, 1,
0.1316327, 0.1029193, 0.5824432, 0, 0.5568628, 1, 1,
0.1341786, -1.264135, 3.691834, 0, 0.5490196, 1, 1,
0.1343849, -0.165725, 3.824087, 0, 0.5450981, 1, 1,
0.1349194, -0.323353, 2.492181, 0, 0.5372549, 1, 1,
0.1362717, -0.54131, 2.725355, 0, 0.5333334, 1, 1,
0.1368913, 1.128211, 0.2287766, 0, 0.5254902, 1, 1,
0.139062, 0.6931038, 0.2274699, 0, 0.5215687, 1, 1,
0.139828, -0.1888932, 2.706657, 0, 0.5137255, 1, 1,
0.1459471, -1.542468, 2.895142, 0, 0.509804, 1, 1,
0.1468329, 0.4017687, -0.177998, 0, 0.5019608, 1, 1,
0.1479465, 1.855987, -0.6054538, 0, 0.4941176, 1, 1,
0.1495249, 0.812535, -0.5743647, 0, 0.4901961, 1, 1,
0.1525533, -1.437791, 4.088953, 0, 0.4823529, 1, 1,
0.1536847, 0.8373318, -0.4492798, 0, 0.4784314, 1, 1,
0.1548399, -0.8444915, 3.093049, 0, 0.4705882, 1, 1,
0.1565481, -0.7333725, 0.7049634, 0, 0.4666667, 1, 1,
0.1565651, 0.4278995, 1.206467, 0, 0.4588235, 1, 1,
0.1566602, 0.1005763, 0.9708879, 0, 0.454902, 1, 1,
0.1566698, -0.3270786, 3.420143, 0, 0.4470588, 1, 1,
0.1568791, 1.240696, -0.1206327, 0, 0.4431373, 1, 1,
0.1574763, 1.2314, 0.8862031, 0, 0.4352941, 1, 1,
0.1604729, 2.143816, -0.2809179, 0, 0.4313726, 1, 1,
0.160613, 0.6695294, 1.186053, 0, 0.4235294, 1, 1,
0.1623287, -0.153637, 3.192192, 0, 0.4196078, 1, 1,
0.1630694, -0.08012513, 0.5384482, 0, 0.4117647, 1, 1,
0.1632214, 0.6248202, 0.2810829, 0, 0.4078431, 1, 1,
0.1685968, 0.5128374, 0.8801989, 0, 0.4, 1, 1,
0.1703298, 0.4550955, -0.2477954, 0, 0.3921569, 1, 1,
0.1713644, 0.7494868, 0.8976859, 0, 0.3882353, 1, 1,
0.1733792, 1.049491, -0.8955553, 0, 0.3803922, 1, 1,
0.1752956, 0.6028928, 0.4291179, 0, 0.3764706, 1, 1,
0.1757172, 0.8447177, -0.5760552, 0, 0.3686275, 1, 1,
0.1769104, 1.10965, 0.905935, 0, 0.3647059, 1, 1,
0.1781061, -0.4364135, 2.238194, 0, 0.3568628, 1, 1,
0.1869279, 1.856721, 0.007313606, 0, 0.3529412, 1, 1,
0.191834, -0.2309228, 3.162837, 0, 0.345098, 1, 1,
0.1937381, -0.2536531, 1.520272, 0, 0.3411765, 1, 1,
0.1944562, 0.05466561, -0.8614598, 0, 0.3333333, 1, 1,
0.194927, -0.0321921, 2.306159, 0, 0.3294118, 1, 1,
0.1960108, 0.1664039, -0.2357006, 0, 0.3215686, 1, 1,
0.1966613, 0.5185522, 0.8527005, 0, 0.3176471, 1, 1,
0.2005856, 0.5043075, 0.8651825, 0, 0.3098039, 1, 1,
0.2008304, -1.237012, 3.816721, 0, 0.3058824, 1, 1,
0.202641, -0.5482274, 3.451496, 0, 0.2980392, 1, 1,
0.2055768, -0.7550123, 1.918367, 0, 0.2901961, 1, 1,
0.2085703, 0.1672076, 2.165437, 0, 0.2862745, 1, 1,
0.2099404, -0.7312097, 3.308096, 0, 0.2784314, 1, 1,
0.2120548, 1.418478, -1.076708, 0, 0.2745098, 1, 1,
0.2150687, -1.405654, 2.639844, 0, 0.2666667, 1, 1,
0.2178891, 0.2746454, -0.1824255, 0, 0.2627451, 1, 1,
0.2190512, -2.9615, 4.881064, 0, 0.254902, 1, 1,
0.2285106, -0.6262574, 2.46877, 0, 0.2509804, 1, 1,
0.2292776, 0.6006358, 0.2920137, 0, 0.2431373, 1, 1,
0.2327773, 0.6488219, -0.1450869, 0, 0.2392157, 1, 1,
0.2427187, -1.893132, 2.12129, 0, 0.2313726, 1, 1,
0.2504249, -2.560325, 3.10052, 0, 0.227451, 1, 1,
0.258457, -1.249507, 3.553262, 0, 0.2196078, 1, 1,
0.2688954, 0.08318672, 1.152359, 0, 0.2156863, 1, 1,
0.2720819, 0.8372452, -0.5411968, 0, 0.2078431, 1, 1,
0.2763286, 2.464981, -2.08794, 0, 0.2039216, 1, 1,
0.2772217, 0.727541, -0.6754273, 0, 0.1960784, 1, 1,
0.2777162, 0.2791857, 0.8629792, 0, 0.1882353, 1, 1,
0.2780487, -0.2023584, 2.884916, 0, 0.1843137, 1, 1,
0.2783949, 1.091193, 0.06731085, 0, 0.1764706, 1, 1,
0.2794263, 0.6215469, -1.568439, 0, 0.172549, 1, 1,
0.2824841, 0.5167412, 0.8050154, 0, 0.1647059, 1, 1,
0.2855741, 1.513401, 0.6175145, 0, 0.1607843, 1, 1,
0.2940563, -0.0842624, 1.970654, 0, 0.1529412, 1, 1,
0.2950156, -0.1053785, 2.1347, 0, 0.1490196, 1, 1,
0.2964468, -0.8565788, 2.829181, 0, 0.1411765, 1, 1,
0.2975404, -1.532213, 0.3223217, 0, 0.1372549, 1, 1,
0.2979352, 0.8990095, 2.836245, 0, 0.1294118, 1, 1,
0.2981344, 0.8847275, -1.078585, 0, 0.1254902, 1, 1,
0.3052641, -0.3724152, 0.2149621, 0, 0.1176471, 1, 1,
0.3056722, 1.369244, 0.3501228, 0, 0.1137255, 1, 1,
0.3101672, -1.37847, 2.281197, 0, 0.1058824, 1, 1,
0.3124955, -1.092993, 3.200486, 0, 0.09803922, 1, 1,
0.3137719, 0.09660649, 0.7168361, 0, 0.09411765, 1, 1,
0.3138193, -0.9047346, 2.109093, 0, 0.08627451, 1, 1,
0.3142542, -0.5116697, 2.344263, 0, 0.08235294, 1, 1,
0.3165492, 1.53455, -0.9056695, 0, 0.07450981, 1, 1,
0.3203612, 0.6041328, 0.4682335, 0, 0.07058824, 1, 1,
0.3214389, -0.4373614, 3.516165, 0, 0.0627451, 1, 1,
0.3225555, 1.268026, -0.03264536, 0, 0.05882353, 1, 1,
0.3256233, 0.1650729, 0.8427737, 0, 0.05098039, 1, 1,
0.3258566, -2.424443, 3.203978, 0, 0.04705882, 1, 1,
0.3281701, 0.04692485, -0.07040688, 0, 0.03921569, 1, 1,
0.3339495, 0.4384432, -1.002388, 0, 0.03529412, 1, 1,
0.334743, -0.05301812, 1.98009, 0, 0.02745098, 1, 1,
0.3389924, -1.872691, 3.063067, 0, 0.02352941, 1, 1,
0.348969, -1.024001, 2.293361, 0, 0.01568628, 1, 1,
0.3490239, -1.192979, 2.07206, 0, 0.01176471, 1, 1,
0.3529311, 2.278222, 0.3262397, 0, 0.003921569, 1, 1,
0.3542292, 1.454817, -1.845695, 0.003921569, 0, 1, 1,
0.3572031, -0.321569, 2.893642, 0.007843138, 0, 1, 1,
0.3605891, -0.2601273, 2.04206, 0.01568628, 0, 1, 1,
0.3624349, 0.3298443, 1.016796, 0.01960784, 0, 1, 1,
0.3662707, 0.7698876, 0.9677345, 0.02745098, 0, 1, 1,
0.3702617, -0.4604647, 2.044418, 0.03137255, 0, 1, 1,
0.3714871, -1.750224, 1.301113, 0.03921569, 0, 1, 1,
0.3741401, -0.7199975, 2.497293, 0.04313726, 0, 1, 1,
0.3781535, 0.4858786, 2.152409, 0.05098039, 0, 1, 1,
0.3789931, -2.120502, 0.6966667, 0.05490196, 0, 1, 1,
0.3849194, -0.1513969, 2.628254, 0.0627451, 0, 1, 1,
0.3866116, 1.506156, -0.05291322, 0.06666667, 0, 1, 1,
0.3896879, -1.363336, 2.939132, 0.07450981, 0, 1, 1,
0.3903861, 1.455422, -0.6894774, 0.07843138, 0, 1, 1,
0.3964482, -1.665738, 4.093821, 0.08627451, 0, 1, 1,
0.4030264, -0.08009595, 1.837064, 0.09019608, 0, 1, 1,
0.4044177, 1.344928, -0.2681027, 0.09803922, 0, 1, 1,
0.4048476, -0.3748745, 3.820747, 0.1058824, 0, 1, 1,
0.4075681, -0.2911465, 3.66295, 0.1098039, 0, 1, 1,
0.4081864, -0.6793852, 1.245047, 0.1176471, 0, 1, 1,
0.4189575, 1.488948, 0.0154522, 0.1215686, 0, 1, 1,
0.4237019, 0.6098959, 1.581176, 0.1294118, 0, 1, 1,
0.4316475, -0.01630583, 2.135504, 0.1333333, 0, 1, 1,
0.4377384, 0.7342129, 0.7018719, 0.1411765, 0, 1, 1,
0.4397139, -0.2868251, 2.422395, 0.145098, 0, 1, 1,
0.4412255, -0.1566984, 3.235517, 0.1529412, 0, 1, 1,
0.4504679, 2.657731, 2.54739, 0.1568628, 0, 1, 1,
0.4515589, 0.1260803, 1.266002, 0.1647059, 0, 1, 1,
0.4530045, -1.021118, 3.770229, 0.1686275, 0, 1, 1,
0.4562243, 0.2416154, 0.3637584, 0.1764706, 0, 1, 1,
0.4573292, -0.9384396, 2.060525, 0.1803922, 0, 1, 1,
0.4602384, 0.09982813, 1.335534, 0.1882353, 0, 1, 1,
0.4657876, -1.344235, 0.7013851, 0.1921569, 0, 1, 1,
0.4684567, 1.631213, 0.4001327, 0.2, 0, 1, 1,
0.4697647, -0.02656758, 0.9930776, 0.2078431, 0, 1, 1,
0.4704618, 0.6543051, 0.06856793, 0.2117647, 0, 1, 1,
0.47415, 0.204026, 1.681497, 0.2196078, 0, 1, 1,
0.477366, 2.949783, -0.4889843, 0.2235294, 0, 1, 1,
0.4774848, -0.03892597, 2.110454, 0.2313726, 0, 1, 1,
0.4792588, -0.5403763, 1.544373, 0.2352941, 0, 1, 1,
0.4798984, 0.5943838, 1.08331, 0.2431373, 0, 1, 1,
0.4850487, 0.8466528, 0.8082518, 0.2470588, 0, 1, 1,
0.4879666, 1.235988, 0.3725024, 0.254902, 0, 1, 1,
0.4925388, 1.59297, 1.136352, 0.2588235, 0, 1, 1,
0.4942783, 0.6437514, 0.3963001, 0.2666667, 0, 1, 1,
0.4972354, 0.3821366, 0.9128317, 0.2705882, 0, 1, 1,
0.5075637, 1.398127, 0.3714689, 0.2784314, 0, 1, 1,
0.5145279, -0.8732371, 2.661132, 0.282353, 0, 1, 1,
0.5171894, -0.287834, 2.078195, 0.2901961, 0, 1, 1,
0.5180098, 0.3686274, 0.4990835, 0.2941177, 0, 1, 1,
0.5180675, -1.264793, 2.034329, 0.3019608, 0, 1, 1,
0.5196351, 1.373619, 0.2701546, 0.3098039, 0, 1, 1,
0.5218015, 1.798017, 0.4672286, 0.3137255, 0, 1, 1,
0.5227062, -1.572732, 0.6536798, 0.3215686, 0, 1, 1,
0.5228212, 0.6127545, 1.082355, 0.3254902, 0, 1, 1,
0.5232965, -0.1789354, 2.944037, 0.3333333, 0, 1, 1,
0.5234097, -0.7540247, 1.6163, 0.3372549, 0, 1, 1,
0.5245515, 0.2682846, 1.324521, 0.345098, 0, 1, 1,
0.5247071, 0.3727233, -0.8160681, 0.3490196, 0, 1, 1,
0.5247189, -1.557994, 1.268591, 0.3568628, 0, 1, 1,
0.5283439, 1.963553, 0.22106, 0.3607843, 0, 1, 1,
0.5308951, -0.5069168, 2.616998, 0.3686275, 0, 1, 1,
0.5334033, 1.563098, -0.6572659, 0.372549, 0, 1, 1,
0.5366013, 1.42149, 1.279646, 0.3803922, 0, 1, 1,
0.5380616, -2.176295, 2.660566, 0.3843137, 0, 1, 1,
0.538338, -0.5145347, 0.4437289, 0.3921569, 0, 1, 1,
0.541526, 0.8650277, 0.8147737, 0.3960784, 0, 1, 1,
0.5417337, 0.2477179, 1.911235, 0.4039216, 0, 1, 1,
0.5421058, 1.32211, 0.5473237, 0.4117647, 0, 1, 1,
0.5431693, 2.05617, -0.397393, 0.4156863, 0, 1, 1,
0.5437809, 0.986232, 0.8125879, 0.4235294, 0, 1, 1,
0.550402, 0.5229, 1.574256, 0.427451, 0, 1, 1,
0.5535002, -0.01994672, 2.594053, 0.4352941, 0, 1, 1,
0.5547379, 0.7711875, 0.4443134, 0.4392157, 0, 1, 1,
0.5614406, 1.178627, 2.413933, 0.4470588, 0, 1, 1,
0.5630807, 0.8447672, -0.9374403, 0.4509804, 0, 1, 1,
0.5652196, 0.3240498, -0.6714661, 0.4588235, 0, 1, 1,
0.5753031, -1.461219, 0.325954, 0.4627451, 0, 1, 1,
0.5790671, -0.132998, 1.362062, 0.4705882, 0, 1, 1,
0.5800332, 0.7030218, 1.223311, 0.4745098, 0, 1, 1,
0.5818358, -0.8040924, 1.120553, 0.4823529, 0, 1, 1,
0.585605, 0.41443, 0.2139814, 0.4862745, 0, 1, 1,
0.5871469, -0.2292082, 1.088656, 0.4941176, 0, 1, 1,
0.5948427, 1.822339, -0.9139588, 0.5019608, 0, 1, 1,
0.6023797, -0.7400649, 1.417852, 0.5058824, 0, 1, 1,
0.6034809, 1.029754, -0.2236296, 0.5137255, 0, 1, 1,
0.6053548, 0.2283159, 1.016509, 0.5176471, 0, 1, 1,
0.6133071, 1.033242, 1.678034, 0.5254902, 0, 1, 1,
0.6150146, -2.174536, 2.814407, 0.5294118, 0, 1, 1,
0.6159138, -0.01468174, 1.868055, 0.5372549, 0, 1, 1,
0.620224, 2.49636, 0.8362915, 0.5411765, 0, 1, 1,
0.6213912, 1.051703, 1.704816, 0.5490196, 0, 1, 1,
0.6225316, 2.58838, 0.9402414, 0.5529412, 0, 1, 1,
0.6247903, 0.3703824, 2.603284, 0.5607843, 0, 1, 1,
0.6252347, -0.5060342, 1.844233, 0.5647059, 0, 1, 1,
0.6262332, -0.3058808, 1.114512, 0.572549, 0, 1, 1,
0.627956, -0.8828793, 3.119803, 0.5764706, 0, 1, 1,
0.629056, -1.47779, 3.711771, 0.5843138, 0, 1, 1,
0.6299527, -0.9737883, 3.285381, 0.5882353, 0, 1, 1,
0.6345993, -1.393189, 3.344401, 0.5960785, 0, 1, 1,
0.6352348, 1.075383, 0.8128259, 0.6039216, 0, 1, 1,
0.6410713, 0.05059635, -0.4571673, 0.6078432, 0, 1, 1,
0.6450276, 0.5922972, -0.9571539, 0.6156863, 0, 1, 1,
0.6454657, -0.035113, 2.004845, 0.6196079, 0, 1, 1,
0.6516249, -1.596163, 2.734883, 0.627451, 0, 1, 1,
0.65729, -2.480253, 3.923325, 0.6313726, 0, 1, 1,
0.6630881, -0.8498473, 0.8930178, 0.6392157, 0, 1, 1,
0.6633695, 0.397446, -0.8080854, 0.6431373, 0, 1, 1,
0.6670244, -2.133774, 3.189015, 0.6509804, 0, 1, 1,
0.683254, 0.03007679, 1.415331, 0.654902, 0, 1, 1,
0.6902101, 0.8529899, 2.368974, 0.6627451, 0, 1, 1,
0.6923742, 0.6505773, 0.06528828, 0.6666667, 0, 1, 1,
0.6937657, 1.42311, 0.733214, 0.6745098, 0, 1, 1,
0.6955139, -0.7366647, 3.368218, 0.6784314, 0, 1, 1,
0.7002241, 1.560868, -0.0761506, 0.6862745, 0, 1, 1,
0.7020609, -0.07430983, 1.092045, 0.6901961, 0, 1, 1,
0.7053763, 0.2083634, 1.905623, 0.6980392, 0, 1, 1,
0.7062587, 0.4691865, 1.730049, 0.7058824, 0, 1, 1,
0.7064269, 1.332333, 2.411009, 0.7098039, 0, 1, 1,
0.70961, 0.8922511, -0.9686399, 0.7176471, 0, 1, 1,
0.7107709, 0.6392514, 0.5288212, 0.7215686, 0, 1, 1,
0.722067, -0.6104194, 1.352847, 0.7294118, 0, 1, 1,
0.7282206, 0.08674113, 1.558242, 0.7333333, 0, 1, 1,
0.7282943, -1.341547, 3.643363, 0.7411765, 0, 1, 1,
0.737173, -0.1260847, 1.072214, 0.7450981, 0, 1, 1,
0.7493508, -0.8436548, 3.813363, 0.7529412, 0, 1, 1,
0.7558644, -0.3111058, 1.125397, 0.7568628, 0, 1, 1,
0.7655473, 1.334809, -0.06329011, 0.7647059, 0, 1, 1,
0.7665939, -0.2084044, 1.920879, 0.7686275, 0, 1, 1,
0.7686281, -1.75139, 3.596028, 0.7764706, 0, 1, 1,
0.7792577, -1.064402, 1.828783, 0.7803922, 0, 1, 1,
0.7824934, 0.1240312, 3.457154, 0.7882353, 0, 1, 1,
0.7858344, 1.168494, 1.537829, 0.7921569, 0, 1, 1,
0.7875184, 2.113339, -1.831493, 0.8, 0, 1, 1,
0.7954522, 0.4417554, 1.956026, 0.8078431, 0, 1, 1,
0.7958307, 0.954102, 0.8155258, 0.8117647, 0, 1, 1,
0.8121294, -1.852568, 2.90169, 0.8196079, 0, 1, 1,
0.8147969, 0.1731933, 1.359321, 0.8235294, 0, 1, 1,
0.821747, 0.07337568, 0.1428804, 0.8313726, 0, 1, 1,
0.8246191, 0.3947828, 0.7431721, 0.8352941, 0, 1, 1,
0.8340024, -1.096162, 2.134526, 0.8431373, 0, 1, 1,
0.8361627, 2.129521, 1.701575, 0.8470588, 0, 1, 1,
0.8363283, 0.3867247, 1.387463, 0.854902, 0, 1, 1,
0.8373253, 0.8663185, 0.1288569, 0.8588235, 0, 1, 1,
0.8432468, 2.606226, -0.6509079, 0.8666667, 0, 1, 1,
0.844052, 1.455369, 0.421018, 0.8705882, 0, 1, 1,
0.8521621, -0.6741114, 1.283042, 0.8784314, 0, 1, 1,
0.8546922, -0.5816681, 1.966739, 0.8823529, 0, 1, 1,
0.8546949, 0.7152248, -0.1461323, 0.8901961, 0, 1, 1,
0.8554715, -0.8130184, 1.687218, 0.8941177, 0, 1, 1,
0.8569627, 0.8164958, 0.7118301, 0.9019608, 0, 1, 1,
0.8625259, -0.5064644, 3.786412, 0.9098039, 0, 1, 1,
0.8628259, 1.216062, 1.277435, 0.9137255, 0, 1, 1,
0.864807, 0.3638074, 1.360952, 0.9215686, 0, 1, 1,
0.8661557, 1.450487, -0.3267018, 0.9254902, 0, 1, 1,
0.8661848, 0.2963665, 1.213706, 0.9333333, 0, 1, 1,
0.871472, -0.7953131, 3.180139, 0.9372549, 0, 1, 1,
0.8741854, -1.107585, 3.226826, 0.945098, 0, 1, 1,
0.8746486, -0.5202417, 2.536618, 0.9490196, 0, 1, 1,
0.876439, -0.3582216, 3.509996, 0.9568627, 0, 1, 1,
0.8767742, -1.705298, 4.297456, 0.9607843, 0, 1, 1,
0.8781536, -0.7101029, 2.094736, 0.9686275, 0, 1, 1,
0.8839553, 0.8247877, 1.46958, 0.972549, 0, 1, 1,
0.8841659, 1.455584, 0.2189097, 0.9803922, 0, 1, 1,
0.887134, -0.916475, 0.3013456, 0.9843137, 0, 1, 1,
0.8930233, 1.207674, -0.1425254, 0.9921569, 0, 1, 1,
0.8967565, 0.6624978, 1.434484, 0.9960784, 0, 1, 1,
0.8979392, 0.7791632, 2.673811, 1, 0, 0.9960784, 1,
0.9021779, -0.7721791, 1.370733, 1, 0, 0.9882353, 1,
0.9030923, -1.076138, -0.05799425, 1, 0, 0.9843137, 1,
0.9069052, 0.1160931, 0.9102496, 1, 0, 0.9764706, 1,
0.9078535, -1.193075, 2.349445, 1, 0, 0.972549, 1,
0.924119, -0.2463659, 2.468258, 1, 0, 0.9647059, 1,
0.9266872, -1.652388, 4.582333, 1, 0, 0.9607843, 1,
0.9303843, -0.355165, 1.683899, 1, 0, 0.9529412, 1,
0.9324053, -1.457416, 1.564478, 1, 0, 0.9490196, 1,
0.9331687, -0.1366131, 3.560839, 1, 0, 0.9411765, 1,
0.9342051, 0.6604255, 0.4846902, 1, 0, 0.9372549, 1,
0.9456845, 1.803345, 2.138858, 1, 0, 0.9294118, 1,
0.974016, 0.9359395, 0.371954, 1, 0, 0.9254902, 1,
0.9786071, 0.5346054, 1.456013, 1, 0, 0.9176471, 1,
0.979008, -0.9890831, 1.779185, 1, 0, 0.9137255, 1,
0.9901672, -1.690316, 1.575655, 1, 0, 0.9058824, 1,
0.9913138, 0.527351, -0.1712916, 1, 0, 0.9019608, 1,
0.9960601, -0.749365, 2.198844, 1, 0, 0.8941177, 1,
0.9974309, 1.335724, 0.8294212, 1, 0, 0.8862745, 1,
0.997709, 0.4353384, 0.5292083, 1, 0, 0.8823529, 1,
1.006418, 2.040929, 3.718462, 1, 0, 0.8745098, 1,
1.008258, 0.0416586, 1.440506, 1, 0, 0.8705882, 1,
1.016843, 0.07999528, 2.03061, 1, 0, 0.8627451, 1,
1.024084, -1.082042, 3.970568, 1, 0, 0.8588235, 1,
1.025066, -0.2217425, 2.111024, 1, 0, 0.8509804, 1,
1.033784, -1.21196, 2.628353, 1, 0, 0.8470588, 1,
1.040428, -0.6510333, 3.090478, 1, 0, 0.8392157, 1,
1.046009, -1.821744, 4.066171, 1, 0, 0.8352941, 1,
1.046638, -1.449262, 2.031083, 1, 0, 0.827451, 1,
1.047079, -0.198844, 1.649621, 1, 0, 0.8235294, 1,
1.048953, -1.172755, 2.836698, 1, 0, 0.8156863, 1,
1.054831, 0.6642224, 0.5752185, 1, 0, 0.8117647, 1,
1.057962, -0.1788642, 3.008889, 1, 0, 0.8039216, 1,
1.066106, -1.763447, 2.441058, 1, 0, 0.7960784, 1,
1.066302, 0.03121916, 3.457853, 1, 0, 0.7921569, 1,
1.067791, -1.014356, 0.1121899, 1, 0, 0.7843137, 1,
1.08459, -0.6838671, 3.683651, 1, 0, 0.7803922, 1,
1.087936, 0.6302126, 1.122324, 1, 0, 0.772549, 1,
1.090306, 1.776786, 1.227094, 1, 0, 0.7686275, 1,
1.091377, -1.756069, 3.749684, 1, 0, 0.7607843, 1,
1.096234, -0.9289849, 2.021719, 1, 0, 0.7568628, 1,
1.109433, -0.5078821, 1.221395, 1, 0, 0.7490196, 1,
1.113705, 1.633741, 0.9098584, 1, 0, 0.7450981, 1,
1.119774, -0.4230737, 3.240853, 1, 0, 0.7372549, 1,
1.120224, -0.7794375, 0.6311004, 1, 0, 0.7333333, 1,
1.12379, -2.319459, 4.056204, 1, 0, 0.7254902, 1,
1.144027, 2.348892, 1.286185, 1, 0, 0.7215686, 1,
1.148123, 0.2723525, 2.778312, 1, 0, 0.7137255, 1,
1.150199, 0.5289015, 0.2268499, 1, 0, 0.7098039, 1,
1.152834, -0.5335655, 2.788508, 1, 0, 0.7019608, 1,
1.153111, 0.07441819, 1.980716, 1, 0, 0.6941177, 1,
1.156351, 0.8217154, 3.745875, 1, 0, 0.6901961, 1,
1.156989, 0.4442706, 0.8782467, 1, 0, 0.682353, 1,
1.159534, -0.1945261, 1.355433, 1, 0, 0.6784314, 1,
1.170094, -0.09614529, 3.167745, 1, 0, 0.6705883, 1,
1.173345, -0.2771347, 2.196441, 1, 0, 0.6666667, 1,
1.179773, -1.247165, 2.664166, 1, 0, 0.6588235, 1,
1.183682, -1.807964, 0.1553784, 1, 0, 0.654902, 1,
1.194175, -3.967174, 2.62668, 1, 0, 0.6470588, 1,
1.194807, -0.9776207, 0.5626388, 1, 0, 0.6431373, 1,
1.195743, 1.029962, -0.812226, 1, 0, 0.6352941, 1,
1.195969, -1.254996, 1.496931, 1, 0, 0.6313726, 1,
1.202288, 1.353664, -0.5309103, 1, 0, 0.6235294, 1,
1.21987, -1.072809, 2.768522, 1, 0, 0.6196079, 1,
1.226037, -0.9316155, 1.229618, 1, 0, 0.6117647, 1,
1.234853, 0.5698662, 0.4651351, 1, 0, 0.6078432, 1,
1.237358, 0.4255248, 1.102524, 1, 0, 0.6, 1,
1.240336, -1.125607, 2.030012, 1, 0, 0.5921569, 1,
1.247511, 0.5482683, 1.667995, 1, 0, 0.5882353, 1,
1.249898, 0.4885446, 1.158796, 1, 0, 0.5803922, 1,
1.253749, -1.084517, 2.598143, 1, 0, 0.5764706, 1,
1.2615, -0.3376144, 3.423348, 1, 0, 0.5686275, 1,
1.264153, -0.7964435, 1.399407, 1, 0, 0.5647059, 1,
1.281268, -0.02326757, 1.490387, 1, 0, 0.5568628, 1,
1.285471, -0.9251655, 2.425226, 1, 0, 0.5529412, 1,
1.288259, -0.2908002, 1.702721, 1, 0, 0.5450981, 1,
1.289871, 0.6132246, 2.982829, 1, 0, 0.5411765, 1,
1.293324, -0.7955208, 2.139207, 1, 0, 0.5333334, 1,
1.296396, 1.558381, 0.4892686, 1, 0, 0.5294118, 1,
1.297606, -0.1163348, 1.189144, 1, 0, 0.5215687, 1,
1.3062, -0.1348786, 0.9231039, 1, 0, 0.5176471, 1,
1.31474, -1.104354, 2.030669, 1, 0, 0.509804, 1,
1.326914, 1.804944, 0.6438277, 1, 0, 0.5058824, 1,
1.329416, -1.019138, 1.544131, 1, 0, 0.4980392, 1,
1.333418, -0.5430768, 2.712878, 1, 0, 0.4901961, 1,
1.334055, -0.0493257, 1.399902, 1, 0, 0.4862745, 1,
1.334877, -0.2375391, 1.786706, 1, 0, 0.4784314, 1,
1.348447, 0.4238928, -0.8533516, 1, 0, 0.4745098, 1,
1.35194, 1.274325, 1.827433, 1, 0, 0.4666667, 1,
1.360929, 1.374094, -0.5610618, 1, 0, 0.4627451, 1,
1.365041, 0.0322468, 1.664369, 1, 0, 0.454902, 1,
1.368153, -0.4877842, 1.393919, 1, 0, 0.4509804, 1,
1.376665, 1.460066, 2.596204, 1, 0, 0.4431373, 1,
1.391402, -0.2237613, 0.5811652, 1, 0, 0.4392157, 1,
1.393433, 1.209813, 1.889352, 1, 0, 0.4313726, 1,
1.393528, 0.3140952, 1.495432, 1, 0, 0.427451, 1,
1.404651, -0.1775865, 0.5512387, 1, 0, 0.4196078, 1,
1.413959, -0.3744908, 2.892739, 1, 0, 0.4156863, 1,
1.429963, -0.5878406, 2.649092, 1, 0, 0.4078431, 1,
1.444616, -0.4762773, 1.866387, 1, 0, 0.4039216, 1,
1.463448, -1.182006, 2.590833, 1, 0, 0.3960784, 1,
1.487437, 1.162599, -0.1394492, 1, 0, 0.3882353, 1,
1.500518, 0.209035, 1.201285, 1, 0, 0.3843137, 1,
1.505211, -1.878565, 3.011181, 1, 0, 0.3764706, 1,
1.524748, 1.539355, 0.1141635, 1, 0, 0.372549, 1,
1.539118, 2.475888, -0.08134502, 1, 0, 0.3647059, 1,
1.54161, -1.10635, 2.932603, 1, 0, 0.3607843, 1,
1.558857, 0.6367047, 1.700801, 1, 0, 0.3529412, 1,
1.564184, -0.2936182, 1.361226, 1, 0, 0.3490196, 1,
1.566618, 0.560854, 1.960068, 1, 0, 0.3411765, 1,
1.584949, 0.226294, 1.641964, 1, 0, 0.3372549, 1,
1.635162, 0.2294127, 1.40556, 1, 0, 0.3294118, 1,
1.658591, -0.8788665, 2.999006, 1, 0, 0.3254902, 1,
1.660152, 0.429239, 2.131011, 1, 0, 0.3176471, 1,
1.66652, 1.740498, 2.14787, 1, 0, 0.3137255, 1,
1.669593, -0.8917575, 2.020678, 1, 0, 0.3058824, 1,
1.670286, 0.4641214, 2.088334, 1, 0, 0.2980392, 1,
1.682253, 0.110255, 0.9376947, 1, 0, 0.2941177, 1,
1.712227, 1.073732, 1.187821, 1, 0, 0.2862745, 1,
1.726711, 1.239054, -0.9483645, 1, 0, 0.282353, 1,
1.726911, 0.9284192, 0.2030085, 1, 0, 0.2745098, 1,
1.728331, -0.08804135, 3.67359, 1, 0, 0.2705882, 1,
1.77165, -0.449931, 2.331556, 1, 0, 0.2627451, 1,
1.804242, 0.1225374, 1.1299, 1, 0, 0.2588235, 1,
1.805404, -0.1715061, 0.5998429, 1, 0, 0.2509804, 1,
1.805935, -0.6900353, 0.06545725, 1, 0, 0.2470588, 1,
1.815137, 0.1394278, 0.0878562, 1, 0, 0.2392157, 1,
1.819013, -0.5023559, 1.780392, 1, 0, 0.2352941, 1,
1.820632, 0.3897733, 2.733589, 1, 0, 0.227451, 1,
1.821298, 0.1525152, 1.927081, 1, 0, 0.2235294, 1,
1.823987, -0.9192908, 2.147188, 1, 0, 0.2156863, 1,
1.825116, 1.615425, 1.090628, 1, 0, 0.2117647, 1,
1.827688, 0.8886929, 0.6745617, 1, 0, 0.2039216, 1,
1.831563, 0.09459889, 2.849507, 1, 0, 0.1960784, 1,
1.834387, 0.8295048, 2.312545, 1, 0, 0.1921569, 1,
1.843079, 0.786763, 0.1609554, 1, 0, 0.1843137, 1,
1.858148, 0.08770146, 2.064569, 1, 0, 0.1803922, 1,
1.879582, 0.8954213, 0.7349981, 1, 0, 0.172549, 1,
1.880656, 1.166808, 2.628564, 1, 0, 0.1686275, 1,
1.93058, 0.09674225, 3.076811, 1, 0, 0.1607843, 1,
1.95547, -0.7014024, 2.768476, 1, 0, 0.1568628, 1,
2.002228, -2.321775, 3.686676, 1, 0, 0.1490196, 1,
2.00435, -1.089692, 1.892934, 1, 0, 0.145098, 1,
2.025505, 0.6222141, 0.5809531, 1, 0, 0.1372549, 1,
2.026441, 0.729134, 0.09627073, 1, 0, 0.1333333, 1,
2.028481, -0.4415714, 2.058481, 1, 0, 0.1254902, 1,
2.036398, -1.984313, 3.802905, 1, 0, 0.1215686, 1,
2.072259, 0.1370287, 1.265685, 1, 0, 0.1137255, 1,
2.11831, 0.5625228, 0.3711747, 1, 0, 0.1098039, 1,
2.17094, 0.7158625, 2.230057, 1, 0, 0.1019608, 1,
2.186123, -0.3026388, 1.574866, 1, 0, 0.09411765, 1,
2.191532, -0.9830833, 2.157, 1, 0, 0.09019608, 1,
2.276415, -0.2172184, 2.889464, 1, 0, 0.08235294, 1,
2.281476, -0.8829093, 1.679448, 1, 0, 0.07843138, 1,
2.333976, 1.159296, -1.029188, 1, 0, 0.07058824, 1,
2.371929, -0.2260632, 2.282454, 1, 0, 0.06666667, 1,
2.430221, -1.533373, 0.8516096, 1, 0, 0.05882353, 1,
2.489221, -0.778349, 3.167686, 1, 0, 0.05490196, 1,
2.497959, -0.3224615, 1.01025, 1, 0, 0.04705882, 1,
2.506766, 0.03432306, 1.25021, 1, 0, 0.04313726, 1,
2.586741, 1.141021, 0.4102158, 1, 0, 0.03529412, 1,
2.588727, 0.1807473, 2.567207, 1, 0, 0.03137255, 1,
2.758695, 0.4386327, 3.269315, 1, 0, 0.02352941, 1,
2.858237, 0.07498735, 2.819856, 1, 0, 0.01960784, 1,
2.870015, -1.887012, 3.935077, 1, 0, 0.01176471, 1,
2.907963, -0.6848695, 1.881608, 1, 0, 0.007843138, 1
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
-0.1408679, -5.139598, -7.428672, 0, -0.5, 0.5, 0.5,
-0.1408679, -5.139598, -7.428672, 1, -0.5, 0.5, 0.5,
-0.1408679, -5.139598, -7.428672, 1, 1.5, 0.5, 0.5,
-0.1408679, -5.139598, -7.428672, 0, 1.5, 0.5, 0.5
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
-4.223252, -0.5086956, -7.428672, 0, -0.5, 0.5, 0.5,
-4.223252, -0.5086956, -7.428672, 1, -0.5, 0.5, 0.5,
-4.223252, -0.5086956, -7.428672, 1, 1.5, 0.5, 0.5,
-4.223252, -0.5086956, -7.428672, 0, 1.5, 0.5, 0.5
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
-4.223252, -5.139598, -0.3817558, 0, -0.5, 0.5, 0.5,
-4.223252, -5.139598, -0.3817558, 1, -0.5, 0.5, 0.5,
-4.223252, -5.139598, -0.3817558, 1, 1.5, 0.5, 0.5,
-4.223252, -5.139598, -0.3817558, 0, 1.5, 0.5, 0.5
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
-3, -4.070928, -5.802461,
2, -4.070928, -5.802461,
-3, -4.070928, -5.802461,
-3, -4.24904, -6.073496,
-2, -4.070928, -5.802461,
-2, -4.24904, -6.073496,
-1, -4.070928, -5.802461,
-1, -4.24904, -6.073496,
0, -4.070928, -5.802461,
0, -4.24904, -6.073496,
1, -4.070928, -5.802461,
1, -4.24904, -6.073496,
2, -4.070928, -5.802461,
2, -4.24904, -6.073496
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
-3, -4.605263, -6.615566, 0, -0.5, 0.5, 0.5,
-3, -4.605263, -6.615566, 1, -0.5, 0.5, 0.5,
-3, -4.605263, -6.615566, 1, 1.5, 0.5, 0.5,
-3, -4.605263, -6.615566, 0, 1.5, 0.5, 0.5,
-2, -4.605263, -6.615566, 0, -0.5, 0.5, 0.5,
-2, -4.605263, -6.615566, 1, -0.5, 0.5, 0.5,
-2, -4.605263, -6.615566, 1, 1.5, 0.5, 0.5,
-2, -4.605263, -6.615566, 0, 1.5, 0.5, 0.5,
-1, -4.605263, -6.615566, 0, -0.5, 0.5, 0.5,
-1, -4.605263, -6.615566, 1, -0.5, 0.5, 0.5,
-1, -4.605263, -6.615566, 1, 1.5, 0.5, 0.5,
-1, -4.605263, -6.615566, 0, 1.5, 0.5, 0.5,
0, -4.605263, -6.615566, 0, -0.5, 0.5, 0.5,
0, -4.605263, -6.615566, 1, -0.5, 0.5, 0.5,
0, -4.605263, -6.615566, 1, 1.5, 0.5, 0.5,
0, -4.605263, -6.615566, 0, 1.5, 0.5, 0.5,
1, -4.605263, -6.615566, 0, -0.5, 0.5, 0.5,
1, -4.605263, -6.615566, 1, -0.5, 0.5, 0.5,
1, -4.605263, -6.615566, 1, 1.5, 0.5, 0.5,
1, -4.605263, -6.615566, 0, 1.5, 0.5, 0.5,
2, -4.605263, -6.615566, 0, -0.5, 0.5, 0.5,
2, -4.605263, -6.615566, 1, -0.5, 0.5, 0.5,
2, -4.605263, -6.615566, 1, 1.5, 0.5, 0.5,
2, -4.605263, -6.615566, 0, 1.5, 0.5, 0.5
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
-3.281163, -3, -5.802461,
-3.281163, 2, -5.802461,
-3.281163, -3, -5.802461,
-3.438178, -3, -6.073496,
-3.281163, -2, -5.802461,
-3.438178, -2, -6.073496,
-3.281163, -1, -5.802461,
-3.438178, -1, -6.073496,
-3.281163, 0, -5.802461,
-3.438178, 0, -6.073496,
-3.281163, 1, -5.802461,
-3.438178, 1, -6.073496,
-3.281163, 2, -5.802461,
-3.438178, 2, -6.073496
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
-3.752208, -3, -6.615566, 0, -0.5, 0.5, 0.5,
-3.752208, -3, -6.615566, 1, -0.5, 0.5, 0.5,
-3.752208, -3, -6.615566, 1, 1.5, 0.5, 0.5,
-3.752208, -3, -6.615566, 0, 1.5, 0.5, 0.5,
-3.752208, -2, -6.615566, 0, -0.5, 0.5, 0.5,
-3.752208, -2, -6.615566, 1, -0.5, 0.5, 0.5,
-3.752208, -2, -6.615566, 1, 1.5, 0.5, 0.5,
-3.752208, -2, -6.615566, 0, 1.5, 0.5, 0.5,
-3.752208, -1, -6.615566, 0, -0.5, 0.5, 0.5,
-3.752208, -1, -6.615566, 1, -0.5, 0.5, 0.5,
-3.752208, -1, -6.615566, 1, 1.5, 0.5, 0.5,
-3.752208, -1, -6.615566, 0, 1.5, 0.5, 0.5,
-3.752208, 0, -6.615566, 0, -0.5, 0.5, 0.5,
-3.752208, 0, -6.615566, 1, -0.5, 0.5, 0.5,
-3.752208, 0, -6.615566, 1, 1.5, 0.5, 0.5,
-3.752208, 0, -6.615566, 0, 1.5, 0.5, 0.5,
-3.752208, 1, -6.615566, 0, -0.5, 0.5, 0.5,
-3.752208, 1, -6.615566, 1, -0.5, 0.5, 0.5,
-3.752208, 1, -6.615566, 1, 1.5, 0.5, 0.5,
-3.752208, 1, -6.615566, 0, 1.5, 0.5, 0.5,
-3.752208, 2, -6.615566, 0, -0.5, 0.5, 0.5,
-3.752208, 2, -6.615566, 1, -0.5, 0.5, 0.5,
-3.752208, 2, -6.615566, 1, 1.5, 0.5, 0.5,
-3.752208, 2, -6.615566, 0, 1.5, 0.5, 0.5
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
-3.281163, -4.070928, -4,
-3.281163, -4.070928, 4,
-3.281163, -4.070928, -4,
-3.438178, -4.24904, -4,
-3.281163, -4.070928, -2,
-3.438178, -4.24904, -2,
-3.281163, -4.070928, 0,
-3.438178, -4.24904, 0,
-3.281163, -4.070928, 2,
-3.438178, -4.24904, 2,
-3.281163, -4.070928, 4,
-3.438178, -4.24904, 4
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
-3.752208, -4.605263, -4, 0, -0.5, 0.5, 0.5,
-3.752208, -4.605263, -4, 1, -0.5, 0.5, 0.5,
-3.752208, -4.605263, -4, 1, 1.5, 0.5, 0.5,
-3.752208, -4.605263, -4, 0, 1.5, 0.5, 0.5,
-3.752208, -4.605263, -2, 0, -0.5, 0.5, 0.5,
-3.752208, -4.605263, -2, 1, -0.5, 0.5, 0.5,
-3.752208, -4.605263, -2, 1, 1.5, 0.5, 0.5,
-3.752208, -4.605263, -2, 0, 1.5, 0.5, 0.5,
-3.752208, -4.605263, 0, 0, -0.5, 0.5, 0.5,
-3.752208, -4.605263, 0, 1, -0.5, 0.5, 0.5,
-3.752208, -4.605263, 0, 1, 1.5, 0.5, 0.5,
-3.752208, -4.605263, 0, 0, 1.5, 0.5, 0.5,
-3.752208, -4.605263, 2, 0, -0.5, 0.5, 0.5,
-3.752208, -4.605263, 2, 1, -0.5, 0.5, 0.5,
-3.752208, -4.605263, 2, 1, 1.5, 0.5, 0.5,
-3.752208, -4.605263, 2, 0, 1.5, 0.5, 0.5,
-3.752208, -4.605263, 4, 0, -0.5, 0.5, 0.5,
-3.752208, -4.605263, 4, 1, -0.5, 0.5, 0.5,
-3.752208, -4.605263, 4, 1, 1.5, 0.5, 0.5,
-3.752208, -4.605263, 4, 0, 1.5, 0.5, 0.5
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
-3.281163, -4.070928, -5.802461,
-3.281163, 3.053537, -5.802461,
-3.281163, -4.070928, 5.038949,
-3.281163, 3.053537, 5.038949,
-3.281163, -4.070928, -5.802461,
-3.281163, -4.070928, 5.038949,
-3.281163, 3.053537, -5.802461,
-3.281163, 3.053537, 5.038949,
-3.281163, -4.070928, -5.802461,
2.999428, -4.070928, -5.802461,
-3.281163, -4.070928, 5.038949,
2.999428, -4.070928, 5.038949,
-3.281163, 3.053537, -5.802461,
2.999428, 3.053537, -5.802461,
-3.281163, 3.053537, 5.038949,
2.999428, 3.053537, 5.038949,
2.999428, -4.070928, -5.802461,
2.999428, 3.053537, -5.802461,
2.999428, -4.070928, 5.038949,
2.999428, 3.053537, 5.038949,
2.999428, -4.070928, -5.802461,
2.999428, -4.070928, 5.038949,
2.999428, 3.053537, -5.802461,
2.999428, 3.053537, 5.038949
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
var radius = 7.696363;
var distance = 34.24199;
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
mvMatrix.translate( 0.1408679, 0.5086956, 0.3817558 );
mvMatrix.scale( 1.324948, 1.168012, 0.7675623 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.24199);
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
sulfallate<-read.table("sulfallate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sulfallate$V2
```

```
## Error in eval(expr, envir, enclos): object 'sulfallate' not found
```

```r
y<-sulfallate$V3
```

```
## Error in eval(expr, envir, enclos): object 'sulfallate' not found
```

```r
z<-sulfallate$V4
```

```
## Error in eval(expr, envir, enclos): object 'sulfallate' not found
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
-3.189698, -0.5853332, -2.292228, 0, 0, 1, 1, 1,
-2.826083, -0.117017, 0.3584999, 1, 0, 0, 1, 1,
-2.726718, -0.3052697, -2.213318, 1, 0, 0, 1, 1,
-2.710765, 0.3220805, -2.878956, 1, 0, 0, 1, 1,
-2.675775, 0.7446545, -0.5405585, 1, 0, 0, 1, 1,
-2.650648, 0.7016335, -1.269829, 1, 0, 0, 1, 1,
-2.57606, -1.08052, -2.427319, 0, 0, 0, 1, 1,
-2.55686, -0.410341, -3.209892, 0, 0, 0, 1, 1,
-2.555885, -1.078864, -2.880339, 0, 0, 0, 1, 1,
-2.388435, -0.4943904, -1.484604, 0, 0, 0, 1, 1,
-2.376618, 0.627986, -1.091646, 0, 0, 0, 1, 1,
-2.32207, 0.8586712, 0.5712482, 0, 0, 0, 1, 1,
-2.313572, -1.619451, 0.02470199, 0, 0, 0, 1, 1,
-2.309937, 0.8388671, -1.932212, 1, 1, 1, 1, 1,
-2.301778, -0.346711, -1.674486, 1, 1, 1, 1, 1,
-2.289734, 0.0756028, -0.9329867, 1, 1, 1, 1, 1,
-2.270406, -0.6343017, -1.702308, 1, 1, 1, 1, 1,
-2.264736, 0.5456857, -2.249174, 1, 1, 1, 1, 1,
-2.242785, 1.358728, -1.134227, 1, 1, 1, 1, 1,
-2.178979, -1.517558, -1.064378, 1, 1, 1, 1, 1,
-2.148581, 0.618936, -3.234321, 1, 1, 1, 1, 1,
-2.130188, 0.1766971, -2.489877, 1, 1, 1, 1, 1,
-2.090464, 0.9543937, 0.2298059, 1, 1, 1, 1, 1,
-2.073184, -1.045593, -1.855059, 1, 1, 1, 1, 1,
-2.061998, -1.245594, -2.781858, 1, 1, 1, 1, 1,
-2.043761, 0.1454927, -1.897102, 1, 1, 1, 1, 1,
-2.037233, 0.3328208, -2.528753, 1, 1, 1, 1, 1,
-2.018563, -2.253724, -3.977761, 1, 1, 1, 1, 1,
-2.002318, 0.3155521, -2.254379, 0, 0, 1, 1, 1,
-1.953602, 0.4123352, -1.328637, 1, 0, 0, 1, 1,
-1.944823, -0.6104302, -1.270297, 1, 0, 0, 1, 1,
-1.934008, -0.7571859, -0.5023316, 1, 0, 0, 1, 1,
-1.928037, 1.543867, 0.4516771, 1, 0, 0, 1, 1,
-1.912067, -0.6264384, -1.146472, 1, 0, 0, 1, 1,
-1.910776, 0.08775873, -0.577033, 0, 0, 0, 1, 1,
-1.909023, -1.09433, -1.117823, 0, 0, 0, 1, 1,
-1.903018, 0.3956874, -2.684027, 0, 0, 0, 1, 1,
-1.893715, -0.6524535, -1.618289, 0, 0, 0, 1, 1,
-1.870799, -0.7872425, -2.411698, 0, 0, 0, 1, 1,
-1.852958, 1.552375, 1.031163, 0, 0, 0, 1, 1,
-1.844765, 0.617967, -1.381916, 0, 0, 0, 1, 1,
-1.820424, 0.4890402, -2.005659, 1, 1, 1, 1, 1,
-1.817888, 0.6408857, -1.760692, 1, 1, 1, 1, 1,
-1.792417, -0.1949541, -2.541835, 1, 1, 1, 1, 1,
-1.770684, -0.09555087, -2.326026, 1, 1, 1, 1, 1,
-1.757053, 0.5007352, -2.311022, 1, 1, 1, 1, 1,
-1.754842, -0.08739508, -0.3397051, 1, 1, 1, 1, 1,
-1.741204, 1.444793, 0.6448475, 1, 1, 1, 1, 1,
-1.727792, -0.5290883, -3.465736, 1, 1, 1, 1, 1,
-1.725207, -0.1899414, -1.919541, 1, 1, 1, 1, 1,
-1.717577, 1.080281, -1.625465, 1, 1, 1, 1, 1,
-1.712502, -1.184798, -1.903184, 1, 1, 1, 1, 1,
-1.668272, -0.5507576, -3.455056, 1, 1, 1, 1, 1,
-1.666527, 1.877491, -0.8772253, 1, 1, 1, 1, 1,
-1.656382, -0.5666323, -3.538329, 1, 1, 1, 1, 1,
-1.640342, -0.09197515, -2.026872, 1, 1, 1, 1, 1,
-1.623434, -1.496583, -2.96186, 0, 0, 1, 1, 1,
-1.616081, -0.09536966, -3.121587, 1, 0, 0, 1, 1,
-1.603929, 0.7581981, -2.399586, 1, 0, 0, 1, 1,
-1.594288, 0.6483157, -1.109235, 1, 0, 0, 1, 1,
-1.587688, 1.267281, -2.463081, 1, 0, 0, 1, 1,
-1.572755, -0.3878663, -1.559022, 1, 0, 0, 1, 1,
-1.563068, -0.4511667, -1.795888, 0, 0, 0, 1, 1,
-1.553559, 0.196287, -1.405455, 0, 0, 0, 1, 1,
-1.545142, 1.342432, -0.0624469, 0, 0, 0, 1, 1,
-1.543971, 0.1860509, -2.075047, 0, 0, 0, 1, 1,
-1.503249, 0.1964077, -0.8645725, 0, 0, 0, 1, 1,
-1.498328, -1.988593, -2.570484, 0, 0, 0, 1, 1,
-1.476027, 0.1022211, -1.495304, 0, 0, 0, 1, 1,
-1.474094, -0.5798876, -2.18044, 1, 1, 1, 1, 1,
-1.472541, 0.3628188, -0.3681564, 1, 1, 1, 1, 1,
-1.468311, -0.1332153, 2.011788, 1, 1, 1, 1, 1,
-1.457701, -0.1173211, 0.2196756, 1, 1, 1, 1, 1,
-1.444893, 0.2061997, -3.246992, 1, 1, 1, 1, 1,
-1.435331, 1.274151, -0.9601735, 1, 1, 1, 1, 1,
-1.422434, 0.86362, -1.909159, 1, 1, 1, 1, 1,
-1.407896, 0.9481487, -2.297601, 1, 1, 1, 1, 1,
-1.395823, -0.4887199, -2.446981, 1, 1, 1, 1, 1,
-1.395526, 1.073334, -2.792687, 1, 1, 1, 1, 1,
-1.393398, 1.094307, -1.232568, 1, 1, 1, 1, 1,
-1.389955, -1.068141, -4.145674, 1, 1, 1, 1, 1,
-1.388505, 0.8587429, 1.319165, 1, 1, 1, 1, 1,
-1.385118, 0.6666976, -1.035187, 1, 1, 1, 1, 1,
-1.378201, -2.299386, -0.8163388, 1, 1, 1, 1, 1,
-1.372853, 0.9395804, -2.264158, 0, 0, 1, 1, 1,
-1.372623, -0.8703333, -0.9187961, 1, 0, 0, 1, 1,
-1.351196, -0.4083371, -2.473094, 1, 0, 0, 1, 1,
-1.335726, 1.447282, 0.7925678, 1, 0, 0, 1, 1,
-1.333155, -0.2418415, -0.3595819, 1, 0, 0, 1, 1,
-1.329988, 1.19558, -1.518613, 1, 0, 0, 1, 1,
-1.320772, 0.3436642, -0.1081029, 0, 0, 0, 1, 1,
-1.317351, -0.4432796, -1.649436, 0, 0, 0, 1, 1,
-1.313736, 0.6367497, -0.4611836, 0, 0, 0, 1, 1,
-1.311099, 0.2682071, -0.5634866, 0, 0, 0, 1, 1,
-1.30142, 0.7416481, -1.454328, 0, 0, 0, 1, 1,
-1.300306, 0.9105201, -0.1368873, 0, 0, 0, 1, 1,
-1.296861, -0.7688243, -2.842449, 0, 0, 0, 1, 1,
-1.291155, -2.523265, -2.775021, 1, 1, 1, 1, 1,
-1.288574, -0.05657686, -0.5279263, 1, 1, 1, 1, 1,
-1.28751, -0.4559602, -2.16415, 1, 1, 1, 1, 1,
-1.283956, -0.7906604, -1.543357, 1, 1, 1, 1, 1,
-1.279402, -0.7708896, -1.432725, 1, 1, 1, 1, 1,
-1.275847, 0.5797988, -1.960211, 1, 1, 1, 1, 1,
-1.272744, 0.04569664, -1.046289, 1, 1, 1, 1, 1,
-1.271164, 0.6858516, -1.543344, 1, 1, 1, 1, 1,
-1.270557, -1.271837, -1.396218, 1, 1, 1, 1, 1,
-1.268164, 0.5567434, 0.5697985, 1, 1, 1, 1, 1,
-1.260294, -0.6113979, -2.67175, 1, 1, 1, 1, 1,
-1.254406, -2.400548, -2.278593, 1, 1, 1, 1, 1,
-1.239662, 0.6799948, -1.37972, 1, 1, 1, 1, 1,
-1.238055, 1.213098, -1.40251, 1, 1, 1, 1, 1,
-1.237129, -0.8001188, -2.18043, 1, 1, 1, 1, 1,
-1.227781, -0.8354667, -2.900784, 0, 0, 1, 1, 1,
-1.21942, 1.827557, -1.371721, 1, 0, 0, 1, 1,
-1.210511, 0.6415201, -0.5057422, 1, 0, 0, 1, 1,
-1.210007, 0.7890102, -0.9892251, 1, 0, 0, 1, 1,
-1.210004, 0.03377388, 0.7126015, 1, 0, 0, 1, 1,
-1.208849, -0.9839624, -0.6642654, 1, 0, 0, 1, 1,
-1.207709, -0.718935, -2.606342, 0, 0, 0, 1, 1,
-1.190398, 0.3531903, -0.3742332, 0, 0, 0, 1, 1,
-1.189144, 0.4599254, -2.810512, 0, 0, 0, 1, 1,
-1.172256, 1.528024, 1.558915, 0, 0, 0, 1, 1,
-1.168018, -0.6915008, -2.349521, 0, 0, 0, 1, 1,
-1.166511, -0.2837778, -1.647888, 0, 0, 0, 1, 1,
-1.15735, 0.167399, -1.330581, 0, 0, 0, 1, 1,
-1.146142, -0.1563667, -1.643384, 1, 1, 1, 1, 1,
-1.145486, -0.8757235, -1.598573, 1, 1, 1, 1, 1,
-1.141098, 0.4598732, -1.773239, 1, 1, 1, 1, 1,
-1.13301, -1.102102, -1.242101, 1, 1, 1, 1, 1,
-1.124521, -1.441612, -3.763342, 1, 1, 1, 1, 1,
-1.116402, 0.2598713, -1.147643, 1, 1, 1, 1, 1,
-1.115391, 1.893618, -1.701576, 1, 1, 1, 1, 1,
-1.104998, -0.2346011, -2.354557, 1, 1, 1, 1, 1,
-1.080218, 0.7627839, -2.260293, 1, 1, 1, 1, 1,
-1.073281, 0.9272382, -0.1971209, 1, 1, 1, 1, 1,
-1.06974, -0.9100349, -2.654449, 1, 1, 1, 1, 1,
-1.065961, 1.106411, -1.889635, 1, 1, 1, 1, 1,
-1.062558, 1.282237, -0.09844621, 1, 1, 1, 1, 1,
-1.061095, -1.216108, -2.741338, 1, 1, 1, 1, 1,
-1.057716, 0.2142124, -1.132729, 1, 1, 1, 1, 1,
-1.048755, -0.8250072, -2.98993, 0, 0, 1, 1, 1,
-1.045987, 0.0862413, -0.6699952, 1, 0, 0, 1, 1,
-1.043575, 0.5399929, -1.366107, 1, 0, 0, 1, 1,
-1.033527, -0.6057317, -4.183651, 1, 0, 0, 1, 1,
-1.027181, 0.7014055, -1.244986, 1, 0, 0, 1, 1,
-1.022875, -1.143988, -2.522603, 1, 0, 0, 1, 1,
-1.018945, 0.1592968, -1.643753, 0, 0, 0, 1, 1,
-1.009215, -2.101717, -1.830994, 0, 0, 0, 1, 1,
-1.005641, -0.483702, -2.94962, 0, 0, 0, 1, 1,
-1.005392, -1.74905, -1.913857, 0, 0, 0, 1, 1,
-1.001145, 1.515352, -0.7573957, 0, 0, 0, 1, 1,
-0.9937143, 0.3972892, -0.7609647, 0, 0, 0, 1, 1,
-0.9931293, 0.6310047, -0.5142685, 0, 0, 0, 1, 1,
-0.9884242, 0.408578, 0.6692027, 1, 1, 1, 1, 1,
-0.9866272, -0.2538473, -0.7832971, 1, 1, 1, 1, 1,
-0.9824171, 0.5427572, -1.830923, 1, 1, 1, 1, 1,
-0.9758528, 1.545999, -0.3114944, 1, 1, 1, 1, 1,
-0.9703187, -0.437575, -3.204509, 1, 1, 1, 1, 1,
-0.9678764, 0.3914648, -1.439151, 1, 1, 1, 1, 1,
-0.9657341, -1.083784, -1.898088, 1, 1, 1, 1, 1,
-0.9651653, -0.5466873, -2.157884, 1, 1, 1, 1, 1,
-0.9555587, 0.8139668, -1.668274, 1, 1, 1, 1, 1,
-0.9529994, -1.699148, -1.458656, 1, 1, 1, 1, 1,
-0.9519665, -2.747336, -1.811028, 1, 1, 1, 1, 1,
-0.9481313, -1.740865, -2.387615, 1, 1, 1, 1, 1,
-0.9466197, -0.7649469, -2.141566, 1, 1, 1, 1, 1,
-0.9444878, -1.308629, -2.135636, 1, 1, 1, 1, 1,
-0.9419871, -0.2013374, -0.5768354, 1, 1, 1, 1, 1,
-0.9415531, -0.6157426, -0.959367, 0, 0, 1, 1, 1,
-0.935897, -1.148634, -3.272032, 1, 0, 0, 1, 1,
-0.9353316, 1.510991, -1.05909, 1, 0, 0, 1, 1,
-0.9303041, -0.3037562, -3.064425, 1, 0, 0, 1, 1,
-0.9281219, -0.6998565, -2.795077, 1, 0, 0, 1, 1,
-0.9251155, 0.3380952, -1.930608, 1, 0, 0, 1, 1,
-0.9167833, -0.7743534, -2.186229, 0, 0, 0, 1, 1,
-0.9074652, 0.07801192, -2.333823, 0, 0, 0, 1, 1,
-0.9071819, -0.9664858, -2.381859, 0, 0, 0, 1, 1,
-0.9069337, -0.05959733, -2.046634, 0, 0, 0, 1, 1,
-0.9050556, 0.7197115, -2.309955, 0, 0, 0, 1, 1,
-0.9003345, 0.8017122, -1.716089, 0, 0, 0, 1, 1,
-0.899829, 0.004025226, -3.241638, 0, 0, 0, 1, 1,
-0.8932053, 0.3073267, -2.672066, 1, 1, 1, 1, 1,
-0.8926798, 0.01245295, -2.869619, 1, 1, 1, 1, 1,
-0.8918141, 0.6809654, -0.9760323, 1, 1, 1, 1, 1,
-0.8898494, -0.1785019, -3.062203, 1, 1, 1, 1, 1,
-0.8889827, 0.2849834, 0.04810011, 1, 1, 1, 1, 1,
-0.8880929, -0.4369751, -1.821207, 1, 1, 1, 1, 1,
-0.886058, -1.920588, -1.804274, 1, 1, 1, 1, 1,
-0.8859358, -2.78113, -3.242772, 1, 1, 1, 1, 1,
-0.8851952, -0.5925049, -2.074102, 1, 1, 1, 1, 1,
-0.8832648, 0.8012086, 0.2596192, 1, 1, 1, 1, 1,
-0.88169, 0.9896602, -0.5846561, 1, 1, 1, 1, 1,
-0.8814815, 0.3770672, -0.5331774, 1, 1, 1, 1, 1,
-0.873101, 0.4685237, 0.3449579, 1, 1, 1, 1, 1,
-0.8662122, -0.08838797, -1.721099, 1, 1, 1, 1, 1,
-0.8657767, 0.0802879, -2.866009, 1, 1, 1, 1, 1,
-0.8618941, -0.6313096, -2.015433, 0, 0, 1, 1, 1,
-0.8615758, -0.8167642, -1.557926, 1, 0, 0, 1, 1,
-0.8575673, -0.3159838, -2.270437, 1, 0, 0, 1, 1,
-0.8571548, -0.7091818, -2.407623, 1, 0, 0, 1, 1,
-0.8486842, 0.5030888, -0.8047125, 1, 0, 0, 1, 1,
-0.8466512, -0.1887146, -1.168895, 1, 0, 0, 1, 1,
-0.8442767, -1.726001, -1.697199, 0, 0, 0, 1, 1,
-0.8431118, 0.3141303, -1.310783, 0, 0, 0, 1, 1,
-0.8418362, 1.964412, -0.3436124, 0, 0, 0, 1, 1,
-0.8403714, 0.972487, -0.7698979, 0, 0, 0, 1, 1,
-0.8356268, -0.8795674, -1.594082, 0, 0, 0, 1, 1,
-0.8329551, 2.782223, -0.7391742, 0, 0, 0, 1, 1,
-0.831035, 0.1804623, -0.6350905, 0, 0, 0, 1, 1,
-0.8258064, 1.306432, -1.238079, 1, 1, 1, 1, 1,
-0.8241823, -1.68518, -2.793478, 1, 1, 1, 1, 1,
-0.8203114, -1.154131, -0.7801018, 1, 1, 1, 1, 1,
-0.8089895, 0.9200728, -1.067341, 1, 1, 1, 1, 1,
-0.8063062, -0.678142, -2.6326, 1, 1, 1, 1, 1,
-0.8039321, -0.1684518, -3.224737, 1, 1, 1, 1, 1,
-0.7997233, -0.6179076, -3.819827, 1, 1, 1, 1, 1,
-0.7978048, 0.3822984, -0.9306096, 1, 1, 1, 1, 1,
-0.796612, 0.849881, -0.2617007, 1, 1, 1, 1, 1,
-0.7963649, -1.60514, -3.452748, 1, 1, 1, 1, 1,
-0.7946737, 0.01505626, -2.381692, 1, 1, 1, 1, 1,
-0.7925734, -0.5912427, -3.124199, 1, 1, 1, 1, 1,
-0.7924243, 0.009155601, -1.875263, 1, 1, 1, 1, 1,
-0.7843472, 0.2328575, -2.8884, 1, 1, 1, 1, 1,
-0.7822718, -0.07777923, 1.287285, 1, 1, 1, 1, 1,
-0.7790602, 0.6166431, -0.0838287, 0, 0, 1, 1, 1,
-0.7773834, -0.5126618, -0.9891527, 1, 0, 0, 1, 1,
-0.7733587, -0.437636, -2.657162, 1, 0, 0, 1, 1,
-0.7729188, 0.4408759, -1.088021, 1, 0, 0, 1, 1,
-0.7694644, 0.1686395, -3.21655, 1, 0, 0, 1, 1,
-0.7679343, 0.2839609, -0.5580776, 1, 0, 0, 1, 1,
-0.7672784, -0.6499034, -2.604116, 0, 0, 0, 1, 1,
-0.7661349, 0.6403091, -1.182171, 0, 0, 0, 1, 1,
-0.7606395, -0.03135945, -1.496455, 0, 0, 0, 1, 1,
-0.7579828, -1.783175, -3.06726, 0, 0, 0, 1, 1,
-0.7544004, -0.8176774, -2.634844, 0, 0, 0, 1, 1,
-0.7528448, -0.1321913, -2.799908, 0, 0, 0, 1, 1,
-0.7523075, -1.474297, -3.161843, 0, 0, 0, 1, 1,
-0.7521336, -0.3356405, -2.843671, 1, 1, 1, 1, 1,
-0.748947, -2.117431, -1.986144, 1, 1, 1, 1, 1,
-0.7447848, -0.6565117, -2.780124, 1, 1, 1, 1, 1,
-0.7437594, 0.2341207, -1.5033, 1, 1, 1, 1, 1,
-0.7401857, 0.323233, -0.248539, 1, 1, 1, 1, 1,
-0.7380415, 1.755348, -0.2156899, 1, 1, 1, 1, 1,
-0.7372561, 0.1566584, -0.8765184, 1, 1, 1, 1, 1,
-0.7363297, 0.1992946, -2.802774, 1, 1, 1, 1, 1,
-0.735931, 0.5144501, -2.522702, 1, 1, 1, 1, 1,
-0.735325, 1.611514, -1.560835, 1, 1, 1, 1, 1,
-0.7255822, 0.8098757, -1.038415, 1, 1, 1, 1, 1,
-0.7221296, 0.2177346, 0.3823049, 1, 1, 1, 1, 1,
-0.7207789, -0.4455538, -4.038494, 1, 1, 1, 1, 1,
-0.7196953, -0.3411686, -2.321222, 1, 1, 1, 1, 1,
-0.7166077, -0.677303, -3.032237, 1, 1, 1, 1, 1,
-0.7089831, 1.186326, -1.965008, 0, 0, 1, 1, 1,
-0.7055793, -1.889043, -3.477431, 1, 0, 0, 1, 1,
-0.7011431, 0.6621295, 0.07657301, 1, 0, 0, 1, 1,
-0.6974229, -0.6477354, -4.096736, 1, 0, 0, 1, 1,
-0.6951536, 0.7735977, 0.6515142, 1, 0, 0, 1, 1,
-0.6947842, -0.7383041, -1.538238, 1, 0, 0, 1, 1,
-0.6891204, 0.03346804, -0.9576112, 0, 0, 0, 1, 1,
-0.6864188, -0.3453092, -0.693998, 0, 0, 0, 1, 1,
-0.683643, 0.4720028, -5.136084, 0, 0, 0, 1, 1,
-0.6825326, -0.9105151, -1.088845, 0, 0, 0, 1, 1,
-0.6816614, 0.8518819, -0.2946708, 0, 0, 0, 1, 1,
-0.6789151, -0.6539955, -0.6643298, 0, 0, 0, 1, 1,
-0.6786181, 1.277228, -0.4014381, 0, 0, 0, 1, 1,
-0.6773096, 1.038528, 1.812959, 1, 1, 1, 1, 1,
-0.6756337, 0.08858957, -0.8874736, 1, 1, 1, 1, 1,
-0.663741, 0.05233184, -2.492987, 1, 1, 1, 1, 1,
-0.6636329, 0.4335179, -0.8606157, 1, 1, 1, 1, 1,
-0.657676, -0.1914346, 0.1080389, 1, 1, 1, 1, 1,
-0.6554654, 2.107253, 0.347523, 1, 1, 1, 1, 1,
-0.6504807, -0.3296549, -1.987726, 1, 1, 1, 1, 1,
-0.6425267, -0.4374625, 0.009697374, 1, 1, 1, 1, 1,
-0.6392521, -0.06281582, 0.5767874, 1, 1, 1, 1, 1,
-0.6384353, -1.082422, -1.06318, 1, 1, 1, 1, 1,
-0.6244736, -0.4447181, -0.6412383, 1, 1, 1, 1, 1,
-0.6213096, 0.2940914, -0.96557, 1, 1, 1, 1, 1,
-0.6180047, 0.7250909, -1.622847, 1, 1, 1, 1, 1,
-0.6175851, 1.581982, 0.9965141, 1, 1, 1, 1, 1,
-0.6091293, -0.6307325, -4.925449, 1, 1, 1, 1, 1,
-0.603065, 2.388999, -1.221794, 0, 0, 1, 1, 1,
-0.6025293, 0.2976144, -0.3486221, 1, 0, 0, 1, 1,
-0.5983136, 2.378054, 1.113392, 1, 0, 0, 1, 1,
-0.5954875, -0.6426496, -3.555761, 1, 0, 0, 1, 1,
-0.5829972, -1.962838, -3.697022, 1, 0, 0, 1, 1,
-0.5828364, -1.873763, -3.216535, 1, 0, 0, 1, 1,
-0.582562, 0.8132707, -0.468171, 0, 0, 0, 1, 1,
-0.5816936, -0.4853793, -2.65786, 0, 0, 0, 1, 1,
-0.5804761, 0.5660999, -0.8658224, 0, 0, 0, 1, 1,
-0.5698567, -1.035903, -3.064574, 0, 0, 0, 1, 1,
-0.5692831, 1.127067, -0.753578, 0, 0, 0, 1, 1,
-0.5686769, -0.05118921, -1.079048, 0, 0, 0, 1, 1,
-0.5676005, -0.5990379, 0.5332119, 0, 0, 0, 1, 1,
-0.5655784, 0.1407564, -1.221301, 1, 1, 1, 1, 1,
-0.5622568, -0.2433626, -2.891466, 1, 1, 1, 1, 1,
-0.5552378, 0.1202904, -0.5906507, 1, 1, 1, 1, 1,
-0.553471, 0.9089304, -0.1864552, 1, 1, 1, 1, 1,
-0.54895, -0.08353326, -1.03415, 1, 1, 1, 1, 1,
-0.5450331, -0.186902, -2.395354, 1, 1, 1, 1, 1,
-0.5440004, 0.2223698, -0.05089409, 1, 1, 1, 1, 1,
-0.539927, 0.2246381, -3.141206, 1, 1, 1, 1, 1,
-0.5398551, -0.1344549, -0.6643154, 1, 1, 1, 1, 1,
-0.5391656, 0.2618405, -1.350568, 1, 1, 1, 1, 1,
-0.5379773, 1.150732, 0.3013594, 1, 1, 1, 1, 1,
-0.5372941, -0.731866, -2.278133, 1, 1, 1, 1, 1,
-0.5354556, 1.863492, -0.8445449, 1, 1, 1, 1, 1,
-0.5351329, -0.02605331, 0.1935804, 1, 1, 1, 1, 1,
-0.5298402, -0.1210037, -1.59661, 1, 1, 1, 1, 1,
-0.528078, 1.270611, -0.6688939, 0, 0, 1, 1, 1,
-0.5269637, 0.6801161, 0.5666224, 1, 0, 0, 1, 1,
-0.5266348, -0.005474037, -3.010406, 1, 0, 0, 1, 1,
-0.5251356, -0.9459001, -2.94371, 1, 0, 0, 1, 1,
-0.523253, 1.750499, -1.010123, 1, 0, 0, 1, 1,
-0.5191419, -0.9090522, -0.8511347, 1, 0, 0, 1, 1,
-0.518883, 0.5829315, 0.6376597, 0, 0, 0, 1, 1,
-0.518846, 0.9199468, 0.1934789, 0, 0, 0, 1, 1,
-0.5159159, -1.54325, -4.134488, 0, 0, 0, 1, 1,
-0.5149661, -0.04048188, -1.189218, 0, 0, 0, 1, 1,
-0.5043294, 0.01615693, 0.03873129, 0, 0, 0, 1, 1,
-0.50172, 1.385847, -0.6127629, 0, 0, 0, 1, 1,
-0.5005642, 0.9876794, 2.187897, 0, 0, 0, 1, 1,
-0.5005251, -1.704645, -2.913682, 1, 1, 1, 1, 1,
-0.4975383, -0.476306, -2.216985, 1, 1, 1, 1, 1,
-0.4886842, 1.207836, -0.6578571, 1, 1, 1, 1, 1,
-0.4882345, 0.5871363, -0.2468302, 1, 1, 1, 1, 1,
-0.4861704, 1.796373, -0.657455, 1, 1, 1, 1, 1,
-0.4826149, 0.4158953, -1.012869, 1, 1, 1, 1, 1,
-0.4823777, 0.4103674, 0.415406, 1, 1, 1, 1, 1,
-0.4823212, 0.00835633, -0.6291426, 1, 1, 1, 1, 1,
-0.479382, 0.1154839, -0.03906529, 1, 1, 1, 1, 1,
-0.4770389, 0.2994683, 0.1062569, 1, 1, 1, 1, 1,
-0.4702105, -0.980831, -4.781186, 1, 1, 1, 1, 1,
-0.4693319, -1.392135, -2.667459, 1, 1, 1, 1, 1,
-0.4693286, 1.014181, -1.316814, 1, 1, 1, 1, 1,
-0.4657953, 1.364318, 0.9152418, 1, 1, 1, 1, 1,
-0.4592689, 1.01235, -0.4854054, 1, 1, 1, 1, 1,
-0.4582999, 1.56013, 0.8860096, 0, 0, 1, 1, 1,
-0.4558239, 0.04989993, -2.47729, 1, 0, 0, 1, 1,
-0.4534272, -0.4037144, -2.063684, 1, 0, 0, 1, 1,
-0.4516068, 0.8973367, -0.8811791, 1, 0, 0, 1, 1,
-0.4408847, -0.4532666, -0.01273867, 1, 0, 0, 1, 1,
-0.4381856, 1.06603, -0.866972, 1, 0, 0, 1, 1,
-0.4368715, 1.475758, -1.27281, 0, 0, 0, 1, 1,
-0.4363525, -0.7429014, -3.662987, 0, 0, 0, 1, 1,
-0.4342771, -1.834637, -3.234936, 0, 0, 0, 1, 1,
-0.4320638, 0.2668262, -0.6593647, 0, 0, 0, 1, 1,
-0.4223099, 1.05664, -2.084799, 0, 0, 0, 1, 1,
-0.4169575, 1.051793, -0.3977885, 0, 0, 0, 1, 1,
-0.4163861, -0.3106871, -1.643892, 0, 0, 0, 1, 1,
-0.4157661, 0.9849889, 0.3655541, 1, 1, 1, 1, 1,
-0.4151188, 0.8118766, -1.940678, 1, 1, 1, 1, 1,
-0.4143522, -1.777608, -2.590968, 1, 1, 1, 1, 1,
-0.4118285, 0.1862247, -2.365456, 1, 1, 1, 1, 1,
-0.4115971, 0.6646214, -1.517324, 1, 1, 1, 1, 1,
-0.4112337, -1.207948, -1.097771, 1, 1, 1, 1, 1,
-0.405943, -0.3885492, -1.65245, 1, 1, 1, 1, 1,
-0.4004977, 0.4719169, 0.1504951, 1, 1, 1, 1, 1,
-0.4001688, -0.05210187, -1.241173, 1, 1, 1, 1, 1,
-0.3976353, -1.039387, -3.750875, 1, 1, 1, 1, 1,
-0.3948908, 1.06199, -0.2546445, 1, 1, 1, 1, 1,
-0.3906429, 0.7913262, -1.511535, 1, 1, 1, 1, 1,
-0.3885136, 1.281878, 2.166928, 1, 1, 1, 1, 1,
-0.3811589, 0.8068932, -0.2504701, 1, 1, 1, 1, 1,
-0.3807005, 0.6340379, -1.244565, 1, 1, 1, 1, 1,
-0.3797126, -0.08504274, -3.569463, 0, 0, 1, 1, 1,
-0.3793894, -0.1386371, -3.178807, 1, 0, 0, 1, 1,
-0.3774434, 0.6237586, 0.8132892, 1, 0, 0, 1, 1,
-0.3758469, 0.7850627, -1.955389, 1, 0, 0, 1, 1,
-0.375801, 0.8138205, 1.318093, 1, 0, 0, 1, 1,
-0.369502, -0.4550481, -3.197725, 1, 0, 0, 1, 1,
-0.364826, -1.846231, -2.117653, 0, 0, 0, 1, 1,
-0.3647865, -2.350974, -4.330227, 0, 0, 0, 1, 1,
-0.3633823, 0.6031867, -1.252653, 0, 0, 0, 1, 1,
-0.3530856, -1.580886, -2.993073, 0, 0, 0, 1, 1,
-0.3496984, 2.172474, -3.565339, 0, 0, 0, 1, 1,
-0.3452429, 0.6862641, -3.006261, 0, 0, 0, 1, 1,
-0.3448772, 0.5700451, -1.124513, 0, 0, 0, 1, 1,
-0.3423888, 0.09369228, -1.333075, 1, 1, 1, 1, 1,
-0.3406903, -0.7486683, -4.315285, 1, 1, 1, 1, 1,
-0.339378, -0.02759071, -0.2782964, 1, 1, 1, 1, 1,
-0.3332738, -0.1691801, -1.936823, 1, 1, 1, 1, 1,
-0.3319304, 0.779989, 0.1962926, 1, 1, 1, 1, 1,
-0.3310089, -0.3115359, 0.4788292, 1, 1, 1, 1, 1,
-0.330501, -2.37247, -3.751885, 1, 1, 1, 1, 1,
-0.3285293, 1.178334, 1.12879, 1, 1, 1, 1, 1,
-0.3285169, -0.4755725, -3.283096, 1, 1, 1, 1, 1,
-0.3285161, -1.128204, -1.71215, 1, 1, 1, 1, 1,
-0.3267793, 0.3202119, -0.6313273, 1, 1, 1, 1, 1,
-0.3262835, -1.398842, -2.213631, 1, 1, 1, 1, 1,
-0.3172669, -0.5735208, -2.414197, 1, 1, 1, 1, 1,
-0.3094331, 0.7536413, -1.447695, 1, 1, 1, 1, 1,
-0.3064822, 0.8805511, 0.1854262, 1, 1, 1, 1, 1,
-0.3052236, -0.241921, -2.162027, 0, 0, 1, 1, 1,
-0.3051589, -0.4042853, -2.77484, 1, 0, 0, 1, 1,
-0.304857, 1.009892, -1.752029, 1, 0, 0, 1, 1,
-0.303732, -0.9551888, -1.632773, 1, 0, 0, 1, 1,
-0.3036282, 0.1150363, -1.417421, 1, 0, 0, 1, 1,
-0.3022567, -0.9175078, -1.94045, 1, 0, 0, 1, 1,
-0.2884993, 0.3460791, -1.338373, 0, 0, 0, 1, 1,
-0.2881278, 0.6956346, -0.3773868, 0, 0, 0, 1, 1,
-0.2852785, -1.052514, -3.025725, 0, 0, 0, 1, 1,
-0.2841538, 0.2892516, 1.41281, 0, 0, 0, 1, 1,
-0.2824194, -0.7775913, -3.204597, 0, 0, 0, 1, 1,
-0.2801158, 0.6463868, -1.633638, 0, 0, 0, 1, 1,
-0.2800653, -1.139664, -1.722018, 0, 0, 0, 1, 1,
-0.2753034, -0.9298317, -1.813911, 1, 1, 1, 1, 1,
-0.2644513, -1.853257, -1.330054, 1, 1, 1, 1, 1,
-0.2614581, -0.6268216, -2.443456, 1, 1, 1, 1, 1,
-0.2595961, -0.431825, -2.39794, 1, 1, 1, 1, 1,
-0.2588174, -1.036362, -2.578166, 1, 1, 1, 1, 1,
-0.2568685, 1.099972, 1.126515, 1, 1, 1, 1, 1,
-0.2541015, -0.563507, -3.075747, 1, 1, 1, 1, 1,
-0.2539845, 1.243214, -0.08574668, 1, 1, 1, 1, 1,
-0.2529109, -0.06229888, -1.127063, 1, 1, 1, 1, 1,
-0.2518331, 0.1030245, -1.78465, 1, 1, 1, 1, 1,
-0.2495534, 0.428449, 0.5955512, 1, 1, 1, 1, 1,
-0.2494689, 0.1740896, 0.06384908, 1, 1, 1, 1, 1,
-0.2484258, -0.8829664, -3.302664, 1, 1, 1, 1, 1,
-0.2467842, -0.2372737, -3.507755, 1, 1, 1, 1, 1,
-0.2460482, -0.935011, -3.256357, 1, 1, 1, 1, 1,
-0.2438729, -1.105796, -3.216396, 0, 0, 1, 1, 1,
-0.2403848, -1.301486, -3.272624, 1, 0, 0, 1, 1,
-0.2398444, 1.164375, 0.3969901, 1, 0, 0, 1, 1,
-0.2393046, -1.496784, -1.848541, 1, 0, 0, 1, 1,
-0.2384135, -0.4944352, -2.460466, 1, 0, 0, 1, 1,
-0.2383162, -1.457737, -2.443573, 1, 0, 0, 1, 1,
-0.2360502, -1.125318, -3.324012, 0, 0, 0, 1, 1,
-0.2346702, 0.111977, 0.6501109, 0, 0, 0, 1, 1,
-0.2343958, 0.5267753, -0.9371411, 0, 0, 0, 1, 1,
-0.2340455, -1.527572, -3.706875, 0, 0, 0, 1, 1,
-0.2328173, 0.8391746, 0.174651, 0, 0, 0, 1, 1,
-0.2325236, 1.832807, 0.06816512, 0, 0, 0, 1, 1,
-0.2301763, -0.1473149, -2.794549, 0, 0, 0, 1, 1,
-0.2252441, 1.469821, -1.578998, 1, 1, 1, 1, 1,
-0.2230672, -0.5116564, -2.307157, 1, 1, 1, 1, 1,
-0.2223544, 0.5472353, -1.320822, 1, 1, 1, 1, 1,
-0.2187425, 0.2455279, -0.237118, 1, 1, 1, 1, 1,
-0.2158632, 0.0657458, -1.329966, 1, 1, 1, 1, 1,
-0.2129553, 0.2573658, 0.2398166, 1, 1, 1, 1, 1,
-0.2099356, 0.3691309, -2.197007, 1, 1, 1, 1, 1,
-0.2048585, -0.2144205, -1.982402, 1, 1, 1, 1, 1,
-0.2028584, 0.2305451, 0.6320482, 1, 1, 1, 1, 1,
-0.1971234, 0.4059914, -0.3175493, 1, 1, 1, 1, 1,
-0.1955627, -0.8425426, -1.454768, 1, 1, 1, 1, 1,
-0.1952147, 0.648431, -0.9283922, 1, 1, 1, 1, 1,
-0.1934804, -0.4070582, -3.095142, 1, 1, 1, 1, 1,
-0.1916355, 0.7933071, -0.4461527, 1, 1, 1, 1, 1,
-0.1897925, 0.4193168, -1.493336, 1, 1, 1, 1, 1,
-0.1855449, -1.804214, -5.644576, 0, 0, 1, 1, 1,
-0.1811662, -0.4404053, -1.48094, 1, 0, 0, 1, 1,
-0.1799667, -1.552583, -3.335304, 1, 0, 0, 1, 1,
-0.1792645, -0.5272465, -2.727145, 1, 0, 0, 1, 1,
-0.179074, -1.549617, -2.929492, 1, 0, 0, 1, 1,
-0.1787292, -0.0378306, -1.672994, 1, 0, 0, 1, 1,
-0.1780172, -0.8276377, -4.050598, 0, 0, 0, 1, 1,
-0.1766623, -0.009809678, -1.403869, 0, 0, 0, 1, 1,
-0.175426, -0.4491527, -4.429461, 0, 0, 0, 1, 1,
-0.175129, -2.060796, -2.801244, 0, 0, 0, 1, 1,
-0.1687736, -0.6749876, -4.779438, 0, 0, 0, 1, 1,
-0.1661623, -0.06129627, -0.5463803, 0, 0, 0, 1, 1,
-0.165349, -1.013568, -2.457772, 0, 0, 0, 1, 1,
-0.1649762, 1.784087, -0.4399008, 1, 1, 1, 1, 1,
-0.1638048, -0.6762086, -2.97561, 1, 1, 1, 1, 1,
-0.1626396, -0.1493354, -2.436183, 1, 1, 1, 1, 1,
-0.1619383, -0.216784, -2.316426, 1, 1, 1, 1, 1,
-0.1612552, -0.895205, -2.996323, 1, 1, 1, 1, 1,
-0.1602314, -0.4440316, -3.212391, 1, 1, 1, 1, 1,
-0.1570791, 1.442035, -0.07262474, 1, 1, 1, 1, 1,
-0.1547267, -0.5521391, -2.869905, 1, 1, 1, 1, 1,
-0.1515422, -0.3602311, -3.11559, 1, 1, 1, 1, 1,
-0.1443314, 0.3759705, 0.6241627, 1, 1, 1, 1, 1,
-0.1441836, 0.07677515, -2.232162, 1, 1, 1, 1, 1,
-0.142931, -0.6946055, -1.999942, 1, 1, 1, 1, 1,
-0.1419096, 0.05004616, -1.954119, 1, 1, 1, 1, 1,
-0.1353433, -0.602536, -2.31627, 1, 1, 1, 1, 1,
-0.1337881, -0.1636272, -4.487352, 1, 1, 1, 1, 1,
-0.1322271, -0.163811, -3.921061, 0, 0, 1, 1, 1,
-0.1308479, 1.156241, -1.152328, 1, 0, 0, 1, 1,
-0.1286643, -1.911072, -2.578012, 1, 0, 0, 1, 1,
-0.128504, 0.5219623, -1.355861, 1, 0, 0, 1, 1,
-0.1280329, -1.49959, -1.592634, 1, 0, 0, 1, 1,
-0.1262363, -0.8491271, -3.648015, 1, 0, 0, 1, 1,
-0.1211442, -0.4800339, -3.045936, 0, 0, 0, 1, 1,
-0.1172135, 0.2016172, -1.287079, 0, 0, 0, 1, 1,
-0.1156195, -0.8345813, -4.09529, 0, 0, 0, 1, 1,
-0.1141223, 0.8566353, 0.07781998, 0, 0, 0, 1, 1,
-0.1125245, 1.571986, -2.275827, 0, 0, 0, 1, 1,
-0.1114568, -0.02398103, -1.035353, 0, 0, 0, 1, 1,
-0.108646, -0.304829, -2.499668, 0, 0, 0, 1, 1,
-0.1020857, -0.1577815, -2.785156, 1, 1, 1, 1, 1,
-0.09363255, -0.4110619, -1.809064, 1, 1, 1, 1, 1,
-0.08911599, -1.07384, -3.083543, 1, 1, 1, 1, 1,
-0.08319139, 0.5821376, -0.2066629, 1, 1, 1, 1, 1,
-0.082003, 0.5819788, 1.854942, 1, 1, 1, 1, 1,
-0.07769754, 1.696948, 0.0813174, 1, 1, 1, 1, 1,
-0.07683036, 0.6253884, -0.3160497, 1, 1, 1, 1, 1,
-0.06957601, -2.026934, -2.848485, 1, 1, 1, 1, 1,
-0.06644969, 0.7730583, -1.046802, 1, 1, 1, 1, 1,
-0.06280781, 0.3408869, 0.3623759, 1, 1, 1, 1, 1,
-0.06219179, 0.08712409, -0.6501781, 1, 1, 1, 1, 1,
-0.06161387, -0.3521617, -2.99174, 1, 1, 1, 1, 1,
-0.06077351, -0.5902931, -4.980887, 1, 1, 1, 1, 1,
-0.05799765, 0.891806, 1.004548, 1, 1, 1, 1, 1,
-0.05684873, -1.161989, -4.242427, 1, 1, 1, 1, 1,
-0.05428298, 0.1873911, 0.8281578, 0, 0, 1, 1, 1,
-0.05425394, 0.7226189, -1.032723, 1, 0, 0, 1, 1,
-0.05018579, -0.6442004, -2.344648, 1, 0, 0, 1, 1,
-0.04508839, 2.019954, -0.1274409, 1, 0, 0, 1, 1,
-0.04188632, -2.070662, -3.195172, 1, 0, 0, 1, 1,
-0.04126692, 0.1947595, 0.578171, 1, 0, 0, 1, 1,
-0.03964767, 1.200541, -1.190532, 0, 0, 0, 1, 1,
-0.03761943, 0.5053812, -1.588868, 0, 0, 0, 1, 1,
-0.03516267, 1.730041, -2.115225, 0, 0, 0, 1, 1,
-0.0314894, 0.7872863, 1.043824, 0, 0, 0, 1, 1,
-0.02747807, 1.1558, -1.275136, 0, 0, 0, 1, 1,
-0.02691737, 0.372251, -0.7926893, 0, 0, 0, 1, 1,
-0.02491819, -0.9290365, -4.175187, 0, 0, 0, 1, 1,
-0.02331233, 0.1646491, -0.4048897, 1, 1, 1, 1, 1,
-0.02075343, -1.117607, -3.965235, 1, 1, 1, 1, 1,
-0.02067764, 1.115493, -0.9482856, 1, 1, 1, 1, 1,
-0.01556268, 0.9819553, -0.2985546, 1, 1, 1, 1, 1,
-0.01531239, 1.251617, 0.7255933, 1, 1, 1, 1, 1,
-0.007756867, -1.253959, -2.62327, 1, 1, 1, 1, 1,
0.0001031751, -0.9148535, 2.838217, 1, 1, 1, 1, 1,
0.0004234803, 0.3601672, -0.4960763, 1, 1, 1, 1, 1,
0.001575443, 0.4555037, -0.5900563, 1, 1, 1, 1, 1,
0.007762298, -0.02795477, 1.510827, 1, 1, 1, 1, 1,
0.01471829, -0.6320038, 2.109487, 1, 1, 1, 1, 1,
0.01735336, -1.127918, 2.264458, 1, 1, 1, 1, 1,
0.02009857, -0.1793925, 3.294565, 1, 1, 1, 1, 1,
0.02253315, -1.673761, 3.122806, 1, 1, 1, 1, 1,
0.02350829, 1.359114, -1.337978, 1, 1, 1, 1, 1,
0.02419518, -0.1579902, 1.557321, 0, 0, 1, 1, 1,
0.0250623, 0.7138553, 0.6974858, 1, 0, 0, 1, 1,
0.02980383, 0.7976386, 2.702951, 1, 0, 0, 1, 1,
0.03373979, -0.6562942, 2.50609, 1, 0, 0, 1, 1,
0.03918841, 1.569509, -0.3778471, 1, 0, 0, 1, 1,
0.04142841, -0.312658, 3.303901, 1, 0, 0, 1, 1,
0.04243343, 1.149173, 0.5579937, 0, 0, 0, 1, 1,
0.04487351, 2.701775, 0.7303998, 0, 0, 0, 1, 1,
0.04578114, -0.5313096, 3.297294, 0, 0, 0, 1, 1,
0.04634594, 0.1304925, 2.470711, 0, 0, 0, 1, 1,
0.04688186, -1.171407, 2.760443, 0, 0, 0, 1, 1,
0.05376987, 0.1870732, -0.2403729, 0, 0, 0, 1, 1,
0.05933886, 0.1183116, -0.1151429, 0, 0, 0, 1, 1,
0.06039789, -0.4814403, 4.692742, 1, 1, 1, 1, 1,
0.06167578, 0.122144, 0.2587833, 1, 1, 1, 1, 1,
0.0626054, -0.7221672, 4.259788, 1, 1, 1, 1, 1,
0.06343932, -0.6541693, 2.995742, 1, 1, 1, 1, 1,
0.06737304, 0.6666343, -1.061131, 1, 1, 1, 1, 1,
0.06878875, -1.669322, 2.452786, 1, 1, 1, 1, 1,
0.06881242, 0.0004341504, 1.383566, 1, 1, 1, 1, 1,
0.07073369, 0.4017649, -0.9271415, 1, 1, 1, 1, 1,
0.07356204, 1.041404, -1.105596, 1, 1, 1, 1, 1,
0.08209942, -0.7171602, 0.6964538, 1, 1, 1, 1, 1,
0.08966509, 0.02366422, 1.623139, 1, 1, 1, 1, 1,
0.09142753, -1.270201, 0.7729312, 1, 1, 1, 1, 1,
0.09699819, -0.3604037, 3.469801, 1, 1, 1, 1, 1,
0.09985671, 0.6020374, -1.710672, 1, 1, 1, 1, 1,
0.1014555, -0.3220697, 3.76976, 1, 1, 1, 1, 1,
0.1034813, -1.138415, 3.429961, 0, 0, 1, 1, 1,
0.1078752, -1.421113, 2.851272, 1, 0, 0, 1, 1,
0.1137544, 0.477405, 0.1759288, 1, 0, 0, 1, 1,
0.1141557, 1.460672, -1.816971, 1, 0, 0, 1, 1,
0.1145546, 0.4379327, 0.4926326, 1, 0, 0, 1, 1,
0.1147854, -1.086516, 2.043978, 1, 0, 0, 1, 1,
0.1216732, -0.729359, 3.216118, 0, 0, 0, 1, 1,
0.1223437, -0.4130503, 2.762482, 0, 0, 0, 1, 1,
0.1235016, -0.509248, 0.2678714, 0, 0, 0, 1, 1,
0.1241832, -0.480861, 0.8668219, 0, 0, 0, 1, 1,
0.1266753, 0.4051897, -0.3844518, 0, 0, 0, 1, 1,
0.127425, 0.7212106, 0.4430996, 0, 0, 0, 1, 1,
0.1283421, 0.4462282, 0.9113759, 0, 0, 0, 1, 1,
0.1305464, 0.6041145, -0.01347133, 1, 1, 1, 1, 1,
0.1316327, 0.1029193, 0.5824432, 1, 1, 1, 1, 1,
0.1341786, -1.264135, 3.691834, 1, 1, 1, 1, 1,
0.1343849, -0.165725, 3.824087, 1, 1, 1, 1, 1,
0.1349194, -0.323353, 2.492181, 1, 1, 1, 1, 1,
0.1362717, -0.54131, 2.725355, 1, 1, 1, 1, 1,
0.1368913, 1.128211, 0.2287766, 1, 1, 1, 1, 1,
0.139062, 0.6931038, 0.2274699, 1, 1, 1, 1, 1,
0.139828, -0.1888932, 2.706657, 1, 1, 1, 1, 1,
0.1459471, -1.542468, 2.895142, 1, 1, 1, 1, 1,
0.1468329, 0.4017687, -0.177998, 1, 1, 1, 1, 1,
0.1479465, 1.855987, -0.6054538, 1, 1, 1, 1, 1,
0.1495249, 0.812535, -0.5743647, 1, 1, 1, 1, 1,
0.1525533, -1.437791, 4.088953, 1, 1, 1, 1, 1,
0.1536847, 0.8373318, -0.4492798, 1, 1, 1, 1, 1,
0.1548399, -0.8444915, 3.093049, 0, 0, 1, 1, 1,
0.1565481, -0.7333725, 0.7049634, 1, 0, 0, 1, 1,
0.1565651, 0.4278995, 1.206467, 1, 0, 0, 1, 1,
0.1566602, 0.1005763, 0.9708879, 1, 0, 0, 1, 1,
0.1566698, -0.3270786, 3.420143, 1, 0, 0, 1, 1,
0.1568791, 1.240696, -0.1206327, 1, 0, 0, 1, 1,
0.1574763, 1.2314, 0.8862031, 0, 0, 0, 1, 1,
0.1604729, 2.143816, -0.2809179, 0, 0, 0, 1, 1,
0.160613, 0.6695294, 1.186053, 0, 0, 0, 1, 1,
0.1623287, -0.153637, 3.192192, 0, 0, 0, 1, 1,
0.1630694, -0.08012513, 0.5384482, 0, 0, 0, 1, 1,
0.1632214, 0.6248202, 0.2810829, 0, 0, 0, 1, 1,
0.1685968, 0.5128374, 0.8801989, 0, 0, 0, 1, 1,
0.1703298, 0.4550955, -0.2477954, 1, 1, 1, 1, 1,
0.1713644, 0.7494868, 0.8976859, 1, 1, 1, 1, 1,
0.1733792, 1.049491, -0.8955553, 1, 1, 1, 1, 1,
0.1752956, 0.6028928, 0.4291179, 1, 1, 1, 1, 1,
0.1757172, 0.8447177, -0.5760552, 1, 1, 1, 1, 1,
0.1769104, 1.10965, 0.905935, 1, 1, 1, 1, 1,
0.1781061, -0.4364135, 2.238194, 1, 1, 1, 1, 1,
0.1869279, 1.856721, 0.007313606, 1, 1, 1, 1, 1,
0.191834, -0.2309228, 3.162837, 1, 1, 1, 1, 1,
0.1937381, -0.2536531, 1.520272, 1, 1, 1, 1, 1,
0.1944562, 0.05466561, -0.8614598, 1, 1, 1, 1, 1,
0.194927, -0.0321921, 2.306159, 1, 1, 1, 1, 1,
0.1960108, 0.1664039, -0.2357006, 1, 1, 1, 1, 1,
0.1966613, 0.5185522, 0.8527005, 1, 1, 1, 1, 1,
0.2005856, 0.5043075, 0.8651825, 1, 1, 1, 1, 1,
0.2008304, -1.237012, 3.816721, 0, 0, 1, 1, 1,
0.202641, -0.5482274, 3.451496, 1, 0, 0, 1, 1,
0.2055768, -0.7550123, 1.918367, 1, 0, 0, 1, 1,
0.2085703, 0.1672076, 2.165437, 1, 0, 0, 1, 1,
0.2099404, -0.7312097, 3.308096, 1, 0, 0, 1, 1,
0.2120548, 1.418478, -1.076708, 1, 0, 0, 1, 1,
0.2150687, -1.405654, 2.639844, 0, 0, 0, 1, 1,
0.2178891, 0.2746454, -0.1824255, 0, 0, 0, 1, 1,
0.2190512, -2.9615, 4.881064, 0, 0, 0, 1, 1,
0.2285106, -0.6262574, 2.46877, 0, 0, 0, 1, 1,
0.2292776, 0.6006358, 0.2920137, 0, 0, 0, 1, 1,
0.2327773, 0.6488219, -0.1450869, 0, 0, 0, 1, 1,
0.2427187, -1.893132, 2.12129, 0, 0, 0, 1, 1,
0.2504249, -2.560325, 3.10052, 1, 1, 1, 1, 1,
0.258457, -1.249507, 3.553262, 1, 1, 1, 1, 1,
0.2688954, 0.08318672, 1.152359, 1, 1, 1, 1, 1,
0.2720819, 0.8372452, -0.5411968, 1, 1, 1, 1, 1,
0.2763286, 2.464981, -2.08794, 1, 1, 1, 1, 1,
0.2772217, 0.727541, -0.6754273, 1, 1, 1, 1, 1,
0.2777162, 0.2791857, 0.8629792, 1, 1, 1, 1, 1,
0.2780487, -0.2023584, 2.884916, 1, 1, 1, 1, 1,
0.2783949, 1.091193, 0.06731085, 1, 1, 1, 1, 1,
0.2794263, 0.6215469, -1.568439, 1, 1, 1, 1, 1,
0.2824841, 0.5167412, 0.8050154, 1, 1, 1, 1, 1,
0.2855741, 1.513401, 0.6175145, 1, 1, 1, 1, 1,
0.2940563, -0.0842624, 1.970654, 1, 1, 1, 1, 1,
0.2950156, -0.1053785, 2.1347, 1, 1, 1, 1, 1,
0.2964468, -0.8565788, 2.829181, 1, 1, 1, 1, 1,
0.2975404, -1.532213, 0.3223217, 0, 0, 1, 1, 1,
0.2979352, 0.8990095, 2.836245, 1, 0, 0, 1, 1,
0.2981344, 0.8847275, -1.078585, 1, 0, 0, 1, 1,
0.3052641, -0.3724152, 0.2149621, 1, 0, 0, 1, 1,
0.3056722, 1.369244, 0.3501228, 1, 0, 0, 1, 1,
0.3101672, -1.37847, 2.281197, 1, 0, 0, 1, 1,
0.3124955, -1.092993, 3.200486, 0, 0, 0, 1, 1,
0.3137719, 0.09660649, 0.7168361, 0, 0, 0, 1, 1,
0.3138193, -0.9047346, 2.109093, 0, 0, 0, 1, 1,
0.3142542, -0.5116697, 2.344263, 0, 0, 0, 1, 1,
0.3165492, 1.53455, -0.9056695, 0, 0, 0, 1, 1,
0.3203612, 0.6041328, 0.4682335, 0, 0, 0, 1, 1,
0.3214389, -0.4373614, 3.516165, 0, 0, 0, 1, 1,
0.3225555, 1.268026, -0.03264536, 1, 1, 1, 1, 1,
0.3256233, 0.1650729, 0.8427737, 1, 1, 1, 1, 1,
0.3258566, -2.424443, 3.203978, 1, 1, 1, 1, 1,
0.3281701, 0.04692485, -0.07040688, 1, 1, 1, 1, 1,
0.3339495, 0.4384432, -1.002388, 1, 1, 1, 1, 1,
0.334743, -0.05301812, 1.98009, 1, 1, 1, 1, 1,
0.3389924, -1.872691, 3.063067, 1, 1, 1, 1, 1,
0.348969, -1.024001, 2.293361, 1, 1, 1, 1, 1,
0.3490239, -1.192979, 2.07206, 1, 1, 1, 1, 1,
0.3529311, 2.278222, 0.3262397, 1, 1, 1, 1, 1,
0.3542292, 1.454817, -1.845695, 1, 1, 1, 1, 1,
0.3572031, -0.321569, 2.893642, 1, 1, 1, 1, 1,
0.3605891, -0.2601273, 2.04206, 1, 1, 1, 1, 1,
0.3624349, 0.3298443, 1.016796, 1, 1, 1, 1, 1,
0.3662707, 0.7698876, 0.9677345, 1, 1, 1, 1, 1,
0.3702617, -0.4604647, 2.044418, 0, 0, 1, 1, 1,
0.3714871, -1.750224, 1.301113, 1, 0, 0, 1, 1,
0.3741401, -0.7199975, 2.497293, 1, 0, 0, 1, 1,
0.3781535, 0.4858786, 2.152409, 1, 0, 0, 1, 1,
0.3789931, -2.120502, 0.6966667, 1, 0, 0, 1, 1,
0.3849194, -0.1513969, 2.628254, 1, 0, 0, 1, 1,
0.3866116, 1.506156, -0.05291322, 0, 0, 0, 1, 1,
0.3896879, -1.363336, 2.939132, 0, 0, 0, 1, 1,
0.3903861, 1.455422, -0.6894774, 0, 0, 0, 1, 1,
0.3964482, -1.665738, 4.093821, 0, 0, 0, 1, 1,
0.4030264, -0.08009595, 1.837064, 0, 0, 0, 1, 1,
0.4044177, 1.344928, -0.2681027, 0, 0, 0, 1, 1,
0.4048476, -0.3748745, 3.820747, 0, 0, 0, 1, 1,
0.4075681, -0.2911465, 3.66295, 1, 1, 1, 1, 1,
0.4081864, -0.6793852, 1.245047, 1, 1, 1, 1, 1,
0.4189575, 1.488948, 0.0154522, 1, 1, 1, 1, 1,
0.4237019, 0.6098959, 1.581176, 1, 1, 1, 1, 1,
0.4316475, -0.01630583, 2.135504, 1, 1, 1, 1, 1,
0.4377384, 0.7342129, 0.7018719, 1, 1, 1, 1, 1,
0.4397139, -0.2868251, 2.422395, 1, 1, 1, 1, 1,
0.4412255, -0.1566984, 3.235517, 1, 1, 1, 1, 1,
0.4504679, 2.657731, 2.54739, 1, 1, 1, 1, 1,
0.4515589, 0.1260803, 1.266002, 1, 1, 1, 1, 1,
0.4530045, -1.021118, 3.770229, 1, 1, 1, 1, 1,
0.4562243, 0.2416154, 0.3637584, 1, 1, 1, 1, 1,
0.4573292, -0.9384396, 2.060525, 1, 1, 1, 1, 1,
0.4602384, 0.09982813, 1.335534, 1, 1, 1, 1, 1,
0.4657876, -1.344235, 0.7013851, 1, 1, 1, 1, 1,
0.4684567, 1.631213, 0.4001327, 0, 0, 1, 1, 1,
0.4697647, -0.02656758, 0.9930776, 1, 0, 0, 1, 1,
0.4704618, 0.6543051, 0.06856793, 1, 0, 0, 1, 1,
0.47415, 0.204026, 1.681497, 1, 0, 0, 1, 1,
0.477366, 2.949783, -0.4889843, 1, 0, 0, 1, 1,
0.4774848, -0.03892597, 2.110454, 1, 0, 0, 1, 1,
0.4792588, -0.5403763, 1.544373, 0, 0, 0, 1, 1,
0.4798984, 0.5943838, 1.08331, 0, 0, 0, 1, 1,
0.4850487, 0.8466528, 0.8082518, 0, 0, 0, 1, 1,
0.4879666, 1.235988, 0.3725024, 0, 0, 0, 1, 1,
0.4925388, 1.59297, 1.136352, 0, 0, 0, 1, 1,
0.4942783, 0.6437514, 0.3963001, 0, 0, 0, 1, 1,
0.4972354, 0.3821366, 0.9128317, 0, 0, 0, 1, 1,
0.5075637, 1.398127, 0.3714689, 1, 1, 1, 1, 1,
0.5145279, -0.8732371, 2.661132, 1, 1, 1, 1, 1,
0.5171894, -0.287834, 2.078195, 1, 1, 1, 1, 1,
0.5180098, 0.3686274, 0.4990835, 1, 1, 1, 1, 1,
0.5180675, -1.264793, 2.034329, 1, 1, 1, 1, 1,
0.5196351, 1.373619, 0.2701546, 1, 1, 1, 1, 1,
0.5218015, 1.798017, 0.4672286, 1, 1, 1, 1, 1,
0.5227062, -1.572732, 0.6536798, 1, 1, 1, 1, 1,
0.5228212, 0.6127545, 1.082355, 1, 1, 1, 1, 1,
0.5232965, -0.1789354, 2.944037, 1, 1, 1, 1, 1,
0.5234097, -0.7540247, 1.6163, 1, 1, 1, 1, 1,
0.5245515, 0.2682846, 1.324521, 1, 1, 1, 1, 1,
0.5247071, 0.3727233, -0.8160681, 1, 1, 1, 1, 1,
0.5247189, -1.557994, 1.268591, 1, 1, 1, 1, 1,
0.5283439, 1.963553, 0.22106, 1, 1, 1, 1, 1,
0.5308951, -0.5069168, 2.616998, 0, 0, 1, 1, 1,
0.5334033, 1.563098, -0.6572659, 1, 0, 0, 1, 1,
0.5366013, 1.42149, 1.279646, 1, 0, 0, 1, 1,
0.5380616, -2.176295, 2.660566, 1, 0, 0, 1, 1,
0.538338, -0.5145347, 0.4437289, 1, 0, 0, 1, 1,
0.541526, 0.8650277, 0.8147737, 1, 0, 0, 1, 1,
0.5417337, 0.2477179, 1.911235, 0, 0, 0, 1, 1,
0.5421058, 1.32211, 0.5473237, 0, 0, 0, 1, 1,
0.5431693, 2.05617, -0.397393, 0, 0, 0, 1, 1,
0.5437809, 0.986232, 0.8125879, 0, 0, 0, 1, 1,
0.550402, 0.5229, 1.574256, 0, 0, 0, 1, 1,
0.5535002, -0.01994672, 2.594053, 0, 0, 0, 1, 1,
0.5547379, 0.7711875, 0.4443134, 0, 0, 0, 1, 1,
0.5614406, 1.178627, 2.413933, 1, 1, 1, 1, 1,
0.5630807, 0.8447672, -0.9374403, 1, 1, 1, 1, 1,
0.5652196, 0.3240498, -0.6714661, 1, 1, 1, 1, 1,
0.5753031, -1.461219, 0.325954, 1, 1, 1, 1, 1,
0.5790671, -0.132998, 1.362062, 1, 1, 1, 1, 1,
0.5800332, 0.7030218, 1.223311, 1, 1, 1, 1, 1,
0.5818358, -0.8040924, 1.120553, 1, 1, 1, 1, 1,
0.585605, 0.41443, 0.2139814, 1, 1, 1, 1, 1,
0.5871469, -0.2292082, 1.088656, 1, 1, 1, 1, 1,
0.5948427, 1.822339, -0.9139588, 1, 1, 1, 1, 1,
0.6023797, -0.7400649, 1.417852, 1, 1, 1, 1, 1,
0.6034809, 1.029754, -0.2236296, 1, 1, 1, 1, 1,
0.6053548, 0.2283159, 1.016509, 1, 1, 1, 1, 1,
0.6133071, 1.033242, 1.678034, 1, 1, 1, 1, 1,
0.6150146, -2.174536, 2.814407, 1, 1, 1, 1, 1,
0.6159138, -0.01468174, 1.868055, 0, 0, 1, 1, 1,
0.620224, 2.49636, 0.8362915, 1, 0, 0, 1, 1,
0.6213912, 1.051703, 1.704816, 1, 0, 0, 1, 1,
0.6225316, 2.58838, 0.9402414, 1, 0, 0, 1, 1,
0.6247903, 0.3703824, 2.603284, 1, 0, 0, 1, 1,
0.6252347, -0.5060342, 1.844233, 1, 0, 0, 1, 1,
0.6262332, -0.3058808, 1.114512, 0, 0, 0, 1, 1,
0.627956, -0.8828793, 3.119803, 0, 0, 0, 1, 1,
0.629056, -1.47779, 3.711771, 0, 0, 0, 1, 1,
0.6299527, -0.9737883, 3.285381, 0, 0, 0, 1, 1,
0.6345993, -1.393189, 3.344401, 0, 0, 0, 1, 1,
0.6352348, 1.075383, 0.8128259, 0, 0, 0, 1, 1,
0.6410713, 0.05059635, -0.4571673, 0, 0, 0, 1, 1,
0.6450276, 0.5922972, -0.9571539, 1, 1, 1, 1, 1,
0.6454657, -0.035113, 2.004845, 1, 1, 1, 1, 1,
0.6516249, -1.596163, 2.734883, 1, 1, 1, 1, 1,
0.65729, -2.480253, 3.923325, 1, 1, 1, 1, 1,
0.6630881, -0.8498473, 0.8930178, 1, 1, 1, 1, 1,
0.6633695, 0.397446, -0.8080854, 1, 1, 1, 1, 1,
0.6670244, -2.133774, 3.189015, 1, 1, 1, 1, 1,
0.683254, 0.03007679, 1.415331, 1, 1, 1, 1, 1,
0.6902101, 0.8529899, 2.368974, 1, 1, 1, 1, 1,
0.6923742, 0.6505773, 0.06528828, 1, 1, 1, 1, 1,
0.6937657, 1.42311, 0.733214, 1, 1, 1, 1, 1,
0.6955139, -0.7366647, 3.368218, 1, 1, 1, 1, 1,
0.7002241, 1.560868, -0.0761506, 1, 1, 1, 1, 1,
0.7020609, -0.07430983, 1.092045, 1, 1, 1, 1, 1,
0.7053763, 0.2083634, 1.905623, 1, 1, 1, 1, 1,
0.7062587, 0.4691865, 1.730049, 0, 0, 1, 1, 1,
0.7064269, 1.332333, 2.411009, 1, 0, 0, 1, 1,
0.70961, 0.8922511, -0.9686399, 1, 0, 0, 1, 1,
0.7107709, 0.6392514, 0.5288212, 1, 0, 0, 1, 1,
0.722067, -0.6104194, 1.352847, 1, 0, 0, 1, 1,
0.7282206, 0.08674113, 1.558242, 1, 0, 0, 1, 1,
0.7282943, -1.341547, 3.643363, 0, 0, 0, 1, 1,
0.737173, -0.1260847, 1.072214, 0, 0, 0, 1, 1,
0.7493508, -0.8436548, 3.813363, 0, 0, 0, 1, 1,
0.7558644, -0.3111058, 1.125397, 0, 0, 0, 1, 1,
0.7655473, 1.334809, -0.06329011, 0, 0, 0, 1, 1,
0.7665939, -0.2084044, 1.920879, 0, 0, 0, 1, 1,
0.7686281, -1.75139, 3.596028, 0, 0, 0, 1, 1,
0.7792577, -1.064402, 1.828783, 1, 1, 1, 1, 1,
0.7824934, 0.1240312, 3.457154, 1, 1, 1, 1, 1,
0.7858344, 1.168494, 1.537829, 1, 1, 1, 1, 1,
0.7875184, 2.113339, -1.831493, 1, 1, 1, 1, 1,
0.7954522, 0.4417554, 1.956026, 1, 1, 1, 1, 1,
0.7958307, 0.954102, 0.8155258, 1, 1, 1, 1, 1,
0.8121294, -1.852568, 2.90169, 1, 1, 1, 1, 1,
0.8147969, 0.1731933, 1.359321, 1, 1, 1, 1, 1,
0.821747, 0.07337568, 0.1428804, 1, 1, 1, 1, 1,
0.8246191, 0.3947828, 0.7431721, 1, 1, 1, 1, 1,
0.8340024, -1.096162, 2.134526, 1, 1, 1, 1, 1,
0.8361627, 2.129521, 1.701575, 1, 1, 1, 1, 1,
0.8363283, 0.3867247, 1.387463, 1, 1, 1, 1, 1,
0.8373253, 0.8663185, 0.1288569, 1, 1, 1, 1, 1,
0.8432468, 2.606226, -0.6509079, 1, 1, 1, 1, 1,
0.844052, 1.455369, 0.421018, 0, 0, 1, 1, 1,
0.8521621, -0.6741114, 1.283042, 1, 0, 0, 1, 1,
0.8546922, -0.5816681, 1.966739, 1, 0, 0, 1, 1,
0.8546949, 0.7152248, -0.1461323, 1, 0, 0, 1, 1,
0.8554715, -0.8130184, 1.687218, 1, 0, 0, 1, 1,
0.8569627, 0.8164958, 0.7118301, 1, 0, 0, 1, 1,
0.8625259, -0.5064644, 3.786412, 0, 0, 0, 1, 1,
0.8628259, 1.216062, 1.277435, 0, 0, 0, 1, 1,
0.864807, 0.3638074, 1.360952, 0, 0, 0, 1, 1,
0.8661557, 1.450487, -0.3267018, 0, 0, 0, 1, 1,
0.8661848, 0.2963665, 1.213706, 0, 0, 0, 1, 1,
0.871472, -0.7953131, 3.180139, 0, 0, 0, 1, 1,
0.8741854, -1.107585, 3.226826, 0, 0, 0, 1, 1,
0.8746486, -0.5202417, 2.536618, 1, 1, 1, 1, 1,
0.876439, -0.3582216, 3.509996, 1, 1, 1, 1, 1,
0.8767742, -1.705298, 4.297456, 1, 1, 1, 1, 1,
0.8781536, -0.7101029, 2.094736, 1, 1, 1, 1, 1,
0.8839553, 0.8247877, 1.46958, 1, 1, 1, 1, 1,
0.8841659, 1.455584, 0.2189097, 1, 1, 1, 1, 1,
0.887134, -0.916475, 0.3013456, 1, 1, 1, 1, 1,
0.8930233, 1.207674, -0.1425254, 1, 1, 1, 1, 1,
0.8967565, 0.6624978, 1.434484, 1, 1, 1, 1, 1,
0.8979392, 0.7791632, 2.673811, 1, 1, 1, 1, 1,
0.9021779, -0.7721791, 1.370733, 1, 1, 1, 1, 1,
0.9030923, -1.076138, -0.05799425, 1, 1, 1, 1, 1,
0.9069052, 0.1160931, 0.9102496, 1, 1, 1, 1, 1,
0.9078535, -1.193075, 2.349445, 1, 1, 1, 1, 1,
0.924119, -0.2463659, 2.468258, 1, 1, 1, 1, 1,
0.9266872, -1.652388, 4.582333, 0, 0, 1, 1, 1,
0.9303843, -0.355165, 1.683899, 1, 0, 0, 1, 1,
0.9324053, -1.457416, 1.564478, 1, 0, 0, 1, 1,
0.9331687, -0.1366131, 3.560839, 1, 0, 0, 1, 1,
0.9342051, 0.6604255, 0.4846902, 1, 0, 0, 1, 1,
0.9456845, 1.803345, 2.138858, 1, 0, 0, 1, 1,
0.974016, 0.9359395, 0.371954, 0, 0, 0, 1, 1,
0.9786071, 0.5346054, 1.456013, 0, 0, 0, 1, 1,
0.979008, -0.9890831, 1.779185, 0, 0, 0, 1, 1,
0.9901672, -1.690316, 1.575655, 0, 0, 0, 1, 1,
0.9913138, 0.527351, -0.1712916, 0, 0, 0, 1, 1,
0.9960601, -0.749365, 2.198844, 0, 0, 0, 1, 1,
0.9974309, 1.335724, 0.8294212, 0, 0, 0, 1, 1,
0.997709, 0.4353384, 0.5292083, 1, 1, 1, 1, 1,
1.006418, 2.040929, 3.718462, 1, 1, 1, 1, 1,
1.008258, 0.0416586, 1.440506, 1, 1, 1, 1, 1,
1.016843, 0.07999528, 2.03061, 1, 1, 1, 1, 1,
1.024084, -1.082042, 3.970568, 1, 1, 1, 1, 1,
1.025066, -0.2217425, 2.111024, 1, 1, 1, 1, 1,
1.033784, -1.21196, 2.628353, 1, 1, 1, 1, 1,
1.040428, -0.6510333, 3.090478, 1, 1, 1, 1, 1,
1.046009, -1.821744, 4.066171, 1, 1, 1, 1, 1,
1.046638, -1.449262, 2.031083, 1, 1, 1, 1, 1,
1.047079, -0.198844, 1.649621, 1, 1, 1, 1, 1,
1.048953, -1.172755, 2.836698, 1, 1, 1, 1, 1,
1.054831, 0.6642224, 0.5752185, 1, 1, 1, 1, 1,
1.057962, -0.1788642, 3.008889, 1, 1, 1, 1, 1,
1.066106, -1.763447, 2.441058, 1, 1, 1, 1, 1,
1.066302, 0.03121916, 3.457853, 0, 0, 1, 1, 1,
1.067791, -1.014356, 0.1121899, 1, 0, 0, 1, 1,
1.08459, -0.6838671, 3.683651, 1, 0, 0, 1, 1,
1.087936, 0.6302126, 1.122324, 1, 0, 0, 1, 1,
1.090306, 1.776786, 1.227094, 1, 0, 0, 1, 1,
1.091377, -1.756069, 3.749684, 1, 0, 0, 1, 1,
1.096234, -0.9289849, 2.021719, 0, 0, 0, 1, 1,
1.109433, -0.5078821, 1.221395, 0, 0, 0, 1, 1,
1.113705, 1.633741, 0.9098584, 0, 0, 0, 1, 1,
1.119774, -0.4230737, 3.240853, 0, 0, 0, 1, 1,
1.120224, -0.7794375, 0.6311004, 0, 0, 0, 1, 1,
1.12379, -2.319459, 4.056204, 0, 0, 0, 1, 1,
1.144027, 2.348892, 1.286185, 0, 0, 0, 1, 1,
1.148123, 0.2723525, 2.778312, 1, 1, 1, 1, 1,
1.150199, 0.5289015, 0.2268499, 1, 1, 1, 1, 1,
1.152834, -0.5335655, 2.788508, 1, 1, 1, 1, 1,
1.153111, 0.07441819, 1.980716, 1, 1, 1, 1, 1,
1.156351, 0.8217154, 3.745875, 1, 1, 1, 1, 1,
1.156989, 0.4442706, 0.8782467, 1, 1, 1, 1, 1,
1.159534, -0.1945261, 1.355433, 1, 1, 1, 1, 1,
1.170094, -0.09614529, 3.167745, 1, 1, 1, 1, 1,
1.173345, -0.2771347, 2.196441, 1, 1, 1, 1, 1,
1.179773, -1.247165, 2.664166, 1, 1, 1, 1, 1,
1.183682, -1.807964, 0.1553784, 1, 1, 1, 1, 1,
1.194175, -3.967174, 2.62668, 1, 1, 1, 1, 1,
1.194807, -0.9776207, 0.5626388, 1, 1, 1, 1, 1,
1.195743, 1.029962, -0.812226, 1, 1, 1, 1, 1,
1.195969, -1.254996, 1.496931, 1, 1, 1, 1, 1,
1.202288, 1.353664, -0.5309103, 0, 0, 1, 1, 1,
1.21987, -1.072809, 2.768522, 1, 0, 0, 1, 1,
1.226037, -0.9316155, 1.229618, 1, 0, 0, 1, 1,
1.234853, 0.5698662, 0.4651351, 1, 0, 0, 1, 1,
1.237358, 0.4255248, 1.102524, 1, 0, 0, 1, 1,
1.240336, -1.125607, 2.030012, 1, 0, 0, 1, 1,
1.247511, 0.5482683, 1.667995, 0, 0, 0, 1, 1,
1.249898, 0.4885446, 1.158796, 0, 0, 0, 1, 1,
1.253749, -1.084517, 2.598143, 0, 0, 0, 1, 1,
1.2615, -0.3376144, 3.423348, 0, 0, 0, 1, 1,
1.264153, -0.7964435, 1.399407, 0, 0, 0, 1, 1,
1.281268, -0.02326757, 1.490387, 0, 0, 0, 1, 1,
1.285471, -0.9251655, 2.425226, 0, 0, 0, 1, 1,
1.288259, -0.2908002, 1.702721, 1, 1, 1, 1, 1,
1.289871, 0.6132246, 2.982829, 1, 1, 1, 1, 1,
1.293324, -0.7955208, 2.139207, 1, 1, 1, 1, 1,
1.296396, 1.558381, 0.4892686, 1, 1, 1, 1, 1,
1.297606, -0.1163348, 1.189144, 1, 1, 1, 1, 1,
1.3062, -0.1348786, 0.9231039, 1, 1, 1, 1, 1,
1.31474, -1.104354, 2.030669, 1, 1, 1, 1, 1,
1.326914, 1.804944, 0.6438277, 1, 1, 1, 1, 1,
1.329416, -1.019138, 1.544131, 1, 1, 1, 1, 1,
1.333418, -0.5430768, 2.712878, 1, 1, 1, 1, 1,
1.334055, -0.0493257, 1.399902, 1, 1, 1, 1, 1,
1.334877, -0.2375391, 1.786706, 1, 1, 1, 1, 1,
1.348447, 0.4238928, -0.8533516, 1, 1, 1, 1, 1,
1.35194, 1.274325, 1.827433, 1, 1, 1, 1, 1,
1.360929, 1.374094, -0.5610618, 1, 1, 1, 1, 1,
1.365041, 0.0322468, 1.664369, 0, 0, 1, 1, 1,
1.368153, -0.4877842, 1.393919, 1, 0, 0, 1, 1,
1.376665, 1.460066, 2.596204, 1, 0, 0, 1, 1,
1.391402, -0.2237613, 0.5811652, 1, 0, 0, 1, 1,
1.393433, 1.209813, 1.889352, 1, 0, 0, 1, 1,
1.393528, 0.3140952, 1.495432, 1, 0, 0, 1, 1,
1.404651, -0.1775865, 0.5512387, 0, 0, 0, 1, 1,
1.413959, -0.3744908, 2.892739, 0, 0, 0, 1, 1,
1.429963, -0.5878406, 2.649092, 0, 0, 0, 1, 1,
1.444616, -0.4762773, 1.866387, 0, 0, 0, 1, 1,
1.463448, -1.182006, 2.590833, 0, 0, 0, 1, 1,
1.487437, 1.162599, -0.1394492, 0, 0, 0, 1, 1,
1.500518, 0.209035, 1.201285, 0, 0, 0, 1, 1,
1.505211, -1.878565, 3.011181, 1, 1, 1, 1, 1,
1.524748, 1.539355, 0.1141635, 1, 1, 1, 1, 1,
1.539118, 2.475888, -0.08134502, 1, 1, 1, 1, 1,
1.54161, -1.10635, 2.932603, 1, 1, 1, 1, 1,
1.558857, 0.6367047, 1.700801, 1, 1, 1, 1, 1,
1.564184, -0.2936182, 1.361226, 1, 1, 1, 1, 1,
1.566618, 0.560854, 1.960068, 1, 1, 1, 1, 1,
1.584949, 0.226294, 1.641964, 1, 1, 1, 1, 1,
1.635162, 0.2294127, 1.40556, 1, 1, 1, 1, 1,
1.658591, -0.8788665, 2.999006, 1, 1, 1, 1, 1,
1.660152, 0.429239, 2.131011, 1, 1, 1, 1, 1,
1.66652, 1.740498, 2.14787, 1, 1, 1, 1, 1,
1.669593, -0.8917575, 2.020678, 1, 1, 1, 1, 1,
1.670286, 0.4641214, 2.088334, 1, 1, 1, 1, 1,
1.682253, 0.110255, 0.9376947, 1, 1, 1, 1, 1,
1.712227, 1.073732, 1.187821, 0, 0, 1, 1, 1,
1.726711, 1.239054, -0.9483645, 1, 0, 0, 1, 1,
1.726911, 0.9284192, 0.2030085, 1, 0, 0, 1, 1,
1.728331, -0.08804135, 3.67359, 1, 0, 0, 1, 1,
1.77165, -0.449931, 2.331556, 1, 0, 0, 1, 1,
1.804242, 0.1225374, 1.1299, 1, 0, 0, 1, 1,
1.805404, -0.1715061, 0.5998429, 0, 0, 0, 1, 1,
1.805935, -0.6900353, 0.06545725, 0, 0, 0, 1, 1,
1.815137, 0.1394278, 0.0878562, 0, 0, 0, 1, 1,
1.819013, -0.5023559, 1.780392, 0, 0, 0, 1, 1,
1.820632, 0.3897733, 2.733589, 0, 0, 0, 1, 1,
1.821298, 0.1525152, 1.927081, 0, 0, 0, 1, 1,
1.823987, -0.9192908, 2.147188, 0, 0, 0, 1, 1,
1.825116, 1.615425, 1.090628, 1, 1, 1, 1, 1,
1.827688, 0.8886929, 0.6745617, 1, 1, 1, 1, 1,
1.831563, 0.09459889, 2.849507, 1, 1, 1, 1, 1,
1.834387, 0.8295048, 2.312545, 1, 1, 1, 1, 1,
1.843079, 0.786763, 0.1609554, 1, 1, 1, 1, 1,
1.858148, 0.08770146, 2.064569, 1, 1, 1, 1, 1,
1.879582, 0.8954213, 0.7349981, 1, 1, 1, 1, 1,
1.880656, 1.166808, 2.628564, 1, 1, 1, 1, 1,
1.93058, 0.09674225, 3.076811, 1, 1, 1, 1, 1,
1.95547, -0.7014024, 2.768476, 1, 1, 1, 1, 1,
2.002228, -2.321775, 3.686676, 1, 1, 1, 1, 1,
2.00435, -1.089692, 1.892934, 1, 1, 1, 1, 1,
2.025505, 0.6222141, 0.5809531, 1, 1, 1, 1, 1,
2.026441, 0.729134, 0.09627073, 1, 1, 1, 1, 1,
2.028481, -0.4415714, 2.058481, 1, 1, 1, 1, 1,
2.036398, -1.984313, 3.802905, 0, 0, 1, 1, 1,
2.072259, 0.1370287, 1.265685, 1, 0, 0, 1, 1,
2.11831, 0.5625228, 0.3711747, 1, 0, 0, 1, 1,
2.17094, 0.7158625, 2.230057, 1, 0, 0, 1, 1,
2.186123, -0.3026388, 1.574866, 1, 0, 0, 1, 1,
2.191532, -0.9830833, 2.157, 1, 0, 0, 1, 1,
2.276415, -0.2172184, 2.889464, 0, 0, 0, 1, 1,
2.281476, -0.8829093, 1.679448, 0, 0, 0, 1, 1,
2.333976, 1.159296, -1.029188, 0, 0, 0, 1, 1,
2.371929, -0.2260632, 2.282454, 0, 0, 0, 1, 1,
2.430221, -1.533373, 0.8516096, 0, 0, 0, 1, 1,
2.489221, -0.778349, 3.167686, 0, 0, 0, 1, 1,
2.497959, -0.3224615, 1.01025, 0, 0, 0, 1, 1,
2.506766, 0.03432306, 1.25021, 1, 1, 1, 1, 1,
2.586741, 1.141021, 0.4102158, 1, 1, 1, 1, 1,
2.588727, 0.1807473, 2.567207, 1, 1, 1, 1, 1,
2.758695, 0.4386327, 3.269315, 1, 1, 1, 1, 1,
2.858237, 0.07498735, 2.819856, 1, 1, 1, 1, 1,
2.870015, -1.887012, 3.935077, 1, 1, 1, 1, 1,
2.907963, -0.6848695, 1.881608, 1, 1, 1, 1, 1
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
var radius = 9.557599;
var distance = 33.57066;
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
mvMatrix.translate( 0.1408678, 0.5086955, 0.3817558 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.57066);
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
