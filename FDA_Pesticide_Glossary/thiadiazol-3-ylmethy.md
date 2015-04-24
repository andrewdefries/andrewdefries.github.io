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
-3.054342, -0.1064276, 0.0832348, 1, 0, 0, 1,
-3.000764, 0.8877268, -1.040118, 1, 0.007843138, 0, 1,
-2.644904, -0.3435172, -0.7813975, 1, 0.01176471, 0, 1,
-2.479141, 0.5498806, -1.891379, 1, 0.01960784, 0, 1,
-2.450359, -0.9127234, -1.540136, 1, 0.02352941, 0, 1,
-2.422461, -0.2986089, -1.067541, 1, 0.03137255, 0, 1,
-2.378302, 0.3555317, -3.024713, 1, 0.03529412, 0, 1,
-2.295938, 0.4418789, -2.471758, 1, 0.04313726, 0, 1,
-2.279438, -0.6481308, -1.420897, 1, 0.04705882, 0, 1,
-2.255745, -0.5772637, -2.354073, 1, 0.05490196, 0, 1,
-2.230478, -1.307902, -1.623865, 1, 0.05882353, 0, 1,
-2.223795, -0.6918927, -2.428405, 1, 0.06666667, 0, 1,
-2.212818, -0.5109909, -0.4729194, 1, 0.07058824, 0, 1,
-2.170406, -0.646711, -3.385317, 1, 0.07843138, 0, 1,
-2.144289, 0.8685873, -0.8711496, 1, 0.08235294, 0, 1,
-2.124763, 0.7131909, -2.150916, 1, 0.09019608, 0, 1,
-2.042971, -0.6041782, -0.09896876, 1, 0.09411765, 0, 1,
-2.038248, 0.8865603, -0.3079361, 1, 0.1019608, 0, 1,
-2.008512, 0.2693702, -2.259633, 1, 0.1098039, 0, 1,
-2.002905, -1.36086, -2.318401, 1, 0.1137255, 0, 1,
-1.991766, 0.5033487, -0.7221119, 1, 0.1215686, 0, 1,
-1.963836, -1.405541, -1.710582, 1, 0.1254902, 0, 1,
-1.957073, -0.761194, -1.091428, 1, 0.1333333, 0, 1,
-1.937314, -0.2390172, -3.253555, 1, 0.1372549, 0, 1,
-1.921975, -2.232832, -2.687135, 1, 0.145098, 0, 1,
-1.908019, 0.6463674, -0.7137567, 1, 0.1490196, 0, 1,
-1.901103, -1.033477, -2.213348, 1, 0.1568628, 0, 1,
-1.853374, -0.6799935, -1.933212, 1, 0.1607843, 0, 1,
-1.849109, -1.060043, -3.492958, 1, 0.1686275, 0, 1,
-1.848591, 1.033381, -1.411509, 1, 0.172549, 0, 1,
-1.845037, 0.3150156, 0.6048929, 1, 0.1803922, 0, 1,
-1.841911, -0.4577898, -2.508901, 1, 0.1843137, 0, 1,
-1.825787, -0.7641086, -2.085799, 1, 0.1921569, 0, 1,
-1.816514, -0.2983322, -0.7569458, 1, 0.1960784, 0, 1,
-1.809381, -0.9225518, -2.678023, 1, 0.2039216, 0, 1,
-1.802859, -0.7342165, -1.618123, 1, 0.2117647, 0, 1,
-1.800389, 0.1078995, -1.154816, 1, 0.2156863, 0, 1,
-1.795761, 0.0007890005, -2.549486, 1, 0.2235294, 0, 1,
-1.761137, -0.4933204, -1.952564, 1, 0.227451, 0, 1,
-1.756317, -0.210988, -1.823226, 1, 0.2352941, 0, 1,
-1.751278, -0.7218679, -1.596678, 1, 0.2392157, 0, 1,
-1.750033, 2.454142, 0.5546895, 1, 0.2470588, 0, 1,
-1.7402, -0.5026602, -1.610492, 1, 0.2509804, 0, 1,
-1.734811, 0.7742313, 0.1720133, 1, 0.2588235, 0, 1,
-1.729939, 0.1445353, -2.314574, 1, 0.2627451, 0, 1,
-1.720303, -0.6855233, 0.4483677, 1, 0.2705882, 0, 1,
-1.713998, 1.222298, -0.1430027, 1, 0.2745098, 0, 1,
-1.699917, 0.6941947, -0.3985063, 1, 0.282353, 0, 1,
-1.697251, -0.3605188, -1.5602, 1, 0.2862745, 0, 1,
-1.697038, -2.475152, -2.653107, 1, 0.2941177, 0, 1,
-1.692252, 0.4011593, -3.105512, 1, 0.3019608, 0, 1,
-1.687771, 0.1737452, -0.8491015, 1, 0.3058824, 0, 1,
-1.681577, 0.3040689, -1.232835, 1, 0.3137255, 0, 1,
-1.675991, 0.604254, -0.7707011, 1, 0.3176471, 0, 1,
-1.667476, 1.083322, -0.9103548, 1, 0.3254902, 0, 1,
-1.658878, 0.1494517, -0.6421439, 1, 0.3294118, 0, 1,
-1.653007, 0.2813741, -0.3850293, 1, 0.3372549, 0, 1,
-1.65233, -1.422833, -0.971909, 1, 0.3411765, 0, 1,
-1.641065, -0.8533078, -1.784588, 1, 0.3490196, 0, 1,
-1.633665, 0.782455, -1.180263, 1, 0.3529412, 0, 1,
-1.61529, 2.82784, 0.7624254, 1, 0.3607843, 0, 1,
-1.604772, -0.3000002, -3.03458, 1, 0.3647059, 0, 1,
-1.601247, 0.8671043, -0.9132843, 1, 0.372549, 0, 1,
-1.590793, -0.5169434, -3.582806, 1, 0.3764706, 0, 1,
-1.581072, 1.374911, -0.2363972, 1, 0.3843137, 0, 1,
-1.538515, -0.9142826, -2.792068, 1, 0.3882353, 0, 1,
-1.537353, -0.9446487, -3.184249, 1, 0.3960784, 0, 1,
-1.515689, 0.01040022, -2.425183, 1, 0.4039216, 0, 1,
-1.511056, 1.350004, 0.7969855, 1, 0.4078431, 0, 1,
-1.504916, 0.4243861, -1.92709, 1, 0.4156863, 0, 1,
-1.493916, -0.4987645, -1.851962, 1, 0.4196078, 0, 1,
-1.48165, -0.1672976, -0.8735864, 1, 0.427451, 0, 1,
-1.466491, -0.1075017, -1.732718, 1, 0.4313726, 0, 1,
-1.455687, -0.01817882, -2.069912, 1, 0.4392157, 0, 1,
-1.449263, -1.319963, -2.281611, 1, 0.4431373, 0, 1,
-1.439842, 1.45197, 1.125498, 1, 0.4509804, 0, 1,
-1.42731, 0.6014047, -2.105904, 1, 0.454902, 0, 1,
-1.426994, -0.9811329, -1.92896, 1, 0.4627451, 0, 1,
-1.41934, 0.07242661, -2.299488, 1, 0.4666667, 0, 1,
-1.418179, 0.1874872, -3.594609, 1, 0.4745098, 0, 1,
-1.416104, -0.5141287, -2.664236, 1, 0.4784314, 0, 1,
-1.407135, 1.411742, -1.125065, 1, 0.4862745, 0, 1,
-1.401527, 0.3407024, -0.2362332, 1, 0.4901961, 0, 1,
-1.39465, -1.355697, -1.899073, 1, 0.4980392, 0, 1,
-1.391634, 1.201885, -2.45653, 1, 0.5058824, 0, 1,
-1.370808, -1.132379, -1.616111, 1, 0.509804, 0, 1,
-1.368001, -0.2841718, -0.5924227, 1, 0.5176471, 0, 1,
-1.367379, 0.5997832, -0.9695318, 1, 0.5215687, 0, 1,
-1.364323, 0.635547, -1.199821, 1, 0.5294118, 0, 1,
-1.349936, -0.4242133, -2.318944, 1, 0.5333334, 0, 1,
-1.343674, -0.4138486, -3.647077, 1, 0.5411765, 0, 1,
-1.339932, -0.3344267, -3.418294, 1, 0.5450981, 0, 1,
-1.332878, 0.7697408, -0.1420165, 1, 0.5529412, 0, 1,
-1.32941, 0.6273117, -1.842721, 1, 0.5568628, 0, 1,
-1.324129, 2.165916, -2.535784, 1, 0.5647059, 0, 1,
-1.323925, 0.6343914, -0.2993907, 1, 0.5686275, 0, 1,
-1.311693, 1.609413, 0.4413974, 1, 0.5764706, 0, 1,
-1.309004, -0.1781113, -1.613936, 1, 0.5803922, 0, 1,
-1.307329, 0.3678364, -1.346308, 1, 0.5882353, 0, 1,
-1.304788, -1.071471, -1.851907, 1, 0.5921569, 0, 1,
-1.30159, -0.5479372, -1.515326, 1, 0.6, 0, 1,
-1.300922, -0.056517, -0.4605813, 1, 0.6078432, 0, 1,
-1.300682, -0.3726861, -1.91411, 1, 0.6117647, 0, 1,
-1.292423, 2.553021, -0.7982211, 1, 0.6196079, 0, 1,
-1.274929, 1.44114, 0.4754003, 1, 0.6235294, 0, 1,
-1.27116, -0.9649175, -2.789246, 1, 0.6313726, 0, 1,
-1.268265, 1.534057, 0.6572128, 1, 0.6352941, 0, 1,
-1.260456, 1.175073, -1.655176, 1, 0.6431373, 0, 1,
-1.255587, 0.4134609, -1.783277, 1, 0.6470588, 0, 1,
-1.249049, -1.443396, -3.899318, 1, 0.654902, 0, 1,
-1.248517, 0.06994463, -1.291735, 1, 0.6588235, 0, 1,
-1.243211, -0.9805007, -3.489613, 1, 0.6666667, 0, 1,
-1.242115, 1.165024, -1.55625, 1, 0.6705883, 0, 1,
-1.241069, -1.108923, -1.136459, 1, 0.6784314, 0, 1,
-1.236677, -1.622273, -1.324066, 1, 0.682353, 0, 1,
-1.233176, -1.194093, -2.20052, 1, 0.6901961, 0, 1,
-1.232783, -1.078456, -2.338776, 1, 0.6941177, 0, 1,
-1.22826, -0.3319353, -0.2568207, 1, 0.7019608, 0, 1,
-1.225277, -0.0364903, 0.1166994, 1, 0.7098039, 0, 1,
-1.223884, -0.4304708, -1.316927, 1, 0.7137255, 0, 1,
-1.222194, 0.4518293, -0.536643, 1, 0.7215686, 0, 1,
-1.217089, 1.654452, -0.08048812, 1, 0.7254902, 0, 1,
-1.207914, -1.311609, -1.963378, 1, 0.7333333, 0, 1,
-1.207523, -0.3133062, -1.760069, 1, 0.7372549, 0, 1,
-1.206198, -0.5951406, -1.606264, 1, 0.7450981, 0, 1,
-1.203509, -0.8279088, -3.294269, 1, 0.7490196, 0, 1,
-1.198816, 0.06086016, -0.374694, 1, 0.7568628, 0, 1,
-1.183403, -0.01827022, -2.294409, 1, 0.7607843, 0, 1,
-1.183305, -0.7689241, -2.909674, 1, 0.7686275, 0, 1,
-1.177568, 0.1233907, -2.571975, 1, 0.772549, 0, 1,
-1.17157, -0.1559064, -0.07010972, 1, 0.7803922, 0, 1,
-1.164316, -0.4678579, -3.005944, 1, 0.7843137, 0, 1,
-1.163766, 0.02213001, -0.706691, 1, 0.7921569, 0, 1,
-1.14425, -0.7739637, -4.076683, 1, 0.7960784, 0, 1,
-1.139201, -0.1696049, -3.365554, 1, 0.8039216, 0, 1,
-1.128605, 0.3385937, -2.071914, 1, 0.8117647, 0, 1,
-1.128198, 0.2366788, 0.5348774, 1, 0.8156863, 0, 1,
-1.125993, -1.171154, -2.15327, 1, 0.8235294, 0, 1,
-1.114639, -0.955097, -3.803718, 1, 0.827451, 0, 1,
-1.114531, -0.4937922, -3.16524, 1, 0.8352941, 0, 1,
-1.113037, -0.6996907, -2.6801, 1, 0.8392157, 0, 1,
-1.107369, -0.7844998, -0.6284775, 1, 0.8470588, 0, 1,
-1.102203, 0.2483287, -2.123116, 1, 0.8509804, 0, 1,
-1.097359, 0.6364517, -1.618946, 1, 0.8588235, 0, 1,
-1.097085, 0.9881322, -0.4538644, 1, 0.8627451, 0, 1,
-1.094546, 1.638453, -0.9934111, 1, 0.8705882, 0, 1,
-1.087093, -0.535074, -1.556707, 1, 0.8745098, 0, 1,
-1.080956, -1.141841, -2.042601, 1, 0.8823529, 0, 1,
-1.070235, -1.082956, -2.650267, 1, 0.8862745, 0, 1,
-1.065233, -0.294235, -2.366624, 1, 0.8941177, 0, 1,
-1.064139, -0.1426594, -1.774803, 1, 0.8980392, 0, 1,
-1.051638, 1.654895, 0.8496253, 1, 0.9058824, 0, 1,
-1.046716, -2.224651, -2.079585, 1, 0.9137255, 0, 1,
-1.045725, -0.94276, -2.727409, 1, 0.9176471, 0, 1,
-1.045125, 1.293245, 0.4747924, 1, 0.9254902, 0, 1,
-1.043588, -1.858952, -2.66622, 1, 0.9294118, 0, 1,
-1.042726, 0.4601849, 0.6397562, 1, 0.9372549, 0, 1,
-1.042243, -0.0429713, -2.172404, 1, 0.9411765, 0, 1,
-1.041806, -0.9476344, -1.178078, 1, 0.9490196, 0, 1,
-1.041045, -1.583957, -3.775218, 1, 0.9529412, 0, 1,
-1.035562, -1.3402, -2.676126, 1, 0.9607843, 0, 1,
-1.029219, 2.108522, 0.7845566, 1, 0.9647059, 0, 1,
-1.026194, -0.4235332, -0.5868736, 1, 0.972549, 0, 1,
-1.02322, 0.08340061, -1.275715, 1, 0.9764706, 0, 1,
-1.017428, -1.716777, -3.395113, 1, 0.9843137, 0, 1,
-1.015989, -2.017632, -2.30893, 1, 0.9882353, 0, 1,
-1.015602, -0.982276, -2.444912, 1, 0.9960784, 0, 1,
-1.011139, 1.298701, 0.8520479, 0.9960784, 1, 0, 1,
-1.008828, 0.6728911, -1.847039, 0.9921569, 1, 0, 1,
-1.006866, 1.152943, 0.5536616, 0.9843137, 1, 0, 1,
-1.004244, -0.03736727, -1.368665, 0.9803922, 1, 0, 1,
-1.00374, 1.931166, 0.2191243, 0.972549, 1, 0, 1,
-1.003233, 0.563921, -1.2837, 0.9686275, 1, 0, 1,
-0.9972439, 2.619407, 0.1122774, 0.9607843, 1, 0, 1,
-0.9890351, 0.6308483, 0.9250095, 0.9568627, 1, 0, 1,
-0.988496, -1.442241, -2.017239, 0.9490196, 1, 0, 1,
-0.9878137, -0.3957149, -4.093819, 0.945098, 1, 0, 1,
-0.9838249, 0.0160754, -0.6485289, 0.9372549, 1, 0, 1,
-0.9757825, 0.3521065, -0.5293652, 0.9333333, 1, 0, 1,
-0.9677514, -1.083482, -3.420245, 0.9254902, 1, 0, 1,
-0.9633895, 0.3030336, -1.554626, 0.9215686, 1, 0, 1,
-0.9615059, 0.001642552, -2.599831, 0.9137255, 1, 0, 1,
-0.9490303, -1.017899, -2.067475, 0.9098039, 1, 0, 1,
-0.9432002, -0.9876323, -2.332799, 0.9019608, 1, 0, 1,
-0.9379846, -1.265905, -3.927408, 0.8941177, 1, 0, 1,
-0.9341056, -1.568061, -2.528851, 0.8901961, 1, 0, 1,
-0.932445, 1.241724, -1.342454, 0.8823529, 1, 0, 1,
-0.9306064, -0.5079403, -1.854092, 0.8784314, 1, 0, 1,
-0.9293984, 0.2836913, -2.452365, 0.8705882, 1, 0, 1,
-0.9215316, -0.1223989, -1.937109, 0.8666667, 1, 0, 1,
-0.9200832, 1.026019, 1.731747, 0.8588235, 1, 0, 1,
-0.9178098, -1.021937, -2.105775, 0.854902, 1, 0, 1,
-0.9151029, 0.3990939, -0.1548143, 0.8470588, 1, 0, 1,
-0.9134106, 0.220548, -0.04623378, 0.8431373, 1, 0, 1,
-0.9110476, 0.04528056, -2.674892, 0.8352941, 1, 0, 1,
-0.9059955, 1.353268, -1.632236, 0.8313726, 1, 0, 1,
-0.904169, -0.3552267, -0.6719819, 0.8235294, 1, 0, 1,
-0.9034422, 0.02595281, -2.003361, 0.8196079, 1, 0, 1,
-0.9010933, 1.57256, -2.578619, 0.8117647, 1, 0, 1,
-0.8742079, 0.346938, 0.6360146, 0.8078431, 1, 0, 1,
-0.8685502, -0.5760999, -3.584481, 0.8, 1, 0, 1,
-0.8655376, -0.493264, -1.443762, 0.7921569, 1, 0, 1,
-0.8626525, 0.003862788, -2.727874, 0.7882353, 1, 0, 1,
-0.8623813, -0.1091312, -1.793371, 0.7803922, 1, 0, 1,
-0.8609058, 1.773934, -0.9223468, 0.7764706, 1, 0, 1,
-0.8501296, -0.7924588, -2.209464, 0.7686275, 1, 0, 1,
-0.8409673, -0.2798368, -1.665689, 0.7647059, 1, 0, 1,
-0.8353743, 0.5931684, -1.691753, 0.7568628, 1, 0, 1,
-0.8284894, 1.426836, -1.361751, 0.7529412, 1, 0, 1,
-0.8243214, -1.697718, -1.397429, 0.7450981, 1, 0, 1,
-0.8227721, -1.486944, -2.937925, 0.7411765, 1, 0, 1,
-0.8220027, 0.5021734, -2.183087, 0.7333333, 1, 0, 1,
-0.8196371, -0.5457542, -3.293778, 0.7294118, 1, 0, 1,
-0.8192828, -2.000317, -5.409667, 0.7215686, 1, 0, 1,
-0.8122998, -0.8901457, -2.34596, 0.7176471, 1, 0, 1,
-0.7898282, -0.7007481, -3.006903, 0.7098039, 1, 0, 1,
-0.7892199, -0.08043642, -1.948551, 0.7058824, 1, 0, 1,
-0.7836768, 0.5935277, -1.942509, 0.6980392, 1, 0, 1,
-0.7747387, 0.04802334, -1.253055, 0.6901961, 1, 0, 1,
-0.7545208, -0.05725938, -1.027797, 0.6862745, 1, 0, 1,
-0.7455616, -0.5151303, -2.363984, 0.6784314, 1, 0, 1,
-0.7410201, 0.7033069, -2.290512, 0.6745098, 1, 0, 1,
-0.7365183, -0.9328133, -4.128476, 0.6666667, 1, 0, 1,
-0.729482, -0.2547414, -1.081308, 0.6627451, 1, 0, 1,
-0.7277005, 0.1667158, -2.682212, 0.654902, 1, 0, 1,
-0.7262818, 0.06407744, -1.798409, 0.6509804, 1, 0, 1,
-0.7212313, -1.869895, -3.494651, 0.6431373, 1, 0, 1,
-0.7129189, 0.3462639, -0.7843348, 0.6392157, 1, 0, 1,
-0.7101273, 0.4413674, -0.8348254, 0.6313726, 1, 0, 1,
-0.7006757, -0.4490683, -0.9648195, 0.627451, 1, 0, 1,
-0.6998721, 0.260042, -1.957504, 0.6196079, 1, 0, 1,
-0.6991261, -0.3858837, -1.706091, 0.6156863, 1, 0, 1,
-0.6990273, -0.4099133, -2.582567, 0.6078432, 1, 0, 1,
-0.6976389, 1.362215, -0.1364106, 0.6039216, 1, 0, 1,
-0.6974255, -0.3568464, -1.099685, 0.5960785, 1, 0, 1,
-0.695553, -1.489214, -3.188138, 0.5882353, 1, 0, 1,
-0.695126, -0.03305519, -2.347703, 0.5843138, 1, 0, 1,
-0.6864169, -1.633023, -0.7935225, 0.5764706, 1, 0, 1,
-0.683431, 1.528379, -1.190006, 0.572549, 1, 0, 1,
-0.6819466, 1.125751, -0.1281992, 0.5647059, 1, 0, 1,
-0.6818638, 0.4745539, -0.334686, 0.5607843, 1, 0, 1,
-0.6795052, -0.8158802, -0.4805987, 0.5529412, 1, 0, 1,
-0.6781093, 0.6777031, -0.9174061, 0.5490196, 1, 0, 1,
-0.6737854, -0.1884209, -2.6151, 0.5411765, 1, 0, 1,
-0.6735401, 0.8327961, -0.1224335, 0.5372549, 1, 0, 1,
-0.6723735, -2.469568, -3.123671, 0.5294118, 1, 0, 1,
-0.6679572, 0.716795, -0.8378093, 0.5254902, 1, 0, 1,
-0.6660919, -2.083373, -2.659967, 0.5176471, 1, 0, 1,
-0.6636906, 0.9972461, -1.386889, 0.5137255, 1, 0, 1,
-0.6636868, -0.07580577, -1.105255, 0.5058824, 1, 0, 1,
-0.6616479, -0.2416854, -1.211356, 0.5019608, 1, 0, 1,
-0.6611285, 0.1871064, 0.5333592, 0.4941176, 1, 0, 1,
-0.659695, 0.7230638, -1.248061, 0.4862745, 1, 0, 1,
-0.6557287, 0.5140731, -0.8799312, 0.4823529, 1, 0, 1,
-0.6533288, -1.822295, -1.783974, 0.4745098, 1, 0, 1,
-0.6461795, -0.8168137, -3.340019, 0.4705882, 1, 0, 1,
-0.644622, -1.233675, -3.191229, 0.4627451, 1, 0, 1,
-0.6415244, -1.036341, -3.147575, 0.4588235, 1, 0, 1,
-0.6375456, 0.2046059, -2.256095, 0.4509804, 1, 0, 1,
-0.6372175, 0.8561646, 0.211352, 0.4470588, 1, 0, 1,
-0.6362032, -0.1907468, -3.14325, 0.4392157, 1, 0, 1,
-0.633536, 1.406644, -2.202544, 0.4352941, 1, 0, 1,
-0.6287089, -2.017528, -0.5162509, 0.427451, 1, 0, 1,
-0.6277363, 1.416314, 1.677657, 0.4235294, 1, 0, 1,
-0.6273406, 0.9111662, -0.6845021, 0.4156863, 1, 0, 1,
-0.62674, -0.5899386, -2.407336, 0.4117647, 1, 0, 1,
-0.6242431, -1.557123, -2.981626, 0.4039216, 1, 0, 1,
-0.6203512, 1.218561, -0.5120363, 0.3960784, 1, 0, 1,
-0.6190258, 0.03465973, -4.040283, 0.3921569, 1, 0, 1,
-0.6143787, -0.1858361, -2.318398, 0.3843137, 1, 0, 1,
-0.6123015, 0.2449263, -0.06269161, 0.3803922, 1, 0, 1,
-0.6100605, -1.599395, -2.149003, 0.372549, 1, 0, 1,
-0.6097694, 0.4294844, -0.4687047, 0.3686275, 1, 0, 1,
-0.6038061, 0.4929803, -1.016063, 0.3607843, 1, 0, 1,
-0.6019664, 0.8209159, 0.8773367, 0.3568628, 1, 0, 1,
-0.5999412, 0.5715567, -1.394047, 0.3490196, 1, 0, 1,
-0.5983151, -0.6593033, -3.350811, 0.345098, 1, 0, 1,
-0.5973038, 0.7522394, 0.6783913, 0.3372549, 1, 0, 1,
-0.5961196, -0.7787697, -0.4339215, 0.3333333, 1, 0, 1,
-0.5945248, -0.8888494, -2.96931, 0.3254902, 1, 0, 1,
-0.5928934, -0.2670879, -2.970147, 0.3215686, 1, 0, 1,
-0.5909251, -0.6537587, -3.278301, 0.3137255, 1, 0, 1,
-0.5880576, -0.6966254, -2.0049, 0.3098039, 1, 0, 1,
-0.5870028, -0.2402827, -1.958452, 0.3019608, 1, 0, 1,
-0.5842008, 1.141234, -0.7476202, 0.2941177, 1, 0, 1,
-0.5841245, -1.71417, -3.737262, 0.2901961, 1, 0, 1,
-0.5833177, -0.202909, -2.768727, 0.282353, 1, 0, 1,
-0.5827147, -1.524612, -3.109081, 0.2784314, 1, 0, 1,
-0.5820952, 1.083379, -1.901457, 0.2705882, 1, 0, 1,
-0.5785881, 0.01884613, 0.1363221, 0.2666667, 1, 0, 1,
-0.5712849, -0.2142837, -2.238941, 0.2588235, 1, 0, 1,
-0.5692931, 0.276964, -0.8513627, 0.254902, 1, 0, 1,
-0.5685254, 0.5032688, -1.53436, 0.2470588, 1, 0, 1,
-0.5654764, 0.4696591, -1.288403, 0.2431373, 1, 0, 1,
-0.5629866, 1.493269, -0.8597774, 0.2352941, 1, 0, 1,
-0.5609244, -2.203279, -2.617534, 0.2313726, 1, 0, 1,
-0.5608798, -0.009563578, -0.654635, 0.2235294, 1, 0, 1,
-0.5582962, -0.4054783, -1.08601, 0.2196078, 1, 0, 1,
-0.5558843, -0.8425361, -3.804578, 0.2117647, 1, 0, 1,
-0.5530659, -1.782705, -3.835652, 0.2078431, 1, 0, 1,
-0.5483552, 0.4326886, 1.591301, 0.2, 1, 0, 1,
-0.546392, -0.150169, -1.294726, 0.1921569, 1, 0, 1,
-0.5438533, 0.6060637, -1.30016, 0.1882353, 1, 0, 1,
-0.5351536, 1.299027, -1.307341, 0.1803922, 1, 0, 1,
-0.527999, -0.0615675, -1.110558, 0.1764706, 1, 0, 1,
-0.5262295, 0.7402019, -0.57727, 0.1686275, 1, 0, 1,
-0.5211685, 1.310103, 0.2179516, 0.1647059, 1, 0, 1,
-0.5187314, -0.9282978, -2.792522, 0.1568628, 1, 0, 1,
-0.5173515, 1.227373, -1.3978, 0.1529412, 1, 0, 1,
-0.5144408, 0.02105181, -0.2379018, 0.145098, 1, 0, 1,
-0.5120723, -0.1379493, -0.2884821, 0.1411765, 1, 0, 1,
-0.5113113, -0.6414202, -2.237344, 0.1333333, 1, 0, 1,
-0.5103968, -1.406737, -1.821916, 0.1294118, 1, 0, 1,
-0.5069335, -0.06656982, -1.983532, 0.1215686, 1, 0, 1,
-0.5006829, 2.188007, -0.7552143, 0.1176471, 1, 0, 1,
-0.4980853, 1.43946, 1.133384, 0.1098039, 1, 0, 1,
-0.4967589, -0.4178709, -3.276139, 0.1058824, 1, 0, 1,
-0.4913604, 0.5427631, -0.7158915, 0.09803922, 1, 0, 1,
-0.4908606, -0.542244, -2.551119, 0.09019608, 1, 0, 1,
-0.4877519, -0.4321021, -1.702933, 0.08627451, 1, 0, 1,
-0.4876644, 0.7185482, 0.8898689, 0.07843138, 1, 0, 1,
-0.4872642, -1.563025, -2.642808, 0.07450981, 1, 0, 1,
-0.4871888, -0.3120362, -3.223367, 0.06666667, 1, 0, 1,
-0.481178, 2.687107, -0.4999874, 0.0627451, 1, 0, 1,
-0.4811044, -0.9374827, -3.537167, 0.05490196, 1, 0, 1,
-0.4750265, 1.333361, -1.118973, 0.05098039, 1, 0, 1,
-0.4718729, 0.3713752, 0.5594122, 0.04313726, 1, 0, 1,
-0.4710854, 1.442077, 0.9588279, 0.03921569, 1, 0, 1,
-0.4700675, 1.091542, -0.2764028, 0.03137255, 1, 0, 1,
-0.4681996, -1.721697, -0.8776185, 0.02745098, 1, 0, 1,
-0.4678659, -1.008197, -1.484472, 0.01960784, 1, 0, 1,
-0.4618795, 0.02500952, -2.957248, 0.01568628, 1, 0, 1,
-0.4590627, -0.2375091, -1.299925, 0.007843138, 1, 0, 1,
-0.4534446, 0.203752, -0.08259788, 0.003921569, 1, 0, 1,
-0.4415393, -2.04852, -2.749732, 0, 1, 0.003921569, 1,
-0.4343502, -0.8438813, -1.660008, 0, 1, 0.01176471, 1,
-0.4333178, 1.238566, 0.3248796, 0, 1, 0.01568628, 1,
-0.4308977, -2.83931, -2.969058, 0, 1, 0.02352941, 1,
-0.4305066, -1.582816, -2.90285, 0, 1, 0.02745098, 1,
-0.4239243, -0.1824549, -0.8716273, 0, 1, 0.03529412, 1,
-0.4219349, -1.174101, -2.520264, 0, 1, 0.03921569, 1,
-0.4174007, -0.4492145, -3.106189, 0, 1, 0.04705882, 1,
-0.415789, 0.8948075, 0.04991275, 0, 1, 0.05098039, 1,
-0.4156734, 0.03018719, -0.1146541, 0, 1, 0.05882353, 1,
-0.414257, 1.788933, -0.1397044, 0, 1, 0.0627451, 1,
-0.4062214, -1.655118, -3.178559, 0, 1, 0.07058824, 1,
-0.4048868, -0.6751887, -2.784353, 0, 1, 0.07450981, 1,
-0.4005242, 0.5675595, -0.9143079, 0, 1, 0.08235294, 1,
-0.3999578, -1.009765, -1.775619, 0, 1, 0.08627451, 1,
-0.397115, 0.3799295, -0.143071, 0, 1, 0.09411765, 1,
-0.3969447, -1.291633, -3.950141, 0, 1, 0.1019608, 1,
-0.393459, -0.4252524, -2.669301, 0, 1, 0.1058824, 1,
-0.38632, 1.008292, -0.1600947, 0, 1, 0.1137255, 1,
-0.3826171, 0.5692385, 0.233555, 0, 1, 0.1176471, 1,
-0.3792865, 1.840633, 1.783707, 0, 1, 0.1254902, 1,
-0.378179, 0.9859386, 0.401508, 0, 1, 0.1294118, 1,
-0.3747565, 0.5983859, -2.638377, 0, 1, 0.1372549, 1,
-0.3739108, 0.1988046, 0.9031298, 0, 1, 0.1411765, 1,
-0.3658967, 1.198263, -0.1246072, 0, 1, 0.1490196, 1,
-0.3611369, 1.067241, -1.017884, 0, 1, 0.1529412, 1,
-0.3569845, -1.538976, -1.777154, 0, 1, 0.1607843, 1,
-0.3543848, -0.05215209, -1.036288, 0, 1, 0.1647059, 1,
-0.3532736, 0.7400875, -0.6417761, 0, 1, 0.172549, 1,
-0.3505144, 1.678709, -0.314461, 0, 1, 0.1764706, 1,
-0.3493109, 0.8301776, 0.08350614, 0, 1, 0.1843137, 1,
-0.3466211, 0.2945575, -0.9388113, 0, 1, 0.1882353, 1,
-0.3425244, 0.02824999, -1.368109, 0, 1, 0.1960784, 1,
-0.3418258, 0.03311721, -0.4416795, 0, 1, 0.2039216, 1,
-0.3384579, 0.2838292, -0.5724098, 0, 1, 0.2078431, 1,
-0.335752, 0.3830771, 1.320023, 0, 1, 0.2156863, 1,
-0.3347244, 0.6378449, -0.84976, 0, 1, 0.2196078, 1,
-0.3309736, -1.254539, -3.244264, 0, 1, 0.227451, 1,
-0.3278564, -0.3333568, -0.6203939, 0, 1, 0.2313726, 1,
-0.3261833, -0.7329925, -2.860343, 0, 1, 0.2392157, 1,
-0.3256797, 0.2013198, -1.888809, 0, 1, 0.2431373, 1,
-0.3239573, 0.1649368, -0.5295499, 0, 1, 0.2509804, 1,
-0.3224165, 2.423115, -0.163586, 0, 1, 0.254902, 1,
-0.3204973, -0.7728626, -2.38627, 0, 1, 0.2627451, 1,
-0.3141895, -0.7131914, -3.30545, 0, 1, 0.2666667, 1,
-0.3141387, 1.970386, -1.473011, 0, 1, 0.2745098, 1,
-0.3116302, 1.251356, -1.008166, 0, 1, 0.2784314, 1,
-0.309721, 0.1187313, -1.424998, 0, 1, 0.2862745, 1,
-0.2960965, 0.2904718, -1.33039, 0, 1, 0.2901961, 1,
-0.2912753, -0.1257676, -1.598419, 0, 1, 0.2980392, 1,
-0.2910021, 1.904055, -0.8972545, 0, 1, 0.3058824, 1,
-0.2899383, 0.08426932, -1.768991, 0, 1, 0.3098039, 1,
-0.2883723, -1.76348, -4.279755, 0, 1, 0.3176471, 1,
-0.2874928, 0.2290521, -1.033744, 0, 1, 0.3215686, 1,
-0.2870265, -0.2795202, -2.618405, 0, 1, 0.3294118, 1,
-0.2821289, -1.019365, -2.920818, 0, 1, 0.3333333, 1,
-0.2767151, -0.06723427, -1.876509, 0, 1, 0.3411765, 1,
-0.2765906, -0.7045537, -3.520111, 0, 1, 0.345098, 1,
-0.274278, 0.7891268, 0.5528024, 0, 1, 0.3529412, 1,
-0.2699571, 1.047165, -0.1029065, 0, 1, 0.3568628, 1,
-0.2606892, -1.38041, -1.321273, 0, 1, 0.3647059, 1,
-0.2549939, 1.449543, -1.019138, 0, 1, 0.3686275, 1,
-0.2547966, 0.121917, -0.7177601, 0, 1, 0.3764706, 1,
-0.2441351, 0.3853551, -0.414517, 0, 1, 0.3803922, 1,
-0.2412361, 0.1327527, -1.313058, 0, 1, 0.3882353, 1,
-0.2402929, 0.9247766, -0.4313542, 0, 1, 0.3921569, 1,
-0.2393947, 1.082096, 0.9265352, 0, 1, 0.4, 1,
-0.2368098, -1.189649, -3.295347, 0, 1, 0.4078431, 1,
-0.2349921, -1.434837, -3.81354, 0, 1, 0.4117647, 1,
-0.2347648, 1.82933, -0.948806, 0, 1, 0.4196078, 1,
-0.2338991, 0.4925232, 0.5637205, 0, 1, 0.4235294, 1,
-0.229796, -0.1003609, -2.367171, 0, 1, 0.4313726, 1,
-0.2247728, -0.9986416, -2.702697, 0, 1, 0.4352941, 1,
-0.2227974, 0.2771475, -0.110538, 0, 1, 0.4431373, 1,
-0.221775, -1.356113, -2.61023, 0, 1, 0.4470588, 1,
-0.2199836, -0.1188584, -2.771272, 0, 1, 0.454902, 1,
-0.2053065, 0.3492332, -0.9885128, 0, 1, 0.4588235, 1,
-0.2052117, 2.649452, 0.1366728, 0, 1, 0.4666667, 1,
-0.2048856, -0.8227808, -2.917327, 0, 1, 0.4705882, 1,
-0.2010572, 0.9302893, -0.07720453, 0, 1, 0.4784314, 1,
-0.1851444, 0.6683264, -1.734147, 0, 1, 0.4823529, 1,
-0.1847223, 1.960429, -0.6492099, 0, 1, 0.4901961, 1,
-0.1842778, 0.1419069, 0.309159, 0, 1, 0.4941176, 1,
-0.1731339, -2.143097, -1.698856, 0, 1, 0.5019608, 1,
-0.171652, -0.7789738, -3.283736, 0, 1, 0.509804, 1,
-0.158423, -0.3099369, -2.319815, 0, 1, 0.5137255, 1,
-0.1554133, -1.459479, -4.987278, 0, 1, 0.5215687, 1,
-0.1525117, -1.297993, -1.711685, 0, 1, 0.5254902, 1,
-0.1503793, -0.6334609, -3.791731, 0, 1, 0.5333334, 1,
-0.1487991, 2.830945, 0.08318646, 0, 1, 0.5372549, 1,
-0.1477293, -1.316643, -1.804146, 0, 1, 0.5450981, 1,
-0.1458985, -1.068484, -2.859424, 0, 1, 0.5490196, 1,
-0.1453438, 0.09892438, -1.361604, 0, 1, 0.5568628, 1,
-0.1442642, -0.7331092, -3.854301, 0, 1, 0.5607843, 1,
-0.1439842, 0.5428649, 0.5734028, 0, 1, 0.5686275, 1,
-0.1388212, -0.7105229, -3.123092, 0, 1, 0.572549, 1,
-0.13826, 0.01271509, -2.040733, 0, 1, 0.5803922, 1,
-0.1337216, 0.6327236, -1.919904, 0, 1, 0.5843138, 1,
-0.1287186, -1.310138, -3.127248, 0, 1, 0.5921569, 1,
-0.1286752, -1.229492, -2.743862, 0, 1, 0.5960785, 1,
-0.1285538, -1.803016, -4.701061, 0, 1, 0.6039216, 1,
-0.1209649, -1.763504, -4.188326, 0, 1, 0.6117647, 1,
-0.1178395, -0.9373507, -2.623537, 0, 1, 0.6156863, 1,
-0.1163929, -0.9942985, -3.251244, 0, 1, 0.6235294, 1,
-0.1133925, 1.702891, 0.3515551, 0, 1, 0.627451, 1,
-0.1045778, -0.9040875, -2.906811, 0, 1, 0.6352941, 1,
-0.1034571, -0.3252745, -2.502642, 0, 1, 0.6392157, 1,
-0.1018113, 0.3977828, -1.522644, 0, 1, 0.6470588, 1,
-0.09596485, -0.2468093, -2.289139, 0, 1, 0.6509804, 1,
-0.08943557, 0.4888428, -0.7479751, 0, 1, 0.6588235, 1,
-0.07457515, 0.2192955, -0.6134095, 0, 1, 0.6627451, 1,
-0.07144767, -0.01215018, -1.164124, 0, 1, 0.6705883, 1,
-0.06879831, -1.131336, -1.726038, 0, 1, 0.6745098, 1,
-0.0683109, -0.6720441, -3.62347, 0, 1, 0.682353, 1,
-0.06226957, -0.3964322, -2.456793, 0, 1, 0.6862745, 1,
-0.05553411, -0.05097002, -3.090719, 0, 1, 0.6941177, 1,
-0.05392266, 0.1438714, 0.3221545, 0, 1, 0.7019608, 1,
-0.04820234, 0.390532, -0.5320668, 0, 1, 0.7058824, 1,
-0.04486394, 0.1350852, -2.231465, 0, 1, 0.7137255, 1,
-0.0444081, -0.2519615, -1.815297, 0, 1, 0.7176471, 1,
-0.04434767, 0.3937075, 0.452419, 0, 1, 0.7254902, 1,
-0.04155614, -0.7582383, -2.703712, 0, 1, 0.7294118, 1,
-0.03960434, 0.3103881, 0.1426986, 0, 1, 0.7372549, 1,
-0.03880929, -0.490141, -3.541827, 0, 1, 0.7411765, 1,
-0.03333983, 0.4038346, -1.15718, 0, 1, 0.7490196, 1,
-0.03195738, -0.6659935, -1.86365, 0, 1, 0.7529412, 1,
-0.03054035, -1.775862, -3.378806, 0, 1, 0.7607843, 1,
-0.02952085, -0.04874133, -2.69337, 0, 1, 0.7647059, 1,
-0.02915826, -0.2682686, -3.049491, 0, 1, 0.772549, 1,
-0.02793116, 0.9293849, -1.021847, 0, 1, 0.7764706, 1,
-0.02752403, -0.05286112, -1.193152, 0, 1, 0.7843137, 1,
-0.02599372, 1.149518, 1.103249, 0, 1, 0.7882353, 1,
-0.02450398, 1.063629, 0.991445, 0, 1, 0.7960784, 1,
-0.02423883, 0.01919988, -2.045888, 0, 1, 0.8039216, 1,
-0.02374917, 1.140389, 0.6601894, 0, 1, 0.8078431, 1,
-0.02242603, -0.8100091, -3.285937, 0, 1, 0.8156863, 1,
-0.02018467, 0.7862489, -0.4938761, 0, 1, 0.8196079, 1,
-0.01988318, -0.457938, -3.840297, 0, 1, 0.827451, 1,
-0.01755537, 0.9910195, -0.1718847, 0, 1, 0.8313726, 1,
-0.01567668, 1.257076, 0.7270178, 0, 1, 0.8392157, 1,
-0.01369121, 1.10651, 0.8544589, 0, 1, 0.8431373, 1,
-0.01346078, 1.035178, 0.3511828, 0, 1, 0.8509804, 1,
-0.01102204, 1.572562, -1.314193, 0, 1, 0.854902, 1,
-0.003874965, -0.2295966, -3.008584, 0, 1, 0.8627451, 1,
-0.003322638, -0.1551392, -3.880732, 0, 1, 0.8666667, 1,
-0.003221012, 0.509567, 2.183913, 0, 1, 0.8745098, 1,
-0.001954705, -0.6051998, -3.831201, 0, 1, 0.8784314, 1,
-0.001123767, -1.48461, -3.192745, 0, 1, 0.8862745, 1,
0.0004335033, 1.285911, 1.275386, 0, 1, 0.8901961, 1,
0.0007977311, 0.3839775, 0.4734747, 0, 1, 0.8980392, 1,
0.001300874, -1.883759, 1.962471, 0, 1, 0.9058824, 1,
0.002645246, -0.5558018, 1.302549, 0, 1, 0.9098039, 1,
0.005067186, -0.9230239, 4.642715, 0, 1, 0.9176471, 1,
0.006900786, 0.6720904, 0.2249226, 0, 1, 0.9215686, 1,
0.007487261, 0.2744304, -0.7457134, 0, 1, 0.9294118, 1,
0.009308912, -1.028514, 4.059547, 0, 1, 0.9333333, 1,
0.01000611, 0.03379828, -0.7913191, 0, 1, 0.9411765, 1,
0.01615459, -0.438631, 2.974091, 0, 1, 0.945098, 1,
0.01797188, -0.8429376, 2.587041, 0, 1, 0.9529412, 1,
0.02311107, -0.7242579, 3.341928, 0, 1, 0.9568627, 1,
0.02704042, 1.362337, -0.6161163, 0, 1, 0.9647059, 1,
0.02917408, 1.929453, 0.1647973, 0, 1, 0.9686275, 1,
0.03085003, -0.8527125, 2.197257, 0, 1, 0.9764706, 1,
0.03156197, 0.4107487, -0.756999, 0, 1, 0.9803922, 1,
0.03176738, -0.4089781, 4.570323, 0, 1, 0.9882353, 1,
0.03249055, 1.647651, -0.03532296, 0, 1, 0.9921569, 1,
0.0367657, -0.8530668, 5.265456, 0, 1, 1, 1,
0.04158062, -0.0130645, 2.089204, 0, 0.9921569, 1, 1,
0.04801563, 1.599791, 0.02867989, 0, 0.9882353, 1, 1,
0.05465996, 1.230945, -0.3586046, 0, 0.9803922, 1, 1,
0.06029651, -2.263218, 2.699689, 0, 0.9764706, 1, 1,
0.06515455, 2.266647, -1.02865, 0, 0.9686275, 1, 1,
0.07078241, 0.7562689, 0.6431878, 0, 0.9647059, 1, 1,
0.07332977, 1.370277, -0.987649, 0, 0.9568627, 1, 1,
0.07711087, -1.079003, 1.882851, 0, 0.9529412, 1, 1,
0.07879751, -0.3483928, 3.046057, 0, 0.945098, 1, 1,
0.07896223, 0.8351817, 0.7922516, 0, 0.9411765, 1, 1,
0.08142041, -1.703935, 3.850668, 0, 0.9333333, 1, 1,
0.08884891, -2.450223, 2.172531, 0, 0.9294118, 1, 1,
0.0952243, 0.6614324, -0.08480872, 0, 0.9215686, 1, 1,
0.09551366, 2.014062, -0.2078808, 0, 0.9176471, 1, 1,
0.09689647, 0.2738301, -0.2707893, 0, 0.9098039, 1, 1,
0.101504, 1.333118, -3.093225, 0, 0.9058824, 1, 1,
0.1023369, -0.4132206, 4.032917, 0, 0.8980392, 1, 1,
0.1034374, -0.1771378, 2.811626, 0, 0.8901961, 1, 1,
0.1036459, 0.4454435, 0.1566812, 0, 0.8862745, 1, 1,
0.1041716, -1.354147, 2.374198, 0, 0.8784314, 1, 1,
0.1045565, -0.0402424, 2.919324, 0, 0.8745098, 1, 1,
0.1068003, -0.8999969, 5.012263, 0, 0.8666667, 1, 1,
0.1100432, -0.8708257, 4.379152, 0, 0.8627451, 1, 1,
0.1122179, -0.4811719, 1.914083, 0, 0.854902, 1, 1,
0.1139832, 0.1279366, -0.2497396, 0, 0.8509804, 1, 1,
0.1148457, 1.025174, -0.478361, 0, 0.8431373, 1, 1,
0.1151142, 0.8126329, 0.5908077, 0, 0.8392157, 1, 1,
0.1165218, 0.1708498, 1.30911, 0, 0.8313726, 1, 1,
0.1173015, 1.008224, 1.089249, 0, 0.827451, 1, 1,
0.1225975, -0.7863311, 3.022878, 0, 0.8196079, 1, 1,
0.1246831, 1.186773, 1.162986, 0, 0.8156863, 1, 1,
0.124976, 0.2541379, 0.3164282, 0, 0.8078431, 1, 1,
0.1281798, -0.0412991, 0.01632972, 0, 0.8039216, 1, 1,
0.1359955, 0.841343, 1.464606, 0, 0.7960784, 1, 1,
0.138041, 0.4019633, -1.512242, 0, 0.7882353, 1, 1,
0.1386245, 0.05736904, 0.3837452, 0, 0.7843137, 1, 1,
0.1394101, 0.01423899, 1.392143, 0, 0.7764706, 1, 1,
0.1442156, 1.500921, -1.488202, 0, 0.772549, 1, 1,
0.1497372, -0.355867, 3.050193, 0, 0.7647059, 1, 1,
0.1508905, -1.084297, 3.917947, 0, 0.7607843, 1, 1,
0.152021, -0.09161779, 2.58997, 0, 0.7529412, 1, 1,
0.1530951, 0.3194265, 1.583757, 0, 0.7490196, 1, 1,
0.1535434, -0.1505918, 1.74513, 0, 0.7411765, 1, 1,
0.1561988, -1.043247, 1.880675, 0, 0.7372549, 1, 1,
0.1628144, 0.8194115, 0.1048221, 0, 0.7294118, 1, 1,
0.1630313, -0.3795884, 3.856297, 0, 0.7254902, 1, 1,
0.175078, -0.5654171, 3.151463, 0, 0.7176471, 1, 1,
0.1766631, 1.039021, 1.511154, 0, 0.7137255, 1, 1,
0.1772929, 0.5826147, 0.2058167, 0, 0.7058824, 1, 1,
0.1774704, 0.3881277, 0.7713629, 0, 0.6980392, 1, 1,
0.177958, 0.3854561, -0.8056002, 0, 0.6941177, 1, 1,
0.1805234, -1.081349, 1.489679, 0, 0.6862745, 1, 1,
0.1806514, -0.4076952, 4.079468, 0, 0.682353, 1, 1,
0.1837541, -0.3008767, 4.331447, 0, 0.6745098, 1, 1,
0.1863557, 1.03519, -0.4886833, 0, 0.6705883, 1, 1,
0.187519, -2.060504, 3.11831, 0, 0.6627451, 1, 1,
0.1921178, -2.320037, 2.606758, 0, 0.6588235, 1, 1,
0.1965621, 0.01983547, 2.437599, 0, 0.6509804, 1, 1,
0.1984359, -0.5358493, 2.456478, 0, 0.6470588, 1, 1,
0.1990861, 1.28243, 2.447671, 0, 0.6392157, 1, 1,
0.2033328, -0.02493281, 2.112572, 0, 0.6352941, 1, 1,
0.203894, -0.1113639, 1.249478, 0, 0.627451, 1, 1,
0.2048765, 0.1524904, 0.9329978, 0, 0.6235294, 1, 1,
0.2085652, -1.141904, 2.607368, 0, 0.6156863, 1, 1,
0.2210304, 0.2790067, 0.7762792, 0, 0.6117647, 1, 1,
0.2214045, 0.5446087, 0.3480309, 0, 0.6039216, 1, 1,
0.2242048, 0.7355003, -0.03116535, 0, 0.5960785, 1, 1,
0.2290011, -0.5170394, 3.867817, 0, 0.5921569, 1, 1,
0.2295825, -0.3519882, 1.215623, 0, 0.5843138, 1, 1,
0.2306545, 1.137497, -0.1127987, 0, 0.5803922, 1, 1,
0.2308017, 0.11658, 1.57454, 0, 0.572549, 1, 1,
0.2309175, 1.289187, -1.799555, 0, 0.5686275, 1, 1,
0.2341576, 1.235744, 1.372147, 0, 0.5607843, 1, 1,
0.2375265, -0.05963121, 0.9723224, 0, 0.5568628, 1, 1,
0.2381474, 1.058753, -0.4291228, 0, 0.5490196, 1, 1,
0.2395731, 0.6030515, -0.4281468, 0, 0.5450981, 1, 1,
0.240706, -0.7304101, 0.8907492, 0, 0.5372549, 1, 1,
0.2418348, 1.42011, 1.181997, 0, 0.5333334, 1, 1,
0.2520538, 2.40811, 1.418354, 0, 0.5254902, 1, 1,
0.2520805, 1.677459, -0.6378706, 0, 0.5215687, 1, 1,
0.2537732, -0.3887448, 0.5865248, 0, 0.5137255, 1, 1,
0.2543291, -0.6875287, 2.394709, 0, 0.509804, 1, 1,
0.2572632, 0.2160155, -0.4627032, 0, 0.5019608, 1, 1,
0.2587837, -0.6801592, 4.479113, 0, 0.4941176, 1, 1,
0.259578, -0.0890991, 1.19157, 0, 0.4901961, 1, 1,
0.2661853, 1.087004, 0.04303226, 0, 0.4823529, 1, 1,
0.2702099, -0.8073219, 3.247895, 0, 0.4784314, 1, 1,
0.2738186, -0.4077137, 1.704037, 0, 0.4705882, 1, 1,
0.2740321, 0.4137373, -1.580194, 0, 0.4666667, 1, 1,
0.2743103, -0.4750665, 3.737949, 0, 0.4588235, 1, 1,
0.2770153, -0.6095221, 3.255759, 0, 0.454902, 1, 1,
0.2781758, 0.01838642, 1.039307, 0, 0.4470588, 1, 1,
0.2800667, 0.5762846, 0.07677525, 0, 0.4431373, 1, 1,
0.2839569, 0.7994717, 1.274686, 0, 0.4352941, 1, 1,
0.2875054, 0.1146167, 0.6747056, 0, 0.4313726, 1, 1,
0.2894301, 0.4886695, 0.3284626, 0, 0.4235294, 1, 1,
0.2911574, -0.8181967, 0.982325, 0, 0.4196078, 1, 1,
0.2929642, 0.4657329, 1.052055, 0, 0.4117647, 1, 1,
0.2947652, -1.188982, 3.070264, 0, 0.4078431, 1, 1,
0.2961192, -0.3182067, 3.950375, 0, 0.4, 1, 1,
0.2995904, -1.587448, 1.068915, 0, 0.3921569, 1, 1,
0.3021788, 0.2435227, 2.373594, 0, 0.3882353, 1, 1,
0.3025806, 1.213957, -0.2028655, 0, 0.3803922, 1, 1,
0.3083023, 1.670475, 1.441715, 0, 0.3764706, 1, 1,
0.3102673, 1.140235, 0.8909335, 0, 0.3686275, 1, 1,
0.3112427, 1.216242, 1.985639, 0, 0.3647059, 1, 1,
0.3115825, -1.038935, 4.858777, 0, 0.3568628, 1, 1,
0.3160109, 1.09179, -0.9579019, 0, 0.3529412, 1, 1,
0.3175111, 0.943179, -0.02063059, 0, 0.345098, 1, 1,
0.3181288, 0.8471714, 1.348155, 0, 0.3411765, 1, 1,
0.3189417, -0.6501204, 2.024917, 0, 0.3333333, 1, 1,
0.3210727, -1.014697, 2.043353, 0, 0.3294118, 1, 1,
0.3235804, -0.2681482, 2.252737, 0, 0.3215686, 1, 1,
0.3240956, 0.7485113, 1.508582, 0, 0.3176471, 1, 1,
0.3269729, -1.797429, 1.830385, 0, 0.3098039, 1, 1,
0.336743, 2.110186, 1.504784, 0, 0.3058824, 1, 1,
0.3373592, 0.4622773, 0.4873049, 0, 0.2980392, 1, 1,
0.3426753, 0.2451212, -0.09441709, 0, 0.2901961, 1, 1,
0.3431118, 0.4775173, -2.041906, 0, 0.2862745, 1, 1,
0.3433268, -0.3067214, 1.554943, 0, 0.2784314, 1, 1,
0.3457708, -1.303466, 3.045049, 0, 0.2745098, 1, 1,
0.350892, 0.8483459, -0.06865667, 0, 0.2666667, 1, 1,
0.3514149, -1.155592, 2.719079, 0, 0.2627451, 1, 1,
0.3522984, -0.3850943, 2.691135, 0, 0.254902, 1, 1,
0.3527441, 0.1023559, 2.225019, 0, 0.2509804, 1, 1,
0.3579187, 0.1379997, 1.180995, 0, 0.2431373, 1, 1,
0.3687187, -0.05562016, 0.982599, 0, 0.2392157, 1, 1,
0.3693722, 0.1169391, -1.235101, 0, 0.2313726, 1, 1,
0.3719642, 2.176327, 0.9614143, 0, 0.227451, 1, 1,
0.3737012, -0.3915079, 2.541632, 0, 0.2196078, 1, 1,
0.3749184, -0.1463117, 1.903172, 0, 0.2156863, 1, 1,
0.3779928, -0.538136, 2.866637, 0, 0.2078431, 1, 1,
0.3783565, -0.2835151, 2.025824, 0, 0.2039216, 1, 1,
0.3798825, 0.01326062, 1.367235, 0, 0.1960784, 1, 1,
0.3831134, -1.037972, 0.9650044, 0, 0.1882353, 1, 1,
0.3877255, -2.464742, 2.0025, 0, 0.1843137, 1, 1,
0.3899878, -1.719993, 2.656688, 0, 0.1764706, 1, 1,
0.3990028, 0.474486, -0.1774711, 0, 0.172549, 1, 1,
0.4001544, -0.8944936, 3.10323, 0, 0.1647059, 1, 1,
0.4033477, -0.1569362, 1.741365, 0, 0.1607843, 1, 1,
0.4035249, 0.4410033, 0.1136258, 0, 0.1529412, 1, 1,
0.4144042, -0.8215888, 4.364886, 0, 0.1490196, 1, 1,
0.4167814, -0.03390044, 1.407444, 0, 0.1411765, 1, 1,
0.4174119, 0.9954765, 0.9712512, 0, 0.1372549, 1, 1,
0.4193791, 0.9237146, 0.9444032, 0, 0.1294118, 1, 1,
0.4202459, 0.07486504, 1.988805, 0, 0.1254902, 1, 1,
0.42277, 0.5178139, 2.100016, 0, 0.1176471, 1, 1,
0.4234403, 0.2107184, 1.838089, 0, 0.1137255, 1, 1,
0.4325019, -1.07821, 2.257897, 0, 0.1058824, 1, 1,
0.4368331, 0.4854737, 0.2953371, 0, 0.09803922, 1, 1,
0.4392284, 0.712096, 0.9651538, 0, 0.09411765, 1, 1,
0.4399885, -1.769585, 2.679598, 0, 0.08627451, 1, 1,
0.4410169, 1.197648, 0.7448601, 0, 0.08235294, 1, 1,
0.4416839, 1.329659, -0.7411326, 0, 0.07450981, 1, 1,
0.4447939, 0.7683662, 0.8277828, 0, 0.07058824, 1, 1,
0.4457431, 1.819703, -0.5976095, 0, 0.0627451, 1, 1,
0.4477946, 0.04250237, 2.232758, 0, 0.05882353, 1, 1,
0.4479119, -0.006481551, 1.807453, 0, 0.05098039, 1, 1,
0.4482548, 0.2636282, 1.528164, 0, 0.04705882, 1, 1,
0.4501125, 0.3977981, 0.7234603, 0, 0.03921569, 1, 1,
0.4517411, 1.445685, 0.3821472, 0, 0.03529412, 1, 1,
0.458153, -0.3503579, 3.548294, 0, 0.02745098, 1, 1,
0.4590919, 1.185801, 0.6036745, 0, 0.02352941, 1, 1,
0.4598088, -0.7498975, 1.921384, 0, 0.01568628, 1, 1,
0.4653655, 1.53267, 2.04599, 0, 0.01176471, 1, 1,
0.4674905, 2.052868, -0.0607787, 0, 0.003921569, 1, 1,
0.4720751, -0.6693137, 3.408326, 0.003921569, 0, 1, 1,
0.4733153, 2.330531, 1.907823, 0.007843138, 0, 1, 1,
0.4741389, 0.1941293, -0.9658648, 0.01568628, 0, 1, 1,
0.483796, 0.1185758, 1.501138, 0.01960784, 0, 1, 1,
0.4839854, -0.3099121, 2.607367, 0.02745098, 0, 1, 1,
0.4850602, -1.186008, 1.27245, 0.03137255, 0, 1, 1,
0.4852529, -0.4875399, 3.226402, 0.03921569, 0, 1, 1,
0.4895928, -1.009145, 2.637716, 0.04313726, 0, 1, 1,
0.4906787, 1.012629, 0.4902549, 0.05098039, 0, 1, 1,
0.4942234, -0.6346293, 2.825407, 0.05490196, 0, 1, 1,
0.4946167, -0.5515756, 2.968252, 0.0627451, 0, 1, 1,
0.4947791, -1.524904, 2.524379, 0.06666667, 0, 1, 1,
0.4988227, 1.064665, 0.8625495, 0.07450981, 0, 1, 1,
0.5072324, 0.0271779, 0.5250606, 0.07843138, 0, 1, 1,
0.5088723, -0.3772141, 4.173089, 0.08627451, 0, 1, 1,
0.5100001, 0.191516, 0.621164, 0.09019608, 0, 1, 1,
0.5119925, -0.2170448, 3.435977, 0.09803922, 0, 1, 1,
0.5182171, 0.2350008, 1.917818, 0.1058824, 0, 1, 1,
0.5189313, 0.01808194, 3.462349, 0.1098039, 0, 1, 1,
0.5237939, 0.7114286, -0.1902706, 0.1176471, 0, 1, 1,
0.5239723, -1.203034, 2.765036, 0.1215686, 0, 1, 1,
0.5255323, -1.164946, 0.8773195, 0.1294118, 0, 1, 1,
0.525726, 0.5972871, -0.3784978, 0.1333333, 0, 1, 1,
0.5336521, 0.4737131, 2.409082, 0.1411765, 0, 1, 1,
0.5338707, -1.324038, 4.698237, 0.145098, 0, 1, 1,
0.5338954, 0.3900715, 1.87023, 0.1529412, 0, 1, 1,
0.5379053, 0.1935096, 2.238268, 0.1568628, 0, 1, 1,
0.5442655, 0.5263741, 2.483195, 0.1647059, 0, 1, 1,
0.5446765, -0.7954572, 3.199091, 0.1686275, 0, 1, 1,
0.5457643, -1.453901, 2.93651, 0.1764706, 0, 1, 1,
0.5484532, -1.509601, 1.561012, 0.1803922, 0, 1, 1,
0.5490545, -0.3172698, 1.299085, 0.1882353, 0, 1, 1,
0.5536972, 1.248863, -1.493139, 0.1921569, 0, 1, 1,
0.5573758, 0.499419, 1.533236, 0.2, 0, 1, 1,
0.5581145, -0.579579, 2.998658, 0.2078431, 0, 1, 1,
0.5593884, 0.7039656, 0.4487612, 0.2117647, 0, 1, 1,
0.5640687, -0.6438931, 1.764184, 0.2196078, 0, 1, 1,
0.5646599, 1.546466, 1.293598, 0.2235294, 0, 1, 1,
0.5737571, 0.5182123, 0.5334716, 0.2313726, 0, 1, 1,
0.575026, -0.1706189, 1.654651, 0.2352941, 0, 1, 1,
0.5780261, -0.6503778, 2.093138, 0.2431373, 0, 1, 1,
0.5784104, -0.3564158, 1.499184, 0.2470588, 0, 1, 1,
0.579456, 0.3382758, 0.7254304, 0.254902, 0, 1, 1,
0.5826786, -1.076024, 3.474422, 0.2588235, 0, 1, 1,
0.5834507, -1.864472, 2.982725, 0.2666667, 0, 1, 1,
0.5880252, 0.06445581, 1.753495, 0.2705882, 0, 1, 1,
0.588544, -0.6165604, 1.743154, 0.2784314, 0, 1, 1,
0.5933124, 0.8398082, 1.902779, 0.282353, 0, 1, 1,
0.5934228, 0.3820503, 3.343453, 0.2901961, 0, 1, 1,
0.5945753, -0.02356583, 1.599277, 0.2941177, 0, 1, 1,
0.6009806, 2.244697, 0.09270109, 0.3019608, 0, 1, 1,
0.6056639, -1.804187, 3.33088, 0.3098039, 0, 1, 1,
0.610186, -0.222634, 3.103638, 0.3137255, 0, 1, 1,
0.6111236, 0.2047734, -0.6508086, 0.3215686, 0, 1, 1,
0.6146451, -0.2738869, -0.05500534, 0.3254902, 0, 1, 1,
0.6153173, 1.079267, 0.3365611, 0.3333333, 0, 1, 1,
0.6167287, 0.5392274, 0.8366697, 0.3372549, 0, 1, 1,
0.6172224, 0.851408, 0.543493, 0.345098, 0, 1, 1,
0.6200946, -0.9541159, 2.595502, 0.3490196, 0, 1, 1,
0.6201686, 1.297778, 1.473116, 0.3568628, 0, 1, 1,
0.6203954, -1.81328, 4.076886, 0.3607843, 0, 1, 1,
0.6232009, -1.744666, 3.480519, 0.3686275, 0, 1, 1,
0.6290224, -1.388117, 3.932597, 0.372549, 0, 1, 1,
0.6301619, 1.699893, -0.8959185, 0.3803922, 0, 1, 1,
0.63049, -0.882268, 2.807614, 0.3843137, 0, 1, 1,
0.6319396, 0.1915786, 3.537477, 0.3921569, 0, 1, 1,
0.6336348, 0.3557846, -0.04832145, 0.3960784, 0, 1, 1,
0.6339351, -1.483523, 3.745054, 0.4039216, 0, 1, 1,
0.6340168, -0.2094595, 0.8503553, 0.4117647, 0, 1, 1,
0.6355007, -0.1885464, 1.559964, 0.4156863, 0, 1, 1,
0.6367093, -0.8566484, 2.969282, 0.4235294, 0, 1, 1,
0.6376952, 0.5858163, 0.9105731, 0.427451, 0, 1, 1,
0.6401151, -1.642933, 2.732976, 0.4352941, 0, 1, 1,
0.6488392, -0.1414612, 4.047771, 0.4392157, 0, 1, 1,
0.649197, 0.731824, 1.398338, 0.4470588, 0, 1, 1,
0.6493261, 0.8877915, -0.6008151, 0.4509804, 0, 1, 1,
0.6495115, 2.116004, 0.4267618, 0.4588235, 0, 1, 1,
0.6498413, 0.2911455, 1.763628, 0.4627451, 0, 1, 1,
0.6517881, -0.4092394, 2.101376, 0.4705882, 0, 1, 1,
0.6528265, -0.6647319, 2.253091, 0.4745098, 0, 1, 1,
0.6532983, -0.7039784, 4.020214, 0.4823529, 0, 1, 1,
0.6541777, 0.4257961, 2.503114, 0.4862745, 0, 1, 1,
0.6541987, -0.8985252, 3.204734, 0.4941176, 0, 1, 1,
0.6552457, -0.1401711, 2.099712, 0.5019608, 0, 1, 1,
0.6597484, 0.4275831, 0.5640706, 0.5058824, 0, 1, 1,
0.6602527, 0.2790414, 1.322735, 0.5137255, 0, 1, 1,
0.6759565, 0.3160092, 1.991659, 0.5176471, 0, 1, 1,
0.6812459, -0.4097473, 1.745848, 0.5254902, 0, 1, 1,
0.6825642, 0.8588881, 0.6752324, 0.5294118, 0, 1, 1,
0.6841407, -0.6075483, 1.997523, 0.5372549, 0, 1, 1,
0.6867077, -0.1182743, 3.247724, 0.5411765, 0, 1, 1,
0.6876218, 0.2372847, 0.3713097, 0.5490196, 0, 1, 1,
0.6903082, 0.6310108, -0.2302311, 0.5529412, 0, 1, 1,
0.6912571, -1.052035, 2.21344, 0.5607843, 0, 1, 1,
0.6943142, -0.7652383, 3.468309, 0.5647059, 0, 1, 1,
0.6958846, 0.64455, 0.9901241, 0.572549, 0, 1, 1,
0.6997094, -0.7108067, 1.498498, 0.5764706, 0, 1, 1,
0.7004884, -0.5803013, 4.013355, 0.5843138, 0, 1, 1,
0.7067374, -0.2739292, 3.063307, 0.5882353, 0, 1, 1,
0.7133691, 0.2838612, 1.337677, 0.5960785, 0, 1, 1,
0.7156761, 0.3791431, 1.601755, 0.6039216, 0, 1, 1,
0.7164406, -0.9756152, 5.14116, 0.6078432, 0, 1, 1,
0.7183238, 1.173337, 0.2982782, 0.6156863, 0, 1, 1,
0.7188337, 0.1227553, 2.310854, 0.6196079, 0, 1, 1,
0.7219822, 0.946851, -0.7984142, 0.627451, 0, 1, 1,
0.726106, 0.2411363, 1.815592, 0.6313726, 0, 1, 1,
0.7323073, 0.08177576, 0.2573552, 0.6392157, 0, 1, 1,
0.7332517, -1.009653, 3.304296, 0.6431373, 0, 1, 1,
0.7353712, -1.082215, 3.397226, 0.6509804, 0, 1, 1,
0.7375087, -1.117375, 4.367233, 0.654902, 0, 1, 1,
0.7408837, 0.3480843, 0.7728404, 0.6627451, 0, 1, 1,
0.7414159, 0.7841862, -0.68811, 0.6666667, 0, 1, 1,
0.7444178, -0.5969084, 1.079735, 0.6745098, 0, 1, 1,
0.7450048, -0.01627622, 1.317118, 0.6784314, 0, 1, 1,
0.7451949, -0.799637, 2.473849, 0.6862745, 0, 1, 1,
0.7466927, -0.03263608, 2.403426, 0.6901961, 0, 1, 1,
0.7504908, -0.1381425, 3.164449, 0.6980392, 0, 1, 1,
0.7601485, -0.6216242, 0.7727571, 0.7058824, 0, 1, 1,
0.7644157, -1.490907, 1.000146, 0.7098039, 0, 1, 1,
0.7683728, 0.8589783, -0.757593, 0.7176471, 0, 1, 1,
0.7696151, 0.3718266, 2.421218, 0.7215686, 0, 1, 1,
0.7729855, 0.007894747, 2.547387, 0.7294118, 0, 1, 1,
0.774441, -1.020627, 1.935227, 0.7333333, 0, 1, 1,
0.7789332, 1.701481, -0.05799127, 0.7411765, 0, 1, 1,
0.7840098, 1.533934, 0.0276353, 0.7450981, 0, 1, 1,
0.7853338, -0.6209528, 2.477366, 0.7529412, 0, 1, 1,
0.7871291, -1.225631, 3.344186, 0.7568628, 0, 1, 1,
0.7920029, 0.01764451, 0.2787927, 0.7647059, 0, 1, 1,
0.7938156, -1.272653, 4.15698, 0.7686275, 0, 1, 1,
0.7959456, 0.515165, 0.5281959, 0.7764706, 0, 1, 1,
0.7967061, -1.60887, 2.335335, 0.7803922, 0, 1, 1,
0.7982461, -0.4253479, 2.811176, 0.7882353, 0, 1, 1,
0.8017271, -0.4478193, 2.184385, 0.7921569, 0, 1, 1,
0.8040081, -0.5000324, 1.375096, 0.8, 0, 1, 1,
0.8088451, 0.3065268, 0.5367092, 0.8078431, 0, 1, 1,
0.8131648, 1.108453, -1.59541, 0.8117647, 0, 1, 1,
0.8230949, 1.052189, 2.728189, 0.8196079, 0, 1, 1,
0.8237498, -0.5568488, 2.43016, 0.8235294, 0, 1, 1,
0.8241872, 0.3223183, 1.489855, 0.8313726, 0, 1, 1,
0.8253213, 0.9849794, 0.4632416, 0.8352941, 0, 1, 1,
0.8256316, 0.3528952, 2.406439, 0.8431373, 0, 1, 1,
0.8277057, 1.173595, 0.0007447015, 0.8470588, 0, 1, 1,
0.8308084, 0.1193294, 2.487397, 0.854902, 0, 1, 1,
0.8325441, 1.518247, 0.1146453, 0.8588235, 0, 1, 1,
0.8335072, 0.04621749, 0.8316735, 0.8666667, 0, 1, 1,
0.8364255, 0.7308694, 1.347156, 0.8705882, 0, 1, 1,
0.8443907, -1.139079, 3.502678, 0.8784314, 0, 1, 1,
0.8481762, 0.1509358, 0.136822, 0.8823529, 0, 1, 1,
0.8567321, -0.4610086, 1.492496, 0.8901961, 0, 1, 1,
0.8581415, 1.034398, 1.143429, 0.8941177, 0, 1, 1,
0.8618339, -0.8204021, 4.522464, 0.9019608, 0, 1, 1,
0.8634534, 0.810364, 0.835289, 0.9098039, 0, 1, 1,
0.8704391, -1.800284, 1.807993, 0.9137255, 0, 1, 1,
0.8738036, -0.1163141, 2.259187, 0.9215686, 0, 1, 1,
0.8768288, -0.2230687, 2.090485, 0.9254902, 0, 1, 1,
0.8784825, -1.371298, 1.85083, 0.9333333, 0, 1, 1,
0.8819175, -2.614074, 3.595628, 0.9372549, 0, 1, 1,
0.8936095, 0.9803608, 0.9610784, 0.945098, 0, 1, 1,
0.8961273, -0.9108731, 2.189266, 0.9490196, 0, 1, 1,
0.8985101, 2.258903, 0.1988153, 0.9568627, 0, 1, 1,
0.9041137, -0.2713456, 0.9446254, 0.9607843, 0, 1, 1,
0.9047726, 0.1762664, 0.844038, 0.9686275, 0, 1, 1,
0.9071925, 0.232426, 1.881185, 0.972549, 0, 1, 1,
0.9138212, -1.774304, 3.097922, 0.9803922, 0, 1, 1,
0.9170838, 1.677483, 0.5073349, 0.9843137, 0, 1, 1,
0.9171, 1.58394, -0.1370315, 0.9921569, 0, 1, 1,
0.9219557, -0.06695143, 1.328462, 0.9960784, 0, 1, 1,
0.9302016, -0.8374949, 0.884508, 1, 0, 0.9960784, 1,
0.9359025, 0.5066699, 2.419286, 1, 0, 0.9882353, 1,
0.9388289, 0.314189, 1.354671, 1, 0, 0.9843137, 1,
0.9411293, -0.4268408, 0.9931366, 1, 0, 0.9764706, 1,
0.9563948, 2.217298, 0.5349762, 1, 0, 0.972549, 1,
0.9567712, -0.03695553, 1.517574, 1, 0, 0.9647059, 1,
0.9593827, 1.222204, 1.194565, 1, 0, 0.9607843, 1,
0.9610887, -0.3836075, 1.967633, 1, 0, 0.9529412, 1,
0.9709336, 0.4419133, -0.1681858, 1, 0, 0.9490196, 1,
0.9715086, 1.464429, 1.248214, 1, 0, 0.9411765, 1,
0.9761789, -0.7126096, 2.833127, 1, 0, 0.9372549, 1,
0.981425, 0.8351617, 1.281081, 1, 0, 0.9294118, 1,
0.9880098, -0.5033231, 3.403147, 1, 0, 0.9254902, 1,
0.9910748, 1.889109, 0.05818336, 1, 0, 0.9176471, 1,
0.998279, 1.503417, 1.123248, 1, 0, 0.9137255, 1,
1.00026, -0.5246146, 3.22999, 1, 0, 0.9058824, 1,
1.003698, 0.1344155, 1.011238, 1, 0, 0.9019608, 1,
1.01217, -0.0684988, 0.6670773, 1, 0, 0.8941177, 1,
1.012374, 0.1058757, 1.812395, 1, 0, 0.8862745, 1,
1.015971, -0.1488713, 2.003964, 1, 0, 0.8823529, 1,
1.025066, 1.729946, 0.04251038, 1, 0, 0.8745098, 1,
1.033029, 1.164589, 0.8375477, 1, 0, 0.8705882, 1,
1.041837, 0.1551713, 1.545147, 1, 0, 0.8627451, 1,
1.042479, 1.720891, -1.244171, 1, 0, 0.8588235, 1,
1.045267, -0.3314544, 1.749286, 1, 0, 0.8509804, 1,
1.048501, -0.4145028, 2.473702, 1, 0, 0.8470588, 1,
1.052445, -1.124519, 1.213869, 1, 0, 0.8392157, 1,
1.053394, 0.05433033, 1.977211, 1, 0, 0.8352941, 1,
1.055602, -0.000443779, 1.898695, 1, 0, 0.827451, 1,
1.061488, -2.087598, 1.428175, 1, 0, 0.8235294, 1,
1.064408, -0.389538, 0.6824247, 1, 0, 0.8156863, 1,
1.068687, 1.353231, -0.3621277, 1, 0, 0.8117647, 1,
1.072529, 1.118078, 2.135782, 1, 0, 0.8039216, 1,
1.079106, 0.8613359, 0.9393693, 1, 0, 0.7960784, 1,
1.082443, 2.043043, -0.3211898, 1, 0, 0.7921569, 1,
1.086696, 1.00665, 1.283574, 1, 0, 0.7843137, 1,
1.09007, 0.1593859, 1.480924, 1, 0, 0.7803922, 1,
1.095163, 1.196528, 1.090979, 1, 0, 0.772549, 1,
1.097911, -0.2902618, 3.386935, 1, 0, 0.7686275, 1,
1.114477, -0.2232134, 4.264569, 1, 0, 0.7607843, 1,
1.115902, -1.035569, 2.186412, 1, 0, 0.7568628, 1,
1.118958, -0.2753072, 3.323755, 1, 0, 0.7490196, 1,
1.120064, -1.008554, 2.8106, 1, 0, 0.7450981, 1,
1.126976, -0.6811754, 2.031972, 1, 0, 0.7372549, 1,
1.129074, 0.5178509, 2.753915, 1, 0, 0.7333333, 1,
1.13257, 0.9316139, 1.291853, 1, 0, 0.7254902, 1,
1.147814, -0.1378187, 0.5661902, 1, 0, 0.7215686, 1,
1.147839, 0.7262614, 2.360713, 1, 0, 0.7137255, 1,
1.148186, 0.5239902, 1.427779, 1, 0, 0.7098039, 1,
1.150144, 0.1614768, 1.331656, 1, 0, 0.7019608, 1,
1.151449, -0.0903212, 1.252146, 1, 0, 0.6941177, 1,
1.152514, -0.198792, 2.275989, 1, 0, 0.6901961, 1,
1.16194, -0.04616057, 1.657022, 1, 0, 0.682353, 1,
1.16781, -0.1645672, 2.423549, 1, 0, 0.6784314, 1,
1.169778, 1.732867, 0.7856849, 1, 0, 0.6705883, 1,
1.171277, -0.05501414, 1.225525, 1, 0, 0.6666667, 1,
1.171314, -0.2250162, 1.08076, 1, 0, 0.6588235, 1,
1.173094, 0.2475773, 1.832601, 1, 0, 0.654902, 1,
1.173681, -0.1055515, 3.215125, 1, 0, 0.6470588, 1,
1.174845, -2.137994, 3.184599, 1, 0, 0.6431373, 1,
1.187379, -0.9057792, 2.137704, 1, 0, 0.6352941, 1,
1.216479, -0.2897611, 2.245006, 1, 0, 0.6313726, 1,
1.223248, 0.6994079, 1.133786, 1, 0, 0.6235294, 1,
1.233202, 1.293486, -0.6819329, 1, 0, 0.6196079, 1,
1.243319, -1.805001, 1.70557, 1, 0, 0.6117647, 1,
1.245343, 1.291147, 0.6832545, 1, 0, 0.6078432, 1,
1.249129, 0.8501781, 1.920567, 1, 0, 0.6, 1,
1.259668, 1.146803, 0.5281726, 1, 0, 0.5921569, 1,
1.265697, 0.3879374, 2.024523, 1, 0, 0.5882353, 1,
1.266796, 0.7369208, 3.461387, 1, 0, 0.5803922, 1,
1.268249, 0.3703762, 0.5858873, 1, 0, 0.5764706, 1,
1.274333, -1.073552, 3.839621, 1, 0, 0.5686275, 1,
1.283352, -1.209404, 3.168463, 1, 0, 0.5647059, 1,
1.29828, 0.7277826, -1.28117, 1, 0, 0.5568628, 1,
1.302935, 1.30071, 0.2874407, 1, 0, 0.5529412, 1,
1.303451, -0.4984767, 1.020046, 1, 0, 0.5450981, 1,
1.303458, -0.135553, 0.2380242, 1, 0, 0.5411765, 1,
1.310818, -0.3001983, 3.382933, 1, 0, 0.5333334, 1,
1.329233, 1.845942, 0.4099798, 1, 0, 0.5294118, 1,
1.329955, 0.3291601, -0.7901329, 1, 0, 0.5215687, 1,
1.340489, 0.821981, 2.064436, 1, 0, 0.5176471, 1,
1.341541, -1.807167, 2.761443, 1, 0, 0.509804, 1,
1.349694, -0.1111495, 0.2245752, 1, 0, 0.5058824, 1,
1.364478, 2.550616, -0.5986899, 1, 0, 0.4980392, 1,
1.372045, 0.136546, 1.753186, 1, 0, 0.4901961, 1,
1.393857, -0.3394631, 0.8854614, 1, 0, 0.4862745, 1,
1.396737, 1.28197, -0.5634035, 1, 0, 0.4784314, 1,
1.411043, -0.4673248, 1.38887, 1, 0, 0.4745098, 1,
1.411717, 0.6488085, 3.152161, 1, 0, 0.4666667, 1,
1.416274, 0.08841669, 1.645841, 1, 0, 0.4627451, 1,
1.419101, 0.1594431, -0.5420011, 1, 0, 0.454902, 1,
1.424431, 0.07177047, 0.6627401, 1, 0, 0.4509804, 1,
1.427986, -1.43835, 2.200342, 1, 0, 0.4431373, 1,
1.434421, 1.112825, 0.3696909, 1, 0, 0.4392157, 1,
1.441949, -0.18171, 2.386001, 1, 0, 0.4313726, 1,
1.464291, 0.4890356, 0.6102913, 1, 0, 0.427451, 1,
1.478008, 1.062469, 0.2226053, 1, 0, 0.4196078, 1,
1.488865, 0.2346476, 1.385509, 1, 0, 0.4156863, 1,
1.490546, -0.3015314, 1.346724, 1, 0, 0.4078431, 1,
1.495888, -1.079551, 1.885052, 1, 0, 0.4039216, 1,
1.502783, 1.325135, 2.356102, 1, 0, 0.3960784, 1,
1.511083, -0.3130927, 4.179786, 1, 0, 0.3882353, 1,
1.518524, -0.8753177, 1.906702, 1, 0, 0.3843137, 1,
1.52034, 0.1496092, 0.694047, 1, 0, 0.3764706, 1,
1.52083, 0.8760262, 1.10427, 1, 0, 0.372549, 1,
1.524113, -0.6177667, 1.77603, 1, 0, 0.3647059, 1,
1.548157, 0.1339169, 1.826469, 1, 0, 0.3607843, 1,
1.552562, 0.7466897, 1.189362, 1, 0, 0.3529412, 1,
1.570233, -0.9236684, 1.121994, 1, 0, 0.3490196, 1,
1.577699, -0.343244, 0.4024439, 1, 0, 0.3411765, 1,
1.58893, 1.482916, 1.333657, 1, 0, 0.3372549, 1,
1.606836, 2.44538, -0.4574876, 1, 0, 0.3294118, 1,
1.610001, -1.983003, 1.881085, 1, 0, 0.3254902, 1,
1.624905, 0.04994467, 1.008136, 1, 0, 0.3176471, 1,
1.646666, -0.2200923, 2.915653, 1, 0, 0.3137255, 1,
1.646948, 0.8553039, 0.1110083, 1, 0, 0.3058824, 1,
1.661154, 0.4644767, 0.62861, 1, 0, 0.2980392, 1,
1.665944, 1.126331, -0.6025389, 1, 0, 0.2941177, 1,
1.672614, 0.7954534, 3.341562, 1, 0, 0.2862745, 1,
1.673551, 1.501422, 1.542373, 1, 0, 0.282353, 1,
1.680716, 0.779866, 1.482279, 1, 0, 0.2745098, 1,
1.687289, -0.1034805, -0.02750938, 1, 0, 0.2705882, 1,
1.698707, -2.640692, 2.645314, 1, 0, 0.2627451, 1,
1.743612, 0.1252438, 0.1899962, 1, 0, 0.2588235, 1,
1.755323, -0.3515085, 1.812833, 1, 0, 0.2509804, 1,
1.761048, 0.1051376, 1.837005, 1, 0, 0.2470588, 1,
1.789814, -0.9387676, 1.750305, 1, 0, 0.2392157, 1,
1.794042, 1.30134, 1.500942, 1, 0, 0.2352941, 1,
1.799245, -1.254016, 0.3335524, 1, 0, 0.227451, 1,
1.822488, -0.461125, 0.942398, 1, 0, 0.2235294, 1,
1.822962, -0.4572581, 0.6896263, 1, 0, 0.2156863, 1,
1.831662, -0.7109445, 2.646523, 1, 0, 0.2117647, 1,
1.882002, 0.2470384, 3.054285, 1, 0, 0.2039216, 1,
1.915182, 0.7893606, 2.57639, 1, 0, 0.1960784, 1,
1.91725, -1.424629, 1.471726, 1, 0, 0.1921569, 1,
1.933515, -1.010697, 1.860338, 1, 0, 0.1843137, 1,
1.939428, -1.15731, 2.01571, 1, 0, 0.1803922, 1,
1.943306, -0.8482438, 2.558986, 1, 0, 0.172549, 1,
1.948538, -2.262767, 2.191391, 1, 0, 0.1686275, 1,
1.953606, 0.742222, 0.8474107, 1, 0, 0.1607843, 1,
1.998835, 0.3691863, 0.6915609, 1, 0, 0.1568628, 1,
2.020414, -1.299018, 2.034453, 1, 0, 0.1490196, 1,
2.02719, -1.373615, 2.638717, 1, 0, 0.145098, 1,
2.044215, -0.7093143, 1.460824, 1, 0, 0.1372549, 1,
2.048494, 0.003759753, 1.783067, 1, 0, 0.1333333, 1,
2.051791, 0.6857921, 1.248817, 1, 0, 0.1254902, 1,
2.092775, -1.013478, 2.539206, 1, 0, 0.1215686, 1,
2.100568, -0.8604764, 1.717041, 1, 0, 0.1137255, 1,
2.132725, -0.4092365, 1.925111, 1, 0, 0.1098039, 1,
2.21961, 0.3479668, 0.547275, 1, 0, 0.1019608, 1,
2.276323, -0.6435674, 1.776292, 1, 0, 0.09411765, 1,
2.324835, 1.100601, 1.134655, 1, 0, 0.09019608, 1,
2.327702, -1.098777, 2.633042, 1, 0, 0.08235294, 1,
2.33614, 1.845909, 0.3963408, 1, 0, 0.07843138, 1,
2.482925, -0.520022, 0.09134246, 1, 0, 0.07058824, 1,
2.561983, -0.3888098, 1.404374, 1, 0, 0.06666667, 1,
2.626004, 1.400711, 0.9618209, 1, 0, 0.05882353, 1,
2.717723, -0.8524064, 3.0086, 1, 0, 0.05490196, 1,
2.729366, -0.9075399, 2.175709, 1, 0, 0.04705882, 1,
2.738401, 0.7145014, 1.166293, 1, 0, 0.04313726, 1,
2.816756, -0.3048221, 0.7922595, 1, 0, 0.03529412, 1,
2.826522, -1.801543, 3.076199, 1, 0, 0.03137255, 1,
2.849885, 0.5636885, 2.048618, 1, 0, 0.02352941, 1,
3.219822, 0.6672279, 0.8708296, 1, 0, 0.01960784, 1,
3.301761, -1.21279, 1.11353, 1, 0, 0.01176471, 1,
3.397921, 0.4567328, 2.270031, 1, 0, 0.007843138, 1
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
0.1717894, -3.800418, -7.219101, 0, -0.5, 0.5, 0.5,
0.1717894, -3.800418, -7.219101, 1, -0.5, 0.5, 0.5,
0.1717894, -3.800418, -7.219101, 1, 1.5, 0.5, 0.5,
0.1717894, -3.800418, -7.219101, 0, 1.5, 0.5, 0.5
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
-4.148001, -0.0041821, -7.219101, 0, -0.5, 0.5, 0.5,
-4.148001, -0.0041821, -7.219101, 1, -0.5, 0.5, 0.5,
-4.148001, -0.0041821, -7.219101, 1, 1.5, 0.5, 0.5,
-4.148001, -0.0041821, -7.219101, 0, 1.5, 0.5, 0.5
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
-4.148001, -3.800418, -0.07210588, 0, -0.5, 0.5, 0.5,
-4.148001, -3.800418, -0.07210588, 1, -0.5, 0.5, 0.5,
-4.148001, -3.800418, -0.07210588, 1, 1.5, 0.5, 0.5,
-4.148001, -3.800418, -0.07210588, 0, 1.5, 0.5, 0.5
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
-3, -2.924364, -5.569794,
3, -2.924364, -5.569794,
-3, -2.924364, -5.569794,
-3, -3.070373, -5.844679,
-2, -2.924364, -5.569794,
-2, -3.070373, -5.844679,
-1, -2.924364, -5.569794,
-1, -3.070373, -5.844679,
0, -2.924364, -5.569794,
0, -3.070373, -5.844679,
1, -2.924364, -5.569794,
1, -3.070373, -5.844679,
2, -2.924364, -5.569794,
2, -3.070373, -5.844679,
3, -2.924364, -5.569794,
3, -3.070373, -5.844679
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
-3, -3.362391, -6.394448, 0, -0.5, 0.5, 0.5,
-3, -3.362391, -6.394448, 1, -0.5, 0.5, 0.5,
-3, -3.362391, -6.394448, 1, 1.5, 0.5, 0.5,
-3, -3.362391, -6.394448, 0, 1.5, 0.5, 0.5,
-2, -3.362391, -6.394448, 0, -0.5, 0.5, 0.5,
-2, -3.362391, -6.394448, 1, -0.5, 0.5, 0.5,
-2, -3.362391, -6.394448, 1, 1.5, 0.5, 0.5,
-2, -3.362391, -6.394448, 0, 1.5, 0.5, 0.5,
-1, -3.362391, -6.394448, 0, -0.5, 0.5, 0.5,
-1, -3.362391, -6.394448, 1, -0.5, 0.5, 0.5,
-1, -3.362391, -6.394448, 1, 1.5, 0.5, 0.5,
-1, -3.362391, -6.394448, 0, 1.5, 0.5, 0.5,
0, -3.362391, -6.394448, 0, -0.5, 0.5, 0.5,
0, -3.362391, -6.394448, 1, -0.5, 0.5, 0.5,
0, -3.362391, -6.394448, 1, 1.5, 0.5, 0.5,
0, -3.362391, -6.394448, 0, 1.5, 0.5, 0.5,
1, -3.362391, -6.394448, 0, -0.5, 0.5, 0.5,
1, -3.362391, -6.394448, 1, -0.5, 0.5, 0.5,
1, -3.362391, -6.394448, 1, 1.5, 0.5, 0.5,
1, -3.362391, -6.394448, 0, 1.5, 0.5, 0.5,
2, -3.362391, -6.394448, 0, -0.5, 0.5, 0.5,
2, -3.362391, -6.394448, 1, -0.5, 0.5, 0.5,
2, -3.362391, -6.394448, 1, 1.5, 0.5, 0.5,
2, -3.362391, -6.394448, 0, 1.5, 0.5, 0.5,
3, -3.362391, -6.394448, 0, -0.5, 0.5, 0.5,
3, -3.362391, -6.394448, 1, -0.5, 0.5, 0.5,
3, -3.362391, -6.394448, 1, 1.5, 0.5, 0.5,
3, -3.362391, -6.394448, 0, 1.5, 0.5, 0.5
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
-3.151126, -2, -5.569794,
-3.151126, 2, -5.569794,
-3.151126, -2, -5.569794,
-3.317272, -2, -5.844679,
-3.151126, -1, -5.569794,
-3.317272, -1, -5.844679,
-3.151126, 0, -5.569794,
-3.317272, 0, -5.844679,
-3.151126, 1, -5.569794,
-3.317272, 1, -5.844679,
-3.151126, 2, -5.569794,
-3.317272, 2, -5.844679
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
-3.649564, -2, -6.394448, 0, -0.5, 0.5, 0.5,
-3.649564, -2, -6.394448, 1, -0.5, 0.5, 0.5,
-3.649564, -2, -6.394448, 1, 1.5, 0.5, 0.5,
-3.649564, -2, -6.394448, 0, 1.5, 0.5, 0.5,
-3.649564, -1, -6.394448, 0, -0.5, 0.5, 0.5,
-3.649564, -1, -6.394448, 1, -0.5, 0.5, 0.5,
-3.649564, -1, -6.394448, 1, 1.5, 0.5, 0.5,
-3.649564, -1, -6.394448, 0, 1.5, 0.5, 0.5,
-3.649564, 0, -6.394448, 0, -0.5, 0.5, 0.5,
-3.649564, 0, -6.394448, 1, -0.5, 0.5, 0.5,
-3.649564, 0, -6.394448, 1, 1.5, 0.5, 0.5,
-3.649564, 0, -6.394448, 0, 1.5, 0.5, 0.5,
-3.649564, 1, -6.394448, 0, -0.5, 0.5, 0.5,
-3.649564, 1, -6.394448, 1, -0.5, 0.5, 0.5,
-3.649564, 1, -6.394448, 1, 1.5, 0.5, 0.5,
-3.649564, 1, -6.394448, 0, 1.5, 0.5, 0.5,
-3.649564, 2, -6.394448, 0, -0.5, 0.5, 0.5,
-3.649564, 2, -6.394448, 1, -0.5, 0.5, 0.5,
-3.649564, 2, -6.394448, 1, 1.5, 0.5, 0.5,
-3.649564, 2, -6.394448, 0, 1.5, 0.5, 0.5
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
-3.151126, -2.924364, -4,
-3.151126, -2.924364, 4,
-3.151126, -2.924364, -4,
-3.317272, -3.070373, -4,
-3.151126, -2.924364, -2,
-3.317272, -3.070373, -2,
-3.151126, -2.924364, 0,
-3.317272, -3.070373, 0,
-3.151126, -2.924364, 2,
-3.317272, -3.070373, 2,
-3.151126, -2.924364, 4,
-3.317272, -3.070373, 4
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
-3.649564, -3.362391, -4, 0, -0.5, 0.5, 0.5,
-3.649564, -3.362391, -4, 1, -0.5, 0.5, 0.5,
-3.649564, -3.362391, -4, 1, 1.5, 0.5, 0.5,
-3.649564, -3.362391, -4, 0, 1.5, 0.5, 0.5,
-3.649564, -3.362391, -2, 0, -0.5, 0.5, 0.5,
-3.649564, -3.362391, -2, 1, -0.5, 0.5, 0.5,
-3.649564, -3.362391, -2, 1, 1.5, 0.5, 0.5,
-3.649564, -3.362391, -2, 0, 1.5, 0.5, 0.5,
-3.649564, -3.362391, 0, 0, -0.5, 0.5, 0.5,
-3.649564, -3.362391, 0, 1, -0.5, 0.5, 0.5,
-3.649564, -3.362391, 0, 1, 1.5, 0.5, 0.5,
-3.649564, -3.362391, 0, 0, 1.5, 0.5, 0.5,
-3.649564, -3.362391, 2, 0, -0.5, 0.5, 0.5,
-3.649564, -3.362391, 2, 1, -0.5, 0.5, 0.5,
-3.649564, -3.362391, 2, 1, 1.5, 0.5, 0.5,
-3.649564, -3.362391, 2, 0, 1.5, 0.5, 0.5,
-3.649564, -3.362391, 4, 0, -0.5, 0.5, 0.5,
-3.649564, -3.362391, 4, 1, -0.5, 0.5, 0.5,
-3.649564, -3.362391, 4, 1, 1.5, 0.5, 0.5,
-3.649564, -3.362391, 4, 0, 1.5, 0.5, 0.5
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
-3.151126, -2.924364, -5.569794,
-3.151126, 2.915999, -5.569794,
-3.151126, -2.924364, 5.425582,
-3.151126, 2.915999, 5.425582,
-3.151126, -2.924364, -5.569794,
-3.151126, -2.924364, 5.425582,
-3.151126, 2.915999, -5.569794,
-3.151126, 2.915999, 5.425582,
-3.151126, -2.924364, -5.569794,
3.494705, -2.924364, -5.569794,
-3.151126, -2.924364, 5.425582,
3.494705, -2.924364, 5.425582,
-3.151126, 2.915999, -5.569794,
3.494705, 2.915999, -5.569794,
-3.151126, 2.915999, 5.425582,
3.494705, 2.915999, 5.425582,
3.494705, -2.924364, -5.569794,
3.494705, 2.915999, -5.569794,
3.494705, -2.924364, 5.425582,
3.494705, 2.915999, 5.425582,
3.494705, -2.924364, -5.569794,
3.494705, -2.924364, 5.425582,
3.494705, 2.915999, -5.569794,
3.494705, 2.915999, 5.425582
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
var radius = 7.536039;
var distance = 33.52869;
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
mvMatrix.translate( -0.1717894, 0.0041821, 0.07210588 );
mvMatrix.scale( 1.226049, 1.395138, 0.741049 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.52869);
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
thiadiazol-3-ylmethy<-read.table("thiadiazol-3-ylmethy.xyz", skip=1)
```

```
## Error in read.table("thiadiazol-3-ylmethy.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-thiadiazol-3-ylmethy$V2
```

```
## Error in eval(expr, envir, enclos): object 'thiadiazol' not found
```

```r
y<-thiadiazol-3-ylmethy$V3
```

```
## Error in eval(expr, envir, enclos): object 'thiadiazol' not found
```

```r
z<-thiadiazol-3-ylmethy$V4
```

```
## Error in eval(expr, envir, enclos): object 'thiadiazol' not found
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
-3.054342, -0.1064276, 0.0832348, 0, 0, 1, 1, 1,
-3.000764, 0.8877268, -1.040118, 1, 0, 0, 1, 1,
-2.644904, -0.3435172, -0.7813975, 1, 0, 0, 1, 1,
-2.479141, 0.5498806, -1.891379, 1, 0, 0, 1, 1,
-2.450359, -0.9127234, -1.540136, 1, 0, 0, 1, 1,
-2.422461, -0.2986089, -1.067541, 1, 0, 0, 1, 1,
-2.378302, 0.3555317, -3.024713, 0, 0, 0, 1, 1,
-2.295938, 0.4418789, -2.471758, 0, 0, 0, 1, 1,
-2.279438, -0.6481308, -1.420897, 0, 0, 0, 1, 1,
-2.255745, -0.5772637, -2.354073, 0, 0, 0, 1, 1,
-2.230478, -1.307902, -1.623865, 0, 0, 0, 1, 1,
-2.223795, -0.6918927, -2.428405, 0, 0, 0, 1, 1,
-2.212818, -0.5109909, -0.4729194, 0, 0, 0, 1, 1,
-2.170406, -0.646711, -3.385317, 1, 1, 1, 1, 1,
-2.144289, 0.8685873, -0.8711496, 1, 1, 1, 1, 1,
-2.124763, 0.7131909, -2.150916, 1, 1, 1, 1, 1,
-2.042971, -0.6041782, -0.09896876, 1, 1, 1, 1, 1,
-2.038248, 0.8865603, -0.3079361, 1, 1, 1, 1, 1,
-2.008512, 0.2693702, -2.259633, 1, 1, 1, 1, 1,
-2.002905, -1.36086, -2.318401, 1, 1, 1, 1, 1,
-1.991766, 0.5033487, -0.7221119, 1, 1, 1, 1, 1,
-1.963836, -1.405541, -1.710582, 1, 1, 1, 1, 1,
-1.957073, -0.761194, -1.091428, 1, 1, 1, 1, 1,
-1.937314, -0.2390172, -3.253555, 1, 1, 1, 1, 1,
-1.921975, -2.232832, -2.687135, 1, 1, 1, 1, 1,
-1.908019, 0.6463674, -0.7137567, 1, 1, 1, 1, 1,
-1.901103, -1.033477, -2.213348, 1, 1, 1, 1, 1,
-1.853374, -0.6799935, -1.933212, 1, 1, 1, 1, 1,
-1.849109, -1.060043, -3.492958, 0, 0, 1, 1, 1,
-1.848591, 1.033381, -1.411509, 1, 0, 0, 1, 1,
-1.845037, 0.3150156, 0.6048929, 1, 0, 0, 1, 1,
-1.841911, -0.4577898, -2.508901, 1, 0, 0, 1, 1,
-1.825787, -0.7641086, -2.085799, 1, 0, 0, 1, 1,
-1.816514, -0.2983322, -0.7569458, 1, 0, 0, 1, 1,
-1.809381, -0.9225518, -2.678023, 0, 0, 0, 1, 1,
-1.802859, -0.7342165, -1.618123, 0, 0, 0, 1, 1,
-1.800389, 0.1078995, -1.154816, 0, 0, 0, 1, 1,
-1.795761, 0.0007890005, -2.549486, 0, 0, 0, 1, 1,
-1.761137, -0.4933204, -1.952564, 0, 0, 0, 1, 1,
-1.756317, -0.210988, -1.823226, 0, 0, 0, 1, 1,
-1.751278, -0.7218679, -1.596678, 0, 0, 0, 1, 1,
-1.750033, 2.454142, 0.5546895, 1, 1, 1, 1, 1,
-1.7402, -0.5026602, -1.610492, 1, 1, 1, 1, 1,
-1.734811, 0.7742313, 0.1720133, 1, 1, 1, 1, 1,
-1.729939, 0.1445353, -2.314574, 1, 1, 1, 1, 1,
-1.720303, -0.6855233, 0.4483677, 1, 1, 1, 1, 1,
-1.713998, 1.222298, -0.1430027, 1, 1, 1, 1, 1,
-1.699917, 0.6941947, -0.3985063, 1, 1, 1, 1, 1,
-1.697251, -0.3605188, -1.5602, 1, 1, 1, 1, 1,
-1.697038, -2.475152, -2.653107, 1, 1, 1, 1, 1,
-1.692252, 0.4011593, -3.105512, 1, 1, 1, 1, 1,
-1.687771, 0.1737452, -0.8491015, 1, 1, 1, 1, 1,
-1.681577, 0.3040689, -1.232835, 1, 1, 1, 1, 1,
-1.675991, 0.604254, -0.7707011, 1, 1, 1, 1, 1,
-1.667476, 1.083322, -0.9103548, 1, 1, 1, 1, 1,
-1.658878, 0.1494517, -0.6421439, 1, 1, 1, 1, 1,
-1.653007, 0.2813741, -0.3850293, 0, 0, 1, 1, 1,
-1.65233, -1.422833, -0.971909, 1, 0, 0, 1, 1,
-1.641065, -0.8533078, -1.784588, 1, 0, 0, 1, 1,
-1.633665, 0.782455, -1.180263, 1, 0, 0, 1, 1,
-1.61529, 2.82784, 0.7624254, 1, 0, 0, 1, 1,
-1.604772, -0.3000002, -3.03458, 1, 0, 0, 1, 1,
-1.601247, 0.8671043, -0.9132843, 0, 0, 0, 1, 1,
-1.590793, -0.5169434, -3.582806, 0, 0, 0, 1, 1,
-1.581072, 1.374911, -0.2363972, 0, 0, 0, 1, 1,
-1.538515, -0.9142826, -2.792068, 0, 0, 0, 1, 1,
-1.537353, -0.9446487, -3.184249, 0, 0, 0, 1, 1,
-1.515689, 0.01040022, -2.425183, 0, 0, 0, 1, 1,
-1.511056, 1.350004, 0.7969855, 0, 0, 0, 1, 1,
-1.504916, 0.4243861, -1.92709, 1, 1, 1, 1, 1,
-1.493916, -0.4987645, -1.851962, 1, 1, 1, 1, 1,
-1.48165, -0.1672976, -0.8735864, 1, 1, 1, 1, 1,
-1.466491, -0.1075017, -1.732718, 1, 1, 1, 1, 1,
-1.455687, -0.01817882, -2.069912, 1, 1, 1, 1, 1,
-1.449263, -1.319963, -2.281611, 1, 1, 1, 1, 1,
-1.439842, 1.45197, 1.125498, 1, 1, 1, 1, 1,
-1.42731, 0.6014047, -2.105904, 1, 1, 1, 1, 1,
-1.426994, -0.9811329, -1.92896, 1, 1, 1, 1, 1,
-1.41934, 0.07242661, -2.299488, 1, 1, 1, 1, 1,
-1.418179, 0.1874872, -3.594609, 1, 1, 1, 1, 1,
-1.416104, -0.5141287, -2.664236, 1, 1, 1, 1, 1,
-1.407135, 1.411742, -1.125065, 1, 1, 1, 1, 1,
-1.401527, 0.3407024, -0.2362332, 1, 1, 1, 1, 1,
-1.39465, -1.355697, -1.899073, 1, 1, 1, 1, 1,
-1.391634, 1.201885, -2.45653, 0, 0, 1, 1, 1,
-1.370808, -1.132379, -1.616111, 1, 0, 0, 1, 1,
-1.368001, -0.2841718, -0.5924227, 1, 0, 0, 1, 1,
-1.367379, 0.5997832, -0.9695318, 1, 0, 0, 1, 1,
-1.364323, 0.635547, -1.199821, 1, 0, 0, 1, 1,
-1.349936, -0.4242133, -2.318944, 1, 0, 0, 1, 1,
-1.343674, -0.4138486, -3.647077, 0, 0, 0, 1, 1,
-1.339932, -0.3344267, -3.418294, 0, 0, 0, 1, 1,
-1.332878, 0.7697408, -0.1420165, 0, 0, 0, 1, 1,
-1.32941, 0.6273117, -1.842721, 0, 0, 0, 1, 1,
-1.324129, 2.165916, -2.535784, 0, 0, 0, 1, 1,
-1.323925, 0.6343914, -0.2993907, 0, 0, 0, 1, 1,
-1.311693, 1.609413, 0.4413974, 0, 0, 0, 1, 1,
-1.309004, -0.1781113, -1.613936, 1, 1, 1, 1, 1,
-1.307329, 0.3678364, -1.346308, 1, 1, 1, 1, 1,
-1.304788, -1.071471, -1.851907, 1, 1, 1, 1, 1,
-1.30159, -0.5479372, -1.515326, 1, 1, 1, 1, 1,
-1.300922, -0.056517, -0.4605813, 1, 1, 1, 1, 1,
-1.300682, -0.3726861, -1.91411, 1, 1, 1, 1, 1,
-1.292423, 2.553021, -0.7982211, 1, 1, 1, 1, 1,
-1.274929, 1.44114, 0.4754003, 1, 1, 1, 1, 1,
-1.27116, -0.9649175, -2.789246, 1, 1, 1, 1, 1,
-1.268265, 1.534057, 0.6572128, 1, 1, 1, 1, 1,
-1.260456, 1.175073, -1.655176, 1, 1, 1, 1, 1,
-1.255587, 0.4134609, -1.783277, 1, 1, 1, 1, 1,
-1.249049, -1.443396, -3.899318, 1, 1, 1, 1, 1,
-1.248517, 0.06994463, -1.291735, 1, 1, 1, 1, 1,
-1.243211, -0.9805007, -3.489613, 1, 1, 1, 1, 1,
-1.242115, 1.165024, -1.55625, 0, 0, 1, 1, 1,
-1.241069, -1.108923, -1.136459, 1, 0, 0, 1, 1,
-1.236677, -1.622273, -1.324066, 1, 0, 0, 1, 1,
-1.233176, -1.194093, -2.20052, 1, 0, 0, 1, 1,
-1.232783, -1.078456, -2.338776, 1, 0, 0, 1, 1,
-1.22826, -0.3319353, -0.2568207, 1, 0, 0, 1, 1,
-1.225277, -0.0364903, 0.1166994, 0, 0, 0, 1, 1,
-1.223884, -0.4304708, -1.316927, 0, 0, 0, 1, 1,
-1.222194, 0.4518293, -0.536643, 0, 0, 0, 1, 1,
-1.217089, 1.654452, -0.08048812, 0, 0, 0, 1, 1,
-1.207914, -1.311609, -1.963378, 0, 0, 0, 1, 1,
-1.207523, -0.3133062, -1.760069, 0, 0, 0, 1, 1,
-1.206198, -0.5951406, -1.606264, 0, 0, 0, 1, 1,
-1.203509, -0.8279088, -3.294269, 1, 1, 1, 1, 1,
-1.198816, 0.06086016, -0.374694, 1, 1, 1, 1, 1,
-1.183403, -0.01827022, -2.294409, 1, 1, 1, 1, 1,
-1.183305, -0.7689241, -2.909674, 1, 1, 1, 1, 1,
-1.177568, 0.1233907, -2.571975, 1, 1, 1, 1, 1,
-1.17157, -0.1559064, -0.07010972, 1, 1, 1, 1, 1,
-1.164316, -0.4678579, -3.005944, 1, 1, 1, 1, 1,
-1.163766, 0.02213001, -0.706691, 1, 1, 1, 1, 1,
-1.14425, -0.7739637, -4.076683, 1, 1, 1, 1, 1,
-1.139201, -0.1696049, -3.365554, 1, 1, 1, 1, 1,
-1.128605, 0.3385937, -2.071914, 1, 1, 1, 1, 1,
-1.128198, 0.2366788, 0.5348774, 1, 1, 1, 1, 1,
-1.125993, -1.171154, -2.15327, 1, 1, 1, 1, 1,
-1.114639, -0.955097, -3.803718, 1, 1, 1, 1, 1,
-1.114531, -0.4937922, -3.16524, 1, 1, 1, 1, 1,
-1.113037, -0.6996907, -2.6801, 0, 0, 1, 1, 1,
-1.107369, -0.7844998, -0.6284775, 1, 0, 0, 1, 1,
-1.102203, 0.2483287, -2.123116, 1, 0, 0, 1, 1,
-1.097359, 0.6364517, -1.618946, 1, 0, 0, 1, 1,
-1.097085, 0.9881322, -0.4538644, 1, 0, 0, 1, 1,
-1.094546, 1.638453, -0.9934111, 1, 0, 0, 1, 1,
-1.087093, -0.535074, -1.556707, 0, 0, 0, 1, 1,
-1.080956, -1.141841, -2.042601, 0, 0, 0, 1, 1,
-1.070235, -1.082956, -2.650267, 0, 0, 0, 1, 1,
-1.065233, -0.294235, -2.366624, 0, 0, 0, 1, 1,
-1.064139, -0.1426594, -1.774803, 0, 0, 0, 1, 1,
-1.051638, 1.654895, 0.8496253, 0, 0, 0, 1, 1,
-1.046716, -2.224651, -2.079585, 0, 0, 0, 1, 1,
-1.045725, -0.94276, -2.727409, 1, 1, 1, 1, 1,
-1.045125, 1.293245, 0.4747924, 1, 1, 1, 1, 1,
-1.043588, -1.858952, -2.66622, 1, 1, 1, 1, 1,
-1.042726, 0.4601849, 0.6397562, 1, 1, 1, 1, 1,
-1.042243, -0.0429713, -2.172404, 1, 1, 1, 1, 1,
-1.041806, -0.9476344, -1.178078, 1, 1, 1, 1, 1,
-1.041045, -1.583957, -3.775218, 1, 1, 1, 1, 1,
-1.035562, -1.3402, -2.676126, 1, 1, 1, 1, 1,
-1.029219, 2.108522, 0.7845566, 1, 1, 1, 1, 1,
-1.026194, -0.4235332, -0.5868736, 1, 1, 1, 1, 1,
-1.02322, 0.08340061, -1.275715, 1, 1, 1, 1, 1,
-1.017428, -1.716777, -3.395113, 1, 1, 1, 1, 1,
-1.015989, -2.017632, -2.30893, 1, 1, 1, 1, 1,
-1.015602, -0.982276, -2.444912, 1, 1, 1, 1, 1,
-1.011139, 1.298701, 0.8520479, 1, 1, 1, 1, 1,
-1.008828, 0.6728911, -1.847039, 0, 0, 1, 1, 1,
-1.006866, 1.152943, 0.5536616, 1, 0, 0, 1, 1,
-1.004244, -0.03736727, -1.368665, 1, 0, 0, 1, 1,
-1.00374, 1.931166, 0.2191243, 1, 0, 0, 1, 1,
-1.003233, 0.563921, -1.2837, 1, 0, 0, 1, 1,
-0.9972439, 2.619407, 0.1122774, 1, 0, 0, 1, 1,
-0.9890351, 0.6308483, 0.9250095, 0, 0, 0, 1, 1,
-0.988496, -1.442241, -2.017239, 0, 0, 0, 1, 1,
-0.9878137, -0.3957149, -4.093819, 0, 0, 0, 1, 1,
-0.9838249, 0.0160754, -0.6485289, 0, 0, 0, 1, 1,
-0.9757825, 0.3521065, -0.5293652, 0, 0, 0, 1, 1,
-0.9677514, -1.083482, -3.420245, 0, 0, 0, 1, 1,
-0.9633895, 0.3030336, -1.554626, 0, 0, 0, 1, 1,
-0.9615059, 0.001642552, -2.599831, 1, 1, 1, 1, 1,
-0.9490303, -1.017899, -2.067475, 1, 1, 1, 1, 1,
-0.9432002, -0.9876323, -2.332799, 1, 1, 1, 1, 1,
-0.9379846, -1.265905, -3.927408, 1, 1, 1, 1, 1,
-0.9341056, -1.568061, -2.528851, 1, 1, 1, 1, 1,
-0.932445, 1.241724, -1.342454, 1, 1, 1, 1, 1,
-0.9306064, -0.5079403, -1.854092, 1, 1, 1, 1, 1,
-0.9293984, 0.2836913, -2.452365, 1, 1, 1, 1, 1,
-0.9215316, -0.1223989, -1.937109, 1, 1, 1, 1, 1,
-0.9200832, 1.026019, 1.731747, 1, 1, 1, 1, 1,
-0.9178098, -1.021937, -2.105775, 1, 1, 1, 1, 1,
-0.9151029, 0.3990939, -0.1548143, 1, 1, 1, 1, 1,
-0.9134106, 0.220548, -0.04623378, 1, 1, 1, 1, 1,
-0.9110476, 0.04528056, -2.674892, 1, 1, 1, 1, 1,
-0.9059955, 1.353268, -1.632236, 1, 1, 1, 1, 1,
-0.904169, -0.3552267, -0.6719819, 0, 0, 1, 1, 1,
-0.9034422, 0.02595281, -2.003361, 1, 0, 0, 1, 1,
-0.9010933, 1.57256, -2.578619, 1, 0, 0, 1, 1,
-0.8742079, 0.346938, 0.6360146, 1, 0, 0, 1, 1,
-0.8685502, -0.5760999, -3.584481, 1, 0, 0, 1, 1,
-0.8655376, -0.493264, -1.443762, 1, 0, 0, 1, 1,
-0.8626525, 0.003862788, -2.727874, 0, 0, 0, 1, 1,
-0.8623813, -0.1091312, -1.793371, 0, 0, 0, 1, 1,
-0.8609058, 1.773934, -0.9223468, 0, 0, 0, 1, 1,
-0.8501296, -0.7924588, -2.209464, 0, 0, 0, 1, 1,
-0.8409673, -0.2798368, -1.665689, 0, 0, 0, 1, 1,
-0.8353743, 0.5931684, -1.691753, 0, 0, 0, 1, 1,
-0.8284894, 1.426836, -1.361751, 0, 0, 0, 1, 1,
-0.8243214, -1.697718, -1.397429, 1, 1, 1, 1, 1,
-0.8227721, -1.486944, -2.937925, 1, 1, 1, 1, 1,
-0.8220027, 0.5021734, -2.183087, 1, 1, 1, 1, 1,
-0.8196371, -0.5457542, -3.293778, 1, 1, 1, 1, 1,
-0.8192828, -2.000317, -5.409667, 1, 1, 1, 1, 1,
-0.8122998, -0.8901457, -2.34596, 1, 1, 1, 1, 1,
-0.7898282, -0.7007481, -3.006903, 1, 1, 1, 1, 1,
-0.7892199, -0.08043642, -1.948551, 1, 1, 1, 1, 1,
-0.7836768, 0.5935277, -1.942509, 1, 1, 1, 1, 1,
-0.7747387, 0.04802334, -1.253055, 1, 1, 1, 1, 1,
-0.7545208, -0.05725938, -1.027797, 1, 1, 1, 1, 1,
-0.7455616, -0.5151303, -2.363984, 1, 1, 1, 1, 1,
-0.7410201, 0.7033069, -2.290512, 1, 1, 1, 1, 1,
-0.7365183, -0.9328133, -4.128476, 1, 1, 1, 1, 1,
-0.729482, -0.2547414, -1.081308, 1, 1, 1, 1, 1,
-0.7277005, 0.1667158, -2.682212, 0, 0, 1, 1, 1,
-0.7262818, 0.06407744, -1.798409, 1, 0, 0, 1, 1,
-0.7212313, -1.869895, -3.494651, 1, 0, 0, 1, 1,
-0.7129189, 0.3462639, -0.7843348, 1, 0, 0, 1, 1,
-0.7101273, 0.4413674, -0.8348254, 1, 0, 0, 1, 1,
-0.7006757, -0.4490683, -0.9648195, 1, 0, 0, 1, 1,
-0.6998721, 0.260042, -1.957504, 0, 0, 0, 1, 1,
-0.6991261, -0.3858837, -1.706091, 0, 0, 0, 1, 1,
-0.6990273, -0.4099133, -2.582567, 0, 0, 0, 1, 1,
-0.6976389, 1.362215, -0.1364106, 0, 0, 0, 1, 1,
-0.6974255, -0.3568464, -1.099685, 0, 0, 0, 1, 1,
-0.695553, -1.489214, -3.188138, 0, 0, 0, 1, 1,
-0.695126, -0.03305519, -2.347703, 0, 0, 0, 1, 1,
-0.6864169, -1.633023, -0.7935225, 1, 1, 1, 1, 1,
-0.683431, 1.528379, -1.190006, 1, 1, 1, 1, 1,
-0.6819466, 1.125751, -0.1281992, 1, 1, 1, 1, 1,
-0.6818638, 0.4745539, -0.334686, 1, 1, 1, 1, 1,
-0.6795052, -0.8158802, -0.4805987, 1, 1, 1, 1, 1,
-0.6781093, 0.6777031, -0.9174061, 1, 1, 1, 1, 1,
-0.6737854, -0.1884209, -2.6151, 1, 1, 1, 1, 1,
-0.6735401, 0.8327961, -0.1224335, 1, 1, 1, 1, 1,
-0.6723735, -2.469568, -3.123671, 1, 1, 1, 1, 1,
-0.6679572, 0.716795, -0.8378093, 1, 1, 1, 1, 1,
-0.6660919, -2.083373, -2.659967, 1, 1, 1, 1, 1,
-0.6636906, 0.9972461, -1.386889, 1, 1, 1, 1, 1,
-0.6636868, -0.07580577, -1.105255, 1, 1, 1, 1, 1,
-0.6616479, -0.2416854, -1.211356, 1, 1, 1, 1, 1,
-0.6611285, 0.1871064, 0.5333592, 1, 1, 1, 1, 1,
-0.659695, 0.7230638, -1.248061, 0, 0, 1, 1, 1,
-0.6557287, 0.5140731, -0.8799312, 1, 0, 0, 1, 1,
-0.6533288, -1.822295, -1.783974, 1, 0, 0, 1, 1,
-0.6461795, -0.8168137, -3.340019, 1, 0, 0, 1, 1,
-0.644622, -1.233675, -3.191229, 1, 0, 0, 1, 1,
-0.6415244, -1.036341, -3.147575, 1, 0, 0, 1, 1,
-0.6375456, 0.2046059, -2.256095, 0, 0, 0, 1, 1,
-0.6372175, 0.8561646, 0.211352, 0, 0, 0, 1, 1,
-0.6362032, -0.1907468, -3.14325, 0, 0, 0, 1, 1,
-0.633536, 1.406644, -2.202544, 0, 0, 0, 1, 1,
-0.6287089, -2.017528, -0.5162509, 0, 0, 0, 1, 1,
-0.6277363, 1.416314, 1.677657, 0, 0, 0, 1, 1,
-0.6273406, 0.9111662, -0.6845021, 0, 0, 0, 1, 1,
-0.62674, -0.5899386, -2.407336, 1, 1, 1, 1, 1,
-0.6242431, -1.557123, -2.981626, 1, 1, 1, 1, 1,
-0.6203512, 1.218561, -0.5120363, 1, 1, 1, 1, 1,
-0.6190258, 0.03465973, -4.040283, 1, 1, 1, 1, 1,
-0.6143787, -0.1858361, -2.318398, 1, 1, 1, 1, 1,
-0.6123015, 0.2449263, -0.06269161, 1, 1, 1, 1, 1,
-0.6100605, -1.599395, -2.149003, 1, 1, 1, 1, 1,
-0.6097694, 0.4294844, -0.4687047, 1, 1, 1, 1, 1,
-0.6038061, 0.4929803, -1.016063, 1, 1, 1, 1, 1,
-0.6019664, 0.8209159, 0.8773367, 1, 1, 1, 1, 1,
-0.5999412, 0.5715567, -1.394047, 1, 1, 1, 1, 1,
-0.5983151, -0.6593033, -3.350811, 1, 1, 1, 1, 1,
-0.5973038, 0.7522394, 0.6783913, 1, 1, 1, 1, 1,
-0.5961196, -0.7787697, -0.4339215, 1, 1, 1, 1, 1,
-0.5945248, -0.8888494, -2.96931, 1, 1, 1, 1, 1,
-0.5928934, -0.2670879, -2.970147, 0, 0, 1, 1, 1,
-0.5909251, -0.6537587, -3.278301, 1, 0, 0, 1, 1,
-0.5880576, -0.6966254, -2.0049, 1, 0, 0, 1, 1,
-0.5870028, -0.2402827, -1.958452, 1, 0, 0, 1, 1,
-0.5842008, 1.141234, -0.7476202, 1, 0, 0, 1, 1,
-0.5841245, -1.71417, -3.737262, 1, 0, 0, 1, 1,
-0.5833177, -0.202909, -2.768727, 0, 0, 0, 1, 1,
-0.5827147, -1.524612, -3.109081, 0, 0, 0, 1, 1,
-0.5820952, 1.083379, -1.901457, 0, 0, 0, 1, 1,
-0.5785881, 0.01884613, 0.1363221, 0, 0, 0, 1, 1,
-0.5712849, -0.2142837, -2.238941, 0, 0, 0, 1, 1,
-0.5692931, 0.276964, -0.8513627, 0, 0, 0, 1, 1,
-0.5685254, 0.5032688, -1.53436, 0, 0, 0, 1, 1,
-0.5654764, 0.4696591, -1.288403, 1, 1, 1, 1, 1,
-0.5629866, 1.493269, -0.8597774, 1, 1, 1, 1, 1,
-0.5609244, -2.203279, -2.617534, 1, 1, 1, 1, 1,
-0.5608798, -0.009563578, -0.654635, 1, 1, 1, 1, 1,
-0.5582962, -0.4054783, -1.08601, 1, 1, 1, 1, 1,
-0.5558843, -0.8425361, -3.804578, 1, 1, 1, 1, 1,
-0.5530659, -1.782705, -3.835652, 1, 1, 1, 1, 1,
-0.5483552, 0.4326886, 1.591301, 1, 1, 1, 1, 1,
-0.546392, -0.150169, -1.294726, 1, 1, 1, 1, 1,
-0.5438533, 0.6060637, -1.30016, 1, 1, 1, 1, 1,
-0.5351536, 1.299027, -1.307341, 1, 1, 1, 1, 1,
-0.527999, -0.0615675, -1.110558, 1, 1, 1, 1, 1,
-0.5262295, 0.7402019, -0.57727, 1, 1, 1, 1, 1,
-0.5211685, 1.310103, 0.2179516, 1, 1, 1, 1, 1,
-0.5187314, -0.9282978, -2.792522, 1, 1, 1, 1, 1,
-0.5173515, 1.227373, -1.3978, 0, 0, 1, 1, 1,
-0.5144408, 0.02105181, -0.2379018, 1, 0, 0, 1, 1,
-0.5120723, -0.1379493, -0.2884821, 1, 0, 0, 1, 1,
-0.5113113, -0.6414202, -2.237344, 1, 0, 0, 1, 1,
-0.5103968, -1.406737, -1.821916, 1, 0, 0, 1, 1,
-0.5069335, -0.06656982, -1.983532, 1, 0, 0, 1, 1,
-0.5006829, 2.188007, -0.7552143, 0, 0, 0, 1, 1,
-0.4980853, 1.43946, 1.133384, 0, 0, 0, 1, 1,
-0.4967589, -0.4178709, -3.276139, 0, 0, 0, 1, 1,
-0.4913604, 0.5427631, -0.7158915, 0, 0, 0, 1, 1,
-0.4908606, -0.542244, -2.551119, 0, 0, 0, 1, 1,
-0.4877519, -0.4321021, -1.702933, 0, 0, 0, 1, 1,
-0.4876644, 0.7185482, 0.8898689, 0, 0, 0, 1, 1,
-0.4872642, -1.563025, -2.642808, 1, 1, 1, 1, 1,
-0.4871888, -0.3120362, -3.223367, 1, 1, 1, 1, 1,
-0.481178, 2.687107, -0.4999874, 1, 1, 1, 1, 1,
-0.4811044, -0.9374827, -3.537167, 1, 1, 1, 1, 1,
-0.4750265, 1.333361, -1.118973, 1, 1, 1, 1, 1,
-0.4718729, 0.3713752, 0.5594122, 1, 1, 1, 1, 1,
-0.4710854, 1.442077, 0.9588279, 1, 1, 1, 1, 1,
-0.4700675, 1.091542, -0.2764028, 1, 1, 1, 1, 1,
-0.4681996, -1.721697, -0.8776185, 1, 1, 1, 1, 1,
-0.4678659, -1.008197, -1.484472, 1, 1, 1, 1, 1,
-0.4618795, 0.02500952, -2.957248, 1, 1, 1, 1, 1,
-0.4590627, -0.2375091, -1.299925, 1, 1, 1, 1, 1,
-0.4534446, 0.203752, -0.08259788, 1, 1, 1, 1, 1,
-0.4415393, -2.04852, -2.749732, 1, 1, 1, 1, 1,
-0.4343502, -0.8438813, -1.660008, 1, 1, 1, 1, 1,
-0.4333178, 1.238566, 0.3248796, 0, 0, 1, 1, 1,
-0.4308977, -2.83931, -2.969058, 1, 0, 0, 1, 1,
-0.4305066, -1.582816, -2.90285, 1, 0, 0, 1, 1,
-0.4239243, -0.1824549, -0.8716273, 1, 0, 0, 1, 1,
-0.4219349, -1.174101, -2.520264, 1, 0, 0, 1, 1,
-0.4174007, -0.4492145, -3.106189, 1, 0, 0, 1, 1,
-0.415789, 0.8948075, 0.04991275, 0, 0, 0, 1, 1,
-0.4156734, 0.03018719, -0.1146541, 0, 0, 0, 1, 1,
-0.414257, 1.788933, -0.1397044, 0, 0, 0, 1, 1,
-0.4062214, -1.655118, -3.178559, 0, 0, 0, 1, 1,
-0.4048868, -0.6751887, -2.784353, 0, 0, 0, 1, 1,
-0.4005242, 0.5675595, -0.9143079, 0, 0, 0, 1, 1,
-0.3999578, -1.009765, -1.775619, 0, 0, 0, 1, 1,
-0.397115, 0.3799295, -0.143071, 1, 1, 1, 1, 1,
-0.3969447, -1.291633, -3.950141, 1, 1, 1, 1, 1,
-0.393459, -0.4252524, -2.669301, 1, 1, 1, 1, 1,
-0.38632, 1.008292, -0.1600947, 1, 1, 1, 1, 1,
-0.3826171, 0.5692385, 0.233555, 1, 1, 1, 1, 1,
-0.3792865, 1.840633, 1.783707, 1, 1, 1, 1, 1,
-0.378179, 0.9859386, 0.401508, 1, 1, 1, 1, 1,
-0.3747565, 0.5983859, -2.638377, 1, 1, 1, 1, 1,
-0.3739108, 0.1988046, 0.9031298, 1, 1, 1, 1, 1,
-0.3658967, 1.198263, -0.1246072, 1, 1, 1, 1, 1,
-0.3611369, 1.067241, -1.017884, 1, 1, 1, 1, 1,
-0.3569845, -1.538976, -1.777154, 1, 1, 1, 1, 1,
-0.3543848, -0.05215209, -1.036288, 1, 1, 1, 1, 1,
-0.3532736, 0.7400875, -0.6417761, 1, 1, 1, 1, 1,
-0.3505144, 1.678709, -0.314461, 1, 1, 1, 1, 1,
-0.3493109, 0.8301776, 0.08350614, 0, 0, 1, 1, 1,
-0.3466211, 0.2945575, -0.9388113, 1, 0, 0, 1, 1,
-0.3425244, 0.02824999, -1.368109, 1, 0, 0, 1, 1,
-0.3418258, 0.03311721, -0.4416795, 1, 0, 0, 1, 1,
-0.3384579, 0.2838292, -0.5724098, 1, 0, 0, 1, 1,
-0.335752, 0.3830771, 1.320023, 1, 0, 0, 1, 1,
-0.3347244, 0.6378449, -0.84976, 0, 0, 0, 1, 1,
-0.3309736, -1.254539, -3.244264, 0, 0, 0, 1, 1,
-0.3278564, -0.3333568, -0.6203939, 0, 0, 0, 1, 1,
-0.3261833, -0.7329925, -2.860343, 0, 0, 0, 1, 1,
-0.3256797, 0.2013198, -1.888809, 0, 0, 0, 1, 1,
-0.3239573, 0.1649368, -0.5295499, 0, 0, 0, 1, 1,
-0.3224165, 2.423115, -0.163586, 0, 0, 0, 1, 1,
-0.3204973, -0.7728626, -2.38627, 1, 1, 1, 1, 1,
-0.3141895, -0.7131914, -3.30545, 1, 1, 1, 1, 1,
-0.3141387, 1.970386, -1.473011, 1, 1, 1, 1, 1,
-0.3116302, 1.251356, -1.008166, 1, 1, 1, 1, 1,
-0.309721, 0.1187313, -1.424998, 1, 1, 1, 1, 1,
-0.2960965, 0.2904718, -1.33039, 1, 1, 1, 1, 1,
-0.2912753, -0.1257676, -1.598419, 1, 1, 1, 1, 1,
-0.2910021, 1.904055, -0.8972545, 1, 1, 1, 1, 1,
-0.2899383, 0.08426932, -1.768991, 1, 1, 1, 1, 1,
-0.2883723, -1.76348, -4.279755, 1, 1, 1, 1, 1,
-0.2874928, 0.2290521, -1.033744, 1, 1, 1, 1, 1,
-0.2870265, -0.2795202, -2.618405, 1, 1, 1, 1, 1,
-0.2821289, -1.019365, -2.920818, 1, 1, 1, 1, 1,
-0.2767151, -0.06723427, -1.876509, 1, 1, 1, 1, 1,
-0.2765906, -0.7045537, -3.520111, 1, 1, 1, 1, 1,
-0.274278, 0.7891268, 0.5528024, 0, 0, 1, 1, 1,
-0.2699571, 1.047165, -0.1029065, 1, 0, 0, 1, 1,
-0.2606892, -1.38041, -1.321273, 1, 0, 0, 1, 1,
-0.2549939, 1.449543, -1.019138, 1, 0, 0, 1, 1,
-0.2547966, 0.121917, -0.7177601, 1, 0, 0, 1, 1,
-0.2441351, 0.3853551, -0.414517, 1, 0, 0, 1, 1,
-0.2412361, 0.1327527, -1.313058, 0, 0, 0, 1, 1,
-0.2402929, 0.9247766, -0.4313542, 0, 0, 0, 1, 1,
-0.2393947, 1.082096, 0.9265352, 0, 0, 0, 1, 1,
-0.2368098, -1.189649, -3.295347, 0, 0, 0, 1, 1,
-0.2349921, -1.434837, -3.81354, 0, 0, 0, 1, 1,
-0.2347648, 1.82933, -0.948806, 0, 0, 0, 1, 1,
-0.2338991, 0.4925232, 0.5637205, 0, 0, 0, 1, 1,
-0.229796, -0.1003609, -2.367171, 1, 1, 1, 1, 1,
-0.2247728, -0.9986416, -2.702697, 1, 1, 1, 1, 1,
-0.2227974, 0.2771475, -0.110538, 1, 1, 1, 1, 1,
-0.221775, -1.356113, -2.61023, 1, 1, 1, 1, 1,
-0.2199836, -0.1188584, -2.771272, 1, 1, 1, 1, 1,
-0.2053065, 0.3492332, -0.9885128, 1, 1, 1, 1, 1,
-0.2052117, 2.649452, 0.1366728, 1, 1, 1, 1, 1,
-0.2048856, -0.8227808, -2.917327, 1, 1, 1, 1, 1,
-0.2010572, 0.9302893, -0.07720453, 1, 1, 1, 1, 1,
-0.1851444, 0.6683264, -1.734147, 1, 1, 1, 1, 1,
-0.1847223, 1.960429, -0.6492099, 1, 1, 1, 1, 1,
-0.1842778, 0.1419069, 0.309159, 1, 1, 1, 1, 1,
-0.1731339, -2.143097, -1.698856, 1, 1, 1, 1, 1,
-0.171652, -0.7789738, -3.283736, 1, 1, 1, 1, 1,
-0.158423, -0.3099369, -2.319815, 1, 1, 1, 1, 1,
-0.1554133, -1.459479, -4.987278, 0, 0, 1, 1, 1,
-0.1525117, -1.297993, -1.711685, 1, 0, 0, 1, 1,
-0.1503793, -0.6334609, -3.791731, 1, 0, 0, 1, 1,
-0.1487991, 2.830945, 0.08318646, 1, 0, 0, 1, 1,
-0.1477293, -1.316643, -1.804146, 1, 0, 0, 1, 1,
-0.1458985, -1.068484, -2.859424, 1, 0, 0, 1, 1,
-0.1453438, 0.09892438, -1.361604, 0, 0, 0, 1, 1,
-0.1442642, -0.7331092, -3.854301, 0, 0, 0, 1, 1,
-0.1439842, 0.5428649, 0.5734028, 0, 0, 0, 1, 1,
-0.1388212, -0.7105229, -3.123092, 0, 0, 0, 1, 1,
-0.13826, 0.01271509, -2.040733, 0, 0, 0, 1, 1,
-0.1337216, 0.6327236, -1.919904, 0, 0, 0, 1, 1,
-0.1287186, -1.310138, -3.127248, 0, 0, 0, 1, 1,
-0.1286752, -1.229492, -2.743862, 1, 1, 1, 1, 1,
-0.1285538, -1.803016, -4.701061, 1, 1, 1, 1, 1,
-0.1209649, -1.763504, -4.188326, 1, 1, 1, 1, 1,
-0.1178395, -0.9373507, -2.623537, 1, 1, 1, 1, 1,
-0.1163929, -0.9942985, -3.251244, 1, 1, 1, 1, 1,
-0.1133925, 1.702891, 0.3515551, 1, 1, 1, 1, 1,
-0.1045778, -0.9040875, -2.906811, 1, 1, 1, 1, 1,
-0.1034571, -0.3252745, -2.502642, 1, 1, 1, 1, 1,
-0.1018113, 0.3977828, -1.522644, 1, 1, 1, 1, 1,
-0.09596485, -0.2468093, -2.289139, 1, 1, 1, 1, 1,
-0.08943557, 0.4888428, -0.7479751, 1, 1, 1, 1, 1,
-0.07457515, 0.2192955, -0.6134095, 1, 1, 1, 1, 1,
-0.07144767, -0.01215018, -1.164124, 1, 1, 1, 1, 1,
-0.06879831, -1.131336, -1.726038, 1, 1, 1, 1, 1,
-0.0683109, -0.6720441, -3.62347, 1, 1, 1, 1, 1,
-0.06226957, -0.3964322, -2.456793, 0, 0, 1, 1, 1,
-0.05553411, -0.05097002, -3.090719, 1, 0, 0, 1, 1,
-0.05392266, 0.1438714, 0.3221545, 1, 0, 0, 1, 1,
-0.04820234, 0.390532, -0.5320668, 1, 0, 0, 1, 1,
-0.04486394, 0.1350852, -2.231465, 1, 0, 0, 1, 1,
-0.0444081, -0.2519615, -1.815297, 1, 0, 0, 1, 1,
-0.04434767, 0.3937075, 0.452419, 0, 0, 0, 1, 1,
-0.04155614, -0.7582383, -2.703712, 0, 0, 0, 1, 1,
-0.03960434, 0.3103881, 0.1426986, 0, 0, 0, 1, 1,
-0.03880929, -0.490141, -3.541827, 0, 0, 0, 1, 1,
-0.03333983, 0.4038346, -1.15718, 0, 0, 0, 1, 1,
-0.03195738, -0.6659935, -1.86365, 0, 0, 0, 1, 1,
-0.03054035, -1.775862, -3.378806, 0, 0, 0, 1, 1,
-0.02952085, -0.04874133, -2.69337, 1, 1, 1, 1, 1,
-0.02915826, -0.2682686, -3.049491, 1, 1, 1, 1, 1,
-0.02793116, 0.9293849, -1.021847, 1, 1, 1, 1, 1,
-0.02752403, -0.05286112, -1.193152, 1, 1, 1, 1, 1,
-0.02599372, 1.149518, 1.103249, 1, 1, 1, 1, 1,
-0.02450398, 1.063629, 0.991445, 1, 1, 1, 1, 1,
-0.02423883, 0.01919988, -2.045888, 1, 1, 1, 1, 1,
-0.02374917, 1.140389, 0.6601894, 1, 1, 1, 1, 1,
-0.02242603, -0.8100091, -3.285937, 1, 1, 1, 1, 1,
-0.02018467, 0.7862489, -0.4938761, 1, 1, 1, 1, 1,
-0.01988318, -0.457938, -3.840297, 1, 1, 1, 1, 1,
-0.01755537, 0.9910195, -0.1718847, 1, 1, 1, 1, 1,
-0.01567668, 1.257076, 0.7270178, 1, 1, 1, 1, 1,
-0.01369121, 1.10651, 0.8544589, 1, 1, 1, 1, 1,
-0.01346078, 1.035178, 0.3511828, 1, 1, 1, 1, 1,
-0.01102204, 1.572562, -1.314193, 0, 0, 1, 1, 1,
-0.003874965, -0.2295966, -3.008584, 1, 0, 0, 1, 1,
-0.003322638, -0.1551392, -3.880732, 1, 0, 0, 1, 1,
-0.003221012, 0.509567, 2.183913, 1, 0, 0, 1, 1,
-0.001954705, -0.6051998, -3.831201, 1, 0, 0, 1, 1,
-0.001123767, -1.48461, -3.192745, 1, 0, 0, 1, 1,
0.0004335033, 1.285911, 1.275386, 0, 0, 0, 1, 1,
0.0007977311, 0.3839775, 0.4734747, 0, 0, 0, 1, 1,
0.001300874, -1.883759, 1.962471, 0, 0, 0, 1, 1,
0.002645246, -0.5558018, 1.302549, 0, 0, 0, 1, 1,
0.005067186, -0.9230239, 4.642715, 0, 0, 0, 1, 1,
0.006900786, 0.6720904, 0.2249226, 0, 0, 0, 1, 1,
0.007487261, 0.2744304, -0.7457134, 0, 0, 0, 1, 1,
0.009308912, -1.028514, 4.059547, 1, 1, 1, 1, 1,
0.01000611, 0.03379828, -0.7913191, 1, 1, 1, 1, 1,
0.01615459, -0.438631, 2.974091, 1, 1, 1, 1, 1,
0.01797188, -0.8429376, 2.587041, 1, 1, 1, 1, 1,
0.02311107, -0.7242579, 3.341928, 1, 1, 1, 1, 1,
0.02704042, 1.362337, -0.6161163, 1, 1, 1, 1, 1,
0.02917408, 1.929453, 0.1647973, 1, 1, 1, 1, 1,
0.03085003, -0.8527125, 2.197257, 1, 1, 1, 1, 1,
0.03156197, 0.4107487, -0.756999, 1, 1, 1, 1, 1,
0.03176738, -0.4089781, 4.570323, 1, 1, 1, 1, 1,
0.03249055, 1.647651, -0.03532296, 1, 1, 1, 1, 1,
0.0367657, -0.8530668, 5.265456, 1, 1, 1, 1, 1,
0.04158062, -0.0130645, 2.089204, 1, 1, 1, 1, 1,
0.04801563, 1.599791, 0.02867989, 1, 1, 1, 1, 1,
0.05465996, 1.230945, -0.3586046, 1, 1, 1, 1, 1,
0.06029651, -2.263218, 2.699689, 0, 0, 1, 1, 1,
0.06515455, 2.266647, -1.02865, 1, 0, 0, 1, 1,
0.07078241, 0.7562689, 0.6431878, 1, 0, 0, 1, 1,
0.07332977, 1.370277, -0.987649, 1, 0, 0, 1, 1,
0.07711087, -1.079003, 1.882851, 1, 0, 0, 1, 1,
0.07879751, -0.3483928, 3.046057, 1, 0, 0, 1, 1,
0.07896223, 0.8351817, 0.7922516, 0, 0, 0, 1, 1,
0.08142041, -1.703935, 3.850668, 0, 0, 0, 1, 1,
0.08884891, -2.450223, 2.172531, 0, 0, 0, 1, 1,
0.0952243, 0.6614324, -0.08480872, 0, 0, 0, 1, 1,
0.09551366, 2.014062, -0.2078808, 0, 0, 0, 1, 1,
0.09689647, 0.2738301, -0.2707893, 0, 0, 0, 1, 1,
0.101504, 1.333118, -3.093225, 0, 0, 0, 1, 1,
0.1023369, -0.4132206, 4.032917, 1, 1, 1, 1, 1,
0.1034374, -0.1771378, 2.811626, 1, 1, 1, 1, 1,
0.1036459, 0.4454435, 0.1566812, 1, 1, 1, 1, 1,
0.1041716, -1.354147, 2.374198, 1, 1, 1, 1, 1,
0.1045565, -0.0402424, 2.919324, 1, 1, 1, 1, 1,
0.1068003, -0.8999969, 5.012263, 1, 1, 1, 1, 1,
0.1100432, -0.8708257, 4.379152, 1, 1, 1, 1, 1,
0.1122179, -0.4811719, 1.914083, 1, 1, 1, 1, 1,
0.1139832, 0.1279366, -0.2497396, 1, 1, 1, 1, 1,
0.1148457, 1.025174, -0.478361, 1, 1, 1, 1, 1,
0.1151142, 0.8126329, 0.5908077, 1, 1, 1, 1, 1,
0.1165218, 0.1708498, 1.30911, 1, 1, 1, 1, 1,
0.1173015, 1.008224, 1.089249, 1, 1, 1, 1, 1,
0.1225975, -0.7863311, 3.022878, 1, 1, 1, 1, 1,
0.1246831, 1.186773, 1.162986, 1, 1, 1, 1, 1,
0.124976, 0.2541379, 0.3164282, 0, 0, 1, 1, 1,
0.1281798, -0.0412991, 0.01632972, 1, 0, 0, 1, 1,
0.1359955, 0.841343, 1.464606, 1, 0, 0, 1, 1,
0.138041, 0.4019633, -1.512242, 1, 0, 0, 1, 1,
0.1386245, 0.05736904, 0.3837452, 1, 0, 0, 1, 1,
0.1394101, 0.01423899, 1.392143, 1, 0, 0, 1, 1,
0.1442156, 1.500921, -1.488202, 0, 0, 0, 1, 1,
0.1497372, -0.355867, 3.050193, 0, 0, 0, 1, 1,
0.1508905, -1.084297, 3.917947, 0, 0, 0, 1, 1,
0.152021, -0.09161779, 2.58997, 0, 0, 0, 1, 1,
0.1530951, 0.3194265, 1.583757, 0, 0, 0, 1, 1,
0.1535434, -0.1505918, 1.74513, 0, 0, 0, 1, 1,
0.1561988, -1.043247, 1.880675, 0, 0, 0, 1, 1,
0.1628144, 0.8194115, 0.1048221, 1, 1, 1, 1, 1,
0.1630313, -0.3795884, 3.856297, 1, 1, 1, 1, 1,
0.175078, -0.5654171, 3.151463, 1, 1, 1, 1, 1,
0.1766631, 1.039021, 1.511154, 1, 1, 1, 1, 1,
0.1772929, 0.5826147, 0.2058167, 1, 1, 1, 1, 1,
0.1774704, 0.3881277, 0.7713629, 1, 1, 1, 1, 1,
0.177958, 0.3854561, -0.8056002, 1, 1, 1, 1, 1,
0.1805234, -1.081349, 1.489679, 1, 1, 1, 1, 1,
0.1806514, -0.4076952, 4.079468, 1, 1, 1, 1, 1,
0.1837541, -0.3008767, 4.331447, 1, 1, 1, 1, 1,
0.1863557, 1.03519, -0.4886833, 1, 1, 1, 1, 1,
0.187519, -2.060504, 3.11831, 1, 1, 1, 1, 1,
0.1921178, -2.320037, 2.606758, 1, 1, 1, 1, 1,
0.1965621, 0.01983547, 2.437599, 1, 1, 1, 1, 1,
0.1984359, -0.5358493, 2.456478, 1, 1, 1, 1, 1,
0.1990861, 1.28243, 2.447671, 0, 0, 1, 1, 1,
0.2033328, -0.02493281, 2.112572, 1, 0, 0, 1, 1,
0.203894, -0.1113639, 1.249478, 1, 0, 0, 1, 1,
0.2048765, 0.1524904, 0.9329978, 1, 0, 0, 1, 1,
0.2085652, -1.141904, 2.607368, 1, 0, 0, 1, 1,
0.2210304, 0.2790067, 0.7762792, 1, 0, 0, 1, 1,
0.2214045, 0.5446087, 0.3480309, 0, 0, 0, 1, 1,
0.2242048, 0.7355003, -0.03116535, 0, 0, 0, 1, 1,
0.2290011, -0.5170394, 3.867817, 0, 0, 0, 1, 1,
0.2295825, -0.3519882, 1.215623, 0, 0, 0, 1, 1,
0.2306545, 1.137497, -0.1127987, 0, 0, 0, 1, 1,
0.2308017, 0.11658, 1.57454, 0, 0, 0, 1, 1,
0.2309175, 1.289187, -1.799555, 0, 0, 0, 1, 1,
0.2341576, 1.235744, 1.372147, 1, 1, 1, 1, 1,
0.2375265, -0.05963121, 0.9723224, 1, 1, 1, 1, 1,
0.2381474, 1.058753, -0.4291228, 1, 1, 1, 1, 1,
0.2395731, 0.6030515, -0.4281468, 1, 1, 1, 1, 1,
0.240706, -0.7304101, 0.8907492, 1, 1, 1, 1, 1,
0.2418348, 1.42011, 1.181997, 1, 1, 1, 1, 1,
0.2520538, 2.40811, 1.418354, 1, 1, 1, 1, 1,
0.2520805, 1.677459, -0.6378706, 1, 1, 1, 1, 1,
0.2537732, -0.3887448, 0.5865248, 1, 1, 1, 1, 1,
0.2543291, -0.6875287, 2.394709, 1, 1, 1, 1, 1,
0.2572632, 0.2160155, -0.4627032, 1, 1, 1, 1, 1,
0.2587837, -0.6801592, 4.479113, 1, 1, 1, 1, 1,
0.259578, -0.0890991, 1.19157, 1, 1, 1, 1, 1,
0.2661853, 1.087004, 0.04303226, 1, 1, 1, 1, 1,
0.2702099, -0.8073219, 3.247895, 1, 1, 1, 1, 1,
0.2738186, -0.4077137, 1.704037, 0, 0, 1, 1, 1,
0.2740321, 0.4137373, -1.580194, 1, 0, 0, 1, 1,
0.2743103, -0.4750665, 3.737949, 1, 0, 0, 1, 1,
0.2770153, -0.6095221, 3.255759, 1, 0, 0, 1, 1,
0.2781758, 0.01838642, 1.039307, 1, 0, 0, 1, 1,
0.2800667, 0.5762846, 0.07677525, 1, 0, 0, 1, 1,
0.2839569, 0.7994717, 1.274686, 0, 0, 0, 1, 1,
0.2875054, 0.1146167, 0.6747056, 0, 0, 0, 1, 1,
0.2894301, 0.4886695, 0.3284626, 0, 0, 0, 1, 1,
0.2911574, -0.8181967, 0.982325, 0, 0, 0, 1, 1,
0.2929642, 0.4657329, 1.052055, 0, 0, 0, 1, 1,
0.2947652, -1.188982, 3.070264, 0, 0, 0, 1, 1,
0.2961192, -0.3182067, 3.950375, 0, 0, 0, 1, 1,
0.2995904, -1.587448, 1.068915, 1, 1, 1, 1, 1,
0.3021788, 0.2435227, 2.373594, 1, 1, 1, 1, 1,
0.3025806, 1.213957, -0.2028655, 1, 1, 1, 1, 1,
0.3083023, 1.670475, 1.441715, 1, 1, 1, 1, 1,
0.3102673, 1.140235, 0.8909335, 1, 1, 1, 1, 1,
0.3112427, 1.216242, 1.985639, 1, 1, 1, 1, 1,
0.3115825, -1.038935, 4.858777, 1, 1, 1, 1, 1,
0.3160109, 1.09179, -0.9579019, 1, 1, 1, 1, 1,
0.3175111, 0.943179, -0.02063059, 1, 1, 1, 1, 1,
0.3181288, 0.8471714, 1.348155, 1, 1, 1, 1, 1,
0.3189417, -0.6501204, 2.024917, 1, 1, 1, 1, 1,
0.3210727, -1.014697, 2.043353, 1, 1, 1, 1, 1,
0.3235804, -0.2681482, 2.252737, 1, 1, 1, 1, 1,
0.3240956, 0.7485113, 1.508582, 1, 1, 1, 1, 1,
0.3269729, -1.797429, 1.830385, 1, 1, 1, 1, 1,
0.336743, 2.110186, 1.504784, 0, 0, 1, 1, 1,
0.3373592, 0.4622773, 0.4873049, 1, 0, 0, 1, 1,
0.3426753, 0.2451212, -0.09441709, 1, 0, 0, 1, 1,
0.3431118, 0.4775173, -2.041906, 1, 0, 0, 1, 1,
0.3433268, -0.3067214, 1.554943, 1, 0, 0, 1, 1,
0.3457708, -1.303466, 3.045049, 1, 0, 0, 1, 1,
0.350892, 0.8483459, -0.06865667, 0, 0, 0, 1, 1,
0.3514149, -1.155592, 2.719079, 0, 0, 0, 1, 1,
0.3522984, -0.3850943, 2.691135, 0, 0, 0, 1, 1,
0.3527441, 0.1023559, 2.225019, 0, 0, 0, 1, 1,
0.3579187, 0.1379997, 1.180995, 0, 0, 0, 1, 1,
0.3687187, -0.05562016, 0.982599, 0, 0, 0, 1, 1,
0.3693722, 0.1169391, -1.235101, 0, 0, 0, 1, 1,
0.3719642, 2.176327, 0.9614143, 1, 1, 1, 1, 1,
0.3737012, -0.3915079, 2.541632, 1, 1, 1, 1, 1,
0.3749184, -0.1463117, 1.903172, 1, 1, 1, 1, 1,
0.3779928, -0.538136, 2.866637, 1, 1, 1, 1, 1,
0.3783565, -0.2835151, 2.025824, 1, 1, 1, 1, 1,
0.3798825, 0.01326062, 1.367235, 1, 1, 1, 1, 1,
0.3831134, -1.037972, 0.9650044, 1, 1, 1, 1, 1,
0.3877255, -2.464742, 2.0025, 1, 1, 1, 1, 1,
0.3899878, -1.719993, 2.656688, 1, 1, 1, 1, 1,
0.3990028, 0.474486, -0.1774711, 1, 1, 1, 1, 1,
0.4001544, -0.8944936, 3.10323, 1, 1, 1, 1, 1,
0.4033477, -0.1569362, 1.741365, 1, 1, 1, 1, 1,
0.4035249, 0.4410033, 0.1136258, 1, 1, 1, 1, 1,
0.4144042, -0.8215888, 4.364886, 1, 1, 1, 1, 1,
0.4167814, -0.03390044, 1.407444, 1, 1, 1, 1, 1,
0.4174119, 0.9954765, 0.9712512, 0, 0, 1, 1, 1,
0.4193791, 0.9237146, 0.9444032, 1, 0, 0, 1, 1,
0.4202459, 0.07486504, 1.988805, 1, 0, 0, 1, 1,
0.42277, 0.5178139, 2.100016, 1, 0, 0, 1, 1,
0.4234403, 0.2107184, 1.838089, 1, 0, 0, 1, 1,
0.4325019, -1.07821, 2.257897, 1, 0, 0, 1, 1,
0.4368331, 0.4854737, 0.2953371, 0, 0, 0, 1, 1,
0.4392284, 0.712096, 0.9651538, 0, 0, 0, 1, 1,
0.4399885, -1.769585, 2.679598, 0, 0, 0, 1, 1,
0.4410169, 1.197648, 0.7448601, 0, 0, 0, 1, 1,
0.4416839, 1.329659, -0.7411326, 0, 0, 0, 1, 1,
0.4447939, 0.7683662, 0.8277828, 0, 0, 0, 1, 1,
0.4457431, 1.819703, -0.5976095, 0, 0, 0, 1, 1,
0.4477946, 0.04250237, 2.232758, 1, 1, 1, 1, 1,
0.4479119, -0.006481551, 1.807453, 1, 1, 1, 1, 1,
0.4482548, 0.2636282, 1.528164, 1, 1, 1, 1, 1,
0.4501125, 0.3977981, 0.7234603, 1, 1, 1, 1, 1,
0.4517411, 1.445685, 0.3821472, 1, 1, 1, 1, 1,
0.458153, -0.3503579, 3.548294, 1, 1, 1, 1, 1,
0.4590919, 1.185801, 0.6036745, 1, 1, 1, 1, 1,
0.4598088, -0.7498975, 1.921384, 1, 1, 1, 1, 1,
0.4653655, 1.53267, 2.04599, 1, 1, 1, 1, 1,
0.4674905, 2.052868, -0.0607787, 1, 1, 1, 1, 1,
0.4720751, -0.6693137, 3.408326, 1, 1, 1, 1, 1,
0.4733153, 2.330531, 1.907823, 1, 1, 1, 1, 1,
0.4741389, 0.1941293, -0.9658648, 1, 1, 1, 1, 1,
0.483796, 0.1185758, 1.501138, 1, 1, 1, 1, 1,
0.4839854, -0.3099121, 2.607367, 1, 1, 1, 1, 1,
0.4850602, -1.186008, 1.27245, 0, 0, 1, 1, 1,
0.4852529, -0.4875399, 3.226402, 1, 0, 0, 1, 1,
0.4895928, -1.009145, 2.637716, 1, 0, 0, 1, 1,
0.4906787, 1.012629, 0.4902549, 1, 0, 0, 1, 1,
0.4942234, -0.6346293, 2.825407, 1, 0, 0, 1, 1,
0.4946167, -0.5515756, 2.968252, 1, 0, 0, 1, 1,
0.4947791, -1.524904, 2.524379, 0, 0, 0, 1, 1,
0.4988227, 1.064665, 0.8625495, 0, 0, 0, 1, 1,
0.5072324, 0.0271779, 0.5250606, 0, 0, 0, 1, 1,
0.5088723, -0.3772141, 4.173089, 0, 0, 0, 1, 1,
0.5100001, 0.191516, 0.621164, 0, 0, 0, 1, 1,
0.5119925, -0.2170448, 3.435977, 0, 0, 0, 1, 1,
0.5182171, 0.2350008, 1.917818, 0, 0, 0, 1, 1,
0.5189313, 0.01808194, 3.462349, 1, 1, 1, 1, 1,
0.5237939, 0.7114286, -0.1902706, 1, 1, 1, 1, 1,
0.5239723, -1.203034, 2.765036, 1, 1, 1, 1, 1,
0.5255323, -1.164946, 0.8773195, 1, 1, 1, 1, 1,
0.525726, 0.5972871, -0.3784978, 1, 1, 1, 1, 1,
0.5336521, 0.4737131, 2.409082, 1, 1, 1, 1, 1,
0.5338707, -1.324038, 4.698237, 1, 1, 1, 1, 1,
0.5338954, 0.3900715, 1.87023, 1, 1, 1, 1, 1,
0.5379053, 0.1935096, 2.238268, 1, 1, 1, 1, 1,
0.5442655, 0.5263741, 2.483195, 1, 1, 1, 1, 1,
0.5446765, -0.7954572, 3.199091, 1, 1, 1, 1, 1,
0.5457643, -1.453901, 2.93651, 1, 1, 1, 1, 1,
0.5484532, -1.509601, 1.561012, 1, 1, 1, 1, 1,
0.5490545, -0.3172698, 1.299085, 1, 1, 1, 1, 1,
0.5536972, 1.248863, -1.493139, 1, 1, 1, 1, 1,
0.5573758, 0.499419, 1.533236, 0, 0, 1, 1, 1,
0.5581145, -0.579579, 2.998658, 1, 0, 0, 1, 1,
0.5593884, 0.7039656, 0.4487612, 1, 0, 0, 1, 1,
0.5640687, -0.6438931, 1.764184, 1, 0, 0, 1, 1,
0.5646599, 1.546466, 1.293598, 1, 0, 0, 1, 1,
0.5737571, 0.5182123, 0.5334716, 1, 0, 0, 1, 1,
0.575026, -0.1706189, 1.654651, 0, 0, 0, 1, 1,
0.5780261, -0.6503778, 2.093138, 0, 0, 0, 1, 1,
0.5784104, -0.3564158, 1.499184, 0, 0, 0, 1, 1,
0.579456, 0.3382758, 0.7254304, 0, 0, 0, 1, 1,
0.5826786, -1.076024, 3.474422, 0, 0, 0, 1, 1,
0.5834507, -1.864472, 2.982725, 0, 0, 0, 1, 1,
0.5880252, 0.06445581, 1.753495, 0, 0, 0, 1, 1,
0.588544, -0.6165604, 1.743154, 1, 1, 1, 1, 1,
0.5933124, 0.8398082, 1.902779, 1, 1, 1, 1, 1,
0.5934228, 0.3820503, 3.343453, 1, 1, 1, 1, 1,
0.5945753, -0.02356583, 1.599277, 1, 1, 1, 1, 1,
0.6009806, 2.244697, 0.09270109, 1, 1, 1, 1, 1,
0.6056639, -1.804187, 3.33088, 1, 1, 1, 1, 1,
0.610186, -0.222634, 3.103638, 1, 1, 1, 1, 1,
0.6111236, 0.2047734, -0.6508086, 1, 1, 1, 1, 1,
0.6146451, -0.2738869, -0.05500534, 1, 1, 1, 1, 1,
0.6153173, 1.079267, 0.3365611, 1, 1, 1, 1, 1,
0.6167287, 0.5392274, 0.8366697, 1, 1, 1, 1, 1,
0.6172224, 0.851408, 0.543493, 1, 1, 1, 1, 1,
0.6200946, -0.9541159, 2.595502, 1, 1, 1, 1, 1,
0.6201686, 1.297778, 1.473116, 1, 1, 1, 1, 1,
0.6203954, -1.81328, 4.076886, 1, 1, 1, 1, 1,
0.6232009, -1.744666, 3.480519, 0, 0, 1, 1, 1,
0.6290224, -1.388117, 3.932597, 1, 0, 0, 1, 1,
0.6301619, 1.699893, -0.8959185, 1, 0, 0, 1, 1,
0.63049, -0.882268, 2.807614, 1, 0, 0, 1, 1,
0.6319396, 0.1915786, 3.537477, 1, 0, 0, 1, 1,
0.6336348, 0.3557846, -0.04832145, 1, 0, 0, 1, 1,
0.6339351, -1.483523, 3.745054, 0, 0, 0, 1, 1,
0.6340168, -0.2094595, 0.8503553, 0, 0, 0, 1, 1,
0.6355007, -0.1885464, 1.559964, 0, 0, 0, 1, 1,
0.6367093, -0.8566484, 2.969282, 0, 0, 0, 1, 1,
0.6376952, 0.5858163, 0.9105731, 0, 0, 0, 1, 1,
0.6401151, -1.642933, 2.732976, 0, 0, 0, 1, 1,
0.6488392, -0.1414612, 4.047771, 0, 0, 0, 1, 1,
0.649197, 0.731824, 1.398338, 1, 1, 1, 1, 1,
0.6493261, 0.8877915, -0.6008151, 1, 1, 1, 1, 1,
0.6495115, 2.116004, 0.4267618, 1, 1, 1, 1, 1,
0.6498413, 0.2911455, 1.763628, 1, 1, 1, 1, 1,
0.6517881, -0.4092394, 2.101376, 1, 1, 1, 1, 1,
0.6528265, -0.6647319, 2.253091, 1, 1, 1, 1, 1,
0.6532983, -0.7039784, 4.020214, 1, 1, 1, 1, 1,
0.6541777, 0.4257961, 2.503114, 1, 1, 1, 1, 1,
0.6541987, -0.8985252, 3.204734, 1, 1, 1, 1, 1,
0.6552457, -0.1401711, 2.099712, 1, 1, 1, 1, 1,
0.6597484, 0.4275831, 0.5640706, 1, 1, 1, 1, 1,
0.6602527, 0.2790414, 1.322735, 1, 1, 1, 1, 1,
0.6759565, 0.3160092, 1.991659, 1, 1, 1, 1, 1,
0.6812459, -0.4097473, 1.745848, 1, 1, 1, 1, 1,
0.6825642, 0.8588881, 0.6752324, 1, 1, 1, 1, 1,
0.6841407, -0.6075483, 1.997523, 0, 0, 1, 1, 1,
0.6867077, -0.1182743, 3.247724, 1, 0, 0, 1, 1,
0.6876218, 0.2372847, 0.3713097, 1, 0, 0, 1, 1,
0.6903082, 0.6310108, -0.2302311, 1, 0, 0, 1, 1,
0.6912571, -1.052035, 2.21344, 1, 0, 0, 1, 1,
0.6943142, -0.7652383, 3.468309, 1, 0, 0, 1, 1,
0.6958846, 0.64455, 0.9901241, 0, 0, 0, 1, 1,
0.6997094, -0.7108067, 1.498498, 0, 0, 0, 1, 1,
0.7004884, -0.5803013, 4.013355, 0, 0, 0, 1, 1,
0.7067374, -0.2739292, 3.063307, 0, 0, 0, 1, 1,
0.7133691, 0.2838612, 1.337677, 0, 0, 0, 1, 1,
0.7156761, 0.3791431, 1.601755, 0, 0, 0, 1, 1,
0.7164406, -0.9756152, 5.14116, 0, 0, 0, 1, 1,
0.7183238, 1.173337, 0.2982782, 1, 1, 1, 1, 1,
0.7188337, 0.1227553, 2.310854, 1, 1, 1, 1, 1,
0.7219822, 0.946851, -0.7984142, 1, 1, 1, 1, 1,
0.726106, 0.2411363, 1.815592, 1, 1, 1, 1, 1,
0.7323073, 0.08177576, 0.2573552, 1, 1, 1, 1, 1,
0.7332517, -1.009653, 3.304296, 1, 1, 1, 1, 1,
0.7353712, -1.082215, 3.397226, 1, 1, 1, 1, 1,
0.7375087, -1.117375, 4.367233, 1, 1, 1, 1, 1,
0.7408837, 0.3480843, 0.7728404, 1, 1, 1, 1, 1,
0.7414159, 0.7841862, -0.68811, 1, 1, 1, 1, 1,
0.7444178, -0.5969084, 1.079735, 1, 1, 1, 1, 1,
0.7450048, -0.01627622, 1.317118, 1, 1, 1, 1, 1,
0.7451949, -0.799637, 2.473849, 1, 1, 1, 1, 1,
0.7466927, -0.03263608, 2.403426, 1, 1, 1, 1, 1,
0.7504908, -0.1381425, 3.164449, 1, 1, 1, 1, 1,
0.7601485, -0.6216242, 0.7727571, 0, 0, 1, 1, 1,
0.7644157, -1.490907, 1.000146, 1, 0, 0, 1, 1,
0.7683728, 0.8589783, -0.757593, 1, 0, 0, 1, 1,
0.7696151, 0.3718266, 2.421218, 1, 0, 0, 1, 1,
0.7729855, 0.007894747, 2.547387, 1, 0, 0, 1, 1,
0.774441, -1.020627, 1.935227, 1, 0, 0, 1, 1,
0.7789332, 1.701481, -0.05799127, 0, 0, 0, 1, 1,
0.7840098, 1.533934, 0.0276353, 0, 0, 0, 1, 1,
0.7853338, -0.6209528, 2.477366, 0, 0, 0, 1, 1,
0.7871291, -1.225631, 3.344186, 0, 0, 0, 1, 1,
0.7920029, 0.01764451, 0.2787927, 0, 0, 0, 1, 1,
0.7938156, -1.272653, 4.15698, 0, 0, 0, 1, 1,
0.7959456, 0.515165, 0.5281959, 0, 0, 0, 1, 1,
0.7967061, -1.60887, 2.335335, 1, 1, 1, 1, 1,
0.7982461, -0.4253479, 2.811176, 1, 1, 1, 1, 1,
0.8017271, -0.4478193, 2.184385, 1, 1, 1, 1, 1,
0.8040081, -0.5000324, 1.375096, 1, 1, 1, 1, 1,
0.8088451, 0.3065268, 0.5367092, 1, 1, 1, 1, 1,
0.8131648, 1.108453, -1.59541, 1, 1, 1, 1, 1,
0.8230949, 1.052189, 2.728189, 1, 1, 1, 1, 1,
0.8237498, -0.5568488, 2.43016, 1, 1, 1, 1, 1,
0.8241872, 0.3223183, 1.489855, 1, 1, 1, 1, 1,
0.8253213, 0.9849794, 0.4632416, 1, 1, 1, 1, 1,
0.8256316, 0.3528952, 2.406439, 1, 1, 1, 1, 1,
0.8277057, 1.173595, 0.0007447015, 1, 1, 1, 1, 1,
0.8308084, 0.1193294, 2.487397, 1, 1, 1, 1, 1,
0.8325441, 1.518247, 0.1146453, 1, 1, 1, 1, 1,
0.8335072, 0.04621749, 0.8316735, 1, 1, 1, 1, 1,
0.8364255, 0.7308694, 1.347156, 0, 0, 1, 1, 1,
0.8443907, -1.139079, 3.502678, 1, 0, 0, 1, 1,
0.8481762, 0.1509358, 0.136822, 1, 0, 0, 1, 1,
0.8567321, -0.4610086, 1.492496, 1, 0, 0, 1, 1,
0.8581415, 1.034398, 1.143429, 1, 0, 0, 1, 1,
0.8618339, -0.8204021, 4.522464, 1, 0, 0, 1, 1,
0.8634534, 0.810364, 0.835289, 0, 0, 0, 1, 1,
0.8704391, -1.800284, 1.807993, 0, 0, 0, 1, 1,
0.8738036, -0.1163141, 2.259187, 0, 0, 0, 1, 1,
0.8768288, -0.2230687, 2.090485, 0, 0, 0, 1, 1,
0.8784825, -1.371298, 1.85083, 0, 0, 0, 1, 1,
0.8819175, -2.614074, 3.595628, 0, 0, 0, 1, 1,
0.8936095, 0.9803608, 0.9610784, 0, 0, 0, 1, 1,
0.8961273, -0.9108731, 2.189266, 1, 1, 1, 1, 1,
0.8985101, 2.258903, 0.1988153, 1, 1, 1, 1, 1,
0.9041137, -0.2713456, 0.9446254, 1, 1, 1, 1, 1,
0.9047726, 0.1762664, 0.844038, 1, 1, 1, 1, 1,
0.9071925, 0.232426, 1.881185, 1, 1, 1, 1, 1,
0.9138212, -1.774304, 3.097922, 1, 1, 1, 1, 1,
0.9170838, 1.677483, 0.5073349, 1, 1, 1, 1, 1,
0.9171, 1.58394, -0.1370315, 1, 1, 1, 1, 1,
0.9219557, -0.06695143, 1.328462, 1, 1, 1, 1, 1,
0.9302016, -0.8374949, 0.884508, 1, 1, 1, 1, 1,
0.9359025, 0.5066699, 2.419286, 1, 1, 1, 1, 1,
0.9388289, 0.314189, 1.354671, 1, 1, 1, 1, 1,
0.9411293, -0.4268408, 0.9931366, 1, 1, 1, 1, 1,
0.9563948, 2.217298, 0.5349762, 1, 1, 1, 1, 1,
0.9567712, -0.03695553, 1.517574, 1, 1, 1, 1, 1,
0.9593827, 1.222204, 1.194565, 0, 0, 1, 1, 1,
0.9610887, -0.3836075, 1.967633, 1, 0, 0, 1, 1,
0.9709336, 0.4419133, -0.1681858, 1, 0, 0, 1, 1,
0.9715086, 1.464429, 1.248214, 1, 0, 0, 1, 1,
0.9761789, -0.7126096, 2.833127, 1, 0, 0, 1, 1,
0.981425, 0.8351617, 1.281081, 1, 0, 0, 1, 1,
0.9880098, -0.5033231, 3.403147, 0, 0, 0, 1, 1,
0.9910748, 1.889109, 0.05818336, 0, 0, 0, 1, 1,
0.998279, 1.503417, 1.123248, 0, 0, 0, 1, 1,
1.00026, -0.5246146, 3.22999, 0, 0, 0, 1, 1,
1.003698, 0.1344155, 1.011238, 0, 0, 0, 1, 1,
1.01217, -0.0684988, 0.6670773, 0, 0, 0, 1, 1,
1.012374, 0.1058757, 1.812395, 0, 0, 0, 1, 1,
1.015971, -0.1488713, 2.003964, 1, 1, 1, 1, 1,
1.025066, 1.729946, 0.04251038, 1, 1, 1, 1, 1,
1.033029, 1.164589, 0.8375477, 1, 1, 1, 1, 1,
1.041837, 0.1551713, 1.545147, 1, 1, 1, 1, 1,
1.042479, 1.720891, -1.244171, 1, 1, 1, 1, 1,
1.045267, -0.3314544, 1.749286, 1, 1, 1, 1, 1,
1.048501, -0.4145028, 2.473702, 1, 1, 1, 1, 1,
1.052445, -1.124519, 1.213869, 1, 1, 1, 1, 1,
1.053394, 0.05433033, 1.977211, 1, 1, 1, 1, 1,
1.055602, -0.000443779, 1.898695, 1, 1, 1, 1, 1,
1.061488, -2.087598, 1.428175, 1, 1, 1, 1, 1,
1.064408, -0.389538, 0.6824247, 1, 1, 1, 1, 1,
1.068687, 1.353231, -0.3621277, 1, 1, 1, 1, 1,
1.072529, 1.118078, 2.135782, 1, 1, 1, 1, 1,
1.079106, 0.8613359, 0.9393693, 1, 1, 1, 1, 1,
1.082443, 2.043043, -0.3211898, 0, 0, 1, 1, 1,
1.086696, 1.00665, 1.283574, 1, 0, 0, 1, 1,
1.09007, 0.1593859, 1.480924, 1, 0, 0, 1, 1,
1.095163, 1.196528, 1.090979, 1, 0, 0, 1, 1,
1.097911, -0.2902618, 3.386935, 1, 0, 0, 1, 1,
1.114477, -0.2232134, 4.264569, 1, 0, 0, 1, 1,
1.115902, -1.035569, 2.186412, 0, 0, 0, 1, 1,
1.118958, -0.2753072, 3.323755, 0, 0, 0, 1, 1,
1.120064, -1.008554, 2.8106, 0, 0, 0, 1, 1,
1.126976, -0.6811754, 2.031972, 0, 0, 0, 1, 1,
1.129074, 0.5178509, 2.753915, 0, 0, 0, 1, 1,
1.13257, 0.9316139, 1.291853, 0, 0, 0, 1, 1,
1.147814, -0.1378187, 0.5661902, 0, 0, 0, 1, 1,
1.147839, 0.7262614, 2.360713, 1, 1, 1, 1, 1,
1.148186, 0.5239902, 1.427779, 1, 1, 1, 1, 1,
1.150144, 0.1614768, 1.331656, 1, 1, 1, 1, 1,
1.151449, -0.0903212, 1.252146, 1, 1, 1, 1, 1,
1.152514, -0.198792, 2.275989, 1, 1, 1, 1, 1,
1.16194, -0.04616057, 1.657022, 1, 1, 1, 1, 1,
1.16781, -0.1645672, 2.423549, 1, 1, 1, 1, 1,
1.169778, 1.732867, 0.7856849, 1, 1, 1, 1, 1,
1.171277, -0.05501414, 1.225525, 1, 1, 1, 1, 1,
1.171314, -0.2250162, 1.08076, 1, 1, 1, 1, 1,
1.173094, 0.2475773, 1.832601, 1, 1, 1, 1, 1,
1.173681, -0.1055515, 3.215125, 1, 1, 1, 1, 1,
1.174845, -2.137994, 3.184599, 1, 1, 1, 1, 1,
1.187379, -0.9057792, 2.137704, 1, 1, 1, 1, 1,
1.216479, -0.2897611, 2.245006, 1, 1, 1, 1, 1,
1.223248, 0.6994079, 1.133786, 0, 0, 1, 1, 1,
1.233202, 1.293486, -0.6819329, 1, 0, 0, 1, 1,
1.243319, -1.805001, 1.70557, 1, 0, 0, 1, 1,
1.245343, 1.291147, 0.6832545, 1, 0, 0, 1, 1,
1.249129, 0.8501781, 1.920567, 1, 0, 0, 1, 1,
1.259668, 1.146803, 0.5281726, 1, 0, 0, 1, 1,
1.265697, 0.3879374, 2.024523, 0, 0, 0, 1, 1,
1.266796, 0.7369208, 3.461387, 0, 0, 0, 1, 1,
1.268249, 0.3703762, 0.5858873, 0, 0, 0, 1, 1,
1.274333, -1.073552, 3.839621, 0, 0, 0, 1, 1,
1.283352, -1.209404, 3.168463, 0, 0, 0, 1, 1,
1.29828, 0.7277826, -1.28117, 0, 0, 0, 1, 1,
1.302935, 1.30071, 0.2874407, 0, 0, 0, 1, 1,
1.303451, -0.4984767, 1.020046, 1, 1, 1, 1, 1,
1.303458, -0.135553, 0.2380242, 1, 1, 1, 1, 1,
1.310818, -0.3001983, 3.382933, 1, 1, 1, 1, 1,
1.329233, 1.845942, 0.4099798, 1, 1, 1, 1, 1,
1.329955, 0.3291601, -0.7901329, 1, 1, 1, 1, 1,
1.340489, 0.821981, 2.064436, 1, 1, 1, 1, 1,
1.341541, -1.807167, 2.761443, 1, 1, 1, 1, 1,
1.349694, -0.1111495, 0.2245752, 1, 1, 1, 1, 1,
1.364478, 2.550616, -0.5986899, 1, 1, 1, 1, 1,
1.372045, 0.136546, 1.753186, 1, 1, 1, 1, 1,
1.393857, -0.3394631, 0.8854614, 1, 1, 1, 1, 1,
1.396737, 1.28197, -0.5634035, 1, 1, 1, 1, 1,
1.411043, -0.4673248, 1.38887, 1, 1, 1, 1, 1,
1.411717, 0.6488085, 3.152161, 1, 1, 1, 1, 1,
1.416274, 0.08841669, 1.645841, 1, 1, 1, 1, 1,
1.419101, 0.1594431, -0.5420011, 0, 0, 1, 1, 1,
1.424431, 0.07177047, 0.6627401, 1, 0, 0, 1, 1,
1.427986, -1.43835, 2.200342, 1, 0, 0, 1, 1,
1.434421, 1.112825, 0.3696909, 1, 0, 0, 1, 1,
1.441949, -0.18171, 2.386001, 1, 0, 0, 1, 1,
1.464291, 0.4890356, 0.6102913, 1, 0, 0, 1, 1,
1.478008, 1.062469, 0.2226053, 0, 0, 0, 1, 1,
1.488865, 0.2346476, 1.385509, 0, 0, 0, 1, 1,
1.490546, -0.3015314, 1.346724, 0, 0, 0, 1, 1,
1.495888, -1.079551, 1.885052, 0, 0, 0, 1, 1,
1.502783, 1.325135, 2.356102, 0, 0, 0, 1, 1,
1.511083, -0.3130927, 4.179786, 0, 0, 0, 1, 1,
1.518524, -0.8753177, 1.906702, 0, 0, 0, 1, 1,
1.52034, 0.1496092, 0.694047, 1, 1, 1, 1, 1,
1.52083, 0.8760262, 1.10427, 1, 1, 1, 1, 1,
1.524113, -0.6177667, 1.77603, 1, 1, 1, 1, 1,
1.548157, 0.1339169, 1.826469, 1, 1, 1, 1, 1,
1.552562, 0.7466897, 1.189362, 1, 1, 1, 1, 1,
1.570233, -0.9236684, 1.121994, 1, 1, 1, 1, 1,
1.577699, -0.343244, 0.4024439, 1, 1, 1, 1, 1,
1.58893, 1.482916, 1.333657, 1, 1, 1, 1, 1,
1.606836, 2.44538, -0.4574876, 1, 1, 1, 1, 1,
1.610001, -1.983003, 1.881085, 1, 1, 1, 1, 1,
1.624905, 0.04994467, 1.008136, 1, 1, 1, 1, 1,
1.646666, -0.2200923, 2.915653, 1, 1, 1, 1, 1,
1.646948, 0.8553039, 0.1110083, 1, 1, 1, 1, 1,
1.661154, 0.4644767, 0.62861, 1, 1, 1, 1, 1,
1.665944, 1.126331, -0.6025389, 1, 1, 1, 1, 1,
1.672614, 0.7954534, 3.341562, 0, 0, 1, 1, 1,
1.673551, 1.501422, 1.542373, 1, 0, 0, 1, 1,
1.680716, 0.779866, 1.482279, 1, 0, 0, 1, 1,
1.687289, -0.1034805, -0.02750938, 1, 0, 0, 1, 1,
1.698707, -2.640692, 2.645314, 1, 0, 0, 1, 1,
1.743612, 0.1252438, 0.1899962, 1, 0, 0, 1, 1,
1.755323, -0.3515085, 1.812833, 0, 0, 0, 1, 1,
1.761048, 0.1051376, 1.837005, 0, 0, 0, 1, 1,
1.789814, -0.9387676, 1.750305, 0, 0, 0, 1, 1,
1.794042, 1.30134, 1.500942, 0, 0, 0, 1, 1,
1.799245, -1.254016, 0.3335524, 0, 0, 0, 1, 1,
1.822488, -0.461125, 0.942398, 0, 0, 0, 1, 1,
1.822962, -0.4572581, 0.6896263, 0, 0, 0, 1, 1,
1.831662, -0.7109445, 2.646523, 1, 1, 1, 1, 1,
1.882002, 0.2470384, 3.054285, 1, 1, 1, 1, 1,
1.915182, 0.7893606, 2.57639, 1, 1, 1, 1, 1,
1.91725, -1.424629, 1.471726, 1, 1, 1, 1, 1,
1.933515, -1.010697, 1.860338, 1, 1, 1, 1, 1,
1.939428, -1.15731, 2.01571, 1, 1, 1, 1, 1,
1.943306, -0.8482438, 2.558986, 1, 1, 1, 1, 1,
1.948538, -2.262767, 2.191391, 1, 1, 1, 1, 1,
1.953606, 0.742222, 0.8474107, 1, 1, 1, 1, 1,
1.998835, 0.3691863, 0.6915609, 1, 1, 1, 1, 1,
2.020414, -1.299018, 2.034453, 1, 1, 1, 1, 1,
2.02719, -1.373615, 2.638717, 1, 1, 1, 1, 1,
2.044215, -0.7093143, 1.460824, 1, 1, 1, 1, 1,
2.048494, 0.003759753, 1.783067, 1, 1, 1, 1, 1,
2.051791, 0.6857921, 1.248817, 1, 1, 1, 1, 1,
2.092775, -1.013478, 2.539206, 0, 0, 1, 1, 1,
2.100568, -0.8604764, 1.717041, 1, 0, 0, 1, 1,
2.132725, -0.4092365, 1.925111, 1, 0, 0, 1, 1,
2.21961, 0.3479668, 0.547275, 1, 0, 0, 1, 1,
2.276323, -0.6435674, 1.776292, 1, 0, 0, 1, 1,
2.324835, 1.100601, 1.134655, 1, 0, 0, 1, 1,
2.327702, -1.098777, 2.633042, 0, 0, 0, 1, 1,
2.33614, 1.845909, 0.3963408, 0, 0, 0, 1, 1,
2.482925, -0.520022, 0.09134246, 0, 0, 0, 1, 1,
2.561983, -0.3888098, 1.404374, 0, 0, 0, 1, 1,
2.626004, 1.400711, 0.9618209, 0, 0, 0, 1, 1,
2.717723, -0.8524064, 3.0086, 0, 0, 0, 1, 1,
2.729366, -0.9075399, 2.175709, 0, 0, 0, 1, 1,
2.738401, 0.7145014, 1.166293, 1, 1, 1, 1, 1,
2.816756, -0.3048221, 0.7922595, 1, 1, 1, 1, 1,
2.826522, -1.801543, 3.076199, 1, 1, 1, 1, 1,
2.849885, 0.5636885, 2.048618, 1, 1, 1, 1, 1,
3.219822, 0.6672279, 0.8708296, 1, 1, 1, 1, 1,
3.301761, -1.21279, 1.11353, 1, 1, 1, 1, 1,
3.397921, 0.4567328, 2.270031, 1, 1, 1, 1, 1
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
var radius = 9.381206;
var distance = 32.95109;
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
mvMatrix.translate( -0.1717894, 0.0041821, 0.07210588 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.95109);
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