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
-3.307836, 0.206745, -2.279004, 1, 0, 0, 1,
-3.210051, -0.1050592, -0.8897474, 1, 0.007843138, 0, 1,
-2.881994, -1.049031, -2.117419, 1, 0.01176471, 0, 1,
-2.613742, -0.03957266, -0.8266477, 1, 0.01960784, 0, 1,
-2.565028, -0.5915537, -1.672776, 1, 0.02352941, 0, 1,
-2.563383, 0.3237699, -0.8736806, 1, 0.03137255, 0, 1,
-2.532047, -0.1210409, -3.131381, 1, 0.03529412, 0, 1,
-2.522056, -0.8831283, -2.846587, 1, 0.04313726, 0, 1,
-2.48259, -1.136898, -1.927827, 1, 0.04705882, 0, 1,
-2.407449, 0.1151715, -0.5818996, 1, 0.05490196, 0, 1,
-2.326859, -0.3686665, -0.80092, 1, 0.05882353, 0, 1,
-2.261055, 0.9737386, -0.4949996, 1, 0.06666667, 0, 1,
-2.222556, 0.3847116, -1.533957, 1, 0.07058824, 0, 1,
-2.218565, -1.450963, -3.619273, 1, 0.07843138, 0, 1,
-2.202437, 2.484501, -0.1070556, 1, 0.08235294, 0, 1,
-2.192787, 0.1965097, -3.39391, 1, 0.09019608, 0, 1,
-2.143643, 0.534394, -0.1530216, 1, 0.09411765, 0, 1,
-2.056981, 0.5372861, -1.515072, 1, 0.1019608, 0, 1,
-2.056359, -0.7199251, -2.509966, 1, 0.1098039, 0, 1,
-2.028897, 0.6467977, -0.04160399, 1, 0.1137255, 0, 1,
-1.994204, 0.439285, -2.3798, 1, 0.1215686, 0, 1,
-1.991343, -0.8436747, -1.501631, 1, 0.1254902, 0, 1,
-1.990119, -0.8250043, -2.606679, 1, 0.1333333, 0, 1,
-1.961628, 0.7341496, -1.520176, 1, 0.1372549, 0, 1,
-1.948176, 0.8556051, 0.4587775, 1, 0.145098, 0, 1,
-1.939004, -1.358892, -2.351533, 1, 0.1490196, 0, 1,
-1.933348, 1.12741, 0.9674093, 1, 0.1568628, 0, 1,
-1.897728, -0.1768554, -2.543541, 1, 0.1607843, 0, 1,
-1.886984, -1.910049, -2.906727, 1, 0.1686275, 0, 1,
-1.839632, -0.5549718, -0.8579396, 1, 0.172549, 0, 1,
-1.811957, -1.357022, -3.174577, 1, 0.1803922, 0, 1,
-1.805299, 0.8229351, -0.9231908, 1, 0.1843137, 0, 1,
-1.798314, -0.3811429, -2.791092, 1, 0.1921569, 0, 1,
-1.773806, 0.6445069, -0.1160381, 1, 0.1960784, 0, 1,
-1.767693, -1.257416, -1.353099, 1, 0.2039216, 0, 1,
-1.734148, -0.102216, -1.936157, 1, 0.2117647, 0, 1,
-1.733062, 1.354952, -0.9479343, 1, 0.2156863, 0, 1,
-1.729907, 0.8197846, -1.218664, 1, 0.2235294, 0, 1,
-1.724403, 0.7189323, -1.878936, 1, 0.227451, 0, 1,
-1.700623, -0.1901889, -1.309277, 1, 0.2352941, 0, 1,
-1.689244, 1.468844, -1.423341, 1, 0.2392157, 0, 1,
-1.678253, 1.739068, -3.217139, 1, 0.2470588, 0, 1,
-1.670517, 0.09740517, -0.9808768, 1, 0.2509804, 0, 1,
-1.667879, -0.9071415, -1.76577, 1, 0.2588235, 0, 1,
-1.655319, -0.910408, -0.4773043, 1, 0.2627451, 0, 1,
-1.646688, 1.436904, 1.613344, 1, 0.2705882, 0, 1,
-1.641331, -0.4439071, -1.618803, 1, 0.2745098, 0, 1,
-1.634621, -1.659699, -1.586824, 1, 0.282353, 0, 1,
-1.632007, 1.26944, -0.9289514, 1, 0.2862745, 0, 1,
-1.620953, -1.801843, -0.5060212, 1, 0.2941177, 0, 1,
-1.615074, 1.293979, -1.510204, 1, 0.3019608, 0, 1,
-1.610995, 0.1027061, -0.3749458, 1, 0.3058824, 0, 1,
-1.588, -1.238799, -2.674082, 1, 0.3137255, 0, 1,
-1.576932, -1.150669, -2.610944, 1, 0.3176471, 0, 1,
-1.562546, -0.6506002, -2.046446, 1, 0.3254902, 0, 1,
-1.556208, 0.8812515, -1.568014, 1, 0.3294118, 0, 1,
-1.54652, -0.002951005, -0.6316408, 1, 0.3372549, 0, 1,
-1.543801, -0.8184983, -0.6149649, 1, 0.3411765, 0, 1,
-1.542649, 1.315732, -1.306623, 1, 0.3490196, 0, 1,
-1.535212, 0.9664814, -1.486661, 1, 0.3529412, 0, 1,
-1.528323, 1.269672, -1.041615, 1, 0.3607843, 0, 1,
-1.525899, -1.849194, -4.293479, 1, 0.3647059, 0, 1,
-1.520944, -0.5368366, -0.9987642, 1, 0.372549, 0, 1,
-1.512902, -1.691803, -1.023821, 1, 0.3764706, 0, 1,
-1.508932, -0.8838563, -1.441022, 1, 0.3843137, 0, 1,
-1.506427, 0.8218336, -3.047446, 1, 0.3882353, 0, 1,
-1.500598, 2.647428, -0.668268, 1, 0.3960784, 0, 1,
-1.494651, -0.9784036, -1.31302, 1, 0.4039216, 0, 1,
-1.490209, -1.146527, -0.5210268, 1, 0.4078431, 0, 1,
-1.485431, -1.756994, -1.118367, 1, 0.4156863, 0, 1,
-1.476208, -0.04771971, -2.160453, 1, 0.4196078, 0, 1,
-1.466213, -1.228722, -3.332952, 1, 0.427451, 0, 1,
-1.451147, -1.062553, -0.8104709, 1, 0.4313726, 0, 1,
-1.447332, -0.3765281, -1.743532, 1, 0.4392157, 0, 1,
-1.444898, 0.7054427, -0.4758026, 1, 0.4431373, 0, 1,
-1.441828, -0.1675846, -2.420278, 1, 0.4509804, 0, 1,
-1.438613, 0.1249018, -0.7281575, 1, 0.454902, 0, 1,
-1.433531, 1.450217, -0.4572043, 1, 0.4627451, 0, 1,
-1.433102, 1.109922, -0.7815909, 1, 0.4666667, 0, 1,
-1.430855, 0.8515388, 0.9309881, 1, 0.4745098, 0, 1,
-1.427867, -0.6966976, -1.988344, 1, 0.4784314, 0, 1,
-1.423982, 0.06170435, -2.527404, 1, 0.4862745, 0, 1,
-1.422606, 0.0194765, -2.361833, 1, 0.4901961, 0, 1,
-1.421374, -0.1868127, -2.586194, 1, 0.4980392, 0, 1,
-1.420737, 1.844066, -1.201417, 1, 0.5058824, 0, 1,
-1.413646, 1.527139, -1.261725, 1, 0.509804, 0, 1,
-1.389139, -1.095291, -1.819492, 1, 0.5176471, 0, 1,
-1.388818, -0.1029243, -1.896366, 1, 0.5215687, 0, 1,
-1.383069, -0.9212803, -3.255087, 1, 0.5294118, 0, 1,
-1.378137, -0.01226551, -1.647731, 1, 0.5333334, 0, 1,
-1.371431, 0.04218554, -0.4332965, 1, 0.5411765, 0, 1,
-1.370246, -1.382126, -3.507578, 1, 0.5450981, 0, 1,
-1.363707, 0.1791688, -1.743885, 1, 0.5529412, 0, 1,
-1.36318, -0.2334738, -1.322029, 1, 0.5568628, 0, 1,
-1.361783, -0.06557602, -1.69672, 1, 0.5647059, 0, 1,
-1.359948, -0.3336604, -2.00772, 1, 0.5686275, 0, 1,
-1.357166, -0.932548, -1.28559, 1, 0.5764706, 0, 1,
-1.352929, 1.236357, -1.563418, 1, 0.5803922, 0, 1,
-1.332497, 0.669724, -1.665386, 1, 0.5882353, 0, 1,
-1.331831, -1.293692, -2.629625, 1, 0.5921569, 0, 1,
-1.329264, 1.367852, -2.300457, 1, 0.6, 0, 1,
-1.3263, 0.2865579, -0.66957, 1, 0.6078432, 0, 1,
-1.321183, -1.050367, -0.6807832, 1, 0.6117647, 0, 1,
-1.320642, 1.200845, 0.2886317, 1, 0.6196079, 0, 1,
-1.31739, 0.6794782, -0.7711795, 1, 0.6235294, 0, 1,
-1.315531, -1.946389, -3.432035, 1, 0.6313726, 0, 1,
-1.306153, 0.7661912, 0.0496918, 1, 0.6352941, 0, 1,
-1.301095, -1.212524, -2.575066, 1, 0.6431373, 0, 1,
-1.296617, -0.221355, -1.941429, 1, 0.6470588, 0, 1,
-1.296141, -1.22311, -2.516724, 1, 0.654902, 0, 1,
-1.28759, -0.1502866, -1.82135, 1, 0.6588235, 0, 1,
-1.279862, -0.8941734, -1.451495, 1, 0.6666667, 0, 1,
-1.278649, -0.1827749, 0.3078248, 1, 0.6705883, 0, 1,
-1.276244, -0.9497592, -2.83636, 1, 0.6784314, 0, 1,
-1.274149, 0.2833069, -0.8311245, 1, 0.682353, 0, 1,
-1.269472, 2.00823, -0.8594282, 1, 0.6901961, 0, 1,
-1.268346, -0.3396282, -1.863608, 1, 0.6941177, 0, 1,
-1.267448, 0.6851075, -1.125429, 1, 0.7019608, 0, 1,
-1.259976, 1.601914, -2.469246, 1, 0.7098039, 0, 1,
-1.255013, 1.047317, 1.065777, 1, 0.7137255, 0, 1,
-1.251738, -0.1142902, -1.849453, 1, 0.7215686, 0, 1,
-1.248669, 1.032358, 0.2002396, 1, 0.7254902, 0, 1,
-1.233667, -1.566195, -3.111804, 1, 0.7333333, 0, 1,
-1.221718, -0.7705295, -2.2471, 1, 0.7372549, 0, 1,
-1.209526, 0.635137, -2.244832, 1, 0.7450981, 0, 1,
-1.200212, 1.249463, -1.549343, 1, 0.7490196, 0, 1,
-1.196363, 0.6599922, -1.752719, 1, 0.7568628, 0, 1,
-1.190823, 0.3964543, -1.474934, 1, 0.7607843, 0, 1,
-1.187625, 0.606762, -1.973719, 1, 0.7686275, 0, 1,
-1.184418, 0.8386872, -2.241234, 1, 0.772549, 0, 1,
-1.182431, -2.215023, -1.834527, 1, 0.7803922, 0, 1,
-1.150358, 0.3829338, -2.099746, 1, 0.7843137, 0, 1,
-1.148703, -0.9902983, -2.158516, 1, 0.7921569, 0, 1,
-1.148597, -0.08591472, 0.05513552, 1, 0.7960784, 0, 1,
-1.146703, 1.641017, 1.04029, 1, 0.8039216, 0, 1,
-1.138682, 0.2397201, -1.535491, 1, 0.8117647, 0, 1,
-1.137656, -1.404193, -3.255903, 1, 0.8156863, 0, 1,
-1.133894, -0.4928933, -3.972693, 1, 0.8235294, 0, 1,
-1.131872, -0.01793937, -0.4655198, 1, 0.827451, 0, 1,
-1.124959, -1.243277, -3.552156, 1, 0.8352941, 0, 1,
-1.121618, -0.118885, -2.785161, 1, 0.8392157, 0, 1,
-1.119115, -1.37807, -2.138099, 1, 0.8470588, 0, 1,
-1.107563, -0.4266019, -1.188465, 1, 0.8509804, 0, 1,
-1.106339, 0.3200692, -0.7473939, 1, 0.8588235, 0, 1,
-1.105353, -1.189217, -3.730923, 1, 0.8627451, 0, 1,
-1.094965, 0.1320917, -2.433122, 1, 0.8705882, 0, 1,
-1.088538, 0.4034118, -0.7249746, 1, 0.8745098, 0, 1,
-1.08741, 0.2528062, -0.7599522, 1, 0.8823529, 0, 1,
-1.074394, 0.04910089, -2.139911, 1, 0.8862745, 0, 1,
-1.071682, 0.7480264, -1.448235, 1, 0.8941177, 0, 1,
-1.070529, -0.5957615, -1.525981, 1, 0.8980392, 0, 1,
-1.068833, -0.07132564, -0.4218019, 1, 0.9058824, 0, 1,
-1.068669, -1.55204, -2.966673, 1, 0.9137255, 0, 1,
-1.059975, 0.1127864, -0.9413674, 1, 0.9176471, 0, 1,
-1.059834, -0.03059421, -1.9646, 1, 0.9254902, 0, 1,
-1.059695, 0.7283499, -0.8086401, 1, 0.9294118, 0, 1,
-1.052628, 1.888008, 0.3144249, 1, 0.9372549, 0, 1,
-1.052593, -2.183641, -2.62466, 1, 0.9411765, 0, 1,
-1.051689, -1.402563, -2.773161, 1, 0.9490196, 0, 1,
-1.041402, -0.4591404, -1.504905, 1, 0.9529412, 0, 1,
-1.038548, 0.779381, 0.1465032, 1, 0.9607843, 0, 1,
-1.032424, 1.205707, -0.5188379, 1, 0.9647059, 0, 1,
-1.030532, -1.847271, -1.425988, 1, 0.972549, 0, 1,
-1.030417, -1.044143, -2.279092, 1, 0.9764706, 0, 1,
-1.029805, 0.9498775, -0.5673841, 1, 0.9843137, 0, 1,
-1.025579, 0.7134248, -2.704834, 1, 0.9882353, 0, 1,
-1.020099, 1.65837, -1.312949, 1, 0.9960784, 0, 1,
-1.012577, 0.3784747, -0.2010047, 0.9960784, 1, 0, 1,
-1.010355, -0.1591584, -2.602306, 0.9921569, 1, 0, 1,
-1.009546, -0.8102943, -2.019671, 0.9843137, 1, 0, 1,
-1.002895, 0.618989, -1.331207, 0.9803922, 1, 0, 1,
-1.001855, -0.5094896, -1.855988, 0.972549, 1, 0, 1,
-0.9998334, 0.9806045, -0.4468934, 0.9686275, 1, 0, 1,
-0.9945536, 0.2651218, -1.845748, 0.9607843, 1, 0, 1,
-0.9918486, 1.478235, -0.9393341, 0.9568627, 1, 0, 1,
-0.9912212, 1.732967, -0.7895089, 0.9490196, 1, 0, 1,
-0.9860767, -1.152188, -2.301553, 0.945098, 1, 0, 1,
-0.9760801, 0.04253085, -2.755764, 0.9372549, 1, 0, 1,
-0.9751994, 1.009772, -1.404789, 0.9333333, 1, 0, 1,
-0.9709095, -0.8988832, -3.509813, 0.9254902, 1, 0, 1,
-0.9671744, -0.9662085, -2.305478, 0.9215686, 1, 0, 1,
-0.9627407, 0.4178655, -0.1936767, 0.9137255, 1, 0, 1,
-0.9611782, 1.013794, -1.606538, 0.9098039, 1, 0, 1,
-0.9578177, -0.787247, -2.507174, 0.9019608, 1, 0, 1,
-0.9575885, -0.826089, -3.031729, 0.8941177, 1, 0, 1,
-0.9458835, 0.2954894, -2.005383, 0.8901961, 1, 0, 1,
-0.9448143, -1.405751, -2.332835, 0.8823529, 1, 0, 1,
-0.9423795, 0.1955421, -0.02211835, 0.8784314, 1, 0, 1,
-0.9376862, -0.9972029, -2.140396, 0.8705882, 1, 0, 1,
-0.9312192, 0.5228947, -1.348199, 0.8666667, 1, 0, 1,
-0.9303766, -0.3389674, -0.7671525, 0.8588235, 1, 0, 1,
-0.9290443, -1.288792, -4.002018, 0.854902, 1, 0, 1,
-0.9288525, 0.5409527, -1.307907, 0.8470588, 1, 0, 1,
-0.924878, -0.1218255, -2.377581, 0.8431373, 1, 0, 1,
-0.9119201, -0.5571013, -0.737168, 0.8352941, 1, 0, 1,
-0.9099017, 0.2231713, 0.005903087, 0.8313726, 1, 0, 1,
-0.9043141, 0.02326172, -1.184249, 0.8235294, 1, 0, 1,
-0.9008626, -0.2330985, -2.442764, 0.8196079, 1, 0, 1,
-0.8978348, 0.216048, -0.01174225, 0.8117647, 1, 0, 1,
-0.8973563, 1.142623, -2.219553, 0.8078431, 1, 0, 1,
-0.8848484, -0.6571173, -2.124356, 0.8, 1, 0, 1,
-0.8845734, 1.034474, 1.158953, 0.7921569, 1, 0, 1,
-0.884159, 0.5115474, -2.188557, 0.7882353, 1, 0, 1,
-0.8782853, 1.90593, -0.3450085, 0.7803922, 1, 0, 1,
-0.8711962, 0.6710874, 0.1054844, 0.7764706, 1, 0, 1,
-0.8697993, 0.224456, -2.365572, 0.7686275, 1, 0, 1,
-0.8662357, 0.4567816, -2.359017, 0.7647059, 1, 0, 1,
-0.8610964, 0.6170663, 0.2508794, 0.7568628, 1, 0, 1,
-0.8570212, -1.032509, -4.426541, 0.7529412, 1, 0, 1,
-0.8562558, 0.5639849, -0.3991411, 0.7450981, 1, 0, 1,
-0.851666, 0.708555, 0.9875304, 0.7411765, 1, 0, 1,
-0.8499494, -0.7140536, -2.077041, 0.7333333, 1, 0, 1,
-0.8465536, -0.07642581, -2.594596, 0.7294118, 1, 0, 1,
-0.8374619, 0.3294604, -2.083502, 0.7215686, 1, 0, 1,
-0.8343621, 0.5539185, -0.5338098, 0.7176471, 1, 0, 1,
-0.8311626, 0.5171606, -0.01653128, 0.7098039, 1, 0, 1,
-0.8269078, -0.4130667, -1.920545, 0.7058824, 1, 0, 1,
-0.8243916, -1.400325, -2.51916, 0.6980392, 1, 0, 1,
-0.8237848, 0.6573231, 1.195875, 0.6901961, 1, 0, 1,
-0.8196791, 0.2435035, -1.301886, 0.6862745, 1, 0, 1,
-0.8177147, 0.8593223, -0.9001544, 0.6784314, 1, 0, 1,
-0.8176208, -0.7121916, -1.227804, 0.6745098, 1, 0, 1,
-0.8008819, -1.01994, -4.447081, 0.6666667, 1, 0, 1,
-0.7992989, -1.485721, 0.1815384, 0.6627451, 1, 0, 1,
-0.7982172, 3.032477, -0.987526, 0.654902, 1, 0, 1,
-0.7967163, -0.3604581, -1.995154, 0.6509804, 1, 0, 1,
-0.7954736, 0.4432704, -0.05563322, 0.6431373, 1, 0, 1,
-0.7932557, 0.1434771, 0.4289374, 0.6392157, 1, 0, 1,
-0.7928997, -1.543788, -3.074866, 0.6313726, 1, 0, 1,
-0.7840062, -0.1557926, -4.407586, 0.627451, 1, 0, 1,
-0.7838997, 0.6268269, -0.2418869, 0.6196079, 1, 0, 1,
-0.7809789, 0.8038753, -0.806602, 0.6156863, 1, 0, 1,
-0.7766136, -0.3472335, -3.553605, 0.6078432, 1, 0, 1,
-0.7759839, -0.1752659, -1.525045, 0.6039216, 1, 0, 1,
-0.7733804, 0.6558999, -1.458495, 0.5960785, 1, 0, 1,
-0.7727338, -1.388013, -2.139149, 0.5882353, 1, 0, 1,
-0.7719452, -0.5715864, -2.242269, 0.5843138, 1, 0, 1,
-0.7705742, -1.407051, -2.801883, 0.5764706, 1, 0, 1,
-0.7672096, -0.5496152, -2.568723, 0.572549, 1, 0, 1,
-0.7524488, 0.0267947, -1.769757, 0.5647059, 1, 0, 1,
-0.748606, 0.6038823, -0.439371, 0.5607843, 1, 0, 1,
-0.7458705, -2.039562, -3.733115, 0.5529412, 1, 0, 1,
-0.7387329, 1.473958, 0.1191858, 0.5490196, 1, 0, 1,
-0.7358803, -0.9598499, -3.76927, 0.5411765, 1, 0, 1,
-0.7317167, 0.8370945, -0.4203607, 0.5372549, 1, 0, 1,
-0.7302925, -0.3513442, -2.435287, 0.5294118, 1, 0, 1,
-0.7298124, 1.086702, -0.3934681, 0.5254902, 1, 0, 1,
-0.7226157, -0.5958533, -1.673913, 0.5176471, 1, 0, 1,
-0.7200495, 0.3154367, -3.586645, 0.5137255, 1, 0, 1,
-0.7186767, -1.748806, -2.954881, 0.5058824, 1, 0, 1,
-0.71596, -1.489786, -1.842135, 0.5019608, 1, 0, 1,
-0.7148352, 0.9326944, -1.889553, 0.4941176, 1, 0, 1,
-0.7095144, 1.943425, -1.521, 0.4862745, 1, 0, 1,
-0.7087039, 0.4765668, -0.9388308, 0.4823529, 1, 0, 1,
-0.7030571, -0.06927156, -0.8560812, 0.4745098, 1, 0, 1,
-0.6971889, 1.504023, 0.9830614, 0.4705882, 1, 0, 1,
-0.6967681, -0.9512261, -5.911663, 0.4627451, 1, 0, 1,
-0.6935235, 0.1500234, -4.577598, 0.4588235, 1, 0, 1,
-0.6874915, -0.7426254, -2.185173, 0.4509804, 1, 0, 1,
-0.6871745, 0.686753, -0.9957705, 0.4470588, 1, 0, 1,
-0.6811183, -1.079712, -2.882544, 0.4392157, 1, 0, 1,
-0.6791193, 0.7892325, -2.452527, 0.4352941, 1, 0, 1,
-0.6781383, -0.09599336, -0.8465921, 0.427451, 1, 0, 1,
-0.6764619, 1.150575, -1.372968, 0.4235294, 1, 0, 1,
-0.673394, 0.8448436, -1.825288, 0.4156863, 1, 0, 1,
-0.6719248, -0.8867279, -2.764156, 0.4117647, 1, 0, 1,
-0.6698989, -2.275718, -3.127091, 0.4039216, 1, 0, 1,
-0.6671916, 0.09372608, -1.952939, 0.3960784, 1, 0, 1,
-0.6667215, -1.237782, -1.144081, 0.3921569, 1, 0, 1,
-0.6577165, 0.07370154, -1.333185, 0.3843137, 1, 0, 1,
-0.6566826, 1.211826, -0.3502147, 0.3803922, 1, 0, 1,
-0.6555228, 3.045691, -1.066626, 0.372549, 1, 0, 1,
-0.6511021, 0.5435838, -2.960433, 0.3686275, 1, 0, 1,
-0.6475782, 0.2679995, -2.518174, 0.3607843, 1, 0, 1,
-0.6462354, 1.272895, 0.8999879, 0.3568628, 1, 0, 1,
-0.6274679, 0.5317941, 0.1645632, 0.3490196, 1, 0, 1,
-0.621273, 0.6312498, -0.5575323, 0.345098, 1, 0, 1,
-0.6203273, -1.892187, -3.919923, 0.3372549, 1, 0, 1,
-0.6191803, 1.284464, -0.4705463, 0.3333333, 1, 0, 1,
-0.6086512, -0.06482831, -1.433559, 0.3254902, 1, 0, 1,
-0.6076827, -1.556748, -1.082882, 0.3215686, 1, 0, 1,
-0.6042328, -0.6489348, -3.051289, 0.3137255, 1, 0, 1,
-0.6040701, 0.06674773, -1.909047, 0.3098039, 1, 0, 1,
-0.5950478, -0.6788418, -2.142694, 0.3019608, 1, 0, 1,
-0.594173, 0.6107211, -1.292222, 0.2941177, 1, 0, 1,
-0.5912743, -1.158173, -2.301381, 0.2901961, 1, 0, 1,
-0.5848397, -0.02581668, -3.316256, 0.282353, 1, 0, 1,
-0.5846937, -0.09101737, -1.929786, 0.2784314, 1, 0, 1,
-0.581985, 1.348868, -1.586241, 0.2705882, 1, 0, 1,
-0.5773898, 0.01026483, -1.677587, 0.2666667, 1, 0, 1,
-0.5765987, 0.02502624, -1.790163, 0.2588235, 1, 0, 1,
-0.5736166, -0.0617612, -1.224357, 0.254902, 1, 0, 1,
-0.5715715, 0.1715822, -1.588912, 0.2470588, 1, 0, 1,
-0.5702259, 1.063264, -1.875152, 0.2431373, 1, 0, 1,
-0.5675567, 0.3336901, -0.7177578, 0.2352941, 1, 0, 1,
-0.5667508, -0.229281, -0.3719355, 0.2313726, 1, 0, 1,
-0.5580963, -0.4576156, -2.564723, 0.2235294, 1, 0, 1,
-0.5554672, 0.7962718, -0.9457572, 0.2196078, 1, 0, 1,
-0.5549771, -0.5646809, -1.7021, 0.2117647, 1, 0, 1,
-0.5529112, -1.432304, -1.960075, 0.2078431, 1, 0, 1,
-0.5516918, 0.2508165, -2.090621, 0.2, 1, 0, 1,
-0.5510914, -0.7703777, -3.014411, 0.1921569, 1, 0, 1,
-0.5457249, 0.1317644, -0.819059, 0.1882353, 1, 0, 1,
-0.544126, -0.2188406, -0.8317848, 0.1803922, 1, 0, 1,
-0.5436927, 0.7870682, 0.4324273, 0.1764706, 1, 0, 1,
-0.5350844, 0.8189407, -1.248108, 0.1686275, 1, 0, 1,
-0.5322408, 0.8967113, 0.08007316, 0.1647059, 1, 0, 1,
-0.5317816, -0.05729187, -0.5681763, 0.1568628, 1, 0, 1,
-0.5301882, 0.3020892, 0.3658336, 0.1529412, 1, 0, 1,
-0.5289645, 0.7476618, 1.045209, 0.145098, 1, 0, 1,
-0.5274079, 2.253246, -1.905079, 0.1411765, 1, 0, 1,
-0.5201175, -0.6452131, -3.678562, 0.1333333, 1, 0, 1,
-0.5175002, -0.08288175, -2.666099, 0.1294118, 1, 0, 1,
-0.5137888, 1.433809, 0.5384566, 0.1215686, 1, 0, 1,
-0.5117436, -1.145706, -3.609618, 0.1176471, 1, 0, 1,
-0.5067419, -0.622383, -2.644179, 0.1098039, 1, 0, 1,
-0.5063666, -0.7830881, -1.823995, 0.1058824, 1, 0, 1,
-0.5053123, 0.08539588, -2.455029, 0.09803922, 1, 0, 1,
-0.5030963, -0.4444686, -3.409749, 0.09019608, 1, 0, 1,
-0.4991197, 0.2514886, -1.325471, 0.08627451, 1, 0, 1,
-0.4895485, -0.7740251, -3.598955, 0.07843138, 1, 0, 1,
-0.4893793, -0.2908565, -2.249586, 0.07450981, 1, 0, 1,
-0.4867679, -0.3237803, -2.505799, 0.06666667, 1, 0, 1,
-0.4857072, 1.437698, -0.6572297, 0.0627451, 1, 0, 1,
-0.4853276, -0.7320158, -2.593916, 0.05490196, 1, 0, 1,
-0.4820059, -1.83549, -3.43366, 0.05098039, 1, 0, 1,
-0.4738075, 1.858854, 0.2394842, 0.04313726, 1, 0, 1,
-0.4719285, 0.9618372, -1.641168, 0.03921569, 1, 0, 1,
-0.471673, 2.811657, 0.9981496, 0.03137255, 1, 0, 1,
-0.4690975, -1.134753, -1.918949, 0.02745098, 1, 0, 1,
-0.4660838, 0.2659926, -0.2302357, 0.01960784, 1, 0, 1,
-0.4656401, -0.7890391, -2.832149, 0.01568628, 1, 0, 1,
-0.4637435, -0.06293058, 0.4258021, 0.007843138, 1, 0, 1,
-0.463507, -0.3236534, -2.624409, 0.003921569, 1, 0, 1,
-0.4632348, 0.07609518, -2.593446, 0, 1, 0.003921569, 1,
-0.4608265, 2.034458, -0.6273988, 0, 1, 0.01176471, 1,
-0.4579036, 0.771242, 0.04360748, 0, 1, 0.01568628, 1,
-0.4569556, 0.3362043, -0.2411519, 0, 1, 0.02352941, 1,
-0.4563521, 2.131923, 0.2889389, 0, 1, 0.02745098, 1,
-0.455425, -0.5029799, -0.8689769, 0, 1, 0.03529412, 1,
-0.4500375, 1.232127, -2.253074, 0, 1, 0.03921569, 1,
-0.449526, -0.766249, -2.32684, 0, 1, 0.04705882, 1,
-0.441044, -1.775501, -5.9668, 0, 1, 0.05098039, 1,
-0.4382056, -0.07557932, -2.735518, 0, 1, 0.05882353, 1,
-0.4378306, 0.7682853, 0.4402892, 0, 1, 0.0627451, 1,
-0.434506, -0.3076628, -1.495504, 0, 1, 0.07058824, 1,
-0.4339305, -0.9097148, -2.094382, 0, 1, 0.07450981, 1,
-0.4322504, -2.58523, -2.100633, 0, 1, 0.08235294, 1,
-0.4285543, -0.4520849, -1.802107, 0, 1, 0.08627451, 1,
-0.4246459, -0.5559061, -3.283427, 0, 1, 0.09411765, 1,
-0.4224911, -0.6769662, -4.042336, 0, 1, 0.1019608, 1,
-0.4186828, 0.3913359, -0.6910157, 0, 1, 0.1058824, 1,
-0.4061505, 1.417589, -0.8159072, 0, 1, 0.1137255, 1,
-0.4049364, -0.7932938, -2.685848, 0, 1, 0.1176471, 1,
-0.401529, 0.9649429, -0.2600738, 0, 1, 0.1254902, 1,
-0.3992962, -0.6938964, -1.241705, 0, 1, 0.1294118, 1,
-0.3983909, 0.8869648, 2.900095, 0, 1, 0.1372549, 1,
-0.3923405, -0.7814938, -2.267542, 0, 1, 0.1411765, 1,
-0.3916016, -1.343185, -3.115177, 0, 1, 0.1490196, 1,
-0.3794281, -1.152464, -3.225754, 0, 1, 0.1529412, 1,
-0.3654855, -1.87711, -2.857375, 0, 1, 0.1607843, 1,
-0.3640862, 1.260666, 1.510259, 0, 1, 0.1647059, 1,
-0.3610661, -0.6544515, -0.7444187, 0, 1, 0.172549, 1,
-0.3603786, -1.808885, -2.094646, 0, 1, 0.1764706, 1,
-0.3603608, 0.3955489, -1.318928, 0, 1, 0.1843137, 1,
-0.3544048, 0.7760901, -0.5082678, 0, 1, 0.1882353, 1,
-0.3502683, 0.07712939, -0.6733916, 0, 1, 0.1960784, 1,
-0.3474985, -0.1619555, -1.641554, 0, 1, 0.2039216, 1,
-0.3448628, 0.6545494, -0.1535106, 0, 1, 0.2078431, 1,
-0.3429484, -0.6510065, -4.52656, 0, 1, 0.2156863, 1,
-0.3418137, -0.5339195, -2.627743, 0, 1, 0.2196078, 1,
-0.3397698, 0.5254529, -0.5523851, 0, 1, 0.227451, 1,
-0.3390226, -0.9874931, -1.325537, 0, 1, 0.2313726, 1,
-0.3359684, 1.52055, -1.144758, 0, 1, 0.2392157, 1,
-0.3344364, -0.4852661, -1.364829, 0, 1, 0.2431373, 1,
-0.333351, 1.703735, 1.618726, 0, 1, 0.2509804, 1,
-0.3289136, -2.995878, -3.049434, 0, 1, 0.254902, 1,
-0.3286638, -3.196761, -0.8846951, 0, 1, 0.2627451, 1,
-0.3224245, -0.4054407, -3.051001, 0, 1, 0.2666667, 1,
-0.320895, -0.7805051, -2.905443, 0, 1, 0.2745098, 1,
-0.3085578, -0.3656995, -4.530732, 0, 1, 0.2784314, 1,
-0.3027254, -0.3436467, -3.917816, 0, 1, 0.2862745, 1,
-0.2960018, -0.4868441, -1.376203, 0, 1, 0.2901961, 1,
-0.2930963, -1.742356, -3.681697, 0, 1, 0.2980392, 1,
-0.2918138, 1.043267, -1.910276, 0, 1, 0.3058824, 1,
-0.2897323, 1.01672, 1.674134, 0, 1, 0.3098039, 1,
-0.2867788, -1.140878, -3.258993, 0, 1, 0.3176471, 1,
-0.2843437, 1.289286, -1.428482, 0, 1, 0.3215686, 1,
-0.2734431, 0.3081247, -0.3896053, 0, 1, 0.3294118, 1,
-0.2722193, -0.5991947, -1.840081, 0, 1, 0.3333333, 1,
-0.2707618, 0.6918373, -1.786547, 0, 1, 0.3411765, 1,
-0.2703483, -0.368898, -2.891298, 0, 1, 0.345098, 1,
-0.2684048, 0.4826753, -0.6232008, 0, 1, 0.3529412, 1,
-0.2680074, -0.4808346, -2.268579, 0, 1, 0.3568628, 1,
-0.2668631, -0.7048032, -2.417453, 0, 1, 0.3647059, 1,
-0.2651496, 0.4158447, -0.7742893, 0, 1, 0.3686275, 1,
-0.2644684, 1.574757, -0.6261057, 0, 1, 0.3764706, 1,
-0.2633484, -0.173275, -1.882492, 0, 1, 0.3803922, 1,
-0.2621836, -2.128312, -1.717664, 0, 1, 0.3882353, 1,
-0.2613124, -0.9326877, -1.561656, 0, 1, 0.3921569, 1,
-0.2611681, 1.701338, 0.03069546, 0, 1, 0.4, 1,
-0.2594586, 0.317091, -0.8432902, 0, 1, 0.4078431, 1,
-0.2545219, 0.8100433, 0.04690839, 0, 1, 0.4117647, 1,
-0.251118, -0.2671734, -1.843915, 0, 1, 0.4196078, 1,
-0.2491698, 0.7829019, -1.308578, 0, 1, 0.4235294, 1,
-0.2484879, -0.3507189, -2.997845, 0, 1, 0.4313726, 1,
-0.248367, -0.8948401, -3.437248, 0, 1, 0.4352941, 1,
-0.2470168, 0.2049403, -2.228408, 0, 1, 0.4431373, 1,
-0.2444533, -1.296868, -2.821154, 0, 1, 0.4470588, 1,
-0.2433442, 0.52645, -0.2022139, 0, 1, 0.454902, 1,
-0.2346912, -1.096651, -1.690909, 0, 1, 0.4588235, 1,
-0.2315871, -0.8999023, -3.116149, 0, 1, 0.4666667, 1,
-0.2311915, 0.1054517, 0.5493361, 0, 1, 0.4705882, 1,
-0.230702, 0.5722771, -1.442131, 0, 1, 0.4784314, 1,
-0.2213937, -1.101979, -3.27546, 0, 1, 0.4823529, 1,
-0.2177096, 0.6473841, 0.0244866, 0, 1, 0.4901961, 1,
-0.2157011, -0.2118287, -2.934852, 0, 1, 0.4941176, 1,
-0.2129826, -1.236807, -2.207358, 0, 1, 0.5019608, 1,
-0.211726, 0.4445301, 0.2590601, 0, 1, 0.509804, 1,
-0.2116362, 0.4747787, -0.7963672, 0, 1, 0.5137255, 1,
-0.2093435, 0.08173744, -1.546136, 0, 1, 0.5215687, 1,
-0.2072584, -0.9458914, -3.888088, 0, 1, 0.5254902, 1,
-0.2064077, -0.1467028, -2.038755, 0, 1, 0.5333334, 1,
-0.2031544, -1.301976, -3.846687, 0, 1, 0.5372549, 1,
-0.2017981, 0.1367953, -2.619284, 0, 1, 0.5450981, 1,
-0.2010714, 1.650679, -0.6945828, 0, 1, 0.5490196, 1,
-0.1984303, -0.8523399, -3.244602, 0, 1, 0.5568628, 1,
-0.1979529, 2.240472, -1.729889, 0, 1, 0.5607843, 1,
-0.1954224, -1.014185, -3.460036, 0, 1, 0.5686275, 1,
-0.1868832, 0.2608804, 0.2020015, 0, 1, 0.572549, 1,
-0.1863158, -1.103614, -3.282068, 0, 1, 0.5803922, 1,
-0.181182, -0.4897194, -4.016508, 0, 1, 0.5843138, 1,
-0.1800152, 0.7897096, -0.6892087, 0, 1, 0.5921569, 1,
-0.1776707, 0.6254214, -0.2383028, 0, 1, 0.5960785, 1,
-0.1759219, -0.2693279, -2.241173, 0, 1, 0.6039216, 1,
-0.166093, 1.738225, -1.96594, 0, 1, 0.6117647, 1,
-0.161518, -0.8307504, -4.508016, 0, 1, 0.6156863, 1,
-0.1609446, 0.5920421, -1.358184, 0, 1, 0.6235294, 1,
-0.1600712, -0.7474394, -4.045918, 0, 1, 0.627451, 1,
-0.1598142, 0.5835035, 1.54639, 0, 1, 0.6352941, 1,
-0.1542781, -0.6862985, -2.32957, 0, 1, 0.6392157, 1,
-0.1525488, -1.368719, -3.54762, 0, 1, 0.6470588, 1,
-0.1517337, -0.4774056, -1.51928, 0, 1, 0.6509804, 1,
-0.151561, -0.4247512, -2.769799, 0, 1, 0.6588235, 1,
-0.1460699, 2.215031, -0.8757956, 0, 1, 0.6627451, 1,
-0.1449798, 0.4432383, 1.691679, 0, 1, 0.6705883, 1,
-0.1447524, -0.205325, -2.391158, 0, 1, 0.6745098, 1,
-0.143826, 0.2250462, -0.4014115, 0, 1, 0.682353, 1,
-0.1365886, -0.1311717, -1.210898, 0, 1, 0.6862745, 1,
-0.1296999, 0.4032963, -0.7720696, 0, 1, 0.6941177, 1,
-0.1265504, 1.146202, -0.07320416, 0, 1, 0.7019608, 1,
-0.1185258, 0.9263126, 1.263911, 0, 1, 0.7058824, 1,
-0.1184281, -0.2166846, -3.783342, 0, 1, 0.7137255, 1,
-0.117995, 0.09838387, -1.708843, 0, 1, 0.7176471, 1,
-0.1152216, 0.1667884, -1.565754, 0, 1, 0.7254902, 1,
-0.106807, -0.8990835, -1.918482, 0, 1, 0.7294118, 1,
-0.1003529, -0.02147799, -3.597509, 0, 1, 0.7372549, 1,
-0.09531099, -1.230811, -3.166495, 0, 1, 0.7411765, 1,
-0.09094977, -0.9318141, -4.134781, 0, 1, 0.7490196, 1,
-0.09009259, -0.2679872, -3.779881, 0, 1, 0.7529412, 1,
-0.07764697, 0.5914379, -0.06197803, 0, 1, 0.7607843, 1,
-0.07714072, 0.08965073, -1.257621, 0, 1, 0.7647059, 1,
-0.07311078, 0.2987862, 0.05809432, 0, 1, 0.772549, 1,
-0.06673392, -0.6778386, -3.110033, 0, 1, 0.7764706, 1,
-0.0634684, 1.789752, 1.811558, 0, 1, 0.7843137, 1,
-0.06337516, -0.3924389, -1.622537, 0, 1, 0.7882353, 1,
-0.06174167, 0.6459208, 0.600958, 0, 1, 0.7960784, 1,
-0.06115482, -0.5056504, -2.537766, 0, 1, 0.8039216, 1,
-0.06011874, -0.3172209, -1.648661, 0, 1, 0.8078431, 1,
-0.05794108, 0.6486225, -1.282484, 0, 1, 0.8156863, 1,
-0.05561903, -0.8791063, -2.243654, 0, 1, 0.8196079, 1,
-0.04907411, 0.9773551, 1.015807, 0, 1, 0.827451, 1,
-0.04904807, 0.01471197, -1.803478, 0, 1, 0.8313726, 1,
-0.04338719, 1.102471, 0.9923505, 0, 1, 0.8392157, 1,
-0.04309513, 0.7660825, -0.9134542, 0, 1, 0.8431373, 1,
-0.04189764, -0.2176868, -3.450913, 0, 1, 0.8509804, 1,
-0.04035927, 0.7347346, -1.832507, 0, 1, 0.854902, 1,
-0.03964232, -0.5275483, -2.475372, 0, 1, 0.8627451, 1,
-0.03891096, -2.503512, -3.589989, 0, 1, 0.8666667, 1,
-0.03730578, -0.7834575, -2.225582, 0, 1, 0.8745098, 1,
-0.0371719, 0.8647527, 0.3170568, 0, 1, 0.8784314, 1,
-0.032786, -0.1849576, -1.998171, 0, 1, 0.8862745, 1,
-0.0323177, 0.09242436, -0.8528783, 0, 1, 0.8901961, 1,
-0.02646228, -0.469008, -4.03086, 0, 1, 0.8980392, 1,
-0.02471494, 2.993232, -1.347455, 0, 1, 0.9058824, 1,
-0.02415728, -0.2665911, -3.891683, 0, 1, 0.9098039, 1,
-0.02026019, -1.320682, -2.48408, 0, 1, 0.9176471, 1,
-0.01931073, 2.73314, -0.4590609, 0, 1, 0.9215686, 1,
-0.01908196, -1.035576, -3.291542, 0, 1, 0.9294118, 1,
-0.01905104, 1.729149, 2.403954, 0, 1, 0.9333333, 1,
-0.01362046, 0.04351627, -1.865564, 0, 1, 0.9411765, 1,
-0.009874173, -0.4204586, -4.82112, 0, 1, 0.945098, 1,
-0.009376409, 1.485859, 2.509335, 0, 1, 0.9529412, 1,
-0.008267855, 0.2599924, 1.315074, 0, 1, 0.9568627, 1,
-0.007953166, -0.7350435, -4.599213, 0, 1, 0.9647059, 1,
-2.604469e-05, -1.637574, -3.085744, 0, 1, 0.9686275, 1,
0.004194736, 0.1487898, 2.107397, 0, 1, 0.9764706, 1,
0.00747874, -0.732343, 4.447602, 0, 1, 0.9803922, 1,
0.007952603, -2.403689, 2.954329, 0, 1, 0.9882353, 1,
0.009662128, -1.770439, 4.17102, 0, 1, 0.9921569, 1,
0.01399537, 0.2658572, -0.8732517, 0, 1, 1, 1,
0.01482784, 2.734026, -1.586054, 0, 0.9921569, 1, 1,
0.0234622, -1.587659, 3.837985, 0, 0.9882353, 1, 1,
0.02424679, -0.2906924, 3.759298, 0, 0.9803922, 1, 1,
0.0263167, -0.7994758, 4.406165, 0, 0.9764706, 1, 1,
0.03114059, 0.737641, -0.006984139, 0, 0.9686275, 1, 1,
0.03637217, 1.216392, 0.5561641, 0, 0.9647059, 1, 1,
0.03694874, -1.539607, 2.331305, 0, 0.9568627, 1, 1,
0.03852125, 0.6880346, -1.737753, 0, 0.9529412, 1, 1,
0.03968593, -1.61116, 3.474496, 0, 0.945098, 1, 1,
0.04045871, 0.04627663, 2.663018, 0, 0.9411765, 1, 1,
0.0427449, -2.28065, 2.904311, 0, 0.9333333, 1, 1,
0.04423556, 1.181937, 0.4002247, 0, 0.9294118, 1, 1,
0.04430895, 2.456509, -0.6963437, 0, 0.9215686, 1, 1,
0.04522079, 0.6867747, 0.8926597, 0, 0.9176471, 1, 1,
0.04778127, -1.823777, 2.140361, 0, 0.9098039, 1, 1,
0.04855008, -0.1097907, 2.873958, 0, 0.9058824, 1, 1,
0.04864752, -2.655199, 2.620855, 0, 0.8980392, 1, 1,
0.05202734, -0.9028021, 2.202259, 0, 0.8901961, 1, 1,
0.05598655, -1.251343, 2.13933, 0, 0.8862745, 1, 1,
0.05853219, -1.541287, 2.077901, 0, 0.8784314, 1, 1,
0.06093837, 0.2171819, 0.8615463, 0, 0.8745098, 1, 1,
0.06230563, 0.444051, 0.7536188, 0, 0.8666667, 1, 1,
0.06530675, -0.5340868, 1.990938, 0, 0.8627451, 1, 1,
0.06759959, 2.965657, -1.060028, 0, 0.854902, 1, 1,
0.06760133, 0.5785361, 0.1923185, 0, 0.8509804, 1, 1,
0.06819462, 0.528339, 0.9153123, 0, 0.8431373, 1, 1,
0.07809194, 0.7396437, -0.4977496, 0, 0.8392157, 1, 1,
0.07973187, -0.05517915, 2.351032, 0, 0.8313726, 1, 1,
0.0799423, 0.4898352, -0.2114659, 0, 0.827451, 1, 1,
0.08122044, -1.365444, 2.893605, 0, 0.8196079, 1, 1,
0.08176573, -0.2863916, 2.965732, 0, 0.8156863, 1, 1,
0.08181939, 1.520626, -0.7863496, 0, 0.8078431, 1, 1,
0.08346557, -2.12987, 2.961896, 0, 0.8039216, 1, 1,
0.08463429, -0.5731741, 3.958143, 0, 0.7960784, 1, 1,
0.08745537, 1.561819, -0.9757339, 0, 0.7882353, 1, 1,
0.08821831, 0.7064747, 0.09996627, 0, 0.7843137, 1, 1,
0.09293409, 0.2018367, -0.8590448, 0, 0.7764706, 1, 1,
0.09337077, 1.001947, -1.646063, 0, 0.772549, 1, 1,
0.09378595, 0.7660405, 0.6367015, 0, 0.7647059, 1, 1,
0.09528916, 0.6958709, 0.3909362, 0, 0.7607843, 1, 1,
0.1041384, -1.365549, 4.903421, 0, 0.7529412, 1, 1,
0.1058383, -0.04214279, 0.4268607, 0, 0.7490196, 1, 1,
0.1068134, 0.6829479, -1.537321, 0, 0.7411765, 1, 1,
0.1084597, -0.1280822, 1.075603, 0, 0.7372549, 1, 1,
0.1107026, 0.5206223, 0.2577814, 0, 0.7294118, 1, 1,
0.1112437, -1.10141, 3.987, 0, 0.7254902, 1, 1,
0.1119537, -0.4508144, 4.882887, 0, 0.7176471, 1, 1,
0.1135973, -1.291898, 3.351429, 0, 0.7137255, 1, 1,
0.1197603, -0.2265606, 3.917551, 0, 0.7058824, 1, 1,
0.1203533, 2.037394, -0.4470223, 0, 0.6980392, 1, 1,
0.1224688, 0.2587264, 0.7973068, 0, 0.6941177, 1, 1,
0.1253557, -1.466533, 4.082702, 0, 0.6862745, 1, 1,
0.1259549, -0.08141612, 1.681112, 0, 0.682353, 1, 1,
0.1321093, 0.1200723, -0.7349744, 0, 0.6745098, 1, 1,
0.1335981, 1.158707, 2.254141, 0, 0.6705883, 1, 1,
0.1360366, 1.588666, -0.6106036, 0, 0.6627451, 1, 1,
0.1393676, 0.1604744, 1.98313, 0, 0.6588235, 1, 1,
0.1420857, -1.210232, 4.503917, 0, 0.6509804, 1, 1,
0.1436855, -0.8171615, 2.071308, 0, 0.6470588, 1, 1,
0.1475664, 0.5041351, 0.9951087, 0, 0.6392157, 1, 1,
0.1484179, -0.7498235, 2.624374, 0, 0.6352941, 1, 1,
0.1516296, 1.063553, 1.687879, 0, 0.627451, 1, 1,
0.1561816, -0.2072194, 3.382913, 0, 0.6235294, 1, 1,
0.1593829, -0.305336, 2.026589, 0, 0.6156863, 1, 1,
0.1617607, -0.8298982, 4.048666, 0, 0.6117647, 1, 1,
0.1638375, -1.752611, 2.022174, 0, 0.6039216, 1, 1,
0.1664355, -1.705215, 1.524793, 0, 0.5960785, 1, 1,
0.17173, 0.6499795, -0.3962133, 0, 0.5921569, 1, 1,
0.1723171, 0.3592438, 1.044381, 0, 0.5843138, 1, 1,
0.1726639, 0.7967436, -0.261447, 0, 0.5803922, 1, 1,
0.1738902, 1.174684, 0.04132763, 0, 0.572549, 1, 1,
0.1767281, 0.7500334, 0.2605886, 0, 0.5686275, 1, 1,
0.1851078, -0.3997615, 1.810135, 0, 0.5607843, 1, 1,
0.1853336, -0.3990718, 2.833723, 0, 0.5568628, 1, 1,
0.1925897, 0.2815353, 0.5751827, 0, 0.5490196, 1, 1,
0.1939941, 0.30494, -0.04003084, 0, 0.5450981, 1, 1,
0.1955958, 0.2386214, 3.606975, 0, 0.5372549, 1, 1,
0.1963505, -0.06586723, 0.7347995, 0, 0.5333334, 1, 1,
0.1995674, -0.4885958, 2.366274, 0, 0.5254902, 1, 1,
0.2057425, 2.637696, -1.168563, 0, 0.5215687, 1, 1,
0.2068769, -0.9545314, 3.120359, 0, 0.5137255, 1, 1,
0.2118397, -0.5806048, 2.257942, 0, 0.509804, 1, 1,
0.2126975, -0.2232457, 2.047557, 0, 0.5019608, 1, 1,
0.2132328, 1.372283, -0.746056, 0, 0.4941176, 1, 1,
0.2152831, 0.5360238, -1.799871, 0, 0.4901961, 1, 1,
0.2154082, 0.4717171, -0.6223392, 0, 0.4823529, 1, 1,
0.2162306, -0.03830568, 1.246604, 0, 0.4784314, 1, 1,
0.219477, -2.197299, 3.848936, 0, 0.4705882, 1, 1,
0.2199436, -0.4699446, 1.83134, 0, 0.4666667, 1, 1,
0.220316, 1.021378, 0.2504448, 0, 0.4588235, 1, 1,
0.2238646, -0.06049653, 0.2296509, 0, 0.454902, 1, 1,
0.2238985, 1.512847, -0.3721549, 0, 0.4470588, 1, 1,
0.224641, -0.6762101, 2.933928, 0, 0.4431373, 1, 1,
0.2250224, -0.1974317, 4.346447, 0, 0.4352941, 1, 1,
0.2254234, -2.469386, 3.197541, 0, 0.4313726, 1, 1,
0.225437, -1.84435, 4.304582, 0, 0.4235294, 1, 1,
0.2275057, -1.465916, 2.081038, 0, 0.4196078, 1, 1,
0.2286372, -1.322294, 3.683474, 0, 0.4117647, 1, 1,
0.2289383, -0.4854542, 2.606232, 0, 0.4078431, 1, 1,
0.232675, 0.5567209, -0.9022813, 0, 0.4, 1, 1,
0.2333898, 1.170681, -1.203095, 0, 0.3921569, 1, 1,
0.2408891, 0.3133552, -0.06828925, 0, 0.3882353, 1, 1,
0.2491254, -0.2281266, 3.802022, 0, 0.3803922, 1, 1,
0.2498394, 1.307642, 0.9531899, 0, 0.3764706, 1, 1,
0.2581317, -0.3154816, 2.523853, 0, 0.3686275, 1, 1,
0.2645582, 0.281897, 0.594772, 0, 0.3647059, 1, 1,
0.2665809, -0.2652636, 1.399198, 0, 0.3568628, 1, 1,
0.2669259, -0.4127914, 2.392674, 0, 0.3529412, 1, 1,
0.2670837, -1.633741, 3.823473, 0, 0.345098, 1, 1,
0.272041, 2.568009, 0.1929941, 0, 0.3411765, 1, 1,
0.274439, 0.8004873, -1.291855, 0, 0.3333333, 1, 1,
0.2768149, -1.797013, 2.101876, 0, 0.3294118, 1, 1,
0.2786303, 0.5328971, -0.2625208, 0, 0.3215686, 1, 1,
0.2797972, -0.9351552, 4.208904, 0, 0.3176471, 1, 1,
0.2810075, -1.910836, 3.04936, 0, 0.3098039, 1, 1,
0.282912, -0.920042, 1.24206, 0, 0.3058824, 1, 1,
0.2829862, 0.8998559, -0.4504124, 0, 0.2980392, 1, 1,
0.2842855, 0.4345516, 1.637446, 0, 0.2901961, 1, 1,
0.2873839, 1.42713, -0.6212495, 0, 0.2862745, 1, 1,
0.2890158, -0.9421859, 1.972128, 0, 0.2784314, 1, 1,
0.2901259, 0.8333942, -0.09636825, 0, 0.2745098, 1, 1,
0.2918535, 1.498147, 0.9945852, 0, 0.2666667, 1, 1,
0.2947795, -0.04754982, 2.404164, 0, 0.2627451, 1, 1,
0.2974961, 1.269987, 0.7644115, 0, 0.254902, 1, 1,
0.298854, 1.116069, -0.8104035, 0, 0.2509804, 1, 1,
0.3004224, -1.62966, 2.240844, 0, 0.2431373, 1, 1,
0.3039177, 0.04859626, 1.75632, 0, 0.2392157, 1, 1,
0.3055263, -0.4992809, 2.809413, 0, 0.2313726, 1, 1,
0.3057758, 0.9411105, -1.207531, 0, 0.227451, 1, 1,
0.3058978, 0.382261, -0.3680704, 0, 0.2196078, 1, 1,
0.312447, 0.1793033, 1.212195, 0, 0.2156863, 1, 1,
0.3163686, 0.4784257, 0.3090723, 0, 0.2078431, 1, 1,
0.3178964, 0.9393378, 1.283222, 0, 0.2039216, 1, 1,
0.3227713, 0.02463423, 3.558841, 0, 0.1960784, 1, 1,
0.3263896, 0.4648598, -0.1355455, 0, 0.1882353, 1, 1,
0.3304472, -1.209657, 4.096334, 0, 0.1843137, 1, 1,
0.3336542, 0.5970449, 0.8897386, 0, 0.1764706, 1, 1,
0.3354745, -2.210996, 2.535576, 0, 0.172549, 1, 1,
0.3364215, -3.367646, 4.176836, 0, 0.1647059, 1, 1,
0.3390778, 0.6592882, 0.09754488, 0, 0.1607843, 1, 1,
0.3392011, 2.231781, -0.3787415, 0, 0.1529412, 1, 1,
0.3416625, -0.6645503, 2.938107, 0, 0.1490196, 1, 1,
0.3444936, -1.453928, 1.752265, 0, 0.1411765, 1, 1,
0.3446751, 1.676891, 1.891258, 0, 0.1372549, 1, 1,
0.35535, -1.474812, 1.472859, 0, 0.1294118, 1, 1,
0.3569207, -0.7752969, 0.7333792, 0, 0.1254902, 1, 1,
0.3595363, -0.01509965, 2.03907, 0, 0.1176471, 1, 1,
0.3641855, 1.909182, 1.892348, 0, 0.1137255, 1, 1,
0.3650846, 0.2385313, 1.883205, 0, 0.1058824, 1, 1,
0.3667936, -0.1705052, 1.547239, 0, 0.09803922, 1, 1,
0.367401, -0.6443955, 1.495209, 0, 0.09411765, 1, 1,
0.3695148, 0.3298577, 1.363122, 0, 0.08627451, 1, 1,
0.3762792, 0.01748609, 4.230294, 0, 0.08235294, 1, 1,
0.3769286, 1.366994, -2.035337, 0, 0.07450981, 1, 1,
0.3798423, -0.03175634, 1.101423, 0, 0.07058824, 1, 1,
0.3800425, 0.03127931, 2.981673, 0, 0.0627451, 1, 1,
0.3887864, -1.465869, 3.891126, 0, 0.05882353, 1, 1,
0.3907122, 0.679483, 0.4096, 0, 0.05098039, 1, 1,
0.3907983, 1.573033, 0.4441638, 0, 0.04705882, 1, 1,
0.3951832, -0.904298, 2.233993, 0, 0.03921569, 1, 1,
0.3969122, 0.208248, 1.125023, 0, 0.03529412, 1, 1,
0.3982057, 0.7200534, 1.27251, 0, 0.02745098, 1, 1,
0.3983003, 1.163362, -1.358357, 0, 0.02352941, 1, 1,
0.4002199, 0.3622364, 0.1150212, 0, 0.01568628, 1, 1,
0.4012364, -1.177403, 3.359118, 0, 0.01176471, 1, 1,
0.4024168, -0.3278483, 0.4220002, 0, 0.003921569, 1, 1,
0.4041063, 0.3903808, 0.4984004, 0.003921569, 0, 1, 1,
0.4075448, -1.408096, 2.770068, 0.007843138, 0, 1, 1,
0.4090614, 1.343427, 0.8385459, 0.01568628, 0, 1, 1,
0.4115933, 0.6837457, 1.581624, 0.01960784, 0, 1, 1,
0.4122019, -1.293668, 2.064075, 0.02745098, 0, 1, 1,
0.4144523, 0.7790443, 0.2989289, 0.03137255, 0, 1, 1,
0.4185123, 0.7122781, 1.24253, 0.03921569, 0, 1, 1,
0.424551, 0.0540685, -0.2044289, 0.04313726, 0, 1, 1,
0.4253895, -1.179875, 2.017406, 0.05098039, 0, 1, 1,
0.4287751, -0.09546088, 0.8193136, 0.05490196, 0, 1, 1,
0.4343677, 0.3758065, 1.837253, 0.0627451, 0, 1, 1,
0.4374162, 0.6299252, 1.831767, 0.06666667, 0, 1, 1,
0.4398818, 1.013411, -0.323957, 0.07450981, 0, 1, 1,
0.4463751, 0.4677099, 2.109637, 0.07843138, 0, 1, 1,
0.4478697, 0.7827544, 0.2271126, 0.08627451, 0, 1, 1,
0.4513734, 1.627368, 0.2576127, 0.09019608, 0, 1, 1,
0.4570274, 0.07657019, -0.771555, 0.09803922, 0, 1, 1,
0.4576363, -0.09159407, 2.765918, 0.1058824, 0, 1, 1,
0.4581368, 0.4788125, 0.5035995, 0.1098039, 0, 1, 1,
0.4588614, -0.9274084, 2.312027, 0.1176471, 0, 1, 1,
0.4650139, -0.1422768, 2.245034, 0.1215686, 0, 1, 1,
0.4722477, -1.773192, 0.7840014, 0.1294118, 0, 1, 1,
0.4755393, -1.486193, 1.143042, 0.1333333, 0, 1, 1,
0.4803231, -0.09239795, 1.827285, 0.1411765, 0, 1, 1,
0.4813589, 0.6829481, 3.497711, 0.145098, 0, 1, 1,
0.4830436, 0.03149927, 1.347316, 0.1529412, 0, 1, 1,
0.4852335, 0.008634227, 2.241537, 0.1568628, 0, 1, 1,
0.4897903, 1.110797, 0.2239417, 0.1647059, 0, 1, 1,
0.4906852, 0.3162078, 0.9819189, 0.1686275, 0, 1, 1,
0.4962276, -0.9910902, 4.092917, 0.1764706, 0, 1, 1,
0.4982503, 0.4435256, 1.505645, 0.1803922, 0, 1, 1,
0.4997698, -0.4341976, 4.249067, 0.1882353, 0, 1, 1,
0.5002517, -0.1873848, 3.438856, 0.1921569, 0, 1, 1,
0.5025009, -0.9338051, 2.970036, 0.2, 0, 1, 1,
0.5038833, -0.8622226, 3.090513, 0.2078431, 0, 1, 1,
0.5073009, 0.221133, 1.471382, 0.2117647, 0, 1, 1,
0.5079169, 1.333527, 0.6317711, 0.2196078, 0, 1, 1,
0.5102465, 0.7255604, 0.4429381, 0.2235294, 0, 1, 1,
0.5119429, -0.979722, 4.061699, 0.2313726, 0, 1, 1,
0.5120619, -1.338004, 3.034751, 0.2352941, 0, 1, 1,
0.5143337, -0.04359953, 1.125079, 0.2431373, 0, 1, 1,
0.5162336, -0.005977393, 1.449672, 0.2470588, 0, 1, 1,
0.5238178, 2.052098, 1.44168, 0.254902, 0, 1, 1,
0.5365721, -0.1340024, 2.705714, 0.2588235, 0, 1, 1,
0.5396231, 0.7733275, 0.5102834, 0.2666667, 0, 1, 1,
0.5400264, 0.371944, 0.8992177, 0.2705882, 0, 1, 1,
0.5443835, -0.6539459, 2.482205, 0.2784314, 0, 1, 1,
0.5485185, 0.560459, 0.4653325, 0.282353, 0, 1, 1,
0.5495344, -2.008257, 1.782387, 0.2901961, 0, 1, 1,
0.5577537, 2.251492, -0.3407325, 0.2941177, 0, 1, 1,
0.5598285, -1.403124, 3.614713, 0.3019608, 0, 1, 1,
0.5600851, 2.215884, -0.7494085, 0.3098039, 0, 1, 1,
0.5623472, 2.411371, 0.260215, 0.3137255, 0, 1, 1,
0.5630588, -1.165068, 4.09635, 0.3215686, 0, 1, 1,
0.5647828, -0.5818722, 1.324098, 0.3254902, 0, 1, 1,
0.5670491, -0.5031354, 2.060415, 0.3333333, 0, 1, 1,
0.5717973, -1.227413, 3.522447, 0.3372549, 0, 1, 1,
0.5778284, -0.7322367, 2.041218, 0.345098, 0, 1, 1,
0.5800092, -1.43707, 4.33639, 0.3490196, 0, 1, 1,
0.5834848, 1.025997, -0.4025585, 0.3568628, 0, 1, 1,
0.5855997, 0.9822246, 1.340673, 0.3607843, 0, 1, 1,
0.5943207, -0.736249, 3.580074, 0.3686275, 0, 1, 1,
0.5981016, 0.06728155, 2.32461, 0.372549, 0, 1, 1,
0.600027, 1.003574, -0.3077075, 0.3803922, 0, 1, 1,
0.6067677, -1.561823, 3.406027, 0.3843137, 0, 1, 1,
0.6109863, 1.227803, 1.439556, 0.3921569, 0, 1, 1,
0.6125873, -0.1809053, 1.403662, 0.3960784, 0, 1, 1,
0.6164016, 0.1145006, 2.863427, 0.4039216, 0, 1, 1,
0.6166352, -0.7077435, 2.275757, 0.4117647, 0, 1, 1,
0.6361452, -0.09594014, 0.8150244, 0.4156863, 0, 1, 1,
0.6369604, -1.053887, 1.871911, 0.4235294, 0, 1, 1,
0.6378263, -0.1170292, 2.562888, 0.427451, 0, 1, 1,
0.6409614, 1.117192, -0.3914183, 0.4352941, 0, 1, 1,
0.6411946, 0.8794106, 0.7303229, 0.4392157, 0, 1, 1,
0.6446947, 2.060152, 3.188767, 0.4470588, 0, 1, 1,
0.6548083, -1.404189, 2.253401, 0.4509804, 0, 1, 1,
0.6594076, 1.399253, 0.6794846, 0.4588235, 0, 1, 1,
0.6636044, -0.1065542, 1.86302, 0.4627451, 0, 1, 1,
0.665892, -0.06844469, 1.543856, 0.4705882, 0, 1, 1,
0.6660434, 0.2843621, 1.805233, 0.4745098, 0, 1, 1,
0.6727507, -1.098589, 2.866724, 0.4823529, 0, 1, 1,
0.674248, 1.428485, 0.8550171, 0.4862745, 0, 1, 1,
0.6742638, -0.02138419, -0.7396133, 0.4941176, 0, 1, 1,
0.6839498, -2.631098, 4.459706, 0.5019608, 0, 1, 1,
0.6847005, 0.9778613, -0.7800951, 0.5058824, 0, 1, 1,
0.6914411, -0.3037742, 1.969505, 0.5137255, 0, 1, 1,
0.6949542, 0.1985001, 1.045068, 0.5176471, 0, 1, 1,
0.6950292, 0.8660463, 1.109138, 0.5254902, 0, 1, 1,
0.6952473, -0.7763829, 4.344953, 0.5294118, 0, 1, 1,
0.6973228, -0.5738323, 2.947398, 0.5372549, 0, 1, 1,
0.6982054, 1.710901, 2.789623, 0.5411765, 0, 1, 1,
0.6986216, -0.05427982, -1.161935, 0.5490196, 0, 1, 1,
0.7018861, -0.08811763, 0.7241029, 0.5529412, 0, 1, 1,
0.7085261, -0.8170904, 1.787439, 0.5607843, 0, 1, 1,
0.7105445, 0.7553539, 1.602414, 0.5647059, 0, 1, 1,
0.7106956, 0.8570179, 1.397704, 0.572549, 0, 1, 1,
0.7113501, -1.985184, 4.512048, 0.5764706, 0, 1, 1,
0.7129273, 0.7897978, -0.4373796, 0.5843138, 0, 1, 1,
0.7157039, 0.797475, 0.5835859, 0.5882353, 0, 1, 1,
0.7194642, 1.346772, -0.3908076, 0.5960785, 0, 1, 1,
0.7201765, 1.753304, -0.2795414, 0.6039216, 0, 1, 1,
0.7221414, 0.3607796, 2.221248, 0.6078432, 0, 1, 1,
0.7279856, -1.500506, 0.7053484, 0.6156863, 0, 1, 1,
0.7331672, -0.9285638, 1.962476, 0.6196079, 0, 1, 1,
0.7353072, -1.789325, 3.640268, 0.627451, 0, 1, 1,
0.7368654, 0.3137638, 0.7519875, 0.6313726, 0, 1, 1,
0.7370644, 0.8506618, 1.692282, 0.6392157, 0, 1, 1,
0.7384123, -0.8525327, 1.665066, 0.6431373, 0, 1, 1,
0.7405671, 0.5051968, 0.880623, 0.6509804, 0, 1, 1,
0.7421521, -0.6783372, 2.246955, 0.654902, 0, 1, 1,
0.7484409, 0.3777707, 1.95967, 0.6627451, 0, 1, 1,
0.7562781, 1.777454, -0.1781718, 0.6666667, 0, 1, 1,
0.7569233, 0.9081961, 0.8624742, 0.6745098, 0, 1, 1,
0.759258, 1.748014, -0.427348, 0.6784314, 0, 1, 1,
0.7594605, -1.189496, 1.742045, 0.6862745, 0, 1, 1,
0.7626519, -0.3727241, 1.918474, 0.6901961, 0, 1, 1,
0.7629225, 0.2133818, 0.08920004, 0.6980392, 0, 1, 1,
0.7651429, 0.004135631, 2.800986, 0.7058824, 0, 1, 1,
0.7664033, -2.124079, 3.939172, 0.7098039, 0, 1, 1,
0.7683356, 0.3315789, 0.3610852, 0.7176471, 0, 1, 1,
0.7716994, -0.07502154, 3.413637, 0.7215686, 0, 1, 1,
0.7911682, -1.826538, 2.019166, 0.7294118, 0, 1, 1,
0.7958685, -0.4444135, 2.106633, 0.7333333, 0, 1, 1,
0.7981563, 0.6911475, 1.736559, 0.7411765, 0, 1, 1,
0.8078099, -1.460862, 3.125056, 0.7450981, 0, 1, 1,
0.8144712, 1.709513, 1.071949, 0.7529412, 0, 1, 1,
0.8182387, 1.109048, 1.094608, 0.7568628, 0, 1, 1,
0.8196303, -0.5418456, 1.736382, 0.7647059, 0, 1, 1,
0.8254828, 0.9721692, 1.142372, 0.7686275, 0, 1, 1,
0.8347495, 1.936722, 0.6683825, 0.7764706, 0, 1, 1,
0.8357376, 1.780405, 1.189676, 0.7803922, 0, 1, 1,
0.8449448, -0.6457441, 2.818202, 0.7882353, 0, 1, 1,
0.8461872, 0.8397226, 0.3137026, 0.7921569, 0, 1, 1,
0.8503388, 2.204425, 0.2051448, 0.8, 0, 1, 1,
0.8515637, 1.574851, 0.8754119, 0.8078431, 0, 1, 1,
0.8521872, 0.7491084, 0.6413039, 0.8117647, 0, 1, 1,
0.857788, 1.4443, 0.9329262, 0.8196079, 0, 1, 1,
0.8589773, 0.6616676, 0.8015221, 0.8235294, 0, 1, 1,
0.8618995, 1.113796, 1.417347, 0.8313726, 0, 1, 1,
0.8663001, -0.1266582, 1.604569, 0.8352941, 0, 1, 1,
0.8683594, -0.4058975, 3.353086, 0.8431373, 0, 1, 1,
0.8686439, 0.3776467, 2.701898, 0.8470588, 0, 1, 1,
0.8703918, 0.1679124, 1.677036, 0.854902, 0, 1, 1,
0.879232, -2.271467, 2.31912, 0.8588235, 0, 1, 1,
0.8837771, 0.02781761, 0.4705678, 0.8666667, 0, 1, 1,
0.8841016, 1.289932, -0.5028513, 0.8705882, 0, 1, 1,
0.8847256, 0.1522144, -0.3149444, 0.8784314, 0, 1, 1,
0.8883893, -0.9547229, 2.797536, 0.8823529, 0, 1, 1,
0.9043065, 0.8176849, 1.34703, 0.8901961, 0, 1, 1,
0.9064099, 0.6743325, 1.920516, 0.8941177, 0, 1, 1,
0.9072441, 0.3759086, 0.09736915, 0.9019608, 0, 1, 1,
0.9079502, 0.6618695, 1.238674, 0.9098039, 0, 1, 1,
0.9281983, -1.806067, 1.501162, 0.9137255, 0, 1, 1,
0.9383731, -0.7608176, 2.273816, 0.9215686, 0, 1, 1,
0.9412281, 0.2249817, 1.019459, 0.9254902, 0, 1, 1,
0.9427496, -0.2591974, 0.929763, 0.9333333, 0, 1, 1,
0.9442127, 0.504115, -0.4073597, 0.9372549, 0, 1, 1,
0.9496682, -0.5605534, 0.469574, 0.945098, 0, 1, 1,
0.9683211, -0.09681816, 2.696122, 0.9490196, 0, 1, 1,
0.9697555, -0.822496, 2.080079, 0.9568627, 0, 1, 1,
0.9828777, 0.565436, -0.230335, 0.9607843, 0, 1, 1,
0.9852363, -0.04219608, 2.410475, 0.9686275, 0, 1, 1,
0.9855645, 0.6069582, 2.098326, 0.972549, 0, 1, 1,
0.9878628, -1.023818, -0.4791176, 0.9803922, 0, 1, 1,
0.99406, 0.5328229, 0.07501276, 0.9843137, 0, 1, 1,
0.996, 0.08741252, 2.536165, 0.9921569, 0, 1, 1,
1.002102, 0.577169, 0.8028761, 0.9960784, 0, 1, 1,
1.003731, -0.9824645, 3.115526, 1, 0, 0.9960784, 1,
1.004829, -0.5602381, 1.158046, 1, 0, 0.9882353, 1,
1.004984, 0.5909434, 1.4203, 1, 0, 0.9843137, 1,
1.014581, 0.7006595, 1.431288, 1, 0, 0.9764706, 1,
1.018634, -0.3747339, 0.4422944, 1, 0, 0.972549, 1,
1.025565, 0.2280347, 0.6316605, 1, 0, 0.9647059, 1,
1.02619, 0.4249795, 0.9729553, 1, 0, 0.9607843, 1,
1.028054, -0.8815243, 1.773583, 1, 0, 0.9529412, 1,
1.033896, 0.2992415, 0.6695794, 1, 0, 0.9490196, 1,
1.037133, -0.6882641, 0.9119434, 1, 0, 0.9411765, 1,
1.04231, -0.09676754, 2.894282, 1, 0, 0.9372549, 1,
1.04285, 0.2322906, 0.2575749, 1, 0, 0.9294118, 1,
1.055418, 0.06512781, 1.705856, 1, 0, 0.9254902, 1,
1.056201, -1.051133, 2.753394, 1, 0, 0.9176471, 1,
1.058542, 0.7792017, -0.2063817, 1, 0, 0.9137255, 1,
1.062684, 0.5772916, -0.2303636, 1, 0, 0.9058824, 1,
1.066334, 0.4839174, 3.442257, 1, 0, 0.9019608, 1,
1.072952, -1.616463, 2.404063, 1, 0, 0.8941177, 1,
1.074279, 0.1372593, 3.043345, 1, 0, 0.8862745, 1,
1.08261, -1.870331, 0.7695487, 1, 0, 0.8823529, 1,
1.082927, 0.2465656, 1.475319, 1, 0, 0.8745098, 1,
1.0877, -1.275166, 2.480475, 1, 0, 0.8705882, 1,
1.089498, -0.01208874, 2.944831, 1, 0, 0.8627451, 1,
1.100041, 0.07141487, 1.003079, 1, 0, 0.8588235, 1,
1.103378, -0.3099178, 1.510753, 1, 0, 0.8509804, 1,
1.111037, -0.1966206, 1.642243, 1, 0, 0.8470588, 1,
1.120773, 0.5994978, 0.7225672, 1, 0, 0.8392157, 1,
1.139744, -0.04935649, 2.155657, 1, 0, 0.8352941, 1,
1.143082, -0.2569877, 1.621141, 1, 0, 0.827451, 1,
1.150159, -1.613566, 3.627881, 1, 0, 0.8235294, 1,
1.155, -1.193147, 2.550535, 1, 0, 0.8156863, 1,
1.157311, -1.27127, 2.043066, 1, 0, 0.8117647, 1,
1.160011, -0.368381, 4.195256, 1, 0, 0.8039216, 1,
1.172495, -0.5442734, 0.661103, 1, 0, 0.7960784, 1,
1.176363, -0.9647679, 4.609655, 1, 0, 0.7921569, 1,
1.177345, -0.6541789, -0.4519024, 1, 0, 0.7843137, 1,
1.184178, -0.7425464, 0.8549344, 1, 0, 0.7803922, 1,
1.187694, 1.551189, 2.385757, 1, 0, 0.772549, 1,
1.190093, 0.009708622, 1.409628, 1, 0, 0.7686275, 1,
1.204787, 0.6258461, 0.9840001, 1, 0, 0.7607843, 1,
1.207549, -0.8143557, -0.2365595, 1, 0, 0.7568628, 1,
1.214113, 0.09921197, 2.662278, 1, 0, 0.7490196, 1,
1.215052, 0.7249689, 1.634679, 1, 0, 0.7450981, 1,
1.218716, -0.448755, 1.843855, 1, 0, 0.7372549, 1,
1.222439, -0.3420091, 3.783338, 1, 0, 0.7333333, 1,
1.222616, 0.5719427, 0.7468303, 1, 0, 0.7254902, 1,
1.223337, 0.6778125, 1.499182, 1, 0, 0.7215686, 1,
1.223539, 2.190709, 0.5410956, 1, 0, 0.7137255, 1,
1.233162, 1.116001, -0.9529896, 1, 0, 0.7098039, 1,
1.233524, -0.0637371, 2.029983, 1, 0, 0.7019608, 1,
1.235748, 1.087576, 1.447911, 1, 0, 0.6941177, 1,
1.236996, -1.022607, 2.494061, 1, 0, 0.6901961, 1,
1.237799, 0.5723805, 0.6590905, 1, 0, 0.682353, 1,
1.240008, 0.6154013, 0.599334, 1, 0, 0.6784314, 1,
1.242378, 0.4396053, 0.6966981, 1, 0, 0.6705883, 1,
1.245219, -1.571421, 1.393666, 1, 0, 0.6666667, 1,
1.252491, 0.1406838, 2.403887, 1, 0, 0.6588235, 1,
1.255568, -0.04150286, 1.708246, 1, 0, 0.654902, 1,
1.256762, 0.2734117, 2.745173, 1, 0, 0.6470588, 1,
1.257488, -0.2541453, 1.53329, 1, 0, 0.6431373, 1,
1.258275, -0.5942018, 1.986307, 1, 0, 0.6352941, 1,
1.272718, 0.04163709, 1.113147, 1, 0, 0.6313726, 1,
1.274578, 1.112952, -0.0890526, 1, 0, 0.6235294, 1,
1.281614, 0.6261299, 0.9604841, 1, 0, 0.6196079, 1,
1.285863, 0.5960831, 2.925553, 1, 0, 0.6117647, 1,
1.286241, 1.240241, 1.117058, 1, 0, 0.6078432, 1,
1.290492, 0.09377776, 2.456848, 1, 0, 0.6, 1,
1.30785, 0.6798786, 0.7748616, 1, 0, 0.5921569, 1,
1.308375, 3.143702, 2.149148, 1, 0, 0.5882353, 1,
1.310808, -0.1850291, 1.288427, 1, 0, 0.5803922, 1,
1.316766, -1.852776, 3.726763, 1, 0, 0.5764706, 1,
1.324853, -0.7878383, 2.94943, 1, 0, 0.5686275, 1,
1.326361, -0.03263237, 1.422096, 1, 0, 0.5647059, 1,
1.336478, 0.9502226, 2.596798, 1, 0, 0.5568628, 1,
1.339091, -0.5591562, 2.674699, 1, 0, 0.5529412, 1,
1.344007, -0.318784, 0.8725278, 1, 0, 0.5450981, 1,
1.350013, -2.267616, 3.644013, 1, 0, 0.5411765, 1,
1.352282, -2.679431, 4.051128, 1, 0, 0.5333334, 1,
1.358668, 0.3477147, 2.198788, 1, 0, 0.5294118, 1,
1.366849, -0.3587687, 2.962845, 1, 0, 0.5215687, 1,
1.372345, 0.388513, 0.7287694, 1, 0, 0.5176471, 1,
1.373626, -0.1854098, 1.613264, 1, 0, 0.509804, 1,
1.378444, 1.073607, 1.280467, 1, 0, 0.5058824, 1,
1.385079, -1.128287, -0.1642988, 1, 0, 0.4980392, 1,
1.398252, -0.9896438, 3.631824, 1, 0, 0.4901961, 1,
1.402239, -0.9535357, 3.077225, 1, 0, 0.4862745, 1,
1.402897, 0.339598, 1.090211, 1, 0, 0.4784314, 1,
1.409556, 0.2926309, 2.468645, 1, 0, 0.4745098, 1,
1.409982, 0.225691, -0.6412375, 1, 0, 0.4666667, 1,
1.413229, 3.158916, 0.6365312, 1, 0, 0.4627451, 1,
1.414131, -1.31144, 4.201996, 1, 0, 0.454902, 1,
1.421584, 0.5799394, 0.1826388, 1, 0, 0.4509804, 1,
1.423287, -0.1144338, 2.419454, 1, 0, 0.4431373, 1,
1.427015, 0.5958899, 0.9712157, 1, 0, 0.4392157, 1,
1.434927, 1.3336, -2.075382, 1, 0, 0.4313726, 1,
1.464686, -0.008635972, 2.246621, 1, 0, 0.427451, 1,
1.478625, -0.3804002, 2.191396, 1, 0, 0.4196078, 1,
1.479656, 1.044097, 2.636098, 1, 0, 0.4156863, 1,
1.487518, 1.467148, 0.9573091, 1, 0, 0.4078431, 1,
1.505046, -1.630678, 1.001048, 1, 0, 0.4039216, 1,
1.51819, 0.6547855, 0.7501375, 1, 0, 0.3960784, 1,
1.52104, 0.9118016, 0.6963644, 1, 0, 0.3882353, 1,
1.53024, 0.7178719, 1.023322, 1, 0, 0.3843137, 1,
1.566931, 0.3904228, 0.4600277, 1, 0, 0.3764706, 1,
1.576198, 0.4207945, 1.18087, 1, 0, 0.372549, 1,
1.57663, -1.151783, 1.640497, 1, 0, 0.3647059, 1,
1.577654, 1.430778, 1.646517, 1, 0, 0.3607843, 1,
1.599549, -0.7873189, 0.31758, 1, 0, 0.3529412, 1,
1.605116, -0.2615656, 0.0714547, 1, 0, 0.3490196, 1,
1.620776, -0.9074489, 3.198163, 1, 0, 0.3411765, 1,
1.623109, -0.871189, 2.041967, 1, 0, 0.3372549, 1,
1.630361, -0.1532502, 0.6415057, 1, 0, 0.3294118, 1,
1.639418, 0.5231675, 0.8199546, 1, 0, 0.3254902, 1,
1.641164, 0.1388384, 1.827629, 1, 0, 0.3176471, 1,
1.655475, -0.3814604, 0.972166, 1, 0, 0.3137255, 1,
1.659008, 0.1867553, 2.654803, 1, 0, 0.3058824, 1,
1.659385, 0.3393228, 1.30687, 1, 0, 0.2980392, 1,
1.695736, 0.7185633, -0.6843053, 1, 0, 0.2941177, 1,
1.706759, -0.2008318, 2.04108, 1, 0, 0.2862745, 1,
1.70897, 0.2963548, 2.620718, 1, 0, 0.282353, 1,
1.710838, 1.327153, 0.4739677, 1, 0, 0.2745098, 1,
1.717154, -0.4998003, 2.237156, 1, 0, 0.2705882, 1,
1.72171, -0.1264711, 1.681792, 1, 0, 0.2627451, 1,
1.724732, -0.5092571, 1.957306, 1, 0, 0.2588235, 1,
1.770938, 0.3724513, -0.0432994, 1, 0, 0.2509804, 1,
1.782861, 0.109969, 0.6670349, 1, 0, 0.2470588, 1,
1.829906, -0.4321418, -0.0945805, 1, 0, 0.2392157, 1,
1.832315, 0.8611482, 0.3398838, 1, 0, 0.2352941, 1,
1.839341, 2.542207, 1.683808, 1, 0, 0.227451, 1,
1.893569, 1.441062, 0.4593767, 1, 0, 0.2235294, 1,
1.897249, 0.6648508, 0.7952202, 1, 0, 0.2156863, 1,
1.91193, -0.03622259, 2.778576, 1, 0, 0.2117647, 1,
1.91501, -0.02065975, 0.9587168, 1, 0, 0.2039216, 1,
1.93605, 0.4815826, 0.5797065, 1, 0, 0.1960784, 1,
1.942737, 0.6059909, 0.05310399, 1, 0, 0.1921569, 1,
1.951503, 0.04838932, 1.48631, 1, 0, 0.1843137, 1,
1.961556, -0.1388001, 1.073605, 1, 0, 0.1803922, 1,
1.968544, -0.3053539, 3.454245, 1, 0, 0.172549, 1,
1.990189, 0.3245693, 2.116389, 1, 0, 0.1686275, 1,
1.991855, 0.5070889, 2.160593, 1, 0, 0.1607843, 1,
2.018492, -0.78333, 2.036508, 1, 0, 0.1568628, 1,
2.061839, -0.5991092, -0.1332165, 1, 0, 0.1490196, 1,
2.076981, -0.3492337, 1.633186, 1, 0, 0.145098, 1,
2.080904, 1.915268, 0.04791472, 1, 0, 0.1372549, 1,
2.14719, 1.253928, 0.61015, 1, 0, 0.1333333, 1,
2.150637, -1.482102, 5.657576, 1, 0, 0.1254902, 1,
2.160509, -0.9142102, 0.724937, 1, 0, 0.1215686, 1,
2.180943, -1.173303, 2.500338, 1, 0, 0.1137255, 1,
2.191724, 0.02024739, -0.4689966, 1, 0, 0.1098039, 1,
2.231092, 1.752583, 3.373682, 1, 0, 0.1019608, 1,
2.244683, 0.7234246, 0.881662, 1, 0, 0.09411765, 1,
2.255149, 0.6822127, 1.772404, 1, 0, 0.09019608, 1,
2.30397, 1.747021, -0.3443375, 1, 0, 0.08235294, 1,
2.327976, 1.110268, 1.40114, 1, 0, 0.07843138, 1,
2.334559, -0.2865801, 0.9463636, 1, 0, 0.07058824, 1,
2.501251, -1.266879, 2.523278, 1, 0, 0.06666667, 1,
2.50288, 0.6029558, 0.7091873, 1, 0, 0.05882353, 1,
2.578779, 0.8279969, 0.887697, 1, 0, 0.05490196, 1,
2.598793, -1.598176, 1.640242, 1, 0, 0.04705882, 1,
2.603674, -1.018005, 3.496567, 1, 0, 0.04313726, 1,
2.606733, -0.3394477, 1.430582, 1, 0, 0.03529412, 1,
2.644797, -1.23224, 3.583298, 1, 0, 0.03137255, 1,
2.6475, -0.07762811, -1.039365, 1, 0, 0.02352941, 1,
2.812033, 0.3629334, 1.329843, 1, 0, 0.01960784, 1,
2.815519, 1.620041, 1.540294, 1, 0, 0.01176471, 1,
3.023487, -1.956689, 2.118261, 1, 0, 0.007843138, 1
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
-0.1421746, -4.473898, -7.937131, 0, -0.5, 0.5, 0.5,
-0.1421746, -4.473898, -7.937131, 1, -0.5, 0.5, 0.5,
-0.1421746, -4.473898, -7.937131, 1, 1.5, 0.5, 0.5,
-0.1421746, -4.473898, -7.937131, 0, 1.5, 0.5, 0.5
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
-4.380996, -0.1043649, -7.937131, 0, -0.5, 0.5, 0.5,
-4.380996, -0.1043649, -7.937131, 1, -0.5, 0.5, 0.5,
-4.380996, -0.1043649, -7.937131, 1, 1.5, 0.5, 0.5,
-4.380996, -0.1043649, -7.937131, 0, 1.5, 0.5, 0.5
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
-4.380996, -4.473898, -0.1546121, 0, -0.5, 0.5, 0.5,
-4.380996, -4.473898, -0.1546121, 1, -0.5, 0.5, 0.5,
-4.380996, -4.473898, -0.1546121, 1, 1.5, 0.5, 0.5,
-4.380996, -4.473898, -0.1546121, 0, 1.5, 0.5, 0.5
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
-3, -3.465544, -6.141165,
3, -3.465544, -6.141165,
-3, -3.465544, -6.141165,
-3, -3.633603, -6.440493,
-2, -3.465544, -6.141165,
-2, -3.633603, -6.440493,
-1, -3.465544, -6.141165,
-1, -3.633603, -6.440493,
0, -3.465544, -6.141165,
0, -3.633603, -6.440493,
1, -3.465544, -6.141165,
1, -3.633603, -6.440493,
2, -3.465544, -6.141165,
2, -3.633603, -6.440493,
3, -3.465544, -6.141165,
3, -3.633603, -6.440493
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
-3, -3.969721, -7.039148, 0, -0.5, 0.5, 0.5,
-3, -3.969721, -7.039148, 1, -0.5, 0.5, 0.5,
-3, -3.969721, -7.039148, 1, 1.5, 0.5, 0.5,
-3, -3.969721, -7.039148, 0, 1.5, 0.5, 0.5,
-2, -3.969721, -7.039148, 0, -0.5, 0.5, 0.5,
-2, -3.969721, -7.039148, 1, -0.5, 0.5, 0.5,
-2, -3.969721, -7.039148, 1, 1.5, 0.5, 0.5,
-2, -3.969721, -7.039148, 0, 1.5, 0.5, 0.5,
-1, -3.969721, -7.039148, 0, -0.5, 0.5, 0.5,
-1, -3.969721, -7.039148, 1, -0.5, 0.5, 0.5,
-1, -3.969721, -7.039148, 1, 1.5, 0.5, 0.5,
-1, -3.969721, -7.039148, 0, 1.5, 0.5, 0.5,
0, -3.969721, -7.039148, 0, -0.5, 0.5, 0.5,
0, -3.969721, -7.039148, 1, -0.5, 0.5, 0.5,
0, -3.969721, -7.039148, 1, 1.5, 0.5, 0.5,
0, -3.969721, -7.039148, 0, 1.5, 0.5, 0.5,
1, -3.969721, -7.039148, 0, -0.5, 0.5, 0.5,
1, -3.969721, -7.039148, 1, -0.5, 0.5, 0.5,
1, -3.969721, -7.039148, 1, 1.5, 0.5, 0.5,
1, -3.969721, -7.039148, 0, 1.5, 0.5, 0.5,
2, -3.969721, -7.039148, 0, -0.5, 0.5, 0.5,
2, -3.969721, -7.039148, 1, -0.5, 0.5, 0.5,
2, -3.969721, -7.039148, 1, 1.5, 0.5, 0.5,
2, -3.969721, -7.039148, 0, 1.5, 0.5, 0.5,
3, -3.969721, -7.039148, 0, -0.5, 0.5, 0.5,
3, -3.969721, -7.039148, 1, -0.5, 0.5, 0.5,
3, -3.969721, -7.039148, 1, 1.5, 0.5, 0.5,
3, -3.969721, -7.039148, 0, 1.5, 0.5, 0.5
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
-3.402806, -3, -6.141165,
-3.402806, 3, -6.141165,
-3.402806, -3, -6.141165,
-3.565838, -3, -6.440493,
-3.402806, -2, -6.141165,
-3.565838, -2, -6.440493,
-3.402806, -1, -6.141165,
-3.565838, -1, -6.440493,
-3.402806, 0, -6.141165,
-3.565838, 0, -6.440493,
-3.402806, 1, -6.141165,
-3.565838, 1, -6.440493,
-3.402806, 2, -6.141165,
-3.565838, 2, -6.440493,
-3.402806, 3, -6.141165,
-3.565838, 3, -6.440493
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
-3.891901, -3, -7.039148, 0, -0.5, 0.5, 0.5,
-3.891901, -3, -7.039148, 1, -0.5, 0.5, 0.5,
-3.891901, -3, -7.039148, 1, 1.5, 0.5, 0.5,
-3.891901, -3, -7.039148, 0, 1.5, 0.5, 0.5,
-3.891901, -2, -7.039148, 0, -0.5, 0.5, 0.5,
-3.891901, -2, -7.039148, 1, -0.5, 0.5, 0.5,
-3.891901, -2, -7.039148, 1, 1.5, 0.5, 0.5,
-3.891901, -2, -7.039148, 0, 1.5, 0.5, 0.5,
-3.891901, -1, -7.039148, 0, -0.5, 0.5, 0.5,
-3.891901, -1, -7.039148, 1, -0.5, 0.5, 0.5,
-3.891901, -1, -7.039148, 1, 1.5, 0.5, 0.5,
-3.891901, -1, -7.039148, 0, 1.5, 0.5, 0.5,
-3.891901, 0, -7.039148, 0, -0.5, 0.5, 0.5,
-3.891901, 0, -7.039148, 1, -0.5, 0.5, 0.5,
-3.891901, 0, -7.039148, 1, 1.5, 0.5, 0.5,
-3.891901, 0, -7.039148, 0, 1.5, 0.5, 0.5,
-3.891901, 1, -7.039148, 0, -0.5, 0.5, 0.5,
-3.891901, 1, -7.039148, 1, -0.5, 0.5, 0.5,
-3.891901, 1, -7.039148, 1, 1.5, 0.5, 0.5,
-3.891901, 1, -7.039148, 0, 1.5, 0.5, 0.5,
-3.891901, 2, -7.039148, 0, -0.5, 0.5, 0.5,
-3.891901, 2, -7.039148, 1, -0.5, 0.5, 0.5,
-3.891901, 2, -7.039148, 1, 1.5, 0.5, 0.5,
-3.891901, 2, -7.039148, 0, 1.5, 0.5, 0.5,
-3.891901, 3, -7.039148, 0, -0.5, 0.5, 0.5,
-3.891901, 3, -7.039148, 1, -0.5, 0.5, 0.5,
-3.891901, 3, -7.039148, 1, 1.5, 0.5, 0.5,
-3.891901, 3, -7.039148, 0, 1.5, 0.5, 0.5
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
-3.402806, -3.465544, -4,
-3.402806, -3.465544, 4,
-3.402806, -3.465544, -4,
-3.565838, -3.633603, -4,
-3.402806, -3.465544, -2,
-3.565838, -3.633603, -2,
-3.402806, -3.465544, 0,
-3.565838, -3.633603, 0,
-3.402806, -3.465544, 2,
-3.565838, -3.633603, 2,
-3.402806, -3.465544, 4,
-3.565838, -3.633603, 4
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
-3.891901, -3.969721, -4, 0, -0.5, 0.5, 0.5,
-3.891901, -3.969721, -4, 1, -0.5, 0.5, 0.5,
-3.891901, -3.969721, -4, 1, 1.5, 0.5, 0.5,
-3.891901, -3.969721, -4, 0, 1.5, 0.5, 0.5,
-3.891901, -3.969721, -2, 0, -0.5, 0.5, 0.5,
-3.891901, -3.969721, -2, 1, -0.5, 0.5, 0.5,
-3.891901, -3.969721, -2, 1, 1.5, 0.5, 0.5,
-3.891901, -3.969721, -2, 0, 1.5, 0.5, 0.5,
-3.891901, -3.969721, 0, 0, -0.5, 0.5, 0.5,
-3.891901, -3.969721, 0, 1, -0.5, 0.5, 0.5,
-3.891901, -3.969721, 0, 1, 1.5, 0.5, 0.5,
-3.891901, -3.969721, 0, 0, 1.5, 0.5, 0.5,
-3.891901, -3.969721, 2, 0, -0.5, 0.5, 0.5,
-3.891901, -3.969721, 2, 1, -0.5, 0.5, 0.5,
-3.891901, -3.969721, 2, 1, 1.5, 0.5, 0.5,
-3.891901, -3.969721, 2, 0, 1.5, 0.5, 0.5,
-3.891901, -3.969721, 4, 0, -0.5, 0.5, 0.5,
-3.891901, -3.969721, 4, 1, -0.5, 0.5, 0.5,
-3.891901, -3.969721, 4, 1, 1.5, 0.5, 0.5,
-3.891901, -3.969721, 4, 0, 1.5, 0.5, 0.5
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
-3.402806, -3.465544, -6.141165,
-3.402806, 3.256815, -6.141165,
-3.402806, -3.465544, 5.831941,
-3.402806, 3.256815, 5.831941,
-3.402806, -3.465544, -6.141165,
-3.402806, -3.465544, 5.831941,
-3.402806, 3.256815, -6.141165,
-3.402806, 3.256815, 5.831941,
-3.402806, -3.465544, -6.141165,
3.118457, -3.465544, -6.141165,
-3.402806, -3.465544, 5.831941,
3.118457, -3.465544, 5.831941,
-3.402806, 3.256815, -6.141165,
3.118457, 3.256815, -6.141165,
-3.402806, 3.256815, 5.831941,
3.118457, 3.256815, 5.831941,
3.118457, -3.465544, -6.141165,
3.118457, 3.256815, -6.141165,
3.118457, -3.465544, 5.831941,
3.118457, 3.256815, 5.831941,
3.118457, -3.465544, -6.141165,
3.118457, -3.465544, 5.831941,
3.118457, 3.256815, -6.141165,
3.118457, 3.256815, 5.831941
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
var radius = 8.117072;
var distance = 36.11377;
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
mvMatrix.translate( 0.1421746, 0.1043649, 0.1546121 );
mvMatrix.scale( 1.345803, 1.305544, 0.7330042 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.11377);
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
terbumeton<-read.table("terbumeton.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-terbumeton$V2
```

```
## Error in eval(expr, envir, enclos): object 'terbumeton' not found
```

```r
y<-terbumeton$V3
```

```
## Error in eval(expr, envir, enclos): object 'terbumeton' not found
```

```r
z<-terbumeton$V4
```

```
## Error in eval(expr, envir, enclos): object 'terbumeton' not found
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
-3.307836, 0.206745, -2.279004, 0, 0, 1, 1, 1,
-3.210051, -0.1050592, -0.8897474, 1, 0, 0, 1, 1,
-2.881994, -1.049031, -2.117419, 1, 0, 0, 1, 1,
-2.613742, -0.03957266, -0.8266477, 1, 0, 0, 1, 1,
-2.565028, -0.5915537, -1.672776, 1, 0, 0, 1, 1,
-2.563383, 0.3237699, -0.8736806, 1, 0, 0, 1, 1,
-2.532047, -0.1210409, -3.131381, 0, 0, 0, 1, 1,
-2.522056, -0.8831283, -2.846587, 0, 0, 0, 1, 1,
-2.48259, -1.136898, -1.927827, 0, 0, 0, 1, 1,
-2.407449, 0.1151715, -0.5818996, 0, 0, 0, 1, 1,
-2.326859, -0.3686665, -0.80092, 0, 0, 0, 1, 1,
-2.261055, 0.9737386, -0.4949996, 0, 0, 0, 1, 1,
-2.222556, 0.3847116, -1.533957, 0, 0, 0, 1, 1,
-2.218565, -1.450963, -3.619273, 1, 1, 1, 1, 1,
-2.202437, 2.484501, -0.1070556, 1, 1, 1, 1, 1,
-2.192787, 0.1965097, -3.39391, 1, 1, 1, 1, 1,
-2.143643, 0.534394, -0.1530216, 1, 1, 1, 1, 1,
-2.056981, 0.5372861, -1.515072, 1, 1, 1, 1, 1,
-2.056359, -0.7199251, -2.509966, 1, 1, 1, 1, 1,
-2.028897, 0.6467977, -0.04160399, 1, 1, 1, 1, 1,
-1.994204, 0.439285, -2.3798, 1, 1, 1, 1, 1,
-1.991343, -0.8436747, -1.501631, 1, 1, 1, 1, 1,
-1.990119, -0.8250043, -2.606679, 1, 1, 1, 1, 1,
-1.961628, 0.7341496, -1.520176, 1, 1, 1, 1, 1,
-1.948176, 0.8556051, 0.4587775, 1, 1, 1, 1, 1,
-1.939004, -1.358892, -2.351533, 1, 1, 1, 1, 1,
-1.933348, 1.12741, 0.9674093, 1, 1, 1, 1, 1,
-1.897728, -0.1768554, -2.543541, 1, 1, 1, 1, 1,
-1.886984, -1.910049, -2.906727, 0, 0, 1, 1, 1,
-1.839632, -0.5549718, -0.8579396, 1, 0, 0, 1, 1,
-1.811957, -1.357022, -3.174577, 1, 0, 0, 1, 1,
-1.805299, 0.8229351, -0.9231908, 1, 0, 0, 1, 1,
-1.798314, -0.3811429, -2.791092, 1, 0, 0, 1, 1,
-1.773806, 0.6445069, -0.1160381, 1, 0, 0, 1, 1,
-1.767693, -1.257416, -1.353099, 0, 0, 0, 1, 1,
-1.734148, -0.102216, -1.936157, 0, 0, 0, 1, 1,
-1.733062, 1.354952, -0.9479343, 0, 0, 0, 1, 1,
-1.729907, 0.8197846, -1.218664, 0, 0, 0, 1, 1,
-1.724403, 0.7189323, -1.878936, 0, 0, 0, 1, 1,
-1.700623, -0.1901889, -1.309277, 0, 0, 0, 1, 1,
-1.689244, 1.468844, -1.423341, 0, 0, 0, 1, 1,
-1.678253, 1.739068, -3.217139, 1, 1, 1, 1, 1,
-1.670517, 0.09740517, -0.9808768, 1, 1, 1, 1, 1,
-1.667879, -0.9071415, -1.76577, 1, 1, 1, 1, 1,
-1.655319, -0.910408, -0.4773043, 1, 1, 1, 1, 1,
-1.646688, 1.436904, 1.613344, 1, 1, 1, 1, 1,
-1.641331, -0.4439071, -1.618803, 1, 1, 1, 1, 1,
-1.634621, -1.659699, -1.586824, 1, 1, 1, 1, 1,
-1.632007, 1.26944, -0.9289514, 1, 1, 1, 1, 1,
-1.620953, -1.801843, -0.5060212, 1, 1, 1, 1, 1,
-1.615074, 1.293979, -1.510204, 1, 1, 1, 1, 1,
-1.610995, 0.1027061, -0.3749458, 1, 1, 1, 1, 1,
-1.588, -1.238799, -2.674082, 1, 1, 1, 1, 1,
-1.576932, -1.150669, -2.610944, 1, 1, 1, 1, 1,
-1.562546, -0.6506002, -2.046446, 1, 1, 1, 1, 1,
-1.556208, 0.8812515, -1.568014, 1, 1, 1, 1, 1,
-1.54652, -0.002951005, -0.6316408, 0, 0, 1, 1, 1,
-1.543801, -0.8184983, -0.6149649, 1, 0, 0, 1, 1,
-1.542649, 1.315732, -1.306623, 1, 0, 0, 1, 1,
-1.535212, 0.9664814, -1.486661, 1, 0, 0, 1, 1,
-1.528323, 1.269672, -1.041615, 1, 0, 0, 1, 1,
-1.525899, -1.849194, -4.293479, 1, 0, 0, 1, 1,
-1.520944, -0.5368366, -0.9987642, 0, 0, 0, 1, 1,
-1.512902, -1.691803, -1.023821, 0, 0, 0, 1, 1,
-1.508932, -0.8838563, -1.441022, 0, 0, 0, 1, 1,
-1.506427, 0.8218336, -3.047446, 0, 0, 0, 1, 1,
-1.500598, 2.647428, -0.668268, 0, 0, 0, 1, 1,
-1.494651, -0.9784036, -1.31302, 0, 0, 0, 1, 1,
-1.490209, -1.146527, -0.5210268, 0, 0, 0, 1, 1,
-1.485431, -1.756994, -1.118367, 1, 1, 1, 1, 1,
-1.476208, -0.04771971, -2.160453, 1, 1, 1, 1, 1,
-1.466213, -1.228722, -3.332952, 1, 1, 1, 1, 1,
-1.451147, -1.062553, -0.8104709, 1, 1, 1, 1, 1,
-1.447332, -0.3765281, -1.743532, 1, 1, 1, 1, 1,
-1.444898, 0.7054427, -0.4758026, 1, 1, 1, 1, 1,
-1.441828, -0.1675846, -2.420278, 1, 1, 1, 1, 1,
-1.438613, 0.1249018, -0.7281575, 1, 1, 1, 1, 1,
-1.433531, 1.450217, -0.4572043, 1, 1, 1, 1, 1,
-1.433102, 1.109922, -0.7815909, 1, 1, 1, 1, 1,
-1.430855, 0.8515388, 0.9309881, 1, 1, 1, 1, 1,
-1.427867, -0.6966976, -1.988344, 1, 1, 1, 1, 1,
-1.423982, 0.06170435, -2.527404, 1, 1, 1, 1, 1,
-1.422606, 0.0194765, -2.361833, 1, 1, 1, 1, 1,
-1.421374, -0.1868127, -2.586194, 1, 1, 1, 1, 1,
-1.420737, 1.844066, -1.201417, 0, 0, 1, 1, 1,
-1.413646, 1.527139, -1.261725, 1, 0, 0, 1, 1,
-1.389139, -1.095291, -1.819492, 1, 0, 0, 1, 1,
-1.388818, -0.1029243, -1.896366, 1, 0, 0, 1, 1,
-1.383069, -0.9212803, -3.255087, 1, 0, 0, 1, 1,
-1.378137, -0.01226551, -1.647731, 1, 0, 0, 1, 1,
-1.371431, 0.04218554, -0.4332965, 0, 0, 0, 1, 1,
-1.370246, -1.382126, -3.507578, 0, 0, 0, 1, 1,
-1.363707, 0.1791688, -1.743885, 0, 0, 0, 1, 1,
-1.36318, -0.2334738, -1.322029, 0, 0, 0, 1, 1,
-1.361783, -0.06557602, -1.69672, 0, 0, 0, 1, 1,
-1.359948, -0.3336604, -2.00772, 0, 0, 0, 1, 1,
-1.357166, -0.932548, -1.28559, 0, 0, 0, 1, 1,
-1.352929, 1.236357, -1.563418, 1, 1, 1, 1, 1,
-1.332497, 0.669724, -1.665386, 1, 1, 1, 1, 1,
-1.331831, -1.293692, -2.629625, 1, 1, 1, 1, 1,
-1.329264, 1.367852, -2.300457, 1, 1, 1, 1, 1,
-1.3263, 0.2865579, -0.66957, 1, 1, 1, 1, 1,
-1.321183, -1.050367, -0.6807832, 1, 1, 1, 1, 1,
-1.320642, 1.200845, 0.2886317, 1, 1, 1, 1, 1,
-1.31739, 0.6794782, -0.7711795, 1, 1, 1, 1, 1,
-1.315531, -1.946389, -3.432035, 1, 1, 1, 1, 1,
-1.306153, 0.7661912, 0.0496918, 1, 1, 1, 1, 1,
-1.301095, -1.212524, -2.575066, 1, 1, 1, 1, 1,
-1.296617, -0.221355, -1.941429, 1, 1, 1, 1, 1,
-1.296141, -1.22311, -2.516724, 1, 1, 1, 1, 1,
-1.28759, -0.1502866, -1.82135, 1, 1, 1, 1, 1,
-1.279862, -0.8941734, -1.451495, 1, 1, 1, 1, 1,
-1.278649, -0.1827749, 0.3078248, 0, 0, 1, 1, 1,
-1.276244, -0.9497592, -2.83636, 1, 0, 0, 1, 1,
-1.274149, 0.2833069, -0.8311245, 1, 0, 0, 1, 1,
-1.269472, 2.00823, -0.8594282, 1, 0, 0, 1, 1,
-1.268346, -0.3396282, -1.863608, 1, 0, 0, 1, 1,
-1.267448, 0.6851075, -1.125429, 1, 0, 0, 1, 1,
-1.259976, 1.601914, -2.469246, 0, 0, 0, 1, 1,
-1.255013, 1.047317, 1.065777, 0, 0, 0, 1, 1,
-1.251738, -0.1142902, -1.849453, 0, 0, 0, 1, 1,
-1.248669, 1.032358, 0.2002396, 0, 0, 0, 1, 1,
-1.233667, -1.566195, -3.111804, 0, 0, 0, 1, 1,
-1.221718, -0.7705295, -2.2471, 0, 0, 0, 1, 1,
-1.209526, 0.635137, -2.244832, 0, 0, 0, 1, 1,
-1.200212, 1.249463, -1.549343, 1, 1, 1, 1, 1,
-1.196363, 0.6599922, -1.752719, 1, 1, 1, 1, 1,
-1.190823, 0.3964543, -1.474934, 1, 1, 1, 1, 1,
-1.187625, 0.606762, -1.973719, 1, 1, 1, 1, 1,
-1.184418, 0.8386872, -2.241234, 1, 1, 1, 1, 1,
-1.182431, -2.215023, -1.834527, 1, 1, 1, 1, 1,
-1.150358, 0.3829338, -2.099746, 1, 1, 1, 1, 1,
-1.148703, -0.9902983, -2.158516, 1, 1, 1, 1, 1,
-1.148597, -0.08591472, 0.05513552, 1, 1, 1, 1, 1,
-1.146703, 1.641017, 1.04029, 1, 1, 1, 1, 1,
-1.138682, 0.2397201, -1.535491, 1, 1, 1, 1, 1,
-1.137656, -1.404193, -3.255903, 1, 1, 1, 1, 1,
-1.133894, -0.4928933, -3.972693, 1, 1, 1, 1, 1,
-1.131872, -0.01793937, -0.4655198, 1, 1, 1, 1, 1,
-1.124959, -1.243277, -3.552156, 1, 1, 1, 1, 1,
-1.121618, -0.118885, -2.785161, 0, 0, 1, 1, 1,
-1.119115, -1.37807, -2.138099, 1, 0, 0, 1, 1,
-1.107563, -0.4266019, -1.188465, 1, 0, 0, 1, 1,
-1.106339, 0.3200692, -0.7473939, 1, 0, 0, 1, 1,
-1.105353, -1.189217, -3.730923, 1, 0, 0, 1, 1,
-1.094965, 0.1320917, -2.433122, 1, 0, 0, 1, 1,
-1.088538, 0.4034118, -0.7249746, 0, 0, 0, 1, 1,
-1.08741, 0.2528062, -0.7599522, 0, 0, 0, 1, 1,
-1.074394, 0.04910089, -2.139911, 0, 0, 0, 1, 1,
-1.071682, 0.7480264, -1.448235, 0, 0, 0, 1, 1,
-1.070529, -0.5957615, -1.525981, 0, 0, 0, 1, 1,
-1.068833, -0.07132564, -0.4218019, 0, 0, 0, 1, 1,
-1.068669, -1.55204, -2.966673, 0, 0, 0, 1, 1,
-1.059975, 0.1127864, -0.9413674, 1, 1, 1, 1, 1,
-1.059834, -0.03059421, -1.9646, 1, 1, 1, 1, 1,
-1.059695, 0.7283499, -0.8086401, 1, 1, 1, 1, 1,
-1.052628, 1.888008, 0.3144249, 1, 1, 1, 1, 1,
-1.052593, -2.183641, -2.62466, 1, 1, 1, 1, 1,
-1.051689, -1.402563, -2.773161, 1, 1, 1, 1, 1,
-1.041402, -0.4591404, -1.504905, 1, 1, 1, 1, 1,
-1.038548, 0.779381, 0.1465032, 1, 1, 1, 1, 1,
-1.032424, 1.205707, -0.5188379, 1, 1, 1, 1, 1,
-1.030532, -1.847271, -1.425988, 1, 1, 1, 1, 1,
-1.030417, -1.044143, -2.279092, 1, 1, 1, 1, 1,
-1.029805, 0.9498775, -0.5673841, 1, 1, 1, 1, 1,
-1.025579, 0.7134248, -2.704834, 1, 1, 1, 1, 1,
-1.020099, 1.65837, -1.312949, 1, 1, 1, 1, 1,
-1.012577, 0.3784747, -0.2010047, 1, 1, 1, 1, 1,
-1.010355, -0.1591584, -2.602306, 0, 0, 1, 1, 1,
-1.009546, -0.8102943, -2.019671, 1, 0, 0, 1, 1,
-1.002895, 0.618989, -1.331207, 1, 0, 0, 1, 1,
-1.001855, -0.5094896, -1.855988, 1, 0, 0, 1, 1,
-0.9998334, 0.9806045, -0.4468934, 1, 0, 0, 1, 1,
-0.9945536, 0.2651218, -1.845748, 1, 0, 0, 1, 1,
-0.9918486, 1.478235, -0.9393341, 0, 0, 0, 1, 1,
-0.9912212, 1.732967, -0.7895089, 0, 0, 0, 1, 1,
-0.9860767, -1.152188, -2.301553, 0, 0, 0, 1, 1,
-0.9760801, 0.04253085, -2.755764, 0, 0, 0, 1, 1,
-0.9751994, 1.009772, -1.404789, 0, 0, 0, 1, 1,
-0.9709095, -0.8988832, -3.509813, 0, 0, 0, 1, 1,
-0.9671744, -0.9662085, -2.305478, 0, 0, 0, 1, 1,
-0.9627407, 0.4178655, -0.1936767, 1, 1, 1, 1, 1,
-0.9611782, 1.013794, -1.606538, 1, 1, 1, 1, 1,
-0.9578177, -0.787247, -2.507174, 1, 1, 1, 1, 1,
-0.9575885, -0.826089, -3.031729, 1, 1, 1, 1, 1,
-0.9458835, 0.2954894, -2.005383, 1, 1, 1, 1, 1,
-0.9448143, -1.405751, -2.332835, 1, 1, 1, 1, 1,
-0.9423795, 0.1955421, -0.02211835, 1, 1, 1, 1, 1,
-0.9376862, -0.9972029, -2.140396, 1, 1, 1, 1, 1,
-0.9312192, 0.5228947, -1.348199, 1, 1, 1, 1, 1,
-0.9303766, -0.3389674, -0.7671525, 1, 1, 1, 1, 1,
-0.9290443, -1.288792, -4.002018, 1, 1, 1, 1, 1,
-0.9288525, 0.5409527, -1.307907, 1, 1, 1, 1, 1,
-0.924878, -0.1218255, -2.377581, 1, 1, 1, 1, 1,
-0.9119201, -0.5571013, -0.737168, 1, 1, 1, 1, 1,
-0.9099017, 0.2231713, 0.005903087, 1, 1, 1, 1, 1,
-0.9043141, 0.02326172, -1.184249, 0, 0, 1, 1, 1,
-0.9008626, -0.2330985, -2.442764, 1, 0, 0, 1, 1,
-0.8978348, 0.216048, -0.01174225, 1, 0, 0, 1, 1,
-0.8973563, 1.142623, -2.219553, 1, 0, 0, 1, 1,
-0.8848484, -0.6571173, -2.124356, 1, 0, 0, 1, 1,
-0.8845734, 1.034474, 1.158953, 1, 0, 0, 1, 1,
-0.884159, 0.5115474, -2.188557, 0, 0, 0, 1, 1,
-0.8782853, 1.90593, -0.3450085, 0, 0, 0, 1, 1,
-0.8711962, 0.6710874, 0.1054844, 0, 0, 0, 1, 1,
-0.8697993, 0.224456, -2.365572, 0, 0, 0, 1, 1,
-0.8662357, 0.4567816, -2.359017, 0, 0, 0, 1, 1,
-0.8610964, 0.6170663, 0.2508794, 0, 0, 0, 1, 1,
-0.8570212, -1.032509, -4.426541, 0, 0, 0, 1, 1,
-0.8562558, 0.5639849, -0.3991411, 1, 1, 1, 1, 1,
-0.851666, 0.708555, 0.9875304, 1, 1, 1, 1, 1,
-0.8499494, -0.7140536, -2.077041, 1, 1, 1, 1, 1,
-0.8465536, -0.07642581, -2.594596, 1, 1, 1, 1, 1,
-0.8374619, 0.3294604, -2.083502, 1, 1, 1, 1, 1,
-0.8343621, 0.5539185, -0.5338098, 1, 1, 1, 1, 1,
-0.8311626, 0.5171606, -0.01653128, 1, 1, 1, 1, 1,
-0.8269078, -0.4130667, -1.920545, 1, 1, 1, 1, 1,
-0.8243916, -1.400325, -2.51916, 1, 1, 1, 1, 1,
-0.8237848, 0.6573231, 1.195875, 1, 1, 1, 1, 1,
-0.8196791, 0.2435035, -1.301886, 1, 1, 1, 1, 1,
-0.8177147, 0.8593223, -0.9001544, 1, 1, 1, 1, 1,
-0.8176208, -0.7121916, -1.227804, 1, 1, 1, 1, 1,
-0.8008819, -1.01994, -4.447081, 1, 1, 1, 1, 1,
-0.7992989, -1.485721, 0.1815384, 1, 1, 1, 1, 1,
-0.7982172, 3.032477, -0.987526, 0, 0, 1, 1, 1,
-0.7967163, -0.3604581, -1.995154, 1, 0, 0, 1, 1,
-0.7954736, 0.4432704, -0.05563322, 1, 0, 0, 1, 1,
-0.7932557, 0.1434771, 0.4289374, 1, 0, 0, 1, 1,
-0.7928997, -1.543788, -3.074866, 1, 0, 0, 1, 1,
-0.7840062, -0.1557926, -4.407586, 1, 0, 0, 1, 1,
-0.7838997, 0.6268269, -0.2418869, 0, 0, 0, 1, 1,
-0.7809789, 0.8038753, -0.806602, 0, 0, 0, 1, 1,
-0.7766136, -0.3472335, -3.553605, 0, 0, 0, 1, 1,
-0.7759839, -0.1752659, -1.525045, 0, 0, 0, 1, 1,
-0.7733804, 0.6558999, -1.458495, 0, 0, 0, 1, 1,
-0.7727338, -1.388013, -2.139149, 0, 0, 0, 1, 1,
-0.7719452, -0.5715864, -2.242269, 0, 0, 0, 1, 1,
-0.7705742, -1.407051, -2.801883, 1, 1, 1, 1, 1,
-0.7672096, -0.5496152, -2.568723, 1, 1, 1, 1, 1,
-0.7524488, 0.0267947, -1.769757, 1, 1, 1, 1, 1,
-0.748606, 0.6038823, -0.439371, 1, 1, 1, 1, 1,
-0.7458705, -2.039562, -3.733115, 1, 1, 1, 1, 1,
-0.7387329, 1.473958, 0.1191858, 1, 1, 1, 1, 1,
-0.7358803, -0.9598499, -3.76927, 1, 1, 1, 1, 1,
-0.7317167, 0.8370945, -0.4203607, 1, 1, 1, 1, 1,
-0.7302925, -0.3513442, -2.435287, 1, 1, 1, 1, 1,
-0.7298124, 1.086702, -0.3934681, 1, 1, 1, 1, 1,
-0.7226157, -0.5958533, -1.673913, 1, 1, 1, 1, 1,
-0.7200495, 0.3154367, -3.586645, 1, 1, 1, 1, 1,
-0.7186767, -1.748806, -2.954881, 1, 1, 1, 1, 1,
-0.71596, -1.489786, -1.842135, 1, 1, 1, 1, 1,
-0.7148352, 0.9326944, -1.889553, 1, 1, 1, 1, 1,
-0.7095144, 1.943425, -1.521, 0, 0, 1, 1, 1,
-0.7087039, 0.4765668, -0.9388308, 1, 0, 0, 1, 1,
-0.7030571, -0.06927156, -0.8560812, 1, 0, 0, 1, 1,
-0.6971889, 1.504023, 0.9830614, 1, 0, 0, 1, 1,
-0.6967681, -0.9512261, -5.911663, 1, 0, 0, 1, 1,
-0.6935235, 0.1500234, -4.577598, 1, 0, 0, 1, 1,
-0.6874915, -0.7426254, -2.185173, 0, 0, 0, 1, 1,
-0.6871745, 0.686753, -0.9957705, 0, 0, 0, 1, 1,
-0.6811183, -1.079712, -2.882544, 0, 0, 0, 1, 1,
-0.6791193, 0.7892325, -2.452527, 0, 0, 0, 1, 1,
-0.6781383, -0.09599336, -0.8465921, 0, 0, 0, 1, 1,
-0.6764619, 1.150575, -1.372968, 0, 0, 0, 1, 1,
-0.673394, 0.8448436, -1.825288, 0, 0, 0, 1, 1,
-0.6719248, -0.8867279, -2.764156, 1, 1, 1, 1, 1,
-0.6698989, -2.275718, -3.127091, 1, 1, 1, 1, 1,
-0.6671916, 0.09372608, -1.952939, 1, 1, 1, 1, 1,
-0.6667215, -1.237782, -1.144081, 1, 1, 1, 1, 1,
-0.6577165, 0.07370154, -1.333185, 1, 1, 1, 1, 1,
-0.6566826, 1.211826, -0.3502147, 1, 1, 1, 1, 1,
-0.6555228, 3.045691, -1.066626, 1, 1, 1, 1, 1,
-0.6511021, 0.5435838, -2.960433, 1, 1, 1, 1, 1,
-0.6475782, 0.2679995, -2.518174, 1, 1, 1, 1, 1,
-0.6462354, 1.272895, 0.8999879, 1, 1, 1, 1, 1,
-0.6274679, 0.5317941, 0.1645632, 1, 1, 1, 1, 1,
-0.621273, 0.6312498, -0.5575323, 1, 1, 1, 1, 1,
-0.6203273, -1.892187, -3.919923, 1, 1, 1, 1, 1,
-0.6191803, 1.284464, -0.4705463, 1, 1, 1, 1, 1,
-0.6086512, -0.06482831, -1.433559, 1, 1, 1, 1, 1,
-0.6076827, -1.556748, -1.082882, 0, 0, 1, 1, 1,
-0.6042328, -0.6489348, -3.051289, 1, 0, 0, 1, 1,
-0.6040701, 0.06674773, -1.909047, 1, 0, 0, 1, 1,
-0.5950478, -0.6788418, -2.142694, 1, 0, 0, 1, 1,
-0.594173, 0.6107211, -1.292222, 1, 0, 0, 1, 1,
-0.5912743, -1.158173, -2.301381, 1, 0, 0, 1, 1,
-0.5848397, -0.02581668, -3.316256, 0, 0, 0, 1, 1,
-0.5846937, -0.09101737, -1.929786, 0, 0, 0, 1, 1,
-0.581985, 1.348868, -1.586241, 0, 0, 0, 1, 1,
-0.5773898, 0.01026483, -1.677587, 0, 0, 0, 1, 1,
-0.5765987, 0.02502624, -1.790163, 0, 0, 0, 1, 1,
-0.5736166, -0.0617612, -1.224357, 0, 0, 0, 1, 1,
-0.5715715, 0.1715822, -1.588912, 0, 0, 0, 1, 1,
-0.5702259, 1.063264, -1.875152, 1, 1, 1, 1, 1,
-0.5675567, 0.3336901, -0.7177578, 1, 1, 1, 1, 1,
-0.5667508, -0.229281, -0.3719355, 1, 1, 1, 1, 1,
-0.5580963, -0.4576156, -2.564723, 1, 1, 1, 1, 1,
-0.5554672, 0.7962718, -0.9457572, 1, 1, 1, 1, 1,
-0.5549771, -0.5646809, -1.7021, 1, 1, 1, 1, 1,
-0.5529112, -1.432304, -1.960075, 1, 1, 1, 1, 1,
-0.5516918, 0.2508165, -2.090621, 1, 1, 1, 1, 1,
-0.5510914, -0.7703777, -3.014411, 1, 1, 1, 1, 1,
-0.5457249, 0.1317644, -0.819059, 1, 1, 1, 1, 1,
-0.544126, -0.2188406, -0.8317848, 1, 1, 1, 1, 1,
-0.5436927, 0.7870682, 0.4324273, 1, 1, 1, 1, 1,
-0.5350844, 0.8189407, -1.248108, 1, 1, 1, 1, 1,
-0.5322408, 0.8967113, 0.08007316, 1, 1, 1, 1, 1,
-0.5317816, -0.05729187, -0.5681763, 1, 1, 1, 1, 1,
-0.5301882, 0.3020892, 0.3658336, 0, 0, 1, 1, 1,
-0.5289645, 0.7476618, 1.045209, 1, 0, 0, 1, 1,
-0.5274079, 2.253246, -1.905079, 1, 0, 0, 1, 1,
-0.5201175, -0.6452131, -3.678562, 1, 0, 0, 1, 1,
-0.5175002, -0.08288175, -2.666099, 1, 0, 0, 1, 1,
-0.5137888, 1.433809, 0.5384566, 1, 0, 0, 1, 1,
-0.5117436, -1.145706, -3.609618, 0, 0, 0, 1, 1,
-0.5067419, -0.622383, -2.644179, 0, 0, 0, 1, 1,
-0.5063666, -0.7830881, -1.823995, 0, 0, 0, 1, 1,
-0.5053123, 0.08539588, -2.455029, 0, 0, 0, 1, 1,
-0.5030963, -0.4444686, -3.409749, 0, 0, 0, 1, 1,
-0.4991197, 0.2514886, -1.325471, 0, 0, 0, 1, 1,
-0.4895485, -0.7740251, -3.598955, 0, 0, 0, 1, 1,
-0.4893793, -0.2908565, -2.249586, 1, 1, 1, 1, 1,
-0.4867679, -0.3237803, -2.505799, 1, 1, 1, 1, 1,
-0.4857072, 1.437698, -0.6572297, 1, 1, 1, 1, 1,
-0.4853276, -0.7320158, -2.593916, 1, 1, 1, 1, 1,
-0.4820059, -1.83549, -3.43366, 1, 1, 1, 1, 1,
-0.4738075, 1.858854, 0.2394842, 1, 1, 1, 1, 1,
-0.4719285, 0.9618372, -1.641168, 1, 1, 1, 1, 1,
-0.471673, 2.811657, 0.9981496, 1, 1, 1, 1, 1,
-0.4690975, -1.134753, -1.918949, 1, 1, 1, 1, 1,
-0.4660838, 0.2659926, -0.2302357, 1, 1, 1, 1, 1,
-0.4656401, -0.7890391, -2.832149, 1, 1, 1, 1, 1,
-0.4637435, -0.06293058, 0.4258021, 1, 1, 1, 1, 1,
-0.463507, -0.3236534, -2.624409, 1, 1, 1, 1, 1,
-0.4632348, 0.07609518, -2.593446, 1, 1, 1, 1, 1,
-0.4608265, 2.034458, -0.6273988, 1, 1, 1, 1, 1,
-0.4579036, 0.771242, 0.04360748, 0, 0, 1, 1, 1,
-0.4569556, 0.3362043, -0.2411519, 1, 0, 0, 1, 1,
-0.4563521, 2.131923, 0.2889389, 1, 0, 0, 1, 1,
-0.455425, -0.5029799, -0.8689769, 1, 0, 0, 1, 1,
-0.4500375, 1.232127, -2.253074, 1, 0, 0, 1, 1,
-0.449526, -0.766249, -2.32684, 1, 0, 0, 1, 1,
-0.441044, -1.775501, -5.9668, 0, 0, 0, 1, 1,
-0.4382056, -0.07557932, -2.735518, 0, 0, 0, 1, 1,
-0.4378306, 0.7682853, 0.4402892, 0, 0, 0, 1, 1,
-0.434506, -0.3076628, -1.495504, 0, 0, 0, 1, 1,
-0.4339305, -0.9097148, -2.094382, 0, 0, 0, 1, 1,
-0.4322504, -2.58523, -2.100633, 0, 0, 0, 1, 1,
-0.4285543, -0.4520849, -1.802107, 0, 0, 0, 1, 1,
-0.4246459, -0.5559061, -3.283427, 1, 1, 1, 1, 1,
-0.4224911, -0.6769662, -4.042336, 1, 1, 1, 1, 1,
-0.4186828, 0.3913359, -0.6910157, 1, 1, 1, 1, 1,
-0.4061505, 1.417589, -0.8159072, 1, 1, 1, 1, 1,
-0.4049364, -0.7932938, -2.685848, 1, 1, 1, 1, 1,
-0.401529, 0.9649429, -0.2600738, 1, 1, 1, 1, 1,
-0.3992962, -0.6938964, -1.241705, 1, 1, 1, 1, 1,
-0.3983909, 0.8869648, 2.900095, 1, 1, 1, 1, 1,
-0.3923405, -0.7814938, -2.267542, 1, 1, 1, 1, 1,
-0.3916016, -1.343185, -3.115177, 1, 1, 1, 1, 1,
-0.3794281, -1.152464, -3.225754, 1, 1, 1, 1, 1,
-0.3654855, -1.87711, -2.857375, 1, 1, 1, 1, 1,
-0.3640862, 1.260666, 1.510259, 1, 1, 1, 1, 1,
-0.3610661, -0.6544515, -0.7444187, 1, 1, 1, 1, 1,
-0.3603786, -1.808885, -2.094646, 1, 1, 1, 1, 1,
-0.3603608, 0.3955489, -1.318928, 0, 0, 1, 1, 1,
-0.3544048, 0.7760901, -0.5082678, 1, 0, 0, 1, 1,
-0.3502683, 0.07712939, -0.6733916, 1, 0, 0, 1, 1,
-0.3474985, -0.1619555, -1.641554, 1, 0, 0, 1, 1,
-0.3448628, 0.6545494, -0.1535106, 1, 0, 0, 1, 1,
-0.3429484, -0.6510065, -4.52656, 1, 0, 0, 1, 1,
-0.3418137, -0.5339195, -2.627743, 0, 0, 0, 1, 1,
-0.3397698, 0.5254529, -0.5523851, 0, 0, 0, 1, 1,
-0.3390226, -0.9874931, -1.325537, 0, 0, 0, 1, 1,
-0.3359684, 1.52055, -1.144758, 0, 0, 0, 1, 1,
-0.3344364, -0.4852661, -1.364829, 0, 0, 0, 1, 1,
-0.333351, 1.703735, 1.618726, 0, 0, 0, 1, 1,
-0.3289136, -2.995878, -3.049434, 0, 0, 0, 1, 1,
-0.3286638, -3.196761, -0.8846951, 1, 1, 1, 1, 1,
-0.3224245, -0.4054407, -3.051001, 1, 1, 1, 1, 1,
-0.320895, -0.7805051, -2.905443, 1, 1, 1, 1, 1,
-0.3085578, -0.3656995, -4.530732, 1, 1, 1, 1, 1,
-0.3027254, -0.3436467, -3.917816, 1, 1, 1, 1, 1,
-0.2960018, -0.4868441, -1.376203, 1, 1, 1, 1, 1,
-0.2930963, -1.742356, -3.681697, 1, 1, 1, 1, 1,
-0.2918138, 1.043267, -1.910276, 1, 1, 1, 1, 1,
-0.2897323, 1.01672, 1.674134, 1, 1, 1, 1, 1,
-0.2867788, -1.140878, -3.258993, 1, 1, 1, 1, 1,
-0.2843437, 1.289286, -1.428482, 1, 1, 1, 1, 1,
-0.2734431, 0.3081247, -0.3896053, 1, 1, 1, 1, 1,
-0.2722193, -0.5991947, -1.840081, 1, 1, 1, 1, 1,
-0.2707618, 0.6918373, -1.786547, 1, 1, 1, 1, 1,
-0.2703483, -0.368898, -2.891298, 1, 1, 1, 1, 1,
-0.2684048, 0.4826753, -0.6232008, 0, 0, 1, 1, 1,
-0.2680074, -0.4808346, -2.268579, 1, 0, 0, 1, 1,
-0.2668631, -0.7048032, -2.417453, 1, 0, 0, 1, 1,
-0.2651496, 0.4158447, -0.7742893, 1, 0, 0, 1, 1,
-0.2644684, 1.574757, -0.6261057, 1, 0, 0, 1, 1,
-0.2633484, -0.173275, -1.882492, 1, 0, 0, 1, 1,
-0.2621836, -2.128312, -1.717664, 0, 0, 0, 1, 1,
-0.2613124, -0.9326877, -1.561656, 0, 0, 0, 1, 1,
-0.2611681, 1.701338, 0.03069546, 0, 0, 0, 1, 1,
-0.2594586, 0.317091, -0.8432902, 0, 0, 0, 1, 1,
-0.2545219, 0.8100433, 0.04690839, 0, 0, 0, 1, 1,
-0.251118, -0.2671734, -1.843915, 0, 0, 0, 1, 1,
-0.2491698, 0.7829019, -1.308578, 0, 0, 0, 1, 1,
-0.2484879, -0.3507189, -2.997845, 1, 1, 1, 1, 1,
-0.248367, -0.8948401, -3.437248, 1, 1, 1, 1, 1,
-0.2470168, 0.2049403, -2.228408, 1, 1, 1, 1, 1,
-0.2444533, -1.296868, -2.821154, 1, 1, 1, 1, 1,
-0.2433442, 0.52645, -0.2022139, 1, 1, 1, 1, 1,
-0.2346912, -1.096651, -1.690909, 1, 1, 1, 1, 1,
-0.2315871, -0.8999023, -3.116149, 1, 1, 1, 1, 1,
-0.2311915, 0.1054517, 0.5493361, 1, 1, 1, 1, 1,
-0.230702, 0.5722771, -1.442131, 1, 1, 1, 1, 1,
-0.2213937, -1.101979, -3.27546, 1, 1, 1, 1, 1,
-0.2177096, 0.6473841, 0.0244866, 1, 1, 1, 1, 1,
-0.2157011, -0.2118287, -2.934852, 1, 1, 1, 1, 1,
-0.2129826, -1.236807, -2.207358, 1, 1, 1, 1, 1,
-0.211726, 0.4445301, 0.2590601, 1, 1, 1, 1, 1,
-0.2116362, 0.4747787, -0.7963672, 1, 1, 1, 1, 1,
-0.2093435, 0.08173744, -1.546136, 0, 0, 1, 1, 1,
-0.2072584, -0.9458914, -3.888088, 1, 0, 0, 1, 1,
-0.2064077, -0.1467028, -2.038755, 1, 0, 0, 1, 1,
-0.2031544, -1.301976, -3.846687, 1, 0, 0, 1, 1,
-0.2017981, 0.1367953, -2.619284, 1, 0, 0, 1, 1,
-0.2010714, 1.650679, -0.6945828, 1, 0, 0, 1, 1,
-0.1984303, -0.8523399, -3.244602, 0, 0, 0, 1, 1,
-0.1979529, 2.240472, -1.729889, 0, 0, 0, 1, 1,
-0.1954224, -1.014185, -3.460036, 0, 0, 0, 1, 1,
-0.1868832, 0.2608804, 0.2020015, 0, 0, 0, 1, 1,
-0.1863158, -1.103614, -3.282068, 0, 0, 0, 1, 1,
-0.181182, -0.4897194, -4.016508, 0, 0, 0, 1, 1,
-0.1800152, 0.7897096, -0.6892087, 0, 0, 0, 1, 1,
-0.1776707, 0.6254214, -0.2383028, 1, 1, 1, 1, 1,
-0.1759219, -0.2693279, -2.241173, 1, 1, 1, 1, 1,
-0.166093, 1.738225, -1.96594, 1, 1, 1, 1, 1,
-0.161518, -0.8307504, -4.508016, 1, 1, 1, 1, 1,
-0.1609446, 0.5920421, -1.358184, 1, 1, 1, 1, 1,
-0.1600712, -0.7474394, -4.045918, 1, 1, 1, 1, 1,
-0.1598142, 0.5835035, 1.54639, 1, 1, 1, 1, 1,
-0.1542781, -0.6862985, -2.32957, 1, 1, 1, 1, 1,
-0.1525488, -1.368719, -3.54762, 1, 1, 1, 1, 1,
-0.1517337, -0.4774056, -1.51928, 1, 1, 1, 1, 1,
-0.151561, -0.4247512, -2.769799, 1, 1, 1, 1, 1,
-0.1460699, 2.215031, -0.8757956, 1, 1, 1, 1, 1,
-0.1449798, 0.4432383, 1.691679, 1, 1, 1, 1, 1,
-0.1447524, -0.205325, -2.391158, 1, 1, 1, 1, 1,
-0.143826, 0.2250462, -0.4014115, 1, 1, 1, 1, 1,
-0.1365886, -0.1311717, -1.210898, 0, 0, 1, 1, 1,
-0.1296999, 0.4032963, -0.7720696, 1, 0, 0, 1, 1,
-0.1265504, 1.146202, -0.07320416, 1, 0, 0, 1, 1,
-0.1185258, 0.9263126, 1.263911, 1, 0, 0, 1, 1,
-0.1184281, -0.2166846, -3.783342, 1, 0, 0, 1, 1,
-0.117995, 0.09838387, -1.708843, 1, 0, 0, 1, 1,
-0.1152216, 0.1667884, -1.565754, 0, 0, 0, 1, 1,
-0.106807, -0.8990835, -1.918482, 0, 0, 0, 1, 1,
-0.1003529, -0.02147799, -3.597509, 0, 0, 0, 1, 1,
-0.09531099, -1.230811, -3.166495, 0, 0, 0, 1, 1,
-0.09094977, -0.9318141, -4.134781, 0, 0, 0, 1, 1,
-0.09009259, -0.2679872, -3.779881, 0, 0, 0, 1, 1,
-0.07764697, 0.5914379, -0.06197803, 0, 0, 0, 1, 1,
-0.07714072, 0.08965073, -1.257621, 1, 1, 1, 1, 1,
-0.07311078, 0.2987862, 0.05809432, 1, 1, 1, 1, 1,
-0.06673392, -0.6778386, -3.110033, 1, 1, 1, 1, 1,
-0.0634684, 1.789752, 1.811558, 1, 1, 1, 1, 1,
-0.06337516, -0.3924389, -1.622537, 1, 1, 1, 1, 1,
-0.06174167, 0.6459208, 0.600958, 1, 1, 1, 1, 1,
-0.06115482, -0.5056504, -2.537766, 1, 1, 1, 1, 1,
-0.06011874, -0.3172209, -1.648661, 1, 1, 1, 1, 1,
-0.05794108, 0.6486225, -1.282484, 1, 1, 1, 1, 1,
-0.05561903, -0.8791063, -2.243654, 1, 1, 1, 1, 1,
-0.04907411, 0.9773551, 1.015807, 1, 1, 1, 1, 1,
-0.04904807, 0.01471197, -1.803478, 1, 1, 1, 1, 1,
-0.04338719, 1.102471, 0.9923505, 1, 1, 1, 1, 1,
-0.04309513, 0.7660825, -0.9134542, 1, 1, 1, 1, 1,
-0.04189764, -0.2176868, -3.450913, 1, 1, 1, 1, 1,
-0.04035927, 0.7347346, -1.832507, 0, 0, 1, 1, 1,
-0.03964232, -0.5275483, -2.475372, 1, 0, 0, 1, 1,
-0.03891096, -2.503512, -3.589989, 1, 0, 0, 1, 1,
-0.03730578, -0.7834575, -2.225582, 1, 0, 0, 1, 1,
-0.0371719, 0.8647527, 0.3170568, 1, 0, 0, 1, 1,
-0.032786, -0.1849576, -1.998171, 1, 0, 0, 1, 1,
-0.0323177, 0.09242436, -0.8528783, 0, 0, 0, 1, 1,
-0.02646228, -0.469008, -4.03086, 0, 0, 0, 1, 1,
-0.02471494, 2.993232, -1.347455, 0, 0, 0, 1, 1,
-0.02415728, -0.2665911, -3.891683, 0, 0, 0, 1, 1,
-0.02026019, -1.320682, -2.48408, 0, 0, 0, 1, 1,
-0.01931073, 2.73314, -0.4590609, 0, 0, 0, 1, 1,
-0.01908196, -1.035576, -3.291542, 0, 0, 0, 1, 1,
-0.01905104, 1.729149, 2.403954, 1, 1, 1, 1, 1,
-0.01362046, 0.04351627, -1.865564, 1, 1, 1, 1, 1,
-0.009874173, -0.4204586, -4.82112, 1, 1, 1, 1, 1,
-0.009376409, 1.485859, 2.509335, 1, 1, 1, 1, 1,
-0.008267855, 0.2599924, 1.315074, 1, 1, 1, 1, 1,
-0.007953166, -0.7350435, -4.599213, 1, 1, 1, 1, 1,
-2.604469e-05, -1.637574, -3.085744, 1, 1, 1, 1, 1,
0.004194736, 0.1487898, 2.107397, 1, 1, 1, 1, 1,
0.00747874, -0.732343, 4.447602, 1, 1, 1, 1, 1,
0.007952603, -2.403689, 2.954329, 1, 1, 1, 1, 1,
0.009662128, -1.770439, 4.17102, 1, 1, 1, 1, 1,
0.01399537, 0.2658572, -0.8732517, 1, 1, 1, 1, 1,
0.01482784, 2.734026, -1.586054, 1, 1, 1, 1, 1,
0.0234622, -1.587659, 3.837985, 1, 1, 1, 1, 1,
0.02424679, -0.2906924, 3.759298, 1, 1, 1, 1, 1,
0.0263167, -0.7994758, 4.406165, 0, 0, 1, 1, 1,
0.03114059, 0.737641, -0.006984139, 1, 0, 0, 1, 1,
0.03637217, 1.216392, 0.5561641, 1, 0, 0, 1, 1,
0.03694874, -1.539607, 2.331305, 1, 0, 0, 1, 1,
0.03852125, 0.6880346, -1.737753, 1, 0, 0, 1, 1,
0.03968593, -1.61116, 3.474496, 1, 0, 0, 1, 1,
0.04045871, 0.04627663, 2.663018, 0, 0, 0, 1, 1,
0.0427449, -2.28065, 2.904311, 0, 0, 0, 1, 1,
0.04423556, 1.181937, 0.4002247, 0, 0, 0, 1, 1,
0.04430895, 2.456509, -0.6963437, 0, 0, 0, 1, 1,
0.04522079, 0.6867747, 0.8926597, 0, 0, 0, 1, 1,
0.04778127, -1.823777, 2.140361, 0, 0, 0, 1, 1,
0.04855008, -0.1097907, 2.873958, 0, 0, 0, 1, 1,
0.04864752, -2.655199, 2.620855, 1, 1, 1, 1, 1,
0.05202734, -0.9028021, 2.202259, 1, 1, 1, 1, 1,
0.05598655, -1.251343, 2.13933, 1, 1, 1, 1, 1,
0.05853219, -1.541287, 2.077901, 1, 1, 1, 1, 1,
0.06093837, 0.2171819, 0.8615463, 1, 1, 1, 1, 1,
0.06230563, 0.444051, 0.7536188, 1, 1, 1, 1, 1,
0.06530675, -0.5340868, 1.990938, 1, 1, 1, 1, 1,
0.06759959, 2.965657, -1.060028, 1, 1, 1, 1, 1,
0.06760133, 0.5785361, 0.1923185, 1, 1, 1, 1, 1,
0.06819462, 0.528339, 0.9153123, 1, 1, 1, 1, 1,
0.07809194, 0.7396437, -0.4977496, 1, 1, 1, 1, 1,
0.07973187, -0.05517915, 2.351032, 1, 1, 1, 1, 1,
0.0799423, 0.4898352, -0.2114659, 1, 1, 1, 1, 1,
0.08122044, -1.365444, 2.893605, 1, 1, 1, 1, 1,
0.08176573, -0.2863916, 2.965732, 1, 1, 1, 1, 1,
0.08181939, 1.520626, -0.7863496, 0, 0, 1, 1, 1,
0.08346557, -2.12987, 2.961896, 1, 0, 0, 1, 1,
0.08463429, -0.5731741, 3.958143, 1, 0, 0, 1, 1,
0.08745537, 1.561819, -0.9757339, 1, 0, 0, 1, 1,
0.08821831, 0.7064747, 0.09996627, 1, 0, 0, 1, 1,
0.09293409, 0.2018367, -0.8590448, 1, 0, 0, 1, 1,
0.09337077, 1.001947, -1.646063, 0, 0, 0, 1, 1,
0.09378595, 0.7660405, 0.6367015, 0, 0, 0, 1, 1,
0.09528916, 0.6958709, 0.3909362, 0, 0, 0, 1, 1,
0.1041384, -1.365549, 4.903421, 0, 0, 0, 1, 1,
0.1058383, -0.04214279, 0.4268607, 0, 0, 0, 1, 1,
0.1068134, 0.6829479, -1.537321, 0, 0, 0, 1, 1,
0.1084597, -0.1280822, 1.075603, 0, 0, 0, 1, 1,
0.1107026, 0.5206223, 0.2577814, 1, 1, 1, 1, 1,
0.1112437, -1.10141, 3.987, 1, 1, 1, 1, 1,
0.1119537, -0.4508144, 4.882887, 1, 1, 1, 1, 1,
0.1135973, -1.291898, 3.351429, 1, 1, 1, 1, 1,
0.1197603, -0.2265606, 3.917551, 1, 1, 1, 1, 1,
0.1203533, 2.037394, -0.4470223, 1, 1, 1, 1, 1,
0.1224688, 0.2587264, 0.7973068, 1, 1, 1, 1, 1,
0.1253557, -1.466533, 4.082702, 1, 1, 1, 1, 1,
0.1259549, -0.08141612, 1.681112, 1, 1, 1, 1, 1,
0.1321093, 0.1200723, -0.7349744, 1, 1, 1, 1, 1,
0.1335981, 1.158707, 2.254141, 1, 1, 1, 1, 1,
0.1360366, 1.588666, -0.6106036, 1, 1, 1, 1, 1,
0.1393676, 0.1604744, 1.98313, 1, 1, 1, 1, 1,
0.1420857, -1.210232, 4.503917, 1, 1, 1, 1, 1,
0.1436855, -0.8171615, 2.071308, 1, 1, 1, 1, 1,
0.1475664, 0.5041351, 0.9951087, 0, 0, 1, 1, 1,
0.1484179, -0.7498235, 2.624374, 1, 0, 0, 1, 1,
0.1516296, 1.063553, 1.687879, 1, 0, 0, 1, 1,
0.1561816, -0.2072194, 3.382913, 1, 0, 0, 1, 1,
0.1593829, -0.305336, 2.026589, 1, 0, 0, 1, 1,
0.1617607, -0.8298982, 4.048666, 1, 0, 0, 1, 1,
0.1638375, -1.752611, 2.022174, 0, 0, 0, 1, 1,
0.1664355, -1.705215, 1.524793, 0, 0, 0, 1, 1,
0.17173, 0.6499795, -0.3962133, 0, 0, 0, 1, 1,
0.1723171, 0.3592438, 1.044381, 0, 0, 0, 1, 1,
0.1726639, 0.7967436, -0.261447, 0, 0, 0, 1, 1,
0.1738902, 1.174684, 0.04132763, 0, 0, 0, 1, 1,
0.1767281, 0.7500334, 0.2605886, 0, 0, 0, 1, 1,
0.1851078, -0.3997615, 1.810135, 1, 1, 1, 1, 1,
0.1853336, -0.3990718, 2.833723, 1, 1, 1, 1, 1,
0.1925897, 0.2815353, 0.5751827, 1, 1, 1, 1, 1,
0.1939941, 0.30494, -0.04003084, 1, 1, 1, 1, 1,
0.1955958, 0.2386214, 3.606975, 1, 1, 1, 1, 1,
0.1963505, -0.06586723, 0.7347995, 1, 1, 1, 1, 1,
0.1995674, -0.4885958, 2.366274, 1, 1, 1, 1, 1,
0.2057425, 2.637696, -1.168563, 1, 1, 1, 1, 1,
0.2068769, -0.9545314, 3.120359, 1, 1, 1, 1, 1,
0.2118397, -0.5806048, 2.257942, 1, 1, 1, 1, 1,
0.2126975, -0.2232457, 2.047557, 1, 1, 1, 1, 1,
0.2132328, 1.372283, -0.746056, 1, 1, 1, 1, 1,
0.2152831, 0.5360238, -1.799871, 1, 1, 1, 1, 1,
0.2154082, 0.4717171, -0.6223392, 1, 1, 1, 1, 1,
0.2162306, -0.03830568, 1.246604, 1, 1, 1, 1, 1,
0.219477, -2.197299, 3.848936, 0, 0, 1, 1, 1,
0.2199436, -0.4699446, 1.83134, 1, 0, 0, 1, 1,
0.220316, 1.021378, 0.2504448, 1, 0, 0, 1, 1,
0.2238646, -0.06049653, 0.2296509, 1, 0, 0, 1, 1,
0.2238985, 1.512847, -0.3721549, 1, 0, 0, 1, 1,
0.224641, -0.6762101, 2.933928, 1, 0, 0, 1, 1,
0.2250224, -0.1974317, 4.346447, 0, 0, 0, 1, 1,
0.2254234, -2.469386, 3.197541, 0, 0, 0, 1, 1,
0.225437, -1.84435, 4.304582, 0, 0, 0, 1, 1,
0.2275057, -1.465916, 2.081038, 0, 0, 0, 1, 1,
0.2286372, -1.322294, 3.683474, 0, 0, 0, 1, 1,
0.2289383, -0.4854542, 2.606232, 0, 0, 0, 1, 1,
0.232675, 0.5567209, -0.9022813, 0, 0, 0, 1, 1,
0.2333898, 1.170681, -1.203095, 1, 1, 1, 1, 1,
0.2408891, 0.3133552, -0.06828925, 1, 1, 1, 1, 1,
0.2491254, -0.2281266, 3.802022, 1, 1, 1, 1, 1,
0.2498394, 1.307642, 0.9531899, 1, 1, 1, 1, 1,
0.2581317, -0.3154816, 2.523853, 1, 1, 1, 1, 1,
0.2645582, 0.281897, 0.594772, 1, 1, 1, 1, 1,
0.2665809, -0.2652636, 1.399198, 1, 1, 1, 1, 1,
0.2669259, -0.4127914, 2.392674, 1, 1, 1, 1, 1,
0.2670837, -1.633741, 3.823473, 1, 1, 1, 1, 1,
0.272041, 2.568009, 0.1929941, 1, 1, 1, 1, 1,
0.274439, 0.8004873, -1.291855, 1, 1, 1, 1, 1,
0.2768149, -1.797013, 2.101876, 1, 1, 1, 1, 1,
0.2786303, 0.5328971, -0.2625208, 1, 1, 1, 1, 1,
0.2797972, -0.9351552, 4.208904, 1, 1, 1, 1, 1,
0.2810075, -1.910836, 3.04936, 1, 1, 1, 1, 1,
0.282912, -0.920042, 1.24206, 0, 0, 1, 1, 1,
0.2829862, 0.8998559, -0.4504124, 1, 0, 0, 1, 1,
0.2842855, 0.4345516, 1.637446, 1, 0, 0, 1, 1,
0.2873839, 1.42713, -0.6212495, 1, 0, 0, 1, 1,
0.2890158, -0.9421859, 1.972128, 1, 0, 0, 1, 1,
0.2901259, 0.8333942, -0.09636825, 1, 0, 0, 1, 1,
0.2918535, 1.498147, 0.9945852, 0, 0, 0, 1, 1,
0.2947795, -0.04754982, 2.404164, 0, 0, 0, 1, 1,
0.2974961, 1.269987, 0.7644115, 0, 0, 0, 1, 1,
0.298854, 1.116069, -0.8104035, 0, 0, 0, 1, 1,
0.3004224, -1.62966, 2.240844, 0, 0, 0, 1, 1,
0.3039177, 0.04859626, 1.75632, 0, 0, 0, 1, 1,
0.3055263, -0.4992809, 2.809413, 0, 0, 0, 1, 1,
0.3057758, 0.9411105, -1.207531, 1, 1, 1, 1, 1,
0.3058978, 0.382261, -0.3680704, 1, 1, 1, 1, 1,
0.312447, 0.1793033, 1.212195, 1, 1, 1, 1, 1,
0.3163686, 0.4784257, 0.3090723, 1, 1, 1, 1, 1,
0.3178964, 0.9393378, 1.283222, 1, 1, 1, 1, 1,
0.3227713, 0.02463423, 3.558841, 1, 1, 1, 1, 1,
0.3263896, 0.4648598, -0.1355455, 1, 1, 1, 1, 1,
0.3304472, -1.209657, 4.096334, 1, 1, 1, 1, 1,
0.3336542, 0.5970449, 0.8897386, 1, 1, 1, 1, 1,
0.3354745, -2.210996, 2.535576, 1, 1, 1, 1, 1,
0.3364215, -3.367646, 4.176836, 1, 1, 1, 1, 1,
0.3390778, 0.6592882, 0.09754488, 1, 1, 1, 1, 1,
0.3392011, 2.231781, -0.3787415, 1, 1, 1, 1, 1,
0.3416625, -0.6645503, 2.938107, 1, 1, 1, 1, 1,
0.3444936, -1.453928, 1.752265, 1, 1, 1, 1, 1,
0.3446751, 1.676891, 1.891258, 0, 0, 1, 1, 1,
0.35535, -1.474812, 1.472859, 1, 0, 0, 1, 1,
0.3569207, -0.7752969, 0.7333792, 1, 0, 0, 1, 1,
0.3595363, -0.01509965, 2.03907, 1, 0, 0, 1, 1,
0.3641855, 1.909182, 1.892348, 1, 0, 0, 1, 1,
0.3650846, 0.2385313, 1.883205, 1, 0, 0, 1, 1,
0.3667936, -0.1705052, 1.547239, 0, 0, 0, 1, 1,
0.367401, -0.6443955, 1.495209, 0, 0, 0, 1, 1,
0.3695148, 0.3298577, 1.363122, 0, 0, 0, 1, 1,
0.3762792, 0.01748609, 4.230294, 0, 0, 0, 1, 1,
0.3769286, 1.366994, -2.035337, 0, 0, 0, 1, 1,
0.3798423, -0.03175634, 1.101423, 0, 0, 0, 1, 1,
0.3800425, 0.03127931, 2.981673, 0, 0, 0, 1, 1,
0.3887864, -1.465869, 3.891126, 1, 1, 1, 1, 1,
0.3907122, 0.679483, 0.4096, 1, 1, 1, 1, 1,
0.3907983, 1.573033, 0.4441638, 1, 1, 1, 1, 1,
0.3951832, -0.904298, 2.233993, 1, 1, 1, 1, 1,
0.3969122, 0.208248, 1.125023, 1, 1, 1, 1, 1,
0.3982057, 0.7200534, 1.27251, 1, 1, 1, 1, 1,
0.3983003, 1.163362, -1.358357, 1, 1, 1, 1, 1,
0.4002199, 0.3622364, 0.1150212, 1, 1, 1, 1, 1,
0.4012364, -1.177403, 3.359118, 1, 1, 1, 1, 1,
0.4024168, -0.3278483, 0.4220002, 1, 1, 1, 1, 1,
0.4041063, 0.3903808, 0.4984004, 1, 1, 1, 1, 1,
0.4075448, -1.408096, 2.770068, 1, 1, 1, 1, 1,
0.4090614, 1.343427, 0.8385459, 1, 1, 1, 1, 1,
0.4115933, 0.6837457, 1.581624, 1, 1, 1, 1, 1,
0.4122019, -1.293668, 2.064075, 1, 1, 1, 1, 1,
0.4144523, 0.7790443, 0.2989289, 0, 0, 1, 1, 1,
0.4185123, 0.7122781, 1.24253, 1, 0, 0, 1, 1,
0.424551, 0.0540685, -0.2044289, 1, 0, 0, 1, 1,
0.4253895, -1.179875, 2.017406, 1, 0, 0, 1, 1,
0.4287751, -0.09546088, 0.8193136, 1, 0, 0, 1, 1,
0.4343677, 0.3758065, 1.837253, 1, 0, 0, 1, 1,
0.4374162, 0.6299252, 1.831767, 0, 0, 0, 1, 1,
0.4398818, 1.013411, -0.323957, 0, 0, 0, 1, 1,
0.4463751, 0.4677099, 2.109637, 0, 0, 0, 1, 1,
0.4478697, 0.7827544, 0.2271126, 0, 0, 0, 1, 1,
0.4513734, 1.627368, 0.2576127, 0, 0, 0, 1, 1,
0.4570274, 0.07657019, -0.771555, 0, 0, 0, 1, 1,
0.4576363, -0.09159407, 2.765918, 0, 0, 0, 1, 1,
0.4581368, 0.4788125, 0.5035995, 1, 1, 1, 1, 1,
0.4588614, -0.9274084, 2.312027, 1, 1, 1, 1, 1,
0.4650139, -0.1422768, 2.245034, 1, 1, 1, 1, 1,
0.4722477, -1.773192, 0.7840014, 1, 1, 1, 1, 1,
0.4755393, -1.486193, 1.143042, 1, 1, 1, 1, 1,
0.4803231, -0.09239795, 1.827285, 1, 1, 1, 1, 1,
0.4813589, 0.6829481, 3.497711, 1, 1, 1, 1, 1,
0.4830436, 0.03149927, 1.347316, 1, 1, 1, 1, 1,
0.4852335, 0.008634227, 2.241537, 1, 1, 1, 1, 1,
0.4897903, 1.110797, 0.2239417, 1, 1, 1, 1, 1,
0.4906852, 0.3162078, 0.9819189, 1, 1, 1, 1, 1,
0.4962276, -0.9910902, 4.092917, 1, 1, 1, 1, 1,
0.4982503, 0.4435256, 1.505645, 1, 1, 1, 1, 1,
0.4997698, -0.4341976, 4.249067, 1, 1, 1, 1, 1,
0.5002517, -0.1873848, 3.438856, 1, 1, 1, 1, 1,
0.5025009, -0.9338051, 2.970036, 0, 0, 1, 1, 1,
0.5038833, -0.8622226, 3.090513, 1, 0, 0, 1, 1,
0.5073009, 0.221133, 1.471382, 1, 0, 0, 1, 1,
0.5079169, 1.333527, 0.6317711, 1, 0, 0, 1, 1,
0.5102465, 0.7255604, 0.4429381, 1, 0, 0, 1, 1,
0.5119429, -0.979722, 4.061699, 1, 0, 0, 1, 1,
0.5120619, -1.338004, 3.034751, 0, 0, 0, 1, 1,
0.5143337, -0.04359953, 1.125079, 0, 0, 0, 1, 1,
0.5162336, -0.005977393, 1.449672, 0, 0, 0, 1, 1,
0.5238178, 2.052098, 1.44168, 0, 0, 0, 1, 1,
0.5365721, -0.1340024, 2.705714, 0, 0, 0, 1, 1,
0.5396231, 0.7733275, 0.5102834, 0, 0, 0, 1, 1,
0.5400264, 0.371944, 0.8992177, 0, 0, 0, 1, 1,
0.5443835, -0.6539459, 2.482205, 1, 1, 1, 1, 1,
0.5485185, 0.560459, 0.4653325, 1, 1, 1, 1, 1,
0.5495344, -2.008257, 1.782387, 1, 1, 1, 1, 1,
0.5577537, 2.251492, -0.3407325, 1, 1, 1, 1, 1,
0.5598285, -1.403124, 3.614713, 1, 1, 1, 1, 1,
0.5600851, 2.215884, -0.7494085, 1, 1, 1, 1, 1,
0.5623472, 2.411371, 0.260215, 1, 1, 1, 1, 1,
0.5630588, -1.165068, 4.09635, 1, 1, 1, 1, 1,
0.5647828, -0.5818722, 1.324098, 1, 1, 1, 1, 1,
0.5670491, -0.5031354, 2.060415, 1, 1, 1, 1, 1,
0.5717973, -1.227413, 3.522447, 1, 1, 1, 1, 1,
0.5778284, -0.7322367, 2.041218, 1, 1, 1, 1, 1,
0.5800092, -1.43707, 4.33639, 1, 1, 1, 1, 1,
0.5834848, 1.025997, -0.4025585, 1, 1, 1, 1, 1,
0.5855997, 0.9822246, 1.340673, 1, 1, 1, 1, 1,
0.5943207, -0.736249, 3.580074, 0, 0, 1, 1, 1,
0.5981016, 0.06728155, 2.32461, 1, 0, 0, 1, 1,
0.600027, 1.003574, -0.3077075, 1, 0, 0, 1, 1,
0.6067677, -1.561823, 3.406027, 1, 0, 0, 1, 1,
0.6109863, 1.227803, 1.439556, 1, 0, 0, 1, 1,
0.6125873, -0.1809053, 1.403662, 1, 0, 0, 1, 1,
0.6164016, 0.1145006, 2.863427, 0, 0, 0, 1, 1,
0.6166352, -0.7077435, 2.275757, 0, 0, 0, 1, 1,
0.6361452, -0.09594014, 0.8150244, 0, 0, 0, 1, 1,
0.6369604, -1.053887, 1.871911, 0, 0, 0, 1, 1,
0.6378263, -0.1170292, 2.562888, 0, 0, 0, 1, 1,
0.6409614, 1.117192, -0.3914183, 0, 0, 0, 1, 1,
0.6411946, 0.8794106, 0.7303229, 0, 0, 0, 1, 1,
0.6446947, 2.060152, 3.188767, 1, 1, 1, 1, 1,
0.6548083, -1.404189, 2.253401, 1, 1, 1, 1, 1,
0.6594076, 1.399253, 0.6794846, 1, 1, 1, 1, 1,
0.6636044, -0.1065542, 1.86302, 1, 1, 1, 1, 1,
0.665892, -0.06844469, 1.543856, 1, 1, 1, 1, 1,
0.6660434, 0.2843621, 1.805233, 1, 1, 1, 1, 1,
0.6727507, -1.098589, 2.866724, 1, 1, 1, 1, 1,
0.674248, 1.428485, 0.8550171, 1, 1, 1, 1, 1,
0.6742638, -0.02138419, -0.7396133, 1, 1, 1, 1, 1,
0.6839498, -2.631098, 4.459706, 1, 1, 1, 1, 1,
0.6847005, 0.9778613, -0.7800951, 1, 1, 1, 1, 1,
0.6914411, -0.3037742, 1.969505, 1, 1, 1, 1, 1,
0.6949542, 0.1985001, 1.045068, 1, 1, 1, 1, 1,
0.6950292, 0.8660463, 1.109138, 1, 1, 1, 1, 1,
0.6952473, -0.7763829, 4.344953, 1, 1, 1, 1, 1,
0.6973228, -0.5738323, 2.947398, 0, 0, 1, 1, 1,
0.6982054, 1.710901, 2.789623, 1, 0, 0, 1, 1,
0.6986216, -0.05427982, -1.161935, 1, 0, 0, 1, 1,
0.7018861, -0.08811763, 0.7241029, 1, 0, 0, 1, 1,
0.7085261, -0.8170904, 1.787439, 1, 0, 0, 1, 1,
0.7105445, 0.7553539, 1.602414, 1, 0, 0, 1, 1,
0.7106956, 0.8570179, 1.397704, 0, 0, 0, 1, 1,
0.7113501, -1.985184, 4.512048, 0, 0, 0, 1, 1,
0.7129273, 0.7897978, -0.4373796, 0, 0, 0, 1, 1,
0.7157039, 0.797475, 0.5835859, 0, 0, 0, 1, 1,
0.7194642, 1.346772, -0.3908076, 0, 0, 0, 1, 1,
0.7201765, 1.753304, -0.2795414, 0, 0, 0, 1, 1,
0.7221414, 0.3607796, 2.221248, 0, 0, 0, 1, 1,
0.7279856, -1.500506, 0.7053484, 1, 1, 1, 1, 1,
0.7331672, -0.9285638, 1.962476, 1, 1, 1, 1, 1,
0.7353072, -1.789325, 3.640268, 1, 1, 1, 1, 1,
0.7368654, 0.3137638, 0.7519875, 1, 1, 1, 1, 1,
0.7370644, 0.8506618, 1.692282, 1, 1, 1, 1, 1,
0.7384123, -0.8525327, 1.665066, 1, 1, 1, 1, 1,
0.7405671, 0.5051968, 0.880623, 1, 1, 1, 1, 1,
0.7421521, -0.6783372, 2.246955, 1, 1, 1, 1, 1,
0.7484409, 0.3777707, 1.95967, 1, 1, 1, 1, 1,
0.7562781, 1.777454, -0.1781718, 1, 1, 1, 1, 1,
0.7569233, 0.9081961, 0.8624742, 1, 1, 1, 1, 1,
0.759258, 1.748014, -0.427348, 1, 1, 1, 1, 1,
0.7594605, -1.189496, 1.742045, 1, 1, 1, 1, 1,
0.7626519, -0.3727241, 1.918474, 1, 1, 1, 1, 1,
0.7629225, 0.2133818, 0.08920004, 1, 1, 1, 1, 1,
0.7651429, 0.004135631, 2.800986, 0, 0, 1, 1, 1,
0.7664033, -2.124079, 3.939172, 1, 0, 0, 1, 1,
0.7683356, 0.3315789, 0.3610852, 1, 0, 0, 1, 1,
0.7716994, -0.07502154, 3.413637, 1, 0, 0, 1, 1,
0.7911682, -1.826538, 2.019166, 1, 0, 0, 1, 1,
0.7958685, -0.4444135, 2.106633, 1, 0, 0, 1, 1,
0.7981563, 0.6911475, 1.736559, 0, 0, 0, 1, 1,
0.8078099, -1.460862, 3.125056, 0, 0, 0, 1, 1,
0.8144712, 1.709513, 1.071949, 0, 0, 0, 1, 1,
0.8182387, 1.109048, 1.094608, 0, 0, 0, 1, 1,
0.8196303, -0.5418456, 1.736382, 0, 0, 0, 1, 1,
0.8254828, 0.9721692, 1.142372, 0, 0, 0, 1, 1,
0.8347495, 1.936722, 0.6683825, 0, 0, 0, 1, 1,
0.8357376, 1.780405, 1.189676, 1, 1, 1, 1, 1,
0.8449448, -0.6457441, 2.818202, 1, 1, 1, 1, 1,
0.8461872, 0.8397226, 0.3137026, 1, 1, 1, 1, 1,
0.8503388, 2.204425, 0.2051448, 1, 1, 1, 1, 1,
0.8515637, 1.574851, 0.8754119, 1, 1, 1, 1, 1,
0.8521872, 0.7491084, 0.6413039, 1, 1, 1, 1, 1,
0.857788, 1.4443, 0.9329262, 1, 1, 1, 1, 1,
0.8589773, 0.6616676, 0.8015221, 1, 1, 1, 1, 1,
0.8618995, 1.113796, 1.417347, 1, 1, 1, 1, 1,
0.8663001, -0.1266582, 1.604569, 1, 1, 1, 1, 1,
0.8683594, -0.4058975, 3.353086, 1, 1, 1, 1, 1,
0.8686439, 0.3776467, 2.701898, 1, 1, 1, 1, 1,
0.8703918, 0.1679124, 1.677036, 1, 1, 1, 1, 1,
0.879232, -2.271467, 2.31912, 1, 1, 1, 1, 1,
0.8837771, 0.02781761, 0.4705678, 1, 1, 1, 1, 1,
0.8841016, 1.289932, -0.5028513, 0, 0, 1, 1, 1,
0.8847256, 0.1522144, -0.3149444, 1, 0, 0, 1, 1,
0.8883893, -0.9547229, 2.797536, 1, 0, 0, 1, 1,
0.9043065, 0.8176849, 1.34703, 1, 0, 0, 1, 1,
0.9064099, 0.6743325, 1.920516, 1, 0, 0, 1, 1,
0.9072441, 0.3759086, 0.09736915, 1, 0, 0, 1, 1,
0.9079502, 0.6618695, 1.238674, 0, 0, 0, 1, 1,
0.9281983, -1.806067, 1.501162, 0, 0, 0, 1, 1,
0.9383731, -0.7608176, 2.273816, 0, 0, 0, 1, 1,
0.9412281, 0.2249817, 1.019459, 0, 0, 0, 1, 1,
0.9427496, -0.2591974, 0.929763, 0, 0, 0, 1, 1,
0.9442127, 0.504115, -0.4073597, 0, 0, 0, 1, 1,
0.9496682, -0.5605534, 0.469574, 0, 0, 0, 1, 1,
0.9683211, -0.09681816, 2.696122, 1, 1, 1, 1, 1,
0.9697555, -0.822496, 2.080079, 1, 1, 1, 1, 1,
0.9828777, 0.565436, -0.230335, 1, 1, 1, 1, 1,
0.9852363, -0.04219608, 2.410475, 1, 1, 1, 1, 1,
0.9855645, 0.6069582, 2.098326, 1, 1, 1, 1, 1,
0.9878628, -1.023818, -0.4791176, 1, 1, 1, 1, 1,
0.99406, 0.5328229, 0.07501276, 1, 1, 1, 1, 1,
0.996, 0.08741252, 2.536165, 1, 1, 1, 1, 1,
1.002102, 0.577169, 0.8028761, 1, 1, 1, 1, 1,
1.003731, -0.9824645, 3.115526, 1, 1, 1, 1, 1,
1.004829, -0.5602381, 1.158046, 1, 1, 1, 1, 1,
1.004984, 0.5909434, 1.4203, 1, 1, 1, 1, 1,
1.014581, 0.7006595, 1.431288, 1, 1, 1, 1, 1,
1.018634, -0.3747339, 0.4422944, 1, 1, 1, 1, 1,
1.025565, 0.2280347, 0.6316605, 1, 1, 1, 1, 1,
1.02619, 0.4249795, 0.9729553, 0, 0, 1, 1, 1,
1.028054, -0.8815243, 1.773583, 1, 0, 0, 1, 1,
1.033896, 0.2992415, 0.6695794, 1, 0, 0, 1, 1,
1.037133, -0.6882641, 0.9119434, 1, 0, 0, 1, 1,
1.04231, -0.09676754, 2.894282, 1, 0, 0, 1, 1,
1.04285, 0.2322906, 0.2575749, 1, 0, 0, 1, 1,
1.055418, 0.06512781, 1.705856, 0, 0, 0, 1, 1,
1.056201, -1.051133, 2.753394, 0, 0, 0, 1, 1,
1.058542, 0.7792017, -0.2063817, 0, 0, 0, 1, 1,
1.062684, 0.5772916, -0.2303636, 0, 0, 0, 1, 1,
1.066334, 0.4839174, 3.442257, 0, 0, 0, 1, 1,
1.072952, -1.616463, 2.404063, 0, 0, 0, 1, 1,
1.074279, 0.1372593, 3.043345, 0, 0, 0, 1, 1,
1.08261, -1.870331, 0.7695487, 1, 1, 1, 1, 1,
1.082927, 0.2465656, 1.475319, 1, 1, 1, 1, 1,
1.0877, -1.275166, 2.480475, 1, 1, 1, 1, 1,
1.089498, -0.01208874, 2.944831, 1, 1, 1, 1, 1,
1.100041, 0.07141487, 1.003079, 1, 1, 1, 1, 1,
1.103378, -0.3099178, 1.510753, 1, 1, 1, 1, 1,
1.111037, -0.1966206, 1.642243, 1, 1, 1, 1, 1,
1.120773, 0.5994978, 0.7225672, 1, 1, 1, 1, 1,
1.139744, -0.04935649, 2.155657, 1, 1, 1, 1, 1,
1.143082, -0.2569877, 1.621141, 1, 1, 1, 1, 1,
1.150159, -1.613566, 3.627881, 1, 1, 1, 1, 1,
1.155, -1.193147, 2.550535, 1, 1, 1, 1, 1,
1.157311, -1.27127, 2.043066, 1, 1, 1, 1, 1,
1.160011, -0.368381, 4.195256, 1, 1, 1, 1, 1,
1.172495, -0.5442734, 0.661103, 1, 1, 1, 1, 1,
1.176363, -0.9647679, 4.609655, 0, 0, 1, 1, 1,
1.177345, -0.6541789, -0.4519024, 1, 0, 0, 1, 1,
1.184178, -0.7425464, 0.8549344, 1, 0, 0, 1, 1,
1.187694, 1.551189, 2.385757, 1, 0, 0, 1, 1,
1.190093, 0.009708622, 1.409628, 1, 0, 0, 1, 1,
1.204787, 0.6258461, 0.9840001, 1, 0, 0, 1, 1,
1.207549, -0.8143557, -0.2365595, 0, 0, 0, 1, 1,
1.214113, 0.09921197, 2.662278, 0, 0, 0, 1, 1,
1.215052, 0.7249689, 1.634679, 0, 0, 0, 1, 1,
1.218716, -0.448755, 1.843855, 0, 0, 0, 1, 1,
1.222439, -0.3420091, 3.783338, 0, 0, 0, 1, 1,
1.222616, 0.5719427, 0.7468303, 0, 0, 0, 1, 1,
1.223337, 0.6778125, 1.499182, 0, 0, 0, 1, 1,
1.223539, 2.190709, 0.5410956, 1, 1, 1, 1, 1,
1.233162, 1.116001, -0.9529896, 1, 1, 1, 1, 1,
1.233524, -0.0637371, 2.029983, 1, 1, 1, 1, 1,
1.235748, 1.087576, 1.447911, 1, 1, 1, 1, 1,
1.236996, -1.022607, 2.494061, 1, 1, 1, 1, 1,
1.237799, 0.5723805, 0.6590905, 1, 1, 1, 1, 1,
1.240008, 0.6154013, 0.599334, 1, 1, 1, 1, 1,
1.242378, 0.4396053, 0.6966981, 1, 1, 1, 1, 1,
1.245219, -1.571421, 1.393666, 1, 1, 1, 1, 1,
1.252491, 0.1406838, 2.403887, 1, 1, 1, 1, 1,
1.255568, -0.04150286, 1.708246, 1, 1, 1, 1, 1,
1.256762, 0.2734117, 2.745173, 1, 1, 1, 1, 1,
1.257488, -0.2541453, 1.53329, 1, 1, 1, 1, 1,
1.258275, -0.5942018, 1.986307, 1, 1, 1, 1, 1,
1.272718, 0.04163709, 1.113147, 1, 1, 1, 1, 1,
1.274578, 1.112952, -0.0890526, 0, 0, 1, 1, 1,
1.281614, 0.6261299, 0.9604841, 1, 0, 0, 1, 1,
1.285863, 0.5960831, 2.925553, 1, 0, 0, 1, 1,
1.286241, 1.240241, 1.117058, 1, 0, 0, 1, 1,
1.290492, 0.09377776, 2.456848, 1, 0, 0, 1, 1,
1.30785, 0.6798786, 0.7748616, 1, 0, 0, 1, 1,
1.308375, 3.143702, 2.149148, 0, 0, 0, 1, 1,
1.310808, -0.1850291, 1.288427, 0, 0, 0, 1, 1,
1.316766, -1.852776, 3.726763, 0, 0, 0, 1, 1,
1.324853, -0.7878383, 2.94943, 0, 0, 0, 1, 1,
1.326361, -0.03263237, 1.422096, 0, 0, 0, 1, 1,
1.336478, 0.9502226, 2.596798, 0, 0, 0, 1, 1,
1.339091, -0.5591562, 2.674699, 0, 0, 0, 1, 1,
1.344007, -0.318784, 0.8725278, 1, 1, 1, 1, 1,
1.350013, -2.267616, 3.644013, 1, 1, 1, 1, 1,
1.352282, -2.679431, 4.051128, 1, 1, 1, 1, 1,
1.358668, 0.3477147, 2.198788, 1, 1, 1, 1, 1,
1.366849, -0.3587687, 2.962845, 1, 1, 1, 1, 1,
1.372345, 0.388513, 0.7287694, 1, 1, 1, 1, 1,
1.373626, -0.1854098, 1.613264, 1, 1, 1, 1, 1,
1.378444, 1.073607, 1.280467, 1, 1, 1, 1, 1,
1.385079, -1.128287, -0.1642988, 1, 1, 1, 1, 1,
1.398252, -0.9896438, 3.631824, 1, 1, 1, 1, 1,
1.402239, -0.9535357, 3.077225, 1, 1, 1, 1, 1,
1.402897, 0.339598, 1.090211, 1, 1, 1, 1, 1,
1.409556, 0.2926309, 2.468645, 1, 1, 1, 1, 1,
1.409982, 0.225691, -0.6412375, 1, 1, 1, 1, 1,
1.413229, 3.158916, 0.6365312, 1, 1, 1, 1, 1,
1.414131, -1.31144, 4.201996, 0, 0, 1, 1, 1,
1.421584, 0.5799394, 0.1826388, 1, 0, 0, 1, 1,
1.423287, -0.1144338, 2.419454, 1, 0, 0, 1, 1,
1.427015, 0.5958899, 0.9712157, 1, 0, 0, 1, 1,
1.434927, 1.3336, -2.075382, 1, 0, 0, 1, 1,
1.464686, -0.008635972, 2.246621, 1, 0, 0, 1, 1,
1.478625, -0.3804002, 2.191396, 0, 0, 0, 1, 1,
1.479656, 1.044097, 2.636098, 0, 0, 0, 1, 1,
1.487518, 1.467148, 0.9573091, 0, 0, 0, 1, 1,
1.505046, -1.630678, 1.001048, 0, 0, 0, 1, 1,
1.51819, 0.6547855, 0.7501375, 0, 0, 0, 1, 1,
1.52104, 0.9118016, 0.6963644, 0, 0, 0, 1, 1,
1.53024, 0.7178719, 1.023322, 0, 0, 0, 1, 1,
1.566931, 0.3904228, 0.4600277, 1, 1, 1, 1, 1,
1.576198, 0.4207945, 1.18087, 1, 1, 1, 1, 1,
1.57663, -1.151783, 1.640497, 1, 1, 1, 1, 1,
1.577654, 1.430778, 1.646517, 1, 1, 1, 1, 1,
1.599549, -0.7873189, 0.31758, 1, 1, 1, 1, 1,
1.605116, -0.2615656, 0.0714547, 1, 1, 1, 1, 1,
1.620776, -0.9074489, 3.198163, 1, 1, 1, 1, 1,
1.623109, -0.871189, 2.041967, 1, 1, 1, 1, 1,
1.630361, -0.1532502, 0.6415057, 1, 1, 1, 1, 1,
1.639418, 0.5231675, 0.8199546, 1, 1, 1, 1, 1,
1.641164, 0.1388384, 1.827629, 1, 1, 1, 1, 1,
1.655475, -0.3814604, 0.972166, 1, 1, 1, 1, 1,
1.659008, 0.1867553, 2.654803, 1, 1, 1, 1, 1,
1.659385, 0.3393228, 1.30687, 1, 1, 1, 1, 1,
1.695736, 0.7185633, -0.6843053, 1, 1, 1, 1, 1,
1.706759, -0.2008318, 2.04108, 0, 0, 1, 1, 1,
1.70897, 0.2963548, 2.620718, 1, 0, 0, 1, 1,
1.710838, 1.327153, 0.4739677, 1, 0, 0, 1, 1,
1.717154, -0.4998003, 2.237156, 1, 0, 0, 1, 1,
1.72171, -0.1264711, 1.681792, 1, 0, 0, 1, 1,
1.724732, -0.5092571, 1.957306, 1, 0, 0, 1, 1,
1.770938, 0.3724513, -0.0432994, 0, 0, 0, 1, 1,
1.782861, 0.109969, 0.6670349, 0, 0, 0, 1, 1,
1.829906, -0.4321418, -0.0945805, 0, 0, 0, 1, 1,
1.832315, 0.8611482, 0.3398838, 0, 0, 0, 1, 1,
1.839341, 2.542207, 1.683808, 0, 0, 0, 1, 1,
1.893569, 1.441062, 0.4593767, 0, 0, 0, 1, 1,
1.897249, 0.6648508, 0.7952202, 0, 0, 0, 1, 1,
1.91193, -0.03622259, 2.778576, 1, 1, 1, 1, 1,
1.91501, -0.02065975, 0.9587168, 1, 1, 1, 1, 1,
1.93605, 0.4815826, 0.5797065, 1, 1, 1, 1, 1,
1.942737, 0.6059909, 0.05310399, 1, 1, 1, 1, 1,
1.951503, 0.04838932, 1.48631, 1, 1, 1, 1, 1,
1.961556, -0.1388001, 1.073605, 1, 1, 1, 1, 1,
1.968544, -0.3053539, 3.454245, 1, 1, 1, 1, 1,
1.990189, 0.3245693, 2.116389, 1, 1, 1, 1, 1,
1.991855, 0.5070889, 2.160593, 1, 1, 1, 1, 1,
2.018492, -0.78333, 2.036508, 1, 1, 1, 1, 1,
2.061839, -0.5991092, -0.1332165, 1, 1, 1, 1, 1,
2.076981, -0.3492337, 1.633186, 1, 1, 1, 1, 1,
2.080904, 1.915268, 0.04791472, 1, 1, 1, 1, 1,
2.14719, 1.253928, 0.61015, 1, 1, 1, 1, 1,
2.150637, -1.482102, 5.657576, 1, 1, 1, 1, 1,
2.160509, -0.9142102, 0.724937, 0, 0, 1, 1, 1,
2.180943, -1.173303, 2.500338, 1, 0, 0, 1, 1,
2.191724, 0.02024739, -0.4689966, 1, 0, 0, 1, 1,
2.231092, 1.752583, 3.373682, 1, 0, 0, 1, 1,
2.244683, 0.7234246, 0.881662, 1, 0, 0, 1, 1,
2.255149, 0.6822127, 1.772404, 1, 0, 0, 1, 1,
2.30397, 1.747021, -0.3443375, 0, 0, 0, 1, 1,
2.327976, 1.110268, 1.40114, 0, 0, 0, 1, 1,
2.334559, -0.2865801, 0.9463636, 0, 0, 0, 1, 1,
2.501251, -1.266879, 2.523278, 0, 0, 0, 1, 1,
2.50288, 0.6029558, 0.7091873, 0, 0, 0, 1, 1,
2.578779, 0.8279969, 0.887697, 0, 0, 0, 1, 1,
2.598793, -1.598176, 1.640242, 0, 0, 0, 1, 1,
2.603674, -1.018005, 3.496567, 1, 1, 1, 1, 1,
2.606733, -0.3394477, 1.430582, 1, 1, 1, 1, 1,
2.644797, -1.23224, 3.583298, 1, 1, 1, 1, 1,
2.6475, -0.07762811, -1.039365, 1, 1, 1, 1, 1,
2.812033, 0.3629334, 1.329843, 1, 1, 1, 1, 1,
2.815519, 1.620041, 1.540294, 1, 1, 1, 1, 1,
3.023487, -1.956689, 2.118261, 1, 1, 1, 1, 1
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
var radius = 9.956927;
var distance = 34.97328;
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
mvMatrix.translate( 0.1421747, 0.1043649, 0.1546121 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.97328);
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
