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
-2.823081, 0.2522604, -0.6922287, 1, 0, 0, 1,
-2.688181, 0.3358633, -2.017733, 1, 0.007843138, 0, 1,
-2.644386, 0.4056719, -1.204379, 1, 0.01176471, 0, 1,
-2.600252, 1.116456, -1.755757, 1, 0.01960784, 0, 1,
-2.591335, -0.2377331, -3.145032, 1, 0.02352941, 0, 1,
-2.59009, 1.326947, -2.373603, 1, 0.03137255, 0, 1,
-2.585816, -0.326825, -1.309907, 1, 0.03529412, 0, 1,
-2.535435, -1.412126, -1.937521, 1, 0.04313726, 0, 1,
-2.455802, 0.1649194, -0.0265055, 1, 0.04705882, 0, 1,
-2.426158, 1.100567, -3.573123, 1, 0.05490196, 0, 1,
-2.421733, 0.1283005, -0.05753075, 1, 0.05882353, 0, 1,
-2.39776, 0.08552384, -2.954926, 1, 0.06666667, 0, 1,
-2.357721, 0.1132497, -1.784576, 1, 0.07058824, 0, 1,
-2.339048, -0.3482288, 1.257028, 1, 0.07843138, 0, 1,
-2.29896, 1.033816, 0.1981307, 1, 0.08235294, 0, 1,
-2.298035, 0.2680593, -2.025599, 1, 0.09019608, 0, 1,
-2.241399, -0.2763843, -2.324456, 1, 0.09411765, 0, 1,
-2.173017, -0.8120878, -1.226865, 1, 0.1019608, 0, 1,
-2.165228, 0.4618659, -0.4128658, 1, 0.1098039, 0, 1,
-2.139116, 1.522031, 0.0833736, 1, 0.1137255, 0, 1,
-2.109705, 0.004620608, -1.252355, 1, 0.1215686, 0, 1,
-2.089653, 0.03215108, 0.2766277, 1, 0.1254902, 0, 1,
-2.089416, 0.1783064, -0.6467894, 1, 0.1333333, 0, 1,
-1.99047, -0.04345524, -1.651637, 1, 0.1372549, 0, 1,
-1.985622, 1.117673, -1.530541, 1, 0.145098, 0, 1,
-1.965314, 1.047499, -1.860692, 1, 0.1490196, 0, 1,
-1.914986, 0.8019232, -1.31454, 1, 0.1568628, 0, 1,
-1.901019, -0.4989622, -1.293434, 1, 0.1607843, 0, 1,
-1.898387, 0.4360017, -1.631175, 1, 0.1686275, 0, 1,
-1.87947, -0.4098978, -0.5898781, 1, 0.172549, 0, 1,
-1.867843, 0.8775817, 1.218776, 1, 0.1803922, 0, 1,
-1.865408, -0.3078026, -1.910023, 1, 0.1843137, 0, 1,
-1.863386, 0.8006265, -2.130728, 1, 0.1921569, 0, 1,
-1.858337, 0.5753567, -2.93549, 1, 0.1960784, 0, 1,
-1.846478, -0.5753773, -2.006162, 1, 0.2039216, 0, 1,
-1.827404, -0.4788924, -0.9889258, 1, 0.2117647, 0, 1,
-1.825422, 0.2676005, -0.284126, 1, 0.2156863, 0, 1,
-1.810653, 0.467137, -1.405082, 1, 0.2235294, 0, 1,
-1.806272, 0.851757, -0.9828951, 1, 0.227451, 0, 1,
-1.788221, -1.146647, -0.7712292, 1, 0.2352941, 0, 1,
-1.778231, -0.3595554, -0.4946446, 1, 0.2392157, 0, 1,
-1.767142, 0.2471664, -1.170084, 1, 0.2470588, 0, 1,
-1.765747, 0.2501628, -2.671371, 1, 0.2509804, 0, 1,
-1.753906, -0.7279636, -3.012393, 1, 0.2588235, 0, 1,
-1.746578, 1.035748, -0.6455536, 1, 0.2627451, 0, 1,
-1.74002, 1.696482, -0.5558236, 1, 0.2705882, 0, 1,
-1.710232, 0.5627536, -0.4456157, 1, 0.2745098, 0, 1,
-1.704679, -0.6005905, -1.282579, 1, 0.282353, 0, 1,
-1.686106, -1.299496, 0.305705, 1, 0.2862745, 0, 1,
-1.677358, -1.517722, -2.826981, 1, 0.2941177, 0, 1,
-1.664858, -0.02141257, -2.043497, 1, 0.3019608, 0, 1,
-1.653939, 1.380066, -1.043741, 1, 0.3058824, 0, 1,
-1.647345, -0.6267394, -0.5112575, 1, 0.3137255, 0, 1,
-1.63378, -0.3690543, -1.173415, 1, 0.3176471, 0, 1,
-1.609663, 1.747091, -0.9456196, 1, 0.3254902, 0, 1,
-1.601921, -1.196733, -2.336142, 1, 0.3294118, 0, 1,
-1.577717, 0.6566572, -1.45683, 1, 0.3372549, 0, 1,
-1.564727, -0.5587973, -1.538028, 1, 0.3411765, 0, 1,
-1.537248, -1.158957, -2.779047, 1, 0.3490196, 0, 1,
-1.532684, -1.97557, -4.089821, 1, 0.3529412, 0, 1,
-1.531416, -0.04800284, -2.130762, 1, 0.3607843, 0, 1,
-1.523314, -0.2549633, -3.671448, 1, 0.3647059, 0, 1,
-1.517914, 0.6999285, -1.614869, 1, 0.372549, 0, 1,
-1.513964, -2.23473, -2.093175, 1, 0.3764706, 0, 1,
-1.512365, -0.6177962, -1.339157, 1, 0.3843137, 0, 1,
-1.507677, -0.2091935, -0.1363061, 1, 0.3882353, 0, 1,
-1.500849, 0.680976, -0.9286219, 1, 0.3960784, 0, 1,
-1.489794, 1.769982, -1.559529, 1, 0.4039216, 0, 1,
-1.488969, -0.3792577, -2.564558, 1, 0.4078431, 0, 1,
-1.466182, 0.1996942, -3.216592, 1, 0.4156863, 0, 1,
-1.456773, -2.325045, -3.219096, 1, 0.4196078, 0, 1,
-1.45221, -0.6029826, -1.621427, 1, 0.427451, 0, 1,
-1.43734, 0.285051, -1.786598, 1, 0.4313726, 0, 1,
-1.424145, 2.030237, -2.053185, 1, 0.4392157, 0, 1,
-1.421981, 1.51562, -1.692165, 1, 0.4431373, 0, 1,
-1.414512, -0.1140204, -0.2824406, 1, 0.4509804, 0, 1,
-1.392067, 1.232751, -1.776285, 1, 0.454902, 0, 1,
-1.389575, 0.616493, -0.4397281, 1, 0.4627451, 0, 1,
-1.387536, 0.7600109, -1.027544, 1, 0.4666667, 0, 1,
-1.379775, -0.2387406, 0.2602448, 1, 0.4745098, 0, 1,
-1.379436, 0.7648509, -0.3601711, 1, 0.4784314, 0, 1,
-1.372773, 0.6587026, -1.249372, 1, 0.4862745, 0, 1,
-1.367311, 0.05366738, -0.4542544, 1, 0.4901961, 0, 1,
-1.365981, 0.9206784, -0.9351704, 1, 0.4980392, 0, 1,
-1.363479, 0.1565921, -2.652856, 1, 0.5058824, 0, 1,
-1.361755, -1.315986, -0.8041279, 1, 0.509804, 0, 1,
-1.354949, 0.5896228, -2.888612, 1, 0.5176471, 0, 1,
-1.348088, 0.6742887, -1.008449, 1, 0.5215687, 0, 1,
-1.340977, -0.0008057415, -1.632633, 1, 0.5294118, 0, 1,
-1.328734, -0.7261283, -1.899692, 1, 0.5333334, 0, 1,
-1.327649, 0.07570345, -1.577486, 1, 0.5411765, 0, 1,
-1.321989, -0.5065694, 0.08672985, 1, 0.5450981, 0, 1,
-1.321815, 0.5757022, -0.3393779, 1, 0.5529412, 0, 1,
-1.320315, -1.043737, -3.51926, 1, 0.5568628, 0, 1,
-1.31873, -0.9466223, -1.878063, 1, 0.5647059, 0, 1,
-1.314572, -0.4774628, -2.323768, 1, 0.5686275, 0, 1,
-1.314215, 1.371893, -0.08901378, 1, 0.5764706, 0, 1,
-1.31257, -0.05192894, -2.750937, 1, 0.5803922, 0, 1,
-1.300912, -0.08530609, -1.343863, 1, 0.5882353, 0, 1,
-1.290912, -3.32481, -2.556649, 1, 0.5921569, 0, 1,
-1.285886, 0.70626, 0.4514455, 1, 0.6, 0, 1,
-1.285109, 0.3296639, 0.4206212, 1, 0.6078432, 0, 1,
-1.283136, 0.6432371, -0.7773284, 1, 0.6117647, 0, 1,
-1.279699, -1.915231, -2.949931, 1, 0.6196079, 0, 1,
-1.278301, -1.378632, -2.756662, 1, 0.6235294, 0, 1,
-1.267643, -1.159112, -2.063561, 1, 0.6313726, 0, 1,
-1.255479, 0.9560735, 0.7968283, 1, 0.6352941, 0, 1,
-1.253971, -0.6409966, -2.445145, 1, 0.6431373, 0, 1,
-1.249214, 0.3424415, -1.965242, 1, 0.6470588, 0, 1,
-1.244573, -0.3253799, -1.023854, 1, 0.654902, 0, 1,
-1.244482, -0.9504388, -1.649103, 1, 0.6588235, 0, 1,
-1.241017, -0.04669122, -1.748566, 1, 0.6666667, 0, 1,
-1.23344, 0.5981068, -0.7298557, 1, 0.6705883, 0, 1,
-1.230123, 0.2675884, -2.987391, 1, 0.6784314, 0, 1,
-1.214582, 0.4276572, -0.9292592, 1, 0.682353, 0, 1,
-1.212033, 0.9663334, -1.234693, 1, 0.6901961, 0, 1,
-1.209915, 0.02785993, -2.991919, 1, 0.6941177, 0, 1,
-1.203788, 1.659744, -2.220532, 1, 0.7019608, 0, 1,
-1.19241, 4.227855, -0.7829039, 1, 0.7098039, 0, 1,
-1.191116, -0.6258433, -0.92055, 1, 0.7137255, 0, 1,
-1.183449, 0.3251399, -2.619434, 1, 0.7215686, 0, 1,
-1.183358, -0.2270315, -3.456219, 1, 0.7254902, 0, 1,
-1.18328, 0.101593, -1.042652, 1, 0.7333333, 0, 1,
-1.183176, -1.949744, -3.074008, 1, 0.7372549, 0, 1,
-1.182674, -0.4254001, -4.715916, 1, 0.7450981, 0, 1,
-1.16525, 1.085915, -0.1534525, 1, 0.7490196, 0, 1,
-1.159004, 0.681859, -1.682287, 1, 0.7568628, 0, 1,
-1.158719, -1.608872, -1.04888, 1, 0.7607843, 0, 1,
-1.157194, -0.4571403, -0.2275916, 1, 0.7686275, 0, 1,
-1.153718, -0.5657032, -1.665775, 1, 0.772549, 0, 1,
-1.135839, -0.5811107, -0.9398586, 1, 0.7803922, 0, 1,
-1.120251, 0.1826642, -1.776661, 1, 0.7843137, 0, 1,
-1.117802, -0.4816557, -1.391113, 1, 0.7921569, 0, 1,
-1.116889, -2.615398, -3.44158, 1, 0.7960784, 0, 1,
-1.1134, -0.2120787, -2.096363, 1, 0.8039216, 0, 1,
-1.103906, -0.311834, -2.063322, 1, 0.8117647, 0, 1,
-1.103835, 0.004371735, -2.345927, 1, 0.8156863, 0, 1,
-1.100281, -0.2869516, -3.470955, 1, 0.8235294, 0, 1,
-1.098345, 1.363213, 0.5542926, 1, 0.827451, 0, 1,
-1.097233, -0.1877631, -4.279275, 1, 0.8352941, 0, 1,
-1.084437, 0.8779541, -2.031627, 1, 0.8392157, 0, 1,
-1.084269, 0.3561196, -0.7833644, 1, 0.8470588, 0, 1,
-1.077751, 1.754757, -0.6456501, 1, 0.8509804, 0, 1,
-1.07438, -0.2052055, -0.6444001, 1, 0.8588235, 0, 1,
-1.067301, -1.293866, -2.250552, 1, 0.8627451, 0, 1,
-1.066028, -0.2424516, -3.421234, 1, 0.8705882, 0, 1,
-1.060911, -0.2170705, -2.412896, 1, 0.8745098, 0, 1,
-1.048687, 0.9053409, -0.8939244, 1, 0.8823529, 0, 1,
-1.048179, -1.965973, -3.12377, 1, 0.8862745, 0, 1,
-1.044576, 0.5118728, -1.596395, 1, 0.8941177, 0, 1,
-1.034025, -1.018708, -3.247782, 1, 0.8980392, 0, 1,
-1.031782, -0.3865688, -2.221069, 1, 0.9058824, 0, 1,
-1.030015, 0.3836524, -2.838854, 1, 0.9137255, 0, 1,
-1.025722, -0.231721, -3.34569, 1, 0.9176471, 0, 1,
-1.024578, 0.7496731, -1.440923, 1, 0.9254902, 0, 1,
-1.024382, -0.8373992, -2.110457, 1, 0.9294118, 0, 1,
-1.020748, 1.440938, -0.4577953, 1, 0.9372549, 0, 1,
-1.010911, -0.4199165, -1.764567, 1, 0.9411765, 0, 1,
-1.010672, -0.4189261, -2.73843, 1, 0.9490196, 0, 1,
-1.009393, -1.018754, -1.347896, 1, 0.9529412, 0, 1,
-1.006429, -0.1984085, -1.420316, 1, 0.9607843, 0, 1,
-1.00626, -0.9172987, -1.458309, 1, 0.9647059, 0, 1,
-1.003265, -0.3827621, -2.41169, 1, 0.972549, 0, 1,
-1.001272, 0.7827671, -2.029237, 1, 0.9764706, 0, 1,
-0.9999991, 0.3828204, 1.012879, 1, 0.9843137, 0, 1,
-0.9937776, -0.2782346, -0.4952641, 1, 0.9882353, 0, 1,
-0.9919278, -1.454549, -5.206683, 1, 0.9960784, 0, 1,
-0.988069, 0.5401501, -0.6466883, 0.9960784, 1, 0, 1,
-0.9844455, 0.4923666, -1.822782, 0.9921569, 1, 0, 1,
-0.9718868, -0.1728679, -1.676609, 0.9843137, 1, 0, 1,
-0.9607776, 0.7666141, -1.405291, 0.9803922, 1, 0, 1,
-0.9557965, -0.1147001, -0.04238211, 0.972549, 1, 0, 1,
-0.9400285, 0.5332473, -0.5930504, 0.9686275, 1, 0, 1,
-0.9397587, 0.2282234, -2.442369, 0.9607843, 1, 0, 1,
-0.9341217, -0.4818021, -1.171432, 0.9568627, 1, 0, 1,
-0.9328103, -1.049497, -2.756622, 0.9490196, 1, 0, 1,
-0.9206939, -1.701362, -3.766834, 0.945098, 1, 0, 1,
-0.9181154, -0.8098005, -2.659436, 0.9372549, 1, 0, 1,
-0.9168862, -1.087168, -3.44921, 0.9333333, 1, 0, 1,
-0.9101114, -0.5182627, 0.3345384, 0.9254902, 1, 0, 1,
-0.9040683, -0.0448722, -2.440768, 0.9215686, 1, 0, 1,
-0.9038773, 1.266616, -1.84886, 0.9137255, 1, 0, 1,
-0.9036939, -1.62917, -2.517751, 0.9098039, 1, 0, 1,
-0.8995755, -1.346138, -1.388602, 0.9019608, 1, 0, 1,
-0.8990316, -0.5471812, -3.180741, 0.8941177, 1, 0, 1,
-0.8915404, 1.323234, -0.2570384, 0.8901961, 1, 0, 1,
-0.8875775, 0.2764491, -0.4468152, 0.8823529, 1, 0, 1,
-0.8754282, 0.3457159, -1.637262, 0.8784314, 1, 0, 1,
-0.868784, -0.06818828, -3.137145, 0.8705882, 1, 0, 1,
-0.8687192, -0.5334637, -0.3983775, 0.8666667, 1, 0, 1,
-0.8665939, -0.4816135, -1.506543, 0.8588235, 1, 0, 1,
-0.8622668, 0.1313722, 0.2901156, 0.854902, 1, 0, 1,
-0.8607224, 0.2672771, -0.4269745, 0.8470588, 1, 0, 1,
-0.8577507, -0.2692055, -2.66161, 0.8431373, 1, 0, 1,
-0.8545713, 0.5874211, -1.747543, 0.8352941, 1, 0, 1,
-0.838528, -1.328129, -2.624319, 0.8313726, 1, 0, 1,
-0.8347793, -1.26224, -3.643531, 0.8235294, 1, 0, 1,
-0.8315899, -0.3127636, 1.110565, 0.8196079, 1, 0, 1,
-0.8279046, 0.5468116, -0.910793, 0.8117647, 1, 0, 1,
-0.8112947, 0.4724342, -0.5876516, 0.8078431, 1, 0, 1,
-0.8108695, -0.5379761, -3.315737, 0.8, 1, 0, 1,
-0.8062565, -0.2484751, 0.8010836, 0.7921569, 1, 0, 1,
-0.8048947, -1.152873, -3.827529, 0.7882353, 1, 0, 1,
-0.804745, 1.780192, -0.712604, 0.7803922, 1, 0, 1,
-0.7987376, -0.1264836, -2.268115, 0.7764706, 1, 0, 1,
-0.7944074, -1.609133, -4.598573, 0.7686275, 1, 0, 1,
-0.792025, 1.596987, -0.5445123, 0.7647059, 1, 0, 1,
-0.7861086, -1.216974, -3.124904, 0.7568628, 1, 0, 1,
-0.7856274, -2.205955, -3.037002, 0.7529412, 1, 0, 1,
-0.7814765, -0.03024542, -1.653811, 0.7450981, 1, 0, 1,
-0.7765198, -0.2834042, -1.452178, 0.7411765, 1, 0, 1,
-0.7760307, -2.400009, -3.807895, 0.7333333, 1, 0, 1,
-0.775075, -2.285019, -2.059227, 0.7294118, 1, 0, 1,
-0.7743585, 0.1354618, -3.319501, 0.7215686, 1, 0, 1,
-0.7725866, 0.753041, -1.529922, 0.7176471, 1, 0, 1,
-0.7710595, -0.6706198, -2.553931, 0.7098039, 1, 0, 1,
-0.7688634, -0.9309542, -3.510612, 0.7058824, 1, 0, 1,
-0.76876, -0.04750991, -1.321273, 0.6980392, 1, 0, 1,
-0.7668108, 0.5136796, -0.0982402, 0.6901961, 1, 0, 1,
-0.7652584, 1.021842, -2.242474, 0.6862745, 1, 0, 1,
-0.761089, 0.3083818, 0.9565933, 0.6784314, 1, 0, 1,
-0.7518337, -0.6694141, -2.207695, 0.6745098, 1, 0, 1,
-0.7456782, -0.1860793, -1.749365, 0.6666667, 1, 0, 1,
-0.7446874, 0.4448278, -2.291986, 0.6627451, 1, 0, 1,
-0.7306188, -0.4360651, -0.4392682, 0.654902, 1, 0, 1,
-0.7271538, -1.80983, -3.088067, 0.6509804, 1, 0, 1,
-0.7227393, -0.3267018, -2.112209, 0.6431373, 1, 0, 1,
-0.7214728, 0.5852244, -1.653029, 0.6392157, 1, 0, 1,
-0.7162029, 0.4943046, 0.2887322, 0.6313726, 1, 0, 1,
-0.7158954, 1.267897, -1.32883, 0.627451, 1, 0, 1,
-0.7019116, -0.8337525, -2.313948, 0.6196079, 1, 0, 1,
-0.7011715, 1.041568, -1.662077, 0.6156863, 1, 0, 1,
-0.6985996, -1.002509, -1.745301, 0.6078432, 1, 0, 1,
-0.6948204, -0.8019014, -1.949201, 0.6039216, 1, 0, 1,
-0.6878371, -0.8790304, -4.250051, 0.5960785, 1, 0, 1,
-0.6869426, -1.901581, -2.767667, 0.5882353, 1, 0, 1,
-0.6855533, -0.4679653, -2.624605, 0.5843138, 1, 0, 1,
-0.6845564, 0.3069048, -1.819177, 0.5764706, 1, 0, 1,
-0.6838991, -2.182718, -2.730891, 0.572549, 1, 0, 1,
-0.6807538, 0.9102894, -0.9653755, 0.5647059, 1, 0, 1,
-0.6730009, 1.481988, -0.102442, 0.5607843, 1, 0, 1,
-0.6728771, -3.347653, -2.003132, 0.5529412, 1, 0, 1,
-0.6682884, -1.041652, -1.908727, 0.5490196, 1, 0, 1,
-0.6624621, 0.1839875, -0.8415657, 0.5411765, 1, 0, 1,
-0.6591682, 0.5303496, 0.1111895, 0.5372549, 1, 0, 1,
-0.655008, -0.1020621, -1.051768, 0.5294118, 1, 0, 1,
-0.6544428, 0.3741175, -2.590889, 0.5254902, 1, 0, 1,
-0.6533068, -0.2713773, -1.188327, 0.5176471, 1, 0, 1,
-0.6500515, 0.7353765, -1.382287, 0.5137255, 1, 0, 1,
-0.6477572, -1.454507, -1.72104, 0.5058824, 1, 0, 1,
-0.6474745, -1.405449, -2.632827, 0.5019608, 1, 0, 1,
-0.6468127, 0.3989687, -1.413523, 0.4941176, 1, 0, 1,
-0.6465841, 0.7563258, 0.004257313, 0.4862745, 1, 0, 1,
-0.6426021, -0.6136654, -0.5089524, 0.4823529, 1, 0, 1,
-0.6406407, -0.269987, -4.511904, 0.4745098, 1, 0, 1,
-0.6393383, 0.03140729, -2.692973, 0.4705882, 1, 0, 1,
-0.6348752, 0.9866663, -1.073576, 0.4627451, 1, 0, 1,
-0.6262685, 0.7422248, -0.08951624, 0.4588235, 1, 0, 1,
-0.6254456, -1.174291, -2.07098, 0.4509804, 1, 0, 1,
-0.6245065, -0.355688, -0.8375243, 0.4470588, 1, 0, 1,
-0.6201353, -0.2398325, -1.304148, 0.4392157, 1, 0, 1,
-0.6178848, 2.736359, -1.501375, 0.4352941, 1, 0, 1,
-0.6160964, -1.374641, -1.654389, 0.427451, 1, 0, 1,
-0.6126126, 0.1553593, -1.414583, 0.4235294, 1, 0, 1,
-0.6100366, -0.6339604, -2.064411, 0.4156863, 1, 0, 1,
-0.6091029, -1.795765, -4.215207, 0.4117647, 1, 0, 1,
-0.6062702, 0.8705995, -0.2446946, 0.4039216, 1, 0, 1,
-0.6060841, -1.112171, -2.023328, 0.3960784, 1, 0, 1,
-0.6046339, 0.4556585, -1.156965, 0.3921569, 1, 0, 1,
-0.5986896, -0.4166993, -3.542369, 0.3843137, 1, 0, 1,
-0.5968318, 0.2972111, -0.227513, 0.3803922, 1, 0, 1,
-0.5968031, 0.09104183, -0.8451692, 0.372549, 1, 0, 1,
-0.5965551, -1.455881, -3.231371, 0.3686275, 1, 0, 1,
-0.59282, -0.003521857, -0.8494384, 0.3607843, 1, 0, 1,
-0.5877673, -0.06637596, -1.249927, 0.3568628, 1, 0, 1,
-0.5876203, -0.9680959, -1.265093, 0.3490196, 1, 0, 1,
-0.5856607, 0.779525, -1.95389, 0.345098, 1, 0, 1,
-0.58491, 0.447491, -2.317387, 0.3372549, 1, 0, 1,
-0.5800589, 0.3857377, 0.5192291, 0.3333333, 1, 0, 1,
-0.5781089, 0.7936889, -0.8553711, 0.3254902, 1, 0, 1,
-0.5745455, 1.79382, -1.14606, 0.3215686, 1, 0, 1,
-0.5710847, 0.7450833, -0.5151606, 0.3137255, 1, 0, 1,
-0.5665689, 0.3930913, -2.24326, 0.3098039, 1, 0, 1,
-0.5521995, -0.9508186, -2.038833, 0.3019608, 1, 0, 1,
-0.5521872, 0.2515456, -0.2083168, 0.2941177, 1, 0, 1,
-0.54801, 0.6881168, 1.634115, 0.2901961, 1, 0, 1,
-0.5466424, -0.06983871, -1.386819, 0.282353, 1, 0, 1,
-0.5458965, 0.3287469, -0.9456548, 0.2784314, 1, 0, 1,
-0.5450324, 0.2802941, -2.052801, 0.2705882, 1, 0, 1,
-0.5414132, -1.109454, -1.994701, 0.2666667, 1, 0, 1,
-0.5413235, 1.047333, -2.342233, 0.2588235, 1, 0, 1,
-0.5402849, 0.7834656, -0.2591227, 0.254902, 1, 0, 1,
-0.5300565, 1.557496, -1.781004, 0.2470588, 1, 0, 1,
-0.5291008, -0.5134174, -2.440931, 0.2431373, 1, 0, 1,
-0.528771, -0.9709496, -1.778921, 0.2352941, 1, 0, 1,
-0.5260321, 0.3334939, -0.7247401, 0.2313726, 1, 0, 1,
-0.5231497, -0.8384066, -3.051373, 0.2235294, 1, 0, 1,
-0.519928, 2.281154, -1.123744, 0.2196078, 1, 0, 1,
-0.5175064, -0.5286636, -1.875693, 0.2117647, 1, 0, 1,
-0.5117273, -0.814321, -2.174924, 0.2078431, 1, 0, 1,
-0.5059271, 0.839205, -0.5619212, 0.2, 1, 0, 1,
-0.5016064, -0.5159341, -3.402378, 0.1921569, 1, 0, 1,
-0.4997472, -0.666045, -0.4565828, 0.1882353, 1, 0, 1,
-0.4944046, -0.1238383, -2.178499, 0.1803922, 1, 0, 1,
-0.4909604, 0.8155751, -0.5498496, 0.1764706, 1, 0, 1,
-0.4902309, -1.675547, -2.206723, 0.1686275, 1, 0, 1,
-0.48998, 2.612417, 1.350338, 0.1647059, 1, 0, 1,
-0.4889221, 1.476841, -0.5382203, 0.1568628, 1, 0, 1,
-0.4867034, -1.412564, -2.667477, 0.1529412, 1, 0, 1,
-0.4742902, -0.9610466, -3.262697, 0.145098, 1, 0, 1,
-0.4627577, 0.102415, -0.08461396, 0.1411765, 1, 0, 1,
-0.4626628, 1.635815, 0.1475051, 0.1333333, 1, 0, 1,
-0.4581933, 0.5382462, -0.5229706, 0.1294118, 1, 0, 1,
-0.4476601, 0.3369083, -1.471203, 0.1215686, 1, 0, 1,
-0.4378996, -0.2402498, -1.948516, 0.1176471, 1, 0, 1,
-0.4376191, 0.2935563, 1.650134, 0.1098039, 1, 0, 1,
-0.4374505, 1.070704, 0.6840445, 0.1058824, 1, 0, 1,
-0.4331495, 0.5875985, -1.119576, 0.09803922, 1, 0, 1,
-0.4329709, -0.1433945, 0.2374805, 0.09019608, 1, 0, 1,
-0.4317077, 0.511637, 0.606023, 0.08627451, 1, 0, 1,
-0.4291008, 0.4408039, 0.5436551, 0.07843138, 1, 0, 1,
-0.4260651, -0.5771856, 0.1687581, 0.07450981, 1, 0, 1,
-0.4215178, 0.006136389, 1.088841, 0.06666667, 1, 0, 1,
-0.4197567, 0.116302, -1.421412, 0.0627451, 1, 0, 1,
-0.4183995, 0.2192307, -0.7852095, 0.05490196, 1, 0, 1,
-0.4177131, -1.462652, -3.628292, 0.05098039, 1, 0, 1,
-0.4170013, -0.8088489, -3.735481, 0.04313726, 1, 0, 1,
-0.414743, -0.9367306, -1.54209, 0.03921569, 1, 0, 1,
-0.4121807, 0.1265872, -1.979867, 0.03137255, 1, 0, 1,
-0.4108661, -0.3980557, -1.264517, 0.02745098, 1, 0, 1,
-0.4102801, -1.184569, -1.859228, 0.01960784, 1, 0, 1,
-0.4082937, 1.230592, -0.6414831, 0.01568628, 1, 0, 1,
-0.4073547, 0.7157941, -0.6359887, 0.007843138, 1, 0, 1,
-0.3925318, -2.825985, -1.826642, 0.003921569, 1, 0, 1,
-0.3922663, 0.3101143, -1.529229, 0, 1, 0.003921569, 1,
-0.3914239, -0.7843858, -1.222887, 0, 1, 0.01176471, 1,
-0.3913673, 0.6156577, -0.2664832, 0, 1, 0.01568628, 1,
-0.3908349, -0.7743021, -1.52778, 0, 1, 0.02352941, 1,
-0.3899553, -0.04231462, -2.455952, 0, 1, 0.02745098, 1,
-0.3897692, -0.0863056, -0.5061936, 0, 1, 0.03529412, 1,
-0.3793124, -0.990937, -2.483445, 0, 1, 0.03921569, 1,
-0.3774516, 1.627577, -0.5699623, 0, 1, 0.04705882, 1,
-0.3760639, -0.815287, -2.651983, 0, 1, 0.05098039, 1,
-0.3730462, 0.3050261, -0.2612841, 0, 1, 0.05882353, 1,
-0.3674721, 0.8954294, 0.727742, 0, 1, 0.0627451, 1,
-0.3631966, 0.1314849, -0.7125272, 0, 1, 0.07058824, 1,
-0.3606666, -1.220742, -3.268993, 0, 1, 0.07450981, 1,
-0.3585846, 0.7374096, -0.3256944, 0, 1, 0.08235294, 1,
-0.3578015, -1.131766, -3.102492, 0, 1, 0.08627451, 1,
-0.3525267, -0.1219276, -3.038507, 0, 1, 0.09411765, 1,
-0.3499647, -1.330746, -2.838961, 0, 1, 0.1019608, 1,
-0.3481984, -1.099559, -3.426, 0, 1, 0.1058824, 1,
-0.3477954, 0.06813213, -1.568301, 0, 1, 0.1137255, 1,
-0.3471269, -1.192764, -2.603153, 0, 1, 0.1176471, 1,
-0.3448566, 0.6857705, 1.260733, 0, 1, 0.1254902, 1,
-0.3440687, 0.1128685, 0.287028, 0, 1, 0.1294118, 1,
-0.3408099, 0.2209571, 0.3824472, 0, 1, 0.1372549, 1,
-0.3371174, -0.5871612, -2.642232, 0, 1, 0.1411765, 1,
-0.3367823, -0.1788816, -3.650232, 0, 1, 0.1490196, 1,
-0.3322712, -0.2221729, 0.05115005, 0, 1, 0.1529412, 1,
-0.3302215, 1.243249, -0.2005563, 0, 1, 0.1607843, 1,
-0.3253609, -1.234125, -2.037392, 0, 1, 0.1647059, 1,
-0.3235795, 0.4627473, -1.03266, 0, 1, 0.172549, 1,
-0.3153029, -0.2125745, -3.084582, 0, 1, 0.1764706, 1,
-0.3117544, 0.9714421, -0.4664315, 0, 1, 0.1843137, 1,
-0.3080566, -0.368584, -1.954237, 0, 1, 0.1882353, 1,
-0.3072208, 0.5619873, 0.8616668, 0, 1, 0.1960784, 1,
-0.3057884, 0.7901269, -0.6382009, 0, 1, 0.2039216, 1,
-0.3010209, 0.1620016, -0.5976427, 0, 1, 0.2078431, 1,
-0.29732, 0.3749484, -1.952738, 0, 1, 0.2156863, 1,
-0.2965989, -0.7016391, -3.526449, 0, 1, 0.2196078, 1,
-0.2948751, 0.8081583, 1.550535, 0, 1, 0.227451, 1,
-0.2932042, 1.941791, 1.412556, 0, 1, 0.2313726, 1,
-0.2901233, -0.5454573, -2.459841, 0, 1, 0.2392157, 1,
-0.2894409, -0.2748994, -2.093882, 0, 1, 0.2431373, 1,
-0.2859275, -0.09172475, -2.04406, 0, 1, 0.2509804, 1,
-0.2856446, -0.3176793, -2.632392, 0, 1, 0.254902, 1,
-0.2847511, 1.909127, -0.6128407, 0, 1, 0.2627451, 1,
-0.2844237, -2.367182, -3.688855, 0, 1, 0.2666667, 1,
-0.2787143, 0.4406748, 1.156439, 0, 1, 0.2745098, 1,
-0.2765131, -0.8943841, -3.545556, 0, 1, 0.2784314, 1,
-0.2752568, -0.8704908, -4.536011, 0, 1, 0.2862745, 1,
-0.267841, -0.9551062, -3.530209, 0, 1, 0.2901961, 1,
-0.2634093, 0.04743579, -0.882223, 0, 1, 0.2980392, 1,
-0.2630441, -1.71685, -0.6919339, 0, 1, 0.3058824, 1,
-0.2615426, 0.418461, -2.182584, 0, 1, 0.3098039, 1,
-0.2594444, -1.093914, -3.931073, 0, 1, 0.3176471, 1,
-0.2567109, 1.165279, -1.329868, 0, 1, 0.3215686, 1,
-0.2538222, -1.000966, -3.388, 0, 1, 0.3294118, 1,
-0.2535171, -0.6740229, -2.516965, 0, 1, 0.3333333, 1,
-0.2519741, 2.061325, -0.5498784, 0, 1, 0.3411765, 1,
-0.2508006, 1.097166, -2.221319, 0, 1, 0.345098, 1,
-0.2500412, 1.735137, 0.08274329, 0, 1, 0.3529412, 1,
-0.2478754, -0.8189282, -3.83333, 0, 1, 0.3568628, 1,
-0.2423907, -0.4696202, -2.645651, 0, 1, 0.3647059, 1,
-0.2413186, -1.493713, -4.046495, 0, 1, 0.3686275, 1,
-0.2383933, -1.98511, -1.91597, 0, 1, 0.3764706, 1,
-0.2379543, 0.7231718, 2.273064, 0, 1, 0.3803922, 1,
-0.2359598, -0.06094049, -2.134825, 0, 1, 0.3882353, 1,
-0.2263857, 0.5777307, -0.076288, 0, 1, 0.3921569, 1,
-0.2257832, -0.1560788, -2.09791, 0, 1, 0.4, 1,
-0.2250272, -0.08930778, -1.200137, 0, 1, 0.4078431, 1,
-0.221378, 0.8541455, 0.7095622, 0, 1, 0.4117647, 1,
-0.2213596, 1.496418, -0.646699, 0, 1, 0.4196078, 1,
-0.220726, 0.445455, -2.062641, 0, 1, 0.4235294, 1,
-0.2160084, -0.1484272, -2.575976, 0, 1, 0.4313726, 1,
-0.2147119, 0.1280099, -1.138422, 0, 1, 0.4352941, 1,
-0.2098734, 0.3309487, -2.103337, 0, 1, 0.4431373, 1,
-0.2092893, 1.124391, -1.581596, 0, 1, 0.4470588, 1,
-0.2086999, -1.014871, -3.15258, 0, 1, 0.454902, 1,
-0.2083764, 0.2245792, -1.116278, 0, 1, 0.4588235, 1,
-0.204075, -0.0657646, 0.1664426, 0, 1, 0.4666667, 1,
-0.1989986, 0.926332, 0.3853431, 0, 1, 0.4705882, 1,
-0.1986212, -0.07399422, -0.7863219, 0, 1, 0.4784314, 1,
-0.1974018, -0.6734735, -2.377007, 0, 1, 0.4823529, 1,
-0.1886525, 0.06204225, -1.887962, 0, 1, 0.4901961, 1,
-0.1855732, -1.004382, -4.068518, 0, 1, 0.4941176, 1,
-0.1798275, 0.4337258, -0.7426132, 0, 1, 0.5019608, 1,
-0.1697865, -0.4031421, -4.277421, 0, 1, 0.509804, 1,
-0.16805, -1.124577, -3.572234, 0, 1, 0.5137255, 1,
-0.1673379, 0.8922523, -0.3530301, 0, 1, 0.5215687, 1,
-0.1664395, -1.031876, -0.6768201, 0, 1, 0.5254902, 1,
-0.1535385, -0.8723649, -2.959402, 0, 1, 0.5333334, 1,
-0.152758, 1.00296, -0.3276515, 0, 1, 0.5372549, 1,
-0.1524058, 0.9887679, -0.5903615, 0, 1, 0.5450981, 1,
-0.151278, -0.7168055, -2.742627, 0, 1, 0.5490196, 1,
-0.1469628, -0.8885674, -1.608333, 0, 1, 0.5568628, 1,
-0.1445189, -0.2391964, -3.98623, 0, 1, 0.5607843, 1,
-0.1436951, -0.2136798, -0.9200023, 0, 1, 0.5686275, 1,
-0.1402105, 0.09423839, -0.6642166, 0, 1, 0.572549, 1,
-0.1372166, -0.7774197, -2.094571, 0, 1, 0.5803922, 1,
-0.1361136, -0.256397, -2.23503, 0, 1, 0.5843138, 1,
-0.1354035, -0.08567357, -3.056376, 0, 1, 0.5921569, 1,
-0.1351539, 1.736599, 0.4878276, 0, 1, 0.5960785, 1,
-0.1328453, -0.4410411, -3.535943, 0, 1, 0.6039216, 1,
-0.1308562, 1.499793, -0.325321, 0, 1, 0.6117647, 1,
-0.1275613, 0.02135572, -1.780524, 0, 1, 0.6156863, 1,
-0.1267552, -0.1129946, -2.99396, 0, 1, 0.6235294, 1,
-0.1210202, -0.2819217, -2.909086, 0, 1, 0.627451, 1,
-0.119705, -0.9206968, -1.297969, 0, 1, 0.6352941, 1,
-0.1176804, -0.6288765, -3.915097, 0, 1, 0.6392157, 1,
-0.1174616, -0.09320289, -1.453245, 0, 1, 0.6470588, 1,
-0.1147068, 1.82498, 0.4751621, 0, 1, 0.6509804, 1,
-0.1125549, -0.06390592, -0.9498139, 0, 1, 0.6588235, 1,
-0.1104363, 1.091465, -0.7573239, 0, 1, 0.6627451, 1,
-0.1089427, 1.2282, 1.739774, 0, 1, 0.6705883, 1,
-0.1083157, 1.273767, 0.08497945, 0, 1, 0.6745098, 1,
-0.1051235, 0.2181604, 0.252085, 0, 1, 0.682353, 1,
-0.1038812, -0.6868933, -2.0703, 0, 1, 0.6862745, 1,
-0.1032831, 1.143246, 0.3938469, 0, 1, 0.6941177, 1,
-0.1004309, 0.6402616, 1.155657, 0, 1, 0.7019608, 1,
-0.0960071, 1.726311, 0.6181257, 0, 1, 0.7058824, 1,
-0.08987918, -0.6575494, -3.858872, 0, 1, 0.7137255, 1,
-0.0898692, -0.0354704, -1.929665, 0, 1, 0.7176471, 1,
-0.08811203, 1.55372, 0.744536, 0, 1, 0.7254902, 1,
-0.08457108, -1.638919, -4.210095, 0, 1, 0.7294118, 1,
-0.080332, -0.05640166, -3.413744, 0, 1, 0.7372549, 1,
-0.0769925, -0.1407863, -0.6289085, 0, 1, 0.7411765, 1,
-0.07670696, 0.1635302, -2.259123, 0, 1, 0.7490196, 1,
-0.07396885, 0.9543443, -1.31841, 0, 1, 0.7529412, 1,
-0.07371913, 0.9726993, -0.1233483, 0, 1, 0.7607843, 1,
-0.07363722, -0.3126571, -4.132105, 0, 1, 0.7647059, 1,
-0.07046605, 0.5808667, -0.3355518, 0, 1, 0.772549, 1,
-0.06956759, 0.8828004, -1.512719, 0, 1, 0.7764706, 1,
-0.06666212, 0.09877969, -0.3451728, 0, 1, 0.7843137, 1,
-0.06453744, -0.2930951, -3.481502, 0, 1, 0.7882353, 1,
-0.06275623, 0.9621506, -0.9636786, 0, 1, 0.7960784, 1,
-0.06227782, 0.6099687, 0.4645417, 0, 1, 0.8039216, 1,
-0.06141759, 0.4502384, -2.332596, 0, 1, 0.8078431, 1,
-0.06113491, -0.04148759, -1.393837, 0, 1, 0.8156863, 1,
-0.05925449, 0.4059564, -0.02597983, 0, 1, 0.8196079, 1,
-0.05678095, 1.185319, -0.04063078, 0, 1, 0.827451, 1,
-0.05657748, -0.06662381, -1.228645, 0, 1, 0.8313726, 1,
-0.05367803, 0.6641256, -0.7871808, 0, 1, 0.8392157, 1,
-0.05308546, 1.976868, -0.4684332, 0, 1, 0.8431373, 1,
-0.05289051, -0.4166597, -2.101899, 0, 1, 0.8509804, 1,
-0.05251716, -0.2004725, -3.382285, 0, 1, 0.854902, 1,
-0.05081054, -0.3732658, -1.399973, 0, 1, 0.8627451, 1,
-0.04957839, -2.293165, -2.249193, 0, 1, 0.8666667, 1,
-0.04853887, -0.7398792, -3.683378, 0, 1, 0.8745098, 1,
-0.04673425, -2.378293, -2.941148, 0, 1, 0.8784314, 1,
-0.04068151, -0.04878215, -1.58975, 0, 1, 0.8862745, 1,
-0.03882153, 0.5469207, 1.958032, 0, 1, 0.8901961, 1,
-0.0352399, 0.3311235, -0.7887696, 0, 1, 0.8980392, 1,
-0.03483294, -1.275307, -3.516654, 0, 1, 0.9058824, 1,
-0.03303306, -0.8014163, -2.498087, 0, 1, 0.9098039, 1,
-0.02972304, 0.1205361, -1.41788, 0, 1, 0.9176471, 1,
-0.02965836, -0.6236486, -1.993099, 0, 1, 0.9215686, 1,
-0.028449, 0.04544498, -1.867692, 0, 1, 0.9294118, 1,
-0.02348191, -0.1948578, -3.745042, 0, 1, 0.9333333, 1,
-0.02116292, 0.5197849, -0.03271224, 0, 1, 0.9411765, 1,
-0.02103336, -0.5415113, -3.863743, 0, 1, 0.945098, 1,
-0.01878775, -0.4772889, -5.412955, 0, 1, 0.9529412, 1,
-0.01784515, 0.8535177, -0.194452, 0, 1, 0.9568627, 1,
-0.01588642, -1.106452, -2.461887, 0, 1, 0.9647059, 1,
-0.01282359, 0.3557584, 1.272188, 0, 1, 0.9686275, 1,
-0.005870514, -0.6635647, -4.768429, 0, 1, 0.9764706, 1,
-0.005097185, 0.04077004, -1.882037, 0, 1, 0.9803922, 1,
-0.001993962, 0.5191717, -0.911234, 0, 1, 0.9882353, 1,
-0.001520435, -0.7804415, -3.72872, 0, 1, 0.9921569, 1,
0.0009520557, 0.440399, 2.377274, 0, 1, 1, 1,
0.006646116, -0.2865607, 3.638156, 0, 0.9921569, 1, 1,
0.007350225, 1.684884, 1.387985, 0, 0.9882353, 1, 1,
0.01400896, 1.274259, -1.162852, 0, 0.9803922, 1, 1,
0.016691, -1.416061, 4.71557, 0, 0.9764706, 1, 1,
0.01744253, -0.9128597, 1.94035, 0, 0.9686275, 1, 1,
0.01949619, -0.7755603, 3.602711, 0, 0.9647059, 1, 1,
0.01976358, -0.8791306, 4.52036, 0, 0.9568627, 1, 1,
0.02172104, 1.917883, -0.2017153, 0, 0.9529412, 1, 1,
0.02209781, 1.217885, -0.7199755, 0, 0.945098, 1, 1,
0.02533788, -0.7467163, 2.49026, 0, 0.9411765, 1, 1,
0.02541428, 0.5755554, 0.6693311, 0, 0.9333333, 1, 1,
0.02564412, 1.153718, -0.4611107, 0, 0.9294118, 1, 1,
0.02698646, -0.1943738, 3.767097, 0, 0.9215686, 1, 1,
0.02986639, 0.3958798, -0.1093522, 0, 0.9176471, 1, 1,
0.03133236, -0.8602837, 2.446746, 0, 0.9098039, 1, 1,
0.03194797, -1.131858, 4.636541, 0, 0.9058824, 1, 1,
0.03238427, -0.5401207, 3.065903, 0, 0.8980392, 1, 1,
0.03344047, 1.517804, 0.2065519, 0, 0.8901961, 1, 1,
0.03701243, 0.1835576, -0.8632407, 0, 0.8862745, 1, 1,
0.04287841, -0.1169907, 2.760825, 0, 0.8784314, 1, 1,
0.04341451, 0.8264468, -0.4993986, 0, 0.8745098, 1, 1,
0.04378962, 0.7901228, -0.8736326, 0, 0.8666667, 1, 1,
0.04864047, 0.3458076, 0.6239215, 0, 0.8627451, 1, 1,
0.04899122, -0.9267263, 3.591293, 0, 0.854902, 1, 1,
0.04949184, 1.607552, -0.3034864, 0, 0.8509804, 1, 1,
0.0520189, -0.874721, 4.007214, 0, 0.8431373, 1, 1,
0.05363765, -0.7694595, 3.796987, 0, 0.8392157, 1, 1,
0.0587438, -0.3393906, 3.777448, 0, 0.8313726, 1, 1,
0.06845824, -0.7413068, 2.69921, 0, 0.827451, 1, 1,
0.06992485, 1.461664, -0.7586424, 0, 0.8196079, 1, 1,
0.07174865, 0.8729379, 0.2112311, 0, 0.8156863, 1, 1,
0.07862664, 0.8875576, 0.4312882, 0, 0.8078431, 1, 1,
0.0819141, -0.1809675, 2.050796, 0, 0.8039216, 1, 1,
0.08245078, -1.461636, 2.432326, 0, 0.7960784, 1, 1,
0.08391186, -0.3303399, 2.28259, 0, 0.7882353, 1, 1,
0.09870838, -1.202809, 2.992424, 0, 0.7843137, 1, 1,
0.09895998, 1.923334, -0.1136708, 0, 0.7764706, 1, 1,
0.09955093, 1.20874, -0.04819952, 0, 0.772549, 1, 1,
0.1006603, 0.5533332, -0.7314556, 0, 0.7647059, 1, 1,
0.1020771, 0.343317, 0.8352458, 0, 0.7607843, 1, 1,
0.1061581, 1.765396, 1.296875, 0, 0.7529412, 1, 1,
0.108177, -0.7848616, 2.318682, 0, 0.7490196, 1, 1,
0.1111294, -3.263148, 4.212515, 0, 0.7411765, 1, 1,
0.1123571, 1.551222, 0.4068879, 0, 0.7372549, 1, 1,
0.1142816, 0.2447085, 0.5313869, 0, 0.7294118, 1, 1,
0.1156521, -1.812648, 2.879568, 0, 0.7254902, 1, 1,
0.1165521, -0.8540252, 3.850438, 0, 0.7176471, 1, 1,
0.1204622, -0.9119754, 3.294719, 0, 0.7137255, 1, 1,
0.1207416, 0.1482015, 0.6288958, 0, 0.7058824, 1, 1,
0.122366, -0.9641585, 3.316111, 0, 0.6980392, 1, 1,
0.1226955, 0.07930814, 1.658338, 0, 0.6941177, 1, 1,
0.1261575, 1.232296, 0.7732126, 0, 0.6862745, 1, 1,
0.1262024, -2.470378, 2.889229, 0, 0.682353, 1, 1,
0.1262987, -0.1676209, 2.3326, 0, 0.6745098, 1, 1,
0.1290389, 0.5966248, 0.7708653, 0, 0.6705883, 1, 1,
0.1325581, 1.157033, -0.3930236, 0, 0.6627451, 1, 1,
0.1338354, -0.4526114, -0.7780002, 0, 0.6588235, 1, 1,
0.1362778, -1.866049, 1.208935, 0, 0.6509804, 1, 1,
0.1387426, -2.051915, 2.752874, 0, 0.6470588, 1, 1,
0.1393449, 0.1230504, 0.7003887, 0, 0.6392157, 1, 1,
0.1429849, -0.6498331, 1.934338, 0, 0.6352941, 1, 1,
0.14332, -0.8367599, 1.304995, 0, 0.627451, 1, 1,
0.1553184, -1.674592, 3.356233, 0, 0.6235294, 1, 1,
0.1574412, 1.253954, -1.278368, 0, 0.6156863, 1, 1,
0.1578551, -0.3217705, 3.084414, 0, 0.6117647, 1, 1,
0.1667655, 0.85051, -0.876056, 0, 0.6039216, 1, 1,
0.173271, 1.117152, 0.4391937, 0, 0.5960785, 1, 1,
0.1734213, -0.4448166, 3.77332, 0, 0.5921569, 1, 1,
0.1817107, 0.54876, -0.4579218, 0, 0.5843138, 1, 1,
0.1852279, 1.343886, 0.3052385, 0, 0.5803922, 1, 1,
0.1901644, -0.596826, 3.964215, 0, 0.572549, 1, 1,
0.1949801, -0.3155402, 3.319655, 0, 0.5686275, 1, 1,
0.1952357, 0.3725308, 2.507999, 0, 0.5607843, 1, 1,
0.195635, 0.2224239, 0.2008336, 0, 0.5568628, 1, 1,
0.199111, 1.306412, 1.430779, 0, 0.5490196, 1, 1,
0.1994577, -0.2311059, 2.109801, 0, 0.5450981, 1, 1,
0.202265, -0.6844798, 3.313639, 0, 0.5372549, 1, 1,
0.2050952, -0.2173025, 2.324492, 0, 0.5333334, 1, 1,
0.2079729, -0.4078216, 0.9435216, 0, 0.5254902, 1, 1,
0.2108884, -1.863045, 3.339533, 0, 0.5215687, 1, 1,
0.2126447, -0.1285439, 3.631138, 0, 0.5137255, 1, 1,
0.2128584, 1.279089, 1.435846, 0, 0.509804, 1, 1,
0.2196774, -0.6297304, 2.789212, 0, 0.5019608, 1, 1,
0.2218949, 1.988358, -0.02669603, 0, 0.4941176, 1, 1,
0.2269228, -0.2993074, 2.060245, 0, 0.4901961, 1, 1,
0.2286375, 0.4614435, 1.466781, 0, 0.4823529, 1, 1,
0.2290306, 0.233397, 1.808287, 0, 0.4784314, 1, 1,
0.2328853, 0.8172097, 0.1158369, 0, 0.4705882, 1, 1,
0.2340274, -1.101305, 3.341448, 0, 0.4666667, 1, 1,
0.2370487, 0.3152058, 0.2217109, 0, 0.4588235, 1, 1,
0.2389088, 0.7476528, 0.8627664, 0, 0.454902, 1, 1,
0.2452767, 1.58335, 0.677321, 0, 0.4470588, 1, 1,
0.2453899, -1.438656, 1.442864, 0, 0.4431373, 1, 1,
0.2460165, -1.005601, 3.838215, 0, 0.4352941, 1, 1,
0.2489405, 1.60488, 0.1911004, 0, 0.4313726, 1, 1,
0.2548354, 0.04108464, 0.8304687, 0, 0.4235294, 1, 1,
0.2551538, -0.0681861, 1.231785, 0, 0.4196078, 1, 1,
0.2580377, 0.9839923, -0.6937068, 0, 0.4117647, 1, 1,
0.2583475, -0.4087097, 3.283697, 0, 0.4078431, 1, 1,
0.2583853, -0.4270901, 3.453366, 0, 0.4, 1, 1,
0.2586704, -0.5645211, 2.097504, 0, 0.3921569, 1, 1,
0.262834, 0.2680243, 2.237622, 0, 0.3882353, 1, 1,
0.2633208, -0.9956343, 2.137778, 0, 0.3803922, 1, 1,
0.2639083, 1.132526, -0.5597377, 0, 0.3764706, 1, 1,
0.264025, 0.1725126, 1.083393, 0, 0.3686275, 1, 1,
0.2656053, -0.3087019, 2.263703, 0, 0.3647059, 1, 1,
0.2664498, -0.2040227, 3.692627, 0, 0.3568628, 1, 1,
0.2673807, 1.492638, 0.156535, 0, 0.3529412, 1, 1,
0.2808957, -1.661587, 2.852966, 0, 0.345098, 1, 1,
0.2825159, -0.03663299, 2.163403, 0, 0.3411765, 1, 1,
0.294131, 0.8382095, -0.2845246, 0, 0.3333333, 1, 1,
0.2978519, 0.5906096, 1.926931, 0, 0.3294118, 1, 1,
0.2981116, 0.6832859, 0.2676068, 0, 0.3215686, 1, 1,
0.2985741, -0.7844697, 2.892309, 0, 0.3176471, 1, 1,
0.3004507, 0.5641352, 0.6924332, 0, 0.3098039, 1, 1,
0.3005402, 0.1417115, 1.889949, 0, 0.3058824, 1, 1,
0.3022842, -0.1688952, 3.120348, 0, 0.2980392, 1, 1,
0.3059543, -0.693148, 2.852156, 0, 0.2901961, 1, 1,
0.3068968, 1.155236, -0.6507824, 0, 0.2862745, 1, 1,
0.3075536, 2.275892, -1.141568, 0, 0.2784314, 1, 1,
0.3110018, -1.451129, 3.147974, 0, 0.2745098, 1, 1,
0.3134298, 0.2665678, 1.239852, 0, 0.2666667, 1, 1,
0.3168716, -0.026961, 1.979833, 0, 0.2627451, 1, 1,
0.3175734, 0.1045133, 1.443678, 0, 0.254902, 1, 1,
0.320057, -0.2951661, 0.8187655, 0, 0.2509804, 1, 1,
0.3214262, -0.0980619, 3.309632, 0, 0.2431373, 1, 1,
0.3231857, -0.09275223, 1.953969, 0, 0.2392157, 1, 1,
0.327822, 0.6770255, 0.5355546, 0, 0.2313726, 1, 1,
0.3289747, -0.07491229, 3.031559, 0, 0.227451, 1, 1,
0.3317815, -0.9711017, 0.1439715, 0, 0.2196078, 1, 1,
0.3348341, -1.231245, 4.336068, 0, 0.2156863, 1, 1,
0.334868, -0.7461137, 2.793509, 0, 0.2078431, 1, 1,
0.3356493, -0.9934233, 4.833092, 0, 0.2039216, 1, 1,
0.3358379, 0.4682231, 1.158539, 0, 0.1960784, 1, 1,
0.3449047, -1.959284, 0.3408938, 0, 0.1882353, 1, 1,
0.3499338, -0.9837593, 2.745097, 0, 0.1843137, 1, 1,
0.3512811, -0.6260991, 3.26104, 0, 0.1764706, 1, 1,
0.3526217, -0.6446643, 2.910893, 0, 0.172549, 1, 1,
0.3537662, -1.023039, -0.02978912, 0, 0.1647059, 1, 1,
0.3593296, 0.7800065, 0.6224308, 0, 0.1607843, 1, 1,
0.3606073, 2.415876, -0.07627332, 0, 0.1529412, 1, 1,
0.3615427, 0.2418653, 2.662348, 0, 0.1490196, 1, 1,
0.36235, 0.9939283, 0.2705998, 0, 0.1411765, 1, 1,
0.3633413, -1.036025, 1.849606, 0, 0.1372549, 1, 1,
0.3653366, -0.6358333, 2.563655, 0, 0.1294118, 1, 1,
0.3664775, -0.8643852, 2.698868, 0, 0.1254902, 1, 1,
0.3667865, -0.7679186, 4.45858, 0, 0.1176471, 1, 1,
0.3685338, 1.089999, 1.844256, 0, 0.1137255, 1, 1,
0.3733866, 1.251186, 0.05892619, 0, 0.1058824, 1, 1,
0.3780095, -0.3689373, 2.4426, 0, 0.09803922, 1, 1,
0.3798262, 0.3338171, 1.211682, 0, 0.09411765, 1, 1,
0.3813888, 0.06903126, 1.201162, 0, 0.08627451, 1, 1,
0.3827402, 0.5602931, 0.5374568, 0, 0.08235294, 1, 1,
0.3829199, 0.05844093, 0.9099268, 0, 0.07450981, 1, 1,
0.3865202, -1.197197, 3.830165, 0, 0.07058824, 1, 1,
0.3889874, -0.7966122, 2.243515, 0, 0.0627451, 1, 1,
0.3934336, 1.952819, 0.7916864, 0, 0.05882353, 1, 1,
0.3941374, -0.7530376, 0.8438196, 0, 0.05098039, 1, 1,
0.3970013, 0.07636455, 1.230386, 0, 0.04705882, 1, 1,
0.402669, 0.6226401, 1.78344, 0, 0.03921569, 1, 1,
0.4038838, -0.3669567, 2.830903, 0, 0.03529412, 1, 1,
0.4057289, -0.8282398, 1.76796, 0, 0.02745098, 1, 1,
0.4067654, 0.07004562, 3.025133, 0, 0.02352941, 1, 1,
0.4079288, 0.4896606, -0.7019178, 0, 0.01568628, 1, 1,
0.4123424, -0.4536879, 3.169687, 0, 0.01176471, 1, 1,
0.4129701, -0.863876, 3.056571, 0, 0.003921569, 1, 1,
0.4138084, -0.9807059, 2.400864, 0.003921569, 0, 1, 1,
0.4186157, -1.174911, 0.9004522, 0.007843138, 0, 1, 1,
0.4199095, 0.4822455, 0.6438845, 0.01568628, 0, 1, 1,
0.4216775, 1.596756, 0.2140266, 0.01960784, 0, 1, 1,
0.4219739, -0.8429777, 1.397883, 0.02745098, 0, 1, 1,
0.4227185, -0.6053715, -0.768627, 0.03137255, 0, 1, 1,
0.4239811, 0.8032631, -0.5589325, 0.03921569, 0, 1, 1,
0.4267559, -0.5977041, 2.07884, 0.04313726, 0, 1, 1,
0.4312221, -0.4166305, 1.247316, 0.05098039, 0, 1, 1,
0.4322228, -0.0311159, 1.882054, 0.05490196, 0, 1, 1,
0.4334026, -0.3030376, 4.093683, 0.0627451, 0, 1, 1,
0.4352056, 0.6593973, 0.5233333, 0.06666667, 0, 1, 1,
0.4378749, -1.940772, 1.181168, 0.07450981, 0, 1, 1,
0.4506529, -0.2870236, 3.609579, 0.07843138, 0, 1, 1,
0.4579263, -0.2765493, 3.630739, 0.08627451, 0, 1, 1,
0.4660946, 1.157646, 0.8029099, 0.09019608, 0, 1, 1,
0.4661167, 0.184548, 2.202508, 0.09803922, 0, 1, 1,
0.4740951, -2.76977, 2.379947, 0.1058824, 0, 1, 1,
0.4746247, 0.004925039, 2.148965, 0.1098039, 0, 1, 1,
0.4764557, -0.2487944, 0.2857022, 0.1176471, 0, 1, 1,
0.4770685, -1.017308, 1.15125, 0.1215686, 0, 1, 1,
0.4781132, 0.4695531, 1.315724, 0.1294118, 0, 1, 1,
0.4786055, 0.2791272, 1.606402, 0.1333333, 0, 1, 1,
0.4789091, 0.3768633, 1.508732, 0.1411765, 0, 1, 1,
0.4913031, 0.2313189, 0.02835506, 0.145098, 0, 1, 1,
0.4926928, -0.6882662, 1.847516, 0.1529412, 0, 1, 1,
0.4963692, 0.3469947, 1.719501, 0.1568628, 0, 1, 1,
0.4980884, -0.03984841, 2.518834, 0.1647059, 0, 1, 1,
0.5035397, -0.4818451, 1.164898, 0.1686275, 0, 1, 1,
0.5088868, 0.5166871, 0.3396325, 0.1764706, 0, 1, 1,
0.5091885, 0.7146634, 2.959056, 0.1803922, 0, 1, 1,
0.5094048, 1.037805, 0.5212356, 0.1882353, 0, 1, 1,
0.5203716, 0.2040186, 2.32155, 0.1921569, 0, 1, 1,
0.5250177, -0.6316018, 2.106272, 0.2, 0, 1, 1,
0.5277241, 0.9322358, 1.010144, 0.2078431, 0, 1, 1,
0.530216, 0.3858847, 1.935414, 0.2117647, 0, 1, 1,
0.5342487, 1.67877, -0.07167938, 0.2196078, 0, 1, 1,
0.5356244, -0.7003098, 4.373296, 0.2235294, 0, 1, 1,
0.5359097, -0.1715347, 0.8689208, 0.2313726, 0, 1, 1,
0.5368792, 0.8924984, 1.960587, 0.2352941, 0, 1, 1,
0.5381292, 0.07552791, -0.01507854, 0.2431373, 0, 1, 1,
0.5401573, 0.01328971, 1.897684, 0.2470588, 0, 1, 1,
0.540958, -0.6122583, 2.800655, 0.254902, 0, 1, 1,
0.545967, 0.6078908, 1.944677, 0.2588235, 0, 1, 1,
0.5469418, -1.021972, 3.458336, 0.2666667, 0, 1, 1,
0.5470564, 0.6054953, 2.453634, 0.2705882, 0, 1, 1,
0.552272, -1.096211, 3.036555, 0.2784314, 0, 1, 1,
0.5610646, -0.7598993, 2.427427, 0.282353, 0, 1, 1,
0.5614939, 0.04836459, 1.322653, 0.2901961, 0, 1, 1,
0.5619615, -0.8121446, 2.055846, 0.2941177, 0, 1, 1,
0.5626624, 0.3206646, 2.474815, 0.3019608, 0, 1, 1,
0.5637668, 1.052204, 0.8622449, 0.3098039, 0, 1, 1,
0.5666837, 1.949139, -0.3848077, 0.3137255, 0, 1, 1,
0.5711126, -1.199512, 3.064612, 0.3215686, 0, 1, 1,
0.5722847, -1.490041, 1.08982, 0.3254902, 0, 1, 1,
0.5738195, 0.1770979, 2.543582, 0.3333333, 0, 1, 1,
0.5747715, 0.9800051, 0.9980931, 0.3372549, 0, 1, 1,
0.5795222, 0.9975455, 1.342069, 0.345098, 0, 1, 1,
0.5813626, 0.4123026, 2.572401, 0.3490196, 0, 1, 1,
0.5832743, -0.5855824, 4.138049, 0.3568628, 0, 1, 1,
0.5836828, 0.4355802, -1.671333, 0.3607843, 0, 1, 1,
0.584992, -0.9415143, 2.457181, 0.3686275, 0, 1, 1,
0.5962431, 0.4115869, -0.1860755, 0.372549, 0, 1, 1,
0.5984209, -2.778647, 3.292204, 0.3803922, 0, 1, 1,
0.5997802, 0.6405687, 1.863597, 0.3843137, 0, 1, 1,
0.6017024, -0.73634, 1.636559, 0.3921569, 0, 1, 1,
0.6022178, 2.774368, 0.2520263, 0.3960784, 0, 1, 1,
0.6069415, -0.2489683, 3.213062, 0.4039216, 0, 1, 1,
0.611838, 1.095347, 0.4883857, 0.4117647, 0, 1, 1,
0.6183006, -1.542184, 3.119914, 0.4156863, 0, 1, 1,
0.6187882, 0.4989019, 0.8288376, 0.4235294, 0, 1, 1,
0.6295217, -1.009876, 2.225827, 0.427451, 0, 1, 1,
0.6306878, 0.5652942, 1.803958, 0.4352941, 0, 1, 1,
0.6314679, -0.5567141, 2.543804, 0.4392157, 0, 1, 1,
0.6349144, 2.523396, 0.2701085, 0.4470588, 0, 1, 1,
0.6364354, 0.5792458, 0.2805906, 0.4509804, 0, 1, 1,
0.6379563, 0.2025609, 1.166362, 0.4588235, 0, 1, 1,
0.6417074, -0.3501503, 1.843266, 0.4627451, 0, 1, 1,
0.6465544, -0.3773002, 0.7340986, 0.4705882, 0, 1, 1,
0.6475095, 1.554631, 0.3231654, 0.4745098, 0, 1, 1,
0.6525498, -0.9893763, 2.257121, 0.4823529, 0, 1, 1,
0.6528149, -0.8617553, 1.879846, 0.4862745, 0, 1, 1,
0.6543352, -1.305847, 2.378574, 0.4941176, 0, 1, 1,
0.6583735, 0.1710913, 2.189308, 0.5019608, 0, 1, 1,
0.6605582, 0.5032712, 0.04706361, 0.5058824, 0, 1, 1,
0.6648301, 0.9151115, 0.2489778, 0.5137255, 0, 1, 1,
0.6664131, 0.5967503, -1.940437, 0.5176471, 0, 1, 1,
0.6681867, 0.3244591, 0.3920713, 0.5254902, 0, 1, 1,
0.670092, -1.423798, 2.182021, 0.5294118, 0, 1, 1,
0.6722383, -0.6782942, 3.434299, 0.5372549, 0, 1, 1,
0.6789745, -1.727147, 0.5343568, 0.5411765, 0, 1, 1,
0.6793771, 0.4140992, 1.270143, 0.5490196, 0, 1, 1,
0.6794613, -0.5575845, 2.780628, 0.5529412, 0, 1, 1,
0.6795729, -1.29648, 3.786638, 0.5607843, 0, 1, 1,
0.6835863, -1.30337, 3.784321, 0.5647059, 0, 1, 1,
0.686132, 1.527704, -0.3392681, 0.572549, 0, 1, 1,
0.6890456, 0.7057648, 0.2747019, 0.5764706, 0, 1, 1,
0.6905165, -1.219927, 3.149529, 0.5843138, 0, 1, 1,
0.6914921, -1.011822, 3.292346, 0.5882353, 0, 1, 1,
0.6924046, -0.2015259, 1.687883, 0.5960785, 0, 1, 1,
0.6932476, 0.3577845, 2.373107, 0.6039216, 0, 1, 1,
0.6932547, -0.191204, 1.57858, 0.6078432, 0, 1, 1,
0.7017062, 0.8970443, 0.8935304, 0.6156863, 0, 1, 1,
0.7060089, 0.2610423, 3.730036, 0.6196079, 0, 1, 1,
0.7069519, -0.350084, 2.589754, 0.627451, 0, 1, 1,
0.7075235, -0.8170379, 2.633264, 0.6313726, 0, 1, 1,
0.7081423, 0.9325733, -0.8801031, 0.6392157, 0, 1, 1,
0.7246583, -0.4496404, 3.20336, 0.6431373, 0, 1, 1,
0.726171, -0.8047227, 2.954411, 0.6509804, 0, 1, 1,
0.7280256, 0.8139842, -0.7744882, 0.654902, 0, 1, 1,
0.7280748, 0.1170028, 1.778821, 0.6627451, 0, 1, 1,
0.7295231, 0.3571596, 1.287101, 0.6666667, 0, 1, 1,
0.7351916, 1.61967, 0.1178078, 0.6745098, 0, 1, 1,
0.7356696, 0.4386371, -0.6491518, 0.6784314, 0, 1, 1,
0.7407141, 0.2812847, 2.373563, 0.6862745, 0, 1, 1,
0.7424867, -1.28743, 2.209904, 0.6901961, 0, 1, 1,
0.7461959, -0.9115663, 1.088948, 0.6980392, 0, 1, 1,
0.7463001, 1.392056, -0.1184715, 0.7058824, 0, 1, 1,
0.7608542, -1.088699, 2.841397, 0.7098039, 0, 1, 1,
0.7619827, 0.8964068, -0.5212908, 0.7176471, 0, 1, 1,
0.7631646, 2.126214, 0.7943307, 0.7215686, 0, 1, 1,
0.7633283, -0.1523949, 3.305724, 0.7294118, 0, 1, 1,
0.7650113, 0.3909625, 2.539751, 0.7333333, 0, 1, 1,
0.7684582, 0.8723036, -1.180715, 0.7411765, 0, 1, 1,
0.7736998, 1.001843, 1.224665, 0.7450981, 0, 1, 1,
0.7783592, -2.397551, 1.124565, 0.7529412, 0, 1, 1,
0.7886652, -1.09593, 2.753295, 0.7568628, 0, 1, 1,
0.7902308, -1.574952, 1.302718, 0.7647059, 0, 1, 1,
0.7976214, 2.117968, -0.4053203, 0.7686275, 0, 1, 1,
0.7993334, -1.17815, 1.813657, 0.7764706, 0, 1, 1,
0.8103909, -0.7912877, 2.588261, 0.7803922, 0, 1, 1,
0.8192589, -0.9553778, 1.092527, 0.7882353, 0, 1, 1,
0.8202484, 1.800506, -0.9556244, 0.7921569, 0, 1, 1,
0.8265868, 1.091243, 0.08248399, 0.8, 0, 1, 1,
0.8483654, -0.1116421, 2.056664, 0.8078431, 0, 1, 1,
0.8495902, 0.7501489, -0.5255971, 0.8117647, 0, 1, 1,
0.8506329, -0.2994689, 0.2807987, 0.8196079, 0, 1, 1,
0.8514425, -0.275223, 1.344319, 0.8235294, 0, 1, 1,
0.8522074, -0.2711657, 2.193371, 0.8313726, 0, 1, 1,
0.8554977, 0.42665, 0.6939894, 0.8352941, 0, 1, 1,
0.8572725, -0.004745563, 2.374552, 0.8431373, 0, 1, 1,
0.8596821, 0.9256051, 0.3754166, 0.8470588, 0, 1, 1,
0.867595, -0.447627, -0.3251843, 0.854902, 0, 1, 1,
0.8756722, -0.7309843, 3.071569, 0.8588235, 0, 1, 1,
0.8772087, 0.2275517, 2.996306, 0.8666667, 0, 1, 1,
0.8808451, -0.03093105, 3.020915, 0.8705882, 0, 1, 1,
0.8828405, -0.9306905, 3.125647, 0.8784314, 0, 1, 1,
0.8871749, -1.034828, 2.939074, 0.8823529, 0, 1, 1,
0.8878301, -1.369999, 0.8277916, 0.8901961, 0, 1, 1,
0.895726, 0.9334331, 1.057518, 0.8941177, 0, 1, 1,
0.8981374, -0.3032064, 1.005792, 0.9019608, 0, 1, 1,
0.8994335, 0.3090515, 1.947839, 0.9098039, 0, 1, 1,
0.901494, 0.07675558, 1.833715, 0.9137255, 0, 1, 1,
0.9162593, 1.823065, -0.5507764, 0.9215686, 0, 1, 1,
0.9197183, 0.01622199, 2.935293, 0.9254902, 0, 1, 1,
0.9218805, 0.9132753, 0.8410448, 0.9333333, 0, 1, 1,
0.9254012, 0.3636795, 0.06819329, 0.9372549, 0, 1, 1,
0.9276307, 0.628935, 2.036659, 0.945098, 0, 1, 1,
0.9327232, -0.6485922, 2.909013, 0.9490196, 0, 1, 1,
0.9342055, -1.486242, 1.660834, 0.9568627, 0, 1, 1,
0.9423404, 0.4003546, 3.188894, 0.9607843, 0, 1, 1,
0.9472004, 0.05744647, 1.311953, 0.9686275, 0, 1, 1,
0.9525397, 0.6053502, 1.565987, 0.972549, 0, 1, 1,
0.9559956, 0.1070269, 1.130657, 0.9803922, 0, 1, 1,
0.9588592, -0.6688348, 3.053789, 0.9843137, 0, 1, 1,
0.9602341, 0.0178279, 2.6795, 0.9921569, 0, 1, 1,
0.9625113, 0.08432203, 1.265356, 0.9960784, 0, 1, 1,
0.9656326, 0.3731453, 0.8747395, 1, 0, 0.9960784, 1,
0.96689, 0.2855064, 1.51571, 1, 0, 0.9882353, 1,
0.9725525, 0.8285637, -1.193834, 1, 0, 0.9843137, 1,
0.9737244, 1.035751, 2.617876, 1, 0, 0.9764706, 1,
0.9772659, 0.9277004, 1.332166, 1, 0, 0.972549, 1,
0.9786707, 0.247371, 2.500538, 1, 0, 0.9647059, 1,
0.9820585, -0.710925, 1.231899, 1, 0, 0.9607843, 1,
0.9905772, -0.4536109, 1.102871, 1, 0, 0.9529412, 1,
0.9941511, -1.118773, 2.965239, 1, 0, 0.9490196, 1,
0.9953059, -0.9030226, 0.823804, 1, 0, 0.9411765, 1,
0.9979146, -1.685999, 3.30346, 1, 0, 0.9372549, 1,
0.9986358, 0.8569775, 1.009931, 1, 0, 0.9294118, 1,
1.003036, 0.6335984, 1.001298, 1, 0, 0.9254902, 1,
1.003072, -1.433914, 1.498289, 1, 0, 0.9176471, 1,
1.0161, 1.165487, 0.4334055, 1, 0, 0.9137255, 1,
1.016456, 0.1743414, 2.612532, 1, 0, 0.9058824, 1,
1.016559, 0.6134271, 0.2634445, 1, 0, 0.9019608, 1,
1.018716, 0.8028877, 0.5455193, 1, 0, 0.8941177, 1,
1.019184, 0.4455562, 2.211485, 1, 0, 0.8862745, 1,
1.027623, 0.02045963, 1.238102, 1, 0, 0.8823529, 1,
1.030163, 1.691916, 0.09755246, 1, 0, 0.8745098, 1,
1.032634, 1.741055, 0.5800965, 1, 0, 0.8705882, 1,
1.038543, -1.178153, 1.759055, 1, 0, 0.8627451, 1,
1.040558, 1.223213, 0.2566445, 1, 0, 0.8588235, 1,
1.043383, -0.72715, 1.68254, 1, 0, 0.8509804, 1,
1.04368, 1.468865, 0.4766902, 1, 0, 0.8470588, 1,
1.047008, 0.8588459, 1.172057, 1, 0, 0.8392157, 1,
1.052417, 0.2842296, 1.755817, 1, 0, 0.8352941, 1,
1.052518, 2.004168, 0.5258632, 1, 0, 0.827451, 1,
1.059067, -1.096436, 3.234817, 1, 0, 0.8235294, 1,
1.060401, -0.7224122, 2.557314, 1, 0, 0.8156863, 1,
1.062916, 0.3187041, 1.185029, 1, 0, 0.8117647, 1,
1.066001, 0.7547643, 0.03812954, 1, 0, 0.8039216, 1,
1.069275, -0.363012, 0.7818776, 1, 0, 0.7960784, 1,
1.079382, -0.6193169, 2.559453, 1, 0, 0.7921569, 1,
1.081434, 0.1072563, 2.27614, 1, 0, 0.7843137, 1,
1.087915, 1.261707, 0.5123218, 1, 0, 0.7803922, 1,
1.088867, -1.616455, 2.955739, 1, 0, 0.772549, 1,
1.092685, 0.8457628, 1.817981, 1, 0, 0.7686275, 1,
1.100859, -1.152571, 1.804176, 1, 0, 0.7607843, 1,
1.104266, -0.5902509, 3.515605, 1, 0, 0.7568628, 1,
1.107502, -0.7042972, 4.380348, 1, 0, 0.7490196, 1,
1.107833, -0.5607314, 1.06162, 1, 0, 0.7450981, 1,
1.109029, 0.147222, 2.368443, 1, 0, 0.7372549, 1,
1.113566, 0.3923285, 0.6031537, 1, 0, 0.7333333, 1,
1.114547, -0.1575065, 1.448647, 1, 0, 0.7254902, 1,
1.11749, -0.9410363, 2.059854, 1, 0, 0.7215686, 1,
1.118674, -0.8480871, 1.44396, 1, 0, 0.7137255, 1,
1.121682, 2.07252, 0.02022913, 1, 0, 0.7098039, 1,
1.122823, 0.7379565, 2.27892, 1, 0, 0.7019608, 1,
1.123644, -0.09573112, 2.562827, 1, 0, 0.6941177, 1,
1.127005, -1.422577, 2.352545, 1, 0, 0.6901961, 1,
1.130909, 0.5668697, 0.8926029, 1, 0, 0.682353, 1,
1.135474, -0.05432178, -0.3229244, 1, 0, 0.6784314, 1,
1.137961, 1.135462, 2.479335, 1, 0, 0.6705883, 1,
1.144876, -0.5549369, 2.075286, 1, 0, 0.6666667, 1,
1.145684, 1.773072, -0.8349073, 1, 0, 0.6588235, 1,
1.146521, -1.253795, 3.31322, 1, 0, 0.654902, 1,
1.147251, 0.4969019, 2.601376, 1, 0, 0.6470588, 1,
1.159687, -1.291883, 3.731701, 1, 0, 0.6431373, 1,
1.17554, 0.9265366, 0.5048323, 1, 0, 0.6352941, 1,
1.179132, 0.450072, 0.843815, 1, 0, 0.6313726, 1,
1.184681, 0.4919511, 2.020923, 1, 0, 0.6235294, 1,
1.189865, -0.02769461, 1.155654, 1, 0, 0.6196079, 1,
1.197101, -0.2686229, 2.185463, 1, 0, 0.6117647, 1,
1.198054, -0.8314461, 4.419078, 1, 0, 0.6078432, 1,
1.200217, -0.4086799, 0.7331858, 1, 0, 0.6, 1,
1.21308, -2.382185, 2.575395, 1, 0, 0.5921569, 1,
1.213352, -0.07918006, 2.026417, 1, 0, 0.5882353, 1,
1.214526, 1.367165, 1.085844, 1, 0, 0.5803922, 1,
1.228772, 2.859316, -0.225752, 1, 0, 0.5764706, 1,
1.239096, 0.3590541, 0.3453451, 1, 0, 0.5686275, 1,
1.240395, 1.121555, 1.344506, 1, 0, 0.5647059, 1,
1.242554, -1.077689, 1.181561, 1, 0, 0.5568628, 1,
1.242686, -1.651415, 2.030948, 1, 0, 0.5529412, 1,
1.248832, -1.168397, 2.664491, 1, 0, 0.5450981, 1,
1.248936, -0.1051836, 2.310972, 1, 0, 0.5411765, 1,
1.249541, 0.9697701, 1.202861, 1, 0, 0.5333334, 1,
1.251237, -1.078335, 2.996993, 1, 0, 0.5294118, 1,
1.253136, -1.269769, 3.196922, 1, 0, 0.5215687, 1,
1.258191, 0.001562513, 2.132822, 1, 0, 0.5176471, 1,
1.258229, -1.104739, 3.385979, 1, 0, 0.509804, 1,
1.259027, 0.2642713, 0.4252936, 1, 0, 0.5058824, 1,
1.282133, -0.09798561, 2.180113, 1, 0, 0.4980392, 1,
1.294246, -1.452646, 3.320423, 1, 0, 0.4901961, 1,
1.298927, 1.184293, 1.333174, 1, 0, 0.4862745, 1,
1.308809, -0.590132, 0.9405468, 1, 0, 0.4784314, 1,
1.312776, 1.005297, 0.9070652, 1, 0, 0.4745098, 1,
1.314277, 3.350121, 0.0721781, 1, 0, 0.4666667, 1,
1.317801, 1.769645, 0.6726462, 1, 0, 0.4627451, 1,
1.322474, 1.782774, -0.5299478, 1, 0, 0.454902, 1,
1.338855, 0.932795, 0.2442746, 1, 0, 0.4509804, 1,
1.343452, 1.233251, 0.3592645, 1, 0, 0.4431373, 1,
1.343966, -0.1309507, 1.54779, 1, 0, 0.4392157, 1,
1.345025, 0.5833791, 0.6038632, 1, 0, 0.4313726, 1,
1.364711, -0.1310342, 2.479095, 1, 0, 0.427451, 1,
1.367625, -2.414944, 3.368979, 1, 0, 0.4196078, 1,
1.384959, 1.34604, 0.8018299, 1, 0, 0.4156863, 1,
1.388942, 1.342398, -0.263423, 1, 0, 0.4078431, 1,
1.392304, 1.599539, 0.8421773, 1, 0, 0.4039216, 1,
1.394597, -0.5099055, 1.408456, 1, 0, 0.3960784, 1,
1.402702, -1.229863, 2.344517, 1, 0, 0.3882353, 1,
1.403473, -0.3063875, 1.368076, 1, 0, 0.3843137, 1,
1.427733, -0.4684059, 1.218558, 1, 0, 0.3764706, 1,
1.431296, -1.656651, 4.343875, 1, 0, 0.372549, 1,
1.437715, 0.4510856, 2.200758, 1, 0, 0.3647059, 1,
1.44246, -1.347004, 2.932643, 1, 0, 0.3607843, 1,
1.454023, 2.020628, -1.232568, 1, 0, 0.3529412, 1,
1.459422, 0.3475717, 1.407043, 1, 0, 0.3490196, 1,
1.459885, -1.290349, 3.094433, 1, 0, 0.3411765, 1,
1.463749, 0.7116725, 1.588637, 1, 0, 0.3372549, 1,
1.46404, -1.056932, 1.297253, 1, 0, 0.3294118, 1,
1.469982, -0.7163856, 1.358606, 1, 0, 0.3254902, 1,
1.479917, -0.2967964, 2.548902, 1, 0, 0.3176471, 1,
1.485835, -0.6406959, 2.813176, 1, 0, 0.3137255, 1,
1.526868, -0.02497004, 2.583467, 1, 0, 0.3058824, 1,
1.531061, 0.2828359, 0.03081046, 1, 0, 0.2980392, 1,
1.545516, -1.178861, 2.088692, 1, 0, 0.2941177, 1,
1.546761, 0.1493442, 1.788155, 1, 0, 0.2862745, 1,
1.583052, 0.04985072, 1.021002, 1, 0, 0.282353, 1,
1.592508, 0.7205484, 0.9896159, 1, 0, 0.2745098, 1,
1.592781, -0.7542292, 1.036065, 1, 0, 0.2705882, 1,
1.609929, 0.6594373, 2.608422, 1, 0, 0.2627451, 1,
1.643154, 1.342264, 0.03716001, 1, 0, 0.2588235, 1,
1.664163, -0.1007964, 2.199123, 1, 0, 0.2509804, 1,
1.678707, 1.38242, 0.8544151, 1, 0, 0.2470588, 1,
1.698942, 0.5721408, 3.21283, 1, 0, 0.2392157, 1,
1.701002, -1.629622, 2.046036, 1, 0, 0.2352941, 1,
1.709434, -0.9987715, 1.73473, 1, 0, 0.227451, 1,
1.712533, -1.061027, 2.225308, 1, 0, 0.2235294, 1,
1.732127, -0.418464, 3.492045, 1, 0, 0.2156863, 1,
1.735944, 0.8868932, 1.057211, 1, 0, 0.2117647, 1,
1.746085, 1.064415, -0.2890604, 1, 0, 0.2039216, 1,
1.756631, 0.06654483, 1.119283, 1, 0, 0.1960784, 1,
1.76474, -0.5458537, 1.424092, 1, 0, 0.1921569, 1,
1.778398, -0.2539708, 0.6163813, 1, 0, 0.1843137, 1,
1.780837, 1.10329, 1.578781, 1, 0, 0.1803922, 1,
1.788154, -0.6001971, 2.532576, 1, 0, 0.172549, 1,
1.800634, -0.9107585, 0.46548, 1, 0, 0.1686275, 1,
1.834833, -1.691204, 4.726162, 1, 0, 0.1607843, 1,
1.841781, 0.2852652, 1.229658, 1, 0, 0.1568628, 1,
1.844175, -0.5279371, 0.8710219, 1, 0, 0.1490196, 1,
1.851491, -1.086733, 1.28974, 1, 0, 0.145098, 1,
1.859759, 1.505023, 1.166736, 1, 0, 0.1372549, 1,
1.861031, 0.6094875, 1.451085, 1, 0, 0.1333333, 1,
1.88597, 0.7947102, 1.56634, 1, 0, 0.1254902, 1,
1.896689, 0.2868424, -0.4153617, 1, 0, 0.1215686, 1,
1.928034, 1.450372, 0.5928936, 1, 0, 0.1137255, 1,
1.934399, 0.3391741, 2.392753, 1, 0, 0.1098039, 1,
1.951207, -0.8070658, 2.182103, 1, 0, 0.1019608, 1,
1.95824, 1.321983, 0.3850341, 1, 0, 0.09411765, 1,
1.959688, 0.989099, 0.5295992, 1, 0, 0.09019608, 1,
2.038119, -0.633855, 1.381437, 1, 0, 0.08235294, 1,
2.066199, -1.001679, 1.022002, 1, 0, 0.07843138, 1,
2.086991, -0.8138921, 2.899395, 1, 0, 0.07058824, 1,
2.18469, -0.9303131, 1.797265, 1, 0, 0.06666667, 1,
2.187836, 0.1722313, 3.339368, 1, 0, 0.05882353, 1,
2.200045, -0.7739062, -0.6078462, 1, 0, 0.05490196, 1,
2.233866, -0.805021, 0.6838495, 1, 0, 0.04705882, 1,
2.257698, 1.55497, 1.034945, 1, 0, 0.04313726, 1,
2.261683, -0.1138278, 2.800017, 1, 0, 0.03529412, 1,
2.328377, 0.4911307, -0.4818087, 1, 0, 0.03137255, 1,
2.73481, 0.09913667, 2.502728, 1, 0, 0.02352941, 1,
2.947971, -0.1523651, 2.466057, 1, 0, 0.01960784, 1,
3.308262, -1.031508, 1.293841, 1, 0, 0.01176471, 1,
3.309941, 1.628605, 1.616799, 1, 0, 0.007843138, 1
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
0.24343, -4.631701, -7.14966, 0, -0.5, 0.5, 0.5,
0.24343, -4.631701, -7.14966, 1, -0.5, 0.5, 0.5,
0.24343, -4.631701, -7.14966, 1, 1.5, 0.5, 0.5,
0.24343, -4.631701, -7.14966, 0, 1.5, 0.5, 0.5
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
-3.862628, 0.440101, -7.14966, 0, -0.5, 0.5, 0.5,
-3.862628, 0.440101, -7.14966, 1, -0.5, 0.5, 0.5,
-3.862628, 0.440101, -7.14966, 1, 1.5, 0.5, 0.5,
-3.862628, 0.440101, -7.14966, 0, 1.5, 0.5, 0.5
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
-3.862628, -4.631701, -0.2899315, 0, -0.5, 0.5, 0.5,
-3.862628, -4.631701, -0.2899315, 1, -0.5, 0.5, 0.5,
-3.862628, -4.631701, -0.2899315, 1, 1.5, 0.5, 0.5,
-3.862628, -4.631701, -0.2899315, 0, 1.5, 0.5, 0.5
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
-2, -3.461285, -5.566646,
3, -3.461285, -5.566646,
-2, -3.461285, -5.566646,
-2, -3.656355, -5.830482,
-1, -3.461285, -5.566646,
-1, -3.656355, -5.830482,
0, -3.461285, -5.566646,
0, -3.656355, -5.830482,
1, -3.461285, -5.566646,
1, -3.656355, -5.830482,
2, -3.461285, -5.566646,
2, -3.656355, -5.830482,
3, -3.461285, -5.566646,
3, -3.656355, -5.830482
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
-2, -4.046493, -6.358153, 0, -0.5, 0.5, 0.5,
-2, -4.046493, -6.358153, 1, -0.5, 0.5, 0.5,
-2, -4.046493, -6.358153, 1, 1.5, 0.5, 0.5,
-2, -4.046493, -6.358153, 0, 1.5, 0.5, 0.5,
-1, -4.046493, -6.358153, 0, -0.5, 0.5, 0.5,
-1, -4.046493, -6.358153, 1, -0.5, 0.5, 0.5,
-1, -4.046493, -6.358153, 1, 1.5, 0.5, 0.5,
-1, -4.046493, -6.358153, 0, 1.5, 0.5, 0.5,
0, -4.046493, -6.358153, 0, -0.5, 0.5, 0.5,
0, -4.046493, -6.358153, 1, -0.5, 0.5, 0.5,
0, -4.046493, -6.358153, 1, 1.5, 0.5, 0.5,
0, -4.046493, -6.358153, 0, 1.5, 0.5, 0.5,
1, -4.046493, -6.358153, 0, -0.5, 0.5, 0.5,
1, -4.046493, -6.358153, 1, -0.5, 0.5, 0.5,
1, -4.046493, -6.358153, 1, 1.5, 0.5, 0.5,
1, -4.046493, -6.358153, 0, 1.5, 0.5, 0.5,
2, -4.046493, -6.358153, 0, -0.5, 0.5, 0.5,
2, -4.046493, -6.358153, 1, -0.5, 0.5, 0.5,
2, -4.046493, -6.358153, 1, 1.5, 0.5, 0.5,
2, -4.046493, -6.358153, 0, 1.5, 0.5, 0.5,
3, -4.046493, -6.358153, 0, -0.5, 0.5, 0.5,
3, -4.046493, -6.358153, 1, -0.5, 0.5, 0.5,
3, -4.046493, -6.358153, 1, 1.5, 0.5, 0.5,
3, -4.046493, -6.358153, 0, 1.5, 0.5, 0.5
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
-2.915076, -2, -5.566646,
-2.915076, 4, -5.566646,
-2.915076, -2, -5.566646,
-3.073002, -2, -5.830482,
-2.915076, 0, -5.566646,
-3.073002, 0, -5.830482,
-2.915076, 2, -5.566646,
-3.073002, 2, -5.830482,
-2.915076, 4, -5.566646,
-3.073002, 4, -5.830482
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
"2",
"4"
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
-3.388852, -2, -6.358153, 0, -0.5, 0.5, 0.5,
-3.388852, -2, -6.358153, 1, -0.5, 0.5, 0.5,
-3.388852, -2, -6.358153, 1, 1.5, 0.5, 0.5,
-3.388852, -2, -6.358153, 0, 1.5, 0.5, 0.5,
-3.388852, 0, -6.358153, 0, -0.5, 0.5, 0.5,
-3.388852, 0, -6.358153, 1, -0.5, 0.5, 0.5,
-3.388852, 0, -6.358153, 1, 1.5, 0.5, 0.5,
-3.388852, 0, -6.358153, 0, 1.5, 0.5, 0.5,
-3.388852, 2, -6.358153, 0, -0.5, 0.5, 0.5,
-3.388852, 2, -6.358153, 1, -0.5, 0.5, 0.5,
-3.388852, 2, -6.358153, 1, 1.5, 0.5, 0.5,
-3.388852, 2, -6.358153, 0, 1.5, 0.5, 0.5,
-3.388852, 4, -6.358153, 0, -0.5, 0.5, 0.5,
-3.388852, 4, -6.358153, 1, -0.5, 0.5, 0.5,
-3.388852, 4, -6.358153, 1, 1.5, 0.5, 0.5,
-3.388852, 4, -6.358153, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-2.915076, -3.461285, -4,
-2.915076, -3.461285, 4,
-2.915076, -3.461285, -4,
-3.073002, -3.656355, -4,
-2.915076, -3.461285, -2,
-3.073002, -3.656355, -2,
-2.915076, -3.461285, 0,
-3.073002, -3.656355, 0,
-2.915076, -3.461285, 2,
-3.073002, -3.656355, 2,
-2.915076, -3.461285, 4,
-3.073002, -3.656355, 4
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
-3.388852, -4.046493, -4, 0, -0.5, 0.5, 0.5,
-3.388852, -4.046493, -4, 1, -0.5, 0.5, 0.5,
-3.388852, -4.046493, -4, 1, 1.5, 0.5, 0.5,
-3.388852, -4.046493, -4, 0, 1.5, 0.5, 0.5,
-3.388852, -4.046493, -2, 0, -0.5, 0.5, 0.5,
-3.388852, -4.046493, -2, 1, -0.5, 0.5, 0.5,
-3.388852, -4.046493, -2, 1, 1.5, 0.5, 0.5,
-3.388852, -4.046493, -2, 0, 1.5, 0.5, 0.5,
-3.388852, -4.046493, 0, 0, -0.5, 0.5, 0.5,
-3.388852, -4.046493, 0, 1, -0.5, 0.5, 0.5,
-3.388852, -4.046493, 0, 1, 1.5, 0.5, 0.5,
-3.388852, -4.046493, 0, 0, 1.5, 0.5, 0.5,
-3.388852, -4.046493, 2, 0, -0.5, 0.5, 0.5,
-3.388852, -4.046493, 2, 1, -0.5, 0.5, 0.5,
-3.388852, -4.046493, 2, 1, 1.5, 0.5, 0.5,
-3.388852, -4.046493, 2, 0, 1.5, 0.5, 0.5,
-3.388852, -4.046493, 4, 0, -0.5, 0.5, 0.5,
-3.388852, -4.046493, 4, 1, -0.5, 0.5, 0.5,
-3.388852, -4.046493, 4, 1, 1.5, 0.5, 0.5,
-3.388852, -4.046493, 4, 0, 1.5, 0.5, 0.5
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
-2.915076, -3.461285, -5.566646,
-2.915076, 4.341487, -5.566646,
-2.915076, -3.461285, 4.986783,
-2.915076, 4.341487, 4.986783,
-2.915076, -3.461285, -5.566646,
-2.915076, -3.461285, 4.986783,
-2.915076, 4.341487, -5.566646,
-2.915076, 4.341487, 4.986783,
-2.915076, -3.461285, -5.566646,
3.401936, -3.461285, -5.566646,
-2.915076, -3.461285, 4.986783,
3.401936, -3.461285, 4.986783,
-2.915076, 4.341487, -5.566646,
3.401936, 4.341487, -5.566646,
-2.915076, 4.341487, 4.986783,
3.401936, 4.341487, 4.986783,
3.401936, -3.461285, -5.566646,
3.401936, 4.341487, -5.566646,
3.401936, -3.461285, 4.986783,
3.401936, 4.341487, 4.986783,
3.401936, -3.461285, -5.566646,
3.401936, -3.461285, 4.986783,
3.401936, 4.341487, -5.566646,
3.401936, 4.341487, 4.986783
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
var radius = 7.777859;
var distance = 34.60457;
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
mvMatrix.translate( -0.24343, -0.440101, 0.2899315 );
mvMatrix.scale( 1.331258, 1.077767, 0.7968569 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.60457);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
thiourea<-read.table("thiourea.xyz")
```

```
## Error in read.table("thiourea.xyz"): no lines available in input
```

```r
x<-thiourea$V2
```

```
## Error in eval(expr, envir, enclos): object 'thiourea' not found
```

```r
y<-thiourea$V3
```

```
## Error in eval(expr, envir, enclos): object 'thiourea' not found
```

```r
z<-thiourea$V4
```

```
## Error in eval(expr, envir, enclos): object 'thiourea' not found
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
-2.823081, 0.2522604, -0.6922287, 0, 0, 1, 1, 1,
-2.688181, 0.3358633, -2.017733, 1, 0, 0, 1, 1,
-2.644386, 0.4056719, -1.204379, 1, 0, 0, 1, 1,
-2.600252, 1.116456, -1.755757, 1, 0, 0, 1, 1,
-2.591335, -0.2377331, -3.145032, 1, 0, 0, 1, 1,
-2.59009, 1.326947, -2.373603, 1, 0, 0, 1, 1,
-2.585816, -0.326825, -1.309907, 0, 0, 0, 1, 1,
-2.535435, -1.412126, -1.937521, 0, 0, 0, 1, 1,
-2.455802, 0.1649194, -0.0265055, 0, 0, 0, 1, 1,
-2.426158, 1.100567, -3.573123, 0, 0, 0, 1, 1,
-2.421733, 0.1283005, -0.05753075, 0, 0, 0, 1, 1,
-2.39776, 0.08552384, -2.954926, 0, 0, 0, 1, 1,
-2.357721, 0.1132497, -1.784576, 0, 0, 0, 1, 1,
-2.339048, -0.3482288, 1.257028, 1, 1, 1, 1, 1,
-2.29896, 1.033816, 0.1981307, 1, 1, 1, 1, 1,
-2.298035, 0.2680593, -2.025599, 1, 1, 1, 1, 1,
-2.241399, -0.2763843, -2.324456, 1, 1, 1, 1, 1,
-2.173017, -0.8120878, -1.226865, 1, 1, 1, 1, 1,
-2.165228, 0.4618659, -0.4128658, 1, 1, 1, 1, 1,
-2.139116, 1.522031, 0.0833736, 1, 1, 1, 1, 1,
-2.109705, 0.004620608, -1.252355, 1, 1, 1, 1, 1,
-2.089653, 0.03215108, 0.2766277, 1, 1, 1, 1, 1,
-2.089416, 0.1783064, -0.6467894, 1, 1, 1, 1, 1,
-1.99047, -0.04345524, -1.651637, 1, 1, 1, 1, 1,
-1.985622, 1.117673, -1.530541, 1, 1, 1, 1, 1,
-1.965314, 1.047499, -1.860692, 1, 1, 1, 1, 1,
-1.914986, 0.8019232, -1.31454, 1, 1, 1, 1, 1,
-1.901019, -0.4989622, -1.293434, 1, 1, 1, 1, 1,
-1.898387, 0.4360017, -1.631175, 0, 0, 1, 1, 1,
-1.87947, -0.4098978, -0.5898781, 1, 0, 0, 1, 1,
-1.867843, 0.8775817, 1.218776, 1, 0, 0, 1, 1,
-1.865408, -0.3078026, -1.910023, 1, 0, 0, 1, 1,
-1.863386, 0.8006265, -2.130728, 1, 0, 0, 1, 1,
-1.858337, 0.5753567, -2.93549, 1, 0, 0, 1, 1,
-1.846478, -0.5753773, -2.006162, 0, 0, 0, 1, 1,
-1.827404, -0.4788924, -0.9889258, 0, 0, 0, 1, 1,
-1.825422, 0.2676005, -0.284126, 0, 0, 0, 1, 1,
-1.810653, 0.467137, -1.405082, 0, 0, 0, 1, 1,
-1.806272, 0.851757, -0.9828951, 0, 0, 0, 1, 1,
-1.788221, -1.146647, -0.7712292, 0, 0, 0, 1, 1,
-1.778231, -0.3595554, -0.4946446, 0, 0, 0, 1, 1,
-1.767142, 0.2471664, -1.170084, 1, 1, 1, 1, 1,
-1.765747, 0.2501628, -2.671371, 1, 1, 1, 1, 1,
-1.753906, -0.7279636, -3.012393, 1, 1, 1, 1, 1,
-1.746578, 1.035748, -0.6455536, 1, 1, 1, 1, 1,
-1.74002, 1.696482, -0.5558236, 1, 1, 1, 1, 1,
-1.710232, 0.5627536, -0.4456157, 1, 1, 1, 1, 1,
-1.704679, -0.6005905, -1.282579, 1, 1, 1, 1, 1,
-1.686106, -1.299496, 0.305705, 1, 1, 1, 1, 1,
-1.677358, -1.517722, -2.826981, 1, 1, 1, 1, 1,
-1.664858, -0.02141257, -2.043497, 1, 1, 1, 1, 1,
-1.653939, 1.380066, -1.043741, 1, 1, 1, 1, 1,
-1.647345, -0.6267394, -0.5112575, 1, 1, 1, 1, 1,
-1.63378, -0.3690543, -1.173415, 1, 1, 1, 1, 1,
-1.609663, 1.747091, -0.9456196, 1, 1, 1, 1, 1,
-1.601921, -1.196733, -2.336142, 1, 1, 1, 1, 1,
-1.577717, 0.6566572, -1.45683, 0, 0, 1, 1, 1,
-1.564727, -0.5587973, -1.538028, 1, 0, 0, 1, 1,
-1.537248, -1.158957, -2.779047, 1, 0, 0, 1, 1,
-1.532684, -1.97557, -4.089821, 1, 0, 0, 1, 1,
-1.531416, -0.04800284, -2.130762, 1, 0, 0, 1, 1,
-1.523314, -0.2549633, -3.671448, 1, 0, 0, 1, 1,
-1.517914, 0.6999285, -1.614869, 0, 0, 0, 1, 1,
-1.513964, -2.23473, -2.093175, 0, 0, 0, 1, 1,
-1.512365, -0.6177962, -1.339157, 0, 0, 0, 1, 1,
-1.507677, -0.2091935, -0.1363061, 0, 0, 0, 1, 1,
-1.500849, 0.680976, -0.9286219, 0, 0, 0, 1, 1,
-1.489794, 1.769982, -1.559529, 0, 0, 0, 1, 1,
-1.488969, -0.3792577, -2.564558, 0, 0, 0, 1, 1,
-1.466182, 0.1996942, -3.216592, 1, 1, 1, 1, 1,
-1.456773, -2.325045, -3.219096, 1, 1, 1, 1, 1,
-1.45221, -0.6029826, -1.621427, 1, 1, 1, 1, 1,
-1.43734, 0.285051, -1.786598, 1, 1, 1, 1, 1,
-1.424145, 2.030237, -2.053185, 1, 1, 1, 1, 1,
-1.421981, 1.51562, -1.692165, 1, 1, 1, 1, 1,
-1.414512, -0.1140204, -0.2824406, 1, 1, 1, 1, 1,
-1.392067, 1.232751, -1.776285, 1, 1, 1, 1, 1,
-1.389575, 0.616493, -0.4397281, 1, 1, 1, 1, 1,
-1.387536, 0.7600109, -1.027544, 1, 1, 1, 1, 1,
-1.379775, -0.2387406, 0.2602448, 1, 1, 1, 1, 1,
-1.379436, 0.7648509, -0.3601711, 1, 1, 1, 1, 1,
-1.372773, 0.6587026, -1.249372, 1, 1, 1, 1, 1,
-1.367311, 0.05366738, -0.4542544, 1, 1, 1, 1, 1,
-1.365981, 0.9206784, -0.9351704, 1, 1, 1, 1, 1,
-1.363479, 0.1565921, -2.652856, 0, 0, 1, 1, 1,
-1.361755, -1.315986, -0.8041279, 1, 0, 0, 1, 1,
-1.354949, 0.5896228, -2.888612, 1, 0, 0, 1, 1,
-1.348088, 0.6742887, -1.008449, 1, 0, 0, 1, 1,
-1.340977, -0.0008057415, -1.632633, 1, 0, 0, 1, 1,
-1.328734, -0.7261283, -1.899692, 1, 0, 0, 1, 1,
-1.327649, 0.07570345, -1.577486, 0, 0, 0, 1, 1,
-1.321989, -0.5065694, 0.08672985, 0, 0, 0, 1, 1,
-1.321815, 0.5757022, -0.3393779, 0, 0, 0, 1, 1,
-1.320315, -1.043737, -3.51926, 0, 0, 0, 1, 1,
-1.31873, -0.9466223, -1.878063, 0, 0, 0, 1, 1,
-1.314572, -0.4774628, -2.323768, 0, 0, 0, 1, 1,
-1.314215, 1.371893, -0.08901378, 0, 0, 0, 1, 1,
-1.31257, -0.05192894, -2.750937, 1, 1, 1, 1, 1,
-1.300912, -0.08530609, -1.343863, 1, 1, 1, 1, 1,
-1.290912, -3.32481, -2.556649, 1, 1, 1, 1, 1,
-1.285886, 0.70626, 0.4514455, 1, 1, 1, 1, 1,
-1.285109, 0.3296639, 0.4206212, 1, 1, 1, 1, 1,
-1.283136, 0.6432371, -0.7773284, 1, 1, 1, 1, 1,
-1.279699, -1.915231, -2.949931, 1, 1, 1, 1, 1,
-1.278301, -1.378632, -2.756662, 1, 1, 1, 1, 1,
-1.267643, -1.159112, -2.063561, 1, 1, 1, 1, 1,
-1.255479, 0.9560735, 0.7968283, 1, 1, 1, 1, 1,
-1.253971, -0.6409966, -2.445145, 1, 1, 1, 1, 1,
-1.249214, 0.3424415, -1.965242, 1, 1, 1, 1, 1,
-1.244573, -0.3253799, -1.023854, 1, 1, 1, 1, 1,
-1.244482, -0.9504388, -1.649103, 1, 1, 1, 1, 1,
-1.241017, -0.04669122, -1.748566, 1, 1, 1, 1, 1,
-1.23344, 0.5981068, -0.7298557, 0, 0, 1, 1, 1,
-1.230123, 0.2675884, -2.987391, 1, 0, 0, 1, 1,
-1.214582, 0.4276572, -0.9292592, 1, 0, 0, 1, 1,
-1.212033, 0.9663334, -1.234693, 1, 0, 0, 1, 1,
-1.209915, 0.02785993, -2.991919, 1, 0, 0, 1, 1,
-1.203788, 1.659744, -2.220532, 1, 0, 0, 1, 1,
-1.19241, 4.227855, -0.7829039, 0, 0, 0, 1, 1,
-1.191116, -0.6258433, -0.92055, 0, 0, 0, 1, 1,
-1.183449, 0.3251399, -2.619434, 0, 0, 0, 1, 1,
-1.183358, -0.2270315, -3.456219, 0, 0, 0, 1, 1,
-1.18328, 0.101593, -1.042652, 0, 0, 0, 1, 1,
-1.183176, -1.949744, -3.074008, 0, 0, 0, 1, 1,
-1.182674, -0.4254001, -4.715916, 0, 0, 0, 1, 1,
-1.16525, 1.085915, -0.1534525, 1, 1, 1, 1, 1,
-1.159004, 0.681859, -1.682287, 1, 1, 1, 1, 1,
-1.158719, -1.608872, -1.04888, 1, 1, 1, 1, 1,
-1.157194, -0.4571403, -0.2275916, 1, 1, 1, 1, 1,
-1.153718, -0.5657032, -1.665775, 1, 1, 1, 1, 1,
-1.135839, -0.5811107, -0.9398586, 1, 1, 1, 1, 1,
-1.120251, 0.1826642, -1.776661, 1, 1, 1, 1, 1,
-1.117802, -0.4816557, -1.391113, 1, 1, 1, 1, 1,
-1.116889, -2.615398, -3.44158, 1, 1, 1, 1, 1,
-1.1134, -0.2120787, -2.096363, 1, 1, 1, 1, 1,
-1.103906, -0.311834, -2.063322, 1, 1, 1, 1, 1,
-1.103835, 0.004371735, -2.345927, 1, 1, 1, 1, 1,
-1.100281, -0.2869516, -3.470955, 1, 1, 1, 1, 1,
-1.098345, 1.363213, 0.5542926, 1, 1, 1, 1, 1,
-1.097233, -0.1877631, -4.279275, 1, 1, 1, 1, 1,
-1.084437, 0.8779541, -2.031627, 0, 0, 1, 1, 1,
-1.084269, 0.3561196, -0.7833644, 1, 0, 0, 1, 1,
-1.077751, 1.754757, -0.6456501, 1, 0, 0, 1, 1,
-1.07438, -0.2052055, -0.6444001, 1, 0, 0, 1, 1,
-1.067301, -1.293866, -2.250552, 1, 0, 0, 1, 1,
-1.066028, -0.2424516, -3.421234, 1, 0, 0, 1, 1,
-1.060911, -0.2170705, -2.412896, 0, 0, 0, 1, 1,
-1.048687, 0.9053409, -0.8939244, 0, 0, 0, 1, 1,
-1.048179, -1.965973, -3.12377, 0, 0, 0, 1, 1,
-1.044576, 0.5118728, -1.596395, 0, 0, 0, 1, 1,
-1.034025, -1.018708, -3.247782, 0, 0, 0, 1, 1,
-1.031782, -0.3865688, -2.221069, 0, 0, 0, 1, 1,
-1.030015, 0.3836524, -2.838854, 0, 0, 0, 1, 1,
-1.025722, -0.231721, -3.34569, 1, 1, 1, 1, 1,
-1.024578, 0.7496731, -1.440923, 1, 1, 1, 1, 1,
-1.024382, -0.8373992, -2.110457, 1, 1, 1, 1, 1,
-1.020748, 1.440938, -0.4577953, 1, 1, 1, 1, 1,
-1.010911, -0.4199165, -1.764567, 1, 1, 1, 1, 1,
-1.010672, -0.4189261, -2.73843, 1, 1, 1, 1, 1,
-1.009393, -1.018754, -1.347896, 1, 1, 1, 1, 1,
-1.006429, -0.1984085, -1.420316, 1, 1, 1, 1, 1,
-1.00626, -0.9172987, -1.458309, 1, 1, 1, 1, 1,
-1.003265, -0.3827621, -2.41169, 1, 1, 1, 1, 1,
-1.001272, 0.7827671, -2.029237, 1, 1, 1, 1, 1,
-0.9999991, 0.3828204, 1.012879, 1, 1, 1, 1, 1,
-0.9937776, -0.2782346, -0.4952641, 1, 1, 1, 1, 1,
-0.9919278, -1.454549, -5.206683, 1, 1, 1, 1, 1,
-0.988069, 0.5401501, -0.6466883, 1, 1, 1, 1, 1,
-0.9844455, 0.4923666, -1.822782, 0, 0, 1, 1, 1,
-0.9718868, -0.1728679, -1.676609, 1, 0, 0, 1, 1,
-0.9607776, 0.7666141, -1.405291, 1, 0, 0, 1, 1,
-0.9557965, -0.1147001, -0.04238211, 1, 0, 0, 1, 1,
-0.9400285, 0.5332473, -0.5930504, 1, 0, 0, 1, 1,
-0.9397587, 0.2282234, -2.442369, 1, 0, 0, 1, 1,
-0.9341217, -0.4818021, -1.171432, 0, 0, 0, 1, 1,
-0.9328103, -1.049497, -2.756622, 0, 0, 0, 1, 1,
-0.9206939, -1.701362, -3.766834, 0, 0, 0, 1, 1,
-0.9181154, -0.8098005, -2.659436, 0, 0, 0, 1, 1,
-0.9168862, -1.087168, -3.44921, 0, 0, 0, 1, 1,
-0.9101114, -0.5182627, 0.3345384, 0, 0, 0, 1, 1,
-0.9040683, -0.0448722, -2.440768, 0, 0, 0, 1, 1,
-0.9038773, 1.266616, -1.84886, 1, 1, 1, 1, 1,
-0.9036939, -1.62917, -2.517751, 1, 1, 1, 1, 1,
-0.8995755, -1.346138, -1.388602, 1, 1, 1, 1, 1,
-0.8990316, -0.5471812, -3.180741, 1, 1, 1, 1, 1,
-0.8915404, 1.323234, -0.2570384, 1, 1, 1, 1, 1,
-0.8875775, 0.2764491, -0.4468152, 1, 1, 1, 1, 1,
-0.8754282, 0.3457159, -1.637262, 1, 1, 1, 1, 1,
-0.868784, -0.06818828, -3.137145, 1, 1, 1, 1, 1,
-0.8687192, -0.5334637, -0.3983775, 1, 1, 1, 1, 1,
-0.8665939, -0.4816135, -1.506543, 1, 1, 1, 1, 1,
-0.8622668, 0.1313722, 0.2901156, 1, 1, 1, 1, 1,
-0.8607224, 0.2672771, -0.4269745, 1, 1, 1, 1, 1,
-0.8577507, -0.2692055, -2.66161, 1, 1, 1, 1, 1,
-0.8545713, 0.5874211, -1.747543, 1, 1, 1, 1, 1,
-0.838528, -1.328129, -2.624319, 1, 1, 1, 1, 1,
-0.8347793, -1.26224, -3.643531, 0, 0, 1, 1, 1,
-0.8315899, -0.3127636, 1.110565, 1, 0, 0, 1, 1,
-0.8279046, 0.5468116, -0.910793, 1, 0, 0, 1, 1,
-0.8112947, 0.4724342, -0.5876516, 1, 0, 0, 1, 1,
-0.8108695, -0.5379761, -3.315737, 1, 0, 0, 1, 1,
-0.8062565, -0.2484751, 0.8010836, 1, 0, 0, 1, 1,
-0.8048947, -1.152873, -3.827529, 0, 0, 0, 1, 1,
-0.804745, 1.780192, -0.712604, 0, 0, 0, 1, 1,
-0.7987376, -0.1264836, -2.268115, 0, 0, 0, 1, 1,
-0.7944074, -1.609133, -4.598573, 0, 0, 0, 1, 1,
-0.792025, 1.596987, -0.5445123, 0, 0, 0, 1, 1,
-0.7861086, -1.216974, -3.124904, 0, 0, 0, 1, 1,
-0.7856274, -2.205955, -3.037002, 0, 0, 0, 1, 1,
-0.7814765, -0.03024542, -1.653811, 1, 1, 1, 1, 1,
-0.7765198, -0.2834042, -1.452178, 1, 1, 1, 1, 1,
-0.7760307, -2.400009, -3.807895, 1, 1, 1, 1, 1,
-0.775075, -2.285019, -2.059227, 1, 1, 1, 1, 1,
-0.7743585, 0.1354618, -3.319501, 1, 1, 1, 1, 1,
-0.7725866, 0.753041, -1.529922, 1, 1, 1, 1, 1,
-0.7710595, -0.6706198, -2.553931, 1, 1, 1, 1, 1,
-0.7688634, -0.9309542, -3.510612, 1, 1, 1, 1, 1,
-0.76876, -0.04750991, -1.321273, 1, 1, 1, 1, 1,
-0.7668108, 0.5136796, -0.0982402, 1, 1, 1, 1, 1,
-0.7652584, 1.021842, -2.242474, 1, 1, 1, 1, 1,
-0.761089, 0.3083818, 0.9565933, 1, 1, 1, 1, 1,
-0.7518337, -0.6694141, -2.207695, 1, 1, 1, 1, 1,
-0.7456782, -0.1860793, -1.749365, 1, 1, 1, 1, 1,
-0.7446874, 0.4448278, -2.291986, 1, 1, 1, 1, 1,
-0.7306188, -0.4360651, -0.4392682, 0, 0, 1, 1, 1,
-0.7271538, -1.80983, -3.088067, 1, 0, 0, 1, 1,
-0.7227393, -0.3267018, -2.112209, 1, 0, 0, 1, 1,
-0.7214728, 0.5852244, -1.653029, 1, 0, 0, 1, 1,
-0.7162029, 0.4943046, 0.2887322, 1, 0, 0, 1, 1,
-0.7158954, 1.267897, -1.32883, 1, 0, 0, 1, 1,
-0.7019116, -0.8337525, -2.313948, 0, 0, 0, 1, 1,
-0.7011715, 1.041568, -1.662077, 0, 0, 0, 1, 1,
-0.6985996, -1.002509, -1.745301, 0, 0, 0, 1, 1,
-0.6948204, -0.8019014, -1.949201, 0, 0, 0, 1, 1,
-0.6878371, -0.8790304, -4.250051, 0, 0, 0, 1, 1,
-0.6869426, -1.901581, -2.767667, 0, 0, 0, 1, 1,
-0.6855533, -0.4679653, -2.624605, 0, 0, 0, 1, 1,
-0.6845564, 0.3069048, -1.819177, 1, 1, 1, 1, 1,
-0.6838991, -2.182718, -2.730891, 1, 1, 1, 1, 1,
-0.6807538, 0.9102894, -0.9653755, 1, 1, 1, 1, 1,
-0.6730009, 1.481988, -0.102442, 1, 1, 1, 1, 1,
-0.6728771, -3.347653, -2.003132, 1, 1, 1, 1, 1,
-0.6682884, -1.041652, -1.908727, 1, 1, 1, 1, 1,
-0.6624621, 0.1839875, -0.8415657, 1, 1, 1, 1, 1,
-0.6591682, 0.5303496, 0.1111895, 1, 1, 1, 1, 1,
-0.655008, -0.1020621, -1.051768, 1, 1, 1, 1, 1,
-0.6544428, 0.3741175, -2.590889, 1, 1, 1, 1, 1,
-0.6533068, -0.2713773, -1.188327, 1, 1, 1, 1, 1,
-0.6500515, 0.7353765, -1.382287, 1, 1, 1, 1, 1,
-0.6477572, -1.454507, -1.72104, 1, 1, 1, 1, 1,
-0.6474745, -1.405449, -2.632827, 1, 1, 1, 1, 1,
-0.6468127, 0.3989687, -1.413523, 1, 1, 1, 1, 1,
-0.6465841, 0.7563258, 0.004257313, 0, 0, 1, 1, 1,
-0.6426021, -0.6136654, -0.5089524, 1, 0, 0, 1, 1,
-0.6406407, -0.269987, -4.511904, 1, 0, 0, 1, 1,
-0.6393383, 0.03140729, -2.692973, 1, 0, 0, 1, 1,
-0.6348752, 0.9866663, -1.073576, 1, 0, 0, 1, 1,
-0.6262685, 0.7422248, -0.08951624, 1, 0, 0, 1, 1,
-0.6254456, -1.174291, -2.07098, 0, 0, 0, 1, 1,
-0.6245065, -0.355688, -0.8375243, 0, 0, 0, 1, 1,
-0.6201353, -0.2398325, -1.304148, 0, 0, 0, 1, 1,
-0.6178848, 2.736359, -1.501375, 0, 0, 0, 1, 1,
-0.6160964, -1.374641, -1.654389, 0, 0, 0, 1, 1,
-0.6126126, 0.1553593, -1.414583, 0, 0, 0, 1, 1,
-0.6100366, -0.6339604, -2.064411, 0, 0, 0, 1, 1,
-0.6091029, -1.795765, -4.215207, 1, 1, 1, 1, 1,
-0.6062702, 0.8705995, -0.2446946, 1, 1, 1, 1, 1,
-0.6060841, -1.112171, -2.023328, 1, 1, 1, 1, 1,
-0.6046339, 0.4556585, -1.156965, 1, 1, 1, 1, 1,
-0.5986896, -0.4166993, -3.542369, 1, 1, 1, 1, 1,
-0.5968318, 0.2972111, -0.227513, 1, 1, 1, 1, 1,
-0.5968031, 0.09104183, -0.8451692, 1, 1, 1, 1, 1,
-0.5965551, -1.455881, -3.231371, 1, 1, 1, 1, 1,
-0.59282, -0.003521857, -0.8494384, 1, 1, 1, 1, 1,
-0.5877673, -0.06637596, -1.249927, 1, 1, 1, 1, 1,
-0.5876203, -0.9680959, -1.265093, 1, 1, 1, 1, 1,
-0.5856607, 0.779525, -1.95389, 1, 1, 1, 1, 1,
-0.58491, 0.447491, -2.317387, 1, 1, 1, 1, 1,
-0.5800589, 0.3857377, 0.5192291, 1, 1, 1, 1, 1,
-0.5781089, 0.7936889, -0.8553711, 1, 1, 1, 1, 1,
-0.5745455, 1.79382, -1.14606, 0, 0, 1, 1, 1,
-0.5710847, 0.7450833, -0.5151606, 1, 0, 0, 1, 1,
-0.5665689, 0.3930913, -2.24326, 1, 0, 0, 1, 1,
-0.5521995, -0.9508186, -2.038833, 1, 0, 0, 1, 1,
-0.5521872, 0.2515456, -0.2083168, 1, 0, 0, 1, 1,
-0.54801, 0.6881168, 1.634115, 1, 0, 0, 1, 1,
-0.5466424, -0.06983871, -1.386819, 0, 0, 0, 1, 1,
-0.5458965, 0.3287469, -0.9456548, 0, 0, 0, 1, 1,
-0.5450324, 0.2802941, -2.052801, 0, 0, 0, 1, 1,
-0.5414132, -1.109454, -1.994701, 0, 0, 0, 1, 1,
-0.5413235, 1.047333, -2.342233, 0, 0, 0, 1, 1,
-0.5402849, 0.7834656, -0.2591227, 0, 0, 0, 1, 1,
-0.5300565, 1.557496, -1.781004, 0, 0, 0, 1, 1,
-0.5291008, -0.5134174, -2.440931, 1, 1, 1, 1, 1,
-0.528771, -0.9709496, -1.778921, 1, 1, 1, 1, 1,
-0.5260321, 0.3334939, -0.7247401, 1, 1, 1, 1, 1,
-0.5231497, -0.8384066, -3.051373, 1, 1, 1, 1, 1,
-0.519928, 2.281154, -1.123744, 1, 1, 1, 1, 1,
-0.5175064, -0.5286636, -1.875693, 1, 1, 1, 1, 1,
-0.5117273, -0.814321, -2.174924, 1, 1, 1, 1, 1,
-0.5059271, 0.839205, -0.5619212, 1, 1, 1, 1, 1,
-0.5016064, -0.5159341, -3.402378, 1, 1, 1, 1, 1,
-0.4997472, -0.666045, -0.4565828, 1, 1, 1, 1, 1,
-0.4944046, -0.1238383, -2.178499, 1, 1, 1, 1, 1,
-0.4909604, 0.8155751, -0.5498496, 1, 1, 1, 1, 1,
-0.4902309, -1.675547, -2.206723, 1, 1, 1, 1, 1,
-0.48998, 2.612417, 1.350338, 1, 1, 1, 1, 1,
-0.4889221, 1.476841, -0.5382203, 1, 1, 1, 1, 1,
-0.4867034, -1.412564, -2.667477, 0, 0, 1, 1, 1,
-0.4742902, -0.9610466, -3.262697, 1, 0, 0, 1, 1,
-0.4627577, 0.102415, -0.08461396, 1, 0, 0, 1, 1,
-0.4626628, 1.635815, 0.1475051, 1, 0, 0, 1, 1,
-0.4581933, 0.5382462, -0.5229706, 1, 0, 0, 1, 1,
-0.4476601, 0.3369083, -1.471203, 1, 0, 0, 1, 1,
-0.4378996, -0.2402498, -1.948516, 0, 0, 0, 1, 1,
-0.4376191, 0.2935563, 1.650134, 0, 0, 0, 1, 1,
-0.4374505, 1.070704, 0.6840445, 0, 0, 0, 1, 1,
-0.4331495, 0.5875985, -1.119576, 0, 0, 0, 1, 1,
-0.4329709, -0.1433945, 0.2374805, 0, 0, 0, 1, 1,
-0.4317077, 0.511637, 0.606023, 0, 0, 0, 1, 1,
-0.4291008, 0.4408039, 0.5436551, 0, 0, 0, 1, 1,
-0.4260651, -0.5771856, 0.1687581, 1, 1, 1, 1, 1,
-0.4215178, 0.006136389, 1.088841, 1, 1, 1, 1, 1,
-0.4197567, 0.116302, -1.421412, 1, 1, 1, 1, 1,
-0.4183995, 0.2192307, -0.7852095, 1, 1, 1, 1, 1,
-0.4177131, -1.462652, -3.628292, 1, 1, 1, 1, 1,
-0.4170013, -0.8088489, -3.735481, 1, 1, 1, 1, 1,
-0.414743, -0.9367306, -1.54209, 1, 1, 1, 1, 1,
-0.4121807, 0.1265872, -1.979867, 1, 1, 1, 1, 1,
-0.4108661, -0.3980557, -1.264517, 1, 1, 1, 1, 1,
-0.4102801, -1.184569, -1.859228, 1, 1, 1, 1, 1,
-0.4082937, 1.230592, -0.6414831, 1, 1, 1, 1, 1,
-0.4073547, 0.7157941, -0.6359887, 1, 1, 1, 1, 1,
-0.3925318, -2.825985, -1.826642, 1, 1, 1, 1, 1,
-0.3922663, 0.3101143, -1.529229, 1, 1, 1, 1, 1,
-0.3914239, -0.7843858, -1.222887, 1, 1, 1, 1, 1,
-0.3913673, 0.6156577, -0.2664832, 0, 0, 1, 1, 1,
-0.3908349, -0.7743021, -1.52778, 1, 0, 0, 1, 1,
-0.3899553, -0.04231462, -2.455952, 1, 0, 0, 1, 1,
-0.3897692, -0.0863056, -0.5061936, 1, 0, 0, 1, 1,
-0.3793124, -0.990937, -2.483445, 1, 0, 0, 1, 1,
-0.3774516, 1.627577, -0.5699623, 1, 0, 0, 1, 1,
-0.3760639, -0.815287, -2.651983, 0, 0, 0, 1, 1,
-0.3730462, 0.3050261, -0.2612841, 0, 0, 0, 1, 1,
-0.3674721, 0.8954294, 0.727742, 0, 0, 0, 1, 1,
-0.3631966, 0.1314849, -0.7125272, 0, 0, 0, 1, 1,
-0.3606666, -1.220742, -3.268993, 0, 0, 0, 1, 1,
-0.3585846, 0.7374096, -0.3256944, 0, 0, 0, 1, 1,
-0.3578015, -1.131766, -3.102492, 0, 0, 0, 1, 1,
-0.3525267, -0.1219276, -3.038507, 1, 1, 1, 1, 1,
-0.3499647, -1.330746, -2.838961, 1, 1, 1, 1, 1,
-0.3481984, -1.099559, -3.426, 1, 1, 1, 1, 1,
-0.3477954, 0.06813213, -1.568301, 1, 1, 1, 1, 1,
-0.3471269, -1.192764, -2.603153, 1, 1, 1, 1, 1,
-0.3448566, 0.6857705, 1.260733, 1, 1, 1, 1, 1,
-0.3440687, 0.1128685, 0.287028, 1, 1, 1, 1, 1,
-0.3408099, 0.2209571, 0.3824472, 1, 1, 1, 1, 1,
-0.3371174, -0.5871612, -2.642232, 1, 1, 1, 1, 1,
-0.3367823, -0.1788816, -3.650232, 1, 1, 1, 1, 1,
-0.3322712, -0.2221729, 0.05115005, 1, 1, 1, 1, 1,
-0.3302215, 1.243249, -0.2005563, 1, 1, 1, 1, 1,
-0.3253609, -1.234125, -2.037392, 1, 1, 1, 1, 1,
-0.3235795, 0.4627473, -1.03266, 1, 1, 1, 1, 1,
-0.3153029, -0.2125745, -3.084582, 1, 1, 1, 1, 1,
-0.3117544, 0.9714421, -0.4664315, 0, 0, 1, 1, 1,
-0.3080566, -0.368584, -1.954237, 1, 0, 0, 1, 1,
-0.3072208, 0.5619873, 0.8616668, 1, 0, 0, 1, 1,
-0.3057884, 0.7901269, -0.6382009, 1, 0, 0, 1, 1,
-0.3010209, 0.1620016, -0.5976427, 1, 0, 0, 1, 1,
-0.29732, 0.3749484, -1.952738, 1, 0, 0, 1, 1,
-0.2965989, -0.7016391, -3.526449, 0, 0, 0, 1, 1,
-0.2948751, 0.8081583, 1.550535, 0, 0, 0, 1, 1,
-0.2932042, 1.941791, 1.412556, 0, 0, 0, 1, 1,
-0.2901233, -0.5454573, -2.459841, 0, 0, 0, 1, 1,
-0.2894409, -0.2748994, -2.093882, 0, 0, 0, 1, 1,
-0.2859275, -0.09172475, -2.04406, 0, 0, 0, 1, 1,
-0.2856446, -0.3176793, -2.632392, 0, 0, 0, 1, 1,
-0.2847511, 1.909127, -0.6128407, 1, 1, 1, 1, 1,
-0.2844237, -2.367182, -3.688855, 1, 1, 1, 1, 1,
-0.2787143, 0.4406748, 1.156439, 1, 1, 1, 1, 1,
-0.2765131, -0.8943841, -3.545556, 1, 1, 1, 1, 1,
-0.2752568, -0.8704908, -4.536011, 1, 1, 1, 1, 1,
-0.267841, -0.9551062, -3.530209, 1, 1, 1, 1, 1,
-0.2634093, 0.04743579, -0.882223, 1, 1, 1, 1, 1,
-0.2630441, -1.71685, -0.6919339, 1, 1, 1, 1, 1,
-0.2615426, 0.418461, -2.182584, 1, 1, 1, 1, 1,
-0.2594444, -1.093914, -3.931073, 1, 1, 1, 1, 1,
-0.2567109, 1.165279, -1.329868, 1, 1, 1, 1, 1,
-0.2538222, -1.000966, -3.388, 1, 1, 1, 1, 1,
-0.2535171, -0.6740229, -2.516965, 1, 1, 1, 1, 1,
-0.2519741, 2.061325, -0.5498784, 1, 1, 1, 1, 1,
-0.2508006, 1.097166, -2.221319, 1, 1, 1, 1, 1,
-0.2500412, 1.735137, 0.08274329, 0, 0, 1, 1, 1,
-0.2478754, -0.8189282, -3.83333, 1, 0, 0, 1, 1,
-0.2423907, -0.4696202, -2.645651, 1, 0, 0, 1, 1,
-0.2413186, -1.493713, -4.046495, 1, 0, 0, 1, 1,
-0.2383933, -1.98511, -1.91597, 1, 0, 0, 1, 1,
-0.2379543, 0.7231718, 2.273064, 1, 0, 0, 1, 1,
-0.2359598, -0.06094049, -2.134825, 0, 0, 0, 1, 1,
-0.2263857, 0.5777307, -0.076288, 0, 0, 0, 1, 1,
-0.2257832, -0.1560788, -2.09791, 0, 0, 0, 1, 1,
-0.2250272, -0.08930778, -1.200137, 0, 0, 0, 1, 1,
-0.221378, 0.8541455, 0.7095622, 0, 0, 0, 1, 1,
-0.2213596, 1.496418, -0.646699, 0, 0, 0, 1, 1,
-0.220726, 0.445455, -2.062641, 0, 0, 0, 1, 1,
-0.2160084, -0.1484272, -2.575976, 1, 1, 1, 1, 1,
-0.2147119, 0.1280099, -1.138422, 1, 1, 1, 1, 1,
-0.2098734, 0.3309487, -2.103337, 1, 1, 1, 1, 1,
-0.2092893, 1.124391, -1.581596, 1, 1, 1, 1, 1,
-0.2086999, -1.014871, -3.15258, 1, 1, 1, 1, 1,
-0.2083764, 0.2245792, -1.116278, 1, 1, 1, 1, 1,
-0.204075, -0.0657646, 0.1664426, 1, 1, 1, 1, 1,
-0.1989986, 0.926332, 0.3853431, 1, 1, 1, 1, 1,
-0.1986212, -0.07399422, -0.7863219, 1, 1, 1, 1, 1,
-0.1974018, -0.6734735, -2.377007, 1, 1, 1, 1, 1,
-0.1886525, 0.06204225, -1.887962, 1, 1, 1, 1, 1,
-0.1855732, -1.004382, -4.068518, 1, 1, 1, 1, 1,
-0.1798275, 0.4337258, -0.7426132, 1, 1, 1, 1, 1,
-0.1697865, -0.4031421, -4.277421, 1, 1, 1, 1, 1,
-0.16805, -1.124577, -3.572234, 1, 1, 1, 1, 1,
-0.1673379, 0.8922523, -0.3530301, 0, 0, 1, 1, 1,
-0.1664395, -1.031876, -0.6768201, 1, 0, 0, 1, 1,
-0.1535385, -0.8723649, -2.959402, 1, 0, 0, 1, 1,
-0.152758, 1.00296, -0.3276515, 1, 0, 0, 1, 1,
-0.1524058, 0.9887679, -0.5903615, 1, 0, 0, 1, 1,
-0.151278, -0.7168055, -2.742627, 1, 0, 0, 1, 1,
-0.1469628, -0.8885674, -1.608333, 0, 0, 0, 1, 1,
-0.1445189, -0.2391964, -3.98623, 0, 0, 0, 1, 1,
-0.1436951, -0.2136798, -0.9200023, 0, 0, 0, 1, 1,
-0.1402105, 0.09423839, -0.6642166, 0, 0, 0, 1, 1,
-0.1372166, -0.7774197, -2.094571, 0, 0, 0, 1, 1,
-0.1361136, -0.256397, -2.23503, 0, 0, 0, 1, 1,
-0.1354035, -0.08567357, -3.056376, 0, 0, 0, 1, 1,
-0.1351539, 1.736599, 0.4878276, 1, 1, 1, 1, 1,
-0.1328453, -0.4410411, -3.535943, 1, 1, 1, 1, 1,
-0.1308562, 1.499793, -0.325321, 1, 1, 1, 1, 1,
-0.1275613, 0.02135572, -1.780524, 1, 1, 1, 1, 1,
-0.1267552, -0.1129946, -2.99396, 1, 1, 1, 1, 1,
-0.1210202, -0.2819217, -2.909086, 1, 1, 1, 1, 1,
-0.119705, -0.9206968, -1.297969, 1, 1, 1, 1, 1,
-0.1176804, -0.6288765, -3.915097, 1, 1, 1, 1, 1,
-0.1174616, -0.09320289, -1.453245, 1, 1, 1, 1, 1,
-0.1147068, 1.82498, 0.4751621, 1, 1, 1, 1, 1,
-0.1125549, -0.06390592, -0.9498139, 1, 1, 1, 1, 1,
-0.1104363, 1.091465, -0.7573239, 1, 1, 1, 1, 1,
-0.1089427, 1.2282, 1.739774, 1, 1, 1, 1, 1,
-0.1083157, 1.273767, 0.08497945, 1, 1, 1, 1, 1,
-0.1051235, 0.2181604, 0.252085, 1, 1, 1, 1, 1,
-0.1038812, -0.6868933, -2.0703, 0, 0, 1, 1, 1,
-0.1032831, 1.143246, 0.3938469, 1, 0, 0, 1, 1,
-0.1004309, 0.6402616, 1.155657, 1, 0, 0, 1, 1,
-0.0960071, 1.726311, 0.6181257, 1, 0, 0, 1, 1,
-0.08987918, -0.6575494, -3.858872, 1, 0, 0, 1, 1,
-0.0898692, -0.0354704, -1.929665, 1, 0, 0, 1, 1,
-0.08811203, 1.55372, 0.744536, 0, 0, 0, 1, 1,
-0.08457108, -1.638919, -4.210095, 0, 0, 0, 1, 1,
-0.080332, -0.05640166, -3.413744, 0, 0, 0, 1, 1,
-0.0769925, -0.1407863, -0.6289085, 0, 0, 0, 1, 1,
-0.07670696, 0.1635302, -2.259123, 0, 0, 0, 1, 1,
-0.07396885, 0.9543443, -1.31841, 0, 0, 0, 1, 1,
-0.07371913, 0.9726993, -0.1233483, 0, 0, 0, 1, 1,
-0.07363722, -0.3126571, -4.132105, 1, 1, 1, 1, 1,
-0.07046605, 0.5808667, -0.3355518, 1, 1, 1, 1, 1,
-0.06956759, 0.8828004, -1.512719, 1, 1, 1, 1, 1,
-0.06666212, 0.09877969, -0.3451728, 1, 1, 1, 1, 1,
-0.06453744, -0.2930951, -3.481502, 1, 1, 1, 1, 1,
-0.06275623, 0.9621506, -0.9636786, 1, 1, 1, 1, 1,
-0.06227782, 0.6099687, 0.4645417, 1, 1, 1, 1, 1,
-0.06141759, 0.4502384, -2.332596, 1, 1, 1, 1, 1,
-0.06113491, -0.04148759, -1.393837, 1, 1, 1, 1, 1,
-0.05925449, 0.4059564, -0.02597983, 1, 1, 1, 1, 1,
-0.05678095, 1.185319, -0.04063078, 1, 1, 1, 1, 1,
-0.05657748, -0.06662381, -1.228645, 1, 1, 1, 1, 1,
-0.05367803, 0.6641256, -0.7871808, 1, 1, 1, 1, 1,
-0.05308546, 1.976868, -0.4684332, 1, 1, 1, 1, 1,
-0.05289051, -0.4166597, -2.101899, 1, 1, 1, 1, 1,
-0.05251716, -0.2004725, -3.382285, 0, 0, 1, 1, 1,
-0.05081054, -0.3732658, -1.399973, 1, 0, 0, 1, 1,
-0.04957839, -2.293165, -2.249193, 1, 0, 0, 1, 1,
-0.04853887, -0.7398792, -3.683378, 1, 0, 0, 1, 1,
-0.04673425, -2.378293, -2.941148, 1, 0, 0, 1, 1,
-0.04068151, -0.04878215, -1.58975, 1, 0, 0, 1, 1,
-0.03882153, 0.5469207, 1.958032, 0, 0, 0, 1, 1,
-0.0352399, 0.3311235, -0.7887696, 0, 0, 0, 1, 1,
-0.03483294, -1.275307, -3.516654, 0, 0, 0, 1, 1,
-0.03303306, -0.8014163, -2.498087, 0, 0, 0, 1, 1,
-0.02972304, 0.1205361, -1.41788, 0, 0, 0, 1, 1,
-0.02965836, -0.6236486, -1.993099, 0, 0, 0, 1, 1,
-0.028449, 0.04544498, -1.867692, 0, 0, 0, 1, 1,
-0.02348191, -0.1948578, -3.745042, 1, 1, 1, 1, 1,
-0.02116292, 0.5197849, -0.03271224, 1, 1, 1, 1, 1,
-0.02103336, -0.5415113, -3.863743, 1, 1, 1, 1, 1,
-0.01878775, -0.4772889, -5.412955, 1, 1, 1, 1, 1,
-0.01784515, 0.8535177, -0.194452, 1, 1, 1, 1, 1,
-0.01588642, -1.106452, -2.461887, 1, 1, 1, 1, 1,
-0.01282359, 0.3557584, 1.272188, 1, 1, 1, 1, 1,
-0.005870514, -0.6635647, -4.768429, 1, 1, 1, 1, 1,
-0.005097185, 0.04077004, -1.882037, 1, 1, 1, 1, 1,
-0.001993962, 0.5191717, -0.911234, 1, 1, 1, 1, 1,
-0.001520435, -0.7804415, -3.72872, 1, 1, 1, 1, 1,
0.0009520557, 0.440399, 2.377274, 1, 1, 1, 1, 1,
0.006646116, -0.2865607, 3.638156, 1, 1, 1, 1, 1,
0.007350225, 1.684884, 1.387985, 1, 1, 1, 1, 1,
0.01400896, 1.274259, -1.162852, 1, 1, 1, 1, 1,
0.016691, -1.416061, 4.71557, 0, 0, 1, 1, 1,
0.01744253, -0.9128597, 1.94035, 1, 0, 0, 1, 1,
0.01949619, -0.7755603, 3.602711, 1, 0, 0, 1, 1,
0.01976358, -0.8791306, 4.52036, 1, 0, 0, 1, 1,
0.02172104, 1.917883, -0.2017153, 1, 0, 0, 1, 1,
0.02209781, 1.217885, -0.7199755, 1, 0, 0, 1, 1,
0.02533788, -0.7467163, 2.49026, 0, 0, 0, 1, 1,
0.02541428, 0.5755554, 0.6693311, 0, 0, 0, 1, 1,
0.02564412, 1.153718, -0.4611107, 0, 0, 0, 1, 1,
0.02698646, -0.1943738, 3.767097, 0, 0, 0, 1, 1,
0.02986639, 0.3958798, -0.1093522, 0, 0, 0, 1, 1,
0.03133236, -0.8602837, 2.446746, 0, 0, 0, 1, 1,
0.03194797, -1.131858, 4.636541, 0, 0, 0, 1, 1,
0.03238427, -0.5401207, 3.065903, 1, 1, 1, 1, 1,
0.03344047, 1.517804, 0.2065519, 1, 1, 1, 1, 1,
0.03701243, 0.1835576, -0.8632407, 1, 1, 1, 1, 1,
0.04287841, -0.1169907, 2.760825, 1, 1, 1, 1, 1,
0.04341451, 0.8264468, -0.4993986, 1, 1, 1, 1, 1,
0.04378962, 0.7901228, -0.8736326, 1, 1, 1, 1, 1,
0.04864047, 0.3458076, 0.6239215, 1, 1, 1, 1, 1,
0.04899122, -0.9267263, 3.591293, 1, 1, 1, 1, 1,
0.04949184, 1.607552, -0.3034864, 1, 1, 1, 1, 1,
0.0520189, -0.874721, 4.007214, 1, 1, 1, 1, 1,
0.05363765, -0.7694595, 3.796987, 1, 1, 1, 1, 1,
0.0587438, -0.3393906, 3.777448, 1, 1, 1, 1, 1,
0.06845824, -0.7413068, 2.69921, 1, 1, 1, 1, 1,
0.06992485, 1.461664, -0.7586424, 1, 1, 1, 1, 1,
0.07174865, 0.8729379, 0.2112311, 1, 1, 1, 1, 1,
0.07862664, 0.8875576, 0.4312882, 0, 0, 1, 1, 1,
0.0819141, -0.1809675, 2.050796, 1, 0, 0, 1, 1,
0.08245078, -1.461636, 2.432326, 1, 0, 0, 1, 1,
0.08391186, -0.3303399, 2.28259, 1, 0, 0, 1, 1,
0.09870838, -1.202809, 2.992424, 1, 0, 0, 1, 1,
0.09895998, 1.923334, -0.1136708, 1, 0, 0, 1, 1,
0.09955093, 1.20874, -0.04819952, 0, 0, 0, 1, 1,
0.1006603, 0.5533332, -0.7314556, 0, 0, 0, 1, 1,
0.1020771, 0.343317, 0.8352458, 0, 0, 0, 1, 1,
0.1061581, 1.765396, 1.296875, 0, 0, 0, 1, 1,
0.108177, -0.7848616, 2.318682, 0, 0, 0, 1, 1,
0.1111294, -3.263148, 4.212515, 0, 0, 0, 1, 1,
0.1123571, 1.551222, 0.4068879, 0, 0, 0, 1, 1,
0.1142816, 0.2447085, 0.5313869, 1, 1, 1, 1, 1,
0.1156521, -1.812648, 2.879568, 1, 1, 1, 1, 1,
0.1165521, -0.8540252, 3.850438, 1, 1, 1, 1, 1,
0.1204622, -0.9119754, 3.294719, 1, 1, 1, 1, 1,
0.1207416, 0.1482015, 0.6288958, 1, 1, 1, 1, 1,
0.122366, -0.9641585, 3.316111, 1, 1, 1, 1, 1,
0.1226955, 0.07930814, 1.658338, 1, 1, 1, 1, 1,
0.1261575, 1.232296, 0.7732126, 1, 1, 1, 1, 1,
0.1262024, -2.470378, 2.889229, 1, 1, 1, 1, 1,
0.1262987, -0.1676209, 2.3326, 1, 1, 1, 1, 1,
0.1290389, 0.5966248, 0.7708653, 1, 1, 1, 1, 1,
0.1325581, 1.157033, -0.3930236, 1, 1, 1, 1, 1,
0.1338354, -0.4526114, -0.7780002, 1, 1, 1, 1, 1,
0.1362778, -1.866049, 1.208935, 1, 1, 1, 1, 1,
0.1387426, -2.051915, 2.752874, 1, 1, 1, 1, 1,
0.1393449, 0.1230504, 0.7003887, 0, 0, 1, 1, 1,
0.1429849, -0.6498331, 1.934338, 1, 0, 0, 1, 1,
0.14332, -0.8367599, 1.304995, 1, 0, 0, 1, 1,
0.1553184, -1.674592, 3.356233, 1, 0, 0, 1, 1,
0.1574412, 1.253954, -1.278368, 1, 0, 0, 1, 1,
0.1578551, -0.3217705, 3.084414, 1, 0, 0, 1, 1,
0.1667655, 0.85051, -0.876056, 0, 0, 0, 1, 1,
0.173271, 1.117152, 0.4391937, 0, 0, 0, 1, 1,
0.1734213, -0.4448166, 3.77332, 0, 0, 0, 1, 1,
0.1817107, 0.54876, -0.4579218, 0, 0, 0, 1, 1,
0.1852279, 1.343886, 0.3052385, 0, 0, 0, 1, 1,
0.1901644, -0.596826, 3.964215, 0, 0, 0, 1, 1,
0.1949801, -0.3155402, 3.319655, 0, 0, 0, 1, 1,
0.1952357, 0.3725308, 2.507999, 1, 1, 1, 1, 1,
0.195635, 0.2224239, 0.2008336, 1, 1, 1, 1, 1,
0.199111, 1.306412, 1.430779, 1, 1, 1, 1, 1,
0.1994577, -0.2311059, 2.109801, 1, 1, 1, 1, 1,
0.202265, -0.6844798, 3.313639, 1, 1, 1, 1, 1,
0.2050952, -0.2173025, 2.324492, 1, 1, 1, 1, 1,
0.2079729, -0.4078216, 0.9435216, 1, 1, 1, 1, 1,
0.2108884, -1.863045, 3.339533, 1, 1, 1, 1, 1,
0.2126447, -0.1285439, 3.631138, 1, 1, 1, 1, 1,
0.2128584, 1.279089, 1.435846, 1, 1, 1, 1, 1,
0.2196774, -0.6297304, 2.789212, 1, 1, 1, 1, 1,
0.2218949, 1.988358, -0.02669603, 1, 1, 1, 1, 1,
0.2269228, -0.2993074, 2.060245, 1, 1, 1, 1, 1,
0.2286375, 0.4614435, 1.466781, 1, 1, 1, 1, 1,
0.2290306, 0.233397, 1.808287, 1, 1, 1, 1, 1,
0.2328853, 0.8172097, 0.1158369, 0, 0, 1, 1, 1,
0.2340274, -1.101305, 3.341448, 1, 0, 0, 1, 1,
0.2370487, 0.3152058, 0.2217109, 1, 0, 0, 1, 1,
0.2389088, 0.7476528, 0.8627664, 1, 0, 0, 1, 1,
0.2452767, 1.58335, 0.677321, 1, 0, 0, 1, 1,
0.2453899, -1.438656, 1.442864, 1, 0, 0, 1, 1,
0.2460165, -1.005601, 3.838215, 0, 0, 0, 1, 1,
0.2489405, 1.60488, 0.1911004, 0, 0, 0, 1, 1,
0.2548354, 0.04108464, 0.8304687, 0, 0, 0, 1, 1,
0.2551538, -0.0681861, 1.231785, 0, 0, 0, 1, 1,
0.2580377, 0.9839923, -0.6937068, 0, 0, 0, 1, 1,
0.2583475, -0.4087097, 3.283697, 0, 0, 0, 1, 1,
0.2583853, -0.4270901, 3.453366, 0, 0, 0, 1, 1,
0.2586704, -0.5645211, 2.097504, 1, 1, 1, 1, 1,
0.262834, 0.2680243, 2.237622, 1, 1, 1, 1, 1,
0.2633208, -0.9956343, 2.137778, 1, 1, 1, 1, 1,
0.2639083, 1.132526, -0.5597377, 1, 1, 1, 1, 1,
0.264025, 0.1725126, 1.083393, 1, 1, 1, 1, 1,
0.2656053, -0.3087019, 2.263703, 1, 1, 1, 1, 1,
0.2664498, -0.2040227, 3.692627, 1, 1, 1, 1, 1,
0.2673807, 1.492638, 0.156535, 1, 1, 1, 1, 1,
0.2808957, -1.661587, 2.852966, 1, 1, 1, 1, 1,
0.2825159, -0.03663299, 2.163403, 1, 1, 1, 1, 1,
0.294131, 0.8382095, -0.2845246, 1, 1, 1, 1, 1,
0.2978519, 0.5906096, 1.926931, 1, 1, 1, 1, 1,
0.2981116, 0.6832859, 0.2676068, 1, 1, 1, 1, 1,
0.2985741, -0.7844697, 2.892309, 1, 1, 1, 1, 1,
0.3004507, 0.5641352, 0.6924332, 1, 1, 1, 1, 1,
0.3005402, 0.1417115, 1.889949, 0, 0, 1, 1, 1,
0.3022842, -0.1688952, 3.120348, 1, 0, 0, 1, 1,
0.3059543, -0.693148, 2.852156, 1, 0, 0, 1, 1,
0.3068968, 1.155236, -0.6507824, 1, 0, 0, 1, 1,
0.3075536, 2.275892, -1.141568, 1, 0, 0, 1, 1,
0.3110018, -1.451129, 3.147974, 1, 0, 0, 1, 1,
0.3134298, 0.2665678, 1.239852, 0, 0, 0, 1, 1,
0.3168716, -0.026961, 1.979833, 0, 0, 0, 1, 1,
0.3175734, 0.1045133, 1.443678, 0, 0, 0, 1, 1,
0.320057, -0.2951661, 0.8187655, 0, 0, 0, 1, 1,
0.3214262, -0.0980619, 3.309632, 0, 0, 0, 1, 1,
0.3231857, -0.09275223, 1.953969, 0, 0, 0, 1, 1,
0.327822, 0.6770255, 0.5355546, 0, 0, 0, 1, 1,
0.3289747, -0.07491229, 3.031559, 1, 1, 1, 1, 1,
0.3317815, -0.9711017, 0.1439715, 1, 1, 1, 1, 1,
0.3348341, -1.231245, 4.336068, 1, 1, 1, 1, 1,
0.334868, -0.7461137, 2.793509, 1, 1, 1, 1, 1,
0.3356493, -0.9934233, 4.833092, 1, 1, 1, 1, 1,
0.3358379, 0.4682231, 1.158539, 1, 1, 1, 1, 1,
0.3449047, -1.959284, 0.3408938, 1, 1, 1, 1, 1,
0.3499338, -0.9837593, 2.745097, 1, 1, 1, 1, 1,
0.3512811, -0.6260991, 3.26104, 1, 1, 1, 1, 1,
0.3526217, -0.6446643, 2.910893, 1, 1, 1, 1, 1,
0.3537662, -1.023039, -0.02978912, 1, 1, 1, 1, 1,
0.3593296, 0.7800065, 0.6224308, 1, 1, 1, 1, 1,
0.3606073, 2.415876, -0.07627332, 1, 1, 1, 1, 1,
0.3615427, 0.2418653, 2.662348, 1, 1, 1, 1, 1,
0.36235, 0.9939283, 0.2705998, 1, 1, 1, 1, 1,
0.3633413, -1.036025, 1.849606, 0, 0, 1, 1, 1,
0.3653366, -0.6358333, 2.563655, 1, 0, 0, 1, 1,
0.3664775, -0.8643852, 2.698868, 1, 0, 0, 1, 1,
0.3667865, -0.7679186, 4.45858, 1, 0, 0, 1, 1,
0.3685338, 1.089999, 1.844256, 1, 0, 0, 1, 1,
0.3733866, 1.251186, 0.05892619, 1, 0, 0, 1, 1,
0.3780095, -0.3689373, 2.4426, 0, 0, 0, 1, 1,
0.3798262, 0.3338171, 1.211682, 0, 0, 0, 1, 1,
0.3813888, 0.06903126, 1.201162, 0, 0, 0, 1, 1,
0.3827402, 0.5602931, 0.5374568, 0, 0, 0, 1, 1,
0.3829199, 0.05844093, 0.9099268, 0, 0, 0, 1, 1,
0.3865202, -1.197197, 3.830165, 0, 0, 0, 1, 1,
0.3889874, -0.7966122, 2.243515, 0, 0, 0, 1, 1,
0.3934336, 1.952819, 0.7916864, 1, 1, 1, 1, 1,
0.3941374, -0.7530376, 0.8438196, 1, 1, 1, 1, 1,
0.3970013, 0.07636455, 1.230386, 1, 1, 1, 1, 1,
0.402669, 0.6226401, 1.78344, 1, 1, 1, 1, 1,
0.4038838, -0.3669567, 2.830903, 1, 1, 1, 1, 1,
0.4057289, -0.8282398, 1.76796, 1, 1, 1, 1, 1,
0.4067654, 0.07004562, 3.025133, 1, 1, 1, 1, 1,
0.4079288, 0.4896606, -0.7019178, 1, 1, 1, 1, 1,
0.4123424, -0.4536879, 3.169687, 1, 1, 1, 1, 1,
0.4129701, -0.863876, 3.056571, 1, 1, 1, 1, 1,
0.4138084, -0.9807059, 2.400864, 1, 1, 1, 1, 1,
0.4186157, -1.174911, 0.9004522, 1, 1, 1, 1, 1,
0.4199095, 0.4822455, 0.6438845, 1, 1, 1, 1, 1,
0.4216775, 1.596756, 0.2140266, 1, 1, 1, 1, 1,
0.4219739, -0.8429777, 1.397883, 1, 1, 1, 1, 1,
0.4227185, -0.6053715, -0.768627, 0, 0, 1, 1, 1,
0.4239811, 0.8032631, -0.5589325, 1, 0, 0, 1, 1,
0.4267559, -0.5977041, 2.07884, 1, 0, 0, 1, 1,
0.4312221, -0.4166305, 1.247316, 1, 0, 0, 1, 1,
0.4322228, -0.0311159, 1.882054, 1, 0, 0, 1, 1,
0.4334026, -0.3030376, 4.093683, 1, 0, 0, 1, 1,
0.4352056, 0.6593973, 0.5233333, 0, 0, 0, 1, 1,
0.4378749, -1.940772, 1.181168, 0, 0, 0, 1, 1,
0.4506529, -0.2870236, 3.609579, 0, 0, 0, 1, 1,
0.4579263, -0.2765493, 3.630739, 0, 0, 0, 1, 1,
0.4660946, 1.157646, 0.8029099, 0, 0, 0, 1, 1,
0.4661167, 0.184548, 2.202508, 0, 0, 0, 1, 1,
0.4740951, -2.76977, 2.379947, 0, 0, 0, 1, 1,
0.4746247, 0.004925039, 2.148965, 1, 1, 1, 1, 1,
0.4764557, -0.2487944, 0.2857022, 1, 1, 1, 1, 1,
0.4770685, -1.017308, 1.15125, 1, 1, 1, 1, 1,
0.4781132, 0.4695531, 1.315724, 1, 1, 1, 1, 1,
0.4786055, 0.2791272, 1.606402, 1, 1, 1, 1, 1,
0.4789091, 0.3768633, 1.508732, 1, 1, 1, 1, 1,
0.4913031, 0.2313189, 0.02835506, 1, 1, 1, 1, 1,
0.4926928, -0.6882662, 1.847516, 1, 1, 1, 1, 1,
0.4963692, 0.3469947, 1.719501, 1, 1, 1, 1, 1,
0.4980884, -0.03984841, 2.518834, 1, 1, 1, 1, 1,
0.5035397, -0.4818451, 1.164898, 1, 1, 1, 1, 1,
0.5088868, 0.5166871, 0.3396325, 1, 1, 1, 1, 1,
0.5091885, 0.7146634, 2.959056, 1, 1, 1, 1, 1,
0.5094048, 1.037805, 0.5212356, 1, 1, 1, 1, 1,
0.5203716, 0.2040186, 2.32155, 1, 1, 1, 1, 1,
0.5250177, -0.6316018, 2.106272, 0, 0, 1, 1, 1,
0.5277241, 0.9322358, 1.010144, 1, 0, 0, 1, 1,
0.530216, 0.3858847, 1.935414, 1, 0, 0, 1, 1,
0.5342487, 1.67877, -0.07167938, 1, 0, 0, 1, 1,
0.5356244, -0.7003098, 4.373296, 1, 0, 0, 1, 1,
0.5359097, -0.1715347, 0.8689208, 1, 0, 0, 1, 1,
0.5368792, 0.8924984, 1.960587, 0, 0, 0, 1, 1,
0.5381292, 0.07552791, -0.01507854, 0, 0, 0, 1, 1,
0.5401573, 0.01328971, 1.897684, 0, 0, 0, 1, 1,
0.540958, -0.6122583, 2.800655, 0, 0, 0, 1, 1,
0.545967, 0.6078908, 1.944677, 0, 0, 0, 1, 1,
0.5469418, -1.021972, 3.458336, 0, 0, 0, 1, 1,
0.5470564, 0.6054953, 2.453634, 0, 0, 0, 1, 1,
0.552272, -1.096211, 3.036555, 1, 1, 1, 1, 1,
0.5610646, -0.7598993, 2.427427, 1, 1, 1, 1, 1,
0.5614939, 0.04836459, 1.322653, 1, 1, 1, 1, 1,
0.5619615, -0.8121446, 2.055846, 1, 1, 1, 1, 1,
0.5626624, 0.3206646, 2.474815, 1, 1, 1, 1, 1,
0.5637668, 1.052204, 0.8622449, 1, 1, 1, 1, 1,
0.5666837, 1.949139, -0.3848077, 1, 1, 1, 1, 1,
0.5711126, -1.199512, 3.064612, 1, 1, 1, 1, 1,
0.5722847, -1.490041, 1.08982, 1, 1, 1, 1, 1,
0.5738195, 0.1770979, 2.543582, 1, 1, 1, 1, 1,
0.5747715, 0.9800051, 0.9980931, 1, 1, 1, 1, 1,
0.5795222, 0.9975455, 1.342069, 1, 1, 1, 1, 1,
0.5813626, 0.4123026, 2.572401, 1, 1, 1, 1, 1,
0.5832743, -0.5855824, 4.138049, 1, 1, 1, 1, 1,
0.5836828, 0.4355802, -1.671333, 1, 1, 1, 1, 1,
0.584992, -0.9415143, 2.457181, 0, 0, 1, 1, 1,
0.5962431, 0.4115869, -0.1860755, 1, 0, 0, 1, 1,
0.5984209, -2.778647, 3.292204, 1, 0, 0, 1, 1,
0.5997802, 0.6405687, 1.863597, 1, 0, 0, 1, 1,
0.6017024, -0.73634, 1.636559, 1, 0, 0, 1, 1,
0.6022178, 2.774368, 0.2520263, 1, 0, 0, 1, 1,
0.6069415, -0.2489683, 3.213062, 0, 0, 0, 1, 1,
0.611838, 1.095347, 0.4883857, 0, 0, 0, 1, 1,
0.6183006, -1.542184, 3.119914, 0, 0, 0, 1, 1,
0.6187882, 0.4989019, 0.8288376, 0, 0, 0, 1, 1,
0.6295217, -1.009876, 2.225827, 0, 0, 0, 1, 1,
0.6306878, 0.5652942, 1.803958, 0, 0, 0, 1, 1,
0.6314679, -0.5567141, 2.543804, 0, 0, 0, 1, 1,
0.6349144, 2.523396, 0.2701085, 1, 1, 1, 1, 1,
0.6364354, 0.5792458, 0.2805906, 1, 1, 1, 1, 1,
0.6379563, 0.2025609, 1.166362, 1, 1, 1, 1, 1,
0.6417074, -0.3501503, 1.843266, 1, 1, 1, 1, 1,
0.6465544, -0.3773002, 0.7340986, 1, 1, 1, 1, 1,
0.6475095, 1.554631, 0.3231654, 1, 1, 1, 1, 1,
0.6525498, -0.9893763, 2.257121, 1, 1, 1, 1, 1,
0.6528149, -0.8617553, 1.879846, 1, 1, 1, 1, 1,
0.6543352, -1.305847, 2.378574, 1, 1, 1, 1, 1,
0.6583735, 0.1710913, 2.189308, 1, 1, 1, 1, 1,
0.6605582, 0.5032712, 0.04706361, 1, 1, 1, 1, 1,
0.6648301, 0.9151115, 0.2489778, 1, 1, 1, 1, 1,
0.6664131, 0.5967503, -1.940437, 1, 1, 1, 1, 1,
0.6681867, 0.3244591, 0.3920713, 1, 1, 1, 1, 1,
0.670092, -1.423798, 2.182021, 1, 1, 1, 1, 1,
0.6722383, -0.6782942, 3.434299, 0, 0, 1, 1, 1,
0.6789745, -1.727147, 0.5343568, 1, 0, 0, 1, 1,
0.6793771, 0.4140992, 1.270143, 1, 0, 0, 1, 1,
0.6794613, -0.5575845, 2.780628, 1, 0, 0, 1, 1,
0.6795729, -1.29648, 3.786638, 1, 0, 0, 1, 1,
0.6835863, -1.30337, 3.784321, 1, 0, 0, 1, 1,
0.686132, 1.527704, -0.3392681, 0, 0, 0, 1, 1,
0.6890456, 0.7057648, 0.2747019, 0, 0, 0, 1, 1,
0.6905165, -1.219927, 3.149529, 0, 0, 0, 1, 1,
0.6914921, -1.011822, 3.292346, 0, 0, 0, 1, 1,
0.6924046, -0.2015259, 1.687883, 0, 0, 0, 1, 1,
0.6932476, 0.3577845, 2.373107, 0, 0, 0, 1, 1,
0.6932547, -0.191204, 1.57858, 0, 0, 0, 1, 1,
0.7017062, 0.8970443, 0.8935304, 1, 1, 1, 1, 1,
0.7060089, 0.2610423, 3.730036, 1, 1, 1, 1, 1,
0.7069519, -0.350084, 2.589754, 1, 1, 1, 1, 1,
0.7075235, -0.8170379, 2.633264, 1, 1, 1, 1, 1,
0.7081423, 0.9325733, -0.8801031, 1, 1, 1, 1, 1,
0.7246583, -0.4496404, 3.20336, 1, 1, 1, 1, 1,
0.726171, -0.8047227, 2.954411, 1, 1, 1, 1, 1,
0.7280256, 0.8139842, -0.7744882, 1, 1, 1, 1, 1,
0.7280748, 0.1170028, 1.778821, 1, 1, 1, 1, 1,
0.7295231, 0.3571596, 1.287101, 1, 1, 1, 1, 1,
0.7351916, 1.61967, 0.1178078, 1, 1, 1, 1, 1,
0.7356696, 0.4386371, -0.6491518, 1, 1, 1, 1, 1,
0.7407141, 0.2812847, 2.373563, 1, 1, 1, 1, 1,
0.7424867, -1.28743, 2.209904, 1, 1, 1, 1, 1,
0.7461959, -0.9115663, 1.088948, 1, 1, 1, 1, 1,
0.7463001, 1.392056, -0.1184715, 0, 0, 1, 1, 1,
0.7608542, -1.088699, 2.841397, 1, 0, 0, 1, 1,
0.7619827, 0.8964068, -0.5212908, 1, 0, 0, 1, 1,
0.7631646, 2.126214, 0.7943307, 1, 0, 0, 1, 1,
0.7633283, -0.1523949, 3.305724, 1, 0, 0, 1, 1,
0.7650113, 0.3909625, 2.539751, 1, 0, 0, 1, 1,
0.7684582, 0.8723036, -1.180715, 0, 0, 0, 1, 1,
0.7736998, 1.001843, 1.224665, 0, 0, 0, 1, 1,
0.7783592, -2.397551, 1.124565, 0, 0, 0, 1, 1,
0.7886652, -1.09593, 2.753295, 0, 0, 0, 1, 1,
0.7902308, -1.574952, 1.302718, 0, 0, 0, 1, 1,
0.7976214, 2.117968, -0.4053203, 0, 0, 0, 1, 1,
0.7993334, -1.17815, 1.813657, 0, 0, 0, 1, 1,
0.8103909, -0.7912877, 2.588261, 1, 1, 1, 1, 1,
0.8192589, -0.9553778, 1.092527, 1, 1, 1, 1, 1,
0.8202484, 1.800506, -0.9556244, 1, 1, 1, 1, 1,
0.8265868, 1.091243, 0.08248399, 1, 1, 1, 1, 1,
0.8483654, -0.1116421, 2.056664, 1, 1, 1, 1, 1,
0.8495902, 0.7501489, -0.5255971, 1, 1, 1, 1, 1,
0.8506329, -0.2994689, 0.2807987, 1, 1, 1, 1, 1,
0.8514425, -0.275223, 1.344319, 1, 1, 1, 1, 1,
0.8522074, -0.2711657, 2.193371, 1, 1, 1, 1, 1,
0.8554977, 0.42665, 0.6939894, 1, 1, 1, 1, 1,
0.8572725, -0.004745563, 2.374552, 1, 1, 1, 1, 1,
0.8596821, 0.9256051, 0.3754166, 1, 1, 1, 1, 1,
0.867595, -0.447627, -0.3251843, 1, 1, 1, 1, 1,
0.8756722, -0.7309843, 3.071569, 1, 1, 1, 1, 1,
0.8772087, 0.2275517, 2.996306, 1, 1, 1, 1, 1,
0.8808451, -0.03093105, 3.020915, 0, 0, 1, 1, 1,
0.8828405, -0.9306905, 3.125647, 1, 0, 0, 1, 1,
0.8871749, -1.034828, 2.939074, 1, 0, 0, 1, 1,
0.8878301, -1.369999, 0.8277916, 1, 0, 0, 1, 1,
0.895726, 0.9334331, 1.057518, 1, 0, 0, 1, 1,
0.8981374, -0.3032064, 1.005792, 1, 0, 0, 1, 1,
0.8994335, 0.3090515, 1.947839, 0, 0, 0, 1, 1,
0.901494, 0.07675558, 1.833715, 0, 0, 0, 1, 1,
0.9162593, 1.823065, -0.5507764, 0, 0, 0, 1, 1,
0.9197183, 0.01622199, 2.935293, 0, 0, 0, 1, 1,
0.9218805, 0.9132753, 0.8410448, 0, 0, 0, 1, 1,
0.9254012, 0.3636795, 0.06819329, 0, 0, 0, 1, 1,
0.9276307, 0.628935, 2.036659, 0, 0, 0, 1, 1,
0.9327232, -0.6485922, 2.909013, 1, 1, 1, 1, 1,
0.9342055, -1.486242, 1.660834, 1, 1, 1, 1, 1,
0.9423404, 0.4003546, 3.188894, 1, 1, 1, 1, 1,
0.9472004, 0.05744647, 1.311953, 1, 1, 1, 1, 1,
0.9525397, 0.6053502, 1.565987, 1, 1, 1, 1, 1,
0.9559956, 0.1070269, 1.130657, 1, 1, 1, 1, 1,
0.9588592, -0.6688348, 3.053789, 1, 1, 1, 1, 1,
0.9602341, 0.0178279, 2.6795, 1, 1, 1, 1, 1,
0.9625113, 0.08432203, 1.265356, 1, 1, 1, 1, 1,
0.9656326, 0.3731453, 0.8747395, 1, 1, 1, 1, 1,
0.96689, 0.2855064, 1.51571, 1, 1, 1, 1, 1,
0.9725525, 0.8285637, -1.193834, 1, 1, 1, 1, 1,
0.9737244, 1.035751, 2.617876, 1, 1, 1, 1, 1,
0.9772659, 0.9277004, 1.332166, 1, 1, 1, 1, 1,
0.9786707, 0.247371, 2.500538, 1, 1, 1, 1, 1,
0.9820585, -0.710925, 1.231899, 0, 0, 1, 1, 1,
0.9905772, -0.4536109, 1.102871, 1, 0, 0, 1, 1,
0.9941511, -1.118773, 2.965239, 1, 0, 0, 1, 1,
0.9953059, -0.9030226, 0.823804, 1, 0, 0, 1, 1,
0.9979146, -1.685999, 3.30346, 1, 0, 0, 1, 1,
0.9986358, 0.8569775, 1.009931, 1, 0, 0, 1, 1,
1.003036, 0.6335984, 1.001298, 0, 0, 0, 1, 1,
1.003072, -1.433914, 1.498289, 0, 0, 0, 1, 1,
1.0161, 1.165487, 0.4334055, 0, 0, 0, 1, 1,
1.016456, 0.1743414, 2.612532, 0, 0, 0, 1, 1,
1.016559, 0.6134271, 0.2634445, 0, 0, 0, 1, 1,
1.018716, 0.8028877, 0.5455193, 0, 0, 0, 1, 1,
1.019184, 0.4455562, 2.211485, 0, 0, 0, 1, 1,
1.027623, 0.02045963, 1.238102, 1, 1, 1, 1, 1,
1.030163, 1.691916, 0.09755246, 1, 1, 1, 1, 1,
1.032634, 1.741055, 0.5800965, 1, 1, 1, 1, 1,
1.038543, -1.178153, 1.759055, 1, 1, 1, 1, 1,
1.040558, 1.223213, 0.2566445, 1, 1, 1, 1, 1,
1.043383, -0.72715, 1.68254, 1, 1, 1, 1, 1,
1.04368, 1.468865, 0.4766902, 1, 1, 1, 1, 1,
1.047008, 0.8588459, 1.172057, 1, 1, 1, 1, 1,
1.052417, 0.2842296, 1.755817, 1, 1, 1, 1, 1,
1.052518, 2.004168, 0.5258632, 1, 1, 1, 1, 1,
1.059067, -1.096436, 3.234817, 1, 1, 1, 1, 1,
1.060401, -0.7224122, 2.557314, 1, 1, 1, 1, 1,
1.062916, 0.3187041, 1.185029, 1, 1, 1, 1, 1,
1.066001, 0.7547643, 0.03812954, 1, 1, 1, 1, 1,
1.069275, -0.363012, 0.7818776, 1, 1, 1, 1, 1,
1.079382, -0.6193169, 2.559453, 0, 0, 1, 1, 1,
1.081434, 0.1072563, 2.27614, 1, 0, 0, 1, 1,
1.087915, 1.261707, 0.5123218, 1, 0, 0, 1, 1,
1.088867, -1.616455, 2.955739, 1, 0, 0, 1, 1,
1.092685, 0.8457628, 1.817981, 1, 0, 0, 1, 1,
1.100859, -1.152571, 1.804176, 1, 0, 0, 1, 1,
1.104266, -0.5902509, 3.515605, 0, 0, 0, 1, 1,
1.107502, -0.7042972, 4.380348, 0, 0, 0, 1, 1,
1.107833, -0.5607314, 1.06162, 0, 0, 0, 1, 1,
1.109029, 0.147222, 2.368443, 0, 0, 0, 1, 1,
1.113566, 0.3923285, 0.6031537, 0, 0, 0, 1, 1,
1.114547, -0.1575065, 1.448647, 0, 0, 0, 1, 1,
1.11749, -0.9410363, 2.059854, 0, 0, 0, 1, 1,
1.118674, -0.8480871, 1.44396, 1, 1, 1, 1, 1,
1.121682, 2.07252, 0.02022913, 1, 1, 1, 1, 1,
1.122823, 0.7379565, 2.27892, 1, 1, 1, 1, 1,
1.123644, -0.09573112, 2.562827, 1, 1, 1, 1, 1,
1.127005, -1.422577, 2.352545, 1, 1, 1, 1, 1,
1.130909, 0.5668697, 0.8926029, 1, 1, 1, 1, 1,
1.135474, -0.05432178, -0.3229244, 1, 1, 1, 1, 1,
1.137961, 1.135462, 2.479335, 1, 1, 1, 1, 1,
1.144876, -0.5549369, 2.075286, 1, 1, 1, 1, 1,
1.145684, 1.773072, -0.8349073, 1, 1, 1, 1, 1,
1.146521, -1.253795, 3.31322, 1, 1, 1, 1, 1,
1.147251, 0.4969019, 2.601376, 1, 1, 1, 1, 1,
1.159687, -1.291883, 3.731701, 1, 1, 1, 1, 1,
1.17554, 0.9265366, 0.5048323, 1, 1, 1, 1, 1,
1.179132, 0.450072, 0.843815, 1, 1, 1, 1, 1,
1.184681, 0.4919511, 2.020923, 0, 0, 1, 1, 1,
1.189865, -0.02769461, 1.155654, 1, 0, 0, 1, 1,
1.197101, -0.2686229, 2.185463, 1, 0, 0, 1, 1,
1.198054, -0.8314461, 4.419078, 1, 0, 0, 1, 1,
1.200217, -0.4086799, 0.7331858, 1, 0, 0, 1, 1,
1.21308, -2.382185, 2.575395, 1, 0, 0, 1, 1,
1.213352, -0.07918006, 2.026417, 0, 0, 0, 1, 1,
1.214526, 1.367165, 1.085844, 0, 0, 0, 1, 1,
1.228772, 2.859316, -0.225752, 0, 0, 0, 1, 1,
1.239096, 0.3590541, 0.3453451, 0, 0, 0, 1, 1,
1.240395, 1.121555, 1.344506, 0, 0, 0, 1, 1,
1.242554, -1.077689, 1.181561, 0, 0, 0, 1, 1,
1.242686, -1.651415, 2.030948, 0, 0, 0, 1, 1,
1.248832, -1.168397, 2.664491, 1, 1, 1, 1, 1,
1.248936, -0.1051836, 2.310972, 1, 1, 1, 1, 1,
1.249541, 0.9697701, 1.202861, 1, 1, 1, 1, 1,
1.251237, -1.078335, 2.996993, 1, 1, 1, 1, 1,
1.253136, -1.269769, 3.196922, 1, 1, 1, 1, 1,
1.258191, 0.001562513, 2.132822, 1, 1, 1, 1, 1,
1.258229, -1.104739, 3.385979, 1, 1, 1, 1, 1,
1.259027, 0.2642713, 0.4252936, 1, 1, 1, 1, 1,
1.282133, -0.09798561, 2.180113, 1, 1, 1, 1, 1,
1.294246, -1.452646, 3.320423, 1, 1, 1, 1, 1,
1.298927, 1.184293, 1.333174, 1, 1, 1, 1, 1,
1.308809, -0.590132, 0.9405468, 1, 1, 1, 1, 1,
1.312776, 1.005297, 0.9070652, 1, 1, 1, 1, 1,
1.314277, 3.350121, 0.0721781, 1, 1, 1, 1, 1,
1.317801, 1.769645, 0.6726462, 1, 1, 1, 1, 1,
1.322474, 1.782774, -0.5299478, 0, 0, 1, 1, 1,
1.338855, 0.932795, 0.2442746, 1, 0, 0, 1, 1,
1.343452, 1.233251, 0.3592645, 1, 0, 0, 1, 1,
1.343966, -0.1309507, 1.54779, 1, 0, 0, 1, 1,
1.345025, 0.5833791, 0.6038632, 1, 0, 0, 1, 1,
1.364711, -0.1310342, 2.479095, 1, 0, 0, 1, 1,
1.367625, -2.414944, 3.368979, 0, 0, 0, 1, 1,
1.384959, 1.34604, 0.8018299, 0, 0, 0, 1, 1,
1.388942, 1.342398, -0.263423, 0, 0, 0, 1, 1,
1.392304, 1.599539, 0.8421773, 0, 0, 0, 1, 1,
1.394597, -0.5099055, 1.408456, 0, 0, 0, 1, 1,
1.402702, -1.229863, 2.344517, 0, 0, 0, 1, 1,
1.403473, -0.3063875, 1.368076, 0, 0, 0, 1, 1,
1.427733, -0.4684059, 1.218558, 1, 1, 1, 1, 1,
1.431296, -1.656651, 4.343875, 1, 1, 1, 1, 1,
1.437715, 0.4510856, 2.200758, 1, 1, 1, 1, 1,
1.44246, -1.347004, 2.932643, 1, 1, 1, 1, 1,
1.454023, 2.020628, -1.232568, 1, 1, 1, 1, 1,
1.459422, 0.3475717, 1.407043, 1, 1, 1, 1, 1,
1.459885, -1.290349, 3.094433, 1, 1, 1, 1, 1,
1.463749, 0.7116725, 1.588637, 1, 1, 1, 1, 1,
1.46404, -1.056932, 1.297253, 1, 1, 1, 1, 1,
1.469982, -0.7163856, 1.358606, 1, 1, 1, 1, 1,
1.479917, -0.2967964, 2.548902, 1, 1, 1, 1, 1,
1.485835, -0.6406959, 2.813176, 1, 1, 1, 1, 1,
1.526868, -0.02497004, 2.583467, 1, 1, 1, 1, 1,
1.531061, 0.2828359, 0.03081046, 1, 1, 1, 1, 1,
1.545516, -1.178861, 2.088692, 1, 1, 1, 1, 1,
1.546761, 0.1493442, 1.788155, 0, 0, 1, 1, 1,
1.583052, 0.04985072, 1.021002, 1, 0, 0, 1, 1,
1.592508, 0.7205484, 0.9896159, 1, 0, 0, 1, 1,
1.592781, -0.7542292, 1.036065, 1, 0, 0, 1, 1,
1.609929, 0.6594373, 2.608422, 1, 0, 0, 1, 1,
1.643154, 1.342264, 0.03716001, 1, 0, 0, 1, 1,
1.664163, -0.1007964, 2.199123, 0, 0, 0, 1, 1,
1.678707, 1.38242, 0.8544151, 0, 0, 0, 1, 1,
1.698942, 0.5721408, 3.21283, 0, 0, 0, 1, 1,
1.701002, -1.629622, 2.046036, 0, 0, 0, 1, 1,
1.709434, -0.9987715, 1.73473, 0, 0, 0, 1, 1,
1.712533, -1.061027, 2.225308, 0, 0, 0, 1, 1,
1.732127, -0.418464, 3.492045, 0, 0, 0, 1, 1,
1.735944, 0.8868932, 1.057211, 1, 1, 1, 1, 1,
1.746085, 1.064415, -0.2890604, 1, 1, 1, 1, 1,
1.756631, 0.06654483, 1.119283, 1, 1, 1, 1, 1,
1.76474, -0.5458537, 1.424092, 1, 1, 1, 1, 1,
1.778398, -0.2539708, 0.6163813, 1, 1, 1, 1, 1,
1.780837, 1.10329, 1.578781, 1, 1, 1, 1, 1,
1.788154, -0.6001971, 2.532576, 1, 1, 1, 1, 1,
1.800634, -0.9107585, 0.46548, 1, 1, 1, 1, 1,
1.834833, -1.691204, 4.726162, 1, 1, 1, 1, 1,
1.841781, 0.2852652, 1.229658, 1, 1, 1, 1, 1,
1.844175, -0.5279371, 0.8710219, 1, 1, 1, 1, 1,
1.851491, -1.086733, 1.28974, 1, 1, 1, 1, 1,
1.859759, 1.505023, 1.166736, 1, 1, 1, 1, 1,
1.861031, 0.6094875, 1.451085, 1, 1, 1, 1, 1,
1.88597, 0.7947102, 1.56634, 1, 1, 1, 1, 1,
1.896689, 0.2868424, -0.4153617, 0, 0, 1, 1, 1,
1.928034, 1.450372, 0.5928936, 1, 0, 0, 1, 1,
1.934399, 0.3391741, 2.392753, 1, 0, 0, 1, 1,
1.951207, -0.8070658, 2.182103, 1, 0, 0, 1, 1,
1.95824, 1.321983, 0.3850341, 1, 0, 0, 1, 1,
1.959688, 0.989099, 0.5295992, 1, 0, 0, 1, 1,
2.038119, -0.633855, 1.381437, 0, 0, 0, 1, 1,
2.066199, -1.001679, 1.022002, 0, 0, 0, 1, 1,
2.086991, -0.8138921, 2.899395, 0, 0, 0, 1, 1,
2.18469, -0.9303131, 1.797265, 0, 0, 0, 1, 1,
2.187836, 0.1722313, 3.339368, 0, 0, 0, 1, 1,
2.200045, -0.7739062, -0.6078462, 0, 0, 0, 1, 1,
2.233866, -0.805021, 0.6838495, 0, 0, 0, 1, 1,
2.257698, 1.55497, 1.034945, 1, 1, 1, 1, 1,
2.261683, -0.1138278, 2.800017, 1, 1, 1, 1, 1,
2.328377, 0.4911307, -0.4818087, 1, 1, 1, 1, 1,
2.73481, 0.09913667, 2.502728, 1, 1, 1, 1, 1,
2.947971, -0.1523651, 2.466057, 1, 1, 1, 1, 1,
3.308262, -1.031508, 1.293841, 1, 1, 1, 1, 1,
3.309941, 1.628605, 1.616799, 1, 1, 1, 1, 1
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
var radius = 9.649359;
var distance = 33.89296;
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
mvMatrix.translate( -0.2434301, -0.4401011, 0.2899315 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.89296);
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
