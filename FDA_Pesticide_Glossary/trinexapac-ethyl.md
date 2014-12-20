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
-3.229915, -1.06959, -1.25914, 1, 0, 0, 1,
-2.734316, 1.196275, -1.823435, 1, 0.007843138, 0, 1,
-2.683632, -0.6480402, -0.77079, 1, 0.01176471, 0, 1,
-2.642982, -0.502093, -0.6386302, 1, 0.01960784, 0, 1,
-2.533783, -1.882754, -2.340191, 1, 0.02352941, 0, 1,
-2.491175, -0.3179487, -2.500638, 1, 0.03137255, 0, 1,
-2.487298, 0.9749041, -1.180461, 1, 0.03529412, 0, 1,
-2.477927, 0.8352553, -1.171312, 1, 0.04313726, 0, 1,
-2.414495, 0.1846251, -1.9653, 1, 0.04705882, 0, 1,
-2.386185, -0.2890849, -2.332462, 1, 0.05490196, 0, 1,
-2.375289, -0.3886496, 0.8407221, 1, 0.05882353, 0, 1,
-2.36589, 2.408377, -0.3832582, 1, 0.06666667, 0, 1,
-2.329576, 0.826305, -2.688109, 1, 0.07058824, 0, 1,
-2.329145, -0.1242869, -1.152518, 1, 0.07843138, 0, 1,
-2.321669, -1.7155, -2.874864, 1, 0.08235294, 0, 1,
-2.272389, 0.4518125, -1.293869, 1, 0.09019608, 0, 1,
-2.251576, -0.8697739, -1.386344, 1, 0.09411765, 0, 1,
-2.237994, 0.7879274, -1.686873, 1, 0.1019608, 0, 1,
-2.183618, -1.345162, -1.494542, 1, 0.1098039, 0, 1,
-2.171301, 1.414096, -1.394967, 1, 0.1137255, 0, 1,
-2.152842, -0.3922787, -2.016963, 1, 0.1215686, 0, 1,
-2.132397, -0.2194296, -0.8591028, 1, 0.1254902, 0, 1,
-2.109058, 0.8204778, -1.059614, 1, 0.1333333, 0, 1,
-2.083633, 1.336468, -2.088925, 1, 0.1372549, 0, 1,
-2.071633, -0.9788498, -1.92877, 1, 0.145098, 0, 1,
-2.026023, 0.2436111, -2.453324, 1, 0.1490196, 0, 1,
-2.023021, 1.583545, -2.082196, 1, 0.1568628, 0, 1,
-1.995136, -0.6287059, -3.090472, 1, 0.1607843, 0, 1,
-1.926513, 0.9347361, -1.831074, 1, 0.1686275, 0, 1,
-1.920794, -2.190541, -1.669415, 1, 0.172549, 0, 1,
-1.911886, 0.006392571, -2.582705, 1, 0.1803922, 0, 1,
-1.910632, 0.7321509, -0.5926635, 1, 0.1843137, 0, 1,
-1.908223, -1.115819, -3.695588, 1, 0.1921569, 0, 1,
-1.901404, 0.8645452, -1.809582, 1, 0.1960784, 0, 1,
-1.878029, -0.4741509, -1.34898, 1, 0.2039216, 0, 1,
-1.875831, -0.8399021, -2.003733, 1, 0.2117647, 0, 1,
-1.872483, 0.4557239, -1.272987, 1, 0.2156863, 0, 1,
-1.855827, -0.6636272, -2.18896, 1, 0.2235294, 0, 1,
-1.795222, 0.2637659, -1.026451, 1, 0.227451, 0, 1,
-1.767274, 0.05207025, -0.2498156, 1, 0.2352941, 0, 1,
-1.759541, -0.5569011, -3.690328, 1, 0.2392157, 0, 1,
-1.745133, -1.048722, -1.510704, 1, 0.2470588, 0, 1,
-1.744694, -0.3614129, -1.067798, 1, 0.2509804, 0, 1,
-1.712551, 0.2190161, -2.663685, 1, 0.2588235, 0, 1,
-1.702506, 0.0006414391, -2.029907, 1, 0.2627451, 0, 1,
-1.688773, -1.130097, -0.8859071, 1, 0.2705882, 0, 1,
-1.678512, -0.6711541, -1.188066, 1, 0.2745098, 0, 1,
-1.675394, 0.3182976, -1.257427, 1, 0.282353, 0, 1,
-1.633494, 0.9099149, -0.3278238, 1, 0.2862745, 0, 1,
-1.633384, -1.177737, -1.459006, 1, 0.2941177, 0, 1,
-1.618761, 0.7769939, -1.52237, 1, 0.3019608, 0, 1,
-1.616711, 1.749668, -0.9876547, 1, 0.3058824, 0, 1,
-1.607442, -0.266315, -1.305294, 1, 0.3137255, 0, 1,
-1.578838, -1.260088, -1.492908, 1, 0.3176471, 0, 1,
-1.575566, 0.3270997, -3.496872, 1, 0.3254902, 0, 1,
-1.549066, -0.3398219, -3.701241, 1, 0.3294118, 0, 1,
-1.525868, 1.280191, -1.238213, 1, 0.3372549, 0, 1,
-1.525676, 1.715524, 0.4195859, 1, 0.3411765, 0, 1,
-1.516054, 0.1192172, -1.389531, 1, 0.3490196, 0, 1,
-1.509138, 0.9620405, -2.435254, 1, 0.3529412, 0, 1,
-1.489537, -1.166415, -1.822137, 1, 0.3607843, 0, 1,
-1.480583, -1.602737, -0.9958931, 1, 0.3647059, 0, 1,
-1.48044, -0.5310339, -2.858001, 1, 0.372549, 0, 1,
-1.477105, -2.161562, -2.553368, 1, 0.3764706, 0, 1,
-1.474033, 0.2122008, -2.120717, 1, 0.3843137, 0, 1,
-1.470735, -0.05335279, -1.17746, 1, 0.3882353, 0, 1,
-1.467801, -0.2358329, -2.805448, 1, 0.3960784, 0, 1,
-1.464882, -0.2698751, -0.8651837, 1, 0.4039216, 0, 1,
-1.450699, -2.81588, -2.485286, 1, 0.4078431, 0, 1,
-1.442795, 1.826104, -2.412918, 1, 0.4156863, 0, 1,
-1.440558, 1.102999, -1.815594, 1, 0.4196078, 0, 1,
-1.436576, 0.2889798, -2.507813, 1, 0.427451, 0, 1,
-1.434251, 0.4407832, -1.148104, 1, 0.4313726, 0, 1,
-1.431162, -0.4514579, -2.957661, 1, 0.4392157, 0, 1,
-1.430517, -0.6727262, -1.816745, 1, 0.4431373, 0, 1,
-1.423852, -1.240339, -1.18774, 1, 0.4509804, 0, 1,
-1.414124, -0.6638771, -4.532207, 1, 0.454902, 0, 1,
-1.406087, 1.119304, -0.4010567, 1, 0.4627451, 0, 1,
-1.385322, -2.514848, -2.364998, 1, 0.4666667, 0, 1,
-1.383998, -0.58733, -1.649022, 1, 0.4745098, 0, 1,
-1.380963, -0.2607579, 0.4512428, 1, 0.4784314, 0, 1,
-1.368967, 1.161589, -3.369884, 1, 0.4862745, 0, 1,
-1.352767, 0.6381824, -1.934221, 1, 0.4901961, 0, 1,
-1.335035, 2.388081, 0.3432824, 1, 0.4980392, 0, 1,
-1.334062, 0.1970662, -2.596292, 1, 0.5058824, 0, 1,
-1.324187, 0.33039, 0.08971418, 1, 0.509804, 0, 1,
-1.308405, -0.4629704, -1.456126, 1, 0.5176471, 0, 1,
-1.302557, -0.530539, -2.038041, 1, 0.5215687, 0, 1,
-1.291109, -0.07741628, -2.462923, 1, 0.5294118, 0, 1,
-1.289392, 0.5264523, -0.3630248, 1, 0.5333334, 0, 1,
-1.28686, 0.4175166, -1.736959, 1, 0.5411765, 0, 1,
-1.27732, -0.3461613, -1.439122, 1, 0.5450981, 0, 1,
-1.273475, -1.630406, -3.963977, 1, 0.5529412, 0, 1,
-1.272261, -0.09234666, -1.434309, 1, 0.5568628, 0, 1,
-1.270649, 0.2540275, -3.268889, 1, 0.5647059, 0, 1,
-1.258747, 2.013016, -0.4255491, 1, 0.5686275, 0, 1,
-1.258393, 0.3654488, -0.1385983, 1, 0.5764706, 0, 1,
-1.252271, -0.2913805, -2.023571, 1, 0.5803922, 0, 1,
-1.251404, -1.221142, -0.9436569, 1, 0.5882353, 0, 1,
-1.248618, -2.066743, -1.48148, 1, 0.5921569, 0, 1,
-1.246797, -1.052366, -2.488982, 1, 0.6, 0, 1,
-1.224209, -0.6359082, -1.373288, 1, 0.6078432, 0, 1,
-1.212294, 0.6898771, -1.759071, 1, 0.6117647, 0, 1,
-1.211879, 0.5036134, -0.6047881, 1, 0.6196079, 0, 1,
-1.21093, 0.3252357, -0.9550133, 1, 0.6235294, 0, 1,
-1.210611, -0.8597428, -2.80962, 1, 0.6313726, 0, 1,
-1.206242, -0.703642, -1.04397, 1, 0.6352941, 0, 1,
-1.202226, -0.1502614, -1.34868, 1, 0.6431373, 0, 1,
-1.200855, 0.4895834, -2.294376, 1, 0.6470588, 0, 1,
-1.193426, 0.2854037, -2.459513, 1, 0.654902, 0, 1,
-1.191467, 0.6543938, -1.936212, 1, 0.6588235, 0, 1,
-1.190807, -0.3872809, -2.770868, 1, 0.6666667, 0, 1,
-1.170741, 0.7930245, -1.393079, 1, 0.6705883, 0, 1,
-1.165287, 0.1357434, -1.648026, 1, 0.6784314, 0, 1,
-1.158617, 0.7229564, 0.569421, 1, 0.682353, 0, 1,
-1.156751, 0.07050495, -2.191591, 1, 0.6901961, 0, 1,
-1.156528, -2.676463, -2.329756, 1, 0.6941177, 0, 1,
-1.153256, 1.375724, -0.7535628, 1, 0.7019608, 0, 1,
-1.140791, -0.199623, -0.3706243, 1, 0.7098039, 0, 1,
-1.139822, 0.7839068, -0.03467141, 1, 0.7137255, 0, 1,
-1.135949, 1.024621, -0.3577439, 1, 0.7215686, 0, 1,
-1.129721, 1.603304, -2.46397, 1, 0.7254902, 0, 1,
-1.122033, 0.3568189, -3.233654, 1, 0.7333333, 0, 1,
-1.117962, 1.352973, -1.992232, 1, 0.7372549, 0, 1,
-1.116964, -0.6560429, -1.839381, 1, 0.7450981, 0, 1,
-1.108121, 0.5557989, 0.3529194, 1, 0.7490196, 0, 1,
-1.105754, 0.668501, -1.177087, 1, 0.7568628, 0, 1,
-1.097935, -0.4549368, -2.618523, 1, 0.7607843, 0, 1,
-1.097701, 0.2900232, -2.354341, 1, 0.7686275, 0, 1,
-1.087835, 0.8830518, -0.4492349, 1, 0.772549, 0, 1,
-1.072224, 1.321763, -1.154476, 1, 0.7803922, 0, 1,
-1.066682, -0.03177725, -0.8712813, 1, 0.7843137, 0, 1,
-1.064562, -0.9269529, -3.077367, 1, 0.7921569, 0, 1,
-1.059425, 0.6075929, -0.8239721, 1, 0.7960784, 0, 1,
-1.050433, 1.215105, 0.2470819, 1, 0.8039216, 0, 1,
-1.035221, -2.18039, -1.100671, 1, 0.8117647, 0, 1,
-1.032187, 1.41298, 0.3097852, 1, 0.8156863, 0, 1,
-1.026305, -0.9911177, -1.677384, 1, 0.8235294, 0, 1,
-1.024143, -0.8734075, -0.6798446, 1, 0.827451, 0, 1,
-1.017454, -0.3057198, -2.492982, 1, 0.8352941, 0, 1,
-1.016329, -0.1666231, -1.117117, 1, 0.8392157, 0, 1,
-1.000662, -0.6674691, -2.483403, 1, 0.8470588, 0, 1,
-0.9990718, 1.034516, -0.1889105, 1, 0.8509804, 0, 1,
-0.9974723, -0.5446234, -0.5901725, 1, 0.8588235, 0, 1,
-0.9957827, 0.5015281, -1.808938, 1, 0.8627451, 0, 1,
-0.9846727, 0.04410954, -2.164064, 1, 0.8705882, 0, 1,
-0.9842782, -0.8047206, -3.77493, 1, 0.8745098, 0, 1,
-0.9796991, -0.7129239, -1.074204, 1, 0.8823529, 0, 1,
-0.9778067, 0.1322138, -2.468051, 1, 0.8862745, 0, 1,
-0.974591, -0.8035371, -2.373875, 1, 0.8941177, 0, 1,
-0.9722295, 1.035535, 0.4646634, 1, 0.8980392, 0, 1,
-0.9659657, -0.6530549, -1.491755, 1, 0.9058824, 0, 1,
-0.9638876, 0.1922207, -2.938347, 1, 0.9137255, 0, 1,
-0.9578804, 0.4127496, -1.249966, 1, 0.9176471, 0, 1,
-0.9560288, -1.13886, -2.651239, 1, 0.9254902, 0, 1,
-0.9512132, -0.7179227, -2.757113, 1, 0.9294118, 0, 1,
-0.9477917, -1.23225, -2.300521, 1, 0.9372549, 0, 1,
-0.9456473, 0.5587341, -0.03499397, 1, 0.9411765, 0, 1,
-0.9419116, 0.1461829, -2.034954, 1, 0.9490196, 0, 1,
-0.9368685, -0.1375813, -0.3383018, 1, 0.9529412, 0, 1,
-0.9260894, 0.1293607, -0.2714469, 1, 0.9607843, 0, 1,
-0.9256515, -0.1611157, -1.403335, 1, 0.9647059, 0, 1,
-0.9169629, 2.037354, -0.8108361, 1, 0.972549, 0, 1,
-0.9165425, -0.8919423, -1.018582, 1, 0.9764706, 0, 1,
-0.8969778, 0.0459682, -2.71594, 1, 0.9843137, 0, 1,
-0.8947478, -0.6536415, -2.769478, 1, 0.9882353, 0, 1,
-0.8942991, -0.6069575, -1.108838, 1, 0.9960784, 0, 1,
-0.8941913, -0.2314336, -0.07588565, 0.9960784, 1, 0, 1,
-0.8809667, 0.04865595, -1.714466, 0.9921569, 1, 0, 1,
-0.8789149, -0.6950027, -2.487731, 0.9843137, 1, 0, 1,
-0.8780311, 0.4275223, -0.561837, 0.9803922, 1, 0, 1,
-0.8777783, -0.3147218, -3.047267, 0.972549, 1, 0, 1,
-0.8761008, 1.526553, -1.939302, 0.9686275, 1, 0, 1,
-0.8632979, -1.387787, -1.914687, 0.9607843, 1, 0, 1,
-0.8602365, -0.5364116, -0.8481315, 0.9568627, 1, 0, 1,
-0.8591775, 0.7375664, -1.532766, 0.9490196, 1, 0, 1,
-0.8575833, -2.055919, -2.192077, 0.945098, 1, 0, 1,
-0.8542362, -2.35479, -2.551316, 0.9372549, 1, 0, 1,
-0.8520865, -0.8834084, -3.816069, 0.9333333, 1, 0, 1,
-0.8474529, -0.08922803, -0.5038758, 0.9254902, 1, 0, 1,
-0.8438441, -0.802262, -2.09348, 0.9215686, 1, 0, 1,
-0.8409288, -0.3329965, -1.69744, 0.9137255, 1, 0, 1,
-0.8385752, 0.1043918, -0.9910397, 0.9098039, 1, 0, 1,
-0.8382404, 0.09288449, -2.664258, 0.9019608, 1, 0, 1,
-0.8333591, -1.718153, -2.794951, 0.8941177, 1, 0, 1,
-0.8305777, 1.334231, 0.4061258, 0.8901961, 1, 0, 1,
-0.8281369, 2.25258, 0.01805469, 0.8823529, 1, 0, 1,
-0.8274672, -0.8588043, -3.427199, 0.8784314, 1, 0, 1,
-0.8273565, -0.2589941, -2.054167, 0.8705882, 1, 0, 1,
-0.82226, 0.07449921, -1.116673, 0.8666667, 1, 0, 1,
-0.8220407, 1.244872, 0.6099399, 0.8588235, 1, 0, 1,
-0.8178844, -0.9396412, -1.237377, 0.854902, 1, 0, 1,
-0.8169382, -1.457898, -2.816597, 0.8470588, 1, 0, 1,
-0.8090178, -0.2917753, -2.007525, 0.8431373, 1, 0, 1,
-0.8014606, 0.05092071, -1.973022, 0.8352941, 1, 0, 1,
-0.7993506, 0.3205439, -1.890934, 0.8313726, 1, 0, 1,
-0.7992646, -0.9134223, -1.007663, 0.8235294, 1, 0, 1,
-0.7930914, -0.6894755, -3.166343, 0.8196079, 1, 0, 1,
-0.7922845, 0.00888856, -1.827836, 0.8117647, 1, 0, 1,
-0.792049, 1.052115, -0.1527667, 0.8078431, 1, 0, 1,
-0.7911948, 0.395262, -2.083872, 0.8, 1, 0, 1,
-0.7901436, 0.04423263, -1.819348, 0.7921569, 1, 0, 1,
-0.7847554, -0.841318, -2.330617, 0.7882353, 1, 0, 1,
-0.7794292, 0.503125, -2.847925, 0.7803922, 1, 0, 1,
-0.7773277, -0.5640101, -2.235431, 0.7764706, 1, 0, 1,
-0.7737384, 0.4021679, -1.485906, 0.7686275, 1, 0, 1,
-0.7688112, 0.7437142, 0.5990543, 0.7647059, 1, 0, 1,
-0.767582, -0.02658189, -0.9200936, 0.7568628, 1, 0, 1,
-0.7643045, -1.210765, -1.935733, 0.7529412, 1, 0, 1,
-0.7625301, -0.6932831, -2.482289, 0.7450981, 1, 0, 1,
-0.7552198, 1.286081, -1.079504, 0.7411765, 1, 0, 1,
-0.7548441, -0.1085582, 0.6487514, 0.7333333, 1, 0, 1,
-0.7477168, -0.5340556, -0.3193852, 0.7294118, 1, 0, 1,
-0.7413838, 0.7696089, -0.4926677, 0.7215686, 1, 0, 1,
-0.7396743, -0.1759945, -2.254842, 0.7176471, 1, 0, 1,
-0.7378079, -0.7498071, -0.5388471, 0.7098039, 1, 0, 1,
-0.7340547, 0.2754725, 0.281313, 0.7058824, 1, 0, 1,
-0.7321179, 0.2957015, -1.345373, 0.6980392, 1, 0, 1,
-0.7289649, 0.8945847, 0.8065501, 0.6901961, 1, 0, 1,
-0.7281026, -0.1858881, -1.646079, 0.6862745, 1, 0, 1,
-0.7259701, -2.334471, -2.861827, 0.6784314, 1, 0, 1,
-0.7223433, 0.2421568, -1.239108, 0.6745098, 1, 0, 1,
-0.7197821, -0.07134736, -0.6701594, 0.6666667, 1, 0, 1,
-0.7190278, 0.748211, -2.018357, 0.6627451, 1, 0, 1,
-0.7184877, -1.116741, -3.355409, 0.654902, 1, 0, 1,
-0.7179883, -0.5624648, -2.079221, 0.6509804, 1, 0, 1,
-0.7179185, -0.02099751, -1.427192, 0.6431373, 1, 0, 1,
-0.7172812, 0.832791, -1.702127, 0.6392157, 1, 0, 1,
-0.7156513, 0.4562235, -1.941053, 0.6313726, 1, 0, 1,
-0.7155876, -0.2190887, 0.05095489, 0.627451, 1, 0, 1,
-0.7142015, 0.3667301, 0.7194271, 0.6196079, 1, 0, 1,
-0.7041191, 1.636509, 0.6919717, 0.6156863, 1, 0, 1,
-0.702469, -0.3432335, -0.7759963, 0.6078432, 1, 0, 1,
-0.6977557, 1.216414, -0.5167189, 0.6039216, 1, 0, 1,
-0.6923942, 0.1219393, -2.500286, 0.5960785, 1, 0, 1,
-0.6912052, 1.649779, -1.717746, 0.5882353, 1, 0, 1,
-0.6880913, 0.4501834, -0.3226124, 0.5843138, 1, 0, 1,
-0.6809717, 0.2269897, -2.945223, 0.5764706, 1, 0, 1,
-0.6785067, 2.102991, 0.330044, 0.572549, 1, 0, 1,
-0.6782393, 2.077419, -2.603462, 0.5647059, 1, 0, 1,
-0.6756931, -1.326123, -1.028723, 0.5607843, 1, 0, 1,
-0.6729856, 0.5983749, 0.3003489, 0.5529412, 1, 0, 1,
-0.6687, -0.6291003, -2.135709, 0.5490196, 1, 0, 1,
-0.6679704, -1.007918, -2.572722, 0.5411765, 1, 0, 1,
-0.6659445, 2.761104, 1.138406, 0.5372549, 1, 0, 1,
-0.6582085, -1.112217, -1.863273, 0.5294118, 1, 0, 1,
-0.6548822, 1.296852, 0.004852618, 0.5254902, 1, 0, 1,
-0.6493481, 0.8576565, -0.9536094, 0.5176471, 1, 0, 1,
-0.6478615, -1.467752, -2.181756, 0.5137255, 1, 0, 1,
-0.6477172, -0.3037837, -2.012114, 0.5058824, 1, 0, 1,
-0.6410207, -0.915592, -3.575737, 0.5019608, 1, 0, 1,
-0.6353258, -0.7426112, -3.460141, 0.4941176, 1, 0, 1,
-0.633756, 0.5901025, -2.233366, 0.4862745, 1, 0, 1,
-0.6325839, -0.2422934, -2.151432, 0.4823529, 1, 0, 1,
-0.6310349, -0.5451601, -2.244568, 0.4745098, 1, 0, 1,
-0.6285061, -1.385291, -2.004928, 0.4705882, 1, 0, 1,
-0.6279885, -0.8919988, -2.895529, 0.4627451, 1, 0, 1,
-0.6264886, -1.754418, -2.330785, 0.4588235, 1, 0, 1,
-0.6255516, 1.178787, -1.249036, 0.4509804, 1, 0, 1,
-0.6250826, -0.6239858, -1.846003, 0.4470588, 1, 0, 1,
-0.6235816, 0.3721161, -1.033912, 0.4392157, 1, 0, 1,
-0.6231127, -0.3181396, -3.252206, 0.4352941, 1, 0, 1,
-0.6173491, 0.2146264, -2.971257, 0.427451, 1, 0, 1,
-0.616126, -0.1425841, -0.4699056, 0.4235294, 1, 0, 1,
-0.6150685, 0.5872325, -0.4796068, 0.4156863, 1, 0, 1,
-0.6036586, 0.4547364, 0.1176146, 0.4117647, 1, 0, 1,
-0.5988502, -0.2899241, -1.249624, 0.4039216, 1, 0, 1,
-0.5945812, 2.865321, -0.3091539, 0.3960784, 1, 0, 1,
-0.5896417, -0.2582497, -3.183261, 0.3921569, 1, 0, 1,
-0.5863559, -0.09466024, -3.931252, 0.3843137, 1, 0, 1,
-0.577229, 1.052109, -0.1004218, 0.3803922, 1, 0, 1,
-0.5750765, -0.01396894, -2.64363, 0.372549, 1, 0, 1,
-0.5747199, 1.133932, 0.7105184, 0.3686275, 1, 0, 1,
-0.5739279, -0.2138001, -4.080379, 0.3607843, 1, 0, 1,
-0.5717886, -0.6094592, -1.705384, 0.3568628, 1, 0, 1,
-0.5714967, -0.2379064, -2.412622, 0.3490196, 1, 0, 1,
-0.5714462, -1.297772, -3.16655, 0.345098, 1, 0, 1,
-0.5710663, -0.330908, -2.008042, 0.3372549, 1, 0, 1,
-0.5701354, 0.1170558, -1.311379, 0.3333333, 1, 0, 1,
-0.5670484, -0.01812478, -1.354327, 0.3254902, 1, 0, 1,
-0.5668108, -0.5842645, -2.702944, 0.3215686, 1, 0, 1,
-0.561311, -0.5264406, -3.843908, 0.3137255, 1, 0, 1,
-0.558278, -1.532948, -2.207422, 0.3098039, 1, 0, 1,
-0.5575423, 1.410521, -0.7871304, 0.3019608, 1, 0, 1,
-0.5486636, -1.162916, -3.779516, 0.2941177, 1, 0, 1,
-0.5461996, 0.5522209, -0.1322521, 0.2901961, 1, 0, 1,
-0.5422227, 1.528618, 0.5598765, 0.282353, 1, 0, 1,
-0.5412579, 1.216216, -1.380572, 0.2784314, 1, 0, 1,
-0.5402501, -1.022679, -3.415575, 0.2705882, 1, 0, 1,
-0.5373513, 0.6551024, 0.7727013, 0.2666667, 1, 0, 1,
-0.5357748, 0.8344545, 0.2762128, 0.2588235, 1, 0, 1,
-0.5319258, 1.219087, -1.294911, 0.254902, 1, 0, 1,
-0.5222207, -1.107576, -2.846862, 0.2470588, 1, 0, 1,
-0.5200878, -0.5012931, -1.984633, 0.2431373, 1, 0, 1,
-0.5125202, 0.9949753, -1.259632, 0.2352941, 1, 0, 1,
-0.5109051, 0.9632853, 0.3069752, 0.2313726, 1, 0, 1,
-0.5095061, -0.1739253, -3.299325, 0.2235294, 1, 0, 1,
-0.507471, 0.722428, -2.859657, 0.2196078, 1, 0, 1,
-0.5020345, -0.2177909, -3.457522, 0.2117647, 1, 0, 1,
-0.4996783, -0.017789, -2.351918, 0.2078431, 1, 0, 1,
-0.4963129, -0.18623, -3.944479, 0.2, 1, 0, 1,
-0.494944, -2.112497, -3.78108, 0.1921569, 1, 0, 1,
-0.4945385, 0.3327791, 0.8859143, 0.1882353, 1, 0, 1,
-0.4924432, -0.6171367, -2.590142, 0.1803922, 1, 0, 1,
-0.4828036, -1.079985, -2.570848, 0.1764706, 1, 0, 1,
-0.4815722, -0.5903271, -1.809155, 0.1686275, 1, 0, 1,
-0.481097, 0.7777888, -0.6992115, 0.1647059, 1, 0, 1,
-0.480134, 0.1766381, -1.22148, 0.1568628, 1, 0, 1,
-0.4798971, -1.270939, -4.21032, 0.1529412, 1, 0, 1,
-0.4798084, -2.392277, -2.785514, 0.145098, 1, 0, 1,
-0.4796555, -1.030206, -3.265701, 0.1411765, 1, 0, 1,
-0.4768028, -0.1292672, -0.6501038, 0.1333333, 1, 0, 1,
-0.4745501, -0.07642553, -1.256648, 0.1294118, 1, 0, 1,
-0.4739949, 0.7838417, 0.5871689, 0.1215686, 1, 0, 1,
-0.4674325, -0.2540864, -2.205216, 0.1176471, 1, 0, 1,
-0.4657446, 0.498715, -0.3011312, 0.1098039, 1, 0, 1,
-0.464448, -0.2269248, -3.339432, 0.1058824, 1, 0, 1,
-0.462285, -0.8482862, -3.119757, 0.09803922, 1, 0, 1,
-0.4615386, -0.7331825, -3.755427, 0.09019608, 1, 0, 1,
-0.4612048, -0.5796586, -2.169614, 0.08627451, 1, 0, 1,
-0.4607888, 0.9149463, -0.7018774, 0.07843138, 1, 0, 1,
-0.4606964, 0.9377005, 0.9459568, 0.07450981, 1, 0, 1,
-0.4591512, -0.1548081, -4.007793, 0.06666667, 1, 0, 1,
-0.4588438, 0.141002, -0.2220777, 0.0627451, 1, 0, 1,
-0.4573237, -0.08643464, -2.563654, 0.05490196, 1, 0, 1,
-0.4570147, 1.433414, -2.220155, 0.05098039, 1, 0, 1,
-0.4503781, -0.9537072, -1.539442, 0.04313726, 1, 0, 1,
-0.4492141, 0.5450219, 0.4579311, 0.03921569, 1, 0, 1,
-0.4470531, 0.1798079, -1.221329, 0.03137255, 1, 0, 1,
-0.4453287, 0.4513128, 1.261583, 0.02745098, 1, 0, 1,
-0.4434037, -0.9683542, -3.4885, 0.01960784, 1, 0, 1,
-0.4431768, -1.537974, -3.927103, 0.01568628, 1, 0, 1,
-0.4383745, 0.3703664, -1.537773, 0.007843138, 1, 0, 1,
-0.4314961, -0.4879047, -2.088898, 0.003921569, 1, 0, 1,
-0.4189148, 0.523035, -0.2512263, 0, 1, 0.003921569, 1,
-0.4176334, -0.9223506, -4.297948, 0, 1, 0.01176471, 1,
-0.4164602, 0.9843856, -0.7444535, 0, 1, 0.01568628, 1,
-0.4161506, -2.648657, -4.475047, 0, 1, 0.02352941, 1,
-0.4154846, -1.14405, -1.562356, 0, 1, 0.02745098, 1,
-0.4109381, 0.6679426, -1.254515, 0, 1, 0.03529412, 1,
-0.4083443, -0.3947757, -1.261333, 0, 1, 0.03921569, 1,
-0.4059979, -0.9584866, -2.73211, 0, 1, 0.04705882, 1,
-0.3978051, -0.7501273, -2.991924, 0, 1, 0.05098039, 1,
-0.3922268, -1.136241, -3.33433, 0, 1, 0.05882353, 1,
-0.3912045, -0.3801586, -4.43676, 0, 1, 0.0627451, 1,
-0.3858958, -1.207268, -2.991938, 0, 1, 0.07058824, 1,
-0.3854082, 0.7137468, 0.02019692, 0, 1, 0.07450981, 1,
-0.3840014, -0.5118431, -5.238564, 0, 1, 0.08235294, 1,
-0.3837035, -0.0585782, -2.156746, 0, 1, 0.08627451, 1,
-0.3832995, -0.162438, -2.573112, 0, 1, 0.09411765, 1,
-0.3807804, 0.3286121, -1.750944, 0, 1, 0.1019608, 1,
-0.3773696, -0.5579344, -1.673928, 0, 1, 0.1058824, 1,
-0.3758677, -0.05227053, -1.386503, 0, 1, 0.1137255, 1,
-0.3752469, -0.1396264, -2.786199, 0, 1, 0.1176471, 1,
-0.3748181, -1.173767, -4.343421, 0, 1, 0.1254902, 1,
-0.3743606, 0.8615811, -0.3784665, 0, 1, 0.1294118, 1,
-0.3741318, 0.5166773, -1.175985, 0, 1, 0.1372549, 1,
-0.3732346, 0.19102, -3.667749, 0, 1, 0.1411765, 1,
-0.3584825, -0.8626701, -0.4109444, 0, 1, 0.1490196, 1,
-0.3553074, -0.05340826, -1.271851, 0, 1, 0.1529412, 1,
-0.3532407, -0.12246, -1.333487, 0, 1, 0.1607843, 1,
-0.3522765, 0.4373098, -1.062688, 0, 1, 0.1647059, 1,
-0.3494644, 1.219819, -0.7014605, 0, 1, 0.172549, 1,
-0.3445683, 0.4099119, 0.256524, 0, 1, 0.1764706, 1,
-0.3441215, 0.004321166, -2.355915, 0, 1, 0.1843137, 1,
-0.3435414, 0.1966759, -1.190868, 0, 1, 0.1882353, 1,
-0.3377858, 0.5179793, 0.02771352, 0, 1, 0.1960784, 1,
-0.3369483, 0.4817695, 0.9316163, 0, 1, 0.2039216, 1,
-0.3355091, -0.06605572, -3.053164, 0, 1, 0.2078431, 1,
-0.3283988, 1.607307, -1.268205, 0, 1, 0.2156863, 1,
-0.324656, -0.957586, -3.165746, 0, 1, 0.2196078, 1,
-0.3235458, -1.49382, -1.716144, 0, 1, 0.227451, 1,
-0.3194212, 0.3984173, -1.944748, 0, 1, 0.2313726, 1,
-0.3172355, 1.04717, -1.931034, 0, 1, 0.2392157, 1,
-0.3132609, -0.4094106, -3.138246, 0, 1, 0.2431373, 1,
-0.3060493, 0.8913559, 0.9179389, 0, 1, 0.2509804, 1,
-0.2988286, 0.5124779, 0.4605402, 0, 1, 0.254902, 1,
-0.2898899, 0.5856665, 1.360943, 0, 1, 0.2627451, 1,
-0.2894922, 0.233837, 0.08359907, 0, 1, 0.2666667, 1,
-0.2833075, -0.3213297, -3.628195, 0, 1, 0.2745098, 1,
-0.2816021, -0.5020123, -4.409797, 0, 1, 0.2784314, 1,
-0.2815328, -2.930023, -3.461841, 0, 1, 0.2862745, 1,
-0.2791429, 1.099576, -0.9543336, 0, 1, 0.2901961, 1,
-0.2782244, -0.1641861, -1.556232, 0, 1, 0.2980392, 1,
-0.2777944, -0.3166722, -2.38225, 0, 1, 0.3058824, 1,
-0.2764733, 0.3551129, -1.584038, 0, 1, 0.3098039, 1,
-0.2756748, 1.177237, -0.5870908, 0, 1, 0.3176471, 1,
-0.2714189, 1.043372, 1.504488, 0, 1, 0.3215686, 1,
-0.2701764, 1.60297, 0.6097376, 0, 1, 0.3294118, 1,
-0.2651809, -0.7651882, -2.496571, 0, 1, 0.3333333, 1,
-0.2595195, 0.9687731, 0.1355475, 0, 1, 0.3411765, 1,
-0.2590923, 0.5639422, 1.488207, 0, 1, 0.345098, 1,
-0.258525, -0.155138, -3.004632, 0, 1, 0.3529412, 1,
-0.2534156, 0.7129446, 0.6427986, 0, 1, 0.3568628, 1,
-0.2503488, -1.099355, -2.612511, 0, 1, 0.3647059, 1,
-0.2460933, -1.169489, -2.073508, 0, 1, 0.3686275, 1,
-0.2455263, 0.9735835, -0.03603959, 0, 1, 0.3764706, 1,
-0.242642, 0.1875946, -2.481571, 0, 1, 0.3803922, 1,
-0.2412403, -0.5468689, -2.197237, 0, 1, 0.3882353, 1,
-0.2385853, -1.188396, -3.994213, 0, 1, 0.3921569, 1,
-0.2363295, -0.3960781, -3.692657, 0, 1, 0.4, 1,
-0.2334229, 0.2755045, 1.41062, 0, 1, 0.4078431, 1,
-0.2329929, -0.1537635, -1.004445, 0, 1, 0.4117647, 1,
-0.2325955, 1.231087, 0.7969072, 0, 1, 0.4196078, 1,
-0.2290509, -1.228201, -4.487403, 0, 1, 0.4235294, 1,
-0.225686, -0.6319596, -3.346363, 0, 1, 0.4313726, 1,
-0.2249932, -0.8458304, -4.325395, 0, 1, 0.4352941, 1,
-0.2234713, 0.1967674, -0.369195, 0, 1, 0.4431373, 1,
-0.2199724, 1.034439, -0.7404786, 0, 1, 0.4470588, 1,
-0.2189163, 0.3331721, -2.805067, 0, 1, 0.454902, 1,
-0.2187746, 0.08894603, -1.488867, 0, 1, 0.4588235, 1,
-0.2143347, -0.8524195, -3.8547, 0, 1, 0.4666667, 1,
-0.2120226, 1.301175, 1.270387, 0, 1, 0.4705882, 1,
-0.2103439, -1.215269, -3.860627, 0, 1, 0.4784314, 1,
-0.2080391, -0.1109073, -1.372948, 0, 1, 0.4823529, 1,
-0.2046858, 0.09700707, -3.756124, 0, 1, 0.4901961, 1,
-0.2045415, -0.2181947, -1.336245, 0, 1, 0.4941176, 1,
-0.201895, -0.6849226, -2.906777, 0, 1, 0.5019608, 1,
-0.2005561, 0.738181, 0.6166154, 0, 1, 0.509804, 1,
-0.1986157, 0.7437642, -1.058422, 0, 1, 0.5137255, 1,
-0.1982914, -1.696949, -2.857733, 0, 1, 0.5215687, 1,
-0.1960479, 0.6872823, -2.126575, 0, 1, 0.5254902, 1,
-0.1835367, -0.7869576, -0.9327081, 0, 1, 0.5333334, 1,
-0.1829132, -0.6563108, -3.502862, 0, 1, 0.5372549, 1,
-0.1798172, 1.602308, 0.4747029, 0, 1, 0.5450981, 1,
-0.1710415, -0.05067124, -1.200016, 0, 1, 0.5490196, 1,
-0.1703428, 2.136359, -0.2871265, 0, 1, 0.5568628, 1,
-0.1700784, 1.473707, 0.1539791, 0, 1, 0.5607843, 1,
-0.164969, -0.007510516, -1.046742, 0, 1, 0.5686275, 1,
-0.1639961, -0.5205123, -0.4036244, 0, 1, 0.572549, 1,
-0.1631438, -1.190446, -2.228697, 0, 1, 0.5803922, 1,
-0.1608502, 0.5461694, -1.179631, 0, 1, 0.5843138, 1,
-0.1602226, -1.585117, -2.585785, 0, 1, 0.5921569, 1,
-0.157803, -2.975835, -2.956513, 0, 1, 0.5960785, 1,
-0.1557659, -0.1365845, -1.811262, 0, 1, 0.6039216, 1,
-0.1533685, -0.9890981, -2.881499, 0, 1, 0.6117647, 1,
-0.1513497, -0.4997959, -2.710078, 0, 1, 0.6156863, 1,
-0.147698, -1.08274, -3.098565, 0, 1, 0.6235294, 1,
-0.1433122, 1.007956, 0.07339487, 0, 1, 0.627451, 1,
-0.1410571, -2.903483, -2.545776, 0, 1, 0.6352941, 1,
-0.1396984, -1.111033, -2.912907, 0, 1, 0.6392157, 1,
-0.1372269, -0.3215697, -2.190895, 0, 1, 0.6470588, 1,
-0.1331284, -0.5756891, -2.391519, 0, 1, 0.6509804, 1,
-0.1289274, 0.2229488, 0.433275, 0, 1, 0.6588235, 1,
-0.1283647, -1.519396, -4.367082, 0, 1, 0.6627451, 1,
-0.1274649, 1.027798, -2.004241, 0, 1, 0.6705883, 1,
-0.1233783, -1.330196, -2.676238, 0, 1, 0.6745098, 1,
-0.1186978, -3.006185, -2.017829, 0, 1, 0.682353, 1,
-0.1151792, 1.123645, -2.11973, 0, 1, 0.6862745, 1,
-0.1148881, -0.4487253, -1.988783, 0, 1, 0.6941177, 1,
-0.1098544, 2.101593, 0.8837042, 0, 1, 0.7019608, 1,
-0.109116, 0.7606497, -0.3233753, 0, 1, 0.7058824, 1,
-0.101144, 1.248488, -0.9078124, 0, 1, 0.7137255, 1,
-0.09584552, -1.630629, -3.695613, 0, 1, 0.7176471, 1,
-0.09249518, -1.933227, -2.116083, 0, 1, 0.7254902, 1,
-0.08841894, 1.632226, -0.4651606, 0, 1, 0.7294118, 1,
-0.08833605, 0.178931, -0.7889458, 0, 1, 0.7372549, 1,
-0.08752853, 1.761079, 0.534918, 0, 1, 0.7411765, 1,
-0.08718394, 0.2033107, -0.3735543, 0, 1, 0.7490196, 1,
-0.08424271, -0.389785, -3.192435, 0, 1, 0.7529412, 1,
-0.08336605, -0.4183581, -2.842732, 0, 1, 0.7607843, 1,
-0.08291135, -2.090183, -1.371614, 0, 1, 0.7647059, 1,
-0.07539798, -0.3933828, -3.736054, 0, 1, 0.772549, 1,
-0.07425997, -0.06447346, -3.038872, 0, 1, 0.7764706, 1,
-0.06982754, 0.1108524, -0.05972811, 0, 1, 0.7843137, 1,
-0.06967341, 0.6203097, 0.5682695, 0, 1, 0.7882353, 1,
-0.06849988, -0.09468073, -3.718178, 0, 1, 0.7960784, 1,
-0.06794788, -0.1872388, -2.661055, 0, 1, 0.8039216, 1,
-0.06500243, 0.9627812, 0.7024812, 0, 1, 0.8078431, 1,
-0.06484435, 0.2880753, -0.7842101, 0, 1, 0.8156863, 1,
-0.06151648, 0.1427232, -1.783121, 0, 1, 0.8196079, 1,
-0.05893473, -1.023234, -2.970389, 0, 1, 0.827451, 1,
-0.05837261, 0.09052249, -1.119286, 0, 1, 0.8313726, 1,
-0.05771461, -0.9319582, -5.900108, 0, 1, 0.8392157, 1,
-0.05336061, 0.01831296, -2.16388, 0, 1, 0.8431373, 1,
-0.04862711, -0.3261029, -4.417205, 0, 1, 0.8509804, 1,
-0.04737208, 0.1436147, -1.328563, 0, 1, 0.854902, 1,
-0.04119616, 0.02767614, -2.127081, 0, 1, 0.8627451, 1,
-0.03995651, 0.08298136, -0.5509873, 0, 1, 0.8666667, 1,
-0.03944546, -1.122911, -3.510772, 0, 1, 0.8745098, 1,
-0.03774027, 2.073458, 1.980821, 0, 1, 0.8784314, 1,
-0.03647519, -0.602093, -3.157494, 0, 1, 0.8862745, 1,
-0.03643905, -1.225756, -2.756985, 0, 1, 0.8901961, 1,
-0.03379182, 0.5988075, 1.119005, 0, 1, 0.8980392, 1,
-0.03301894, 0.3204723, 1.730364, 0, 1, 0.9058824, 1,
-0.02953294, 0.7034695, 0.5555574, 0, 1, 0.9098039, 1,
-0.0275415, 0.2886162, -0.1733957, 0, 1, 0.9176471, 1,
-0.02602138, -1.077537, -1.844838, 0, 1, 0.9215686, 1,
-0.02529331, 1.173841, 0.236997, 0, 1, 0.9294118, 1,
-0.02373804, -0.7485691, -3.212512, 0, 1, 0.9333333, 1,
-0.02354917, -0.8266373, -0.8150675, 0, 1, 0.9411765, 1,
-0.01905942, -0.9114577, -3.391194, 0, 1, 0.945098, 1,
-0.01868698, 0.392588, 1.322525, 0, 1, 0.9529412, 1,
-0.01743712, 1.24272, -0.8855764, 0, 1, 0.9568627, 1,
-0.01681129, -0.8066342, -3.182067, 0, 1, 0.9647059, 1,
-0.0166203, 0.273745, 1.001159, 0, 1, 0.9686275, 1,
-0.01444133, -0.2294317, -2.872199, 0, 1, 0.9764706, 1,
-0.004755939, 0.4904498, -0.1570834, 0, 1, 0.9803922, 1,
-0.003104014, -0.335134, -2.902254, 0, 1, 0.9882353, 1,
-0.0002767874, 1.07569, -0.6757385, 0, 1, 0.9921569, 1,
0.001197588, 0.2965462, 0.04168094, 0, 1, 1, 1,
0.00296132, -1.594867, 4.270144, 0, 0.9921569, 1, 1,
0.004468691, -0.5964264, 4.41882, 0, 0.9882353, 1, 1,
0.006264044, 1.481368, -0.8631853, 0, 0.9803922, 1, 1,
0.01002895, 1.147774, -0.7760643, 0, 0.9764706, 1, 1,
0.01010213, -0.157215, 1.640793, 0, 0.9686275, 1, 1,
0.01211689, 0.1727023, 0.4937018, 0, 0.9647059, 1, 1,
0.01382519, -0.2161736, 0.5188488, 0, 0.9568627, 1, 1,
0.01501518, 0.3383655, -0.7328852, 0, 0.9529412, 1, 1,
0.02158234, -0.1760404, 3.365742, 0, 0.945098, 1, 1,
0.02596932, -0.5656143, 2.681335, 0, 0.9411765, 1, 1,
0.02655432, -1.009231, 3.557258, 0, 0.9333333, 1, 1,
0.02671964, -0.2715575, 4.257713, 0, 0.9294118, 1, 1,
0.03024161, 0.6342942, -0.4342928, 0, 0.9215686, 1, 1,
0.03148339, 0.7840061, 1.072885, 0, 0.9176471, 1, 1,
0.03199818, 0.2175394, 0.8474469, 0, 0.9098039, 1, 1,
0.03572484, 0.839824, 0.434436, 0, 0.9058824, 1, 1,
0.0384917, -0.6049016, 3.254112, 0, 0.8980392, 1, 1,
0.04004781, 1.055307, -0.1623811, 0, 0.8901961, 1, 1,
0.04110859, 1.729517, 0.214356, 0, 0.8862745, 1, 1,
0.04178893, -1.074244, 2.925687, 0, 0.8784314, 1, 1,
0.05226565, 0.2769864, 1.300933, 0, 0.8745098, 1, 1,
0.05294944, 1.706826, 0.2326695, 0, 0.8666667, 1, 1,
0.0577548, 0.8686911, 1.120753, 0, 0.8627451, 1, 1,
0.05780143, -0.4131673, 4.176482, 0, 0.854902, 1, 1,
0.05826481, 1.859302, -0.1177462, 0, 0.8509804, 1, 1,
0.06097402, 0.01059079, 1.562137, 0, 0.8431373, 1, 1,
0.06710215, 1.154048, -0.2622774, 0, 0.8392157, 1, 1,
0.08056629, -1.253231, 3.699012, 0, 0.8313726, 1, 1,
0.0875488, -0.3839145, 4.345385, 0, 0.827451, 1, 1,
0.08787342, -1.028687, 1.08977, 0, 0.8196079, 1, 1,
0.08803487, -0.3926469, 1.765271, 0, 0.8156863, 1, 1,
0.0895951, 1.072758, 0.5656286, 0, 0.8078431, 1, 1,
0.09122574, -2.082769, 0.9754236, 0, 0.8039216, 1, 1,
0.0920232, 1.423192, -1.175481, 0, 0.7960784, 1, 1,
0.09850207, 0.1980207, 0.1429604, 0, 0.7882353, 1, 1,
0.1021227, -0.05010126, 1.764033, 0, 0.7843137, 1, 1,
0.1027578, -0.8782502, 2.689025, 0, 0.7764706, 1, 1,
0.103235, 1.709592, 0.01399987, 0, 0.772549, 1, 1,
0.1054035, -2.132654, 3.972563, 0, 0.7647059, 1, 1,
0.1079847, 0.6177202, -0.3514299, 0, 0.7607843, 1, 1,
0.1095469, 0.009545447, 0.9172612, 0, 0.7529412, 1, 1,
0.1097456, 0.2187531, 1.370877, 0, 0.7490196, 1, 1,
0.1115074, 0.7932414, 1.61728, 0, 0.7411765, 1, 1,
0.1124334, -0.1708713, 2.715583, 0, 0.7372549, 1, 1,
0.1171951, -1.269114, 3.533201, 0, 0.7294118, 1, 1,
0.1193763, 1.086533, -0.2625611, 0, 0.7254902, 1, 1,
0.1209783, 1.331339, 0.4168184, 0, 0.7176471, 1, 1,
0.1263407, -0.3058124, 3.501257, 0, 0.7137255, 1, 1,
0.1266892, 0.3637789, 1.392179, 0, 0.7058824, 1, 1,
0.1269398, 2.073039, -0.8818991, 0, 0.6980392, 1, 1,
0.1272605, -1.625962, 4.567384, 0, 0.6941177, 1, 1,
0.1279796, 0.2353059, 0.4185459, 0, 0.6862745, 1, 1,
0.1287774, 0.1230648, 0.5058557, 0, 0.682353, 1, 1,
0.1362591, -0.4942758, 3.167541, 0, 0.6745098, 1, 1,
0.1366841, -0.7338305, 2.130491, 0, 0.6705883, 1, 1,
0.1375588, -0.2287581, 2.879919, 0, 0.6627451, 1, 1,
0.1394942, 0.7473751, 0.2436876, 0, 0.6588235, 1, 1,
0.143612, 0.05305368, 1.929334, 0, 0.6509804, 1, 1,
0.1445044, 0.6023107, -0.5263323, 0, 0.6470588, 1, 1,
0.146383, -1.305074, 4.080111, 0, 0.6392157, 1, 1,
0.1487903, -1.039366, 1.197606, 0, 0.6352941, 1, 1,
0.1516621, 0.1842171, -0.2997057, 0, 0.627451, 1, 1,
0.152149, -0.1453896, 3.554904, 0, 0.6235294, 1, 1,
0.1524803, -1.634242, 4.165301, 0, 0.6156863, 1, 1,
0.1526077, 0.4484389, 0.3627964, 0, 0.6117647, 1, 1,
0.1532095, 0.1243537, 1.522199, 0, 0.6039216, 1, 1,
0.1558897, -0.1684305, 2.764594, 0, 0.5960785, 1, 1,
0.1591935, 1.441234, -0.06976683, 0, 0.5921569, 1, 1,
0.1606889, 1.37498, 0.5645342, 0, 0.5843138, 1, 1,
0.1618897, -1.663949, 4.085029, 0, 0.5803922, 1, 1,
0.1637153, -0.7018812, 3.717084, 0, 0.572549, 1, 1,
0.166479, -0.1365777, 2.744635, 0, 0.5686275, 1, 1,
0.1670405, -0.276035, 1.053363, 0, 0.5607843, 1, 1,
0.1703652, -0.5149019, 3.504468, 0, 0.5568628, 1, 1,
0.178003, -0.3959555, 2.371665, 0, 0.5490196, 1, 1,
0.1790907, -0.7614348, 3.588193, 0, 0.5450981, 1, 1,
0.1802367, -0.4814129, 3.990083, 0, 0.5372549, 1, 1,
0.1816514, 0.1699675, 2.481825, 0, 0.5333334, 1, 1,
0.1825785, -0.03004653, 2.49303, 0, 0.5254902, 1, 1,
0.1833678, -0.6447707, 3.0895, 0, 0.5215687, 1, 1,
0.1843358, 0.06712828, 2.372315, 0, 0.5137255, 1, 1,
0.1850428, -0.2944419, 2.868266, 0, 0.509804, 1, 1,
0.1874569, 0.9525982, 1.875842, 0, 0.5019608, 1, 1,
0.1983364, 0.1414228, 1.44504, 0, 0.4941176, 1, 1,
0.1992172, -1.440878, 3.335189, 0, 0.4901961, 1, 1,
0.1995808, 1.928282, 0.1482169, 0, 0.4823529, 1, 1,
0.2001487, 1.618989, 1.380258, 0, 0.4784314, 1, 1,
0.2013361, 0.1493024, 1.619246, 0, 0.4705882, 1, 1,
0.2064651, 2.184237, 0.2438076, 0, 0.4666667, 1, 1,
0.2087018, -0.9867004, 2.901697, 0, 0.4588235, 1, 1,
0.2088426, 1.283322, -0.1388469, 0, 0.454902, 1, 1,
0.2107885, -1.030454, 2.246646, 0, 0.4470588, 1, 1,
0.2125622, -0.6537945, 2.350325, 0, 0.4431373, 1, 1,
0.2150255, 0.9218743, 0.7554874, 0, 0.4352941, 1, 1,
0.2166016, -2.25462, 3.91758, 0, 0.4313726, 1, 1,
0.2167063, -0.1642068, 3.698794, 0, 0.4235294, 1, 1,
0.2186823, -1.10948, 3.423528, 0, 0.4196078, 1, 1,
0.2192958, 0.5427702, -0.2753982, 0, 0.4117647, 1, 1,
0.2262875, -0.3069586, 2.858015, 0, 0.4078431, 1, 1,
0.2276337, -1.543659, 1.735338, 0, 0.4, 1, 1,
0.2347239, -0.2197761, 2.724538, 0, 0.3921569, 1, 1,
0.2359738, 0.7393706, 0.08050175, 0, 0.3882353, 1, 1,
0.2434107, 0.9231629, 0.361952, 0, 0.3803922, 1, 1,
0.2443824, 1.815424, -0.4614761, 0, 0.3764706, 1, 1,
0.2467776, -2.373128, 4.06773, 0, 0.3686275, 1, 1,
0.2487121, 1.598824, 1.722533, 0, 0.3647059, 1, 1,
0.2488607, -0.2090696, 2.832903, 0, 0.3568628, 1, 1,
0.2505907, -1.53025, 3.317264, 0, 0.3529412, 1, 1,
0.2548198, -0.6715233, 4.21767, 0, 0.345098, 1, 1,
0.2596449, 0.3307003, 0.5940847, 0, 0.3411765, 1, 1,
0.2607318, 0.6601277, 0.7165865, 0, 0.3333333, 1, 1,
0.2607415, -0.9890792, 1.573463, 0, 0.3294118, 1, 1,
0.2609207, -0.3229944, 1.949945, 0, 0.3215686, 1, 1,
0.2678789, 3.0191, 0.9570034, 0, 0.3176471, 1, 1,
0.2723147, -1.241368, 2.481024, 0, 0.3098039, 1, 1,
0.2788311, -0.1066286, 2.650259, 0, 0.3058824, 1, 1,
0.2852332, 0.1576643, 0.3292795, 0, 0.2980392, 1, 1,
0.2870081, -0.1811526, 2.670695, 0, 0.2901961, 1, 1,
0.2875535, 0.8123716, 1.547473, 0, 0.2862745, 1, 1,
0.2947358, 1.541873, 0.9780358, 0, 0.2784314, 1, 1,
0.2952917, 1.3126, -2.231138, 0, 0.2745098, 1, 1,
0.2985244, -1.904476, 2.34164, 0, 0.2666667, 1, 1,
0.3002565, 0.3421563, 1.498764, 0, 0.2627451, 1, 1,
0.304183, -2.169149, 4.28516, 0, 0.254902, 1, 1,
0.3097512, 1.269785, -0.6635026, 0, 0.2509804, 1, 1,
0.3099915, 0.6132973, -0.1815967, 0, 0.2431373, 1, 1,
0.3110208, 0.8931265, 2.730257, 0, 0.2392157, 1, 1,
0.3131915, -0.2671582, 3.759105, 0, 0.2313726, 1, 1,
0.314015, 0.6310912, -1.48782, 0, 0.227451, 1, 1,
0.3146574, 0.2929469, -0.4674697, 0, 0.2196078, 1, 1,
0.3183358, -0.163553, 1.305653, 0, 0.2156863, 1, 1,
0.3186063, -0.3954211, 2.332512, 0, 0.2078431, 1, 1,
0.3199719, -0.9572893, 1.318879, 0, 0.2039216, 1, 1,
0.3272566, -0.4136087, 1.648897, 0, 0.1960784, 1, 1,
0.3288831, -0.2594157, 3.118112, 0, 0.1882353, 1, 1,
0.3333944, -2.980622, 2.008844, 0, 0.1843137, 1, 1,
0.3386665, 0.06058364, 0.9622164, 0, 0.1764706, 1, 1,
0.3403112, -0.4924277, 2.994551, 0, 0.172549, 1, 1,
0.3419205, -0.3072296, 1.954118, 0, 0.1647059, 1, 1,
0.345772, 0.744282, 0.3640822, 0, 0.1607843, 1, 1,
0.3473808, -1.111272, 3.66313, 0, 0.1529412, 1, 1,
0.3509558, 0.06629728, 0.4887481, 0, 0.1490196, 1, 1,
0.355383, -0.1294269, 1.231582, 0, 0.1411765, 1, 1,
0.3582361, 0.5310692, -0.7086286, 0, 0.1372549, 1, 1,
0.3596, -0.2804815, 2.846631, 0, 0.1294118, 1, 1,
0.36107, 1.012987, 1.270141, 0, 0.1254902, 1, 1,
0.3650405, 0.7097573, -1.047188, 0, 0.1176471, 1, 1,
0.367164, 0.2900739, -1.897812, 0, 0.1137255, 1, 1,
0.3718327, 1.313435, 2.008468, 0, 0.1058824, 1, 1,
0.3754801, 1.404574, -0.366266, 0, 0.09803922, 1, 1,
0.3861661, -1.042354, 2.062129, 0, 0.09411765, 1, 1,
0.3864528, -0.3315603, 0.3524062, 0, 0.08627451, 1, 1,
0.3901275, 1.417485, 1.380514, 0, 0.08235294, 1, 1,
0.3945408, 0.6427767, 0.1340406, 0, 0.07450981, 1, 1,
0.3970955, -0.373008, 3.941412, 0, 0.07058824, 1, 1,
0.3984096, 1.084881, 0.2062662, 0, 0.0627451, 1, 1,
0.4014542, 0.6415477, -1.851612, 0, 0.05882353, 1, 1,
0.403791, 0.195282, 0.4771082, 0, 0.05098039, 1, 1,
0.4038, 1.240061, -0.1563169, 0, 0.04705882, 1, 1,
0.4040206, 0.4565415, -0.8413458, 0, 0.03921569, 1, 1,
0.4091749, -0.06720378, 2.208215, 0, 0.03529412, 1, 1,
0.4100846, -0.2374926, 1.92233, 0, 0.02745098, 1, 1,
0.4120439, 1.720053, 0.550615, 0, 0.02352941, 1, 1,
0.4164185, -0.5434269, 3.809445, 0, 0.01568628, 1, 1,
0.416714, -0.5494498, 2.886138, 0, 0.01176471, 1, 1,
0.42598, -0.5457194, 3.03163, 0, 0.003921569, 1, 1,
0.4269562, 1.171215, -0.8770341, 0.003921569, 0, 1, 1,
0.4296242, 0.6610384, 0.8040282, 0.007843138, 0, 1, 1,
0.4304765, -0.2410972, 0.879193, 0.01568628, 0, 1, 1,
0.43161, 0.6852729, 0.6168277, 0.01960784, 0, 1, 1,
0.4353767, -0.5472561, 1.718979, 0.02745098, 0, 1, 1,
0.4372114, 0.6420813, 1.171199, 0.03137255, 0, 1, 1,
0.4395926, -1.25328, 1.836299, 0.03921569, 0, 1, 1,
0.4451573, 0.7154509, 0.8032823, 0.04313726, 0, 1, 1,
0.4453697, 0.6131055, 1.225596, 0.05098039, 0, 1, 1,
0.4491256, -0.8354867, 2.956088, 0.05490196, 0, 1, 1,
0.4508212, -0.7017491, 1.487051, 0.0627451, 0, 1, 1,
0.4508944, -1.046443, 2.064605, 0.06666667, 0, 1, 1,
0.4522057, 0.19192, 1.989527, 0.07450981, 0, 1, 1,
0.4523879, 0.792317, -0.4631733, 0.07843138, 0, 1, 1,
0.4559408, 2.316675, 0.4238114, 0.08627451, 0, 1, 1,
0.4563146, 0.5826449, 0.2792047, 0.09019608, 0, 1, 1,
0.4609364, 0.4873049, 1.521921, 0.09803922, 0, 1, 1,
0.46163, -1.233978, 3.177572, 0.1058824, 0, 1, 1,
0.4633696, -0.2464719, 1.002675, 0.1098039, 0, 1, 1,
0.4690205, 1.239159, 2.026303, 0.1176471, 0, 1, 1,
0.4694898, 0.3833592, 0.8685283, 0.1215686, 0, 1, 1,
0.4695255, 0.9537682, 1.52668, 0.1294118, 0, 1, 1,
0.4708738, 0.2423284, 0.8231809, 0.1333333, 0, 1, 1,
0.4747393, -0.9095093, 1.955543, 0.1411765, 0, 1, 1,
0.4756722, 1.765857, 1.439192, 0.145098, 0, 1, 1,
0.4788599, 0.9062581, 1.65258, 0.1529412, 0, 1, 1,
0.4808592, 0.428183, 0.7304382, 0.1568628, 0, 1, 1,
0.4820626, -1.429926, 2.580866, 0.1647059, 0, 1, 1,
0.5039394, -1.321583, 4.301685, 0.1686275, 0, 1, 1,
0.5041367, -1.297094, 3.048223, 0.1764706, 0, 1, 1,
0.5088363, 1.351522, -0.5522665, 0.1803922, 0, 1, 1,
0.5094647, -0.7434676, 3.117753, 0.1882353, 0, 1, 1,
0.5096506, -0.08316383, 2.257752, 0.1921569, 0, 1, 1,
0.5110889, -0.529745, 1.413025, 0.2, 0, 1, 1,
0.5139881, 2.242584, -2.077404, 0.2078431, 0, 1, 1,
0.5158427, -1.156674, 2.038419, 0.2117647, 0, 1, 1,
0.5184308, -0.4766717, 2.769752, 0.2196078, 0, 1, 1,
0.5223256, 0.9249516, 1.7496, 0.2235294, 0, 1, 1,
0.5237265, -0.242769, 1.5409, 0.2313726, 0, 1, 1,
0.5277131, 0.3017995, 1.400199, 0.2352941, 0, 1, 1,
0.52851, -0.1372951, 1.754464, 0.2431373, 0, 1, 1,
0.5295543, -0.867699, 1.305106, 0.2470588, 0, 1, 1,
0.5306984, -1.133582, 1.17755, 0.254902, 0, 1, 1,
0.5313294, 1.153018, 0.8424616, 0.2588235, 0, 1, 1,
0.5323201, 1.106534, -0.9177843, 0.2666667, 0, 1, 1,
0.5359053, 0.4000631, 0.9557002, 0.2705882, 0, 1, 1,
0.5368498, -0.362725, 2.619904, 0.2784314, 0, 1, 1,
0.5371835, -2.599992, 0.286237, 0.282353, 0, 1, 1,
0.5378596, -0.1294231, 2.67375, 0.2901961, 0, 1, 1,
0.5386282, 0.8559565, -0.3089677, 0.2941177, 0, 1, 1,
0.5399498, -0.5916559, 2.133198, 0.3019608, 0, 1, 1,
0.5404553, 0.3195064, 0.796756, 0.3098039, 0, 1, 1,
0.5421405, 0.7187978, 2.131958, 0.3137255, 0, 1, 1,
0.5451704, 2.46506, 0.5004196, 0.3215686, 0, 1, 1,
0.5452934, 1.389051, -0.1845024, 0.3254902, 0, 1, 1,
0.5485304, 1.05123, 1.584031, 0.3333333, 0, 1, 1,
0.5491507, -0.360728, 2.062833, 0.3372549, 0, 1, 1,
0.5516942, 0.1235167, 2.119354, 0.345098, 0, 1, 1,
0.5528476, -0.1082773, 0.7845493, 0.3490196, 0, 1, 1,
0.5565645, 0.281017, 1.033216, 0.3568628, 0, 1, 1,
0.5582519, 1.540813, 0.7106835, 0.3607843, 0, 1, 1,
0.5590364, 0.9024277, 1.002611, 0.3686275, 0, 1, 1,
0.5594803, 0.3783644, 0.6428469, 0.372549, 0, 1, 1,
0.5600156, -0.5436054, 2.08687, 0.3803922, 0, 1, 1,
0.5643319, -2.078755, 1.184616, 0.3843137, 0, 1, 1,
0.5652817, 0.1796957, -0.2556993, 0.3921569, 0, 1, 1,
0.5760408, 0.7196007, -1.741834, 0.3960784, 0, 1, 1,
0.5780968, -0.2201499, 2.138363, 0.4039216, 0, 1, 1,
0.5794621, -0.01485838, 2.196584, 0.4117647, 0, 1, 1,
0.5818668, 0.7777258, 0.9430799, 0.4156863, 0, 1, 1,
0.5837529, 0.9789492, 0.1036449, 0.4235294, 0, 1, 1,
0.5868726, -1.481691, 3.930814, 0.427451, 0, 1, 1,
0.5872479, 1.373532, 0.5069021, 0.4352941, 0, 1, 1,
0.589784, -1.687617, 4.22894, 0.4392157, 0, 1, 1,
0.591701, -0.7967653, 3.638659, 0.4470588, 0, 1, 1,
0.5935708, -0.8110012, 1.433171, 0.4509804, 0, 1, 1,
0.5971695, 2.108196, 2.079525, 0.4588235, 0, 1, 1,
0.6060109, 0.1881023, 1.524354, 0.4627451, 0, 1, 1,
0.6069648, 0.2612447, 1.295886, 0.4705882, 0, 1, 1,
0.6080136, 0.3075789, 0.7479742, 0.4745098, 0, 1, 1,
0.608464, -0.5391496, 3.474566, 0.4823529, 0, 1, 1,
0.6122622, 0.2770643, 2.382737, 0.4862745, 0, 1, 1,
0.6124745, 1.885409, -0.005078028, 0.4941176, 0, 1, 1,
0.6144145, -0.3267576, 1.622007, 0.5019608, 0, 1, 1,
0.6186358, 0.3477735, 0.5638824, 0.5058824, 0, 1, 1,
0.6209322, 0.1596263, 3.216793, 0.5137255, 0, 1, 1,
0.6240654, -1.630334, 2.751842, 0.5176471, 0, 1, 1,
0.6243611, -1.356327, 2.946248, 0.5254902, 0, 1, 1,
0.6345215, -1.35634, 4.154071, 0.5294118, 0, 1, 1,
0.636591, 1.274497, 2.188887, 0.5372549, 0, 1, 1,
0.642718, -0.01892735, 1.480561, 0.5411765, 0, 1, 1,
0.6440447, 1.130041, 2.167322, 0.5490196, 0, 1, 1,
0.6465162, -0.9934087, 2.399097, 0.5529412, 0, 1, 1,
0.6498885, 1.394987, 1.071836, 0.5607843, 0, 1, 1,
0.6515602, -0.3260945, 1.068003, 0.5647059, 0, 1, 1,
0.6560224, 0.6822422, 3.157324, 0.572549, 0, 1, 1,
0.6561549, -1.013081, 1.712414, 0.5764706, 0, 1, 1,
0.6616775, 0.3560857, 0.7079363, 0.5843138, 0, 1, 1,
0.6658976, 0.6533033, 1.498141, 0.5882353, 0, 1, 1,
0.6757014, 1.587109, -0.3188713, 0.5960785, 0, 1, 1,
0.6792548, 0.5267532, 1.732859, 0.6039216, 0, 1, 1,
0.6840946, -0.09593508, 1.724078, 0.6078432, 0, 1, 1,
0.6850615, 0.3022412, 1.662165, 0.6156863, 0, 1, 1,
0.6902332, 0.3537373, 1.783623, 0.6196079, 0, 1, 1,
0.6940691, 1.220921, 0.7437199, 0.627451, 0, 1, 1,
0.6976628, 0.4775219, 0.3347073, 0.6313726, 0, 1, 1,
0.6995528, 1.467485, 0.1199006, 0.6392157, 0, 1, 1,
0.7018522, -2.656913, 2.862183, 0.6431373, 0, 1, 1,
0.7041079, 1.014934, 1.125719, 0.6509804, 0, 1, 1,
0.7050589, -0.9764606, 2.977639, 0.654902, 0, 1, 1,
0.7069219, 0.7494437, 0.9369439, 0.6627451, 0, 1, 1,
0.7197539, -1.105321, 1.412672, 0.6666667, 0, 1, 1,
0.7243101, -0.5127937, 0.1356621, 0.6745098, 0, 1, 1,
0.7246419, 0.8012271, 3.185443, 0.6784314, 0, 1, 1,
0.7284347, 0.2971913, 2.08216, 0.6862745, 0, 1, 1,
0.7355635, 0.3947202, 1.322016, 0.6901961, 0, 1, 1,
0.7363571, 0.4274739, 1.078608, 0.6980392, 0, 1, 1,
0.7365556, -1.383212, 3.568182, 0.7058824, 0, 1, 1,
0.7367029, -0.6898822, 4.198982, 0.7098039, 0, 1, 1,
0.742402, 1.417904, 0.6801721, 0.7176471, 0, 1, 1,
0.7432064, -0.2093276, 3.481318, 0.7215686, 0, 1, 1,
0.7448789, -0.813769, 0.9720333, 0.7294118, 0, 1, 1,
0.7564149, 2.323393, 2.708106, 0.7333333, 0, 1, 1,
0.7580236, 0.1883996, 2.925679, 0.7411765, 0, 1, 1,
0.7582968, 0.6918386, 0.3668061, 0.7450981, 0, 1, 1,
0.7587312, -0.7505571, 1.994747, 0.7529412, 0, 1, 1,
0.7634389, -0.3500154, 2.951107, 0.7568628, 0, 1, 1,
0.764221, -0.9986312, 3.04841, 0.7647059, 0, 1, 1,
0.7662541, -1.58639, 2.020656, 0.7686275, 0, 1, 1,
0.7668124, 1.475622, 2.446378, 0.7764706, 0, 1, 1,
0.7687045, 0.1511919, 3.198595, 0.7803922, 0, 1, 1,
0.7692572, 0.288438, 1.476607, 0.7882353, 0, 1, 1,
0.7703289, -0.276952, 1.162929, 0.7921569, 0, 1, 1,
0.7709994, -0.0543314, 2.464766, 0.8, 0, 1, 1,
0.7712613, 0.01864546, 1.106991, 0.8078431, 0, 1, 1,
0.7722654, -0.3509142, 2.43477, 0.8117647, 0, 1, 1,
0.7741615, -0.204679, 0.5929695, 0.8196079, 0, 1, 1,
0.7795129, -0.9186165, 2.049967, 0.8235294, 0, 1, 1,
0.7831267, -1.671457, 2.806745, 0.8313726, 0, 1, 1,
0.7836016, 1.073261, 0.08147839, 0.8352941, 0, 1, 1,
0.78597, 0.6130499, 0.9861758, 0.8431373, 0, 1, 1,
0.7887183, -1.20786, 2.142625, 0.8470588, 0, 1, 1,
0.7926807, 2.030792, 1.596019, 0.854902, 0, 1, 1,
0.7931406, -0.4579546, 1.580677, 0.8588235, 0, 1, 1,
0.7954194, 0.5739165, 1.238315, 0.8666667, 0, 1, 1,
0.7958482, -0.7375407, 4.351246, 0.8705882, 0, 1, 1,
0.7963558, -0.4521323, 2.452965, 0.8784314, 0, 1, 1,
0.7978751, 1.478191, 0.7778999, 0.8823529, 0, 1, 1,
0.7987037, 2.174359, -0.1293016, 0.8901961, 0, 1, 1,
0.7993273, 0.05682996, 0.8938496, 0.8941177, 0, 1, 1,
0.8006844, -1.378729, 2.129432, 0.9019608, 0, 1, 1,
0.8028573, -0.7554195, 3.258429, 0.9098039, 0, 1, 1,
0.8070949, 0.1957734, 1.923772, 0.9137255, 0, 1, 1,
0.8193623, 0.197382, 0.841467, 0.9215686, 0, 1, 1,
0.8243225, -0.7914796, 1.476198, 0.9254902, 0, 1, 1,
0.8255398, 0.6907842, 1.405034, 0.9333333, 0, 1, 1,
0.8274911, -1.703793, 3.160499, 0.9372549, 0, 1, 1,
0.8282446, 0.1703917, 0.9079333, 0.945098, 0, 1, 1,
0.8346292, 0.2878733, 1.315746, 0.9490196, 0, 1, 1,
0.8362933, 0.3940868, 0.9585335, 0.9568627, 0, 1, 1,
0.837683, 0.6046858, 0.5793414, 0.9607843, 0, 1, 1,
0.8394268, -0.5500629, 1.619818, 0.9686275, 0, 1, 1,
0.8396162, -0.08058599, 1.967199, 0.972549, 0, 1, 1,
0.8518929, -0.7553818, 1.935703, 0.9803922, 0, 1, 1,
0.8536168, -0.5188669, 1.337596, 0.9843137, 0, 1, 1,
0.8539535, 0.2116281, 1.078892, 0.9921569, 0, 1, 1,
0.855821, 0.7537712, 0.1596678, 0.9960784, 0, 1, 1,
0.8571194, 1.37204, 0.4971649, 1, 0, 0.9960784, 1,
0.8599592, -2.267941, 1.724124, 1, 0, 0.9882353, 1,
0.8710396, -1.690542, 1.086971, 1, 0, 0.9843137, 1,
0.8754145, -0.9045513, 1.237333, 1, 0, 0.9764706, 1,
0.8777308, 0.06933907, 0.9971073, 1, 0, 0.972549, 1,
0.8823785, 0.2945212, 2.917336, 1, 0, 0.9647059, 1,
0.8917138, 0.8737252, -0.2105853, 1, 0, 0.9607843, 1,
0.8942453, 0.08873747, 2.39579, 1, 0, 0.9529412, 1,
0.8985344, -0.1767596, 1.180493, 1, 0, 0.9490196, 1,
0.8986784, 1.34139, 0.2436543, 1, 0, 0.9411765, 1,
0.9037192, -1.03664, 2.142973, 1, 0, 0.9372549, 1,
0.9158535, -0.9428952, 2.963937, 1, 0, 0.9294118, 1,
0.9183177, -0.08213866, 2.439084, 1, 0, 0.9254902, 1,
0.9207146, -0.8031614, 3.103786, 1, 0, 0.9176471, 1,
0.9232879, 1.074303, 2.505018, 1, 0, 0.9137255, 1,
0.9301676, -1.240226, 3.252698, 1, 0, 0.9058824, 1,
0.9316507, 0.8197186, -0.09394484, 1, 0, 0.9019608, 1,
0.9556634, -0.7455428, 1.026333, 1, 0, 0.8941177, 1,
0.9578902, 2.865503, -0.791895, 1, 0, 0.8862745, 1,
0.963687, -0.7844843, 1.351332, 1, 0, 0.8823529, 1,
0.9638754, 0.8037534, 0.3657964, 1, 0, 0.8745098, 1,
0.9714696, 1.253755, 1.184754, 1, 0, 0.8705882, 1,
0.9734457, 0.4325842, 2.437581, 1, 0, 0.8627451, 1,
0.9743032, -0.933612, 2.078799, 1, 0, 0.8588235, 1,
0.9760729, 1.90734, -0.6961695, 1, 0, 0.8509804, 1,
0.9775853, -0.02827211, 1.18784, 1, 0, 0.8470588, 1,
0.9949191, 0.4934813, 0.1869267, 1, 0, 0.8392157, 1,
1.010113, -0.8427438, 2.531533, 1, 0, 0.8352941, 1,
1.011248, -0.2600777, 3.81521, 1, 0, 0.827451, 1,
1.013218, 0.6786234, 3.38363, 1, 0, 0.8235294, 1,
1.014723, 0.2528265, 0.907319, 1, 0, 0.8156863, 1,
1.024505, 0.2414943, 2.293061, 1, 0, 0.8117647, 1,
1.02557, 0.7472966, 1.234232, 1, 0, 0.8039216, 1,
1.029498, 0.9637425, 1.852152, 1, 0, 0.7960784, 1,
1.036856, -0.3486177, 0.9340476, 1, 0, 0.7921569, 1,
1.047327, 1.317783, -0.345681, 1, 0, 0.7843137, 1,
1.047732, -0.2513148, 1.336512, 1, 0, 0.7803922, 1,
1.066673, 1.472622, 1.29252, 1, 0, 0.772549, 1,
1.069682, -0.5638828, 1.896899, 1, 0, 0.7686275, 1,
1.071755, -0.2876261, 3.020344, 1, 0, 0.7607843, 1,
1.076565, 0.7233183, 0.519959, 1, 0, 0.7568628, 1,
1.086002, 0.6768831, -0.343241, 1, 0, 0.7490196, 1,
1.093643, -0.0685669, 1.738848, 1, 0, 0.7450981, 1,
1.100282, 2.198901, -0.2039579, 1, 0, 0.7372549, 1,
1.100602, -0.2250664, 0.2328505, 1, 0, 0.7333333, 1,
1.101097, -0.4952308, 2.711837, 1, 0, 0.7254902, 1,
1.102923, 0.9606022, 0.8206911, 1, 0, 0.7215686, 1,
1.117777, -0.8164889, 3.90254, 1, 0, 0.7137255, 1,
1.118171, 0.04476874, 2.066481, 1, 0, 0.7098039, 1,
1.121816, -0.2633301, 2.670614, 1, 0, 0.7019608, 1,
1.122169, -1.090346, 2.376114, 1, 0, 0.6941177, 1,
1.126417, -1.600129, 3.60219, 1, 0, 0.6901961, 1,
1.138482, 1.034195, -0.8137998, 1, 0, 0.682353, 1,
1.146888, 0.6978149, 1.050069, 1, 0, 0.6784314, 1,
1.151059, 0.9080386, 1.162381, 1, 0, 0.6705883, 1,
1.154418, -1.423888, 3.61474, 1, 0, 0.6666667, 1,
1.158768, 2.27634, 0.006582271, 1, 0, 0.6588235, 1,
1.164366, 0.08982669, 1.043974, 1, 0, 0.654902, 1,
1.165729, 1.095304, 1.472533, 1, 0, 0.6470588, 1,
1.168716, 0.376878, 1.823827, 1, 0, 0.6431373, 1,
1.174142, 0.4100639, 0.8548446, 1, 0, 0.6352941, 1,
1.17802, 1.297774, 0.4730517, 1, 0, 0.6313726, 1,
1.178651, 1.487045, 1.291848, 1, 0, 0.6235294, 1,
1.184182, -0.564257, 1.302193, 1, 0, 0.6196079, 1,
1.184549, -2.230369, 0.9175097, 1, 0, 0.6117647, 1,
1.186895, 0.4761318, 1.578796, 1, 0, 0.6078432, 1,
1.191869, 1.009124, 1.998138, 1, 0, 0.6, 1,
1.191909, 0.5212011, 2.958517, 1, 0, 0.5921569, 1,
1.200399, -0.4703063, 1.178681, 1, 0, 0.5882353, 1,
1.207656, 0.5495103, 1.30285, 1, 0, 0.5803922, 1,
1.221886, -0.2331294, 1.115587, 1, 0, 0.5764706, 1,
1.22342, -0.09305911, 0.7614479, 1, 0, 0.5686275, 1,
1.224265, -1.287538, 2.105585, 1, 0, 0.5647059, 1,
1.227092, -0.2238537, 2.207675, 1, 0, 0.5568628, 1,
1.229781, 0.4468099, 1.663217, 1, 0, 0.5529412, 1,
1.230329, -1.119139, 4.027395, 1, 0, 0.5450981, 1,
1.236046, -1.244419, 2.414797, 1, 0, 0.5411765, 1,
1.247512, -0.3603819, 1.197541, 1, 0, 0.5333334, 1,
1.254668, -0.4933487, 0.2126413, 1, 0, 0.5294118, 1,
1.256561, -0.3861524, 1.498914, 1, 0, 0.5215687, 1,
1.25829, 1.042151, 2.037916, 1, 0, 0.5176471, 1,
1.258691, -1.11466, 2.003984, 1, 0, 0.509804, 1,
1.2598, 0.1168144, 0.6658974, 1, 0, 0.5058824, 1,
1.279027, 0.4596611, 0.5863904, 1, 0, 0.4980392, 1,
1.302792, -0.147745, 2.533968, 1, 0, 0.4901961, 1,
1.307696, 0.1032711, 1.157861, 1, 0, 0.4862745, 1,
1.309744, -0.5854704, 2.331219, 1, 0, 0.4784314, 1,
1.310627, 0.2033103, 1.48301, 1, 0, 0.4745098, 1,
1.316702, 1.034612, 0.1707269, 1, 0, 0.4666667, 1,
1.3184, -0.7574221, 2.567171, 1, 0, 0.4627451, 1,
1.323286, -1.674005, 1.239376, 1, 0, 0.454902, 1,
1.32571, -0.4744167, -0.2318692, 1, 0, 0.4509804, 1,
1.332756, 1.27032, 1.209738, 1, 0, 0.4431373, 1,
1.351074, 0.01810021, -0.8820938, 1, 0, 0.4392157, 1,
1.368589, 0.6312521, 1.3739, 1, 0, 0.4313726, 1,
1.370939, 0.7495853, 2.833849, 1, 0, 0.427451, 1,
1.374445, 0.4398793, 4.248861, 1, 0, 0.4196078, 1,
1.379065, 0.1747965, -1.039002, 1, 0, 0.4156863, 1,
1.379315, 1.253322, 1.855367, 1, 0, 0.4078431, 1,
1.384195, -0.4373721, 1.114481, 1, 0, 0.4039216, 1,
1.384374, -0.1595276, 2.342842, 1, 0, 0.3960784, 1,
1.391158, 0.8297481, 1.488905, 1, 0, 0.3882353, 1,
1.396768, -0.1974024, 3.724606, 1, 0, 0.3843137, 1,
1.409755, -0.4508287, 1.833582, 1, 0, 0.3764706, 1,
1.415792, 0.2736033, 1.373074, 1, 0, 0.372549, 1,
1.421566, 1.553041, 0.6300139, 1, 0, 0.3647059, 1,
1.431307, -0.4776982, 3.198878, 1, 0, 0.3607843, 1,
1.444263, 0.428626, 1.0647, 1, 0, 0.3529412, 1,
1.45814, -0.4645575, 0.8070734, 1, 0, 0.3490196, 1,
1.47572, 0.127479, 1.957486, 1, 0, 0.3411765, 1,
1.48517, 0.428304, 0.7498159, 1, 0, 0.3372549, 1,
1.486877, -0.4431189, 2.233039, 1, 0, 0.3294118, 1,
1.489656, -1.774227, 2.405438, 1, 0, 0.3254902, 1,
1.500313, 0.1023443, 1.879838, 1, 0, 0.3176471, 1,
1.500905, -0.4046023, -0.4053306, 1, 0, 0.3137255, 1,
1.503706, -0.06486993, 2.381723, 1, 0, 0.3058824, 1,
1.520997, 0.8961175, 0.8633076, 1, 0, 0.2980392, 1,
1.531774, -1.20952, 1.93698, 1, 0, 0.2941177, 1,
1.532045, 1.44037, 0.8190116, 1, 0, 0.2862745, 1,
1.543031, 1.250906, -0.626762, 1, 0, 0.282353, 1,
1.54835, 1.561413, 0.8248217, 1, 0, 0.2745098, 1,
1.565514, -1.018877, 0.5693207, 1, 0, 0.2705882, 1,
1.579954, -0.08351853, 1.103247, 1, 0, 0.2627451, 1,
1.602551, -0.009399862, 0.2195042, 1, 0, 0.2588235, 1,
1.622205, -0.8868627, -0.04422695, 1, 0, 0.2509804, 1,
1.630315, 0.6525199, 1.175607, 1, 0, 0.2470588, 1,
1.637435, 0.7931612, -0.3341306, 1, 0, 0.2392157, 1,
1.647702, -0.6786572, 3.46133, 1, 0, 0.2352941, 1,
1.655821, 0.732103, 0.583967, 1, 0, 0.227451, 1,
1.65747, -0.4905831, 2.52876, 1, 0, 0.2235294, 1,
1.664021, 1.083267, 1.950811, 1, 0, 0.2156863, 1,
1.69534, 0.1726666, 2.147789, 1, 0, 0.2117647, 1,
1.698878, -0.06423707, -0.4977785, 1, 0, 0.2039216, 1,
1.712557, -0.6092219, 1.184843, 1, 0, 0.1960784, 1,
1.715527, -0.442641, 0.06214055, 1, 0, 0.1921569, 1,
1.728955, -0.02993316, 1.852329, 1, 0, 0.1843137, 1,
1.7496, 0.1828289, 0.5069337, 1, 0, 0.1803922, 1,
1.761315, -0.6374621, 1.130476, 1, 0, 0.172549, 1,
1.761806, 1.292962, 0.8321345, 1, 0, 0.1686275, 1,
1.785357, 0.3948016, 3.000371, 1, 0, 0.1607843, 1,
1.794357, -0.02109606, 1.281553, 1, 0, 0.1568628, 1,
1.841521, -0.9402698, 1.838109, 1, 0, 0.1490196, 1,
1.847641, -0.5510424, 3.242597, 1, 0, 0.145098, 1,
1.880583, -0.09432218, 2.417521, 1, 0, 0.1372549, 1,
1.885532, -1.797388, 1.517251, 1, 0, 0.1333333, 1,
1.88923, 0.1639719, 0.6506236, 1, 0, 0.1254902, 1,
1.900314, -0.6637115, 2.545572, 1, 0, 0.1215686, 1,
1.968396, -0.585413, 2.398747, 1, 0, 0.1137255, 1,
1.983273, 0.3481457, 0.8592386, 1, 0, 0.1098039, 1,
2.005551, 1.155957, 0.5490896, 1, 0, 0.1019608, 1,
2.023135, 0.8158341, 1.183526, 1, 0, 0.09411765, 1,
2.118823, -2.150676, 0.8993968, 1, 0, 0.09019608, 1,
2.12339, 0.6681173, 0.6138155, 1, 0, 0.08235294, 1,
2.205305, -0.554446, 3.075364, 1, 0, 0.07843138, 1,
2.212636, -0.1046021, 1.95978, 1, 0, 0.07058824, 1,
2.256534, -1.283167, 2.181001, 1, 0, 0.06666667, 1,
2.28461, -0.5787248, 1.964316, 1, 0, 0.05882353, 1,
2.295594, 0.3267996, 1.8764, 1, 0, 0.05490196, 1,
2.312125, 0.3581273, 1.280604, 1, 0, 0.04705882, 1,
2.524498, 0.6271574, 1.990673, 1, 0, 0.04313726, 1,
2.559858, -1.011832, 2.050667, 1, 0, 0.03529412, 1,
2.617327, 0.07248906, 0.7424312, 1, 0, 0.03137255, 1,
2.650484, -0.5010762, 0.5902448, 1, 0, 0.02352941, 1,
2.684442, 0.1396978, 0.7136264, 1, 0, 0.01960784, 1,
2.755156, -0.7814575, 1.980872, 1, 0, 0.01176471, 1,
2.824363, 0.8568143, -0.4866977, 1, 0, 0.007843138, 1
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
-0.202776, -4.027471, -7.674348, 0, -0.5, 0.5, 0.5,
-0.202776, -4.027471, -7.674348, 1, -0.5, 0.5, 0.5,
-0.202776, -4.027471, -7.674348, 1, 1.5, 0.5, 0.5,
-0.202776, -4.027471, -7.674348, 0, 1.5, 0.5, 0.5
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
-4.256115, 0.006457925, -7.674348, 0, -0.5, 0.5, 0.5,
-4.256115, 0.006457925, -7.674348, 1, -0.5, 0.5, 0.5,
-4.256115, 0.006457925, -7.674348, 1, 1.5, 0.5, 0.5,
-4.256115, 0.006457925, -7.674348, 0, 1.5, 0.5, 0.5
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
-4.256115, -4.027471, -0.6663623, 0, -0.5, 0.5, 0.5,
-4.256115, -4.027471, -0.6663623, 1, -0.5, 0.5, 0.5,
-4.256115, -4.027471, -0.6663623, 1, 1.5, 0.5, 0.5,
-4.256115, -4.027471, -0.6663623, 0, 1.5, 0.5, 0.5
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
-3, -3.096564, -6.057121,
2, -3.096564, -6.057121,
-3, -3.096564, -6.057121,
-3, -3.251715, -6.326659,
-2, -3.096564, -6.057121,
-2, -3.251715, -6.326659,
-1, -3.096564, -6.057121,
-1, -3.251715, -6.326659,
0, -3.096564, -6.057121,
0, -3.251715, -6.326659,
1, -3.096564, -6.057121,
1, -3.251715, -6.326659,
2, -3.096564, -6.057121,
2, -3.251715, -6.326659
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
-3, -3.562017, -6.865735, 0, -0.5, 0.5, 0.5,
-3, -3.562017, -6.865735, 1, -0.5, 0.5, 0.5,
-3, -3.562017, -6.865735, 1, 1.5, 0.5, 0.5,
-3, -3.562017, -6.865735, 0, 1.5, 0.5, 0.5,
-2, -3.562017, -6.865735, 0, -0.5, 0.5, 0.5,
-2, -3.562017, -6.865735, 1, -0.5, 0.5, 0.5,
-2, -3.562017, -6.865735, 1, 1.5, 0.5, 0.5,
-2, -3.562017, -6.865735, 0, 1.5, 0.5, 0.5,
-1, -3.562017, -6.865735, 0, -0.5, 0.5, 0.5,
-1, -3.562017, -6.865735, 1, -0.5, 0.5, 0.5,
-1, -3.562017, -6.865735, 1, 1.5, 0.5, 0.5,
-1, -3.562017, -6.865735, 0, 1.5, 0.5, 0.5,
0, -3.562017, -6.865735, 0, -0.5, 0.5, 0.5,
0, -3.562017, -6.865735, 1, -0.5, 0.5, 0.5,
0, -3.562017, -6.865735, 1, 1.5, 0.5, 0.5,
0, -3.562017, -6.865735, 0, 1.5, 0.5, 0.5,
1, -3.562017, -6.865735, 0, -0.5, 0.5, 0.5,
1, -3.562017, -6.865735, 1, -0.5, 0.5, 0.5,
1, -3.562017, -6.865735, 1, 1.5, 0.5, 0.5,
1, -3.562017, -6.865735, 0, 1.5, 0.5, 0.5,
2, -3.562017, -6.865735, 0, -0.5, 0.5, 0.5,
2, -3.562017, -6.865735, 1, -0.5, 0.5, 0.5,
2, -3.562017, -6.865735, 1, 1.5, 0.5, 0.5,
2, -3.562017, -6.865735, 0, 1.5, 0.5, 0.5
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
-3.320729, -3, -6.057121,
-3.320729, 3, -6.057121,
-3.320729, -3, -6.057121,
-3.476627, -3, -6.326659,
-3.320729, -2, -6.057121,
-3.476627, -2, -6.326659,
-3.320729, -1, -6.057121,
-3.476627, -1, -6.326659,
-3.320729, 0, -6.057121,
-3.476627, 0, -6.326659,
-3.320729, 1, -6.057121,
-3.476627, 1, -6.326659,
-3.320729, 2, -6.057121,
-3.476627, 2, -6.326659,
-3.320729, 3, -6.057121,
-3.476627, 3, -6.326659
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
-3.788422, -3, -6.865735, 0, -0.5, 0.5, 0.5,
-3.788422, -3, -6.865735, 1, -0.5, 0.5, 0.5,
-3.788422, -3, -6.865735, 1, 1.5, 0.5, 0.5,
-3.788422, -3, -6.865735, 0, 1.5, 0.5, 0.5,
-3.788422, -2, -6.865735, 0, -0.5, 0.5, 0.5,
-3.788422, -2, -6.865735, 1, -0.5, 0.5, 0.5,
-3.788422, -2, -6.865735, 1, 1.5, 0.5, 0.5,
-3.788422, -2, -6.865735, 0, 1.5, 0.5, 0.5,
-3.788422, -1, -6.865735, 0, -0.5, 0.5, 0.5,
-3.788422, -1, -6.865735, 1, -0.5, 0.5, 0.5,
-3.788422, -1, -6.865735, 1, 1.5, 0.5, 0.5,
-3.788422, -1, -6.865735, 0, 1.5, 0.5, 0.5,
-3.788422, 0, -6.865735, 0, -0.5, 0.5, 0.5,
-3.788422, 0, -6.865735, 1, -0.5, 0.5, 0.5,
-3.788422, 0, -6.865735, 1, 1.5, 0.5, 0.5,
-3.788422, 0, -6.865735, 0, 1.5, 0.5, 0.5,
-3.788422, 1, -6.865735, 0, -0.5, 0.5, 0.5,
-3.788422, 1, -6.865735, 1, -0.5, 0.5, 0.5,
-3.788422, 1, -6.865735, 1, 1.5, 0.5, 0.5,
-3.788422, 1, -6.865735, 0, 1.5, 0.5, 0.5,
-3.788422, 2, -6.865735, 0, -0.5, 0.5, 0.5,
-3.788422, 2, -6.865735, 1, -0.5, 0.5, 0.5,
-3.788422, 2, -6.865735, 1, 1.5, 0.5, 0.5,
-3.788422, 2, -6.865735, 0, 1.5, 0.5, 0.5,
-3.788422, 3, -6.865735, 0, -0.5, 0.5, 0.5,
-3.788422, 3, -6.865735, 1, -0.5, 0.5, 0.5,
-3.788422, 3, -6.865735, 1, 1.5, 0.5, 0.5,
-3.788422, 3, -6.865735, 0, 1.5, 0.5, 0.5
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
-3.320729, -3.096564, -4,
-3.320729, -3.096564, 4,
-3.320729, -3.096564, -4,
-3.476627, -3.251715, -4,
-3.320729, -3.096564, -2,
-3.476627, -3.251715, -2,
-3.320729, -3.096564, 0,
-3.476627, -3.251715, 0,
-3.320729, -3.096564, 2,
-3.476627, -3.251715, 2,
-3.320729, -3.096564, 4,
-3.476627, -3.251715, 4
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
-3.788422, -3.562017, -4, 0, -0.5, 0.5, 0.5,
-3.788422, -3.562017, -4, 1, -0.5, 0.5, 0.5,
-3.788422, -3.562017, -4, 1, 1.5, 0.5, 0.5,
-3.788422, -3.562017, -4, 0, 1.5, 0.5, 0.5,
-3.788422, -3.562017, -2, 0, -0.5, 0.5, 0.5,
-3.788422, -3.562017, -2, 1, -0.5, 0.5, 0.5,
-3.788422, -3.562017, -2, 1, 1.5, 0.5, 0.5,
-3.788422, -3.562017, -2, 0, 1.5, 0.5, 0.5,
-3.788422, -3.562017, 0, 0, -0.5, 0.5, 0.5,
-3.788422, -3.562017, 0, 1, -0.5, 0.5, 0.5,
-3.788422, -3.562017, 0, 1, 1.5, 0.5, 0.5,
-3.788422, -3.562017, 0, 0, 1.5, 0.5, 0.5,
-3.788422, -3.562017, 2, 0, -0.5, 0.5, 0.5,
-3.788422, -3.562017, 2, 1, -0.5, 0.5, 0.5,
-3.788422, -3.562017, 2, 1, 1.5, 0.5, 0.5,
-3.788422, -3.562017, 2, 0, 1.5, 0.5, 0.5,
-3.788422, -3.562017, 4, 0, -0.5, 0.5, 0.5,
-3.788422, -3.562017, 4, 1, -0.5, 0.5, 0.5,
-3.788422, -3.562017, 4, 1, 1.5, 0.5, 0.5,
-3.788422, -3.562017, 4, 0, 1.5, 0.5, 0.5
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
-3.320729, -3.096564, -6.057121,
-3.320729, 3.10948, -6.057121,
-3.320729, -3.096564, 4.724396,
-3.320729, 3.10948, 4.724396,
-3.320729, -3.096564, -6.057121,
-3.320729, -3.096564, 4.724396,
-3.320729, 3.10948, -6.057121,
-3.320729, 3.10948, 4.724396,
-3.320729, -3.096564, -6.057121,
2.915177, -3.096564, -6.057121,
-3.320729, -3.096564, 4.724396,
2.915177, -3.096564, 4.724396,
-3.320729, 3.10948, -6.057121,
2.915177, 3.10948, -6.057121,
-3.320729, 3.10948, 4.724396,
2.915177, 3.10948, 4.724396,
2.915177, -3.096564, -6.057121,
2.915177, 3.10948, -6.057121,
2.915177, -3.096564, 4.724396,
2.915177, 3.10948, 4.724396,
2.915177, -3.096564, -6.057121,
2.915177, -3.096564, 4.724396,
2.915177, 3.10948, -6.057121,
2.915177, 3.10948, 4.724396
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
var radius = 7.430635;
var distance = 33.05973;
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
mvMatrix.translate( 0.202776, -0.006457925, 0.6663623 );
mvMatrix.scale( 1.288369, 1.294568, 0.7451779 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.05973);
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
trinexapac-ethyl<-read.table("trinexapac-ethyl.xyz")
```

```
## Error in read.table("trinexapac-ethyl.xyz"): no lines available in input
```

```r
x<-trinexapac-ethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'trinexapac' not found
```

```r
y<-trinexapac-ethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'trinexapac' not found
```

```r
z<-trinexapac-ethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'trinexapac' not found
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
-3.229915, -1.06959, -1.25914, 0, 0, 1, 1, 1,
-2.734316, 1.196275, -1.823435, 1, 0, 0, 1, 1,
-2.683632, -0.6480402, -0.77079, 1, 0, 0, 1, 1,
-2.642982, -0.502093, -0.6386302, 1, 0, 0, 1, 1,
-2.533783, -1.882754, -2.340191, 1, 0, 0, 1, 1,
-2.491175, -0.3179487, -2.500638, 1, 0, 0, 1, 1,
-2.487298, 0.9749041, -1.180461, 0, 0, 0, 1, 1,
-2.477927, 0.8352553, -1.171312, 0, 0, 0, 1, 1,
-2.414495, 0.1846251, -1.9653, 0, 0, 0, 1, 1,
-2.386185, -0.2890849, -2.332462, 0, 0, 0, 1, 1,
-2.375289, -0.3886496, 0.8407221, 0, 0, 0, 1, 1,
-2.36589, 2.408377, -0.3832582, 0, 0, 0, 1, 1,
-2.329576, 0.826305, -2.688109, 0, 0, 0, 1, 1,
-2.329145, -0.1242869, -1.152518, 1, 1, 1, 1, 1,
-2.321669, -1.7155, -2.874864, 1, 1, 1, 1, 1,
-2.272389, 0.4518125, -1.293869, 1, 1, 1, 1, 1,
-2.251576, -0.8697739, -1.386344, 1, 1, 1, 1, 1,
-2.237994, 0.7879274, -1.686873, 1, 1, 1, 1, 1,
-2.183618, -1.345162, -1.494542, 1, 1, 1, 1, 1,
-2.171301, 1.414096, -1.394967, 1, 1, 1, 1, 1,
-2.152842, -0.3922787, -2.016963, 1, 1, 1, 1, 1,
-2.132397, -0.2194296, -0.8591028, 1, 1, 1, 1, 1,
-2.109058, 0.8204778, -1.059614, 1, 1, 1, 1, 1,
-2.083633, 1.336468, -2.088925, 1, 1, 1, 1, 1,
-2.071633, -0.9788498, -1.92877, 1, 1, 1, 1, 1,
-2.026023, 0.2436111, -2.453324, 1, 1, 1, 1, 1,
-2.023021, 1.583545, -2.082196, 1, 1, 1, 1, 1,
-1.995136, -0.6287059, -3.090472, 1, 1, 1, 1, 1,
-1.926513, 0.9347361, -1.831074, 0, 0, 1, 1, 1,
-1.920794, -2.190541, -1.669415, 1, 0, 0, 1, 1,
-1.911886, 0.006392571, -2.582705, 1, 0, 0, 1, 1,
-1.910632, 0.7321509, -0.5926635, 1, 0, 0, 1, 1,
-1.908223, -1.115819, -3.695588, 1, 0, 0, 1, 1,
-1.901404, 0.8645452, -1.809582, 1, 0, 0, 1, 1,
-1.878029, -0.4741509, -1.34898, 0, 0, 0, 1, 1,
-1.875831, -0.8399021, -2.003733, 0, 0, 0, 1, 1,
-1.872483, 0.4557239, -1.272987, 0, 0, 0, 1, 1,
-1.855827, -0.6636272, -2.18896, 0, 0, 0, 1, 1,
-1.795222, 0.2637659, -1.026451, 0, 0, 0, 1, 1,
-1.767274, 0.05207025, -0.2498156, 0, 0, 0, 1, 1,
-1.759541, -0.5569011, -3.690328, 0, 0, 0, 1, 1,
-1.745133, -1.048722, -1.510704, 1, 1, 1, 1, 1,
-1.744694, -0.3614129, -1.067798, 1, 1, 1, 1, 1,
-1.712551, 0.2190161, -2.663685, 1, 1, 1, 1, 1,
-1.702506, 0.0006414391, -2.029907, 1, 1, 1, 1, 1,
-1.688773, -1.130097, -0.8859071, 1, 1, 1, 1, 1,
-1.678512, -0.6711541, -1.188066, 1, 1, 1, 1, 1,
-1.675394, 0.3182976, -1.257427, 1, 1, 1, 1, 1,
-1.633494, 0.9099149, -0.3278238, 1, 1, 1, 1, 1,
-1.633384, -1.177737, -1.459006, 1, 1, 1, 1, 1,
-1.618761, 0.7769939, -1.52237, 1, 1, 1, 1, 1,
-1.616711, 1.749668, -0.9876547, 1, 1, 1, 1, 1,
-1.607442, -0.266315, -1.305294, 1, 1, 1, 1, 1,
-1.578838, -1.260088, -1.492908, 1, 1, 1, 1, 1,
-1.575566, 0.3270997, -3.496872, 1, 1, 1, 1, 1,
-1.549066, -0.3398219, -3.701241, 1, 1, 1, 1, 1,
-1.525868, 1.280191, -1.238213, 0, 0, 1, 1, 1,
-1.525676, 1.715524, 0.4195859, 1, 0, 0, 1, 1,
-1.516054, 0.1192172, -1.389531, 1, 0, 0, 1, 1,
-1.509138, 0.9620405, -2.435254, 1, 0, 0, 1, 1,
-1.489537, -1.166415, -1.822137, 1, 0, 0, 1, 1,
-1.480583, -1.602737, -0.9958931, 1, 0, 0, 1, 1,
-1.48044, -0.5310339, -2.858001, 0, 0, 0, 1, 1,
-1.477105, -2.161562, -2.553368, 0, 0, 0, 1, 1,
-1.474033, 0.2122008, -2.120717, 0, 0, 0, 1, 1,
-1.470735, -0.05335279, -1.17746, 0, 0, 0, 1, 1,
-1.467801, -0.2358329, -2.805448, 0, 0, 0, 1, 1,
-1.464882, -0.2698751, -0.8651837, 0, 0, 0, 1, 1,
-1.450699, -2.81588, -2.485286, 0, 0, 0, 1, 1,
-1.442795, 1.826104, -2.412918, 1, 1, 1, 1, 1,
-1.440558, 1.102999, -1.815594, 1, 1, 1, 1, 1,
-1.436576, 0.2889798, -2.507813, 1, 1, 1, 1, 1,
-1.434251, 0.4407832, -1.148104, 1, 1, 1, 1, 1,
-1.431162, -0.4514579, -2.957661, 1, 1, 1, 1, 1,
-1.430517, -0.6727262, -1.816745, 1, 1, 1, 1, 1,
-1.423852, -1.240339, -1.18774, 1, 1, 1, 1, 1,
-1.414124, -0.6638771, -4.532207, 1, 1, 1, 1, 1,
-1.406087, 1.119304, -0.4010567, 1, 1, 1, 1, 1,
-1.385322, -2.514848, -2.364998, 1, 1, 1, 1, 1,
-1.383998, -0.58733, -1.649022, 1, 1, 1, 1, 1,
-1.380963, -0.2607579, 0.4512428, 1, 1, 1, 1, 1,
-1.368967, 1.161589, -3.369884, 1, 1, 1, 1, 1,
-1.352767, 0.6381824, -1.934221, 1, 1, 1, 1, 1,
-1.335035, 2.388081, 0.3432824, 1, 1, 1, 1, 1,
-1.334062, 0.1970662, -2.596292, 0, 0, 1, 1, 1,
-1.324187, 0.33039, 0.08971418, 1, 0, 0, 1, 1,
-1.308405, -0.4629704, -1.456126, 1, 0, 0, 1, 1,
-1.302557, -0.530539, -2.038041, 1, 0, 0, 1, 1,
-1.291109, -0.07741628, -2.462923, 1, 0, 0, 1, 1,
-1.289392, 0.5264523, -0.3630248, 1, 0, 0, 1, 1,
-1.28686, 0.4175166, -1.736959, 0, 0, 0, 1, 1,
-1.27732, -0.3461613, -1.439122, 0, 0, 0, 1, 1,
-1.273475, -1.630406, -3.963977, 0, 0, 0, 1, 1,
-1.272261, -0.09234666, -1.434309, 0, 0, 0, 1, 1,
-1.270649, 0.2540275, -3.268889, 0, 0, 0, 1, 1,
-1.258747, 2.013016, -0.4255491, 0, 0, 0, 1, 1,
-1.258393, 0.3654488, -0.1385983, 0, 0, 0, 1, 1,
-1.252271, -0.2913805, -2.023571, 1, 1, 1, 1, 1,
-1.251404, -1.221142, -0.9436569, 1, 1, 1, 1, 1,
-1.248618, -2.066743, -1.48148, 1, 1, 1, 1, 1,
-1.246797, -1.052366, -2.488982, 1, 1, 1, 1, 1,
-1.224209, -0.6359082, -1.373288, 1, 1, 1, 1, 1,
-1.212294, 0.6898771, -1.759071, 1, 1, 1, 1, 1,
-1.211879, 0.5036134, -0.6047881, 1, 1, 1, 1, 1,
-1.21093, 0.3252357, -0.9550133, 1, 1, 1, 1, 1,
-1.210611, -0.8597428, -2.80962, 1, 1, 1, 1, 1,
-1.206242, -0.703642, -1.04397, 1, 1, 1, 1, 1,
-1.202226, -0.1502614, -1.34868, 1, 1, 1, 1, 1,
-1.200855, 0.4895834, -2.294376, 1, 1, 1, 1, 1,
-1.193426, 0.2854037, -2.459513, 1, 1, 1, 1, 1,
-1.191467, 0.6543938, -1.936212, 1, 1, 1, 1, 1,
-1.190807, -0.3872809, -2.770868, 1, 1, 1, 1, 1,
-1.170741, 0.7930245, -1.393079, 0, 0, 1, 1, 1,
-1.165287, 0.1357434, -1.648026, 1, 0, 0, 1, 1,
-1.158617, 0.7229564, 0.569421, 1, 0, 0, 1, 1,
-1.156751, 0.07050495, -2.191591, 1, 0, 0, 1, 1,
-1.156528, -2.676463, -2.329756, 1, 0, 0, 1, 1,
-1.153256, 1.375724, -0.7535628, 1, 0, 0, 1, 1,
-1.140791, -0.199623, -0.3706243, 0, 0, 0, 1, 1,
-1.139822, 0.7839068, -0.03467141, 0, 0, 0, 1, 1,
-1.135949, 1.024621, -0.3577439, 0, 0, 0, 1, 1,
-1.129721, 1.603304, -2.46397, 0, 0, 0, 1, 1,
-1.122033, 0.3568189, -3.233654, 0, 0, 0, 1, 1,
-1.117962, 1.352973, -1.992232, 0, 0, 0, 1, 1,
-1.116964, -0.6560429, -1.839381, 0, 0, 0, 1, 1,
-1.108121, 0.5557989, 0.3529194, 1, 1, 1, 1, 1,
-1.105754, 0.668501, -1.177087, 1, 1, 1, 1, 1,
-1.097935, -0.4549368, -2.618523, 1, 1, 1, 1, 1,
-1.097701, 0.2900232, -2.354341, 1, 1, 1, 1, 1,
-1.087835, 0.8830518, -0.4492349, 1, 1, 1, 1, 1,
-1.072224, 1.321763, -1.154476, 1, 1, 1, 1, 1,
-1.066682, -0.03177725, -0.8712813, 1, 1, 1, 1, 1,
-1.064562, -0.9269529, -3.077367, 1, 1, 1, 1, 1,
-1.059425, 0.6075929, -0.8239721, 1, 1, 1, 1, 1,
-1.050433, 1.215105, 0.2470819, 1, 1, 1, 1, 1,
-1.035221, -2.18039, -1.100671, 1, 1, 1, 1, 1,
-1.032187, 1.41298, 0.3097852, 1, 1, 1, 1, 1,
-1.026305, -0.9911177, -1.677384, 1, 1, 1, 1, 1,
-1.024143, -0.8734075, -0.6798446, 1, 1, 1, 1, 1,
-1.017454, -0.3057198, -2.492982, 1, 1, 1, 1, 1,
-1.016329, -0.1666231, -1.117117, 0, 0, 1, 1, 1,
-1.000662, -0.6674691, -2.483403, 1, 0, 0, 1, 1,
-0.9990718, 1.034516, -0.1889105, 1, 0, 0, 1, 1,
-0.9974723, -0.5446234, -0.5901725, 1, 0, 0, 1, 1,
-0.9957827, 0.5015281, -1.808938, 1, 0, 0, 1, 1,
-0.9846727, 0.04410954, -2.164064, 1, 0, 0, 1, 1,
-0.9842782, -0.8047206, -3.77493, 0, 0, 0, 1, 1,
-0.9796991, -0.7129239, -1.074204, 0, 0, 0, 1, 1,
-0.9778067, 0.1322138, -2.468051, 0, 0, 0, 1, 1,
-0.974591, -0.8035371, -2.373875, 0, 0, 0, 1, 1,
-0.9722295, 1.035535, 0.4646634, 0, 0, 0, 1, 1,
-0.9659657, -0.6530549, -1.491755, 0, 0, 0, 1, 1,
-0.9638876, 0.1922207, -2.938347, 0, 0, 0, 1, 1,
-0.9578804, 0.4127496, -1.249966, 1, 1, 1, 1, 1,
-0.9560288, -1.13886, -2.651239, 1, 1, 1, 1, 1,
-0.9512132, -0.7179227, -2.757113, 1, 1, 1, 1, 1,
-0.9477917, -1.23225, -2.300521, 1, 1, 1, 1, 1,
-0.9456473, 0.5587341, -0.03499397, 1, 1, 1, 1, 1,
-0.9419116, 0.1461829, -2.034954, 1, 1, 1, 1, 1,
-0.9368685, -0.1375813, -0.3383018, 1, 1, 1, 1, 1,
-0.9260894, 0.1293607, -0.2714469, 1, 1, 1, 1, 1,
-0.9256515, -0.1611157, -1.403335, 1, 1, 1, 1, 1,
-0.9169629, 2.037354, -0.8108361, 1, 1, 1, 1, 1,
-0.9165425, -0.8919423, -1.018582, 1, 1, 1, 1, 1,
-0.8969778, 0.0459682, -2.71594, 1, 1, 1, 1, 1,
-0.8947478, -0.6536415, -2.769478, 1, 1, 1, 1, 1,
-0.8942991, -0.6069575, -1.108838, 1, 1, 1, 1, 1,
-0.8941913, -0.2314336, -0.07588565, 1, 1, 1, 1, 1,
-0.8809667, 0.04865595, -1.714466, 0, 0, 1, 1, 1,
-0.8789149, -0.6950027, -2.487731, 1, 0, 0, 1, 1,
-0.8780311, 0.4275223, -0.561837, 1, 0, 0, 1, 1,
-0.8777783, -0.3147218, -3.047267, 1, 0, 0, 1, 1,
-0.8761008, 1.526553, -1.939302, 1, 0, 0, 1, 1,
-0.8632979, -1.387787, -1.914687, 1, 0, 0, 1, 1,
-0.8602365, -0.5364116, -0.8481315, 0, 0, 0, 1, 1,
-0.8591775, 0.7375664, -1.532766, 0, 0, 0, 1, 1,
-0.8575833, -2.055919, -2.192077, 0, 0, 0, 1, 1,
-0.8542362, -2.35479, -2.551316, 0, 0, 0, 1, 1,
-0.8520865, -0.8834084, -3.816069, 0, 0, 0, 1, 1,
-0.8474529, -0.08922803, -0.5038758, 0, 0, 0, 1, 1,
-0.8438441, -0.802262, -2.09348, 0, 0, 0, 1, 1,
-0.8409288, -0.3329965, -1.69744, 1, 1, 1, 1, 1,
-0.8385752, 0.1043918, -0.9910397, 1, 1, 1, 1, 1,
-0.8382404, 0.09288449, -2.664258, 1, 1, 1, 1, 1,
-0.8333591, -1.718153, -2.794951, 1, 1, 1, 1, 1,
-0.8305777, 1.334231, 0.4061258, 1, 1, 1, 1, 1,
-0.8281369, 2.25258, 0.01805469, 1, 1, 1, 1, 1,
-0.8274672, -0.8588043, -3.427199, 1, 1, 1, 1, 1,
-0.8273565, -0.2589941, -2.054167, 1, 1, 1, 1, 1,
-0.82226, 0.07449921, -1.116673, 1, 1, 1, 1, 1,
-0.8220407, 1.244872, 0.6099399, 1, 1, 1, 1, 1,
-0.8178844, -0.9396412, -1.237377, 1, 1, 1, 1, 1,
-0.8169382, -1.457898, -2.816597, 1, 1, 1, 1, 1,
-0.8090178, -0.2917753, -2.007525, 1, 1, 1, 1, 1,
-0.8014606, 0.05092071, -1.973022, 1, 1, 1, 1, 1,
-0.7993506, 0.3205439, -1.890934, 1, 1, 1, 1, 1,
-0.7992646, -0.9134223, -1.007663, 0, 0, 1, 1, 1,
-0.7930914, -0.6894755, -3.166343, 1, 0, 0, 1, 1,
-0.7922845, 0.00888856, -1.827836, 1, 0, 0, 1, 1,
-0.792049, 1.052115, -0.1527667, 1, 0, 0, 1, 1,
-0.7911948, 0.395262, -2.083872, 1, 0, 0, 1, 1,
-0.7901436, 0.04423263, -1.819348, 1, 0, 0, 1, 1,
-0.7847554, -0.841318, -2.330617, 0, 0, 0, 1, 1,
-0.7794292, 0.503125, -2.847925, 0, 0, 0, 1, 1,
-0.7773277, -0.5640101, -2.235431, 0, 0, 0, 1, 1,
-0.7737384, 0.4021679, -1.485906, 0, 0, 0, 1, 1,
-0.7688112, 0.7437142, 0.5990543, 0, 0, 0, 1, 1,
-0.767582, -0.02658189, -0.9200936, 0, 0, 0, 1, 1,
-0.7643045, -1.210765, -1.935733, 0, 0, 0, 1, 1,
-0.7625301, -0.6932831, -2.482289, 1, 1, 1, 1, 1,
-0.7552198, 1.286081, -1.079504, 1, 1, 1, 1, 1,
-0.7548441, -0.1085582, 0.6487514, 1, 1, 1, 1, 1,
-0.7477168, -0.5340556, -0.3193852, 1, 1, 1, 1, 1,
-0.7413838, 0.7696089, -0.4926677, 1, 1, 1, 1, 1,
-0.7396743, -0.1759945, -2.254842, 1, 1, 1, 1, 1,
-0.7378079, -0.7498071, -0.5388471, 1, 1, 1, 1, 1,
-0.7340547, 0.2754725, 0.281313, 1, 1, 1, 1, 1,
-0.7321179, 0.2957015, -1.345373, 1, 1, 1, 1, 1,
-0.7289649, 0.8945847, 0.8065501, 1, 1, 1, 1, 1,
-0.7281026, -0.1858881, -1.646079, 1, 1, 1, 1, 1,
-0.7259701, -2.334471, -2.861827, 1, 1, 1, 1, 1,
-0.7223433, 0.2421568, -1.239108, 1, 1, 1, 1, 1,
-0.7197821, -0.07134736, -0.6701594, 1, 1, 1, 1, 1,
-0.7190278, 0.748211, -2.018357, 1, 1, 1, 1, 1,
-0.7184877, -1.116741, -3.355409, 0, 0, 1, 1, 1,
-0.7179883, -0.5624648, -2.079221, 1, 0, 0, 1, 1,
-0.7179185, -0.02099751, -1.427192, 1, 0, 0, 1, 1,
-0.7172812, 0.832791, -1.702127, 1, 0, 0, 1, 1,
-0.7156513, 0.4562235, -1.941053, 1, 0, 0, 1, 1,
-0.7155876, -0.2190887, 0.05095489, 1, 0, 0, 1, 1,
-0.7142015, 0.3667301, 0.7194271, 0, 0, 0, 1, 1,
-0.7041191, 1.636509, 0.6919717, 0, 0, 0, 1, 1,
-0.702469, -0.3432335, -0.7759963, 0, 0, 0, 1, 1,
-0.6977557, 1.216414, -0.5167189, 0, 0, 0, 1, 1,
-0.6923942, 0.1219393, -2.500286, 0, 0, 0, 1, 1,
-0.6912052, 1.649779, -1.717746, 0, 0, 0, 1, 1,
-0.6880913, 0.4501834, -0.3226124, 0, 0, 0, 1, 1,
-0.6809717, 0.2269897, -2.945223, 1, 1, 1, 1, 1,
-0.6785067, 2.102991, 0.330044, 1, 1, 1, 1, 1,
-0.6782393, 2.077419, -2.603462, 1, 1, 1, 1, 1,
-0.6756931, -1.326123, -1.028723, 1, 1, 1, 1, 1,
-0.6729856, 0.5983749, 0.3003489, 1, 1, 1, 1, 1,
-0.6687, -0.6291003, -2.135709, 1, 1, 1, 1, 1,
-0.6679704, -1.007918, -2.572722, 1, 1, 1, 1, 1,
-0.6659445, 2.761104, 1.138406, 1, 1, 1, 1, 1,
-0.6582085, -1.112217, -1.863273, 1, 1, 1, 1, 1,
-0.6548822, 1.296852, 0.004852618, 1, 1, 1, 1, 1,
-0.6493481, 0.8576565, -0.9536094, 1, 1, 1, 1, 1,
-0.6478615, -1.467752, -2.181756, 1, 1, 1, 1, 1,
-0.6477172, -0.3037837, -2.012114, 1, 1, 1, 1, 1,
-0.6410207, -0.915592, -3.575737, 1, 1, 1, 1, 1,
-0.6353258, -0.7426112, -3.460141, 1, 1, 1, 1, 1,
-0.633756, 0.5901025, -2.233366, 0, 0, 1, 1, 1,
-0.6325839, -0.2422934, -2.151432, 1, 0, 0, 1, 1,
-0.6310349, -0.5451601, -2.244568, 1, 0, 0, 1, 1,
-0.6285061, -1.385291, -2.004928, 1, 0, 0, 1, 1,
-0.6279885, -0.8919988, -2.895529, 1, 0, 0, 1, 1,
-0.6264886, -1.754418, -2.330785, 1, 0, 0, 1, 1,
-0.6255516, 1.178787, -1.249036, 0, 0, 0, 1, 1,
-0.6250826, -0.6239858, -1.846003, 0, 0, 0, 1, 1,
-0.6235816, 0.3721161, -1.033912, 0, 0, 0, 1, 1,
-0.6231127, -0.3181396, -3.252206, 0, 0, 0, 1, 1,
-0.6173491, 0.2146264, -2.971257, 0, 0, 0, 1, 1,
-0.616126, -0.1425841, -0.4699056, 0, 0, 0, 1, 1,
-0.6150685, 0.5872325, -0.4796068, 0, 0, 0, 1, 1,
-0.6036586, 0.4547364, 0.1176146, 1, 1, 1, 1, 1,
-0.5988502, -0.2899241, -1.249624, 1, 1, 1, 1, 1,
-0.5945812, 2.865321, -0.3091539, 1, 1, 1, 1, 1,
-0.5896417, -0.2582497, -3.183261, 1, 1, 1, 1, 1,
-0.5863559, -0.09466024, -3.931252, 1, 1, 1, 1, 1,
-0.577229, 1.052109, -0.1004218, 1, 1, 1, 1, 1,
-0.5750765, -0.01396894, -2.64363, 1, 1, 1, 1, 1,
-0.5747199, 1.133932, 0.7105184, 1, 1, 1, 1, 1,
-0.5739279, -0.2138001, -4.080379, 1, 1, 1, 1, 1,
-0.5717886, -0.6094592, -1.705384, 1, 1, 1, 1, 1,
-0.5714967, -0.2379064, -2.412622, 1, 1, 1, 1, 1,
-0.5714462, -1.297772, -3.16655, 1, 1, 1, 1, 1,
-0.5710663, -0.330908, -2.008042, 1, 1, 1, 1, 1,
-0.5701354, 0.1170558, -1.311379, 1, 1, 1, 1, 1,
-0.5670484, -0.01812478, -1.354327, 1, 1, 1, 1, 1,
-0.5668108, -0.5842645, -2.702944, 0, 0, 1, 1, 1,
-0.561311, -0.5264406, -3.843908, 1, 0, 0, 1, 1,
-0.558278, -1.532948, -2.207422, 1, 0, 0, 1, 1,
-0.5575423, 1.410521, -0.7871304, 1, 0, 0, 1, 1,
-0.5486636, -1.162916, -3.779516, 1, 0, 0, 1, 1,
-0.5461996, 0.5522209, -0.1322521, 1, 0, 0, 1, 1,
-0.5422227, 1.528618, 0.5598765, 0, 0, 0, 1, 1,
-0.5412579, 1.216216, -1.380572, 0, 0, 0, 1, 1,
-0.5402501, -1.022679, -3.415575, 0, 0, 0, 1, 1,
-0.5373513, 0.6551024, 0.7727013, 0, 0, 0, 1, 1,
-0.5357748, 0.8344545, 0.2762128, 0, 0, 0, 1, 1,
-0.5319258, 1.219087, -1.294911, 0, 0, 0, 1, 1,
-0.5222207, -1.107576, -2.846862, 0, 0, 0, 1, 1,
-0.5200878, -0.5012931, -1.984633, 1, 1, 1, 1, 1,
-0.5125202, 0.9949753, -1.259632, 1, 1, 1, 1, 1,
-0.5109051, 0.9632853, 0.3069752, 1, 1, 1, 1, 1,
-0.5095061, -0.1739253, -3.299325, 1, 1, 1, 1, 1,
-0.507471, 0.722428, -2.859657, 1, 1, 1, 1, 1,
-0.5020345, -0.2177909, -3.457522, 1, 1, 1, 1, 1,
-0.4996783, -0.017789, -2.351918, 1, 1, 1, 1, 1,
-0.4963129, -0.18623, -3.944479, 1, 1, 1, 1, 1,
-0.494944, -2.112497, -3.78108, 1, 1, 1, 1, 1,
-0.4945385, 0.3327791, 0.8859143, 1, 1, 1, 1, 1,
-0.4924432, -0.6171367, -2.590142, 1, 1, 1, 1, 1,
-0.4828036, -1.079985, -2.570848, 1, 1, 1, 1, 1,
-0.4815722, -0.5903271, -1.809155, 1, 1, 1, 1, 1,
-0.481097, 0.7777888, -0.6992115, 1, 1, 1, 1, 1,
-0.480134, 0.1766381, -1.22148, 1, 1, 1, 1, 1,
-0.4798971, -1.270939, -4.21032, 0, 0, 1, 1, 1,
-0.4798084, -2.392277, -2.785514, 1, 0, 0, 1, 1,
-0.4796555, -1.030206, -3.265701, 1, 0, 0, 1, 1,
-0.4768028, -0.1292672, -0.6501038, 1, 0, 0, 1, 1,
-0.4745501, -0.07642553, -1.256648, 1, 0, 0, 1, 1,
-0.4739949, 0.7838417, 0.5871689, 1, 0, 0, 1, 1,
-0.4674325, -0.2540864, -2.205216, 0, 0, 0, 1, 1,
-0.4657446, 0.498715, -0.3011312, 0, 0, 0, 1, 1,
-0.464448, -0.2269248, -3.339432, 0, 0, 0, 1, 1,
-0.462285, -0.8482862, -3.119757, 0, 0, 0, 1, 1,
-0.4615386, -0.7331825, -3.755427, 0, 0, 0, 1, 1,
-0.4612048, -0.5796586, -2.169614, 0, 0, 0, 1, 1,
-0.4607888, 0.9149463, -0.7018774, 0, 0, 0, 1, 1,
-0.4606964, 0.9377005, 0.9459568, 1, 1, 1, 1, 1,
-0.4591512, -0.1548081, -4.007793, 1, 1, 1, 1, 1,
-0.4588438, 0.141002, -0.2220777, 1, 1, 1, 1, 1,
-0.4573237, -0.08643464, -2.563654, 1, 1, 1, 1, 1,
-0.4570147, 1.433414, -2.220155, 1, 1, 1, 1, 1,
-0.4503781, -0.9537072, -1.539442, 1, 1, 1, 1, 1,
-0.4492141, 0.5450219, 0.4579311, 1, 1, 1, 1, 1,
-0.4470531, 0.1798079, -1.221329, 1, 1, 1, 1, 1,
-0.4453287, 0.4513128, 1.261583, 1, 1, 1, 1, 1,
-0.4434037, -0.9683542, -3.4885, 1, 1, 1, 1, 1,
-0.4431768, -1.537974, -3.927103, 1, 1, 1, 1, 1,
-0.4383745, 0.3703664, -1.537773, 1, 1, 1, 1, 1,
-0.4314961, -0.4879047, -2.088898, 1, 1, 1, 1, 1,
-0.4189148, 0.523035, -0.2512263, 1, 1, 1, 1, 1,
-0.4176334, -0.9223506, -4.297948, 1, 1, 1, 1, 1,
-0.4164602, 0.9843856, -0.7444535, 0, 0, 1, 1, 1,
-0.4161506, -2.648657, -4.475047, 1, 0, 0, 1, 1,
-0.4154846, -1.14405, -1.562356, 1, 0, 0, 1, 1,
-0.4109381, 0.6679426, -1.254515, 1, 0, 0, 1, 1,
-0.4083443, -0.3947757, -1.261333, 1, 0, 0, 1, 1,
-0.4059979, -0.9584866, -2.73211, 1, 0, 0, 1, 1,
-0.3978051, -0.7501273, -2.991924, 0, 0, 0, 1, 1,
-0.3922268, -1.136241, -3.33433, 0, 0, 0, 1, 1,
-0.3912045, -0.3801586, -4.43676, 0, 0, 0, 1, 1,
-0.3858958, -1.207268, -2.991938, 0, 0, 0, 1, 1,
-0.3854082, 0.7137468, 0.02019692, 0, 0, 0, 1, 1,
-0.3840014, -0.5118431, -5.238564, 0, 0, 0, 1, 1,
-0.3837035, -0.0585782, -2.156746, 0, 0, 0, 1, 1,
-0.3832995, -0.162438, -2.573112, 1, 1, 1, 1, 1,
-0.3807804, 0.3286121, -1.750944, 1, 1, 1, 1, 1,
-0.3773696, -0.5579344, -1.673928, 1, 1, 1, 1, 1,
-0.3758677, -0.05227053, -1.386503, 1, 1, 1, 1, 1,
-0.3752469, -0.1396264, -2.786199, 1, 1, 1, 1, 1,
-0.3748181, -1.173767, -4.343421, 1, 1, 1, 1, 1,
-0.3743606, 0.8615811, -0.3784665, 1, 1, 1, 1, 1,
-0.3741318, 0.5166773, -1.175985, 1, 1, 1, 1, 1,
-0.3732346, 0.19102, -3.667749, 1, 1, 1, 1, 1,
-0.3584825, -0.8626701, -0.4109444, 1, 1, 1, 1, 1,
-0.3553074, -0.05340826, -1.271851, 1, 1, 1, 1, 1,
-0.3532407, -0.12246, -1.333487, 1, 1, 1, 1, 1,
-0.3522765, 0.4373098, -1.062688, 1, 1, 1, 1, 1,
-0.3494644, 1.219819, -0.7014605, 1, 1, 1, 1, 1,
-0.3445683, 0.4099119, 0.256524, 1, 1, 1, 1, 1,
-0.3441215, 0.004321166, -2.355915, 0, 0, 1, 1, 1,
-0.3435414, 0.1966759, -1.190868, 1, 0, 0, 1, 1,
-0.3377858, 0.5179793, 0.02771352, 1, 0, 0, 1, 1,
-0.3369483, 0.4817695, 0.9316163, 1, 0, 0, 1, 1,
-0.3355091, -0.06605572, -3.053164, 1, 0, 0, 1, 1,
-0.3283988, 1.607307, -1.268205, 1, 0, 0, 1, 1,
-0.324656, -0.957586, -3.165746, 0, 0, 0, 1, 1,
-0.3235458, -1.49382, -1.716144, 0, 0, 0, 1, 1,
-0.3194212, 0.3984173, -1.944748, 0, 0, 0, 1, 1,
-0.3172355, 1.04717, -1.931034, 0, 0, 0, 1, 1,
-0.3132609, -0.4094106, -3.138246, 0, 0, 0, 1, 1,
-0.3060493, 0.8913559, 0.9179389, 0, 0, 0, 1, 1,
-0.2988286, 0.5124779, 0.4605402, 0, 0, 0, 1, 1,
-0.2898899, 0.5856665, 1.360943, 1, 1, 1, 1, 1,
-0.2894922, 0.233837, 0.08359907, 1, 1, 1, 1, 1,
-0.2833075, -0.3213297, -3.628195, 1, 1, 1, 1, 1,
-0.2816021, -0.5020123, -4.409797, 1, 1, 1, 1, 1,
-0.2815328, -2.930023, -3.461841, 1, 1, 1, 1, 1,
-0.2791429, 1.099576, -0.9543336, 1, 1, 1, 1, 1,
-0.2782244, -0.1641861, -1.556232, 1, 1, 1, 1, 1,
-0.2777944, -0.3166722, -2.38225, 1, 1, 1, 1, 1,
-0.2764733, 0.3551129, -1.584038, 1, 1, 1, 1, 1,
-0.2756748, 1.177237, -0.5870908, 1, 1, 1, 1, 1,
-0.2714189, 1.043372, 1.504488, 1, 1, 1, 1, 1,
-0.2701764, 1.60297, 0.6097376, 1, 1, 1, 1, 1,
-0.2651809, -0.7651882, -2.496571, 1, 1, 1, 1, 1,
-0.2595195, 0.9687731, 0.1355475, 1, 1, 1, 1, 1,
-0.2590923, 0.5639422, 1.488207, 1, 1, 1, 1, 1,
-0.258525, -0.155138, -3.004632, 0, 0, 1, 1, 1,
-0.2534156, 0.7129446, 0.6427986, 1, 0, 0, 1, 1,
-0.2503488, -1.099355, -2.612511, 1, 0, 0, 1, 1,
-0.2460933, -1.169489, -2.073508, 1, 0, 0, 1, 1,
-0.2455263, 0.9735835, -0.03603959, 1, 0, 0, 1, 1,
-0.242642, 0.1875946, -2.481571, 1, 0, 0, 1, 1,
-0.2412403, -0.5468689, -2.197237, 0, 0, 0, 1, 1,
-0.2385853, -1.188396, -3.994213, 0, 0, 0, 1, 1,
-0.2363295, -0.3960781, -3.692657, 0, 0, 0, 1, 1,
-0.2334229, 0.2755045, 1.41062, 0, 0, 0, 1, 1,
-0.2329929, -0.1537635, -1.004445, 0, 0, 0, 1, 1,
-0.2325955, 1.231087, 0.7969072, 0, 0, 0, 1, 1,
-0.2290509, -1.228201, -4.487403, 0, 0, 0, 1, 1,
-0.225686, -0.6319596, -3.346363, 1, 1, 1, 1, 1,
-0.2249932, -0.8458304, -4.325395, 1, 1, 1, 1, 1,
-0.2234713, 0.1967674, -0.369195, 1, 1, 1, 1, 1,
-0.2199724, 1.034439, -0.7404786, 1, 1, 1, 1, 1,
-0.2189163, 0.3331721, -2.805067, 1, 1, 1, 1, 1,
-0.2187746, 0.08894603, -1.488867, 1, 1, 1, 1, 1,
-0.2143347, -0.8524195, -3.8547, 1, 1, 1, 1, 1,
-0.2120226, 1.301175, 1.270387, 1, 1, 1, 1, 1,
-0.2103439, -1.215269, -3.860627, 1, 1, 1, 1, 1,
-0.2080391, -0.1109073, -1.372948, 1, 1, 1, 1, 1,
-0.2046858, 0.09700707, -3.756124, 1, 1, 1, 1, 1,
-0.2045415, -0.2181947, -1.336245, 1, 1, 1, 1, 1,
-0.201895, -0.6849226, -2.906777, 1, 1, 1, 1, 1,
-0.2005561, 0.738181, 0.6166154, 1, 1, 1, 1, 1,
-0.1986157, 0.7437642, -1.058422, 1, 1, 1, 1, 1,
-0.1982914, -1.696949, -2.857733, 0, 0, 1, 1, 1,
-0.1960479, 0.6872823, -2.126575, 1, 0, 0, 1, 1,
-0.1835367, -0.7869576, -0.9327081, 1, 0, 0, 1, 1,
-0.1829132, -0.6563108, -3.502862, 1, 0, 0, 1, 1,
-0.1798172, 1.602308, 0.4747029, 1, 0, 0, 1, 1,
-0.1710415, -0.05067124, -1.200016, 1, 0, 0, 1, 1,
-0.1703428, 2.136359, -0.2871265, 0, 0, 0, 1, 1,
-0.1700784, 1.473707, 0.1539791, 0, 0, 0, 1, 1,
-0.164969, -0.007510516, -1.046742, 0, 0, 0, 1, 1,
-0.1639961, -0.5205123, -0.4036244, 0, 0, 0, 1, 1,
-0.1631438, -1.190446, -2.228697, 0, 0, 0, 1, 1,
-0.1608502, 0.5461694, -1.179631, 0, 0, 0, 1, 1,
-0.1602226, -1.585117, -2.585785, 0, 0, 0, 1, 1,
-0.157803, -2.975835, -2.956513, 1, 1, 1, 1, 1,
-0.1557659, -0.1365845, -1.811262, 1, 1, 1, 1, 1,
-0.1533685, -0.9890981, -2.881499, 1, 1, 1, 1, 1,
-0.1513497, -0.4997959, -2.710078, 1, 1, 1, 1, 1,
-0.147698, -1.08274, -3.098565, 1, 1, 1, 1, 1,
-0.1433122, 1.007956, 0.07339487, 1, 1, 1, 1, 1,
-0.1410571, -2.903483, -2.545776, 1, 1, 1, 1, 1,
-0.1396984, -1.111033, -2.912907, 1, 1, 1, 1, 1,
-0.1372269, -0.3215697, -2.190895, 1, 1, 1, 1, 1,
-0.1331284, -0.5756891, -2.391519, 1, 1, 1, 1, 1,
-0.1289274, 0.2229488, 0.433275, 1, 1, 1, 1, 1,
-0.1283647, -1.519396, -4.367082, 1, 1, 1, 1, 1,
-0.1274649, 1.027798, -2.004241, 1, 1, 1, 1, 1,
-0.1233783, -1.330196, -2.676238, 1, 1, 1, 1, 1,
-0.1186978, -3.006185, -2.017829, 1, 1, 1, 1, 1,
-0.1151792, 1.123645, -2.11973, 0, 0, 1, 1, 1,
-0.1148881, -0.4487253, -1.988783, 1, 0, 0, 1, 1,
-0.1098544, 2.101593, 0.8837042, 1, 0, 0, 1, 1,
-0.109116, 0.7606497, -0.3233753, 1, 0, 0, 1, 1,
-0.101144, 1.248488, -0.9078124, 1, 0, 0, 1, 1,
-0.09584552, -1.630629, -3.695613, 1, 0, 0, 1, 1,
-0.09249518, -1.933227, -2.116083, 0, 0, 0, 1, 1,
-0.08841894, 1.632226, -0.4651606, 0, 0, 0, 1, 1,
-0.08833605, 0.178931, -0.7889458, 0, 0, 0, 1, 1,
-0.08752853, 1.761079, 0.534918, 0, 0, 0, 1, 1,
-0.08718394, 0.2033107, -0.3735543, 0, 0, 0, 1, 1,
-0.08424271, -0.389785, -3.192435, 0, 0, 0, 1, 1,
-0.08336605, -0.4183581, -2.842732, 0, 0, 0, 1, 1,
-0.08291135, -2.090183, -1.371614, 1, 1, 1, 1, 1,
-0.07539798, -0.3933828, -3.736054, 1, 1, 1, 1, 1,
-0.07425997, -0.06447346, -3.038872, 1, 1, 1, 1, 1,
-0.06982754, 0.1108524, -0.05972811, 1, 1, 1, 1, 1,
-0.06967341, 0.6203097, 0.5682695, 1, 1, 1, 1, 1,
-0.06849988, -0.09468073, -3.718178, 1, 1, 1, 1, 1,
-0.06794788, -0.1872388, -2.661055, 1, 1, 1, 1, 1,
-0.06500243, 0.9627812, 0.7024812, 1, 1, 1, 1, 1,
-0.06484435, 0.2880753, -0.7842101, 1, 1, 1, 1, 1,
-0.06151648, 0.1427232, -1.783121, 1, 1, 1, 1, 1,
-0.05893473, -1.023234, -2.970389, 1, 1, 1, 1, 1,
-0.05837261, 0.09052249, -1.119286, 1, 1, 1, 1, 1,
-0.05771461, -0.9319582, -5.900108, 1, 1, 1, 1, 1,
-0.05336061, 0.01831296, -2.16388, 1, 1, 1, 1, 1,
-0.04862711, -0.3261029, -4.417205, 1, 1, 1, 1, 1,
-0.04737208, 0.1436147, -1.328563, 0, 0, 1, 1, 1,
-0.04119616, 0.02767614, -2.127081, 1, 0, 0, 1, 1,
-0.03995651, 0.08298136, -0.5509873, 1, 0, 0, 1, 1,
-0.03944546, -1.122911, -3.510772, 1, 0, 0, 1, 1,
-0.03774027, 2.073458, 1.980821, 1, 0, 0, 1, 1,
-0.03647519, -0.602093, -3.157494, 1, 0, 0, 1, 1,
-0.03643905, -1.225756, -2.756985, 0, 0, 0, 1, 1,
-0.03379182, 0.5988075, 1.119005, 0, 0, 0, 1, 1,
-0.03301894, 0.3204723, 1.730364, 0, 0, 0, 1, 1,
-0.02953294, 0.7034695, 0.5555574, 0, 0, 0, 1, 1,
-0.0275415, 0.2886162, -0.1733957, 0, 0, 0, 1, 1,
-0.02602138, -1.077537, -1.844838, 0, 0, 0, 1, 1,
-0.02529331, 1.173841, 0.236997, 0, 0, 0, 1, 1,
-0.02373804, -0.7485691, -3.212512, 1, 1, 1, 1, 1,
-0.02354917, -0.8266373, -0.8150675, 1, 1, 1, 1, 1,
-0.01905942, -0.9114577, -3.391194, 1, 1, 1, 1, 1,
-0.01868698, 0.392588, 1.322525, 1, 1, 1, 1, 1,
-0.01743712, 1.24272, -0.8855764, 1, 1, 1, 1, 1,
-0.01681129, -0.8066342, -3.182067, 1, 1, 1, 1, 1,
-0.0166203, 0.273745, 1.001159, 1, 1, 1, 1, 1,
-0.01444133, -0.2294317, -2.872199, 1, 1, 1, 1, 1,
-0.004755939, 0.4904498, -0.1570834, 1, 1, 1, 1, 1,
-0.003104014, -0.335134, -2.902254, 1, 1, 1, 1, 1,
-0.0002767874, 1.07569, -0.6757385, 1, 1, 1, 1, 1,
0.001197588, 0.2965462, 0.04168094, 1, 1, 1, 1, 1,
0.00296132, -1.594867, 4.270144, 1, 1, 1, 1, 1,
0.004468691, -0.5964264, 4.41882, 1, 1, 1, 1, 1,
0.006264044, 1.481368, -0.8631853, 1, 1, 1, 1, 1,
0.01002895, 1.147774, -0.7760643, 0, 0, 1, 1, 1,
0.01010213, -0.157215, 1.640793, 1, 0, 0, 1, 1,
0.01211689, 0.1727023, 0.4937018, 1, 0, 0, 1, 1,
0.01382519, -0.2161736, 0.5188488, 1, 0, 0, 1, 1,
0.01501518, 0.3383655, -0.7328852, 1, 0, 0, 1, 1,
0.02158234, -0.1760404, 3.365742, 1, 0, 0, 1, 1,
0.02596932, -0.5656143, 2.681335, 0, 0, 0, 1, 1,
0.02655432, -1.009231, 3.557258, 0, 0, 0, 1, 1,
0.02671964, -0.2715575, 4.257713, 0, 0, 0, 1, 1,
0.03024161, 0.6342942, -0.4342928, 0, 0, 0, 1, 1,
0.03148339, 0.7840061, 1.072885, 0, 0, 0, 1, 1,
0.03199818, 0.2175394, 0.8474469, 0, 0, 0, 1, 1,
0.03572484, 0.839824, 0.434436, 0, 0, 0, 1, 1,
0.0384917, -0.6049016, 3.254112, 1, 1, 1, 1, 1,
0.04004781, 1.055307, -0.1623811, 1, 1, 1, 1, 1,
0.04110859, 1.729517, 0.214356, 1, 1, 1, 1, 1,
0.04178893, -1.074244, 2.925687, 1, 1, 1, 1, 1,
0.05226565, 0.2769864, 1.300933, 1, 1, 1, 1, 1,
0.05294944, 1.706826, 0.2326695, 1, 1, 1, 1, 1,
0.0577548, 0.8686911, 1.120753, 1, 1, 1, 1, 1,
0.05780143, -0.4131673, 4.176482, 1, 1, 1, 1, 1,
0.05826481, 1.859302, -0.1177462, 1, 1, 1, 1, 1,
0.06097402, 0.01059079, 1.562137, 1, 1, 1, 1, 1,
0.06710215, 1.154048, -0.2622774, 1, 1, 1, 1, 1,
0.08056629, -1.253231, 3.699012, 1, 1, 1, 1, 1,
0.0875488, -0.3839145, 4.345385, 1, 1, 1, 1, 1,
0.08787342, -1.028687, 1.08977, 1, 1, 1, 1, 1,
0.08803487, -0.3926469, 1.765271, 1, 1, 1, 1, 1,
0.0895951, 1.072758, 0.5656286, 0, 0, 1, 1, 1,
0.09122574, -2.082769, 0.9754236, 1, 0, 0, 1, 1,
0.0920232, 1.423192, -1.175481, 1, 0, 0, 1, 1,
0.09850207, 0.1980207, 0.1429604, 1, 0, 0, 1, 1,
0.1021227, -0.05010126, 1.764033, 1, 0, 0, 1, 1,
0.1027578, -0.8782502, 2.689025, 1, 0, 0, 1, 1,
0.103235, 1.709592, 0.01399987, 0, 0, 0, 1, 1,
0.1054035, -2.132654, 3.972563, 0, 0, 0, 1, 1,
0.1079847, 0.6177202, -0.3514299, 0, 0, 0, 1, 1,
0.1095469, 0.009545447, 0.9172612, 0, 0, 0, 1, 1,
0.1097456, 0.2187531, 1.370877, 0, 0, 0, 1, 1,
0.1115074, 0.7932414, 1.61728, 0, 0, 0, 1, 1,
0.1124334, -0.1708713, 2.715583, 0, 0, 0, 1, 1,
0.1171951, -1.269114, 3.533201, 1, 1, 1, 1, 1,
0.1193763, 1.086533, -0.2625611, 1, 1, 1, 1, 1,
0.1209783, 1.331339, 0.4168184, 1, 1, 1, 1, 1,
0.1263407, -0.3058124, 3.501257, 1, 1, 1, 1, 1,
0.1266892, 0.3637789, 1.392179, 1, 1, 1, 1, 1,
0.1269398, 2.073039, -0.8818991, 1, 1, 1, 1, 1,
0.1272605, -1.625962, 4.567384, 1, 1, 1, 1, 1,
0.1279796, 0.2353059, 0.4185459, 1, 1, 1, 1, 1,
0.1287774, 0.1230648, 0.5058557, 1, 1, 1, 1, 1,
0.1362591, -0.4942758, 3.167541, 1, 1, 1, 1, 1,
0.1366841, -0.7338305, 2.130491, 1, 1, 1, 1, 1,
0.1375588, -0.2287581, 2.879919, 1, 1, 1, 1, 1,
0.1394942, 0.7473751, 0.2436876, 1, 1, 1, 1, 1,
0.143612, 0.05305368, 1.929334, 1, 1, 1, 1, 1,
0.1445044, 0.6023107, -0.5263323, 1, 1, 1, 1, 1,
0.146383, -1.305074, 4.080111, 0, 0, 1, 1, 1,
0.1487903, -1.039366, 1.197606, 1, 0, 0, 1, 1,
0.1516621, 0.1842171, -0.2997057, 1, 0, 0, 1, 1,
0.152149, -0.1453896, 3.554904, 1, 0, 0, 1, 1,
0.1524803, -1.634242, 4.165301, 1, 0, 0, 1, 1,
0.1526077, 0.4484389, 0.3627964, 1, 0, 0, 1, 1,
0.1532095, 0.1243537, 1.522199, 0, 0, 0, 1, 1,
0.1558897, -0.1684305, 2.764594, 0, 0, 0, 1, 1,
0.1591935, 1.441234, -0.06976683, 0, 0, 0, 1, 1,
0.1606889, 1.37498, 0.5645342, 0, 0, 0, 1, 1,
0.1618897, -1.663949, 4.085029, 0, 0, 0, 1, 1,
0.1637153, -0.7018812, 3.717084, 0, 0, 0, 1, 1,
0.166479, -0.1365777, 2.744635, 0, 0, 0, 1, 1,
0.1670405, -0.276035, 1.053363, 1, 1, 1, 1, 1,
0.1703652, -0.5149019, 3.504468, 1, 1, 1, 1, 1,
0.178003, -0.3959555, 2.371665, 1, 1, 1, 1, 1,
0.1790907, -0.7614348, 3.588193, 1, 1, 1, 1, 1,
0.1802367, -0.4814129, 3.990083, 1, 1, 1, 1, 1,
0.1816514, 0.1699675, 2.481825, 1, 1, 1, 1, 1,
0.1825785, -0.03004653, 2.49303, 1, 1, 1, 1, 1,
0.1833678, -0.6447707, 3.0895, 1, 1, 1, 1, 1,
0.1843358, 0.06712828, 2.372315, 1, 1, 1, 1, 1,
0.1850428, -0.2944419, 2.868266, 1, 1, 1, 1, 1,
0.1874569, 0.9525982, 1.875842, 1, 1, 1, 1, 1,
0.1983364, 0.1414228, 1.44504, 1, 1, 1, 1, 1,
0.1992172, -1.440878, 3.335189, 1, 1, 1, 1, 1,
0.1995808, 1.928282, 0.1482169, 1, 1, 1, 1, 1,
0.2001487, 1.618989, 1.380258, 1, 1, 1, 1, 1,
0.2013361, 0.1493024, 1.619246, 0, 0, 1, 1, 1,
0.2064651, 2.184237, 0.2438076, 1, 0, 0, 1, 1,
0.2087018, -0.9867004, 2.901697, 1, 0, 0, 1, 1,
0.2088426, 1.283322, -0.1388469, 1, 0, 0, 1, 1,
0.2107885, -1.030454, 2.246646, 1, 0, 0, 1, 1,
0.2125622, -0.6537945, 2.350325, 1, 0, 0, 1, 1,
0.2150255, 0.9218743, 0.7554874, 0, 0, 0, 1, 1,
0.2166016, -2.25462, 3.91758, 0, 0, 0, 1, 1,
0.2167063, -0.1642068, 3.698794, 0, 0, 0, 1, 1,
0.2186823, -1.10948, 3.423528, 0, 0, 0, 1, 1,
0.2192958, 0.5427702, -0.2753982, 0, 0, 0, 1, 1,
0.2262875, -0.3069586, 2.858015, 0, 0, 0, 1, 1,
0.2276337, -1.543659, 1.735338, 0, 0, 0, 1, 1,
0.2347239, -0.2197761, 2.724538, 1, 1, 1, 1, 1,
0.2359738, 0.7393706, 0.08050175, 1, 1, 1, 1, 1,
0.2434107, 0.9231629, 0.361952, 1, 1, 1, 1, 1,
0.2443824, 1.815424, -0.4614761, 1, 1, 1, 1, 1,
0.2467776, -2.373128, 4.06773, 1, 1, 1, 1, 1,
0.2487121, 1.598824, 1.722533, 1, 1, 1, 1, 1,
0.2488607, -0.2090696, 2.832903, 1, 1, 1, 1, 1,
0.2505907, -1.53025, 3.317264, 1, 1, 1, 1, 1,
0.2548198, -0.6715233, 4.21767, 1, 1, 1, 1, 1,
0.2596449, 0.3307003, 0.5940847, 1, 1, 1, 1, 1,
0.2607318, 0.6601277, 0.7165865, 1, 1, 1, 1, 1,
0.2607415, -0.9890792, 1.573463, 1, 1, 1, 1, 1,
0.2609207, -0.3229944, 1.949945, 1, 1, 1, 1, 1,
0.2678789, 3.0191, 0.9570034, 1, 1, 1, 1, 1,
0.2723147, -1.241368, 2.481024, 1, 1, 1, 1, 1,
0.2788311, -0.1066286, 2.650259, 0, 0, 1, 1, 1,
0.2852332, 0.1576643, 0.3292795, 1, 0, 0, 1, 1,
0.2870081, -0.1811526, 2.670695, 1, 0, 0, 1, 1,
0.2875535, 0.8123716, 1.547473, 1, 0, 0, 1, 1,
0.2947358, 1.541873, 0.9780358, 1, 0, 0, 1, 1,
0.2952917, 1.3126, -2.231138, 1, 0, 0, 1, 1,
0.2985244, -1.904476, 2.34164, 0, 0, 0, 1, 1,
0.3002565, 0.3421563, 1.498764, 0, 0, 0, 1, 1,
0.304183, -2.169149, 4.28516, 0, 0, 0, 1, 1,
0.3097512, 1.269785, -0.6635026, 0, 0, 0, 1, 1,
0.3099915, 0.6132973, -0.1815967, 0, 0, 0, 1, 1,
0.3110208, 0.8931265, 2.730257, 0, 0, 0, 1, 1,
0.3131915, -0.2671582, 3.759105, 0, 0, 0, 1, 1,
0.314015, 0.6310912, -1.48782, 1, 1, 1, 1, 1,
0.3146574, 0.2929469, -0.4674697, 1, 1, 1, 1, 1,
0.3183358, -0.163553, 1.305653, 1, 1, 1, 1, 1,
0.3186063, -0.3954211, 2.332512, 1, 1, 1, 1, 1,
0.3199719, -0.9572893, 1.318879, 1, 1, 1, 1, 1,
0.3272566, -0.4136087, 1.648897, 1, 1, 1, 1, 1,
0.3288831, -0.2594157, 3.118112, 1, 1, 1, 1, 1,
0.3333944, -2.980622, 2.008844, 1, 1, 1, 1, 1,
0.3386665, 0.06058364, 0.9622164, 1, 1, 1, 1, 1,
0.3403112, -0.4924277, 2.994551, 1, 1, 1, 1, 1,
0.3419205, -0.3072296, 1.954118, 1, 1, 1, 1, 1,
0.345772, 0.744282, 0.3640822, 1, 1, 1, 1, 1,
0.3473808, -1.111272, 3.66313, 1, 1, 1, 1, 1,
0.3509558, 0.06629728, 0.4887481, 1, 1, 1, 1, 1,
0.355383, -0.1294269, 1.231582, 1, 1, 1, 1, 1,
0.3582361, 0.5310692, -0.7086286, 0, 0, 1, 1, 1,
0.3596, -0.2804815, 2.846631, 1, 0, 0, 1, 1,
0.36107, 1.012987, 1.270141, 1, 0, 0, 1, 1,
0.3650405, 0.7097573, -1.047188, 1, 0, 0, 1, 1,
0.367164, 0.2900739, -1.897812, 1, 0, 0, 1, 1,
0.3718327, 1.313435, 2.008468, 1, 0, 0, 1, 1,
0.3754801, 1.404574, -0.366266, 0, 0, 0, 1, 1,
0.3861661, -1.042354, 2.062129, 0, 0, 0, 1, 1,
0.3864528, -0.3315603, 0.3524062, 0, 0, 0, 1, 1,
0.3901275, 1.417485, 1.380514, 0, 0, 0, 1, 1,
0.3945408, 0.6427767, 0.1340406, 0, 0, 0, 1, 1,
0.3970955, -0.373008, 3.941412, 0, 0, 0, 1, 1,
0.3984096, 1.084881, 0.2062662, 0, 0, 0, 1, 1,
0.4014542, 0.6415477, -1.851612, 1, 1, 1, 1, 1,
0.403791, 0.195282, 0.4771082, 1, 1, 1, 1, 1,
0.4038, 1.240061, -0.1563169, 1, 1, 1, 1, 1,
0.4040206, 0.4565415, -0.8413458, 1, 1, 1, 1, 1,
0.4091749, -0.06720378, 2.208215, 1, 1, 1, 1, 1,
0.4100846, -0.2374926, 1.92233, 1, 1, 1, 1, 1,
0.4120439, 1.720053, 0.550615, 1, 1, 1, 1, 1,
0.4164185, -0.5434269, 3.809445, 1, 1, 1, 1, 1,
0.416714, -0.5494498, 2.886138, 1, 1, 1, 1, 1,
0.42598, -0.5457194, 3.03163, 1, 1, 1, 1, 1,
0.4269562, 1.171215, -0.8770341, 1, 1, 1, 1, 1,
0.4296242, 0.6610384, 0.8040282, 1, 1, 1, 1, 1,
0.4304765, -0.2410972, 0.879193, 1, 1, 1, 1, 1,
0.43161, 0.6852729, 0.6168277, 1, 1, 1, 1, 1,
0.4353767, -0.5472561, 1.718979, 1, 1, 1, 1, 1,
0.4372114, 0.6420813, 1.171199, 0, 0, 1, 1, 1,
0.4395926, -1.25328, 1.836299, 1, 0, 0, 1, 1,
0.4451573, 0.7154509, 0.8032823, 1, 0, 0, 1, 1,
0.4453697, 0.6131055, 1.225596, 1, 0, 0, 1, 1,
0.4491256, -0.8354867, 2.956088, 1, 0, 0, 1, 1,
0.4508212, -0.7017491, 1.487051, 1, 0, 0, 1, 1,
0.4508944, -1.046443, 2.064605, 0, 0, 0, 1, 1,
0.4522057, 0.19192, 1.989527, 0, 0, 0, 1, 1,
0.4523879, 0.792317, -0.4631733, 0, 0, 0, 1, 1,
0.4559408, 2.316675, 0.4238114, 0, 0, 0, 1, 1,
0.4563146, 0.5826449, 0.2792047, 0, 0, 0, 1, 1,
0.4609364, 0.4873049, 1.521921, 0, 0, 0, 1, 1,
0.46163, -1.233978, 3.177572, 0, 0, 0, 1, 1,
0.4633696, -0.2464719, 1.002675, 1, 1, 1, 1, 1,
0.4690205, 1.239159, 2.026303, 1, 1, 1, 1, 1,
0.4694898, 0.3833592, 0.8685283, 1, 1, 1, 1, 1,
0.4695255, 0.9537682, 1.52668, 1, 1, 1, 1, 1,
0.4708738, 0.2423284, 0.8231809, 1, 1, 1, 1, 1,
0.4747393, -0.9095093, 1.955543, 1, 1, 1, 1, 1,
0.4756722, 1.765857, 1.439192, 1, 1, 1, 1, 1,
0.4788599, 0.9062581, 1.65258, 1, 1, 1, 1, 1,
0.4808592, 0.428183, 0.7304382, 1, 1, 1, 1, 1,
0.4820626, -1.429926, 2.580866, 1, 1, 1, 1, 1,
0.5039394, -1.321583, 4.301685, 1, 1, 1, 1, 1,
0.5041367, -1.297094, 3.048223, 1, 1, 1, 1, 1,
0.5088363, 1.351522, -0.5522665, 1, 1, 1, 1, 1,
0.5094647, -0.7434676, 3.117753, 1, 1, 1, 1, 1,
0.5096506, -0.08316383, 2.257752, 1, 1, 1, 1, 1,
0.5110889, -0.529745, 1.413025, 0, 0, 1, 1, 1,
0.5139881, 2.242584, -2.077404, 1, 0, 0, 1, 1,
0.5158427, -1.156674, 2.038419, 1, 0, 0, 1, 1,
0.5184308, -0.4766717, 2.769752, 1, 0, 0, 1, 1,
0.5223256, 0.9249516, 1.7496, 1, 0, 0, 1, 1,
0.5237265, -0.242769, 1.5409, 1, 0, 0, 1, 1,
0.5277131, 0.3017995, 1.400199, 0, 0, 0, 1, 1,
0.52851, -0.1372951, 1.754464, 0, 0, 0, 1, 1,
0.5295543, -0.867699, 1.305106, 0, 0, 0, 1, 1,
0.5306984, -1.133582, 1.17755, 0, 0, 0, 1, 1,
0.5313294, 1.153018, 0.8424616, 0, 0, 0, 1, 1,
0.5323201, 1.106534, -0.9177843, 0, 0, 0, 1, 1,
0.5359053, 0.4000631, 0.9557002, 0, 0, 0, 1, 1,
0.5368498, -0.362725, 2.619904, 1, 1, 1, 1, 1,
0.5371835, -2.599992, 0.286237, 1, 1, 1, 1, 1,
0.5378596, -0.1294231, 2.67375, 1, 1, 1, 1, 1,
0.5386282, 0.8559565, -0.3089677, 1, 1, 1, 1, 1,
0.5399498, -0.5916559, 2.133198, 1, 1, 1, 1, 1,
0.5404553, 0.3195064, 0.796756, 1, 1, 1, 1, 1,
0.5421405, 0.7187978, 2.131958, 1, 1, 1, 1, 1,
0.5451704, 2.46506, 0.5004196, 1, 1, 1, 1, 1,
0.5452934, 1.389051, -0.1845024, 1, 1, 1, 1, 1,
0.5485304, 1.05123, 1.584031, 1, 1, 1, 1, 1,
0.5491507, -0.360728, 2.062833, 1, 1, 1, 1, 1,
0.5516942, 0.1235167, 2.119354, 1, 1, 1, 1, 1,
0.5528476, -0.1082773, 0.7845493, 1, 1, 1, 1, 1,
0.5565645, 0.281017, 1.033216, 1, 1, 1, 1, 1,
0.5582519, 1.540813, 0.7106835, 1, 1, 1, 1, 1,
0.5590364, 0.9024277, 1.002611, 0, 0, 1, 1, 1,
0.5594803, 0.3783644, 0.6428469, 1, 0, 0, 1, 1,
0.5600156, -0.5436054, 2.08687, 1, 0, 0, 1, 1,
0.5643319, -2.078755, 1.184616, 1, 0, 0, 1, 1,
0.5652817, 0.1796957, -0.2556993, 1, 0, 0, 1, 1,
0.5760408, 0.7196007, -1.741834, 1, 0, 0, 1, 1,
0.5780968, -0.2201499, 2.138363, 0, 0, 0, 1, 1,
0.5794621, -0.01485838, 2.196584, 0, 0, 0, 1, 1,
0.5818668, 0.7777258, 0.9430799, 0, 0, 0, 1, 1,
0.5837529, 0.9789492, 0.1036449, 0, 0, 0, 1, 1,
0.5868726, -1.481691, 3.930814, 0, 0, 0, 1, 1,
0.5872479, 1.373532, 0.5069021, 0, 0, 0, 1, 1,
0.589784, -1.687617, 4.22894, 0, 0, 0, 1, 1,
0.591701, -0.7967653, 3.638659, 1, 1, 1, 1, 1,
0.5935708, -0.8110012, 1.433171, 1, 1, 1, 1, 1,
0.5971695, 2.108196, 2.079525, 1, 1, 1, 1, 1,
0.6060109, 0.1881023, 1.524354, 1, 1, 1, 1, 1,
0.6069648, 0.2612447, 1.295886, 1, 1, 1, 1, 1,
0.6080136, 0.3075789, 0.7479742, 1, 1, 1, 1, 1,
0.608464, -0.5391496, 3.474566, 1, 1, 1, 1, 1,
0.6122622, 0.2770643, 2.382737, 1, 1, 1, 1, 1,
0.6124745, 1.885409, -0.005078028, 1, 1, 1, 1, 1,
0.6144145, -0.3267576, 1.622007, 1, 1, 1, 1, 1,
0.6186358, 0.3477735, 0.5638824, 1, 1, 1, 1, 1,
0.6209322, 0.1596263, 3.216793, 1, 1, 1, 1, 1,
0.6240654, -1.630334, 2.751842, 1, 1, 1, 1, 1,
0.6243611, -1.356327, 2.946248, 1, 1, 1, 1, 1,
0.6345215, -1.35634, 4.154071, 1, 1, 1, 1, 1,
0.636591, 1.274497, 2.188887, 0, 0, 1, 1, 1,
0.642718, -0.01892735, 1.480561, 1, 0, 0, 1, 1,
0.6440447, 1.130041, 2.167322, 1, 0, 0, 1, 1,
0.6465162, -0.9934087, 2.399097, 1, 0, 0, 1, 1,
0.6498885, 1.394987, 1.071836, 1, 0, 0, 1, 1,
0.6515602, -0.3260945, 1.068003, 1, 0, 0, 1, 1,
0.6560224, 0.6822422, 3.157324, 0, 0, 0, 1, 1,
0.6561549, -1.013081, 1.712414, 0, 0, 0, 1, 1,
0.6616775, 0.3560857, 0.7079363, 0, 0, 0, 1, 1,
0.6658976, 0.6533033, 1.498141, 0, 0, 0, 1, 1,
0.6757014, 1.587109, -0.3188713, 0, 0, 0, 1, 1,
0.6792548, 0.5267532, 1.732859, 0, 0, 0, 1, 1,
0.6840946, -0.09593508, 1.724078, 0, 0, 0, 1, 1,
0.6850615, 0.3022412, 1.662165, 1, 1, 1, 1, 1,
0.6902332, 0.3537373, 1.783623, 1, 1, 1, 1, 1,
0.6940691, 1.220921, 0.7437199, 1, 1, 1, 1, 1,
0.6976628, 0.4775219, 0.3347073, 1, 1, 1, 1, 1,
0.6995528, 1.467485, 0.1199006, 1, 1, 1, 1, 1,
0.7018522, -2.656913, 2.862183, 1, 1, 1, 1, 1,
0.7041079, 1.014934, 1.125719, 1, 1, 1, 1, 1,
0.7050589, -0.9764606, 2.977639, 1, 1, 1, 1, 1,
0.7069219, 0.7494437, 0.9369439, 1, 1, 1, 1, 1,
0.7197539, -1.105321, 1.412672, 1, 1, 1, 1, 1,
0.7243101, -0.5127937, 0.1356621, 1, 1, 1, 1, 1,
0.7246419, 0.8012271, 3.185443, 1, 1, 1, 1, 1,
0.7284347, 0.2971913, 2.08216, 1, 1, 1, 1, 1,
0.7355635, 0.3947202, 1.322016, 1, 1, 1, 1, 1,
0.7363571, 0.4274739, 1.078608, 1, 1, 1, 1, 1,
0.7365556, -1.383212, 3.568182, 0, 0, 1, 1, 1,
0.7367029, -0.6898822, 4.198982, 1, 0, 0, 1, 1,
0.742402, 1.417904, 0.6801721, 1, 0, 0, 1, 1,
0.7432064, -0.2093276, 3.481318, 1, 0, 0, 1, 1,
0.7448789, -0.813769, 0.9720333, 1, 0, 0, 1, 1,
0.7564149, 2.323393, 2.708106, 1, 0, 0, 1, 1,
0.7580236, 0.1883996, 2.925679, 0, 0, 0, 1, 1,
0.7582968, 0.6918386, 0.3668061, 0, 0, 0, 1, 1,
0.7587312, -0.7505571, 1.994747, 0, 0, 0, 1, 1,
0.7634389, -0.3500154, 2.951107, 0, 0, 0, 1, 1,
0.764221, -0.9986312, 3.04841, 0, 0, 0, 1, 1,
0.7662541, -1.58639, 2.020656, 0, 0, 0, 1, 1,
0.7668124, 1.475622, 2.446378, 0, 0, 0, 1, 1,
0.7687045, 0.1511919, 3.198595, 1, 1, 1, 1, 1,
0.7692572, 0.288438, 1.476607, 1, 1, 1, 1, 1,
0.7703289, -0.276952, 1.162929, 1, 1, 1, 1, 1,
0.7709994, -0.0543314, 2.464766, 1, 1, 1, 1, 1,
0.7712613, 0.01864546, 1.106991, 1, 1, 1, 1, 1,
0.7722654, -0.3509142, 2.43477, 1, 1, 1, 1, 1,
0.7741615, -0.204679, 0.5929695, 1, 1, 1, 1, 1,
0.7795129, -0.9186165, 2.049967, 1, 1, 1, 1, 1,
0.7831267, -1.671457, 2.806745, 1, 1, 1, 1, 1,
0.7836016, 1.073261, 0.08147839, 1, 1, 1, 1, 1,
0.78597, 0.6130499, 0.9861758, 1, 1, 1, 1, 1,
0.7887183, -1.20786, 2.142625, 1, 1, 1, 1, 1,
0.7926807, 2.030792, 1.596019, 1, 1, 1, 1, 1,
0.7931406, -0.4579546, 1.580677, 1, 1, 1, 1, 1,
0.7954194, 0.5739165, 1.238315, 1, 1, 1, 1, 1,
0.7958482, -0.7375407, 4.351246, 0, 0, 1, 1, 1,
0.7963558, -0.4521323, 2.452965, 1, 0, 0, 1, 1,
0.7978751, 1.478191, 0.7778999, 1, 0, 0, 1, 1,
0.7987037, 2.174359, -0.1293016, 1, 0, 0, 1, 1,
0.7993273, 0.05682996, 0.8938496, 1, 0, 0, 1, 1,
0.8006844, -1.378729, 2.129432, 1, 0, 0, 1, 1,
0.8028573, -0.7554195, 3.258429, 0, 0, 0, 1, 1,
0.8070949, 0.1957734, 1.923772, 0, 0, 0, 1, 1,
0.8193623, 0.197382, 0.841467, 0, 0, 0, 1, 1,
0.8243225, -0.7914796, 1.476198, 0, 0, 0, 1, 1,
0.8255398, 0.6907842, 1.405034, 0, 0, 0, 1, 1,
0.8274911, -1.703793, 3.160499, 0, 0, 0, 1, 1,
0.8282446, 0.1703917, 0.9079333, 0, 0, 0, 1, 1,
0.8346292, 0.2878733, 1.315746, 1, 1, 1, 1, 1,
0.8362933, 0.3940868, 0.9585335, 1, 1, 1, 1, 1,
0.837683, 0.6046858, 0.5793414, 1, 1, 1, 1, 1,
0.8394268, -0.5500629, 1.619818, 1, 1, 1, 1, 1,
0.8396162, -0.08058599, 1.967199, 1, 1, 1, 1, 1,
0.8518929, -0.7553818, 1.935703, 1, 1, 1, 1, 1,
0.8536168, -0.5188669, 1.337596, 1, 1, 1, 1, 1,
0.8539535, 0.2116281, 1.078892, 1, 1, 1, 1, 1,
0.855821, 0.7537712, 0.1596678, 1, 1, 1, 1, 1,
0.8571194, 1.37204, 0.4971649, 1, 1, 1, 1, 1,
0.8599592, -2.267941, 1.724124, 1, 1, 1, 1, 1,
0.8710396, -1.690542, 1.086971, 1, 1, 1, 1, 1,
0.8754145, -0.9045513, 1.237333, 1, 1, 1, 1, 1,
0.8777308, 0.06933907, 0.9971073, 1, 1, 1, 1, 1,
0.8823785, 0.2945212, 2.917336, 1, 1, 1, 1, 1,
0.8917138, 0.8737252, -0.2105853, 0, 0, 1, 1, 1,
0.8942453, 0.08873747, 2.39579, 1, 0, 0, 1, 1,
0.8985344, -0.1767596, 1.180493, 1, 0, 0, 1, 1,
0.8986784, 1.34139, 0.2436543, 1, 0, 0, 1, 1,
0.9037192, -1.03664, 2.142973, 1, 0, 0, 1, 1,
0.9158535, -0.9428952, 2.963937, 1, 0, 0, 1, 1,
0.9183177, -0.08213866, 2.439084, 0, 0, 0, 1, 1,
0.9207146, -0.8031614, 3.103786, 0, 0, 0, 1, 1,
0.9232879, 1.074303, 2.505018, 0, 0, 0, 1, 1,
0.9301676, -1.240226, 3.252698, 0, 0, 0, 1, 1,
0.9316507, 0.8197186, -0.09394484, 0, 0, 0, 1, 1,
0.9556634, -0.7455428, 1.026333, 0, 0, 0, 1, 1,
0.9578902, 2.865503, -0.791895, 0, 0, 0, 1, 1,
0.963687, -0.7844843, 1.351332, 1, 1, 1, 1, 1,
0.9638754, 0.8037534, 0.3657964, 1, 1, 1, 1, 1,
0.9714696, 1.253755, 1.184754, 1, 1, 1, 1, 1,
0.9734457, 0.4325842, 2.437581, 1, 1, 1, 1, 1,
0.9743032, -0.933612, 2.078799, 1, 1, 1, 1, 1,
0.9760729, 1.90734, -0.6961695, 1, 1, 1, 1, 1,
0.9775853, -0.02827211, 1.18784, 1, 1, 1, 1, 1,
0.9949191, 0.4934813, 0.1869267, 1, 1, 1, 1, 1,
1.010113, -0.8427438, 2.531533, 1, 1, 1, 1, 1,
1.011248, -0.2600777, 3.81521, 1, 1, 1, 1, 1,
1.013218, 0.6786234, 3.38363, 1, 1, 1, 1, 1,
1.014723, 0.2528265, 0.907319, 1, 1, 1, 1, 1,
1.024505, 0.2414943, 2.293061, 1, 1, 1, 1, 1,
1.02557, 0.7472966, 1.234232, 1, 1, 1, 1, 1,
1.029498, 0.9637425, 1.852152, 1, 1, 1, 1, 1,
1.036856, -0.3486177, 0.9340476, 0, 0, 1, 1, 1,
1.047327, 1.317783, -0.345681, 1, 0, 0, 1, 1,
1.047732, -0.2513148, 1.336512, 1, 0, 0, 1, 1,
1.066673, 1.472622, 1.29252, 1, 0, 0, 1, 1,
1.069682, -0.5638828, 1.896899, 1, 0, 0, 1, 1,
1.071755, -0.2876261, 3.020344, 1, 0, 0, 1, 1,
1.076565, 0.7233183, 0.519959, 0, 0, 0, 1, 1,
1.086002, 0.6768831, -0.343241, 0, 0, 0, 1, 1,
1.093643, -0.0685669, 1.738848, 0, 0, 0, 1, 1,
1.100282, 2.198901, -0.2039579, 0, 0, 0, 1, 1,
1.100602, -0.2250664, 0.2328505, 0, 0, 0, 1, 1,
1.101097, -0.4952308, 2.711837, 0, 0, 0, 1, 1,
1.102923, 0.9606022, 0.8206911, 0, 0, 0, 1, 1,
1.117777, -0.8164889, 3.90254, 1, 1, 1, 1, 1,
1.118171, 0.04476874, 2.066481, 1, 1, 1, 1, 1,
1.121816, -0.2633301, 2.670614, 1, 1, 1, 1, 1,
1.122169, -1.090346, 2.376114, 1, 1, 1, 1, 1,
1.126417, -1.600129, 3.60219, 1, 1, 1, 1, 1,
1.138482, 1.034195, -0.8137998, 1, 1, 1, 1, 1,
1.146888, 0.6978149, 1.050069, 1, 1, 1, 1, 1,
1.151059, 0.9080386, 1.162381, 1, 1, 1, 1, 1,
1.154418, -1.423888, 3.61474, 1, 1, 1, 1, 1,
1.158768, 2.27634, 0.006582271, 1, 1, 1, 1, 1,
1.164366, 0.08982669, 1.043974, 1, 1, 1, 1, 1,
1.165729, 1.095304, 1.472533, 1, 1, 1, 1, 1,
1.168716, 0.376878, 1.823827, 1, 1, 1, 1, 1,
1.174142, 0.4100639, 0.8548446, 1, 1, 1, 1, 1,
1.17802, 1.297774, 0.4730517, 1, 1, 1, 1, 1,
1.178651, 1.487045, 1.291848, 0, 0, 1, 1, 1,
1.184182, -0.564257, 1.302193, 1, 0, 0, 1, 1,
1.184549, -2.230369, 0.9175097, 1, 0, 0, 1, 1,
1.186895, 0.4761318, 1.578796, 1, 0, 0, 1, 1,
1.191869, 1.009124, 1.998138, 1, 0, 0, 1, 1,
1.191909, 0.5212011, 2.958517, 1, 0, 0, 1, 1,
1.200399, -0.4703063, 1.178681, 0, 0, 0, 1, 1,
1.207656, 0.5495103, 1.30285, 0, 0, 0, 1, 1,
1.221886, -0.2331294, 1.115587, 0, 0, 0, 1, 1,
1.22342, -0.09305911, 0.7614479, 0, 0, 0, 1, 1,
1.224265, -1.287538, 2.105585, 0, 0, 0, 1, 1,
1.227092, -0.2238537, 2.207675, 0, 0, 0, 1, 1,
1.229781, 0.4468099, 1.663217, 0, 0, 0, 1, 1,
1.230329, -1.119139, 4.027395, 1, 1, 1, 1, 1,
1.236046, -1.244419, 2.414797, 1, 1, 1, 1, 1,
1.247512, -0.3603819, 1.197541, 1, 1, 1, 1, 1,
1.254668, -0.4933487, 0.2126413, 1, 1, 1, 1, 1,
1.256561, -0.3861524, 1.498914, 1, 1, 1, 1, 1,
1.25829, 1.042151, 2.037916, 1, 1, 1, 1, 1,
1.258691, -1.11466, 2.003984, 1, 1, 1, 1, 1,
1.2598, 0.1168144, 0.6658974, 1, 1, 1, 1, 1,
1.279027, 0.4596611, 0.5863904, 1, 1, 1, 1, 1,
1.302792, -0.147745, 2.533968, 1, 1, 1, 1, 1,
1.307696, 0.1032711, 1.157861, 1, 1, 1, 1, 1,
1.309744, -0.5854704, 2.331219, 1, 1, 1, 1, 1,
1.310627, 0.2033103, 1.48301, 1, 1, 1, 1, 1,
1.316702, 1.034612, 0.1707269, 1, 1, 1, 1, 1,
1.3184, -0.7574221, 2.567171, 1, 1, 1, 1, 1,
1.323286, -1.674005, 1.239376, 0, 0, 1, 1, 1,
1.32571, -0.4744167, -0.2318692, 1, 0, 0, 1, 1,
1.332756, 1.27032, 1.209738, 1, 0, 0, 1, 1,
1.351074, 0.01810021, -0.8820938, 1, 0, 0, 1, 1,
1.368589, 0.6312521, 1.3739, 1, 0, 0, 1, 1,
1.370939, 0.7495853, 2.833849, 1, 0, 0, 1, 1,
1.374445, 0.4398793, 4.248861, 0, 0, 0, 1, 1,
1.379065, 0.1747965, -1.039002, 0, 0, 0, 1, 1,
1.379315, 1.253322, 1.855367, 0, 0, 0, 1, 1,
1.384195, -0.4373721, 1.114481, 0, 0, 0, 1, 1,
1.384374, -0.1595276, 2.342842, 0, 0, 0, 1, 1,
1.391158, 0.8297481, 1.488905, 0, 0, 0, 1, 1,
1.396768, -0.1974024, 3.724606, 0, 0, 0, 1, 1,
1.409755, -0.4508287, 1.833582, 1, 1, 1, 1, 1,
1.415792, 0.2736033, 1.373074, 1, 1, 1, 1, 1,
1.421566, 1.553041, 0.6300139, 1, 1, 1, 1, 1,
1.431307, -0.4776982, 3.198878, 1, 1, 1, 1, 1,
1.444263, 0.428626, 1.0647, 1, 1, 1, 1, 1,
1.45814, -0.4645575, 0.8070734, 1, 1, 1, 1, 1,
1.47572, 0.127479, 1.957486, 1, 1, 1, 1, 1,
1.48517, 0.428304, 0.7498159, 1, 1, 1, 1, 1,
1.486877, -0.4431189, 2.233039, 1, 1, 1, 1, 1,
1.489656, -1.774227, 2.405438, 1, 1, 1, 1, 1,
1.500313, 0.1023443, 1.879838, 1, 1, 1, 1, 1,
1.500905, -0.4046023, -0.4053306, 1, 1, 1, 1, 1,
1.503706, -0.06486993, 2.381723, 1, 1, 1, 1, 1,
1.520997, 0.8961175, 0.8633076, 1, 1, 1, 1, 1,
1.531774, -1.20952, 1.93698, 1, 1, 1, 1, 1,
1.532045, 1.44037, 0.8190116, 0, 0, 1, 1, 1,
1.543031, 1.250906, -0.626762, 1, 0, 0, 1, 1,
1.54835, 1.561413, 0.8248217, 1, 0, 0, 1, 1,
1.565514, -1.018877, 0.5693207, 1, 0, 0, 1, 1,
1.579954, -0.08351853, 1.103247, 1, 0, 0, 1, 1,
1.602551, -0.009399862, 0.2195042, 1, 0, 0, 1, 1,
1.622205, -0.8868627, -0.04422695, 0, 0, 0, 1, 1,
1.630315, 0.6525199, 1.175607, 0, 0, 0, 1, 1,
1.637435, 0.7931612, -0.3341306, 0, 0, 0, 1, 1,
1.647702, -0.6786572, 3.46133, 0, 0, 0, 1, 1,
1.655821, 0.732103, 0.583967, 0, 0, 0, 1, 1,
1.65747, -0.4905831, 2.52876, 0, 0, 0, 1, 1,
1.664021, 1.083267, 1.950811, 0, 0, 0, 1, 1,
1.69534, 0.1726666, 2.147789, 1, 1, 1, 1, 1,
1.698878, -0.06423707, -0.4977785, 1, 1, 1, 1, 1,
1.712557, -0.6092219, 1.184843, 1, 1, 1, 1, 1,
1.715527, -0.442641, 0.06214055, 1, 1, 1, 1, 1,
1.728955, -0.02993316, 1.852329, 1, 1, 1, 1, 1,
1.7496, 0.1828289, 0.5069337, 1, 1, 1, 1, 1,
1.761315, -0.6374621, 1.130476, 1, 1, 1, 1, 1,
1.761806, 1.292962, 0.8321345, 1, 1, 1, 1, 1,
1.785357, 0.3948016, 3.000371, 1, 1, 1, 1, 1,
1.794357, -0.02109606, 1.281553, 1, 1, 1, 1, 1,
1.841521, -0.9402698, 1.838109, 1, 1, 1, 1, 1,
1.847641, -0.5510424, 3.242597, 1, 1, 1, 1, 1,
1.880583, -0.09432218, 2.417521, 1, 1, 1, 1, 1,
1.885532, -1.797388, 1.517251, 1, 1, 1, 1, 1,
1.88923, 0.1639719, 0.6506236, 1, 1, 1, 1, 1,
1.900314, -0.6637115, 2.545572, 0, 0, 1, 1, 1,
1.968396, -0.585413, 2.398747, 1, 0, 0, 1, 1,
1.983273, 0.3481457, 0.8592386, 1, 0, 0, 1, 1,
2.005551, 1.155957, 0.5490896, 1, 0, 0, 1, 1,
2.023135, 0.8158341, 1.183526, 1, 0, 0, 1, 1,
2.118823, -2.150676, 0.8993968, 1, 0, 0, 1, 1,
2.12339, 0.6681173, 0.6138155, 0, 0, 0, 1, 1,
2.205305, -0.554446, 3.075364, 0, 0, 0, 1, 1,
2.212636, -0.1046021, 1.95978, 0, 0, 0, 1, 1,
2.256534, -1.283167, 2.181001, 0, 0, 0, 1, 1,
2.28461, -0.5787248, 1.964316, 0, 0, 0, 1, 1,
2.295594, 0.3267996, 1.8764, 0, 0, 0, 1, 1,
2.312125, 0.3581273, 1.280604, 0, 0, 0, 1, 1,
2.524498, 0.6271574, 1.990673, 1, 1, 1, 1, 1,
2.559858, -1.011832, 2.050667, 1, 1, 1, 1, 1,
2.617327, 0.07248906, 0.7424312, 1, 1, 1, 1, 1,
2.650484, -0.5010762, 0.5902448, 1, 1, 1, 1, 1,
2.684442, 0.1396978, 0.7136264, 1, 1, 1, 1, 1,
2.755156, -0.7814575, 1.980872, 1, 1, 1, 1, 1,
2.824363, 0.8568143, -0.4866977, 1, 1, 1, 1, 1
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
var radius = 9.280424;
var distance = 32.5971;
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
mvMatrix.translate( 0.202776, -0.006457806, 0.6663623 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.5971);
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
