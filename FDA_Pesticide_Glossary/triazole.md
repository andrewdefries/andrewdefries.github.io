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
-3.159675, 0.6034165, -2.713533, 1, 0, 0, 1,
-3.080378, -0.2848424, -1.809798, 1, 0.007843138, 0, 1,
-3.042067, 1.082086, -1.252655, 1, 0.01176471, 0, 1,
-2.681472, -2.069851, -1.352236, 1, 0.01960784, 0, 1,
-2.487975, -0.9161284, -2.620308, 1, 0.02352941, 0, 1,
-2.432828, -2.073457, -3.277387, 1, 0.03137255, 0, 1,
-2.424889, 1.118947, -1.334857, 1, 0.03529412, 0, 1,
-2.396697, -0.3928638, -1.892074, 1, 0.04313726, 0, 1,
-2.380625, -0.7181119, -3.400053, 1, 0.04705882, 0, 1,
-2.365766, -0.00274302, -1.140081, 1, 0.05490196, 0, 1,
-2.275172, -0.1161989, -2.545087, 1, 0.05882353, 0, 1,
-2.26795, -0.616502, -0.761194, 1, 0.06666667, 0, 1,
-2.259984, -0.1144307, -2.103781, 1, 0.07058824, 0, 1,
-2.22711, -0.5478231, -2.106606, 1, 0.07843138, 0, 1,
-2.215065, -0.6083243, -3.147274, 1, 0.08235294, 0, 1,
-2.183058, 1.340402, 0.1790843, 1, 0.09019608, 0, 1,
-2.133014, -0.02851455, -1.018204, 1, 0.09411765, 0, 1,
-2.130208, 1.16008, -0.6556413, 1, 0.1019608, 0, 1,
-2.120219, -0.4971931, -3.050862, 1, 0.1098039, 0, 1,
-2.115126, -2.066536, -1.719354, 1, 0.1137255, 0, 1,
-2.08183, -0.8289557, 0.1663534, 1, 0.1215686, 0, 1,
-2.078435, -2.075893, -4.921116, 1, 0.1254902, 0, 1,
-2.040534, -0.04606225, -1.89097, 1, 0.1333333, 0, 1,
-2.012705, -0.1769436, -2.99073, 1, 0.1372549, 0, 1,
-2.005016, 0.6178265, -1.875789, 1, 0.145098, 0, 1,
-1.993654, -0.2861717, -1.565389, 1, 0.1490196, 0, 1,
-1.97549, -0.3099262, -0.8429832, 1, 0.1568628, 0, 1,
-1.968386, 1.107167, -0.5808324, 1, 0.1607843, 0, 1,
-1.93925, 0.142862, -1.277433, 1, 0.1686275, 0, 1,
-1.928497, -0.6710075, -4.130503, 1, 0.172549, 0, 1,
-1.889861, -0.2176082, -1.103001, 1, 0.1803922, 0, 1,
-1.870715, -0.7143151, -2.792158, 1, 0.1843137, 0, 1,
-1.838826, 0.7483661, -0.1298565, 1, 0.1921569, 0, 1,
-1.824224, -0.3170967, -0.5262371, 1, 0.1960784, 0, 1,
-1.814996, -0.9166694, -2.514655, 1, 0.2039216, 0, 1,
-1.813747, 0.9493564, -0.7348405, 1, 0.2117647, 0, 1,
-1.795853, -0.7771326, -0.4381954, 1, 0.2156863, 0, 1,
-1.780245, -1.338012, -2.821713, 1, 0.2235294, 0, 1,
-1.778003, -0.817307, -2.534472, 1, 0.227451, 0, 1,
-1.775553, -0.5545563, 0.6807641, 1, 0.2352941, 0, 1,
-1.767775, 1.541372, -0.7430173, 1, 0.2392157, 0, 1,
-1.751561, 0.1979724, -0.5414387, 1, 0.2470588, 0, 1,
-1.750784, -1.041522, -1.763939, 1, 0.2509804, 0, 1,
-1.745914, -2.644182, -3.563334, 1, 0.2588235, 0, 1,
-1.735274, -0.4231277, -0.7391524, 1, 0.2627451, 0, 1,
-1.731943, -0.02122867, -3.986641, 1, 0.2705882, 0, 1,
-1.705047, 0.7478251, -2.963597, 1, 0.2745098, 0, 1,
-1.703315, -0.1067632, -1.415454, 1, 0.282353, 0, 1,
-1.702766, -1.658707, -2.777789, 1, 0.2862745, 0, 1,
-1.687328, -0.508098, -3.02028, 1, 0.2941177, 0, 1,
-1.661405, -0.5961884, -0.3764008, 1, 0.3019608, 0, 1,
-1.655907, -0.4119408, -1.731135, 1, 0.3058824, 0, 1,
-1.652204, -0.6965064, -2.19154, 1, 0.3137255, 0, 1,
-1.646359, -0.4636496, -4.340851, 1, 0.3176471, 0, 1,
-1.640757, 0.3096513, 1.081247, 1, 0.3254902, 0, 1,
-1.62921, 0.5117304, -0.9570572, 1, 0.3294118, 0, 1,
-1.615106, 1.484941, -0.4734004, 1, 0.3372549, 0, 1,
-1.607235, -0.3044901, -1.957347, 1, 0.3411765, 0, 1,
-1.590627, 0.5370499, 1.200672, 1, 0.3490196, 0, 1,
-1.586162, -0.3554616, -0.693372, 1, 0.3529412, 0, 1,
-1.584168, -0.4448442, -2.033631, 1, 0.3607843, 0, 1,
-1.583522, -0.4173504, -1.978557, 1, 0.3647059, 0, 1,
-1.576998, 0.723472, -2.792377, 1, 0.372549, 0, 1,
-1.573696, 0.5186625, 0.2758026, 1, 0.3764706, 0, 1,
-1.57355, 0.8407679, -1.42771, 1, 0.3843137, 0, 1,
-1.565913, 0.633166, -0.9638128, 1, 0.3882353, 0, 1,
-1.556074, -0.514771, -1.886152, 1, 0.3960784, 0, 1,
-1.555135, -0.09114925, -1.411609, 1, 0.4039216, 0, 1,
-1.54865, 0.07577614, 0.3832807, 1, 0.4078431, 0, 1,
-1.543623, -0.1679395, -0.9024335, 1, 0.4156863, 0, 1,
-1.522738, 2.001477, -0.334926, 1, 0.4196078, 0, 1,
-1.519622, 0.2921132, -1.028469, 1, 0.427451, 0, 1,
-1.516238, 1.519667, 0.4521756, 1, 0.4313726, 0, 1,
-1.495145, -0.4681786, -2.841199, 1, 0.4392157, 0, 1,
-1.484373, -0.0838456, -2.575201, 1, 0.4431373, 0, 1,
-1.459703, -1.749132, -2.116539, 1, 0.4509804, 0, 1,
-1.456673, -0.2401509, -0.6081179, 1, 0.454902, 0, 1,
-1.448048, 0.400078, -1.244477, 1, 0.4627451, 0, 1,
-1.443619, 0.2889263, -0.9078767, 1, 0.4666667, 0, 1,
-1.436776, -0.8906551, -2.597759, 1, 0.4745098, 0, 1,
-1.430565, 0.8676037, -0.08408348, 1, 0.4784314, 0, 1,
-1.426843, 2.074064, -1.615872, 1, 0.4862745, 0, 1,
-1.417387, 1.549021, -2.047549, 1, 0.4901961, 0, 1,
-1.410335, 1.352697, -1.11526, 1, 0.4980392, 0, 1,
-1.406871, 0.2788386, -1.271235, 1, 0.5058824, 0, 1,
-1.402652, 0.1935594, -0.8869941, 1, 0.509804, 0, 1,
-1.391531, 1.970692, 0.3212767, 1, 0.5176471, 0, 1,
-1.388739, 0.09691815, -1.345925, 1, 0.5215687, 0, 1,
-1.376138, 0.03805063, -0.782643, 1, 0.5294118, 0, 1,
-1.335603, 1.188344, -2.173809, 1, 0.5333334, 0, 1,
-1.334752, -0.2336016, -1.666015, 1, 0.5411765, 0, 1,
-1.332704, -1.822826, -2.123642, 1, 0.5450981, 0, 1,
-1.317672, -1.04709, -0.8615856, 1, 0.5529412, 0, 1,
-1.31754, 0.1831324, -1.147014, 1, 0.5568628, 0, 1,
-1.317317, 1.569121, -1.337411, 1, 0.5647059, 0, 1,
-1.310126, -0.2109445, -2.121215, 1, 0.5686275, 0, 1,
-1.304614, 1.132122, -0.2270126, 1, 0.5764706, 0, 1,
-1.303339, -0.1318886, -3.237725, 1, 0.5803922, 0, 1,
-1.278654, -0.1502077, -1.740743, 1, 0.5882353, 0, 1,
-1.269861, 0.4497228, -2.778586, 1, 0.5921569, 0, 1,
-1.267516, 0.3445499, -0.5214775, 1, 0.6, 0, 1,
-1.264813, -1.304161, -1.086426, 1, 0.6078432, 0, 1,
-1.262077, 0.9617028, -0.2965544, 1, 0.6117647, 0, 1,
-1.260601, 1.918068, -0.5698522, 1, 0.6196079, 0, 1,
-1.26035, 0.4678311, -3.74104, 1, 0.6235294, 0, 1,
-1.2586, -1.012272, -3.128762, 1, 0.6313726, 0, 1,
-1.255415, -0.6659281, -1.057063, 1, 0.6352941, 0, 1,
-1.251595, -1.171698, -2.828661, 1, 0.6431373, 0, 1,
-1.25118, 0.6722875, -3.332859, 1, 0.6470588, 0, 1,
-1.249207, -0.01953099, -2.573504, 1, 0.654902, 0, 1,
-1.243601, 0.9364795, -0.1965777, 1, 0.6588235, 0, 1,
-1.241559, 0.5756935, -2.086438, 1, 0.6666667, 0, 1,
-1.225753, -2.554756, -2.116066, 1, 0.6705883, 0, 1,
-1.210185, 1.409311, -0.3179962, 1, 0.6784314, 0, 1,
-1.205903, 1.890855, -1.459404, 1, 0.682353, 0, 1,
-1.202965, 0.08134488, -0.4364503, 1, 0.6901961, 0, 1,
-1.200194, -0.6825532, -0.7451392, 1, 0.6941177, 0, 1,
-1.187856, -0.02736962, -0.1193013, 1, 0.7019608, 0, 1,
-1.185301, 0.1247931, -2.269339, 1, 0.7098039, 0, 1,
-1.182347, -0.3640515, -1.614351, 1, 0.7137255, 0, 1,
-1.180929, -0.678619, -2.228514, 1, 0.7215686, 0, 1,
-1.180451, -0.6646967, -2.453309, 1, 0.7254902, 0, 1,
-1.171778, 0.1183705, -1.53109, 1, 0.7333333, 0, 1,
-1.171775, 1.685175, -2.394247, 1, 0.7372549, 0, 1,
-1.163095, 0.4324522, -0.9784485, 1, 0.7450981, 0, 1,
-1.16222, -0.8568602, -0.3235553, 1, 0.7490196, 0, 1,
-1.162201, -2.372998, -2.430618, 1, 0.7568628, 0, 1,
-1.161794, 0.5263476, -0.8360197, 1, 0.7607843, 0, 1,
-1.160665, -0.7222968, -1.874317, 1, 0.7686275, 0, 1,
-1.160098, -0.5919161, -1.611326, 1, 0.772549, 0, 1,
-1.159207, -0.07686824, -1.740743, 1, 0.7803922, 0, 1,
-1.158188, -1.933716, -4.626921, 1, 0.7843137, 0, 1,
-1.129447, -1.272993, -1.006046, 1, 0.7921569, 0, 1,
-1.119004, -0.6535332, -1.931985, 1, 0.7960784, 0, 1,
-1.118093, 0.1150593, 0.3778143, 1, 0.8039216, 0, 1,
-1.116839, 0.9417316, -0.3151322, 1, 0.8117647, 0, 1,
-1.107332, 0.23266, -1.75929, 1, 0.8156863, 0, 1,
-1.102226, 1.150457, -0.7794324, 1, 0.8235294, 0, 1,
-1.097333, 1.494118, -0.3875915, 1, 0.827451, 0, 1,
-1.094192, 1.458246, 0.1251115, 1, 0.8352941, 0, 1,
-1.085263, 2.210907, -0.5208083, 1, 0.8392157, 0, 1,
-1.080218, 0.9130082, -0.8742718, 1, 0.8470588, 0, 1,
-1.077512, 0.1730847, -1.437282, 1, 0.8509804, 0, 1,
-1.076272, 0.3809721, -0.7888218, 1, 0.8588235, 0, 1,
-1.074678, 0.2659649, -0.8317198, 1, 0.8627451, 0, 1,
-1.074227, 0.6285947, 0.08352266, 1, 0.8705882, 0, 1,
-1.072117, 1.323599, -1.13069, 1, 0.8745098, 0, 1,
-1.067673, 2.071994, -0.4263915, 1, 0.8823529, 0, 1,
-1.064891, -0.2560036, -1.278478, 1, 0.8862745, 0, 1,
-1.062822, 0.5417764, -1.922297, 1, 0.8941177, 0, 1,
-1.060968, -2.326811, -2.120939, 1, 0.8980392, 0, 1,
-1.056839, 0.6854113, 0.5614586, 1, 0.9058824, 0, 1,
-1.052451, 1.430671, -1.216546, 1, 0.9137255, 0, 1,
-1.04975, -1.1399, -2.683624, 1, 0.9176471, 0, 1,
-1.038595, 1.203919, -1.18778, 1, 0.9254902, 0, 1,
-1.037794, 0.1886382, -3.087747, 1, 0.9294118, 0, 1,
-1.037434, 0.004624776, -1.314025, 1, 0.9372549, 0, 1,
-1.033513, 1.287298, -0.05450359, 1, 0.9411765, 0, 1,
-1.03064, -1.311504, -2.823431, 1, 0.9490196, 0, 1,
-1.029206, -0.1440511, -2.946209, 1, 0.9529412, 0, 1,
-1.020141, 1.380837, -1.773188, 1, 0.9607843, 0, 1,
-1.017607, -0.3032391, -2.499726, 1, 0.9647059, 0, 1,
-1.016401, 0.8062909, 0.1343622, 1, 0.972549, 0, 1,
-1.011487, 1.061624, 0.136222, 1, 0.9764706, 0, 1,
-1.010775, -0.6218725, -2.894963, 1, 0.9843137, 0, 1,
-1.005969, 1.309478, -2.486108, 1, 0.9882353, 0, 1,
-0.9895334, -0.1824048, -0.9423622, 1, 0.9960784, 0, 1,
-0.9863899, -0.1046914, -2.957355, 0.9960784, 1, 0, 1,
-0.9811533, -0.01400374, -1.575108, 0.9921569, 1, 0, 1,
-0.9703757, -1.581888, -3.076484, 0.9843137, 1, 0, 1,
-0.9678728, 1.995815, -0.3581077, 0.9803922, 1, 0, 1,
-0.967846, -1.501937, -2.652848, 0.972549, 1, 0, 1,
-0.9673145, 2.134463, -1.751766, 0.9686275, 1, 0, 1,
-0.9617593, 0.2600066, -0.8685457, 0.9607843, 1, 0, 1,
-0.9613887, 0.4721268, -0.9928819, 0.9568627, 1, 0, 1,
-0.9555139, 0.4421995, -1.991351, 0.9490196, 1, 0, 1,
-0.9426628, -0.1939435, -0.6772062, 0.945098, 1, 0, 1,
-0.9337757, 0.9059607, -1.448621, 0.9372549, 1, 0, 1,
-0.9302444, -0.5746377, -3.162992, 0.9333333, 1, 0, 1,
-0.9290611, 0.6025093, 0.5853863, 0.9254902, 1, 0, 1,
-0.9282561, -0.3019663, -1.462395, 0.9215686, 1, 0, 1,
-0.9252445, 1.837123, -0.5656731, 0.9137255, 1, 0, 1,
-0.92018, -0.622273, -2.058377, 0.9098039, 1, 0, 1,
-0.9185904, -1.144703, -2.843734, 0.9019608, 1, 0, 1,
-0.9132726, -0.09740041, -2.069462, 0.8941177, 1, 0, 1,
-0.9126316, 1.385692, -1.507804, 0.8901961, 1, 0, 1,
-0.903186, 0.5058855, -0.1789271, 0.8823529, 1, 0, 1,
-0.9001088, 0.7770552, -0.2785182, 0.8784314, 1, 0, 1,
-0.8995056, -1.055052, -2.496707, 0.8705882, 1, 0, 1,
-0.8968788, 0.8150651, -0.7979355, 0.8666667, 1, 0, 1,
-0.8893294, -1.379977, -3.973196, 0.8588235, 1, 0, 1,
-0.8743952, -0.1446902, -2.986209, 0.854902, 1, 0, 1,
-0.8735451, 0.04537921, -1.102635, 0.8470588, 1, 0, 1,
-0.8663472, 0.3550118, -1.199212, 0.8431373, 1, 0, 1,
-0.863528, 1.58736, -0.09283499, 0.8352941, 1, 0, 1,
-0.8612598, 0.05691067, -2.437077, 0.8313726, 1, 0, 1,
-0.8543311, 0.9188708, 0.1787248, 0.8235294, 1, 0, 1,
-0.8535755, 2.786665, -0.4689836, 0.8196079, 1, 0, 1,
-0.8519803, -0.2848735, -3.61584, 0.8117647, 1, 0, 1,
-0.8487635, 0.5596471, -2.911494, 0.8078431, 1, 0, 1,
-0.8441524, 1.101892, -1.245296, 0.8, 1, 0, 1,
-0.8400822, -0.3247612, -1.22321, 0.7921569, 1, 0, 1,
-0.8390926, -0.7627498, -2.67523, 0.7882353, 1, 0, 1,
-0.8371658, -1.841277, -1.72985, 0.7803922, 1, 0, 1,
-0.8327516, -0.3152493, -2.994782, 0.7764706, 1, 0, 1,
-0.8277718, 2.39302, 0.3293509, 0.7686275, 1, 0, 1,
-0.8091011, 1.326874, -1.770691, 0.7647059, 1, 0, 1,
-0.8087642, 1.189983, 0.3177567, 0.7568628, 1, 0, 1,
-0.8068373, -1.008865, -2.665635, 0.7529412, 1, 0, 1,
-0.8043104, 0.9196026, -0.05736749, 0.7450981, 1, 0, 1,
-0.800916, 0.08274323, -0.546313, 0.7411765, 1, 0, 1,
-0.795781, -0.01669405, -2.30082, 0.7333333, 1, 0, 1,
-0.7955723, 1.106343, -2.330611, 0.7294118, 1, 0, 1,
-0.792848, 1.885177, -0.6559348, 0.7215686, 1, 0, 1,
-0.7921555, -0.8682424, -2.849993, 0.7176471, 1, 0, 1,
-0.7908961, -0.1741905, -4.447422, 0.7098039, 1, 0, 1,
-0.7881947, 1.271332, 0.3371826, 0.7058824, 1, 0, 1,
-0.787369, 0.5530059, -1.926862, 0.6980392, 1, 0, 1,
-0.7734571, 0.2165785, -0.4438591, 0.6901961, 1, 0, 1,
-0.772001, -1.390128, -4.138443, 0.6862745, 1, 0, 1,
-0.7697186, 0.3959982, -0.8503514, 0.6784314, 1, 0, 1,
-0.7693563, 0.222849, -0.9727567, 0.6745098, 1, 0, 1,
-0.7681824, -0.8947179, -2.804576, 0.6666667, 1, 0, 1,
-0.7648658, 0.02838242, -1.046867, 0.6627451, 1, 0, 1,
-0.7638003, -0.2443904, -1.297469, 0.654902, 1, 0, 1,
-0.7607095, 0.1891312, 1.387685, 0.6509804, 1, 0, 1,
-0.7566836, 1.155313, 0.1861578, 0.6431373, 1, 0, 1,
-0.7543736, 1.486903, 0.2922357, 0.6392157, 1, 0, 1,
-0.7412412, 0.4492078, -0.6642452, 0.6313726, 1, 0, 1,
-0.7324823, 1.107311, 0.3346046, 0.627451, 1, 0, 1,
-0.7321366, 0.3904966, -0.8388405, 0.6196079, 1, 0, 1,
-0.7265615, 1.479377, 1.244834, 0.6156863, 1, 0, 1,
-0.7258992, -0.1564585, -1.561414, 0.6078432, 1, 0, 1,
-0.7207372, -0.3685347, -3.154296, 0.6039216, 1, 0, 1,
-0.71999, -0.452616, -4.137677, 0.5960785, 1, 0, 1,
-0.7152127, -1.180629, -2.813097, 0.5882353, 1, 0, 1,
-0.712136, -0.4465649, -2.709592, 0.5843138, 1, 0, 1,
-0.709237, 0.7729769, -0.0954849, 0.5764706, 1, 0, 1,
-0.707921, 0.2096904, -0.8807782, 0.572549, 1, 0, 1,
-0.7076927, -1.574476, -2.710453, 0.5647059, 1, 0, 1,
-0.7064966, 1.655877, -0.8579093, 0.5607843, 1, 0, 1,
-0.7064127, 0.1056246, -0.254016, 0.5529412, 1, 0, 1,
-0.6978115, 0.8039972, -0.7474814, 0.5490196, 1, 0, 1,
-0.6934298, 0.8944728, 0.7714552, 0.5411765, 1, 0, 1,
-0.6880571, -0.366482, -0.9713137, 0.5372549, 1, 0, 1,
-0.6879663, 0.5174475, 0.2055032, 0.5294118, 1, 0, 1,
-0.6845229, 1.013467, 1.73209, 0.5254902, 1, 0, 1,
-0.6816898, 0.5186501, -2.235576, 0.5176471, 1, 0, 1,
-0.6790533, 0.1813912, -0.6192455, 0.5137255, 1, 0, 1,
-0.6756721, 2.135918, -0.6976928, 0.5058824, 1, 0, 1,
-0.6724064, -0.5679786, -1.769388, 0.5019608, 1, 0, 1,
-0.6714786, -0.8739728, -2.006198, 0.4941176, 1, 0, 1,
-0.6713989, 0.3888667, -2.792479, 0.4862745, 1, 0, 1,
-0.6688746, -0.3055835, -2.320346, 0.4823529, 1, 0, 1,
-0.6620522, -1.962802, -2.620779, 0.4745098, 1, 0, 1,
-0.661159, 0.5436648, -0.792646, 0.4705882, 1, 0, 1,
-0.6596975, 0.4662606, -0.1512128, 0.4627451, 1, 0, 1,
-0.6594153, -0.7785534, -3.355307, 0.4588235, 1, 0, 1,
-0.6587123, -0.4368673, -1.582999, 0.4509804, 1, 0, 1,
-0.6557032, -1.603076, -1.905542, 0.4470588, 1, 0, 1,
-0.6488401, 0.2113156, -1.446172, 0.4392157, 1, 0, 1,
-0.6473031, -0.264784, -1.841443, 0.4352941, 1, 0, 1,
-0.6358663, 0.7896683, -1.312705, 0.427451, 1, 0, 1,
-0.6342337, 1.658549, -0.2718592, 0.4235294, 1, 0, 1,
-0.6275365, 0.6307147, -0.03490363, 0.4156863, 1, 0, 1,
-0.6271693, -0.6072763, -2.534301, 0.4117647, 1, 0, 1,
-0.6257797, 0.08740839, -2.83915, 0.4039216, 1, 0, 1,
-0.6233447, 0.7996322, -0.5328143, 0.3960784, 1, 0, 1,
-0.6184492, 2.825343, 0.3890632, 0.3921569, 1, 0, 1,
-0.6146812, 0.1367094, -1.659024, 0.3843137, 1, 0, 1,
-0.6129497, -0.9496093, -4.615112, 0.3803922, 1, 0, 1,
-0.612508, -0.8898351, -4.065988, 0.372549, 1, 0, 1,
-0.6104794, -1.004167, -1.744493, 0.3686275, 1, 0, 1,
-0.6061863, 0.1209986, -1.795941, 0.3607843, 1, 0, 1,
-0.6022196, 1.126179, 0.5855922, 0.3568628, 1, 0, 1,
-0.6021468, 0.09055381, -0.363805, 0.3490196, 1, 0, 1,
-0.6008723, -0.5485819, -2.710808, 0.345098, 1, 0, 1,
-0.6005902, -1.169995, -1.496621, 0.3372549, 1, 0, 1,
-0.597039, -0.6240886, -4.38305, 0.3333333, 1, 0, 1,
-0.5902784, -0.3551455, -1.853686, 0.3254902, 1, 0, 1,
-0.5900291, 0.7420264, -0.4382865, 0.3215686, 1, 0, 1,
-0.5898769, -1.06006, -2.526359, 0.3137255, 1, 0, 1,
-0.5883659, 1.582371, 0.712293, 0.3098039, 1, 0, 1,
-0.5867402, 2.157998, 0.4199362, 0.3019608, 1, 0, 1,
-0.5853112, 0.9497339, -1.289875, 0.2941177, 1, 0, 1,
-0.5801581, 0.4253473, -0.6685514, 0.2901961, 1, 0, 1,
-0.579814, 1.192825, -1.263745, 0.282353, 1, 0, 1,
-0.578747, 0.6134245, -2.2025, 0.2784314, 1, 0, 1,
-0.5786313, 0.2981434, -1.930488, 0.2705882, 1, 0, 1,
-0.5750871, 0.9565297, -1.308685, 0.2666667, 1, 0, 1,
-0.572814, -0.8711532, -4.80801, 0.2588235, 1, 0, 1,
-0.5704201, 0.9580304, 1.075557, 0.254902, 1, 0, 1,
-0.5667158, -1.449128, -1.241125, 0.2470588, 1, 0, 1,
-0.5596591, -0.9212624, -0.2682529, 0.2431373, 1, 0, 1,
-0.5572342, 2.729798, -1.294969, 0.2352941, 1, 0, 1,
-0.5554664, -0.8943412, -3.825599, 0.2313726, 1, 0, 1,
-0.5526953, -0.6813736, -2.277682, 0.2235294, 1, 0, 1,
-0.5390365, -0.4811205, -0.2618799, 0.2196078, 1, 0, 1,
-0.5379433, -1.235756, -1.769379, 0.2117647, 1, 0, 1,
-0.5372378, -0.03626402, -1.445794, 0.2078431, 1, 0, 1,
-0.5358013, 0.9818208, 0.7658095, 0.2, 1, 0, 1,
-0.5286467, 0.5871642, -1.01513, 0.1921569, 1, 0, 1,
-0.5186896, -0.3645734, -3.192636, 0.1882353, 1, 0, 1,
-0.5099908, 0.5136023, -0.9853153, 0.1803922, 1, 0, 1,
-0.503208, 0.3292969, -1.161442, 0.1764706, 1, 0, 1,
-0.5031324, 0.2194601, -0.5942658, 0.1686275, 1, 0, 1,
-0.5000889, 0.2426425, -0.7117914, 0.1647059, 1, 0, 1,
-0.4991094, 2.461964, -1.079578, 0.1568628, 1, 0, 1,
-0.4987394, 0.05543192, -0.5879987, 0.1529412, 1, 0, 1,
-0.4921359, 1.735278, -0.9193335, 0.145098, 1, 0, 1,
-0.490707, 1.815541, -2.316058, 0.1411765, 1, 0, 1,
-0.4899748, -1.362689, -2.729865, 0.1333333, 1, 0, 1,
-0.4869969, 2.914162, -1.634611, 0.1294118, 1, 0, 1,
-0.4865996, -1.207477, -2.525239, 0.1215686, 1, 0, 1,
-0.4853129, 0.04327917, -2.926976, 0.1176471, 1, 0, 1,
-0.4850237, -0.5308225, -0.4115649, 0.1098039, 1, 0, 1,
-0.4836953, 0.2889031, -1.504259, 0.1058824, 1, 0, 1,
-0.4797371, 2.193272, -1.588411, 0.09803922, 1, 0, 1,
-0.4777665, 1.645325, 0.219091, 0.09019608, 1, 0, 1,
-0.4775211, -0.5446302, -3.112557, 0.08627451, 1, 0, 1,
-0.4767897, -0.08397488, 0.2861702, 0.07843138, 1, 0, 1,
-0.4761301, 1.517531, 0.2187321, 0.07450981, 1, 0, 1,
-0.4680788, -0.6770651, -2.196209, 0.06666667, 1, 0, 1,
-0.4659891, 0.02214842, -1.088181, 0.0627451, 1, 0, 1,
-0.4650664, 0.7432245, -0.7567413, 0.05490196, 1, 0, 1,
-0.4590758, 0.9566967, -0.9898491, 0.05098039, 1, 0, 1,
-0.4562871, -0.4570108, -3.493453, 0.04313726, 1, 0, 1,
-0.4559108, -0.1104935, -0.08753068, 0.03921569, 1, 0, 1,
-0.4558572, -1.328274, -3.157105, 0.03137255, 1, 0, 1,
-0.4549768, 0.4142701, -0.5990562, 0.02745098, 1, 0, 1,
-0.4513347, -2.336387, -3.169609, 0.01960784, 1, 0, 1,
-0.4499474, -0.2743388, -1.530548, 0.01568628, 1, 0, 1,
-0.4464824, 1.35073, 0.1847037, 0.007843138, 1, 0, 1,
-0.4453993, -0.05449073, -1.655715, 0.003921569, 1, 0, 1,
-0.4446028, 0.5707316, 0.4181575, 0, 1, 0.003921569, 1,
-0.4426428, 0.1956851, -1.792876, 0, 1, 0.01176471, 1,
-0.4284867, 0.2007473, -2.148828, 0, 1, 0.01568628, 1,
-0.4281969, 0.566402, -0.9943907, 0, 1, 0.02352941, 1,
-0.4276271, -0.5193419, -1.851469, 0, 1, 0.02745098, 1,
-0.4097894, -0.45597, -3.960824, 0, 1, 0.03529412, 1,
-0.4021075, 2.368955, -0.1187239, 0, 1, 0.03921569, 1,
-0.3955918, -0.3943636, -1.853542, 0, 1, 0.04705882, 1,
-0.3923088, -0.3903148, -2.309572, 0, 1, 0.05098039, 1,
-0.3913686, -1.642146, -3.478276, 0, 1, 0.05882353, 1,
-0.3814766, -2.147712, -0.5490817, 0, 1, 0.0627451, 1,
-0.3797144, 0.0884658, -1.708975, 0, 1, 0.07058824, 1,
-0.3767511, -1.260406, -4.073146, 0, 1, 0.07450981, 1,
-0.376008, 0.404406, -0.2166306, 0, 1, 0.08235294, 1,
-0.3725877, -1.131975, -2.641746, 0, 1, 0.08627451, 1,
-0.3724782, -1.225184, -2.729388, 0, 1, 0.09411765, 1,
-0.3712795, -0.8573086, -1.951629, 0, 1, 0.1019608, 1,
-0.3686421, 2.191328, 0.4831039, 0, 1, 0.1058824, 1,
-0.3677289, -2.073208, -2.748114, 0, 1, 0.1137255, 1,
-0.3653734, -0.805627, -3.427931, 0, 1, 0.1176471, 1,
-0.357951, 0.3950217, 0.06749207, 0, 1, 0.1254902, 1,
-0.3552779, 0.1650236, -2.130781, 0, 1, 0.1294118, 1,
-0.3546665, -0.330607, -1.957861, 0, 1, 0.1372549, 1,
-0.3460014, 0.1068766, -1.814689, 0, 1, 0.1411765, 1,
-0.3449393, -0.2264354, -3.282506, 0, 1, 0.1490196, 1,
-0.3442306, -0.7683463, -3.153471, 0, 1, 0.1529412, 1,
-0.3417891, -0.5933955, -2.769329, 0, 1, 0.1607843, 1,
-0.3407692, -0.1077492, -2.836574, 0, 1, 0.1647059, 1,
-0.3399736, -0.2742582, -2.244034, 0, 1, 0.172549, 1,
-0.338395, -0.2165478, -1.294164, 0, 1, 0.1764706, 1,
-0.3369748, 0.3110334, 0.1035221, 0, 1, 0.1843137, 1,
-0.3348568, 0.9201382, -0.9361098, 0, 1, 0.1882353, 1,
-0.334525, 0.1468891, -0.04254245, 0, 1, 0.1960784, 1,
-0.3332343, 0.2339826, -2.293239, 0, 1, 0.2039216, 1,
-0.3321668, -0.7669708, -3.203673, 0, 1, 0.2078431, 1,
-0.3299962, -1.197868, -3.359113, 0, 1, 0.2156863, 1,
-0.3213365, -0.8573366, -3.845016, 0, 1, 0.2196078, 1,
-0.3206289, -0.8321537, -1.087345, 0, 1, 0.227451, 1,
-0.3127362, 1.51126, 0.3143278, 0, 1, 0.2313726, 1,
-0.3122638, 0.08864454, -1.540919, 0, 1, 0.2392157, 1,
-0.3079606, -0.5933547, -2.087001, 0, 1, 0.2431373, 1,
-0.307351, 1.893656, -0.8723788, 0, 1, 0.2509804, 1,
-0.3024132, 0.0347886, -0.9743521, 0, 1, 0.254902, 1,
-0.2990739, 0.04775636, -2.711026, 0, 1, 0.2627451, 1,
-0.2960934, -1.043613, -3.398983, 0, 1, 0.2666667, 1,
-0.292165, -0.5951407, -3.663558, 0, 1, 0.2745098, 1,
-0.2894968, -0.03460744, -0.9896086, 0, 1, 0.2784314, 1,
-0.2884204, 1.726008, 2.089149, 0, 1, 0.2862745, 1,
-0.2849503, 0.09285904, -1.710683, 0, 1, 0.2901961, 1,
-0.2846585, 0.07830802, -0.9861853, 0, 1, 0.2980392, 1,
-0.2820266, -0.7183251, -5.639339, 0, 1, 0.3058824, 1,
-0.2808825, 0.4322554, -1.381685, 0, 1, 0.3098039, 1,
-0.273842, -2.516355, -2.815941, 0, 1, 0.3176471, 1,
-0.2729516, -2.168181, -1.995381, 0, 1, 0.3215686, 1,
-0.2672727, 1.737307, -0.4667263, 0, 1, 0.3294118, 1,
-0.2633556, -0.1091351, -1.752972, 0, 1, 0.3333333, 1,
-0.2562291, 1.338831, -0.07162554, 0, 1, 0.3411765, 1,
-0.2537632, -0.1302541, -1.927228, 0, 1, 0.345098, 1,
-0.2529742, 2.37524, -0.8916849, 0, 1, 0.3529412, 1,
-0.2491581, 1.205426, -0.4626221, 0, 1, 0.3568628, 1,
-0.2489285, -0.2257082, -0.7444158, 0, 1, 0.3647059, 1,
-0.2451788, -0.5867668, -3.903334, 0, 1, 0.3686275, 1,
-0.2429148, 2.399726, 0.3330621, 0, 1, 0.3764706, 1,
-0.2376936, -0.4068244, -1.083873, 0, 1, 0.3803922, 1,
-0.2361796, 0.3659667, 0.2748666, 0, 1, 0.3882353, 1,
-0.2268936, -2.81829, -2.003695, 0, 1, 0.3921569, 1,
-0.224111, 1.229175, -2.056003, 0, 1, 0.4, 1,
-0.2222345, -1.139117, -2.770512, 0, 1, 0.4078431, 1,
-0.2214703, 1.37766, 0.1700778, 0, 1, 0.4117647, 1,
-0.2210365, 0.7939598, -1.081824, 0, 1, 0.4196078, 1,
-0.2206658, -1.097323, -2.369621, 0, 1, 0.4235294, 1,
-0.218295, 1.85595, 0.06783696, 0, 1, 0.4313726, 1,
-0.2179893, -2.214491, -2.670403, 0, 1, 0.4352941, 1,
-0.2174255, -1.474462, -3.913763, 0, 1, 0.4431373, 1,
-0.2158108, -0.5856307, -4.650317, 0, 1, 0.4470588, 1,
-0.2141464, -1.089592, -5.36422, 0, 1, 0.454902, 1,
-0.2138311, -1.09289, -3.164621, 0, 1, 0.4588235, 1,
-0.2118768, 1.121295, 0.7909868, 0, 1, 0.4666667, 1,
-0.2107428, -1.323903, -3.132447, 0, 1, 0.4705882, 1,
-0.2101422, -0.8487436, -3.356939, 0, 1, 0.4784314, 1,
-0.2066091, -0.7920993, -2.247236, 0, 1, 0.4823529, 1,
-0.2062496, 2.425793, 0.3534011, 0, 1, 0.4901961, 1,
-0.2038186, -0.04668187, -1.029027, 0, 1, 0.4941176, 1,
-0.1996862, -0.7948337, -4.535141, 0, 1, 0.5019608, 1,
-0.1991263, 0.3561208, 0.6911193, 0, 1, 0.509804, 1,
-0.1973491, -0.9945548, -3.007626, 0, 1, 0.5137255, 1,
-0.1934928, -0.2844515, -0.3678894, 0, 1, 0.5215687, 1,
-0.1910557, -1.840072, -4.002624, 0, 1, 0.5254902, 1,
-0.1841719, -0.6167835, -3.120148, 0, 1, 0.5333334, 1,
-0.1794992, 1.412959, -0.02168355, 0, 1, 0.5372549, 1,
-0.1714411, 0.2788453, 1.260588, 0, 1, 0.5450981, 1,
-0.1713461, 0.6939766, -1.564498, 0, 1, 0.5490196, 1,
-0.1685913, -0.3761391, -2.982783, 0, 1, 0.5568628, 1,
-0.166102, 0.6973934, 0.5249235, 0, 1, 0.5607843, 1,
-0.1656778, -0.2075402, -1.433064, 0, 1, 0.5686275, 1,
-0.165149, -1.277875, -2.441509, 0, 1, 0.572549, 1,
-0.1614797, 2.340168, 0.3062835, 0, 1, 0.5803922, 1,
-0.1586805, -0.9234631, -3.777571, 0, 1, 0.5843138, 1,
-0.1579981, 1.415214, -1.02821, 0, 1, 0.5921569, 1,
-0.1546048, -0.9652474, -2.848307, 0, 1, 0.5960785, 1,
-0.1540524, -0.5427197, -1.905119, 0, 1, 0.6039216, 1,
-0.1537327, -0.2407934, -1.768237, 0, 1, 0.6117647, 1,
-0.1505015, 0.3472481, 0.4087977, 0, 1, 0.6156863, 1,
-0.1466233, -0.1803351, -2.227608, 0, 1, 0.6235294, 1,
-0.1453776, 0.8945035, 0.1796471, 0, 1, 0.627451, 1,
-0.1434735, -1.404706, -4.790549, 0, 1, 0.6352941, 1,
-0.1394627, -1.586562, -4.086129, 0, 1, 0.6392157, 1,
-0.1394383, 0.3846361, -1.021837, 0, 1, 0.6470588, 1,
-0.1391095, 0.7163849, -0.3267093, 0, 1, 0.6509804, 1,
-0.1344885, 1.056668, 0.002922966, 0, 1, 0.6588235, 1,
-0.1324857, 0.2052611, -0.2288569, 0, 1, 0.6627451, 1,
-0.1314061, -0.5415422, -2.80988, 0, 1, 0.6705883, 1,
-0.1302863, 1.355773, 1.125598, 0, 1, 0.6745098, 1,
-0.1296643, -0.4173273, -4.213371, 0, 1, 0.682353, 1,
-0.123967, -1.140554, -2.79957, 0, 1, 0.6862745, 1,
-0.1218083, -0.3483868, -2.555027, 0, 1, 0.6941177, 1,
-0.1155929, -0.5401325, -5.457437, 0, 1, 0.7019608, 1,
-0.1132272, -0.634017, -2.496828, 0, 1, 0.7058824, 1,
-0.1120192, -1.050799, -4.549723, 0, 1, 0.7137255, 1,
-0.1096088, 0.6409004, -0.5920311, 0, 1, 0.7176471, 1,
-0.1084397, -0.1115328, -0.9698595, 0, 1, 0.7254902, 1,
-0.1042042, -0.3031594, -2.415664, 0, 1, 0.7294118, 1,
-0.1010802, 0.9270708, 0.3558224, 0, 1, 0.7372549, 1,
-0.1009542, 0.8714762, -1.327267, 0, 1, 0.7411765, 1,
-0.09960669, 1.841265, 0.02654572, 0, 1, 0.7490196, 1,
-0.09941965, 0.9362574, -1.335121, 0, 1, 0.7529412, 1,
-0.09704616, -1.288812, -2.219402, 0, 1, 0.7607843, 1,
-0.09700828, 0.6939715, 0.3610529, 0, 1, 0.7647059, 1,
-0.09534878, -0.9284011, -3.265874, 0, 1, 0.772549, 1,
-0.09498711, -0.1418761, -3.277144, 0, 1, 0.7764706, 1,
-0.09108279, -1.618029, -2.84362, 0, 1, 0.7843137, 1,
-0.0897602, -0.1441244, -3.921849, 0, 1, 0.7882353, 1,
-0.08696185, 0.5268279, 0.2880091, 0, 1, 0.7960784, 1,
-0.08667441, -0.8397027, -4.593372, 0, 1, 0.8039216, 1,
-0.08509941, -0.4894338, -0.7530978, 0, 1, 0.8078431, 1,
-0.08303519, 0.628921, 1.619894, 0, 1, 0.8156863, 1,
-0.07869028, 1.632506, -0.09306383, 0, 1, 0.8196079, 1,
-0.07835175, 0.7810899, -0.4315382, 0, 1, 0.827451, 1,
-0.07814118, 1.068451, 1.883737, 0, 1, 0.8313726, 1,
-0.07188322, -0.9394587, -3.364824, 0, 1, 0.8392157, 1,
-0.06852438, -0.2754616, -3.028667, 0, 1, 0.8431373, 1,
-0.06846383, 1.269427, -2.008177, 0, 1, 0.8509804, 1,
-0.06758527, 0.509256, -2.77004, 0, 1, 0.854902, 1,
-0.06528033, -0.1937388, -1.388939, 0, 1, 0.8627451, 1,
-0.05723706, 1.188342, 0.4748802, 0, 1, 0.8666667, 1,
-0.04954691, -0.8328918, -2.162323, 0, 1, 0.8745098, 1,
-0.04618626, 0.07288318, 0.4243444, 0, 1, 0.8784314, 1,
-0.04291563, -0.2539365, -5.121603, 0, 1, 0.8862745, 1,
-0.0417183, 1.083959, -1.385112, 0, 1, 0.8901961, 1,
-0.04153195, 0.6660737, -0.5494354, 0, 1, 0.8980392, 1,
-0.03877167, -1.240049, -1.475368, 0, 1, 0.9058824, 1,
-0.03821915, 0.6733397, 0.7843407, 0, 1, 0.9098039, 1,
-0.03763393, 0.4824919, -0.5246015, 0, 1, 0.9176471, 1,
-0.0361603, 0.4396607, -0.576985, 0, 1, 0.9215686, 1,
-0.03169781, -0.5959857, -1.482543, 0, 1, 0.9294118, 1,
-0.02674267, -0.8399842, -3.699596, 0, 1, 0.9333333, 1,
-0.02657567, -1.428377, -3.253037, 0, 1, 0.9411765, 1,
-0.02583699, -0.6574301, -2.410909, 0, 1, 0.945098, 1,
-0.02187118, 0.5899671, -0.9190291, 0, 1, 0.9529412, 1,
-0.02118392, -0.1501457, -4.063139, 0, 1, 0.9568627, 1,
-0.01774713, -1.407445, -2.330545, 0, 1, 0.9647059, 1,
-0.01622852, 0.350879, -0.185754, 0, 1, 0.9686275, 1,
-0.00826595, -0.574415, -1.314359, 0, 1, 0.9764706, 1,
-0.007565831, -1.309484, -3.227048, 0, 1, 0.9803922, 1,
-0.003981688, -1.177392, -4.147304, 0, 1, 0.9882353, 1,
-0.003665489, 1.062583, 1.317093, 0, 1, 0.9921569, 1,
-0.00295613, -0.0139638, -3.853298, 0, 1, 1, 1,
0.001046408, -0.6465645, 2.012637, 0, 0.9921569, 1, 1,
0.006609775, 0.6247776, -0.1084029, 0, 0.9882353, 1, 1,
0.008634092, 0.3340574, 0.6108915, 0, 0.9803922, 1, 1,
0.01504729, -1.913435, 3.804047, 0, 0.9764706, 1, 1,
0.01507117, -0.8103793, 1.583112, 0, 0.9686275, 1, 1,
0.01686542, 1.336911, 2.527938, 0, 0.9647059, 1, 1,
0.01856637, -0.7958872, 4.5006, 0, 0.9568627, 1, 1,
0.01963837, -0.06198149, 3.261446, 0, 0.9529412, 1, 1,
0.03133769, -0.2653249, 1.744838, 0, 0.945098, 1, 1,
0.0324096, -0.5621253, 2.828383, 0, 0.9411765, 1, 1,
0.0331435, 0.7350704, -0.40968, 0, 0.9333333, 1, 1,
0.03438001, 0.2404904, 0.09478546, 0, 0.9294118, 1, 1,
0.03627015, -1.609532, 2.010431, 0, 0.9215686, 1, 1,
0.04757447, -0.8279148, 3.683674, 0, 0.9176471, 1, 1,
0.05171127, 2.269895, -0.2952675, 0, 0.9098039, 1, 1,
0.05197408, -0.0219678, 2.777296, 0, 0.9058824, 1, 1,
0.0559707, 2.386861, -1.66133, 0, 0.8980392, 1, 1,
0.05782272, 0.5993102, 0.5160742, 0, 0.8901961, 1, 1,
0.06043161, -0.4260577, 5.786831, 0, 0.8862745, 1, 1,
0.06344657, -0.9910269, 3.217802, 0, 0.8784314, 1, 1,
0.06604376, -1.088814, 1.331788, 0, 0.8745098, 1, 1,
0.077168, -0.6766043, 1.888727, 0, 0.8666667, 1, 1,
0.07717216, 0.4341184, 0.07393164, 0, 0.8627451, 1, 1,
0.08029094, 0.3347513, -0.05513357, 0, 0.854902, 1, 1,
0.08179823, -0.874966, 4.409776, 0, 0.8509804, 1, 1,
0.09194706, 0.9126452, 0.341746, 0, 0.8431373, 1, 1,
0.09303796, 1.939073, -0.9492741, 0, 0.8392157, 1, 1,
0.0969405, 0.8851354, 1.778694, 0, 0.8313726, 1, 1,
0.09741569, -0.1883205, 1.124663, 0, 0.827451, 1, 1,
0.1024723, 0.7626154, 0.8237304, 0, 0.8196079, 1, 1,
0.1024802, 1.02348, -0.5412844, 0, 0.8156863, 1, 1,
0.1079213, 0.5961598, -1.158388, 0, 0.8078431, 1, 1,
0.1209636, -1.952561, 3.222337, 0, 0.8039216, 1, 1,
0.1225544, -0.7563506, 1.054795, 0, 0.7960784, 1, 1,
0.1295843, -2.659591, 4.964846, 0, 0.7882353, 1, 1,
0.1401107, -0.1004722, 0.1477066, 0, 0.7843137, 1, 1,
0.1415773, -2.375279, 2.374035, 0, 0.7764706, 1, 1,
0.1472339, 0.8103371, 2.509846, 0, 0.772549, 1, 1,
0.1473022, 0.6842626, -0.5157858, 0, 0.7647059, 1, 1,
0.1488519, -0.6086183, 3.900327, 0, 0.7607843, 1, 1,
0.1511198, 0.3557181, 0.8315096, 0, 0.7529412, 1, 1,
0.1520558, -0.9238827, 0.9374856, 0, 0.7490196, 1, 1,
0.1532595, 0.4094564, 0.386006, 0, 0.7411765, 1, 1,
0.1583393, 0.2669667, 1.495205, 0, 0.7372549, 1, 1,
0.1624753, -0.02990458, 0.9653946, 0, 0.7294118, 1, 1,
0.1631569, 0.1385391, 1.674249, 0, 0.7254902, 1, 1,
0.1634527, -0.2629246, 2.972034, 0, 0.7176471, 1, 1,
0.1648436, -2.183199, 5.456114, 0, 0.7137255, 1, 1,
0.1651436, 0.03201561, 0.2217765, 0, 0.7058824, 1, 1,
0.1711402, 0.3789107, 0.1129319, 0, 0.6980392, 1, 1,
0.1739164, 0.1909111, 3.077143, 0, 0.6941177, 1, 1,
0.1772998, 1.077173, -0.06174615, 0, 0.6862745, 1, 1,
0.177355, -1.843448, 1.996119, 0, 0.682353, 1, 1,
0.1783445, 0.4393965, 1.787159, 0, 0.6745098, 1, 1,
0.1797102, 0.7573474, 0.7464184, 0, 0.6705883, 1, 1,
0.181135, 1.326429, 0.9908765, 0, 0.6627451, 1, 1,
0.1952137, 0.6811431, 2.01839, 0, 0.6588235, 1, 1,
0.1986554, -2.040994, 3.504377, 0, 0.6509804, 1, 1,
0.2016253, -0.01122786, 2.33607, 0, 0.6470588, 1, 1,
0.2037382, -1.107819, 1.395, 0, 0.6392157, 1, 1,
0.2064541, -0.8418376, 3.924025, 0, 0.6352941, 1, 1,
0.2094927, 0.2066464, -0.7119799, 0, 0.627451, 1, 1,
0.2106996, 0.9286512, 0.5589588, 0, 0.6235294, 1, 1,
0.218293, -0.3397085, 2.296675, 0, 0.6156863, 1, 1,
0.2189444, 0.21263, 0.4622978, 0, 0.6117647, 1, 1,
0.2273271, -0.6518592, 2.401983, 0, 0.6039216, 1, 1,
0.2280628, -0.1973015, 2.151218, 0, 0.5960785, 1, 1,
0.2317431, -1.065145, 2.16273, 0, 0.5921569, 1, 1,
0.2324854, -0.862491, 2.915834, 0, 0.5843138, 1, 1,
0.2378882, -0.7377861, 3.90668, 0, 0.5803922, 1, 1,
0.2427393, -0.09198613, 2.28045, 0, 0.572549, 1, 1,
0.2479625, 0.4253551, -0.4758571, 0, 0.5686275, 1, 1,
0.2480997, -0.4081255, 2.173493, 0, 0.5607843, 1, 1,
0.24854, -0.4451226, 3.300338, 0, 0.5568628, 1, 1,
0.2485861, 0.9280598, -1.069838, 0, 0.5490196, 1, 1,
0.2556954, 0.4047902, 2.261217, 0, 0.5450981, 1, 1,
0.2558, -1.316666, 2.356416, 0, 0.5372549, 1, 1,
0.2571929, -1.225683, 4.097373, 0, 0.5333334, 1, 1,
0.2592612, 1.854855, -0.9388347, 0, 0.5254902, 1, 1,
0.2668199, -0.5571785, 3.065656, 0, 0.5215687, 1, 1,
0.2681505, 0.2413889, 1.785189, 0, 0.5137255, 1, 1,
0.2692962, -1.586948, 1.957965, 0, 0.509804, 1, 1,
0.2706057, -0.8643872, 2.782501, 0, 0.5019608, 1, 1,
0.2733372, -0.01162918, 1.035126, 0, 0.4941176, 1, 1,
0.2757153, -1.41409, 1.737792, 0, 0.4901961, 1, 1,
0.28077, 1.074708, -0.4959123, 0, 0.4823529, 1, 1,
0.2810896, -1.883149, 3.755124, 0, 0.4784314, 1, 1,
0.2867344, 0.8256111, 0.5142117, 0, 0.4705882, 1, 1,
0.2889769, 1.690999, -1.941639, 0, 0.4666667, 1, 1,
0.2921564, -0.3755005, 2.399896, 0, 0.4588235, 1, 1,
0.2943042, -0.4808271, 0.6339098, 0, 0.454902, 1, 1,
0.2972906, 0.1853183, 1.797791, 0, 0.4470588, 1, 1,
0.3005829, -0.4151625, 2.124214, 0, 0.4431373, 1, 1,
0.301472, -0.9192838, 3.84652, 0, 0.4352941, 1, 1,
0.3049214, 1.352693, -0.8999791, 0, 0.4313726, 1, 1,
0.3049242, 0.01759415, 2.511531, 0, 0.4235294, 1, 1,
0.3056156, -0.9986316, 3.455058, 0, 0.4196078, 1, 1,
0.3056494, 0.5383327, -0.8448551, 0, 0.4117647, 1, 1,
0.3175266, 0.4475265, 0.7982196, 0, 0.4078431, 1, 1,
0.3212066, -0.5582173, 3.851451, 0, 0.4, 1, 1,
0.3239323, -1.782213, 3.172596, 0, 0.3921569, 1, 1,
0.3259946, -0.771509, 3.395684, 0, 0.3882353, 1, 1,
0.3281269, -0.3645959, 4.842901, 0, 0.3803922, 1, 1,
0.3288324, 0.0931722, -0.7799596, 0, 0.3764706, 1, 1,
0.3294454, -0.3798719, 2.517472, 0, 0.3686275, 1, 1,
0.3320188, 0.9511578, -0.1579504, 0, 0.3647059, 1, 1,
0.3343324, -1.957814, 2.798463, 0, 0.3568628, 1, 1,
0.3347208, -0.1090982, 1.493145, 0, 0.3529412, 1, 1,
0.3375479, -0.1280501, 1.560586, 0, 0.345098, 1, 1,
0.3385134, -1.490485, 3.169759, 0, 0.3411765, 1, 1,
0.3394912, -1.127043, 3.379247, 0, 0.3333333, 1, 1,
0.3401438, 0.4508295, 0.2579225, 0, 0.3294118, 1, 1,
0.3431334, 0.2909992, 1.060063, 0, 0.3215686, 1, 1,
0.3442681, -0.05886758, 0.8059151, 0, 0.3176471, 1, 1,
0.3446625, -0.2323422, 1.526474, 0, 0.3098039, 1, 1,
0.3474018, 2.132757, 0.5444365, 0, 0.3058824, 1, 1,
0.3494161, 0.07213862, 1.544653, 0, 0.2980392, 1, 1,
0.3530126, 0.835357, 0.8648128, 0, 0.2901961, 1, 1,
0.3566972, 0.3329054, 1.616627, 0, 0.2862745, 1, 1,
0.3576632, 0.5800808, -0.8732572, 0, 0.2784314, 1, 1,
0.3576729, 1.465915, -1.915961, 0, 0.2745098, 1, 1,
0.3606579, 2.616565, 1.29436, 0, 0.2666667, 1, 1,
0.3620532, 1.344056, -0.05681013, 0, 0.2627451, 1, 1,
0.3644353, -1.177603, 2.054677, 0, 0.254902, 1, 1,
0.3659799, -0.299188, 4.190773, 0, 0.2509804, 1, 1,
0.3688721, 2.594122, 1.137506, 0, 0.2431373, 1, 1,
0.3708314, 0.7823743, -0.4789356, 0, 0.2392157, 1, 1,
0.3757345, 0.1708964, 1.050017, 0, 0.2313726, 1, 1,
0.3767608, 1.18995, 0.6060721, 0, 0.227451, 1, 1,
0.3768876, -0.815024, 3.65735, 0, 0.2196078, 1, 1,
0.3769121, -0.2655956, 2.766286, 0, 0.2156863, 1, 1,
0.378835, 1.536652, -0.03657638, 0, 0.2078431, 1, 1,
0.379621, -0.1327192, -0.63992, 0, 0.2039216, 1, 1,
0.380633, -1.167094, 3.339028, 0, 0.1960784, 1, 1,
0.3837582, -0.3632479, 2.45182, 0, 0.1882353, 1, 1,
0.3845415, 0.6734378, 1.833592, 0, 0.1843137, 1, 1,
0.3855291, -0.9881192, 2.708283, 0, 0.1764706, 1, 1,
0.3891031, -1.659839, 4.1794, 0, 0.172549, 1, 1,
0.3918137, 1.006419, 0.6930775, 0, 0.1647059, 1, 1,
0.3946465, 1.094672, -1.414627, 0, 0.1607843, 1, 1,
0.3956183, 0.3705472, 0.3154858, 0, 0.1529412, 1, 1,
0.3971023, 0.7833747, -1.377946, 0, 0.1490196, 1, 1,
0.3977436, 0.3193501, 1.078833, 0, 0.1411765, 1, 1,
0.400573, 0.1668249, 1.155657, 0, 0.1372549, 1, 1,
0.4020966, -1.044506, 2.864419, 0, 0.1294118, 1, 1,
0.4023398, -0.08470442, 0.4391306, 0, 0.1254902, 1, 1,
0.4050861, 0.9515601, -0.03300596, 0, 0.1176471, 1, 1,
0.4055664, 1.393371, 0.7425911, 0, 0.1137255, 1, 1,
0.4085994, -0.7867966, 4.251845, 0, 0.1058824, 1, 1,
0.410382, 0.7029375, 1.353498, 0, 0.09803922, 1, 1,
0.4116097, -0.04222009, 1.035702, 0, 0.09411765, 1, 1,
0.4156832, -0.007286572, 2.978734, 0, 0.08627451, 1, 1,
0.4161035, 1.743928, 1.274723, 0, 0.08235294, 1, 1,
0.4180567, -0.5706372, 4.515568, 0, 0.07450981, 1, 1,
0.4196208, -0.08568166, 0.7408147, 0, 0.07058824, 1, 1,
0.4197953, -0.5763686, 2.372448, 0, 0.0627451, 1, 1,
0.4199994, -0.0311289, 1.353107, 0, 0.05882353, 1, 1,
0.4255936, -0.3597713, 4.132254, 0, 0.05098039, 1, 1,
0.4259149, 0.1101089, 1.503596, 0, 0.04705882, 1, 1,
0.4270998, -1.514857, 2.11469, 0, 0.03921569, 1, 1,
0.4292317, -1.119092, 1.914671, 0, 0.03529412, 1, 1,
0.4409539, 0.6448673, 0.1384152, 0, 0.02745098, 1, 1,
0.4410793, -1.065476, 1.036806, 0, 0.02352941, 1, 1,
0.4416027, -2.14384, 4.362002, 0, 0.01568628, 1, 1,
0.4445147, 1.709337, -0.04169293, 0, 0.01176471, 1, 1,
0.4447493, -0.04860698, 3.229808, 0, 0.003921569, 1, 1,
0.4481794, -1.569536, 1.912402, 0.003921569, 0, 1, 1,
0.4654777, -0.9899861, 1.167298, 0.007843138, 0, 1, 1,
0.4675945, -1.108685, 3.689894, 0.01568628, 0, 1, 1,
0.4686876, -2.103917, 2.487154, 0.01960784, 0, 1, 1,
0.4688656, 1.834819, 0.4646644, 0.02745098, 0, 1, 1,
0.4693994, 1.25629, 0.9263642, 0.03137255, 0, 1, 1,
0.4708507, -0.9077761, 3.351741, 0.03921569, 0, 1, 1,
0.486448, -0.01319958, 2.456576, 0.04313726, 0, 1, 1,
0.4895301, -0.8433185, 3.295527, 0.05098039, 0, 1, 1,
0.4941418, 1.9633, 0.636474, 0.05490196, 0, 1, 1,
0.496263, 0.2090714, 1.213891, 0.0627451, 0, 1, 1,
0.4974066, 0.1557171, 3.496884, 0.06666667, 0, 1, 1,
0.4980524, -1.673719, 1.32978, 0.07450981, 0, 1, 1,
0.5040153, 0.2884084, 1.473179, 0.07843138, 0, 1, 1,
0.5059173, 0.8430188, -0.4326537, 0.08627451, 0, 1, 1,
0.50898, 0.7978396, -1.842749, 0.09019608, 0, 1, 1,
0.5111583, 0.991626, 1.018247, 0.09803922, 0, 1, 1,
0.517255, 0.2054507, 1.232662, 0.1058824, 0, 1, 1,
0.5212483, 0.1597409, 2.113571, 0.1098039, 0, 1, 1,
0.5259687, -0.9538459, 3.199795, 0.1176471, 0, 1, 1,
0.5265703, -1.274559, 3.879652, 0.1215686, 0, 1, 1,
0.5292892, -0.4033996, 3.628494, 0.1294118, 0, 1, 1,
0.5345116, -0.4231134, 4.425534, 0.1333333, 0, 1, 1,
0.5351083, 1.404972, 0.6556661, 0.1411765, 0, 1, 1,
0.537091, 0.08715585, 2.0455, 0.145098, 0, 1, 1,
0.5397805, 0.4190129, 1.041681, 0.1529412, 0, 1, 1,
0.5425216, -0.01181536, 0.369436, 0.1568628, 0, 1, 1,
0.5433212, -1.962039, 2.033504, 0.1647059, 0, 1, 1,
0.5437259, 0.9443026, 2.368192, 0.1686275, 0, 1, 1,
0.5473958, 2.191493, 0.3568325, 0.1764706, 0, 1, 1,
0.5484078, -1.090143, 2.013612, 0.1803922, 0, 1, 1,
0.5509496, 0.1799436, 0.1661362, 0.1882353, 0, 1, 1,
0.5523327, -0.1517159, 1.026772, 0.1921569, 0, 1, 1,
0.5533201, 0.9231981, -0.6835626, 0.2, 0, 1, 1,
0.5539105, -0.07425778, 1.889614, 0.2078431, 0, 1, 1,
0.5548753, 1.053597, -0.3566196, 0.2117647, 0, 1, 1,
0.5559363, 1.839206, 0.6275168, 0.2196078, 0, 1, 1,
0.5577496, 0.3885331, 2.06217, 0.2235294, 0, 1, 1,
0.5601661, -1.434384, 2.580958, 0.2313726, 0, 1, 1,
0.5612888, 0.5834681, 1.126379, 0.2352941, 0, 1, 1,
0.562166, -0.4099433, 2.975388, 0.2431373, 0, 1, 1,
0.5652605, 0.6193931, 2.644917, 0.2470588, 0, 1, 1,
0.5712632, 0.7871118, 0.2126826, 0.254902, 0, 1, 1,
0.5762157, 0.588603, 0.2622711, 0.2588235, 0, 1, 1,
0.5770018, -0.7985063, 3.106565, 0.2666667, 0, 1, 1,
0.577476, 0.3005363, 1.678829, 0.2705882, 0, 1, 1,
0.5852987, 0.8472521, 2.650031, 0.2784314, 0, 1, 1,
0.5879056, 0.1062681, 2.204173, 0.282353, 0, 1, 1,
0.5885397, 1.080343, 0.4720079, 0.2901961, 0, 1, 1,
0.5900504, 0.08385137, -0.1608105, 0.2941177, 0, 1, 1,
0.5925806, -0.1407896, 1.80821, 0.3019608, 0, 1, 1,
0.5979177, -0.07190646, 1.607881, 0.3098039, 0, 1, 1,
0.6035289, 0.1450154, 1.78355, 0.3137255, 0, 1, 1,
0.621267, 0.6647921, 0.5108262, 0.3215686, 0, 1, 1,
0.633881, 1.282697, -0.04701729, 0.3254902, 0, 1, 1,
0.6354061, -0.2759587, 2.88468, 0.3333333, 0, 1, 1,
0.636615, 0.04660736, -0.2158827, 0.3372549, 0, 1, 1,
0.6389188, 0.6854526, 2.512315, 0.345098, 0, 1, 1,
0.640948, -0.1751858, 2.002597, 0.3490196, 0, 1, 1,
0.6417987, 1.133598, -0.0239658, 0.3568628, 0, 1, 1,
0.642145, 0.7921392, -0.4739313, 0.3607843, 0, 1, 1,
0.6460449, 0.8312225, -0.1437684, 0.3686275, 0, 1, 1,
0.6463094, -0.05243922, 1.105372, 0.372549, 0, 1, 1,
0.6525074, -1.292071, 1.230834, 0.3803922, 0, 1, 1,
0.6535752, -0.8958158, 3.730139, 0.3843137, 0, 1, 1,
0.6615796, 0.3239804, 1.762663, 0.3921569, 0, 1, 1,
0.6643623, 0.7830797, 0.8494869, 0.3960784, 0, 1, 1,
0.6653042, -0.4587311, -0.4366865, 0.4039216, 0, 1, 1,
0.6663388, -1.032859, 3.134062, 0.4117647, 0, 1, 1,
0.6668838, -0.2607728, 2.648867, 0.4156863, 0, 1, 1,
0.6674175, -0.1338815, 1.976868, 0.4235294, 0, 1, 1,
0.6709739, 0.02426784, -0.02628437, 0.427451, 0, 1, 1,
0.6716108, -1.13215, 2.672926, 0.4352941, 0, 1, 1,
0.6718393, -0.102957, 1.710755, 0.4392157, 0, 1, 1,
0.6740287, 0.2918535, 0.2461929, 0.4470588, 0, 1, 1,
0.6766855, -0.1034524, 1.005361, 0.4509804, 0, 1, 1,
0.7010324, -1.952117, 5.607322, 0.4588235, 0, 1, 1,
0.7103441, -0.920772, 0.9111766, 0.4627451, 0, 1, 1,
0.7195083, -1.91906, 1.445398, 0.4705882, 0, 1, 1,
0.7208847, 1.438956, 0.9199843, 0.4745098, 0, 1, 1,
0.72694, 0.8791532, -0.05727707, 0.4823529, 0, 1, 1,
0.7291908, -0.7091607, 3.607945, 0.4862745, 0, 1, 1,
0.7298843, -0.2865207, 2.950445, 0.4941176, 0, 1, 1,
0.734701, 0.00214347, 1.165719, 0.5019608, 0, 1, 1,
0.7386686, -0.940789, 3.08297, 0.5058824, 0, 1, 1,
0.7410001, 1.445391, 1.48573, 0.5137255, 0, 1, 1,
0.7436517, 0.4957346, 0.1489623, 0.5176471, 0, 1, 1,
0.747314, -0.2281668, 2.999408, 0.5254902, 0, 1, 1,
0.7560084, 1.380845, -0.1938879, 0.5294118, 0, 1, 1,
0.7583547, -0.1716384, 2.161531, 0.5372549, 0, 1, 1,
0.7584491, -0.1455349, 2.130513, 0.5411765, 0, 1, 1,
0.7593478, 2.232204, 0.3142115, 0.5490196, 0, 1, 1,
0.7598591, 1.868297, -0.1404366, 0.5529412, 0, 1, 1,
0.7603347, 1.370376, -0.6632552, 0.5607843, 0, 1, 1,
0.7714056, 0.343708, -0.2228366, 0.5647059, 0, 1, 1,
0.7798601, 0.08343656, 1.863526, 0.572549, 0, 1, 1,
0.7817578, -1.442986, 3.778184, 0.5764706, 0, 1, 1,
0.7833258, -0.3624266, 0.01158753, 0.5843138, 0, 1, 1,
0.7906128, -0.2092506, 2.20259, 0.5882353, 0, 1, 1,
0.7956955, 1.373971, -0.1334182, 0.5960785, 0, 1, 1,
0.7981271, 0.3234698, 2.169123, 0.6039216, 0, 1, 1,
0.8078514, 0.2164267, 0.427468, 0.6078432, 0, 1, 1,
0.808052, 1.105744, 0.7731466, 0.6156863, 0, 1, 1,
0.8083508, -1.364873, 2.999744, 0.6196079, 0, 1, 1,
0.8089764, -0.2045182, 2.28643, 0.627451, 0, 1, 1,
0.8097881, -1.176185, 3.205682, 0.6313726, 0, 1, 1,
0.8100845, 0.5568394, 1.511557, 0.6392157, 0, 1, 1,
0.8106181, 0.3518634, -0.731723, 0.6431373, 0, 1, 1,
0.8121527, 1.013965, 0.7454109, 0.6509804, 0, 1, 1,
0.8139635, -0.5785493, 2.511081, 0.654902, 0, 1, 1,
0.8209455, -0.4820377, 1.514881, 0.6627451, 0, 1, 1,
0.824616, -0.8508005, 4.502735, 0.6666667, 0, 1, 1,
0.8264514, -0.7360502, 1.438847, 0.6745098, 0, 1, 1,
0.8269674, 1.761429, 0.5290627, 0.6784314, 0, 1, 1,
0.8270027, -0.3633315, 1.473944, 0.6862745, 0, 1, 1,
0.8276805, 0.2439338, 0.9910681, 0.6901961, 0, 1, 1,
0.831089, 1.6838, -0.5122701, 0.6980392, 0, 1, 1,
0.8364369, -0.5426126, 2.947169, 0.7058824, 0, 1, 1,
0.8390443, -0.8577204, 1.007819, 0.7098039, 0, 1, 1,
0.8393818, -0.9641895, 3.585114, 0.7176471, 0, 1, 1,
0.8418573, 0.6423684, 1.43589, 0.7215686, 0, 1, 1,
0.8425269, -1.527686, 0.6835709, 0.7294118, 0, 1, 1,
0.8453882, 0.8566648, 0.4790071, 0.7333333, 0, 1, 1,
0.847822, 0.7511475, 1.781616, 0.7411765, 0, 1, 1,
0.8490067, -1.219286, 2.019138, 0.7450981, 0, 1, 1,
0.8535746, 0.3997699, 0.3003033, 0.7529412, 0, 1, 1,
0.854232, 0.3710677, 2.249741, 0.7568628, 0, 1, 1,
0.8564864, 0.5017527, 0.2316616, 0.7647059, 0, 1, 1,
0.8592802, -0.1532847, 1.506256, 0.7686275, 0, 1, 1,
0.8593425, -0.9832039, -0.01685171, 0.7764706, 0, 1, 1,
0.8617087, 0.2780223, 0.8734154, 0.7803922, 0, 1, 1,
0.8623382, 0.4595341, 1.370717, 0.7882353, 0, 1, 1,
0.8640665, -1.702822, 0.4613044, 0.7921569, 0, 1, 1,
0.8655009, 0.0786254, 0.65364, 0.8, 0, 1, 1,
0.8681103, -1.08074, 1.455455, 0.8078431, 0, 1, 1,
0.8684566, 0.4240163, 0.6047881, 0.8117647, 0, 1, 1,
0.8813694, -2.24159, 1.931255, 0.8196079, 0, 1, 1,
0.8927633, -1.558421, 2.848108, 0.8235294, 0, 1, 1,
0.9034783, -0.3409254, 1.500645, 0.8313726, 0, 1, 1,
0.9105963, 0.8666221, 1.93101, 0.8352941, 0, 1, 1,
0.9116691, -0.7623245, 1.715116, 0.8431373, 0, 1, 1,
0.9201586, -0.5593773, 2.983161, 0.8470588, 0, 1, 1,
0.9266415, 0.4272818, -0.1152364, 0.854902, 0, 1, 1,
0.9267628, 0.05344732, 1.119321, 0.8588235, 0, 1, 1,
0.9395711, -0.4887654, 2.305378, 0.8666667, 0, 1, 1,
0.9397926, 0.5336058, 1.313222, 0.8705882, 0, 1, 1,
0.940514, -0.05188575, 1.339172, 0.8784314, 0, 1, 1,
0.9451376, 0.3208103, 0.9536378, 0.8823529, 0, 1, 1,
0.9453769, 0.7335368, 0.7318056, 0.8901961, 0, 1, 1,
0.948786, 0.9650494, 0.9103244, 0.8941177, 0, 1, 1,
0.9558153, -0.9980496, 2.967317, 0.9019608, 0, 1, 1,
0.9563983, 0.3636695, 1.606777, 0.9098039, 0, 1, 1,
0.9616472, -0.3483683, 2.359076, 0.9137255, 0, 1, 1,
0.9678916, 2.323189, 1.543344, 0.9215686, 0, 1, 1,
0.9793424, -1.001591, 2.777198, 0.9254902, 0, 1, 1,
0.9795495, 0.9737412, -0.3646009, 0.9333333, 0, 1, 1,
0.9900849, 0.03338842, 0.07819436, 0.9372549, 0, 1, 1,
0.9920698, -1.501327, 3.112017, 0.945098, 0, 1, 1,
1.002092, -0.119238, 1.58358, 0.9490196, 0, 1, 1,
1.002321, 1.400065, 3.080292, 0.9568627, 0, 1, 1,
1.005266, -0.2328772, 2.775073, 0.9607843, 0, 1, 1,
1.007554, -2.028732, 2.211369, 0.9686275, 0, 1, 1,
1.011331, -1.131894, 0.8755292, 0.972549, 0, 1, 1,
1.014865, -1.956393, 0.7651728, 0.9803922, 0, 1, 1,
1.01926, 0.04415514, 0.4597566, 0.9843137, 0, 1, 1,
1.020437, 0.296467, 1.941421, 0.9921569, 0, 1, 1,
1.023469, 0.6228808, 0.4341993, 0.9960784, 0, 1, 1,
1.024444, 0.6943198, 2.928759, 1, 0, 0.9960784, 1,
1.026884, -1.002832, 2.1491, 1, 0, 0.9882353, 1,
1.029718, 1.072679, 1.110791, 1, 0, 0.9843137, 1,
1.033207, 2.832082, -0.7982162, 1, 0, 0.9764706, 1,
1.037145, -0.7700465, 1.668077, 1, 0, 0.972549, 1,
1.041864, -0.1098337, 0.1439096, 1, 0, 0.9647059, 1,
1.042768, 0.207432, 1.673001, 1, 0, 0.9607843, 1,
1.044671, 0.9167042, 1.020613, 1, 0, 0.9529412, 1,
1.049822, -1.046769, 1.652071, 1, 0, 0.9490196, 1,
1.054186, -1.320793, 1.105153, 1, 0, 0.9411765, 1,
1.056889, 1.840506, 0.1125333, 1, 0, 0.9372549, 1,
1.062613, -0.9977068, 1.966741, 1, 0, 0.9294118, 1,
1.064411, -1.068657, 3.498968, 1, 0, 0.9254902, 1,
1.065291, -0.960189, 1.186962, 1, 0, 0.9176471, 1,
1.074999, 0.588885, 1.52105, 1, 0, 0.9137255, 1,
1.084283, -0.8481835, 1.788009, 1, 0, 0.9058824, 1,
1.084848, 1.28009, 2.305567, 1, 0, 0.9019608, 1,
1.086272, -1.540729, 2.988501, 1, 0, 0.8941177, 1,
1.10153, 1.265086, -0.5016205, 1, 0, 0.8862745, 1,
1.118903, 0.2661873, 2.335477, 1, 0, 0.8823529, 1,
1.12237, 1.13252, 0.0400861, 1, 0, 0.8745098, 1,
1.133994, -0.1115709, 1.60616, 1, 0, 0.8705882, 1,
1.136641, -1.032556, 1.551175, 1, 0, 0.8627451, 1,
1.140695, 0.04290932, 0.5393782, 1, 0, 0.8588235, 1,
1.142465, -1.916049, 3.918305, 1, 0, 0.8509804, 1,
1.143767, 1.398754, -0.1474753, 1, 0, 0.8470588, 1,
1.152923, 0.7464765, 0.3097153, 1, 0, 0.8392157, 1,
1.158984, -0.1317403, 0.09623011, 1, 0, 0.8352941, 1,
1.165005, 1.287291, 1.559414, 1, 0, 0.827451, 1,
1.165835, 0.5337186, 0.8698338, 1, 0, 0.8235294, 1,
1.171329, -1.156244, 2.025025, 1, 0, 0.8156863, 1,
1.172634, 0.8191708, -0.1039272, 1, 0, 0.8117647, 1,
1.178108, 1.19275, 1.356647, 1, 0, 0.8039216, 1,
1.181414, -0.0713474, 0.7795025, 1, 0, 0.7960784, 1,
1.184219, -1.329541, 2.865396, 1, 0, 0.7921569, 1,
1.189847, -0.3389914, 2.763256, 1, 0, 0.7843137, 1,
1.192456, 0.7972994, -0.3373626, 1, 0, 0.7803922, 1,
1.195813, -1.970215, 1.516002, 1, 0, 0.772549, 1,
1.196925, -0.983225, 2.542218, 1, 0, 0.7686275, 1,
1.197071, 0.6293556, 3.262633, 1, 0, 0.7607843, 1,
1.197379, -0.3559893, 3.337069, 1, 0, 0.7568628, 1,
1.203086, 0.8342408, 0.6103982, 1, 0, 0.7490196, 1,
1.203433, -0.5885829, 1.910539, 1, 0, 0.7450981, 1,
1.209262, 0.8619624, -0.01110231, 1, 0, 0.7372549, 1,
1.213526, -0.2705581, 0.9033571, 1, 0, 0.7333333, 1,
1.215132, 1.137599, 0.1079554, 1, 0, 0.7254902, 1,
1.2196, 1.593177, 1.592015, 1, 0, 0.7215686, 1,
1.219787, 1.661619, -1.009587, 1, 0, 0.7137255, 1,
1.22165, 0.6858619, 1.56827, 1, 0, 0.7098039, 1,
1.225159, -0.04048982, 1.966017, 1, 0, 0.7019608, 1,
1.226029, -1.111644, 2.682359, 1, 0, 0.6941177, 1,
1.232931, -0.8573145, 2.187943, 1, 0, 0.6901961, 1,
1.233026, -0.4780616, 2.245227, 1, 0, 0.682353, 1,
1.234991, 0.006470041, 2.287298, 1, 0, 0.6784314, 1,
1.238794, -0.7202447, 1.920098, 1, 0, 0.6705883, 1,
1.24183, -0.9551347, 3.990239, 1, 0, 0.6666667, 1,
1.244374, -1.488771, 1.794463, 1, 0, 0.6588235, 1,
1.244405, 1.301969, 0.7660696, 1, 0, 0.654902, 1,
1.247638, 0.1142066, 2.455794, 1, 0, 0.6470588, 1,
1.250769, 0.7093163, -0.7303417, 1, 0, 0.6431373, 1,
1.25808, 1.546538, 0.9127588, 1, 0, 0.6352941, 1,
1.260105, 0.1059697, 0.9305269, 1, 0, 0.6313726, 1,
1.260893, -0.03650637, 2.749392, 1, 0, 0.6235294, 1,
1.270343, 1.91299, 1.927642, 1, 0, 0.6196079, 1,
1.271647, 0.7771083, 3.276753, 1, 0, 0.6117647, 1,
1.271987, 0.0006401996, 1.672443, 1, 0, 0.6078432, 1,
1.284984, -0.8336022, 0.9297113, 1, 0, 0.6, 1,
1.300388, 0.7743172, 1.837475, 1, 0, 0.5921569, 1,
1.302112, 0.6923382, 1.831794, 1, 0, 0.5882353, 1,
1.302559, -0.9181383, 0.9238434, 1, 0, 0.5803922, 1,
1.309068, -0.2284801, 2.527987, 1, 0, 0.5764706, 1,
1.311136, 0.3061355, 0.919768, 1, 0, 0.5686275, 1,
1.311622, 1.31307, 0.8843622, 1, 0, 0.5647059, 1,
1.312996, 0.2675465, 1.182764, 1, 0, 0.5568628, 1,
1.318592, -0.8561737, 2.880143, 1, 0, 0.5529412, 1,
1.335295, 0.07897154, 2.061847, 1, 0, 0.5450981, 1,
1.348162, 0.5252971, -0.01862519, 1, 0, 0.5411765, 1,
1.350066, 1.107451, -0.6372897, 1, 0, 0.5333334, 1,
1.352853, -0.2766733, -0.09147691, 1, 0, 0.5294118, 1,
1.355606, 0.7633604, 2.991122, 1, 0, 0.5215687, 1,
1.362626, 0.4561242, 1.07883, 1, 0, 0.5176471, 1,
1.374584, -1.824864, -0.2136489, 1, 0, 0.509804, 1,
1.376279, 0.08609468, 2.151749, 1, 0, 0.5058824, 1,
1.37927, 0.6499618, 1.071603, 1, 0, 0.4980392, 1,
1.381247, 0.342525, 2.544296, 1, 0, 0.4901961, 1,
1.383932, -0.0934497, -0.09736899, 1, 0, 0.4862745, 1,
1.418991, -0.7179707, 1.931068, 1, 0, 0.4784314, 1,
1.422854, 0.1906682, 1.54091, 1, 0, 0.4745098, 1,
1.430636, -2.353634, 1.882391, 1, 0, 0.4666667, 1,
1.434838, -0.1699704, -0.6595497, 1, 0, 0.4627451, 1,
1.438333, -1.193441, 3.554869, 1, 0, 0.454902, 1,
1.443216, -3.544299, 0.2995359, 1, 0, 0.4509804, 1,
1.446948, 1.17753, 1.11038, 1, 0, 0.4431373, 1,
1.449934, 0.4446391, 1.869252, 1, 0, 0.4392157, 1,
1.467518, -1.061136, 2.389504, 1, 0, 0.4313726, 1,
1.469588, 0.8475068, 0.3605114, 1, 0, 0.427451, 1,
1.473393, 1.029728, 1.499012, 1, 0, 0.4196078, 1,
1.475415, -1.595855, 1.971787, 1, 0, 0.4156863, 1,
1.475889, -0.176966, -0.6648318, 1, 0, 0.4078431, 1,
1.476221, 0.7161885, 2.236026, 1, 0, 0.4039216, 1,
1.480713, -0.6724021, 2.289111, 1, 0, 0.3960784, 1,
1.481594, 0.1814384, 1.388655, 1, 0, 0.3882353, 1,
1.490585, 0.6958506, 2.090985, 1, 0, 0.3843137, 1,
1.490637, -0.1573329, 0.1476104, 1, 0, 0.3764706, 1,
1.49294, -1.503436, 3.252162, 1, 0, 0.372549, 1,
1.514674, 1.089964, 0.392633, 1, 0, 0.3647059, 1,
1.518797, 0.3249678, 0.6484531, 1, 0, 0.3607843, 1,
1.521087, -0.1465153, -0.08572256, 1, 0, 0.3529412, 1,
1.537405, -1.206308, 1.247886, 1, 0, 0.3490196, 1,
1.540272, -0.6931373, 3.532187, 1, 0, 0.3411765, 1,
1.541304, -0.1579373, 3.132582, 1, 0, 0.3372549, 1,
1.549621, -0.633009, 2.234848, 1, 0, 0.3294118, 1,
1.552746, -0.5446073, 1.140012, 1, 0, 0.3254902, 1,
1.55608, -2.411752, 3.003431, 1, 0, 0.3176471, 1,
1.56586, 0.6820449, 0.1517242, 1, 0, 0.3137255, 1,
1.567628, 1.229983, 1.990069, 1, 0, 0.3058824, 1,
1.583994, -0.8273171, 1.358028, 1, 0, 0.2980392, 1,
1.608373, -2.051929, 1.864097, 1, 0, 0.2941177, 1,
1.636829, -0.302281, 2.552667, 1, 0, 0.2862745, 1,
1.650455, 0.4498756, 1.240125, 1, 0, 0.282353, 1,
1.657232, -1.307235, 3.373495, 1, 0, 0.2745098, 1,
1.660346, -1.399758, 4.607268, 1, 0, 0.2705882, 1,
1.666294, 1.099048, 0.6297653, 1, 0, 0.2627451, 1,
1.673043, 0.9901688, 1.037435, 1, 0, 0.2588235, 1,
1.684233, 0.5123237, 1.541785, 1, 0, 0.2509804, 1,
1.70732, 0.5723805, 0.9127407, 1, 0, 0.2470588, 1,
1.709889, -1.361682, 2.688275, 1, 0, 0.2392157, 1,
1.712562, -1.886807, 1.803546, 1, 0, 0.2352941, 1,
1.729131, 2.063751, 0.2610118, 1, 0, 0.227451, 1,
1.734241, 0.7241864, -0.4607856, 1, 0, 0.2235294, 1,
1.746204, -0.1021335, 1.700721, 1, 0, 0.2156863, 1,
1.754493, 0.5613664, 0.5496415, 1, 0, 0.2117647, 1,
1.770901, -2.120709, 1.447046, 1, 0, 0.2039216, 1,
1.78057, 0.8581108, 2.627962, 1, 0, 0.1960784, 1,
1.791935, -0.7533174, 1.947268, 1, 0, 0.1921569, 1,
1.802312, -0.2090559, 1.458605, 1, 0, 0.1843137, 1,
1.814744, -1.78931, 1.650572, 1, 0, 0.1803922, 1,
1.826688, 0.8568658, 2.457013, 1, 0, 0.172549, 1,
1.875134, 0.898856, -0.5013392, 1, 0, 0.1686275, 1,
1.913525, -0.3103378, 0.1068517, 1, 0, 0.1607843, 1,
1.914052, 0.489891, 0.7004547, 1, 0, 0.1568628, 1,
1.931158, -0.1114786, 1.247086, 1, 0, 0.1490196, 1,
1.988427, 0.03258039, 1.285849, 1, 0, 0.145098, 1,
2.019273, 1.407401, 0.4332258, 1, 0, 0.1372549, 1,
2.053446, 1.12302, 2.102367, 1, 0, 0.1333333, 1,
2.057215, -0.3939556, 2.160588, 1, 0, 0.1254902, 1,
2.060861, -0.6888331, 2.762482, 1, 0, 0.1215686, 1,
2.08702, 1.322935, 0.6927207, 1, 0, 0.1137255, 1,
2.095098, -2.098687, 3.02539, 1, 0, 0.1098039, 1,
2.101452, -0.1365356, 0.5194593, 1, 0, 0.1019608, 1,
2.10378, 0.4339733, 0.6228872, 1, 0, 0.09411765, 1,
2.10986, -1.241954, 0.895074, 1, 0, 0.09019608, 1,
2.141076, 0.0809662, 1.862558, 1, 0, 0.08235294, 1,
2.19914, 0.7938979, 0.2398114, 1, 0, 0.07843138, 1,
2.299597, -0.7619299, 1.288747, 1, 0, 0.07058824, 1,
2.315202, -1.783624, 3.216314, 1, 0, 0.06666667, 1,
2.344276, 0.908877, 0.524711, 1, 0, 0.05882353, 1,
2.365134, -0.8651557, 1.717873, 1, 0, 0.05490196, 1,
2.425586, 1.909361, 0.3565176, 1, 0, 0.04705882, 1,
2.513799, -0.04180049, 0.9586186, 1, 0, 0.04313726, 1,
2.560857, -0.368202, 2.601575, 1, 0, 0.03529412, 1,
2.625752, 1.778417, 1.249684, 1, 0, 0.03137255, 1,
2.635451, -0.1066187, 1.411008, 1, 0, 0.02352941, 1,
2.795124, -0.6601365, 2.38473, 1, 0, 0.01960784, 1,
2.948735, 1.703264, 0.3589652, 1, 0, 0.01176471, 1,
3.16564, -0.7729096, 0.3732682, 1, 0, 0.007843138, 1
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
0.002982736, -4.639009, -7.576075, 0, -0.5, 0.5, 0.5,
0.002982736, -4.639009, -7.576075, 1, -0.5, 0.5, 0.5,
0.002982736, -4.639009, -7.576075, 1, 1.5, 0.5, 0.5,
0.002982736, -4.639009, -7.576075, 0, 1.5, 0.5, 0.5
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
-4.231815, -0.3150688, -7.576075, 0, -0.5, 0.5, 0.5,
-4.231815, -0.3150688, -7.576075, 1, -0.5, 0.5, 0.5,
-4.231815, -0.3150688, -7.576075, 1, 1.5, 0.5, 0.5,
-4.231815, -0.3150688, -7.576075, 0, 1.5, 0.5, 0.5
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
-4.231815, -4.639009, 0.07374597, 0, -0.5, 0.5, 0.5,
-4.231815, -4.639009, 0.07374597, 1, -0.5, 0.5, 0.5,
-4.231815, -4.639009, 0.07374597, 1, 1.5, 0.5, 0.5,
-4.231815, -4.639009, 0.07374597, 0, 1.5, 0.5, 0.5
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
-3, -3.641176, -5.810731,
3, -3.641176, -5.810731,
-3, -3.641176, -5.810731,
-3, -3.807482, -6.104955,
-2, -3.641176, -5.810731,
-2, -3.807482, -6.104955,
-1, -3.641176, -5.810731,
-1, -3.807482, -6.104955,
0, -3.641176, -5.810731,
0, -3.807482, -6.104955,
1, -3.641176, -5.810731,
1, -3.807482, -6.104955,
2, -3.641176, -5.810731,
2, -3.807482, -6.104955,
3, -3.641176, -5.810731,
3, -3.807482, -6.104955
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
-3, -4.140092, -6.693403, 0, -0.5, 0.5, 0.5,
-3, -4.140092, -6.693403, 1, -0.5, 0.5, 0.5,
-3, -4.140092, -6.693403, 1, 1.5, 0.5, 0.5,
-3, -4.140092, -6.693403, 0, 1.5, 0.5, 0.5,
-2, -4.140092, -6.693403, 0, -0.5, 0.5, 0.5,
-2, -4.140092, -6.693403, 1, -0.5, 0.5, 0.5,
-2, -4.140092, -6.693403, 1, 1.5, 0.5, 0.5,
-2, -4.140092, -6.693403, 0, 1.5, 0.5, 0.5,
-1, -4.140092, -6.693403, 0, -0.5, 0.5, 0.5,
-1, -4.140092, -6.693403, 1, -0.5, 0.5, 0.5,
-1, -4.140092, -6.693403, 1, 1.5, 0.5, 0.5,
-1, -4.140092, -6.693403, 0, 1.5, 0.5, 0.5,
0, -4.140092, -6.693403, 0, -0.5, 0.5, 0.5,
0, -4.140092, -6.693403, 1, -0.5, 0.5, 0.5,
0, -4.140092, -6.693403, 1, 1.5, 0.5, 0.5,
0, -4.140092, -6.693403, 0, 1.5, 0.5, 0.5,
1, -4.140092, -6.693403, 0, -0.5, 0.5, 0.5,
1, -4.140092, -6.693403, 1, -0.5, 0.5, 0.5,
1, -4.140092, -6.693403, 1, 1.5, 0.5, 0.5,
1, -4.140092, -6.693403, 0, 1.5, 0.5, 0.5,
2, -4.140092, -6.693403, 0, -0.5, 0.5, 0.5,
2, -4.140092, -6.693403, 1, -0.5, 0.5, 0.5,
2, -4.140092, -6.693403, 1, 1.5, 0.5, 0.5,
2, -4.140092, -6.693403, 0, 1.5, 0.5, 0.5,
3, -4.140092, -6.693403, 0, -0.5, 0.5, 0.5,
3, -4.140092, -6.693403, 1, -0.5, 0.5, 0.5,
3, -4.140092, -6.693403, 1, 1.5, 0.5, 0.5,
3, -4.140092, -6.693403, 0, 1.5, 0.5, 0.5
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
-3.254554, -3, -5.810731,
-3.254554, 2, -5.810731,
-3.254554, -3, -5.810731,
-3.417431, -3, -6.104955,
-3.254554, -2, -5.810731,
-3.417431, -2, -6.104955,
-3.254554, -1, -5.810731,
-3.417431, -1, -6.104955,
-3.254554, 0, -5.810731,
-3.417431, 0, -6.104955,
-3.254554, 1, -5.810731,
-3.417431, 1, -6.104955,
-3.254554, 2, -5.810731,
-3.417431, 2, -6.104955
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
-3.743185, -3, -6.693403, 0, -0.5, 0.5, 0.5,
-3.743185, -3, -6.693403, 1, -0.5, 0.5, 0.5,
-3.743185, -3, -6.693403, 1, 1.5, 0.5, 0.5,
-3.743185, -3, -6.693403, 0, 1.5, 0.5, 0.5,
-3.743185, -2, -6.693403, 0, -0.5, 0.5, 0.5,
-3.743185, -2, -6.693403, 1, -0.5, 0.5, 0.5,
-3.743185, -2, -6.693403, 1, 1.5, 0.5, 0.5,
-3.743185, -2, -6.693403, 0, 1.5, 0.5, 0.5,
-3.743185, -1, -6.693403, 0, -0.5, 0.5, 0.5,
-3.743185, -1, -6.693403, 1, -0.5, 0.5, 0.5,
-3.743185, -1, -6.693403, 1, 1.5, 0.5, 0.5,
-3.743185, -1, -6.693403, 0, 1.5, 0.5, 0.5,
-3.743185, 0, -6.693403, 0, -0.5, 0.5, 0.5,
-3.743185, 0, -6.693403, 1, -0.5, 0.5, 0.5,
-3.743185, 0, -6.693403, 1, 1.5, 0.5, 0.5,
-3.743185, 0, -6.693403, 0, 1.5, 0.5, 0.5,
-3.743185, 1, -6.693403, 0, -0.5, 0.5, 0.5,
-3.743185, 1, -6.693403, 1, -0.5, 0.5, 0.5,
-3.743185, 1, -6.693403, 1, 1.5, 0.5, 0.5,
-3.743185, 1, -6.693403, 0, 1.5, 0.5, 0.5,
-3.743185, 2, -6.693403, 0, -0.5, 0.5, 0.5,
-3.743185, 2, -6.693403, 1, -0.5, 0.5, 0.5,
-3.743185, 2, -6.693403, 1, 1.5, 0.5, 0.5,
-3.743185, 2, -6.693403, 0, 1.5, 0.5, 0.5
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
-3.254554, -3.641176, -4,
-3.254554, -3.641176, 4,
-3.254554, -3.641176, -4,
-3.417431, -3.807482, -4,
-3.254554, -3.641176, -2,
-3.417431, -3.807482, -2,
-3.254554, -3.641176, 0,
-3.417431, -3.807482, 0,
-3.254554, -3.641176, 2,
-3.417431, -3.807482, 2,
-3.254554, -3.641176, 4,
-3.417431, -3.807482, 4
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
-3.743185, -4.140092, -4, 0, -0.5, 0.5, 0.5,
-3.743185, -4.140092, -4, 1, -0.5, 0.5, 0.5,
-3.743185, -4.140092, -4, 1, 1.5, 0.5, 0.5,
-3.743185, -4.140092, -4, 0, 1.5, 0.5, 0.5,
-3.743185, -4.140092, -2, 0, -0.5, 0.5, 0.5,
-3.743185, -4.140092, -2, 1, -0.5, 0.5, 0.5,
-3.743185, -4.140092, -2, 1, 1.5, 0.5, 0.5,
-3.743185, -4.140092, -2, 0, 1.5, 0.5, 0.5,
-3.743185, -4.140092, 0, 0, -0.5, 0.5, 0.5,
-3.743185, -4.140092, 0, 1, -0.5, 0.5, 0.5,
-3.743185, -4.140092, 0, 1, 1.5, 0.5, 0.5,
-3.743185, -4.140092, 0, 0, 1.5, 0.5, 0.5,
-3.743185, -4.140092, 2, 0, -0.5, 0.5, 0.5,
-3.743185, -4.140092, 2, 1, -0.5, 0.5, 0.5,
-3.743185, -4.140092, 2, 1, 1.5, 0.5, 0.5,
-3.743185, -4.140092, 2, 0, 1.5, 0.5, 0.5,
-3.743185, -4.140092, 4, 0, -0.5, 0.5, 0.5,
-3.743185, -4.140092, 4, 1, -0.5, 0.5, 0.5,
-3.743185, -4.140092, 4, 1, 1.5, 0.5, 0.5,
-3.743185, -4.140092, 4, 0, 1.5, 0.5, 0.5
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
-3.254554, -3.641176, -5.810731,
-3.254554, 3.011039, -5.810731,
-3.254554, -3.641176, 5.958223,
-3.254554, 3.011039, 5.958223,
-3.254554, -3.641176, -5.810731,
-3.254554, -3.641176, 5.958223,
-3.254554, 3.011039, -5.810731,
-3.254554, 3.011039, 5.958223,
-3.254554, -3.641176, -5.810731,
3.26052, -3.641176, -5.810731,
-3.254554, -3.641176, 5.958223,
3.26052, -3.641176, 5.958223,
-3.254554, 3.011039, -5.810731,
3.26052, 3.011039, -5.810731,
-3.254554, 3.011039, 5.958223,
3.26052, 3.011039, 5.958223,
3.26052, -3.641176, -5.810731,
3.26052, 3.011039, -5.810731,
3.26052, -3.641176, 5.958223,
3.26052, 3.011039, 5.958223,
3.26052, -3.641176, -5.810731,
3.26052, -3.641176, 5.958223,
3.26052, 3.011039, -5.810731,
3.26052, 3.011039, 5.958223
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
var radius = 8.013383;
var distance = 35.65245;
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
mvMatrix.translate( -0.002982736, 0.3150688, -0.07374597 );
mvMatrix.scale( 1.329874, 1.302457, 0.7361934 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.65245);
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
triazole<-read.table("triazole.xyz")
```

```
## Error in read.table("triazole.xyz"): no lines available in input
```

```r
x<-triazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'triazole' not found
```

```r
y<-triazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'triazole' not found
```

```r
z<-triazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'triazole' not found
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
-3.159675, 0.6034165, -2.713533, 0, 0, 1, 1, 1,
-3.080378, -0.2848424, -1.809798, 1, 0, 0, 1, 1,
-3.042067, 1.082086, -1.252655, 1, 0, 0, 1, 1,
-2.681472, -2.069851, -1.352236, 1, 0, 0, 1, 1,
-2.487975, -0.9161284, -2.620308, 1, 0, 0, 1, 1,
-2.432828, -2.073457, -3.277387, 1, 0, 0, 1, 1,
-2.424889, 1.118947, -1.334857, 0, 0, 0, 1, 1,
-2.396697, -0.3928638, -1.892074, 0, 0, 0, 1, 1,
-2.380625, -0.7181119, -3.400053, 0, 0, 0, 1, 1,
-2.365766, -0.00274302, -1.140081, 0, 0, 0, 1, 1,
-2.275172, -0.1161989, -2.545087, 0, 0, 0, 1, 1,
-2.26795, -0.616502, -0.761194, 0, 0, 0, 1, 1,
-2.259984, -0.1144307, -2.103781, 0, 0, 0, 1, 1,
-2.22711, -0.5478231, -2.106606, 1, 1, 1, 1, 1,
-2.215065, -0.6083243, -3.147274, 1, 1, 1, 1, 1,
-2.183058, 1.340402, 0.1790843, 1, 1, 1, 1, 1,
-2.133014, -0.02851455, -1.018204, 1, 1, 1, 1, 1,
-2.130208, 1.16008, -0.6556413, 1, 1, 1, 1, 1,
-2.120219, -0.4971931, -3.050862, 1, 1, 1, 1, 1,
-2.115126, -2.066536, -1.719354, 1, 1, 1, 1, 1,
-2.08183, -0.8289557, 0.1663534, 1, 1, 1, 1, 1,
-2.078435, -2.075893, -4.921116, 1, 1, 1, 1, 1,
-2.040534, -0.04606225, -1.89097, 1, 1, 1, 1, 1,
-2.012705, -0.1769436, -2.99073, 1, 1, 1, 1, 1,
-2.005016, 0.6178265, -1.875789, 1, 1, 1, 1, 1,
-1.993654, -0.2861717, -1.565389, 1, 1, 1, 1, 1,
-1.97549, -0.3099262, -0.8429832, 1, 1, 1, 1, 1,
-1.968386, 1.107167, -0.5808324, 1, 1, 1, 1, 1,
-1.93925, 0.142862, -1.277433, 0, 0, 1, 1, 1,
-1.928497, -0.6710075, -4.130503, 1, 0, 0, 1, 1,
-1.889861, -0.2176082, -1.103001, 1, 0, 0, 1, 1,
-1.870715, -0.7143151, -2.792158, 1, 0, 0, 1, 1,
-1.838826, 0.7483661, -0.1298565, 1, 0, 0, 1, 1,
-1.824224, -0.3170967, -0.5262371, 1, 0, 0, 1, 1,
-1.814996, -0.9166694, -2.514655, 0, 0, 0, 1, 1,
-1.813747, 0.9493564, -0.7348405, 0, 0, 0, 1, 1,
-1.795853, -0.7771326, -0.4381954, 0, 0, 0, 1, 1,
-1.780245, -1.338012, -2.821713, 0, 0, 0, 1, 1,
-1.778003, -0.817307, -2.534472, 0, 0, 0, 1, 1,
-1.775553, -0.5545563, 0.6807641, 0, 0, 0, 1, 1,
-1.767775, 1.541372, -0.7430173, 0, 0, 0, 1, 1,
-1.751561, 0.1979724, -0.5414387, 1, 1, 1, 1, 1,
-1.750784, -1.041522, -1.763939, 1, 1, 1, 1, 1,
-1.745914, -2.644182, -3.563334, 1, 1, 1, 1, 1,
-1.735274, -0.4231277, -0.7391524, 1, 1, 1, 1, 1,
-1.731943, -0.02122867, -3.986641, 1, 1, 1, 1, 1,
-1.705047, 0.7478251, -2.963597, 1, 1, 1, 1, 1,
-1.703315, -0.1067632, -1.415454, 1, 1, 1, 1, 1,
-1.702766, -1.658707, -2.777789, 1, 1, 1, 1, 1,
-1.687328, -0.508098, -3.02028, 1, 1, 1, 1, 1,
-1.661405, -0.5961884, -0.3764008, 1, 1, 1, 1, 1,
-1.655907, -0.4119408, -1.731135, 1, 1, 1, 1, 1,
-1.652204, -0.6965064, -2.19154, 1, 1, 1, 1, 1,
-1.646359, -0.4636496, -4.340851, 1, 1, 1, 1, 1,
-1.640757, 0.3096513, 1.081247, 1, 1, 1, 1, 1,
-1.62921, 0.5117304, -0.9570572, 1, 1, 1, 1, 1,
-1.615106, 1.484941, -0.4734004, 0, 0, 1, 1, 1,
-1.607235, -0.3044901, -1.957347, 1, 0, 0, 1, 1,
-1.590627, 0.5370499, 1.200672, 1, 0, 0, 1, 1,
-1.586162, -0.3554616, -0.693372, 1, 0, 0, 1, 1,
-1.584168, -0.4448442, -2.033631, 1, 0, 0, 1, 1,
-1.583522, -0.4173504, -1.978557, 1, 0, 0, 1, 1,
-1.576998, 0.723472, -2.792377, 0, 0, 0, 1, 1,
-1.573696, 0.5186625, 0.2758026, 0, 0, 0, 1, 1,
-1.57355, 0.8407679, -1.42771, 0, 0, 0, 1, 1,
-1.565913, 0.633166, -0.9638128, 0, 0, 0, 1, 1,
-1.556074, -0.514771, -1.886152, 0, 0, 0, 1, 1,
-1.555135, -0.09114925, -1.411609, 0, 0, 0, 1, 1,
-1.54865, 0.07577614, 0.3832807, 0, 0, 0, 1, 1,
-1.543623, -0.1679395, -0.9024335, 1, 1, 1, 1, 1,
-1.522738, 2.001477, -0.334926, 1, 1, 1, 1, 1,
-1.519622, 0.2921132, -1.028469, 1, 1, 1, 1, 1,
-1.516238, 1.519667, 0.4521756, 1, 1, 1, 1, 1,
-1.495145, -0.4681786, -2.841199, 1, 1, 1, 1, 1,
-1.484373, -0.0838456, -2.575201, 1, 1, 1, 1, 1,
-1.459703, -1.749132, -2.116539, 1, 1, 1, 1, 1,
-1.456673, -0.2401509, -0.6081179, 1, 1, 1, 1, 1,
-1.448048, 0.400078, -1.244477, 1, 1, 1, 1, 1,
-1.443619, 0.2889263, -0.9078767, 1, 1, 1, 1, 1,
-1.436776, -0.8906551, -2.597759, 1, 1, 1, 1, 1,
-1.430565, 0.8676037, -0.08408348, 1, 1, 1, 1, 1,
-1.426843, 2.074064, -1.615872, 1, 1, 1, 1, 1,
-1.417387, 1.549021, -2.047549, 1, 1, 1, 1, 1,
-1.410335, 1.352697, -1.11526, 1, 1, 1, 1, 1,
-1.406871, 0.2788386, -1.271235, 0, 0, 1, 1, 1,
-1.402652, 0.1935594, -0.8869941, 1, 0, 0, 1, 1,
-1.391531, 1.970692, 0.3212767, 1, 0, 0, 1, 1,
-1.388739, 0.09691815, -1.345925, 1, 0, 0, 1, 1,
-1.376138, 0.03805063, -0.782643, 1, 0, 0, 1, 1,
-1.335603, 1.188344, -2.173809, 1, 0, 0, 1, 1,
-1.334752, -0.2336016, -1.666015, 0, 0, 0, 1, 1,
-1.332704, -1.822826, -2.123642, 0, 0, 0, 1, 1,
-1.317672, -1.04709, -0.8615856, 0, 0, 0, 1, 1,
-1.31754, 0.1831324, -1.147014, 0, 0, 0, 1, 1,
-1.317317, 1.569121, -1.337411, 0, 0, 0, 1, 1,
-1.310126, -0.2109445, -2.121215, 0, 0, 0, 1, 1,
-1.304614, 1.132122, -0.2270126, 0, 0, 0, 1, 1,
-1.303339, -0.1318886, -3.237725, 1, 1, 1, 1, 1,
-1.278654, -0.1502077, -1.740743, 1, 1, 1, 1, 1,
-1.269861, 0.4497228, -2.778586, 1, 1, 1, 1, 1,
-1.267516, 0.3445499, -0.5214775, 1, 1, 1, 1, 1,
-1.264813, -1.304161, -1.086426, 1, 1, 1, 1, 1,
-1.262077, 0.9617028, -0.2965544, 1, 1, 1, 1, 1,
-1.260601, 1.918068, -0.5698522, 1, 1, 1, 1, 1,
-1.26035, 0.4678311, -3.74104, 1, 1, 1, 1, 1,
-1.2586, -1.012272, -3.128762, 1, 1, 1, 1, 1,
-1.255415, -0.6659281, -1.057063, 1, 1, 1, 1, 1,
-1.251595, -1.171698, -2.828661, 1, 1, 1, 1, 1,
-1.25118, 0.6722875, -3.332859, 1, 1, 1, 1, 1,
-1.249207, -0.01953099, -2.573504, 1, 1, 1, 1, 1,
-1.243601, 0.9364795, -0.1965777, 1, 1, 1, 1, 1,
-1.241559, 0.5756935, -2.086438, 1, 1, 1, 1, 1,
-1.225753, -2.554756, -2.116066, 0, 0, 1, 1, 1,
-1.210185, 1.409311, -0.3179962, 1, 0, 0, 1, 1,
-1.205903, 1.890855, -1.459404, 1, 0, 0, 1, 1,
-1.202965, 0.08134488, -0.4364503, 1, 0, 0, 1, 1,
-1.200194, -0.6825532, -0.7451392, 1, 0, 0, 1, 1,
-1.187856, -0.02736962, -0.1193013, 1, 0, 0, 1, 1,
-1.185301, 0.1247931, -2.269339, 0, 0, 0, 1, 1,
-1.182347, -0.3640515, -1.614351, 0, 0, 0, 1, 1,
-1.180929, -0.678619, -2.228514, 0, 0, 0, 1, 1,
-1.180451, -0.6646967, -2.453309, 0, 0, 0, 1, 1,
-1.171778, 0.1183705, -1.53109, 0, 0, 0, 1, 1,
-1.171775, 1.685175, -2.394247, 0, 0, 0, 1, 1,
-1.163095, 0.4324522, -0.9784485, 0, 0, 0, 1, 1,
-1.16222, -0.8568602, -0.3235553, 1, 1, 1, 1, 1,
-1.162201, -2.372998, -2.430618, 1, 1, 1, 1, 1,
-1.161794, 0.5263476, -0.8360197, 1, 1, 1, 1, 1,
-1.160665, -0.7222968, -1.874317, 1, 1, 1, 1, 1,
-1.160098, -0.5919161, -1.611326, 1, 1, 1, 1, 1,
-1.159207, -0.07686824, -1.740743, 1, 1, 1, 1, 1,
-1.158188, -1.933716, -4.626921, 1, 1, 1, 1, 1,
-1.129447, -1.272993, -1.006046, 1, 1, 1, 1, 1,
-1.119004, -0.6535332, -1.931985, 1, 1, 1, 1, 1,
-1.118093, 0.1150593, 0.3778143, 1, 1, 1, 1, 1,
-1.116839, 0.9417316, -0.3151322, 1, 1, 1, 1, 1,
-1.107332, 0.23266, -1.75929, 1, 1, 1, 1, 1,
-1.102226, 1.150457, -0.7794324, 1, 1, 1, 1, 1,
-1.097333, 1.494118, -0.3875915, 1, 1, 1, 1, 1,
-1.094192, 1.458246, 0.1251115, 1, 1, 1, 1, 1,
-1.085263, 2.210907, -0.5208083, 0, 0, 1, 1, 1,
-1.080218, 0.9130082, -0.8742718, 1, 0, 0, 1, 1,
-1.077512, 0.1730847, -1.437282, 1, 0, 0, 1, 1,
-1.076272, 0.3809721, -0.7888218, 1, 0, 0, 1, 1,
-1.074678, 0.2659649, -0.8317198, 1, 0, 0, 1, 1,
-1.074227, 0.6285947, 0.08352266, 1, 0, 0, 1, 1,
-1.072117, 1.323599, -1.13069, 0, 0, 0, 1, 1,
-1.067673, 2.071994, -0.4263915, 0, 0, 0, 1, 1,
-1.064891, -0.2560036, -1.278478, 0, 0, 0, 1, 1,
-1.062822, 0.5417764, -1.922297, 0, 0, 0, 1, 1,
-1.060968, -2.326811, -2.120939, 0, 0, 0, 1, 1,
-1.056839, 0.6854113, 0.5614586, 0, 0, 0, 1, 1,
-1.052451, 1.430671, -1.216546, 0, 0, 0, 1, 1,
-1.04975, -1.1399, -2.683624, 1, 1, 1, 1, 1,
-1.038595, 1.203919, -1.18778, 1, 1, 1, 1, 1,
-1.037794, 0.1886382, -3.087747, 1, 1, 1, 1, 1,
-1.037434, 0.004624776, -1.314025, 1, 1, 1, 1, 1,
-1.033513, 1.287298, -0.05450359, 1, 1, 1, 1, 1,
-1.03064, -1.311504, -2.823431, 1, 1, 1, 1, 1,
-1.029206, -0.1440511, -2.946209, 1, 1, 1, 1, 1,
-1.020141, 1.380837, -1.773188, 1, 1, 1, 1, 1,
-1.017607, -0.3032391, -2.499726, 1, 1, 1, 1, 1,
-1.016401, 0.8062909, 0.1343622, 1, 1, 1, 1, 1,
-1.011487, 1.061624, 0.136222, 1, 1, 1, 1, 1,
-1.010775, -0.6218725, -2.894963, 1, 1, 1, 1, 1,
-1.005969, 1.309478, -2.486108, 1, 1, 1, 1, 1,
-0.9895334, -0.1824048, -0.9423622, 1, 1, 1, 1, 1,
-0.9863899, -0.1046914, -2.957355, 1, 1, 1, 1, 1,
-0.9811533, -0.01400374, -1.575108, 0, 0, 1, 1, 1,
-0.9703757, -1.581888, -3.076484, 1, 0, 0, 1, 1,
-0.9678728, 1.995815, -0.3581077, 1, 0, 0, 1, 1,
-0.967846, -1.501937, -2.652848, 1, 0, 0, 1, 1,
-0.9673145, 2.134463, -1.751766, 1, 0, 0, 1, 1,
-0.9617593, 0.2600066, -0.8685457, 1, 0, 0, 1, 1,
-0.9613887, 0.4721268, -0.9928819, 0, 0, 0, 1, 1,
-0.9555139, 0.4421995, -1.991351, 0, 0, 0, 1, 1,
-0.9426628, -0.1939435, -0.6772062, 0, 0, 0, 1, 1,
-0.9337757, 0.9059607, -1.448621, 0, 0, 0, 1, 1,
-0.9302444, -0.5746377, -3.162992, 0, 0, 0, 1, 1,
-0.9290611, 0.6025093, 0.5853863, 0, 0, 0, 1, 1,
-0.9282561, -0.3019663, -1.462395, 0, 0, 0, 1, 1,
-0.9252445, 1.837123, -0.5656731, 1, 1, 1, 1, 1,
-0.92018, -0.622273, -2.058377, 1, 1, 1, 1, 1,
-0.9185904, -1.144703, -2.843734, 1, 1, 1, 1, 1,
-0.9132726, -0.09740041, -2.069462, 1, 1, 1, 1, 1,
-0.9126316, 1.385692, -1.507804, 1, 1, 1, 1, 1,
-0.903186, 0.5058855, -0.1789271, 1, 1, 1, 1, 1,
-0.9001088, 0.7770552, -0.2785182, 1, 1, 1, 1, 1,
-0.8995056, -1.055052, -2.496707, 1, 1, 1, 1, 1,
-0.8968788, 0.8150651, -0.7979355, 1, 1, 1, 1, 1,
-0.8893294, -1.379977, -3.973196, 1, 1, 1, 1, 1,
-0.8743952, -0.1446902, -2.986209, 1, 1, 1, 1, 1,
-0.8735451, 0.04537921, -1.102635, 1, 1, 1, 1, 1,
-0.8663472, 0.3550118, -1.199212, 1, 1, 1, 1, 1,
-0.863528, 1.58736, -0.09283499, 1, 1, 1, 1, 1,
-0.8612598, 0.05691067, -2.437077, 1, 1, 1, 1, 1,
-0.8543311, 0.9188708, 0.1787248, 0, 0, 1, 1, 1,
-0.8535755, 2.786665, -0.4689836, 1, 0, 0, 1, 1,
-0.8519803, -0.2848735, -3.61584, 1, 0, 0, 1, 1,
-0.8487635, 0.5596471, -2.911494, 1, 0, 0, 1, 1,
-0.8441524, 1.101892, -1.245296, 1, 0, 0, 1, 1,
-0.8400822, -0.3247612, -1.22321, 1, 0, 0, 1, 1,
-0.8390926, -0.7627498, -2.67523, 0, 0, 0, 1, 1,
-0.8371658, -1.841277, -1.72985, 0, 0, 0, 1, 1,
-0.8327516, -0.3152493, -2.994782, 0, 0, 0, 1, 1,
-0.8277718, 2.39302, 0.3293509, 0, 0, 0, 1, 1,
-0.8091011, 1.326874, -1.770691, 0, 0, 0, 1, 1,
-0.8087642, 1.189983, 0.3177567, 0, 0, 0, 1, 1,
-0.8068373, -1.008865, -2.665635, 0, 0, 0, 1, 1,
-0.8043104, 0.9196026, -0.05736749, 1, 1, 1, 1, 1,
-0.800916, 0.08274323, -0.546313, 1, 1, 1, 1, 1,
-0.795781, -0.01669405, -2.30082, 1, 1, 1, 1, 1,
-0.7955723, 1.106343, -2.330611, 1, 1, 1, 1, 1,
-0.792848, 1.885177, -0.6559348, 1, 1, 1, 1, 1,
-0.7921555, -0.8682424, -2.849993, 1, 1, 1, 1, 1,
-0.7908961, -0.1741905, -4.447422, 1, 1, 1, 1, 1,
-0.7881947, 1.271332, 0.3371826, 1, 1, 1, 1, 1,
-0.787369, 0.5530059, -1.926862, 1, 1, 1, 1, 1,
-0.7734571, 0.2165785, -0.4438591, 1, 1, 1, 1, 1,
-0.772001, -1.390128, -4.138443, 1, 1, 1, 1, 1,
-0.7697186, 0.3959982, -0.8503514, 1, 1, 1, 1, 1,
-0.7693563, 0.222849, -0.9727567, 1, 1, 1, 1, 1,
-0.7681824, -0.8947179, -2.804576, 1, 1, 1, 1, 1,
-0.7648658, 0.02838242, -1.046867, 1, 1, 1, 1, 1,
-0.7638003, -0.2443904, -1.297469, 0, 0, 1, 1, 1,
-0.7607095, 0.1891312, 1.387685, 1, 0, 0, 1, 1,
-0.7566836, 1.155313, 0.1861578, 1, 0, 0, 1, 1,
-0.7543736, 1.486903, 0.2922357, 1, 0, 0, 1, 1,
-0.7412412, 0.4492078, -0.6642452, 1, 0, 0, 1, 1,
-0.7324823, 1.107311, 0.3346046, 1, 0, 0, 1, 1,
-0.7321366, 0.3904966, -0.8388405, 0, 0, 0, 1, 1,
-0.7265615, 1.479377, 1.244834, 0, 0, 0, 1, 1,
-0.7258992, -0.1564585, -1.561414, 0, 0, 0, 1, 1,
-0.7207372, -0.3685347, -3.154296, 0, 0, 0, 1, 1,
-0.71999, -0.452616, -4.137677, 0, 0, 0, 1, 1,
-0.7152127, -1.180629, -2.813097, 0, 0, 0, 1, 1,
-0.712136, -0.4465649, -2.709592, 0, 0, 0, 1, 1,
-0.709237, 0.7729769, -0.0954849, 1, 1, 1, 1, 1,
-0.707921, 0.2096904, -0.8807782, 1, 1, 1, 1, 1,
-0.7076927, -1.574476, -2.710453, 1, 1, 1, 1, 1,
-0.7064966, 1.655877, -0.8579093, 1, 1, 1, 1, 1,
-0.7064127, 0.1056246, -0.254016, 1, 1, 1, 1, 1,
-0.6978115, 0.8039972, -0.7474814, 1, 1, 1, 1, 1,
-0.6934298, 0.8944728, 0.7714552, 1, 1, 1, 1, 1,
-0.6880571, -0.366482, -0.9713137, 1, 1, 1, 1, 1,
-0.6879663, 0.5174475, 0.2055032, 1, 1, 1, 1, 1,
-0.6845229, 1.013467, 1.73209, 1, 1, 1, 1, 1,
-0.6816898, 0.5186501, -2.235576, 1, 1, 1, 1, 1,
-0.6790533, 0.1813912, -0.6192455, 1, 1, 1, 1, 1,
-0.6756721, 2.135918, -0.6976928, 1, 1, 1, 1, 1,
-0.6724064, -0.5679786, -1.769388, 1, 1, 1, 1, 1,
-0.6714786, -0.8739728, -2.006198, 1, 1, 1, 1, 1,
-0.6713989, 0.3888667, -2.792479, 0, 0, 1, 1, 1,
-0.6688746, -0.3055835, -2.320346, 1, 0, 0, 1, 1,
-0.6620522, -1.962802, -2.620779, 1, 0, 0, 1, 1,
-0.661159, 0.5436648, -0.792646, 1, 0, 0, 1, 1,
-0.6596975, 0.4662606, -0.1512128, 1, 0, 0, 1, 1,
-0.6594153, -0.7785534, -3.355307, 1, 0, 0, 1, 1,
-0.6587123, -0.4368673, -1.582999, 0, 0, 0, 1, 1,
-0.6557032, -1.603076, -1.905542, 0, 0, 0, 1, 1,
-0.6488401, 0.2113156, -1.446172, 0, 0, 0, 1, 1,
-0.6473031, -0.264784, -1.841443, 0, 0, 0, 1, 1,
-0.6358663, 0.7896683, -1.312705, 0, 0, 0, 1, 1,
-0.6342337, 1.658549, -0.2718592, 0, 0, 0, 1, 1,
-0.6275365, 0.6307147, -0.03490363, 0, 0, 0, 1, 1,
-0.6271693, -0.6072763, -2.534301, 1, 1, 1, 1, 1,
-0.6257797, 0.08740839, -2.83915, 1, 1, 1, 1, 1,
-0.6233447, 0.7996322, -0.5328143, 1, 1, 1, 1, 1,
-0.6184492, 2.825343, 0.3890632, 1, 1, 1, 1, 1,
-0.6146812, 0.1367094, -1.659024, 1, 1, 1, 1, 1,
-0.6129497, -0.9496093, -4.615112, 1, 1, 1, 1, 1,
-0.612508, -0.8898351, -4.065988, 1, 1, 1, 1, 1,
-0.6104794, -1.004167, -1.744493, 1, 1, 1, 1, 1,
-0.6061863, 0.1209986, -1.795941, 1, 1, 1, 1, 1,
-0.6022196, 1.126179, 0.5855922, 1, 1, 1, 1, 1,
-0.6021468, 0.09055381, -0.363805, 1, 1, 1, 1, 1,
-0.6008723, -0.5485819, -2.710808, 1, 1, 1, 1, 1,
-0.6005902, -1.169995, -1.496621, 1, 1, 1, 1, 1,
-0.597039, -0.6240886, -4.38305, 1, 1, 1, 1, 1,
-0.5902784, -0.3551455, -1.853686, 1, 1, 1, 1, 1,
-0.5900291, 0.7420264, -0.4382865, 0, 0, 1, 1, 1,
-0.5898769, -1.06006, -2.526359, 1, 0, 0, 1, 1,
-0.5883659, 1.582371, 0.712293, 1, 0, 0, 1, 1,
-0.5867402, 2.157998, 0.4199362, 1, 0, 0, 1, 1,
-0.5853112, 0.9497339, -1.289875, 1, 0, 0, 1, 1,
-0.5801581, 0.4253473, -0.6685514, 1, 0, 0, 1, 1,
-0.579814, 1.192825, -1.263745, 0, 0, 0, 1, 1,
-0.578747, 0.6134245, -2.2025, 0, 0, 0, 1, 1,
-0.5786313, 0.2981434, -1.930488, 0, 0, 0, 1, 1,
-0.5750871, 0.9565297, -1.308685, 0, 0, 0, 1, 1,
-0.572814, -0.8711532, -4.80801, 0, 0, 0, 1, 1,
-0.5704201, 0.9580304, 1.075557, 0, 0, 0, 1, 1,
-0.5667158, -1.449128, -1.241125, 0, 0, 0, 1, 1,
-0.5596591, -0.9212624, -0.2682529, 1, 1, 1, 1, 1,
-0.5572342, 2.729798, -1.294969, 1, 1, 1, 1, 1,
-0.5554664, -0.8943412, -3.825599, 1, 1, 1, 1, 1,
-0.5526953, -0.6813736, -2.277682, 1, 1, 1, 1, 1,
-0.5390365, -0.4811205, -0.2618799, 1, 1, 1, 1, 1,
-0.5379433, -1.235756, -1.769379, 1, 1, 1, 1, 1,
-0.5372378, -0.03626402, -1.445794, 1, 1, 1, 1, 1,
-0.5358013, 0.9818208, 0.7658095, 1, 1, 1, 1, 1,
-0.5286467, 0.5871642, -1.01513, 1, 1, 1, 1, 1,
-0.5186896, -0.3645734, -3.192636, 1, 1, 1, 1, 1,
-0.5099908, 0.5136023, -0.9853153, 1, 1, 1, 1, 1,
-0.503208, 0.3292969, -1.161442, 1, 1, 1, 1, 1,
-0.5031324, 0.2194601, -0.5942658, 1, 1, 1, 1, 1,
-0.5000889, 0.2426425, -0.7117914, 1, 1, 1, 1, 1,
-0.4991094, 2.461964, -1.079578, 1, 1, 1, 1, 1,
-0.4987394, 0.05543192, -0.5879987, 0, 0, 1, 1, 1,
-0.4921359, 1.735278, -0.9193335, 1, 0, 0, 1, 1,
-0.490707, 1.815541, -2.316058, 1, 0, 0, 1, 1,
-0.4899748, -1.362689, -2.729865, 1, 0, 0, 1, 1,
-0.4869969, 2.914162, -1.634611, 1, 0, 0, 1, 1,
-0.4865996, -1.207477, -2.525239, 1, 0, 0, 1, 1,
-0.4853129, 0.04327917, -2.926976, 0, 0, 0, 1, 1,
-0.4850237, -0.5308225, -0.4115649, 0, 0, 0, 1, 1,
-0.4836953, 0.2889031, -1.504259, 0, 0, 0, 1, 1,
-0.4797371, 2.193272, -1.588411, 0, 0, 0, 1, 1,
-0.4777665, 1.645325, 0.219091, 0, 0, 0, 1, 1,
-0.4775211, -0.5446302, -3.112557, 0, 0, 0, 1, 1,
-0.4767897, -0.08397488, 0.2861702, 0, 0, 0, 1, 1,
-0.4761301, 1.517531, 0.2187321, 1, 1, 1, 1, 1,
-0.4680788, -0.6770651, -2.196209, 1, 1, 1, 1, 1,
-0.4659891, 0.02214842, -1.088181, 1, 1, 1, 1, 1,
-0.4650664, 0.7432245, -0.7567413, 1, 1, 1, 1, 1,
-0.4590758, 0.9566967, -0.9898491, 1, 1, 1, 1, 1,
-0.4562871, -0.4570108, -3.493453, 1, 1, 1, 1, 1,
-0.4559108, -0.1104935, -0.08753068, 1, 1, 1, 1, 1,
-0.4558572, -1.328274, -3.157105, 1, 1, 1, 1, 1,
-0.4549768, 0.4142701, -0.5990562, 1, 1, 1, 1, 1,
-0.4513347, -2.336387, -3.169609, 1, 1, 1, 1, 1,
-0.4499474, -0.2743388, -1.530548, 1, 1, 1, 1, 1,
-0.4464824, 1.35073, 0.1847037, 1, 1, 1, 1, 1,
-0.4453993, -0.05449073, -1.655715, 1, 1, 1, 1, 1,
-0.4446028, 0.5707316, 0.4181575, 1, 1, 1, 1, 1,
-0.4426428, 0.1956851, -1.792876, 1, 1, 1, 1, 1,
-0.4284867, 0.2007473, -2.148828, 0, 0, 1, 1, 1,
-0.4281969, 0.566402, -0.9943907, 1, 0, 0, 1, 1,
-0.4276271, -0.5193419, -1.851469, 1, 0, 0, 1, 1,
-0.4097894, -0.45597, -3.960824, 1, 0, 0, 1, 1,
-0.4021075, 2.368955, -0.1187239, 1, 0, 0, 1, 1,
-0.3955918, -0.3943636, -1.853542, 1, 0, 0, 1, 1,
-0.3923088, -0.3903148, -2.309572, 0, 0, 0, 1, 1,
-0.3913686, -1.642146, -3.478276, 0, 0, 0, 1, 1,
-0.3814766, -2.147712, -0.5490817, 0, 0, 0, 1, 1,
-0.3797144, 0.0884658, -1.708975, 0, 0, 0, 1, 1,
-0.3767511, -1.260406, -4.073146, 0, 0, 0, 1, 1,
-0.376008, 0.404406, -0.2166306, 0, 0, 0, 1, 1,
-0.3725877, -1.131975, -2.641746, 0, 0, 0, 1, 1,
-0.3724782, -1.225184, -2.729388, 1, 1, 1, 1, 1,
-0.3712795, -0.8573086, -1.951629, 1, 1, 1, 1, 1,
-0.3686421, 2.191328, 0.4831039, 1, 1, 1, 1, 1,
-0.3677289, -2.073208, -2.748114, 1, 1, 1, 1, 1,
-0.3653734, -0.805627, -3.427931, 1, 1, 1, 1, 1,
-0.357951, 0.3950217, 0.06749207, 1, 1, 1, 1, 1,
-0.3552779, 0.1650236, -2.130781, 1, 1, 1, 1, 1,
-0.3546665, -0.330607, -1.957861, 1, 1, 1, 1, 1,
-0.3460014, 0.1068766, -1.814689, 1, 1, 1, 1, 1,
-0.3449393, -0.2264354, -3.282506, 1, 1, 1, 1, 1,
-0.3442306, -0.7683463, -3.153471, 1, 1, 1, 1, 1,
-0.3417891, -0.5933955, -2.769329, 1, 1, 1, 1, 1,
-0.3407692, -0.1077492, -2.836574, 1, 1, 1, 1, 1,
-0.3399736, -0.2742582, -2.244034, 1, 1, 1, 1, 1,
-0.338395, -0.2165478, -1.294164, 1, 1, 1, 1, 1,
-0.3369748, 0.3110334, 0.1035221, 0, 0, 1, 1, 1,
-0.3348568, 0.9201382, -0.9361098, 1, 0, 0, 1, 1,
-0.334525, 0.1468891, -0.04254245, 1, 0, 0, 1, 1,
-0.3332343, 0.2339826, -2.293239, 1, 0, 0, 1, 1,
-0.3321668, -0.7669708, -3.203673, 1, 0, 0, 1, 1,
-0.3299962, -1.197868, -3.359113, 1, 0, 0, 1, 1,
-0.3213365, -0.8573366, -3.845016, 0, 0, 0, 1, 1,
-0.3206289, -0.8321537, -1.087345, 0, 0, 0, 1, 1,
-0.3127362, 1.51126, 0.3143278, 0, 0, 0, 1, 1,
-0.3122638, 0.08864454, -1.540919, 0, 0, 0, 1, 1,
-0.3079606, -0.5933547, -2.087001, 0, 0, 0, 1, 1,
-0.307351, 1.893656, -0.8723788, 0, 0, 0, 1, 1,
-0.3024132, 0.0347886, -0.9743521, 0, 0, 0, 1, 1,
-0.2990739, 0.04775636, -2.711026, 1, 1, 1, 1, 1,
-0.2960934, -1.043613, -3.398983, 1, 1, 1, 1, 1,
-0.292165, -0.5951407, -3.663558, 1, 1, 1, 1, 1,
-0.2894968, -0.03460744, -0.9896086, 1, 1, 1, 1, 1,
-0.2884204, 1.726008, 2.089149, 1, 1, 1, 1, 1,
-0.2849503, 0.09285904, -1.710683, 1, 1, 1, 1, 1,
-0.2846585, 0.07830802, -0.9861853, 1, 1, 1, 1, 1,
-0.2820266, -0.7183251, -5.639339, 1, 1, 1, 1, 1,
-0.2808825, 0.4322554, -1.381685, 1, 1, 1, 1, 1,
-0.273842, -2.516355, -2.815941, 1, 1, 1, 1, 1,
-0.2729516, -2.168181, -1.995381, 1, 1, 1, 1, 1,
-0.2672727, 1.737307, -0.4667263, 1, 1, 1, 1, 1,
-0.2633556, -0.1091351, -1.752972, 1, 1, 1, 1, 1,
-0.2562291, 1.338831, -0.07162554, 1, 1, 1, 1, 1,
-0.2537632, -0.1302541, -1.927228, 1, 1, 1, 1, 1,
-0.2529742, 2.37524, -0.8916849, 0, 0, 1, 1, 1,
-0.2491581, 1.205426, -0.4626221, 1, 0, 0, 1, 1,
-0.2489285, -0.2257082, -0.7444158, 1, 0, 0, 1, 1,
-0.2451788, -0.5867668, -3.903334, 1, 0, 0, 1, 1,
-0.2429148, 2.399726, 0.3330621, 1, 0, 0, 1, 1,
-0.2376936, -0.4068244, -1.083873, 1, 0, 0, 1, 1,
-0.2361796, 0.3659667, 0.2748666, 0, 0, 0, 1, 1,
-0.2268936, -2.81829, -2.003695, 0, 0, 0, 1, 1,
-0.224111, 1.229175, -2.056003, 0, 0, 0, 1, 1,
-0.2222345, -1.139117, -2.770512, 0, 0, 0, 1, 1,
-0.2214703, 1.37766, 0.1700778, 0, 0, 0, 1, 1,
-0.2210365, 0.7939598, -1.081824, 0, 0, 0, 1, 1,
-0.2206658, -1.097323, -2.369621, 0, 0, 0, 1, 1,
-0.218295, 1.85595, 0.06783696, 1, 1, 1, 1, 1,
-0.2179893, -2.214491, -2.670403, 1, 1, 1, 1, 1,
-0.2174255, -1.474462, -3.913763, 1, 1, 1, 1, 1,
-0.2158108, -0.5856307, -4.650317, 1, 1, 1, 1, 1,
-0.2141464, -1.089592, -5.36422, 1, 1, 1, 1, 1,
-0.2138311, -1.09289, -3.164621, 1, 1, 1, 1, 1,
-0.2118768, 1.121295, 0.7909868, 1, 1, 1, 1, 1,
-0.2107428, -1.323903, -3.132447, 1, 1, 1, 1, 1,
-0.2101422, -0.8487436, -3.356939, 1, 1, 1, 1, 1,
-0.2066091, -0.7920993, -2.247236, 1, 1, 1, 1, 1,
-0.2062496, 2.425793, 0.3534011, 1, 1, 1, 1, 1,
-0.2038186, -0.04668187, -1.029027, 1, 1, 1, 1, 1,
-0.1996862, -0.7948337, -4.535141, 1, 1, 1, 1, 1,
-0.1991263, 0.3561208, 0.6911193, 1, 1, 1, 1, 1,
-0.1973491, -0.9945548, -3.007626, 1, 1, 1, 1, 1,
-0.1934928, -0.2844515, -0.3678894, 0, 0, 1, 1, 1,
-0.1910557, -1.840072, -4.002624, 1, 0, 0, 1, 1,
-0.1841719, -0.6167835, -3.120148, 1, 0, 0, 1, 1,
-0.1794992, 1.412959, -0.02168355, 1, 0, 0, 1, 1,
-0.1714411, 0.2788453, 1.260588, 1, 0, 0, 1, 1,
-0.1713461, 0.6939766, -1.564498, 1, 0, 0, 1, 1,
-0.1685913, -0.3761391, -2.982783, 0, 0, 0, 1, 1,
-0.166102, 0.6973934, 0.5249235, 0, 0, 0, 1, 1,
-0.1656778, -0.2075402, -1.433064, 0, 0, 0, 1, 1,
-0.165149, -1.277875, -2.441509, 0, 0, 0, 1, 1,
-0.1614797, 2.340168, 0.3062835, 0, 0, 0, 1, 1,
-0.1586805, -0.9234631, -3.777571, 0, 0, 0, 1, 1,
-0.1579981, 1.415214, -1.02821, 0, 0, 0, 1, 1,
-0.1546048, -0.9652474, -2.848307, 1, 1, 1, 1, 1,
-0.1540524, -0.5427197, -1.905119, 1, 1, 1, 1, 1,
-0.1537327, -0.2407934, -1.768237, 1, 1, 1, 1, 1,
-0.1505015, 0.3472481, 0.4087977, 1, 1, 1, 1, 1,
-0.1466233, -0.1803351, -2.227608, 1, 1, 1, 1, 1,
-0.1453776, 0.8945035, 0.1796471, 1, 1, 1, 1, 1,
-0.1434735, -1.404706, -4.790549, 1, 1, 1, 1, 1,
-0.1394627, -1.586562, -4.086129, 1, 1, 1, 1, 1,
-0.1394383, 0.3846361, -1.021837, 1, 1, 1, 1, 1,
-0.1391095, 0.7163849, -0.3267093, 1, 1, 1, 1, 1,
-0.1344885, 1.056668, 0.002922966, 1, 1, 1, 1, 1,
-0.1324857, 0.2052611, -0.2288569, 1, 1, 1, 1, 1,
-0.1314061, -0.5415422, -2.80988, 1, 1, 1, 1, 1,
-0.1302863, 1.355773, 1.125598, 1, 1, 1, 1, 1,
-0.1296643, -0.4173273, -4.213371, 1, 1, 1, 1, 1,
-0.123967, -1.140554, -2.79957, 0, 0, 1, 1, 1,
-0.1218083, -0.3483868, -2.555027, 1, 0, 0, 1, 1,
-0.1155929, -0.5401325, -5.457437, 1, 0, 0, 1, 1,
-0.1132272, -0.634017, -2.496828, 1, 0, 0, 1, 1,
-0.1120192, -1.050799, -4.549723, 1, 0, 0, 1, 1,
-0.1096088, 0.6409004, -0.5920311, 1, 0, 0, 1, 1,
-0.1084397, -0.1115328, -0.9698595, 0, 0, 0, 1, 1,
-0.1042042, -0.3031594, -2.415664, 0, 0, 0, 1, 1,
-0.1010802, 0.9270708, 0.3558224, 0, 0, 0, 1, 1,
-0.1009542, 0.8714762, -1.327267, 0, 0, 0, 1, 1,
-0.09960669, 1.841265, 0.02654572, 0, 0, 0, 1, 1,
-0.09941965, 0.9362574, -1.335121, 0, 0, 0, 1, 1,
-0.09704616, -1.288812, -2.219402, 0, 0, 0, 1, 1,
-0.09700828, 0.6939715, 0.3610529, 1, 1, 1, 1, 1,
-0.09534878, -0.9284011, -3.265874, 1, 1, 1, 1, 1,
-0.09498711, -0.1418761, -3.277144, 1, 1, 1, 1, 1,
-0.09108279, -1.618029, -2.84362, 1, 1, 1, 1, 1,
-0.0897602, -0.1441244, -3.921849, 1, 1, 1, 1, 1,
-0.08696185, 0.5268279, 0.2880091, 1, 1, 1, 1, 1,
-0.08667441, -0.8397027, -4.593372, 1, 1, 1, 1, 1,
-0.08509941, -0.4894338, -0.7530978, 1, 1, 1, 1, 1,
-0.08303519, 0.628921, 1.619894, 1, 1, 1, 1, 1,
-0.07869028, 1.632506, -0.09306383, 1, 1, 1, 1, 1,
-0.07835175, 0.7810899, -0.4315382, 1, 1, 1, 1, 1,
-0.07814118, 1.068451, 1.883737, 1, 1, 1, 1, 1,
-0.07188322, -0.9394587, -3.364824, 1, 1, 1, 1, 1,
-0.06852438, -0.2754616, -3.028667, 1, 1, 1, 1, 1,
-0.06846383, 1.269427, -2.008177, 1, 1, 1, 1, 1,
-0.06758527, 0.509256, -2.77004, 0, 0, 1, 1, 1,
-0.06528033, -0.1937388, -1.388939, 1, 0, 0, 1, 1,
-0.05723706, 1.188342, 0.4748802, 1, 0, 0, 1, 1,
-0.04954691, -0.8328918, -2.162323, 1, 0, 0, 1, 1,
-0.04618626, 0.07288318, 0.4243444, 1, 0, 0, 1, 1,
-0.04291563, -0.2539365, -5.121603, 1, 0, 0, 1, 1,
-0.0417183, 1.083959, -1.385112, 0, 0, 0, 1, 1,
-0.04153195, 0.6660737, -0.5494354, 0, 0, 0, 1, 1,
-0.03877167, -1.240049, -1.475368, 0, 0, 0, 1, 1,
-0.03821915, 0.6733397, 0.7843407, 0, 0, 0, 1, 1,
-0.03763393, 0.4824919, -0.5246015, 0, 0, 0, 1, 1,
-0.0361603, 0.4396607, -0.576985, 0, 0, 0, 1, 1,
-0.03169781, -0.5959857, -1.482543, 0, 0, 0, 1, 1,
-0.02674267, -0.8399842, -3.699596, 1, 1, 1, 1, 1,
-0.02657567, -1.428377, -3.253037, 1, 1, 1, 1, 1,
-0.02583699, -0.6574301, -2.410909, 1, 1, 1, 1, 1,
-0.02187118, 0.5899671, -0.9190291, 1, 1, 1, 1, 1,
-0.02118392, -0.1501457, -4.063139, 1, 1, 1, 1, 1,
-0.01774713, -1.407445, -2.330545, 1, 1, 1, 1, 1,
-0.01622852, 0.350879, -0.185754, 1, 1, 1, 1, 1,
-0.00826595, -0.574415, -1.314359, 1, 1, 1, 1, 1,
-0.007565831, -1.309484, -3.227048, 1, 1, 1, 1, 1,
-0.003981688, -1.177392, -4.147304, 1, 1, 1, 1, 1,
-0.003665489, 1.062583, 1.317093, 1, 1, 1, 1, 1,
-0.00295613, -0.0139638, -3.853298, 1, 1, 1, 1, 1,
0.001046408, -0.6465645, 2.012637, 1, 1, 1, 1, 1,
0.006609775, 0.6247776, -0.1084029, 1, 1, 1, 1, 1,
0.008634092, 0.3340574, 0.6108915, 1, 1, 1, 1, 1,
0.01504729, -1.913435, 3.804047, 0, 0, 1, 1, 1,
0.01507117, -0.8103793, 1.583112, 1, 0, 0, 1, 1,
0.01686542, 1.336911, 2.527938, 1, 0, 0, 1, 1,
0.01856637, -0.7958872, 4.5006, 1, 0, 0, 1, 1,
0.01963837, -0.06198149, 3.261446, 1, 0, 0, 1, 1,
0.03133769, -0.2653249, 1.744838, 1, 0, 0, 1, 1,
0.0324096, -0.5621253, 2.828383, 0, 0, 0, 1, 1,
0.0331435, 0.7350704, -0.40968, 0, 0, 0, 1, 1,
0.03438001, 0.2404904, 0.09478546, 0, 0, 0, 1, 1,
0.03627015, -1.609532, 2.010431, 0, 0, 0, 1, 1,
0.04757447, -0.8279148, 3.683674, 0, 0, 0, 1, 1,
0.05171127, 2.269895, -0.2952675, 0, 0, 0, 1, 1,
0.05197408, -0.0219678, 2.777296, 0, 0, 0, 1, 1,
0.0559707, 2.386861, -1.66133, 1, 1, 1, 1, 1,
0.05782272, 0.5993102, 0.5160742, 1, 1, 1, 1, 1,
0.06043161, -0.4260577, 5.786831, 1, 1, 1, 1, 1,
0.06344657, -0.9910269, 3.217802, 1, 1, 1, 1, 1,
0.06604376, -1.088814, 1.331788, 1, 1, 1, 1, 1,
0.077168, -0.6766043, 1.888727, 1, 1, 1, 1, 1,
0.07717216, 0.4341184, 0.07393164, 1, 1, 1, 1, 1,
0.08029094, 0.3347513, -0.05513357, 1, 1, 1, 1, 1,
0.08179823, -0.874966, 4.409776, 1, 1, 1, 1, 1,
0.09194706, 0.9126452, 0.341746, 1, 1, 1, 1, 1,
0.09303796, 1.939073, -0.9492741, 1, 1, 1, 1, 1,
0.0969405, 0.8851354, 1.778694, 1, 1, 1, 1, 1,
0.09741569, -0.1883205, 1.124663, 1, 1, 1, 1, 1,
0.1024723, 0.7626154, 0.8237304, 1, 1, 1, 1, 1,
0.1024802, 1.02348, -0.5412844, 1, 1, 1, 1, 1,
0.1079213, 0.5961598, -1.158388, 0, 0, 1, 1, 1,
0.1209636, -1.952561, 3.222337, 1, 0, 0, 1, 1,
0.1225544, -0.7563506, 1.054795, 1, 0, 0, 1, 1,
0.1295843, -2.659591, 4.964846, 1, 0, 0, 1, 1,
0.1401107, -0.1004722, 0.1477066, 1, 0, 0, 1, 1,
0.1415773, -2.375279, 2.374035, 1, 0, 0, 1, 1,
0.1472339, 0.8103371, 2.509846, 0, 0, 0, 1, 1,
0.1473022, 0.6842626, -0.5157858, 0, 0, 0, 1, 1,
0.1488519, -0.6086183, 3.900327, 0, 0, 0, 1, 1,
0.1511198, 0.3557181, 0.8315096, 0, 0, 0, 1, 1,
0.1520558, -0.9238827, 0.9374856, 0, 0, 0, 1, 1,
0.1532595, 0.4094564, 0.386006, 0, 0, 0, 1, 1,
0.1583393, 0.2669667, 1.495205, 0, 0, 0, 1, 1,
0.1624753, -0.02990458, 0.9653946, 1, 1, 1, 1, 1,
0.1631569, 0.1385391, 1.674249, 1, 1, 1, 1, 1,
0.1634527, -0.2629246, 2.972034, 1, 1, 1, 1, 1,
0.1648436, -2.183199, 5.456114, 1, 1, 1, 1, 1,
0.1651436, 0.03201561, 0.2217765, 1, 1, 1, 1, 1,
0.1711402, 0.3789107, 0.1129319, 1, 1, 1, 1, 1,
0.1739164, 0.1909111, 3.077143, 1, 1, 1, 1, 1,
0.1772998, 1.077173, -0.06174615, 1, 1, 1, 1, 1,
0.177355, -1.843448, 1.996119, 1, 1, 1, 1, 1,
0.1783445, 0.4393965, 1.787159, 1, 1, 1, 1, 1,
0.1797102, 0.7573474, 0.7464184, 1, 1, 1, 1, 1,
0.181135, 1.326429, 0.9908765, 1, 1, 1, 1, 1,
0.1952137, 0.6811431, 2.01839, 1, 1, 1, 1, 1,
0.1986554, -2.040994, 3.504377, 1, 1, 1, 1, 1,
0.2016253, -0.01122786, 2.33607, 1, 1, 1, 1, 1,
0.2037382, -1.107819, 1.395, 0, 0, 1, 1, 1,
0.2064541, -0.8418376, 3.924025, 1, 0, 0, 1, 1,
0.2094927, 0.2066464, -0.7119799, 1, 0, 0, 1, 1,
0.2106996, 0.9286512, 0.5589588, 1, 0, 0, 1, 1,
0.218293, -0.3397085, 2.296675, 1, 0, 0, 1, 1,
0.2189444, 0.21263, 0.4622978, 1, 0, 0, 1, 1,
0.2273271, -0.6518592, 2.401983, 0, 0, 0, 1, 1,
0.2280628, -0.1973015, 2.151218, 0, 0, 0, 1, 1,
0.2317431, -1.065145, 2.16273, 0, 0, 0, 1, 1,
0.2324854, -0.862491, 2.915834, 0, 0, 0, 1, 1,
0.2378882, -0.7377861, 3.90668, 0, 0, 0, 1, 1,
0.2427393, -0.09198613, 2.28045, 0, 0, 0, 1, 1,
0.2479625, 0.4253551, -0.4758571, 0, 0, 0, 1, 1,
0.2480997, -0.4081255, 2.173493, 1, 1, 1, 1, 1,
0.24854, -0.4451226, 3.300338, 1, 1, 1, 1, 1,
0.2485861, 0.9280598, -1.069838, 1, 1, 1, 1, 1,
0.2556954, 0.4047902, 2.261217, 1, 1, 1, 1, 1,
0.2558, -1.316666, 2.356416, 1, 1, 1, 1, 1,
0.2571929, -1.225683, 4.097373, 1, 1, 1, 1, 1,
0.2592612, 1.854855, -0.9388347, 1, 1, 1, 1, 1,
0.2668199, -0.5571785, 3.065656, 1, 1, 1, 1, 1,
0.2681505, 0.2413889, 1.785189, 1, 1, 1, 1, 1,
0.2692962, -1.586948, 1.957965, 1, 1, 1, 1, 1,
0.2706057, -0.8643872, 2.782501, 1, 1, 1, 1, 1,
0.2733372, -0.01162918, 1.035126, 1, 1, 1, 1, 1,
0.2757153, -1.41409, 1.737792, 1, 1, 1, 1, 1,
0.28077, 1.074708, -0.4959123, 1, 1, 1, 1, 1,
0.2810896, -1.883149, 3.755124, 1, 1, 1, 1, 1,
0.2867344, 0.8256111, 0.5142117, 0, 0, 1, 1, 1,
0.2889769, 1.690999, -1.941639, 1, 0, 0, 1, 1,
0.2921564, -0.3755005, 2.399896, 1, 0, 0, 1, 1,
0.2943042, -0.4808271, 0.6339098, 1, 0, 0, 1, 1,
0.2972906, 0.1853183, 1.797791, 1, 0, 0, 1, 1,
0.3005829, -0.4151625, 2.124214, 1, 0, 0, 1, 1,
0.301472, -0.9192838, 3.84652, 0, 0, 0, 1, 1,
0.3049214, 1.352693, -0.8999791, 0, 0, 0, 1, 1,
0.3049242, 0.01759415, 2.511531, 0, 0, 0, 1, 1,
0.3056156, -0.9986316, 3.455058, 0, 0, 0, 1, 1,
0.3056494, 0.5383327, -0.8448551, 0, 0, 0, 1, 1,
0.3175266, 0.4475265, 0.7982196, 0, 0, 0, 1, 1,
0.3212066, -0.5582173, 3.851451, 0, 0, 0, 1, 1,
0.3239323, -1.782213, 3.172596, 1, 1, 1, 1, 1,
0.3259946, -0.771509, 3.395684, 1, 1, 1, 1, 1,
0.3281269, -0.3645959, 4.842901, 1, 1, 1, 1, 1,
0.3288324, 0.0931722, -0.7799596, 1, 1, 1, 1, 1,
0.3294454, -0.3798719, 2.517472, 1, 1, 1, 1, 1,
0.3320188, 0.9511578, -0.1579504, 1, 1, 1, 1, 1,
0.3343324, -1.957814, 2.798463, 1, 1, 1, 1, 1,
0.3347208, -0.1090982, 1.493145, 1, 1, 1, 1, 1,
0.3375479, -0.1280501, 1.560586, 1, 1, 1, 1, 1,
0.3385134, -1.490485, 3.169759, 1, 1, 1, 1, 1,
0.3394912, -1.127043, 3.379247, 1, 1, 1, 1, 1,
0.3401438, 0.4508295, 0.2579225, 1, 1, 1, 1, 1,
0.3431334, 0.2909992, 1.060063, 1, 1, 1, 1, 1,
0.3442681, -0.05886758, 0.8059151, 1, 1, 1, 1, 1,
0.3446625, -0.2323422, 1.526474, 1, 1, 1, 1, 1,
0.3474018, 2.132757, 0.5444365, 0, 0, 1, 1, 1,
0.3494161, 0.07213862, 1.544653, 1, 0, 0, 1, 1,
0.3530126, 0.835357, 0.8648128, 1, 0, 0, 1, 1,
0.3566972, 0.3329054, 1.616627, 1, 0, 0, 1, 1,
0.3576632, 0.5800808, -0.8732572, 1, 0, 0, 1, 1,
0.3576729, 1.465915, -1.915961, 1, 0, 0, 1, 1,
0.3606579, 2.616565, 1.29436, 0, 0, 0, 1, 1,
0.3620532, 1.344056, -0.05681013, 0, 0, 0, 1, 1,
0.3644353, -1.177603, 2.054677, 0, 0, 0, 1, 1,
0.3659799, -0.299188, 4.190773, 0, 0, 0, 1, 1,
0.3688721, 2.594122, 1.137506, 0, 0, 0, 1, 1,
0.3708314, 0.7823743, -0.4789356, 0, 0, 0, 1, 1,
0.3757345, 0.1708964, 1.050017, 0, 0, 0, 1, 1,
0.3767608, 1.18995, 0.6060721, 1, 1, 1, 1, 1,
0.3768876, -0.815024, 3.65735, 1, 1, 1, 1, 1,
0.3769121, -0.2655956, 2.766286, 1, 1, 1, 1, 1,
0.378835, 1.536652, -0.03657638, 1, 1, 1, 1, 1,
0.379621, -0.1327192, -0.63992, 1, 1, 1, 1, 1,
0.380633, -1.167094, 3.339028, 1, 1, 1, 1, 1,
0.3837582, -0.3632479, 2.45182, 1, 1, 1, 1, 1,
0.3845415, 0.6734378, 1.833592, 1, 1, 1, 1, 1,
0.3855291, -0.9881192, 2.708283, 1, 1, 1, 1, 1,
0.3891031, -1.659839, 4.1794, 1, 1, 1, 1, 1,
0.3918137, 1.006419, 0.6930775, 1, 1, 1, 1, 1,
0.3946465, 1.094672, -1.414627, 1, 1, 1, 1, 1,
0.3956183, 0.3705472, 0.3154858, 1, 1, 1, 1, 1,
0.3971023, 0.7833747, -1.377946, 1, 1, 1, 1, 1,
0.3977436, 0.3193501, 1.078833, 1, 1, 1, 1, 1,
0.400573, 0.1668249, 1.155657, 0, 0, 1, 1, 1,
0.4020966, -1.044506, 2.864419, 1, 0, 0, 1, 1,
0.4023398, -0.08470442, 0.4391306, 1, 0, 0, 1, 1,
0.4050861, 0.9515601, -0.03300596, 1, 0, 0, 1, 1,
0.4055664, 1.393371, 0.7425911, 1, 0, 0, 1, 1,
0.4085994, -0.7867966, 4.251845, 1, 0, 0, 1, 1,
0.410382, 0.7029375, 1.353498, 0, 0, 0, 1, 1,
0.4116097, -0.04222009, 1.035702, 0, 0, 0, 1, 1,
0.4156832, -0.007286572, 2.978734, 0, 0, 0, 1, 1,
0.4161035, 1.743928, 1.274723, 0, 0, 0, 1, 1,
0.4180567, -0.5706372, 4.515568, 0, 0, 0, 1, 1,
0.4196208, -0.08568166, 0.7408147, 0, 0, 0, 1, 1,
0.4197953, -0.5763686, 2.372448, 0, 0, 0, 1, 1,
0.4199994, -0.0311289, 1.353107, 1, 1, 1, 1, 1,
0.4255936, -0.3597713, 4.132254, 1, 1, 1, 1, 1,
0.4259149, 0.1101089, 1.503596, 1, 1, 1, 1, 1,
0.4270998, -1.514857, 2.11469, 1, 1, 1, 1, 1,
0.4292317, -1.119092, 1.914671, 1, 1, 1, 1, 1,
0.4409539, 0.6448673, 0.1384152, 1, 1, 1, 1, 1,
0.4410793, -1.065476, 1.036806, 1, 1, 1, 1, 1,
0.4416027, -2.14384, 4.362002, 1, 1, 1, 1, 1,
0.4445147, 1.709337, -0.04169293, 1, 1, 1, 1, 1,
0.4447493, -0.04860698, 3.229808, 1, 1, 1, 1, 1,
0.4481794, -1.569536, 1.912402, 1, 1, 1, 1, 1,
0.4654777, -0.9899861, 1.167298, 1, 1, 1, 1, 1,
0.4675945, -1.108685, 3.689894, 1, 1, 1, 1, 1,
0.4686876, -2.103917, 2.487154, 1, 1, 1, 1, 1,
0.4688656, 1.834819, 0.4646644, 1, 1, 1, 1, 1,
0.4693994, 1.25629, 0.9263642, 0, 0, 1, 1, 1,
0.4708507, -0.9077761, 3.351741, 1, 0, 0, 1, 1,
0.486448, -0.01319958, 2.456576, 1, 0, 0, 1, 1,
0.4895301, -0.8433185, 3.295527, 1, 0, 0, 1, 1,
0.4941418, 1.9633, 0.636474, 1, 0, 0, 1, 1,
0.496263, 0.2090714, 1.213891, 1, 0, 0, 1, 1,
0.4974066, 0.1557171, 3.496884, 0, 0, 0, 1, 1,
0.4980524, -1.673719, 1.32978, 0, 0, 0, 1, 1,
0.5040153, 0.2884084, 1.473179, 0, 0, 0, 1, 1,
0.5059173, 0.8430188, -0.4326537, 0, 0, 0, 1, 1,
0.50898, 0.7978396, -1.842749, 0, 0, 0, 1, 1,
0.5111583, 0.991626, 1.018247, 0, 0, 0, 1, 1,
0.517255, 0.2054507, 1.232662, 0, 0, 0, 1, 1,
0.5212483, 0.1597409, 2.113571, 1, 1, 1, 1, 1,
0.5259687, -0.9538459, 3.199795, 1, 1, 1, 1, 1,
0.5265703, -1.274559, 3.879652, 1, 1, 1, 1, 1,
0.5292892, -0.4033996, 3.628494, 1, 1, 1, 1, 1,
0.5345116, -0.4231134, 4.425534, 1, 1, 1, 1, 1,
0.5351083, 1.404972, 0.6556661, 1, 1, 1, 1, 1,
0.537091, 0.08715585, 2.0455, 1, 1, 1, 1, 1,
0.5397805, 0.4190129, 1.041681, 1, 1, 1, 1, 1,
0.5425216, -0.01181536, 0.369436, 1, 1, 1, 1, 1,
0.5433212, -1.962039, 2.033504, 1, 1, 1, 1, 1,
0.5437259, 0.9443026, 2.368192, 1, 1, 1, 1, 1,
0.5473958, 2.191493, 0.3568325, 1, 1, 1, 1, 1,
0.5484078, -1.090143, 2.013612, 1, 1, 1, 1, 1,
0.5509496, 0.1799436, 0.1661362, 1, 1, 1, 1, 1,
0.5523327, -0.1517159, 1.026772, 1, 1, 1, 1, 1,
0.5533201, 0.9231981, -0.6835626, 0, 0, 1, 1, 1,
0.5539105, -0.07425778, 1.889614, 1, 0, 0, 1, 1,
0.5548753, 1.053597, -0.3566196, 1, 0, 0, 1, 1,
0.5559363, 1.839206, 0.6275168, 1, 0, 0, 1, 1,
0.5577496, 0.3885331, 2.06217, 1, 0, 0, 1, 1,
0.5601661, -1.434384, 2.580958, 1, 0, 0, 1, 1,
0.5612888, 0.5834681, 1.126379, 0, 0, 0, 1, 1,
0.562166, -0.4099433, 2.975388, 0, 0, 0, 1, 1,
0.5652605, 0.6193931, 2.644917, 0, 0, 0, 1, 1,
0.5712632, 0.7871118, 0.2126826, 0, 0, 0, 1, 1,
0.5762157, 0.588603, 0.2622711, 0, 0, 0, 1, 1,
0.5770018, -0.7985063, 3.106565, 0, 0, 0, 1, 1,
0.577476, 0.3005363, 1.678829, 0, 0, 0, 1, 1,
0.5852987, 0.8472521, 2.650031, 1, 1, 1, 1, 1,
0.5879056, 0.1062681, 2.204173, 1, 1, 1, 1, 1,
0.5885397, 1.080343, 0.4720079, 1, 1, 1, 1, 1,
0.5900504, 0.08385137, -0.1608105, 1, 1, 1, 1, 1,
0.5925806, -0.1407896, 1.80821, 1, 1, 1, 1, 1,
0.5979177, -0.07190646, 1.607881, 1, 1, 1, 1, 1,
0.6035289, 0.1450154, 1.78355, 1, 1, 1, 1, 1,
0.621267, 0.6647921, 0.5108262, 1, 1, 1, 1, 1,
0.633881, 1.282697, -0.04701729, 1, 1, 1, 1, 1,
0.6354061, -0.2759587, 2.88468, 1, 1, 1, 1, 1,
0.636615, 0.04660736, -0.2158827, 1, 1, 1, 1, 1,
0.6389188, 0.6854526, 2.512315, 1, 1, 1, 1, 1,
0.640948, -0.1751858, 2.002597, 1, 1, 1, 1, 1,
0.6417987, 1.133598, -0.0239658, 1, 1, 1, 1, 1,
0.642145, 0.7921392, -0.4739313, 1, 1, 1, 1, 1,
0.6460449, 0.8312225, -0.1437684, 0, 0, 1, 1, 1,
0.6463094, -0.05243922, 1.105372, 1, 0, 0, 1, 1,
0.6525074, -1.292071, 1.230834, 1, 0, 0, 1, 1,
0.6535752, -0.8958158, 3.730139, 1, 0, 0, 1, 1,
0.6615796, 0.3239804, 1.762663, 1, 0, 0, 1, 1,
0.6643623, 0.7830797, 0.8494869, 1, 0, 0, 1, 1,
0.6653042, -0.4587311, -0.4366865, 0, 0, 0, 1, 1,
0.6663388, -1.032859, 3.134062, 0, 0, 0, 1, 1,
0.6668838, -0.2607728, 2.648867, 0, 0, 0, 1, 1,
0.6674175, -0.1338815, 1.976868, 0, 0, 0, 1, 1,
0.6709739, 0.02426784, -0.02628437, 0, 0, 0, 1, 1,
0.6716108, -1.13215, 2.672926, 0, 0, 0, 1, 1,
0.6718393, -0.102957, 1.710755, 0, 0, 0, 1, 1,
0.6740287, 0.2918535, 0.2461929, 1, 1, 1, 1, 1,
0.6766855, -0.1034524, 1.005361, 1, 1, 1, 1, 1,
0.7010324, -1.952117, 5.607322, 1, 1, 1, 1, 1,
0.7103441, -0.920772, 0.9111766, 1, 1, 1, 1, 1,
0.7195083, -1.91906, 1.445398, 1, 1, 1, 1, 1,
0.7208847, 1.438956, 0.9199843, 1, 1, 1, 1, 1,
0.72694, 0.8791532, -0.05727707, 1, 1, 1, 1, 1,
0.7291908, -0.7091607, 3.607945, 1, 1, 1, 1, 1,
0.7298843, -0.2865207, 2.950445, 1, 1, 1, 1, 1,
0.734701, 0.00214347, 1.165719, 1, 1, 1, 1, 1,
0.7386686, -0.940789, 3.08297, 1, 1, 1, 1, 1,
0.7410001, 1.445391, 1.48573, 1, 1, 1, 1, 1,
0.7436517, 0.4957346, 0.1489623, 1, 1, 1, 1, 1,
0.747314, -0.2281668, 2.999408, 1, 1, 1, 1, 1,
0.7560084, 1.380845, -0.1938879, 1, 1, 1, 1, 1,
0.7583547, -0.1716384, 2.161531, 0, 0, 1, 1, 1,
0.7584491, -0.1455349, 2.130513, 1, 0, 0, 1, 1,
0.7593478, 2.232204, 0.3142115, 1, 0, 0, 1, 1,
0.7598591, 1.868297, -0.1404366, 1, 0, 0, 1, 1,
0.7603347, 1.370376, -0.6632552, 1, 0, 0, 1, 1,
0.7714056, 0.343708, -0.2228366, 1, 0, 0, 1, 1,
0.7798601, 0.08343656, 1.863526, 0, 0, 0, 1, 1,
0.7817578, -1.442986, 3.778184, 0, 0, 0, 1, 1,
0.7833258, -0.3624266, 0.01158753, 0, 0, 0, 1, 1,
0.7906128, -0.2092506, 2.20259, 0, 0, 0, 1, 1,
0.7956955, 1.373971, -0.1334182, 0, 0, 0, 1, 1,
0.7981271, 0.3234698, 2.169123, 0, 0, 0, 1, 1,
0.8078514, 0.2164267, 0.427468, 0, 0, 0, 1, 1,
0.808052, 1.105744, 0.7731466, 1, 1, 1, 1, 1,
0.8083508, -1.364873, 2.999744, 1, 1, 1, 1, 1,
0.8089764, -0.2045182, 2.28643, 1, 1, 1, 1, 1,
0.8097881, -1.176185, 3.205682, 1, 1, 1, 1, 1,
0.8100845, 0.5568394, 1.511557, 1, 1, 1, 1, 1,
0.8106181, 0.3518634, -0.731723, 1, 1, 1, 1, 1,
0.8121527, 1.013965, 0.7454109, 1, 1, 1, 1, 1,
0.8139635, -0.5785493, 2.511081, 1, 1, 1, 1, 1,
0.8209455, -0.4820377, 1.514881, 1, 1, 1, 1, 1,
0.824616, -0.8508005, 4.502735, 1, 1, 1, 1, 1,
0.8264514, -0.7360502, 1.438847, 1, 1, 1, 1, 1,
0.8269674, 1.761429, 0.5290627, 1, 1, 1, 1, 1,
0.8270027, -0.3633315, 1.473944, 1, 1, 1, 1, 1,
0.8276805, 0.2439338, 0.9910681, 1, 1, 1, 1, 1,
0.831089, 1.6838, -0.5122701, 1, 1, 1, 1, 1,
0.8364369, -0.5426126, 2.947169, 0, 0, 1, 1, 1,
0.8390443, -0.8577204, 1.007819, 1, 0, 0, 1, 1,
0.8393818, -0.9641895, 3.585114, 1, 0, 0, 1, 1,
0.8418573, 0.6423684, 1.43589, 1, 0, 0, 1, 1,
0.8425269, -1.527686, 0.6835709, 1, 0, 0, 1, 1,
0.8453882, 0.8566648, 0.4790071, 1, 0, 0, 1, 1,
0.847822, 0.7511475, 1.781616, 0, 0, 0, 1, 1,
0.8490067, -1.219286, 2.019138, 0, 0, 0, 1, 1,
0.8535746, 0.3997699, 0.3003033, 0, 0, 0, 1, 1,
0.854232, 0.3710677, 2.249741, 0, 0, 0, 1, 1,
0.8564864, 0.5017527, 0.2316616, 0, 0, 0, 1, 1,
0.8592802, -0.1532847, 1.506256, 0, 0, 0, 1, 1,
0.8593425, -0.9832039, -0.01685171, 0, 0, 0, 1, 1,
0.8617087, 0.2780223, 0.8734154, 1, 1, 1, 1, 1,
0.8623382, 0.4595341, 1.370717, 1, 1, 1, 1, 1,
0.8640665, -1.702822, 0.4613044, 1, 1, 1, 1, 1,
0.8655009, 0.0786254, 0.65364, 1, 1, 1, 1, 1,
0.8681103, -1.08074, 1.455455, 1, 1, 1, 1, 1,
0.8684566, 0.4240163, 0.6047881, 1, 1, 1, 1, 1,
0.8813694, -2.24159, 1.931255, 1, 1, 1, 1, 1,
0.8927633, -1.558421, 2.848108, 1, 1, 1, 1, 1,
0.9034783, -0.3409254, 1.500645, 1, 1, 1, 1, 1,
0.9105963, 0.8666221, 1.93101, 1, 1, 1, 1, 1,
0.9116691, -0.7623245, 1.715116, 1, 1, 1, 1, 1,
0.9201586, -0.5593773, 2.983161, 1, 1, 1, 1, 1,
0.9266415, 0.4272818, -0.1152364, 1, 1, 1, 1, 1,
0.9267628, 0.05344732, 1.119321, 1, 1, 1, 1, 1,
0.9395711, -0.4887654, 2.305378, 1, 1, 1, 1, 1,
0.9397926, 0.5336058, 1.313222, 0, 0, 1, 1, 1,
0.940514, -0.05188575, 1.339172, 1, 0, 0, 1, 1,
0.9451376, 0.3208103, 0.9536378, 1, 0, 0, 1, 1,
0.9453769, 0.7335368, 0.7318056, 1, 0, 0, 1, 1,
0.948786, 0.9650494, 0.9103244, 1, 0, 0, 1, 1,
0.9558153, -0.9980496, 2.967317, 1, 0, 0, 1, 1,
0.9563983, 0.3636695, 1.606777, 0, 0, 0, 1, 1,
0.9616472, -0.3483683, 2.359076, 0, 0, 0, 1, 1,
0.9678916, 2.323189, 1.543344, 0, 0, 0, 1, 1,
0.9793424, -1.001591, 2.777198, 0, 0, 0, 1, 1,
0.9795495, 0.9737412, -0.3646009, 0, 0, 0, 1, 1,
0.9900849, 0.03338842, 0.07819436, 0, 0, 0, 1, 1,
0.9920698, -1.501327, 3.112017, 0, 0, 0, 1, 1,
1.002092, -0.119238, 1.58358, 1, 1, 1, 1, 1,
1.002321, 1.400065, 3.080292, 1, 1, 1, 1, 1,
1.005266, -0.2328772, 2.775073, 1, 1, 1, 1, 1,
1.007554, -2.028732, 2.211369, 1, 1, 1, 1, 1,
1.011331, -1.131894, 0.8755292, 1, 1, 1, 1, 1,
1.014865, -1.956393, 0.7651728, 1, 1, 1, 1, 1,
1.01926, 0.04415514, 0.4597566, 1, 1, 1, 1, 1,
1.020437, 0.296467, 1.941421, 1, 1, 1, 1, 1,
1.023469, 0.6228808, 0.4341993, 1, 1, 1, 1, 1,
1.024444, 0.6943198, 2.928759, 1, 1, 1, 1, 1,
1.026884, -1.002832, 2.1491, 1, 1, 1, 1, 1,
1.029718, 1.072679, 1.110791, 1, 1, 1, 1, 1,
1.033207, 2.832082, -0.7982162, 1, 1, 1, 1, 1,
1.037145, -0.7700465, 1.668077, 1, 1, 1, 1, 1,
1.041864, -0.1098337, 0.1439096, 1, 1, 1, 1, 1,
1.042768, 0.207432, 1.673001, 0, 0, 1, 1, 1,
1.044671, 0.9167042, 1.020613, 1, 0, 0, 1, 1,
1.049822, -1.046769, 1.652071, 1, 0, 0, 1, 1,
1.054186, -1.320793, 1.105153, 1, 0, 0, 1, 1,
1.056889, 1.840506, 0.1125333, 1, 0, 0, 1, 1,
1.062613, -0.9977068, 1.966741, 1, 0, 0, 1, 1,
1.064411, -1.068657, 3.498968, 0, 0, 0, 1, 1,
1.065291, -0.960189, 1.186962, 0, 0, 0, 1, 1,
1.074999, 0.588885, 1.52105, 0, 0, 0, 1, 1,
1.084283, -0.8481835, 1.788009, 0, 0, 0, 1, 1,
1.084848, 1.28009, 2.305567, 0, 0, 0, 1, 1,
1.086272, -1.540729, 2.988501, 0, 0, 0, 1, 1,
1.10153, 1.265086, -0.5016205, 0, 0, 0, 1, 1,
1.118903, 0.2661873, 2.335477, 1, 1, 1, 1, 1,
1.12237, 1.13252, 0.0400861, 1, 1, 1, 1, 1,
1.133994, -0.1115709, 1.60616, 1, 1, 1, 1, 1,
1.136641, -1.032556, 1.551175, 1, 1, 1, 1, 1,
1.140695, 0.04290932, 0.5393782, 1, 1, 1, 1, 1,
1.142465, -1.916049, 3.918305, 1, 1, 1, 1, 1,
1.143767, 1.398754, -0.1474753, 1, 1, 1, 1, 1,
1.152923, 0.7464765, 0.3097153, 1, 1, 1, 1, 1,
1.158984, -0.1317403, 0.09623011, 1, 1, 1, 1, 1,
1.165005, 1.287291, 1.559414, 1, 1, 1, 1, 1,
1.165835, 0.5337186, 0.8698338, 1, 1, 1, 1, 1,
1.171329, -1.156244, 2.025025, 1, 1, 1, 1, 1,
1.172634, 0.8191708, -0.1039272, 1, 1, 1, 1, 1,
1.178108, 1.19275, 1.356647, 1, 1, 1, 1, 1,
1.181414, -0.0713474, 0.7795025, 1, 1, 1, 1, 1,
1.184219, -1.329541, 2.865396, 0, 0, 1, 1, 1,
1.189847, -0.3389914, 2.763256, 1, 0, 0, 1, 1,
1.192456, 0.7972994, -0.3373626, 1, 0, 0, 1, 1,
1.195813, -1.970215, 1.516002, 1, 0, 0, 1, 1,
1.196925, -0.983225, 2.542218, 1, 0, 0, 1, 1,
1.197071, 0.6293556, 3.262633, 1, 0, 0, 1, 1,
1.197379, -0.3559893, 3.337069, 0, 0, 0, 1, 1,
1.203086, 0.8342408, 0.6103982, 0, 0, 0, 1, 1,
1.203433, -0.5885829, 1.910539, 0, 0, 0, 1, 1,
1.209262, 0.8619624, -0.01110231, 0, 0, 0, 1, 1,
1.213526, -0.2705581, 0.9033571, 0, 0, 0, 1, 1,
1.215132, 1.137599, 0.1079554, 0, 0, 0, 1, 1,
1.2196, 1.593177, 1.592015, 0, 0, 0, 1, 1,
1.219787, 1.661619, -1.009587, 1, 1, 1, 1, 1,
1.22165, 0.6858619, 1.56827, 1, 1, 1, 1, 1,
1.225159, -0.04048982, 1.966017, 1, 1, 1, 1, 1,
1.226029, -1.111644, 2.682359, 1, 1, 1, 1, 1,
1.232931, -0.8573145, 2.187943, 1, 1, 1, 1, 1,
1.233026, -0.4780616, 2.245227, 1, 1, 1, 1, 1,
1.234991, 0.006470041, 2.287298, 1, 1, 1, 1, 1,
1.238794, -0.7202447, 1.920098, 1, 1, 1, 1, 1,
1.24183, -0.9551347, 3.990239, 1, 1, 1, 1, 1,
1.244374, -1.488771, 1.794463, 1, 1, 1, 1, 1,
1.244405, 1.301969, 0.7660696, 1, 1, 1, 1, 1,
1.247638, 0.1142066, 2.455794, 1, 1, 1, 1, 1,
1.250769, 0.7093163, -0.7303417, 1, 1, 1, 1, 1,
1.25808, 1.546538, 0.9127588, 1, 1, 1, 1, 1,
1.260105, 0.1059697, 0.9305269, 1, 1, 1, 1, 1,
1.260893, -0.03650637, 2.749392, 0, 0, 1, 1, 1,
1.270343, 1.91299, 1.927642, 1, 0, 0, 1, 1,
1.271647, 0.7771083, 3.276753, 1, 0, 0, 1, 1,
1.271987, 0.0006401996, 1.672443, 1, 0, 0, 1, 1,
1.284984, -0.8336022, 0.9297113, 1, 0, 0, 1, 1,
1.300388, 0.7743172, 1.837475, 1, 0, 0, 1, 1,
1.302112, 0.6923382, 1.831794, 0, 0, 0, 1, 1,
1.302559, -0.9181383, 0.9238434, 0, 0, 0, 1, 1,
1.309068, -0.2284801, 2.527987, 0, 0, 0, 1, 1,
1.311136, 0.3061355, 0.919768, 0, 0, 0, 1, 1,
1.311622, 1.31307, 0.8843622, 0, 0, 0, 1, 1,
1.312996, 0.2675465, 1.182764, 0, 0, 0, 1, 1,
1.318592, -0.8561737, 2.880143, 0, 0, 0, 1, 1,
1.335295, 0.07897154, 2.061847, 1, 1, 1, 1, 1,
1.348162, 0.5252971, -0.01862519, 1, 1, 1, 1, 1,
1.350066, 1.107451, -0.6372897, 1, 1, 1, 1, 1,
1.352853, -0.2766733, -0.09147691, 1, 1, 1, 1, 1,
1.355606, 0.7633604, 2.991122, 1, 1, 1, 1, 1,
1.362626, 0.4561242, 1.07883, 1, 1, 1, 1, 1,
1.374584, -1.824864, -0.2136489, 1, 1, 1, 1, 1,
1.376279, 0.08609468, 2.151749, 1, 1, 1, 1, 1,
1.37927, 0.6499618, 1.071603, 1, 1, 1, 1, 1,
1.381247, 0.342525, 2.544296, 1, 1, 1, 1, 1,
1.383932, -0.0934497, -0.09736899, 1, 1, 1, 1, 1,
1.418991, -0.7179707, 1.931068, 1, 1, 1, 1, 1,
1.422854, 0.1906682, 1.54091, 1, 1, 1, 1, 1,
1.430636, -2.353634, 1.882391, 1, 1, 1, 1, 1,
1.434838, -0.1699704, -0.6595497, 1, 1, 1, 1, 1,
1.438333, -1.193441, 3.554869, 0, 0, 1, 1, 1,
1.443216, -3.544299, 0.2995359, 1, 0, 0, 1, 1,
1.446948, 1.17753, 1.11038, 1, 0, 0, 1, 1,
1.449934, 0.4446391, 1.869252, 1, 0, 0, 1, 1,
1.467518, -1.061136, 2.389504, 1, 0, 0, 1, 1,
1.469588, 0.8475068, 0.3605114, 1, 0, 0, 1, 1,
1.473393, 1.029728, 1.499012, 0, 0, 0, 1, 1,
1.475415, -1.595855, 1.971787, 0, 0, 0, 1, 1,
1.475889, -0.176966, -0.6648318, 0, 0, 0, 1, 1,
1.476221, 0.7161885, 2.236026, 0, 0, 0, 1, 1,
1.480713, -0.6724021, 2.289111, 0, 0, 0, 1, 1,
1.481594, 0.1814384, 1.388655, 0, 0, 0, 1, 1,
1.490585, 0.6958506, 2.090985, 0, 0, 0, 1, 1,
1.490637, -0.1573329, 0.1476104, 1, 1, 1, 1, 1,
1.49294, -1.503436, 3.252162, 1, 1, 1, 1, 1,
1.514674, 1.089964, 0.392633, 1, 1, 1, 1, 1,
1.518797, 0.3249678, 0.6484531, 1, 1, 1, 1, 1,
1.521087, -0.1465153, -0.08572256, 1, 1, 1, 1, 1,
1.537405, -1.206308, 1.247886, 1, 1, 1, 1, 1,
1.540272, -0.6931373, 3.532187, 1, 1, 1, 1, 1,
1.541304, -0.1579373, 3.132582, 1, 1, 1, 1, 1,
1.549621, -0.633009, 2.234848, 1, 1, 1, 1, 1,
1.552746, -0.5446073, 1.140012, 1, 1, 1, 1, 1,
1.55608, -2.411752, 3.003431, 1, 1, 1, 1, 1,
1.56586, 0.6820449, 0.1517242, 1, 1, 1, 1, 1,
1.567628, 1.229983, 1.990069, 1, 1, 1, 1, 1,
1.583994, -0.8273171, 1.358028, 1, 1, 1, 1, 1,
1.608373, -2.051929, 1.864097, 1, 1, 1, 1, 1,
1.636829, -0.302281, 2.552667, 0, 0, 1, 1, 1,
1.650455, 0.4498756, 1.240125, 1, 0, 0, 1, 1,
1.657232, -1.307235, 3.373495, 1, 0, 0, 1, 1,
1.660346, -1.399758, 4.607268, 1, 0, 0, 1, 1,
1.666294, 1.099048, 0.6297653, 1, 0, 0, 1, 1,
1.673043, 0.9901688, 1.037435, 1, 0, 0, 1, 1,
1.684233, 0.5123237, 1.541785, 0, 0, 0, 1, 1,
1.70732, 0.5723805, 0.9127407, 0, 0, 0, 1, 1,
1.709889, -1.361682, 2.688275, 0, 0, 0, 1, 1,
1.712562, -1.886807, 1.803546, 0, 0, 0, 1, 1,
1.729131, 2.063751, 0.2610118, 0, 0, 0, 1, 1,
1.734241, 0.7241864, -0.4607856, 0, 0, 0, 1, 1,
1.746204, -0.1021335, 1.700721, 0, 0, 0, 1, 1,
1.754493, 0.5613664, 0.5496415, 1, 1, 1, 1, 1,
1.770901, -2.120709, 1.447046, 1, 1, 1, 1, 1,
1.78057, 0.8581108, 2.627962, 1, 1, 1, 1, 1,
1.791935, -0.7533174, 1.947268, 1, 1, 1, 1, 1,
1.802312, -0.2090559, 1.458605, 1, 1, 1, 1, 1,
1.814744, -1.78931, 1.650572, 1, 1, 1, 1, 1,
1.826688, 0.8568658, 2.457013, 1, 1, 1, 1, 1,
1.875134, 0.898856, -0.5013392, 1, 1, 1, 1, 1,
1.913525, -0.3103378, 0.1068517, 1, 1, 1, 1, 1,
1.914052, 0.489891, 0.7004547, 1, 1, 1, 1, 1,
1.931158, -0.1114786, 1.247086, 1, 1, 1, 1, 1,
1.988427, 0.03258039, 1.285849, 1, 1, 1, 1, 1,
2.019273, 1.407401, 0.4332258, 1, 1, 1, 1, 1,
2.053446, 1.12302, 2.102367, 1, 1, 1, 1, 1,
2.057215, -0.3939556, 2.160588, 1, 1, 1, 1, 1,
2.060861, -0.6888331, 2.762482, 0, 0, 1, 1, 1,
2.08702, 1.322935, 0.6927207, 1, 0, 0, 1, 1,
2.095098, -2.098687, 3.02539, 1, 0, 0, 1, 1,
2.101452, -0.1365356, 0.5194593, 1, 0, 0, 1, 1,
2.10378, 0.4339733, 0.6228872, 1, 0, 0, 1, 1,
2.10986, -1.241954, 0.895074, 1, 0, 0, 1, 1,
2.141076, 0.0809662, 1.862558, 0, 0, 0, 1, 1,
2.19914, 0.7938979, 0.2398114, 0, 0, 0, 1, 1,
2.299597, -0.7619299, 1.288747, 0, 0, 0, 1, 1,
2.315202, -1.783624, 3.216314, 0, 0, 0, 1, 1,
2.344276, 0.908877, 0.524711, 0, 0, 0, 1, 1,
2.365134, -0.8651557, 1.717873, 0, 0, 0, 1, 1,
2.425586, 1.909361, 0.3565176, 0, 0, 0, 1, 1,
2.513799, -0.04180049, 0.9586186, 1, 1, 1, 1, 1,
2.560857, -0.368202, 2.601575, 1, 1, 1, 1, 1,
2.625752, 1.778417, 1.249684, 1, 1, 1, 1, 1,
2.635451, -0.1066187, 1.411008, 1, 1, 1, 1, 1,
2.795124, -0.6601365, 2.38473, 1, 1, 1, 1, 1,
2.948735, 1.703264, 0.3589652, 1, 1, 1, 1, 1,
3.16564, -0.7729096, 0.3732682, 1, 1, 1, 1, 1
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
var radius = 9.855878;
var distance = 34.61835;
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
mvMatrix.translate( -0.002982616, 0.3150687, -0.07374597 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.61835);
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
